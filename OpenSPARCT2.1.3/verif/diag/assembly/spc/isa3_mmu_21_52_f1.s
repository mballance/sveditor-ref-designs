/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_mmu_21_52_f1.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../spc_basic_isa3.pl FOCUS_SEED=522849724"
.ident "BY gg137162 ON Fri Sep  5 11:16:33 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_mmu_21_52_f1.s,v 1.3 2007/07/05 22:01:49 drp Exp $"
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
	set	0xF,	%g1
	set	0x1,	%g2
	set	0x7,	%g3
	set	0x9,	%g4
	set	0x1,	%g5
	set	0x1,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x1,	%i1
	set	-0x7,	%i2
	set	-0xB,	%i3
	set	-0x0,	%i4
	set	-0x6,	%i5
	set	-0x2,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x670DFAC6,	%l0
	set	0x1746B0EA,	%l1
	set	0x2A1AB5D5,	%l2
	set	0x6EDCF354,	%l3
	set	0x6231B78E,	%l4
	set	0x1657554E,	%l5
	set	0x0A93F2A7,	%l6
	!# Output registers
	set	-0x07E5,	%o0
	set	-0x0577,	%o1
	set	0x1CFB,	%o2
	set	-0x1A11,	%o3
	set	0x15CE,	%o4
	set	0x0004,	%o5
	set	0x0043,	%o6
	set	-0x0EF8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEA4B0686A50A605F)
	INIT_TH_FP_REG(%l7,%f2,0xD6A394D1061BA60C)
	INIT_TH_FP_REG(%l7,%f4,0xD4E73BC4314E2763)
	INIT_TH_FP_REG(%l7,%f6,0xBDD4A30A3E4A5F55)
	INIT_TH_FP_REG(%l7,%f8,0x206DD31C2447EA43)
	INIT_TH_FP_REG(%l7,%f10,0xC42DEE697D9912BA)
	INIT_TH_FP_REG(%l7,%f12,0x029CF7D09CEEFF39)
	INIT_TH_FP_REG(%l7,%f14,0x7532685B70720407)
	INIT_TH_FP_REG(%l7,%f16,0xF394DC42A8FBF3AF)
	INIT_TH_FP_REG(%l7,%f18,0xB362463A58005C92)
	INIT_TH_FP_REG(%l7,%f20,0x242D866E5AA0B93C)
	INIT_TH_FP_REG(%l7,%f22,0xE1386E46DDE54A6A)
	INIT_TH_FP_REG(%l7,%f24,0x813DD04613273A40)
	INIT_TH_FP_REG(%l7,%f26,0x8E01A1CB19051F45)
	INIT_TH_FP_REG(%l7,%f28,0xFA6844E23A07EA7B)
	INIT_TH_FP_REG(%l7,%f30,0xFA83FCF89EACE6D4)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	stw	%o0,	[%l7 + 0x5C]
	nop
	set	0x58, %g5
	std	%f6,	[%l7 + %g5]
	bpos,pn	%xcc,	loop_1
	ld	[%l7 + 0x44],	%f21
	ldd	[%l7 + 0x28],	%f16
	fones	%f15
loop_1:
	bgu,pt	%xcc,	loop_2
	stx	%g4,	[%l7 + 0x08]
	edge8n	%i3,	%l2,	%o3
	prefetch	[%l7 + 0x0C],	 0x0
loop_2:
	std	%f18,	[%l7 + 0x60]
	ldsw	[%l7 + 0x08],	%g5
	stbar
	ldx	[%l7 + 0x08],	%g6
	rd	%sys_tick_cmpr,	%i4
	std	%f18,	[%l7 + 0x30]
	fxnor	%f4,	%f26,	%f20
	ldub	[%l7 + 0x0B],	%g2
	ldsb	[%l7 + 0x68],	%i2
	ba,a	%xcc,	loop_3
	std	%l2,	[%l7 + 0x78]
	stw	%o4,	[%l7 + 0x38]
	swap	[%l7 + 0x08],	%i5
loop_3:
	fbuge	%fcc2,	loop_4
	smul	%i1,	0x0E03,	%g7
	ldx	[%l7 + 0x70],	%l6
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %g3
	ldxa	[%g0 + %g3] 0x21,	%o5
loop_4:
	stb	%i7,	[%l7 + 0x5D]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	set	0x110, %g1
	stxa	%g1,	[%g0 + %g1] 0x52
	ldsb	[%l7 + 0x60],	%o2
	std	%f18,	[%l7 + 0x48]
	std	%f26,	[%l7 + 0x38]
	andn	%i6,	0x0146,	%o7
	tneg	%icc,	0x1
	ldsb	[%l7 + 0x16],	%g3
	tcs	%icc,	0x6
	fcmpgt32	%f2,	%f18,	%l4
	flush	%l7 + 0x58
	ldstub	[%l7 + 0x19],	%l1
	stb	%l0,	[%l7 + 0x0F]
	ld	[%l7 + 0x60],	%f0
	fmovse	%icc,	%f19,	%f22
	nop
	set	0x41, %l1
	ldsb	[%l7 + %l1],	%i0
	fcmpeq16	%f14,	%f16,	%o6
	ldsw	[%l7 + 0x6C],	%l5
	ldsb	[%l7 + 0x3B],	%o1
	flush	%l7 + 0x50
	prefetch	[%l7 + 0x3C],	 0x0
	std	%o0,	[%l7 + 0x08]
	edge8ln	%g4,	%i3,	%o3
	rdhpr	%hsys_tick_cmpr,	%g5
	movpos	%icc,	%l2,	%i4
	movrne	%g2,	%g6,	%i2
	ld	[%l7 + 0x60],	%f25
	ldx	[%l7 + 0x70],	%l3
	sth	%o4,	[%l7 + 0x10]
	nop
	set	0x20, %o1
	std	%i4,	[%l7 + %o1]
	stx	%g7,	[%l7 + 0x48]
	ldd	[%l7 + 0x68],	%f4
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %i5
	ldxa	[%g0 + %i5] 0x21,	%i1
	stbar
	std	%i6,	[%l7 + 0x30]
	sdiv	%o5,	0x1A8A,	%i7
	ldsw	[%l7 + 0x08],	%g1
	ldsh	[%l7 + 0x74],	%o2
	ldsh	[%l7 + 0x70],	%i6
	swap	[%l7 + 0x4C],	%g3
	movn	%xcc,	%o7,	%l4
	ldsw	[%l7 + 0x34],	%l1
	nop
	set	0x40, %o2
	std	%f4,	[%l7 + %o2]
	movvs	%xcc,	%i0,	%o6
	brgz,a	%l5,	loop_5
	ldx	[%l7 + 0x48],	%o1
	wrpr	%o0,	%g4,	%cwp
	swap	[%l7 + 0x20],	%i3
