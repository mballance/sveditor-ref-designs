/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_scratchpad_f2.s
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
.ident "FOCUSCASE: focus.pm,v 1.1 2003/04/23 17:53:39 somePerson Exp somePerson $ ../focus/spc_basic_isa3.pl FOCUS_SEED=521325845"
.ident "BY gg137162 ON Mon Sep 15 14:18:19 CDT 2003"
.ident "Using Instruction Hash for Focus :$Id: isa3_scratchpad_f2.s,v 1.2 2007/07/05 22:01:58 drp Exp $"
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
	setx	0x65C31CEC907045D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x0,	%g2
	set	0x6,	%g3
	set	0x1,	%g4
	set	0xE,	%g5
	set	0x8,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xF,	%i1
	set	-0xC,	%i2
	set	-0x3,	%i3
	set	-0x3,	%i4
	set	-0xB,	%i5
	set	-0xC,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x786C46E6,	%l0
	set	0x3F6429CC,	%l1
	set	0x46B783E0,	%l2
	set	0x3941D02D,	%l3
	set	0x607EF061,	%l4
	set	0x37D3E6BA,	%l5
	set	0x7965FC27,	%l6
	!# Output registers
	set	-0x1A43,	%o0
	set	0x0786,	%o1
	set	-0x0DBD,	%o2
	set	0x1E60,	%o3
	set	-0x1934,	%o4
	set	-0x0D5A,	%o5
	set	0x0258,	%o6
	set	0x0730,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9059CD27E7375E63)
	INIT_TH_FP_REG(%l7,%f2,0x4438661EF0F5A5CD)
	INIT_TH_FP_REG(%l7,%f4,0xA82410C2E5E55752)
	INIT_TH_FP_REG(%l7,%f6,0x9DBF742414FC087E)
	INIT_TH_FP_REG(%l7,%f8,0x3100F57AAEAAE183)
	INIT_TH_FP_REG(%l7,%f10,0x87C99D5A1C4DD14A)
	INIT_TH_FP_REG(%l7,%f12,0x9713FD1196B1E66B)
	INIT_TH_FP_REG(%l7,%f14,0xFDB4E4ADF2018DD8)
	INIT_TH_FP_REG(%l7,%f16,0xEC73E2BB1A61E3FA)
	INIT_TH_FP_REG(%l7,%f18,0x97B6C8133F30DE27)
	INIT_TH_FP_REG(%l7,%f20,0xFD9AA8237AA8B02D)
	INIT_TH_FP_REG(%l7,%f22,0xC02ACFD206904A3B)
	INIT_TH_FP_REG(%l7,%f24,0x23E6917A33D1BBDC)
	INIT_TH_FP_REG(%l7,%f26,0x1E806C54B70D15A9)
	INIT_TH_FP_REG(%l7,%f28,0xB73A85837462851C)
	INIT_TH_FP_REG(%l7,%f30,0xB3E0658264987B49)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	st	%f11,	[%l7 + 0x38]
	ldd	[%l7 + 0x18],	%f6
	fmovdle	%xcc,	%f9,	%f8
	ldub	[%l7 + 0x45],	%g6
	nop
	set	0x36, %g4
	ldsh	[%l7 + %g4],	%l2
	andn	%i2,	%o6,	%l4
	nop
	set	0x60, %l1
	stx	%l0,	[%l7 + %l1]
	ldd	[%l7 + 0x58],	%f2
	nop
	set	0x15, %o7
	ldstub	[%l7 + %o7],	%l5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x103, 	%hsys_tick_cmpr
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%g3,	[%g0 + 0x10] %asi
	ldx	[%l7 + 0x20],	%g5
	flush	%l7 + 0x74
	ldd	[%l7 + 0x20],	%g0
	movg	%xcc,	%o7,	%i6
	ldsb	[%l7 + 0x4A],	%o3
	sth	%o2,	[%l7 + 0x2E]
	popc	%o4,	%l6
	flush	%l7 + 0x70
	stb	%i3,	[%l7 + 0x11]
	ldsh	[%l7 + 0x36],	%g7
	stb	%i7,	[%l7 + 0x1E]
	std	%g4,	[%l7 + 0x30]
	st	%f27,	[%l7 + 0x10]
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f24
	swap	[%l7 + 0x18],	%l3
	nop
	set	0x20, %o2
	stw	%o1,	[%l7 + %o2]
	fmovspos	%xcc,	%f5,	%f26
	std	%f4,	[%l7 + 0x68]
	ldd	[%l7 + 0x28],	%o4
	fbn,a	%fcc0,	loop_1
	sdivx	%o0,	0x06D2,	%i0
	ldd	[%l7 + 0x18],	%l0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g2
loop_1:
	taddcc	%g6,	0x08BE,	%i5
	std	%l2,	[%l7 + 0x18]
	ldd	[%l7 + 0x38],	%i2
	ld	[%l7 + 0x74],	%f3
	st	%f20,	[%l7 + 0x1C]
	ldd	[%l7 + 0x68],	%f0
	ldstub	[%l7 + 0x45],	%l4
	ldsb	[%l7 + 0x24],	%l0
	nop
	set	0x6C, %i5
	ldsh	[%l7 + %i5],	%o6
	ldx	[%l7 + 0x70],	%l5
	srlx	%i4,	0x0F,	%i1
	move	%icc,	%g5,	%g1
	movg	%icc,	%o7,	%i6
	ldstub	[%l7 + 0x6C],	%g3
	ldx	[%l7 + 0x68],	%o3
	std	%f14,	[%l7 + 0x58]
	lduw	[%l7 + 0x70],	%o2
	stx	%o4,	[%l7 + 0x60]
	ldsw	[%l7 + 0x6C],	%i3
	swap	[%l7 + 0x24],	%l6
	stx	%i7,	[%l7 + 0x08]
	swap	[%l7 + 0x20],	%g7
	ldub	[%l7 + 0x6A],	%l3
	fmovsn	%icc,	%f22,	%f2
	alignaddr	%o1,	%o5,	%o0
	fmovrse	%g4,	%f7,	%f29
	ldd	[%l7 + 0x40],	%l0
	prefetch	[%l7 + 0x40],	 0x1
	lduw	[%l7 + 0x48],	%i0
	nop
	set	0x74, %g7
	prefetch	[%l7 + %g7],	 0x1
	fmovdgu	%xcc,	%f25,	%f2
	prefetch	[%l7 + 0x0C],	 0x3
	std	%f28,	[%l7 + 0x58]
	std	%g2,	[%l7 + 0x30]
	nop
	set	0x2E, %o6
	lduh	[%l7 + %o6],	%g6
	subcc	%i5,	0x11C1,	%l2
	fbn	%fcc3,	loop_2
	ld	[%l7 + 0x0C],	%f19
	bvc,pn	%icc,	loop_3
	bneg,a	%xcc,	loop_4
loop_2:
	ldsb	[%l7 + 0x11],	%i2
	ldx	[%l7 + 0x48],	%l0
loop_3:
	ldsw	[%l7 + 0x34],	%o6
loop_4:
	rd	%y,	%l4
	ldsb	[%l7 + 0x15],	%l5
	bgu,a,pt	%xcc,	loop_5
	ldsw	[%l7 + 0x34],	%i1
	lduh	[%l7 + 0x3A],	%g5
	prefetch	[%l7 + 0x38],	 0x0
loop_5:
	lduw	[%l7 + 0x38],	%i4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g6
	stxa	%o7,	[%g0 + %g6] 0x20
	fmovde	%icc,	%f25,	%f19
	stbar
	flush	%l7 + 0x5C
	stb	%i6,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%g1,	[%g0 + 0x18] %asi
	sdivcc	%o3,	0x0650,	%g3
	stx	%o4,	[%l7 + 0x48]
	movleu	%icc,	%i3,	%o2
	taddcctv	%l6,	%g7,	%l3
	nop
	set	0x23, %l6
	ldsb	[%l7 + %l6],	%i7
	lduw	[%l7 + 0x38],	%o5
	ldub	[%l7 + 0x7F],	%o1
	nop
	set	0x50, %i2
	std	%f26,	[%l7 + %i2]
	sth	%o0,	[%l7 + 0x34]
	rdpr	%cleanwin,	%g4
	nop
	set	0x6A, %o1
	ldstub	[%l7 + %o1],	%i0
	fmovrde	%g2,	%f6,	%f22
	sll	%l1,	%i5,	%g6
	lduw	[%l7 + 0x40],	%l2
	ldstub	[%l7 + 0x47],	%i2
	lduh	[%l7 + 0x3A],	%l0
	swap	[%l7 + 0x54],	%l4
	rdpr	%cwp,	%o6
	stx	%l5,	[%l7 + 0x58]
	flush	%l7 + 0x3C
	ld	[%l7 + 0x44],	%f25
	std	%g4,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o4
	ldxa	[%g0 + %o4] 0x20,	%i4
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o7
	ld	[%l7 + 0x3C],	%f16
	swap	[%l7 + 0x50],	%i6
	ld	[%l7 + 0x2C],	%f7
	ld	[%l7 + 0x58],	%f3
	swap	[%l7 + 0x14],	%i1
	ldsb	[%l7 + 0x1F],	%o3
	ldsw	[%l7 + 0x6C],	%g3
	ldsw	[%l7 + 0x70],	%o4
	stb	%g1,	[%l7 + 0x40]
	lduw	[%l7 + 0x50],	%i3
	stw	%o2,	[%l7 + 0x38]
	ldd	[%l7 + 0x08],	%f12
	bleu,a	%icc,	loop_6
	ldsb	[%l7 + 0x0C],	%l6
	alignaddr	%l3,	%i7,	%g7
	sth	%o1,	[%l7 + 0x58]
loop_6:
	prefetch	[%l7 + 0x30],	 0x1
	array16	%o0,	%g4,	%i0
	sth	%o5,	[%l7 + 0x6C]
	std	%f22,	[%l7 + 0x38]
	ldd	[%l7 + 0x70],	%g2
	ldsh	[%l7 + 0x0C],	%l1
	fmovrdlez	%g6,	%f10,	%f14
	andcc	%l2,	%i5,	%l0
	sllx	%l4,	%i2,	%o6
	std	%f26,	[%l7 + 0x58]
	ldsh	[%l7 + 0x36],	%g5
	std	%l4,	[%l7 + 0x50]
	sth	%i4,	[%l7 + 0x4A]
	prefetch	[%l7 + 0x24],	 0x3
	edge8	%i6,	%i1,	%o7
	be	%xcc,	loop_7
	swap	[%l7 + 0x48],	%g3
	bg,a	loop_8
	stw	%o3,	[%l7 + 0x34]
loop_7:
	stbar
	ble	loop_9
loop_8:
	std	%f28,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o3
	ldxa	[%g0 + %o3] 0x20,	%o4
loop_9:
	ldub	[%l7 + 0x59],	%g1
	ldd	[%l7 + 0x60],	%f16
	st	%f4,	[%l7 + 0x10]
	movvc	%icc,	%o2,	%i3
	std	%f14,	[%l7 + 0x70]
	flush	%l7 + 0x2C
	ldsb	[%l7 + 0x11],	%l3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %i7
	ldxa	[%g0 + %i7] 0x20,	%l6
	nop
	set	0x10, %l3
	std	%i6,	[%l7 + %l3]
	flush	%l7 + 0x50
	movpos	%icc,	%o1,	%o0
	move	%icc,	%g7,	%i0
	st	%f7,	[%l7 + 0x20]
	prefetch	[%l7 + 0x64],	 0x2
	lduw	[%l7 + 0x70],	%o5
	addcc	%g2,	0x0D34,	%g4
	swap	[%l7 + 0x40],	%l1
	tleu	%xcc,	0x5
	nop
	set	0x18, %i4
	std	%f18,	[%l7 + %i4]
	prefetch	[%l7 + 0x58],	 0x3
	swap	[%l7 + 0x30],	%l2
	edge16ln	%g6,	%i5,	%l4
	nop
	set	0x58, %l0
	ldsw	[%l7 + %l0],	%i2
	ldd	[%l7 + 0x60],	%f0
	ldsb	[%l7 + 0x33],	%l0
	ldub	[%l7 + 0x23],	%g5
	edge32	%o6,	%i4,	%i6
	std	%f28,	[%l7 + 0x38]
	flush	%l7 + 0x28
	ldsh	[%l7 + 0x70],	%l5
	tsubcctv	%o7,	0x08B1,	%i1
	ldd	[%l7 + 0x60],	%f30
	nop
	setx	loop_10,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%g3,	0x15A5,	%o3
	ldstub	[%l7 + 0x5E],	%g1
	ldsh	[%l7 + 0x1E],	%o2
loop_10:
	stx	%o4,	[%l7 + 0x48]
	ldsb	[%l7 + 0x28],	%i3
	lduh	[%l7 + 0x1C],	%l6
	sth	%l3,	[%l7 + 0x34]
	swap	[%l7 + 0x48],	%i7
	ldd	[%l7 + 0x08],	%f0
	edge32	%o0,	%g7,	%i0
	tleu	%xcc,	0x7
	nop
	set	0x1C, %l5
	prefetch	[%l7 + %l5],	 0x2
	ldsb	[%l7 + 0x0F],	%o1
	ldd	[%l7 + 0x10],	%f6
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f10
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %o0
	stxa	%o5,	[%g0 + %o0] 0x4f
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l2
	stxa	%g4,	[%g0 + %l2] 0x4f
	ldub	[%l7 + 0x48],	%l1
	ldx	[%l7 + 0x28],	%l2
	rdhpr	%htba,	%g6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %g1
	stxa	%g2,	[%g0 + %g1] 0x4f
	movrne	%l4,	0x2F0,	%i5
	ldsb	[%l7 + 0x4D],	%i2
	lduh	[%l7 + 0x1A],	%g5
	fmovsa	%xcc,	%f3,	%f13
	sth	%l0,	[%l7 + 0x2C]
	ldx	[%l7 + 0x28],	%o6
	mulx	%i6,	%l5,	%i4
	fmovde	%xcc,	%f7,	%f10
	movvs	%icc,	%i1,	%g3
	tvc	%icc,	0x2
	flush	%l7 + 0x5C
	nop
	set	0x44, %g2
	lduh	[%l7 + %g2],	%o3
	lduh	[%l7 + 0x24],	%g1
	subcc	%o7,	%o4,	%o2
	movrgez	%l6,	0x1BF,	%i3
	sth	%l3,	[%l7 + 0x48]
	stx	%o0,	[%l7 + 0x08]
	ld	[%l7 + 0x50],	%f14
	ldsh	[%l7 + 0x72],	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%g7,	[%g0 + 0x38] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%i0,	[%g0 + 0x8] %asi
	wrpr	%o1,	0x14C4,	%pil
	be,a,pn	%xcc,	loop_11
	fpack32	%f24,	%f4,	%f24
	flush	%l7 + 0x38
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%o5,	[%g0 + 0x30] %asi
loop_11:
	tl	%icc,	0x5
	tsubcctv	%g4,	0x0A8F,	%l2
	ldsh	[%l7 + 0x5E],	%g6
	ldx	[%l7 + 0x10],	%l1
	sth	%l4,	[%l7 + 0x48]
	lduw	[%l7 + 0x54],	%g2
	nop
	set	0x17, %i3
	ldsb	[%l7 + %i3],	%i2
	stw	%g5,	[%l7 + 0x1C]
	subccc	%l0,	0x0436,	%i5
	ldub	[%l7 + 0x6D],	%o6
	sth	%l5,	[%l7 + 0x76]
	ldd	[%l7 + 0x40],	%f24
	ldx	[%l7 + 0x70],	%i4
	ba,a	loop_12
	ldd	[%l7 + 0x18],	%i6
	ldd	[%l7 + 0x08],	%g2
	ldsw	[%l7 + 0x68],	%i1
loop_12:
	tpos	%icc,	0x0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %i6
	ldxa	[%g0 + %i6] 0x4f,	%g1
	ldd	[%l7 + 0x18],	%o2
	ldsb	[%l7 + 0x16],	%o4
	ldsh	[%l7 + 0x46],	%o2
	srax	%o7,	%i3,	%l3
	membar	0x70
	swap	[%l7 + 0x48],	%o0
	stbar
	prefetch	[%l7 + 0x68],	 0x2
	brlez,a	%i7,	loop_13
	stx	%l6,	[%l7 + 0x28]
	flush	%l7 + 0x40
	ldx	[%l7 + 0x58],	%i0
loop_13:
	fbuge,a	%fcc2,	loop_14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %o5
	ldxa	[%g0 + %o5] 0x4f,	%o1
loop_14:
	ldsw	[%l7 + 0x0C],	%g7
	ldx	[%l7 + 0x68],	%g4
	tcs	%icc,	0x5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%o5
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0FD, 	%sys_tick_cmpr
	std	%l0,	[%l7 + 0x28]
	lduw	[%l7 + 0x20],	%l4
	tle	%xcc,	0x0
	lduh	[%l7 + 0x5C],	%g2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i2
	nop
	set	0x55, %i1
	stb	%g6,	[%l7 + %i1]
	xnorcc	%l0,	%g5,	%i5
	lduh	[%l7 + 0x7A],	%o6
	std	%l4,	[%l7 + 0x10]
	wrpr	%i6,	%i4,	%pil
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%g3
	stbar
	tvs	%icc,	0x5
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%g1
	stw	%o3,	[%l7 + 0x54]
	fxors	%f19,	%f13,	%f9
	ta	%xcc,	0x5
	flush	%l7 + 0x44
	st	%f12,	[%l7 + 0x14]
	nop
	set	0x2A, %l1
	stb	%i1,	[%l7 + %l1]
	umul	%o4,	0x1942,	%o2
	flush	%l7 + 0x10
	ldd	[%l7 + 0x68],	%i2
	sir	0x14EA
	ldx	[%l7 + 0x50],	%l3
	and	%o7,	0x1AB2,	%i7
	ldub	[%l7 + 0x6A],	%o0
	lduw	[%l7 + 0x2C],	%i0
	tsubcctv	%o1,	%g7,	%g4
	ldd	[%l7 + 0x60],	%i6
	sth	%o5,	[%l7 + 0x0E]
	stw	%l1,	[%l7 + 0x68]
	lduw	[%l7 + 0x28],	%l4
	ldd	[%l7 + 0x40],	%f0
	nop
	set	0x0A, %g4
	lduh	[%l7 + %g4],	%l2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o7
	stxa	%g6,	[%g0 + %o7] 0x4f
	fnands	%f0,	%f18,	%f22
	std	%l0,	[%l7 + 0x58]
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g2
	ldub	[%l7 + 0x0E],	%i5
	fbge,a	%fcc2,	loop_15
	flush	%l7 + 0x18
	bn	loop_16
	std	%f0,	[%l7 + 0x58]
loop_15:
	std	%f0,	[%l7 + 0x30]
	ldd	[%l7 + 0x50],	%g4
loop_16:
	lduh	[%l7 + 0x66],	%l5
	rdhpr	%htba,	%i6
	lduh	[%l7 + 0x2E],	%o6
	sth	%i4,	[%l7 + 0x48]
	nop
	set	0x48, %o2
	stx	%g3,	[%l7 + %o2]
	ldsh	[%l7 + 0x50],	%o3
	tn	%icc,	0x2
	fpadd32	%f22,	%f14,	%f8
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i5
	ldxa	[%g0 + %i5] 0x20,	%g1
	ldsb	[%l7 + 0x26],	%i1
	rdpr	%pil,	%o4
	ldub	[%l7 + 0x77],	%i3
	stw	%l3,	[%l7 + 0x50]
	te	%xcc,	0x0
	nop
	set	0x10, %g7
	stw	%o2,	[%l7 + %g7]
	prefetch	[%l7 + 0x4C],	 0x1
	st	%f23,	[%l7 + 0x5C]
	ldsb	[%l7 + 0x75],	%o7
	swap	[%l7 + 0x5C],	%o0
	stx	%i0,	[%l7 + 0x60]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD84, 	%hsys_tick_cmpr
	movpos	%icc,	%o1,	%g7
	stx	%g4,	[%l7 + 0x48]
	ldx	[%l7 + 0x70],	%l6
	prefetch	[%l7 + 0x30],	 0x3
	lduw	[%l7 + 0x5C],	%o5
	stw	%l1,	[%l7 + 0x5C]
	stbar
	tne	%icc,	0x2
	wrpr	%l4,	%l2,	%pil
	ldx	[%l7 + 0x10],	%i2
	ldsw	[%l7 + 0x10],	%g6
	std	%f18,	[%l7 + 0x30]
	fbne,a	%fcc0,	loop_17
	stb	%l0,	[%l7 + 0x5D]
	nop
	set	0x6A, %g3
	lduh	[%l7 + %g3],	%i5
	ldsh	[%l7 + 0x2E],	%g2
loop_17:
	nop
	set	0x30, %o6
	prefetch	[%l7 + %o6],	 0x0
	fmovdn	%xcc,	%f1,	%f22
	prefetch	[%l7 + 0x20],	 0x3
	ldd	[%l7 + 0x58],	%f2
	array32	%g5,	%l5,	%i6
	std	%o6,	[%l7 + 0x50]
	orcc	%g3,	0x14ED,	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %l6
	ldxa	[%g0 + %l6] 0x4f,	%g1
	taddcctv	%i1,	0x0C99,	%o4
	stb	%i3,	[%l7 + 0x43]
	nop
	set	0x24, %i2
	ldsw	[%l7 + %i2],	%o3
	or	%l3,	0x138C,	%o2
	ldstub	[%l7 + 0x2B],	%o0
	fornot2	%f30,	%f20,	%f30
	ldsw	[%l7 + 0x68],	%o7
	lduh	[%l7 + 0x1C],	%i0
	ldub	[%l7 + 0x5C],	%i7
	std	%o0,	[%l7 + 0x70]
	lduw	[%l7 + 0x0C],	%g7
	ldstub	[%l7 + 0x56],	%g4
	ldsw	[%l7 + 0x1C],	%l6
	stbar
	ldx	[%l7 + 0x68],	%l1
	swap	[%l7 + 0x78],	%o5
	lduh	[%l7 + 0x6E],	%l2
	lduw	[%l7 + 0x28],	%i2
	flush	%l7 + 0x0C
	lduw	[%l7 + 0x3C],	%l4
	nop
	set	0x48, %o1
	stx	%l0,	[%l7 + %o1]
	std	%i4,	[%l7 + 0x60]
	movneg	%xcc,	%g2,	%g5
	udiv	%g6,	0x126E,	%l5
	fmul8x16	%f12,	%f8,	%f30
	addcc	%o6,	0x1F8B,	%i6
	ldx	[%l7 + 0x18],	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x2C],	%o4
	ldstub	[%l7 + 0x36],	%i1
	ldd	[%l7 + 0x68],	%f0
	stbar
	std	%f12,	[%l7 + 0x70]
	sub	%i3,	0x0B59,	%o3
	brgz,a	%l3,	loop_18
	lduw	[%l7 + 0x5C],	%o0
	std	%o6,	[%l7 + 0x30]
	fmovrsne	%o2,	%f7,	%f18
loop_18:
	stb	%i0,	[%l7 + 0x18]
	st	%f31,	[%l7 + 0x38]
	taddcc	%o1,	%i7,	%g7
	flush	%l7 + 0x2C
	lduh	[%l7 + 0x0E],	%g4
	fmovdle	%icc,	%f12,	%f1
	ld	[%l7 + 0x1C],	%f9
	tge	%xcc,	0x2
	stbar
	std	%i6,	[%l7 + 0x10]
	lduw	[%l7 + 0x10],	%l1
	nop
	set	0x48, %o4
	ldsw	[%l7 + %o4],	%o5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%i2,	[%g0 + 0x30] %asi
	lduw	[%l7 + 0x38],	%l4
	swap	[%l7 + 0x2C],	%l0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i5
	st	%f16,	[%l7 + 0x2C]
	ld	[%l7 + 0x14],	%f21
	std	%l2,	[%l7 + 0x58]
	lduh	[%l7 + 0x6A],	%g2
	ldsh	[%l7 + 0x0E],	%g5
	ldd	[%l7 + 0x40],	%g6
	stbar
	movneg	%xcc,	%l5,	%o6
	ldx	[%l7 + 0x28],	%i6
	movre	%g1,	%i4,	%g3
	bgu	%icc,	loop_19
	movcs	%xcc,	%o4,	%i3
	tsubcc	%i1,	0x0667,	%l3
	ldstub	[%l7 + 0x30],	%o3
loop_19:
	edge16n	%o7,	%o2,	%o0
	ldd	[%l7 + 0x68],	%f0
	fors	%f3,	%f26,	%f30
	sth	%i0,	[%l7 + 0x0A]
	swap	[%l7 + 0x4C],	%o1
	fbul	%fcc2,	loop_20
	bgu,a	%xcc,	loop_21
	prefetch	[%l7 + 0x38],	 0x0
	fbue	%fcc1,	loop_22
loop_20:
	std	%i6,	[%l7 + 0x28]
loop_21:
	prefetch	[%l7 + 0x54],	 0x1
	fmovdne	%xcc,	%f8,	%f6
loop_22:
	ld	[%l7 + 0x28],	%f13

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB1B, 	%hsys_tick_cmpr
	tg	%icc,	0x2
	std	%g6,	[%l7 + 0x50]
	orcc	%l1,	0x0AAB,	%l6
	edge16	%i2,	%o5,	%l0
	stx	%i5,	[%l7 + 0x18]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g5
	ldxa	[%g0 + %g5] 0x20,	%l2
	stb	%g2,	[%l7 + 0x25]
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%l4
	stbar
	andncc	%g6,	%g5,	%o6
	ldsb	[%l7 + 0x64],	%i6
	ldx	[%l7 + 0x58],	%g1
	prefetch	[%l7 + 0x4C],	 0x3
	ld	[%l7 + 0x14],	%f9
	std	%f0,	[%l7 + 0x68]
	nop
	set	0x44, %i7
	prefetch	[%l7 + %i7],	 0x2
	stw	%l5,	[%l7 + 0x3C]
	lduh	[%l7 + 0x26],	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	stxa	%o4,	[%g0 + 0x28] %asi
	edge16ln	%g3,	%i3,	%l3
	ldd	[%l7 + 0x78],	%o2
	movgu	%icc,	%o7,	%i1
	mulx	%o2,	0x08DB,	%i0
	rd	%ccr,	%o0
	ldstub	[%l7 + 0x2E],	%i7
	ldub	[%l7 + 0x10],	%o1
	ldd	[%l7 + 0x50],	%f18
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g7,	[%g0 + 0x30] %asi
	ldub	[%l7 + 0x20],	%g4
	mulscc	%l1,	0x0048,	%l6
	std	%f10,	[%l7 + 0x78]
	nop
	set	0x58, %l3
	std	%o4,	[%l7 + %l3]
	ldsh	[%l7 + 0x62],	%l0
	stx	%i5,	[%l7 + 0x10]
	fmovdle	%xcc,	%f25,	%f22
	nop
	set	0x47, %i4
	ldstub	[%l7 + %i4],	%i2
	movpos	%icc,	%l2,	%g2
	be,a	%icc,	loop_23
	std	%f18,	[%l7 + 0x50]
	ldstub	[%l7 + 0x69],	%g6
	swap	[%l7 + 0x70],	%g5
loop_23:
	tvc	%icc,	0x7
	flush	%l7 + 0x48
	brnz	%l4,	loop_24
	ldsh	[%l7 + 0x4A],	%o6
	bpos,a	loop_25
	lduh	[%l7 + 0x4E],	%g1
loop_24:
	st	%f15,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l5
loop_25:
	prefetch	[%l7 + 0x40],	 0x2
	stbar
	tgu	%xcc,	0x1
	stb	%i6,	[%l7 + 0x5B]
	ldd	[%l7 + 0x78],	%o4
	ldub	[%l7 + 0x66],	%i4
	tcc	%icc,	0x5
	subc	%i3,	%l3,	%o3
	addc	%g3,	0x040C,	%o7
	sth	%i1,	[%l7 + 0x26]
	ldx	[%l7 + 0x78],	%i0
	bvc	loop_26
	brgez,a	%o0,	loop_27
	stw	%i7,	[%l7 + 0x40]
	ldstub	[%l7 + 0x10],	%o1
loop_26:
	nop
	set	0x1C, %o3
	lduh	[%l7 + %o3],	%o2
loop_27:
	std	%g4,	[%l7 + 0x50]
	ldsw	[%l7 + 0x28],	%l1
	rdpr	%tba,	%g7
	ldd	[%l7 + 0x40],	%o4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %l0
	stxa	%l0,	[%g0 + %l0] 0x4f
	array8	%i5,	%l6,	%l2
	fbug	%fcc2,	loop_28
	movvc	%icc,	%g2,	%g6
	lduw	[%l7 + 0x54],	%g5
	stw	%l4,	[%l7 + 0x70]
loop_28:
	lduw	[%l7 + 0x60],	%i2
	ld	[%l7 + 0x38],	%f5
	ldx	[%l7 + 0x50],	%g1
	ldd	[%l7 + 0x38],	%f12
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %l5
	stxa	%l5,	[%g0 + %l5] 0x20
	lduh	[%l7 + 0x52],	%i6
	swap	[%l7 + 0x48],	%o4
	lduw	[%l7 + 0x30],	%i4
	nop
	set	0x3F, %o0
	ldsb	[%l7 + %o0],	%i3
	nop
	set	0x36, %l2
	ldub	[%l7 + %l2],	%l3
	st	%f25,	[%l7 + 0x5C]
	rdhpr	%hsys_tick_cmpr,	%o6
	fble,a	%fcc1,	loop_29
	ldd	[%l7 + 0x58],	%f18
	mova	%icc,	%o3,	%o7
	stbar
loop_29:
	fornot1	%f10,	%f8,	%f0
	subccc	%g3,	0x0B69,	%i1
	ldsh	[%l7 + 0x1C],	%o0
	lduw	[%l7 + 0x50],	%i0
	swap	[%l7 + 0x60],	%i7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g1
	ldxa	[%g0 + %g1] 0x20,	%o1
	prefetch	[%l7 + 0x0C],	 0x2
	bl	loop_30
	ldsb	[%l7 + 0x51],	%o2
	lduw	[%l7 + 0x38],	%l1
	movgu	%xcc,	%g4,	%o5
loop_30:
	alignaddr	%g7,	%i5,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x268, 	%hsys_tick_cmpr
	nop
	set	0x38, %g2
	std	%f20,	[%l7 + %g2]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %l4
	stxa	%g2,	[%g0 + %l4] 0x20
	prefetch	[%l7 + 0x48],	 0x3
	std	%f10,	[%l7 + 0x50]
	lduh	[%l7 + 0x52],	%g5
	prefetch	[%l7 + 0x6C],	 0x0
	st	%f27,	[%l7 + 0x48]
	xnorcc	%g6,	%i2,	%g1
	mulscc	%l5,	0x1613,	%l4
	nop
	set	0x23, %i3
	ldsb	[%l7 + %i3],	%i6
	stw	%o4,	[%l7 + 0x1C]
	fba,a	%fcc2,	loop_31
	ldub	[%l7 + 0x30],	%i3
	stbar
	fmul8x16au	%f1,	%f9,	%f14
loop_31:
	ldsw	[%l7 + 0x3C],	%l3
	std	%o6,	[%l7 + 0x10]
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%o3
	sth	%i4,	[%l7 + 0x20]
	ldsh	[%l7 + 0x64],	%o7
	ldsw	[%l7 + 0x48],	%g3
	fpackfix	%f16,	%f27
	sth	%i1,	[%l7 + 0x12]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x18] %asi
	st	%f22,	[%l7 + 0x38]
	movrlz	%i0,	0x214,	%i7
	tleu	%icc,	0x2
	fpackfix	%f24,	%f16
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%o2,	[%g0 + 0x20] %asi
	stb	%l1,	[%l7 + 0x52]
	ldstub	[%l7 + 0x7B],	%o1
	te	%icc,	0x0
	movg	%xcc,	%o5,	%g7
	bge,a,pt	%icc,	loop_32
	swap	[%l7 + 0x10],	%g4
	nop
	set	0x46, %i1
	ldub	[%l7 + %i1],	%l6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %i0
	stxa	%i5,	[%g0 + %i0] 0x4f
loop_32:
	st	%f2,	[%l7 + 0x38]
	ldub	[%l7 + 0x59],	%l0
	fmovdleu	%xcc,	%f11,	%f31
	ld	[%l7 + 0x70],	%f0
	ld	[%l7 + 0x4C],	%f2
	fnot2	%f8,	%f0
	ldsb	[%l7 + 0x48],	%l2
	nop
	set	0x30, %l1
	std	%g4,	[%l7 + %l1]
	ldub	[%l7 + 0x08],	%g6
	rdhpr	%hpstate,	%g2
	ld	[%l7 + 0x5C],	%f29
	lduw	[%l7 + 0x5C],	%i2
	swap	[%l7 + 0x4C],	%g1
	std	%f18,	[%l7 + 0x68]
	ldstub	[%l7 + 0x66],	%l5
	ldd	[%l7 + 0x50],	%f22
	stbar
	rdhpr	%hintp,	%l4
	ldx	[%l7 + 0x18],	%o4
	ld	[%l7 + 0x3C],	%f0
	lduw	[%l7 + 0x54],	%i6
	ldsw	[%l7 + 0x48],	%i3
	flush	%l7 + 0x48
	stb	%o6,	[%l7 + 0x1D]
	movrgz	%o3,	0x026,	%i4
	lduh	[%l7 + 0x3E],	%o7
	ld	[%l7 + 0x24],	%f9
	ldub	[%l7 + 0x58],	%l3
	sdiv	%g3,	0x01E1,	%i1
	movvc	%icc,	%o0,	%i0
	flush	%l7 + 0x48
	lduh	[%l7 + 0x40],	%o2
	rdpr	%otherwin,	%i7
	lduw	[%l7 + 0x7C],	%l1
	fmovdn	%icc,	%f8,	%f31
	swap	[%l7 + 0x50],	%o1
	ldd	[%l7 + 0x78],	%f18
	ldstub	[%l7 + 0x18],	%o5
	ldsw	[%l7 + 0x3C],	%g4
	stbar
	stbar
	ldstub	[%l7 + 0x38],	%g7
	srax	%i5,	%l0,	%l2
	ldd	[%l7 + 0x28],	%f30
	movcs	%xcc,	%l6,	%g5
	prefetch	[%l7 + 0x7C],	 0x3
	tleu	%xcc,	0x5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	xorcc	%g1,	0x1D75,	%g2
	ldd	[%l7 + 0x20],	%l4
	std	%f30,	[%l7 + 0x50]
	lduh	[%l7 + 0x3A],	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i3
	ldd	[%l7 + 0x60],	%f30
	xor	%o6,	%o3,	%i4
	lduh	[%l7 + 0x56],	%o4
	movvc	%xcc,	%l3,	%g3
	ld	[%l7 + 0x3C],	%f13
	ldsb	[%l7 + 0x66],	%i1
	nop
	set	0x22, %o5
	ldstub	[%l7 + %o5],	%o7
	swap	[%l7 + 0x78],	%i0
	movre	%o2,	%i7,	%o0
	ldsh	[%l7 + 0x44],	%o1
	sth	%l1,	[%l7 + 0x10]
	subccc	%g4,	%o5,	%i5
	ldd	[%l7 + 0x30],	%g6
	rd	%asi,	%l2
	prefetch	[%l7 + 0x20],	 0x0
	fnors	%f20,	%f29,	%f2
	std	%i6,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %o7
	stxa	%g5,	[%g0 + %o7] 0x20
	lduw	[%l7 + 0x2C],	%g6
	ldd	[%l7 + 0x40],	%f26
	stx	%i2,	[%l7 + 0x70]
	fcmpeq32	%f16,	%f30,	%g1
	ldsh	[%l7 + 0x0E],	%l0
	fpsub16s	%f10,	%f27,	%f9
	fpsub32s	%f18,	%f31,	%f30
	ldsh	[%l7 + 0x12],	%l4
	ldub	[%l7 + 0x51],	%g2
	brgz	%i6,	loop_33
	alignaddr	%l5,	%i3,	%o3
	ldsw	[%l7 + 0x24],	%o6
	addcc	%i4,	%o4,	%l3
loop_33:
	addc	%i1,	%o7,	%g3
	movcs	%icc,	%i0,	%i7
	std	%f22,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o2
	tsubcc	%o0,	0x08EB,	%o1
	fandnot2	%f2,	%f4,	%f14
	xorcc	%l1,	0x11EF,	%g4
	ta	%icc,	0x6
	lduw	[%l7 + 0x44],	%i5
	ldd	[%l7 + 0x60],	%f28
	nop
	set	0x38, %g4
	std	%f0,	[%l7 + %g4]
	nop
	set	0x2E, %i5
	ldsb	[%l7 + %i5],	%g7
	prefetch	[%l7 + 0x44],	 0x3
	std	%l2,	[%l7 + 0x58]
	fmovrdlez	%o5,	%f20,	%f20
	nop
	set	0x4C, %g7
	lduw	[%l7 + %g7],	%l6
	udivcc	%g5,	0x04F4,	%g6
	ldx	[%l7 + 0x28],	%i2
	swap	[%l7 + 0x14],	%l0
	tleu	%xcc,	0x7
	ldd	[%l7 + 0x38],	%f26
	ldsh	[%l7 + 0x4A],	%g1
	nop
	set	0x38, %o2
	prefetch	[%l7 + %o2],	 0x1
	fornot1s	%f9,	%f18,	%f27
	rdpr	%tl,	%g2
	smul	%l4,	%i6,	%i3
	prefetch	[%l7 + 0x54],	 0x2
	ldsw	[%l7 + 0x0C],	%o3
	ldsb	[%l7 + 0x51],	%l5
	fmovsge	%icc,	%f18,	%f4
	ld	[%l7 + 0x4C],	%f21
	stbar
	stb	%o6,	[%l7 + 0x6E]
	ldsw	[%l7 + 0x3C],	%i4
	wr	%l3,	0x09B4,	%y
	ldx	[%l7 + 0x38],	%i1
	prefetch	[%l7 + 0x40],	 0x1
	st	%f9,	[%l7 + 0x6C]
	movg	%icc,	%o7,	%o4
	ld	[%l7 + 0x58],	%f12
	ldd	[%l7 + 0x08],	%i0
	lduw	[%l7 + 0x10],	%i7
	tsubcctv	%o2,	%g3,	%o0
	swap	[%l7 + 0x58],	%l1
	ld	[%l7 + 0x50],	%f30
	smulcc	%o1,	%g4,	%i5
	tpos	%icc,	0x7
	std	%f12,	[%l7 + 0x38]
	tg	%icc,	0x5
	srl	%l2,	%g7,	%o5
	stx	%l6,	[%l7 + 0x10]
	andncc	%g6,	%i2,	%g5
	ldub	[%l7 + 0x7D],	%l0
	fbul,a	%fcc1,	loop_34
	fnor	%f30,	%f10,	%f0
	std	%g0,	[%l7 + 0x08]
	ldub	[%l7 + 0x69],	%g2
loop_34:
	movrlz	%l4,	%i3,	%o3
	ldstub	[%l7 + 0x6C],	%l5
	taddcctv	%o6,	0x0839,	%i4
	ldsb	[%l7 + 0x20],	%l3
	stb	%i6,	[%l7 + 0x1C]
	ldsb	[%l7 + 0x62],	%i1
	ldsw	[%l7 + 0x70],	%o7
	fabss	%f14,	%f16
	membar	0x09
	sra	%i0,	%i7,	%o4
	ldsh	[%l7 + 0x76],	%g3
	ldub	[%l7 + 0x50],	%o2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %o6
	ldxa	[%g0 + %o6] 0x4f,	%o0
	popc	%l1,	%o1
	nop
	set	0x78, %g3
	std	%f10,	[%l7 + %g3]
	stx	%i5,	[%l7 + 0x28]
	sth	%l2,	[%l7 + 0x60]
	ldsw	[%l7 + 0x74],	%g4
	ldx	[%l7 + 0x58],	%g7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %l6
	ldxa	[%g0 + %l6] 0x20,	%l6
	tsubcctv	%g6,	%o5,	%i2
	ldd	[%l7 + 0x68],	%l0
	subc	%g5,	%g1,	%l4
	tvc	%xcc,	0x5
	udivcc	%i3,	0x0FE7,	%o3
	ta	%icc,	0x2
	std	%g2,	[%l7 + 0x60]
	ld	[%l7 + 0x1C],	%f6
	sdivcc	%o6,	0x0845,	%i4
	stx	%l3,	[%l7 + 0x60]
	movcc	%xcc,	%l5,	%i1
	fbge,a	%fcc0,	loop_35
	lduh	[%l7 + 0x7A],	%i6
	ble	loop_36
	brlz	%o7,	loop_37
loop_35:
	sth	%i0,	[%l7 + 0x66]
	nop
	set	0x57, %i2
	stb	%o4,	[%l7 + %i2]
loop_36:
	sir	0x0403
loop_37:
	ldd	[%l7 + 0x20],	%i6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %o1
	stxa	%o2,	[%g0 + %o1] 0x4f
	st	%f10,	[%l7 + 0x48]
	movcs	%xcc,	%g3,	%l1
	rdhpr	%htba,	%o0
	fmovdne	%icc,	%f16,	%f6
	sth	%o1,	[%l7 + 0x16]
	flush	%l7 + 0x40
	ldstub	[%l7 + 0x29],	%l2
	std	%f8,	[%l7 + 0x10]
	rdhpr	%hpstate,	%g4
	swap	[%l7 + 0x1C],	%i5
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%g7
	std	%g6,	[%l7 + 0x78]
	nop
	set	0x20, %g6
	std	%f4,	[%l7 + %g6]
	lduh	[%l7 + 0x16],	%l6
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%o4
	ldx	[%l7 + 0x48],	%l0
	ldub	[%l7 + 0x54],	%i2
	ldx	[%l7 + 0x18],	%g1
	lduh	[%l7 + 0x30],	%l4
	flush	%l7 + 0x58
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g5,	[%g0 + 0x30] %asi
	st	%f30,	[%l7 + 0x5C]
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i3
	lduw	[%l7 + 0x74],	%o3
	sth	%g2,	[%l7 + 0x38]
	swap	[%l7 + 0x78],	%o6
	ldsw	[%l7 + 0x5C],	%l3
	wrpr	%i4,	0x00FD,	%cwp
	ldstub	[%l7 + 0x39],	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %l3
	ldxa	[%g0 + %l3] 0x4f,	%i6
	lduh	[%l7 + 0x7C],	%o7
	ld	[%l7 + 0x30],	%f14
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%i1,	[%g0 + 0x20] %asi
	prefetch	[%l7 + 0x70],	 0x3
	ld	[%l7 + 0x58],	%f28
	flush	%l7 + 0x40
	ldsb	[%l7 + 0x5D],	%o4
	stb	%i7,	[%l7 + 0x1B]
	fxor	%f6,	%f16,	%f20
	subccc	%i0,	%g3,	%l1
	rdhpr	%hsys_tick_cmpr,	%o0
	ldd	[%l7 + 0x78],	%f20
	std	%o0,	[%l7 + 0x48]
	fxor	%f22,	%f16,	%f24
	nop
	setx	loop_38,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x1C],	%o2
	std	%f0,	[%l7 + 0x08]
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f4
loop_38:
	nop
	set	0x63, %o3
	stb	%l2,	[%l7 + %o3]
	stw	%g4,	[%l7 + 0x4C]
	subc	%g7,	%g6,	%l6
	nop
	set	0x6C, %i7
	ldsh	[%l7 + %i7],	%o5
	mulx	%l0,	0x04A1,	%i2
	std	%i4,	[%l7 + 0x20]
	wrpr	%g1,	0x0B0B,	%pil
	ldd	[%l7 + 0x38],	%f24
	fpadd16	%f2,	%f12,	%f20
	bg,a,pt	%icc,	loop_39
	ldsh	[%l7 + 0x7C],	%g5
	flush	%l7 + 0x3C
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %l5
	stxa	%l4,	[%g0 + %l5] 0x4f
loop_39:
	prefetch	[%l7 + 0x0C],	 0x1
	prefetch	[%l7 + 0x38],	 0x1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o0
	stxa	%o3,	[%g0 + %o0] 0x20
	lduh	[%l7 + 0x26],	%i3
	stb	%g2,	[%l7 + 0x5E]
	fnot2	%f24,	%f28
	nop
	setx	loop_40,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%o6,	%i4,	%l3
	fbu	%fcc0,	loop_41
	ldsh	[%l7 + 0x70],	%i6
loop_40:
	fmovrsgez	%o7,	%f9,	%f12
	stx	%l5,	[%l7 + 0x28]
loop_41:
	swap	[%l7 + 0x48],	%i1
	std	%f30,	[%l7 + 0x20]
	sth	%o4,	[%l7 + 0x22]
	ldsh	[%l7 + 0x7E],	%i0
	tcc	%xcc,	0x0
	ld	[%l7 + 0x3C],	%f16
	ldd	[%l7 + 0x38],	%f2
	rdhpr	%hintp,	%i7
	st	%f8,	[%l7 + 0x5C]
	stb	%l1,	[%l7 + 0x79]
	st	%f19,	[%l7 + 0x08]
	lduw	[%l7 + 0x60],	%g3
	nop
	set	0x60, %l0
	ldsw	[%l7 + %l0],	%o1
	lduh	[%l7 + 0x52],	%o2
	fnors	%f18,	%f13,	%f25
	lduh	[%l7 + 0x64],	%l2
	stx	%o0,	[%l7 + 0x50]
	movl	%xcc,	%g7,	%g4
	fmovscc	%xcc,	%f3,	%f29
	std	%i6,	[%l7 + 0x48]
	fmul8ulx16	%f2,	%f16,	%f26
	ldx	[%l7 + 0x38],	%g6
	ld	[%l7 + 0x50],	%f0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o5
	ldstub	[%l7 + 0x41],	%l0
	add	%i2,	0x132C,	%i5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %g1
	stxa	%g1,	[%g0 + %g1] 0x20
	ld	[%l7 + 0x28],	%f6
	ldx	[%l7 + 0x08],	%g5
	std	%l4,	[%l7 + 0x30]
	fbne	%fcc3,	loop_42
	ldd	[%l7 + 0x58],	%f12
	ldsh	[%l7 + 0x22],	%o3
	fmovde	%icc,	%f24,	%f20
loop_42:
	nop
	set	0x30, %l2
	std	%i2,	[%l7 + %l2]
	movrlz	%g2,	0x0D7,	%o6
	swap	[%l7 + 0x40],	%i4
	lduh	[%l7 + 0x3C],	%i6
	fbug	%fcc0,	loop_43
	std	%f8,	[%l7 + 0x08]
	rdhpr	%hpstate,	%l3
	ldsh	[%l7 + 0x22],	%o7
loop_43:
	fxor	%f0,	%f24,	%f30
	ld	[%l7 + 0x48],	%f17
	ldd	[%l7 + 0x78],	%i0
	nop
	set	0x11, %g2
	stb	%o4,	[%l7 + %g2]
	ldstub	[%l7 + 0x1F],	%i0
	swap	[%l7 + 0x44],	%l5
	fbne,a	%fcc1,	loop_44
	nop
	set	0x20, %i3
	ldx	[%l7 + %i3],	%i7
	fcmpne16	%f16,	%f14,	%g3
	movleu	%icc,	%o1,	%o2
loop_44:
	std	%l2,	[%l7 + 0x58]
	nop
	setx	loop_45,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%o0,	0x03,	%l1
	std	%f2,	[%l7 + 0x50]
	add	%g4,	%g7,	%l6
loop_45:
	st	%f28,	[%l7 + 0x74]
	ldd	[%l7 + 0x08],	%f10
	ldsw	[%l7 + 0x70],	%o5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x28] %asi
	rdhpr	%htba,	%l0
	swap	[%l7 + 0x50],	%i2
	fmovrslez	%g1,	%f16,	%f1
	ldx	[%l7 + 0x30],	%i5
	ldsh	[%l7 + 0x7C],	%g5
	bcc	loop_46
	movvc	%xcc,	%o3,	%l4
	lduh	[%l7 + 0x64],	%g2
	fmovdcs	%icc,	%f31,	%f25
loop_46:
	ldsh	[%l7 + 0x6E],	%o6
	std	%f16,	[%l7 + 0x70]
	xor	%i4,	0x1685,	%i3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l3
	lduh	[%l7 + 0x46],	%i6
	st	%f23,	[%l7 + 0x08]
	stw	%i1,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x50],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l4
	ldxa	[%g0 + %l4] 0x20,	%o7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	swap	[%l7 + 0x5C],	%l5
	udivx	%g3,	0x0817,	%o1
	ldsh	[%l7 + 0x24],	%l2
	ldsw	[%l7 + 0x30],	%o2
	fmuld8sux16	%f12,	%f28,	%f4
	stx	%l1,	[%l7 + 0x40]
	ld	[%l7 + 0x10],	%f31
	flush	%l7 + 0x44
	std	%g4,	[%l7 + 0x28]
	ldsb	[%l7 + 0x7B],	%g7
	andcc	%o0,	%o5,	%l6
	ldx	[%l7 + 0x40],	%g6
	ldsh	[%l7 + 0x44],	%i2
	ldsb	[%l7 + 0x2E],	%l0
	tge	%xcc,	0x1
	stbar
	movleu	%icc,	%g1,	%i5
	stx	%g5,	[%l7 + 0x48]
	mova	%icc,	%l4,	%o3
	ld	[%l7 + 0x1C],	%f10
	stw	%g2,	[%l7 + 0x74]
	ldub	[%l7 + 0x60],	%o6
	fxnor	%f8,	%f28,	%f16
	movcs	%xcc,	%i4,	%i3
	std	%i6,	[%l7 + 0x68]
	stx	%i1,	[%l7 + 0x38]
	ldsw	[%l7 + 0x10],	%l3
	ldub	[%l7 + 0x6D],	%o7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i0
	flush	%l7 + 0x70
	movrne	%o4,	%l5,	%i7
	fpadd32	%f20,	%f8,	%f16
	nop
	set	0x2C, %i1
	ldsh	[%l7 + %i1],	%g3
	lduh	[%l7 + 0x64],	%o1
	std	%l2,	[%l7 + 0x08]
	fornot1s	%f24,	%f4,	%f15
	stw	%l1,	[%l7 + 0x1C]
	ldub	[%l7 + 0x39],	%g4
	rdhpr	%hsys_tick_cmpr,	%o2
	stb	%g7,	[%l7 + 0x53]
	sth	%o5,	[%l7 + 0x4A]
	tvc	%icc,	0x5
	ldsh	[%l7 + 0x6E],	%l6
	ldsw	[%l7 + 0x48],	%o0
	flush	%l7 + 0x5C
	faligndata	%f8,	%f10,	%f10
	sth	%g6,	[%l7 + 0x1C]
	ldd	[%l7 + 0x28],	%l0
	wr	%g1,	0x01A9,	%set_softint
	ldd	[%l7 + 0x30],	%f28
	bpos,a	loop_47
	ldd	[%l7 + 0x70],	%f22
	swap	[%l7 + 0x34],	%i5
	stb	%g5,	[%l7 + 0x26]
loop_47:
	swap	[%l7 + 0x24],	%l4
	fmovsneg	%icc,	%f6,	%f30
	nop
	set	0x2F, %i0
	ldstub	[%l7 + %i0],	%o3
	edge8	%i2,	%o6,	%g2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l1
	ldxa	[%g0 + %l1] 0x20,	%i4
	nop
	set	0x41, %i6
	ldub	[%l7 + %i6],	%i6
	ldx	[%l7 + 0x40],	%i1
	fbu,a	%fcc1,	loop_48
	bge	loop_49
	fnot2	%f26,	%f2
	ba,a,pn	%icc,	loop_50
loop_48:
	stb	%i3,	[%l7 + 0x2B]
loop_49:
	fbn,a	%fcc3,	loop_51
	lduw	[%l7 + 0x74],	%l3
loop_50:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	nop
	set	0x8, %o5
	ldxa	[%g0 + %o5] 0x4f,	%i0
loop_51:
	sir	0x04CF
	fmovsl	%icc,	%f0,	%f11
	nop
	set	0x5C, %o7
	ldsh	[%l7 + %o7],	%o7
	ld	[%l7 + 0x34],	%f5
	prefetch	[%l7 + 0x28],	 0x1
	stx	%o4,	[%l7 + 0x78]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %i5
	ldxa	[%g0 + %i5] 0x20,	%i7
	fmovrsgz	%l5,	%f12,	%f10
	and	%o1,	%g3,	%l1
	ldd	[%l7 + 0x30],	%f12
	or	%g4,	%l2,	%g7
	movneg	%icc,	%o5,	%o2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o0
	ld	[%l7 + 0x54],	%f25
	std	%g6,	[%l7 + 0x38]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x11F, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x6A],	%g1
	std	%i6,	[%l7 + 0x50]
	nop
	setx loop_52, %l0, %l1
	jmpl %l1, %g5
	movn	%icc,	%i5,	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i2
loop_52:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	nop
	set	0x18, %g4
	ldxa	[%g0 + %g4] 0x20,	%o3
	ldsw	[%l7 + 0x78],	%o6
	lduh	[%l7 + 0x6C],	%g2
	nop
	set	0x49, %o2
	stb	%i4,	[%l7 + %o2]
	sth	%i6,	[%l7 + 0x6E]
	stx	%i1,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %g7
	ldxa	[%g0 + %g7] 0x4f,	%i3
	lduh	[%l7 + 0x68],	%i0
	st	%f18,	[%l7 + 0x64]
	stb	%o7,	[%l7 + 0x42]
	rdpr	%gl,	%l3
	flush	%l7 + 0x50
	array32	%o4,	%l5,	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g3
	tcc	%xcc,	0x0
	ldd	[%l7 + 0x50],	%f28
	fbuge,a	%fcc2,	loop_53
	nop
	set	0x2D, %o6
	ldub	[%l7 + %o6],	%o1
	swap	[%l7 + 0x0C],	%l1
	rdpr	%canrestore,	%g4
loop_53:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	nop
	set	0x30, %g3
	stxa	%l2,	[%g0 + %g3] 0x20
	ldx	[%l7 + 0x40],	%g7
	prefetch	[%l7 + 0x34],	 0x0
	call	loop_54
	nop
	set	0x60, %i2
	std	%o4,	[%l7 + %i2]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o0,	[%l7 + 0x58]
loop_54:
	swap	[%l7 + 0x44],	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l6
	stxa	%l0,	[%g0 + %l6] 0x20
	nop
	set	0x58, %o1
	ldsh	[%l7 + %o1],	%g1
	ldd	[%l7 + 0x78],	%g6
	fbule	%fcc2,	loop_55
	ldstub	[%l7 + 0x08],	%g5
	ldstub	[%l7 + 0x36],	%i5
	ldstub	[%l7 + 0x1A],	%l4
loop_55:
	taddcc	%l6,	0x1A2D,	%i2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %g6
	ldxa	[%g0 + %g6] 0x20,	%o3
	ldd	[%l7 + 0x60],	%f30
	stb	%o6,	[%l7 + 0x40]
	prefetch	[%l7 + 0x74],	 0x3
	flush	%l7 + 0x20
	tl	%xcc,	0x1
	ldsw	[%l7 + 0x20],	%i4
	flush	%l7 + 0x44
	st	%f10,	[%l7 + 0x30]
	std	%g2,	[%l7 + 0x18]
	ldd	[%l7 + 0x18],	%i0
	flush	%l7 + 0x68
	nop
	set	0x24, %g5
	ldsb	[%l7 + %g5],	%i3
	ldx	[%l7 + 0x30],	%i0
	nop
	set	0x40, %l3
	stx	%i6,	[%l7 + %l3]
	stb	%l3,	[%l7 + 0x2D]
	stbar
	std	%o6,	[%l7 + 0x08]
	ldstub	[%l7 + 0x11],	%o4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%i7,	[%g0 + 0x18] %asi
	lduh	[%l7 + 0x0C],	%l5
	std	%f0,	[%l7 + 0x58]
	sethi	0x0141,	%g3
	fcmped	%fcc3,	%f22,	%f0
	ldsw	[%l7 + 0x78],	%o1
	rdhpr	%hsys_tick_cmpr,	%g4
	ldsw	[%l7 + 0x74],	%l1
	xor	%l2,	%g7,	%o5
	fpack32	%f6,	%f16,	%f10
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %o4
	stxa	%o0,	[%g0 + %o4] 0x4f
	ldstub	[%l7 + 0x4A],	%o2
	std	%g0,	[%l7 + 0x08]
	stx	%g6,	[%l7 + 0x28]
	flushw
	stb	%l0,	[%l7 + 0x6B]
	lduw	[%l7 + 0x08],	%g5
	edge16n	%l4,	%i5,	%l6
	ldsw	[%l7 + 0x5C],	%o3
	movne	%icc,	%i2,	%o6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%g2,	[%g0 + 0x28] %asi
	or	%i1,	0x0EDD,	%i4
	flush	%l7 + 0x58
	ldstub	[%l7 + 0x22],	%i3
	tvs	%xcc,	0x2
	lduw	[%l7 + 0x44],	%i6
	tsubcctv	%i0,	%l3,	%o7
	flush	%l7 + 0x0C
	ldsh	[%l7 + 0x1C],	%i7
	ldx	[%l7 + 0x40],	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%g3,	[%g0 + 0x8] %asi
	edge8l	%o4,	%o1,	%g4
	ldsh	[%l7 + 0x6A],	%l1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i4
	stxa	%l2,	[%g0 + %i4] 0x20
	prefetch	[%l7 + 0x2C],	 0x0
	edge32	%g7,	%o5,	%o0
	alignaddr	%o2,	%g1,	%l0
	ldsw	[%l7 + 0x38],	%g5
	ldsh	[%l7 + 0x44],	%g6
	st	%f8,	[%l7 + 0x48]
	rdpr	%otherwin,	%i5
	fmul8x16au	%f13,	%f29,	%f0
	flush	%l7 + 0x60
	brlez	%l4,	loop_56
	nop
	set	0x58, %o3
	ldx	[%l7 + %o3],	%l6
	lduw	[%l7 + 0x70],	%i2
	ldd	[%l7 + 0x60],	%f6
loop_56:
	bg	loop_57
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%o3
	ldx	[%l7 + 0x60],	%o6
	umul	%g2,	0x1F6C,	%i4
loop_57:
	flush	%l7 + 0x40
	stb	%i3,	[%l7 + 0x2A]
	add	%i6,	%i0,	%l3
	wr	%g0,	0x0FE8,	%pcr
	sth	%i7,	[%l7 + 0x28]
	ldstub	[%l7 + 0x4E],	%l5
	sra	%i1,	%o4,	%o1
	ld	[%l7 + 0x38],	%f18
	flush	%l7 + 0x70
	ldsw	[%l7 + 0x3C],	%g4
	stx	%l1,	[%l7 + 0x50]
	prefetch	[%l7 + 0x38],	 0x1
	ldstub	[%l7 + 0x12],	%g3
	std	%f12,	[%l7 + 0x68]
	ldub	[%l7 + 0x0D],	%g7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o0
	stxa	%o5,	[%g0 + %o0] 0x20
	stx	%l2,	[%l7 + 0x58]
	ldsh	[%l7 + 0x0A],	%o2
	std	%g0,	[%l7 + 0x78]
	sth	%l0,	[%l7 + 0x38]
	ldd	[%l7 + 0x18],	%f4
	sth	%o0,	[%l7 + 0x62]
	udivx	%g5,	0x0B80,	%i5
	fornot1	%f26,	%f6,	%f28
	stb	%g6,	[%l7 + 0x19]
	prefetch	[%l7 + 0x10],	 0x0
	andcc	%l6,	0x10EB,	%i2
	stw	%o3,	[%l7 + 0x28]
	stx	%o6,	[%l7 + 0x58]
	ld	[%l7 + 0x60],	%f12
	ldstub	[%l7 + 0x63],	%g2
	move	%xcc,	%i4,	%l4
	swap	[%l7 + 0x68],	%i6
	fbn	%fcc3,	loop_58
	ldd	[%l7 + 0x68],	%f14
	std	%i2,	[%l7 + 0x48]
	edge32ln	%i0,	%l3,	%o7
loop_58:
	movge	%icc,	%i7,	%i1
	xorcc	%l5,	0x11FE,	%o1
	tpos	%xcc,	0x0
	flush	%l7 + 0x34
	lduh	[%l7 + 0x62],	%g4
	lduh	[%l7 + 0x76],	%l1
	std	%o4,	[%l7 + 0x58]
	ldd	[%l7 + 0x70],	%g6
	popc	0x0F85,	%o5
	lduw	[%l7 + 0x0C],	%g3
	wr 	%g0, 	0x6, 	%fprs
	tgu	%icc,	0x6
	bgu,a	%xcc,	loop_59
	nop
	set	0x38, %i7
	stx	%l2,	[%l7 + %i7]
	lduw	[%l7 + 0x3C],	%g1
	swap	[%l7 + 0x38],	%o0
loop_59:
	rd	%asi,	%l0
	flush	%l7 + 0x3C
	ldsb	[%l7 + 0x79],	%i5
	ldsw	[%l7 + 0x3C],	%g6
	edge16l	%l6,	%i2,	%g5
	fmovsge	%xcc,	%f15,	%f30
	ba,a,pn	%icc,	loop_60
	ldd	[%l7 + 0x68],	%f14
	ldsh	[%l7 + 0x3E],	%o3
	ta	%icc,	0x6
loop_60:
	stbar
	fbul,a	%fcc2,	loop_61
	movcs	%icc,	%o6,	%i4
	rdpr	%gl,	%g2
	lduh	[%l7 + 0x64],	%i6
loop_61:
	sll	%i3,	%i0,	%l4
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%o7
	stx	%l3,	[%l7 + 0x38]
	lduh	[%l7 + 0x6C],	%i7
	ldsh	[%l7 + 0x24],	%i1
	stx	%l5,	[%l7 + 0x10]
	st	%f19,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x26E, 	%hsys_tick_cmpr
	ldsb	[%l7 + 0x29],	%o1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l2
	stxa	%l1,	[%g0 + %l2] 0x20
	lduw	[%l7 + 0x58],	%o4
	movrlz	%o5,	%g3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x53],	%o2
	prefetch	[%l7 + 0x14],	 0x2
	std	%f20,	[%l7 + 0x38]
	st	%f27,	[%l7 + 0x28]
	fmovdge	%xcc,	%f26,	%f23
	tneg	%icc,	0x6
	swap	[%l7 + 0x2C],	%l2
	ld	[%l7 + 0x40],	%f4
	swap	[%l7 + 0x30],	%g1
	nop
	set	0x48, %l0
	stw	%o0,	[%l7 + %l0]
	nop
	set	0x20, %i3
	sth	%i5,	[%l7 + %i3]
	flush	%l7 + 0x64
	std	%f10,	[%l7 + 0x50]
	ldsw	[%l7 + 0x08],	%g6
	ldsb	[%l7 + 0x73],	%l0
	st	%f23,	[%l7 + 0x60]
	prefetch	[%l7 + 0x14],	 0x0
	tvc	%xcc,	0x6
	udivcc	%l6,	0x0001,	%i2
	fcmpeq32	%f24,	%f8,	%g5
	swap	[%l7 + 0x08],	%o3
	nop
	set	0x78, %l4
	std	%f10,	[%l7 + %l4]
	movvc	%xcc,	%i4,	%g2
	ldsh	[%l7 + 0x42],	%o6
	lduh	[%l7 + 0x30],	%i3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	stxa	%i0,	[%g0 + 0x28] %asi
	smulcc	%l4,	%i6,	%l3
	ldd	[%l7 + 0x50],	%i6
	stw	%o7,	[%l7 + 0x4C]
	lduh	[%l7 + 0x60],	%l5
	st	%f3,	[%l7 + 0x2C]
	st	%f17,	[%l7 + 0x2C]
	stb	%i1,	[%l7 + 0x28]
	tge	%icc,	0x0
	bvc,pt	%icc,	loop_62
	sth	%g4,	[%l7 + 0x6C]
	st	%f15,	[%l7 + 0x3C]
	tneg	%xcc,	0x2
loop_62:
	fcmple16	%f16,	%f26,	%o1
	lduh	[%l7 + 0x5A],	%l1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o4
	stx	%g3,	[%l7 + 0x48]
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%f30
	ldx	[%l7 + 0x08],	%g7
	udivx	%o2,	0x099E,	%o5
	std	%f24,	[%l7 + 0x18]
	bvs,a,pn	%xcc,	loop_63
	ldsw	[%l7 + 0x34],	%g1
	ldx	[%l7 + 0x20],	%l2
	flush	%l7 + 0x70
loop_63:
	lduh	[%l7 + 0x22],	%o0
	alignaddrl	%i5,	%g6,	%l0
	srlx	%i2,	0x09,	%l6
	stw	%g5,	[%l7 + 0x44]
	andcc	%o3,	0x1E59,	%i4
	stbar
	tsubcc	%g2,	%o6,	%i3
	ldd	[%l7 + 0x30],	%i0
	fbug,a	%fcc0,	loop_64
	nop
	set	0x18, %i1
	std	%f22,	[%l7 + %i1]
	st	%f25,	[%l7 + 0x78]
	stbar
loop_64:
	ldd	[%l7 + 0x40],	%l4
	ldd	[%l7 + 0x60],	%i6
	lduh	[%l7 + 0x7C],	%l3
	swap	[%l7 + 0x4C],	%i7
	ldx	[%l7 + 0x10],	%l5
	nop
	set	0x60, %l1
	lduh	[%l7 + %l1],	%o7
	fbuge	%fcc1,	loop_65
	stw	%g4,	[%l7 + 0x34]
	std	%o0,	[%l7 + 0x20]
	alignaddr	%i1,	%o4,	%g3
loop_65:
	stw	%l1,	[%l7 + 0x2C]
	sth	%o2,	[%l7 + 0x26]
	ldsh	[%l7 + 0x14],	%o5
	std	%g6,	[%l7 + 0x40]
	std	%g0,	[%l7 + 0x48]
	sth	%l2,	[%l7 + 0x76]
	mulscc	%i5,	0x1845,	%g6
	ldd	[%l7 + 0x60],	%o0
	fmovrsne	%i2,	%f24,	%f4
	nop
	set	0x58, %i6
	ldsw	[%l7 + %i6],	%l6
	ldd	[%l7 + 0x60],	%l0
	ldub	[%l7 + 0x59],	%g5
	std	%f28,	[%l7 + 0x18]
	ldx	[%l7 + 0x38],	%i4
	ldub	[%l7 + 0x7F],	%o3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o6
	ldsb	[%l7 + 0x1F],	%g2
	fbe,a	%fcc3,	loop_66
	lduw	[%l7 + 0x28],	%i0
	fmovsle	%xcc,	%f9,	%f6
	movrne	%l4,	%i6,	%l3
loop_66:
	ba	%icc,	loop_67
	orn	%i7,	%l5,	%o7
	ldstub	[%l7 + 0x42],	%i3
	swap	[%l7 + 0x30],	%o1
loop_67:
	edge16l	%i1,	%g4,	%g3
	nop
	set	0x70, %o5
	sth	%l1,	[%l7 + %o5]
	stw	%o2,	[%l7 + 0x24]
	wrpr	%o5,	0x071E,	%tick
	nop
	setx loop_68, %l0, %l1
	jmpl %l1, %g7
	fbe	%fcc2,	loop_69
	or	%o4,	%g1,	%l2
	mulx	%g6,	%o0,	%i2
loop_68:
	udivx	%i5,	0x00AE,	%l6
loop_69:
	std	%f10,	[%l7 + 0x10]
	tleu	%icc,	0x6
	array16	%g5,	%l0,	%o3
	st	%f25,	[%l7 + 0x58]
	stbar
	ldd	[%l7 + 0x58],	%i4
	lduh	[%l7 + 0x4A],	%o6
	sth	%g2,	[%l7 + 0x26]
	std	%l4,	[%l7 + 0x18]
	prefetch	[%l7 + 0x40],	 0x2
	lduw	[%l7 + 0x58],	%i6
	movpos	%icc,	%i0,	%i7
	rdhpr	%hsys_tick_cmpr,	%l5
	lduw	[%l7 + 0x18],	%l3
	ldstub	[%l7 + 0x49],	%o7
	ldd	[%l7 + 0x50],	%f2
	ldx	[%l7 + 0x30],	%o1
	ldd	[%l7 + 0x20],	%i0
	ldstub	[%l7 + 0x23],	%i3
	ldsb	[%l7 + 0x25],	%g4
	std	%g2,	[%l7 + 0x48]
	nop
	set	0x5C, %o7
	stb	%l1,	[%l7 + %o7]
	nop
	set	0x72, %i5
	ldstub	[%l7 + %i5],	%o5
	nop
	set	0x66, %g4
	lduh	[%l7 + %g4],	%g7
	std	%o4,	[%l7 + 0x18]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%o2,	[%g0 + 0x20] %asi
	ldx	[%l7 + 0x08],	%l2
	lduh	[%l7 + 0x32],	%g6
	nop
	set	0x1E, %i0
	stb	%o0,	[%l7 + %i0]
	brgez,a	%g1,	loop_70
	stx	%i2,	[%l7 + 0x10]
	stw	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x60],	%f1
loop_70:
	std	%i4,	[%l7 + 0x18]
	ldsw	[%l7 + 0x18],	%l0
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%o3
	ldsh	[%l7 + 0x7E],	%g5
	ldstub	[%l7 + 0x7F],	%i4
	swap	[%l7 + 0x50],	%o6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x646, 	%hsys_tick_cmpr
	ldsw	[%l7 + 0x5C],	%i6
	popc	%i0,	%l4
	fors	%f29,	%f31,	%f19
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g7
	stxa	%i7,	[%g0 + %g7] 0x4f
	edge16n	%l5,	%o7,	%l3
	lduw	[%l7 + 0x14],	%i1
	std	%f20,	[%l7 + 0x40]
	std	%i2,	[%l7 + 0x40]
	ldsb	[%l7 + 0x41],	%g4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o6
	ldxa	[%g0 + %o6] 0x20,	%o1
	st	%f4,	[%l7 + 0x38]
	sth	%g3,	[%l7 + 0x70]
	sth	%l1,	[%l7 + 0x4E]
	edge32n	%o5,	%o4,	%g7
	ldsw	[%l7 + 0x1C],	%l2
	ldub	[%l7 + 0x43],	%o2
	ldub	[%l7 + 0x61],	%o0
	prefetch	[%l7 + 0x5C],	 0x1
	nop
	set	0x28, %i2
	std	%g6,	[%l7 + %i2]
	ldsh	[%l7 + 0x48],	%i2
	lduh	[%l7 + 0x12],	%g1
	stb	%l6,	[%l7 + 0x4C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l0
	flush	%l7 + 0x50
	ldd	[%l7 + 0x40],	%o2
	stw	%g5,	[%l7 + 0x44]
	std	%i4,	[%l7 + 0x60]
	ldsw	[%l7 + 0x24],	%o6
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%i4
	tneg	%icc,	0x1
	lduh	[%l7 + 0x62],	%i6
	rd	%fprs,	%i0
	stbar
	fand	%f22,	%f8,	%f10
	bgu,a,pn	%xcc,	loop_71
	rdpr	%canrestore,	%g2
	fbg	%fcc2,	loop_72
	lduw	[%l7 + 0x18],	%l4
loop_71:
	edge8l	%i7,	%o7,	%l3
	rdhpr	%hpstate,	%l5
loop_72:
	bleu,pt	%xcc,	loop_73
	nop
	set	0x60, %o1
	ldsw	[%l7 + %o1],	%i3
	stb	%i1,	[%l7 + 0x47]
	prefetch	[%l7 + 0x44],	 0x1
loop_73:
	stbar
	stb	%g4,	[%l7 + 0x6E]
	movge	%xcc,	%o1,	%l1
	sth	%o5,	[%l7 + 0x38]
	nop
	set	0x40, %g6
	lduh	[%l7 + %g6],	%g3
	lduh	[%l7 + 0x74],	%g7
	ldub	[%l7 + 0x3F],	%o4
	alignaddrl	%o2,	%l2,	%g6
	prefetch	[%l7 + 0x2C],	 0x2
	std	%f24,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g5
	stxa	%o0,	[%g0 + %g5] 0x20
	nop
	setx loop_74, %l0, %l1
	jmpl %l1, %i2
	ldd	[%l7 + 0x78],	%f16
	st	%f2,	[%l7 + 0x14]
	nop
	set	0x74, %l6
	lduh	[%l7 + %l6],	%g1
loop_74:
	tl	%icc,	0x7
	udivx	%l6,	0x07F3,	%l0
	fnegs	%f29,	%f29
	ldsw	[%l7 + 0x14],	%g5
	prefetch	[%l7 + 0x70],	 0x3
	ld	[%l7 + 0x50],	%f8
	fmovrdlz	%o3,	%f2,	%f30
	stw	%o6,	[%l7 + 0x28]
	tg	%xcc,	0x2
	flush	%l7 + 0x60
	lduw	[%l7 + 0x14],	%i4
	taddcctv	%i5,	0x1C7D,	%i0
	stbar
	movgu	%icc,	%i6,	%g2
	swap	[%l7 + 0x50],	%i7
	sth	%l4,	[%l7 + 0x44]
	std	%f14,	[%l7 + 0x30]
	stx	%l3,	[%l7 + 0x78]
	stb	%o7,	[%l7 + 0x0F]
	lduw	[%l7 + 0x20],	%l5
	ldsh	[%l7 + 0x58],	%i3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o4
	stxa	%i1,	[%g0 + %o4] 0x20
	ldub	[%l7 + 0x0E],	%g4
	brnz,a	%o1,	loop_75
	nop
	set	0x6C, %l3
	ldstub	[%l7 + %l3],	%o5
	nop
	set	0x15, %o3
	ldstub	[%l7 + %o3],	%g3
	ldsh	[%l7 + 0x5E],	%g7
loop_75:
	brlz,a	%l1,	loop_76
	nop
	setx	loop_77,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x68],	%f31
	sth	%o4,	[%l7 + 0x5A]
loop_76:
	std	%l2,	[%l7 + 0x38]
loop_77:
	fmovrsgez	%g6,	%f25,	%f25
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x20] %asi
	popc	0x0C30,	%o2
	stx	%g1,	[%l7 + 0x70]
	ldx	[%l7 + 0x68],	%i2
	ldd	[%l7 + 0x70],	%l0
	nop
	set	0x11, %i4
	ldub	[%l7 + %i4],	%g5
	ldd	[%l7 + 0x10],	%i6
	stb	%o6,	[%l7 + 0x13]
	std	%o2,	[%l7 + 0x78]
	ldd	[%l7 + 0x40],	%f14
	ldsh	[%l7 + 0x4A],	%i4
	fone	%f14
	stbar
	stbar
	lduh	[%l7 + 0x7C],	%i0
	nop
	set	0x54, %o0
	lduw	[%l7 + %o0],	%i5
	ldsh	[%l7 + 0x0A],	%g2
	sth	%i6,	[%l7 + 0x64]
	fbg	%fcc3,	loop_78
	ldsh	[%l7 + 0x18],	%i7
	sth	%l3,	[%l7 + 0x5C]
	stbar
loop_78:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	nop
	set	0x8, %l5
	stxa	%o7,	[%g0 + %l5] 0x20
	addc	%l4,	0x1496,	%l5
	swap	[%l7 + 0x58],	%i1
	ldsw	[%l7 + 0x68],	%g4
	ldx	[%l7 + 0x50],	%i3
	stx	%o1,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %g1
	stxa	%g3,	[%g0 + %g1] 0x4f
	stx	%g7,	[%l7 + 0x68]
	lduh	[%l7 + 0x44],	%o5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l1
	lduw	[%l7 + 0x48],	%o4
	ldsb	[%l7 + 0x28],	%l2
	ldx	[%l7 + 0x68],	%g6
	ldsw	[%l7 + 0x24],	%o0
	stb	%o2,	[%l7 + 0x7E]
	ta	%xcc,	0x5
	fbge,a	%fcc3,	loop_79
	fabss	%f19,	%f3
	stb	%g1,	[%l7 + 0x11]
	fmovrse	%i2,	%f4,	%f15
loop_79:
	membar	0x08
	stbar
	nop
	set	0x08, %i7
	std	%g4,	[%l7 + %i7]
	ld	[%l7 + 0x54],	%f24
	flush	%l7 + 0x20
	lduw	[%l7 + 0x74],	%l0
	lduh	[%l7 + 0x3A],	%o6
	bleu,a	%xcc,	loop_80
	ba,a,pn	%icc,	loop_81
	ldsb	[%l7 + 0x73],	%o3
	stb	%l6,	[%l7 + 0x49]
loop_80:
	tpos	%xcc,	0x4
loop_81:
	ldd	[%l7 + 0x48],	%f2
	sth	%i0,	[%l7 + 0x4C]
	sdivx	%i5,	0x08EF,	%i4
	nop
	set	0x24, %l0
	sth	%g2,	[%l7 + %l0]
	lduw	[%l7 + 0x54],	%i7
	ldsw	[%l7 + 0x28],	%i6
	rd	%y,	%o7
	edge8	%l4,	%l3,	%l5
	edge32n	%g4,	%i1,	%o1
	andn	%i3,	%g3,	%o5
	std	%f18,	[%l7 + 0x48]
	swap	[%l7 + 0x64],	%g7
	move	%icc,	%l1,	%o4
	ldsb	[%l7 + 0x4A],	%l2
	lduw	[%l7 + 0x24],	%g6
	sth	%o0,	[%l7 + 0x4A]
	fmovrdlz	%o2,	%f22,	%f22
	nop
	set	0x7E, %l2
	lduh	[%l7 + %l2],	%g1
	fmovsge	%xcc,	%f27,	%f11
	st	%f25,	[%l7 + 0x60]
	prefetch	[%l7 + 0x54],	 0x2
	flush	%l7 + 0x64
	stb	%g5,	[%l7 + 0x36]
	wr	%g0,	0x0B5B,	%pcr
	ldsw	[%l7 + 0x64],	%l0
	lduh	[%l7 + 0x3C],	%o6
	stx	%o3,	[%l7 + 0x58]
	ldd	[%l7 + 0x70],	%i6
	udivcc	%i5,	0x0647,	%i0
	movre	%g2,	%i7,	%i4
	ldub	[%l7 + 0x13],	%i6
	ldstub	[%l7 + 0x60],	%o7
	ldsb	[%l7 + 0x41],	%l4
	rd	%fprs,	%l5
	ld	[%l7 + 0x08],	%f5
	flush	%l7 + 0x10
	ldx	[%l7 + 0x38],	%l3
	ldsw	[%l7 + 0x70],	%g4
	ldsh	[%l7 + 0x44],	%o1
	taddcc	%i3,	0x0E0C,	%i1
	ldsw	[%l7 + 0x0C],	%o5
	fmuld8ulx16	%f17,	%f7,	%f24
	st	%f26,	[%l7 + 0x18]
	sth	%g7,	[%l7 + 0x46]
	stb	%l1,	[%l7 + 0x6A]
	fmul8ulx16	%f4,	%f0,	%f16
	prefetch	[%l7 + 0x60],	 0x2
	ldsw	[%l7 + 0x08],	%g3
	stb	%l2,	[%l7 + 0x41]
	swap	[%l7 + 0x54],	%g6
	ldsb	[%l7 + 0x2A],	%o0
	std	%o4,	[%l7 + 0x70]
	fmovrse	%g1,	%f30,	%f27
	fmovdneg	%xcc,	%f6,	%f26
	fpadd16	%f22,	%f16,	%f4
	sth	%g5,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x38],	%i2
	fmul8x16	%f23,	%f8,	%f2
	ld	[%l7 + 0x34],	%f21
	ldx	[%l7 + 0x58],	%o2
	ldd	[%l7 + 0x60],	%o6
	fmovsge	%icc,	%f3,	%f28
	fmovsleu	%xcc,	%f24,	%f29
	stb	%o3,	[%l7 + 0x74]
	movle	%xcc,	%l6,	%l0
	lduw	[%l7 + 0x7C],	%i0
	stx	%i5,	[%l7 + 0x08]
	tvs	%xcc,	0x6
	ldsh	[%l7 + 0x18],	%i7
	stbar
	wr	%i4,	0x0189,	%pic
	ldstub	[%l7 + 0x0F],	%i6
	ldd	[%l7 + 0x68],	%f30
	sth	%g2,	[%l7 + 0x10]
	ldsb	[%l7 + 0x55],	%l4
	tcs	%icc,	0x4
	ldd	[%l7 + 0x60],	%o6
	flush	%l7 + 0x44
	fmovdleu	%xcc,	%f12,	%f16
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%l3,	[%g0 + 0x38] %asi
	sth	%g4,	[%l7 + 0x2C]
	ld	[%l7 + 0x34],	%f5
	membar	0x22
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o1
	std	%f8,	[%l7 + 0x58]
	stb	%l5,	[%l7 + 0x58]
	stx	%i3,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %i3
	ldxa	[%g0 + %i3] 0x4f,	%i1
	ldx	[%l7 + 0x28],	%o5
	tge	%icc,	0x5
	xnorcc	%l1,	0x0FDC,	%g7
	tleu	%xcc,	0x4
	stb	%g3,	[%l7 + 0x11]
	std	%f14,	[%l7 + 0x08]
	fpadd16s	%f12,	%f19,	%f24
	std	%g6,	[%l7 + 0x18]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %g2
	stxa	%o0,	[%g0 + %g2] 0x4f
	ld	[%l7 + 0x30],	%f14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x440, 	%hsys_tick_cmpr
	wr	%g5,	0x0B56,	%pic
	rdhpr	%htba,	%g1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %l4
	ldxa	[%g0 + %l4] 0x20,	%i2
	movpos	%icc,	%o2,	%o3
	ldsw	[%l7 + 0x08],	%o6
	st	%f14,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x24],	%l0
	movrlz	%l6,	0x3AC,	%i5
	tg	%xcc,	0x7
	stb	%i7,	[%l7 + 0x2B]
	fandnot2	%f26,	%f22,	%f30
	sethi	0x0434,	%i0
	stbar
	std	%f0,	[%l7 + 0x70]
	fblg,a	%fcc3,	loop_82
	ldd	[%l7 + 0x08],	%f10
	ldd	[%l7 + 0x18],	%f28
	prefetch	[%l7 + 0x74],	 0x3
loop_82:
	tn	%xcc,	0x7
	xorcc	%i6,	0x1D04,	%g2
	nop
	set	0x34, %l1
	lduh	[%l7 + %l1],	%i4
	lduh	[%l7 + 0x10],	%o7
	lduw	[%l7 + 0x30],	%l3
	swap	[%l7 + 0x74],	%g4
	wr	%o1,	0x1EC5,	%set_softint
	prefetch	[%l7 + 0x60],	 0x3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l4
	ldsb	[%l7 + 0x43],	%l5
	ldx	[%l7 + 0x10],	%i1
	prefetch	[%l7 + 0x0C],	 0x3
	ld	[%l7 + 0x6C],	%f19
	orn	%o5,	%i3,	%g7
	ldd	[%l7 + 0x48],	%g2
	movvc	%xcc,	%g6,	%o0
	flush	%l7 + 0x7C
	wr 	%g0, 	0x7, 	%fprs
	fbg	%fcc1,	loop_83
	tg	%icc,	0x2
	ldstub	[%l7 + 0x10],	%l2
	tl	%icc,	0x7
loop_83:
	sth	%o4,	[%l7 + 0x0C]
	stw	%g1,	[%l7 + 0x28]
	edge32	%g5,	%o2,	%i2
	ldsw	[%l7 + 0x6C],	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	flushw
	srax	%l6,	0x17,	%i5
	ldsw	[%l7 + 0x50],	%o6
	bl	loop_84
	stx	%i7,	[%l7 + 0x20]
	flush	%l7 + 0x34
	lduh	[%l7 + 0x32],	%i6
loop_84:
	ldsw	[%l7 + 0x48],	%g2
	nop
	set	0x30, %i1
	std	%i0,	[%l7 + %i1]
	bneg,pt	%xcc,	loop_85
	rdpr	%cleanwin,	%i4
	fsrc1	%f28,	%f14
	edge32n	%o7,	%g4,	%o1
loop_85:
	stbar
	stb	%l3,	[%l7 + 0x47]
	lduh	[%l7 + 0x4C],	%l5
	nop
	set	0x40, %o5
	stx	%i1,	[%l7 + %o5]
	movvc	%icc,	%l4,	%i3
	lduw	[%l7 + 0x7C],	%o5
	lduh	[%l7 + 0x4A],	%g3
	tsubcctv	%g6,	0x10B1,	%g7
	movrne	%l1,	0x370,	%o0
	ldd	[%l7 + 0x68],	%o4
	stx	%l2,	[%l7 + 0x08]
	membar	0x16
	lduw	[%l7 + 0x60],	%g1
	ldd	[%l7 + 0x78],	%f0
	sth	%g5,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x3C],	%i2
	bl,pn	%icc,	loop_86
	tn	%xcc,	0x3
	ldsh	[%l7 + 0x30],	%o2
	array32	%o3,	%l6,	%l0
loop_86:
	sth	%i5,	[%l7 + 0x46]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%o6,	[%g0 + 0x20] %asi
	ldub	[%l7 + 0x53],	%i6
	std	%g2,	[%l7 + 0x50]
	ldub	[%l7 + 0x52],	%i0
	ldsb	[%l7 + 0x08],	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o7,	%i4,	%g4
	lduw	[%l7 + 0x3C],	%o1
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f22
	andncc	%l5,	%l3,	%i1
	ldsb	[%l7 + 0x4D],	%l4
	ldd	[%l7 + 0x40],	%i2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%g3,	[%g0 + 0x28] %asi
	lduh	[%l7 + 0x0E],	%g6
	fbn,a	%fcc2,	loop_87
	fnegd	%f28,	%f4
	st	%f19,	[%l7 + 0x18]
	sth	%o5,	[%l7 + 0x54]
loop_87:
	fpadd32s	%f29,	%f0,	%f28
	sth	%l1,	[%l7 + 0x60]
	lduh	[%l7 + 0x40],	%o0
	stbar
	nop
	setx	loop_88,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x10],	%f24
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i5
	ldxa	[%g0 + %i5] 0x20,	%g7
loop_88:
	ldsb	[%l7 + 0x69],	%o4
	ldd	[%l7 + 0x28],	%g0
	ldd	[%l7 + 0x08],	%g4
	sth	%i2,	[%l7 + 0x4C]
	stb	%o2,	[%l7 + 0x67]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o3,	%l2
	orcc	%l0,	0x1EC0,	%l6
	movneg	%icc,	%o6,	%i5
	std	%f22,	[%l7 + 0x08]
	ldd	[%l7 + 0x78],	%f30
	stw	%g2,	[%l7 + 0x2C]
	ldstub	[%l7 + 0x18],	%i0
	udivcc	%i6,	0x1112,	%o7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %g4
	stxa	%i7,	[%g0 + %g4] 0x4f
	fpsub32	%f4,	%f8,	%f30
	lduw	[%l7 + 0x4C],	%g4
	fmovse	%icc,	%f12,	%f13
	stbar
	flush	%l7 + 0x24
	std	%o0,	[%l7 + 0x70]
	ldd	[%l7 + 0x20],	%i4
	fpmerge	%f31,	%f29,	%f22
	stbar
	ldsb	[%l7 + 0x40],	%l3
	tgu	%icc,	0x3
	swap	[%l7 + 0x3C],	%l5
	st	%f19,	[%l7 + 0x68]
	ldstub	[%l7 + 0x57],	%l4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %i6
	ldxa	[%g0 + %i6] 0x4f,	%i1
	ldstub	[%l7 + 0x0F],	%g3
	fmovspos	%icc,	%f0,	%f9
	ldstub	[%l7 + 0x66],	%i3
	udivcc	%g6,	0x18BE,	%o5
	nop
	set	0x10, %o2
	std	%o0,	[%l7 + %o2]
	edge32l	%g7,	%o4,	%l1
	ldx	[%l7 + 0x30],	%g1
	stbar
	ldub	[%l7 + 0x34],	%i2
	addcc	%o2,	%o3,	%g5
	ldstub	[%l7 + 0x2C],	%l0
	fmul8x16au	%f0,	%f22,	%f10
	ldsh	[%l7 + 0x18],	%l2
	st	%f9,	[%l7 + 0x7C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %i0
	ldxa	[%g0 + %i0] 0x4f,	%o6
	sra	%l6,	0x10,	%i5
	ldsh	[%l7 + 0x4A],	%g2
	std	%f6,	[%l7 + 0x78]
	flush	%l7 + 0x40
	lduw	[%l7 + 0x10],	%i0
	nop
	set	0x38, %g7
	std	%i6,	[%l7 + %g7]
	ldx	[%l7 + 0x68],	%i7
	bneg,pt	%icc,	loop_89
	std	%f2,	[%l7 + 0x10]
	sth	%g4,	[%l7 + 0x54]
	tgu	%xcc,	0x1
loop_89:
	edge32	%o7,	%o1,	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l3
	prefetch	[%l7 + 0x50],	 0x1
	stbar
	ldsh	[%l7 + 0x64],	%l4
	lduh	[%l7 + 0x50],	%i1
	ld	[%l7 + 0x10],	%f13
	fmovdvc	%icc,	%f26,	%f24
	ld	[%l7 + 0x2C],	%f1
	fmovscs	%xcc,	%f1,	%f26
	ld	[%l7 + 0x2C],	%f0
	ldsh	[%l7 + 0x68],	%l5
	ldx	[%l7 + 0x70],	%g3
	fbg	%fcc2,	loop_90
	stx	%g6,	[%l7 + 0x38]
	stbar
	fmuld8ulx16	%f18,	%f4,	%f28
loop_90:
	stw	%i3,	[%l7 + 0x28]
	stw	%o5,	[%l7 + 0x40]
	ldstub	[%l7 + 0x1D],	%g7
	ldsh	[%l7 + 0x4A],	%o4
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%l1
	swap	[%l7 + 0x44],	%g1
	ldsb	[%l7 + 0x31],	%i2
	fbge,a	%fcc2,	loop_91
	mulscc	%o2,	0x0A81,	%o0
	stb	%g5,	[%l7 + 0x33]
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f10
loop_91:
	edge8l	%o3,	%l2,	%o6
	alignaddrl	%l0,	%l6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i0,	%i5,	%i7
	st	%f29,	[%l7 + 0x08]
	prefetch	[%l7 + 0x6C],	 0x0
	fmovsg	%icc,	%f21,	%f8
	flush	%l7 + 0x38
	fbe	%fcc2,	loop_92
	sth	%i6,	[%l7 + 0x44]
	nop
	set	0x53, %o1
	ldsb	[%l7 + %o1],	%g4
	stbar
loop_92:
	std	%f10,	[%l7 + 0x78]
	flush	%l7 + 0x40
	movgu	%xcc,	%o7,	%o1
	stb	%l3,	[%l7 + 0x0F]
	st	%f6,	[%l7 + 0x64]
	tgu	%icc,	0x6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%l4,	[%g0 + 0x8] %asi
	lduw	[%l7 + 0x64],	%i1
	umul	%l5,	0x074F,	%g3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %g3
	stxa	%i4,	[%g0 + %g3] 0x4f
	prefetch	[%l7 + 0x28],	 0x0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %g6
	stxa	%i3,	[%g0 + %g6] 0x4f
	flush	%l7 + 0x10
	ldsh	[%l7 + 0x50],	%g6
	edge32n	%o5,	%g7,	%l1
	ldub	[%l7 + 0x1A],	%o4
	ld	[%l7 + 0x0C],	%f22
	ldub	[%l7 + 0x51],	%i2
	ldstub	[%l7 + 0x3C],	%g1
	stx	%o2,	[%l7 + 0x78]
	wrpr	%g5,	%o3,	%cwp
	sub	%o0,	0x17B0,	%l2
	ldstub	[%l7 + 0x45],	%l0
	st	%f9,	[%l7 + 0x08]
	stbar
	ldd	[%l7 + 0x68],	%f26
	lduh	[%l7 + 0x58],	%l6
	fsrc1	%f12,	%f16
	ldsh	[%l7 + 0x76],	%g2
	lduh	[%l7 + 0x44],	%i0
	ldsw	[%l7 + 0x64],	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i7,	[%l7 + 0x64]
	lduw	[%l7 + 0x30],	%i6
	ta	%icc,	0x2
	nop
	setx loop_93, %l0, %l1
	jmpl %l1, %g4
	subccc	%o7,	0x0789,	%i5
	lduh	[%l7 + 0x0E],	%l3
	st	%f4,	[%l7 + 0x50]
loop_93:
	lduh	[%l7 + 0x76],	%l4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x20] %asi
	movleu	%xcc,	%i1,	%g3
	nop
	set	0x34, %g5
	ldstub	[%l7 + %g5],	%l5
	flushw
	lduh	[%l7 + 0x70],	%i4
	ldstub	[%l7 + 0x2F],	%g6
	bgu,pn	%icc,	loop_94
	flush	%l7 + 0x28
	nop
	set	0x70, %o4
	stx	%o5,	[%l7 + %o4]
	nop
	set	0x6D, %l3
	ldub	[%l7 + %l3],	%g7
loop_94:
	ldd	[%l7 + 0x18],	%i2
	ldd	[%l7 + 0x20],	%f2
	fpadd32s	%f4,	%f17,	%f26
	swap	[%l7 + 0x70],	%l1
	sth	%o4,	[%l7 + 0x0C]
	lduw	[%l7 + 0x2C],	%i2
	stb	%g1,	[%l7 + 0x70]
	ldub	[%l7 + 0x33],	%g5
	ldd	[%l7 + 0x20],	%o2
	sdiv	%o0,	0x1A58,	%o2
	alignaddrl	%l0,	%l6,	%g2
	ldsb	[%l7 + 0x40],	%i0
	st	%f29,	[%l7 + 0x44]
	std	%f0,	[%l7 + 0x30]
	ld	[%l7 + 0x18],	%f18
	swap	[%l7 + 0x28],	%l2
	ldd	[%l7 + 0x60],	%f14
	fmovrdne	%o6,	%f2,	%f20
	sth	%i7,	[%l7 + 0x22]
	fmovde	%icc,	%f24,	%f28
	tle	%xcc,	0x7
	lduw	[%l7 + 0x58],	%g4
	stx	%o7,	[%l7 + 0x18]
	stb	%i6,	[%l7 + 0x2B]
	ldstub	[%l7 + 0x1F],	%i5
	ldd	[%l7 + 0x68],	%f4
	st	%f0,	[%l7 + 0x5C]
	ld	[%l7 + 0x58],	%f4
	stb	%l3,	[%l7 + 0x33]
	st	%f21,	[%l7 + 0x18]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %o3
	stxa	%o1,	[%g0 + %o3] 0x4f
	flush	%l7 + 0x5C
	sth	%l4,	[%l7 + 0x1E]
	ldstub	[%l7 + 0x21],	%i1
	ldsb	[%l7 + 0x2D],	%l5
	flush	%l7 + 0x60
	movge	%xcc,	%g3,	%i4
	tvc	%icc,	0x3
	sth	%g6,	[%l7 + 0x50]
	std	%f18,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o5
	swap	[%l7 + 0x44],	%g7
	tle	%icc,	0x5
	udiv	%l1,	0x06BE,	%i3
	fmovsa	%xcc,	%f25,	%f15
	flush	%l7 + 0x4C
	fmovrsgez	%i2,	%f2,	%f29
	mova	%icc,	%g1,	%o4
	ldd	[%l7 + 0x10],	%g4
	movle	%xcc,	%o0,	%o2
	umulcc	%o3,	%l6,	%g2
	edge32ln	%i0,	%l0,	%o6
	std	%f26,	[%l7 + 0x28]
	udiv	%i7,	0x15E0,	%l2
	stx	%o7,	[%l7 + 0x78]
	flush	%l7 + 0x0C
	bge,pn	%xcc,	loop_95
	xnorcc	%i6,	%i5,	%g4
	ldd	[%l7 + 0x38],	%f16
	ldx	[%l7 + 0x38],	%o1
loop_95:
	nop
	set	0x32, %i4
	lduh	[%l7 + %i4],	%l4
	lduw	[%l7 + 0x48],	%l3
	ldsh	[%l7 + 0x72],	%i1
	fble,a	%fcc1,	loop_96
	lduh	[%l7 + 0x22],	%l5
	movle	%xcc,	%g3,	%g6
	ldsw	[%l7 + 0x48],	%i4
loop_96:
	lduw	[%l7 + 0x38],	%o5
	ld	[%l7 + 0x78],	%f28
	std	%f0,	[%l7 + 0x68]
	stb	%l1,	[%l7 + 0x2F]
	st	%f19,	[%l7 + 0x14]
	andcc	%i3,	0x0134,	%i2
	fmovdle	%xcc,	%f2,	%f7
	ldx	[%l7 + 0x18],	%g7
	nop
	set	0x48, %l6
	ldsw	[%l7 + %l6],	%o4
	stbar
	prefetch	[%l7 + 0x24],	 0x2
	prefetch	[%l7 + 0x5C],	 0x2
	fmovdle	%icc,	%f14,	%f24
	movvs	%xcc,	%g5,	%o0
	sethi	0x12A5,	%g1
	edge16ln	%o2,	%o3,	%l6
	ldsw	[%l7 + 0x18],	%i0
	edge8ln	%g2,	%o6,	%l0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	stxa	%i7,	[%g0 + 0x20] %asi
	flush	%l7 + 0x5C
	nop
	set	0x38, %l5
	stw	%o7,	[%l7 + %l5]
	ldd	[%l7 + 0x48],	%l2
	ldsw	[%l7 + 0x74],	%i6
	rdhpr	%htba,	%i5
	ldsb	[%l7 + 0x5D],	%g4
	lduw	[%l7 + 0x40],	%o1
	stw	%l4,	[%l7 + 0x3C]
	rdpr	%gl,	%i1
	ldstub	[%l7 + 0x34],	%l3
	edge32	%g3,	%l5,	%i4
	stb	%g6,	[%l7 + 0x5F]
	stx	%l1,	[%l7 + 0x30]
	lduw	[%l7 + 0x40],	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g1
	ldxa	[%g0 + %g1] 0x20,	%o5
	ldd	[%l7 + 0x78],	%f22

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%f12,	[%l7 + 0x78]
	fnot1s	%f26,	%f27
	rd	%y,	%i2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%o4,	[%g0 + 0x10] %asi
	stw	%o0,	[%l7 + 0x70]
	std	%g4,	[%l7 + 0x58]
	movpos	%xcc,	%g1,	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %o0
	stxa	%o3,	[%g0 + %o0] 0x20
	st	%f8,	[%l7 + 0x3C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%i0,	[%g0 + 0x18] %asi
	st	%f4,	[%l7 + 0x4C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %l0
	ldxa	[%g0 + %l0] 0x4f,	%l6
	nop
	set	0x20, %i7
	ldsw	[%l7 + %i7],	%g2
	movge	%xcc,	%l0,	%i7
	stx	%o6,	[%l7 + 0x48]
	nop
	set	0x16, %l2
	sth	%l2,	[%l7 + %l2]
	std	%o6,	[%l7 + 0x10]
	sllx	%i5,	%i6,	%g4
	prefetch	[%l7 + 0x4C],	 0x3
	edge32ln	%l4,	%o1,	%l3
	lduw	[%l7 + 0x10],	%i1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l5
	ldx	[%l7 + 0x50],	%i4
	fmovspos	%icc,	%f3,	%f4
	sth	%g3,	[%l7 + 0x26]
	ldd	[%l7 + 0x28],	%f22
	ld	[%l7 + 0x0C],	%f31
	ldsh	[%l7 + 0x72],	%l1
	stx	%i3,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %g2
	ldxa	[%g0 + %g2] 0x20,	%g6
	movn	%icc,	%o5,	%i2
	swap	[%l7 + 0x30],	%g7
	movre	%o4,	%o0,	%g5
	sth	%g1,	[%l7 + 0x4A]
	prefetch	[%l7 + 0x2C],	 0x1
	xor	%o2,	%o3,	%l6
	lduh	[%l7 + 0x4C],	%i0
	flush	%l7 + 0x08
	stb	%l0,	[%l7 + 0x55]
	ldd	[%l7 + 0x08],	%f30
	add	%g2,	%o6,	%l2
	lduw	[%l7 + 0x68],	%o7
	ldd	[%l7 + 0x58],	%f20
	edge16ln	%i5,	%i6,	%i7
	movl	%xcc,	%g4,	%l4
	fpmerge	%f31,	%f22,	%f12
	fnors	%f10,	%f4,	%f2
	fbuge,a	%fcc3,	loop_97
	nop
	set	0x30, %i3
	lduh	[%l7 + %i3],	%o1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%i1,	[%g0 + 0x20] %asi
loop_97:
	ld	[%l7 + 0x14],	%f22
	fmovse	%xcc,	%f19,	%f8
	be,a	loop_98
	lduh	[%l7 + 0x5E],	%l5
	sth	%i4,	[%l7 + 0x34]
	ldstub	[%l7 + 0x24],	%l3
loop_98:
	ldub	[%l7 + 0x4D],	%g3
	swap	[%l7 + 0x24],	%l1
	stw	%i3,	[%l7 + 0x50]
	stb	%o5,	[%l7 + 0x6A]
	ldsw	[%l7 + 0x54],	%i2
	stw	%g7,	[%l7 + 0x48]
	edge8n	%o4,	%g6,	%g5
	lduh	[%l7 + 0x1E],	%g1
	lduh	[%l7 + 0x1E],	%o0
	bvc,a,pt	%icc,	loop_99
	tle	%xcc,	0x2
	ldd	[%l7 + 0x48],	%o2
	lduw	[%l7 + 0x4C],	%o2
loop_99:
	std	%i6,	[%l7 + 0x60]
	umul	%i0,	%l0,	%g2
	ldsw	[%l7 + 0x28],	%o6
	ldsh	[%l7 + 0x2E],	%l2
	stb	%i5,	[%l7 + 0x4A]
	std	%o6,	[%l7 + 0x78]
	tneg	%icc,	0x3
	ldsh	[%l7 + 0x3A],	%i7
	rdpr	%cansave,	%g4
	std	%l4,	[%l7 + 0x50]
	ldsh	[%l7 + 0x1C],	%i6
	movre	%o1,	0x1A4,	%l5
	stb	%i1,	[%l7 + 0x3F]
	ldd	[%l7 + 0x48],	%f8
	std	%f16,	[%l7 + 0x08]
	sth	%i4,	[%l7 + 0x7A]
	std	%g2,	[%l7 + 0x40]
	stw	%l3,	[%l7 + 0x58]
	std	%f18,	[%l7 + 0x68]
	wr	%l1,	0x1C98,	%softint
	stw	%o5,	[%l7 + 0x24]
	tvc	%icc,	0x0
	ldstub	[%l7 + 0x3B],	%i2
	fmovsgu	%xcc,	%f24,	%f18
	edge32l	%g7,	%o4,	%g6
	fbuge,a	%fcc1,	loop_100
	stbar
	array8	%i3,	%g5,	%o0
	nop
	set	0x48, %l1
	ldsw	[%l7 + %l1],	%g1
loop_100:
	st	%f6,	[%l7 + 0x60]
	prefetch	[%l7 + 0x68],	 0x0
	stx	%o2,	[%l7 + 0x18]
	edge8l	%l6,	%i0,	%o3
	rdpr	%canrestore,	%l0
	stx	%o6,	[%l7 + 0x58]
	flush	%l7 + 0x5C
	stb	%l2,	[%l7 + 0x57]
	std	%f16,	[%l7 + 0x70]
	stbar
	stw	%g2,	[%l7 + 0x1C]
	sub	%o7,	%i7,	%i5
	movrgez	%g4,	0x077,	%i6
	stx	%o1,	[%l7 + 0x78]
	swap	[%l7 + 0x7C],	%l4
	sth	%l5,	[%l7 + 0x42]
	bshuffle	%f18,	%f22,	%f2
	stbar
	sth	%i4,	[%l7 + 0x5E]
	ldx	[%l7 + 0x08],	%g3
	std	%i0,	[%l7 + 0x70]
	std	%f4,	[%l7 + 0x18]
	stbar
	lduw	[%l7 + 0x50],	%l3
	ldsw	[%l7 + 0x3C],	%l1
	sub	%o5,	%g7,	%i2
	lduw	[%l7 + 0x68],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i1
	stxa	%g6,	[%g0 + %i1] 0x20
	ld	[%l7 + 0x38],	%f20
	ldx	[%l7 + 0x10],	%i3
	fmovspos	%xcc,	%f12,	%f26
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f22
	prefetch	[%l7 + 0x78],	 0x3
	stbar
	ldstub	[%l7 + 0x20],	%o0
	stx	%g5,	[%l7 + 0x48]
	ldd	[%l7 + 0x10],	%o2
	sth	%g1,	[%l7 + 0x7C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l6
	std	%i0,	[%l7 + 0x40]
	swap	[%l7 + 0x14],	%o3
	flush	%l7 + 0x0C
	bge	%xcc,	loop_101
	std	%o6,	[%l7 + 0x10]
	lduh	[%l7 + 0x16],	%l0
	stbar
loop_101:
	fmovrdgez	%l2,	%f20,	%f18
	ldsb	[%l7 + 0x55],	%g2
	fmovrdlz	%i7,	%f10,	%f8
	taddcctv	%o7,	%i5,	%i6
	std	%g4,	[%l7 + 0x38]
	std	%f0,	[%l7 + 0x38]
	std	%o0,	[%l7 + 0x68]
	st	%f19,	[%l7 + 0x5C]
	ldsb	[%l7 + 0x68],	%l4
	ldsw	[%l7 + 0x5C],	%l5
	movvs	%icc,	%i4,	%i1
	ldstub	[%l7 + 0x3D],	%l3
	std	%f30,	[%l7 + 0x10]
	edge16l	%g3,	%o5,	%l1
	std	%g6,	[%l7 + 0x40]
	movg	%xcc,	%o4,	%g6
	fnands	%f8,	%f14,	%f7
	ldd	[%l7 + 0x48],	%f12
	ldx	[%l7 + 0x50],	%i3
	fpack16	%f26,	%f7
	rdhpr	%hintp,	%o0
	addcc	%i2,	0x07A4,	%g5
	fmovsn	%xcc,	%f9,	%f6
	tl	%xcc,	0x4
	nop
	set	0x08, %o7
	std	%f10,	[%l7 + %o7]
	lduh	[%l7 + 0x1A],	%o2
	andn	%l6,	%g1,	%i0
	edge32	%o3,	%o6,	%l2
	stx	%g2,	[%l7 + 0x10]
	sethi	0x10BA,	%l0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i5
	ldxa	[%g0 + %i5] 0x20,	%o7
	fmovspos	%icc,	%f13,	%f27
	movrne	%i5,	%i7,	%g4
	sth	%i6,	[%l7 + 0x38]
	st	%f30,	[%l7 + 0x58]
	srax	%l4,	0x1C,	%o1
	st	%f8,	[%l7 + 0x58]
	fbuge,a	%fcc1,	loop_102
	nop
	set	0x48, %g4
	std	%l4,	[%l7 + %g4]
	ldub	[%l7 + 0x1A],	%i4
	tsubcctv	%l3,	0x0B7F,	%i1
loop_102:
	ldsh	[%l7 + 0x30],	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%o5,	[%g0 + 0x30] %asi
	flush	%l7 + 0x78
	st	%f26,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x70],	%l1
	sth	%o4,	[%l7 + 0x14]
	flush	%l7 + 0x68
	ldsw	[%l7 + 0x64],	%g7
	tneg	%icc,	0x7
	fcmpeq16	%f2,	%f2,	%g6
	sth	%o0,	[%l7 + 0x50]
	stw	%i3,	[%l7 + 0x58]
	lduw	[%l7 + 0x44],	%g5
	addcc	%i2,	0x0CAA,	%o2
	ldsb	[%l7 + 0x70],	%l6
	ldd	[%l7 + 0x18],	%f24
	rdhpr	%htba,	%g1
	flush	%l7 + 0x10
	flush	%l7 + 0x10
	ldstub	[%l7 + 0x79],	%i0
	fexpand	%f14,	%f28
	rdhpr	%htba,	%o6
	sth	%o3,	[%l7 + 0x70]
	sth	%l2,	[%l7 + 0x52]
	ldd	[%l7 + 0x18],	%g2
	stw	%o7,	[%l7 + 0x4C]
	fmul8x16al	%f28,	%f4,	%f0
	fbul	%fcc2,	loop_103
	lduh	[%l7 + 0x62],	%i5
	rdhpr	%hsys_tick_cmpr,	%i7
	stb	%l0,	[%l7 + 0x11]
loop_103:
	wrpr	%g4,	0x0925,	%cwp
	tge	%xcc,	0x1
	std	%l4,	[%l7 + 0x18]
	ldub	[%l7 + 0x0F],	%i6
	stbar
	taddcctv	%o1,	0x0642,	%i4
	flush	%l7 + 0x70

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f9,	[%l7 + 0x14]
	st	%f10,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l5
	std	%f30,	[%l7 + 0x18]
	ldsb	[%l7 + 0x2B],	%i1
	tgu	%xcc,	0x2
	fpadd32s	%f19,	%f22,	%f19
	lduh	[%l7 + 0x0C],	%o5
	ldsw	[%l7 + 0x58],	%g3
	stw	%l1,	[%l7 + 0x44]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g7
	stx	%o4,	[%l7 + 0x60]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %i6
	stxa	%o0,	[%g0 + %i6] 0x20
	std	%g6,	[%l7 + 0x18]
	ldstub	[%l7 + 0x2D],	%i3
	ld	[%l7 + 0x50],	%f30
	stb	%g5,	[%l7 + 0x2D]
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%o2
	movrne	%i2,	0x1F7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x70],	%i0
	nop
	set	0x60, %o2
	stw	%l6,	[%l7 + %o2]
	ldsh	[%l7 + 0x10],	%o6
	ldsh	[%l7 + 0x72],	%o3
	sth	%g2,	[%l7 + 0x24]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	lduw	[%l7 + 0x64],	%o7
	fmovdge	%icc,	%f0,	%f26
	xorcc	%i5,	0x03A0,	%l0
	ldstub	[%l7 + 0x10],	%g4
	mova	%xcc,	%i7,	%l4
	stb	%o1,	[%l7 + 0x15]
	fmovrde	%i4,	%f6,	%f18
	ldd	[%l7 + 0x58],	%f18
	tne	%icc,	0x4
	stbar
	ld	[%l7 + 0x74],	%f16
	lduh	[%l7 + 0x2C],	%l3
	lduh	[%l7 + 0x20],	%i6
	tpos	%icc,	0x1
	lduw	[%l7 + 0x58],	%i1
	fnegd	%f20,	%f20
	stb	%o5,	[%l7 + 0x57]
	ldstub	[%l7 + 0x21],	%g3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x9A2, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x4E],	%g7
	std	%l0,	[%l7 + 0x58]
	stw	%o0,	[%l7 + 0x1C]
	ld	[%l7 + 0x10],	%f7
	ldsb	[%l7 + 0x3B],	%g6
	stw	%i3,	[%l7 + 0x70]
	stw	%g5,	[%l7 + 0x14]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %g7
	stxa	%o2,	[%g0 + %g7] 0x4f
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%o4
	nop
	setx	loop_104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flush	%l7 + 0x74
	fblg,a	%fcc3,	loop_105
	rdpr	%tl,	%g1
loop_104:
	lduw	[%l7 + 0x20],	%i2
	stx	%l6,	[%l7 + 0x20]
loop_105:
	umulcc	%o6,	0x1D77,	%o3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x30] %asi
	st	%f20,	[%l7 + 0x70]
	stx	%l2,	[%l7 + 0x28]
	movge	%icc,	%i0,	%i5
	ldstub	[%l7 + 0x56],	%o7
	ldsw	[%l7 + 0x7C],	%g4
	ldsw	[%l7 + 0x5C],	%i7
	ldstub	[%l7 + 0x59],	%l0
	flush	%l7 + 0x70
	edge8ln	%o1,	%l4,	%l3
	lduw	[%l7 + 0x44],	%i6
	ldsh	[%l7 + 0x08],	%i1
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%o5
	lduh	[%l7 + 0x5A],	%g3
	movleu	%xcc,	%l5,	%g7
	array8	%l1,	%o0,	%i4
	stx	%i3,	[%l7 + 0x20]
	ldd	[%l7 + 0x40],	%f6
	ldsb	[%l7 + 0x6E],	%g5
	ldub	[%l7 + 0x78],	%g6
	stbar
	tn	%icc,	0x7
	stb	%o4,	[%l7 + 0x36]
	fxnors	%f15,	%f28,	%f31
	ld	[%l7 + 0x54],	%f24
	ldd	[%l7 + 0x78],	%o2
	nop
	set	0x7C, %o6
	stw	%i2,	[%l7 + %o6]
	ta	%icc,	0x3
	stb	%l6,	[%l7 + 0x0B]
	ldub	[%l7 + 0x7D],	%o6
	fxors	%f26,	%f12,	%f20
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o1
	stxa	%g1,	[%g0 + %o1] 0x4f
	ld	[%l7 + 0x28],	%f31
	ldsw	[%l7 + 0x30],	%o3
	sub	%l2,	0x1A38,	%g2
	stbar
	ldsw	[%l7 + 0x50],	%i0
	st	%f16,	[%l7 + 0x18]
	stw	%o7,	[%l7 + 0x60]
	rd	%y,	%i5
	edge8n	%i7,	%l0,	%g4
	prefetch	[%l7 + 0x2C],	 0x1
	stbar
	lduh	[%l7 + 0x3E],	%o1
	edge32ln	%l4,	%l3,	%i6
	ldub	[%l7 + 0x14],	%i1
	array8	%g3,	%l5,	%o5
	st	%f13,	[%l7 + 0x68]
	tge	%icc,	0x4
	lduh	[%l7 + 0x78],	%l1
	ldsh	[%l7 + 0x28],	%o0
	lduw	[%l7 + 0x08],	%i4
	ldsh	[%l7 + 0x4A],	%i3
	addccc	%g7,	%g6,	%o4
	rdhpr	%htba,	%g5
	addc	%i2,	0x0AE3,	%l6
	movrlez	%o6,	0x11D,	%g1
	flushw
	st	%f30,	[%l7 + 0x4C]
	std	%f24,	[%l7 + 0x18]
	stw	%o2,	[%l7 + 0x54]
	ldstub	[%l7 + 0x5B],	%o3
	ldsh	[%l7 + 0x0C],	%l2
	tn	%icc,	0x0
	stbar
	udivx	%i0,	0x0A93,	%o7
	fmovrde	%i5,	%f18,	%f2
	flush	%l7 + 0x10
	movrgz	%g2,	0x1A3,	%i7
	ldub	[%l7 + 0x5F],	%g4
	nop
	set	0x50, %g6
	lduw	[%l7 + %g6],	%o1
	fcmple32	%f16,	%f28,	%l0
	movrgz	%l3,	%l4,	%i6
	ldsw	[%l7 + 0x38],	%g3
	sth	%i1,	[%l7 + 0x54]
	nop
	set	0x12, %g5
	sth	%o5,	[%l7 + %g5]
	ldx	[%l7 + 0x70],	%l1
	fmovdcs	%xcc,	%f23,	%f16
	movre	%o0,	%l5,	%i4
	fpsub16s	%f27,	%f1,	%f17
	stw	%g7,	[%l7 + 0x24]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g6
	stx	%i3,	[%l7 + 0x70]
	ldx	[%l7 + 0x40],	%g5
	xnor	%o4,	%i2,	%o6
	stw	%g1,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x68],	%o2
	ldstub	[%l7 + 0x74],	%l6
	fble	%fcc2,	loop_106
	stx	%o3,	[%l7 + 0x50]
	lduh	[%l7 + 0x0A],	%l2
	ldsw	[%l7 + 0x4C],	%i0
loop_106:
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 0x0
	taddcc	%o7,	0x0FED,	%g2
	ldsh	[%l7 + 0x28],	%i5
	fxor	%f28,	%f14,	%f26
	fpsub16s	%f23,	%f16,	%f7
	mulx	%g4,	0x1EAB,	%i7
	fornot2s	%f0,	%f29,	%f12
	ldd	[%l7 + 0x10],	%l0
	fmovsn	%icc,	%f16,	%f16
	movpos	%icc,	%l3,	%o1
	sth	%i6,	[%l7 + 0x5C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l4
	bl,pn	%icc,	loop_107
	ld	[%l7 + 0x3C],	%f14
	sth	%i1,	[%l7 + 0x24]
	std	%f18,	[%l7 + 0x50]
loop_107:
	ld	[%l7 + 0x68],	%f12

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE35, 	%hsys_tick_cmpr
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l3
	stxa	%l1,	[%g0 + %l3] 0x20
	lduw	[%l7 + 0x2C],	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%l5,	[%g0 + 0x38] %asi
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %g3
	stxa	%g7,	[%g0 + %g3] 0x20
	ldsw	[%l7 + 0x58],	%g6
	swap	[%l7 + 0x78],	%i4
	st	%f9,	[%l7 + 0x20]
	swap	[%l7 + 0x10],	%g5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	stxa	%o4,	[%g0 + 0x28] %asi
	sth	%i2,	[%l7 + 0x50]
	prefetch	[%l7 + 0x48],	 0x3
	ldsh	[%l7 + 0x6E],	%i3
	lduw	[%l7 + 0x70],	%o6
	rdhpr	%hintp,	%g1
	nop
	set	0x20, %i4
	std	%i6,	[%l7 + %i4]
	prefetch	[%l7 + 0x1C],	 0x3
	umul	%o2,	%l2,	%i0
	ldd	[%l7 + 0x68],	%f18
	ldd	[%l7 + 0x30],	%o6
	std	%o2,	[%l7 + 0x48]
	fbge	%fcc1,	loop_108
	ldsb	[%l7 + 0x55],	%g2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %l6
	stxa	%i5,	[%g0 + %l6] 0x4f
loop_108:
	fmovrdlez	%g4,	%f14,	%f24
	swap	[%l7 + 0x6C],	%i7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%l3,	[%g0 + 0x8] %asi
	nop
	set	0x5D, %o3
	ldstub	[%l7 + %o3],	%l0
	wrpr	%i6,	0x0E16,	%cwp
	ld	[%l7 + 0x54],	%f11
	ldstub	[%l7 + 0x71],	%o1
	rd	%y,	%i1
	sth	%g3,	[%l7 + 0x7E]
	sra	%o5,	0x16,	%l1
	or	%o0,	%l4,	%g7
	ldd	[%l7 + 0x50],	%f14
	ldsw	[%l7 + 0x74],	%l5
	wrpr	%i4,	0x1DAF,	%cwp
	tleu	%xcc,	0x4
	fnot2s	%f19,	%f3
	stx	%g6,	[%l7 + 0x40]
	brlez,a	%o4,	loop_109
	std	%f22,	[%l7 + 0x60]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	stxa	%g5,	[%g0 + 0x20] %asi
loop_109:
	srlx	%i3,	0x11,	%o6
	std	%f16,	[%l7 + 0x78]
	lduw	[%l7 + 0x44],	%i2
	stbar
	nop
	set	0x48, %g1
	lduw	[%l7 + %g1],	%g1
	edge32ln	%l6,	%l2,	%i0
	ldd	[%l7 + 0x28],	%f16
	lduh	[%l7 + 0x56],	%o2
	addcc	%o3,	0x01B1,	%o7
	xorcc	%i5,	%g4,	%i7
	mulx	%g2,	0x1114,	%l0
	nop
	set	0x50, %l5
	stw	%i6,	[%l7 + %l5]
	stx	%o1,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %l0
	stxa	%i1,	[%g0 + %l0] 0x4f
	ldd	[%l7 + 0x30],	%f12
	array32	%g3,	%l3,	%o5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %i7
	ldxa	[%g0 + %i7] 0x4f,	%o0
	prefetch	[%l7 + 0x78],	 0x3
	ld	[%l7 + 0x48],	%f24
	stb	%l4,	[%l7 + 0x1E]
	ldub	[%l7 + 0x4B],	%l1
	ldd	[%l7 + 0x10],	%l4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o0
	stxa	%g7,	[%g0 + %o0] 0x4f
	ldub	[%l7 + 0x09],	%g6
	st	%f20,	[%l7 + 0x08]
	swap	[%l7 + 0x28],	%i4
	flush	%l7 + 0x54
	movn	%icc,	%g5,	%i3
	ld	[%l7 + 0x3C],	%f3
	ldstub	[%l7 + 0x6A],	%o4
	udiv	%i2,	0x1338,	%o6
	ldub	[%l7 + 0x6A],	%l6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%l2,	[%g0 + 0x38] %asi
	bleu	loop_110
	swap	[%l7 + 0x68],	%i0
	stx	%o2,	[%l7 + 0x20]
	sth	%o3,	[%l7 + 0x54]
loop_110:
	fxnor	%f8,	%f6,	%f4
	fmovsge	%xcc,	%f7,	%f31
	ld	[%l7 + 0x20],	%f6
	ldsh	[%l7 + 0x7E],	%g1
	lduh	[%l7 + 0x44],	%o7
	swap	[%l7 + 0x38],	%i5
	flush	%l7 + 0x24
	ldstub	[%l7 + 0x54],	%g4
	lduh	[%l7 + 0x2E],	%g2
	ldsw	[%l7 + 0x54],	%i7
	ldd	[%l7 + 0x38],	%f28
	array16	%i6,	%l0,	%o1
	array8	%g3,	%i1,	%l3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %g2
	stxa	%o5,	[%g0 + %g2] 0x4f
	ldd	[%l7 + 0x68],	%l4
	std	%f4,	[%l7 + 0x48]
	nop
	set	0x58, %l2
	stw	%l1,	[%l7 + %l2]
	stx	%o0,	[%l7 + 0x60]
	lduw	[%l7 + 0x30],	%l5
	ldsh	[%l7 + 0x36],	%g6
	tsubcctv	%g7,	%i4,	%g5
	movcs	%xcc,	%o4,	%i3
	ldsh	[%l7 + 0x72],	%o6
	stx	%i2,	[%l7 + 0x50]
	sethi	0x057C,	%l2
	swap	[%l7 + 0x70],	%l6
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%i0
	ldstub	[%l7 + 0x10],	%o2
	ld	[%l7 + 0x70],	%f27
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i3
	ldxa	[%g0 + %i3] 0x4f,	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i1
	stxa	%g1,	[%g0 + %i1] 0x20
	bge	%xcc,	loop_111
	prefetch	[%l7 + 0x44],	 0x0
	flush	%l7 + 0x18
	prefetch	[%l7 + 0x50],	 0x1
loop_111:
	ld	[%l7 + 0x78],	%f12
	mulscc	%i5,	%g4,	%g2
	stx	%o7,	[%l7 + 0x48]
	lduw	[%l7 + 0x6C],	%i6
	andncc	%l0,	%i7,	%o1
	tn	%icc,	0x6
	prefetch	[%l7 + 0x74],	 0x0
	flush	%l7 + 0x6C
	bvc,a	loop_112
	std	%g2,	[%l7 + 0x08]
	ld	[%l7 + 0x6C],	%f15
	ldd	[%l7 + 0x78],	%f2
loop_112:
	tn	%icc,	0x7
	lduh	[%l7 + 0x58],	%l3
	array16	%i1,	%o5,	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l1
	ld	[%l7 + 0x74],	%f0
	ldsb	[%l7 + 0x7C],	%l5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
	ld	[%l7 + 0x24],	%f18
	sth	%g7,	[%l7 + 0x2C]
	movge	%xcc,	%o0,	%g5
	stx	%i4,	[%l7 + 0x78]
	tl	%icc,	0x7
	prefetch	[%l7 + 0x24],	 0x2
	fbue	%fcc2,	loop_113
	ldsw	[%l7 + 0x14],	%i3
	ldsb	[%l7 + 0x55],	%o6
	xnor	%o4,	0x088D,	%l2
loop_113:
	st	%f12,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x70],	%i2
	lduh	[%l7 + 0x68],	%i0
	ldsb	[%l7 + 0x31],	%o2
	fmul8x16au	%f11,	%f4,	%f16
	swap	[%l7 + 0x7C],	%o3
	ldd	[%l7 + 0x70],	%i6
	sth	%i5,	[%l7 + 0x18]
	sdiv	%g1,	0x15A7,	%g4
	ldd	[%l7 + 0x60],	%o6
	ld	[%l7 + 0x38],	%f1
	fpmerge	%f7,	%f31,	%f14
	tcs	%icc,	0x6
	ldsw	[%l7 + 0x38],	%g2
	stbar
	std	%f4,	[%l7 + 0x60]
	ldub	[%l7 + 0x1F],	%i6
	stb	%l0,	[%l7 + 0x5C]
	swap	[%l7 + 0x58],	%i7
	ldstub	[%l7 + 0x0F],	%g3
	std	%o0,	[%l7 + 0x20]
	stw	%l3,	[%l7 + 0x40]
	taddcc	%o5,	0x0E3E,	%l4
	swap	[%l7 + 0x1C],	%i1
	std	%f8,	[%l7 + 0x40]
	ldd	[%l7 + 0x30],	%l0
	stx	%l5,	[%l7 + 0x18]
	flush	%l7 + 0x40
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%g7,	[%g0 + 0x38] %asi
	stx	%o0,	[%l7 + 0x10]
	ldsb	[%l7 + 0x46],	%g5
	ldd	[%l7 + 0x60],	%g6
	ldsh	[%l7 + 0x60],	%i3
	wr	%o6,	0x15D7,	%sys_tick
	swap	[%l7 + 0x64],	%o4
	lduw	[%l7 + 0x14],	%l2
	ldstub	[%l7 + 0x44],	%i4
	umul	%i0,	0x1CD5,	%o2
	wrpr	%o3,	0x19E1,	%cwp
	stx	%i2,	[%l7 + 0x48]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %l4
	stxa	%i5,	[%g0 + %l4] 0x20
	prefetch	[%l7 + 0x0C],	 0x0
	fmovrsgz	%g1,	%f23,	%f1
	ldsb	[%l7 + 0x4D],	%l6
	stw	%o7,	[%l7 + 0x28]
	sth	%g2,	[%l7 + 0x3E]
	stx	%i6,	[%l7 + 0x18]
	fmovsle	%xcc,	%f5,	%f15
	stw	%l0,	[%l7 + 0x5C]
	ldstub	[%l7 + 0x63],	%i7
	swap	[%l7 + 0x54],	%g4
	movrgez	%o1,	0x0D4,	%l3
	sir	0x16CA
	stbar
	fandnot2s	%f22,	%f29,	%f26
	ldx	[%l7 + 0x20],	%g3
	ldsw	[%l7 + 0x30],	%l4
	ldub	[%l7 + 0x7B],	%i1
	lduh	[%l7 + 0x72],	%o5
	stw	%l5,	[%l7 + 0x24]
	sth	%l1,	[%l7 + 0x12]
	membar	0x22
	edge16	%g7,	%o0,	%g6
	stx	%i3,	[%l7 + 0x20]
	std	%f10,	[%l7 + 0x70]
	stbar
	sth	%o6,	[%l7 + 0x0C]
	ldub	[%l7 + 0x72],	%g5
	stb	%l2,	[%l7 + 0x0D]
	ldd	[%l7 + 0x20],	%i4
	stx	%o4,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %o7
	stxa	%i0,	[%g0 + %o7] 0x20
	stx	%o3,	[%l7 + 0x18]
	ldd	[%l7 + 0x08],	%f24
	fpsub32s	%f30,	%f17,	%f29
	lduh	[%l7 + 0x52],	%i2
	tg	%icc,	0x0
	ldd	[%l7 + 0x68],	%f4
	umulcc	%i5,	%o2,	%l6
	ldstub	[%l7 + 0x12],	%o7
	stx	%g1,	[%l7 + 0x18]
	ldub	[%l7 + 0x6C],	%i6
	tne	%xcc,	0x4
	fmovrse	%g2,	%f4,	%f0
	tpos	%icc,	0x4
	flush	%l7 + 0x18
	movpos	%xcc,	%l0,	%i7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %g4
	stxa	%o1,	[%g0 + %g4] 0x20
	movpos	%icc,	%g4,	%g3
	ld	[%l7 + 0x5C],	%f16
	orncc	%l3,	%i1,	%o5
	ldub	[%l7 + 0x54],	%l5
	stbar
	lduw	[%l7 + 0x6C],	%l4
	sth	%l1,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%o0
	ldx	[%l7 + 0x10],	%g6
	stw	%g7,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o6
	nop
	set	0x3A, %i6
	ldsh	[%l7 + %i6],	%i3
	stw	%g5,	[%l7 + 0x20]
	fnand	%f28,	%f0,	%f16
	edge8l	%l2,	%i4,	%o4
	stb	%o3,	[%l7 + 0x26]
	lduh	[%l7 + 0x18],	%i2
	ldx	[%l7 + 0x58],	%i0
	flush	%l7 + 0x2C
	st	%f10,	[%l7 + 0x30]
	movrgz	%i5,	%o2,	%o7
	lduw	[%l7 + 0x3C],	%g1
	swap	[%l7 + 0x08],	%i6
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f8
	st	%f1,	[%l7 + 0x0C]
	std	%i6,	[%l7 + 0x30]
	ldd	[%l7 + 0x20],	%f2
	swap	[%l7 + 0x48],	%l0
	lduw	[%l7 + 0x18],	%g2
	tvc	%icc,	0x3
	ld	[%l7 + 0x6C],	%f26
	movre	%i7,	0x2FA,	%g4
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%g3
	ldstub	[%l7 + 0x26],	%o1
	smulcc	%i1,	0x0595,	%l3
	ld	[%l7 + 0x48],	%f6
	prefetch	[%l7 + 0x54],	 0x0
	wrpr	%l5,	0x06AD,	%cwp
	stbar
	ldsb	[%l7 + 0x7E],	%l4
	stbar
	srax	%l1,	0x1D,	%o0
	stbar
	edge32	%o5,	%g7,	%o6
	std	%i2,	[%l7 + 0x18]
	stx	%g5,	[%l7 + 0x10]
	ldsb	[%l7 + 0x6A],	%g6
	lduh	[%l7 + 0x0E],	%i4
	sth	%o4,	[%l7 + 0x78]
	stx	%o3,	[%l7 + 0x60]
	std	%l2,	[%l7 + 0x28]
	ld	[%l7 + 0x74],	%f17
	ldsb	[%l7 + 0x3C],	%i2
	st	%f20,	[%l7 + 0x68]
	st	%f0,	[%l7 + 0x4C]
	std	%i4,	[%l7 + 0x70]
	nop
	set	0x10, %i5
	lduw	[%l7 + %i5],	%o2
	ldx	[%l7 + 0x18],	%o7
	ldx	[%l7 + 0x50],	%g1
	ldstub	[%l7 + 0x35],	%i0
	sth	%l6,	[%l7 + 0x6A]
	xnor	%l0,	%i6,	%g2
	stb	%g4,	[%l7 + 0x35]
	ldd	[%l7 + 0x58],	%f30
	stb	%g3,	[%l7 + 0x58]
	lduw	[%l7 + 0x64],	%i7
	edge16	%i1,	%l3,	%l5
	stbar
	ldsb	[%l7 + 0x2C],	%o1
	stb	%l1,	[%l7 + 0x6C]
	rdpr	%otherwin,	%l4
	nop
	set	0x61, %i0
	ldub	[%l7 + %i0],	%o0
	flush	%l7 + 0x7C
	ld	[%l7 + 0x44],	%f24
	ldstub	[%l7 + 0x25],	%g7
	ldd	[%l7 + 0x40],	%o4
	std	%f18,	[%l7 + 0x38]
	std	%i2,	[%l7 + 0x70]
	flush	%l7 + 0x40
	ldx	[%l7 + 0x08],	%g5
	std	%g6,	[%l7 + 0x58]
	stbar
	ld	[%l7 + 0x48],	%f30
	bgu,a,pt	%xcc,	loop_114
	sth	%o6,	[%l7 + 0x26]
	stbar
	ldsw	[%l7 + 0x1C],	%o4
loop_114:
	stbar
	ta	%xcc,	0x6
	ldd	[%l7 + 0x28],	%o2
	lduh	[%l7 + 0x30],	%l2
	sth	%i4,	[%l7 + 0x4E]
	st	%f0,	[%l7 + 0x0C]
	sdivcc	%i5,	0x1F7B,	%i2
	flush	%l7 + 0x70
	ld	[%l7 + 0x0C],	%f29
	ldstub	[%l7 + 0x15],	%o2
	stw	%o7,	[%l7 + 0x60]
	lduh	[%l7 + 0x5A],	%i0
	std	%f6,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %g7
	stxa	%g1,	[%g0 + %g7] 0x4f
	umulcc	%l0,	0x054A,	%i6
	std	%i6,	[%l7 + 0x28]
	nop
	set	0x68, %o6
	std	%g4,	[%l7 + %o6]
	edge8l	%g3,	%g2,	%i7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i2
	stxa	%i1,	[%g0 + %i2] 0x20
	swap	[%l7 + 0x28],	%l5
	swap	[%l7 + 0x34],	%o1
	st	%f27,	[%l7 + 0x68]
	stx	%l1,	[%l7 + 0x38]
	tsubcc	%l4,	%l3,	%o0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o5
	lduh	[%l7 + 0x76],	%g7
	sth	%i3,	[%l7 + 0x08]
	ldx	[%l7 + 0x48],	%g6
	st	%f2,	[%l7 + 0x1C]
	flush	%l7 + 0x0C
	fcmple16	%f20,	%f10,	%o6
	swap	[%l7 + 0x3C],	%g5
	lduw	[%l7 + 0x40],	%o4
	ldsw	[%l7 + 0x3C],	%o3
	ldsh	[%l7 + 0x28],	%l2
	srl	%i5,	0x08,	%i2
	smul	%i4,	0x1061,	%o7
	xor	%o2,	0x0883,	%i0
	xnorcc	%g1,	%l0,	%i6
	movcs	%icc,	%l6,	%g3
	stb	%g2,	[%l7 + 0x28]
	array16	%i7,	%g4,	%l5
	st	%f11,	[%l7 + 0x78]
	ldstub	[%l7 + 0x6F],	%o1
	movge	%xcc,	%l1,	%i1
	taddcctv	%l4,	%l3,	%o5
	ldx	[%l7 + 0x70],	%g7
	st	%f1,	[%l7 + 0x64]
	ldsw	[%l7 + 0x74],	%o0
	fbg,a	%fcc1,	loop_115
	lduw	[%l7 + 0x6C],	%g6
	stb	%o6,	[%l7 + 0x79]
	ldx	[%l7 + 0x58],	%i3
loop_115:
	stbar
	stx	%g5,	[%l7 + 0x10]
	xnor	%o4,	0x03F3,	%l2
	stbar
	stb	%o3,	[%l7 + 0x25]
	edge16l	%i5,	%i4,	%o7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%o2,	[%g0 + 0x20] %asi
	flush	%l7 + 0x10
	prefetch	[%l7 + 0x5C],	 0x0
	ldsh	[%l7 + 0x6C],	%i2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEDA, 	%hsys_tick_cmpr
	fpsub32s	%f1,	%f14,	%f11
	std	%f12,	[%l7 + 0x18]
	swap	[%l7 + 0x30],	%i6
	lduh	[%l7 + 0x3C],	%l0
	fmovdle	%xcc,	%f16,	%f26
	ldub	[%l7 + 0x1A],	%l6
	stbar
	ldsh	[%l7 + 0x2C],	%g2
	fnegd	%f18,	%f10
	stx	%i7,	[%l7 + 0x50]
	ldx	[%l7 + 0x70],	%g4
	nop
	set	0x64, %g6
	sth	%l5,	[%l7 + %g6]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x0
	ldsw	[%l7 + 0x50],	%g3
	std	%f0,	[%l7 + 0x20]
	nop
	set	0x20, %o1
	std	%f22,	[%l7 + %o1]
	ldd	[%l7 + 0x28],	%f10
	ba,a,pt	%icc,	loop_116
	ldd	[%l7 + 0x78],	%f8
	ldd	[%l7 + 0x58],	%o0
	stbar
loop_116:
	nop
	set	0x26, %o4
	ldstub	[%l7 + %o4],	%i1
	movrne	%l4,	%l3,	%o5
	lduw	[%l7 + 0x50],	%g7
	wr	%o0,	0x17A3,	%ccr
	lduh	[%l7 + 0x4A],	%g6
	flush	%l7 + 0x14
	std	%l0,	[%l7 + 0x48]
	ldub	[%l7 + 0x3B],	%o6
	stx	%g5,	[%l7 + 0x50]
	stbar
	ldd	[%l7 + 0x78],	%f12
	nop
	setx	loop_117,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stx	%o4,	[%l7 + 0x40]
	std	%f22,	[%l7 + 0x30]
	ldsb	[%l7 + 0x21],	%l2
loop_117:
	edge32ln	%i3,	%i5,	%i4
	taddcctv	%o7,	%o3,	%i2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %l3
	ldxa	[%g0 + %l3] 0x4f,	%g1
	prefetch	[%l7 + 0x18],	 0x3
	ldstub	[%l7 + 0x5A],	%i6
	rdhpr	%hsys_tick_cmpr,	%l0
	std	%f16,	[%l7 + 0x38]
	ldstub	[%l7 + 0x7D],	%l6
	ldsb	[%l7 + 0x67],	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x62],	%i7
	ldd	[%l7 + 0x28],	%g2
	taddcctv	%g4,	%g3,	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x30] %asi
	std	%i0,	[%l7 + 0x48]
	std	%l2,	[%l7 + 0x60]
	std	%f22,	[%l7 + 0x20]
	movvc	%xcc,	%o5,	%g7
	stbar
	fone	%f10
	ldsh	[%l7 + 0x4C],	%l4
	ldd	[%l7 + 0x30],	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x25],	%g6
	ldub	[%l7 + 0x5E],	%o6
	fnand	%f24,	%f30,	%f10
	ldx	[%l7 + 0x08],	%g5
	stx	%l1,	[%l7 + 0x28]
	fnot2	%f6,	%f24
	ldx	[%l7 + 0x40],	%l2
	swap	[%l7 + 0x24],	%i3
	st	%f27,	[%l7 + 0x2C]
	fbue	%fcc0,	loop_118
	edge8n	%i5,	%i4,	%o7
	wrpr	%o4,	%o3,	%cwp
	ldsh	[%l7 + 0x4C],	%i2
loop_118:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	nop
	wr	%g0,	0x20,	%asi
	stxa	%g1,	[%g0 + 0x0] %asi
	ldd	[%l7 + 0x18],	%i0
	sth	%l0,	[%l7 + 0x1A]
	movrgz	%i6,	0x175,	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g5
	stxa	%i7,	[%g0 + %g5] 0x20
	array32	%g2,	%g4,	%g3
	ldd	[%l7 + 0x20],	%i6
	ldx	[%l7 + 0x50],	%o1
	ldd	[%l7 + 0x40],	%f0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x44],	 0x0
	stw	%l3,	[%l7 + 0x44]
	ldd	[%l7 + 0x20],	%l4
	st	%f2,	[%l7 + 0x58]
	sth	%g7,	[%l7 + 0x3C]
	ldstub	[%l7 + 0x6C],	%l4
	std	%f14,	[%l7 + 0x70]
	ldd	[%l7 + 0x18],	%f6
	st	%f22,	[%l7 + 0x64]
	ldub	[%l7 + 0x3F],	%o5
	std	%f4,	[%l7 + 0x48]
	ldsb	[%l7 + 0x4D],	%o0
	ldd	[%l7 + 0x70],	%f14
	ldx	[%l7 + 0x30],	%g6
	stx	%g5,	[%l7 + 0x70]
	movrlez	%o6,	0x15F,	%l1
	ldd	[%l7 + 0x78],	%l2
	edge8	%i5,	%i3,	%i4
	ldstub	[%l7 + 0x4B],	%o7
	lduh	[%l7 + 0x36],	%o4
	stbar
	std	%f28,	[%l7 + 0x58]
	fornot2s	%f11,	%f27,	%f10
	lduw	[%l7 + 0x20],	%o3
	ld	[%l7 + 0x6C],	%f16
	lduh	[%l7 + 0x76],	%g1
	swap	[%l7 + 0x08],	%i0
	nop
	set	0x40, %i4
	std	%f24,	[%l7 + %i4]
	ldx	[%l7 + 0x40],	%l0
	flush	%l7 + 0x2C
	prefetch	[%l7 + 0x28],	 0x2
	flush	%l7 + 0x2C
	swap	[%l7 + 0x1C],	%i2
	ldstub	[%l7 + 0x1D],	%i6
	tneg	%xcc,	0x7
	tgu	%xcc,	0x5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %g3
	stxa	%i7,	[%g0 + %g3] 0x4f
	fpadd16s	%f9,	%f30,	%f18
	swap	[%l7 + 0x78],	%g2
	ldsw	[%l7 + 0x2C],	%g4
	fbul	%fcc0,	loop_119
	ble	%xcc,	loop_120
	stbar
	fsrc2s	%f11,	%f30
loop_119:
	srl	%g3,	%l6,	%o2
loop_120:
	lduh	[%l7 + 0x66],	%i1
	lduh	[%l7 + 0x12],	%o1
	ldx	[%l7 + 0x38],	%l3
	prefetch	[%l7 + 0x74],	 0x0
	ldx	[%l7 + 0x20],	%l5
	ldsw	[%l7 + 0x2C],	%l4
	fcmpne32	%f24,	%f6,	%o5
	fbuge,a	%fcc1,	loop_121
	lduh	[%l7 + 0x38],	%g7
	ble,pn	%xcc,	loop_122
	edge8	%g6,	%g5,	%o0
loop_121:
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f18
	ldub	[%l7 + 0x6A],	%l1
loop_122:
	ldstub	[%l7 + 0x61],	%o6
	st	%f8,	[%l7 + 0x48]
	and	%i5,	0x112F,	%i3
	std	%l2,	[%l7 + 0x78]
	ldsw	[%l7 + 0x5C],	%i4
	nop
	set	0x6A, %o3
	ldsb	[%l7 + %o3],	%o7
	nop
	set	0x18, %g1
	ldstub	[%l7 + %g1],	%o3
	flush	%l7 + 0x78
	fnegs	%f14,	%f15
	ldsb	[%l7 + 0x65],	%o4
	lduh	[%l7 + 0x48],	%i0
	ldsh	[%l7 + 0x30],	%g1
	ldd	[%l7 + 0x50],	%f10
	edge32	%l0,	%i6,	%i2
	flush	%l7 + 0x48
	stb	%g2,	[%l7 + 0x76]
	tne	%icc,	0x7
	ldstub	[%l7 + 0x56],	%i7
	stw	%g3,	[%l7 + 0x68]
	nop
	set	0x4B, %l5
	ldstub	[%l7 + %l5],	%g4
	nop
	set	0x70, %i7
	stw	%o2,	[%l7 + %i7]
	stw	%l6,	[%l7 + 0x24]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l0
	ldxa	[%g0 + %l0] 0x4f,	%i1
	std	%f2,	[%l7 + 0x78]
	orcc	%l3,	%l5,	%l4
	std	%f26,	[%l7 + 0x78]
	ldsh	[%l7 + 0x2C],	%o1
	stx	%o5,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %o0
	stxa	%g6,	[%g0 + %o0] 0x20
	std	%f20,	[%l7 + 0x78]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%g7
	std	%o0,	[%l7 + 0x30]
	prefetch	[%l7 + 0x3C],	 0x2
	fpadd32	%f26,	%f6,	%f8
	ldub	[%l7 + 0x28],	%g5
	wr	%g0,	0x0FCD,	%pcr
	std	%l0,	[%l7 + 0x58]
	stb	%i3,	[%l7 + 0x74]
	ldsh	[%l7 + 0x16],	%l2
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%i5
	bvc,a,pt	%icc,	loop_123
	edge32n	%i4,	%o7,	%o3
	ldsb	[%l7 + 0x2B],	%i0
	stbar
loop_123:
	udiv	%o4,	0x0C9E,	%l0
	lduh	[%l7 + 0x74],	%g1
	sth	%i6,	[%l7 + 0x58]
	flush	%l7 + 0x28
	ldsh	[%l7 + 0x6A],	%g2
	stx	%i2,	[%l7 + 0x50]
	ldsw	[%l7 + 0x18],	%i7
	wrpr	%g4,	0x1F74,	%tick
	stbar
	ldsh	[%l7 + 0x0A],	%g3
	flushw
	lduw	[%l7 + 0x0C],	%l6
	fsrc2	%f2,	%f6
	flush	%l7 + 0x68
	lduh	[%l7 + 0x20],	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%i1,	[%g0 + 0x28] %asi
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f20
	lduh	[%l7 + 0x74],	%l5
	std	%l4,	[%l7 + 0x48]
	movrlz	%l3,	0x386,	%o5
	sth	%o1,	[%l7 + 0x52]
	tsubcc	%g7,	0x19E2,	%o0
	movl	%icc,	%g5,	%g6
	fmovdne	%icc,	%f8,	%f26
	fbo,a	%fcc3,	loop_124
	nop
	set	0x40, %l2
	prefetch	[%l7 + %l2],	 0x3
	stbar
	stw	%o6,	[%l7 + 0x60]
loop_124:
	fmovrsgz	%i3,	%f29,	%f14
	ldsb	[%l7 + 0x42],	%l2
	std	%f16,	[%l7 + 0x68]
	flush	%l7 + 0x14

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x439, 	%hsys_tick_cmpr
	std	%f10,	[%l7 + 0x68]
	fpadd16s	%f24,	%f26,	%f22
	ldx	[%l7 + 0x08],	%l1
	ldsb	[%l7 + 0x77],	%i4
	lduw	[%l7 + 0x2C],	%o7
	nop
	set	0x74, %i3
	lduw	[%l7 + %i3],	%i0
	ldstub	[%l7 + 0x50],	%o3
	stw	%o4,	[%l7 + 0x50]
	sub	%g1,	%l0,	%g2
	ldd	[%l7 + 0x40],	%f8
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i1
	stxa	%i6,	[%g0 + %i1] 0x20
	stbar
	std	%f20,	[%l7 + 0x30]
	andn	%i2,	0x1A02,	%g4
	ldd	[%l7 + 0x70],	%g2
	addcc	%i7,	0x10EC,	%l6
	lduw	[%l7 + 0x14],	%o2
	stb	%l5,	[%l7 + 0x67]
	nop
	setx loop_125, %l0, %l1
	jmpl %l1, %i1
	tneg	%xcc,	0x2
	lduw	[%l7 + 0x40],	%l4
	fmovscc	%icc,	%f29,	%f22
loop_125:
	stw	%l3,	[%l7 + 0x7C]
	stw	%o5,	[%l7 + 0x18]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x14B, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x18],	 0x3
	st	%f4,	[%l7 + 0x14]
	ldx	[%l7 + 0x58],	%o0
	st	%f19,	[%l7 + 0x48]
	lduh	[%l7 + 0x16],	%g5
	stbar
	stw	%g6,	[%l7 + 0x08]
	tneg	%xcc,	0x3
	fnors	%f29,	%f19,	%f30
	fxors	%f6,	%f2,	%f14
	ldd	[%l7 + 0x08],	%o6
	ldsh	[%l7 + 0x16],	%o1
	ldd	[%l7 + 0x78],	%f26
	movg	%icc,	%i3,	%l2
	fxor	%f0,	%f2,	%f12
	ldsw	[%l7 + 0x18],	%l1
	srl	%i5,	0x17,	%i4
	ldd	[%l7 + 0x40],	%f28
	lduw	[%l7 + 0x54],	%o7
	stx	%i0,	[%l7 + 0x38]
	stw	%o4,	[%l7 + 0x68]
	prefetch	[%l7 + 0x14],	 0x0
	stbar
	ldsh	[%l7 + 0x1A],	%o3
	st	%f7,	[%l7 + 0x14]
	andcc	%l0,	%g1,	%g2
	bvs,a,pn	%icc,	loop_126
	flush	%l7 + 0x6C
	ldsh	[%l7 + 0x26],	%i2
	stb	%i6,	[%l7 + 0x12]
loop_126:
	flush	%l7 + 0x38
	ldstub	[%l7 + 0x5C],	%g3
	std	%g4,	[%l7 + 0x38]
	edge32	%l6,	%i7,	%o2
	nop
	setx loop_127, %l0, %l1
	jmpl %l1, %l5
	alignaddrl	%i1,	%l4,	%l3
	smul	%o5,	%g7,	%o0
	ldub	[%l7 + 0x43],	%g5
loop_127:
	lduw	[%l7 + 0x68],	%o6
	rdhpr	%htba,	%o1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g6,	[%g0 + 0x30] %asi
	ldsw	[%l7 + 0x6C],	%l2
	stx	%i3,	[%l7 + 0x60]
	st	%f8,	[%l7 + 0x7C]
	prefetch	[%l7 + 0x68],	 0x2
	rdhpr	%htba,	%i5
	ldd	[%l7 + 0x40],	%l0
	ldd	[%l7 + 0x18],	%f6
	ldub	[%l7 + 0x19],	%o7
	stw	%i4,	[%l7 + 0x1C]
	stx	%i0,	[%l7 + 0x18]
	nop
	set	0x78, %l4
	std	%f0,	[%l7 + %l4]
	movcs	%xcc,	%o4,	%o3
	ldsb	[%l7 + 0x5F],	%l0
	ldsh	[%l7 + 0x4C],	%g2
	tcs	%icc,	0x3
	movvc	%icc,	%i2,	%g1
	ldx	[%l7 + 0x08],	%i6
	st	%f14,	[%l7 + 0x58]
	lduh	[%l7 + 0x5C],	%g4
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%l6
	stbar
	ldsb	[%l7 + 0x55],	%i7
	swap	[%l7 + 0x08],	%o2
	nop
	set	0x70, %i6
	std	%g2,	[%l7 + %i6]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%l5,	[%g0 + 0x0] %asi
	brgez	%i1,	loop_128
	st	%f8,	[%l7 + 0x28]
	sub	%l3,	0x1303,	%l4
	sth	%o5,	[%l7 + 0x1E]
loop_128:
	stbar
	flush	%l7 + 0x20
	ldx	[%l7 + 0x78],	%g7
	fbuge,a	%fcc1,	loop_129
	sub	%o0,	0x1D9C,	%o6
	ldsw	[%l7 + 0x70],	%g5
	mova	%xcc,	%o1,	%g6
loop_129:
	ldsb	[%l7 + 0x0D],	%l2
	edge16	%i3,	%l1,	%i5
	swap	[%l7 + 0x54],	%o7
	nop
	set	0x50, %o7
	stx	%i4,	[%l7 + %o7]
	swap	[%l7 + 0x78],	%o4
	ld	[%l7 + 0x78],	%f13
	ldub	[%l7 + 0x43],	%o3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o2
	ldxa	[%g0 + %o2] 0x4f,	%l0
	stb	%i0,	[%l7 + 0x1D]
	lduw	[%l7 + 0x48],	%g2
	movrgz	%g1,	%i6,	%g4
	lduh	[%l7 + 0x42],	%i2
	ldub	[%l7 + 0x59],	%i7
	lduh	[%l7 + 0x34],	%l6
	movge	%xcc,	%o2,	%l5
	nop
	set	0x28, %i5
	std	%f22,	[%l7 + %i5]
	bgu	%icc,	loop_130
	std	%g2,	[%l7 + 0x68]
	movn	%xcc,	%l3,	%l4
	st	%f8,	[%l7 + 0x3C]
loop_130:
	stb	%i1,	[%l7 + 0x6F]
	flush	%l7 + 0x78
	edge32	%o5,	%o0,	%g7
	ld	[%l7 + 0x68],	%f13
	stb	%g5,	[%l7 + 0x48]
	orn	%o6,	%g6,	%l2
	add	%i3,	0x0C93,	%o1
	movvc	%icc,	%i5,	%o7
	sth	%i4,	[%l7 + 0x24]
	fnegd	%f18,	%f22
	swap	[%l7 + 0x2C],	%l1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %o5
	stxa	%o3,	[%g0 + %o5] 0x20
	ldsh	[%l7 + 0x7A],	%l0
	taddcc	%i0,	%g2,	%o4
	ldx	[%l7 + 0x68],	%g1
	ldstub	[%l7 + 0x70],	%g4
	lduw	[%l7 + 0x14],	%i2
	st	%f1,	[%l7 + 0x08]
	xorcc	%i6,	0x1638,	%l6
	std	%f20,	[%l7 + 0x20]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fpmerge	%f28,	%f1,	%f16
	std	%i6,	[%l7 + 0x30]
	ldsb	[%l7 + 0x65],	%l3
	std	%f2,	[%l7 + 0x70]
	swap	[%l7 + 0x3C],	%g3
	stb	%l4,	[%l7 + 0x09]
	stx	%o5,	[%l7 + 0x40]
	stw	%i1,	[%l7 + 0x44]
	ldd	[%l7 + 0x40],	%g6
	stbar
	stb	%o0,	[%l7 + 0x75]
	stw	%o6,	[%l7 + 0x3C]
	ld	[%l7 + 0x2C],	%f30
	stx	%g6,	[%l7 + 0x18]
	ldub	[%l7 + 0x1E],	%g5
	mulx	%i3,	0x09F6,	%o1
	wr	%l2,	0x013D,	%clear_softint
	srl	%o7,	%i4,	%i5
	ldx	[%l7 + 0x60],	%l1
	stbar
	ldstub	[%l7 + 0x32],	%l0
	ldsb	[%l7 + 0x14],	%i0
	stbar
	stw	%g2,	[%l7 + 0x14]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %i0
	stxa	%o3,	[%g0 + %i0] 0x20
	stb	%g1,	[%l7 + 0x4F]
	fands	%f21,	%f26,	%f3
	std	%g4,	[%l7 + 0x28]
	tsubcc	%o4,	%i6,	%i2
	ldstub	[%l7 + 0x70],	%l6
	stx	%l5,	[%l7 + 0x68]
	edge16ln	%i7,	%l3,	%g3
	rdhpr	%hpstate,	%l4
	lduw	[%l7 + 0x08],	%o5
	stb	%i1,	[%l7 + 0x2C]
	fmovrslez	%o2,	%f22,	%f15
	ldsb	[%l7 + 0x4D],	%o0
	mulscc	%o6,	0x183E,	%g7
	tcc	%xcc,	0x6
	tge	%xcc,	0x1
	sth	%g6,	[%l7 + 0x1E]
	ldsw	[%l7 + 0x0C],	%i3
	ld	[%l7 + 0x44],	%f4
	ldd	[%l7 + 0x58],	%o0
	ldd	[%l7 + 0x78],	%g4
	stbar
	std	%f16,	[%l7 + 0x40]
	flush	%l7 + 0x78
	std	%l2,	[%l7 + 0x68]
	lduw	[%l7 + 0x5C],	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %g7
	stxa	%o7,	[%g0 + %g7] 0x4f
	ldsb	[%l7 + 0x64],	%l1
	ldub	[%l7 + 0x62],	%l0
	fmuld8ulx16	%f31,	%f6,	%f2
	ldd	[%l7 + 0x58],	%f6
	flush	%l7 + 0x34
	tl	%icc,	0x7
	edge32	%i0,	%i5,	%g2
	fpackfix	%f22,	%f29
	tle	%xcc,	0x6
	flush	%l7 + 0x68
	std	%f0,	[%l7 + 0x28]
	std	%o2,	[%l7 + 0x38]
	wrpr	%g4,	0x004C,	%pil
	tsubcc	%o4,	0x0AB1,	%i6
	ldsw	[%l7 + 0x1C],	%i2
	movgu	%icc,	%g1,	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o6
	ldxa	[%g0 + %o6] 0x4f,	%l6
	subccc	%i7,	%g3,	%l3
	tne	%xcc,	0x2
	std	%l4,	[%l7 + 0x38]
	stx	%i1,	[%l7 + 0x18]
	stx	%o2,	[%l7 + 0x70]
	stbar
	ldsb	[%l7 + 0x58],	%o0
	andn	%o6,	%o5,	%g7
	alignaddr	%g6,	%i3,	%g5
	tvs	%icc,	0x7
	movvc	%xcc,	%o1,	%l2
	ldsb	[%l7 + 0x41],	%i4
	flush	%l7 + 0x08
	stw	%l1,	[%l7 + 0x48]
	movcs	%xcc,	%l0,	%o7
	andn	%i5,	0x16C3,	%g2
	swap	[%l7 + 0x64],	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	stxa	%g4,	[%g0 + 0x20] %asi
	fmovrdgz	%o4,	%f4,	%f28
	ld	[%l7 + 0x50],	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i6,	%i0,	%i2
	wr	%g1,	0x0E45,	%sys_tick
	ldub	[%l7 + 0x7D],	%l6
	ldub	[%l7 + 0x2B],	%l5
	ldx	[%l7 + 0x58],	%i7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %g6
	ldxa	[%g0 + %g6] 0x20,	%l3
	stx	%g3,	[%l7 + 0x08]
	movre	%i1,	%l4,	%o0
	std	%o6,	[%l7 + 0x50]
	fzero	%f0
	swap	[%l7 + 0x3C],	%o5
	orncc	%g7,	0x1545,	%g6
	stbar
	std	%f30,	[%l7 + 0x78]
	stw	%o2,	[%l7 + 0x1C]
	fpack32	%f20,	%f16,	%f28
	nop
	set	0x42, %i2
	sth	%i3,	[%l7 + %i2]
	ld	[%l7 + 0x60],	%f27
	swap	[%l7 + 0x58],	%g5
	tvs	%xcc,	0x5
	nop
	set	0x70, %o1
	ldub	[%l7 + %o1],	%l2
	lduh	[%l7 + 0x30],	%o1
	swap	[%l7 + 0x18],	%l1
	std	%f0,	[%l7 + 0x08]
	mulx	%l0,	%o7,	%i5
	stb	%g2,	[%l7 + 0x76]
	flush	%l7 + 0x3C
	stw	%o3,	[%l7 + 0x30]
	nop
	set	0x64, %l3
	lduw	[%l7 + %l3],	%g4
	nop
	set	0x36, %o4
	stb	%o4,	[%l7 + %o4]
	flush	%l7 + 0x64
	ldsb	[%l7 + 0x20],	%i4
	ldstub	[%l7 + 0x24],	%i6
	stb	%i0,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %i4
	stxa	%i2,	[%g0 + %i4] 0x4f
	fxnor	%f20,	%f8,	%f18
	swap	[%l7 + 0x54],	%l6
	ldd	[%l7 + 0x28],	%f28
	ldsh	[%l7 + 0x46],	%l5
	ldd	[%l7 + 0x58],	%f4
	prefetch	[%l7 + 0x50],	 0x1
	smulcc	%i7,	0x1766,	%l3
	stx	%g3,	[%l7 + 0x50]
	tn	%icc,	0x0
	sth	%i1,	[%l7 + 0x12]
	swap	[%l7 + 0x48],	%g1
	sll	%l4,	%o6,	%o5
	std	%f2,	[%l7 + 0x48]
	stw	%o0,	[%l7 + 0x1C]
	xor	%g6,	%g7,	%o2
	ldsh	[%l7 + 0x48],	%g5
	swap	[%l7 + 0x44],	%i3
	stbar
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%l2
	stw	%l1,	[%l7 + 0x24]
	sra	%l0,	0x12,	%o1
	stx	%i5,	[%l7 + 0x10]
	fpadd16s	%f0,	%f7,	%f16
	mulscc	%o7,	%g2,	%g4
	ldd	[%l7 + 0x70],	%f14
	sth	%o3,	[%l7 + 0x2C]
	rd	%ccr,	%i4
	fmul8x16	%f16,	%f30,	%f26
	stx	%i6,	[%l7 + 0x48]
	ldsh	[%l7 + 0x42],	%o4
	ldstub	[%l7 + 0x29],	%i0
	swap	[%l7 + 0x78],	%i2
	stx	%l6,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i7
	st	%f1,	[%l7 + 0x30]
	xor	%l3,	%l5,	%g3
	stb	%g1,	[%l7 + 0x20]
	st	%f4,	[%l7 + 0x2C]
	swap	[%l7 + 0x40],	%i1
	ld	[%l7 + 0x38],	%f23
	ldsw	[%l7 + 0x70],	%o6
	lduh	[%l7 + 0x6A],	%l4
	ldstub	[%l7 + 0x13],	%o0
	stw	%o5,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o2
	stx	%g5,	[%l7 + 0x18]
	tvc	%xcc,	0x3
	ldsh	[%l7 + 0x46],	%g6
	brlz	%i3,	loop_131
	sth	%l1,	[%l7 + 0x64]
	ldsb	[%l7 + 0x27],	%l0
	move	%icc,	%o1,	%l2
loop_131:
	stw	%o7,	[%l7 + 0x18]
	std	%i4,	[%l7 + 0x60]
	swap	[%l7 + 0x18],	%g4
	ldstub	[%l7 + 0x63],	%g2
	movcc	%icc,	%i4,	%o3
	sll	%o4,	0x03,	%i6
	sth	%i0,	[%l7 + 0x6A]
	bshuffle	%f22,	%f20,	%f4
	stbar
	nop
	set	0x10, %l6
	lduw	[%l7 + %l6],	%i2
	stb	%i7,	[%l7 + 0x2D]
	prefetch	[%l7 + 0x70],	 0x1
	edge8l	%l6,	%l5,	%g3
	ldsw	[%l7 + 0x34],	%g1
	swap	[%l7 + 0x48],	%i1
	ldsb	[%l7 + 0x26],	%o6
	st	%f10,	[%l7 + 0x48]
	lduh	[%l7 + 0x42],	%l3
	lduw	[%l7 + 0x10],	%o0
	nop
	set	0x70, %g5
	ldsh	[%l7 + %g5],	%l4
	ld	[%l7 + 0x18],	%f5
	prefetch	[%l7 + 0x48],	 0x2
	movvc	%icc,	%o5,	%o2
	rdhpr	%hsys_tick_cmpr,	%g7
	stb	%g6,	[%l7 + 0x6A]
	alignaddr	%g5,	%i3,	%l1
	ldstub	[%l7 + 0x3E],	%o1
	ldub	[%l7 + 0x08],	%l2
	stx	%l0,	[%l7 + 0x20]
	sdiv	%i5,	0x1988,	%o7
	tcc	%xcc,	0x0
	subc	%g2,	%g4,	%o3
	st	%f1,	[%l7 + 0x28]
	ldd	[%l7 + 0x78],	%f28
	ldx	[%l7 + 0x48],	%i4
	movleu	%xcc,	%i6,	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldub	[%l7 + 0x43],	%i7
	nop
	set	0x18, %g1
	std	%l4,	[%l7 + %g1]
	ldsw	[%l7 + 0x58],	%l6
	lduh	[%l7 + 0x1A],	%g3
	taddcctv	%g1,	0x1874,	%o6
	lduh	[%l7 + 0x5A],	%l3
	std	%f6,	[%l7 + 0x50]
	edge32	%i1,	%o0,	%l4
	swap	[%l7 + 0x3C],	%o5
	nop
	set	0x63, %o3
	ldstub	[%l7 + %o3],	%o2
	sth	%g7,	[%l7 + 0x22]
	flush	%l7 + 0x08
	lduw	[%l7 + 0x70],	%g5
	ldub	[%l7 + 0x40],	%i3
	lduh	[%l7 + 0x46],	%g6
	nop
	set	0x5F, %l5
	ldstub	[%l7 + %l5],	%o1
	prefetch	[%l7 + 0x44],	 0x1
	srax	%l2,	%l0,	%l1
	st	%f26,	[%l7 + 0x30]
	swap	[%l7 + 0x50],	%o7
	lduw	[%l7 + 0x18],	%i5
	ldd	[%l7 + 0x58],	%g4
	ldx	[%l7 + 0x38],	%o3
	brgez,a	%i4,	loop_132
	tvc	%icc,	0x3
	ldstub	[%l7 + 0x7C],	%g2
	ldd	[%l7 + 0x78],	%f6
loop_132:
	swap	[%l7 + 0x28],	%i0
	nop
	set	0x78, %l0
	stx	%o4,	[%l7 + %l0]
	st	%f3,	[%l7 + 0x34]
	stbar
	sll	%i6,	%i7,	%i2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %i7
	stxa	%l5,	[%g0 + %i7] 0x4f
	stbar
	ldub	[%l7 + 0x58],	%l6
	std	%g0,	[%l7 + 0x48]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%o6,	[%g0 + 0x30] %asi
	ldd	[%l7 + 0x68],	%g2
	fcmped	%fcc3,	%f16,	%f30
	stw	%l3,	[%l7 + 0x64]
	umulcc	%o0,	0x1128,	%i1
	ldsb	[%l7 + 0x4C],	%o5
	fnot2	%f4,	%f10
	flush	%l7 + 0x24
	stx	%o2,	[%l7 + 0x28]
	std	%f18,	[%l7 + 0x48]
	std	%f6,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l4
	stb	%g7,	[%l7 + 0x43]
	ldd	[%l7 + 0x10],	%g4
	mulscc	%g6,	0x0488,	%o1
	ldx	[%l7 + 0x48],	%i3
	ldd	[%l7 + 0x18],	%l0
	ldd	[%l7 + 0x08],	%l0
	std	%l2,	[%l7 + 0x30]
	lduw	[%l7 + 0x08],	%i5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o7
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f4
	fbue	%fcc3,	loop_133
	st	%f24,	[%l7 + 0x1C]
	sth	%g4,	[%l7 + 0x72]
	fnot1s	%f26,	%f5
loop_133:
	ldsb	[%l7 + 0x4F],	%o3
	swap	[%l7 + 0x7C],	%i4
	ldstub	[%l7 + 0x15],	%i0
	lduh	[%l7 + 0x18],	%g2
	flush	%l7 + 0x18
	rdpr	%gl,	%i6
	std	%i6,	[%l7 + 0x78]
	swap	[%l7 + 0x74],	%o4
	ldd	[%l7 + 0x18],	%f26
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%i2
	sethi	0x0747,	%l5
	ldstub	[%l7 + 0x65],	%g1
	stw	%l6,	[%l7 + 0x54]
	fone	%f30
	lduh	[%l7 + 0x10],	%g3
	prefetch	[%l7 + 0x08],	 0x1
	movne	%icc,	%l3,	%o6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %l2
	ldxa	[%g0 + %l2] 0x20,	%o5
	st	%f6,	[%l7 + 0x1C]
	stb	%o2,	[%l7 + 0x34]
	nop
	set	0x64, %i3
	ldsh	[%l7 + %i3],	%g7
	lduw	[%l7 + 0x1C],	%l4
	ldd	[%l7 + 0x78],	%g6
	orcc	%o1,	0x0493,	%i3
	st	%f26,	[%l7 + 0x64]
	xnorcc	%g5,	0x0D6B,	%l1
	ld	[%l7 + 0x48],	%f0
	umul	%l0,	%l2,	%i5
	st	%f6,	[%l7 + 0x24]
	flush	%l7 + 0x68
	wr	%o7,	%g4,	%set_softint
	std	%o2,	[%l7 + 0x68]
	ldx	[%l7 + 0x48],	%i4
	sth	%i0,	[%l7 + 0x30]
	sth	%i6,	[%l7 + 0x72]
	for	%f26,	%f26,	%f30
	wrpr	%i7,	0x0EF1,	%pil
	swap	[%l7 + 0x44],	%g2
	edge16ln	%i2,	%o4,	%g1
	stb	%l6,	[%l7 + 0x0F]
	movrlez	%g3,	0x1F2,	%l5
	stw	%l3,	[%l7 + 0x1C]
	ldd	[%l7 + 0x68],	%f14
	std	%o0,	[%l7 + 0x68]
	movpos	%icc,	%i1,	%o6
	std	%o2,	[%l7 + 0x38]
	ldsh	[%l7 + 0x4C],	%g7
	std	%f16,	[%l7 + 0x38]
	wrpr	%l4,	%o5,	%cwp
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o0
	stxa	%o1,	[%g0 + %o0] 0x20
	lduw	[%l7 + 0x08],	%g6
	flush	%l7 + 0x78
	ba,a	loop_134
	stb	%i3,	[%l7 + 0x2D]
	ldsb	[%l7 + 0x13],	%g5
	ldd	[%l7 + 0x50],	%f28
loop_134:
	nop
	set	0x48, %l4
	stx	%l1,	[%l7 + %l4]
	movn	%xcc,	%l0,	%i5
	stw	%o7,	[%l7 + 0x74]
	movcc	%icc,	%l2,	%g4
	std	%f16,	[%l7 + 0x20]
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %i6
	stxa	%i0,	[%g0 + %i6] 0x20
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %o7
	ldxa	[%g0 + %o7] 0x4f,	%i4
	ld	[%l7 + 0x74],	%f3
	std	%i6,	[%l7 + 0x30]
	stx	%i7,	[%l7 + 0x68]
	fmovsvc	%icc,	%f15,	%f21
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %i1
	ldxa	[%g0 + %i1] 0x20,	%i2
	std	%o4,	[%l7 + 0x50]
	ldx	[%l7 + 0x20],	%g2
	fbue	%fcc2,	loop_135
	ldd	[%l7 + 0x68],	%g0
	lduh	[%l7 + 0x48],	%g3
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%l5
loop_135:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	nop
	set	0x28, %o5
	stxa	%l3,	[%g0 + %o5] 0x4f
	movg	%icc,	%o0,	%i1
	prefetch	[%l7 + 0x6C],	 0x3
	movre	%l6,	%o2,	%g7
	faligndata	%f16,	%f6,	%f10
	ldsb	[%l7 + 0x6C],	%l4
	ldd	[%l7 + 0x28],	%f18
	std	%f14,	[%l7 + 0x78]
	ldsw	[%l7 + 0x4C],	%o6
	ldd	[%l7 + 0x40],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %i5
	ldxa	[%g0 + %i5] 0x20,	%o1
	sll	%i3,	%g5,	%g6
	ldd	[%l7 + 0x78],	%l0
	ldsh	[%l7 + 0x18],	%i5
	umulcc	%o7,	%l1,	%g4
	ldsh	[%l7 + 0x24],	%l2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g7
	ldxa	[%g0 + %g7] 0x20,	%i0
	std	%i4,	[%l7 + 0x58]
	array16	%o3,	%i7,	%i6
	tvs	%xcc,	0x3
	movpos	%xcc,	%o4,	%i2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %o6
	stxa	%g2,	[%g0 + %o6] 0x4f
	lduw	[%l7 + 0x68],	%g3
	fbuge	%fcc1,	loop_136
	tcs	%xcc,	0x6
	ldub	[%l7 + 0x14],	%g1
	sth	%l5,	[%l7 + 0x2E]
loop_136:
	movneg	%xcc,	%o0,	%l3
	ldstub	[%l7 + 0x30],	%l6
	lduw	[%l7 + 0x54],	%o2
	ldd	[%l7 + 0x28],	%f12
	lduh	[%l7 + 0x7C],	%g7
	swap	[%l7 + 0x58],	%i1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i0
	ldxa	[%g0 + %i0] 0x20,	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g6
	stxa	%o5,	[%g0 + %g6] 0x20
	ldx	[%l7 + 0x50],	%o1
	stx	%o6,	[%l7 + 0x40]
	ldx	[%l7 + 0x28],	%i3
	xnorcc	%g6,	0x1A26,	%l0
	stw	%i5,	[%l7 + 0x68]
	nop
	set	0x18, %o1
	std	%f28,	[%l7 + %o1]
	xor	%g5,	%l1,	%g4
	stbar
	st	%f24,	[%l7 + 0x4C]
	ldd	[%l7 + 0x48],	%f8
	ldsh	[%l7 + 0x28],	%l2
	lduh	[%l7 + 0x38],	%o7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i0
	lduh	[%l7 + 0x5A],	%i4
	ldx	[%l7 + 0x60],	%o3
	tle	%icc,	0x6
	stx	%i7,	[%l7 + 0x30]
	fmovd	%f8,	%f0
	prefetch	[%l7 + 0x18],	 0x2
	alignaddr	%i6,	%o4,	%g2
	stb	%g3,	[%l7 + 0x0F]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	stxa	%i2,	[%g0 + 0x28] %asi
	edge16	%l5,	%o0,	%l3
	ld	[%l7 + 0x28],	%f4
	std	%i6,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%o2,	[%g0 + 0x0] %asi
	st	%f17,	[%l7 + 0x24]
	ld	[%l7 + 0x08],	%f2
	ldstub	[%l7 + 0x71],	%g7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g1
	tn	%xcc,	0x0
	ldd	[%l7 + 0x60],	%f18
	ld	[%l7 + 0x78],	%f9
	xor	%l4,	%i1,	%o5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %i2
	stxa	%o1,	[%g0 + %i2] 0x4f
	lduw	[%l7 + 0x50],	%o6
	movle	%icc,	%g6,	%i3
	movgu	%xcc,	%l0,	%i5
	ldsw	[%l7 + 0x5C],	%g5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	stxa	%g4,	[%g0 + 0x28] %asi
	addc	%l1,	%l2,	%o7
	addc	%i4,	%i0,	%o3
	subccc	%i7,	%i6,	%g2
	stw	%o4,	[%l7 + 0x68]
	fbul,a	%fcc0,	loop_137
	ldsb	[%l7 + 0x55],	%i2
	membar	0x24
	ldstub	[%l7 + 0x78],	%g3
loop_137:
	flush	%l7 + 0x4C
	fpack16	%f22,	%f11
	rdhpr	%hintp,	%o0
	ldsw	[%l7 + 0x24],	%l5
	stbar
	rdhpr	%htba,	%l3
	std	%o2,	[%l7 + 0x48]
	prefetch	[%l7 + 0x38],	 0x3
	ld	[%l7 + 0x6C],	%f4
	ldx	[%l7 + 0x60],	%l6
	prefetch	[%l7 + 0x14],	 0x0
	sth	%g7,	[%l7 + 0x2E]
	ld	[%l7 + 0x08],	%f2
	ldsh	[%l7 + 0x72],	%l4
	ldx	[%l7 + 0x60],	%i1
	andn	%o5,	0x09D8,	%o1
	stb	%o6,	[%l7 + 0x11]
	stw	%g1,	[%l7 + 0x70]
	lduw	[%l7 + 0x48],	%g6
	alignaddrl	%l0,	%i5,	%i3
	wrpr	%g5,	0x0A1C,	%pil
	sth	%l1,	[%l7 + 0x20]
	lduh	[%l7 + 0x42],	%l2
	lduh	[%l7 + 0x26],	%o7
	movgu	%xcc,	%i4,	%i0
	ldub	[%l7 + 0x0A],	%g4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%o3,	[%g0 + 0x38] %asi
	stb	%i7,	[%l7 + 0x7B]
	fmovdcs	%icc,	%f3,	%f4
	flush	%l7 + 0x10
	fbuge,a	%fcc1,	loop_138
	bpos,a	loop_139
	swap	[%l7 + 0x4C],	%g2
	nop
	set	0x78, %o4
	stx	%o4,	[%l7 + %o4]
loop_138:
	ldsw	[%l7 + 0x2C],	%i6
loop_139:
	ld	[%l7 + 0x68],	%f30
	stb	%i2,	[%l7 + 0x53]
	ldd	[%l7 + 0x68],	%f20
	ldsw	[%l7 + 0x10],	%g3
	lduw	[%l7 + 0x34],	%o0
	ldsb	[%l7 + 0x5B],	%l5
	st	%f9,	[%l7 + 0x08]
	stbar
	lduw	[%l7 + 0x30],	%l3
	bpos	loop_140
	nop
	set	0x70, %i4
	std	%f4,	[%l7 + %i4]
	stx	%o2,	[%l7 + 0x68]
	stx	%l6,	[%l7 + 0x38]
loop_140:
	ldsh	[%l7 + 0x54],	%g7
	fmovda	%icc,	%f11,	%f19
	ld	[%l7 + 0x78],	%f29
	orn	%i1,	%o5,	%l4
	stx	%o6,	[%l7 + 0x58]
	umulcc	%g1,	%o1,	%l0
	edge16n	%i5,	%i3,	%g6
	stb	%l1,	[%l7 + 0x7F]
	lduw	[%l7 + 0x7C],	%l2
	te	%xcc,	0x1
	stb	%g5,	[%l7 + 0x13]
	brgez	%i4,	loop_141
	swap	[%l7 + 0x20],	%i0
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%o7
	edge16	%o3,	%g4,	%g2
loop_141:
	ldx	[%l7 + 0x20],	%o4
	swap	[%l7 + 0x3C],	%i6
	nop
	set	0x7C, %l3
	prefetch	[%l7 + %l3],	 0x2
	bcc,a	%icc,	loop_142
	swap	[%l7 + 0x48],	%i7
	fmovscc	%icc,	%f18,	%f15
	ldub	[%l7 + 0x30],	%g3
loop_142:
	ld	[%l7 + 0x38],	%f19
	brnz,a	%i2,	loop_143
	ldx	[%l7 + 0x38],	%o0
	swap	[%l7 + 0x34],	%l5
	movle	%xcc,	%l3,	%o2
loop_143:
	wrpr	%l6,	%g7,	%pil
	std	%i0,	[%l7 + 0x68]
	ldd	[%l7 + 0x10],	%f8
	subc	%o5,	%l4,	%o6
	nop
	setx	loop_144,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdg	%xcc,	%f4,	%f6
	mova	%icc,	%o1,	%l0
	ldsw	[%l7 + 0x60],	%g1
loop_144:
	movvs	%xcc,	%i3,	%i5
	ldstub	[%l7 + 0x76],	%g6
	std	%l0,	[%l7 + 0x10]
	nop
	set	0x08, %g5
	stw	%g5,	[%l7 + %g5]
	std	%f28,	[%l7 + 0x38]
	fmovrdne	%i4,	%f22,	%f18
	ta	%icc,	0x6
	smulcc	%l2,	%i0,	%o3
	tcs	%xcc,	0x6
	ldd	[%l7 + 0x10],	%f12
	fmovdne	%xcc,	%f30,	%f9
	xnor	%g4,	%o7,	%o4
	ldd	[%l7 + 0x50],	%g2
	swap	[%l7 + 0x54],	%i6
	stx	%i7,	[%l7 + 0x28]
	lduw	[%l7 + 0x60],	%i2
	lduh	[%l7 + 0x28],	%g3
	st	%f14,	[%l7 + 0x30]
	ldstub	[%l7 + 0x34],	%o0
	lduh	[%l7 + 0x20],	%l5
	ldd	[%l7 + 0x58],	%l2
	ld	[%l7 + 0x3C],	%f10
	ldd	[%l7 + 0x18],	%i6
	st	%f9,	[%l7 + 0x74]
	std	%f22,	[%l7 + 0x30]
	fbe,a	%fcc2,	loop_145
	flush	%l7 + 0x7C
	ldsb	[%l7 + 0x36],	%o2
	ldub	[%l7 + 0x2C],	%g7
loop_145:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	nop
	set	0x0, %g1
	stxa	%i1,	[%g0 + %g1] 0x20
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o3
	ldxa	[%g0 + %o3] 0x4f,	%o5
	st	%f24,	[%l7 + 0x10]
	stb	%l4,	[%l7 + 0x2F]
	fnot1s	%f10,	%f7
	ldx	[%l7 + 0x38],	%o1
	ldx	[%l7 + 0x10],	%l0
	st	%f4,	[%l7 + 0x2C]
	std	%f12,	[%l7 + 0x20]
	ldsw	[%l7 + 0x1C],	%o6
	ldx	[%l7 + 0x78],	%g1
	fnot2	%f30,	%f0
	ldx	[%l7 + 0x68],	%i3
	tne	%icc,	0x5
	nop
	set	0x60, %l6
	stw	%g6,	[%l7 + %l6]
	subccc	%i5,	%g5,	%i4
	fzero	%f16
	rdhpr	%hintp,	%l2
	st	%f16,	[%l7 + 0x30]
	alignaddrl	%l1,	%i0,	%g4
	tne	%icc,	0x1
	mova	%icc,	%o3,	%o4
	flush	%l7 + 0x6C
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%g2,	[%g0 + 0x8] %asi
	nop
	set	0x40, %l0
	stx	%o7,	[%l7 + %l0]
	std	%f2,	[%l7 + 0x58]
	lduh	[%l7 + 0x62],	%i7
	ldsh	[%l7 + 0x6C],	%i6
	ldub	[%l7 + 0x14],	%i2
	addc	%g3,	%l5,	%l3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x60],	%o0
	lduw	[%l7 + 0x6C],	%g7
	lduh	[%l7 + 0x42],	%i1
	fbuge	%fcc2,	loop_146
	fcmpd	%fcc1,	%f18,	%f4
	ldd	[%l7 + 0x40],	%l4
	flush	%l7 + 0x38
loop_146:
	popc	0x096D,	%o1
	ld	[%l7 + 0x4C],	%f28
	nop
	set	0x64, %i7
	stw	%o5,	[%l7 + %i7]
	std	%o6,	[%l7 + 0x18]
	lduh	[%l7 + 0x0E],	%g1
	movneg	%xcc,	%l0,	%g6
	flush	%l7 + 0x18
	ldd	[%l7 + 0x58],	%i4
	tgu	%icc,	0x7
	st	%f4,	[%l7 + 0x38]
	tne	%icc,	0x5
	std	%g4,	[%l7 + 0x28]
	st	%f20,	[%l7 + 0x10]
	ldsb	[%l7 + 0x7D],	%i4
	movgu	%xcc,	%l2,	%l1
	edge32n	%i3,	%g4,	%i0
	lduh	[%l7 + 0x7C],	%o4
	ld	[%l7 + 0x5C],	%f22
	fnands	%f10,	%f5,	%f22
	swap	[%l7 + 0x60],	%o3
	ldd	[%l7 + 0x68],	%o6
	sethi	0x124C,	%i7
	nop
	set	0x57, %g2
	ldstub	[%l7 + %g2],	%g2
	smul	%i2,	0x16F0,	%g3
	stw	%l5,	[%l7 + 0x74]
	st	%f5,	[%l7 + 0x28]
	stw	%i6,	[%l7 + 0x50]
	movle	%xcc,	%l6,	%l3
	fmovdgu	%xcc,	%f15,	%f0
	ldx	[%l7 + 0x40],	%o2
	taddcctv	%o0,	%g7,	%i1
	stx	%l4,	[%l7 + 0x30]
	fmovdg	%icc,	%f18,	%f6
	wrpr	%o1,	0x1363,	%cwp
	ldsw	[%l7 + 0x08],	%o6
	ldstub	[%l7 + 0x30],	%o5
	st	%f0,	[%l7 + 0x5C]
	ldsw	[%l7 + 0x6C],	%l0
	wrpr	%g1,	%i5,	%cwp
	edge32	%g6,	%i4,	%l2
	nop
	set	0x5A, %l5
	ldstub	[%l7 + %l5],	%g5
	std	%i2,	[%l7 + 0x20]
	ldd	[%l7 + 0x50],	%f28
	fcmpne32	%f24,	%f0,	%l1
	fnot1s	%f20,	%f23
	std	%g4,	[%l7 + 0x20]
	flush	%l7 + 0x78
	ldub	[%l7 + 0x2D],	%o4
	stx	%i0,	[%l7 + 0x68]
	flush	%l7 + 0x78
	fmovsvc	%icc,	%f14,	%f18
	flush	%l7 + 0x5C
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %l1
	stxa	%o3,	[%g0 + %l1] 0x20
	andncc	%i7,	%g2,	%o7
	ldsh	[%l7 + 0x44],	%g3
	swap	[%l7 + 0x50],	%i2
	movleu	%xcc,	%i6,	%l5
	st	%f25,	[%l7 + 0x28]
	ldsb	[%l7 + 0x6B],	%l3
	rdhpr	%hsys_tick_cmpr,	%l6
	flush	%l7 + 0x0C
	edge8ln	%o2,	%g7,	%i1
	subc	%l4,	%o1,	%o6
	ldx	[%l7 + 0x68],	%o0
	swap	[%l7 + 0x68],	%o5
	tvc	%icc,	0x2
	brlz	%g1,	loop_147
	ldub	[%l7 + 0x6E],	%i5
	sth	%g6,	[%l7 + 0x60]
	movne	%icc,	%i4,	%l0
loop_147:
	st	%f17,	[%l7 + 0x78]
	std	%g4,	[%l7 + 0x58]
	nop
	set	0x44, %i3
	lduh	[%l7 + %i3],	%i3
	fmovrdgez	%l2,	%f6,	%f20
	sir	0x0E81
	orcc	%l1,	0x1A56,	%g4
	st	%f23,	[%l7 + 0x10]
	prefetch	[%l7 + 0x48],	 0x0
	swap	[%l7 + 0x7C],	%o4
	fnand	%f22,	%f20,	%f10
	stw	%i0,	[%l7 + 0x64]
	nop
	set	0x09, %o0
	ldsb	[%l7 + %o0],	%i7
	sllx	%o3,	0x1B,	%g2
	nop
	set	0x6F, %l4
	stb	%o7,	[%l7 + %l4]
	ldd	[%l7 + 0x50],	%i2
	prefetch	[%l7 + 0x34],	 0x1
	std	%i6,	[%l7 + 0x68]
	ldsh	[%l7 + 0x64],	%l5
	std	%l2,	[%l7 + 0x50]
	ldstub	[%l7 + 0x2E],	%g3
	lduh	[%l7 + 0x66],	%l6
	stb	%g7,	[%l7 + 0x63]
	ldsb	[%l7 + 0x3E],	%i1
	ldstub	[%l7 + 0x4F],	%o2
	ble	%icc,	loop_148
	st	%f26,	[%l7 + 0x3C]
	ldsw	[%l7 + 0x2C],	%l4
	edge16	%o1,	%o6,	%o0
loop_148:
	edge32	%o5,	%i5,	%g6
	fcmple16	%f30,	%f30,	%g1
	fandnot2s	%f28,	%f27,	%f19
	fmovsg	%xcc,	%f8,	%f24
	nop
	set	0x6A, %g4
	lduh	[%l7 + %g4],	%l0
	lduh	[%l7 + 0x44],	%i4
	ldsw	[%l7 + 0x78],	%i3
	ldsh	[%l7 + 0x72],	%g5
	nop
	set	0x26, %l2
	lduh	[%l7 + %l2],	%l1
	stx	%l2,	[%l7 + 0x40]
	swap	[%l7 + 0x5C],	%o4
	ld	[%l7 + 0x4C],	%f30
	st	%f29,	[%l7 + 0x14]
	fmovsneg	%xcc,	%f9,	%f27
	bge,a	%icc,	loop_149
	pdist	%f16,	%f26,	%f16
	ldub	[%l7 + 0x58],	%g4
	ldsb	[%l7 + 0x60],	%i7
loop_149:
	stb	%i0,	[%l7 + 0x42]
	ldub	[%l7 + 0x7F],	%o3
	ldsb	[%l7 + 0x67],	%o7
	ld	[%l7 + 0x50],	%f24
	ldsb	[%l7 + 0x09],	%i2
	sth	%i6,	[%l7 + 0x0A]
	ld	[%l7 + 0x24],	%f24
	ldsh	[%l7 + 0x32],	%g2
	prefetch	[%l7 + 0x74],	 0x2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%l5,	[%g0 + 0x18] %asi
	movrgz	%g3,	0x36A,	%l3
	ldx	[%l7 + 0x78],	%g7
	lduw	[%l7 + 0x68],	%i1
	ldub	[%l7 + 0x5F],	%l6
	umulcc	%o2,	%o1,	%o6
	ldub	[%l7 + 0x65],	%l4
	stbar
	ldsh	[%l7 + 0x3A],	%o5
	wr	%i5,	%g6,	%ccr
	xnor	%o0,	0x05CE,	%l0
	ldsw	[%l7 + 0x40],	%i4
	ldstub	[%l7 + 0x6B],	%g1
	mova	%icc,	%g5,	%i3
	ldsb	[%l7 + 0x57],	%l2
	tl	%xcc,	0x6
	swap	[%l7 + 0x08],	%l1
	ldd	[%l7 + 0x18],	%f28
	nop
	set	0x70, %i6
	ldsb	[%l7 + %i6],	%g4
	addc	%i7,	0x1203,	%i0
	ldx	[%l7 + 0x60],	%o3
	ldx	[%l7 + 0x38],	%o7
	rd	%fprs,	%i2
	tneg	%icc,	0x7
	ldub	[%l7 + 0x42],	%o4
	subcc	%i6,	0x116A,	%l5
	fand	%f30,	%f4,	%f26
	movn	%xcc,	%g3,	%l3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g7
	ldsb	[%l7 + 0x10],	%i1
	ldsw	[%l7 + 0x3C],	%g2
	ldsb	[%l7 + 0x08],	%l6
	stbar
	ldsh	[%l7 + 0x1C],	%o2
	ldx	[%l7 + 0x70],	%o6
	wrpr	%l4,	%o1,	%cwp
	ldd	[%l7 + 0x18],	%f28
	lduw	[%l7 + 0x64],	%i5
	movle	%icc,	%g6,	%o0
	nop
	set	0x56, %o7
	ldstub	[%l7 + %o7],	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x7A],	%o5
	stbar
	addcc	%g1,	%g5,	%i4
	stb	%l2,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i1
	ldxa	[%g0 + %i1] 0x4f,	%i3
	mulscc	%g4,	0x0745,	%l1
	swap	[%l7 + 0x50],	%i7
	and	%o3,	0x1FDF,	%i0
	stw	%i2,	[%l7 + 0x74]
	ldsh	[%l7 + 0x24],	%o7
	st	%f10,	[%l7 + 0x20]
	ldstub	[%l7 + 0x38],	%o4
	prefetch	[%l7 + 0x60],	 0x1
	ldsw	[%l7 + 0x2C],	%l5
	ldsh	[%l7 + 0x22],	%g3
	addc	%i6,	0x07C5,	%g7
	ldstub	[%l7 + 0x22],	%i1
	stb	%l3,	[%l7 + 0x17]
	ldstub	[%l7 + 0x1A],	%g2
	fmovrsne	%l6,	%f21,	%f25
	std	%f12,	[%l7 + 0x20]
	tleu	%icc,	0x3
	stbar
	ldsh	[%l7 + 0x1E],	%o6
	ldsb	[%l7 + 0x7A],	%l4
	prefetch	[%l7 + 0x24],	 0x3
	stbar
	ldstub	[%l7 + 0x6C],	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %o2
	ldxa	[%g0 + %o2] 0x20,	%i5
	tge	%icc,	0x1
	subcc	%o1,	0x1D2A,	%g6
	lduw	[%l7 + 0x64],	%l0
	movvc	%xcc,	%o0,	%o5
	ldsb	[%l7 + 0x78],	%g5
	movge	%icc,	%g1,	%i4
	ldd	[%l7 + 0x58],	%l2
	ld	[%l7 + 0x2C],	%f8
	lduh	[%l7 + 0x48],	%i3
	ldsw	[%l7 + 0x60],	%g4
	prefetch	[%l7 + 0x50],	 0x1
	edge16ln	%l1,	%i7,	%o3
	stb	%i0,	[%l7 + 0x2A]
	stw	%o7,	[%l7 + 0x40]
	ldd	[%l7 + 0x40],	%f24
	stb	%i2,	[%l7 + 0x5C]
	xnorcc	%o4,	%l5,	%g3
	ldstub	[%l7 + 0x70],	%i6
	lduh	[%l7 + 0x30],	%i1
	std	%l2,	[%l7 + 0x10]
	stbar
	ldd	[%l7 + 0x58],	%g6
	tsubcctv	%l6,	0x06CF,	%o6
	stb	%g2,	[%l7 + 0x3A]
	ld	[%l7 + 0x68],	%f19
	sth	%l4,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %o5
	stxa	%o2,	[%g0 + %o5] 0x4f
	fmovsl	%icc,	%f4,	%f6
	st	%f2,	[%l7 + 0x48]
	sdiv	%i5,	0x0DE1,	%o1
	fba,a	%fcc1,	loop_150
	fpsub16s	%f20,	%f1,	%f26
	ldx	[%l7 + 0x30],	%g6
	stx	%o0,	[%l7 + 0x10]
loop_150:
	ldsb	[%l7 + 0x0B],	%l0
	sth	%o5,	[%l7 + 0x6E]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %i5
	ldxa	[%g0 + %i5] 0x4f,	%g5
	ldd	[%l7 + 0x10],	%g0
	flush	%l7 + 0x64
	stw	%l2,	[%l7 + 0x70]
	std	%f12,	[%l7 + 0x28]
	ldstub	[%l7 + 0x14],	%i3
	ldsh	[%l7 + 0x4E],	%i4
	rd	%tick_cmpr,	%l1
	ldd	[%l7 + 0x40],	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fabsd	%f16,	%f18
	nop
	set	0x46, %g7
	lduh	[%l7 + %g7],	%g4
	ldd	[%l7 + 0x48],	%o6
	ldsb	[%l7 + 0x61],	%i0
	lduh	[%l7 + 0x7E],	%i2
	prefetch	[%l7 + 0x68],	 0x1
	xnor	%o4,	%l5,	%g3
	flush	%l7 + 0x70
	stx	%i1,	[%l7 + 0x10]
	ldub	[%l7 + 0x39],	%i6
	umulcc	%l3,	%l6,	%o6
	move	%icc,	%g2,	%g7
	fandnot2s	%f18,	%f4,	%f1
	std	%f24,	[%l7 + 0x40]
	add	%l4,	0x1F71,	%i5
	stw	%o2,	[%l7 + 0x64]
	lduh	[%l7 + 0x0A],	%g6
	stbar
	bgu	%icc,	loop_151
	tvc	%xcc,	0x6
	movrlez	%o0,	0x3CF,	%l0
	edge32ln	%o5,	%o1,	%g5
loop_151:
	ldsb	[%l7 + 0x18],	%l2
	ldsw	[%l7 + 0x24],	%i3
	ldub	[%l7 + 0x13],	%i4
	lduw	[%l7 + 0x14],	%l1
	lduw	[%l7 + 0x1C],	%g1
	stx	%o3,	[%l7 + 0x38]
	nop
	set	0x18, %o6
	std	%f10,	[%l7 + %o6]
	edge32ln	%i7,	%g4,	%i0
	ldsw	[%l7 + 0x20],	%o7
	ldstub	[%l7 + 0x4C],	%o4
	andncc	%l5,	%i2,	%i1
	ldstub	[%l7 + 0x2E],	%g3
	srlx	%l3,	0x0A,	%l6
	stw	%i6,	[%l7 + 0x58]
	stw	%g2,	[%l7 + 0x78]
	ldsw	[%l7 + 0x24],	%g7
	ld	[%l7 + 0x24],	%f28
	ldstub	[%l7 + 0x17],	%l4
	fors	%f24,	%f7,	%f18
	flush	%l7 + 0x28
	movcc	%xcc,	%i5,	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%o6,	[%g0 + 0x30] %asi
	ldd	[%l7 + 0x48],	%o0
	ldx	[%l7 + 0x20],	%l0
	fabss	%f12,	%f27
	flush	%l7 + 0x74
	nop
	set	0x7F, %g6
	ldsb	[%l7 + %g6],	%o5
	fmovrslz	%g6,	%f24,	%f2
	xor	%o1,	%g5,	%l2
	stb	%i4,	[%l7 + 0x78]
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%i3
	prefetch	[%l7 + 0x40],	 0x1
	lduh	[%l7 + 0x7E],	%g1
	brnz	%o3,	loop_152
	move	%xcc,	%l1,	%g4
	ld	[%l7 + 0x34],	%f15
	fmovrdlz	%i7,	%f6,	%f16
loop_152:
	nop
	set	0x48, %i2
	std	%i0,	[%l7 + %i2]
	tvc	%xcc,	0x3
	stw	%o4,	[%l7 + 0x78]
	rdhpr	%hsys_tick_cmpr,	%l5
	ld	[%l7 + 0x1C],	%f21
	swap	[%l7 + 0x64],	%i2
	st	%f12,	[%l7 + 0x64]
	fpadd16	%f0,	%f18,	%f28
	fxnors	%f26,	%f23,	%f23
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
	std	%g2,	[%l7 + 0x60]
	std	%f22,	[%l7 + 0x08]
	stbar
	stx	%l3,	[%l7 + 0x58]
	fmuld8ulx16	%f14,	%f7,	%f10
	rdhpr	%htba,	%o7
	ldsb	[%l7 + 0x56],	%l6
	ldub	[%l7 + 0x41],	%i6
	lduw	[%l7 + 0x5C],	%g7
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f6
	stb	%l4,	[%l7 + 0x75]
	ldx	[%l7 + 0x08],	%i5
	stw	%g2,	[%l7 + 0x08]
	ldub	[%l7 + 0x22],	%o6
	bn,pt	%xcc,	loop_153
	srl	%o2,	0x17,	%l0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
loop_153:
	ldstub	[%l7 + 0x1A],	%o0
	lduh	[%l7 + 0x6A],	%g6
	stb	%g5,	[%l7 + 0x15]
	flush	%l7 + 0x3C
	movge	%xcc,	%l2,	%i4
	fcmpes	%fcc2,	%f13,	%f17
	flush	%l7 + 0x08
	addccc	%i3,	%o1,	%o3
	ldstub	[%l7 + 0x52],	%l1
	ldd	[%l7 + 0x48],	%f12
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i0
	stxa	%g1,	[%g0 + %i0] 0x20
	ldstub	[%l7 + 0x65],	%i7
	movrlz	%g4,	%o4,	%i0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%i2,	[%g0 + 0x18] %asi
	prefetch	[%l7 + 0x7C],	 0x1
	swap	[%l7 + 0x58],	%i1
	flush	%l7 + 0x24
	tsubcctv	%g3,	0x04CA,	%l3
	sth	%l5,	[%l7 + 0x46]
	std	%f22,	[%l7 + 0x60]
	ldub	[%l7 + 0x6A],	%o7
	stx	%i6,	[%l7 + 0x30]
	array16	%l6,	%l4,	%i5
	ldsb	[%l7 + 0x46],	%g7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g2
	ldx	[%l7 + 0x20],	%o2
	ldsh	[%l7 + 0x52],	%o6
	ld	[%l7 + 0x48],	%f23
	movge	%icc,	%l0,	%o5
	ldsh	[%l7 + 0x46],	%g6
	addc	%g5,	0x1A68,	%l2
	ldsb	[%l7 + 0x25],	%o0
	std	%i4,	[%l7 + 0x10]
	ldsb	[%l7 + 0x0D],	%i3
	ldd	[%l7 + 0x08],	%f22
	st	%f28,	[%l7 + 0x34]
	ld	[%l7 + 0x64],	%f10
	nop
	setx loop_154, %l0, %l1
	jmpl %l1, %o1
	sra	%l1,	0x0E,	%g1
	ldd	[%l7 + 0x78],	%f0
	stx	%i7,	[%l7 + 0x38]
loop_154:
	movcs	%icc,	%o3,	%o4
	movpos	%xcc,	%g4,	%i2
	lduw	[%l7 + 0x70],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x262, 	%hsys_tick_cmpr
	ldsh	[%l7 + 0x2E],	%l3
	rd	%ccr,	%l5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i4
	stxa	%o7,	[%g0 + %i4] 0x20
	ldsb	[%l7 + 0x51],	%i1
	std	%i6,	[%l7 + 0x28]
	edge32	%l6,	%i5,	%l4
	fpack16	%f6,	%f6
	ldx	[%l7 + 0x58],	%g2
	std	%f18,	[%l7 + 0x18]
	bcc,pn	%icc,	loop_155
	lduw	[%l7 + 0x28],	%o2
	lduw	[%l7 + 0x24],	%o6
	taddcc	%l0,	%g7,	%o5
loop_155:
	movre	%g6,	%l2,	%o0
	nop
	set	0x64, %g3
	lduw	[%l7 + %g3],	%g5
	lduh	[%l7 + 0x6C],	%i3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %g5
	stxa	%o1,	[%g0 + %g5] 0x4f
	bcs,a,pn	%icc,	loop_156
	movleu	%icc,	%l1,	%i4
	ldsw	[%l7 + 0x78],	%i7
	ldd	[%l7 + 0x70],	%o2
loop_156:
	tsubcctv	%g1,	%o4,	%i2
	swap	[%l7 + 0x78],	%i0
	stb	%g3,	[%l7 + 0x20]
	fxor	%f28,	%f28,	%f14
	lduh	[%l7 + 0x14],	%g4
	std	%f16,	[%l7 + 0x48]
	sth	%l5,	[%l7 + 0x6A]
	ld	[%l7 + 0x2C],	%f16
	and	%l3,	%i1,	%i6
	addccc	%l6,	0x1B09,	%o7
	fmovdleu	%icc,	%f18,	%f1
	st	%f10,	[%l7 + 0x4C]
	ldstub	[%l7 + 0x7B],	%l4
	ld	[%l7 + 0x28],	%f21
	fzeros	%f1
	std	%g2,	[%l7 + 0x30]
	lduw	[%l7 + 0x74],	%o2
	movneg	%xcc,	%o6,	%i5
	ldx	[%l7 + 0x68],	%g7
	fandnot1	%f6,	%f10,	%f12
	ldstub	[%l7 + 0x2A],	%l0
	std	%g6,	[%l7 + 0x68]
	lduh	[%l7 + 0x76],	%o5
	fandnot2	%f26,	%f10,	%f22
	std	%o0,	[%l7 + 0x58]
	fmovda	%icc,	%f25,	%f14
	ldsh	[%l7 + 0x5A],	%l2
	fcmps	%fcc3,	%f18,	%f27
	ldsh	[%l7 + 0x70],	%i3
	orncc	%o1,	%l1,	%i4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%g5,	[%g0 + 0x38] %asi
	stbar
	fblg,a	%fcc0,	loop_157
	ldub	[%l7 + 0x1D],	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i7
loop_157:
	nop
	set	0x3D, %l3
	ldsb	[%l7 + %l3],	%g1
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f28
	rdpr	%tba,	%i2
	nop
	set	0x74, %g1
	lduh	[%l7 + %g1],	%o4
	flush	%l7 + 0x44
	ld	[%l7 + 0x3C],	%f2
	ldub	[%l7 + 0x3A],	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %l6
	ldxa	[%g0 + %l6] 0x20,	%g4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %l0
	stxa	%l5,	[%g0 + %l0] 0x20
	flush	%l7 + 0x3C
	std	%l2,	[%l7 + 0x78]
	swap	[%l7 + 0x78],	%i1
	prefetch	[%l7 + 0x0C],	 0x3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i0
	movcs	%icc,	%l6,	%i6
	st	%f12,	[%l7 + 0x24]
	sir	0x1464
	flush	%l7 + 0x44
	mulx	%o7,	0x0EB7,	%g2
	nop
	set	0x45, %g2
	ldsb	[%l7 + %g2],	%o2
	swap	[%l7 + 0x28],	%o6
	ldstub	[%l7 + 0x23],	%l4
	srax	%g7,	%i5,	%g6
	ldsh	[%l7 + 0x38],	%l0
	stbar
	ldd	[%l7 + 0x58],	%o4
	ld	[%l7 + 0x38],	%f12
	ldstub	[%l7 + 0x66],	%l2
	andncc	%i3,	%o1,	%o0
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%l1
	stb	%i4,	[%l7 + 0x71]
	std	%g4,	[%l7 + 0x38]
	ldx	[%l7 + 0x10],	%o3
	fcmpes	%fcc0,	%f7,	%f29
	ldd	[%l7 + 0x30],	%g0
	lduw	[%l7 + 0x70],	%i2
	mulx	%o4,	%g3,	%i7
	stx	%g4,	[%l7 + 0x10]
	xnor	%l5,	%l3,	%i0
	std	%i6,	[%l7 + 0x70]
	fcmpeq16	%f4,	%f14,	%i1
	ldx	[%l7 + 0x78],	%i6
	wrpr	%g2,	%o7,	%cwp
	std	%o2,	[%l7 + 0x20]
	ldsw	[%l7 + 0x70],	%o6
	andcc	%l4,	0x0D44,	%g7
	fpadd32	%f22,	%f14,	%f10
	ldsw	[%l7 + 0x1C],	%i5
	ldsw	[%l7 + 0x60],	%g6
	ldsw	[%l7 + 0x20],	%o5
	ldub	[%l7 + 0x52],	%l2
	std	%i2,	[%l7 + 0x18]
	edge8	%l0,	%o1,	%o0
	tn	%icc,	0x6
	andn	%i4,	%g5,	%o3
	stx	%l1,	[%l7 + 0x68]
	wrpr	%i2,	0x1CA4,	%tick
	fmovdleu	%icc,	%f22,	%f30
	ldsh	[%l7 + 0x6A],	%g1
	fbge,a	%fcc0,	loop_158
	flush	%l7 + 0x28
	swap	[%l7 + 0x74],	%o4
	ldx	[%l7 + 0x60],	%g3
loop_158:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x72],	%g4
	ldstub	[%l7 + 0x73],	%l5
	ldd	[%l7 + 0x08],	%l2
	ldsw	[%l7 + 0x7C],	%i7
	ldsb	[%l7 + 0x77],	%i0
	wrpr	%i1,	%l6,	%pil
	stb	%g2,	[%l7 + 0x35]
	ldsw	[%l7 + 0x0C],	%o7
	stx	%i6,	[%l7 + 0x58]
	movle	%xcc,	%o2,	%o6
	ldstub	[%l7 + 0x15],	%l4
	stbar
	flush	%l7 + 0x74
	fcmps	%fcc1,	%f14,	%f23
	ldub	[%l7 + 0x0A],	%i5
	fmovsg	%xcc,	%f22,	%f28
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g7
	tl	%xcc,	0x3
	ldub	[%l7 + 0x4D],	%o5
	stbar
	ldsh	[%l7 + 0x22],	%l2
	stx	%g6,	[%l7 + 0x20]
	stw	%l0,	[%l7 + 0x68]
	tge	%icc,	0x4
	stb	%i3,	[%l7 + 0x31]
	ldsh	[%l7 + 0x44],	%o1
	ldstub	[%l7 + 0x58],	%i4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o0
	tvs	%icc,	0x1
	ldsh	[%l7 + 0x6C],	%g5
	stx	%l1,	[%l7 + 0x58]
	swap	[%l7 + 0x2C],	%o3
	prefetch	[%l7 + 0x2C],	 0x2
	stw	%i2,	[%l7 + 0x64]
	flush	%l7 + 0x0C
	sdiv	%g1,	0x0442,	%o4
	lduw	[%l7 + 0x2C],	%g4
	flush	%l7 + 0x30
	prefetch	[%l7 + 0x0C],	 0x1
	ld	[%l7 + 0x10],	%f26
	flush	%l7 + 0x4C
	ldsh	[%l7 + 0x2C],	%g3
	tg	%xcc,	0x3
	ldstub	[%l7 + 0x0B],	%l5
	subc	%i7,	%i0,	%l3
	sth	%i1,	[%l7 + 0x4C]
	nop
	set	0x1A, %l1
	lduh	[%l7 + %l1],	%l6
	ldd	[%l7 + 0x60],	%g2
	stbar
	ldub	[%l7 + 0x5B],	%i6
	stb	%o2,	[%l7 + 0x5F]
	lduh	[%l7 + 0x08],	%o6
	stx	%o7,	[%l7 + 0x08]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD78, 	%hsys_tick_cmpr
	ld	[%l7 + 0x68],	%f1
	fble,a	%fcc3,	loop_159
	flush	%l7 + 0x0C
	std	%f20,	[%l7 + 0x50]
	rd	%sys_tick_cmpr,	%l4
loop_159:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	nop
	set	0x38, %i7
	ldxa	[%g0 + %i7] 0x20,	%l2
	std	%g6,	[%l7 + 0x70]
	ldub	[%l7 + 0x1F],	%l0
	udivx	%o5,	0x1D23,	%i3
	stx	%o1,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %o0
	ldxa	[%g0 + %o0] 0x4f,	%i4
	ld	[%l7 + 0x38],	%f28
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x28] %asi
	ldsw	[%l7 + 0x54],	%o3
	ldsb	[%l7 + 0x09],	%l1
	fabss	%f10,	%f13
	lduw	[%l7 + 0x74],	%g1
	sdivcc	%o4,	0x0AC4,	%i2
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f2
	lduw	[%l7 + 0x28],	%g4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l5
	nop
	set	0x38, %i3
	ldsh	[%l7 + %i3],	%g3
	stb	%i7,	[%l7 + 0x4D]
	xnorcc	%l3,	0x06C1,	%i1
	tg	%icc,	0x7
	ldx	[%l7 + 0x68],	%l6
	lduw	[%l7 + 0x0C],	%i0
	std	%f10,	[%l7 + 0x40]
	flush	%l7 + 0x08
	fcmpgt16	%f8,	%f2,	%i6
	fmovrdlez	%o2,	%f12,	%f26
	edge16ln	%o6,	%g2,	%o7
	fnot2	%f6,	%f18
	bcc,pn	%icc,	loop_160
	ldsw	[%l7 + 0x20],	%i5
	ldd	[%l7 + 0x60],	%g6
	nop
	set	0x78, %l2
	lduh	[%l7 + %l2],	%l4
loop_160:
	std	%g6,	[%l7 + 0x28]
	std	%l2,	[%l7 + 0x30]
	stx	%o5,	[%l7 + 0x78]
	ldd	[%l7 + 0x48],	%f16
	ld	[%l7 + 0x6C],	%f4
	ldsb	[%l7 + 0x4C],	%l0
	xnorcc	%i3,	0x15F3,	%o1
	ldd	[%l7 + 0x58],	%f0
	ldd	[%l7 + 0x60],	%g4
	nop
	set	0x58, %i6
	stw	%o0,	[%l7 + %i6]
	edge16l	%o3,	%l1,	%i4
	st	%f25,	[%l7 + 0x48]
	ldsh	[%l7 + 0x50],	%g1
	ldsb	[%l7 + 0x40],	%o4
	fcmpne16	%f28,	%f26,	%g4
	nop
	set	0x10, %o7
	std	%i2,	[%l7 + %o7]
	tne	%xcc,	0x7
	swap	[%l7 + 0x4C],	%g3
	st	%f19,	[%l7 + 0x78]
	ldstub	[%l7 + 0x52],	%l5
	flush	%l7 + 0x30
	nop
	set	0x58, %g4
	sth	%i7,	[%l7 + %g4]
	st	%f29,	[%l7 + 0x0C]
	sth	%l3,	[%l7 + 0x32]
	stbar
	flush	%l7 + 0x60
	ldd	[%l7 + 0x78],	%i6
	lduh	[%l7 + 0x14],	%i1
	sth	%i0,	[%l7 + 0x7A]
	edge8n	%o2,	%i6,	%g2
	stbar
	stbar
	ldsh	[%l7 + 0x5A],	%o6
	fblg	%fcc2,	loop_161
	fabsd	%f12,	%f28
	ldx	[%l7 + 0x08],	%o7
	ldsw	[%l7 + 0x20],	%g7
loop_161:
	ld	[%l7 + 0x3C],	%f17
	tvs	%xcc,	0x3
	stx	%i5,	[%l7 + 0x68]
	std	%g6,	[%l7 + 0x40]
	ldsb	[%l7 + 0x6F],	%l4
	prefetch	[%l7 + 0x7C],	 0x3
	ldd	[%l7 + 0x10],	%l2
	ldsh	[%l7 + 0x58],	%l0
	lduh	[%l7 + 0x76],	%o5
	ld	[%l7 + 0x4C],	%f1
	movvc	%icc,	%o1,	%g5
	nop
	setx	loop_162,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x1E],	%o0
	lduw	[%l7 + 0x28],	%o3
	std	%l0,	[%l7 + 0x48]
loop_162:
	rdhpr	%hintp,	%i3
	xorcc	%i4,	0x1D24,	%g1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xFF2, 	%hsys_tick_cmpr
	umul	%i2,	0x1D14,	%g4
	sdivcc	%l5,	0x0113,	%i7
	std	%f22,	[%l7 + 0x18]
	ldsb	[%l7 + 0x4F],	%l3
	ldsb	[%l7 + 0x5D],	%l6
	fmovdl	%icc,	%f16,	%f8
	stw	%g3,	[%l7 + 0x50]
	nop
	setx	loop_163,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32s	%f23,	%f9,	%f21
	ldsh	[%l7 + 0x62],	%i0
	ld	[%l7 + 0x08],	%f27
loop_163:
	edge8l	%o2,	%i1,	%i6
	ldx	[%l7 + 0x20],	%o6
	flush	%l7 + 0x64
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o2
	stxa	%g2,	[%g0 + %o2] 0x4f
	stx	%g7,	[%l7 + 0x50]
	xor	%i5,	%o7,	%g6
	stb	%l4,	[%l7 + 0x55]
	xor	%l2,	0x033E,	%l0
	st	%f13,	[%l7 + 0x4C]
	st	%f10,	[%l7 + 0x40]
	ldsh	[%l7 + 0x2C],	%o5
	nop
	set	0x40, %o5
	std	%f12,	[%l7 + %o5]
	movgu	%xcc,	%o1,	%o0
	fmovscs	%xcc,	%f21,	%f26
	prefetch	[%l7 + 0x64],	 0x2
	fpsub32	%f20,	%f22,	%f28
	lduh	[%l7 + 0x30],	%g5
	lduh	[%l7 + 0x78],	%o3
	sll	%i3,	0x04,	%i4
	fbo	%fcc0,	loop_164
	fandnot1	%f24,	%f4,	%f18
	st	%f17,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g1,	[%g0 + 0x30] %asi
loop_164:
	ld	[%l7 + 0x10],	%f29
	lduw	[%l7 + 0x20],	%o4
	st	%f6,	[%l7 + 0x34]
	brnz,a	%i2,	loop_165
	lduh	[%l7 + 0x70],	%l1
	ldub	[%l7 + 0x44],	%l5
	fbul	%fcc1,	loop_166
loop_165:
	tleu	%xcc,	0x5
	std	%f12,	[%l7 + 0x48]
	lduh	[%l7 + 0x38],	%g4
loop_166:
	st	%f15,	[%l7 + 0x64]
	fmovsg	%xcc,	%f14,	%f15
	ldsh	[%l7 + 0x4E],	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l3
	std	%i6,	[%l7 + 0x38]
	ldd	[%l7 + 0x60],	%i0
	ldx	[%l7 + 0x30],	%o2
	ldstub	[%l7 + 0x7F],	%g3
	flush	%l7 + 0x10
	ld	[%l7 + 0x20],	%f8
	std	%f30,	[%l7 + 0x68]
	prefetch	[%l7 + 0x50],	 0x2
	st	%f21,	[%l7 + 0x48]
	stx	%i6,	[%l7 + 0x30]
	ldd	[%l7 + 0x48],	%f14
	ldsb	[%l7 + 0x30],	%i1
	orncc	%g2,	%g7,	%o6
	st	%f18,	[%l7 + 0x34]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %i5
	stxa	%o7,	[%g0 + %i5] 0x4f
	lduw	[%l7 + 0x64],	%g6
	fxor	%f30,	%f6,	%f20
	lduh	[%l7 + 0x5E],	%l4
	stb	%l2,	[%l7 + 0x70]
	sth	%l0,	[%l7 + 0x26]
	fmovrsne	%i5,	%f18,	%f26
	stbar
	nop
	setx	loop_167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x64],	%o5
	ldsh	[%l7 + 0x4C],	%o1
	fmovsn	%xcc,	%f14,	%f27
loop_167:
	fmovdcc	%icc,	%f22,	%f10
	edge16ln	%g5,	%o3,	%i3
	stx	%i4,	[%l7 + 0x08]
	fsrc1	%f4,	%f0
	fxnor	%f0,	%f14,	%f30
	fmovrslez	%o0,	%f19,	%f5
	fnors	%f4,	%f20,	%f14
	andn	%g1,	0x1DE8,	%o4
	prefetch	[%l7 + 0x40],	 0x0
	addcc	%l1,	%l5,	%i2
	nop
	setx loop_168, %l0, %l1
	jmpl %l1, %g4
	nop
	set	0x2F, %i1
	stb	%l3,	[%l7 + %i1]
	std	%f24,	[%l7 + 0x68]
	ldd	[%l7 + 0x48],	%f6
loop_168:
	ldub	[%l7 + 0x3D],	%l6
	movne	%xcc,	%i0,	%i7
	ld	[%l7 + 0x14],	%f20
	ldsh	[%l7 + 0x74],	%g3
	andcc	%i6,	0x15B2,	%i1
	edge8n	%o2,	%g7,	%o6
	st	%f16,	[%l7 + 0x34]
	std	%f12,	[%l7 + 0x08]
	swap	[%l7 + 0x60],	%o7
	stbar
	nop
	set	0x50, %o6
	ldsh	[%l7 + %o6],	%g2
	prefetch	[%l7 + 0x08],	 0x1
	prefetch	[%l7 + 0x34],	 0x1
	prefetch	[%l7 + 0x20],	 0x2
	faligndata	%f20,	%f30,	%f10
	ldsb	[%l7 + 0x7D],	%g6
	edge32	%l4,	%l2,	%l0
	rdpr	%canrestore,	%o5
	fmovdvs	%icc,	%f17,	%f14
	movg	%icc,	%o1,	%g5
	rdpr	%canrestore,	%o3
	st	%f29,	[%l7 + 0x18]
	nop
	set	0x5E, %g7
	sth	%i3,	[%l7 + %g7]
	srl	%i5,	0x1D,	%i4
	ldstub	[%l7 + 0x63],	%o0
	ldx	[%l7 + 0x18],	%g1
	ldd	[%l7 + 0x40],	%l0
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %g6
	stxa	%o4,	[%g0 + %g6] 0x4f
	movpos	%xcc,	%i2,	%l5
	swap	[%l7 + 0x4C],	%g4
	umulcc	%l3,	%l6,	%i0
	nop
	set	0x66, %o1
	sth	%i7,	[%l7 + %o1]
	flush	%l7 + 0x5C
	movg	%icc,	%i6,	%g3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %i2
	ldxa	[%g0 + %i2] 0x4f,	%o2
	lduw	[%l7 + 0x28],	%g7
	srlx	%o6,	%o7,	%g2
	stb	%i1,	[%l7 + 0x78]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i0
	ldxa	[%g0 + %i0] 0x4f,	%l4
	stb	%g6,	[%l7 + 0x15]
	movneg	%icc,	%l0,	%l2
	std	%o0,	[%l7 + 0x10]
	flush	%l7 + 0x70
	st	%f21,	[%l7 + 0x48]
	std	%f26,	[%l7 + 0x58]
	nop
	set	0x54, %i4
	ldsw	[%l7 + %i4],	%o5
	movrlez	%o3,	0x0F7,	%g5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%i5,	[%g0 + 0x38] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	stxa	%i4,	[%g0 + 0x0] %asi
	ldx	[%l7 + 0x78],	%i3
	prefetch	[%l7 + 0x1C],	 0x2
	ldsh	[%l7 + 0x0E],	%g1
	ldsb	[%l7 + 0x46],	%o0
	nop
	setx loop_169, %l0, %l1
	jmpl %l1, %o4
	stbar
	tl	%icc,	0x3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x28] %asi
loop_169:
	sth	%i2,	[%l7 + 0x48]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%l5,	[%g0 + 0x10] %asi
	movge	%xcc,	%l3,	%g4
	tsubcc	%i0,	%l6,	%i6
	and	%g3,	0x0AF8,	%o2
	sth	%g7,	[%l7 + 0x58]
	lduw	[%l7 + 0x58],	%i7
	ldx	[%l7 + 0x48],	%o7
	ldstub	[%l7 + 0x45],	%g2
	bge	loop_170
	ld	[%l7 + 0x64],	%f0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	stxa	%o6,	[%g0 + 0x0] %asi
loop_170:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i1
	ldd	[%l7 + 0x10],	%f10
	ldsb	[%l7 + 0x78],	%g6
	edge16	%l0,	%l2,	%o1
	tsubcc	%o5,	%o3,	%l4
	stbar
	st	%f15,	[%l7 + 0x70]
	prefetch	[%l7 + 0x74],	 0x0
	ldsh	[%l7 + 0x30],	%i5
	lduh	[%l7 + 0x66],	%g5
	prefetch	[%l7 + 0x60],	 0x1
	ldub	[%l7 + 0x42],	%i4
	prefetch	[%l7 + 0x44],	 0x0
	sth	%g1,	[%l7 + 0x6A]
	ldsh	[%l7 + 0x08],	%i3
	std	%o0,	[%l7 + 0x70]
	std	%f16,	[%l7 + 0x48]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	ldub	[%l7 + 0x64],	%o4
	stx	%l1,	[%l7 + 0x28]
	xorcc	%i2,	%l3,	%l5
	ldsw	[%l7 + 0x60],	%i0
	xnorcc	%l6,	0x18EA,	%g4
	movrne	%g3,	%o2,	%g7
	ldd	[%l7 + 0x30],	%i6
	edge16ln	%o7,	%g2,	%o6
	lduw	[%l7 + 0x38],	%i6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%i1,	[%g0 + 0x30] %asi
	fmovsgu	%icc,	%f0,	%f0
	std	%f4,	[%l7 + 0x28]
	tcs	%icc,	0x6
	addc	%l0,	0x0719,	%g6
	ldx	[%l7 + 0x60],	%l2
	ldd	[%l7 + 0x40],	%o4
	andcc	%o1,	%o3,	%l4
	movle	%icc,	%i5,	%g5
	srl	%i4,	0x03,	%i3
	ldstub	[%l7 + 0x3E],	%g1
	std	%o4,	[%l7 + 0x38]
	lduw	[%l7 + 0x60],	%o0
	edge16ln	%i2,	%l1,	%l5
	ldd	[%l7 + 0x60],	%f30
	stw	%i0,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x829, 	%hsys_tick_cmpr
	sth	%g4,	[%l7 + 0x1C]
	sth	%l3,	[%l7 + 0x0A]
	ldsb	[%l7 + 0x20],	%o2
	nop
	set	0x36, %o4
	sth	%g7,	[%l7 + %o4]
	ldx	[%l7 + 0x68],	%i7
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%o7
	rd	%y,	%g3
	fmovsge	%xcc,	%f25,	%f15
	ldub	[%l7 + 0x30],	%o6
	sth	%i6,	[%l7 + 0x32]
	rd	%sys_tick_cmpr,	%g2
	ldstub	[%l7 + 0x1E],	%i1
	stw	%g6,	[%l7 + 0x64]
	orcc	%l0,	0x049E,	%l2
	ldsb	[%l7 + 0x6E],	%o5
	ldd	[%l7 + 0x30],	%o0
	ldsb	[%l7 + 0x23],	%o3
	prefetch	[%l7 + 0x14],	 0x3
	swap	[%l7 + 0x7C],	%i5
	fbue	%fcc1,	loop_171
	lduw	[%l7 + 0x54],	%g5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %g5
	stxa	%i4,	[%g0 + %g5] 0x4f
loop_171:
	bcs	%icc,	loop_172
	bg,pt	%icc,	loop_173
	subc	%i3,	%l4,	%o4
	xor	%g1,	%i2,	%o0
loop_172:
	ldstub	[%l7 + 0x35],	%l1
loop_173:
	fmovrsne	%l5,	%f9,	%f20
	fmovdleu	%icc,	%f13,	%f18
	fblg	%fcc2,	loop_174
	or	%i0,	%l6,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x10],	%f11
loop_174:
	nop
	set	0x6E, %o3
	ldub	[%l7 + %o3],	%g4
	umul	%o2,	0x0502,	%g7
	ldub	[%l7 + 0x45],	%o7
	fandnot1	%f16,	%f10,	%f12
	lduh	[%l7 + 0x1E],	%g3
	stbar
	std	%i6,	[%l7 + 0x60]
	std	%f30,	[%l7 + 0x18]
	fmovdne	%icc,	%f21,	%f2
	ldd	[%l7 + 0x28],	%o6
	sir	0x1CCB
	std	%g2,	[%l7 + 0x78]
	ldx	[%l7 + 0x58],	%i6
	stx	%i1,	[%l7 + 0x78]
	flush	%l7 + 0x6C
	subcc	%l0,	0x07C6,	%l2
	stx	%o5,	[%l7 + 0x30]
	std	%o0,	[%l7 + 0x08]
	std	%f4,	[%l7 + 0x08]
	ldsw	[%l7 + 0x38],	%g6
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%i5
	ldx	[%l7 + 0x30],	%o3
	ldstub	[%l7 + 0x12],	%g5
	swap	[%l7 + 0x10],	%i4
	ldub	[%l7 + 0x13],	%l4
	ldd	[%l7 + 0x38],	%f8
	rdpr	%tba,	%i3
	ldsh	[%l7 + 0x78],	%o4
	flush	%l7 + 0x6C
	stx	%i2,	[%l7 + 0x40]
	smulcc	%g1,	0x1817,	%o0
	stw	%l5,	[%l7 + 0x3C]
	swap	[%l7 + 0x08],	%l1
	ldstub	[%l7 + 0x5E],	%l6
	movcc	%icc,	%i0,	%l3
	ldx	[%l7 + 0x68],	%g4
	fxnors	%f29,	%f25,	%f12
	fornot1s	%f12,	%f10,	%f20
	tge	%icc,	0x6
	sth	%g7,	[%l7 + 0x10]
	tleu	%xcc,	0x6
	sth	%o7,	[%l7 + 0x18]
	ld	[%l7 + 0x50],	%f11
	ldd	[%l7 + 0x18],	%o2
	st	%f29,	[%l7 + 0x48]
	bge,a	%icc,	loop_175
	rd	%sys_tick_cmpr,	%g3
	udiv	%i7,	0x0365,	%o6
	ldsh	[%l7 + 0x2A],	%i6
loop_175:
	smul	%g2,	%i1,	%l0
	ldsw	[%l7 + 0x0C],	%l2
	nop
	set	0x36, %l6
	ldsb	[%l7 + %l6],	%o5
	udivx	%o1,	0x1E68,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	std	%f10,	[%l7 + 0x50]
	flush	%l7 + 0x44
	lduh	[%l7 + 0x3E],	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %l0
	ldxa	[%g0 + %l0] 0x4f,	%g6
	ldd	[%l7 + 0x10],	%f10
	nop
	set	0x10, %l3
	std	%f2,	[%l7 + %l3]
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%l4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bg	loop_176
	stbar
	ldd	[%l7 + 0x70],	%f24
	lduh	[%l7 + 0x78],	%g1
loop_176:
	ldstub	[%l7 + 0x41],	%o0
	sdiv	%i2,	0x089D,	%l5
	ldd	[%l7 + 0x10],	%i6
	movrlez	%l1,	%l3,	%g4
	ldsw	[%l7 + 0x4C],	%i0
	andn	%g7,	0x0E25,	%o7
	ldd	[%l7 + 0x40],	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f6,	[%l7 + 0x20]
	std	%f26,	[%l7 + 0x08]
	lduh	[%l7 + 0x1E],	%o2
	taddcctv	%g3,	%i7,	%i6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g2
	ldd	[%l7 + 0x38],	%i0
	stx	%o6,	[%l7 + 0x30]
	stw	%l2,	[%l7 + 0x60]
	fmovsleu	%icc,	%f9,	%f12
	ldub	[%l7 + 0x65],	%l0
	tge	%xcc,	0x7
	sth	%o1,	[%l7 + 0x3E]
	ldd	[%l7 + 0x20],	%i4
	rd	%tick_cmpr,	%o5
	swap	[%l7 + 0x4C],	%o3
	ldstub	[%l7 + 0x4E],	%i4
	stw	%g5,	[%l7 + 0x1C]
	nop
	set	0x38, %g2
	stw	%g6,	[%l7 + %g2]
	ldub	[%l7 + 0x42],	%i3
	ldd	[%l7 + 0x40],	%l4
	ldsw	[%l7 + 0x4C],	%o4
	srlx	%g1,	%o0,	%i2
	std	%i6,	[%l7 + 0x48]
	tvs	%xcc,	0x0
	st	%f11,	[%l7 + 0x08]
	lduw	[%l7 + 0x08],	%l5
	ldsw	[%l7 + 0x58],	%l3
	swap	[%l7 + 0x0C],	%g4
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%l0
	fnot2s	%f0,	%f16
	ldd	[%l7 + 0x08],	%i0
	wr	%g7,	%o2,	%softint
	srlx	%o7,	0x1E,	%g3
	nop
	set	0x52, %i7
	ldsh	[%l7 + %i7],	%i6
	ldd	[%l7 + 0x18],	%i6
	st	%f6,	[%l7 + 0x34]
	nop
	set	0x37, %l4
	ldsb	[%l7 + %l4],	%g2
	ldd	[%l7 + 0x08],	%o6
	lduh	[%l7 + 0x22],	%i1
	nop
	set	0x40, %o0
	ldsb	[%l7 + %o0],	%l2
	rd	%fprs,	%o1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%i5,	[%g0 + 0x8] %asi
	std	%o4,	[%l7 + 0x60]
	ldsw	[%l7 + 0x18],	%o3
	ldsh	[%l7 + 0x24],	%i4
	stb	%g5,	[%l7 + 0x27]
	movn	%icc,	%g6,	%i3
	swap	[%l7 + 0x60],	%l0
	or	%o4,	0x1848,	%g1
	edge8ln	%o0,	%i2,	%l4
	std	%f4,	[%l7 + 0x20]
	sdivx	%l5,	0x03B9,	%l3
	smulcc	%l6,	%g4,	%i0
	ldd	[%l7 + 0x58],	%g6
	stx	%l1,	[%l7 + 0x20]
	stbar
	st	%f30,	[%l7 + 0x20]
	nop
	set	0x6D, %i3
	stb	%o2,	[%l7 + %i3]
	call	loop_177
	sth	%o7,	[%l7 + 0x26]
	smulcc	%g3,	0x177F,	%i7
	lduh	[%l7 + 0x18],	%i6
loop_177:
	stb	%g2,	[%l7 + 0x39]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l2
	stxa	%i1,	[%g0 + %l2] 0x4f
	ldsb	[%l7 + 0x75],	%l2
	tg	%xcc,	0x3
	stbar
	lduw	[%l7 + 0x6C],	%o1
	ldsb	[%l7 + 0x74],	%i5
	ld	[%l7 + 0x1C],	%f29
	ldd	[%l7 + 0x40],	%o4
	sll	%o3,	%i4,	%g5
	rdpr	%cleanwin,	%g6
	addccc	%o6,	%l0,	%o4
	flush	%l7 + 0x18
	mulscc	%i3,	0x01DA,	%g1
	flush	%l7 + 0x3C
	ld	[%l7 + 0x4C],	%f11
	srax	%i2,	%l4,	%o0
	wr	%l5,	%l6,	%sys_tick
	lduw	[%l7 + 0x20],	%g4
	swap	[%l7 + 0x5C],	%i0
	ldsh	[%l7 + 0x6A],	%g7
	rdpr	%pil,	%l3
	ldx	[%l7 + 0x18],	%l1
	flush	%l7 + 0x14
	ldd	[%l7 + 0x78],	%f10
	lduh	[%l7 + 0x68],	%o2
	ldsb	[%l7 + 0x38],	%o7
	nop
	set	0x38, %o7
	stx	%g3,	[%l7 + %o7]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %g4
	stw	%i6,	[%l7 + %g4]
	stx	%i7,	[%l7 + 0x50]
	stw	%i1,	[%l7 + 0x10]
	move	%xcc,	%g2,	%l2
	flush	%l7 + 0x28
	stw	%o1,	[%l7 + 0x58]
	std	%f8,	[%l7 + 0x58]
	stw	%i5,	[%l7 + 0x6C]
	fmovdpos	%icc,	%f9,	%f0
	ld	[%l7 + 0x64],	%f9
	swap	[%l7 + 0x38],	%o3
	popc	0x0F56,	%i4
	swap	[%l7 + 0x3C],	%g5
	stbar
	stb	%o5,	[%l7 + 0x28]
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%o6
	ldub	[%l7 + 0x67],	%l0
	movvc	%xcc,	%g6,	%o4
	fors	%f2,	%f22,	%f27
	edge8	%g1,	%i3,	%l4
	ldstub	[%l7 + 0x09],	%i2
	stx	%o0,	[%l7 + 0x50]
	st	%f24,	[%l7 + 0x60]
	ldx	[%l7 + 0x78],	%l6
	swap	[%l7 + 0x64],	%g4
	std	%f8,	[%l7 + 0x38]
	stx	%i0,	[%l7 + 0x40]
	ldstub	[%l7 + 0x46],	%g7
	fabsd	%f30,	%f2
	stw	%l3,	[%l7 + 0x64]
	ldd	[%l7 + 0x20],	%l4
	stb	%l1,	[%l7 + 0x0B]
	ld	[%l7 + 0x18],	%f3
	udiv	%o2,	0x1B6A,	%o7
	nop
	set	0x66, %i6
	ldub	[%l7 + %i6],	%g3
	lduw	[%l7 + 0x60],	%i6
	ldd	[%l7 + 0x40],	%f30
	ld	[%l7 + 0x34],	%f17
	fabsd	%f20,	%f26
	bcc,pn	%icc,	loop_178
	umulcc	%i7,	0x0419,	%g2
	fmovrdlz	%l2,	%f20,	%f4
	lduw	[%l7 + 0x6C],	%o1
loop_178:
	ldsb	[%l7 + 0x4E],	%i5
	ldsw	[%l7 + 0x50],	%i1
	lduw	[%l7 + 0x3C],	%o3
	prefetch	[%l7 + 0x24],	 0x0
	stx	%i4,	[%l7 + 0x68]
	ldd	[%l7 + 0x60],	%f22
	ldx	[%l7 + 0x58],	%o5
	lduw	[%l7 + 0x6C],	%o6
	ldub	[%l7 + 0x73],	%l0
	lduw	[%l7 + 0x2C],	%g5
	st	%f16,	[%l7 + 0x3C]
	std	%f8,	[%l7 + 0x08]
	flush	%l7 + 0x60
	sth	%o4,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g1
	udivx	%i3,	0x03E8,	%l4
	ldsw	[%l7 + 0x20],	%g6
	ldsb	[%l7 + 0x16],	%o0
	wr	%l6,	%i2,	%softint
	subccc	%i0,	%g7,	%l3
	ldsb	[%l7 + 0x0A],	%l5
	stx	%g4,	[%l7 + 0x78]
	srlx	%o2,	0x1E,	%o7
	wrpr	%l1,	0x0EF2,	%tick
	ldstub	[%l7 + 0x7B],	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i6
	ldd	[%l7 + 0x38],	%f28
	umulcc	%g2,	%l2,	%o1
	te	%xcc,	0x0
	sdiv	%i5,	0x11FF,	%i1
	ldd	[%l7 + 0x20],	%o2
	prefetch	[%l7 + 0x7C],	 0x0
	prefetch	[%l7 + 0x34],	 0x3
	ldsw	[%l7 + 0x48],	%i7
	rdpr	%gl,	%i4
	fblg	%fcc1,	loop_179
	fmovrse	%o6,	%f12,	%f14
	prefetch	[%l7 + 0x54],	 0x3
	std	%o4,	[%l7 + 0x48]
loop_179:
	srl	%g5,	%o4,	%g1
	taddcc	%i3,	0x1E94,	%l0
	ldsw	[%l7 + 0x4C],	%l4
	ldsw	[%l7 + 0x68],	%g6
	stbar
	ldsw	[%l7 + 0x14],	%l6
	flush	%l7 + 0x34
	lduh	[%l7 + 0x2C],	%i2
	nop
	set	0x60, %o5
	std	%f16,	[%l7 + %o5]
	ldx	[%l7 + 0x20],	%i0
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%o0
	std	%g6,	[%l7 + 0x38]
	ldd	[%l7 + 0x50],	%l2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %i1
	stxa	%g4,	[%g0 + %i1] 0x20
	stb	%o2,	[%l7 + 0x71]
	nop
	set	0x08, %g7
	stb	%l5,	[%l7 + %g7]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l1
	flush	%l7 + 0x30
	ld	[%l7 + 0x48],	%f1
	stw	%o7,	[%l7 + 0x1C]
	stb	%g3,	[%l7 + 0x7F]
	ldsw	[%l7 + 0x14],	%i6
	fornot2	%f2,	%f20,	%f6
	swap	[%l7 + 0x38],	%l2
	ldsh	[%l7 + 0x76],	%g2
	tcc	%icc,	0x4
	fnegs	%f10,	%f18
	ld	[%l7 + 0x30],	%f29
	ldstub	[%l7 + 0x37],	%o1
	udivcc	%i1,	0x18E2,	%o3
	ldx	[%l7 + 0x50],	%i5
	swap	[%l7 + 0x2C],	%i7
	ldstub	[%l7 + 0x0E],	%i4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o6
	prefetch	[%l7 + 0x74],	 0x3
	bg,a,pt	%xcc,	loop_180
	ld	[%l7 + 0x3C],	%f21
	fbl,a	%fcc1,	loop_181
	nop
	set	0x0A, %g6
	sth	%g5,	[%l7 + %g6]
loop_180:
	stx	%o5,	[%l7 + 0x48]
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%o4
loop_181:
	ldsw	[%l7 + 0x08],	%g1
	fbug,a	%fcc3,	loop_182
	lduh	[%l7 + 0x70],	%i3
	stb	%l0,	[%l7 + 0x75]
	lduh	[%l7 + 0x2E],	%g6
loop_182:
	ldsw	[%l7 + 0x70],	%l4
	lduh	[%l7 + 0x56],	%i2
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%l6
	movne	%icc,	%i0,	%g7
	ldstub	[%l7 + 0x29],	%l3
	ldstub	[%l7 + 0x5D],	%g4
	ldx	[%l7 + 0x10],	%o0
	ldx	[%l7 + 0x20],	%l5
	sth	%o2,	[%l7 + 0x26]
	ldsh	[%l7 + 0x6A],	%o7
	nop
	set	0x72, %i0
	ldsh	[%l7 + %i0],	%l1
	edge32	%i6,	%g3,	%l2
	swap	[%l7 + 0x0C],	%g2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o1
	std	%i0,	[%l7 + 0x68]
	st	%f14,	[%l7 + 0x34]
	ldub	[%l7 + 0x0C],	%o3
	lduh	[%l7 + 0x72],	%i7
	stx	%i5,	[%l7 + 0x28]
	ldsh	[%l7 + 0x0C],	%i4
	ldsh	[%l7 + 0x68],	%g5
	ldstub	[%l7 + 0x3D],	%o5
	stb	%o4,	[%l7 + 0x1B]
	ldsb	[%l7 + 0x44],	%o6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o1
	stxa	%g1,	[%g0 + %o1] 0x20
	fmovrde	%i3,	%f16,	%f14
	ld	[%l7 + 0x48],	%f5
	flush	%l7 + 0x40
	sth	%l0,	[%l7 + 0x14]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%g6,	[%g0 + 0x18] %asi
	wr	%l4,	%i2,	%y
	ldd	[%l7 + 0x70],	%i6
	mulscc	%g7,	%l3,	%g4
	sth	%i0,	[%l7 + 0x30]
	bl	%xcc,	loop_183
	ldsh	[%l7 + 0x08],	%o0
	fmovdn	%xcc,	%f20,	%f24
	ldd	[%l7 + 0x08],	%o2
loop_183:
	ldsb	[%l7 + 0x4C],	%o7
	for	%f28,	%f10,	%f22
	lduh	[%l7 + 0x1C],	%l5
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%i6
	fnegd	%f28,	%f26
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %o4
	stxa	%l1,	[%g0 + %o4] 0x4f
	rd	%ccr,	%l2
	lduw	[%l7 + 0x30],	%g3
	stb	%g2,	[%l7 + 0x0E]
	prefetch	[%l7 + 0x38],	 0x2
	sth	%i1,	[%l7 + 0x3A]
	ldd	[%l7 + 0x18],	%o2
	ldub	[%l7 + 0x25],	%i7
	std	%i4,	[%l7 + 0x78]
	swap	[%l7 + 0x5C],	%o1
	stw	%i4,	[%l7 + 0x78]
	ldsw	[%l7 + 0x4C],	%o5
	std	%g4,	[%l7 + 0x70]
	rd	%pc,	%o4
	fba	%fcc1,	loop_184
	ta	%xcc,	0x7
	andn	%o6,	%g1,	%l0
	fmovrdgz	%i3,	%f2,	%f26
loop_184:
	sth	%g6,	[%l7 + 0x0C]
	ldx	[%l7 + 0x28],	%i2
	nop
	set	0x58, %g5
	stw	%l6,	[%l7 + %g5]
	stx	%g7,	[%l7 + 0x58]
	lduw	[%l7 + 0x78],	%l3
	tn	%icc,	0x2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%g4,	[%g0 + 0x28] %asi
	lduw	[%l7 + 0x3C],	%l4
	nop
	set	0x44, %g3
	lduw	[%l7 + %g3],	%i0
	nop
	set	0x54, %o3
	prefetch	[%l7 + %o3],	 0x2
	std	%f20,	[%l7 + 0x18]
	fbg,a	%fcc1,	loop_185
	ldstub	[%l7 + 0x14],	%o0
	ldub	[%l7 + 0x5A],	%o7
	ldub	[%l7 + 0x77],	%l5
loop_185:
	st	%f25,	[%l7 + 0x78]
	ldstub	[%l7 + 0x79],	%o2
	ldsh	[%l7 + 0x0E],	%i6
	st	%f17,	[%l7 + 0x0C]
	ldub	[%l7 + 0x4A],	%l2
	nop
	set	0x3A, %g1
	ldub	[%l7 + %g1],	%g3
	std	%l0,	[%l7 + 0x30]
	edge8	%g2,	%i1,	%i7
	prefetch	[%l7 + 0x78],	 0x0
	std	%f14,	[%l7 + 0x50]
	lduw	[%l7 + 0x7C],	%i5
	std	%f2,	[%l7 + 0x20]
	ldd	[%l7 + 0x48],	%f12
	fnot1	%f18,	%f24
	ldsh	[%l7 + 0x54],	%o1
	array8	%o3,	%o5,	%g5
	lduh	[%l7 + 0x38],	%i4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stbar
	flush	%l7 + 0x50
	flushw
	ldstub	[%l7 + 0x0A],	%g1
	rdpr	%canrestore,	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%i3,	[%g0 + 0x38] %asi
	rdhpr	%htba,	%l0
	fmovse	%xcc,	%f5,	%f31
	mulscc	%g6,	%l6,	%i2
	movg	%icc,	%l3,	%g4
	lduh	[%l7 + 0x14],	%l4
	sth	%g7,	[%l7 + 0x4C]
	ldd	[%l7 + 0x08],	%i0
	ldub	[%l7 + 0x5A],	%o0
	edge8l	%o7,	%l5,	%o2
	fbn,a	%fcc2,	loop_186
	fblg	%fcc3,	loop_187
	ldsh	[%l7 + 0x0E],	%l2
	ldd	[%l7 + 0x08],	%f22
loop_186:
	std	%f0,	[%l7 + 0x28]
loop_187:
	stbar
	ldub	[%l7 + 0x73],	%i6
	stbar
	array32	%l1,	%g2,	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%i7,	[%g0 + 0x30] %asi
	flush	%l7 + 0x10
	movpos	%xcc,	%i5,	%o1
	ldsb	[%l7 + 0x60],	%o3
	lduh	[%l7 + 0x28],	%i1
	bshuffle	%f10,	%f26,	%f6
	ldub	[%l7 + 0x1C],	%g5
	flush	%l7 + 0x5C
	std	%f2,	[%l7 + 0x38]
	add	%o5,	%o6,	%g1
	ldd	[%l7 + 0x20],	%f4
	prefetch	[%l7 + 0x7C],	 0x0
	flush	%l7 + 0x74
	stx	%i4,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%o4,	[%g0 + 0x10] %asi
	ldsh	[%l7 + 0x1E],	%l0
	stw	%i3,	[%l7 + 0x34]
	ldsh	[%l7 + 0x60],	%l6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %l6
	stxa	%g6,	[%g0 + %l6] 0x4f
	std	%i2,	[%l7 + 0x78]
	movleu	%icc,	%l3,	%g4
	flush	%l7 + 0x74
	flush	%l7 + 0x70
	ldsh	[%l7 + 0x42],	%l4
	std	%f2,	[%l7 + 0x18]
	lduh	[%l7 + 0x7E],	%g7
	ldx	[%l7 + 0x78],	%o0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%o7,	[%g0 + 0x10] %asi
	movrlz	%l5,	0x17A,	%i0
	and	%o2,	0x1A12,	%i6
	ld	[%l7 + 0x08],	%f27
	ldx	[%l7 + 0x68],	%l1
	mova	%icc,	%g2,	%g3
	std	%i6,	[%l7 + 0x48]
	flush	%l7 + 0x40
	tvc	%xcc,	0x0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l2
	edge8ln	%o1,	%i5,	%i1
	std	%f14,	[%l7 + 0x08]
	stx	%g5,	[%l7 + 0x68]
	ldd	[%l7 + 0x30],	%f0
	wrpr	%o3,	0x060E,	%cwp
	std	%o6,	[%l7 + 0x58]
	ldstub	[%l7 + 0x61],	%g1
	edge16ln	%o5,	%i4,	%o4
	nop
	set	0x48, %l3
	lduw	[%l7 + %l3],	%i3
	ldstub	[%l7 + 0x79],	%l0
	prefetch	[%l7 + 0x30],	 0x2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x18] %asi
	prefetch	[%l7 + 0x5C],	 0x1
	orncc	%l6,	0x0B0C,	%i2
	swap	[%l7 + 0x64],	%l3
	ld	[%l7 + 0x7C],	%f21
	stw	%g4,	[%l7 + 0x14]
	sth	%g7,	[%l7 + 0x24]
	alignaddrl	%o0,	%o7,	%l4
	mulscc	%l5,	0x1376,	%o2
	nop
	set	0x2A, %l5
	ldstub	[%l7 + %l5],	%i0
	swap	[%l7 + 0x0C],	%i6
	flush	%l7 + 0x74
	flush	%l7 + 0x14
	stx	%l1,	[%l7 + 0x50]
	edge32	%g2,	%g3,	%l2
	movleu	%xcc,	%o1,	%i7
	stb	%i5,	[%l7 + 0x2B]
	lduh	[%l7 + 0x62],	%i1
	nop
	set	0x13, %g2
	ldub	[%l7 + %g2],	%g5
	and	%o3,	%g1,	%o5
	stb	%i4,	[%l7 + 0x18]
	ldd	[%l7 + 0x40],	%o4
	fone	%f2
	ldd	[%l7 + 0x30],	%i2
	ldsb	[%l7 + 0x70],	%o6
	fpsub16s	%f22,	%f30,	%f28
	bpos,a,pt	%xcc,	loop_188
	std	%f12,	[%l7 + 0x08]
	move	%xcc,	%l0,	%g6
	ld	[%l7 + 0x74],	%f11
loop_188:
	st	%f9,	[%l7 + 0x10]
	ldsw	[%l7 + 0x18],	%i2
	ldsw	[%l7 + 0x64],	%l6
	ldstub	[%l7 + 0x53],	%g4
	stw	%l3,	[%l7 + 0x20]
	nop
	set	0x72, %l1
	sth	%g7,	[%l7 + %l1]
	sdivcc	%o0,	0x012F,	%o7
	st	%f14,	[%l7 + 0x38]
	prefetch	[%l7 + 0x38],	 0x0
	mova	%xcc,	%l5,	%l4
	ldsb	[%l7 + 0x2B],	%i0
	lduh	[%l7 + 0x3A],	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x242, 	%hsys_tick_cmpr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i6,	%l2
	addcc	%o1,	%i7,	%g3
	ldstub	[%l7 + 0x55],	%i1
	edge8l	%g5,	%i5,	%o3
	movgu	%xcc,	%g1,	%i4
	edge16l	%o5,	%o4,	%o6
	lduw	[%l7 + 0x0C],	%i3
	wr	%g6,	0x1106,	%pic
	prefetch	[%l7 + 0x38],	 0x2
	flush	%l7 + 0x6C
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%l0,	[%g0 + 0x8] %asi
	sth	%i2,	[%l7 + 0x6E]
	ldsw	[%l7 + 0x30],	%g4
	tl	%icc,	0x4
	stb	%l6,	[%l7 + 0x72]
	prefetch	[%l7 + 0x14],	 0x2
	fpadd16s	%f18,	%f2,	%f3
	ldd	[%l7 + 0x70],	%g6
	stw	%l3,	[%l7 + 0x50]
	nop
	set	0x56, %i7
	sth	%o7,	[%l7 + %i7]
	movrlz	%o0,	0x047,	%l4
	stb	%l5,	[%l7 + 0x18]
	stbar
	std	%f10,	[%l7 + 0x58]
	ldsw	[%l7 + 0x54],	%o2
	ldsw	[%l7 + 0x74],	%i0
	brlz	%l1,	loop_189
	ldstub	[%l7 + 0x73],	%g2
	edge16n	%i6,	%o1,	%i7
	ldub	[%l7 + 0x24],	%l2
loop_189:
	ldsb	[%l7 + 0x2A],	%g3
	stbar
	xor	%i1,	%i5,	%g5
	st	%f12,	[%l7 + 0x5C]
	flush	%l7 + 0x08
	sth	%o3,	[%l7 + 0x3A]
	wr	%i4,	0x0FC2,	%sys_tick
	ldub	[%l7 + 0x18],	%g1
	lduh	[%l7 + 0x6C],	%o4
	movcs	%xcc,	%o6,	%i3
	ldx	[%l7 + 0x60],	%o5
	stb	%g6,	[%l7 + 0x16]
	movrlez	%l0,	0x065,	%g4
	swap	[%l7 + 0x3C],	%i2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%g7,	[%g0 + 0x28] %asi
	orn	%l6,	0x14CA,	%o7
	rdhpr	%htba,	%o0
	st	%f12,	[%l7 + 0x20]
	fabsd	%f28,	%f4
	edge8	%l4,	%l5,	%o2
	flush	%l7 + 0x28
	ld	[%l7 + 0x48],	%f1
	sth	%i0,	[%l7 + 0x42]
	fbge,a	%fcc3,	loop_190
	flush	%l7 + 0x50
	std	%f4,	[%l7 + 0x70]
	swap	[%l7 + 0x58],	%l1
loop_190:
	movrlz	%l3,	%g2,	%o1
	fzero	%f12
	sth	%i6,	[%l7 + 0x2E]
	fmovdl	%xcc,	%f9,	%f15
	bshuffle	%f22,	%f12,	%f12
	stx	%i7,	[%l7 + 0x70]
	bl,a	loop_191
	membar	0x4B
	ld	[%l7 + 0x48],	%f9
	ldsh	[%l7 + 0x76],	%g3
loop_191:
	stb	%l2,	[%l7 + 0x0C]
	ldd	[%l7 + 0x60],	%i0
	ldd	[%l7 + 0x20],	%i4
	movneg	%xcc,	%o3,	%g5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%g1,	[%g0 + 0x38] %asi
	ldsh	[%l7 + 0x40],	%o4
	stb	%i4,	[%l7 + 0x55]
	flush	%l7 + 0x38
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o6
	sth	%i3,	[%l7 + 0x48]
	ld	[%l7 + 0x34],	%f24
	andcc	%g6,	0x1D14,	%o5
	movgu	%xcc,	%l0,	%g4
	ldd	[%l7 + 0x60],	%i2
	stb	%g7,	[%l7 + 0x49]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %l4
	ldxa	[%g0 + %l4] 0x4f,	%l6
	swap	[%l7 + 0x4C],	%o7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o0
	ldxa	[%g0 + %o0] 0x20,	%l4
	ldsb	[%l7 + 0x76],	%l5
	lduh	[%l7 + 0x7E],	%o2
	ldd	[%l7 + 0x60],	%i0
	lduh	[%l7 + 0x42],	%o0
	ldd	[%l7 + 0x78],	%f6
	xor	%l3,	0x096E,	%l1
	stx	%o1,	[%l7 + 0x70]
	ldsh	[%l7 + 0x7A],	%g2
	stb	%i7,	[%l7 + 0x14]
	ldstub	[%l7 + 0x76],	%g3
	ldsh	[%l7 + 0x4E],	%l2
	ldsh	[%l7 + 0x36],	%i1
	swap	[%l7 + 0x2C],	%i6
	ld	[%l7 + 0x7C],	%f29
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f2
	ldstub	[%l7 + 0x22],	%i5
	stx	%g5,	[%l7 + 0x28]
	edge32	%g1,	%o3,	%i4
	ldstub	[%l7 + 0x0F],	%o6
	ldd	[%l7 + 0x68],	%f2
	fsrc2s	%f17,	%f31
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %l2
	stxa	%o4,	[%g0 + %l2] 0x20
	std	%f6,	[%l7 + 0x50]
	lduw	[%l7 + 0x30],	%g6
	ldd	[%l7 + 0x48],	%o4
	fnor	%f6,	%f0,	%f0
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%l0
	ldd	[%l7 + 0x50],	%g4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %o7
	ldxa	[%g0 + %o7] 0x20,	%i3
	smulcc	%g7,	0x0D05,	%i2
	tsubcc	%l6,	0x1E2B,	%o7
	stx	%l5,	[%l7 + 0x20]
	fmovdne	%icc,	%f1,	%f22
	lduh	[%l7 + 0x58],	%l4
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i0
	bl,a	%xcc,	loop_192
	swap	[%l7 + 0x40],	%o2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sth	%l1,	[%l7 + 0x0E]
loop_192:
	ld	[%l7 + 0x10],	%f20
	lduh	[%l7 + 0x4A],	%g2
	ldx	[%l7 + 0x08],	%o1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o2
	stxa	%i7,	[%g0 + %o2] 0x20
	stbar
	lduh	[%l7 + 0x40],	%l2
	lduw	[%l7 + 0x34],	%g3
	ldsw	[%l7 + 0x54],	%i1
	stx	%i5,	[%l7 + 0x68]
	std	%i6,	[%l7 + 0x18]
	movrgez	%g5,	0x3AC,	%o3
	ldd	[%l7 + 0x48],	%f0
	std	%i4,	[%l7 + 0x60]
	ld	[%l7 + 0x6C],	%f7
	ldd	[%l7 + 0x08],	%f30
	xorcc	%g1,	%o6,	%g6
	ldx	[%l7 + 0x60],	%o4
	nop
	set	0x30, %g4
	stw	%l0,	[%l7 + %g4]
	ldstub	[%l7 + 0x29],	%o5
	bne	loop_193
	std	%f26,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i6
	stxa	%g4,	[%g0 + %i6] 0x4f
loop_193:
	movleu	%icc,	%i3,	%g7
	call	loop_194
	ldd	[%l7 + 0x30],	%i2
	std	%f20,	[%l7 + 0x30]
	movpos	%xcc,	%o7,	%l5
loop_194:
	nop
	set	0x0B, %i5
	ldstub	[%l7 + %i5],	%l6
	ldd	[%l7 + 0x68],	%f16
	lduh	[%l7 + 0x66],	%l4
	ldsh	[%l7 + 0x20],	%o2
	smulcc	%i0,	%o0,	%l3
	lduw	[%l7 + 0x74],	%g2
	addcc	%l1,	%o1,	%l2
	nop
	set	0x78, %i1
	stx	%i7,	[%l7 + %i1]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g3
	ldsh	[%l7 + 0x58],	%i5
	lduw	[%l7 + 0x60],	%i1
	ldd	[%l7 + 0x70],	%f12
	prefetch	[%l7 + 0x54],	 0x0
	ldx	[%l7 + 0x58],	%i6
	flush	%l7 + 0x2C
	ldsw	[%l7 + 0x1C],	%o3
	ldsh	[%l7 + 0x0E],	%i4
	nop
	set	0x40, %g7
	stw	%g1,	[%l7 + %g7]
	ldstub	[%l7 + 0x3A],	%g5
	nop
	set	0x68, %o5
	prefetch	[%l7 + %o5],	 0x3
	stbar
	nop
	set	0x78, %g6
	std	%o6,	[%l7 + %g6]
	nop
	set	0x48, %o6
	std	%g6,	[%l7 + %o6]
	sth	%o4,	[%l7 + 0x4A]
	std	%o4,	[%l7 + 0x48]
	ldsw	[%l7 + 0x40],	%l0
	stbar
	flush	%l7 + 0x30
	ld	[%l7 + 0x58],	%f20
	nop
	set	0x48, %i0
	stb	%i3,	[%l7 + %i0]
	ldx	[%l7 + 0x48],	%g7
	fba	%fcc0,	loop_195
	flush	%l7 + 0x28
	movrgez	%g4,	0x0A9,	%o7
	rdpr	%cleanwin,	%l5
loop_195:
	array32	%i2,	%l4,	%l6
	lduh	[%l7 + 0x18],	%o2
	nop
	set	0x70, %i2
	stx	%i0,	[%l7 + %i2]
	lduh	[%l7 + 0x20],	%l3
	fmul8x16al	%f19,	%f31,	%f0
	st	%f23,	[%l7 + 0x48]
	xorcc	%o0,	%l1,	%o1
	fpsub16s	%f14,	%f29,	%f30
	lduh	[%l7 + 0x2A],	%l2
	edge32ln	%i7,	%g2,	%i5
	lduh	[%l7 + 0x24],	%g3
	tn	%icc,	0x4
	std	%i0,	[%l7 + 0x10]
	std	%f14,	[%l7 + 0x50]
	sth	%i6,	[%l7 + 0x62]
	ldsh	[%l7 + 0x2A],	%i4
	ldd	[%l7 + 0x28],	%f6
	prefetch	[%l7 + 0x38],	 0x3
	wr	%o3,	%g1,	%ccr
	lduw	[%l7 + 0x20],	%o6
	lduw	[%l7 + 0x1C],	%g5
	stw	%g6,	[%l7 + 0x34]
	nop
	set	0x5C, %o1
	ldsw	[%l7 + %o1],	%o4
	ldx	[%l7 + 0x10],	%l0
	swap	[%l7 + 0x20],	%i3
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%o4
	ldstub	[%l7 + 0x68],	%g4
	stx	%o7,	[%l7 + 0x78]
	rd	%ccr,	%g7
	ldd	[%l7 + 0x18],	%i2
	stx	%l5,	[%l7 + 0x58]
	nop
	set	0x2F, %g5
	ldub	[%l7 + %g5],	%l4
	stx	%l6,	[%l7 + 0x18]
	pdist	%f16,	%f14,	%f18
	fmovrdgez	%i0,	%f28,	%f26
	lduw	[%l7 + 0x24],	%l3
	stb	%o2,	[%l7 + 0x53]
	rdhpr	%hpstate,	%l1
	ldsb	[%l7 + 0x6A],	%o1
	st	%f4,	[%l7 + 0x64]
	ldub	[%l7 + 0x1E],	%o0
	sdivx	%l2,	0x07D8,	%g2
	ldsw	[%l7 + 0x24],	%i7
	ldd	[%l7 + 0x08],	%f22
	tleu	%icc,	0x2
	rd	%pc,	%g3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %g3
	stxa	%i5,	[%g0 + %g3] 0x4f
	ldsh	[%l7 + 0x0C],	%i1
	sllx	%i4,	0x16,	%o3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i6
	ldx	[%l7 + 0x10],	%o6
	ld	[%l7 + 0x60],	%f26
	lduw	[%l7 + 0x28],	%g1
	flush	%l7 + 0x34
	ldsh	[%l7 + 0x3A],	%g6
	rd	%ccr,	%o4
	fxors	%f25,	%f19,	%f13
	srlx	%l0,	0x16,	%i3
	ldd	[%l7 + 0x50],	%f14
	wrpr	%g5,	%o5,	%tick
	swap	[%l7 + 0x08],	%o7
	stw	%g4,	[%l7 + 0x50]
	ld	[%l7 + 0x5C],	%f24
	flush	%l7 + 0x28
	ldsh	[%l7 + 0x20],	%g7
	lduh	[%l7 + 0x30],	%i2
	popc	%l4,	%l5
	lduh	[%l7 + 0x74],	%i0
	ldsh	[%l7 + 0x2A],	%l3
	stbar
	sethi	0x0297,	%o2
	sth	%l1,	[%l7 + 0x78]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x64],	%l6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %o3
	ldxa	[%g0 + %o3] 0x20,	%o0
	fmovdn	%icc,	%f0,	%f0
	std	%o0,	[%l7 + 0x08]
	ldd	[%l7 + 0x20],	%l2
	lduh	[%l7 + 0x3C],	%i7
	fmovspos	%icc,	%f1,	%f13
	fandnot2s	%f30,	%f10,	%f20
	prefetch	[%l7 + 0x48],	 0x3
	sethi	0x0993,	%g2
	ldd	[%l7 + 0x60],	%g2
	ldstub	[%l7 + 0x78],	%i1
	ld	[%l7 + 0x10],	%f19
	stbar
	ldsw	[%l7 + 0x4C],	%i4
	ta	%xcc,	0x3
	stw	%o3,	[%l7 + 0x40]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	stxa	%i6,	[%g0 + 0x20] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %o4
	ldxa	[%g0 + %o4] 0x4f,	%i5
	ldstub	[%l7 + 0x1A],	%o6
	stw	%g6,	[%l7 + 0x48]
	sth	%o4,	[%l7 + 0x62]
	swap	[%l7 + 0x38],	%l0
	prefetch	[%l7 + 0x64],	 0x1
	fmovrsgz	%i3,	%f29,	%f2
	movcs	%icc,	%g5,	%o5
	ldd	[%l7 + 0x60],	%g0
	stbar
	or	%g4,	%o7,	%i2
	movge	%xcc,	%l4,	%l5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %l6
	ldxa	[%g0 + %l6] 0x20,	%g7
	fnand	%f16,	%f14,	%f20
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%i0,	[%g0 + 0x8] %asi
	nop
	set	0x34, %g1
	ldstub	[%l7 + %g1],	%o2
	nop
	set	0x54, %l5
	stb	%l3,	[%l7 + %l5]
	st	%f1,	[%l7 + 0x3C]
	tneg	%xcc,	0x4
	sdivcc	%l1,	0x067F,	%l6
	ldsh	[%l7 + 0x42],	%o1
	stb	%l2,	[%l7 + 0x5B]
	ldsw	[%l7 + 0x48],	%o0
	rdpr	%pil,	%g2
	lduh	[%l7 + 0x7E],	%g3
	stbar
	stx	%i7,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i4
	stbar
	flush	%l7 + 0x0C
	ldstub	[%l7 + 0x4D],	%i1
	movrne	%o3,	0x0D8,	%i5
	fmovsle	%xcc,	%f18,	%f31
	stw	%o6,	[%l7 + 0x7C]
	stb	%g6,	[%l7 + 0x08]
	ld	[%l7 + 0x28],	%f5
	st	%f27,	[%l7 + 0x78]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g2
	stxa	%i6,	[%g0 + %g2] 0x20
	bcs,pt	%icc,	loop_196
	flush	%l7 + 0x3C
	ldd	[%l7 + 0x70],	%o4
	movrlez	%i3,	%g5,	%l0
loop_196:
	nop
	setx	loop_197,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduh	[%l7 + 0x5E],	%o5
	fmovdgu	%icc,	%f28,	%f3
	ldstub	[%l7 + 0x52],	%g1
loop_197:
	ldsh	[%l7 + 0x38],	%g4
	ld	[%l7 + 0x48],	%f21
	ta	%icc,	0x3
	ldd	[%l7 + 0x28],	%f6
	nop
	set	0x0B, %l3
	stb	%o7,	[%l7 + %l3]
	ldstub	[%l7 + 0x3E],	%l4
	ldstub	[%l7 + 0x5D],	%l5
	ldsh	[%l7 + 0x48],	%i2
	rdpr	%canrestore,	%g7
	udivcc	%i0,	0x1AE2,	%l3
	ldsw	[%l7 + 0x7C],	%l1
	rdpr	%wstate,	%l6
	ldsh	[%l7 + 0x20],	%o2
	ldub	[%l7 + 0x25],	%o1
	ldstub	[%l7 + 0x46],	%l2
	tneg	%icc,	0x5
	stb	%o0,	[%l7 + 0x4B]
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g2
	ldstub	[%l7 + 0x27],	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	stxa	%g3,	[%g0 + 0x0] %asi
	std	%i4,	[%l7 + 0x40]
	ldstub	[%l7 + 0x48],	%o3
	prefetch	[%l7 + 0x54],	 0x2
	std	%f12,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %i7
	stxa	%i1,	[%g0 + %i7] 0x4f
	std	%i4,	[%l7 + 0x38]
	taddcc	%g6,	%i6,	%o4
	st	%f5,	[%l7 + 0x68]
	st	%f22,	[%l7 + 0x30]
	rdhpr	%hsys_tick_cmpr,	%o6
	tl	%icc,	0x5
	sth	%i3,	[%l7 + 0x40]
	std	%g4,	[%l7 + 0x48]
	ldx	[%l7 + 0x10],	%o5
	nop
	set	0x60, %l1
	std	%f4,	[%l7 + %l1]
	stw	%l0,	[%l7 + 0x7C]
	std	%g4,	[%l7 + 0x58]
	fsrc1	%f12,	%f16
	prefetch	[%l7 + 0x0C],	 0x0
	stb	%g1,	[%l7 + 0x25]
	ldstub	[%l7 + 0x44],	%l4
	ldx	[%l7 + 0x18],	%l5
	ldsw	[%l7 + 0x74],	%o7
	nop
	set	0x58, %l4
	stx	%i2,	[%l7 + %l4]
	array8	%i0,	%g7,	%l3
	ldsh	[%l7 + 0x1C],	%l1
	std	%f12,	[%l7 + 0x18]
	ldsh	[%l7 + 0x6E],	%o2
	lduh	[%l7 + 0x60],	%l6
	movne	%icc,	%l2,	%o1
	std	%f20,	[%l7 + 0x08]
	ldx	[%l7 + 0x78],	%o0
	st	%f13,	[%l7 + 0x0C]
	ldstub	[%l7 + 0x57],	%g2
	ldub	[%l7 + 0x69],	%i7
	subcc	%g3,	0x0BB9,	%i4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %o0
	stxa	%o3,	[%g0 + %o0] 0x4f
	ldsb	[%l7 + 0x5A],	%i1
	stx	%g6,	[%l7 + 0x48]
	ldsb	[%l7 + 0x10],	%i5
	nop
	set	0x40, %l2
	stb	%o4,	[%l7 + %l2]
	lduw	[%l7 + 0x7C],	%i6
	ldsb	[%l7 + 0x67],	%i3
	flush	%l7 + 0x64
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g5,	[%g0 + 0x30] %asi
	ld	[%l7 + 0x6C],	%f2
	nop
	setx loop_198, %l0, %l1
	jmpl %l1, %o6
	ldsb	[%l7 + 0x6D],	%l0
	lduh	[%l7 + 0x1E],	%o5
	st	%f19,	[%l7 + 0x7C]
loop_198:
	rd	%asi,	%g1
	ldub	[%l7 + 0x0A],	%l4
	orcc	%l5,	%o7,	%g4
	swap	[%l7 + 0x24],	%i2
	ldsb	[%l7 + 0x18],	%g7
	srlx	%l3,	%i0,	%o2
	stw	%l1,	[%l7 + 0x34]
	fand	%f22,	%f20,	%f2
	fnands	%f11,	%f27,	%f21
	tcs	%xcc,	0x7
	fbne,a	%fcc3,	loop_199
	ldd	[%l7 + 0x60],	%f22
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l6
loop_199:
	ldsw	[%l7 + 0x14],	%o1
	xnorcc	%l2,	0x176C,	%o0
	udiv	%i7,	0x02F5,	%g2
	ld	[%l7 + 0x6C],	%f4
	swap	[%l7 + 0x10],	%i4
	ldd	[%l7 + 0x58],	%f30
	stb	%g3,	[%l7 + 0x44]
	nop
	set	0x0E, %i3
	lduh	[%l7 + %i3],	%o3
	ldd	[%l7 + 0x60],	%f26
	swap	[%l7 + 0x5C],	%g6
	ldstub	[%l7 + 0x6C],	%i1
	edge16	%o4,	%i6,	%i3
	sra	%i5,	%g5,	%o6
	ldx	[%l7 + 0x78],	%l0
	nop
	set	0x20, %l0
	std	%f12,	[%l7 + %l0]
	ldsb	[%l7 + 0x4F],	%o5
	prefetch	[%l7 + 0x70],	 0x3
	stw	%g1,	[%l7 + 0x2C]
	ldd	[%l7 + 0x60],	%f16
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l4
	flush	%l7 + 0x14
	nop
	set	0x3E, %o7
	ldub	[%l7 + %o7],	%o7
	ldsh	[%l7 + 0x2A],	%g4
	sth	%i2,	[%l7 + 0x36]
	nop
	set	0x63, %o2
	ldsb	[%l7 + %o2],	%g7
	swap	[%l7 + 0x44],	%l5
	fmovrdlez	%i0,	%f18,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f16,	%f8
	stb	%o2,	[%l7 + 0x71]
	prefetch	[%l7 + 0x0C],	 0x3
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x10] %asi
	flush	%l7 + 0x38
	lduw	[%l7 + 0x48],	%l3
	st	%f19,	[%l7 + 0x64]
	ba,a	loop_200
	umulcc	%o1,	%l6,	%l2
	ldsh	[%l7 + 0x2A],	%o0
	srax	%i7,	%i4,	%g3
loop_200:
	ldsh	[%l7 + 0x16],	%g2
	rdpr	%wstate,	%o3
	ldd	[%l7 + 0x38],	%f18
	ldstub	[%l7 + 0x79],	%i1
	st	%f29,	[%l7 + 0x5C]
	fpsub32	%f18,	%f24,	%f12
	stx	%o4,	[%l7 + 0x58]
	stb	%g6,	[%l7 + 0x2E]
	fpadd32	%f6,	%f22,	%f16
	ld	[%l7 + 0x5C],	%f22
	ldsw	[%l7 + 0x40],	%i6
	ldsb	[%l7 + 0x6C],	%i5
	stb	%g5,	[%l7 + 0x16]
	ldsb	[%l7 + 0x19],	%o6
	lduh	[%l7 + 0x44],	%i3
	ldstub	[%l7 + 0x41],	%o5
	stx	%g1,	[%l7 + 0x28]
	bleu,a,pt	%xcc,	loop_201
	lduh	[%l7 + 0x2C],	%l0
	ldub	[%l7 + 0x30],	%l4
	prefetch	[%l7 + 0x08],	 0x2
loop_201:
	ldstub	[%l7 + 0x6F],	%g4
	nop
	set	0x66, %i6
	ldstub	[%l7 + %i6],	%i2
	wrpr	%g7,	0x0274,	%pil
	std	%f4,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %i5
	ldxa	[%g0 + %i5] 0x4f,	%o7
	movn	%icc,	%l5,	%i0
	mova	%xcc,	%o2,	%l1
	sth	%o1,	[%l7 + 0x68]
	fzero	%f18
	prefetch	[%l7 + 0x14],	 0x3
	stx	%l3,	[%l7 + 0x18]
	ldx	[%l7 + 0x68],	%l2
	std	%f4,	[%l7 + 0x70]
	movrgez	%o0,	%l6,	%i4
	ldsw	[%l7 + 0x20],	%i7
	movl	%xcc,	%g2,	%o3
	sth	%i1,	[%l7 + 0x60]
	ldsw	[%l7 + 0x54],	%g3
	ldstub	[%l7 + 0x3B],	%o4
	ldx	[%l7 + 0x48],	%i6
	ldd	[%l7 + 0x10],	%f10
	edge32ln	%i5,	%g5,	%o6
	ldd	[%l7 + 0x60],	%f16
	lduw	[%l7 + 0x54],	%g6
	ldsb	[%l7 + 0x34],	%i3
	for	%f14,	%f28,	%f26
	stbar
	std	%f0,	[%l7 + 0x20]
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%o4
	fmovrdgz	%g1,	%f8,	%f6
	prefetch	[%l7 + 0x6C],	 0x0
	ldsw	[%l7 + 0x28],	%l0
	stx	%g4,	[%l7 + 0x20]
	std	%l4,	[%l7 + 0x18]
	stw	%i2,	[%l7 + 0x50]
	stb	%g7,	[%l7 + 0x19]
	lduw	[%l7 + 0x70],	%o7
	tcc	%xcc,	0x6
	tvc	%xcc,	0x3
	fbue,a	%fcc1,	loop_202
	move	%icc,	%i0,	%l5
	udivcc	%o2,	0x1A09,	%o1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l3
loop_202:
	nop

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	bvs,pt	%xcc,	loop_203
	movre	%l2,	0x335,	%l6
	fandnot1	%f30,	%f4,	%f4
	lduh	[%l7 + 0x5A],	%i4
loop_203:
	ldstub	[%l7 + 0x0E],	%i7
	stx	%o0,	[%l7 + 0x40]
	fcmpeq16	%f28,	%f16,	%g2
	std	%o2,	[%l7 + 0x10]
	ldsb	[%l7 + 0x60],	%i1
	fcmpgt32	%f12,	%f4,	%g3
	ldub	[%l7 + 0x55],	%i6
	fbug	%fcc1,	loop_204
	ldd	[%l7 + 0x40],	%o4
	fmovsleu	%xcc,	%f4,	%f28
	stb	%g5,	[%l7 + 0x38]
loop_204:
	stb	%o6,	[%l7 + 0x6E]
	lduh	[%l7 + 0x60],	%g6
	ldd	[%l7 + 0x18],	%i4
	nop
	set	0x50, %i1
	ldsw	[%l7 + %i1],	%i3
	swap	[%l7 + 0x68],	%o5
	ldsh	[%l7 + 0x74],	%l0
	movge	%xcc,	%g1,	%g4
	stbar
	swap	[%l7 + 0x14],	%l4
	std	%i2,	[%l7 + 0x40]
	sdiv	%o7,	0x0364,	%i0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %g7
	stxa	%g7,	[%g0 + %g7] 0x4f
	nop
	set	0x34, %o5
	stw	%l5,	[%l7 + %o5]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %g6
	ldxa	[%g0 + %g6] 0x4f,	%o1
	ldx	[%l7 + 0x48],	%l3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x38] %asi
	ldsb	[%l7 + 0x50],	%o2
	movne	%xcc,	%l2,	%i4
	nop
	set	0x08, %o6
	std	%i6,	[%l7 + %o6]
	wrpr	%i7,	%g2,	%cwp
	edge16l	%o3,	%o0,	%g3
	and	%i6,	%o4,	%g5
	stx	%o6,	[%l7 + 0x78]
	nop
	set	0x55, %i2
	stb	%i1,	[%l7 + %i2]
	stbar
	flush	%l7 + 0x3C
	nop
	set	0x3D, %i0
	ldub	[%l7 + %i0],	%g6
	ldd	[%l7 + 0x20],	%i2
	movvs	%icc,	%i5,	%l0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %i4
	stxa	%g1,	[%g0 + %i4] 0x4f
	ldd	[%l7 + 0x58],	%f18
	rdpr	%gl,	%g4
	tn	%icc,	0x1
	ldd	[%l7 + 0x48],	%l4
	st	%f15,	[%l7 + 0x50]
	ldsw	[%l7 + 0x18],	%o5
	tl	%xcc,	0x1
	ldsh	[%l7 + 0x6A],	%i2
	std	%f24,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%i0,	[%g0 + 0x10] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%o7,	[%g0 + 0x8] %asi
	fbug,a	%fcc0,	loop_205
	std	%l4,	[%l7 + 0x18]
	ldsh	[%l7 + 0x4A],	%o1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %g5
	stxa	%l3,	[%g0 + %g5] 0x20
loop_205:
	nop
	set	0x16, %o1
	lduh	[%l7 + %o1],	%g7
	ld	[%l7 + 0x28],	%f29
	stb	%l1,	[%l7 + 0x5B]
	movvs	%icc,	%o2,	%i4
	std	%i6,	[%l7 + 0x08]
	ldsw	[%l7 + 0x4C],	%l2
	movrlz	%i7,	0x03A,	%g2
	ldsh	[%l7 + 0x22],	%o0
	wrpr	%o3,	0x17B3,	%tick
	ldsh	[%l7 + 0x10],	%g3
	ldd	[%l7 + 0x10],	%f4
	flush	%l7 + 0x30
	st	%f28,	[%l7 + 0x60]
	ldd	[%l7 + 0x20],	%f12
	ldsw	[%l7 + 0x74],	%o4
	rdhpr	%htba,	%g5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i6
	flush	%l7 + 0x14
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i1
	ldx	[%l7 + 0x50],	%g6
	ldd	[%l7 + 0x30],	%o6
	fmovsl	%xcc,	%f19,	%f16
	tleu	%xcc,	0x1
	andcc	%i5,	%i3,	%g1
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%l0
	stb	%g4,	[%l7 + 0x61]
	std	%f4,	[%l7 + 0x28]
	ldsb	[%l7 + 0x20],	%l4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x27E, 	%hsys_tick_cmpr
	fmovs	%f29,	%f8
	stbar
	subc	%i0,	%o7,	%o5
	prefetch	[%l7 + 0x2C],	 0x1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xDF2, 	%hsys_tick_cmpr
	stw	%l5,	[%l7 + 0x1C]
	swap	[%l7 + 0x70],	%g7
	stx	%o2,	[%l7 + 0x40]
	fsrc1s	%f26,	%f18
	std	%l0,	[%l7 + 0x68]
	std	%f14,	[%l7 + 0x58]
	nop
	set	0x26, %o3
	ldsh	[%l7 + %o3],	%l6
	flush	%l7 + 0x40
	tvs	%icc,	0x7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l6
	stxa	%l2,	[%g0 + %l6] 0x4f
	ldd	[%l7 + 0x40],	%f30
	stw	%i7,	[%l7 + 0x18]
	stw	%i4,	[%l7 + 0x44]
	subccc	%g2,	%o3,	%o0
	fmovrdgz	%o4,	%f6,	%f10
	st	%f25,	[%l7 + 0x78]
	fandnot1	%f22,	%f2,	%f0
	nop
	set	0x24, %o4
	ldsw	[%l7 + %o4],	%g5
	ldstub	[%l7 + 0x7E],	%i6
	std	%f22,	[%l7 + 0x50]
	std	%g2,	[%l7 + 0x70]
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%g6
	umulcc	%i1,	0x12ED,	%i5

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA56, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x78],	%g1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l0
	nop
	set	0x70, %g2
	ldsw	[%l7 + %g2],	%g4
	array32	%l4,	%i2,	%o7
	movpos	%xcc,	%i0,	%o1
	stb	%o5,	[%l7 + 0x14]
	rdhpr	%hpstate,	%l5
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%g6
	ldstub	[%l7 + 0x35],	%l3
	edge16ln	%l1,	%o2,	%l2
	ldstub	[%l7 + 0x2A],	%l6
	prefetch	[%l7 + 0x0C],	 0x0
	lduh	[%l7 + 0x7E],	%i4
	ldx	[%l7 + 0x40],	%g2
	std	%o2,	[%l7 + 0x18]
	ldsh	[%l7 + 0x52],	%o0
	stbar
	orncc	%i7,	0x0349,	%g5
	taddcc	%i6,	0x082C,	%g3
	std	%g6,	[%l7 + 0x78]
	swap	[%l7 + 0x70],	%i1
	rdpr	%cansave,	%o4
	prefetch	[%l7 + 0x08],	 0x0
	flush	%l7 + 0x20
	stbar
	nop
	set	0x38, %g1
	std	%f6,	[%l7 + %g1]
	std	%f18,	[%l7 + 0x28]
	stx	%i5,	[%l7 + 0x78]
	ld	[%l7 + 0x34],	%f5
	add	%i3,	0x06B6,	%o6
	std	%f22,	[%l7 + 0x30]
	stw	%l0,	[%l7 + 0x54]
	st	%f5,	[%l7 + 0x48]
	smulcc	%g1,	%g4,	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %l1
	ldxa	[%g0 + %l1] 0x20,	%o7
	flushw
	ldsh	[%l7 + 0x4E],	%i0
	stbar
	tg	%xcc,	0x4
	xorcc	%i2,	0x1D2C,	%o5
	ld	[%l7 + 0x30],	%f14
	prefetch	[%l7 + 0x38],	 0x3
	ldub	[%l7 + 0x1C],	%l5
	movneg	%xcc,	%o1,	%g7
	ld	[%l7 + 0x64],	%f22
	nop
	set	0x08, %i7
	lduw	[%l7 + %i7],	%l3
	edge16l	%o2,	%l2,	%l6
	fmovrdgez	%i4,	%f22,	%f24
	movneg	%icc,	%l1,	%g2
	swap	[%l7 + 0x68],	%o3
	andcc	%o0,	0x1965,	%g5
	fcmple32	%f22,	%f18,	%i7
	ld	[%l7 + 0x18],	%f26
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %o0
	ldxa	[%g0 + %o0] 0x20,	%i6
	edge16n	%g3,	%i1,	%o4
	edge32	%g6,	%i3,	%i5
	ba,a,pn	%icc,	loop_206
	srlx	%l0,	%g1,	%o6
	stbar
	prefetch	[%l7 + 0x0C],	 0x0
loop_206:
	lduw	[%l7 + 0x50],	%g4
	stbar
	ldx	[%l7 + 0x28],	%o7
	ldstub	[%l7 + 0x41],	%i0
	std	%i2,	[%l7 + 0x48]
	srl	%o5,	0x0D,	%l4
	prefetch	[%l7 + 0x6C],	 0x1
	stb	%l5,	[%l7 + 0x5B]
	stbar
	movvs	%icc,	%o1,	%g7
	st	%f10,	[%l7 + 0x30]
	st	%f19,	[%l7 + 0x58]
	st	%f30,	[%l7 + 0x68]
	stb	%l3,	[%l7 + 0x17]
	st	%f15,	[%l7 + 0x60]
	stb	%l2,	[%l7 + 0x7C]
	ldd	[%l7 + 0x08],	%f12
	ldx	[%l7 + 0x18],	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l4
	ldxa	[%g0 + %l4] 0x20,	%i4
	add	%l1,	0x1227,	%l6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%o0,	[%g0 + 0x38] %asi
	ldx	[%l7 + 0x10],	%g5
	ldstub	[%l7 + 0x0D],	%i7
	stbar
	ld	[%l7 + 0x28],	%f28
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o3
	ld	[%l7 + 0x2C],	%f30
	ldsh	[%l7 + 0x0E],	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i1
	tgu	%icc,	0x2
	fbuge,a	%fcc0,	loop_207
	flush	%l7 + 0x68
	ba,a,pt	%xcc,	loop_208
	sth	%i6,	[%l7 + 0x20]
loop_207:
	stw	%o4,	[%l7 + 0x20]
	brz,a	%g6,	loop_209
loop_208:
	membar	0x1E
	fmovdcc	%xcc,	%f0,	%f27
	stx	%i3,	[%l7 + 0x60]
loop_209:
	ldd	[%l7 + 0x70],	%f16
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f6
	ld	[%l7 + 0x64],	%f2
	stw	%i5,	[%l7 + 0x5C]
	edge16ln	%l0,	%g1,	%g4
	stx	%o7,	[%l7 + 0x20]
	swap	[%l7 + 0x64],	%i0
	movge	%icc,	%o6,	%o5
	fmovdge	%icc,	%f7,	%f25
	ldub	[%l7 + 0x49],	%l4
	ldd	[%l7 + 0x68],	%f30
	nop
	set	0x67, %l2
	ldub	[%l7 + %l2],	%i2
	taddcc	%o1,	%l5,	%g7
	fbue	%fcc1,	loop_210
	ldx	[%l7 + 0x38],	%l3
	ldstub	[%l7 + 0x1E],	%o2
	ldd	[%l7 + 0x10],	%f30
loop_210:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	nop
	set	0x30, %l0
	ldxa	[%g0 + %l0] 0x20,	%i4
	ldd	[%l7 + 0x30],	%f28
	stbar
	ldstub	[%l7 + 0x7B],	%l1
	ldsw	[%l7 + 0x18],	%l2
	ldub	[%l7 + 0x46],	%g2
	stbar
	stbar
	swap	[%l7 + 0x6C],	%l6
	fandnot2	%f4,	%f26,	%f26
	fsrc2	%f6,	%f30
	st	%f24,	[%l7 + 0x6C]
	fornot2s	%f18,	%f15,	%f25
	std	%f18,	[%l7 + 0x60]
	ldstub	[%l7 + 0x3E],	%g5
	movleu	%icc,	%o0,	%o3
	tle	%icc,	0x3
	st	%f27,	[%l7 + 0x0C]
	edge16n	%g3,	%i1,	%i7
	swap	[%l7 + 0x2C],	%i6
	ldstub	[%l7 + 0x7D],	%o4
	std	%g6,	[%l7 + 0x08]
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%i4
	fmovda	%icc,	%f14,	%f12
	std	%f22,	[%l7 + 0x10]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x7C],	%i3
	tvs	%icc,	0x0
	ldd	[%l7 + 0x28],	%g0
	prefetch	[%l7 + 0x20],	 0x2
	nop
	set	0x08, %o2
	ldsw	[%l7 + %o2],	%g4
	udivx	%l0,	0x02E0,	%i0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i6
	stxa	%o7,	[%g0 + %i6] 0x20
	tsubcctv	%o6,	%l4,	%i2
	ldsw	[%l7 + 0x08],	%o1
	swap	[%l7 + 0x5C],	%l5
	stb	%g7,	[%l7 + 0x65]
	std	%l2,	[%l7 + 0x30]
	ble,a	%icc,	loop_211
	ldx	[%l7 + 0x58],	%o2
	ld	[%l7 + 0x20],	%f14
	ld	[%l7 + 0x0C],	%f13
loop_211:
	ldsh	[%l7 + 0x0A],	%o5
	std	%i4,	[%l7 + 0x68]
	ldd	[%l7 + 0x78],	%f8
	ldd	[%l7 + 0x70],	%l0
	stb	%l2,	[%l7 + 0x56]
	ldsb	[%l7 + 0x42],	%l6
	st	%f7,	[%l7 + 0x10]
	sth	%g2,	[%l7 + 0x68]
	ldub	[%l7 + 0x18],	%g5
	st	%f3,	[%l7 + 0x34]
	tcc	%xcc,	0x2
	st	%f29,	[%l7 + 0x40]
	bg,pn	%xcc,	loop_212
	flush	%l7 + 0x70
	fmovsleu	%xcc,	%f16,	%f30
	wrpr	%o0,	%g3,	%pil
loop_212:
	orcc	%o3,	0x1555,	%i7
	nop
	set	0x36, %g4
	lduh	[%l7 + %g4],	%i1
	tleu	%xcc,	0x7
	ldsw	[%l7 + 0x34],	%i6
	stw	%o4,	[%l7 + 0x64]
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%f12
	edge8	%g6,	%i3,	%g1
	subcc	%i5,	0x18B4,	%l0
	ldsw	[%l7 + 0x58],	%g4
	stx	%o7,	[%l7 + 0x70]
	or	%o6,	0x0112,	%l4
	ldsw	[%l7 + 0x48],	%i2
	stbar
	stbar
	stw	%i0,	[%l7 + 0x48]
	flush	%l7 + 0x48
	fble,a	%fcc1,	loop_213
	flush	%l7 + 0x14
	wrpr	%o1,	%l5,	%cwp
	ldd	[%l7 + 0x20],	%f14
loop_213:
	lduh	[%l7 + 0x18],	%g7
	ldsw	[%l7 + 0x68],	%l3
	sra	%o2,	0x0B,	%i4
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%o5
	udivx	%l1,	0x07A0,	%l2
	st	%f22,	[%l7 + 0x40]
	stw	%l6,	[%l7 + 0x28]
	te	%xcc,	0x3
	stb	%g5,	[%l7 + 0x71]
	ldstub	[%l7 + 0x7F],	%o0
	movpos	%icc,	%g2,	%g3
	std	%i6,	[%l7 + 0x10]
	ldstub	[%l7 + 0x3E],	%o3
	std	%f20,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%i6,	[%g0 + 0x18] %asi
	flush	%l7 + 0x60
	ldd	[%l7 + 0x68],	%o4
	prefetch	[%l7 + 0x4C],	 0x0
	std	%i0,	[%l7 + 0x10]
	ldx	[%l7 + 0x38],	%g6
	ldd	[%l7 + 0x58],	%i2
	lduh	[%l7 + 0x2E],	%i5
	flush	%l7 + 0x38
	stx	%l0,	[%l7 + 0x70]
	stb	%g1,	[%l7 + 0x3D]
	st	%f18,	[%l7 + 0x48]
	ldd	[%l7 + 0x58],	%g4
	nop
	set	0x0E, %o5
	ldub	[%l7 + %o5],	%o6
	nop
	set	0x58, %g7
	lduh	[%l7 + %g7],	%o7
	fnor	%f14,	%f16,	%f24
	flush	%l7 + 0x20
	bl,pt	%icc,	loop_214
	ldsb	[%l7 + 0x09],	%i2
	nop
	set	0x4C, %g6
	ldsw	[%l7 + %g6],	%l4
	flush	%l7 + 0x6C
loop_214:
	stbar
	movrgz	%i0,	0x39B,	%l5
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%g7
	nop
	setx loop_215, %l0, %l1
	jmpl %l1, %l3
	prefetch	[%l7 + 0x38],	 0x0
	lduw	[%l7 + 0x3C],	%o1
	ldstub	[%l7 + 0x46],	%i4
loop_215:
	stx	%o2,	[%l7 + 0x40]
	std	%l0,	[%l7 + 0x18]
	std	%f24,	[%l7 + 0x40]
	bpos,a,pt	%xcc,	loop_216
	stx	%o5,	[%l7 + 0x30]
	nop
	set	0x37, %i0
	ldstub	[%l7 + %i0],	%l2
	sth	%g5,	[%l7 + 0x4A]
loop_216:
	ldsb	[%l7 + 0x70],	%l6
	ldsw	[%l7 + 0x34],	%g2
	nop
	set	0x41, %i4
	ldsb	[%l7 + %i4],	%g3
	movge	%icc,	%o0,	%o3
	swap	[%l7 + 0x7C],	%i7
	ldsw	[%l7 + 0x64],	%o4
	ldd	[%l7 + 0x48],	%i0
	ldsw	[%l7 + 0x14],	%g6
	std	%i2,	[%l7 + 0x20]
	ldub	[%l7 + 0x66],	%i6
	prefetch	[%l7 + 0x60],	 0x0
	fmovdcc	%icc,	%f13,	%f27
	flush	%l7 + 0x4C
	fornot2s	%f14,	%f1,	%f25
	fornot1	%f4,	%f26,	%f30
	ld	[%l7 + 0x08],	%f4
	ldsw	[%l7 + 0x28],	%i5
	fsrc2s	%f1,	%f19
	orn	%l0,	%g4,	%g1
	mova	%icc,	%o7,	%o6
	ldd	[%l7 + 0x20],	%f8
	fmovdcc	%xcc,	%f31,	%f30
	lduw	[%l7 + 0x64],	%i2
	wr	%l4,	%i0,	%ccr
	fmovdg	%icc,	%f15,	%f11
	ldx	[%l7 + 0x28],	%l5
	ldsh	[%l7 + 0x6E],	%l3
	prefetch	[%l7 + 0x4C],	 0x1
	bshuffle	%f4,	%f18,	%f4
	flush	%l7 + 0x28
	prefetch	[%l7 + 0x50],	 0x2
	andcc	%o1,	%i4,	%g7
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%o2
	alignaddr	%l1,	%l2,	%g5
	flush	%l7 + 0x34
	ldx	[%l7 + 0x68],	%o5
	ldsw	[%l7 + 0x44],	%l6
	ldd	[%l7 + 0x20],	%g2
	ldd	[%l7 + 0x10],	%o0
	andcc	%o3,	%g3,	%o4
	ldd	[%l7 + 0x08],	%f12
	std	%f4,	[%l7 + 0x78]
	ldsw	[%l7 + 0x70],	%i1
	flush	%l7 + 0x1C
	std	%g6,	[%l7 + 0x50]
	rdpr	%cansave,	%i3
	movcs	%xcc,	%i7,	%i6
	ldd	[%l7 + 0x50],	%f10
	tgu	%icc,	0x3
	prefetch	[%l7 + 0x20],	 0x3
	prefetch	[%l7 + 0x78],	 0x1
	edge32l	%i5,	%l0,	%g1
	swap	[%l7 + 0x08],	%o7
	edge32n	%o6,	%g4,	%i2
	fcmpgt32	%f10,	%f12,	%l4
	stbar
	ldstub	[%l7 + 0x13],	%l5
	stbar
	nop
	setx	loop_217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsb	[%l7 + 0x44],	%i0
	stbar

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5BB, 	%hsys_tick_cmpr
loop_217:
	ldsw	[%l7 + 0x24],	%o1
	lduh	[%l7 + 0x7E],	%o2
	swap	[%l7 + 0x0C],	%g7
	lduh	[%l7 + 0x6A],	%l2
	bvs,a,pn	%xcc,	loop_218
	stx	%g5,	[%l7 + 0x58]
	prefetch	[%l7 + 0x6C],	 0x0
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f22
loop_218:
	nop
	set	0x60, %o6
	ldsw	[%l7 + %o6],	%l1
	ldsh	[%l7 + 0x38],	%o5
	ld	[%l7 + 0x20],	%f28
	flush	%l7 + 0x08
	std	%g2,	[%l7 + 0x50]
	bleu,a,pt	%xcc,	loop_219
	stbar
	edge8ln	%o0,	%o3,	%l6
	prefetch	[%l7 + 0x58],	 0x0
loop_219:
	swap	[%l7 + 0x78],	%o4
	stbar
	std	%f0,	[%l7 + 0x58]
	flush	%l7 + 0x18
	ldsh	[%l7 + 0x6A],	%g3
	movg	%icc,	%g6,	%i1
	move	%icc,	%i3,	%i7
	nop
	set	0x71, %o3
	ldstub	[%l7 + %o3],	%i6
	fbuge,a	%fcc1,	loop_220
	rdpr	%wstate,	%i5
	ldsb	[%l7 + 0x6B],	%g1
	stx	%l0,	[%l7 + 0x08]
loop_220:
	ldx	[%l7 + 0x58],	%o7
	ld	[%l7 + 0x40],	%f20
	ld	[%l7 + 0x74],	%f29
	ldx	[%l7 + 0x38],	%g4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g3
	ldxa	[%g0 + %g3] 0x4f,	%o6
	subcc	%l4,	%l5,	%i2
	edge16n	%i0,	%l3,	%o1
	move	%icc,	%i4,	%g7
	fmovdleu	%icc,	%f10,	%f13
	wr 	%g0, 	0x7, 	%fprs
	ldsh	[%l7 + 0x0C],	%o2
	sir	0x1F01
	ld	[%l7 + 0x40],	%f17
	fmovrslez	%l1,	%f0,	%f21
	stx	%g2,	[%l7 + 0x40]
	ldsw	[%l7 + 0x24],	%o5
	ldstub	[%l7 + 0x2D],	%o0
	ldsw	[%l7 + 0x2C],	%o3
	addccc	%l6,	0x0C9F,	%g3
	fxnors	%f2,	%f29,	%f25
	fble	%fcc1,	loop_221
	nop
	set	0x5C, %o4
	stb	%g6,	[%l7 + %o4]
	bcs	loop_222
	ldx	[%l7 + 0x18],	%i1
loop_221:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	nop
	wr	%g0,	0x20,	%asi
	stxa	%i3,	[%g0 + 0x38] %asi
loop_222:
	stb	%o4,	[%l7 + 0x34]
	lduh	[%l7 + 0x1E],	%i7
	nop
	set	0x74, %l6
	ldsh	[%l7 + %l6],	%i5
	tne	%xcc,	0x4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %g2
	stxa	%i6,	[%g0 + %g2] 0x20
	stx	%l0,	[%l7 + 0x48]
	rd	%tick_cmpr,	%g1
	ldd	[%l7 + 0x20],	%o6
	fmovsleu	%xcc,	%f18,	%f4
	movgu	%icc,	%o6,	%g4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%l4,	[%g0 + 0x30] %asi
	swap	[%l7 + 0x38],	%l5
	std	%i2,	[%l7 + 0x60]
	ldstub	[%l7 + 0x5A],	%l3
	prefetch	[%l7 + 0x48],	 0x2
	ldsw	[%l7 + 0x18],	%o1
	std	%f16,	[%l7 + 0x20]
	prefetch	[%l7 + 0x40],	 0x0
	subc	%i4,	%i0,	%g7
	tpos	%xcc,	0x3
	orcc	%g5,	%l2,	%l1
	lduh	[%l7 + 0x0E],	%o2
	ldsw	[%l7 + 0x10],	%o5
	flush	%l7 + 0x6C
	nop
	set	0x20, %l5
	ldsh	[%l7 + %l5],	%g2
	ldsb	[%l7 + 0x63],	%o0
	stw	%l6,	[%l7 + 0x7C]
	nop
	set	0x2A, %g1
	ldsh	[%l7 + %g1],	%g3
	std	%f24,	[%l7 + 0x40]
	edge32l	%o3,	%i1,	%g6
	ldub	[%l7 + 0x67],	%i3
	ldx	[%l7 + 0x68],	%i7
	fbe	%fcc3,	loop_223
	ldd	[%l7 + 0x28],	%i4
	ldd	[%l7 + 0x10],	%f30
	std	%i6,	[%l7 + 0x50]
loop_223:
	std	%o4,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %l3
	stxa	%g1,	[%g0 + %l3] 0x4f
	tle	%icc,	0x7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %i7
	stxa	%o7,	[%g0 + %i7] 0x20
	ldd	[%l7 + 0x70],	%l0
	bvs	loop_224
	rd	%y,	%o6
	std	%f16,	[%l7 + 0x68]
	st	%f25,	[%l7 + 0x30]
loop_224:
	std	%g4,	[%l7 + 0x48]
	ldd	[%l7 + 0x18],	%f22
	ldx	[%l7 + 0x48],	%l4
	fmovd	%f30,	%f30
	sth	%i2,	[%l7 + 0x40]
	std	%l4,	[%l7 + 0x68]
	stbar
	ldub	[%l7 + 0x3D],	%o1
	std	%l2,	[%l7 + 0x40]
	tsubcc	%i0,	%i4,	%g7
	fmul8x16au	%f17,	%f13,	%f0
	stx	%l2,	[%l7 + 0x08]
	nop
	set	0x39, %l1
	ldsb	[%l7 + %l1],	%l1
	edge32l	%g5,	%o2,	%g2
	std	%o4,	[%l7 + 0x68]
	movre	%o0,	0x182,	%g3
	fmovdvc	%xcc,	%f21,	%f18
	ldd	[%l7 + 0x48],	%f26
	sth	%o3,	[%l7 + 0x30]
	movl	%xcc,	%i1,	%l6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x483, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x34],	 0x0
	stbar
	lduh	[%l7 + 0x6C],	%i3
	stw	%i7,	[%l7 + 0x44]
	stb	%i5,	[%l7 + 0x1A]
	ldsh	[%l7 + 0x72],	%i6
	for	%f20,	%f22,	%f22
	ldsw	[%l7 + 0x18],	%g1
	std	%f20,	[%l7 + 0x28]
	lduw	[%l7 + 0x78],	%o4
	edge32l	%l0,	%o6,	%o7
	stb	%l4,	[%l7 + 0x25]
	st	%f3,	[%l7 + 0x54]
	rd	%ccr,	%g4
	movrgez	%l5,	%o1,	%i2
	sllx	%i0,	0x1C,	%l3
	stw	%i4,	[%l7 + 0x48]
	ldsh	[%l7 + 0x52],	%g7
	prefetch	[%l7 + 0x30],	 0x1
	ldstub	[%l7 + 0x63],	%l1
	std	%g4,	[%l7 + 0x48]
	ldx	[%l7 + 0x68],	%o2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x30] %asi
	ld	[%l7 + 0x58],	%f23
	prefetch	[%l7 + 0x1C],	 0x1
	ld	[%l7 + 0x14],	%f22
	lduw	[%l7 + 0x18],	%l2
	ldd	[%l7 + 0x68],	%o4
	brlz	%g3,	loop_225
	nop
	set	0x40, %o0
	prefetch	[%l7 + %o0],	 0x2
	rdpr	%canrestore,	%o3
	bne,a	loop_226
loop_225:
	std	%i0,	[%l7 + 0x38]
	fbl	%fcc0,	loop_227
	taddcc	%l6,	%g6,	%i3
loop_226:
	sth	%o0,	[%l7 + 0x0C]
	rdpr	%wstate,	%i5
loop_227:
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f24
	sth	%i7,	[%l7 + 0x64]
	stx	%i6,	[%l7 + 0x20]
	lduw	[%l7 + 0x58],	%o4
	stx	%l0,	[%l7 + 0x30]
	stw	%g1,	[%l7 + 0x70]
	std	%o6,	[%l7 + 0x60]
	te	%xcc,	0x5
	movl	%xcc,	%l4,	%g4
	ldsh	[%l7 + 0x32],	%l5
	lduw	[%l7 + 0x08],	%o7
	ldsw	[%l7 + 0x30],	%i2
	addc	%o1,	0x03EC,	%i0
	stx	%i4,	[%l7 + 0x70]
	stbar
	ldub	[%l7 + 0x1B],	%g7
	tleu	%xcc,	0x3
	lduh	[%l7 + 0x0A],	%l3
	ldub	[%l7 + 0x0D],	%l1
	sth	%g5,	[%l7 + 0x38]
	fpsub16s	%f3,	%f12,	%f20
	std	%f24,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x38] %asi
	nop
	set	0x52, %l2
	stb	%o2,	[%l7 + %l2]
	edge32l	%o5,	%l2,	%o3
	ldsb	[%l7 + 0x19],	%i1
	sth	%l6,	[%l7 + 0x1C]
	ldstub	[%l7 + 0x32],	%g3
	fandnot2s	%f18,	%f31,	%f12
	fandnot1	%f16,	%f26,	%f6
	ta	%xcc,	0x0
	swap	[%l7 + 0x3C],	%g6
	lduh	[%l7 + 0x0C],	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x6D],	%i5
	rd	%fprs,	%i7
	fmovsg	%xcc,	%f30,	%f25
	movvs	%xcc,	%i6,	%i3
	std	%o4,	[%l7 + 0x50]
	ldub	[%l7 + 0x6C],	%l0
	ldstub	[%l7 + 0x59],	%o6
	fabss	%f19,	%f20
	swap	[%l7 + 0x78],	%g1
	ldstub	[%l7 + 0x48],	%g4
	swap	[%l7 + 0x28],	%l4
	array8	%l5,	%o7,	%i2
	std	%f26,	[%l7 + 0x70]
	ldx	[%l7 + 0x50],	%i0
	ld	[%l7 + 0x18],	%f12
	edge16n	%o1,	%i4,	%l3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%l1,	[%g0 + 0x20] %asi
	nop
	set	0x68, %i3
	stx	%g5,	[%l7 + %i3]
	lduw	[%l7 + 0x78],	%g7
	ldsw	[%l7 + 0x7C],	%o2
	sth	%o5,	[%l7 + 0x7E]
	std	%f4,	[%l7 + 0x08]
	ldx	[%l7 + 0x48],	%g2
	srl	%o3,	0x02,	%i1
	flush	%l7 + 0x30
	ldx	[%l7 + 0x78],	%l2
	ldd	[%l7 + 0x08],	%i6
	tvs	%xcc,	0x6
	ld	[%l7 + 0x14],	%f14
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%g3,	[%g0 + 0x8] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	sth	%i7,	[%l7 + 0x0A]
	st	%f3,	[%l7 + 0x28]
	xnorcc	%o0,	0x1946,	%i3
	swap	[%l7 + 0x28],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i6
	sdivcc	%o6,	0x09A8,	%l0
	andncc	%g4,	%l4,	%g1
	ldd	[%l7 + 0x18],	%f26
	lduh	[%l7 + 0x14],	%l5
	st	%f0,	[%l7 + 0x20]
	ldd	[%l7 + 0x70],	%o6
	prefetch	[%l7 + 0x28],	 0x1
	ldstub	[%l7 + 0x7E],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1C4, 	%hsys_tick_cmpr
	st	%f0,	[%l7 + 0x3C]
	flush	%l7 + 0x10
	ldsh	[%l7 + 0x7A],	%o1
	ldsb	[%l7 + 0x12],	%i4
	fmovsle	%icc,	%f19,	%f24
	tne	%icc,	0x5
	sth	%l3,	[%l7 + 0x5C]
	tgu	%icc,	0x1
	swap	[%l7 + 0x2C],	%g5
	ldstub	[%l7 + 0x50],	%l1
	stbar
	ldsb	[%l7 + 0x50],	%g7
	nop
	set	0x1B, %o7
	ldub	[%l7 + %o7],	%o2
	lduh	[%l7 + 0x32],	%g2
	movcs	%xcc,	%o5,	%i1
	lduw	[%l7 + 0x5C],	%o3
	fba,a	%fcc1,	loop_228
	umul	%l2,	%l6,	%g3
	stx	%i5,	[%l7 + 0x50]
	ldd	[%l7 + 0x38],	%f30
loop_228:
	fbn,a	%fcc2,	loop_229
	st	%f25,	[%l7 + 0x3C]
	ldsw	[%l7 + 0x74],	%g6
	stb	%i7,	[%l7 + 0x7F]
loop_229:
	ldstub	[%l7 + 0x66],	%i3
	tgu	%icc,	0x0
	flush	%l7 + 0x58
	subc	%o0,	%i6,	%o6
	movne	%xcc,	%l0,	%g4
	ldsw	[%l7 + 0x7C],	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%o4,	[%g0 + 0x28] %asi
	std	%l4,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fzero	%f28
	st	%f15,	[%l7 + 0x7C]
	nop
	set	0x3A, %o2
	ldsh	[%l7 + %o2],	%g1
	ldstub	[%l7 + 0x10],	%i2
	smul	%o1,	%i4,	%l3
	stb	%l1,	[%l7 + 0x0A]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %i6
	stxa	%g5,	[%g0 + %i6] 0x20
	sth	%o2,	[%l7 + 0x50]
	ldstub	[%l7 + 0x2B],	%g7
	flush	%l7 + 0x64
	stb	%g2,	[%l7 + 0x0E]
	nop
	set	0x10, %l0
	ldsh	[%l7 + %l0],	%i1
	bcs,pn	%icc,	loop_230
	ldsb	[%l7 + 0x0A],	%o5
	nop
	set	0x24, %i1
	lduw	[%l7 + %i1],	%o3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%l2,	[%g0 + 0x18] %asi
loop_230:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	nop
	set	0x30, %i5
	stxa	%g3,	[%g0 + %i5] 0x20
	st	%f4,	[%l7 + 0x78]
	udiv	%i5,	0x14C3,	%g6
	ldd	[%l7 + 0x48],	%i6
	ld	[%l7 + 0x34],	%f27
	rdpr	%cansave,	%i3
	array8	%o0,	%i6,	%o6
	stb	%l0,	[%l7 + 0x1C]
	stw	%g4,	[%l7 + 0x24]
	bvc,pn	%icc,	loop_231
	pdist	%f24,	%f20,	%f24
	rdpr	%tl,	%l6
	edge32l	%o4,	%l5,	%o7
loop_231:
	ldub	[%l7 + 0x55],	%i0
	edge16	%l4,	%i2,	%o1
	movvc	%icc,	%g1,	%i4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %g4
	ldxa	[%g0 + %g4] 0x20,	%l1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o5
	stxa	%g5,	[%g0 + %o5] 0x20
	stx	%o2,	[%l7 + 0x20]
	ldsh	[%l7 + 0x46],	%l3
	orncc	%g2,	0x1737,	%g7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	ld	[%l7 + 0x6C],	%f17
	ldstub	[%l7 + 0x08],	%i1
	ldsb	[%l7 + 0x10],	%l2
	ldd	[%l7 + 0x40],	%f6
	std	%f8,	[%l7 + 0x30]
	ldsb	[%l7 + 0x3B],	%g3
	ldsw	[%l7 + 0x24],	%g6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %g7
	stxa	%i5,	[%g0 + %g7] 0x20
	ldsh	[%l7 + 0x42],	%i3
	flushw
	sir	0x0357
	swap	[%l7 + 0x70],	%i7
	wrpr	%i6,	%o6,	%cwp
	ldstub	[%l7 + 0x78],	%l0
	flush	%l7 + 0x60
	fsrc2	%f22,	%f14
	addccc	%g4,	%l6,	%o0
	stx	%l5,	[%l7 + 0x60]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fbe	%fcc0,	loop_232
	or	%o4,	0x171B,	%i0
	stb	%l4,	[%l7 + 0x20]
	nop
	set	0x74, %g6
	ldstub	[%l7 + %g6],	%i2
loop_232:
	nop
	set	0x77, %i0
	ldub	[%l7 + %i0],	%g1
	fcmpes	%fcc0,	%f28,	%f30
	rdpr	%cleanwin,	%o1
	swap	[%l7 + 0x68],	%i4
	nop
	set	0x40, %i4
	ldsw	[%l7 + %i4],	%g5
	st	%f24,	[%l7 + 0x08]
	flush	%l7 + 0x30
	stb	%l1,	[%l7 + 0x67]
	rdpr	%otherwin,	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%l3
	tcs	%icc,	0x5
	nop
	set	0x42, %g5
	lduh	[%l7 + %g5],	%g7
	flush	%l7 + 0x70
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%o5
	ldstub	[%l7 + 0x6D],	%o3
	ldx	[%l7 + 0x20],	%i1
	swap	[%l7 + 0x24],	%l2
	swap	[%l7 + 0x70],	%g2
	nop
	set	0x68, %i2
	std	%f20,	[%l7 + %i2]
	ldub	[%l7 + 0x3F],	%g3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%i5,	[%g0 + 0x0] %asi
	ldsh	[%l7 + 0x70],	%g6
	swap	[%l7 + 0x34],	%i3
	stb	%i6,	[%l7 + 0x35]
	st	%f5,	[%l7 + 0x3C]
	st	%f6,	[%l7 + 0x68]
	ldsb	[%l7 + 0x3B],	%o6
	std	%f18,	[%l7 + 0x40]
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%l0
	ldsb	[%l7 + 0x40],	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l6
	sll	%o0,	%l5,	%o7
	brlez,a	%g4,	loop_233
	nop
	set	0x30, %o3
	prefetch	[%l7 + %o3],	 0x3
	ldsh	[%l7 + 0x30],	%i0
	ldsw	[%l7 + 0x14],	%l4
loop_233:
	brgz	%i2,	loop_234
	array32	%g1,	%o4,	%o1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	stxa	%i4,	[%g0 + 0x20] %asi
loop_234:
	xnorcc	%g5,	%l1,	%l3
	ldstub	[%l7 + 0x19],	%o2
	flush	%l7 + 0x60
	st	%f3,	[%l7 + 0x30]
	wrpr	%o5,	%g7,	%pil
	ldstub	[%l7 + 0x5B],	%i1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %o1
	ldxa	[%g0 + %o1] 0x4f,	%l2
	ldstub	[%l7 + 0x34],	%g2
	ldsb	[%l7 + 0x43],	%g3
	lduw	[%l7 + 0x2C],	%i5
	ldstub	[%l7 + 0x7F],	%o3
	stx	%i3,	[%l7 + 0x58]
	ld	[%l7 + 0x74],	%f6
	ldstub	[%l7 + 0x08],	%i6
	std	%f16,	[%l7 + 0x48]
	bne	loop_235
	stbar
	st	%f5,	[%l7 + 0x40]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xF76, 	%hsys_tick_cmpr
loop_235:
	prefetch	[%l7 + 0x3C],	 0x1
	stw	%l0,	[%l7 + 0x78]
	ld	[%l7 + 0x7C],	%f5
	nop
	set	0x48, %o4
	ldsh	[%l7 + %o4],	%i7
	nop
	set	0x32, %l6
	ldstub	[%l7 + %l6],	%g6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %g3
	stxa	%o0,	[%g0 + %g3] 0x20
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l5
	ldxa	[%g0 + %l5] 0x20,	%l6
	ldd	[%l7 + 0x68],	%l4
	swap	[%l7 + 0x58],	%o7
	ldsb	[%l7 + 0x1E],	%g4
	stx	%l4,	[%l7 + 0x08]
	st	%f31,	[%l7 + 0x7C]
	tle	%xcc,	0x5
	swap	[%l7 + 0x4C],	%i2
	nop
	set	0x38, %g1
	stx	%i0,	[%l7 + %g1]
	ldsh	[%l7 + 0x40],	%g1
	ldsh	[%l7 + 0x72],	%o4
	flush	%l7 + 0x34
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%o0
	sir	0x100B
	st	%f21,	[%l7 + 0x5C]
	std	%i4,	[%l7 + 0x20]
	udivcc	%g5,	0x01B2,	%l3
	ldub	[%l7 + 0x6F],	%l1
	pdist	%f8,	%f10,	%f10
	fble	%fcc1,	loop_236
	stbar
	xnorcc	%o2,	0x040F,	%g7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %i7
	ldxa	[%g0 + %i7] 0x20,	%i1
loop_236:
	stbar
	swap	[%l7 + 0x70],	%l2
	ldx	[%l7 + 0x78],	%o5
	sth	%g2,	[%l7 + 0x54]
	ldsb	[%l7 + 0x71],	%i5
	swap	[%l7 + 0x38],	%g3
	std	%f20,	[%l7 + 0x60]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i3
	swap	[%l7 + 0x14],	%o3
	fands	%f19,	%f8,	%f25
	fmovsleu	%xcc,	%f19,	%f9
	stbar
	ldsb	[%l7 + 0x0F],	%o6
	tcc	%xcc,	0x6
	ldsb	[%l7 + 0x7A],	%l0
	bvs	loop_237
	movvc	%icc,	%i7,	%g6
	ld	[%l7 + 0x18],	%f22
	ldsb	[%l7 + 0x60],	%i6
loop_237:
	movge	%icc,	%l6,	%l5
	stx	%o0,	[%l7 + 0x70]
	movrne	%g4,	0x2A4,	%l4
	lduw	[%l7 + 0x10],	%o7
	bleu,a,pn	%icc,	loop_238
	fabsd	%f26,	%f24
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %l1
	stxa	%i0,	[%g0 + %l1] 0x20
loop_238:
	ldsw	[%l7 + 0x64],	%g1
	ldx	[%l7 + 0x50],	%o4
	flush	%l7 + 0x14
	prefetch	[%l7 + 0x74],	 0x3
	std	%o0,	[%l7 + 0x10]
	fmovdvs	%xcc,	%f18,	%f24
	lduh	[%l7 + 0x6E],	%i2
	fsrc1	%f4,	%f18
	edge8	%i4,	%l3,	%g5
	ldstub	[%l7 + 0x3E],	%l1
	sth	%o2,	[%l7 + 0x5C]
	stw	%g7,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x33],	%l2
	stw	%i1,	[%l7 + 0x50]
	stx	%o5,	[%l7 + 0x40]
	stx	%i5,	[%l7 + 0x70]
	lduh	[%l7 + 0x24],	%g2
	stx	%g3,	[%l7 + 0x70]
	ble,a,pt	%icc,	loop_239
	std	%f6,	[%l7 + 0x78]
	stbar
	st	%f18,	[%l7 + 0x54]
loop_239:
	lduw	[%l7 + 0x3C],	%i3
	lduh	[%l7 + 0x20],	%o3
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f16
	stb	%o6,	[%l7 + 0x21]
	sth	%i7,	[%l7 + 0x76]
	tcc	%icc,	0x1
	sdivx	%g6,	0x0FE3,	%i6
	siam	0x6
	stx	%l0,	[%l7 + 0x70]
	ldsh	[%l7 + 0x34],	%l5
	std	%i6,	[%l7 + 0x28]
	sth	%g4,	[%l7 + 0x20]
	add	%l4,	0x0DF9,	%o0
	ldsh	[%l7 + 0x7E],	%i0
	nop
	set	0x18, %l4
	std	%g0,	[%l7 + %l4]
	ldd	[%l7 + 0x30],	%o6
	membar	0x69
	rd	%softint,	%o1
	popc	0x1A64,	%i2
	flushw
	ldsw	[%l7 + 0x7C],	%o4
	sth	%l3,	[%l7 + 0x72]
	tpos	%xcc,	0x3
	fmovdcc	%icc,	%f30,	%f2
	rd	%y,	%g5
	fmovrsne	%l1,	%f7,	%f30
	flush	%l7 + 0x78
	nop
	set	0x64, %l2
	lduw	[%l7 + %l2],	%i4
	sub	%g7,	0x0293,	%l2
	ld	[%l7 + 0x14],	%f29
	stw	%o2,	[%l7 + 0x4C]
	movvs	%icc,	%o5,	%i5
	ldsw	[%l7 + 0x24],	%g2
	sdivcc	%i1,	0x1BE6,	%g3
	sth	%i3,	[%l7 + 0x18]
	wrpr	%o3,	%o6,	%cwp
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%g6
	popc	%i7,	%l0
	edge32n	%l5,	%i6,	%g4
	flush	%l7 + 0x44
	std	%i6,	[%l7 + 0x40]
	flush	%l7 + 0x5C
	fmul8ulx16	%f8,	%f20,	%f18
	std	%f4,	[%l7 + 0x20]
	nop
	setx loop_240, %l0, %l1
	jmpl %l1, %o0
	ldd	[%l7 + 0x70],	%i0
	flush	%l7 + 0x14
	ldub	[%l7 + 0x49],	%l4
loop_240:
	st	%f5,	[%l7 + 0x08]
	swap	[%l7 + 0x58],	%o7
	movvs	%icc,	%o1,	%i2
	stbar
	flush	%l7 + 0x24
	st	%f20,	[%l7 + 0x08]
	bleu,a,pn	%xcc,	loop_241
	flush	%l7 + 0x10
	movrlz	%o4,	%l3,	%g1
	stb	%l1,	[%l7 + 0x5C]
loop_241:
	ldd	[%l7 + 0x58],	%f12
	std	%i4,	[%l7 + 0x30]
	lduw	[%l7 + 0x24],	%g5
	ldsb	[%l7 + 0x66],	%g7
	stbar
	stbar
	ldstub	[%l7 + 0x6D],	%o2
	lduh	[%l7 + 0x56],	%l2
	ld	[%l7 + 0x50],	%f29
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %o7
	ldxa	[%g0 + %o7] 0x4f,	%i5
	lduw	[%l7 + 0x28],	%g2
	srl	%o5,	%i1,	%g3
	std	%f24,	[%l7 + 0x48]
	stx	%i3,	[%l7 + 0x68]
	movrlez	%o3,	%o6,	%g6
	stx	%i7,	[%l7 + 0x60]
	ldub	[%l7 + 0x44],	%l0
	stb	%i6,	[%l7 + 0x5A]
	fbne,a	%fcc2,	loop_242
	fxors	%f14,	%f11,	%f10
	ldsw	[%l7 + 0x64],	%l5
	sth	%g4,	[%l7 + 0x2E]
loop_242:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	nop
	set	0x38, %o0
	stxa	%l6,	[%g0 + %o0] 0x4f
	popc	%o0,	%i0
	ldsw	[%l7 + 0x68],	%l4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o1
	fmovrde	%o7,	%f20,	%f14
	fbge	%fcc3,	loop_243
	ldstub	[%l7 + 0x3F],	%o4
	prefetch	[%l7 + 0x5C],	 0x1
	flush	%l7 + 0x34
loop_243:
	ldx	[%l7 + 0x20],	%i2
	swap	[%l7 + 0x70],	%g1
	membar	0x63
	tvc	%xcc,	0x6
	swap	[%l7 + 0x24],	%l3
	subcc	%l1,	%i4,	%g5
	rdhpr	%hpstate,	%g7
	edge8	%l2,	%i5,	%o2
	nop
	set	0x30, %i6
	std	%f26,	[%l7 + %i6]
	fmul8x16au	%f19,	%f0,	%f6
	stbar
	sth	%o5,	[%l7 + 0x10]
	swap	[%l7 + 0x1C],	%g2
	stbar
	stbar
	stb	%i1,	[%l7 + 0x78]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %o2
	stxa	%g3,	[%g0 + %o2] 0x4f
	flush	%l7 + 0x78
	flush	%l7 + 0x68
	prefetch	[%l7 + 0x78],	 0x3
	tsubcctv	%o3,	0x0E0F,	%i3
	sdiv	%g6,	0x1EC2,	%o6
	ldsb	[%l7 + 0x3E],	%i7
	ldub	[%l7 + 0x42],	%i6
	ldstub	[%l7 + 0x26],	%l5
	srlx	%l0,	0x10,	%l6
	ld	[%l7 + 0x30],	%f22
	ldsb	[%l7 + 0x17],	%o0
	lduh	[%l7 + 0x52],	%g4
	fmul8x16	%f6,	%f8,	%f6
	stbar
	wrpr	%l4,	0x0A33,	%pil
	stb	%o1,	[%l7 + 0x1B]
	std	%f4,	[%l7 + 0x78]
	nop
	set	0x78, %i1
	std	%i0,	[%l7 + %i1]
	ldd	[%l7 + 0x38],	%o4
	swap	[%l7 + 0x3C],	%i2
	stx	%g1,	[%l7 + 0x70]
	ldd	[%l7 + 0x40],	%o6
	fbne,a	%fcc3,	loop_244
	movle	%icc,	%l1,	%i4
	st	%f15,	[%l7 + 0x6C]
	swap	[%l7 + 0x48],	%g5
loop_244:
	lduw	[%l7 + 0x34],	%l3
	ldx	[%l7 + 0x60],	%g7
	sth	%l2,	[%l7 + 0x4E]
	stbar
	ldsw	[%l7 + 0x10],	%i5
	srl	%o5,	0x10,	%o2
	movrlz	%i1,	0x3DD,	%g2
	lduw	[%l7 + 0x30],	%o3
	ldd	[%l7 + 0x68],	%g2
	movrlz	%g6,	%o6,	%i7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %i5
	stxa	%i3,	[%g0 + %i5] 0x4f
	tne	%icc,	0x4
	stbar
	stw	%i6,	[%l7 + 0x58]
	movne	%icc,	%l0,	%l5
	stx	%l6,	[%l7 + 0x48]
	ldstub	[%l7 + 0x31],	%g4
	std	%o0,	[%l7 + 0x20]
	sllx	%o1,	0x13,	%l4
	ldsb	[%l7 + 0x2C],	%o4
	flush	%l7 + 0x40
	fmovs	%f22,	%f29
	nop
	set	0x40, %l0
	ldub	[%l7 + %l0],	%i2
	ldd	[%l7 + 0x70],	%f26
	stbar
	swap	[%l7 + 0x20],	%i0
	edge8l	%g1,	%o7,	%l1
	nop
	set	0x73, %o5
	ldub	[%l7 + %o5],	%g5
	tn	%xcc,	0x4
	ldsh	[%l7 + 0x7E],	%l3
	ldub	[%l7 + 0x4B],	%i4
	sub	%l2,	%i5,	%o5
	ldx	[%l7 + 0x30],	%g7
	stx	%i1,	[%l7 + 0x08]
	ldub	[%l7 + 0x0E],	%g2
	st	%f5,	[%l7 + 0x44]
	ldx	[%l7 + 0x40],	%o2
	tcs	%xcc,	0x6
	fmovdne	%xcc,	%f0,	%f20
	std	%f26,	[%l7 + 0x78]
	lduw	[%l7 + 0x60],	%g3
	ldd	[%l7 + 0x20],	%o2
	bcc,a,pn	%xcc,	loop_245
	movgu	%icc,	%o6,	%i7
	ldsb	[%l7 + 0x26],	%i3
	bvc	%icc,	loop_246
loop_245:
	lduh	[%l7 + 0x78],	%i6
	ld	[%l7 + 0x24],	%f17
	membar	0x3B
loop_246:
	tn	%icc,	0x5
	stb	%g6,	[%l7 + 0x54]
	ldd	[%l7 + 0x48],	%f10
	stx	%l5,	[%l7 + 0x50]
	nop
	set	0x26, %g7
	sth	%l0,	[%l7 + %g7]
	movrlz	%l6,	0x2E4,	%o0
	stb	%o1,	[%l7 + 0x46]
	sth	%g4,	[%l7 + 0x3C]
	ldstub	[%l7 + 0x3F],	%l4
	lduw	[%l7 + 0x2C],	%i2
	stbar
	swap	[%l7 + 0x18],	%i0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %g6
	stxa	%o4,	[%g0 + %g6] 0x20
	ldsh	[%l7 + 0x72],	%l1
	stb	%g5,	[%l7 + 0x7C]
	ldx	[%l7 + 0x70],	%l3
	ldx	[%l7 + 0x08],	%o7
	sll	%l2,	%i4,	%o5
	ldsw	[%l7 + 0x64],	%g7
	ldx	[%l7 + 0x60],	%i5
	ldstub	[%l7 + 0x21],	%g2
	std	%f20,	[%l7 + 0x30]
	andncc	%i1,	%g3,	%o3
	movvc	%xcc,	%o2,	%i7
	sllx	%o6,	%i6,	%g6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %g4
	ldxa	[%g0 + %g4] 0x20,	%l5
	fcmple32	%f16,	%f12,	%i3
	std	%f8,	[%l7 + 0x58]
	tl	%icc,	0x1
	ldsb	[%l7 + 0x2A],	%l0
	std	%f6,	[%l7 + 0x08]
	andcc	%o0,	0x028B,	%o1
	stw	%g4,	[%l7 + 0x20]
	rdhpr	%htba,	%l6
	fpack16	%f20,	%f4
	std	%l4,	[%l7 + 0x78]
	ldub	[%l7 + 0x22],	%i0
	nop
	set	0x28, %i4
	ldsw	[%l7 + %i4],	%i2
	stb	%g1,	[%l7 + 0x3B]
	sth	%l1,	[%l7 + 0x62]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g5
	ldxa	[%g0 + %g5] 0x4f,	%o4
	lduh	[%l7 + 0x68],	%g5
	movvc	%icc,	%o7,	%l2
	lduh	[%l7 + 0x50],	%l3
	swap	[%l7 + 0x70],	%o5
	lduh	[%l7 + 0x36],	%i4
	addccc	%g7,	0x123B,	%i5
	std	%f8,	[%l7 + 0x20]
	std	%g2,	[%l7 + 0x50]
	fpadd16	%f10,	%f0,	%f18
	ldub	[%l7 + 0x67],	%i1
	nop
	set	0x18, %i0
	ldub	[%l7 + %i0],	%o3
	nop
	set	0x48, %o6
	stx	%g3,	[%l7 + %o6]
	flush	%l7 + 0x5C
	st	%f1,	[%l7 + 0x44]
	fbu	%fcc3,	loop_247
	sth	%i7,	[%l7 + 0x64]
	brgez	%o6,	loop_248
	alignaddrl	%i6,	%g6,	%l5
loop_247:
	ldsw	[%l7 + 0x44],	%i3
	stb	%o2,	[%l7 + 0x69]
loop_248:
	rd	%sys_tick_cmpr,	%o0
	movg	%icc,	%l0,	%o1
	stw	%l6,	[%l7 + 0x4C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g4
	tl	%xcc,	0x5
	fnands	%f10,	%f20,	%f15
	st	%f9,	[%l7 + 0x48]
	stx	%i0,	[%l7 + 0x20]
	prefetch	[%l7 + 0x74],	 0x2
	lduw	[%l7 + 0x18],	%l4
	lduh	[%l7 + 0x0C],	%g1
	srax	%l1,	%i2,	%g5
	ldstub	[%l7 + 0x26],	%o4
	tge	%xcc,	0x3
	lduw	[%l7 + 0x64],	%o7
	bge,a,pt	%xcc,	loop_249
	nop
	set	0x4C, %o3
	ldsh	[%l7 + %o3],	%l2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%o5,	[%g0 + 0x38] %asi
loop_249:
	stbar
	std	%f18,	[%l7 + 0x08]
	fmovdvs	%icc,	%f26,	%f18
	rdhpr	%hintp,	%i4
	sth	%l3,	[%l7 + 0x70]
	ldstub	[%l7 + 0x2C],	%i5
	stbar
	nop
	set	0x0C, %o1
	ldsw	[%l7 + %o1],	%g7
	lduh	[%l7 + 0x0A],	%i1
	stw	%g2,	[%l7 + 0x34]
	ldstub	[%l7 + 0x2E],	%o3

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xEFC, 	%hsys_tick_cmpr
	rdpr	%wstate,	%i7
	ldsb	[%l7 + 0x3A],	%g6
	ld	[%l7 + 0x10],	%f7
	std	%l4,	[%l7 + 0x70]
	tgu	%xcc,	0x5
	lduw	[%l7 + 0x70],	%i3
	ldstub	[%l7 + 0x3D],	%i6
	tcc	%icc,	0x6
	bleu,a	%xcc,	loop_250
	lduw	[%l7 + 0x30],	%o0
	stbar
	fpadd16s	%f15,	%f14,	%f3
loop_250:
	ld	[%l7 + 0x34],	%f31
	udivx	%o2,	0x0658,	%l0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%l6,	[%g0 + 0x8] %asi
	nop
	set	0x60, %o4
	std	%f14,	[%l7 + %o4]
	ldx	[%l7 + 0x30],	%g4
	ld	[%l7 + 0x2C],	%f15
	edge16ln	%o1,	%l4,	%g1
	lduh	[%l7 + 0x64],	%i0
	fcmple32	%f14,	%f18,	%i2
	ble,a,pn	%icc,	loop_251
	lduw	[%l7 + 0x68],	%l1
	st	%f12,	[%l7 + 0x54]
	st	%f11,	[%l7 + 0x70]
loop_251:
	lduw	[%l7 + 0x20],	%g5
	ldsb	[%l7 + 0x4E],	%o7
	stx	%o4,	[%l7 + 0x60]
	ldx	[%l7 + 0x58],	%o5
	ta	%icc,	0x5
	ldsb	[%l7 + 0x74],	%l2
	swap	[%l7 + 0x18],	%i4
	subcc	%l3,	%i5,	%i1
	ldsh	[%l7 + 0x5A],	%g2
	ldd	[%l7 + 0x50],	%f10
	lduw	[%l7 + 0x38],	%g7
	xnor	%o3,	0x1B25,	%g3
	nop
	set	0x18, %l6
	std	%i6,	[%l7 + %l6]
	fbe	%fcc2,	loop_252
	stbar
	tl	%xcc,	0x5
	edge16ln	%g6,	%o6,	%i3
loop_252:
	fcmpd	%fcc3,	%f0,	%f2
	rdpr	%cleanwin,	%l5
	ldsh	[%l7 + 0x30],	%i6
	ld	[%l7 + 0x6C],	%f16
	subccc	%o2,	%o0,	%l0
	sth	%g4,	[%l7 + 0x58]
	ldd	[%l7 + 0x78],	%i6
	ld	[%l7 + 0x60],	%f29
	ldsb	[%l7 + 0x46],	%o1
	st	%f10,	[%l7 + 0x0C]
	prefetch	[%l7 + 0x60],	 0x0
	addc	%g1,	0x1302,	%l4
	movl	%xcc,	%i0,	%i2
	tgu	%xcc,	0x7
	ldd	[%l7 + 0x78],	%g4
	tcc	%xcc,	0x7
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%l0
	stb	%o4,	[%l7 + 0x45]
	fbu	%fcc2,	loop_253
	st	%f2,	[%l7 + 0x7C]
	lduh	[%l7 + 0x2C],	%o5
	nop
	set	0x7C, %l5
	lduw	[%l7 + %l5],	%l2
loop_253:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	nop
	set	0x20, %i2
	stxa	%i4,	[%g0 + %i2] 0x20
	lduh	[%l7 + 0x46],	%l3
	ldd	[%l7 + 0x18],	%i4
	lduw	[%l7 + 0x1C],	%o7
	lduw	[%l7 + 0x18],	%i1
	std	%f28,	[%l7 + 0x10]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x89B, 	%hsys_tick_cmpr
	prefetch	[%l7 + 0x68],	 0x3
	fbuge,a	%fcc0,	loop_254
	ldd	[%l7 + 0x78],	%f16
	smulcc	%g7,	%g3,	%o3
	std	%g6,	[%l7 + 0x48]
loop_254:
	tgu	%icc,	0x2
	flush	%l7 + 0x7C
	ldx	[%l7 + 0x10],	%i7

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	fxor	%f26,	%f24,	%f20
	ldsh	[%l7 + 0x14],	%l5
	mulscc	%i6,	0x1606,	%o2
	stbar
	fexpand	%f19,	%f16

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xC1C, 	%hsys_tick_cmpr
	sllx	%l0,	%l6,	%g4
	movrlez	%g1,	0x28F,	%o1
	ldsb	[%l7 + 0x43],	%l4
	ldsw	[%l7 + 0x54],	%i2
	ld	[%l7 + 0x4C],	%f9
	ld	[%l7 + 0x5C],	%f4
	nop
	set	0x60, %l3
	ldsh	[%l7 + %l3],	%g5
	std	%l0,	[%l7 + 0x48]
	st	%f9,	[%l7 + 0x20]
	ldsb	[%l7 + 0x10],	%i0
	flush	%l7 + 0x1C
	ldsw	[%l7 + 0x5C],	%o5
	stb	%l2,	[%l7 + 0x6A]
	lduw	[%l7 + 0x68],	%i4
	swap	[%l7 + 0x28],	%o4
	lduh	[%l7 + 0x5E],	%i5
	stb	%o7,	[%l7 + 0x18]
	ldsw	[%l7 + 0x20],	%i1
	sth	%g2,	[%l7 + 0x0A]
	ldsw	[%l7 + 0x20],	%l3
	wrpr	%g7,	%o3,	%tick
	movrlez	%g3,	%i7,	%g6
	std	%f8,	[%l7 + 0x30]
	subcc	%l5,	%o6,	%o2
	nop
	set	0x60, %g1
	ldsh	[%l7 + %g1],	%i6
	ldstub	[%l7 + 0x15],	%i3
	bg,a	loop_255
	ldd	[%l7 + 0x50],	%o0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %i7
	stxa	%l0,	[%g0 + %i7] 0x4f
loop_255:
	flush	%l7 + 0x5C
	std	%f22,	[%l7 + 0x60]
	sdivx	%g4,	0x1FD9,	%l6
	nop
	set	0x70, %l1
	sth	%o1,	[%l7 + %l1]
	nop
	set	0x30, %l4
	std	%f30,	[%l7 + %l4]
	ldsh	[%l7 + 0x42],	%l4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %g2
	stxa	%g1,	[%g0 + %g2] 0x4f
	ldstub	[%l7 + 0x42],	%l1
	ldsw	[%l7 + 0x2C],	%g5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i3
	stxa	%o5,	[%g0 + %i3] 0x20
	movn	%icc,	%i0,	%i4
	ldx	[%l7 + 0x38],	%l2
	ldd	[%l7 + 0x70],	%i4
	stw	%o4,	[%l7 + 0x74]
	andn	%i1,	%g2,	%o7
	fmovscs	%xcc,	%f30,	%f2
	move	%icc,	%g7,	%o3
	movrgez	%g3,	%i7,	%g6
	ldsh	[%l7 + 0x3E],	%l3
	stw	%l5,	[%l7 + 0x30]
	edge16	%o2,	%o6,	%i3
	ldsw	[%l7 + 0x68],	%o0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %l2
	ldxa	[%g0 + %l2] 0x4f,	%l0
	nop
	setx	loop_256,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x24
	fcmpne16	%f26,	%f22,	%g4
	lduw	[%l7 + 0x3C],	%i6
loop_256:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	nop
	set	0x28, %o0
	stxa	%l6,	[%g0 + %o0] 0x4f
	nop
	set	0x51, %i6
	ldsb	[%l7 + %i6],	%o1
	swap	[%l7 + 0x54],	%i2
	std	%g0,	[%l7 + 0x60]
	st	%f8,	[%l7 + 0x28]
	stx	%l4,	[%l7 + 0x30]
	std	%g4,	[%l7 + 0x30]
	ldsw	[%l7 + 0x14],	%l1
	ldsh	[%l7 + 0x62],	%i0
	ldx	[%l7 + 0x70],	%i4
	stx	%l2,	[%l7 + 0x30]
	ld	[%l7 + 0x74],	%f2
	std	%f20,	[%l7 + 0x60]
	rd	%y,	%i5
	swap	[%l7 + 0x08],	%o5
	lduw	[%l7 + 0x58],	%i1
	ldd	[%l7 + 0x48],	%f12
	stb	%g2,	[%l7 + 0x62]
	swap	[%l7 + 0x0C],	%o4
	stbar
	st	%f25,	[%l7 + 0x50]
	sth	%g7,	[%l7 + 0x6A]
	flush	%l7 + 0x2C
	sth	%o7,	[%l7 + 0x16]
	ldsw	[%l7 + 0x58],	%g3
	ldsh	[%l7 + 0x1C],	%i7
	bcs,a	%xcc,	loop_257
	edge16l	%o3,	%l3,	%g6
	ldsw	[%l7 + 0x40],	%o2
	ldsw	[%l7 + 0x60],	%o6
loop_257:
	nop
	set	0x10, %o7
	stx	%l5,	[%l7 + %o7]
	fornot1	%f30,	%f28,	%f14
	ldsh	[%l7 + 0x4C],	%i3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %o2
	ldxa	[%g0 + %o2] 0x4f,	%l0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %i5
	stxa	%o0,	[%g0 + %i5] 0x4f
	fornot2s	%f11,	%f5,	%f30
	prefetch	[%l7 + 0x24],	 0x0
	ldsw	[%l7 + 0x54],	%g4
	movcc	%xcc,	%i6,	%o1
	lduh	[%l7 + 0x42],	%l6
	stw	%i2,	[%l7 + 0x64]
	ld	[%l7 + 0x40],	%f24
	stw	%l4,	[%l7 + 0x18]
	swap	[%l7 + 0x40],	%g1
	stb	%g5,	[%l7 + 0x15]
	nop
	set	0x2A, %l0
	ldub	[%l7 + %l0],	%l1

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	alignaddr	%i5,	%i4,	%o5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%i1,	[%g0 + 0x30] %asi
	tcs	%icc,	0x4
	stb	%o4,	[%l7 + 0x21]
	flush	%l7 + 0x50
	stw	%g7,	[%l7 + 0x58]
	stx	%o7,	[%l7 + 0x78]
	movre	%g2,	%g3,	%i7
	std	%f30,	[%l7 + 0x20]
	stb	%l3,	[%l7 + 0x19]
	st	%f28,	[%l7 + 0x08]
	movrgz	%o3,	0x28E,	%g6
	std	%f8,	[%l7 + 0x78]
	st	%f10,	[%l7 + 0x14]
	movge	%icc,	%o6,	%o2
	nop
	set	0x08, %i1
	stx	%l5,	[%l7 + %i1]
	sra	%l0,	0x1C,	%i3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x30] %asi
	fcmpne32	%f12,	%f2,	%i6
	swap	[%l7 + 0x28],	%g4
	ldx	[%l7 + 0x68],	%l6
	tgu	%xcc,	0x3
	prefetch	[%l7 + 0x40],	 0x1
	tl	%icc,	0x5
	ldsh	[%l7 + 0x24],	%i2
	fmovdleu	%xcc,	%f23,	%f27
	bpos,a	%icc,	loop_258
	stx	%o1,	[%l7 + 0x60]
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%g1
	lduh	[%l7 + 0x6C],	%g5
loop_258:
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	nop
	set	0x28, %g6
	stxa	%l4,	[%g0 + %g6] 0x20
	ldx	[%l7 + 0x70],	%i0
	andcc	%l2,	0x06CC,	%i5
	ld	[%l7 + 0x2C],	%f16
	nop
	set	0x50, %g7
	stx	%i4,	[%l7 + %g7]
	ldd	[%l7 + 0x10],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %g4
	ldxa	[%g0 + %g4] 0x20,	%i1
	stb	%l1,	[%l7 + 0x57]
	stb	%o4,	[%l7 + 0x2E]
	rdpr	%canrestore,	%g7
	xnorcc	%g2,	%o7,	%i7
	ldsw	[%l7 + 0x68],	%g3
	lduw	[%l7 + 0x4C],	%o3
	stbar
	std	%l2,	[%l7 + 0x40]
	array8	%g6,	%o2,	%l5
	bleu,pn	%xcc,	loop_259
	swap	[%l7 + 0x5C],	%l0
	fcmple32	%f16,	%f12,	%o6
	flush	%l7 + 0x14
loop_259:
	lduw	[%l7 + 0x7C],	%i3
	nop
	set	0x50, %i4
	stb	%o0,	[%l7 + %i4]
	ld	[%l7 + 0x6C],	%f18
	stbar
	ldsh	[%l7 + 0x66],	%i6
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f12
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%g4,	[%g0 + 0x20] %asi
	prefetch	[%l7 + 0x4C],	 0x0
	fbule	%fcc0,	loop_260
	stb	%l6,	[%l7 + 0x79]
	ldd	[%l7 + 0x08],	%f30
	ldd	[%l7 + 0x60],	%f28
loop_260:
	ldsw	[%l7 + 0x10],	%i2
	movg	%xcc,	%g1,	%g5
	fabsd	%f24,	%f18
	flush	%l7 + 0x40
	ld	[%l7 + 0x64],	%f0
	lduh	[%l7 + 0x3A],	%o1
	ldstub	[%l7 + 0x64],	%l4
	sdivx	%l2,	0x0BA8,	%i0
	ld	[%l7 + 0x18],	%f24
	lduh	[%l7 + 0x26],	%i4
	lduw	[%l7 + 0x1C],	%o5
	prefetch	[%l7 + 0x28],	 0x2
	andn	%i5,	%i1,	%l1
	lduw	[%l7 + 0x64],	%o4
	bpos,a	loop_261
	movn	%xcc,	%g7,	%g2
	ldsw	[%l7 + 0x3C],	%i7
	std	%f22,	[%l7 + 0x10]
loop_261:
	movrne	%o7,	0x065,	%o3
	lduh	[%l7 + 0x74],	%g3
	ldsb	[%l7 + 0x1E],	%g6
	fmovsleu	%icc,	%f29,	%f19
	stw	%o2,	[%l7 + 0x20]
	std	%f12,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l3
	stw	%l0,	[%l7 + 0x38]
	edge16n	%l5,	%i3,	%o6
	stx	%o0,	[%l7 + 0x30]
	std	%i6,	[%l7 + 0x60]
	fmovsneg	%icc,	%f30,	%f29
	stw	%g4,	[%l7 + 0x30]
	st	%f27,	[%l7 + 0x5C]
	orcc	%i2,	0x1B60,	%l6
	ldsb	[%l7 + 0x12],	%g5
	ldstub	[%l7 + 0x23],	%o1
	bleu,a	%icc,	loop_262
	movrgz	%g1,	%l2,	%l4
	ldsw	[%l7 + 0x1C],	%i0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%o5,	[%g0 + 0x20] %asi
loop_262:
	ldd	[%l7 + 0x10],	%f16
	lduh	[%l7 + 0x20],	%i5
	add	%i4,	0x0E34,	%i1
	or	%l1,	0x1ED8,	%o4
	std	%g2,	[%l7 + 0x20]
	stb	%g7,	[%l7 + 0x13]
	ldub	[%l7 + 0x57],	%o7
	edge8n	%i7,	%g3,	%g6
	ldstub	[%l7 + 0x1B],	%o3
	ldsb	[%l7 + 0x41],	%l3
	stx	%l0,	[%l7 + 0x78]
	lduh	[%l7 + 0x74],	%l5
	ldd	[%l7 + 0x58],	%f30
	lduh	[%l7 + 0x30],	%o2
	tvs	%xcc,	0x5
	st	%f6,	[%l7 + 0x78]
	movvc	%xcc,	%o6,	%i3
	sth	%i6,	[%l7 + 0x78]
	rdhpr	%hpstate,	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g4
	taddcc	%l6,	%g5,	%i2
	stw	%g1,	[%l7 + 0x48]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%l2,	[%g0 + 0x30] %asi
	movcs	%xcc,	%l4,	%i0
	fpsub32	%f18,	%f0,	%f18
	ldx	[%l7 + 0x20],	%o5
	ldsh	[%l7 + 0x60],	%o1
	ldsb	[%l7 + 0x55],	%i5
	ldub	[%l7 + 0x75],	%i1
	ldd	[%l7 + 0x10],	%i4
	flush	%l7 + 0x48
	stx	%l1,	[%l7 + 0x08]
	ldd	[%l7 + 0x48],	%g2
	udiv	%g7,	0x15C0,	%o7
	rdhpr	%hpstate,	%i7
	ldd	[%l7 + 0x28],	%f30
	nop
	set	0x0F, %o6
	ldstub	[%l7 + %o6],	%g3
	array32	%g6,	%o4,	%o3
	ldd	[%l7 + 0x08],	%f22
	addc	%l0,	%l5,	%l3
	array32	%o6,	%o2,	%i6
	prefetch	[%l7 + 0x14],	 0x0
	and	%o0,	0x0842,	%i3
	sth	%g4,	[%l7 + 0x64]
	ldstub	[%l7 + 0x30],	%l6
	fmovsneg	%icc,	%f16,	%f19
	st	%f24,	[%l7 + 0x30]
	te	%icc,	0x7
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g5
	ldub	[%l7 + 0x63],	%g1
	ldsh	[%l7 + 0x42],	%i2
	swap	[%l7 + 0x58],	%l4
	tn	%icc,	0x2
	std	%f22,	[%l7 + 0x60]
	srlx	%l2,	%o5,	%i0
	ld	[%l7 + 0x60],	%f31
	stb	%o1,	[%l7 + 0x18]
	stx	%i5,	[%l7 + 0x08]
	st	%f27,	[%l7 + 0x60]
	stbar
	st	%f2,	[%l7 + 0x3C]
	ldstub	[%l7 + 0x51],	%i1
	ldsb	[%l7 + 0x66],	%i4
	bvs	loop_263
	ldsb	[%l7 + 0x26],	%g2
	andcc	%l1,	%g7,	%i7
	sth	%o7,	[%l7 + 0x22]
loop_263:
	subcc	%g6,	0x0123,	%g3
	ldsb	[%l7 + 0x58],	%o3
	fbne	%fcc2,	loop_264
	stx	%l0,	[%l7 + 0x50]
	flush	%l7 + 0x08
	ldx	[%l7 + 0x78],	%o4
loop_264:
	ldstub	[%l7 + 0x6D],	%l5
	ldsh	[%l7 + 0x4E],	%o6
	stbar
	ld	[%l7 + 0x44],	%f29
	std	%f8,	[%l7 + 0x60]
	array8	%o2,	%i6,	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l3
	movrgez	%g4,	0x139,	%i3
	flush	%l7 + 0x40
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %o3
	stxa	%g5,	[%g0 + %o3] 0x20
	stbar
	stw	%l6,	[%l7 + 0x74]
	swap	[%l7 + 0x70],	%g1
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%i2
	ldub	[%l7 + 0x2C],	%l4
	lduh	[%l7 + 0x74],	%o5
	ld	[%l7 + 0x34],	%f4
	bn,a,pt	%icc,	loop_265
	rdpr	%tl,	%l2
	ldsw	[%l7 + 0x14],	%i0
	rdpr	%otherwin,	%i5
loop_265:
	ldsw	[%l7 + 0x44],	%o1
	flush	%l7 + 0x18
	ldub	[%l7 + 0x4E],	%i1
	ldx	[%l7 + 0x28],	%g2

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x982, 	%hsys_tick_cmpr
	sth	%g7,	[%l7 + 0x6A]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i7
	bg,pt	%icc,	loop_266
	tpos	%xcc,	0x7
	taddcc	%o7,	0x0A82,	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x180, 	%hsys_tick_cmpr
loop_266:
	ldstub	[%l7 + 0x59],	%g3
	std	%f0,	[%l7 + 0x40]
	addcc	%l0,	%l5,	%o4
	stx	%o6,	[%l7 + 0x70]
	nop
	set	0x78, %o1
	std	%o2,	[%l7 + %o1]
	prefetch	[%l7 + 0x1C],	 0x0
	ldsh	[%l7 + 0x30],	%o0
	std	%i6,	[%l7 + 0x50]
	rd	%fprs,	%g4
	nop
	set	0x0C, %l6
	ldsw	[%l7 + %l6],	%l3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %o4
	ldxa	[%g0 + %o4] 0x4f,	%i3
	ldd	[%l7 + 0x20],	%f30
	std	%g4,	[%l7 + 0x20]
	ldsh	[%l7 + 0x68],	%g1
	swap	[%l7 + 0x64],	%i2
	wrpr	%l4,	0x0DEA,	%cwp
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l6
	swap	[%l7 + 0x74],	%o5
	sth	%l2,	[%l7 + 0x7E]
	fmovdneg	%xcc,	%f5,	%f6
	sll	%i0,	%i5,	%i1
	lduw	[%l7 + 0x18],	%o1
	nop
	set	0x36, %g3
	sth	%g2,	[%l7 + %g3]
	stx	%i4,	[%l7 + 0x40]
	wrpr	%l1,	0x0CC5,	%pil
	ldsb	[%l7 + 0x7F],	%i7
	ldsw	[%l7 + 0x7C],	%g7
	fmovde	%xcc,	%f15,	%f25
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i2
	stxa	%o7,	[%g0 + %i2] 0x4f
	ldsh	[%l7 + 0x4A],	%g6
	sth	%o3,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%l0,	[%g0 + 0x8] %asi
	movcc	%icc,	%g3,	%o4
	flush	%l7 + 0x74
	ldsb	[%l7 + 0x24],	%l5
	stx	%o6,	[%l7 + 0x20]
	st	%f4,	[%l7 + 0x2C]
	prefetch	[%l7 + 0x08],	 0x1
	edge32ln	%o0,	%o2,	%g4
	ldd	[%l7 + 0x60],	%f12
	stw	%i6,	[%l7 + 0x64]
	ldstub	[%l7 + 0x2A],	%l3
	sll	%g5,	%g1,	%i2
	flush	%l7 + 0x30
	fnot2	%f0,	%f8
	edge16n	%i3,	%l6,	%o5
	movre	%l4,	0x371,	%l2
	ldstub	[%l7 + 0x38],	%i0
	wrpr	%i5,	0x03CA,	%pil
	be,a	%xcc,	loop_267
	movn	%icc,	%o1,	%i1
	flush	%l7 + 0x28
	ldd	[%l7 + 0x40],	%i4
loop_267:
	st	%f4,	[%l7 + 0x1C]
	prefetch	[%l7 + 0x64],	 0x1
	lduh	[%l7 + 0x5C],	%l1
	sdiv	%i7,	0x016D,	%g7
	bg,a,pt	%xcc,	loop_268
	stx	%o7,	[%l7 + 0x08]
	tsubcc	%g6,	%g2,	%o3
	ldstub	[%l7 + 0x5C],	%l0
loop_268:
	ld	[%l7 + 0x48],	%f26
	swap	[%l7 + 0x2C],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g3
	lduw	[%l7 + 0x0C],	%l5
	fmovrslez	%o0,	%f25,	%f6
	std	%o2,	[%l7 + 0x48]
	stb	%o6,	[%l7 + 0x47]
	ta	%icc,	0x3
	std	%i6,	[%l7 + 0x38]
	ldd	[%l7 + 0x48],	%f18
	std	%f2,	[%l7 + 0x08]
	nop
	set	0x70, %l3
	stb	%l3,	[%l7 + %l3]
	prefetch	[%l7 + 0x1C],	 0x0
	ldsb	[%l7 + 0x18],	%g5
	lduw	[%l7 + 0x2C],	%g1
	flush	%l7 + 0x20
	umulcc	%g4,	%i2,	%l6
	prefetch	[%l7 + 0x44],	 0x1
	fmovrdlez	%i3,	%f0,	%f2
	flush	%l7 + 0x38
	ldstub	[%l7 + 0x26],	%o5
	lduh	[%l7 + 0x54],	%l4
	ldsb	[%l7 + 0x5C],	%i0
	ldd	[%l7 + 0x78],	%i4
	swap	[%l7 + 0x54],	%l2
	stb	%i1,	[%l7 + 0x5D]
	std	%o0,	[%l7 + 0x18]
	flush	%l7 + 0x10
	lduw	[%l7 + 0x20],	%i4
	rdhpr	%hpstate,	%i7
	ldd	[%l7 + 0x40],	%g6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	stxa	%g2,	[%g0 + 0x8] %asi
	ld	[%l7 + 0x60],	%f6
	stbar
	orcc	%o7,	0x0C2A,	%o3
	nop
	set	0x13, %l5
	ldstub	[%l7 + %l5],	%l0
	stw	%o4,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i7
	ldxa	[%g0 + %i7] 0x4f,	%g3
	std	%l4,	[%l7 + 0x10]
	st	%f15,	[%l7 + 0x10]
	ldx	[%l7 + 0x30],	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %l1
	stxa	%o6,	[%g0 + %l1] 0x20
	sth	%o2,	[%l7 + 0x40]
	stx	%l3,	[%l7 + 0x48]
	ta	%xcc,	0x2
	udivcc	%i6,	0x1D88,	%g1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g1
	stxa	%g4,	[%g0 + %g1] 0x4f
	ldsw	[%l7 + 0x2C],	%g5
	ldx	[%l7 + 0x68],	%i2
	ldstub	[%l7 + 0x6C],	%l6
	srlx	%o5,	0x09,	%i3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %g2
	stxa	%l4,	[%g0 + %g2] 0x4f
	ld	[%l7 + 0x1C],	%f12
	st	%f6,	[%l7 + 0x28]
	lduh	[%l7 + 0x24],	%i0
	ldstub	[%l7 + 0x51],	%l2
	bge,a	loop_269
	swap	[%l7 + 0x10],	%i1
	ldsh	[%l7 + 0x68],	%o1
	stb	%i4,	[%l7 + 0x7F]
loop_269:
	lduw	[%l7 + 0x14],	%i7
	movpos	%xcc,	%i5,	%g7
	std	%g6,	[%l7 + 0x68]
	ldsb	[%l7 + 0x52],	%l1
	fmovdcs	%icc,	%f30,	%f10
	rd	%softint,	%g2
	fcmpeq32	%f20,	%f24,	%o3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%l0,	[%g0 + 0x18] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %i3
	ldxa	[%g0 + %i3] 0x4f,	%o4
	ldub	[%l7 + 0x53],	%g3
	ldub	[%l7 + 0x0E],	%l5
	bcs	loop_270
	stx	%o7,	[%l7 + 0x08]
	ldstub	[%l7 + 0x64],	%o0
	st	%f25,	[%l7 + 0x0C]
loop_270:
	flush	%l7 + 0x78
	ldsh	[%l7 + 0x28],	%o2
	stb	%l3,	[%l7 + 0x16]
	nop
	setx	loop_271,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32l	%o6,	%g1,	%i6
	stb	%g4,	[%l7 + 0x0C]
	stx	%i2,	[%l7 + 0x30]
loop_271:
	ldd	[%l7 + 0x48],	%i6
	ldd	[%l7 + 0x08],	%f8
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %l2
	ldxa	[%g0 + %l2] 0x20,	%g5
	sth	%i3,	[%l7 + 0x6C]
	wrpr	%l4,	%i0,	%cwp
	ldsb	[%l7 + 0x0C],	%o5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%l2,	[%g0 + 0x8] %asi
	stb	%o1,	[%l7 + 0x2D]
	stbar
	fmovdn	%xcc,	%f0,	%f7
	std	%f26,	[%l7 + 0x08]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%i0
	add	%i7,	0x09D1,	%i5
	stx	%i4,	[%l7 + 0x10]
	st	%f25,	[%l7 + 0x28]
	stb	%g7,	[%l7 + 0x77]
	stb	%g6,	[%l7 + 0x0F]
	flush	%l7 + 0x74
	ldstub	[%l7 + 0x1B],	%g2
	tge	%xcc,	0x2
	ldsw	[%l7 + 0x64],	%o3
	ld	[%l7 + 0x20],	%f27
	ldd	[%l7 + 0x28],	%f30
	ldsb	[%l7 + 0x23],	%l0
	tpos	%icc,	0x0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i6
	ldxa	[%g0 + %i6] 0x20,	%l1
	fble	%fcc3,	loop_272
	stx	%o4,	[%l7 + 0x40]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %l4
	ldxa	[%g0 + %l4] 0x4f,	%l5
loop_272:
	ldx	[%l7 + 0x60],	%g3
	ldd	[%l7 + 0x10],	%f14
	fmovdneg	%icc,	%f30,	%f5
	ldub	[%l7 + 0x53],	%o0
	std	%f14,	[%l7 + 0x40]
	prefetch	[%l7 + 0x28],	 0x3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o2
	ldsh	[%l7 + 0x22],	%l3
	orcc	%o6,	0x1F71,	%o7
	ldd	[%l7 + 0x10],	%f8
	stbar
	ldstub	[%l7 + 0x38],	%g1
	ldd	[%l7 + 0x60],	%f2
	ld	[%l7 + 0x6C],	%f30
	ldstub	[%l7 + 0x58],	%i6
	stx	%i2,	[%l7 + 0x30]
	movvc	%icc,	%l6,	%g4
	ldub	[%l7 + 0x29],	%g5
	ldsw	[%l7 + 0x3C],	%i3
	stw	%l4,	[%l7 + 0x38]
	ldx	[%l7 + 0x78],	%o5
	ldub	[%l7 + 0x51],	%l2
	ldd	[%l7 + 0x68],	%f24
	ldd	[%l7 + 0x68],	%f14
	ld	[%l7 + 0x0C],	%f22
	ldub	[%l7 + 0x60],	%o1
	ldub	[%l7 + 0x3D],	%i0
	stw	%i7,	[%l7 + 0x1C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i5
	stb	%i1,	[%l7 + 0x25]
	fones	%f17
	ldd	[%l7 + 0x50],	%i4
	swap	[%l7 + 0x14],	%g7
	stb	%g2,	[%l7 + 0x6F]
	ldx	[%l7 + 0x20],	%o3
	ldd	[%l7 + 0x78],	%f4
	addc	%g6,	0x0CE8,	%l0
	ldd	[%l7 + 0x18],	%l0
	fmovrse	%o4,	%f18,	%f16
	ldsh	[%l7 + 0x7E],	%l5
	nop
	set	0x6C, %o2
	ldub	[%l7 + %o2],	%o0
	swap	[%l7 + 0x78],	%g3
	fbe	%fcc2,	loop_273
	ldd	[%l7 + 0x58],	%f6
	bcc	%icc,	loop_274
	ldd	[%l7 + 0x38],	%l2
loop_273:
	ldsw	[%l7 + 0x64],	%o6
	fbg	%fcc3,	loop_275
loop_274:
	flush	%l7 + 0x38
	ldd	[%l7 + 0x18],	%f4
	fbn,a	%fcc1,	loop_276
loop_275:
	brlz,a	%o7,	loop_277
	fornot1s	%f22,	%f22,	%f0
	swap	[%l7 + 0x34],	%g1
loop_276:
	bshuffle	%f0,	%f20,	%f0
loop_277:
	movne	%xcc,	%o2,	%i2
	nop
	set	0x0E, %i5
	ldsh	[%l7 + %i5],	%l6
	alignaddrl	%g4,	%g5,	%i3
	ldstub	[%l7 + 0x43],	%l4
	stb	%i6,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x991, 	%hsys_tick_cmpr
	lduh	[%l7 + 0x38],	%i0
	ldsb	[%l7 + 0x30],	%o1
	flushw
	nop
	set	0x68, %l0
	std	%i4,	[%l7 + %l0]
	ldsb	[%l7 + 0x38],	%i1
	prefetch	[%l7 + 0x14],	 0x2
	fcmpne16	%f28,	%f24,	%i4
	srax	%g7,	0x17,	%i7
	movneg	%icc,	%o3,	%g2
	stx	%l0,	[%l7 + 0x40]
	taddcc	%l1,	0x022C,	%o4
	brnz	%g6,	loop_278
	std	%f12,	[%l7 + 0x38]
	fpmerge	%f1,	%f5,	%f26
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %i1
	stxa	%o0,	[%g0 + %i1] 0x4f
loop_278:
	fcmpgt16	%f26,	%f4,	%l5
	fbn,a	%fcc2,	loop_279
	ldsw	[%l7 + 0x68],	%g3
	swap	[%l7 + 0x78],	%l3
	stx	%o7,	[%l7 + 0x30]
loop_279:
	addcc	%o6,	0x15D1,	%g1
	fnor	%f10,	%f16,	%f4
	fmovsvc	%icc,	%f18,	%f26
	ld	[%l7 + 0x08],	%f25
	prefetch	[%l7 + 0x68],	 0x1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o2
	flush	%l7 + 0x30
	flush	%l7 + 0x48
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i2
	std	%g4,	[%l7 + 0x30]
	flush	%l7 + 0x48
	ld	[%l7 + 0x30],	%f12
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %o5
	stxa	%l6,	[%g0 + %o5] 0x4f
	ldx	[%l7 + 0x20],	%g5
	lduh	[%l7 + 0x5A],	%l4
	lduh	[%l7 + 0x2A],	%i3
	lduh	[%l7 + 0x32],	%i6
	stb	%o5,	[%l7 + 0x7A]
	fcmpne32	%f12,	%f4,	%i0
	ldsb	[%l7 + 0x1A],	%l2
	swap	[%l7 + 0x1C],	%i5
	flush	%l7 + 0x24
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x18] %asi
	ldub	[%l7 + 0x57],	%i1
	flush	%l7 + 0x58
	std	%f10,	[%l7 + 0x58]
	stw	%i4,	[%l7 + 0x78]
	std	%f14,	[%l7 + 0x08]
	fxnor	%f12,	%f2,	%f2
	ldsb	[%l7 + 0x4D],	%g7
	lduw	[%l7 + 0x24],	%i7
	swap	[%l7 + 0x0C],	%o3
	ldsw	[%l7 + 0x28],	%g2
	prefetch	[%l7 + 0x58],	 0x2
	ldub	[%l7 + 0x7E],	%l0
	ldx	[%l7 + 0x28],	%o4
	ldsh	[%l7 + 0x3E],	%l1
	std	%f2,	[%l7 + 0x50]
	stbar
	ldsw	[%l7 + 0x50],	%g6
	lduw	[%l7 + 0x40],	%o0
	movrgez	%g3,	%l5,	%l3
	ldub	[%l7 + 0x09],	%o6
	faligndata	%f18,	%f22,	%f14
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %g6
	ldxa	[%g0 + %g6] 0x4f,	%g1
	taddcctv	%o7,	0x00EA,	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o7
	ldxa	[%g0 + %o7] 0x20,	%g4
	prefetch	[%l7 + 0x40],	 0x1
	st	%f2,	[%l7 + 0x28]
	wrpr	%i2,	0x0935,	%cwp
	movpos	%xcc,	%l6,	%l4
	sth	%i3,	[%l7 + 0x7A]
	rdhpr	%hpstate,	%g5
	sth	%o5,	[%l7 + 0x54]
	subc	%i0,	0x0CA8,	%l2
	flush	%l7 + 0x30
	fmovs	%f18,	%f1
	std	%f20,	[%l7 + 0x68]
	lduh	[%l7 + 0x1E],	%i5
	tsubcctv	%i6,	%o1,	%i1
	stb	%g7,	[%l7 + 0x0C]
	prefetch	[%l7 + 0x24],	 0x0
	lduh	[%l7 + 0x1E],	%i4
	ldsw	[%l7 + 0x58],	%i7
	movrgz	%g2,	%l0,	%o4
	ld	[%l7 + 0x10],	%f5
	stbar
	wrpr	%l1,	0x065E,	%pil
	edge8ln	%o3,	%o0,	%g3
	bpos,a,pt	%icc,	loop_280
	movcs	%xcc,	%l5,	%l3
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f18
	ldub	[%l7 + 0x78],	%o6
loop_280:
	umul	%g1,	0x1832,	%g6
	std	%o2,	[%l7 + 0x48]
	fmul8ulx16	%f22,	%f10,	%f22
	stx	%g4,	[%l7 + 0x18]
	tpos	%xcc,	0x2
	ldsh	[%l7 + 0x66],	%o7
	edge16ln	%i2,	%l4,	%i3
	ldd	[%l7 + 0x38],	%i6
	fornot1s	%f7,	%f12,	%f23
	movge	%icc,	%g5,	%i0
	ld	[%l7 + 0x2C],	%f23
	stbar
	swap	[%l7 + 0x28],	%o5
	std	%l2,	[%l7 + 0x60]
	ldx	[%l7 + 0x78],	%i5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %i4
	stxa	%i1,	[%g0 + %i4] 0x4f
	nop
	set	0x22, %g5
	lduh	[%l7 + %g5],	%g7
	flushw
	prefetch	[%l7 + 0x24],	 0x0
	stx	%i4,	[%l7 + 0x50]
	ld	[%l7 + 0x1C],	%f30
	lduw	[%l7 + 0x58],	%o1
	swap	[%l7 + 0x7C],	%g2
	ldd	[%l7 + 0x18],	%f12
	st	%f19,	[%l7 + 0x7C]
	tsubcctv	%i7,	%l0,	%l1
	stx	%o3,	[%l7 + 0x20]
	stbar
	prefetch	[%l7 + 0x08],	 0x2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %g7
	ldxa	[%g0 + %g7] 0x20,	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o6
	stxa	%o0,	[%g0 + %o6] 0x20
	st	%f9,	[%l7 + 0x50]
	std	%l4,	[%l7 + 0x70]
	sth	%g3,	[%l7 + 0x7E]
	ldd	[%l7 + 0x60],	%f0
	swap	[%l7 + 0x30],	%l3
	nop
	set	0x53, %o3
	ldsb	[%l7 + %o3],	%o6
	ldd	[%l7 + 0x68],	%g6
	fnegd	%f10,	%f26
	nop
	set	0x1B, %i0
	ldub	[%l7 + %i0],	%g1
	subc	%o2,	%o7,	%i2
	movcs	%icc,	%l4,	%g4
	ldd	[%l7 + 0x20],	%f12
	ldstub	[%l7 + 0x12],	%l6
	lduh	[%l7 + 0x70],	%i3
	stbar
	ldstub	[%l7 + 0x70],	%g5
	prefetch	[%l7 + 0x40],	 0x3
	ldd	[%l7 + 0x50],	%i0
	stx	%o5,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%l2,	[%g0 + 0x10] %asi
	stw	%i5,	[%l7 + 0x44]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i6
	flush	%l7 + 0x70
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g7,	[%l7 + 0x14]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %l6
	stxa	%i4,	[%g0 + %l6] 0x4f
	sth	%i1,	[%l7 + 0x24]
	prefetch	[%l7 + 0x60],	 0x2
	ldd	[%l7 + 0x20],	%f30
	stb	%o1,	[%l7 + 0x6F]
	lduh	[%l7 + 0x26],	%i7
	ldx	[%l7 + 0x78],	%g2
	prefetch	[%l7 + 0x78],	 0x1
	std	%l0,	[%l7 + 0x20]
	nop
	set	0x60, %o4
	stx	%o3,	[%l7 + %o4]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %g3
	ldxa	[%g0 + %g3] 0x20,	%l0
	ldsb	[%l7 + 0x40],	%o4
	ldd	[%l7 + 0x70],	%f0
	tcs	%icc,	0x6
	for	%f14,	%f4,	%f16
	flushw
	ldstub	[%l7 + 0x5C],	%o0
	stb	%g3,	[%l7 + 0x7E]
	lduh	[%l7 + 0x48],	%l5
	stb	%l3,	[%l7 + 0x3D]
	sdivcc	%g6,	0x0CFA,	%o6
	nop
	set	0x37, %o1
	ldub	[%l7 + %o1],	%o2
	ldd	[%l7 + 0x08],	%f6
	rdhpr	%htba,	%o7
	ldd	[%l7 + 0x40],	%i2
	nop
	set	0x72, %i2
	ldstub	[%l7 + %i2],	%l4
	fmovsge	%icc,	%f8,	%f3
	ldub	[%l7 + 0x7F],	%g1
	ldsh	[%l7 + 0x3E],	%l6
	nop
	set	0x72, %l5
	lduh	[%l7 + %l5],	%g4
	fpack16	%f2,	%f2
	stb	%g5,	[%l7 + 0x4B]
	std	%i2,	[%l7 + 0x60]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%o5,	[%g0 + 0x38] %asi
	ldstub	[%l7 + 0x2A],	%l2
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f4
	ldd	[%l7 + 0x10],	%f24
	ld	[%l7 + 0x44],	%f4
	ld	[%l7 + 0x54],	%f1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%i5,	[%g0 + 0x0] %asi
	tsubcc	%i6,	%i0,	%i4
	stx	%g7,	[%l7 + 0x60]
	bn,pt	%icc,	loop_281
	ldd	[%l7 + 0x68],	%f24
	orn	%o1,	%i1,	%g2
	lduh	[%l7 + 0x26],	%l1
loop_281:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i7
	std	%o2,	[%l7 + 0x08]
	edge16n	%l0,	%o4,	%o0
	ldx	[%l7 + 0x58],	%g3
	nop
	set	0x68, %l1
	std	%f6,	[%l7 + %l1]
	ldub	[%l7 + 0x6C],	%l5
	ldsh	[%l7 + 0x0E],	%g6
	stbar
	ldsb	[%l7 + 0x2A],	%l3
	swap	[%l7 + 0x58],	%o6
	movre	%o7,	0x282,	%o2
	fmovsge	%icc,	%f4,	%f2
	movneg	%icc,	%i2,	%l4
	fmovdn	%xcc,	%f9,	%f28
	movg	%icc,	%l6,	%g1
	lduw	[%l7 + 0x30],	%g5
	tcc	%xcc,	0x2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	stxa	%i3,	[%g0 + 0x0] %asi
	ldstub	[%l7 + 0x2E],	%g4
	prefetch	[%l7 + 0x20],	 0x0
	umul	%o5,	0x1FBD,	%l2
	lduh	[%l7 + 0x50],	%i5
	rd	%softint,	%i0
	nop
	set	0x14, %l3
	stw	%i6,	[%l7 + %l3]
	lduh	[%l7 + 0x2A],	%g7
	ldx	[%l7 + 0x70],	%o1
	flushw
	ldx	[%l7 + 0x68],	%i1
	edge32n	%g2,	%i4,	%i7
	ldd	[%l7 + 0x20],	%f8
	rd	%pc,	%l1
	rdhpr	%hsys_tick_cmpr,	%l0
	stx	%o4,	[%l7 + 0x70]
	wr	%o0,	0x029B,	%sys_tick
	movneg	%xcc,	%o3,	%l5
	wrpr	%g6,	0x1C91,	%cwp
	udivcc	%g3,	0x04E5,	%o6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %g2
	stxa	%o7,	[%g0 + %g2] 0x20
	taddcc	%o2,	%i2,	%l3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %g1
	stxa	%l4,	[%g0 + %g1] 0x20
	ldd	[%l7 + 0x78],	%g0
	ldx	[%l7 + 0x18],	%g5
	stb	%i3,	[%l7 + 0x7A]
	ld	[%l7 + 0x58],	%f27
	prefetch	[%l7 + 0x1C],	 0x3
	stbar
	sth	%l6,	[%l7 + 0x32]
	swap	[%l7 + 0x70],	%o5
	subc	%l2,	0x1E39,	%g4
	movvc	%icc,	%i0,	%i5
	lduw	[%l7 + 0x2C],	%g7
	lduh	[%l7 + 0x62],	%o1
	bvc,a,pn	%icc,	loop_282
	fbu	%fcc0,	loop_283
	sth	%i1,	[%l7 + 0x4E]
	ldd	[%l7 + 0x28],	%i6
loop_282:
	stbar
loop_283:
	tcc	%icc,	0x1
	prefetch	[%l7 + 0x3C],	 0x0
	nop
	set	0x60, %l2
	stx	%i4,	[%l7 + %l2]
	addc	%i7,	0x03D2,	%l1
	movle	%icc,	%g2,	%l0
	fsrc1	%f6,	%f22
	flush	%l7 + 0x40
	tle	%icc,	0x0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %i3
	ldxa	[%g0 + %i3] 0x20,	%o4
	ldd	[%l7 + 0x58],	%o2
	nop
	set	0x70, %i6
	sth	%l5,	[%l7 + %i6]
	st	%f21,	[%l7 + 0x4C]
	array8	%o0,	%g3,	%o6
	ldd	[%l7 + 0x48],	%f18
	fpmerge	%f6,	%f2,	%f8
	flush	%l7 + 0x60
	ldd	[%l7 + 0x58],	%g6
	std	%o6,	[%l7 + 0x20]
	lduh	[%l7 + 0x76],	%i2
	srl	%o2,	%l3,	%g1
	nop
	set	0x7C, %o0
	stw	%l4,	[%l7 + %o0]
	prefetch	[%l7 + 0x54],	 0x2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %l4
	ldxa	[%g0 + %l4] 0x20,	%g5
	stb	%l6,	[%l7 + 0x3A]
	ldd	[%l7 + 0x78],	%f18
	prefetch	[%l7 + 0x6C],	 0x3
	swap	[%l7 + 0x0C],	%i3
	xnorcc	%l2,	%g4,	%i0
	std	%o4,	[%l7 + 0x18]
	sth	%i5,	[%l7 + 0x3E]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%o1
	stx	%g7,	[%l7 + 0x60]
	taddcc	%i1,	%i4,	%i7
	ldstub	[%l7 + 0x7D],	%i6
	std	%f8,	[%l7 + 0x58]
	ldx	[%l7 + 0x50],	%l1
	brnz	%g2,	loop_284
	std	%f12,	[%l7 + 0x30]
	prefetch	[%l7 + 0x0C],	 0x1
	sth	%l0,	[%l7 + 0x12]
loop_284:
	flush	%l7 + 0x7C
	tg	%xcc,	0x2
	st	%f25,	[%l7 + 0x60]
	ldsh	[%l7 + 0x2A],	%o3
	lduh	[%l7 + 0x4C],	%l5
	fble	%fcc1,	loop_285
	ld	[%l7 + 0x0C],	%f4
	flush	%l7 + 0x58
	stx	%o0,	[%l7 + 0x18]
loop_285:
	ldstub	[%l7 + 0x0A],	%o4
	lduh	[%l7 + 0x12],	%o6
	ldsb	[%l7 + 0x14],	%g6
	sth	%o7,	[%l7 + 0x64]
	stb	%i2,	[%l7 + 0x4D]
	st	%f8,	[%l7 + 0x20]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %o2
	ldxa	[%g0 + %o2] 0x20,	%g3
	std	%l2,	[%l7 + 0x08]
	nop
	set	0x08, %i5
	lduh	[%l7 + %i5],	%g1
	stw	%l4,	[%l7 + 0x6C]
	smul	%g5,	%l6,	%i3
	lduh	[%l7 + 0x26],	%o2
	ldsw	[%l7 + 0x7C],	%g4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i0
	sth	%l2,	[%l7 + 0x4E]
	lduh	[%l7 + 0x2A],	%i5
	ldsb	[%l7 + 0x26],	%o5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	wr	%g0,	0x20,	%asi
	stxa	%o1,	[%g0 + 0x0] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	stxa	%g7,	[%g0 + 0x30] %asi
	ld	[%l7 + 0x08],	%f24
	stx	%i1,	[%l7 + 0x38]
	stbar
	sth	%i7,	[%l7 + 0x64]
	ldsw	[%l7 + 0x20],	%i6
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%i4
	std	%f14,	[%l7 + 0x18]
	ldd	[%l7 + 0x08],	%l0
	ld	[%l7 + 0x58],	%f3
	ldsh	[%l7 + 0x54],	%l0
	stb	%g2,	[%l7 + 0x60]
	stb	%o3,	[%l7 + 0x2A]
	sth	%o0,	[%l7 + 0x6A]
	ldub	[%l7 + 0x19],	%l5
	stb	%o4,	[%l7 + 0x39]
	bcs,a	loop_286
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 0x0
	movle	%xcc,	%g6,	%o6
	tvs	%xcc,	0x7
loop_286:
	lduw	[%l7 + 0x78],	%i2
	stw	%o7,	[%l7 + 0x40]
	stbar
	ldstub	[%l7 + 0x6F],	%g3
	ldsw	[%l7 + 0x18],	%l3
	fmovdn	%icc,	%f26,	%f29
	std	%g0,	[%l7 + 0x28]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g6
	stxa	%g5,	[%g0 + %g6] 0x20
	ld	[%l7 + 0x50],	%f10
	sth	%l6,	[%l7 + 0x0C]
	ldub	[%l7 + 0x1A],	%i3
	ldd	[%l7 + 0x60],	%f4
	fsrc2s	%f21,	%f25
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %o7
	stxa	%o2,	[%g0 + %o7] 0x20
	ldx	[%l7 + 0x38],	%g4
	ld	[%l7 + 0x54],	%f25
	lduh	[%l7 + 0x2E],	%i0
	ldsw	[%l7 + 0x48],	%l2
	prefetch	[%l7 + 0x64],	 0x1
	subcc	%l4,	0x05F9,	%o5
	nop
	set	0x56, %l0
	sth	%o1,	[%l7 + %l0]
	ldx	[%l7 + 0x78],	%g7
	nop
	set	0x24, %i4
	ldsw	[%l7 + %i4],	%i5
	lduh	[%l7 + 0x6C],	%i7
	addc	%i6,	0x0CD2,	%i1
	stx	%i4,	[%l7 + 0x40]
	swap	[%l7 + 0x68],	%l1
	flush	%l7 + 0x54
	std	%f28,	[%l7 + 0x70]
	nop
	set	0x68, %g5
	stx	%g2,	[%l7 + %g5]
	flushw
	lduh	[%l7 + 0x0A],	%l0
	flush	%l7 + 0x58
	te	%icc,	0x7
	lduh	[%l7 + 0x56],	%o0
	movn	%xcc,	%o3,	%o4
	nop
	set	0x38, %g4
	ldub	[%l7 + %g4],	%g6
	orn	%o6,	%l5,	%i2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g3
	fnands	%f8,	%f25,	%f16
	tgu	%icc,	0x4
	movpos	%xcc,	%o7,	%g1
	ldd	[%l7 + 0x50],	%f12
	stx	%g5,	[%l7 + 0x50]
	nop
	set	0x48, %g7
	std	%i6,	[%l7 + %g7]
	ldd	[%l7 + 0x70],	%i2
	stx	%l3,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g4
	movrgez	%o2,	%l2,	%i0
	fmovsne	%icc,	%f31,	%f28
	prefetch	[%l7 + 0x58],	 0x2
	ldsb	[%l7 + 0x76],	%l4
	ld	[%l7 + 0x64],	%f31
	std	%o4,	[%l7 + 0x18]
	sth	%o1,	[%l7 + 0x52]
	mulscc	%i5,	%g7,	%i6
	taddcctv	%i1,	%i4,	%i7
	umulcc	%l1,	0x1E4F,	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stw	%o3,	[%l7 + 0x0C]
	ld	[%l7 + 0x38],	%f28
	ldx	[%l7 + 0x08],	%o4
	rdhpr	%htba,	%g6
	lduh	[%l7 + 0x18],	%g2
	ldsw	[%l7 + 0x18],	%l5
	fnot2s	%f2,	%f19
	lduw	[%l7 + 0x74],	%o6
	ldd	[%l7 + 0x40],	%f2
	flush	%l7 + 0x30
	movre	%i2,	0x0E5,	%o7
	stw	%g1,	[%l7 + 0x40]
	ldd	[%l7 + 0x40],	%f28
	movrlez	%g5,	0x265,	%l6
	lduh	[%l7 + 0x6A],	%i3
	prefetch	[%l7 + 0x6C],	 0x2
	orncc	%g3,	0x06C5,	%l3
	umulcc	%o2,	%l2,	%g4
	st	%f12,	[%l7 + 0x10]
	subccc	%l4,	0x14CE,	%o5
	ldub	[%l7 + 0x3F],	%i0
	st	%f13,	[%l7 + 0x6C]
	wrpr	%i5,	0x13C3,	%cwp
	stb	%g7,	[%l7 + 0x2F]
	ldd	[%l7 + 0x38],	%o0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i1
	array32	%i4,	%i7,	%i6
	stx	%l0,	[%l7 + 0x10]
	ldsh	[%l7 + 0x4A],	%o0
	ld	[%l7 + 0x34],	%f28
	ld	[%l7 + 0x54],	%f15
	nop
	set	0x78, %o3
	lduw	[%l7 + %o3],	%l1
	bge,pt	%icc,	loop_287
	prefetch	[%l7 + 0x0C],	 0x3
	popc	0x06E7,	%o4
	bgu,pn	%xcc,	loop_288
loop_287:
	fandnot2s	%f3,	%f22,	%f22
	st	%f4,	[%l7 + 0x74]
	stx	%g6,	[%l7 + 0x18]
loop_288:
	rd	%softint,	%g2
	fmovsge	%icc,	%f27,	%f28
	prefetch	[%l7 + 0x74],	 0x1
	edge32ln	%l5,	%o6,	%o3
	std	%f26,	[%l7 + 0x08]
	ldsw	[%l7 + 0x0C],	%i2
	ldsb	[%l7 + 0x71],	%o7
	ldx	[%l7 + 0x60],	%g1
	taddcc	%l6,	%i3,	%g5
	lduh	[%l7 + 0x2C],	%l3
	movpos	%icc,	%g3,	%l2
	bne,a,pn	%icc,	loop_289
	nop
	set	0x4C, %o6
	stw	%g4,	[%l7 + %o6]
	stw	%o2,	[%l7 + 0x5C]
	st	%f19,	[%l7 + 0x24]
loop_289:
	fpadd16	%f20,	%f22,	%f12
	wr	%l4,	0x07ED,	%clear_softint
	lduh	[%l7 + 0x08],	%i0
	ldsw	[%l7 + 0x28],	%i5
	tcc	%xcc,	0x3
	flush	%l7 + 0x50
	andcc	%g7,	0x04FA,	%o1
	ldd	[%l7 + 0x50],	%f18
	swap	[%l7 + 0x60],	%o5
	ldx	[%l7 + 0x68],	%i4
	ldd	[%l7 + 0x50],	%i0
	lduh	[%l7 + 0x66],	%i6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %i0
	stxa	%i7,	[%g0 + %i0] 0x4f
	edge8n	%l0,	%l1,	%o4
	ldx	[%l7 + 0x18],	%o0
	swap	[%l7 + 0x50],	%g2
	ldsb	[%l7 + 0x5B],	%g6
	lduh	[%l7 + 0x24],	%o6
	movrgez	%l5,	%i2,	%o3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g1
	std	%i6,	[%l7 + 0x28]
	ldstub	[%l7 + 0x43],	%o7
	ldx	[%l7 + 0x10],	%g5
	sth	%l3,	[%l7 + 0x70]
	bgu,pt	%xcc,	loop_290
	st	%f20,	[%l7 + 0x1C]
	stx	%g3,	[%l7 + 0x68]
	ldsb	[%l7 + 0x0C],	%i3
loop_290:
	rdpr	%otherwin,	%g4
	fmovsa	%xcc,	%f8,	%f29
	ldsh	[%l7 + 0x4A],	%o2
	mulscc	%l2,	0x0C53,	%i0
	swap	[%l7 + 0x78],	%i5
	fmovdne	%icc,	%f2,	%f26
	stw	%g7,	[%l7 + 0x44]
	edge16	%l4,	%o1,	%i4
	tg	%icc,	0x1
	lduw	[%l7 + 0x40],	%o5
	prefetch	[%l7 + 0x78],	 0x1
	ldub	[%l7 + 0x7B],	%i1
	flush	%l7 + 0x4C
	st	%f3,	[%l7 + 0x3C]
	fcmpeq32	%f0,	%f14,	%i7
	ldd	[%l7 + 0x78],	%i6
	move	%xcc,	%l1,	%l0
	lduh	[%l7 + 0x24],	%o4
	flush	%l7 + 0x18
	sth	%g2,	[%l7 + 0x50]
	ldd	[%l7 + 0x10],	%f28
	fmovrdne	%o0,	%f28,	%f2
	ldub	[%l7 + 0x79],	%o6
	std	%f24,	[%l7 + 0x58]
	ldsb	[%l7 + 0x2F],	%g6
	stbar
	wr	%i2,	%l5,	%softint
	ldd	[%l7 + 0x48],	%f4
	srl	%o3,	%g1,	%o7
	tle	%icc,	0x5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l6
	stxa	%l6,	[%g0 + %l6] 0x4f
	subcc	%g5,	0x0CAA,	%l3
	fcmpeq16	%f16,	%f10,	%g3
	ldd	[%l7 + 0x30],	%i2
	xor	%o2,	%g4,	%l2
	ldd	[%l7 + 0x08],	%f16
	stbar
	ldub	[%l7 + 0x34],	%i5
	ldstub	[%l7 + 0x6B],	%i0
	ldx	[%l7 + 0x68],	%l4
	ldsb	[%l7 + 0x5F],	%o1
	ldd	[%l7 + 0x58],	%g6
	st	%f14,	[%l7 + 0x74]
	ldd	[%l7 + 0x38],	%o4
	stb	%i4,	[%l7 + 0x4A]
	std	%i0,	[%l7 + 0x10]
	ldx	[%l7 + 0x08],	%i6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %o4
	stxa	%i7,	[%g0 + %o4] 0x4f
	movleu	%xcc,	%l1,	%l0
	lduh	[%l7 + 0x28],	%g2
	tpos	%icc,	0x5
	ldsw	[%l7 + 0x40],	%o4
	fmovscc	%xcc,	%f1,	%f7
	fsrc2	%f6,	%f4
	fxors	%f2,	%f29,	%f5
	swap	[%l7 + 0x14],	%o6
	flush	%l7 + 0x18
	rd	%y,	%g6
	std	%f28,	[%l7 + 0x48]
	stx	%o0,	[%l7 + 0x70]
	std	%f18,	[%l7 + 0x18]
	sth	%i2,	[%l7 + 0x68]
	fones	%f4
	ldsw	[%l7 + 0x28],	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	stxa	%g1,	[%g0 + 0x10] %asi
	ldsw	[%l7 + 0x08],	%o3
	stbar
	stw	%l6,	[%l7 + 0x50]
	stb	%o7,	[%l7 + 0x26]
	stw	%l3,	[%l7 + 0x4C]
	rdpr	%canrestore,	%g5
	umulcc	%i3,	%g3,	%g4
	udiv	%o2,	0x1557,	%l2
	st	%f27,	[%l7 + 0x38]
	stb	%i0,	[%l7 + 0x5A]
	tsubcc	%l4,	0x1048,	%i5
	ldd	[%l7 + 0x08],	%g6
	ld	[%l7 + 0x64],	%f30
	stb	%o1,	[%l7 + 0x2E]
	addccc	%o5,	0x1B89,	%i1
	stw	%i4,	[%l7 + 0x30]
	ldstub	[%l7 + 0x4A],	%i7
	or	%l1,	%l0,	%i6
	stw	%o4,	[%l7 + 0x5C]
	alignaddr	%o6,	%g6,	%g2
	ld	[%l7 + 0x60],	%f17
	ba,a	%icc,	loop_291
	wrpr	%o0,	%l5,	%pil
	swap	[%l7 + 0x5C],	%i2
	ldsb	[%l7 + 0x69],	%g1
loop_291:
	ldsb	[%l7 + 0x64],	%l6
	movgu	%icc,	%o7,	%o3
	nop
	set	0x24, %g3
	stw	%g5,	[%l7 + %g3]
	ldd	[%l7 + 0x18],	%i2
	tge	%xcc,	0x2
	edge32ln	%g3,	%g4,	%o2
	ld	[%l7 + 0x6C],	%f17
	stb	%l2,	[%l7 + 0x46]
	prefetch	[%l7 + 0x5C],	 0x3
	ld	[%l7 + 0x70],	%f25
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %o1
	ldxa	[%g0 + %o1] 0x20,	%l3
	prefetch	[%l7 + 0x74],	 0x0
	movrne	%i0,	%i5,	%l4
	ldub	[%l7 + 0x41],	%g7
	ldsh	[%l7 + 0x60],	%o5
	sth	%i1,	[%l7 + 0x4E]
	stx	%o1,	[%l7 + 0x78]
	nop
	set	0x6E, %i2
	sth	%i4,	[%l7 + %i2]
	movneg	%xcc,	%l1,	%l0
	ldd	[%l7 + 0x20],	%f24
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %l5
	ldxa	[%g0 + %l5] 0x4f,	%i7
	ldd	[%l7 + 0x10],	%o4
	swap	[%l7 + 0x34],	%o6
	ldsw	[%l7 + 0x7C],	%g6
	ldstub	[%l7 + 0x7D],	%g2
	flush	%l7 + 0x0C
	swap	[%l7 + 0x40],	%o0
	udivcc	%i6,	0x1C90,	%i2
	tl	%xcc,	0x7
	std	%l4,	[%l7 + 0x50]
	movleu	%icc,	%l6,	%o7
	ldx	[%l7 + 0x38],	%o3
	prefetch	[%l7 + 0x14],	 0x1
	ldsb	[%l7 + 0x6A],	%g5
	swap	[%l7 + 0x70],	%g1
	ldd	[%l7 + 0x40],	%f0
	lduh	[%l7 + 0x16],	%g3
	stw	%i3,	[%l7 + 0x40]
	std	%o2,	[%l7 + 0x28]
	rd	%sys_tick_cmpr,	%g4
	fornot2s	%f22,	%f15,	%f11
	flush	%l7 + 0x58
	rd	%pc,	%l3
	stb	%l2,	[%l7 + 0x62]
	ldd	[%l7 + 0x58],	%i0
	prefetch	[%l7 + 0x48],	 0x2
	addc	%i5,	0x132D,	%g7
	ldsw	[%l7 + 0x0C],	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%i0
	rdpr	%gl,	%l4
	stx	%o1,	[%l7 + 0x68]
	movg	%xcc,	%l1,	%i4
	ldsw	[%l7 + 0x7C],	%i7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%l0,	[%g0 + 0x28] %asi
	rdpr	%gl,	%o4
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%o6
	ldd	[%l7 + 0x60],	%f10
	rdpr	%pil,	%g2
	nop
	setx	loop_292,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x08],	%g6
	ld	[%l7 + 0x10],	%f6
	ldd	[%l7 + 0x18],	%o0
loop_292:
	lduh	[%l7 + 0x32],	%i6
	xnorcc	%i2,	0x0081,	%l5
	st	%f0,	[%l7 + 0x30]
	bvs,pn	%xcc,	loop_293
	stw	%l6,	[%l7 + 0x48]
	nop
	set	0x50, %g2
	lduw	[%l7 + %g2],	%o3
	ld	[%l7 + 0x7C],	%f1
loop_293:
	lduh	[%l7 + 0x68],	%o7
	nop
	set	0x38, %g1
	std	%g0,	[%l7 + %g1]
	stb	%g3,	[%l7 + 0x10]
	ldx	[%l7 + 0x48],	%g5
	ldsh	[%l7 + 0x54],	%i3
	lduh	[%l7 + 0x4E],	%g4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o2
	edge8	%l2,	%i0,	%i5
	stb	%g7,	[%l7 + 0x23]
	rdpr	%tba,	%l3
	swap	[%l7 + 0x40],	%i1
	ldsb	[%l7 + 0x1C],	%o5
	ldsh	[%l7 + 0x18],	%o1
	stb	%l4,	[%l7 + 0x22]
	ldub	[%l7 + 0x77],	%l1
	prefetch	[%l7 + 0x2C],	 0x0
	mulscc	%i7,	0x13AA,	%i4
	prefetch	[%l7 + 0x70],	 0x0
	sth	%l0,	[%l7 + 0x62]
	rd	%y,	%o6
	lduw	[%l7 + 0x60],	%o4
	stb	%g6,	[%l7 + 0x1E]
	stb	%g2,	[%l7 + 0x0D]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i6
	sth	%i2,	[%l7 + 0x4C]
	stb	%l5,	[%l7 + 0x2E]
	movpos	%icc,	%o0,	%o3
	tcs	%xcc,	0x7
	ldsb	[%l7 + 0x66],	%o7
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %l1
	ldxa	[%g0 + %l1] 0x4f,	%l6
	wr	%g1,	0x199D,	%sys_tick
	flush	%l7 + 0x18
	std	%g4,	[%l7 + 0x58]
	fnand	%f28,	%f20,	%f4

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4D2, 	%hsys_tick_cmpr
	rdhpr	%htba,	%i3
	lduh	[%l7 + 0x1C],	%l2
	stb	%i0,	[%l7 + 0x54]
	ldub	[%l7 + 0x61],	%o2
	st	%f17,	[%l7 + 0x60]
	ld	[%l7 + 0x1C],	%f12
	edge32n	%g7,	%l3,	%i5
	smul	%o5,	%i1,	%l4
	stbar
	nop
	set	0x40, %l2
	ldstub	[%l7 + %l2],	%l1
	ldub	[%l7 + 0x70],	%o1
	ldsb	[%l7 + 0x2C],	%i7
	andcc	%l0,	0x15FD,	%i4
	tleu	%xcc,	0x5
	std	%f18,	[%l7 + 0x40]
	ldsh	[%l7 + 0x0A],	%o6
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%o4
	swap	[%l7 + 0x68],	%g6
	fnand	%f28,	%f14,	%f10
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %i3
	ldxa	[%g0 + %i3] 0x20,	%g2
	ldstub	[%l7 + 0x51],	%i2
	tcc	%xcc,	0x0
	ldsw	[%l7 + 0x74],	%l5
	ldsb	[%l7 + 0x67],	%i6
	lduw	[%l7 + 0x58],	%o0
	mova	%icc,	%o7,	%l6
	lduh	[%l7 + 0x46],	%o3
	fpadd16s	%f15,	%f31,	%f16
	bne	%icc,	loop_294
	lduw	[%l7 + 0x1C],	%g5
	nop
	set	0x78, %o0
	std	%f12,	[%l7 + %o0]
	ldx	[%l7 + 0x20],	%g3
loop_294:
	ldd	[%l7 + 0x58],	%g0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	stxa	%g4,	[%g0 + 0x20] %asi
	brlez,a	%l2,	loop_295
	fnot1	%f20,	%f22
	fcmple16	%f22,	%f14,	%i3
	swap	[%l7 + 0x4C],	%i0
loop_295:
	prefetch	[%l7 + 0x14],	 0x3
	te	%xcc,	0x0
	std	%f10,	[%l7 + 0x40]
	fmovsne	%icc,	%f23,	%f16
	std	%g6,	[%l7 + 0x50]
	nop
	set	0x20, %l4
	lduw	[%l7 + %l4],	%l3
	fmovsleu	%xcc,	%f2,	%f17
	swap	[%l7 + 0x7C],	%i5
	nop
	set	0x10, %i5
	ldsh	[%l7 + %i5],	%o2
	ldub	[%l7 + 0x46],	%o5
	udivcc	%i1,	0x1BD5,	%l1
	std	%f26,	[%l7 + 0x10]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%o1
	lduw	[%l7 + 0x2C],	%i7
	flush	%l7 + 0x10
	nop
	set	0x31, %o2
	ldsb	[%l7 + %o2],	%l0
	ldx	[%l7 + 0x10],	%l4
	ldsb	[%l7 + 0x19],	%i4
	ldd	[%l7 + 0x38],	%f14
	stx	%o6,	[%l7 + 0x20]
	prefetch	[%l7 + 0x6C],	 0x0
	flush	%l7 + 0x3C
	rdpr	%gl,	%o4
	lduh	[%l7 + 0x0C],	%g6
	addccc	%g2,	0x0876,	%i2
	ldd	[%l7 + 0x20],	%l4
	lduw	[%l7 + 0x1C],	%i6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%o7,	[%g0 + 0x28] %asi
	ld	[%l7 + 0x4C],	%f22
	fcmpd	%fcc1,	%f26,	%f4
	rd	%ccr,	%o0
	lduh	[%l7 + 0x4A],	%l6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g5
	bshuffle	%f26,	%f10,	%f14
	bshuffle	%f14,	%f20,	%f6
	tcc	%xcc,	0x1
	fmovrslz	%o3,	%f14,	%f8
	lduh	[%l7 + 0x6A],	%g1
	lduw	[%l7 + 0x70],	%g4
	ld	[%l7 + 0x60],	%f9
	movcs	%xcc,	%l2,	%i3
	fand	%f2,	%f26,	%f14
	stx	%i0,	[%l7 + 0x60]
	ldd	[%l7 + 0x48],	%g2
	fcmple32	%f2,	%f4,	%l3
	fnot1	%f6,	%f24
	nop
	set	0x54, %i1
	prefetch	[%l7 + %i1],	 0x3
	st	%f2,	[%l7 + 0x38]
	movvs	%icc,	%g7,	%o2
	movrgez	%o5,	0x21D,	%i5
	addc	%i1,	%l1,	%i7
	tl	%icc,	0x4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o5
	ldxa	[%g0 + %o5] 0x20,	%o1
	ldx	[%l7 + 0x50],	%l0
	ldub	[%l7 + 0x0C],	%i4
	lduh	[%l7 + 0x32],	%l4
	ldd	[%l7 + 0x10],	%o6
	fors	%f19,	%f23,	%f19
	ldsh	[%l7 + 0x3C],	%o4
	movne	%icc,	%g6,	%g2
	ldstub	[%l7 + 0x7A],	%i2
	stbar
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i6
	prefetch	[%l7 + 0x34],	 0x0
	tpos	%xcc,	0x4
	nop
	set	0x28, %o7
	ldsh	[%l7 + %o7],	%l5
	tsubcc	%o7,	0x1764,	%l6
	nop
	set	0x42, %l0
	ldstub	[%l7 + %l0],	%o0
	fnand	%f30,	%f16,	%f18
	sth	%o3,	[%l7 + 0x1A]
	membar	0x00
	fmovdvs	%xcc,	%f27,	%f15
	stbar
	movcc	%xcc,	%g1,	%g4
	stb	%l2,	[%l7 + 0x39]
	ldsb	[%l7 + 0x2A],	%i3
	ldub	[%l7 + 0x5B],	%i0
	bgu,pt	%xcc,	loop_296
	fmovrde	%g5,	%f12,	%f22
	fmovrdlz	%l3,	%f20,	%f12
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%g7
loop_296:
	ldstub	[%l7 + 0x1D],	%o2
	nop
	set	0x64, %g5
	sth	%g3,	[%l7 + %g5]
	tpos	%xcc,	0x0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g6
	ldxa	[%g0 + %g6] 0x20,	%o5
	stb	%i1,	[%l7 + 0x62]
	edge16ln	%l1,	%i5,	%i7
	lduh	[%l7 + 0x62],	%l0
	addcc	%i4,	0x18B5,	%o1
	wr	%o6,	0x0319,	%pic
	rdpr	%canrestore,	%o4
	movneg	%icc,	%g6,	%l4
	ldstub	[%l7 + 0x4F],	%i2
	ldx	[%l7 + 0x50],	%g2
	stb	%i6,	[%l7 + 0x1A]
	ldd	[%l7 + 0x08],	%o6
	lduw	[%l7 + 0x58],	%l5
	smul	%o0,	0x196E,	%o3
	ldsb	[%l7 + 0x31],	%l6
	swap	[%l7 + 0x64],	%g4
	lduh	[%l7 + 0x14],	%l2
	brlz,a	%g1,	loop_297
	fbu,a	%fcc0,	loop_298
	ldub	[%l7 + 0x5F],	%i3
	edge16l	%i0,	%g5,	%l3
loop_297:
	nop
	set	0x40, %g7
	ldx	[%l7 + %g7],	%g7
loop_298:
	nop
	set	0x60, %o3
	std	%f28,	[%l7 + %o3]
	tsubcctv	%o2,	0x0C86,	%o5
	stbar
	swap	[%l7 + 0x74],	%g3
	fpsub32	%f26,	%f16,	%f16
	movpos	%xcc,	%l1,	%i1
	fornot1	%f4,	%f4,	%f6
	srl	%i5,	0x09,	%i7
	std	%i4,	[%l7 + 0x50]
	stbar
	std	%o0,	[%l7 + 0x58]
	prefetch	[%l7 + 0x30],	 0x3
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f20
	lduh	[%l7 + 0x70],	%l0
	ldstub	[%l7 + 0x13],	%o6
	ld	[%l7 + 0x20],	%f21
	nop
	set	0x24, %o6
	stw	%g6,	[%l7 + %o6]
	stbar
	fand	%f24,	%f6,	%f4
	taddcctv	%o4,	%l4,	%g2
	nop
	set	0x5E, %l6
	lduh	[%l7 + %l6],	%i6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %i0
	ldxa	[%g0 + %i0] 0x4f,	%i2
	fmul8x16	%f24,	%f28,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o7
	ldsw	[%l7 + 0x28],	%l5
	stw	%o3,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %o4
	ldxa	[%g0 + %o4] 0x20,	%o0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%g4
	ldub	[%l7 + 0x4D],	%l2
	membar	0x41
	ldsb	[%l7 + 0x2B],	%l6
	swap	[%l7 + 0x38],	%g1
	prefetch	[%l7 + 0x10],	 0x1
	ldub	[%l7 + 0x4A],	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x5C],	%f17
	sth	%g5,	[%l7 + 0x4A]
	ldd	[%l7 + 0x78],	%i0
	rdpr	%cwp,	%l3
	udivx	%g7,	0x140F,	%o2
	edge8	%o5,	%l1,	%i1
	ldstub	[%l7 + 0x37],	%g3
	array16	%i5,	%i4,	%i7
	st	%f6,	[%l7 + 0x60]
	nop
	set	0x5C, %i2
	lduw	[%l7 + %i2],	%l0
	stbar
	rdhpr	%hsys_tick_cmpr,	%o1
	wrpr	%o6,	%g6,	%cwp
	lduh	[%l7 + 0x0C],	%o4
	std	%l4,	[%l7 + 0x48]
	ldx	[%l7 + 0x18],	%i6
	sth	%i2,	[%l7 + 0x18]
	swap	[%l7 + 0x70],	%g2
	ldub	[%l7 + 0x3B],	%l5
	tcc	%icc,	0x6
	swap	[%l7 + 0x7C],	%o7
	nop
	set	0x6C, %g3
	stw	%o3,	[%l7 + %g3]
	fcmpgt16	%f18,	%f16,	%o0
	ldd	[%l7 + 0x68],	%f26
	std	%l2,	[%l7 + 0x38]
	ldsw	[%l7 + 0x64],	%g4
	ld	[%l7 + 0x10],	%f20
	movpos	%xcc,	%l6,	%g1
	stb	%g5,	[%l7 + 0x0E]
	rdhpr	%hsys_tick_cmpr,	%i3
	lduw	[%l7 + 0x24],	%l3
	st	%f8,	[%l7 + 0x1C]
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%g7
	movrgez	%i0,	0x205,	%o2
	movcs	%xcc,	%o5,	%l1
	ldstub	[%l7 + 0x6A],	%g3
	ld	[%l7 + 0x6C],	%f6
	sra	%i1,	%i5,	%i7
	orcc	%l0,	0x1539,	%i4
	stbar
	sth	%o1,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %l3
	stxa	%o6,	[%g0 + %l3] 0x20
	tvc	%icc,	0x7
	rdhpr	%htba,	%g6
	faligndata	%f12,	%f0,	%f10
	stbar
	bgu,pt	%icc,	loop_299
	fpsub16s	%f4,	%f14,	%f7
	nop
	set	0x5F, %i7
	stb	%l4,	[%l7 + %i7]
	std	%o4,	[%l7 + 0x58]
loop_299:
	lduh	[%l7 + 0x6A],	%i2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g2
	fpackfix	%f10,	%f0
	st	%f28,	[%l7 + 0x18]
	ldstub	[%l7 + 0x6C],	%l5
	movne	%xcc,	%i6,	%o7
	ldd	[%l7 + 0x48],	%o0
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %g1
	stxa	%l2,	[%g0 + %g1] 0x4f
	ldd	[%l7 + 0x58],	%g4
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%o3,	[%g0 + 0x18] %asi
	std	%i6,	[%l7 + 0x58]
	ldsh	[%l7 + 0x38],	%g1
	ldstub	[%l7 + 0x6A],	%g5
	stx	%l3,	[%l7 + 0x70]
	move	%xcc,	%g7,	%i3
	lduw	[%l7 + 0x68],	%o2
	orcc	%o5,	0x15D0,	%i0
	tleu	%icc,	0x7
	lduh	[%l7 + 0x14],	%l1
	fpsub32	%f28,	%f14,	%f12
	nop
	set	0x38, %l1
	ldsw	[%l7 + %l1],	%g3
	sll	%i1,	0x01,	%i5
	movn	%icc,	%l0,	%i4
	swap	[%l7 + 0x60],	%i7
	ldsw	[%l7 + 0x34],	%o1
	lduw	[%l7 + 0x44],	%g6
	sth	%l4,	[%l7 + 0x26]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %g2
	ldxa	[%g0 + %g2] 0x4f,	%o6
	ld	[%l7 + 0x0C],	%f31
	ldstub	[%l7 + 0x55],	%i2
	ldstub	[%l7 + 0x7E],	%o4
	fcmpne32	%f10,	%f4,	%g2
	wrpr	%i6,	%o7,	%cwp
	stw	%l5,	[%l7 + 0x28]
	std	%f30,	[%l7 + 0x20]
	st	%f27,	[%l7 + 0x4C]
	stb	%l2,	[%l7 + 0x0D]
	std	%g4,	[%l7 + 0x50]
	swap	[%l7 + 0x08],	%o3
	alignaddr	%l6,	%g1,	%g5
	stx	%l3,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	stxa	%g7,	[%g0 + 0x28] %asi
	edge8l	%i3,	%o0,	%o5
	fpsub32	%f26,	%f0,	%f24
	edge16	%o2,	%i0,	%g3
	prefetch	[%l7 + 0x70],	 0x1
	tge	%xcc,	0x6
	ldd	[%l7 + 0x48],	%l0
	nop
	setx loop_300, %l0, %l1
	jmpl %l1, %i1
	ldx	[%l7 + 0x38],	%i5
	lduw	[%l7 + 0x1C],	%i4
	prefetch	[%l7 + 0x54],	 0x1
loop_300:
	swap	[%l7 + 0x28],	%l0
	prefetch	[%l7 + 0x6C],	 0x0
	stw	%i7,	[%l7 + 0x28]
	movn	%xcc,	%g6,	%l4
	stw	%o6,	[%l7 + 0x68]
	stbar
	stbar
	swap	[%l7 + 0x34],	%o1
	ldd	[%l7 + 0x10],	%o4
	stw	%i2,	[%l7 + 0x74]
	ldsw	[%l7 + 0x38],	%g2
	swap	[%l7 + 0x64],	%i6
	fbe,a	%fcc1,	loop_301
	sdiv	%o7,	0x01A8,	%l2
	ldx	[%l7 + 0x38],	%l5
	ldx	[%l7 + 0x78],	%o3
loop_301:
	ldsb	[%l7 + 0x40],	%l6
	stw	%g4,	[%l7 + 0x28]
	ldsw	[%l7 + 0x0C],	%g1
	lduh	[%l7 + 0x08],	%g5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l3
	prefetch	[%l7 + 0x28],	 0x1
	sir	0x1525
	prefetch	[%l7 + 0x38],	 0x1
	stx	%i3,	[%l7 + 0x70]
	sth	%o0,	[%l7 + 0x5A]
	ldsw	[%l7 + 0x30],	%o5
	stx	%g7,	[%l7 + 0x50]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%g3,	[%g0 + 0x38] %asi
	ldsw	[%l7 + 0x78],	%l1
	ldub	[%l7 + 0x5A],	%i0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %l2
	ldxa	[%g0 + %l2] 0x4f,	%i5
	ldd	[%l7 + 0x28],	%f22
	srlx	%i1,	0x0C,	%l0
	stb	%i7,	[%l7 + 0x3F]
	sth	%g6,	[%l7 + 0x74]
	tleu	%xcc,	0x2
	flush	%l7 + 0x38
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%i4
	nop
	set	0x60, %o0
	std	%f2,	[%l7 + %o0]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%o6,	[%g0 + 0x10] %asi
	srax	%l4,	0x19,	%o4
	ldsh	[%l7 + 0x68],	%o1
	membar	0x1B
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %i3
	stxa	%g2,	[%g0 + %i3] 0x4f
	ldsw	[%l7 + 0x34],	%i2
	stx	%o7,	[%l7 + 0x28]
	sth	%l2,	[%l7 + 0x6C]
	ldd	[%l7 + 0x20],	%l4
	ldsh	[%l7 + 0x54],	%o3
	lduh	[%l7 + 0x7C],	%i6
	lduw	[%l7 + 0x20],	%g4
	ldx	[%l7 + 0x30],	%g1
	stw	%g5,	[%l7 + 0x64]
	lduh	[%l7 + 0x18],	%l6
	ldsb	[%l7 + 0x1C],	%l3
	ldub	[%l7 + 0x77],	%i3
	subcc	%o5,	%g7,	%o0
	ldd	[%l7 + 0x30],	%f8
	ldsb	[%l7 + 0x09],	%g3
	stx	%l1,	[%l7 + 0x70]
	ld	[%l7 + 0x74],	%f15
	fbu,a	%fcc2,	loop_302
	rd	%softint,	%i0
	wr 	%g0, 	0x7, 	%fprs
	edge32	%i1,	%l0,	%g6
loop_302:
	flush	%l7 + 0x68
	prefetch	[%l7 + 0x38],	 0x1
	swap	[%l7 + 0x74],	%i4
	ld	[%l7 + 0x34],	%f3
	rd	%sys_tick_cmpr,	%o6
	or	%i7,	%o4,	%o1
	ldd	[%l7 + 0x30],	%g2
	lduw	[%l7 + 0x30],	%l4
	ld	[%l7 + 0x0C],	%f24
	ldx	[%l7 + 0x60],	%i2
	ld	[%l7 + 0x48],	%f6
	ldx	[%l7 + 0x60],	%l2
	stx	%l5,	[%l7 + 0x50]
	lduw	[%l7 + 0x50],	%o3
	nop
	set	0x71, %l4
	ldstub	[%l7 + %l4],	%i6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	wr	%g0,	0x20,	%asi
	stxa	%g4,	[%g0 + 0x18] %asi
	edge32l	%g1,	%g5,	%o7
	flush	%l7 + 0x38
	stb	%l6,	[%l7 + 0x4E]
	fmovdpos	%xcc,	%f12,	%f8
	sth	%i3,	[%l7 + 0x50]
	ldsh	[%l7 + 0x10],	%l3
	edge8l	%o5,	%o0,	%g3
	stx	%l1,	[%l7 + 0x78]
	wrpr	%g7,	0x12B8,	%pil
	nop
	set	0x18, %i5
	std	%f14,	[%l7 + %i5]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	stb	%o2,	[%l7 + 0x1C]
	xnor	%l0,	0x190B,	%i1
	ld	[%l7 + 0x44],	%f11
	stx	%i4,	[%l7 + 0x20]
	stbar
	std	%g6,	[%l7 + 0x30]
	sth	%o6,	[%l7 + 0x62]
	lduh	[%l7 + 0x68],	%o4
	ld	[%l7 + 0x24],	%f13
	ldsh	[%l7 + 0x64],	%i7
	udivcc	%o1,	0x1487,	%l4
	nop
	set	0x28, %o2
	stx	%i2,	[%l7 + %o2]
	movgu	%xcc,	%g2,	%l5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %o5
	stxa	%l2,	[%g0 + %o5] 0x4f
	nop
	set	0x14, %i1
	ldsw	[%l7 + %i1],	%i6
	prefetch	[%l7 + 0x2C],	 0x3
	movneg	%xcc,	%o3,	%g4
	fxnor	%f22,	%f2,	%f2
	flush	%l7 + 0x58
	fmovsleu	%xcc,	%f15,	%f16
	ld	[%l7 + 0x58],	%f22
	flush	%l7 + 0x3C
	ldd	[%l7 + 0x10],	%g4
	bpos	%icc,	loop_303
	bgu,a,pn	%xcc,	loop_304
	prefetch	[%l7 + 0x3C],	 0x2
	stx	%g1,	[%l7 + 0x28]
loop_303:
	ldd	[%l7 + 0x28],	%i6
loop_304:
	nop
	set	0x18, %l0
	stx	%i3,	[%l7 + %l0]
	nop
	set	0x58, %o7
	stx	%l3,	[%l7 + %o7]
	edge16ln	%o7,	%o0,	%g3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %i4
	ldxa	[%g0 + %i4] 0x4f,	%o5
	flush	%l7 + 0x58
	ldsb	[%l7 + 0x50],	%l1
	ldd	[%l7 + 0x50],	%i0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %g5
	ldxa	[%g0 + %g5] 0x20,	%i5
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%g7
	nop
	set	0x78, %g6
	std	%o2,	[%l7 + %g6]
	prefetch	[%l7 + 0x30],	 0x1
	wr	%l0,	0x06E7,	%set_softint
	std	%i0,	[%l7 + 0x10]
	ldsb	[%l7 + 0x62],	%i4
	popc	0x1155,	%o6
	ldub	[%l7 + 0x70],	%o4
	std	%f20,	[%l7 + 0x50]
	edge16l	%i7,	%g6,	%o1
	st	%f12,	[%l7 + 0x50]
	ld	[%l7 + 0x10],	%f11
	swap	[%l7 + 0x58],	%l4
	sdivcc	%i2,	0x019E,	%g2
	ldsh	[%l7 + 0x2C],	%l2
	ldd	[%l7 + 0x60],	%f0
	std	%l4,	[%l7 + 0x78]
	prefetch	[%l7 + 0x38],	 0x2
	lduw	[%l7 + 0x58],	%o3
	ldstub	[%l7 + 0x75],	%g4
	ldd	[%l7 + 0x70],	%f10
	rdpr	%cleanwin,	%i6
	swap	[%l7 + 0x40],	%g1
	stx	%l6,	[%l7 + 0x60]
	stb	%i3,	[%l7 + 0x71]
	fpack16	%f6,	%f11
	ldstub	[%l7 + 0x44],	%l3
	movgu	%icc,	%o7,	%o0
	lduh	[%l7 + 0x36],	%g3
	ld	[%l7 + 0x70],	%f12
	sth	%o5,	[%l7 + 0x08]
	sub	%l1,	0x18C8,	%g5
	std	%f26,	[%l7 + 0x68]
	ldx	[%l7 + 0x58],	%i5
	stw	%i0,	[%l7 + 0x1C]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g7
	wrpr	%l0,	%o2,	%pil
	std	%i0,	[%l7 + 0x20]
	stbar
	flush	%l7 + 0x7C
	ldsw	[%l7 + 0x24],	%i4
	stw	%o4,	[%l7 + 0x70]
	std	%f10,	[%l7 + 0x68]
	std	%f28,	[%l7 + 0x78]
	stbar
	std	%f14,	[%l7 + 0x10]
	ldsw	[%l7 + 0x30],	%i7
	tpos	%xcc,	0x0
	lduw	[%l7 + 0x38],	%g6
	ldd	[%l7 + 0x58],	%f26
	lduw	[%l7 + 0x48],	%o1
	wr	%l4,	0x0BCD,	%set_softint
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i2
	flush	%l7 + 0x7C
	fmovdpos	%xcc,	%f13,	%f24
	flush	%l7 + 0x34
	nop
	set	0x4C, %o3
	ldsh	[%l7 + %o3],	%g2
	ldd	[%l7 + 0x50],	%l2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	stxa	%o6,	[%g0 + 0x8] %asi
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%o2
	std	%f2,	[%l7 + 0x18]
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%g4
	flush	%l7 + 0x48
	ldsb	[%l7 + 0x2D],	%l5
	addcc	%i6,	%l6,	%i3
	ldstub	[%l7 + 0x22],	%l3
	stx	%g1,	[%l7 + 0x40]
	stw	%o7,	[%l7 + 0x70]
	fbe,a	%fcc3,	loop_305
	stb	%o0,	[%l7 + 0x30]
	ldsh	[%l7 + 0x62],	%g3
	st	%f0,	[%l7 + 0x34]
loop_305:
	movrne	%l1,	0x30E,	%o5
	stw	%g5,	[%l7 + 0x28]
	ldsh	[%l7 + 0x10],	%i0
	ldd	[%l7 + 0x78],	%g6
	ldsb	[%l7 + 0x10],	%l0
	rdpr	%wstate,	%i5
	fmul8ulx16	%f16,	%f12,	%f8
	movl	%xcc,	%i1,	%o2
	sth	%i4,	[%l7 + 0x7A]
	ldsw	[%l7 + 0x0C],	%o4
	stbar
	swap	[%l7 + 0x4C],	%g6
	tpos	%icc,	0x3
	ldd	[%l7 + 0x30],	%f16
	sethi	0x00BD,	%o1
	swap	[%l7 + 0x10],	%i7
	prefetch	[%l7 + 0x7C],	 0x1
	sth	%i2,	[%l7 + 0x12]
	std	%g2,	[%l7 + 0x40]
	rdhpr	%hintp,	%l2
	fbule	%fcc2,	loop_306
	movcc	%xcc,	%o6,	%l4
	nop
	set	0x44, %l6
	ldsw	[%l7 + %l6],	%g4
	ldsh	[%l7 + 0x54],	%l5
loop_306:
	stbar
	ldsh	[%l7 + 0x68],	%i6
	ldx	[%l7 + 0x08],	%o3
	stx	%i3,	[%l7 + 0x40]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %g7
	ldxa	[%g0 + %g7] 0x20,	%l3
	flush	%l7 + 0x60
	stbar
	prefetch	[%l7 + 0x58],	 0x1
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%g1
	flush	%l7 + 0x5C
	wrpr	%l6,	%o0,	%pil
	stb	%g3,	[%l7 + 0x6B]
	edge8	%l1,	%o5,	%g5
	wr	%o7,	%i0,	%set_softint
	stb	%l0,	[%l7 + 0x4F]
	stx	%g7,	[%l7 + 0x08]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %o1
	stxa	%i1,	[%g0 + %o1] 0x4f
	ldsh	[%l7 + 0x4E],	%o2
	fsrc2	%f12,	%f20
	movrgez	%i4,	0x115,	%o4
	st	%f17,	[%l7 + 0x10]
	tvc	%icc,	0x7
	ld	[%l7 + 0x14],	%f15
	lduw	[%l7 + 0x60],	%i5
	ldsw	[%l7 + 0x24],	%o1
	ldsb	[%l7 + 0x7F],	%i7
	edge16ln	%i2,	%g2,	%g6
	st	%f1,	[%l7 + 0x2C]
	fnegs	%f19,	%f3
	flush	%l7 + 0x5C
	rdpr	%cwp,	%o6
	st	%f5,	[%l7 + 0x08]
	swap	[%l7 + 0x58],	%l4
	fcmps	%fcc1,	%f26,	%f5
	stx	%g4,	[%l7 + 0x30]
	fnor	%f6,	%f4,	%f22
	ldsb	[%l7 + 0x26],	%l5
	rdpr	%canrestore,	%i6

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA00, 	%hsys_tick_cmpr
	fmovsg	%xcc,	%f16,	%f22
	std	%o2,	[%l7 + 0x08]
	lduh	[%l7 + 0x64],	%i3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	wr	%g0,	0x4f,	%asi
	stxa	%g1,	[%g0 + 0x18] %asi
	rd	%y,	%l3
	ld	[%l7 + 0x70],	%f9
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%o0,	[%g0 + 0x38] %asi
	std	%f0,	[%l7 + 0x68]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x996, 	%tick_cmpr
	prefetch	[%l7 + 0x7C],	 0x1
	std	%f8,	[%l7 + 0x60]
	srax	%o5,	%l6,	%o7
	ldstub	[%l7 + 0x37],	%i0
	ldd	[%l7 + 0x20],	%f2
	fmovdn	%icc,	%f3,	%f8
	ldsb	[%l7 + 0x77],	%l0
	std	%g4,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%g7,	[%g0 + 0x38] %asi
	swap	[%l7 + 0x54],	%i1
	te	%xcc,	0x5
	movrgz	%o2,	%o4,	%i5
	fmovdl	%icc,	%f14,	%f23
	ld	[%l7 + 0x14],	%f26
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%i4,	[%g0 + 0x38] %asi

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr
	tcs	%xcc,	0x5
	st	%f26,	[%l7 + 0x30]
	lduw	[%l7 + 0x3C],	%i2
	std	%f10,	[%l7 + 0x10]
	movn	%xcc,	%o1,	%g6
	tpos	%xcc,	0x1
	ldsw	[%l7 + 0x44],	%g2
	fbg	%fcc1,	loop_307
	bcc,a,pn	%icc,	loop_308
	rdhpr	%htba,	%o6
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%l4
loop_307:
	movleu	%icc,	%g4,	%l5
loop_308:
	ldsh	[%l7 + 0x0E],	%l2
	fsrc2s	%f9,	%f31
	std	%o2,	[%l7 + 0x18]
	ldd	[%l7 + 0x48],	%i6
	bvs	loop_309
	swap	[%l7 + 0x60],	%g1
	ldsw	[%l7 + 0x70],	%i3
	movge	%icc,	%l3,	%o0
loop_309:
	ldd	[%l7 + 0x08],	%f12
	sth	%g3,	[%l7 + 0x70]
	ldstub	[%l7 + 0x4C],	%o5
	ld	[%l7 + 0x70],	%f19
	stw	%l1,	[%l7 + 0x70]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	set	0x8, %g3
	ldxa	[%g0 + %g3] 0x20,	%l6
	ldsb	[%l7 + 0x6E],	%o7
	ld	[%l7 + 0x5C],	%f17
	flush	%l7 + 0x68
	sth	%i0,	[%l7 + 0x40]
	ldx	[%l7 + 0x78],	%l0
	std	%f28,	[%l7 + 0x10]
	udivx	%g5,	0x18F5,	%i1
	st	%f2,	[%l7 + 0x78]
	movl	%icc,	%g7,	%o2
	stw	%i5,	[%l7 + 0x5C]
	stw	%i4,	[%l7 + 0x54]
	ldub	[%l7 + 0x58],	%o4
	addcc	%i2,	0x022B,	%o1
	ldd	[%l7 + 0x60],	%f8
	fxnor	%f26,	%f12,	%f6
	stbar
	nop
	set	0x0A, %l5
	stb	%g6,	[%l7 + %l5]
	nop
	set	0x40, %l3
	std	%g2,	[%l7 + %l3]
	swap	[%l7 + 0x3C],	%i7
	flush	%l7 + 0x5C
	ldd	[%l7 + 0x60],	%o6
	sdivcc	%l4,	0x17F1,	%g4
	ldsh	[%l7 + 0x34],	%l2
	ld	[%l7 + 0x2C],	%f15
	prefetch	[%l7 + 0x74],	 0x2
	stbar
	ldsw	[%l7 + 0x24],	%o3
	stb	%l5,	[%l7 + 0x59]
	flush	%l7 + 0x78
	fpadd32s	%f1,	%f11,	%f18
	lduw	[%l7 + 0x5C],	%i6
	ldd	[%l7 + 0x70],	%f10
	swap	[%l7 + 0x6C],	%g1
	wrpr	%i3,	%l3,	%tick
	ldd	[%l7 + 0x08],	%g2
	lduw	[%l7 + 0x38],	%o5
	std	%l0,	[%l7 + 0x30]
	orn	%l6,	%o0,	%i0
	fpsub16	%f22,	%f18,	%f28
	xnor	%l0,	0x022B,	%g5
	rdpr	%tl,	%i1
	ld	[%l7 + 0x0C],	%f22
	lduw	[%l7 + 0x2C],	%g7
	flush	%l7 + 0x20
	ldub	[%l7 + 0x61],	%o7
	nop
	set	0x34, %i7
	lduh	[%l7 + %i7],	%o2
	flush	%l7 + 0x7C
	lduw	[%l7 + 0x64],	%i5
	std	%o4,	[%l7 + 0x60]
	sdivcc	%i2,	0x02F6,	%o1
	ldsh	[%l7 + 0x52],	%g6
	lduh	[%l7 + 0x3E],	%g2
	prefetch	[%l7 + 0x28],	 0x3
	ldd	[%l7 + 0x08],	%f30
	ldd	[%l7 + 0x08],	%i6
	std	%f2,	[%l7 + 0x20]
	movrgz	%i4,	%l4,	%o6
	lduh	[%l7 + 0x1C],	%l2
	st	%f29,	[%l7 + 0x0C]
	std	%f4,	[%l7 + 0x60]
	ldd	[%l7 + 0x20],	%g4
	st	%f12,	[%l7 + 0x70]
	prefetch	[%l7 + 0x20],	 0x3
	flushw
	ldsw	[%l7 + 0x1C],	%l5
	stx	%o3,	[%l7 + 0x38]
	lduw	[%l7 + 0x70],	%i6
	lduh	[%l7 + 0x66],	%g1
	subccc	%l3,	%g3,	%i3
	edge16l	%o5,	%l6,	%o0
	ld	[%l7 + 0x40],	%f28
	ldsh	[%l7 + 0x08],	%i0
	ldd	[%l7 + 0x10],	%f24
	ldstub	[%l7 + 0x28],	%l1
	sdivx	%g5,	0x0138,	%l0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %i0
	ldxa	[%g0 + %i0] 0x20,	%i1
	prefetch	[%l7 + 0x3C],	 0x1
	std	%f24,	[%l7 + 0x68]
	array16	%o7,	%o2,	%g7
	stbar
	st	%f29,	[%l7 + 0x50]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i5,	%i2,	%o4
	std	%f6,	[%l7 + 0x10]
	fmovspos	%icc,	%f10,	%f6
	std	%o0,	[%l7 + 0x58]
	st	%f3,	[%l7 + 0x74]
	taddcc	%g2,	%g6,	%i7
	ldstub	[%l7 + 0x61],	%l4
	addc	%i4,	0x18AF,	%o6
	prefetch	[%l7 + 0x74],	 0x1
	prefetch	[%l7 + 0x48],	 0x0
	orcc	%g4,	0x01D9,	%l2
	prefetch	[%l7 + 0x2C],	 0x1
	ldd	[%l7 + 0x48],	%o2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g1
	stxa	%l5,	[%g0 + %g1] 0x20
	andn	%g1,	%l3,	%i6
	st	%f23,	[%l7 + 0x14]
	std	%f16,	[%l7 + 0x18]
	st	%f18,	[%l7 + 0x0C]
	ldx	[%l7 + 0x08],	%i3
	siam	0x2
	tg	%icc,	0x0
	lduw	[%l7 + 0x38],	%g3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %l1
	stxa	%o5,	[%g0 + %l1] 0x4f
	ldx	[%l7 + 0x18],	%o0
	ldx	[%l7 + 0x68],	%i0
	ldsw	[%l7 + 0x3C],	%l1
	stw	%g5,	[%l7 + 0x68]
	std	%f22,	[%l7 + 0x30]
	stbar
	sth	%l6,	[%l7 + 0x0E]
	movleu	%icc,	%i1,	%o7
	ldstub	[%l7 + 0x6D],	%l0
	ld	[%l7 + 0x7C],	%f0
	tcs	%xcc,	0x4
	ld	[%l7 + 0x74],	%f31
	ldsh	[%l7 + 0x60],	%g7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o2
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i2
	ldd	[%l7 + 0x78],	%o4
	stbar
	sra	%o1,	0x1B,	%i5
	ldstub	[%l7 + 0x79],	%g6
	st	%f20,	[%l7 + 0x78]
	stx	%g2,	[%l7 + 0x78]
	nop
	set	0x1E, %g2
	ldsh	[%l7 + %g2],	%l4
	nop
	set	0x0C, %l2
	ldstub	[%l7 + %l2],	%i7
	ldsb	[%l7 + 0x24],	%i4
	lduw	[%l7 + 0x08],	%o6
	prefetch	[%l7 + 0x58],	 0x3
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %i6
	ldxa	[%g0 + %i6] 0x20,	%l2
	sth	%g4,	[%l7 + 0x22]
	ldstub	[%l7 + 0x3A],	%o3
	fcmpgt16	%f22,	%f22,	%l5
	flush	%l7 + 0x20
	fone	%f8
	ldd	[%l7 + 0x50],	%f20
	stbar
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x0
	set	0x0, %o0
	ldxa	[%g0 + %o0] 0x4f,	%l3
	std	%i6,	[%l7 + 0x48]
	ldub	[%l7 + 0x0E],	%g1
	ldstub	[%l7 + 0x77],	%i3
	stbar
	lduw	[%l7 + 0x14],	%o5
	ldub	[%l7 + 0x36],	%o0
	stbar
	mulscc	%i0,	0x1773,	%l1
	st	%f9,	[%l7 + 0x5C]
	rdpr	%tl,	%g5
	ldd	[%l7 + 0x70],	%g2
	stb	%i1,	[%l7 + 0x4A]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%o7,	[%g0 + 0x38] %asi
	movn	%xcc,	%l6,	%g7
	flush	%l7 + 0x74
	stx	%l0,	[%l7 + 0x70]
	ldd	[%l7 + 0x38],	%f20
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	set	0x20, %i3
	stxa	%o2,	[%g0 + %i3] 0x4f
	stb	%o4,	[%l7 + 0x6A]
	prefetch	[%l7 + 0x54],	 0x2
	flush	%l7 + 0x64
	addcc	%o1,	%i5,	%g6
	ldd	[%l7 + 0x18],	%f30
	stw	%i2,	[%l7 + 0x74]
	stbar
	prefetch	[%l7 + 0x38],	 0x2
	stw	%g2,	[%l7 + 0x5C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l4
	stbar
	stx	%i4,	[%l7 + 0x68]
	bg	%icc,	loop_310
	ldx	[%l7 + 0x60],	%o6
	array8	%i7,	%g4,	%o3
	std	%l4,	[%l7 + 0x58]
loop_310:
	ldd	[%l7 + 0x58],	%f12
	ldsh	[%l7 + 0x72],	%l3
	stbar
	sdiv	%i6,	0x03D3,	%g1
	stx	%l2,	[%l7 + 0x38]
	ldub	[%l7 + 0x0D],	%o5
	stbar
	nop
	set	0x1A, %i5
	sth	%i3,	[%l7 + %i5]
	fbug	%fcc3,	loop_311
	flush	%l7 + 0x64
	fbg,a	%fcc1,	loop_312
	lduw	[%l7 + 0x78],	%o0
loop_311:
	wrpr	%i0,	%g5,	%cwp
	fmovdle	%icc,	%f0,	%f14
loop_312:
	prefetch	[%l7 + 0x24],	 0x0
	ld	[%l7 + 0x48],	%f24
	ldub	[%l7 + 0x4F],	%l1
	swap	[%l7 + 0x74],	%i1
	fmovsvc	%icc,	%f23,	%f7
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %l4
	stxa	%g3,	[%g0 + %l4] 0x20
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	wr	%g0,	0x20,	%asi
	stxa	%o7,	[%g0 + 0x38] %asi
	srl	%g7,	%l0,	%l6
	ldd	[%l7 + 0x50],	%o2
	umulcc	%o4,	0x0AE0,	%i5
	fcmpne16	%f4,	%f16,	%o1
	smulcc	%g6,	%g2,	%i2
	stw	%i4,	[%l7 + 0x50]
	ldub	[%l7 + 0x4F],	%l4
	lduw	[%l7 + 0x6C],	%o6
	ld	[%l7 + 0x20],	%f31
	nop
	set	0x54, %o2
	prefetch	[%l7 + %o2],	 0x2
	st	%f0,	[%l7 + 0x0C]
	lduw	[%l7 + 0x40],	%i7
	movre	%o3,	0x10C,	%l5
	sethi	0x1665,	%g4
	swap	[%l7 + 0x78],	%l3
	ldub	[%l7 + 0x6D],	%i6
	lduh	[%l7 + 0x28],	%l2
	stx	%o5,	[%l7 + 0x10]
	ldsh	[%l7 + 0x6E],	%g1
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %i1
	stxa	%i3,	[%g0 + %i1] 0x20
	ld	[%l7 + 0x0C],	%f14
	fmovsn	%xcc,	%f16,	%f23
	nop
	set	0x7C, %l0
	ldstub	[%l7 + %l0],	%i0
	stb	%o0,	[%l7 + 0x59]
	ldx	[%l7 + 0x70],	%l1
	std	%i0,	[%l7 + 0x28]
	ldsw	[%l7 + 0x30],	%g3
	umulcc	%o7,	%g7,	%g5
	ldd	[%l7 + 0x58],	%l0
	fbo	%fcc2,	loop_313
	udivcc	%o2,	0x1624,	%o4
	ldsh	[%l7 + 0x44],	%i5
	ldsb	[%l7 + 0x18],	%o1
loop_313:
	ldstub	[%l7 + 0x71],	%g6
	rd	%y,	%l6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i2
	sth	%i4,	[%l7 + 0x7E]
	fmovsle	%xcc,	%f9,	%f29
	ldd	[%l7 + 0x18],	%f24
	ldsw	[%l7 + 0x6C],	%l4
	ldstub	[%l7 + 0x1F],	%o6
	ldd	[%l7 + 0x48],	%i6
	ldsb	[%l7 + 0x5C],	%g2
	ldd	[%l7 + 0x48],	%f2
	flush	%l7 + 0x2C
	std	%l4,	[%l7 + 0x50]
	sth	%o3,	[%l7 + 0x38]
	ldstub	[%l7 + 0x1A],	%l3
	movvc	%xcc,	%g4,	%l2
	st	%f27,	[%l7 + 0x34]
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%i6
	ldsh	[%l7 + 0x76],	%g1
	lduw	[%l7 + 0x24],	%o5
	ldx	[%l7 + 0x70],	%i0
	ldd	[%l7 + 0x60],	%f0
	std	%f12,	[%l7 + 0x38]
	ldub	[%l7 + 0x1A],	%o0
	ldx	[%l7 + 0x30],	%i3
	stb	%i1,	[%l7 + 0x61]
	lduh	[%l7 + 0x68],	%l1
	stx	%g3,	[%l7 + 0x08]
	ldstub	[%l7 + 0x7F],	%o7
	fmovsvs	%icc,	%f17,	%f2
	tl	%icc,	0x1
	stbar
	nop
	set	0x53, %o7
	stb	%g5,	[%l7 + %o7]
	std	%g6,	[%l7 + 0x48]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	umul	%l0,	0x0082,	%o4
	ldsw	[%l7 + 0x14],	%o1
	ldsw	[%l7 + 0x58],	%i5
	nop
	set	0x0C, %g5
	ldsw	[%l7 + %g5],	%l6
	ldd	[%l7 + 0x60],	%g6
	movl	%xcc,	%i2,	%l4
	lduh	[%l7 + 0x54],	%o6
	ldd	[%l7 + 0x20],	%f16
	ldd	[%l7 + 0x20],	%i6
	ldub	[%l7 + 0x5C],	%i4
	lduh	[%l7 + 0x3A],	%g2
	ldstub	[%l7 + 0x6F],	%l5
	fmovdge	%icc,	%f5,	%f19
	fzeros	%f28
	add	%o3,	0x121D,	%l3
	ld	[%l7 + 0x58],	%f7
	std	%f24,	[%l7 + 0x20]
	st	%f8,	[%l7 + 0x0C]
	ldd	[%l7 + 0x40],	%g4
	std	%l2,	[%l7 + 0x18]
	ldd	[%l7 + 0x30],	%f0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	set	0x28, %g6
	stxa	%i6,	[%g0 + %g6] 0x4f
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	set	0x28, %o3
	stxa	%o5,	[%g0 + %o3] 0x20
	srax	%g1,	%o0,	%i0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	wr	%g0,	0x4f,	%asi
	stxa	%i1,	[%g0 + 0x38] %asi
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i3
	ldx	[%l7 + 0x40],	%g3
	stb	%o7,	[%l7 + 0x5D]
	srlx	%l1,	0x01,	%g7
	std	%g4,	[%l7 + 0x78]
	stx	%o2,	[%l7 + 0x70]
	and	%o4,	0x019D,	%o1
	lduw	[%l7 + 0x38],	%i5
	flushw
	ldsh	[%l7 + 0x24],	%l0
	fxnor	%f10,	%f26,	%f2
	lduh	[%l7 + 0x54],	%l6
	prefetch	[%l7 + 0x50],	 0x0
	orn	%g6,	%i2,	%l4
	stb	%o6,	[%l7 + 0x19]
	std	%i6,	[%l7 + 0x38]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g4
	stxa	%i4,	[%g0 + %g4] 0x20
	std	%f6,	[%l7 + 0x78]
	nop
	set	0x20, %o6
	prefetch	[%l7 + %o6],	 0x1
	ldx	[%l7 + 0x78],	%l5
	flush	%l7 + 0x74
	flush	%l7 + 0x48
	ldstub	[%l7 + 0x73],	%o3
	st	%f17,	[%l7 + 0x6C]
	rd	%pc,	%g2
	ld	[%l7 + 0x5C],	%f21
	movrgz	%l3,	%l2,	%i6
	st	%f27,	[%l7 + 0x64]
	ldd	[%l7 + 0x18],	%f4
	ldd	[%l7 + 0x30],	%f24
	brgz	%o5,	loop_314
	std	%g4,	[%l7 + 0x78]
	addcc	%o0,	0x0040,	%g1
	swap	[%l7 + 0x08],	%i1
loop_314:
	movleu	%icc,	%i0,	%i3
	std	%o6,	[%l7 + 0x48]
	fpsub16	%f2,	%f6,	%f28
	brlz,a	%g3,	loop_315
	nop
	set	0x58, %i4
	std	%f8,	[%l7 + %i4]
	nop
	set	0x0C, %l6
	ldub	[%l7 + %l6],	%g7
	std	%f24,	[%l7 + 0x38]
loop_315:
	sth	%l1,	[%l7 + 0x08]
	lduh	[%l7 + 0x10],	%o2
	stbar
	stbar
	fmovdle	%xcc,	%f19,	%f11
	fmovsa	%icc,	%f1,	%f31
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x18
	set	0x18, %o4
	stxa	%g5,	[%g0 + %o4] 0x20
	stbar
	fmovsgu	%xcc,	%f15,	%f5
	st	%f1,	[%l7 + 0x3C]
	swap	[%l7 + 0x5C],	%o4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g7
	stxa	%i5,	[%g0 + %g7] 0x20
	st	%f9,	[%l7 + 0x4C]
	prefetch	[%l7 + 0x20],	 0x2
	ldsw	[%l7 + 0x08],	%o1
	tneg	%xcc,	0x0
	ldsb	[%l7 + 0x3B],	%l0
	stx	%g6,	[%l7 + 0x48]
	prefetch	[%l7 + 0x34],	 0x1
	nop
	set	0x40, %o1
	lduw	[%l7 + %o1],	%i2
	st	%f5,	[%l7 + 0x50]
	movpos	%icc,	%l4,	%o6
	movle	%icc,	%i7,	%l6
	srl	%i4,	0x05,	%o3
	stw	%g2,	[%l7 + 0x44]
	ldsb	[%l7 + 0x6D],	%l5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i2
	ldxa	[%g0 + %i2] 0x20,	%l3
	movgu	%icc,	%l2,	%o5
	xnor	%i6,	%g4,	%g1
	prefetch	[%l7 + 0x18],	 0x1
	sth	%o0,	[%l7 + 0x6C]
	stb	%i0,	[%l7 + 0x17]
	stx	%i3,	[%l7 + 0x38]
	stb	%o7,	[%l7 + 0x2A]
	ldub	[%l7 + 0x25],	%i1
	movrlz	%g7,	0x192,	%l1
	ldd	[%l7 + 0x48],	%f24
	st	%f0,	[%l7 + 0x6C]
	brlez,a	%o2,	loop_316
	srax	%g5,	%o4,	%g3
	lduh	[%l7 + 0x16],	%o1
	nop
	set	0x68, %g3
	ldsw	[%l7 + %g3],	%i5
loop_316:
	nop
	set	0x0C, %l3
	prefetch	[%l7 + %l3],	 0x2
	rdpr	%wstate,	%l0
	bg	%icc,	loop_317
	bge	%xcc,	loop_318
	stx	%i2,	[%l7 + 0x08]
	ld	[%l7 + 0x5C],	%f3
loop_317:
	ldd	[%l7 + 0x40],	%f14
loop_318:
	fornot1	%f18,	%f6,	%f22
	fmovsne	%icc,	%f2,	%f2
	ldstub	[%l7 + 0x45],	%l4
	srax	%g6,	%o6,	%l6
	subcc	%i7,	0x0581,	%o3
	fmovrde	%i4,	%f22,	%f14
	addcc	%g2,	%l3,	%l5
	prefetch	[%l7 + 0x14],	 0x0
	stbar
	nop
	set	0x50, %l5
	std	%l2,	[%l7 + %l5]
	fmovrsgez	%i6,	%f1,	%f3
	flush	%l7 + 0x78
	ldub	[%l7 + 0x6F],	%g4
	ldub	[%l7 + 0x78],	%g1
	ldx	[%l7 + 0x28],	%o0
	tl	%xcc,	0x4
	nop
	set	0x74, %i7
	lduh	[%l7 + %i7],	%i0
	nop
	set	0x21, %g1
	stb	%o5,	[%l7 + %g1]
	stw	%i3,	[%l7 + 0x68]
	nop
	set	0x3F, %i0
	stb	%i1,	[%l7 + %i0]
	movre	%o7,	%g7,	%l1
	fcmple32	%f8,	%f20,	%g5
	ldsb	[%l7 + 0x67],	%o4
	ldsh	[%l7 + 0x4C],	%o2
	edge32n	%g3,	%i5,	%o1
	ldub	[%l7 + 0x65],	%l0
	stbar
	ldx	[%l7 + 0x68],	%i2
	sth	%g6,	[%l7 + 0x66]
	sth	%o6,	[%l7 + 0x58]
	flush	%l7 + 0x54
	ldstub	[%l7 + 0x11],	%l6
	prefetch	[%l7 + 0x4C],	 0x2
	sth	%i7,	[%l7 + 0x5E]

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	std	%i4,	[%l7 + 0x48]
	ldsw	[%l7 + 0x28],	%l3
	fpack32	%f6,	%f26,	%f0
	srax	%g2,	0x0D,	%l5
	ldd	[%l7 + 0x38],	%f20
	fxors	%f6,	%f20,	%f23
	edge32ln	%l2,	%g4,	%i6
	lduw	[%l7 + 0x3C],	%g1
	array16	%o0,	%i0,	%i3
	std	%i0,	[%l7 + 0x78]
	ldd	[%l7 + 0x58],	%f12
	swap	[%l7 + 0x64],	%o5
	ldd	[%l7 + 0x40],	%f30
	bpos,pt	%icc,	loop_319
	ld	[%l7 + 0x10],	%f15
	stx	%o7,	[%l7 + 0x28]
	ldub	[%l7 + 0x1E],	%l1
loop_319:
	ldd	[%l7 + 0x10],	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%g6
	movrgez	%g5,	0x12D,	%o2
	lduh	[%l7 + 0x0E],	%g3
	ldsb	[%l7 + 0x1A],	%i5
	nop
	set	0x0A, %g2
	ldub	[%l7 + %g2],	%o1
	lduh	[%l7 + 0x32],	%l0
	ldx	[%l7 + 0x68],	%o4
	std	%f6,	[%l7 + 0x10]
	edge16ln	%g6,	%o6,	%l6
	std	%i2,	[%l7 + 0x08]
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%o3
	subcc	%l4,	%i7,	%i4
	edge8	%l3,	%l5,	%g2
	ldd	[%l7 + 0x48],	%f22
	prefetch	[%l7 + 0x34],	 0x3
	fsrc2s	%f13,	%f17
	swap	[%l7 + 0x68],	%l2
	bne,pn	%icc,	loop_320
	sth	%i6,	[%l7 + 0x14]
	ldsb	[%l7 + 0x12],	%g1
	movre	%o0,	%g4,	%i3
loop_320:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x28
	nop
	set	0x28, %i6
	stxa	%i0,	[%g0 + %i6] 0x4f
	fnor	%f20,	%f6,	%f16
	ldsb	[%l7 + 0x23],	%o5
	ld	[%l7 + 0x60],	%f4
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %l1
	stxa	%i1,	[%g0 + %l1] 0x20
	flush	%l7 + 0x5C
	prefetch	[%l7 + 0x68],	 0x0
	prefetch	[%l7 + 0x60],	 0x2
	st	%f18,	[%l7 + 0x74]
	ldd	[%l7 + 0x70],	%o6
	lduh	[%l7 + 0x56],	%l1
	sethi	0x1A90,	%g7
	smulcc	%o2,	%g3,	%g5
	std	%o0,	[%l7 + 0x18]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i5
	ldsw	[%l7 + 0x44],	%l0
	ldub	[%l7 + 0x64],	%g6
	movrgz	%o6,	%l6,	%i2
	ldub	[%l7 + 0x3E],	%o3
	lduw	[%l7 + 0x18],	%o4
	ldx	[%l7 + 0x28],	%l4
	stbar
	sth	%i4,	[%l7 + 0x38]
	ldd	[%l7 + 0x20],	%i6
	ldsh	[%l7 + 0x66],	%l3
	std	%f6,	[%l7 + 0x68]
	ldd	[%l7 + 0x70],	%l4
	lduw	[%l7 + 0x60],	%g2
	lduw	[%l7 + 0x18],	%l2
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	stxa	%g1,	[%g0 + 0x10] %asi
	st	%f28,	[%l7 + 0x08]
	umulcc	%i6,	0x0A69,	%o0
	array16	%g4,	%i3,	%i0
	sth	%i1,	[%l7 + 0x64]
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 0x0
	stb	%o5,	[%l7 + 0x5F]
	stbar
	sth	%o7,	[%l7 + 0x2C]
	std	%f16,	[%l7 + 0x10]
	ldsh	[%l7 + 0x72],	%g7
	flush	%l7 + 0x3C
	tcs	%icc,	0x2
	lduh	[%l7 + 0x70],	%o2
	lduh	[%l7 + 0x3E],	%g3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %o0
	ldxa	[%g0 + %o0] 0x4f,	%l1
	st	%f30,	[%l7 + 0x40]
	movrgez	%g5,	%i5,	%o1
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	set	0x30, %i5
	stxa	%l0,	[%g0 + %i5] 0x4f
	ldd	[%l7 + 0x10],	%f18
	flush	%l7 + 0x50
	stw	%o6,	[%l7 + 0x48]
	swap	[%l7 + 0x2C],	%l6
	stbar
	fmovrdgez	%i2,	%f10,	%f20
	std	%f24,	[%l7 + 0x50]
	ldd	[%l7 + 0x30],	%g6
	stbar
	ldsh	[%l7 + 0x12],	%o3
	lduh	[%l7 + 0x76],	%o4
	flush	%l7 + 0x0C
	brlez,a	%i4,	loop_321
	mulscc	%i7,	0x108A,	%l3
	ldx	[%l7 + 0x60],	%l5
	fmul8sux16	%f6,	%f30,	%f30
loop_321:
	tne	%xcc,	0x6
	xorcc	%l4,	%g2,	%l2
	ldstub	[%l7 + 0x47],	%i6
	ldub	[%l7 + 0x34],	%o0
	ldd	[%l7 + 0x70],	%g0
	ldsh	[%l7 + 0x3E],	%i3
	prefetch	[%l7 + 0x4C],	 0x2
	sth	%i0,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%f8
	st	%f11,	[%l7 + 0x1C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g4
	ldsw	[%l7 + 0x74],	%o5
	ldd	[%l7 + 0x38],	%f24
	flush	%l7 + 0x2C
	mulx	%i1,	0x17C5,	%g7
	prefetch	[%l7 + 0x68],	 0x0
	movgu	%icc,	%o7,	%g3
	andcc	%l1,	0x01C4,	%g5
	stx	%i5,	[%l7 + 0x48]
	std	%o0,	[%l7 + 0x60]
	ldsh	[%l7 + 0x76],	%o2
	flush	%l7 + 0x54
	be	loop_322
	umulcc	%l0,	%o6,	%i2
	swap	[%l7 + 0x58],	%l6
	orcc	%g6,	0x0D2A,	%o3
loop_322:
	nop
	set	0x3C, %o2
	lduw	[%l7 + %o2],	%i4
	ldsh	[%l7 + 0x1E],	%o4
	addccc	%i7,	%l3,	%l5
	ldd	[%l7 + 0x10],	%f22
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x0
	set	0x0, %i1
	stxa	%l4,	[%g0 + %i1] 0x20
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %l0
	ldxa	[%g0 + %l0] 0x4f,	%g2
	ldd	[%l7 + 0x10],	%l2
	stbar
	rd	%ccr,	%i6
	ldd	[%l7 + 0x60],	%f28
	ldstub	[%l7 + 0x13],	%o0
	stx	%g1,	[%l7 + 0x70]
	stw	%i3,	[%l7 + 0x74]
	ldstub	[%l7 + 0x14],	%g4
	std	%i0,	[%l7 + 0x50]
	ldx	[%l7 + 0x10],	%i1
	nop
	set	0x38, %l4
	std	%f8,	[%l7 + %l4]
	nop
	set	0x58, %o5
	prefetch	[%l7 + %o5],	 0x2
	fbule,a	%fcc3,	loop_323
	nop
	set	0x4C, %g5
	prefetch	[%l7 + %g5],	 0x2
	orn	%o5,	0x0F9C,	%o7
	lduw	[%l7 + 0x0C],	%g3
loop_323:
	stx	%l1,	[%l7 + 0x48]
	subc	%g7,	%g5,	%o1
	ldx	[%l7 + 0x58],	%o2
	bpos	loop_324
	ldx	[%l7 + 0x78],	%i5
	ldd	[%l7 + 0x48],	%f28
	ldub	[%l7 + 0x31],	%o6
loop_324:
	ldx	[%l7 + 0x40],	%l0
	std	%i6,	[%l7 + 0x28]
	st	%f18,	[%l7 + 0x28]
	ldsb	[%l7 + 0x3F],	%g6
	edge8	%i2,	%o3,	%o4
	ldsw	[%l7 + 0x50],	%i4
	stx	%i7,	[%l7 + 0x78]
	ldsh	[%l7 + 0x76],	%l3
	stw	%l4,	[%l7 + 0x60]
	stbar
	rdhpr	%hintp,	%l5
	fmovrse	%l2,	%f30,	%f4
	sth	%g2,	[%l7 + 0x62]
	move	%icc,	%i6,	%o0
	ldsb	[%l7 + 0x39],	%g1
	ldd	[%l7 + 0x30],	%i2
	lduw	[%l7 + 0x54],	%i0
	movpos	%icc,	%g4,	%i1
	udivx	%o7,	0x07CC,	%o5
	sth	%g3,	[%l7 + 0x40]
	ldsb	[%l7 + 0x19],	%l1
	mova	%xcc,	%g5,	%g7
	stx	%o2,	[%l7 + 0x58]
	fbul	%fcc2,	loop_325
	ldub	[%l7 + 0x3F],	%o1
	ldx	[%l7 + 0x18],	%i5
	std	%f14,	[%l7 + 0x08]
loop_325:
	nop
	set	0x3C, %g6
	ldstub	[%l7 + %g6],	%o6
	lduh	[%l7 + 0x12],	%l6
	mova	%icc,	%l0,	%g6
	movrgez	%o3,	0x0AF,	%o4
	ldd	[%l7 + 0x68],	%i2
	movvc	%xcc,	%i4,	%i7
	lduh	[%l7 + 0x0A],	%l3
	ldd	[%l7 + 0x50],	%l4
	sth	%l4,	[%l7 + 0x2E]
	stw	%g2,	[%l7 + 0x2C]
	lduh	[%l7 + 0x3A],	%l2
	nop
	set	0x18, %o7
	ldub	[%l7 + %o7],	%i6
	ldsh	[%l7 + 0x3E],	%o0
	xorcc	%g1,	%i3,	%i0
	flush	%l7 + 0x18
	rd	%y,	%g4
	ldd	[%l7 + 0x60],	%f24
	membar	0x7D
	sdivcc	%o7,	0x1E76,	%i1
	ld	[%l7 + 0x2C],	%f7
	fcmps	%fcc0,	%f14,	%f16
	ldx	[%l7 + 0x28],	%g3
	stbar
	stw	%o5,	[%l7 + 0x48]
	stx	%l1,	[%l7 + 0x50]
	swap	[%l7 + 0x38],	%g5
	nop
	set	0x28, %o3
	prefetch	[%l7 + %o3],	 0x2
	array8	%o2,	%o1,	%g7
	lduh	[%l7 + 0x40],	%o6
	ldx	[%l7 + 0x30],	%l6
	ldsw	[%l7 + 0x24],	%l0
	ldub	[%l7 + 0x46],	%i5
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x10
	set	0x10, %o6
	stxa	%g6,	[%g0 + %o6] 0x20
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x8
	set	0x8, %g4
	ldxa	[%g0 + %g4] 0x4f,	%o4
	std	%o2,	[%l7 + 0x58]
	movpos	%icc,	%i2,	%i4
	stw	%l3,	[%l7 + 0x34]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x28
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i7
	or	%l5,	0x03FF,	%l4
	taddcctv	%g2,	0x10B1,	%i6
	wr 	%g0, 	0x5, 	%fprs
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l2
	swap	[%l7 + 0x24],	%g1
	movvs	%xcc,	%i3,	%i0
	stbar
	ldx	[%l7 + 0x28],	%o7
	udiv	%g4,	0x1498,	%i1
	ldd	[%l7 + 0x60],	%f18
	stw	%o5,	[%l7 + 0x18]
	prefetch	[%l7 + 0x40],	 0x3
	sth	%g3,	[%l7 + 0x0E]
	stx	%l1,	[%l7 + 0x10]
	movle	%icc,	%g5,	%o2
	bvc,pn	%icc,	loop_326
	ldsb	[%l7 + 0x70],	%g7
	tle	%icc,	0x6
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x30
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o1
loop_326:
	tl	%icc,	0x4
	ldub	[%l7 + 0x44],	%o6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %i4
	stxa	%l6,	[%g0 + %i4] 0x20
	udivcc	%i5,	0x1900,	%g6
	nop
	set	0x20, %l6
	std	%l0,	[%l7 + %l6]
	addc	%o3,	%o4,	%i2
	ldsb	[%l7 + 0x6A],	%l3
	lduh	[%l7 + 0x2E],	%i4
	flush	%l7 + 0x54
	ld	[%l7 + 0x48],	%f20
	ldub	[%l7 + 0x3F],	%i7
	lduh	[%l7 + 0x30],	%l5
	ldub	[%l7 + 0x62],	%l4
	nop
	set	0x54, %g7
	ldsh	[%l7 + %g7],	%g2
	std	%f10,	[%l7 + 0x58]
	fabsd	%f2,	%f14
	ldsh	[%l7 + 0x1C],	%o0
	prefetch	[%l7 + 0x64],	 0x2
	srax	%l2,	%i6,	%i3
	ldd	[%l7 + 0x50],	%i0
	addccc	%g1,	0x0213,	%g4
	ldsb	[%l7 + 0x23],	%o7
	ldub	[%l7 + 0x6E],	%o5
	nop
	set	0x5E, %o4
	sth	%i1,	[%l7 + %o4]
	nop
	set	0x28, %i2
	std	%f30,	[%l7 + %i2]
	tsubcctv	%l1,	%g3,	%o2
	stx	%g7,	[%l7 + 0x38]
	st	%f17,	[%l7 + 0x58]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o1
	movgu	%xcc,	%o6,	%g5
	ld	[%l7 + 0x0C],	%f5
	nop
	set	0x68, %o1
	std	%i4,	[%l7 + %o1]
	stbar
	flush	%l7 + 0x10
	nop
	set	0x33, %g3
	stb	%g6,	[%l7 + %g3]
	ldub	[%l7 + 0x6E],	%l6
	flush	%l7 + 0x48
	std	%o2,	[%l7 + 0x28]
	tneg	%xcc,	0x5
	fmovd	%f4,	%f14
	ldsb	[%l7 + 0x7C],	%l0
	stx	%i2,	[%l7 + 0x30]
	flush	%l7 + 0x50
	wr 	%g0, 	0x4, 	%fprs
	std	%l2,	[%l7 + 0x28]
	swap	[%l7 + 0x48],	%i7
	fnot2s	%f15,	%f11
	flush	%l7 + 0x58
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %l3
	ldxa	[%g0 + %l3] 0x20,	%i4
	fpsub32s	%f21,	%f14,	%f22
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%l5
	te	%xcc,	0x0
	ldsw	[%l7 + 0x7C],	%g2
	tne	%xcc,	0x3
	swap	[%l7 + 0x34],	%o0
	std	%f26,	[%l7 + 0x28]
	stbar
	std	%l4,	[%l7 + 0x28]
	ldsh	[%l7 + 0x28],	%l2
	wrpr	%i3,	0x03F5,	%cwp
	std	%f26,	[%l7 + 0x58]
	tcc	%icc,	0x6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %l5
	stxa	%i0,	[%g0 + %l5] 0x20
	ldd	[%l7 + 0x60],	%f8
	ldsw	[%l7 + 0x60],	%g1
	nop
	setx	loop_327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x1A],	%i6
	flush	%l7 + 0x38
	stw	%o7,	[%l7 + 0x68]
loop_327:
	nop
	set	0x10, %g1
	ldsw	[%l7 + %g1],	%o5
	st	%f16,	[%l7 + 0x54]
	nop
	set	0x68, %i0
	std	%g4,	[%l7 + %i0]
	ldsw	[%l7 + 0x68],	%i1
	ld	[%l7 + 0x5C],	%f20
	stbar
	nop
	set	0x7C, %g2
	ldsh	[%l7 + %g2],	%l1
	nop
	set	0x55, %i6
	stb	%o2,	[%l7 + %i6]
	sdivcc	%g3,	0x01CA,	%g7
	sth	%o1,	[%l7 + 0x30]
	prefetch	[%l7 + 0x60],	 0x1
	ldstub	[%l7 + 0x11],	%o6
	fba	%fcc1,	loop_328
	xorcc	%i5,	0x1E62,	%g6
	stw	%l6,	[%l7 + 0x58]
	st	%f22,	[%l7 + 0x78]
loop_328:
	ldstub	[%l7 + 0x28],	%o3
	flush	%l7 + 0x50
	movgu	%xcc,	%g5,	%i2
	ldsb	[%l7 + 0x5A],	%o4
	fcmpd	%fcc3,	%f28,	%f16
	ldsh	[%l7 + 0x78],	%l0
	stb	%i7,	[%l7 + 0x4C]
	std	%f28,	[%l7 + 0x10]
	movn	%icc,	%l3,	%i4
	std	%g2,	[%l7 + 0x60]
	ldsw	[%l7 + 0x48],	%l5
	ld	[%l7 + 0x24],	%f1
	fbue	%fcc0,	loop_329
	ld	[%l7 + 0x74],	%f7
	ldd	[%l7 + 0x78],	%f16
	std	%f20,	[%l7 + 0x68]
loop_329:
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x20
	nop
	set	0x20, %l1
	stxa	%l4,	[%g0 + %l1] 0x4f
	wrpr	%o0,	0x1073,	%tick
	alignaddr	%l2,	%i0,	%i3
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x18
	set	0x18, %i3
	stxa	%g1,	[%g0 + %i3] 0x4f
	stbar
	rd	%ccr,	%o7
	ldsw	[%l7 + 0x0C],	%i6
	std	%f12,	[%l7 + 0x50]
	std	%o4,	[%l7 + 0x18]
	ldx	[%l7 + 0x10],	%g4
	ldstub	[%l7 + 0x6C],	%i1
	ldsw	[%l7 + 0x20],	%l1
	stx	%o2,	[%l7 + 0x28]
	stb	%g3,	[%l7 + 0x7C]
	sll	%o1,	0x07,	%o6
	prefetch	[%l7 + 0x5C],	 0x1
	stw	%i5,	[%l7 + 0x2C]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x38
	set	0x38, %o0
	ldxa	[%g0 + %o0] 0x20,	%g7
	stw	%l6,	[%l7 + 0x58]
	stx	%g6,	[%l7 + 0x20]
	prefetch	[%l7 + 0x44],	 0x2
	nop
	set	0x48, %i5
	ldsb	[%l7 + %i5],	%o3
	fzeros	%f0
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %l2
	ldxa	[%g0 + %l2] 0x20,	%i2
	umulcc	%g5,	%o4,	%l0
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x10
	set	0x10, %o2
	ldxa	[%g0 + %o2] 0x4f,	%l3
	ldd	[%l7 + 0x58],	%f28
	edge16n	%i7,	%i4,	%l5
	ldsw	[%l7 + 0x58],	%g2
	nop
	set	0x17, %i1
	ldstub	[%l7 + %i1],	%l4
	stx	%o0,	[%l7 + 0x20]
	stb	%l2,	[%l7 + 0x52]
	prefetch	[%l7 + 0x64],	 0x1
	lduw	[%l7 + 0x60],	%i3
	lduw	[%l7 + 0x28],	%g1
	ldx	[%l7 + 0x78],	%o7
	sth	%i6,	[%l7 + 0x48]
	stw	%i0,	[%l7 + 0x40]
	flush	%l7 + 0x24
	std	%f22,	[%l7 + 0x60]
	movvc	%icc,	%o5,	%i1
	std	%g4,	[%l7 + 0x40]
	st	%f5,	[%l7 + 0x38]
	nop
	set	0x24, %l0
	ldsh	[%l7 + %l0],	%l1
	stw	%o2,	[%l7 + 0x68]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x8
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g3
	ldd	[%l7 + 0x50],	%o0
	st	%f13,	[%l7 + 0x64]
!Yo - got one - imm_asi 0x4f 
!And yo - immediate is 0x38
	set	0x38, %l4
	ldxa	[%g0 + %l4] 0x4f,	%i5
	sth	%g7,	[%l7 + 0x30]
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x20
	set	0x20, %g5
	ldxa	[%g0 + %g5] 0x20,	%o6
	stb	%g6,	[%l7 + 0x0D]
	tleu	%icc,	0x5
	ldstub	[%l7 + 0x2D],	%l6
!Yo - got one - imm_asi 0x20 
!And yo - immediate is 0x30
	set	0x30, %o5
	ldxa	[%g0 + %o5] 0x20,	%i2
	movg	%icc,	%g5,	%o4
	flush	%l7 + 0x28
	ldub	[%l7 + 0x3F],	%l0
	flush	%l7 + 0x44
	ldsb	[%l7 + 0x54],	%o3
	std	%i6,	[%l7 + 0x30]
	ldsh	[%l7 + 0x6E],	%l3
	std	%f18,	[%l7 + 0x10]
	wr	%i4,	0x193A,	%pic
	ldd	[%l7 + 0x28],	%f22
	ldsw	[%l7 + 0x2C],	%g2
	swap	[%l7 + 0x48],	%l5
	ldsh	[%l7 + 0x22],	%l4
	fmovde	%icc,	%f4,	%f4
	swap	[%l7 + 0x78],	%o0
	stb	%l2,	[%l7 + 0x1C]
	tn	%icc,	0x1
	sth	%g1,	[%l7 + 0x1A]
	fblg,a	%fcc2,	loop_330
	ldsb	[%l7 + 0x5C],	%i3
	ldsw	[%l7 + 0x24],	%i6
	flush	%l7 + 0x70
loop_330:
	edge32n	%i0,	%o5,	%i1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 6708
!	Type a   	: 332
!	Type cti   	: 330
!	Type x   	: 528
!	Type f   	: 547
!	Type i   	: 1555
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xA655EEAA
.word 0x6B8984B9
.word 0x9E424966
.word 0xC4163DE8
.word 0x9EE7D574
.word 0x62B3FFB0
.word 0xC177995B
.word 0xB8456B77
.word 0x4577E4CB
.word 0x76199D6F
.word 0x4709E27F
.word 0x35B0C8C7
.word 0x230BB972
.word 0x70BE7745
.word 0x8D2F0EA4
.word 0x66C9BDC2
.word 0xBD987306
.word 0xCDEC8536
.word 0x9CA1DC42
.word 0xE9C4C785
.word 0x2964337B
.word 0x48C0D12F
.word 0x87928502
.word 0xF52870CC
.word 0x16F3C51E
.word 0xD18192B2
.word 0xEF808290
.word 0xE7749829
.word 0x79E7DF7C
.word 0xFC90B875
.word 0xD72083FF
.word 0xFC0AEE39
.word 0x4E88FE18
.word 0xEF276E7E
.word 0x3F0EADA9
.word 0x504A0EF4
.word 0x0023D1B0
.word 0xA93FF3E9
.word 0x3C25CDD7
.word 0xC53CAC25
.word 0xE74561BA
.word 0x3490650F
.word 0x81F7B608
.word 0x73523770
.word 0x72D11030
.word 0xD22EE59B
.word 0x6F26C632
.word 0x89FEFDE9
.word 0x0FB42C45
.word 0x557F5341
.word 0xDFF8C508
.word 0x62F83170
.word 0x4FB39D81
.word 0xC8E9F4A4
.word 0xAAFC3433
.word 0xF543C243
.word 0x3D88B235
.word 0x8F61A1E0
.word 0x265DAF9B
.word 0x7440D90A
.word 0x1B103499
.word 0x040BF612
.word 0x48B8DB21
.word 0xE7EF3C7B
.end
