/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc11.s
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
#define PORTABLE_CORE
		
define(INIT_TH_FP_REG,
	`setx $3, %g4, %g5
	stx %g5, [$1]
	ldd    [$1], $2')

#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

#include "hboot.s"
	
/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	! Get TID/DIAG DATA AREA. Separate memory for each thread.
	ta	T_RD_THID
	mov	%o1, %l6
	setx	user_data_start, %g1, %l7
	ta	T_CHANGE_HPRIV
!
! Thread 0 Start
!
.global thread_0
thread_0:
	mov 	%l7, 	%g1
	!# Set %cwp for 8 windows
	!# This threads memory space into each %l7
	wrpr 	%g0, 	0x7, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x6, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x5, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x4, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x3, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x2, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x1, 	%cwp
	mov 	%g1, 	%l7
	wrpr 	%g0, 	0x0, 	%cwp
	mov 	%g1, 	%l7

	!# Set %fsr
	setx 	0x0000000000400000,	%l0,	%l6	!# no post process
	stx 	%l6, 	[%l7 + 0x0]	!# no post process
	ldx 	[%l7 + 0x0], 	%fsr	!# no post process

	wr 	%g0, 	0x80, 	%asi	!# no post process

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0xA,	%g2
	set	0xF,	%g3
	set	0xA,	%g4
	set	0x0,	%g5
	set	0xC,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x3,	%i1
	set	-0x5,	%i2
	set	-0x9,	%i3
	set	-0x3,	%i4
	set	-0x4,	%i5
	set	-0x5,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x574A24CC,	%l0
	set	0x67B770A6,	%l1
	set	0x3F23CCEE,	%l2
	set	0x7F5F1C99,	%l3
	set	0x54C814A3,	%l4
	set	0x7561A26A,	%l5
	set	0x2E40BEEC,	%l6
	!# Output registers
	set	-0x0468,	%o0
	set	0x05CB,	%o1
	set	0x17D8,	%o2
	set	0x1699,	%o3
	set	-0x15E7,	%o4
	set	0x0BAB,	%o5
	set	0x1422,	%o6
	set	0x0362,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9BB9D9084F702E84)
	INIT_TH_FP_REG(%l7,%f2,0xA01C27B1D7BD75CC)
	INIT_TH_FP_REG(%l7,%f4,0xB976053DF62C375B)
	INIT_TH_FP_REG(%l7,%f6,0x98C986586AA0DF84)
	INIT_TH_FP_REG(%l7,%f8,0x2160A5AA66EE5DFB)
	INIT_TH_FP_REG(%l7,%f10,0x02AA025BF8961B1E)
	INIT_TH_FP_REG(%l7,%f12,0xBDC4E72FC0E84520)
	INIT_TH_FP_REG(%l7,%f14,0xA784783ABF1E0C3E)
	INIT_TH_FP_REG(%l7,%f16,0x702CE4A31FB16059)
	INIT_TH_FP_REG(%l7,%f18,0x09E15A1DECD25638)
	INIT_TH_FP_REG(%l7,%f20,0x49FC10ED3823B53E)
	INIT_TH_FP_REG(%l7,%f22,0x17202D3BB5C3D3C9)
	INIT_TH_FP_REG(%l7,%f24,0x7574A93F1B5EA33B)
	INIT_TH_FP_REG(%l7,%f26,0xD0E25404FE89E321)
	INIT_TH_FP_REG(%l7,%f28,0xED6631D88E1C1BDD)
	INIT_TH_FP_REG(%l7,%f30,0xFAAA10FC946FFAA3)

	!# Execute Main Diag ..

	set	0x40, %l3
	stda	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x5C, %i0
	stha	%g4,	[%l7 + %i0] 0x81
	nop
	set	0x28, %o3
	stw	%o3,	[%l7 + %o3]
	wr	%i1,	%i3,	%y
	add	%g5,	%o7,	%g6
	nop
	set	0x14, %g6
	stw	%g3,	[%l7 + %g6]
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%o6
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf8
	membar	#Sync
	nop
	set	0x2E, %l4
	sth	%o1,	[%l7 + %l4]
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x89,	 1
	nop
	set	0x66, %l5
	stb	%i6,	[%l7 + %l5]
	nop
	set	0x10, %o7
	std	%l2,	[%l7 + %o7]
	nop
	set	0x48, %o4
	stw	%l6,	[%l7 + %o4]
	nop
	set	0x68, %o5
	prefetch	[%l7 + %o5],	 1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xeb,	%o2
	and	%l4,	%g2,	%i0
	set	0x48, %l0
	stwa	%i2,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x34, %i5
	ldsh	[%l7 + %i5],	%l1
	set	0x3C, %g7
	stwa	%l0,	[%l7 + %g7] 0xea
	membar	#Sync
	and	%g1,	%g7,	%l2
	nop
	set	0x64, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x0C, %i2
	ldsh	[%l7 + %i2],	%o4
	ba,a,pt	%icc,	loop_1
	nop
	set	0x3C, %i7
	stw	%o5,	[%l7 + %i7]
	bne,a,pt	%xcc,	loop_2
	and	%o0,	%i5,	%l5
loop_1:
	add	%i7,	%g4,	%i1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i3
loop_2:
	st	%f7,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x11, %g2
	ldstub	[%l7 + %g2],	%g5
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%g6
	set	0x3E, %o6
	stha	%g3,	[%l7 + %o6] 0xea
	membar	#Sync
	wr	%o6,	%o7,	%clear_softint
	nop
	set	0x61, %l1
	ldsb	[%l7 + %l1],	%o1
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%i6
	set	0x20, %i6
	stwa	%l3,	[%l7 + %i6] 0x80
	st	%fsr,	[%l7 + 0x50]
	fpsub32s	%f18,	%f11,	%f27
	set	0x24, %l6
	swapa	[%l7 + %l6] 0x89,	%i4
	and	%l6,	%o2,	%l4
	set	0x58, %g1
	stda	%i0,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x1F, %i3
	stba	%g2,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x32, %l3
	ldstub	[%l7 + %l3],	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%l0
	set	0x08, %i0
	stha	%g7,	[%l7 + %i0] 0xe3
	membar	#Sync
	ld	[%l7 + 0x40],	%f31
	nop
	set	0x76, %o2
	sth	%g1,	[%l7 + %o2]
	nop
	set	0x74, %g6
	ldub	[%l7 + %g6],	%l2
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%o4
	nop
	set	0x54, %o1
	swap	[%l7 + %o1],	%o4
	nop
	set	0x5C, %o3
	ldsb	[%l7 + %o3],	%o0
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xea,	%l4
	nop
	set	0x33, %o7
	ldub	[%l7 + %o7],	%g4
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%i0
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%o2
	set	0x2C, %o5
	stwa	%i7,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x50, %l2
	stda	%g4,	[%l7 + %l2] 0xe3
	membar	#Sync
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%g3
	nop
	set	0x50, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%o6
	set	0x58, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o7
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%o1
	nop
	set	0x44, %i7
	lduh	[%l7 + %i7],	%i3
	set	0x38, %g2
	stda	%i6,	[%l7 + %g2] 0x80
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x89
	nop
	set	0x3C, %g3
	swap	[%l7 + %g3],	%i4
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xea,	%i6
	nop
	set	0x72, %o6
	sth	%l3,	[%l7 + %o6]
	nop
	set	0x6E, %l1
	lduh	[%l7 + %l1],	%o2
	nop
	set	0x60, %i4
	stx	%l4,	[%l7 + %i4]
	nop
	set	0x20, %i6
	stx	%g2,	[%l7 + %i6]
	nop
	set	0x5C, %l6
	stw	%i0,	[%l7 + %l6]
	nop
	set	0x5C, %g1
	ldsh	[%l7 + %g1],	%i2
	set	0x1C, %l3
	stwa	%l0,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%g7
	add	%g1,	%l1,	%l2
	nop
	set	0x3C, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x58, %o2
	stxa	%o5,	[%l7 + %o2] 0x89
	or	%o4,	%i5,	%l5
	nop
	set	0x38, %g6
	std	%o0,	[%l7 + %g6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%g4
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%o3
	bgu	%xcc,	loop_3
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	and	%g5,	%i7,	%g6
	ld	[%l7 + 0x14],	%f5
loop_3:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%o7
	nop
	set	0x7A, %o1
	lduh	[%l7 + %o1],	%o6
	nop
	set	0x5C, %l4
	ldsh	[%l7 + %l4],	%o1
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xcc
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd8,	%f16
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd2
	add	%i6,	%i3,	%l6
	set	0x70, %l5
	stxa	%i4,	[%l7 + %l5] 0x89
	set	0x50, %o5
	sta	%f27,	[%l7 + %o5] 0x80
	set	0x58, %l2
	swapa	[%l7 + %l2] 0x81,	%o2
	ld	[%l7 + 0x2C],	%f4
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%l3
	set	0x64, %l0
	stwa	%g2,	[%l7 + %l0] 0xe2
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%i2
	fpadd16	%f12,	%f20,	%f18
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f22
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd8
	set	0x45, %g2
	stba	%l0,	[%l7 + %g2] 0xe2
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%g7
	nop
	set	0x66, %g4
	ldub	[%l7 + %g4],	%l1
	set	0x30, %g3
	lda	[%l7 + %g3] 0x88,	%f17
	bn,a	%icc,	loop_4
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%g1
	nop
	set	0x5E, %o6
	ldsb	[%l7 + %o6],	%l2
	nop
	set	0x70, %i2
	stw	%o4,	[%l7 + %i2]
loop_4:
	nop
	set	0x68, %i4
	std	%f26,	[%l7 + %i4]
	nop
	set	0x48, %i6
	stx	%fsr,	[%l7 + %i6]
	st	%f19,	[%l7 + 0x08]
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x89,	%o5
	set	0x54, %l1
	stwa	%l5,	[%l7 + %l1] 0x81
	set	0x58, %l3
	sta	%f11,	[%l7 + %l3] 0x88
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x80,	%f15
	set	0x3A, %i3
	stha	%o0,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x41, %o2
	stb	%i5,	[%l7 + %o2]
	set	0x60, %g6
	stwa	%g4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x28, %g1
	stx	%i1,	[%l7 + %g1]
	nop
	set	0x75, %g5
	ldstub	[%l7 + %g5],	%g5
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x81,	%i7
	nop
	set	0x42, %l4
	ldstub	[%l7 + %l4],	%g6
	nop
	set	0x6E, %o7
	sth	%g3,	[%l7 + %o7]
	wr	%o7,	%o3,	%pic
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x81,	%o1
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	wr	%i6,	%i3,	%set_softint
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f22
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%l6
	or	%i4,	%o2,	%l3
	nop
	set	0x54, %o5
	lduw	[%l7 + %o5],	%o6
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x89,	%l4
	nop
	set	0x12, %l0
	ldsb	[%l7 + %l0],	%i2
	set	0x24, %l2
	lda	[%l7 + %l2] 0x89,	%f11
	nop
	set	0x69, %i7
	stb	%g2,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g7
	nop
	set	0x58, %g7
	std	%f0,	[%l7 + %g7]
	or	%l0,	%l1,	%l2
	wr	%o4,	%g1,	%sys_tick
	or	%o5,	%o0,	%l5
	set	0x7C, %g4
	swapa	[%l7 + %g4] 0x88,	%i5
	set	0x74, %g3
	lda	[%l7 + %g3] 0x89,	%f31
	add	%g4,	%g5,	%i7
	st	%f27,	[%l7 + 0x20]
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%i1
	set	0x3C, %i1
	lda	[%l7 + %i1] 0x88,	%f8
	nop
	set	0x36, %o6
	ldsh	[%l7 + %o6],	%o7
	nop
	set	0x78, %i4
	stw	%g3,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%o3
	nop
	set	0x08, %l6
	stw	%o1,	[%l7 + %l6]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%i6
	and	%i4,	%o2,	%l6
	nop
	set	0x7A, %l1
	ldsb	[%l7 + %l1],	%l3
	fpadd32s	%f10,	%f7,	%f5
	add	%o6,	%l4,	%g2
	nop
	set	0x78, %i2
	std	%f14,	[%l7 + %i2]
	nop
	set	0x60, %l3
	lduh	[%l7 + %l3],	%i2
	nop
	set	0x28, %i0
	std	%i0,	[%l7 + %i0]
	nop
	set	0x7E, %o2
	ldsb	[%l7 + %o2],	%l0
	nop
	set	0x10, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x52, %g6
	ldsh	[%l7 + %g6],	%l1
	st	%f15,	[%l7 + 0x38]
	nop
	set	0x1E, %g1
	stb	%g7,	[%l7 + %g1]
	st	%f11,	[%l7 + 0x0C]
	st	%f30,	[%l7 + 0x14]
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x80,	 4
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%l2
	nop
	set	0x38, %l4
	lduw	[%l7 + %l4],	%i5
	ld	[%l7 + 0x44],	%f10
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x54, %o3
	stw	%i7,	[%l7 + %o3]
	st	%f21,	[%l7 + 0x60]
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%g6
	nop
	set	0x10, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x58, %o4
	std	%g4,	[%l7 + %o4]
	set	0x50, %o1
	stda	%o6,	[%l7 + %o1] 0x89
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%i0
	nop
	set	0x48, %l0
	std	%o2,	[%l7 + %l0]
	st	%f11,	[%l7 + 0x60]
	ld	[%l7 + 0x10],	%f31
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%o1
	nop
	set	0x08, %i5
	std	%f12,	[%l7 + %i5]
	nop
	set	0x48, %g7
	stw	%g3,	[%l7 + %g7]
	and	%i3,	%i4,	%o2
	add	%i6,	%l6,	%o6
	nop
	set	0x12, %i7
	ldstub	[%l7 + %i7],	%l3
	nop
	set	0x19, %g3
	stb	%g2,	[%l7 + %g3]
	nop
	set	0x62, %g4
	stb	%l4,	[%l7 + %g4]
	nop
	set	0x38, %g2
	stx	%i0,	[%l7 + %g2]
	add	%l0,	%i2,	%l1
	nop
	set	0x34, %o6
	lduw	[%l7 + %o6],	%g7
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x80,	%g0
	nop
	set	0x11, %i1
	ldub	[%l7 + %i1],	%o5
	nop
	set	0x48, %i6
	stx	%fsr,	[%l7 + %i6]
	or	%o0,	%l2,	%i5
	nop
	set	0x44, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x71, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l5
	nop
	set	0x22, %l3
	stb	%o4,	[%l7 + %l3]
	nop
	set	0x18, %i0
	std	%i6,	[%l7 + %i0]
	nop
	set	0x60, %o2
	stx	%g6,	[%l7 + %o2]
	nop
	set	0x0D, %i2
	ldsb	[%l7 + %i2],	%g5
	st	%f28,	[%l7 + 0x14]
	set	0x40, %g6
	stba	%o7,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x44, %i3
	prefetch	[%l7 + %i3],	 2
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x1C, %g5
	ldsw	[%l7 + %g5],	%i1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%o1
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f0
	nop
	set	0x48, %o7
	std	%f22,	[%l7 + %o7]
	and	%g3,	%o3,	%i4
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x81,	%i3
	ld	[%l7 + 0x74],	%f19
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x81,	%o2
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x10, %o4
	sta	%f25,	[%l7 + %o4] 0x80
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x78, %l5
	ldsw	[%l7 + %l5],	%l6
	set	0x12, %o5
	stha	%l3,	[%l7 + %o5] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	or	%o6,	%g2,	%i0
	set	0x48, %l2
	stha	%l4,	[%l7 + %l2] 0x80
	set	0x18, %l0
	swapa	[%l7 + %l0] 0x81,	%i2
	set	0x47, %g7
	stba	%l1,	[%l7 + %g7] 0x81
	set	0x70, %i7
	stda	%l0,	[%l7 + %i7] 0x81
	nop
	set	0x78, %g3
	std	%f12,	[%l7 + %g3]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f16
	nop
	set	0x70, %g2
	std	%f2,	[%l7 + %g2]
	nop
	set	0x64, %o6
	lduh	[%l7 + %o6],	%g1
	add	%o5,	%g7,	%l2
	nop
	set	0x40, %i5
	stb	%i5,	[%l7 + %i5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
	nop
	set	0x56, %l6
	lduh	[%l7 + %l6],	%l5
	nop
	set	0x54, %l3
	ldsh	[%l7 + %l3],	%i7
	nop
	set	0x44, %i0
	sth	%g6,	[%l7 + %i0]
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0
	set	0x3C, %l1
	stha	%g5,	[%l7 + %l1] 0xe3
	membar	#Sync
	st	%f27,	[%l7 + 0x48]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f0
	set	0x50, %i3
	stxa	%o7,	[%l7 + %i3] 0xea
	membar	#Sync
	and	%i1,	%o1,	%g3
	st	%f2,	[%l7 + 0x78]
	nop
	set	0x08, %i2
	ldsh	[%l7 + %i2],	%g4
	nop
	set	0x6C, %g5
	lduh	[%l7 + %g5],	%o3
	bg	%icc,	loop_5
	nop
	set	0x68, %l4
	sth	%i4,	[%l7 + %l4]
	be	%xcc,	loop_6
	nop
	set	0x28, %g1
	stx	%o2,	[%l7 + %g1]
loop_5:
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x35, %o7
	stba	%i3,	[%l7 + %o7] 0x81
loop_6:
	nop
	set	0x78, %o4
	ldsh	[%l7 + %o4],	%l6
	set	0x68, %o1
	stda	%l2,	[%l7 + %o1] 0x88
	nop
	set	0x46, %o3
	ldub	[%l7 + %o3],	%o6
	nop
	set	0x1E, %l5
	sth	%i6,	[%l7 + %l5]
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f2
	st	%fsr,	[%l7 + 0x4C]
	or	%i0,	%g2,	%l4
	nop
	set	0x38, %l2
	ldub	[%l7 + %l2],	%i2
	nop
	set	0x50, %l0
	prefetch	[%l7 + %l0],	 4
	st	%f13,	[%l7 + 0x20]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%l0
	nop
	set	0x28, %g3
	stw	%l1,	[%l7 + %g3]
	nop
	set	0x7C, %g4
	lduw	[%l7 + %g4],	%g1
	and	%g7,	%o5,	%i5
	nop
	set	0x11, %i7
	ldstub	[%l7 + %i7],	%l2
	nop
	set	0x28, %g2
	stx	%o0,	[%l7 + %g2]
	nop
	set	0x18, %o6
	stw	%i7,	[%l7 + %o6]
	set	0x08, %i5
	stda	%l4,	[%l7 + %i5] 0x88
	nop
	set	0x40, %i1
	std	%g6,	[%l7 + %i1]
	nop
	set	0x30, %i6
	ldsh	[%l7 + %i6],	%g5
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%o7
	set	0x58, %i4
	stxa	%i1,	[%l7 + %i4] 0x89
	nop
	set	0x4C, %i0
	sth	%o4,	[%l7 + %i0]
	nop
	set	0x5C, %o2
	swap	[%l7 + %o2],	%g3
	st	%f16,	[%l7 + 0x1C]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o1
	nop
	set	0x68, %l3
	sth	%o3,	[%l7 + %l3]
	nop
	set	0x48, %l1
	std	%f0,	[%l7 + %l1]
	set	0x0C, %i3
	stwa	%o2,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x64, %i2
	sta	%f17,	[%l7 + %i2] 0x80
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x89,	%i4
	set	0x6C, %l4
	swapa	[%l7 + %l4] 0x89,	%l6
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%i2
	set	0x78, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o6
	nop
	set	0x4C, %g1
	stw	%i6,	[%l7 + %g1]
	or	%l3,	%i0,	%g2
	nop
	set	0x54, %o4
	ldstub	[%l7 + %o4],	%l4
	fpadd16	%f14,	%f6,	%f4
	nop
	set	0x6D, %o1
	ldub	[%l7 + %o1],	%i2
	nop
	set	0x2E, %o7
	sth	%l1,	[%l7 + %o7]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%g7
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x81,	%l0
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%f30
	set	0x5B, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i5
	nop
	set	0x1C, %o3
	prefetch	[%l7 + %o3],	 1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%o5
	nop
	set	0x20, %l0
	lduw	[%l7 + %l0],	%i7
	set	0x50, %g3
	stba	%l5,	[%l7 + %g3] 0x89
	nop
	set	0x1B, %g4
	ldub	[%l7 + %g4],	%o0
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%g6
	set	0x78, %g2
	stxa	%g5,	[%l7 + %g2] 0x80
	nop
	set	0x0F, %o6
	ldub	[%l7 + %o6],	%i1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%o7
	nop
	set	0x10, %g7
	std	%g2,	[%l7 + %g7]
	nop
	set	0x4D, %i5
	stb	%g4,	[%l7 + %i5]
	nop
	set	0x40, %i1
	ldsh	[%l7 + %i1],	%o1
	nop
	set	0x2C, %l6
	prefetch	[%l7 + %l6],	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%l6
	set	0x48, %i4
	sta	%f28,	[%l7 + %i4] 0x80
	nop
	set	0x76, %i0
	lduh	[%l7 + %i0],	%i3
	set	0x27, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i6
	nop
	set	0x42, %o2
	ldsh	[%l7 + %o2],	%l3
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf1
	membar	#Sync
	set	0x4C, %i3
	stha	%o6,	[%l7 + %i3] 0x80
	st	%f25,	[%l7 + 0x44]
	nop
	set	0x40, %l3
	std	%f10,	[%l7 + %l3]
	ld	[%l7 + 0x30],	%f23
	or	%g2,	%l4,	%i0
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	set	0x2C, %i2
	swapa	[%l7 + %i2] 0x81,	%i2
	and	%g7,	%g1,	%l0
	set	0x14, %l4
	stha	%l2,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x89
	nop
	set	0x50, %g1
	ldsw	[%l7 + %g1],	%i5
	nop
	set	0x68, %o4
	swap	[%l7 + %o4],	%i7
	set	0x40, %o1
	stxa	%l5,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x36, %g6
	sth	%o5,	[%l7 + %g6]
	nop
	set	0x75, %o7
	stb	%o0,	[%l7 + %o7]
	fpadd32s	%f21,	%f21,	%f10
	nop
	set	0x70, %l5
	swap	[%l7 + %l5],	%g5
	or	%g6,	%i1,	%o7
	nop
	set	0x18, %o5
	stx	%g3,	[%l7 + %o5]
	bne,a,pn	%icc,	loop_7
	and	%g4,	%o4,	%o1
	wr	%o2,	%i4,	%softint
	set	0x74, %o3
	lda	[%l7 + %o3] 0x81,	%f25
loop_7:
	nop
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xeb,	%i6
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%i2
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x48, %i7
	std	%o2,	[%l7 + %i7]
	bleu,a,pt	%icc,	loop_8
	st	%f8,	[%l7 + 0x68]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
loop_8:
	ba,a,pt	%xcc,	loop_9
	and	%o6,	%l3,	%l4
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe3,	%i0
loop_9:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%i2
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x80,	%g2
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%g6
	nop
	set	0x40, %o6
	stx	%l0,	[%l7 + %o6]
	fpsub32s	%f26,	%f4,	%f23
	and	%g1,	%l2,	%i7
	set	0x68, %i1
	lda	[%l7 + %i1] 0x81,	%f30
	and	%l5,	%i5,	%o0
	set	0x58, %i4
	sta	%f12,	[%l7 + %i4] 0x80
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%g5
	nop
	set	0x46, %l6
	ldub	[%l7 + %l6],	%g6
	and	%i1,	%o7,	%g3
	nop
	set	0x5E, %i6
	ldub	[%l7 + %i6],	%g4
	set	0x48, %l1
	stda	%o4,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x34, %o2
	lda	[%l7 + %o2] 0x81,	%f10
	set	0x28, %i3
	stxa	%o1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x60, %l3
	stw	%o5,	[%l7 + %l3]
	set	0x68, %i2
	swapa	[%l7 + %i2] 0x80,	%i4
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f16
	nop
	set	0x34, %o0
	swap	[%l7 + %o0],	%o2
	nop
	set	0x78, %l4
	lduh	[%l7 + %l4],	%l6
	st	%f31,	[%l7 + 0x20]
	nop
	set	0x70, %g1
	std	%i2,	[%l7 + %g1]
	set	0x48, %o1
	stxa	%i6,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x64, %o4
	stwa	%o6,	[%l7 + %o4] 0x89
	and	%l3,	%l4,	%o3
	nop
	set	0x68, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x18, %o7
	swap	[%l7 + %o7],	%i2
	set	0x29, %l5
	stba	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x18, %o5
	stxa	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%l0
	nop
	set	0x38, %l2
	stx	%g1,	[%l7 + %l2]
	nop
	set	0x56, %g4
	ldsb	[%l7 + %g4],	%g7
	fpsub32	%f30,	%f14,	%f2
	st	%f13,	[%l7 + 0x58]
	nop
	set	0x60, %i7
	ldsw	[%l7 + %i7],	%l2
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	nop
	set	0x30, %o3
	ldsb	[%l7 + %o3],	%i7
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%o0
	nop
	set	0x50, %g2
	std	%f22,	[%l7 + %g2]
	set	0x58, %o6
	stda	%i4,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x30, %i1
	stda	%g6,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x89
	ld	[%l7 + 0x08],	%f3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%o7
	set	0x70, %i0
	sta	%f27,	[%l7 + %i0] 0x89
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xca
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x81,	%i1
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 0
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%g2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o4
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f30
	wr	%o1,	%o5,	%clear_softint
	fpadd32s	%f28,	%f15,	%f29
	nop
	set	0x21, %l3
	ldsb	[%l7 + %l3],	%o2
	nop
	set	0x58, %o2
	lduh	[%l7 + %o2],	%i4
	or	%i3,	%l6,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%l4
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f0
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f18
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%l3
	set	0x42, %l4
	stha	%o3,	[%l7 + %l4] 0x89
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%l0
	set	0x10, %o1
	stxa	%i2,	[%l7 + %o1] 0x89
	set	0x24, %g6
	swapa	[%l7 + %g6] 0x89,	%g2
	set	0x26, %o4
	stba	%l0,	[%l7 + %o4] 0x88
	nop
	set	0x72, %o7
	stb	%i0,	[%l7 + %o7]
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%g1
	set	0x64, %o5
	lda	[%l7 + %o5] 0x81,	%f12
	nop
	set	0x74, %l2
	stw	%g7,	[%l7 + %l2]
	nop
	nop
	setx	0x85395E1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x56639B17,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f13,	%f18
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%l2
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x89,	%o0
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc4
	set	0x50, %i7
	stwa	%l5,	[%l7 + %i7] 0xe2
	membar	#Sync
	st	%f26,	[%l7 + 0x68]
	set	0x08, %o3
	stda	%i4,	[%l7 + %o3] 0x88
	nop
	set	0x20, %g3
	stw	%g6,	[%l7 + %g3]
	nop
	set	0x5C, %g7
	ldsh	[%l7 + %g7],	%g5
	nop
	set	0x4E, %o6
	ldsh	[%l7 + %o6],	%o7
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x89,	 3
	nop
	set	0x40, %i5
	stx	%g4,	[%l7 + %i5]
	nop
	set	0x0C, %g2
	lduw	[%l7 + %g2],	%o4
	add	%o1,	%g3,	%o2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%i3
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%o5
	set	0x14, %i6
	sta	%f29,	[%l7 + %i6] 0x89
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%l6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xcc
	set	0x28, %i3
	stda	%o6,	[%l7 + %i3] 0x89
	nop
	set	0x50, %l3
	sth	%l4,	[%l7 + %l3]
	set	0x38, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l3
	nop
	set	0x57, %i0
	stb	%o3,	[%l7 + %i0]
	nop
	set	0x68, %g5
	swap	[%l7 + %g5],	%l1
	bge,a,pn	%icc,	loop_10
	nop
	set	0x10, %i2
	std	%i2,	[%l7 + %i2]
	nop
	set	0x60, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x0E, %o0
	stba	%i6,	[%l7 + %o0] 0x89
loop_10:
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	st	%f28,	[%l7 + 0x08]
	set	0x7C, %g1
	sta	%f11,	[%l7 + %g1] 0x81
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	nop
	set	0x50, %o7
	std	%f10,	[%l7 + %o7]
	add	%i0,	%l0,	%g1
	set	0x24, %l5
	sta	%f11,	[%l7 + %l5] 0x89
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%l2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%l5
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x88,	%g7
	st	%f10,	[%l7 + 0x44]
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%g6
	or	%i5,	%g5,	%i1
	nop
	set	0x08, %l2
	ldsw	[%l7 + %l2],	%g4
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x89,	 4
	set	0x08, %i7
	sta	%f14,	[%l7 + %i7] 0x89
	set	0x28, %g4
	stda	%o4,	[%l7 + %g4] 0x81
	nop
	set	0x3C, %o3
	lduw	[%l7 + %o3],	%g3
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x88,	 1
	set	0x19, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o1
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x88,	%i4
	nop
	set	0x30, %g2
	lduw	[%l7 + %g2],	%o5
	and	%o6,	%l6,	%l4
	st	%f6,	[%l7 + 0x74]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	nop
	set	0x4D, %i1
	stb	%l3,	[%l7 + %i1]
	nop
	set	0x40, %i6
	swap	[%l7 + %i6],	%o3
	nop
	nop
	setx	0x21195078,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xDF283EB4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f2,	%f30
	nop
	set	0x34, %l6
	ldub	[%l7 + %l6],	%i2
	nop
	set	0x17, %l1
	stb	%i6,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x76, %l3
	ldub	[%l7 + %l3],	%l1
	set	0x24, %o2
	sta	%f21,	[%l7 + %o2] 0x81
	set	0x18, %i3
	stda	%g2,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x3C, %g5
	lduh	[%l7 + %g5],	%i0
	and	%l0,	%g1,	%l2
	nop
	set	0x5C, %i0
	ldsh	[%l7 + %i0],	%o0
	fpsub16	%f28,	%f8,	%f14
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x70, %i2
	ldsh	[%l7 + %i2],	%i7
	nop
	set	0x30, %o0
	std	%f30,	[%l7 + %o0]
	nop
	set	0x1C, %o1
	stb	%l5,	[%l7 + %o1]
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%g6
	add	%g7,	%i5,	%i1
	nop
	set	0x78, %l4
	std	%g4,	[%l7 + %l4]
	fpsub16	%f16,	%f10,	%f16
	set	0x70, %o7
	stwa	%g5,	[%l7 + %o7] 0x89
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	set	0x29, %g6
	stba	%g3,	[%l7 + %g6] 0x81
	set	0x50, %o4
	stxa	%o4,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%o0
	set	0x18, %l0
	stxa	%i3,	[%l7 + %l0] 0x81
	nop
	set	0x18, %i7
	std	%i4,	[%l7 + %i7]
	and	%o5,	%o2,	%l6
	wr	%o6,	%l4,	%sys_tick
	and	%l3,	%i2,	%o3
	nop
	set	0x0E, %g4
	sth	%l1,	[%l7 + %g4]
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x80,	 3
	nop
	set	0x68, %g7
	std	%i0,	[%l7 + %g7]
	nop
	set	0x78, %o6
	lduh	[%l7 + %o6],	%l0
	nop
	set	0x49, %o3
	ldsb	[%l7 + %o3],	%g1
	set	0x54, %g3
	swapa	[%l7 + %g3] 0x89,	%l2
	ld	[%l7 + 0x74],	%f26
	nop
	set	0x68, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x60, %i4
	std	%f8,	[%l7 + %i4]
	nop
	set	0x52, %i5
	sth	%i7,	[%l7 + %i5]
	wr	%o0,	%l5,	%softint
	nop
	set	0x50, %i1
	stw	%g6,	[%l7 + %i1]
	nop
	set	0x0C, %l6
	lduh	[%l7 + %l6],	%i5
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%g6
	st	%fsr,	[%l7 + 0x40]
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x80,	%i1
	bne,pt	%xcc,	loop_11
	nop
	set	0x51, %o2
	ldub	[%l7 + %o2],	%g5
	fpadd32	%f28,	%f8,	%f22
	and	%g4,	%g3,	%o4
loop_11:
	nop
	set	0x20, %i3
	lda	[%l7 + %i3] 0x89,	%f2
	bgu,a,pt	%xcc,	loop_12
	nop
	set	0x70, %g5
	stb	%o1,	[%l7 + %g5]
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%o6
	nop
	set	0x0C, %i2
	ldsw	[%l7 + %i2],	%i3
loop_12:
	add	%i4,	%o5,	%l6
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x88,	%o2
	nop
	set	0x3C, %g1
	swap	[%l7 + %g1],	%l4
	set	0x18, %i0
	sta	%f22,	[%l7 + %i0] 0x88
	add	%o6,	%l3,	%o3
	set	0x18, %l4
	stda	%i2,	[%l7 + %l4] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%i0
	add	%l0,	%g1,	%g2
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x69, %o4
	stb	%l2,	[%l7 + %o4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o0
	set	0x14, %o5
	stwa	%l5,	[%l7 + %o5] 0xea
	membar	#Sync
	and	%g6,	%i7,	%g7
	nop
	set	0x18, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x50, %o7
	stw	%i1,	[%l7 + %o7]
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%g5
	nop
	set	0x2C, %i7
	ldstub	[%l7 + %i7],	%g4
	nop
	set	0x72, %g7
	ldsh	[%l7 + %g7],	%i5
	nop
	set	0x37, %o6
	ldub	[%l7 + %o6],	%o4
	set	0x1C, %l2
	lda	[%l7 + %l2] 0x80,	%f30
	nop
	set	0x68, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x6C, %g3
	stw	%o1,	[%l7 + %g3]
	set	0x1C, %i4
	sta	%f15,	[%l7 + %i4] 0x89
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x34, %i5
	swapa	[%l7 + %i5] 0x80,	%o7
	fpadd16s	%f12,	%f19,	%f28
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f20
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf0
	membar	#Sync
	and	%i3,	%g3,	%i4
	set	0x28, %o2
	stda	%o4,	[%l7 + %o2] 0xe3
	membar	#Sync
	fpadd32s	%f25,	%f24,	%f20
	set	0x1D, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l6
	wr	%o2,	%o6,	%softint
	ba	%icc,	loop_13
	nop
	set	0x68, %g5
	std	%l4,	[%l7 + %g5]
	nop
	set	0x1B, %l3
	stb	%l3,	[%l7 + %l3]
	set	0x18, %i3
	sta	%f20,	[%l7 + %i3] 0x81
loop_13:
	nop
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	nop
	set	0x14, %o1
	lduw	[%l7 + %o1],	%i2
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf0
	membar	#Sync
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%l1
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%i0
	nop
	set	0x58, %l4
	stw	%l0,	[%l7 + %l4]
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f26
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x81,	%o3
	set	0x53, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x4E, %o5
	stba	%o0,	[%l7 + %o5] 0x88
	nop
	set	0x78, %g4
	std	%f4,	[%l7 + %g4]
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x88,	 2
	set	0x54, %g7
	lda	[%l7 + %g7] 0x81,	%f30
	nop
	set	0x48, %o6
	stx	%g6,	[%l7 + %o6]
	nop
	set	0x0C, %l2
	ldsw	[%l7 + %l2],	%l2
	set	0x0F, %o7
	stba	%i7,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x20, %g3
	stx	%i1,	[%l7 + %g3]
	set	0x7A, %i4
	stba	%g7,	[%l7 + %i4] 0x89
	ld	[%l7 + 0x34],	%f2
	nop
	set	0x63, %o3
	ldsb	[%l7 + %o3],	%g5
	nop
	set	0x22, %g2
	stb	%i5,	[%l7 + %g2]
	and	%o4,	%o1,	%g4
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%o6
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%g3
	nop
	set	0x6A, %i6
	sth	%i3,	[%l7 + %i6]
	set	0x4C, %o2
	stwa	%i4,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x5B, %l6
	ldstub	[%l7 + %l6],	%l6
	nop
	set	0x20, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x48, %l1
	prefetch	[%l7 + %l1],	 2
	set	0x10, %l3
	sta	%f24,	[%l7 + %l3] 0x81
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f18
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f8
	set	0x60, %o0
	stda	%o4,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x18, %g1
	swap	[%l7 + %g1],	%o6
	nop
	set	0x5A, %i0
	ldub	[%l7 + %i0],	%l4
	nop
	set	0x30, %l5
	ldsw	[%l7 + %l5],	%o2
	set	0x60, %l4
	stda	%i2,	[%l7 + %l4] 0x89
	st	%f1,	[%l7 + 0x5C]
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x81,	%f23
	set	0x38, %i2
	stxa	%l3,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x89,	%l1
	nop
	set	0x5E, %l0
	ldstub	[%l7 + %l0],	%i0
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	nop
	set	0x0A, %i7
	ldub	[%l7 + %i7],	%o3
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f0
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x80,	%g2
	set	0x64, %l2
	sta	%f24,	[%l7 + %l2] 0x81
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xd8
	set	0x18, %g3
	stxa	%i6,	[%l7 + %g3] 0x81
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x80,	%g0
	set	0x78, %o3
	stda	%l4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x6B, %g2
	ldub	[%l7 + %g2],	%g6
	nop
	set	0x0C, %i1
	ldsh	[%l7 + %i1],	%o0
	or	%l2,	%i1,	%i7
	and	%g5,	%i5,	%g7
	nop
	set	0x26, %i5
	ldsh	[%l7 + %i5],	%o1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xcc
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%o7
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%g2
	nop
	set	0x0C, %l6
	sth	%i3,	[%l7 + %l6]
	nop
	set	0x7C, %g5
	lduh	[%l7 + %g5],	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i4
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%o4
	nop
	set	0x66, %o2
	ldub	[%l7 + %o2],	%l4
	nop
	set	0x1E, %l3
	stb	%o6,	[%l7 + %l3]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x81
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x89,	%i2
	nop
	set	0x54, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x48, %i0
	ldxa	[%l7 + %i0] 0x88,	%o2
	nop
	set	0x26, %l5
	ldsh	[%l7 + %l5],	%l1
	nop
	set	0x44, %g1
	swap	[%l7 + %g1],	%l3
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%i0
	or	%o3,	%l0,	%g2
	set	0x3D, %i2
	stba	%i6,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f0
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 3
	set	0x49, %i7
	ldstuba	[%l7 + %i7] 0x88,	%g1
	set	0x50, %g4
	stwa	%l5,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x54, %g7
	ldsw	[%l7 + %g7],	%g6
	nop
	set	0x74, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x58, %o7
	stwa	%l2,	[%l7 + %o7] 0x89
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%o0
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%g5
	nop
	set	0x68, %g3
	stb	%i5,	[%l7 + %g3]
	nop
	set	0x13, %o3
	ldub	[%l7 + %o3],	%i7
	set	0x64, %g2
	lda	[%l7 + %g2] 0x89,	%f4
	nop
	set	0x48, %o5
	ldsw	[%l7 + %o5],	%o1
	add	%o4,	%o7,	%g7
	nop
	set	0x50, %i5
	std	%g2,	[%l7 + %i5]
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%g4
	nop
	set	0x7D, %i1
	ldub	[%l7 + %i1],	%i3
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x81,	 3
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%o5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%o6
	nop
	set	0x72, %l1
	lduh	[%l7 + %l1],	%i2
	nop
	set	0x1E, %o2
	sth	%o2,	[%l7 + %o2]
	set	0x3A, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l1
	nop
	set	0x2C, %i6
	ldsw	[%l7 + %i6],	%l3
	set	0x78, %i3
	stwa	%i0,	[%l7 + %i3] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f0
	nop
	set	0x20, %o1
	stx	%g2,	[%l7 + %o1]
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xe3,	%g0
	nop
	set	0x62, %g6
	lduh	[%l7 + %g6],	%o3
	nop
	set	0x20, %g1
	std	%f30,	[%l7 + %g1]
	set	0x6C, %i2
	stba	%g6,	[%l7 + %i2] 0x89
	set	0x68, %l4
	stwa	%l2,	[%l7 + %l4] 0x89
	nop
	set	0x7F, %l0
	stb	%l5,	[%l7 + %l0]
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%o0
	or	%i1,	%g5,	%i5
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x89,	%i6
	or	%o1,	%o4,	%g7
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xd0
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe2,	%o6
	nop
	set	0x16, %o6
	sth	%g4,	[%l7 + %o6]
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f2
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	set	0x50, %g2
	stwa	%i3,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xeb,	%o4
	set	0x08, %o5
	stda	%l4,	[%l7 + %o5] 0x88
	set	0x10, %i5
	stda	%i4,	[%l7 + %i5] 0x80
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xea,	%o6
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x88,	 1
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x80,	 2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	nop
	set	0x50, %i4
	stw	%l3,	[%l7 + %i4]
	nop
	set	0x69, %o2
	ldub	[%l7 + %o2],	%l1
	set	0x28, %l3
	stxa	%i0,	[%l7 + %l3] 0x81
	set	0x16, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l0
	nop
	set	0x40, %i3
	std	%f18,	[%l7 + %i3]
	nop
	set	0x68, %o1
	std	%g2,	[%l7 + %o1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%l6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%g1
	set	0x5C, %i0
	stha	%g6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x2C, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%l2
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%o0
	nop
	set	0x68, %l5
	stx	%l5,	[%l7 + %l5]
	ld	[%l7 + 0x70],	%f29
	nop
	set	0x40, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f0
	nop
	set	0x68, %i7
	stw	%g5,	[%l7 + %i7]
	nop
	set	0x41, %o4
	stb	%i5,	[%l7 + %o4]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i7
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	set	0x42, %g4
	stha	%o4,	[%l7 + %g4] 0x89
	fpadd32s	%f12,	%f24,	%f2
	set	0x58, %o7
	sta	%f8,	[%l7 + %o7] 0x89
	wr	%o7,	%g4,	%set_softint
	set	0x64, %o6
	sta	%f24,	[%l7 + %o6] 0x80
	nop
	set	0x18, %l2
	std	%f20,	[%l7 + %l2]
	nop
	set	0x48, %o3
	std	%g6,	[%l7 + %o3]
	nop
	set	0x70, %g2
	swap	[%l7 + %g2],	%g3
	set	0x38, %g3
	stxa	%i3,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%o5
	set	0x7D, %i5
	stba	%i4,	[%l7 + %i5] 0x88
	set	0x28, %o5
	sta	%f24,	[%l7 + %o5] 0x81
	add	%l4,	%o2,	%o6
	nop
	set	0x11, %l6
	ldstub	[%l7 + %l6],	%i2
	set	0x44, %g5
	sta	%f12,	[%l7 + %g5] 0x80
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%l1
	nop
	set	0x54, %i4
	stw	%l3,	[%l7 + %i4]
	nop
	set	0x73, %i1
	stb	%l0,	[%l7 + %i1]
	add	%g2,	%i6,	%i0
	nop
	set	0x28, %o2
	ldsb	[%l7 + %o2],	%l6
	nop
	set	0x08, %i6
	lduh	[%l7 + %i6],	%g1
	set	0x2C, %i3
	stwa	%o3,	[%l7 + %i3] 0x81
	set	0x78, %o1
	stda	%l2,	[%l7 + %o1] 0x88
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc8
	wr	%g6,	%l5,	%set_softint
	add	%g5,	%o0,	%i1
	nop
	set	0x7C, %o0
	ldub	[%l7 + %o0],	%i5
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%i7
	nop
	set	0x42, %l3
	stb	%o4,	[%l7 + %l3]
	add	%o1,	%o7,	%g4
	st	%fsr,	[%l7 + 0x1C]
	fpadd32	%f0,	%f8,	%f16
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x81,	 2
	st	%f6,	[%l7 + 0x78]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd0
	or	%g3,	%i3,	%i4
	nop
	set	0x20, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x50, %i2
	std	%f24,	[%l7 + %i2]
	set	0x28, %o4
	lda	[%l7 + %o4] 0x89,	%f27
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%l4
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%f6
	ld	[%l7 + 0x18],	%f6
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x88,	%i2
	nop
	set	0x0D, %o7
	ldub	[%l7 + %o7],	%o6
	and	%l3,	%l0,	%l1
	st	%f0,	[%l7 + 0x40]
	nop
	set	0x40, %l2
	stx	%i6,	[%l7 + %l2]
	or	%i0,	%l6,	%g1
	set	0x78, %o3
	stha	%g2,	[%l7 + %o3] 0x88
	wr	%l2,	%g6,	%clear_softint
	wr	%o3,	%l5,	%sys_tick
	nop
	set	0x34, %o6
	stw	%o0,	[%l7 + %o6]
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x88,	%i1
	and	%g5,	%i5,	%i7
	nop
	set	0x46, %l0
	sth	%o1,	[%l7 + %l0]
	set	0x66, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%g4
	bge,a,pn	%icc,	loop_14
	nop
	set	0x0C, %o5
	lduh	[%l7 + %o5],	%g3
	bne,pn	%xcc,	loop_15
	nop
	set	0x18, %l6
	stw	%g7,	[%l7 + %l6]
loop_14:
	fpsub32	%f16,	%f14,	%f10
	set	0x71, %g5
	stba	%i4,	[%l7 + %g5] 0x80
loop_15:
	nop
	set	0x70, %i5
	stxa	%o5,	[%l7 + %i5] 0x89
	nop
	set	0x0C, %l1
	stw	%o2,	[%l7 + %l1]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%i2
	set	0x3C, %i1
	sta	%f14,	[%l7 + %i1] 0x81
	nop
	set	0x44, %o2
	stw	%o6,	[%l7 + %o2]
	set	0x58, %i6
	stda	%l2,	[%l7 + %i6] 0x81
	nop
	set	0x70, %i4
	stx	%l0,	[%l7 + %i4]
	set	0x28, %i3
	swapa	[%l7 + %i3] 0x89,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1AE, 	%sys_tick_cmpr
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f12
	nop
	set	0x40, %o0
	stx	%l6,	[%l7 + %o0]
	set	0x78, %i0
	stxa	%l1,	[%l7 + %i0] 0x88
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%g1
	add	%g2,	%g6,	%l2
	nop
	set	0x76, %g6
	sth	%l5,	[%l7 + %g6]
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%o0
	nop
	set	0x4C, %g1
	swap	[%l7 + %g1],	%o3
	st	%f24,	[%l7 + 0x08]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%g5
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%i4
	nop
	set	0x32, %i2
	sth	%o1,	[%l7 + %i2]
	add	%o4,	%i7,	%o7
	st	%f31,	[%l7 + 0x40]
	and	%g3,	%g4,	%g7
	set	0x38, %i7
	stxa	%o5,	[%l7 + %i7] 0x80
	fpadd32s	%f6,	%f24,	%f18
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%l0
	and	%i3,	%l3,	%i6
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f0
	set	0x74, %g4
	lda	[%l7 + %g4] 0x80,	%f0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%l6
	set	0x0C, %o4
	swapa	[%l7 + %o4] 0x81,	%l1
	nop
	set	0x14, %o7
	ldub	[%l7 + %o7],	%g1
	nop
	set	0x78, %l2
	stw	%g6,	[%l7 + %l2]
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	nop
	nop
	setx	0xBA0B8300,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x758138ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f13,	%f9
	nop
	set	0x70, %o3
	stx	%l5,	[%l7 + %o3]
	nop
	set	0x74, %g2
	ldstub	[%l7 + %g2],	%l2
	nop
	set	0x3F, %l0
	ldub	[%l7 + %l0],	%o0
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%o3
	set	0x2C, %o5
	sta	%f6,	[%l7 + %o5] 0x81
	ld	[%l7 + 0x5C],	%f8
	set	0x68, %l6
	stwa	%i1,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x78, %g5
	lda	[%l7 + %g5] 0x89,	%f11
	set	0x60, %l1
	stda	%g4,	[%l7 + %l1] 0x80
	or	%o1,	%o4,	%i5
	or	%i7,	%g3,	%o7
	nop
	set	0x38, %i5
	std	%g4,	[%l7 + %i5]
	set	0x14, %i1
	stwa	%g7,	[%l7 + %i1] 0x81
	st	%fsr,	[%l7 + 0x40]
	set	0x61, %o2
	stba	%o2,	[%l7 + %o2] 0x80
	nop
	set	0x38, %i6
	ldsh	[%l7 + %i6],	%o5
	nop
	set	0x5C, %i4
	swap	[%l7 + %i4],	%i4
	nop
	set	0x0E, %o1
	ldsh	[%l7 + %o1],	%i2
	nop
	set	0x4A, %i3
	ldsb	[%l7 + %i3],	%o6
	nop
	set	0x42, %o0
	lduh	[%l7 + %o0],	%l0
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x1B, %i0
	ldub	[%l7 + %i0],	%i3
	and	%l3,	%i6,	%i0
	nop
	set	0x38, %g6
	std	%f10,	[%l7 + %g6]
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x80,	 2
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%l1
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x88,	%f18
	set	0x44, %i7
	sta	%f15,	[%l7 + %i7] 0x80
	nop
	set	0x68, %i2
	stx	%g1,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x4E, %g7
	ldsh	[%l7 + %g7],	%l6
	set	0x3C, %o4
	lda	[%l7 + %o4] 0x88,	%f15
	set	0x70, %o7
	stxa	%g6,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x78, %l2
	stda	%l4,	[%l7 + %l2] 0x80
	set	0x74, %o6
	stha	%g2,	[%l7 + %o6] 0x89
	nop
	set	0x34, %g4
	lduw	[%l7 + %g4],	%o0
	set	0x48, %g2
	stxa	%o3,	[%l7 + %g2] 0x80
	nop
	set	0x21, %l0
	stb	%i1,	[%l7 + %l0]
	add	%g5,	%o1,	%l2
	nop
	set	0x2A, %g3
	ldsb	[%l7 + %g3],	%o4
	set	0x30, %o3
	sta	%f27,	[%l7 + %o3] 0x88
	set	0x1C, %o5
	sta	%f19,	[%l7 + %o5] 0x89
	set	0x18, %g5
	stda	%i4,	[%l7 + %g5] 0x89
	set	0x7C, %l6
	lda	[%l7 + %l6] 0x89,	%f6
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe2,	%g2
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%o6
	add	%i7,	%g4,	%g7
	and	%o2,	%o5,	%i2
	ld	[%l7 + 0x10],	%f15
	set	0x68, %l1
	stwa	%i4,	[%l7 + %l1] 0x89
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd2
	nop
	set	0x41, %i4
	ldstub	[%l7 + %i4],	%l0
	set	0x20, %o1
	lda	[%l7 + %o1] 0x88,	%f26
	st	%fsr,	[%l7 + 0x08]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd2,	%f16
	nop
	set	0x38, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x34, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x50, %l3
	std	%f6,	[%l7 + %l3]
	nop
	set	0x20, %g6
	std	%f14,	[%l7 + %g6]
	add	%o6,	%l3,	%i3
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%l6
	set	0x5D, %l5
	stba	%l4,	[%l7 + %l5] 0x89
	nop
	set	0x30, %i7
	stb	%g6,	[%l7 + %i7]
	set	0x6C, %g1
	sta	%f31,	[%l7 + %g1] 0x88
	nop
	set	0x54, %i2
	ldub	[%l7 + %i2],	%g2
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x81,	%o0
	nop
	set	0x17, %g7
	ldstub	[%l7 + %g7],	%l5
	nop
	set	0x5B, %o7
	ldsb	[%l7 + %o7],	%i1
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc2
	nop
	set	0x38, %g2
	stx	%o3,	[%l7 + %g2]
	nop
	set	0x68, %g4
	stx	%g5,	[%l7 + %g4]
	set	0x74, %l0
	swapa	[%l7 + %l0] 0x89,	%l2
	ld	[%l7 + 0x24],	%f1
	nop
	set	0x46, %g3
	lduh	[%l7 + %g3],	%o4
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%o0
	set	0x40, %o5
	stxa	%i5,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x46, %l6
	stba	%o7,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x0C, %g5
	lda	[%l7 + %g5] 0x81,	%f24
	nop
	set	0x68, %i5
	std	%i6,	[%l7 + %i5]
	nop
	set	0x60, %l1
	stb	%g4,	[%l7 + %l1]
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x80,	%g7
	nop
	set	0x38, %i1
	std	%f18,	[%l7 + %i1]
	set	0x38, %i6
	sta	%f10,	[%l7 + %i6] 0x88
	set	0x2C, %i4
	stwa	%o2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%g3
	nop
	set	0x12, %i3
	ldsh	[%l7 + %i3],	%o5
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe3,	%l0
	ld	[%l7 + 0x28],	%f13
	set	0x70, %g6
	stda	%i4,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x81,	%o6
	nop
	set	0x0C, %l5
	ldsh	[%l7 + %l5],	%l3
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x40, %i7
	stx	%i0,	[%l7 + %i7]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i6
	set	0x78, %g1
	stda	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x46, %i2
	ldsh	[%l7 + %i2],	%g1
	nop
	set	0x34, %o4
	ldsw	[%l7 + %o4],	%l6
	or	%g6,	%l4,	%g2
	set	0x3F, %o7
	stba	%l5,	[%l7 + %o7] 0x80
	st	%fsr,	[%l7 + 0x44]
	set	0x6C, %l2
	lda	[%l7 + %l2] 0x81,	%f13
	set	0x08, %g7
	stwa	%o0,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe2,	%i0
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%o3
	add	%l2,	%o4,	%o1
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%i5
	set	0x10, %g3
	sta	%f23,	[%l7 + %g3] 0x80
	nop
	set	0x34, %o6
	lduw	[%l7 + %o6],	%o7
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f0
	nop
	set	0x70, %l6
	swap	[%l7 + %l6],	%g5
	st	%f28,	[%l7 + 0x38]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%g7
	set	0x20, %o3
	stxa	%i7,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x44, %i5
	stw	%g3,	[%l7 + %i5]
	st	%f1,	[%l7 + 0x54]
	set	0x10, %l1
	sta	%f16,	[%l7 + %l1] 0x89
	nop
	set	0x48, %o2
	std	%f6,	[%l7 + %o2]
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%o2
	or	%o5,	%i2,	%i4
	nop
	nop
	setx	0xC945532C2F1D4B10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1E79204EF949CA81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f22,	%f30
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	ld	[%l7 + 0x24],	%f25
	bleu,a	%xcc,	loop_16
	ld	[%l7 + 0x70],	%f3
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x81,	%l0
loop_16:
	nop
	set	0x0E, %o1
	sth	%o6,	[%l7 + %o1]
	and	%l3,	%i0,	%i6
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xda
	set	0x30, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l1
	nop
	set	0x5E, %g5
	stb	%i3,	[%l7 + %g5]
	set	0x44, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g1
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%g6
	or	%l6,	%g2,	%l4
	nop
	set	0x18, %i0
	lduw	[%l7 + %i0],	%l5
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%i1
	or	%o0,	%o3,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%o1
	nop
	set	0x2C, %i7
	stw	%o7,	[%l7 + %i7]
	or	%g5,	%i5,	%g4
	nop
	set	0x1F, %l5
	stb	%i7,	[%l7 + %l5]
	fpsub16s	%f27,	%f20,	%f31
	nop
	set	0x37, %i2
	ldstub	[%l7 + %i2],	%g7
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%f2
	and	%o2,	%o5,	%g3
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x89,	%i2
	set	0x08, %o4
	swapa	[%l7 + %o4] 0x89,	%i4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%l3
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f24
	or	%o6,	%i6,	%i0
	nop
	nop
	setx	0x20A377458B0B8A4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x1A19EAEFA6C7DD84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f2,	%f30
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0
	st	%fsr,	[%l7 + 0x38]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g6
	nop
	set	0x48, %g2
	lduh	[%l7 + %g2],	%g1
	nop
	set	0x3E, %l0
	sth	%l6,	[%l7 + %l0]
	nop
	set	0x34, %g3
	prefetch	[%l7 + %g3],	 2
	set	0x6C, %o6
	sta	%f18,	[%l7 + %o6] 0x89
	nop
	set	0x20, %o5
	stw	%g2,	[%l7 + %o5]
	nop
	set	0x42, %l6
	ldsb	[%l7 + %l6],	%l4
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%l5
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	nop
	set	0x28, %i5
	std	%f20,	[%l7 + %i5]
	nop
	set	0x10, %o2
	std	%i0,	[%l7 + %o2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%o4
	nop
	set	0x4C, %i1
	ldsb	[%l7 + %i1],	%l2
	set	0x20, %i6
	stwa	%o0,	[%l7 + %i6] 0x80
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x88,	%o6
	set	0x10, %o1
	stwa	%o1,	[%l7 + %o1] 0x89
	ld	[%l7 + 0x74],	%f2
	set	0x41, %i3
	stba	%g5,	[%l7 + %i3] 0x88
	nop
	set	0x70, %o0
	std	%f14,	[%l7 + %o0]
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x81,	%i5
	nop
	set	0x60, %i4
	stx	%g4,	[%l7 + %i4]
	nop
	set	0x78, %g6
	ldsw	[%l7 + %g6],	%i7
	add	%o2,	%o5,	%g7
	nop
	set	0x60, %l3
	std	%f16,	[%l7 + %l3]
	nop
	set	0x18, %l4
	std	%g2,	[%l7 + %l4]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f26
	ld	[%l7 + 0x70],	%f6
	set	0x18, %i0
	stxa	%i4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x50, %l5
	std	%f18,	[%l7 + %l5]
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x89,	 4
	nop
	set	0x40, %o7
	sth	%l0,	[%l7 + %o7]
	nop
	set	0x70, %o4
	stx	%l3,	[%l7 + %o4]
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f0
	nop
	set	0x4C, %g7
	lduw	[%l7 + %g7],	%i6
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x81,	%o6
	nop
	set	0x60, %g2
	std	%i0,	[%l7 + %g2]
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x28, %o5
	std	%f6,	[%l7 + %o5]
	nop
	set	0x70, %l6
	stx	%i3,	[%l7 + %l6]
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%g6
	set	0x28, %o3
	stxa	%g1,	[%l7 + %o3] 0x81
	set	0x79, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l6
	nop
	set	0x45, %o2
	ldsb	[%l7 + %o2],	%l4
	set	0x0A, %g4
	stha	%l5,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc2
	set	0x1C, %i6
	stwa	%i1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 0
	and	%o3,	%o4,	%l2
	set	0x2F, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o0
	nop
	set	0x10, %o0
	std	%o6,	[%l7 + %o0]
	nop
	set	0x24, %l1
	lduw	[%l7 + %l1],	%o1
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%g2
	nop
	set	0x2C, %g5
	lduw	[%l7 + %g5],	%g5
	nop
	set	0x26, %g6
	lduh	[%l7 + %g6],	%i5
	set	0x28, %l4
	ldxa	[%l7 + %l4] 0x80,	%g4
	nop
	set	0x48, %l3
	std	%f8,	[%l7 + %l3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%o5
	set	0x78, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o2
	nop
	set	0x1C, %l5
	stw	%g7,	[%l7 + %l5]
	nop
	set	0x12, %i0
	ldub	[%l7 + %i0],	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%l0
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f0
	st	%f8,	[%l7 + 0x7C]
	set	0x7C, %o7
	ldstuba	[%l7 + %o7] 0x88,	%l3
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x89,	%i4
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%i6
	nop
	set	0x2C, %g7
	lduw	[%l7 + %g7],	%o6
	set	0x28, %g2
	stwa	%l1,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc2
	nop
	set	0x10, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x24, %o5
	swapa	[%l7 + %o5] 0x80,	%i3
	nop
	set	0x1C, %l6
	ldstub	[%l7 + %l6],	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%g6
	or	%l4,	%l5,	%l6
	st	%f30,	[%l7 + 0x34]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f8
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x81,	 3
	and	%o3,	%l2,	%o0
	set	0x18, %i5
	lda	[%l7 + %i5] 0x89,	%f28
	set	0x58, %o6
	stxa	%o4,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x89,	%o7
	set	0x24, %o2
	swapa	[%l7 + %o2] 0x88,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i5
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x81,	 1
	set	0x39, %i6
	stba	%g2,	[%l7 + %i6] 0x80
	set	0x4E, %o1
	stba	%i7,	[%l7 + %o1] 0x81
	st	%fsr,	[%l7 + 0x34]
	set	0x70, %o0
	stba	%o5,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x38, %l1
	ldub	[%l7 + %l1],	%g7
	set	0x40, %i3
	stda	%g2,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x80
	nop
	set	0x12, %g6
	lduh	[%l7 + %g6],	%i2
	st	%f25,	[%l7 + 0x6C]
	nop
	set	0x4F, %g5
	ldsb	[%l7 + %g5],	%l0
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%l3
	set	0x62, %i7
	stha	%o2,	[%l7 + %i7] 0x88
	nop
	set	0x48, %l5
	std	%f26,	[%l7 + %l5]
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%i4
	nop
	set	0x10, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%f0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x81
	set	0x43, %o4
	stba	%o6,	[%l7 + %o4] 0x81
	nop
	set	0x7F, %g7
	ldub	[%l7 + %g7],	%l1
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%i0
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%g6
	nop
	set	0x78, %o5
	std	%g0,	[%l7 + %o5]
	set	0x1E, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l4
	nop
	set	0x10, %l6
	ldsh	[%l7 + %l6],	%l6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f16
	and	%i1,	%o3,	%l2
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x89,	%l5
	nop
	set	0x56, %o6
	ldsh	[%l7 + %o6],	%o0
	nop
	set	0x18, %l2
	std	%f30,	[%l7 + %l2]
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f8
	st	%fsr,	[%l7 + 0x14]
	st	%fsr,	[%l7 + 0x28]
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f28
	set	0x48, %i6
	stha	%o1,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f2
	set	0x18, %i3
	stba	%o7,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x88,	 2
	nop
	set	0x45, %o0
	ldsb	[%l7 + %o0],	%g4
	set	0x40, %g6
	stda	%i4,	[%l7 + %g6] 0x88
	set	0x30, %g5
	stda	%i6,	[%l7 + %g5] 0x89
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x80,	 3
	nop
	set	0x48, %l3
	std	%g6,	[%l7 + %l3]
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%g2
	nop
	set	0x68, %i0
	std	%f30,	[%l7 + %i0]
	nop
	set	0x58, %g1
	ldsb	[%l7 + %g1],	%i2
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x88,	%l0
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%g2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%i4
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x89,	%o6
	nop
	set	0x40, %o4
	ldsh	[%l7 + %o4],	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%i3
	nop
	set	0x2C, %l0
	lduh	[%l7 + %l0],	%i6
	set	0x60, %g2
	lda	[%l7 + %g2] 0x89,	%f28
	nop
	set	0x3C, %g7
	ldsh	[%l7 + %g7],	%i0
	set	0x48, %o5
	stxa	%g6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x7E, %g3
	ldstub	[%l7 + %g3],	%g1
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x0C, %i5
	sta	%f16,	[%l7 + %i5] 0x81
	or	%l6,	%l4,	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%l5
	and	%o0,	%l2,	%o1
	nop
	set	0x3C, %o6
	stw	%o7,	[%l7 + %o6]
	nop
	set	0x54, %l2
	ldsw	[%l7 + %l2],	%o4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%i5
	nop
	set	0x3C, %o3
	lduw	[%l7 + %o3],	%g4
	nop
	set	0x48, %g4
	ldsh	[%l7 + %g4],	%i7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f16
	add	%g7,	%o5,	%g2
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%i2
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x80,	%g3
	fpsub16s	%f3,	%f4,	%f27
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	nop
	set	0x5F, %i1
	ldub	[%l7 + %i1],	%o2
	wr	%l0,	%o6,	%y
	nop
	set	0x22, %i3
	stb	%i4,	[%l7 + %i3]
	set	0x24, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l3
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd8
	nop
	set	0x2C, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x74, %i7
	stw	%l1,	[%l7 + %i7]
	nop
	set	0x40, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x68, %l3
	stxa	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%i3
	set	0x24, %i0
	stwa	%g6,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf1
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l6
	nop
	set	0x44, %l4
	prefetch	[%l7 + %l4],	 4
	ld	[%l7 + 0x34],	%f19
	nop
	set	0x68, %l5
	std	%l4,	[%l7 + %l5]
	set	0x68, %o7
	stwa	%o3,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x43DDA94A15FEF8E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x9467DD2DCC891B14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f28,	%f30
	set	0x24, %o4
	stba	%l5,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x89,	%o0
	set	0x34, %g2
	swapa	[%l7 + %g2] 0x81,	%i1
	nop
	set	0x18, %g7
	stx	%o1,	[%l7 + %g7]
	nop
	set	0x14, %o5
	ldub	[%l7 + %o5],	%l2
	nop
	set	0x51, %l0
	ldstub	[%l7 + %l0],	%o7
	nop
	set	0x52, %l6
	sth	%g5,	[%l7 + %l6]
	nop
	set	0x4C, %g3
	swap	[%l7 + %g3],	%i5
	nop
	set	0x48, %o6
	ldstub	[%l7 + %o6],	%o4
	nop
	set	0x10, %i5
	ldsw	[%l7 + %i5],	%g4
	fpsub16s	%f23,	%f11,	%f6
	nop
	set	0x52, %l2
	ldsh	[%l7 + %l2],	%i7
	nop
	set	0x18, %o3
	std	%o4,	[%l7 + %o3]
	nop
	set	0x70, %g4
	std	%f26,	[%l7 + %g4]
	set	0x20, %o1
	lda	[%l7 + %o1] 0x89,	%f4
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g2
	set	0x7C, %i6
	stha	%g3,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x24, %i1
	stw	%l0,	[%l7 + %i1]
	nop
	set	0x6D, %l1
	ldstub	[%l7 + %l1],	%o2
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f16
	set	0x7C, %g6
	sta	%f18,	[%l7 + %g6] 0x89
	set	0x44, %o0
	stha	%o6,	[%l7 + %o0] 0x88
	fpadd16	%f4,	%f28,	%f12
	bn,pt	%icc,	loop_17
	nop
	set	0x08, %i4
	std	%f30,	[%l7 + %i4]
	set	0x64, %i7
	sta	%f17,	[%l7 + %i7] 0x88
loop_17:
	nop
	set	0x28, %l3
	stda	%i4,	[%l7 + %l3] 0x81
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%l3
	nop
	set	0x30, %g5
	stx	%l1,	[%l7 + %g5]
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x89,	%i6
	and	%i0,	%i3,	%g1
	fpadd16	%f18,	%f22,	%f30
	bne	%xcc,	loop_18
	nop
	nop
	setx	0x9BB72C8583138DE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x842A6DD57DC28BCD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f22
	bg,pt	%xcc,	loop_19
	nop
	set	0x48, %l5
	prefetch	[%l7 + %l5],	 3
loop_18:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l4
loop_19:
	fpadd32	%f16,	%f16,	%f16
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x81
	set	0x30, %o7
	stba	%o3,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x28, %i2
	stxa	%l5,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x70, %g2
	std	%f28,	[%l7 + %g2]
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x48, %o5
	ldx	[%l7 + %o5],	%g6
	set	0x30, %g7
	swapa	[%l7 + %g7] 0x89,	%i1
	nop
	set	0x20, %l0
	stw	%o1,	[%l7 + %l0]
	nop
	set	0x12, %l6
	sth	%o0,	[%l7 + %l6]
	set	0x38, %o6
	stwa	%o7,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x23, %g3
	ldsb	[%l7 + %g3],	%l2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x80
	set	0x5C, %l2
	stba	%g5,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x30, %g4
	prefetch	[%l7 + %g4],	 2
	and	%o4,	%g4,	%i5
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x5E, %o3
	sth	%i7,	[%l7 + %o3]
	set	0x58, %o1
	stwa	%o5,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%g7
	nop
	set	0x60, %i1
	sth	%i2,	[%l7 + %i1]
	set	0x1C, %o2
	stba	%g3,	[%l7 + %o2] 0x80
	bgu	%icc,	loop_20
	nop
	set	0x2C, %i3
	stw	%l0,	[%l7 + %i3]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc2
loop_20:
	nop
	set	0x70, %o0
	std	%f24,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x28, %l1
	ldx	[%l7 + %l1],	%g2
	nop
	set	0x28, %i7
	lduw	[%l7 + %i7],	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%i4
	set	0x58, %l3
	stha	%l1,	[%l7 + %l3] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%i0
	or	%l3,	%g1,	%i3
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x80,	%l4
	and	%l6,	%l5,	%o3
	nop
	set	0x72, %i0
	sth	%i1,	[%l7 + %i0]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f0
	nop
	set	0x3C, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%g6
	or	%o0,	%o1,	%o7
	set	0x5C, %l5
	lda	[%l7 + %l5] 0x88,	%f29
	nop
	set	0x78, %o7
	std	%f8,	[%l7 + %o7]
	nop
	set	0x28, %g2
	prefetch	[%l7 + %g2],	 3
	or	%g5,	%l2,	%o4
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%i4
	set	0x60, %o5
	stxa	%g4,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x81,	%o5
	set	0x64, %g7
	lda	[%l7 + %g7] 0x81,	%f31
	nop
	set	0x24, %l6
	swap	[%l7 + %l6],	%g7
	add	%i7,	%g3,	%l0
	or	%i2,	%g2,	%o6
	nop
	set	0x42, %o6
	lduh	[%l7 + %o6],	%i4
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0
	nop
	nop
	setx	0x1B3339E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xD8DBB237,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f27,	%f19
	ld	[%l7 + 0x60],	%f21
	nop
	set	0x29, %i5
	stb	%i6,	[%l7 + %i5]
	set	0x10, %g3
	sta	%f25,	[%l7 + %g3] 0x80
	set	0x60, %g4
	stwa	%o2,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x5C, %o3
	stw	%i0,	[%l7 + %o3]
	set	0x20, %o1
	ldstuba	[%l7 + %o1] 0x88,	%l3
	st	%f15,	[%l7 + 0x08]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc2
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
	set	0x62, %o2
	stba	%g1,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x38, %i6
	std	%f0,	[%l7 + %i6]
	set	0x08, %i3
	swapa	[%l7 + %i3] 0x81,	%i3
	nop
	set	0x08, %g6
	stw	%l4,	[%l7 + %g6]
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x50, %i7
	std	%f28,	[%l7 + %i7]
	set	0x18, %l3
	stba	%l6,	[%l7 + %l3] 0x89
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%o3
	st	%f21,	[%l7 + 0x70]
	st	%f16,	[%l7 + 0x68]
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x89,	%l5
	add	%g6,	%o0,	%i1
	nop
	set	0x22, %i4
	sth	%o1,	[%l7 + %i4]
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x80,	%g5
	nop
	set	0x60, %g1
	prefetch	[%l7 + %g1],	 2
	wr	%o7,	%o4,	%y
	nop
	set	0x34, %l5
	ldsw	[%l7 + %l5],	%i5
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%l2
	nop
	set	0x58, %i2
	stx	%o5,	[%l7 + %i2]
	or	%g4,	%i7,	%g7
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f0
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	nop
	set	0x48, %o5
	stw	%i2,	[%l7 + %o5]
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x80,	%g3
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f16
	nop
	set	0x10, %l0
	stw	%o6,	[%l7 + %l0]
	nop
	set	0x50, %i5
	ldsb	[%l7 + %i5],	%g2
	set	0x1A, %g3
	ldstuba	[%l7 + %g3] 0x88,	%i4
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x81,	 0
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%l1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf9,	%f16
	nop
	set	0x64, %o6
	ldsh	[%l7 + %o6],	%i0
	nop
	set	0x38, %i1
	stx	%o2,	[%l7 + %i1]
	nop
	set	0x08, %o2
	ldub	[%l7 + %o2],	%g1
	nop
	set	0x4F, %l2
	ldsb	[%l7 + %l2],	%l3
	nop
	set	0x30, %i3
	std	%f26,	[%l7 + %i3]
	set	0x10, %i6
	stda	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x20, %g6
	stw	%l6,	[%l7 + %g6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%o3
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x89,	 1
	set	0x6C, %l3
	sta	%f11,	[%l7 + %l3] 0x89
	set	0x48, %o0
	stwa	%o0,	[%l7 + %o0] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%o1
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%o4
	nop
	set	0x4B, %i4
	stb	%i5,	[%l7 + %i4]
	nop
	set	0x4A, %g5
	sth	%o7,	[%l7 + %g5]
	nop
	set	0x2F, %i7
	stb	%o5,	[%l7 + %i7]
	nop
	set	0x50, %l5
	std	%f28,	[%l7 + %l5]
	nop
	set	0x58, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x70, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x14, %o7
	ldsh	[%l7 + %o7],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%g7
	set	0x48, %i2
	stxa	%l0,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f10
	nop
	set	0x5C, %g2
	ldsb	[%l7 + %g2],	%i2
	nop
	set	0x1A, %o5
	sth	%g3,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x30]
	set	0x28, %g7
	stda	%g2,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x0E, %l6
	ldub	[%l7 + %l6],	%i4
	or	%o6,	%l1,	%i0
	fpsub16	%f0,	%f20,	%f16
	or	%o2,	%i6,	%g1
	nop
	set	0x6F, %i5
	ldstub	[%l7 + %i5],	%l3
	nop
	set	0x5C, %g3
	swap	[%l7 + %g3],	%l6
	nop
	set	0x50, %g4
	ldsh	[%l7 + %g4],	%i3
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xe3,	%l4
	nop
	set	0x64, %o1
	sth	%l5,	[%l7 + %o1]
	nop
	set	0x1F, %o3
	ldsb	[%l7 + %o3],	%o3
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x89,	%g6
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%o0
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x81,	%o1
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	nop
	set	0x70, %i6
	std	%f22,	[%l7 + %i6]
	set	0x6C, %g6
	sta	%f9,	[%l7 + %g6] 0x81
	and	%i1,	%i5,	%o7
	set	0x64, %l1
	lda	[%l7 + %l1] 0x88,	%f21
	nop
	set	0x40, %l3
	std	%f12,	[%l7 + %l3]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%o4
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%g4
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f6
	st	%f0,	[%l7 + 0x6C]
	add	%l2,	%i7,	%l0
	nop
	set	0x32, %i0
	lduh	[%l7 + %i0],	%g7
	set	0x18, %i4
	stha	%i2,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x0C, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g2
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x54, %l5
	prefetch	[%l7 + %l5],	 4
	st	%fsr,	[%l7 + 0x70]
	set	0x34, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g3
	and	%i4,	%l1,	%o6
	nop
	set	0x40, %g1
	stx	%o2,	[%l7 + %g1]
	set	0x40, %l4
	stda	%i0,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f4
	or	%g1,	%i6,	%l6
	nop
	set	0x5C, %i2
	ldsw	[%l7 + %i2],	%i3
	set	0x5E, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l3
	bn,a	%xcc,	loop_21
	nop
	set	0x48, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x6E, %o4
	ldub	[%l7 + %o4],	%l5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%g6
loop_21:
	nop
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0
	wr	%o1,	%g5,	%pic
	set	0x74, %i5
	stha	%l4,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%i1
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%o7
	and	%o5,	%o4,	%l2
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x4E, %l6
	stb	%g4,	[%l7 + %l6]
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	nop
	set	0x52, %l0
	ldsb	[%l7 + %l0],	%g7
	set	0x42, %o3
	stba	%i2,	[%l7 + %o3] 0x81
	st	%fsr,	[%l7 + 0x5C]
	add	%g2,	%i7,	%g3
	set	0x48, %o1
	stwa	%i4,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x38, %i1
	stwa	%o6,	[%l7 + %i1] 0x89
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f10
	set	0x7A, %i3
	stha	%o2,	[%l7 + %i3] 0x81
	and	%l1,	%g1,	%i6
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%l6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc0
	nop
	set	0x52, %l1
	lduh	[%l7 + %l1],	%i3
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%i0
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f28
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f16
	nop
	set	0x59, %o0
	stb	%l3,	[%l7 + %o0]
	nop
	set	0x20, %i4
	stx	%o3,	[%l7 + %i4]
	set	0x7E, %i0
	stha	%l5,	[%l7 + %i0] 0x88
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xea,	%o0
	nop
	set	0x48, %i7
	swap	[%l7 + %i7],	%g6
	set	0x50, %g5
	stxa	%g5,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x5F, %g1
	ldub	[%l7 + %g1],	%o1
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%l4
	nop
	set	0x66, %l4
	ldstub	[%l7 + %l4],	%i5
	set	0x10, %i2
	swapa	[%l7 + %i2] 0x81,	%o7
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%o5
	set	0x2E, %o4
	stba	%o4,	[%l7 + %o4] 0x88
	set	0x6E, %o5
	stha	%l2,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x89,	%g4
	set	0x60, %g3
	stha	%l0,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x0D, %l6
	ldsb	[%l7 + %l6],	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%i1
	set	0x28, %g4
	stda	%g2,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x7C, %l0
	stha	%i7,	[%l7 + %l0] 0x81
	set	0x6C, %o3
	sta	%f29,	[%l7 + %o3] 0x81
	and	%g3,	%o6,	%o2
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x88,	%i4
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x20, %g7
	std	%f28,	[%l7 + %g7]
	nop
	set	0x17, %i1
	stb	%l1,	[%l7 + %i1]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc2
	nop
	set	0x70, %i6
	stw	%i6,	[%l7 + %i6]
	nop
	set	0x28, %o2
	std	%f24,	[%l7 + %o2]
	nop
	set	0x54, %l1
	ldstub	[%l7 + %l1],	%l6
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%g1
	wr	%i3,	%l3,	%y
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%i0
	nop
	set	0x37, %l3
	ldsb	[%l7 + %l3],	%l5
	nop
	set	0x14, %o0
	lduh	[%l7 + %o0],	%o3
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x80
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x58, %i0
	stx	%o1,	[%l7 + %i0]
	nop
	set	0x76, %l2
	ldsh	[%l7 + %l2],	%l4
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x81,	%o0
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f26
	nop
	set	0x34, %l5
	ldsw	[%l7 + %l5],	%o7
	nop
	set	0x1F, %g1
	ldstub	[%l7 + %g1],	%i5
	nop
	set	0x74, %o7
	stw	%o4,	[%l7 + %o7]
	set	0x68, %l4
	stha	%o5,	[%l7 + %l4] 0xeb
	membar	#Sync
	ld	[%l7 + 0x58],	%f16
	nop
	set	0x6C, %i2
	ldstub	[%l7 + %i2],	%l2
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%l0
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%g4
	nop
	set	0x2C, %i5
	stw	%g7,	[%l7 + %i5]
	and	%i2,	%g2,	%i7
	ld	[%l7 + 0x34],	%f14
	set	0x30, %g3
	stha	%g3,	[%l7 + %g3] 0x89
	nop
	set	0x30, %l6
	std	%f16,	[%l7 + %l6]
	nop
	set	0x4A, %o5
	ldub	[%l7 + %o5],	%i1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f16
	set	0x3C, %o3
	stwa	%o6,	[%l7 + %o3] 0x89
	and	%i4,	%l1,	%i6
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%l6
	ld	[%l7 + 0x5C],	%f7
	nop
	set	0x3C, %g7
	lduw	[%l7 + %g7],	%o2
	nop
	set	0x64, %o1
	lduh	[%l7 + %o1],	%g1
	nop
	set	0x1F, %i3
	ldstub	[%l7 + %i3],	%i3
	set	, %i6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1266
!	Type a   	: 24
!	Type cti   	: 21
!	Type x   	: 541
!	Type f   	: 32
!	Type i   	: 116
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


EXIT_GOOD	/* test finish  */

  /************************************************************************
  Test case data start
  ************************************************************************/
  .data
user_data_start:
scratch_area:
!! thread 0 data, 64 words.
.word 0x00F5A577
.word 0x1DCC205F
.word 0xD69EA72F
.word 0x0208C0EC
.word 0xC48C46DB
.word 0x02BC59D3
.word 0xE01B9FB1
.word 0x95AE76CA
.word 0xAF4902F6
.word 0x89B2FC2B
.word 0x2033F1FA
.word 0x14C19B37
.word 0x8435CF44
.word 0xDFD09F7C
.word 0xFE3994DC
.word 0x6438AC4E
.word 0x6B1DA000
.word 0x4A6ECBDC
.word 0x446884BA
.word 0xF255C7F8
.word 0x7CF9F6D2
.word 0x7615E40C
.word 0xA76DB2E2
.word 0xFB1BC688
.word 0x0E5EA4DB
.word 0x87514B07
.word 0xC1445009
.word 0xF6796EEF
.word 0xD807680B
.word 0x9AD00198
.word 0xDBFF547A
.word 0x47714A64
.word 0xD4E3C505
.word 0x3C32AAFE
.word 0x1C4D7FC2
.word 0x4F2B78DC
.word 0xAAC96549
.word 0xFA7BF84C
.word 0xCAAEDE3A
.word 0x0D6FE0BF
.word 0x78F67488
.word 0x66F77D8C
.word 0x43E75FE0
.word 0x2FDF3851
.word 0x8903CE8F
.word 0x754F8E40
.word 0x8EE754C7
.word 0xEE521963
.word 0x3518567A
.word 0xDA6F35B3
.word 0x6FC851D1
.word 0x03ECCBEE
.word 0x4C344FE2
.word 0xE148060D
.word 0xB49BA6F1
.word 0x055452B0
.word 0xC4AB0860
.word 0x696B4537
.word 0x3AB33914
.word 0xEBCCEC4A
.word 0xE856435D
.word 0xD10AF367
.word 0x091E40FF
.word 0xEE817556
.end