loop_5:
	ldstub	[%l7 + 0x74],	%o3
	ldsw	[%l7 + 0x40],	%g5
	stx	%i4,	[%l7 + 0x78]
	std	%g2,	[%l7 + 0x70]
	ldd	[%l7 + 0x60],	%l2
	array32	%i2,	%l3,	%o4
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	wr	%g0,	0x52,	%asi
	stxa	%i5,	[%g0 + 0x118] %asi
	swap	[%l7 + 0x70],	%g6
	stbar
	lduw	[%l7 + 0x30],	%g7
	ldstub	[%l7 + 0x1C],	%i1
	stb	%l6,	[%l7 + 0x0C]
	movre	%i7,	0x1FE,	%g1
	fpadd16	%f14,	%f26,	%f22
	ldstub	[%l7 + 0x29],	%o5
	ldsb	[%l7 + 0x30],	%o2
	stb	%g3,	[%l7 + 0x3F]
	std	%o6,	[%l7 + 0x28]
	stw	%i6,	[%l7 + 0x20]
	stb	%l4,	[%l7 + 0x71]
	sth	%l1,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f10
	sth	%i0,	[%l7 + 0x1A]
	swap	[%l7 + 0x64],	%l5
	edge16n	%o1,	%o0,	%o6
	stw	%i3,	[%l7 + 0x38]
	st	%f24,	[%l7 + 0x08]
	std	%g4,	[%l7 + 0x70]
	nop
	set	0x0D, %g6
	stb	%o3,	[%l7 + %g6]
	fmovdne	%icc,	%f19,	%f26
	orncc	%g5,	0x00E1,	%l0
	ldstub	[%l7 + 0x0B],	%i4
	call	loop_6
	ldsb	[%l7 + 0x48],	%l2
	ldx	[%l7 + 0x58],	%i2
	swap	[%l7 + 0x54],	%l3
loop_6:
	flush	%l7 + 0x50
	ldstub	[%l7 + 0x3A],	%o4
	stw	%g2,	[%l7 + 0x4C]
	edge32l	%i5,	%g7,	%i1
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %o0
	stxa	%g6,	[%g0 + %o0] 0x21
	ldsh	[%l7 + 0x48],	%i7
	ld	[%l7 + 0x78],	%f9
	fba,a	%fcc1,	loop_7
	fmovde	%icc,	%f25,	%f28
	edge16l	%l6,	%g1,	%o5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
loop_7:
	sth	%i6,	[%l7 + 0x30]
	stbar
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	stxa	%o7,	[%g0 + 0x110] %asi
	ldstub	[%l7 + 0x66],	%l4
	std	%l0,	[%l7 + 0x70]
	ldx	[%l7 + 0x60],	%l5
	ldx	[%l7 + 0x20],	%i0
	std	%o0,	[%l7 + 0x48]
	stbar
	tn	%xcc,	0x1
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %o3
	ldxa	[%g0 + %o3] 0x21,	%o0
	bl,a	%icc,	loop_8
	umulcc	%o6,	%g4,	%o3
	edge8ln	%g5,	%l0,	%i4
	bshuffle	%f6,	%f10,	%f2
loop_8:
	nop
	set	0x70, %i4
	ldsw	[%l7 + %i4],	%i3
	ld	[%l7 + 0x48],	%f15
	ldsb	[%l7 + 0x53],	%i2
	fcmple32	%f18,	%f2,	%l3
	stw	%l2,	[%l7 + 0x14]
	lduh	[%l7 + 0x5C],	%g2
	ldsw	[%l7 + 0x4C],	%o4
	lduh	[%l7 + 0x7C],	%i5
	ldub	[%l7 + 0x28],	%i1
	ldub	[%l7 + 0x3C],	%g6
	ldub	[%l7 + 0x4A],	%g7
	fbul,a	%fcc2,	loop_9
	fble	%fcc2,	loop_10
	swap	[%l7 + 0x7C],	%l6
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g1
loop_9:
	stbar
loop_10:
	std	%i6,	[%l7 + 0x70]
	flush	%l7 + 0x44
	ldd	[%l7 + 0x30],	%o4
	rdpr	%gl,	%o2
	fcmpgt32	%f10,	%f14,	%i6
	ldd	[%l7 + 0x58],	%o6
	sth	%l4,	[%l7 + 0x0C]
	st	%f12,	[%l7 + 0x08]
	movre	%g3,	%l1,	%l5
	or	%i0,	%o1,	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	orcc	%g5,	0x058E,	%o3
	stx	%l0,	[%l7 + 0x30]
	flush	%l7 + 0x50
	te	%icc,	0x3
	stb	%i3,	[%l7 + 0x12]
	tpos	%icc,	0x6
	nop
	set	0x30, %l3
	stx	%i2,	[%l7 + %l3]
	swap	[%l7 + 0x20],	%i4
	ldd	[%l7 + 0x78],	%f12
	fxors	%f18,	%f26,	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fnot2	%f30,	%f30
	flush	%l7 + 0x68
	tne	%icc,	0x5
	tn	%xcc,	0x1
	ldsb	[%l7 + 0x4A],	%g2
	ldsw	[%l7 + 0x14],	%o4
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	wr	%g0,	0x21,	%asi
	stxa	%i5,	[%g0 + 0x108] %asi
	fbge,a	%fcc0,	loop_11
	swap	[%l7 + 0x5C],	%i1
	prefetch	[%l7 + 0x38],	 0x1
	ldsh	[%l7 + 0x16],	%g6
