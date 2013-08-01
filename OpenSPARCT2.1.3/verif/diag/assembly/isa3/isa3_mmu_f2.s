/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_mmu_f2.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../spc_basic_isa3.pl FOCUS_SEED=152419083"
.ident "BY gg137162 ON Mon Sep  8 15:48:27 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_mmu_f2.s,v 1.3 2007/07/05 22:01:12 drp Exp $"
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
	set	0x0,	%g1
	set	0x1,	%g2
	set	0x1,	%g3
	set	0x2,	%g4
	set	0x4,	%g5
	set	0x5,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x8,	%i1
	set	-0x8,	%i2
	set	-0xC,	%i3
	set	-0x5,	%i4
	set	-0xE,	%i5
	set	-0xA,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x1AA09C3B,	%l0
	set	0x32A2DB92,	%l1
	set	0x64A79D4F,	%l2
	set	0x6D440C83,	%l3
	set	0x5A2EEABF,	%l4
	set	0x20717CAB,	%l5
	set	0x799F8455,	%l6
	!# Output registers
	set	-0x036A,	%o0
	set	0x078A,	%o1
	set	-0x0D60,	%o2
	set	-0x0D9C,	%o3
	set	-0x0315,	%o4
	set	-0x003F,	%o5
	set	-0x15F2,	%o6
	set	0x1AE9,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x882A66A256AE64AC)
	INIT_TH_FP_REG(%l7,%f2,0x7F7573839BDD8462)
	INIT_TH_FP_REG(%l7,%f4,0xA1F8242D7FDE8CFF)
	INIT_TH_FP_REG(%l7,%f6,0x21D2CA7AB1BBACC6)
	INIT_TH_FP_REG(%l7,%f8,0xA4BC648D33EDA771)
	INIT_TH_FP_REG(%l7,%f10,0x616C5E729DDBC015)
	INIT_TH_FP_REG(%l7,%f12,0xE34F1AAC0909DA52)
	INIT_TH_FP_REG(%l7,%f14,0x5AFA13630A7EB162)
	INIT_TH_FP_REG(%l7,%f16,0x272B62943EB715EE)
	INIT_TH_FP_REG(%l7,%f18,0x4AE5B46B80788083)
	INIT_TH_FP_REG(%l7,%f20,0xCAB274C13AA49271)
	INIT_TH_FP_REG(%l7,%f22,0x64F2E1E04B029560)
	INIT_TH_FP_REG(%l7,%f24,0x7976B18F321FE152)
	INIT_TH_FP_REG(%l7,%f26,0x278F1E2A91C390B8)
	INIT_TH_FP_REG(%l7,%f28,0x4355BB7D6D34B522)
	INIT_TH_FP_REG(%l7,%f30,0x33C3183043A01A63)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	stw	%l2,	[%l7 + 0x74]
	prefetch	[%l7 + 0x18],	 0x3
	ldsw	[%l7 + 0x0C],	%i7
	stb	%o0,	[%l7 + 0x3B]
	flush	%l7 + 0x30
	ldsb	[%l7 + 0x68],	%i3
	stx	%g7,	[%l7 + 0x70]
	movpos	%xcc,	%l4,	%i4
	nop
	set	0x30, %o0
	stx	%g3,	[%l7 + %o0]
	set	0x20, %g3
	stxa	%g4,	[%l7 + %g3] 0x0c
	ldd	[%l7 + 0x30],	%i2
	stw	%o3,	[%l7 + 0x7C]
	ldstub	[%l7 + 0x7E],	%o1
	std	%o2,	[%l7 + 0x40]
	sra	%o4,	0x1C,	%i5
	prefetch	[%l7 + 0x4C],	 0x3
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x14,	%g2
	lduw	[%l7 + 0x38],	%l6
	mulscc	%l1,	0x1CBF,	%l0
	ldd	[%l7 + 0x28],	%f12
	ldd	[%l7 + 0x10],	%f20
	ldsh	[%l7 + 0x16],	%g1
	stbar
	ldub	[%l7 + 0x30],	%i1
	lduw	[%l7 + 0x68],	%g5
	std	%f0,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x350
	set	0x350, %o2
	nop 	! 	nop 	! 	ldxa	[%g0 + %o2] 0x40,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	std	%f10,	[%l7 + 0x50]
	ldub	[%l7 + 0x34],	%o6
	prefetch	[%l7 + 0x58],	 0x0
	swap	[%l7 + 0x7C],	%o7
	lduh	[%l7 + 0x58],	%i6
	sethi	0x092E,	%o5
	tneg	%xcc,	0x1
	ldstub	[%l7 + 0x52],	%l5
	set	0x08, %o5
	ldxa	[%l7 + %o5] 0x0c,	%g6
	rdpr	%cleanwin,	%l2
	fmovdcs	%icc,	%f8,	%f12
	lduh	[%l7 + 0x72],	%i7
	sth	%l3,	[%l7 + 0x3E]
	ldub	[%l7 + 0x21],	%i3
	swap	[%l7 + 0x44],	%o0
	ld	[%l7 + 0x28],	%f17
	std	%f22,	[%l7 + 0x18]
	stw	%l4,	[%l7 + 0x78]
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o4
	stxa	%g7,	[%g0 + %o4] 0x4f
	ldstub	[%l7 + 0x16],	%g3
	stbar
	fba,a	%fcc3,	loop_1
	sth	%g4,	[%l7 + 0x26]
	ldstub	[%l7 + 0x2F],	%i2
	lduh	[%l7 + 0x76],	%o3
loop_1:
	stx	%i4,	[%l7 + 0x60]
	orncc	%o1,	0x18C3,	%o2
	ld	[%l7 + 0x28],	%f15
	wr	%g0,	0x1c,	%asi
	stxa	%o4,	[%l7 + 0x18] %asi
	stw	%i5,	[%l7 + 0x54]
	lduw	[%l7 + 0x5C],	%g2
	stw	%l6,	[%l7 + 0x74]
	stx	%l0,	[%l7 + 0x20]
	stb	%g1,	[%l7 + 0x16]
	ldd	[%l7 + 0x70],	%i0
	stb	%g5,	[%l7 + 0x5F]
	taddcc	%i0,	0x1165,	%o6
	ldx	[%l7 + 0x18],	%l1
	nop
	set	0x68, %o3
	std	%o6,	[%l7 + %o3]
	fexpand	%f23,	%f14
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g5
	ldxa	[%g0 + %g5] 0x20,	%o5
	brz,a	%i6,	loop_2
	fcmpgt32	%f10,	%f4,	%l5
	udiv	%l2,	0x08CD,	%g6
	ldd	[%l7 + 0x10],	%i6
loop_2:
	fmovde	%icc,	%f14,	%f31
	tsubcc	%l3,	%o0,	%i3
	ldd	[%l7 + 0x10],	%g6
	andncc	%g3,	%g4,	%i2
	ldd	[%l7 + 0x70],	%f8
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x19,	%l4
	ldx	[%l7 + 0x60],	%i4
	std	%o2,	[%l7 + 0x30]
	st	%f17,	[%l7 + 0x0C]
	flush	%l7 + 0x64
	stb	%o2,	[%l7 + 0x0E]
	nop
	set	0x4D, %o1
	ldstub	[%l7 + %o1],	%o1
	ldstub	[%l7 + 0x08],	%o4
	lduh	[%l7 + 0x38],	%g2
	stw	%i5,	[%l7 + 0x4C]
	lduw	[%l7 + 0x78],	%l0
	st	%f24,	[%l7 + 0x18]
	stx	%l6,	[%l7 + 0x78]
	ldsh	[%l7 + 0x44],	%g1
	fmovsvs	%icc,	%f6,	%f2
	ldstub	[%l7 + 0x26],	%g5
	movre	%i0,	%i1,	%o6
	nop
	set	0x28, %o6
	std	%o6,	[%l7 + %o6]
	stw	%o5,	[%l7 + 0x38]
	movg	%icc,	%i6,	%l5
	ldd	[%l7 + 0x38],	%f30
	fbo,a	%fcc3,	loop_3
	st	%f7,	[%l7 + 0x14]
	std	%l0,	[%l7 + 0x48]
	stw	%g6,	[%l7 + 0x5C]
loop_3:
	st	%f13,	[%l7 + 0x34]
	alignaddr	%i7,	%l2,	%l3
	ldsh	[%l7 + 0x6A],	%i3
	ldub	[%l7 + 0x42],	%g3
	set	0x30, %l2
	stxa	%g4,	[%l7 + %l2] 0x1c
	ldsh	[%l7 + 0x32],	%i2
	fmovsa	%xcc,	%f5,	%f10
	ldsw	[%l7 + 0x44],	%g7
	prefetch	[%l7 + 0x28],	 0x1
	nop
	set	0x78, %l3
	std	%l4,	[%l7 + %l3]
	sth	%i4,	[%l7 + 0x7E]
	ldd	[%l7 + 0x38],	%o2
	tl	%icc,	0x3
	nop
	set	0x20, %i7
	ldub	[%l7 + %i7],	%o1
	stw	%o4,	[%l7 + 0x58]
	ldsb	[%l7 + 0x27],	%g2
	ldstub	[%l7 + 0x3D],	%i5
	nop
	set	0x2C, %g2
	ldsh	[%l7 + %g2],	%o3
	swap	[%l7 + 0x74],	%l6
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x14,	%l0
	tle	%xcc,	0x1
	swap	[%l7 + 0x34],	%g5
	stbar
	ldsh	[%l7 + 0x68],	%g1
	std	%i0,	[%l7 + 0x28]
	sth	%i0,	[%l7 + 0x5A]
	std	%f18,	[%l7 + 0x08]
	ld	[%l7 + 0x0C],	%f13
	prefetch	[%l7 + 0x44],	 0x3
	ldsh	[%l7 + 0x20],	%o7
	membar	0x06
	nop
	set	0x0E, %l1
	stb	%o6,	[%l7 + %l1]
	ldx	[%l7 + 0x28],	%i6
	nop
	set	0x21, %l4
	stb	%l5,	[%l7 + %l4]
	ld	[%l7 + 0x30],	%f6
	st	%f21,	[%l7 + 0x48]
	ldd	[%l7 + 0x50],	%f2
	nop
	set	0x58, %i0
	stx	%l1,	[%l7 + %i0]
	nop
	set	0x5C, %i1
	prefetch	[%l7 + %i1],	 0x1
	andn	%o5,	%i7,	%l2
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x1c,	%l3
	fcmpeq32	%f20,	%f20,	%g6
	orcc	%o0,	%i3,	%g4
	swap	[%l7 + 0x38],	%i2
	lduh	[%l7 + 0x4A],	%l4
	brlz	%g3,	loop_4
	sth	%i4,	[%l7 + 0x58]
	fandnot1	%f18,	%f4,	%f4
	nop
	set	0x5E, %g7
	lduh	[%l7 + %g7],	%o1
loop_4:
	lduh	[%l7 + 0x44],	%o2
	set	0x48, %i5
	stxa	%o4,	[%l7 + %i5] 0x15
	ldsw	[%l7 + 0x2C],	%g2
	ldsb	[%l7 + 0x1B],	%o3
	flush	%l7 + 0x60
	lduw	[%l7 + 0x40],	%l6
	umul	%l0,	0x0B5B,	%g5
	ldd	[%l7 + 0x70],	%g0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%i1,	[%g0 + 0x10] %asi
	brlez,a	%i0,	loop_5
	ldsh	[%l7 + 0x68],	%i5
	std	%o6,	[%l7 + 0x60]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5:
	lduh	[%l7 + 0x2C],	%o7
	edge32n	%l5,	%l1,	%o5
	prefetch	[%l7 + 0x50],	 0x3
	fsrc2s	%f1,	%f2
	fornot1s	%f0,	%f14,	%f16
	tsubcc	%i7,	0x0310,	%i6
	st	%f17,	[%l7 + 0x74]
	stw	%l3,	[%l7 + 0x6C]
	ld	[%l7 + 0x5C],	%f31
	ldd	[%l7 + 0x68],	%f0
	tgu	%xcc,	0x1
	ldx	[%l7 + 0x50],	%g6
	sir	0x1ED6
	ld	[%l7 + 0x10],	%f28
	movne	%icc,	%o0,	%i3
	mova	%xcc,	%l2,	%g4
	st	%f4,	[%l7 + 0x34]
	ldd	[%l7 + 0x30],	%f26
	fpadd16	%f30,	%f4,	%f8
	ldd	[%l7 + 0x78],	%i2
	ldsh	[%l7 + 0x72],	%l4
	flush	%l7 + 0x28
	tvc	%icc,	0x2
	ld	[%l7 + 0x40],	%f27
	rdhpr	%hintp,	%g7
	nop
	set	0x58, %i4
	std	%f20,	[%l7 + %i4]
	ldd	[%l7 + 0x50],	%f2
	xorcc	%g3,	%i4,	%o1
	stw	%o2,	[%l7 + 0x28]
	lduh	[%l7 + 0x0E],	%o4
	array32	%o3,	%l6,	%g2
	nop
	set	0x10, %l5
	stx	%l0,	[%l7 + %l5]
	lduh	[%l7 + 0x08],	%g5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i1
	ldsb	[%l7 + 0x47],	%g1
	stx	%i0,	[%l7 + 0x20]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%o7,	%i5
	sir	0x0EBC
	lduh	[%l7 + 0x14],	%l5
	ldstub	[%l7 + 0x62],	%l1
	movpos	%icc,	%i7,	%l3
	swap	[%l7 + 0x7C],	%i6
	std	%g6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%i3
	movg	%xcc,	%l2,	%o0
	ldub	[%l7 + 0x24],	%i2
	ldd	[%l7 + 0x18],	%g4
	flush	%l7 + 0x68
	ldsb	[%l7 + 0x61],	%l4
	tpos	%xcc,	0x1
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%g6
	stx	%g3,	[%l7 + 0x30]
	ldstub	[%l7 + 0x75],	%o1
	std	%i4,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	set	0x120, %g1
	ldxa	[%g0 + %g1] 0x52,	%o2
	prefetch	[%l7 + 0x70],	 0x2
	ldx	[%l7 + 0x10],	%o3
	sth	%l6,	[%l7 + 0x24]
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x80,	%o4
	wr	%g0,	0x80,	%asi
	stxa	%l0,	[%l7 + 0x18] %asi
	movrlz	%g5,	%i1,	%g2
	lduw	[%l7 + 0x5C],	%g1
	tvs	%icc,	0x2
	ldx	[%l7 + 0x60],	%i0
	ldd	[%l7 + 0x08],	%f14
	stw	%o7,	[%l7 + 0x4C]
	ldsh	[%l7 + 0x64],	%i5
	ldd	[%l7 + 0x70],	%l4
	sth	%l1,	[%l7 + 0x7C]
	addc	%o6,	0x09C0,	%o5
	ldstub	[%l7 + 0x41],	%i7
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x0
	set	0x0, %i3
	ldxa	[%g0 + %i3] 0x58,	%l3
	stx	%i6,	[%l7 + 0x50]
	sdiv	%g6,	0x12B7,	%l2
	rdhpr	%htba,	%o0
	stx	%i2,	[%l7 + 0x18]
	sth	%i3,	[%l7 + 0x6A]
	prefetch	[%l7 + 0x68],	 0x3
	std	%f20,	[%l7 + 0x30]
	ldstub	[%l7 + 0x63],	%g4
	set	0x38, %o0
	stxa	%g7,	[%l7 + %o0] 0x2b
	membar	#Sync
	ldd	[%l7 + 0x30],	%g2
	ld	[%l7 + 0x0C],	%f0
	nop
	set	0x18, %g3
	stx	%l4,	[%l7 + %g3]
	flush	%l7 + 0x70
	fpsub32s	%f4,	%f26,	%f23
	stw	%i4,	[%l7 + 0x0C]
	movg	%icc,	%o1,	%o2
	stx	%l6,	[%l7 + 0x20]
	orcc	%o3,	0x1610,	%o4
	std	%g4,	[%l7 + 0x20]
	stx	%l0,	[%l7 + 0x20]
	lduh	[%l7 + 0x3C],	%i1
	std	%f26,	[%l7 + 0x10]
	ld	[%l7 + 0x58],	%f7
	brnz,a	%g2,	loop_6
	stw	%i0,	[%l7 + 0x50]
	ldsh	[%l7 + 0x62],	%g1
	ldsh	[%l7 + 0x60],	%o7
loop_6:
	prefetch	[%l7 + 0x48],	 0x0
	std	%f0,	[%l7 + 0x48]
	set	0x10, %i2
	stxa	%l5,	[%l7 + %i2] 0x19
	tg	%icc,	0x0
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%l1
	stbar
	ta	%xcc,	0x2
	ld	[%l7 + 0x34],	%f15
	lduh	[%l7 + 0x42],	%i5
	prefetch	[%l7 + 0x3C],	 0x2
	std	%o6,	[%l7 + 0x68]
	std	%i6,	[%l7 + 0x70]
	swap	[%l7 + 0x4C],	%o5
	stx	%i6,	[%l7 + 0x50]
	nop
	set	0x44, %l6
	lduw	[%l7 + %l6],	%g6
	ld	[%l7 + 0x6C],	%f5
	stx	%l2,	[%l7 + 0x20]
	stbar
	std	%i2,	[%l7 + 0x20]
	stw	%i3,	[%l7 + 0x74]
	stw	%o0,	[%l7 + 0x1C]
	swap	[%l7 + 0x08],	%g4
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%g3
	sth	%l4,	[%l7 + 0x0E]
	ldub	[%l7 + 0x10],	%g7
	std	%o0,	[%l7 + 0x38]
	st	%f5,	[%l7 + 0x20]
	lduw	[%l7 + 0x18],	%o2
	prefetch	[%l7 + 0x38],	 0x0
	umul	%i4,	%l6,	%o4
	ldx	[%l7 + 0x48],	%g5
	flush	%l7 + 0x3C
	lduw	[%l7 + 0x48],	%l0
	wrpr	%i1,	%o3,	%pil
	flush	%l7 + 0x40
	stb	%i0,	[%l7 + 0x28]
	wr	%g0,	0x1d,	%asi
	stxa	%g1,	[%l7 + 0x38] %asi
	stx	%o7,	[%l7 + 0x28]
	set	0x30, %g5
	stxa	%g2,	[%l7 + %g5] 0x80
	ld	[%l7 + 0x10],	%f4
	sth	%l5,	[%l7 + 0x66]
	ldsw	[%l7 + 0x60],	%l1
	ldd	[%l7 + 0x68],	%f18
	ldstub	[%l7 + 0x40],	%i5
	flush	%l7 + 0x30
	stx	%o6,	[%l7 + 0x60]
	ldsb	[%l7 + 0x19],	%o5
	std	%f0,	[%l7 + 0x20]
	prefetch	[%l7 + 0x24],	 0x2
	stbar
	stw	%i6,	[%l7 + 0x10]
	ld	[%l7 + 0x6C],	%f2
	fbu	%fcc3,	loop_7
	ldub	[%l7 + 0x64],	%i7
	stw	%g6,	[%l7 + 0x54]
	tvc	%icc,	0x1
loop_7:
	be	loop_8
	std	%f0,	[%l7 + 0x20]
	ld	[%l7 + 0x48],	%f0
	tcc	%icc,	0x0
loop_8:
	smulcc	%l2,	%i2,	%i3
	flush	%l7 + 0x64
	prefetch	[%l7 + 0x14],	 0x0
	stw	%o0,	[%l7 + 0x3C]
	stw	%l3,	[%l7 + 0x2C]
	flush	%l7 + 0x08
	ldsw	[%l7 + 0x40],	%g3
	prefetch	[%l7 + 0x0C],	 0x2
	ld	[%l7 + 0x18],	%f26
	brgz,a	%l4,	loop_9
	fmovscs	%icc,	%f19,	%f29
	fmovdle	%xcc,	%f3,	%f22
	smulcc	%g4,	0x0DCB,	%g7
loop_9:
	ldx	[%l7 + 0x20],	%o2
	xor	%o1,	%i4,	%l6
	movle	%xcc,	%o4,	%g5
	ldd	[%l7 + 0x08],	%f6
	stx	%i1,	[%l7 + 0x70]
	addc	%l0,	%o3,	%i0
	flush	%l7 + 0x54
	nop
	setx	loop_10,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 0x1
	ldsb	[%l7 + 0x18],	%g1
	ldsb	[%l7 + 0x38],	%g2
loop_10:
	std	%f8,	[%l7 + 0x08]
	st	%f4,	[%l7 + 0x50]
	brz	%o7,	loop_11
	tgu	%icc,	0x1
	wrpr	%l1,	0x0539,	%pil
	std	%i4,	[%l7 + 0x20]
loop_11:
	fxnors	%f13,	%f25,	%f14
	sth	%o6,	[%l7 + 0x76]
	ldstub	[%l7 + 0x3F],	%o5
	stw	%i6,	[%l7 + 0x30]
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l5
	ldd	[%l7 + 0x08],	%f12
	lduh	[%l7 + 0x4A],	%i7
	lduw	[%l7 + 0x3C],	%l2
	ldub	[%l7 + 0x3C],	%i2
	stb	%i3,	[%l7 + 0x5E]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %o3
	ldxa	[%g0 + %o3] 0x20,	%o0
	popc	%g6,	%g3
	stw	%l3,	[%l7 + 0x14]
	sth	%g4,	[%l7 + 0x5A]
	prefetch	[%l7 + 0x68],	 0x1
	swap	[%l7 + 0x40],	%g7
	ldsw	[%l7 + 0x3C],	%l4
	sth	%o2,	[%l7 + 0x16]
	lduh	[%l7 + 0x7C],	%o1
	st	%f1,	[%l7 + 0x58]
	sth	%l6,	[%l7 + 0x7E]
	sir	0x053D
	sth	%i4,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9D2, 	%hsys_tick_cmpr
	stx	%o4,	[%l7 + 0x50]
	st	%f16,	[%l7 + 0x30]
	fornot1	%f22,	%f12,	%f18
	lduh	[%l7 + 0x1C],	%o3
	fbul	%fcc3,	loop_12
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%i0
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x7A6, 	%hsys_tick_cmpr
loop_12:
	wr	%o7,	0x1C01,	%pic
	stbar
	ldsw	[%l7 + 0x48],	%l1
	ldsh	[%l7 + 0x46],	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o6,	[%l7 + 0x30]
	stx	%o5,	[%l7 + 0x28]
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f16
	prefetch	[%l7 + 0x0C],	 0x2
	ld	[%l7 + 0x70],	%f24
	std	%l0,	[%l7 + 0x68]
	std	%f10,	[%l7 + 0x48]
	st	%f8,	[%l7 + 0x70]
	ldsw	[%l7 + 0x5C],	%i6
	st	%f31,	[%l7 + 0x0C]
	flush	%l7 + 0x1C

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flush	%l7 + 0x30
	rd	%softint,	%l5
	movrlez	%i2,	0x05A,	%l2
	stx	%i3,	[%l7 + 0x10]
	std	%f30,	[%l7 + 0x58]
	flush	%l7 + 0x34
	srl	%g6,	0x1D,	%g3
	set	0x30, %i7
	stxa	%l3,	[%l7 + %i7] 0x18
	umul	%g4,	0x1242,	%g7
	tsubcc	%l4,	%o0,	%o2
	stbar
	stb	%o1,	[%l7 + 0x29]
	st	%f18,	[%l7 + 0x60]
	ld	[%l7 + 0x3C],	%f26
	rdhpr	%hpstate,	%i4
	std	%f6,	[%l7 + 0x48]
	ldsb	[%l7 + 0x7A],	%l6
	stbar
	ldd	[%l7 + 0x08],	%i0
	stx	%o4,	[%l7 + 0x18]
	array8	%o3,	%i0,	%g5
	swap	[%l7 + 0x44],	%g1
	ldd	[%l7 + 0x10],	%o6
	nop
	set	0x68, %l3
	lduw	[%l7 + %l3],	%g2
	flush	%l7 + 0x1C
	ldstub	[%l7 + 0x38],	%l1
	std	%i4,	[%l7 + 0x28]
	tvc	%icc,	0x2
	ldx	[%l7 + 0x20],	%o6
	ldd	[%l7 + 0x48],	%f6
	ld	[%l7 + 0x64],	%f17
	fmul8ulx16	%f20,	%f16,	%f24
	sth	%l0,	[%l7 + 0x4A]
	ldstub	[%l7 + 0x0A],	%i6
	subccc	%i7,	0x0695,	%o5
	wr 	%g0, 	0x4, 	%fprs
	movvs	%icc,	%i2,	%i3
	ldstub	[%l7 + 0x46],	%g6
	ldstub	[%l7 + 0x71],	%l2
	ldd	[%l7 + 0x50],	%l2
	tl	%xcc,	0x7
	lduh	[%l7 + 0x40],	%g3
	ldsb	[%l7 + 0x18],	%g4
	lduh	[%l7 + 0x38],	%l4
	stx	%o0,	[%l7 + 0x60]
	ldsw	[%l7 + 0x0C],	%g7
	ldsh	[%l7 + 0x46],	%o2
	ldsw	[%l7 + 0x60],	%i4
	nop
	set	0x1B, %g2
	ldstub	[%l7 + %g2],	%o1
	nop
	setx loop_13, %l0, %l1
	jmpl %l1, %i1
	stbar
	prefetch	[%l7 + 0x34],	 0x0
	ldstub	[%l7 + 0x2F],	%o4
loop_13:
	sth	%o3,	[%l7 + 0x14]
	stb	%i0,	[%l7 + 0x2B]
	lduw	[%l7 + 0x78],	%l6
	stx	%g5,	[%l7 + 0x70]
	tgu	%icc,	0x0
	ldx	[%l7 + 0x10],	%g1
	sth	%g2,	[%l7 + 0x54]
	std	%f4,	[%l7 + 0x78]
	fmovsle	%xcc,	%f25,	%f3
	ldsh	[%l7 + 0x58],	%o7
	ldsw	[%l7 + 0x38],	%l1
	ldx	[%l7 + 0x78],	%i5
	set	0x60, %l1
	stxa	%l0,	[%l7 + %l1] 0xe3
	membar	#Sync
	std	%i6,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%o6
	set	0x48, %l0
	stxa	%i7,	[%l7 + %l0] 0x1c
	array16	%l5,	%i2,	%o5
	ldsw	[%l7 + 0x7C],	%i3
	lduh	[%l7 + 0x38],	%l2
	swap	[%l7 + 0x48],	%l3
	std	%f2,	[%l7 + 0x50]
	rd	%y,	%g3
	flush	%l7 + 0x1C
	sth	%g4,	[%l7 + 0x3E]
	ldd	[%l7 + 0x68],	%f28
	sth	%l4,	[%l7 + 0x26]
	ldd	[%l7 + 0x30],	%f12
	stbar
	ldstub	[%l7 + 0x43],	%o0
	stb	%g7,	[%l7 + 0x3F]
	andcc	%g6,	0x17A5,	%o2
	ldd	[%l7 + 0x38],	%f16
	sth	%i4,	[%l7 + 0x6A]
	siam	0x0
	lduw	[%l7 + 0x78],	%o1
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1b0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1b0] %asi,	%i1 ripped by fixASI40.pl ripped by fixASI40.pl
	movrne	%o3,	0x34F,	%i0
	stbar
	ldd	[%l7 + 0x40],	%i6
	stw	%o4,	[%l7 + 0x08]
	ldub	[%l7 + 0x76],	%g1
	st	%f6,	[%l7 + 0x58]
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g2
	movrgz	%o7,	0x329,	%i5
	sth	%l0,	[%l7 + 0x5A]
	stx	%l1,	[%l7 + 0x70]
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f28
	ld	[%l7 + 0x10],	%f16
	lduh	[%l7 + 0x2A],	%o6
	ldd	[%l7 + 0x78],	%i6
	movpos	%icc,	%i6,	%l5
	ldub	[%l7 + 0x1D],	%o5
	ldub	[%l7 + 0x09],	%i2
	stbar
	ldub	[%l7 + 0x5B],	%i3
	flush	%l7 + 0x28
	ldsb	[%l7 + 0x12],	%l3
	wr	%g3,	%g4,	%sys_tick
	wr	%g0,	0x89,	%asi
	stxa	%l2,	[%l7 + 0x48] %asi
	st	%f31,	[%l7 + 0x40]
	ldd	[%l7 + 0x38],	%f6
	std	%o0,	[%l7 + 0x28]
	stx	%g7,	[%l7 + 0x78]
	edge16ln	%g6,	%l4,	%i4
	wr	%o1,	%i1,	%clear_softint
	stb	%o3,	[%l7 + 0x2D]
	flush	%l7 + 0x74
	wrpr	%i0,	0x1D0E,	%cwp
	rd	%tick_cmpr,	%l6
	std	%f26,	[%l7 + 0x70]
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%o4
	flush	%l7 + 0x28
	std	%f14,	[%l7 + 0x60]
	stw	%o2,	[%l7 + 0x10]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%g1,	loop_14
	stbar
	sethi	0x01F1,	%g2
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x89,	%o7
loop_14:
	udivx	%g5,	0x1253,	%l0
	fsrc2	%f22,	%f2
	lduh	[%l7 + 0x2C],	%i5
	andcc	%l1,	%i7,	%i6
	st	%f3,	[%l7 + 0x5C]
	ldub	[%l7 + 0x36],	%o6
	taddcc	%l5,	0x0391,	%i2
	ldd	[%l7 + 0x58],	%f24
	fcmple16	%f12,	%f28,	%i3
	flush	%l7 + 0x40
	stw	%o5,	[%l7 + 0x10]
	std	%f18,	[%l7 + 0x28]
	ldx	[%l7 + 0x08],	%l3
	flush	%l7 + 0x4C
	ldsh	[%l7 + 0x4E],	%g3
	nop
	set	0x28, %g7
	std	%l2,	[%l7 + %g7]
	std	%f10,	[%l7 + 0x60]
	ldsh	[%l7 + 0x7E],	%g4
	lduw	[%l7 + 0x0C],	%o0
	flush	%l7 + 0x64
	wr	%g0,	0x11,	%asi
	stxa	%g7,	[%l7 + 0x50] %asi
	ldd	[%l7 + 0x60],	%f20
	flush	%l7 + 0x44
	ld	[%l7 + 0x20],	%f5
	stw	%g6,	[%l7 + 0x40]
	ldd	[%l7 + 0x20],	%f18
	stw	%i4,	[%l7 + 0x10]
	wr	%g0,	0x22,	%asi
	stxa	%l4,	[%l7 + 0x10] %asi
	membar	#Sync
	set	0x60, %i5
	ldxa	[%l7 + %i5] 0x04,	%o1
	bleu,a	loop_15
	st	%f19,	[%l7 + 0x4C]
	stbar
	ldub	[%l7 + 0x11],	%o3
loop_15:
	stb	%i1,	[%l7 + 0x6F]
	ldstub	[%l7 + 0x12],	%i0
	taddcc	%o4,	%l6,	%o2
	ld	[%l7 + 0x4C],	%f6
	prefetch	[%l7 + 0x7C],	 0x3
	subcc	%g1,	%g2,	%g5
	lduh	[%l7 + 0x26],	%o7
	fmovrde	%l0,	%f20,	%f14
	fnand	%f26,	%f10,	%f18
	prefetch	[%l7 + 0x34],	 0x3
	bpos,a	%icc,	loop_16
	subccc	%i5,	%l1,	%i6
	ldsh	[%l7 + 0x5A],	%o6
	movneg	%icc,	%i7,	%l5
loop_16:
	stx	%i2,	[%l7 + 0x38]
	stbar
	ldsh	[%l7 + 0x7E],	%i3
	ldd	[%l7 + 0x28],	%l2
	stbar
	ldsb	[%l7 + 0x2C],	%o5
	ldsw	[%l7 + 0x60],	%g3
	flush	%l7 + 0x74
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l2
	movpos	%xcc,	%o0,	%g4
	stx	%g6,	[%l7 + 0x68]
	nop
	set	0x4C, %i0
	stw	%i4,	[%l7 + %i0]
	movrne	%g7,	%o1,	%o3
	ldub	[%l7 + 0x5D],	%l4
	swap	[%l7 + 0x34],	%i0
	ldsw	[%l7 + 0x14],	%o4
	rd	%y,	%l6
	move	%xcc,	%i1,	%o2
	ldsh	[%l7 + 0x28],	%g2
	ldx	[%l7 + 0x40],	%g1
	ld	[%l7 + 0x38],	%f19
	stx	%o7,	[%l7 + 0x78]
	ldd	[%l7 + 0x70],	%g4
	brgez,a	%l0,	loop_17
	nop
	set	0x24, %l5
	ldsb	[%l7 + %l5],	%i5
	ldsb	[%l7 + 0x24],	%i6
	nop
	set	0x45, %i4
	ldsb	[%l7 + %i4],	%l1
loop_17:
	ldsb	[%l7 + 0x4A],	%i7
	tneg	%icc,	0x6
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%o6
	swap	[%l7 + 0x0C],	%l5
	wr	%i3,	%l3,	%set_softint
	sdiv	%i2,	0x1412,	%g3
	ldsb	[%l7 + 0x16],	%l2
	fbug,a	%fcc1,	loop_18
	std	%f14,	[%l7 + 0x68]
	andn	%o5,	0x1096,	%o0
	ldsw	[%l7 + 0x7C],	%g4
loop_18:
	std	%f2,	[%l7 + 0x58]
	ldd	[%l7 + 0x30],	%g6
	sth	%i4,	[%l7 + 0x66]
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o3
	prefetch	[%l7 + 0x28],	 0x0
	ldsb	[%l7 + 0x47],	%o1
	stw	%i0,	[%l7 + 0x1C]
	xorcc	%o4,	0x01FB,	%l4
	stw	%i1,	[%l7 + 0x20]
	prefetch	[%l7 + 0x28],	 0x2
	st	%f25,	[%l7 + 0x40]
	stw	%o2,	[%l7 + 0x0C]
	stb	%g2,	[%l7 + 0x4C]
	std	%g0,	[%l7 + 0x08]
	edge8n	%l6,	%o7,	%l0
	stbar
	wr	%g0,	0x2a,	%asi
	stxa	%i5,	[%l7 + 0x30] %asi
	membar	#Sync
	sth	%g5,	[%l7 + 0x78]
	ldd	[%l7 + 0x10],	%i6
	nop
	set	0x65, %g4
	stb	%i7,	[%l7 + %g4]
	ldstub	[%l7 + 0x1B],	%l1
	lduw	[%l7 + 0x78],	%o6
	edge16ln	%l5,	%l3,	%i2
	nop
	set	0x36, %g1
	ldub	[%l7 + %g1],	%i3
	nop
	set	0x54, %i3
	lduw	[%l7 + %i3],	%g3
	std	%f2,	[%l7 + 0x58]
	std	%f22,	[%l7 + 0x68]
	ldstub	[%l7 + 0x56],	%o5
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x80,	%l2
	std	%f30,	[%l7 + 0x20]
	array32	%o0,	%g6,	%g4
	sth	%i4,	[%l7 + 0x66]
	lduw	[%l7 + 0x5C],	%g7
	swap	[%l7 + 0x3C],	%o1
	flush	%l7 + 0x14
	sth	%i0,	[%l7 + 0x34]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC3A, 	%hsys_tick_cmpr
	tvc	%icc,	0x5
	ldsw	[%l7 + 0x2C],	%i1
	swap	[%l7 + 0x1C],	%o2
	wr	%g2,	0x1D4E,	%softint
	ldstub	[%l7 + 0x72],	%l4
	lduw	[%l7 + 0x3C],	%l6
	stb	%g1,	[%l7 + 0x50]
	lduw	[%l7 + 0x34],	%l0
	sdivcc	%i5,	0x0E97,	%g5
	ldd	[%l7 + 0x18],	%o6
	ldub	[%l7 + 0x6F],	%i7
	movre	%l1,	%i6,	%o6
	ld	[%l7 + 0x30],	%f26
	ldsb	[%l7 + 0x71],	%l5
	srlx	%i2,	0x1B,	%l3
	std	%f26,	[%l7 + 0x50]
	fbn	%fcc2,	loop_19
	stx	%i3,	[%l7 + 0x60]
	fmul8x16	%f21,	%f14,	%f18
	ldsh	[%l7 + 0x40],	%o5
loop_19:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	nop
	set	0x8, %g3
	ldxa	[%g0 + %g3] 0x20,	%g3
	std	%f10,	[%l7 + 0x60]
	popc	0x0E24,	%l2
	flush	%l7 + 0x50
	flush	%l7 + 0x1C
	ld	[%l7 + 0x7C],	%f23

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ld	[%l7 + 0x7C],	%f23
	wr	%g4,	0x047D,	%ccr
	fbue,a	%fcc2,	loop_20
	fxnors	%f31,	%f18,	%f27
	stbar
	prefetch	[%l7 + 0x7C],	 0x3
loop_20:
	prefetch	[%l7 + 0x08],	 0x3
	ldx	[%l7 + 0x40],	%g6
	ldx	[%l7 + 0x40],	%i4
	stb	%g7,	[%l7 + 0x4E]
	andn	%o1,	0x0928,	%i0
	sth	%o4,	[%l7 + 0x3E]
	std	%o2,	[%l7 + 0x58]
	stb	%i1,	[%l7 + 0x72]
	tleu	%xcc,	0x4
	ldd	[%l7 + 0x40],	%o2
	bl	%icc,	loop_21
	lduh	[%l7 + 0x7C],	%g2
	stx	%l6,	[%l7 + 0x38]
	edge16	%g1,	%l0,	%l4
loop_21:
	stb	%i5,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x2C],	%o7
	ldd	[%l7 + 0x40],	%g4
	stbar
	lduh	[%l7 + 0x64],	%i7
	udivx	%i6,	0x1FA1,	%l1
	lduh	[%l7 + 0x34],	%l5
	fbo,a	%fcc3,	loop_22
	fcmpeq16	%f26,	%f8,	%i2
	lduw	[%l7 + 0x20],	%l3
	tvs	%icc,	0x6
loop_22:
	fandnot2s	%f6,	%f15,	%f16
	stb	%i3,	[%l7 + 0x6B]
	nop
	set	0x34, %i2
	stw	%o6,	[%l7 + %i2]
	stb	%o5,	[%l7 + 0x11]
	movpos	%icc,	%l2,	%o0
	lduw	[%l7 + 0x78],	%g3
	wr	%g0,	0x88,	%asi
	stxa	%g6,	[%l7 + 0x30] %asi
	ldstub	[%l7 + 0x6B],	%g4
	ldx	[%l7 + 0x30],	%g7
	stw	%i4,	[%l7 + 0x78]
	sth	%i0,	[%l7 + 0x60]
	std	%o4,	[%l7 + 0x48]
	ldd	[%l7 + 0x18],	%f2
	sll	%o3,	0x0F,	%o1
	prefetch	[%l7 + 0x18],	 0x3
	st	%f24,	[%l7 + 0x54]
	stb	%o2,	[%l7 + 0x0D]
	flush	%l7 + 0x14
	sth	%i1,	[%l7 + 0x1E]
	st	%f30,	[%l7 + 0x18]
	ldd	[%l7 + 0x60],	%i6
	std	%g2,	[%l7 + 0x10]
	ldx	[%l7 + 0x68],	%g1
	flush	%l7 + 0x3C
	flush	%l7 + 0x0C
	sub	%l4,	%i5,	%l0
	edge16n	%g5,	%i7,	%i6
	st	%f17,	[%l7 + 0x10]
	nop
	set	0x4A, %l6
	ldstub	[%l7 + %l6],	%l1
	ldsh	[%l7 + 0x4C],	%o7
	nop
	set	0x54, %o5
	prefetch	[%l7 + %o5],	 0x0
	lduw	[%l7 + 0x30],	%l5
	stb	%l3,	[%l7 + 0x0B]
	swap	[%l7 + 0x70],	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5B],	%i3
	stx	%o6,	[%l7 + 0x78]
	prefetch	[%l7 + 0x0C],	 0x3
	flush	%l7 + 0x40
	ldd	[%l7 + 0x50],	%f0
	movn	%xcc,	%l2,	%o0
	stbar
	ldd	[%l7 + 0x58],	%o4
	or	%g6,	%g4,	%g7
	stw	%g3,	[%l7 + 0x58]
	ldub	[%l7 + 0x77],	%i0
	wrpr	%i4,	%o4,	%tick
	ldsh	[%l7 + 0x68],	%o3
	sth	%o1,	[%l7 + 0x20]
	stw	%o2,	[%l7 + 0x44]
	prefetch	[%l7 + 0x34],	 0x3
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x188
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x188] %asi,	%i1 ripped by fixASI40.pl ripped by fixASI40.pl
	taddcctv	%g1,	%l6,	%l4
	lduh	[%l7 + 0x34],	%i5
	ldsh	[%l7 + 0x52],	%l0
	lduw	[%l7 + 0x38],	%g5
	stx	%i7,	[%l7 + 0x50]
	stbar
	sth	%l1,	[%l7 + 0x16]
	stw	%i6,	[%l7 + 0x44]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x108
	set	0x108, %o4
	ldxa	[%g0 + %o4] 0x52,	%l5
	stw	%o7,	[%l7 + 0x40]
	ld	[%l7 + 0x2C],	%f29
	lduw	[%l7 + 0x10],	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x44
	lduh	[%l7 + 0x1A],	%l3
	stx	%o6,	[%l7 + 0x40]
	stw	%l2,	[%l7 + 0x10]
	movle	%xcc,	%i3,	%o5
	ldsb	[%l7 + 0x20],	%o0
	ldx	[%l7 + 0x50],	%g4
	andcc	%g7,	0x12B3,	%g6
	prefetch	[%l7 + 0x50],	 0x3
	andn	%i0,	%g3,	%o4
	tpos	%icc,	0x3
	wrpr	%i4,	%o1,	%tick
	orn	%o2,	0x1134,	%i1
	nop
	set	0x40, %o2
	prefetch	[%l7 + %o2],	 0x0
	movrlz	%g2,	%g1,	%l6
	nop
	set	0x24, %o7
	lduw	[%l7 + %o7],	%l4
	ldsb	[%l7 + 0x48],	%i5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g5
	ldxa	[%g0 + %g5] 0x4f,	%o3
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x81,	%l0
	brz,a	%i7,	loop_23
	ldsb	[%l7 + 0x71],	%l1
	ld	[%l7 + 0x7C],	%f31
	st	%f18,	[%l7 + 0x78]
loop_23:
	nop
	set	0x28, %o6
	stx	%i6,	[%l7 + %o6]
	st	%f19,	[%l7 + 0x28]
	ldsb	[%l7 + 0x2F],	%g5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %o1
	ldxa	[%g0 + %o1] 0x21,	%l5
	stx	%o7,	[%l7 + 0x20]
	ldstub	[%l7 + 0x18],	%l3
	flush	%l7 + 0x64
	ldd	[%l7 + 0x38],	%i2
	lduh	[%l7 + 0x1C],	%l2
	lduw	[%l7 + 0x38],	%i3
	prefetch	[%l7 + 0x34],	 0x0
	ldsh	[%l7 + 0x74],	%o5
	set	0x18, %l2
	stxa	%o6,	[%l7 + %l2] 0x2a
	membar	#Sync
	ldd	[%l7 + 0x68],	%f10
	stbar
	sth	%g4,	[%l7 + 0x58]
	nop
	set	0x30, %l3
	stx	%o0,	[%l7 + %l3]
	lduw	[%l7 + 0x44],	%g6
	swap	[%l7 + 0x20],	%i0
	ldd	[%l7 + 0x60],	%g2
	nop
	set	0x70, %i7
	std	%f20,	[%l7 + %i7]
	ldsh	[%l7 + 0x22],	%g7
	edge16n	%o4,	%o1,	%i4
	stw	%o2,	[%l7 + 0x48]
	srl	%g2,	%g1,	%i1
	ldsh	[%l7 + 0x6C],	%l6
	edge8l	%i5,	%o3,	%l0
	swap	[%l7 + 0x50],	%i7
	stx	%l1,	[%l7 + 0x40]
	st	%f18,	[%l7 + 0x24]
	ldsb	[%l7 + 0x28],	%i6
	stw	%g5,	[%l7 + 0x24]
	prefetch	[%l7 + 0x0C],	 0x1
	lduw	[%l7 + 0x40],	%l5
	ldstub	[%l7 + 0x79],	%o7
	ldsh	[%l7 + 0x7E],	%l4
	ld	[%l7 + 0x78],	%f4
	ldd	[%l7 + 0x70],	%f2
	ldstub	[%l7 + 0x11],	%i2
	swap	[%l7 + 0x10],	%l3
	std	%l2,	[%l7 + 0x10]
	taddcc	%o5,	0x0CA8,	%o6
	stw	%g4,	[%l7 + 0x6C]
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%o0
	ldsb	[%l7 + 0x7B],	%i3
	movg	%icc,	%i0,	%g6
	wr	%g0,	0x80,	%asi
	stxa	%g3,	[%l7 + 0x40] %asi
	ta	%xcc,	0x0
	stx	%g7,	[%l7 + 0x50]
	nop
	set	0x28, %l1
	stw	%o4,	[%l7 + %l1]
	movre	%i4,	%o2,	%o1
	ldsw	[%l7 + 0x58],	%g1
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g2
	fmovsl	%xcc,	%f30,	%f11
	ldstub	[%l7 + 0x52],	%i1
	ldx	[%l7 + 0x40],	%i5
	ldsw	[%l7 + 0x60],	%l6
	sdiv	%o3,	0x096F,	%i7
	flush	%l7 + 0x0C
	rd	%ccr,	%l0
	ldx	[%l7 + 0x48],	%l1
	flush	%l7 + 0x20
	fmovsleu	%xcc,	%f1,	%f6
	flushw
	fpsub16s	%f14,	%f13,	%f31
	stbar
	ldd	[%l7 + 0x30],	%i6
	prefetch	[%l7 + 0x7C],	 0x0
	andn	%l5,	0x0793,	%g5
	std	%o6,	[%l7 + 0x30]
	flush	%l7 + 0x78
	stx	%l4,	[%l7 + 0x58]
	srax	%l3,	0x1B,	%i2
	ldd	[%l7 + 0x18],	%o4
	stbar
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x88,	%o6
	sth	%l2,	[%l7 + 0x18]
	prefetch	[%l7 + 0x44],	 0x3
	movcs	%xcc,	%g4,	%o0
	ldsw	[%l7 + 0x28],	%i0
	nop
	setx loop_24, %l0, %l1
	jmpl %l1, %i3
	stw	%g3,	[%l7 + 0x0C]
	st	%f30,	[%l7 + 0x6C]
	swap	[%l7 + 0x54],	%g6
loop_24:
	stbar
	stx	%g7,	[%l7 + 0x18]
	lduw	[%l7 + 0x28],	%o4
	lduh	[%l7 + 0x0A],	%o2
	tn	%icc,	0x7
	lduw	[%l7 + 0x34],	%i4
	fzero	%f30
	rdhpr	%hintp,	%o1
	prefetch	[%l7 + 0x30],	 0x2
	sth	%g1,	[%l7 + 0x2C]
	ld	[%l7 + 0x78],	%f26
	sth	%i1,	[%l7 + 0x74]
	std	%f8,	[%l7 + 0x58]
	lduw	[%l7 + 0x6C],	%i5
	prefetch	[%l7 + 0x54],	 0x3
	fpsub16	%f16,	%f8,	%f10
	stw	%g2,	[%l7 + 0x40]
	xnor	%o3,	%l6,	%l0
	movn	%xcc,	%l1,	%i6
	swap	[%l7 + 0x08],	%i7
	stx	%g5,	[%l7 + 0x50]
	tpos	%xcc,	0x0
	ldd	[%l7 + 0x30],	%f26
	ldsw	[%l7 + 0x58],	%l5
	stb	%l4,	[%l7 + 0x5D]
	ldsb	[%l7 + 0x39],	%l3
	edge8n	%i2,	%o7,	%o6
	std	%o4,	[%l7 + 0x28]
	wrpr	%l2,	0x195A,	%tick
	sth	%o0,	[%l7 + 0x52]
	fbge,a	%fcc2,	loop_25
	stw	%g4,	[%l7 + 0x0C]
	std	%i2,	[%l7 + 0x38]
	edge32	%i0,	%g3,	%g7
loop_25:
	nop
	set	0x78, %l0
	ldsw	[%l7 + %l0],	%o4
	addcc	%o2,	0x085B,	%i4
	lduh	[%l7 + 0x1E],	%o1
	stw	%g1,	[%l7 + 0x74]
	sth	%g6,	[%l7 + 0x74]
	prefetch	[%l7 + 0x20],	 0x2
	fmovdl	%xcc,	%f1,	%f4
	std	%i0,	[%l7 + 0x38]
	ld	[%l7 + 0x30],	%f10
	subcc	%i5,	%o3,	%g2
	fmovsg	%icc,	%f29,	%f0
	membar	0x2F
	tl	%icc,	0x5
	ldub	[%l7 + 0x6F],	%l0
	stx	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x68],	%f29
	stw	%i6,	[%l7 + 0x78]
	ldd	[%l7 + 0x40],	%l0
	ldub	[%l7 + 0x19],	%g5
	ld	[%l7 + 0x14],	%f15
	ldsh	[%l7 + 0x72],	%i7
	fandnot1	%f2,	%f28,	%f22
	ldd	[%l7 + 0x38],	%l4
	prefetch	[%l7 + 0x14],	 0x1
	std	%l2,	[%l7 + 0x18]
	prefetch	[%l7 + 0x2C],	 0x1
	ldsw	[%l7 + 0x6C],	%l5
	nop
	set	0x10, %g6
	std	%f18,	[%l7 + %g6]
	ldub	[%l7 + 0x42],	%o7
	swap	[%l7 + 0x3C],	%i2
	nop
	set	0x64, %g7
	lduh	[%l7 + %g7],	%o5
	std	%o6,	[%l7 + 0x20]
	tg	%xcc,	0x7
	fpack16	%f8,	%f12
	std	%f30,	[%l7 + 0x28]
	sth	%o0,	[%l7 + 0x6C]
	swap	[%l7 + 0x34],	%l2
	std	%f30,	[%l7 + 0x70]
	sth	%g4,	[%l7 + 0x7E]
	flush	%l7 + 0x54
	swap	[%l7 + 0x7C],	%i3
	swap	[%l7 + 0x3C],	%g3
	smulcc	%i0,	0x1AF9,	%g7
	flush	%l7 + 0x58
	lduw	[%l7 + 0x58],	%o4
	fcmpeq32	%f22,	%f28,	%i4
	sdiv	%o2,	0x1110,	%o1
	array16	%g1,	%i1,	%i5
	stbar
	stb	%o3,	[%l7 + 0x16]
	ldstub	[%l7 + 0x4E],	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x5A],	%l6
	ldsb	[%l7 + 0x09],	%i6
	fcmpeq16	%f6,	%f6,	%l1
	stx	%g5,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%f31
	stb	%i7,	[%l7 + 0x7A]
	prefetch	[%l7 + 0x54],	 0x2
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%l0
	sth	%l3,	[%l7 + 0x78]
	std	%f0,	[%l7 + 0x70]
	addc	%l5,	0x1196,	%l4
	ldsb	[%l7 + 0x3E],	%o7
	srl	%o5,	0x12,	%o6
	lduh	[%l7 + 0x36],	%i2
	ldstub	[%l7 + 0x49],	%o0
	stb	%g4,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x5A],	%l2
	ldd	[%l7 + 0x28],	%i2
	ldub	[%l7 + 0x4F],	%i0
	fornot2s	%f4,	%f17,	%f15
	ldub	[%l7 + 0x56],	%g7
	std	%o4,	[%l7 + 0x60]
	fbuge	%fcc2,	loop_26
	orncc	%g3,	%i4,	%o2
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x18,	%o1
loop_26:
	ldsh	[%l7 + 0x7C],	%i1
	ldsh	[%l7 + 0x20],	%g1
	stb	%i5,	[%l7 + 0x7E]
	std	%f20,	[%l7 + 0x18]
	ld	[%l7 + 0x20],	%f15
	prefetch	[%l7 + 0x18],	 0x1
	st	%f30,	[%l7 + 0x20]
	ldsh	[%l7 + 0x16],	%o3
	ldub	[%l7 + 0x2F],	%g6
	ldd	[%l7 + 0x78],	%i6
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x15,	%g2
	ldstub	[%l7 + 0x52],	%l1
	sth	%i6,	[%l7 + 0x12]
	set	0x38, %i0
	ldxa	[%l7 + %i0] 0x1c,	%i7
	sub	%l0,	%g5,	%l3
	prefetch	[%l7 + 0x3C],	 0x0
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%l4
	set	0x48, %i4
	ldxa	[%l7 + %i4] 0x04,	%o7
	ldd	[%l7 + 0x40],	%f26
	swap	[%l7 + 0x18],	%l4
	ldd	[%l7 + 0x28],	%o6
	stb	%i2,	[%l7 + 0x72]
	movle	%icc,	%o0,	%o5
	st	%f15,	[%l7 + 0x68]
	stb	%l2,	[%l7 + 0x4D]
	ldsh	[%l7 + 0x52],	%i3
	swap	[%l7 + 0x4C],	%g4
	tg	%icc,	0x3
	array16	%g7,	%i0,	%g3
	stw	%o4,	[%l7 + 0x4C]
	stbar
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x19,	%o2
	std	%o0,	[%l7 + 0x60]
	nop
	set	0x54, %i3
	ldsb	[%l7 + %i3],	%i1
	stbar
	fzeros	%f1
	lduw	[%l7 + 0x2C],	%i4
	nop
	set	0x3E, %g1
	ldsb	[%l7 + %g1],	%g1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%o3,	[%g0 + 0x10] %asi
	ldd	[%l7 + 0x10],	%f4
	std	%i4,	[%l7 + 0x28]
	stb	%g6,	[%l7 + 0x3B]
	st	%f23,	[%l7 + 0x1C]
	edge16n	%l6,	%g2,	%l1
	stbar
	ld	[%l7 + 0x70],	%f31
	flush	%l7 + 0x48
	lduw	[%l7 + 0x38],	%i6
	ldd	[%l7 + 0x28],	%i6
	set	0x70, %o0
	stxa	%l0,	[%l7 + %o0] 0x80
	stbar
	stx	%l3,	[%l7 + 0x08]
	sth	%g5,	[%l7 + 0x3A]
	ldsh	[%l7 + 0x30],	%l5
	ldd	[%l7 + 0x68],	%f2
	wr	%g0,	0x89,	%asi
	stxa	%o7,	[%l7 + 0x30] %asi
	ldsh	[%l7 + 0x30],	%l4
	tgu	%icc,	0x5
	ldsb	[%l7 + 0x5C],	%o6
	swap	[%l7 + 0x34],	%o0
	fblg	%fcc1,	loop_27
	fornot2	%f14,	%f18,	%f28
	flush	%l7 + 0x74
	ldsb	[%l7 + 0x2D],	%i2
loop_27:
	ldd	[%l7 + 0x20],	%l2
	ldx	[%l7 + 0x08],	%i3
	ldd	[%l7 + 0x68],	%g4
	bshuffle	%f8,	%f20,	%f16
	lduw	[%l7 + 0x20],	%g7
	ldub	[%l7 + 0x78],	%i0
	lduw	[%l7 + 0x20],	%o4
	set	0x38, %g3
	stxa	%o2,	[%l7 + %g3] 0x22
	membar	#Sync
	ldsw	[%l7 + 0x54],	%o1
	ldx	[%l7 + 0x68],	%i1
	ldsw	[%l7 + 0x70],	%i4
	lduh	[%l7 + 0x5C],	%g1
	std	%g2,	[%l7 + 0x38]
	ldsw	[%l7 + 0x10],	%o3
	prefetch	[%l7 + 0x34],	 0x2
	movle	%xcc,	%g6,	%l6
	smulcc	%i5,	0x0A83,	%g2
	stx	%l1,	[%l7 + 0x60]
	tneg	%icc,	0x6
	st	%f27,	[%l7 + 0x14]
	rdhpr	%hsys_tick_cmpr,	%i7
	lduh	[%l7 + 0x46],	%i6
	tl	%xcc,	0x4
	ldx	[%l7 + 0x68],	%l3
	std	%f2,	[%l7 + 0x70]
	ldstub	[%l7 + 0x2B],	%g5
	flush	%l7 + 0x78
	ldd	[%l7 + 0x10],	%l0
	swap	[%l7 + 0x14],	%o7
	nop
	set	0x45, %l6
	stb	%l5,	[%l7 + %l6]
	nop
	setx	loop_28,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcc,a,pt	%icc,	loop_29
	swap	[%l7 + 0x30],	%l4
	movrgz	%o0,	%i2,	%o6
loop_28:
	ld	[%l7 + 0x3C],	%f27
loop_29:
	smul	%i3,	%g4,	%o5
	sth	%l2,	[%l7 + 0x10]
	ldsh	[%l7 + 0x14],	%g7
	stw	%i0,	[%l7 + 0x58]
	ldsw	[%l7 + 0x1C],	%o2
	stw	%o1,	[%l7 + 0x24]
	addcc	%o4,	0x1105,	%i4
	sdivcc	%g1,	0x162C,	%g3
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g6,	%i1,	%i5
	st	%f18,	[%l7 + 0x30]
	std	%g2,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	sub	%l1,	%l6,	%i6
	stw	%l3,	[%l7 + 0x70]
	ldstub	[%l7 + 0x46],	%g5
	std	%i6,	[%l7 + 0x40]
	flush	%l7 + 0x70
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%l0
	sth	%o7,	[%l7 + 0x26]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%l4
	ldsh	[%l7 + 0x7C],	%o0
	st	%f31,	[%l7 + 0x4C]
	tneg	%icc,	0x7
	stbar
	ldsh	[%l7 + 0x78],	%i2
	udiv	%l5,	0x114A,	%i3
	stbar
	fornot2s	%f11,	%f27,	%f0
	ldstub	[%l7 + 0x59],	%o6
	std	%g4,	[%l7 + 0x68]
	ldd	[%l7 + 0x48],	%o4
	ldsb	[%l7 + 0x24],	%l2
	nop
	set	0x68, %o7
	ldstub	[%l7 + %o7],	%i0
	ldstub	[%l7 + 0x4F],	%o2
	rdpr	%gl,	%g7
	ldsw	[%l7 + 0x30],	%o4
	pdist	%f14,	%f10,	%f18
	ld	[%l7 + 0x30],	%f13
	edge16	%i4,	%g1,	%g3
	ldub	[%l7 + 0x24],	%o1
	std	%f6,	[%l7 + 0x60]
	rdhpr	%htba,	%o3
	std	%i0,	[%l7 + 0x48]
	lduw	[%l7 + 0x4C],	%g6
	fornot1s	%f11,	%f19,	%f9
	movre	%g2,	0x301,	%i5
	set	0x28, %g5
	stxa	%l6,	[%l7 + %g5] 0x19
	ldd	[%l7 + 0x18],	%f12
	ldsw	[%l7 + 0x24],	%l1
	wr	%g0,	0x22,	%asi
	stxa	%l3,	[%l7 + 0x58] %asi
	membar	#Sync
	popc	0x0E14,	%i6
	edge8l	%g5,	%i7,	%o7
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%l4
	ld	[%l7 + 0x14],	%f21
	ldd	[%l7 + 0x60],	%f28
	or	%l0,	0x1A2C,	%i2
	andcc	%l5,	0x0D1E,	%i3
	lduh	[%l7 + 0x40],	%o0
	srax	%g4,	0x0B,	%o5
	ldsh	[%l7 + 0x74],	%l2
	fmovda	%icc,	%f12,	%f11
	lduw	[%l7 + 0x10],	%o6
	stw	%o2,	[%l7 + 0x64]
	wr	%g0,	0x19,	%asi
	stxa	%g7,	[%l7 + 0x78] %asi
	ld	[%l7 + 0x54],	%f3
	ldub	[%l7 + 0x54],	%i0
	ldd	[%l7 + 0x30],	%f10
	ldsw	[%l7 + 0x30],	%o4
	prefetch	[%l7 + 0x78],	 0x0
	sub	%i4,	0x0C8C,	%g3
	sth	%o1,	[%l7 + 0x4A]
	ldsw	[%l7 + 0x74],	%o3
	stw	%g1,	[%l7 + 0x50]
	fmovse	%xcc,	%f28,	%f26
	fnands	%f7,	%f22,	%f27
	wr	%g0,	0x89,	%asi
	stxa	%g6,	[%l7 + 0x58] %asi
	st	%f5,	[%l7 + 0x2C]
	stw	%g2,	[%l7 + 0x4C]
	ldsw	[%l7 + 0x2C],	%i1
	stw	%i5,	[%l7 + 0x54]
	bvc,a,pn	%xcc,	loop_30
	ldub	[%l7 + 0x47],	%l1
	rd	%sys_tick_cmpr,	%l6
	sth	%l3,	[%l7 + 0x20]
loop_30:
	ldd	[%l7 + 0x48],	%f28
	stb	%i6,	[%l7 + 0x66]
	edge8n	%i7,	%o7,	%g5
	stw	%l4,	[%l7 + 0x08]
	ldx	[%l7 + 0x68],	%l0
	std	%i2,	[%l7 + 0x78]
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%l5
	flush	%l7 + 0x60
	flush	%l7 + 0x38
	array32	%o0,	%g4,	%i3
	edge8ln	%l2,	%o5,	%o6
	ldx	[%l7 + 0x58],	%o2
	ldd	[%l7 + 0x50],	%f24
	flush	%l7 + 0x2C
	ldstub	[%l7 + 0x6E],	%g7
	ldx	[%l7 + 0x40],	%o4
	lduw	[%l7 + 0x7C],	%i0
	sdiv	%g3,	0x0D15,	%o1
	ldub	[%l7 + 0x1B],	%i4
	movvs	%icc,	%o3,	%g6
	lduh	[%l7 + 0x78],	%g1
	wr	%g0,	0xe3,	%asi
	stxa	%i1,	[%l7 + 0x40] %asi
	membar	#Sync
	sth	%g2,	[%l7 + 0x5E]
	stx	%i5,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	stx	%l1,	[%l7 + 0x58]
	stb	%l6,	[%l7 + 0x6B]
	andncc	%i6,	%i7,	%o7
	wr	%l3,	0x1D88,	%sys_tick
	nop
	setx	loop_31,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x08],	%f30
	ldd	[%l7 + 0x60],	%l4
	wrpr	%g5,	%i2,	%pil
loop_31:
	ldsh	[%l7 + 0x54],	%l0
	fbl	%fcc2,	loop_32
	mulx	%o0,	%g4,	%i3
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x18,	%l5
loop_32:
	nop
	wr	%g0,	0x81,	%asi
	stxa	%l2,	[%l7 + 0x30] %asi
	swap	[%l7 + 0x18],	%o6
	std	%f4,	[%l7 + 0x58]
	stx	%o2,	[%l7 + 0x28]
	lduh	[%l7 + 0x78],	%g7
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x18
	set	0x18, %o1
	ldxa	[%g0 + %o1] 0x58,	%o5
	fmovsvc	%icc,	%f20,	%f15
	ldstub	[%l7 + 0x53],	%o4
	st	%f2,	[%l7 + 0x24]
	fornot2s	%f27,	%f29,	%f7
	ldd	[%l7 + 0x40],	%f22
	edge32l	%g3,	%o1,	%i4
	nop
	set	0x30, %l3
	stx	%i0,	[%l7 + %l3]
	fnot2	%f18,	%f30
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%g6
	tl	%xcc,	0x0
	ldstub	[%l7 + 0x61],	%o3
	ldstub	[%l7 + 0x3D],	%i1
	fmovrsgez	%g1,	%f6,	%f29
	flush	%l7 + 0x1C
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x14,	%g2
	ldx	[%l7 + 0x50],	%i5
	stb	%l1,	[%l7 + 0x6B]
	prefetch	[%l7 + 0x40],	 0x0
	ld	[%l7 + 0x10],	%f9
	flush	%l7 + 0x44
	std	%f20,	[%l7 + 0x58]
	ldd	[%l7 + 0x48],	%f28
	ldd	[%l7 + 0x08],	%f14
	flush	%l7 + 0x68
	sth	%i6,	[%l7 + 0x24]
	ldub	[%l7 + 0x6E],	%l6
	stbar
	st	%f20,	[%l7 + 0x70]
	stx	%o7,	[%l7 + 0x60]
	ldsb	[%l7 + 0x73],	%i7
	stbar
	stw	%l3,	[%l7 + 0x30]
	std	%f14,	[%l7 + 0x50]
	and	%l4,	0x0B9D,	%g5
	ldd	[%l7 + 0x58],	%f0
	stbar
	ldstub	[%l7 + 0x34],	%l0
	ldub	[%l7 + 0x58],	%i2
	tgu	%xcc,	0x1
	lduw	[%l7 + 0x24],	%g4
	ldub	[%l7 + 0x4D],	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEF9, 	%hsys_tick_cmpr
	std	%f2,	[%l7 + 0x10]
	swap	[%l7 + 0x58],	%l2
	ldx	[%l7 + 0x78],	%o6
	ldub	[%l7 + 0x3B],	%i3
	lduw	[%l7 + 0x74],	%o2
	movleu	%xcc,	%g7,	%o5
	srax	%o4,	0x13,	%o1
	std	%g2,	[%l7 + 0x68]
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f8
	lduh	[%l7 + 0x14],	%i0
	tg	%icc,	0x0
	std	%i4,	[%l7 + 0x10]
	stx	%o3,	[%l7 + 0x10]
	nop
	set	0x40, %l4
	std	%f14,	[%l7 + %l4]
	swap	[%l7 + 0x14],	%i1
	stb	%g1,	[%l7 + 0x0E]
	edge8ln	%g6,	%i5,	%g2
	nop
	set	0x43, %g2
	stb	%l1,	[%l7 + %g2]
	ldd	[%l7 + 0x30],	%i6
	stw	%o7,	[%l7 + 0x50]
	ldsw	[%l7 + 0x10],	%l6
	for	%f6,	%f4,	%f26
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%l3
	udivx	%i7,	0x1D5E,	%g5
	lduw	[%l7 + 0x28],	%l0
	stbar
	flush	%l7 + 0x6C
	nop
	set	0x5A, %g6
	lduh	[%l7 + %g6],	%i2
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%g4
	flush	%l7 + 0x38
	brz,a	%o0,	loop_33
	std	%l4,	[%l7 + 0x60]
	ldub	[%l7 + 0x14],	%l4
	set	0x78, %i1
	stxa	%o6,	[%l7 + %i1] 0x15
loop_33:
	sth	%i3,	[%l7 + 0x4E]
	prefetch	[%l7 + 0x28],	 0x1
	stx	%o2,	[%l7 + 0x78]
	std	%l2,	[%l7 + 0x08]
	sth	%g7,	[%l7 + 0x76]
	edge32n	%o5,	%o4,	%g3
	std	%f30,	[%l7 + 0x18]
	flush	%l7 + 0x74
	stx	%o1,	[%l7 + 0x18]
	ldstub	[%l7 + 0x60],	%i0
	sth	%o3,	[%l7 + 0x38]
	ldsb	[%l7 + 0x79],	%i4
	stx	%g1,	[%l7 + 0x68]
	set	0x30, %i5
	stxa	%i1,	[%l7 + %i5] 0x80
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g6
	alignaddrl	%i5,	%l1,	%g2
	std	%f30,	[%l7 + 0x40]
	fbuge	%fcc2,	loop_34
	flush	%l7 + 0x6C
	tcs	%icc,	0x0
	rd	%pc,	%i6
loop_34:
	ld	[%l7 + 0x30],	%f7
	xorcc	%l6,	0x01CD,	%l3
	nop
	set	0x26, %i0
	ldub	[%l7 + %i0],	%o7
	prefetch	[%l7 + 0x20],	 0x0
	lduh	[%l7 + 0x3C],	%i7
	flushw
	stbar
	fands	%f15,	%f7,	%f2
	ldub	[%l7 + 0x11],	%g5
	stbar
	ldsb	[%l7 + 0x23],	%l0
	ldub	[%l7 + 0x69],	%i2
	ldsh	[%l7 + 0x1E],	%o0
	wr	%g0,	0xe2,	%asi
	stxa	%l5,	[%l7 + 0x10] %asi
	membar	#Sync
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	stxa	%l4,	[%g0 + 0x110] %asi
	ldd	[%l7 + 0x78],	%f2
	stx	%o6,	[%l7 + 0x48]
	movleu	%xcc,	%g4,	%o2
	lduh	[%l7 + 0x1E],	%l2
	stw	%g7,	[%l7 + 0x34]
	ldstub	[%l7 + 0x79],	%o5
	stx	%i3,	[%l7 + 0x50]
	andcc	%g3,	0x0730,	%o4
	edge32	%i0,	%o1,	%i4
	nop
	set	0x30, %i6
	stx	%g1,	[%l7 + %i6]
	ld	[%l7 + 0x0C],	%f26
	swap	[%l7 + 0x2C],	%i1
	prefetch	[%l7 + 0x24],	 0x0
	flush	%l7 + 0x70
	xnorcc	%g6,	%i5,	%l1
	movcs	%xcc,	%g2,	%i6
	xnorcc	%l6,	0x1B48,	%l3
	stw	%o3,	[%l7 + 0x28]
	stx	%o7,	[%l7 + 0x38]
	swap	[%l7 + 0x14],	%g5
	std	%i6,	[%l7 + 0x18]
	ldsb	[%l7 + 0x3C],	%l0
	nop
	set	0x58, %i4
	std	%i2,	[%l7 + %i4]
	flush	%l7 + 0x10
	ldsh	[%l7 + 0x42],	%l5
	stbar
	stbar
	wr	%g0,	0x22,	%asi
	stxa	%o0,	[%l7 + 0x28] %asi
	membar	#Sync
	nop
	set	0x18, %l5
	lduh	[%l7 + %l5],	%o6
	ldsb	[%l7 + 0x38],	%l4
	stb	%g4,	[%l7 + 0x0C]
	stb	%o2,	[%l7 + 0x44]
	ldstub	[%l7 + 0x69],	%l2
	tge	%xcc,	0x5
	nop
	set	0x08, %g4
	std	%f26,	[%l7 + %g4]
	ldsb	[%l7 + 0x26],	%g7
	for	%f4,	%f2,	%f20
	sethi	0x185E,	%i3
	orcc	%o5,	%o4,	%i0
	std	%f14,	[%l7 + 0x18]
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g3
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o1
	bvc,pt	%xcc,	loop_35
	nop
	setx	loop_36,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x3C],	%i4
	add	%g1,	0x10E4,	%i1
loop_35:
	rdpr	%tba,	%g6
loop_36:
	nop
	set	0x19, %i3
	ldsb	[%l7 + %i3],	%l1
	ldd	[%l7 + 0x40],	%f12
	stx	%g2,	[%l7 + 0x38]
	ldsh	[%l7 + 0x78],	%i5
	edge16n	%l6,	%i6,	%l3
	tneg	%xcc,	0x3
	stb	%o7,	[%l7 + 0x62]
	ldx	[%l7 + 0x08],	%g5
	std	%f30,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x3e8
	set	0x3e8, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%o3 ripped by fixASI40.pl ripped by fixASI40.pl
	lduw	[%l7 + 0x38],	%i7
	ldx	[%l7 + 0x08],	%i2
	stb	%l5,	[%l7 + 0x1A]
	rdhpr	%hintp,	%o0
	lduh	[%l7 + 0x68],	%o6
	ldd	[%l7 + 0x68],	%f16
	sth	%l4,	[%l7 + 0x4E]
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x15,	%l0
	ldstub	[%l7 + 0x3A],	%g4
	ldd	[%l7 + 0x60],	%f20
	wr	%g0,	0x19,	%asi
	stxa	%o2,	[%l7 + 0x30] %asi
	ldub	[%l7 + 0x39],	%g7
	swap	[%l7 + 0x54],	%l2
	st	%f11,	[%l7 + 0x68]
	movcc	%xcc,	%o5,	%o4
	ldub	[%l7 + 0x74],	%i3
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f6
	stb	%i0,	[%l7 + 0x22]
	edge8n	%o1,	%i4,	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%g1,	[%g0 + 0x18] %asi
	ldsb	[%l7 + 0x33],	%i1
	lduh	[%l7 + 0x36],	%l1
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g2
	swap	[%l7 + 0x74],	%i5
	nop
	set	0x6C, %g3
	ldub	[%l7 + %g3],	%l6
	swap	[%l7 + 0x2C],	%i6
	flush	%l7 + 0x58
	lduw	[%l7 + 0x40],	%l3
	sth	%o7,	[%l7 + 0x56]
	prefetch	[%l7 + 0x34],	 0x1
	ldub	[%l7 + 0x0C],	%g5
	flush	%l7 + 0x0C
	ldsw	[%l7 + 0x34],	%g6
	movle	%icc,	%o3,	%i2
	st	%f2,	[%l7 + 0x20]
	std	%i6,	[%l7 + 0x30]
	ldsw	[%l7 + 0x1C],	%l5
	stx	%o0,	[%l7 + 0x60]
	bcc	%icc,	loop_37
	taddcctv	%o6,	0x12A0,	%l4
	swap	[%l7 + 0x28],	%g4
	st	%f24,	[%l7 + 0x10]
loop_37:
	stw	%o2,	[%l7 + 0x3C]
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x11,	%l0
	flush	%l7 + 0x5C
	ldstub	[%l7 + 0x7D],	%l2
	sth	%o5,	[%l7 + 0x1C]
	stw	%o4,	[%l7 + 0x4C]
	lduw	[%l7 + 0x74],	%g7
	ldstub	[%l7 + 0x3B],	%i0
	flush	%l7 + 0x10
	popc	0x0CAF,	%i3
	udivcc	%i4,	0x0A7D,	%g3
	ldstub	[%l7 + 0x56],	%o1
	lduw	[%l7 + 0x44],	%i1
	lduh	[%l7 + 0x44],	%l1
	tleu	%xcc,	0x7
	edge16l	%g1,	%i5,	%l6
	ldub	[%l7 + 0x0C],	%i6
	wr	%g0,	0x1d,	%asi
	stxa	%l3,	[%l7 + 0x10] %asi
	stbar
	sth	%o7,	[%l7 + 0x3E]
	lduh	[%l7 + 0x24],	%g5
	swap	[%l7 + 0x5C],	%g6
	ldx	[%l7 + 0x08],	%g2
	ldd	[%l7 + 0x70],	%i2
	st	%f14,	[%l7 + 0x2C]
	mulscc	%i7,	0x0A02,	%o3
	ldsw	[%l7 + 0x68],	%o0
	movvc	%icc,	%l5,	%l4
	subccc	%g4,	%o2,	%l0
	ld	[%l7 + 0x78],	%f23
	ldub	[%l7 + 0x46],	%o6
	ldd	[%l7 + 0x58],	%f30
	flush	%l7 + 0x74
	ldub	[%l7 + 0x29],	%o5
	stbar
	xnor	%l2,	0x1241,	%o4
	std	%i0,	[%l7 + 0x68]
	lduw	[%l7 + 0x38],	%g7
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	set	0x0, %i2
	stxa	%i3,	[%g0 + %i2] 0x57
	ldd	[%l7 + 0x58],	%g2
	move	%xcc,	%i4,	%i1
	sllx	%l1,	%g1,	%i5
	ldx	[%l7 + 0x08],	%o1
	std	%i6,	[%l7 + 0x28]
	flush	%l7 + 0x1C
	movneg	%icc,	%l3,	%l6
	membar	0x6C
	std	%f18,	[%l7 + 0x50]
	lduw	[%l7 + 0x18],	%g5
	stx	%g6,	[%l7 + 0x30]
	fmovsg	%icc,	%f19,	%f23
	flush	%l7 + 0x4C
	fmovrdlz	%o7,	%f14,	%f28
	set	0x78, %o7
	stxa	%i2,	[%l7 + %o7] 0x2a
	membar	#Sync
	ldd	[%l7 + 0x78],	%f6
	st	%f2,	[%l7 + 0x6C]
	udivcc	%i7,	0x0C8A,	%o3
	prefetch	[%l7 + 0x64],	 0x2
	ldsb	[%l7 + 0x47],	%o0
	std	%g2,	[%l7 + 0x50]
	swap	[%l7 + 0x20],	%l5
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%g4
	lduh	[%l7 + 0x64],	%l4
	lduw	[%l7 + 0x20],	%l0
	xnor	%o2,	0x1BF7,	%o6
	bcc,a,pn	%icc,	loop_38
	swap	[%l7 + 0x50],	%o5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	stxa	%l2,	[%g0 + 0x0] %asi
loop_38:
	prefetch	[%l7 + 0x7C],	 0x2
	ldsb	[%l7 + 0x62],	%i0
	ldsh	[%l7 + 0x20],	%g7
	xnorcc	%o4,	%i3,	%g3
	stb	%i1,	[%l7 + 0x77]
	ldub	[%l7 + 0x57],	%l1
	wr	%g0,	0x88,	%asi
	stxa	%i4,	[%l7 + 0x40] %asi
	ldub	[%l7 + 0x45],	%i5
	stw	%o1,	[%l7 + 0x08]
	ldsh	[%l7 + 0x38],	%g1
	ldub	[%l7 + 0x0E],	%i6
	lduw	[%l7 + 0x2C],	%l3
	rdhpr	%htba,	%l6
	st	%f0,	[%l7 + 0x60]
	and	%g6,	0x10F0,	%g5
	ld	[%l7 + 0x38],	%f27
	stx	%o7,	[%l7 + 0x58]
	subcc	%i7,	0x0609,	%o3
	sth	%i2,	[%l7 + 0x78]
	stb	%o0,	[%l7 + 0x1B]
	stb	%g2,	[%l7 + 0x59]
	ldx	[%l7 + 0x78],	%l5
	stx	%g4,	[%l7 + 0x60]
	udiv	%l0,	0x0AB8,	%l4
	lduw	[%l7 + 0x4C],	%o2
	ldd	[%l7 + 0x50],	%o6
	ld	[%l7 + 0x34],	%f26
	ldstub	[%l7 + 0x11],	%o5
	stb	%l2,	[%l7 + 0x4F]
	stw	%g7,	[%l7 + 0x70]
	sth	%o4,	[%l7 + 0x12]
	flush	%l7 + 0x74
	fmovsne	%icc,	%f3,	%f21
	sth	%i0,	[%l7 + 0x38]
	st	%f16,	[%l7 + 0x2C]
	fmovdn	%xcc,	%f8,	%f24
	std	%f30,	[%l7 + 0x40]
	st	%f25,	[%l7 + 0x74]
	sth	%g3,	[%l7 + 0x0E]
	ldub	[%l7 + 0x39],	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	rdhpr	%hsys_tick_cmpr,	%i1
	movle	%icc,	%i4,	%l1
	nop
	set	0x68, %o2
	stw	%o1,	[%l7 + %o2]
	sth	%g1,	[%l7 + 0x5E]
	ldx	[%l7 + 0x60],	%i6
	ldd	[%l7 + 0x38],	%f4
	movle	%xcc,	%l3,	%i5
	ld	[%l7 + 0x58],	%f15
	sethi	0x1581,	%l6
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%g6
	ldx	[%l7 + 0x20],	%o7
	swap	[%l7 + 0x4C],	%i7
	ldd	[%l7 + 0x18],	%g4
	std	%o2,	[%l7 + 0x18]
	nop
	set	0x18, %o6
	stb	%i2,	[%l7 + %o6]
	ldsw	[%l7 + 0x10],	%o0
	andncc	%l5,	%g2,	%g4
	swap	[%l7 + 0x18],	%l4
	fones	%f6
	swap	[%l7 + 0x2C],	%o2
	prefetch	[%l7 + 0x30],	 0x1
	addc	%l0,	0x1940,	%o5
	flush	%l7 + 0x28
	udivx	%l2,	0x1BB4,	%o6
	ldsh	[%l7 + 0x6A],	%g7
	ldstub	[%l7 + 0x76],	%i0
	ldstub	[%l7 + 0x7D],	%o4
	ldsw	[%l7 + 0x4C],	%g3
	stb	%i3,	[%l7 + 0x4A]
	stb	%i1,	[%l7 + 0x14]
	wr	%i4,	%o1,	%sys_tick
	sth	%g1,	[%l7 + 0x16]
	lduh	[%l7 + 0x7E],	%l1
	ldstub	[%l7 + 0x1C],	%i6
	ldd	[%l7 + 0x48],	%f30
	ldd	[%l7 + 0x68],	%f16
	taddcctv	%i5,	0x00E6,	%l3
	sth	%g6,	[%l7 + 0x48]
	set	0x38, %o3
	stxa	%o7,	[%l7 + %o3] 0x19
	ldsb	[%l7 + 0x77],	%i7
	stbar
	lduh	[%l7 + 0x2E],	%g5
	ldsw	[%l7 + 0x2C],	%o3
	movne	%xcc,	%l6,	%o0
	lduw	[%l7 + 0x0C],	%l5
	stx	%g2,	[%l7 + 0x68]
	fexpand	%f21,	%f0
	prefetch	[%l7 + 0x58],	 0x2
	nop
	set	0x6C, %o1
	prefetch	[%l7 + %o1],	 0x0
	stbar
	tcs	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i2
	ldx	[%l7 + 0x08],	%l4
	stx	%g4,	[%l7 + 0x20]
	stx	%o2,	[%l7 + 0x60]
	ldub	[%l7 + 0x12],	%l0
	ldsb	[%l7 + 0x17],	%l2
	umul	%o6,	0x1D41,	%o5
	ld	[%l7 + 0x1C],	%f26
	ldub	[%l7 + 0x35],	%g7
	fcmple16	%f10,	%f20,	%i0
	std	%f18,	[%l7 + 0x40]
	stbar
	ldx	[%l7 + 0x78],	%g3
	ldstub	[%l7 + 0x14],	%o4
	ldstub	[%l7 + 0x75],	%i3
	flush	%l7 + 0x54
	movne	%icc,	%i1,	%i4
	swap	[%l7 + 0x4C],	%o1
	ldsh	[%l7 + 0x34],	%g1
	stw	%l1,	[%l7 + 0x44]
	alignaddr	%i6,	%l3,	%i5
	ldx	[%l7 + 0x78],	%g6
	fbg	%fcc3,	loop_39
	subcc	%o7,	0x0CFA,	%g5
	ldsw	[%l7 + 0x70],	%o3
	ldx	[%l7 + 0x70],	%i7
loop_39:
	stw	%l6,	[%l7 + 0x5C]
	prefetch	[%l7 + 0x08],	 0x0
	fnands	%f20,	%f22,	%f3
	ldub	[%l7 + 0x1F],	%o0
	movleu	%icc,	%g2,	%l5
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x1c,	%l4
	taddcc	%i2,	%g4,	%l0
	rdpr	%otherwin,	%o2
	ldub	[%l7 + 0x3C],	%l2
	tg	%xcc,	0x7
	fble,a	%fcc2,	loop_40
	swap	[%l7 + 0x14],	%o6
	ldsh	[%l7 + 0x3C],	%g7
	tg	%icc,	0x2
loop_40:
	edge8	%i0,	%g3,	%o5
	std	%o4,	[%l7 + 0x58]
	fcmpne32	%f6,	%f6,	%i1
	nop
	set	0x78, %i7
	ldsh	[%l7 + %i7],	%i3
	rd	%tick_cmpr,	%i4
	stbar
	ld	[%l7 + 0x24],	%f31
	fpack16	%f2,	%f14
	ldd	[%l7 + 0x30],	%f10
	umulcc	%o1,	%l1,	%i6
	swap	[%l7 + 0x6C],	%g1
	ldsh	[%l7 + 0x16],	%i5
	stb	%g6,	[%l7 + 0x0F]
	brz,a	%l3,	loop_41
	flush	%l7 + 0x2C
	nop
	set	0x78, %l2
	std	%g4,	[%l7 + %l2]
	bne,a	loop_42
loop_41:
	ldub	[%l7 + 0x4B],	%o7
	std	%i6,	[%l7 + 0x58]
	bne,a	loop_43
loop_42:
	swap	[%l7 + 0x3C],	%o3
	fandnot1s	%f5,	%f27,	%f11
	sth	%l6,	[%l7 + 0x42]
loop_43:
	stb	%g2,	[%l7 + 0x3E]
	bvc	loop_44
	ld	[%l7 + 0x6C],	%f24
	nop
	set	0x70, %l4
	std	%f14,	[%l7 + %l4]
	prefetch	[%l7 + 0x78],	 0x0
loop_44:
	lduh	[%l7 + 0x0E],	%l5
	lduh	[%l7 + 0x38],	%o0
	ldsw	[%l7 + 0x20],	%l4
	swap	[%l7 + 0x54],	%i2
	stbar
	movneg	%xcc,	%g4,	%l0
	ldsw	[%l7 + 0x68],	%o2
	std	%l2,	[%l7 + 0x50]
	swap	[%l7 + 0x6C],	%g7
	nop
	set	0x52, %l1
	lduh	[%l7 + %l1],	%i0
	lduw	[%l7 + 0x14],	%g3
	fmovse	%icc,	%f16,	%f25
	nop
	set	0x62, %g2
	ldsh	[%l7 + %g2],	%o5
	edge32n	%o4,	%o6,	%i3
	alignaddr	%i1,	%o1,	%i4
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 0x0
	fbge	%fcc2,	loop_45
	tn	%xcc,	0x6
	flush	%l7 + 0x1C
	lduw	[%l7 + 0x48],	%i6
loop_45:
	fcmple16	%f20,	%f12,	%l1
	fblg	%fcc2,	loop_46
	swap	[%l7 + 0x6C],	%g1
	st	%f12,	[%l7 + 0x6C]
	ldsb	[%l7 + 0x60],	%g6
loop_46:
	tne	%xcc,	0x2
	stx	%i5,	[%l7 + 0x40]
	ldx	[%l7 + 0x78],	%g5
	fcmpes	%fcc1,	%f15,	%f18
	st	%f19,	[%l7 + 0x6C]
	tcs	%xcc,	0x3
	ldsw	[%l7 + 0x68],	%l3
	ld	[%l7 + 0x50],	%f14
	ldsb	[%l7 + 0x16],	%i7
	ldub	[%l7 + 0x14],	%o3
	popc	0x114D,	%o7
	std	%f26,	[%l7 + 0x58]
	fors	%f30,	%f1,	%f6
	ldx	[%l7 + 0x50],	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l5
	stbar
	ldsw	[%l7 + 0x70],	%o0
	nop
	set	0x38, %g7
	sth	%g2,	[%l7 + %g7]
	bleu,pn	%xcc,	loop_47
	stb	%i2,	[%l7 + 0x32]
	rd	%tick_cmpr,	%g4
	wr	%g0,	0x1d,	%asi
	stxa	%l0,	[%l7 + 0x08] %asi
loop_47:
	stw	%l4,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x7C],	%o2
	ld	[%l7 + 0x08],	%f0
	sth	%l2,	[%l7 + 0x48]
	ldsb	[%l7 + 0x3E],	%g7
	movl	%icc,	%i0,	%g3
	ldstub	[%l7 + 0x10],	%o5
	ldsh	[%l7 + 0x2E],	%o4
	srl	%i3,	0x0A,	%o6
	andn	%i1,	0x190E,	%o1
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%i6
	swap	[%l7 + 0x14],	%i4
	std	%f18,	[%l7 + 0x40]
	ldstub	[%l7 + 0x3C],	%g1
	sth	%g6,	[%l7 + 0x72]
	prefetch	[%l7 + 0x44],	 0x2
	ldsw	[%l7 + 0x40],	%l1
	ldsw	[%l7 + 0x1C],	%g5
	stx	%l3,	[%l7 + 0x18]
	st	%f23,	[%l7 + 0x50]
	std	%i6,	[%l7 + 0x40]
	ldsb	[%l7 + 0x61],	%i5
	sth	%o7,	[%l7 + 0x6E]
	fnot2	%f12,	%f22
	ldsh	[%l7 + 0x64],	%o3
	ldstub	[%l7 + 0x67],	%l5
	set	0x30, %g6
	stxa	%o0,	[%l7 + %g6] 0xeb
	membar	#Sync
	stbar
	flush	%l7 + 0x20
	ldx	[%l7 + 0x28],	%l6
	set	0x68, %i0
	stxa	%i2,	[%l7 + %i0] 0x04
	mulscc	%g4,	%g2,	%l0
	ldsb	[%l7 + 0x54],	%o2
	ldsb	[%l7 + 0x2A],	%l2
	stb	%l4,	[%l7 + 0x6D]
	flush	%l7 + 0x14
	flush	%l7 + 0x10
	ldd	[%l7 + 0x60],	%f8
	fmovscs	%icc,	%f18,	%f8
	set	0x10, %i5
	ldxa	[%l7 + %i5] 0x81,	%i0
	ldsb	[%l7 + 0x75],	%g7
	tcs	%icc,	0x3
	umul	%o5,	%o4,	%g3
	prefetch	[%l7 + 0x64],	 0x1
	ldd	[%l7 + 0x18],	%i2
	st	%f14,	[%l7 + 0x08]
	brlez	%i1,	loop_48
	lduw	[%l7 + 0x38],	%o1
	ble	loop_49
	stb	%i6,	[%l7 + 0x10]
loop_48:
	ldx	[%l7 + 0x08],	%o6
	flush	%l7 + 0x1C
loop_49:
	std	%i4,	[%l7 + 0x28]
	st	%f15,	[%l7 + 0x1C]
	ldsb	[%l7 + 0x08],	%g6
	ldsh	[%l7 + 0x4C],	%g1
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x14,	%g5
	nop
	set	0x64, %l5
	stb	%l1,	[%l7 + %l5]
	edge8ln	%l3,	%i7,	%i5
	stw	%o7,	[%l7 + 0x40]
	std	%o2,	[%l7 + 0x68]
	lduh	[%l7 + 0x6E],	%l5
	stw	%o0,	[%l7 + 0x5C]
	lduh	[%l7 + 0x42],	%l6
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g4
	flush	%l7 + 0x64
	sth	%i2,	[%l7 + 0x2C]
	edge8n	%l0,	%o2,	%g2
	bleu	loop_50
	stx	%l2,	[%l7 + 0x30]
	fcmpd	%fcc3,	%f28,	%f26
	ld	[%l7 + 0x4C],	%f18
loop_50:
	std	%i0,	[%l7 + 0x18]
	stx	%l4,	[%l7 + 0x48]
	ldd	[%l7 + 0x68],	%g6
	stw	%o5,	[%l7 + 0x08]
	sub	%g3,	0x0B8B,	%o4
	wr	%g0,	0x1d,	%asi
	stxa	%i1,	[%l7 + 0x28] %asi
	stw	%o1,	[%l7 + 0x74]
	fpsub32s	%f23,	%f31,	%f18
	stw	%i3,	[%l7 + 0x78]
	ldub	[%l7 + 0x5C],	%i6
	be,a,pt	%xcc,	loop_51
	fbne,a	%fcc2,	loop_52
	lduh	[%l7 + 0x66],	%i4
	ldd	[%l7 + 0x60],	%f28
loop_51:
	st	%f21,	[%l7 + 0x24]
loop_52:
	ldsw	[%l7 + 0x68],	%g6
	edge8	%g1,	%g5,	%o6
	ldsw	[%l7 + 0x7C],	%l1
	stw	%l3,	[%l7 + 0x6C]
	ldd	[%l7 + 0x78],	%f2
	std	%i6,	[%l7 + 0x30]
	ldx	[%l7 + 0x68],	%o7
	sir	0x1BEE
	movge	%xcc,	%i5,	%l5
	nop
	set	0x3C, %i4
	ldstub	[%l7 + %i4],	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%o3,	[%l7 + 0x5D]
	nop
	set	0x38, %g4
	lduw	[%l7 + %g4],	%g4
	brgz	%i2,	loop_53
	std	%o2,	[%l7 + 0x10]
	ld	[%l7 + 0x30],	%f20
	ldsh	[%l7 + 0x16],	%l0
loop_53:
	lduw	[%l7 + 0x4C],	%l2
	rd	%tick_cmpr,	%i0
	bleu,a,pt	%icc,	loop_54
	nop
	set	0x78, %i3
	lduh	[%l7 + %i3],	%l4
	alignaddrl	%g7,	%o5,	%g3
	stw	%o4,	[%l7 + 0x2C]
loop_54:
	sethi	0x018F,	%i1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %o0
	stxa	%o1,	[%g0 + %o0] 0x4f
	st	%f27,	[%l7 + 0x54]
	ldsb	[%l7 + 0x4A],	%i3
	ldstub	[%l7 + 0x43],	%g2
	st	%f25,	[%l7 + 0x20]
	rdpr	%pil,	%i6
	flush	%l7 + 0x14
	ldx	[%l7 + 0x40],	%g6
	std	%g0,	[%l7 + 0x58]
	nop
	set	0x25, %g1
	ldstub	[%l7 + %g1],	%i4
	nop
	setx loop_55, %l0, %l1
	jmpl %l1, %o6
	ldd	[%l7 + 0x58],	%g4
	fbug	%fcc2,	loop_56
	ldstub	[%l7 + 0x6D],	%l1
loop_55:
	stb	%i7,	[%l7 + 0x38]
	std	%f2,	[%l7 + 0x78]
loop_56:
	fbule	%fcc1,	loop_57
	fmovdn	%xcc,	%f19,	%f17
	nop
	set	0x65, %l6
	ldub	[%l7 + %l6],	%o7
	ldub	[%l7 + 0x78],	%i5
loop_57:
	fbl,a	%fcc3,	loop_58
	bleu,pn	%xcc,	loop_59
	flush	%l7 + 0x08
	ldub	[%l7 + 0x4C],	%l5
loop_58:
	ldsb	[%l7 + 0x34],	%o0
loop_59:
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%l6
	ldd	[%l7 + 0x40],	%f26
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f14
	ld	[%l7 + 0x7C],	%f16
	fnot1	%f0,	%f8
	ldd	[%l7 + 0x50],	%o2
	flushw
	lduh	[%l7 + 0x4A],	%l3
	ldd	[%l7 + 0x30],	%f20
	movpos	%xcc,	%i2,	%o2
	ldub	[%l7 + 0x7D],	%g4
	sth	%l0,	[%l7 + 0x6C]
	ldd	[%l7 + 0x30],	%l2
	sth	%l4,	[%l7 + 0x50]
	nop
	set	0x60, %o7
	stw	%g7,	[%l7 + %o7]
	stb	%o5,	[%l7 + 0x67]
	stbar
	std	%f16,	[%l7 + 0x30]
	ldstub	[%l7 + 0x53],	%i0
	stbar
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o4
	tcs	%icc,	0x2
	ldd	[%l7 + 0x38],	%f14
	stb	%g3,	[%l7 + 0x5E]
	sth	%o1,	[%l7 + 0x68]
	ldx	[%l7 + 0x78],	%i3
	movrgz	%i1,	%i6,	%g6
	smul	%g1,	0x0563,	%i4
	sdivx	%o6,	0x1A10,	%g2
	lduh	[%l7 + 0x20],	%l1
	ldub	[%l7 + 0x7F],	%i7
	fpadd16	%f10,	%f14,	%f30
	st	%f7,	[%l7 + 0x4C]
	wrpr	%o7,	0x12C7,	%cwp
	st	%f4,	[%l7 + 0x70]
	ldstub	[%l7 + 0x0D],	%g5
	prefetch	[%l7 + 0x3C],	 0x2
	fmovscs	%icc,	%f14,	%f24
	lduh	[%l7 + 0x66],	%i5
	stx	%o0,	[%l7 + 0x40]
	stb	%l5,	[%l7 + 0x47]
	ldub	[%l7 + 0x6E],	%o3
	nop
	set	0x30, %g5
	stx	%l3,	[%l7 + %g5]
	set	0x68, %o2
	ldxa	[%l7 + %o2] 0x18,	%l6
	ldsb	[%l7 + 0x64],	%o2
	sth	%i2,	[%l7 + 0x36]
	rd	%sys_tick_cmpr,	%l0
	st	%f18,	[%l7 + 0x4C]
	ldd	[%l7 + 0x30],	%g4
	std	%f16,	[%l7 + 0x38]
	flush	%l7 + 0x54
	std	%l4,	[%l7 + 0x58]
	stx	%l2,	[%l7 + 0x08]
	lduh	[%l7 + 0x10],	%o5
	lduw	[%l7 + 0x3C],	%g7
	ldd	[%l7 + 0x68],	%o4
	nop
	set	0x74, %o4
	ldstub	[%l7 + %o4],	%i0
	taddcctv	%o1,	%i3,	%g3
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%i0
	swap	[%l7 + 0x2C],	%i6
	sth	%g6,	[%l7 + 0x64]
	st	%f26,	[%l7 + 0x0C]
	fornot2s	%f11,	%f0,	%f27
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x04,	%i4
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%g1
	swap	[%l7 + 0x44],	%g2
	flush	%l7 + 0x08
	rd	%fprs,	%o6
	ldub	[%l7 + 0x3F],	%l1
	lduh	[%l7 + 0x08],	%o7
	ldsw	[%l7 + 0x44],	%g5
	tg	%icc,	0x1
	ldsw	[%l7 + 0x64],	%i7
	ldstub	[%l7 + 0x79],	%i5
	std	%f8,	[%l7 + 0x38]
	ldx	[%l7 + 0x20],	%o0
	ldstub	[%l7 + 0x1E],	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x6C],	%l3
	stx	%l6,	[%l7 + 0x70]
	stw	%o3,	[%l7 + 0x0C]
	fpsub32	%f10,	%f2,	%f24
	stbar
	stw	%i2,	[%l7 + 0x38]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBBF, 	%hsys_tick_cmpr
	st	%f20,	[%l7 + 0x74]
	ldsw	[%l7 + 0x5C],	%l4
	nop
	set	0x50, %o5
	std	%f12,	[%l7 + %o5]
	ldd	[%l7 + 0x28],	%f6
	lduw	[%l7 + 0x44],	%g4
	ldsb	[%l7 + 0x1E],	%l2
	ldd	[%l7 + 0x08],	%o4
	flush	%l7 + 0x58
	sdiv	%o4,	0x0AD4,	%g7
	ldx	[%l7 + 0x38],	%o1
	stb	%i3,	[%l7 + 0x20]
	ld	[%l7 + 0x6C],	%f28
	swap	[%l7 + 0x30],	%i0
	stx	%i1,	[%l7 + 0x40]
	ldsb	[%l7 + 0x6D],	%g3
	swap	[%l7 + 0x18],	%i6
	bge,a	%icc,	loop_60
	prefetch	[%l7 + 0x60],	 0x2
	ldd	[%l7 + 0x30],	%g6
	ldsh	[%l7 + 0x36],	%g1
loop_60:
	ldsb	[%l7 + 0x5A],	%g2
	movg	%xcc,	%o6,	%l1
	std	%f18,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %i7
	ldxa	[%g0 + %i7] 0x50,	%o7
	edge16	%g5,	%i7,	%i4
	ld	[%l7 + 0x78],	%f6
	ldsh	[%l7 + 0x08],	%o0
	std	%i4,	[%l7 + 0x38]
	fpadd16	%f16,	%f12,	%f26
	flush	%l7 + 0x38
	subc	%l5,	0x1BB4,	%l6
	ldd	[%l7 + 0x78],	%f8
	stb	%l3,	[%l7 + 0x0A]
	std	%o2,	[%l7 + 0x30]
	wrpr	%o2,	0x10D0,	%pil
	ldsw	[%l7 + 0x64],	%l0
	ld	[%l7 + 0x6C],	%f15
	flush	%l7 + 0x14
	sth	%i2,	[%l7 + 0x38]
	stw	%l4,	[%l7 + 0x18]
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x18,	%l2
	ldd	[%l7 + 0x48],	%g4
	swap	[%l7 + 0x4C],	%o5
	std	%g6,	[%l7 + 0x48]
	bpos,pn	%xcc,	loop_61
	ldd	[%l7 + 0x68],	%o0
	taddcc	%o4,	0x1D5A,	%i3
	rdpr	%otherwin,	%i0
loop_61:
	ldx	[%l7 + 0x40],	%i1
	sdiv	%g3,	0x0F87,	%g6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
	movg	%xcc,	%g2,	%o6
	stbar
	ldsw	[%l7 + 0x70],	%g1
	std	%f8,	[%l7 + 0x60]
	udivcc	%l1,	0x0734,	%g5
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%i7
	std	%i4,	[%l7 + 0x68]
	stbar
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%o7
	sth	%i5,	[%l7 + 0x22]
	rdhpr	%hsys_tick_cmpr,	%o0
	ldsw	[%l7 + 0x58],	%l5
	tge	%xcc,	0x4
	ldx	[%l7 + 0x08],	%l6
	stbar
	std	%f26,	[%l7 + 0x28]
	st	%f6,	[%l7 + 0x58]
	rd	%pc,	%l3
	prefetch	[%l7 + 0x60],	 0x0
	flush	%l7 + 0x68
	ldd	[%l7 + 0x30],	%o2
	nop
	set	0x2A, %l1
	sth	%o3,	[%l7 + %l1]
	set	0x78, %l0
	stxa	%i2,	[%l7 + %l0] 0xea
	membar	#Sync
	ldx	[%l7 + 0x30],	%l4
	set	0x58, %g7
	stxa	%l0,	[%l7 + %g7] 0x18
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %g2
	ldxa	[%g0 + %g2] 0x50,	%l2
	ldstub	[%l7 + 0x5F],	%g4
	fxnors	%f2,	%f2,	%f3
	wr	%g0,	0x22,	%asi
	stxa	%o5,	[%l7 + 0x40] %asi
	membar	#Sync
	flush	%l7 + 0x0C
	std	%f10,	[%l7 + 0x38]
	sth	%o1,	[%l7 + 0x66]
	ld	[%l7 + 0x28],	%f21
	stb	%g7,	[%l7 + 0x4F]
	ldsb	[%l7 + 0x76],	%i3
	subccc	%i0,	%i1,	%g3
	flush	%l7 + 0x74
	stw	%g6,	[%l7 + 0x44]
	ldsb	[%l7 + 0x16],	%i6
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%g2
	ldsh	[%l7 + 0x1C],	%o4
	ldsh	[%l7 + 0x0E],	%g1
	st	%f10,	[%l7 + 0x78]
	stb	%l1,	[%l7 + 0x0D]
	ldsh	[%l7 + 0x5C],	%o6
	lduw	[%l7 + 0x68],	%i7
	edge32	%i4,	%o7,	%g5
	ldd	[%l7 + 0x78],	%f16
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	wr	%g0,	0x21,	%asi
	stxa	%o0,	[%g0 + 0x108] %asi
	set	0x60, %i0
	stxa	%i5,	[%l7 + %i0] 0x1d
	lduh	[%l7 + 0x62],	%l6
	ldsb	[%l7 + 0x68],	%l5
	stw	%o2,	[%l7 + 0x74]
	lduh	[%l7 + 0x5E],	%l3
	nop
	set	0x79, %i5
	ldstub	[%l7 + %i5],	%i2
	nop
	set	0x38, %i6
	ldsw	[%l7 + %i6],	%l4
	ld	[%l7 + 0x14],	%f31
	ldstub	[%l7 + 0x71],	%l0
	fmovd	%f4,	%f20
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f20
	nop
	set	0x58, %l5
	lduh	[%l7 + %l5],	%o3
	ldd	[%l7 + 0x60],	%g4
	edge32l	%l2,	%o5,	%o1
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x30
	set	0x30, %g4
	ldxa	[%g0 + %g4] 0x50,	%g7
	stx	%i0,	[%l7 + 0x08]
	ldsw	[%l7 + 0x70],	%i3
	ldd	[%l7 + 0x58],	%f2
	stx	%i1,	[%l7 + 0x50]
	swap	[%l7 + 0x44],	%g3
	rd	%fprs,	%i6
	stb	%g6,	[%l7 + 0x72]
	sth	%o4,	[%l7 + 0x1C]
	ldub	[%l7 + 0x7D],	%g1
	ldx	[%l7 + 0x58],	%l1
	ldstub	[%l7 + 0x25],	%o6
	st	%f19,	[%l7 + 0x40]
	lduw	[%l7 + 0x68],	%i7
	ldd	[%l7 + 0x28],	%f12
	ldx	[%l7 + 0x08],	%i4
	swap	[%l7 + 0x70],	%o7
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%g5
	st	%f16,	[%l7 + 0x08]
	tneg	%xcc,	0x4
	std	%f28,	[%l7 + 0x18]
	rdpr	%otherwin,	%g2
	ldsb	[%l7 + 0x59],	%o0
	ldsh	[%l7 + 0x6E],	%i5
	flush	%l7 + 0x2C
	stbar
	lduw	[%l7 + 0x20],	%l5
	std	%f30,	[%l7 + 0x58]
	ldsb	[%l7 + 0x7A],	%o2
	std	%f18,	[%l7 + 0x20]
	ldub	[%l7 + 0x45],	%l3
	lduh	[%l7 + 0x42],	%l6
	stbar
	ldx	[%l7 + 0x70],	%l4
	lduh	[%l7 + 0x40],	%l0
	ldd	[%l7 + 0x48],	%f12
        wr    %g0,    0xe,    %pcr    ! changed.
	stx	%g4,	[%l7 + 0x50]
	nop
	set	0x3A, %o0
	sth	%o5,	[%l7 + %o0]
	set	0x48, %g1
	stxa	%l2,	[%l7 + %g1] 0x10
	st	%f0,	[%l7 + 0x20]
	sth	%g7,	[%l7 + 0x1E]
	sth	%i0,	[%l7 + 0x18]
	stbar
	lduw	[%l7 + 0x1C],	%i3
	stw	%i1,	[%l7 + 0x44]
	stx	%o1,	[%l7 + 0x68]
	ldx	[%l7 + 0x78],	%i6
	movcc	%xcc,	%g6,	%o4
	mulscc	%g1,	%g3,	%o6
	umul	%l1,	0x1350,	%i7
	lduw	[%l7 + 0x4C],	%i4
	stb	%o7,	[%l7 + 0x67]
	swap	[%l7 + 0x6C],	%g5
	taddcctv	%g2,	0x1D80,	%o0
	sth	%l5,	[%l7 + 0x46]
	sth	%o2,	[%l7 + 0x54]
	movl	%xcc,	%i5,	%l3
	umul	%l4,	%l0,	%l6
	movvs	%xcc,	%o3,	%g4
	std	%f10,	[%l7 + 0x58]
	std	%f26,	[%l7 + 0x40]
	ldsw	[%l7 + 0x10],	%o5
	prefetch	[%l7 + 0x70],	 0x0
	std	%f2,	[%l7 + 0x60]
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%f20
	ldsb	[%l7 + 0x29],	%l2
	swap	[%l7 + 0x50],	%i2
	sth	%i0,	[%l7 + 0x56]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x0C
	stbar
	std	%f24,	[%l7 + 0x58]
	ldd	[%l7 + 0x78],	%f6
	movpos	%icc,	%g7,	%i3
	swap	[%l7 + 0x78],	%i1
	stw	%i6,	[%l7 + 0x40]
	edge8l	%g6,	%o4,	%g1
	umul	%g3,	0x0B41,	%o1
	sth	%o6,	[%l7 + 0x12]
	std	%i6,	[%l7 + 0x18]
	wr	%i4,	%o7,	%pic
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%g5,	[%g0 + 0x8] %asi
	stw	%g2,	[%l7 + 0x54]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o0
	ld	[%l7 + 0x70],	%f30
	ldsw	[%l7 + 0x18],	%l5
	ld	[%l7 + 0x28],	%f31
	stw	%o2,	[%l7 + 0x1C]
	stw	%i5,	[%l7 + 0x7C]
	set	0x68, %l6
	stxa	%l1,	[%l7 + %l6] 0x23
	membar	#Sync
	tle	%icc,	0x3
	ldub	[%l7 + 0x23],	%l3
	lduw	[%l7 + 0x14],	%l0
	lduh	[%l7 + 0x1A],	%l6
	swap	[%l7 + 0x10],	%l4
	movrlz	%g4,	%o5,	%l2
	std	%f16,	[%l7 + 0x30]
	fmovs	%f23,	%f25
	ldx	[%l7 + 0x18],	%i2
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f4
	set	0x68, %i2
	stxa	%o3,	[%l7 + %i2] 0x2a
	membar	#Sync
	stbar
	ldsb	[%l7 + 0x5C],	%g7
	stw	%i0,	[%l7 + 0x40]
	st	%f8,	[%l7 + 0x60]
	swap	[%l7 + 0x18],	%i3
	ldstub	[%l7 + 0x10],	%i6
	stbar
	ld	[%l7 + 0x34],	%f28
	fmovrsne	%i1,	%f9,	%f26
	stbar
	ldub	[%l7 + 0x70],	%o4
	ldsb	[%l7 + 0x5B],	%g1
	swap	[%l7 + 0x18],	%g6
	flush	%l7 + 0x08
	stx	%o1,	[%l7 + 0x30]
	brnz,a	%g3,	loop_62
	prefetch	[%l7 + 0x44],	 0x2
	ldsh	[%l7 + 0x7E],	%o6
	stbar
loop_62:
	ldstub	[%l7 + 0x46],	%i7
	ldsb	[%l7 + 0x6D],	%i4
	ldx	[%l7 + 0x18],	%g5
	ldsw	[%l7 + 0x54],	%g2
	lduw	[%l7 + 0x08],	%o7
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o0
	ldd	[%l7 + 0x40],	%l4
	tle	%icc,	0x0
	ldsh	[%l7 + 0x5E],	%o2
	ldsw	[%l7 + 0x78],	%l1
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %g5
	stxa	%i5,	[%g0 + %g5] 0x5f
	fmovsne	%icc,	%f27,	%f30
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l0
	or	%l3,	%l4,	%l6
	prefetch	[%l7 + 0x6C],	 0x1
	ld	[%l7 + 0x6C],	%f7
	ld	[%l7 + 0x54],	%f23
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x10,	%o5
	ldd	[%l7 + 0x78],	%g4
	prefetch	[%l7 + 0x10],	 0x0
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f26
	stbar
	set	0x48, %o2
	stxa	%l2,	[%l7 + %o2] 0x27
	membar	#Sync
	stbar
	fbuge	%fcc1,	loop_63
	sth	%i2,	[%l7 + 0x74]
	ld	[%l7 + 0x14],	%f0
	swap	[%l7 + 0x38],	%o3
loop_63:
	ldx	[%l7 + 0x28],	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x422, 	%hsys_tick_cmpr
	ldx	[%l7 + 0x50],	%i0
	sth	%i1,	[%l7 + 0x5E]
	stw	%o4,	[%l7 + 0x5C]
	movl	%icc,	%g6,	%o1
	rdhpr	%hsys_tick_cmpr,	%g3
	lduw	[%l7 + 0x60],	%o6
	umulcc	%g1,	0x078C,	%i4
	ldub	[%l7 + 0x45],	%g5
	te	%xcc,	0x2
	ldstub	[%l7 + 0x6E],	%g2
	flush	%l7 + 0x34
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f4
	bneg,a,pt	%icc,	loop_64
	ldsb	[%l7 + 0x20],	%o7
	ldstub	[%l7 + 0x37],	%i7
	ldsb	[%l7 + 0x4E],	%l5
loop_64:
	ldstub	[%l7 + 0x46],	%o0
	ld	[%l7 + 0x34],	%f14
	st	%f11,	[%l7 + 0x54]
	stw	%l1,	[%l7 + 0x40]
	ldsw	[%l7 + 0x6C],	%o2
	nop
	set	0x7C, %o3
	ldsw	[%l7 + %o3],	%i5
	nop
	set	0x32, %o5
	ldsh	[%l7 + %o5],	%l3
	swap	[%l7 + 0x08],	%l4
	lduh	[%l7 + 0x60],	%l0
	movne	%icc,	%l6,	%o5
	lduw	[%l7 + 0x5C],	%l2
	lduw	[%l7 + 0x08],	%i2
	lduh	[%l7 + 0x60],	%o3
	prefetch	[%l7 + 0x0C],	 0x1
	std	%g6,	[%l7 + 0x40]
	movne	%xcc,	%i3,	%g4
	stw	%i0,	[%l7 + 0x44]
	brgz,a	%i6,	loop_65
	st	%f31,	[%l7 + 0x28]
	ldsh	[%l7 + 0x1C],	%o4
	prefetch	[%l7 + 0x78],	 0x2
loop_65:
	flush	%l7 + 0x70
	swap	[%l7 + 0x78],	%g6
	movvc	%icc,	%i1,	%g3
	stx	%o6,	[%l7 + 0x20]
	ldub	[%l7 + 0x3F],	%g1
	stx	%i4,	[%l7 + 0x58]
	lduw	[%l7 + 0x78],	%g5
	std	%g2,	[%l7 + 0x38]
	stb	%o1,	[%l7 + 0x16]
	tleu	%xcc,	0x3
	ldstub	[%l7 + 0x5A],	%o7
	lduh	[%l7 + 0x54],	%l5
	std	%f26,	[%l7 + 0x48]
	addc	%i7,	0x080F,	%o0
	st	%f15,	[%l7 + 0x08]
	rd	%asi,	%l1
	stb	%o2,	[%l7 + 0x18]
	std	%i4,	[%l7 + 0x40]
	flush	%l7 + 0x28
	bn,a	loop_66
	smulcc	%l3,	0x0FA4,	%l0
	stbar
	ldsw	[%l7 + 0x10],	%l4
loop_66:
	popc	%o5,	%l2
	set	0x60, %i7
	stxa	%l6,	[%l7 + %i7] 0x27
	membar	#Sync
	ldsb	[%l7 + 0x7B],	%i2
	mulscc	%g7,	0x022E,	%o3
	swap	[%l7 + 0x0C],	%g4
	nop
	set	0x41, %o1
	ldub	[%l7 + %o1],	%i0
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i6
	sth	%i3,	[%l7 + 0x52]
	std	%o4,	[%l7 + 0x18]
	stw	%i1,	[%l7 + 0x7C]
	stb	%g6,	[%l7 + 0x5B]
	swap	[%l7 + 0x34],	%g3
	ldd	[%l7 + 0x70],	%g0
	fcmpne16	%f24,	%f4,	%o6
	add	%g5,	0x05AD,	%g2
	tvs	%icc,	0x6
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 0x3
	ldsw	[%l7 + 0x44],	%i4
	prefetch	[%l7 + 0x0C],	 0x2
	ldsb	[%l7 + 0x3C],	%o1
	std	%f20,	[%l7 + 0x50]
	ldsw	[%l7 + 0x20],	%o7
	prefetch	[%l7 + 0x4C],	 0x2
	ldd	[%l7 + 0x18],	%i6
	sll	%l5,	%l1,	%o0
	nop
	set	0x40, %l2
	std	%f2,	[%l7 + %l2]
	fmovsa	%xcc,	%f15,	%f20
	stx	%i5,	[%l7 + 0x68]
	prefetch	[%l7 + 0x0C],	 0x1
	stbar
	ldsh	[%l7 + 0x54],	%l3
	ldub	[%l7 + 0x4B],	%o2
	fmul8ulx16	%f8,	%f22,	%f8
	nop
	set	0x1C, %l1
	lduh	[%l7 + %l1],	%l4
	ldd	[%l7 + 0x48],	%l0
	fmovrdlz	%l2,	%f14,	%f14
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %l4
	stxa	%o5,	[%g0 + %l4] 0x5f
	ld	[%l7 + 0x38],	%f25
	ldd	[%l7 + 0x30],	%f12
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %l0
	ldxa	[%g0 + %l0] 0x21,	%i2
	set	0x28, %g2
	stxa	%g7,	[%l7 + %g2] 0x23
	membar	#Sync
	wr	%o3,	0x1602,	%set_softint
	lduw	[%l7 + 0x34],	%g4
	std	%i6,	[%l7 + 0x50]
	ldub	[%l7 + 0x64],	%i6
	stw	%i3,	[%l7 + 0x58]
	wr	%g0,	0x88,	%asi
	stxa	%i0,	[%l7 + 0x58] %asi
	ldsw	[%l7 + 0x74],	%o4
	ld	[%l7 + 0x64],	%f12
	flush	%l7 + 0x10
	ldub	[%l7 + 0x74],	%i1
	stbar
	std	%g6,	[%l7 + 0x10]
	lduw	[%l7 + 0x1C],	%g1
	wr	%g0,	0x10,	%asi
	stxa	%o6,	[%l7 + 0x68] %asi
	movleu	%xcc,	%g3,	%g2
	ldub	[%l7 + 0x35],	%i4
	nop
	set	0x4C, %g6
	prefetch	[%l7 + %g6],	 0x2
	nop
	set	0x38, %i0
	lduw	[%l7 + %i0],	%g5
	st	%f6,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x128
	set	0x128, %i5
	nop 	! 	nop 	! 	ldxa	[%g0 + %i5] 0x40,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o1
	st	%f17,	[%l7 + 0x44]
	ldub	[%l7 + 0x4F],	%i7
	std	%f16,	[%l7 + 0x48]
	ldstub	[%l7 + 0x61],	%l1
	lduw	[%l7 + 0x3C],	%o0
	tsubcctv	%l5,	0x0946,	%l3
	stx	%o2,	[%l7 + 0x70]
	swap	[%l7 + 0x60],	%l4
	flush	%l7 + 0x64
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x88,	%l0
	edge8ln	%l2,	%o5,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x96C, 	%hsys_tick_cmpr
	sth	%o3,	[%l7 + 0x38]
	sth	%g4,	[%l7 + 0x42]
	fornot2	%f26,	%f0,	%f18
	ldub	[%l7 + 0x1C],	%l6
	tge	%xcc,	0x0
	fcmple16	%f24,	%f14,	%i2
	ld	[%l7 + 0x3C],	%f8
	sth	%i6,	[%l7 + 0x66]
	ldsb	[%l7 + 0x40],	%i3
	movne	%icc,	%i0,	%i1
	st	%f2,	[%l7 + 0x60]
	andn	%g6,	0x0235,	%g1
	lduw	[%l7 + 0x30],	%o6
	sra	%g3,	%g2,	%i4
	ldx	[%l7 + 0x18],	%o4
	lduh	[%l7 + 0x5C],	%g5
	stbar
	subc	%o7,	%i7,	%l1
	stb	%o0,	[%l7 + 0x31]
	ldd	[%l7 + 0x18],	%o0
	movleu	%xcc,	%l3,	%l5
	addccc	%l4,	0x0649,	%l0
	ldx	[%l7 + 0x48],	%l2
	rd	%fprs,	%o5
	sth	%o2,	[%l7 + 0x4E]
	ldsh	[%l7 + 0x62],	%g7
	flush	%l7 + 0x20
	swap	[%l7 + 0x28],	%i5
	tpos	%icc,	0x2
	lduw	[%l7 + 0x4C],	%g4
	umul	%o3,	%l6,	%i2
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x14,	%i3
	or	%i0,	0x1F8B,	%i1
	st	%f5,	[%l7 + 0x44]
	stx	%i6,	[%l7 + 0x18]
	rdhpr	%hintp,	%g6
	movrlz	%g1,	0x02F,	%g3
	flush	%l7 + 0x78
	ldub	[%l7 + 0x32],	%o6
	ld	[%l7 + 0x08],	%f4
	ldsh	[%l7 + 0x38],	%i4
	ldsb	[%l7 + 0x4D],	%g2
	ldd	[%l7 + 0x18],	%f18
	st	%f19,	[%l7 + 0x78]
	ldub	[%l7 + 0x73],	%o4
	stw	%g5,	[%l7 + 0x30]
	ldsh	[%l7 + 0x6C],	%i7
	tsubcctv	%o7,	%l1,	%o0
	swap	[%l7 + 0x3C],	%o1
	ldsh	[%l7 + 0x26],	%l5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %l5
	ldxa	[%g0 + %l5] 0x21,	%l3
	ldstub	[%l7 + 0x7B],	%l4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %i1
	ldxa	[%g0 + %i1] 0x4f,	%l2
	ldsb	[%l7 + 0x2F],	%o5
	movpos	%xcc,	%o2,	%l0
	lduh	[%l7 + 0x46],	%i5
	prefetch	[%l7 + 0x38],	 0x2
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x320
	set	0x320, %i4
	nop 	! 	stxa	%g4,	[%g0 + %i4] 0x40 ripped by fixASI40.pl
	srlx	%g7,	%l6,	%i2
	stx	%o3,	[%l7 + 0x68]
	ld	[%l7 + 0x24],	%f24
	prefetch	[%l7 + 0x28],	 0x2
	std	%f20,	[%l7 + 0x50]
	tsubcc	%i0,	%i3,	%i6
	fble	%fcc3,	loop_67
	ldsw	[%l7 + 0x14],	%g6
	flush	%l7 + 0x64
	ldx	[%l7 + 0x08],	%g1
loop_67:
	swap	[%l7 + 0x68],	%g3
	tne	%xcc,	0x1
	std	%f2,	[%l7 + 0x10]
	flush	%l7 + 0x78
	ldsh	[%l7 + 0x0C],	%o6
	std	%f8,	[%l7 + 0x08]
	rdpr	%cleanwin,	%i1
	stw	%i4,	[%l7 + 0x48]
	ta	%xcc,	0x5
	stw	%o4,	[%l7 + 0x14]
	brgez,a	%g5,	loop_68
	stbar
	ldsh	[%l7 + 0x6C],	%g2
	ldsw	[%l7 + 0x34],	%o7
loop_68:
	stw	%i7,	[%l7 + 0x44]
	sth	%l1,	[%l7 + 0x4E]
	ldd	[%l7 + 0x50],	%f14
	brlz	%o1,	loop_69
	std	%o0,	[%l7 + 0x08]
	ld	[%l7 + 0x60],	%f11
	set	0x48, %g4
	stxa	%l3,	[%l7 + %g4] 0xea
	membar	#Sync
loop_69:
	lduw	[%l7 + 0x1C],	%l4
	tne	%icc,	0x2
	ldub	[%l7 + 0x0D],	%l2
	std	%f10,	[%l7 + 0x50]
	std	%f10,	[%l7 + 0x58]
	movpos	%xcc,	%l5,	%o5
	stw	%l0,	[%l7 + 0x4C]
	wrpr	%i5,	%g4,	%pil
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%g6
	ldsb	[%l7 + 0x35],	%l6
	ldd	[%l7 + 0x50],	%i2
	std	%f14,	[%l7 + 0x38]
	lduw	[%l7 + 0x4C],	%o3
	andcc	%i0,	%i3,	%o2
	ldd	[%l7 + 0x58],	%i6
	st	%f9,	[%l7 + 0x0C]
	lduh	[%l7 + 0x64],	%g1
	movn	%xcc,	%g3,	%o6
	nop
	set	0x52, %i3
	ldsb	[%l7 + %i3],	%g6
	tneg	%xcc,	0x2
	movcc	%icc,	%i1,	%i4
	std	%g4,	[%l7 + 0x18]
	ldub	[%l7 + 0x68],	%g2
	flush	%l7 + 0x2C
	nop
	set	0x2E, %o0
	ldsb	[%l7 + %o0],	%o7
	ldd	[%l7 + 0x68],	%f10
	ld	[%l7 + 0x50],	%f27
	ldsw	[%l7 + 0x14],	%i7
	ldx	[%l7 + 0x68],	%l1
	andncc	%o4,	%o0,	%l3
	addcc	%l4,	%l2,	%o1
	ldsh	[%l7 + 0x5C],	%l5
	ldsb	[%l7 + 0x19],	%l0
	wr	%g0,	0x22,	%asi
	stxa	%o5,	[%l7 + 0x68] %asi
	membar	#Sync
	stw	%i5,	[%l7 + 0x28]
	sth	%g7,	[%l7 + 0x44]
	sth	%g4,	[%l7 + 0x76]
	ldsh	[%l7 + 0x74],	%l6
	movrlz	%o3,	%i2,	%i3
	flush	%l7 + 0x20
	flush	%l7 + 0x0C
	stw	%i0,	[%l7 + 0x78]
	ldsh	[%l7 + 0x0E],	%i6
	swap	[%l7 + 0x2C],	%o2
	udivcc	%g3,	0x0C0B,	%g1
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g6
	ldsb	[%l7 + 0x41],	%i1
	movcs	%icc,	%o6,	%g5
	prefetch	[%l7 + 0x5C],	 0x3
	stb	%i4,	[%l7 + 0x72]
	popc	0x133B,	%g2
	fnor	%f18,	%f14,	%f20
	nop
	set	0x68, %g3
	std	%f10,	[%l7 + %g3]
	st	%f31,	[%l7 + 0x20]
	edge8n	%o7,	%i7,	%o4
	std	%f8,	[%l7 + 0x78]
	udivcc	%l1,	0x0A69,	%o0
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	wr	%g0,	0x57,	%asi
	stxa	%l4,	[%g0 + 0x0] %asi
	ldub	[%l7 + 0x1A],	%l2
	movcs	%icc,	%l3,	%o1
	stbar
	fpsub16	%f10,	%f14,	%f2
	fbul,a	%fcc1,	loop_70
	stbar
	stx	%l0,	[%l7 + 0x28]
	ldstub	[%l7 + 0x68],	%o5
loop_70:
	st	%f6,	[%l7 + 0x40]
	sdivx	%l5,	0x1EDC,	%g7
	subc	%g4,	0x0CE2,	%i5
	flush	%l7 + 0x54
	st	%f31,	[%l7 + 0x50]
	stx	%l6,	[%l7 + 0x60]
	ldsw	[%l7 + 0x24],	%o3
	ldsw	[%l7 + 0x54],	%i3
	st	%f18,	[%l7 + 0x40]
	stw	%i0,	[%l7 + 0x7C]
	ldd	[%l7 + 0x78],	%f24
	ldsh	[%l7 + 0x34],	%i2
	lduw	[%l7 + 0x14],	%i6
	flush	%l7 + 0x34
	ldub	[%l7 + 0x28],	%o2
	stx	%g1,	[%l7 + 0x58]
	std	%f10,	[%l7 + 0x10]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %i2
	ldxa	[%g0 + %i2] 0x21,	%g3
	rd	%y,	%i1
	ldstub	[%l7 + 0x52],	%o6
	ldsw	[%l7 + 0x3C],	%g5
	alignaddr	%i4,	%g2,	%g6
	ldd	[%l7 + 0x40],	%f26
	stw	%o7,	[%l7 + 0x7C]
	wr	%g0,	0x1d,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	stbar
	rd	%y,	%o0
	wr	%l4,	%l2,	%sys_tick
	sth	%i7,	[%l7 + 0x52]
	stb	%l3,	[%l7 + 0x5F]
	ldub	[%l7 + 0x50],	%l0
	rdpr	%cwp,	%o5
	ldx	[%l7 + 0x78],	%l5
	ldstub	[%l7 + 0x66],	%o1
	ldub	[%l7 + 0x12],	%g4
	ldsw	[%l7 + 0x5C],	%g7
	ldd	[%l7 + 0x40],	%f30
	ldx	[%l7 + 0x30],	%l6
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x04,	%i5
	membar	0x7E
	edge32	%i3,	%o3,	%i0
	ld	[%l7 + 0x28],	%f0
	nop
	set	0x76, %o7
	ldsb	[%l7 + %o7],	%i2
	std	%i6,	[%l7 + 0x58]
	sth	%g1,	[%l7 + 0x56]
	swap	[%l7 + 0x60],	%g3
	lduw	[%l7 + 0x5C],	%o2
	lduw	[%l7 + 0x0C],	%i1
	ld	[%l7 + 0x6C],	%f14
	ldub	[%l7 + 0x61],	%o6
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 0x0
	lduh	[%l7 + 0x1A],	%g5
	stbar
	alignaddrl	%g2,	%g6,	%i4
	swap	[%l7 + 0x14],	%o7
	ldub	[%l7 + 0x57],	%l1
	prefetch	[%l7 + 0x64],	 0x2
	std	%o4,	[%l7 + 0x68]
	flush	%l7 + 0x7C
	ldx	[%l7 + 0x20],	%o0
	orncc	%l4,	0x0375,	%i7
	rdhpr	%htba,	%l3
	stx	%l2,	[%l7 + 0x10]
	mova	%icc,	%o5,	%l5
	lduh	[%l7 + 0x12],	%l0
	lduh	[%l7 + 0x34],	%g4
	ldsb	[%l7 + 0x79],	%g7
	ldx	[%l7 + 0x18],	%l6
	sth	%o1,	[%l7 + 0x6A]
	lduw	[%l7 + 0x3C],	%i3
	ldsh	[%l7 + 0x76],	%o3
	fmovsle	%xcc,	%f3,	%f10
	sth	%i0,	[%l7 + 0x6C]
	stx	%i5,	[%l7 + 0x70]
	std	%i6,	[%l7 + 0x10]
	rd	%asi,	%g1
	ldsw	[%l7 + 0x44],	%i2
	edge32l	%o2,	%g3,	%o6
	ld	[%l7 + 0x64],	%f23
	nop
	set	0x68, %o2
	stx	%g5,	[%l7 + %o2]
	lduw	[%l7 + 0x28],	%g2
	ldsh	[%l7 + 0x64],	%g6
	swap	[%l7 + 0x38],	%i1
	fbge	%fcc2,	loop_71
	ldd	[%l7 + 0x08],	%f12
	movle	%icc,	%i4,	%o7
	ldsh	[%l7 + 0x48],	%o4
loop_71:
	swap	[%l7 + 0x44],	%l1
	std	%o0,	[%l7 + 0x70]
	ldsw	[%l7 + 0x24],	%l4
	sth	%l3,	[%l7 + 0x4C]
	ldd	[%l7 + 0x30],	%f22
	edge32l	%o5,	%i7,	%l5
	st	%f13,	[%l7 + 0x7C]
	ldx	[%l7 + 0x60],	%l0
	ldsb	[%l7 + 0x50],	%g4
	stw	%g7,	[%l7 + 0x5C]
	sth	%l6,	[%l7 + 0x2C]
	prefetch	[%l7 + 0x28],	 0x3
	lduh	[%l7 + 0x6A],	%i3
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x14,	%o3
	lduh	[%l7 + 0x12],	%o1
	std	%f30,	[%l7 + 0x28]
	swap	[%l7 + 0x2C],	%i5
	swap	[%l7 + 0x70],	%i0
	ld	[%l7 + 0x48],	%f24
	prefetch	[%l7 + 0x38],	 0x3
	flush	%l7 + 0x20
	ldx	[%l7 + 0x08],	%i6
	prefetch	[%l7 + 0x68],	 0x1
	lduh	[%l7 + 0x70],	%g1
	stx	%i2,	[%l7 + 0x68]
	fmovsg	%xcc,	%f10,	%f5
	ldsb	[%l7 + 0x39],	%g3
	flush	%l7 + 0x7C
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x19,	%o6
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%o2,	[%g0 + 0x0] %asi
	stb	%g2,	[%l7 + 0x4C]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %o5
	ldxa	[%g0 + %o5] 0x50,	%g6
	lduh	[%l7 + 0x6A],	%i1
	stbar
	ldsw	[%l7 + 0x68],	%g5
	ldx	[%l7 + 0x60],	%i4
	stb	%o4,	[%l7 + 0x52]
	srl	%l1,	0x03,	%o7
	swap	[%l7 + 0x54],	%l4
	stx	%l3,	[%l7 + 0x28]
	sth	%o0,	[%l7 + 0x4E]
	ldub	[%l7 + 0x30],	%o5
	ldsh	[%l7 + 0x46],	%i7
	stb	%l2,	[%l7 + 0x45]
	ldsh	[%l7 + 0x24],	%l0
	lduw	[%l7 + 0x48],	%l5
	flush	%l7 + 0x3C
	ldstub	[%l7 + 0x74],	%g4
	ldsb	[%l7 + 0x42],	%l6
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x89,	%i3
	stw	%o3,	[%l7 + 0x18]
	mulx	%o1,	0x0ECE,	%g7
	ldd	[%l7 + 0x18],	%i4
	stb	%i6,	[%l7 + 0x76]
	or	%g1,	%i0,	%g3
	ld	[%l7 + 0x48],	%f22
	prefetch	[%l7 + 0x24],	 0x1
	stbar
	st	%f1,	[%l7 + 0x5C]
	ld	[%l7 + 0x2C],	%f27
	array16	%i2,	%o6,	%g2
	stb	%o2,	[%l7 + 0x78]
	lduw	[%l7 + 0x30],	%i1
	prefetch	[%l7 + 0x10],	 0x0
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x81,	%g5
	set	0x50, %l3
	stxa	%i4,	[%l7 + %l3] 0x1c
	tl	%icc,	0x1
	stb	%g6,	[%l7 + 0x67]
	srax	%o4,	%o7,	%l1
	ldd	[%l7 + 0x60],	%l4
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o0
	ldsh	[%l7 + 0x64],	%o5
	ldd	[%l7 + 0x68],	%l2
	stx	%l2,	[%l7 + 0x28]
	nop
	set	0x56, %l2
	stb	%i7,	[%l7 + %l2]
	stb	%l0,	[%l7 + 0x67]
	nop
	set	0x46, %l1
	ldstub	[%l7 + %l1],	%g4
	prefetch	[%l7 + 0x2C],	 0x0
	stw	%l5,	[%l7 + 0x54]
	ld	[%l7 + 0x4C],	%f3
	lduw	[%l7 + 0x24],	%i3
	sth	%o3,	[%l7 + 0x16]
	nop
	set	0x78, %o1
	ldsh	[%l7 + %o1],	%l6
	fones	%f23
	membar	0x1A
	tvs	%xcc,	0x3
	edge16l	%o1,	%i5,	%g7
	ldsh	[%l7 + 0x4C],	%g1
	ldx	[%l7 + 0x60],	%i6
	ldub	[%l7 + 0x6B],	%i0
	ld	[%l7 + 0x3C],	%f8
	flush	%l7 + 0x5C
	wr	%g0,	0x88,	%asi
	stxa	%i2,	[%l7 + 0x28] %asi
	te	%xcc,	0x7
	ldsh	[%l7 + 0x58],	%o6
	stb	%g3,	[%l7 + 0x20]
	fbg,a	%fcc2,	loop_72
	lduw	[%l7 + 0x70],	%o2
	ldstub	[%l7 + 0x60],	%i1
	lduw	[%l7 + 0x18],	%g5
loop_72:
	sub	%g2,	%i4,	%g6
	ldsb	[%l7 + 0x74],	%o7
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l1
	stw	%o4,	[%l7 + 0x10]
	stbar
	ldstub	[%l7 + 0x6A],	%l4
	rdpr	%wstate,	%o0
	tsubcctv	%l3,	%l2,	%i7
	lduw	[%l7 + 0x44],	%l0
	ldsw	[%l7 + 0x5C],	%o5
	stb	%g4,	[%l7 + 0x16]
	ldsh	[%l7 + 0x7A],	%l5
	nop
	set	0x50, %l4
	std	%o2,	[%l7 + %l4]
	ldsb	[%l7 + 0x15],	%l6
	lduh	[%l7 + 0x36],	%i3
	ldd	[%l7 + 0x10],	%i4
	ldsw	[%l7 + 0x64],	%o1
	ldsb	[%l7 + 0x0C],	%g1
	ldsb	[%l7 + 0x27],	%i6
	nop
	set	0x0B, %g2
	stb	%g7,	[%l7 + %g2]
	lduw	[%l7 + 0x4C],	%i0
	set	0x20, %l0
	ldxa	[%l7 + %l0] 0x04,	%i2
	sth	%g3,	[%l7 + 0x7E]
	lduh	[%l7 + 0x36],	%o2
	ldsh	[%l7 + 0x20],	%o6
	sdivx	%g5,	0x0A5C,	%i1
	lduh	[%l7 + 0x14],	%i4
	nop
	set	0x7E, %i0
	sth	%g6,	[%l7 + %i0]
	lduh	[%l7 + 0x78],	%g2
	std	%f10,	[%l7 + 0x20]
	nop
	set	0x40, %g6
	sth	%l1,	[%l7 + %g6]
	nop
	set	0x4A, %i6
	ldstub	[%l7 + %i6],	%o7
	ldub	[%l7 + 0x3C],	%o4
	ldd	[%l7 + 0x60],	%f18
	wrpr	%l4,	0x0734,	%cwp
	xnorcc	%l3,	0x12BE,	%l2
	movpos	%xcc,	%i7,	%o0
	ldsh	[%l7 + 0x48],	%o5
	edge32l	%g4,	%l0,	%o3
	ldstub	[%l7 + 0x46],	%l5
	std	%f16,	[%l7 + 0x50]
	sra	%i3,	0x1A,	%i5
	flush	%l7 + 0x10
	ldd	[%l7 + 0x18],	%f26
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %g7
	stxa	%o1,	[%g0 + %g7] 0x5f
	stx	%l6,	[%l7 + 0x18]
	ldub	[%l7 + 0x2E],	%g1
	std	%i6,	[%l7 + 0x68]
	ldsh	[%l7 + 0x30],	%i0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g7
	st	%f19,	[%l7 + 0x2C]
	lduh	[%l7 + 0x3E],	%i2
	lduh	[%l7 + 0x64],	%g3
	ld	[%l7 + 0x20],	%f13
	sdivcc	%o2,	0x1CC4,	%o6
	ldx	[%l7 + 0x08],	%i1
	sth	%g5,	[%l7 + 0x4C]
	ldd	[%l7 + 0x48],	%g6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g2
	ldsh	[%l7 + 0x58],	%i4
	fpadd32	%f30,	%f16,	%f20
	ldub	[%l7 + 0x22],	%l1
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x11,	%o4
	swap	[%l7 + 0x40],	%l4
	ldsw	[%l7 + 0x34],	%l3
	fmul8ulx16	%f18,	%f0,	%f16
	swap	[%l7 + 0x10],	%o7
	std	%f4,	[%l7 + 0x20]
	nop
	set	0x63, %i1
	ldstub	[%l7 + %i1],	%l2
	ldub	[%l7 + 0x3D],	%o0
	std	%f30,	[%l7 + 0x58]
	ldstub	[%l7 + 0x31],	%o5
	flush	%l7 + 0x14
	std	%f18,	[%l7 + 0x30]
	lduw	[%l7 + 0x3C],	%i7
	ldd	[%l7 + 0x50],	%l0
	stbar
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%o2
	ldd	[%l7 + 0x60],	%g4
	lduh	[%l7 + 0x42],	%l5
	sdivcc	%i3,	0x184D,	%i5
	ld	[%l7 + 0x58],	%f30
	ldsh	[%l7 + 0x58],	%o1
	ldx	[%l7 + 0x30],	%l6
	nop
	set	0x54, %l5
	sth	%g1,	[%l7 + %l5]
	ba	%xcc,	loop_73
	ld	[%l7 + 0x54],	%f16
	ldd	[%l7 + 0x28],	%i0
	taddcc	%g7,	0x1C2F,	%i6
loop_73:
	ldsw	[%l7 + 0x08],	%g3
	std	%o2,	[%l7 + 0x48]
	nop
	set	0x30, %g1
	prefetch	[%l7 + %g1],	 0x1
	flush	%l7 + 0x2C
	std	%o6,	[%l7 + 0x78]
	st	%f28,	[%l7 + 0x10]
	rdhpr	%hintp,	%i1
	lduh	[%l7 + 0x08],	%g5
	stw	%i2,	[%l7 + 0x6C]
	rd	%fprs,	%g6
	ldd	[%l7 + 0x60],	%f2
	std	%g2,	[%l7 + 0x08]
	ldd	[%l7 + 0x78],	%i4
	rdhpr	%hintp,	%o4
	flush	%l7 + 0x68
	ldd	[%l7 + 0x48],	%l4
	flush	%l7 + 0x6C
	ldx	[%l7 + 0x08],	%l1
	std	%f20,	[%l7 + 0x68]
	swap	[%l7 + 0x38],	%o7
	ld	[%l7 + 0x78],	%f16
	edge8n	%l2,	%l3,	%o0
	ldsh	[%l7 + 0x0E],	%o5
	ldd	[%l7 + 0x08],	%l0
	tsubcc	%o3,	0x0C5C,	%i7
	ld	[%l7 + 0x3C],	%f27
	ldsb	[%l7 + 0x4C],	%l5
	std	%f12,	[%l7 + 0x28]
	stx	%g4,	[%l7 + 0x38]
	ldsh	[%l7 + 0x64],	%i5
	ldd	[%l7 + 0x28],	%f10
	xnor	%i3,	0x02B0,	%o1
	ldsw	[%l7 + 0x64],	%l6
	lduw	[%l7 + 0x48],	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x20]
	movn	%xcc,	%i0,	%g7
	stbar
	std	%i6,	[%l7 + 0x58]
	ldub	[%l7 + 0x60],	%g3
	ldstub	[%l7 + 0x50],	%o2
	ldd	[%l7 + 0x20],	%o6
	flush	%l7 + 0x18
	ldub	[%l7 + 0x5C],	%i1
	lduh	[%l7 + 0x26],	%g5
	stw	%i2,	[%l7 + 0x08]
	fpsub32s	%f17,	%f21,	%f13
	flush	%l7 + 0x58
	stbar
	lduh	[%l7 + 0x30],	%g2
	ld	[%l7 + 0x1C],	%f29
	sllx	%i4,	0x00,	%o4
	ldsh	[%l7 + 0x18],	%g6
	stw	%l1,	[%l7 + 0x18]
	tge	%icc,	0x7
	std	%l4,	[%l7 + 0x10]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x08, %g4
	stxa	%o7,	[%l7 + %g4] 0x22
	membar	#Sync
	ldsw	[%l7 + 0x44],	%l2
	ldub	[%l7 + 0x50],	%o0
	sdivx	%l3,	0x0F6D,	%o5
	std	%l0,	[%l7 + 0x60]
	prefetch	[%l7 + 0x70],	 0x1
	stb	%o3,	[%l7 + 0x51]
	ldd	[%l7 + 0x68],	%l4
	stbar
	std	%f14,	[%l7 + 0x68]
	ldd	[%l7 + 0x70],	%g4
	stw	%i7,	[%l7 + 0x20]
	nop
	set	0x50, %o0
	prefetch	[%l7 + %o0],	 0x1
	std	%i4,	[%l7 + 0x50]
	ldsh	[%l7 + 0x1C],	%i3
	stb	%l6,	[%l7 + 0x0F]
	edge16	%o1,	%i0,	%g1
	fbne	%fcc0,	loop_74
	ldub	[%l7 + 0x30],	%i6
	sllx	%g7,	0x10,	%g3
	prefetch	[%l7 + 0x24],	 0x3
loop_74:
	lduh	[%l7 + 0x74],	%o6
	prefetch	[%l7 + 0x6C],	 0x3
	std	%o2,	[%l7 + 0x08]
	sth	%g5,	[%l7 + 0x1A]
	std	%f16,	[%l7 + 0x38]
	fmovsvs	%xcc,	%f17,	%f6
	ldstub	[%l7 + 0x28],	%i1
	swap	[%l7 + 0x24],	%g2
	flush	%l7 + 0x70
	brnz	%i2,	loop_75
	fpadd32	%f4,	%f0,	%f2
	ldd	[%l7 + 0x58],	%f20
	ldd	[%l7 + 0x40],	%i4
loop_75:
	nop
	wr	%g0,	0x2f,	%asi
	stxa	%g6,	[%l7 + 0x28] %asi
	membar	#Sync
	bleu,a,pt	%xcc,	loop_76
	ldsb	[%l7 + 0x53],	%o4
	std	%l4,	[%l7 + 0x60]
	ldx	[%l7 + 0x10],	%l1
loop_76:
	fmovsgu	%icc,	%f23,	%f24
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x360
	set	0x360, %i3
	nop 	! 	nop 	! 	ldxa	[%g0 + %i3] 0x40,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x50, %i2
	stxa	%l3,	[%l7 + %i2] 0x04
	flush	%l7 + 0x08
	std	%f18,	[%l7 + 0x18]
	swap	[%l7 + 0x3C],	%o5
	stx	%l0,	[%l7 + 0x58]
	ldub	[%l7 + 0x7D],	%o3
	ldsb	[%l7 + 0x55],	%l2
	movg	%icc,	%g4,	%i7
	ldd	[%l7 + 0x18],	%f12
	ldsw	[%l7 + 0x50],	%l5
	sth	%i5,	[%l7 + 0x3A]
	std	%f16,	[%l7 + 0x60]
	flush	%l7 + 0x60
	andncc	%i3,	%l6,	%i0
	st	%f30,	[%l7 + 0x30]
	std	%f10,	[%l7 + 0x20]
	stx	%o1,	[%l7 + 0x60]
	ldsh	[%l7 + 0x2A],	%i6
	swap	[%l7 + 0x58],	%g7
	stb	%g3,	[%l7 + 0x67]
	umulcc	%g1,	%o2,	%g5
	prefetch	[%l7 + 0x70],	 0x3
	swap	[%l7 + 0x44],	%o6
	wrpr	%g2,	%i1,	%pil
	prefetch	[%l7 + 0x6C],	 0x2
	fmuld8sux16	%f19,	%f8,	%f30
	ldsh	[%l7 + 0x72],	%i4
	nop
	set	0x67, %g5
	ldsb	[%l7 + %g5],	%i2
	ld	[%l7 + 0x5C],	%f15
	std	%o4,	[%l7 + 0x68]
	prefetch	[%l7 + 0x10],	 0x3
	andncc	%l4,	%l1,	%g6
	nop
	set	0x2C, %g3
	lduw	[%l7 + %g3],	%o7
	fxors	%f27,	%f12,	%f5
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x378
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x378] %asi,	%o0 ripped by fixASI40.pl ripped by fixASI40.pl
	std	%o4,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%l0
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x338
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o3,	[%g0 + 0x338] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	wr	%g0,	0x19,	%asi
	stxa	%l2,	[%l7 + 0x38] %asi
	fmovdne	%xcc,	%f0,	%f12
	andn	%l3,	0x1210,	%g4
	ld	[%l7 + 0x4C],	%f11
	xnor	%l5,	%i7,	%i5
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x19,	%i3
	ldsb	[%l7 + 0x74],	%l6
	fmovrdgz	%i0,	%f2,	%f20
	ldstub	[%l7 + 0x60],	%i6
	nop
	set	0x16, %o4
	lduh	[%l7 + %o4],	%g7
	stbar
	ldub	[%l7 + 0x75],	%o1
	set	0x28, %l6
	stxa	%g3,	[%l7 + %l6] 0x2f
	membar	#Sync
	mulscc	%g1,	%o2,	%o6
	lduw	[%l7 + 0x70],	%g5
	std	%g2,	[%l7 + 0x78]
	ldsb	[%l7 + 0x41],	%i4
	flush	%l7 + 0x14
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x88,	%i1
	ldsh	[%l7 + 0x7A],	%o4
	umulcc	%l4,	0x1901,	%l1
	fmovscs	%xcc,	%f1,	%f4
	sdivcc	%i2,	0x0745,	%o7
	ldd	[%l7 + 0x68],	%f30
	ld	[%l7 + 0x50],	%f21
	stx	%o0,	[%l7 + 0x08]
	alignaddr	%g6,	%l0,	%o3
	ldd	[%l7 + 0x28],	%l2
	ldd	[%l7 + 0x20],	%f8
	stw	%l3,	[%l7 + 0x0C]
	ldx	[%l7 + 0x70],	%g4
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%o5
	std	%f28,	[%l7 + 0x18]
	stbar
	ldsb	[%l7 + 0x2B],	%l5
	sth	%i7,	[%l7 + 0x56]
	nop
	set	0x5C, %o3
	ldsh	[%l7 + %o3],	%i5
	rd	%fprs,	%i3
	fsrc1	%f18,	%f22
	ldd	[%l7 + 0x50],	%i0
	std	%i6,	[%l7 + 0x60]
	lduw	[%l7 + 0x5C],	%g7
	udiv	%i6,	0x1B6A,	%o1
	ldsh	[%l7 + 0x7C],	%g1
	stx	%g3,	[%l7 + 0x48]
	nop
	set	0x10, %o5
	stw	%o2,	[%l7 + %o5]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x27],	%o6
	tleu	%xcc,	0x6
	fbuge,a	%fcc2,	loop_77
	ldx	[%l7 + 0x08],	%g2
	ldsb	[%l7 + 0x79],	%g5
	st	%f26,	[%l7 + 0x08]
loop_77:
	ldd	[%l7 + 0x28],	%i0
	stb	%o4,	[%l7 + 0x68]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr 	%g0, 	0x5, 	%fprs
	std	%f30,	[%l7 + 0x10]
	xor	%l1,	%i2,	%o7
	ldsw	[%l7 + 0x20],	%o0
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l0
	std	%g6,	[%l7 + 0x78]
	nop
	set	0x38, %i7
	std	%o2,	[%l7 + %i7]
	fxnors	%f18,	%f18,	%f25
	stbar
	fcmpgt32	%f18,	%f16,	%l3
	lduh	[%l7 + 0x2C],	%l2
	ldub	[%l7 + 0x65],	%o5
	ldub	[%l7 + 0x6B],	%l5
	flush	%l7 + 0x0C
	stw	%g4,	[%l7 + 0x64]
	ldsw	[%l7 + 0x3C],	%i7
	flush	%l7 + 0x70
	movrne	%i5,	%i3,	%l6
	lduw	[%l7 + 0x24],	%g7
	stbar
	umul	%i6,	%o1,	%i0
	stx	%g3,	[%l7 + 0x68]
	lduh	[%l7 + 0x32],	%g1
	swap	[%l7 + 0x44],	%o2
	ldd	[%l7 + 0x70],	%o6
	ld	[%l7 + 0x74],	%f12
	subc	%g5,	%g2,	%o4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i4
	stw	%l4,	[%l7 + 0x74]
	stw	%i1,	[%l7 + 0x58]
	movcc	%xcc,	%i2,	%o7
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f4
	ldsb	[%l7 + 0x62],	%o0
	ldd	[%l7 + 0x18],	%f28
	edge32l	%l0,	%g6,	%o3
	nop
	set	0x5D, %l3
	ldstub	[%l7 + %l3],	%l3
	umul	%l1,	%o5,	%l5
	stw	%l2,	[%l7 + 0x34]
	nop
	set	0x30, %o1
	std	%g4,	[%l7 + %o1]
	ldsw	[%l7 + 0x20],	%i5
	ldx	[%l7 + 0x50],	%i3
	wr	%g0,	0xeb,	%asi
	stxa	%l6,	[%l7 + 0x38] %asi
	membar	#Sync
	prefetch	[%l7 + 0x4C],	 0x2
	stw	%i7,	[%l7 + 0x68]
	fbue,a	%fcc2,	loop_78
	stx	%g7,	[%l7 + 0x68]
	prefetch	[%l7 + 0x14],	 0x0
	fsrc2	%f6,	%f20
loop_78:
	lduw	[%l7 + 0x40],	%i6
	ldx	[%l7 + 0x68],	%i0
	ldub	[%l7 + 0x5C],	%o1
	stw	%g3,	[%l7 + 0x24]
	lduh	[%l7 + 0x24],	%g1
	st	%f18,	[%l7 + 0x64]
	ldx	[%l7 + 0x18],	%o2
	std	%f30,	[%l7 + 0x70]
	ldd	[%l7 + 0x58],	%f22
	lduh	[%l7 + 0x4A],	%o6
	nop
	set	0x08, %l1
	prefetch	[%l7 + %l1],	 0x2
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%g5,	[%g0 + 0x0] %asi
	ldd	[%l7 + 0x60],	%f0
	fabss	%f29,	%f12
	ldub	[%l7 + 0x4B],	%g2
	ldd	[%l7 + 0x28],	%i4
	stb	%l4,	[%l7 + 0x10]
	swap	[%l7 + 0x20],	%i1
	ldstub	[%l7 + 0x21],	%o4
	st	%f0,	[%l7 + 0x44]
	swap	[%l7 + 0x38],	%o7
	ldstub	[%l7 + 0x11],	%i2
	prefetch	[%l7 + 0x10],	 0x3
	fxnors	%f28,	%f20,	%f19
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x18,	%l0
	flush	%l7 + 0x60
	stb	%g6,	[%l7 + 0x48]
	lduw	[%l7 + 0x50],	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %l0
	ldxa	[%g0 + %l0] 0x20,	%l3
	tvs	%icc,	0x7
	ldstub	[%l7 + 0x3B],	%l1
	ldsh	[%l7 + 0x0C],	%o5
	ldsb	[%l7 + 0x69],	%l5
	ldd	[%l7 + 0x18],	%f26
	wr	%g0,	0x1c,	%asi
	stxa	%o3,	[%l7 + 0x30] %asi
	ldstub	[%l7 + 0x67],	%g4
	stbar
	stx	%i5,	[%l7 + 0x68]
	prefetch	[%l7 + 0x08],	 0x1
	ldx	[%l7 + 0x18],	%i3
	st	%f3,	[%l7 + 0x2C]
	ldsb	[%l7 + 0x2C],	%l2
	std	%f24,	[%l7 + 0x18]
	fmul8sux16	%f18,	%f0,	%f30
	st	%f0,	[%l7 + 0x68]
	lduw	[%l7 + 0x34],	%i7
	ld	[%l7 + 0x50],	%f17
	nop
	set	0x68, %g2
	prefetch	[%l7 + %g2],	 0x1
	std	%f0,	[%l7 + 0x38]
	nop
	set	0x2E, %i0
	sth	%l6,	[%l7 + %i0]
	xnorcc	%g7,	%i6,	%o1
	ldd	[%l7 + 0x48],	%i0
	stx	%g3,	[%l7 + 0x70]
	stw	%g1,	[%l7 + 0x14]
	prefetch	[%l7 + 0x34],	 0x2
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x1c,	%o2
	ldstub	[%l7 + 0x46],	%o6
	prefetch	[%l7 + 0x60],	 0x0
	stb	%g5,	[%l7 + 0x2A]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x858, 	%hsys_tick_cmpr
	tgu	%xcc,	0x2
	std	%f20,	[%l7 + 0x38]
	ld	[%l7 + 0x54],	%f3
	movrlz	%l4,	%i1,	%g2
	lduw	[%l7 + 0x1C],	%o7
	nop
	set	0x60, %g7
	std	%i2,	[%l7 + %g7]
	nop
	set	0x28, %i5
	lduw	[%l7 + %i5],	%o4
	ldsb	[%l7 + 0x4F],	%g6
	ldstub	[%l7 + 0x0C],	%o0
	sth	%l0,	[%l7 + 0x18]
	stw	%l1,	[%l7 + 0x48]
	ld	[%l7 + 0x40],	%f8
	prefetch	[%l7 + 0x50],	 0x2
	lduh	[%l7 + 0x22],	%o5
	lduh	[%l7 + 0x60],	%l5
	stbar
	ldsb	[%l7 + 0x5E],	%l3
	stx	%g4,	[%l7 + 0x68]
	movge	%icc,	%o3,	%i3
	sth	%i5,	[%l7 + 0x18]
	fmovrsne	%l2,	%f24,	%f31
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x11,	%i7
	lduw	[%l7 + 0x60],	%l6
	fbu,a	%fcc3,	loop_79
	ldd	[%l7 + 0x28],	%f12
	stw	%i6,	[%l7 + 0x4C]
	ld	[%l7 + 0x0C],	%f24
loop_79:
	ld	[%l7 + 0x28],	%f1
	stw	%o1,	[%l7 + 0x3C]
	swap	[%l7 + 0x1C],	%g7
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %i1
	ldxa	[%g0 + %i1] 0x4f,	%g3
	ldstub	[%l7 + 0x21],	%i0
	stbar
	st	%f9,	[%l7 + 0x50]
	movvc	%xcc,	%g1,	%o6
	call	loop_80
	nop
	set	0x68, %i4
	sth	%g5,	[%l7 + %i4]
	lduh	[%l7 + 0x14],	%o2
	ldstub	[%l7 + 0x64],	%l4
loop_80:
	ldd	[%l7 + 0x60],	%f4
	stbar
	call	loop_81
	lduh	[%l7 + 0x14],	%i4
	ldd	[%l7 + 0x78],	%g2
	ldub	[%l7 + 0x5A],	%o7
loop_81:
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f12
	fmovdle	%xcc,	%f29,	%f4
	stb	%i1,	[%l7 + 0x70]
	ldd	[%l7 + 0x08],	%i2
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o4
	edge8n	%g6,	%l0,	%l1
	st	%f17,	[%l7 + 0x08]
	addccc	%o5,	0x1D41,	%l5
	ldstub	[%l7 + 0x50],	%o0
	ldsw	[%l7 + 0x40],	%l3
	edge16	%g4,	%i3,	%o3
	ld	[%l7 + 0x48],	%f31
	fpsub32s	%f24,	%f27,	%f14
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x68] %asi,	%l2
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i7
	swap	[%l7 + 0x74],	%l6
	lduh	[%l7 + 0x3A],	%i5
	sth	%o1,	[%l7 + 0x14]
	prefetch	[%l7 + 0x58],	 0x1
	edge8l	%g7,	%i6,	%g3
	nop
	set	0x68, %g1
	std	%f30,	[%l7 + %g1]
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i0
	swap	[%l7 + 0x74],	%g1
	sdivcc	%g5,	0x188C,	%o2
	ldsw	[%l7 + 0x68],	%l4
	stw	%o6,	[%l7 + 0x48]
	lduw	[%l7 + 0x70],	%i4
	tneg	%xcc,	0x2
	andcc	%o7,	0x0CF9,	%i1
	xnor	%g2,	%o4,	%g6
	stw	%l0,	[%l7 + 0x1C]
	ld	[%l7 + 0x78],	%f3
	ldstub	[%l7 + 0x16],	%i2
	stbar
	lduh	[%l7 + 0x0C],	%o5
	addcc	%l1,	%o0,	%l5
	std	%l2,	[%l7 + 0x78]
	flush	%l7 + 0x50
	ldsb	[%l7 + 0x5A],	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x67B, 	%tick_cmpr
	ldx	[%l7 + 0x20],	%l2
	ldd	[%l7 + 0x78],	%i6
	ldsh	[%l7 + 0x3A],	%g4
	std	%f10,	[%l7 + 0x68]
	ldstub	[%l7 + 0x44],	%l6
	ldsb	[%l7 + 0x54],	%i5
	wr	%g7,	0x066E,	%softint
	addcc	%o1,	%g3,	%i6
	ldd	[%l7 + 0x20],	%i0
	st	%f2,	[%l7 + 0x7C]
	lduh	[%l7 + 0x60],	%g1
	stb	%g5,	[%l7 + 0x6B]
	movge	%xcc,	%l4,	%o2
	ldub	[%l7 + 0x2E],	%o6
	ldub	[%l7 + 0x45],	%i4
	flush	%l7 + 0x70
	stb	%o7,	[%l7 + 0x5D]
	stb	%g2,	[%l7 + 0x10]
	st	%f6,	[%l7 + 0x0C]
	fpsub32	%f8,	%f10,	%f0
	ldsb	[%l7 + 0x22],	%o4
	ldsh	[%l7 + 0x30],	%i1
	fsrc1	%f4,	%f8
	swap	[%l7 + 0x70],	%l0
	stb	%g6,	[%l7 + 0x36]
	st	%f18,	[%l7 + 0x20]
	std	%i2,	[%l7 + 0x68]
	nop
	set	0x7E, %o0
	lduh	[%l7 + %o0],	%o5
	stb	%o0,	[%l7 + 0x7D]
	ldsh	[%l7 + 0x32],	%l1
	prefetch	[%l7 + 0x58],	 0x1
	fmul8x16au	%f10,	%f18,	%f0
	set	0x70, %i2
	stxa	%l5,	[%l7 + %i2] 0x88
	lduh	[%l7 + 0x56],	%i3
	std	%f12,	[%l7 + 0x38]
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l3
	ldub	[%l7 + 0x68],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x43],	%o3
	ldsh	[%l7 + 0x52],	%i5
	ldsh	[%l7 + 0x5E],	%g7
	ld	[%l7 + 0x48],	%f27
	nop
	set	0x14, %i3
	ldub	[%l7 + %i3],	%l6
	mulscc	%g3,	0x02FB,	%i6
	sth	%i0,	[%l7 + 0x2E]
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %g3
	stxa	%g1,	[%g0 + %g3] 0x5f
	ldsh	[%l7 + 0x22],	%o1
	tcs	%xcc,	0x1
	lduh	[%l7 + 0x18],	%l4
	lduh	[%l7 + 0x40],	%o2
	ldsh	[%l7 + 0x7A],	%g5
	ld	[%l7 + 0x3C],	%f17
	fcmple32	%f22,	%f30,	%i4
	stx	%o6,	[%l7 + 0x20]
	edge16ln	%o7,	%o4,	%g2
	prefetch	[%l7 + 0x2C],	 0x1
	ldub	[%l7 + 0x54],	%i1
	nop
	set	0x30, %o7
	std	%g6,	[%l7 + %o7]
	lduw	[%l7 + 0x1C],	%l0
	ldsb	[%l7 + 0x0C],	%i2
	lduh	[%l7 + 0x5C],	%o5
	prefetch	[%l7 + 0x30],	 0x0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%o0,	[%g0 + 0x18] %asi
	std	%l4,	[%l7 + 0x50]
	ldsb	[%l7 + 0x70],	%l1
	std	%i2,	[%l7 + 0x18]
	ldd	[%l7 + 0x78],	%l2
	edge8n	%l3,	%g4,	%i7
	ld	[%l7 + 0x24],	%f25
	stw	%o3,	[%l7 + 0x20]
	lduh	[%l7 + 0x26],	%g7
	srl	%l6,	%g3,	%i5
	prefetch	[%l7 + 0x48],	 0x2
	move	%icc,	%i0,	%i6
	ldstub	[%l7 + 0x64],	%o1
	stw	%l4,	[%l7 + 0x10]
	fblg,a	%fcc1,	loop_82
	rd	%fprs,	%g1
	std	%f0,	[%l7 + 0x40]
	rdpr	%otherwin,	%o2
loop_82:
	edge32l	%i4,	%o6,	%o7
	ldsb	[%l7 + 0x5F],	%g5
	ldstub	[%l7 + 0x0D],	%o4
	swap	[%l7 + 0x40],	%g2
	ldsb	[%l7 + 0x2E],	%i1
	stx	%g6,	[%l7 + 0x40]
	ldd	[%l7 + 0x70],	%l0
	stw	%o5,	[%l7 + 0x70]
	array16	%o0,	%l5,	%i2
	ldstub	[%l7 + 0x61],	%l1
	ld	[%l7 + 0x6C],	%f6
	umulcc	%i3,	%l2,	%l3
	ldub	[%l7 + 0x38],	%i7
	sth	%g4,	[%l7 + 0x5C]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5BD, 	%hsys_tick_cmpr
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%g3
	ldsw	[%l7 + 0x10],	%i5
	stw	%i0,	[%l7 + 0x3C]
	std	%i6,	[%l7 + 0x18]
	flush	%l7 + 0x08
	st	%f15,	[%l7 + 0x50]
	st	%f9,	[%l7 + 0x60]
	fpackfix	%f28,	%f23
	prefetch	[%l7 + 0x64],	 0x1
	ldsh	[%l7 + 0x7E],	%i6
	ldstub	[%l7 + 0x62],	%l4
	ldstub	[%l7 + 0x7A],	%o1
	lduh	[%l7 + 0x78],	%g1
	stx	%o2,	[%l7 + 0x58]
	stw	%o6,	[%l7 + 0x5C]
	ldd	[%l7 + 0x50],	%i4
	std	%g4,	[%l7 + 0x68]
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o4
	sllx	%g2,	%i1,	%o7
	edge8	%l0,	%o5,	%o0
	lduh	[%l7 + 0x7C],	%g6
	swap	[%l7 + 0x10],	%l5
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%i2
	fmovsge	%icc,	%f3,	%f7
	ldd	[%l7 + 0x70],	%f8
	stb	%l1,	[%l7 + 0x52]
	ldd	[%l7 + 0x70],	%i2
	stb	%l3,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x48],	%l2
	ldsb	[%l7 + 0x29],	%i7
	prefetch	[%l7 + 0x20],	 0x2
	stw	%g4,	[%l7 + 0x5C]
	std	%f30,	[%l7 + 0x68]
	flush	%l7 + 0x44
	ldstub	[%l7 + 0x5D],	%g7
	nop
	set	0x53, %o6
	stb	%o3,	[%l7 + %o6]
	wr	%g0,	0xe3,	%asi
	stxa	%i5,	[%l7 + 0x58] %asi
	membar	#Sync
	flush	%l7 + 0x14
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f26
	fmovsg	%xcc,	%f0,	%f6
	sllx	%g3,	0x05,	%l6
	lduh	[%l7 + 0x36],	%i6
	membar	0x7C
	tn	%icc,	0x2
	sth	%i0,	[%l7 + 0x0E]
	lduh	[%l7 + 0x20],	%o1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xBF3, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x08],	%l4
	move	%xcc,	%o6,	%i4
	lduh	[%l7 + 0x14],	%o2
	lduw	[%l7 + 0x4C],	%o4
	swap	[%l7 + 0x0C],	%g2
	std	%g4,	[%l7 + 0x70]
	lduh	[%l7 + 0x5C],	%o7
	flushw
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l0
	ldsw	[%l7 + 0x0C],	%o5
	ldd	[%l7 + 0x30],	%f10
	ldd	[%l7 + 0x30],	%i0
	lduh	[%l7 + 0x28],	%g6
	set	0x58, %o3
	stxa	%l5,	[%l7 + %o3] 0x04
	set	0x08, %o2
	stxa	%i2,	[%l7 + %o2] 0x15
	lduw	[%l7 + 0x4C],	%l1
	srl	%i3,	0x14,	%o0
	ldd	[%l7 + 0x60],	%f30
	fbl	%fcc3,	loop_83
	edge16	%l2,	%l3,	%i7
	edge32n	%g4,	%o3,	%i5
	ldsb	[%l7 + 0x17],	%g3
loop_83:
	wrpr	%g7,	0x10C3,	%tick
	ldd	[%l7 + 0x50],	%f14
	nop
	set	0x70, %o5
	prefetch	[%l7 + %o5],	 0x2
	ldsh	[%l7 + 0x3C],	%i6
	ldx	[%l7 + 0x58],	%i0
	wrpr	%o1,	%g1,	%cwp
	ldub	[%l7 + 0x3A],	%l6
	stbar
	std	%o6,	[%l7 + 0x78]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%o4,	[%l7 + 0x60]
	flush	%l7 + 0x50
	ldub	[%l7 + 0x17],	%g2
	sth	%g5,	[%l7 + 0x3A]
	fmovs	%f18,	%f6
	set	0x50, %i7
	stxa	%l0,	[%l7 + %i7] 0x10
	movcc	%xcc,	%o7,	%o5
	ldd	[%l7 + 0x18],	%i0
	std	%g6,	[%l7 + 0x38]
	stx	%l5,	[%l7 + 0x40]
	flush	%l7 + 0x34
	ld	[%l7 + 0x4C],	%f2
	swap	[%l7 + 0x74],	%i2
	fmovda	%icc,	%f12,	%f28
	ldub	[%l7 + 0x64],	%l1
	lduh	[%l7 + 0x5E],	%o0
	flush	%l7 + 0x68
	flush	%l7 + 0x50
	ldsb	[%l7 + 0x46],	%l2
	ld	[%l7 + 0x0C],	%f9
	lduw	[%l7 + 0x30],	%i3
	ldstub	[%l7 + 0x3E],	%l3
	std	%f14,	[%l7 + 0x38]
	ldsh	[%l7 + 0x72],	%i7
	stx	%o3,	[%l7 + 0x70]
	stw	%i5,	[%l7 + 0x60]
	ldx	[%l7 + 0x30],	%g4
	rd	%tick_cmpr,	%g3
	stx	%i6,	[%l7 + 0x30]
	ld	[%l7 + 0x14],	%f19
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%f16
	std	%i0,	[%l7 + 0x28]
	stb	%g7,	[%l7 + 0x3E]
	wr	%g0,	0x27,	%asi
	stxa	%o1,	[%l7 + 0x68] %asi
	membar	#Sync
	st	%f1,	[%l7 + 0x20]
	fornot1s	%f7,	%f9,	%f8
	ldub	[%l7 + 0x0A],	%l6
	ldx	[%l7 + 0x78],	%o6
	stx	%l4,	[%l7 + 0x70]
	flush	%l7 + 0x74
	ldsb	[%l7 + 0x6B],	%g1
	lduh	[%l7 + 0x22],	%o2
	stbar
	ldx	[%l7 + 0x48],	%o4
	lduw	[%l7 + 0x30],	%g2
	stbar
	ld	[%l7 + 0x6C],	%f22
	sth	%i4,	[%l7 + 0x4E]
	ld	[%l7 + 0x30],	%f4
	lduh	[%l7 + 0x4E],	%g5
	nop
	set	0x6F, %l2
	stb	%o7,	[%l7 + %l2]
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l0
	flush	%l7 + 0x1C
	prefetch	[%l7 + 0x14],	 0x1
	ldd	[%l7 + 0x60],	%i0
	ld	[%l7 + 0x54],	%f2
	fmovrde	%g6,	%f22,	%f18
	swap	[%l7 + 0x1C],	%o5
	lduh	[%l7 + 0x64],	%l5
	std	%f24,	[%l7 + 0x78]
	std	%i2,	[%l7 + 0x18]
	swap	[%l7 + 0x50],	%o0
	sdivx	%l2,	0x0B99,	%i3
	flush	%l7 + 0x60
	stb	%l3,	[%l7 + 0x4C]
	stb	%l1,	[%l7 + 0x6F]
	nop
	set	0x58, %l1
	ldsh	[%l7 + %l1],	%i7
	ldub	[%l7 + 0x36],	%i5
	ldd	[%l7 + 0x50],	%f6
	swap	[%l7 + 0x3C],	%o3
	movcc	%xcc,	%g3,	%i6
	ldsb	[%l7 + 0x3C],	%g4
	movre	%i0,	%g7,	%o1
	nop
	set	0x12, %o1
	ldub	[%l7 + %o1],	%l6
	flush	%l7 + 0x08
	rdpr	%tba,	%o6
	ld	[%l7 + 0x1C],	%f19
	st	%f7,	[%l7 + 0x78]
	ldsh	[%l7 + 0x6A],	%l4
	std	%g0,	[%l7 + 0x60]
	stb	%o4,	[%l7 + 0x65]
	flush	%l7 + 0x30
	set	0x40, %l0
	stxa	%o2,	[%l7 + %l0] 0xea
	membar	#Sync
	stbar
	swap	[%l7 + 0x08],	%g2
	ldsb	[%l7 + 0x1E],	%i4
	lduw	[%l7 + 0x6C],	%o7
	st	%f28,	[%l7 + 0x74]
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f8
	ldsb	[%l7 + 0x20],	%g5
	xorcc	%l0,	%g6,	%o5
	lduh	[%l7 + 0x1A],	%l5
	ldsh	[%l7 + 0x6E],	%i1
	ldsw	[%l7 + 0x08],	%o0
	edge16ln	%i2,	%i3,	%l2
	flush	%l7 + 0x18
	stw	%l1,	[%l7 + 0x1C]
	std	%l2,	[%l7 + 0x38]
	stbar
	ldsw	[%l7 + 0x54],	%i5
	swap	[%l7 + 0x30],	%o3
	sth	%i7,	[%l7 + 0x22]
	ldsw	[%l7 + 0x28],	%g3
	stbar
	set	0x28, %i0
	stxa	%i6,	[%l7 + %i0] 0x04
	ta	%icc,	0x4
	std	%f10,	[%l7 + 0x38]
	wr	%g0,	0xe2,	%asi
	stxa	%i0,	[%l7 + 0x48] %asi
	membar	#Sync
	ldx	[%l7 + 0x08],	%g4
	ld	[%l7 + 0x70],	%f20
	nop
	set	0x48, %l4
	std	%g6,	[%l7 + %l4]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x3b0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3b0] %asi,	%l6 ripped by fixASI40.pl ripped by fixASI40.pl
	std	%o6,	[%l7 + 0x60]
	ldd	[%l7 + 0x78],	%f20
	ld	[%l7 + 0x44],	%f28
	stb	%o1,	[%l7 + 0x63]
	movcs	%icc,	%l4,	%g1
	lduw	[%l7 + 0x70],	%o2
	lduh	[%l7 + 0x60],	%g2
	array8	%o4,	%i4,	%o7
	std	%l0,	[%l7 + 0x10]
	sth	%g6,	[%l7 + 0x58]
	stx	%g5,	[%l7 + 0x60]
	lduh	[%l7 + 0x7E],	%o5
	lduh	[%l7 + 0x22],	%i1
	ldub	[%l7 + 0x20],	%o0
	tvs	%icc,	0x5
	prefetch	[%l7 + 0x30],	 0x3
	bg,a	loop_84
	st	%f7,	[%l7 + 0x6C]
	lduw	[%l7 + 0x48],	%i2
	tcc	%xcc,	0x6
loop_84:
	lduh	[%l7 + 0x5C],	%i3
	ldsw	[%l7 + 0x70],	%l5
	stb	%l1,	[%l7 + 0x24]
	st	%f5,	[%l7 + 0x60]
	prefetch	[%l7 + 0x60],	 0x3
	ldub	[%l7 + 0x58],	%l3
	ldd	[%l7 + 0x30],	%f30
	std	%i4,	[%l7 + 0x68]
	std	%f0,	[%l7 + 0x18]
	std	%f22,	[%l7 + 0x40]
	nop
	set	0x6B, %g7
	ldsb	[%l7 + %g7],	%l2
	std	%f2,	[%l7 + 0x18]
	ldsh	[%l7 + 0x64],	%o3
	flush	%l7 + 0x0C
	swap	[%l7 + 0x10],	%i7
	wrpr	%i6,	%i0,	%pil
	flush	%l7 + 0x2C
	ld	[%l7 + 0x78],	%f2
	lduw	[%l7 + 0x68],	%g4
	ldd	[%l7 + 0x60],	%g2
	st	%f4,	[%l7 + 0x10]
	sdivx	%g7,	0x041A,	%o6
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x80,	%l6
	nop
	set	0x12, %i5
	stb	%l4,	[%l7 + %i5]
	ldd	[%l7 + 0x40],	%o0
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %i1
	ldxa	[%g0 + %i1] 0x21,	%g1
	stbar
	lduh	[%l7 + 0x32],	%o2
	lduw	[%l7 + 0x4C],	%g2
	ld	[%l7 + 0x54],	%f23
	ldsb	[%l7 + 0x1A],	%i4
	ldsw	[%l7 + 0x1C],	%o4
	sth	%o7,	[%l7 + 0x12]
	std	%f16,	[%l7 + 0x50]
	sth	%l0,	[%l7 + 0x20]
	movcc	%xcc,	%g6,	%o5
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x19,	%i1
	swap	[%l7 + 0x60],	%g5
	std	%f8,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	st	%f2,	[%l7 + 0x38]
	sir	0x0751
	wr	%g0,	0x2f,	%asi
	stxa	%l5,	[%l7 + 0x78] %asi
	membar	#Sync
	stx	%l1,	[%l7 + 0x18]
	sth	%i3,	[%l7 + 0x6A]
	ld	[%l7 + 0x2C],	%f2
	tcc	%icc,	0x4
	lduh	[%l7 + 0x78],	%l3
	wr	%g0,	0x19,	%asi
	stxa	%l2,	[%l7 + 0x20] %asi
	nop
	set	0x34, %i4
	ldsh	[%l7 + %i4],	%o3
	stbar
	stw	%i7,	[%l7 + 0x74]
	stb	%i6,	[%l7 + 0x52]
	fpsub32	%f22,	%f0,	%f22
	nop
	set	0x6C, %g4
	stw	%i0,	[%l7 + %g4]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x78
	tcs	%xcc,	0x1
	lduw	[%l7 + 0x54],	%g4
	wr	%g0,	0x2a,	%asi
	stxa	%i5,	[%l7 + 0x50] %asi
	membar	#Sync
	movrlez	%g7,	0x05C,	%g3
	stx	%o6,	[%l7 + 0x78]
	sth	%l6,	[%l7 + 0x0C]
	std	%f16,	[%l7 + 0x78]
	ld	[%l7 + 0x70],	%f15
	fmovrsgez	%o1,	%f26,	%f9
	ldsh	[%l7 + 0x22],	%g1
	lduh	[%l7 + 0x62],	%o2
	flush	%l7 + 0x4C
	alignaddr	%g2,	%l4,	%i4
	stbar
	ldsw	[%l7 + 0x30],	%o4
	stb	%o7,	[%l7 + 0x65]
	ld	[%l7 + 0x3C],	%f16
	ta	%xcc,	0x7
	ldsw	[%l7 + 0x14],	%g6
	ldsb	[%l7 + 0x3B],	%l0
	addcc	%i1,	%g5,	%i2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o5
	std	%f26,	[%l7 + 0x28]
	nop
	set	0x7E, %l5
	ldstub	[%l7 + %l5],	%l5
	stx	%l1,	[%l7 + 0x50]
	nop
	setx	loop_85,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldub	[%l7 + 0x40],	%i3
	edge32ln	%l3,	%o0,	%l2
	ldub	[%l7 + 0x6A],	%o3
loop_85:
	lduw	[%l7 + 0x34],	%i6
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x04,	%i7
	ta	%xcc,	0x3
	nop
	set	0x20, %i2
	stx	%i0,	[%l7 + %i2]
	prefetch	[%l7 + 0x50],	 0x1
	ldd	[%l7 + 0x30],	%g4
	swap	[%l7 + 0x60],	%i5
	ldstub	[%l7 + 0x3C],	%g7
	tl	%xcc,	0x2
	ldd	[%l7 + 0x20],	%g2
	swap	[%l7 + 0x64],	%l6
	tleu	%xcc,	0x5
	ldsw	[%l7 + 0x58],	%o6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x108
	wr	%g0,	0x52,	%asi
	stxa	%g1,	[%g0 + 0x108] %asi
	ldsw	[%l7 + 0x28],	%o2
	ldub	[%l7 + 0x64],	%o1
	stbar
	stw	%l4,	[%l7 + 0x64]
	ldsw	[%l7 + 0x48],	%g2
	stbar
	ldd	[%l7 + 0x28],	%o4
	ldub	[%l7 + 0x41],	%i4
	ldsb	[%l7 + 0x47],	%g6
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%o6
	fmovdn	%icc,	%f29,	%f6
	ldd	[%l7 + 0x40],	%l0
	ldx	[%l7 + 0x40],	%i1
	stw	%g5,	[%l7 + 0x1C]
	set	0x40, %g3
	stxa	%o5,	[%l7 + %g3] 0x81
	lduw	[%l7 + 0x58],	%i2
	xorcc	%l5,	%l1,	%l3
	movne	%icc,	%i3,	%o0
	tle	%icc,	0x7
	ldd	[%l7 + 0x20],	%o2
	swap	[%l7 + 0x5C],	%i6
	std	%f12,	[%l7 + 0x70]
	ldsw	[%l7 + 0x30],	%i7
	std	%f26,	[%l7 + 0x48]
	stx	%l2,	[%l7 + 0x78]
	fmovs	%f8,	%f28
	tvc	%icc,	0x4
	std	%i0,	[%l7 + 0x10]
	ld	[%l7 + 0x64],	%f25
	prefetch	[%l7 + 0x08],	 0x2
	ldsb	[%l7 + 0x64],	%g4
	swap	[%l7 + 0x18],	%i5
	ldsb	[%l7 + 0x27],	%g3
	ldx	[%l7 + 0x28],	%l6
	swap	[%l7 + 0x28],	%g7
	st	%f4,	[%l7 + 0x20]
	taddcc	%o6,	%o2,	%o1
	ldd	[%l7 + 0x18],	%f8
	flush	%l7 + 0x60
	ldsw	[%l7 + 0x3C],	%g1
	ldd	[%l7 + 0x78],	%f8
	stx	%l4,	[%l7 + 0x30]
	ldsw	[%l7 + 0x10],	%o4
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%g2
	stbar
	ld	[%l7 + 0x48],	%f19
	std	%i4,	[%l7 + 0x58]
	stbar
	ldsb	[%l7 + 0x08],	%g6
	ldsw	[%l7 + 0x7C],	%l0
	ldd	[%l7 + 0x28],	%f28
	flush	%l7 + 0x24
	std	%o6,	[%l7 + 0x30]
	stx	%g5,	[%l7 + 0x58]
	fpadd32s	%f4,	%f27,	%f3
	ldx	[%l7 + 0x60],	%o5
	swap	[%l7 + 0x60],	%i1
	ldd	[%l7 + 0x70],	%i2
	ld	[%l7 + 0x7C],	%f27
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x11,	%l5
	xnor	%l3,	%l1,	%o0
	ldd	[%l7 + 0x60],	%f18
	ldsh	[%l7 + 0x28],	%o3
	prefetch	[%l7 + 0x28],	 0x2
	bcc,a	loop_86
	stbar
	tpos	%icc,	0x5
	stx	%i3,	[%l7 + 0x50]
loop_86:
	ldsh	[%l7 + 0x70],	%i6
	edge16l	%l2,	%i0,	%g4
	rdpr	%cleanwin,	%i7
	ldstub	[%l7 + 0x6C],	%i5
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l6
	stbar
	prefetch	[%l7 + 0x50],	 0x3
	prefetch	[%l7 + 0x74],	 0x1
	popc	0x024B,	%g3
	prefetch	[%l7 + 0x64],	 0x3
	ldx	[%l7 + 0x70],	%o6
	stb	%g7,	[%l7 + 0x30]
	set	0x28, %l6
	stxa	%o2,	[%l7 + %l6] 0x89
	fmovrde	%o1,	%f8,	%f22
	stb	%l4,	[%l7 + 0x42]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g1
	std	%f18,	[%l7 + 0x08]
	ldub	[%l7 + 0x74],	%g2
	st	%f3,	[%l7 + 0x70]
	ldub	[%l7 + 0x6B],	%o4
	wr	%g0,	0x18,	%asi
	stxa	%i4,	[%l7 + 0x60] %asi
	fnot1s	%f12,	%f16
	ld	[%l7 + 0x08],	%f4
	fpsub32s	%f2,	%f15,	%f27
        wr    %g0,    0xe,    %pcr    ! changed.
	lduh	[%l7 + 0x22],	%g5
	std	%f22,	[%l7 + 0x58]
	tcc	%icc,	0x1
	ldd	[%l7 + 0x38],	%o4
	std	%f20,	[%l7 + 0x10]
	ldsh	[%l7 + 0x6E],	%l0
	ldsb	[%l7 + 0x44],	%i1
	ldd	[%l7 + 0x58],	%f0
	ldsh	[%l7 + 0x22],	%i2
	movrlez	%l5,	%l3,	%o0
	tle	%xcc,	0x6
	sth	%l1,	[%l7 + 0x4E]
	stb	%o3,	[%l7 + 0x1C]
	ld	[%l7 + 0x7C],	%f15
	ld	[%l7 + 0x24],	%f31
	ldd	[%l7 + 0x50],	%f18
	nop
	set	0x74, %o6
	ldsw	[%l7 + %o6],	%i6
	stx	%l2,	[%l7 + 0x10]
	stbar
	nop
	set	0x1C, %o4
	ldub	[%l7 + %o4],	%i3
	swap	[%l7 + 0x6C],	%i0
	edge8n	%g4,	%i5,	%i7
	ldd	[%l7 + 0x28],	%i6
	stw	%g3,	[%l7 + 0x3C]
	nop
	set	0x68, %o0
	stw	%g7,	[%l7 + %o0]
	ldsh	[%l7 + 0x72],	%o2
	stb	%o1,	[%l7 + 0x0E]
	ldd	[%l7 + 0x08],	%f4
	ldstub	[%l7 + 0x4E],	%l4
	st	%f31,	[%l7 + 0x48]
	tne	%xcc,	0x3
	ldsh	[%l7 + 0x70],	%o6
	std	%f20,	[%l7 + 0x50]
	std	%g0,	[%l7 + 0x70]
	stx	%g2,	[%l7 + 0x10]
	bn,a	%xcc,	loop_87
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f22
	ldstub	[%l7 + 0x79],	%i4
	stbar
loop_87:
	movg	%icc,	%o4,	%g6
	tsubcctv	%o7,	%g5,	%l0
	array16	%i1,	%o5,	%i2
	ldx	[%l7 + 0x38],	%l3
	st	%f1,	[%l7 + 0x3C]
	stb	%o0,	[%l7 + 0x09]
	ld	[%l7 + 0x5C],	%f11
	fcmped	%fcc3,	%f20,	%f26
	xnor	%l1,	%o3,	%i6
	swap	[%l7 + 0x2C],	%l2
	ldx	[%l7 + 0x78],	%l5
	std	%f0,	[%l7 + 0x78]
	swap	[%l7 + 0x4C],	%i0
	ldd	[%l7 + 0x60],	%i2
	xor	%i5,	0x1F4D,	%i7
	ldub	[%l7 + 0x24],	%g4
	wr	%g0,	0x10,	%asi
	stxa	%l6,	[%l7 + 0x08] %asi
	st	%f0,	[%l7 + 0x34]
	wr	%g7,	0x149A,	%clear_softint
	ldsb	[%l7 + 0x1B],	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%g3,	[%g0 + 0x18] %asi
	ldd	[%l7 + 0x68],	%f20
	ld	[%l7 + 0x64],	%f0
	prefetch	[%l7 + 0x40],	 0x1
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f16
	rd	%fprs,	%l4
	sth	%o6,	[%l7 + 0x34]
	xor	%o1,	%g1,	%g2
	ldd	[%l7 + 0x58],	%f4
	stb	%o4,	[%l7 + 0x4A]
	ldd	[%l7 + 0x58],	%g6
	stb	%i4,	[%l7 + 0x7E]
	set	0x70, %i7
	stxa	%o7,	[%l7 + %i7] 0x2a
	membar	#Sync
	ldsb	[%l7 + 0x7E],	%l0
	ld	[%l7 + 0x2C],	%f31
	stw	%i1,	[%l7 + 0x64]
	fcmpgt32	%f8,	%f10,	%o5
	ldsh	[%l7 + 0x48],	%i2
	lduh	[%l7 + 0x2E],	%g5
	ldub	[%l7 + 0x22],	%l3
	lduh	[%l7 + 0x40],	%o0
	fmovsne	%xcc,	%f6,	%f24
	nop
	set	0x14, %l3
	ldsw	[%l7 + %l3],	%o3
	swap	[%l7 + 0x5C],	%l1
	rd	%asi,	%l2
	flush	%l7 + 0x4C
	alignaddrl	%l5,	%i6,	%i0
	ld	[%l7 + 0x70],	%f20
	stbar
	lduh	[%l7 + 0x38],	%i5
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%i6
	std	%g4,	[%l7 + 0x58]
	std	%i2,	[%l7 + 0x20]
	ldsh	[%l7 + 0x5A],	%g7
	fpadd32	%f0,	%f22,	%f22
	stbar
	movrgez	%o2,	%l6,	%g3
	ldsb	[%l7 + 0x0E],	%l4
	lduh	[%l7 + 0x74],	%o1
	ldsw	[%l7 + 0x64],	%g1
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x1d,	%o6
	flush	%l7 + 0x38
	nop
	set	0x38, %l1
	stx	%o4,	[%l7 + %l1]
	nop
	set	0x22, %o1
	ldsh	[%l7 + %o1],	%g2
	nop
	set	0x3E, %g2
	ldstub	[%l7 + %g2],	%i4
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	set	0x110, %i0
	stxa	%o7,	[%g0 + %i0] 0x52
	std	%g6,	[%l7 + 0x38]
	lduw	[%l7 + 0x08],	%i1
	prefetch	[%l7 + 0x3C],	 0x0
	swap	[%l7 + 0x28],	%l0
	sth	%o5,	[%l7 + 0x12]
	stbar
	swap	[%l7 + 0x40],	%i2
	sth	%l3,	[%l7 + 0x68]
	nop
	set	0x22, %l0
	ldub	[%l7 + %l0],	%o0
	fpsub16s	%f18,	%f9,	%f13
	ldstub	[%l7 + 0x13],	%g5
	add	%o3,	%l1,	%l2
	stx	%l5,	[%l7 + 0x58]
	ld	[%l7 + 0x1C],	%f30
	ldsb	[%l7 + 0x41],	%i0
	ldub	[%l7 + 0x2F],	%i5
	prefetch	[%l7 + 0x70],	 0x3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%i7,	[%g0 + 0x0] %asi
	mova	%icc,	%g4,	%i6
	stbar
	fnands	%f26,	%f16,	%f12
	std	%f14,	[%l7 + 0x60]
	tle	%icc,	0x7
	fmovsvs	%xcc,	%f4,	%f22
	stbar
	edge16n	%i3,	%o2,	%l6
	tle	%xcc,	0x4
	lduh	[%l7 + 0x56],	%g7
	swap	[%l7 + 0x40],	%l4
	fbne,a	%fcc0,	loop_88
	stb	%o1,	[%l7 + 0x0E]
	ldx	[%l7 + 0x58],	%g3
	ldsh	[%l7 + 0x6C],	%o6
loop_88:
	stw	%o4,	[%l7 + 0x38]
	stbar
	wrpr	%g2,	%g1,	%pil
	ldub	[%l7 + 0x28],	%i4
	andcc	%o7,	%i1,	%g6
	xorcc	%o5,	%i2,	%l0
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x0c,	%l3
	sdiv	%g5,	0x1A8F,	%o3
	swap	[%l7 + 0x14],	%l1
	lduw	[%l7 + 0x24],	%l2
	ldstub	[%l7 + 0x0D],	%o0
	prefetch	[%l7 + 0x54],	 0x2
	ld	[%l7 + 0x14],	%f23
	stbar
	st	%f5,	[%l7 + 0x30]
	ldd	[%l7 + 0x50],	%l4
	stb	%i5,	[%l7 + 0x23]
	prefetch	[%l7 + 0x50],	 0x0
	std	%f4,	[%l7 + 0x30]
	sth	%i7,	[%l7 + 0x4A]
	ldub	[%l7 + 0x73],	%i0
	ldsb	[%l7 + 0x42],	%i6
	ldd	[%l7 + 0x38],	%g4
	nop
	set	0x48, %l4
	stw	%o2,	[%l7 + %l4]
	swap	[%l7 + 0x3C],	%i3
	std	%f16,	[%l7 + 0x30]
	alignaddrl	%l6,	%l4,	%g7
	prefetch	[%l7 + 0x44],	 0x3
	ldsw	[%l7 + 0x1C],	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEEE, 	%hsys_tick_cmpr
	swap	[%l7 + 0x48],	%o6
	ldx	[%l7 + 0x08],	%o4
	stx	%g2,	[%l7 + 0x60]
	stbar
	stw	%i4,	[%l7 + 0x14]
	set	0x28, %i5
	stxa	%g1,	[%l7 + %i5] 0x18
	st	%f11,	[%l7 + 0x18]
	ldub	[%l7 + 0x42],	%o7
	ldsh	[%l7 + 0x66],	%g6
	prefetch	[%l7 + 0x70],	 0x2
	ldd	[%l7 + 0x10],	%f30
	movrlez	%o5,	%i1,	%l0
	std	%f0,	[%l7 + 0x10]
	ldd	[%l7 + 0x40],	%l2
	stw	%i2,	[%l7 + 0x30]
	nop
	set	0x52, %g6
	stb	%o3,	[%l7 + %g6]
	sethi	0x1FCE,	%g5
	fpackfix	%f4,	%f17
	ldsw	[%l7 + 0x48],	%l2
	stb	%l1,	[%l7 + 0x78]
	prefetch	[%l7 + 0x1C],	 0x0
	ldx	[%l7 + 0x78],	%o0
	flush	%l7 + 0x6C
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%l5,	[%g0 + 0x8] %asi
	sth	%i7,	[%l7 + 0x32]
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i0
	stbar
	membar	0x0B
	lduh	[%l7 + 0x78],	%i5
	ldub	[%l7 + 0x77],	%g4
	stb	%i6,	[%l7 + 0x4F]
	ld	[%l7 + 0x5C],	%f24
	st	%f0,	[%l7 + 0x34]
	prefetch	[%l7 + 0x5C],	 0x2
	wr	%g0,	0x88,	%asi
	stxa	%i3,	[%l7 + 0x18] %asi
	udivcc	%l6,	0x04C7,	%o2
	movvs	%xcc,	%g7,	%g3
	flush	%l7 + 0x34
	stw	%l4,	[%l7 + 0x58]
	ldx	[%l7 + 0x50],	%o1
	movge	%xcc,	%o6,	%g2
	ldsh	[%l7 + 0x5C],	%i4
	stw	%g1,	[%l7 + 0x34]
	lduw	[%l7 + 0x54],	%o7
	stx	%o4,	[%l7 + 0x58]
	ldub	[%l7 + 0x4B],	%g6
	stbar
	st	%f18,	[%l7 + 0x1C]
	ld	[%l7 + 0x74],	%f25
	nop
	set	0x18, %i6
	lduw	[%l7 + %i6],	%o5
	stw	%i1,	[%l7 + 0x30]
	ldstub	[%l7 + 0x2E],	%l0
	tcc	%xcc,	0x6
	ldsb	[%l7 + 0x64],	%l3
	lduh	[%l7 + 0x3A],	%i2
	stb	%o3,	[%l7 + 0x54]
	stx	%l2,	[%l7 + 0x68]
	swap	[%l7 + 0x24],	%g5
	sdivcc	%o0,	0x03DB,	%l5
	fbuge	%fcc0,	loop_89
	st	%f23,	[%l7 + 0x28]
	ld	[%l7 + 0x78],	%f14
	ld	[%l7 + 0x2C],	%f13
loop_89:
	std	%i6,	[%l7 + 0x68]
	ldsw	[%l7 + 0x68],	%i0
	bneg	loop_90
	lduh	[%l7 + 0x22],	%l1
	ldsb	[%l7 + 0x39],	%g4
	ldstub	[%l7 + 0x20],	%i6
loop_90:
	nop
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i5
	addcc	%i3,	0x1079,	%o2
	sth	%g7,	[%l7 + 0x24]
	ldd	[%l7 + 0x28],	%g2
	nop
	set	0x7F, %i4
	stb	%l6,	[%l7 + %i4]
	wr	%g0,	0xe3,	%asi
	stxa	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
	lduh	[%l7 + 0x40],	%o6
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%f6
	lduw	[%l7 + 0x54],	%l4
	ldsh	[%l7 + 0x0A],	%i4
	ldub	[%l7 + 0x4E],	%g1
	stb	%g2,	[%l7 + 0x32]
	stx	%o4,	[%l7 + 0x18]
	ldx	[%l7 + 0x48],	%o7
	subc	%o5,	0x1AC6,	%i1
	stbar
	std	%f14,	[%l7 + 0x28]
	ldstub	[%l7 + 0x12],	%l0
	ldstub	[%l7 + 0x41],	%l3
	bgu,a,pt	%xcc,	loop_91
	movl	%xcc,	%i2,	%o3
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x18,	%g6
loop_91:
	ldub	[%l7 + 0x6D],	%g5
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%o0
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f22
	stb	%l5,	[%l7 + 0x38]
	ldsb	[%l7 + 0x4B],	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB73, 	%hsys_tick_cmpr
	ld	[%l7 + 0x44],	%f2
	sir	0x0F67
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	set	0x8, %i2
	stxa	%g4,	[%g0 + %i2] 0x21
	fmovscs	%xcc,	%f4,	%f14
	fpsub16	%f22,	%f18,	%f18
	ldd	[%l7 + 0x40],	%f10
	ldx	[%l7 + 0x50],	%i0
	stbar
	st	%f1,	[%l7 + 0x60]
	swap	[%l7 + 0x1C],	%i6
	ldstub	[%l7 + 0x6F],	%i5
	ld	[%l7 + 0x24],	%f17
	ldd	[%l7 + 0x50],	%f28
	sllx	%i3,	0x06,	%o2
	ldub	[%l7 + 0x75],	%g7
	ldsh	[%l7 + 0x2E],	%l6
	set	0x28, %g3
	stxa	%g3,	[%l7 + %g3] 0x80
	stb	%o1,	[%l7 + 0x1B]
	addccc	%l4,	%o6,	%g1
	ldsw	[%l7 + 0x48],	%i4
	sth	%g2,	[%l7 + 0x1A]
	movle	%icc,	%o4,	%o5
	stbar
	stbar
	set	0x58, %o7
	stxa	%o7,	[%l7 + %o7] 0x2f
	membar	#Sync
	addccc	%l0,	0x1C70,	%i1
	nop
	set	0x08, %i3
	std	%f28,	[%l7 + %i3]
	st	%f3,	[%l7 + 0x48]
	and	%i2,	0x1141,	%l3
	stx	%g6,	[%l7 + 0x40]
	swap	[%l7 + 0x70],	%o3
	stx	%o0,	[%l7 + 0x48]
	stx	%l5,	[%l7 + 0x18]
	stx	%i7,	[%l7 + 0x28]
	std	%l2,	[%l7 + 0x48]
	swap	[%l7 + 0x20],	%g5
	fmovscs	%icc,	%f26,	%f6
	st	%f11,	[%l7 + 0x0C]
	nop
	set	0x48, %g5
	sth	%g4,	[%l7 + %g5]
	std	%f22,	[%l7 + 0x10]
	wr	%g0,	0x89,	%asi
	stxa	%i0,	[%l7 + 0x58] %asi
	fmovdcc	%icc,	%f30,	%f3
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %l6
	ldxa	[%g0 + %l6] 0x21,	%i6
	swap	[%l7 + 0x18],	%l1
	ldx	[%l7 + 0x28],	%i3
	ldstub	[%l7 + 0x12],	%o2
	lduw	[%l7 + 0x1C],	%i5
	flush	%l7 + 0x1C
	bn,pt	%icc,	loop_92
	rdpr	%wstate,	%g7
	wr	%l6,	%o1,	%ccr
	swap	[%l7 + 0x54],	%l4
loop_92:
	stb	%o6,	[%l7 + 0x3C]
	fcmpd	%fcc3,	%f14,	%f12
	ldd	[%l7 + 0x70],	%g0
	lduh	[%l7 + 0x36],	%g3
	stb	%g2,	[%l7 + 0x4B]
	stb	%o4,	[%l7 + 0x51]
	stb	%i4,	[%l7 + 0x77]
	nop
	set	0x4C, %o4
	lduw	[%l7 + %o4],	%o7
	swap	[%l7 + 0x68],	%l0
	st	%f21,	[%l7 + 0x7C]
	tn	%icc,	0x0
	ldsh	[%l7 + 0x76],	%i1
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%o5
	ldsb	[%l7 + 0x3D],	%i2
	sub	%l3,	0x196D,	%o3
	st	%f17,	[%l7 + 0x74]
	ldd	[%l7 + 0x10],	%g6
	sth	%l5,	[%l7 + 0x24]
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x14,	%i7
	flush	%l7 + 0x68
	fbug,a	%fcc0,	loop_93
	nop
	set	0x1F, %o3
	ldub	[%l7 + %o3],	%o0
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	wr	%g0,	0x21,	%asi
	stxa	%g5,	[%g0 + 0x10] %asi
loop_93:
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1a8
	nop
	set	0x1a8, %o5
	nop 	! 	nop 	! 	ldxa	[%g0 + %o5] 0x40,	%l2 ripped by fixASI40.pl ripped by fixASI40.pl
	ldsw	[%l7 + 0x7C],	%i0
	ldstub	[%l7 + 0x4C],	%i6
	flush	%l7 + 0x10
	stw	%l1,	[%l7 + 0x28]
	sth	%g4,	[%l7 + 0x62]
	ldsh	[%l7 + 0x78],	%i3
	taddcc	%i5,	%g7,	%o2
	lduh	[%l7 + 0x2E],	%o1
	ldsw	[%l7 + 0x3C],	%l6
	stx	%o6,	[%l7 + 0x68]
	ldx	[%l7 + 0x30],	%l4
	ld	[%l7 + 0x58],	%f10
	ldsw	[%l7 + 0x08],	%g3
	wr	%g2,	0x1E05,	%set_softint
	stw	%g1,	[%l7 + 0x68]
	ldstub	[%l7 + 0x63],	%i4
	ldub	[%l7 + 0x2C],	%o7
	edge16ln	%o4,	%l0,	%o5
	prefetch	[%l7 + 0x18],	 0x2
	swap	[%l7 + 0x28],	%i1
	ldub	[%l7 + 0x50],	%i2
	ld	[%l7 + 0x24],	%f30
	rdhpr	%hpstate,	%l3
	stbar
	ldd	[%l7 + 0x20],	%f16
	ldsh	[%l7 + 0x60],	%o3
	stw	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x2C],	%f3
	stw	%g6,	[%l7 + 0x24]
	swap	[%l7 + 0x74],	%o0
	swap	[%l7 + 0x20],	%i7
	fbue,a	%fcc0,	loop_94
	addcc	%g5,	%l2,	%i0
	movrne	%l1,	%g4,	%i3
	sth	%i6,	[%l7 + 0x4E]
loop_94:
	wrpr	%i5,	0x0B01,	%pil
	flush	%l7 + 0x14
	be,pt	%icc,	loop_95
	fmovdgu	%xcc,	%f2,	%f3
	tg	%icc,	0x1
	stx	%g7,	[%l7 + 0x58]
loop_95:
	sth	%o1,	[%l7 + 0x7A]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f28,	%f28,	%f8
	stb	%o2,	[%l7 + 0x52]
	ldd	[%l7 + 0x10],	%f8
	ldsw	[%l7 + 0x1C],	%o6
	nop
	set	0x5F, %l3
	ldstub	[%l7 + %l3],	%l6
	stb	%l4,	[%l7 + 0x3F]
	fnand	%f24,	%f12,	%f8
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1b8
	set	0x1b8, %i7
	nop 	! 	nop 	! 	ldxa	[%g0 + %i7] 0x40,	%g3 ripped by fixASI40.pl ripped by fixASI40.pl
	nop
	set	0x18, %l2
	lduh	[%l7 + %l2],	%g2
	flush	%l7 + 0x58
	udivcc	%g1,	0x1210,	%i4
	wrpr	%o4,	0x058B,	%pil
	std	%l0,	[%l7 + 0x50]
	sth	%o7,	[%l7 + 0x4C]
	st	%f15,	[%l7 + 0x6C]
	wr	%o5,	0x0784,	%y
	std	%i0,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i2
	rd	%asi,	%o3
	swap	[%l7 + 0x0C],	%l5
	ldx	[%l7 + 0x30],	%g6
	bne,a,pn	%icc,	loop_96
	ldstub	[%l7 + 0x78],	%l3
	prefetch	[%l7 + 0x2C],	 0x1
	fones	%f7
loop_96:
	std	%f18,	[%l7 + 0x60]
	ldsb	[%l7 + 0x12],	%i7
	ldx	[%l7 + 0x20],	%o0
	ldd	[%l7 + 0x30],	%l2
	std	%f6,	[%l7 + 0x48]
	std	%i0,	[%l7 + 0x28]
	ldsw	[%l7 + 0x60],	%g5
	std	%l0,	[%l7 + 0x78]
	ldub	[%l7 + 0x0F],	%i3
	sth	%g4,	[%l7 + 0x4E]
	fmovsneg	%icc,	%f12,	%f16
	prefetch	[%l7 + 0x74],	 0x3
	sth	%i6,	[%l7 + 0x0A]
	tvc	%xcc,	0x6
	fbne,a	%fcc1,	loop_97
	flush	%l7 + 0x60
	rd	%ccr,	%i5
	stw	%o1,	[%l7 + 0x54]
loop_97:
	stbar
	prefetch	[%l7 + 0x1C],	 0x1
	ldsb	[%l7 + 0x7C],	%g7
	ld	[%l7 + 0x7C],	%f8
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o6
	ta	%icc,	0x6
	nop
	set	0x7E, %l1
	ldstub	[%l7 + %l1],	%l6
	swap	[%l7 + 0x78],	%l4
	ld	[%l7 + 0x2C],	%f5
	ldd	[%l7 + 0x10],	%g2
	set	0x30, %o1
	stxa	%g2,	[%l7 + %o1] 0x1d
	ldub	[%l7 + 0x3C],	%g1
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%i4,	[%g0 + 0x0] %asi
	ld	[%l7 + 0x6C],	%f26
	ldx	[%l7 + 0x18],	%o4
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	set	0x8, %o2
	ldxa	[%g0 + %o2] 0x21,	%o2
	stw	%l0,	[%l7 + 0x28]
	stw	%o5,	[%l7 + 0x44]
	sra	%o7,	0x17,	%i2
	ldx	[%l7 + 0x68],	%i1
	ldx	[%l7 + 0x08],	%o3
	lduw	[%l7 + 0x70],	%l5
	prefetch	[%l7 + 0x60],	 0x3
	stb	%l3,	[%l7 + 0x20]
	stx	%i7,	[%l7 + 0x60]
	ldsw	[%l7 + 0x6C],	%o0
	stw	%g6,	[%l7 + 0x2C]
	sth	%i0,	[%l7 + 0x60]
	prefetch	[%l7 + 0x28],	 0x2
	swap	[%l7 + 0x6C],	%g5
	wrpr	%l1,	%i3,	%pil
	set	0x58, %i0
	stxa	%l2,	[%l7 + %i0] 0xe3
	membar	#Sync
	swap	[%l7 + 0x24],	%i6
	nop
	set	0x20, %g2
	stw	%g4,	[%l7 + %g2]
	set	0x10, %l0
	stxa	%o1,	[%l7 + %l0] 0x81
	ldx	[%l7 + 0x58],	%i5
	nop
	set	0x30, %g7
	lduw	[%l7 + %g7],	%o6
	std	%f6,	[%l7 + 0x28]
	ldsw	[%l7 + 0x24],	%l6
	nop
	set	0x0D, %l4
	ldstub	[%l7 + %l4],	%g7
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%g3,	[%g0 + 0x8] %asi
	stw	%l4,	[%l7 + 0x28]
	stb	%g2,	[%l7 + 0x7D]
	ldsh	[%l7 + 0x5C],	%g1
	ldd	[%l7 + 0x30],	%i4
	for	%f30,	%f26,	%f2
	lduh	[%l7 + 0x7E],	%o4
	ldd	[%l7 + 0x70],	%f22
	stbar
	flush	%l7 + 0x6C
	ldx	[%l7 + 0x60],	%o2
	stx	%l0,	[%l7 + 0x08]
	ldd	[%l7 + 0x50],	%o6
	stb	%o5,	[%l7 + 0x70]
	nop
	set	0x2F, %i5
	ldub	[%l7 + %i5],	%i1
	ld	[%l7 + 0x24],	%f19
	ldd	[%l7 + 0x50],	%f10
	st	%f14,	[%l7 + 0x5C]
	edge32l	%o3,	%i2,	%l3
	ldsh	[%l7 + 0x5E],	%l5
	ldd	[%l7 + 0x20],	%o0
	nop
	set	0x30, %g6
	lduh	[%l7 + %g6],	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g6
	swap	[%l7 + 0x10],	%i0
	flush	%l7 + 0x6C
	stbar
	stb	%l1,	[%l7 + 0x13]
	lduh	[%l7 + 0x0A],	%i3
	wr	%g0,	0x23,	%asi
	stxa	%g5,	[%l7 + 0x20] %asi
	membar	#Sync
	edge32	%i6,	%l2,	%g4
	flush	%l7 + 0x0C
	ldx	[%l7 + 0x40],	%o1
	faligndata	%f2,	%f18,	%f18
	ldx	[%l7 + 0x60],	%i5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	stxa	%o6,	[%g0 + 0x110] %asi
	stw	%g7,	[%l7 + 0x48]
	ldub	[%l7 + 0x74],	%g3
	tn	%icc,	0x7
	stw	%l4,	[%l7 + 0x64]
	rdpr	%cleanwin,	%g2
	stx	%g1,	[%l7 + 0x48]
	std	%f4,	[%l7 + 0x10]
	prefetch	[%l7 + 0x24],	 0x2
	ldstub	[%l7 + 0x67],	%l6
	nop
	set	0x78, %i6
	std	%f26,	[%l7 + %i6]
	ldd	[%l7 + 0x40],	%f0
	stb	%o4,	[%l7 + 0x58]
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f0
	xnor	%o2,	%i4,	%l0
	st	%f10,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x38],	%o7
	lduw	[%l7 + 0x0C],	%o5
	std	%o2,	[%l7 + 0x28]
	ldub	[%l7 + 0x4B],	%i2
	ldx	[%l7 + 0x08],	%i1
	rd	%softint,	%l3
	lduh	[%l7 + 0x1C],	%o0
	flush	%l7 + 0x28
	st	%f3,	[%l7 + 0x2C]
	ldub	[%l7 + 0x2E],	%l5
	ldstub	[%l7 + 0x7E],	%g6
	ldd	[%l7 + 0x08],	%f26
	flush	%l7 + 0x7C
	stb	%i0,	[%l7 + 0x2E]
	ldd	[%l7 + 0x10],	%l0
	ldsh	[%l7 + 0x2C],	%i7
	bvc,pn	%icc,	loop_98
	ld	[%l7 + 0x48],	%f25
	ldx	[%l7 + 0x20],	%g5
	std	%f8,	[%l7 + 0x20]
loop_98:
	nop
	set	0x50, %g4
	stxa	%i3,	[%l7 + %g4] 0x11
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x88,	%l2
	std	%i6,	[%l7 + 0x78]
	ldub	[%l7 + 0x79],	%g4
	nop
	set	0x54, %i1
	stb	%o1,	[%l7 + %i1]
	ldsh	[%l7 + 0x08],	%o6
	nop
	set	0x74, %g1
	ldsh	[%l7 + %g1],	%g7
	sll	%i5,	0x11,	%g3
	fmovscs	%xcc,	%f7,	%f10
	ldx	[%l7 + 0x08],	%l4
	stw	%g1,	[%l7 + 0x48]
	ldsh	[%l7 + 0x60],	%l6
	subccc	%g2,	0x18CB,	%o2
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f14
	std	%i4,	[%l7 + 0x50]
	rdpr	%cleanwin,	%l0
	ldsw	[%l7 + 0x1C],	%o7
	ldsb	[%l7 + 0x2E],	%o5
	ld	[%l7 + 0x38],	%f30
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%o4
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f10
	std	%i2,	[%l7 + 0x38]
	lduh	[%l7 + 0x6A],	%o3
	ldub	[%l7 + 0x0F],	%i1
	std	%o0,	[%l7 + 0x58]
	stx	%l5,	[%l7 + 0x28]
	stw	%l3,	[%l7 + 0x64]
	prefetch	[%l7 + 0x18],	 0x2
	fmovdne	%icc,	%f17,	%f26
	lduw	[%l7 + 0x7C],	%g6
	ldd	[%l7 + 0x08],	%f18
	stb	%l1,	[%l7 + 0x68]
	ldsh	[%l7 + 0x66],	%i0
	ldd	[%l7 + 0x58],	%f16
	ldsw	[%l7 + 0x58],	%i7
	ldsw	[%l7 + 0x18],	%i3
	ld	[%l7 + 0x70],	%f11
	swap	[%l7 + 0x0C],	%l2
	ldsh	[%l7 + 0x20],	%g5
	ldub	[%l7 + 0x27],	%i6
	st	%f6,	[%l7 + 0x68]
	flush	%l7 + 0x70
	addc	%o1,	0x02B8,	%o6
	ldsb	[%l7 + 0x5F],	%g4
	fmovdn	%icc,	%f31,	%f30
	ldsw	[%l7 + 0x24],	%g7
	nop
	set	0x6A, %g5
	ldsh	[%l7 + %g5],	%i5
	prefetch	[%l7 + 0x38],	 0x1
	std	%f26,	[%l7 + 0x68]
	fmovsge	%xcc,	%f29,	%f12
	stw	%g3,	[%l7 + 0x28]
	flush	%l7 + 0x2C
	stbar
	fbe,a	%fcc2,	loop_99
	stb	%g1,	[%l7 + 0x0C]
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%l6,	[%g0 + 0x0] %asi
loop_99:
	movre	%l4,	0x27D,	%g2
	ldd	[%l7 + 0x50],	%f12
	ldsw	[%l7 + 0x34],	%o2
	mulscc	%i4,	0x074E,	%l0
	flush	%l7 + 0x24
	ldx	[%l7 + 0x50],	%o5
	ldd	[%l7 + 0x30],	%f2
	fmovrslez	%o7,	%f17,	%f15
	ld	[%l7 + 0x28],	%f3
	ldd	[%l7 + 0x20],	%f14
	edge32n	%o4,	%i2,	%i1
	ldsw	[%l7 + 0x7C],	%o0
	ldsh	[%l7 + 0x5E],	%o3
	fpadd16s	%f27,	%f13,	%f22
	ldsw	[%l7 + 0x70],	%l5
	sdiv	%g6,	0x0956,	%l1
	ldd	[%l7 + 0x60],	%f14
	bvc,pt	%icc,	loop_100
	ldd	[%l7 + 0x78],	%f12
	set	0x48, %i2
	stxa	%l3,	[%l7 + %i2] 0x11
loop_100:
	ldd	[%l7 + 0x68],	%f12
	and	%i0,	0x03B1,	%i7
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x07D, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x3A],	%l2
	stb	%o1,	[%l7 + 0x3C]
	fblg,a	%fcc1,	loop_101
	srl	%g4,	0x0F,	%g7
	ldub	[%l7 + 0x5D],	%i5
	ldstub	[%l7 + 0x79],	%o6
loop_101:
	nop
	set	0x68, %o4
	lduw	[%l7 + %o4],	%g1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o6
	ldxa	[%g0 + %o6] 0x4f,	%l6
	brgz,a	%l4,	loop_102
	std	%g2,	[%l7 + 0x20]
	movre	%g2,	%i4,	%l0
	ldsb	[%l7 + 0x78],	%o5
loop_102:
	ldd	[%l7 + 0x30],	%o6
	lduh	[%l7 + 0x30],	%o2
	stbar
	sth	%i2,	[%l7 + 0x66]
	stbar
	ldsb	[%l7 + 0x5C],	%o4
	ldstub	[%l7 + 0x2C],	%o0
	ldsh	[%l7 + 0x34],	%i1
	popc	0x0DD0,	%o3
	st	%f13,	[%l7 + 0x40]
	sth	%l5,	[%l7 + 0x38]
	ldsb	[%l7 + 0x6F],	%g6
	ldsw	[%l7 + 0x38],	%l3
	std	%l0,	[%l7 + 0x18]
	flush	%l7 + 0x08
	ldub	[%l7 + 0x53],	%i0
	sth	%i7,	[%l7 + 0x0A]
	stx	%g5,	[%l7 + 0x30]
	swap	[%l7 + 0x24],	%i6
	or	%i3,	%l2,	%o1
	nop
	set	0x4E, %l6
	lduh	[%l7 + %l6],	%g7
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%i5
	flush	%l7 + 0x24
	ldd	[%l7 + 0x58],	%g4
	ldstub	[%l7 + 0x3D],	%o6
	prefetch	[%l7 + 0x64],	 0x3
	ldsh	[%l7 + 0x6E],	%l6
	stbar
	nop
	set	0x66, %o5
	sth	%g1,	[%l7 + %o5]
	wr	%g0,	0x27,	%asi
	stxa	%g3,	[%l7 + 0x70] %asi
	membar	#Sync
	lduw	[%l7 + 0x34],	%l4
	stw	%g2,	[%l7 + 0x0C]
	ldsw	[%l7 + 0x3C],	%i4
	ldx	[%l7 + 0x28],	%l0
	fbge	%fcc2,	loop_103
	st	%f2,	[%l7 + 0x08]
	fmovrdgez	%o5,	%f16,	%f30
	movvs	%icc,	%o2,	%o7
loop_103:
	swap	[%l7 + 0x74],	%o4
	fmovdgu	%xcc,	%f15,	%f14
	ld	[%l7 + 0x1C],	%f23
	alignaddr	%o0,	%i1,	%i2
	ld	[%l7 + 0x30],	%f8
	popc	0x09BF,	%l5
	sth	%g6,	[%l7 + 0x2C]
	ld	[%l7 + 0x44],	%f21
	stb	%l3,	[%l7 + 0x08]
	std	%f14,	[%l7 + 0x70]
	ldx	[%l7 + 0x08],	%l1
	stbar
	flushw
	std	%f6,	[%l7 + 0x10]
	std	%f0,	[%l7 + 0x28]
	srl	%i0,	%i7,	%g5
	fble,a	%fcc3,	loop_104
	ldd	[%l7 + 0x10],	%i6
	swap	[%l7 + 0x08],	%o3
	bpos,a	%xcc,	loop_105
loop_104:
	swap	[%l7 + 0x48],	%i3
	ldd	[%l7 + 0x08],	%f18
	ld	[%l7 + 0x68],	%f24
loop_105:
	ldd	[%l7 + 0x68],	%o0
	lduw	[%l7 + 0x44],	%l2
	ldsw	[%l7 + 0x18],	%g7
	ldstub	[%l7 + 0x41],	%g4
	ldsw	[%l7 + 0x70],	%i5
	ldsw	[%l7 + 0x14],	%o6
	set	0x58, %o0
	stxa	%g1,	[%l7 + %o0] 0x11
	stx	%l6,	[%l7 + 0x30]
	flush	%l7 + 0x54
	stw	%l4,	[%l7 + 0x08]
	stbar
	st	%f30,	[%l7 + 0x60]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g3,	0x23B,	%i4
	fmovsgu	%xcc,	%f24,	%f13
	std	%g2,	[%l7 + 0x18]
	stb	%l0,	[%l7 + 0x5D]
	rd	%softint,	%o5
	udiv	%o2,	0x1F68,	%o4
	ldub	[%l7 + 0x1E],	%o7
	lduw	[%l7 + 0x74],	%o0
	prefetch	[%l7 + 0x74],	 0x3
	st	%f31,	[%l7 + 0x4C]
	nop
	set	0x20, %l3
	ldub	[%l7 + %l3],	%i1
	nop
	set	0x6C, %l2
	stw	%l5,	[%l7 + %l2]
	umulcc	%g6,	%l1,	%i0
	ldsw	[%l7 + 0x24],	%i7
	lduh	[%l7 + 0x30],	%g5
	ldsh	[%l7 + 0x10],	%i6
	stw	%l3,	[%l7 + 0x3C]
	set	0x38, %i7
	stxa	%o3,	[%l7 + %i7] 0x15
	set	0x68, %l1
	stxa	%o1,	[%l7 + %l1] 0x15
	set	0x60, %o1
	stxa	%i3,	[%l7 + %o1] 0x14
	prefetch	[%l7 + 0x60],	 0x2
	std	%l2,	[%l7 + 0x58]
	lduh	[%l7 + 0x20],	%g7
	prefetch	[%l7 + 0x48],	 0x1
	ldsw	[%l7 + 0x7C],	%g4
	stb	%o6,	[%l7 + 0x3D]
	ldd	[%l7 + 0x38],	%f0
	flush	%l7 + 0x38
	ldub	[%l7 + 0x2E],	%i5
	fnors	%f11,	%f29,	%f23
	mulscc	%g1,	%l6,	%g3
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x30
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i0
	ldxa	[%g0 + %i0] 0x20,	%i4
	ld	[%l7 + 0x50],	%f20
	fmovscs	%xcc,	%f24,	%f25
	ldstub	[%l7 + 0x0F],	%l0
	set	0x08, %g2
	stxa	%g2,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x50, %o2
	stw	%o2,	[%l7 + %o2]
	stx	%o5,	[%l7 + 0x18]
	stx	%o7,	[%l7 + 0x58]
	ldstub	[%l7 + 0x79],	%o0
	ldsb	[%l7 + 0x1F],	%i2
	ldub	[%l7 + 0x5A],	%o4
	nop
	set	0x38, %g7
	lduh	[%l7 + %g7],	%l5
	ldx	[%l7 + 0x58],	%g6
	flush	%l7 + 0x54
	wr	%g0,	0x89,	%asi
	stxa	%l1,	[%l7 + 0x38] %asi
	ldub	[%l7 + 0x64],	%i0
	rdhpr	%htba,	%i7
	st	%f20,	[%l7 + 0x18]
	ldsh	[%l7 + 0x38],	%i1
	st	%f31,	[%l7 + 0x4C]
	ldx	[%l7 + 0x18],	%g5
	fone	%f0
	stx	%l3,	[%l7 + 0x38]
	fmovrde	%o3,	%f12,	%f8

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x007, 	%sys_tick_cmpr
	ldub	[%l7 + 0x3C],	%o1
	ldstub	[%l7 + 0x4E],	%l2
	edge8n	%g4,	%o6,	%g7
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%g1
	prefetch	[%l7 + 0x7C],	 0x0
	ldd	[%l7 + 0x20],	%f30
	ldsb	[%l7 + 0x5C],	%l6
	swap	[%l7 + 0x38],	%i5
	tge	%icc,	0x6
	ldsw	[%l7 + 0x0C],	%g3
	stb	%l4,	[%l7 + 0x27]
	wrpr	%l0,	0x1D71,	%pil
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f18
	ldd	[%l7 + 0x40],	%f6
	movleu	%xcc,	%i4,	%g2
	edge8l	%o5,	%o2,	%o7
	sth	%i2,	[%l7 + 0x14]
	ldsb	[%l7 + 0x3E],	%o4
	stx	%o0,	[%l7 + 0x38]
	sth	%l5,	[%l7 + 0x26]
	fcmple32	%f30,	%f0,	%g6
	stbar
	fmuld8sux16	%f22,	%f13,	%f26
	ld	[%l7 + 0x08],	%f5
	ldd	[%l7 + 0x30],	%i0
	stb	%l1,	[%l7 + 0x3A]
	ldsh	[%l7 + 0x16],	%i7
	std	%g4,	[%l7 + 0x38]
	stbar
	lduh	[%l7 + 0x6E],	%l3
	ldsh	[%l7 + 0x5A],	%i1
	tne	%xcc,	0x2
	ldx	[%l7 + 0x78],	%i6
	stb	%i3,	[%l7 + 0x11]
	stbar
	lduh	[%l7 + 0x08],	%o1
	lduw	[%l7 + 0x54],	%l2
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%g4
	stw	%o3,	[%l7 + 0x54]
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f18
	nop
	set	0x38, %i6
	ldsh	[%l7 + %i6],	%g7
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x18,	%o6
	stw	%g1,	[%l7 + 0x50]
	swap	[%l7 + 0x68],	%i5
	movrgz	%g3,	0x24B,	%l4
	set	0x50, %g4
	stxa	%l6,	[%l7 + %g4] 0xe3
	membar	#Sync
	sub	%i4,	0x03F7,	%l0
	flush	%l7 + 0x7C
	ldsh	[%l7 + 0x70],	%g2
	ldub	[%l7 + 0x60],	%o2
	ldstub	[%l7 + 0x21],	%o7
	stb	%o5,	[%l7 + 0x20]
	ldsh	[%l7 + 0x5A],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	mulx	%i2,	0x0824,	%l5
	te	%icc,	0x0
	sth	%g6,	[%l7 + 0x18]
	prefetch	[%l7 + 0x48],	 0x2
	bleu	loop_106
	stb	%l1,	[%l7 + 0x5E]
	prefetch	[%l7 + 0x64],	 0x1
	lduh	[%l7 + 0x48],	%i7
loop_106:
	lduw	[%l7 + 0x40],	%i0
	rdhpr	%hsys_tick_cmpr,	%g5
	stw	%i1,	[%l7 + 0x30]
	std	%i6,	[%l7 + 0x68]
	ldsw	[%l7 + 0x68],	%l3
	movne	%xcc,	%i3,	%l2
	fmovsa	%icc,	%f4,	%f7
	stx	%g4,	[%l7 + 0x70]
	edge16	%o1,	%g7,	%o3
	movleu	%xcc,	%o6,	%i5
	ldd	[%l7 + 0x08],	%g0
	sth	%l4,	[%l7 + 0x26]
	rd	%fprs,	%l6
	sth	%g3,	[%l7 + 0x32]
	std	%l0,	[%l7 + 0x68]
	ld	[%l7 + 0x20],	%f22
	addcc	%i4,	0x0836,	%g2
	ldsw	[%l7 + 0x40],	%o2
	wrpr	%o7,	0x0683,	%pil
	lduh	[%l7 + 0x18],	%o4
	swap	[%l7 + 0x20],	%o0
	prefetch	[%l7 + 0x40],	 0x1
	ldd	[%l7 + 0x50],	%o4
	std	%i2,	[%l7 + 0x08]
	lduh	[%l7 + 0x42],	%g6
	prefetch	[%l7 + 0x44],	 0x0
	ldd	[%l7 + 0x58],	%l4
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%l0
	nop
	set	0x2E, %i4
	sth	%i0,	[%l7 + %i4]
	popc	%g5,	%i1
	udivx	%i6,	0x1527,	%i7
	swap	[%l7 + 0x50],	%l3
	stw	%l2,	[%l7 + 0x10]
	fbule,a	%fcc0,	loop_107
	stw	%i3,	[%l7 + 0x2C]
	ld	[%l7 + 0x44],	%f30
	ldsh	[%l7 + 0x3E],	%o1
loop_107:
	ld	[%l7 + 0x34],	%f6
	ld	[%l7 + 0x40],	%f29
	stb	%g7,	[%l7 + 0x2B]
	ldd	[%l7 + 0x38],	%o2
	swap	[%l7 + 0x08],	%g4
	ldd	[%l7 + 0x18],	%o6
	std	%g0,	[%l7 + 0x20]
	ldub	[%l7 + 0x23],	%i5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%l6
	flush	%l7 + 0x44
	ld	[%l7 + 0x60],	%f12
	stbar
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%g3
	stw	%l4,	[%l7 + 0x6C]
	nop
	set	0x44, %g3
	stw	%i4,	[%l7 + %g3]
	prefetch	[%l7 + 0x64],	 0x1
	sth	%g2,	[%l7 + 0x7C]
	stx	%l0,	[%l7 + 0x20]
	and	%o7,	0x1C80,	%o2
	prefetch	[%l7 + 0x2C],	 0x2
	ldsw	[%l7 + 0x4C],	%o0
	movle	%xcc,	%o4,	%o5
	ldd	[%l7 + 0x78],	%g6
	ldub	[%l7 + 0x44],	%i2
	edge32l	%l5,	%l1,	%i0
	ldstub	[%l7 + 0x52],	%g5
	swap	[%l7 + 0x7C],	%i6
	ldd	[%l7 + 0x28],	%f28
	edge32l	%i7,	%l3,	%l2
	ldsw	[%l7 + 0x3C],	%i1
	prefetch	[%l7 + 0x40],	 0x1
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%i3
	sth	%g7,	[%l7 + 0x1A]
	lduh	[%l7 + 0x54],	%o3
	nop
	set	0x5E, %i3
	ldsh	[%l7 + %i3],	%g4
	nop
	set	0x25, %g1
	ldstub	[%l7 + %g1],	%o6
	stb	%g1,	[%l7 + 0x19]
	and	%o1,	0x18D8,	%i5
	ldd	[%l7 + 0x58],	%i6
	ldsb	[%l7 + 0x75],	%l4
	std	%f8,	[%l7 + 0x08]
	sth	%g3,	[%l7 + 0x54]
	fmovsl	%icc,	%f31,	%f21
	nop
	set	0x62, %g5
	stb	%g2,	[%l7 + %g5]
	nop
	set	0x78, %i2
	stx	%l0,	[%l7 + %i2]
	ldx	[%l7 + 0x20],	%i4
	swap	[%l7 + 0x54],	%o2
	stbar
	stb	%o7,	[%l7 + 0x35]
	swap	[%l7 + 0x0C],	%o0
	stx	%o5,	[%l7 + 0x78]
	stw	%o4,	[%l7 + 0x14]
	ldx	[%l7 + 0x60],	%i2
	ldsh	[%l7 + 0x6E],	%l5
	sth	%l1,	[%l7 + 0x48]
	lduw	[%l7 + 0x38],	%i0
	nop
	set	0x20, %o4
	sth	%g6,	[%l7 + %o4]
	stw	%g5,	[%l7 + 0x14]
	ldsw	[%l7 + 0x70],	%i7
	ldsw	[%l7 + 0x68],	%i6
	taddcctv	%l3,	0x0FDA,	%l2
	lduh	[%l7 + 0x78],	%i1
	ldsb	[%l7 + 0x37],	%i3
	ldd	[%l7 + 0x38],	%g6
	ldsh	[%l7 + 0x6E],	%g4
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x04,	%o3
	ldub	[%l7 + 0x47],	%g1
	prefetch	[%l7 + 0x70],	 0x3
	nop
	set	0x15, %o3
	ldstub	[%l7 + %o3],	%o1
	ldsw	[%l7 + 0x08],	%i5
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x80,	%o6
	stbar
	xnor	%l6,	%l4,	%g2
	ld	[%l7 + 0x68],	%f4
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x89,	%l0
	fmovsleu	%xcc,	%f24,	%f25
	flush	%l7 + 0x24
	std	%f2,	[%l7 + 0x30]
	stb	%g3,	[%l7 + 0x0F]
	std	%f30,	[%l7 + 0x30]
	ld	[%l7 + 0x1C],	%f0
	stw	%i4,	[%l7 + 0x24]
	ldsw	[%l7 + 0x2C],	%o2
	ldx	[%l7 + 0x50],	%o0
	std	%f14,	[%l7 + 0x28]
	prefetch	[%l7 + 0x30],	 0x3
	alignaddrl	%o7,	%o5,	%o4
	tsubcc	%l5,	%i2,	%l1
	stbar
	ldub	[%l7 + 0x55],	%g6
	ldsw	[%l7 + 0x70],	%g5
	st	%f16,	[%l7 + 0x28]
	sth	%i7,	[%l7 + 0x0A]
	flush	%l7 + 0x60
	std	%f10,	[%l7 + 0x58]
	lduh	[%l7 + 0x54],	%i0
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%i6
	set	0x30, %l3
	stxa	%l2,	[%l7 + %l3] 0x1d
	lduh	[%l7 + 0x52],	%i1
	prefetch	[%l7 + 0x74],	 0x2
	fand	%f8,	%f22,	%f4
	std	%l2,	[%l7 + 0x18]
	ldx	[%l7 + 0x70],	%g7
	ldd	[%l7 + 0x70],	%g4
	fpsub16	%f0,	%f2,	%f4
	ldsb	[%l7 + 0x1E],	%i3
	std	%o2,	[%l7 + 0x10]
	swap	[%l7 + 0x50],	%o1
	ldsw	[%l7 + 0x28],	%g1
	ld	[%l7 + 0x78],	%f27
	mova	%icc,	%i5,	%o6
	prefetch	[%l7 + 0x40],	 0x0
	nop
	set	0x48, %i7
	stx	%l6,	[%l7 + %i7]
	movle	%xcc,	%l4,	%g2
	ldstub	[%l7 + 0x48],	%g3
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%i4
	popc	0x1BAE,	%l0
	flush	%l7 + 0x3C
	stb	%o0,	[%l7 + 0x71]
	stw	%o7,	[%l7 + 0x68]
	stw	%o5,	[%l7 + 0x1C]
	ldx	[%l7 + 0x18],	%o2
	std	%o4,	[%l7 + 0x38]
	lduh	[%l7 + 0x38],	%l5
	stw	%l1,	[%l7 + 0x34]
	ldstub	[%l7 + 0x18],	%i2
	ldd	[%l7 + 0x40],	%f28
	std	%f20,	[%l7 + 0x70]
	membar	0x40
	prefetch	[%l7 + 0x58],	 0x3
	stb	%g6,	[%l7 + 0x39]
	movrgez	%i7,	0x329,	%i0
	stw	%g5,	[%l7 + 0x78]
	srax	%l2,	0x1C,	%i6
	rdpr	%pil,	%i1
	stbar
	ldstub	[%l7 + 0x28],	%g7
	stbar
	sdivcc	%l3,	0x0BCE,	%i3
	ldub	[%l7 + 0x33],	%o3
	lduw	[%l7 + 0x60],	%o1
	nop
	set	0x10, %l1
	sth	%g1,	[%l7 + %l1]
	nop
	set	0x50, %i0
	ldstub	[%l7 + %i0],	%g4
	ldsw	[%l7 + 0x24],	%i5
	alignaddrl	%l6,	%l4,	%o6
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%g2
	swap	[%l7 + 0x20],	%g2
	nop
	set	0x50, %g2
	stx	%l0,	[%l7 + %g2]
	ldsh	[%l7 + 0x68],	%o0
	subccc	%i4,	%o5,	%o2
	ldsh	[%l7 + 0x16],	%o4
	wr	%g0,	0x88,	%asi
	stxa	%o7,	[%l7 + 0x50] %asi
	ldx	[%l7 + 0x40],	%l5
	std	%l0,	[%l7 + 0x20]
	prefetch	[%l7 + 0x34],	 0x1
	std	%f26,	[%l7 + 0x48]
	stbar
	stw	%g6,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x14],	%i7
	ldx	[%l7 + 0x60],	%i0
	std	%f2,	[%l7 + 0x58]
	sth	%i2,	[%l7 + 0x5A]
	std	%f22,	[%l7 + 0x48]
	fmovdvc	%xcc,	%f10,	%f26
	std	%l2,	[%l7 + 0x60]
	ld	[%l7 + 0x68],	%f15
	nop
	set	0x74, %g7
	ldsw	[%l7 + %g7],	%g5
	xorcc	%i6,	%g7,	%l3
	stx	%i3,	[%l7 + 0x58]
	swap	[%l7 + 0x24],	%o3
	stbar
	faligndata	%f14,	%f12,	%f18
	stx	%o1,	[%l7 + 0x58]
	sth	%g1,	[%l7 + 0x2C]
	tgu	%xcc,	0x1
	fmul8x16au	%f26,	%f3,	%f6
	wrpr	%g4,	0x04FF,	%cwp
	ldsb	[%l7 + 0x69],	%i5
	lduw	[%l7 + 0x5C],	%l6
	lduh	[%l7 + 0x66],	%i1
	ldsb	[%l7 + 0x32],	%o6
	std	%l4,	[%l7 + 0x10]
	movrgez	%g3,	0x2E6,	%l0
	nop
	set	0x5E, %o2
	sth	%g2,	[%l7 + %o2]
	st	%f0,	[%l7 + 0x3C]
	lduw	[%l7 + 0x34],	%i4
	std	%o4,	[%l7 + 0x10]
	stbar
	edge32	%o2,	%o0,	%o7
	sth	%o4,	[%l7 + 0x2E]
	ldx	[%l7 + 0x48],	%l1
	ldub	[%l7 + 0x23],	%l5
	stx	%i7,	[%l7 + 0x10]
	ldd	[%l7 + 0x70],	%f24
	stx	%i0,	[%l7 + 0x40]
	st	%f23,	[%l7 + 0x50]
	ldsh	[%l7 + 0x68],	%i2
	nop
	set	0x48, %l4
	std	%l2,	[%l7 + %l4]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA4C, 	%sys_tick_cmpr
	std	%f26,	[%l7 + 0x78]
	nop
	set	0x1E, %i5
	ldub	[%l7 + %i5],	%g6
	std	%f8,	[%l7 + 0x28]
	lduh	[%l7 + 0x3E],	%g7
	rdhpr	%hsys_tick_cmpr,	%i6
	std	%f22,	[%l7 + 0x78]
	stw	%i3,	[%l7 + 0x58]
	lduw	[%l7 + 0x78],	%l3
	ldstub	[%l7 + 0x67],	%o1
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %i6
	stxa	%g1,	[%g0 + %i6] 0x5f
	sth	%g4,	[%l7 + 0x3E]
	st	%f6,	[%l7 + 0x64]
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%i4
	sth	%l6,	[%l7 + 0x1E]
	ldsb	[%l7 + 0x4D],	%o3
	ldd	[%l7 + 0x60],	%f22
	stb	%o6,	[%l7 + 0x09]
	swap	[%l7 + 0x58],	%i1
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%g3
	andcc	%l4,	%l0,	%g2
	set	0x58, %l0
	stxa	%o5,	[%l7 + %l0] 0x22
	membar	#Sync
	stb	%i4,	[%l7 + 0x79]
	rd	%tick_cmpr,	%o2
	ldstub	[%l7 + 0x72],	%o0
	ldub	[%l7 + 0x68],	%o4
	ldx	[%l7 + 0x08],	%l1
	ldstub	[%l7 + 0x38],	%o7
	ldx	[%l7 + 0x50],	%l5
	st	%f9,	[%l7 + 0x48]
	ldd	[%l7 + 0x38],	%f4
	nop
	set	0x18, %i4
	lduh	[%l7 + %i4],	%i0
	wr	%i7,	%i2,	%clear_softint
	ldx	[%l7 + 0x48],	%l2
	fbne,a	%fcc1,	loop_108
	swap	[%l7 + 0x74],	%g5
	ldsb	[%l7 + 0x69],	%g6
	sth	%i6,	[%l7 + 0x58]
loop_108:
	rdpr	%tba,	%g7
	swap	[%l7 + 0x30],	%l3
	edge8l	%i3,	%o1,	%g1
	ldd	[%l7 + 0x30],	%g4
	ldd	[%l7 + 0x78],	%i4
	stbar
	prefetch	[%l7 + 0x2C],	 0x3
	ldstub	[%l7 + 0x55],	%o3
	st	%f18,	[%l7 + 0x60]
	flush	%l7 + 0x28
	flush	%l7 + 0x60
	brnz,a	%o6,	loop_109
	alignaddr	%l6,	%i1,	%l4
	ldx	[%l7 + 0x58],	%l0
	ld	[%l7 + 0x5C],	%f8
loop_109:
	ldub	[%l7 + 0x60],	%g3
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%g2
	ld	[%l7 + 0x50],	%f3
	stbar
	ldsh	[%l7 + 0x08],	%o5
	ldd	[%l7 + 0x50],	%f4
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i4
	ldsh	[%l7 + 0x3A],	%o0
	ldd	[%l7 + 0x38],	%o4
	ldub	[%l7 + 0x32],	%o2
	std	%f16,	[%l7 + 0x58]
	ldub	[%l7 + 0x63],	%l1
	ldsh	[%l7 + 0x10],	%o7
	andncc	%l5,	%i7,	%i2
	std	%l2,	[%l7 + 0x68]
	nop
	set	0x10, %l5
	stw	%g5,	[%l7 + %l5]
	stb	%i0,	[%l7 + 0x7C]
	stbar
	srl	%g6,	0x1D,	%g7
	flush	%l7 + 0x74
	ldsb	[%l7 + 0x38],	%i6
	sth	%l3,	[%l7 + 0x52]
	sub	%o1,	%g1,	%i3
	nop
	set	0x2A, %g3
	lduh	[%l7 + %g3],	%g4
	stx	%o3,	[%l7 + 0x58]
	movne	%icc,	%i5,	%o6
	movvc	%icc,	%i1,	%l6
	stw	%l4,	[%l7 + 0x28]
	lduw	[%l7 + 0x60],	%g3
	ldub	[%l7 + 0x15],	%g2
	lduh	[%l7 + 0x38],	%l0
	std	%o4,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %i3
	ldxa	[%g0 + %i3] 0x20,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE23, 	%hsys_tick_cmpr
	ldstub	[%l7 + 0x3D],	%o2
	mulx	%l1,	0x1F5F,	%o7
	std	%f24,	[%l7 + 0x50]
	stbar
	movcc	%xcc,	%i7,	%i2
	st	%f7,	[%l7 + 0x1C]
	nop
	set	0x3C, %o7
	stw	%l5,	[%l7 + %o7]
	srax	%l2,	0x05,	%g5
	sth	%g6,	[%l7 + 0x4A]
	ld	[%l7 + 0x30],	%f19
	andcc	%g7,	0x1AF3,	%i0
	ldub	[%l7 + 0x49],	%i6
	ldsw	[%l7 + 0x20],	%l3
	lduw	[%l7 + 0x0C],	%g1
	nop
	set	0x70, %g5
	stx	%i3,	[%l7 + %g5]
	swap	[%l7 + 0x4C],	%o1
	rdpr	%cleanwin,	%g4
	nop
	set	0x5C, %i2
	ldsw	[%l7 + %i2],	%i5
	sth	%o6,	[%l7 + 0x2E]
	swap	[%l7 + 0x40],	%i1
	sth	%o3,	[%l7 + 0x66]
	set	0x20, %g1
	stxa	%l6,	[%l7 + %g1] 0x88
	movrlz	%l4,	0x286,	%g3
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x81,	%l0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
	stb	%g2,	[%l7 + 0x6A]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x38] %asi
	ldsh	[%l7 + 0x66],	%o4
	swap	[%l7 + 0x14],	%o2
	stw	%l1,	[%l7 + 0x34]
	ldsh	[%l7 + 0x4E],	%i4
	ld	[%l7 + 0x0C],	%f13
	tsubcctv	%i7,	%o7,	%i2
	swap	[%l7 + 0x68],	%l2
	ldub	[%l7 + 0x0F],	%l5
	nop
	set	0x60, %o3
	std	%f30,	[%l7 + %o3]
	ldub	[%l7 + 0x34],	%g6
	ldd	[%l7 + 0x50],	%g6
	tpos	%icc,	0x3
	stw	%g5,	[%l7 + 0x7C]
	set	0x10, %o4
	stxa	%i6,	[%l7 + %o4] 0x2b
	membar	#Sync
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	wr	%g0,	0x57,	%asi
	stxa	%i0,	[%g0 + 0x0] %asi
	ld	[%l7 + 0x30],	%f19
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x220
	set	0x220, %o0
	ldxa	[%g0 + %o0] 0x52,	%g1
	sth	%i3,	[%l7 + 0x08]
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f4
	ldub	[%l7 + 0x16],	%o1
	prefetch	[%l7 + 0x74],	 0x2
	swap	[%l7 + 0x3C],	%g4
	ldd	[%l7 + 0x48],	%f10
	ldub	[%l7 + 0x6B],	%i5
	fmovdleu	%icc,	%f6,	%f15
	prefetch	[%l7 + 0x2C],	 0x2
	swap	[%l7 + 0x08],	%l3
	tne	%icc,	0x0
	ldx	[%l7 + 0x30],	%i1
	prefetch	[%l7 + 0x20],	 0x1
	stbar
	fors	%f6,	%f8,	%f3
	orncc	%o3,	%o6,	%l4
	ldd	[%l7 + 0x68],	%i6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g3
	st	%f10,	[%l7 + 0x60]
	ldstub	[%l7 + 0x46],	%l0
	fmovs	%f16,	%f7
	prefetch	[%l7 + 0x0C],	 0x1
	st	%f9,	[%l7 + 0x50]
	flush	%l7 + 0x58
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%o5
	tpos	%xcc,	0x0
	addc	%o0,	%o4,	%g2
	stx	%o2,	[%l7 + 0x50]
	tvs	%xcc,	0x1
	std	%i4,	[%l7 + 0x08]
	st	%f23,	[%l7 + 0x60]
	stx	%i7,	[%l7 + 0x48]
	st	%f11,	[%l7 + 0x0C]
	xorcc	%l1,	0x16FD,	%o7
	ldx	[%l7 + 0x48],	%l2
	ldsh	[%l7 + 0x6A],	%i2
	edge32	%l5,	%g6,	%g5
	ld	[%l7 + 0x14],	%f17

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9EA, 	%hsys_tick_cmpr
	std	%i0,	[%l7 + 0x60]
	prefetch	[%l7 + 0x30],	 0x1
	movvc	%icc,	%g1,	%i3
	nop
	set	0x20, %i7
	lduw	[%l7 + %i7],	%o1
	fmovscs	%xcc,	%f3,	%f13
	swap	[%l7 + 0x10],	%g4
	ldd	[%l7 + 0x28],	%f14
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x14,	%i5
	prefetch	[%l7 + 0x34],	 0x3
	ldsb	[%l7 + 0x34],	%l3
	ld	[%l7 + 0x54],	%f30
	st	%f23,	[%l7 + 0x78]
	fmovsvc	%xcc,	%f0,	%f24
	srlx	%i1,	0x17,	%o3
	nop
	set	0x12, %l2
	ldsb	[%l7 + %l2],	%o6
	lduw	[%l7 + 0x44],	%l4
	ldx	[%l7 + 0x48],	%l6
	ldub	[%l7 + 0x3E],	%i6
	st	%f14,	[%l7 + 0x48]
	ldsw	[%l7 + 0x64],	%l0
	std	%f12,	[%l7 + 0x28]
	fcmple16	%f4,	%f14,	%o5
	lduw	[%l7 + 0x28],	%g3
	sdivx	%o0,	0x0F6B,	%g2
	stw	%o4,	[%l7 + 0x34]
	ldd	[%l7 + 0x28],	%f16
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%o2
	ldd	[%l7 + 0x60],	%f16
	stw	%i4,	[%l7 + 0x54]
	edge16ln	%l1,	%o7,	%i7
	stw	%l2,	[%l7 + 0x1C]
	stbar
	stw	%l5,	[%l7 + 0x5C]
	stb	%i2,	[%l7 + 0x12]
	stw	%g6,	[%l7 + 0x48]
	nop
	set	0x10, %o1
	stx	%g5,	[%l7 + %o1]
	ldx	[%l7 + 0x68],	%g7
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%g1
	stbar
	nop
	set	0x60, %g2
	std	%i0,	[%l7 + %g2]
	std	%i2,	[%l7 + 0x18]
	fmul8x16al	%f4,	%f1,	%f28
	flush	%l7 + 0x38
	lduw	[%l7 + 0x38],	%g4
	st	%f21,	[%l7 + 0x60]
	sth	%i5,	[%l7 + 0x38]
	ldub	[%l7 + 0x66],	%l3
	ldd	[%l7 + 0x78],	%f26
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i1
	nop
	set	0x24, %l1
	stw	%o3,	[%l7 + %l1]
	ldd	[%l7 + 0x28],	%o6
	stw	%l4,	[%l7 + 0x50]
	mulscc	%l6,	0x1905,	%o1
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x14,	%i6
        wr    %g0,    0xe,    %pcr    ! changed.
	ldub	[%l7 + 0x4B],	%o0
	stw	%g3,	[%l7 + 0x18]
	fbue	%fcc0,	loop_110
	swap	[%l7 + 0x44],	%o4
	lduw	[%l7 + 0x3C],	%o2
	ld	[%l7 + 0x44],	%f29
loop_110:
	ldd	[%l7 + 0x70],	%i4
	stx	%l1,	[%l7 + 0x50]
	ldx	[%l7 + 0x20],	%o7
	wrpr	%i7,	0x08C6,	%tick
	flush	%l7 + 0x34
	swap	[%l7 + 0x10],	%g2
	ldd	[%l7 + 0x40],	%l2
	stw	%i2,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %l4
	ldxa	[%g0 + %l4] 0x21,	%g6
	stw	%g5,	[%l7 + 0x14]
	wr	%g0,	0xea,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
	membar	#Sync
	fmovdle	%xcc,	%f30,	%f21
	swap	[%l7 + 0x1C],	%l5
	stw	%i0,	[%l7 + 0x44]
	ldsw	[%l7 + 0x5C],	%g1
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i3
	stw	%g4,	[%l7 + 0x34]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x3e8
	set	0x3e8, %i5
	nop 	! 	nop 	! 	ldxa	[%g0 + %i5] 0x40,	%l3 ripped by fixASI40.pl ripped by fixASI40.pl
	ldd	[%l7 + 0x48],	%i0
	ldub	[%l7 + 0x69],	%i5
	ldstub	[%l7 + 0x42],	%o6
	prefetch	[%l7 + 0x38],	 0x2
	ldsw	[%l7 + 0x08],	%o3
	movvs	%icc,	%l6,	%l4
	ldd	[%l7 + 0x08],	%o0
	ldstub	[%l7 + 0x40],	%l0
	ldsh	[%l7 + 0x32],	%o5
	prefetch	[%l7 + 0x58],	 0x0
	ldsb	[%l7 + 0x2B],	%o0
	stbar
	bg,a,pt	%xcc,	loop_111
	ld	[%l7 + 0x34],	%f0
	ldsh	[%l7 + 0x56],	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_111:
	ldx	[%l7 + 0x30],	%i6
	rd	%asi,	%o2
	rdpr	%tba,	%i4
	ldsw	[%l7 + 0x4C],	%o4
	swap	[%l7 + 0x44],	%l1
	lduw	[%l7 + 0x2C],	%i7
	stw	%o7,	[%l7 + 0x70]
	stb	%g2,	[%l7 + 0x5E]
	fnors	%f27,	%f2,	%f28
	flush	%l7 + 0x14
	fcmps	%fcc2,	%f27,	%f8
	nop
	set	0x1F, %i6
	stb	%i2,	[%l7 + %i6]
	lduh	[%l7 + 0x78],	%l2
	st	%f1,	[%l7 + 0x18]
	ldsw	[%l7 + 0x6C],	%g6
	stw	%g5,	[%l7 + 0x10]
	stbar
	swap	[%l7 + 0x7C],	%l5
	ldsh	[%l7 + 0x10],	%i0
	swap	[%l7 + 0x54],	%g1
	nop
	set	0x7B, %g6
	ldsb	[%l7 + %g6],	%g7
	array16	%i3,	%l3,	%g4
	std	%i0,	[%l7 + 0x10]
	udivx	%o6,	0x02DF,	%o3
	prefetch	[%l7 + 0x34],	 0x2
	stw	%l6,	[%l7 + 0x4C]
	lduh	[%l7 + 0x56],	%i5
	movrgz	%o1,	%l4,	%l0
	swap	[%l7 + 0x64],	%o0
	tcc	%icc,	0x5
	nop
	set	0x14, %g4
	stw	%g3,	[%l7 + %g4]
	ldd	[%l7 + 0x78],	%o4
	tg	%icc,	0x4
	ldstub	[%l7 + 0x5A],	%i6
	rdhpr	%hsys_tick_cmpr,	%o2
	ldsb	[%l7 + 0x33],	%o4
	prefetch	[%l7 + 0x10],	 0x1
	movre	%l1,	0x222,	%i4
	swap	[%l7 + 0x5C],	%i7
	sth	%g2,	[%l7 + 0x70]
	fmovsvs	%xcc,	%f10,	%f13
	lduh	[%l7 + 0x62],	%i2
	lduw	[%l7 + 0x0C],	%l2
	prefetch	[%l7 + 0x6C],	 0x2
	ld	[%l7 + 0x18],	%f14
	lduw	[%l7 + 0x40],	%o7
	lduw	[%l7 + 0x18],	%g5
	ldstub	[%l7 + 0x42],	%l5
	tl	%icc,	0x4
	ldsb	[%l7 + 0x71],	%g6
	ldx	[%l7 + 0x20],	%g1
	stx	%i0,	[%l7 + 0x48]
	ldstub	[%l7 + 0x1A],	%i3
	lduw	[%l7 + 0x7C],	%g7
	lduw	[%l7 + 0x6C],	%l3
	umul	%g4,	0x0420,	%i1
	fmovdneg	%xcc,	%f15,	%f27
	lduh	[%l7 + 0x44],	%o3
	fors	%f31,	%f26,	%f7
	st	%f18,	[%l7 + 0x10]
	ldx	[%l7 + 0x78],	%o6
	prefetch	[%l7 + 0x58],	 0x3
	ldd	[%l7 + 0x28],	%f16
	ldx	[%l7 + 0x70],	%i5
	nop
	set	0x20, %g7
	lduh	[%l7 + %g7],	%o1
	ldd	[%l7 + 0x40],	%l4
	wr	%g0,	0x2f,	%asi
	stxa	%l6,	[%l7 + 0x50] %asi
	membar	#Sync
	lduw	[%l7 + 0x7C],	%o0
	ldsb	[%l7 + 0x3B],	%g3
	prefetch	[%l7 + 0x30],	 0x2
	std	%o4,	[%l7 + 0x10]
	fmovdneg	%xcc,	%f16,	%f1
	ldsh	[%l7 + 0x46],	%i6
	ldd	[%l7 + 0x20],	%o2
	flush	%l7 + 0x40
	stx	%l0,	[%l7 + 0x68]
	wr	%o4,	0x071D,	%softint
	lduh	[%l7 + 0x28],	%l1
	swap	[%l7 + 0x70],	%i4
	nop
	set	0x08, %i4
	std	%f2,	[%l7 + %i4]
	bn,a,pn	%xcc,	loop_112
	stbar
	ld	[%l7 + 0x1C],	%f18
	sth	%i7,	[%l7 + 0x68]
loop_112:
	ldd	[%l7 + 0x68],	%i2
	ldsh	[%l7 + 0x4E],	%l2
	andn	%o7,	0x1640,	%g5
	ldsw	[%l7 + 0x68],	%l5
	movvs	%xcc,	%g2,	%g6
	ldd	[%l7 + 0x10],	%g0
	std	%i0,	[%l7 + 0x28]
	ldub	[%l7 + 0x55],	%i3
	lduh	[%l7 + 0x2C],	%l3
	udivx	%g4,	0x09EB,	%g7
	tleu	%xcc,	0x6
	stx	%o3,	[%l7 + 0x50]
	ldd	[%l7 + 0x58],	%f4
	bcc	loop_113
	stx	%i1,	[%l7 + 0x40]
	ldub	[%l7 + 0x41],	%i5
	ldub	[%l7 + 0x50],	%o1
loop_113:
	edge16	%o6,	%l4,	%l6
	lduh	[%l7 + 0x38],	%o0
	ldsb	[%l7 + 0x63],	%g3
	prefetch	[%l7 + 0x70],	 0x2
	swap	[%l7 + 0x40],	%i6
	std	%f8,	[%l7 + 0x48]
	flush	%l7 + 0x78
	st	%f16,	[%l7 + 0x10]
	stb	%o2,	[%l7 + 0x39]
	wr	%g0,	0x1c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l0
	stx	%o4,	[%l7 + 0x20]
	ldd	[%l7 + 0x48],	%o4
	ldstub	[%l7 + 0x53],	%i4
	std	%l0,	[%l7 + 0x18]
	ld	[%l7 + 0x08],	%f21
	stx	%i2,	[%l7 + 0x50]
	stbar
	st	%f31,	[%l7 + 0x68]
	stb	%o7,	[%l7 + 0x70]
	bvs,a	loop_114
	stbar
	lduh	[%l7 + 0x62],	%g5
	srlx	%l5,	%i7,	%g2
loop_114:
	std	%f22,	[%l7 + 0x48]
	lduw	[%l7 + 0x4C],	%g6
	ldd	[%l7 + 0x58],	%f24
	std	%g0,	[%l7 + 0x08]
	lduw	[%l7 + 0x6C],	%i0
	nop
	set	0x34, %l0
	stw	%i3,	[%l7 + %l0]
	ldd	[%l7 + 0x38],	%f4
	fbul	%fcc0,	loop_115
	ld	[%l7 + 0x08],	%f6
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x30
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g4
loop_115:
	swap	[%l7 + 0x40],	%g7
	stx	%o3,	[%l7 + 0x58]
	ldsb	[%l7 + 0x1C],	%l3
	std	%f20,	[%l7 + 0x50]
	st	%f15,	[%l7 + 0x3C]
	stbar
	stx	%i1,	[%l7 + 0x70]
	ldsw	[%l7 + 0x38],	%i5
	stw	%o1,	[%l7 + 0x18]
	std	%o6,	[%l7 + 0x70]
	ldd	[%l7 + 0x78],	%f0
	std	%l4,	[%l7 + 0x20]
	stbar
	ldx	[%l7 + 0x20],	%l6
	std	%f30,	[%l7 + 0x48]
	st	%f25,	[%l7 + 0x24]
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f10
	fnor	%f20,	%f14,	%f6
	std	%g2,	[%l7 + 0x70]
	fba,a	%fcc3,	loop_116
	fbl	%fcc2,	loop_117
	edge32n	%i6,	%o2,	%l0
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f30
loop_116:
	udiv	%o4,	0x1386,	%o0
loop_117:
	tneg	%xcc,	0x0
	ld	[%l7 + 0x7C],	%f3
	ld	[%l7 + 0x68],	%f17
	stb	%i4,	[%l7 + 0x67]
	ldsh	[%l7 + 0x12],	%o5
	ldstub	[%l7 + 0x7C],	%i2
	stbar
	fba,a	%fcc3,	loop_118
	ld	[%l7 + 0x54],	%f6
	xnor	%l2,	%o7,	%l1
	stx	%g5,	[%l7 + 0x08]
loop_118:
	prefetch	[%l7 + 0x20],	 0x3
	std	%f14,	[%l7 + 0x58]
	set	0x18, %l5
	stxa	%l5,	[%l7 + %l5] 0x88
	stb	%i7,	[%l7 + 0x0B]
	std	%f24,	[%l7 + 0x20]
	flush	%l7 + 0x54
	swap	[%l7 + 0x5C],	%g6
	stx	%g2,	[%l7 + 0x38]
	stw	%g1,	[%l7 + 0x48]
	std	%f18,	[%l7 + 0x58]
	mulscc	%i0,	%i3,	%g7
	swap	[%l7 + 0x70],	%o3
	stw	%l3,	[%l7 + 0x3C]
	st	%f8,	[%l7 + 0x7C]
	ldstub	[%l7 + 0x12],	%i1
	ld	[%l7 + 0x70],	%f26
	ldd	[%l7 + 0x48],	%g4
	fmovse	%xcc,	%f26,	%f31
	ld	[%l7 + 0x68],	%f29
	be,pn	%xcc,	loop_119
	ldub	[%l7 + 0x61],	%o1
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f20
	tne	%icc,	0x2
loop_119:
	st	%f17,	[%l7 + 0x20]
	set	0x38, %i3
	stxa	%i5,	[%l7 + %i3] 0x81
	ldsw	[%l7 + 0x7C],	%l4
	stbar
	ldd	[%l7 + 0x08],	%i6
	prefetch	[%l7 + 0x18],	 0x3
	flush	%l7 + 0x38
	ldd	[%l7 + 0x58],	%g2
	flush	%l7 + 0x1C
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x318
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o6,	[%g0 + 0x318] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop
	set	0x70, %g5
	sth	%o2,	[%l7 + %g5]
	ldub	[%l7 + 0x35],	%i6
	udiv	%l0,	0x03DD,	%o4
	std	%f8,	[%l7 + 0x60]
	nop
	set	0x14, %i2
	sth	%i4,	[%l7 + %i2]
	wr	%g0,	0xeb,	%asi
	stxa	%o0,	[%l7 + 0x10] %asi
	membar	#Sync
	std	%f26,	[%l7 + 0x20]
	ld	[%l7 + 0x0C],	%f12
	set	0x48, %g1
	stxa	%i2,	[%l7 + %g1] 0x0c
	nop
	set	0x62, %o3
	lduh	[%l7 + %o3],	%o5
	ldub	[%l7 + 0x39],	%o7
	stw	%l1,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x108
	wr	%g0,	0x52,	%asi
	stxa	%g5,	[%g0 + 0x108] %asi
	srlx	%l2,	%i7,	%l5
	nop
	set	0x10, %o4
	ldub	[%l7 + %o4],	%g2
	bl,a	%icc,	loop_120
	prefetch	[%l7 + 0x38],	 0x3
	movcc	%xcc,	%g1,	%i0
	stb	%g6,	[%l7 + 0x35]
loop_120:
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	nop
	set	0x118, %o0
	ldxa	[%g0 + %o0] 0x52,	%g7
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i3
	stb	%l3,	[%l7 + 0x74]
	std	%f8,	[%l7 + 0x50]
	nop
	set	0x7C, %o5
	ldub	[%l7 + %o5],	%o3
	ldsb	[%l7 + 0x5C],	%g4
	ldsb	[%l7 + 0x14],	%i1
	nop
	set	0x70, %o6
	std	%o0,	[%l7 + %o6]
	std	%i4,	[%l7 + 0x78]
	std	%i6,	[%l7 + 0x70]
	tneg	%icc,	0x1
	ldd	[%l7 + 0x50],	%g2
	ldx	[%l7 + 0x78],	%l4
	st	%f31,	[%l7 + 0x3C]
	std	%o2,	[%l7 + 0x38]
	ldsw	[%l7 + 0x70],	%o6
	wrpr	%l0,	0x02EA,	%tick
	ld	[%l7 + 0x70],	%f16
	ldsw	[%l7 + 0x74],	%i6
	tneg	%xcc,	0x6
	nop
	set	0x70, %l3
	stb	%o4,	[%l7 + %l3]
	xor	%i4,	%i2,	%o5
	swap	[%l7 + 0x28],	%o7
	ld	[%l7 + 0x2C],	%f25
	fmovspos	%xcc,	%f13,	%f12
	stbar
	ldd	[%l7 + 0x18],	%l0
	ldsh	[%l7 + 0x2C],	%o0
	sir	0x0300
	lduw	[%l7 + 0x68],	%l2
	ldstub	[%l7 + 0x24],	%i7
	st	%f25,	[%l7 + 0x40]
	ldsb	[%l7 + 0x45],	%g5
	ld	[%l7 + 0x2C],	%f16
	bgu,a,pn	%icc,	loop_121
	nop
	set	0x10, %l6
	lduw	[%l7 + %l6],	%g2
	ldsh	[%l7 + 0x7A],	%g1
	fbue	%fcc1,	loop_122
loop_121:
	nop
	set	0x39, %i7
	ldstub	[%l7 + %i7],	%l5
	fcmped	%fcc0,	%f8,	%f22
	set	0x20, %l2
	stxa	%g6,	[%l7 + %l2] 0x27
	membar	#Sync
loop_122:
	brlz,a	%g7,	loop_123
	ldx	[%l7 + 0x50],	%i3
	nop
	set	0x4F, %o1
	ldub	[%l7 + %o1],	%i0
	brz,a	%o3,	loop_124
loop_123:
	edge32ln	%l3,	%g4,	%i1
	lduw	[%l7 + 0x50],	%o1
	sth	%i5,	[%l7 + 0x7C]
loop_124:
	ld	[%l7 + 0x44],	%f10
	movre	%g3,	%l6,	%o2
	fsrc1	%f0,	%f28
	wr	%g0,	0x04,	%asi
	stxa	%o6,	[%l7 + 0x30] %asi
	stb	%l4,	[%l7 + 0x5E]
	ldsh	[%l7 + 0x2C],	%i6
	nop
	set	0x72, %g2
	ldub	[%l7 + %g2],	%l0
	st	%f29,	[%l7 + 0x0C]
	lduw	[%l7 + 0x44],	%i4
	ldd	[%l7 + 0x28],	%i2
	ldd	[%l7 + 0x78],	%o4
	ldsb	[%l7 + 0x10],	%o5
	swap	[%l7 + 0x08],	%l1
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o0
	ldd	[%l7 + 0x78],	%f0
	ldx	[%l7 + 0x50],	%o7
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i7
	ldx	[%l7 + 0x10],	%l2
	set	0x28, %i0
	stxa	%g2,	[%l7 + %i0] 0x18
	sth	%g1,	[%l7 + 0x4A]
	ldsh	[%l7 + 0x46],	%l5
	sth	%g6,	[%l7 + 0x38]
	sdivcc	%g7,	0x0DDF,	%g5
	fmovrse	%i0,	%f5,	%f3
	stw	%i3,	[%l7 + 0x60]
	lduw	[%l7 + 0x0C],	%o3
	ldub	[%l7 + 0x0F],	%g4
	wrpr	%l3,	%i1,	%pil
	stb	%o1,	[%l7 + 0x69]
	fmovdleu	%icc,	%f26,	%f21
	stb	%g3,	[%l7 + 0x5F]
	ldsh	[%l7 + 0x6A],	%l6
	set	0x60, %l1
	ldxa	[%l7 + %l1] 0x1c,	%i5
	ld	[%l7 + 0x5C],	%f19
	wr	%g0,	0x19,	%asi
	stxa	%o6,	[%l7 + 0x38] %asi
	fornot1s	%f14,	%f6,	%f27
	movleu	%icc,	%o2,	%i6
	nop
	set	0x08, %o2
	lduw	[%l7 + %o2],	%l0
	addccc	%i4,	%i2,	%l4
	stx	%o4,	[%l7 + 0x30]
	ldsb	[%l7 + 0x4D],	%l1
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%o0
	lduh	[%l7 + 0x22],	%o5
	stx	%i7,	[%l7 + 0x28]
	ldsb	[%l7 + 0x1A],	%l2
	edge32l	%o7,	%g2,	%g1
	st	%f22,	[%l7 + 0x4C]
	udivcc	%l5,	0x166C,	%g6
	ldsw	[%l7 + 0x60],	%g5
	ldd	[%l7 + 0x60],	%i0
	sdiv	%i3,	0x0479,	%g7
	prefetch	[%l7 + 0x08],	 0x2
	std	%f30,	[%l7 + 0x58]
	nop
	set	0x3C, %i6
	lduh	[%l7 + %i6],	%o3
	set	0x18, %g6
	stxa	%l3,	[%l7 + %g6] 0x2a
	membar	#Sync
	set	0x40, %g4
	stxa	%i1,	[%l7 + %g4] 0x88
	fblg	%fcc3,	loop_125
	fbug	%fcc2,	loop_126
	flush	%l7 + 0x38
	prefetch	[%l7 + 0x4C],	 0x0
loop_125:
	st	%f17,	[%l7 + 0x6C]
loop_126:
	ldsb	[%l7 + 0x6B],	%g4
	std	%o0,	[%l7 + 0x70]
	ld	[%l7 + 0x60],	%f9
	ldd	[%l7 + 0x48],	%i6
	std	%g2,	[%l7 + 0x60]
	std	%i4,	[%l7 + 0x18]
	std	%f8,	[%l7 + 0x18]
	lduw	[%l7 + 0x48],	%o2
	stb	%i6,	[%l7 + 0x5D]
	ld	[%l7 + 0x44],	%f6
	flush	%l7 + 0x08
	flush	%l7 + 0x1C
	prefetch	[%l7 + 0x34],	 0x1
	stw	%o6,	[%l7 + 0x58]
	stx	%l0,	[%l7 + 0x40]
	ldstub	[%l7 + 0x53],	%i4
	ldsh	[%l7 + 0x1C],	%l4
	flush	%l7 + 0x28
	ldd	[%l7 + 0x38],	%o4
	lduh	[%l7 + 0x2A],	%i2
	stw	%o0,	[%l7 + 0x4C]
	ldstub	[%l7 + 0x68],	%o5
	ldd	[%l7 + 0x60],	%f22
	flush	%l7 + 0x38
	ldx	[%l7 + 0x40],	%i7
	st	%f21,	[%l7 + 0x78]
	xor	%l1,	%o7,	%g2
	edge32	%l2,	%l5,	%g6
	stx	%g5,	[%l7 + 0x58]
	ldub	[%l7 + 0x77],	%g1
	stw	%i3,	[%l7 + 0x10]
	ldsw	[%l7 + 0x28],	%g7
	wrpr	%o3,	%l3,	%cwp
	stbar
	wr	%g0,	0x22,	%asi
	stxa	%i1,	[%l7 + 0x58] %asi
	membar	#Sync
	fornot1s	%f2,	%f0,	%f8
	st	%f31,	[%l7 + 0x18]
	ldd	[%l7 + 0x10],	%f12
	fxnor	%f12,	%f8,	%f20
	ldsb	[%l7 + 0x5D],	%i0
	ldx	[%l7 + 0x08],	%g4
	sth	%l6,	[%l7 + 0x20]
	std	%f14,	[%l7 + 0x28]
	ldsw	[%l7 + 0x0C],	%g3
	std	%i4,	[%l7 + 0x28]
	fbg,a	%fcc1,	loop_127
	tvc	%xcc,	0x7
	fsrc1	%f10,	%f16
	fsrc1	%f10,	%f18
loop_127:
	nop
	set	0x78, %i5
	prefetch	[%l7 + %i5],	 0x0
	ldub	[%l7 + 0x66],	%o2
	nop
	set	0x68, %i4
	stw	%i6,	[%l7 + %i4]
	move	%icc,	%o6,	%o1
	nop
	set	0x78, %g7
	std	%i4,	[%l7 + %g7]
	stb	%l0,	[%l7 + 0x15]
	ldsb	[%l7 + 0x7D],	%o4
	sth	%l4,	[%l7 + 0x1E]
	ld	[%l7 + 0x2C],	%f20
	st	%f28,	[%l7 + 0x44]
	ldd	[%l7 + 0x38],	%i2
	rdpr	%pil,	%o0
	nop
	set	0x40, %l0
	sth	%o5,	[%l7 + %l0]
	stbar
	sth	%i7,	[%l7 + 0x12]
	lduh	[%l7 + 0x4A],	%l1
	ldub	[%l7 + 0x46],	%o7
	std	%f6,	[%l7 + 0x40]
	std	%f10,	[%l7 + 0x20]
	ld	[%l7 + 0x64],	%f13
	std	%g2,	[%l7 + 0x58]
	swap	[%l7 + 0x24],	%l2
	ldub	[%l7 + 0x40],	%l5
	tvc	%icc,	0x7
	movrlez	%g6,	0x219,	%g5
	std	%f14,	[%l7 + 0x10]
	prefetch	[%l7 + 0x5C],	 0x3
	lduh	[%l7 + 0x5E],	%i3
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g7
	sth	%g1,	[%l7 + 0x2A]
	stbar
	ld	[%l7 + 0x0C],	%f25
	ldd	[%l7 + 0x38],	%o2
	stx	%l3,	[%l7 + 0x28]
	stb	%i0,	[%l7 + 0x6A]
	ldd	[%l7 + 0x30],	%f6
	movrne	%i1,	0x0BD,	%l6
	ldsb	[%l7 + 0x21],	%g3
	sth	%i5,	[%l7 + 0x6E]
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x81,	%o2
	std	%f18,	[%l7 + 0x40]
	lduw	[%l7 + 0x2C],	%i6
	stx	%g4,	[%l7 + 0x20]
	ldstub	[%l7 + 0x1F],	%o1
	std	%f30,	[%l7 + 0x60]
	ldsh	[%l7 + 0x0A],	%o6
	std	%i4,	[%l7 + 0x60]
	ld	[%l7 + 0x14],	%f29
	ldd	[%l7 + 0x08],	%f18
	stbar
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o4
	nop
	set	0x54, %i1
	prefetch	[%l7 + %i1],	 0x3
	ldstub	[%l7 + 0x48],	%l0
	ldd	[%l7 + 0x18],	%f10
	stbar
	st	%f23,	[%l7 + 0x4C]
	stx	%i2,	[%l7 + 0x60]
	fmovrdgez	%o0,	%f12,	%f22
	set	0x28, %l5
	stxa	%o5,	[%l7 + %l5] 0x19
	ldd	[%l7 + 0x08],	%f16
	st	%f15,	[%l7 + 0x64]
	lduh	[%l7 + 0x7C],	%i7
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x19,	%l1
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x3d8
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3d8] %asi,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	ldsb	[%l7 + 0x3A],	%l4
	stb	%g2,	[%l7 + 0x7D]
	sth	%l5,	[%l7 + 0x12]
	stx	%g6,	[%l7 + 0x60]
	lduw	[%l7 + 0x4C],	%g5
	ldsb	[%l7 + 0x72],	%l2
	ldd	[%l7 + 0x20],	%f10
	nop
	set	0x34, %i3
	prefetch	[%l7 + %i3],	 0x3
	ldx	[%l7 + 0x40],	%g7
	ldub	[%l7 + 0x1C],	%g1
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%i2
	ldstub	[%l7 + 0x66],	%l3
	std	%f2,	[%l7 + 0x20]
	lduw	[%l7 + 0x64],	%o3
	umul	%i1,	%i0,	%g3
	stx	%i5,	[%l7 + 0x30]
	prefetch	[%l7 + 0x7C],	 0x2
	ldsb	[%l7 + 0x58],	%o2
	std	%f22,	[%l7 + 0x48]
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l6
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g4
	ld	[%l7 + 0x6C],	%f28
	swap	[%l7 + 0x14],	%o1
	swap	[%l7 + 0x60],	%o6
	swap	[%l7 + 0x40],	%i6
	ldx	[%l7 + 0x18],	%i4
	stbar
	set	0x68, %g5
	stxa	%l0,	[%l7 + %g5] 0x2b
	membar	#Sync
	lduh	[%l7 + 0x24],	%o4
	ldsb	[%l7 + 0x20],	%i2
	std	%f12,	[%l7 + 0x60]
	ldstub	[%l7 + 0x1D],	%o5
	prefetch	[%l7 + 0x2C],	 0x3
	stbar
	stbar
	swap	[%l7 + 0x58],	%i7
	ldd	[%l7 + 0x08],	%f2
	nop
	set	0x50, %o3
	ldx	[%l7 + %o3],	%o0
	nop
	set	0x58, %o4
	stx	%l1,	[%l7 + %o4]
	lduw	[%l7 + 0x60],	%o7
        wr    %g0,    0xe,    %pcr    ! changed.
	bl	%xcc,	loop_128
	wr	%l5,	0x17AF,	%softint
	nop
	set	0x78, %o0
	ldub	[%l7 + %o0],	%g2
	ldd	[%l7 + 0x58],	%g6
loop_128:
	ldstub	[%l7 + 0x2D],	%l2
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%g4
	ldub	[%l7 + 0x33],	%g7
	srl	%g1,	%l3,	%i3
	swap	[%l7 + 0x74],	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %o6
	ldxa	[%g0 + %o6] 0x20,	%i1
	nop
	set	0x70, %g1
	stx	%g3,	[%l7 + %g1]
	movvs	%icc,	%i0,	%i5
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%o2
	ldub	[%l7 + 0x45],	%l6
	sra	%o1,	0x0D,	%g4
	stbar
	ldx	[%l7 + 0x50],	%i6
	stbar
	ldd	[%l7 + 0x08],	%f0
	ldub	[%l7 + 0x42],	%i4
	stx	%o6,	[%l7 + 0x38]
	sth	%l0,	[%l7 + 0x38]
	ldx	[%l7 + 0x08],	%o4
	ldsw	[%l7 + 0x64],	%i2
	prefetch	[%l7 + 0x0C],	 0x1
	flush	%l7 + 0x1C
	wr 	%g0, 	0x5, 	%fprs
	sth	%o0,	[%l7 + 0x5A]
	ldsb	[%l7 + 0x7C],	%l1
	ldsw	[%l7 + 0x30],	%i7
	fands	%f20,	%f15,	%f18
	fmovrslz	%l4,	%f13,	%f7
	tg	%icc,	0x1
	ldstub	[%l7 + 0x59],	%o7
	rdhpr	%hintp,	%l5
	lduw	[%l7 + 0x38],	%g2
	flush	%l7 + 0x40
	swap	[%l7 + 0x48],	%l2
	ldub	[%l7 + 0x59],	%g5
	ldstub	[%l7 + 0x26],	%g6
	ldsb	[%l7 + 0x4A],	%g1
	stbar
	ld	[%l7 + 0x0C],	%f5
	ldub	[%l7 + 0x5C],	%l3
	fnand	%f28,	%f18,	%f22
	ldsh	[%l7 + 0x4E],	%i3
	stbar
	nop
	set	0x7C, %i7
	lduh	[%l7 + %i7],	%o3
	stbar
	lduh	[%l7 + 0x74],	%i1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x58] %asi,	%g3
	ldsh	[%l7 + 0x10],	%i0
	wr	%g0,	0x2b,	%asi
	stxa	%g7,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	set	0x78, %l2
	ldub	[%l7 + %l2],	%o2
	ld	[%l7 + 0x58],	%f14
	stw	%i5,	[%l7 + 0x40]
	ldx	[%l7 + 0x60],	%o1
	ldx	[%l7 + 0x78],	%l6
	edge16ln	%g4,	%i6,	%o6
	ldd	[%l7 + 0x50],	%i4
	ldsb	[%l7 + 0x2A],	%o4
	std	%i2,	[%l7 + 0x20]
	ldd	[%l7 + 0x30],	%f20
	stx	%o5,	[%l7 + 0x50]
	wrpr	%l0,	%o0,	%cwp
	sll	%l1,	0x14,	%l4
	rd	%asi,	%o7
	st	%f12,	[%l7 + 0x18]
	st	%f12,	[%l7 + 0x0C]
	taddcctv	%l5,	0x052F,	%g2
	std	%i6,	[%l7 + 0x48]
	set	0x18, %o1
	stxa	%l2,	[%l7 + %o1] 0x1d
	std	%g4,	[%l7 + 0x70]
	flush	%l7 + 0x40
	ldd	[%l7 + 0x20],	%f30
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	set	0x120, %g2
	ldxa	[%g0 + %g2] 0x52,	%g1
	stx	%g6,	[%l7 + 0x30]
	ldsw	[%l7 + 0x60],	%l3
	wr	%g0,	0x1c,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i3
	ld	[%l7 + 0x58],	%f11
	ldsh	[%l7 + 0x3C],	%o3
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x88,	%g3
	stx	%i0,	[%l7 + 0x30]
	flush	%l7 + 0x50
	ldsh	[%l7 + 0x64],	%i1
	sth	%g7,	[%l7 + 0x60]
	st	%f23,	[%l7 + 0x30]
	ldsh	[%l7 + 0x12],	%i5
	lduh	[%l7 + 0x38],	%o2
	stb	%l6,	[%l7 + 0x5B]
	ldub	[%l7 + 0x2A],	%o1
	std	%g4,	[%l7 + 0x18]
	smulcc	%i6,	%o6,	%o4
	flush	%l7 + 0x50
	movcc	%xcc,	%i4,	%o5
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x14,	%l0
	ldsh	[%l7 + 0x66],	%o0
	ldx	[%l7 + 0x58],	%l1
	ldstub	[%l7 + 0x55],	%i2
	ldsh	[%l7 + 0x30],	%o7
	lduw	[%l7 + 0x1C],	%l5
	lduw	[%l7 + 0x08],	%l4
	lduw	[%l7 + 0x44],	%g2
	fmovsgu	%icc,	%f8,	%f16
	ldsh	[%l7 + 0x70],	%i7
	ldsh	[%l7 + 0x10],	%l2
	ldsb	[%l7 + 0x6D],	%g1
	st	%f24,	[%l7 + 0x1C]
	ld	[%l7 + 0x0C],	%f19
	st	%f28,	[%l7 + 0x38]
	swap	[%l7 + 0x44],	%g6
	tvs	%icc,	0x1
	ldsw	[%l7 + 0x60],	%l3
	nop
	set	0x2E, %i0
	lduh	[%l7 + %i0],	%g5
	stw	%o3,	[%l7 + 0x54]
	ldstub	[%l7 + 0x20],	%i3
	ldub	[%l7 + 0x55],	%i0
	wr	%g0,	0x10,	%asi
	stxa	%i1,	[%l7 + 0x40] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	addccc	%o2,	%g7,	%o1
	sth	%g4,	[%l7 + 0x58]
	ldsb	[%l7 + 0x7A],	%i6
	set	0x68, %l4
	stxa	%l6,	[%l7 + %l4] 0x2a
	membar	#Sync
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f8
	ldsh	[%l7 + 0x6C],	%o4
	lduh	[%l7 + 0x50],	%i4
	fmul8x16au	%f17,	%f20,	%f30
	stb	%o5,	[%l7 + 0x0E]
	ldx	[%l7 + 0x18],	%o6
	rd	%asi,	%o0
	fmovsvc	%icc,	%f24,	%f18
	stw	%l1,	[%l7 + 0x70]
	ldsh	[%l7 + 0x56],	%l0
	sth	%i2,	[%l7 + 0x70]
	sth	%o7,	[%l7 + 0x08]
	stbar
	lduh	[%l7 + 0x7A],	%l4
	ld	[%l7 + 0x4C],	%f15
	ldd	[%l7 + 0x58],	%l4
	stx	%g2,	[%l7 + 0x38]
	ldub	[%l7 + 0x6F],	%i7
	ldsh	[%l7 + 0x56],	%g1
	st	%f0,	[%l7 + 0x54]
	std	%f26,	[%l7 + 0x38]
	sdivx	%l2,	0x0AC8,	%g6
	sth	%g5,	[%l7 + 0x52]
	stw	%l3,	[%l7 + 0x1C]
	tle	%icc,	0x4
	std	%f20,	[%l7 + 0x20]
	ldsb	[%l7 + 0x12],	%o3
	flush	%l7 + 0x34
	std	%f18,	[%l7 + 0x70]
	ldd	[%l7 + 0x48],	%f12
	wrpr	%i0,	0x12EF,	%tick
	alignaddr	%i1,	%i3,	%g3
	bvs,a,pn	%xcc,	loop_129
	fpack16	%f22,	%f1
	stb	%i5,	[%l7 + 0x3F]
	stb	%g7,	[%l7 + 0x77]
loop_129:
	movle	%xcc,	%o2,	%o1
	nop
	set	0x6C, %o2
	ldsb	[%l7 + %o2],	%g4
	set	0x50, %g6
	ldxa	[%l7 + %g6] 0x89,	%i6
	st	%f28,	[%l7 + 0x44]
	nop
	set	0x77, %i5
	stb	%o4,	[%l7 + %i5]
	ldub	[%l7 + 0x0D],	%i4
	nop
	set	0x0C, %g4
	ldub	[%l7 + %g4],	%o5
	ldd	[%l7 + 0x20],	%o6
	stb	%o0,	[%l7 + 0x55]
	ldsw	[%l7 + 0x40],	%l6
	fcmpes	%fcc0,	%f0,	%f13
	ldsh	[%l7 + 0x60],	%l1
	fmovrde	%i2,	%f26,	%f12
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l0
	ldx	[%l7 + 0x70],	%o7
	subcc	%l5,	%l4,	%g2
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%i7,	[%g0 + 0x0] %asi
	ldd	[%l7 + 0x78],	%l2
	wr	%g0,	0xeb,	%asi
	stxa	%g1,	[%l7 + 0x18] %asi
	membar	#Sync
	std	%g4,	[%l7 + 0x40]
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g6
	stb	%l3,	[%l7 + 0x60]
	std	%f30,	[%l7 + 0x68]
	set	0x78, %i4
	stxa	%i0,	[%l7 + %i4] 0x22
	membar	#Sync
	stx	%i1,	[%l7 + 0x40]
	stb	%i3,	[%l7 + 0x41]
	lduh	[%l7 + 0x20],	%g3
	ldstub	[%l7 + 0x78],	%i5
	stw	%o3,	[%l7 + 0x4C]
	std	%f30,	[%l7 + 0x38]
	nop
	set	0x08, %g7
	stx	%g7,	[%l7 + %g7]
	fmovscc	%icc,	%f7,	%f29
	prefetch	[%l7 + 0x5C],	 0x3
	st	%f16,	[%l7 + 0x08]
	ld	[%l7 + 0x0C],	%f17
	lduh	[%l7 + 0x7E],	%o2
	ldx	[%l7 + 0x48],	%g4
	ldsh	[%l7 + 0x22],	%o1
	ld	[%l7 + 0x48],	%f2
	ldstub	[%l7 + 0x6B],	%i6
	st	%f26,	[%l7 + 0x20]
	array16	%o4,	%o5,	%i4
	ldx	[%l7 + 0x70],	%o0
	flush	%l7 + 0x44
	std	%o6,	[%l7 + 0x78]
	ldub	[%l7 + 0x7A],	%l1
	stw	%i2,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x16],	%l0
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%o6
	std	%i6,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x158
	set	0x158, %l0
	nop 	! 	stxa	%l5,	[%g0 + %l0] 0x40 ripped by fixASI40.pl
	prefetch	[%l7 + 0x44],	 0x1
	ldstub	[%l7 + 0x2C],	%l4
	ldsh	[%l7 + 0x30],	%g2
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%l2
	ldub	[%l7 + 0x69],	%g1
	flush	%l7 + 0x30
	wr	%g0,	0xe2,	%asi
	stxa	%g5,	[%l7 + 0x18] %asi
	membar	#Sync
	ldub	[%l7 + 0x7A],	%i7
	ldub	[%l7 + 0x24],	%l3
	wr	%g0,	0xea,	%asi
	stxa	%i0,	[%l7 + 0x78] %asi
	membar	#Sync
	st	%f9,	[%l7 + 0x48]
	ldd	[%l7 + 0x60],	%f2
	add	%g6,	0x16A1,	%i3
	ld	[%l7 + 0x2C],	%f6
	lduw	[%l7 + 0x58],	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x776, 	%tick_cmpr
	rd	%pc,	%i1
	fmovsl	%icc,	%f23,	%f24
	lduh	[%l7 + 0x1C],	%o3
	ldstub	[%l7 + 0x47],	%o2
	ldd	[%l7 + 0x08],	%f10
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g7
	stb	%o1,	[%l7 + 0x23]
	ldsh	[%l7 + 0x70],	%g4
	nop
	set	0x24, %o7
	stw	%o4,	[%l7 + %o7]
	st	%f26,	[%l7 + 0x28]
	ldsw	[%l7 + 0x10],	%i6
	lduw	[%l7 + 0x20],	%o5
	stw	%o0,	[%l7 + 0x24]
	fpadd16s	%f12,	%f20,	%f30
	flushw
	flush	%l7 + 0x40
	sth	%i4,	[%l7 + 0x2A]
	sth	%l1,	[%l7 + 0x6A]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stbar
	wr	%g0,	0x0c,	%asi
	stxa	%o7,	[%l7 + 0x48] %asi
	wr	%g0,	0xe3,	%asi
	stxa	%l6,	[%l7 + 0x48] %asi
	membar	#Sync
	stw	%l5,	[%l7 + 0x60]
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i2
	swap	[%l7 + 0x60],	%l4
	tsubcctv	%g2,	0x16CF,	%l2
	ldx	[%l7 + 0x30],	%g5
	swap	[%l7 + 0x74],	%i7
	set	0x08, %l5
	stxa	%g1,	[%l7 + %l5] 0x89
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%l3
	ldsw	[%l7 + 0x5C],	%i0
	fble,a	%fcc1,	loop_130
	bg,a	%xcc,	loop_131
	lduh	[%l7 + 0x72],	%i3
	flush	%l7 + 0x38
loop_130:
	ldsw	[%l7 + 0x5C],	%g6
loop_131:
	nop
	set	0x43, %o3
	ldub	[%l7 + %o3],	%g3
	st	%f19,	[%l7 + 0x4C]
	flush	%l7 + 0x68
	rd	%pc,	%i1
	lduw	[%l7 + 0x1C],	%i5
	fpadd16	%f20,	%f16,	%f26
	std	%f4,	[%l7 + 0x40]
	st	%f10,	[%l7 + 0x2C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o4
	ldxa	[%g0 + %o4] 0x20,	%o2
	ldsh	[%l7 + 0x52],	%o3
	set	0x48, %g5
	ldxa	[%l7 + %g5] 0x0c,	%g7
	rdpr	%cleanwin,	%g4
	lduw	[%l7 + 0x3C],	%o1
	ldx	[%l7 + 0x48],	%i6
	stx	%o4,	[%l7 + 0x60]
	ldx	[%l7 + 0x48],	%o0
	nop
	set	0x70, %o5
	std	%f4,	[%l7 + %o5]
	fmovsn	%xcc,	%f6,	%f1
	nop
	set	0x59, %o6
	ldub	[%l7 + %o6],	%o5
	swap	[%l7 + 0x10],	%l1
	swap	[%l7 + 0x10],	%i4
	ldx	[%l7 + 0x68],	%o6
	stw	%l0,	[%l7 + 0x5C]
	edge16ln	%o7,	%l6,	%i2
	ldd	[%l7 + 0x18],	%f6
	ldd	[%l7 + 0x20],	%l4
	stw	%g2,	[%l7 + 0x24]
	ldsw	[%l7 + 0x60],	%l4
	nop
	set	0x18, %o0
	stx	%g5,	[%l7 + %o0]
	lduh	[%l7 + 0x74],	%l2
	ldd	[%l7 + 0x10],	%f30
	flush	%l7 + 0x14
	ldub	[%l7 + 0x0A],	%i7
	popc	0x1D6C,	%g1
	swap	[%l7 + 0x20],	%i0
	fbl,a	%fcc0,	loop_132
	stb	%l3,	[%l7 + 0x3D]
	stw	%g6,	[%l7 + 0x0C]
	sdivx	%i3,	0x19F4,	%g3
loop_132:
	lduw	[%l7 + 0x0C],	%i1
	ldsb	[%l7 + 0x6F],	%i5
	std	%o2,	[%l7 + 0x08]
	fornot2	%f10,	%f12,	%f30
	swap	[%l7 + 0x24],	%g7
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o2
	ldsb	[%l7 + 0x77],	%o1
	stb	%i6,	[%l7 + 0x39]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	set	0x110, %l6
	ldxa	[%g0 + %l6] 0x52,	%o4
	ldx	[%l7 + 0x78],	%o0
	umul	%g4,	0x07AE,	%o5
	ld	[%l7 + 0x4C],	%f26
	stx	%i4,	[%l7 + 0x50]
	std	%f22,	[%l7 + 0x78]
	flush	%l7 + 0x24
	nop
	set	0x1A, %i7
	ldub	[%l7 + %i7],	%l1
	fpadd32s	%f27,	%f10,	%f10
	fcmpgt16	%f0,	%f6,	%l0
	fmovsg	%xcc,	%f14,	%f14
	stw	%o7,	[%l7 + 0x6C]
	stbar
	flush	%l7 + 0x28
	ldd	[%l7 + 0x48],	%f30
	stw	%l6,	[%l7 + 0x54]
	ldd	[%l7 + 0x08],	%o6
	stbar
	nop
	set	0x19, %g1
	stb	%l5,	[%l7 + %g1]
	flush	%l7 + 0x4C
	ldub	[%l7 + 0x0E],	%g2
	movcc	%icc,	%l4,	%i2
	stx	%g5,	[%l7 + 0x50]
	flush	%l7 + 0x18
	std	%f26,	[%l7 + 0x28]
	stx	%i7,	[%l7 + 0x58]
	wrpr	%l2,	0x0D55,	%pil
	lduw	[%l7 + 0x44],	%g1
	swap	[%l7 + 0x1C],	%i0
	smul	%g6,	0x14C9,	%l3
	flush	%l7 + 0x10
	sth	%i3,	[%l7 + 0x30]
	ldstub	[%l7 + 0x33],	%g3
	st	%f25,	[%l7 + 0x74]
	ldx	[%l7 + 0x40],	%i1
	sdivx	%i5,	0x0169,	%o3
	ldstub	[%l7 + 0x70],	%o2
	ldd	[%l7 + 0x78],	%g6
	ldx	[%l7 + 0x28],	%i6
	ldsw	[%l7 + 0x70],	%o1
	st	%f19,	[%l7 + 0x58]
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x80,	%o4
	fors	%f12,	%f16,	%f12
	set	0x60, %o1
	stxa	%g4,	[%l7 + %o1] 0x2f
	membar	#Sync
	lduh	[%l7 + 0x72],	%o0
	tgu	%xcc,	0x4
	fmuld8ulx16	%f19,	%f14,	%f28
	sethi	0x08F9,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x38],	 0x2
	st	%f2,	[%l7 + 0x28]
	fabss	%f4,	%f4
	fmovdle	%icc,	%f1,	%f8
	ld	[%l7 + 0x44],	%f29
	ldub	[%l7 + 0x74],	%o7
	lduh	[%l7 + 0x4A],	%l1
	flush	%l7 + 0x24
	swap	[%l7 + 0x58],	%l6
	lduh	[%l7 + 0x2E],	%o6
	sir	0x174A
	stw	%g2,	[%l7 + 0x3C]
	stb	%l4,	[%l7 + 0x5E]
	stb	%l5,	[%l7 + 0x50]
	fxnors	%f29,	%f16,	%f25
	ldd	[%l7 + 0x38],	%i2
	std	%f30,	[%l7 + 0x70]
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i7
	sth	%l2,	[%l7 + 0x20]
	ldx	[%l7 + 0x60],	%g5
	ld	[%l7 + 0x50],	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g1,	%g6
	nop
	set	0x37, %l3
	ldub	[%l7 + %l3],	%l3
	swap	[%l7 + 0x50],	%i3
	ldub	[%l7 + 0x42],	%i0
	ldub	[%l7 + 0x74],	%g3
	wrpr	%i1,	0x1B6A,	%cwp
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x3e0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3e0] %asi,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
	ld	[%l7 + 0x28],	%f22
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1f8
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1f8] %asi,	%o2 ripped by fixASI40.pl ripped by fixASI40.pl
	lduh	[%l7 + 0x64],	%o3
	lduh	[%l7 + 0x78],	%i6
	sra	%o1,	0x10,	%o4
	alignaddrl	%g4,	%g7,	%o5
	set	0x40, %l1
	ldxa	[%l7 + %l1] 0x10,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i4,	[%l7 + 0x38]
	fmovsleu	%xcc,	%f2,	%f20
	std	%f22,	[%l7 + 0x40]
	lduh	[%l7 + 0x7C],	%l0
	lduh	[%l7 + 0x3A],	%o7
	ldstub	[%l7 + 0x4A],	%l6
	wr	%g0,	0x89,	%asi
	stxa	%o6,	[%l7 + 0x08] %asi
	fxors	%f27,	%f31,	%f30
	flush	%l7 + 0x30
	fmovdvc	%icc,	%f9,	%f4
	ld	[%l7 + 0x38],	%f31
	ldx	[%l7 + 0x20],	%g2
	swap	[%l7 + 0x58],	%l4
	bvc	loop_133
	movg	%icc,	%l5,	%l1
	ldstub	[%l7 + 0x3C],	%i2
	tgu	%icc,	0x1
loop_133:
	std	%f16,	[%l7 + 0x08]
	ldd	[%l7 + 0x38],	%i6
	fbule	%fcc3,	loop_134
	tcs	%icc,	0x2
	fbl	%fcc1,	loop_135
	rd	%ccr,	%l2
loop_134:
	ldsw	[%l7 + 0x10],	%g1
	stw	%g5,	[%l7 + 0x60]
loop_135:
	ld	[%l7 + 0x6C],	%f18
	wr	%g0,	0x19,	%asi
	stxa	%g6,	[%l7 + 0x38] %asi
	ldsh	[%l7 + 0x14],	%l3
	swap	[%l7 + 0x40],	%i0
	flush	%l7 + 0x70
	lduw	[%l7 + 0x70],	%i3
	stb	%i1,	[%l7 + 0x51]
	ldstub	[%l7 + 0x5F],	%i5
	bne,pt	%xcc,	loop_136
	ldd	[%l7 + 0x18],	%f0
	std	%f22,	[%l7 + 0x70]
	ldsh	[%l7 + 0x64],	%g3
loop_136:
	ldx	[%l7 + 0x20],	%o3
	stw	%i6,	[%l7 + 0x68]
	fmovrdlz	%o1,	%f22,	%f22
	ldx	[%l7 + 0x18],	%o2
	prefetch	[%l7 + 0x64],	 0x2
	ldsh	[%l7 + 0x52],	%o4
	stw	%g4,	[%l7 + 0x20]
	movrlez	%o5,	0x342,	%g7
	xnor	%o0,	0x0775,	%l0
	stx	%o7,	[%l7 + 0x68]
	ld	[%l7 + 0x7C],	%f27
	ldub	[%l7 + 0x13],	%l6
	movg	%xcc,	%o6,	%g2
	stb	%i4,	[%l7 + 0x14]
	wr	%g0,	0x81,	%asi
	stxa	%l5,	[%l7 + 0x48] %asi
	ldsh	[%l7 + 0x68],	%l1
	ldx	[%l7 + 0x70],	%i2
	stbar
	mulscc	%l4,	%i7,	%g1
	ldsw	[%l7 + 0x68],	%g5
	ld	[%l7 + 0x78],	%f15
	nop
	set	0x60, %g2
	ldsh	[%l7 + %g2],	%g6
	prefetch	[%l7 + 0x10],	 0x3
	stw	%l2,	[%l7 + 0x48]
	fnands	%f10,	%f8,	%f22
	st	%f0,	[%l7 + 0x24]
	ld	[%l7 + 0x28],	%f1
	ldstub	[%l7 + 0x15],	%l3
	movl	%icc,	%i0,	%i3
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i5
	lduh	[%l7 + 0x38],	%g3
	be,a,pt	%xcc,	loop_137
	prefetch	[%l7 + 0x38],	 0x0
	nop
	set	0x41, %l4
	ldsb	[%l7 + %l4],	%o3
	ldsw	[%l7 + 0x78],	%i6
loop_137:
	alignaddr	%o1,	%o2,	%o4
	fand	%f6,	%f8,	%f12
	ldsw	[%l7 + 0x20],	%i1
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x1d,	%g4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xED1, 	%hsys_tick_cmpr
	brnz	%g7,	loop_138
	std	%f6,	[%l7 + 0x08]
	std	%f0,	[%l7 + 0x10]
	array8	%o0,	%l0,	%l6
loop_138:
	ldub	[%l7 + 0x29],	%o7
	tleu	%xcc,	0x7
	lduh	[%l7 + 0x62],	%g2
	ldsb	[%l7 + 0x41],	%o6
	ld	[%l7 + 0x5C],	%f26
	std	%i4,	[%l7 + 0x78]
	st	%f18,	[%l7 + 0x24]
	std	%f30,	[%l7 + 0x68]
	and	%l1,	%l5,	%l4
	fbuge,a	%fcc1,	loop_139
	ldub	[%l7 + 0x72],	%i7
	stb	%i2,	[%l7 + 0x68]
	set	0x50, %o2
	stxa	%g1,	[%l7 + %o2] 0x2a
	membar	#Sync
loop_139:
	movneg	%xcc,	%g6,	%g5
	ldsb	[%l7 + 0x4B],	%l2
	ldub	[%l7 + 0x72],	%l3
	ldd	[%l7 + 0x60],	%f18
	ldstub	[%l7 + 0x67],	%i0
	stb	%i3,	[%l7 + 0x42]
	ldx	[%l7 + 0x50],	%i5
	ldstub	[%l7 + 0x20],	%g3
	popc	%o3,	%o1
	fone	%f30
	wr	%g0,	0x2f,	%asi
	stxa	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	ldsb	[%l7 + 0x5A],	%o4
	set	0x20, %g6
	stxa	%i1,	[%l7 + %g6] 0x2b
	membar	#Sync
	addc	%g4,	%i6,	%g7
	swap	[%l7 + 0x34],	%o5
	ldsb	[%l7 + 0x4C],	%o0
	swap	[%l7 + 0x20],	%l0
	ldstub	[%l7 + 0x55],	%o7
	wr	%g0,	0x81,	%asi
	stxa	%g2,	[%l7 + 0x10] %asi
	stx	%o6,	[%l7 + 0x50]
	st	%f9,	[%l7 + 0x7C]
	ldsb	[%l7 + 0x68],	%i4
	ldub	[%l7 + 0x37],	%l6
	fbge,a	%fcc0,	loop_140
	fmovse	%xcc,	%f9,	%f24
	ld	[%l7 + 0x0C],	%f26
	alignaddr	%l1,	%l5,	%i7
loop_140:
	ldsw	[%l7 + 0x08],	%i2
	std	%f30,	[%l7 + 0x78]
	stx	%g1,	[%l7 + 0x08]
	orn	%l4,	%g6,	%g5
	udivx	%l3,	0x0FFC,	%l2
	set	0x70, %i5
	stxa	%i3,	[%l7 + %i5] 0x81
	swap	[%l7 + 0x54],	%i0
	ldstub	[%l7 + 0x11],	%g3
	std	%o2,	[%l7 + 0x58]
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%i5
	nop
	set	0x59, %i4
	ldstub	[%l7 + %i4],	%o1
	ldstub	[%l7 + 0x71],	%o4
	st	%f18,	[%l7 + 0x30]
	addccc	%i1,	0x0902,	%o2
	std	%f10,	[%l7 + 0x40]
	fnegs	%f25,	%f7
	ldsb	[%l7 + 0x15],	%g4
	udiv	%i6,	0x1B4D,	%g7
	swap	[%l7 + 0x40],	%o0
	ldsb	[%l7 + 0x33],	%o5
	std	%l0,	[%l7 + 0x50]
	nop
	set	0x2A, %g7
	sth	%o7,	[%l7 + %g7]
	prefetch	[%l7 + 0x70],	 0x1
	sth	%o6,	[%l7 + 0x28]
	lduw	[%l7 + 0x24],	%g2
	ldsb	[%l7 + 0x6E],	%i4
	addcc	%l1,	%l6,	%i7
	std	%f16,	[%l7 + 0x60]
	stb	%i2,	[%l7 + 0x0B]
	nop
	set	0x78, %i6
	stx	%g1,	[%l7 + %i6]
	std	%f22,	[%l7 + 0x18]
	bg,a,pn	%icc,	loop_141
	brnz	%l5,	loop_142
	ldx	[%l7 + 0x20],	%l4
	ldsb	[%l7 + 0x17],	%g5
loop_141:
	nop
	setx loop_143, %l0, %l1
	jmpl %l1, %g6
loop_142:
	stx	%l3,	[%l7 + 0x78]
	subcc	%i3,	0x0766,	%i0
	prefetch	[%l7 + 0x44],	 0x2
loop_143:
	nop
	set	0x28, %g3
	std	%f22,	[%l7 + %g3]
	array32	%l2,	%o3,	%g3
	std	%f0,	[%l7 + 0x70]
	nop
	set	0x50, %l0
	std	%f22,	[%l7 + %l0]
	fmovrsgez	%i5,	%f2,	%f20
	set	0x58, %o7
	stxa	%o4,	[%l7 + %o7] 0x80
	rd	%ccr,	%i1
	ld	[%l7 + 0x48],	%f7
	swap	[%l7 + 0x48],	%o2
	swap	[%l7 + 0x24],	%o1
	stbar
	ldd	[%l7 + 0x20],	%i6
	ldd	[%l7 + 0x38],	%f4
	ldx	[%l7 + 0x50],	%g7
	ld	[%l7 + 0x0C],	%f13
	sir	0x176E
	stw	%o0,	[%l7 + 0x0C]
	set	0x38, %i3
	stxa	%o5,	[%l7 + %i3] 0x10
	ld	[%l7 + 0x30],	%f27
	swap	[%l7 + 0x60],	%l0
	ldub	[%l7 + 0x57],	%o7
	movcc	%xcc,	%o6,	%g2
	ldx	[%l7 + 0x70],	%i4
	nop
	set	0x20, %i1
	ldsb	[%l7 + %i1],	%g4
	ldsh	[%l7 + 0x1A],	%l1
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l6
	prefetch	[%l7 + 0x58],	 0x0
	prefetch	[%l7 + 0x54],	 0x0
	ldstub	[%l7 + 0x67],	%i2
	ldd	[%l7 + 0x60],	%g0
	ldsw	[%l7 + 0x78],	%i7
	ldstub	[%l7 + 0x15],	%l4
	ldd	[%l7 + 0x38],	%f2
	fmul8x16au	%f5,	%f31,	%f12
	stw	%g5,	[%l7 + 0x18]
	fpackfix	%f26,	%f6
	lduh	[%l7 + 0x36],	%g6
	lduw	[%l7 + 0x18],	%l5
	orcc	%l3,	0x0772,	%i0
	ldstub	[%l7 + 0x47],	%i3
	stbar
	ldsh	[%l7 + 0x2C],	%l2
	movl	%xcc,	%o3,	%i5
	fbue,a	%fcc2,	loop_144
	prefetch	[%l7 + 0x7C],	 0x3
	nop
	set	0x18, %i2
	sth	%o4,	[%l7 + %i2]
	stx	%g3,	[%l7 + 0x38]
loop_144:
	ldd	[%l7 + 0x28],	%f10
	wr	%o2,	%o1,	%ccr
	ldd	[%l7 + 0x08],	%f30
	ld	[%l7 + 0x14],	%f2
	subc	%i6,	0x0A68,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fmovse	%xcc,	%f21,	%f27
	popc	0x1A72,	%o5
	lduw	[%l7 + 0x68],	%o0
	std	%f2,	[%l7 + 0x10]
	stbar
	st	%f25,	[%l7 + 0x4C]
	stb	%o7,	[%l7 + 0x2F]
	ldsh	[%l7 + 0x36],	%l0
	stw	%g2,	[%l7 + 0x78]
	stw	%i4,	[%l7 + 0x4C]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	wr	%g0,	0x52,	%asi
	stxa	%g4,	[%g0 + 0x118] %asi
	flush	%l7 + 0x08
	call	loop_145
	st	%f13,	[%l7 + 0x14]
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l1
loop_145:
	stw	%l6,	[%l7 + 0x24]
	fbg	%fcc0,	loop_146
	ld	[%l7 + 0x30],	%f14
	fxors	%f27,	%f24,	%f11
	ldstub	[%l7 + 0x14],	%o6
loop_146:
	flush	%l7 + 0x54
	stb	%g1,	[%l7 + 0x39]
	ldx	[%l7 + 0x50],	%i7
	move	%icc,	%i2,	%g5
	fmovsneg	%icc,	%f29,	%f0
	ldsw	[%l7 + 0x58],	%g6
	sth	%l4,	[%l7 + 0x7A]
	ldd	[%l7 + 0x38],	%l4
	ldstub	[%l7 + 0x10],	%l3
	swap	[%l7 + 0x08],	%i3
	wr	%g0,	0x18,	%asi
	stxa	%l2,	[%l7 + 0x30] %asi
	ldx	[%l7 + 0x68],	%i0
	st	%f10,	[%l7 + 0x50]
	sdiv	%o3,	0x067B,	%i5
	flush	%l7 + 0x6C
	std	%f6,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %l5
	ldxa	[%g0 + %l5] 0x21,	%o4
	nop
	set	0x40, %o4
	std	%o2,	[%l7 + %o4]
	ldsb	[%l7 + 0x5E],	%o1
	prefetch	[%l7 + 0x34],	 0x2
	fbuge	%fcc2,	loop_147
	ldstub	[%l7 + 0x12],	%i6
	stx	%g7,	[%l7 + 0x48]
	ldd	[%l7 + 0x08],	%f20
loop_147:
	flush	%l7 + 0x74
	ldd	[%l7 + 0x40],	%g2
	tvs	%icc,	0x7
	sth	%i1,	[%l7 + 0x18]
	wr	%g0,	0x11,	%asi
	stxa	%o0,	[%l7 + 0x38] %asi
	ldsh	[%l7 + 0x4C],	%o5
	flush	%l7 + 0x14
	stw	%o7,	[%l7 + 0x40]
	udiv	%l0,	0x023D,	%g2
	prefetch	[%l7 + 0x30],	 0x3
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i4
	ldub	[%l7 + 0x1F],	%l1
	movpos	%xcc,	%g4,	%o6
	ldd	[%l7 + 0x40],	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f28,	%f16,	%f26
	ldub	[%l7 + 0x26],	%l6
	prefetch	[%l7 + 0x54],	 0x2
	nop
	set	0x28, %o3
	ldsw	[%l7 + %o3],	%i7
	std	%g0,	[%l7 + 0x38]
	stx	%g5,	[%l7 + 0x68]
	sth	%i2,	[%l7 + 0x3C]
	bshuffle	%f16,	%f0,	%f18
	ldub	[%l7 + 0x16],	%g6
	ldstub	[%l7 + 0x08],	%l4
	udivx	%l5,	0x0B39,	%l3
	lduh	[%l7 + 0x22],	%i3
	ldx	[%l7 + 0x38],	%l2
	stb	%o3,	[%l7 + 0x0D]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x132, 	%hsys_tick_cmpr
	tsubcc	%o4,	%i0,	%o1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o5
	stxa	%o2,	[%g0 + %o5] 0x20
	nop
	set	0x4A, %g5
	ldsh	[%l7 + %g5],	%i6
	st	%f20,	[%l7 + 0x70]
	wr	%g0,	0x18,	%asi
	stxa	%g7,	[%l7 + 0x10] %asi
	movleu	%xcc,	%i1,	%o0
	ld	[%l7 + 0x68],	%f3
	ldx	[%l7 + 0x20],	%g3
	ldx	[%l7 + 0x40],	%o7
	ldsb	[%l7 + 0x51],	%o5
	fmovrslez	%g2,	%f15,	%f16
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	set	0x00, %o6
	ldxa	[%g0 + %o6] 0x50,	%l0
	stx	%l1,	[%l7 + 0x10]
	lduh	[%l7 + 0x30],	%g4
	ldsw	[%l7 + 0x3C],	%o6
	st	%f19,	[%l7 + 0x0C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l6
	movleu	%xcc,	%i7,	%g1
	edge8ln	%i4,	%g5,	%g6
	stw	%i2,	[%l7 + 0x68]
	ldsb	[%l7 + 0x3B],	%l5
	lduw	[%l7 + 0x14],	%l4
	sdivcc	%i3,	0x0832,	%l2
	rd	%sys_tick_cmpr,	%o3
	st	%f26,	[%l7 + 0x48]
	stx	%i5,	[%l7 + 0x38]
	bn	%xcc,	loop_148
	stbar
	wr	%g0,	0x1c,	%asi
	stxa	%o4,	[%l7 + 0x20] %asi
loop_148:
	nop
	set	0x3C, %o0
	ldsh	[%l7 + %o0],	%i0
	ldsh	[%l7 + 0x12],	%o1
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o2
	ld	[%l7 + 0x68],	%f19
	fsrc1	%f14,	%f10
	nop
	set	0x60, %i7
	ldstub	[%l7 + %i7],	%g7
	stw	%i1,	[%l7 + 0x48]
	std	%i6,	[%l7 + 0x10]
	lduw	[%l7 + 0x38],	%g3
	xnorcc	%o7,	%o5,	%g2
	edge32n	%o0,	%l0,	%l1
	ldx	[%l7 + 0x28],	%g4
	nop
	set	0x08, %g1
	ldsh	[%l7 + %g1],	%o6
	flush	%l7 + 0x68

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0F5, 	%hsys_tick_cmpr
	stbar
	wr	%g0,	0xea,	%asi
	stxa	%g1,	[%l7 + 0x68] %asi
	membar	#Sync
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l6
	ldd	[%l7 + 0x28],	%i4
	st	%f16,	[%l7 + 0x10]
	sth	%g5,	[%l7 + 0x5C]
	fnegd	%f4,	%f2
	ldstub	[%l7 + 0x50],	%i2
	orncc	%l5,	0x0D72,	%l3
	tsubcc	%g6,	0x1816,	%i3
	sdivx	%l2,	0x039F,	%o3
	stx	%i5,	[%l7 + 0x60]
	fbe	%fcc0,	loop_149
	edge8l	%o4,	%l4,	%o1
	flush	%l7 + 0x24
	nop
	set	0x0F, %o1
	ldsb	[%l7 + %o1],	%i0
loop_149:
	prefetch	[%l7 + 0x08],	 0x0
	tsubcc	%o2,	0x01DA,	%g7
	swap	[%l7 + 0x58],	%i1
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%g3
	lduw	[%l7 + 0x44],	%o7
	call	loop_150
	swap	[%l7 + 0x78],	%o5
	nop
	set	0x7D, %l3
	ldub	[%l7 + %l3],	%g2
	fcmpeq32	%f30,	%f10,	%i6
loop_150:
	ldd	[%l7 + 0x50],	%l0
	ldd	[%l7 + 0x60],	%o0
	prefetch	[%l7 + 0x44],	 0x3
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %g2
	stxa	%g4,	[%g0 + %g2] 0x5f
	sth	%l1,	[%l7 + 0x2E]
	nop
	set	0x08, %l4
	ldub	[%l7 + %l4],	%i7
	lduw	[%l7 + 0x5C],	%g1
	xorcc	%o6,	0x0C1B,	%i4
	lduw	[%l7 + 0x30],	%l6
	srax	%g5,	%l5,	%l3
	ldx	[%l7 + 0x18],	%g6
	ldsb	[%l7 + 0x5B],	%i3
	movrne	%i2,	%o3,	%l2
	swap	[%l7 + 0x30],	%o4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE37, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x7C],	%i0
	ldsb	[%l7 + 0x15],	%o2
	flush	%l7 + 0x4C
	sth	%i5,	[%l7 + 0x44]
	wr	%g0,	0x81,	%asi
	stxa	%g7,	[%l7 + 0x28] %asi
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x89,	%g3
	lduh	[%l7 + 0x44],	%i1
	ldd	[%l7 + 0x60],	%f10
	alignaddr	%o7,	%o5,	%i6
	stbar
	stw	%l0,	[%l7 + 0x28]
	swap	[%l7 + 0x08],	%g2
	prefetch	[%l7 + 0x14],	 0x1
	ldd	[%l7 + 0x68],	%f12
	wr	%g0,	0x1c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g4
	stb	%o0,	[%l7 + 0x34]
	taddcc	%i7,	%l1,	%o6
	addccc	%i4,	%g1,	%l6
	ldd	[%l7 + 0x20],	%f20
	std	%f20,	[%l7 + 0x50]
	flush	%l7 + 0x64
	ld	[%l7 + 0x7C],	%f21
	ldd	[%l7 + 0x70],	%g4
	prefetch	[%l7 + 0x20],	 0x3
	edge8ln	%l3,	%l5,	%g6
	ld	[%l7 + 0x28],	%f24
	lduw	[%l7 + 0x24],	%i2
	wrpr	%i3,	%l2,	%cwp
	stbar
	ldsh	[%l7 + 0x34],	%o4
	nop
	set	0x30, %o2
	std	%f18,	[%l7 + %o2]
	stbar
	std	%o2,	[%l7 + 0x48]
	fmovrsgz	%o1,	%f5,	%f8
	ld	[%l7 + 0x48],	%f2
	ldub	[%l7 + 0x5B],	%l4
	stbar
	fmovsa	%icc,	%f21,	%f31
	ldx	[%l7 + 0x10],	%o2
	ld	[%l7 + 0x70],	%f30
	stbar
	nop
	set	0x77, %l1
	stb	%i0,	[%l7 + %l1]
	ldsh	[%l7 + 0x1A],	%i5
	ldub	[%l7 + 0x6D],	%g3
	movrgez	%g7,	0x0E2,	%o7
	sth	%o5,	[%l7 + 0x72]
	fpsub32	%f20,	%f12,	%f24
	ldx	[%l7 + 0x48],	%i1
	umul	%i6,	%l0,	%g2
	ldd	[%l7 + 0x50],	%f16
	lduw	[%l7 + 0x44],	%o0
	nop
	set	0x55, %g6
	ldstub	[%l7 + %g6],	%i7
	ldsh	[%l7 + 0x14],	%g4
	lduw	[%l7 + 0x48],	%l1
	prefetch	[%l7 + 0x24],	 0x2
	xnorcc	%o6,	%g1,	%l6
	stbar
	swap	[%l7 + 0x2C],	%i4
	srl	%l3,	0x11,	%l5
	ldx	[%l7 + 0x48],	%g5
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x208
	set	0x208, %g4
	stxa	%i2,	[%g0 + %g4] 0x52
	ldub	[%l7 + 0x37],	%i3
	wr	%g0,	0x2b,	%asi
	stxa	%l2,	[%l7 + 0x30] %asi
	membar	#Sync
	flush	%l7 + 0x08
	ldd	[%l7 + 0x48],	%g6
	movle	%icc,	%o4,	%o3
	ldd	[%l7 + 0x10],	%l4
	rdpr	%tl,	%o2
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%i0
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o1
	std	%i4,	[%l7 + 0x60]
	ldsw	[%l7 + 0x38],	%g3
	taddcctv	%o7,	%g7,	%o5
	flush	%l7 + 0x28
	st	%f31,	[%l7 + 0x68]
	std	%i0,	[%l7 + 0x20]
	membar	0x3C
	stw	%i6,	[%l7 + 0x74]
	std	%g2,	[%l7 + 0x60]
	set	0x30, %g7
	stxa	%o0,	[%l7 + %g7] 0x0c
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%i6
	ldsh	[%l7 + 0x6E],	%g4
	stbar
	std	%l0,	[%l7 + 0x48]
	st	%f19,	[%l7 + 0x60]
	std	%o6,	[%l7 + 0x28]
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f12
	std	%l0,	[%l7 + 0x30]
	ldsw	[%l7 + 0x54],	%l6
	fmovd	%f10,	%f10
	stw	%i4,	[%l7 + 0x38]
	set	0x50, %i4
	stxa	%g1,	[%l7 + %i4] 0xe3
	membar	#Sync
	flush	%l7 + 0x3C
	stw	%l3,	[%l7 + 0x60]
	edge32	%g5,	%l5,	%i2
	ldub	[%l7 + 0x30],	%l2
	lduh	[%l7 + 0x1A],	%g6
	nop
	set	0x32, %l0
	lduh	[%l7 + %l0],	%o4
	flush	%l7 + 0x08
	umul	%i3,	%l4,	%o3
	std	%f16,	[%l7 + 0x68]
	swap	[%l7 + 0x2C],	%i0
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x10,	%o2
	stb	%i5,	[%l7 + 0x48]
	flush	%l7 + 0x4C
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o1
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %o7
	stxa	%g3,	[%g0 + %o7] 0x21
	stb	%g7,	[%l7 + 0x21]
	ldub	[%l7 + 0x0D],	%o7
	ldd	[%l7 + 0x70],	%f8
	nop
	set	0x7E, %i2
	ldub	[%l7 + %i2],	%i1
	ldd	[%l7 + 0x78],	%f0
	std	%o4,	[%l7 + 0x68]
	nop
	set	0x50, %i1
	std	%i6,	[%l7 + %i1]
	stb	%g2,	[%l7 + 0x20]
	flush	%l7 + 0x08
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x208
	set	0x208, %o4
	ldxa	[%g0 + %o4] 0x52,	%i7
	sth	%o0,	[%l7 + 0x2A]
	ld	[%l7 + 0x58],	%f25
	lduh	[%l7 + 0x4E],	%l0
	ld	[%l7 + 0x3C],	%f20
	edge8ln	%o6,	%g4,	%l6
	ldsb	[%l7 + 0x1C],	%i4
	lduw	[%l7 + 0x48],	%l1
	rdpr	%gl,	%g1
	ldx	[%l7 + 0x38],	%g5
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%l5
	ldsw	[%l7 + 0x54],	%l3
	lduw	[%l7 + 0x58],	%i2
	stbar
	alignaddrl	%l2,	%o4,	%i3
	rdpr	%tl,	%l4
	nop
	set	0x78, %o3
	stx	%g6,	[%l7 + %o3]
	fmovrslez	%i0,	%f1,	%f25
	ldsw	[%l7 + 0x34],	%o3
	ld	[%l7 + 0x4C],	%f6
	prefetch	[%l7 + 0x2C],	 0x2
	stx	%o2,	[%l7 + 0x78]
	ldsw	[%l7 + 0x4C],	%i5
	stbar
	ldstub	[%l7 + 0x24],	%o1
	std	%f30,	[%l7 + 0x38]
	lduw	[%l7 + 0x28],	%g7
	lduh	[%l7 + 0x10],	%g3
	ldd	[%l7 + 0x08],	%f26
	flush	%l7 + 0x38
	wr	%g0,	0x1c,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i1
	std	%o6,	[%l7 + 0x50]
	lduw	[%l7 + 0x6C],	%i6
	ldstub	[%l7 + 0x41],	%g2
	movre	%o5,	0x339,	%o0
	prefetch	[%l7 + 0x50],	 0x3
	swap	[%l7 + 0x58],	%i7
	swap	[%l7 + 0x20],	%l0
	ld	[%l7 + 0x74],	%f25
	stb	%g4,	[%l7 + 0x39]
	fpadd16s	%f7,	%f16,	%f3
	bleu,a,pt	%icc,	loop_151
	swap	[%l7 + 0x40],	%l6
	stw	%i4,	[%l7 + 0x34]
	ldd	[%l7 + 0x38],	%l0
loop_151:
	fsrc2s	%f9,	%f2
	be	loop_152
	swap	[%l7 + 0x78],	%o6
	stw	%g1,	[%l7 + 0x54]
	ldsh	[%l7 + 0x66],	%g5
loop_152:
	nop
	set	0x77, %o5
	stb	%l3,	[%l7 + %o5]
	alignaddrl	%l5,	%l2,	%o4
	sth	%i3,	[%l7 + 0x1A]
	wrpr	%l4,	%g6,	%pil
	ld	[%l7 + 0x58],	%f0
	ld	[%l7 + 0x44],	%f12
	fcmpgt16	%f10,	%f18,	%i0
	st	%f4,	[%l7 + 0x44]
	rdhpr	%hpstate,	%i2
	ldsw	[%l7 + 0x30],	%o3
	nop
	set	0x28, %o6
	ldub	[%l7 + %o6],	%o2
	subcc	%o1,	%i5,	%g3
	nop
	set	0x48, %g5
	std	%f24,	[%l7 + %g5]
	ldub	[%l7 + 0x19],	%g7
	ldsw	[%l7 + 0x08],	%o7
	stb	%i1,	[%l7 + 0x37]
	stw	%g2,	[%l7 + 0x78]
	ldd	[%l7 + 0x38],	%f14
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x108
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%i6
	ldsb	[%l7 + 0x52],	%o5
	ldsw	[%l7 + 0x3C],	%o0
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	set	0x0, %l6
	stxa	%i7,	[%g0 + %l6] 0x57
	fmovsne	%icc,	%f10,	%f19
	addc	%l0,	%g4,	%l6
	sdivx	%l1,	0x0FE6,	%o6
	std	%f24,	[%l7 + 0x50]
	edge16l	%g1,	%i4,	%g5
	swap	[%l7 + 0x48],	%l5
	ld	[%l7 + 0x18],	%f25
	st	%f31,	[%l7 + 0x38]
	lduh	[%l7 + 0x2C],	%l3
	ldd	[%l7 + 0x60],	%f22
	tn	%xcc,	0x3
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%o4
	wr	%g0,	0x04,	%asi
	stxa	%l2,	[%l7 + 0x48] %asi
	stx	%l4,	[%l7 + 0x78]
	ldub	[%l7 + 0x48],	%i3
	stx	%i0,	[%l7 + 0x50]
	ldsw	[%l7 + 0x30],	%g6
	fbn	%fcc3,	loop_153
	stbar
	ldd	[%l7 + 0x70],	%o2
	std	%f20,	[%l7 + 0x40]
loop_153:
	std	%f12,	[%l7 + 0x68]
	ldstub	[%l7 + 0x20],	%i2
	prefetch	[%l7 + 0x54],	 0x0
	add	%o2,	0x0606,	%i5
	ldd	[%l7 + 0x30],	%f26
	stx	%g3,	[%l7 + 0x50]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	set	0x18, %i7
	ldxa	[%g0 + %i7] 0x50,	%o1
	nop
	set	0x46, %o1
	ldstub	[%l7 + %o1],	%o7
	ldsh	[%l7 + 0x5A],	%g7
	mova	%icc,	%g2,	%i1
	subccc	%o5,	0x1925,	%o0
	fzeros	%f31
	stb	%i7,	[%l7 + 0x4D]
	stx	%i6,	[%l7 + 0x10]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ldd	[%l7 + 0x68],	%g4
	ldub	[%l7 + 0x43],	%l6
	fmovdneg	%icc,	%f8,	%f25
	wr	%g0,	0x80,	%asi
	stxa	%o6,	[%l7 + 0x60] %asi
	tsubcctv	%g1,	0x0723,	%i4
	sth	%g5,	[%l7 + 0x18]
	ld	[%l7 + 0x08],	%f26
	sth	%l5,	[%l7 + 0x26]
	ldx	[%l7 + 0x68],	%l3
	std	%l0,	[%l7 + 0x18]
	nop
	set	0x0F, %g1
	ldsb	[%l7 + %g1],	%l2
	sth	%o4,	[%l7 + 0x10]
	fnot2s	%f26,	%f20
	swap	[%l7 + 0x10],	%i3
	std	%f14,	[%l7 + 0x10]
	ldd	[%l7 + 0x70],	%f2
	stbar
	fbue	%fcc1,	loop_154
	rdpr	%otherwin,	%i0
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g6
loop_154:
	movn	%xcc,	%o3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o2,	%i2,	%i5
	std	%o0,	[%l7 + 0x78]
	ldx	[%l7 + 0x38],	%o7
	ldd	[%l7 + 0x48],	%f22
	nop
	set	0x74, %l3
	stw	%g3,	[%l7 + %l3]
	tne	%xcc,	0x6
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1d0
	set	0x1d0, %g2
	nop 	! 	stxa	%g7,	[%g0 + %g2] 0x40 ripped by fixASI40.pl
	std	%f28,	[%l7 + 0x70]
	sth	%g2,	[%l7 + 0x58]
	prefetch	[%l7 + 0x7C],	 0x2
	bne	loop_155
	lduw	[%l7 + 0x14],	%i1
	lduh	[%l7 + 0x66],	%o5
	sth	%o0,	[%l7 + 0x16]
loop_155:
	st	%f20,	[%l7 + 0x74]
	stb	%i7,	[%l7 + 0x19]
	tne	%xcc,	0x5
	sth	%i6,	[%l7 + 0x72]
	fnegd	%f0,	%f2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	lduw	[%l7 + 0x3C],	%g4
	stw	%o6,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x38],	%g1
	std	%i6,	[%l7 + 0x10]
	swap	[%l7 + 0x3C],	%g5
	ldd	[%l7 + 0x60],	%f18
	lduh	[%l7 + 0x28],	%i4
	swap	[%l7 + 0x48],	%l5
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x15,	%l1
	srax	%l2,	%o4,	%l3
	mova	%xcc,	%i3,	%g6
	std	%o2,	[%l7 + 0x40]
	ldd	[%l7 + 0x10],	%f22
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f28
	ldsh	[%l7 + 0x64],	%l4
	tge	%icc,	0x1
	ldd	[%l7 + 0x38],	%f2
	std	%o2,	[%l7 + 0x50]
	edge32ln	%i2,	%i0,	%o1
	ld	[%l7 + 0x68],	%f19
	ldsb	[%l7 + 0x46],	%o7
	ldd	[%l7 + 0x40],	%i4
	flush	%l7 + 0x44
	flush	%l7 + 0x0C
	rdpr	%pil,	%g3
	ldd	[%l7 + 0x20],	%g6
	nop
	set	0x46, %o2
	ldsh	[%l7 + %o2],	%i1
	lduh	[%l7 + 0x38],	%o5
	stbar
	wr	%g0,	0xea,	%asi
	stxa	%g2,	[%l7 + 0x70] %asi
	membar	#Sync
	flush	%l7 + 0x14
	sethi	0x1711,	%i7
	nop
	set	0x3C, %i0
	stw	%i6,	[%l7 + %i0]
	lduh	[%l7 + 0x6C],	%l0
	stb	%o0,	[%l7 + 0x67]
	ldx	[%l7 + 0x78],	%o6
	nop
	set	0x38, %l1
	std	%f2,	[%l7 + %l1]
	tleu	%xcc,	0x2
	fpsub16s	%f20,	%f2,	%f28
	andn	%g4,	%l6,	%g5
	movgu	%xcc,	%i4,	%l5
	stw	%g1,	[%l7 + 0x34]
	stbar
	swap	[%l7 + 0x30],	%l1
	ld	[%l7 + 0x7C],	%f14
	ldstub	[%l7 + 0x74],	%l2
	ldsb	[%l7 + 0x61],	%o4
	set	0x08, %g6
	stxa	%l3,	[%l7 + %g6] 0x10
	std	%f28,	[%l7 + 0x38]
	flush	%l7 + 0x5C
	ldsw	[%l7 + 0x38],	%g6
	ldsh	[%l7 + 0x30],	%o3
	ldsb	[%l7 + 0x28],	%i3
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%o2
	lduh	[%l7 + 0x1A],	%i2
	ldd	[%l7 + 0x70],	%f0
	fpackfix	%f24,	%f16
	ldsh	[%l7 + 0x42],	%i0
	ldd	[%l7 + 0x18],	%o0
	std	%f6,	[%l7 + 0x48]
	ldsh	[%l7 + 0x66],	%o7
	std	%i4,	[%l7 + 0x60]
	nop
	set	0x30, %i5
	ldub	[%l7 + %i5],	%g3
	ldsw	[%l7 + 0x0C],	%i1
	lduh	[%l7 + 0x18],	%g7
	std	%g2,	[%l7 + 0x30]
	st	%f30,	[%l7 + 0x48]
	ldsh	[%l7 + 0x2C],	%o5
	ldub	[%l7 + 0x2A],	%i6
	std	%i6,	[%l7 + 0x20]
	st	%f7,	[%l7 + 0x44]
	lduw	[%l7 + 0x68],	%o0
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x14,	%o6
	ld	[%l7 + 0x7C],	%f8
	swap	[%l7 + 0x6C],	%l0
	ldsw	[%l7 + 0x18],	%l6
	set	0x68, %g3
	ldxa	[%l7 + %g3] 0x15,	%g5
	lduw	[%l7 + 0x3C],	%i4
	ldd	[%l7 + 0x28],	%f6
	ldsb	[%l7 + 0x10],	%l5
	ldsb	[%l7 + 0x7B],	%g1
	ldub	[%l7 + 0x1E],	%l1
	stx	%l2,	[%l7 + 0x58]
	ldub	[%l7 + 0x12],	%o4
	stbar
	sll	%g4,	%l3,	%g6
	swap	[%l7 + 0x0C],	%i3
	std	%f26,	[%l7 + 0x78]
	and	%o2,	0x0565,	%i2
	movpos	%icc,	%l4,	%i0
	ldsw	[%l7 + 0x60],	%o1
	nop
	set	0x57, %i4
	ldub	[%l7 + %i4],	%o7
	lduw	[%l7 + 0x50],	%o3
	movne	%xcc,	%i5,	%i1
	stbar
	ldstub	[%l7 + 0x76],	%g3
	stbar
	ldstub	[%l7 + 0x7C],	%g2
	ldsw	[%l7 + 0x54],	%o5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i6
	fpsub16s	%f5,	%f17,	%f22
	sth	%g7,	[%l7 + 0x74]
	stb	%o0,	[%l7 + 0x6F]
	ldub	[%l7 + 0x50],	%i7
	ldsb	[%l7 + 0x41],	%o6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x220
	set	0x220, %l0
	ldxa	[%g0 + %l0] 0x52,	%l0
	lduh	[%l7 + 0x5A],	%l6
	ldd	[%l7 + 0x30],	%i4
	tsubcc	%l5,	%g1,	%l1
	ld	[%l7 + 0x2C],	%f0
	ldub	[%l7 + 0x29],	%g5
	tsubcctv	%l2,	0x081B,	%g4
	lduw	[%l7 + 0x74],	%l3
	st	%f28,	[%l7 + 0x70]
	flush	%l7 + 0x74
	ldd	[%l7 + 0x58],	%f14
	lduw	[%l7 + 0x34],	%i3
	sth	%o4,	[%l7 + 0x72]
	ldsh	[%l7 + 0x08],	%o2
	lduw	[%l7 + 0x7C],	%i2
	sth	%i0,	[%l7 + 0x76]
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f30
	stbar
	st	%f29,	[%l7 + 0x74]
	swap	[%l7 + 0x50],	%o1
	wr 	%g0, 	0x7, 	%fprs
	lduw	[%l7 + 0x0C],	%l4
	edge32l	%o3,	%i1,	%i5
	swap	[%l7 + 0x10],	%g3
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x04,	%o5
	ldsw	[%l7 + 0x14],	%i6
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%g2
	add	%o0,	%i7,	%g7
	nop
	set	0x14, %i1
	ldstub	[%l7 + %i1],	%l0
	st	%f12,	[%l7 + 0x4C]
	nop
	set	0x6A, %o4
	lduh	[%l7 + %o4],	%o6
	std	%i6,	[%l7 + 0x40]
	sth	%i4,	[%l7 + 0x7E]
	bge,a,pt	%xcc,	loop_156
	ldsh	[%l7 + 0x2E],	%l5
	stbar
	fmovd	%f26,	%f18
loop_156:
	nop
	set	0x48, %i2
	stxa	%l1,	[%l7 + %i2] 0x1d
	subccc	%g5,	%l2,	%g4
	or	%g1,	0x014A,	%g6
	fbul	%fcc3,	loop_157
	std	%i2,	[%l7 + 0x18]
	sth	%l3,	[%l7 + 0x3E]
	swap	[%l7 + 0x40],	%o4
loop_157:
	ldd	[%l7 + 0x20],	%o2
	alignaddrl	%i0,	%o1,	%i2
	sra	%o7,	%l4,	%o3
	st	%f12,	[%l7 + 0x50]
	bleu,a	%xcc,	loop_158
	alignaddrl	%i5,	%i1,	%o5
	ldd	[%l7 + 0x68],	%i6
	stbar
loop_158:
	sth	%g3,	[%l7 + 0x4E]
	std	%o0,	[%l7 + 0x40]
	addc	%g2,	%i7,	%g7
	flush	%l7 + 0x5C
	fbge	%fcc3,	loop_159
	stbar
	stw	%l0,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x52],	%o6
loop_159:
	nop
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x88,	%l6
	flush	%l7 + 0x28
	stb	%i4,	[%l7 + 0x2F]
	prefetch	[%l7 + 0x14],	 0x3
	stx	%l5,	[%l7 + 0x70]
	ldsb	[%l7 + 0x33],	%g5
	fble,a	%fcc3,	loop_160
	te	%icc,	0x0
	nop
	set	0x70, %l5
	prefetch	[%l7 + %l5],	 0x2
	ld	[%l7 + 0x28],	%f12
loop_160:
	edge8ln	%l2,	%g4,	%l1
	fblg	%fcc2,	loop_161
	ldd	[%l7 + 0x20],	%g0
	movrgz	%g6,	%l3,	%i3
	stb	%o4,	[%l7 + 0x3F]
loop_161:
	ldd	[%l7 + 0x48],	%o2
	ldstub	[%l7 + 0x60],	%o1
	prefetch	[%l7 + 0x20],	 0x1
	stbar
	ldsh	[%l7 + 0x62],	%i0
	st	%f9,	[%l7 + 0x78]
	ldx	[%l7 + 0x60],	%o7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i2
	swap	[%l7 + 0x18],	%l4
	prefetch	[%l7 + 0x7C],	 0x2
	std	%f28,	[%l7 + 0x38]
	std	%o2,	[%l7 + 0x28]
	umulcc	%i5,	0x0B64,	%i1
	stx	%i6,	[%l7 + 0x38]
	flush	%l7 + 0x38
	ldsb	[%l7 + 0x22],	%g3
	ldd	[%l7 + 0x78],	%f26
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x150
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o0,	[%g0 + 0x150] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	st	%f1,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x20],	%o5
	tne	%icc,	0x7
	ldsh	[%l7 + 0x64],	%i7
	sll	%g7,	%g2,	%o6
	prefetch	[%l7 + 0x18],	 0x3
	fmovdgu	%icc,	%f4,	%f21
	flush	%l7 + 0x48
	flush	%l7 + 0x74
	ldd	[%l7 + 0x40],	%f12
	ldsh	[%l7 + 0x5C],	%l0
	stbar
	ldx	[%l7 + 0x78],	%i4
	stw	%l6,	[%l7 + 0x68]
	stw	%l5,	[%l7 + 0x20]
	ldd	[%l7 + 0x68],	%f8
	std	%f30,	[%l7 + 0x70]
	lduh	[%l7 + 0x4A],	%l2
	addccc	%g4,	0x0A0B,	%l1
	nop
	set	0x32, %o6
	ldsh	[%l7 + %o6],	%g1
	flush	%l7 + 0x5C
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
	movgu	%icc,	%l3,	%i3
	ldsw	[%l7 + 0x70],	%g5
	st	%f28,	[%l7 + 0x30]
	ld	[%l7 + 0x68],	%f23
	stw	%o4,	[%l7 + 0x10]
	prefetch	[%l7 + 0x10],	 0x0
	lduw	[%l7 + 0x74],	%o2
	nop
	set	0x46, %g5
	ldsh	[%l7 + %g5],	%o1
	stx	%o7,	[%l7 + 0x30]
	stx	%i2,	[%l7 + 0x50]
	stw	%i0,	[%l7 + 0x78]
	stw	%l4,	[%l7 + 0x20]
	std	%f2,	[%l7 + 0x38]
	ldd	[%l7 + 0x30],	%f12
	prefetch	[%l7 + 0x50],	 0x2
	srlx	%o3,	%i1,	%i6
	stx	%g3,	[%l7 + 0x68]
	swap	[%l7 + 0x48],	%i5
	ldsh	[%l7 + 0x32],	%o0
	ldub	[%l7 + 0x63],	%o5
	sllx	%g7,	%g2,	%o6
	ldd	[%l7 + 0x28],	%l0
	ld	[%l7 + 0x1C],	%f19
	stx	%i4,	[%l7 + 0x30]
	stb	%i7,	[%l7 + 0x69]
	ldsw	[%l7 + 0x0C],	%l5
	ldd	[%l7 + 0x60],	%l2
	ldd	[%l7 + 0x18],	%g4
	flush	%l7 + 0x1C
	movleu	%icc,	%l6,	%g1
	ldub	[%l7 + 0x75],	%l1
	ldd	[%l7 + 0x28],	%g6
	flush	%l7 + 0x7C
	ldub	[%l7 + 0x76],	%i3
	ldsb	[%l7 + 0x59],	%l3
	lduw	[%l7 + 0x20],	%g5
	prefetch	[%l7 + 0x6C],	 0x0
	nop
	set	0x55, %o5
	ldub	[%l7 + %o5],	%o4
	sth	%o1,	[%l7 + 0x24]
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o2
	stx	%o7,	[%l7 + 0x30]
	ld	[%l7 + 0x70],	%f11
	std	%f26,	[%l7 + 0x40]
	st	%f25,	[%l7 + 0x70]
	std	%f10,	[%l7 + 0x10]
	addc	%i2,	0x1CF4,	%l4
	st	%f28,	[%l7 + 0x2C]
	ld	[%l7 + 0x0C],	%f17
	array16	%i0,	%i1,	%o3
	ldsb	[%l7 + 0x3A],	%i6
	flush	%l7 + 0x54
	stbar
	xorcc	%i5,	0x0865,	%o0
	stx	%o5,	[%l7 + 0x10]
	bleu	loop_162
	ldd	[%l7 + 0x08],	%f20
	fpadd32	%f28,	%f28,	%f16
	taddcc	%g7,	0x1322,	%g2
loop_162:
	nop
	set	0x28, %l6
	stx	%g3,	[%l7 + %l6]
	stw	%o6,	[%l7 + 0x38]
	ldsb	[%l7 + 0x17],	%i4
	stb	%l0,	[%l7 + 0x49]
	movrlez	%i7,	%l5,	%l2
	movrne	%g4,	%l6,	%g1
	ld	[%l7 + 0x58],	%f6
	std	%l0,	[%l7 + 0x48]
	fbne	%fcc3,	loop_163
	ldd	[%l7 + 0x30],	%i2
	st	%f19,	[%l7 + 0x58]
	ldd	[%l7 + 0x60],	%l2
loop_163:
	flush	%l7 + 0x1C
	lduh	[%l7 + 0x28],	%g5
	fexpand	%f12,	%f18
	ldsw	[%l7 + 0x20],	%g6
	edge32	%o1,	%o4,	%o2
	st	%f0,	[%l7 + 0x1C]
	stbar
	nop
	set	0x66, %i7
	sth	%o7,	[%l7 + %i7]
	std	%i2,	[%l7 + 0x20]
	ldd	[%l7 + 0x18],	%l4
	ldd	[%l7 + 0x58],	%i0
	ldub	[%l7 + 0x74],	%i0
	st	%f31,	[%l7 + 0x74]
	sllx	%o3,	0x13,	%i6
	andcc	%o0,	0x02BE,	%o5
	swap	[%l7 + 0x30],	%g7
	flush	%l7 + 0x24
	std	%i4,	[%l7 + 0x28]
	ldd	[%l7 + 0x30],	%f28
	nop
	set	0x56, %o0
	lduh	[%l7 + %o0],	%g2
	fcmpne32	%f0,	%f30,	%o6
	std	%f8,	[%l7 + 0x08]
	taddcctv	%i4,	0x0221,	%l0
	stbar
	lduh	[%l7 + 0x52],	%g3
	ldsb	[%l7 + 0x2A],	%l5
	movvs	%icc,	%i7,	%g4
	std	%l2,	[%l7 + 0x20]
	stbar
	std	%f4,	[%l7 + 0x68]
	subcc	%l6,	%g1,	%l1
	nop
	set	0x08, %o1
	ldub	[%l7 + %o1],	%i3
	sth	%g5,	[%l7 + 0x6E]
	std	%g6,	[%l7 + 0x60]
	lduh	[%l7 + 0x74],	%o1
	std	%l2,	[%l7 + 0x78]
	wr	%g0,	0x04,	%asi
	stxa	%o2,	[%l7 + 0x50] %asi
	nop
	set	0x24, %l3
	lduh	[%l7 + %l3],	%o4
	ldd	[%l7 + 0x18],	%i2
	stx	%o7,	[%l7 + 0x40]
	ldd	[%l7 + 0x60],	%f6
	ldsh	[%l7 + 0x78],	%l4
	nop
	setx	loop_164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x58],	%f18
	ldd	[%l7 + 0x58],	%f6
	wr	%g0,	0x2f,	%asi
	stxa	%i1,	[%l7 + 0x58] %asi
	membar	#Sync
loop_164:
	ldx	[%l7 + 0x40],	%i0
	ldx	[%l7 + 0x10],	%o3
	stbar
	ldx	[%l7 + 0x28],	%o0
	stb	%o5,	[%l7 + 0x41]
	nop
	set	0x22, %g2
	ldsh	[%l7 + %g2],	%g7
	siam	0x3
	ld	[%l7 + 0x0C],	%f22
	flush	%l7 + 0x08
	prefetch	[%l7 + 0x0C],	 0x1
	st	%f22,	[%l7 + 0x30]
	ldsw	[%l7 + 0x54],	%i5
	ldub	[%l7 + 0x64],	%i6
	ldsw	[%l7 + 0x5C],	%g2
	ldub	[%l7 + 0x32],	%i4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g3
	ldd	[%l7 + 0x20],	%l0
	ldstub	[%l7 + 0x59],	%i7
	flush	%l7 + 0x38
	nop
	set	0x18, %l4
	prefetch	[%l7 + %l4],	 0x0
	st	%f13,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x68],	%l5
	ldd	[%l7 + 0x18],	%f2
	ldd	[%l7 + 0x50],	%f8
	ld	[%l7 + 0x68],	%f2
	stw	%l2,	[%l7 + 0x0C]
	movrlz	%g4,	%g1,	%l6
	ldsh	[%l7 + 0x7E],	%l1
	flushw
	ldsb	[%l7 + 0x2A],	%g5
	movrgz	%i3,	%o1,	%g6
	nop
	set	0x1C, %g1
	ldstub	[%l7 + %g1],	%l3
	ldd	[%l7 + 0x20],	%f8
	orcc	%o2,	0x085F,	%o4
	stw	%i2,	[%l7 + 0x5C]
	std	%f0,	[%l7 + 0x58]
	sethi	0x11A1,	%l4
	taddcctv	%o7,	0x08D3,	%i0
	ld	[%l7 + 0x6C],	%f28
	srax	%i1,	%o0,	%o5
	ldstub	[%l7 + 0x28],	%g7
	ldsw	[%l7 + 0x50],	%o3
	lduh	[%l7 + 0x38],	%i6
	swap	[%l7 + 0x44],	%i5
	fmovrsgz	%g2,	%f13,	%f0
	bn,pn	%icc,	loop_165
	ldsh	[%l7 + 0x0E],	%i4
	wr	%g0,	0xe3,	%asi
	stxa	%o6,	[%l7 + 0x70] %asi
	membar	#Sync
loop_165:
	ldsb	[%l7 + 0x74],	%g3
	stb	%i7,	[%l7 + 0x75]
	umulcc	%l5,	%l0,	%g4
	stb	%g1,	[%l7 + 0x74]
	stbar
	std	%l2,	[%l7 + 0x20]
	array32	%l1,	%l6,	%i3
	ldsw	[%l7 + 0x28],	%o1
	std	%f22,	[%l7 + 0x28]
	stw	%g5,	[%l7 + 0x08]
	std	%g6,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x6C],	%o2
	std	%f6,	[%l7 + 0x30]
	edge32l	%i2,	%o4,	%o7
	stw	%l4,	[%l7 + 0x10]
	stbar
	ldd	[%l7 + 0x08],	%f10
	prefetch	[%l7 + 0x3C],	 0x2
	stb	%i0,	[%l7 + 0x69]
	srax	%i1,	%o5,	%g7
	std	%o0,	[%l7 + 0x58]
	std	%f8,	[%l7 + 0x78]
	flush	%l7 + 0x50
	nop
	set	0x12, %l2
	sth	%i6,	[%l7 + %l2]
	subccc	%o3,	%i5,	%g2
	ldsh	[%l7 + 0x42],	%o6
	nop
	set	0x51, %o2
	ldsb	[%l7 + %o2],	%i4
	ldx	[%l7 + 0x40],	%g3
	ldd	[%l7 + 0x78],	%f22
	and	%l5,	%l0,	%g4
	ldd	[%l7 + 0x20],	%f2
	stw	%i7,	[%l7 + 0x48]
	movrlez	%g1,	%l2,	%l6
	prefetch	[%l7 + 0x60],	 0x3
	ldstub	[%l7 + 0x47],	%l1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o1
	lduh	[%l7 + 0x62],	%g5
	ldstub	[%l7 + 0x3A],	%i3
	stbar
	ldd	[%l7 + 0x70],	%f10
	swap	[%l7 + 0x68],	%g6
	xorcc	%o2,	%i2,	%l3
	sth	%o4,	[%l7 + 0x4C]
	sth	%l4,	[%l7 + 0x66]
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x18
	set	0x18, %l1
	ldxa	[%g0 + %l1] 0x58,	%o7
	pdist	%f26,	%f6,	%f22
	std	%f0,	[%l7 + 0x50]
	bn,a	%xcc,	loop_166
	stbar
	lduw	[%l7 + 0x20],	%i0
	ldx	[%l7 + 0x40],	%o5
loop_166:
	st	%f19,	[%l7 + 0x78]
	te	%icc,	0x5
	stb	%i1,	[%l7 + 0x1B]
	nop
	setx	loop_167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x54],	%o0
	lduw	[%l7 + 0x5C],	%g7
	ldub	[%l7 + 0x65],	%o3
loop_167:
	ldd	[%l7 + 0x58],	%f28
	ldx	[%l7 + 0x28],	%i5
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	wr	%g0,	0x57,	%asi
	stxa	%i6,	[%g0 + 0x0] %asi
	lduh	[%l7 + 0x18],	%o6
	udivcc	%g2,	0x1E57,	%g3
	ldx	[%l7 + 0x58],	%i4
	ldsb	[%l7 + 0x0D],	%l5
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%l0,	[%g0 + 0x0] %asi
	std	%i6,	[%l7 + 0x28]
	ldx	[%l7 + 0x78],	%g4
	ldsb	[%l7 + 0x7B],	%g1
	std	%l2,	[%l7 + 0x30]
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%l1
	set	0x48, %g6
	stxa	%l6,	[%l7 + %g6] 0x04
	ldd	[%l7 + 0x20],	%g4
	ldx	[%l7 + 0x38],	%i3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o1
	stbar
	std	%f24,	[%l7 + 0x28]
	stb	%g6,	[%l7 + 0x5F]
	for	%f0,	%f24,	%f10
	addc	%i2,	%o2,	%o4
	lduh	[%l7 + 0x4A],	%l4
	fbge	%fcc0,	loop_168
	be,a,pn	%icc,	loop_169
	ld	[%l7 + 0x3C],	%f0
	flush	%l7 + 0x1C
loop_168:
	stbar
loop_169:
	swap	[%l7 + 0x64],	%o7
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x89,	%l3
	ldx	[%l7 + 0x28],	%o5
	ldstub	[%l7 + 0x1D],	%i0
	wr	%o0,	%g7,	%clear_softint
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	wr	%g0,	0x21,	%asi
	stxa	%o3,	[%g0 + 0x108] %asi
	st	%f9,	[%l7 + 0x20]
	ldstub	[%l7 + 0x6D],	%i5
	std	%f4,	[%l7 + 0x58]
	swap	[%l7 + 0x50],	%o6
	ldsb	[%l7 + 0x64],	%g2
	sth	%i6,	[%l7 + 0x66]
	stw	%i4,	[%l7 + 0x60]
	lduw	[%l7 + 0x40],	%g3
	sdiv	%l0,	0x1522,	%i7
	std	%f10,	[%l7 + 0x28]
	ldsw	[%l7 + 0x14],	%g4
	flush	%l7 + 0x10
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x10,	%g1
	ldsw	[%l7 + 0x58],	%l2
	stw	%l5,	[%l7 + 0x70]
	sth	%l1,	[%l7 + 0x3C]
	ldub	[%l7 + 0x22],	%g5
	ldsw	[%l7 + 0x50],	%l6
	nop
	set	0x44, %g3
	lduw	[%l7 + %g3],	%o1
	st	%f30,	[%l7 + 0x70]
	prefetch	[%l7 + 0x40],	 0x2
	edge32ln	%i3,	%g6,	%i2
	tvs	%icc,	0x0
	ldd	[%l7 + 0x18],	%o4
	stbar
	ldd	[%l7 + 0x40],	%o2
	lduh	[%l7 + 0x48],	%o7
	ldd	[%l7 + 0x50],	%l4
	orcc	%l3,	0x1FC0,	%o5
	ldsw	[%l7 + 0x4C],	%i0
	ldd	[%l7 + 0x58],	%g6
	ble,a,pt	%icc,	loop_170
	ldsb	[%l7 + 0x60],	%o0
	lduw	[%l7 + 0x14],	%i1
	lduh	[%l7 + 0x46],	%i5
loop_170:
	move	%xcc,	%o3,	%g2
	and	%o6,	%i4,	%g3
	lduw	[%l7 + 0x74],	%l0
	ldstub	[%l7 + 0x21],	%i6
	ldsh	[%l7 + 0x26],	%g4
	edge16ln	%i7,	%g1,	%l5
	stx	%l1,	[%l7 + 0x38]
	ldd	[%l7 + 0x58],	%f2
	swap	[%l7 + 0x60],	%g5
	ldd	[%l7 + 0x48],	%f2
	ldstub	[%l7 + 0x24],	%l6
	st	%f27,	[%l7 + 0x60]
	ldd	[%l7 + 0x18],	%o0
	std	%f8,	[%l7 + 0x28]
	ldd	[%l7 + 0x78],	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x5C, %i5
	sth	%l2,	[%l7 + %i5]
	stbar
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g6
	swap	[%l7 + 0x3C],	%i2
	orcc	%o4,	%o7,	%l4
	ldub	[%l7 + 0x1F],	%l3
	std	%f22,	[%l7 + 0x48]
	ldub	[%l7 + 0x2E],	%o2
	std	%f22,	[%l7 + 0x48]
	ldsw	[%l7 + 0x38],	%i0
	ldd	[%l7 + 0x68],	%f12
	ldstub	[%l7 + 0x6B],	%o5
	std	%f30,	[%l7 + 0x08]
	ldd	[%l7 + 0x48],	%f0
	prefetch	[%l7 + 0x30],	 0x1
	std	%f16,	[%l7 + 0x60]
	ldsw	[%l7 + 0x40],	%o0
	stx	%g7,	[%l7 + 0x08]
	st	%f18,	[%l7 + 0x24]
	ldx	[%l7 + 0x18],	%i1
	ldstub	[%l7 + 0x72],	%o3
	ldub	[%l7 + 0x2E],	%i5
	ldx	[%l7 + 0x50],	%o6
	st	%f17,	[%l7 + 0x30]
	xorcc	%i4,	%g3,	%g2
	ldsb	[%l7 + 0x49],	%i6
	ldd	[%l7 + 0x40],	%l0
	flush	%l7 + 0x2C
	ldsw	[%l7 + 0x3C],	%g4
	ldd	[%l7 + 0x08],	%g0
	tcc	%icc,	0x5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i7
	ldd	[%l7 + 0x60],	%f20
	stx	%l5,	[%l7 + 0x60]
	mova	%xcc,	%g5,	%l1
	ldd	[%l7 + 0x28],	%o0
	ldsb	[%l7 + 0x19],	%i3
	tneg	%xcc,	0x5
	add	%l2,	%g6,	%i2
	swap	[%l7 + 0x40],	%l6
	fmovse	%xcc,	%f10,	%f29
	array16	%o4,	%o7,	%l4
	stw	%o2,	[%l7 + 0x10]
	nop
	set	0x54, %l0
	stb	%l3,	[%l7 + %l0]
	ldsh	[%l7 + 0x44],	%o5
	sth	%o0,	[%l7 + 0x70]
	ldx	[%l7 + 0x50],	%g7
	ldsh	[%l7 + 0x1E],	%i0
	ldub	[%l7 + 0x65],	%i1
	srlx	%i5,	%o3,	%o6
	ldub	[%l7 + 0x0E],	%i4
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%g2
	fmovrslez	%i6,	%f4,	%f31
	edge8l	%g3,	%g4,	%g1
	fbe	%fcc2,	loop_171
	ldx	[%l7 + 0x58],	%i7
	ldsb	[%l7 + 0x39],	%l0
	movcc	%xcc,	%l5,	%l1
loop_171:
	stb	%g5,	[%l7 + 0x73]
	stbar
	ldx	[%l7 + 0x30],	%i3
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%l2
	ldstub	[%l7 + 0x3C],	%g6
	lduw	[%l7 + 0x78],	%i2
	ld	[%l7 + 0x18],	%f2
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%o0
	ldd	[%l7 + 0x50],	%o4
	flushw
	ldd	[%l7 + 0x70],	%f26
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x80,	%o7
	st	%f16,	[%l7 + 0x3C]
	nop
	set	0x42, %i1
	stb	%l4,	[%l7 + %i1]
	ldstub	[%l7 + 0x71],	%l6
	brlz	%o2,	loop_172
	ldx	[%l7 + 0x30],	%o5
	bne	loop_173
	ldx	[%l7 + 0x58],	%o0
loop_172:
	prefetch	[%l7 + 0x28],	 0x0
	std	%g6,	[%l7 + 0x40]
loop_173:
	std	%l2,	[%l7 + 0x08]
	tgu	%xcc,	0x7
	ld	[%l7 + 0x3C],	%f22
	ldstub	[%l7 + 0x0D],	%i1
	ldsb	[%l7 + 0x19],	%i0
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1b8
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1b8] %asi,	%o3 ripped by fixASI40.pl ripped by fixASI40.pl
	fbge,a	%fcc1,	loop_174
	tleu	%xcc,	0x5
	stx	%o6,	[%l7 + 0x10]
	fmovs	%f30,	%f6
loop_174:
	nop
	set	0x48, %i2
	stxa	%i4,	[%l7 + %i2] 0xe3
	membar	#Sync
	ldsb	[%l7 + 0x4A],	%i5
	ldsw	[%l7 + 0x40],	%g2
	sllx	%i6,	%g3,	%g1
	stbar
	ldstub	[%l7 + 0x39],	%g4
	ld	[%l7 + 0x40],	%f26
	st	%f23,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%f20
	ldx	[%l7 + 0x08],	%i7
	wr	%g0,	0x23,	%asi
	stxa	%l5,	[%l7 + 0x18] %asi
	membar	#Sync
	stb	%l1,	[%l7 + 0x58]
	movcs	%xcc,	%l0,	%i3
	ldsw	[%l7 + 0x44],	%g5
	brlz,a	%g6,	loop_175
	stb	%l2,	[%l7 + 0x27]
	ldsb	[%l7 + 0x50],	%o1
	ldsw	[%l7 + 0x70],	%o4
loop_175:
	stx	%o7,	[%l7 + 0x68]
	rdhpr	%htba,	%i2
	addccc	%l6,	%l4,	%o5
	stw	%o2,	[%l7 + 0x28]
	nop
	set	0x58, %o4
	stx	%o0,	[%l7 + %o4]
	ldd	[%l7 + 0x20],	%f26
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g7
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x89,	%l3
	st	%f0,	[%l7 + 0x44]
	st	%f30,	[%l7 + 0x40]
	ldsh	[%l7 + 0x34],	%i0
	flush	%l7 + 0x68
	lduh	[%l7 + 0x48],	%o3
	stx	%i1,	[%l7 + 0x10]
	srlx	%o6,	%i5,	%i4
	move	%icc,	%i6,	%g2
	ldstub	[%l7 + 0x0B],	%g3
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%g4
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x19,	%g1
	ldub	[%l7 + 0x6D],	%l5
	ldd	[%l7 + 0x38],	%i6
	set	0x68, %g5
	ldxa	[%l7 + %g5] 0x0c,	%l1
	lduw	[%l7 + 0x28],	%l0
	sth	%i3,	[%l7 + 0x32]
	fpsub32	%f8,	%f4,	%f10
	sth	%g6,	[%l7 + 0x0C]
	stw	%g5,	[%l7 + 0x68]
	ldsw	[%l7 + 0x4C],	%l2
	set	0x48, %l6
	stxa	%o1,	[%l7 + %l6] 0xeb
	membar	#Sync
	ldub	[%l7 + 0x31],	%o7
	lduw	[%l7 + 0x30],	%o4
	ldub	[%l7 + 0x43],	%i2
	sth	%l6,	[%l7 + 0x20]
	ldd	[%l7 + 0x40],	%f18
	brz	%o5,	loop_176
	tcc	%xcc,	0x0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %o5
	stxa	%l4,	[%g0 + %o5] 0x20
loop_176:
	ldsh	[%l7 + 0x28],	%o2
	ld	[%l7 + 0x58],	%f6
	ldsw	[%l7 + 0x5C],	%g7
	ldx	[%l7 + 0x70],	%l3
	stbar
	swap	[%l7 + 0x64],	%o0
	prefetch	[%l7 + 0x78],	 0x3
	ldstub	[%l7 + 0x35],	%o3
	movneg	%icc,	%i0,	%i1
	xnorcc	%o6,	0x014F,	%i4
	stx	%i6,	[%l7 + 0x28]
	ldx	[%l7 + 0x08],	%i5
	ta	%xcc,	0x5
	prefetch	[%l7 + 0x60],	 0x1
	sth	%g2,	[%l7 + 0x0C]
	lduw	[%l7 + 0x5C],	%g3
	wr	%g0,	0x88,	%asi
	stxa	%g1,	[%l7 + 0x70] %asi
	ldsh	[%l7 + 0x42],	%l5
	fors	%f12,	%f7,	%f11
	std	%f4,	[%l7 + 0x28]
	stb	%i7,	[%l7 + 0x4D]
	movn	%xcc,	%l1,	%g4
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	set	0x0, %o0
	stxa	%l0,	[%g0 + %o0] 0x5f
	stw	%g6,	[%l7 + 0x40]
	ldsh	[%l7 + 0x0A],	%g5
	orncc	%i3,	0x09EC,	%o1
	ldstub	[%l7 + 0x2B],	%l2
	lduh	[%l7 + 0x1C],	%o7
	stx	%i2,	[%l7 + 0x78]
	stb	%l6,	[%l7 + 0x5E]
	std	%f16,	[%l7 + 0x60]
	stb	%o5,	[%l7 + 0x5F]
	st	%f4,	[%l7 + 0x7C]
	ldstub	[%l7 + 0x70],	%l4
	umulcc	%o2,	0x0EF0,	%o4
	ldsb	[%l7 + 0x54],	%l3
	lduw	[%l7 + 0x50],	%g7
	ld	[%l7 + 0x20],	%f31
	ldd	[%l7 + 0x68],	%f0
	sth	%o0,	[%l7 + 0x6C]
	prefetch	[%l7 + 0x50],	 0x2
	ldub	[%l7 + 0x30],	%o3
	nop
	set	0x69, %o1
	ldstub	[%l7 + %o1],	%i0
	st	%f15,	[%l7 + 0x44]
	stbar
	flush	%l7 + 0x0C
	std	%f8,	[%l7 + 0x40]
	ldx	[%l7 + 0x08],	%i1
	stw	%i4,	[%l7 + 0x78]
	movre	%o6,	0x02C,	%i6
	stx	%i5,	[%l7 + 0x18]
	ldx	[%l7 + 0x50],	%g3
	ldub	[%l7 + 0x66],	%g1
	nop
	set	0x1C, %i7
	stw	%g2,	[%l7 + %i7]
	ldx	[%l7 + 0x78],	%l5
	ldsh	[%l7 + 0x0E],	%i7
	st	%f9,	[%l7 + 0x5C]
	std	%g4,	[%l7 + 0x30]
	stbar
	stx	%l1,	[%l7 + 0x38]
	lduh	[%l7 + 0x6C],	%g6
	popc	%g5,	%l0
	ld	[%l7 + 0x38],	%f4
	sth	%i3,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x76],	%l2
	ld	[%l7 + 0x48],	%f24
	edge32l	%o1,	%i2,	%l6
	ldsb	[%l7 + 0x0B],	%o7
	st	%f4,	[%l7 + 0x18]
	swap	[%l7 + 0x70],	%o5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l4
	edge32l	%o2,	%l3,	%o4
	ldsh	[%l7 + 0x44],	%o0
	stx	%o3,	[%l7 + 0x10]
	wr	%i0,	0x186A,	%pic
	stx	%g7,	[%l7 + 0x38]
	ldsh	[%l7 + 0x40],	%i1
	stw	%i4,	[%l7 + 0x2C]
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%o6
	tne	%icc,	0x1
	ldx	[%l7 + 0x58],	%i5
	lduw	[%l7 + 0x2C],	%i6
	std	%f0,	[%l7 + 0x60]
	swap	[%l7 + 0x38],	%g1
	edge16ln	%g2,	%l5,	%g3
	lduw	[%l7 + 0x14],	%g4
	ldsw	[%l7 + 0x50],	%l1
	std	%f22,	[%l7 + 0x10]
	taddcctv	%i7,	%g5,	%l0
	ld	[%l7 + 0x78],	%f15
	sdivx	%i3,	0x0E41,	%l2
	lduw	[%l7 + 0x58],	%g6
	prefetch	[%l7 + 0x64],	 0x0
	stb	%i2,	[%l7 + 0x6A]
	sth	%o1,	[%l7 + 0x10]
	ldd	[%l7 + 0x58],	%f6
	umul	%o7,	%l6,	%l4
	std	%o2,	[%l7 + 0x30]
	subcc	%o5,	0x0524,	%l3
	ld	[%l7 + 0x5C],	%f1
	flush	%l7 + 0x70
	sth	%o4,	[%l7 + 0x62]
	swap	[%l7 + 0x4C],	%o3
	lduh	[%l7 + 0x18],	%o0
	sth	%g7,	[%l7 + 0x28]
	ldsb	[%l7 + 0x11],	%i1
	sra	%i4,	0x0B,	%i0
	set	0x60, %l4
	stxa	%o6,	[%l7 + %l4] 0xeb
	membar	#Sync
	ldd	[%l7 + 0x28],	%i6
	nop
	set	0x14, %l3
	prefetch	[%l7 + %l3],	 0x0
	ldsb	[%l7 + 0x7F],	%i5
	tn	%xcc,	0x7
	std	%f0,	[%l7 + 0x18]
	fmovdneg	%xcc,	%f3,	%f13
	sth	%g1,	[%l7 + 0x42]
	ldstub	[%l7 + 0x49],	%l5
	flush	%l7 + 0x60
	std	%g2,	[%l7 + 0x10]
	ldsh	[%l7 + 0x34],	%g4
	swap	[%l7 + 0x40],	%g3
	nop
	set	0x38, %l2
	ldx	[%l7 + %l2],	%i7
	ldsb	[%l7 + 0x17],	%g5
	lduw	[%l7 + 0x68],	%l1
	st	%f8,	[%l7 + 0x74]
	ld	[%l7 + 0x68],	%f23
	stw	%i3,	[%l7 + 0x28]
	movre	%l2,	0x0C2,	%l0
	lduw	[%l7 + 0x0C],	%g6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o1
	flush	%l7 + 0x44
	tl	%icc,	0x6
	ldsw	[%l7 + 0x1C],	%o7
	stx	%l6,	[%l7 + 0x70]
	fmovdcc	%icc,	%f15,	%f10
	flush	%l7 + 0x24
	stb	%i2,	[%l7 + 0x1C]
	nop
	set	0x54, %o2
	lduw	[%l7 + %o2],	%o2
	ldsb	[%l7 + 0x5E],	%l4
	nop
	set	0x1C, %l1
	ldsw	[%l7 + %l1],	%l3
	std	%f8,	[%l7 + 0x48]
	stbar
	sth	%o5,	[%l7 + 0x36]
	st	%f22,	[%l7 + 0x74]
	st	%f22,	[%l7 + 0x24]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	stxa	%o3,	[%g0 + 0x28] %asi
	sth	%o4,	[%l7 + 0x4A]
	stb	%g7,	[%l7 + 0x79]
	ldd	[%l7 + 0x48],	%f10
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x88,	%o0
	ldsh	[%l7 + 0x1A],	%i4
	ldd	[%l7 + 0x48],	%f4
	xor	%i0,	%o6,	%i6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x208
	set	0x208, %g6
	ldxa	[%g0 + %g6] 0x52,	%i5
	stb	%g1,	[%l7 + 0x11]
	swap	[%l7 + 0x40],	%i1
	ldsh	[%l7 + 0x2A],	%l5
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x15,	%g4
	std	%f24,	[%l7 + 0x08]
	bleu	loop_177
	prefetch	[%l7 + 0x28],	 0x1
	edge16n	%g2,	%g3,	%i7
	ldd	[%l7 + 0x68],	%f22
loop_177:
	ldsh	[%l7 + 0x3C],	%l1
	swap	[%l7 + 0x14],	%g5
	ldsb	[%l7 + 0x40],	%l2
	st	%f23,	[%l7 + 0x34]
	fmovrdlz	%i3,	%f4,	%f6
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x04,	%g6
	ldub	[%l7 + 0x25],	%l0
	lduw	[%l7 + 0x14],	%o7
	prefetch	[%l7 + 0x44],	 0x2
	tg	%xcc,	0x5
	sth	%l6,	[%l7 + 0x3E]
	ldsb	[%l7 + 0x63],	%i2
	ld	[%l7 + 0x60],	%f26
	lduw	[%l7 + 0x48],	%o1
	ldsb	[%l7 + 0x14],	%o2
	nop
	set	0x4D, %g3
	ldub	[%l7 + %g3],	%l4
	ldstub	[%l7 + 0x61],	%l3
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%o2
	set	0x38, %l0
	stxa	%o5,	[%l7 + %l0] 0x0c
	faligndata	%f16,	%f26,	%f4
	tcc	%icc,	0x3
	lduw	[%l7 + 0x0C],	%g7
	lduw	[%l7 + 0x70],	%o0
	stw	%o4,	[%l7 + 0x58]
	andncc	%i4,	%o6,	%i0
	ld	[%l7 + 0x34],	%f29
	swap	[%l7 + 0x44],	%i6
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%i5
	ldsw	[%l7 + 0x60],	%g1
	wr	%g0,	0x80,	%asi
	stxa	%l5,	[%l7 + 0x08] %asi
	ldd	[%l7 + 0x70],	%i0
	ldsb	[%l7 + 0x5D],	%g4
	fmul8ulx16	%f14,	%f12,	%f4
	ldx	[%l7 + 0x30],	%g3
	edge16ln	%g2,	%l1,	%i7
	stw	%l2,	[%l7 + 0x44]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i3
	stx	%g5,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%f14
	ldd	[%l7 + 0x28],	%g6
	ldsh	[%l7 + 0x3E],	%o7
	set	0x18, %g7
	stxa	%l0,	[%l7 + %g7] 0x14
	sth	%i2,	[%l7 + 0x68]
	prefetch	[%l7 + 0x08],	 0x1
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f0,	[%l7 + 0x28]
	umul	%o2,	0x060B,	%l4
	rdpr	%otherwin,	%l3
	std	%o2,	[%l7 + 0x58]
	tn	%icc,	0x4
	fnot2s	%f25,	%f12
	stbar
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%o0
	prefetch	[%l7 + 0x24],	 0x1
	stx	%o5,	[%l7 + 0x78]
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g7
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %i3
	stxa	%o0,	[%g0 + %i3] 0x21
	ldub	[%l7 + 0x7A],	%i4
	fmovrdne	%o4,	%f18,	%f26
	lduw	[%l7 + 0x2C],	%i0
	ldd	[%l7 + 0x78],	%o6
	flush	%l7 + 0x70
	nop
	set	0x12, %i1
	ldsh	[%l7 + %i1],	%i5
	ldsh	[%l7 + 0x58],	%g1
	ldd	[%l7 + 0x18],	%i6
	nop
	set	0x54, %i2
	prefetch	[%l7 + %i2],	 0x2
	flush	%l7 + 0x74
	stb	%i1,	[%l7 + 0x3A]
	std	%l4,	[%l7 + 0x30]
	prefetch	[%l7 + 0x10],	 0x2
	wr	%g0,	0x89,	%asi
	stxa	%g4,	[%l7 + 0x50] %asi
	stx	%g2,	[%l7 + 0x08]
	fcmpd	%fcc2,	%f16,	%f16
	fxors	%f4,	%f18,	%f13
	fornot1	%f4,	%f26,	%f10
	or	%l1,	0x0089,	%g3
	ld	[%l7 + 0x4C],	%f25
	lduh	[%l7 + 0x62],	%i7
	ldd	[%l7 + 0x18],	%f14
	ldsh	[%l7 + 0x0E],	%l2
	set	0x20, %i4
	stxa	%g5,	[%l7 + %i4] 0xe2
	membar	#Sync
	lduw	[%l7 + 0x7C],	%g6
	rdhpr	%hintp,	%o7
	edge8	%l0,	%i3,	%i2
	edge8n	%o2,	%l4,	%l6
	nop
	set	0x54, %o3
	lduw	[%l7 + %o3],	%o3
	fcmpgt16	%f28,	%f10,	%l3
	sth	%o1,	[%l7 + 0x3E]
	fmovda	%icc,	%f31,	%f31
	ldsh	[%l7 + 0x6A],	%g7
	nop
	set	0x48, %o6
	std	%o0,	[%l7 + %o6]
	rd	%tick_cmpr,	%o5
	nop
	set	0x18, %o4
	stw	%o4,	[%l7 + %o4]
	tneg	%icc,	0x0
	fnot2s	%f15,	%f19
	ld	[%l7 + 0x6C],	%f31
	srax	%i0,	0x0E,	%i4
	ldd	[%l7 + 0x38],	%i4
	std	%f12,	[%l7 + 0x70]
	nop
	set	0x7A, %g5
	lduh	[%l7 + %g5],	%o6
	sth	%g1,	[%l7 + 0x0C]
	ldsb	[%l7 + 0x69],	%i6
	movrne	%i1,	%g4,	%g2
	ldstub	[%l7 + 0x7B],	%l5
	ldstub	[%l7 + 0x2D],	%l1
	std	%i6,	[%l7 + 0x50]
	addcc	%l2,	%g3,	%g5
	stw	%o7,	[%l7 + 0x58]
	tcc	%xcc,	0x1
	wr	%l0,	0x0F44,	%sys_tick
	flush	%l7 + 0x2C
	lduh	[%l7 + 0x62],	%g6
	xnorcc	%i3,	0x17DF,	%o2
	stbar
	ld	[%l7 + 0x1C],	%f30
	ldsw	[%l7 + 0x5C],	%l4
	swap	[%l7 + 0x18],	%i2
	sth	%l6,	[%l7 + 0x1A]
	stb	%o3,	[%l7 + 0x7F]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9E8, 	%sys_tick_cmpr
	stw	%g7,	[%l7 + 0x68]
	lduh	[%l7 + 0x26],	%o0
	std	%f24,	[%l7 + 0x78]
	lduh	[%l7 + 0x1E],	%l3
	movvc	%icc,	%o5,	%o4
	brlez,a	%i4,	loop_178
	nop
	set	0x38, %l5
	lduw	[%l7 + %l5],	%i5
	std	%f18,	[%l7 + 0x30]
	ldd	[%l7 + 0x78],	%f30
loop_178:
	nop
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x0c,	%i0
	stw	%g1,	[%l7 + 0x64]
	ldd	[%l7 + 0x38],	%f12
	std	%f24,	[%l7 + 0x70]
	swap	[%l7 + 0x18],	%o6
	prefetch	[%l7 + 0x48],	 0x3
	alignaddrl	%i6,	%g4,	%i1
	st	%f1,	[%l7 + 0x58]
	ldsw	[%l7 + 0x4C],	%l5
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x81,	%l1
	ldsh	[%l7 + 0x58],	%g2
	stw	%l2,	[%l7 + 0x70]
	sll	%g3,	%i7,	%o7
	fnot1s	%f24,	%f17
	ldub	[%l7 + 0x49],	%l0
	st	%f27,	[%l7 + 0x50]
	flush	%l7 + 0x48
	ldsb	[%l7 + 0x4A],	%g6
	ld	[%l7 + 0x0C],	%f29
	ldsw	[%l7 + 0x2C],	%g5
	stx	%o2,	[%l7 + 0x18]
	stx	%l4,	[%l7 + 0x68]
	set	0x10, %o1
	ldxa	[%l7 + %o1] 0x04,	%i3
	movn	%icc,	%l6,	%i2
	stb	%o3,	[%l7 + 0x49]
	stw	%o1,	[%l7 + 0x08]
	nop
	set	0x1C, %o0
	ldsb	[%l7 + %o0],	%o0
	nop
	set	0x4A, %g2
	ldstub	[%l7 + %g2],	%g7
	ldd	[%l7 + 0x50],	%f8
	fabss	%f22,	%f20
	lduh	[%l7 + 0x20],	%l3
	lduh	[%l7 + 0x6C],	%o4
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x14,	%i4
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x4A, %l3
	ldsh	[%l7 + %l3],	%o5
	flush	%l7 + 0x70
	ldx	[%l7 + 0x40],	%i5
	ldsb	[%l7 + 0x35],	%i0
	ldd	[%l7 + 0x10],	%f6
	std	%f2,	[%l7 + 0x58]
	xorcc	%g1,	0x1E3C,	%o6
	lduh	[%l7 + 0x56],	%i6
	movleu	%xcc,	%g4,	%i1
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f26
	ldub	[%l7 + 0x2A],	%l1
	ld	[%l7 + 0x78],	%f4
	sth	%l5,	[%l7 + 0x70]
	flush	%l7 + 0x24
	fnor	%f14,	%f30,	%f6
	fmovdcs	%xcc,	%f9,	%f8
	fzeros	%f22
	swap	[%l7 + 0x64],	%g2
	ldub	[%l7 + 0x60],	%l2
	ldsh	[%l7 + 0x68],	%i7
	ldx	[%l7 + 0x40],	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEE5, 	%hsys_tick_cmpr
	sra	%g5,	%o2,	%g6
	ldsw	[%l7 + 0x7C],	%l4
	movne	%xcc,	%i3,	%l6
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%i2
	ldsw	[%l7 + 0x70],	%o3
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x140
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o0,	[%g0 + 0x140] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop
	setx	loop_179,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x0D],	%o1
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%g6
	swap	[%l7 + 0x14],	%o4
loop_179:
	sth	%i4,	[%l7 + 0x36]
	st	%f26,	[%l7 + 0x4C]
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x15,	%o5
	st	%f19,	[%l7 + 0x1C]
	edge8ln	%l3,	%i0,	%i5
	std	%f20,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o6
	lduh	[%l7 + 0x10],	%g1
	edge8ln	%i6,	%g4,	%i1
	stx	%l1,	[%l7 + 0x70]
	st	%f30,	[%l7 + 0x50]
	stw	%l5,	[%l7 + 0x2C]
	stw	%g2,	[%l7 + 0x50]
	stx	%i7,	[%l7 + 0x78]
	ldsh	[%l7 + 0x0C],	%g3
	lduw	[%l7 + 0x7C],	%o7
	xnorcc	%l0,	%l2,	%o2
	ldstub	[%l7 + 0x62],	%g6
	stbar
	ldsh	[%l7 + 0x4C],	%l4
	ldsw	[%l7 + 0x34],	%i3
	std	%g4,	[%l7 + 0x20]
	ldd	[%l7 + 0x38],	%f30
	stx	%i2,	[%l7 + 0x60]
	movrgez	%l6,	%o3,	%o0
	stx	%o1,	[%l7 + 0x08]
	ldsh	[%l7 + 0x38],	%o4
	sir	0x1386
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC64, 	%hsys_tick_cmpr
	subc	%o5,	%i0,	%l3
	sth	%o6,	[%l7 + 0x46]
	flush	%l7 + 0x28
	prefetch	[%l7 + 0x44],	 0x2
	rdpr	%wstate,	%i5
	ldsh	[%l7 + 0x22],	%i6
	rdhpr	%hsys_tick_cmpr,	%g1
	ldx	[%l7 + 0x30],	%g4
	tg	%icc,	0x7
	nop
	set	0x74, %g6
	lduh	[%l7 + %g6],	%l1
	fand	%f28,	%f28,	%f0
	ld	[%l7 + 0x24],	%f12
	swap	[%l7 + 0x70],	%i1
	ldx	[%l7 + 0x68],	%g2
	stw	%l5,	[%l7 + 0x2C]
	std	%f26,	[%l7 + 0x70]
	prefetch	[%l7 + 0x58],	 0x1
	stx	%i7,	[%l7 + 0x68]
	stw	%g3,	[%l7 + 0x5C]
	ld	[%l7 + 0x10],	%f1
	std	%l0,	[%l7 + 0x58]
	tg	%icc,	0x3
	swap	[%l7 + 0x20],	%l2
	set	0x58, %l1
	stxa	%o7,	[%l7 + %l1] 0x80
	swap	[%l7 + 0x64],	%o2
	stbar
	ldx	[%l7 + 0x58],	%l4
	stx	%g6,	[%l7 + 0x48]
	ldsh	[%l7 + 0x7C],	%i3
	stb	%i2,	[%l7 + 0x0F]
	wr	%g5,	0x0E11,	%softint
	stbar
	nop
	set	0x38, %g4
	prefetch	[%l7 + %g4],	 0x0
	umul	%o3,	0x0F11,	%o0
	ldd	[%l7 + 0x50],	%o0
	lduh	[%l7 + 0x2C],	%l6
	rdpr	%cleanwin,	%o4
	st	%f26,	[%l7 + 0x4C]
	stx	%g7,	[%l7 + 0x60]
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i4
	sth	%o5,	[%l7 + 0x50]
	stx	%i0,	[%l7 + 0x38]
	std	%f18,	[%l7 + 0x68]
	orcc	%o6,	0x1C1A,	%i5
	ldx	[%l7 + 0x40],	%l3
	orcc	%i6,	0x056A,	%g1
	tpos	%xcc,	0x3
	std	%f30,	[%l7 + 0x30]
	ldd	[%l7 + 0x78],	%g4
	st	%f20,	[%l7 + 0x64]
	ldd	[%l7 + 0x78],	%l0
	std	%f16,	[%l7 + 0x60]
	sth	%i1,	[%l7 + 0x64]
	brlz,a	%g2,	loop_180
	flush	%l7 + 0x58
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x30
	set	0x30, %i6
	ldxa	[%g0 + %i6] 0x58,	%i7
loop_180:
	sth	%g3,	[%l7 + 0x12]
	fcmpne16	%f18,	%f24,	%l0
	srax	%l2,	%l5,	%o2
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x30
	set	0x30, %i0
	ldxa	[%g0 + %i0] 0x58,	%l4
	lduh	[%l7 + 0x2C],	%g6
	std	%f6,	[%l7 + 0x78]
	ldd	[%l7 + 0x30],	%i2
	call	loop_181
	nop
	set	0x54, %g3
	prefetch	[%l7 + %g3],	 0x3
	fornot2	%f4,	%f16,	%f28
	prefetch	[%l7 + 0x10],	 0x2
loop_181:
	wrpr	%o7,	%i2,	%cwp
	std	%f14,	[%l7 + 0x40]
	st	%f7,	[%l7 + 0x5C]
	std	%o2,	[%l7 + 0x48]
	std	%o0,	[%l7 + 0x10]
	stb	%o1,	[%l7 + 0x42]
	st	%f20,	[%l7 + 0x10]
	swap	[%l7 + 0x4C],	%l6
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f4
	fbe,a	%fcc2,	loop_182
	ldub	[%l7 + 0x66],	%o4
	ldsh	[%l7 + 0x30],	%g5
	umul	%g7,	%o5,	%i4
loop_182:
	ldd	[%l7 + 0x68],	%f2
	edge16l	%o6,	%i5,	%i0
	nop
	set	0x49, %i5
	ldstub	[%l7 + %i5],	%l3
	stx	%g1,	[%l7 + 0x50]
	sth	%i6,	[%l7 + 0x22]
	stx	%l1,	[%l7 + 0x20]
	tsubcctv	%i1,	%g2,	%i7
	movrne	%g3,	%l0,	%l2
	fexpand	%f29,	%f12
	prefetch	[%l7 + 0x54],	 0x1
	stbar
	udivcc	%l5,	0x1456,	%g4
	sll	%l4,	%o2,	%g6
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%o6
	ldub	[%l7 + 0x69],	%i2
	nop
	set	0x78, %g7
	sth	%i3,	[%l7 + %g7]
	std	%o2,	[%l7 + 0x20]
	ldsb	[%l7 + 0x55],	%o0
	prefetch	[%l7 + 0x24],	 0x1
	std	%o0,	[%l7 + 0x58]
	stw	%o4,	[%l7 + 0x4C]
	set	0x68, %i3
	stxa	%l6,	[%l7 + %i3] 0x15
	ldd	[%l7 + 0x78],	%g4
	std	%o4,	[%l7 + 0x60]
	srax	%g7,	0x0A,	%i4
	st	%f22,	[%l7 + 0x18]
	st	%f27,	[%l7 + 0x40]
	wr	%g0,	0x80,	%asi
	stxa	%o6,	[%l7 + 0x50] %asi
	nop
	set	0x3C, %i2
	ldsh	[%l7 + %i2],	%i0
	sllx	%i5,	0x16,	%l3
	sth	%i6,	[%l7 + 0x66]
	nop
	set	0x60, %i4
	stx	%l1,	[%l7 + %i4]
	ldsw	[%l7 + 0x08],	%g1
	nop
	set	0x0A, %i1
	stb	%g2,	[%l7 + %i1]
	std	%i0,	[%l7 + 0x18]
	st	%f13,	[%l7 + 0x74]
	stw	%i7,	[%l7 + 0x2C]
	swap	[%l7 + 0x1C],	%g3
	movl	%xcc,	%l0,	%l5
	ldd	[%l7 + 0x48],	%f22
	fcmple16	%f20,	%f8,	%l2
	nop
	set	0x38, %o3
	ldsb	[%l7 + %o3],	%l4
	fbuge	%fcc0,	loop_183
	stw	%o2,	[%l7 + 0x78]
	swap	[%l7 + 0x70],	%g4
	ldsh	[%l7 + 0x58],	%o7
loop_183:
	ldd	[%l7 + 0x78],	%i2
	ldx	[%l7 + 0x10],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x55],	%i3
	ldub	[%l7 + 0x72],	%o3
	lduh	[%l7 + 0x28],	%o1
	rdhpr	%htba,	%o0
	ldsw	[%l7 + 0x2C],	%o4
	ldsb	[%l7 + 0x70],	%g5
	stb	%l6,	[%l7 + 0x41]
	sir	0x17CA
	std	%f2,	[%l7 + 0x50]
	stw	%o5,	[%l7 + 0x60]
	ldsw	[%l7 + 0x44],	%i4
	sth	%o6,	[%l7 + 0x4E]
	stbar
	stx	%g7,	[%l7 + 0x48]
	set	0x18, %o4
	stxa	%i0,	[%l7 + %o4] 0x1c
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x11,	%i5
	mova	%icc,	%i6,	%l3
	ldd	[%l7 + 0x58],	%l0
	fmul8x16al	%f12,	%f8,	%f14
	stb	%g1,	[%l7 + 0x61]
	ldd	[%l7 + 0x60],	%g2
	sth	%i7,	[%l7 + 0x32]
	rdpr	%gl,	%g3
	std	%f8,	[%l7 + 0x20]
	prefetch	[%l7 + 0x3C],	 0x3
	stx	%l0,	[%l7 + 0x50]
	ld	[%l7 + 0x68],	%f23
	lduw	[%l7 + 0x20],	%l5
	stx	%l2,	[%l7 + 0x68]
	sllx	%l4,	%o2,	%g4
	flush	%l7 + 0x2C
	lduw	[%l7 + 0x44],	%o7
	lduh	[%l7 + 0x30],	%i2
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f4
	swap	[%l7 + 0x14],	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x68
	ldd	[%l7 + 0x60],	%g6
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%i3
	stb	%o3,	[%l7 + 0x20]
	swap	[%l7 + 0x18],	%o0
	nop
	set	0x60, %l6
	ldsh	[%l7 + %l6],	%o1
	set	0x50, %o1
	stxa	%g5,	[%l7 + %o1] 0x2f
	membar	#Sync
	st	%f27,	[%l7 + 0x48]
	lduw	[%l7 + 0x08],	%o4
	set	0x28, %o0
	stxa	%l6,	[%l7 + %o0] 0x1c
	ldsb	[%l7 + 0x68],	%i4
	ld	[%l7 + 0x7C],	%f11
	lduw	[%l7 + 0x48],	%o5
	ldd	[%l7 + 0x20],	%o6
	st	%f8,	[%l7 + 0x68]
	ldx	[%l7 + 0x28],	%i0
	stbar
	stx	%i5,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%g7
	ldsh	[%l7 + 0x0A],	%l3
	ldsb	[%l7 + 0x72],	%i6
	stx	%g1,	[%l7 + 0x20]
	ldstub	[%l7 + 0x29],	%l1
	ldub	[%l7 + 0x15],	%i7
	lduh	[%l7 + 0x20],	%g3
	udiv	%g2,	0x1848,	%l0
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%l4
	std	%f20,	[%l7 + 0x78]
	stw	%l2,	[%l7 + 0x50]
	ldsh	[%l7 + 0x74],	%l4
	addc	%g4,	0x0E37,	%o7
	ldx	[%l7 + 0x78],	%o2
	fcmpne16	%f12,	%f20,	%i1
	array16	%g6,	%i2,	%o3
	lduh	[%l7 + 0x3A],	%o0
	sth	%o1,	[%l7 + 0x6E]
	ld	[%l7 + 0x38],	%f10
	st	%f19,	[%l7 + 0x4C]
	nop
	set	0x68, %o5
	prefetch	[%l7 + %o5],	 0x0
	ldub	[%l7 + 0x0B],	%i3
	stx	%o4,	[%l7 + 0x50]
	sth	%g5,	[%l7 + 0x66]
	movrlz	%i4,	%o5,	%l6
	sth	%i0,	[%l7 + 0x6A]
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x88,	%o6
	stw	%i5,	[%l7 + 0x74]
	smulcc	%l3,	%g7,	%g1
	fzeros	%f24
	wr	%g0,	0x22,	%asi
	stxa	%l1,	[%l7 + 0x18] %asi
	membar	#Sync
	ldd	[%l7 + 0x28],	%f22
	std	%i6,	[%l7 + 0x68]
	ble,a	%icc,	loop_184
	sdiv	%i7,	0x03C1,	%g2
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x80
	set	0x80, %l2
	ldxa	[%g0 + %l2] 0x58,	%g3
loop_184:
	std	%f14,	[%l7 + 0x68]
	st	%f1,	[%l7 + 0x68]
	ldsh	[%l7 + 0x42],	%l0
	wr	%g0,	0x80,	%asi
	stxa	%l2,	[%l7 + 0x48] %asi
	nop
	set	0x6E, %o2
	sth	%l5,	[%l7 + %o2]
	flushw

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x978, 	%sys_tick_cmpr
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 0x1
	andn	%o7,	%l4,	%o2
	stb	%i1,	[%l7 + 0x28]
	ldsw	[%l7 + 0x14],	%i2
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%g6
	ldx	[%l7 + 0x60],	%o3
	set	0x28, %l4
	stxa	%o1,	[%l7 + %l4] 0x11
	sth	%i3,	[%l7 + 0x3A]
	fpsub16	%f20,	%f12,	%f4
	movvs	%xcc,	%o4,	%g5
	std	%i4,	[%l7 + 0x58]
	movcs	%xcc,	%o5,	%i0
	andncc	%o6,	%l6,	%i5
	sth	%g7,	[%l7 + 0x0C]
	sth	%l3,	[%l7 + 0x40]
	lduh	[%l7 + 0x50],	%l1
	ldx	[%l7 + 0x38],	%g1
	stw	%i7,	[%l7 + 0x68]
	ldsb	[%l7 + 0x69],	%i6
	ldsh	[%l7 + 0x6C],	%g3
	wr	%g0,	0x1d,	%asi
	stxa	%l0,	[%l7 + 0x50] %asi
	lduh	[%l7 + 0x0C],	%g2
	ldd	[%l7 + 0x58],	%l2
	std	%g4,	[%l7 + 0x70]
	array32	%l5,	%l4,	%o7
	flush	%l7 + 0x68
	fbo	%fcc3,	loop_185
	ldsw	[%l7 + 0x28],	%o2
	prefetch	[%l7 + 0x44],	 0x1
	stw	%i2,	[%l7 + 0x34]
loop_185:
	ldsw	[%l7 + 0x44],	%i1
	std	%o2,	[%l7 + 0x40]
	ldsh	[%l7 + 0x7E],	%g6
	nop
	setx	loop_186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsh	[%l7 + 0x46],	%i3
	sth	%o1,	[%l7 + 0x30]
	ldsh	[%l7 + 0x0A],	%o4
loop_186:
	sth	%o0,	[%l7 + 0x78]
	tle	%xcc,	0x5
	nop
	set	0x20, %g6
	ldsb	[%l7 + %g6],	%i4
	lduw	[%l7 + 0x5C],	%o5
	std	%g4,	[%l7 + 0x50]
	ld	[%l7 + 0x5C],	%f15
	st	%f10,	[%l7 + 0x50]
	flush	%l7 + 0x1C
	siam	0x5
	ldstub	[%l7 + 0x30],	%o6
	swap	[%l7 + 0x68],	%i0
	addc	%l6,	0x00F8,	%g7
	bneg,a	loop_187
	fmul8ulx16	%f18,	%f20,	%f2
	edge16	%l3,	%l1,	%g1
loop_187:
	sth	%i5,	[%l7 + 0x18]
	st	%f13,	[%l7 + 0x34]
	ldd	[%l7 + 0x70],	%f16
	bgu,pn	%icc,	loop_188
	st	%f14,	[%l7 + 0x30]
	movle	%icc,	%i6,	%l0
	bge,a,pt	%icc,	loop_189
loop_188:
	ldd	[%l7 + 0x10],	%f28
	ldx	[%l7 + 0x40],	%g2
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%g2
loop_189:
	stw	%g4,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x1C],	%l5
	flush	%l7 + 0x14
	lduw	[%l7 + 0x4C],	%l2
	swap	[%l7 + 0x24],	%l4
	set	0x50, %g1
	stxa	%o7,	[%l7 + %g1] 0xe2
	membar	#Sync
	ldsb	[%l7 + 0x70],	%o2
	stx	%i1,	[%l7 + 0x20]
	swap	[%l7 + 0x7C],	%i2
	tpos	%xcc,	0x0
	ldsb	[%l7 + 0x1D],	%g6
	stb	%o3,	[%l7 + 0x34]
	ldd	[%l7 + 0x08],	%f6
	ldsb	[%l7 + 0x72],	%o4
	tg	%xcc,	0x1
	edge16	%o0,	%i3,	%i4
	lduh	[%l7 + 0x2E],	%g5
	stb	%o6,	[%l7 + 0x6D]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i0,	[%l7 + 0x46]
	ldd	[%l7 + 0x08],	%f12
	stw	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x68],	%o5
	ldd	[%l7 + 0x30],	%f18
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x11,	%g7
	stbar
	xnor	%l1,	%g1,	%i7
	nop
	set	0x4E, %l0
	sth	%i5,	[%l7 + %l0]
	nop
	set	0x20, %i0
	std	%f4,	[%l7 + %i0]
	stx	%l3,	[%l7 + 0x10]
	st	%f30,	[%l7 + 0x40]
	xnor	%l0,	%g2,	%i6
	ldsb	[%l7 + 0x39],	%g3
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g4
	ldx	[%l7 + 0x78],	%l5
	ldsh	[%l7 + 0x34],	%l4
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x3f8
	set	0x3f8, %o7
	nop 	! 	stxa	%o7,	[%g0 + %o7] 0x40 ripped by fixASI40.pl
	ldsh	[%l7 + 0x36],	%o2
	st	%f2,	[%l7 + 0x28]
	ldsb	[%l7 + 0x38],	%i1
	ldd	[%l7 + 0x58],	%f2
	tvs	%icc,	0x0
	ldsw	[%l7 + 0x48],	%l2
	fxor	%f4,	%f2,	%f28
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x14,	%g6
	stw	%i2,	[%l7 + 0x4C]
	rdhpr	%hsys_tick_cmpr,	%o3
	ldsw	[%l7 + 0x54],	%o1
	std	%o0,	[%l7 + 0x38]
	brgez,a	%o4,	loop_190
	ldsh	[%l7 + 0x5E],	%i3
	ldsh	[%l7 + 0x34],	%g5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xCDE, 	%hsys_tick_cmpr
loop_190:
	fbe	%fcc1,	loop_191
	stbar
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x218
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%i0
loop_191:
	ldd	[%l7 + 0x50],	%i6
	stx	%o5,	[%l7 + 0x48]
	set	0x38, %g7
	stxa	%g7,	[%l7 + %g7] 0x27
	membar	#Sync
	stbar
	prefetch	[%l7 + 0x50],	 0x3
	std	%l0,	[%l7 + 0x60]
	lduh	[%l7 + 0x1E],	%g1
	rdhpr	%hintp,	%i7
	fmovrdlz	%l3,	%f30,	%f24
	st	%f15,	[%l7 + 0x28]
	stb	%l0,	[%l7 + 0x73]
	stbar
	std	%i4,	[%l7 + 0x38]
	mulscc	%g2,	%g3,	%i6
	ldx	[%l7 + 0x20],	%l5
	swap	[%l7 + 0x08],	%l4
	ldd	[%l7 + 0x20],	%f4
	ldd	[%l7 + 0x70],	%f22
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g4
	lduh	[%l7 + 0x18],	%o2
	flush	%l7 + 0x70
	ldd	[%l7 + 0x58],	%f22
	flush	%l7 + 0x30
	nop
	set	0x40, %i2
	ldsh	[%l7 + %i2],	%l2
	prefetch	[%l7 + 0x58],	 0x2
	ldsb	[%l7 + 0x55],	%g6
	sdivcc	%i2,	0x152C,	%o3
	st	%f12,	[%l7 + 0x30]
	swap	[%l7 + 0x6C],	%i1
	ld	[%l7 + 0x44],	%f22
	stw	%o1,	[%l7 + 0x34]
	fbo,a	%fcc3,	loop_192
	sth	%o0,	[%l7 + 0x08]
	std	%f8,	[%l7 + 0x48]
	sth	%i3,	[%l7 + 0x28]
loop_192:
	and	%o4,	0x14AE,	%g5
	bleu	loop_193
	orn	%i4,	%i0,	%o6
	st	%f29,	[%l7 + 0x10]
	ldstub	[%l7 + 0x7B],	%o5
loop_193:
	edge16	%l6,	%g7,	%g1
	lduh	[%l7 + 0x54],	%i7
	fcmps	%fcc2,	%f28,	%f29
	ldsb	[%l7 + 0x3A],	%l1
	ldsw	[%l7 + 0x30],	%l0
	lduh	[%l7 + 0x56],	%i5
	std	%l2,	[%l7 + 0x70]
	ldx	[%l7 + 0x58],	%g3
	ldd	[%l7 + 0x68],	%f0
	xnorcc	%g2,	%l5,	%i6
	ldd	[%l7 + 0x48],	%l4
	lduw	[%l7 + 0x5C],	%g4
	tne	%xcc,	0x2
	stb	%o2,	[%l7 + 0x65]
	fornot1s	%f0,	%f21,	%f3
	nop
	set	0x24, %i3
	ldub	[%l7 + %i3],	%l2
	stx	%g6,	[%l7 + 0x20]
	fmovdn	%icc,	%f14,	%f5
	sth	%i2,	[%l7 + 0x7C]
	ldstub	[%l7 + 0x16],	%o3
	nop
	set	0x74, %i4
	lduw	[%l7 + %i4],	%i1
	udiv	%o1,	0x1ABB,	%o0
	ldd	[%l7 + 0x08],	%i2
	swap	[%l7 + 0x24],	%o7
	ldx	[%l7 + 0x38],	%g5
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x10,	%i4
	set	0x48, %o4
	stxa	%o4,	[%l7 + %o4] 0x11
	ld	[%l7 + 0x20],	%f27
	ldsb	[%l7 + 0x0A],	%o6
	std	%o4,	[%l7 + 0x60]
	ldub	[%l7 + 0x4F],	%i0
	flush	%l7 + 0x40
	fandnot1s	%f11,	%f30,	%f26
	ldstub	[%l7 + 0x55],	%l6
	stx	%g7,	[%l7 + 0x50]
	stbar
	ldsw	[%l7 + 0x50],	%g1
	ldx	[%l7 + 0x10],	%i7
	prefetch	[%l7 + 0x64],	 0x1
	stbar
	ldx	[%l7 + 0x40],	%l1
	ld	[%l7 + 0x28],	%f27
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x180
	set	0x180, %o3
	nop 	! 	nop 	! 	ldxa	[%g0 + %o3] 0x40,	%l0 ripped by fixASI40.pl ripped by fixASI40.pl
	ldsh	[%l7 + 0x6A],	%i5
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x14,	%l3
	st	%f19,	[%l7 + 0x50]
	wr	%g0,	0x89,	%asi
	stxa	%g2,	[%l7 + 0x60] %asi
	std	%l4,	[%l7 + 0x68]
	ldstub	[%l7 + 0x70],	%g3
	ldstub	[%l7 + 0x53],	%i6
	nop
	set	0x20, %l5
	stw	%g4,	[%l7 + %l5]
        wr    %g0,    0xe,    %pcr    ! changed.
	fcmps	%fcc0,	%f10,	%f2
	set	0x70, %l6
	stxa	%g6,	[%l7 + %l6] 0x19
	edge16	%i2,	%o3,	%l2
	ldstub	[%l7 + 0x2B],	%i1
	swap	[%l7 + 0x48],	%o1
	stw	%o0,	[%l7 + 0x78]
	ldub	[%l7 + 0x47],	%i3
	ldsb	[%l7 + 0x69],	%o7
	prefetch	[%l7 + 0x6C],	 0x0
	stw	%i4,	[%l7 + 0x54]
	ldd	[%l7 + 0x60],	%f20
	stbar
	lduw	[%l7 + 0x7C],	%o4
	fnot1	%f20,	%f2
	ldx	[%l7 + 0x70],	%o6
	tcs	%xcc,	0x2
	std	%f30,	[%l7 + 0x38]
	ldx	[%l7 + 0x20],	%g5
	ldd	[%l7 + 0x38],	%f0
	ldx	[%l7 + 0x48],	%i0
	stx	%l6,	[%l7 + 0x68]
	fbl,a	%fcc1,	loop_194
	lduw	[%l7 + 0x10],	%g7
	stw	%o5,	[%l7 + 0x3C]
	nop
	set	0x08, %o6
	ldsh	[%l7 + %o6],	%g1
loop_194:
	flush	%l7 + 0x20
	wr	%g0,	0x1c,	%asi
	stxa	%i7,	[%l7 + 0x68] %asi
	sth	%l0,	[%l7 + 0x4E]
	set	0x30, %o1
	stxa	%l1,	[%l7 + %o1] 0x04
	popc	%i5,	%g2
	st	%f8,	[%l7 + 0x70]
	stb	%l5,	[%l7 + 0x58]
	ldd	[%l7 + 0x10],	%f20
	or	%l3,	0x16FC,	%g3
	ldx	[%l7 + 0x60],	%i6
	ldsw	[%l7 + 0x2C],	%g4
	prefetch	[%l7 + 0x48],	 0x1
	ldsb	[%l7 + 0x46],	%o2
	ldd	[%l7 + 0x58],	%f22
	ldd	[%l7 + 0x50],	%l4
	rdhpr	%hsys_tick_cmpr,	%i2
	prefetch	[%l7 + 0x30],	 0x1
	stx	%g6,	[%l7 + 0x20]
	lduw	[%l7 + 0x30],	%o3
	array8	%l2,	%o1,	%i1
	alignaddr	%i3,	%o7,	%o0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB8F, 	%tick_cmpr
	edge16n	%g5,	%i0,	%l6
	ldsw	[%l7 + 0x58],	%g7
	std	%f28,	[%l7 + 0x30]
	std	%f14,	[%l7 + 0x10]
	lduh	[%l7 + 0x64],	%o6
	wr	%g0,	0x81,	%asi
	stxa	%o5,	[%l7 + 0x28] %asi
	ldx	[%l7 + 0x78],	%i7
	fnors	%f27,	%f31,	%f30
	prefetch	[%l7 + 0x28],	 0x1
	ld	[%l7 + 0x1C],	%f25
	sth	%g1,	[%l7 + 0x22]
	ld	[%l7 + 0x20],	%f28
	flush	%l7 + 0x68
	swap	[%l7 + 0x54],	%l0
	fcmpgt32	%f2,	%f12,	%l1
	andcc	%g2,	%l5,	%i5
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%g3
	ldsh	[%l7 + 0x10],	%i6
	stw	%l3,	[%l7 + 0x40]
	ldstub	[%l7 + 0x0C],	%o2
	fmovdcc	%xcc,	%f5,	%f27
	ld	[%l7 + 0x38],	%f16
	stbar
	fsrc1	%f2,	%f28
	swap	[%l7 + 0x44],	%g4
	stx	%l4,	[%l7 + 0x20]
	ldsh	[%l7 + 0x44],	%g6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i2
	ldx	[%l7 + 0x30],	%o3
	ld	[%l7 + 0x54],	%f25
	std	%l2,	[%l7 + 0x20]
	std	%i0,	[%l7 + 0x50]
	std	%f6,	[%l7 + 0x40]
	fmovscs	%xcc,	%f15,	%f8
	ldstub	[%l7 + 0x26],	%i3
	ldx	[%l7 + 0x18],	%o7
	ldsb	[%l7 + 0x6D],	%o1
	stbar
	fands	%f24,	%f23,	%f31
	wr	%g0,	0xea,	%asi
	stxa	%o4,	[%l7 + 0x18] %asi
	membar	#Sync
	lduw	[%l7 + 0x70],	%o0
	wr	%g5,	0x1ABF,	%set_softint
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x15,	%i0
	ld	[%l7 + 0x20],	%f3
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x30
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l6
	ldd	[%l7 + 0x78],	%g6
	prefetch	[%l7 + 0x1C],	 0x1
	st	%f27,	[%l7 + 0x14]
	ld	[%l7 + 0x44],	%f25
	xnor	%o6,	0x1A81,	%o5
	st	%f0,	[%l7 + 0x2C]
	ldd	[%l7 + 0x60],	%i4
	flush	%l7 + 0x64
	ldsb	[%l7 + 0x3B],	%i7
	lduh	[%l7 + 0x16],	%l0
	lduh	[%l7 + 0x16],	%g1
	ldstub	[%l7 + 0x53],	%l1
	ldub	[%l7 + 0x1B],	%g2
	lduh	[%l7 + 0x7C],	%i5
	lduh	[%l7 + 0x40],	%l5
	stx	%i6,	[%l7 + 0x10]
	stw	%l3,	[%l7 + 0x08]
	ldsh	[%l7 + 0x6E],	%o2
	ldd	[%l7 + 0x30],	%f22
	lduh	[%l7 + 0x14],	%g3
	ldd	[%l7 + 0x48],	%f16
	ldd	[%l7 + 0x68],	%l4
	flush	%l7 + 0x4C
	ldsb	[%l7 + 0x11],	%g4
	lduh	[%l7 + 0x0A],	%i2
	lduw	[%l7 + 0x60],	%o3
	flush	%l7 + 0x20
	fmul8x16au	%f11,	%f11,	%f22
	ld	[%l7 + 0x34],	%f31
	fmovrsne	%g6,	%f5,	%f17
	movge	%xcc,	%i1,	%l2
	ldx	[%l7 + 0x28],	%o7
	ldd	[%l7 + 0x78],	%i2
	set	0x10, %o5
	stxa	%o1,	[%l7 + %o5] 0x10
	st	%f31,	[%l7 + 0x40]
	wr 	%g0, 	0x4, 	%fprs
	stbar
	ldsb	[%l7 + 0x35],	%o4
	ldub	[%l7 + 0x47],	%i0
	stx	%l6,	[%l7 + 0x30]
	nop
	set	0x50, %i7
	ldsw	[%l7 + %i7],	%g7
	tne	%xcc,	0x5
	sth	%o6,	[%l7 + 0x36]
	st	%f4,	[%l7 + 0x54]
	stbar
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x1c,	%i4
	nop
	set	0x0A, %o2
	lduh	[%l7 + %o2],	%o5
	udivx	%i7,	0x1A1B,	%l0
	ldsw	[%l7 + 0x2C],	%l1
	movneg	%icc,	%g2,	%i5
	stb	%l5,	[%l7 + 0x33]
	tvc	%xcc,	0x3
	stx	%g1,	[%l7 + 0x40]
	st	%f17,	[%l7 + 0x5C]
	ldd	[%l7 + 0x78],	%l2
	swap	[%l7 + 0x2C],	%o2
	flush	%l7 + 0x38
	stw	%i6,	[%l7 + 0x40]
	swap	[%l7 + 0x54],	%l4
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x390
	set	0x390, %l3
	nop 	! 	stxa	%g3,	[%g0 + %l3] 0x40 ripped by fixASI40.pl
	fbue	%fcc1,	loop_195
	ldsb	[%l7 + 0x1C],	%g4
	flush	%l7 + 0x48
	alignaddr	%o3,	%i2,	%g6
loop_195:
	prefetch	[%l7 + 0x3C],	 0x2
	nop
	set	0x0C, %g6
	ldsb	[%l7 + %g6],	%i1
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o7
	ldx	[%l7 + 0x68],	%l2
	nop
	set	0x68, %l4
	std	%f14,	[%l7 + %l4]
	nop
	set	0x0C, %g4
	prefetch	[%l7 + %g4],	 0x1
	stx	%o1,	[%l7 + 0x38]
	ldx	[%l7 + 0x48],	%i3
	nop
	set	0x2C, %l1
	lduh	[%l7 + %l1],	%o0
	taddcctv	%g5,	%o4,	%l6
	subccc	%g7,	0x1DE9,	%i0
	tneg	%icc,	0x7
	stbar
	ldsb	[%l7 + 0x3D],	%o6
	ldx	[%l7 + 0x08],	%o5
	ldd	[%l7 + 0x70],	%i4
	flush	%l7 + 0x40
	std	%l0,	[%l7 + 0x30]
	ldub	[%l7 + 0x1B],	%l1
	stbar
	ldd	[%l7 + 0x30],	%f12
	ldd	[%l7 + 0x50],	%f8
	ldstub	[%l7 + 0x20],	%i7
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g2
	std	%f18,	[%l7 + 0x70]
	movrlez	%l5,	0x237,	%i5
	ldub	[%l7 + 0x45],	%l3
	ldsh	[%l7 + 0x0A],	%o2
	edge32	%g1,	%l4,	%g3
	lduh	[%l7 + 0x1C],	%g4
	stbar
	stbar
	ldd	[%l7 + 0x48],	%i6
	nop
	set	0x74, %g1
	ldstub	[%l7 + %g1],	%i2
	nop
	set	0x18, %i6
	stx	%o3,	[%l7 + %i6]
	movle	%xcc,	%g6,	%i1
	stw	%o7,	[%l7 + 0x54]
	fcmps	%fcc2,	%f21,	%f23
	stw	%l2,	[%l7 + 0x78]
	ldsh	[%l7 + 0x36],	%o1
	stb	%i3,	[%l7 + 0x62]
	andncc	%o0,	%o4,	%g5
	fxor	%f12,	%f2,	%f0
	lduw	[%l7 + 0x38],	%l6
	ldsh	[%l7 + 0x46],	%i0
	ldsw	[%l7 + 0x3C],	%g7
	sdivcc	%o5,	0x00B2,	%o6
	ldsw	[%l7 + 0x64],	%i4
	nop
	set	0x10, %g3
	std	%f12,	[%l7 + %g3]
	fbg,a	%fcc2,	loop_196
	prefetch	[%l7 + 0x78],	 0x2
	movneg	%icc,	%l1,	%l0
	flush	%l7 + 0x2C
loop_196:
	sth	%g2,	[%l7 + 0x6E]
	sth	%i7,	[%l7 + 0x42]
	lduh	[%l7 + 0x34],	%l5
	movrlz	%i5,	%o2,	%g1
	flush	%l7 + 0x68
	stx	%l3,	[%l7 + 0x38]
	lduw	[%l7 + 0x24],	%g3
	tvc	%icc,	0x6
	wr	%g0,	0xea,	%asi
	stxa	%l4,	[%l7 + 0x48] %asi
	membar	#Sync
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %i0
	stxa	%i6,	[%g0 + %i0] 0x21
	swap	[%l7 + 0x3C],	%i2
	ldsw	[%l7 + 0x08],	%o3
	st	%f29,	[%l7 + 0x14]
	flush	%l7 + 0x50
	stx	%g4,	[%l7 + 0x60]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA47, 	%tick_cmpr
	ldx	[%l7 + 0x48],	%i1
	ldsb	[%l7 + 0x2C],	%o1
	nop
	set	0x1C, %l0
	stb	%l2,	[%l7 + %l0]
	prefetch	[%l7 + 0x6C],	 0x0
	stbar
	mova	%xcc,	%o0,	%o4
	std	%i2,	[%l7 + 0x08]
	stbar
	stx	%l6,	[%l7 + 0x08]
	ldsw	[%l7 + 0x3C],	%i0
	movrlez	%g5,	%o5,	%o6
	ldx	[%l7 + 0x18],	%g7
	ba,a	%icc,	loop_197
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%l1
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%i4
	stx	%g2,	[%l7 + 0x58]
loop_197:
	fnot2s	%f21,	%f25
	std	%l0,	[%l7 + 0x20]
	flush	%l7 + 0x7C
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x30
	set	0x30, %i2
	ldxa	[%g0 + %i2] 0x50,	%i7
	ld	[%l7 + 0x64],	%f13
	ldd	[%l7 + 0x50],	%l4
	mulscc	%o2,	%g1,	%i5
	std	%l2,	[%l7 + 0x30]
	ldsh	[%l7 + 0x2A],	%g3
	lduw	[%l7 + 0x54],	%i6
	std	%f10,	[%l7 + 0x48]
	ldub	[%l7 + 0x32],	%o3
	st	%f8,	[%l7 + 0x24]
	swap	[%l7 + 0x38],	%g4
	st	%f29,	[%l7 + 0x24]
	ldstub	[%l7 + 0x40],	%g6
	ld	[%l7 + 0x28],	%f23
	lduh	[%l7 + 0x7C],	%o7
	wr	%g0,	0x1c,	%asi
	stxa	%l4,	[%l7 + 0x50] %asi
	array16	%o1,	%l2,	%o0
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o4
	stb	%i1,	[%l7 + 0x3A]
	andcc	%l6,	0x0889,	%i3
	stw	%g5,	[%l7 + 0x10]
	flush	%l7 + 0x40
	std	%f2,	[%l7 + 0x18]
	movg	%icc,	%o5,	%o6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i0
	ldub	[%l7 + 0x1E],	%g7
	stx	%i4,	[%l7 + 0x60]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF28, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x74],	%l0
	movl	%icc,	%i7,	%l1
	movpos	%xcc,	%l5,	%g1
	ldub	[%l7 + 0x49],	%o2
	ldsb	[%l7 + 0x78],	%l3
	set	0x58, %g7
	stxa	%i5,	[%l7 + %g7] 0x14
	movpos	%icc,	%g3,	%i6
	tpos	%icc,	0x2
	sethi	0x07ED,	%i2
	ldsw	[%l7 + 0x34],	%o3
	nop
	set	0x58, %i4
	ldub	[%l7 + %i4],	%g4
	nop
	set	0x30, %i1
	stx	%o7,	[%l7 + %i1]
	ldub	[%l7 + 0x78],	%l4
	nop
	set	0x44, %o4
	ldsw	[%l7 + %o4],	%o1
	ldstub	[%l7 + 0x67],	%l2
	lduw	[%l7 + 0x7C],	%o0
	prefetch	[%l7 + 0x6C],	 0x0
	nop
	set	0x68, %i3
	lduw	[%l7 + %i3],	%o4
	xnor	%g6,	0x16E9,	%l6
	ld	[%l7 + 0x54],	%f27
	stw	%i3,	[%l7 + 0x08]
	wr	%g5,	0x00EA,	%sys_tick
	ldstub	[%l7 + 0x60],	%o5
	nop
	set	0x32, %o3
	stb	%i1,	[%l7 + %o3]
	addc	%o6,	0x1AF9,	%i0
	prefetch	[%l7 + 0x14],	 0x1
	std	%f14,	[%l7 + 0x18]
	sth	%g7,	[%l7 + 0x1A]
	prefetch	[%l7 + 0x7C],	 0x2
	ta	%icc,	0x1
	sth	%i4,	[%l7 + 0x1E]
	orcc	%g2,	%l0,	%i7
	brz	%l5,	loop_198
	lduh	[%l7 + 0x6E],	%g1
	ldsb	[%l7 + 0x1F],	%l1
	ldsb	[%l7 + 0x14],	%o2
loop_198:
	ldx	[%l7 + 0x08],	%i5
	subcc	%g3,	0x09C2,	%i6
	ldsh	[%l7 + 0x50],	%l3
	ldsw	[%l7 + 0x40],	%o3
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%i2
	ldsh	[%l7 + 0x46],	%g4
	std	%f8,	[%l7 + 0x58]
	edge8l	%o7,	%o1,	%l2
	wr	%g0,	0x11,	%asi
	stxa	%o0,	[%l7 + 0x78] %asi
	taddcc	%o4,	%l4,	%l6
	stb	%g6,	[%l7 + 0x2A]
	ldx	[%l7 + 0x38],	%i3
	ldub	[%l7 + 0x65],	%g5
	stbar
	std	%o4,	[%l7 + 0x68]
	edge8l	%i1,	%i0,	%g7
	stx	%i4,	[%l7 + 0x58]
	stb	%g2,	[%l7 + 0x5C]
	ldd	[%l7 + 0x48],	%f6
	flush	%l7 + 0x0C
	lduw	[%l7 + 0x3C],	%o6
	ldd	[%l7 + 0x78],	%i6
	stw	%l0,	[%l7 + 0x1C]
	ldd	[%l7 + 0x38],	%l4
	ldsw	[%l7 + 0x38],	%l1
	ldd	[%l7 + 0x60],	%o2
	ldx	[%l7 + 0x20],	%i5
	swap	[%l7 + 0x10],	%g3
	ldub	[%l7 + 0x1A],	%g1
	std	%f18,	[%l7 + 0x78]
	ld	[%l7 + 0x0C],	%f0
	stx	%l3,	[%l7 + 0x10]
	fmovrsgez	%o3,	%f2,	%f13
	wrpr	%i2,	0x11F9,	%tick
	ldstub	[%l7 + 0x57],	%g4
	std	%o6,	[%l7 + 0x68]
	nop
	set	0x40, %g5
	prefetch	[%l7 + %g5],	 0x1
	ld	[%l7 + 0x30],	%f27
	ldd	[%l7 + 0x10],	%i6
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%l2
	stbar
	ldx	[%l7 + 0x60],	%o1
	lduw	[%l7 + 0x78],	%o4
	fnot2	%f20,	%f0
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x89,	%l4
	ldd	[%l7 + 0x68],	%f28
	ldd	[%l7 + 0x48],	%o0
	stbar
	ldd	[%l7 + 0x48],	%g6
	swap	[%l7 + 0x1C],	%i3
	wr	%g0,	0x10,	%asi
	stxa	%g5,	[%l7 + 0x10] %asi
	nop
	set	0x40, %o6
	ldstub	[%l7 + %o6],	%o5
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i1
	stb	%l6,	[%l7 + 0x5C]
	std	%i0,	[%l7 + 0x40]
	orn	%i4,	0x146D,	%g2
	ldsh	[%l7 + 0x6E],	%g7
	movne	%xcc,	%i7,	%o6
	ldub	[%l7 + 0x3C],	%l5
	prefetch	[%l7 + 0x40],	 0x3
	andcc	%l1,	0x0F17,	%l0
	ld	[%l7 + 0x54],	%f15
	stbar
	prefetch	[%l7 + 0x18],	 0x3
	ldx	[%l7 + 0x20],	%i5
	ldub	[%l7 + 0x2E],	%g3
	membar	0x59
	lduw	[%l7 + 0x34],	%g1
	tg	%icc,	0x5
	stw	%o2,	[%l7 + 0x48]
	brgz	%o3,	loop_199
	flush	%l7 + 0x14
	ldub	[%l7 + 0x27],	%i2
	stw	%g4,	[%l7 + 0x68]
loop_199:
	ldd	[%l7 + 0x60],	%o6
	prefetch	[%l7 + 0x0C],	 0x1
	tleu	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l3
	fbn,a	%fcc0,	loop_200
	stb	%l2,	[%l7 + 0x09]
	nop
	set	0x67, %g2
	ldstub	[%l7 + %g2],	%i6
	ld	[%l7 + 0x4C],	%f31
loop_200:
	lduw	[%l7 + 0x38],	%o1
	fmuld8sux16	%f11,	%f3,	%f26
	ldub	[%l7 + 0x62],	%o4
	stw	%o0,	[%l7 + 0x6C]
	sllx	%g6,	0x0B,	%i3
	ldd	[%l7 + 0x48],	%g4
	sth	%l4,	[%l7 + 0x6A]
	swap	[%l7 + 0x5C],	%i1
	st	%f5,	[%l7 + 0x1C]
	ldub	[%l7 + 0x38],	%l6
	ldsw	[%l7 + 0x10],	%o5
	lduh	[%l7 + 0x18],	%i0
	flush	%l7 + 0x1C
	lduh	[%l7 + 0x2C],	%g2
	st	%f29,	[%l7 + 0x50]
	swap	[%l7 + 0x64],	%i4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i7
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f30
	movpos	%xcc,	%g7,	%o6
	rd	%asi,	%l5
	stb	%l1,	[%l7 + 0x38]
	fzeros	%f29
	st	%f27,	[%l7 + 0x5C]
	std	%f26,	[%l7 + 0x38]
	ldub	[%l7 + 0x19],	%l0
	flush	%l7 + 0x1C
	ldsh	[%l7 + 0x2E],	%i5
	ld	[%l7 + 0x60],	%f4
	ldub	[%l7 + 0x3B],	%g1
	lduw	[%l7 + 0x14],	%g3
	lduh	[%l7 + 0x1E],	%o2
	stbar
	wr	%o3,	0x00E7,	%clear_softint
	rd	%asi,	%g4
	nop
	setx	loop_201,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
	nop
	set	0x14, %i7
	lduh	[%l7 + %i7],	%i2
	wr	%g0,	0x22,	%asi
	stxa	%l3,	[%l7 + 0x18] %asi
	membar	#Sync
loop_201:
	ldd	[%l7 + 0x40],	%l2
	flush	%l7 + 0x08
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%i6,	[%g0 + 0x0] %asi
	ldub	[%l7 + 0x14],	%o7
	lduw	[%l7 + 0x24],	%o4
	prefetch	[%l7 + 0x78],	 0x3
	mulscc	%o0,	0x1132,	%o1
	ldx	[%l7 + 0x20],	%g6
	ldsw	[%l7 + 0x4C],	%g5
	nop
	set	0x28, %o5
	std	%i2,	[%l7 + %o5]
	stw	%i1,	[%l7 + 0x4C]
	array8	%l6,	%l4,	%o5
	std	%f0,	[%l7 + 0x18]
	stw	%i0,	[%l7 + 0x60]
	st	%f13,	[%l7 + 0x0C]
	ldd	[%l7 + 0x68],	%f22
	stw	%i4,	[%l7 + 0x28]
	lduw	[%l7 + 0x38],	%i7
	stw	%g7,	[%l7 + 0x78]
	ld	[%l7 + 0x74],	%f11
	ldd	[%l7 + 0x58],	%g2
	ld	[%l7 + 0x1C],	%f21
	brnz,a	%o6,	loop_202
	flush	%l7 + 0x7C
	fxnor	%f28,	%f22,	%f16
	ldsh	[%l7 + 0x2C],	%l0
loop_202:
	ld	[%l7 + 0x5C],	%f7
	rdpr	%wstate,	%i5
	ldstub	[%l7 + 0x16],	%g1
	lduw	[%l7 + 0x54],	%l1
	ldsb	[%l7 + 0x6D],	%o2
	set	0x38, %l2
	stxa	%o3,	[%l7 + %l2] 0xeb
	membar	#Sync
	stx	%g4,	[%l7 + 0x70]
	stb	%g3,	[%l7 + 0x75]
	ldx	[%l7 + 0x78],	%i2
	std	%f16,	[%l7 + 0x50]
	ldsw	[%l7 + 0x50],	%l2
	lduw	[%l7 + 0x24],	%i6
	ldub	[%l7 + 0x38],	%o7
	sth	%o4,	[%l7 + 0x1A]
	stx	%o0,	[%l7 + 0x28]
	ld	[%l7 + 0x60],	%f2
	ldub	[%l7 + 0x60],	%l3
	wr	%g0,	0x18,	%asi
	stxa	%g6,	[%l7 + 0x28] %asi
	nop
	set	0x58, %l3
	stx	%o1,	[%l7 + %l3]
	prefetch	[%l7 + 0x20],	 0x2
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	wr	%g0,	0x57,	%asi
	stxa	%i3,	[%g0 + 0x0] %asi
	ldx	[%l7 + 0x10],	%i1
	flush	%l7 + 0x58
	ldd	[%l7 + 0x68],	%f0
	fmovde	%icc,	%f31,	%f17
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%i6
	ldd	[%l7 + 0x68],	%f2
	tn	%icc,	0x2
	set	0x38, %l4
	stxa	%g5,	[%l7 + %l4] 0xe3
	membar	#Sync
	std	%o4,	[%l7 + 0x48]
	ldsw	[%l7 + 0x34],	%l4
	st	%f12,	[%l7 + 0x50]
	flush	%l7 + 0x34
	st	%f12,	[%l7 + 0x18]
	tsubcc	%i0,	0x1658,	%i4
	ldsh	[%l7 + 0x52],	%i7
	sth	%g2,	[%l7 + 0x54]
	ld	[%l7 + 0x6C],	%f8
	ldsh	[%l7 + 0x56],	%g7
	nop
	set	0x34, %o2
	sth	%o6,	[%l7 + %o2]
	swap	[%l7 + 0x6C],	%l0
	ldsb	[%l7 + 0x3C],	%i5
	sth	%l5,	[%l7 + 0x16]
	ldsb	[%l7 + 0x1C],	%l1
	swap	[%l7 + 0x68],	%g1
	flush	%l7 + 0x18
	swap	[%l7 + 0x48],	%o3
	fxnors	%f14,	%f17,	%f20
	stw	%g4,	[%l7 + 0x5C]
	prefetch	[%l7 + 0x68],	 0x3
	wr	%g0,	0xeb,	%asi
	stxa	%o2,	[%l7 + 0x38] %asi
	membar	#Sync
	std	%f4,	[%l7 + 0x68]
	tsubcctv	%i2,	0x0681,	%g3
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i6
	lduh	[%l7 + 0x10],	%o7
	sth	%l2,	[%l7 + 0x32]
	for	%f10,	%f28,	%f0
	set	0x48, %l1
	stxa	%o0,	[%l7 + %l1] 0x2f
	membar	#Sync
	ldx	[%l7 + 0x70],	%o4
	ldsh	[%l7 + 0x22],	%g6
	std	%l2,	[%l7 + 0x20]
	fxnor	%f4,	%f10,	%f16
	std	%i2,	[%l7 + 0x68]
	ldd	[%l7 + 0x58],	%o0
	nop
	set	0x78, %g1
	stx	%i1,	[%l7 + %g1]
	fnegd	%f6,	%f20
	nop
	set	0x10, %g4
	std	%f28,	[%l7 + %g4]
	std	%f2,	[%l7 + 0x68]
	ldsh	[%l7 + 0x14],	%g5
        wr    %g0,    0xe,    %pcr    ! changed.
	stbar
	ldstub	[%l7 + 0x7C],	%o5
	ld	[%l7 + 0x44],	%f28
	orn	%i0,	0x013D,	%l4
	movleu	%icc,	%i4,	%g2
	ldstub	[%l7 + 0x19],	%g7
	std	%o6,	[%l7 + 0x48]
	fsrc2	%f12,	%f8
	orn	%l0,	%i7,	%l5
	stb	%l1,	[%l7 + 0x55]
	sth	%i5,	[%l7 + 0x7C]
	ldstub	[%l7 + 0x58],	%g1
	te	%xcc,	0x6
	sth	%g4,	[%l7 + 0x7C]
	std	%f20,	[%l7 + 0x48]
	ldsb	[%l7 + 0x47],	%o2
	ldsw	[%l7 + 0x14],	%o3
	sth	%g3,	[%l7 + 0x5A]
	ldsb	[%l7 + 0x49],	%i6
	lduh	[%l7 + 0x40],	%i2
	stw	%l2,	[%l7 + 0x08]
	stb	%o0,	[%l7 + 0x52]
	ldsw	[%l7 + 0x68],	%o4
	ldsw	[%l7 + 0x54],	%g6
	stw	%l3,	[%l7 + 0x20]
	ldd	[%l7 + 0x10],	%i2
	ldsb	[%l7 + 0x6D],	%o7
	ldsh	[%l7 + 0x58],	%o1
	lduw	[%l7 + 0x3C],	%g5
	ldd	[%l7 + 0x20],	%f24
	array16	%i1,	%o5,	%i0
	wr	%g0,	0x22,	%asi
	stxa	%l4,	[%l7 + 0x68] %asi
	membar	#Sync
	ldsb	[%l7 + 0x46],	%i4
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g2
	ldd	[%l7 + 0x08],	%i6
	std	%o6,	[%l7 + 0x30]
	xnor	%l0,	%g7,	%l5
	swap	[%l7 + 0x7C],	%i7
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x1f8
	set	0x1f8, %i6
	nop 	! 	nop 	! 	ldxa	[%g0 + %i6] 0x40,	%l1 ripped by fixASI40.pl ripped by fixASI40.pl
	sth	%g1,	[%l7 + 0x34]
	lduh	[%l7 + 0x24],	%i5
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x88,	%g4
	ldx	[%l7 + 0x10],	%o3
	fble,a	%fcc3,	loop_203
	ldsh	[%l7 + 0x7C],	%g3
	nop
	set	0x38, %i0
	std	%f0,	[%l7 + %i0]
	sth	%o2,	[%l7 + 0x62]
loop_203:
	ld	[%l7 + 0x4C],	%f4
	ldsh	[%l7 + 0x3E],	%i6
	ldx	[%l7 + 0x20],	%l2
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 0x1
	stx	%i2,	[%l7 + 0x50]
	edge16l	%o4,	%o0,	%g6
	stbar
	flush	%l7 + 0x5C
	lduh	[%l7 + 0x30],	%i3
	st	%f2,	[%l7 + 0x48]
	edge16l	%l3,	%o7,	%o1
	ld	[%l7 + 0x74],	%f29
	stbar
	ldd	[%l7 + 0x50],	%f14
	std	%i0,	[%l7 + 0x68]
	ldd	[%l7 + 0x20],	%o4
	sth	%g5,	[%l7 + 0x1C]
	flush	%l7 + 0x64
	stb	%i0,	[%l7 + 0x2C]
	fcmpgt16	%f10,	%f26,	%l4
	fpadd16	%f28,	%f6,	%f18
	fpmerge	%f18,	%f3,	%f0
	sth	%g2,	[%l7 + 0x68]
	smul	%l6,	%i4,	%o6
	flush	%l7 + 0x50
	flush	%l7 + 0x3C
	rd	%tick_cmpr,	%l0
	ldsh	[%l7 + 0x52],	%g7
	bne	%icc,	loop_204
	sir	0x0002
	lduw	[%l7 + 0x48],	%l5
	swap	[%l7 + 0x4C],	%i7
loop_204:
	fbg	%fcc2,	loop_205
	stw	%l1,	[%l7 + 0x20]
	st	%f18,	[%l7 + 0x54]
	stbar
loop_205:
	xor	%i5,	%g1,	%g4
	movn	%icc,	%g3,	%o3
	ldd	[%l7 + 0x50],	%f20
	wr	%o2,	%i6,	%clear_softint
	sth	%i2,	[%l7 + 0x1E]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l2
	nop
	set	0x49, %o7
	ldub	[%l7 + %o7],	%o0
	stx	%g6,	[%l7 + 0x18]
	ld	[%l7 + 0x44],	%f26
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x80,	%i3
	ldub	[%l7 + 0x35],	%o4
	sth	%l3,	[%l7 + 0x18]
	stbar
	stx	%o7,	[%l7 + 0x38]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0CB, 	%hsys_tick_cmpr
	stbar
	sth	%o5,	[%l7 + 0x24]
	st	%f25,	[%l7 + 0x7C]
	lduw	[%l7 + 0x20],	%g5
	lduw	[%l7 + 0x18],	%o1
	stx	%l4,	[%l7 + 0x50]
	ldx	[%l7 + 0x60],	%i0
	ld	[%l7 + 0x7C],	%f24
	ldsb	[%l7 + 0x79],	%l6
	stbar
	ldx	[%l7 + 0x58],	%g2
	stbar
	swap	[%l7 + 0x44],	%o6
	ldd	[%l7 + 0x10],	%f12
	lduh	[%l7 + 0x72],	%i4
	stb	%g7,	[%l7 + 0x4F]
	fbul	%fcc3,	loop_206
	flush	%l7 + 0x3C
	ldsb	[%l7 + 0x34],	%l5
	edge16ln	%i7,	%l1,	%i5
loop_206:
	ld	[%l7 + 0x70],	%f15
	bvs,pn	%icc,	loop_207
	ldub	[%l7 + 0x52],	%l0
	ldsw	[%l7 + 0x08],	%g1
	addcc	%g4,	%g3,	%o3
loop_207:
	ldd	[%l7 + 0x30],	%o2
	st	%f16,	[%l7 + 0x1C]
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%i6
	swap	[%l7 + 0x40],	%l2
	std	%f12,	[%l7 + 0x10]
	edge16ln	%i2,	%g6,	%o0
	std	%i2,	[%l7 + 0x08]
	ldd	[%l7 + 0x28],	%o4
	rdhpr	%hpstate,	%o7
	ldx	[%l7 + 0x38],	%l3
	stw	%i1,	[%l7 + 0x54]
	stbar
	ldd	[%l7 + 0x58],	%g4
	stw	%o5,	[%l7 + 0x3C]
	lduw	[%l7 + 0x48],	%o1
	stw	%l4,	[%l7 + 0x0C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%i0,	[%g0 + 0x8] %asi
	rd	%ccr,	%g2
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o6
	ldd	[%l7 + 0x78],	%i4
	fblg,a	%fcc3,	loop_208
	ldsb	[%l7 + 0x0D],	%l6
	std	%f2,	[%l7 + 0x70]
	ldd	[%l7 + 0x70],	%l4
loop_208:
	prefetch	[%l7 + 0x60],	 0x1
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x310
	set	0x310, %i5
	nop 	! 	nop 	! 	ldxa	[%g0 + %i5] 0x40,	%g7 ripped by fixASI40.pl ripped by fixASI40.pl
	stb	%l1,	[%l7 + 0x7C]
	umulcc	%i7,	%l0,	%i5
	stb	%g1,	[%l7 + 0x59]
	st	%f9,	[%l7 + 0x20]
	std	%f6,	[%l7 + 0x40]
	fbne,a	%fcc0,	loop_209
	ldsh	[%l7 + 0x70],	%g4
	std	%f12,	[%l7 + 0x78]
	stb	%o3,	[%l7 + 0x63]
loop_209:
	edge16l	%g3,	%i6,	%o2
	ldd	[%l7 + 0x70],	%i2
	nop
	set	0x68, %i1
	prefetch	[%l7 + %i1],	 0x2
	st	%f19,	[%l7 + 0x18]
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%l2
	ldsw	[%l7 + 0x0C],	%g6
	edge8l	%i3,	%o0,	%o4
	st	%f3,	[%l7 + 0x74]
	ld	[%l7 + 0x30],	%f22
	swap	[%l7 + 0x54],	%l3
	lduh	[%l7 + 0x0C],	%o7
	std	%g4,	[%l7 + 0x50]
	stbar
	ldsh	[%l7 + 0x66],	%i1
	lduh	[%l7 + 0x62],	%o5
	std	%f26,	[%l7 + 0x38]
	set	0x50, %i4
	ldxa	[%l7 + %i4] 0x88,	%o1
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x11,	%i0
	set	0x58, %l5
	stxa	%g2,	[%l7 + %l5] 0x2f
	membar	#Sync
	ldstub	[%l7 + 0x20],	%o6
	ldsb	[%l7 + 0x0C],	%i4
	ldd	[%l7 + 0x30],	%i6
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x00
	set	0x00, %g5
	ldxa	[%g0 + %g5] 0x50,	%l4
	taddcc	%l5,	%g7,	%l1
	ldsw	[%l7 + 0x48],	%i7
	swap	[%l7 + 0x6C],	%i5
	st	%f22,	[%l7 + 0x14]
	swap	[%l7 + 0x70],	%l0
	ldsb	[%l7 + 0x3A],	%g4
	ld	[%l7 + 0x5C],	%f13
	nop
	set	0x2E, %l6
	ldsb	[%l7 + %l6],	%g1
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o3
	ldd	[%l7 + 0x50],	%i6
	nop
	set	0x0C, %o1
	lduh	[%l7 + %o1],	%o2
	std	%f28,	[%l7 + 0x10]
	sth	%i2,	[%l7 + 0x2A]
	ldsh	[%l7 + 0x72],	%l2
	ld	[%l7 + 0x08],	%f27
	nop
	set	0x10, %o6
	ldstub	[%l7 + %o6],	%g6
	prefetch	[%l7 + 0x78],	 0x1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %g2
	ldxa	[%g0 + %g2] 0x20,	%g3
	stw	%o0,	[%l7 + 0x7C]
	lduh	[%l7 + 0x22],	%i3
	ldsb	[%l7 + 0x3C],	%o4
	fmovda	%xcc,	%f7,	%f21
	prefetch	[%l7 + 0x34],	 0x1
	sth	%o7,	[%l7 + 0x30]
	stb	%l3,	[%l7 + 0x70]
	lduw	[%l7 + 0x2C],	%g5
	movne	%icc,	%o5,	%o1
	fmovse	%icc,	%f28,	%f8
	tne	%xcc,	0x4
	prefetch	[%l7 + 0x20],	 0x2
	prefetch	[%l7 + 0x6C],	 0x2
	ld	[%l7 + 0x6C],	%f21
	ldsb	[%l7 + 0x66],	%i1
	std	%i0,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x5f 
!And yo - immediate is 0x0
	wr	%g0,	0x5f,	%asi
	stxa	%o6,	[%g0 + 0x0] %asi
	nop
	set	0x7C, %o0
	stw	%g2,	[%l7 + %o0]
	flush	%l7 + 0x2C
	nop
	set	0x10, %i7
	lduh	[%l7 + %i7],	%l6
	prefetch	[%l7 + 0x10],	 0x3
	ldsb	[%l7 + 0x5D],	%l4
	movl	%xcc,	%i4,	%l5
	swap	[%l7 + 0x10],	%g7
	stbar
	lduw	[%l7 + 0x54],	%i7
	std	%l0,	[%l7 + 0x30]
	prefetch	[%l7 + 0x08],	 0x1
	flush	%l7 + 0x10
	stb	%i5,	[%l7 + 0x4B]
	ldsh	[%l7 + 0x16],	%g4
	tge	%icc,	0x6
	st	%f26,	[%l7 + 0x34]
	fmovscs	%icc,	%f26,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x40, %o5
	ldsw	[%l7 + %o5],	%l0
	ldd	[%l7 + 0x18],	%f20
	edge8n	%o3,	%g1,	%i6
	nop
	set	0x34, %o3
	stw	%i2,	[%l7 + %o3]
	sth	%o2,	[%l7 + 0x48]
	ldd	[%l7 + 0x60],	%l2
	ldsw	[%l7 + 0x34],	%g6
	wrpr	%g3,	%i3,	%tick
	stx	%o0,	[%l7 + 0x30]
	std	%f4,	[%l7 + 0x58]
	ldsw	[%l7 + 0x1C],	%o7
	tl	%icc,	0x7
	ldstub	[%l7 + 0x58],	%l3
	nop
	set	0x5E, %l2
	ldub	[%l7 + %l2],	%o4
	ldd	[%l7 + 0x68],	%g4
	ldsh	[%l7 + 0x3A],	%o5
	wr	%g0,	0x89,	%asi
	stxa	%i1,	[%l7 + 0x08] %asi
	ldd	[%l7 + 0x40],	%f0
	prefetch	[%l7 + 0x34],	 0x3
	stx	%o1,	[%l7 + 0x70]
	stw	%i0,	[%l7 + 0x64]
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x19,	%o6
	ldub	[%l7 + 0x4B],	%g2
	nop
	set	0x68, %l3
	stx	%l6,	[%l7 + %l3]
	lduw	[%l7 + 0x68],	%l4
	nop
	set	0x38, %o2
	stw	%l5,	[%l7 + %o2]
	stx	%i4,	[%l7 + 0x20]
	ld	[%l7 + 0x40],	%f13
	ldd	[%l7 + 0x30],	%f6
	ldsb	[%l7 + 0x18],	%i7
	fbu,a	%fcc3,	loop_210
	stw	%l1,	[%l7 + 0x78]
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	set	0x0, %l4
	stxa	%i5,	[%g0 + %l4] 0x57
loop_210:
	ldstub	[%l7 + 0x56],	%g7
	stbar
	ldsh	[%l7 + 0x42],	%l0
	flush	%l7 + 0x60
	fpsub32	%f30,	%f30,	%f20
	ldd	[%l7 + 0x30],	%f14
	movrlz	%o3,	%g1,	%i6
	stbar
	ldx	[%l7 + 0x38],	%i2
	lduw	[%l7 + 0x7C],	%g4
	ldd	[%l7 + 0x50],	%o2
	sth	%l2,	[%l7 + 0x12]
	st	%f31,	[%l7 + 0x50]
	ldstub	[%l7 + 0x63],	%g6
	swap	[%l7 + 0x3C],	%i3
	ldsh	[%l7 + 0x54],	%o0
	stbar
	lduh	[%l7 + 0x5C],	%g3
	sdivx	%l3,	0x1C93,	%o4
	xnorcc	%o7,	0x1519,	%g5
	fsrc2s	%f23,	%f23
	sth	%o5,	[%l7 + 0x4C]
	prefetch	[%l7 + 0x28],	 0x3
	swap	[%l7 + 0x18],	%i1
	tvc	%xcc,	0x7
	lduw	[%l7 + 0x28],	%o1
	std	%o6,	[%l7 + 0x28]
	wr	%g0,	0x89,	%asi
	stxa	%g2,	[%l7 + 0x58] %asi
	stbar
	rdhpr	%hintp,	%i0
	brgz	%l6,	loop_211
	subccc	%l4,	0x01D1,	%i4
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%i7
	flush	%l7 + 0x64
loop_211:
	nop
	set	0x08, %g4
	std	%l0,	[%l7 + %g4]
	srlx	%l5,	%g7,	%l0
	flush	%l7 + 0x40
	fmovrsgez	%i5,	%f13,	%f27
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f10
	rdpr	%tba,	%g1
	ldx	[%l7 + 0x18],	%i6
	wrpr	%i2,	0x1AF1,	%pil
	sth	%g4,	[%l7 + 0x7A]
	tleu	%icc,	0x1
	sth	%o2,	[%l7 + 0x3E]
	stbar
	lduw	[%l7 + 0x2C],	%o3
	st	%f4,	[%l7 + 0x28]
	udivcc	%l2,	0x194F,	%g6
	stb	%i3,	[%l7 + 0x5B]
	std	%o0,	[%l7 + 0x70]
	rd	%ccr,	%g3
	lduw	[%l7 + 0x18],	%l3
	alignaddr	%o7,	%o4,	%o5
	st	%f22,	[%l7 + 0x34]
	ldd	[%l7 + 0x58],	%i0
	movleu	%icc,	%o1,	%o6
	ldub	[%l7 + 0x08],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	nop
	set	0x08, %g3
	ldx	[%l7 + %g3],	%l4
	umul	%l6,	%i7,	%l1
	fxor	%f28,	%f22,	%f28
	fexpand	%f19,	%f0
	ldstub	[%l7 + 0x6C],	%i4
	stb	%g7,	[%l7 + 0x15]
	stw	%l0,	[%l7 + 0x54]
	ldsh	[%l7 + 0x08],	%i5
	ldstub	[%l7 + 0x51],	%l5
	ldsh	[%l7 + 0x24],	%i6
	ldsh	[%l7 + 0x08],	%g1
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x108
	set	0x108, %i0
	ldxa	[%g0 + %i0] 0x52,	%i2
	prefetch	[%l7 + 0x28],	 0x1
	tgu	%xcc,	0x5
	lduh	[%l7 + 0x28],	%o2
	sdivcc	%g4,	0x0EA2,	%l2
	and	%g6,	0x1BAF,	%i3
	edge16ln	%o0,	%g3,	%o3
	ld	[%l7 + 0x48],	%f16
	stw	%o7,	[%l7 + 0x0C]
	ldd	[%l7 + 0x78],	%f16
	ldx	[%l7 + 0x20],	%l3
	ldd	[%l7 + 0x08],	%o4
	stx	%o4,	[%l7 + 0x58]
	stb	%o1,	[%l7 + 0x73]
	ldsb	[%l7 + 0x36],	%i1
	te	%icc,	0x4
	ld	[%l7 + 0x14],	%f17
	or	%o6,	%g5,	%i0
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x04,	%g2
	tcc	%icc,	0x6
	ldx	[%l7 + 0x48],	%l6
	alignaddr	%i7,	%l1,	%i4
	stb	%g7,	[%l7 + 0x6E]
	ldub	[%l7 + 0x63],	%l4
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 0x0
	ldsh	[%l7 + 0x10],	%i5
	st	%f25,	[%l7 + 0x7C]
	movre	%l5,	%i6,	%g1
	ldub	[%l7 + 0x63],	%l0
	prefetch	[%l7 + 0x30],	 0x0
	stx	%i2,	[%l7 + 0x38]
	nop
	set	0x52, %i2
	sth	%g4,	[%l7 + %i2]
	sllx	%l2,	%o2,	%g6
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x11,	%i3
	nop
	set	0x70, %i5
	stx	%g3,	[%l7 + %i5]
	ld	[%l7 + 0x14],	%f24
	flush	%l7 + 0x70
	orcc	%o3,	0x09A1,	%o0
	flush	%l7 + 0x20
	stbar
	stbar
	lduh	[%l7 + 0x72],	%l3
	stw	%o5,	[%l7 + 0x4C]
	ld	[%l7 + 0x64],	%f20
	lduw	[%l7 + 0x68],	%o4
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%o0
	prefetch	[%l7 + 0x6C],	 0x1
	st	%f31,	[%l7 + 0x48]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o4
	stxa	%o7,	[%g0 + %o4] 0x4f
	nop
	setx	loop_212,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x7A],	%i1
	stb	%o6,	[%l7 + 0x7A]
	ld	[%l7 + 0x70],	%f10
loop_212:
	nop
	wr	%g0,	0x10,	%asi
	stxa	%g5,	[%l7 + 0x68] %asi
	set	0x10, %g7
	stxa	%g2,	[%l7 + %g7] 0x88
	ldstub	[%l7 + 0x21],	%i0
	ldd	[%l7 + 0x10],	%i6
	sth	%l1,	[%l7 + 0x66]
	sir	0x0075
	st	%f25,	[%l7 + 0x40]
!Yo - got one - imm_asi 0x50 
!And yo - immediate is 0x18
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i7
	std	%i4,	[%l7 + 0x08]
	ldx	[%l7 + 0x50],	%l4
	ldstub	[%l7 + 0x3C],	%g7
	umulcc	%l5,	%i6,	%g1
	lduh	[%l7 + 0x78],	%i5
	stbar
	lduh	[%l7 + 0x24],	%l0
	fmovde	%icc,	%f12,	%f28
	lduw	[%l7 + 0x20],	%i2
	ldstub	[%l7 + 0x30],	%g4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %i4
	stxa	%l2,	[%g0 + %i4] 0x4f
	ld	[%l7 + 0x64],	%f21
	ldsb	[%l7 + 0x64],	%g6
	ba	loop_213
	std	%f12,	[%l7 + 0x68]
	flush	%l7 + 0x34
	wr	%g0,	0x1d,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i3
loop_213:
	lduh	[%l7 + 0x7C],	%o2
	ldsw	[%l7 + 0x2C],	%g3
	stbar
	stb	%o0,	[%l7 + 0x62]
	fpadd32	%f16,	%f12,	%f28
	ld	[%l7 + 0x68],	%f11
	wr	%g0,	0x1c,	%asi
	stxa	%l3,	[%l7 + 0x30] %asi
	ldsw	[%l7 + 0x6C],	%o3
	lduw	[%l7 + 0x28],	%o4
	edge16ln	%o5,	%o7,	%o1
	addc	%i1,	0x0944,	%g5
	ldd	[%l7 + 0x30],	%o6
	ldd	[%l7 + 0x20],	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	wr	%g0,	0x2f,	%asi
	stxa	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	stw	%i7,	[%l7 + 0x64]
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i0
	stbar
	sth	%i4,	[%l7 + 0x0C]
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x81,	%g7
	ldx	[%l7 + 0x28],	%l4
	stw	%l5,	[%l7 + 0x58]
	mulscc	%g1,	%i5,	%i6
	fmovsn	%icc,	%f24,	%f9
	stbar
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i2
	lduh	[%l7 + 0x2A],	%g4
	flush	%l7 + 0x60
	edge16n	%l0,	%l2,	%g6
	ldstub	[%l7 + 0x56],	%i3
	nop
	set	0x14, %i3
	lduw	[%l7 + %i3],	%g3
	ldsb	[%l7 + 0x71],	%o0
	ldsh	[%l7 + 0x5E],	%o2
	stbar
	tneg	%xcc,	0x6
	stbar
	std	%f22,	[%l7 + 0x10]
	stw	%l3,	[%l7 + 0x30]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%o5,	[%l7 + 0x6E]
	lduw	[%l7 + 0x08],	%o3
	ld	[%l7 + 0x4C],	%f4
	prefetch	[%l7 + 0x40],	 0x1
	std	%f12,	[%l7 + 0x08]
	movrlz	%o1,	%o7,	%g5
	ldd	[%l7 + 0x68],	%i0
	stw	%o6,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x70],	%g2
	nop
	set	0x3B, %g5
	ldub	[%l7 + %g5],	%l6
	ldd	[%l7 + 0x08],	%i6
	tvs	%icc,	0x6
	nop
	set	0x7C, %l6
	sth	%i0,	[%l7 + %l6]
	flush	%l7 + 0x44
	lduh	[%l7 + 0x18],	%l1
	ld	[%l7 + 0x08],	%f17
	st	%f29,	[%l7 + 0x14]
	prefetch	[%l7 + 0x10],	 0x3
	stw	%g7,	[%l7 + 0x44]
	stx	%l4,	[%l7 + 0x40]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x2C
	nop
	set	0x1A, %o1
	ldsh	[%l7 + %o1],	%l5
	brz,a	%i4,	loop_214
	sth	%i5,	[%l7 + 0x70]
	fmul8sux16	%f6,	%f8,	%f2
	std	%f14,	[%l7 + 0x20]
loop_214:
	lduw	[%l7 + 0x24],	%g1
	set	0x68, %g2
	stxa	%i6,	[%l7 + %g2] 0x2a
	membar	#Sync
	lduh	[%l7 + 0x7C],	%g4
	lduw	[%l7 + 0x0C],	%i2
	wr	%g0,	0x80,	%asi
	stxa	%l0,	[%l7 + 0x18] %asi
	std	%g6,	[%l7 + 0x40]
	std	%l2,	[%l7 + 0x10]
	ldstub	[%l7 + 0x0F],	%g3
	sth	%i3,	[%l7 + 0x0A]
	ldsb	[%l7 + 0x18],	%o2
	ldx	[%l7 + 0x28],	%o0
	prefetch	[%l7 + 0x1C],	 0x2
	flush	%l7 + 0x7C
	stw	%o4,	[%l7 + 0x30]
	fmovdle	%icc,	%f2,	%f31
	tpos	%icc,	0x3
	movrne	%l3,	%o5,	%o3
	stbar
	ld	[%l7 + 0x60],	%f15
	movpos	%icc,	%o7,	%g5
	prefetch	[%l7 + 0x44],	 0x1
	edge32l	%o1,	%o6,	%i1
	ldsb	[%l7 + 0x73],	%g2
	std	%f8,	[%l7 + 0x50]
	tvs	%xcc,	0x2
	membar	0x59
	ldsw	[%l7 + 0x70],	%l6
	ldx	[%l7 + 0x28],	%i0
	sth	%i7,	[%l7 + 0x5E]
	swap	[%l7 + 0x5C],	%g7
	srax	%l4,	0x1C,	%l1
	ldsb	[%l7 + 0x33],	%l5
	stw	%i5,	[%l7 + 0x14]
	swap	[%l7 + 0x5C],	%i4
	set	0x60, %o0
	stxa	%i6,	[%l7 + %o0] 0x18
	nop
	set	0x60, %i7
	std	%g0,	[%l7 + %i7]
	ldsw	[%l7 + 0x44],	%g4
	prefetch	[%l7 + 0x74],	 0x0
	ldd	[%l7 + 0x68],	%l0
	ldsh	[%l7 + 0x42],	%i2
	ldub	[%l7 + 0x5D],	%g6
	lduh	[%l7 + 0x5C],	%g3
	ldub	[%l7 + 0x55],	%i3
	ldsw	[%l7 + 0x0C],	%l2
	ldstub	[%l7 + 0x60],	%o2
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	wr	%g0,	0x52,	%asi
	stxa	%o0,	[%g0 + 0x118] %asi
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x19,	%o4
	stx	%o5,	[%l7 + 0x60]
	wrpr	%l3,	0x14C6,	%cwp
	ld	[%l7 + 0x6C],	%f25
	brlez	%o3,	loop_215
	orn	%o7,	%o1,	%g5
	ldx	[%l7 + 0x78],	%o6
	array8	%g2,	%l6,	%i0
loop_215:
	ldub	[%l7 + 0x53],	%i7
	ldstub	[%l7 + 0x7C],	%i1
	lduw	[%l7 + 0x64],	%g7
	ldd	[%l7 + 0x70],	%f4
	lduw	[%l7 + 0x24],	%l4
	stbar
	stx	%l1,	[%l7 + 0x50]
	ldub	[%l7 + 0x2C],	%i5
	fnors	%f25,	%f1,	%f8
	stbar
	ldd	[%l7 + 0x28],	%f22
	ld	[%l7 + 0x28],	%f8
	ld	[%l7 + 0x60],	%f2
	ldstub	[%l7 + 0x5F],	%l5
	ldsw	[%l7 + 0x08],	%i4
	lduw	[%l7 + 0x68],	%i6
	fbn	%fcc3,	loop_216
	xorcc	%g1,	0x07EA,	%g4
	ldub	[%l7 + 0x13],	%l0
	std	%g6,	[%l7 + 0x08]
loop_216:
	fcmple16	%f6,	%f26,	%g3
	flush	%l7 + 0x48
	prefetch	[%l7 + 0x14],	 0x3
	st	%f1,	[%l7 + 0x48]
	ld	[%l7 + 0x3C],	%f7
	fnor	%f16,	%f2,	%f26
	stbar
	nop
	set	0x64, %o3
	ldsb	[%l7 + %o3],	%i3
	lduh	[%l7 + 0x5C],	%i2
	sdivcc	%o2,	0x008B,	%l2
	ldub	[%l7 + 0x28],	%o0
	flush	%l7 + 0x68
	sth	%o4,	[%l7 + 0x56]
	stb	%o5,	[%l7 + 0x3B]
	flush	%l7 + 0x48
	ldstub	[%l7 + 0x08],	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %o5
	ldxa	[%g0 + %o5] 0x20,	%o7
	ldsh	[%l7 + 0x24],	%l3
	nop
	set	0x56, %l2
	ldsh	[%l7 + %l2],	%g5
	ldsh	[%l7 + 0x22],	%o1
	swap	[%l7 + 0x18],	%o6
	umul	%g2,	0x1F0A,	%l6
	sethi	0x0204,	%i0
	prefetch	[%l7 + 0x64],	 0x2
	ldsw	[%l7 + 0x48],	%i7
	std	%i0,	[%l7 + 0x50]
	nop
	set	0x47, %g6
	ldstub	[%l7 + %g6],	%l4
	fmovrslz	%g7,	%f23,	%f21
	ldd	[%l7 + 0x68],	%l0
	sth	%l5,	[%l7 + 0x14]
	stbar
	ldd	[%l7 + 0x78],	%f26
	ldstub	[%l7 + 0x42],	%i5
	ldx	[%l7 + 0x50],	%i4
	lduw	[%l7 + 0x78],	%g1
	flush	%l7 + 0x40
	sth	%i6,	[%l7 + 0x66]
	fmovdle	%xcc,	%f17,	%f0
	bgu,pt	%xcc,	loop_217
	nop
	set	0x48, %o2
	stx	%l0,	[%l7 + %o2]
	ldstub	[%l7 + 0x57],	%g6
	ldub	[%l7 + 0x23],	%g4
loop_217:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%i3,	[%l7 + 0x68] %asi
	ldd	[%l7 + 0x18],	%f26
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l4
	stxa	%i2,	[%g0 + %l4] 0x4f
	set	0x30, %l1
	stxa	%g3,	[%l7 + %l1] 0x14
	flush	%l7 + 0x78
	ldsb	[%l7 + 0x42],	%o2
	ldsb	[%l7 + 0x24],	%l2
	orcc	%o0,	%o5,	%o4
	stx	%o3,	[%l7 + 0x18]
	std	%l2,	[%l7 + 0x40]
	st	%f13,	[%l7 + 0x40]
	ldsh	[%l7 + 0x60],	%g5
	nop
	set	0x56, %l3
	ldsh	[%l7 + %l3],	%o7
	lduh	[%l7 + 0x34],	%o1
	ldstub	[%l7 + 0x14],	%o6
	fnegs	%f7,	%f15
	st	%f5,	[%l7 + 0x58]
	stw	%l6,	[%l7 + 0x58]
	swap	[%l7 + 0x30],	%g2
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%i7
	ldx	[%l7 + 0x30],	%i1
	and	%i0,	0x0494,	%l4
	set	0x68, %g4
	ldxa	[%l7 + %g4] 0x1c,	%l1
	ldd	[%l7 + 0x68],	%g6
	ldx	[%l7 + 0x38],	%l5
	ldd	[%l7 + 0x18],	%i4
	stbar
	ldx	[%l7 + 0x38],	%g1
	ldstub	[%l7 + 0x2E],	%i6
	ldsw	[%l7 + 0x4C],	%i4
	swap	[%l7 + 0x30],	%g6
	swap	[%l7 + 0x40],	%l0
	stb	%g4,	[%l7 + 0x4E]
	nop
	set	0x4A, %g3
	lduh	[%l7 + %g3],	%i2
	st	%f4,	[%l7 + 0x5C]
	fmovda	%icc,	%f12,	%f6
	ldd	[%l7 + 0x68],	%f18
	popc	%g3,	%i3
	ldd	[%l7 + 0x10],	%f2
	flush	%l7 + 0x18
	nop
	set	0x4B, %i0
	ldstub	[%l7 + %i0],	%o2
	ldub	[%l7 + 0x43],	%o0
	popc	0x1183,	%o5
	xorcc	%o4,	%o3,	%l2
	wr	%g0,	0xe2,	%asi
	stxa	%g5,	[%l7 + 0x10] %asi
	membar	#Sync
	ldub	[%l7 + 0x43],	%o7
	tleu	%icc,	0x7
	fcmpeq16	%f2,	%f30,	%o1
	lduw	[%l7 + 0x78],	%l3
	edge16n	%o6,	%l6,	%g2
	ble,pt	%icc,	loop_218
	ldd	[%l7 + 0x50],	%f0
	flush	%l7 + 0x3C
	lduh	[%l7 + 0x44],	%i1
loop_218:
	nop
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x04,	%i7
	rd	%pc,	%i0
	prefetch	[%l7 + 0x70],	 0x2
	stbar
	stx	%l1,	[%l7 + 0x70]
	stx	%l4,	[%l7 + 0x58]
	nop
	set	0x18, %i2
	prefetch	[%l7 + %i2],	 0x0
	ld	[%l7 + 0x10],	%f8
!Yo - got one - imm_asi 0x57 
!And yo - immediate is 0x0
	set	0x0, %o7
	stxa	%l5,	[%g0 + %o7] 0x57
	flush	%l7 + 0x7C
	ldd	[%l7 + 0x48],	%g6
	lduw	[%l7 + 0x3C],	%i5
	ldub	[%l7 + 0x6B],	%i6
	nop
	set	0x7A, %l0
	lduh	[%l7 + %l0],	%g1
	ldsb	[%l7 + 0x46],	%g6
	ldd	[%l7 + 0x10],	%f0
	wr	%g0,	0x22,	%asi
	stxa	%i4,	[%l7 + 0x38] %asi
	membar	#Sync
	fmovs	%f6,	%f25
	stw	%l0,	[%l7 + 0x08]
	st	%f1,	[%l7 + 0x18]
	lduh	[%l7 + 0x74],	%g4
	nop
	set	0x18, %i5
	std	%f10,	[%l7 + %i5]
	fnor	%f16,	%f26,	%f2
	lduh	[%l7 + 0x2C],	%i2
	pdist	%f0,	%f10,	%f26
	movg	%icc,	%i3,	%g3
	ld	[%l7 + 0x78],	%f7
!Yo - got one - imm_asi 0x58 
!And yo - immediate is 0x30
	set	0x30, %o4
	ldxa	[%g0 + %o4] 0x58,	%o0
	stb	%o5,	[%l7 + 0x19]
	ldub	[%l7 + 0x62],	%o2
	std	%o2,	[%l7 + 0x68]
	stbar
	ldsh	[%l7 + 0x50],	%o4
	ldsh	[%l7 + 0x20],	%g5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o7
	movre	%l2,	%o1,	%o6
	set	0x10, %g7
	stxa	%l6,	[%l7 + %g7] 0x2b
	membar	#Sync
	flush	%l7 + 0x68
	stx	%l3,	[%l7 + 0x60]
	bvc,pt	%xcc,	loop_219
	flushw
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i1
loop_219:
	ldub	[%l7 + 0x4A],	%g2
	ld	[%l7 + 0x5C],	%f6
	udiv	%i7,	0x1885,	%l1
	ldd	[%l7 + 0x68],	%l4
	swap	[%l7 + 0x38],	%i0
	stw	%g7,	[%l7 + 0x74]
	ldx	[%l7 + 0x48],	%i5
	swap	[%l7 + 0x44],	%i6
	set	0x68, %i1
	ldxa	[%l7 + %i1] 0x10,	%l5
	ldub	[%l7 + 0x68],	%g6
	fmovrse	%i4,	%f26,	%f4
	lduh	[%l7 + 0x74],	%g1
	stb	%l0,	[%l7 + 0x0C]
	std	%f22,	[%l7 + 0x40]
	ldd	[%l7 + 0x78],	%g4
	prefetch	[%l7 + 0x48],	 0x1
	std	%i2,	[%l7 + 0x68]
	wr	%g3,	%i2,	%y
	ldsb	[%l7 + 0x0F],	%o0
	st	%f5,	[%l7 + 0x4C]
	ld	[%l7 + 0x68],	%f25
	ldd	[%l7 + 0x08],	%f20
	stb	%o5,	[%l7 + 0x1A]
	stb	%o2,	[%l7 + 0x71]
	ldsb	[%l7 + 0x2D],	%o4
	lduh	[%l7 + 0x6E],	%o3
	ldd	[%l7 + 0x50],	%f0
	swap	[%l7 + 0x50],	%o7
	ldub	[%l7 + 0x7D],	%g5
	ldsb	[%l7 + 0x19],	%o1
	st	%f18,	[%l7 + 0x18]
	lduw	[%l7 + 0x78],	%o6
	nop
	set	0x5E, %l5
	ldstub	[%l7 + %l5],	%l2
	flush	%l7 + 0x24
	ldx	[%l7 + 0x28],	%l3
	rd	%sys_tick_cmpr,	%l6
	prefetch	[%l7 + 0x54],	 0x0
	ldd	[%l7 + 0x70],	%g2
	lduh	[%l7 + 0x18],	%i7
	st	%f19,	[%l7 + 0x70]
	movpos	%xcc,	%i1,	%l4
	ldd	[%l7 + 0x08],	%f14
	prefetch	[%l7 + 0x3C],	 0x1
	std	%f8,	[%l7 + 0x30]
	array8	%l1,	%i0,	%i5
	fmovrslz	%i6,	%f29,	%f12
	ldstub	[%l7 + 0x2E],	%g7
	ldd	[%l7 + 0x48],	%f22
	stx	%g6,	[%l7 + 0x20]
	ld	[%l7 + 0x34],	%f3
	ldx	[%l7 + 0x50],	%i4
	std	%f20,	[%l7 + 0x30]
	wr	%g0,	0x89,	%asi
	stxa	%g1,	[%l7 + 0x18] %asi
	nop
	set	0x18, %i4
	std	%l4,	[%l7 + %i4]
	fsrc2s	%f4,	%f7
	stb	%l0,	[%l7 + 0x6C]
	lduh	[%l7 + 0x78],	%g4
	set	0x60, %g5
	stxa	%i3,	[%l7 + %g5] 0x88
	sth	%g3,	[%l7 + 0x1E]
	ld	[%l7 + 0x14],	%f28
	swap	[%l7 + 0x6C],	%o0
	ldsb	[%l7 + 0x39],	%i2
	std	%o4,	[%l7 + 0x60]
	nop
	set	0x68, %i3
	prefetch	[%l7 + %i3],	 0x3
	orcc	%o2,	%o4,	%o3
	std	%f26,	[%l7 + 0x20]
	stx	%g5,	[%l7 + 0x58]
	stw	%o1,	[%l7 + 0x3C]
	ldd	[%l7 + 0x10],	%f12
	ldd	[%l7 + 0x58],	%f4
	lduh	[%l7 + 0x24],	%o7
	swap	[%l7 + 0x54],	%l2
	stx	%o6,	[%l7 + 0x60]
	ld	[%l7 + 0x6C],	%f13
	ldstub	[%l7 + 0x57],	%l3
	wrpr	%g2,	%i7,	%tick
	flush	%l7 + 0x50
	stbar
	lduh	[%l7 + 0x7A],	%i1
	stb	%l4,	[%l7 + 0x7C]
	stw	%l1,	[%l7 + 0x34]
	std	%f4,	[%l7 + 0x08]
	lduh	[%l7 + 0x58],	%i0
	swap	[%l7 + 0x38],	%l6
	ldd	[%l7 + 0x38],	%f12
	stw	%i5,	[%l7 + 0x08]
	ld	[%l7 + 0x44],	%f10
	stx	%g7,	[%l7 + 0x70]
	stb	%g6,	[%l7 + 0x11]
	sth	%i6,	[%l7 + 0x36]
	swap	[%l7 + 0x50],	%i4
	prefetch	[%l7 + 0x50],	 0x1
	stw	%l5,	[%l7 + 0x50]
	alignaddrl	%g1,	%g4,	%i3
	stbar
	taddcctv	%l0,	%g3,	%o0
	wr	%g0,	0x1c,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i2
	ldsh	[%l7 + 0x38],	%o2
	wrpr	%o4,	0x1A11,	%cwp
	brlez,a	%o5,	loop_220
	std	%f20,	[%l7 + 0x28]
	movn	%icc,	%g5,	%o3
	ldsb	[%l7 + 0x2F],	%o1
loop_220:
	flush	%l7 + 0x4C
	ldstub	[%l7 + 0x55],	%o7
	fmovrsgez	%o6,	%f30,	%f23
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %l6
	ldxa	[%g0 + %l6] 0x4f,	%l3
	stx	%l2,	[%l7 + 0x30]
	ldub	[%l7 + 0x10],	%g2
	ldstub	[%l7 + 0x14],	%i7
	ldub	[%l7 + 0x41],	%i1
	ldx	[%l7 + 0x10],	%l1
	movre	%i0,	%l4,	%i5
	sth	%g7,	[%l7 + 0x68]
	set	0x20, %g2
	stxa	%g6,	[%l7 + %g2] 0x81
	swap	[%l7 + 0x34],	%l6
	ldd	[%l7 + 0x70],	%i4
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x310
	set	0x310, %o0
	nop 	! 	stxa	%l5,	[%g0 + %o0] 0x40 ripped by fixASI40.pl
	stx	%g1,	[%l7 + 0x60]
	std	%i6,	[%l7 + 0x30]
	prefetch	[%l7 + 0x54],	 0x0
	prefetch	[%l7 + 0x14],	 0x1
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x80,	%i3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g4
	stw	%g3,	[%l7 + 0x6C]
	stx	%o0,	[%l7 + 0x28]
	flush	%l7 + 0x28
	st	%f9,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%i2,	[%g0 + 0x10] %asi
	stb	%o2,	[%l7 + 0x11]
	tsubcc	%o4,	0x17AA,	%o5
	std	%g4,	[%l7 + 0x60]
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f12
	flush	%l7 + 0x78
	stx	%o3,	[%l7 + 0x30]
	ldub	[%l7 + 0x7B],	%o1
	ld	[%l7 + 0x64],	%f22
	wr	%g0,	0x22,	%asi
	stxa	%o7,	[%l7 + 0x50] %asi
	membar	#Sync
	ldsh	[%l7 + 0x4C],	%o6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l3
	ldd	[%l7 + 0x70],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x836, 	%sys_tick_cmpr
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x14,	%i7
	stx	%l0,	[%l7 + 0x60]
	ldsh	[%l7 + 0x7C],	%l1
	stb	%i0,	[%l7 + 0x6E]
	ldsw	[%l7 + 0x10],	%l4
	ldstub	[%l7 + 0x67],	%i5
	ldsb	[%l7 + 0x25],	%i1
	ldub	[%l7 + 0x46],	%g6
	stb	%g7,	[%l7 + 0x67]
	stx	%l6,	[%l7 + 0x30]
	ldsw	[%l7 + 0x70],	%i4
	stw	%l5,	[%l7 + 0x10]
	stw	%i6,	[%l7 + 0x28]
	lduw	[%l7 + 0x3C],	%g1
	ldd	[%l7 + 0x08],	%f22
	st	%f30,	[%l7 + 0x30]
	flush	%l7 + 0x2C
	stb	%g4,	[%l7 + 0x33]
!Yo - got one - imm_asi 0x40 
!And yo - immediate is 0x118
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i3,	[%g0 + 0x118] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	ld	[%l7 + 0x4C],	%f6
	fnegd	%f4,	%f12
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 7413
!	Type a   	: 252
!	Type cti   	: 220
!	Type x   	: 610
!	Type f   	: 372
!	Type i   	: 1133
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xE4423832
.word 0xE2230181
.word 0xC594CFBF
.word 0x86150F21
.word 0x83901BEA
.word 0xF19AA504
.word 0xE0CCB161
.word 0x200402B0
.word 0xFED4F93A
.word 0x880F5BA9
.word 0x8E839D6F
.word 0xD2B1A56B
.word 0x37C4596F
.word 0xD33D40BA
.word 0xA615F457
.word 0x0F43FD27
.word 0xDDC509FD
.word 0xFBAD2361
.word 0xCB6EFCA5
.word 0x33DF3ED6
.word 0x93CDEB23
.word 0x95B183A8
.word 0x17BEE63E
.word 0x2D7F2C7A
.word 0xE450C562
.word 0xA38FBA21
.word 0x720ECDBF
.word 0xFE52B6E9
.word 0xFB42D9B9
.word 0x596CE9FC
.word 0xB31EADE8
.word 0x834C397B
.word 0x2190DF18
.word 0x6D966215
.word 0x9D8EE1DF
.word 0x0408CCA1
.word 0x678A4492
.word 0x868A2756
.word 0xF56950CF
.word 0xF47C932F
.word 0x6E74288C
.word 0x4D0976A6
.word 0x30096033
.word 0xC7F8240C
.word 0xB25CEC0E
.word 0x39AAFE73
.word 0x4287805C
.word 0xC50615BF
.word 0x6D2C9CE6
.word 0x7DE4BBF0
.word 0x8F6A8CF6
.word 0xBABDC002
.word 0x4001BCE4
.word 0x6D4E212D
.word 0x497AA4BA
.word 0x1D2D425D
.word 0x51B0DD2D
.word 0xC0F436FC
.word 0x5680B554
.word 0x090A3893
.word 0xCE20E5A9
.word 0x90189724
.word 0xB6724620
.word 0xA9E9F087
.end
