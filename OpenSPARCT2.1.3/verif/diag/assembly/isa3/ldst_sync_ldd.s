/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_ldd.s
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
	cmp %l6, 0x0
	be thread_0
	nop
	cmp %l6, 0x1
	be thread_1
	nop
	cmp %l6, 0x2
	be thread_2
	nop
	cmp %l6, 0x3
	be thread_3
	nop
	cmp %l6, 0x4
	be thread_4
	nop
	cmp %l6, 0x5
	be thread_5
	nop
	cmp %l6, 0x6
	be thread_6
	nop
	cmp %l6, 0x7
	be thread_7
	nop
	EXIT_BAD
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
	set	0x3,	%g1
	set	0x2,	%g2
	set	0xF,	%g3
	set	0x1,	%g4
	set	0xD,	%g5
	set	0x8,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x1,	%i1
	set	-0x4,	%i2
	set	-0x2,	%i3
	set	-0xD,	%i4
	set	-0x5,	%i5
	set	-0x1,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x5753E818,	%l0
	set	0x42724679,	%l1
	set	0x4783762D,	%l2
	set	0x070E7DA0,	%l3
	set	0x69020673,	%l4
	set	0x203A6525,	%l5
	set	0x29EF117C,	%l6
	!# Output registers
	set	0x04DF,	%o0
	set	0x0EA8,	%o1
	set	0x0BD8,	%o2
	set	0x1337,	%o3
	set	-0x03DD,	%o4
	set	0x1B08,	%o5
	set	-0x1C2E,	%o6
	set	0x0FAD,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	nop
	set	0x36, %g1
	sth	%i6,	[%l7 + %g1]
	nop
	set	0x36, %g6
	lduh	[%l7 + %g6],	%l4
	nop
	set	0x10, %i3
	stx	%o2,	[%l7 + %i3]
	or	%o0,	%i2,	%i3
	nop
	set	0x64, %l1
	lduh	[%l7 + %l1],	%g7
	nop
	set	0x6A, %o2
	ldub	[%l7 + %o2],	%l5
	set	0x26, %g5
	stba	%i7,	[%l7 + %g5] 0x89
	nop
	set	0x10, %g3
	stw	%l1,	[%l7 + %g3]
	and	%g3,	%g4,	%o4
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%i0
	nop
	set	0x3A, %i1
	lduh	[%l7 + %i1],	%i4
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%o7
	set	0x48, %o3
	sta	%f8,	[%l7 + %o3] 0x81
	nop
	set	0x40, %o4
	stw	%l6,	[%l7 + %o4]
	nop
	set	0x4C, %o5
	prefetch	[%l7 + %o5],	 3
	wr	%g5,	%o6,	%ccr
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc4
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x89,	%l2
	nop
	set	0x4C, %g2
	lduh	[%l7 + %g2],	%o3
	set	0x10, %i4
	sta	%f29,	[%l7 + %i4] 0x80
	nop
	set	0x18, %l2
	lduh	[%l7 + %l2],	%l0
	add	%g6,	%i5,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%o5
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
	nop
	set	0x2A, %l4
	sth	%g1,	[%l7 + %l4]
	set	0x18, %g4
	lda	[%l7 + %g4] 0x81,	%f10
	set	0x10, %o0
	stda	%g2,	[%l7 + %o0] 0x88
	set	0x40, %i7
	stda	%i0,	[%l7 + %i7] 0x80
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f8
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%l4
	nop
	set	0x26, %i0
	ldsh	[%l7 + %i0],	%o2
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x80,	%i6
	nop
	set	0x5D, %l6
	ldsb	[%l7 + %l6],	%i2
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x81,	 4
	nop
	set	0x72, %o1
	lduh	[%l7 + %o1],	%g7
	nop
	set	0x70, %g6
	ldsh	[%l7 + %g6],	%l5
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x89,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%g3
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe3,	%l0
	nop
	set	0x5E, %i3
	stb	%o4,	[%l7 + %i3]
	and	%i1,	%i4,	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g5
	nop
	set	0x09, %g5
	ldstub	[%l7 + %g5],	%o7
	nop
	set	0x2C, %g3
	stw	%l2,	[%l7 + %g3]
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%o3
	set	0x16, %l5
	stha	%o6,	[%l7 + %l5] 0x89
	set	0x1E, %i1
	stha	%l0,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x25, %o3
	ldsb	[%l7 + %o3],	%i5
	set	0x18, %g7
	stxa	%l3,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x58, %o4
	stxa	%o1,	[%l7 + %o4] 0x88
	or	%g6,	%o5,	%g1
	nop
	set	0x24, %o5
	sth	%g2,	[%l7 + %o5]
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%i0
	st	%f0,	[%l7 + 0x50]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	set	0x78, %o6
	stda	%l4,	[%l7 + %o6] 0xea
	membar	#Sync
	st	%f11,	[%l7 + 0x44]
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%o2
	nop
	set	0x7C, %i4
	lduh	[%l7 + %i4],	%i6
	set	0x4C, %i6
	stba	%o0,	[%l7 + %i6] 0x88
	set	0x3B, %l4
	stba	%i2,	[%l7 + %l4] 0x80
	nop
	set	0x24, %g4
	lduw	[%l7 + %g4],	%l5
	set	0x33, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g7
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x88,	%i7
	nop
	set	0x38, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x10, %i5
	stw	%i3,	[%l7 + %i5]
	nop
	set	0x2E, %i0
	lduh	[%l7 + %i0],	%g3
	nop
	set	0x4A, %l0
	stb	%l1,	[%l7 + %l0]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf1
	membar	#Sync
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	nop
	set	0x5E, %o1
	ldstub	[%l7 + %o1],	%i1
	and	%i4,	%g4,	%l6
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x56, %g1
	stba	%g5,	[%l7 + %g1] 0x89
	nop
	set	0x61, %l1
	ldstub	[%l7 + %l1],	%l2
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f16
	set	0x78, %i3
	sta	%f22,	[%l7 + %i3] 0x80
	set	0x71, %o2
	stba	%o7,	[%l7 + %o2] 0x80
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%o3
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%l0
	set	0x2C, %g3
	sta	%f16,	[%l7 + %g3] 0x80
	set	0x18, %g7
	stda	%i4,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x24, %o3
	ldub	[%l7 + %o3],	%l3
	nop
	set	0x79, %o5
	ldub	[%l7 + %o5],	%o1
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%o6
	set	0x4B, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g6
	and	%o5,	%g1,	%i0
	nop
	set	0x0C, %o6
	sth	%g2,	[%l7 + %o6]
	nop
	set	0x5C, %l2
	swap	[%l7 + %l2],	%o2
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x80,	%i6
	nop
	set	0x14, %i6
	stw	%o0,	[%l7 + %i6]
	or	%i2,	%l5,	%g7
	nop
	set	0x20, %l4
	std	%f24,	[%l7 + %l4]
	set	0x48, %g4
	stba	%l4,	[%l7 + %g4] 0x80
	and	%i7,	%i3,	%g3
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xda
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f6
	set	0x60, %o0
	lda	[%l7 + %o0] 0x89,	%f19
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f12
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xcc
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%l0
	set	0x54, %l0
	lda	[%l7 + %l0] 0x80,	%f22
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x88,	%o4
	nop
	set	0x16, %l3
	ldstub	[%l7 + %l3],	%i4
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%g4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	nop
	set	0x38, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x89,	 3
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%i1
	set	0x64, %i3
	swapa	[%l7 + %i3] 0x80,	%l2
	set	0x20, %o2
	lda	[%l7 + %o2] 0x81,	%f11
	nop
	set	0x08, %i1
	sth	%g5,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	nop
	set	0x70, %g7
	lduh	[%l7 + %g7],	%o7
	nop
	set	0x30, %o3
	std	%f28,	[%l7 + %o3]
	set	0x78, %g3
	stxa	%l0,	[%l7 + %g3] 0x88
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x44]
	set	0x20, %o5
	stda	%i4,	[%l7 + %o5] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x6D, %o4
	ldub	[%l7 + %o4],	%l3
	nop
	set	0x38, %o6
	stx	%o3,	[%l7 + %o6]
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%o1
	set	0x78, %i2
	stwa	%g6,	[%l7 + %i2] 0xe3
	membar	#Sync
	or	%o6,	%g1,	%o5
	or	%g2,	%i0,	%i6
	set	0x30, %i6
	stda	%o2,	[%l7 + %i6] 0x81
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f0
	and	%o0,	%l5,	%g7
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%l4
	nop
	set	0x30, %i7
	lduw	[%l7 + %i7],	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	set	0x78, %o0
	swapa	[%l7 + %o0] 0x81,	%l1
	ld	[%l7 + 0x20],	%f8
	set	0x50, %i5
	stda	%o4,	[%l7 + %i5] 0x88
	set	0x10, %o7
	lda	[%l7 + %o7] 0x80,	%f30
	nop
	set	0x0C, %i4
	lduw	[%l7 + %i4],	%g3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%l6
	nop
	set	0x38, %i0
	stw	%i1,	[%l7 + %i0]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%g4
	or	%o7,	%g5,	%i5
	nop
	set	0x40, %l6
	std	%l2,	[%l7 + %l6]
	nop
	set	0x1C, %l0
	stw	%o3,	[%l7 + %l0]
	nop
	set	0x08, %o1
	stx	%l0,	[%l7 + %o1]
	nop
	set	0x22, %l3
	ldsh	[%l7 + %l3],	%g6
	st	%fsr,	[%l7 + 0x30]
	st	%f29,	[%l7 + 0x54]
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xe2,	%o0
	nop
	set	0x10, %g1
	stw	%o6,	[%l7 + %g1]
	bge	%icc,	loop_1
	nop
	set	0x14, %g6
	ldsw	[%l7 + %g6],	%o5
	nop
	set	0x40, %o2
	std	%g2,	[%l7 + %o2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x614, 	%sys_tick_cmpr
loop_1:
	nop
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
	nop
	set	0x18, %l5
	ldsh	[%l7 + %l5],	%i0
	nop
	set	0x36, %i3
	ldstub	[%l7 + %i3],	%o2
	nop
	set	0x74, %g7
	ldsh	[%l7 + %g7],	%l5
	or	%g7,	%l4,	%i7
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	st	%f16,	[%l7 + 0x54]
	set	0x28, %o5
	lda	[%l7 + %o5] 0x89,	%f31
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	set	0x67, %l2
	ldstuba	[%l7 + %l2] 0x88,	%i3
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%i2
	nop
	set	0x28, %i2
	sth	%l1,	[%l7 + %i2]
	set	0x28, %l4
	lda	[%l7 + %l4] 0x89,	%f8
	nop
	set	0x40, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x43, %i7
	ldub	[%l7 + %i7],	%o4
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%g2
	set	0x74, %o0
	stwa	%i4,	[%l7 + %o0] 0x80
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%l6
	set	0x4A, %g4
	stha	%o0,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x11, %i4
	ldsb	[%l7 + %i4],	%i1
	set	0x08, %i0
	stda	%l2,	[%l7 + %i0] 0x88
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x88,	%g5
	nop
	set	0x1C, %o1
	swap	[%l7 + %o1],	%i5
	nop
	set	0x4C, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x63, %l1
	ldub	[%l7 + %l1],	%l3
	nop
	set	0x48, %g5
	sth	%g4,	[%l7 + %g5]
	nop
	set	0x64, %o7
	lduw	[%l7 + %o7],	%l0
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g6
	nop
	set	0x1E, %g6
	ldub	[%l7 + %g6],	%o6
	set	0x68, %o2
	lda	[%l7 + %o2] 0x89,	%f27
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x89,	 1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%o5
	nop
	set	0x24, %i3
	ldub	[%l7 + %i3],	%i0
	set	0x1C, %g7
	stwa	%i6,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%g7
	st	%f27,	[%l7 + 0x1C]
	ld	[%l7 + 0x20],	%f9
	bne	%xcc,	loop_2
	nop
	set	0x20, %l5
	ldsh	[%l7 + %l5],	%l4
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xeb,	%o2
loop_2:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%l1
	ld	[%l7 + 0x74],	%f15
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%g3
	and	%i4,	%o4,	%o0
	nop
	set	0x44, %o5
	sth	%i1,	[%l7 + %o5]
	nop
	set	0x54, %g3
	sth	%l2,	[%l7 + %g3]
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l6
	st	%f31,	[%l7 + 0x08]
	nop
	set	0x6E, %i2
	lduh	[%l7 + %i2],	%o7
	set	0x3F, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g5
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%i4
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%l3
	and	%g4,	%l0,	%o1
	nop
	set	0x7C, %g2
	ldub	[%l7 + %g2],	%g6
	nop
	set	0x7C, %o0
	ldsh	[%l7 + %o0],	%o6
	nop
	set	0x38, %i7
	stx	%g2,	[%l7 + %i7]
	nop
	set	0x60, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x08, %i4
	stx	%g1,	[%l7 + %i4]
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%o4
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f14
	nop
	set	0x68, %l0
	swap	[%l7 + %l0],	%i0
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x81,	%i6
	nop
	set	0x40, %l3
	stw	%l5,	[%l7 + %l3]
	ble	%icc,	loop_3
	nop
	set	0x09, %l1
	stb	%g7,	[%l7 + %l1]
	wr	%l4,	%o3,	%set_softint
	nop
	set	0x48, %g5
	prefetch	[%l7 + %g5],	 4
loop_3:
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%o2
	and	%i7,	%g3,	%i4
	nop
	set	0x53, %o7
	ldub	[%l7 + %o7],	%o0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%o4
	set	0x5E, %o2
	stha	%l2,	[%l7 + %o2] 0xe2
	membar	#Sync
	add	%l6,	%o7,	%g5
	set	0x72, %i1
	stha	%i1,	[%l7 + %i1] 0x89
	nop
	set	0x6C, %i3
	swap	[%l7 + %i3],	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%l0
	set	0x1C, %g6
	sta	%f0,	[%l7 + %g6] 0x88
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %o3
	sth	%g4,	[%l7 + %o3]
	nop
	set	0x28, %o4
	stb	%o1,	[%l7 + %o4]
	nop
	set	0x70, %g7
	lduw	[%l7 + %g7],	%g6
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xeb,	%o6
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x89,	%g1
	nop
	set	0x10, %i2
	stw	%o5,	[%l7 + %i2]
	or	%i0,	%g2,	%i6
	add	%g7,	%l4,	%o3
	nop
	set	0x3C, %g3
	sth	%l5,	[%l7 + %g3]
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%i2
	set	0x62, %i6
	stha	%l1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f24
	nop
	set	0x57, %l2
	ldstub	[%l7 + %l2],	%i3
	set	0x68, %i7
	lda	[%l7 + %i7] 0x89,	%f27
	or	%i7,	%o2,	%g3
	and	%i4,	%o4,	%l2
	ba,a,pt	%xcc,	loop_4
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f16
	nop
	set	0x60, %i4
	std	%f6,	[%l7 + %i4]
	set	0x70, %i0
	swapa	[%l7 + %i0] 0x80,	%o0
loop_4:
	nop
	set	0x3C, %o0
	sta	%f20,	[%l7 + %o0] 0x89
	set	0x18, %l0
	lda	[%l7 + %l0] 0x81,	%f18
	st	%fsr,	[%l7 + 0x70]
	set	0x0C, %l6
	lda	[%l7 + %l6] 0x80,	%f7
	nop
	set	0x78, %g4
	ldsh	[%l7 + %g4],	%o7
	nop
	set	0x08, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x18, %g5
	std	%i6,	[%l7 + %g5]
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i5
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x89,	 1
	set	0x32, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g5
	set	0x44, %o2
	stwa	%g4,	[%l7 + %o2] 0x80
	set	0x50, %o1
	lda	[%l7 + %o1] 0x88,	%f0
	nop
	set	0x68, %i3
	std	%o0,	[%l7 + %i3]
	set	0x1F, %i1
	stba	%o6,	[%l7 + %i1] 0xe3
	membar	#Sync
	and	%g1,	%g6,	%i0
	nop
	set	0x5C, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x65, %o3
	ldub	[%l7 + %o3],	%o5
	set	0x28, %l5
	sta	%f18,	[%l7 + %l5] 0x88
	set	0x18, %g7
	stwa	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x60]
	set	0x09, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g2
	nop
	set	0x48, %o6
	std	%g6,	[%l7 + %o6]
	fpadd32	%f0,	%f0,	%f8
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%l4
	set	0x29, %i2
	ldstuba	[%l7 + %i2] 0x81,	%l5
	set	0x6C, %l4
	stwa	%o3,	[%l7 + %l4] 0x88
	nop
	set	0x2C, %i6
	sth	%i2,	[%l7 + %i6]
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%i3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%i7
	nop
	set	0x79, %g3
	ldub	[%l7 + %g3],	%g3
	and	%i4,	%o2,	%l2
	nop
	set	0x30, %i7
	ldsh	[%l7 + %i7],	%o4
	nop
	set	0x40, %i5
	std	%o0,	[%l7 + %i5]
	nop
	set	0x76, %l2
	lduh	[%l7 + %l2],	%l6
	or	%o7,	%i1,	%l3
	nop
	set	0x4C, %i4
	stw	%l0,	[%l7 + %i4]
	nop
	set	0x74, %o0
	lduh	[%l7 + %o0],	%g5
	ld	[%l7 + 0x48],	%f23
	st	%f23,	[%l7 + 0x24]
	set	0x30, %i0
	stxa	%g4,	[%l7 + %i0] 0x89
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x89,	%f23
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%i5
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%o6
	nop
	set	0x1C, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x24, %l0
	stb	%g6,	[%l7 + %l0]
	set	0x78, %g5
	stxa	%i0,	[%l7 + %g5] 0x80
	nop
	set	0x70, %l3
	swap	[%l7 + %l3],	%o5
	nop
	set	0x70, %o7
	ldsw	[%l7 + %o7],	%g1
	add	%i6,	%g7,	%l4
	add	%g2,	%o3,	%i2
	set	0x10, %o2
	stda	%i2,	[%l7 + %o2] 0x88
	wr	%l5,	%l1,	%ccr
	set	0x68, %g1
	stxa	%g3,	[%l7 + %g1] 0xe2
	membar	#Sync
	and	%i7,	%i4,	%l2
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%o2
	nop
	set	0x62, %i3
	lduh	[%l7 + %i3],	%o4
	nop
	set	0x26, %g6
	ldsh	[%l7 + %g6],	%l6
	nop
	set	0x64, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x48, %l5
	sta	%f24,	[%l7 + %l5] 0x89
	set	0x78, %i1
	stwa	%o0,	[%l7 + %i1] 0x81
	set	0x68, %o5
	stxa	%o7,	[%l7 + %o5] 0xeb
	membar	#Sync
	fpsub16s	%f21,	%f2,	%f3
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%l3
	nop
	set	0x78, %g7
	std	%i0,	[%l7 + %g7]
	set	0x08, %o4
	stxa	%l0,	[%l7 + %o4] 0x81
	nop
	set	0x30, %l4
	std	%f6,	[%l7 + %l4]
	set	0x14, %i6
	sta	%f3,	[%l7 + %i6] 0x81
	nop
	set	0x70, %i2
	std	%g4,	[%l7 + %i2]
	nop
	set	0x52, %g3
	sth	%o1,	[%l7 + %g3]
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%i5
	set	0x28, %g2
	lda	[%l7 + %g2] 0x80,	%f26
	nop
	set	0x7D, %i5
	stb	%o6,	[%l7 + %i5]
	nop
	set	0x70, %i4
	stx	%g5,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%o5
	set	0x54, %o0
	stwa	%i0,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x0C, %i0
	lduw	[%l7 + %i0],	%g1
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	nop
	set	0x10, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x48, %l1
	stw	%g7,	[%l7 + %l1]
	set	0x44, %l0
	lda	[%l7 + %l0] 0x89,	%f10
	nop
	set	0x50, %l6
	std	%l4,	[%l7 + %l6]
	nop
	set	0x1A, %g5
	ldsh	[%l7 + %g5],	%g2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%i2
	set	0x47, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i3
	set	0x64, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o3
	and	%l1,	%g3,	%l5
	nop
	set	0x58, %o7
	ldstub	[%l7 + %o7],	%i4
	nop
	set	0x16, %g1
	ldsb	[%l7 + %g1],	%l2
	set	0x39, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i7
	st	%f4,	[%l7 + 0x6C]
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f18
	set	0x4E, %g6
	stha	%o2,	[%l7 + %g6] 0x88
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l6
	nop
	set	0x3E, %o3
	ldstub	[%l7 + %o3],	%o0
	set	0x28, %l5
	stxa	%l3,	[%l7 + %l5] 0x80
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f16
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f16
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	nop
	set	0x1B, %o6
	ldub	[%l7 + %o6],	%l0
	st	%f24,	[%l7 + 0x50]
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%i1
	nop
	set	0x7C, %o4
	swap	[%l7 + %o4],	%o1
	nop
	set	0x58, %i2
	ldsw	[%l7 + %i2],	%i5
	or	%o6,	%g5,	%g6
	nop
	set	0x60, %i6
	stw	%o5,	[%l7 + %i6]
	bl,a	%icc,	loop_5
	or	%i0,	%g1,	%g4
	nop
	set	0x47, %i7
	ldstub	[%l7 + %i7],	%g7
	bgu,a	%xcc,	loop_6
loop_5:
	fpadd16s	%f21,	%f3,	%f31
	nop
	set	0x2A, %g2
	ldsb	[%l7 + %g2],	%l4
	st	%fsr,	[%l7 + 0x3C]
loop_6:
	nop
	set	0x30, %i5
	lda	[%l7 + %i5] 0x80,	%f8
	nop
	set	0x16, %g3
	lduh	[%l7 + %g3],	%i6
	nop
	set	0x45, %i4
	ldstub	[%l7 + %i4],	%g2
	nop
	set	0x6C, %o0
	lduw	[%l7 + %o0],	%i3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%f16
	nop
	set	0x34, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x68, %i0
	stx	%i2,	[%l7 + %i0]
	nop
	set	0x38, %l0
	std	%l0,	[%l7 + %l0]
	nop
	set	0x5C, %l6
	lduh	[%l7 + %l6],	%g3
	ld	[%l7 + 0x18],	%f30
	set	0x70, %g5
	stxa	%o3,	[%l7 + %g5] 0x81
	or	%l5,	%l2,	%i4
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%i7
	nop
	set	0x7C, %l3
	ldsw	[%l7 + %l3],	%o4
	nop
	set	0x51, %o7
	ldub	[%l7 + %o7],	%l6
	nop
	set	0x20, %o2
	ldstub	[%l7 + %o2],	%o2
	nop
	set	0x28, %g1
	std	%o0,	[%l7 + %g1]
	set	0x08, %o1
	stxa	%l3,	[%l7 + %o1] 0xea
	membar	#Sync
	and	%o7,	%i1,	%l0
	st	%f23,	[%l7 + 0x2C]
	st	%f25,	[%l7 + 0x28]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f0
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x80,	%o1
	nop
	set	0x26, %l5
	ldub	[%l7 + %l5],	%o6
	or	%g5,	%i5,	%g6
	nop
	set	0x60, %o5
	std	%o4,	[%l7 + %o5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%g4
	bleu,a	%xcc,	loop_7
	nop
	set	0x66, %i1
	sth	%g7,	[%l7 + %i1]
	add	%i0,	%l4,	%g2
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%i2
loop_7:
	nop
	set	0x40, %o6
	std	%f2,	[%l7 + %o6]
	set	0x2C, %l4
	sta	%f8,	[%l7 + %l4] 0x88
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%i2
	add	%i6,	%g3,	%o3
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x28, %i2
	std	%f20,	[%l7 + %i2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%l2
	nop
	set	0x10, %i7
	stx	%l1,	[%l7 + %i7]
	set	0x50, %i6
	swapa	[%l7 + %i6] 0x89,	%i7
	set	0x2C, %i5
	swapa	[%l7 + %i5] 0x81,	%o4
	or	%l6,	%i4,	%o0
	set	0x7D, %g2
	ldstuba	[%l7 + %g2] 0x80,	%l3
	set	0x54, %g3
	lda	[%l7 + %g3] 0x81,	%f18
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%i1
	nop
	set	0x26, %i4
	ldstub	[%l7 + %i4],	%l0
	set	0x0C, %l2
	stwa	%o1,	[%l7 + %l2] 0x89
	set	0x2A, %o0
	stha	%o6,	[%l7 + %o0] 0x88
	nop
	set	0x58, %i0
	ldsh	[%l7 + %i0],	%o7
	ba	%icc,	loop_8
	nop
	set	0x1E, %g4
	sth	%i5,	[%l7 + %g4]
	nop
	set	0x7B, %l0
	stb	%g6,	[%l7 + %l0]
	nop
	set	0x2C, %l6
	ldsw	[%l7 + %l6],	%g5
loop_8:
	nop
	set	0x40, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x81,	 1
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xd0
	nop
	set	0x4C, %g1
	ldub	[%l7 + %g1],	%g4
	or	%o5,	%g7,	%l4
	ble,pt	%icc,	loop_9
	nop
	set	0x5A, %o1
	ldstub	[%l7 + %o1],	%g2
	fpsub16s	%f27,	%f25,	%f0
	or	%i0,	%i3,	%i2
loop_9:
	nop
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f16
	nop
	set	0x28, %o2
	std	%i6,	[%l7 + %o2]
	be,pn	%xcc,	loop_10
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x08, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x74, %o5
	sth	%g3,	[%l7 + %o5]
loop_10:
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f4
	nop
	set	0x77, %g7
	ldstub	[%l7 + %g7],	%l5
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xeb,	%l2
	nop
	set	0x24, %l4
	stw	%o3,	[%l7 + %l4]
	set	0x48, %o3
	sta	%f26,	[%l7 + %o3] 0x89
	nop
	set	0x10, %o4
	std	%i6,	[%l7 + %o4]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l1
	and	%l6,	%o0,	%l3
	set	0x5A, %i2
	stba	%i4,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x7B, %i1
	stb	%i1,	[%l7 + %i1]
	nop
	set	0x7C, %i6
	lduh	[%l7 + %i6],	%o2
	set	0x2E, %i5
	stha	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%o6
	nop
	set	0x24, %g2
	ldsw	[%l7 + %g2],	%o7
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x54, %g3
	stw	%g1,	[%l7 + %g3]
	set	0x38, %i4
	lda	[%l7 + %i4] 0x88,	%f21
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x88,	%g4
	set	0x1D, %o0
	ldstuba	[%l7 + %o0] 0x80,	%o5
	nop
	set	0x48, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	set	0x60, %l6
	stwa	%g7,	[%l7 + %l6] 0x89
	nop
	set	0x46, %i0
	ldsb	[%l7 + %i0],	%g5
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x74, %l1
	stwa	%l4,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x5C, %l3
	swapa	[%l7 + %l3] 0x81,	%g2
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	add	%i3,	%i2,	%i0
	nop
	set	0x4D, %o1
	ldub	[%l7 + %o1],	%i6
	set	0x40, %o7
	swapa	[%l7 + %o7] 0x81,	%g3
	add	%l2,	%l5,	%o3
	nop
	set	0x19, %g6
	ldstub	[%l7 + %g6],	%i7
	nop
	set	0x7C, %l5
	ldub	[%l7 + %l5],	%o4
	set	0x44, %o2
	sta	%f1,	[%l7 + %o2] 0x88
	nop
	set	0x38, %o5
	ldstub	[%l7 + %o5],	%l6
	nop
	set	0x20, %g7
	std	%o0,	[%l7 + %g7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i4
	st	%f11,	[%l7 + 0x30]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%l1
	nop
	set	0x68, %o6
	std	%f14,	[%l7 + %o6]
	nop
	set	0x1D, %l4
	stb	%l0,	[%l7 + %l4]
	nop
	set	0x08, %i3
	lduw	[%l7 + %i3],	%o2
	nop
	set	0x26, %o3
	ldsh	[%l7 + %o3],	%o1
	wr	%o6,	%i5,	%sys_tick
	bne,pt	%icc,	loop_11
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%o7
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x4C, %i6
	ldsh	[%l7 + %i6],	%g1
loop_11:
	bne,pn	%icc,	loop_12
	nop
	set	0x45, %i5
	ldstub	[%l7 + %i5],	%g4
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%g6
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
loop_12:
	nop
	set	0x16, %i4
	sth	%o5,	[%l7 + %i4]
	set	0x24, %g3
	swapa	[%l7 + %g3] 0x88,	%g7
	and	%g5,	%g2,	%l4
	nop
	set	0x2C, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x0C, %l2
	sta	%f29,	[%l7 + %l2] 0x80
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%i3
	nop
	set	0x2A, %i7
	sth	%i0,	[%l7 + %i7]
	nop
	set	0x70, %g4
	sth	%g3,	[%l7 + %g4]
	nop
	set	0x62, %l0
	lduh	[%l7 + %l0],	%l2
	add	%l5,	%i6,	%i7
	set	0x4A, %i0
	stha	%o4,	[%l7 + %i0] 0x89
	nop
	set	0x7B, %g5
	ldstub	[%l7 + %g5],	%l6
	or	%o3,	%l3,	%o0
	nop
	set	0x38, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x18, %l6
	lda	[%l7 + %l6] 0x81,	%f22
	set	0x2A, %l3
	stha	%i1,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x14, %g1
	lda	[%l7 + %g1] 0x81,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%l1
	nop
	set	0x09, %o1
	ldsb	[%l7 + %o1],	%o2
	set	0x32, %o7
	stha	%o1,	[%l7 + %o7] 0xe3
	membar	#Sync
	and	%o6,	%i5,	%l0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f16
	nop
	set	0x0F, %g6
	ldsb	[%l7 + %g6],	%g1
	nop
	set	0x40, %o5
	ldsw	[%l7 + %o5],	%g4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%o5
	set	0x08, %g7
	stda	%g6,	[%l7 + %g7] 0x89
	fpsub16s	%f3,	%f18,	%f14
	or	%g5,	%g2,	%g6
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f20
	bl,a	%icc,	loop_13
	st	%f29,	[%l7 + 0x20]
	nop
	set	0x30, %l4
	std	%f28,	[%l7 + %l4]
	nop
	set	0x50, %i3
	stx	%l4,	[%l7 + %i3]
loop_13:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%i2
	nop
	set	0x1C, %o2
	swap	[%l7 + %o2],	%i0
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%i2
	nop
	set	0x55, %i6
	ldstub	[%l7 + %i6],	%l2
	set	0x38, %i2
	stda	%g2,	[%l7 + %i2] 0x89
	nop
	set	0x0E, %i5
	ldsh	[%l7 + %i5],	%i6
	nop
	set	0x57, %o4
	ldstub	[%l7 + %o4],	%i7
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f0
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%o4
	nop
	set	0x30, %o0
	sth	%l6,	[%l7 + %o0]
	set	0x2E, %l2
	stba	%l5,	[%l7 + %l2] 0x81
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x89,	%f20
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%o3
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x80,	%o0
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%i4
	set	0x58, %i0
	swapa	[%l7 + %i0] 0x88,	%l1
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x81,	%l3
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f14
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd0
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%o1
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x34, %o1
	ldstub	[%l7 + %o1],	%o2
	set	0x38, %o7
	stha	%o6,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x40, %l5
	std	%l0,	[%l7 + %l5]
	nop
	set	0x08, %l3
	lduw	[%l7 + %l3],	%g1
	nop
	set	0x5C, %g6
	sth	%i5,	[%l7 + %g6]
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%g4
	nop
	set	0x6A, %o6
	sth	%o7,	[%l7 + %o6]
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%o5
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%g7
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%g2
	set	0x31, %o5
	stba	%g6,	[%l7 + %o5] 0x81
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l4
	set	0x24, %i1
	lda	[%l7 + %i1] 0x80,	%f28
	nop
	set	0x46, %o2
	stb	%i3,	[%l7 + %o2]
	add	%i0,	%i2,	%l2
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x20, %i5
	std	%i6,	[%l7 + %i5]
	or	%g3,	%o4,	%i7
	set	0x4C, %o4
	stha	%l6,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xcc
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x89,	%o0
	or	%l5,	%i4,	%i1
	st	%fsr,	[%l7 + 0x24]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x81
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%o1
	nop
	set	0x0C, %l2
	lduh	[%l7 + %l2],	%o2
	nop
	set	0x68, %i7
	lduw	[%l7 + %i7],	%l3
	st	%f17,	[%l7 + 0x58]
	nop
	set	0x1F, %g3
	ldstub	[%l7 + %g3],	%l0
	set	0x2A, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o6
	nop
	set	0x16, %i0
	ldub	[%l7 + %i0],	%i5
	set	0x78, %g4
	swapa	[%l7 + %g4] 0x89,	%g1
	fpsub16s	%f28,	%f24,	%f30
	set	0x2D, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g4
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%o7
	set	0x44, %l1
	lda	[%l7 + %l1] 0x89,	%f14
	nop
	set	0x58, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x48, %o7
	stx	%g2,	[%l7 + %o7]
	set	0x08, %l5
	stwa	%g6,	[%l7 + %l5] 0x81
	set	0x3E, %g1
	stba	%g5,	[%l7 + %g1] 0x89
	nop
	set	0x30, %l3
	stx	%l4,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x38, %g7
	std	%i2,	[%l7 + %g7]
	or	%g7,	%i0,	%i2
	set	0x10, %o6
	stxa	%i6,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x1A, %g6
	sth	%l2,	[%l7 + %g6]
	nop
	set	0x4C, %i3
	stw	%o4,	[%l7 + %i3]
	set	0x24, %l4
	sta	%f16,	[%l7 + %l4] 0x80
	ld	[%l7 + 0x34],	%f18
	fpsub32	%f2,	%f26,	%f22
	nop
	set	0x5C, %o3
	lduw	[%l7 + %o3],	%i7
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc2
	nop
	set	0x2C, %o2
	prefetch	[%l7 + %o2],	 4
	nop
	set	0x70, %i1
	std	%i6,	[%l7 + %i1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%o0
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%o2
	nop
	set	0x20, %i2
	std	%l4,	[%l7 + %i2]
	nop
	set	0x43, %o4
	ldub	[%l7 + %o4],	%i1
	set	0x10, %g2
	sta	%f16,	[%l7 + %g2] 0x81
	nop
	set	0x2C, %i6
	ldsw	[%l7 + %i6],	%l1
	or	%o1,	%o2,	%l3
	nop
	set	0x3C, %o0
	ldsw	[%l7 + %o0],	%i4
	st	%f17,	[%l7 + 0x2C]
	set	0x6C, %i4
	sta	%f20,	[%l7 + %i4] 0x81
	set	0x08, %l2
	stxa	%l0,	[%l7 + %l2] 0x89
	nop
	set	0x08, %g3
	lduh	[%l7 + %g3],	%o6
	set	0x20, %l0
	stwa	%g1,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x78, %i0
	stw	%i5,	[%l7 + %i0]
	set	0x79, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o7
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%g4
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x89,	 3
	nop
	set	0x2C, %g5
	lduw	[%l7 + %g5],	%g6
	set	0x49, %l1
	stba	%g5,	[%l7 + %l1] 0xe3
	membar	#Sync
	and	%o5,	%i3,	%g7
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	set	0x0C, %o1
	stwa	%l4,	[%l7 + %o1] 0x80
	nop
	set	0x10, %l5
	stw	%i0,	[%l7 + %l5]
	nop
	set	0x30, %g1
	stw	%i6,	[%l7 + %g1]
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%l2
	set	0x38, %l3
	stha	%i2,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x2B, %g6
	ldub	[%l7 + %g6],	%o4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf1
	membar	#Sync
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x80,	%i7
	nop
	set	0x10, %o6
	ldsw	[%l7 + %o6],	%g3
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x0C, %o3
	stwa	%o0,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x28, %o2
	stha	%o3,	[%l7 + %o2] 0xe3
	membar	#Sync
	and	%l5,	%l6,	%i1
	nop
	set	0x20, %i5
	std	%f12,	[%l7 + %i5]
	set	0x20, %i1
	stxa	%o1,	[%l7 + %i1] 0x88
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	nop
	set	0x28, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x70, %g2
	swap	[%l7 + %g2],	%o2
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x89,	%l1
	nop
	set	0x0A, %i4
	ldsh	[%l7 + %i4],	%l3
	set	0x20, %l2
	lda	[%l7 + %l2] 0x89,	%f13
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%g1
	set	0x54, %l0
	stha	%i5,	[%l7 + %l0] 0x81
	set	0x38, %g3
	sta	%f26,	[%l7 + %g3] 0x81
	set	0x4C, %g4
	sta	%f19,	[%l7 + %g4] 0x89
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%o7
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x81,	%g4
	set	0x78, %l6
	stda	%o6,	[%l7 + %l6] 0x88
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 1
	nop
	set	0x30, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x38, %o1
	std	%g4,	[%l7 + %o1]
	fpadd32s	%f9,	%f28,	%f24
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%g2
	nop
	set	0x7C, %l5
	stw	%o5,	[%l7 + %l5]
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%i3
	nop
	set	0x7C, %g7
	ldsb	[%l7 + %g7],	%g7
	nop
	set	0x30, %g6
	std	%f2,	[%l7 + %g6]
	nop
	set	0x5D, %l3
	ldub	[%l7 + %l3],	%i0
	set	0x38, %i3
	lda	[%l7 + %i3] 0x80,	%f9
	nop
	set	0x5C, %l4
	lduw	[%l7 + %l4],	%l4
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf8
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xc2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f16
	or	%l2,	%i2,	%i6
	set	0x3A, %o5
	stba	%o4,	[%l7 + %o5] 0x89
	nop
	set	0x58, %i1
	std	%i6,	[%l7 + %i1]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%o3
	set	0x44, %i5
	stha	%o0,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
	st	%f26,	[%l7 + 0x3C]
	set	0x69, %g2
	stba	%l6,	[%l7 + %g2] 0xe2
	membar	#Sync
	bl,a,pn	%xcc,	loop_14
	nop
	set	0x68, %i6
	swap	[%l7 + %i6],	%i1
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f12
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
loop_14:
	nop
	set	0x30, %o0
	swapa	[%l7 + %o0] 0x89,	%o2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%l3
	nop
	set	0x12, %l2
	ldsh	[%l7 + %l2],	%i4
	nop
	set	0x4C, %l0
	prefetch	[%l7 + %l0],	 0
	nop
	set	0x3E, %g3
	ldub	[%l7 + %g3],	%l0
	set	0x44, %g4
	stwa	%g1,	[%l7 + %g4] 0xe2
	membar	#Sync
	st	%f8,	[%l7 + 0x4C]
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 0
	and	%i5,	%o1,	%g4
	set	0x68, %i0
	stxa	%o6,	[%l7 + %i0] 0x89
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x80,	%o7
	st	%f28,	[%l7 + 0x2C]
	nop
	set	0x08, %l6
	swap	[%l7 + %l6],	%g5
	nop
	set	0x10, %o1
	sth	%g6,	[%l7 + %o1]
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f4
	set	0x39, %g5
	stba	%g2,	[%l7 + %g5] 0x80
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%i3
	nop
	set	0x7C, %l5
	ldsh	[%l7 + %l5],	%o5
	set	0x10, %g7
	ldda	[%l7 + %g7] 0xe2,	%i0
	set	0x58, %g6
	stxa	%g7,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x1C, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l2
	nop
	set	0x44, %l4
	ldsb	[%l7 + %l4],	%i2
	and	%i6,	%l4,	%o4
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%g3
	nop
	set	0x08, %o3
	std	%i6,	[%l7 + %o3]
	set	0x48, %i3
	stxa	%o0,	[%l7 + %i3] 0x80
	nop
	set	0x08, %o5
	ldsh	[%l7 + %o5],	%l5
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	and	%l6,	%i1,	%o3
	set	0x17, %o2
	stba	%o2,	[%l7 + %o2] 0x81
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f16
	wr	%l1,	%l3,	%sys_tick
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd2
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf8
	membar	#Sync
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x3D, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i4
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x89,	%g0
	nop
	set	0x54, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x88,	%l0
	nop
	set	0x4A, %l0
	lduh	[%l7 + %l0],	%o1
	nop
	set	0x58, %g4
	std	%f14,	[%l7 + %g4]
	fpsub32s	%f13,	%f8,	%f30
	st	%fsr,	[%l7 + 0x10]
	add	%g4,	%i5,	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%g6
	set	0x50, %i0
	stwa	%o7,	[%l7 + %i0] 0x80
	add	%i3,	%g2,	%o5
	nop
	set	0x78, %i7
	stx	%i0,	[%l7 + %i7]
	or	%g7,	%l2,	%i6
	add	%l4,	%i2,	%g3
	set	0x08, %l1
	stda	%o4,	[%l7 + %l1] 0x80
	nop
	set	0x20, %o1
	stx	%i7,	[%l7 + %o1]
	nop
	set	0x6A, %l6
	ldsh	[%l7 + %l6],	%l5
	set	0x55, %o7
	stba	%l6,	[%l7 + %o7] 0x81
	and	%o0,	%i1,	%o2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%l3
	nop
	set	0x4E, %g5
	sth	%o3,	[%l7 + %g5]
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xe2,	%g0
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 1
	and	%i4,	%l0,	%g4
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f18
	nop
	set	0x18, %l5
	stx	%i5,	[%l7 + %l5]
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x88,	 3
	nop
	set	0x27, %o6
	ldsb	[%l7 + %o6],	%g5
	set	0x24, %o3
	lda	[%l7 + %o3] 0x81,	%f23
	or	%g6,	%o7,	%i3
	nop
	set	0x18, %l3
	std	%o0,	[%l7 + %l3]
	set	0x3C, %i3
	stwa	%o5,	[%l7 + %i3] 0xeb
	membar	#Sync
	and	%g2,	%g7,	%l2
	set	0x70, %i1
	ldda	[%l7 + %i1] 0xe3,	%i6
	set	0x68, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0
	st	%fsr,	[%l7 + 0x20]
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	nop
	set	0x2C, %o4
	swap	[%l7 + %o4],	%l4
	set	0x08, %g2
	swapa	[%l7 + %g2] 0x80,	%g3
	set	0x10, %i4
	sta	%f5,	[%l7 + %i4] 0x80
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l5
	nop
	set	0x3B, %o5
	ldsb	[%l7 + %o5],	%i7
	set	0x38, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%i1
	nop
	set	0x6C, %o0
	lduh	[%l7 + %o0],	%o2
	ld	[%l7 + 0x40],	%f2
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f16
	nop
	set	0x11, %l0
	stb	%l1,	[%l7 + %l0]
	nop
	set	0x0C, %i2
	lduh	[%l7 + %i2],	%l3
	nop
	set	0x10, %g4
	std	%i6,	[%l7 + %g4]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%i4
	nop
	set	0x08, %i0
	std	%f26,	[%l7 + %i0]
	nop
	set	0x62, %i7
	ldsh	[%l7 + %i7],	%o3
	set	0x30, %o1
	lda	[%l7 + %o1] 0x80,	%f26
	nop
	set	0x70, %l1
	sth	%g4,	[%l7 + %l1]
	nop
	set	0x20, %l6
	swap	[%l7 + %l6],	%i5
	nop
	set	0x1C, %o7
	swap	[%l7 + %o7],	%l0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd2
	or	%o6,	%g5,	%o7
	st	%f18,	[%l7 + 0x18]
	or	%g6,	%i3,	%o1
	and	%o5,	%g2,	%l2
	nop
	set	0x70, %g7
	stw	%i6,	[%l7 + %g7]
	bne	%icc,	loop_15
	nop
	set	0x74, %g6
	lduw	[%l7 + %g6],	%g7
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x89
loop_15:
	or	%i0,	%i2,	%l4
	bg,a	%icc,	loop_16
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x3A, %g5
	ldub	[%l7 + %g5],	%g3
	st	%fsr,	[%l7 + 0x10]
loop_16:
	nop
	set	0x30, %o6
	prefetch	[%l7 + %o6],	 1
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x81,	%l5
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%i6
	nop
	set	0x24, %l4
	ldsw	[%l7 + %l4],	%o4
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x80,	 3
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x0A, %i3
	lduh	[%l7 + %i3],	%i1
	nop
	set	0x28, %i5
	lduh	[%l7 + %i5],	%l1
	nop
	set	0x10, %o4
	stx	%o2,	[%l7 + %o4]
	nop
	set	0x12, %g2
	ldstub	[%l7 + %g2],	%l3
	st	%f4,	[%l7 + 0x78]
	set	0x58, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l6
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f20
	set	0x0C, %i6
	stwa	%g1,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%o2
	bn,a,pn	%xcc,	loop_17
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 3
	set	0x64, %o0
	lda	[%l7 + %o0] 0x81,	%f29
loop_17:
	nop
	set	0x68, %l0
	lda	[%l7 + %l0] 0x89,	%f5
	ld	[%l7 + 0x44],	%f9
	add	%g4,	%i4,	%l0
	nop
	set	0x41, %g3
	ldub	[%l7 + %g3],	%i5
	set	0x5C, %g4
	stwa	%o6,	[%l7 + %g4] 0x89
	add	%g5,	%o7,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%o5
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%g6
	or	%g2,	%l2,	%g7
	set	0x60, %i7
	stxa	%i0,	[%l7 + %i7] 0xea
	membar	#Sync
	ld	[%l7 + 0x64],	%f30
	set	0x30, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i2
	set	0x18, %l1
	stda	%i6,	[%l7 + %l1] 0x80
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x89,	%l5
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x48, %g7
	sth	%i7,	[%l7 + %g7]
	set	0x18, %g6
	stwa	%g3,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x1D, %i2
	stba	%o4,	[%l7 + %i2] 0x81
	set	0x28, %l5
	stba	%i1,	[%l7 + %l5] 0x89
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x88,	%l0
	nop
	nop
	setx	0xB8AB2B2B1D9245AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAC10AF6831C73A00,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f22,	%f26
	set	0x15, %o3
	ldstuba	[%l7 + %o3] 0x88,	%o0
	nop
	set	0x26, %l3
	stb	%l3,	[%l7 + %l3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%g1
	nop
	set	0x60, %g5
	stw	%o2,	[%l7 + %g5]
	set	0x26, %l4
	stba	%o3,	[%l7 + %l4] 0x81
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%i4
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%i4
	nop
	set	0x08, %o4
	std	%o6,	[%l7 + %o4]
	set	0x60, %i5
	lda	[%l7 + %i5] 0x89,	%f9
	ld	[%l7 + 0x28],	%f7
	nop
	set	0x7B, %o2
	ldsb	[%l7 + %o2],	%g5
	nop
	set	0x36, %o5
	ldsh	[%l7 + %o5],	%o7
	set	0x50, %i6
	lda	[%l7 + %i6] 0x88,	%f10
	fpsub32	%f20,	%f8,	%f0
	nop
	set	0x38, %g2
	std	%i2,	[%l7 + %g2]
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%o1
	set	0x7C, %o0
	stba	%o5,	[%l7 + %o0] 0x88
	set	0x10, %l2
	stxa	%g6,	[%l7 + %l2] 0x88
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x81,	 3
	or	%l2,	%g7,	%i0
	set	0x10, %g3
	stxa	%i2,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x2C, %g4
	stb	%i6,	[%l7 + %g4]
	and	%l4,	%l0,	%l5
	nop
	set	0x58, %i0
	std	%g2,	[%l7 + %i0]
	nop
	set	0x78, %o1
	std	%f4,	[%l7 + %o1]
	ld	[%l7 + 0x3C],	%f8
	or	%o4,	%i1,	%l1
	nop
	set	0x38, %i7
	stx	%o0,	[%l7 + %i7]
	or	%l3,	%l6,	%g1
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x88,	%i6
	set	0x40, %l1
	stda	%o2,	[%l7 + %l1] 0x89
	set	0x35, %o7
	stba	%o2,	[%l7 + %o7] 0x81
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x80,	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o6
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x80,	 3
	set	0x74, %g6
	lda	[%l7 + %g6] 0x88,	%f12
	nop
	set	0x4E, %l5
	lduh	[%l7 + %l5],	%g5
	nop
	set	0x0E, %i2
	stb	%o7,	[%l7 + %i2]
	nop
	set	0x38, %o3
	std	%i2,	[%l7 + %o3]
	set	0x10, %o6
	stda	%o4,	[%l7 + %o6] 0x80
	nop
	set	0x32, %l3
	lduh	[%l7 + %l3],	%g6
	set	0x58, %g5
	stda	%o0,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x18, %l4
	swapa	[%l7 + %l4] 0x80,	%l2
	nop
	set	0x10, %i3
	ldsh	[%l7 + %i3],	%g2
	be,a	%icc,	loop_18
	ld	[%l7 + 0x74],	%f29
	set	0x64, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i0
loop_18:
	add	%i2,	%i6,	%g7
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%l4,	%l0,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i1
	set	0x5E, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l1
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f10
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x48, %o5
	lduw	[%l7 + %o5],	%l3
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x52, %o0
	lduh	[%l7 + %o0],	%l6
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x88,	%o4
	set	0x68, %l0
	lda	[%l7 + %l0] 0x88,	%f31
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x81,	%g1
	set	0x40, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	nop
	set	0x10, %g4
	lduh	[%l7 + %g4],	%o2
	set	0x30, %i0
	stxa	%i7,	[%l7 + %i0] 0x89
	nop
	set	0x10, %i7
	std	%i4,	[%l7 + %i7]
	set	0x64, %o1
	lda	[%l7 + %o1] 0x89,	%f11
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%o6
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%g4
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x80,	%g5
	add	%i5,	%o7,	%o5
	set	0x0C, %g1
	lda	[%l7 + %g1] 0x81,	%f8
	wr	%i3,	%g6,	%clear_softint
	nop
	set	0x18, %g7
	lduw	[%l7 + %g7],	%l2
	set	0x5F, %g6
	stba	%o1,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x88,	%i0
	nop
	set	0x68, %i2
	std	%i2,	[%l7 + %i2]
	nop
	set	0x56, %o3
	ldstub	[%l7 + %o3],	%i6
	set	0x44, %o6
	swapa	[%l7 + %o6] 0x89,	%g2
	and	%l4,	%g7,	%g3
	set	0x3D, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l0
	nop
	set	0x38, %l4
	ldsh	[%l7 + %l4],	%i1
	nop
	set	0x40, %l3
	ldub	[%l7 + %l3],	%l5
	set	0x60, %o4
	ldda	[%l7 + %o4] 0xea,	%o0
	and	%l3,	%l1,	%o4
	nop
	set	0x40, %i3
	stx	%l6,	[%l7 + %i3]
	set	0x1C, %i1
	lda	[%l7 + %i1] 0x88,	%f28
	set	0x2F, %o2
	ldstuba	[%l7 + %o2] 0x88,	%g1
	nop
	set	0x6C, %i6
	lduh	[%l7 + %i6],	%o2
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x81,	%o2
	set	0x58, %o5
	lda	[%l7 + %o5] 0x88,	%f22
	set	0x40, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i4
	st	%f29,	[%l7 + 0x4C]
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f20
	nop
	set	0x60, %g2
	std	%o6,	[%l7 + %g2]
	wr	%i7,	%g5,	%clear_softint
	nop
	set	0x0C, %l0
	stw	%i5,	[%l7 + %l0]
	nop
	set	0x2A, %g3
	ldsb	[%l7 + %g3],	%o7
	st	%f27,	[%l7 + 0x1C]
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x81,	%o5
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcc
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%i2
	set	0x30, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g4
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%f6,	[%l7 + 0x64]
	set	0x5C, %l6
	stwa	%g6,	[%l7 + %l6] 0x81
	nop
	set	0x67, %l1
	stb	%l2,	[%l7 + %l1]
	nop
	set	0x0C, %g1
	swap	[%l7 + %g1],	%o1
	set	0x14, %g7
	stha	%i0,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x10, %g6
	stx	%i2,	[%l7 + %g6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l4
	set	0x60, %o7
	swapa	[%l7 + %o7] 0x81,	%g7
	add	%i6,	%g3,	%i1
	set	0x75, %l5
	stba	%l5,	[%l7 + %l5] 0x89
	set	0x7C, %o3
	stwa	%l0,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x7C, %i2
	lda	[%l7 + %i2] 0x80,	%f3
	ld	[%l7 + 0x0C],	%f27
	set	0x20, %o6
	stwa	%l3,	[%l7 + %o6] 0x89
	set	0x70, %l4
	lda	[%l7 + %l4] 0x81,	%f3
	set	0x50, %l3
	lda	[%l7 + %l3] 0x81,	%f24
	set	0x50, %o4
	swapa	[%l7 + %o4] 0x89,	%o0
	set	0x77, %g5
	stba	%l1,	[%l7 + %g5] 0x81
	nop
	set	0x0C, %i3
	stw	%l6,	[%l7 + %i3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%o2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%i4
	nop
	set	0x58, %o2
	std	%o6,	[%l7 + %o2]
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%g0
	wr	%g5,	%i5,	%ccr
	set	0x48, %i6
	sta	%f11,	[%l7 + %i6] 0x89
	nop
	set	0x6F, %i5
	ldub	[%l7 + %i5],	%i7
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
	st	%f31,	[%l7 + 0x7C]
	nop
	set	0x10, %o0
	std	%o6,	[%l7 + %o0]
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%i3
	set	0x28, %g2
	swapa	[%l7 + %g2] 0x89,	%g4
	set	0x78, %g3
	stda	%o4,	[%l7 + %g3] 0x89
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%l2
	nop
	set	0x38, %i0
	sth	%g6,	[%l7 + %i0]
	set	0x68, %g4
	stda	%o0,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x58, %l2
	sta	%f24,	[%l7 + %l2] 0x88
	nop
	set	0x40, %o1
	stx	%i0,	[%l7 + %o1]
	set	0x7B, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g2
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%l4
	set	0x3B, %g1
	stba	%i2,	[%l7 + %g1] 0x80
	nop
	set	0x69, %g7
	ldub	[%l7 + %g7],	%i6
	nop
	set	0x67, %g6
	ldub	[%l7 + %g6],	%g3
	nop
	set	0x6C, %l1
	ldstub	[%l7 + %l1],	%g7
	nop
	set	0x54, %o7
	stw	%l5,	[%l7 + %o7]
	nop
	set	0x76, %o3
	ldsb	[%l7 + %o3],	%l0
	add	%l3,	%i1,	%o0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	set	0x48, %l5
	sta	%f30,	[%l7 + %l5] 0x88
	nop
	set	0x35, %l4
	ldstub	[%l7 + %l4],	%l6
	set	0x70, %o6
	stda	%l0,	[%l7 + %o6] 0x80
	nop
	set	0x33, %l3
	ldsb	[%l7 + %l3],	%o2
	set	0x5C, %o4
	stwa	%o3,	[%l7 + %o4] 0x89
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%g1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%o4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc0
	nop
	set	0x46, %i6
	sth	%i7,	[%l7 + %i6]
	set	0x20, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o7
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc2
	set	0x78, %i3
	lda	[%l7 + %i3] 0x80,	%f16
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x74, %i4
	swap	[%l7 + %i4],	%i3
	set	0x68, %o0
	sta	%f25,	[%l7 + %o0] 0x81
	set	0x10, %g2
	sta	%f18,	[%l7 + %g2] 0x81
	set	0x6A, %l0
	stha	%i5,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x0C, %g3
	stw	%g4,	[%l7 + %g3]
	nop
	set	0x1C, %i0
	sth	%o5,	[%l7 + %i0]
	set	0x10, %g4
	lda	[%l7 + %g4] 0x81,	%f14
	nop
	set	0x70, %o1
	stx	%g6,	[%l7 + %o1]
	nop
	set	0x58, %l2
	std	%l2,	[%l7 + %l2]
	nop
	set	0x0C, %l6
	lduh	[%l7 + %l6],	%i0
	set	0x4C, %i7
	sta	%f24,	[%l7 + %i7] 0x88
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%o0
	set	0x28, %g6
	stda	%g2,	[%l7 + %g6] 0x80
	and	%i2,	%l4,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%l5
	nop
	set	0x58, %g7
	stw	%g3,	[%l7 + %g7]
	set	0x2C, %o7
	sta	%f3,	[%l7 + %o7] 0x88
	wr	%l0,	%i1,	%ccr
	or	%l3,	%o0,	%l1
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x88,	%o2
	set	0x34, %l1
	swapa	[%l7 + %l1] 0x80,	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%o6
	nop
	set	0x30, %l5
	std	%i4,	[%l7 + %l5]
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	nop
	set	0x46, %l4
	ldsh	[%l7 + %l4],	%g1
	set	0x0C, %o6
	stwa	%i7,	[%l7 + %o6] 0x88
	set	0x48, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xeb,	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%i3
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 2
	set	0x7F, %o2
	ldstuba	[%l7 + %o2] 0x81,	%g4
	nop
	set	0x78, %i6
	std	%o4,	[%l7 + %i6]
	nop
	set	0x24, %i5
	ldsb	[%l7 + %i5],	%l2
	nop
	set	0x20, %i1
	ldstub	[%l7 + %i1],	%i0
	set	0x40, %o5
	stwa	%g6,	[%l7 + %o5] 0x89
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%g2
	wr 	%g0, 	0x6, 	%fprs
	st	%fsr,	[%l7 + 0x38]
	set	0x76, %o0
	stha	%l4,	[%l7 + %o0] 0x80
	set	0x0E, %g2
	stha	%i6,	[%l7 + %g2] 0x89
	be,a,pt	%xcc,	loop_19
	nop
	set	0x10, %l0
	swap	[%l7 + %l0],	%g7
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%g3
	nop
	set	0x12, %g3
	ldsb	[%l7 + %g3],	%l5
loop_19:
	nop
	set	0x21, %g4
	stba	%l0,	[%l7 + %g4] 0x81
	nop
	set	0x7C, %i0
	stb	%l3,	[%l7 + %i0]
	add	%i1,	%l1,	%o2
	nop
	set	0x3C, %l2
	swap	[%l7 + %l2],	%o0
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf9,	%f16
	nop
	set	0x5C, %i7
	stw	%l6,	[%l7 + %i7]
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x80,	%o6
	set	0x44, %g1
	lda	[%l7 + %g1] 0x81,	%f17
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%i4
	add	%g5,	%o3,	%g1
	nop
	set	0x60, %o7
	stw	%o7,	[%l7 + %o7]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
	set	0x18, %o3
	stwa	%o4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%i6
	nop
	set	0x48, %l5
	stw	%i3,	[%l7 + %l5]
	set	0x0E, %l4
	stba	%g4,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc2
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x81
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x81,	%o5
	set	0x08, %o6
	prefetcha	[%l7 + %o6] 0x88,	 4
	set	0x08, %o2
	stxa	%i5,	[%l7 + %o2] 0x81
	set	0x20, %l3
	swapa	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x6C, %i6
	lduw	[%l7 + %i6],	%g2
	nop
	set	0x20, %i1
	swap	[%l7 + %i1],	%i2
	ld	[%l7 + 0x3C],	%f17
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x28, %i3
	sta	%f16,	[%l7 + %i3] 0x80
	set	0x28, %o5
	stda	%g6,	[%l7 + %o5] 0x89
	nop
	set	0x58, %o0
	stb	%l4,	[%l7 + %o0]
	nop
	set	0x68, %g2
	lduw	[%l7 + %g2],	%o1
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x89,	%i6
	nop
	set	0x08, %g3
	sth	%g3,	[%l7 + %g3]
	nop
	set	0x74, %g4
	ldstub	[%l7 + %g4],	%l5
	set	0x78, %i0
	stxa	%l0,	[%l7 + %i0] 0xe2
	membar	#Sync
	or	%g7,	%l3,	%i1
	nop
	set	0x2D, %l2
	ldub	[%l7 + %l2],	%o2
	bgu	%xcc,	loop_20
	nop
	set	0x40, %i4
	prefetch	[%l7 + %i4],	 0
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x89,	%o0
loop_20:
	nop
	set	0x58, %l6
	stx	%l6,	[%l7 + %l6]
	nop
	set	0x40, %o1
	std	%l0,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x68]
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x88,	 3
	nop
	set	0x31, %o7
	ldstub	[%l7 + %o7],	%i4
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x88,	%o3
	set	0x50, %g1
	sta	%f24,	[%l7 + %g1] 0x80
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x48, %o3
	std	%g0,	[%l7 + %o3]
	wr	%g5,	%o7,	%sys_tick
	nop
	set	0x68, %l5
	swap	[%l7 + %l5],	%i7
	set	0x4C, %l4
	stha	%o4,	[%l7 + %l4] 0x88
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd8
	nop
	set	0x08, %i2
	std	%i2,	[%l7 + %i2]
	nop
	set	0x34, %g5
	ldsw	[%l7 + %g5],	%g4
	set	0x34, %o6
	swapa	[%l7 + %o6] 0x80,	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%o5
	st	%fsr,	[%l7 + 0x70]
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x81,	%i0
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x2C, %l3
	ldsw	[%l7 + %l3],	%g2
	st	%fsr,	[%l7 + 0x14]
	ld	[%l7 + 0x74],	%f28
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%i2
	set	0x50, %i5
	stwa	%l4,	[%l7 + %i5] 0x80
	set	0x72, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o1
	nop
	set	0x0E, %i6
	sth	%i6,	[%l7 + %i6]
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%g6
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 1
	set	0x3C, %g2
	stwa	%l5,	[%l7 + %g2] 0x81
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%l0
	or	%g3,	%l3,	%g7
	set	0x7E, %g4
	stha	%i1,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x66, %g3
	ldstub	[%l7 + %g3],	%o2
	nop
	set	0x5C, %i0
	lduw	[%l7 + %i0],	%l6
	nop
	set	0x78, %l2
	stw	%o0,	[%l7 + %l2]
	add	%o6,	%l1,	%i4
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x81,	%o3
	st	%f6,	[%l7 + 0x24]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%f15,	[%l7 + 0x10]
	nop
	set	0x78, %l6
	stw	%i7,	[%l7 + %l6]
	nop
	set	0x48, %o1
	lduw	[%l7 + %o1],	%o4
	fpsub16s	%f6,	%f14,	%f20
	nop
	set	0x10, %g7
	std	%f18,	[%l7 + %g7]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i3
	nop
	set	0x14, %i7
	lduw	[%l7 + %i7],	%g4
	nop
	set	0x46, %g6
	lduh	[%l7 + %g6],	%l2
	ld	[%l7 + 0x14],	%f24
	ld	[%l7 + 0x24],	%f3
	set	0x58, %o7
	lda	[%l7 + %o7] 0x80,	%f7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i5
	nop
	set	0x64, %l1
	stw	%i0,	[%l7 + %l1]
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%g2
	nop
	set	0x2C, %l5
	swap	[%l7 + %l5],	%i2
	add	%l4,	%o1,	%i6
	fpsub32	%f24,	%f18,	%f24
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%g6
	nop
	set	0x70, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x10, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x48, %i2
	stwa	%l5,	[%l7 + %i2] 0x89
	set	0x70, %o6
	lda	[%l7 + %o6] 0x80,	%f4
	or	%g3,	%l0,	%l3
	set	0x40, %g5
	prefetcha	[%l7 + %g5] 0x81,	 2
	nop
	set	0x08, %l3
	stw	%o2,	[%l7 + %l3]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%l6
	nop
	set	0x62, %i1
	lduh	[%l7 + %i1],	%o0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	set	0x78, %i5
	stxa	%o6,	[%l7 + %i5] 0x88
	fpadd16s	%f27,	%f0,	%f1
	nop
	set	0x40, %o0
	std	%f26,	[%l7 + %o0]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%o3
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%i4
	bgu,a,pn	%xcc,	loop_21
	nop
	set	0x62, %g2
	lduh	[%l7 + %g2],	%o7
	set	0x30, %l0
	stwa	%i7,	[%l7 + %l0] 0x88
loop_21:
	add	%o4,	%g5,	%i3
	bne,a	%xcc,	loop_22
	nop
	set	0x6A, %g4
	lduh	[%l7 + %g4],	%g1
	set	0x18, %i6
	stxa	%l2,	[%l7 + %i6] 0xea
	membar	#Sync
loop_22:
	nop
	set	0x68, %i0
	ldstub	[%l7 + %i0],	%o5
	nop
	set	0x28, %l2
	stx	%i5,	[%l7 + %l2]
	nop
	set	0x68, %g3
	ldub	[%l7 + %g3],	%i0
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	nop
	set	0x1A, %i4
	ldsh	[%l7 + %i4],	%i2
	nop
	set	0x16, %g7
	sth	%l4,	[%l7 + %g7]
	nop
	set	0x58, %o1
	std	%g2,	[%l7 + %o1]
	nop
	set	0x08, %g6
	lduw	[%l7 + %g6],	%o1
	ld	[%l7 + 0x14],	%f24
	st	%f19,	[%l7 + 0x38]
	set	0x3C, %o7
	stwa	%g6,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x18, %g1
	stda	%l4,	[%l7 + %g1] 0x89
	nop
	set	0x10, %l5
	std	%f6,	[%l7 + %l5]
	nop
	set	0x65, %o3
	ldstub	[%l7 + %o3],	%i6
	nop
	set	0x7A, %o4
	ldsh	[%l7 + %o4],	%l0
	nop
	set	0x27, %i7
	stb	%l3,	[%l7 + %i7]
	set	0x36, %l4
	stha	%g3,	[%l7 + %l4] 0x89
	set	0x10, %o6
	stwa	%o2,	[%l7 + %o6] 0x88
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f30
	or	%i1,	%g7,	%l6
	set	0x72, %l3
	stha	%o0,	[%l7 + %l3] 0xea
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%o6
	nop
	set	0x7C, %o2
	stw	%i4,	[%l7 + %o2]
	st	%f5,	[%l7 + 0x58]
	nop
	set	0x48, %i2
	stx	%o7,	[%l7 + %i2]
	nop
	set	0x22, %i3
	sth	%o3,	[%l7 + %i3]
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x2B, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i7
	nop
	set	0x18, %o5
	sth	%o4,	[%l7 + %o5]
	nop
	set	0x43, %g2
	stb	%i3,	[%l7 + %g2]
	nop
	set	0x0E, %l0
	sth	%g5,	[%l7 + %l0]
	nop
	set	0x6C, %o0
	lduw	[%l7 + %o0],	%l2
	fpsub32	%f6,	%f26,	%f14
	set	0x20, %g4
	stxa	%o5,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f20
	nop
	set	0x6E, %g3
	lduh	[%l7 + %g3],	%i5
	or	%g1,	%i0,	%i2
	be,pn	%icc,	loop_23
	wr	%l4,	%g2,	%clear_softint
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%o1
	nop
	set	0x16, %l6
	stb	%g4,	[%l7 + %l6]
loop_23:
	nop
	set	0x30, %g7
	ldsb	[%l7 + %g7],	%g6
	nop
	set	0x30, %o1
	ldub	[%l7 + %o1],	%i6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc0
	or	%l0,	%l3,	%l5
	wr	%o2,	%g3,	%y
	add	%g7,	%i1,	%l6
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x80,	%l0
	nop
	set	0x6F, %o7
	ldub	[%l7 + %o7],	%o0
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x81,	 4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%o6
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x88,	%o2
	nop
	set	0x50, %o3
	stx	%i7,	[%l7 + %o3]
	bl	%xcc,	loop_24
	wr 	%g0, 	0x7, 	%fprs
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xea,	%l2
loop_24:
	nop
	set	0x28, %o4
	stda	%o4,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x6A, %l4
	stha	%i5,	[%l7 + %l4] 0x81
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xe3,	%o4
	set	0x64, %g5
	ldstuba	[%l7 + %g5] 0x89,	%g1
	set	0x41, %l3
	stba	%i2,	[%l7 + %l3] 0x80
	set	0x58, %o2
	stxa	%l4,	[%l7 + %o2] 0x88
	set	0x18, %i2
	stwa	%g2,	[%l7 + %i2] 0x88
	nop
	set	0x2A, %o6
	lduh	[%l7 + %o6],	%i0
	nop
	set	0x71, %i1
	ldub	[%l7 + %i1],	%o1
	set	0x1C, %i3
	stha	%g6,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x50, %o5
	swap	[%l7 + %o5],	%i6
	nop
	set	0x08, %g2
	std	%f14,	[%l7 + %g2]
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f2
	and	%l0,	%g4,	%l5
	nop
	set	0x74, %o0
	prefetch	[%l7 + %o0],	 1
	wr	%l3,	%g3,	%y
	ba,a	%xcc,	loop_25
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%g6
	fpsub32	%f12,	%f26,	%f26
	set	0x10, %g4
	ldda	[%l7 + %g4] 0xe3,	%i0
loop_25:
	bg,a	%icc,	loop_26
	nop
	set	0x40, %g3
	lduw	[%l7 + %g3],	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%l1
loop_26:
	add	%i4,	%o7,	%o6
	set	0x48, %i6
	stxa	%o3,	[%l7 + %i6] 0x81
	set	0x5C, %l2
	stwa	%i7,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%i3
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%g4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%l2
	set	0x76, %g7
	stha	%o4,	[%l7 + %g7] 0x80
	set	0x10, %i4
	lda	[%l7 + %i4] 0x88,	%f26
	wr	%o5,	%i5,	%clear_softint
	set	0x70, %g6
	lda	[%l7 + %g6] 0x89,	%f7
	nop
	set	0x4C, %l1
	ldsb	[%l7 + %l1],	%i2
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x30, %o3
	stxa	%g1,	[%l7 + %o3] 0x88
	nop
	set	0x37, %l5
	ldsb	[%l7 + %l5],	%g2
	nop
	set	0x26, %o4
	ldub	[%l7 + %o4],	%l4
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x18, %l4
	stx	%i0,	[%l7 + %l4]
	st	%f3,	[%l7 + 0x58]
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x89,	%g6
	set	0x6A, %g5
	stha	%i6,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x30, %l3
	ldda	[%l7 + %l3] 0xe2,	%o0
	nop
	nop
	setx	0xAA752BF501974C89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x00BBD58BA9DC4CC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f14
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f6
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%l0
	set	0x22, %i2
	stha	%l5,	[%l7 + %i2] 0xe2
	membar	#Sync
	and	%g4,	%g3,	%l3
	set	0x50, %i1
	sta	%f0,	[%l7 + %i1] 0x81
	nop
	set	0x18, %i3
	ldstub	[%l7 + %i3],	%g7
	nop
	set	0x78, %o5
	std	%f2,	[%l7 + %o5]
	nop
	set	0x20, %g2
	std	%i0,	[%l7 + %g2]
	fpsub16	%f4,	%f22,	%f22
	nop
	set	0x58, %o6
	ldsw	[%l7 + %o6],	%o2
	set	0x1C, %i5
	stha	%l1,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x40, %o0
	std	%i6,	[%l7 + %o0]
	set	0x40, %i0
	stxa	%o7,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x6397362B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x007268AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f25,	%f15
	st	%f1,	[%l7 + 0x28]
	set	0x08, %g4
	stda	%o6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x08, %g3
	sta	%f24,	[%l7 + %g3] 0x89
	nop
	set	0x24, %l0
	swap	[%l7 + %l0],	%o3
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%i4
	set	0x68, %i6
	lda	[%l7 + %i6] 0x89,	%f30
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%i3
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f0
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x24, %l1
	lduh	[%l7 + %l1],	%g5
	and	%l2,	%o0,	%o4
	nop
	set	0x30, %l6
	swap	[%l7 + %l6],	%o5
	nop
	set	0x64, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x30, %o3
	ldx	[%l7 + %o3],	%i2
	and	%i5,	%g1,	%l4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	nop
	set	0x5B, %l4
	stb	%g2,	[%l7 + %l4]
	or	%i0,	%g6,	%i6
	set	0x60, %g1
	stda	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%g4
	set	0x78, %g5
	stwa	%g3,	[%l7 + %g5] 0x88
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%l5
	wr	%l3,	%i1,	%set_softint
	fpsub16s	%f6,	%f8,	%f12
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xeb,	%g6
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	set	0x75, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o2
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%l6
	set	0x70, %i3
	stda	%o6,	[%l7 + %i3] 0x80
	set	0x5C, %o5
	stwa	%o3,	[%l7 + %o5] 0xeb
	membar	#Sync
	and	%o6,	%i3,	%i7
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 3
	set	0x4C, %o6
	sta	%f5,	[%l7 + %o6] 0x81
	nop
	set	0x78, %i5
	std	%f6,	[%l7 + %i5]
	nop
	set	0x60, %o0
	stb	%g5,	[%l7 + %o0]
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x89,	%i4
	set	0x58, %i0
	swapa	[%l7 + %i0] 0x89,	%o0
	and	%l2,	%o4,	%i2
	st	%fsr,	[%l7 + 0x78]
	st	%f19,	[%l7 + 0x54]
	nop
	set	0x18, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x0B, %l0
	ldsb	[%l7 + %l0],	%o5
	ld	[%l7 + 0x3C],	%f28
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%i5
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xda
	nop
	set	0x1A, %i6
	ldub	[%l7 + %i6],	%g2
	set	0x30, %g7
	sta	%f26,	[%l7 + %g7] 0x88
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f24
	set	0x40, %o1
	lda	[%l7 + %o1] 0x81,	%f21
	nop
	set	0x10, %g6
	ldsh	[%l7 + %g6],	%g6
	ld	[%l7 + 0x24],	%f25
	nop
	set	0x74, %l6
	stw	%i0,	[%l7 + %l6]
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x09, %o3
	ldub	[%l7 + %o3],	%i6
	add	%o1,	%g4,	%l0
	and	%g3,	%l3,	%l5
	and	%i1,	%g7,	%o2
	ble,pt	%xcc,	loop_27
	nop
	set	0x26, %o4
	ldsb	[%l7 + %o4],	%l6
	set	0x30, %o7
	stda	%o6,	[%l7 + %o7] 0xe2
	membar	#Sync
loop_27:
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%o2
	set	0x32, %g1
	stha	%o6,	[%l7 + %g1] 0xe2
	membar	#Sync
	st	%f6,	[%l7 + 0x20]
	nop
	set	0x7D, %g5
	ldub	[%l7 + %g5],	%l1
	ba	%xcc,	loop_28
	nop
	set	0x58, %l5
	ldsh	[%l7 + %l5],	%i3
	st	%f27,	[%l7 + 0x6C]
	and	%i7,	%i4,	%o0
loop_28:
	wr	%g5,	%l2,	%set_softint
	nop
	set	0x23, %i7
	stb	%i2,	[%l7 + %i7]
	set	0x44, %l3
	lda	[%l7 + %l3] 0x89,	%f3
	nop
	set	0x08, %i2
	lduh	[%l7 + %i2],	%o5
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x81,	 4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%o4
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%g2
	set	0x6A, %o6
	stha	%i5,	[%l7 + %o6] 0x89
	ld	[%l7 + 0x48],	%f11
	nop
	set	0x40, %i5
	lduw	[%l7 + %i5],	%g6
	fpadd16	%f12,	%f14,	%f16
	nop
	set	0x78, %g2
	ldsw	[%l7 + %g2],	%i6
	nop
	set	0x20, %o0
	std	%f18,	[%l7 + %o0]
	nop
	set	0x18, %o2
	stw	%o1,	[%l7 + %o2]
	nop
	set	0x48, %g3
	stx	%g4,	[%l7 + %g3]
	nop
	nop
	setx	0xF539C176,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x55867756,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f12,	%f18
	set	0x5C, %i0
	sta	%f16,	[%l7 + %i0] 0x81
	nop
	set	0x70, %g4
	std	%f30,	[%l7 + %g4]
	set	0x28, %l2
	stxa	%l0,	[%l7 + %l2] 0xe2
	membar	#Sync
	st	%f5,	[%l7 + 0x7C]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd8
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%g3
	nop
	set	0x24, %i4
	sth	%i0,	[%l7 + %i4]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd8
	set	0x48, %l0
	stha	%l5,	[%l7 + %l0] 0x88
	set	0x60, %l6
	stda	%i0,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x80,	 3
	or	%l3,	%o2,	%l6
	nop
	nop
	setx	0x78653800B67F9002,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEC870F337E97F13E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f8
	fpadd16s	%f0,	%f7,	%f4
	set	0x27, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o7
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x80,	%o6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f0
	nop
	set	0x26, %l4
	ldstub	[%l7 + %l4],	%l1
	nop
	set	0x56, %o7
	ldsh	[%l7 + %o7],	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%i4
	nop
	set	0x50, %g5
	lduw	[%l7 + %g5],	%i7
	nop
	set	0x56, %l5
	ldstub	[%l7 + %l5],	%g5
	ld	[%l7 + 0x40],	%f11
	nop
	set	0x58, %i7
	std	%l2,	[%l7 + %i7]
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%o0
	ld	[%l7 + 0x44],	%f30
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x58, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x58, %i1
	sth	%g1,	[%l7 + %i1]
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x81,	%l4
	or	%i2,	%o4,	%g2
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f16
	nop
	set	0x67, %o6
	stb	%i5,	[%l7 + %o6]
	nop
	set	0x08, %i3
	ldsh	[%l7 + %i3],	%i6
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x81,	 1
	st	%f31,	[%l7 + 0x64]
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%g4
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%l0
	set	0x21, %i0
	ldstuba	[%l7 + %i0] 0x81,	%g3
	nop
	set	0x18, %g4
	std	%f22,	[%l7 + %g4]
	set	0x53, %l2
	stba	%i0,	[%l7 + %l2] 0x89
	nop
	set	0x4C, %g3
	ldsw	[%l7 + %g3],	%l5
	nop
	set	0x61, %i6
	stb	%i1,	[%l7 + %i6]
	nop
	set	0x52, %g7
	ldub	[%l7 + %g7],	%o1
	set	0x6C, %i4
	sta	%f6,	[%l7 + %i4] 0x89
	st	%f24,	[%l7 + 0x6C]
	nop
	set	0x5C, %l0
	ldsw	[%l7 + %l0],	%l3
	nop
	set	0x38, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x16, %o1
	ldsh	[%l7 + %o1],	%g7
	bleu,a	%xcc,	loop_29
	nop
	nop
	setx	0x6FD81471,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x622A765B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f22,	%f25
	nop
	set	0x60, %g6
	stx	%o2,	[%l7 + %g6]
	set	0x38, %o4
	stda	%o6,	[%l7 + %o4] 0x88
loop_29:
	nop
	set	0x30, %o3
	stha	%o6,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x55, %l1
	ldub	[%l7 + %l1],	%l1
	nop
	set	0x0A, %o7
	sth	%l6,	[%l7 + %o7]
	set	0x10, %g5
	sta	%f12,	[%l7 + %g5] 0x81
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x88
	set	0x18, %i7
	stda	%i2,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x3C, %l3
	sta	%f31,	[%l7 + %l3] 0x88
	set	0x40, %l4
	sta	%f27,	[%l7 + %l4] 0x88
	st	%fsr,	[%l7 + 0x08]
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xe3,	%o2
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x70, %g1
	stx	%i4,	[%l7 + %g1]
	st	%f7,	[%l7 + 0x18]
	set	0x68, %o5
	stxa	%i7,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x20, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g5
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x89,	%l2
	nop
	set	0x32, %i5
	ldsh	[%l7 + %i5],	%o5
	and	%g1,	%o0,	%i2
	nop
	set	0x2C, %g2
	stw	%l4,	[%l7 + %g2]
	nop
	set	0x78, %i3
	ldstub	[%l7 + %i3],	%g2
	st	%f2,	[%l7 + 0x40]
	nop
	set	0x32, %o2
	lduh	[%l7 + %o2],	%i5
	set	0x40, %i0
	stxa	%o4,	[%l7 + %i0] 0xea
	membar	#Sync
	fpadd16s	%f31,	%f7,	%f6
	nop
	set	0x5B, %g4
	ldstub	[%l7 + %g4],	%i6
	set	0x2D, %o0
	stba	%g4,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x24, %l2
	swap	[%l7 + %l2],	%l0
	nop
	set	0x30, %i6
	std	%f4,	[%l7 + %i6]
	nop
	set	0x60, %g3
	stx	%g6,	[%l7 + %g3]
	ld	[%l7 + 0x40],	%f12
	nop
	set	0x0A, %i4
	ldsb	[%l7 + %i4],	%g3
	nop
	set	0x60, %g7
	swap	[%l7 + %g7],	%l5
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%i0
	bne	%xcc,	loop_30
	add	%o1,	%i0,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g7
loop_30:
	nop
	set	0x2C, %o1
	stwa	%o7,	[%l7 + %o1] 0x88
	nop
	set	0x20, %g6
	sth	%l1,	[%l7 + %g6]
	nop
	set	0x70, %o4
	stx	%l6,	[%l7 + %o4]
	nop
	set	0x78, %l0
	ldstub	[%l7 + %l0],	%o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1270
!	Type a   	: 23
!	Type cti   	: 30
!	Type x   	: 537
!	Type f   	: 26
!	Type i   	: 114
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 1 Start
!
.global thread_1
thread_1:
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
	set	0x3,	%g1
	set	0x1,	%g2
	set	0x3,	%g3
	set	0xA,	%g4
	set	0x7,	%g5
	set	0x9,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x4,	%i1
	set	-0x3,	%i2
	set	-0x6,	%i3
	set	-0x0,	%i4
	set	-0x2,	%i5
	set	-0xE,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x1B17E622,	%l0
	set	0x7D8E946F,	%l1
	set	0x0656D2AF,	%l2
	set	0x1A073D71,	%l3
	set	0x149558BB,	%l4
	set	0x0C8A053B,	%l5
	set	0x52311E17,	%l6
	!# Output registers
	set	-0x0245,	%o0
	set	-0x04EC,	%o1
	set	-0x0F1D,	%o2
	set	0x1CD0,	%o3
	set	0x126A,	%o4
	set	0x1968,	%o5
	set	0x1FDC,	%o6
	set	0x0CFF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	nop
	set	0x38, %l1
	lduw	[%l7 + %l1],	%o3
	nop
	set	0x0F, %o3
	ldstub	[%l7 + %o3],	%i3
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x80,	%i7
	nop
	set	0x40, %g5
	std	%i4,	[%l7 + %g5]
	set	0x58, %i7
	stha	%l2,	[%l7 + %i7] 0x80
	set	0x7A, %l3
	stba	%g5,	[%l7 + %l3] 0x80
	or	%o5,	%g1,	%i2
	wr	%o0,	%g2,	%ccr
	set	0x74, %l4
	sta	%f12,	[%l7 + %l4] 0x88
	ld	[%l7 + 0x2C],	%f16
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%i6
	and	%l4,	%l0,	%g4
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x81,	%g6
	set	0x78, %o5
	stha	%g3,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x60, %g1
	sta	%f11,	[%l7 + %g1] 0x88
	nop
	set	0x1C, %o6
	swap	[%l7 + %o6],	%l5
	nop
	set	0x4C, %i2
	prefetch	[%l7 + %i2],	 0
	set	0x30, %g2
	swapa	[%l7 + %g2] 0x81,	%i1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF8C, 	%tick_cmpr
	set	0x60, %i5
	stxa	%i0,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x40, %i3
	swap	[%l7 + %i3],	%o2
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd0
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%o7
	nop
	set	0x16, %g4
	sth	%l1,	[%l7 + %g4]
	nop
	set	0x58, %l2
	swap	[%l7 + %l2],	%l6
	set	0x10, %o0
	sta	%f31,	[%l7 + %o0] 0x89
	add	%g7,	%o6,	%o3
	fpadd32	%f22,	%f30,	%f8
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf8
	membar	#Sync
	nop
	set	0x68, %g3
	swap	[%l7 + %g3],	%i3
	set	0x14, %g7
	stwa	%i7,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x44, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x70, %l6
	stda	%i4,	[%l7 + %l6] 0x81
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f16
	nop
	set	0x5C, %o4
	sth	%g5,	[%l7 + %o4]
	ld	[%l7 + 0x5C],	%f8
	set	0x0C, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l2
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%o5
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc0
	set	0x3C, %o3
	stba	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x14, %g5
	ldsw	[%l7 + %g5],	%o0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f16
	nop
	set	0x1B, %l3
	ldstub	[%l7 + %l3],	%g2
	st	%f2,	[%l7 + 0x54]
	nop
	set	0x47, %i7
	stb	%g1,	[%l7 + %i7]
	fpadd32	%f26,	%f6,	%f4
	nop
	set	0x6E, %l4
	ldsh	[%l7 + %l4],	%i5
	st	%fsr,	[%l7 + 0x30]
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x89,	%i6
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%l4
	set	0x3C, %o5
	stba	%g6,	[%l7 + %o5] 0x88
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe3,	%g4
	set	0x72, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g3
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x88,	 0
	add	%o1,	%l3,	%i1
	ld	[%l7 + 0x1C],	%f4
	nop
	set	0x70, %i5
	prefetch	[%l7 + %i5],	 1
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xea,	%o2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x50, %i3
	stx	%o7,	[%l7 + %i3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%l1
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x89,	%l6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x2D, %i0
	ldub	[%l7 + %i0],	%o6
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x81,	%g7
	nop
	set	0x17, %i6
	ldsb	[%l7 + %i6],	%o3
	nop
	set	0x2C, %g3
	stw	%i3,	[%l7 + %g3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%i4
	set	0x62, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g5
	set	0x48, %g7
	stxa	%o5,	[%l7 + %g7] 0x89
	bn,a	%xcc,	loop_31
	and	%i2,	%o0,	%g2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f16
loop_31:
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	or	%l2,	%g1,	%i5
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x88,	%i6
	st	%f0,	[%l7 + 0x48]
	st	%f11,	[%l7 + 0x64]
	set	0x5C, %o1
	sta	%f5,	[%l7 + %o1] 0x81
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd0
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f2
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f14
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%l4
	set	0x49, %o4
	stba	%o4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd8,	%f0
	nop
	set	0x68, %l3
	std	%f20,	[%l7 + %l3]
	nop
	set	0x30, %o7
	stw	%g4,	[%l7 + %o7]
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x80,	%g3
	fpsub16	%f6,	%f8,	%f30
	set	0x47, %l5
	stba	%g6,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x38, %l4
	std	%l4,	[%l7 + %l4]
	nop
	set	0x3E, %o5
	ldsb	[%l7 + %o5],	%o1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f16
	nop
	set	0x10, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x4C, %i2
	stw	%l3,	[%l7 + %i2]
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	set	0x10, %g2
	std	%i0,	[%l7 + %g2]
	nop
	set	0x78, %g1
	ldsh	[%l7 + %g1],	%i0
	st	%f30,	[%l7 + 0x18]
	and	%o7,	%l1,	%o6
	and	%l6,	%o3,	%i3
	set	0x28, %o2
	stwa	%g7,	[%l7 + %o2] 0x89
	nop
	set	0x20, %g4
	stw	%i7,	[%l7 + %g4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%o5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%i2
	set	0x34, %i0
	stwa	%g2,	[%l7 + %i0] 0x80
	set	0x58, %i3
	stda	%o0,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x34, %i6
	stwa	%l2,	[%l7 + %i6] 0x81
	set	0x2C, %g3
	lda	[%l7 + %g3] 0x89,	%f4
	st	%f20,	[%l7 + 0x6C]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
	set	0x6A, %l2
	stha	%g1,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x18, %g7
	std	%i4,	[%l7 + %g7]
	nop
	set	0x0F, %i4
	stb	%i6,	[%l7 + %i4]
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	set	0x28, %o1
	std	%f28,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x24]
	and	%l4,	%g4,	%o4
	set	0x74, %l1
	stwa	%g6,	[%l7 + %l1] 0x89
	and	%l5,	%o1,	%l3
	nop
	set	0x45, %g6
	ldub	[%l7 + %g6],	%o2
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	wr	%i0,	%o7,	%clear_softint
	set	0x49, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i1
	nop
	set	0x68, %g5
	lduw	[%l7 + %g5],	%l1
	set	0x0C, %o3
	stwa	%l6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x60, %l3
	stx	%o3,	[%l7 + %l3]
	nop
	set	0x68, %o7
	lduh	[%l7 + %o7],	%i3
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xeb,	%g6
	set	0x5C, %l4
	sta	%f20,	[%l7 + %l4] 0x88
	nop
	set	0x3C, %o5
	sth	%i7,	[%l7 + %o5]
	set	0x27, %i7
	stba	%i4,	[%l7 + %i7] 0x80
	nop
	set	0x3B, %o6
	ldub	[%l7 + %o6],	%o5
	nop
	set	0x2C, %i1
	stw	%g5,	[%l7 + %i1]
	st	%f13,	[%l7 + 0x58]
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x81,	%o6
	nop
	set	0x4C, %i5
	stw	%i2,	[%l7 + %i5]
	and	%o0,	%g2,	%g1
	nop
	set	0x30, %g2
	stx	%l2,	[%l7 + %g2]
	nop
	set	0x18, %o2
	lduw	[%l7 + %o2],	%i6
	set	0x58, %g1
	stda	%l0,	[%l7 + %g1] 0x89
	nop
	set	0x50, %i0
	swap	[%l7 + %i0],	%l4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x2C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%i5
	st	%f22,	[%l7 + 0x54]
	nop
	set	0x35, %g3
	ldsb	[%l7 + %g3],	%g4
	set	0x74, %o0
	sta	%f13,	[%l7 + %o0] 0x89
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f30
	ld	[%l7 + 0x74],	%f13
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%o4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd8,	%f0
	st	%fsr,	[%l7 + 0x0C]
	st	%fsr,	[%l7 + 0x38]
	or	%l5,	%g6,	%l3
	and	%o2,	%g3,	%o1
	nop
	set	0x68, %i4
	stw	%i0,	[%l7 + %i4]
	or	%i1,	%o7,	%l6
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%o2
	set	0x78, %g6
	stda	%l0,	[%l7 + %g6] 0x80
	nop
	set	0x12, %l0
	ldsh	[%l7 + %l0],	%i3
	or	%i7,	%i4,	%o5
	set	0x62, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g5
	and	%o6,	%g7,	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%g1
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%o0
	nop
	set	0x58, %o3
	ldx	[%l7 + %o3],	%i6
	nop
	set	0x64, %l3
	lduw	[%l7 + %l3],	%l2
	and	%l0,	%i5,	%l4
	nop
	set	0x5C, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x36, %l5
	ldstuba	[%l7 + %l5] 0x89,	%g4
	ld	[%l7 + 0x3C],	%f27
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x88,	%o4
	set	0x20, %o5
	swapa	[%l7 + %o5] 0x80,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g6
	and	%o2,	%o1,	%i0
	nop
	set	0x50, %i7
	prefetch	[%l7 + %i7],	 4
	set	0x60, %l4
	stxa	%g3,	[%l7 + %l4] 0x89
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x81,	%f13
	st	%fsr,	[%l7 + 0x08]
	set	0x73, %i2
	stba	%o7,	[%l7 + %i2] 0xe2
	membar	#Sync
	fpadd32s	%f18,	%f20,	%f16
	set	0x28, %i5
	stha	%l6,	[%l7 + %i5] 0x80
	set	0x58, %g2
	stha	%i1,	[%l7 + %g2] 0x89
	nop
	set	0x4C, %o2
	stw	%o3,	[%l7 + %o2]
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%i3
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	or	%i7,	%i4,	%l1
	nop
	set	0x10, %i6
	stx	%o5,	[%l7 + %i6]
	nop
	set	0x2C, %o6
	lduw	[%l7 + %o6],	%o6
	or	%g5,	%g7,	%i2
	nop
	set	0x30, %g3
	ldsw	[%l7 + %g3],	%g1
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f18
	ld	[%l7 + 0x58],	%f18
	set	0x4C, %g4
	lda	[%l7 + %g4] 0x80,	%f0
	st	%f28,	[%l7 + 0x28]
	nop
	set	0x2B, %g7
	ldstub	[%l7 + %g7],	%o0
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%i6
	nop
	set	0x39, %i4
	ldub	[%l7 + %i4],	%g2
	nop
	set	0x48, %l1
	std	%l0,	[%l7 + %l1]
	add	%i5,	%l4,	%g4
	nop
	set	0x3C, %g6
	sth	%l2,	[%l7 + %g6]
	set	0x1A, %l0
	stha	%o4,	[%l7 + %l0] 0x81
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x3C, %o4
	sth	%l3,	[%l7 + %o4]
	nop
	set	0x7E, %o3
	stb	%g6,	[%l7 + %o3]
	set	0x58, %l3
	stxa	%o2,	[%l7 + %l3] 0x89
	set	0x54, %o1
	lda	[%l7 + %o1] 0x81,	%f14
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f0
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x89,	 0
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x81,	%i0
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%l4
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%o7
	bn,pn	%xcc,	loop_32
	st	%fsr,	[%l7 + 0x60]
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x89,	%l6
loop_32:
	nop
	set	0x38, %i1
	lda	[%l7 + %i1] 0x89,	%f28
	set	0x20, %g2
	lda	[%l7 + %g2] 0x81,	%f22
	set	0x6E, %o2
	stha	%g3,	[%l7 + %o2] 0x89
	set	0x30, %g1
	stda	%o2,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%i2
	set	0x0D, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i1
	wr	%i7,	%i4,	%ccr
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%o5
	set	0x44, %i3
	sta	%f24,	[%l7 + %i3] 0x88
	nop
	set	0x1C, %g3
	ldsw	[%l7 + %g3],	%o6
	nop
	set	0x38, %o0
	stx	%l1,	[%l7 + %o0]
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%g5
	nop
	set	0x20, %g7
	stw	%i2,	[%l7 + %g7]
	set	0x42, %o6
	stha	%g1,	[%l7 + %o6] 0x80
	set	0x60, %i4
	stda	%g6,	[%l7 + %i4] 0x88
	nop
	set	0x2E, %l6
	sth	%o0,	[%l7 + %l6]
	nop
	set	0x60, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x46, %l1
	lduh	[%l7 + %l1],	%i6
	set	0x54, %l2
	stha	%g2,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x81,	%i5
	set	0x68, %o3
	sta	%f30,	[%l7 + %o3] 0x89
	st	%fsr,	[%l7 + 0x6C]
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x88,	%l4
	nop
	set	0x6C, %l3
	sth	%g4,	[%l7 + %l3]
	set	0x54, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l2
	nop
	set	0x20, %o1
	swap	[%l7 + %o1],	%o4
	set	0x18, %o5
	stda	%l0,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x81,	%g6
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	and	%o1,	%o2,	%i0
	set	0x20, %l5
	stwa	%l5,	[%l7 + %l5] 0x88
	set	0x38, %l4
	stxa	%o7,	[%l7 + %l4] 0xe2
	membar	#Sync
	add	%l6,	%g3,	%o3
	nop
	set	0x40, %i2
	stw	%i1,	[%l7 + %i2]
	set	0x78, %g2
	lda	[%l7 + %g2] 0x88,	%f11
	set	0x32, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i7
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x60, %g1
	lduh	[%l7 + %g1],	%i3
	nop
	set	0x21, %i0
	ldsb	[%l7 + %i0],	%i4
	st	%fsr,	[%l7 + 0x08]
	set	0x1A, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o5
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%o6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f4
	set	0x32, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l1
	nop
	set	0x38, %o6
	ldsh	[%l7 + %o6],	%g5
	set	0x40, %i4
	stda	%i2,	[%l7 + %i4] 0x89
	nop
	set	0x22, %g4
	sth	%g1,	[%l7 + %g4]
	nop
	set	0x77, %l6
	ldstub	[%l7 + %l6],	%o0
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x18, %l2
	sth	%g2,	[%l7 + %l2]
	nop
	set	0x33, %l0
	ldstub	[%l7 + %l0],	%g7
	nop
	set	0x1A, %o3
	ldsh	[%l7 + %o3],	%i5
	nop
	set	0x70, %o4
	std	%f18,	[%l7 + %o4]
	set	0x0F, %l1
	stba	%l4,	[%l7 + %l1] 0x80
	ble,a	%icc,	loop_33
	add	%l2,	%g4,	%o4
	set	0x70, %g5
	stda	%l0,	[%l7 + %g5] 0x89
loop_33:
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%l3
	or	%g6,	%o2,	%o1
	st	%f22,	[%l7 + 0x28]
	set	0x10, %l3
	stwa	%l5,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x19, %o5
	stb	%o7,	[%l7 + %o5]
	set	0x78, %i7
	stxa	%l6,	[%l7 + %i7] 0x88
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x88,	%g3
	nop
	set	0x29, %l5
	ldstub	[%l7 + %l5],	%i0
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%o3
	nop
	set	0x6E, %i2
	sth	%i7,	[%l7 + %i2]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%i4
	nop
	set	0x70, %g2
	stx	%i3,	[%l7 + %g2]
	set	0x7C, %i1
	stha	%o5,	[%l7 + %i1] 0x88
	and	%o6,	%l1,	%g5
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	bg	%icc,	loop_34
	ld	[%l7 + 0x34],	%f20
	nop
	set	0x4C, %g1
	swap	[%l7 + %g1],	%i2
	or	%o0,	%i6,	%g1
loop_34:
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g6
	set	0x6C, %i5
	stha	%i5,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x48, %g3
	stda	%l4,	[%l7 + %g3] 0x89
	nop
	set	0x3C, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%g2
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x89,	 1
	nop
	set	0x20, %g7
	stx	%o4,	[%l7 + %g7]
	nop
	set	0x4A, %o6
	lduh	[%l7 + %o6],	%l0
	set	0x2C, %i4
	sta	%f22,	[%l7 + %i4] 0x88
	set	0x18, %g4
	stxa	%l3,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	nop
	setx	0x585AEAFC9820347D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x50BF87E9567B1793,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f28,	%f16
	set	0x46, %g6
	stha	%l2,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xea,	%g6
	or	%o1,	%l5,	%o2
	set	0x78, %l0
	sta	%f0,	[%l7 + %l0] 0x89
	and	%l6,	%g3,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%i0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%i1
	nop
	set	0x26, %o4
	sth	%i4,	[%l7 + %o4]
	set	0x2C, %o3
	stwa	%o5,	[%l7 + %o3] 0x88
	nop
	set	0x4B, %l1
	ldsb	[%l7 + %l1],	%o6
	nop
	set	0x12, %g5
	ldub	[%l7 + %g5],	%i3
	ld	[%l7 + 0x14],	%f29
	nop
	set	0x08, %l3
	swap	[%l7 + %l3],	%g5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f0
	set	0x69, %i7
	ldstuba	[%l7 + %i7] 0x80,	%l1
	and	%i2,	%o0,	%g1
	nop
	set	0x78, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x89,	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%l4
	and	%g2,	%g7,	%g4
	nop
	set	0x50, %o5
	std	%l0,	[%l7 + %o5]
	nop
	set	0x60, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x1C, %g2
	ldsh	[%l7 + %g2],	%o4
	nop
	set	0x70, %l4
	stx	%l2,	[%l7 + %l4]
	nop
	set	0x08, %i1
	lduh	[%l7 + %i1],	%l3
	set	0x58, %o2
	sta	%f26,	[%l7 + %o2] 0x89
	set	0x10, %i0
	ldda	[%l7 + %i0] 0xe3,	%o0
	set	0x10, %g1
	stda	%g6,	[%l7 + %g1] 0x81
	nop
	set	0x78, %g3
	swap	[%l7 + %g3],	%l5
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf0
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd0,	%f16
	set	0x2F, %g7
	stba	%o2,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x81,	%l6
	add	%o7,	%g3,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i7
	nop
	set	0x48, %o6
	std	%i0,	[%l7 + %o6]
	set	0x5C, %g4
	stwa	%o5,	[%l7 + %g4] 0x88
	nop
	set	0x70, %g6
	std	%i4,	[%l7 + %g6]
	set	0x68, %i4
	swapa	[%l7 + %i4] 0x80,	%o6
	nop
	set	0x24, %l6
	lduw	[%l7 + %l6],	%g5
	st	%f27,	[%l7 + 0x4C]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xe2,	%i2
	set	0x20, %l0
	prefetcha	[%l7 + %l0] 0x81,	 2
	or	%l1,	%g1,	%i6
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f16
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x89,	 2
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%l4
	nop
	set	0x1B, %l3
	ldstub	[%l7 + %l3],	%g2
	nop
	set	0x3E, %l1
	ldstub	[%l7 + %l1],	%g7
	set	0x44, %o1
	lda	[%l7 + %o1] 0x89,	%f22
	set	0x35, %o7
	stba	%g4,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x0A, %i7
	stb	%o0,	[%l7 + %i7]
	nop
	set	0x10, %o5
	sth	%o4,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x20]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf0
	membar	#Sync
	nop
	set	0x75, %l5
	ldub	[%l7 + %l5],	%l0
	ld	[%l7 + 0x58],	%f11
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%l2
	st	%fsr,	[%l7 + 0x1C]
	set	0x20, %l4
	stxa	%o1,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x54, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f0
	add	%l3,	%g6,	%o2
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f16
	nop
	set	0x24, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x48, %g3
	std	%i6,	[%l7 + %g3]
	set	0x08, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%i0
	set	0x28, %i6
	stxa	%o3,	[%l7 + %i6] 0x88
	nop
	set	0x4C, %g7
	ldsw	[%l7 + %g7],	%o7
	nop
	set	0x70, %i3
	stx	%i1,	[%l7 + %i3]
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f16
	nop
	set	0x38, %g6
	std	%f8,	[%l7 + %g6]
	set	0x68, %i4
	stda	%o4,	[%l7 + %i4] 0x81
	nop
	set	0x1C, %g4
	ldsw	[%l7 + %g4],	%i4
	set	0x0D, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i7
	ld	[%l7 + 0x28],	%f3
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x81,	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%i3
	nop
	set	0x0C, %o3
	stb	%i2,	[%l7 + %o3]
	set	0x7E, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g1
	nop
	set	0x45, %o4
	ldstub	[%l7 + %o4],	%i6
	nop
	set	0x66, %g5
	lduh	[%l7 + %g5],	%l1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f16
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%l4
	nop
	set	0x44, %l3
	lduw	[%l7 + %l3],	%g7
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%g2
	nop
	nop
	setx	0x37C975D97CF64E44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x93E521BA1677B7F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f10
	and	%o0,	%g4,	%o4
	set	0x25, %o7
	stba	%l0,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x38, %o5
	stha	%l2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x3C, %i7
	stwa	%l3,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f28
	nop
	set	0x3B, %g2
	ldstub	[%l7 + %g2],	%o1
	nop
	set	0x18, %l4
	std	%f2,	[%l7 + %l4]
	set	0x24, %l5
	lda	[%l7 + %l5] 0x89,	%f0
	or	%g6,	%o2,	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%i0
	nop
	set	0x78, %o2
	lduw	[%l7 + %o2],	%o3
	nop
	set	0x16, %i1
	ldsh	[%l7 + %i1],	%o7
	fpsub16s	%f30,	%f15,	%f10
	wr	%g3,	%o5,	%ccr
	set	0x35, %g1
	stba	%i4,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x54, %i0
	ldsw	[%l7 + %i0],	%i1
	nop
	set	0x6E, %i5
	ldsh	[%l7 + %i5],	%g5
	set	0x60, %g3
	stxa	%o6,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x79, %g7
	ldub	[%l7 + %g7],	%i3
	nop
	set	0x62, %i3
	lduh	[%l7 + %i3],	%i2
	nop
	set	0x50, %i6
	std	%g0,	[%l7 + %i6]
	set	0x20, %o0
	stda	%i6,	[%l7 + %o0] 0x89
	nop
	set	0x4C, %o6
	swap	[%l7 + %o6],	%i6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%l4
	nop
	set	0x44, %g6
	stw	%l1,	[%l7 + %g6]
	nop
	set	0x5C, %i4
	prefetch	[%l7 + %i4],	 4
	set	0x70, %g4
	sta	%f12,	[%l7 + %g4] 0x88
	set	0x60, %l2
	swapa	[%l7 + %l2] 0x88,	%g7
	ld	[%l7 + 0x30],	%f18
	nop
	set	0x5C, %l0
	lduw	[%l7 + %l0],	%o0
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f4
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%g4
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f16
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f8
	ld	[%l7 + 0x4C],	%f26
	nop
	set	0x74, %l3
	ldsh	[%l7 + %l3],	%g2
	set	0x28, %o1
	swapa	[%l7 + %o1] 0x89,	%o4
	nop
	set	0x78, %g5
	stx	%l0,	[%l7 + %g5]
	wr	%l2,	%l3,	%clear_softint
	nop
	set	0x68, %o5
	stx	%o1,	[%l7 + %o5]
	set	0x4C, %o7
	lda	[%l7 + %o7] 0x81,	%f6
	set	0x10, %i7
	stda	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x18, %i2
	stxa	%l6,	[%l7 + %i2] 0xe2
	membar	#Sync
	fpsub16	%f30,	%f20,	%f12
	nop
	set	0x24, %l4
	lduw	[%l7 + %l4],	%g6
	set	0x2C, %g2
	stwa	%i0,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%o3
	nop
	set	0x1C, %i1
	swap	[%l7 + %i1],	%o7
	nop
	set	0x78, %g1
	swap	[%l7 + %g1],	%l5
	nop
	set	0x28, %i0
	stx	%o5,	[%l7 + %i0]
	nop
	set	0x70, %o2
	ldsb	[%l7 + %o2],	%g3
	wr 	%g0, 	0x5, 	%fprs
	or	%g5,	%i3,	%o6
	set	0x44, %g3
	lda	[%l7 + %g3] 0x88,	%f26
	and	%g1,	%i7,	%i6
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x88,	 3
	set	0x40, %i3
	swapa	[%l7 + %i3] 0x89,	%l4
	nop
	set	0x78, %i6
	ldsw	[%l7 + %i6],	%i2
	set	0x54, %i5
	lda	[%l7 + %i5] 0x80,	%f14
	set	0x14, %o6
	stwa	%g7,	[%l7 + %o6] 0x89
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%o0
	nop
	set	0x08, %g6
	stx	%g4,	[%l7 + %g6]
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%l0
	st	%fsr,	[%l7 + 0x64]
	nop
	nop
	setx	0xD70DA525,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x2D290142,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f9,	%f17
	fpadd32s	%f2,	%f16,	%f24
	nop
	set	0x38, %i4
	swap	[%l7 + %i4],	%o4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xd8
	set	0x0C, %l6
	sta	%f23,	[%l7 + %l6] 0x80
	fpsub16s	%f23,	%f20,	%f25
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd2,	%f0
	nop
	set	0x40, %o3
	std	%f18,	[%l7 + %o3]
	set	0x39, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g2
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%l0
	nop
	set	0x68, %o1
	stx	%l2,	[%l7 + %o1]
	st	%f21,	[%l7 + 0x14]
	nop
	set	0x14, %g5
	ldstub	[%l7 + %g5],	%o1
	bg,a,pt	%xcc,	loop_35
	nop
	set	0x78, %o5
	std	%f20,	[%l7 + %o5]
	nop
	set	0x70, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe2,	%o2
loop_35:
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%l6
	fpadd16	%f22,	%f2,	%f4
	nop
	set	0x64, %l4
	ldsw	[%l7 + %l4],	%i0
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%g6
	set	0x58, %i1
	sta	%f12,	[%l7 + %i1] 0x89
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x80,	%o7
	nop
	set	0x67, %g2
	ldub	[%l7 + %g2],	%o3
	nop
	set	0x41, %i0
	ldstub	[%l7 + %i0],	%o5
	nop
	set	0x21, %o2
	ldstub	[%l7 + %o2],	%g3
	nop
	set	0x7E, %g3
	sth	%i1,	[%l7 + %g3]
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f26
	ld	[%l7 + 0x50],	%f15
	nop
	set	0x3C, %g7
	stw	%i4,	[%l7 + %g7]
	nop
	set	0x7C, %i6
	lduw	[%l7 + %i6],	%g5
	set	0x18, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	or	%o6,	%l5,	%i7
	fpsub32	%f16,	%f8,	%f16
	nop
	set	0x5C, %i5
	swap	[%l7 + %i5],	%i6
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0
	set	0x58, %g6
	stda	%l4,	[%l7 + %g6] 0x89
	nop
	set	0x7C, %i4
	stw	%i5,	[%l7 + %i4]
	and	%g7,	%i2,	%o0
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%g4
	fpadd16	%f4,	%f30,	%f24
	set	0x6C, %l2
	stwa	%o4,	[%l7 + %l2] 0x80
	ld	[%l7 + 0x2C],	%f29
	fpadd32	%f12,	%f10,	%f0
	set	0x69, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g2
	or	%l0,	%l2,	%o1
	and	%l1,	%l3,	%o2
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%o7
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%o3
	nop
	set	0x70, %o1
	sth	%o5,	[%l7 + %o1]
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x81,	%g3
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%g5
	or	%i3,	%i1,	%o6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f0
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xe2,	%l4
	nop
	set	0x7E, %o5
	ldsh	[%l7 + %o5],	%i7
	nop
	set	0x0E, %i2
	ldub	[%l7 + %i2],	%g1
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x81,	%i6
	set	0x73, %l5
	stba	%i5,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x50, %l4
	stda	%l4,	[%l7 + %l4] 0xeb
	membar	#Sync
	fpadd32s	%f4,	%f24,	%f20
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x58, %g1
	stw	%i2,	[%l7 + %g1]
	set	0x68, %i0
	stwa	%o0,	[%l7 + %i0] 0x81
	nop
	set	0x58, %o2
	stx	%g7,	[%l7 + %o2]
	nop
	set	0x46, %g3
	stb	%o4,	[%l7 + %g3]
	nop
	set	0x70, %i3
	ldsh	[%l7 + %i3],	%g2
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%g4
	fpadd32s	%f9,	%f26,	%f10
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	nop
	set	0x54, %i6
	sth	%o1,	[%l7 + %i6]
	set	0x58, %i5
	stwa	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x81,	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o2
	add	%l6,	%o7,	%o3
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x89,	 3
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%g3
	set	0x10, %i4
	stxa	%i0,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x68, %g4
	stx	%i4,	[%l7 + %g4]
	set	0x17, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g5
	set	0x35, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g6
	nop
	set	0x2A, %l0
	ldub	[%l7 + %l0],	%i1
	nop
	set	0x68, %o3
	sth	%i3,	[%l7 + %o3]
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f12
	nop
	set	0x14, %l3
	swap	[%l7 + %l3],	%o6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%i7
	wr	%i6,	%i5,	%softint
	nop
	set	0x6C, %o4
	stw	%l4,	[%l7 + %o4]
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x88,	%i2
	or	%g1,	%g7,	%o0
	set	0x64, %l1
	swapa	[%l7 + %l1] 0x80,	%o4
	st	%f23,	[%l7 + 0x60]
	nop
	set	0x54, %o7
	stw	%g2,	[%l7 + %o7]
	set	0x20, %i2
	swapa	[%l7 + %i2] 0x88,	%g4
	nop
	set	0x60, %o5
	ldstub	[%l7 + %o5],	%o1
	or	%l2,	%l0,	%l3
	nop
	set	0x22, %l5
	ldub	[%l7 + %l5],	%o2
	nop
	set	0x58, %i7
	ldsb	[%l7 + %i7],	%l1
	set	0x32, %i1
	stba	%l6,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x5E, %g1
	stha	%o3,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x20, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f22
	nop
	set	0x10, %g3
	ldsh	[%l7 + %g3],	%o5
	nop
	set	0x17, %i3
	ldstub	[%l7 + %i3],	%g3
	nop
	set	0x2B, %o2
	ldsb	[%l7 + %o2],	%i4
	st	%fsr,	[%l7 + 0x60]
	nop
	nop
	setx	0xD4172FAC72159360,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xAB0FDDA4C2CF2BC9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f12,	%f16
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd2
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f10
	st	%f24,	[%l7 + 0x28]
	and	%i0,	%g6,	%i1
	nop
	set	0x67, %i6
	stb	%i3,	[%l7 + %i6]
	set	0x0C, %i5
	sta	%f21,	[%l7 + %i5] 0x89
	set	0x77, %o0
	stba	%o6,	[%l7 + %o0] 0x89
	set	0x7E, %o6
	stha	%l5,	[%l7 + %o6] 0xeb
	membar	#Sync
	bl,a	%xcc,	loop_36
	nop
	set	0x4C, %g6
	swap	[%l7 + %g6],	%i7
	nop
	set	0x33, %g4
	ldub	[%l7 + %g4],	%g5
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
loop_36:
	nop
	set	0x28, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x40, %l0
	sth	%i5,	[%l7 + %l0]
	nop
	set	0x10, %o3
	prefetch	[%l7 + %o3],	 2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%g1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%g7
	be	%icc,	loop_37
	nop
	set	0x68, %i4
	stx	%o0,	[%l7 + %i4]
	set	0x0C, %l3
	stha	%o4,	[%l7 + %l3] 0x81
loop_37:
	nop
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x81,	%o1
	nop
	set	0x50, %l1
	ldx	[%l7 + %l1],	%l2
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%l0
	nop
	set	0x12, %o7
	ldstub	[%l7 + %o7],	%l3
	nop
	set	0x10, %i2
	lduw	[%l7 + %i2],	%g4
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x38, %l5
	ldsw	[%l7 + %l5],	%l1
	nop
	set	0x36, %i1
	sth	%l6,	[%l7 + %i1]
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f28
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x80,	%f0
	nop
	set	0x1B, %l4
	ldsb	[%l7 + %l4],	%o3
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%o2
	nop
	set	0x20, %i3
	ldx	[%l7 + %i3],	%o7
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x88,	%g3
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x58, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x78, %g2
	std	%f26,	[%l7 + %g2]
	nop
	set	0x40, %i6
	ldstub	[%l7 + %i6],	%o5
	set	0x13, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i0
	nop
	set	0x40, %g7
	std	%f0,	[%l7 + %g7]
	nop
	set	0x48, %o0
	swap	[%l7 + %o0],	%i3
	nop
	set	0x68, %o6
	stx	%fsr,	[%l7 + %o6]
	fpadd32	%f16,	%f4,	%f10
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%i0
	nop
	set	0x64, %g6
	ldsb	[%l7 + %g6],	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%g5
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f16
	nop
	set	0x27, %l2
	stb	%i6,	[%l7 + %l2]
	and	%i5,	%l4,	%g1
	or	%i2,	%g7,	%o0
	set	0x3C, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o6
	nop
	set	0x44, %o3
	ldsw	[%l7 + %o3],	%g2
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x16, %i4
	ldstub	[%l7 + %i4],	%o1
	st	%fsr,	[%l7 + 0x28]
	nop
	nop
	setx	0xF302629F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xAD1A5274,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f3,	%f31
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f10
	nop
	set	0x6C, %o4
	stw	%o4,	[%l7 + %o4]
	nop
	set	0x30, %o1
	std	%f14,	[%l7 + %o1]
	nop
	set	0x6B, %l1
	ldstub	[%l7 + %l1],	%l0
	set	0x73, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l2
	set	0x78, %i2
	stwa	%l3,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x6D, %o7
	ldstub	[%l7 + %o7],	%l1
	nop
	set	0x62, %l5
	ldstub	[%l7 + %l5],	%g4
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6D8, 	%sys_tick_cmpr
	nop
	set	0x15, %i7
	ldsb	[%l7 + %i7],	%o7
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x80,	%o2
	nop
	set	0x48, %i0
	stw	%g3,	[%l7 + %i0]
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
	st	%fsr,	[%l7 + 0x5C]
	st	%f3,	[%l7 + 0x40]
	set	0x20, %l4
	swapa	[%l7 + %l4] 0x89,	%g6
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x88,	%o5
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x89,	%i2
	nop
	set	0x3C, %g2
	sth	%i0,	[%l7 + %g2]
	nop
	set	0x70, %i6
	std	%i0,	[%l7 + %i6]
	nop
	set	0x0E, %i5
	lduh	[%l7 + %i5],	%l5
	nop
	set	0x78, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x64, %o0
	swap	[%l7 + %o0],	%i6
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x3B, %g7
	ldstub	[%l7 + %g7],	%i5
	set	0x38, %g4
	sta	%f21,	[%l7 + %g4] 0x81
	nop
	set	0x30, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%l4
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x80,	%g5
	set	0x5C, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i2
	set	0x0C, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g1
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x88,	 2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x3A, %l3
	ldub	[%l7 + %l3],	%o0
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%o6
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x7E, %g5
	ldsb	[%l7 + %g5],	%o4
	set	0x3B, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l0
	set	0x64, %i2
	lda	[%l7 + %i2] 0x89,	%f25
	nop
	set	0x64, %l5
	sth	%o1,	[%l7 + %l5]
	nop
	set	0x10, %o7
	std	%f4,	[%l7 + %o7]
	st	%f29,	[%l7 + 0x74]
	nop
	set	0x10, %i7
	std	%l2,	[%l7 + %i7]
	fpadd32	%f18,	%f8,	%f26
	and	%l3,	%g4,	%l1
	nop
	set	0x52, %i1
	ldsh	[%l7 + %i1],	%o3
	set	0x5C, %o5
	sta	%f13,	[%l7 + %o5] 0x88
	nop
	set	0x29, %i0
	stb	%l6,	[%l7 + %i0]
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%o7
	nop
	set	0x30, %i3
	stx	%o2,	[%l7 + %i3]
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%i4
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%g6
	add	%g3,	%i3,	%i0
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%o5
	set	0x4C, %i5
	sta	%f7,	[%l7 + %i5] 0x81
	nop
	set	0x1B, %o2
	ldsb	[%l7 + %o2],	%i1
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f28
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%i7
	ld	[%l7 + 0x0C],	%f24
	set	0x5E, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l5
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x81,	%i6
	nop
	set	0x34, %o6
	ldsh	[%l7 + %o6],	%l4
	or	%i5,	%i2,	%g1
	nop
	set	0x58, %g6
	ldsh	[%l7 + %g6],	%g7
	set	0x48, %l2
	stxa	%g5,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x55, %o3
	ldub	[%l7 + %o3],	%g2
	nop
	set	0x6F, %l6
	ldstub	[%l7 + %l6],	%o0
	set	0x4F, %l0
	stba	%o4,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%o6,	%o1,	%l2
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%l0
	nop
	nop
	setx	0x9A780AC7EB2D039A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0B8560C017D5CFCC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f20
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%g4
	set	0x4C, %o1
	sta	%f7,	[%l7 + %o1] 0x80
	nop
	set	0x14, %g5
	stw	%l1,	[%l7 + %g5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDB0, 	%sys_tick_cmpr
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%o7
	nop
	set	0x70, %i2
	ldx	[%l7 + %i2],	%o3
	set	0x64, %l5
	stwa	%o2,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x60, %l1
	lda	[%l7 + %l1] 0x81,	%f20
	nop
	set	0x26, %i7
	ldstub	[%l7 + %i7],	%i4
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x14, %o7
	swap	[%l7 + %o7],	%g6
	nop
	set	0x08, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f8
	nop
	set	0x3E, %i0
	sth	%g3,	[%l7 + %i0]
	nop
	set	0x10, %i3
	std	%i2,	[%l7 + %i3]
	nop
	set	0x08, %g1
	lduh	[%l7 + %g1],	%i0
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x7E, %g3
	ldsh	[%l7 + %g3],	%i1
	set	0x58, %i5
	stda	%o4,	[%l7 + %i5] 0x89
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x38, %g2
	prefetch	[%l7 + %g2],	 1
	set	0x60, %i6
	stxa	%i7,	[%l7 + %i6] 0x80
	set	0x3D, %o0
	stba	%l5,	[%l7 + %o0] 0x88
	set	0x60, %g7
	prefetcha	[%l7 + %g7] 0x89,	 0
	nop
	set	0x39, %g4
	stb	%l4,	[%l7 + %g4]
	nop
	set	0x1C, %o6
	prefetch	[%l7 + %o6],	 3
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x88,	%i2
	st	%fsr,	[%l7 + 0x54]
	set	0x7E, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g1
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x20, %o3
	ldsb	[%l7 + %o3],	%g7
	or	%i5,	%g5,	%o0
	nop
	set	0x24, %l0
	stb	%g2,	[%l7 + %l0]
	st	%f27,	[%l7 + 0x40]
	or	%o6,	%o4,	%l2
	nop
	set	0x10, %l3
	std	%f20,	[%l7 + %l3]
	nop
	set	0x10, %l6
	ldub	[%l7 + %l6],	%l0
	or	%o1,	%g4,	%l3
	fpadd32s	%f17,	%f26,	%f21
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o7
	set	0x50, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g3
	set	0x1C, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i3
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
	nop
	set	0x26, %o4
	sth	%i0,	[%l7 + %o4]
	and	%i1,	%o5,	%i7
	fpsub16s	%f26,	%f31,	%f5
	ld	[%l7 + 0x7C],	%f21
	nop
	set	0x1B, %i2
	stb	%g6,	[%l7 + %i2]
	nop
	set	0x1A, %l1
	ldsb	[%l7 + %l1],	%i6
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f12
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%l4
	fpadd16	%f0,	%f26,	%f0
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x42, %i1
	ldub	[%l7 + %i1],	%i2
	nop
	set	0x60, %o5
	std	%f8,	[%l7 + %o5]
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x89,	%g1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xd0
	nop
	set	0x48, %g1
	std	%g6,	[%l7 + %g1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%g2
	nop
	set	0x20, %g3
	std	%f8,	[%l7 + %g3]
	nop
	set	0x5C, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%g5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f16
	set	0x68, %g2
	stxa	%o4,	[%l7 + %g2] 0x81
	set	0x68, %i6
	stda	%o6,	[%l7 + %i6] 0x88
	set	0x2C, %o0
	lda	[%l7 + %o0] 0x80,	%f29
	nop
	set	0x18, %g7
	stx	%l2,	[%l7 + %g7]
	set	0x7C, %o6
	sta	%f7,	[%l7 + %o6] 0x80
	or	%o1,	%g4,	%l3
	nop
	set	0x4F, %l2
	ldub	[%l7 + %l2],	%l6
	nop
	set	0x58, %g6
	std	%o6,	[%l7 + %g6]
	nop
	set	0x76, %g4
	ldub	[%l7 + %g4],	%l0
	nop
	set	0x78, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	fpadd16	%f0,	%f24,	%f28
	set	0x50, %l6
	stwa	%o3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x30, %o1
	swap	[%l7 + %o1],	%l1
	set	0x10, %g5
	sta	%f20,	[%l7 + %g5] 0x80
	set	0x20, %i4
	stda	%i4,	[%l7 + %i4] 0xeb
	membar	#Sync
	or	%o2,	%g3,	%i3
	set	0x70, %o4
	stda	%i0,	[%l7 + %o4] 0xe2
	membar	#Sync
	or	%i1,	%i7,	%g6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l4
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x80,	 4
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x64, %o3
	ldstub	[%l7 + %o3],	%g7
	nop
	set	0x18, %l5
	stx	%g1,	[%l7 + %l5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%i5
	nop
	set	0x7E, %o7
	ldstub	[%l7 + %o7],	%g2
	nop
	set	0x3C, %i7
	ldsb	[%l7 + %i7],	%g5
	set	0x0C, %o5
	swapa	[%l7 + %o5] 0x80,	%o4
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%o0
	nop
	set	0x41, %i3
	ldub	[%l7 + %i3],	%l2
	nop
	set	0x48, %g1
	stx	%o1,	[%l7 + %g1]
	nop
	set	0x28, %g3
	prefetch	[%l7 + %g3],	 0
	wr	%o6,	%l3,	%y
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xca
	set	0x12, %i1
	stha	%l6,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x10, %l4
	sta	%f31,	[%l7 + %l4] 0x89
	nop
	set	0x18, %o2
	ldstub	[%l7 + %o2],	%g4
	set	0x38, %g2
	lda	[%l7 + %g2] 0x89,	%f6
	nop
	set	0x40, %o0
	ldsw	[%l7 + %o0],	%o7
	nop
	set	0x75, %g7
	ldsb	[%l7 + %g7],	%o3
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x58, %o6
	ldsw	[%l7 + %o6],	%l0
	nop
	set	0x70, %i6
	stx	%l1,	[%l7 + %i6]
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%o2
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%i4
	or	%i3,	%i0,	%g3
	nop
	set	0x38, %l0
	std	%f6,	[%l7 + %l0]
	nop
	set	0x4B, %l3
	ldub	[%l7 + %l3],	%i7
	set	0x45, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g6
	nop
	set	0x08, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%o5
	nop
	set	0x32, %i4
	ldstub	[%l7 + %i4],	%i1
	set	0x64, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f0
	add	%i6,	%l4,	%g1
	st	%f7,	[%l7 + 0x08]
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%l4
	or	%g7,	%i5,	%g5
	nop
	set	0x30, %l5
	prefetch	[%l7 + %l5],	 4
	set	0x77, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%l2
	nop
	set	0x78, %o7
	std	%o0,	[%l7 + %o7]
	nop
	nop
	setx	0xBEDDC076,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x47CE6B36,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f7,	%f17
	ld	[%l7 + 0x2C],	%f11
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f12
	nop
	set	0x6B, %o5
	ldstub	[%l7 + %o5],	%g2
	nop
	set	0x52, %i3
	ldsh	[%l7 + %i3],	%o6
	nop
	set	0x60, %i0
	stw	%l3,	[%l7 + %i0]
	nop
	set	0x5D, %g3
	ldstub	[%l7 + %g3],	%l6
	and	%o7,	%o3,	%g4
	set	0x44, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l1
	add	%l0,	%o2,	%i4
	nop
	set	0x29, %g1
	ldstub	[%l7 + %g1],	%i3
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xea,	%i0
	nop
	set	0x60, %i1
	ldstub	[%l7 + %i1],	%g3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xeb,	%g6
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	nop
	set	0x1F, %o2
	ldub	[%l7 + %o2],	%o5
	nop
	set	0x44, %g7
	swap	[%l7 + %g7],	%i2
	set	0x18, %o6
	stxa	%i1,	[%l7 + %o6] 0xea
	membar	#Sync
	and	%i6,	%g1,	%l5
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x88,	%g7
	add	%l4,	%i5,	%o4
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f18
	nop
	set	0x74, %l0
	swap	[%l7 + %l0],	%g5
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x88,	 3
	nop
	set	0x3C, %l6
	lduh	[%l7 + %l6],	%o1
	nop
	set	0x54, %l3
	swap	[%l7 + %l3],	%o0
	nop
	set	0x40, %g4
	stx	%g2,	[%l7 + %g4]
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x89,	%l2
	nop
	set	0x70, %g5
	std	%i6,	[%l7 + %g5]
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x50, %i2
	stw	%o3,	[%l7 + %i2]
	nop
	set	0x1E, %l1
	ldub	[%l7 + %l1],	%g4
	nop
	set	0x20, %o3
	std	%o6,	[%l7 + %o3]
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%l0
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xcc
	set	0x3D, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l0
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
	bl	%icc,	loop_38
	st	%fsr,	[%l7 + 0x38]
	or	%i4,	%o2,	%i3
	nop
	set	0x40, %i3
	std	%f0,	[%l7 + %i3]
loop_38:
	and	%g3,	%i0,	%g6
	or	%i7,	%o5,	%i1
	set	0x4C, %i7
	stha	%i2,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xea,	%g0
	nop
	set	0x54, %i0
	swap	[%l7 + %i0],	%i6
	fpadd16	%f2,	%f6,	%f6
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%g6
	set	0x41, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l5
	wr	%l4,	%o4,	%softint
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%i5
	add	%l2,	%g5,	%o0
	nop
	set	0x7E, %i1
	ldsb	[%l7 + %i1],	%g2
	set	0x5F, %o0
	stba	%l3,	[%l7 + %o0] 0x89
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x81,	 2
	nop
	set	0x1E, %g7
	lduh	[%l7 + %g7],	%o1
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x80,	%o6
	nop
	set	0x1C, %g2
	ldstub	[%l7 + %g2],	%g4
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%o7
	nop
	set	0x68, %i6
	std	%f0,	[%l7 + %i6]
	set	0x78, %g6
	sta	%f25,	[%l7 + %g6] 0x88
	nop
	set	0x2E, %l6
	sth	%o3,	[%l7 + %l6]
	set	0x16, %l3
	stha	%l1,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x40, %l0
	stwa	%l0,	[%l7 + %l0] 0x88
	nop
	set	0x54, %g4
	stw	%o2,	[%l7 + %g4]
	nop
	set	0x44, %g5
	ldub	[%l7 + %g5],	%i4
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%f28
	set	0x5C, %i2
	stha	%g3,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x3C, %i4
	swap	[%l7 + %i4],	%i3
	ld	[%l7 + 0x1C],	%f9
	nop
	set	0x4C, %l1
	lduh	[%l7 + %l1],	%i0
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	set	0x6A, %l5
	stba	%i7,	[%l7 + %l5] 0x88
	nop
	set	0x68, %o4
	std	%i0,	[%l7 + %o4]
	nop
	set	0x1A, %o7
	sth	%o5,	[%l7 + %o7]
	set	0x08, %o5
	stxa	%i2,	[%l7 + %o5] 0x88
	st	%fsr,	[%l7 + 0x18]
	set	0x08, %i7
	stha	%g1,	[%l7 + %i7] 0x88
	nop
	set	0x18, %i3
	lduw	[%l7 + %i3],	%g7
	nop
	set	0x2A, %g3
	ldsh	[%l7 + %g3],	%l5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o4
	set	0x48, %i5
	stwa	%i5,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x61, %g1
	stb	%l4,	[%l7 + %g1]
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%f4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%l2
	nop
	set	0x10, %i1
	stx	%o0,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x2F, %o0
	ldsb	[%l7 + %o0],	%g2
	ld	[%l7 + 0x14],	%f9
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x88,	%l6
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%l2
	nop
	set	0x30, %g7
	ldsw	[%l7 + %g7],	%o6
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f28
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%g4
	nop
	set	0x63, %l2
	stb	%o1,	[%l7 + %l2]
	add	%o3,	%o7,	%l1
	set	0x28, %l6
	sta	%f6,	[%l7 + %l6] 0x88
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%i4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	nop
	set	0x68, %l0
	lduw	[%l7 + %l0],	%o2
	wr	%g3,	%i3,	%set_softint
	set	0x3A, %l3
	stha	%i0,	[%l7 + %l3] 0x89
	nop
	nop
	setx	0x8E453406,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x9687F83D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f30,	%f17
	set	0x7C, %g5
	stwa	%i7,	[%l7 + %g5] 0x81
	or	%g6,	%o5,	%i2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf1
	membar	#Sync
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x48, %i4
	std	%f20,	[%l7 + %i4]
	nop
	nop
	setx	0x084BE3E95E6EF3C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x3F6B492C938E530F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f6
	or	%g1,	%l5,	%g7
	nop
	set	0x4C, %l1
	sth	%o4,	[%l7 + %l1]
	nop
	set	0x0C, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x24, %o3
	swapa	[%l7 + %o3] 0x88,	%i5
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x48, %o4
	std	%g4,	[%l7 + %o4]
	nop
	set	0x68, %o5
	ldsw	[%l7 + %o5],	%l4
	nop
	set	0x6A, %i7
	sth	%l2,	[%l7 + %i7]
	nop
	set	0x3C, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x24, %i3
	sta	%f0,	[%l7 + %i3] 0x80
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%g4
	st	%fsr,	[%l7 + 0x50]
	set	0x34, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o1
	set	0x6C, %g1
	lda	[%l7 + %g1] 0x81,	%f1
	nop
	set	0x6F, %l4
	ldsb	[%l7 + %l4],	%o3
	nop
	set	0x08, %g3
	lduh	[%l7 + %g3],	%l3
	nop
	set	0x4F, %o0
	stb	%o7,	[%l7 + %o0]
	set	0x23, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l1
	set	0x54, %o2
	sta	%f13,	[%l7 + %o2] 0x88
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x89,	%l0
	set	0x20, %g7
	stxa	%i4,	[%l7 + %g7] 0x81
	set	0x65, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o2
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%i2
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x48, %l6
	lduw	[%l7 + %l6],	%g3
	nop
	set	0x30, %l0
	stx	%i0,	[%l7 + %l0]
	set	0x3C, %l3
	stwa	%i7,	[%l7 + %l3] 0x80
	set	0x74, %g6
	stwa	%g6,	[%l7 + %g6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	st	%f3,	[%l7 + 0x64]
	and	%i2,	%i1,	%o5
	and	%l5,	%g7,	%g1
	nop
	set	0x71, %g5
	ldsb	[%l7 + %g5],	%o4
	fpadd16	%f20,	%f30,	%f20
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%i6
	or	%g5,	%l4,	%l2
	nop
	set	0x58, %i4
	ldsw	[%l7 + %i4],	%i5
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x80,	%f6
	nop
	nop
	setx	0x39E73F87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x893AD3A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f11,	%f16
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x1A, %l1
	stha	%o0,	[%l7 + %l1] 0x89
	nop
	set	0x75, %o3
	ldsb	[%l7 + %o3],	%g2
	nop
	set	0x10, %l5
	ldsh	[%l7 + %l5],	%o6
	set	0x58, %o4
	stha	%g4,	[%l7 + %o4] 0x89
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%o3
	set	0x24, %o5
	swapa	[%l7 + %o5] 0x80,	%l3
	or	%l6,	%o7,	%l0
	ld	[%l7 + 0x50],	%f20
	set	0x20, %i7
	sta	%f20,	[%l7 + %i7] 0x88
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	and	%i4,	%o2,	%l1
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 2
	or	%i3,	%i0,	%g3
	nop
	set	0x44, %i0
	prefetch	[%l7 + %i0],	 4
	set	0x40, %g1
	ldxa	[%l7 + %g1] 0x88,	%i7
	set	0x3F, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g6
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%i2
	set	0x08, %o0
	lda	[%l7 + %o0] 0x89,	%f24
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%l5
	ld	[%l7 + 0x54],	%f25
	set	0x1C, %i5
	lda	[%l7 + %i5] 0x88,	%f3
	nop
	set	0x78, %o2
	ldsh	[%l7 + %o2],	%g7
	nop
	set	0x28, %o6
	stx	%i1,	[%l7 + %o6]
	set	0x22, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g1
	nop
	set	0x74, %g2
	ldstub	[%l7 + %g2],	%o4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f16
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%g5
	fpsub32	%f10,	%f4,	%f26
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x88,	%l4
	nop
	set	0x43, %l3
	stb	%l2,	[%l7 + %l3]
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%i6
	st	%f9,	[%l7 + 0x54]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc0
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x89,	%i4
	set	0x2C, %o1
	stwa	%o0,	[%l7 + %o1] 0xe3
	membar	#Sync
	bg	%icc,	loop_39
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%o6
	set	0x0B, %g4
	stba	%g2,	[%l7 + %g4] 0xea
	membar	#Sync
loop_39:
	nop
	set	0x30, %i2
	ldxa	[%l7 + %i2] 0x80,	%g4
	set	0x1A, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o3
	nop
	set	0x68, %o3
	ldsh	[%l7 + %o3],	%o1
	nop
	set	0x54, %o4
	swap	[%l7 + %o4],	%l6
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f18
	add	%l3,	%l0,	%i4
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%o2
	set	0x18, %l5
	swapa	[%l7 + %l5] 0x80,	%l1
	add	%o7,	%i0,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%g6
	nop
	set	0x16, %i3
	ldsh	[%l7 + %i3],	%i2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%i6
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x88,	%o5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe2,	%l4
	bne,a	%icc,	loop_40
	nop
	set	0x10, %g3
	stx	%g7,	[%l7 + %g3]
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0
loop_40:
	nop
	set	0x08, %o7
	ldx	[%l7 + %o7],	%o4
	and	%g5,	%l4,	%l2
	set	0x4C, %o2
	stwa	%g1,	[%l7 + %o2] 0x88
	nop
	set	0x38, %o6
	stx	%i5,	[%l7 + %o6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%o6
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x80,	%g2
	nop
	set	0x2A, %g7
	stb	%g4,	[%l7 + %g7]
	set	0x46, %l2
	stha	%o3,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%o0
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f20
	nop
	nop
	setx	0x7316D693,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x32584DEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f10,	%f20
	nop
	set	0x64, %g2
	lduw	[%l7 + %g2],	%o0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f16
	bgu,a	%icc,	loop_41
	nop
	set	0x46, %i6
	sth	%l3,	[%l7 + %i6]
	st	%f6,	[%l7 + 0x14]
	add	%l6,	%i4,	%l0
loop_41:
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%l1
	or	%o7,	%o2,	%i0
	fpsub16s	%f22,	%f29,	%f10
	nop
	set	0x44, %g5
	stw	%g3,	[%l7 + %g5]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	or	%i3,	%g6,	%i2
	nop
	set	0x50, %i4
	stw	%o5,	[%l7 + %i4]
	ld	[%l7 + 0x6C],	%f17
	nop
	set	0x48, %o1
	ldub	[%l7 + %o1],	%i7
	nop
	set	0x62, %i2
	sth	%l5,	[%l7 + %i2]
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f28
	set	0x39, %l1
	ldstuba	[%l7 + %l1] 0x81,	%g7
	nop
	set	0x70, %i7
	ldx	[%l7 + %i7],	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%g5
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%l4
	set	0x30, %l5
	ldda	[%l7 + %l5] 0xea,	%g0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%i4
	nop
	set	0x0E, %i0
	ldub	[%l7 + %i0],	%i6
	set	0x34, %g1
	swapa	[%l7 + %g1] 0x81,	%l2
	add	%g2,	%g4,	%o3
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x88,	 1
	nop
	set	0x28, %l4
	std	%o0,	[%l7 + %l4]
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x89,	%o0
	nop
	set	0x4C, %o7
	ldsh	[%l7 + %o7],	%l3
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f6
	ld	[%l7 + 0x60],	%f28
	nop
	set	0x74, %i5
	lduh	[%l7 + %i5],	%l6
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%i4
	set	0x4B, %o2
	ldstuba	[%l7 + %o2] 0x81,	%l0
	nop
	set	0x16, %l2
	ldub	[%l7 + %l2],	%o7
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xea,	%o2
	set	0x6C, %g2
	sta	%f25,	[%l7 + %g2] 0x81
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x81,	%l0
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x89,	%i0
	nop
	set	0x08, %i6
	stb	%g3,	[%l7 + %i6]
	set	0x70, %g5
	stwa	%g6,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x10, %l0
	std	%f6,	[%l7 + %l0]
	nop
	set	0x5B, %g6
	stb	%i3,	[%l7 + %g6]
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x88,	%i2
	nop
	set	0x6C, %i4
	lduh	[%l7 + %i4],	%o5
	set	0x10, %i2
	sta	%f7,	[%l7 + %i2] 0x80
	bne,a	%icc,	loop_42
	nop
	set	0x6C, %o3
	stw	%i7,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x3C]
	set	0x1C, %o4
	sta	%f26,	[%l7 + %o4] 0x88
loop_42:
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f12
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x89,	%g6
	st	%f30,	[%l7 + 0x44]
	nop
	set	0x2F, %o5
	ldub	[%l7 + %o5],	%o4
	or	%i1,	%g5,	%l4
	fpsub32s	%f3,	%f9,	%f9
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%i5
	nop
	set	0x48, %l1
	std	%i6,	[%l7 + %l1]
	nop
	set	0x70, %i3
	prefetch	[%l7 + %i3],	 1
	and	%l5,	%l2,	%g2
	and	%g4,	%o3,	%o1
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%o6
	nop
	set	0x4C, %g1
	ldsh	[%l7 + %g1],	%o0
	nop
	set	0x4C, %l5
	stb	%l6,	[%l7 + %l5]
	set	0x14, %g3
	stha	%l3,	[%l7 + %g3] 0xeb
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%l0
	fpsub16	%f4,	%f30,	%f20
	add	%o2,	%o7,	%i0
	wr	%g3,	%g6,	%ccr
	nop
	set	0x3C, %o0
	ldsh	[%l7 + %o0],	%i3
	ld	[%l7 + 0x10],	%f5
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%i2
	nop
	set	0x50, %o6
	stw	%o5,	[%l7 + %o6]
	set	0x28, %i5
	stxa	%i7,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x43, %g7
	ldsb	[%l7 + %g7],	%g7
	nop
	set	0x70, %o7
	std	%f0,	[%l7 + %o7]
	set	0x18, %l2
	stwa	%o4,	[%l7 + %l2] 0x89
	set	0x46, %o2
	stha	%i1,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x48, %l6
	swapa	[%l7 + %l6] 0x88,	%l1
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%l4
	nop
	set	0x5C, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x0B, %l3
	ldstub	[%l7 + %l3],	%g1
	nop
	set	0x1B, %g5
	ldstub	[%l7 + %g5],	%i5
	set	0x1A, %i6
	stha	%i6,	[%l7 + %i6] 0x80
	add	%l5,	%l2,	%g5
	or	%g4,	%g2,	%o3
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x80,	%o6
	set	0x18, %g6
	ldxa	[%l7 + %g6] 0x81,	%o0
	nop
	set	0x38, %o1
	ldstub	[%l7 + %o1],	%o1
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
	nop
	set	0x50, %i2
	sth	%l6,	[%l7 + %i2]
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f8
	nop
	set	0x78, %o3
	stb	%l0,	[%l7 + %o3]
	nop
	set	0x50, %i7
	std	%f28,	[%l7 + %i7]
	nop
	set	0x52, %g4
	ldstub	[%l7 + %g4],	%o2
	set	0x58, %o5
	stda	%o6,	[%l7 + %o5] 0x89
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f28
	set	0x4F, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i4
	set	0x09, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g3
	set	0x2C, %g1
	swapa	[%l7 + %g1] 0x80,	%g6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x89
	nop
	set	0x30, %o0
	sth	%i3,	[%l7 + %o0]
	nop
	set	0x10, %l4
	std	%f6,	[%l7 + %l4]
	set	0x18, %l5
	stwa	%i0,	[%l7 + %l5] 0xea
	membar	#Sync
	ld	[%l7 + 0x1C],	%f18
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f8
	nop
	set	0x76, %i5
	ldsh	[%l7 + %i5],	%o5
	nop
	set	0x16, %g7
	ldub	[%l7 + %g7],	%i7
	nop
	set	0x10, %l2
	stw	%i2,	[%l7 + %l2]
	fpsub16	%f6,	%f16,	%f18
	nop
	set	0x72, %o7
	ldsh	[%l7 + %o7],	%o4
	ld	[%l7 + 0x1C],	%f27
	st	%fsr,	[%l7 + 0x10]
	st	%f25,	[%l7 + 0x0C]
	fpsub32s	%f29,	%f17,	%f27
	and	%i1,	%g7,	%l1
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f26
	set	0x5E, %l6
	stba	%l4,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x68, %i1
	lduw	[%l7 + %i1],	%i5
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%g1
	or	%l5,	%l2,	%g4
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x89,	%g5
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%g2
	ld	[%l7 + 0x34],	%f15
	nop
	set	0x37, %i6
	ldub	[%l7 + %i6],	%o6
	and	%o0,	%o1,	%l3
	st	%fsr,	[%l7 + 0x60]
	set	0x60, %g6
	sta	%f19,	[%l7 + %g6] 0x88
	nop
	set	0x19, %o1
	ldstub	[%l7 + %o1],	%l6
	set	0x28, %l0
	stda	%o2,	[%l7 + %l0] 0xea
	membar	#Sync
	fpadd16s	%f30,	%f30,	%f2
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%l0
	nop
	set	0x08, %i4
	prefetch	[%l7 + %i4],	 1
	add	%o2,	%i4,	%o7
	nop
	set	0x48, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x08, %i7
	swapa	[%l7 + %i7] 0x80,	%g6
	set	0x7C, %g4
	stwa	%g3,	[%l7 + %g4] 0x89
	be,a	%icc,	loop_43
	nop
	set	0x12, %o5
	ldstub	[%l7 + %o5],	%i3
	nop
	set	0x68, %l1
	lduw	[%l7 + %l1],	%i0
	nop
	set	0x50, %i0
	std	%i6,	[%l7 + %i0]
loop_43:
	nop
	set	0x5C, %o3
	stha	%o5,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x10, %i3
	stw	%o4,	[%l7 + %i3]
	nop
	set	0x60, %g1
	std	%i0,	[%l7 + %g1]
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x89,	 2
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f26
	add	%l1,	%g7,	%i5
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x81,	%l4
	add	%i6,	%l5,	%g1
	add	%g4,	%g5,	%l2
	nop
	set	0x08, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x40, %i5
	stda	%g2,	[%l7 + %i5] 0x89
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x4C, %l2
	lduw	[%l7 + %l2],	%o0
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0
	fpadd16	%f24,	%f26,	%f18
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f16
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	nop
	set	0x2B, %o7
	stb	%l3,	[%l7 + %o7]
	set	0x68, %i1
	stda	%o6,	[%l7 + %i1] 0x88
	add	%l6,	%l0,	%o2
	nop
	set	0x72, %l3
	sth	%i4,	[%l7 + %l3]
	nop
	set	0x08, %g5
	stx	%o7,	[%l7 + %g5]
	nop
	set	0x3E, %g2
	ldsh	[%l7 + %g2],	%o3
	bgu,a	%xcc,	loop_44
	nop
	set	0x7A, %i6
	sth	%g3,	[%l7 + %i6]
	nop
	set	0x79, %g6
	ldstub	[%l7 + %g6],	%g6
	nop
	set	0x54, %o1
	ldsw	[%l7 + %o1],	%i0
loop_44:
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%i3
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%i6
	set	0x79, %o4
	stba	%o4,	[%l7 + %o4] 0x81
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	set	0x0C, %i7
	swapa	[%l7 + %i7] 0x81,	%o5
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%i0
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%i2
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%g6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	nop
	set	0x40, %i3
	swap	[%l7 + %i3],	%i5
	nop
	set	0x0F, %g4
	stb	%l1,	[%l7 + %g4]
	nop
	set	0x6C, %o0
	sth	%i6,	[%l7 + %o0]
	add	%l4,	%l5,	%g4
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%g1
	be,a,pn	%xcc,	loop_45
	nop
	set	0x7C, %l4
	swap	[%l7 + %l4],	%g5
	ld	[%l7 + 0x10],	%f20
	nop
	set	0x74, %g1
	ldsw	[%l7 + %g1],	%l2
loop_45:
	nop
	set	0x3F, %o6
	stb	%g2,	[%l7 + %o6]
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x80,	%o0
	nop
	set	0x10, %l2
	stx	%l3,	[%l7 + %l2]
	nop
	set	0x3A, %g7
	ldstub	[%l7 + %g7],	%o6
	set	0x44, %l5
	sta	%f13,	[%l7 + %l5] 0x80
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x20, %l6
	std	%o0,	[%l7 + %l6]
	set	0x1C, %o2
	lda	[%l7 + %o2] 0x88,	%f11
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%l0
	set	0x30, %l3
	swapa	[%l7 + %l3] 0x88,	%o2
	set	0x74, %g5
	lda	[%l7 + %g5] 0x81,	%f2
	bne,a	%icc,	loop_46
	nop
	set	0x0E, %g2
	lduh	[%l7 + %g2],	%l6
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x81,	%o7
loop_46:
	nop
	nop
	setx	0x2F6A8572,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2A6E1861,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f7,	%f8
	nop
	set	0x0D, %i6
	ldsb	[%l7 + %i6],	%i4
	nop
	set	0x35, %o1
	ldstub	[%l7 + %o1],	%o3
	and	%g6,	%i0,	%g3
	st	%fsr,	[%l7 + 0x5C]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xca
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd2,	%f0
	nop
	set	0x0E, %o4
	ldstub	[%l7 + %o4],	%i7
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xcc
	nop
	set	0x0A, %l0
	sth	%i3,	[%l7 + %l0]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%o5
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x5C, %i0
	stw	%i2,	[%l7 + %i0]
	or	%i1,	%i5,	%g7
	wr	%l1,	%l4,	%set_softint
	set	0x18, %o3
	ldstuba	[%l7 + %o3] 0x88,	%l5
	set	0x60, %i3
	stba	%g4,	[%l7 + %i3] 0x89
	nop
	set	0x18, %g4
	stw	%g1,	[%l7 + %g4]
	nop
	set	0x0E, %l1
	stb	%g5,	[%l7 + %l1]
	nop
	set	0x18, %o0
	lduw	[%l7 + %o0],	%i6
	nop
	set	0x78, %g3
	ldub	[%l7 + %g3],	%g2
	nop
	set	0x79, %g1
	ldub	[%l7 + %g1],	%o1
	nop
	set	0x20, %o6
	swap	[%l7 + %o6],	%l3
	nop
	set	0x70, %l4
	std	%o6,	[%l7 + %l4]
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x89,	 3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%o0
	nop
	set	0x44, %i5
	stw	%l6,	[%l7 + %i5]
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%o2
	nop
	set	0x1A, %l6
	ldstub	[%l7 + %l6],	%i4
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xe3,	%o6
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%g6
	st	%f5,	[%l7 + 0x68]
	set	0x50, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i0
	set	0x18, %l3
	stda	%o2,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x34, %i1
	stw	%i7,	[%l7 + %i1]
	add	%i3,	%g3,	%o5
	nop
	set	0x7E, %g5
	lduh	[%l7 + %g5],	%i2
	st	%f2,	[%l7 + 0x20]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f0
	nop
	set	0x20, %g2
	prefetch	[%l7 + %g2],	 0
	set	0x1A, %i6
	stha	%o4,	[%l7 + %i6] 0x81
	and	%i1,	%g7,	%l1
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f18
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%l4
	st	%f8,	[%l7 + 0x78]
	set	0x78, %i7
	stda	%i4,	[%l7 + %i7] 0x81
	and	%g4,	%l5,	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%g5
	set	0x74, %o4
	stwa	%o1,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f28
	nop
	set	0x51, %l0
	ldsb	[%l7 + %l0],	%l3
	bne,a	%xcc,	loop_47
	add	%g2,	%o6,	%l2
	nop
	set	0x0D, %o3
	ldub	[%l7 + %o3],	%l0
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%o0
loop_47:
	nop
	set	0x29, %g4
	ldsb	[%l7 + %g4],	%o2
	nop
	set	0x38, %l1
	stx	%fsr,	[%l7 + %l1]
	and	%i4,	%l6,	%o7
	set	0x78, %i0
	sta	%f21,	[%l7 + %i0] 0x88
	set	0x40, %g3
	stxa	%i0,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x1B, %o0
	ldub	[%l7 + %o0],	%g6
	nop
	set	0x68, %o6
	std	%i6,	[%l7 + %o6]
	set	0x70, %l4
	lda	[%l7 + %l4] 0x80,	%f30
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x08, %i5
	stx	%o3,	[%l7 + %i5]
	nop
	set	0x0A, %l5
	sth	%i3,	[%l7 + %l5]
	fpadd16s	%f17,	%f16,	%f26
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xd2
	nop
	set	0x69, %l6
	ldsb	[%l7 + %l6],	%o5
	add	%o4,	%i1,	%l1
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x88,	 4
	set	0x24, %o7
	sta	%f24,	[%l7 + %o7] 0x89
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x80,	%l4
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	fpadd16s	%f23,	%f26,	%f17
	st	%f7,	[%l7 + 0x14]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%g1
	or	%i6,	%g5,	%o1
	st	%f10,	[%l7 + 0x54]
	nop
	set	0x24, %g7
	ldub	[%l7 + %g7],	%l3
	nop
	set	0x58, %g5
	stw	%l5,	[%l7 + %g5]
	fpadd32	%f4,	%f0,	%f12
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x28, %g6
	sth	%g2,	[%l7 + %g6]
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%o6
	set	0x10, %o1
	ldxa	[%l7 + %o1] 0x80,	%l0
	nop
	set	0x2F, %i4
	stb	%l2,	[%l7 + %i4]
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x80,	%o2
	st	%f0,	[%l7 + 0x6C]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%i4
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x80,	 4
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f14
	nop
	set	0x76, %i7
	sth	%o7,	[%l7 + %i7]
	nop
	set	0x34, %l0
	ldsw	[%l7 + %l0],	%g6
	nop
	set	0x59, %o5
	ldub	[%l7 + %o5],	%i0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	nop
	set	0x78, %o3
	std	%i6,	[%l7 + %o3]
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f20
	nop
	set	0x1C, %i0
	ldub	[%l7 + %i0],	%o3
	set	0x54, %g3
	stwa	%i3,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x70, %l1
	stxa	%g3,	[%l7 + %l1] 0x88
	nop
	set	0x56, %o0
	stb	%i2,	[%l7 + %o0]
	fpsub32s	%f4,	%f8,	%f18
	nop
	set	0x54, %l4
	sth	%o5,	[%l7 + %l4]
	or	%i1,	%l1,	%o4
	nop
	set	0x70, %o6
	std	%l4,	[%l7 + %o6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%g4
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x88,	%i5
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x88,	%i6
	nop
	set	0x60, %l2
	std	%f6,	[%l7 + %l2]
	fpsub16s	%f4,	%f15,	%f2
	nop
	set	0x46, %l5
	ldsb	[%l7 + %l5],	%g1
	nop
	set	0x3C, %o2
	ldsb	[%l7 + %o2],	%g5
	nop
	set	0x50, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x14, %l6
	stw	%l3,	[%l7 + %l6]
	nop
	set	0x65, %l3
	ldstub	[%l7 + %l3],	%g2
	add	%o6,	%l0,	%l5
	nop
	set	0x4E, %i1
	ldsb	[%l7 + %i1],	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%i4
	nop
	set	0x11, %g7
	ldstub	[%l7 + %g7],	%l6
	nop
	set	0x5E, %g5
	stb	%o7,	[%l7 + %g5]
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x80,	%g6
	set	0x08, %g2
	stxa	%i0,	[%l7 + %g2] 0x81
	nop
	set	0x10, %o1
	std	%o2,	[%l7 + %o1]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%i3
	nop
	set	0x4E, %i6
	lduh	[%l7 + %i6],	%i7
	set	0x3E, %i4
	stha	%i2,	[%l7 + %i4] 0x81
	st	%f19,	[%l7 + 0x48]
	nop
	set	0x38, %i2
	lduw	[%l7 + %i2],	%g3
	st	%fsr,	[%l7 + 0x34]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
	nop
	set	0x1C, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x89,	%i0
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x89,	%o5
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f22
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe3,	%o4
	set	0x4C, %i0
	stba	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xe3,	%g6
	nop
	set	0x38, %g3
	std	%f20,	[%l7 + %g3]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	nop
	set	0x18, %o0
	swap	[%l7 + %o0],	%l4
	nop
	set	0x4C, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%i5
	nop
	set	0x56, %l4
	ldub	[%l7 + %l4],	%i6
	nop
	set	0x78, %l2
	sth	%g4,	[%l7 + %l2]
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x89,	%g0
	nop
	set	0x60, %i5
	std	%o0,	[%l7 + %i5]
	st	%f6,	[%l7 + 0x3C]
	nop
	set	0x48, %o2
	std	%g4,	[%l7 + %o2]
	wr	%l3,	%g2,	%sys_tick
	nop
	set	0x5D, %o7
	ldsb	[%l7 + %o7],	%o6
	and	%l0,	%l5,	%o0
	ld	[%l7 + 0x38],	%f23
	nop
	set	0x7C, %l6
	stw	%i4,	[%l7 + %l6]
	nop
	set	0x7F, %i1
	ldsb	[%l7 + %i1],	%l2
	and	%l6,	%o7,	%g6
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%o2
	set	0x48, %g5
	stxa	%o3,	[%l7 + %g5] 0x89
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%i0
	nop
	set	0x24, %g6
	prefetch	[%l7 + %g6],	 2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%i7
	set	0x28, %o1
	sta	%f0,	[%l7 + %o1] 0x88
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd8
	nop
	set	0x1A, %i4
	ldub	[%l7 + %i4],	%g3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	nop
	set	0x24, %i6
	prefetch	[%l7 + %i6],	 0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%o5
	set	0x50, %i7
	ldda	[%l7 + %i7] 0xea,	%o4
	fpsub32	%f8,	%f2,	%f6
	nop
	set	0x66, %l0
	stb	%l1,	[%l7 + %l0]
	set	0x60, %o4
	stda	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x88,	 4
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x88,	 4
	st	%f10,	[%l7 + 0x14]
	set	0x18, %i0
	stda	%i4,	[%l7 + %i0] 0x89
	set	0x20, %o3
	stda	%i6,	[%l7 + %o3] 0x88
	set	0x58, %g4
	stxa	%g1,	[%l7 + %g4] 0xe2
	membar	#Sync
	fpadd32	%f30,	%f0,	%f22
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%o1
	nop
	set	0x60, %o0
	stw	%g4,	[%l7 + %o0]
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
	set	0x62, %o6
	stba	%g2,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x3C, %l4
	swap	[%l7 + %l4],	%l3
	fpadd16	%f8,	%f8,	%f0
	set	0x58, %l2
	stwa	%o6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%l0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f0
	set	0x68, %g1
	stda	%l4,	[%l7 + %g1] 0x81
	set	0x48, %o7
	swapa	[%l7 + %o7] 0x88,	%o0
	nop
	set	0x09, %l6
	ldsb	[%l7 + %l6],	%i4
	ld	[%l7 + 0x14],	%f20
	nop
	set	0x2F, %o2
	stb	%l2,	[%l7 + %o2]
	wr	%o7,	%g6,	%sys_tick
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd0
	nop
	set	0x48, %g7
	std	%o2,	[%l7 + %g7]
	or	%o3,	%l6,	%i0
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x81,	%i2
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x80,	%i7
	nop
	set	0x34, %o1
	lduh	[%l7 + %o1],	%g3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
	set	0x55, %l3
	stba	%i2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x58, %i2
	lduw	[%l7 + %i2],	%o5
	nop
	set	0x20, %i6
	ldstub	[%l7 + %i6],	%o4
	nop
	set	0x54, %l0
	ldsw	[%l7 + %l0],	%g7
	and	%i1,	%l4,	%i5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1271
!	Type a   	: 18
!	Type cti   	: 17
!	Type x   	: 527
!	Type f   	: 50
!	Type i   	: 117
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 2 Start
!
.global thread_2
thread_2:
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
	set	0xA,	%g1
	set	0x1,	%g2
	set	0x1,	%g3
	set	0x1,	%g4
	set	0x7,	%g5
	set	0x8,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x6,	%i1
	set	-0x2,	%i2
	set	-0x6,	%i3
	set	-0x5,	%i4
	set	-0x9,	%i5
	set	-0x8,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x756BBC83,	%l0
	set	0x4DA7793F,	%l1
	set	0x078ADB06,	%l2
	set	0x2391CA40,	%l3
	set	0x1EF43A44,	%l4
	set	0x678EDE46,	%l5
	set	0x270A1321,	%l6
	!# Output registers
	set	0x198E,	%o0
	set	-0x0C1F,	%o1
	set	-0x0F60,	%o2
	set	-0x1CD4,	%o3
	set	0x143F,	%o4
	set	0x09B2,	%o5
	set	0x13E7,	%o6
	set	0x1CD1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	set	0x30, %i7
	stxa	%l1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x1C, %i3
	ldsw	[%l7 + %i3],	%i6
	or	%o1,	%g1,	%g4
	nop
	set	0x38, %o4
	stw	%g2,	[%l7 + %o4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xeb,	%l2
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xe3,	%o6
	set	0x40, %o5
	stha	%g5,	[%l7 + %o5] 0x89
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%l0
	bn,pt	%icc,	loop_48
	nop
	nop
	setx	0x4F8270BB68BF87C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x24F5234FA9B17D01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f10,	%f2
	nop
	set	0x24, %g3
	swap	[%l7 + %g3],	%o0
	set	0x2F, %l1
	stba	%i4,	[%l7 + %l1] 0xeb
	membar	#Sync
loop_48:
	nop
	set	0x6D, %o6
	ldsb	[%l7 + %o6],	%l2
	set	0x4C, %o0
	sta	%f20,	[%l7 + %o0] 0x89
	be,a	%xcc,	loop_49
	nop
	set	0x29, %l4
	ldub	[%l7 + %l4],	%o7
	nop
	set	0x37, %l2
	ldub	[%l7 + %l2],	%g6
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x81,	%o2
loop_49:
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x42, %g1
	stb	%o3,	[%l7 + %g1]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i0
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x89,	 3
	set	0x21, %l6
	stba	%l5,	[%l7 + %l6] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%i2
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f24
	set	0x40, %i1
	stda	%g2,	[%l7 + %i1] 0x80
	nop
	set	0x68, %o2
	stw	%o5,	[%l7 + %o2]
	nop
	set	0x50, %g7
	std	%f26,	[%l7 + %g7]
	fpsub32s	%f4,	%f30,	%f24
	nop
	set	0x41, %g5
	ldsb	[%l7 + %g5],	%g7
	nop
	set	0x70, %o1
	ldsw	[%l7 + %o1],	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%i5
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x80,	%f26
	and	%l1,	%i6,	%o4
	set	0x3C, %i4
	swapa	[%l7 + %i4] 0x80,	%o1
	set	0x1F, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g1
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%g4
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f8
	ld	[%l7 + 0x40],	%f24
	nop
	set	0x58, %l0
	std	%g2,	[%l7 + %l0]
	set	0x60, %i7
	sta	%f17,	[%l7 + %i7] 0x81
	nop
	set	0x4E, %g6
	sth	%o6,	[%l7 + %g6]
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x1C, %o4
	stwa	%l3,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	set	0x68, %i0
	stda	%g4,	[%l7 + %i0] 0x80
	wr 	%g0, 	0x4, 	%fprs
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc0
	set	0x08, %g3
	stwa	%o7,	[%l7 + %g3] 0x80
	set	0x34, %g4
	stwa	%l2,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x20, %o6
	stda	%g6,	[%l7 + %o6] 0x88
	st	%f7,	[%l7 + 0x78]
	nop
	set	0x58, %o0
	prefetch	[%l7 + %o0],	 1
	or	%o2,	%o3,	%i0
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%i6
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf9
	membar	#Sync
	ld	[%l7 + 0x0C],	%f2
	set	0x35, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i3
	add	%l5,	%i2,	%i7
	or	%o5,	%g7,	%i1
	and	%l4,	%i5,	%g3
	nop
	set	0x79, %i5
	ldub	[%l7 + %i5],	%i6
	or	%l1,	%o1,	%o4
	nop
	set	0x48, %o7
	std	%g0,	[%l7 + %o7]
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%g4
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x5A, %i1
	ldsh	[%l7 + %i1],	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%l0
	set	0x10, %o2
	stha	%o6,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x89,	%f3
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%i4
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f16
	nop
	set	0x70, %g2
	std	%o0,	[%l7 + %g2]
	nop
	set	0x50, %l3
	swap	[%l7 + %l3],	%g5
	ld	[%l7 + 0x30],	%f12
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe3,	%o6
	or	%l2,	%g6,	%o2
	nop
	set	0x38, %i2
	ldsw	[%l7 + %i2],	%i0
	set	0x48, %l0
	stxa	%o3,	[%l7 + %l0] 0x80
	set	0x5B, %i6
	ldstuba	[%l7 + %i6] 0x88,	%i3
	set	0x50, %i7
	stxa	%l5,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x30, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%i2
	add	%l6,	%i7,	%o5
	set	0x7F, %i3
	stba	%g7,	[%l7 + %i3] 0x88
	nop
	set	0x58, %i0
	ldsw	[%l7 + %i0],	%i1
	nop
	set	0x66, %o5
	ldsb	[%l7 + %o5],	%l4
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	fpsub32s	%f19,	%f14,	%f26
	nop
	set	0x28, %o3
	stb	%g3,	[%l7 + %o3]
	set	0x54, %o6
	stwa	%l1,	[%l7 + %o6] 0x88
	set	0x20, %o0
	ldda	[%l7 + %o0] 0xe3,	%i6
	nop
	set	0x2C, %g4
	stw	%o4,	[%l7 + %g4]
	nop
	set	0x38, %l1
	stw	%o1,	[%l7 + %l1]
	bge,a	%icc,	loop_50
	nop
	set	0x30, %l2
	stb	%g4,	[%l7 + %l2]
	wr	%g2,	%g1,	%set_softint
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%l0
loop_50:
	ld	[%l7 + 0x0C],	%f12
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f16
	nop
	set	0x3A, %l6
	ldsh	[%l7 + %l6],	%l3
	st	%fsr,	[%l7 + 0x50]
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x89,	%i4
	or	%o0,	%g5,	%o7
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f24
	wr	%o6,	%g6,	%set_softint
	or	%l2,	%o2,	%i0
	nop
	set	0x72, %o2
	sth	%i3,	[%l7 + %o2]
	nop
	set	0x48, %g7
	ldub	[%l7 + %g7],	%o3
	set	0x70, %o7
	stda	%i2,	[%l7 + %o7] 0x89
	set	0x2C, %g5
	stwa	%l6,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x28, %o1
	std	%i6,	[%l7 + %o1]
	nop
	set	0x79, %g1
	ldsb	[%l7 + %g1],	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i1
	nop
	set	0x5C, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x5A, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l4
	nop
	set	0x0E, %i2
	ldsh	[%l7 + %i2],	%g7
	and	%g3,	%i5,	%l1
	set	0x6C, %l0
	lda	[%l7 + %l0] 0x89,	%f24
	nop
	set	0x28, %i6
	stx	%i6,	[%l7 + %i6]
	nop
	set	0x1C, %i4
	swap	[%l7 + %i4],	%o4
	add	%o1,	%g2,	%g4
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x13, %o4
	ldsb	[%l7 + %o4],	%l0
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%l2
	wr	%i4,	%o0,	%set_softint
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd2
	wr	%g5,	%o7,	%softint
	set	0x0A, %o5
	stha	%g1,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x0A, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o6
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f20
	nop
	set	0x6C, %o6
	sth	%l2,	[%l7 + %o6]
	add	%g6,	%i0,	%i3
	nop
	set	0x46, %g3
	sth	%o3,	[%l7 + %g3]
	set	0x18, %g4
	lda	[%l7 + %g4] 0x88,	%f19
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%i2
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x5C, %l2
	swap	[%l7 + %l2],	%o2
	nop
	set	0x44, %l4
	sth	%i7,	[%l7 + %l4]
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x80,	 1
	wr	%l5,	%i1,	%y
	set	0x18, %l5
	stda	%l4,	[%l7 + %l5] 0x89
	nop
	set	0x62, %i1
	sth	%g7,	[%l7 + %i1]
	nop
	set	0x61, %l6
	ldsb	[%l7 + %l6],	%g3
	nop
	set	0x68, %o2
	std	%f28,	[%l7 + %o2]
	nop
	set	0x48, %o7
	std	%i4,	[%l7 + %o7]
	nop
	set	0x08, %g7
	lduh	[%l7 + %g7],	%l6
	set	0x24, %g5
	stba	%i6,	[%l7 + %g5] 0x80
	nop
	set	0x34, %g1
	sth	%l1,	[%l7 + %g1]
	set	0x6D, %g2
	ldstuba	[%l7 + %g2] 0x81,	%o1
	fpsub32	%f26,	%f18,	%f10
	set	0x60, %o1
	stxa	%g2,	[%l7 + %o1] 0x81
	nop
	set	0x57, %i2
	ldub	[%l7 + %i2],	%g4
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f4
	nop
	set	0x0E, %l3
	ldsh	[%l7 + %l3],	%o4
	set	0x18, %i4
	sta	%f28,	[%l7 + %i4] 0x89
	wr	%l3,	%l0,	%y
	nop
	set	0x58, %i6
	std	%f18,	[%l7 + %i6]
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%o0
	set	0x4E, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i4
	nop
	set	0x70, %i7
	stx	%g5,	[%l7 + %i7]
	bne,a,pt	%icc,	loop_51
	or	%o7,	%g1,	%l2
	set	0x2C, %o5
	sta	%f13,	[%l7 + %o5] 0x80
loop_51:
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%g6
	nop
	set	0x1C, %i3
	ldstub	[%l7 + %i3],	%i0
	add	%o6,	%o3,	%i2
	set	0x50, %o6
	stwa	%o2,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x08, %g3
	stx	%i7,	[%l7 + %g3]
	wr	%i3,	%o5,	%sys_tick
	nop
	set	0x56, %o3
	lduh	[%l7 + %o3],	%i1
	set	0x58, %l1
	stwa	%l5,	[%l7 + %l1] 0x81
	nop
	set	0x70, %g4
	stx	%l4,	[%l7 + %g4]
	nop
	set	0x42, %l2
	ldstub	[%l7 + %l2],	%g7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l1
	set	0x3C, %l4
	stwa	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x7C, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x30, %l5
	stda	%g2,	[%l7 + %l5] 0x89
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xe2,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%l3
	nop
	set	0x78, %l6
	ldsw	[%l7 + %l6],	%l0
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x89,	%o0
	nop
	set	0x73, %o7
	ldstub	[%l7 + %o7],	%g4
	nop
	set	0x5A, %o2
	sth	%g5,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x50, %g5
	std	%f2,	[%l7 + %g5]
	nop
	set	0x0C, %g1
	ldsb	[%l7 + %g1],	%i4
	set	0x0C, %g7
	stwa	%g1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x7B, %g2
	stba	%o7,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x40, %i2
	swap	[%l7 + %i2],	%g6
	st	%f15,	[%l7 + 0x30]
	nop
	set	0x37, %l0
	ldub	[%l7 + %l0],	%i0
	nop
	set	0x10, %o1
	std	%l2,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x10]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	set	0x3C, %l3
	swapa	[%l7 + %l3] 0x80,	%o3
	nop
	set	0x2C, %o4
	lduw	[%l7 + %o4],	%i2
	nop
	set	0x0C, %i6
	lduw	[%l7 + %i6],	%o6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%i3
	nop
	set	0x70, %g6
	lduh	[%l7 + %g6],	%i7
	nop
	set	0x30, %o5
	std	%f12,	[%l7 + %o5]
	ba,pn	%icc,	loop_52
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%o5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xe3,	%l4
loop_52:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xd0
	nop
	set	0x34, %g3
	ldsh	[%l7 + %g3],	%l4
	set	0x6E, %o3
	stha	%i1,	[%l7 + %o3] 0x80
	set	0x50, %l1
	lda	[%l7 + %l1] 0x89,	%f31
	nop
	set	0x6C, %g4
	lduh	[%l7 + %g4],	%i5
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%g3
	nop
	set	0x10, %l2
	std	%i6,	[%l7 + %l2]
	ble,a	%icc,	loop_53
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%l1
	nop
	set	0x30, %l4
	std	%g6,	[%l7 + %l4]
	and	%g2,	%o1,	%i6
loop_53:
	fpsub32	%f24,	%f16,	%f6
	ld	[%l7 + 0x78],	%f12
	set	0x22, %l5
	stha	%o4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	nop
	setx	0x6315253E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xE9F4651C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f0,	%f14
	set	0x1C, %l6
	stha	%l3,	[%l7 + %l6] 0xe3
	membar	#Sync
	fpadd32	%f16,	%f30,	%f20
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g4
	fpsub16s	%f31,	%f9,	%f13
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%g4
	nop
	set	0x48, %o7
	lduw	[%l7 + %o7],	%i4
	nop
	set	0x3C, %i1
	ldstub	[%l7 + %i1],	%g1
	add	%o7,	%o0,	%g6
	set	0x28, %o2
	lda	[%l7 + %o2] 0x80,	%f0
	ld	[%l7 + 0x58],	%f10
	nop
	set	0x48, %g1
	ldsh	[%l7 + %g1],	%l2
	nop
	set	0x50, %g7
	std	%f0,	[%l7 + %g7]
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%o2
	set	0x18, %g5
	prefetcha	[%l7 + %g5] 0x81,	 1
	nop
	nop
	setx	0xADE64953,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xA988050F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f16,	%f13
	nop
	set	0x55, %l0
	ldsb	[%l7 + %l0],	%o6
	nop
	set	0x64, %o1
	swap	[%l7 + %o1],	%i0
	nop
	set	0x08, %i4
	lduw	[%l7 + %i4],	%i3
	nop
	set	0x5A, %l3
	stb	%i7,	[%l7 + %l3]
	st	%f16,	[%l7 + 0x30]
	ble,a	%xcc,	loop_54
	nop
	set	0x30, %o4
	prefetch	[%l7 + %o4],	 4
	set	0x38, %i6
	swapa	[%l7 + %i6] 0x88,	%o2
loop_54:
	and	%o5,	%l4,	%l5
	add	%i5,	%i1,	%l6
	add	%g3,	%g7,	%g2
	nop
	set	0x6C, %i2
	lduh	[%l7 + %i2],	%o1
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x70, %o5
	ldsw	[%l7 + %o5],	%l1
	set	0x44, %i0
	lda	[%l7 + %i0] 0x89,	%f10
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%o4
	set	0x6A, %i3
	stha	%i6,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%l0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x58, %i7
	stx	%g4,	[%l7 + %i7]
	and	%g5,	%l3,	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%g1
	set	0x48, %o3
	ldxa	[%l7 + %o3] 0x80,	%g6
	nop
	set	0x6D, %l1
	stb	%o0,	[%l7 + %l1]
	nop
	set	0x69, %o6
	ldsb	[%l7 + %o6],	%l2
	set	0x68, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o3
	nop
	set	0x28, %i5
	std	%f28,	[%l7 + %i5]
	set	0x58, %g4
	stda	%i2,	[%l7 + %g4] 0x89
	nop
	set	0x10, %l5
	lduw	[%l7 + %l5],	%i0
	fpsub32s	%f5,	%f3,	%f12
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o2
	set	0x79, %l6
	stba	%i7,	[%l7 + %l6] 0x88
	nop
	set	0x50, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x81,	%o4
	set	0x34, %i1
	stwa	%l4,	[%l7 + %i1] 0x80
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f10
	fpadd16s	%f20,	%f0,	%f4
	nop
	set	0x38, %g1
	lduw	[%l7 + %g1],	%l5
	set	0x7C, %g7
	lda	[%l7 + %g7] 0x88,	%f27
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%i5
	nop
	set	0x7A, %g5
	stb	%g3,	[%l7 + %g5]
	set	0x20, %l0
	stda	%i6,	[%l7 + %l0] 0x81
	or	%g2,	%o1,	%l1
	nop
	set	0x18, %o1
	stw	%g7,	[%l7 + %o1]
	nop
	set	0x1C, %g2
	sth	%i6,	[%l7 + %g2]
	set	0x34, %i4
	lda	[%l7 + %i4] 0x88,	%f21
	st	%fsr,	[%l7 + 0x7C]
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x89,	 1
	set	0x60, %i6
	stda	%o4,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x54, %i2
	swapa	[%l7 + %i2] 0x88,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%i4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	st	%f5,	[%l7 + 0x44]
	nop
	set	0x1E, %i0
	lduh	[%l7 + %i0],	%g5
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x38, %g6
	ldsh	[%l7 + %g6],	%g1
	nop
	set	0x76, %i3
	ldub	[%l7 + %i3],	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%l2
	nop
	set	0x40, %o4
	std	%g6,	[%l7 + %o4]
	set	0x40, %g3
	lda	[%l7 + %g3] 0x80,	%f7
	nop
	set	0x58, %o3
	sth	%o3,	[%l7 + %o3]
	nop
	set	0x68, %l1
	stb	%i2,	[%l7 + %l1]
	bne	%icc,	loop_55
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%i3
loop_55:
	nop
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd2
	nop
	set	0x50, %l2
	ldx	[%l7 + %l2],	%o2
	nop
	set	0x53, %o6
	ldsb	[%l7 + %o6],	%i7
	set	0x30, %i5
	stxa	%o6,	[%l7 + %i5] 0x88
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%l5
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%o5
	or	%i1,	%g3,	%l6
	set	0x38, %l4
	stha	%i5,	[%l7 + %l4] 0x88
	nop
	set	0x2C, %g4
	lduh	[%l7 + %g4],	%o1
	set	0x17, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l1
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x81,	%g2
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%i6
	nop
	set	0x31, %i1
	ldstub	[%l7 + %i1],	%g7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f0
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	set	0x1F, %g7
	stba	%l0,	[%l7 + %g7] 0x80
	nop
	set	0x32, %l0
	ldsb	[%l7 + %l0],	%l3
	and	%g4,	%g5,	%g1
	set	0x58, %o1
	stxa	%o7,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l2
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%g6
	nop
	set	0x2C, %g2
	prefetch	[%l7 + %g2],	 3
	set	0x60, %l3
	stda	%o2,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x58, %i4
	lduw	[%l7 + %i4],	%i2
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd0
	set	0x24, %i6
	lda	[%l7 + %i6] 0x88,	%f1
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%o0
	nop
	set	0x64, %i0
	prefetch	[%l7 + %i0],	 4
	set	0x1B, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i3
	set	0x78, %i3
	stda	%o2,	[%l7 + %i3] 0x80
	nop
	set	0x18, %o4
	prefetch	[%l7 + %o4],	 4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%o6
	nop
	set	0x68, %o3
	swap	[%l7 + %o3],	%l4
	ld	[%l7 + 0x48],	%f17
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%o5
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x80,	%i1
	nop
	set	0x58, %l1
	stx	%g3,	[%l7 + %l1]
	nop
	set	0x64, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x10, %l2
	stda	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x10, %i5
	stda	%i4,	[%l7 + %i5] 0x89
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xeb,	%i6
	nop
	set	0x3A, %l4
	ldsh	[%l7 + %l4],	%l1
	set	0x62, %g4
	stba	%g2,	[%l7 + %g4] 0x80
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%i6
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x50, %o0
	stx	%fsr,	[%l7 + %o0]
	ld	[%l7 + 0x54],	%f30
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc0
	set	0x20, %i1
	stha	%o1,	[%l7 + %i1] 0x89
	nop
	set	0x68, %g1
	stx	%g7,	[%l7 + %g1]
	nop
	set	0x4D, %g7
	stb	%o4,	[%l7 + %g7]
	nop
	set	0x38, %o2
	std	%l2,	[%l7 + %o2]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xda
	nop
	set	0x6A, %g5
	ldstub	[%l7 + %g5],	%l0
	bg,a,pt	%xcc,	loop_56
	nop
	set	0x4C, %o1
	swap	[%l7 + %o1],	%g5
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x88,	%g1
loop_56:
	nop
	set	0x54, %g2
	sta	%f0,	[%l7 + %g2] 0x80
	and	%o7,	%g4,	%l2
	set	0x0F, %i4
	stba	%g6,	[%l7 + %i4] 0x88
	nop
	set	0x34, %i2
	prefetch	[%l7 + %i2],	 2
	add	%o3,	%i2,	%i4
	set	0x78, %o5
	stxa	%i3,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x48, %i0
	stxa	%o0,	[%l7 + %i0] 0x88
	nop
	set	0x0D, %i6
	stb	%o2,	[%l7 + %i6]
	nop
	set	0x38, %g6
	ldsw	[%l7 + %g6],	%o6
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x89,	%i0
	nop
	set	0x14, %o3
	ldsh	[%l7 + %o3],	%l5
	nop
	set	0x08, %g3
	std	%l4,	[%l7 + %g3]
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%i1
	set	0x6C, %i7
	lda	[%l7 + %i7] 0x88,	%f27
	nop
	set	0x38, %l2
	swap	[%l7 + %l2],	%o5
	set	0x57, %i5
	ldstuba	[%l7 + %i5] 0x80,	%g3
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x88,	 4
	nop
	set	0x28, %l4
	sth	%i5,	[%l7 + %l4]
	nop
	set	0x3E, %i3
	ldstub	[%l7 + %i3],	%l1
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x88,	%l6
	st	%f4,	[%l7 + 0x30]
	nop
	set	0x6C, %g4
	prefetch	[%l7 + %g4],	 2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%i6
	st	%f18,	[%l7 + 0x70]
	nop
	set	0x32, %l6
	stb	%o1,	[%l7 + %l6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%o4
	or	%l0,	%g5,	%g1
	nop
	nop
	setx	0xA579DC3F311F82C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7F7D3D1AC75DFED9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f26,	%f26
	set	0x60, %o0
	lda	[%l7 + %o0] 0x81,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%g6
	nop
	set	0x38, %l5
	stx	%l2,	[%l7 + %l5]
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xeb,	%o2
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x80,	%i2
	wr	%i4,	%i3,	%softint
	set	0x48, %g7
	stda	%o0,	[%l7 + %g7] 0x81
	set	0x14, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o6
	nop
	set	0x1D, %o1
	ldstub	[%l7 + %o1],	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%l4
	nop
	set	0x7C, %g5
	lduw	[%l7 + %g5],	%i1
	set	0x58, %g2
	lda	[%l7 + %g2] 0x88,	%f21
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x80,	%l4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd8,	%f16
	nop
	set	0x5E, %i2
	ldstub	[%l7 + %i2],	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%o5
	nop
	set	0x16, %o5
	sth	%i5,	[%l7 + %o5]
	nop
	set	0x30, %i6
	std	%f4,	[%l7 + %i6]
	and	%l1,	%l6,	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%g7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f0
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xe3,	%o0
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x58, %g3
	std	%l0,	[%l7 + %g3]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	set	0x18, %i7
	sta	%f17,	[%l7 + %i7] 0x88
	nop
	set	0x5E, %l1
	ldsh	[%l7 + %l1],	%g5
	or	%g1,	%l3,	%g4
	add	%o7,	%o4,	%l2
	nop
	set	0x43, %i5
	ldub	[%l7 + %i5],	%g6
	nop
	set	0x58, %l2
	std	%i2,	[%l7 + %l2]
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%i4
	nop
	set	0x18, %i3
	ldsh	[%l7 + %i3],	%o3
	nop
	set	0x40, %o7
	lduw	[%l7 + %o7],	%i3
	nop
	set	0x44, %g4
	stw	%o0,	[%l7 + %g4]
	set	0x60, %l4
	stxa	%o6,	[%l7 + %l4] 0x88
	nop
	set	0x20, %l6
	stx	%o2,	[%l7 + %l6]
	nop
	set	0x32, %o0
	sth	%i0,	[%l7 + %o0]
	nop
	set	0x38, %g1
	swap	[%l7 + %g1],	%i1
	and	%l4,	%l5,	%i7
	set	0x2F, %l5
	stba	%o5,	[%l7 + %l5] 0x80
	ld	[%l7 + 0x64],	%f27
	set	0x24, %o2
	stha	%i5,	[%l7 + %o2] 0xeb
	membar	#Sync
	fpadd16	%f28,	%f30,	%f28
	nop
	set	0x63, %g7
	ldsb	[%l7 + %g7],	%l1
	set	0x20, %l0
	stwa	%g3,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x72, %o1
	lduh	[%l7 + %o1],	%l6
	st	%f25,	[%l7 + 0x48]
	nop
	set	0x40, %i1
	std	%i6,	[%l7 + %i1]
	fpsub16	%f8,	%f18,	%f28
	ld	[%l7 + 0x3C],	%f2
	nop
	set	0x38, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x7A, %i4
	ldub	[%l7 + %i4],	%g2
	wr	%o1,	%l0,	%clear_softint
	set	0x33, %l3
	ldstuba	[%l7 + %l3] 0x81,	%g5
	set	0x26, %i2
	stba	%g1,	[%l7 + %i2] 0xea
	membar	#Sync
	fpsub32s	%f21,	%f22,	%f22
	ld	[%l7 + 0x3C],	%f19
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x88,	%l2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xe2,	%g4
	and	%o4,	%l2,	%o7
	or	%i2,	%g6,	%o3
	set	0x58, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	set	0x38, %g2
	stda	%o0,	[%l7 + %g2] 0x88
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	nop
	set	0x4E, %g3
	sth	%o2,	[%l7 + %g3]
	ld	[%l7 + 0x1C],	%f14
	fpsub16	%f28,	%f10,	%f10
	nop
	set	0x41, %g6
	stb	%i0,	[%l7 + %g6]
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	nop
	set	0x0C, %l1
	ldsw	[%l7 + %l1],	%o6
	st	%f13,	[%l7 + 0x10]
	nop
	set	0x58, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x78, %o6
	swap	[%l7 + %o6],	%l5
	nop
	set	0x40, %i3
	std	%l4,	[%l7 + %i3]
	nop
	set	0x17, %i5
	stb	%o5,	[%l7 + %i5]
	set	0x50, %g4
	stda	%i4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x40, %o7
	swap	[%l7 + %o7],	%l1
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%i6
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g3
	nop
	set	0x68, %g1
	std	%f10,	[%l7 + %g1]
	nop
	set	0x0C, %l5
	stb	%i6,	[%l7 + %l5]
	nop
	set	0x10, %l6
	swap	[%l7 + %l6],	%g2
	nop
	set	0x08, %o2
	prefetch	[%l7 + %o2],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g7
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x80,	%g5
	set	0x20, %g7
	sta	%f22,	[%l7 + %g7] 0x81
	nop
	set	0x70, %i1
	ldx	[%l7 + %i1],	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%l0
	set	0x34, %o1
	swapa	[%l7 + %o1] 0x80,	%g4
	set	0x1C, %g5
	stwa	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x6D, %i4
	ldstub	[%l7 + %i4],	%o4
	set	0x68, %l3
	sta	%f30,	[%l7 + %l3] 0x89
	set	0x7A, %i2
	stba	%o7,	[%l7 + %i2] 0x89
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x80,	 3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc8
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf9
	membar	#Sync
	set	0x18, %g2
	sta	%f2,	[%l7 + %g2] 0x80
	nop
	set	0x34, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x62, %g3
	ldub	[%l7 + %g3],	%o3
	set	0x27, %g6
	stba	%i2,	[%l7 + %g6] 0x80
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%i3
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%i4
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%o0
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f12
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x89,	 3
	nop
	set	0x5A, %i5
	ldstub	[%l7 + %i5],	%o2
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x81,	 4
	nop
	set	0x38, %o7
	lduh	[%l7 + %o7],	%o6
	add	%l5,	%l4,	%i5
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f20
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x88,	%l1
	set	0x5C, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i7
	nop
	set	0x76, %o0
	ldsh	[%l7 + %o0],	%l6
	or	%g3,	%i6,	%o5
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%g7
	nop
	set	0x21, %l6
	stb	%g2,	[%l7 + %l6]
	st	%f8,	[%l7 + 0x64]
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%g1
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x80,	%l0
	nop
	set	0x60, %i1
	lduw	[%l7 + %i1],	%g4
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%l2
	nop
	set	0x1F, %o1
	ldub	[%l7 + %o1],	%l3
	nop
	set	0x3D, %i4
	ldub	[%l7 + %i4],	%o4
	set	0x7A, %g5
	stha	%g6,	[%l7 + %g5] 0x81
	nop
	nop
	setx	0xF70CAE8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x63F24690,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f17,	%f13
	nop
	set	0x10, %l3
	stw	%o3,	[%l7 + %l3]
	set	0x08, %i6
	lda	[%l7 + %i6] 0x88,	%f24
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x80,	 4
	st	%f13,	[%l7 + 0x70]
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xeb,	%o6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x89
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd8
	nop
	set	0x58, %g6
	ldstub	[%l7 + %g6],	%i3
	nop
	set	0x68, %i7
	stw	%i0,	[%l7 + %i7]
	nop
	set	0x38, %g2
	stx	%o2,	[%l7 + %g2]
	set	0x14, %o4
	stwa	%i1,	[%l7 + %o4] 0x80
	nop
	set	0x74, %l2
	ldsw	[%l7 + %l2],	%o0
	set	0x40, %i3
	stda	%o6,	[%l7 + %i3] 0x88
	set	0x28, %i5
	sta	%f18,	[%l7 + %i5] 0x80
	st	%f9,	[%l7 + 0x54]
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%l4
	add	%l4,	%i5,	%i7
	nop
	set	0x58, %o7
	sth	%l6,	[%l7 + %o7]
	set	0x68, %l4
	stda	%l0,	[%l7 + %l4] 0x80
	set	0x38, %g4
	stxa	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x78, %g1
	std	%g2,	[%l7 + %g1]
	nop
	set	0x6C, %l1
	stw	%o1,	[%l7 + %l1]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc2
	nop
	set	0x40, %o2
	std	%f26,	[%l7 + %o2]
	nop
	set	0x20, %l5
	stx	%g7,	[%l7 + %l5]
	nop
	set	0x2C, %l0
	lduw	[%l7 + %l0],	%g2
	ld	[%l7 + 0x38],	%f10
	ld	[%l7 + 0x68],	%f22
	st	%f9,	[%l7 + 0x40]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x74, %i1
	swap	[%l7 + %i1],	%g5
	set	0x20, %g7
	stxa	%g4,	[%l7 + %g7] 0x88
	nop
	set	0x34, %o1
	sth	%l2,	[%l7 + %o1]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f0
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x80,	 0
	nop
	set	0x50, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x64, %i6
	lda	[%l7 + %i6] 0x80,	%f20
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x88,	%f26
	nop
	set	0x78, %i0
	std	%f24,	[%l7 + %i0]
	nop
	set	0x4C, %o5
	swap	[%l7 + %o5],	%o4
	nop
	set	0x2A, %i2
	stb	%g6,	[%l7 + %i2]
	fpsub32	%f22,	%f20,	%f0
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x80,	%l3
	set	0x78, %g6
	stxa	%i2,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x7C, %i7
	ldsh	[%l7 + %i7],	%o3
	set	0x20, %g2
	stxa	%o7,	[%l7 + %g2] 0x89
	nop
	set	0x7E, %g3
	sth	%i4,	[%l7 + %g3]
	nop
	set	0x68, %o4
	stx	%i3,	[%l7 + %o4]
	set	0x78, %i3
	stwa	%o2,	[%l7 + %i3] 0x88
	set	0x54, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i1
	set	0x6C, %l2
	lda	[%l7 + %l2] 0x89,	%f3
	set	0x43, %o6
	stba	%i0,	[%l7 + %o6] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f16
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	nop
	set	0x78, %o7
	stw	%o6,	[%l7 + %o7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%l5
	wr	%i5,	%i7,	%ccr
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%l6
	nop
	set	0x50, %l1
	stx	%l1,	[%l7 + %l1]
	set	0x33, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc2
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%o1
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f22
	nop
	set	0x68, %i1
	ldsb	[%l7 + %i1],	%g3
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%g2
	add	%g7,	%g1,	%g5
	nop
	set	0x38, %o1
	ldsh	[%l7 + %o1],	%g4
	nop
	set	0x7F, %i4
	ldsb	[%l7 + %i4],	%o5
	nop
	set	0x0D, %g7
	ldub	[%l7 + %g7],	%l2
	and	%o4,	%g6,	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%l0
	set	0x3D, %o0
	stba	%o3,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x11, %g5
	ldub	[%l7 + %g5],	%i4
	and	%i3,	%o2,	%i1
	set	0x7B, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o7
	set	0x54, %l3
	stha	%i0,	[%l7 + %l3] 0x88
	set	0x40, %i0
	sta	%f31,	[%l7 + %i0] 0x88
	set	0x50, %o5
	stda	%o0,	[%l7 + %o5] 0x88
	and	%l5,	%i5,	%i7
	nop
	set	0x40, %i2
	stw	%l4,	[%l7 + %i2]
	set	0x0C, %o3
	lda	[%l7 + %o3] 0x80,	%f31
	nop
	set	0x38, %g6
	ldsw	[%l7 + %g6],	%l6
	nop
	set	0x74, %i7
	ldsb	[%l7 + %i7],	%l1
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x81,	%o6
	nop
	set	0x56, %o4
	sth	%i6,	[%l7 + %o4]
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x80,	%o1
	add	%g2,	%g7,	%g1
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%g5
	nop
	set	0x6C, %i5
	stw	%g4,	[%l7 + %i5]
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x80,	%g3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f16
	and	%o5,	%l2,	%o4
	fpadd16	%f6,	%f14,	%f20
	nop
	nop
	setx	0x12DB70F5C42530D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x81A90722298EA964,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f12
	nop
	set	0x0C, %l4
	lduh	[%l7 + %l4],	%g6
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%l2
	and	%l0,	%i2,	%o3
	set	0x58, %l1
	stda	%i4,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x70, %g1
	std	%f28,	[%l7 + %g1]
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%i2
	nop
	set	0x36, %o2
	ldstub	[%l7 + %o2],	%o2
	set	0x2C, %l0
	stwa	%i1,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x1C, %o7
	lda	[%l7 + %o7] 0x81,	%f1
	nop
	set	0x1A, %i1
	ldsb	[%l7 + %i1],	%i0
	set	0x78, %o1
	lda	[%l7 + %o1] 0x80,	%f10
	set	0x50, %i4
	ldda	[%l7 + %i4] 0xea,	%o0
	set	0x50, %g7
	ldstuba	[%l7 + %g7] 0x89,	%o7
	nop
	set	0x24, %l5
	swap	[%l7 + %l5],	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%l4
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x89,	%l6
	nop
	set	0x60, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x70, %l3
	swap	[%l7 + %l3],	%l1
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x88,	%o6
	nop
	set	0x3C, %o5
	stw	%i6,	[%l7 + %o5]
	nop
	set	0x68, %i0
	stx	%o1,	[%l7 + %i0]
	nop
	set	0x16, %i2
	stb	%g2,	[%l7 + %i2]
	nop
	set	0x5C, %o3
	lduw	[%l7 + %o3],	%g7
	set	0x31, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g1
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf9
	membar	#Sync
	set	0x78, %o4
	sta	%f25,	[%l7 + %o4] 0x80
	set	0x44, %g2
	stha	%g5,	[%l7 + %g2] 0xe3
	membar	#Sync
	st	%f12,	[%l7 + 0x68]
	set	0x70, %i3
	stxa	%i7,	[%l7 + %i3] 0x80
	nop
	set	0x66, %i7
	ldub	[%l7 + %i7],	%g3
	and	%g4,	%l2,	%o4
	fpadd16	%f30,	%f22,	%f18
	set	0x46, %i5
	stba	%g6,	[%l7 + %i5] 0x89
	set	0x50, %l2
	stxa	%o5,	[%l7 + %l2] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l3
	nop
	set	0x68, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%o2
	set	0x69, %l4
	stba	%i2,	[%l7 + %l4] 0x88
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
	or	%o2,	%i3,	%i0
	bleu	%icc,	loop_57
	nop
	set	0x1C, %g1
	sth	%i1,	[%l7 + %g1]
	ld	[%l7 + 0x78],	%f24
	add	%o7,	%o0,	%i5
loop_57:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%l6
	set	0x32, %l6
	stha	%l1,	[%l7 + %l6] 0x88
	set	0x30, %l0
	ldxa	[%l7 + %l0] 0x80,	%o6
	nop
	set	0x6C, %o7
	lduh	[%l7 + %o7],	%i6
	set	0x10, %o2
	ldda	[%l7 + %o2] 0xeb,	%l4
	nop
	set	0x54, %o1
	stw	%g2,	[%l7 + %o1]
	ld	[%l7 + 0x10],	%f3
	nop
	set	0x4C, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x61, %g7
	ldub	[%l7 + %g7],	%g7
	st	%f22,	[%l7 + 0x50]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf9
	membar	#Sync
	nop
	set	0x74, %l5
	swap	[%l7 + %l5],	%o1
	nop
	set	0x70, %g5
	stw	%g1,	[%l7 + %g5]
	or	%g5,	%i7,	%g4
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xeb,	%l2
	set	0x58, %l3
	swapa	[%l7 + %l3] 0x81,	%o4
	ld	[%l7 + 0x60],	%f14
	set	0x42, %o5
	stha	%g3,	[%l7 + %o5] 0x88
	set	0x54, %i0
	sta	%f14,	[%l7 + %i0] 0x81
	nop
	set	0x3C, %i2
	sth	%o5,	[%l7 + %i2]
	set	0x18, %o3
	sta	%f2,	[%l7 + %o3] 0x80
	nop
	set	0x1E, %i6
	ldsb	[%l7 + %i6],	%l0
	set	0x50, %g6
	lda	[%l7 + %g6] 0x80,	%f31
	nop
	set	0x70, %g3
	stx	%g6,	[%l7 + %g3]
	nop
	set	0x7C, %g2
	sth	%l3,	[%l7 + %g2]
	nop
	set	0x34, %o4
	ldstub	[%l7 + %o4],	%o3
	or	%i4,	%i2,	%i3
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%o2
	nop
	set	0x40, %i5
	stx	%i0,	[%l7 + %i5]
	ld	[%l7 + 0x44],	%f5
	or	%i1,	%o0,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%l4
	st	%fsr,	[%l7 + 0x08]
	and	%l6,	%l1,	%i6
	nop
	set	0x2A, %o6
	ldsh	[%l7 + %o6],	%o6
	st	%f5,	[%l7 + 0x78]
	nop
	set	0x21, %l2
	ldub	[%l7 + %l2],	%g2
	nop
	set	0x0F, %l4
	ldstub	[%l7 + %l4],	%l5
	nop
	set	0x18, %g4
	std	%g6,	[%l7 + %g4]
	add	%o1,	%g5,	%i7
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x88,	%g4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%g1
	set	0x6C, %l6
	stha	%g3,	[%l7 + %l6] 0x88
	nop
	set	0x2A, %l0
	ldsb	[%l7 + %l0],	%o4
	ld	[%l7 + 0x0C],	%f30
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 0
	ld	[%l7 + 0x50],	%f11
	fpsub16s	%f21,	%f21,	%f16
	wr	%l0,	%g6,	%clear_softint
	set	0x5F, %o2
	stba	%l3,	[%l7 + %o2] 0x89
	add	%o5,	%o3,	%i4
	nop
	set	0x4C, %o1
	ldsb	[%l7 + %o1],	%i2
	nop
	set	0x4D, %i4
	ldsb	[%l7 + %i4],	%i3
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%o0
	nop
	set	0x7C, %i1
	swap	[%l7 + %i1],	%i0
	nop
	set	0x32, %l5
	sth	%i5,	[%l7 + %l5]
	set	0x58, %g7
	stwa	%o7,	[%l7 + %g7] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	add	%l6,	%l4,	%l1
	nop
	set	0x74, %o0
	stw	%o6,	[%l7 + %o0]
	nop
	set	0x60, %g5
	ldsb	[%l7 + %g5],	%g2
	nop
	set	0x66, %o5
	ldsb	[%l7 + %o5],	%i6
	nop
	set	0x10, %l3
	std	%l4,	[%l7 + %l3]
	wr	%g7,	%g5,	%clear_softint
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x80,	%i7
	set	0x38, %i0
	stda	%o0,	[%l7 + %i0] 0x88
	set	0x10, %i6
	ldda	[%l7 + %i6] 0xea,	%l2
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
	ld	[%l7 + 0x10],	%f16
	nop
	set	0x20, %g6
	stx	%g4,	[%l7 + %g6]
	nop
	set	0x78, %g3
	std	%f30,	[%l7 + %g3]
	wr	%o4,	%g3,	%set_softint
	set	0x40, %o4
	stxa	%l0,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x40, %i3
	lduw	[%l7 + %i3],	%l3
	add	%o5,	%g6,	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i3
	nop
	set	0x79, %i7
	stb	%o2,	[%l7 + %i7]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%i1
	st	%f14,	[%l7 + 0x58]
	nop
	set	0x3C, %g2
	stw	%i0,	[%l7 + %g2]
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%i5
	nop
	set	0x18, %l2
	stx	%o0,	[%l7 + %l2]
	nop
	set	0x30, %l4
	std	%f16,	[%l7 + %l4]
	nop
	set	0x78, %g4
	stx	%l6,	[%l7 + %g4]
	nop
	set	0x5C, %g1
	swap	[%l7 + %g1],	%l4
	st	%f28,	[%l7 + 0x48]
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%o7
	nop
	set	0x48, %l6
	stb	%l1,	[%l7 + %l6]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd0
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%o6
	nop
	set	0x0C, %o1
	prefetch	[%l7 + %o1],	 1
	st	%f4,	[%l7 + 0x30]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%g2
	set	0x4C, %i4
	stwa	%l5,	[%l7 + %i4] 0x89
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	and	%g7,	%g5,	%o1
	st	%f2,	[%l7 + 0x38]
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc8
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	wr	%l2,	%g1,	%ccr
	nop
	set	0x60, %l5
	std	%i6,	[%l7 + %l5]
	set	0x10, %g5
	stda	%g4,	[%l7 + %g5] 0x80
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g2
	nop
	set	0x74, %o5
	ldstub	[%l7 + %o5],	%l0
	nop
	set	0x2E, %l3
	lduh	[%l7 + %l3],	%l3
	nop
	set	0x7C, %i2
	lduw	[%l7 + %i2],	%o5
	nop
	nop
	setx	0xA7730943,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x893A9604,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f27,	%f20
	ld	[%l7 + 0x60],	%f21
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	nop
	set	0x4A, %o3
	lduh	[%l7 + %o3],	%o4
	nop
	set	0x64, %i6
	lduh	[%l7 + %i6],	%g6
	nop
	set	0x60, %g3
	std	%f24,	[%l7 + %g3]
	bn,a,pt	%icc,	loop_58
	nop
	set	0x22, %o4
	stb	%o3,	[%l7 + %o4]
	nop
	set	0x50, %i3
	stx	%i4,	[%l7 + %i3]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xca
loop_58:
	nop
	set	0x6C, %g2
	lduw	[%l7 + %g2],	%o2
	nop
	set	0x50, %o6
	std	%i2,	[%l7 + %o6]
	ld	[%l7 + 0x34],	%f19
	set	0x3F, %l2
	stba	%i1,	[%l7 + %l2] 0xe2
	membar	#Sync
	and	%i2,	%i0,	%i5
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%i6
	nop
	set	0x20, %g4
	lduh	[%l7 + %g4],	%l4
	nop
	set	0x48, %g6
	ldstub	[%l7 + %g6],	%o7
	nop
	set	0x44, %g1
	swap	[%l7 + %g1],	%o0
	nop
	set	0x10, %i5
	stx	%l1,	[%l7 + %i5]
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	nop
	set	0x50, %l6
	sth	%g2,	[%l7 + %l6]
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%i6
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%g7
	or	%l5,	%g5,	%o1
	nop
	set	0x54, %o2
	lduw	[%l7 + %o2],	%g1
	nop
	set	0x6F, %l0
	ldsb	[%l7 + %l0],	%l2
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%i7
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%g3
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%g4
	set	0x54, %l5
	lda	[%l7 + %l5] 0x88,	%f21
	set	0x16, %o0
	stba	%l0,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x29, %g5
	ldub	[%l7 + %g5],	%o5
	set	0x70, %l3
	stxa	%l3,	[%l7 + %l3] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%o4
	ld	[%l7 + 0x48],	%f10
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x89
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%o3
	set	0x7B, %o3
	stba	%i4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x68, %i6
	std	%f20,	[%l7 + %i6]
	nop
	set	0x4A, %g3
	sth	%o2,	[%l7 + %g3]
	nop
	set	0x36, %i0
	ldub	[%l7 + %i0],	%i1
	set	0x78, %i3
	sta	%f19,	[%l7 + %i3] 0x80
	nop
	set	0x3E, %o4
	sth	%i2,	[%l7 + %o4]
	nop
	set	0x5E, %g2
	ldsh	[%l7 + %g2],	%i0
	nop
	set	0x78, %o6
	std	%f28,	[%l7 + %o6]
	set	0x44, %l2
	lda	[%l7 + %l2] 0x81,	%f3
	ld	[%l7 + 0x34],	%f0
	nop
	nop
	setx	0x6A321008D5A805AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x616F237924A97ADE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f20,	%f24
	nop
	set	0x3C, %l4
	swap	[%l7 + %l4],	%i3
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%l6
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x48, %g6
	stx	%i5,	[%l7 + %g6]
	and	%o7,	%o0,	%l4
	st	%fsr,	[%l7 + 0x50]
	set	0x18, %i7
	stwa	%l1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x18, %i5
	ldsh	[%l7 + %i5],	%g2
	nop
	set	0x12, %g1
	ldub	[%l7 + %g1],	%i6
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%g7
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%l5
	nop
	set	0x70, %i4
	swap	[%l7 + %i4],	%g5
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x88
	set	0x38, %l0
	stda	%o0,	[%l7 + %l0] 0x88
	nop
	set	0x70, %o7
	stx	%g1,	[%l7 + %o7]
	set	0x74, %g7
	sta	%f25,	[%l7 + %g7] 0x80
	nop
	set	0x32, %l6
	stb	%l2,	[%l7 + %l6]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x81
	set	0x38, %o0
	stxa	%i7,	[%l7 + %o0] 0xe3
	membar	#Sync
	or	%o6,	%g4,	%g3
	set	0x7E, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o5
	set	0x40, %l3
	stba	%l0,	[%l7 + %l3] 0x80
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%f16
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	nop
	set	0x0C, %i1
	stw	%g6,	[%l7 + %i1]
	nop
	set	0x70, %i6
	std	%f12,	[%l7 + %i6]
	nop
	set	0x4E, %o3
	lduh	[%l7 + %o3],	%o4
	set	0x0A, %g3
	stba	%o3,	[%l7 + %g3] 0x88
	nop
	set	0x75, %i0
	ldstub	[%l7 + %i0],	%o2
	set	0x18, %i3
	swapa	[%l7 + %i3] 0x81,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i2
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f14
	nop
	set	0x74, %g2
	sth	%i0,	[%l7 + %g2]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%l6
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xeb,	%i4
	nop
	set	0x70, %g4
	ldsw	[%l7 + %g4],	%o0
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x88,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x89,	 4
	ld	[%l7 + 0x34],	%f0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xeb,	%g6
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%l4
	fpadd32	%f18,	%f10,	%f14
	nop
	set	0x40, %l1
	stx	%g2,	[%l7 + %l1]
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x88,	%g4
	set	0x28, %g1
	swapa	[%l7 + %g1] 0x80,	%o1
	ld	[%l7 + 0x34],	%f28
	ld	[%l7 + 0x64],	%f6
	st	%fsr,	[%l7 + 0x38]
	ld	[%l7 + 0x7C],	%f16
	set	0x17, %i4
	stba	%g1,	[%l7 + %i4] 0x89
	and	%i7,	%l2,	%g4
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x81,	%o6
	add	%o5,	%l0,	%l3
	nop
	set	0x60, %l0
	stw	%g6,	[%l7 + %l0]
	set	0x18, %o7
	swapa	[%l7 + %o7] 0x89,	%g3
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%o4
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x81,	%o3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	nop
	set	0x50, %g5
	stx	%i1,	[%l7 + %g5]
	set	0x60, %g7
	lda	[%l7 + %g7] 0x89,	%f7
	fpsub32s	%f10,	%f4,	%f22
	nop
	set	0x28, %i2
	stw	%i4,	[%l7 + %i2]
	nop
	set	0x50, %o5
	stx	%o2,	[%l7 + %o5]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd2
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xe2,	%i2
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 2
	or	%i0,	%i3,	%l6
	nop
	set	0x75, %g3
	ldstub	[%l7 + %g3],	%i5
	set	0x6B, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o0
	set	0x5C, %i3
	stba	%l1,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x08, %o3
	stxa	%l4,	[%l7 + %o3] 0xea
	membar	#Sync
	fpadd16s	%f22,	%f3,	%f10
	add	%o7,	%g7,	%l5
	set	0x5C, %o4
	lda	[%l7 + %o4] 0x88,	%f5
	nop
	set	0x08, %g2
	ldsw	[%l7 + %g2],	%i6
	nop
	set	0x18, %l2
	lduw	[%l7 + %l2],	%g5
	set	0x74, %g4
	stwa	%o1,	[%l7 + %g4] 0x81
	ld	[%l7 + 0x3C],	%f31
	nop
	set	0x20, %l4
	std	%g0,	[%l7 + %l4]
	nop
	set	0x75, %g6
	ldstub	[%l7 + %g6],	%i7
	add	%g2,	%l2,	%g4
	set	0x34, %i5
	swapa	[%l7 + %i5] 0x89,	%o6
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%o4
	set	0x5C, %o6
	stha	%l0,	[%l7 + %o6] 0x80
	set	0x70, %o1
	swapa	[%l7 + %o1] 0x80,	%l3
	nop
	set	0x28, %l1
	stw	%g6,	[%l7 + %l1]
	nop
	set	0x15, %i4
	stb	%o4,	[%l7 + %i4]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f16
	set	0x78, %l0
	lda	[%l7 + %l0] 0x88,	%f17
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x88,	%g3
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd8
	nop
	set	0x20, %o0
	std	%f18,	[%l7 + %o0]
	nop
	set	0x41, %o2
	ldub	[%l7 + %o2],	%o3
	nop
	set	0x14, %g5
	stw	%i4,	[%l7 + %g5]
	set	0x6A, %g7
	stha	%o2,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x1A, %o5
	stb	%i2,	[%l7 + %o5]
	set	0x08, %l3
	stwa	%i1,	[%l7 + %l3] 0x81
	nop
	set	0x1C, %i2
	ldsw	[%l7 + %i2],	%i0
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%i3
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xea,	%i4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xda
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x7A, %i1
	ldub	[%l7 + %i1],	%o0
	nop
	set	0x3C, %o3
	stw	%l4,	[%l7 + %o3]
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%l1
	set	0x20, %l2
	stda	%o6,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x44, %o4
	lduw	[%l7 + %o4],	%l5
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x81,	 2
	nop
	set	0x1C, %g6
	ldsb	[%l7 + %g6],	%g7
	nop
	set	0x1C, %i5
	stw	%o1,	[%l7 + %i5]
	st	%f6,	[%l7 + 0x64]
	nop
	set	0x50, %g4
	stx	%g1,	[%l7 + %g4]
	nop
	set	0x24, %o6
	lduw	[%l7 + %o6],	%g5
	set	0x58, %i7
	stda	%i6,	[%l7 + %i7] 0x80
	nop
	set	0x5E, %o1
	sth	%g2,	[%l7 + %o1]
	st	%f11,	[%l7 + 0x10]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	nop
	set	0x4D, %g1
	stb	%l2,	[%l7 + %g1]
	nop
	set	0x18, %i4
	prefetch	[%l7 + %i4],	 2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%l3
	nop
	set	0x19, %l0
	ldsb	[%l7 + %l0],	%o6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd2
	nop
	set	0x66, %o7
	ldsh	[%l7 + %o7],	%o4
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f24
	nop
	set	0x48, %o2
	lduh	[%l7 + %o2],	%g3
	set	0x4C, %g5
	stba	%g6,	[%l7 + %g5] 0x88
	fpadd16s	%f20,	%f4,	%f29
	set	0x24, %l5
	lda	[%l7 + %l5] 0x89,	%f20
	nop
	set	0x28, %o5
	stx	%o3,	[%l7 + %o5]
	set	0x78, %g7
	swapa	[%l7 + %g7] 0x81,	%o2
	set	0x58, %l3
	lda	[%l7 + %l3] 0x81,	%f2
	or	%i4,	%i2,	%i1
	or	%i3,	%i0,	%i5
	set	0x28, %i6
	stxa	%l6,	[%l7 + %i6] 0x80
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l1
	nop
	set	0x38, %i2
	std	%f30,	[%l7 + %i2]
	nop
	set	0x49, %g3
	ldub	[%l7 + %g3],	%o7
	set	0x10, %i0
	stha	%o0,	[%l7 + %i0] 0x80
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc4
	nop
	set	0x63, %i1
	ldsb	[%l7 + %i1],	%i6
	or	%g7,	%l5,	%g1
	nop
	set	0x3E, %g2
	sth	%g5,	[%l7 + %g2]
	set	0x23, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o1
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x18, %l2
	sth	%i7,	[%l7 + %l2]
	set	0x44, %l4
	lda	[%l7 + %l4] 0x80,	%f0
	nop
	set	0x7E, %g6
	ldsh	[%l7 + %g6],	%g2
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%g4
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x81,	%o4
	add	%l2,	%l0,	%l3
	bn,a	%icc,	loop_59
	nop
	set	0x10, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x72, %i7
	stb	%o4,	[%l7 + %i7]
	wr	%o6,	%g6,	%set_softint
loop_59:
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%g3
	set	0x3C, %l1
	stha	%o3,	[%l7 + %l1] 0x88
	nop
	set	0x68, %g1
	std	%i4,	[%l7 + %g1]
	nop
	set	0x74, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x20, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x20, %l0
	ldsh	[%l7 + %l0],	%i2
	set	0x73, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i1
	set	0x28, %l6
	stxa	%o2,	[%l7 + %l6] 0x80
	nop
	set	0x58, %o2
	ldsh	[%l7 + %o2],	%i3
	set	0x18, %g5
	stha	%i5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x6C, %l5
	stw	%i0,	[%l7 + %l5]
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%l4
	add	%l1,	%o7,	%l6
	nop
	set	0x0E, %g7
	lduh	[%l7 + %g7],	%o0
	set	0x50, %l3
	stxa	%i6,	[%l7 + %l3] 0x81
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x81,	%l5
	and	%g1,	%g7,	%g5
	nop
	set	0x2C, %i2
	stb	%i7,	[%l7 + %i2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%g2
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x89,	%o5
	st	%fsr,	[%l7 + 0x74]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x64, %g3
	ldsw	[%l7 + %g3],	%l2
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x80,	%g4
	nop
	set	0x64, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x58, %g2
	ldxa	[%l7 + %g2] 0x89,	%l0
	nop
	set	0x28, %i0
	stx	%o4,	[%l7 + %i0]
	ble,a	%icc,	loop_60
	nop
	set	0x3E, %l2
	lduh	[%l7 + %l2],	%l3
	nop
	set	0x40, %l4
	std	%g6,	[%l7 + %l4]
	nop
	set	0x11, %g6
	stb	%o6,	[%l7 + %g6]
loop_60:
	nop
	set	0x5E, %o3
	stba	%g3,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x54, %o4
	swapa	[%l7 + %o4] 0x88,	%i4
	set	0x24, %i5
	swapa	[%l7 + %i5] 0x81,	%i2
	nop
	set	0x68, %o6
	ldsb	[%l7 + %o6],	%o3
	nop
	set	0x71, %o1
	ldstub	[%l7 + %o1],	%i1
	nop
	set	0x48, %l1
	stx	%i3,	[%l7 + %l1]
	nop
	set	0x18, %i7
	std	%f16,	[%l7 + %i7]
	nop
	set	0x28, %i4
	std	%f22,	[%l7 + %i4]
	set	0x64, %g4
	lda	[%l7 + %g4] 0x88,	%f8
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x89,	%i5
	set	0x6A, %g1
	stba	%i0,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%l4
	set	0x18, %l6
	stha	%l1,	[%l7 + %l6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x08],	%f4
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x81,	%o2
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x88,	 4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xe3,	%i6
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%i6
	set	0x61, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o0
	set	0x20, %i6
	stxa	%l5,	[%l7 + %i6] 0x80
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f16
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xcc
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%g5
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x1C, %i3
	swapa	[%l7 + %i3] 0x88,	%i7
	set	0x74, %o5
	lda	[%l7 + %o5] 0x88,	%f29
	or	%o1,	%g7,	%g2
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%o5
	nop
	set	0x20, %i0
	lduh	[%l7 + %i0],	%g4
	add	%l0,	%o4,	%l2
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x80,	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g3
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 1
	set	0x08, %g6
	stxa	%i4,	[%l7 + %g6] 0x80
	nop
	set	0x44, %l2
	stb	%i2,	[%l7 + %l2]
	and	%o6,	%i1,	%i3
	st	%fsr,	[%l7 + 0x6C]
	ba,pt	%xcc,	loop_61
	nop
	set	0x40, %o4
	std	%o2,	[%l7 + %o4]
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%i5
	nop
	set	0x30, %o6
	lduw	[%l7 + %o6],	%l4
loop_61:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%i0
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xe3,	%o2
	nop
	set	0x14, %l1
	swap	[%l7 + %l1],	%l6
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x81,	%o6
	nop
	set	0x64, %i4
	ldsh	[%l7 + %i4],	%i6
	nop
	set	0x74, %i5
	sth	%l5,	[%l7 + %i5]
	nop
	set	0x7E, %l0
	lduh	[%l7 + %l0],	%g1
	wr	%o0,	%g5,	%softint
	nop
	set	0x20, %g1
	std	%f22,	[%l7 + %g1]
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xe2,	%o0
	nop
	set	0x3E, %g4
	ldub	[%l7 + %g4],	%i7
	add	%g7,	%g2,	%g4
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%o5
	fpsub32	%f24,	%f8,	%f10
	nop
	set	0x49, %l6
	ldsb	[%l7 + %l6],	%l0
	nop
	set	0x68, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x0B, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o4
	set	0x60, %l3
	stwa	%g6,	[%l7 + %l3] 0x80
	wr	%l2,	%l3,	%pic
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%g2
	wr	%i4,	%i2,	%sys_tick
	set	0x5C, %i6
	stha	%o6,	[%l7 + %i6] 0x81
	set	0x0C, %l5
	lda	[%l7 + %l5] 0x81,	%f10
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x88,	%i2
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%i1
	set	0x64, %i3
	swapa	[%l7 + %i3] 0x81,	%i5
	set	0x18, %o5
	swapa	[%l7 + %o5] 0x89,	%l4
	nop
	set	0x60, %i0
	ldsh	[%l7 + %i0],	%o3
	set	0x58, %i1
	stxa	%l1,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x67, %l4
	ldstuba	[%l7 + %l4] 0x81,	%i0
	set	0x6E, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l6
	set	0x74, %l2
	stba	%o7,	[%l7 + %l2] 0x81
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe3,	%i6
	set	0x48, %g2
	ldxa	[%l7 + %g2] 0x88,	%l5
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	ld	[%l7 + 0x14],	%f30
	set	0x22, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o2
	or	%o0,	%g1,	%g5
	ld	[%l7 + 0x68],	%f7
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f16
	nop
	set	0x30, %i7
	swap	[%l7 + %i7],	%i7
	fpsub32	%f0,	%f4,	%f0
	and	%o1,	%g2,	%g4
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%o4
	nop
	set	0x24, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x48, %l0
	ldxa	[%l7 + %l0] 0x88,	%g7
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%l0
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x81,	%f28
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x38, %g5
	stx	%g6,	[%l7 + %g5]
	set	0x1C, %o7
	stba	%o4,	[%l7 + %o7] 0x80
	nop
	set	0x74, %o2
	stw	%l2,	[%l7 + %o2]
	set	0x54, %o0
	lda	[%l7 + %o0] 0x89,	%f25
	nop
	set	0x1E, %l3
	ldsh	[%l7 + %l3],	%g3
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f0
	nop
	set	0x5A, %g7
	sth	%l3,	[%l7 + %g7]
	ld	[%l7 + 0x14],	%f22
	and	%i2,	%o6,	%i4
	nop
	set	0x6A, %l5
	sth	%i3,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x50]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%i1
	set	0x62, %g3
	stha	%o3,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x60, %i6
	stx	%l4,	[%l7 + %i6]
	nop
	set	0x17, %i3
	stb	%l1,	[%l7 + %i3]
	st	%f28,	[%l7 + 0x38]
	nop
	set	0x40, %i2
	ldsw	[%l7 + %i2],	%l6
	nop
	set	0x20, %i0
	stw	%i0,	[%l7 + %i0]
	or	%i6,	%o7,	%o2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x81
	nop
	set	0x1A, %o5
	ldsh	[%l7 + %o5],	%l5
	set	0x2C, %l4
	stwa	%g1,	[%l7 + %l4] 0x81
	nop
	set	0x3C, %l2
	ldsw	[%l7 + %l2],	%o0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f0
	nop
	set	0x2C, %o4
	prefetch	[%l7 + %o4],	 4
	set	0x14, %g2
	sta	%f20,	[%l7 + %g2] 0x80
	st	%f18,	[%l7 + 0x0C]
	nop
	set	0x26, %o3
	lduh	[%l7 + %o3],	%g5
	nop
	set	0x53, %o1
	stb	%i7,	[%l7 + %o1]
	set	0x5C, %i7
	stba	%o1,	[%l7 + %i7] 0x80
	add	%g2,	%o5,	%g7
	nop
	set	0x78, %l1
	sth	%l0,	[%l7 + %l1]
	nop
	set	0x54, %o6
	lduh	[%l7 + %o6],	%g6
	nop
	nop
	setx	0x39B034A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD8DE0475,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f13,	%f3
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%g4
	nop
	set	0x30, %g1
	ldsh	[%l7 + %g1],	%o4
	or	%l2,	%g3,	%i2
	nop
	set	0x7A, %i5
	sth	%l3,	[%l7 + %i5]
	nop
	set	0x48, %g4
	ldub	[%l7 + %g4],	%i4
	st	%f17,	[%l7 + 0x54]
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f30
	nop
	set	0x48, %i4
	ldub	[%l7 + %i4],	%o6
	add	%i3,	%i1,	%i5
	nop
	set	0x3A, %o2
	ldsb	[%l7 + %o2],	%l4
	set	0x5F, %o0
	ldstuba	[%l7 + %o0] 0x81,	%l1
	nop
	set	0x30, %o7
	std	%o2,	[%l7 + %o7]
	nop
	set	0x50, %l3
	std	%i0,	[%l7 + %l3]
	set	0x78, %g7
	stha	%l6,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x70, %l5
	stda	%o6,	[%l7 + %l5] 0xea
	membar	#Sync
	add	%i6,	%o2,	%g1
	nop
	set	0x32, %g3
	sth	%l5,	[%l7 + %g3]
	nop
	set	0x69, %i6
	ldub	[%l7 + %i6],	%o0
	add	%i7,	%g5,	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%g7
	add	%l0,	%g6,	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l2
	set	0x78, %i3
	stwa	%g3,	[%l7 + %i3] 0x81
	set	0x14, %l6
	stwa	%i2,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x50, %i0
	ldsb	[%l7 + %i0],	%o5
	set	0x28, %i2
	stxa	%i4,	[%l7 + %i2] 0x89
	nop
	set	0x68, %i1
	std	%o6,	[%l7 + %i1]
	nop
	set	0x37, %o5
	ldsb	[%l7 + %o5],	%i3
	nop
	set	0x48, %l4
	stw	%l3,	[%l7 + %l4]
	nop
	set	0x2C, %l2
	prefetch	[%l7 + %l2],	 1
	and	%i5,	%l4,	%i1
	set	0x60, %g6
	stda	%l0,	[%l7 + %g6] 0x89
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%i0
	nop
	set	0x09, %g2
	ldub	[%l7 + %g2],	%o3
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x81,	%i6
	wr	%o7,	%i6,	%set_softint
	set	0x70, %i7
	stba	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x23, %l1
	ldsb	[%l7 + %l1],	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%o0
	fpsub16	%f18,	%f20,	%f2
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x88,	 4
	set	0x2C, %l0
	sta	%f27,	[%l7 + %l0] 0x88
	st	%fsr,	[%l7 + 0x34]
	set	0x50, %g1
	stda	%i6,	[%l7 + %g1] 0x89
	set	0x2C, %i5
	lda	[%l7 + %i5] 0x80,	%f4
	be	%xcc,	loop_62
	st	%f12,	[%l7 + 0x08]
	nop
	set	0x14, %g4
	ldstub	[%l7 + %g4],	%o1
	nop
	set	0x28, %g5
	std	%g2,	[%l7 + %g5]
loop_62:
	nop
	set	0x6C, %o6
	swap	[%l7 + %o6],	%l0
	nop
	set	0x7C, %i4
	stw	%g6,	[%l7 + %i4]
	nop
	set	0x28, %o2
	stx	%g4,	[%l7 + %o2]
	set	0x1C, %o7
	stha	%o4,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x76, %o0
	sth	%g7,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x30]
	or	%l2,	%i2,	%g3
	set	0x74, %g7
	lda	[%l7 + %g7] 0x89,	%f23
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x89,	%i4
	set	0x54, %g3
	swapa	[%l7 + %g3] 0x80,	%o6
	set	0x0C, %i3
	lda	[%l7 + %i3] 0x81,	%f9
	nop
	set	0x64, %l6
	swap	[%l7 + %l6],	%i3
	set	0x0C, %i6
	stwa	%l3,	[%l7 + %i6] 0x80
	nop
	set	0x68, %i2
	ldsw	[%l7 + %i2],	%i5
	set	0x30, %i1
	swapa	[%l7 + %i1] 0x89,	%o5
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x81,	%i1
	nop
	set	0x35, %l4
	ldub	[%l7 + %l4],	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%o3
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc0
	set	0x18, %i0
	sta	%f23,	[%l7 + %i0] 0x88
	nop
	set	0x54, %o4
	ldub	[%l7 + %o4],	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%i6
	set	0x58, %g6
	stda	%o6,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x53, %g2
	ldub	[%l7 + %g2],	%g1
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %o3
	stxa	%l5,	[%l7 + %o3] 0x81
	nop
	set	0x58, %l1
	ldsh	[%l7 + %l1],	%o2
	ld	[%l7 + 0x4C],	%f1
	nop
	set	0x08, %l0
	std	%g4,	[%l7 + %l0]
	set	0x24, %o1
	swapa	[%l7 + %o1] 0x88,	%o0
	nop
	set	0x48, %i5
	std	%i6,	[%l7 + %i5]
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f24
	set	0x70, %o6
	sta	%f17,	[%l7 + %o6] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g6
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%l0
	set	0x48, %o2
	sta	%f12,	[%l7 + %o2] 0x89
	set	0x50, %i4
	lda	[%l7 + %i4] 0x80,	%f5
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%g4
	set	0x30, %l5
	stda	%g6,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x1C, %l3
	swapa	[%l7 + %l3] 0x81,	%o4
	and	%l2,	%g3,	%i2
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	nop
	set	0x28, %i3
	std	%f18,	[%l7 + %i3]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc4
	nop
	set	0x14, %g7
	swap	[%l7 + %g7],	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%l3
	nop
	set	0x0F, %i2
	ldstub	[%l7 + %i2],	%i5
	set	0x29, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i1
	set	0x6C, %o5
	stwa	%o5,	[%l7 + %o5] 0x81
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x81,	%i0
	nop
	set	0x7A, %i6
	sth	%o3,	[%l7 + %i6]
	set	0x2E, %i0
	stha	%l4,	[%l7 + %i0] 0x88
	set	0x34, %l2
	stwa	%l1,	[%l7 + %l2] 0xea
	membar	#Sync
	or	%i6,	%o7,	%g1
	set	0x62, %o4
	ldstuba	[%l7 + %o4] 0x88,	%l5
	set	0x39, %g2
	stba	%o2,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x40, %g6
	swapa	[%l7 + %g6] 0x80,	%l6
	fpadd16s	%f24,	%f9,	%f20
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x81,	%g5
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x20, %l0
	stwa	%o0,	[%l7 + %l0] 0x88
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	ld	[%l7 + 0x6C],	%f17
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%g2
	nop
	set	0x40, %i5
	std	%i6,	[%l7 + %i5]
	nop
	set	0x5A, %g1
	ldsh	[%l7 + %g1],	%g6
	or	%o1,	%l0,	%g4
	nop
	set	0x68, %o6
	stw	%o4,	[%l7 + %o6]
	add	%g7,	%l2,	%g3
	set	0x44, %g4
	stha	%i4,	[%l7 + %g4] 0x89
	nop
	set	0x38, %o2
	ldub	[%l7 + %o2],	%o6
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x81,	%i3
	set	0x68, %o7
	swapa	[%l7 + %o7] 0x89,	%l3
	nop
	set	0x74, %g5
	ldsw	[%l7 + %g5],	%i2
	nop
	set	0x78, %o0
	sth	%i1,	[%l7 + %o0]
	set	0x5D, %l3
	stba	%o5,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x0C, %l5
	stwa	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x56, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o3
	nop
	set	0x58, %i3
	ldsw	[%l7 + %i3],	%i5
	nop
	set	0x6C, %g7
	lduh	[%l7 + %g7],	%l1
	nop
	set	0x58, %l6
	stw	%i6,	[%l7 + %l6]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x89
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
	set	0x58, %i2
	sta	%f13,	[%l7 + %i2] 0x89
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x81,	%l4
	nop
	set	0x74, %i0
	sth	%g1,	[%l7 + %i0]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf0
	membar	#Sync
	ld	[%l7 + 0x34],	%f3
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%o7
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf8
	membar	#Sync
	nop
	set	0x32, %g2
	lduh	[%l7 + %g2],	%l5
	nop
	set	0x38, %g6
	lduw	[%l7 + %g6],	%o2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd0
	st	%f22,	[%l7 + 0x70]
	or	%g5,	%o0,	%l6
	or	%g2,	%i7,	%g6
	set	0x10, %l0
	stda	%l0,	[%l7 + %l0] 0xe3
	membar	#Sync
	st	%f11,	[%l7 + 0x68]
	add	%g4,	%o1,	%o4
	or	%g7,	%g3,	%l2
	nop
	set	0x52, %o1
	ldsh	[%l7 + %o1],	%o6
	nop
	set	0x1A, %l1
	ldsh	[%l7 + %l1],	%i4
	nop
	set	0x48, %o3
	ldsw	[%l7 + %o3],	%l3
	nop
	set	0x3A, %i5
	sth	%i2,	[%l7 + %i5]
	nop
	set	0x08, %o6
	lduh	[%l7 + %o6],	%i3
	set	0x08, %g1
	stda	%o4,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x34, %o2
	stw	%i1,	[%l7 + %o2]
	nop
	set	0x58, %i4
	sth	%o3,	[%l7 + %i4]
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x88,	 2
	nop
	set	0x46, %o7
	sth	%l1,	[%l7 + %o7]
	ld	[%l7 + 0x0C],	%f12
	set	0x4F, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i6
	or	%l4,	%g1,	%i0
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%f6
	nop
	set	0x44, %g5
	prefetch	[%l7 + %g5],	 2
	nop
	set	0x1C, %l5
	ldub	[%l7 + %l5],	%o7
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x80,	%l5
	set	0x44, %i3
	stha	%o2,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x88,	%o0
	nop
	set	0x44, %g7
	stw	%g5,	[%l7 + %g7]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xca
	nop
	set	0x60, %i1
	sth	%g2,	[%l7 + %i1]
	set	0x58, %i6
	swapa	[%l7 + %i6] 0x88,	%l6
	or	%i7,	%l0,	%g4
	nop
	set	0x40, %i0
	stw	%o1,	[%l7 + %i0]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%g7
	set	0x78, %i2
	stxa	%g3,	[%l7 + %i2] 0xe2
	membar	#Sync
	st	%f9,	[%l7 + 0x14]
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f0
	nop
	set	0x68, %o4
	ldsw	[%l7 + %o4],	%g6
	or	%o6,	%l2,	%l3
	nop
	set	0x68, %g2
	ldsw	[%l7 + %g2],	%i2
	set	0x6A, %g6
	stha	%i4,	[%l7 + %g6] 0x88
	nop
	set	0x60, %i7
	swap	[%l7 + %i7],	%i3
	nop
	set	0x2C, %l4
	lduw	[%l7 + %l4],	%o5
	nop
	set	0x69, %o1
	ldub	[%l7 + %o1],	%o3
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%i5
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x20, %o3
	std	%i0,	[%l7 + %o3]
	set	0x3A, %i5
	stba	%i6,	[%l7 + %i5] 0x80
	nop
	set	0x3C, %o6
	lduh	[%l7 + %o6],	%l1
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd0
	nop
	set	0x30, %l1
	stx	%l4,	[%l7 + %l1]
	nop
	set	0x58, %i4
	stb	%g1,	[%l7 + %i4]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%o7
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x80,	 2
	nop
	set	0x2C, %o2
	swap	[%l7 + %o2],	%o2
	or	%o0,	%g5,	%l5
	nop
	set	0x38, %l3
	lduw	[%l7 + %l3],	%l6
	nop
	set	0x18, %l5
	ldsw	[%l7 + %l5],	%i7
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%g2
	nop
	set	0x60, %g3
	ldstub	[%l7 + %g3],	%g4
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x88,	%o1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%g7
	nop
	set	0x54, %l6
	swap	[%l7 + %l6],	%l0
	set	0x55, %g7
	stba	%g3,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f4
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x81,	%o6
	st	%f13,	[%l7 + 0x78]
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x89,	%g6
	nop
	set	0x50, %i2
	ldsw	[%l7 + %i2],	%l3
	add	%i2,	%l2,	%i3
	nop
	set	0x60, %l2
	std	%o4,	[%l7 + %l2]
	nop
	set	0x58, %i6
	std	%f16,	[%l7 + %i6]
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%i4
	nop
	set	0x42, %i7
	ldsb	[%l7 + %i7],	%i1
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%i5
	nop
	set	0x40, %o1
	std	%i6,	[%l7 + %o1]
	set	0x38, %l4
	stda	%l0,	[%l7 + %l4] 0x81
	ld	[%l7 + 0x08],	%f19
	fpadd32	%f24,	%f18,	%f30
	set	0x68, %o3
	stxa	%l4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x34, %l0
	stw	%g1,	[%l7 + %l0]
	set	0x60, %i5
	stxa	%o7,	[%l7 + %i5] 0x88
	nop
	set	0x68, %o6
	std	%f28,	[%l7 + %o6]
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x88,	%o2
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x80,	%o0
	nop
	set	0x3A, %g4
	ldub	[%l7 + %g4],	%i0
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x57, %o0
	stba	%g5,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x7C, %i4
	lda	[%l7 + %i4] 0x81,	%f12
	nop
	set	0x40, %l3
	ldsb	[%l7 + %l3],	%l5
	add	%l6,	%i7,	%g2
	set	0x30, %o2
	lda	[%l7 + %o2] 0x88,	%f13
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x88,	%o1
	or	%o4,	%g7,	%g4
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l3
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x89,	%g6
	nop
	set	0x78, %g3
	stx	%l2,	[%l7 + %g3]
	set	0x18, %l6
	stda	%i2,	[%l7 + %l6] 0x88
	set	0x66, %o5
	stha	%o5,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x1C, %i1
	ldub	[%l7 + %i1],	%o3
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x55, %g7
	stb	%i4,	[%l7 + %g7]
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x80,	%i2
	nop
	set	0x45, %i2
	ldsb	[%l7 + %i2],	%i5
	and	%i1,	%i6,	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%o7
	nop
	set	0x50, %i6
	sth	%l1,	[%l7 + %i6]
	fpadd16	%f30,	%f18,	%f30
	nop
	set	0x7C, %l2
	stb	%o0,	[%l7 + %l2]
	set	0x17, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o2
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%l5
	nop
	set	0x0C, %g6
	swap	[%l7 + %g6],	%g5
	nop
	set	0x40, %g2
	stb	%i7,	[%l7 + %g2]
	nop
	set	0x3F, %o1
	stb	%g2,	[%l7 + %o1]
	nop
	set	0x54, %o3
	ldub	[%l7 + %o3],	%l6
	set	0x50, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o4
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0
	wr	%g7,	%g4,	%ccr
	set	0x42, %l4
	stba	%g3,	[%l7 + %l4] 0x81
	nop
	set	0x10, %o6
	ldsw	[%l7 + %o6],	%o6
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	nop
	set	0x22, %g1
	ldsh	[%l7 + %g1],	%g6
	nop
	set	0x78, %g4
	lduw	[%l7 + %g4],	%l0
	nop
	set	0x5F, %o0
	stb	%i3,	[%l7 + %o0]
	nop
	set	0x58, %o7
	std	%f18,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f16
	nop
	set	0x40, %o2
	lduh	[%l7 + %o2],	%o5
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%i4
	nop
	set	0x48, %l5
	ldsh	[%l7 + %l5],	%i5
	nop
	set	0x08, %g3
	std	%f16,	[%l7 + %g3]
	nop
	set	0x44, %l6
	swap	[%l7 + %l6],	%i2
	set	0x08, %i3
	swapa	[%l7 + %i3] 0x88,	%i6
	nop
	set	0x15, %i1
	ldstub	[%l7 + %i1],	%i1
	and	%g1,	%o7,	%l1
	nop
	set	0x50, %g7
	stx	%l4,	[%l7 + %g7]
	set	0x50, %i0
	stda	%o2,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x28, %i2
	stxa	%i0,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x2F, %i6
	ldub	[%l7 + %i6],	%o0
	set	0x20, %l2
	lda	[%l7 + %l2] 0x81,	%f29
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i7
	nop
	set	0x49, %o5
	ldub	[%l7 + %o5],	%g2
	set	0x1A, %i7
	stba	%l6,	[%l7 + %i7] 0x89
	nop
	set	0x20, %o4
	ldsh	[%l7 + %o4],	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o1
	or	%g4,	%g3,	%o6
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%g7
	wr	%g6,	%l3,	%pic
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x88,	 4
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%o5
	nop
	set	0x4C, %l0
	lduw	[%l7 + %l0],	%l0
	nop
	set	0x40, %o3
	ldub	[%l7 + %o3],	%o3
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f16
	nop
	set	0x70, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%i4
	nop
	set	0x6C, %g1
	lduw	[%l7 + %g1],	%l2
	fpadd32s	%f18,	%f20,	%f18
	nop
	set	0x66, %l4
	ldsh	[%l7 + %l4],	%i2
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x81,	%i5
	st	%f2,	[%l7 + 0x48]
	ld	[%l7 + 0x5C],	%f8
	nop
	set	0x3A, %o7
	sth	%i1,	[%l7 + %o7]
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x80,	%i6
	nop
	set	0x78, %o2
	std	%o6,	[%l7 + %o2]
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%g1
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%l4
	set	0x4C, %g5
	stwa	%l1,	[%l7 + %g5] 0x80
	nop
	set	0x48, %g3
	stx	%o2,	[%l7 + %g3]
	set	0x50, %l5
	sta	%f13,	[%l7 + %l5] 0x80
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%o0
	nop
	set	0x6C, %l6
	ldsh	[%l7 + %l6],	%i0
	nop
	set	0x12, %i1
	lduh	[%l7 + %i1],	%g5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1273
!	Type a   	: 25
!	Type cti   	: 15
!	Type x   	: 546
!	Type f   	: 36
!	Type i   	: 105
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 3 Start
!
.global thread_3
thread_3:
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
	set	0xF,	%g1
	set	0xA,	%g2
	set	0x7,	%g3
	set	0x6,	%g4
	set	0xA,	%g5
	set	0xB,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x7,	%i1
	set	-0xF,	%i2
	set	-0x6,	%i3
	set	-0x9,	%i4
	set	-0x7,	%i5
	set	-0xC,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x4FC277C0,	%l0
	set	0x1146288A,	%l1
	set	0x12B5095F,	%l2
	set	0x05C3C161,	%l3
	set	0x20C166DC,	%l4
	set	0x174CCBC0,	%l5
	set	0x305DED6C,	%l6
	!# Output registers
	set	-0x04FE,	%o0
	set	0x0DF3,	%o1
	set	0x1496,	%o2
	set	0x0073,	%o3
	set	-0x0F01,	%o4
	set	0x04FB,	%o5
	set	-0x10BA,	%o6
	set	0x0904,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	nop
	set	0x7A, %g7
	ldstub	[%l7 + %g7],	%g2
	set	0x60, %i2
	stha	%l6,	[%l7 + %i2] 0x80
	or	%l5,	%i7,	%o4
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f16
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x81,	 1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f0
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x89,	%g4
	nop
	set	0x2E, %o4
	ldsh	[%l7 + %o4],	%o6
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%g7
	ld	[%l7 + 0x08],	%f16
	st	%f31,	[%l7 + 0x64]
	nop
	set	0x2A, %g2
	ldstub	[%l7 + %g2],	%g6
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%g3
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%i2
	add	%l3,	%l0,	%o5
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%i4
	add	%l2,	%o3,	%i2
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%i5
	nop
	set	0x36, %o6
	stb	%i1,	[%l7 + %o6]
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%i6
	set	0x24, %g1
	stha	%o7,	[%l7 + %g1] 0xeb
	membar	#Sync
	st	%f25,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%l4
	set	0x3E, %o0
	stba	%l1,	[%l7 + %o0] 0x89
	nop
	set	0x0B, %i5
	ldub	[%l7 + %i5],	%o2
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%g0
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x81,	%i0
	set	0x59, %g4
	stba	%g5,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x6D, %i4
	stb	%o0,	[%l7 + %i4]
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%g2
	nop
	set	0x36, %g3
	stb	%l5,	[%l7 + %g3]
	and	%i7,	%o4,	%l6
	nop
	set	0x68, %g5
	std	%f20,	[%l7 + %g5]
	bleu,pt	%icc,	loop_63
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f22
	set	0x30, %l6
	ldxa	[%l7 + %l6] 0x80,	%o1
loop_63:
	ld	[%l7 + 0x28],	%f3
	set	0x20, %l5
	stxa	%o6,	[%l7 + %l5] 0x88
	nop
	set	0x7E, %i1
	ldsh	[%l7 + %i1],	%g4
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	set	0x10, %g7
	ldda	[%l7 + %g7] 0xe2,	%g6
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x80,	%g3
	nop
	nop
	setx	0x1CF90CB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xDE4CF04A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f16,	%f31
	nop
	nop
	setx	0x4A89F62D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x1E1203E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f30,	%f19
	set	0x70, %i6
	stwa	%i3,	[%l7 + %i6] 0x88
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f16
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%l0
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x89,	%o5
	add	%i4,	%l3,	%l2
	nop
	set	0x70, %g2
	ldsw	[%l7 + %g2],	%i2
	fpadd16s	%f2,	%f19,	%f8
	nop
	set	0x7D, %o5
	ldub	[%l7 + %o5],	%i5
	fpsub32	%f24,	%f2,	%f16
	nop
	set	0x58, %g6
	stx	%i1,	[%l7 + %g6]
	set	0x70, %o1
	stwa	%i6,	[%l7 + %o1] 0xe2
	membar	#Sync
	wr 	%g0, 	0x7, 	%fprs
	or	%l1,	%o7,	%o2
	add	%g1,	%i0,	%g5
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x88,	%g2
	or	%o0,	%i7,	%l5
	nop
	set	0x32, %o6
	ldsh	[%l7 + %o6],	%l6
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%o4
	nop
	set	0x7D, %g1
	ldub	[%l7 + %g1],	%o6
	set	0x26, %l4
	stha	%o1,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x80,	%g4
	and	%g7,	%g6,	%i3
	nop
	set	0x60, %o0
	stw	%l0,	[%l7 + %o0]
	set	0x76, %i5
	stha	%g3,	[%l7 + %i5] 0x88
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x46, %g4
	lduh	[%l7 + %g4],	%l3
	and	%i4,	%l2,	%i2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f0
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x80,	 1
	st	%f15,	[%l7 + 0x3C]
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f10
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%i5
	nop
	set	0x18, %g5
	stx	%o3,	[%l7 + %g5]
	nop
	set	0x53, %l6
	stb	%l4,	[%l7 + %l6]
	set	0x4E, %i3
	stba	%l1,	[%l7 + %i3] 0xe3
	membar	#Sync
	wr 	%g0, 	0x5, 	%fprs
	set	0x1A, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o2
	wr	%g1,	%g5,	%softint
	set	0x48, %l5
	stda	%g2,	[%l7 + %l5] 0x81
	nop
	set	0x14, %i2
	ldstub	[%l7 + %i2],	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%o0
	nop
	set	0x28, %g7
	std	%i6,	[%l7 + %g7]
	nop
	set	0x5C, %i6
	stb	%o4,	[%l7 + %i6]
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%o6
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f22
	st	%fsr,	[%l7 + 0x4C]
	set	0x08, %o4
	stxa	%o1,	[%l7 + %o4] 0x88
	set	0x10, %i0
	stda	%l4,	[%l7 + %i0] 0x80
	set	0x20, %o5
	swapa	[%l7 + %o5] 0x80,	%g4
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%g6
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x89,	 4
	nop
	set	0x13, %o3
	ldstub	[%l7 + %o3],	%l0
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%i3
	nop
	set	0x0E, %l1
	ldstub	[%l7 + %l1],	%g3
	nop
	set	0x58, %o6
	std	%f20,	[%l7 + %o6]
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x89,	 3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%i4
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe3,	%i2
	nop
	set	0x50, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x48, %i5
	std	%f18,	[%l7 + %i5]
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%l2
	nop
	set	0x48, %g4
	stx	%i1,	[%l7 + %g4]
	nop
	set	0x50, %o2
	ldsw	[%l7 + %o2],	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%l1
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x88,	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x92E, 	%tick_cmpr
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%g1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf1
	membar	#Sync
	nop
	set	0x54, %i4
	sth	%g5,	[%l7 + %i4]
	nop
	set	0x7C, %l6
	swap	[%l7 + %l6],	%g2
	nop
	set	0x40, %i3
	stw	%i0,	[%l7 + %i3]
	nop
	set	0x64, %g5
	lduh	[%l7 + %g5],	%i6
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%o0
	ld	[%l7 + 0x68],	%f31
	set	0x08, %l5
	stda	%i6,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x5B, %g7
	stba	%o4,	[%l7 + %g7] 0x88
	set	0x17, %i2
	stba	%o6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x2D, %l2
	stba	%o1,	[%l7 + %l2] 0x80
	set	0x78, %i7
	stwa	%l6,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%g4
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%g7
	nop
	set	0x3E, %i0
	ldstub	[%l7 + %i0],	%g6
	nop
	set	0x38, %g2
	std	%f2,	[%l7 + %g2]
	set	0x11, %g6
	stba	%l5,	[%l7 + %g6] 0xea
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%g3
	nop
	set	0x68, %o3
	sth	%l0,	[%l7 + %o3]
	nop
	set	0x18, %o1
	stw	%o5,	[%l7 + %o1]
	set	0x7C, %o5
	stwa	%i4,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xC1DC8798946AA29F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xF2438F39637C4EBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f14,	%f16
	set	0x40, %o6
	lda	[%l7 + %o6] 0x89,	%f10
	ld	[%l7 + 0x50],	%f21
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%l2
	nop
	set	0x18, %l1
	stx	%i2,	[%l7 + %l1]
	fpsub32s	%f20,	%f30,	%f19
	nop
	set	0x0C, %o0
	stw	%i1,	[%l7 + %o0]
	add	%l2,	%i5,	%l4
	nop
	set	0x4C, %g1
	stw	%o3,	[%l7 + %g1]
	or	%l1,	%o2,	%g1
	set	0x40, %l3
	stwa	%g5,	[%l7 + %l3] 0x81
	nop
	set	0x71, %i5
	stb	%g2,	[%l7 + %i5]
	set	0x48, %g4
	stxa	%i0,	[%l7 + %g4] 0xe2
	membar	#Sync
	add	%o7,	%o0,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%o6
	or	%o4,	%o1,	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
	nop
	set	0x2E, %o7
	ldsb	[%l7 + %o7],	%l5
	nop
	set	0x46, %g3
	ldsh	[%l7 + %g3],	%g7
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f0
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%i3
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x20, %g5
	lda	[%l7 + %g5] 0x81,	%f23
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x40, %l6
	std	%g2,	[%l7 + %l6]
	nop
	set	0x55, %l5
	ldstub	[%l7 + %l5],	%o5
	nop
	set	0x5F, %g7
	ldub	[%l7 + %g7],	%l0
	set	0x14, %i2
	stwa	%i4,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%l3
	add	%i2,	%l2,	%i5
	nop
	set	0x22, %i7
	sth	%l4,	[%l7 + %i7]
	and	%o3,	%l1,	%o2
	set	0x28, %o4
	stxa	%g1,	[%l7 + %o4] 0x81
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x88,	 4
	or	%g2,	%i1,	%o7
	nop
	set	0x48, %g2
	stb	%o0,	[%l7 + %g2]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	set	0x70, %i6
	lda	[%l7 + %i6] 0x89,	%f12
	nop
	set	0x78, %o3
	stb	%i7,	[%l7 + %o3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%o6
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x81,	%i0
	nop
	set	0x39, %o6
	ldsb	[%l7 + %o6],	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%g4
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%l6
	or	%g6,	%g7,	%i3
	and	%g3,	%o5,	%l5
	nop
	set	0x78, %l4
	std	%i4,	[%l7 + %l4]
	set	0x61, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l0
	nop
	set	0x22, %o0
	ldub	[%l7 + %o0],	%i2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%i5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	set	0x47, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l2
	nop
	set	0x60, %g1
	ldsw	[%l7 + %g1],	%o3
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g1
	nop
	set	0x1C, %g4
	stw	%g5,	[%l7 + %g4]
	nop
	set	0x36, %g3
	sth	%l4,	[%l7 + %g3]
	set	0x20, %o7
	stha	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf9,	%f0
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 3
	bl,a,pt	%icc,	loop_64
	or	%o7,	%g2,	%i7
	ld	[%l7 + 0x18],	%f3
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%o0
loop_64:
	nop
	set	0x7C, %g5
	stwa	%o6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f26
	nop
	set	0x20, %l6
	ldsh	[%l7 + %l6],	%i0
	set	0x1C, %g7
	sta	%f21,	[%l7 + %g7] 0x81
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x80,	%i6
	set	0x74, %l5
	lda	[%l7 + %l5] 0x80,	%f9
	bn,a	%icc,	loop_65
	nop
	set	0x68, %i7
	stx	%o4,	[%l7 + %i7]
	set	0x18, %o4
	stda	%g4,	[%l7 + %o4] 0x80
loop_65:
	st	%fsr,	[%l7 + 0x18]
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x80,	 4
	nop
	set	0x30, %g2
	ldx	[%l7 + %g2],	%g6
	set	0x60, %g6
	sta	%f5,	[%l7 + %g6] 0x89
	nop
	set	0x08, %l2
	swap	[%l7 + %l2],	%g7
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%l6
	nop
	set	0x28, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x78, %o6
	sth	%g3,	[%l7 + %o6]
	fpsub16	%f20,	%f2,	%f22
	st	%f0,	[%l7 + 0x38]
	set	0x60, %o1
	stwa	%o5,	[%l7 + %o1] 0x80
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x80,	%i3
	or	%l5,	%l0,	%i2
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x89,	%i4
	nop
	set	0x44, %l1
	ldsh	[%l7 + %l1],	%l3
	set	0x58, %o0
	ldxa	[%l7 + %o0] 0x89,	%l2
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i5
	ld	[%l7 + 0x5C],	%f15
	ld	[%l7 + 0x14],	%f21
	wr	%l1,	%o2,	%clear_softint
	set	0x57, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o3
	and	%g1,	%g5,	%i1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%o7
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xda
	fpsub32s	%f7,	%f21,	%f7
	fpadd16	%f22,	%f14,	%f26
	nop
	set	0x31, %o2
	ldsb	[%l7 + %o2],	%i7
	nop
	set	0x6B, %g4
	ldub	[%l7 + %g4],	%o0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i0
	wr	%o6,	%o4,	%clear_softint
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x81,	 1
	nop
	set	0x67, %g3
	ldsb	[%l7 + %g3],	%o1
	nop
	set	0x38, %i3
	lduh	[%l7 + %i3],	%g6
	set	0x34, %i4
	stha	%g7,	[%l7 + %i4] 0xe2
	membar	#Sync
	or	%i6,	%l6,	%o5
	nop
	set	0x3C, %g5
	stb	%g3,	[%l7 + %g5]
	nop
	set	0x58, %l0
	std	%f6,	[%l7 + %l0]
	bl,a,pt	%icc,	loop_66
	nop
	set	0x3E, %l6
	stb	%i3,	[%l7 + %l6]
	set	0x14, %i1
	lda	[%l7 + %i1] 0x89,	%f17
loop_66:
	nop
	set	0x60, %i2
	sta	%f7,	[%l7 + %i2] 0x89
	set	0x60, %l5
	stxa	%l5,	[%l7 + %l5] 0x88
	set	0x64, %g7
	stwa	%i2,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x20, %i7
	stx	%i4,	[%l7 + %i7]
	fpadd16s	%f13,	%f27,	%f16
	set	0x10, %o4
	stda	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x09, %g2
	ldsb	[%l7 + %g2],	%l3
	set	0x2E, %g6
	stha	%l2,	[%l7 + %g6] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x38, %o3
	stb	%l1,	[%l7 + %o3]
	set	0x58, %l2
	sta	%f5,	[%l7 + %l2] 0x80
	and	%o2,	%i5,	%g1
	set	0x0C, %o6
	lda	[%l7 + %o6] 0x80,	%f21
	set	0x48, %o1
	lda	[%l7 + %o1] 0x80,	%f17
	wr	%g5,	%o3,	%pic
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f18
	nop
	set	0x28, %l1
	std	%i0,	[%l7 + %l1]
	set	0x30, %o5
	lda	[%l7 + %o5] 0x81,	%f24
	or	%o7,	%i7,	%o0
	set	0x74, %o0
	sta	%f25,	[%l7 + %o0] 0x81
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x09, %i5
	ldsb	[%l7 + %i5],	%g2
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x7C, %o2
	ldsw	[%l7 + %o2],	%l4
	nop
	set	0x50, %o7
	stw	%o6,	[%l7 + %o7]
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f16
	set	0x0E, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o4
	set	0x08, %g5
	stxa	%o1,	[%l7 + %g5] 0x88
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%i6
	set	0x30, %i3
	swapa	[%l7 + %i3] 0x88,	%g7
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	nop
	set	0x64, %l6
	ldsw	[%l7 + %l6],	%l6
	nop
	set	0x10, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x50, %l5
	std	%g2,	[%l7 + %l5]
	set	0x30, %g7
	stxa	%i3,	[%l7 + %g7] 0xe2
	membar	#Sync
	add	%l5,	%i2,	%o5
	nop
	set	0x2E, %i7
	ldsb	[%l7 + %i7],	%l0
	set	0x64, %i2
	lda	[%l7 + %i2] 0x80,	%f30
	set	0x28, %o4
	sta	%f14,	[%l7 + %o4] 0x88
	nop
	set	0x7C, %g2
	ldsw	[%l7 + %g2],	%l3
	wr	%l2,	%i4,	%set_softint
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%o2
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x88,	%l1
	fpadd16s	%f16,	%f8,	%f22
	nop
	set	0x5A, %o3
	sth	%g1,	[%l7 + %o3]
	nop
	set	0x7C, %l2
	ldsw	[%l7 + %l2],	%g5
	fpsub16s	%f12,	%f20,	%f19
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f0
	ld	[%l7 + 0x28],	%f23
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%i4
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f2
	nop
	set	0x78, %l1
	swap	[%l7 + %l1],	%i1
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x68, %l4
	ldub	[%l7 + %l4],	%o7
	set	0x48, %o0
	stxa	%o3,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x30, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x78, %l3
	std	%o0,	[%l7 + %l3]
	nop
	set	0x28, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	set	0x28, %g4
	stda	%g2,	[%l7 + %g4] 0x88
	nop
	set	0x24, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x5C, %i4
	lduw	[%l7 + %i4],	%i0
	bgu,a	%xcc,	loop_67
	add	%o6,	%l4,	%g4
	nop
	set	0x23, %g3
	ldsb	[%l7 + %g3],	%o4
	set	0x65, %i3
	stba	%o1,	[%l7 + %i3] 0xe2
	membar	#Sync
loop_67:
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x81,	%i6
	nop
	set	0x18, %l6
	ldsh	[%l7 + %l6],	%g7
	nop
	set	0x0C, %i1
	prefetch	[%l7 + %i1],	 4
	ld	[%l7 + 0x60],	%f29
	nop
	set	0x24, %l5
	sth	%l6,	[%l7 + %l5]
	fpadd16s	%f28,	%f20,	%f25
	nop
	set	0x24, %g7
	ldsw	[%l7 + %g7],	%g3
	set	0x3A, %i7
	stha	%g6,	[%l7 + %i7] 0x80
	set	0x38, %o4
	swapa	[%l7 + %o4] 0x89,	%l5
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x80,	%i2
	set	0x60, %g2
	ldda	[%l7 + %g2] 0xeb,	%i2
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%l0
	st	%f24,	[%l7 + 0x4C]
	st	%f19,	[%l7 + 0x30]
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x88,	%l3
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x81,	%o4
	fpsub16	%f18,	%f26,	%f20
	nop
	set	0x2A, %o6
	sth	%l2,	[%l7 + %o6]
	set	0x38, %l2
	stxa	%o2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x52, %i0
	lduh	[%l7 + %i0],	%l1
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x30, %o1
	ldx	[%l7 + %o1],	%g1
	or	%i4,	%i5,	%g5
	nop
	set	0x58, %o5
	ldsh	[%l7 + %o5],	%o7
	set	0x6C, %l1
	lda	[%l7 + %l1] 0x88,	%f6
	st	%fsr,	[%l7 + 0x68]
	fpadd32	%f6,	%f18,	%f20
	nop
	set	0x11, %o0
	ldsb	[%l7 + %o0],	%o3
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
	nop
	set	0x58, %g1
	std	%i0,	[%l7 + %g1]
	set	0x18, %i5
	stda	%g2,	[%l7 + %i5] 0x89
	set	0x18, %l3
	stxa	%i0,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x40, %g4
	stx	%o6,	[%l7 + %g4]
	nop
	set	0x40, %o7
	ldstub	[%l7 + %o7],	%l4
	set	0x28, %o2
	stwa	%i7,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x28, %g3
	swap	[%l7 + %g3],	%o4
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%o1
	set	0x7B, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i6
	nop
	set	0x2A, %i4
	ldsb	[%l7 + %i4],	%g4
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xe3,	%i6
	nop
	set	0x60, %g5
	std	%f4,	[%l7 + %g5]
	set	0x48, %l5
	stwa	%g3,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x88,	%g7
	nop
	set	0x54, %i1
	stb	%g6,	[%l7 + %i1]
	nop
	set	0x1F, %o4
	ldub	[%l7 + %o4],	%i3
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x81,	%l5
	nop
	set	0x18, %i7
	stw	%i2,	[%l7 + %i7]
	nop
	set	0x16, %i6
	sth	%l3,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x2C]
	set	0x60, %o3
	sta	%f0,	[%l7 + %o3] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l2
	set	0x1D, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l0
	set	0x5F, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o2
	set	0x28, %l2
	stxa	%g1,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x24, %g2
	lda	[%l7 + %g2] 0x88,	%f29
	or	%i4,	%l1,	%i5
	set	0x40, %i0
	stda	%o6,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	set	0x4C, %l1
	lda	[%l7 + %l1] 0x89,	%f27
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	ble,pn	%xcc,	loop_68
	nop
	set	0x50, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x68, %g1
	std	%f0,	[%l7 + %g1]
	nop
	set	0x48, %o0
	stw	%o3,	[%l7 + %o0]
loop_68:
	nop
	set	0x50, %l3
	stxa	%o0,	[%l7 + %l3] 0x81
	nop
	set	0x28, %g4
	stw	%g5,	[%l7 + %g4]
	set	0x7F, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i1
	set	0x14, %o2
	lda	[%l7 + %o2] 0x81,	%f15
	nop
	set	0x44, %o7
	ldsw	[%l7 + %o7],	%i0
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%g2
	st	%f15,	[%l7 + 0x14]
	set	0x5E, %l0
	stha	%l4,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x88,	%o6
	set	0x1C, %l6
	stwa	%i7,	[%l7 + %l6] 0x89
	nop
	set	0x1B, %i4
	ldsb	[%l7 + %i4],	%o1
	set	0x60, %l5
	stba	%i6,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x40, %g7
	stda	%o4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x5C, %i1
	sta	%f26,	[%l7 + %i1] 0x80
	nop
	set	0x20, %g5
	stx	%g4,	[%l7 + %g5]
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f14
	set	0x50, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l6
	and	%g3,	%g6,	%g7
	fpadd16s	%f3,	%f24,	%f26
	nop
	set	0x30, %i2
	stx	%i3,	[%l7 + %i2]
	set	0x4B, %o3
	stba	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	st	%f6,	[%l7 + 0x5C]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l5
	nop
	set	0x58, %i6
	std	%o4,	[%l7 + %i6]
	nop
	set	0x5E, %o6
	ldsh	[%l7 + %o6],	%l0
	nop
	set	0x68, %l2
	stx	%o2,	[%l7 + %l2]
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x89,	%g1
	set	0x40, %g6
	stda	%i4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x81,	%l2
	set	0x30, %l1
	sta	%f30,	[%l7 + %l1] 0x89
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x80,	%i5
	wr 	%g0, 	0x5, 	%fprs
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x81,	%o0
	nop
	set	0x42, %g1
	lduh	[%l7 + %g1],	%g5
	set	0x70, %o0
	lda	[%l7 + %o0] 0x89,	%f23
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%o3
	nop
	set	0x0B, %i5
	ldub	[%l7 + %i5],	%i1
	nop
	set	0x34, %o2
	stw	%i0,	[%l7 + %o2]
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x88,	%g2
	st	%f25,	[%l7 + 0x44]
	nop
	set	0x48, %o7
	ldsb	[%l7 + %o7],	%l4
	ba,a,pn	%xcc,	loop_69
	st	%f30,	[%l7 + 0x70]
	nop
	set	0x2C, %l0
	swap	[%l7 + %l0],	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%i6
loop_69:
	and	%o6,	%g4,	%l6
	nop
	set	0x58, %g3
	ldsb	[%l7 + %g3],	%o4
	nop
	set	0x14, %l6
	swap	[%l7 + %l6],	%g3
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f2
	nop
	set	0x28, %i3
	stw	%g6,	[%l7 + %i3]
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i3
	set	0x58, %l5
	stha	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd0
	nop
	set	0x50, %o4
	lduw	[%l7 + %o4],	%l3
	nop
	set	0x5C, %i1
	stw	%l5,	[%l7 + %i1]
	and	%i2,	%l0,	%o5
	bl	%xcc,	loop_70
	fpsub16	%f20,	%f2,	%f10
	set	0x68, %i7
	stxa	%g1,	[%l7 + %i7] 0x81
loop_70:
	nop
	set	0x24, %o3
	lduw	[%l7 + %o3],	%o2
	nop
	set	0x58, %i2
	lduw	[%l7 + %i2],	%l2
	nop
	set	0x24, %i6
	swap	[%l7 + %i6],	%i4
	bge,a	%icc,	loop_71
	or	%o7,	%i5,	%o0
	and	%g5,	%o3,	%l1
	nop
	set	0x50, %o6
	prefetch	[%l7 + %o6],	 0
loop_71:
	nop
	set	0x08, %l2
	lduh	[%l7 + %l2],	%i0
	set	0x51, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g2
	nop
	set	0x28, %g2
	ldub	[%l7 + %g2],	%l4
	nop
	set	0x52, %o1
	sth	%i7,	[%l7 + %o1]
	nop
	set	0x14, %l1
	sth	%i1,	[%l7 + %l1]
	nop
	set	0x18, %i0
	ldsw	[%l7 + %i0],	%i6
	bge,pn	%icc,	loop_72
	nop
	set	0x5C, %l4
	ldsw	[%l7 + %l4],	%o1
	nop
	set	0x42, %g1
	stb	%g4,	[%l7 + %g1]
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%o6
loop_72:
	nop
	set	0x3C, %o0
	lduh	[%l7 + %o0],	%l6
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x36, %i5
	sth	%g6,	[%l7 + %i5]
	nop
	set	0x38, %o2
	std	%f30,	[%l7 + %o2]
	nop
	set	0x7C, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x1A, %l0
	stha	%i3,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x68, %o7
	stw	%o4,	[%l7 + %o7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%l5
	wr	%g7,	%i2,	%sys_tick
	nop
	set	0x78, %g3
	ldsw	[%l7 + %g3],	%l0
	and	%g1,	%o5,	%o2
	nop
	set	0x76, %i4
	sth	%l2,	[%l7 + %i4]
	fpadd16s	%f3,	%f30,	%f19
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xe3,	%o6
	nop
	set	0x1C, %i3
	sth	%i4,	[%l7 + %i3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%l1
	set	0x72, %l5
	stha	%o3,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x20, %g7
	ldsb	[%l7 + %g7],	%g2
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	fpsub16	%f14,	%f2,	%f28
	or	%l4,	%i0,	%i1
	set	0x58, %i1
	stda	%i6,	[%l7 + %i1] 0x81
	nop
	set	0x4C, %o4
	swap	[%l7 + %o4],	%o1
	nop
	set	0x68, %o3
	std	%f0,	[%l7 + %o3]
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%i6
	nop
	set	0x2C, %i6
	swap	[%l7 + %i6],	%o6
	set	0x5C, %i7
	sta	%f14,	[%l7 + %i7] 0x89
	set	0x18, %l2
	stba	%g4,	[%l7 + %l2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x7C],	%f31
	wr	%l6,	%g6,	%sys_tick
	or	%i3,	%g3,	%o4
	nop
	set	0x70, %g6
	lduw	[%l7 + %g6],	%l5
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%l3
	and	%g7,	%l0,	%i2
	set	0x2D, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o5
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x81,	 1
	set	0x1C, %i0
	sta	%f23,	[%l7 + %i0] 0x89
	nop
	set	0x68, %l4
	stw	%l2,	[%l7 + %l4]
	wr	%g1,	%o7,	%y
	ld	[%l7 + 0x64],	%f11
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x89,	%i4
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%o0
	nop
	set	0x50, %l1
	std	%g4,	[%l7 + %l1]
	set	0x40, %g4
	lda	[%l7 + %g4] 0x81,	%f29
	set	0x50, %i5
	stda	%l0,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x44, %o0
	lda	[%l7 + %o0] 0x89,	%f30
	and	%o3,	%g2,	%i5
	nop
	set	0x64, %l3
	swap	[%l7 + %l3],	%i0
	and	%l4,	%i1,	%o1
	nop
	set	0x60, %o2
	stx	%i6,	[%l7 + %o2]
	fpsub32s	%f26,	%f1,	%f3
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%o6
	nop
	set	0x0C, %g3
	ldsh	[%l7 + %g3],	%g4
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%g6
	nop
	set	0x2C, %l6
	prefetch	[%l7 + %l6],	 2
	set	0x68, %i3
	stha	%l6,	[%l7 + %i3] 0x81
	or	%g3,	%o4,	%i3
	set	0x30, %l5
	stxa	%l5,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf9
	membar	#Sync
	nop
	set	0x29, %g7
	ldstub	[%l7 + %g7],	%g7
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%i2
	nop
	set	0x6C, %o4
	ldsw	[%l7 + %o4],	%o2
	nop
	set	0x14, %g5
	ldub	[%l7 + %g5],	%l2
	nop
	set	0x28, %i2
	stx	%o5,	[%l7 + %i2]
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%o7
	nop
	set	0x1E, %i7
	ldsh	[%l7 + %i7],	%i4
	nop
	set	0x08, %l2
	lduw	[%l7 + %l2],	%g1
	or	%g5,	%o0,	%o3
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x80,	%l1
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%g2
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f16
	nop
	set	0x70, %o6
	stx	%i5,	[%l7 + %o6]
	set	0x48, %o1
	stda	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	or	%i1,	%o1,	%i0
	nop
	set	0x60, %l4
	std	%i6,	[%l7 + %l4]
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x89,	%i6
	fpadd16	%f24,	%f6,	%f14
	nop
	set	0x34, %i0
	ldsw	[%l7 + %i0],	%o6
	or	%g6,	%l6,	%g3
	nop
	set	0x34, %l1
	stw	%g4,	[%l7 + %l1]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i3
	nop
	set	0x6A, %o5
	ldsh	[%l7 + %o5],	%l5
	set	0x26, %i5
	stba	%l3,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x81,	%l0
	add	%i2,	%g7,	%l2
	nop
	set	0x44, %l3
	ldsh	[%l7 + %l3],	%o5
	add	%o7,	%i4,	%o2
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x89,	%g1
	nop
	set	0x10, %o7
	prefetch	[%l7 + %o7],	 3
	add	%o0,	%o3,	%l1
	ba,pt	%xcc,	loop_73
	add	%g2,	%i5,	%g5
	wr	%l4,	%o1,	%pic
	nop
	set	0x44, %g3
	sth	%i0,	[%l7 + %g3]
loop_73:
	nop
	set	0x50, %l0
	lduw	[%l7 + %l0],	%i1
	set	0x67, %o2
	stba	%i7,	[%l7 + %o2] 0x81
	nop
	set	0x34, %i3
	ldsw	[%l7 + %i3],	%i6
	set	0x74, %l6
	stwa	%g6,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f16
	and	%o6,	%g3,	%g4
	nop
	set	0x48, %g7
	lduw	[%l7 + %g7],	%l6
	set	0x20, %i1
	stwa	%o4,	[%l7 + %i1] 0x80
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%l5
	nop
	set	0x0A, %o4
	stb	%i3,	[%l7 + %o4]
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%l3
	set	0x78, %i2
	swapa	[%l7 + %i2] 0x81,	%i2
	nop
	set	0x78, %i7
	swap	[%l7 + %i7],	%g7
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x80,	%l2
	nop
	set	0x50, %g6
	ldsh	[%l7 + %g6],	%o5
	set	0x28, %l2
	lda	[%l7 + %l2] 0x80,	%f10
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%l0
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x89,	%o7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%g1
	set	0x66, %o6
	stha	%o2,	[%l7 + %o6] 0x80
	st	%f29,	[%l7 + 0x74]
	nop
	set	0x40, %l4
	lduh	[%l7 + %l4],	%o0
	set	0x39, %g1
	stba	%l1,	[%l7 + %g1] 0x89
	set	0x50, %i0
	stwa	%g2,	[%l7 + %i0] 0x81
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x81,	%i5
	and	%o3,	%g5,	%o1
	set	0x5C, %o5
	stwa	%l4,	[%l7 + %o5] 0x81
	nop
	set	0x7C, %o1
	sth	%i0,	[%l7 + %o1]
	fpsub32	%f20,	%f30,	%f2
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x89,	%i7
	nop
	set	0x6C, %l3
	ldub	[%l7 + %l3],	%i6
	set	0x60, %g4
	stxa	%i1,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x44, %i5
	swapa	[%l7 + %i5] 0x88,	%o6
	ld	[%l7 + 0x58],	%f18
	nop
	set	0x2C, %g3
	swap	[%l7 + %g3],	%g6
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf1
	membar	#Sync
	set	0x7C, %o2
	stha	%g3,	[%l7 + %o2] 0xea
	membar	#Sync
	add	%l6,	%g4,	%l5
	add	%o4,	%l3,	%i3
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f26
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc4
	nop
	set	0x2C, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xcc
	nop
	set	0x10, %i1
	lduh	[%l7 + %i1],	%g7
	nop
	set	0x14, %g7
	swap	[%l7 + %g7],	%l2
	fpadd16	%f12,	%f30,	%f28
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%i2
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x81,	%l0
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%o7
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x50, %o3
	stwa	%o5,	[%l7 + %o3] 0x88
	nop
	set	0x48, %i2
	lduw	[%l7 + %i2],	%g1
	set	0x4C, %g6
	stha	%o2,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x7C, %l2
	stwa	%i4,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x38, %i6
	swap	[%l7 + %i6],	%o0
	set	0x48, %g2
	stda	%l0,	[%l7 + %g2] 0x89
	set	0x17, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g2
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	ld	[%l7 + 0x50],	%f1
	add	%i5,	%g5,	%o1
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x81,	 3
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xda,	%f0
	wr	%o3,	%i0,	%ccr
	or	%i6,	%i7,	%i1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%g6
	nop
	set	0x58, %g1
	stw	%l6,	[%l7 + %g1]
	set	0x39, %o5
	stba	%g3,	[%l7 + %o5] 0xeb
	membar	#Sync
	add	%g4,	%o4,	%l5
	nop
	set	0x62, %o1
	ldub	[%l7 + %o1],	%l3
	be,a,pt	%icc,	loop_74
	wr	%i3,	%l2,	%softint
	set	0x4C, %l3
	stwa	%i2,	[%l7 + %l3] 0x89
loop_74:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC1B, 	%sys_tick_cmpr
	nop
	set	0x20, %o0
	stx	%o7,	[%l7 + %o0]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%o5
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x80,	 3
	set	0x58, %g3
	sta	%f6,	[%l7 + %g3] 0x89
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x81,	 2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%g2
	nop
	nop
	setx	0xBC3FC827,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x03EC38E5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f20,	%f18
	set	0x5D, %i5
	stba	%i5,	[%l7 + %i5] 0x89
	st	%f7,	[%l7 + 0x34]
	nop
	set	0x26, %o2
	ldub	[%l7 + %o2],	%g5
	ld	[%l7 + 0x44],	%f30
	nop
	set	0x6B, %o7
	ldstub	[%l7 + %o7],	%o1
	st	%f3,	[%l7 + 0x0C]
	set	0x5E, %i4
	stha	%l4,	[%l7 + %i4] 0x81
	nop
	set	0x30, %l6
	std	%f28,	[%l7 + %l6]
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%o3
	set	0x18, %i1
	prefetcha	[%l7 + %i1] 0x80,	 3
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%i6
	and	%i4,	%i7,	%i1
	nop
	set	0x18, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x78, %o4
	stxa	%o6,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%f19,	[%l7 + 0x14]
	set	0x20, %i7
	stxa	%l6,	[%l7 + %i7] 0x88
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x30, %i2
	lda	[%l7 + %i2] 0x81,	%f30
	nop
	set	0x38, %l2
	std	%f4,	[%l7 + %l2]
	nop
	set	0x33, %i6
	stb	%g3,	[%l7 + %i6]
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x43, %o6
	ldsb	[%l7 + %o6],	%g4
	nop
	set	0x1B, %g6
	ldstub	[%l7 + %g6],	%o4
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	set	0x24, %l1
	swapa	[%l7 + %l1] 0x80,	%g6
	set	0x12, %g1
	stba	%i3,	[%l7 + %g1] 0x88
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x81,	%f29
	nop
	set	0x54, %o1
	ldstub	[%l7 + %o1],	%l3
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%l2
	set	0x38, %o5
	stxa	%i2,	[%l7 + %o5] 0x88
	nop
	set	0x58, %g4
	std	%l0,	[%l7 + %g4]
	wr	%g7,	%g1,	%softint
	set	0x1C, %g3
	stwa	%o5,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x6E, %l0
	sth	%o2,	[%l7 + %l0]
	nop
	set	0x74, %o2
	stw	%o0,	[%l7 + %o2]
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%o7
	set	0x38, %i4
	lda	[%l7 + %i4] 0x80,	%f16
	nop
	set	0x64, %l6
	sth	%l1,	[%l7 + %l6]
	nop
	set	0x70, %i5
	ldsw	[%l7 + %i5],	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%i5
	set	0x14, %i1
	swapa	[%l7 + %i1] 0x89,	%l4
	nop
	set	0x52, %i3
	sth	%o1,	[%l7 + %i3]
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%o3
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%i0
	set	0x28, %i7
	stxa	%i6,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f4
	add	%i7,	%i1,	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf1
	membar	#Sync
	set	0x68, %i2
	stda	%i6,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x4E, %l2
	stb	%o4,	[%l7 + %l2]
	ld	[%l7 + 0x58],	%f7
	wr	%l5,	%g6,	%pic
	wr	%i3,	%l3,	%clear_softint
	nop
	set	0x4B, %i6
	ldub	[%l7 + %i6],	%g4
	nop
	set	0x56, %o3
	ldsb	[%l7 + %o3],	%l2
	nop
	set	0x48, %g2
	lduh	[%l7 + %g2],	%i2
	set	0x58, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g7
	nop
	set	0x62, %g6
	ldstub	[%l7 + %g6],	%l0
	fpadd32	%f6,	%f22,	%f12
	set	0x5C, %l1
	lda	[%l7 + %l1] 0x89,	%f18
	set	0x20, %g1
	stwa	%o5,	[%l7 + %g1] 0x81
	nop
	set	0x44, %l4
	ldub	[%l7 + %l4],	%o2
	set	0x28, %o1
	lda	[%l7 + %o1] 0x81,	%f19
	nop
	set	0x2D, %l3
	ldub	[%l7 + %l3],	%o0
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	add	%l1,	%g2,	%g5
	nop
	set	0x10, %o5
	std	%f30,	[%l7 + %o5]
	and	%g1,	%i5,	%l4
	nop
	set	0x28, %g4
	stx	%o1,	[%l7 + %g4]
	nop
	set	0x40, %i0
	stw	%i0,	[%l7 + %i0]
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	set	0x20, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i7
	and	%i6,	%i4,	%i1
	set	0x28, %o7
	ldstuba	[%l7 + %o7] 0x88,	%g3
	set	0x38, %i4
	lda	[%l7 + %i4] 0x80,	%f5
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x38, %i5
	stxa	%l6,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x70, %i1
	stw	%o6,	[%l7 + %i1]
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xe2,	%o4
	add	%g6,	%i3,	%l3
	nop
	set	0x38, %i3
	swap	[%l7 + %i3],	%g4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%l2
	nop
	set	0x5C, %i7
	ldsh	[%l7 + %i7],	%i2
	set	0x08, %g7
	stwa	%l0,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x18, %g5
	ldsw	[%l7 + %g5],	%o5
	fpsub32s	%f25,	%f29,	%f13
	set	0x48, %l5
	sta	%f10,	[%l7 + %l5] 0x81
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	and	%o2,	%g7,	%o0
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x89,	%o6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x249, 	%tick_cmpr
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc4
	ld	[%l7 + 0x70],	%f27
	st	%f8,	[%l7 + 0x28]
	nop
	set	0x70, %l2
	ldstub	[%l7 + %l2],	%g1
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%g4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%i4
	nop
	set	0x50, %g6
	std	%o0,	[%l7 + %g6]
	set	0x16, %l1
	ldstuba	[%l7 + %l1] 0x81,	%i0
	nop
	set	0x37, %l4
	ldub	[%l7 + %l4],	%o3
	st	%f4,	[%l7 + 0x50]
	set	0x3E, %o1
	stha	%i7,	[%l7 + %o1] 0x89
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x78, %g1
	std	%f2,	[%l7 + %g1]
	and	%l4,	%i6,	%i1
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xe3,	%i4
	nop
	set	0x24, %l3
	ldstub	[%l7 + %l3],	%g3
	set	0x2C, %g4
	stwa	%o6,	[%l7 + %g4] 0x81
	nop
	nop
	setx	0xD960F766E6BDB1F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x153CCE08DBED8E3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f20
	set	0x58, %i0
	swapa	[%l7 + %i0] 0x89,	%o4
	add	%g6,	%i3,	%l3
	nop
	set	0x44, %l0
	lduh	[%l7 + %l0],	%l6
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%g4
	set	0x7D, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l5
	add	%i2,	%l0,	%o5
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xe3,	%o2
	set	0x78, %g3
	stba	%l2,	[%l7 + %g3] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%o7
	and	%g7,	%g2,	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%g5
	fpadd32s	%f28,	%f4,	%f15
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc4
	nop
	set	0x54, %l6
	ldub	[%l7 + %l6],	%i5
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf9
	membar	#Sync
	and	%i0,	%o3,	%o1
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x89,	%f7
	set	0x32, %i5
	stha	%l4,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x3F, %i7
	ldsb	[%l7 + %i7],	%i7
	or	%i1,	%i6,	%i4
	set	0x4C, %g7
	lda	[%l7 + %g7] 0x80,	%f20
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	or	%g6,	%i3,	%o6
	nop
	set	0x60, %g5
	stb	%l3,	[%l7 + %g5]
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x80,	%l6
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%g4
	set	0x74, %i2
	swapa	[%l7 + %i2] 0x81,	%i2
	or	%l0,	%o5,	%o2
	set	0x39, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l2
	nop
	set	0x26, %g2
	lduh	[%l7 + %g2],	%o0
	ld	[%l7 + 0x50],	%f28
	nop
	set	0x28, %o6
	stw	%l5,	[%l7 + %o6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%g7
	nop
	set	0x60, %g6
	sth	%g2,	[%l7 + %g6]
	ld	[%l7 + 0x70],	%f0
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%g0
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f8
	set	0x7A, %o1
	stha	%g5,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x27, %g1
	ldstub	[%l7 + %g1],	%i5
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xe3,	%i0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f16
	or	%l1,	%o3,	%l4
	nop
	set	0x1C, %o5
	stw	%o1,	[%l7 + %o5]
	nop
	set	0x48, %l3
	ldx	[%l7 + %l3],	%i1
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf1,	%f16
	nop
	set	0x3D, %g4
	ldsb	[%l7 + %g4],	%i6
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x0C, %o7
	stw	%i7,	[%l7 + %o7]
	or	%g3,	%i4,	%g6
	nop
	set	0x2A, %i4
	stb	%o4,	[%l7 + %i4]
	nop
	set	0x44, %o2
	lduw	[%l7 + %o2],	%o6
	nop
	set	0x3C, %i1
	lduw	[%l7 + %i1],	%l3
	nop
	set	0x22, %l6
	lduh	[%l7 + %l6],	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%i2
	set	0x7C, %g3
	lda	[%l7 + %g3] 0x80,	%f11
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l0
	nop
	set	0x20, %i5
	std	%f22,	[%l7 + %i5]
	set	0x0C, %o4
	stba	%o5,	[%l7 + %o4] 0x80
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x81,	%o2
	nop
	set	0x44, %g5
	swap	[%l7 + %g5],	%l2
	nop
	set	0x16, %g7
	ldsh	[%l7 + %g7],	%o0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x5C, %l5
	ldsw	[%l7 + %l5],	%i3
	nop
	set	0x69, %i2
	ldsb	[%l7 + %i2],	%o7
	nop
	set	0x0C, %l2
	stw	%l5,	[%l7 + %l2]
	st	%f14,	[%l7 + 0x08]
	nop
	set	0x71, %i6
	ldstub	[%l7 + %i6],	%g7
	nop
	set	0x08, %o6
	swap	[%l7 + %o6],	%g1
	set	0x6C, %g2
	sta	%f4,	[%l7 + %g2] 0x88
	nop
	set	0x3C, %o3
	swap	[%l7 + %o3],	%g2
	set	0x5D, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g5
	set	0x70, %o1
	stda	%i4,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xe2,	%i0
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x81,	 2
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%l4
	wr	%o3,	%o1,	%y
	set	0x2F, %o0
	stba	%i6,	[%l7 + %o0] 0x80
	nop
	set	0x18, %o5
	stw	%i1,	[%l7 + %o5]
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%i6
	nop
	set	0x2C, %g4
	prefetch	[%l7 + %g4],	 4
	add	%g3,	%g6,	%o4
	nop
	set	0x5A, %l3
	sth	%i4,	[%l7 + %l3]
	nop
	set	0x44, %l0
	lduw	[%l7 + %l0],	%o6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l3
	or	%g4,	%i2,	%o5
	add	%o2,	%l0,	%l2
	set	0x6E, %o7
	stha	%o0,	[%l7 + %o7] 0xe3
	membar	#Sync
	ld	[%l7 + 0x6C],	%f5
	nop
	set	0x40, %o2
	std	%i2,	[%l7 + %o2]
	and	%l5,	%o7,	%g1
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x80,	 2
	set	0x70, %i1
	stda	%g2,	[%l7 + %i1] 0x88
	nop
	set	0x24, %g3
	ldub	[%l7 + %g3],	%i5
	and	%i0,	%g5,	%l1
	nop
	set	0x2D, %l6
	ldsb	[%l7 + %l6],	%o3
	nop
	set	0x08, %i5
	std	%f26,	[%l7 + %i5]
	set	0x66, %o4
	stha	%l4,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x68, %i7
	stxa	%o1,	[%l7 + %i7] 0x81
	nop
	set	0x31, %g5
	ldsb	[%l7 + %g5],	%i6
	nop
	set	0x6C, %g7
	sth	%i7,	[%l7 + %g7]
	wr 	%g0, 	0x6, 	%fprs
	set	0x62, %i3
	stha	%g6,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f4
	or	%o4,	%o6,	%i4
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%l3
	set	0x7D, %o6
	stba	%l6,	[%l7 + %o6] 0xea
	membar	#Sync
	fpadd32s	%f2,	%f0,	%f27
	nop
	set	0x64, %g2
	ldsh	[%l7 + %g2],	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o5
	ble,pn	%xcc,	loop_75
	and	%l0,	%o2,	%o0
	nop
	set	0x7E, %o3
	ldsh	[%l7 + %o3],	%i3
	set	0x38, %l2
	sta	%f12,	[%l7 + %l2] 0x89
loop_75:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%l5
	set	0x24, %o1
	lda	[%l7 + %o1] 0x89,	%f1
	add	%o7,	%g1,	%g2
	set	0x6F, %l4
	stba	%g7,	[%l7 + %l4] 0x89
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x88
	nop
	set	0x32, %l1
	ldub	[%l7 + %l1],	%i5
	nop
	set	0x44, %g1
	stw	%i0,	[%l7 + %g1]
	set	0x70, %o5
	stxa	%l1,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd2
	nop
	set	0x08, %i0
	ldstub	[%l7 + %i0],	%o3
	set	0x54, %g4
	stwa	%l4,	[%l7 + %g4] 0x89
	st	%f4,	[%l7 + 0x64]
	fpsub16	%f24,	%f22,	%f0
	nop
	set	0x36, %l3
	ldsh	[%l7 + %l3],	%o1
	set	0x08, %l0
	stxa	%i6,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%g4
	st	%f16,	[%l7 + 0x68]
	set	0x42, %i4
	stha	%g3,	[%l7 + %i4] 0x80
	fpadd16s	%f11,	%f20,	%f6
	nop
	set	0x30, %i1
	ldsh	[%l7 + %i1],	%i7
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x88
	ld	[%l7 + 0x14],	%f13
	set	0x6A, %o7
	stba	%g6,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x81,	%i0
	set	0x38, %o4
	stda	%o6,	[%l7 + %o4] 0x80
	ld	[%l7 + 0x60],	%f29
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f0
	nop
	set	0x40, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x28, %g7
	stx	%o4,	[%l7 + %g7]
	set	0x74, %i3
	swapa	[%l7 + %i3] 0x89,	%l3
	set	0x08, %l5
	sta	%f16,	[%l7 + %l5] 0x88
	nop
	set	0x7E, %l6
	ldsh	[%l7 + %l6],	%l6
	set	0x34, %i2
	stwa	%i2,	[%l7 + %i2] 0xe2
	membar	#Sync
	st	%f26,	[%l7 + 0x30]
	nop
	set	0x10, %i6
	stx	%i4,	[%l7 + %i6]
	fpsub16s	%f23,	%f2,	%f19
	nop
	set	0x2C, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x81,	%o5
	st	%f25,	[%l7 + 0x60]
	nop
	set	0x0C, %o3
	ldub	[%l7 + %o3],	%l0
	and	%o2,	%g4,	%o0
	nop
	set	0x68, %o1
	ldsh	[%l7 + %o1],	%l2
	set	0x24, %l4
	lda	[%l7 + %l4] 0x80,	%f7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%i3
	fpsub16s	%f25,	%f6,	%f15
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%g0
	nop
	set	0x18, %l1
	std	%g2,	[%l7 + %l1]
	ble,pt	%icc,	loop_76
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%o7
	set	0x18, %o5
	stda	%g6,	[%l7 + %o5] 0x88
loop_76:
	nop
	set	0x40, %o0
	ldsh	[%l7 + %o0],	%i0
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x88,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%l4
	nop
	set	0x0A, %g4
	lduh	[%l7 + %g4],	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%g5
	ld	[%l7 + 0x60],	%f22
	set	0x54, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g3
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	set	0x5C, %l0
	lda	[%l7 + %l0] 0x81,	%f24
	nop
	set	0x0B, %i4
	ldub	[%l7 + %i4],	%i7
	nop
	set	0x28, %i1
	std	%f10,	[%l7 + %i1]
	nop
	set	0x7E, %o2
	ldstub	[%l7 + %o2],	%g6
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x12, %i5
	lduh	[%l7 + %i5],	%i1
	nop
	set	0x10, %o4
	std	%f24,	[%l7 + %o4]
	set	0x6C, %i7
	sta	%f18,	[%l7 + %i7] 0x88
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%l6
	fpsub16s	%f30,	%f16,	%f21
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x80,	%i2
	nop
	set	0x52, %i3
	sth	%i4,	[%l7 + %i3]
	nop
	set	0x20, %g5
	stx	%o5,	[%l7 + %g5]
	ld	[%l7 + 0x74],	%f12
	nop
	set	0x44, %l6
	swap	[%l7 + %l6],	%l3
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%l0
	set	0x68, %l5
	swapa	[%l7 + %l5] 0x88,	%o2
	nop
	set	0x7B, %o6
	stb	%o0,	[%l7 + %o6]
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x80,	 1
	fpsub16	%f12,	%f22,	%f18
	nop
	set	0x1C, %g2
	ldstub	[%l7 + %g2],	%l5
	or	%i3,	%l2,	%g2
	set	0x48, %o3
	stxa	%o7,	[%l7 + %o3] 0x89
	set	0x78, %o1
	lda	[%l7 + %o1] 0x81,	%f7
	nop
	set	0x10, %l4
	prefetch	[%l7 + %l4],	 4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%i0
	nop
	set	0x24, %l1
	ldsw	[%l7 + %l1],	%l1
	set	0x54, %g6
	stba	%g1,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x68, %l2
	std	%l4,	[%l7 + %l2]
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f28
	fpadd32s	%f10,	%f9,	%f0
	set	0x48, %i0
	stxa	%i5,	[%l7 + %i0] 0x88
	nop
	set	0x44, %o0
	stw	%o3,	[%l7 + %o0]
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x80,	 4
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	nop
	set	0x30, %l3
	stx	%g3,	[%l7 + %l3]
	and	%g5,	%i6,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%i1
	or	%o4,	%o6,	%l6
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f10
	set	0x1A, %i1
	stha	%i4,	[%l7 + %i1] 0x81
	nop
	set	0x1C, %i4
	ldsb	[%l7 + %i4],	%i2
	fpsub32s	%f30,	%f27,	%f31
	and	%o5,	%l3,	%l0
	nop
	set	0x38, %g3
	stx	%o0,	[%l7 + %g3]
	nop
	set	0x0C, %o2
	lduw	[%l7 + %o2],	%g4
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%f26
	nop
	set	0x60, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x0F, %o7
	stb	%o2,	[%l7 + %o7]
	nop
	set	0x48, %i7
	stx	%i3,	[%l7 + %i7]
	nop
	set	0x57, %g7
	ldsb	[%l7 + %g7],	%l5
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x88,	%l2
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
	set	0x64, %i2
	ldstuba	[%l7 + %i2] 0x81,	%g2
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%g6
	nop
	set	0x3F, %l6
	ldstub	[%l7 + %l6],	%o7
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%l1
	nop
	set	0x2C, %g2
	ldsb	[%l7 + %g2],	%i0
	nop
	set	0x44, %i6
	lduh	[%l7 + %i6],	%g1
	nop
	set	0x7C, %o3
	lduw	[%l7 + %o3],	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%g6
	nop
	set	0x70, %o1
	stw	%i7,	[%l7 + %o1]
	set	0x51, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i6
	set	0x0C, %l1
	stba	%i1,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x34, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o4
	nop
	set	0x34, %o5
	stw	%o6,	[%l7 + %o5]
	nop
	set	0x7C, %l2
	swap	[%l7 + %l2],	%l6
	and	%i4,	%o5,	%i2
	wr	%l0,	%o0,	%pic
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x80,	%g4
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xd8
	set	0x64, %i0
	stba	%l3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f6
	nop
	set	0x1B, %l0
	ldstub	[%l7 + %l0],	%o2
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x80,	%i3
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%l5
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f20
	and	%o7,	%l1,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%i0
	or	%i5,	%o1,	%l4
	nop
	set	0x70, %i4
	ldsh	[%l7 + %i4],	%g3
	nop
	set	0x20, %i5
	prefetch	[%l7 + %i5],	 3
	and	%g5,	%o3,	%i7
	nop
	set	0x1C, %o4
	swap	[%l7 + %o4],	%i6
	bg,a,pn	%icc,	loop_77
	nop
	set	0x40, %o2
	ldstub	[%l7 + %o2],	%g6
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%o4
	set	0x4C, %i7
	stba	%i1,	[%l7 + %i7] 0xe3
	membar	#Sync
loop_77:
	nop
	set	0x54, %i3
	stwa	%l6,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	set	0x10, %i2
	stwa	%o6,	[%l7 + %i2] 0x88
	set	0x37, %l5
	ldstuba	[%l7 + %l5] 0x81,	%i4
	nop
	set	0x64, %l6
	ldsw	[%l7 + %l6],	%i2
	nop
	set	0x43, %o6
	ldsb	[%l7 + %o6],	%l0
	ld	[%l7 + 0x14],	%f0
	set	0x48, %g2
	lda	[%l7 + %g2] 0x80,	%f12
	set	0x78, %g5
	stda	%o4,	[%l7 + %g5] 0x80
	nop
	set	0x63, %o3
	ldsb	[%l7 + %o3],	%g4
	nop
	set	0x38, %i6
	stx	%o0,	[%l7 + %i6]
	nop
	set	0x28, %l4
	swap	[%l7 + %l4],	%l3
	set	0x20, %l1
	ldda	[%l7 + %l1] 0xe2,	%o2
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f26
	set	0x60, %o5
	sta	%f13,	[%l7 + %o5] 0x88
	set	0x60, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l5
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	nop
	set	0x30, %g4
	prefetch	[%l7 + %g4],	 0
	nop
	set	0x0A, %g6
	lduh	[%l7 + %g6],	%l2
	set	0x08, %l3
	stxa	%i3,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x70, %i0
	stxa	%g7,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x0C, %i1
	stwa	%l1,	[%l7 + %i1] 0x88
	nop
	set	0x6C, %g1
	prefetch	[%l7 + %g1],	 3
	bn,a	%xcc,	loop_78
	nop
	set	0x18, %l0
	ldsh	[%l7 + %l0],	%o7
	nop
	set	0x1E, %g3
	sth	%g2,	[%l7 + %g3]
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
loop_78:
	and	%g1,	%i0,	%i5
	nop
	set	0x7E, %o4
	ldsh	[%l7 + %o4],	%o1
	nop
	set	0x10, %o2
	std	%g2,	[%l7 + %o2]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f0
	ble	%icc,	loop_79
	wr	%g5,	%o3,	%pic
	set	0x38, %i4
	stda	%l4,	[%l7 + %i4] 0xeb
	membar	#Sync
loop_79:
	add	%i6,	%i7,	%o4
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf1
	membar	#Sync
	nop
	set	0x78, %i7
	stx	%i1,	[%l7 + %i7]
	st	%f19,	[%l7 + 0x1C]
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f30
	fpsub16s	%f1,	%f11,	%f16
	set	0x1C, %l5
	stwa	%g6,	[%l7 + %l5] 0xeb
	membar	#Sync
	st	%f19,	[%l7 + 0x34]
	nop
	set	0x48, %l6
	std	%i6,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	nop
	set	0x24, %g2
	ldub	[%l7 + %g2],	%i4
	fpsub16s	%f23,	%f5,	%f18
	nop
	set	0x10, %g5
	std	%f22,	[%l7 + %g5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%l0
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xda
	st	%fsr,	[%l7 + 0x28]
	set	0x30, %i6
	stha	%o5,	[%l7 + %i6] 0x80
	or	%i2,	%o0,	%l3
	nop
	set	0x50, %l4
	lduw	[%l7 + %l4],	%g4
	nop
	set	0x64, %l1
	lduh	[%l7 + %l1],	%o2
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f30
	set	0x78, %o1
	stda	%l2,	[%l7 + %o1] 0x81
	fpadd16s	%f5,	%f11,	%f4
	set	0x2F, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%l1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%l5
	set	0x50, %o0
	swapa	[%l7 + %o0] 0x89,	%g1
	nop
	set	0x48, %o5
	ldx	[%l7 + %o5],	%g2
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%i0
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x80,	%o0
	nop
	set	0x4A, %i0
	sth	%i5,	[%l7 + %i0]
	nop
	set	0x68, %g6
	swap	[%l7 + %g6],	%g3
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%g5
	nop
	set	0x70, %l0
	swap	[%l7 + %l0],	%o3
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%i6
	and	%l4,	%i7,	%i1
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x70, %o4
	swap	[%l7 + %o4],	%i4
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x89,	%o6
	nop
	set	0x12, %o7
	ldstub	[%l7 + %o7],	%l6
	set	0x68, %g3
	stda	%l0,	[%l7 + %g3] 0x80
	wr 	%g0, 	0x5, 	%fprs
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x54, %i3
	swap	[%l7 + %i3],	%o0
	nop
	set	0x4F, %i4
	ldsb	[%l7 + %i4],	%g4
	set	0x51, %i2
	stba	%l3,	[%l7 + %i2] 0x88
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x0C, %i7
	stb	%l2,	[%l7 + %i7]
	set	0x40, %l6
	stwa	%o2,	[%l7 + %l6] 0x81
	or	%g7,	%i3,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g1
	nop
	set	0x50, %l5
	stx	%g2,	[%l7 + %l5]
	add	%i0,	%o7,	%i5
	set	0x59, %g2
	ldstuba	[%l7 + %g2] 0x81,	%o1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%o3
	set	0x58, %g5
	sta	%f3,	[%l7 + %g5] 0x89
	nop
	set	0x44, %o3
	ldsw	[%l7 + %o3],	%i6
	nop
	set	0x0C, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x74, %l4
	ldub	[%l7 + %l4],	%l4
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%g3
	nop
	set	0x0C, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xe3,	%i0
	st	%f18,	[%l7 + 0x70]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd2,	%f0
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%i7
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%g6
	nop
	set	0x47, %g4
	stb	%o6,	[%l7 + %g4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	nop
	set	0x26, %l3
	stb	%l0,	[%l7 + %l3]
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x80,	 4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x81
	nop
	set	0x7C, %i1
	swap	[%l7 + %i1],	%o5
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	st	%f21,	[%l7 + 0x6C]
	or	%o0,	%g4,	%l3
	and	%l2,	%g7,	%o2
	nop
	set	0x40, %i5
	ldstub	[%l7 + %i5],	%l1
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x88,	%l5
	bne,pn	%icc,	loop_80
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%g1
	set	0x1B, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i3
loop_80:
	nop
	set	0x28, %g3
	stwa	%i0,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%o1,	%o7,	%g5
	nop
	set	0x50, %i3
	stw	%i6,	[%l7 + %i3]
	nop
	set	0x10, %o7
	ldub	[%l7 + %o7],	%l4
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x88,	%o2
	nop
	set	0x5E, %i7
	ldsb	[%l7 + %i7],	%i1
	nop
	set	0x18, %l5
	lduw	[%l7 + %l5],	%i7
	st	%fsr,	[%l7 + 0x58]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xda
	set	0x30, %g5
	stda	%g6,	[%l7 + %g5] 0x81
	set	0x68, %o3
	sta	%f13,	[%l7 + %o3] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%o4
	nop
	set	0x58, %o6
	std	%f2,	[%l7 + %o6]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f16
	nop
	set	0x54, %l4
	lduw	[%l7 + %l4],	%l6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
	ld	[%l7 + 0x0C],	%f8
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f0
	and	%i4,	%i2,	%l0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%o4
	st	%f24,	[%l7 + 0x2C]
	bg,a,pn	%xcc,	loop_81
	add	%g4,	%l3,	%l2
	nop
	set	0x0C, %o0
	ldsh	[%l7 + %o0],	%g7
	set	0x38, %g4
	stwa	%o2,	[%l7 + %g4] 0xea
	membar	#Sync
loop_81:
	nop
	set	0x78, %l2
	stx	%o0,	[%l7 + %l2]
	ld	[%l7 + 0x64],	%f25
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x80,	%l1
	nop
	set	0x38, %l3
	std	%l4,	[%l7 + %l3]
	set	0x49, %i0
	stba	%g1,	[%l7 + %i0] 0x81
	nop
	set	0x14, %g6
	ldsw	[%l7 + %g6],	%i0
	bleu,a	%xcc,	loop_82
	or	%i3,	%g2,	%i5
	nop
	set	0x38, %l0
	stx	%o7,	[%l7 + %l0]
	nop
	set	0x20, %i5
	lduw	[%l7 + %i5],	%g5
loop_82:
	nop
	set	0x73, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i6
	bn,pn	%icc,	loop_83
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x81,	%l4
loop_83:
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%o1
	nop
	set	0x5A, %i3
	sth	%g3,	[%l7 + %i3]
	or	%i1,	%o3,	%i7
	nop
	set	0x66, %o7
	lduh	[%l7 + %o7],	%g6
	set	0x5A, %g3
	stha	%o6,	[%l7 + %g3] 0x80
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc2
	wr 	%g0, 	0x7, 	%fprs
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%l0
	set	0x62, %i4
	stba	%o5,	[%l7 + %i4] 0x81
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	ld	[%l7 + 0x10],	%f29
	set	0x18, %l5
	swapa	[%l7 + %l5] 0x80,	%g4
	nop
	set	0x20, %g2
	std	%l2,	[%l7 + %g2]
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x88,	%i4
	nop
	set	0x3C, %o3
	swap	[%l7 + %o3],	%g7
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%l2
	nop
	set	0x50, %o6
	lduh	[%l7 + %o6],	%o0
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%o2
	nop
	set	0x4C, %i6
	swap	[%l7 + %i6],	%l1
	be,pt	%xcc,	loop_84
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	fpsub32s	%f21,	%f12,	%f6
	set	0x60, %l1
	stda	%g0,	[%l7 + %l1] 0x80
loop_84:
	nop
	set	0x7A, %o1
	sth	%l5,	[%l7 + %o1]
	nop
	set	0x34, %o0
	swap	[%l7 + %o0],	%i3
	ld	[%l7 + 0x44],	%f19
	nop
	set	0x5E, %g4
	ldsh	[%l7 + %g4],	%i0
	set	0x38, %l2
	stxa	%g2,	[%l7 + %l2] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%g5
	nop
	set	0x0C, %l3
	swap	[%l7 + %l3],	%i6
	nop
	set	0x24, %i0
	ldsw	[%l7 + %i0],	%o7
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%o1
	add	%l4,	%g3,	%i1
	nop
	set	0x30, %g6
	std	%o2,	[%l7 + %g6]
	nop
	set	0x60, %l0
	std	%f12,	[%l7 + %l0]
	nop
	set	0x08, %i1
	stx	%g6,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i7
	nop
	set	0x76, %i5
	sth	%l6,	[%l7 + %i5]
	set	0x30, %o4
	stha	%o4,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x50, %i3
	stda	%i2,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%o5
	set	0x30, %o7
	stba	%g4,	[%l7 + %o7] 0xea
	membar	#Sync
	add	%l0,	%i4,	%l3
	set	0x74, %i2
	sta	%f27,	[%l7 + %i2] 0x88
	add	%l2,	%g7,	%o2
	nop
	set	0x0A, %g3
	sth	%o0,	[%l7 + %g3]
	nop
	set	0x38, %i7
	stb	%l1,	[%l7 + %i7]
	nop
	set	0x27, %i4
	ldub	[%l7 + %i4],	%l5
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x88,	%i3
	set	0x26, %g5
	stba	%i0,	[%l7 + %g5] 0x80
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xea,	%g2
	fpsub32s	%f7,	%f8,	%f23
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x10, %o6
	ldsh	[%l7 + %o6],	%i5
	nop
	set	0x38, %l6
	std	%f6,	[%l7 + %l6]
	st	%f22,	[%l7 + 0x60]
	set	0x20, %i6
	swapa	[%l7 + %i6] 0x81,	%g5
	set	0x40, %l4
	sta	%f27,	[%l7 + %l4] 0x81
	set	0x60, %l1
	stwa	%i6,	[%l7 + %l1] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%o1
	set	0x0B, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o7
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%i1
	nop
	set	0x56, %g4
	ldsh	[%l7 + %g4],	%o3
	or	%o6,	%i7,	%g6
	and	%o4,	%i2,	%o5
	ld	[%l7 + 0x6C],	%f5
	nop
	set	0x62, %o0
	ldub	[%l7 + %o0],	%l6
	nop
	set	0x38, %l3
	lduw	[%l7 + %l3],	%g4
	set	0x5C, %i0
	swapa	[%l7 + %i0] 0x81,	%l0
	set	0x39, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i4
	and	%l2,	%l3,	%o2
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x88,	%o0
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	nop
	set	0x50, %o5
	std	%l4,	[%l7 + %o5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%i0
	nop
	set	0x08, %i1
	stx	%fsr,	[%l7 + %i1]
	or	%g7,	%g2,	%i5
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x48, %i5
	std	%i6,	[%l7 + %i5]
	set	0x6A, %g1
	stha	%g5,	[%l7 + %g1] 0xe3
	membar	#Sync
	or	%g1,	%o7,	%o1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%i1
	nop
	set	0x78, %o4
	std	%f14,	[%l7 + %o4]
	st	%f3,	[%l7 + 0x0C]
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l4
	and	%o6,	%i7,	%o3
	fpsub16s	%f10,	%f12,	%f18
	add	%g6,	%o4,	%o5
	set	0x0E, %o2
	stha	%i2,	[%l7 + %o2] 0x89
	nop
	set	0x30, %i2
	stw	%l6,	[%l7 + %i2]
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x7F, %g3
	stb	%l0,	[%l7 + %g3]
	nop
	set	0x68, %i4
	stw	%g4,	[%l7 + %i4]
	nop
	nop
	setx	0xE20A22AA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x3F9EBCC7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f14,	%f18
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%l2
	fpadd16s	%f26,	%f21,	%f14
	or	%i4,	%l3,	%o0
	fpsub16	%f6,	%f28,	%f10
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x32, %o3
	stba	%l1,	[%l7 + %o3] 0x89
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%i3
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f30
	set	0x18, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	nop
	set	0x08, %g2
	lduw	[%l7 + %g2],	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%i5
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	nop
	set	0x78, %l4
	sth	%g5,	[%l7 + %l4]
	nop
	set	0x16, %l1
	stb	%g7,	[%l7 + %l1]
	nop
	set	0x7E, %o1
	ldsh	[%l7 + %o1],	%g1
	nop
	set	0x48, %g7
	stx	%o7,	[%l7 + %g7]
	set	0x20, %g4
	stwa	%g3,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x08, %o0
	ldstuba	[%l7 + %o0] 0x80,	%i1
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x6C]
	st	%f21,	[%l7 + 0x1C]
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x81,	%l4
	nop
	set	0x48, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	bleu,a	%icc,	loop_85
	nop
	set	0x3C, %l0
	swap	[%l7 + %l0],	%o1
	set	0x5A, %g6
	stha	%o3,	[%l7 + %g6] 0x80
loop_85:
	nop
	set	0x2E, %i1
	ldsh	[%l7 + %i1],	%g6
	set	0x58, %o5
	stha	%o4,	[%l7 + %o5] 0x81
	nop
	set	0x26, %i5
	ldstub	[%l7 + %i5],	%o5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc0
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc2
	fpadd16s	%f23,	%f29,	%f15
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f8
	nop
	set	0x5C, %o2
	lduw	[%l7 + %o2],	%i7
	nop
	set	0x24, %i2
	stw	%i2,	[%l7 + %i2]
	nop
	set	0x60, %g3
	std	%i6,	[%l7 + %g3]
	set	0x38, %o7
	stwa	%g4,	[%l7 + %o7] 0x80
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	nop
	set	0x1E, %i7
	ldub	[%l7 + %i7],	%i4
	wr	%l2,	%o0,	%sys_tick
	set	0x68, %o3
	sta	%f16,	[%l7 + %o3] 0x89
	nop
	set	0x70, %g5
	stx	%l3,	[%l7 + %g5]
	set	0x4B, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o2
	nop
	set	0x0E, %l5
	lduh	[%l7 + %l5],	%l1
	nop
	set	0x24, %g2
	lduh	[%l7 + %g2],	%i0
	nop
	set	0x72, %l6
	ldsh	[%l7 + %l6],	%l5
	nop
	set	0x4F, %l1
	ldsb	[%l7 + %l1],	%i3
	nop
	set	0x5B, %o1
	ldstub	[%l7 + %o1],	%i5
	ld	[%l7 + 0x18],	%f7
	nop
	set	0x44, %g7
	ldsw	[%l7 + %g7],	%g2
	and	%i6,	%g5,	%g7
	nop
	set	0x46, %g4
	ldsh	[%l7 + %g4],	%g1
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%o6
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x89,	%f12
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%o1
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	wr	%g6,	%o3,	%sys_tick
	nop
	set	0x62, %l0
	ldub	[%l7 + %l0],	%o5
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 0
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l6
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	st	%f8,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x68, %i5
	stx	%l0,	[%l7 + %i5]
	set	0x08, %i6
	lda	[%l7 + %i6] 0x81,	%f11
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%i4
	set	0x48, %g1
	sta	%f20,	[%l7 + %g1] 0x89
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f16
	set	0x7C, %i2
	stwa	%g4,	[%l7 + %i2] 0x89
	fpsub16	%f30,	%f18,	%f28
	set	0x20, %g3
	stda	%o0,	[%l7 + %g3] 0x89
	set	0x48, %o7
	lda	[%l7 + %o7] 0x88,	%f26
	nop
	set	0x34, %o2
	stw	%l2,	[%l7 + %o2]
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f26
	nop
	set	0x48, %i4
	std	%o2,	[%l7 + %i4]
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%l1
	set	0x0B, %o3
	stba	%i0,	[%l7 + %o3] 0xe2
	membar	#Sync
	and	%l5,	%l3,	%i5
	set	0x20, %o6
	stda	%i2,	[%l7 + %o6] 0xeb
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%i6
	st	%fsr,	[%l7 + 0x44]
	bl,a	%xcc,	loop_86
	nop
	set	0x08, %l5
	stx	%g7,	[%l7 + %l5]
	set	0x70, %g2
	stda	%g4,	[%l7 + %g2] 0xe3
	membar	#Sync
loop_86:
	nop
	set	0x28, %l1
	stxa	%g3,	[%l7 + %l1] 0x81
	ba	%icc,	loop_87
	bg,pt	%xcc,	loop_88
	nop
	set	0x58, %l6
	std	%i0,	[%l7 + %l6]
	set	0x5E, %g7
	stha	%o7,	[%l7 + %g7] 0xea
	membar	#Sync
loop_87:
	nop
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
loop_88:
	nop
	set	0x40, %o1
	sta	%f15,	[%l7 + %o1] 0x81
	nop
	set	0x62, %l4
	sth	%g1,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x54, %o0
	ldsh	[%l7 + %o0],	%o6
	and	%o1,	%g6,	%o3
	bleu	%icc,	loop_89
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	ld	[%l7 + 0x18],	%f19
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x88,	%o5
loop_89:
	and	%i7,	%i2,	%l4
	set	0x14, %l0
	sta	%f27,	[%l7 + %l0] 0x88
	nop
	set	0x52, %g6
	ldsh	[%l7 + %g6],	%o4
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
	nop
	set	0x5E, %i1
	ldstub	[%l7 + %i1],	%l6
	or	%i4,	%l0,	%o0
	set	0x20, %i5
	stda	%g4,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x78, %i6
	stxa	%o2,	[%l7 + %i6] 0x81
	nop
	set	0x58, %o5
	std	%f12,	[%l7 + %o5]
	nop
	set	0x30, %g1
	std	%f20,	[%l7 + %g1]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc4
	st	%fsr,	[%l7 + 0x4C]
	set	0x6E, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd0,	%f16
	set	0x24, %g3
	stha	%l2,	[%l7 + %g3] 0xe3
	membar	#Sync
	fpsub32	%f18,	%f22,	%f8
	set	0x6C, %o2
	stwa	%l5,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x10, %i7
	lduw	[%l7 + %i7],	%i0
	nop
	set	0x40, %i4
	std	%f14,	[%l7 + %i4]
	set	0x27, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i5
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x80,	%i3
	set	0x16, %o3
	stha	%g2,	[%l7 + %o3] 0xe3
	membar	#Sync
	fpadd16s	%f20,	%f19,	%f14
	ld	[%l7 + 0x50],	%f28
	nop
	set	0x7A, %l5
	ldstub	[%l7 + %l5],	%l3
	ld	[%l7 + 0x24],	%f9
	set	0x5B, %o6
	ldstuba	[%l7 + %o6] 0x88,	%i6
	or	%g5,	%g7,	%g3
	nop
	set	0x43, %l1
	ldsb	[%l7 + %l1],	%o7
	set	0x70, %g2
	stda	%i0,	[%l7 + %g2] 0x89
	nop
	set	0x10, %l6
	stx	%o6,	[%l7 + %l6]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f0
	set	0x3D, %o1
	stba	%g1,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x1B, %l4
	ldsb	[%l7 + %l4],	%o1
	set	0x74, %g4
	lda	[%l7 + %g4] 0x81,	%f23
	nop
	set	0x20, %i0
	sth	%g6,	[%l7 + %i0]
	nop
	set	0x63, %l3
	ldub	[%l7 + %l3],	%o3
	nop
	set	0x6D, %l0
	ldstub	[%l7 + %l0],	%i7
	or	%o5,	%l4,	%o4
	set	0x16, %g6
	stha	%i2,	[%l7 + %g6] 0x81
	nop
	set	0x74, %o0
	ldsh	[%l7 + %o0],	%l6
	st	%f27,	[%l7 + 0x1C]
	nop
	set	0x29, %l2
	ldub	[%l7 + %l2],	%l0
	nop
	set	0x23, %i1
	ldstub	[%l7 + %i1],	%i4
	set	0x69, %i6
	stba	%o0,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x1F, %i5
	stb	%g4,	[%l7 + %i5]
	set	0x30, %g1
	stda	%l0,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x21, %o4
	ldsb	[%l7 + %o4],	%o2
	ld	[%l7 + 0x28],	%f1
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%l5
	nop
	set	0x1E, %i3
	stb	%l2,	[%l7 + %i3]
	nop
	set	0x08, %g3
	stx	%i0,	[%l7 + %g3]
	nop
	set	0x58, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x81,	%i3
	nop
	set	0x40, %i7
	std	%f0,	[%l7 + %i7]
	set	0x14, %o7
	stwa	%g2,	[%l7 + %o7] 0x89
	set	0x46, %g5
	stha	%l3,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%i6
	nop
	set	0x62, %l5
	lduh	[%l7 + %l5],	%g5
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x80,	%g7
	nop
	set	0x6C, %i4
	ldub	[%l7 + %i4],	%g3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f0
	nop
	set	0x60, %l6
	stx	%i5,	[%l7 + %l6]
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f4
	nop
	set	0x58, %o1
	ldx	[%l7 + %o1],	%o7
	set	0x14, %l1
	stwa	%o6,	[%l7 + %l1] 0xea
	membar	#Sync
	or	%g1,	%i1,	%g6
	and	%o3,	%o1,	%i7
	nop
	set	0x18, %g4
	stw	%o5,	[%l7 + %g4]
	nop
	set	0x58, %l4
	lduw	[%l7 + %l4],	%o4
	nop
	set	0x54, %l3
	stw	%l4,	[%l7 + %l3]
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x4B, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f16
	set	0x5C, %o0
	stha	%l6,	[%l7 + %o0] 0xeb
	membar	#Sync
	ld	[%l7 + 0x24],	%f13
	set	0x38, %l2
	stda	%l0,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x36, %i6
	lduh	[%l7 + %i6],	%o0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf9
	membar	#Sync
	set	0x30, %i5
	stwa	%i4,	[%l7 + %i5] 0xe3
	membar	#Sync
	and	%g4,	%l1,	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%i0
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%i3
	st	%fsr,	[%l7 + 0x1C]
	fpadd32s	%f8,	%f3,	%f16
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xd8
	nop
	set	0x08, %o4
	ldub	[%l7 + %o4],	%l5
	st	%f16,	[%l7 + 0x14]
	nop
	set	0x2C, %g3
	ldsw	[%l7 + %g3],	%l3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1231
!	Type a   	: 34
!	Type cti   	: 27
!	Type x   	: 534
!	Type f   	: 51
!	Type i   	: 123
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 4 Start
!
.global thread_4
thread_4:
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
	set	0x3,	%g1
	set	0xE,	%g2
	set	0x7,	%g3
	set	0x3,	%g4
	set	0x5,	%g5
	set	0x0,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x9,	%i1
	set	-0x2,	%i2
	set	-0x9,	%i3
	set	-0xE,	%i4
	set	-0xD,	%i5
	set	-0xB,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x2D6425DB,	%l0
	set	0x315D1346,	%l1
	set	0x2EDD41B1,	%l2
	set	0x2471DE2D,	%l3
	set	0x6641F31D,	%l4
	set	0x0BCF04ED,	%l5
	set	0x3C828D6D,	%l6
	!# Output registers
	set	0x0D61,	%o0
	set	-0x0E2C,	%o1
	set	-0x10EA,	%o2
	set	-0x005E,	%o3
	set	0x0F00,	%o4
	set	0x0EB5,	%o5
	set	-0x0C12,	%o6
	set	0x1825,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%i6
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%g5
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc4
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%g6
	nop
	set	0x31, %o7
	ldstub	[%l7 + %o7],	%i5
	nop
	set	0x7A, %g5
	ldub	[%l7 + %g5],	%o7
	set	0x60, %o3
	lda	[%l7 + %o3] 0x80,	%f18
	nop
	set	0x2C, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x1C, %o2
	lda	[%l7 + %o2] 0x88,	%f16
	or	%g3,	%g1,	%o6
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	nop
	set	0x46, %g2
	stb	%o3,	[%l7 + %g2]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%o1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%o4
	nop
	set	0x08, %i4
	std	%l4,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x7A, %l6
	ldub	[%l7 + %l6],	%i7
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xeb,	%i6
	ld	[%l7 + 0x2C],	%f31
	nop
	set	0x70, %o1
	std	%l0,	[%l7 + %o1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%i2
	and	%g4,	%l1,	%i4
	nop
	set	0x40, %g4
	std	%f30,	[%l7 + %g4]
	nop
	set	0x6C, %l1
	ldstub	[%l7 + %l1],	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%i3
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l3
	or	%i6,	%g2,	%g7
	or	%g5,	%i5,	%g3
	nop
	set	0x50, %l3
	std	%f8,	[%l7 + %l3]
	nop
	set	0x30, %g6
	std	%f0,	[%l7 + %g6]
	set	0x38, %l0
	lda	[%l7 + %l0] 0x80,	%f29
	or	%g1,	%o6,	%i1
	wr	%o7,	%g6,	%y
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x08, %l2
	stha	%o3,	[%l7 + %l2] 0x81
	nop
	set	0x14, %o0
	lduw	[%l7 + %o0],	%o5
	fpsub32s	%f25,	%f31,	%f26
	set	0x32, %i6
	stba	%o1,	[%l7 + %i6] 0x88
	fpsub16	%f0,	%f16,	%f18
	set	0x58, %i5
	stxa	%l4,	[%l7 + %i5] 0x88
	st	%f15,	[%l7 + 0x38]
	nop
	set	0x22, %g1
	sth	%o4,	[%l7 + %g1]
	nop
	set	0x79, %i1
	stb	%i7,	[%l7 + %i1]
	nop
	set	0x34, %o4
	stw	%l0,	[%l7 + %o4]
	bleu,pn	%icc,	loop_90
	bne	%xcc,	loop_91
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f24
	nop
	set	0x36, %o5
	sth	%l6,	[%l7 + %o5]
loop_90:
	nop
	nop
	setx	0x9D207C0E2FDC489E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x14F39DBFEB4D3803,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f4
loop_91:
	nop
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x89,	%o0
	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x34, %o7
	lduh	[%l7 + %o7],	%i2
	nop
	set	0x6D, %g5
	stb	%l1,	[%l7 + %g5]
	or	%i4,	%g4,	%i0
	bn,a,pn	%xcc,	loop_92
	or	%l2,	%l5,	%o2
	set	0x32, %i7
	stba	%l3,	[%l7 + %i7] 0x81
loop_92:
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%g2
	nop
	set	0x68, %o6
	lduw	[%l7 + %o6],	%i3
	nop
	set	0x0C, %g2
	lduh	[%l7 + %g2],	%g7
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x81
	fpsub16s	%f25,	%f24,	%f1
	nop
	set	0x14, %i4
	ldsh	[%l7 + %i4],	%i5
	nop
	set	0x0C, %l6
	lduh	[%l7 + %l6],	%g5
	set	0x1C, %o1
	swapa	[%l7 + %o1] 0x88,	%g3
	st	%f27,	[%l7 + 0x44]
	set	0x08, %g4
	sta	%f9,	[%l7 + %g4] 0x89
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%g1
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f12
	add	%o7,	%g6,	%o3
	set	0x58, %l1
	stda	%o4,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x3E, %l3
	lduh	[%l7 + %l3],	%o1
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x88,	%l4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f0
	nop
	set	0x28, %i0
	stx	%o4,	[%l7 + %i0]
	set	0x51, %l2
	stba	%i1,	[%l7 + %l2] 0x81
	wr	%l0,	%i7,	%y
	set	0x20, %g6
	lda	[%l7 + %g6] 0x81,	%f15
	nop
	set	0x2C, %o0
	sth	%o0,	[%l7 + %o0]
	set	0x68, %i6
	stha	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%l6
	set	0x2C, %i1
	swapa	[%l7 + %i1] 0x81,	%i4
	st	%f18,	[%l7 + 0x40]
	set	0x40, %g1
	stda	%g4,	[%l7 + %g1] 0x81
	ble,a,pt	%xcc,	loop_93
	nop
	set	0x5F, %o4
	ldstub	[%l7 + %o4],	%l1
	nop
	set	0x08, %g3
	std	%l2,	[%l7 + %g3]
	nop
	set	0x2C, %i2
	swap	[%l7 + %i2],	%l5
loop_93:
	or	%i0,	%l3,	%o2
	and	%i6,	%i3,	%g2
	set	0x50, %i3
	lda	[%l7 + %i3] 0x88,	%f19
	ld	[%l7 + 0x28],	%f27
	nop
	set	0x1A, %o5
	sth	%i5,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	nop
	set	0x2C, %g5
	lduh	[%l7 + %g5],	%g5
	set	0x60, %i7
	stxa	%g3,	[%l7 + %i7] 0xe2
	membar	#Sync
	or	%o6,	%g1,	%g7
	nop
	set	0x08, %o3
	stx	%g6,	[%l7 + %o3]
	add	%o7,	%o5,	%o1
	ld	[%l7 + 0x08],	%f1
	set	0x64, %o2
	stwa	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	add	%o3,	%o4,	%i1
	nop
	set	0x6B, %o6
	ldsb	[%l7 + %o6],	%i7
	nop
	set	0x54, %g2
	prefetch	[%l7 + %g2],	 0
	or	%o0,	%l0,	%i2
	nop
	set	0x0F, %l5
	stb	%i4,	[%l7 + %l5]
	set	0x70, %i4
	sta	%f28,	[%l7 + %i4] 0x80
	and	%g4,	%l1,	%l6
	nop
	set	0x50, %o1
	std	%f14,	[%l7 + %o1]
	and	%l2,	%i0,	%l5
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x80
	nop
	set	0x78, %g4
	prefetch	[%l7 + %g4],	 1
	st	%fsr,	[%l7 + 0x5C]
	fpsub16	%f10,	%f20,	%f4
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%l2
	wr	%o2,	%i6,	%pic
	nop
	set	0x7C, %l3
	ldsw	[%l7 + %l3],	%g2
	or	%i3,	%g5,	%g3
	nop
	set	0x32, %l4
	ldstub	[%l7 + %l4],	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%o6
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x89,	%g6
	and	%o7,	%g7,	%o5
	set	0x60, %l0
	stda	%o0,	[%l7 + %l0] 0x81
	set	0x67, %i0
	stba	%l4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%o4
	set	0x56, %o0
	stha	%i1,	[%l7 + %o0] 0x89
	set	0x54, %i6
	stba	%i7,	[%l7 + %i6] 0x89
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x88,	%o0
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	set	0x10, %i1
	stxa	%i2,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x40, %g1
	ldub	[%l7 + %g1],	%l0
	nop
	set	0x55, %g3
	stb	%g4,	[%l7 + %g3]
	set	0x28, %i2
	ldxa	[%l7 + %i2] 0x88,	%l1
	ld	[%l7 + 0x78],	%f26
	and	%l6,	%l2,	%i0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	set	0x1C, %o4
	stwa	%l5,	[%l7 + %o4] 0x89
	st	%f4,	[%l7 + 0x68]
	nop
	set	0x68, %o7
	stx	%l3,	[%l7 + %o7]
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x80,	%i4
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x89,	%i6
	nop
	set	0x76, %o3
	ldsh	[%l7 + %o3],	%i3
	nop
	set	0x1C, %o6
	sth	%g2,	[%l7 + %o6]
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f20
	nop
	set	0x5E, %l5
	ldsh	[%l7 + %l5],	%g5
	nop
	set	0x6A, %i4
	lduh	[%l7 + %i4],	%i5
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%g3
	nop
	set	0x7E, %l6
	lduh	[%l7 + %l6],	%g1
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x2A, %o1
	stb	%g6,	[%l7 + %o1]
	set	0x44, %l1
	stwa	%o7,	[%l7 + %l1] 0x80
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%o5
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%o0
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%l4
	nop
	set	0x1E, %i0
	lduh	[%l7 + %i0],	%o4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc2
	nop
	set	0x3A, %o0
	ldsh	[%l7 + %o0],	%o6
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f4
	set	0x79, %l2
	ldstuba	[%l7 + %l2] 0x88,	%i1
	nop
	set	0x7D, %i5
	stb	%o0,	[%l7 + %i5]
	nop
	set	0x56, %i1
	lduh	[%l7 + %i1],	%i7
	nop
	set	0x30, %g1
	stb	%o3,	[%l7 + %g1]
	nop
	set	0x2C, %l3
	ldstub	[%l7 + %l3],	%l0
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	wr	%i2,	%g4,	%y
	set	0x50, %g3
	stda	%l0,	[%l7 + %g3] 0xe3
	membar	#Sync
	and	%l2,	%i0,	%l5
	or	%l3,	%i4,	%l6
	set	0x20, %i3
	swapa	[%l7 + %i3] 0x80,	%o2
	nop
	set	0x50, %o7
	ldsh	[%l7 + %o7],	%i6
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%i3
	add	%g2,	%i5,	%g3
	or	%g1,	%g5,	%o7
	nop
	set	0x38, %i7
	ldsb	[%l7 + %i7],	%g7
	nop
	set	0x3C, %o4
	lduw	[%l7 + %o4],	%g6
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	nop
	set	0x7E, %o6
	stb	%o5,	[%l7 + %o6]
	add	%l4,	%o4,	%o6
	nop
	set	0x30, %g2
	std	%f16,	[%l7 + %g2]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%o0
	nop
	set	0x7C, %o3
	ldsh	[%l7 + %o3],	%o1
	set	0x3F, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%l0
	nop
	set	0x48, %o2
	sth	%i2,	[%l7 + %o2]
	set	0x28, %g4
	stda	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x52, %o1
	sth	%g4,	[%l7 + %o1]
	set	0x64, %l6
	lda	[%l7 + %l6] 0x80,	%f9
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 0
	nop
	set	0x10, %l4
	stx	%l1,	[%l7 + %l4]
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%i0
	nop
	set	0x10, %g7
	stx	%l2,	[%l7 + %g7]
	nop
	set	0x48, %g6
	ldsh	[%l7 + %g6],	%l3
	set	0x28, %i0
	sta	%f30,	[%l7 + %i0] 0x88
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%l4
	nop
	set	0x68, %l2
	stw	%i4,	[%l7 + %l2]
	set	0x10, %i5
	stwa	%l6,	[%l7 + %i5] 0x80
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc8
	set	0x24, %i1
	sta	%f9,	[%l7 + %i1] 0x89
	st	%f2,	[%l7 + 0x40]
	nop
	set	0x10, %l3
	stw	%i6,	[%l7 + %l3]
	nop
	set	0x76, %g1
	sth	%i3,	[%l7 + %g1]
	or	%g2,	%i5,	%o2
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%g2
	nop
	set	0x18, %g3
	ldsw	[%l7 + %g3],	%g1
	set	0x39, %i3
	stba	%o7,	[%l7 + %i3] 0x88
	nop
	set	0x44, %o7
	lduw	[%l7 + %o7],	%g5
	nop
	set	0x70, %o5
	ldsw	[%l7 + %o5],	%g7
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%o5
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%l4
	set	0x64, %g5
	swapa	[%l7 + %g5] 0x81,	%o4
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x80,	%o6
	or	%i1,	%o0,	%o1
	set	0x44, %g2
	stwa	%g6,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%l0
	set	0x14, %i4
	stwa	%i2,	[%l7 + %i4] 0x81
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x81,	%o3
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	nop
	set	0x72, %o1
	ldsh	[%l7 + %o1],	%l1
	set	0x38, %g4
	swapa	[%l7 + %g4] 0x89,	%g4
	set	0x11, %l1
	stba	%i0,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x20, %l6
	std	%f26,	[%l7 + %l6]
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%l3
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%l2
	set	0x70, %g6
	lda	[%l7 + %g6] 0x80,	%f22
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x81,	%l5
	st	%fsr,	[%l7 + 0x34]
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xe3,	%i6
	nop
	set	0x7D, %l2
	ldstub	[%l7 + %l2],	%i4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
	nop
	set	0x68, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x68, %i0
	stwa	%i6,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x38, %i1
	std	%i2,	[%l7 + %i1]
	nop
	set	0x18, %l3
	ldsh	[%l7 + %l3],	%g2
	nop
	set	0x1B, %i2
	ldsb	[%l7 + %i2],	%i5
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f26
	or	%o2,	%g3,	%g1
	fpsub16s	%f24,	%f7,	%f18
	set	0x10, %g1
	stwa	%g5,	[%l7 + %g1] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%g7
	nop
	set	0x70, %o7
	lduh	[%l7 + %o7],	%o5
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x89,	 2
	fpadd16s	%f10,	%f4,	%f25
	be,a	%icc,	loop_94
	ld	[%l7 + 0x7C],	%f1
	set	0x5E, %o5
	stha	%o4,	[%l7 + %o5] 0x89
loop_94:
	nop
	set	0x2D, %i7
	ldub	[%l7 + %i7],	%o6
	set	0x48, %o4
	stwa	%i1,	[%l7 + %o4] 0x80
	nop
	set	0x18, %g5
	lduw	[%l7 + %g5],	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l0
	nop
	set	0x70, %g2
	std	%i2,	[%l7 + %g2]
	nop
	set	0x71, %o6
	ldsb	[%l7 + %o6],	%o3
	set	0x54, %o3
	sta	%f15,	[%l7 + %o3] 0x81
	nop
	set	0x13, %i4
	ldub	[%l7 + %i4],	%o0
	nop
	set	0x1B, %l5
	stb	%i7,	[%l7 + %l5]
	set	0x68, %o1
	stwa	%l1,	[%l7 + %o1] 0x88
	nop
	set	0x49, %g4
	ldstub	[%l7 + %g4],	%g4
	nop
	set	0x38, %o2
	stb	%l3,	[%l7 + %o2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x27F, 	%sys_tick_cmpr
	nop
	set	0x70, %l6
	stw	%i0,	[%l7 + %l6]
	nop
	nop
	setx	0xA5042471C85CF1A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9B32ABBAB12D033B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f0,	%f10
	ld	[%l7 + 0x54],	%f25
	set	0x50, %l0
	stda	%i6,	[%l7 + %l0] 0x89
	nop
	set	0x1C, %g7
	ldsb	[%l7 + %g7],	%i4
	add	%i3,	%i6,	%i5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f0
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x89,	%o2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%g3
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x89,	 2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%g5
	nop
	set	0x5F, %i6
	stb	%o7,	[%l7 + %i6]
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%o5
	set	0x70, %i0
	lda	[%l7 + %i0] 0x81,	%f13
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f16
	nop
	set	0x60, %l3
	swap	[%l7 + %l3],	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f16
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x88,	%i1
	nop
	set	0x7C, %o7
	ldstub	[%l7 + %o7],	%g7
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x81,	%o1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd0,	%f16
	nop
	set	0x78, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%g6
	nop
	set	0x08, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x7C, %o6
	swap	[%l7 + %o6],	%l0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f0
	set	0x38, %i4
	stda	%i2,	[%l7 + %i4] 0xe2
	membar	#Sync
	and	%o0,	%i7,	%o3
	nop
	set	0x48, %g2
	std	%g4,	[%l7 + %g2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%l2
	nop
	set	0x48, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x10, %o1
	stx	%l5,	[%l7 + %o1]
	nop
	nop
	setx	0x5F1EA715,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x4D761312,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f4,	%f23
	set	0x21, %g4
	stba	%l1,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x78, %o2
	lduw	[%l7 + %o2],	%l6
	nop
	set	0x68, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x23, %l6
	ldub	[%l7 + %l6],	%i3
	nop
	set	0x08, %g6
	std	%i6,	[%l7 + %g6]
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%i5
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x34, %l2
	lduw	[%l7 + %l2],	%o2
	set	0x60, %l1
	stda	%i0,	[%l7 + %l1] 0x80
	st	%fsr,	[%l7 + 0x64]
	set	0x24, %i6
	lda	[%l7 + %i6] 0x80,	%f30
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%g2
	nop
	set	0x28, %i0
	stw	%g1,	[%l7 + %i0]
	set	0x40, %i5
	stxa	%g3,	[%l7 + %i5] 0x80
	set	0x48, %l3
	lda	[%l7 + %l3] 0x80,	%f27
	nop
	set	0x20, %i1
	stx	%g5,	[%l7 + %i1]
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f18
	set	0x3C, %i2
	stwa	%o5,	[%l7 + %i2] 0x88
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x18, %g1
	stx	%l4,	[%l7 + %g1]
	nop
	set	0x46, %o5
	ldstub	[%l7 + %o5],	%o7
	nop
	set	0x28, %o7
	stw	%o6,	[%l7 + %o7]
	bne	%icc,	loop_95
	nop
	set	0x78, %i3
	stw	%i1,	[%l7 + %i3]
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x88,	%g6
loop_95:
	add	%o1,	%g6,	%l0
	or	%o4,	%i2,	%o0
	nop
	set	0x64, %o4
	ldsb	[%l7 + %o4],	%o3
	or	%g4,	%i7,	%l2
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f0
	nop
	set	0x23, %o3
	ldub	[%l7 + %o3],	%l3
	nop
	nop
	setx	0x3A5CFE37AD6F39A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x022AA526A6883202,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f22
	nop
	set	0x74, %i4
	prefetch	[%l7 + %i4],	 4
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc4
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%l5
	wr	%l1,	%i4,	%clear_softint
	nop
	set	0x0E, %o6
	ldsb	[%l7 + %o6],	%l6
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%i2
	set	0x37, %o1
	stba	%i5,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x40, %l0
	stb	%i6,	[%l7 + %l0]
	nop
	nop
	setx	0x38145A3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x75F699C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f7,	%f25
	set	0x70, %l6
	stxa	%i0,	[%l7 + %l6] 0x80
	nop
	set	0x5C, %g6
	ldsw	[%l7 + %g6],	%o2
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x48, %o2
	swap	[%l7 + %o2],	%g2
	set	0x7C, %o0
	stwa	%g1,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x18, %l1
	stx	%g5,	[%l7 + %l1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l4
	set	0x0B, %i6
	stba	%o7,	[%l7 + %i6] 0x80
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f16
	set	0x3C, %l2
	lda	[%l7 + %l2] 0x80,	%f26
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%o6
	nop
	set	0x0B, %l3
	ldstub	[%l7 + %l3],	%i1
	nop
	set	0x10, %i0
	std	%g6,	[%l7 + %i0]
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%g2
	set	0x48, %i2
	stda	%g6,	[%l7 + %i2] 0x80
	or	%l0,	%o4,	%o1
	nop
	set	0x1B, %i1
	ldub	[%l7 + %i1],	%o0
	set	0x24, %o5
	swapa	[%l7 + %o5] 0x81,	%o3
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%g4
	nop
	set	0x70, %o7
	stx	%i7,	[%l7 + %o7]
	set	0x50, %g5
	lda	[%l7 + %g5] 0x81,	%f15
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x80,	%f16
	set	0x70, %i3
	stxa	%l2,	[%l7 + %i3] 0x81
	or	%i2,	%l3,	%l5
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x89,	%l0
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x81
	nop
	set	0x38, %g2
	lduh	[%l7 + %g2],	%i4
	set	0x3B, %i4
	ldstuba	[%l7 + %i4] 0x89,	%l6
	add	%i5,	%i6,	%i0
	set	0x48, %o6
	stxa	%i3,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x60, %g4
	std	%o2,	[%l7 + %g4]
	nop
	set	0x38, %l5
	sth	%g1,	[%l7 + %l5]
	set	0x1D, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g2
	nop
	set	0x70, %l6
	std	%f14,	[%l7 + %l6]
	nop
	set	0x2B, %g6
	stb	%o5,	[%l7 + %g6]
	set	0x60, %l0
	ldxa	[%l7 + %l0] 0x81,	%l4
	set	0x48, %g7
	stda	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x68, %o2
	std	%o6,	[%l7 + %o2]
	nop
	set	0x48, %l1
	stb	%i1,	[%l7 + %l1]
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x81,	%o6
	set	0x30, %o0
	stwa	%g7,	[%l7 + %o0] 0x88
	set	0x34, %l2
	swapa	[%l7 + %l2] 0x89,	%g3
	set	0x70, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g6
	set	0x4F, %i5
	stba	%l0,	[%l7 + %i5] 0x80
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x88,	%o4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f16
	and	%o1,	%o3,	%g4
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x89,	%o0
	nop
	set	0x18, %i1
	std	%l2,	[%l7 + %i1]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd0
	fpadd16	%f6,	%f16,	%f0
	set	0x3C, %g1
	stwa	%i7,	[%l7 + %g1] 0x80
	set	0x68, %o7
	stxa	%i2,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%l3
	nop
	set	0x6C, %o4
	sth	%l5,	[%l7 + %o4]
	and	%l1,	%l6,	%i5
	set	0x3E, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i4
	nop
	set	0x6C, %o3
	stw	%i6,	[%l7 + %o3]
	or	%i3,	%o2,	%g1
	nop
	set	0x4C, %g5
	stw	%i0,	[%l7 + %g5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x62D, 	%tick_cmpr
	nop
	set	0x6C, %g2
	prefetch	[%l7 + %g2],	 0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g5
	nop
	set	0x08, %i4
	stx	%i1,	[%l7 + %i4]
	set	0x08, %i7
	stda	%o6,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x68, %g4
	stda	%o6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x17, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g3
	set	0x30, %o1
	stxa	%g6,	[%l7 + %o1] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%l0
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%g7
	and	%o1,	%o4,	%o3
	nop
	set	0x3A, %l6
	ldstub	[%l7 + %l6],	%g4
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	ble	%icc,	loop_96
	nop
	set	0x33, %o2
	ldstub	[%l7 + %o2],	%i7
	set	0x76, %g7
	stba	%o0,	[%l7 + %g7] 0xe2
	membar	#Sync
loop_96:
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%l5
	nop
	set	0x28, %o0
	stx	%fsr,	[%l7 + %o0]
	ble,pt	%icc,	loop_97
	add	%l6,	%i5,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%l1
loop_97:
	add	%i3,	%o2,	%g1
	nop
	set	0x48, %l2
	ldsb	[%l7 + %l2],	%i0
	set	0x70, %l4
	stxa	%o5,	[%l7 + %l4] 0x80
	set	0x08, %i5
	swapa	[%l7 + %i5] 0x88,	%g2
	set	0x70, %l3
	stxa	%g5,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x54, %l1
	prefetch	[%l7 + %l1],	 2
	set	0x2C, %g3
	stwa	%l4,	[%l7 + %g3] 0x89
	and	%i1,	%o7,	%g3
	nop
	set	0x52, %i1
	stb	%o6,	[%l7 + %i1]
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x88,	%g6
	nop
	set	0x20, %i0
	swap	[%l7 + %i0],	%l0
	set	0x20, %o7
	stda	%o0,	[%l7 + %o7] 0x88
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f2
	nop
	set	0x08, %o4
	stx	%o4,	[%l7 + %o4]
	set	0x18, %o5
	stda	%g6,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x6C, %o3
	swap	[%l7 + %o3],	%o3
	set	0x40, %g5
	stxa	%g4,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x30, %g2
	sta	%f16,	[%l7 + %g2] 0x88
	nop
	set	0x70, %i4
	lduw	[%l7 + %i4],	%i7
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x89,	%o0
	set	0x44, %g4
	stha	%i2,	[%l7 + %g4] 0x88
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%l5
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
	set	0x6C, %o1
	swapa	[%l7 + %o1] 0x89,	%l6
	nop
	set	0x15, %l5
	stb	%i5,	[%l7 + %l5]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f16
	or	%i4,	%l3,	%i6
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xe3,	%l0
	nop
	set	0x50, %o6
	stx	%o2,	[%l7 + %o6]
	st	%f9,	[%l7 + 0x10]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i0
	nop
	set	0x66, %l0
	ldsb	[%l7 + %l0],	%o5
	nop
	set	0x68, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x40, %g7
	stx	%g1,	[%l7 + %g7]
	nop
	set	0x62, %i6
	ldstub	[%l7 + %i6],	%g2
	nop
	set	0x20, %l2
	stx	%l4,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f16
	nop
	set	0x5B, %i5
	stb	%i1,	[%l7 + %i5]
	nop
	set	0x72, %l3
	ldub	[%l7 + %l3],	%g5
	set	0x72, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g3
	ld	[%l7 + 0x30],	%f17
	set	0x28, %g3
	stwa	%o6,	[%l7 + %g3] 0xeb
	membar	#Sync
	and	%g6,	%o7,	%l0
	nop
	set	0x72, %l1
	ldsh	[%l7 + %l1],	%o1
	ba,a,pt	%icc,	loop_98
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%g6
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x10, %o7
	std	%f30,	[%l7 + %o7]
loop_98:
	fpsub32s	%f2,	%f5,	%f29
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	or	%o4,	%o3,	%g4
	nop
	set	0x68, %g1
	stx	%o0,	[%l7 + %g1]
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x40, %o3
	stda	%i6,	[%l7 + %o3] 0x88
	nop
	set	0x2C, %o4
	ldsw	[%l7 + %o4],	%l2
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe2,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x30, %g5
	prefetch	[%l7 + %g5],	 4
	fpsub32	%f24,	%f2,	%f14
	set	0x40, %i3
	stxa	%i2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x08, %g4
	ldsw	[%l7 + %g4],	%i4
	set	0x20, %i7
	stha	%i6,	[%l7 + %i7] 0x89
	nop
	set	0x24, %o1
	ldsw	[%l7 + %o1],	%l1
	nop
	set	0x64, %i4
	sth	%o2,	[%l7 + %i4]
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x88,	 4
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x89,	%l3
	nop
	set	0x3A, %l6
	ldsb	[%l7 + %l6],	%o5
	ble,a	%icc,	loop_99
	nop
	set	0x45, %o6
	ldub	[%l7 + %o6],	%i0
	nop
	set	0x38, %l0
	ldsw	[%l7 + %l0],	%g2
	set	0x20, %g7
	sta	%f1,	[%l7 + %g7] 0x81
loop_99:
	nop
	set	0x60, %i6
	std	%f6,	[%l7 + %i6]
	add	%g1,	%l4,	%g5
	fpsub32s	%f26,	%f15,	%f22
	nop
	set	0x60, %o2
	swap	[%l7 + %o2],	%i1
	set	0x18, %l4
	stha	%g3,	[%l7 + %l4] 0x81
	set	0x0F, %l2
	stba	%o6,	[%l7 + %l2] 0xe3
	membar	#Sync
	and	%o7,	%l0,	%o1
	nop
	set	0x60, %l3
	lduw	[%l7 + %l3],	%g6
	nop
	set	0x14, %i5
	ldsw	[%l7 + %i5],	%o4
	set	0x64, %o0
	stba	%o3,	[%l7 + %o0] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o0
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%l2
	nop
	set	0x4C, %g3
	sth	%l5,	[%l7 + %g3]
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x80,	 3
	nop
	set	0x68, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x32, %i0
	sth	%i2,	[%l7 + %i0]
	set	0x54, %i1
	swapa	[%l7 + %i1] 0x88,	%i4
	add	%l6,	%i6,	%o2
	nop
	set	0x26, %g1
	ldstub	[%l7 + %g1],	%l1
	nop
	set	0x2C, %o5
	prefetch	[%l7 + %o5],	 0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%o5
	set	0x39, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l3
	nop
	set	0x28, %o3
	std	%f0,	[%l7 + %o3]
	nop
	set	0x78, %g2
	stx	%g2,	[%l7 + %g2]
	set	0x25, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i0
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x0C, %g4
	prefetch	[%l7 + %g4],	 0
	or	%g1,	%g5,	%l4
	set	0x40, %i7
	stda	%g2,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x50, %i4
	ldxa	[%l7 + %i4] 0x88,	%o6
	set	0x08, %g6
	stba	%o7,	[%l7 + %g6] 0x80
	ld	[%l7 + 0x38],	%f10
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f16
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	nop
	set	0x08, %o6
	lduh	[%l7 + %o6],	%i1
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f24
	nop
	set	0x10, %l6
	prefetch	[%l7 + %l6],	 2
	nop
	set	0x2E, %g7
	stb	%g6,	[%l7 + %g7]
	wr	%o1,	%o4,	%pic
	nop
	set	0x40, %o2
	lduw	[%l7 + %o2],	%o3
	set	0x38, %i6
	stda	%g4,	[%l7 + %i6] 0x89
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x81,	%f19
	set	0x70, %l3
	stxa	%o0,	[%l7 + %l3] 0x80
	add	%g7,	%i7,	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%i2
	set	0x5B, %i5
	stba	%i4,	[%l7 + %i5] 0x81
	set	0x36, %l4
	stba	%i5,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x57, %l1
	ldstub	[%l7 + %l1],	%i6
	nop
	set	0x2A, %g3
	ldub	[%l7 + %g3],	%o2
	nop
	set	0x58, %i2
	stw	%l6,	[%l7 + %i2]
	fpadd16	%f2,	%f30,	%f18
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%l1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%l3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	nop
	set	0x08, %o7
	std	%g2,	[%l7 + %o7]
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%o4
	st	%f0,	[%l7 + 0x38]
	nop
	set	0x10, %i1
	std	%g0,	[%l7 + %i1]
	bne,a	%icc,	loop_100
	nop
	set	0x2F, %o4
	ldub	[%l7 + %o4],	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%g5
loop_100:
	and	%o6,	%o7,	%l0
	add	%i1,	%o1,	%o4
	nop
	set	0x50, %o3
	lduw	[%l7 + %o3],	%o3
	nop
	set	0x5A, %g2
	ldub	[%l7 + %g2],	%g4
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x80,	 0
	nop
	set	0x20, %g5
	stw	%g7,	[%l7 + %g5]
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x88,	%i6
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x4C, %g4
	stb	%l2,	[%l7 + %g4]
	nop
	set	0x2E, %g6
	ldsh	[%l7 + %g6],	%l5
	add	%o0,	%i4,	%i2
	nop
	set	0x62, %l5
	lduh	[%l7 + %l5],	%i5
	nop
	set	0x48, %o1
	sth	%o2,	[%l7 + %o1]
	set	0x4F, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l6
	nop
	set	0x3D, %l6
	ldstub	[%l7 + %l6],	%i6
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%l1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%g2
	nop
	set	0x28, %o2
	ldub	[%l7 + %o2],	%i0
	set	0x68, %i6
	stwa	%o5,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x38, %l0
	sta	%f5,	[%l7 + %l0] 0x80
	fpadd16s	%f27,	%f10,	%f2
	nop
	set	0x2F, %l2
	ldub	[%l7 + %l2],	%g1
	set	0x14, %i5
	lda	[%l7 + %i5] 0x88,	%f4
	nop
	set	0x68, %l3
	stx	%l4,	[%l7 + %l3]
	set	0x18, %l4
	stxa	%i3,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x28, %i2
	stda	%g2,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x78, %o0
	prefetch	[%l7 + %o0],	 1
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x81
	nop
	set	0x64, %g3
	ldub	[%l7 + %g3],	%g5
	nop
	set	0x08, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x44, %g1
	stwa	%o7,	[%l7 + %g1] 0x80
	nop
	set	0x48, %i1
	swap	[%l7 + %i1],	%l0
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x80,	%i1
	set	0x2C, %o4
	lda	[%l7 + %o4] 0x88,	%f23
	nop
	set	0x68, %o3
	std	%f22,	[%l7 + %o3]
	nop
	set	0x38, %g2
	stx	%o6,	[%l7 + %g2]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xda
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%o0
	set	0x7E, %i7
	stba	%o3,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x68, %g4
	std	%f8,	[%l7 + %g4]
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 1
	set	0x34, %l5
	stha	%g4,	[%l7 + %l5] 0x80
	add	%o4,	%g7,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%g6
	bn	%icc,	loop_101
	nop
	set	0x5A, %o1
	sth	%l5,	[%l7 + %o1]
	nop
	set	0x6A, %o6
	sth	%i4,	[%l7 + %o6]
	nop
	set	0x56, %l6
	lduh	[%l7 + %l6],	%i2
loop_101:
	nop
	set	0x57, %g6
	ldstub	[%l7 + %g6],	%o0
	nop
	set	0x48, %g7
	sth	%i5,	[%l7 + %g7]
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%o2
	set	0x5C, %l0
	stwa	%l6,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x74, %l2
	stw	%l1,	[%l7 + %l2]
	set	0x08, %o2
	stxa	%l3,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x80,	%i6
	set	0x44, %l3
	sta	%f20,	[%l7 + %l3] 0x80
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	or	%g2,	%o5,	%g1
	set	0x4C, %o0
	lda	[%l7 + %o0] 0x88,	%f6
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x80,	%i0
	set	0x46, %g3
	stha	%l4,	[%l7 + %g3] 0x89
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x89,	 3
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x88,	%f25
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	set	0x40, %o5
	stxa	%g5,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%o6
	nop
	set	0x53, %o4
	stb	%g3,	[%l7 + %o4]
	nop
	set	0x7A, %g2
	ldsh	[%l7 + %g2],	%l0
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%i1
	nop
	set	0x7A, %o3
	ldsh	[%l7 + %o3],	%o6
	add	%o3,	%o1,	%g4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x80
	set	0x2D, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g7
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x80,	%o4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%g6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f0
	and	%l5,	%i4,	%i7
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f0
	nop
	set	0x40, %o1
	ldstub	[%l7 + %o1],	%i2
	set	0x10, %l6
	stwa	%o0,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x12, %o6
	ldub	[%l7 + %o6],	%i5
	set	0x08, %g6
	stwa	%l6,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x48, %i6
	lda	[%l7 + %i6] 0x89,	%f19
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f0
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f26
	nop
	set	0x78, %g7
	ldstub	[%l7 + %g7],	%l1
	nop
	set	0x0C, %i5
	swap	[%l7 + %i5],	%i6
	nop
	set	0x58, %l3
	lduw	[%l7 + %l3],	%g2
	nop
	set	0x38, %l1
	stx	%l3,	[%l7 + %l1]
	and	%g1,	%o5,	%l4
	nop
	set	0x6D, %l4
	ldsb	[%l7 + %l4],	%i0
	set	0x20, %i2
	stxa	%i3,	[%l7 + %i2] 0x81
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%g5
	or	%l0,	%i1,	%o6
	nop
	set	0x60, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%g2
	nop
	set	0x58, %i0
	stw	%o3,	[%l7 + %i0]
	set	0x5D, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	nop
	set	0x56, %g1
	ldub	[%l7 + %g1],	%g7
	nop
	set	0x20, %o4
	stx	%o1,	[%l7 + %o4]
	bne	%icc,	loop_102
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x87C, 	%tick_cmpr
	nop
	set	0x64, %g5
	ldsh	[%l7 + %g5],	%l5
loop_102:
	nop
	set	0x38, %o3
	stw	%g6,	[%l7 + %o3]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%i2
	set	0x39, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i7
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%i5
	fpsub32	%f20,	%f18,	%f28
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%l6
	nop
	set	0x10, %o7
	lduh	[%l7 + %o7],	%l1
	nop
	set	0x7C, %i7
	lduw	[%l7 + %i7],	%o2
	nop
	set	0x24, %i4
	sth	%g2,	[%l7 + %i4]
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x81,	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g1
	nop
	set	0x2C, %o1
	lduh	[%l7 + %o1],	%l4
	set	0x50, %l6
	stxa	%o5,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x6A, %g6
	stb	%i0,	[%l7 + %g6]
	nop
	set	0x15, %i6
	ldub	[%l7 + %i6],	%i3
	nop
	set	0x50, %l0
	swap	[%l7 + %l0],	%g5
	nop
	set	0x2E, %o6
	sth	%o7,	[%l7 + %o6]
	ld	[%l7 + 0x60],	%f11
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x80,	%l0
	be,a	%xcc,	loop_103
	nop
	set	0x2F, %l2
	stb	%o6,	[%l7 + %l2]
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	fpadd16s	%f18,	%f30,	%f18
loop_103:
	ld	[%l7 + 0x24],	%f3
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x81,	%i1
	or	%g3,	%g4,	%g7
	set	0x10, %l1
	swapa	[%l7 + %l1] 0x81,	%o1
	set	0x7F, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o4
	set	0x14, %g7
	stwa	%o3,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x28, %i2
	std	%f8,	[%l7 + %i2]
	nop
	set	0x52, %o0
	ldstub	[%l7 + %o0],	%l2
	wr	%l5,	%i4,	%sys_tick
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x80,	%f13
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x80,	%g6
	nop
	set	0x4C, %o5
	swap	[%l7 + %o5],	%i7
	and	%i2,	%i5,	%o0
	set	0x58, %g1
	stwa	%l1,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x78, %i0
	stda	%i6,	[%l7 + %i0] 0x80
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	add	%o2,	%i6,	%g2
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x81,	 3
	nop
	set	0x2A, %o3
	ldsb	[%l7 + %o3],	%l4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f0
	nop
	set	0x6C, %g4
	swap	[%l7 + %g4],	%g1
	nop
	set	0x40, %o7
	ldub	[%l7 + %o7],	%o5
	set	0x20, %i7
	stda	%i0,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x58, %g5
	stx	%i3,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x18, %i4
	sth	%o7,	[%l7 + %i4]
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%g5
	set	0x27, %o1
	stba	%o6,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%g3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%g4
	nop
	set	0x70, %i6
	ldsw	[%l7 + %i6],	%g7
	add	%o4,	%o1,	%l2
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f24
	nop
	set	0x15, %l6
	ldstub	[%l7 + %l6],	%l5
	set	0x58, %o6
	stha	%i4,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%g6
	nop
	set	0x58, %i5
	ldsw	[%l7 + %i5],	%o3
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x88,	%i2
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f6
	nop
	set	0x64, %l4
	sth	%i5,	[%l7 + %l4]
	nop
	set	0x58, %l2
	std	%o0,	[%l7 + %l2]
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x89,	 2
	add	%l6,	%o2,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l3
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f0
	set	0x50, %g3
	ldda	[%l7 + %g3] 0xeb,	%i6
	fpadd32	%f2,	%f28,	%f26
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%o5
	ld	[%l7 + 0x08],	%f24
	add	%l4,	%i3,	%i0
	nop
	set	0x48, %o0
	ldx	[%l7 + %o0],	%o7
	nop
	set	0x11, %g1
	ldub	[%l7 + %g1],	%g5
	nop
	set	0x50, %i0
	std	%l0,	[%l7 + %i0]
	nop
	set	0x4C, %g2
	sth	%g3,	[%l7 + %g2]
	nop
	set	0x10, %o5
	lduw	[%l7 + %o5],	%i1
	add	%g4,	%g7,	%o4
	nop
	set	0x76, %o3
	lduh	[%l7 + %o3],	%o6
	nop
	set	0x7F, %i3
	ldsb	[%l7 + %i3],	%o1
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	and	%i4,	%l2,	%g6
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x88,	%o3
	add	%i2,	%i5,	%o0
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x80,	%l1
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x80,	%l6
	set	0x68, %i4
	stxa	%i7,	[%l7 + %i4] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f20
	fpsub16	%f14,	%f20,	%f22
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o2
	nop
	set	0x30, %l5
	std	%g2,	[%l7 + %l5]
	nop
	set	0x40, %i6
	stx	%l3,	[%l7 + %i6]
	set	0x5C, %l0
	lda	[%l7 + %l0] 0x81,	%f18
	nop
	set	0x1B, %g6
	stb	%i6,	[%l7 + %g6]
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x89,	%o4
	set	0x40, %o2
	stwa	%l4,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x22, %o6
	lduh	[%l7 + %o6],	%g1
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x30, %l1
	lduh	[%l7 + %l1],	%i3
	set	0x74, %i5
	lda	[%l7 + %i5] 0x80,	%f24
	nop
	set	0x68, %l2
	std	%f18,	[%l7 + %l2]
	set	0x38, %i2
	lda	[%l7 + %i2] 0x88,	%f8
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x38, %l4
	stx	%o7,	[%l7 + %l4]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xea,	%g4
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f6
	nop
	set	0x68, %g3
	sth	%l0,	[%l7 + %g3]
	set	0x40, %g1
	ldxa	[%l7 + %g1] 0x80,	%g3
	nop
	set	0x71, %i0
	ldsb	[%l7 + %i0],	%g4
	or	%i1,	%g7,	%o6
	st	%fsr,	[%l7 + 0x14]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f0
	nop
	set	0x68, %o3
	std	%f28,	[%l7 + %o3]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%o1
	st	%f21,	[%l7 + 0x58]
	nop
	set	0x38, %o5
	std	%f12,	[%l7 + %o5]
	nop
	set	0x38, %i3
	std	%i4,	[%l7 + %i3]
	nop
	set	0x39, %g4
	ldstub	[%l7 + %g4],	%l5
	set	0x50, %o7
	sta	%f26,	[%l7 + %o7] 0x80
	nop
	set	0x78, %o4
	ldstub	[%l7 + %o4],	%g6
	set	0x7C, %i4
	lda	[%l7 + %i4] 0x89,	%f18
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%l2
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%o3
	nop
	set	0x34, %l5
	swap	[%l7 + %l5],	%i5
	nop
	set	0x62, %i6
	ldub	[%l7 + %i6],	%o0
	add	%i2,	%l1,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o2
	nop
	set	0x2E, %l0
	stb	%l3,	[%l7 + %l0]
	fpadd32	%f20,	%f16,	%f22
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f24
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%g2
	set	0x3C, %l6
	swapa	[%l7 + %l6] 0x80,	%i6
	nop
	set	0x30, %o2
	ldub	[%l7 + %o2],	%o5
	nop
	nop
	setx	0x5BF30EC77FE75E7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0D401128C33AE18D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f0,	%f0
	nop
	set	0x16, %l3
	ldstub	[%l7 + %l3],	%l4
	be,pt	%icc,	loop_104
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%i0
	set	0x44, %l1
	stwa	%i3,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_104:
	add	%o7,	%g1,	%l0
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x81,	%g3
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf8
	membar	#Sync
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xe3,	%g4
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x88,	%i1
	fpsub32	%f12,	%f0,	%f26
	nop
	set	0x20, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%o4
	nop
	set	0x51, %o0
	stb	%o6,	[%l7 + %o0]
	bge,pt	%xcc,	loop_105
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%f8
	nop
	set	0x4C, %g3
	stw	%o1,	[%l7 + %g3]
	nop
	set	0x38, %i0
	ldsh	[%l7 + %i0],	%i4
loop_105:
	nop
	set	0x6D, %o3
	ldstub	[%l7 + %o3],	%g6
	nop
	set	0x4C, %o5
	sth	%l5,	[%l7 + %o5]
	set	0x21, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o3
	set	0x40, %g4
	sta	%f4,	[%l7 + %g4] 0x81
	and	%l2,	%o0,	%i5
	nop
	set	0x30, %g2
	sth	%l1,	[%l7 + %g2]
	bleu,a	%xcc,	loop_106
	nop
	set	0x12, %o7
	ldsh	[%l7 + %o7],	%i7
	nop
	set	0x10, %o4
	sth	%i2,	[%l7 + %o4]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f16
loop_106:
	nop
	set	0x20, %i7
	std	%f12,	[%l7 + %i7]
	fpadd32	%f6,	%f0,	%f18
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x88,	%o2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f16
	wr	%l3,	%l6,	%pic
	st	%f26,	[%l7 + 0x64]
	nop
	set	0x18, %i6
	std	%f6,	[%l7 + %i6]
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x89,	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o5
	nop
	set	0x67, %g6
	ldub	[%l7 + %g6],	%l4
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f16
	nop
	set	0x28, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%i3
	set	0x42, %o6
	stha	%o7,	[%l7 + %o6] 0x81
	set	0x30, %l3
	stda	%i0,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x58, %i5
	std	%f16,	[%l7 + %i5]
	set	0x6C, %l1
	sta	%f11,	[%l7 + %l1] 0x88
	set	0x14, %i2
	stwa	%l0,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x89,	%g3
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%g4
	set	0x64, %l2
	lda	[%l7 + %l2] 0x89,	%f24
	nop
	set	0x5C, %o0
	prefetch	[%l7 + %o0],	 4
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x20, %g1
	sta	%f3,	[%l7 + %g1] 0x89
	ld	[%l7 + 0x4C],	%f18
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x80,	%g1
	ld	[%l7 + 0x38],	%f3
	nop
	nop
	setx	0x1A70EFD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB3742B76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f11,	%f24
	st	%f23,	[%l7 + 0x64]
	nop
	set	0x18, %o3
	lduw	[%l7 + %o3],	%g7
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc2
	set	0x38, %i0
	lda	[%l7 + %i0] 0x89,	%f18
	or	%g5,	%o4,	%o6
	set	0x6C, %i3
	lda	[%l7 + %i3] 0x80,	%f17
	set	0x4A, %g2
	stha	%i1,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x76, %o7
	lduh	[%l7 + %o7],	%o1
	nop
	set	0x54, %g4
	ldstub	[%l7 + %g4],	%i4
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f16
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x89,	%l5
	or	%o3,	%l2,	%g6
	set	0x50, %i4
	ldda	[%l7 + %i4] 0xe3,	%o0
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x88,	%i4
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x88,	 1
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x18, %l0
	std	%f16,	[%l7 + %l0]
	set	0x10, %g6
	ldxa	[%l7 + %g6] 0x80,	%i7
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x80,	%i2
	nop
	set	0x1D, %o1
	ldsb	[%l7 + %o1],	%l3
	set	0x48, %o2
	stxa	%o2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x64, %l6
	stwa	%l6,	[%l7 + %l6] 0x89
	set	0x5C, %o6
	swapa	[%l7 + %o6] 0x89,	%g2
	bge,a	%xcc,	loop_107
	nop
	set	0x38, %l3
	ldsw	[%l7 + %l3],	%i6
	add	%o5,	%i3,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o7
loop_107:
	nop
	set	0x7C, %i5
	swap	[%l7 + %i5],	%l0
	nop
	set	0x18, %i2
	ldx	[%l7 + %i2],	%g3
	st	%fsr,	[%l7 + 0x6C]
	set	0x1C, %g7
	sta	%f12,	[%l7 + %g7] 0x89
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x81,	%g4
	fpsub32s	%f27,	%f26,	%f13
	nop
	set	0x28, %o0
	std	%g6,	[%l7 + %o0]
	and	%g5,	%o4,	%o6
	nop
	set	0x18, %l4
	ldsb	[%l7 + %l4],	%g1
	and	%i1,	%i4,	%l5
	set	0x3C, %g1
	sta	%f16,	[%l7 + %g1] 0x89
	and	%o3,	%o1,	%g6
	nop
	set	0x6F, %l2
	stb	%l2,	[%l7 + %l2]
	and	%o0,	%l1,	%i7
	nop
	set	0x63, %o3
	ldsb	[%l7 + %o3],	%i2
	and	%l3,	%o2,	%i5
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x31, %i0
	ldstub	[%l7 + %i0],	%g2
	add	%l6,	%o5,	%i6
	st	%f19,	[%l7 + 0x38]
	set	0x70, %o5
	stda	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x34, %g2
	sta	%f27,	[%l7 + %g2] 0x81
	set	0x78, %i3
	stwa	%l4,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x1C, %g4
	sta	%f21,	[%l7 + %g4] 0x88
	set	0x28, %o7
	stwa	%o7,	[%l7 + %o7] 0xe3
	membar	#Sync
	st	%f8,	[%l7 + 0x60]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%i0
	set	0x20, %i7
	sta	%f7,	[%l7 + %i7] 0x88
	set	0x17, %o4
	stba	%g3,	[%l7 + %o4] 0x80
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x60, %i4
	stw	%g4,	[%l7 + %i4]
	nop
	set	0x20, %l5
	prefetch	[%l7 + %l5],	 2
	nop
	set	0x58, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%g5
	set	0x62, %g6
	stha	%o4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x66, %o1
	lduh	[%l7 + %o1],	%g7
	nop
	set	0x61, %i6
	ldub	[%l7 + %i6],	%o6
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%g1
	nop
	set	0x78, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%i1
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x89,	%l5
	nop
	set	0x49, %i2
	ldub	[%l7 + %i2],	%i4
	nop
	set	0x30, %i5
	std	%f16,	[%l7 + %i5]
	add	%o1,	%o3,	%g6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%o0
	nop
	set	0x50, %i1
	lduh	[%l7 + %i1],	%i7
	nop
	set	0x40, %g7
	stw	%i2,	[%l7 + %g7]
	nop
	set	0x6A, %l1
	ldsb	[%l7 + %l1],	%l3
	nop
	set	0x78, %l4
	std	%l0,	[%l7 + %l4]
	set	0x70, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i5
	nop
	set	0x14, %o0
	ldstub	[%l7 + %o0],	%o2
	set	0x40, %l2
	stxa	%g2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x64, %o3
	swap	[%l7 + %o3],	%l6
	nop
	set	0x77, %g3
	ldub	[%l7 + %g3],	%o5
	set	0x24, %o5
	stwa	%i6,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	set	0x7C, %i0
	stha	%o7,	[%l7 + %i0] 0x81
	bne,a,pt	%icc,	loop_108
	nop
	set	0x78, %i3
	prefetch	[%l7 + %i3],	 2
	wr	%l0,	%i0,	%clear_softint
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f12
loop_108:
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%l4
	st	%fsr,	[%l7 + 0x6C]
	set	0x70, %i7
	swapa	[%l7 + %i7] 0x89,	%g4
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x88,	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%g7
	set	0x35, %o4
	stba	%g1,	[%l7 + %o4] 0x81
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%i4
	set	0x7C, %l0
	stwa	%o6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x48, %l5
	stda	%o0,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%g6
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x89,	%l2
	set	0x58, %g6
	stha	%o0,	[%l7 + %g6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	fpsub16	%f30,	%f14,	%f14
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x89,	%i6
	nop
	set	0x54, %i6
	lduw	[%l7 + %i6],	%i2
	set	0x5E, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o3
	nop
	set	0x28, %l3
	stx	%l3,	[%l7 + %l3]
	nop
	set	0x78, %i5
	stx	%l1,	[%l7 + %i5]
	or	%i5,	%g2,	%l6
	nop
	set	0x14, %i2
	ldub	[%l7 + %i2],	%o2
	st	%fsr,	[%l7 + 0x6C]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o5
	nop
	set	0x78, %i1
	std	%i2,	[%l7 + %i1]
	nop
	set	0x18, %l1
	std	%f22,	[%l7 + %l1]
	nop
	set	0x4A, %l4
	ldsh	[%l7 + %l4],	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%i0
	fpsub16s	%f3,	%f13,	%f29
	bge	%icc,	loop_109
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%l4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f16
loop_109:
	and	%g4,	%o4,	%g3
	nop
	set	0x10, %o0
	ldx	[%l7 + %o0],	%g5
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f28
	and	%g1,	%g7,	%i1
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x89,	%l4
	and	%o6,	%i4,	%g6
	ld	[%l7 + 0x20],	%f10
	set	0x32, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l2
	nop
	set	0x78, %g3
	stw	%o1,	[%l7 + %g3]
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%i7
	wr	%o0,	%o3,	%pic
	and	%l3,	%l1,	%i5
	set	0x08, %i0
	stda	%g2,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x28, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x6C]
	set	0x52, %i7
	stha	%l6,	[%l7 + %i7] 0x81
	nop
	set	0x54, %i3
	swap	[%l7 + %i3],	%i2
	nop
	set	0x6B, %o4
	ldstub	[%l7 + %o4],	%o2
	and	%i6,	%i3,	%o7
	nop
	set	0x7A, %o7
	sth	%l0,	[%l7 + %o7]
	nop
	set	0x38, %l0
	stx	%i0,	[%l7 + %l0]
	st	%f1,	[%l7 + 0x7C]
	st	%f15,	[%l7 + 0x40]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%o4
	set	0x58, %i4
	swapa	[%l7 + %i4] 0x88,	%g5
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xda
	nop
	set	0x2C, %l5
	ldsw	[%l7 + %l5],	%g3
	ld	[%l7 + 0x5C],	%f4
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%g6
	nop
	set	0x2C, %o1
	ldsw	[%l7 + %o1],	%g1
	set	0x60, %o2
	stda	%l4,	[%l7 + %o2] 0x80
	set	0x2C, %i6
	stba	%o6,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x38, %l6
	std	%f4,	[%l7 + %l6]
	nop
	set	0x20, %o6
	std	%f30,	[%l7 + %o6]
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x3C, %l3
	lduh	[%l7 + %l3],	%i1
	set	0x64, %i1
	sta	%f31,	[%l7 + %i1] 0x80
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%l2
	or	%o1,	%i7,	%i4
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f20
	nop
	set	0x10, %l4
	stx	%fsr,	[%l7 + %l4]
	ble,a	%xcc,	loop_110
	nop
	set	0x12, %i2
	stb	%o3,	[%l7 + %i2]
	nop
	set	0x40, %g1
	stx	%o0,	[%l7 + %g1]
	nop
	set	0x26, %g7
	sth	%l3,	[%l7 + %g7]
loop_110:
	fpsub32	%f0,	%f20,	%f12
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xea,	%l0
	nop
	set	0x3B, %l2
	ldub	[%l7 + %l2],	%g2
	nop
	set	0x28, %o3
	stw	%i5,	[%l7 + %o3]
	nop
	set	0x7C, %o5
	sth	%i2,	[%l7 + %o5]
	st	%f28,	[%l7 + 0x30]
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe2,	%i6
	set	0x30, %g3
	stxa	%o2,	[%l7 + %g3] 0x81
	nop
	set	0x2C, %g4
	stw	%i6,	[%l7 + %g4]
	nop
	set	0x36, %i7
	ldsh	[%l7 + %i7],	%i3
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%l0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f0
	set	0x78, %o7
	stba	%i0,	[%l7 + %o7] 0x81
	nop
	set	0x10, %l0
	std	%f4,	[%l7 + %l0]
	and	%l4,	%g4,	%o7
	fpadd32	%f20,	%f24,	%f0
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f12
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x81,	 3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf1,	%f0
	ld	[%l7 + 0x7C],	%f15
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x80,	%o4
	nop
	set	0x36, %g6
	ldsh	[%l7 + %g6],	%g3
	ld	[%l7 + 0x74],	%f7
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%g7
	nop
	set	0x6B, %o2
	ldub	[%l7 + %o2],	%l5
	nop
	set	0x54, %l6
	lduh	[%l7 + %l6],	%g1
	set	0x50, %i6
	stxa	%o6,	[%l7 + %i6] 0xe3
	membar	#Sync
	ble,a	%xcc,	loop_111
	nop
	set	0x66, %i5
	ldub	[%l7 + %i5],	%g6
	nop
	set	0x1A, %o6
	ldub	[%l7 + %o6],	%l2
	bg,a	%xcc,	loop_112
loop_111:
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
loop_112:
	nop
	set	0x5C, %l4
	swap	[%l7 + %l4],	%i1
	st	%f25,	[%l7 + 0x7C]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	nop
	set	0x23, %l3
	ldub	[%l7 + %l3],	%i7
	fpsub16	%f10,	%f30,	%f28
	ld	[%l7 + 0x18],	%f23
	set	0x78, %g1
	stha	%i4,	[%l7 + %g1] 0x80
	set	0x50, %o0
	stda	%o0,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x18, %l2
	stda	%o2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x3A, %o3
	lduh	[%l7 + %o3],	%l3
	set	0x54, %g7
	stba	%o0,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x10, %g2
	sth	%l1,	[%l7 + %g2]
	nop
	set	0x44, %g3
	prefetch	[%l7 + %g3],	 0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i5
	set	0x2A, %g4
	ldstuba	[%l7 + %g4] 0x89,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%i6
	wr	%i2,	%i3,	%ccr
	nop
	set	0x70, %o5
	lduw	[%l7 + %o5],	%l0
	nop
	set	0x08, %i7
	ldsw	[%l7 + %i7],	%l4
	or	%g4,	%o7,	%o5
	nop
	set	0x30, %i3
	ldsw	[%l7 + %i3],	%i0
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	nop
	set	0x62, %l0
	sth	%g5,	[%l7 + %l0]
	set	0x54, %o7
	sta	%f16,	[%l7 + %o7] 0x89
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x81,	%g3
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x80,	%g7
	nop
	set	0x24, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x5C, %g6
	stwa	%o6,	[%l7 + %g6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%l2
	nop
	set	0x18, %o4
	prefetch	[%l7 + %o4],	 2
	and	%g1,	%i7,	%i4
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x1C, %o1
	swap	[%l7 + %o1],	%o1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%l3
	set	0x18, %l6
	stda	%o2,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x58, %i6
	stx	%o0,	[%l7 + %i6]
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x89,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%l1
	nop
	set	0x24, %i5
	ldsw	[%l7 + %i5],	%l6
	st	%fsr,	[%l7 + 0x54]
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	set	0x0A, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i2
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x81,	%i6
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%i3
	set	0x2C, %i2
	stwa	%l0,	[%l7 + %i2] 0x81
	st	%f1,	[%l7 + 0x24]
	nop
	set	0x1C, %g1
	sth	%l4,	[%l7 + %g1]
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x80,	%o7
	set	0x10, %l2
	lda	[%l7 + %l2] 0x80,	%f9
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc8
	fpsub32	%f6,	%f30,	%f16
	nop
	set	0x50, %g7
	ldsh	[%l7 + %g7],	%g4
	ld	[%l7 + 0x70],	%f11
	st	%f23,	[%l7 + 0x7C]
	nop
	set	0x20, %o3
	std	%f18,	[%l7 + %o3]
	fpsub16s	%f27,	%f15,	%f11
	and	%o5,	%i0,	%o4
	fpsub32s	%f24,	%f4,	%f17
	st	%fsr,	[%l7 + 0x44]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%g7
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%l4
	nop
	set	0x78, %g3
	lduw	[%l7 + %g3],	%o6
	nop
	set	0x58, %o5
	std	%g4,	[%l7 + %o5]
	fpadd16	%f20,	%f8,	%f0
	nop
	set	0x48, %g4
	ldsw	[%l7 + %g4],	%l2
	nop
	set	0x28, %i7
	std	%f4,	[%l7 + %i7]
	fpsub16	%f20,	%f18,	%f18
	set	0x74, %i0
	stwa	%g6,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x36, %i3
	lduh	[%l7 + %i3],	%i7
	nop
	set	0x64, %o7
	ldsb	[%l7 + %o7],	%g1
	nop
	nop
	setx	0xE0B25ED7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x23A5F76A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f5,	%f2
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i1
	nop
	set	0x30, %g5
	std	%f18,	[%l7 + %g5]
	nop
	set	0x2E, %i4
	ldstub	[%l7 + %i4],	%o3
	nop
	set	0x58, %g6
	std	%o0,	[%l7 + %g6]
	set	0x60, %o4
	stda	%l2,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x52, %o1
	stha	%g2,	[%l7 + %o1] 0x88
	add	%l1,	%i5,	%l6
	nop
	set	0x28, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x3C, %l6
	swap	[%l7 + %l6],	%o2
	nop
	set	0x20, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x78, %i6
	stx	%i6,	[%l7 + %i6]
	nop
	set	0x6C, %i5
	ldsh	[%l7 + %i5],	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%o7
	set	0x46, %l1
	stha	%i3,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x20, %i1
	ldstub	[%l7 + %i1],	%g4
	wr	%i0,	%o4,	%pic
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%o4
	set	0x5C, %o6
	sta	%f2,	[%l7 + %o6] 0x89
	and	%g3,	%g7,	%l5
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xeb,	%o6
	set	0x74, %o0
	sta	%f8,	[%l7 + %o0] 0x81
	st	%fsr,	[%l7 + 0x68]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	add	%l2,	%g5,	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%g1
	wr	%i4,	%i1,	%pic
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	set	0x20, %g7
	stxa	%o1,	[%l7 + %g7] 0xeb
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%l3
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x88,	%g2
	nop
	set	0x12, %g2
	sth	%i5,	[%l7 + %g2]
	add	%l6,	%i2,	%l1
	nop
	set	0x10, %l3
	std	%f12,	[%l7 + %l3]
	set	0x28, %g3
	stda	%o2,	[%l7 + %g3] 0x89
	set	0x48, %g4
	stba	%i6,	[%l7 + %g4] 0xeb
	membar	#Sync
	and	%l4,	%o7,	%l0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xcc
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd0
	nop
	set	0x68, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x54, %o7
	ldsh	[%l7 + %o7],	%i3
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x89,	%g4
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%o4
	set	0x60, %i4
	stda	%i0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x3A, %o4
	stha	%o5,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd8,	%f16
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xea,	%g2
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xd2
	set	0x52, %l6
	stha	%l5,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x10, %o2
	stx	%g7,	[%l7 + %o2]
	nop
	set	0x70, %i6
	sth	%o6,	[%l7 + %i6]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%i7
	nop
	set	0x1C, %i5
	ldub	[%l7 + %i5],	%l2
	nop
	set	0x68, %l1
	swap	[%l7 + %l1],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%i1
	bn,a	%xcc,	loop_113
	ld	[%l7 + 0x44],	%f31
	set	0x48, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o3
loop_113:
	nop
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
	nop
	set	0x28, %o6
	std	%g6,	[%l7 + %o6]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f0
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x80,	%o0
	nop
	set	0x6C, %g7
	lduh	[%l7 + %g7],	%l3
	nop
	set	0x25, %o3
	ldub	[%l7 + %o3],	%o1
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%g2
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd2
	set	0x20, %g4
	stwa	%l6,	[%l7 + %g4] 0x88
	nop
	set	0x30, %g2
	sth	%i5,	[%l7 + %g2]
	nop
	set	0x60, %i7
	stx	%l1,	[%l7 + %i7]
	nop
	set	0x60, %i3
	stw	%i2,	[%l7 + %i3]
	set	0x60, %i0
	stxa	%i6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x15, %o5
	ldsb	[%l7 + %o5],	%l4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x36, %l0
	ldsh	[%l7 + %l0],	%o7
	and	%l0,	%o2,	%i3
	nop
	set	0x26, %i4
	sth	%g4,	[%l7 + %i4]
	and	%o4,	%i0,	%o5
	set	0x40, %g6
	stha	%g3,	[%l7 + %g6] 0x88
	and	%l5,	%g7,	%g5
	set	0x60, %o4
	stxa	%o6,	[%l7 + %o4] 0x88
	nop
	set	0x10, %o7
	stw	%i7,	[%l7 + %o7]
	st	%f15,	[%l7 + 0x28]
	st	%f13,	[%l7 + 0x50]
	nop
	set	0x0C, %g5
	lduw	[%l7 + %g5],	%g1
	nop
	set	0x5C, %l5
	ldsw	[%l7 + %l5],	%i4
	nop
	set	0x08, %o1
	stx	%l2,	[%l7 + %o1]
	nop
	set	0x73, %o2
	ldub	[%l7 + %o2],	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%o0
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	ld	[%l7 + 0x0C],	%f13
	set	0x30, %i5
	ldda	[%l7 + %i5] 0xe2,	%o0
	nop
	set	0x6F, %l1
	stb	%l3,	[%l7 + %l1]
	wr	%l6,	%g2,	%y
	or	%l1,	%i2,	%i6
	nop
	set	0x60, %i6
	lduw	[%l7 + %i6],	%l4
	and	%i5,	%o7,	%o2
	nop
	set	0x4B, %l4
	ldstub	[%l7 + %l4],	%l0
	wr	%i3,	%g4,	%pic
	set	0x5C, %i1
	stwa	%o4,	[%l7 + %i1] 0x81
	nop
	set	0x0A, %o6
	lduh	[%l7 + %o6],	%i0
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o5
	set	0x58, %l2
	stha	%l5,	[%l7 + %l2] 0xe2
	membar	#Sync
	fpadd16s	%f17,	%f14,	%f19
	set	0x1C, %o0
	sta	%f29,	[%l7 + %o0] 0x80
	set	0x08, %o3
	stxa	%g3,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x20, %i2
	stxa	%g5,	[%l7 + %i2] 0x81
	ld	[%l7 + 0x0C],	%f17
	set	0x20, %g7
	stda	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x28, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x1A, %g3
	ldsh	[%l7 + %g3],	%g7
	add	%i4,	%g1,	%l2
	nop
	set	0x24, %g2
	prefetch	[%l7 + %g2],	 1
	st	%fsr,	[%l7 + 0x08]
	bn,pn	%xcc,	loop_114
	st	%f0,	[%l7 + 0x70]
	nop
	set	0x58, %i7
	stx	%g6,	[%l7 + %i7]
	nop
	set	0x58, %g4
	sth	%o0,	[%l7 + %g4]
loop_114:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i1
	set	0x68, %i0
	stda	%l2,	[%l7 + %i0] 0x80
	ld	[%l7 + 0x6C],	%f16
	fpsub16	%f24,	%f30,	%f10
	nop
	set	0x28, %o5
	stx	%l6,	[%l7 + %o5]
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x80,	 3
	nop
	set	0x40, %i4
	lduw	[%l7 + %i4],	%o1
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x10, %o4
	lduh	[%l7 + %o4],	%i2
	nop
	set	0x08, %o7
	std	%f6,	[%l7 + %o7]
	set	0x38, %g5
	stwa	%l1,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%i5
	or	%o7,	%o2,	%l0
	add	%i6,	%i3,	%o4
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	set	0x38, %o1
	lda	[%l7 + %o1] 0x89,	%f17
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x44, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o5
	nop
	set	0x28, %i5
	std	%l4,	[%l7 + %i5]
	fpadd32	%f16,	%f10,	%f0
	and	%i0,	%g3,	%o6
	set	0x08, %l6
	stda	%g4,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x5D, %i6
	stb	%i7,	[%l7 + %i6]
	nop
	set	0x58, %l4
	ldsh	[%l7 + %l4],	%i4
	set	0x48, %l1
	stxa	%g1,	[%l7 + %l1] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f16
	nop
	set	0x6F, %o6
	stb	%g7,	[%l7 + %o6]
	set	0x3C, %g1
	stwa	%g6,	[%l7 + %g1] 0x80
	nop
	set	0x48, %l2
	std	%o0,	[%l7 + %l2]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f26
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x89,	%l2
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x81,	 2
	nop
	set	0x38, %g7
	std	%f18,	[%l7 + %g7]
	set	0x34, %l3
	stwa	%l3,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x4A, %g3
	stba	%l6,	[%l7 + %g3] 0xe3
	membar	#Sync
	and	%g2,	%i1,	%i2
	nop
	set	0x78, %i7
	swap	[%l7 + %i7],	%l1
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f16
	nop
	set	0x10, %i0
	std	%l4,	[%l7 + %i0]
	nop
	set	0x64, %g2
	swap	[%l7 + %g2],	%o1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i5
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x68, %i3
	std	%f8,	[%l7 + %i3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%i3,	%o4,	%ccr
	set	0x70, %o5
	stda	%g4,	[%l7 + %o5] 0x80
	and	%l0,	%o5,	%l5
	add	%i0,	%o6,	%g3
	wr	%g5,	%i7,	%ccr
	nop
	set	0x1A, %l0
	stb	%i4,	[%l7 + %l0]
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%g7
	set	0x10, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	add	%g6,	%o0,	%l2
	nop
	set	0x78, %i4
	stw	%l3,	[%l7 + %i4]
	nop
	set	0x1A, %g5
	ldsh	[%l7 + %g5],	%l6
	nop
	set	0x78, %l5
	lduh	[%l7 + %l5],	%o3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x88,	%g2
	nop
	set	0x60, %i5
	ldsh	[%l7 + %i5],	%i1
	nop
	set	0x70, %o1
	prefetch	[%l7 + %o1],	 2
	st	%fsr,	[%l7 + 0x5C]
	ld	[%l7 + 0x24],	%f15
	ld	[%l7 + 0x3C],	%f9
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x80,	 3
	nop
	set	0x73, %l4
	ldsb	[%l7 + %l4],	%i2
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%l4
	set	0x6C, %i1
	swapa	[%l7 + %i1] 0x89,	%o7
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x4E, %o6
	lduh	[%l7 + %o6],	%o1
	ld	[%l7 + 0x1C],	%f13
	and	%o2,	%i5,	%i6
	set	0x58, %g1
	stwa	%o4,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%i2
	set	0x70, %o0
	stha	%g4,	[%l7 + %o0] 0x89
	and	%o5,	%l5,	%i0
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%l0
	set	0x3C, %o3
	swapa	[%l7 + %o3] 0x81,	%o6
	nop
	set	0x3C, %g7
	ldsw	[%l7 + %g7],	%g5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i7
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x5E, %g3
	lduh	[%l7 + %g3],	%i4
	nop
	set	0x64, %i7
	ldstub	[%l7 + %i7],	%g1
	nop
	set	0x70, %g4
	std	%g6,	[%l7 + %g4]
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%g6
	nop
	set	0x4C, %g2
	stw	%l2,	[%l7 + %g2]
	set	0x50, %i3
	stda	%o0,	[%l7 + %i3] 0xea
	membar	#Sync
	and	%l3,	%l6,	%o3
	nop
	set	0x1C, %i0
	stw	%g2,	[%l7 + %i0]
	nop
	set	0x28, %l0
	stx	%l1,	[%l7 + %l0]
	nop
	set	0x7F, %o4
	ldsb	[%l7 + %o4],	%i1
	nop
	set	0x47, %o7
	ldub	[%l7 + %o7],	%i2
	and	%l4,	%o1,	%o7
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x80,	%o2
	set	0x18, %o5
	stda	%i4,	[%l7 + %o5] 0x81
	nop
	set	0x18, %g5
	std	%f10,	[%l7 + %g5]
	or	%o4,	%i6,	%i3
	nop
	set	0x0A, %l5
	sth	%g4,	[%l7 + %l5]
	set	0x24, %o2
	lda	[%l7 + %o2] 0x80,	%f22
	set	0x34, %g6
	lda	[%l7 + %g6] 0x89,	%f6
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f0
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x81,	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%g5
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f10
	nop
	set	0x7E, %l1
	sth	%l0,	[%l7 + %l1]
	and	%g3,	%i4,	%i7
	set	0x22, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g1
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x88,	%g6
	nop
	set	0x68, %o6
	std	%g6,	[%l7 + %o6]
	ld	[%l7 + 0x0C],	%f0
	set	0x30, %g1
	stda	%l2,	[%l7 + %g1] 0x89
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f0
	nop
	set	0x60, %l2
	lduh	[%l7 + %l2],	%o0
	nop
	set	0x48, %o3
	swap	[%l7 + %o3],	%l6
	add	%o3,	%g2,	%l1
	st	%f14,	[%l7 + 0x44]
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xe3,	%l2
	st	%fsr,	[%l7 + 0x50]
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x81,	%i2
	nop
	set	0x50, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x0E, %l3
	lduh	[%l7 + %l3],	%l4
	nop
	set	0x4C, %g4
	swap	[%l7 + %g4],	%o1
	st	%f16,	[%l7 + 0x30]
	nop
	set	0x28, %i7
	std	%o6,	[%l7 + %i7]
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	nop
	set	0x50, %i3
	ldsb	[%l7 + %i3],	%i5
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x81,	%o4
	set	0x14, %i0
	swapa	[%l7 + %i0] 0x81,	%o2
	nop
	set	0x48, %l0
	ldsb	[%l7 + %l0],	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%l5
	nop
	set	0x60, %o7
	ldsw	[%l7 + %o7],	%o5
	nop
	set	0x60, %o4
	std	%i0,	[%l7 + %o4]
	set	0x14, %o5
	ldstuba	[%l7 + %o5] 0x88,	%i6
	nop
	set	0x70, %g5
	std	%f30,	[%l7 + %g5]
	set	0x70, %i4
	stba	%g5,	[%l7 + %i4] 0x89
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%o6
	and	%g3,	%i4,	%i7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xeb,	%l0
	ld	[%l7 + 0x3C],	%f30
	nop
	set	0x34, %l5
	lduw	[%l7 + %l5],	%g1
	nop
	set	0x30, %l6
	stx	%g6,	[%l7 + %l6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%o0
	set	0x78, %i5
	stha	%l6,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x80,	%o3
	nop
	set	0x3A, %o1
	sth	%g2,	[%l7 + %o1]
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x88,	%l1
	nop
	set	0x34, %i1
	stw	%l3,	[%l7 + %i1]
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f14
	nop
	set	0x12, %o6
	ldstub	[%l7 + %o6],	%g7
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd2
	nop
	set	0x70, %o3
	std	%i2,	[%l7 + %o3]
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%l4
	nop
	set	0x48, %i6
	lduw	[%l7 + %i6],	%o7
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x88,	%i1
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%f2
	nop
	set	0x0E, %g3
	sth	%i5,	[%l7 + %g3]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f16
	set	0x6C, %g2
	stwa	%o4,	[%l7 + %g2] 0x89
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x7E, %i3
	sth	%o2,	[%l7 + %i3]
	nop
	set	0x20, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x48, %i7
	stx	%o1,	[%l7 + %i7]
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x29, %l0
	ldstub	[%l7 + %l0],	%g4
	set	0x64, %o7
	sta	%f30,	[%l7 + %o7] 0x80
	set	0x68, %o5
	stxa	%i3,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x78, %g5
	lda	[%l7 + %g5] 0x80,	%f13
	nop
	set	0x62, %i4
	ldsh	[%l7 + %i4],	%l5
	fpadd16s	%f24,	%f4,	%f15
	nop
	set	0x36, %o4
	sth	%o5,	[%l7 + %o4]
	nop
	set	0x33, %g6
	ldsb	[%l7 + %g6],	%i0
	nop
	set	0x08, %l5
	stx	%g5,	[%l7 + %l5]
	nop
	set	0x6C, %l6
	swap	[%l7 + %l6],	%i6
	set	0x0C, %i5
	stwa	%g3,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x40, %o2
	stda	%i4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x5C, %l1
	swap	[%l7 + %l1],	%o6
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%l0
	set	0x7A, %l4
	stba	%i7,	[%l7 + %l4] 0x88
	nop
	set	0x30, %i1
	stx	%g6,	[%l7 + %i1]
	be,pt	%xcc,	loop_115
	or	%l2,	%g1,	%l6
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x81,	%o3
loop_115:
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f26
	nop
	set	0x7A, %o3
	lduh	[%l7 + %o3],	%g2
	set	0x1C, %l2
	stha	%l1,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x08, %g7
	lduh	[%l7 + %g7],	%o0
	nop
	set	0x54, %o0
	ldsw	[%l7 + %o0],	%g7
	nop
	set	0x48, %i6
	ldsw	[%l7 + %i6],	%i2
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x18, %g4
	prefetcha	[%l7 + %g4] 0x80,	 3
	nop
	set	0x16, %g2
	ldub	[%l7 + %g2],	%l4
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf1,	%f16
	nop
	set	0x60, %i2
	lduh	[%l7 + %i2],	%i1
	and	%o7,	%o4,	%i5
	set	0x6C, %i3
	swapa	[%l7 + %i3] 0x80,	%o2
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xe3,	%o0
	nop
	set	0x50, %i7
	std	%f12,	[%l7 + %i7]
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x3C, %o5
	ldub	[%l7 + %o5],	%g4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1253
!	Type a   	: 22
!	Type cti   	: 26
!	Type x   	: 536
!	Type f   	: 42
!	Type i   	: 121
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 5 Start
!
.global thread_5
thread_5:
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
	set	0x8,	%g1
	set	0xF,	%g2
	set	0xC,	%g3
	set	0x1,	%g4
	set	0xB,	%g5
	set	0x1,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x4,	%i1
	set	-0x0,	%i2
	set	-0x2,	%i3
	set	-0xD,	%i4
	set	-0x9,	%i5
	set	-0x8,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x4D734D89,	%l0
	set	0x03D5F5D7,	%l1
	set	0x6BF4BD15,	%l2
	set	0x15BE8321,	%l3
	set	0x2A7A4017,	%l4
	set	0x6F933F1E,	%l5
	set	0x168BBE06,	%l6
	!# Output registers
	set	0x0168,	%o0
	set	-0x0D63,	%o1
	set	0x1B9D,	%o2
	set	0x0E7B,	%o3
	set	0x073B,	%o4
	set	0x1DE6,	%o5
	set	0x1E06,	%o6
	set	0x0C71,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	nop
	set	0x50, %l0
	swap	[%l7 + %l0],	%l5
	nop
	set	0x50, %g5
	stw	%i3,	[%l7 + %g5]
	set	0x47, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o5
	set	0x58, %o4
	lda	[%l7 + %o4] 0x88,	%f0
	set	0x58, %l5
	stwa	%i0,	[%l7 + %l5] 0x88
	set	0x58, %g6
	stxa	%i6,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe2,	%g4
	set	0x20, %o2
	stwa	%i4,	[%l7 + %o2] 0x89
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%g3
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x89,	 2
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%i6
	nop
	set	0x0C, %i1
	swap	[%l7 + %i1],	%o6
	set	0x34, %o1
	sta	%f31,	[%l7 + %o1] 0x80
	nop
	set	0x18, %o6
	swap	[%l7 + %o6],	%l2
	nop
	set	0x6C, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x70, %l2
	swapa	[%l7 + %l2] 0x80,	%g1
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x88,	%l6
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%o3
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%g6
	set	0x74, %l3
	sta	%f30,	[%l7 + %l3] 0x89
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%o0
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%f5,	[%l7 + 0x34]
	st	%f16,	[%l7 + 0x1C]
	set	0x26, %i2
	stha	%g7,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	set	0x3A, %g3
	stba	%l1,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x1C, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x41, %o7
	ldub	[%l7 + %o7],	%l3
	nop
	set	0x34, %i7
	ldsb	[%l7 + %i7],	%i2
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x89,	%l4
	nop
	set	0x78, %o5
	ldsh	[%l7 + %o5],	%i1
	nop
	set	0x0C, %g5
	lduw	[%l7 + %g5],	%o7
	set	0x5C, %o4
	lda	[%l7 + %o4] 0x88,	%f23
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x6E, %i4
	lduh	[%l7 + %i4],	%i5
	nop
	set	0x74, %g6
	sth	%o4,	[%l7 + %g6]
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x88,	%o2
	and	%g4,	%o1,	%l5
	nop
	set	0x10, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%i0
	nop
	set	0x43, %l1
	stb	%i6,	[%l7 + %l1]
	set	0x45, %l4
	ldstuba	[%l7 + %l4] 0x88,	%g5
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x38, %o1
	lduh	[%l7 + %o1],	%i4
	set	0x74, %i1
	sta	%f16,	[%l7 + %i1] 0x80
	set	0x7C, %g1
	sta	%f31,	[%l7 + %g1] 0x89
	be,a	%xcc,	loop_116
	nop
	set	0x6E, %o6
	stb	%g3,	[%l7 + %o6]
	or	%i3,	%l0,	%o6
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f30
loop_116:
	nop
	set	0x28, %g7
	lda	[%l7 + %g7] 0x80,	%f11
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%i7
	set	0x08, %l3
	stwa	%l2,	[%l7 + %l3] 0x81
	set	0x5A, %l2
	ldstuba	[%l7 + %l2] 0x88,	%g1
	and	%o3,	%l6,	%g2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%g7
	fpsub32s	%f13,	%f16,	%f17
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%l1
	nop
	set	0x3F, %i6
	ldub	[%l7 + %i6],	%l3
	set	0x60, %g2
	lda	[%l7 + %g2] 0x80,	%f22
	nop
	set	0x68, %i2
	std	%l4,	[%l7 + %i2]
	nop
	set	0x1B, %i3
	ldub	[%l7 + %i3],	%i1
	nop
	set	0x10, %i0
	std	%f16,	[%l7 + %i0]
	fpsub32	%f8,	%f2,	%f20
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%i2
	set	0x18, %g3
	sta	%f1,	[%l7 + %g3] 0x88
	set	0x78, %l0
	stxa	%o7,	[%l7 + %l0] 0x80
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x28, %g5
	lda	[%l7 + %g5] 0x89,	%f24
	and	%o4,	%o2,	%g4
	set	0x70, %i7
	ldda	[%l7 + %i7] 0xe3,	%o0
	nop
	set	0x69, %i4
	ldstub	[%l7 + %i4],	%i5
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%l5
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xe3,	%o4
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%i0
	nop
	set	0x18, %o2
	lduw	[%l7 + %o2],	%i6
	nop
	set	0x20, %l6
	lduh	[%l7 + %l6],	%i4
	and	%g3,	%i3,	%g5
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x18, %l4
	std	%o6,	[%l7 + %l4]
	or	%i7,	%l2,	%l0
	set	0x24, %o1
	sta	%f28,	[%l7 + %o1] 0x80
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe3,	%o2
	nop
	nop
	setx	0x2701D9FFDCCA5E0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x86E9E8DD50120509,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f10,	%f4
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x5C, %i5
	stw	%g1,	[%l7 + %i5]
	st	%f31,	[%l7 + 0x78]
	nop
	set	0x7C, %g1
	stw	%g2,	[%l7 + %g1]
	set	0x70, %o6
	stxa	%l6,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%g6
	add	%o0,	%g7,	%l3
	nop
	set	0x2F, %o0
	ldsb	[%l7 + %o0],	%l1
	nop
	set	0x2E, %o3
	ldsb	[%l7 + %o3],	%i1
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%i2
	nop
	set	0x2A, %l3
	stb	%l4,	[%l7 + %l3]
	nop
	set	0x78, %g4
	stw	%o4,	[%l7 + %g4]
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x30, %i2
	stw	%o7,	[%l7 + %i2]
	set	0x24, %i6
	stwa	%o2,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x44, %i0
	stwa	%o1,	[%l7 + %i0] 0x89
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%i5
	nop
	set	0x4C, %i3
	stw	%l5,	[%l7 + %i3]
	set	0x38, %o7
	lda	[%l7 + %o7] 0x81,	%f0
	st	%f6,	[%l7 + 0x70]
	set	0x66, %l0
	stha	%o5,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x4C, %o5
	sta	%f5,	[%l7 + %o5] 0x80
	st	%fsr,	[%l7 + 0x14]
	ld	[%l7 + 0x0C],	%f15
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x88,	%f17
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%i0
	set	0x10, %i7
	stda	%i4,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x58, %i4
	stxa	%i6,	[%l7 + %i4] 0x81
	nop
	set	0x40, %g6
	std	%g2,	[%l7 + %g6]
	set	0x09, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i3
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc2
	set	0x68, %o4
	ldxa	[%l7 + %o4] 0x80,	%o6
	add	%g5,	%l2,	%l0
	nop
	set	0x30, %l4
	ldx	[%l7 + %l4],	%i7
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f16
	set	0x78, %o1
	stda	%g0,	[%l7 + %o1] 0x80
	nop
	set	0x5C, %i1
	stw	%o3,	[%l7 + %i1]
	set	0x08, %g1
	sta	%f5,	[%l7 + %g1] 0x88
	or	%l6,	%g6,	%g2
	nop
	set	0x27, %i5
	stb	%o0,	[%l7 + %i5]
	nop
	set	0x14, %g7
	sth	%l3,	[%l7 + %g7]
	nop
	set	0x28, %o0
	ldsh	[%l7 + %o0],	%g7
	be,a,pt	%xcc,	loop_117
	nop
	set	0x65, %o3
	ldub	[%l7 + %o3],	%i1
	nop
	set	0x64, %l2
	lduw	[%l7 + %l2],	%l1
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x81,	%l4
loop_117:
	nop
	set	0x48, %o6
	lduh	[%l7 + %o6],	%o4
	nop
	set	0x48, %g2
	std	%i2,	[%l7 + %g2]
	set	0x44, %g4
	stha	%o7,	[%l7 + %g4] 0xe2
	membar	#Sync
	add	%o2,	%o1,	%i5
	nop
	set	0x36, %i2
	ldstub	[%l7 + %i2],	%g4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc8
	set	0x78, %i3
	stxa	%o5,	[%l7 + %i3] 0x81
	set	0x28, %o7
	stda	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%i6
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f10
	set	0x28, %g3
	stda	%g2,	[%l7 + %g3] 0xeb
	membar	#Sync
	add	%l5,	%o6,	%i3
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf9
	membar	#Sync
	or	%l2,	%l0,	%i7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xe2,	%g4
	set	0x7C, %i4
	stba	%g1,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x56, %l5
	stba	%o3,	[%l7 + %l5] 0x80
	add	%l6,	%g2,	%g6
	set	0x50, %o2
	stwa	%o0,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x58, %g6
	stwa	%l3,	[%l7 + %g6] 0x81
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%i1
	set	0x28, %o4
	lda	[%l7 + %o4] 0x80,	%f15
	set	0x18, %l6
	stxa	%l4,	[%l7 + %l6] 0x81
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f0
	nop
	set	0x7C, %l4
	ldsb	[%l7 + %l4],	%l1
	ld	[%l7 + 0x28],	%f31
	set	0x16, %o1
	stha	%o4,	[%l7 + %o1] 0x81
	set	0x20, %g1
	stda	%o6,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xd0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf9
	membar	#Sync
	and	%i2,	%o1,	%o2
	nop
	set	0x2F, %o0
	ldstub	[%l7 + %o0],	%i5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f0
	set	0x6A, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g4
	nop
	set	0x52, %l2
	stb	%i0,	[%l7 + %l2]
	set	0x6C, %o6
	stwa	%i4,	[%l7 + %o6] 0x89
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	add	%o5,	%g3,	%o6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%l5
	ld	[%l7 + 0x74],	%f8
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x88,	%l2
	st	%fsr,	[%l7 + 0x60]
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x80,	%l0
	add	%g5,	%g1,	%i7
	nop
	set	0x51, %g4
	ldsb	[%l7 + %g4],	%l6
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x89,	%g2
	nop
	set	0x60, %o7
	ldsb	[%l7 + %o7],	%o3
	set	0x6C, %i3
	swapa	[%l7 + %i3] 0x80,	%g6
	nop
	set	0x16, %i0
	lduh	[%l7 + %i0],	%o0
	nop
	set	0x4B, %g3
	ldub	[%l7 + %g3],	%l3
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%l4
	ld	[%l7 + 0x64],	%f29
	nop
	set	0x64, %g5
	stw	%i1,	[%l7 + %g5]
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xe2,	%o4
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%l1
	nop
	set	0x70, %i4
	ldsh	[%l7 + %i4],	%i2
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%o7
	st	%f6,	[%l7 + 0x64]
	set	0x4C, %l5
	lda	[%l7 + %l5] 0x81,	%f25
	set	0x50, %o4
	stxa	%o2,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%o1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f16
	nop
	set	0x58, %l1
	std	%f14,	[%l7 + %l1]
	set	0x14, %o1
	stwa	%i5,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%g4
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x88,	%i0
	set	0x20, %i5
	ldda	[%l7 + %i5] 0xea,	%i6
	nop
	set	0x2C, %o3
	swap	[%l7 + %o3],	%o5
	and	%g3,	%o6,	%i3
	set	0x38, %o0
	stda	%l2,	[%l7 + %o0] 0x80
	and	%l0,	%l5,	%g1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd8,	%f16
	nop
	set	0x38, %o6
	prefetch	[%l7 + %o6],	 0
	st	%fsr,	[%l7 + 0x78]
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x89,	%g5
	ld	[%l7 + 0x7C],	%f10
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	st	%f21,	[%l7 + 0x18]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%o3
	ld	[%l7 + 0x34],	%f28
	nop
	set	0x08, %g4
	stb	%i7,	[%l7 + %g4]
	nop
	set	0x5A, %g2
	sth	%g6,	[%l7 + %g2]
	set	0x3C, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l3
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x18, %i3
	std	%g6,	[%l7 + %i3]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f16
	nop
	set	0x3C, %g3
	swap	[%l7 + %g3],	%i1
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x24, %g5
	lduw	[%l7 + %g5],	%l4
	set	0x6C, %l0
	sta	%f29,	[%l7 + %l0] 0x80
	set	0x61, %i7
	stba	%o4,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f14
	nop
	set	0x12, %o2
	lduh	[%l7 + %o2],	%l1
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f6
	fpadd16s	%f25,	%f0,	%f9
	nop
	set	0x4D, %o4
	ldstub	[%l7 + %o4],	%i2
	nop
	set	0x55, %l5
	ldsb	[%l7 + %l5],	%o2
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x80,	%o7
	nop
	nop
	setx	0xB6C32A03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xE572F971,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f20,	%f12
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%o1
	nop
	set	0x56, %l1
	stb	%i4,	[%l7 + %l1]
	nop
	set	0x6D, %o1
	ldsb	[%l7 + %o1],	%i6
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x88,	%i0
	nop
	set	0x4C, %g7
	lduw	[%l7 + %g7],	%g3
	nop
	set	0x08, %i1
	std	%o6,	[%l7 + %i1]
	set	0x70, %g1
	stba	%i3,	[%l7 + %g1] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l0
	bl,pt	%xcc,	loop_118
	nop
	set	0x6A, %i5
	stb	%l2,	[%l7 + %i5]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f12
	nop
	set	0x20, %o3
	std	%f22,	[%l7 + %o3]
loop_118:
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f4
	set	0x10, %l3
	lda	[%l7 + %l3] 0x80,	%f16
	nop
	set	0x30, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x55, %i2
	stb	%l5,	[%l7 + %i2]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc0
	set	0x4A, %g4
	stha	%g5,	[%l7 + %g4] 0xea
	membar	#Sync
	and	%l6,	%g1,	%o3
	set	0x48, %o7
	sta	%f12,	[%l7 + %o7] 0x81
	nop
	set	0x7D, %i6
	stb	%i7,	[%l7 + %i6]
	nop
	set	0x30, %i3
	std	%g2,	[%l7 + %i3]
	set	0x60, %i0
	stwa	%l3,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x5D, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o0
	nop
	set	0x68, %l0
	stw	%g7,	[%l7 + %l0]
	nop
	set	0x50, %i7
	ldsh	[%l7 + %i7],	%g6
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	or	%l4,	%o4,	%i1
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f6
	nop
	set	0x4F, %o5
	stb	%i2,	[%l7 + %o5]
	add	%o2,	%l1,	%o7
	set	0x65, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i5
	set	0x4C, %o4
	lda	[%l7 + %o4] 0x88,	%f12
	add	%o1,	%i4,	%g4
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	set	0x68, %l5
	stxa	%i6,	[%l7 + %l5] 0x80
	set	0x60, %l1
	lda	[%l7 + %l1] 0x88,	%f6
	nop
	set	0x67, %l6
	ldstub	[%l7 + %l6],	%i0
	or	%g3,	%o6,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%l2
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%l5
	nop
	set	0x68, %g7
	std	%f22,	[%l7 + %g7]
	nop
	set	0x78, %i1
	ldsh	[%l7 + %i1],	%g5
	nop
	set	0x44, %g1
	lduw	[%l7 + %g1],	%l0
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%g0
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc8
	nop
	set	0x58, %o3
	ldub	[%l7 + %o3],	%l6
	nop
	set	0x78, %l2
	std	%f4,	[%l7 + %l2]
	bn,a	%xcc,	loop_119
	ble	%icc,	loop_120
	add	%o3,	%g2,	%l3
	nop
	set	0x15, %l3
	ldub	[%l7 + %l3],	%o0
loop_119:
	nop
	set	0x41, %i5
	stb	%g7,	[%l7 + %i5]
loop_120:
	add	%i7,	%l4,	%o4
	and	%g6,	%i1,	%o2
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x78, %i2
	stw	%i2,	[%l7 + %i2]
	nop
	set	0x40, %o6
	stx	%o7,	[%l7 + %o6]
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x88,	 4
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f8
	fpadd32	%f10,	%f16,	%f4
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%i4
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x81,	%o1
	nop
	set	0x68, %i0
	stx	%i4,	[%l7 + %i0]
	set	0x0C, %i3
	swapa	[%l7 + %i3] 0x80,	%g4
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xe3,	%i0
	nop
	set	0x7C, %g3
	swap	[%l7 + %g3],	%g3
	add	%o6,	%i3,	%i6
	set	0x38, %g5
	lda	[%l7 + %g5] 0x81,	%f9
	set	0x48, %i7
	swapa	[%l7 + %i7] 0x80,	%o5
	nop
	set	0x58, %i4
	std	%f16,	[%l7 + %i4]
	set	0x45, %o2
	stba	%l5,	[%l7 + %o2] 0x80
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xe2,	%l2
	nop
	set	0x2A, %g6
	ldsb	[%l7 + %g6],	%g5
	set	0x40, %o4
	stxa	%l0,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x62, %l1
	stba	%g1,	[%l7 + %l1] 0xe2
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%g2
	nop
	set	0x14, %l6
	lduh	[%l7 + %l6],	%l6
	set	0x64, %l5
	lda	[%l7 + %l5] 0x81,	%f7
	bgu	%xcc,	loop_121
	nop
	set	0x10, %g7
	ldstub	[%l7 + %g7],	%l3
	nop
	set	0x67, %o1
	ldub	[%l7 + %o1],	%o0
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x89,	%f11
loop_121:
	nop
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x89,	%g7
	nop
	set	0x22, %o0
	ldsh	[%l7 + %o0],	%i7
	nop
	set	0x58, %g1
	std	%f12,	[%l7 + %g1]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%l4
	set	0x5C, %l2
	sta	%f6,	[%l7 + %l2] 0x81
	set	0x58, %l3
	stwa	%g6,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x50, %o3
	std	%i0,	[%l7 + %o3]
	nop
	set	0x58, %i2
	stw	%o2,	[%l7 + %i2]
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%o7
	set	0x38, %i5
	stwa	%l1,	[%l7 + %i5] 0x88
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%i5
	nop
	set	0x58, %g4
	std	%i2,	[%l7 + %g4]
	nop
	set	0x68, %o7
	ldub	[%l7 + %o7],	%i4
	ld	[%l7 + 0x44],	%f6
	set	0x18, %i6
	stxa	%o1,	[%l7 + %i6] 0x81
	bl	%xcc,	loop_122
	nop
	set	0x69, %i0
	ldstub	[%l7 + %i0],	%i0
	nop
	set	0x30, %i3
	std	%g4,	[%l7 + %i3]
	nop
	set	0x55, %l0
	stb	%o6,	[%l7 + %l0]
loop_122:
	nop
	set	0x78, %g5
	std	%g2,	[%l7 + %g5]
	nop
	set	0x70, %g3
	std	%f4,	[%l7 + %g3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBB1, 	%sys_tick_cmpr
	or	%l5,	%l2,	%o5
	set	0x3C, %i7
	swapa	[%l7 + %i7] 0x81,	%l0
	set	0x24, %i4
	stha	%g5,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f16
	set	0x0C, %g6
	sta	%f2,	[%l7 + %g6] 0x80
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%g0
	set	0x50, %l1
	swapa	[%l7 + %l1] 0x80,	%g2
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xe2,	%o2
	and	%l3,	%o0,	%l6
	and	%i7,	%o4,	%l4
	set	0x30, %o4
	stda	%g6,	[%l7 + %o4] 0x89
	nop
	set	0x48, %l5
	std	%g6,	[%l7 + %l5]
	nop
	set	0x1F, %g7
	ldsb	[%l7 + %g7],	%o2
	nop
	set	0x2C, %i1
	stw	%o7,	[%l7 + %i1]
	nop
	set	0x28, %l4
	ldsb	[%l7 + %l4],	%i1
	nop
	set	0x6C, %o0
	sth	%i5,	[%l7 + %o0]
	ld	[%l7 + 0x08],	%f15
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	set	0x40, %g1
	stda	%l0,	[%l7 + %g1] 0x89
	nop
	set	0x70, %l2
	std	%o0,	[%l7 + %l2]
	nop
	set	0x48, %o3
	stx	%i0,	[%l7 + %o3]
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f12
	set	0x2A, %o6
	stba	%g4,	[%l7 + %o6] 0x80
	nop
	set	0x18, %i5
	std	%i4,	[%l7 + %i5]
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%o6
	or	%i6,	%g3,	%l5
	fpsub32	%f8,	%f28,	%f30
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l2
	set	0x40, %g4
	stda	%g4,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xeb,	%g2
	and	%o3,	%l3,	%o0
	nop
	set	0x48, %l3
	prefetch	[%l7 + %l3],	 4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%l6
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f16
	nop
	set	0x30, %i3
	stx	%o4,	[%l7 + %i3]
	nop
	set	0x78, %l0
	lduh	[%l7 + %l0],	%l4
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x88,	%i7
	nop
	set	0x78, %i0
	stx	%g7,	[%l7 + %i0]
	nop
	set	0x24, %i7
	sth	%o2,	[%l7 + %i7]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%o7
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f0
	nop
	set	0x68, %i4
	std	%f18,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x0C]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xda
	add	%i5,	%i2,	%i1
	nop
	set	0x32, %o2
	ldsh	[%l7 + %o2],	%o1
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f26
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x81,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%g4
	and	%i4,	%i6,	%g3
	nop
	set	0x3C, %l5
	swap	[%l7 + %l5],	%o6
	set	0x6B, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%l5
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%l0
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f14
	nop
	set	0x64, %i1
	lduh	[%l7 + %i1],	%l2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%f0
	or	%g2,	%o3,	%l3
	nop
	set	0x50, %g1
	std	%f20,	[%l7 + %g1]
	set	0x2E, %o1
	stha	%g5,	[%l7 + %o1] 0x81
	nop
	set	0x70, %l2
	std	%f22,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x48]
	set	0x3B, %o3
	stba	%g1,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x60, %o6
	stx	%l6,	[%l7 + %o6]
	nop
	set	0x46, %i5
	ldub	[%l7 + %i5],	%o0
	nop
	set	0x18, %i2
	std	%o4,	[%l7 + %i2]
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%g7
	nop
	set	0x52, %g2
	ldub	[%l7 + %g2],	%o2
	set	0x6C, %o7
	stwa	%g6,	[%l7 + %o7] 0x88
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%i4
	and	%o7,	%i1,	%i2
	fpadd32s	%f22,	%f24,	%f19
	nop
	set	0x4C, %l3
	stb	%o1,	[%l7 + %l3]
	nop
	set	0x52, %l0
	sth	%l1,	[%l7 + %l0]
	set	0x78, %g5
	stda	%g4,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x30, %i0
	std	%i4,	[%l7 + %i0]
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	set	0x51, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g3
	nop
	set	0x40, %i4
	ldsw	[%l7 + %i4],	%o6
	nop
	set	0x7C, %i3
	lduw	[%l7 + %i3],	%i0
	nop
	set	0x6A, %o2
	stb	%i3,	[%l7 + %o2]
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%l5
	nop
	set	0x20, %g6
	stx	%l0,	[%l7 + %g6]
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	or	%l2,	%g2,	%o5
	set	0x64, %o5
	swapa	[%l7 + %o5] 0x89,	%o3
	set	0x24, %o4
	sta	%f14,	[%l7 + %o4] 0x80
	add	%l3,	%g1,	%g5
	nop
	set	0x10, %g7
	swap	[%l7 + %g7],	%o0
	nop
	set	0x4E, %l5
	ldsb	[%l7 + %l5],	%o4
	nop
	set	0x68, %i1
	stx	%l6,	[%l7 + %i1]
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%l4
	nop
	set	0x70, %l4
	stx	%g7,	[%l7 + %l4]
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o2
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x89,	%i7
	nop
	set	0x5E, %o3
	ldsb	[%l7 + %o3],	%i5
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%o6
	nop
	set	0x52, %i5
	ldsh	[%l7 + %i5],	%i1
	set	0x68, %l2
	stba	%i2,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x38, %i2
	std	%f10,	[%l7 + %i2]
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%g6
	nop
	set	0x2A, %o7
	lduh	[%l7 + %o7],	%o1
	set	0x30, %g2
	stha	%l1,	[%l7 + %g2] 0x88
	set	0x20, %l3
	stxa	%i4,	[%l7 + %l3] 0x80
	ld	[%l7 + 0x4C],	%f15
	nop
	set	0x2C, %l0
	swap	[%l7 + %l0],	%g4
	set	0x5E, %i6
	stba	%g3,	[%l7 + %i6] 0x88
	set	0x1C, %i0
	sta	%f31,	[%l7 + %i0] 0x81
	set	0x34, %g5
	lda	[%l7 + %g5] 0x81,	%f4
	nop
	set	0x66, %i7
	ldub	[%l7 + %i7],	%i6
	st	%fsr,	[%l7 + 0x14]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xe2,	%o6
	nop
	set	0x0A, %i4
	sth	%i3,	[%l7 + %i4]
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x88,	%i0
	set	0x7C, %i3
	swapa	[%l7 + %i3] 0x80,	%l5
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f2
	st	%f10,	[%l7 + 0x74]
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x89,	 3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f0
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l2
	set	0x46, %g6
	stba	%l3,	[%l7 + %g6] 0xe3
	membar	#Sync
	wr	%o3,	%g1,	%ccr
	nop
	set	0x7C, %g7
	swap	[%l7 + %g7],	%g5
	fpsub16s	%f5,	%f16,	%f10
	nop
	set	0x28, %l5
	sth	%o0,	[%l7 + %l5]
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x89,	%l6
	nop
	set	0x74, %l4
	stw	%o4,	[%l7 + %l4]
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x89,	%l4
	set	0x34, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g7
	set	0x74, %o3
	swapa	[%l7 + %o3] 0x81,	%o2
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x81,	%i4
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%i7
	nop
	set	0x18, %l2
	stx	%i1,	[%l7 + %l2]
	set	0x70, %i2
	stxa	%o7,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x88,	%i2
	nop
	set	0x3E, %i5
	ldsh	[%l7 + %i5],	%g6
	nop
	set	0x28, %g2
	stw	%l1,	[%l7 + %g2]
	nop
	set	0x52, %l3
	stb	%o1,	[%l7 + %l3]
	ld	[%l7 + 0x0C],	%f19
	bge,pn	%xcc,	loop_123
	st	%fsr,	[%l7 + 0x60]
	set	0x10, %o7
	stxa	%i4,	[%l7 + %o7] 0xeb
	membar	#Sync
loop_123:
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%g4
	or	%g3,	%i6,	%i3
	st	%fsr,	[%l7 + 0x50]
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x88,	%o6
	set	0x48, %g5
	lda	[%l7 + %g5] 0x80,	%f17
	st	%f19,	[%l7 + 0x38]
	set	0x4C, %i7
	stwa	%i0,	[%l7 + %i7] 0x88
	add	%l0,	%g2,	%l5
	set	0x10, %g3
	stxa	%l2,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x40, %i4
	stxa	%o5,	[%l7 + %i4] 0xe2
	membar	#Sync
	or	%l3,	%o3,	%g5
	nop
	set	0x60, %o2
	swap	[%l7 + %o2],	%g1
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%o0
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x81,	 2
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f24
	nop
	set	0x10, %l6
	stx	%l4,	[%l7 + %l6]
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f24
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x88,	%o4
	nop
	set	0x24, %g6
	stw	%o2,	[%l7 + %g6]
	set	0x30, %g7
	ldxa	[%l7 + %g7] 0x88,	%i5
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x81,	%g7
	or	%i7,	%o7,	%i2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x80,	%i0
	set	0x34, %l4
	stwa	%l1,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x34, %g1
	lda	[%l7 + %g1] 0x81,	%f6
	set	0x48, %o3
	stha	%g6,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%o0
	set	0x08, %o1
	stwa	%i4,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x50, %l2
	stx	%g3,	[%l7 + %l2]
	st	%f30,	[%l7 + 0x0C]
	nop
	set	0x3E, %i2
	ldsh	[%l7 + %i2],	%g4
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f12
	or	%i3,	%o6,	%i0
	ld	[%l7 + 0x68],	%f28
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f10
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x89,	%f29
	nop
	set	0x78, %o0
	std	%f24,	[%l7 + %o0]
	nop
	set	0x5A, %o7
	ldstub	[%l7 + %o7],	%i6
	nop
	set	0x32, %l3
	ldub	[%l7 + %l3],	%g2
	nop
	set	0x14, %i6
	stw	%l0,	[%l7 + %i6]
	nop
	set	0x42, %l0
	sth	%l5,	[%l7 + %l0]
	nop
	set	0x08, %g5
	lduw	[%l7 + %g5],	%l2
	nop
	set	0x1C, %i7
	ldsw	[%l7 + %i7],	%o5
	nop
	set	0x6A, %g3
	lduh	[%l7 + %g3],	%l3
	nop
	set	0x38, %i4
	ldsh	[%l7 + %i4],	%o3
	set	0x78, %o2
	ldstuba	[%l7 + %o2] 0x80,	%g1
	nop
	set	0x15, %i0
	ldstub	[%l7 + %i0],	%g5
	fpsub16	%f22,	%f22,	%f22
	nop
	set	0x74, %i3
	ldsw	[%l7 + %i3],	%o0
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x74, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x54, %o5
	swapa	[%l7 + %o5] 0x81,	%l4
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x89,	 4
	or	%l6,	%o2,	%g7
	nop
	set	0x5E, %g7
	ldsb	[%l7 + %g7],	%i7
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 4
	add	%i5,	%i2,	%o7
	nop
	set	0x64, %l5
	prefetch	[%l7 + %l5],	 0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i1
	or	%o1,	%g6,	%g3
	nop
	set	0x48, %l4
	lduw	[%l7 + %l4],	%i4
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x88,	%f5
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%g4
	ld	[%l7 + 0x74],	%f17
	nop
	set	0x68, %g1
	swap	[%l7 + %g1],	%o6
	nop
	set	0x56, %o1
	lduh	[%l7 + %o1],	%i3
	fpsub32	%f8,	%f20,	%f20
	set	0x30, %o6
	lda	[%l7 + %o6] 0x88,	%f11
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%i0
	set	0x65, %i2
	stba	%g2,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x10, %l2
	stha	%l0,	[%l7 + %l2] 0x80
	nop
	set	0x55, %g4
	ldsb	[%l7 + %g4],	%l5
	nop
	set	0x30, %g2
	stx	%l2,	[%l7 + %g2]
	nop
	set	0x77, %o0
	ldub	[%l7 + %o0],	%o5
	ld	[%l7 + 0x28],	%f11
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	nop
	set	0x5C, %l3
	ldsw	[%l7 + %l3],	%o3
	nop
	set	0x16, %i6
	ldub	[%l7 + %i6],	%g5
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x89,	 0
	set	0x28, %g5
	stda	%l4,	[%l7 + %g5] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%o4
	nop
	set	0x66, %l0
	sth	%o2,	[%l7 + %l0]
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%g7
	nop
	set	0x24, %i4
	stw	%i7,	[%l7 + %i4]
	nop
	set	0x4A, %o2
	ldub	[%l7 + %o2],	%l6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x88
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%i2
	nop
	set	0x08, %i3
	stx	%o7,	[%l7 + %i3]
	nop
	set	0x60, %l1
	stx	%i5,	[%l7 + %l1]
	nop
	set	0x38, %l6
	swap	[%l7 + %l6],	%i1
	nop
	set	0x20, %o5
	stx	%o1,	[%l7 + %o5]
	set	0x3C, %g6
	swapa	[%l7 + %g6] 0x80,	%g6
	nop
	set	0x71, %g7
	ldub	[%l7 + %g7],	%l1
	set	0x30, %o4
	stxa	%i4,	[%l7 + %o4] 0x81
	set	0x68, %l4
	stha	%g3,	[%l7 + %l4] 0x89
	set	0x1B, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o6
	nop
	set	0x20, %o3
	stx	%i3,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x6C]
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc4
	set	0x3B, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i6
	or	%i0,	%g4,	%l0
	nop
	set	0x75, %g1
	ldub	[%l7 + %g1],	%g2
	nop
	set	0x38, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%l5
	fpadd16s	%f26,	%f26,	%f11
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x81,	 4
	set	0x60, %g2
	stwa	%l3,	[%l7 + %g2] 0x88
	nop
	set	0x7C, %l2
	ldsw	[%l7 + %l2],	%o3
	st	%f26,	[%l7 + 0x30]
	nop
	set	0x78, %o0
	lduh	[%l7 + %o0],	%g5
	nop
	set	0x44, %i5
	ldsw	[%l7 + %i5],	%l2
	or	%g1,	%l4,	%o0
	or	%o2,	%g7,	%i7
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f0
	nop
	set	0x68, %o7
	std	%f2,	[%l7 + %o7]
	nop
	set	0x3C, %l3
	stb	%l6,	[%l7 + %l3]
	wr	%o4,	%i2,	%clear_softint
	ld	[%l7 + 0x60],	%f10
	and	%i5,	%i1,	%o1
	nop
	set	0x60, %g5
	stx	%g6,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f30
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o7
	nop
	set	0x50, %o2
	lduw	[%l7 + %o2],	%i4
	ld	[%l7 + 0x44],	%f23
	nop
	set	0x70, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x7A, %i7
	sth	%g3,	[%l7 + %i7]
	nop
	set	0x38, %g3
	swap	[%l7 + %g3],	%o6
	set	0x48, %i3
	stda	%l0,	[%l7 + %i3] 0x80
	or	%i6,	%i0,	%i3
	nop
	set	0x20, %l1
	ldstub	[%l7 + %l1],	%g4
	nop
	set	0x31, %l6
	ldsb	[%l7 + %l6],	%l0
	nop
	set	0x0D, %g6
	stb	%g2,	[%l7 + %g6]
	ld	[%l7 + 0x08],	%f4
	nop
	set	0x22, %g7
	sth	%l5,	[%l7 + %g7]
	set	0x58, %o4
	stda	%o4,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x52, %l4
	lduh	[%l7 + %l4],	%o3
	nop
	set	0x18, %i1
	std	%f8,	[%l7 + %i1]
	ld	[%l7 + 0x74],	%f7
	nop
	set	0x38, %o5
	stx	%g5,	[%l7 + %o5]
	nop
	set	0x70, %l5
	swap	[%l7 + %l5],	%l3
	nop
	set	0x5A, %o3
	ldsh	[%l7 + %o3],	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%o0
	nop
	set	0x16, %o1
	ldub	[%l7 + %o1],	%o2
	set	0x30, %g1
	stwa	%g7,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x40, %i2
	std	%l4,	[%l7 + %i2]
	or	%i7,	%l6,	%i2
	set	0x58, %g4
	sta	%f13,	[%l7 + %g4] 0x88
	set	0x6B, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i5
	nop
	set	0x68, %l2
	stx	%i1,	[%l7 + %l2]
	nop
	set	0x68, %g2
	stw	%o1,	[%l7 + %g2]
	fpsub32	%f10,	%f2,	%f28
	nop
	set	0x54, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x24, %i5
	swap	[%l7 + %i5],	%o4
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%g6
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%i4
	or	%g3,	%o6,	%o7
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc2
	set	0x48, %l0
	lda	[%l7 + %l0] 0x88,	%f23
	fpsub32s	%f24,	%f17,	%f15
	nop
	set	0x10, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x80,	%l0
	nop
	set	0x78, %i0
	sth	%i0,	[%l7 + %i0]
	nop
	set	0x0C, %l3
	lduh	[%l7 + %l3],	%i3
	and	%g4,	%l0,	%g2
	and	%l5,	%i6,	%o3
	set	0x28, %g3
	lda	[%l7 + %g3] 0x81,	%f9
	set	0x56, %i3
	stha	%g5,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x5C, %i7
	ldsb	[%l7 + %i7],	%l3
	nop
	set	0x0C, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x28, %g6
	ldub	[%l7 + %g6],	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%o0
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x88,	%o2
	nop
	set	0x17, %l1
	ldub	[%l7 + %l1],	%g1
	set	0x15, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g7
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x68, %l4
	stxa	%l4,	[%l7 + %l4] 0xe2
	membar	#Sync
	and	%l6,	%i2,	%i5
	add	%i7,	%o1,	%i1
	nop
	set	0x4C, %o5
	prefetch	[%l7 + %o5],	 4
	be,pt	%xcc,	loop_124
	nop
	set	0x76, %l5
	lduh	[%l7 + %l5],	%o4
	st	%fsr,	[%l7 + 0x44]
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x80,	 4
loop_124:
	nop
	set	0x50, %o1
	sth	%g3,	[%l7 + %o1]
	nop
	set	0x2E, %i2
	ldstub	[%l7 + %i2],	%g6
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f20
	nop
	set	0x64, %o6
	swap	[%l7 + %o6],	%o7
	nop
	set	0x2C, %g1
	lduw	[%l7 + %g1],	%o6
	nop
	set	0x20, %g2
	prefetch	[%l7 + %g2],	 3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	nop
	set	0x33, %l2
	ldstub	[%l7 + %l2],	%l1
	nop
	set	0x32, %i5
	ldstub	[%l7 + %i5],	%i3
	nop
	set	0x20, %o7
	std	%f30,	[%l7 + %o7]
	set	0x50, %g5
	swapa	[%l7 + %g5] 0x89,	%i0
	nop
	set	0x78, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	set	0x58, %i6
	stxa	%l0,	[%l7 + %i6] 0x80
	add	%l5,	%g2,	%o3
	set	0x18, %o2
	stxa	%i6,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x5C, %i0
	stha	%l3,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%g5
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f0
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o5
	nop
	set	0x6C, %i7
	sth	%g1,	[%l7 + %i7]
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x81,	%g6
	nop
	set	0x58, %g7
	ldub	[%l7 + %g7],	%l4
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%o2
	nop
	set	0x7C, %o4
	lduh	[%l7 + %o4],	%l6
	nop
	set	0x64, %l6
	stw	%i2,	[%l7 + %l6]
	or	%i7,	%i5,	%o1
	set	0x60, %l4
	ldda	[%l7 + %l4] 0xea,	%o4
	nop
	set	0x21, %o5
	ldstub	[%l7 + %o5],	%i1
	nop
	set	0x32, %i1
	lduh	[%l7 + %i1],	%g3
	nop
	set	0x48, %o3
	std	%i4,	[%l7 + %o3]
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%g6
	set	0x10, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o7
	nop
	set	0x4C, %g4
	prefetch	[%l7 + %g4],	 0
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%l1
	set	0x68, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o6
	set	0x50, %g1
	stwa	%i3,	[%l7 + %g1] 0xea
	membar	#Sync
	or	%i0,	%g4,	%l0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd8
	nop
	set	0x20, %o0
	stx	%g2,	[%l7 + %o0]
	nop
	set	0x68, %l2
	std	%l4,	[%l7 + %l2]
	st	%f10,	[%l7 + 0x2C]
	nop
	set	0x40, %i5
	std	%o2,	[%l7 + %i5]
	set	0x17, %o7
	stba	%i6,	[%l7 + %o7] 0x81
	or	%g5,	%l2,	%o0
	set	0x2D, %g5
	ldstuba	[%l7 + %g5] 0x81,	%o5
	set	0x38, %l0
	stxa	%l3,	[%l7 + %l0] 0xeb
	membar	#Sync
	wr	%g7,	%l4,	%softint
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	nop
	set	0x48, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x12, %i6
	ldsb	[%l7 + %i6],	%g1
	nop
	set	0x24, %i0
	lduh	[%l7 + %i0],	%i2
	nop
	set	0x08, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x20, %g3
	stw	%i7,	[%l7 + %g3]
	and	%i5,	%o1,	%i1
	set	0x60, %l3
	swapa	[%l7 + %l3] 0x81,	%o4
	nop
	set	0x30, %i7
	std	%f20,	[%l7 + %i7]
	and	%g3,	%i4,	%o7
	nop
	set	0x74, %g6
	swap	[%l7 + %g6],	%l1
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x81,	 2
	and	%i3,	%g6,	%g4
	nop
	set	0x20, %o4
	std	%i0,	[%l7 + %o4]
	nop
	set	0x34, %l6
	lduh	[%l7 + %l6],	%l0
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f22
	nop
	set	0x23, %o5
	ldstub	[%l7 + %o5],	%l5
	nop
	set	0x5C, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x18, %o3
	std	%f2,	[%l7 + %o3]
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x80,	%g2
	ld	[%l7 + 0x64],	%f21
	st	%f25,	[%l7 + 0x24]
	and	%i6,	%g5,	%o3
	nop
	set	0x14, %l5
	stw	%l2,	[%l7 + %l5]
	add	%o5,	%l3,	%g7
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x20]
	set	0x6C, %o1
	stba	%l4,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x28, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x48, %g4
	stxa	%o0,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x10, %g1
	std	%f16,	[%l7 + %g1]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%l6
	nop
	set	0x20, %o0
	std	%f2,	[%l7 + %o0]
	nop
	set	0x7D, %l2
	ldsb	[%l7 + %l2],	%i2
	nop
	set	0x55, %g2
	stb	%i7,	[%l7 + %g2]
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe2,	%g0
	or	%o1,	%i1,	%o4
	nop
	set	0x65, %g5
	ldsb	[%l7 + %g5],	%i5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f0
	add	%g3,	%i4,	%o7
	nop
	set	0x3A, %l0
	ldstub	[%l7 + %l0],	%l1
	st	%f1,	[%l7 + 0x08]
	nop
	set	0x52, %i4
	ldub	[%l7 + %i4],	%i3
	set	0x60, %i6
	prefetcha	[%l7 + %i6] 0x89,	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x524, 	%sys_tick_cmpr
	nop
	set	0x70, %o2
	stx	%i0,	[%l7 + %o2]
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f12
	st	%fsr,	[%l7 + 0x68]
	fpadd16	%f20,	%f12,	%f12
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f12
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%l0
	wr 	%g0, 	0x7, 	%fprs
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%i6
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%o3
	set	0x38, %g3
	stda	%l2,	[%l7 + %g3] 0x89
	set	0x40, %l1
	lda	[%l7 + %l1] 0x80,	%f9
	wr	%o5,	%l3,	%ccr
	nop
	set	0x56, %g6
	ldub	[%l7 + %g6],	%g7
	nop
	set	0x24, %l6
	ldsh	[%l7 + %l6],	%o0
	st	%f28,	[%l7 + 0x0C]
	set	0x44, %o4
	stha	%l4,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x30, %l4
	stxa	%l6,	[%l7 + %l4] 0xe3
	membar	#Sync
	st	%f9,	[%l7 + 0x30]
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x89,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%i7
	nop
	set	0x60, %o3
	ldsb	[%l7 + %o3],	%o1
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f22
	st	%f6,	[%l7 + 0x48]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%g1
	bne,a	%xcc,	loop_125
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f2
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc4
loop_125:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i5
	nop
	set	0x08, %o6
	ldsw	[%l7 + %o6],	%g3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	or	%o7,	%l1,	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%g4
	st	%fsr,	[%l7 + 0x1C]
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x88,	%o6
	set	0x7C, %i2
	stwa	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x88
	nop
	set	0x18, %l2
	ldx	[%l7 + %l2],	%l0
	set	0x78, %g2
	stxa	%i3,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xBFE99316,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x31836926,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f24,	%f17
	set	0x28, %o0
	stxa	%g2,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x60, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l5
	nop
	set	0x75, %o7
	ldsb	[%l7 + %o7],	%g5
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe2,	%i6
	nop
	set	0x30, %i4
	std	%o2,	[%l7 + %i4]
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%o5
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%o0
	set	0x48, %i0
	stda	%l4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	set	0x14, %l3
	stba	%i2,	[%l7 + %l3] 0x81
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x0E, %g3
	lduh	[%l7 + %g3],	%l6
	set	0x68, %i7
	ldxa	[%l7 + %i7] 0x80,	%o2
	nop
	set	0x48, %l1
	std	%f8,	[%l7 + %l1]
	nop
	set	0x08, %l6
	ldsw	[%l7 + %l6],	%o1
	wr	%i1,	%i7,	%clear_softint
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x81,	%o4
	nop
	set	0x25, %g6
	ldub	[%l7 + %g6],	%g1
	or	%i5,	%g3,	%o7
	add	%i4,	%g6,	%g4
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%l1
	set	0x64, %l4
	stwa	%i0,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x63, %g7
	stba	%l0,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x50, %o3
	std	%f6,	[%l7 + %o3]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf9
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f0
	set	0x3C, %o6
	sta	%f24,	[%l7 + %o6] 0x89
	or	%o6,	%i3,	%g2
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x89,	%g5
	set	0x10, %i2
	stwa	%l5,	[%l7 + %i2] 0x81
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%o3
	and	%o5,	%i6,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%o0
	nop
	set	0x4C, %g1
	swap	[%l7 + %g1],	%l4
	set	0x36, %o0
	stha	%i2,	[%l7 + %o0] 0xe3
	membar	#Sync
	or	%l6,	%o2,	%o1
	st	%fsr,	[%l7 + 0x50]
	bl,pn	%xcc,	loop_126
	add	%i1,	%g7,	%o4
	nop
	set	0x78, %g2
	std	%i6,	[%l7 + %g2]
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x88,	%g1
loop_126:
	nop
	set	0x7C, %g5
	stba	%i5,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x40, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf9
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%g3
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%g6
	bne	%icc,	loop_127
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x50, %i3
	swap	[%l7 + %i3],	%l0
loop_127:
	nop
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x88
	set	0x49, %g3
	stba	%l1,	[%l7 + %g3] 0x81
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x32, %g6
	sth	%i3,	[%l7 + %g6]
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	ld	[%l7 + 0x40],	%f6
	nop
	set	0x24, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x7C, %o3
	ldsw	[%l7 + %o3],	%o6
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x81
	nop
	set	0x5C, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x0C, %g7
	lda	[%l7 + %g7] 0x81,	%f14
	nop
	set	0x50, %o6
	ldsw	[%l7 + %o6],	%l5
	or	%g5,	%o3,	%i6
	nop
	set	0x60, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x68, %g4
	stx	%l2,	[%l7 + %g4]
	nop
	set	0x37, %i2
	ldub	[%l7 + %i2],	%o5
	st	%f2,	[%l7 + 0x18]
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%o0
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x88
	nop
	set	0x18, %g2
	ldsw	[%l7 + %g2],	%l4
	wr	%l3,	%i2,	%set_softint
	nop
	set	0x58, %o0
	std	%f14,	[%l7 + %o0]
	nop
	set	0x47, %g5
	stb	%o2,	[%l7 + %g5]
	nop
	set	0x50, %i4
	ldstub	[%l7 + %i4],	%l6
	wr	%i1,	%o1,	%softint
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xe2,	%o4
	add	%i7,	%g1,	%g7
	set	0x4E, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o7
	nop
	set	0x14, %i6
	swap	[%l7 + %i6],	%g3
	nop
	set	0x32, %o2
	ldsh	[%l7 + %o2],	%g6
	set	0x78, %l3
	lda	[%l7 + %l3] 0x80,	%f9
	nop
	set	0x28, %i3
	std	%i4,	[%l7 + %i3]
	nop
	set	0x1A, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x50, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x38, %l1
	sta	%f5,	[%l7 + %l1] 0x81
	add	%g4,	%l0,	%i0
	set	0x08, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i3
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x89,	 3
	nop
	set	0x48, %g6
	stw	%o6,	[%l7 + %g6]
	nop
	set	0x60, %o4
	std	%l4,	[%l7 + %o4]
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x88,	%l1
	st	%f5,	[%l7 + 0x40]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i6
	fpadd16s	%f2,	%f21,	%f12
	bl,pt	%icc,	loop_128
	nop
	set	0x54, %i7
	prefetch	[%l7 + %i7],	 4
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x81,	 3
loop_128:
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	bleu,a,pt	%xcc,	loop_129
	nop
	set	0x3C, %o1
	ldsh	[%l7 + %o1],	%l2
	or	%o5,	%l4,	%o0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf8
	membar	#Sync
loop_129:
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%i2
	nop
	set	0x68, %l5
	ldsw	[%l7 + %l5],	%l3
	ld	[%l7 + 0x14],	%f28
	and	%l6,	%o2,	%i1
	st	%fsr,	[%l7 + 0x30]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%o1
	ld	[%l7 + 0x20],	%f15
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x50, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x60, %i2
	std	%g6,	[%l7 + %i2]
	ba,a	%icc,	loop_130
	nop
	set	0x44, %g4
	swap	[%l7 + %g4],	%g1
	ld	[%l7 + 0x7C],	%f19
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%o6
loop_130:
	wr	%g6,	%g3,	%sys_tick
	and	%i5,	%g4,	%i4
	and	%l0,	%i3,	%i0
	set	0x1C, %g1
	stwa	%o6,	[%l7 + %g1] 0x88
	set	0x28, %o0
	sta	%f21,	[%l7 + %o0] 0x81
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x81,	%l4
	nop
	set	0x43, %g2
	ldub	[%l7 + %g2],	%g2
	set	0x40, %i5
	stda	%l0,	[%l7 + %i5] 0x81
	nop
	set	0x18, %i4
	stx	%o3,	[%l7 + %i4]
	set	0x1C, %o7
	stwa	%g5,	[%l7 + %o7] 0x80
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f16
	nop
	set	0x45, %l3
	ldub	[%l7 + %l3],	%l2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	nop
	set	0x40, %o2
	std	%i6,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x4A, %g3
	sth	%o5,	[%l7 + %g3]
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x80,	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i2
	nop
	set	0x61, %l1
	ldstub	[%l7 + %l1],	%l3
	set	0x10, %i0
	ldda	[%l7 + %i0] 0xea,	%o2
	set	0x74, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l6
	set	0x08, %l6
	lda	[%l7 + %l6] 0x88,	%f13
	nop
	set	0x34, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%o4
	nop
	set	0x38, %o3
	lduh	[%l7 + %o3],	%i7
	nop
	set	0x4C, %l4
	ldstub	[%l7 + %l4],	%o1
	ld	[%l7 + 0x2C],	%f12
	fpadd32s	%f10,	%f11,	%f15
	st	%f31,	[%l7 + 0x70]
	nop
	set	0x5A, %o1
	ldsh	[%l7 + %o1],	%g1
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f6
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%g7
	nop
	set	0x78, %l5
	std	%o6,	[%l7 + %l5]
	set	0x78, %o6
	stxa	%g3,	[%l7 + %o6] 0x81
	nop
	set	0x70, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x48, %i2
	stxa	%g6,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x48, %l2
	swapa	[%l7 + %l2] 0x81,	%i5
	add	%g4,	%l0,	%i3
	or	%i4,	%i0,	%l5
	nop
	set	0x7A, %g1
	ldsh	[%l7 + %g1],	%o6
	nop
	set	0x08, %o0
	prefetch	[%l7 + %o0],	 1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f0
	nop
	set	0x13, %g5
	stb	%g2,	[%l7 + %g5]
	set	0x3D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l1
	nop
	set	0x1C, %i4
	stw	%g5,	[%l7 + %i4]
	nop
	set	0x68, %o7
	std	%f30,	[%l7 + %o7]
	nop
	set	0x28, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x0C, %g2
	stwa	%o3,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x62, %i3
	ldub	[%l7 + %i3],	%o0
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	add	%l4,	%l3,	%i2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o2
	set	0x0C, %l0
	sta	%f28,	[%l7 + %l0] 0x80
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x89,	%o4
	set	0x6C, %i0
	stwa	%i7,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xe3,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%g7
	nop
	set	0x5B, %l6
	ldsb	[%l7 + %l6],	%o1
	set	0x10, %g6
	stxa	%g3,	[%l7 + %g6] 0x80
	nop
	set	0x3D, %i7
	ldub	[%l7 + %i7],	%o7
	set	0x58, %o3
	stwa	%i5,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x70, %o4
	stw	%g6,	[%l7 + %o4]
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x88,	 1
	nop
	set	0x28, %o5
	swap	[%l7 + %o5],	%i3
	nop
	set	0x15, %l4
	stb	%i4,	[%l7 + %l4]
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%g4
	st	%f28,	[%l7 + 0x68]
	or	%l5,	%i0,	%g2
	nop
	set	0x24, %i1
	lduh	[%l7 + %i1],	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%g5
	set	0x20, %g7
	stda	%l2,	[%l7 + %g7] 0x88
	st	%f14,	[%l7 + 0x6C]
	nop
	set	0x4F, %i2
	ldub	[%l7 + %i2],	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%o3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	nop
	set	0x0C, %g1
	sth	%o0,	[%l7 + %g1]
	nop
	nop
	setx	0x39E54AEA6539084E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x1195A46A360FC3E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f18,	%f28
	nop
	set	0x45, %o6
	stb	%l4,	[%l7 + %o6]
	set	0x73, %o0
	stba	%i2,	[%l7 + %o0] 0x80
	set	0x20, %g4
	stxa	%l3,	[%l7 + %g4] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o4
	nop
	set	0x48, %i4
	std	%f24,	[%l7 + %i4]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%i1
	set	0x72, %i5
	stba	%i7,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x60, %i6
	stda	%g0,	[%l7 + %i6] 0x80
	ble,a	%icc,	loop_131
	or	%g7,	%o1,	%o7
	fpadd32	%f22,	%f24,	%f4
	nop
	set	0x18, %o7
	std	%f20,	[%l7 + %o7]
loop_131:
	nop
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x89,	%f15
	fpsub32	%f12,	%f18,	%f4
	set	0x3E, %l3
	stha	%g3,	[%l7 + %l3] 0x89
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x88,	%g6
	set	0x6A, %i3
	ldstuba	[%l7 + %i3] 0x80,	%l0
	set	0x50, %l1
	stxa	%i5,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x18, %l0
	stxa	%i3,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x49, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i4
	set	0x76, %i0
	stha	%g4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x60, %g6
	std	%i0,	[%l7 + %g6]
	nop
	set	0x20, %i7
	stw	%l5,	[%l7 + %i7]
	ld	[%l7 + 0x18],	%f21
	nop
	set	0x28, %o3
	std	%f4,	[%l7 + %o3]
	set	0x08, %o4
	sta	%f1,	[%l7 + %o4] 0x88
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x88,	%l1
	nop
	set	0x60, %o5
	std	%f20,	[%l7 + %o5]
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f6
	add	%g2,	%g5,	%o6
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%o5
	add	%i6,	%o3,	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i2
	st	%fsr,	[%l7 + 0x30]
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	nop
	set	0x20, %g7
	stx	%l6,	[%l7 + %g7]
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%l4
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x88,	%o4
	add	%o2,	%i1,	%i7
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f14
	nop
	set	0x3C, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x60, %o6
	stxa	%g1,	[%l7 + %o6] 0x81
	nop
	set	0x22, %g4
	ldub	[%l7 + %g4],	%g7
	nop
	set	0x08, %g5
	ldstub	[%l7 + %g5],	%o7
	set	0x1E, %o0
	stba	%g3,	[%l7 + %o0] 0x81
	nop
	set	0x10, %i4
	swap	[%l7 + %i4],	%g6
	or	%l0,	%i5,	%o1
	wr	%i3,	%i4,	%set_softint
	set	0x6C, %i6
	stba	%i0,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x4A, %o7
	lduh	[%l7 + %o7],	%g4
	nop
	set	0x60, %i5
	std	%l0,	[%l7 + %i5]
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	nop
	set	0x23, %l3
	ldsb	[%l7 + %l3],	%l5
	add	%g5,	%o5,	%o6
	nop
	set	0x5C, %g3
	ldsw	[%l7 + %g3],	%i6
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%o3
	set	0x36, %l1
	stha	%o0,	[%l7 + %l1] 0x80
	ld	[%l7 + 0x54],	%f27
	set	0x29, %l0
	stba	%i2,	[%l7 + %l0] 0x81
	set	0x08, %i0
	ldxa	[%l7 + %i0] 0x88,	%l2
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%l2
	set	0x50, %o2
	swapa	[%l7 + %o2] 0x88,	%l4
	set	0x70, %i7
	ldda	[%l7 + %i7] 0xea,	%o4
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%l6
	nop
	set	0x79, %o1
	stb	%o2,	[%l7 + %o1]
	wr	%i7,	%i1,	%y
	nop
	set	0x74, %o5
	ldsw	[%l7 + %o5],	%g7
	ld	[%l7 + 0x30],	%f7
	or	%g1,	%g3,	%g6
	nop
	set	0x58, %o4
	std	%o6,	[%l7 + %o4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o1
	set	0x38, %l4
	lda	[%l7 + %l4] 0x81,	%f28
	nop
	set	0x30, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x4F, %l6
	stb	%i5,	[%l7 + %l6]
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%i4
	nop
	set	0x17, %l2
	ldsb	[%l7 + %l2],	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%l1
	add	%g2,	%i0,	%g5
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xea,	%l4
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f24
	st	%fsr,	[%l7 + 0x78]
	add	%o6,	%o5,	%i6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%i2
	st	%f2,	[%l7 + 0x54]
	set	0x16, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l2
	nop
	set	0x2E, %g4
	ldstub	[%l7 + %g4],	%o3
	nop
	set	0x38, %o6
	stx	%l3,	[%l7 + %o6]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
	and	%l4,	%o4,	%l6
	nop
	set	0x18, %i4
	stw	%i7,	[%l7 + %i4]
	nop
	set	0x18, %i6
	lduw	[%l7 + %i6],	%i1
	nop
	set	0x4C, %o0
	ldsh	[%l7 + %o0],	%g7
	set	0x6A, %i5
	stha	%g1,	[%l7 + %i5] 0x81
	add	%g3,	%o2,	%g6
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%o7
	set	0x20, %g2
	stda	%o0,	[%l7 + %g2] 0xe2
	membar	#Sync
	wr	%l0,	%i4,	%set_softint
	nop
	nop
	setx	0x7C38659F5E6652CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x69AA2B6DA9218772,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f4,	%f10
	add	%i3,	%g4,	%l1
	nop
	set	0x30, %l3
	swap	[%l7 + %l3],	%g2
	st	%fsr,	[%l7 + 0x18]
	set	0x52, %g3
	stha	%i0,	[%l7 + %g3] 0x80
	nop
	set	0x4C, %i3
	swap	[%l7 + %i3],	%i5
	or	%g5,	%o6,	%o5
	st	%f22,	[%l7 + 0x40]
	set	0x10, %l0
	stxa	%l5,	[%l7 + %l0] 0x81
	set	0x7A, %l1
	stha	%i6,	[%l7 + %l1] 0x89
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x80,	%i2
	set	0x78, %g6
	stxa	%o0,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%o3
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x88,	%l2
	st	%f12,	[%l7 + 0x60]
	st	%f1,	[%l7 + 0x30]
	set	0x58, %o1
	stda	%l2,	[%l7 + %o1] 0x80
	nop
	set	0x62, %o5
	stb	%l4,	[%l7 + %o5]
	nop
	set	0x4F, %i7
	ldub	[%l7 + %i7],	%l6
	set	0x38, %l4
	stda	%o4,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%i7
	nop
	set	0x1E, %o4
	lduh	[%l7 + %o4],	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x895, 	%tick_cmpr
	wr	%o7,	%g6,	%set_softint
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%i4
	nop
	set	0x62, %i1
	ldsh	[%l7 + %i1],	%o1
	nop
	set	0x16, %l6
	lduh	[%l7 + %l6],	%g4
	ld	[%l7 + 0x60],	%f15
	set	0x30, %l2
	lda	[%l7 + %l2] 0x88,	%f31
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x81,	%l1
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%i3
	set	0x50, %g4
	lda	[%l7 + %g4] 0x88,	%f31
	nop
	set	0x28, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x54, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x0C, %i4
	sta	%f8,	[%l7 + %i4] 0x80
	nop
	set	0x2C, %i6
	lduh	[%l7 + %i6],	%g2
	add	%i0,	%i5,	%g5
	ld	[%l7 + 0x3C],	%f18
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x80
	or	%o5,	%o6,	%i6
	nop
	set	0x1B, %o0
	ldstub	[%l7 + %o0],	%i2
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f0
	set	0x5C, %g2
	lda	[%l7 + %g2] 0x88,	%f22
	set	0x40, %i5
	stwa	%o0,	[%l7 + %i5] 0x88
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf8
	membar	#Sync
	nop
	set	0x50, %i3
	lduw	[%l7 + %i3],	%o3
	set	0x18, %l0
	sta	%f25,	[%l7 + %l0] 0x80
	or	%l5,	%l3,	%l2
	st	%f0,	[%l7 + 0x38]
	set	0x3C, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xd2
	nop
	set	0x68, %g6
	stw	%i1,	[%l7 + %g6]
	nop
	set	0x08, %o2
	std	%g6,	[%l7 + %o2]
	set	0x10, %i0
	stxa	%i7,	[%l7 + %i0] 0xeb
	membar	#Sync
	wr	%g3,	%o2,	%sys_tick
	nop
	set	0x68, %o3
	std	%o6,	[%l7 + %o3]
	nop
	set	0x27, %o5
	ldub	[%l7 + %o5],	%g6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xda,	%f16
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x80,	 0
	nop
	set	0x39, %l4
	ldub	[%l7 + %l4],	%i4
	st	%f2,	[%l7 + 0x2C]
	fpsub32	%f10,	%f2,	%f18
	set	0x14, %l5
	swapa	[%l7 + %l5] 0x80,	%o1
	or	%l0,	%g4,	%i3
	set	0x2C, %i1
	swapa	[%l7 + %i1] 0x80,	%g2
	set	0x08, %l6
	stwa	%l1,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x20, %l2
	std	%f2,	[%l7 + %l2]
	set	0x4C, %o4
	lda	[%l7 + %o4] 0x80,	%f23
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x80,	%i5
	set	0x1A, %g4
	stba	%i0,	[%l7 + %g4] 0x80
	set	0x18, %i2
	stxa	%g5,	[%l7 + %i2] 0x88
	or	%o6,	%o5,	%i2
	nop
	set	0x34, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x24, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xc2
	set	0x3C, %g5
	stwa	%i6,	[%l7 + %g5] 0x88
	nop
	set	0x28, %i6
	ldsh	[%l7 + %i6],	%o0
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xea,	%o2
	or	%l5,	%l3,	%l4
	nop
	set	0x30, %g2
	stw	%l2,	[%l7 + %g2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%l6
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x89,	%i1
	nop
	set	0x20, %i5
	prefetch	[%l7 + %i5],	 3
	add	%i7,	%g3,	%g7
	nop
	set	0x38, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x50, %l3
	std	%f16,	[%l7 + %l3]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd8
	set	0x28, %l1
	stda	%o6,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x18, %l0
	stx	%o2,	[%l7 + %l0]
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x81,	 2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%o1
	set	0x10, %i0
	stwa	%l0,	[%l7 + %i0] 0x88
	set	0x78, %o3
	lda	[%l7 + %o3] 0x81,	%f28
	nop
	set	0x1E, %o5
	ldstub	[%l7 + %o5],	%g4
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%i3
	nop
	set	0x64, %o1
	stw	%g2,	[%l7 + %o1]
	wr	%g6,	%i5,	%y
	set	0x44, %o2
	stwa	%l1,	[%l7 + %o2] 0x81
	nop
	set	0x15, %l5
	ldsb	[%l7 + %l5],	%g5
	nop
	set	0x10, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x08, %l6
	stx	%o6,	[%l7 + %l6]
	or	%i0,	%o5,	%i6
	nop
	set	0x22, %l2
	ldsh	[%l7 + %l2],	%o0
	fpsub16s	%f9,	%f25,	%f3
	nop
	set	0x30, %l4
	sth	%i2,	[%l7 + %l4]
	nop
	set	0x30, %g1
	stx	%l5,	[%l7 + %g1]
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f16
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x88,	%l4
	set	0x08, %g7
	lda	[%l7 + %g7] 0x89,	%f17
	wr	%l3,	%l2,	%y
	set	0x30, %g5
	stxa	%l6,	[%l7 + %g5] 0x89
	nop
	set	0x48, %i6
	ldub	[%l7 + %i6],	%i1
	set	0x20, %i4
	stxa	%o4,	[%l7 + %i4] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f0
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f0
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xe2,	%g2
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%i7
	fpsub16	%f2,	%f24,	%f0
	or	%g7,	%o7,	%o2
	st	%f21,	[%l7 + 0x4C]
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%i4
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%o1
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xeb,	%l0
	wr	%g1,	%g4,	%set_softint
	fpsub32	%f20,	%f18,	%f2
	add	%g2,	%g6,	%i3
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%i4
	nop
	set	0x26, %g6
	sth	%l1,	[%l7 + %g6]
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
	set	0x0C, %o3
	swapa	[%l7 + %o3] 0x81,	%g5
	set	0x28, %l0
	sta	%f28,	[%l7 + %l0] 0x88
	set	0x10, %o5
	stwa	%i0,	[%l7 + %o5] 0x89
	nop
	set	0x50, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x1A, %o2
	sth	%o6,	[%l7 + %o2]
	nop
	set	0x7E, %l5
	sth	%o0,	[%l7 + %l5]
	nop
	set	0x28, %i7
	std	%f24,	[%l7 + %i7]
	set	0x48, %l6
	lda	[%l7 + %l6] 0x88,	%f4
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%i2
	nop
	set	0x4E, %l4
	ldub	[%l7 + %l4],	%i6
	set	0x48, %g1
	sta	%f8,	[%l7 + %g1] 0x89
	st	%f27,	[%l7 + 0x2C]
	set	0x1F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o3
	set	0x50, %i2
	lda	[%l7 + %i2] 0x81,	%f12
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x81,	%l4
	set	0x38, %o4
	stxa	%l3,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x34, %g7
	swap	[%l7 + %g7],	%l5
	nop
	set	0x38, %o6
	std	%f0,	[%l7 + %o6]
	set	0x64, %i6
	sta	%f5,	[%l7 + %i6] 0x80
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%l6
	nop
	set	0x68, %g5
	swap	[%l7 + %g5],	%i1
	set	0x6B, %g2
	stba	%o4,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	nop
	set	0x10, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x10, %i5
	swap	[%l7 + %i5],	%i7
	nop
	set	0x60, %g3
	stx	%fsr,	[%l7 + %g3]
	st	%f13,	[%l7 + 0x24]
	nop
	set	0x28, %i3
	std	%g6,	[%l7 + %i3]
	set	0x18, %l3
	stda	%o6,	[%l7 + %l3] 0x81
	set	0x60, %l1
	stda	%o2,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x14, %i0
	lda	[%l7 + %i0] 0x81,	%f12
	nop
	set	0x24, %g6
	ldsb	[%l7 + %g6],	%l2
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%i4
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x0D, %o5
	stb	%l0,	[%l7 + %o5]
	ld	[%l7 + 0x7C],	%f8
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x80,	%g1
	set	0x0C, %o1
	swapa	[%l7 + %o1] 0x89,	%g4
	nop
	set	0x6C, %l5
	stb	%o1,	[%l7 + %l5]
	nop
	set	0x12, %i7
	ldsh	[%l7 + %i7],	%g6
	bn,a,pn	%xcc,	loop_132
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%g2
	nop
	set	0x08, %l2
	stx	%i3,	[%l7 + %l2]
	nop
	set	0x6C, %o2
	swap	[%l7 + %o2],	%l1
loop_132:
	and	%g5,	%i5,	%i0
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f28
	or	%o5,	%o0,	%o6
	nop
	set	0x70, %l4
	std	%i2,	[%l7 + %l4]
	fpadd32	%f8,	%f14,	%f22
	nop
	set	0x78, %i1
	stb	%o3,	[%l7 + %i1]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%l4
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%i6
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%l5
	nop
	set	0x4C, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x10, %i6
	std	%i6,	[%l7 + %i6]
	nop
	set	0x50, %o6
	stx	%l3,	[%l7 + %o6]
	set	0x4C, %i4
	lda	[%l7 + %i4] 0x81,	%f24
	ld	[%l7 + 0x6C],	%f31
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%g3
	add	%i7,	%g7,	%o4
	bl	%xcc,	loop_133
	ld	[%l7 + 0x60],	%f17
	nop
	set	0x40, %g5
	stw	%o7,	[%l7 + %g5]
	nop
	set	0x21, %g2
	ldstub	[%l7 + %g2],	%o2
loop_133:
	st	%fsr,	[%l7 + 0x24]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%g4
	nop
	set	0x64, %o7
	stw	%o1,	[%l7 + %o7]
	st	%f18,	[%l7 + 0x44]
	nop
	set	0x1A, %i5
	stb	%l0,	[%l7 + %i5]
	nop
	set	0x6E, %o0
	ldsh	[%l7 + %o0],	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%i3
	set	0x4C, %g3
	stha	%l1,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x0C, %l3
	sta	%f15,	[%l7 + %l3] 0x89
	nop
	set	0x58, %l1
	swap	[%l7 + %l1],	%g5
	nop
	set	0x28, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x0D, %g6
	ldsb	[%l7 + %g6],	%i5
	nop
	set	0x3C, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x34, %o3
	lda	[%l7 + %o3] 0x89,	%f11
	set	0x7D, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i0
	set	0x0C, %l5
	swapa	[%l7 + %l5] 0x89,	%o5
	set	0x18, %o1
	stwa	%o0,	[%l7 + %o1] 0x81
	wr	%o6,	%i2,	%ccr
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xe2,	%l4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%o3
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x88,	%l4
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x80,	%l3
	set	0x78, %o2
	sta	%f5,	[%l7 + %o2] 0x89
	nop
	set	0x60, %l4
	std	%i0,	[%l7 + %l4]
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x89,	%l6
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%i7
	nop
	set	0x7C, %g4
	stb	%g3,	[%l7 + %g4]
	set	0x42, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g7
	nop
	nop
	setx	0x6DA83A1A5AF64504,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE22146E8184CDA63,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f22
	bleu,a,pt	%icc,	loop_134
	wr 	%g0, 	0x5, 	%fprs
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x80,	 3
loop_134:
	nop
	set	0x64, %i2
	sta	%f19,	[%l7 + %i2] 0x89
	nop
	set	0x50, %o6
	ldsw	[%l7 + %o6],	%o2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	nop
	set	0x0B, %i6
	ldstub	[%l7 + %i6],	%g1
	nop
	set	0x0A, %g2
	ldsb	[%l7 + %g2],	%g4
	wr	%o1,	%l0,	%set_softint
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	set	0x4C, %i5
	sta	%f15,	[%l7 + %i5] 0x80
	ble,a,pt	%icc,	loop_135
	nop
	set	0x1A, %o0
	ldsh	[%l7 + %o0],	%l2
	set	0x10, %g3
	stwa	%g2,	[%l7 + %g3] 0x88
loop_135:
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i3
	add	%i5,	%g5,	%o5
	set	0x64, %l1
	stwa	%i0,	[%l7 + %l1] 0xea
	membar	#Sync
	or	%o0,	%o6,	%l4
	nop
	set	0x20, %i0
	std	%f24,	[%l7 + %i0]
	set	0x7C, %o7
	stwa	%i2,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%o2
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x80,	%i6
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x89,	%l2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f16
	nop
	set	0x55, %l5
	ldub	[%l7 + %l5],	%l5
	or	%i1,	%l6,	%g3
	set	0x32, %o1
	stha	%g7,	[%l7 + %o1] 0x89
	nop
	set	0x40, %l6
	ldsw	[%l7 + %l6],	%i7
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%o2
	set	0x40, %o2
	stha	%o4,	[%l7 + %o2] 0x81
	or	%g4,	%g1,	%o1
	wr	%l0,	%g2,	%clear_softint
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x80,	%g6
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x89,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%i3
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x88,	%g5
	nop
	set	0x50, %g1
	std	%f8,	[%l7 + %g1]
	nop
	set	0x7A, %g7
	ldsh	[%l7 + %g7],	%i5
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f24
	set	0x14, %g4
	sta	%f22,	[%l7 + %g4] 0x80
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%o5
	set	0x16, %i4
	stha	%i0,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x6C, %i6
	stwa	%o0,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x40, %i2
	stx	%o6,	[%l7 + %i2]
	st	%f8,	[%l7 + 0x50]
	nop
	set	0x4D, %g5
	ldub	[%l7 + %g5],	%l4
	set	0x70, %g2
	stxa	%o3,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x60, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i2
	nop
	set	0x68, %o0
	std	%f26,	[%l7 + %o0]
	set	0x20, %g3
	sta	%f25,	[%l7 + %g3] 0x80
	add	%i6,	%l3,	%i1
	st	%f18,	[%l7 + 0x18]
	nop
	set	0x54, %l1
	ldsw	[%l7 + %l1],	%l6
	nop
	set	0x60, %i0
	lduw	[%l7 + %i0],	%l5
	set	0x18, %o7
	stda	%g2,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%g7
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x89,	%i7
	or	%o7,	%o2,	%o4
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%g4
	nop
	set	0x14, %o3
	ldsw	[%l7 + %o3],	%g1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f0
	set	0x78, %g6
	stda	%o0,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x20, %l6
	swapa	[%l7 + %l6] 0x89,	%l0
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%g2
	nop
	set	0x20, %i3
	ldub	[%l7 + %i3],	%g6
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xeb,	%i4
	set	0x6C, %l2
	stwa	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	add	%i3,	%g5,	%i5
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf9
	membar	#Sync
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f16
	set	0x0F, %g7
	stba	%o5,	[%l7 + %g7] 0x89
	set	0x40, %o4
	stda	%l0,	[%l7 + %o4] 0x80
	set	0x74, %g4
	stwa	%o0,	[%l7 + %g4] 0x80
	nop
	set	0x64, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x12, %o6
	ldsh	[%l7 + %o6],	%o6
	or	%l4,	%i0,	%o3
	or	%i2,	%l3,	%i1
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 2
	set	0x10, %i6
	stxa	%i6,	[%l7 + %i6] 0x81
	nop
	set	0x60, %g5
	ldsw	[%l7 + %g5],	%l5
	set	0x70, %g2
	sta	%f8,	[%l7 + %g2] 0x88
	set	0x36, %i5
	stba	%l6,	[%l7 + %i5] 0x80
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x1C, %g3
	lduw	[%l7 + %g3],	%g7
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x80,	%o7
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	fpsub16s	%f24,	%f27,	%f28
	fpadd16s	%f26,	%f1,	%f3
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x89,	 3
	nop
	set	0x16, %o7
	ldsb	[%l7 + %o7],	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%g1
	nop
	set	0x3E, %l0
	ldsb	[%l7 + %l0],	%g4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f0
	set	0x15, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o1
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf0
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%g6
	set	0x08, %l3
	stxa	%g2,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	set	0x08, %o1
	stda	%i4,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x24, %i3
	stwa	%i3,	[%l7 + %i3] 0xe2
	membar	#Sync
	and	%l2,	%g5,	%i5
	nop
	set	0x38, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x38, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o5
	set	0x20, %l2
	stda	%l0,	[%l7 + %l2] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f0
	nop
	set	0x47, %g1
	stb	%o0,	[%l7 + %g1]
	nop
	set	0x38, %i1
	stx	%o6,	[%l7 + %i1]
	nop
	set	0x52, %g7
	ldstub	[%l7 + %g7],	%l4
	set	0x4E, %g4
	stha	%i0,	[%l7 + %g4] 0x80
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1254
!	Type a   	: 28
!	Type cti   	: 20
!	Type x   	: 546
!	Type f   	: 30
!	Type i   	: 122
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 6 Start
!
.global thread_6
thread_6:
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
	set	0x8,	%g2
	set	0x0,	%g3
	set	0x0,	%g4
	set	0xD,	%g5
	set	0x1,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x1,	%i1
	set	-0x0,	%i2
	set	-0x3,	%i3
	set	-0x7,	%i4
	set	-0x6,	%i5
	set	-0xB,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x50DB9B65,	%l0
	set	0x3502D5F3,	%l1
	set	0x65BF061A,	%l2
	set	0x2AE2CA2C,	%l3
	set	0x60B4A360,	%l4
	set	0x71794DD7,	%l5
	set	0x311239D4,	%l6
	!# Output registers
	set	-0x0DF8,	%o0
	set	-0x0E9B,	%o1
	set	-0x1C16,	%o2
	set	0x17FC,	%o3
	set	-0x14D7,	%o4
	set	-0x00F3,	%o5
	set	0x0D86,	%o6
	set	0x04FE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	and	%i2,	%o3,	%i1
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	nop
	set	0x20, %o4
	ldsw	[%l7 + %o4],	%l3
	nop
	set	0x08, %o6
	ldsb	[%l7 + %o6],	%l5
	and	%l6,	%g7,	%o7
	nop
	set	0x10, %i4
	std	%f16,	[%l7 + %i4]
	set	0x23, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g3
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o2
	set	0x3C, %i6
	stwa	%o4,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x4C, %i5
	lduh	[%l7 + %i5],	%g1
	nop
	set	0x0A, %g3
	lduh	[%l7 + %g3],	%g4
	nop
	set	0x40, %l1
	lduw	[%l7 + %l1],	%i7
	ld	[%l7 + 0x14],	%f12
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
	or	%l0,	%g6,	%o1
	set	0x10, %i0
	stxa	%i4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f16
	nop
	set	0x73, %o3
	ldub	[%l7 + %o3],	%g2
	set	0x08, %o5
	stda	%l2,	[%l7 + %o5] 0x88
	fpsub16s	%f15,	%f31,	%f3
	add	%g5,	%i3,	%i5
	set	0x58, %l3
	sta	%f16,	[%l7 + %l3] 0x80
	nop
	set	0x2A, %l5
	lduh	[%l7 + %l5],	%o5
	nop
	set	0x38, %g6
	swap	[%l7 + %g6],	%l1
	add	%o6,	%o0,	%i0
	or	%l4,	%i2,	%i1
	set	0x4D, %i3
	stba	%o3,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x1C, %o2
	stha	%l3,	[%l7 + %o2] 0xea
	membar	#Sync
	add	%l5,	%i6,	%g7
	wr	%l6,	%o7,	%set_softint
	set	0x24, %o1
	stha	%g3,	[%l7 + %o1] 0x80
	set	0x14, %l4
	stwa	%o4,	[%l7 + %l4] 0x88
	bleu,pn	%xcc,	loop_136
	nop
	set	0x48, %l6
	swap	[%l7 + %l6],	%g1
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x89,	%o2
loop_136:
	nop
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x88,	%g4
	set	0x1C, %g1
	lda	[%l7 + %g1] 0x89,	%f27
	st	%fsr,	[%l7 + 0x7C]
	set	0x51, %g7
	stba	%i7,	[%l7 + %g7] 0x89
	nop
	set	0x6C, %i7
	stw	%l0,	[%l7 + %i7]
	nop
	set	0x34, %g4
	swap	[%l7 + %g4],	%g6
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x4D, %o4
	ldstub	[%l7 + %o4],	%o1
	nop
	set	0x44, %i4
	sth	%i4,	[%l7 + %i4]
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xea,	%l2
	nop
	set	0x10, %g2
	std	%f22,	[%l7 + %g2]
	nop
	set	0x38, %i6
	lduw	[%l7 + %i6],	%g5
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f30
	nop
	set	0x20, %i5
	swap	[%l7 + %i5],	%g2
	nop
	set	0x78, %l1
	std	%f20,	[%l7 + %l1]
	fpsub32	%f30,	%f6,	%f20
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f10
	st	%f21,	[%l7 + 0x7C]
	ld	[%l7 + 0x50],	%f10
	set	0x60, %g3
	stxa	%i5,	[%l7 + %g3] 0x81
	nop
	set	0x7A, %i0
	ldsh	[%l7 + %i0],	%i3
	or	%l1,	%o5,	%o6
	nop
	set	0x4C, %i2
	ldsw	[%l7 + %i2],	%i0
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x80,	%l4
	nop
	set	0x38, %o7
	swap	[%l7 + %o7],	%i2
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x60, %l3
	stw	%o3,	[%l7 + %l3]
	set	0x2F, %l5
	stba	%l3,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%i0
	nop
	set	0x48, %o3
	sth	%i6,	[%l7 + %o3]
	nop
	set	0x1C, %o2
	stw	%g7,	[%l7 + %o2]
	and	%l5,	%o7,	%l6
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%g3
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x89
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x80,	%o4
	fpadd16	%f8,	%f4,	%f6
	nop
	set	0x70, %l6
	stw	%o2,	[%l7 + %l6]
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x89,	%g4
	set	0x10, %g1
	ldxa	[%l7 + %g1] 0x89,	%i7
	nop
	set	0x40, %l2
	std	%l0,	[%l7 + %l2]
	or	%g1,	%g6,	%i4
	nop
	set	0x10, %i7
	std	%l2,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x5B, %g7
	ldsb	[%l7 + %g7],	%o1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%l1
	set	0x58, %o4
	swapa	[%l7 + %o4] 0x80,	%g2
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%o6
	nop
	set	0x2B, %i4
	ldsb	[%l7 + %i4],	%i0
	set	0x0C, %g5
	stwa	%l4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x0E, %i6
	ldstuba	[%l7 + %i6] 0x80,	%i2
	set	0x10, %g2
	stxa	%o5,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x78, %o6
	ldsw	[%l7 + %o6],	%o0
	set	0x68, %l1
	lda	[%l7 + %l1] 0x89,	%f20
	nop
	set	0x28, %o0
	swap	[%l7 + %o0],	%o3
	or	%l3,	%i1,	%g7
	nop
	set	0x0C, %i5
	lduh	[%l7 + %i5],	%l5
	nop
	set	0x14, %g3
	sth	%i6,	[%l7 + %g3]
	nop
	set	0x2A, %i0
	ldsh	[%l7 + %i0],	%o7
	nop
	set	0x3C, %i2
	stw	%l6,	[%l7 + %i2]
	set	0x38, %o7
	stda	%o4,	[%l7 + %o7] 0x88
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%o2
	add	%g4,	%i7,	%l0
	nop
	set	0x08, %l3
	sth	%g1,	[%l7 + %l3]
	set	0x2C, %l0
	stwa	%g3,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x0E, %l5
	ldsh	[%l7 + %l5],	%i4
	nop
	set	0x1C, %o3
	stw	%l2,	[%l7 + %o3]
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%g6
	nop
	set	0x18, %o1
	std	%g4,	[%l7 + %o1]
	add	%i5,	%o1,	%i3
	set	0x09, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l1
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x81,	%o6
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x60, %l6
	swap	[%l7 + %l6],	%i0
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%l4
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%i2
	and	%o5,	%g2,	%o3
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%o0
	add	%l3,	%i1,	%g7
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f16
	fpsub16	%f24,	%f10,	%f28
	set	0x38, %o4
	stda	%i6,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x10, %g4
	stw	%l5,	[%l7 + %g4]
	fpadd16s	%f17,	%f8,	%f5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x14, %g7
	swapa	[%l7 + %g7] 0x81,	%o2
	set	0x48, %g5
	stda	%g4,	[%l7 + %g5] 0x88
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xeb,	%i6
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x88,	 3
	set	0x64, %i6
	sta	%f4,	[%l7 + %i6] 0x80
	wr	%g1,	%g3,	%softint
	set	0x6F, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i7
	bge,pn	%icc,	loop_137
	add	%i4,	%l2,	%g6
	set	0x44, %l1
	swapa	[%l7 + %l1] 0x80,	%i5
loop_137:
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x0E, %g3
	ldub	[%l7 + %g3],	%g5
	or	%o1,	%i3,	%l1
	or	%o6,	%l4,	%i2
	nop
	set	0x52, %i0
	ldub	[%l7 + %i0],	%o5
	nop
	set	0x20, %i2
	std	%f4,	[%l7 + %i2]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%i0
	nop
	set	0x40, %o7
	std	%f14,	[%l7 + %o7]
	nop
	set	0x78, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x44, %o5
	swap	[%l7 + %o5],	%o0
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 1
	set	0x7C, %l0
	stha	%o3,	[%l7 + %l0] 0x80
	st	%f31,	[%l7 + 0x40]
	nop
	set	0x68, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f20
	nop
	set	0x18, %o3
	sth	%l3,	[%l7 + %o3]
	nop
	set	0x18, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x81,	%i1
	nop
	set	0x38, %l4
	stw	%i6,	[%l7 + %l4]
	nop
	set	0x20, %o1
	swap	[%l7 + %o1],	%l5
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	fpadd32s	%f10,	%f5,	%f13
	and	%o4,	%o2,	%g4
	nop
	set	0x6C, %g1
	ldsw	[%l7 + %g1],	%o7
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x80,	%l6
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%l0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f16
	nop
	set	0x44, %l2
	lduh	[%l7 + %l2],	%g1
	bn,a	%xcc,	loop_138
	nop
	set	0x40, %g4
	stx	%fsr,	[%l7 + %g4]
	ld	[%l7 + 0x48],	%f27
	nop
	set	0x24, %g5
	stw	%g3,	[%l7 + %g5]
loop_138:
	fpsub32s	%f15,	%f28,	%f19
	nop
	set	0x21, %g7
	ldub	[%l7 + %g7],	%i7
	nop
	set	0x4C, %i4
	ldstub	[%l7 + %i4],	%i4
	st	%fsr,	[%l7 + 0x0C]
	st	%f30,	[%l7 + 0x6C]
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f22
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f24
	set	0x40, %o6
	stxa	%l2,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x26, %l1
	ldsh	[%l7 + %l1],	%g6
	ld	[%l7 + 0x1C],	%f1
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x89,	%g5
	set	0x35, %i0
	stba	%i5,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x80,	%i3
	set	0x18, %o7
	lda	[%l7 + %o7] 0x89,	%f0
	nop
	set	0x20, %o0
	std	%o0,	[%l7 + %o0]
	nop
	set	0x1D, %o5
	ldub	[%l7 + %o5],	%l1
	set	0x18, %i5
	lda	[%l7 + %i5] 0x89,	%f30
	set	0x78, %l3
	stxa	%o6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%l4
	set	0x20, %g6
	stxa	%i2,	[%l7 + %g6] 0x81
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x80,	%g2
	nop
	set	0x58, %l5
	std	%o4,	[%l7 + %l5]
	set	0x70, %i3
	stda	%i0,	[%l7 + %i3] 0xeb
	membar	#Sync
	fpadd32s	%f30,	%f13,	%f24
	wr	%o0,	%o3,	%ccr
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%l3
	fpsub16	%f10,	%f10,	%f12
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%l5
	nop
	set	0x45, %o2
	ldub	[%l7 + %o2],	%g7
	set	0x28, %l6
	stda	%i0,	[%l7 + %l6] 0x88
	and	%o4,	%g4,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o7
	add	%l0,	%g3,	%i7
	st	%f3,	[%l7 + 0x20]
	nop
	set	0x24, %o1
	ldsw	[%l7 + %o1],	%i4
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%l2
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g0
	nop
	set	0x0C, %o4
	sth	%g5,	[%l7 + %o4]
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f12
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%i4
	set	0x58, %l2
	stwa	%i3,	[%l7 + %l2] 0x81
	nop
	set	0x10, %g7
	std	%f10,	[%l7 + %g7]
	or	%g6,	%o1,	%o6
	nop
	set	0x40, %i4
	stw	%l1,	[%l7 + %i4]
	nop
	set	0x3C, %g2
	swap	[%l7 + %g2],	%l4
	nop
	set	0x08, %i6
	stx	%g2,	[%l7 + %i6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%o5
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%l3
	set	0x08, %g5
	lda	[%l7 + %g5] 0x88,	%f21
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x89,	 4
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%i6
	set	0x58, %i2
	stxa	%l5,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x4C, %l1
	ldub	[%l7 + %l1],	%g7
	set	0x0B, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o4
	nop
	set	0x40, %o5
	std	%f30,	[%l7 + %o5]
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f6
	set	0x6C, %l3
	sta	%f14,	[%l7 + %l3] 0x88
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x68, %l0
	lduh	[%l7 + %l0],	%g4
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f30
	nop
	set	0x28, %o3
	ldsw	[%l7 + %o3],	%o2
	set	0x60, %l5
	stwa	%i1,	[%l7 + %l5] 0x89
	and	%l6,	%l0,	%g3
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%o6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%l2
	or	%i7,	%g1,	%g5
	add	%i5,	%g6,	%i3
	nop
	set	0x09, %o2
	stb	%o1,	[%l7 + %o2]
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x88,	%f24
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x31, %l4
	ldub	[%l7 + %l4],	%l4
	nop
	set	0x58, %i1
	swap	[%l7 + %i1],	%g2
	set	0x21, %g1
	stba	%i2,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x78, %o4
	stx	%o5,	[%l7 + %o4]
	nop
	set	0x78, %o1
	lduw	[%l7 + %o1],	%i0
	fpsub16	%f16,	%f28,	%f14
	nop
	set	0x40, %g4
	std	%l2,	[%l7 + %g4]
	set	0x18, %i7
	stda	%o0,	[%l7 + %i7] 0x89
	set	0x68, %l2
	stxa	%o3,	[%l7 + %l2] 0x80
	ld	[%l7 + 0x68],	%f30
	nop
	set	0x7A, %g7
	ldstub	[%l7 + %g7],	%l5
	nop
	set	0x5C, %i4
	ldsw	[%l7 + %i4],	%i6
	or	%o4,	%g7,	%g4
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc4
	nop
	set	0x2A, %o6
	stb	%o2,	[%l7 + %o6]
	nop
	set	0x48, %g5
	std	%f4,	[%l7 + %g5]
	set	0x57, %g3
	stba	%l6,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x6D, %g2
	ldsb	[%l7 + %g2],	%l0
	nop
	set	0x0E, %i0
	lduh	[%l7 + %i0],	%g3
	nop
	set	0x52, %i2
	ldsb	[%l7 + %i2],	%i1
	set	0x78, %l1
	stxa	%i4,	[%l7 + %l1] 0x81
	nop
	set	0x27, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x16, %i5
	ldsh	[%l7 + %i5],	%o7
	bleu,a,pt	%xcc,	loop_139
	nop
	set	0x4C, %l3
	swap	[%l7 + %l3],	%g1
	fpsub32s	%f3,	%f6,	%f29
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%g5
loop_139:
	nop
	set	0x48, %l0
	stx	%i7,	[%l7 + %l0]
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x60, %o3
	ldsh	[%l7 + %o3],	%g6
	nop
	set	0x50, %o0
	ldsw	[%l7 + %o0],	%i5
	fpadd32	%f0,	%f4,	%f28
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x30, %o2
	std	%o0,	[%l7 + %o2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o6
	nop
	set	0x14, %l5
	lduw	[%l7 + %l5],	%l4
	nop
	set	0x4A, %l4
	sth	%i2,	[%l7 + %l4]
	set	0x30, %l6
	stxa	%g2,	[%l7 + %l6] 0x88
	set	0x40, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o5
	nop
	set	0x5E, %o4
	ldstub	[%l7 + %o4],	%l3
	nop
	set	0x48, %o1
	std	%i0,	[%l7 + %o1]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x80
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%o3
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd0
	nop
	set	0x28, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x30, %i4
	sth	%l5,	[%l7 + %i4]
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f24
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f20
	nop
	set	0x14, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o0
	fpsub16s	%f14,	%f24,	%f4
	nop
	set	0x76, %o6
	stb	%o4,	[%l7 + %o6]
	nop
	set	0x1D, %g2
	stb	%g7,	[%l7 + %g2]
	nop
	set	0x18, %i0
	std	%f2,	[%l7 + %i0]
	nop
	set	0x15, %i2
	ldub	[%l7 + %i2],	%i6
	nop
	set	0x50, %o5
	std	%o2,	[%l7 + %o5]
	set	0x10, %i5
	lda	[%l7 + %i5] 0x80,	%f18
	nop
	set	0x26, %l1
	ldsb	[%l7 + %l1],	%g4
	and	%l0,	%g3,	%l6
	set	0x78, %l3
	stwa	%i4,	[%l7 + %l3] 0x80
	set	0x19, %o7
	ldstuba	[%l7 + %o7] 0x88,	%l2
	set	0x68, %g6
	lda	[%l7 + %g6] 0x88,	%f6
	fpsub16s	%f14,	%f29,	%f1
	nop
	set	0x0C, %l0
	ldsh	[%l7 + %l0],	%i1
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xe3,	%g0
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x70, %o3
	stx	%g5,	[%l7 + %o3]
	nop
	set	0x74, %i3
	lduw	[%l7 + %i3],	%i7
	set	0x4B, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o7
	nop
	set	0x32, %l5
	lduh	[%l7 + %l5],	%i5
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x44, %l6
	swap	[%l7 + %l6],	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l1
	set	0x18, %l4
	stda	%o6,	[%l7 + %l4] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f22
	wr	%l4,	%o1,	%set_softint
	set	0x4D, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l3
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x88,	 4
	nop
	set	0x58, %i7
	stx	%i0,	[%l7 + %i7]
	nop
	set	0x4B, %g4
	ldub	[%l7 + %g4],	%l5
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o2
	nop
	nop
	setx	0x5A22988C4058618A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x13824B179173BF14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f2
	nop
	set	0x75, %i4
	ldsb	[%l7 + %i4],	%o0
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x81,	%o4
	nop
	set	0x08, %g7
	swap	[%l7 + %g7],	%g7
	set	0x70, %g5
	stda	%o2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x4A, %g3
	lduh	[%l7 + %g3],	%i6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x89,	%g4
	or	%g3,	%l6,	%i4
	nop
	set	0x7E, %g2
	ldsh	[%l7 + %g2],	%l2
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x80,	 4
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x88,	%l0
	or	%g1,	%g5,	%o7
	or	%i7,	%i5,	%i3
	set	0x44, %i2
	stwa	%g6,	[%l7 + %i2] 0x81
	nop
	set	0x78, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	set	0x6C, %i5
	swapa	[%l7 + %i5] 0x89,	%l4
	wr	%o1,	%i2,	%set_softint
	nop
	nop
	setx	0x433D443B6961DA8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5B44DB21E379DD90,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f28
	nop
	set	0x6E, %g6
	ldub	[%l7 + %g6],	%o5
	set	0x2C, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o6
	and	%l3,	%g2,	%i0
	set	0x40, %o0
	sta	%f3,	[%l7 + %o0] 0x88
	nop
	set	0x28, %o3
	std	%f20,	[%l7 + %o3]
	set	0x20, %l0
	prefetcha	[%l7 + %l0] 0x89,	 4
	or	%o0,	%o4,	%g7
	set	0x34, %o2
	sta	%f9,	[%l7 + %o2] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%o2
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xe2,	%g4
	nop
	set	0x68, %l6
	ldx	[%l7 + %l6],	%g3
	add	%i6,	%i4,	%l2
	st	%f27,	[%l7 + 0x0C]
	add	%i1,	%l0,	%l6
	nop
	set	0x77, %l4
	stb	%g5,	[%l7 + %l4]
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%g0
	st	%fsr,	[%l7 + 0x70]
	set	0x62, %g1
	stha	%i7,	[%l7 + %g1] 0x88
	nop
	set	0x10, %i1
	stw	%i5,	[%l7 + %i1]
	fpsub32	%f22,	%f8,	%f0
	set	0x70, %i7
	stxa	%i3,	[%l7 + %i7] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%o7
	wr	%l4,	%o1,	%y
	and	%l1,	%o5,	%i2
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%l3
	nop
	set	0x5E, %o1
	sth	%g2,	[%l7 + %o1]
	fpsub32	%f10,	%f24,	%f22
	fpsub16s	%f13,	%f31,	%f30
	nop
	set	0x24, %g4
	swap	[%l7 + %g4],	%i0
	nop
	set	0x28, %i4
	lduh	[%l7 + %i4],	%o6
	and	%o3,	%o0,	%g7
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	fpsub16s	%f10,	%f10,	%f10
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%l5
	fpsub16s	%f12,	%f12,	%f12
	fpsub32s	%f22,	%f18,	%f14
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f6
	nop
	set	0x26, %i6
	sth	%o2,	[%l7 + %i6]
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f12
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x68, %g2
	std	%f8,	[%l7 + %g2]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o4
	set	0x50, %i0
	stda	%g2,	[%l7 + %i0] 0x81
	nop
	set	0x6C, %g3
	lduw	[%l7 + %g3],	%i4
	nop
	set	0x24, %o5
	stw	%l2,	[%l7 + %o5]
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x88,	%i1
	and	%l0,	%l6,	%g5
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf8
	membar	#Sync
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x81
	nop
	set	0x50, %g6
	ldsh	[%l7 + %g6],	%i6
	ld	[%l7 + 0x1C],	%f23
	ld	[%l7 + 0x54],	%f19
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f0
	nop
	set	0x20, %o0
	stw	%g1,	[%l7 + %o0]
	nop
	set	0x18, %o7
	std	%f12,	[%l7 + %o7]
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x88,	 3
	wr	%i7,	%i3,	%ccr
	set	0x08, %o2
	lda	[%l7 + %o2] 0x80,	%f30
	set	0x34, %i3
	lda	[%l7 + %i3] 0x80,	%f17
	nop
	set	0x17, %o3
	ldsb	[%l7 + %o3],	%g6
	set	0x40, %l4
	sta	%f1,	[%l7 + %l4] 0x88
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%l4
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	nop
	nop
	setx	0xA054A7C83106DED3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE1BF9A71D48D5C28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f22,	%f18
	nop
	set	0x72, %g1
	lduh	[%l7 + %g1],	%o7
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%l1,	%o5,	%l3
	or	%g2,	%i0,	%o6
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%i2
	fpsub16s	%f27,	%f11,	%f28
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%o3
	set	0x20, %g4
	stxa	%o0,	[%l7 + %g4] 0x89
	set	0x34, %i4
	sta	%f0,	[%l7 + %i4] 0x80
	st	%f6,	[%l7 + 0x54]
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f0
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%l5
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%g6
	set	0x10, %i6
	stha	%g4,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%o4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x89
	st	%f2,	[%l7 + 0x38]
	set	0x20, %i0
	stxa	%g3,	[%l7 + %i0] 0x89
	ld	[%l7 + 0x68],	%f10
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%i4
	nop
	set	0x10, %g3
	stw	%l2,	[%l7 + %g3]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xcc
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%i1
	set	0x73, %g7
	stba	%l0,	[%l7 + %g7] 0x81
	set	0x70, %l1
	swapa	[%l7 + %l1] 0x80,	%g5
	and	%i6,	%g1,	%i5
	set	0x14, %g6
	stha	%i7,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f4
	set	0x70, %o0
	stxa	%i3,	[%l7 + %o0] 0x81
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%l6
	nop
	set	0x31, %l3
	ldstub	[%l7 + %l3],	%o1
	set	0x0D, %o7
	stba	%o7,	[%l7 + %o7] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%l4
	set	0x20, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o5
	set	0x4C, %i3
	stwa	%g2,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x6C, %o3
	stw	%l3,	[%l7 + %o3]
	add	%i0,	%i2,	%o6
	nop
	set	0x74, %l4
	ldsw	[%l7 + %l4],	%o0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f16
	set	0x62, %o2
	stha	%o3,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f30
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%f4
	nop
	set	0x08, %i1
	sth	%g7,	[%l7 + %i1]
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%g4
	add	%o4,	%g3,	%l5
	nop
	set	0x68, %g4
	std	%f16,	[%l7 + %g4]
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%o2
	nop
	set	0x50, %l2
	std	%i4,	[%l7 + %l2]
	ba,a,pn	%xcc,	loop_140
	st	%f7,	[%l7 + 0x0C]
	set	0x28, %i7
	stwa	%l2,	[%l7 + %i7] 0xe3
	membar	#Sync
loop_140:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%l0
	set	0x1C, %l5
	stwa	%i6,	[%l7 + %l5] 0x89
	or	%g5,	%i5,	%g1
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%i3
	set	0x60, %g5
	stxa	%g6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x56, %o6
	ldsb	[%l7 + %o6],	%l6
	nop
	set	0x58, %g2
	std	%f16,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xcc
	add	%i7,	%o7,	%l1
	set	0x08, %i2
	swapa	[%l7 + %i2] 0x88,	%o1
	nop
	set	0x7E, %g3
	ldsb	[%l7 + %g3],	%o5
	and	%g2,	%l3,	%l4
	nop
	set	0x57, %l1
	stb	%i0,	[%l7 + %l1]
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x80,	 4
	nop
	set	0x3A, %i5
	ldstub	[%l7 + %i5],	%i2
	ld	[%l7 + 0x54],	%f12
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc4
	set	0x3C, %l3
	sta	%f1,	[%l7 + %l3] 0x80
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%o0
	nop
	set	0x40, %l0
	stx	%g7,	[%l7 + %l0]
	or	%o3,	%g4,	%o4
	nop
	set	0x57, %i3
	ldsb	[%l7 + %i3],	%g3
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x1C, %o7
	ldub	[%l7 + %o7],	%l5
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i1
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%l0
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x88,	%i6
	nop
	set	0x70, %l6
	stx	%g5,	[%l7 + %l6]
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%i5
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
	and	%g1,	%i3,	%g6
	set	0x4C, %g4
	sta	%f10,	[%l7 + %g4] 0x89
	st	%f28,	[%l7 + 0x14]
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%i6
	set	0x2C, %l2
	stwa	%i7,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x48, %i7
	swap	[%l7 + %i7],	%i4
	nop
	set	0x50, %l5
	lduh	[%l7 + %l5],	%o7
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%l0
	ble,a,pn	%xcc,	loop_141
	wr	%o1,	%o5,	%softint
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd8
loop_141:
	nop
	set	0x4F, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g2
	nop
	set	0x40, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x54, %o6
	stw	%l3,	[%l7 + %o6]
	nop
	set	0x38, %o5
	lduw	[%l7 + %o5],	%l4
	add	%i0,	%o6,	%i2
	nop
	set	0x63, %i0
	stb	%g7,	[%l7 + %i0]
	nop
	set	0x71, %g3
	ldub	[%l7 + %g3],	%o3
	or	%o0,	%g4,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%l5
	set	0x60, %i2
	sta	%f13,	[%l7 + %i2] 0x81
	set	0x68, %l1
	stxa	%l2,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x70, %g6
	std	%i0,	[%l7 + %g6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%l0
	nop
	set	0x09, %o0
	ldub	[%l7 + %o0],	%g5
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc8
	nop
	set	0x60, %i5
	std	%f4,	[%l7 + %i5]
	set	0x72, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i5
	nop
	set	0x0A, %i3
	stb	%g1,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x2C, %g7
	lduw	[%l7 + %g7],	%i3
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xea,	%g6
	set	0x76, %l4
	stba	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	set	0x60, %o2
	swapa	[%l7 + %o2] 0x89,	%l6
	set	0x7C, %l6
	sta	%f12,	[%l7 + %l6] 0x89
	set	0x0E, %o7
	stba	%i4,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x70, %i1
	swapa	[%l7 + %i1] 0x80,	%i7
	nop
	set	0x1C, %g4
	prefetch	[%l7 + %g4],	 0
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x89,	%l1
	nop
	set	0x46, %i7
	ldstub	[%l7 + %i7],	%o1
	nop
	set	0x4F, %l5
	ldsb	[%l7 + %l5],	%o7
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xda
	nop
	set	0x38, %i4
	ldstub	[%l7 + %i4],	%o5
	set	0x08, %g5
	lda	[%l7 + %g5] 0x89,	%f17
	nop
	set	0x1C, %g2
	swap	[%l7 + %g2],	%l3
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x88,	 1
	nop
	set	0x38, %i0
	lduw	[%l7 + %i0],	%l4
	nop
	set	0x0C, %g3
	lduh	[%l7 + %g3],	%o6
	nop
	set	0x46, %o5
	stb	%i2,	[%l7 + %o5]
	set	0x44, %l1
	lda	[%l7 + %l1] 0x81,	%f18
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%g7
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%o3
	set	0x37, %l3
	stba	%i0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x60, %i5
	stw	%o0,	[%l7 + %i5]
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%o4
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%g4
	nop
	set	0x20, %i3
	std	%g2,	[%l7 + %i3]
	wr	%l5,	%l2,	%y
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%l0
	set	0x20, %g7
	stxa	%g5,	[%l7 + %g7] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%g1
	nop
	set	0x6C, %l4
	ldsw	[%l7 + %l4],	%i5
	nop
	set	0x64, %o3
	lduw	[%l7 + %o3],	%g6
	nop
	set	0x64, %o2
	ldsh	[%l7 + %o2],	%i3
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f13
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x88,	 0
	or	%l6,	%i4,	%i7
	ld	[%l7 + 0x2C],	%f30
	st	%fsr,	[%l7 + 0x7C]
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	st	%fsr,	[%l7 + 0x34]
	set	0x70, %g4
	lda	[%l7 + %g4] 0x88,	%f29
	set	0x7A, %i1
	stba	%o1,	[%l7 + %i1] 0x80
	nop
	set	0x1C, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x38, %g1
	stxa	%o7,	[%l7 + %g1] 0xea
	membar	#Sync
	ld	[%l7 + 0x24],	%f11
	and	%l3,	%g2,	%o5
	set	0x48, %i7
	sta	%f31,	[%l7 + %i7] 0x81
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x80
	add	%o6,	%i2,	%l4
	nop
	set	0x18, %o1
	std	%o2,	[%l7 + %o1]
	nop
	set	0x38, %l5
	stw	%g7,	[%l7 + %l5]
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xea,	%o0
	nop
	set	0x36, %g5
	ldub	[%l7 + %g5],	%o4
	set	0x23, %o6
	stba	%i0,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x40, %g2
	std	%f0,	[%l7 + %g2]
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%g4
	set	0x10, %o5
	prefetcha	[%l7 + %o5] 0x88,	 3
	nop
	set	0x64, %l1
	lduw	[%l7 + %l1],	%g3
	nop
	set	0x4B, %i0
	stb	%i1,	[%l7 + %i0]
	nop
	set	0x28, %g6
	ldsh	[%l7 + %g6],	%l0
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%g5
	nop
	set	0x18, %i5
	std	%l2,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x5C]
	wr	%g1,	%o2,	%ccr
	nop
	set	0x68, %o0
	std	%g6,	[%l7 + %o0]
	fpadd32s	%f0,	%f8,	%f18
	nop
	set	0x60, %l0
	prefetch	[%l7 + %l0],	 2
	add	%i5,	%i3,	%l6
	nop
	set	0x70, %i2
	stx	%i6,	[%l7 + %i2]
	nop
	set	0x10, %i3
	stx	%i4,	[%l7 + %i3]
	ld	[%l7 + 0x70],	%f8
	add	%l1,	%o1,	%i7
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x18]
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x80,	 1
	add	%g2,	%l3,	%o6
	and	%o5,	%l4,	%o3
	set	0x7F, %o2
	stba	%g7,	[%l7 + %o2] 0x80
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd0,	%f0
	nop
	set	0x70, %o4
	swap	[%l7 + %o4],	%i2
	set	0x5C, %o7
	stwa	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	or	%i0,	%o4,	%l5
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%g4
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%l0
	or	%g3,	%l2,	%g1
	nop
	set	0x68, %l2
	stw	%o2,	[%l7 + %l2]
	nop
	set	0x40, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x68, %i6
	stx	%g6,	[%l7 + %i6]
	nop
	set	0x7A, %i7
	stb	%i3,	[%l7 + %i7]
	and	%i5,	%l6,	%i6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc0
	set	0x54, %i4
	lda	[%l7 + %i4] 0x89,	%f0
	st	%fsr,	[%l7 + 0x60]
	set	0x14, %g5
	stha	%i4,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	set	0x24, %o6
	stha	%i7,	[%l7 + %o6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x54],	%f17
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%l1
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	set	0x14, %l1
	sta	%f20,	[%l7 + %l1] 0x80
	fpadd32s	%f2,	%f22,	%f6
	nop
	set	0x58, %i0
	stw	%g2,	[%l7 + %i0]
	set	0x5B, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l3
	wr	%o6,	%l4,	%ccr
	nop
	set	0x6C, %g6
	ldub	[%l7 + %g6],	%o5
	set	0x64, %i5
	sta	%f10,	[%l7 + %i5] 0x89
	set	0x38, %o0
	lda	[%l7 + %o0] 0x88,	%f20
	set	0x48, %l0
	swapa	[%l7 + %l0] 0x81,	%o3
	nop
	set	0x48, %l3
	stx	%g7,	[%l7 + %l3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%i0
	st	%f14,	[%l7 + 0x18]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%i2
	nop
	set	0x40, %l4
	std	%l4,	[%l7 + %l4]
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xeb,	%o4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf0
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f16
	nop
	set	0x60, %o2
	std	%f30,	[%l7 + %o2]
	set	0x24, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g4
	set	0x48, %o4
	stda	%i0,	[%l7 + %o4] 0xe3
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%l2
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%g1
	or	%o2,	%g5,	%l0
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x20, %g4
	lduh	[%l7 + %g4],	%i3
	nop
	set	0x4E, %g1
	ldsh	[%l7 + %g1],	%g6
	nop
	set	0x41, %i6
	ldub	[%l7 + %i6],	%i5
	set	0x54, %l2
	lda	[%l7 + %l2] 0x89,	%f17
	nop
	set	0x3A, %i7
	sth	%l6,	[%l7 + %i7]
	set	0x78, %l5
	stwa	%i4,	[%l7 + %l5] 0xea
	membar	#Sync
	or	%o1,	%i7,	%i6
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x11, %i4
	stb	%g2,	[%l7 + %i4]
	set	0x4C, %o6
	sta	%f15,	[%l7 + %o6] 0x81
	nop
	set	0x20, %o5
	std	%o6,	[%l7 + %o5]
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%l4
	nop
	set	0x56, %i0
	ldsh	[%l7 + %i0],	%o5
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x81,	%l3
	add	%o3,	%o0,	%g7
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xea,	%i0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f0
	nop
	set	0x50, %g2
	ldsh	[%l7 + %g2],	%l5
	set	0x50, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o4
	add	%i2,	%g4,	%i1
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x81,	%f13
	nop
	set	0x24, %i3
	swap	[%l7 + %i3],	%l2
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x08, %o3
	stxa	%g1,	[%l7 + %o3] 0x81
	nop
	set	0x64, %i2
	ldsb	[%l7 + %i2],	%o2
	add	%g3,	%l0,	%g5
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%g6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%i3
	set	0x20, %l0
	ldxa	[%l7 + %l0] 0x80,	%i4
	set	0x0C, %o7
	sta	%f10,	[%l7 + %o7] 0x81
	nop
	set	0x20, %o2
	ldsh	[%l7 + %o2],	%l6
	nop
	set	0x14, %i1
	sth	%o1,	[%l7 + %i1]
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x20, %l6
	swapa	[%l7 + %l6] 0x80,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%o7
	nop
	set	0x14, %g4
	prefetch	[%l7 + %g4],	 1
	set	0x30, %g1
	stha	%g2,	[%l7 + %g1] 0x81
	bgu,a	%xcc,	loop_142
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x67, %l2
	stb	%i7,	[%l7 + %l2]
	set	0x74, %i7
	stha	%l4,	[%l7 + %i7] 0x88
loop_142:
	nop
	set	0x74, %i6
	sth	%o6,	[%l7 + %i6]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%g7
	nop
	set	0x64, %l5
	lduh	[%l7 + %l5],	%i0
	nop
	set	0x32, %g5
	stb	%l5,	[%l7 + %g5]
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x88,	%o4
	set	0x68, %o6
	stda	%o0,	[%l7 + %o6] 0x89
	st	%f27,	[%l7 + 0x48]
	nop
	set	0x58, %o5
	std	%f22,	[%l7 + %o5]
	and	%i2,	%g4,	%i1
	nop
	set	0x50, %g3
	std	%g0,	[%l7 + %g3]
	nop
	set	0x10, %o1
	stw	%l2,	[%l7 + %o1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%o2
	set	0x48, %i0
	stba	%g5,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x16, %l1
	ldstub	[%l7 + %l1],	%l0
	and	%g6,	%i5,	%i4
	st	%f17,	[%l7 + 0x08]
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f26
	ld	[%l7 + 0x54],	%f19
	ld	[%l7 + 0x18],	%f9
	nop
	set	0x48, %g2
	std	%i2,	[%l7 + %g2]
	fpadd16	%f28,	%f8,	%f24
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%i6
	and	%l6,	%l1,	%g2
	nop
	set	0x60, %g6
	stw	%o7,	[%l7 + %g6]
	nop
	set	0x30, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x50, %l3
	stda	%l4,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%o6
	nop
	set	0x5C, %l4
	ldsw	[%l7 + %l4],	%l3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%i6
	nop
	set	0x54, %l0
	prefetch	[%l7 + %l0],	 0
	st	%f2,	[%l7 + 0x0C]
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	and	%o3,	%o5,	%i0
	nop
	set	0x20, %o7
	std	%f24,	[%l7 + %o7]
	set	0x4C, %o2
	sta	%f22,	[%l7 + %o2] 0x89
	and	%l5,	%g7,	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g4
	nop
	set	0x70, %o4
	stx	%i1,	[%l7 + %o4]
	fpadd16s	%f24,	%f26,	%f2
	nop
	set	0x08, %i1
	std	%f16,	[%l7 + %i1]
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%g0
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x81,	%o4
	st	%f0,	[%l7 + 0x5C]
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x81,	%l2
	nop
	set	0x40, %i7
	ldsw	[%l7 + %i7],	%g3
	set	0x18, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o2
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%g4
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x88,	%g6
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd0
	fpsub32	%f26,	%f12,	%f24
	nop
	set	0x60, %o6
	std	%f2,	[%l7 + %o6]
	nop
	set	0x14, %i4
	ldsw	[%l7 + %i4],	%l0
	nop
	set	0x43, %g3
	ldub	[%l7 + %g3],	%i5
	nop
	set	0x67, %o1
	ldsb	[%l7 + %o1],	%i4
	nop
	set	0x24, %i0
	swap	[%l7 + %i0],	%i3
	nop
	set	0x28, %o5
	std	%f20,	[%l7 + %o5]
	set	0x54, %l1
	sta	%f24,	[%l7 + %l1] 0x88
	nop
	set	0x2C, %i5
	ldub	[%l7 + %i5],	%o1
	or	%l6,	%l1,	%g2
	nop
	set	0x30, %o0
	stw	%i6,	[%l7 + %o0]
	nop
	set	0x2C, %g2
	swap	[%l7 + %g2],	%l4
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%o7
	nop
	set	0x78, %l3
	ldsw	[%l7 + %l3],	%o6
	set	0x30, %o3
	stxa	%l3,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x78, %g6
	stb	%i7,	[%l7 + %g6]
	nop
	set	0x11, %l4
	stb	%o5,	[%l7 + %l4]
	nop
	set	0x60, %l0
	prefetch	[%l7 + %l0],	 2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%o3
	set	0x30, %g7
	stxa	%g7,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x37, %i2
	ldsb	[%l7 + %i2],	%o0
	or	%i2,	%l5,	%g4
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x80,	%g1
	nop
	set	0x30, %o4
	stx	%o4,	[%l7 + %o4]
	nop
	set	0x09, %o7
	ldsb	[%l7 + %o7],	%l2
	and	%g3,	%i1,	%g5
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f26
	nop
	set	0x78, %l6
	stw	%o2,	[%l7 + %l6]
	set	0x20, %g1
	sta	%f17,	[%l7 + %g1] 0x81
	set	0x2D, %g4
	stba	%l0,	[%l7 + %g4] 0x88
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x89,	 1
	set	0x28, %l5
	stda	%i4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x50, %i6
	sta	%f10,	[%l7 + %i6] 0x80
	set	0x10, %l2
	stwa	%i3,	[%l7 + %l2] 0x80
	nop
	set	0x60, %o6
	std	%o0,	[%l7 + %o6]
	nop
	set	0x74, %i4
	lduw	[%l7 + %i4],	%l6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc2
	or	%l1,	%g2,	%g6
	st	%f2,	[%l7 + 0x70]
	nop
	set	0x52, %g5
	lduh	[%l7 + %g5],	%i6
	fpsub32s	%f15,	%f23,	%f4
	set	0x7F, %i0
	stba	%l4,	[%l7 + %i0] 0x81
	nop
	set	0x48, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x61, %o5
	ldsb	[%l7 + %o5],	%o6
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%o6
	fpsub32s	%f25,	%f2,	%f22
	ld	[%l7 + 0x0C],	%f12
	nop
	set	0x32, %o0
	ldsb	[%l7 + %o0],	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%i0
	nop
	set	0x48, %i5
	stx	%l3,	[%l7 + %i5]
	nop
	set	0x54, %i3
	stw	%o3,	[%l7 + %i3]
	set	0x68, %l3
	stda	%g6,	[%l7 + %l3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x28],	%f10
	set	0x38, %g2
	stda	%i2,	[%l7 + %g2] 0x81
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x71, %o3
	stb	%o0,	[%l7 + %o3]
	ld	[%l7 + 0x0C],	%f17
	nop
	set	0x78, %l4
	std	%l4,	[%l7 + %l4]
	nop
	set	0x28, %g6
	std	%f12,	[%l7 + %g6]
	nop
	set	0x60, %g7
	std	%g4,	[%l7 + %g7]
	or	%g1,	%o4,	%l2
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x89
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x89
	nop
	set	0x30, %o4
	ldsh	[%l7 + %o4],	%i1
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%g3
	nop
	set	0x64, %i1
	sth	%g5,	[%l7 + %i1]
	set	0x48, %o2
	stwa	%o2,	[%l7 + %o2] 0xe2
	membar	#Sync
	fpadd32	%f22,	%f14,	%f0
	set	0x7A, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i5
	set	0x30, %l6
	ldxa	[%l7 + %l6] 0x89,	%l0
	set	0x18, %i7
	lda	[%l7 + %i7] 0x80,	%f29
	nop
	set	0x58, %g4
	stb	%i3,	[%l7 + %g4]
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%o1
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%i4
	set	0x4C, %i6
	lda	[%l7 + %i6] 0x81,	%f12
	or	%l6,	%g2,	%l1
	nop
	set	0x3C, %i4
	swap	[%l7 + %i4],	%i6
	st	%fsr,	[%l7 + 0x4C]
	set	0x08, %o6
	stda	%l4,	[%l7 + %o6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x80,	%f29
	or	%o6,	%o7,	%i7
	nop
	set	0x10, %i0
	stw	%o5,	[%l7 + %i0]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	nop
	set	0x40, %o5
	ldstub	[%l7 + %o5],	%g6
	set	0x22, %o1
	stha	%l3,	[%l7 + %o1] 0x81
	nop
	set	0x60, %l1
	prefetch	[%l7 + %l1],	 0
	set	0x4C, %o0
	stwa	%o3,	[%l7 + %o0] 0xe2
	membar	#Sync
	fpadd32	%f24,	%f6,	%f30
	nop
	set	0x78, %i5
	swap	[%l7 + %i5],	%g7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%i0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xcc
	nop
	set	0x3A, %l3
	lduh	[%l7 + %l3],	%l5
	set	0x70, %g2
	sta	%f29,	[%l7 + %g2] 0x81
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x80,	%o0
	set	0x28, %o3
	stba	%g4,	[%l7 + %o3] 0x80
	fpsub16s	%f11,	%f20,	%f10
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f6
	nop
	set	0x6C, %g7
	stw	%g1,	[%l7 + %g7]
	set	0x60, %l0
	ldxa	[%l7 + %l0] 0x80,	%l2
	add	%i1,	%o4,	%g3
	add	%o2,	%g5,	%l0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xea,	%i4
	set	0x6C, %i2
	swapa	[%l7 + %i2] 0x89,	%o1
	fpsub16s	%f4,	%f25,	%f27
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%i4
	nop
	set	0x0A, %o2
	ldub	[%l7 + %o2],	%l6
	nop
	set	0x0B, %g1
	ldub	[%l7 + %g1],	%i3
	nop
	set	0x23, %i1
	ldub	[%l7 + %i1],	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%i6
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x81,	%l4
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f0
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xca
	or	%o6,	%o7,	%i7
	set	0x50, %l2
	swapa	[%l7 + %l2] 0x89,	%o5
	and	%l3,	%o3,	%g6
	nop
	set	0x38, %l5
	ldsw	[%l7 + %l5],	%i2
	nop
	set	0x20, %i6
	stx	%g7,	[%l7 + %i6]
	nop
	set	0x75, %i4
	ldub	[%l7 + %i4],	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%g1
	set	0x49, %o6
	stba	%i1,	[%l7 + %o6] 0x88
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	ld	[%l7 + 0x48],	%f10
	nop
	set	0x70, %g5
	std	%o4,	[%l7 + %g5]
	nop
	nop
	setx	0x8D54E3C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x357BD1AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f23,	%f28
	set	0x48, %o5
	sta	%f2,	[%l7 + %o5] 0x80
	nop
	set	0x3C, %o1
	ldsw	[%l7 + %o1],	%l2
	st	%f26,	[%l7 + 0x4C]
	set	0x1C, %g3
	lda	[%l7 + %g3] 0x80,	%f4
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x80,	%g3
	and	%g5,	%o2,	%i5
	st	%fsr,	[%l7 + 0x78]
	set	0x48, %i5
	lda	[%l7 + %i5] 0x80,	%f21
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l0
	or	%l6,	%i3,	%i4
	or	%l1,	%g2,	%i6
	or	%l4,	%o7,	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%o6
	set	0x67, %o0
	stba	%o3,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x89,	%f17
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x88,	 0
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%f28
	or	%g6,	%g7,	%i2
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%i0
	nop
	set	0x20, %g7
	std	%o0,	[%l7 + %g7]
	nop
	set	0x68, %l0
	std	%l4,	[%l7 + %l0]
	nop
	nop
	setx	0x1FDB8460,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x6ECD61B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f31,	%f11
	set	0x54, %o4
	lda	[%l7 + %o4] 0x88,	%f17
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x89,	 1
	nop
	set	0x30, %g6
	stb	%i1,	[%l7 + %g6]
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x80,	%o4
	nop
	nop
	setx	0x05F9FAE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x3568AAE5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f8,	%f17
	set	0x28, %g1
	stda	%l2,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%g3
	nop
	set	0x74, %l6
	prefetch	[%l7 + %l6],	 2
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f16
	ld	[%l7 + 0x1C],	%f28
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f6
	or	%g5,	%g1,	%i5
	nop
	set	0x0C, %g4
	stb	%o1,	[%l7 + %g4]
	set	0x28, %i6
	sta	%f26,	[%l7 + %i6] 0x80
	set	0x39, %i4
	stba	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x45, %o6
	ldsb	[%l7 + %o6],	%o2
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x1C, %g5
	stwa	%l6,	[%l7 + %g5] 0x81
	set	0x08, %i0
	stwa	%i3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x08, %o5
	sth	%i4,	[%l7 + %o5]
	nop
	set	0x64, %o1
	lduh	[%l7 + %o1],	%l1
	and	%i6,	%l4,	%o7
	nop
	set	0x45, %l1
	stb	%g2,	[%l7 + %l1]
	nop
	set	0x48, %i5
	ldsw	[%l7 + %i5],	%o5
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%o3
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd8
	nop
	set	0x2F, %i3
	ldub	[%l7 + %i3],	%l3
	set	0x50, %g3
	stxa	%g6,	[%l7 + %g3] 0x81
	nop
	set	0x70, %g2
	ldub	[%l7 + %g2],	%o6
	st	%f15,	[%l7 + 0x38]
	set	0x50, %l4
	stda	%g6,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x6E, %l3
	lduh	[%l7 + %l3],	%i0
	nop
	set	0x59, %g7
	ldub	[%l7 + %g7],	%i2
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x88,	 3
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f10
	or	%l5,	%i1,	%g4
	st	%fsr,	[%l7 + 0x24]
	add	%l2,	%o4,	%g3
	set	0x60, %i2
	ldda	[%l7 + %i2] 0x89,	%g4
	fpsub16s	%f10,	%f19,	%f11
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x7F, %o4
	ldub	[%l7 + %o4],	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l0
	set	0x48, %g1
	swapa	[%l7 + %g1] 0x80,	%o2
	fpadd32s	%f7,	%f22,	%f2
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd0
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x80,	%f5
	nop
	set	0x7C, %l6
	ldsb	[%l7 + %l6],	%l6
	nop
	set	0x44, %i7
	ldsb	[%l7 + %i7],	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%g1
	add	%i6,	%l1,	%l4
	st	%f18,	[%l7 + 0x54]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	set	0x70, %g4
	stda	%g2,	[%l7 + %g4] 0x81
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f24
	nop
	set	0x60, %i6
	sth	%o7,	[%l7 + %i6]
	nop
	set	0x64, %i4
	ldsh	[%l7 + %i4],	%o5
	set	0x6A, %l5
	stha	%i7,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%g6
	nop
	set	0x0C, %o6
	stw	%o6,	[%l7 + %o6]
	set	0x20, %g5
	stda	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x5A, %o5
	sth	%i0,	[%l7 + %o5]
	nop
	set	0x34, %i0
	ldsb	[%l7 + %i0],	%i2
	or	%g7,	%l5,	%o0
	nop
	set	0x6E, %l1
	stb	%g4,	[%l7 + %l1]
	set	0x78, %o1
	sta	%f10,	[%l7 + %o1] 0x80
	nop
	set	0x34, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x6E, %i3
	ldub	[%l7 + %i3],	%i1
	set	0x18, %g3
	sta	%f25,	[%l7 + %g3] 0x81
	nop
	set	0x60, %g2
	std	%o4,	[%l7 + %g2]
	nop
	set	0x5C, %l4
	lduw	[%l7 + %l4],	%g3
	set	0x5C, %l3
	lda	[%l7 + %l3] 0x80,	%f26
	nop
	set	0x38, %o0
	std	%f28,	[%l7 + %o0]
	nop
	set	0x33, %g7
	stb	%g5,	[%l7 + %g7]
	set	0x60, %o3
	stda	%l2,	[%l7 + %o3] 0x88
	nop
	set	0x58, %l0
	stx	%o1,	[%l7 + %l0]
	set	0x27, %i2
	stba	%l0,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x10, %o4
	ldx	[%l7 + %o4],	%i5
	set	0x30, %g6
	stxa	%o2,	[%l7 + %g6] 0x88
	add	%i3,	%i4,	%l6
	nop
	set	0x54, %o2
	sth	%i6,	[%l7 + %o2]
	ld	[%l7 + 0x50],	%f4
	nop
	set	0x20, %g1
	std	%l0,	[%l7 + %g1]
	nop
	set	0x6C, %l6
	ldsw	[%l7 + %l6],	%g1
	set	0x70, %i1
	lda	[%l7 + %i1] 0x80,	%f21
	set	0x10, %l2
	ldda	[%l7 + %l2] 0xeb,	%g2
	nop
	nop
	setx	0xA46FB1FDA3F556CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xECD4C20EA275905B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f18,	%f10
	nop
	set	0x10, %i7
	std	%l4,	[%l7 + %i7]
	set	0x34, %o7
	lda	[%l7 + %o7] 0x89,	%f15
	nop
	set	0x38, %g4
	std	%o4,	[%l7 + %g4]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x88,	%i6
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%o7
	set	0x40, %i4
	stxa	%g6,	[%l7 + %i4] 0x88
	fpadd16s	%f8,	%f1,	%f17
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%o6
	fpsub16	%f12,	%f12,	%f20
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x80,	%l2
	nop
	set	0x6A, %i0
	stb	%o3,	[%l7 + %i0]
	ld	[%l7 + 0x60],	%f1
	nop
	set	0x42, %o5
	sth	%i0,	[%l7 + %o5]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x80
	ba,a	%icc,	loop_143
	nop
	set	0x48, %l1
	lduh	[%l7 + %l1],	%g7
	nop
	set	0x0C, %i5
	ldsw	[%l7 + %i5],	%l5
	nop
	set	0x64, %i3
	ldub	[%l7 + %i3],	%i2
loop_143:
	nop
	set	0x54, %g2
	ldsw	[%l7 + %g2],	%g4
	set	0x70, %l4
	stda	%i0,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x50, %g3
	ldstuba	[%l7 + %g3] 0x89,	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%g5
	nop
	set	0x30, %o0
	std	%f8,	[%l7 + %o0]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%l2
	set	0x24, %g7
	swapa	[%l7 + %g7] 0x81,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%o2
	set	0x60, %o3
	stda	%i2,	[%l7 + %o3] 0x89
	and	%o1,	%l6,	%i4
	ld	[%l7 + 0x38],	%f24
	nop
	set	0x08, %l3
	stx	%i6,	[%l7 + %l3]
	fpadd16	%f14,	%f22,	%f20
	set	0x4C, %l0
	lda	[%l7 + %l0] 0x88,	%f12
	nop
	set	0x18, %o4
	stx	%l1,	[%l7 + %o4]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	set	0x60, %i2
	stda	%g2,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x10, %g1
	std	%f14,	[%l7 + %g1]
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x81,	 4
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%o5
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%l4
	bn,a	%xcc,	loop_144
	nop
	set	0x74, %i7
	swap	[%l7 + %i7],	%o7
	nop
	nop
	setx	0x345E05B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x99A8887E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f0,	%f29
	set	0x2D, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g6
loop_144:
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	nop
	setx	0xBDA554D189C36801,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x88C0CC1749C82FEF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f10,	%f30
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x81
	nop
	set	0x48, %l5
	sth	%o6,	[%l7 + %l5]
	nop
	set	0x62, %i6
	ldub	[%l7 + %i6],	%l3
	set	0x24, %i4
	stba	%i7,	[%l7 + %i4] 0x89
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f2
	nop
	set	0x0F, %g5
	ldub	[%l7 + %g5],	%o3
	nop
	set	0x16, %i0
	lduh	[%l7 + %i0],	%i0
	nop
	set	0x30, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x1A, %o5
	stba	%l5,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x46, %i5
	ldub	[%l7 + %i5],	%i2
	nop
	set	0x30, %l1
	swap	[%l7 + %l1],	%g4
	add	%i1,	%o0,	%g7
	nop
	set	0x2D, %g2
	ldsb	[%l7 + %g2],	%o4
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%l2
	ld	[%l7 + 0x18],	%f8
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x81,	 2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%i5
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x88,	%i3
	set	0x2C, %o0
	stwa	%o1,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x60, %l4
	ldstub	[%l7 + %l4],	%o2
	nop
	set	0x30, %o3
	std	%i6,	[%l7 + %o3]
	wr	%i6,	%i4,	%softint
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x81
	st	%fsr,	[%l7 + 0x0C]
	or	%g2,	%l1,	%g1
	nop
	set	0x78, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x2C, %o4
	stwa	%o5,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f2
	set	0x6C, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o7
	st	%f31,	[%l7 + 0x30]
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	add	%l4,	%o6,	%l3
	or	%g6,	%o3,	%i0
	ld	[%l7 + 0x70],	%f26
	set	0x10, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l5
	nop
	set	0x32, %i1
	lduh	[%l7 + %i1],	%i2
	nop
	set	0x40, %l6
	ldsb	[%l7 + %l6],	%g4
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x89,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%g7
	nop
	set	0x74, %i7
	sth	%o4,	[%l7 + %i7]
	add	%g5,	%l2,	%i7
	set	0x30, %g4
	stxa	%l0,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x40, %l5
	swapa	[%l7 + %l5] 0x81,	%g3
	bgu,pn	%xcc,	loop_145
	or	%i3,	%i5,	%o1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%l6
loop_145:
	nop
	set	0x28, %i6
	stda	%i4,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x16, %i4
	ldstub	[%l7 + %i4],	%i6
	nop
	set	0x08, %o7
	stx	%l1,	[%l7 + %o7]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x180, 	%sys_tick_cmpr
	add	%o7,	%l4,	%o6
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%g6
	or	%l3,	%o3,	%l5
	nop
	set	0x4C, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x40, %o1
	std	%i0,	[%l7 + %o1]
	wr	%g4,	%i1,	%y
	nop
	set	0x58, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x64, %l1
	swapa	[%l7 + %l1] 0x80,	%g7
	or	%g5,	%l2,	%i7
	st	%f7,	[%l7 + 0x38]
	nop
	set	0x53, %i5
	ldstub	[%l7 + %i5],	%l0
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i3
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%o4
	nop
	set	0x48, %g3
	lduh	[%l7 + %g3],	%o1
	nop
	set	0x38, %l4
	std	%f10,	[%l7 + %l4]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd8
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f18
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd8,	%f16
	st	%fsr,	[%l7 + 0x74]
	set	0x2A, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o2
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%i4
	set	0x60, %i2
	stxa	%i4,	[%l7 + %i2] 0x88
	nop
	set	0x60, %g1
	stx	%i6,	[%l7 + %g1]
	st	%f24,	[%l7 + 0x2C]
	set	0x0C, %g6
	lda	[%l7 + %g6] 0x89,	%f16
	nop
	set	0x4F, %o2
	ldstub	[%l7 + %o2],	%l6
	st	%f27,	[%l7 + 0x6C]
	nop
	set	0x38, %i1
	swap	[%l7 + %i1],	%g2
	set	0x58, %l2
	stwa	%l1,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%l4
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%o6
	set	0x6C, %g4
	stha	%o5,	[%l7 + %g4] 0x89
	nop
	set	0x0D, %i6
	stb	%g1,	[%l7 + %i6]
	st	%f13,	[%l7 + 0x68]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%g6
	nop
	set	0x56, %i4
	stb	%o3,	[%l7 + %i4]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%i0
	nop
	set	0x34, %o7
	ldsw	[%l7 + %o7],	%l5
	set	0x5E, %i0
	stha	%i1,	[%l7 + %i0] 0xe3
	membar	#Sync
	fpsub16	%f6,	%f26,	%f24
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f16
	set	0x2C, %o6
	stwa	%g4,	[%l7 + %o6] 0xe3
	membar	#Sync
	or	%o0,	%g7,	%i2
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f12
	set	0x78, %o5
	stwa	%g5,	[%l7 + %o5] 0x81
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%l2,	%l0,	%i7
	set	0x38, %i3
	stxa	%g3,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x76, %g2
	sth	%i3,	[%l7 + %g2]
	nop
	set	0x14, %l1
	ldub	[%l7 + %l1],	%o4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f0
	wr	%o2,	%i5,	%ccr
	ld	[%l7 + 0x70],	%f16
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	nop
	set	0x50, %l3
	stx	%i4,	[%l7 + %l3]
	set	0x2C, %o0
	sta	%f16,	[%l7 + %o0] 0x89
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	nop
	set	0x18, %o3
	stw	%o1,	[%l7 + %o3]
	set	0x18, %g7
	stxa	%l6,	[%l7 + %g7] 0x81
	nop
	set	0x10, %l0
	stx	%i6,	[%l7 + %l0]
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%l1
	nop
	set	0x30, %i2
	ldsw	[%l7 + %i2],	%o7
	nop
	set	0x58, %o2
	ldsw	[%l7 + %o2],	%g2
	set	0x44, %g6
	sta	%f19,	[%l7 + %g6] 0x88
	nop
	set	0x1C, %i1
	stw	%o6,	[%l7 + %i1]
	nop
	set	0x10, %l2
	std	%l4,	[%l7 + %l2]
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe2,	%o4
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f10
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x88,	%g1
	set	0x30, %i4
	stxa	%g6,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x5A, %g4
	stb	%o3,	[%l7 + %g4]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%l2
	add	%l5,	%i0,	%g4
	set	0x20, %o7
	stda	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x7C, %i0
	sta	%f0,	[%l7 + %i0] 0x88
	bge,a	%icc,	loop_146
	nop
	set	0x08, %g5
	std	%i0,	[%l7 + %g5]
	nop
	set	0x12, %o1
	stb	%g7,	[%l7 + %o1]
	set	0x24, %o5
	lda	[%l7 + %o5] 0x81,	%f26
loop_146:
	nop
	set	0x44, %i5
	stwa	%i2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%l2
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f12
	nop
	set	0x58, %i3
	ldx	[%l7 + %i3],	%l0
	nop
	set	0x66, %l4
	ldub	[%l7 + %l4],	%g5
	nop
	set	0x30, %g3
	std	%f18,	[%l7 + %g3]
	nop
	set	0x74, %l1
	ldsb	[%l7 + %l1],	%g3
	set	0x48, %l3
	swapa	[%l7 + %l3] 0x80,	%i3
	set	0x4C, %o4
	lda	[%l7 + %o4] 0x81,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%o4
	add	%i5,	%o2,	%o1
	set	0x70, %o3
	stda	%i4,	[%l7 + %o3] 0x81
	set	0x10, %o0
	prefetcha	[%l7 + %o0] 0x80,	 3
	set	0x68, %g7
	sta	%f24,	[%l7 + %g7] 0x81
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	nop
	set	0x4C, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x4F, %o2
	ldstub	[%l7 + %o2],	%l1
	nop
	set	0x20, %g6
	sth	%o7,	[%l7 + %g6]
	set	0x44, %i2
	stba	%i6,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x10, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o6
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%l4
	nop
	set	0x20, %i7
	lduh	[%l7 + %i7],	%g2
	add	%o5,	%g6,	%g1
	set	0x48, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0
	nop
	set	0x1C, %i4
	ldsh	[%l7 + %i4],	%o3
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%i0
	set	0x18, %g4
	stxa	%g4,	[%l7 + %g4] 0x88
	set	0x70, %o7
	stda	%o0,	[%l7 + %o7] 0xe3
	membar	#Sync
	bleu,a,pn	%icc,	loop_147
	nop
	set	0x32, %i0
	lduh	[%l7 + %i0],	%l5
	set	0x52, %g5
	stba	%i1,	[%l7 + %g5] 0xea
	membar	#Sync
loop_147:
	nop
	set	0x59, %o1
	stba	%i2,	[%l7 + %o1] 0x80
	set	0x7C, %o5
	stba	%l2,	[%l7 + %o5] 0x88
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x88,	%g7
	nop
	set	0x7F, %i5
	ldstub	[%l7 + %i5],	%g5
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x81,	%g3
	nop
	set	0x24, %i3
	stw	%i3,	[%l7 + %i3]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd0
	set	0x08, %g3
	lda	[%l7 + %g3] 0x88,	%f21
	ld	[%l7 + 0x7C],	%f24
	nop
	set	0x19, %g2
	stb	%l0,	[%l7 + %g2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%o1
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%i4
	set	0x1F, %o4
	stba	%o2,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x40, %o3
	std	%f28,	[%l7 + %o3]
	nop
	set	0x24, %o0
	swap	[%l7 + %o0],	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i6
	and	%l1,	%o6,	%l4
	nop
	set	0x60, %g7
	ldx	[%l7 + %g7],	%g2
	nop
	set	0x28, %l0
	ldsw	[%l7 + %l0],	%o5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf1
	membar	#Sync
	or	%g1,	%l3,	%o3
	nop
	set	0x50, %o2
	std	%g6,	[%l7 + %o2]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x89,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%i0
	set	0x50, %i2
	sta	%f7,	[%l7 + %i2] 0x81
	set	0x11, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i1
	nop
	set	0x18, %l1
	stx	%l5,	[%l7 + %l1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%i2
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x34, %l6
	stb	%g5,	[%l7 + %l6]
	nop
	set	0x24, %l2
	stw	%g7,	[%l7 + %l2]
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x5C, %i6
	lda	[%l7 + %i6] 0x80,	%f20
	ld	[%l7 + 0x54],	%f20
	set	0x40, %i4
	stxa	%g3,	[%l7 + %i4] 0x88
	nop
	set	0x30, %g4
	std	%l0,	[%l7 + %g4]
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x81,	%i7
	nop
	set	0x60, %g5
	lduw	[%l7 + %g5],	%o4
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f22
	nop
	set	0x68, %o7
	lduw	[%l7 + %o7],	%i3
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%i5
	nop
	set	0x08, %o6
	stx	%o1,	[%l7 + %o6]
	or	%i4,	%o2,	%o7
	set	0x64, %i5
	swapa	[%l7 + %i5] 0x89,	%l6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f0
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%l1
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x23, %l4
	ldsb	[%l7 + %l4],	%i6
	ld	[%l7 + 0x08],	%f17
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%o6
	set	0x48, %l3
	stxa	%g2,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x5C, %o0
	swapa	[%l7 + %o0] 0x80,	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%o5
	nop
	set	0x4C, %o3
	lduw	[%l7 + %o3],	%g6
	nop
	set	0x25, %g7
	ldstub	[%l7 + %g7],	%g4
	set	0x60, %g1
	sta	%f20,	[%l7 + %g1] 0x89
	or	%o3,	%i0,	%i1
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xe3,	%l4
	nop
	set	0x60, %l0
	std	%o0,	[%l7 + %l0]
	set	0x0F, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l2
	nop
	set	0x34, %i2
	ldsw	[%l7 + %i2],	%i2
	fpadd32	%f4,	%f18,	%f12
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%g5
	nop
	set	0x14, %l6
	swap	[%l7 + %l6],	%g3
	st	%fsr,	[%l7 + 0x5C]
	st	%f0,	[%l7 + 0x6C]
	set	0x08, %l2
	stda	%g6,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf8
	membar	#Sync
	nop
	set	0x78, %i4
	stx	%l0,	[%l7 + %i4]
	nop
	set	0x6D, %g4
	ldsb	[%l7 + %g4],	%i7
	set	0x78, %i0
	lda	[%l7 + %i0] 0x88,	%f28
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	set	0x78, %g5
	sta	%f20,	[%l7 + %g5] 0x89
	nop
	set	0x40, %o5
	ldsw	[%l7 + %o5],	%i3
	nop
	set	0x0E, %o1
	ldstub	[%l7 + %o1],	%o1
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x58, %o7
	stx	%i5,	[%l7 + %o7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o7
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f10
	set	0x11, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l6
	nop
	set	0x64, %i5
	stw	%l1,	[%l7 + %i5]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%i6
	set	0x30, %i3
	stha	%o6,	[%l7 + %i3] 0x89
	st	%fsr,	[%l7 + 0x0C]
	fpsub16	%f14,	%f10,	%f20
	nop
	set	0x50, %l4
	std	%g2,	[%l7 + %l4]
	st	%f21,	[%l7 + 0x64]
	nop
	set	0x18, %g3
	stw	%l4,	[%l7 + %g3]
	ld	[%l7 + 0x0C],	%f5
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%l2
	nop
	set	0x48, %l3
	ldx	[%l7 + %l3],	%o5
	nop
	set	0x44, %o4
	stb	%g1,	[%l7 + %o4]
	nop
	set	0x40, %o3
	stx	%g6,	[%l7 + %o3]
	nop
	set	0x32, %o0
	ldsh	[%l7 + %o0],	%o3
	st	%f8,	[%l7 + 0x08]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%g4
	ld	[%l7 + 0x60],	%f16
	set	0x6A, %o2
	stha	%i0,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x1E, %g1
	ldsb	[%l7 + %g1],	%i1
	nop
	set	0x6C, %g6
	stw	%l5,	[%l7 + %g6]
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%o0
	set	0x68, %l1
	stba	%l2,	[%l7 + %l1] 0x81
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%f4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%g5
	nop
	set	0x68, %l0
	stx	%g7,	[%l7 + %l0]
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x1C]
	st	%f18,	[%l7 + 0x54]
	set	0x76, %l2
	stha	%g3,	[%l7 + %l2] 0x81
	st	%f7,	[%l7 + 0x34]
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x89,	 4
	nop
	set	0x10, %i1
	std	%o4,	[%l7 + %i1]
	set	0x10, %g4
	stba	%i7,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x47, %i6
	ldsb	[%l7 + %i6],	%i3
	set	0x10, %g5
	lda	[%l7 + %g5] 0x89,	%f6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%i4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%o7
	st	%f15,	[%l7 + 0x20]
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f30
	nop
	set	0x48, %o1
	stw	%l1,	[%l7 + %o1]
	set	0x54, %o7
	lda	[%l7 + %o7] 0x89,	%f12
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l6
	fpadd16	%f0,	%f18,	%f30
	nop
	set	0x18, %o6
	std	%f22,	[%l7 + %o6]
	nop
	set	0x18, %o5
	std	%f20,	[%l7 + %o5]
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f10
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x80,	%i6
	nop
	set	0x30, %l4
	ldx	[%l7 + %l4],	%g2
	fpadd16	%f10,	%f12,	%f24
	set	0x6C, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o6
	bg,a,pt	%xcc,	loop_148
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%l4
	or	%o5,	%g1,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%o3
loop_148:
	nop
	set	0x0A, %l3
	ldub	[%l7 + %l3],	%g4
	set	0x50, %l5
	stxa	%i1,	[%l7 + %l5] 0x80
	st	%f17,	[%l7 + 0x6C]
	set	0x50, %o4
	stda	%l4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f16
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x89,	 4
	set	0x40, %g7
	stxa	%l2,	[%l7 + %g7] 0x81
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%i0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	wr	%g5,	%i2,	%y
	st	%fsr,	[%l7 + 0x68]
	set	0x70, %g6
	stxa	%g7,	[%l7 + %g6] 0x89
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%l0
	set	0x41, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o4
	st	%fsr,	[%l7 + 0x0C]
	set	0x2C, %l6
	sta	%f10,	[%l7 + %l6] 0x80
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	st	%f9,	[%l7 + 0x20]
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x81,	 0
	set	0x38, %i4
	stba	%i7,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x3C, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x60, %g4
	std	%f24,	[%l7 + %g4]
	or	%i3,	%i4,	%o1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%i4
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x88
	set	0x48, %i0
	swapa	[%l7 + %i0] 0x88,	%o7
	st	%fsr,	[%l7 + 0x40]
	st	%f21,	[%l7 + 0x30]
	nop
	set	0x36, %l2
	stb	%o2,	[%l7 + %l2]
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%l6
	nop
	set	0x0E, %o7
	sth	%l1,	[%l7 + %o7]
	add	%i6,	%g2,	%o6
	nop
	set	0x69, %o6
	ldsb	[%l7 + %o6],	%l4
	set	0x68, %i5
	stda	%o4,	[%l7 + %i5] 0x80
	set	0x40, %o5
	swapa	[%l7 + %o5] 0x80,	%l3
	nop
	set	0x24, %l4
	stw	%g1,	[%l7 + %l4]
	add	%g6,	%g4,	%i1
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x80
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%o3
	and	%o0,	%l2,	%g5
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f24
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x89,	%i0
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%f24
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x40, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf8
	membar	#Sync
	nop
	set	0x7A, %o3
	sth	%i2,	[%l7 + %o3]
	nop
	set	0x38, %g1
	std	%f10,	[%l7 + %g1]
	wr	%g7,	%l0,	%sys_tick
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x29, %g7
	ldstub	[%l7 + %g7],	%g3
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x89,	 1
	ld	[%l7 + 0x50],	%f4
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x88,	%o4
	nop
	set	0x18, %g6
	stx	%i3,	[%l7 + %g6]
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x89,	 3
	st	%f15,	[%l7 + 0x60]
	add	%o1,	%i5,	%o7
	set	0x2C, %i7
	stwa	%l6,	[%l7 + %i7] 0x88
	set	0x70, %i4
	stxa	%o2,	[%l7 + %i4] 0x80
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%i6
	set	0x4B, %l0
	stba	%g2,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x34, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x68, %g4
	stda	%l0,	[%l7 + %g4] 0x88
	nop
	set	0x66, %i0
	sth	%o6,	[%l7 + %i0]
	nop
	set	0x70, %g5
	stx	%o5,	[%l7 + %g5]
	bne	%xcc,	loop_149
	nop
	set	0x1C, %o1
	swap	[%l7 + %o1],	%l4
	nop
	set	0x77, %o7
	stb	%g1,	[%l7 + %o7]
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%g6
loop_149:
	nop
	set	0x3C, %l2
	swap	[%l7 + %l2],	%l3
	nop
	set	0x20, %i5
	stx	%g4,	[%l7 + %i5]
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x81,	%l5
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x80
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf0
	membar	#Sync
	nop
	set	0x3A, %i3
	stb	%o3,	[%l7 + %i3]
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	set	0x1C, %o4
	lda	[%l7 + %o4] 0x81,	%f17
	nop
	set	0x18, %l5
	std	%f0,	[%l7 + %l5]
	set	0x48, %o0
	stxa	%l2,	[%l7 + %o0] 0x81
	nop
	set	0x14, %l3
	stw	%i1,	[%l7 + %l3]
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	ld	[%l7 + 0x34],	%f1
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x89,	%g5
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%i2
	add	%l0,	%g7,	%i7
	st	%f8,	[%l7 + 0x38]
	or	%g3,	%o4,	%i3
	and	%o1,	%i5,	%o7
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%l6
	and	%i4,	%i6,	%o2
	nop
	set	0x3E, %i2
	ldsh	[%l7 + %i2],	%l1
	set	0x1C, %g6
	stwa	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	st	%f1,	[%l7 + 0x08]
	set	0x37, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g2
	nop
	set	0x08, %i7
	stw	%o5,	[%l7 + %i7]
	or	%g1,	%g6,	%l4
	set	0x20, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l3
	nop
	set	0x28, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%g4
	nop
	set	0x70, %i1
	swap	[%l7 + %i1],	%o3
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%o0
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%l2
	nop
	set	0x60, %g4
	std	%l4,	[%l7 + %g4]
	set	0x28, %g5
	stda	%i0,	[%l7 + %g5] 0x81
	bge	%xcc,	loop_150
	nop
	set	0x08, %o1
	stx	%i1,	[%l7 + %o1]
	nop
	set	0x58, %o7
	std	%g4,	[%l7 + %o7]
	set	0x62, %o6
	stha	%i2,	[%l7 + %o6] 0xeb
	membar	#Sync
loop_150:
	nop
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x88,	%g7
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x81,	%i6
	nop
	set	0x4C, %l4
	prefetch	[%l7 + %l4],	 0
	and	%g3,	%o4,	%i3
	wr	%l0,	%o1,	%set_softint
	ba,pn	%xcc,	loop_151
	nop
	set	0x18, %g2
	ldx	[%l7 + %g2],	%o7
	set	0x4C, %i3
	lda	[%l7 + %i3] 0x80,	%f8
loop_151:
	nop
	set	0x78, %o5
	sta	%f13,	[%l7 + %o5] 0x89
	nop
	set	0x40, %o4
	std	%f12,	[%l7 + %o4]
	nop
	set	0x78, %l5
	ldsb	[%l7 + %l5],	%i5
	nop
	set	0x08, %o0
	ldsw	[%l7 + %o0],	%i4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%l6
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x79, %o3
	ldub	[%l7 + %o3],	%l1
	nop
	set	0x08, %g1
	std	%f0,	[%l7 + %g1]
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%o6
	set	0x78, %o2
	swapa	[%l7 + %o2] 0x80,	%g2
	nop
	set	0x32, %l3
	sth	%o5,	[%l7 + %l3]
	ld	[%l7 + 0x18],	%f17
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%g0
	nop
	set	0x2A, %l6
	ldsh	[%l7 + %l6],	%g6
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%l4
	fpadd32s	%f3,	%f20,	%f21
	nop
	set	0x7C, %i2
	swap	[%l7 + %i2],	%o2
	nop
	set	0x74, %i4
	stb	%g4,	[%l7 + %i4]
	set	0x0E, %l0
	ldstuba	[%l7 + %l0] 0x89,	%l3
	nop
	set	0x27, %i1
	ldsb	[%l7 + %i1],	%o0
	set	0x7C, %i6
	lda	[%l7 + %i6] 0x81,	%f6
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%l2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1264
!	Type a   	: 21
!	Type cti   	: 16
!	Type x   	: 524
!	Type f   	: 52
!	Type i   	: 123
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!
! Thread 7 Start
!
.global thread_7
thread_7:
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
	set	0x0,	%g1
	set	0x0,	%g2
	set	0x8,	%g3
	set	0x5,	%g4
	set	0xD,	%g5
	set	0x7,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0xD,	%i2
	set	-0x9,	%i3
	set	-0x8,	%i4
	set	-0x0,	%i5
	set	-0xB,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x7BDEBD69,	%l0
	set	0x2FCB4B81,	%l1
	set	0x2CC10F67,	%l2
	set	0x749735E2,	%l3
	set	0x1B8C7E41,	%l4
	set	0x3823A178,	%l5
	set	0x222D35D9,	%l6
	!# Output registers
	set	0x12D4,	%o0
	set	-0x0935,	%o1
	set	-0x1AD7,	%o2
	set	-0x0579,	%o3
	set	0x0E4E,	%o4
	set	0x1548,	%o5
	set	-0x14ED,	%o6
	set	0x14A6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCCFB4639A4BA069C)
	INIT_TH_FP_REG(%l7,%f2,0x6975523825E5B0B9)
	INIT_TH_FP_REG(%l7,%f4,0xD4978F22EABFE7C2)
	INIT_TH_FP_REG(%l7,%f6,0x8FDC4AE5B80313A3)
	INIT_TH_FP_REG(%l7,%f8,0xAE484FF30458C96D)
	INIT_TH_FP_REG(%l7,%f10,0x7CBA945C07A60B6D)
	INIT_TH_FP_REG(%l7,%f12,0xEC4BABD6D8D253DF)
	INIT_TH_FP_REG(%l7,%f14,0x44A6315B72BE695C)
	INIT_TH_FP_REG(%l7,%f16,0x3005F63AC33BDEF2)
	INIT_TH_FP_REG(%l7,%f18,0x20BE352DAC399B67)
	INIT_TH_FP_REG(%l7,%f20,0xCEE71836F265A389)
	INIT_TH_FP_REG(%l7,%f22,0xAC31A5B031C3BE28)
	INIT_TH_FP_REG(%l7,%f24,0xB83271FE4D78738B)
	INIT_TH_FP_REG(%l7,%f26,0x898A425F028250D2)
	INIT_TH_FP_REG(%l7,%f28,0xF248211B95288E91)
	INIT_TH_FP_REG(%l7,%f30,0xE3E90938F265FEE8)

	!# Execute Main Diag ..

	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i0
	set	0x38, %g5
	sta	%f12,	[%l7 + %g5] 0x80
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x14],	%f7
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	nop
	set	0x08, %g4
	lduw	[%l7 + %g4],	%g5
	st	%f8,	[%l7 + 0x14]
	nop
	set	0x70, %l2
	stb	%l5,	[%l7 + %l2]
	nop
	set	0x44, %o6
	sth	%g7,	[%l7 + %o6]
	set	0x64, %l4
	swapa	[%l7 + %l4] 0x89,	%i2
	set	0x78, %g2
	ldxa	[%l7 + %g2] 0x88,	%g3
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x89
	and	%o4,	%i3,	%i7
	bleu,a	%icc,	loop_152
	nop
	set	0x7E, %i3
	stb	%l0,	[%l7 + %i3]
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%o6
	nop
	set	0x3A, %o5
	stb	%o1,	[%l7 + %o5]
loop_152:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%i6
	nop
	set	0x28, %l5
	stx	%i4,	[%l7 + %l5]
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x88,	%f17
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x81,	%l6
	set	0x30, %g1
	stha	%o6,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x30, %g7
	stba	%g2,	[%l7 + %g7] 0xe2
	membar	#Sync
	ba,a,pn	%xcc,	loop_153
	wr	%l1,	%g1,	%set_softint
	nop
	set	0x60, %g3
	std	%o4,	[%l7 + %g3]
	nop
	set	0x28, %o2
	stx	%fsr,	[%l7 + %o2]
loop_153:
	nop
	set	0x58, %l3
	ldxa	[%l7 + %l3] 0x80,	%l4
	set	0x10, %l6
	lda	[%l7 + %l6] 0x88,	%f13
	nop
	set	0x3E, %i7
	stb	%g6,	[%l7 + %i7]
	set	0x7C, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g4
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x89,	%l3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%o0
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%o3
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xea,	%i0
	nop
	set	0x68, %i4
	lduw	[%l7 + %i4],	%g5
	nop
	set	0x24, %i6
	ldsh	[%l7 + %i6],	%l5
	nop
	set	0x62, %l1
	sth	%i1,	[%l7 + %l1]
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x88,	%g7
	nop
	set	0x14, %i0
	stw	%g3,	[%l7 + %i0]
	nop
	nop
	setx	0xB978B194462345CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x832564589DCC05A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f24
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x88,	%o4
	nop
	set	0x60, %g4
	ldsh	[%l7 + %g4],	%i3
	set	0x48, %l2
	stda	%i6,	[%l7 + %l2] 0x81
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xcc
	nop
	set	0x68, %l4
	std	%l0,	[%l7 + %l4]
	set	0x10, %o1
	lda	[%l7 + %o1] 0x81,	%f14
	set	0x1C, %i5
	swapa	[%l7 + %i5] 0x81,	%o7
	nop
	set	0x27, %g2
	stb	%i2,	[%l7 + %g2]
	set	0x54, %o4
	sta	%f27,	[%l7 + %o4] 0x80
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f12
	ld	[%l7 + 0x54],	%f27
	set	0x7C, %l5
	stha	%i5,	[%l7 + %l5] 0x89
	and	%i6,	%i4,	%l6
	set	0x20, %o0
	sta	%f21,	[%l7 + %o0] 0x81
	set	0x2C, %o3
	lda	[%l7 + %o3] 0x88,	%f12
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xd8
	st	%f25,	[%l7 + 0x44]
	set	0x08, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o6
	nop
	set	0x0D, %g3
	ldsb	[%l7 + %g3],	%g2
	nop
	set	0x57, %g7
	ldstub	[%l7 + %g7],	%o1
	nop
	nop
	setx	0xA8F22BDC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x50465B71,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f13,	%f21
	set	0x54, %l3
	swapa	[%l7 + %l3] 0x89,	%g1
	bleu,pn	%xcc,	loop_154
	nop
	set	0x68, %l6
	ldx	[%l7 + %l6],	%o5
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x45, %i7
	ldstub	[%l7 + %i7],	%l1
loop_154:
	nop
	set	0x68, %g6
	stda	%l4,	[%l7 + %g6] 0x81
	nop
	set	0x48, %o2
	std	%g4,	[%l7 + %o2]
	set	0x74, %l0
	stwa	%g6,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x74, %i1
	ldsb	[%l7 + %i1],	%l3
	set	0x70, %i4
	stxa	%o0,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x46, %i2
	ldsh	[%l7 + %i2],	%l2
	bl,pt	%xcc,	loop_155
	nop
	set	0x40, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%o2,	%o3,	%g5
	or	%l5,	%i1,	%g7
loop_155:
	nop
	set	0x58, %i6
	std	%g2,	[%l7 + %i6]
	set	0x70, %g5
	lda	[%l7 + %g5] 0x81,	%f5
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%i0
	or	%o4,	%i3,	%i7
	set	0x68, %i0
	lda	[%l7 + %i0] 0x89,	%f5
	and	%o7,	%l0,	%i2
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x80,	 4
	nop
	set	0x78, %l2
	stb	%i6,	[%l7 + %l2]
	and	%i4,	%o6,	%l6
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%g2
	ld	[%l7 + 0x54],	%f14
	nop
	set	0x67, %o1
	stb	%g1,	[%l7 + %o1]
	wr	%o5,	%l1,	%clear_softint
	nop
	set	0x44, %l4
	swap	[%l7 + %l4],	%o1
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x89,	%g4
	ble	%icc,	loop_156
	add	%l4,	%g6,	%l3
	set	0x3A, %o4
	stha	%o0,	[%l7 + %o4] 0x81
loop_156:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%o3
	nop
	set	0x2C, %i5
	sth	%g5,	[%l7 + %i5]
	set	0x58, %i3
	stda	%l4,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x77, %l5
	ldub	[%l7 + %l5],	%i1
	or	%l2,	%g7,	%i0
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x78, %o0
	ldsb	[%l7 + %o0],	%g3
	set	0x18, %o5
	sta	%f7,	[%l7 + %o5] 0x89
	nop
	set	0x28, %g3
	swap	[%l7 + %g3],	%i3
	nop
	set	0x50, %g7
	std	%o4,	[%l7 + %g7]
	nop
	set	0x18, %g1
	std	%f28,	[%l7 + %g1]
	set	0x08, %l3
	stda	%o6,	[%l7 + %l3] 0x81
	nop
	set	0x18, %i7
	ldsw	[%l7 + %i7],	%l0
	and	%i2,	%i5,	%i7
	nop
	set	0x0C, %g6
	lduh	[%l7 + %g6],	%i4
	set	0x64, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i6
	set	0x68, %l0
	stxa	%l6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x48, %o2
	stda	%g2,	[%l7 + %o2] 0x81
	set	0x68, %i4
	sta	%f25,	[%l7 + %i4] 0x88
	nop
	set	0x0C, %i1
	ldsh	[%l7 + %i1],	%o6
	nop
	set	0x3A, %i2
	ldstub	[%l7 + %i2],	%o5
	ld	[%l7 + 0x18],	%f26
	fpadd16	%f24,	%f18,	%f18
	set	0x58, %l1
	stda	%l0,	[%l7 + %l1] 0x80
	set	0x47, %g5
	stba	%g1,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%g4
	set	0x30, %i0
	lda	[%l7 + %i0] 0x81,	%f28
	st	%fsr,	[%l7 + 0x08]
	set	0x57, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o1
	nop
	set	0x68, %l2
	lduh	[%l7 + %l2],	%g6
	nop
	set	0x10, %o6
	ldsh	[%l7 + %o6],	%l4
	nop
	set	0x08, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x48, %o1
	ldub	[%l7 + %o1],	%o0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f0
	nop
	set	0x75, %o4
	ldstub	[%l7 + %o4],	%o2
	set	0x0F, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l3
	nop
	set	0x28, %i5
	ldsb	[%l7 + %i5],	%o3
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%l5
	nop
	set	0x1C, %l5
	ldsh	[%l7 + %l5],	%i1
	nop
	set	0x58, %o3
	std	%f4,	[%l7 + %o3]
	fpsub32	%f18,	%f26,	%f22
	set	0x10, %o0
	stda	%l2,	[%l7 + %o0] 0x80
	and	%i0,	%g7,	%i3
	nop
	set	0x48, %o5
	swap	[%l7 + %o5],	%g3
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%f30
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f0
	st	%f6,	[%l7 + 0x68]
	set	0x08, %i3
	sta	%f16,	[%l7 + %i3] 0x88
	nop
	set	0x14, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f18
	nop
	set	0x62, %g1
	ldsh	[%l7 + %g1],	%o4
	set	0x62, %g6
	stba	%l0,	[%l7 + %g6] 0x81
	or	%i2,	%o7,	%i7
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x08, %l0
	ldsh	[%l7 + %l0],	%i4
	nop
	set	0x58, %o2
	std	%i4,	[%l7 + %o2]
	set	0x6A, %i4
	stba	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%g2
	ba,a,pn	%icc,	loop_157
	nop
	set	0x6C, %i2
	prefetch	[%l7 + %i2],	 1
	nop
	set	0x6E, %l1
	ldsh	[%l7 + %l1],	%l6
	nop
	set	0x7C, %g5
	prefetch	[%l7 + %g5],	 3
loop_157:
	nop
	nop
	setx	0xA26078E6A23FF253,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2738119B8375B3FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f6,	%f4
	nop
	set	0x26, %l6
	ldsb	[%l7 + %l6],	%o6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%g1
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%l1
	bn,pn	%icc,	loop_158
	st	%fsr,	[%l7 + 0x10]
	set	0x58, %g4
	stha	%g4,	[%l7 + %g4] 0x89
loop_158:
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x0B, %o6
	ldsb	[%l7 + %o6],	%g6
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x80,	 3
	ld	[%l7 + 0x50],	%f22
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x89,	%o0
	nop
	set	0x53, %l4
	ldstub	[%l7 + %l4],	%l4
	nop
	set	0x38, %i0
	stx	%l3,	[%l7 + %i0]
	set	0x50, %o4
	stxa	%o2,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xea,	%g4
	set	0x5B, %i5
	stba	%o3,	[%l7 + %i5] 0x89
	set	0x28, %l5
	swapa	[%l7 + %l5] 0x80,	%i1
	st	%fsr,	[%l7 + 0x74]
	and	%l2,	%l5,	%g7
	nop
	set	0x71, %o0
	ldstub	[%l7 + %o0],	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%o4
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%l0
	st	%fsr,	[%l7 + 0x3C]
	nop
	nop
	setx	0x5F246DEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x5542F4F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f17,	%f16
	nop
	set	0x5A, %o3
	ldub	[%l7 + %o3],	%i2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x18, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x30, %i3
	ldstub	[%l7 + %i3],	%o7
	nop
	set	0x50, %g7
	sth	%i3,	[%l7 + %g7]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xda
	and	%i4,	%i5,	%i6
	and	%g2,	%l6,	%o6
	set	0x1C, %g1
	stha	%i7,	[%l7 + %g1] 0x80
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	nop
	set	0x5C, %g6
	ldsh	[%l7 + %g6],	%o5
	nop
	set	0x28, %l0
	stx	%g1,	[%l7 + %l0]
	nop
	nop
	setx	0xDEF7771CCC39358A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x8E79544EA59ADE2F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f12
	set	0x40, %o2
	sta	%f6,	[%l7 + %o2] 0x88
	add	%g4,	%l1,	%g6
	nop
	set	0x70, %i4
	lduh	[%l7 + %i4],	%o0
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x88,	%l4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	set	0x54, %i1
	sta	%f21,	[%l7 + %i1] 0x80
	set	0x20, %g5
	stxa	%l3,	[%l7 + %g5] 0x88
	nop
	set	0x2C, %i6
	ldsb	[%l7 + %i6],	%o2
	nop
	set	0x08, %g4
	lduh	[%l7 + %g4],	%o1
	nop
	set	0x2D, %l2
	ldstub	[%l7 + %l2],	%g5
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x88,	%i0
	nop
	set	0x25, %o7
	stb	%o3,	[%l7 + %o7]
	st	%f10,	[%l7 + 0x60]
	nop
	set	0x10, %o1
	ldsh	[%l7 + %o1],	%l5
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%g6
	nop
	set	0x64, %i0
	lduh	[%l7 + %i0],	%i0
	set	0x48, %o4
	swapa	[%l7 + %o4] 0x89,	%g3
	nop
	set	0x42, %o6
	sth	%o4,	[%l7 + %o6]
	add	%l0,	%l2,	%i2
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x81,	 0
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f2
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x88,	%i4
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xda
	nop
	set	0x20, %o5
	stx	%i3,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%g2
	nop
	set	0x58, %g3
	stw	%i5,	[%l7 + %g3]
	set	0x6C, %o3
	ldstuba	[%l7 + %o3] 0x88,	%l6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xea,	%o6
	nop
	set	0x20, %g7
	std	%f26,	[%l7 + %g7]
	set	0x44, %g1
	lda	[%l7 + %g1] 0x81,	%f8
	add	%o5,	%g1,	%i7
	nop
	set	0x3A, %l3
	stb	%g4,	[%l7 + %l3]
	set	0x58, %g6
	sta	%f10,	[%l7 + %g6] 0x89
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x57, %l0
	stba	%g6,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o0
	set	0x34, %i2
	stwa	%l4,	[%l7 + %i2] 0x88
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc4
	nop
	set	0x0C, %l1
	ldsw	[%l7 + %l1],	%l3
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%o1
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f0
	set	0x58, %i6
	sta	%f7,	[%l7 + %i6] 0x88
	set	0x38, %l2
	stha	%l1,	[%l7 + %l2] 0x88
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	nop
	set	0x48, %g4
	std	%f16,	[%l7 + %g4]
	set	0x34, %o7
	lda	[%l7 + %o7] 0x80,	%f5
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x89,	%i1
	nop
	set	0x30, %i0
	std	%g4,	[%l7 + %i0]
	st	%f12,	[%l7 + 0x64]
	nop
	set	0x6C, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%g7
	nop
	set	0x1C, %i5
	swap	[%l7 + %i5],	%l5
	set	0x38, %l5
	swapa	[%l7 + %l5] 0x81,	%g3
	set	0x78, %g2
	swapa	[%l7 + %g2] 0x89,	%o4
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f4
	nop
	set	0x6B, %o0
	ldsb	[%l7 + %o0],	%l0
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x81,	 4
	nop
	set	0x1C, %i3
	ldsw	[%l7 + %i3],	%i0
	nop
	set	0x4E, %g7
	lduh	[%l7 + %g7],	%i2
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x88,	%i4
	add	%o7,	%i3,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%o5
	set	0x38, %l3
	stxa	%g1,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x6A, %g1
	stb	%l6,	[%l7 + %g1]
	nop
	set	0x5B, %g6
	ldstub	[%l7 + %g6],	%i7
	and	%g6,	%o0,	%l4
	nop
	set	0x68, %i7
	ldsw	[%l7 + %i7],	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%o2
	set	0x40, %l0
	stda	%l0,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%i1
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x4C, %o2
	lduh	[%l7 + %o2],	%g5
	add	%o3,	%o1,	%g7
	nop
	set	0x66, %l1
	sth	%g3,	[%l7 + %l1]
	set	0x77, %i1
	stba	%o4,	[%l7 + %i1] 0x89
	set	0x78, %g5
	stxa	%l5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x08, %l2
	stx	%l0,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x5C]
	ld	[%l7 + 0x10],	%f28
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%i2
	nop
	set	0x3E, %i6
	sth	%i0,	[%l7 + %i6]
	nop
	set	0x7A, %g4
	ldsb	[%l7 + %g4],	%i4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	set	0x38, %o1
	lda	[%l7 + %o1] 0x89,	%f25
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%i3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x88
	st	%f25,	[%l7 + 0x48]
	set	0x50, %l4
	stda	%i6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x77, %o6
	stb	%o7,	[%l7 + %o6]
	bg,a,pn	%xcc,	loop_159
	ld	[%l7 + 0x20],	%f2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i5
loop_159:
	nop
	set	0x64, %o4
	sta	%f7,	[%l7 + %o4] 0x88
	set	0x74, %i5
	stha	%o6,	[%l7 + %i5] 0x88
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x81,	%o5
	nop
	set	0x28, %g2
	ldsw	[%l7 + %g2],	%l6
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g0
	nop
	set	0x7B, %o5
	ldstub	[%l7 + %o5],	%i7
	set	0x76, %i3
	stba	%o0,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x38, %g7
	std	%l4,	[%l7 + %g7]
	and	%g6,	%l3,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%l1
	or	%g5,	%i1,	%o3
	nop
	set	0x08, %o3
	std	%f12,	[%l7 + %o3]
	or	%o1,	%g3,	%o4
	set	0x58, %l3
	stxa	%l5,	[%l7 + %l3] 0x81
	set	0x68, %g1
	stda	%l0,	[%l7 + %g1] 0x80
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	nop
	set	0x55, %g6
	ldsb	[%l7 + %g6],	%g7
	st	%fsr,	[%l7 + 0x54]
	st	%f19,	[%l7 + 0x5C]
	and	%i2,	%l2,	%i4
	or	%i0,	%i6,	%i3
	nop
	set	0x34, %l0
	ldsh	[%l7 + %l0],	%o7
	add	%g2,	%o6,	%i5
	wr 	%g0, 	0x4, 	%fprs
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g1
	nop
	set	0x1C, %i7
	stw	%o0,	[%l7 + %i7]
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%l4
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%g6
	set	0x70, %i2
	swapa	[%l7 + %i2] 0x81,	%o2
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	nop
	set	0x40, %g5
	std	%f20,	[%l7 + %g5]
	bgu,a,pt	%icc,	loop_160
	nop
	set	0x78, %l2
	std	%f14,	[%l7 + %l2]
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x3E, %i6
	lduh	[%l7 + %i6],	%i1
loop_160:
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x70, %g4
	ldsw	[%l7 + %g4],	%l1
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%o0
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xd8
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	nop
	set	0x4C, %i0
	ldsh	[%l7 + %i0],	%o3
	set	0x28, %o6
	sta	%f30,	[%l7 + %o6] 0x81
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l5
	set	0x40, %l4
	stxa	%g3,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x6E, %i5
	sth	%g7,	[%l7 + %i5]
	set	0x77, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i2
	set	0x58, %g2
	stda	%l0,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x5C, %o4
	lda	[%l7 + %o4] 0x81,	%f15
	set	0x64, %o0
	sta	%f17,	[%l7 + %o0] 0x81
	st	%f28,	[%l7 + 0x30]
	nop
	set	0x38, %i3
	std	%f2,	[%l7 + %i3]
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%i4
	nop
	set	0x48, %g7
	ldsw	[%l7 + %g7],	%i0
	nop
	set	0x68, %o3
	std	%l2,	[%l7 + %o3]
	fpadd32	%f2,	%f8,	%f14
	nop
	set	0x1D, %g1
	ldsb	[%l7 + %g1],	%i3
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%o7
	nop
	set	0x08, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x44, %l0
	stha	%i6,	[%l7 + %l0] 0x88
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xea,	%o6
	set	0x58, %i4
	sta	%f2,	[%l7 + %i4] 0x80
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 1
	and	%g2,	%l6,	%o5
	set	0x60, %o2
	swapa	[%l7 + %o2] 0x88,	%i7
	nop
	set	0x0C, %i2
	stw	%g1,	[%l7 + %i2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%o0
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	or	%l4,	%g6,	%g4
	set	0x26, %l1
	stha	%o2,	[%l7 + %l1] 0xe3
	membar	#Sync
	and	%l3,	%i1,	%l1
	st	%f24,	[%l7 + 0x38]
	nop
	set	0x28, %i6
	lduh	[%l7 + %i6],	%o1
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x88,	 4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%l5
	set	0x38, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o3
	nop
	set	0x1D, %l6
	ldstub	[%l7 + %l6],	%g7
	nop
	set	0x50, %i1
	std	%g2,	[%l7 + %i1]
	nop
	set	0x10, %o1
	ldsw	[%l7 + %o1],	%i2
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x89,	%i4
	set	0x48, %i0
	stda	%i0,	[%l7 + %i0] 0x88
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x89,	%l0
	set	0x54, %o6
	stha	%i3,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x30, %l5
	ldstub	[%l7 + %l5],	%l2
	nop
	set	0x4C, %i5
	stw	%i6,	[%l7 + %i5]
	nop
	set	0x20, %o4
	stw	%o7,	[%l7 + %o4]
	nop
	set	0x45, %o0
	ldstub	[%l7 + %o0],	%o6
	set	0x1C, %i3
	swapa	[%l7 + %i3] 0x81,	%l6
	set	0x64, %g2
	stha	%o5,	[%l7 + %g2] 0xe3
	membar	#Sync
	or	%g2,	%i7,	%g1
	set	0x48, %o5
	stwa	%o0,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%i5,	%l4,	%g4
	set	0x08, %g7
	stda	%g6,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x88,	%l3
	nop
	set	0x14, %g1
	ldsw	[%l7 + %g1],	%i1
	nop
	set	0x18, %g6
	std	%f14,	[%l7 + %g6]
	nop
	set	0x12, %l0
	sth	%l1,	[%l7 + %l0]
	st	%f29,	[%l7 + 0x0C]
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x88,	%o2
	set	0x58, %l3
	stxa	%g5,	[%l7 + %l3] 0x88
	nop
	set	0x10, %i7
	std	%f20,	[%l7 + %i7]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd2
	nop
	set	0x20, %i2
	stx	%o1,	[%l7 + %i2]
	or	%o4,	%l5,	%g7
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%g3
	st	%fsr,	[%l7 + 0x4C]
	set	0x74, %i4
	lda	[%l7 + %i4] 0x81,	%f2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%i2
	or	%i4,	%l0,	%i0
	nop
	set	0x78, %i6
	swap	[%l7 + %i6],	%i3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd8,	%f16
	nop
	set	0x52, %l1
	ldsh	[%l7 + %l1],	%i6
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%l6
	ble	%icc,	loop_161
	nop
	set	0x32, %l6
	lduh	[%l7 + %l6],	%o5
	nop
	set	0x70, %o1
	lduw	[%l7 + %o1],	%o6
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f16
loop_161:
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%i7
	nop
	nop
	setx	0xFEBF672CE7B68E57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9D16B7A9A00632C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f24,	%f26
	ld	[%l7 + 0x2C],	%f25
	nop
	set	0x70, %l4
	stx	%g2,	[%l7 + %l4]
	nop
	set	0x7C, %o7
	lduw	[%l7 + %o7],	%o0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%g0
	nop
	set	0x30, %i5
	stw	%i5,	[%l7 + %i5]
	nop
	set	0x3A, %o4
	ldstub	[%l7 + %o4],	%g4
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x80,	%f5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	nop
	set	0x4C, %o5
	lduw	[%l7 + %o5],	%l4
	set	0x5C, %g2
	stha	%l3,	[%l7 + %g2] 0x80
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x88,	%g6
	nop
	set	0x32, %g7
	lduh	[%l7 + %g7],	%i1
	nop
	set	0x2A, %g1
	sth	%o2,	[%l7 + %g1]
	or	%l1,	%g5,	%o4
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%o0
	wr	%g7,	%l5,	%sys_tick
	nop
	nop
	setx	0x574A847980DD3074,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD66AB91292149897,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f30,	%f4
	nop
	set	0x5C, %g3
	stw	%o3,	[%l7 + %g3]
	nop
	set	0x18, %l3
	lduh	[%l7 + %l3],	%g3
	set	0x78, %i7
	stha	%i2,	[%l7 + %i7] 0x80
	and	%i4,	%i0,	%l0
	nop
	set	0x08, %g6
	std	%f6,	[%l7 + %g6]
	set	0x30, %o2
	stwa	%i6,	[%l7 + %o2] 0x80
	nop
	set	0x34, %i2
	stw	%i3,	[%l7 + %i2]
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%o7,	%l2,	%o5
	or	%l6,	%o6,	%i7
	set	0x6F, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o0
	st	%f5,	[%l7 + 0x38]
	set	0x4D, %l2
	stba	%g1,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f0
	set	0x6F, %l1
	ldstuba	[%l7 + %l1] 0x89,	%i5
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x80,	%g4
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	st	%f5,	[%l7 + 0x08]
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f18
	ld	[%l7 + 0x48],	%f21
	bne,a,pn	%icc,	loop_162
	nop
	set	0x53, %l6
	ldsb	[%l7 + %l6],	%l3
	set	0x78, %i0
	stwa	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
loop_162:
	nop
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x89,	%i1
	nop
	set	0x34, %l4
	swap	[%l7 + %l4],	%g6
	nop
	set	0x70, %l5
	std	%f6,	[%l7 + %l5]
	set	0x38, %o6
	sta	%f19,	[%l7 + %o6] 0x80
	nop
	set	0x1D, %o4
	ldsb	[%l7 + %o4],	%l1
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x80,	 2
	ld	[%l7 + 0x44],	%f26
	and	%o2,	%o1,	%o4
	st	%f20,	[%l7 + 0x58]
	ld	[%l7 + 0x08],	%f27
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x80,	%g6
	or	%o3,	%l5,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%i0
	nop
	set	0x28, %o5
	stx	%l0,	[%l7 + %o5]
	nop
	set	0x67, %i3
	ldstub	[%l7 + %i3],	%i4
	nop
	set	0x38, %g2
	swap	[%l7 + %g2],	%i6
	nop
	set	0x1E, %g7
	ldsh	[%l7 + %g7],	%o7
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xcc
	set	0x7C, %l0
	sta	%f22,	[%l7 + %l0] 0x88
	set	0x38, %g3
	sta	%f4,	[%l7 + %g3] 0x80
	set	0x4E, %l3
	stha	%i3,	[%l7 + %l3] 0x80
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f20
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x88,	%o5
	nop
	set	0x12, %o2
	ldsb	[%l7 + %o2],	%l6
	set	0x74, %i2
	stba	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x23, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i7
	nop
	set	0x58, %g5
	ldx	[%l7 + %g5],	%o0
	set	0x10, %l2
	lda	[%l7 + %l2] 0x80,	%f1
	nop
	set	0x18, %i4
	std	%f18,	[%l7 + %i4]
	nop
	set	0x61, %i6
	ldub	[%l7 + %i6],	%l2
	nop
	set	0x24, %g4
	stw	%g1,	[%l7 + %g4]
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x64, %l1
	swap	[%l7 + %l1],	%g4
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc8
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd2
	and	%i5,	%l3,	%l4
	nop
	set	0x30, %o7
	stx	%g2,	[%l7 + %o7]
	st	%f29,	[%l7 + 0x34]
	set	0x58, %l4
	stwa	%i1,	[%l7 + %l4] 0x80
	nop
	set	0x70, %l6
	lduw	[%l7 + %l6],	%g6
	fpsub16s	%f19,	%f10,	%f18
	set	0x78, %o6
	stxa	%g5,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x38, %l5
	stx	%l1,	[%l7 + %l5]
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x80,	%o2
	nop
	set	0x28, %i5
	ldstub	[%l7 + %i5],	%o4
	wr	%g7,	%o3,	%clear_softint
	nop
	set	0x76, %o0
	sth	%o1,	[%l7 + %o0]
	nop
	set	0x4C, %i3
	ldsw	[%l7 + %i3],	%g3
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i2
	set	0x48, %o5
	stxa	%i0,	[%l7 + %o5] 0xe2
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%l0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf0
	membar	#Sync
	nop
	set	0x40, %g7
	stx	%i6,	[%l7 + %g7]
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x3D, %l0
	ldstub	[%l7 + %l0],	%i4
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f14
	bl,a,pt	%xcc,	loop_163
	and	%o7,	%o5,	%i3
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc2
loop_163:
	nop
	set	0x3E, %o2
	stha	%o6,	[%l7 + %o2] 0x80
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i6
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f16
	nop
	set	0x70, %i2
	ldx	[%l7 + %i2],	%o0
	set	0x2C, %g5
	sta	%f24,	[%l7 + %g5] 0x89
	wr	%i7,	%g1,	%ccr
	set	0x40, %l2
	stda	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x0C, %i6
	lduw	[%l7 + %i6],	%i5
	nop
	set	0x50, %g4
	std	%l2,	[%l7 + %g4]
	set	0x2C, %i4
	sta	%f29,	[%l7 + %i4] 0x80
	add	%l4,	%g4,	%i1
	nop
	set	0x2A, %l1
	lduh	[%l7 + %l1],	%g6
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%g5
	add	%l1,	%o2,	%g2
	nop
	set	0x10, %i0
	std	%f22,	[%l7 + %i0]
	nop
	set	0x5C, %o7
	ldsw	[%l7 + %o7],	%o4
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x89,	%o3
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x89
	nop
	set	0x44, %o6
	ldstub	[%l7 + %o6],	%g7
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%o0
	set	0x44, %o4
	stba	%g3,	[%l7 + %o4] 0x89
	nop
	set	0x34, %o0
	swap	[%l7 + %o0],	%i2
	nop
	set	0x68, %i3
	std	%l4,	[%l7 + %i3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%i0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc4
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x5A, %i5
	sth	%i4,	[%l7 + %i5]
	nop
	set	0x38, %g7
	std	%i6,	[%l7 + %g7]
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe2,	%o4
	nop
	set	0x6E, %g1
	lduh	[%l7 + %g1],	%i3
	nop
	set	0x70, %i7
	ldsw	[%l7 + %i7],	%o7
	set	0x08, %l0
	stwa	%o6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd8,	%f0
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xcc
	set	0x38, %o3
	lda	[%l7 + %o3] 0x89,	%f23
	ble,a	%xcc,	loop_164
	nop
	set	0x60, %i2
	ldsb	[%l7 + %i2],	%o0
	set	0x54, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i7
loop_164:
	nop
	set	0x7D, %g6
	ldstub	[%l7 + %g6],	%l6
	add	%l2,	%i5,	%l3
	nop
	set	0x40, %l2
	std	%f14,	[%l7 + %l2]
	nop
	set	0x52, %g4
	sth	%l4,	[%l7 + %g4]
	nop
	set	0x1E, %i4
	ldsb	[%l7 + %i4],	%g1
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%g4
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%i1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f0
	ba	%icc,	loop_165
	fpsub16s	%f30,	%f6,	%f16
	set	0x60, %i1
	stxa	%g6,	[%l7 + %i1] 0xeb
	membar	#Sync
loop_165:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%g5
	st	%fsr,	[%l7 + 0x24]
	set	0x70, %o7
	ldda	[%l7 + %o7] 0xe2,	%o2
	set	0x78, %l4
	stda	%g2,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x74, %l6
	stw	%o4,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x38]
	set	0x24, %o6
	sta	%f9,	[%l7 + %o6] 0x88
	nop
	set	0x1C, %l5
	lduw	[%l7 + %l5],	%g7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%o3
	set	0x7C, %o1
	stha	%i2,	[%l7 + %o1] 0xe3
	membar	#Sync
	wr	%g3,	%l5,	%y
	and	%i0,	%i4,	%i6
	or	%l0,	%o5,	%o7
	nop
	set	0x59, %o4
	ldub	[%l7 + %o4],	%i3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f16
	nop
	set	0x18, %o0
	swap	[%l7 + %o0],	%o0
	ld	[%l7 + 0x50],	%f31
	nop
	set	0x30, %o5
	stx	%o6,	[%l7 + %o5]
	and	%i7,	%l2,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l4
	nop
	set	0x67, %g2
	stb	%g1,	[%l7 + %g2]
	set	0x38, %g7
	stxa	%l3,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x10, %i5
	stxa	%i1,	[%l7 + %i5] 0x88
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f0
	nop
	set	0x38, %g3
	stw	%g6,	[%l7 + %g3]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%g4
	nop
	nop
	setx	0x048B610D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x8D281C9D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f21,	%f26
	and	%o4,	%g7,	%o1
	set	0x08, %l0
	stxa	%o3,	[%l7 + %l0] 0x88
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f10
	st	%fsr,	[%l7 + 0x1C]
	and	%g2,	%i2,	%l5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f16
	set	0x30, %o2
	stda	%g2,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f16
	nop
	nop
	setx	0x4F8A8308,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x15347F23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f2,	%f9
	nop
	set	0x44, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
	add	%i4,	%i0,	%l0
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%o5
	nop
	set	0x46, %i2
	ldstub	[%l7 + %i2],	%i6
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf9,	%f0
	set	0x5C, %g4
	stba	%o7,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3E1, 	%sys_tick_cmpr
	nop
	set	0x10, %i6
	std	%o6,	[%l7 + %i6]
	nop
	set	0x70, %i0
	std	%f2,	[%l7 + %i0]
	nop
	set	0x50, %l1
	swap	[%l7 + %l1],	%l2
	nop
	set	0x56, %i1
	ldub	[%l7 + %i1],	%i7
	or	%i5,	%l4,	%l6
	nop
	set	0x60, %o7
	stx	%l3,	[%l7 + %o7]
	nop
	set	0x20, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%g1
	nop
	set	0x6C, %l5
	swap	[%l7 + %l5],	%g6
	set	0x44, %l6
	stwa	%l1,	[%l7 + %l6] 0x89
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xda
	nop
	set	0x4C, %o4
	ldsw	[%l7 + %o4],	%g5
	nop
	set	0x50, %i3
	ldsb	[%l7 + %i3],	%o2
	nop
	set	0x3A, %o5
	ldub	[%l7 + %o5],	%i1
	add	%g4,	%g7,	%o1
	set	0x12, %g2
	ldstuba	[%l7 + %g2] 0x81,	%o3
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%o4
	nop
	set	0x30, %o0
	std	%i2,	[%l7 + %o0]
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%l5
	set	0x2A, %g3
	stba	%g3,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x1A, %l0
	stb	%g2,	[%l7 + %l0]
	nop
	set	0x5F, %i7
	stb	%i0,	[%l7 + %i7]
	nop
	set	0x28, %l3
	std	%l0,	[%l7 + %l3]
	nop
	set	0x78, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x70, %o3
	swapa	[%l7 + %o3] 0x81,	%o5
	set	0x6A, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i4
	nop
	set	0x70, %o2
	ldsh	[%l7 + %o2],	%o7
	set	0x6C, %g6
	swapa	[%l7 + %g6] 0x80,	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%i6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	nop
	nop
	setx	0x043AFF12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x4C8A4D70,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f9,	%f25
	nop
	set	0x65, %i2
	ldstub	[%l7 + %i2],	%o6
	ld	[%l7 + 0x6C],	%f25
	ld	[%l7 + 0x70],	%f18
	set	0x6B, %g4
	stba	%i7,	[%l7 + %g4] 0x80
	nop
	set	0x34, %i6
	ldstub	[%l7 + %i6],	%l2
	wr	%i5,	%l4,	%ccr
	nop
	set	0x0E, %i0
	stb	%l3,	[%l7 + %i0]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%g6
	set	0x58, %l1
	sta	%f31,	[%l7 + %l1] 0x88
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	or	%l1,	%l6,	%o2
	set	0x4C, %o7
	stba	%g5,	[%l7 + %o7] 0x88
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f0
	st	%f8,	[%l7 + 0x40]
	fpadd32	%f18,	%f12,	%f22
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%i1
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%g7
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x80,	%o1
	nop
	set	0x7A, %o6
	ldsb	[%l7 + %o6],	%g4
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x80,	 3
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x89,	%o3
	nop
	set	0x49, %i3
	ldsb	[%l7 + %i3],	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%g3
	nop
	set	0x30, %o5
	stx	%g2,	[%l7 + %o5]
	set	0x60, %g2
	stha	%l0,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x44, %g7
	stwa	%o5,	[%l7 + %g7] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	set	0x74, %g1
	stwa	%i0,	[%l7 + %g1] 0x88
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x89,	%o7
	nop
	set	0x6C, %l0
	ldsw	[%l7 + %l0],	%i4
	set	0x70, %i7
	stxa	%o0,	[%l7 + %i7] 0x89
	nop
	set	0x5C, %l3
	sth	%i6,	[%l7 + %l3]
	nop
	set	0x30, %i5
	std	%f22,	[%l7 + %i5]
	nop
	set	0x20, %o3
	lduw	[%l7 + %o3],	%o6
	set	0x7C, %g3
	stwa	%i7,	[%l7 + %g3] 0x80
	ld	[%l7 + 0x70],	%f12
	set	0x10, %g5
	stxa	%i3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x18, %o2
	stba	%l2,	[%l7 + %o2] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f0
	set	0x5C, %i2
	swapa	[%l7 + %i2] 0x80,	%l4
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l3
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x89,	%g1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x81,	%i5
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%g6
	nop
	set	0x70, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x60, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0
	set	0x22, %i1
	stha	%l6,	[%l7 + %i1] 0x89
	or	%o2,	%i1,	%g5
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x80,	%o0
	nop
	set	0x18, %l4
	ldx	[%l7 + %l4],	%g7
	nop
	set	0x08, %o6
	stx	%g4,	[%l7 + %o6]
	nop
	set	0x0C, %l6
	ldsb	[%l7 + %l6],	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%o4
	set	0x18, %o1
	stda	%i2,	[%l7 + %o1] 0x80
	set	0x38, %i3
	swapa	[%l7 + %i3] 0x81,	%g2
	nop
	set	0x32, %o5
	stb	%g3,	[%l7 + %o5]
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%o5
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	and	%l0,	%i0,	%i4
	nop
	set	0x60, %g1
	std	%f22,	[%l7 + %g1]
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%o0
	st	%f31,	[%l7 + 0x74]
	nop
	set	0x0A, %o0
	sth	%o7,	[%l7 + %o0]
	nop
	set	0x40, %i7
	std	%o6,	[%l7 + %i7]
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x88,	 4
	nop
	set	0x68, %l0
	stw	%i3,	[%l7 + %l0]
	set	0x36, %o3
	stha	%l2,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x80,	 4
	set	0x54, %g5
	swapa	[%l7 + %g5] 0x81,	%i7
	nop
	set	0x76, %g3
	ldstub	[%l7 + %g3],	%g1
	nop
	set	0x11, %g6
	ldsb	[%l7 + %g6],	%l3
	set	0x14, %i2
	stba	%i5,	[%l7 + %i2] 0x89
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x81,	%g6
	nop
	set	0x47, %i6
	ldstub	[%l7 + %i6],	%l1
	nop
	set	0x18, %g4
	lduh	[%l7 + %g4],	%l6
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x89,	%o2
	nop
	set	0x21, %l1
	stb	%g5,	[%l7 + %l1]
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x89,	 1
	set	0x12, %o7
	stha	%g7,	[%l7 + %o7] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	st	%f9,	[%l7 + 0x60]
	and	%o1,	%g4,	%l5
	nop
	set	0x30, %i4
	sth	%o4,	[%l7 + %i4]
	fpadd16	%f18,	%f22,	%f12
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xe3,	%o2
	fpadd16	%f22,	%f12,	%f2
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f16
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%g2
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%g2
	set	0x24, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o5
	nop
	set	0x70, %o1
	stx	%l0,	[%l7 + %o1]
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x18, %g2
	std	%i2,	[%l7 + %g2]
	and	%i0,	%i4,	%o0
	nop
	set	0x5F, %g7
	ldstub	[%l7 + %g7],	%o6
	fpadd32s	%f12,	%f27,	%f23
	and	%i6,	%o7,	%l2
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x81,	%i3
	nop
	set	0x68, %o4
	std	%l4,	[%l7 + %o4]
	set	0x74, %g1
	sta	%f28,	[%l7 + %g1] 0x81
	nop
	set	0x68, %i7
	std	%i6,	[%l7 + %i7]
	nop
	set	0x72, %o0
	ldsb	[%l7 + %o0],	%g1
	st	%f1,	[%l7 + 0x2C]
	nop
	set	0x18, %l3
	stx	%i5,	[%l7 + %l3]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%l1
	and	%l6,	%l3,	%o2
	set	0x68, %o3
	stda	%g4,	[%l7 + %o3] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%o1
	add	%g7,	%g4,	%o4
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	bl	%icc,	loop_166
	ld	[%l7 + 0x10],	%f22
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%l5
loop_166:
	nop
	set	0x70, %g5
	stda	%o4,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x60, %g6
	stha	%g3,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x24, %g3
	stwa	%i2,	[%l7 + %g3] 0xe2
	membar	#Sync
	or	%l0,	%i4,	%o0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f16
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%i0
	set	0x40, %o2
	lda	[%l7 + %o2] 0x89,	%f15
	set	0x38, %i6
	stxa	%i6,	[%l7 + %i6] 0x88
	nop
	set	0x38, %g4
	std	%f6,	[%l7 + %g4]
	add	%o7,	%l2,	%l4
	nop
	set	0x5F, %l2
	ldsb	[%l7 + %l2],	%i3
	nop
	set	0x4C, %i0
	ldsh	[%l7 + %i0],	%i7
	set	0x73, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i5
	nop
	set	0x6C, %o7
	ldsw	[%l7 + %o7],	%g1
	set	0x40, %i4
	ldxa	[%l7 + %i4] 0x81,	%g6
	nop
	set	0x68, %l4
	std	%i6,	[%l7 + %l4]
	wr	%l3,	%o2,	%softint
	set	0x48, %l5
	sta	%f8,	[%l7 + %l5] 0x89
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	set	0x45, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g5
	nop
	set	0x5C, %o1
	lduw	[%l7 + %o1],	%o1
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe3,	%g6
	nop
	set	0x3D, %o5
	ldstub	[%l7 + %o5],	%g4
	bg,a,pt	%xcc,	loop_167
	nop
	set	0x08, %g7
	std	%i0,	[%l7 + %g7]
	nop
	set	0x54, %i3
	stw	%o4,	[%l7 + %i3]
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x80,	%o3
loop_167:
	nop
	set	0x70, %g1
	sta	%f28,	[%l7 + %g1] 0x81
	nop
	set	0x40, %i7
	stx	%l5,	[%l7 + %i7]
	nop
	set	0x08, %o4
	std	%f28,	[%l7 + %o4]
	nop
	set	0x0C, %o0
	sth	%g2,	[%l7 + %o0]
	nop
	set	0x50, %o3
	swap	[%l7 + %o3],	%o5
	nop
	set	0x60, %l0
	ldsw	[%l7 + %l0],	%g3
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f22
	set	0x58, %l3
	stha	%i2,	[%l7 + %l3] 0x89
	nop
	set	0x5C, %g5
	lduh	[%l7 + %g5],	%i4
	set	0x28, %g3
	stwa	%o0,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x88,	%l0
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x80,	%o6
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%i6
	fpsub16	%f8,	%f6,	%f14
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f4
	and	%i0,	%l2,	%l4
	ld	[%l7 + 0x78],	%f11
	nop
	set	0x2C, %g4
	stw	%o7,	[%l7 + %g4]
	nop
	set	0x28, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x3C, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%i3
	set	0x08, %i4
	stda	%i4,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xe3,	%i6
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x88,	%g1
	set	0x38, %i1
	stha	%g6,	[%l7 + %i1] 0x89
	set	0x74, %l4
	stwa	%l3,	[%l7 + %l4] 0x89
	nop
	set	0x2F, %l6
	ldstub	[%l7 + %l6],	%l6
	set	0x52, %o1
	stba	%l1,	[%l7 + %o1] 0x81
	and	%g5,	%o2,	%g7
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f24
	set	0x50, %o6
	ldda	[%l7 + %o6] 0x81,	%o0
	or	%i1,	%o4,	%g4
	st	%f2,	[%l7 + 0x3C]
	set	0x3C, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o3
	nop
	set	0x14, %i3
	lduw	[%l7 + %i3],	%l5
	nop
	set	0x40, %g2
	lduh	[%l7 + %g2],	%g2
	nop
	set	0x40, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x3C, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%i2
	set	0x10, %o3
	stxa	%i4,	[%l7 + %o3] 0xeb
	membar	#Sync
	ld	[%l7 + 0x0C],	%f8
	or	%g3,	%o0,	%o6
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x80,	%l0
	st	%fsr,	[%l7 + 0x40]
	set	0x6B, %l0
	stba	%i6,	[%l7 + %l0] 0x88
	st	%fsr,	[%l7 + 0x18]
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x88,	%l2
	ld	[%l7 + 0x44],	%f25
	nop
	set	0x24, %g5
	ldsw	[%l7 + %g5],	%i0
	nop
	set	0x21, %i5
	stb	%o7,	[%l7 + %i5]
	nop
	set	0x44, %g3
	ldsw	[%l7 + %g3],	%l4
	ld	[%l7 + 0x70],	%f11
	nop
	set	0x38, %g6
	ldsb	[%l7 + %g6],	%i3
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%i6
	nop
	set	0x18, %i2
	stx	%i5,	[%l7 + %i2]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%l3
	nop
	set	0x44, %g4
	ldub	[%l7 + %g4],	%g6
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%i6
	set	0x14, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l1
	set	0x08, %o7
	stxa	%g5,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x4F, %i4
	stba	%o2,	[%l7 + %i4] 0x88
	nop
	set	0x58, %l1
	stx	%g7,	[%l7 + %l1]
	add	%o1,	%i1,	%o4
	nop
	set	0x20, %l5
	stb	%o3,	[%l7 + %l5]
	nop
	set	0x28, %l2
	stx	%l5,	[%l7 + %l2]
	set	0x44, %l4
	lda	[%l7 + %l4] 0x80,	%f30
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x80,	%g4
	nop
	set	0x54, %i1
	ldsw	[%l7 + %i1],	%g2
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%o4
	nop
	set	0x4E, %o6
	sth	%i2,	[%l7 + %o6]
	nop
	set	0x32, %g7
	ldsb	[%l7 + %g7],	%g3
	st	%fsr,	[%l7 + 0x68]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o6
	nop
	set	0x08, %o5
	swap	[%l7 + %o5],	%l0
	set	0x58, %i3
	stxa	%i6,	[%l7 + %i3] 0x88
	nop
	set	0x18, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%i0
	nop
	set	0x1C, %o4
	sth	%l4,	[%l7 + %o4]
	nop
	set	0x4C, %i7
	swap	[%l7 + %i7],	%o7
	nop
	set	0x58, %o0
	ldub	[%l7 + %o0],	%i7
	set	0x1B, %o3
	ldstuba	[%l7 + %o3] 0x80,	%i3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%i4
	set	0x44, %l0
	stha	%l3,	[%l7 + %l0] 0xe2
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%g6
	nop
	set	0x58, %g6
	stx	%l6,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x30, %i6
	std	%f18,	[%l7 + %i6]
	set	0x7C, %i2
	stha	%l1,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%g5
	nop
	set	0x50, %i0
	stx	%o2,	[%l7 + %i0]
	nop
	set	0x3E, %g3
	ldsb	[%l7 + %g3],	%o1
	nop
	set	0x60, %o7
	stw	%i1,	[%l7 + %o7]
	nop
	set	0x74, %l1
	swap	[%l7 + %l1],	%o4
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x81,	%o3
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%g7
	and	%g4,	%g2,	%l5
	st	%fsr,	[%l7 + 0x74]
	set	0x5A, %i4
	stha	%i2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x74, %l4
	lduh	[%l7 + %l4],	%g3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%o4
	st	%f2,	[%l7 + 0x64]
	nop
	set	0x6E, %i1
	ldsh	[%l7 + %i1],	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%i6
	fpadd16	%f0,	%f10,	%f10
	set	0x68, %o6
	stwa	%o0,	[%l7 + %o6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x30],	%f2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xca
	nop
	set	0x10, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x7C],	%f13
	set	0x58, %i3
	sta	%f12,	[%l7 + %i3] 0x89
	set	0x28, %g1
	lda	[%l7 + %g1] 0x80,	%f17
	set	0x78, %o4
	sta	%f29,	[%l7 + %o4] 0x81
	set	0x54, %g2
	stha	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	ld	[%l7 + 0x48],	%f9
	nop
	set	0x18, %i7
	stx	%l4,	[%l7 + %i7]
	set	0x5F, %o3
	ldstuba	[%l7 + %o3] 0x88,	%i0
	nop
	set	0x2A, %l3
	lduh	[%l7 + %l3],	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%i3
	nop
	set	0x20, %o0
	std	%l2,	[%l7 + %o0]
	set	0x70, %g5
	stxa	%i5,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x89,	%g1
	nop
	set	0x60, %g6
	ldsh	[%l7 + %g6],	%g6
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x89,	%l1
	nop
	set	0x2E, %i2
	ldsh	[%l7 + %i2],	%l6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	and	%g5,	%o1,	%i1
	set	0x30, %i6
	sta	%f4,	[%l7 + %i6] 0x80
	set	0x34, %o2
	stha	%o4,	[%l7 + %o2] 0x89
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%g7
	nop
	set	0x20, %i0
	std	%f10,	[%l7 + %i0]
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	st	%fsr,	[%l7 + 0x54]
	set	0x20, %l5
	lda	[%l7 + %l5] 0x88,	%f20
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 4
	ld	[%l7 + 0x74],	%f20
	nop
	set	0x19, %i4
	stb	%g4,	[%l7 + %i4]
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xca
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x30, %l6
	ldx	[%l7 + %l6],	%g2
	set	0x74, %o6
	swapa	[%l7 + %o6] 0x89,	%l5
	and	%g3,	%o5,	%i2
	nop
	nop
	setx	0x3DFA870AE1CDB1CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE220E5A610081062,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f14
	set	0x30, %g7
	ldxa	[%l7 + %g7] 0x80,	%l0
	set	0x40, %i1
	stxa	%i6,	[%l7 + %i1] 0x81
	nop
	set	0x28, %o1
	std	%o0,	[%l7 + %o1]
	nop
	set	0x40, %i3
	swap	[%l7 + %i3],	%l2
	add	%o6,	%i4,	%l4
	set	0x1A, %o5
	stha	%o7,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x78, %g1
	stda	%i0,	[%l7 + %g1] 0x80
	set	0x3C, %g2
	lda	[%l7 + %g2] 0x80,	%f21
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%i2
	or	%i5,	%g1,	%g6
	add	%l3,	%l1,	%g5
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x80,	%o1
	bgu,pn	%icc,	loop_168
	wr 	%g0, 	0x5, 	%fprs
	set	0x18, %o0
	swapa	[%l7 + %o0] 0x81,	%o3
loop_168:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g7
	set	0x0C, %g5
	sta	%f0,	[%l7 + %g5] 0x81
	wr	%g4,	%g2,	%set_softint
	nop
	nop
	setx	0x6D3108FA9B5F5F7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x10659A85DE67FDAB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f6
	nop
	set	0x28, %i5
	stx	%l5,	[%l7 + %i5]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	nop
	set	0x3C, %l0
	ldsh	[%l7 + %l0],	%o2
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x88,	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%l0
	or	%g3,	%i6,	%l2
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%o6
	nop
	set	0x0F, %i7
	ldub	[%l7 + %i7],	%o0
	nop
	set	0x48, %o2
	std	%f22,	[%l7 + %o2]
	nop
	set	0x68, %g3
	ldstub	[%l7 + %g3],	%i4
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f16
	and	%l4,	%o7,	%i0
	ba,pn	%icc,	loop_169
	nop
	set	0x74, %l1
	sth	%i7,	[%l7 + %l1]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc0
loop_169:
	nop
	set	0x2B, %l5
	ldstub	[%l7 + %l5],	%i5
	nop
	set	0x60, %o7
	ldstub	[%l7 + %o7],	%i3
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc0
	add	%g6,	%l3,	%g1
	nop
	set	0x78, %l2
	ldsw	[%l7 + %l2],	%l1
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x88,	 0
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x89,	%i1
	set	0x1F, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o1
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%i6
	set	0x20, %o1
	lda	[%l7 + %o1] 0x88,	%f3
	nop
	set	0x40, %i3
	sth	%o3,	[%l7 + %i3]
	set	0x3C, %o5
	swapa	[%l7 + %o5] 0x81,	%g7
	set	0x35, %g1
	stba	%o4,	[%l7 + %g1] 0xe3
	membar	#Sync
	and	%g2,	%l5,	%o2
	nop
	set	0x50, %i1
	stx	%o5,	[%l7 + %i1]
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%g4
	nop
	set	0x30, %o3
	stx	%l0,	[%l7 + %o3]
	nop
	set	0x40, %l3
	sth	%i2,	[%l7 + %l3]
	set	0x20, %o0
	stda	%i6,	[%l7 + %o0] 0x88
	nop
	set	0x7E, %g2
	ldsh	[%l7 + %g2],	%g3
	nop
	set	0x1C, %g5
	ldsb	[%l7 + %g5],	%l2
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x88,	%o0
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f28
	nop
	set	0x58, %i2
	std	%f22,	[%l7 + %i2]
	set	0x38, %g6
	stxa	%o6,	[%l7 + %g6] 0x80
	set	0x70, %g4
	lda	[%l7 + %g4] 0x80,	%f17
	nop
	set	0x20, %o2
	std	%f26,	[%l7 + %o2]
	nop
	set	0x5A, %g3
	ldsb	[%l7 + %g3],	%l4
	nop
	set	0x6C, %i7
	ldsw	[%l7 + %i7],	%i4
	nop
	set	0x30, %l1
	std	%i0,	[%l7 + %l1]
	nop
	set	0x6E, %i0
	lduh	[%l7 + %i0],	%i7
	nop
	set	0x52, %l5
	ldsb	[%l7 + %l5],	%i5
	nop
	set	0x56, %o7
	sth	%o7,	[%l7 + %o7]
	be,a,pn	%xcc,	loop_170
	st	%f2,	[%l7 + 0x18]
	nop
	set	0x0E, %i6
	sth	%i3,	[%l7 + %i6]
	nop
	set	0x58, %l2
	swap	[%l7 + %l2],	%l3
loop_170:
	nop
	set	0x1C, %l4
	stha	%g6,	[%l7 + %l4] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%g1
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x22, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o1
	set	0x78, %i4
	stda	%i6,	[%l7 + %i4] 0x81
	wr	%i1,	%o3,	%pic
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf8
	membar	#Sync
	set	0x70, %i3
	stda	%g6,	[%l7 + %i3] 0x80
	ld	[%l7 + 0x5C],	%f20
	and	%g2,	%l5,	%o2
	nop
	set	0x2D, %o5
	ldub	[%l7 + %o5],	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%l0
	nop
	set	0x55, %g1
	stb	%i2,	[%l7 + %g1]
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%i6
	st	%f8,	[%l7 + 0x48]
	wr	%g4,	%g3,	%clear_softint
	nop
	set	0x38, %o6
	ldsw	[%l7 + %o6],	%o0
	nop
	set	0x47, %o4
	ldsb	[%l7 + %o4],	%o6
	set	0x40, %o3
	stwa	%l2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x48, %o0
	ldx	[%l7 + %o0],	%i4
	set	0x47, %g2
	stba	%l4,	[%l7 + %g2] 0x81
	nop
	set	0x1E, %l3
	ldub	[%l7 + %l3],	%i7
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%i5
	nop
	set	0x1C, %l0
	prefetch	[%l7 + %l0],	 4
	st	%f28,	[%l7 + 0x08]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i3
	set	0x48, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l3
	add	%i0,	%l1,	%g6
	nop
	set	0x3B, %i5
	ldstub	[%l7 + %i5],	%g1
	or	%o1,	%l6,	%i1
	nop
	set	0x48, %g6
	std	%f8,	[%l7 + %g6]
	set	0x10, %g4
	swapa	[%l7 + %g4] 0x80,	%o3
	nop
	set	0x68, %g3
	std	%f8,	[%l7 + %g3]
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x80,	%g7
	bl	%icc,	loop_171
	nop
	set	0x68, %l1
	sth	%g2,	[%l7 + %l1]
	nop
	set	0x28, %i7
	ldsh	[%l7 + %i7],	%g5
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%l4
loop_171:
	fpadd16s	%f3,	%f7,	%f21
	nop
	set	0x7E, %i0
	stb	%o2,	[%l7 + %i0]
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%o4
	st	%fsr,	[%l7 + 0x24]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%o4
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x20, %l6
	stda	%l0,	[%l7 + %l6] 0x89
	add	%i6,	%i2,	%g3
	st	%fsr,	[%l7 + 0x78]
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	set	0x4D, %g7
	stba	%o0,	[%l7 + %g7] 0x81
	and	%o6,	%l2,	%i4
	nop
	set	0x2C, %i4
	ldstub	[%l7 + %i4],	%l4
	ld	[%l7 + 0x20],	%f10
	nop
	set	0x58, %o1
	ldsh	[%l7 + %o1],	%i7
	nop
	set	0x50, %i3
	lduh	[%l7 + %i3],	%g4
	set	0x49, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o7
	nop
	set	0x78, %o5
	ldsh	[%l7 + %o5],	%i3
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x88,	%i5
	nop
	set	0x24, %o4
	prefetch	[%l7 + %o4],	 2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l1
	nop
	set	0x62, %o3
	ldsh	[%l7 + %o3],	%l3
	st	%f2,	[%l7 + 0x0C]
	nop
	set	0x50, %o0
	swap	[%l7 + %o0],	%g1
	nop
	set	0x58, %o6
	std	%o0,	[%l7 + %o6]
	fpadd16s	%f5,	%f16,	%f8
	nop
	set	0x48, %g2
	std	%g6,	[%l7 + %g2]
	set	0x20, %g5
	stda	%i6,	[%l7 + %g5] 0x89
	bge,a,pn	%xcc,	loop_172
	nop
	set	0x27, %l3
	ldub	[%l7 + %l3],	%i1
	set	0x50, %i2
	sta	%f10,	[%l7 + %i2] 0x88
loop_172:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc4
	ld	[%l7 + 0x5C],	%f13
	nop
	set	0x60, %g6
	std	%g6,	[%l7 + %g6]
	nop
	set	0x76, %g4
	ldub	[%l7 + %g4],	%g2
	add	%o3,	%l5,	%g5
	set	0x20, %i5
	sta	%f9,	[%l7 + %i5] 0x81
	set	0x18, %g3
	stda	%o2,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x64, %l1
	ldsh	[%l7 + %l1],	%o5
	nop
	set	0x50, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x7A, %i7
	ldsh	[%l7 + %i7],	%i6
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf9
	membar	#Sync
	set	0x18, %i6
	sta	%f21,	[%l7 + %i6] 0x81
	or	%i2,	%g3,	%l0
	set	0x14, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o6
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%o0
	nop
	set	0x67, %l4
	ldsb	[%l7 + %l4],	%i4
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	bleu,a,pt	%icc,	loop_173
	fpadd16s	%f0,	%f13,	%f21
	set	0x27, %i4
	stba	%l4,	[%l7 + %i4] 0x88
loop_173:
	nop
	set	0x20, %o1
	ldsw	[%l7 + %o1],	%i7
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f0
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	fpsub32s	%f30,	%f16,	%f3
	nop
	set	0x52, %o5
	stb	%l2,	[%l7 + %o5]
	set	0x36, %i1
	stha	%o7,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x88,	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%l1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f16
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
	nop
	set	0x5F, %g1
	ldsb	[%l7 + %g1],	%l3
	set	0x78, %g2
	sta	%f18,	[%l7 + %g2] 0x89
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x89,	%g1
	ld	[%l7 + 0x20],	%f3
	add	%o1,	%g6,	%l6
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x89,	%i3
	set	0x5A, %l0
	stha	%g7,	[%l7 + %l0] 0xe3
	membar	#Sync
	bg,a,pt	%xcc,	loop_174
	nop
	set	0x4A, %i2
	ldsb	[%l7 + %i2],	%g2
	wr	%i1,	%l5,	%ccr
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%g5
loop_174:
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x2E, %i5
	stb	%o5,	[%l7 + %i5]
	and	%o4,	%i6,	%i2
	set	0x68, %g6
	stha	%g3,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x6C, %l1
	sta	%f14,	[%l7 + %l1] 0x80
	set	0x34, %o2
	stha	%o6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x4C, %g3
	swapa	[%l7 + %g3] 0x80,	%l0
	ld	[%l7 + 0x54],	%f18
	set	0x2F, %i7
	stba	%i4,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x6A, %l5
	ldsh	[%l7 + %l5],	%l4
	nop
	set	0x44, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	nop
	setx	0x64B52DAE2F6F71B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF18DAFA0B9B02FCB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f24,	%f4
	nop
	set	0x38, %l2
	std	%f8,	[%l7 + %l2]
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%i6
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf8
	membar	#Sync
	set	0x2A, %i4
	stba	%g4,	[%l7 + %i4] 0x81
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f22
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x88,	%l2
	nop
	set	0x70, %i6
	std	%o0,	[%l7 + %i6]
	st	%f17,	[%l7 + 0x74]
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i4
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f20
	add	%i0,	%o7,	%l3
	nop
	set	0x3C, %o4
	ldsb	[%l7 + %o4],	%l1
	st	%f18,	[%l7 + 0x70]
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x88,	%g0
	nop
	set	0x72, %o5
	ldsh	[%l7 + %o5],	%o1
	nop
	set	0x7C, %g1
	ldsw	[%l7 + %g1],	%l6
	set	0x64, %o0
	swapa	[%l7 + %o0] 0x80,	%i3
	nop
	set	0x62, %o6
	ldsb	[%l7 + %o6],	%g6
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x89,	%g7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%l5
	and	%g2,	%g5,	%o2
	nop
	set	0x10, %l3
	swap	[%l7 + %l3],	%o3
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x89,	%o4
	nop
	set	0x5C, %l0
	lduw	[%l7 + %l0],	%o5
	or	%i2,	%g3,	%i6
	nop
	set	0x50, %i2
	lduw	[%l7 + %i2],	%o6
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x30, %g6
	stxa	%i4,	[%l7 + %g6] 0xe3
	membar	#Sync
	or	%l0,	%i7,	%g4
	set	0x60, %g4
	stha	%l4,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x50, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l2
	add	%o0,	%i5,	%o7
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%l3
	nop
	set	0x4E, %i7
	lduh	[%l7 + %i7],	%i0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf8
	membar	#Sync
	wr	%l1,	%o1,	%ccr
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i3
	nop
	set	0x46, %l5
	ldsb	[%l7 + %l5],	%g6
	add	%g1,	%g7,	%l5
	set	0x74, %l2
	lda	[%l7 + %l2] 0x88,	%f24
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	wr	%g2,	%g5,	%y
	fpadd32s	%f15,	%f14,	%f19
	set	0x0C, %o7
	stwa	%i1,	[%l7 + %o7] 0x88
	set	0x54, %l6
	stwa	%o2,	[%l7 + %l6] 0x80
	fpsub32s	%f9,	%f5,	%f2
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x88,	 1
	set	0x74, %g7
	stba	%o5,	[%l7 + %g7] 0x88
	nop
	set	0x0C, %i4
	ldsw	[%l7 + %i4],	%o3
	add	%g3,	%i2,	%i6
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%i4
	nop
	set	0x64, %i3
	ldsw	[%l7 + %i3],	%o6
	nop
	set	0x30, %i1
	stw	%i7,	[%l7 + %i1]
	nop
	set	0x1C, %o3
	lduh	[%l7 + %o3],	%g4
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	set	0x50, %o5
	stda	%l2,	[%l7 + %o5] 0xe2
	membar	#Sync
	wr	%o0,	%i5,	%ccr
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf9
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	ld	[%l7 + 0x28],	%f29
	nop
	set	0x6C, %o6
	stw	%l0,	[%l7 + %o6]
	nop
	set	0x28, %g2
	std	%f16,	[%l7 + %g2]
	nop
	set	0x30, %l3
	ldub	[%l7 + %l3],	%o7
	nop
	set	0x60, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x2A, %l0
	sth	%i0,	[%l7 + %l0]
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x81,	%l2
	nop
	set	0x2B, %g5
	ldub	[%l7 + %g5],	%o1
	ld	[%l7 + 0x5C],	%f12
	set	0x24, %g6
	lda	[%l7 + %g6] 0x81,	%f19
	set	0x10, %g4
	stda	%i6,	[%l7 + %g4] 0x80
	nop
	nop
	setx	0x0848B940,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xD89E24EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f28,	%f9
	or	%l1,	%g6,	%i3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g7
	set	0x48, %o2
	lda	[%l7 + %o2] 0x81,	%f12
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x81,	%l5
	nop
	set	0x41, %i5
	ldub	[%l7 + %i5],	%g5
	nop
	set	0x48, %i7
	stw	%g2,	[%l7 + %i7]
	set	0x38, %l1
	stda	%i0,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f12
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x88,	%o4
	nop
	set	0x28, %l2
	ldsb	[%l7 + %l2],	%o2
	set	0x2E, %l4
	stha	%o3,	[%l7 + %l4] 0x81
	st	%f22,	[%l7 + 0x3C]
	nop
	set	0x60, %l6
	ldub	[%l7 + %l6],	%g3
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xe3,	%i2
	nop
	set	0x64, %g7
	prefetch	[%l7 + %g7],	 4
	and	%i6,	%i4,	%o5
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%i7
	st	%f4,	[%l7 + 0x0C]
	nop
	set	0x48, %i6
	swap	[%l7 + %i6],	%g4
	nop
	set	0x22, %i4
	ldsh	[%l7 + %i4],	%l4
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x80,	%l2
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x81,	%o0
	set	0x24, %o4
	lda	[%l7 + %o4] 0x88,	%f5
	bl,pn	%xcc,	loop_175
	st	%fsr,	[%l7 + 0x18]
	bge,a	%icc,	loop_176
	or	%i5,	%l0,	%o7
loop_175:
	nop
	set	0x6C, %o5
	stw	%i0,	[%l7 + %o5]
	fpsub32	%f26,	%f0,	%f2
loop_176:
	nop
	set	0x40, %o3
	stw	%o1,	[%l7 + %o3]
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%l6
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x89,	 4
	nop
	set	0x1C, %l3
	stw	%l3,	[%l7 + %l3]
	nop
	set	0x6C, %g1
	lduw	[%l7 + %g1],	%g6
	nop
	set	0x20, %o6
	std	%f20,	[%l7 + %o6]
	set	0x40, %i2
	stda	%g0,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f10
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x81,	%i3
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x80,	%g7
	nop
	set	0x7E, %o2
	ldsh	[%l7 + %o2],	%g5
	set	0x54, %g3
	swapa	[%l7 + %g3] 0x88,	%l5
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x88,	%g2
	nop
	set	0x70, %i7
	swap	[%l7 + %i7],	%o4
	or	%o2,	%o3,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%i2
	and	%i6,	%o5,	%o6
	nop
	set	0x0C, %l1
	ldstub	[%l7 + %l1],	%i7
	set	0x64, %l0
	stwa	%i4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f0
	set	0x44, %l2
	sta	%f14,	[%l7 + %l2] 0x89
	nop
	nop
	setx	0xF8E7033A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x24C81FA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f31,	%f11
	and	%g4,	%l2,	%l4
	nop
	set	0x48, %l4
	stw	%o0,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x10]
	set	0x15, %l5
	stba	%l0,	[%l7 + %l5] 0x80
	and	%o7,	%i0,	%i5
	set	0x79, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l6
	nop
	set	0x0E, %g7
	ldsh	[%l7 + %g7],	%l1
	set	0x08, %o1
	stba	%l3,	[%l7 + %o1] 0x89
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x89,	%o1
	set	0x38, %o7
	stda	%g6,	[%l7 + %o7] 0x89
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%g1
	nop
	set	0x20, %i1
	prefetch	[%l7 + %i1],	 3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%l5
	add	%g5,	%g2,	%o2
	nop
	set	0x30, %i3
	ldub	[%l7 + %i3],	%o4
	and	%o3,	%g3,	%i1
	ld	[%l7 + 0x74],	%f30
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x80,	%f26
	nop
	set	0x0C, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x60, %o0
	std	%i2,	[%l7 + %o0]
	nop
	set	0x50, %g2
	std	%o4,	[%l7 + %g2]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xcc
	or	%o6,	%i6,	%i7
	add	%i4,	%g4,	%l4
	nop
	set	0x40, %l3
	std	%f10,	[%l7 + %l3]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x88
	nop
	set	0x14, %i2
	lduh	[%l7 + %i2],	%l2
	nop
	set	0x76, %o6
	ldub	[%l7 + %o6],	%l0
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	add	%i0,	%i5,	%o7
	nop
	set	0x23, %g5
	stb	%l1,	[%l7 + %g5]
	nop
	set	0x5C, %o2
	stw	%l3,	[%l7 + %o2]
	set	0x7D, %g4
	stba	%l6,	[%l7 + %g4] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f16
	set	0x38, %g3
	lda	[%l7 + %g3] 0x80,	%f25
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f4
	nop
	set	0x10, %l0
	std	%f10,	[%l7 + %l0]
	add	%o1,	%i3,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%l5
	nop
	set	0x08, %i0
	std	%g4,	[%l7 + %i0]
	bn,a,pt	%xcc,	loop_177
	fpadd32s	%f7,	%f12,	%f2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xcc
loop_177:
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%g7
	nop
	set	0x14, %l4
	lduw	[%l7 + %l4],	%o2
	nop
	set	0x27, %l6
	ldsb	[%l7 + %l6],	%o4
	nop
	set	0x50, %g7
	swap	[%l7 + %g7],	%o3
	fpsub32	%f24,	%f8,	%f14
	nop
	set	0x78, %l5
	std	%g2,	[%l7 + %l5]
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x24, %o1
	ldub	[%l7 + %o1],	%i2
	nop
	set	0x30, %o7
	ldsh	[%l7 + %o7],	%o5
	set	0x44, %i1
	lda	[%l7 + %i1] 0x81,	%f6
	nop
	set	0x65, %i4
	stb	%g2,	[%l7 + %i4]
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f0
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x20, %o0
	prefetch	[%l7 + %o0],	 4
	fpsub32s	%f25,	%f30,	%f9
	ba	%xcc,	loop_178
	nop
	set	0x66, %o3
	ldub	[%l7 + %o3],	%o6
	be	%icc,	loop_179
	nop
	set	0x3F, %o5
	stb	%i7,	[%l7 + %o5]
loop_178:
	or	%i4,	%i6,	%l4
	nop
	set	0x44, %l3
	sth	%g4,	[%l7 + %l3]
loop_179:
	nop
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x89,	%l2
	add	%o0,	%i0,	%i5
	nop
	set	0x58, %g1
	stx	%l0,	[%l7 + %g1]
	nop
	set	0x40, %i2
	stx	%o7,	[%l7 + %i2]
	set	0x10, %g6
	stha	%l3,	[%l7 + %g6] 0x80
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l1
	nop
	set	0x19, %g5
	stb	%i3,	[%l7 + %g5]
	set	0x1B, %o6
	stba	%g6,	[%l7 + %o6] 0x81
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x3A, %i5
	stba	%o1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x5C, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x38, %g3
	std	%g0,	[%l7 + %g3]
	nop
	set	0x22, %l0
	sth	%g5,	[%l7 + %l0]
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x89,	%g7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	set	0x18, %i7
	stxa	%o2,	[%l7 + %i7] 0x81
	fpsub16s	%f25,	%f8,	%f8
	set	0x20, %l4
	stda	%l4,	[%l7 + %l4] 0x89
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o3
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x88,	%g3
	nop
	set	0x33, %l5
	ldstub	[%l7 + %l5],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%i2
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x70, %o1
	ldstub	[%l7 + %o1],	%g2
	st	%fsr,	[%l7 + 0x5C]
	and	%o6,	%o5,	%i4
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	and	%i6,	%l4,	%g4
	set	0x68, %i1
	sta	%f21,	[%l7 + %i1] 0x80
	nop
	set	0x3C, %i4
	lduw	[%l7 + %i4],	%l2
	nop
	set	0x20, %i3
	ldsw	[%l7 + %i3],	%i7
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0
	nop
	set	0x7F, %o0
	ldsb	[%l7 + %o0],	%i5
	set	0x28, %o3
	sta	%f20,	[%l7 + %o3] 0x88
	set	0x64, %o5
	stha	%i0,	[%l7 + %o5] 0x81
	wr	%o7,	%l0,	%clear_softint
	nop
	set	0x40, %g7
	swap	[%l7 + %g7],	%l6
	nop
	set	0x66, %l3
	stb	%l3,	[%l7 + %l3]
	nop
	set	0x28, %g1
	std	%i2,	[%l7 + %g1]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f0
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o1
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 0
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf1,	%f0
	nop
	set	0x38, %g4
	std	%f8,	[%l7 + %g4]
	and	%g1,	%g5,	%l1
	or	%g7,	%l5,	%o2
	nop
	set	0x10, %i5
	stw	%g3,	[%l7 + %i5]
	and	%o3,	%i1,	%i2
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	nop
	set	0x79, %i2
	ldub	[%l7 + %i2],	%o4
	set	0x30, %l0
	stwa	%o6,	[%l7 + %l0] 0x81
	set	0x68, %g3
	stha	%o5,	[%l7 + %g3] 0x81
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x80,	%i6
	st	%fsr,	[%l7 + 0x6C]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%f16
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
	set	0x38, %i0
	stha	%l4,	[%l7 + %i0] 0x88
	set	0x39, %l2
	ldstuba	[%l7 + %l2] 0x88,	%g4
	nop
	set	0x78, %l5
	lduw	[%l7 + %l5],	%l2
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x80,	%o0
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x38, %o1
	stx	%i5,	[%l7 + %o1]
	or	%i7,	%o7,	%i0
	wr	%l6,	%l0,	%clear_softint
	nop
	set	0x53, %o7
	ldub	[%l7 + %o7],	%l3
	nop
	set	0x10, %i1
	std	%g6,	[%l7 + %i1]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%i3
	set	0x38, %i4
	stxa	%g1,	[%l7 + %i4] 0x89
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f28
	nop
	set	0x6A, %i3
	sth	%l1,	[%l7 + %i3]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
	nop
	set	0x38, %o0
	stx	%g5,	[%l7 + %o0]
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x88,	 4
	set	0x48, %l3
	stxa	%o2,	[%l7 + %l3] 0x81
	and	%l5,	%g3,	%i1
	set	0x79, %o5
	stba	%o3,	[%l7 + %o5] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%o4
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%i2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	nop
	set	0x71, %g2
	ldstub	[%l7 + %g2],	%i4
	nop
	set	0x32, %o6
	sth	%i6,	[%l7 + %o6]
	set	0x48, %g4
	stba	%l4,	[%l7 + %g4] 0x88
	nop
	set	0x38, %i5
	ldx	[%l7 + %i5],	%l2
	nop
	set	0x68, %o2
	std	%o0,	[%l7 + %o2]
	nop
	set	0x58, %i2
	stx	%i5,	[%l7 + %i2]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf0
	membar	#Sync
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f0
	nop
	set	0x6E, %l1
	ldsh	[%l7 + %l1],	%g4
	set	0x18, %g3
	stda	%i6,	[%l7 + %g3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x2C],	%f0
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%i0
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%o7
	nop
	set	0x60, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x40, %l2
	ldsb	[%l7 + %l2],	%l6
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x88,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%g1
	set	0x6B, %i6
	stba	%i3,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x34, %l6
	ldub	[%l7 + %l6],	%l1
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%g4
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x89,	%f24
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x89,	%o2
	and	%g7,	%g3,	%l5
	set	0x52, %o7
	stha	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	bgu	%icc,	loop_180
	or	%o3,	%o4,	%g2
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x50]
loop_180:
	nop
	set	0x11, %o3
	stb	%o5,	[%l7 + %o3]
	or	%i2,	%o6,	%i6
	set	0x0D, %o0
	stba	%i4,	[%l7 + %o0] 0xeb
	membar	#Sync
	wr	%l2,	%o0,	%pic
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f0
	ld	[%l7 + 0x38],	%f7
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x81,	%l4
	nop
	nop
	setx	0x342F24B4CE3703A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x8D804AF23EA485D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f24
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i5
	or	%i7,	%i0,	%o7
	nop
	set	0x3C, %o5
	lduh	[%l7 + %o5],	%l6
	wr	%l0,	%l3,	%set_softint
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	set	0x14, %g6
	stha	%o1,	[%l7 + %g6] 0x88
	nop
	set	0x70, %g1
	std	%f4,	[%l7 + %g1]
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f28
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1236
!	Type a   	: 24
!	Type cti   	: 29
!	Type x   	: 553
!	Type f   	: 38
!	Type i   	: 120
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
.word 0x434A2CED
.word 0xD8DE3F61
.word 0x6F9C6238
.word 0x407A28BF
.word 0x67BCD522
.word 0xCC7A23E9
.word 0xA55437B9
.word 0x41BCB45A
.word 0xC0DCDAED
.word 0xC5C35531
.word 0xE1F5CE42
.word 0x7D90E5BF
.word 0xC76D79D4
.word 0x2B164256
.word 0xD7449850
.word 0xA7EC2D9D
.word 0x69912F02
.word 0x4CF99CE1
.word 0x6EC5CB11
.word 0xDD071929
.word 0x1F85C3AE
.word 0xFBBC04E8
.word 0x7BC09BAF
.word 0xA9E44118
.word 0xCF558A67
.word 0x2D211502
.word 0x0C9F0AC4
.word 0x07D97AC0
.word 0xAA7C3CF3
.word 0xDAFE1651
.word 0x6DEBDA9B
.word 0xC4C8DAA5
.word 0xCDADDFFC
.word 0x91E2B1EE
.word 0x563C1EB4
.word 0x8CE061A0
.word 0xCF1E4B6A
.word 0x13ED76CF
.word 0x053E9285
.word 0x03D900DB
.word 0xA2D86ED6
.word 0xCABE8A76
.word 0xF7CEAA5E
.word 0x9B174FBD
.word 0x380A76F0
.word 0xD61112F8
.word 0xC095CEA2
.word 0xC78AA5A0
.word 0xF7C4C44A
.word 0x74165307
.word 0x64922CF3
.word 0x060D07C9
.word 0x3DC8B588
.word 0x7A18B992
.word 0x975F668F
.word 0x883ABF3A
.word 0x00B3F9DD
.word 0x0DE4B6C7
.word 0x60839738
.word 0x2553A35A
.word 0x00CF2726
.word 0xD09F9A80
.word 0x139ECD08
.word 0x2423E04F
!! thread 1 data, 64 words.
.word 0xF57A3AD2
.word 0x01BE7053
.word 0x55153770
.word 0xF3A9DC79
.word 0xA22F5B85
.word 0xA8E24487
.word 0xDE39D407
.word 0xE8AEFC45
.word 0x6DA46667
.word 0xB7D9C630
.word 0x4B8109D3
.word 0x7F306DAD
.word 0xD2A89D71
.word 0x0758508F
.word 0xE697E973
.word 0x7F726B3C
.word 0xB1E31C04
.word 0x913E41F2
.word 0xC1EA3079
.word 0x3FDE08E6
.word 0x7158CE8F
.word 0xE6329515
.word 0xC5CADB78
.word 0x374097FE
.word 0xD1ACA72E
.word 0x6B8B1B1C
.word 0x64713A3C
.word 0x4609F4B6
.word 0x2C492031
.word 0xD48DD5C2
.word 0x6C93F014
.word 0xCA280862
.word 0x40DD196C
.word 0xB8AEE19B
.word 0xFE01F448
.word 0x66C2DDF9
.word 0x06AE6566
.word 0x5AB36E79
.word 0x92FB0825
.word 0xC171A759
.word 0xEEC16917
.word 0x33B475DB
.word 0xB856C6FD
.word 0x9850D9F1
.word 0x516DDB78
.word 0xB4A97323
.word 0xBF89A279
.word 0xF0BA5E25
.word 0x2CE3A42A
.word 0xD16C4FA2
.word 0xFDC112E9
.word 0x9510F3D6
.word 0x044B1676
.word 0x36142855
.word 0x1316E065
.word 0x31EA20EC
.word 0x59772F2B
.word 0xBA8B767E
.word 0x0255A761
.word 0x976BEF4E
.word 0x7EEA3F8A
.word 0x84FD9359
.word 0x55CE2911
.word 0x93909933
!! thread 2 data, 64 words.
.word 0x1652A021
.word 0xE2A36197
.word 0x25B4408A
.word 0x95D52772
.word 0x8A6F0420
.word 0xCB1D2A45
.word 0x08FFB621
.word 0x8BD68F61
.word 0xE2AD0E9D
.word 0x2DED3774
.word 0x01CAFF62
.word 0xD1E1A103
.word 0xFD62747F
.word 0x07C1680C
.word 0x809D2FFD
.word 0x7A411AF0
.word 0x332CAA19
.word 0x0DE19806
.word 0x15D9027A
.word 0xD1EE845E
.word 0xA538A174
.word 0xCE5F323D
.word 0x3ECE8D40
.word 0xD2CA7764
.word 0xA10E1059
.word 0x0B0C3E55
.word 0x90CDAB1A
.word 0xF8F942C0
.word 0x11A60972
.word 0xF86198EC
.word 0xFAAEA4BE
.word 0xB5042290
.word 0x7E3B3666
.word 0xD8A459CC
.word 0xC8E6AE7C
.word 0xE480A8BC
.word 0x8F7ED519
.word 0x22DB83E9
.word 0xE3314E45
.word 0x72729F64
.word 0x09B3BE7B
.word 0x4CB58107
.word 0x71E1D7B0
.word 0x84B50DF9
.word 0x09E084C8
.word 0x3B165AB1
.word 0xCDF28B0D
.word 0x9F3CDED9
.word 0xA4B94E9C
.word 0xEE0592E3
.word 0x9E5C52EA
.word 0x8738B172
.word 0xA9EE0071
.word 0xDF469EE4
.word 0x1932FAB1
.word 0xB8CDE6EA
.word 0xC682E37F
.word 0xB6FDBD83
.word 0x0C1A7FDB
.word 0x29321F4B
.word 0xE659FBBF
.word 0xF2B1CC22
.word 0x1757DE9B
.word 0x362CD68A
!! thread 3 data, 64 words.
.word 0x016433D7
.word 0x333A344E
.word 0x26629CFB
.word 0xD98B3C47
.word 0x45545132
.word 0x772799DA
.word 0xE1B819BD
.word 0xF60DDB77
.word 0x39B80147
.word 0x3B84E1D1
.word 0x8C8821DF
.word 0x40784111
.word 0x5D00574B
.word 0x87B1F6E5
.word 0x6F9DF7E2
.word 0x76D01574
.word 0x340FABD6
.word 0x4A5593BD
.word 0xC6815403
.word 0x45CA8E64
.word 0x9F1C4313
.word 0x32A6C0A1
.word 0xC58112DF
.word 0x1522B955
.word 0xDD4185EB
.word 0xB13FC293
.word 0x23F48518
.word 0x8B95D136
.word 0x36AE6C5A
.word 0xEBAA523F
.word 0x00446A23
.word 0xB5D10C2A
.word 0x24963F04
.word 0xDDD1287F
.word 0x8E2C7EE4
.word 0x871C6CF7
.word 0xAF02B7EF
.word 0x603A931E
.word 0xE6B6AC64
.word 0xBFF105CC
.word 0xED0C442C
.word 0x5AB4DDCE
.word 0x57F9E51C
.word 0xEE32900C
.word 0x45068D2A
.word 0xA3DD25BD
.word 0x8B97D025
.word 0x24AB9073
.word 0x805C2D14
.word 0x5046A3AB
.word 0xD225CA33
.word 0x9361B5C6
.word 0xA5008C0B
.word 0xEAFEC330
.word 0x6127643F
.word 0x62117126
.word 0x0B6935FA
.word 0xF5D16839
.word 0x9E665853
.word 0x078AA66A
.word 0x701CBA17
.word 0x661FA9C2
.word 0xEEB87E3D
.word 0xF6E8EC35
!! thread 4 data, 64 words.
.word 0x01265E85
.word 0xAB1CE20C
.word 0x65A544C9
.word 0x6BF0463B
.word 0x365E0CB3
.word 0x40DD4F6F
.word 0x1FF8D889
.word 0x9D4E2E2D
.word 0xCE320E5F
.word 0x502C62F5
.word 0xBA0AC801
.word 0xCBB5B0D3
.word 0x9ACF1789
.word 0x52FC4404
.word 0xE4CE8F37
.word 0xDA936951
.word 0x0C8118DE
.word 0xE72CB525
.word 0x88690907
.word 0x18483E5E
.word 0x19133727
.word 0xB37858C9
.word 0x9006F66B
.word 0x02C36D9D
.word 0x6414A185
.word 0x9AEDF797
.word 0x8FB35025
.word 0x80681DDA
.word 0x5CC7CF4B
.word 0x1830BDF4
.word 0x1243425A
.word 0xB6B247DF
.word 0x7A82BBBF
.word 0xEA8701C6
.word 0xE095E865
.word 0x4D902E04
.word 0x4C3225CD
.word 0xBEDFD140
.word 0xD5C324BB
.word 0x23872AF9
.word 0xC0AFA86B
.word 0xF907D8AB
.word 0x6A9D5C7B
.word 0xC011ADB8
.word 0xD13E031A
.word 0x864AD2F5
.word 0x9F122079
.word 0xE3038D2E
.word 0x931B4CBD
.word 0xD61C31F9
.word 0x1751AFC7
.word 0x86123A3A
.word 0x0CBB919A
.word 0xE0F4A142
.word 0x6DB220E1
.word 0x4C20F91F
.word 0xFEADE63C
.word 0x0333E49E
.word 0xE72A5952
.word 0x665860FF
.word 0xF96FF676
.word 0x64A7F49E
.word 0xE736DDE9
.word 0x4BC79986
!! thread 5 data, 64 words.
.word 0x90BE17E9
.word 0x7E8B786A
.word 0xEF5E1A2B
.word 0x8B84C8BC
.word 0x956DCDD0
.word 0xECAD620E
.word 0x5E85C39D
.word 0x7D82FC88
.word 0xE6DD35B4
.word 0x3C34C90A
.word 0xFAF04DDB
.word 0x890BA440
.word 0x71B115D4
.word 0x8EA3A2C2
.word 0x081F6FA9
.word 0x34BAF262
.word 0x37992B4A
.word 0x2AD4E316
.word 0xEC6207F4
.word 0xB74DBFA2
.word 0x08F9240E
.word 0x04094B1D
.word 0x63AC63DD
.word 0x76AFC145
.word 0xCB318416
.word 0xB0CEE468
.word 0xD11435D7
.word 0xE05E075C
.word 0x786300FE
.word 0xA5203587
.word 0x52344980
.word 0x8E332F7E
.word 0x5020F2F1
.word 0xF427BB8A
.word 0xE21710CD
.word 0x6B8FE73D
.word 0x254AF697
.word 0xA3CA7039
.word 0xB7A00DAA
.word 0xE20F1A65
.word 0x24B63FF2
.word 0x3E222445
.word 0x720470FC
.word 0x419C4D63
.word 0x85653EB2
.word 0xDF407734
.word 0xE5913B1E
.word 0x0F58785F
.word 0x143CBC00
.word 0x61A53269
.word 0x024205E3
.word 0x88367C0D
.word 0x9F158EDE
.word 0x6C06EEB3
.word 0x64A24312
.word 0xF958B94B
.word 0xA38741CA
.word 0x399C1DA5
.word 0x6D821DDD
.word 0x0F412400
.word 0xF16DBFC1
.word 0xC56AEC25
.word 0x009DE24B
.word 0x888F80BB
!! thread 6 data, 64 words.
.word 0xDDB7645F
.word 0x1B35D46F
.word 0x40997AD8
.word 0xDEDB7EDE
.word 0x4486FE7F
.word 0x905F274D
.word 0x43217D09
.word 0x332BAA77
.word 0x9FA2B473
.word 0x75661E0D
.word 0xFDF8B63A
.word 0xC15D500B
.word 0x6BECD738
.word 0xE1902655
.word 0xC7EB281C
.word 0x20F2714F
.word 0xA53FFD3B
.word 0xCE4EC6C6
.word 0x2353EB34
.word 0xE87FD122
.word 0x4649F83D
.word 0x1B0DA347
.word 0x0CAC2281
.word 0xCD486619
.word 0x19CA032A
.word 0xDC5372DA
.word 0x5C33C2F2
.word 0xE9849CF6
.word 0x3EC3CDE7
.word 0xAFBE0333
.word 0x8E11BF35
.word 0x720FAB91
.word 0x20D8A652
.word 0x9FDA48E0
.word 0x57B1923E
.word 0x403EAB55
.word 0x458C0798
.word 0x6DB5C214
.word 0x2A7D2B53
.word 0x4669A23E
.word 0xBB4653A1
.word 0x205EA4E8
.word 0x3A62FD7A
.word 0x54FC5DB8
.word 0x9E95B741
.word 0x59EA30F7
.word 0xE2921916
.word 0xB4A3D5E1
.word 0x90C26811
.word 0xC5F779AF
.word 0xA14C8B7E
.word 0xA5E67BB2
.word 0x06750C68
.word 0xAAFACE2B
.word 0x268D254C
.word 0x1AC494A4
.word 0x839D919C
.word 0x36A2E6D9
.word 0x9D71B4E0
.word 0x3064CCB8
.word 0x86E8AD6A
.word 0x0A08DA40
.word 0xEEF2C854
.word 0x719B1E7F
!! thread 7 data, 64 words.
.word 0x89C3525D
.word 0x24EDDE20
.word 0xFB3251C6
.word 0x8B63BAD6
.word 0xE59A60DB
.word 0xF3CB96A4
.word 0xE64ED157
.word 0x5637D22E
.word 0x134D927C
.word 0x9BD97381
.word 0x8BB6CC46
.word 0x4FBB18D8
.word 0xE0E01A99
.word 0xDD62D55B
.word 0xE8C8C60B
.word 0x6A24230A
.word 0x4BFAA64E
.word 0x09FFA747
.word 0x01E632B2
.word 0x7010C4C3
.word 0x6FCA8FC6
.word 0xA3852BD3
.word 0x15EB0E77
.word 0xCEFE7A18
.word 0xC26D5681
.word 0x9C5D1B04
.word 0x47EF28E9
.word 0xFDC66DCA
.word 0xF3B335D1
.word 0xC4333572
.word 0x9FE99023
.word 0xA9EB6AD1
.word 0x751B507E
.word 0x5F5435A4
.word 0xFD1ECCBB
.word 0x8D0443EB
.word 0xBAFD012C
.word 0xF5CFDC9B
.word 0x6B1A48FE
.word 0x1C3BDAC5
.word 0xF23EEDE6
.word 0x1AB6BC14
.word 0x0F9AE5C8
.word 0xF5E0C554
.word 0x5DE558B6
.word 0xD8849BCD
.word 0x6FAD96C0
.word 0xF66CE1A9
.word 0x1D257A58
.word 0xF3ECD81B
.word 0x206D2DCF
.word 0x95203C72
.word 0x5F7B831D
.word 0xC13812EE
.word 0xA69223B3
.word 0x9AEC3E20
.word 0x48C7079E
.word 0x8FA1E7C8
.word 0x93A222B3
.word 0x6B2CD011
.word 0x162054E1
.word 0xF75F26E5
.word 0x1A4BEEC3
.word 0x0E914177
.end