loop_11:
	movrlz	%l2,	%l6,	%g7
	st	%f14,	[%l7 + 0x20]
	ldsb	[%l7 + 0x5D],	%i7
	te	%xcc,	0x3
	flush	%l7 + 0x78
	lduw	[%l7 + 0x34],	%o5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %g2
	ldxa	[%g0 + %g2] 0x21,	%o2
	swap	[%l7 + 0x3C],	%i6
	st	%f11,	[%l7 + 0x10]
	ldstub	[%l7 + 0x48],	%o7
	ldstub	[%l7 + 0x0A],	%l4
	nop
	set	0x70, %i6
	lduh	[%l7 + %i6],	%g1
	sth	%g3,	[%l7 + 0x40]
	ldd	[%l7 + 0x08],	%f18
	sth	%l1,	[%l7 + 0x4E]
	lduw	[%l7 + 0x50],	%i0
	std	%f2,	[%l7 + 0x58]
	prefetch	[%l7 + 0x78],	 0x1
	movrne	%o1,	0x085,	%l5
	wrpr	%o6,	0x0160,	%tick
	nop
	set	0x50, %l0
	std	%f4,	[%l7 + %l0]
	st	%f16,	[%l7 + 0x08]
	srl	%g4,	%o0,	%g5
	flush	%l7 + 0x2C
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x210
	set	0x210, %i1
	ldxa	[%g0 + %i1] 0x52,	%o3
	udiv	%i3,	0x197B,	%i2
	swap	[%l7 + 0x70],	%i4
	ldd	[%l7 + 0x28],	%l0
	ldd	[%l7 + 0x28],	%f14
	ldd	[%l7 + 0x18],	%l2
	stbar
	sdiv	%g2,	0x0282,	%o4
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x218
	set	0x218, %o5
	ldxa	[%g0 + %o5] 0x52,	%i1
	stx	%i5,	[%l7 + 0x58]
	ldsh	[%l7 + 0x0A],	%l2
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x220
	wr	%g0,	0x52,	%asi
	stxa	%g6,	[%g0 + 0x220] %asi
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %i7
	stxa	%l6,	[%g0 + %i7] 0x21
	orncc	%g7,	%i7,	%o5
	fsrc1s	%f18,	%f1
	ld	[%l7 + 0x38],	%f19
	orn	%i6,	%o2,	%l4
	popc	%o7,	%g1
	prefetch	[%l7 + 0x60],	 0x0
	fnot1s	%f27,	%f31
	sth	%g3,	[%l7 + 0x18]
	fmovrde	%l1,	%f0,	%f4
	stx	%i0,	[%l7 + 0x38]
	ldsh	[%l7 + 0x4A],	%o1
	nop
	set	0x78, %o4
	lduw	[%l7 + %o4],	%l5
	array32	%o6,	%g4,	%g5
	wr	%o0,	0x018E,	%set_softint
	lduw	[%l7 + 0x1C],	%o3
	flush	%l7 + 0x60
	sth	%i2,	[%l7 + 0x32]
	swap	[%l7 + 0x08],	%i3
	sth	%i4,	[%l7 + 0x44]
	ldx	[%l7 + 0x38],	%l0
	ldsw	[%l7 + 0x1C],	%l3
	prefetch	[%l7 + 0x74],	 0x2
	nop
	set	0x68, %l6
	prefetch	[%l7 + %l6],	 0x1
	stb	%g2,	[%l7 + 0x60]
	stx	%i1,	[%l7 + 0x30]
	rdhpr	%hintp,	%i5
	rdpr	%pil,	%l2
	ldstub	[%l7 + 0x71],	%g6
	sth	%l6,	[%l7 + 0x4E]
	stx	%g7,	[%l7 + 0x30]
	fmovdleu	%xcc,	%f17,	%f26
	flush	%l7 + 0x1C
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %g7
	ldxa	[%g0 + %g7] 0x21,	%i7
	std	%f20,	[%l7 + 0x50]
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%o4
	stw	%i6,	[%l7 + 0x64]
	ldd	[%l7 + 0x50],	%f6
	stw	%o2,	[%l7 + 0x24]
	prefetch	[%l7 + 0x60],	 0x1
	stb	%o4,	[%l7 + 0x7C]
	ldub	[%l7 + 0x16],	%l4
	umulcc	%o7,	%g1,	%g3
	stb	%i0,	[%l7 + 0x5F]
	fbule	%fcc1,	loop_12
	sdivx	%l1,	0x1AED,	%o1
	stx	%o6,	[%l7 + 0x40]
	ldsh	[%l7 + 0x70],	%l5
loop_12:
	ldx	[%l7 + 0x60],	%g5
	sdiv	%o0,	0x090A,	%o3
	ldd	[%l7 + 0x60],	%g4
	ldx	[%l7 + 0x58],	%i3
	ldsh	[%l7 + 0x16],	%i2
	mulscc	%i4,	0x0EA6,	%l0
	rdhpr	%hintp,	%g2
	fbuge,a	%fcc1,	loop_13
	st	%f21,	[%l7 + 0x54]
	ldub	[%l7 + 0x0D],	%i1
	tg	%icc,	0x7
loop_13:
	lduw	[%l7 + 0x4C],	%i5
	rdpr	%tba,	%l3
	ldsh	[%l7 + 0x52],	%l2
	rd	%tick_cmpr,	%l6
	lduw	[%l7 + 0x5C],	%g6
	be,pn	%xcc,	loop_14
	nop
	set	0x7C, %o7
	lduw	[%l7 + %o7],	%i7
	ldd	[%l7 + 0x38],	%g6
	lduh	[%l7 + 0x22],	%i6
loop_14:
	stb	%o5,	[%l7 + 0x0E]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%o4
	ldsb	[%l7 + 0x59],	%o2
	ldd	[%l7 + 0x58],	%l4
	stw	%g1,	[%l7 + 0x14]
	std	%f30,	[%l7 + 0x20]
	andn	%o7,	0x024D,	%i0
	ldd	[%l7 + 0x58],	%f26
	rd	%tick_cmpr,	%g3
	std	%f4,	[%l7 + 0x10]
	stx	%l1,	[%l7 + 0x38]
	lduw	[%l7 + 0x48],	%o6
	stx	%o1,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %l2
	stxa	%g5,	[%g0 + %l2] 0x21
	std	%f20,	[%l7 + 0x48]
	rdhpr	%hpstate,	%l5
	ldstub	[%l7 + 0x5A],	%o0
	swap	[%l7 + 0x18],	%o3
	ldsw	[%l7 + 0x0C],	%g4
	prefetch	[%l7 + 0x1C],	 0x0
	ldd	[%l7 + 0x28],	%i2
	nop
	set	0x26, %i0
	lduh	[%l7 + %i0],	%i4
	nop
	set	0x6B, %l5
	stb	%i3,	[%l7 + %l5]
	std	%f24,	[%l7 + 0x40]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%l0,	[%g0 + 0x8] %asi
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	wr	%g0,	0x52,	%asi
	stxa	%g2,	[%g0 + 0x120] %asi
	ld	[%l7 + 0x28],	%f25
	stbar
	movcs	%icc,	%i5,	%i1
	ld	[%l7 + 0x70],	%f27
	stbar
	lduw	[%l7 + 0x5C],	%l3
	ldsw	[%l7 + 0x34],	%l6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x120] %asi,	%g6
	ld	[%l7 + 0x24],	%f16
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%l2
	stbar
	std	%f2,	[%l7 + 0x10]
	prefetch	[%l7 + 0x08],	 0x1
	ldd	[%l7 + 0x48],	%f28
	sth	%g7,	[%l7 + 0x34]
	ldsb	[%l7 + 0x45],	%i7
	ldsh	[%l7 + 0x1C],	%i6
	fmovsleu	%xcc,	%f29,	%f30
	stb	%o5,	[%l7 + 0x6C]
	sth	%o2,	[%l7 + 0x3C]
	std	%f12,	[%l7 + 0x58]
	lduw	[%l7 + 0x20],	%l4
	stbar
	lduh	[%l7 + 0x0C],	%o4
	stbar
	wr	%g1,	0x140A,	%ccr
	ldsb	[%l7 + 0x3F],	%i0
	stw	%g3,	[%l7 + 0x44]
	ldsh	[%l7 + 0x0A],	%l1
	lduh	[%l7 + 0x14],	%o7
	ldsw	[%l7 + 0x54],	%o1
	prefetch	[%l7 + 0x78],	 0x2
	movneg	%icc,	%o6,	%l5
	xorcc	%g5,	0x0B99,	%o3
	ldd	[%l7 + 0x38],	%o0
	prefetch	[%l7 + 0x28],	 0x3
	lduh	[%l7 + 0x38],	%i2
	stbar
	st	%f9,	[%l7 + 0x7C]
	flush	%l7 + 0x34
	nop
	set	0x58, %o6
	stx	%i4,	[%l7 + %o6]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	set	0x8, %l4
	stxa	%g4,	[%g0 + %l4] 0x21
	ldsh	[%l7 + 0x32],	%l0
	prefetch	[%l7 + 0x60],	 0x2
	ldub	[%l7 + 0x15],	%g2
	lduh	[%l7 + 0x24],	%i5
	flush	%l7 + 0x5C
	ldstub	[%l7 + 0x4B],	%i3
	stw	%i1,	[%l7 + 0x50]
	swap	[%l7 + 0x28],	%l3
	ldstub	[%l7 + 0x33],	%g6
	ldd	[%l7 + 0x30],	%f20

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDB0, 	%hsys_tick_cmpr
	tl	%xcc,	0x4
	stb	%l2,	[%l7 + 0x5E]
	stb	%i7,	[%l7 + 0x16]
	wr	%i6,	%o2,	%set_softint
	stw	%l4,	[%l7 + 0x08]
	fbg	%fcc1,	loop_15
	ldsb	[%l7 + 0x63],	%o4
	ldsh	[%l7 + 0x68],	%o5
	ldsb	[%l7 + 0x29],	%g1
loop_15:
	fcmped	%fcc0,	%f6,	%f18
	ldx	[%l7 + 0x10],	%g3
	bvs,pn	%icc,	loop_16
	ldsw	[%l7 + 0x14],	%i0
	stw	%o7,	[%l7 + 0x48]
	lduw	[%l7 + 0x58],	%o1
loop_16:
	movrlez	%o6,	0x2BD,	%l5
	std	%f10,	[%l7 + 0x40]
	ldsw	[%l7 + 0x68],	%l1
	stx	%o3,	[%l7 + 0x78]
	std	%o0,	[%l7 + 0x18]
	umulcc	%i2,	0x0DA3,	%g5
	fmovdle	%icc,	%f6,	%f25
	bge,a,pt	%xcc,	loop_17
	std	%f18,	[%l7 + 0x30]
	ld	[%l7 + 0x78],	%f23
	fxors	%f25,	%f30,	%f9
loop_17:
	ldsb	[%l7 + 0x71],	%i4
	ldd	[%l7 + 0x50],	%f16
	sth	%l0,	[%l7 + 0x78]
	flushw
	ldsw	[%l7 + 0x60],	%g2
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i5
	sth	%g4,	[%l7 + 0x2C]
	st	%f20,	[%l7 + 0x50]
	stb	%i1,	[%l7 + 0x6D]
	swap	[%l7 + 0x08],	%l3
	ldx	[%l7 + 0x60],	%g6
	std	%i6,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %g5
	stxa	%i3,	[%g0 + %g5] 0x21
	umulcc	%l2,	0x1A8F,	%g7
	stb	%i6,	[%l7 + 0x48]
	stx	%i7,	[%l7 + 0x10]
	bcc	loop_18
	ldsh	[%l7 + 0x1E],	%l4
	ldd	[%l7 + 0x40],	%o2
	prefetch	[%l7 + 0x6C],	 0x1
loop_18:
	st	%f0,	[%l7 + 0x18]
	ldsh	[%l7 + 0x7A],	%o5
	fpadd16s	%f1,	%f7,	%f18
	ld	[%l7 + 0x1C],	%f3
	stbar
	swap	[%l7 + 0x68],	%o4
	std	%g0,	[%l7 + 0x28]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%i0
	ldsw	[%l7 + 0x60],	%g3
	lduw	[%l7 + 0x40],	%o7
	bgu,a	loop_19
	tn	%icc,	0x2
	stw	%o6,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x220
	set	0x220, %g4
	stxa	%o1,	[%g0 + %g4] 0x52
loop_19:
	ld	[%l7 + 0x64],	%f22
	ldstub	[%l7 + 0x5D],	%l1
	stx	%l5,	[%l7 + 0x58]
	fmovsvc	%icc,	%f27,	%f27
	ldd	[%l7 + 0x30],	%o0
	tpos	%icc,	0x3
	nop
	setx	loop_20,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%i2,	%g5
	sth	%i4,	[%l7 + 0x46]
	ldsw	[%l7 + 0x48],	%l0
loop_20:
	ldsh	[%l7 + 0x54],	%g2
	ldd	[%l7 + 0x38],	%o2
	ldsh	[%l7 + 0x0A],	%g4
	fmovdpos	%xcc,	%f24,	%f14
	ldx	[%l7 + 0x30],	%i1
	ldub	[%l7 + 0x5A],	%i5
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%g6
	stbar
	prefetch	[%l7 + 0x58],	 0x1
	edge8ln	%l6,	%l3,	%i3
	ldx	[%l7 + 0x28],	%l2
	ldub	[%l7 + 0x2A],	%i6
	prefetch	[%l7 + 0x28],	 0x2
	lduw	[%l7 + 0x5C],	%g7
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	set	0x108, %l1
	ldxa	[%g0 + %l1] 0x21,	%i7
	fmovd	%f20,	%f20
	bge,pn	%xcc,	loop_21
	prefetch	[%l7 + 0x0C],	 0x3
	rdpr	%pil,	%l4
	ldd	[%l7 + 0x50],	%o4
loop_21:
	flush	%l7 + 0x20
	ld	[%l7 + 0x1C],	%f27
	nop
	set	0x38, %g3
	lduw	[%l7 + %g3],	%o4
	movrlez	%g1,	%i0,	%g3
	tne	%icc,	0x3
	stbar
	movrlez	%o7,	0x14F,	%o2
	lduh	[%l7 + 0x16],	%o1
	lduh	[%l7 + 0x42],	%o6
	prefetch	[%l7 + 0x48],	 0x2
	rdhpr	%htba,	%l5
	lduw	[%l7 + 0x34],	%l1
	ldx	[%l7 + 0x08],	%i2
	ldd	[%l7 + 0x28],	%f6
	fmovdge	%xcc,	%f27,	%f19
	lduw	[%l7 + 0x64],	%o0
	array16	%i4,	%g5,	%l0
	sth	%o3,	[%l7 + 0x34]
	std	%f8,	[%l7 + 0x20]
	std	%f30,	[%l7 + 0x68]
	ldub	[%l7 + 0x7B],	%g4
	bg,a,pn	%icc,	loop_22
	ldsw	[%l7 + 0x6C],	%i1
	flush	%l7 + 0x7C
	ta	%xcc,	0x1
loop_22:
	std	%g2,	[%l7 + 0x38]
	ld	[%l7 + 0x48],	%f15
	popc	%g6,	%i5
	stw	%l6,	[%l7 + 0x54]
	swap	[%l7 + 0x14],	%l3
	std	%l2,	[%l7 + 0x18]
	rdpr	%otherwin,	%i6
	ldsb	[%l7 + 0x61],	%i3
	bne,a	%xcc,	loop_23
	stx	%g7,	[%l7 + 0x28]
	movge	%icc,	%i7,	%o5
	nop
	set	0x40, %o1
	std	%o4,	[%l7 + %o1]
loop_23:
	ldsw	[%l7 + 0x68],	%g1
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x208
	set	0x208, %i5
	stxa	%i0,	[%g0 + %i5] 0x52
	addc	%l4,	0x1FF9,	%g3
	flush	%l7 + 0x64
	movn	%xcc,	%o2,	%o7
	prefetch	[%l7 + 0x54],	 0x0
	ldsh	[%l7 + 0x30],	%o6
	tcc	%xcc,	0x4
	prefetch	[%l7 + 0x6C],	 0x1
	ldub	[%l7 + 0x1C],	%o1
	std	%l4,	[%l7 + 0x58]
	lduh	[%l7 + 0x0C],	%i2
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l1
	prefetch	[%l7 + 0x2C],	 0x0
	lduh	[%l7 + 0x38],	%o0
	nop
	set	0x62, %g6
	sth	%i4,	[%l7 + %g6]
	ldd	[%l7 + 0x48],	%f0
	std	%g4,	[%l7 + 0x60]
	ldx	[%l7 + 0x70],	%l0
	edge32ln	%g4,	%i1,	%o3
	ldsw	[%l7 + 0x78],	%g6
	flush	%l7 + 0x68
	swap	[%l7 + 0x30],	%g2
	umulcc	%l6,	0x1EEC,	%i5
	ldsb	[%l7 + 0x4E],	%l3
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%i6
	ldsh	[%l7 + 0x60],	%i3
	stb	%l2,	[%l7 + 0x18]
	ldstub	[%l7 + 0x20],	%g7
	std	%i6,	[%l7 + 0x40]
	ldd	[%l7 + 0x28],	%f16
	ldsw	[%l7 + 0x20],	%o4
	ldsw	[%l7 + 0x48],	%o5
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%i0
	ldx	[%l7 + 0x08],	%l4
	std	%g0,	[%l7 + 0x78]
	prefetch	[%l7 + 0x40],	 0x2
	ldd	[%l7 + 0x20],	%f0
	ldub	[%l7 + 0x5C],	%o7
	movpos	%icc,	%o6,	%o2
	ld	[%l7 + 0x60],	%f12
	fpack32	%f24,	%f18,	%f22
	lduh	[%l7 + 0x12],	%l5
	fnot2	%f18,	%f22
	std	%f24,	[%l7 + 0x70]
	ldsb	[%l7 + 0x58],	%o1
	stbar
	ldd	[%l7 + 0x18],	%f26
	wrpr	%i2,	%o0,	%cwp
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	set	0x118, %i4
	ldxa	[%g0 + %i4] 0x52,	%l1
	st	%f3,	[%l7 + 0x10]
	stbar
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x118
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%g5
	ldd	[%l7 + 0x58],	%l0
	stw	%g4,	[%l7 + 0x54]
	ldub	[%l7 + 0x2B],	%i4
	ldx	[%l7 + 0x10],	%i1
	nop
	set	0x18, %o3
	std	%g6,	[%l7 + %o3]
	addc	%o3,	0x0C96,	%g2
	stb	%i5,	[%l7 + 0x6F]
	tl	%xcc,	0x1
	flush	%l7 + 0x64
	add	%l6,	%l3,	%i6
	umulcc	%i3,	0x03C8,	%g7
	swap	[%l7 + 0x50],	%i7
	std	%o4,	[%l7 + 0x28]
	nop
	set	0x2B, %l3
	ldsb	[%l7 + %l3],	%o5
	fmovrsgz	%l2,	%f6,	%f4
	tgu	%icc,	0x5
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x208
	wr	%g0,	0x52,	%asi
	stxa	%i0,	[%g0 + 0x208] %asi
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	set	0x8, %g2
	ldxa	[%g0 + %g2] 0x21,	%l4
	stbar
	move	%icc,	%g1,	%g3
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%o7
	fpadd32	%f28,	%f28,	%f12
	ldsb	[%l7 + 0x60],	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l5,	%o1,	%i2
	st	%f3,	[%l7 + 0x20]
	lduw	[%l7 + 0x24],	%o2
	fnegs	%f1,	%f3
	tleu	%icc,	0x3
	fbn	%fcc3,	loop_24
	ldd	[%l7 + 0x08],	%f30
	stx	%o0,	[%l7 + 0x08]
	ldd	[%l7 + 0x48],	%l0
loop_24:
	ldub	[%l7 + 0x64],	%g5
	alignaddrl	%g4,	%i4,	%i1
	movleu	%icc,	%l0,	%g6
	stbar
	fxors	%f4,	%f15,	%f5
	nop
	set	0x50, %i6
	prefetch	[%l7 + %i6],	 0x3
	stbar
	xorcc	%o3,	%g2,	%i5
	flush	%l7 + 0x38
	rdhpr	%hpstate,	%l6
	st	%f25,	[%l7 + 0x74]
	sth	%i6,	[%l7 + 0x60]
	ldsb	[%l7 + 0x6C],	%l3
	lduw	[%l7 + 0x60],	%i3
	stw	%i7,	[%l7 + 0x40]
	bvc,a	loop_25
	fmovsn	%icc,	%f1,	%f6
	std	%o4,	[%l7 + 0x60]
	ldd	[%l7 + 0x70],	%g6
loop_25:
	std	%o4,	[%l7 + 0x18]
	ldstub	[%l7 + 0x2D],	%l2
	stw	%i0,	[%l7 + 0x70]
	mova	%icc,	%l4,	%g3
	stbar
	fmovsle	%icc,	%f12,	%f31
	lduw	[%l7 + 0x70],	%o7
	lduh	[%l7 + 0x30],	%o6
	ld	[%l7 + 0x10],	%f2
	subc	%g1,	%l5,	%i2
	ldub	[%l7 + 0x4A],	%o1
	stbar
	edge16l	%o0,	%o2,	%g5
	flush	%l7 + 0x30
	addcc	%g4,	%l1,	%i4
	sethi	0x10B5,	%l0
	ldsh	[%l7 + 0x3A],	%i1
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %l0
	ldxa	[%g0 + %l0] 0x21,	%g6
	ldstub	[%l7 + 0x2E],	%g2
	lduh	[%l7 + 0x7E],	%i5
	flush	%l7 + 0x64
	nop
	set	0x6E, %i1
	ldstub	[%l7 + %i1],	%l6
	ldub	[%l7 + 0x0F],	%o3
	tgu	%icc,	0x7
	ldsb	[%l7 + 0x14],	%l3
	ldsh	[%l7 + 0x66],	%i3
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x220
	set	0x220, %i7
	ldxa	[%g0 + %i7] 0x52,	%i6
	lduw	[%l7 + 0x68],	%i7
	be,a,pt	%xcc,	loop_26
	rdpr	%wstate,	%g7
	ldx	[%l7 + 0x78],	%o5
	movgu	%icc,	%l2,	%o4
loop_26:
	ld	[%l7 + 0x6C],	%f16
	orn	%i0,	%l4,	%o7
	nop
	set	0x1C, %o5
	stw	%g3,	[%l7 + %o5]
	fmovscc	%xcc,	%f7,	%f27
	prefetch	[%l7 + 0x7C],	 0x2
	prefetch	[%l7 + 0x08],	 0x3
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%g1
	tvs	%xcc,	0x1
	ld	[%l7 + 0x14],	%f2
	ldsb	[%l7 + 0x3C],	%l5
	ld	[%l7 + 0x60],	%f17
	stw	%i2,	[%l7 + 0x3C]
	std	%o6,	[%l7 + 0x10]
	swap	[%l7 + 0x08],	%o1
	stx	%o0,	[%l7 + 0x58]
	ldsw	[%l7 + 0x38],	%g5
	st	%f24,	[%l7 + 0x14]
	stbar
	stb	%g4,	[%l7 + 0x33]
	st	%f19,	[%l7 + 0x48]
	ldsh	[%l7 + 0x48],	%l1
	ldstub	[%l7 + 0x1C],	%i4
	swap	[%l7 + 0x34],	%o2
	stx	%l0,	[%l7 + 0x08]
	rd	%sys_tick_cmpr,	%i1
	fands	%f19,	%f26,	%f19
	ldsw	[%l7 + 0x38],	%g6
	stw	%i5,	[%l7 + 0x44]
	fnand	%f22,	%f4,	%f26
	prefetch	[%l7 + 0x28],	 0x3
	addccc	%g2,	0x0392,	%o3
	orncc	%l3,	%l6,	%i3
	mova	%xcc,	%i6,	%i7
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %l6
	ldxa	[%g0 + %l6] 0x21,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x78],	%f4
	swap	[%l7 + 0x50],	%g7
	stw	%o4,	[%l7 + 0x7C]
	ld	[%l7 + 0x34],	%f6
	lduh	[%l7 + 0x18],	%l2
	movpos	%icc,	%i0,	%o7
	ldsh	[%l7 + 0x20],	%l4
	nop
	set	0x35, %g7
	stb	%g1,	[%l7 + %g7]
	move	%xcc,	%g3,	%i2
	nop
	set	0x48, %i3
	stw	%o6,	[%l7 + %i3]
	nop
	set	0x60, %o7
	std	%f28,	[%l7 + %o7]
	ld	[%l7 + 0x68],	%f8
	nop
	set	0x30, %o4
	stx	%l5,	[%l7 + %o4]
	st	%f13,	[%l7 + 0x30]
	ld	[%l7 + 0x68],	%f21
	std	%f26,	[%l7 + 0x30]
	fpadd32	%f28,	%f8,	%f30
	fmuld8sux16	%f4,	%f25,	%f8
	flush	%l7 + 0x0C
	ldx	[%l7 + 0x20],	%o0
	prefetch	[%l7 + 0x14],	 0x0
	fmovdge	%xcc,	%f24,	%f28
	swap	[%l7 + 0x54],	%g5
	nop
	set	0x08, %i0
	std	%o0,	[%l7 + %i0]
	ld	[%l7 + 0x5C],	%f26
	tleu	%icc,	0x2
	ldx	[%l7 + 0x10],	%g4
	std	%l0,	[%l7 + 0x10]
	bcc	loop_27
	swap	[%l7 + 0x30],	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f16,	[%l7 + 0x74]
loop_27:
	swap	[%l7 + 0x14],	%i4
	ldsh	[%l7 + 0x0A],	%i1
	flush	%l7 + 0x7C
	st	%f24,	[%l7 + 0x3C]
	lduh	[%l7 + 0x38],	%l0
	movle	%xcc,	%i5,	%g2
	ldsb	[%l7 + 0x53],	%g6
	std	%f2,	[%l7 + 0x38]
	stbar
	swap	[%l7 + 0x54],	%o3
	prefetch	[%l7 + 0x54],	 0x2
	bcc,a	loop_28
	ldstub	[%l7 + 0x6A],	%l3
	lduw	[%l7 + 0x38],	%l6
	stw	%i6,	[%l7 + 0x10]
loop_28:
	st	%f27,	[%l7 + 0x50]
	lduw	[%l7 + 0x18],	%i7
	ldsh	[%l7 + 0x38],	%i3
	flush	%l7 + 0x2C
	stbar
	stw	%o5,	[%l7 + 0x68]
	ldd	[%l7 + 0x50],	%f22
	stw	%g7,	[%l7 + 0x7C]
	st	%f14,	[%l7 + 0x58]
	ldsb	[%l7 + 0x6A],	%o4
	stx	%l2,	[%l7 + 0x30]
	ldstub	[%l7 + 0x27],	%i0
	ldd	[%l7 + 0x60],	%l4
	nop
	set	0x7B, %l2
	ldub	[%l7 + %l2],	%g1
	std	%f16,	[%l7 + 0x20]
	swap	[%l7 + 0x38],	%o7
	st	%f20,	[%l7 + 0x08]
	std	%f6,	[%l7 + 0x08]
	lduw	[%l7 + 0x4C],	%i2
	array8	%o6,	%l5,	%o0
	sth	%g5,	[%l7 + 0x78]
	stw	%g3,	[%l7 + 0x30]
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%g4
	std	%l0,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x10
	set	0x10, %l5
	ldxa	[%g0 + %l5] 0x21,	%o2
	ldd	[%l7 + 0x50],	%f20
	bpos	loop_29
	lduw	[%l7 + 0x6C],	%o1
	sth	%i4,	[%l7 + 0x7E]
	ldsb	[%l7 + 0x77],	%i1
loop_29:
	std	%i4,	[%l7 + 0x10]
	ldd	[%l7 + 0x68],	%l0
	ld	[%l7 + 0x0C],	%f19
	prefetch	[%l7 + 0x70],	 0x0
	ldx	[%l7 + 0x18],	%g6
	sth	%o3,	[%l7 + 0x14]
	lduh	[%l7 + 0x1E],	%l3
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	set	0x120, %l4
	ldxa	[%g0 + %l4] 0x52,	%g2
	swap	[%l7 + 0x40],	%l6
	bne,a,pt	%xcc,	loop_30
	stbar
	sth	%i6,	[%l7 + 0x0C]
	ldx	[%l7 + 0x58],	%i7
loop_30:
	sth	%o5,	[%l7 + 0x48]
	fors	%f18,	%f24,	%f12
	stbar
	std	%i2,	[%l7 + 0x08]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDC6, 	%hsys_tick_cmpr
	swap	[%l7 + 0x10],	%o4
	nop
	set	0x6C, %g5
	ldsw	[%l7 + %g5],	%i0
	ldsb	[%l7 + 0x19],	%l4
	ldd	[%l7 + 0x70],	%l2
	tne	%xcc,	0x2
	rd	%y,	%o7
	ldstub	[%l7 + 0x1A],	%i2
	ldub	[%l7 + 0x41],	%g1
	rdpr	%pil,	%l5
	tg	%icc,	0x4
	sth	%o6,	[%l7 + 0x7A]
	ldsb	[%l7 + 0x1C],	%g5
	fmovsle	%icc,	%f31,	%f29
	smul	%o0,	%g4,	%l1
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	set	0x120, %g4
	stxa	%o2,	[%g0 + %g4] 0x52
	ldd	[%l7 + 0x70],	%f20
	ldub	[%l7 + 0x38],	%g3
	ldd	[%l7 + 0x28],	%i4
	ldd	[%l7 + 0x20],	%o0
	nop
	set	0x6D, %g1
	ldstub	[%l7 + %g1],	%i1
	ldd	[%l7 + 0x38],	%f6
	tl	%xcc,	0x0
	rd	%ccr,	%i5
	flush	%l7 + 0x58
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x218
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%g6
	std	%f8,	[%l7 + 0x18]
	ldstub	[%l7 + 0x2B],	%o3
	flush	%l7 + 0x64
	fmovd	%f12,	%f30
	std	%f20,	[%l7 + 0x58]
	ld	[%l7 + 0x68],	%f31
	bl,pt	%icc,	loop_31
	ldd	[%l7 + 0x50],	%l2
	smulcc	%g2,	%l0,	%l6
	lduh	[%l7 + 0x0E],	%i6
loop_31:
	array8	%o5,	%i3,	%i7
	tvs	%xcc,	0x5
	st	%f19,	[%l7 + 0x7C]
	st	%f23,	[%l7 + 0x54]
	ldsw	[%l7 + 0x14],	%o4
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x208
	set	0x208, %l1
	stxa	%g7,	[%g0 + %l1] 0x52
	ldd	[%l7 + 0x78],	%l4
	rd	%pc,	%l2
	umulcc	%i0,	%i2,	%o7
	lduw	[%l7 + 0x6C],	%l5
	flush	%l7 + 0x24
	swap	[%l7 + 0x58],	%g1
	edge8	%o6,	%g5,	%g4
	fcmpd	%fcc1,	%f4,	%f2
	st	%f27,	[%l7 + 0x60]
	stw	%o0,	[%l7 + 0x7C]
	fbl	%fcc2,	loop_32
	nop
	set	0x60, %g3
	std	%l0,	[%l7 + %g3]
	rdhpr	%hsys_tick_cmpr,	%g3
	nop
	set	0x40, %o6
	stb	%o2,	[%l7 + %o6]
loop_32:
	nop
	set	0x49, %i5
	ldub	[%l7 + %i5],	%o1
	ldsh	[%l7 + 0x14],	%i4
	ldx	[%l7 + 0x40],	%i5
	addcc	%i1,	0x1EFA,	%g6
	wrpr	%o3,	0x1A38,	%cwp
	nop
	set	0x68, %g6
	stw	%g2,	[%l7 + %g6]
	flush	%l7 + 0x38
	flush	%l7 + 0x6C
	prefetch	[%l7 + 0x10],	 0x0
	fbn	%fcc1,	loop_33
	subccc	%l3,	%l6,	%i6
	ldd	[%l7 + 0x28],	%o4
	ldsw	[%l7 + 0x28],	%l0
loop_33:
	std	%i6,	[%l7 + 0x10]
	stbar
	ld	[%l7 + 0x7C],	%f28
	movleu	%icc,	%o4,	%g7
	swap	[%l7 + 0x60],	%i3
	ld	[%l7 + 0x48],	%f13
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x108
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l2
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	set	0x8, %o2
	stxa	%l4,	[%g0 + %o2] 0x21
	prefetch	[%l7 + 0x18],	 0x2
	fmovse	%xcc,	%f9,	%f15
	ldd	[%l7 + 0x50],	%f24
	stx	%i2,	[%l7 + 0x18]
	fpack16	%f8,	%f24
	sll	%i0,	%o7,	%l5
	fmovse	%icc,	%f17,	%f17
	nop
	set	0x19, %o1
	ldsb	[%l7 + %o1],	%o6
	lduh	[%l7 + 0x46],	%g5
	ldub	[%l7 + 0x38],	%g4
	tleu	%xcc,	0x6
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x120] %asi,	%g1
	prefetch	[%l7 + 0x68],	 0x3
	add	%o0,	0x09C7,	%g3
	std	%f24,	[%l7 + 0x18]
	std	%l0,	[%l7 + 0x70]
	ldsb	[%l7 + 0x60],	%o1
	stx	%o2,	[%l7 + 0x48]
	fmovdcs	%xcc,	%f13,	%f18
	stx	%i5,	[%l7 + 0x40]
	flush	%l7 + 0x28
	fmovrslez	%i4,	%f22,	%f21
	umulcc	%i1,	%g6,	%o3
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%l3,	[%g0 + 0x8] %asi
	addcc	%g2,	%i6,	%l6
	wrpr	%l0,	0x183D,	%pil
	lduw	[%l7 + 0x10],	%o5
	sth	%o4,	[%l7 + 0x2E]
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x110
	set	0x110, %i4
	stxa	%i7,	[%g0 + %i4] 0x52
	stbar
	ld	[%l7 + 0x74],	%f8
	ldstub	[%l7 + 0x23],	%g7
	stw	%l2,	[%l7 + 0x5C]
	ldub	[%l7 + 0x28],	%i3
	ldstub	[%l7 + 0x48],	%l4
	std	%i2,	[%l7 + 0x78]
	stbar
!Yo - got one - imm_asi 0x52 
!And yo - immediate is 0x120
	wr	%g0,	0x52,	%asi
	stxa	%o7,	[%g0 + 0x120] %asi
	lduw	[%l7 + 0x60],	%l5
	ldstub	[%l7 + 0x25],	%i0
	array8	%o6,	%g5,	%g1
	ld	[%l7 + 0x50],	%f8
	std	%g4,	[%l7 + 0x28]
	fsrc1s	%f12,	%f11
	stb	%g3,	[%l7 + 0x56]
	xnor	%l1,	0x10C8,	%o1
	nop
	set	0x1D, %o3
	stb	%o2,	[%l7 + %o3]
	ld	[%l7 + 0x60],	%f2
	array16	%o0,	%i5,	%i4
	lduh	[%l7 + 0x5C],	%g6
	movcc	%icc,	%o3,	%i1
	stb	%l3,	[%l7 + 0x12]
	st	%f6,	[%l7 + 0x64]
	lduw	[%l7 + 0x30],	%g2
	ldd	[%l7 + 0x58],	%i6
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	wr	%g0,	0x21,	%asi
	stxa	%l0,	[%g0 + 0x110] %asi
	prefetch	[%l7 + 0x24],	 0x1
	st	%f29,	[%l7 + 0x10]
	st	%f4,	[%l7 + 0x68]
	tsubcctv	%l6,	0x0A05,	%o5
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x110
	set	0x110, %o0
	stxa	%o4,	[%g0 + %o0] 0x21
	stbar
	std	%i6,	[%l7 + 0x50]
	ldsw	[%l7 + 0x18],	%l2
	fmovspos	%xcc,	%f17,	%f19
	lduw	[%l7 + 0x0C],	%i3
	ldstub	[%l7 + 0x0D],	%g7
	ldd	[%l7 + 0x30],	%f4
	ldsb	[%l7 + 0x18],	%l4
	sll	%o7,	0x06,	%l5
	swap	[%l7 + 0x74],	%i0
	prefetch	[%l7 + 0x08],	 0x2
	lduh	[%l7 + 0x10],	%o6
	ldstub	[%l7 + 0x4E],	%i2
	stbar
	fmovdge	%icc,	%f25,	%f18
	sth	%g5,	[%l7 + 0x12]
	fmovrdgez	%g4,	%f12,	%f4
	and	%g3,	%g1,	%o1
	lduh	[%l7 + 0x38],	%l1
	stbar
	umulcc	%o2,	%i5,	%i4
	swap	[%l7 + 0x64],	%g6
	ldstub	[%l7 + 0x66],	%o0
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o3
	std	%f18,	[%l7 + 0x58]
	ldd	[%l7 + 0x70],	%f26
	swap	[%l7 + 0x44],	%i1
	stx	%l3,	[%l7 + 0x30]
	addcc	%g2,	0x04E1,	%i6
	ldx	[%l7 + 0x30],	%l0
	ldx	[%l7 + 0x68],	%o5
	ldsh	[%l7 + 0x66],	%l6
	sth	%i7,	[%l7 + 0x2E]
	flushw
	ldd	[%l7 + 0x18],	%f26
	lduw	[%l7 + 0x74],	%o4
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 0x2
	ldsw	[%l7 + 0x08],	%l2
	nop
	set	0x36, %i6
	ldub	[%l7 + %i6],	%g7
	rdpr	%cwp,	%i3
	ldsw	[%l7 + 0x78],	%o7
	swap	[%l7 + 0x44],	%l5
	movne	%xcc,	%i0,	%l4
	ldd	[%l7 + 0x30],	%i2
	lduw	[%l7 + 0x50],	%o6
!Yo - got one - imm_asi 0x21 
!And yo - immediate is 0x8
	wr	%g0,	0x21,	%asi
	stxa	%g4,	[%g0 + 0x8] %asi
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 698
!	Type a   	: 37
!	Type x   	: 51
!	Type cti   	: 33
!	Type f   	: 53
!	Type i   	: 128
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xB49357DF
.word 0x05738220
.word 0xC75B2596
.word 0x98B77FC2
.word 0xEDEDB440
.word 0x70A3B1C4
.word 0xA6B0B789
.word 0xF7150D77
.word 0xFDDAB73B
.word 0x556DBA13
.word 0x4F9EC2B7
.word 0x9F757A3D
.word 0x244EDC53
.word 0xE8DB716E
.word 0xD699847C
.word 0xA1017190
.word 0x2E17D003
.word 0xF3DC7FA4
.word 0xFD06426A
.word 0x18046082
.word 0x78A0419D
.word 0x093F4E28
.word 0x183FC8A4
.word 0x568A1F80
.word 0xF3FF46EF
.word 0x5199D736
.word 0x421A512C
.word 0x95CD8724
.word 0x8116C8BD
.word 0x73B4133A
.word 0xFBCA7D75
.word 0xBA9681F1
.word 0x8027CEA3
.word 0x557465A2
.word 0xD7543BE4
.word 0x6F185475
.word 0xCE5BD2F4
.word 0x09B54CD7
.word 0x5E3FAE77
.word 0x3F04F7B5
.word 0x39070C04
.word 0x5852587E
.word 0x5E5F1514
.word 0xA487393B
.word 0xE9153C0B
.word 0xE39FFA76
.word 0xAB063C98
.word 0x2F2E3046
.word 0xFBB70C69
.word 0x1768F5F3
.word 0xAABE9790
.word 0x7DE7E111
.word 0x5439199C
.word 0x3EC82230
.word 0x3317C147
.word 0x84A09E4A
.word 0x486C005C
.word 0x63D7E709
.word 0x06BE4126
.word 0x19E2F69F
.word 0xA42B4421
.word 0xE4FF9E0C
.word 0x187EB603
.word 0xA1DF70D3
.end
