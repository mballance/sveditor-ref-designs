/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc9.s
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
	set	0xB,	%g1
	set	0x3,	%g2
	set	0x5,	%g3
	set	0x8,	%g4
	set	0xF,	%g5
	set	0x7,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xC,	%i1
	set	-0xE,	%i2
	set	-0x0,	%i3
	set	-0x5,	%i4
	set	-0x8,	%i5
	set	-0x9,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x068BF74C,	%l0
	set	0x3B6B28D8,	%l1
	set	0x7F9E0D9D,	%l2
	set	0x72104A96,	%l3
	set	0x4643D707,	%l4
	set	0x3A561825,	%l5
	set	0x089BA07A,	%l6
	!# Output registers
	set	-0x19E0,	%o0
	set	0x1C44,	%o1
	set	0x1EC4,	%o2
	set	0x02D8,	%o3
	set	0x0F72,	%o4
	set	0x1B3F,	%o5
	set	0x0615,	%o6
	set	-0x1F2A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x44, %o7
	lduh	[%l7 + %o7],	%i3
	or	%i6,	%l4,	%i1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x68, %i0
	stwa	%g1,	[%l7 + %i0] 0x80
	nop
	nop
	setx	0x9E79E25D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xC1735D21,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f27,	%f22
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	and	%g7,	%i5,	%i2
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc4
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f0
	nop
	set	0x40, %o3
	swap	[%l7 + %o3],	%o3
	nop
	set	0x0C, %i4
	stw	%o4,	[%l7 + %i4]
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%g4
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x80,	%i0
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o7
	wr	%l6,	%o1,	%sys_tick
	add	%l1,	%g5,	%g6
	or	%i4,	%o0,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%l2
	nop
	set	0x70, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x68, %g2
	swap	[%l7 + %g2],	%g2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%o6
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x81,	%i2
	nop
	set	0x7F, %i2
	ldsb	[%l7 + %i2],	%g3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%l4
	set	0x58, %l2
	stxa	%i1,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%o5,	%g1,	%o2
	set	0x48, %i5
	swapa	[%l7 + %i5] 0x80,	%g7
	nop
	set	0x58, %l3
	std	%f28,	[%l7 + %l3]
	set	0x22, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i2
	add	%i5,	%o4,	%g4
	nop
	set	0x77, %o4
	ldsb	[%l7 + %o4],	%i0
	nop
	set	0x10, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x70, %o2
	stha	%o3,	[%l7 + %o2] 0x80
	set	0x40, %i3
	swapa	[%l7 + %i3] 0x89,	%o7
	set	0x36, %g6
	stba	%l6,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x64, %l4
	swap	[%l7 + %l4],	%l1
	ld	[%l7 + 0x14],	%f4
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x24, %l0
	swap	[%l7 + %l0],	%g5
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	nop
	set	0x28, %o5
	swap	[%l7 + %o5],	%g6
	set	0x0B, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o1
	be,pt	%xcc,	loop_1
	nop
	set	0x0A, %o7
	stb	%o0,	[%l7 + %o7]
	nop
	set	0x7C, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x70, %g3
	stxa	%i4,	[%l7 + %g3] 0x81
loop_1:
	nop
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x88,	%l5
	wr	%l0,	%l3,	%sys_tick
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x81,	%l2
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f24
	set	0x34, %l1
	stha	%g2,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x60, %i4
	ldsh	[%l7 + %i4],	%o6
	set	0x30, %l6
	stxa	%i7,	[%l7 + %l6] 0x81
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%g3
	nop
	set	0x0E, %i6
	sth	%i3,	[%l7 + %i6]
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	fpadd32	%f22,	%f0,	%f24
	set	0x7C, %g2
	sta	%f11,	[%l7 + %g2] 0x81
	set	0x20, %o1
	stha	%l4,	[%l7 + %o1] 0x89
	nop
	set	0x68, %l5
	stx	%i1,	[%l7 + %l5]
	nop
	set	0x3A, %l2
	lduh	[%l7 + %l2],	%o5
	nop
	set	0x26, %i5
	sth	%i6,	[%l7 + %i5]
	nop
	set	0x70, %i2
	stx	%g1,	[%l7 + %i2]
	or	%o2,	%g7,	%i2
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%g4
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f12
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%i4
	set	0x50, %i3
	stxa	%i0,	[%l7 + %i3] 0x88
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%o6
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x88,	%f4
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc4
	bn,a,pt	%icc,	loop_2
	nop
	set	0x70, %l0
	swap	[%l7 + %l0],	%l6
	st	%f19,	[%l7 + 0x40]
	or	%o3,	%g5,	%l1
loop_2:
	nop
	set	0x44, %g4
	stw	%g6,	[%l7 + %g4]
	set	0x44, %o5
	swapa	[%l7 + %o5] 0x88,	%o1
	set	0x43, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i4
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x81,	 4
	nop
	set	0x50, %i0
	lduw	[%l7 + %i0],	%l0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%l3
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x88,	%l2
	nop
	set	0x20, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x1F, %o3
	ldstub	[%l7 + %o3],	%o6
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	set	0x08, %i4
	stxa	%g3,	[%l7 + %i4] 0x80
	bg	%xcc,	loop_3
	nop
	set	0x25, %g3
	ldsb	[%l7 + %g3],	%i3
	nop
	set	0x7B, %l6
	stb	%l4,	[%l7 + %l6]
	nop
	set	0x18, %g1
	prefetch	[%l7 + %g1],	 4
loop_3:
	and	%g2,	%i1,	%o5
	nop
	set	0x58, %i7
	stw	%g1,	[%l7 + %i7]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xcc
	nop
	set	0x2C, %o1
	ldsw	[%l7 + %o1],	%i6
	set	0x50, %l5
	sta	%f21,	[%l7 + %l5] 0x81
	or	%o2,	%g7,	%i2
	nop
	set	0x48, %l2
	ldsh	[%l7 + %l2],	%o4
	set	0x58, %g2
	sta	%f20,	[%l7 + %g2] 0x81
	st	%f20,	[%l7 + 0x34]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%i5
	st	%f21,	[%l7 + 0x48]
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%g4
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%o7
	set	0x3C, %o4
	lda	[%l7 + %o4] 0x89,	%f21
	nop
	set	0x70, %o6
	ldsh	[%l7 + %o6],	%l6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%g5
	set	0x10, %o2
	lda	[%l7 + %o2] 0x80,	%f8
	nop
	set	0x18, %g7
	sth	%l1,	[%l7 + %g7]
	nop
	set	0x78, %g6
	std	%f24,	[%l7 + %g6]
	nop
	set	0x44, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x60, %l0
	std	%g6,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	set	0x7A, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o1
	and	%i4,	%l5,	%i0
	nop
	set	0x7C, %o5
	stw	%l0,	[%l7 + %o5]
	set	0x32, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%l2
	nop
	set	0x4F, %g5
	ldub	[%l7 + %g5],	%o6
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%i2
	nop
	set	0x3D, %o0
	ldub	[%l7 + %o0],	%l4
	set	0x48, %l1
	stxa	%i7,	[%l7 + %l1] 0x80
	nop
	set	0x66, %i4
	sth	%g2,	[%l7 + %i4]
	set	0x6F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o5
	add	%i1,	%g1,	%o2
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd0,	%f16
	nop
	set	0x76, %g1
	lduh	[%l7 + %g1],	%i6
	set	0x08, %i6
	stxa	%i2,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x58, %o1
	ldsw	[%l7 + %o1],	%g7
	set	0x7A, %i7
	stha	%o4,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%i5,	%g4,	%o7
	nop
	set	0x0D, %l2
	ldsb	[%l7 + %l2],	%l6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%g5
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%l1
	set	0x20, %l5
	stda	%o0,	[%l7 + %l5] 0xe3
	membar	#Sync
	add	%g6,	%i4,	%l5
	set	0x6E, %i2
	ldstuba	[%l7 + %i2] 0x88,	%i0
	set	0x34, %i5
	stwa	%l3,	[%l7 + %i5] 0x81
	nop
	set	0x6E, %l3
	ldsb	[%l7 + %l3],	%o0
	nop
	set	0x0C, %o4
	lduh	[%l7 + %o4],	%l0
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%g2
	set	0x18, %g7
	swapa	[%l7 + %g7] 0x88,	%i3
	nop
	set	0x62, %o2
	ldsb	[%l7 + %o2],	%o6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%i7
	set	0x08, %g6
	swapa	[%l7 + %g6] 0x81,	%g2
	set	0x2D, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i1
	set	0x0F, %g4
	stba	%o5,	[%l7 + %g4] 0x89
	nop
	set	0x28, %i1
	ldsw	[%l7 + %i1],	%o2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%i2
	nop
	set	0x5E, %o5
	ldsh	[%l7 + %o5],	%i6
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x81,	%o4
	nop
	set	0x74, %g5
	stw	%i5,	[%l7 + %g5]
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x6C, %i0
	prefetch	[%l7 + %i0],	 0
	set	0x4E, %o3
	stha	%g7,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%o6
	wr	%g4,	%l6,	%y
	set	0x78, %o0
	lda	[%l7 + %o0] 0x88,	%f30
	nop
	set	0x7C, %i4
	ldsw	[%l7 + %i4],	%g5
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%o3
	nop
	set	0x60, %g1
	stw	%o1,	[%l7 + %g1]
	set	0x7B, %i6
	stba	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x7C, %g3
	stw	%i4,	[%l7 + %g3]
	fpadd16	%f22,	%f14,	%f0
	set	0x2E, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l1
	add	%i0,	%l5,	%o0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%l3
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x81,	%g3
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	set	0x08, %i7
	stda	%l2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l4
	set	0x08, %l5
	stha	%o6,	[%l7 + %l5] 0x81
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe3,	%g2
	set	0x78, %i5
	stxa	%i7,	[%l7 + %i5] 0xea
	membar	#Sync
	or	%o5,	%i1,	%g1
	nop
	set	0x51, %o4
	ldub	[%l7 + %o4],	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%o4
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x88,	%i6
	nop
	set	0x50, %g7
	std	%f24,	[%l7 + %g7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%g7
	wr	%o7,	%g4,	%pic
	st	%fsr,	[%l7 + 0x10]
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x80,	%l6
	set	0x41, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g5
	set	0x12, %o6
	stba	%o3,	[%l7 + %o6] 0x81
	ld	[%l7 + 0x5C],	%f30
	nop
	set	0x67, %l4
	stb	%g6,	[%l7 + %l4]
	set	0x52, %i1
	stha	%i4,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x24, %g4
	ldsb	[%l7 + %g4],	%l1
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	set	0x14, %o7
	sta	%f21,	[%l7 + %o7] 0x89
	nop
	set	0x10, %l0
	std	%l4,	[%l7 + %l0]
	set	0x10, %i0
	stda	%i0,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x68, %g5
	stwa	%o0,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x5C, %o3
	lda	[%l7 + %o3] 0x80,	%f8
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xda
	bne	%xcc,	loop_4
	nop
	set	0x72, %l1
	sth	%l3,	[%l7 + %l1]
	nop
	set	0x18, %i4
	stw	%l0,	[%l7 + %i4]
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
loop_4:
	nop
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 2
	nop
	set	0x58, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x2C, %g3
	swap	[%l7 + %g3],	%l4
	or	%g3,	%o6,	%i7
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x88,	%o5
	and	%i1,	%g1,	%o2
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f24
	wr	%g2,	%o4,	%clear_softint
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%i2
	set	0x40, %i7
	stda	%i4,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%i6
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%g4
	nop
	set	0x4E, %l5
	ldsh	[%l7 + %l5],	%l6
	st	%fsr,	[%l7 + 0x40]
	or	%g5,	%o3,	%g6
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xea,	%i4
	set	0x68, %i5
	stxa	%o1,	[%l7 + %i5] 0x81
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x50, %o2
	ldsh	[%l7 + %o2],	%l5
	set	0x08, %g6
	stxa	%i0,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x11, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o0
	ble,pt	%icc,	loop_5
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%l1
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xe3,	%l0
loop_5:
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f6
	set	0x14, %o5
	swapa	[%l7 + %o5] 0x80,	%i3
	nop
	set	0x56, %g4
	sth	%l2,	[%l7 + %g4]
	or	%l4,	%l3,	%g3
	nop
	set	0x38, %o7
	std	%f14,	[%l7 + %o7]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcc
	set	0x54, %l0
	stwa	%i7,	[%l7 + %l0] 0x81
	nop
	set	0x10, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x10, %o0
	stda	%o6,	[%l7 + %o0] 0x81
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	wr	%o5,	%g1,	%softint
	nop
	set	0x50, %i4
	stw	%i1,	[%l7 + %i4]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%o2
	nop
	set	0x1C, %l6
	prefetch	[%l7 + %l6],	 4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc2
	nop
	set	0x4E, %g3
	sth	%g2,	[%l7 + %g3]
	wr	%o4,	%i5,	%set_softint
	nop
	set	0x48, %i6
	std	%f30,	[%l7 + %i6]
	nop
	set	0x12, %g2
	stb	%i2,	[%l7 + %g2]
	nop
	set	0x58, %l2
	stw	%g7,	[%l7 + %l2]
	bl,a,pt	%icc,	loop_6
	or	%i6,	%g4,	%l6
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%g5
	nop
	set	0x44, %i2
	sth	%o3,	[%l7 + %i2]
loop_6:
	nop
	set	0x58, %o1
	std	%f28,	[%l7 + %o1]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f0
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x89,	%o7
	nop
	set	0x5C, %i5
	ldub	[%l7 + %i5],	%i4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	and	%g6,	%l5,	%o1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i0
	set	0x11, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l1
	or	%i3,	%l2,	%l0
	or	%l3,	%g3,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%o5
	nop
	set	0x44, %g6
	ldsb	[%l7 + %g6],	%g1
	set	0x48, %l3
	stha	%l4,	[%l7 + %l3] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f0
	nop
	set	0x54, %l4
	ldsh	[%l7 + %l4],	%i1
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x80,	%g2
	set	0x40, %i1
	lda	[%l7 + %i1] 0x88,	%f28
	set	0x10, %g4
	stha	%o4,	[%l7 + %g4] 0x89
	nop
	set	0x42, %o7
	sth	%o2,	[%l7 + %o7]
	be	%icc,	loop_7
	fpadd16	%f6,	%f18,	%f18
	st	%f10,	[%l7 + 0x28]
	st	%f2,	[%l7 + 0x20]
loop_7:
	wr	%i2,	%i5,	%set_softint
	nop
	set	0x10, %i0
	ldsh	[%l7 + %i0],	%g7
	set	0x28, %o5
	lda	[%l7 + %o5] 0x89,	%f12
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc2
	nop
	set	0x1A, %o0
	sth	%i6,	[%l7 + %o0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%l6
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%g5
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f2
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%o3
	and	%i4,	%o7,	%g6
	nop
	set	0x64, %o3
	ldsw	[%l7 + %o3],	%o1
	set	0x40, %g1
	sta	%f11,	[%l7 + %g1] 0x89
	set	0x68, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l5
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%o0
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%l0
	set	0x42, %i6
	ldstuba	[%l7 + %i6] 0x89,	%i3
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f16
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f0
	nop
	set	0x0C, %i2
	swap	[%l7 + %i2],	%l2
	set	0x2A, %o1
	stha	%l0,	[%l7 + %o1] 0x88
	nop
	set	0x24, %i7
	ldsh	[%l7 + %i7],	%g3
	set	0x20, %o4
	stda	%l2,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe2,	%o6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc4
	nop
	set	0x6E, %o2
	sth	%o5,	[%l7 + %o2]
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%g1
	add	%i7,	%l4,	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o2
	set	0x38, %i3
	stwa	%i1,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%i2
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%i5
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	set	0x5F, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g7
	nop
	set	0x14, %g4
	lduw	[%l7 + %g4],	%g4
	set	0x17, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l6
	fpsub32s	%f2,	%f11,	%f5
	bge,a,pt	%xcc,	loop_8
	nop
	set	0x40, %o7
	sth	%i6,	[%l7 + %o7]
	nop
	set	0x34, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%o2
loop_8:
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f16
	set	0x30, %l1
	lda	[%l7 + %l1] 0x88,	%f17
	set	0x2C, %o0
	sta	%f20,	[%l7 + %o0] 0x89
	nop
	nop
	setx	0xA9933B81C99A04D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x72117E4D67DEC29F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f22,	%f18
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%i4
	bl,a	%xcc,	loop_9
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%o6
	set	0x08, %o3
	swapa	[%l7 + %o3] 0x89,	%g5
loop_9:
	nop
	set	0x50, %g3
	stx	%g6,	[%l7 + %g3]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%l5
	set	0x50, %l6
	sta	%f20,	[%l7 + %l6] 0x80
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x08, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x08, %l2
	swapa	[%l7 + %l2] 0x81,	%l1
	nop
	set	0x0C, %g2
	swap	[%l7 + %g2],	%i3
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x57, %g1
	ldstub	[%l7 + %g1],	%i0
	add	%l2,	%l0,	%l3
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f2
	st	%f14,	[%l7 + 0x5C]
	nop
	set	0x6F, %o4
	ldub	[%l7 + %o4],	%o6
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%o5
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	nop
	set	0x78, %o2
	stw	%i7,	[%l7 + %o2]
	or	%g2,	%o4,	%l4
	or	%i1,	%i2,	%o2
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x80
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x80,	%i5
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f6
	set	0x18, %g7
	stda	%g4,	[%l7 + %g7] 0x88
	nop
	set	0x14, %l3
	ldub	[%l7 + %l3],	%g7
	or	%l6,	%o3,	%i4
	wr	%o7,	%i6,	%clear_softint
	ld	[%l7 + 0x48],	%f2
	set	0x50, %i1
	stda	%g6,	[%l7 + %i1] 0x89
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%g5
	nop
	set	0x48, %o6
	std	%f8,	[%l7 + %o6]
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	or	%o0,	%l1,	%i3
	nop
	set	0x71, %l4
	stb	%o1,	[%l7 + %l4]
	nop
	set	0x30, %i0
	std	%l2,	[%l7 + %i0]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	nop
	setx	0x1DA2B6B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x371835F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f7,	%f7
	nop
	set	0x7C, %o5
	swap	[%l7 + %o5],	%l0
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f0
	set	0x34, %l1
	stwa	%i0,	[%l7 + %l1] 0x89
	nop
	set	0x40, %l0
	ldstub	[%l7 + %l0],	%o6
	nop
	set	0x28, %i4
	stw	%l3,	[%l7 + %i4]
	nop
	set	0x1C, %g3
	ldsw	[%l7 + %g3],	%o5
	set	0x40, %o3
	stda	%g0,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x68, %i6
	ldstuba	[%l7 + %i6] 0x80,	%g3
	st	%fsr,	[%l7 + 0x70]
	wr	%i7,	%g2,	%softint
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i2
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x80,	%i5
	set	0x3C, %l2
	sta	%f4,	[%l7 + %l2] 0x81
	nop
	set	0x30, %g2
	std	%o2,	[%l7 + %g2]
	nop
	set	0x14, %g1
	prefetch	[%l7 + %g1],	 3
	add	%g4,	%g7,	%o3
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%i6
	set	0x4C, %o4
	stwa	%o7,	[%l7 + %o4] 0x89
	set	0x48, %i5
	stda	%i4,	[%l7 + %i5] 0x80
	set	0x0E, %i2
	stha	%g6,	[%l7 + %i2] 0x80
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x88,	%g5
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%l5
	nop
	set	0x64, %l5
	swap	[%l7 + %l5],	%o0
	and	%l1,	%i6,	%i3
	set	0x50, %i3
	stwa	%o1,	[%l7 + %i3] 0xeb
	membar	#Sync
	bge	%xcc,	loop_10
	nop
	set	0x68, %g7
	std	%f18,	[%l7 + %g7]
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%l0
	nop
	set	0x40, %i1
	stx	%l2,	[%l7 + %i1]
loop_10:
	nop
	set	0x78, %o6
	ldsw	[%l7 + %o6],	%i0
	or	%l3,	%o6,	%o5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xca
	set	0x70, %o7
	stha	%g1,	[%l7 + %o7] 0x80
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%g2
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x20, %i0
	std	%i6,	[%l7 + %i0]
	nop
	set	0x68, %g5
	std	%f20,	[%l7 + %g5]
	nop
	set	0x0C, %l4
	sth	%o4,	[%l7 + %l4]
	nop
	set	0x60, %o0
	std	%l4,	[%l7 + %o0]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xcc
	nop
	set	0x50, %l0
	std	%i0,	[%l7 + %l0]
	nop
	set	0x54, %o5
	ldsh	[%l7 + %o5],	%i2
	nop
	set	0x67, %i4
	ldsb	[%l7 + %i4],	%i5
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x74, %o3
	sth	%o2,	[%l7 + %o3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%o3
	nop
	set	0x18, %i6
	swap	[%l7 + %i6],	%l6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd8,	%f0
	nop
	set	0x6C, %l2
	lduw	[%l7 + %l2],	%o7
	set	0x0C, %g2
	sta	%f26,	[%l7 + %g2] 0x81
	add	%g4,	%i4,	%g6
	set	0x38, %g3
	stxa	%l5,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x60, %g1
	stwa	%o0,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%l1
	nop
	set	0x0C, %i5
	ldub	[%l7 + %i5],	%g5
	nop
	set	0x49, %i2
	ldstub	[%l7 + %i2],	%i3
	set	0x18, %o4
	sta	%f17,	[%l7 + %o4] 0x81
	nop
	set	0x33, %o2
	stb	%o1,	[%l7 + %o2]
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f6
	bg,pt	%xcc,	loop_11
	nop
	set	0x70, %l5
	ldstub	[%l7 + %l5],	%i6
	set	0x0E, %g6
	stha	%l2,	[%l7 + %g6] 0xe3
	membar	#Sync
loop_11:
	nop
	nop
	setx	0x34A20358,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x25373DF5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f24,	%f26
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x89
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xea,	%i0
	set	0x18, %i1
	stxa	%l3,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x89,	%l0
	nop
	set	0x18, %o6
	std	%o6,	[%l7 + %o6]
	set	0x10, %g4
	swapa	[%l7 + %g4] 0x89,	%g1
	set	0x37, %i0
	stba	%g3,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x58, %o7
	std	%f28,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x5B, %l4
	ldub	[%l7 + %l4],	%o5
	ld	[%l7 + 0x68],	%f7
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xeb,	%i6
	nop
	set	0x2C, %o0
	ldub	[%l7 + %o0],	%g2
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%o4
	st	%fsr,	[%l7 + 0x20]
	set	0x73, %o5
	stba	%i1,	[%l7 + %o5] 0x80
	set	0x7E, %l1
	stha	%l4,	[%l7 + %l1] 0x80
	set	0x3C, %o3
	stwa	%i5,	[%l7 + %o3] 0x81
	nop
	set	0x40, %i4
	lduw	[%l7 + %i4],	%i2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g7
	nop
	set	0x3A, %l6
	ldsh	[%l7 + %l6],	%l6
	nop
	set	0x38, %l2
	stw	%o3,	[%l7 + %l2]
	nop
	set	0x72, %g2
	stb	%o7,	[%l7 + %g2]
	nop
	set	0x40, %g3
	sth	%i4,	[%l7 + %g3]
	set	0x18, %i6
	stxa	%g6,	[%l7 + %i6] 0x81
	or	%g4,	%o0,	%l5
	nop
	set	0x4C, %i7
	prefetch	[%l7 + %i7],	 2
	and	%g5,	%l1,	%i3
	ld	[%l7 + 0x68],	%f9
	or	%o1,	%l2,	%i6
	nop
	set	0x40, %i5
	stx	%l3,	[%l7 + %i5]
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%i0
	set	0x18, %i2
	stxa	%o6,	[%l7 + %i2] 0x88
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%l0
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x78, %o1
	ldsw	[%l7 + %o1],	%g3
	set	0x50, %l5
	stxa	%o5,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%i6
	set	0x10, %o2
	stda	%g2,	[%l7 + %o2] 0xe2
	membar	#Sync
	bge,a,pt	%icc,	loop_12
	nop
	set	0x3D, %g7
	stb	%g1,	[%l7 + %g7]
	set	0x15, %i3
	stba	%i1,	[%l7 + %i3] 0x89
loop_12:
	nop
	set	0x1C, %l3
	stwa	%l4,	[%l7 + %l3] 0x88
	nop
	set	0x78, %i1
	stx	%i5,	[%l7 + %i1]
	nop
	set	0x60, %g4
	ldsw	[%l7 + %g4],	%i2
	nop
	set	0x1C, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x58, %o7
	stwa	%o4,	[%l7 + %o7] 0xe3
	membar	#Sync
	add	%g7,	%l6,	%o2
	nop
	set	0x62, %o6
	ldsh	[%l7 + %o6],	%o7
	nop
	set	0x60, %g5
	std	%f18,	[%l7 + %g5]
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x80,	%o3
	set	0x50, %l4
	stwa	%i4,	[%l7 + %l4] 0x88
	st	%f19,	[%l7 + 0x4C]
	set	0x50, %o5
	stba	%g4,	[%l7 + %o5] 0x88
	set	0x64, %l0
	stwa	%g6,	[%l7 + %l0] 0x81
	set	0x08, %o3
	stda	%o0,	[%l7 + %o3] 0x88
	nop
	set	0x60, %l1
	stb	%g5,	[%l7 + %l1]
	set	0x10, %i4
	sta	%f27,	[%l7 + %i4] 0x81
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcc
	nop
	set	0x10, %g2
	lduh	[%l7 + %g2],	%l1
	nop
	set	0x7E, %g3
	ldstub	[%l7 + %g3],	%i3
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%l4
	set	0x70, %i6
	stda	%l2,	[%l7 + %i6] 0xe3
	membar	#Sync
	fpsub32	%f4,	%f2,	%f12
	set	0x0F, %i5
	stba	%o1,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	nop
	setx	0xADDD0E85EEBACBD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x508CB38A978A96CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f18,	%f26
	nop
	set	0x20, %g1
	ldsh	[%l7 + %g1],	%l3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o6
	add	%i0,	%g3,	%l0
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f0
	add	%i7,	%g2,	%o5
	nop
	set	0x7C, %o4
	ldsw	[%l7 + %o4],	%i1
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x80,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%i5
	set	0x3F, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i2
	set	0x70, %g6
	stxa	%g7,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	nop
	set	0x34, %g7
	lduw	[%l7 + %g7],	%l6
	set	0x58, %i3
	stda	%o2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x62, %i7
	ldsh	[%l7 + %i7],	%o3
	nop
	set	0x71, %l3
	stb	%i4,	[%l7 + %l3]
	bge,a	%icc,	loop_13
	nop
	set	0x48, %i1
	std	%g4,	[%l7 + %i1]
	set	0x28, %g4
	stda	%g6,	[%l7 + %g4] 0x88
loop_13:
	nop
	set	0x48, %i0
	prefetch	[%l7 + %i0],	 0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%g5
	fpadd16	%f6,	%f12,	%f6
	set	0x7A, %o7
	stba	%o0,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x4B, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l1
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x80,	 2
	nop
	set	0x28, %l4
	std	%l2,	[%l7 + %l4]
	set	0x54, %o6
	sta	%f17,	[%l7 + %o6] 0x88
	set	0x74, %o5
	stha	%o1,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f22
	nop
	set	0x46, %o3
	ldsh	[%l7 + %o3],	%l5
	nop
	set	0x70, %i4
	lduw	[%l7 + %i4],	%i6
	ld	[%l7 + 0x68],	%f14
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f16
	nop
	set	0x2E, %l2
	sth	%l3,	[%l7 + %l2]
	nop
	set	0x56, %g2
	ldsh	[%l7 + %g2],	%o6
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x81,	%i0
	set	0x28, %g3
	stxa	%g3,	[%l7 + %g3] 0x80
	nop
	set	0x6B, %i6
	stb	%l0,	[%l7 + %i6]
	nop
	set	0x2A, %i5
	stb	%g2,	[%l7 + %i5]
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%i7
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc2
	nop
	set	0x71, %o1
	ldsb	[%l7 + %o1],	%o5
	nop
	set	0x6A, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x20, %l5
	stb	%l4,	[%l7 + %l5]
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xea,	%g0
	nop
	set	0x22, %o2
	ldsh	[%l7 + %o2],	%i2
	nop
	set	0x40, %g7
	lduh	[%l7 + %g7],	%g7
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x81,	 2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%i4
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%f4
	nop
	set	0x39, %i7
	ldub	[%l7 + %i7],	%l6
	or	%o3,	%i4,	%o2
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%g6
	set	0x4C, %g4
	stha	%o7,	[%l7 + %g4] 0x89
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%g4
	set	0x30, %g5
	stda	%o0,	[%l7 + %g5] 0x89
	set	0x67, %o0
	ldstuba	[%l7 + %o0] 0x81,	%g4
	nop
	set	0x14, %l4
	ldsw	[%l7 + %l4],	%i3
	ld	[%l7 + 0x24],	%f0
	set	0x08, %o6
	sta	%f24,	[%l7 + %o6] 0x80
	fpadd32s	%f14,	%f27,	%f29
	set	0x0C, %l0
	stwa	%l2,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf8
	membar	#Sync
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%o0
	nop
	set	0x6C, %l1
	sth	%l5,	[%l7 + %l1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%i6
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x81,	%o6
	or	%l3,	%g3,	%i0
	nop
	set	0x4C, %g2
	ldsw	[%l7 + %g2],	%g2
	set	0x43, %l2
	stba	%i7,	[%l7 + %l2] 0xea
	membar	#Sync
	fpadd16s	%f22,	%f1,	%f4
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f0
	or	%o5,	%l0,	%l4
	nop
	set	0x28, %g3
	ldsb	[%l7 + %g3],	%i1
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%i2
	set	0x54, %i6
	stha	%g1,	[%l7 + %i6] 0x81
	set	0x6E, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g7
	set	0x0B, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o4
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%i5
	fpsub32s	%f24,	%f12,	%f13
	set	0x7C, %o1
	swapa	[%l7 + %o1] 0x88,	%o3
	or	%i4,	%o2,	%g6
	nop
	set	0x61, %g6
	stb	%o7,	[%l7 + %g6]
	fpsub16	%f6,	%f0,	%f4
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%l6
	set	0x25, %l5
	stba	%o0,	[%l7 + %l5] 0x88
	set	0x24, %i3
	stwa	%g4,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x16, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i3
	nop
	set	0x68, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	ld	[%l7 + 0x64],	%f1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%o1
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc8
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%i6
	nop
	set	0x20, %i0
	std	%o6,	[%l7 + %i0]
	set	0x38, %o7
	stxa	%l1,	[%l7 + %o7] 0x80
	nop
	set	0x40, %g5
	stx	%l3,	[%l7 + %g5]
	set	0x20, %g4
	stda	%g2,	[%l7 + %g4] 0x88
	nop
	set	0x30, %l4
	ldsh	[%l7 + %l4],	%i0
	set	0x45, %o0
	stba	%i7,	[%l7 + %o0] 0x81
	nop
	set	0x12, %o6
	ldub	[%l7 + %o6],	%g2
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%l0
	set	0x30, %l0
	ldxa	[%l7 + %l0] 0x88,	%l4
	nop
	set	0x36, %o3
	ldstub	[%l7 + %o3],	%i1
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	set	0x1E, %g2
	ldstuba	[%l7 + %g2] 0x89,	%g1
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x81,	 2
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%i2
	set	0x40, %l2
	swapa	[%l7 + %l2] 0x89,	%o4
	set	0x10, %g3
	stda	%i4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x78, %i5
	std	%f10,	[%l7 + %i5]
	nop
	set	0x0A, %i6
	ldstub	[%l7 + %i6],	%o3
	wr	%o2,	%g6,	%ccr
	nop
	set	0x4E, %g1
	sth	%o7,	[%l7 + %g1]
	st	%f7,	[%l7 + 0x70]
	set	0x58, %i2
	swapa	[%l7 + %i2] 0x88,	%l6
	set	0x24, %o1
	sta	%f25,	[%l7 + %o1] 0x80
	add	%i4,	%g4,	%i3
	nop
	set	0x58, %o4
	std	%f18,	[%l7 + %o4]
	set	0x40, %o2
	stda	%o0,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x48, %l5
	swapa	[%l7 + %l5] 0x81,	%l2
	nop
	set	0x58, %i3
	ldx	[%l7 + %i3],	%o1
	nop
	set	0x37, %g6
	ldsb	[%l7 + %g6],	%l5
	nop
	set	0x14, %l3
	lduh	[%l7 + %l3],	%g5
	nop
	set	0x66, %i7
	ldsh	[%l7 + %i7],	%o6
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f0
	st	%fsr,	[%l7 + 0x2C]
	and	%i6,	%l1,	%g3
	and	%l3,	%i7,	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%g2
	set	0x28, %i0
	stda	%i0,	[%l7 + %i0] 0x89
	nop
	set	0x1C, %o7
	prefetch	[%l7 + %o7],	 1
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe2,	%l4
	add	%o5,	%g7,	%i2
	nop
	set	0x38, %g4
	ldsw	[%l7 + %g4],	%o4
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x80,	%g1
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%i4
	nop
	set	0x69, %g5
	ldub	[%l7 + %g5],	%o2
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
	set	0x18, %o5
	lda	[%l7 + %o5] 0x81,	%f15
	nop
	set	0x7A, %o3
	sth	%o3,	[%l7 + %o3]
	set	0x0E, %l0
	stha	%o7,	[%l7 + %l0] 0x80
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x88,	%f16
	set	0x5C, %i4
	stwa	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x3A, %l6
	ldsb	[%l7 + %l6],	%i4
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	nop
	set	0x08, %l2
	ldx	[%l7 + %l2],	%l6
	bn	%icc,	loop_14
	nop
	set	0x6C, %g3
	lduw	[%l7 + %g3],	%o0
	set	0x38, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
loop_14:
	nop
	set	0x20, %i6
	stda	%o0,	[%l7 + %i6] 0x88
	nop
	set	0x30, %g1
	std	%f30,	[%l7 + %g1]
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x80,	%l5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc4
	bn	%icc,	loop_15
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%g5
	set	0x33, %o1
	stba	%o6,	[%l7 + %o1] 0x88
loop_15:
	nop
	set	0x1C, %i3
	lduh	[%l7 + %i3],	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%l1
	nop
	set	0x08, %g6
	stx	%g3,	[%l7 + %g6]
	nop
	set	0x68, %l3
	std	%i6,	[%l7 + %l3]
	set	0x50, %l5
	stxa	%l3,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f16
	nop
	set	0x7A, %g7
	stb	%i0,	[%l7 + %g7]
	nop
	set	0x0D, %i0
	stb	%l0,	[%l7 + %i0]
	set	0x78, %o7
	stda	%i0,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f16
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x58, %o0
	std	%g2,	[%l7 + %o0]
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x80,	%f5
	nop
	set	0x0C, %g5
	stw	%g7,	[%l7 + %g5]
	set	0x74, %o6
	sta	%f8,	[%l7 + %o6] 0x80
	nop
	set	0x1C, %o3
	lduw	[%l7 + %o3],	%i2
	set	0x50, %o5
	stda	%o4,	[%l7 + %o5] 0xeb
	membar	#Sync
	ld	[%l7 + 0x54],	%f18
	nop
	set	0x58, %l0
	prefetch	[%l7 + %l0],	 0
	nop
	set	0x2A, %g2
	ldstub	[%l7 + %g2],	%g1
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%o7
	set	0x6A, %i4
	stha	%o2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x50, %l1
	std	%g6,	[%l7 + %l1]
	bl,a	%xcc,	loop_16
	or	%i4,	%g4,	%o0
	st	%f21,	[%l7 + 0x68]
	set	0x68, %g3
	stwa	%l6,	[%l7 + %g3] 0x89
loop_16:
	nop
	set	0x68, %i5
	lda	[%l7 + %i5] 0x88,	%f2
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x1F, %g1
	ldsb	[%l7 + %g1],	%g5
	add	%o6,	%l5,	%i6
	or	%l2,	%l1,	%i7
	set	0x5C, %i6
	swapa	[%l7 + %i6] 0x81,	%l3
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x3D, %o4
	ldsb	[%l7 + %o4],	%i0
	nop
	set	0x7E, %o2
	sth	%g3,	[%l7 + %o2]
	nop
	set	0x40, %o1
	lduw	[%l7 + %o1],	%i1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o5
	set	0x44, %i3
	stba	%l4,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x76, %l3
	sth	%g7,	[%l7 + %l3]
	nop
	set	0x40, %l5
	stb	%i2,	[%l7 + %l5]
	nop
	set	0x38, %i7
	stw	%o4,	[%l7 + %i7]
	nop
	set	0x4E, %g7
	ldsb	[%l7 + %g7],	%g2
	nop
	set	0x58, %i0
	std	%f22,	[%l7 + %i0]
	set	0x20, %o7
	stda	%g0,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x24, %g4
	stw	%o3,	[%l7 + %g4]
	nop
	set	0x40, %g6
	stb	%o7,	[%l7 + %g6]
	nop
	set	0x60, %i1
	lduh	[%l7 + %i1],	%o2
	nop
	set	0x2B, %o0
	stb	%g6,	[%l7 + %o0]
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f20
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x88,	%i4
	wr	%g4,	%o0,	%sys_tick
	nop
	set	0x24, %o3
	lduw	[%l7 + %o3],	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%i4
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x30, %o6
	ldstub	[%l7 + %o6],	%i3
	set	0x58, %o5
	sta	%f25,	[%l7 + %o5] 0x80
	nop
	set	0x68, %l0
	stx	%g5,	[%l7 + %l0]
	add	%l5,	%i6,	%o6
	nop
	set	0x68, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x30, %l6
	lda	[%l7 + %l6] 0x80,	%f7
	nop
	set	0x20, %l2
	std	%l0,	[%l7 + %l2]
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x78, %i4
	prefetch	[%l7 + %i4],	 2
	add	%i7,	%l2,	%i0
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%l3
	set	0x70, %g1
	stda	%g2,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x50, %i5
	ldstuba	[%l7 + %i5] 0x80,	%i1
	or	%l0,	%o5,	%g7
	nop
	set	0x29, %i2
	ldsb	[%l7 + %i2],	%i2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f0
	set	0x60, %o2
	stha	%o4,	[%l7 + %o2] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%g1
	set	0x34, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o7
	or	%o2,	%i5,	%g6
	set	0x42, %o4
	stba	%o0,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x1B, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g4
	st	%f22,	[%l7 + 0x4C]
	or	%o1,	%l6,	%i4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%i2
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x22, %l5
	ldub	[%l7 + %l5],	%l5
	fpadd32	%f8,	%f30,	%f14
	nop
	set	0x49, %g7
	ldub	[%l7 + %g7],	%i6
	set	0x38, %i7
	sta	%f10,	[%l7 + %i7] 0x89
	nop
	set	0x11, %i0
	ldub	[%l7 + %i0],	%o6
	nop
	set	0x7E, %o7
	sth	%l1,	[%l7 + %o7]
	wr	%i7,	%g5,	%y
	nop
	set	0x78, %g4
	stx	%l2,	[%l7 + %g4]
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	nop
	set	0x0C, %o0
	ldsw	[%l7 + %o0],	%g3
	nop
	set	0x5D, %g5
	ldstub	[%l7 + %g5],	%l3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%o5
	or	%l0,	%g7,	%l4
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	ld	[%l7 + 0x1C],	%f28
	set	0x40, %l4
	sta	%f30,	[%l7 + %l4] 0x80
	set	0x28, %o5
	stxa	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x88,	%g2
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%g1
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f12
	set	0x68, %l1
	stha	%o7,	[%l7 + %l1] 0xea
	membar	#Sync
	or	%i5,	%g6,	%o2
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%g4
	set	0x38, %i4
	stwa	%l6,	[%l7 + %i4] 0x80
	nop
	set	0x56, %g3
	stb	%i3,	[%l7 + %g3]
	nop
	set	0x70, %g1
	lduw	[%l7 + %g1],	%l5
	add	%i4,	%i6,	%l1
	fpsub32	%f12,	%f10,	%f4
	set	0x3E, %i5
	stba	%i7,	[%l7 + %i5] 0xea
	membar	#Sync
	bge,a	%icc,	loop_17
	nop
	set	0x58, %i6
	std	%o6,	[%l7 + %i6]
	set	0x40, %o2
	prefetcha	[%l7 + %o2] 0x80,	 3
loop_17:
	nop
	set	0x10, %i2
	swap	[%l7 + %i2],	%l2
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%g2
	set	0x28, %l3
	stda	%l2,	[%l7 + %l3] 0x89
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%o5
	nop
	set	0x64, %g7
	swap	[%l7 + %g7],	%i0
	bg,a,pt	%icc,	loop_18
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%l0
	set	0x58, %l5
	stxa	%l4,	[%l7 + %l5] 0x89
loop_18:
	ld	[%l7 + 0x54],	%f13
	nop
	set	0x68, %i0
	ldsw	[%l7 + %i0],	%i2
	set	0x38, %g4
	stha	%g7,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%o2
	set	0x52, %g6
	stba	%g2,	[%l7 + %g6] 0x80
	nop
	set	0x54, %o0
	lduw	[%l7 + %o0],	%g1
	set	0x70, %g5
	lda	[%l7 + %g5] 0x88,	%f18
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f0
	ld	[%l7 + 0x2C],	%f4
	nop
	set	0x10, %o3
	sth	%o7,	[%l7 + %o3]
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x89,	%f27
	nop
	set	0x0F, %l4
	ldstub	[%l7 + %l4],	%i5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xcc
	nop
	set	0x32, %l6
	ldub	[%l7 + %l6],	%o4
	set	0x4E, %l0
	stha	%o2,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f0
	set	0x58, %l2
	ldstuba	[%l7 + %l2] 0x81,	%g6
	be,a,pt	%xcc,	loop_19
	nop
	set	0x50, %g2
	std	%o0,	[%l7 + %g2]
	ba,a,pn	%icc,	loop_20
	fpsub32	%f2,	%f8,	%f24
loop_19:
	nop
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xcc
loop_20:
	nop
	set	0x52, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g4
	and	%l6,	%o0,	%l5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%i4
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x0E, %i5
	ldstub	[%l7 + %i5],	%i7
	set	0x72, %i6
	stba	%o6,	[%l7 + %i6] 0x80
	fpsub32s	%f26,	%f12,	%f29
	nop
	set	0x58, %o2
	stw	%l1,	[%l7 + %o2]
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xe2,	%g4
	nop
	set	0x38, %o1
	lduw	[%l7 + %o1],	%l2
	set	0x74, %i2
	sta	%f0,	[%l7 + %i2] 0x81
	nop
	set	0x48, %l3
	stx	%g3,	[%l7 + %l3]
	set	0x7D, %i3
	stba	%i1,	[%l7 + %i3] 0x89
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%l3
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0
	nop
	set	0x1A, %i0
	ldub	[%l7 + %i0],	%l0
	nop
	set	0x1D, %g7
	ldsb	[%l7 + %g7],	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%i2
	bge,a	%xcc,	loop_21
	fpsub16s	%f19,	%f26,	%f27
	ld	[%l7 + 0x10],	%f22
	nop
	set	0x7A, %o7
	ldsh	[%l7 + %o7],	%o3
loop_21:
	nop
	set	0x68, %g4
	stda	%g6,	[%l7 + %g4] 0x88
	nop
	set	0x68, %g6
	std	%g2,	[%l7 + %g6]
	st	%f6,	[%l7 + 0x58]
	nop
	set	0x68, %g5
	std	%o6,	[%l7 + %g5]
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%g1
	set	0x50, %o3
	stda	%o4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x2C, %o6
	ldstub	[%l7 + %o6],	%i5
	nop
	set	0x67, %i1
	ldsb	[%l7 + %i1],	%g6
	st	%fsr,	[%l7 + 0x68]
	wr	%o1,	%g4,	%sys_tick
	nop
	set	0x1E, %l4
	ldub	[%l7 + %l4],	%o2
	st	%f3,	[%l7 + 0x70]
	nop
	set	0x40, %l6
	sth	%o0,	[%l7 + %l6]
	nop
	set	0x78, %o5
	lduh	[%l7 + %o5],	%l6
	set	0x58, %l0
	stxa	%l5,	[%l7 + %l0] 0x81
	nop
	set	0x70, %l2
	lduh	[%l7 + %l2],	%i4
	nop
	set	0x5C, %l1
	lduh	[%l7 + %l1],	%i6
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i3
	set	0x70, %g2
	ldstuba	[%l7 + %g2] 0x80,	%o6
	nop
	set	0x7D, %g1
	stb	%l1,	[%l7 + %g1]
	nop
	set	0x33, %i5
	ldstub	[%l7 + %i5],	%g5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%l2
	add	%i7,	%i1,	%g3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f0
	nop
	set	0x60, %i6
	ldsb	[%l7 + %i6],	%l3
	set	0x4E, %o4
	ldstuba	[%l7 + %o4] 0x81,	%l0
	nop
	set	0x20, %i2
	std	%f0,	[%l7 + %i2]
	or	%i0,	%l4,	%o5
	set	0x54, %l3
	sta	%f28,	[%l7 + %l3] 0x81
	nop
	set	0x28, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%i2
	set	0x20, %l5
	stxa	%o3,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x6C, %i0
	lduh	[%l7 + %i0],	%g2
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%o7
	set	0x24, %o7
	stwa	%g1,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%o4
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%g7
	add	%g6,	%i5,	%o1
	nop
	nop
	setx	0xE665A56D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x1008F0F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f6,	%f18
	nop
	nop
	setx	0x50206B439464C48B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x53A272CBC90A289F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f4,	%f2
	nop
	set	0x48, %g5
	std	%f2,	[%l7 + %g5]
	set	0x44, %g6
	stwa	%o2,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f0
	nop
	set	0x2E, %o0
	sth	%g4,	[%l7 + %o0]
	nop
	set	0x6E, %o6
	ldsh	[%l7 + %o6],	%o0
	nop
	set	0x25, %l4
	ldstub	[%l7 + %l4],	%l5
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xeb,	%i4
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x3C, %l0
	sta	%f2,	[%l7 + %l0] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i3
	nop
	set	0x72, %l2
	ldub	[%l7 + %l2],	%l6
	or	%l1,	%g5,	%l2
	set	0x18, %i4
	stda	%o6,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f0
	set	0x67, %g1
	stba	%i1,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x10, %l1
	lda	[%l7 + %l1] 0x81,	%f10
	add	%i7,	%g3,	%l3
	nop
	set	0x78, %g3
	lduh	[%l7 + %g3],	%l0
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	set	0x14, %i6
	lda	[%l7 + %i6] 0x80,	%f19
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%o4
	set	0x16, %o4
	stha	%i0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x60, %l3
	stx	%o3,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x14]
	or	%g2,	%i2,	%o7
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%g0
	add	%g7,	%o4,	%i5
	nop
	set	0x60, %o1
	swap	[%l7 + %o1],	%o1
	nop
	set	0x4E, %i3
	ldsb	[%l7 + %i3],	%o2
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x88,	 0
	st	%f8,	[%l7 + 0x44]
	ba,pn	%xcc,	loop_22
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%o0
	set	0x28, %o7
	stwa	%l5,	[%l7 + %o7] 0x88
loop_22:
	nop
	set	0x1C, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f16
	nop
	set	0x30, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f16
	set	0x20, %i7
	stha	%i4,	[%l7 + %i7] 0xe2
	membar	#Sync
	ld	[%l7 + 0x38],	%f23
	set	0x0B, %o3
	stba	%i6,	[%l7 + %o3] 0x89
	nop
	set	0x2C, %o6
	sth	%i3,	[%l7 + %o6]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xda
	set	0x20, %l6
	lda	[%l7 + %l6] 0x89,	%f21
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%i6
	and	%l1,	%g5,	%o6
	set	0x6C, %o5
	lda	[%l7 + %o5] 0x80,	%f16
	set	0x10, %l0
	lda	[%l7 + %l0] 0x80,	%f28
	set	0x18, %i1
	lda	[%l7 + %i1] 0x89,	%f20
	set	0x08, %l2
	stda	%l2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%i6
	nop
	set	0x78, %i4
	stw	%i1,	[%l7 + %i4]
	nop
	set	0x3C, %l1
	ldsh	[%l7 + %l1],	%g3
	nop
	set	0x30, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x6E, %i5
	sth	%l3,	[%l7 + %i5]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc2
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x88,	%l4
	nop
	set	0x6E, %o4
	sth	%o5,	[%l7 + %o4]
	fpadd32	%f24,	%f8,	%f4
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x81,	%l0
	nop
	set	0x70, %i6
	prefetch	[%l7 + %i6],	 1
	ld	[%l7 + 0x38],	%f1
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe2,	%i0
	add	%g2,	%i2,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%g7
	add	%o4,	%g1,	%o1
	st	%f31,	[%l7 + 0x08]
	set	0x20, %i3
	stxa	%i5,	[%l7 + %i3] 0x80
	nop
	set	0x24, %l5
	swap	[%l7 + %l5],	%o2
	set	0x08, %o1
	stda	%o0,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f24
	set	0x08, %g7
	stda	%l4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x70, %g4
	stxa	%g4,	[%l7 + %g4] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	set	0x44, %o7
	stwa	%i4,	[%l7 + %o7] 0x81
	st	%f1,	[%l7 + 0x48]
	fpsub32s	%f27,	%f12,	%f2
	nop
	set	0x40, %g5
	stx	%i6,	[%l7 + %g5]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%g6
	st	%f13,	[%l7 + 0x78]
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x6C, %o3
	swapa	[%l7 + %o3] 0x80,	%l6
	nop
	set	0x64, %o6
	ldub	[%l7 + %o6],	%l1
	add	%o6,	%l2,	%i7
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%i1
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x81,	%g3
	nop
	set	0x76, %l4
	stb	%l3,	[%l7 + %l4]
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xe3,	%g4
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x88,	%l4
	set	0x24, %i1
	lda	[%l7 + %i1] 0x80,	%f8
	st	%fsr,	[%l7 + 0x58]
	set	0x5C, %l0
	swapa	[%l7 + %l0] 0x81,	%l0
	bge,a	%xcc,	loop_23
	nop
	set	0x54, %l2
	prefetch	[%l7 + %l2],	 3
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%o5
loop_23:
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%i0
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%g2
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x70, %g1
	ldsh	[%l7 + %g1],	%i2
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xe2,	%o6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g7
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f0
	fpadd16s	%f6,	%f7,	%f28
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%g1
	st	%fsr,	[%l7 + 0x70]
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x88,	 4
	nop
	set	0x48, %l3
	std	%o4,	[%l7 + %l3]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x81
	nop
	set	0x50, %i3
	stx	%o2,	[%l7 + %i3]
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x81,	%i5
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%l5
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x81,	 3
	nop
	set	0x68, %g4
	stx	%i4,	[%l7 + %g4]
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x89,	%g4
	nop
	set	0x6C, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x46, %i7
	stb	%i6,	[%l7 + %i7]
	set	0x78, %o3
	stda	%i2,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%g6
	nop
	set	0x6C, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x3D, %l6
	stba	%l1,	[%l7 + %l6] 0x88
	nop
	set	0x3E, %l4
	sth	%l6,	[%l7 + %l4]
	set	0x36, %o0
	stha	%o6,	[%l7 + %o0] 0x80
	ld	[%l7 + 0x5C],	%f28
	nop
	set	0x1E, %o5
	ldub	[%l7 + %o5],	%l2
	nop
	set	0x14, %i1
	stb	%i1,	[%l7 + %i1]
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	set	0x48, %o6
	stxa	%i7,	[%l7 + %o6] 0x81
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x88,	%l3
	set	0x38, %l1
	stxa	%l4,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x80,	%g5
	nop
	set	0x40, %i5
	swap	[%l7 + %i5],	%l0
	nop
	set	0x54, %g1
	lduw	[%l7 + %g1],	%i0
	nop
	set	0x54, %l2
	ldsb	[%l7 + %l2],	%g2
	ld	[%l7 + 0x18],	%f15
	nop
	set	0x3D, %o2
	ldub	[%l7 + %o2],	%o5
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x89,	%o6
	wr 	%g0, 	0x5, 	%fprs
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xda
	set	0x40, %o4
	stxa	%g1,	[%l7 + %o4] 0x80
	nop
	set	0x34, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x80,	%g7
	set	0x08, %l3
	stda	%o4,	[%l7 + %l3] 0x88
	bl,pn	%icc,	loop_24
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f30
	or	%o1,	%o2,	%i5
	or	%l5,	%i4,	%g4
loop_24:
	nop
	set	0x70, %l5
	ldsb	[%l7 + %l5],	%o0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f16
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f14
	nop
	set	0x2C, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x38, %i7
	swap	[%l7 + %i7],	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%i6
	set	0x34, %o3
	stwa	%l6,	[%l7 + %o3] 0x89
	nop
	set	0x48, %g4
	ldsw	[%l7 + %g4],	%o6
	nop
	set	0x28, %g6
	stw	%l2,	[%l7 + %g6]
	bgu,a,pn	%xcc,	loop_25
	nop
	set	0x1C, %l6
	stw	%l1,	[%l7 + %l6]
	nop
	set	0x10, %g5
	std	%g2,	[%l7 + %g5]
	nop
	set	0x48, %l4
	sth	%i1,	[%l7 + %l4]
loop_25:
	or	%l3,	%l4,	%i7
	nop
	set	0x34, %o0
	swap	[%l7 + %o0],	%l0
	nop
	set	0x34, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x08, %i1
	stwa	%g5,	[%l7 + %i1] 0x89
	nop
	set	0x2C, %o6
	stb	%i0,	[%l7 + %o6]
	set	0x10, %g2
	ldstuba	[%l7 + %g2] 0x80,	%o5
	set	0x70, %l1
	stda	%o6,	[%l7 + %l1] 0x89
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xca
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x81
	or	%g2,	%i2,	%o3
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%g7
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f30
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%o4
	nop
	set	0x20, %g3
	sth	%g1,	[%l7 + %g3]
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%l5
	nop
	set	0x3A, %i2
	sth	%i4,	[%l7 + %i2]
	nop
	set	0x29, %o4
	stb	%g4,	[%l7 + %o4]
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x89,	%i5
	nop
	set	0x08, %l3
	swap	[%l7 + %l3],	%o0
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	nop
	set	0x14, %o1
	swap	[%l7 + %o1],	%g6
	set	0x18, %o7
	stxa	%i6,	[%l7 + %o7] 0x88
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%l2
	nop
	set	0x50, %i0
	lduh	[%l7 + %i0],	%l1
	set	0x0C, %g7
	lda	[%l7 + %g7] 0x80,	%f15
	bl,pt	%icc,	loop_26
	bg,a,pt	%icc,	loop_27
	nop
	set	0x64, %i7
	stw	%g3,	[%l7 + %i7]
	nop
	set	0x10, %o3
	stx	%l6,	[%l7 + %o3]
loop_26:
	nop
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f16
loop_27:
	nop
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	nop
	set	0x45, %g5
	ldstub	[%l7 + %g5],	%i1
	bge,a,pn	%icc,	loop_28
	nop
	set	0x57, %l4
	ldsb	[%l7 + %l4],	%l3
	nop
	set	0x40, %o0
	stx	%i7,	[%l7 + %o0]
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 0
loop_28:
	nop
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x80,	%l4
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x18, %l0
	std	%f8,	[%l7 + %l0]
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%g5,	%l0,	%i0
	nop
	set	0x48, %o6
	prefetch	[%l7 + %o6],	 1
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x89,	%o4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd0,	%f0
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x80
	fpadd32s	%f28,	%f1,	%f4
	nop
	set	0x1C, %i5
	ldub	[%l7 + %i5],	%o7
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x81,	%i2
	and	%g2,	%g7,	%o4
	ld	[%l7 + 0x4C],	%f24
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%o2
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf8
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x70, %o4
	lduh	[%l7 + %o4],	%l5
	nop
	set	0x38, %i3
	ldsb	[%l7 + %i3],	%i4
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%g4
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x88,	 4
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x81,	%i2
	ld	[%l7 + 0x14],	%f1
	nop
	set	0x4D, %l3
	ldstub	[%l7 + %l3],	%g6
	add	%i6,	%o6,	%o0
	set	0x70, %g7
	stda	%l2,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x18, %i0
	lduh	[%l7 + %i0],	%g3
	set	0x60, %o3
	sta	%f29,	[%l7 + %o3] 0x89
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x80,	%l0
	add	%l6,	%i1,	%i7
	wr	%l3,	%g5,	%y
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%l4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x08, %g5
	swap	[%l7 + %g5],	%i0
	nop
	set	0x34, %l4
	swap	[%l7 + %l4],	%l0
	nop
	set	0x0C, %g6
	ldstub	[%l7 + %g6],	%o5
	ld	[%l7 + 0x38],	%f31
	st	%f27,	[%l7 + 0x30]
	fpadd32	%f22,	%f14,	%f12
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%f16
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	set	0x08, %o0
	sta	%f20,	[%l7 + %o0] 0x88
	bge	%icc,	loop_29
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%i2
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f8
	bl,a,pn	%xcc,	loop_30
loop_29:
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%g2
	set	0x60, %g2
	stwa	%o4,	[%l7 + %g2] 0x89
loop_30:
	nop
	set	0x0E, %l1
	ldstub	[%l7 + %l1],	%g7
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%g1
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%o3
	nop
	set	0x08, %o2
	lduw	[%l7 + %o2],	%o2
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe3,	%i4
	set	0x34, %g1
	stba	%g4,	[%l7 + %g1] 0x88
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	bleu,a	%xcc,	loop_31
	and	%l5,	%i5,	%o1
	nop
	set	0x56, %i6
	stb	%g6,	[%l7 + %i6]
	set	0x20, %o4
	stda	%i6,	[%l7 + %o4] 0xe2
	membar	#Sync
loop_31:
	nop
	set	0x60, %i2
	ldda	[%l7 + %i2] 0x88,	%i2
	set	0x54, %i3
	stwa	%o0,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x5C, %o1
	lda	[%l7 + %o1] 0x80,	%f2
	nop
	set	0x60, %o7
	stx	%l2,	[%l7 + %o7]
	add	%g3,	%o6,	%l1
	ld	[%l7 + 0x1C],	%f28
	set	0x38, %l3
	swapa	[%l7 + %l3] 0x80,	%l6
	nop
	set	0x56, %g7
	ldstub	[%l7 + %g7],	%i7
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf9
	membar	#Sync
	or	%l3,	%i1,	%g5
	set	0x4E, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l4
	set	0x18, %o3
	stda	%i0,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x40, %g4
	stx	%o5,	[%l7 + %g4]
	set	0x2C, %g5
	sta	%f17,	[%l7 + %g5] 0x88
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%o7
	nop
	set	0x6E, %i7
	ldsb	[%l7 + %i7],	%l0
	add	%g2,	%i2,	%g7
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd8
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f0
	nop
	set	0x74, %g6
	ldsb	[%l7 + %g6],	%g1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%o2
	wr 	%g0, 	0x5, 	%fprs
	st	%fsr,	[%l7 + 0x5C]
	add	%g4,	%l5,	%i5
	nop
	set	0x60, %l0
	std	%f8,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x44]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%i6
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xeb,	%o0
	set	0x10, %o0
	ldstuba	[%l7 + %o0] 0x80,	%i3
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x81,	%f6
	nop
	nop
	setx	0xC01B3FFD484AB425,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4639BCFB2F03FE3E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f16
	nop
	set	0x45, %l1
	stb	%o0,	[%l7 + %l1]
	set	0x14, %i1
	lda	[%l7 + %i1] 0x80,	%f2
	set	0x58, %i5
	swapa	[%l7 + %i5] 0x81,	%g3
	add	%o6,	%l1,	%l6
	nop
	set	0x24, %i4
	stb	%i7,	[%l7 + %i4]
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xea,	%l2
	nop
	set	0x18, %g3
	swap	[%l7 + %g3],	%l3
	nop
	set	0x5E, %l2
	ldsh	[%l7 + %l2],	%g5
	nop
	set	0x40, %i6
	std	%f2,	[%l7 + %i6]
	nop
	set	0x78, %o4
	sth	%i1,	[%l7 + %o4]
	nop
	set	0x44, %g1
	lduh	[%l7 + %g1],	%i0
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%o4
	set	0x20, %o7
	sta	%f23,	[%l7 + %o7] 0x89
	or	%o7,	%l4,	%g2
	set	0x0C, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i2
	nop
	set	0x1A, %g7
	ldsh	[%l7 + %g7],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%g7
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%o2
	st	%fsr,	[%l7 + 0x10]
	set	0x63, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o2
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x88,	%i4
	set	0x50, %g4
	stxa	%g4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x44, %g5
	stw	%o4,	[%l7 + %g5]
	nop
	set	0x30, %l4
	std	%f0,	[%l7 + %l4]
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f8
	ld	[%l7 + 0x58],	%f6
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f24
	set	0x70, %l6
	stxa	%i5,	[%l7 + %l6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x50],	%f29
	nop
	set	0x65, %g6
	ldstub	[%l7 + %g6],	%l5
	nop
	set	0x48, %l0
	lduh	[%l7 + %l0],	%g6
	nop
	set	0x77, %o6
	ldub	[%l7 + %o6],	%i6
	st	%f5,	[%l7 + 0x7C]
	nop
	set	0x2A, %o5
	lduh	[%l7 + %o5],	%o1
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x57, %o0
	ldstub	[%l7 + %o0],	%o0
	nop
	set	0x78, %i1
	sth	%i3,	[%l7 + %i1]
	nop
	set	0x0C, %i5
	ldsw	[%l7 + %i5],	%g3
	nop
	set	0x24, %i4
	stw	%l1,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x38, %o2
	stx	%l6,	[%l7 + %o2]
	nop
	set	0x28, %l1
	ldsb	[%l7 + %l1],	%i7
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x89,	%o6
	set	0x28, %g3
	stwa	%l2,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x6C, %i6
	ldsb	[%l7 + %i6],	%l3
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x88,	%g5
	nop
	set	0x5B, %o4
	ldstub	[%l7 + %o4],	%i0
	nop
	set	0x50, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x81,	 3
	nop
	set	0x10, %l3
	ldsh	[%l7 + %l3],	%o5
	nop
	set	0x37, %o7
	ldstub	[%l7 + %o7],	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i2
	set	0x48, %i2
	lda	[%l7 + %i2] 0x80,	%f25
	wr	%l0,	%o7,	%pic
	nop
	set	0x73, %l5
	ldub	[%l7 + %l5],	%g1
	nop
	set	0x48, %o3
	lduh	[%l7 + %o3],	%o3
	nop
	set	0x48, %g4
	stx	%g7,	[%l7 + %g4]
	add	%i4,	%o2,	%o4
	set	0x20, %g7
	sta	%f24,	[%l7 + %g7] 0x89
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xeb,	%g4
	st	%fsr,	[%l7 + 0x10]
	or	%l5,	%g6,	%i6
	nop
	set	0x68, %i7
	std	%o0,	[%l7 + %i7]
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x81,	 4
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%i2
	set	0x58, %g6
	stda	%g2,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x33, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o0
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	nop
	set	0x3C, %o5
	ldub	[%l7 + %o5],	%l6
	add	%i7,	%o6,	%l2
	nop
	set	0x30, %g2
	std	%l2,	[%l7 + %g2]
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%g5
	nop
	set	0x17, %o6
	ldsb	[%l7 + %o6],	%i1
	nop
	set	0x60, %i1
	std	%f2,	[%l7 + %i1]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i0
	ld	[%l7 + 0x58],	%f7
	set	0x30, %i5
	stda	%g2,	[%l7 + %i5] 0x81
	set	0x3C, %o2
	sta	%f14,	[%l7 + %o2] 0x81
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%l4
	nop
	set	0x30, %i4
	stb	%l0,	[%l7 + %i4]
	nop
	set	0x68, %g3
	stx	%o7,	[%l7 + %g3]
	nop
	set	0x0C, %l2
	sth	%g1,	[%l7 + %l2]
	nop
	set	0x36, %i6
	ldsh	[%l7 + %i6],	%i2
	ld	[%l7 + 0x44],	%f16
	set	0x2C, %g1
	swapa	[%l7 + %g1] 0x81,	%g7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xda,	%f0
	set	0x50, %o1
	stda	%o2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x78, %i3
	stxa	%o2,	[%l7 + %i3] 0x80
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	nop
	set	0x44, %i2
	ldub	[%l7 + %i2],	%o4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f16
	nop
	set	0x68, %o3
	prefetch	[%l7 + %o3],	 3
	st	%fsr,	[%l7 + 0x5C]
	nop
	nop
	setx	0x7352BE59E4970934,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2ECB7C8F102107A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f24
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x88
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	set	0x68, %g5
	ldxa	[%l7 + %g5] 0x81,	%g4
	set	0x54, %i0
	stwa	%i4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x36, %i7
	ldsb	[%l7 + %i7],	%l5
	set	0x38, %g6
	lda	[%l7 + %g6] 0x81,	%f22
	nop
	set	0x18, %l4
	std	%g6,	[%l7 + %l4]
	nop
	set	0x08, %l0
	stx	%o1,	[%l7 + %l0]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f16
	nop
	set	0x40, %o5
	stx	%i6,	[%l7 + %o5]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%g3
	nop
	set	0x30, %g2
	sth	%o0,	[%l7 + %g2]
	nop
	set	0x56, %o0
	ldsh	[%l7 + %o0],	%l1
	fpadd32	%f6,	%f12,	%f14
	set	0x44, %o6
	lda	[%l7 + %o6] 0x81,	%f25
	set	0x68, %i1
	stda	%i2,	[%l7 + %i1] 0x88
	add	%l6,	%o6,	%l2
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x88,	%i6
	set	0x20, %i5
	stda	%g4,	[%l7 + %i5] 0x89
	set	0x50, %i4
	stxa	%l3,	[%l7 + %i4] 0xe3
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%i0
	set	0x1E, %l1
	stha	%i1,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x2E, %g3
	ldub	[%l7 + %g3],	%l4
	set	0x44, %l2
	lda	[%l7 + %l2] 0x81,	%f8
	ba	%icc,	loop_32
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%g2
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x88,	%l0
loop_32:
	nop
	set	0x20, %o1
	stw	%o7,	[%l7 + %o1]
	st	%f2,	[%l7 + 0x1C]
	st	%f22,	[%l7 + 0x4C]
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%i2
	nop
	set	0x58, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x10, %i2
	lduh	[%l7 + %i2],	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%g7
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f0
	st	%fsr,	[%l7 + 0x30]
	set	0x18, %o3
	stda	%o4,	[%l7 + %o3] 0x88
	nop
	set	0x4C, %l5
	stw	%g4,	[%l7 + %l5]
	nop
	set	0x16, %g7
	stb	%i4,	[%l7 + %g7]
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%o2
	set	0x0C, %l3
	stha	%g6,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x54, %g5
	stha	%l5,	[%l7 + %g5] 0xea
	membar	#Sync
	add	%i6,	%i5,	%g3
	set	0x24, %i7
	sta	%f10,	[%l7 + %i7] 0x88
	be,a,pt	%icc,	loop_33
	nop
	set	0x76, %i0
	lduh	[%l7 + %i0],	%o1
	nop
	set	0x3C, %g6
	stw	%l1,	[%l7 + %g6]
	set	0x7C, %l4
	stha	%i3,	[%l7 + %l4] 0x80
loop_33:
	nop
	set	0x7C, %l6
	stwa	%l6,	[%l7 + %l6] 0x80
	set	0x48, %l0
	stxa	%o0,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x46, %g2
	sth	%l2,	[%l7 + %g2]
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%i7
	nop
	set	0x38, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x08, %o6
	stwa	%g5,	[%l7 + %o6] 0x81
	nop
	set	0x0C, %o2
	swap	[%l7 + %o2],	%l3
	set	0x38, %i1
	stwa	%o6,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x4F, %i4
	stb	%i0,	[%l7 + %i4]
	nop
	set	0x50, %i5
	std	%f18,	[%l7 + %i5]
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xca
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%o4
	bge,a,pt	%icc,	loop_34
	st	%f11,	[%l7 + 0x68]
	nop
	set	0x78, %o4
	stw	%l4,	[%l7 + %o4]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
loop_34:
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%i0
	nop
	set	0x48, %i3
	sth	%g2,	[%l7 + %i3]
	add	%l0,	%i2,	%g1
	set	0x78, %i2
	stda	%o6,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x25, %o3
	ldub	[%l7 + %o3],	%g7
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%f12
	set	0x60, %g7
	stxa	%o4,	[%l7 + %g7] 0x88
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x18, %g4
	std	%o2,	[%l7 + %g4]
	set	0x44, %o7
	stwa	%i4,	[%l7 + %o7] 0x80
	nop
	set	0x64, %g5
	ldsw	[%l7 + %g5],	%o2
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f8
	add	%g4,	%g6,	%i6
	set	0x20, %i7
	stda	%i4,	[%l7 + %i7] 0x88
	bl,a,pt	%icc,	loop_35
	ld	[%l7 + 0x58],	%f8
	or	%l5,	%g3,	%l1
	nop
	set	0x28, %g6
	std	%o0,	[%l7 + %g6]
loop_35:
	nop
	set	0x48, %i0
	lduw	[%l7 + %i0],	%l6
	ld	[%l7 + 0x40],	%f15
	nop
	set	0x17, %l4
	ldub	[%l7 + %l4],	%i3
	nop
	set	0x64, %l0
	stw	%l2,	[%l7 + %l0]
	nop
	set	0x21, %l6
	stb	%o0,	[%l7 + %l6]
	ld	[%l7 + 0x34],	%f10
	nop
	set	0x4A, %o5
	sth	%g5,	[%l7 + %o5]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%o6
	or	%i7,	%i0,	%l4
	set	0x0A, %g2
	stba	%i1,	[%l7 + %g2] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%g2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%l0
	nop
	set	0x72, %o6
	ldub	[%l7 + %o6],	%o7
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%g6
	nop
	set	0x58, %o0
	stw	%g1,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x5C]
	set	0x21, %i1
	stba	%o3,	[%l7 + %i1] 0x81
	nop
	set	0x30, %i5
	std	%f22,	[%l7 + %i5]
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x88,	%o4
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%i4
	set	0x74, %l1
	stba	%o2,	[%l7 + %l1] 0x80
	nop
	set	0x70, %i6
	lduh	[%l7 + %i6],	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x1C, %o4
	ldsh	[%l7 + %o4],	%l5
	st	%f17,	[%l7 + 0x10]
	set	0x40, %g3
	stxa	%i5,	[%l7 + %g3] 0x81
	nop
	set	0x30, %g1
	ldsw	[%l7 + %g1],	%g3
	nop
	set	0x0C, %i2
	ldsh	[%l7 + %i2],	%l1
	st	%fsr,	[%l7 + 0x60]
	set	0x08, %i3
	swapa	[%l7 + %i3] 0x89,	%l6
	set	0x18, %o1
	stwa	%o1,	[%l7 + %o1] 0x89
	nop
	set	0x4E, %o3
	stb	%l2,	[%l7 + %o3]
	nop
	set	0x70, %g7
	prefetch	[%l7 + %g7],	 4
	nop
	set	0x28, %g4
	swap	[%l7 + %g4],	%o0
	nop
	set	0x79, %l5
	stb	%g5,	[%l7 + %l5]
	nop
	set	0x10, %g5
	stx	%l3,	[%l7 + %g5]
	nop
	set	0x54, %l3
	lduw	[%l7 + %l3],	%i3
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%i7
	st	%f7,	[%l7 + 0x10]
	nop
	set	0x28, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x81,	%f17
	set	0x61, %i7
	stba	%i0,	[%l7 + %i7] 0x81
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xda
	set	0x64, %l4
	sta	%f5,	[%l7 + %l4] 0x88
	nop
	set	0x4C, %o5
	ldsh	[%l7 + %o5],	%l4
	nop
	set	0x20, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	nop
	setx	0xE5103BAE016C0C2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x832AE375D3CC2CA8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f2,	%f30
	nop
	set	0x50, %o6
	ldsw	[%l7 + %o6],	%i1
	nop
	set	0x1C, %o2
	ldub	[%l7 + %o2],	%o6
	nop
	set	0x1E, %o0
	sth	%o5,	[%l7 + %o0]
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	or	%i2,	%g2,	%l0
	add	%o7,	%g1,	%g7
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x89,	%o4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f0
	or	%i4,	%o3,	%o2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f16
	nop
	set	0x6E, %i4
	ldsh	[%l7 + %i4],	%g6
	st	%fsr,	[%l7 + 0x58]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x81
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%g4
	set	0x68, %g3
	stha	%i6,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x0A, %i6
	sth	%i5,	[%l7 + %i6]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x78, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x81,	%g3
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x81,	%l5
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x80,	%i6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%o1
	set	0x48, %g7
	stxa	%o0,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x5C, %g4
	stwa	%l2,	[%l7 + %g4] 0x80
	st	%f21,	[%l7 + 0x64]
	set	0x40, %l5
	stxa	%g5,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x6C, %l3
	stha	%l3,	[%l7 + %l3] 0x89
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%i6
	wr	%i3,	%i0,	%set_softint
	fpsub32	%f10,	%f8,	%f14
	nop
	set	0x7E, %g6
	ldstub	[%l7 + %g6],	%l4
	and	%o6,	%o5,	%i1
	nop
	set	0x28, %o7
	swap	[%l7 + %o7],	%g2
	ld	[%l7 + 0x08],	%f11
	nop
	set	0x74, %i7
	ldub	[%l7 + %i7],	%l0
	nop
	set	0x1D, %l0
	ldsb	[%l7 + %l0],	%o7
	nop
	set	0x18, %l4
	lduw	[%l7 + %l4],	%i2
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x70, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x38, %g2
	std	%g6,	[%l7 + %g2]
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%g1
	set	0x2E, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i4
	and	%o4,	%o2,	%g6
	nop
	set	0x68, %o2
	ldsw	[%l7 + %o2],	%o3
	nop
	set	0x68, %o0
	std	%f6,	[%l7 + %o0]
	set	0x7F, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g4
	set	0x38, %i1
	stxa	%i6,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%i5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%l5
	fpsub32	%f14,	%f18,	%f26
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o1
	wr	%o0,	%l1,	%y
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f16
	nop
	set	0x5C, %i4
	ldsh	[%l7 + %i4],	%l2
	set	0x34, %l1
	sta	%f30,	[%l7 + %l1] 0x81
	nop
	set	0x58, %o4
	sth	%l3,	[%l7 + %o4]
	nop
	set	0x72, %i6
	ldsh	[%l7 + %i6],	%i7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1255
!	Type a   	: 24
!	Type cti   	: 35
!	Type x   	: 552
!	Type f   	: 33
!	Type i   	: 101
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
	set	0xE,	%g2
	set	0xB,	%g3
	set	0xB,	%g4
	set	0x0,	%g5
	set	0x0,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0x5,	%i3
	set	-0x8,	%i4
	set	-0x7,	%i5
	set	-0x9,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x1CFDD169,	%l0
	set	0x4A1FFC4C,	%l1
	set	0x69809528,	%l2
	set	0x78D5CDA0,	%l3
	set	0x0CDBECD8,	%l4
	set	0x55AA8CF8,	%l5
	set	0x75F9C922,	%l6
	!# Output registers
	set	0x0F8C,	%o0
	set	-0x0957,	%o1
	set	0x0792,	%o2
	set	-0x1C43,	%o3
	set	0x14C3,	%o4
	set	-0x03C4,	%o5
	set	-0x1A4E,	%o6
	set	-0x0153,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x88,	%g5
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x89,	%i0
	set	0x30, %o1
	stda	%i2,	[%l7 + %o1] 0x88
	nop
	set	0x74, %i2
	stb	%o6,	[%l7 + %i2]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f0
	nop
	set	0x69, %g7
	stb	%l4,	[%l7 + %g7]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x80,	%o5
	or	%g2,	%l0,	%i1
	nop
	set	0x1E, %g4
	ldstub	[%l7 + %g4],	%o7
	nop
	set	0x68, %l3
	stw	%g7,	[%l7 + %l3]
	nop
	set	0x20, %l5
	stw	%i2,	[%l7 + %l5]
	nop
	set	0x20, %g5
	ldsb	[%l7 + %g5],	%i4
	set	0x3C, %g6
	swapa	[%l7 + %g6] 0x89,	%o4
	nop
	set	0x48, %i7
	swap	[%l7 + %i7],	%o2
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	fpadd32s	%f17,	%f31,	%f4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xda
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%g1
	nop
	set	0x60, %l4
	stx	%g6,	[%l7 + %l4]
	nop
	set	0x60, %o5
	swap	[%l7 + %o5],	%g4
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%i6
	nop
	set	0x50, %o6
	stx	%o3,	[%l7 + %o6]
	nop
	set	0x5C, %o2
	stb	%g3,	[%l7 + %o2]
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x80,	%l4
	nop
	set	0x10, %i1
	std	%i4,	[%l7 + %i1]
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%l6
	fpadd32s	%f15,	%f1,	%f22
	nop
	set	0x2A, %l2
	lduh	[%l7 + %l2],	%o0
	set	0x10, %i4
	lda	[%l7 + %i4] 0x88,	%f18
	set	0x1F, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l1
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x89,	 1
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x80,	 2
	nop
	set	0x66, %g3
	stb	%i7,	[%l7 + %g3]
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x89,	%g5
	set	0x54, %o4
	stha	%i0,	[%l7 + %o4] 0xe2
	membar	#Sync
	fpadd32s	%f4,	%f29,	%f29
	nop
	set	0x20, %o1
	std	%f12,	[%l7 + %o1]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd8
	nop
	set	0x68, %g7
	stx	%l3,	[%l7 + %g7]
	ld	[%l7 + 0x6C],	%f9
	nop
	set	0x18, %i3
	std	%f6,	[%l7 + %i3]
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f6
	nop
	set	0x38, %o3
	stx	%o6,	[%l7 + %o3]
	st	%f28,	[%l7 + 0x68]
	add	%i3,	%l4,	%g2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xcc
	set	0x60, %l5
	swapa	[%l7 + %l5] 0x81,	%l0
	set	0x40, %g5
	stha	%i1,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x5C, %i7
	swapa	[%l7 + %i7] 0x80,	%o7
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	fpsub16s	%f29,	%f29,	%f29
	set	0x70, %g6
	stxa	%o5,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xd2
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x89,	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%i4
	set	0x5E, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xeb,	%g0
	nop
	set	0x56, %g2
	sth	%g6,	[%l7 + %g2]
	wr 	%g0, 	0x7, 	%fprs
	set	0x40, %o2
	prefetcha	[%l7 + %o2] 0x80,	 2
	st	%fsr,	[%l7 + 0x54]
	or	%g3,	%l5,	%i5
	st	%fsr,	[%l7 + 0x2C]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf1
	membar	#Sync
	set	0x68, %i5
	stxa	%l6,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x2B, %o0
	ldub	[%l7 + %o0],	%o0
	fpadd32s	%f12,	%f5,	%f31
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe2,	%l0
	set	0x40, %l2
	stda	%l2,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x7C, %l1
	sta	%f22,	[%l7 + %l1] 0x89
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%g4
	and	%o1,	%i7,	%i0
	nop
	set	0x15, %l6
	stb	%l3,	[%l7 + %l6]
	set	0x1C, %g3
	swapa	[%l7 + %g3] 0x81,	%g5
	nop
	set	0x08, %g1
	swap	[%l7 + %g1],	%i3
	set	0x30, %i6
	stda	%o6,	[%l7 + %i6] 0x81
	set	0x3F, %o4
	ldstuba	[%l7 + %o4] 0x81,	%g2
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xe3,	%l4
	set	0x30, %o1
	stda	%i0,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x78, %i3
	stx	%l0,	[%l7 + %i3]
	nop
	set	0x0C, %g7
	ldsb	[%l7 + %g7],	%o7
	or	%o5,	%g7,	%i4
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	set	0x12, %l3
	stba	%o4,	[%l7 + %l3] 0x81
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc2
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x81,	%g6
	nop
	set	0x43, %g5
	ldsb	[%l7 + %g5],	%g1
	add	%o2,	%o3,	%i6
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x89,	%g3
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%l5
	set	0x18, %o7
	stxa	%i5,	[%l7 + %o7] 0x89
	be,pt	%xcc,	loop_36
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x18, %l0
	std	%f26,	[%l7 + %l0]
	set	0x5C, %i0
	stwa	%o0,	[%l7 + %i0] 0x88
loop_36:
	or	%l1,	%l6,	%g4
	nop
	set	0x44, %g2
	ldstub	[%l7 + %g2],	%o1
	set	0x16, %o5
	stba	%l2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f16
	nop
	set	0x66, %i5
	sth	%i0,	[%l7 + %i5]
	ld	[%l7 + 0x54],	%f21
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g5
	nop
	set	0x0B, %i1
	ldstub	[%l7 + %i1],	%i7
	nop
	set	0x5C, %l2
	lduw	[%l7 + %l2],	%o6
	nop
	set	0x38, %l1
	swap	[%l7 + %l1],	%i3
	nop
	set	0x34, %o0
	stw	%l4,	[%l7 + %o0]
	or	%g2,	%i1,	%o7
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o4
	st	%fsr,	[%l7 + 0x20]
	ble,a,pn	%xcc,	loop_37
	nop
	set	0x48, %g3
	std	%f22,	[%l7 + %g3]
	nop
	set	0x17, %g1
	ldub	[%l7 + %g1],	%l0
	nop
	set	0x18, %l6
	stx	%i4,	[%l7 + %l6]
loop_37:
	nop
	set	0x78, %i6
	sta	%f16,	[%l7 + %i6] 0x81
	bge,a,pn	%icc,	loop_38
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x34, %o4
	ldsh	[%l7 + %o4],	%g7
	set	0x1C, %o1
	stba	%o4,	[%l7 + %o1] 0xe3
	membar	#Sync
loop_38:
	nop
	set	0x20, %i3
	std	%f22,	[%l7 + %i3]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%i2
	set	0x30, %o3
	stda	%g0,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x60, %g7
	lduw	[%l7 + %g7],	%g6
	and	%o3,	%i6,	%o2
	nop
	set	0x60, %g4
	sth	%l5,	[%l7 + %g4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i5
	nop
	set	0x28, %l5
	std	%f20,	[%l7 + %l5]
	set	0x72, %l3
	stha	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x12, %i7
	lduh	[%l7 + %i7],	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%g4
	nop
	set	0x3B, %g6
	ldsb	[%l7 + %g6],	%o1
	add	%l2,	%i0,	%l3
	nop
	set	0x6A, %o7
	ldsb	[%l7 + %o7],	%g5
	add	%i7,	%i3,	%l4
	nop
	set	0x0F, %l4
	ldstub	[%l7 + %l4],	%o6
	or	%g2,	%o7,	%i1
	nop
	nop
	setx	0x46282EE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x2F2912CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f2,	%f9
	nop
	set	0x6D, %l0
	ldub	[%l7 + %l0],	%o5
	and	%l0,	%i4,	%o4
	and	%g7,	%i2,	%g1
	nop
	set	0x50, %g5
	ldx	[%l7 + %g5],	%g6
	or	%o3,	%o2,	%l5
	nop
	set	0x40, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x56, %i0
	stb	%i6,	[%l7 + %i0]
	and	%g3,	%i5,	%l6
	nop
	set	0x4E, %o2
	lduh	[%l7 + %o2],	%l1
	nop
	set	0x77, %o5
	stb	%g4,	[%l7 + %o5]
	set	0x30, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o0
	nop
	set	0x28, %i1
	std	%f20,	[%l7 + %i1]
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%o1
	nop
	set	0x10, %l2
	lduh	[%l7 + %l2],	%l2
	nop
	set	0x1A, %l1
	lduh	[%l7 + %l1],	%i0
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x81,	%g5
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x88,	%i7
	nop
	set	0x28, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x10, %g1
	stx	%i3,	[%l7 + %g1]
	nop
	set	0x30, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x55, %l6
	stba	%l4,	[%l7 + %l6] 0x88
	or	%o6,	%g2,	%l3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%i1
	set	0x78, %o1
	stxa	%l0,	[%l7 + %o1] 0x81
	nop
	set	0x27, %i3
	ldub	[%l7 + %i3],	%o5
	add	%o4,	%g7,	%i2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%g1
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f24
	nop
	set	0x50, %o3
	stw	%o3,	[%l7 + %o3]
	set	0x68, %o4
	stxa	%o2,	[%l7 + %o4] 0x80
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%g6
	nop
	set	0x1C, %l5
	ldsh	[%l7 + %l5],	%l5
	nop
	set	0x7C, %g4
	ldsw	[%l7 + %g4],	%g3
	nop
	set	0x08, %i7
	std	%i6,	[%l7 + %i7]
	nop
	set	0x1E, %l3
	ldub	[%l7 + %l3],	%l6
	nop
	set	0x64, %o7
	stw	%l1,	[%l7 + %o7]
	st	%f23,	[%l7 + 0x0C]
	ld	[%l7 + 0x68],	%f16
	nop
	set	0x40, %g6
	stw	%g4,	[%l7 + %g6]
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f16
	or	%o0,	%i5,	%l2
	and	%i0,	%g5,	%o1
	set	0x1D, %g5
	stba	%i3,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f18
	nop
	nop
	setx	0x24FB4064A50AF583,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xEB4CF7ABE30574D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f28,	%f0
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f10
	set	0x78, %i0
	stha	%l4,	[%l7 + %i0] 0x88
	nop
	set	0x0C, %o5
	ldsb	[%l7 + %o5],	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l3
	set	0x65, %i5
	stba	%o7,	[%l7 + %i5] 0x81
	nop
	set	0x4C, %i1
	swap	[%l7 + %i1],	%i1
	nop
	set	0x70, %o6
	std	%i6,	[%l7 + %o6]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%o5
	bl,a,pt	%xcc,	loop_39
	nop
	set	0x15, %o2
	ldsb	[%l7 + %o2],	%o4
	set	0x28, %i4
	stha	%i2,	[%l7 + %i4] 0x81
loop_39:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%g1
	nop
	set	0x68, %l1
	std	%f10,	[%l7 + %l1]
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%o2
	set	0x78, %g1
	sta	%f27,	[%l7 + %g1] 0x80
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g6
	set	0x50, %i6
	ldda	[%l7 + %i6] 0xea,	%l4
	nop
	set	0x7F, %g3
	ldub	[%l7 + %g3],	%g3
	set	0x74, %l6
	stwa	%i6,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x2F, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o2
	nop
	set	0x74, %o1
	swap	[%l7 + %o1],	%l6
	st	%fsr,	[%l7 + 0x10]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%g4
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xca
	set	0x70, %o4
	stwa	%i5,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x50, %i2
	stb	%l2,	[%l7 + %i2]
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x81,	%i0
	nop
	set	0x32, %i7
	stb	%o0,	[%l7 + %i7]
	or	%o1,	%i3,	%l4
	nop
	set	0x08, %l3
	ldsh	[%l7 + %l3],	%o6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%l3
	ld	[%l7 + 0x28],	%f16
	set	0x48, %l5
	stxa	%g2,	[%l7 + %l5] 0x81
	bl,a,pt	%xcc,	loop_40
	nop
	set	0x68, %o7
	stx	%o7,	[%l7 + %o7]
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
loop_40:
	nop
	set	0x56, %g2
	stb	%i1,	[%l7 + %g2]
	add	%o5,	%o4,	%i2
	and	%l0,	%g1,	%o3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%i4
	set	0x50, %g6
	lda	[%l7 + %g6] 0x89,	%f2
	nop
	set	0x53, %l4
	stb	%l5,	[%l7 + %l4]
	nop
	set	0x40, %o5
	stx	%g3,	[%l7 + %o5]
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%i6
	nop
	set	0x28, %i5
	stw	%l1,	[%l7 + %i5]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x81
	nop
	set	0x78, %l2
	ldsh	[%l7 + %l2],	%g4
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%l6
	set	0x10, %o2
	lda	[%l7 + %o2] 0x81,	%f27
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x80,	%i4
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x89,	%l2
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f8
	set	0x12, %g1
	stba	%o0,	[%l7 + %g1] 0x89
	nop
	set	0x60, %g3
	stw	%o1,	[%l7 + %g3]
	set	0x3E, %i3
	stba	%i0,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x20, %l6
	ldstub	[%l7 + %l6],	%l4
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%i2
	st	%f2,	[%l7 + 0x28]
	nop
	set	0x54, %o4
	ldsw	[%l7 + %o4],	%g5
	nop
	set	0x3C, %g7
	lduh	[%l7 + %g7],	%l3
	set	0x48, %o1
	stha	%o6,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x0A, %g4
	stba	%o7,	[%l7 + %g4] 0x80
	set	0x40, %i7
	stxa	%g2,	[%l7 + %i7] 0xe2
	membar	#Sync
	st	%f24,	[%l7 + 0x3C]
	nop
	set	0x20, %l3
	lduh	[%l7 + %l3],	%i7
	set	0x4C, %i2
	stwa	%i1,	[%l7 + %i2] 0x80
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f16
	set	0x0C, %l5
	stwa	%o4,	[%l7 + %l5] 0x80
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%i2
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%l0
	nop
	set	0x77, %l4
	ldub	[%l7 + %l4],	%g1
	set	0x34, %o5
	swapa	[%l7 + %o5] 0x89,	%o5
	add	%o3,	%g7,	%l5
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0
	set	0x10, %i0
	stwa	%g6,	[%l7 + %i0] 0x89
	nop
	set	0x1B, %i5
	stb	%g3,	[%l7 + %i5]
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x88,	%o2
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xea,	%l0
	set	0x38, %o2
	stha	%g4,	[%l7 + %o2] 0x89
	set	0x10, %o6
	stxa	%l6,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%i6
	nop
	set	0x14, %o0
	lduh	[%l7 + %o0],	%l2
	nop
	set	0x78, %i4
	lduh	[%l7 + %i4],	%o0
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%o1
	set	0x12, %g3
	stba	%i0,	[%l7 + %g3] 0x89
	nop
	set	0x50, %i6
	std	%f4,	[%l7 + %i6]
	bgu,a,pt	%xcc,	loop_41
	nop
	set	0x20, %l6
	stw	%i3,	[%l7 + %l6]
	nop
	set	0x6C, %o3
	swap	[%l7 + %o3],	%l4
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%g5
loop_41:
	nop
	set	0x6C, %g7
	lduh	[%l7 + %g7],	%l3
	nop
	set	0x48, %o4
	sth	%o6,	[%l7 + %o4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x178, 	%tick_cmpr
	set	0x68, %o1
	stda	%g2,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%o4
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x88,	 2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%i2
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f14
	nop
	set	0x58, %i2
	std	%g0,	[%l7 + %i2]
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x88,	%o3
	and	%o5,	%l5,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%g6
	nop
	set	0x54, %l0
	ldstub	[%l7 + %l0],	%o2
	set	0x58, %g5
	swapa	[%l7 + %g5] 0x81,	%l1
	nop
	set	0x37, %l4
	ldub	[%l7 + %l4],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g3
	nop
	set	0x65, %g6
	ldstub	[%l7 + %g6],	%i6
	set	0x6F, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l2
	nop
	set	0x60, %i0
	swap	[%l7 + %i0],	%i5
	st	%f22,	[%l7 + 0x64]
	nop
	set	0x50, %o5
	std	%f18,	[%l7 + %o5]
	nop
	set	0x0C, %i1
	ldub	[%l7 + %i1],	%o0
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	nop
	setx	0xEF7B2F4481BE93F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x259053AD699564D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f26,	%f24
	set	0x40, %o2
	stwa	%i3,	[%l7 + %o2] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x68, %l2
	sta	%f19,	[%l7 + %l2] 0x80
	nop
	set	0x7F, %o6
	stb	%i0,	[%l7 + %o6]
	nop
	set	0x34, %l1
	swap	[%l7 + %l1],	%l3
	nop
	set	0x18, %i4
	stx	%o6,	[%l7 + %i4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%g2
	nop
	set	0x60, %o0
	ldx	[%l7 + %o0],	%o4
	set	0x3C, %g3
	lda	[%l7 + %g3] 0x89,	%f10
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f16
	set	0x0C, %g1
	swapa	[%l7 + %g1] 0x80,	%i7
	set	0x60, %o3
	stwa	%l0,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f6
	set	0x0A, %g7
	stha	%i1,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x16, %o4
	sth	%i2,	[%l7 + %o4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g1
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%l4
	or	%g7,	%o5,	%g6
	st	%fsr,	[%l7 + 0x44]
	set	0x0B, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i4
	set	0x66, %g4
	stha	%o2,	[%l7 + %g4] 0x88
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%l0
	set	0x5C, %i7
	sta	%f25,	[%l7 + %i7] 0x81
	st	%f4,	[%l7 + 0x0C]
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x88,	%g4
	nop
	set	0x54, %i2
	lduh	[%l7 + %i2],	%g3
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x81,	%i6
	add	%i6,	%i5,	%o0
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x88,	%o1
	bl,pn	%icc,	loop_42
	nop
	set	0x32, %l4
	ldub	[%l7 + %l4],	%l2
	st	%f3,	[%l7 + 0x54]
	nop
	set	0x10, %g6
	std	%f10,	[%l7 + %g6]
loop_42:
	or	%l4,	%g5,	%i0
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xeb,	%l2
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	nop
	set	0x58, %i0
	stx	%o6,	[%l7 + %i0]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%o7
	nop
	set	0x78, %o5
	ldx	[%l7 + %o5],	%o4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAD7, 	%tick_cmpr
	add	%i2,	%o3,	%i1
	bg	%xcc,	loop_43
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%l4
	fpsub32s	%f22,	%f31,	%f11
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
loop_43:
	nop
	set	0x7A, %i1
	ldstub	[%l7 + %i1],	%g1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%g6
	set	0x78, %o6
	stda	%i4,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x38, %l1
	stha	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf0
	membar	#Sync
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x81,	%l1
	and	%g4,	%g3,	%o2
	nop
	set	0x6C, %o0
	stw	%i6,	[%l7 + %o0]
	nop
	set	0x42, %g3
	stb	%l6,	[%l7 + %g3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%o1
	nop
	set	0x2E, %g1
	ldstub	[%l7 + %g1],	%i5
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x89,	 4
	set	0x20, %o3
	stxa	%g5,	[%l7 + %o3] 0x80
	nop
	set	0x75, %g7
	ldub	[%l7 + %g7],	%i0
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%i3
	set	0x60, %o1
	sta	%f20,	[%l7 + %o1] 0x88
	set	0x6E, %l6
	ldstuba	[%l7 + %l6] 0x80,	%o6
	nop
	set	0x79, %i3
	ldsb	[%l7 + %i3],	%l2
	set	0x10, %l3
	sta	%f17,	[%l7 + %l3] 0x89
	and	%g2,	%o7,	%i7
	set	0x1A, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l0
	set	0x18, %o7
	stxa	%i2,	[%l7 + %o7] 0x89
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%f10,	[%l7 + 0x48]
	set	0x4C, %g4
	sta	%f27,	[%l7 + %g4] 0x88
	set	0x68, %l0
	lda	[%l7 + %l0] 0x89,	%f26
	set	0x20, %i2
	swapa	[%l7 + %i2] 0x80,	%o3
	nop
	set	0x6A, %l5
	stb	%l5,	[%l7 + %l5]
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x3A, %g5
	ldsb	[%l7 + %g5],	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%i4
	nop
	set	0x08, %g2
	stw	%o5,	[%l7 + %g2]
	nop
	set	0x08, %l4
	ldsw	[%l7 + %l4],	%l1
	nop
	set	0x59, %i0
	ldub	[%l7 + %i0],	%g4
	st	%fsr,	[%l7 + 0x14]
	set	0x0C, %i5
	lda	[%l7 + %i5] 0x81,	%f11
	set	0x2C, %o5
	stwa	%g6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x60, %o2
	stb	%l6,	[%l7 + %o2]
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x4D, %l1
	ldsb	[%l7 + %l1],	%o2
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%o0
	st	%f27,	[%l7 + 0x34]
	nop
	set	0x48, %i4
	lduw	[%l7 + %i4],	%o0
	nop
	set	0x0A, %l2
	lduh	[%l7 + %l2],	%l4
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f6
	add	%g5,	%i5,	%l3
	set	0x18, %g3
	stwa	%i0,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x81,	%i2
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%o6
	nop
	set	0x50, %g7
	stx	%g2,	[%l7 + %g7]
	wr	%o7,	%i7,	%ccr
	set	0x1C, %o3
	sta	%f18,	[%l7 + %o3] 0x88
	nop
	set	0x40, %o1
	std	%f12,	[%l7 + %o1]
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x81,	 2
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%i2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc0
	set	0x10, %i3
	swapa	[%l7 + %i3] 0x89,	%o4
	add	%l0,	%o3,	%l5
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%g1
	nop
	set	0x70, %g4
	stx	%i1,	[%l7 + %g4]
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%g7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l1
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%g4
	set	0x24, %l5
	stba	%g6,	[%l7 + %l5] 0x81
	or	%g3,	%i6,	%o5
	nop
	set	0x16, %o7
	sth	%o2,	[%l7 + %o7]
	nop
	set	0x7A, %g6
	ldub	[%l7 + %g6],	%l6
	nop
	set	0x1E, %g5
	stb	%o1,	[%l7 + %g5]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%l4
	set	0x70, %l4
	stda	%g4,	[%l7 + %l4] 0x88
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f14
	nop
	set	0x40, %i5
	stx	%i5,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x60, %i0
	stx	%i0,	[%l7 + %i0]
	nop
	set	0x46, %o2
	ldsh	[%l7 + %o2],	%l3
	nop
	nop
	setx	0xEDE8EE2F58516E4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x428308E91895FC73,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f8
	nop
	nop
	setx	0xF93113CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xA62B4271,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f8,	%f28
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x88,	 4
	st	%f25,	[%l7 + 0x68]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f16
	nop
	set	0x4E, %o6
	ldstub	[%l7 + %o6],	%i3
	set	0x6A, %o5
	stha	%g2,	[%l7 + %o5] 0xe3
	membar	#Sync
	add	%i7,	%l2,	%o7
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%o4
	nop
	set	0x38, %o0
	std	%i2,	[%l7 + %o0]
	nop
	set	0x14, %l2
	swap	[%l7 + %l2],	%o3
	bne,a,pt	%icc,	loop_44
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%f8
	nop
	set	0x62, %i6
	ldub	[%l7 + %i6],	%l5
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%l0
loop_44:
	nop
	set	0x74, %g3
	swap	[%l7 + %g3],	%i1
	nop
	set	0x60, %o3
	stx	%g7,	[%l7 + %o3]
	nop
	set	0x20, %l6
	std	%g0,	[%l7 + %l6]
	nop
	set	0x48, %o1
	std	%f6,	[%l7 + %o1]
	nop
	set	0x62, %l3
	ldub	[%l7 + %l3],	%i4
	st	%fsr,	[%l7 + 0x0C]
	ld	[%l7 + 0x40],	%f23
	nop
	set	0x0C, %o4
	sth	%g4,	[%l7 + %o4]
	nop
	set	0x51, %i7
	ldsb	[%l7 + %i7],	%l1
	nop
	set	0x60, %g4
	stw	%g3,	[%l7 + %g4]
	set	0x30, %i3
	swapa	[%l7 + %i3] 0x89,	%g6
	nop
	set	0x1E, %l0
	lduh	[%l7 + %l0],	%i6
	nop
	set	0x45, %l5
	stb	%o5,	[%l7 + %l5]
	nop
	set	0x72, %o7
	ldub	[%l7 + %o7],	%l6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%o2
	nop
	set	0x20, %g5
	stx	%o0,	[%l7 + %g5]
	nop
	set	0x76, %i2
	ldstub	[%l7 + %i2],	%l4
	set	0x18, %l4
	swapa	[%l7 + %l4] 0x89,	%i5
	set	0x20, %i5
	stwa	%i0,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x71, %g2
	ldub	[%l7 + %g2],	%g5
	nop
	set	0x44, %o2
	sth	%l3,	[%l7 + %o2]
	set	0x40, %i1
	stwa	%o6,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x60, %l1
	sta	%f14,	[%l7 + %l1] 0x81
	and	%i3,	%g2,	%i7
	set	0x64, %o6
	lda	[%l7 + %o6] 0x81,	%f19
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x81,	%o7
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%l2
	set	0x08, %i4
	stba	%o4,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x17, %l2
	ldub	[%l7 + %l2],	%o3
	nop
	set	0x59, %o0
	ldstub	[%l7 + %o0],	%i2
	nop
	set	0x78, %g1
	stx	%l5,	[%l7 + %g1]
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x81,	%l0
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%f8
	nop
	set	0x68, %o3
	std	%f22,	[%l7 + %o3]
	st	%f15,	[%l7 + 0x6C]
	set	0x10, %g3
	stxa	%i1,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x70, %o1
	swap	[%l7 + %o1],	%g7
	nop
	set	0x7D, %l6
	ldsb	[%l7 + %l6],	%i4
	nop
	set	0x42, %l3
	lduh	[%l7 + %l3],	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%g3
	nop
	set	0x0C, %o4
	lduw	[%l7 + %o4],	%g4
	set	0x3D, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g6
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x43, %l0
	stb	%o5,	[%l7 + %l0]
	set	0x62, %l5
	stha	%l6,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x30, %o7
	ldda	[%l7 + %o7] 0x88,	%o0
	set	0x30, %g6
	stda	%o0,	[%l7 + %g6] 0x80
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
	and	%o2,	%l4,	%i0
	nop
	set	0x6A, %i7
	ldsh	[%l7 + %i7],	%g5
	set	0x30, %i2
	stwa	%l3,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x6A, %l4
	ldsb	[%l7 + %l4],	%i5
	nop
	set	0x44, %i5
	ldstub	[%l7 + %i5],	%i3
	nop
	set	0x2C, %o2
	ldsw	[%l7 + %o2],	%o6
	nop
	set	0x28, %i1
	stw	%i7,	[%l7 + %i1]
	and	%g2,	%o7,	%o4
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x30, %g2
	std	%f20,	[%l7 + %g2]
	nop
	set	0x64, %o6
	lduh	[%l7 + %o6],	%o3
	nop
	set	0x48, %o5
	std	%l2,	[%l7 + %o5]
	st	%f7,	[%l7 + 0x70]
	add	%l5,	%l0,	%i2
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x17, %i0
	ldub	[%l7 + %i0],	%i1
	set	0x24, %l2
	lda	[%l7 + %l2] 0x81,	%f12
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i4
	nop
	set	0x50, %o0
	prefetch	[%l7 + %o0],	 0
	nop
	set	0x58, %g1
	swap	[%l7 + %g1],	%l1
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%g1
	set	0x46, %i4
	stha	%g3,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x14, %g7
	stwa	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	nop
	setx	0x254A68A284149803,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x9D347DB04CDD3C03,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f22
	or	%g6,	%l6,	%o5
	nop
	set	0x30, %o1
	stx	%o0,	[%l7 + %o1]
	set	0x67, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o1
	nop
	set	0x40, %l3
	sth	%o2,	[%l7 + %l3]
	add	%l4,	%i0,	%l3
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%g5
	set	0x74, %l6
	sta	%f20,	[%l7 + %l6] 0x81
	set	0x34, %g4
	sta	%f15,	[%l7 + %g4] 0x89
	nop
	set	0x44, %i3
	ldsh	[%l7 + %i3],	%i3
	set	0x0E, %l0
	stha	%i5,	[%l7 + %l0] 0xe2
	membar	#Sync
	be,a	%icc,	loop_45
	nop
	set	0x74, %o7
	prefetch	[%l7 + %o7],	 4
	ble,a,pn	%xcc,	loop_46
	nop
	set	0x60, %l5
	std	%i6,	[%l7 + %l5]
loop_45:
	fpsub16s	%f14,	%f23,	%f9
	set	0x10, %g5
	swapa	[%l7 + %g5] 0x81,	%g2
loop_46:
	bg	%xcc,	loop_47
	nop
	set	0x1E, %i7
	ldsh	[%l7 + %i7],	%o6
	nop
	set	0x29, %g6
	ldsb	[%l7 + %g6],	%o7
	set	0x68, %i2
	ldxa	[%l7 + %i2] 0x81,	%o4
loop_47:
	nop
	set	0x7A, %i5
	ldsh	[%l7 + %i5],	%o3
	add	%l5,	%l2,	%l0
	set	0x08, %l4
	lda	[%l7 + %l4] 0x80,	%f17
	ld	[%l7 + 0x14],	%f24
	nop
	set	0x1C, %i1
	swap	[%l7 + %i1],	%i1
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i2
	ld	[%l7 + 0x34],	%f2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xca
	and	%g7,	%l1,	%i4
	set	0x20, %o5
	stha	%g1,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x1D, %o2
	stba	%g4,	[%l7 + %o2] 0x89
	nop
	set	0x68, %l1
	swap	[%l7 + %l1],	%g3
	set	0x51, %l2
	stba	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x48, %o0
	swapa	[%l7 + %o0] 0x89,	%l6
	set	0x14, %i0
	stwa	%g6,	[%l7 + %i0] 0x81
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x3E, %g1
	stb	%o0,	[%l7 + %g1]
	nop
	set	0x50, %i4
	std	%f28,	[%l7 + %i4]
	or	%o5,	%o1,	%o2
	nop
	set	0x40, %g7
	stx	%i0,	[%l7 + %g7]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f16
	nop
	set	0x60, %i6
	ldx	[%l7 + %i6],	%l3
	nop
	set	0x2C, %g3
	lduh	[%l7 + %g3],	%g5
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x80,	%i2
	set	0x48, %l3
	stda	%l4,	[%l7 + %l3] 0x89
	nop
	set	0x34, %o4
	swap	[%l7 + %o4],	%i5
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f4
	set	0x54, %i3
	stwa	%i7,	[%l7 + %i3] 0x81
	set	0x30, %g4
	ldda	[%l7 + %g4] 0xe2,	%g2
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%o6
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf9
	membar	#Sync
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%o6
	set	0x6C, %i7
	stwa	%o4,	[%l7 + %i7] 0x88
	nop
	set	0x38, %g6
	ldsb	[%l7 + %g6],	%o3
	add	%l5,	%l2,	%i1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%f16
	nop
	set	0x5C, %i5
	sth	%l0,	[%l7 + %i5]
	set	0x18, %l5
	sta	%f2,	[%l7 + %l5] 0x89
	nop
	set	0x20, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x0C, %g2
	stw	%i2,	[%l7 + %g2]
	nop
	set	0x78, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l1
	nop
	set	0x20, %o5
	swap	[%l7 + %o5],	%g7
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%i4
	nop
	set	0x78, %l2
	swap	[%l7 + %l2],	%g4
	set	0x0F, %o2
	stba	%g1,	[%l7 + %o2] 0x88
	wr	%g3,	%i6,	%ccr
	nop
	set	0x4E, %o0
	lduh	[%l7 + %o0],	%g6
	add	%l6,	%o5,	%o0
	nop
	set	0x4A, %g1
	stb	%o1,	[%l7 + %g1]
	nop
	set	0x34, %i4
	sth	%i0,	[%l7 + %i4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f0
	nop
	set	0x6F, %g7
	ldsb	[%l7 + %g7],	%l3
	nop
	set	0x48, %o3
	stx	%g5,	[%l7 + %o3]
	nop
	set	0x64, %g3
	lduw	[%l7 + %g3],	%i3
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%o2
	nop
	set	0x3E, %l3
	sth	%i5,	[%l7 + %l3]
	set	0x64, %o1
	swapa	[%l7 + %o1] 0x81,	%l4
	set	0x48, %l6
	stda	%i6,	[%l7 + %l6] 0x80
	set	0x70, %o4
	ldxa	[%l7 + %o4] 0x89,	%o7
	st	%f3,	[%l7 + 0x58]
	set	0x20, %i3
	lda	[%l7 + %i3] 0x89,	%f9
	nop
	set	0x10, %g4
	stb	%o6,	[%l7 + %g4]
	nop
	set	0x08, %l0
	ldsw	[%l7 + %l0],	%g2
	set	0x48, %g5
	stwa	%o3,	[%l7 + %g5] 0x81
	wr 	%g0, 	0x5, 	%fprs
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x81,	%i1
	set	0x7C, %i7
	lda	[%l7 + %i7] 0x81,	%f27
	set	0x52, %g6
	stba	%l0,	[%l7 + %g6] 0x80
	and	%l5,	%i2,	%l1
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%f6
	set	0x30, %l5
	sta	%f30,	[%l7 + %l5] 0x81
	nop
	set	0x58, %l4
	std	%f20,	[%l7 + %l4]
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%i4
	nop
	set	0x58, %g2
	ldub	[%l7 + %g2],	%g4
	ld	[%l7 + 0x40],	%f18
	nop
	set	0x2C, %i1
	stb	%g1,	[%l7 + %i1]
	fpadd32s	%f29,	%f20,	%f28
	set	0x59, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%g6
	or	%l6,	%i6,	%o0
	set	0x14, %l1
	stwa	%o1,	[%l7 + %l1] 0x89
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd2
	wr	%i0,	%l3,	%y
	add	%o5,	%i3,	%g5
	set	0x71, %o5
	stba	%i5,	[%l7 + %o5] 0x80
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%o2
	or	%l4,	%o7,	%i7
	nop
	set	0x2E, %g1
	ldub	[%l7 + %g1],	%g2
	set	0x20, %i4
	stxa	%o6,	[%l7 + %i4] 0x88
	fpsub16s	%f12,	%f15,	%f7
	bleu,a	%icc,	loop_48
	nop
	set	0x70, %i0
	ldsw	[%l7 + %i0],	%o3
	set	0x18, %g7
	stha	%l2,	[%l7 + %g7] 0xea
	membar	#Sync
loop_48:
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x72, %o0
	ldsh	[%l7 + %o0],	%i1
	nop
	set	0x0C, %g3
	stw	%o4,	[%l7 + %g3]
	set	0x38, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l0
	or	%l5,	%i2,	%i4
	set	0x18, %l3
	sta	%f25,	[%l7 + %l3] 0x89
	nop
	set	0x20, %o1
	stw	%l1,	[%l7 + %o1]
	and	%g1,	%g4,	%g3
	set	0x34, %l6
	lda	[%l7 + %l6] 0x89,	%f26
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x88,	%g6
	nop
	set	0x38, %i3
	std	%g6,	[%l7 + %i3]
	set	0x6C, %g4
	sta	%f23,	[%l7 + %g4] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%l6
	nop
	set	0x50, %l0
	stx	%o0,	[%l7 + %l0]
	set	0x30, %o3
	sta	%f11,	[%l7 + %o3] 0x88
	bleu	%icc,	loop_49
	add	%o1,	%l3,	%i0
	nop
	set	0x63, %o7
	ldub	[%l7 + %o7],	%i3
	nop
	set	0x42, %i7
	ldstub	[%l7 + %i7],	%g5
loop_49:
	nop
	set	0x4C, %g5
	sth	%i5,	[%l7 + %g5]
	nop
	set	0x30, %i5
	stx	%o2,	[%l7 + %i5]
	nop
	set	0x18, %l5
	stw	%o5,	[%l7 + %l5]
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x89,	%o7
	nop
	set	0x50, %l4
	ldstub	[%l7 + %l4],	%l4
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x1C, %g2
	lduw	[%l7 + %g2],	%i7
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%o6
	and	%o3,	%l2,	%g2
	nop
	set	0x61, %o6
	ldstub	[%l7 + %o6],	%o4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	fpadd32s	%f8,	%f23,	%f22
	nop
	set	0x26, %l1
	ldsh	[%l7 + %l1],	%l0
	nop
	set	0x20, %l2
	sth	%l5,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x58]
	ld	[%l7 + 0x34],	%f27
	set	0x50, %o2
	stda	%i2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xea,	%i4
	add	%l1,	%i1,	%g4
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%g3
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x88,	%f19
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%g7
	nop
	set	0x40, %g7
	stx	%g6,	[%l7 + %g7]
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%i6
	set	0x48, %o5
	lda	[%l7 + %o5] 0x88,	%f9
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x54, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x52, %g3
	stba	%o1,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x44, %l6
	lduw	[%l7 + %l6],	%l6
	nop
	set	0x38, %l3
	std	%l2,	[%l7 + %l3]
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x89,	 4
	fpsub32	%f24,	%f4,	%f8
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x89,	%g4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%o2
	nop
	set	0x3C, %i3
	ldstub	[%l7 + %i3],	%o5
	nop
	set	0x20, %l0
	std	%f8,	[%l7 + %l0]
	or	%o7,	%i5,	%l4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%o3
	set	0x5A, %o3
	stba	%i7,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x81,	%l2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%g2
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x25, %l5
	ldub	[%l7 + %l5],	%i2
	nop
	set	0x48, %l4
	std	%f16,	[%l7 + %l4]
	nop
	set	0x2C, %g2
	ldub	[%l7 + %g2],	%i4
	add	%i1,	%l1,	%g4
	set	0x6C, %i2
	lda	[%l7 + %i2] 0x88,	%f24
	nop
	set	0x5D, %g6
	ldstub	[%l7 + %g6],	%g3
	set	0x14, %o6
	stwa	%g1,	[%l7 + %o6] 0x89
	and	%g6,	%i6,	%o0
	add	%g7,	%l6,	%l3
	nop
	set	0x38, %l1
	swap	[%l7 + %l1],	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%i0
	set	0x44, %i1
	sta	%f27,	[%l7 + %i1] 0x80
	nop
	set	0x44, %o2
	ldsw	[%l7 + %o2],	%i3
	set	0x58, %l2
	stxa	%o5,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x1D, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o7
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x88,	%f18
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%i4
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x89,	%l4
	nop
	set	0x38, %o5
	std	%f28,	[%l7 + %o5]
	nop
	set	0x38, %i6
	swap	[%l7 + %i6],	%o2
	nop
	set	0x40, %o0
	swap	[%l7 + %o0],	%o3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	set	0x42, %g3
	stha	%o6,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	nop
	setx	0x62C4792A7F0DA837,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFF0E9A6039580DE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f0
	or	%l2,	%i7,	%o4
	set	0x40, %l6
	stxa	%l5,	[%l7 + %l6] 0x81
	nop
	set	0x58, %l3
	ldsb	[%l7 + %l3],	%l0
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%i2
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%g2
	nop
	set	0x23, %i3
	ldstub	[%l7 + %i3],	%i1
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x88,	%i4
	ld	[%l7 + 0x24],	%f9
	st	%f22,	[%l7 + 0x38]
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x80,	 2
	bne,pt	%icc,	loop_50
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%g4
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
loop_50:
	nop
	set	0x64, %o3
	lda	[%l7 + %o3] 0x80,	%f4
	set	0x7E, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g3
	set	0x14, %l5
	sta	%f3,	[%l7 + %l5] 0x81
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o0
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f14
	and	%i6,	%l6,	%l3
	or	%g7,	%g5,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%o5
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x80,	%o6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc2
	nop
	set	0x28, %g2
	stx	%i5,	[%l7 + %g2]
	set	0x18, %l1
	lda	[%l7 + %l1] 0x89,	%f19
	nop
	set	0x08, %i1
	std	%f30,	[%l7 + %i1]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc0
	set	0x24, %o2
	lda	[%l7 + %o2] 0x88,	%f11
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l4
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%o2
	nop
	set	0x0D, %l2
	ldstub	[%l7 + %l2],	%o3
	ld	[%l7 + 0x08],	%f8
	set	0x6B, %g7
	stba	%o6,	[%l7 + %g7] 0x81
	nop
	set	0x48, %i4
	lduh	[%l7 + %i4],	%l2
	nop
	set	0x7D, %o5
	ldstub	[%l7 + %o5],	%i7
	nop
	set	0x18, %i0
	std	%o4,	[%l7 + %i0]
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%l0
	nop
	set	0x10, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x7C, %g3
	ldsw	[%l7 + %g3],	%l5
	ld	[%l7 + 0x34],	%f2
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f6
	nop
	set	0x6D, %l3
	ldstub	[%l7 + %l3],	%i2
	nop
	set	0x3E, %l6
	ldsh	[%l7 + %l6],	%g2
	ble,a,pn	%icc,	loop_51
	nop
	set	0x20, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%f21,	[%l7 + 0x24]
	set	0x7D, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i1
loop_51:
	add	%l1,	%g4,	%i4
	add	%g1,	%g6,	%g3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f16
	set	0x1C, %o7
	sta	%f4,	[%l7 + %o7] 0x88
	set	0x10, %g5
	stxa	%o0,	[%l7 + %g5] 0x80
	fpadd32	%f24,	%f14,	%f12
	nop
	set	0x28, %i7
	ldub	[%l7 + %i7],	%i6
	nop
	set	0x1C, %g4
	ldub	[%l7 + %g4],	%l6
	nop
	set	0x7C, %i5
	stb	%g7,	[%l7 + %i5]
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x81,	%l3
	set	0x21, %o3
	stba	%g5,	[%l7 + %o3] 0x89
	nop
	set	0x4C, %l4
	ldstub	[%l7 + %l4],	%i3
	st	%fsr,	[%l7 + 0x28]
	set	0x3C, %i2
	sta	%f17,	[%l7 + %i2] 0x88
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f28
	nop
	set	0x3C, %g2
	lduw	[%l7 + %g2],	%o5
	nop
	set	0x0C, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x68, %i1
	stx	%i0,	[%l7 + %i1]
	nop
	set	0x78, %o2
	lduw	[%l7 + %o2],	%o7
	set	0x44, %o6
	lda	[%l7 + %o6] 0x81,	%f18
	nop
	set	0x2E, %l2
	ldstub	[%l7 + %l2],	%i5
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0
	st	%f24,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x44]
	or	%l4,	%o2,	%o3
	fpadd32s	%f22,	%f29,	%f30
	nop
	set	0x68, %g1
	lduw	[%l7 + %g1],	%o6
	set	0x08, %i4
	stda	%l2,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x2C, %o5
	sth	%i7,	[%l7 + %o5]
	and	%o4,	%l0,	%i2
	nop
	set	0x55, %o0
	stb	%l5,	[%l7 + %o0]
	or	%i1,	%g2,	%g4
	set	0x5E, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l1
	st	%f25,	[%l7 + 0x14]
	and	%g1,	%i4,	%g3
	nop
	set	0x70, %i6
	swap	[%l7 + %i6],	%g6
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x66, %l3
	ldsh	[%l7 + %l3],	%o0
	st	%f5,	[%l7 + 0x58]
	set	0x24, %o1
	stba	%i6,	[%l7 + %o1] 0x80
	nop
	set	0x6E, %o4
	ldstub	[%l7 + %o4],	%l6
	ble,a	%xcc,	loop_52
	nop
	set	0x26, %i3
	sth	%l3,	[%l7 + %i3]
	set	0x08, %l6
	stxa	%g5,	[%l7 + %l6] 0xea
	membar	#Sync
loop_52:
	nop
	set	0x24, %l0
	sta	%f17,	[%l7 + %l0] 0x81
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%g7
	set	0x60, %i7
	stha	%i3,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc8
	fpsub32	%f10,	%f4,	%f24
	nop
	set	0x4E, %g4
	sth	%o5,	[%l7 + %g4]
	set	0x44, %i5
	swapa	[%l7 + %i5] 0x88,	%o7
	nop
	set	0x60, %o3
	stx	%i5,	[%l7 + %o3]
	fpadd16s	%f10,	%f27,	%f12
	st	%fsr,	[%l7 + 0x64]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f16
	nop
	set	0x2C, %i2
	ldsh	[%l7 + %i2],	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o1
	set	0x4D, %l4
	stba	%o3,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x54, %g6
	lduw	[%l7 + %g6],	%o6
	st	%fsr,	[%l7 + 0x6C]
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x81,	%l2
	set	0x60, %l1
	sta	%f7,	[%l7 + %l1] 0x80
	nop
	set	0x08, %i1
	std	%i6,	[%l7 + %i1]
	set	0x10, %o2
	stxa	%o2,	[%l7 + %o2] 0xea
	membar	#Sync
	fpadd32s	%f17,	%f19,	%f17
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf1
	membar	#Sync
	set	0x58, %g7
	swapa	[%l7 + %g7] 0x81,	%l0
	bgu	%icc,	loop_53
	wr	%i2,	%o4,	%pic
	set	0x44, %l2
	swapa	[%l7 + %l2] 0x80,	%i1
loop_53:
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%l5
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l1
	nop
	set	0x6D, %i4
	ldstub	[%l7 + %i4],	%g1
	nop
	set	0x6C, %o0
	lduw	[%l7 + %o0],	%g3
	or	%i4,	%o0,	%g6
	nop
	set	0x68, %i0
	swap	[%l7 + %i0],	%l6
	set	0x08, %i6
	ldxa	[%l7 + %i6] 0x89,	%l3
	set	0x1C, %l3
	lda	[%l7 + %l3] 0x81,	%f4
	nop
	set	0x30, %o1
	lduw	[%l7 + %o1],	%i6
	set	0x09, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g5
	st	%f2,	[%l7 + 0x7C]
	set	0x68, %o4
	lda	[%l7 + %o4] 0x80,	%f12
	bg,a	%xcc,	loop_54
	nop
	set	0x68, %i3
	swap	[%l7 + %i3],	%g7
	nop
	nop
	setx	0x084D8FDA06445E47,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCC2AB89960FC134E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f22
	nop
	set	0x20, %l0
	std	%f10,	[%l7 + %l0]
loop_54:
	nop
	set	0x2C, %o7
	stha	%o5,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x70, %i7
	stda	%i2,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%i5
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xda
	set	0x40, %g4
	stxa	%i0,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x88,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%o3
	wr	%o1,	%l2,	%clear_softint
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x27, %i5
	stb	%o6,	[%l7 + %i5]
	nop
	set	0x4A, %i2
	stb	%i7,	[%l7 + %i2]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc4
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd0,	%f0
	and	%o2,	%l0,	%i2
	nop
	set	0x64, %l1
	stw	%o4,	[%l7 + %l1]
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x88,	%i0
	set	0x3C, %o2
	sta	%f30,	[%l7 + %o2] 0x81
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x81,	%l4
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%g4
	ld	[%l7 + 0x20],	%f21
	set	0x30, %l2
	stxa	%l1,	[%l7 + %l2] 0x88
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%g1
	nop
	set	0x30, %o5
	stx	%g2,	[%l7 + %o5]
	set	0x4C, %g7
	sta	%f15,	[%l7 + %g7] 0x88
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f24
	add	%i4,	%o0,	%g6
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x1A, %o0
	lduh	[%l7 + %o0],	%l3
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%l6
	set	0x58, %l3
	ldxa	[%l7 + %l3] 0x89,	%g5
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%g6
	or	%o5,	%i3,	%i5
	nop
	set	0x17, %g3
	ldsb	[%l7 + %g3],	%i6
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0
	bl,pn	%icc,	loop_55
	nop
	set	0x2E, %l0
	ldub	[%l7 + %l0],	%l4
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%i0
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
loop_55:
	and	%o1,	%l2,	%o6
	nop
	set	0x78, %g5
	ldstub	[%l7 + %g5],	%o3
	nop
	set	0x64, %l6
	sth	%o2,	[%l7 + %l6]
	nop
	set	0x28, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f30
	nop
	set	0x30, %o7
	std	%f0,	[%l7 + %o7]
	set	0x50, %i5
	swapa	[%l7 + %i5] 0x80,	%l0
	set	0x40, %l4
	stha	%i7,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x60, %g6
	prefetch	[%l7 + %g6],	 0
	fpsub32s	%f1,	%f27,	%f5
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%o4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x80
	set	0x7F, %l5
	ldstuba	[%l7 + %l5] 0x81,	%i2
	wr	%i1,	%l5,	%pic
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%l0
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x89,	%g1
	nop
	set	0x0E, %o6
	sth	%g4,	[%l7 + %o6]
	nop
	set	0x2E, %i1
	ldstub	[%l7 + %i1],	%g2
	st	%fsr,	[%l7 + 0x4C]
	or	%o0,	%i4,	%g6
	st	%f26,	[%l7 + 0x78]
	nop
	set	0x20, %g1
	std	%l2,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x2C, %l2
	prefetch	[%l7 + %l2],	 2
	add	%g3,	%l6,	%g5
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f28
	nop
	set	0x30, %g7
	std	%g6,	[%l7 + %g7]
	nop
	set	0x20, %i4
	stx	%o5,	[%l7 + %i4]
	and	%i5,	%i3,	%i6
	nop
	set	0x28, %i0
	stb	%l4,	[%l7 + %i0]
	nop
	set	0x7B, %o0
	ldub	[%l7 + %o0],	%i0
	and	%o7,	%l2,	%o6
	nop
	set	0x70, %l3
	std	%o0,	[%l7 + %l3]
	nop
	set	0x40, %o1
	sth	%o3,	[%l7 + %o1]
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%l0
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x80,	%i6
	set	0x60, %o4
	lda	[%l7 + %o4] 0x89,	%f7
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%o2
	fpadd16	%f10,	%f2,	%f0
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xd8
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x80,	%o4
	nop
	set	0x51, %l6
	ldsb	[%l7 + %l6],	%i1
	nop
	set	0x50, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x44, %o3
	swapa	[%l7 + %o3] 0x80,	%i2
	or	%l5,	%g1,	%l1
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%g4
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x28, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o0
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%i4
	nop
	set	0x1C, %i2
	stw	%g6,	[%l7 + %i2]
	nop
	set	0x08, %g6
	ldsb	[%l7 + %g6],	%l3
	set	0x31, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g3
	set	0x30, %l5
	lda	[%l7 + %l5] 0x81,	%f12
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x40, %o2
	std	%f18,	[%l7 + %o2]
	nop
	set	0x1C, %i1
	stb	%l6,	[%l7 + %i1]
	set	0x20, %o6
	sta	%f15,	[%l7 + %o6] 0x88
	bge,a	%xcc,	loop_56
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x69, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g2
loop_56:
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f8
	nop
	set	0x7C, %l2
	ldsb	[%l7 + %l2],	%g7
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x81,	%g4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%i3
	nop
	set	0x14, %o0
	prefetch	[%l7 + %o0],	 4
	wr	%i6,	%l4,	%ccr
	st	%fsr,	[%l7 + 0x74]
	fpsub16	%f16,	%f0,	%f30
	set	0x70, %i4
	ldda	[%l7 + %i4] 0xeb,	%o4
	and	%i0,	%o7,	%o6
	nop
	set	0x48, %l3
	ldx	[%l7 + %l3],	%l2
	st	%f4,	[%l7 + 0x2C]
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xeb,	%o2
	nop
	set	0x1C, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%l0
	nop
	set	0x14, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x58, %i6
	lda	[%l7 + %i6] 0x89,	%f23
	bn,pn	%icc,	loop_57
	nop
	set	0x38, %i3
	std	%f20,	[%l7 + %i3]
	add	%o1,	%o2,	%i7
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%o4
loop_57:
	fpsub16s	%f24,	%f2,	%f5
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f10
	set	0x44, %i7
	sta	%f7,	[%l7 + %i7] 0x89
	nop
	nop
	setx	0x9E1AAF240218C54F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9288B3815BD70FC9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f14
	nop
	set	0x2C, %o3
	ldsw	[%l7 + %o3],	%i2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd2
	nop
	set	0x78, %o7
	std	%f30,	[%l7 + %o7]
	fpadd32s	%f5,	%f11,	%f31
	and	%l5,	%g1,	%l1
	or	%g4,	%o0,	%i4
	set	0x36, %l4
	stha	%g6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x70, %g4
	prefetch	[%l7 + %g4],	 2
	or	%i1,	%g3,	%l3
	fpsub32s	%f30,	%f27,	%f7
	nop
	set	0x52, %i2
	sth	%g2,	[%l7 + %i2]
	set	0x53, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g7
	nop
	set	0x28, %l1
	lduh	[%l7 + %l1],	%g5
	set	0x0A, %l5
	stha	%i5,	[%l7 + %l5] 0x80
	add	%i3,	%i6,	%l4
	nop
	set	0x28, %o2
	stx	%o5,	[%l7 + %o2]
	set	0x18, %g2
	stwa	%l6,	[%l7 + %g2] 0x81
	nop
	nop
	setx	0xAED09E402FDF8A49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x266DC4BEEAF6FFD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f2,	%f14
	nop
	set	0x2C, %i1
	stw	%o7,	[%l7 + %i1]
	set	0x22, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i0
	set	0x10, %o5
	lda	[%l7 + %o5] 0x89,	%f30
	wr	%l2,	%o6,	%clear_softint
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f24
	nop
	set	0x78, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %i0
	stxa	%o3,	[%l7 + %i0] 0x89
	set	0x70, %o0
	stxa	%o1,	[%l7 + %o0] 0x80
	nop
	set	0x60, %g7
	swap	[%l7 + %g7],	%o2
	nop
	set	0x19, %i4
	stb	%l0,	[%l7 + %i4]
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x24, %o1
	stw	%i7,	[%l7 + %o1]
	nop
	set	0x2F, %o4
	stb	%o4,	[%l7 + %o4]
	bgu,a,pn	%xcc,	loop_58
	st	%f25,	[%l7 + 0x60]
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x44, %l3
	lduw	[%l7 + %l3],	%l1
loop_58:
	nop
	set	0x16, %l0
	stb	%g4,	[%l7 + %l0]
	st	%f29,	[%l7 + 0x30]
	nop
	set	0x48, %i6
	prefetch	[%l7 + %i6],	 0
	and	%o0,	%i4,	%g6
	set	0x38, %l6
	stwa	%i1,	[%l7 + %l6] 0x89
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x80,	%g3
	nop
	set	0x4F, %i7
	stb	%l3,	[%l7 + %i7]
	nop
	set	0x50, %o3
	swap	[%l7 + %o3],	%g2
	set	0x28, %i5
	swapa	[%l7 + %i5] 0x88,	%g7
	add	%g5,	%i5,	%i3
	nop
	set	0x70, %i3
	stx	%g1,	[%l7 + %i3]
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x89,	 4
	set	0x10, %l4
	sta	%f29,	[%l7 + %l4] 0x89
	nop
	set	0x66, %i2
	ldsh	[%l7 + %i2],	%l4
	wr	%o5,	%o7,	%softint
	set	0x1A, %g4
	stha	%i0,	[%l7 + %g4] 0x80
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f12
	nop
	set	0x60, %l1
	sth	%l2,	[%l7 + %l1]
	nop
	set	0x58, %o2
	stw	%o6,	[%l7 + %o2]
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	set	0x64, %l5
	sta	%f17,	[%l7 + %l5] 0x88
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xda
	and	%o3,	%o1,	%o2
	nop
	set	0x3D, %o6
	ldsb	[%l7 + %o6],	%l6
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xe3,	%i6
	set	0x2C, %l2
	sta	%f11,	[%l7 + %l2] 0x80
	nop
	set	0x60, %o0
	lduw	[%l7 + %o0],	%o4
	ba,a,pn	%xcc,	loop_59
	nop
	set	0x7C, %i0
	stw	%i2,	[%l7 + %i0]
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x89,	%l0
loop_59:
	nop
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x88,	%l5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	set	0x28, %o4
	lda	[%l7 + %o4] 0x81,	%f31
	nop
	set	0x68, %o1
	swap	[%l7 + %o1],	%l1
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%o0
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%g4
	nop
	set	0x3A, %l6
	ldsh	[%l7 + %l6],	%g6
	nop
	set	0x30, %g5
	sth	%i4,	[%l7 + %g5]
	st	%f3,	[%l7 + 0x40]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f0
	nop
	set	0x78, %o3
	swap	[%l7 + %o3],	%g3
	set	0x38, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	set	0x20, %l0
	std	%f14,	[%l7 + %l0]
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%g2
	nop
	set	0x50, %l4
	stx	%i1,	[%l7 + %l4]
	fpadd16	%f16,	%f6,	%f4
	and	%g7,	%i5,	%i3
	set	0x0C, %o7
	swapa	[%l7 + %o7] 0x80,	%g1
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f8
	set	0x5B, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i6
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f14
	set	0x30, %i2
	swapa	[%l7 + %i2] 0x81,	%l4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%o7
	nop
	set	0x34, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x28, %i1
	std	%f18,	[%l7 + %i1]
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%i0
	wr	%l2,	%o6,	%softint
	set	0x73, %l5
	ldstuba	[%l7 + %l5] 0x88,	%o3
	nop
	set	0x48, %g1
	lduw	[%l7 + %g1],	%o1
	set	0x44, %o5
	stwa	%o5,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	nop
	set	0x14, %i0
	stw	%i7,	[%l7 + %i0]
	nop
	set	0x58, %o0
	sth	%i2,	[%l7 + %o0]
	set	0x51, %g3
	stba	%o4,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%l0
	nop
	set	0x27, %o4
	stb	%l5,	[%l7 + %o4]
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	ld	[%l7 + 0x1C],	%f3
	set	0x7E, %l3
	stha	%l1,	[%l7 + %l3] 0x80
	st	%fsr,	[%l7 + 0x2C]
	set	0x70, %i6
	stxa	%g4,	[%l7 + %i6] 0x81
	set	0x64, %l6
	stwa	%i4,	[%l7 + %l6] 0x81
	nop
	set	0x36, %g5
	ldsb	[%l7 + %g5],	%g6
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x1C, %o3
	sth	%g3,	[%l7 + %o3]
	nop
	set	0x78, %i5
	std	%f14,	[%l7 + %i5]
	set	0x40, %l0
	stxa	%l3,	[%l7 + %l0] 0xea
	membar	#Sync
	fpadd16s	%f31,	%f6,	%f14
	nop
	set	0x40, %i3
	stx	%g2,	[%l7 + %i3]
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f28
	or	%i1,	%i5,	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g1
	nop
	set	0x6D, %o7
	ldsb	[%l7 + %o7],	%i6
	nop
	set	0x72, %g4
	ldsh	[%l7 + %g4],	%g5
	set	0x40, %i7
	prefetcha	[%l7 + %i7] 0x89,	 4
	nop
	set	0x28, %g6
	stw	%i0,	[%l7 + %g6]
	set	0x7C, %l1
	stwa	%l2,	[%l7 + %l1] 0x80
	nop
	set	0x6A, %i2
	ldstub	[%l7 + %i2],	%o7
	nop
	set	0x44, %o2
	lduw	[%l7 + %o2],	%o3
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x58, %l5
	sth	%o1,	[%l7 + %l5]
	set	0x58, %g1
	stda	%o4,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f16
	and	%o6,	%l6,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%i7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l5
	add	%l0,	%l1,	%o0
	wr	%g4,	%i4,	%sys_tick
	ld	[%l7 + 0x24],	%f20
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xea,	%g2
	set	0x34, %l2
	stba	%g6,	[%l7 + %l2] 0x81
	nop
	set	0x2A, %g2
	ldsh	[%l7 + %g2],	%g2
	nop
	set	0x73, %i0
	stb	%l3,	[%l7 + %i0]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i0
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f24
	nop
	set	0x16, %o4
	lduh	[%l7 + %o4],	%i5
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%g6
	ld	[%l7 + 0x5C],	%f6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	wr	%g1,	%i3,	%set_softint
	nop
	set	0x58, %i6
	std	%f16,	[%l7 + %i6]
	and	%i6,	%l4,	%i0
	nop
	set	0x40, %l6
	ldstub	[%l7 + %l6],	%g5
	st	%fsr,	[%l7 + 0x48]
	set	0x78, %g5
	stxa	%o7,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x28, %g7
	ldsw	[%l7 + %g7],	%l2
	nop
	set	0x24, %o1
	stw	%o1,	[%l7 + %o1]
	set	0x60, %o3
	stwa	%o5,	[%l7 + %o3] 0x89
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x30, %l0
	stx	%o6,	[%l7 + %l0]
	nop
	set	0x70, %i3
	sth	%l6,	[%l7 + %i3]
	fpadd32	%f16,	%f8,	%f26
	and	%o2,	%o3,	%i2
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x89,	%o4
	nop
	set	0x4B, %i5
	ldub	[%l7 + %i5],	%l5
	st	%f9,	[%l7 + 0x68]
	and	%i7,	%l1,	%o0
	nop
	set	0x2C, %g4
	ldstub	[%l7 + %g4],	%g4
	add	%i4,	%l0,	%g3
	nop
	set	0x14, %o7
	ldstub	[%l7 + %o7],	%g2
	set	0x20, %g6
	sta	%f25,	[%l7 + %g6] 0x88
	set	0x78, %i7
	ldxa	[%l7 + %i7] 0x80,	%g6
	nop
	set	0x29, %i2
	ldstub	[%l7 + %i2],	%i1
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%l3
	nop
	set	0x28, %i1
	std	%i4,	[%l7 + %i1]
	set	0x58, %l1
	stha	%g1,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x2C, %l5
	ldsw	[%l7 + %l5],	%g7
	nop
	set	0x6E, %o5
	stb	%i6,	[%l7 + %o5]
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x88,	%l4
	nop
	set	0x10, %o6
	ldsw	[%l7 + %o6],	%i0
	set	0x6C, %g2
	stwa	%i3,	[%l7 + %g2] 0x89
	nop
	set	0x48, %i0
	std	%f16,	[%l7 + %i0]
	nop
	set	0x24, %l2
	stw	%o7,	[%l7 + %l2]
	nop
	set	0x40, %g3
	stb	%l2,	[%l7 + %g3]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f16
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0
	ld	[%l7 + 0x78],	%f11
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f24
	st	%fsr,	[%l7 + 0x3C]
	set	0x20, %o0
	stwa	%o1,	[%l7 + %o0] 0x81
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%o5
	fpsub32	%f24,	%f12,	%f4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x58, %i6
	stx	%o6,	[%l7 + %i6]
	nop
	set	0x4C, %g7
	lduw	[%l7 + %g7],	%l6
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%o2
	set	0x20, %o1
	sta	%f4,	[%l7 + %o1] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o4
	ld	[%l7 + 0x20],	%f2
	wr 	%g0, 	0x7, 	%fprs
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%o0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf1
	membar	#Sync
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f12
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i4
	nop
	set	0x20, %l4
	std	%l0,	[%l7 + %l4]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd2,	%f0
	fpsub32s	%f17,	%f14,	%f26
	nop
	set	0x40, %i5
	std	%f12,	[%l7 + %i5]
	set	0x2C, %g4
	ldstuba	[%l7 + %g4] 0x81,	%g3
	nop
	set	0x78, %o7
	prefetch	[%l7 + %o7],	 0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x50, %i7
	lduh	[%l7 + %i7],	%g2
	set	0x38, %i2
	stxa	%i2,	[%l7 + %i2] 0x88
	nop
	set	0x60, %o2
	stw	%g6,	[%l7 + %o2]
	nop
	set	0x22, %g6
	lduh	[%l7 + %g6],	%i1
	nop
	set	0x34, %l1
	lduh	[%l7 + %l1],	%i5
	ld	[%l7 + 0x30],	%f31
	fpadd32s	%f9,	%f11,	%f29
	nop
	set	0x20, %i1
	std	%f24,	[%l7 + %i1]
	fpsub16s	%f27,	%f14,	%f28
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc4
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x70, %o6
	lduw	[%l7 + %o6],	%g1
	nop
	set	0x0F, %g2
	ldstub	[%l7 + %g2],	%l3
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i6
	set	0x30, %l2
	ldxa	[%l7 + %l2] 0x81,	%g7
	nop
	set	0x20, %g3
	ldsh	[%l7 + %g3],	%i0
	ld	[%l7 + 0x60],	%f18
	nop
	nop
	setx	0xE127FC938F4E745B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xEB41F73BB1A52CC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f28,	%f0
	nop
	set	0x48, %i0
	std	%l4,	[%l7 + %i0]
	add	%i3,	%o7,	%g5
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%o1
	nop
	set	0x16, %l3
	ldub	[%l7 + %l3],	%o5
	set	0x6C, %o0
	lda	[%l7 + %o0] 0x80,	%f17
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x30, %l6
	stxa	%l2,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f26
	or	%l6,	%o2,	%o3
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i7
	set	0x74, %g7
	stha	%o4,	[%l7 + %g7] 0x81
	st	%f20,	[%l7 + 0x74]
	nop
	set	0x56, %l0
	ldsb	[%l7 + %l0],	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%i4
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x81,	%o0
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x80
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%g2
	nop
	set	0x48, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x6A, %g4
	ldstub	[%l7 + %g4],	%g3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%i0
	set	0x58, %o7
	stwa	%i5,	[%l7 + %o7] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x68]
	set	0x70, %g6
	stxa	%g6,	[%l7 + %g6] 0xe3
	membar	#Sync
	fpadd32	%f20,	%f28,	%f14
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%l2
	nop
	set	0x78, %i1
	lduw	[%l7 + %i1],	%i6
	set	0x38, %o2
	stda	%g0,	[%l7 + %o2] 0x80
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xcc
	nop
	set	0x51, %g2
	ldub	[%l7 + %g2],	%g7
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	nop
	set	0x40, %l2
	std	%f20,	[%l7 + %l2]
	nop
	set	0x30, %l5
	stx	%l4,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x5C]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%o7
	nop
	set	0x34, %i0
	ldsw	[%l7 + %i0],	%g5
	nop
	set	0x51, %g3
	stb	%o5,	[%l7 + %g3]
	set	0x20, %o4
	stda	%o0,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x2A, %o0
	ldsh	[%l7 + %o0],	%l2
	set	0x79, %l3
	stba	%o2,	[%l7 + %l3] 0x81
	and	%l6,	%o3,	%l5
	ba,pn	%icc,	loop_60
	nop
	set	0x0A, %i4
	sth	%o6,	[%l7 + %i4]
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%f8
	set	0x38, %i6
	swapa	[%l7 + %i6] 0x80,	%o4
loop_60:
	nop
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	set	0x1C, %l0
	stba	%g4,	[%l7 + %l0] 0x88
	nop
	set	0x38, %o3
	std	%f28,	[%l7 + %o3]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%o0
	set	0x0C, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l0
	ld	[%l7 + 0x34],	%f12
	or	%i4,	%g2,	%i2
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%i1
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%g3
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x88,	%g6
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i5
	nop
	set	0x10, %i7
	lduh	[%l7 + %i7],	%g1
	set	0x08, %g4
	stxa	%i6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x68, %i2
	sta	%f13,	[%l7 + %i2] 0x89
	and	%i0,	%l4,	%i3
	nop
	set	0x14, %o7
	ldsh	[%l7 + %o7],	%o7
	and	%g7,	%g5,	%o5
	nop
	set	0x78, %g6
	lduw	[%l7 + %g6],	%l2
	set	0x60, %l1
	stxa	%o2,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x08, %o2
	stxa	%o1,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x89,	%l6
	nop
	set	0x76, %i1
	stb	%l5,	[%l7 + %i1]
	set	0x18, %g2
	lda	[%l7 + %g2] 0x81,	%f7
	set	0x2D, %g1
	ldstuba	[%l7 + %g1] 0x81,	%o6
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f0
	nop
	set	0x50, %l2
	std	%f2,	[%l7 + %l2]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%o2
	set	0x08, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o4
	nop
	set	0x18, %g3
	std	%l0,	[%l7 + %g3]
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x81,	%i7
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x89,	%o0
	nop
	set	0x68, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x41, %l6
	ldstub	[%l7 + %l6],	%g4
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f0
	st	%f23,	[%l7 + 0x74]
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x80,	 1
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f22
	set	0x74, %l0
	lda	[%l7 + %l0] 0x80,	%f12
	and	%l0,	%g2,	%i2
	nop
	set	0x24, %o3
	sth	%i1,	[%l7 + %o3]
	fpsub32	%f22,	%f14,	%f2
	nop
	set	0x3F, %l4
	ldsb	[%l7 + %l4],	%g3
	nop
	set	0x3A, %o1
	lduh	[%l7 + %o1],	%l3
	nop
	set	0x7A, %i5
	ldstub	[%l7 + %i5],	%i5
	set	0x2C, %i3
	lda	[%l7 + %i3] 0x89,	%f1
	nop
	set	0x08, %g5
	ldsw	[%l7 + %g5],	%g6
	nop
	set	0x30, %i7
	std	%g0,	[%l7 + %i7]
	nop
	set	0x2D, %i2
	stb	%i6,	[%l7 + %i2]
	set	0x5C, %g4
	stwa	%l4,	[%l7 + %g4] 0x89
	nop
	set	0x25, %o7
	ldstub	[%l7 + %o7],	%i3
	nop
	set	0x78, %l1
	stx	%i0,	[%l7 + %l1]
	nop
	set	0x3D, %o2
	ldub	[%l7 + %o2],	%g7
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f16
	ld	[%l7 + 0x08],	%f11
	nop
	set	0x40, %i1
	stx	%o7,	[%l7 + %i1]
	nop
	set	0x18, %g2
	std	%g4,	[%l7 + %g2]
	nop
	set	0x60, %g6
	std	%f20,	[%l7 + %g6]
	nop
	set	0x30, %g1
	stx	%fsr,	[%l7 + %g1]
	and	%o5,	%o2,	%o1
	nop
	set	0x19, %o6
	ldstub	[%l7 + %o6],	%l2
	nop
	set	0x1F, %l5
	stb	%l6,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x18]
	set	0x20, %i0
	stxa	%o6,	[%l7 + %i0] 0xe2
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%o3
	fpsub16	%f30,	%f20,	%f8
	nop
	set	0x58, %g3
	std	%f6,	[%l7 + %g3]
	set	0x20, %l2
	swapa	[%l7 + %l2] 0x81,	%l1
	nop
	set	0x11, %l3
	ldsb	[%l7 + %l3],	%o4
	nop
	set	0x26, %o0
	sth	%i7,	[%l7 + %o0]
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%i4
	set	0x18, %l6
	lda	[%l7 + %l6] 0x89,	%f18
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf8
	membar	#Sync
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%l0
	and	%g2,	%i2,	%i1
	set	0x69, %g7
	stba	%g3,	[%l7 + %g7] 0x89
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x48, %o3
	std	%f2,	[%l7 + %o3]
	and	%g4,	%l3,	%i5
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x88,	 4
	nop
	set	0x38, %l0
	sth	%g1,	[%l7 + %l0]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x52, %i5
	sth	%i0,	[%l7 + %i5]
	add	%g7,	%o7,	%g5
	nop
	set	0x31, %o1
	ldub	[%l7 + %o1],	%o5
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%i6
	and	%o1,	%o2,	%l2
	nop
	set	0x48, %i3
	sth	%o6,	[%l7 + %i3]
	ld	[%l7 + 0x40],	%f22
	nop
	set	0x1C, %i2
	ldsh	[%l7 + %i2],	%l5
	nop
	set	0x60, %g4
	std	%i6,	[%l7 + %g4]
	or	%o3,	%l1,	%i7
	set	0x60, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x54, %l1
	prefetch	[%l7 + %l1],	 4
	st	%fsr,	[%l7 + 0x1C]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x08, %i7
	ldsw	[%l7 + %i7],	%g2
	nop
	set	0x28, %o2
	std	%l0,	[%l7 + %o2]
	set	0x78, %o5
	stha	%i1,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%g3
	nop
	set	0x3E, %g2
	stb	%i2,	[%l7 + %g2]
	set	0x46, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g4
	set	0x4C, %o6
	swapa	[%l7 + %o6] 0x89,	%i5
	set	0x74, %l5
	lda	[%l7 + %l5] 0x81,	%f4
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f26
	set	0x56, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g6
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x38, %l3
	lduh	[%l7 + %l3],	%l3
	ld	[%l7 + 0x1C],	%f3
	set	0x50, %g3
	stwa	%g1,	[%l7 + %g3] 0x80
	and	%i3,	%l4,	%g7
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%o6
	ld	[%l7 + 0x28],	%f28
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%i0
	nop
	set	0x18, %o4
	stx	%o5,	[%l7 + %o4]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%o2
	add	%i6,	%o6,	%l5
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc8
	add	%l2,	%o3,	%l6
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%l1
	nop
	set	0x08, %l6
	lduh	[%l7 + %l6],	%i7
	and	%o4,	%i4,	%o0
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x88,	%l0
	and	%i1,	%g2,	%i2
	set	0x38, %l4
	sta	%f31,	[%l7 + %l4] 0x81
	set	0x64, %l0
	swapa	[%l7 + %l0] 0x80,	%g3
	nop
	set	0x14, %i5
	stw	%g4,	[%l7 + %i5]
	nop
	set	0x78, %o1
	stx	%g6,	[%l7 + %o1]
	set	0x70, %g5
	stba	%l3,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x60, %i3
	stda	%i4,	[%l7 + %i3] 0x80
	set	0x2A, %i2
	ldstuba	[%l7 + %i2] 0x88,	%i3
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x88,	%l4
	nop
	set	0x7A, %g7
	sth	%g7,	[%l7 + %g7]
	nop
	set	0x78, %l1
	stw	%o7,	[%l7 + %l1]
	set	0x58, %o7
	stda	%g4,	[%l7 + %o7] 0x88
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x31, %o5
	stb	%g1,	[%l7 + %o5]
	bn,a	%xcc,	loop_61
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f0
	set	0x20, %g2
	stxa	%i0,	[%l7 + %g2] 0x81
loop_61:
	nop
	set	0x6C, %g1
	lduh	[%l7 + %g1],	%o1
	st	%f21,	[%l7 + 0x18]
	set	0x71, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o2
	nop
	set	0x48, %o2
	sth	%o5,	[%l7 + %o2]
	nop
	set	0x18, %i0
	std	%f30,	[%l7 + %i0]
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x80,	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%l5
	set	0x30, %l2
	stwa	%l2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x68, %g3
	std	%f12,	[%l7 + %g3]
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f8
	set	0x4C, %o4
	stwa	%o3,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	or	%o4,	%l6,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%i1
	or	%l0,	%i2,	%g2
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%g3
	wr 	%g0, 	0x6, 	%fprs
	set	0x68, %l6
	prefetcha	[%l7 + %l6] 0x88,	 3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%l4
	nop
	set	0x1E, %l4
	ldub	[%l7 + %l4],	%g7
	nop
	set	0x70, %o3
	std	%f30,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x20]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%g5
	nop
	set	0x28, %l0
	prefetch	[%l7 + %l0],	 3
	add	%g1,	%i0,	%o1
	set	0x76, %o1
	stba	%o2,	[%l7 + %o1] 0x88
	add	%o7,	%o6,	%i6
	nop
	set	0x76, %g5
	sth	%l5,	[%l7 + %g5]
	nop
	set	0x31, %i3
	ldub	[%l7 + %i3],	%l2
	add	%o3,	%o5,	%l1
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%o4
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%i6
	nop
	set	0x58, %g7
	sth	%i7,	[%l7 + %g7]
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%o0
	set	0x58, %o7
	stda	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x54, %i7
	swap	[%l7 + %i7],	%i4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%l0
	nop
	set	0x24, %i1
	stw	%g2,	[%l7 + %i1]
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%i2
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%g6
	set	0x30, %o6
	stwa	%g3,	[%l7 + %o6] 0x80
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f12
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%l2
	set	0x54, %l2
	stwa	%i5,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x28, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x70, %g1
	lda	[%l7 + %g1] 0x88,	%f6
	set	0x10, %g6
	sta	%f11,	[%l7 + %g6] 0x80
	fpsub16	%f18,	%f6,	%f24
	ba	%icc,	loop_62
	nop
	set	0x2C, %g3
	ldub	[%l7 + %g3],	%g4
	set	0x0A, %o4
	stha	%l4,	[%l7 + %o4] 0x88
loop_62:
	nop
	set	0x74, %i4
	stwa	%g7,	[%l7 + %i4] 0x89
	and	%i3,	%g5,	%i0
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%g1
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%o2
	and	%o7,	%o6,	%o1
	nop
	set	0x60, %i6
	std	%f28,	[%l7 + %i6]
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%i6
	wr	%l5,	%o3,	%softint
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%l2
	set	0x1C, %o3
	stwa	%l1,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%o5
	nop
	set	0x48, %i3
	stx	%o4,	[%l7 + %i3]
	nop
	set	0x08, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x2C, %i2
	ldsw	[%l7 + %i2],	%l6
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f28
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x80,	%o0
	nop
	set	0x5A, %o7
	ldsh	[%l7 + %o7],	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l0
	bge,a,pn	%xcc,	loop_63
	nop
	set	0x08, %l1
	std	%g2,	[%l7 + %l1]
	nop
	set	0x50, %g4
	std	%f26,	[%l7 + %g4]
	ld	[%l7 + 0x64],	%f15
loop_63:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%g6
	nop
	set	0x54, %i1
	swap	[%l7 + %i1],	%i7
	set	0x60, %o5
	stda	%l2,	[%l7 + %o5] 0x88
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%i5
	nop
	set	0x48, %o6
	stx	%fsr,	[%l7 + %o6]
	wr	%g3,	%l4,	%y
	nop
	set	0x64, %g2
	ldub	[%l7 + %g2],	%g7
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	nop
	setx	0x931679C41A9EFD17,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6006F848289197F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f14
	set	0x11, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i3
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%g4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1263
!	Type a   	: 26
!	Type cti   	: 28
!	Type x   	: 518
!	Type f   	: 45
!	Type i   	: 120
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
	set	0xD,	%g1
	set	0xA,	%g2
	set	0x5,	%g3
	set	0xC,	%g4
	set	0x3,	%g5
	set	0xF,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0xD,	%i1
	set	-0xE,	%i2
	set	-0xB,	%i3
	set	-0xB,	%i4
	set	-0x7,	%i5
	set	-0x3,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x7CFA6027,	%l0
	set	0x4FAD98CD,	%l1
	set	0x650B3C28,	%l2
	set	0x418187C9,	%l3
	set	0x0F9149C7,	%l4
	set	0x6B53DA7E,	%l5
	set	0x011028D9,	%l6
	!# Output registers
	set	-0x026B,	%o0
	set	-0x1442,	%o1
	set	-0x1A20,	%o2
	set	0x1129,	%o3
	set	-0x001D,	%o4
	set	-0x182C,	%o5
	set	-0x0A24,	%o6
	set	-0x06EB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	ld	[%l7 + 0x58],	%f12
	nop
	set	0x50, %l2
	std	%g0,	[%l7 + %l2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%o7
	set	0x43, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o6
	nop
	set	0x54, %g6
	stw	%i0,	[%l7 + %g6]
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x80,	%i6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc2
	or	%o1,	%l5,	%o3
	set	0x14, %o0
	stwa	%l2,	[%l7 + %o0] 0x80
	or	%l1,	%o5,	%o4
	set	0x48, %l6
	swapa	[%l7 + %l6] 0x81,	%l6
	ld	[%l7 + 0x18],	%f16
	nop
	set	0x38, %i4
	ldsw	[%l7 + %i4],	%i1
	set	0x60, %l4
	stba	%o0,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x30, %i6
	sta	%f18,	[%l7 + %i6] 0x80
	nop
	set	0x1A, %l0
	ldsh	[%l7 + %l0],	%l0
	add	%i4,	%i2,	%g2
	ld	[%l7 + 0x64],	%f30
	nop
	set	0x38, %o3
	sth	%i7,	[%l7 + %o3]
	nop
	set	0x75, %i3
	stb	%g6,	[%l7 + %i3]
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f30
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf9
	membar	#Sync
	or	%l3,	%g3,	%i5
	fpadd16s	%f20,	%f20,	%f5
	ld	[%l7 + 0x68],	%f18
	set	0x20, %o1
	stda	%g6,	[%l7 + %o1] 0x81
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%l4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%g5
	set	0x30, %i5
	sta	%f28,	[%l7 + %i5] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%i3
	nop
	set	0x28, %l1
	std	%o2,	[%l7 + %l1]
	set	0x6C, %o7
	stwa	%o6,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd0
	set	0x2C, %g4
	stwa	%i0,	[%l7 + %g4] 0x88
	set	0x3B, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o7
	and	%i6,	%l5,	%o3
	set	0x13, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l2
	bleu	%xcc,	loop_64
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%o1
	set	0x24, %g2
	sta	%f0,	[%l7 + %g2] 0x88
loop_64:
	nop
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x89,	%l0
	nop
	set	0x40, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xe2,	%o4
	nop
	set	0x46, %l3
	lduh	[%l7 + %l3],	%o5
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%i1
	nop
	set	0x68, %o4
	std	%f28,	[%l7 + %o4]
	set	0x4C, %l2
	lda	[%l7 + %l2] 0x89,	%f3
	nop
	set	0x1B, %o0
	ldub	[%l7 + %o0],	%o0
	set	0x10, %g3
	swapa	[%l7 + %g3] 0x89,	%l0
	set	0x69, %i4
	ldstuba	[%l7 + %i4] 0x89,	%l6
	nop
	set	0x1A, %l4
	lduh	[%l7 + %l4],	%i2
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%i4
	set	0x48, %l0
	stwa	%i7,	[%l7 + %l0] 0x80
	nop
	set	0x5C, %o3
	prefetch	[%l7 + %o3],	 2
	set	0x08, %i6
	stxa	%g6,	[%l7 + %i6] 0x81
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x80,	%l2
	set	0x30, %i2
	sta	%f16,	[%l7 + %i2] 0x89
	set	0x3C, %o1
	stwa	%g3,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f16
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%g2
	set	0x6D, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%g4
	st	%f12,	[%l7 + 0x6C]
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f0
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%g4
	fpsub32s	%f27,	%f2,	%f9
	nop
	set	0x10, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x78, %i7
	ldxa	[%l7 + %i7] 0x88,	%g1
	nop
	set	0x40, %i1
	stw	%i3,	[%l7 + %i1]
	set	0x64, %o6
	stwa	%l4,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x68, %g2
	stb	%o2,	[%l7 + %g2]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f0
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x80,	 2
	nop
	set	0x52, %o2
	ldsh	[%l7 + %o2],	%o7
	set	0x54, %l3
	lda	[%l7 + %l3] 0x89,	%f6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i6
	wr	%l5,	%o3,	%pic
	st	%fsr,	[%l7 + 0x14]
	st	%fsr,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x38, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%l2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f16
	nop
	set	0x08, %o4
	ldsb	[%l7 + %o4],	%o1
	nop
	set	0x44, %o0
	ldsw	[%l7 + %o0],	%o4
	nop
	set	0x39, %l2
	stb	%l1,	[%l7 + %l2]
	nop
	set	0x4C, %g3
	ldsw	[%l7 + %g3],	%o5
	nop
	set	0x4E, %l4
	lduh	[%l7 + %l4],	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%l6
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x18, %i4
	sta	%f15,	[%l7 + %i4] 0x88
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%i2
	set	0x69, %l0
	ldstuba	[%l7 + %l0] 0x89,	%i4
	nop
	set	0x3A, %i6
	ldstub	[%l7 + %i6],	%l0
	nop
	set	0x40, %i3
	std	%f6,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x1C, %o1
	lduw	[%l7 + %o1],	%g6
	nop
	set	0x68, %g5
	stx	%i7,	[%l7 + %g5]
	nop
	set	0x43, %g7
	ldsb	[%l7 + %g7],	%g3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%g2
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%l2
	nop
	set	0x0A, %i2
	ldsh	[%l7 + %i2],	%i5
	add	%g7,	%g5,	%g1
	nop
	set	0x18, %g4
	stx	%g4,	[%l7 + %g4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o2
	nop
	set	0x20, %l1
	stx	%o6,	[%l7 + %l1]
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f10
	set	0x68, %o6
	swapa	[%l7 + %o6] 0x88,	%i3
	st	%fsr,	[%l7 + 0x44]
	set	0x70, %i7
	stda	%i0,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f18
	set	0x30, %o5
	stxa	%i6,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x80,	 3
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%l5
	set	0x48, %g1
	stda	%l2,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x89,	%o3
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f2
	bne	%icc,	loop_65
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o4
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x80,	 4
loop_65:
	or	%o1,	%o0,	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o5
	nop
	set	0x0A, %l2
	ldsb	[%l7 + %l2],	%i4
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%i2
	nop
	set	0x30, %g3
	std	%l0,	[%l7 + %g3]
	nop
	set	0x08, %l6
	stw	%g6,	[%l7 + %l6]
	ld	[%l7 + 0x28],	%f6
	set	0x18, %l4
	stxa	%g3,	[%l7 + %l4] 0x88
	nop
	set	0x68, %i4
	std	%i6,	[%l7 + %i4]
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x81,	 4
	nop
	set	0x72, %i6
	ldub	[%l7 + %i6],	%i5
	set	0x2B, %i3
	stba	%g7,	[%l7 + %i3] 0x80
	set	0x60, %o1
	sta	%f18,	[%l7 + %o1] 0x80
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xea,	%g2
	nop
	set	0x38, %g7
	std	%f4,	[%l7 + %g7]
	set	0x74, %i5
	stwa	%g5,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%l4
	fpadd32	%f12,	%f14,	%f6
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	nop
	set	0x50, %l0
	lduh	[%l7 + %l0],	%g1
	nop
	set	0x70, %l1
	sth	%o6,	[%l7 + %l1]
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%i3
	nop
	set	0x0F, %i1
	ldub	[%l7 + %i1],	%o2
	nop
	set	0x70, %o6
	std	%i6,	[%l7 + %o6]
	ld	[%l7 + 0x28],	%f16
	or	%o7,	%i0,	%l5
	set	0x0D, %g2
	ldstuba	[%l7 + %g2] 0x80,	%o3
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd2
	nop
	set	0x18, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x1E, %i7
	lduh	[%l7 + %i7],	%l2
	set	0x10, %o2
	stxa	%o4,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x28, %g6
	stxa	%l1,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x81
	set	0x24, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o0
	set	0x2C, %i0
	sta	%f13,	[%l7 + %i0] 0x89
	nop
	set	0x20, %l2
	ldsw	[%l7 + %l2],	%o1
	set	0x50, %o0
	stwa	%i1,	[%l7 + %o0] 0x88
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x50, %l6
	lduw	[%l7 + %l6],	%i4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	nop
	set	0x14, %i4
	lduw	[%l7 + %i4],	%i2
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%l0
	ld	[%l7 + 0x44],	%f22
	nop
	set	0x44, %i6
	stw	%g6,	[%l7 + %i6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o5
	add	%i7,	%l3,	%g7
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc8
	nop
	set	0x2E, %o1
	sth	%g2,	[%l7 + %o1]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd8
	nop
	set	0x38, %g7
	std	%i4,	[%l7 + %g7]
	nop
	set	0x60, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x28, %i3
	std	%g4,	[%l7 + %i3]
	set	0x30, %i2
	stha	%g5,	[%l7 + %i2] 0x81
	set	0x29, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l4
	and	%o6,	%i3,	%g1
	wr	%i6,	%o2,	%y
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%l5
	and	%o7,	%o3,	%l2
	nop
	set	0x43, %l1
	ldsb	[%l7 + %l1],	%o4
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%o0
	nop
	set	0x1A, %l0
	ldstub	[%l7 + %l0],	%l1
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f0
	nop
	set	0x5E, %g2
	ldstub	[%l7 + %g2],	%i1
	nop
	set	0x3C, %o5
	ldstub	[%l7 + %o5],	%l6
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	nop
	set	0x0E, %i1
	lduh	[%l7 + %i1],	%o1
	st	%f30,	[%l7 + 0x08]
	wr	%l0,	%i2,	%ccr
	set	0x20, %o2
	stxa	%g6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x78, %i7
	sta	%f2,	[%l7 + %i7] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%i7
	add	%l3,	%g7,	%g2
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%i4
	nop
	set	0x52, %l3
	sth	%o5,	[%l7 + %l3]
	nop
	set	0x38, %i0
	ldx	[%l7 + %i0],	%g4
	set	0x5D, %g6
	stba	%l4,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x28, %o0
	stx	%o6,	[%l7 + %o0]
	st	%f3,	[%l7 + 0x50]
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	fpsub32	%f8,	%f30,	%f24
	set	0x0B, %l2
	stba	%g5,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x18, %l6
	stha	%g1,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x20, %i4
	sta	%f14,	[%l7 + %i4] 0x80
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x58, %l4
	std	%o2,	[%l7 + %l4]
	set	0x0D, %o4
	stba	%i6,	[%l7 + %o4] 0x81
	nop
	set	0x18, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x30, %o1
	lda	[%l7 + %o1] 0x88,	%f3
	set	0x73, %g5
	stba	%l5,	[%l7 + %g5] 0x88
	nop
	set	0x16, %o3
	lduh	[%l7 + %o3],	%i0
	nop
	set	0x58, %g7
	std	%f8,	[%l7 + %g7]
	set	0x40, %i3
	sta	%f20,	[%l7 + %i3] 0x81
	bg,a,pn	%xcc,	loop_66
	ld	[%l7 + 0x30],	%f24
	nop
	set	0x62, %i5
	lduh	[%l7 + %i5],	%o7
	st	%fsr,	[%l7 + 0x50]
loop_66:
	nop
	set	0x34, %o7
	lduw	[%l7 + %o7],	%l2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o4
	be,pt	%xcc,	loop_67
	nop
	set	0x3A, %i2
	lduh	[%l7 + %i2],	%l1
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x16, %l1
	stha	%i1,	[%l7 + %l1] 0x89
loop_67:
	nop
	set	0x50, %l0
	stwa	%l6,	[%l7 + %l0] 0x89
	set	0x4C, %g2
	sta	%f22,	[%l7 + %g2] 0x81
	and	%i4,	%o1,	%o0
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f14
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%l0
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xea,	%g2
	set	0x38, %o6
	prefetcha	[%l7 + %o6] 0x88,	 2
	set	0x1C, %i1
	lda	[%l7 + %i1] 0x80,	%f7
	and	%l3,	%g6,	%g7
	nop
	set	0x78, %i7
	swap	[%l7 + %i7],	%g2
	set	0x34, %g1
	lda	[%l7 + %g1] 0x81,	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%g4
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xea,	%l4
	set	0x1A, %i0
	stha	%o5,	[%l7 + %i0] 0x80
	set	0x64, %g6
	sta	%f5,	[%l7 + %g6] 0x89
	nop
	set	0x48, %l3
	ldsb	[%l7 + %l3],	%i3
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf9
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%o6
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%o2
	set	0x6E, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g1
	nop
	set	0x68, %i4
	stw	%i6,	[%l7 + %i4]
	nop
	set	0x40, %l2
	std	%f4,	[%l7 + %l2]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd2
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x80,	%i0
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	nop
	set	0x6C, %o3
	stw	%l2,	[%l7 + %o3]
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x88,	%o7
	set	0x70, %g7
	stda	%o4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x5E, %i5
	lduh	[%l7 + %i5],	%l1
	set	0x40, %o7
	stda	%i0,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x79, %i3
	ldsb	[%l7 + %i3],	%l6
	set	0x1E, %i2
	stha	%o3,	[%l7 + %i2] 0xeb
	membar	#Sync
	and	%i4,	%o1,	%o0
	nop
	set	0x28, %g4
	std	%f4,	[%l7 + %g4]
	set	0x2B, %l1
	stba	%l0,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	nop
	setx	0xF3750ACD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x38AA60E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f23,	%f27
	or	%g3,	%i2,	%i7
	nop
	set	0x38, %g2
	ldsh	[%l7 + %g2],	%g6
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x81,	%g7
	set	0x3C, %l0
	stba	%g2,	[%l7 + %l0] 0x88
	set	0x2C, %o6
	stha	%i5,	[%l7 + %o6] 0x89
	set	0x34, %l5
	sta	%f3,	[%l7 + %l5] 0x81
	nop
	set	0x65, %i1
	stb	%l3,	[%l7 + %i1]
	nop
	set	0x54, %i7
	stw	%g4,	[%l7 + %i7]
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f22
	st	%f23,	[%l7 + 0x44]
	fpadd32	%f14,	%f28,	%f22
	set	0x6A, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l4
	add	%o5,	%g5,	%o6
	nop
	set	0x68, %g6
	swap	[%l7 + %g6],	%i3
	nop
	set	0x18, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x14, %l3
	sta	%f26,	[%l7 + %l3] 0x81
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%o2
	fpadd16s	%f15,	%f2,	%f8
	set	0x7C, %o0
	sta	%f25,	[%l7 + %o0] 0x89
	set	0x24, %l2
	lda	[%l7 + %l2] 0x88,	%f27
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i6
	set	0x10, %i6
	stxa	%g1,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x70, %o4
	stxa	%l5,	[%l7 + %o4] 0x89
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x88,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%o7
	st	%fsr,	[%l7 + 0x14]
	st	%f24,	[%l7 + 0x74]
	st	%fsr,	[%l7 + 0x18]
	set	0x64, %o1
	lda	[%l7 + %o1] 0x81,	%f23
	nop
	set	0x34, %l4
	stw	%o4,	[%l7 + %l4]
	nop
	set	0x39, %g7
	stb	%i1,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x1E, %i5
	ldstub	[%l7 + %i5],	%l6
	set	0x0A, %o3
	ldstuba	[%l7 + %o3] 0x88,	%o3
	set	0x2B, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x464, 	%sys_tick_cmpr
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l0
	add	%g3,	%i2,	%g6
	set	0x43, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i7
	st	%f11,	[%l7 + 0x54]
	nop
	set	0x3B, %g4
	stb	%g7,	[%l7 + %g4]
	nop
	set	0x45, %l1
	ldub	[%l7 + %l1],	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	set	0x20, %i2
	stwa	%g2,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x6C, %o5
	stb	%l4,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x22, %o6
	lduh	[%l7 + %o6],	%o5
	nop
	set	0x60, %l0
	std	%o6,	[%l7 + %l0]
	nop
	set	0x56, %i1
	ldsb	[%l7 + %i1],	%i3
	fpsub32	%f18,	%f26,	%f10
	and	%o2,	%i6,	%g1
	set	0x38, %l5
	stda	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x70, %i7
	std	%f4,	[%l7 + %i7]
	nop
	set	0x60, %i0
	stx	%i0,	[%l7 + %i0]
	and	%g5,	%l2,	%o4
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	nop
	nop
	setx	0xD57C57B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x4A58FD89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f6,	%f1
	nop
	set	0x4D, %g6
	ldstub	[%l7 + %g6],	%l6
	set	0x48, %g3
	stha	%o3,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x26, %g1
	ldub	[%l7 + %g1],	%o7
	set	0x14, %l6
	stwa	%l1,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x42, %o0
	sth	%i4,	[%l7 + %o0]
	set	0x2E, %i4
	stba	%o1,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x9F7D6796B743D139,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5B0C0CA9AB8362C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f6,	%f22
	nop
	set	0x0E, %l2
	lduh	[%l7 + %l2],	%o0
	set	0x30, %i6
	stwa	%g3,	[%l7 + %i6] 0x89
	ld	[%l7 + 0x5C],	%f0
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x81,	%l0
	set	0x58, %g5
	stba	%i2,	[%l7 + %g5] 0x80
	nop
	set	0x35, %l4
	ldub	[%l7 + %l4],	%i7
	bge,a,pn	%icc,	loop_68
	nop
	set	0x64, %o1
	lduw	[%l7 + %o1],	%g6
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x81
loop_68:
	nop
	set	0x18, %g7
	swap	[%l7 + %g7],	%i5
	nop
	set	0x10, %i3
	stx	%l3,	[%l7 + %i3]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf1
	membar	#Sync
	st	%f5,	[%l7 + 0x40]
	nop
	set	0x14, %g4
	sth	%g7,	[%l7 + %g4]
	nop
	set	0x52, %l1
	stb	%g2,	[%l7 + %l1]
	nop
	set	0x40, %g2
	lduh	[%l7 + %g2],	%g4
	add	%l4,	%o5,	%i3
	set	0x66, %i2
	stha	%o6,	[%l7 + %i2] 0x88
	nop
	set	0x08, %o5
	std	%f4,	[%l7 + %o5]
	nop
	set	0x24, %o3
	swap	[%l7 + %o3],	%o2
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x20, %l0
	lduw	[%l7 + %l0],	%g1
	nop
	set	0x58, %o6
	std	%l4,	[%l7 + %o6]
	st	%f30,	[%l7 + 0x6C]
	wr	%i6,	%g5,	%sys_tick
	set	0x08, %l5
	stda	%i0,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x40, %i7
	std	%f16,	[%l7 + %i7]
	and	%o4,	%l2,	%i1
	set	0x60, %i1
	swapa	[%l7 + %i1] 0x81,	%l6
	or	%o3,	%l1,	%o7
	set	0x18, %i0
	stda	%i4,	[%l7 + %i0] 0xe2
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%o0
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x81,	 4
	nop
	set	0x10, %g3
	swap	[%l7 + %g3],	%i2
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f18
	nop
	set	0x4D, %l6
	stb	%l0,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x7C]
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xeb,	%g6
	set	0x6C, %l3
	lda	[%l7 + %l3] 0x89,	%f6
	or	%i5,	%l3,	%g7
	set	0x78, %i4
	stxa	%i7,	[%l7 + %i4] 0x80
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%g4
	add	%g2,	%o5,	%i3
	nop
	set	0x48, %o0
	swap	[%l7 + %o0],	%l4
	nop
	set	0x34, %o4
	sth	%o2,	[%l7 + %o4]
	wr	%o6,	%g1,	%set_softint
	nop
	set	0x0E, %i6
	stb	%i6,	[%l7 + %i6]
	nop
	set	0x39, %l4
	stb	%g5,	[%l7 + %l4]
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x1C, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x6C, %i3
	sta	%f27,	[%l7 + %i3] 0x88
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%i0
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x81,	%o4
	nop
	set	0x20, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x48, %o5
	stx	%l2,	[%l7 + %o5]
	nop
	set	0x10, %o3
	std	%f18,	[%l7 + %o3]
	set	0x18, %i2
	stda	%i0,	[%l7 + %i2] 0x80
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x89,	%o3
	nop
	set	0x16, %l0
	ldstub	[%l7 + %l0],	%l1
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%l6
	nop
	set	0x74, %i1
	prefetch	[%l7 + %i1],	 3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o1
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x89,	%o7
	nop
	set	0x28, %i7
	stx	%g3,	[%l7 + %i7]
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x88,	%i2
	nop
	set	0x6C, %g3
	lduh	[%l7 + %g3],	%l0
	nop
	set	0x6D, %g1
	ldstub	[%l7 + %g1],	%o0
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%l3
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i4
	be,pt	%icc,	loop_69
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%i7
	nop
	set	0x34, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x74, %i4
	stw	%g7,	[%l7 + %i4]
loop_69:
	nop
	set	0x2C, %o4
	stw	%g4,	[%l7 + %o4]
	nop
	nop
	setx	0x478587B2D70C1812,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x073193C4DB025E44,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f20,	%f6
	nop
	set	0x3E, %o0
	lduh	[%l7 + %o0],	%o5
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%g2
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	set	0x40, %l4
	stxa	%o2,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x74, %i5
	sth	%i3,	[%l7 + %i5]
	add	%o6,	%g1,	%g5
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xda
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	fpsub32s	%f21,	%f12,	%f7
	nop
	set	0x7C, %g7
	swap	[%l7 + %g7],	%i6
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	wr	%i0,	%o4,	%set_softint
	nop
	set	0x3D, %g4
	ldub	[%l7 + %g4],	%l5
	nop
	set	0x14, %g2
	lduh	[%l7 + %g2],	%i1
	nop
	set	0x30, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x60, %o3
	swapa	[%l7 + %o3] 0x88,	%l2
	fpsub32s	%f18,	%f29,	%f0
	st	%f5,	[%l7 + 0x54]
	set	0x60, %o5
	stwa	%o3,	[%l7 + %o5] 0xeb
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i4
	nop
	set	0x57, %i2
	ldub	[%l7 + %i2],	%l1
	set	0x5D, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o1
	or	%g3,	%i2,	%l0
	nop
	set	0x6A, %o6
	lduh	[%l7 + %o6],	%o7
	nop
	set	0x60, %l5
	stx	%g6,	[%l7 + %l5]
	and	%l3,	%o0,	%i5
	nop
	set	0x5E, %i1
	ldstub	[%l7 + %i1],	%i7
	fpsub16s	%f28,	%f2,	%f11
	nop
	set	0x41, %i0
	ldub	[%l7 + %i0],	%g4
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xe2,	%g6
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	set	0x30, %g3
	lda	[%l7 + %g3] 0x89,	%f1
	nop
	set	0x16, %l6
	ldsb	[%l7 + %l6],	%o5
	nop
	set	0x35, %g1
	ldub	[%l7 + %g1],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%i3
	set	0x41, %l3
	stba	%g1,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x70, %l2
	stb	%g5,	[%l7 + %l2]
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x88,	%i6
	and	%o6,	%o4,	%i0
	set	0x64, %o4
	stha	%l5,	[%l7 + %o4] 0x80
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x38, %i4
	stw	%l2,	[%l7 + %i4]
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f12
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%o2
	set	0x70, %i3
	stwa	%i1,	[%l7 + %i3] 0x80
	nop
	set	0x38, %g5
	lduw	[%l7 + %g5],	%l6
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%i4
	fpsub16s	%f4,	%f1,	%f31
	nop
	set	0x44, %g7
	ldsh	[%l7 + %g7],	%l1
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x80,	 3
	set	0x44, %g2
	sta	%f16,	[%l7 + %g2] 0x89
	nop
	set	0x60, %l1
	ldsb	[%l7 + %l1],	%o1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	nop
	set	0x08, %g4
	std	%l0,	[%l7 + %g4]
	set	0x54, %o5
	stha	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x14, %i2
	stha	%o7,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x4B, %o6
	stba	%g6,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf9
	membar	#Sync
	nop
	set	0x7C, %l5
	ldsh	[%l7 + %l5],	%l3
	nop
	set	0x10, %i0
	sth	%o0,	[%l7 + %i0]
	nop
	set	0x35, %i7
	ldstub	[%l7 + %i7],	%i5
	add	%g4,	%g7,	%i7
	nop
	set	0x3C, %g6
	ldstub	[%l7 + %g6],	%o5
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x89,	%g2
	nop
	set	0x30, %l6
	prefetch	[%l7 + %l6],	 1
	st	%f6,	[%l7 + 0x74]
	nop
	nop
	setx	0x3DEA06A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC5A3FD69,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f30,	%f29
	nop
	set	0x78, %g1
	prefetch	[%l7 + %g1],	 3
	or	%o2,	%l4,	%i3
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	set	0x64, %g3
	lda	[%l7 + %g3] 0x81,	%f15
	wr	%o6,	%o4,	%clear_softint
	and	%g5,	%i0,	%l2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x68, %o4
	std	%f4,	[%l7 + %o4]
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x89,	%l5
	set	0x0F, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o3
	add	%i1,	%l6,	%l1
	wr	%g3,	%o1,	%sys_tick
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	wr	%i4,	%i2,	%softint
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x88,	 3
	add	%g6,	%l0,	%o0
	set	0x64, %o1
	lda	[%l7 + %o1] 0x89,	%f8
	st	%f0,	[%l7 + 0x48]
	bn,a,pt	%icc,	loop_70
	st	%f11,	[%l7 + 0x08]
	nop
	set	0x50, %i4
	swap	[%l7 + %i4],	%i5
	set	0x20, %i3
	stxa	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
loop_70:
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%g7
	and	%l3,	%o5,	%i7
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%o2
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f14
	set	0x08, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	nop
	set	0x2E, %g2
	ldsb	[%l7 + %g2],	%i3
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%o4
	nop
	set	0x10, %g4
	std	%f6,	[%l7 + %g4]
	set	0x74, %l1
	lda	[%l7 + %l1] 0x80,	%f23
	nop
	set	0x6A, %o5
	ldsb	[%l7 + %o5],	%i0
	ld	[%l7 + 0x20],	%f4
	wr	%l2,	%g5,	%set_softint
	set	0x4C, %i2
	stwa	%o3,	[%l7 + %i2] 0x88
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f4
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%i0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xcc
	nop
	set	0x7C, %i7
	stw	%l6,	[%l7 + %i7]
	add	%l5,	%g3,	%l1
	nop
	set	0x70, %l5
	std	%f4,	[%l7 + %l5]
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%f2
	fpadd32	%f2,	%f18,	%f26
	nop
	set	0x60, %i1
	stx	%i4,	[%l7 + %i1]
	set	0x57, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i2
	nop
	set	0x50, %l6
	std	%o0,	[%l7 + %l6]
	nop
	set	0x6C, %l3
	stw	%o7,	[%l7 + %l3]
	set	0x48, %g3
	stda	%l0,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x54, %l2
	ldsh	[%l7 + %l2],	%o0
	st	%f28,	[%l7 + 0x5C]
	set	0x54, %o0
	sta	%f4,	[%l7 + %o0] 0x81
	set	0x34, %o4
	sta	%f18,	[%l7 + %o4] 0x88
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x1C, %l4
	stha	%g6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x60, %o2
	prefetch	[%l7 + %o2],	 1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xda
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%g7
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xe2,	%l2
	nop
	set	0x62, %g5
	ldsh	[%l7 + %g5],	%o5
	nop
	set	0x2C, %g7
	prefetch	[%l7 + %g7],	 2
	st	%fsr,	[%l7 + 0x5C]
	or	%i5,	%i7,	%o2
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %o7
	stda	%l4,	[%l7 + %o7] 0x80
	set	0x18, %i5
	stda	%i2,	[%l7 + %i5] 0x89
	nop
	set	0x1C, %i3
	stw	%i6,	[%l7 + %i3]
	nop
	set	0x46, %o3
	sth	%o6,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x24]
	add	%g2,	%o4,	%g1
	set	0x68, %g2
	lda	[%l7 + %g2] 0x89,	%f4
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xd2
	nop
	set	0x60, %o5
	lduw	[%l7 + %o5],	%i0
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 1
	add	%g5,	%l2,	%i1
	set	0x70, %l0
	stwa	%o3,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x24, %l1
	ldub	[%l7 + %l1],	%l5
	fpadd16	%f8,	%f4,	%f0
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf9
	membar	#Sync
	nop
	set	0x2A, %o6
	lduh	[%l7 + %o6],	%g3
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f18
	nop
	set	0x28, %g6
	stw	%l6,	[%l7 + %g6]
	nop
	set	0x70, %i1
	ldsw	[%l7 + %i1],	%i4
	nop
	set	0x28, %i7
	stw	%l1,	[%l7 + %i7]
	nop
	set	0x40, %l6
	prefetch	[%l7 + %l6],	 0
	st	%f26,	[%l7 + 0x6C]
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%i2
	set	0x42, %g3
	stba	%o7,	[%l7 + %g3] 0x89
	nop
	set	0x4D, %g1
	ldub	[%l7 + %g1],	%o1
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x80,	%o0
	nop
	set	0x08, %l2
	std	%l0,	[%l7 + %l2]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	fpsub16s	%f15,	%f23,	%f23
	set	0x50, %o2
	stda	%g6,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x18, %i4
	ldxa	[%l7 + %i4] 0x89,	%g4
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x89,	%l3
	wr	%o5,	%i5,	%sys_tick
	nop
	set	0x42, %o1
	ldsb	[%l7 + %o1],	%g7
	nop
	set	0x12, %g5
	sth	%i7,	[%l7 + %g5]
	fpadd32	%f2,	%f26,	%f28
	fpadd32s	%f24,	%f2,	%f9
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd0
	nop
	set	0x14, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%f16
	add	%o2,	%l4,	%i3
	nop
	set	0x18, %o3
	lduh	[%l7 + %o3],	%i6
	set	0x10, %i5
	stxa	%g2,	[%l7 + %i5] 0xeb
	membar	#Sync
	ld	[%l7 + 0x1C],	%f24
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f12
	set	0x11, %g4
	stba	%o6,	[%l7 + %g4] 0x88
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x89,	 2
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%i0
	nop
	set	0x60, %l0
	ldsw	[%l7 + %l0],	%g1
	nop
	set	0x38, %i0
	std	%l2,	[%l7 + %i0]
	and	%g5,	%i1,	%l5
	nop
	set	0x7A, %o6
	ldsh	[%l7 + %o6],	%g3
	nop
	set	0x15, %l5
	ldstub	[%l7 + %l5],	%l6
	nop
	set	0x44, %l1
	ldub	[%l7 + %l1],	%o3
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0
	st	%fsr,	[%l7 + 0x74]
	bge,a,pn	%xcc,	loop_71
	nop
	set	0x0A, %i7
	lduh	[%l7 + %i7],	%i2
	set	0x68, %g6
	stxa	%l1,	[%l7 + %g6] 0x80
loop_71:
	nop
	set	0x2C, %l6
	swapa	[%l7 + %l6] 0x88,	%o1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	nop
	set	0x20, %g1
	std	%f26,	[%l7 + %g1]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%l0
	nop
	set	0x14, %o4
	sth	%o0,	[%l7 + %o4]
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g6
	nop
	set	0x10, %l2
	ldsw	[%l7 + %l2],	%i5
	nop
	set	0x30, %o2
	std	%o4,	[%l7 + %o2]
	set	0x54, %i4
	stwa	%i7,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x34, %l4
	lduw	[%l7 + %l4],	%g7
	ble,pt	%xcc,	loop_72
	nop
	set	0x08, %o1
	lduw	[%l7 + %o1],	%o2
	set	0x78, %g5
	stxa	%i3,	[%l7 + %g5] 0xea
	membar	#Sync
loop_72:
	nop
	set	0x30, %g7
	stwa	%l4,	[%l7 + %g7] 0xeb
	membar	#Sync
	bge,pt	%icc,	loop_73
	nop
	set	0x60, %i6
	stw	%g2,	[%l7 + %i6]
	nop
	set	0x70, %o7
	std	%f6,	[%l7 + %o7]
	be,a,pn	%icc,	loop_74
loop_73:
	nop
	set	0x78, %o3
	swap	[%l7 + %o3],	%o6
	ld	[%l7 + 0x20],	%f23
	set	0x40, %i3
	sta	%f31,	[%l7 + %i3] 0x88
loop_74:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x5E, %i5
	ldsh	[%l7 + %i5],	%g1
	bne,a,pn	%xcc,	loop_75
	nop
	set	0x70, %g2
	lduh	[%l7 + %g2],	%o4
	nop
	set	0x4C, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x1C, %o5
	stwa	%l2,	[%l7 + %o5] 0x89
loop_75:
	and	%g5,	%l5,	%i1
	add	%l6,	%o3,	%g3
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x89,	%i2
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x81,	 2
	set	0x39, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o1
	nop
	set	0x7C, %l5
	lduh	[%l7 + %l5],	%l1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xc8
	nop
	set	0x5E, %i2
	stb	%o7,	[%l7 + %i2]
	nop
	set	0x28, %i1
	lduh	[%l7 + %i1],	%o0
	bleu,pn	%icc,	loop_76
	nop
	set	0x5D, %g6
	ldstub	[%l7 + %g6],	%g4
	set	0x74, %l6
	sta	%f7,	[%l7 + %l6] 0x89
loop_76:
	and	%l3,	%g6,	%l0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%o5
	add	%i7,	%g7,	%o2
	set	0x4F, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l4
	bgu,a,pt	%xcc,	loop_77
	st	%f11,	[%l7 + 0x30]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%i3
loop_77:
	nop
	set	0x7C, %o0
	lduh	[%l7 + %o0],	%i6
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%o6
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f16
	nop
	set	0x2A, %l3
	ldsh	[%l7 + %l3],	%i0
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd8
	st	%fsr,	[%l7 + 0x74]
	or	%g1,	%l2,	%g5
	add	%l5,	%i1,	%o4
	nop
	set	0x70, %i4
	prefetch	[%l7 + %i4],	 3
	ba,pn	%icc,	loop_78
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%i6
	nop
	set	0x16, %o1
	sth	%o3,	[%l7 + %o1]
	nop
	set	0x70, %g5
	stw	%g3,	[%l7 + %g5]
loop_78:
	nop
	set	0x79, %g7
	ldstub	[%l7 + %g7],	%i4
	nop
	set	0x4C, %i6
	swap	[%l7 + %i6],	%i2
	set	0x2C, %o7
	sta	%f21,	[%l7 + %o7] 0x88
	nop
	set	0x72, %l4
	sth	%l1,	[%l7 + %l4]
	set	0x0C, %i3
	lda	[%l7 + %i3] 0x81,	%f14
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xda,	%f16
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%o7
	or	%o0,	%o1,	%l3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%g6
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x80,	%l0
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%o4
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x89,	 1
	set	0x78, %i0
	stwa	%g7,	[%l7 + %i0] 0x89
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%i5
	set	0x68, %l5
	stda	%l4,	[%l7 + %l5] 0x88
	or	%g2,	%i3,	%i6
	and	%o6,	%i0,	%o2
	nop
	set	0x4C, %l1
	ldsh	[%l7 + %l1],	%g1
	nop
	set	0x40, %o5
	ldx	[%l7 + %o5],	%g5
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x89,	 2
	nop
	set	0x16, %i1
	lduh	[%l7 + %i1],	%i1
	nop
	set	0x0C, %l6
	stw	%o4,	[%l7 + %l6]
	bge	%icc,	loop_79
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x70, %g6
	ldsh	[%l7 + %g6],	%l6
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%l5
loop_79:
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g2
	set	0x2C, %i7
	stwa	%o3,	[%l7 + %i7] 0xeb
	membar	#Sync
	add	%i2,	%i4,	%l1
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f0
	nop
	nop
	setx	0x1CBF636C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xD7C3F3BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f19,	%f18
	add	%o0,	%o1,	%l3
	set	0x4A, %o2
	stba	%g4,	[%l7 + %o2] 0x81
	set	0x30, %l3
	lda	[%l7 + %l3] 0x89,	%f25
	wr	%o7,	%g6,	%softint
	fpsub16s	%f18,	%f13,	%f0
	nop
	set	0x60, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %i4
	stda	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x89,	%o5
	nop
	set	0x63, %g7
	ldub	[%l7 + %g7],	%i7
	set	0x18, %g5
	stba	%i5,	[%l7 + %g5] 0x89
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g2
	st	%f11,	[%l7 + 0x10]
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x80,	%i3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%g7
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xe3,	%o6
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	set	0x2E, %i3
	sth	%i0,	[%l7 + %i3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%l2
	wr	%g5,	%i1,	%set_softint
	st	%f8,	[%l7 + 0x40]
	nop
	set	0x64, %g2
	ldub	[%l7 + %g2],	%o4
	or	%l6,	%l5,	%o3
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x88,	%i2
	nop
	set	0x36, %i5
	stb	%i4,	[%l7 + %i5]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xd8
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd8
	set	0x48, %i0
	ldxa	[%l7 + %i0] 0x81,	%l1
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x80,	%f9
	set	0x60, %l1
	stda	%o0,	[%l7 + %l1] 0xeb
	membar	#Sync
	st	%f10,	[%l7 + 0x24]
	and	%g3,	%o1,	%l3
	nop
	set	0x64, %o6
	ldsw	[%l7 + %o6],	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%l0
	nop
	set	0x28, %i2
	std	%o6,	[%l7 + %i2]
	be,a,pt	%xcc,	loop_80
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%o5
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%i6
loop_80:
	nop
	set	0x0B, %g3
	ldstuba	[%l7 + %g3] 0x80,	%i5
	wr	%l4,	%g2,	%y
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc0
	add	%i3,	%g7,	%i6
	nop
	set	0x3B, %o5
	stb	%o2,	[%l7 + %o5]
	wr 	%g0, 	0x7, 	%fprs
	fpsub16	%f20,	%f10,	%f26
	nop
	set	0x20, %g1
	std	%f20,	[%l7 + %g1]
	set	0x60, %o0
	stda	%g0,	[%l7 + %o0] 0x88
	set	0x50, %i7
	stxa	%l2,	[%l7 + %i7] 0x89
	or	%i1,	%g5,	%o4
	nop
	set	0x2C, %o4
	swap	[%l7 + %o4],	%l6
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x88,	 4
	set	0x08, %o2
	stba	%i2,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x73, %i4
	stb	%l5,	[%l7 + %i4]
	or	%i4,	%o0,	%g3
	set	0x2C, %o1
	sta	%f8,	[%l7 + %o1] 0x81
	set	0x0E, %g7
	stha	%l1,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x08, %l2
	stw	%l3,	[%l7 + %l2]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f0
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x2C, %i6
	ldub	[%l7 + %i6],	%g4
	bgu,a	%xcc,	loop_81
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f20
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%g6
loop_81:
	nop
	set	0x70, %l4
	std	%l0,	[%l7 + %l4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDF4, 	%sys_tick_cmpr
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x80,	%o5
	ld	[%l7 + 0x30],	%f24
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f16
	set	0x28, %l0
	sta	%f20,	[%l7 + %l0] 0x81
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x81,	%i6
	nop
	set	0x12, %l5
	ldsh	[%l7 + %l5],	%i5
	nop
	set	0x58, %l1
	swap	[%l7 + %l1],	%l4
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%i2
	set	0x4A, %i2
	stha	%g2,	[%l7 + %i2] 0x80
	nop
	set	0x13, %o6
	ldstub	[%l7 + %o6],	%i6
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x88,	%g7
	nop
	set	0x6C, %l6
	ldsh	[%l7 + %l6],	%o2
	st	%f15,	[%l7 + 0x08]
	set	0x74, %g3
	sta	%f26,	[%l7 + %g3] 0x89
	set	0x24, %o5
	stwa	%o6,	[%l7 + %o5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x24, %g6
	ldsh	[%l7 + %g6],	%g1
	set	0x50, %o0
	stda	%i0,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%i1
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%g5
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x89,	%o4
	nop
	set	0x0A, %o2
	ldub	[%l7 + %o2],	%l2
	set	0x4C, %g1
	stwa	%o3,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x60, %i4
	ldsw	[%l7 + %i4],	%l6
	and	%i2,	%l5,	%i4
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x81,	%o0
	add	%l1,	%g3,	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%g6
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%o7
	ld	[%l7 + 0x20],	%f9
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o1
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%o4
	nop
	nop
	setx	0x526288CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x07E7FBAC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f9,	%f4
	or	%i5,	%l4,	%i3
	bge	%xcc,	loop_82
	bgu	%xcc,	loop_83
	nop
	set	0x74, %o7
	stw	%i7,	[%l7 + %o7]
	set	0x10, %i6
	lda	[%l7 + %i6] 0x88,	%f14
loop_82:
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%i6
loop_83:
	nop
	set	0x38, %g2
	ldstub	[%l7 + %g2],	%g7
	nop
	set	0x0A, %i3
	ldsb	[%l7 + %i3],	%g2
	set	0x30, %l4
	stxa	%o6,	[%l7 + %l4] 0x89
	nop
	set	0x48, %i5
	prefetch	[%l7 + %i5],	 1
	and	%g1,	%o2,	%i0
	or	%g5,	%o4,	%l2
	nop
	set	0x0C, %l0
	prefetch	[%l7 + %l0],	 3
	set	0x70, %i0
	ldxa	[%l7 + %i0] 0x80,	%i1
	set	0x46, %g4
	stha	%o3,	[%l7 + %g4] 0x89
	nop
	set	0x26, %l5
	stb	%i2,	[%l7 + %l5]
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%l4
	nop
	set	0x48, %l1
	ldsb	[%l7 + %l1],	%i4
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f6
	nop
	set	0x70, %i2
	ldsw	[%l7 + %i2],	%o0
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x81,	%l1
	nop
	set	0x30, %i1
	swap	[%l7 + %i1],	%l6
	set	0x38, %g3
	stba	%l3,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x10, %o5
	ldsw	[%l7 + %o5],	%g4
	or	%g6,	%g3,	%l0
	set	0x24, %g6
	sta	%f28,	[%l7 + %g6] 0x89
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	nop
	set	0x10, %o0
	sth	%o7,	[%l7 + %o0]
	set	0x6C, %o4
	swapa	[%l7 + %o4] 0x88,	%o5
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%l4
	set	0x68, %g1
	stxa	%i5,	[%l7 + %g1] 0x81
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f14
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xeb,	%i6
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x88,	 2
	nop
	set	0x71, %g7
	stb	%i6,	[%l7 + %g7]
	set	0x71, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g2
	nop
	set	0x18, %o7
	prefetch	[%l7 + %o7],	 0
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x89,	%o6
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xca
	set	0x30, %g2
	stha	%g7,	[%l7 + %g2] 0x81
	nop
	nop
	setx	0x234A8E547522A9E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1C7F80D6FB8B0476,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f12
	set	0x60, %i3
	stda	%o2,	[%l7 + %i3] 0x88
	set	0x2A, %l4
	stba	%g1,	[%l7 + %l4] 0x89
	set	0x10, %i5
	swapa	[%l7 + %i5] 0x89,	%g5
	set	0x48, %l0
	lda	[%l7 + %l0] 0x81,	%f11
	st	%f30,	[%l7 + 0x44]
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x18, %l5
	stx	%o4,	[%l7 + %l5]
	nop
	set	0x4C, %o3
	ldsh	[%l7 + %o3],	%l2
	or	%i1,	%i0,	%i2
	nop
	set	0x18, %g4
	lduw	[%l7 + %g4],	%o3
	set	0x78, %o6
	sta	%f20,	[%l7 + %o6] 0x81
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xe2,	%i4
	nop
	set	0x20, %i2
	stx	%l5,	[%l7 + %i2]
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x89,	%l1
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xe3,	%i6
	nop
	set	0x30, %i1
	std	%f28,	[%l7 + %i1]
	nop
	set	0x42, %o5
	ldub	[%l7 + %o5],	%o0
	nop
	set	0x70, %g6
	lduh	[%l7 + %g6],	%l3
	set	0x6C, %o0
	stba	%g4,	[%l7 + %o0] 0x80
	nop
	nop
	setx	0x12BF718B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x1A409664,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f29,	%f26
	ld	[%l7 + 0x38],	%f21
	set	0x68, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g3
	nop
	set	0x7A, %o4
	ldsh	[%l7 + %o4],	%g6
	nop
	set	0x73, %g1
	stb	%o1,	[%l7 + %g1]
	set	0x3D, %o2
	stba	%l0,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x08, %l3
	ldsw	[%l7 + %l3],	%o7
	or	%o5,	%i5,	%i7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f16
	nop
	set	0x24, %g7
	ldsw	[%l7 + %g7],	%l4
	add	%i6,	%g2,	%o6
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%i2
	wr	%o2,	%g1,	%sys_tick
	and	%g5,	%o4,	%g7
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%l2
	st	%fsr,	[%l7 + 0x44]
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x80,	%i0
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x28, %g5
	sth	%i2,	[%l7 + %g5]
	set	0x64, %g2
	lda	[%l7 + %g2] 0x89,	%f27
	nop
	set	0x38, %i3
	std	%f12,	[%l7 + %i3]
	set	0x78, %l4
	stha	%i1,	[%l7 + %l4] 0x80
	fpsub16s	%f7,	%f4,	%f21
	nop
	set	0x2E, %i6
	ldsh	[%l7 + %i6],	%i4
	set	0x60, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o3
	nop
	set	0x68, %i0
	stw	%l1,	[%l7 + %i0]
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%l6
	nop
	set	0x10, %o3
	stx	%o0,	[%l7 + %o3]
	set	0x30, %g4
	lda	[%l7 + %g4] 0x88,	%f3
	set	0x10, %o6
	stwa	%l5,	[%l7 + %o6] 0x80
	st	%fsr,	[%l7 + 0x78]
	set	0x60, %l1
	stda	%g4,	[%l7 + %l1] 0x81
	st	%f17,	[%l7 + 0x4C]
	set	0x78, %l5
	stda	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x7E, %i2
	lduh	[%l7 + %i2],	%l3
	nop
	set	0x14, %l6
	stw	%o1,	[%l7 + %l6]
	nop
	set	0x70, %i1
	ldx	[%l7 + %i1],	%g6
	fpsub16	%f2,	%f16,	%f20
	nop
	set	0x46, %o5
	sth	%o7,	[%l7 + %o5]
	set	0x30, %g3
	stwa	%l0,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x68, %o0
	stda	%i4,	[%l7 + %o0] 0x80
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f16
	nop
	set	0x67, %g6
	ldub	[%l7 + %g6],	%i7
	nop
	set	0x6C, %g1
	prefetch	[%l7 + %g1],	 1
	nop
	set	0x75, %o2
	ldsb	[%l7 + %o2],	%o5
	fpadd32s	%f28,	%f12,	%f12
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%f18
	nop
	set	0x20, %i4
	ldsw	[%l7 + %i4],	%l4
	and	%g2,	%i6,	%o6
	nop
	set	0x10, %g7
	prefetch	[%l7 + %g7],	 2
	add	%o2,	%g1,	%i3
	nop
	set	0x29, %l3
	ldstub	[%l7 + %l3],	%g5
	nop
	set	0x0A, %o7
	ldstub	[%l7 + %o7],	%o4
	set	0x2C, %o1
	lda	[%l7 + %o1] 0x88,	%f19
	add	%l2,	%i0,	%i2
	nop
	set	0x48, %l2
	std	%g6,	[%l7 + %l2]
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x89,	%i1
	set	0x3C, %g5
	ldstuba	[%l7 + %g5] 0x81,	%o3
	fpsub32s	%f18,	%f4,	%f25
	and	%l1,	%i4,	%l6
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	nop
	set	0x60, %i6
	stx	%g4,	[%l7 + %i6]
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f24
	nop
	set	0x44, %i5
	lduw	[%l7 + %i5],	%g3
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f16
	nop
	set	0x68, %l0
	ldsw	[%l7 + %l0],	%l3
	nop
	set	0x18, %g4
	lduw	[%l7 + %g4],	%o0
	fpsub16s	%f10,	%f15,	%f11
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%g6
	fpsub16	%f0,	%f24,	%f12
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x74, %o3
	lduw	[%l7 + %o3],	%o7
	nop
	set	0x45, %l1
	stb	%i5,	[%l7 + %l1]
	nop
	set	0x16, %i2
	lduh	[%l7 + %i2],	%i7
	nop
	set	0x50, %l5
	stw	%l0,	[%l7 + %l5]
	fpsub16s	%f20,	%f24,	%f10
	set	0x77, %l6
	ldstuba	[%l7 + %l6] 0x81,	%l4
	nop
	set	0x12, %i1
	sth	%o5,	[%l7 + %i1]
	nop
	set	0x18, %g3
	swap	[%l7 + %g3],	%g2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%i6
	nop
	set	0x18, %o0
	stx	%o2,	[%l7 + %o0]
	ld	[%l7 + 0x44],	%f21
	nop
	set	0x10, %o5
	ldsb	[%l7 + %o5],	%i3
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x80,	%g1
	set	0x30, %g6
	stba	%g5,	[%l7 + %g6] 0xeb
	membar	#Sync
	st	%f17,	[%l7 + 0x6C]
	nop
	set	0x3C, %o2
	swap	[%l7 + %o2],	%l2
	set	0x78, %o4
	lda	[%l7 + %o4] 0x89,	%f17
	bne,pn	%icc,	loop_84
	or	%i0,	%o4,	%g7
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf9
	membar	#Sync
loop_84:
	nop
	set	0x23, %g7
	ldsb	[%l7 + %g7],	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%l1
	set	0x1C, %l3
	stwa	%o3,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x40, %o7
	std	%i4,	[%l7 + %o7]
	nop
	set	0x70, %o1
	std	%f12,	[%l7 + %o1]
	add	%l6,	%l5,	%g4
	st	%f21,	[%l7 + 0x5C]
	nop
	set	0x78, %g1
	lduh	[%l7 + %g1],	%l3
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f8
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%o0
	st	%fsr,	[%l7 + 0x54]
	set	0x18, %g5
	stxa	%g3,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x38, %l4
	std	%o0,	[%l7 + %l4]
	nop
	set	0x7C, %i3
	ldub	[%l7 + %i3],	%o7
	nop
	set	0x48, %i6
	swap	[%l7 + %i6],	%g6
	nop
	set	0x34, %i0
	ldsb	[%l7 + %i0],	%i5
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f0
	nop
	set	0x71, %g4
	stb	%i7,	[%l7 + %g4]
	nop
	set	0x34, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%l4
	nop
	set	0x30, %l1
	std	%o4,	[%l7 + %l1]
	nop
	set	0x18, %i2
	ldx	[%l7 + %i2],	%l0
	ld	[%l7 + 0x3C],	%f28
	nop
	set	0x6C, %l5
	stw	%g2,	[%l7 + %l5]
	nop
	set	0x2C, %l6
	ldsw	[%l7 + %l6],	%i6
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%o6
	set	0x08, %g3
	stda	%i2,	[%l7 + %g3] 0x81
	set	0x42, %o0
	stha	%o2,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x74, %i1
	sta	%f0,	[%l7 + %i1] 0x89
	set	0x1C, %i7
	lda	[%l7 + %i7] 0x81,	%f26
	nop
	set	0x78, %o5
	ldsb	[%l7 + %o5],	%g5
	fpadd32	%f16,	%f8,	%f10
	nop
	set	0x29, %g6
	ldub	[%l7 + %g6],	%l2
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x89,	%i0
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x88,	%o4
	nop
	set	0x30, %i4
	std	%g0,	[%l7 + %i4]
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x81,	%i2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%l1
	nop
	set	0x08, %l3
	sth	%g7,	[%l7 + %l3]
	set	0x58, %o1
	stxa	%o3,	[%l7 + %o1] 0x81
	nop
	set	0x66, %o7
	ldub	[%l7 + %o7],	%i4
	nop
	set	0x20, %l2
	std	%f10,	[%l7 + %l2]
	nop
	set	0x28, %g2
	ldsw	[%l7 + %g2],	%l5
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f0
	st	%fsr,	[%l7 + 0x30]
	set	0x38, %g5
	sta	%f21,	[%l7 + %g5] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%g4
	nop
	set	0x50, %l4
	stw	%l3,	[%l7 + %l4]
	and	%g3,	%o0,	%o1
	or	%o7,	%g6,	%i7
	nop
	set	0x20, %i6
	lduw	[%l7 + %i6],	%l4
	fpadd32	%f14,	%f6,	%f12
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%i4
	set	0x20, %i3
	stda	%l0,	[%l7 + %i3] 0xeb
	membar	#Sync
	ld	[%l7 + 0x70],	%f25
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f16
	ld	[%l7 + 0x50],	%f16
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%g2,	%i6,	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%o2
	nop
	set	0x74, %l0
	lduh	[%l7 + %l0],	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	nop
	nop
	setx	0xD2655793,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x6C3BD768,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f24,	%f14
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f12
	and	%i0,	%g1,	%o4
	set	0x4E, %i2
	stha	%i1,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x2A, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i2
	fpadd16s	%f19,	%f6,	%f5
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f24
	bge	%xcc,	loop_85
	ld	[%l7 + 0x74],	%f7
	nop
	set	0x42, %l5
	stb	%g7,	[%l7 + %l5]
	set	0x28, %o0
	stxa	%l1,	[%l7 + %o0] 0x88
loop_85:
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd8
	nop
	set	0x15, %i7
	ldub	[%l7 + %i7],	%o3
	nop
	set	0x10, %o5
	std	%f30,	[%l7 + %o5]
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%i4
	add	%l6,	%g4,	%l3
	set	0x30, %o2
	stda	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%g2
	set	0x48, %i4
	stxa	%o1,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x30, %o1
	stw	%o7,	[%l7 + %o1]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	st	%f5,	[%l7 + 0x70]
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	set	0x70, %l2
	stwa	%o0,	[%l7 + %l2] 0x88
	nop
	set	0x2F, %g2
	ldstub	[%l7 + %g2],	%l4
	set	0x28, %g1
	stwa	%i5,	[%l7 + %g1] 0x89
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f22
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%i7
	nop
	set	0x08, %i6
	std	%i6,	[%l7 + %i6]
	add	%g2,	%o5,	%o2
	nop
	set	0x38, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x58, %l4
	stx	%g5,	[%l7 + %l4]
	add	%i3,	%o6,	%i0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x525, 	%tick_cmpr
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc2
	and	%g7,	%g1,	%o3
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd0
	and	%i4,	%l1,	%l6
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%g4
	set	0x6F, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%o1
	set	0x48, %o3
	swapa	[%l7 + %o3] 0x89,	%g3
	st	%fsr,	[%l7 + 0x0C]
	set	0x64, %g4
	lda	[%l7 + %g4] 0x81,	%f1
	nop
	set	0x1F, %l6
	ldstub	[%l7 + %l6],	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%o0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd8
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%l4
	nop
	set	0x4A, %l5
	ldsh	[%l7 + %l5],	%i5
	set	0x68, %o0
	swapa	[%l7 + %o0] 0x81,	%l0
	and	%i6,	%i7,	%o5
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x89,	%g2
	nop
	set	0x78, %i7
	sth	%g5,	[%l7 + %i7]
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	nop
	set	0x40, %i1
	stx	%o2,	[%l7 + %i1]
	nop
	set	0x14, %g6
	ldsw	[%l7 + %g6],	%i0
	ld	[%l7 + 0x70],	%f29
	nop
	set	0x30, %o2
	swap	[%l7 + %o2],	%o6
	set	0x18, %i4
	stha	%l2,	[%l7 + %i4] 0x89
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f20
	set	0x24, %o1
	sta	%f13,	[%l7 + %o1] 0x80
	be,a	%icc,	loop_86
	nop
	set	0x24, %l3
	stb	%i1,	[%l7 + %l3]
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%i2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%g7
loop_86:
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%g0
	nop
	set	0x74, %o7
	swap	[%l7 + %o7],	%o3
	set	0x30, %g2
	stda	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	and	%l1,	%g4,	%l5
	bgu,pn	%icc,	loop_87
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f6
	set	0x10, %i6
	stxa	%l6,	[%l7 + %i6] 0xeb
	membar	#Sync
loop_87:
	nop
	set	0x48, %g5
	stx	%o1,	[%l7 + %g5]
	set	0x14, %i0
	stwa	%g3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x22, %i3
	stha	%l3,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x6A, %l0
	sth	%o7,	[%l7 + %l0]
	set	0x3B, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%o0
	ld	[%l7 + 0x10],	%f3
	ld	[%l7 + 0x5C],	%f26
	nop
	set	0x50, %i5
	std	%f12,	[%l7 + %i5]
	set	0x58, %o3
	stxa	%l0,	[%l7 + %o3] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%i6
	nop
	set	0x5C, %g4
	prefetch	[%l7 + %g4],	 3
	wr	%i7,	%g2,	%softint
	nop
	set	0x78, %l6
	std	%o4,	[%l7 + %l6]
	nop
	set	0x61, %o6
	stb	%g5,	[%l7 + %o6]
	wr	%i3,	%o2,	%sys_tick
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o6
	fpsub32	%f12,	%f4,	%f0
	nop
	set	0x66, %i2
	lduh	[%l7 + %i2],	%l2
	nop
	set	0x64, %l5
	ldsh	[%l7 + %l5],	%i1
	nop
	set	0x58, %g3
	stw	%o4,	[%l7 + %g3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%g1
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%o2
	nop
	set	0x38, %o5
	ldstub	[%l7 + %o5],	%i2
	nop
	set	0x3F, %i7
	ldsb	[%l7 + %i7],	%l1
	wr	%g4,	%i4,	%softint
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	nop
	set	0x48, %i4
	lduw	[%l7 + %i4],	%l6
	nop
	set	0x1E, %g7
	lduh	[%l7 + %g7],	%o1
	nop
	set	0x48, %g6
	lduw	[%l7 + %g6],	%g3
	nop
	set	0x48, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x62, %o1
	ldsb	[%l7 + %o1],	%l5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g6
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%l4
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x81,	%o0
	nop
	set	0x23, %g1
	ldub	[%l7 + %g1],	%l0
	set	0x30, %g2
	stda	%o6,	[%l7 + %g2] 0x80
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%i6
	nop
	set	0x2A, %i0
	sth	%i7,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x34, %g5
	sth	%i5,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 2
	st	%fsr,	[%l7 + 0x0C]
	fpsub32	%f10,	%f6,	%f28
	nop
	set	0x60, %l0
	sth	%o5,	[%l7 + %l0]
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x80,	%g5
	set	0x68, %i5
	sta	%f10,	[%l7 + %i5] 0x89
	nop
	set	0x28, %l1
	std	%g2,	[%l7 + %l1]
	ld	[%l7 + 0x1C],	%f8
	nop
	set	0x68, %g4
	ldstub	[%l7 + %g4],	%i3
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x73, %o3
	ldub	[%l7 + %o3],	%i0
	bgu	%icc,	loop_88
	nop
	set	0x38, %o6
	lduw	[%l7 + %o6],	%o2
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%l2
	nop
	set	0x20, %i2
	stw	%o6,	[%l7 + %i2]
loop_88:
	nop
	set	0x6C, %l5
	ldsw	[%l7 + %l5],	%i1
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f18
	nop
	set	0x64, %o5
	swap	[%l7 + %o5],	%o4
	nop
	set	0x29, %i7
	ldub	[%l7 + %i7],	%g7
	set	0x7F, %g3
	stba	%g1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x08, %o2
	stw	%o3,	[%l7 + %o2]
	set	0x7C, %i4
	swapa	[%l7 + %i4] 0x80,	%i2
	set	0x70, %i1
	stha	%g4,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x38, %g7
	sth	%i4,	[%l7 + %g7]
	wr	%l1,	%o1,	%clear_softint
	nop
	set	0x68, %g6
	std	%f28,	[%l7 + %g6]
	set	0x28, %o1
	lda	[%l7 + %o1] 0x89,	%f3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd8,	%f0
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%l6
	nop
	set	0x6A, %o4
	stb	%l5,	[%l7 + %o4]
	nop
	set	0x18, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x80,	%g3
	bne,a	%icc,	loop_89
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f18
	nop
	set	0x56, %i6
	lduh	[%l7 + %i6],	%l3
	set	0x25, %i0
	stba	%l4,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_89:
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%g6
	nop
	set	0x4C, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x78, %l4
	stb	%o0,	[%l7 + %l4]
	nop
	set	0x76, %l0
	lduh	[%l7 + %l0],	%l0
	set	0x74, %i5
	stwa	%i6,	[%l7 + %i5] 0x88
	set	0x08, %g4
	stwa	%o7,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x2A, %o3
	stha	%i7,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x80,	%i4
	bge,pt	%xcc,	loop_90
	nop
	set	0x60, %l6
	ldx	[%l7 + %l6],	%o5
	set	0x3B, %o6
	ldstuba	[%l7 + %o6] 0x88,	%g5
loop_90:
	nop
	set	0x74, %i2
	stwa	%i3,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x60]
	set	0x21, %l5
	stba	%i0,	[%l7 + %l5] 0x81
	nop
	set	0x12, %o0
	ldub	[%l7 + %o0],	%o2
	nop
	set	0x68, %i7
	sth	%g2,	[%l7 + %i7]
	wr	%l2,	%o6,	%pic
	nop
	set	0x46, %g3
	lduh	[%l7 + %g3],	%i1
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f24
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%o4
	set	0x2C, %i4
	swapa	[%l7 + %i4] 0x88,	%g7
	nop
	set	0x20, %i1
	ldub	[%l7 + %i1],	%o3
	nop
	set	0x0C, %g7
	lduw	[%l7 + %g7],	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i4
	ld	[%l7 + 0x6C],	%f27
	set	0x18, %g6
	sta	%f8,	[%l7 + %g6] 0x80
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f18
	set	0x61, %o1
	stba	%l1,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x08, %o4
	stx	%o1,	[%l7 + %o4]
	nop
	set	0x62, %l2
	ldsb	[%l7 + %l2],	%g4
	set	0x70, %o7
	stxa	%l6,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%l4
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x88,	%l3
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd2
	add	%l4,	%g3,	%g6
	and	%o0,	%l0,	%o7
	set	0x30, %i3
	swapa	[%l7 + %i3] 0x89,	%i6
	nop
	set	0x0A, %g5
	ldsh	[%l7 + %g5],	%i7
	fpsub32s	%f3,	%f15,	%f8
	nop
	set	0x14, %l4
	stw	%o5,	[%l7 + %l4]
	add	%g5,	%i5,	%i3
	set	0x6C, %l0
	stwa	%i0,	[%l7 + %l0] 0x80
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%o2
	nop
	set	0x50, %i5
	std	%l2,	[%l7 + %i5]
	set	0x58, %g4
	sta	%f11,	[%l7 + %g4] 0x81
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%o6
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xeb,	%i0
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x58, %l6
	lduh	[%l7 + %l6],	%o4
	set	0x09, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g7
	nop
	set	0x18, %l5
	lduh	[%l7 + %l5],	%o3
	nop
	set	0x7C, %i2
	swap	[%l7 + %i2],	%i2
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x80,	%g1
	nop
	set	0x24, %g3
	swap	[%l7 + %g3],	%g2
	nop
	set	0x60, %o5
	std	%l0,	[%l7 + %o5]
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	set	0x14, %i7
	stwa	%g4,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x78, %i4
	lda	[%l7 + %i4] 0x80,	%f31
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x88,	%i4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x31, %g7
	ldub	[%l7 + %g7],	%l5
	nop
	set	0x21, %g6
	ldstub	[%l7 + %g6],	%l6
	fpsub16	%f4,	%f20,	%f6
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x89,	%l2
	nop
	set	0x70, %l3
	std	%l4,	[%l7 + %l3]
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	ba,pt	%xcc,	loop_91
	and	%g3,	%g6,	%l0
	nop
	set	0x44, %o4
	ldsb	[%l7 + %o4],	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i7
loop_91:
	nop
	set	0x30, %g1
	stx	%o5,	[%l7 + %g1]
	set	0x14, %g2
	stwa	%o0,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x30, %i6
	std	%i4,	[%l7 + %i6]
	set	0x18, %i3
	stda	%g4,	[%l7 + %i3] 0x88
	nop
	set	0x51, %o7
	ldstub	[%l7 + %o7],	%i0
	set	0x68, %g5
	stda	%i2,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%o2
	set	0x70, %i5
	lda	[%l7 + %i5] 0x81,	%f3
	bleu,a	%xcc,	loop_92
	nop
	set	0x63, %i0
	ldsb	[%l7 + %i0],	%i1
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x80,	%o6
loop_92:
	nop
	set	0x10, %g4
	ldub	[%l7 + %g4],	%o4
	nop
	set	0x44, %l6
	stw	%g7,	[%l7 + %l6]
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%o2
	nop
	set	0x32, %l1
	sth	%g1,	[%l7 + %l1]
	set	0x18, %i2
	stda	%g2,	[%l7 + %i2] 0x89
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%l0
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x80,	%o0
	nop
	nop
	setx	0xC98F42A3D206B480,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5E4901884096B369,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f6,	%f24
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%g4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l5
	and	%i2,	%l3,	%l4
	nop
	set	0x40, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%g6
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	nop
	set	0x76, %i7
	ldsh	[%l7 + %i7],	%l0
	nop
	set	0x6E, %i1
	sth	%l6,	[%l7 + %i1]
	ld	[%l7 + 0x38],	%f17
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	fpsub32	%f4,	%f24,	%f4
	nop
	set	0x17, %g6
	ldsb	[%l7 + %g6],	%i6
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%o7
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd2
	set	0x60, %l2
	stxa	%i7,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x0E, %o4
	sth	%o5,	[%l7 + %o4]
	nop
	set	0x43, %g1
	ldsb	[%l7 + %g1],	%i5
	wr	%o0,	%i0,	%clear_softint
	set	0x45, %i6
	stba	%g5,	[%l7 + %i6] 0x80
	nop
	set	0x28, %i3
	swap	[%l7 + %i3],	%l2
	nop
	set	0x10, %g2
	lduw	[%l7 + %g2],	%o2
	st	%f12,	[%l7 + 0x5C]
	set	0x58, %o7
	sta	%f28,	[%l7 + %o7] 0x81
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x81,	%i1
	set	0x64, %l4
	stha	%o6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	nop
	setx	0x6F3AC7F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x45C0971F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f30,	%f19
	set	0x48, %i5
	stxa	%o4,	[%l7 + %i5] 0x88
	nop
	set	0x45, %l0
	ldsb	[%l7 + %l0],	%g7
	nop
	set	0x5D, %o3
	ldub	[%l7 + %o3],	%i3
	set	0x0C, %g4
	stwa	%o3,	[%l7 + %g4] 0xe2
	membar	#Sync
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%l1
	nop
	set	0x34, %l6
	ldub	[%l7 + %l6],	%o1
	set	0x49, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g2
	nop
	set	0x30, %l1
	stw	%g4,	[%l7 + %l1]
	set	0x60, %i2
	stda	%l4,	[%l7 + %i2] 0x89
	nop
	set	0x0F, %l5
	ldstub	[%l7 + %l5],	%i2
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f20
	nop
	set	0x10, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x68, %o0
	swapa	[%l7 + %o0] 0x88,	%i4
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f16
	nop
	set	0x40, %i4
	std	%l4,	[%l7 + %i4]
	nop
	set	0x16, %o2
	ldsh	[%l7 + %o2],	%g3
	nop
	set	0x78, %i7
	std	%g6,	[%l7 + %i7]
	nop
	set	0x43, %i1
	ldsb	[%l7 + %i1],	%l3
	nop
	set	0x60, %g7
	std	%f2,	[%l7 + %g7]
	nop
	set	0x10, %g6
	stw	%l6,	[%l7 + %g6]
	set	0x1C, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l0
	nop
	set	0x08, %l2
	ldub	[%l7 + %l2],	%o7
	st	%f28,	[%l7 + 0x7C]
	ld	[%l7 + 0x64],	%f12
	nop
	set	0x76, %o1
	ldsh	[%l7 + %o1],	%i7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%i5
	set	0x24, %g1
	stwa	%i6,	[%l7 + %g1] 0x81
	fpadd16	%f28,	%f4,	%f30
	nop
	set	0x20, %o4
	stw	%o0,	[%l7 + %o4]
	nop
	set	0x74, %i3
	ldstub	[%l7 + %i3],	%i0
	fpsub16s	%f30,	%f8,	%f2
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f30
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%g5
	wr	%o2,	%o6,	%y
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xea,	%i0
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%o4
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xca
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x68, %l0
	sta	%f13,	[%l7 + %l0] 0x88
	add	%g7,	%i3,	%g1
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%o3
	nop
	set	0x38, %g4
	std	%o0,	[%l7 + %g4]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc0
	nop
	set	0x30, %i0
	ldsh	[%l7 + %i0],	%l1
	set	0x5C, %l6
	stwa	%g2,	[%l7 + %l6] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%i4
	set	0x08, %l5
	stda	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x2C, %l1
	ldsw	[%l7 + %l1],	%i2
	set	0x1F, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g3
	set	0x51, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g6
	set	0x0E, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l3
	fpadd32s	%f13,	%f23,	%f4
	nop
	set	0x6C, %o5
	ldsb	[%l7 + %o5],	%l0
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x81,	%o6
	nop
	set	0x14, %o2
	ldsw	[%l7 + %o2],	%i7
	or	%l6,	%i5,	%o5
	nop
	set	0x58, %i7
	std	%o0,	[%l7 + %i7]
	nop
	set	0x4C, %i1
	lduw	[%l7 + %i1],	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g5
	nop
	set	0x3A, %g7
	ldsh	[%l7 + %g7],	%l2
	nop
	set	0x12, %l3
	sth	%o2,	[%l7 + %l3]
	set	0x58, %l2
	lda	[%l7 + %l2] 0x80,	%f19
	bg	%icc,	loop_93
	nop
	set	0x78, %g6
	sth	%i1,	[%l7 + %g6]
	set	0x0D, %o1
	stba	%o6,	[%l7 + %o1] 0xea
	membar	#Sync
loop_93:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%g7
	set	0x70, %o4
	swapa	[%l7 + %o4] 0x89,	%i3
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x40, %i6
	std	%o2,	[%l7 + %i6]
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x88,	%g0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l1
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%g2
	fpsub16	%f6,	%f24,	%f18
	nop
	set	0x18, %g5
	std	%g4,	[%l7 + %g5]
	ld	[%l7 + 0x0C],	%f10
	set	0x08, %i5
	stda	%l4,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x62, %o7
	lduh	[%l7 + %o7],	%l4
	nop
	set	0x6A, %o3
	stb	%i4,	[%l7 + %o3]
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x88,	%i2
	nop
	set	0x60, %l0
	stw	%g3,	[%l7 + %l0]
	set	0x48, %i0
	sta	%f13,	[%l7 + %i0] 0x88
	nop
	set	0x58, %l4
	stx	%l3,	[%l7 + %l4]
	nop
	set	0x7C, %i2
	stb	%g6,	[%l7 + %i2]
	st	%f7,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x6C, %l5
	sth	%o7,	[%l7 + %l5]
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x80,	%i7
	nop
	set	0x78, %l1
	lduh	[%l7 + %l1],	%l6
	set	0x44, %o6
	sta	%f0,	[%l7 + %o6] 0x88
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x81,	 2
	nop
	set	0x50, %g3
	lduh	[%l7 + %g3],	%l0
	nop
	set	0x32, %i4
	ldstub	[%l7 + %i4],	%o5
	nop
	set	0x08, %o5
	std	%f0,	[%l7 + %o5]
	set	0x2C, %o2
	swapa	[%l7 + %o2] 0x88,	%i0
	nop
	set	0x58, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x58, %g7
	stx	%o0,	[%l7 + %g7]
	set	0x3C, %l3
	swapa	[%l7 + %l3] 0x89,	%g5
	nop
	set	0x08, %l2
	ldsw	[%l7 + %l2],	%l2
	nop
	set	0x6E, %g6
	sth	%i6,	[%l7 + %g6]
	and	%i1,	%o2,	%o6
	set	0x14, %i1
	stwa	%o4,	[%l7 + %i1] 0x89
	set	0x50, %o4
	stda	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	fpadd32s	%f31,	%f23,	%f16
	nop
	set	0x1C, %i3
	ldsb	[%l7 + %i3],	%i3
	nop
	set	0x38, %o1
	stw	%o3,	[%l7 + %o1]
	st	%f24,	[%l7 + 0x70]
	nop
	set	0x6C, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x09, %i6
	ldub	[%l7 + %i6],	%g1
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x81,	%o1
	nop
	set	0x3A, %i5
	ldub	[%l7 + %i5],	%g2
	nop
	set	0x48, %o7
	ldx	[%l7 + %o7],	%l1
	nop
	set	0x40, %o3
	stx	%l5,	[%l7 + %o3]
	ld	[%l7 + 0x74],	%f11
	set	0x76, %g2
	stha	%g4,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x40, %l0
	std	%i4,	[%l7 + %l0]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g3
	nop
	set	0x2F, %i0
	ldub	[%l7 + %i0],	%l3
	nop
	set	0x2B, %l4
	stb	%g6,	[%l7 + %l4]
	or	%o7,	%i2,	%i7
	nop
	set	0x40, %g4
	ldstub	[%l7 + %g4],	%l6
	nop
	set	0x48, %l5
	std	%f6,	[%l7 + %l5]
	set	0x20, %i2
	sta	%f28,	[%l7 + %i2] 0x89
	nop
	set	0x0A, %l1
	lduh	[%l7 + %l1],	%i5
	set	0x5C, %l6
	stha	%l0,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x58, %o6
	ldsh	[%l7 + %o6],	%i0
	and	%o0,	%o5,	%l2
	nop
	set	0x70, %g3
	stx	%i6,	[%l7 + %g3]
	set	0x55, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g5
	nop
	set	0x30, %o0
	sth	%o2,	[%l7 + %o0]
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x89,	%o6
	nop
	set	0x68, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x61, %i7
	ldsb	[%l7 + %i7],	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%i3
	set	0x24, %g7
	swapa	[%l7 + %g7] 0x88,	%o3
	nop
	set	0x64, %l2
	lduh	[%l7 + %l2],	%o1
	set	0x48, %g6
	stda	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%l1
	nop
	set	0x70, %o4
	ldstub	[%l7 + %o4],	%g1
	nop
	set	0x7C, %l3
	ldsw	[%l7 + %l3],	%l5
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%i4
	nop
	set	0x55, %g1
	ldstub	[%l7 + %g1],	%l4
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xcc
	set	0x68, %i5
	stda	%g4,	[%l7 + %i5] 0x81
	nop
	set	0x3E, %o7
	sth	%l3,	[%l7 + %o7]
	nop
	set	0x1C, %o3
	ldub	[%l7 + %o3],	%g6
	nop
	set	0x6A, %g2
	lduh	[%l7 + %g2],	%i2
	set	0x20, %g5
	stda	%i6,	[%l7 + %g5] 0x81
	nop
	set	0x20, %l0
	stw	%o7,	[%l7 + %l0]
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x81,	%l6
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x78, %l4
	sth	%l0,	[%l7 + %l4]
	and	%i0,	%i5,	%o0
	set	0x78, %l5
	stxa	%o5,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%i6
	add	%l2,	%g5,	%o2
	st	%f29,	[%l7 + 0x64]
	nop
	set	0x58, %l1
	stw	%o4,	[%l7 + %l1]
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x88,	%g7
	nop
	set	0x58, %o6
	stw	%o6,	[%l7 + %o6]
	set	0x1A, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i1
	nop
	set	0x3C, %g3
	ldsw	[%l7 + %g3],	%i3
	set	0x78, %o0
	stwa	%o1,	[%l7 + %o0] 0x88
	set	0x28, %i4
	stda	%g2,	[%l7 + %i4] 0x89
	set	0x5C, %o5
	stwa	%o3,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x81,	%g0
	nop
	set	0x1C, %o2
	ldsw	[%l7 + %o2],	%l5
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f4
	set	0x20, %g7
	stda	%i4,	[%l7 + %g7] 0x80
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%f20
	st	%f11,	[%l7 + 0x70]
	set	0x2C, %o4
	stwa	%l4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f16
	st	%f28,	[%l7 + 0x38]
	nop
	set	0x40, %o1
	ldsh	[%l7 + %o1],	%l1
	nop
	set	0x66, %g6
	lduh	[%l7 + %g6],	%g4
	nop
	set	0x78, %i6
	ldub	[%l7 + %i6],	%l3
	nop
	set	0x56, %i3
	stb	%g6,	[%l7 + %i3]
	set	0x20, %i5
	stda	%i2,	[%l7 + %i5] 0x81
	ld	[%l7 + 0x70],	%f9
	and	%g3,	%i7,	%l6
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	nop
	set	0x14, %g1
	ldsw	[%l7 + %g1],	%i0
	or	%i5,	%o7,	%o0
	ld	[%l7 + 0x10],	%f10
	bgu	%icc,	loop_94
	nop
	set	0x54, %o3
	lduh	[%l7 + %o3],	%i6
	nop
	set	0x63, %g5
	ldub	[%l7 + %g5],	%o5
	ld	[%l7 + 0x48],	%f3
loop_94:
	nop
	set	0x6E, %l0
	sth	%l2,	[%l7 + %l0]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1266
!	Type a   	: 28
!	Type cti   	: 31
!	Type x   	: 527
!	Type f   	: 50
!	Type i   	: 98
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
	set	0x2,	%g1
	set	0x2,	%g2
	set	0x1,	%g3
	set	0xB,	%g4
	set	0x6,	%g5
	set	0x1,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0x4,	%i2
	set	-0xD,	%i3
	set	-0x8,	%i4
	set	-0x0,	%i5
	set	-0x6,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x68726983,	%l0
	set	0x7389DB4F,	%l1
	set	0x5F526A68,	%l2
	set	0x73549FFE,	%l3
	set	0x2BA3E43D,	%l4
	set	0x09B154EA,	%l5
	set	0x74BE7AC6,	%l6
	!# Output registers
	set	0x0B24,	%o0
	set	0x0719,	%o1
	set	-0x0B0E,	%o2
	set	-0x1F27,	%o3
	set	0x096E,	%o4
	set	-0x1639,	%o5
	set	0x0C59,	%o6
	set	-0x02BC,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x4C, %g2
	lduw	[%l7 + %g2],	%g5
	set	0x40, %i0
	stwa	%o2,	[%l7 + %i0] 0x89
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%o4
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%i3
	set	0x34, %l1
	stha	%o1,	[%l7 + %l1] 0x89
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%o6
	add	%o3,	%g1,	%i4
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%l4
	nop
	set	0x44, %l4
	ldsw	[%l7 + %l4],	%l4
	set	0x62, %o6
	stba	%l1,	[%l7 + %o6] 0x89
	nop
	set	0x30, %g4
	stx	%g4,	[%l7 + %g4]
	and	%g6,	%l3,	%g3
	ld	[%l7 + 0x7C],	%f19
	nop
	set	0x20, %o0
	std	%f22,	[%l7 + %o0]
	nop
	set	0x19, %g3
	ldub	[%l7 + %g3],	%i7
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x80,	 3
	nop
	set	0x6C, %i7
	ldsh	[%l7 + %i7],	%i2
	nop
	set	0x58, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x80,	 4
	set	0x48, %g7
	stxa	%l0,	[%l7 + %g7] 0x88
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f6
	nop
	set	0x40, %l2
	std	%f22,	[%l7 + %l2]
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%o0
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%f18
	fpadd16s	%f16,	%f16,	%f31
	nop
	set	0x15, %g6
	ldub	[%l7 + %g6],	%o7
	set	0x6B, %i6
	stba	%o5,	[%l7 + %i6] 0x81
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xda,	%f16
	set	0x54, %i5
	stba	%l2,	[%l7 + %i5] 0x88
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	nop
	setx	0xA6A5CD26,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x34AAD54E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f8,	%f22
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%g4
	set	0x50, %o3
	stxa	%g7,	[%l7 + %o3] 0x80
	set	0x6C, %o7
	swapa	[%l7 + %o7] 0x81,	%o2
	nop
	set	0x65, %l0
	stb	%i1,	[%l7 + %l0]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%o1
	nop
	set	0x30, %g5
	ldsb	[%l7 + %g5],	%g2
	fpsub32	%f6,	%f6,	%f12
	fpsub32	%f16,	%f4,	%f16
	nop
	set	0x1E, %g2
	ldub	[%l7 + %g2],	%o6
	nop
	set	0x44, %i0
	lduh	[%l7 + %i0],	%o3
	fpsub32s	%f0,	%f14,	%f31
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%o4
	nop
	set	0x38, %l1
	std	%f12,	[%l7 + %l1]
	nop
	set	0x3B, %i2
	stb	%i4,	[%l7 + %i2]
	set	0x78, %l6
	stwa	%l5,	[%l7 + %l6] 0x80
	nop
	set	0x70, %o6
	swap	[%l7 + %o6],	%l4
	nop
	set	0x68, %l4
	sth	%g1,	[%l7 + %l4]
	or	%g4,	%l1,	%l3
	set	0x20, %g4
	stba	%g3,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x5C, %o0
	swapa	[%l7 + %o0] 0x88,	%i7
	nop
	set	0x50, %i4
	stx	%l6,	[%l7 + %i4]
	nop
	set	0x54, %i7
	lduw	[%l7 + %i7],	%i2
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%g6
	and	%l0,	%i5,	%i0
	st	%f22,	[%l7 + 0x2C]
	nop
	set	0x1C, %o2
	lduh	[%l7 + %o2],	%o7
	nop
	set	0x74, %g7
	stw	%o5,	[%l7 + %g7]
	and	%l2,	%i6,	%o0
	nop
	set	0x30, %o5
	stb	%g7,	[%l7 + %o5]
	set	0x58, %l2
	stda	%g4,	[%l7 + %l2] 0x89
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%i1
	nop
	set	0x48, %o4
	std	%i2,	[%l7 + %o4]
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%o2
	nop
	set	0x38, %i6
	std	%o0,	[%l7 + %i6]
	set	0x0C, %o1
	stwa	%g2,	[%l7 + %o1] 0x80
	bg,pn	%xcc,	loop_95
	and	%o3,	%o6,	%i4
	set	0x60, %i5
	ldxa	[%l7 + %i5] 0x81,	%o4
loop_95:
	nop
	set	0x42, %i3
	sth	%l5,	[%l7 + %i3]
	ld	[%l7 + 0x18],	%f12
	nop
	nop
	setx	0x2E8BA5C070579F6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xFB56525223412BE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f10,	%f6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%g4
	fpadd16s	%f16,	%f30,	%f17
	or	%g1,	%l1,	%g3
	nop
	set	0x13, %g1
	ldub	[%l7 + %g1],	%i7
	nop
	set	0x60, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x2C, %o7
	prefetch	[%l7 + %o7],	 2
	ld	[%l7 + 0x3C],	%f3
	nop
	set	0x28, %l0
	ldstub	[%l7 + %l0],	%i2
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%l3
	ld	[%l7 + 0x40],	%f8
	set	0x50, %i0
	stha	%g6,	[%l7 + %i0] 0x81
	set	0x20, %l5
	stxa	%l0,	[%l7 + %l5] 0x88
	nop
	set	0x50, %l1
	lduw	[%l7 + %l1],	%i0
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f26
	bl,a,pn	%xcc,	loop_96
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
loop_96:
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%o5
	or	%i5,	%l2,	%i6
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%o0
	nop
	set	0x26, %o6
	lduh	[%l7 + %o6],	%g5
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x81,	%i1
	nop
	set	0x28, %i7
	std	%i2,	[%l7 + %i7]
	ba	%xcc,	loop_97
	and	%g7,	%o2,	%g2
	nop
	set	0x64, %g3
	swap	[%l7 + %g3],	%o3
	set	0x13, %o2
	stba	%o1,	[%l7 + %o2] 0x81
loop_97:
	nop
	set	0x4C, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f0
	set	0x5E, %l2
	stha	%i4,	[%l7 + %l2] 0x80
	be,a	%icc,	loop_98
	nop
	set	0x10, %i1
	swap	[%l7 + %i1],	%o4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc8
loop_98:
	bne,a,pt	%icc,	loop_99
	nop
	set	0x4F, %o4
	ldub	[%l7 + %o4],	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%g4
loop_99:
	nop
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf0
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%g1
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xe2,	%l0
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	nop
	set	0x26, %i3
	ldsb	[%l7 + %i3],	%l6
	nop
	set	0x4C, %l3
	stw	%l3,	[%l7 + %l3]
	set	0x68, %o7
	ldxa	[%l7 + %o7] 0x89,	%i2
	nop
	set	0x78, %l0
	stx	%fsr,	[%l7 + %l0]
	fpadd16	%f12,	%f12,	%f4
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x80,	%g6
	set	0x48, %g5
	stxa	%i0,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x1F, %i0
	ldsb	[%l7 + %i0],	%l0
	ld	[%l7 + 0x6C],	%f28
	set	0x0A, %l5
	stha	%o7,	[%l7 + %l5] 0x89
	nop
	set	0x4C, %l1
	prefetch	[%l7 + %l1],	 3
	set	0x48, %i2
	stda	%o4,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x62, %l6
	sth	%l2,	[%l7 + %l6]
	nop
	set	0x08, %l4
	ldsb	[%l7 + %l4],	%i6
	set	0x77, %g2
	stba	%i5,	[%l7 + %g2] 0x81
	set	0x40, %o6
	stxa	%o0,	[%l7 + %o6] 0x80
	nop
	set	0x18, %o0
	ldub	[%l7 + %o0],	%g5
	nop
	set	0x60, %i4
	std	%i0,	[%l7 + %i4]
	nop
	set	0x28, %g4
	swap	[%l7 + %g4],	%g7
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x88,	%i3
	nop
	set	0x78, %o2
	stx	%g2,	[%l7 + %o2]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%o1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f0
	nop
	set	0x32, %g7
	lduh	[%l7 + %g7],	%o2
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%l5
	bn,a	%icc,	loop_100
	nop
	set	0x70, %o5
	stx	%i4,	[%l7 + %o5]
	bn,a,pt	%xcc,	loop_101
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%g4
loop_100:
	nop
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x88,	 4
loop_101:
	nop
	set	0x48, %o4
	lduh	[%l7 + %o4],	%g1
	nop
	set	0x48, %o1
	std	%g2,	[%l7 + %o1]
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x88,	 2
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f10
	nop
	set	0x5C, %i3
	stw	%i7,	[%l7 + %i3]
	set	0x14, %g1
	swapa	[%l7 + %g1] 0x80,	%l6
	nop
	set	0x38, %l3
	swap	[%l7 + %l3],	%l3
	nop
	set	0x64, %o7
	ldub	[%l7 + %o7],	%i2
	nop
	set	0x68, %l0
	stx	%g6,	[%l7 + %l0]
	nop
	set	0x38, %g5
	stx	%l4,	[%l7 + %g5]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xca
	set	0x48, %i0
	stda	%i0,	[%l7 + %i0] 0xe3
	membar	#Sync
	st	%f14,	[%l7 + 0x78]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f0
	and	%l0,	%o5,	%l2
	st	%f15,	[%l7 + 0x58]
	set	0x0E, %l1
	stha	%o7,	[%l7 + %l1] 0x88
	set	0x10, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i5
	nop
	set	0x70, %i2
	std	%i6,	[%l7 + %i2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE7D, 	%tick_cmpr
	nop
	set	0x7A, %g2
	sth	%g7,	[%l7 + %g2]
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x88,	 4
	set	0x28, %o0
	stxa	%i1,	[%l7 + %o0] 0xe3
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%o1
	set	0x58, %o6
	stha	%o2,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x74, %i4
	sth	%o4,	[%l7 + %i4]
	nop
	set	0x4A, %i7
	ldsh	[%l7 + %i7],	%l5
	set	0x1C, %o2
	stha	%i4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x2A, %g4
	lduh	[%l7 + %g4],	%g4
	set	0x60, %g3
	stxa	%g2,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x89,	 1
	nop
	set	0x50, %o5
	std	%g0,	[%l7 + %o5]
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x81,	 3
	set	0x68, %o4
	stda	%g2,	[%l7 + %o4] 0x81
	nop
	set	0x1A, %i1
	ldsh	[%l7 + %i1],	%i7
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%i6
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%l3
	nop
	set	0x54, %i5
	swap	[%l7 + %i5],	%g6
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%l4
	nop
	set	0x70, %l3
	ldsw	[%l7 + %l3],	%i0
	nop
	set	0x79, %o7
	ldub	[%l7 + %o7],	%l0
	set	0x4C, %g1
	sta	%f0,	[%l7 + %g1] 0x81
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%i2
	set	0x48, %g5
	stda	%l2,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x2D, %l0
	ldsb	[%l7 + %l0],	%i5
	add	%i6,	%o7,	%o0
	nop
	set	0x74, %o3
	stb	%g7,	[%l7 + %o3]
	set	0x42, %l5
	stba	%g5,	[%l7 + %l5] 0x88
	and	%i3,	%o3,	%o1
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x54, %i0
	ldsh	[%l7 + %i0],	%o2
	and	%i1,	%o4,	%i4
	nop
	set	0x3C, %l6
	stw	%l5,	[%l7 + %l6]
	set	0x64, %l1
	swapa	[%l7 + %l1] 0x88,	%g2
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%o6
	nop
	set	0x38, %i2
	stx	%g1,	[%l7 + %i2]
	wr	%l1,	%g4,	%ccr
	nop
	set	0x4E, %o0
	ldsh	[%l7 + %o0],	%g3
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x80,	%i6
	set	0x1C, %o6
	lda	[%l7 + %o6] 0x89,	%f17
	set	0x78, %i4
	ldstuba	[%l7 + %i4] 0x89,	%i7
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f22
	set	0x68, %i7
	stwa	%g6,	[%l7 + %i7] 0x80
	set	0x60, %g3
	stxa	%l4,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x76, %g7
	sth	%i0,	[%l7 + %g7]
	set	0x16, %l2
	stba	%l3,	[%l7 + %l2] 0x89
	nop
	set	0x74, %g4
	swap	[%l7 + %g4],	%o5
	nop
	set	0x38, %g6
	std	%f16,	[%l7 + %g6]
	set	0x34, %o4
	lda	[%l7 + %o4] 0x89,	%f20
	nop
	set	0x6C, %o5
	ldsh	[%l7 + %o5],	%i2
	or	%l0,	%l2,	%i6
	ld	[%l7 + 0x48],	%f21
	nop
	set	0x08, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x78, %i6
	stx	%i5,	[%l7 + %i6]
	set	0x48, %o1
	sta	%f18,	[%l7 + %o1] 0x89
	or	%o0,	%o7,	%g5
	set	0x40, %i3
	sta	%f20,	[%l7 + %i3] 0x80
	nop
	set	0x3A, %i5
	ldsh	[%l7 + %i5],	%i3
	add	%g7,	%o1,	%o3
	nop
	set	0x70, %o7
	std	%f20,	[%l7 + %o7]
	nop
	set	0x26, %g1
	ldub	[%l7 + %g1],	%i1
	set	0x48, %l3
	stxa	%o2,	[%l7 + %l3] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%l5
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%g2
	add	%o6,	%i4,	%l1
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%g1
	nop
	set	0x4A, %l0
	ldstub	[%l7 + %l0],	%g4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i7
	set	0x78, %i0
	stxa	%g6,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x54, %l5
	sta	%f14,	[%l7 + %l5] 0x81
	nop
	set	0x68, %l1
	sth	%g3,	[%l7 + %l1]
	nop
	set	0x3D, %g2
	ldstub	[%l7 + %g2],	%l4
	st	%fsr,	[%l7 + 0x50]
	st	%f24,	[%l7 + 0x28]
	ld	[%l7 + 0x08],	%f26
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x89,	%i0
	nop
	set	0x77, %i2
	ldub	[%l7 + %i2],	%o5
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%l0
	set	0x10, %o0
	stda	%l2,	[%l7 + %o0] 0x89
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%i6
	add	%o0,	%o7,	%i3
	set	0x30, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	nop
	set	0x38, %o2
	std	%f30,	[%l7 + %o2]
	nop
	set	0x40, %i7
	std	%f16,	[%l7 + %i7]
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x89,	%o0
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x88,	%g5
	nop
	set	0x48, %g4
	std	%f18,	[%l7 + %g4]
	nop
	set	0x28, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x64, %g6
	swap	[%l7 + %g6],	%i1
	nop
	set	0x30, %o4
	stb	%o2,	[%l7 + %o4]
	nop
	set	0x70, %o5
	stw	%o4,	[%l7 + %o5]
	nop
	set	0x70, %i1
	stx	%l5,	[%l7 + %i1]
	ld	[%l7 + 0x3C],	%f17
	ld	[%l7 + 0x30],	%f20
	nop
	set	0x7E, %o1
	ldsb	[%l7 + %o1],	%o3
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f28
	nop
	set	0x08, %i3
	stw	%o6,	[%l7 + %i3]
	nop
	set	0x68, %o7
	lduw	[%l7 + %o7],	%i4
	set	0x51, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f0
	nop
	set	0x0A, %g5
	ldsh	[%l7 + %g5],	%l1
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	nop
	set	0x40, %g1
	swap	[%l7 + %g1],	%l6
	nop
	set	0x20, %i0
	lduh	[%l7 + %i0],	%g1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%i7
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f14
	nop
	set	0x58, %l1
	std	%f18,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	set	0x7E, %l6
	stha	%g3,	[%l7 + %l6] 0xea
	membar	#Sync
	bge,pn	%xcc,	loop_102
	nop
	set	0x14, %i2
	lduw	[%l7 + %i2],	%l4
	nop
	set	0x6C, %l5
	stw	%o5,	[%l7 + %l5]
	ba	%xcc,	loop_103
loop_102:
	nop
	set	0x26, %o0
	sth	%i2,	[%l7 + %o0]
	nop
	set	0x30, %o6
	prefetch	[%l7 + %o6],	 4
	ba,a	%icc,	loop_104
loop_103:
	or	%i0,	%l0,	%l2
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
loop_104:
	nop
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf0
	membar	#Sync
	set	0x60, %l4
	ldda	[%l7 + %l4] 0x89,	%i6
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x81,	%o0
	set	0x74, %g3
	lda	[%l7 + %g3] 0x88,	%f8
	set	0x3F, %l2
	stba	%o7,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x80,	%i2
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x88,	%i5
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x88,	 1
	nop
	set	0x6C, %o5
	lduw	[%l7 + %o5],	%o1
	nop
	set	0x2C, %i1
	stw	%i1,	[%l7 + %i1]
	set	0x68, %o1
	stha	%o2,	[%l7 + %o1] 0x81
	be	%xcc,	loop_105
	bl	%xcc,	loop_106
	nop
	set	0x10, %g4
	swap	[%l7 + %g4],	%o4
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%g4
loop_105:
	nop
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x88
loop_106:
	nop
	set	0x14, %i3
	ldsw	[%l7 + %i3],	%o3
	nop
	set	0x44, %i5
	swap	[%l7 + %i5],	%o6
	nop
	set	0x48, %g5
	stw	%l5,	[%l7 + %g5]
	set	0x10, %l3
	stxa	%g2,	[%l7 + %l3] 0x89
	add	%l1,	%i4,	%g4
	add	%g1,	%l6,	%i7
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%g2
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x80,	%l4
	set	0x10, %g2
	stwa	%i2,	[%l7 + %g2] 0x89
	set	0x26, %l0
	stha	%i0,	[%l7 + %l0] 0x80
	nop
	set	0x5C, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x4E, %i2
	lduh	[%l7 + %i2],	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%o7
	set	0x44, %l5
	stwa	%o0,	[%l7 + %l5] 0x81
	bn,a	%xcc,	loop_107
	add	%i5,	%i3,	%o1
	st	%f0,	[%l7 + 0x2C]
	set	0x30, %o6
	stwa	%g7,	[%l7 + %o6] 0xe2
	membar	#Sync
loop_107:
	nop
	set	0x70, %i4
	ldsw	[%l7 + %i4],	%o2
	set	0x54, %o2
	lda	[%l7 + %o2] 0x81,	%f0
	nop
	set	0x20, %l4
	stx	%o4,	[%l7 + %l4]
	nop
	set	0x30, %o0
	std	%g4,	[%l7 + %o0]
	set	0x7E, %g3
	stha	%o3,	[%l7 + %g3] 0x88
	and	%o6,	%l5,	%g2
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x88,	%l1
	set	0x34, %g7
	swapa	[%l7 + %g7] 0x81,	%i1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	set	0x4C, %i7
	stwa	%i4,	[%l7 + %i7] 0x89
	set	0x78, %o4
	swapa	[%l7 + %o4] 0x89,	%g4
	set	0x18, %i1
	swapa	[%l7 + %i1] 0x80,	%l6
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	fpadd32	%f28,	%f4,	%f14
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f16
	ld	[%l7 + 0x74],	%f15
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%g6
	set	0x3D, %g4
	ldstuba	[%l7 + %g4] 0x81,	%g3
	nop
	set	0x50, %o7
	std	%f8,	[%l7 + %o7]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%i0
	nop
	set	0x50, %i3
	prefetch	[%l7 + %i3],	 1
	bne,a	%icc,	loop_108
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x1B, %i6
	stb	%l0,	[%l7 + %i6]
	nop
	set	0x28, %g5
	std	%f22,	[%l7 + %g5]
loop_108:
	ld	[%l7 + 0x70],	%f6
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x88,	%l2
	nop
	set	0x37, %g1
	ldub	[%l7 + %g1],	%l3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xda
	nop
	set	0x18, %o3
	stx	%i2,	[%l7 + %o3]
	and	%o5,	%o7,	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i5
	nop
	set	0x54, %l1
	lduh	[%l7 + %l1],	%o1
	ld	[%l7 + 0x64],	%f24
	nop
	set	0x1C, %l0
	lduh	[%l7 + %l0],	%i3
	nop
	set	0x10, %l6
	swap	[%l7 + %l6],	%o2
	nop
	set	0x20, %g2
	stw	%g7,	[%l7 + %g2]
	wr	%o4,	%o3,	%set_softint
	nop
	set	0x38, %l5
	stx	%g5,	[%l7 + %l5]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf0
	membar	#Sync
	nop
	set	0x7D, %o6
	ldub	[%l7 + %o6],	%o6
	ld	[%l7 + 0x24],	%f26
	nop
	set	0x40, %o2
	std	%f28,	[%l7 + %o2]
	st	%f20,	[%l7 + 0x48]
	nop
	set	0x72, %i4
	sth	%g2,	[%l7 + %i4]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%g4
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 0
	nop
	set	0x49, %g3
	ldsb	[%l7 + %g3],	%i4
	set	0x20, %l2
	stwa	%i7,	[%l7 + %l2] 0x80
	nop
	set	0x70, %l4
	prefetch	[%l7 + %l4],	 1
	ld	[%l7 + 0x10],	%f31
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x81,	 4
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x88,	%g6
	nop
	set	0x78, %o4
	stx	%l6,	[%l7 + %o4]
	nop
	set	0x40, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f16
	set	0x30, %o5
	sta	%f6,	[%l7 + %o5] 0x88
	or	%l4,	%g3,	%i0
	nop
	set	0x7C, %i1
	sth	%l0,	[%l7 + %i1]
	set	0x74, %g4
	stwa	%l2,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x74, %o7
	sta	%f23,	[%l7 + %o7] 0x81
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x68, %i3
	std	%f0,	[%l7 + %i3]
	nop
	set	0x2B, %i6
	ldstub	[%l7 + %i6],	%l3
	nop
	set	0x4E, %i5
	ldub	[%l7 + %i5],	%i2
	nop
	set	0x48, %l3
	lduh	[%l7 + %l3],	%o5
	set	0x30, %g1
	stba	%i6,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x45, %i0
	ldstub	[%l7 + %i0],	%o7
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xcc
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xea,	%i4
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%o1
	set	0x08, %l6
	stda	%o0,	[%l7 + %l6] 0x88
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%i3
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xea,	%o2
	set	0x4E, %i2
	stha	%o4,	[%l7 + %i2] 0x88
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x10, %l5
	lduh	[%l7 + %l5],	%g7
	nop
	set	0x08, %o2
	lduh	[%l7 + %o2],	%g5
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	st	%fsr,	[%l7 + 0x0C]
	bl,pt	%icc,	loop_109
	and	%o3,	%o6,	%l5
	nop
	set	0x24, %g3
	lduw	[%l7 + %g3],	%g2
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
loop_109:
	ld	[%l7 + 0x44],	%f29
	set	0x43, %l2
	stba	%l1,	[%l7 + %l2] 0x80
	nop
	set	0x20, %l4
	swap	[%l7 + %l4],	%g4
	nop
	set	0x18, %g6
	std	%f28,	[%l7 + %g6]
	nop
	set	0x2C, %g7
	ldsw	[%l7 + %g7],	%i7
	ld	[%l7 + 0x14],	%f8
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x88,	%g1
	nop
	set	0x7C, %i7
	lduw	[%l7 + %i7],	%i4
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x10, %i1
	ldsw	[%l7 + %i1],	%l6
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%g6
	st	%fsr,	[%l7 + 0x14]
	set	0x40, %o1
	stha	%l4,	[%l7 + %o1] 0x80
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f22
	nop
	set	0x22, %i3
	sth	%g3,	[%l7 + %i3]
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%i0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f4
	set	0x60, %i5
	stba	%l2,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x81,	 4
	nop
	set	0x68, %o3
	ldsb	[%l7 + %o3],	%l0
	nop
	set	0x3E, %l1
	sth	%o5,	[%l7 + %l1]
	nop
	set	0x14, %g1
	swap	[%l7 + %g1],	%i2
	nop
	set	0x10, %l6
	std	%f18,	[%l7 + %l6]
	bge	%xcc,	loop_110
	nop
	set	0x6A, %g2
	lduh	[%l7 + %g2],	%i6
	wr	%i5,	%o1,	%pic
	be,pn	%xcc,	loop_111
loop_110:
	nop
	set	0x61, %l0
	ldstub	[%l7 + %l0],	%o7
	set	0x51, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i3
loop_111:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%o4
	nop
	set	0x0D, %o6
	ldstub	[%l7 + %o6],	%o0
	nop
	set	0x30, %l5
	lduh	[%l7 + %l5],	%g5
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%g7
	set	0x58, %g5
	lda	[%l7 + %g5] 0x81,	%f28
	set	0x10, %g3
	sta	%f25,	[%l7 + %g3] 0x80
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x89,	%o6
	nop
	set	0x16, %o0
	ldstub	[%l7 + %o0],	%l5
	set	0x70, %l4
	stwa	%o3,	[%l7 + %l4] 0x89
	nop
	set	0x60, %g6
	std	%g2,	[%l7 + %g6]
	set	0x5E, %l2
	stba	%i1,	[%l7 + %l2] 0x89
	nop
	set	0x60, %g7
	stx	%g4,	[%l7 + %g7]
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%i7
	set	0x78, %o5
	stha	%g1,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	nop
	set	0x08, %i1
	stx	%i4,	[%l7 + %i1]
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f4
	set	0x6C, %o7
	stha	%l1,	[%l7 + %o7] 0x88
	nop
	set	0x37, %g4
	ldstub	[%l7 + %g4],	%g6
	nop
	set	0x38, %i3
	ldub	[%l7 + %i3],	%l4
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc0
	and	%g3,	%i0,	%l2
	nop
	set	0x0C, %i5
	swap	[%l7 + %i5],	%l6
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%l3
	or	%o5,	%i2,	%i6
	st	%fsr,	[%l7 + 0x48]
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x89,	%i5
	set	0x58, %l1
	stda	%o0,	[%l7 + %l1] 0x88
	fpsub16s	%f7,	%f19,	%f28
	add	%l0,	%i3,	%o7
	or	%o2,	%o4,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%g7
	nop
	set	0x58, %g1
	stx	%l5,	[%l7 + %g1]
	nop
	set	0x50, %l6
	ldsb	[%l7 + %l6],	%o3
	set	0x50, %g2
	sta	%f22,	[%l7 + %g2] 0x88
	or	%g2,	%i1,	%o6
	nop
	set	0x4F, %l0
	ldub	[%l7 + %l0],	%g4
	nop
	set	0x28, %o3
	prefetch	[%l7 + %o3],	 4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%i7
	nop
	set	0x28, %o6
	stx	%i4,	[%l7 + %o6]
	nop
	set	0x3D, %l5
	ldstub	[%l7 + %l5],	%l1
	nop
	set	0x44, %o2
	ldub	[%l7 + %o2],	%g6
	and	%l4,	%i0,	%g3
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%l2
	set	0x50, %g3
	ldda	[%l7 + %g3] 0xe3,	%i6
	nop
	set	0x38, %g5
	std	%o4,	[%l7 + %g5]
	nop
	set	0x38, %i4
	ldsw	[%l7 + %i4],	%l3
	nop
	set	0x7F, %l4
	ldsb	[%l7 + %l4],	%i6
	set	0x24, %g6
	sta	%f23,	[%l7 + %g6] 0x88
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	be,a,pt	%icc,	loop_112
	nop
	set	0x12, %g7
	ldub	[%l7 + %g7],	%i5
	set	0x78, %i7
	stda	%o0,	[%l7 + %i7] 0x80
loop_112:
	or	%i2,	%i3,	%l0
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%o2
	nop
	set	0x38, %o4
	std	%f14,	[%l7 + %o4]
	or	%o7,	%o4,	%o0
	st	%f2,	[%l7 + 0x40]
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x81,	%g5
	nop
	set	0x42, %o1
	ldstub	[%l7 + %o1],	%l5
	fpadd16s	%f17,	%f0,	%f16
	nop
	set	0x34, %g4
	swap	[%l7 + %g4],	%o3
	nop
	set	0x35, %i3
	ldub	[%l7 + %i3],	%i1
	fpsub16s	%f24,	%f23,	%f28
	set	0x32, %i6
	stha	%o6,	[%l7 + %i6] 0x81
	nop
	set	0x20, %o7
	std	%g4,	[%l7 + %o7]
	set	0x3C, %i0
	stwa	%g1,	[%l7 + %i0] 0x81
	st	%fsr,	[%l7 + 0x54]
	set	0x10, %i5
	stwa	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%i7
	nop
	set	0x32, %l3
	ldstub	[%l7 + %l3],	%g6
	nop
	set	0x24, %l1
	ldsw	[%l7 + %l1],	%l1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i0
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x89,	%l2
	nop
	set	0x28, %g2
	stx	%l6,	[%l7 + %g2]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf0
	membar	#Sync
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x81,	%f8
	nop
	set	0x58, %o3
	std	%f12,	[%l7 + %o3]
	nop
	set	0x4C, %l5
	swap	[%l7 + %l5],	%o5
	nop
	set	0x30, %o2
	stx	%l3,	[%l7 + %o2]
	nop
	set	0x4C, %o6
	ldstub	[%l7 + %o6],	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%o1
	and	%i6,	%i2,	%l0
	set	0x4F, %i2
	stba	%i3,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x48, %g5
	ldstub	[%l7 + %g5],	%o2
	set	0x70, %i4
	lda	[%l7 + %i4] 0x81,	%f12
	nop
	set	0x1D, %l4
	ldsb	[%l7 + %l4],	%o7
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%o0
	set	0x18, %g6
	sta	%f2,	[%l7 + %g6] 0x80
	set	0x2C, %o0
	stwa	%g7,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x0B, %g7
	stb	%o4,	[%l7 + %g7]
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x81,	%l5
	nop
	set	0x18, %l2
	ldsw	[%l7 + %l2],	%o3
	set	0x50, %i1
	stwa	%g5,	[%l7 + %i1] 0xe3
	membar	#Sync
	ld	[%l7 + 0x08],	%f28
	nop
	set	0x1D, %o5
	ldsb	[%l7 + %o5],	%i1
	set	0x28, %o4
	sta	%f15,	[%l7 + %o4] 0x89
	wr	%o6,	%g4,	%clear_softint
	nop
	set	0x7C, %g4
	stw	%g2,	[%l7 + %g4]
	nop
	set	0x20, %o1
	std	%f20,	[%l7 + %o1]
	set	0x49, %i6
	stba	%g1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%i7
	nop
	set	0x17, %i3
	ldsb	[%l7 + %i3],	%g6
	set	0x33, %i5
	stba	%l1,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x81,	%l4
	nop
	set	0x58, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f16
	bn,a	%xcc,	loop_113
	nop
	set	0x16, %g2
	ldub	[%l7 + %g2],	%i0
	nop
	set	0x3A, %l1
	stb	%i4,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x64]
loop_113:
	nop
	set	0x50, %l6
	sta	%f2,	[%l7 + %l6] 0x89
	nop
	set	0x78, %o3
	ldsw	[%l7 + %o3],	%l6
	set	0x33, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o5
	set	0x08, %l0
	stda	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x10, %o2
	swap	[%l7 + %o2],	%g3
	nop
	set	0x34, %i2
	swap	[%l7 + %i2],	%i5
	nop
	set	0x34, %o6
	swap	[%l7 + %o6],	%o1
	nop
	set	0x23, %g5
	ldsb	[%l7 + %g5],	%l3
	set	0x60, %l4
	swapa	[%l7 + %l4] 0x81,	%i2
	or	%i6,	%i3,	%l0
	nop
	set	0x2E, %i4
	lduh	[%l7 + %i4],	%o7
	or	%o2,	%o0,	%g7
	nop
	set	0x67, %g3
	ldstub	[%l7 + %g3],	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x56, %o0
	stha	%o4,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x14, %g7
	stba	%o6,	[%l7 + %g7] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%g4
	set	0x48, %g6
	stxa	%g2,	[%l7 + %g6] 0xeb
	membar	#Sync
	and	%i7,	%g6,	%g1
	set	0x6E, %i7
	stba	%l4,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x24, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x33, %o5
	ldstuba	[%l7 + %o5] 0x80,	%i0
	nop
	set	0x30, %o4
	std	%f8,	[%l7 + %o4]
	wr	%i4,	%l6,	%y
	nop
	set	0x12, %l2
	stb	%l1,	[%l7 + %l2]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o1
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f20
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f2
	nop
	set	0x12, %o1
	sth	%g3,	[%l7 + %o1]
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x89,	 1
	nop
	set	0x40, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 0
	or	%l3,	%i3,	%l0
	nop
	set	0x44, %l3
	ldsw	[%l7 + %l3],	%o7
	nop
	set	0x0C, %g2
	sth	%i6,	[%l7 + %g2]
	or	%o2,	%g7,	%o0
	set	0x6C, %l1
	stwa	%o3,	[%l7 + %l1] 0x88
	nop
	set	0x28, %g1
	std	%f14,	[%l7 + %g1]
	nop
	set	0x48, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x88,	 1
	nop
	set	0x6D, %l5
	ldstub	[%l7 + %l5],	%o4
	nop
	set	0x32, %l0
	ldub	[%l7 + %l0],	%l5
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%o6
	set	0x44, %g5
	stha	%g4,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x18, %l4
	sth	%g2,	[%l7 + %l4]
	fpadd16	%f28,	%f14,	%f26
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%i7
	set	0x50, %i4
	ldda	[%l7 + %i4] 0xe2,	%i0
	nop
	set	0x1C, %o0
	ldsh	[%l7 + %o0],	%g6
	nop
	set	0x40, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x70, %g3
	stw	%g1,	[%l7 + %g3]
	or	%i0,	%i4,	%l4
	nop
	set	0x64, %i7
	ldsw	[%l7 + %i7],	%l6
	nop
	set	0x78, %i1
	std	%f30,	[%l7 + %i1]
	nop
	set	0x7C, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f0
	nop
	set	0x77, %g4
	stb	%l1,	[%l7 + %g4]
	nop
	set	0x78, %i6
	ldub	[%l7 + %i6],	%l2
	nop
	set	0x7A, %l2
	sth	%o1,	[%l7 + %l2]
	set	0x45, %i3
	stba	%g3,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x30, %i5
	std	%i4,	[%l7 + %i5]
	set	0x28, %i0
	stda	%i2,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x28, %o1
	lda	[%l7 + %o1] 0x89,	%f10
	nop
	set	0x44, %l3
	prefetch	[%l7 + %l3],	 4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%l0
	nop
	set	0x61, %g2
	ldub	[%l7 + %g2],	%o7
	set	0x60, %l1
	stwa	%i6,	[%l7 + %l1] 0x80
	nop
	set	0x30, %g1
	std	%o2,	[%l7 + %g1]
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x81,	%g7
	bge,a,pn	%icc,	loop_114
	nop
	set	0x25, %o7
	ldstub	[%l7 + %o7],	%i3
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%o2
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%o0
loop_114:
	nop
	set	0x70, %o3
	stda	%o4,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x28, %i2
	sth	%g5,	[%l7 + %i2]
	set	0x40, %g5
	stda	%o6,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x7C, %o2
	sta	%f21,	[%l7 + %o2] 0x80
	add	%g4,	%i1,	%g6
	set	0x28, %i4
	stxa	%g1,	[%l7 + %i4] 0x81
	set	0x50, %l4
	stda	%i0,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x14, %g7
	lduh	[%l7 + %g7],	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%i4
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x88,	%i6
	set	0x50, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o5
	set	0x68, %i1
	lda	[%l7 + %i1] 0x88,	%f23
	or	%l1,	%o1,	%l2
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%i4
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x89,	 0
	nop
	set	0x70, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%i2
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x89,	 2
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f18
	nop
	set	0x72, %i5
	lduh	[%l7 + %i5],	%l0
	st	%f22,	[%l7 + 0x40]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%o7
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%o2
	set	0x54, %i0
	swapa	[%l7 + %i0] 0x88,	%i3
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	wr	%o3,	%o0,	%pic
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f8
	nop
	set	0x38, %l1
	ldsh	[%l7 + %l1],	%g7
	nop
	set	0x28, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x48, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x58, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%o6
	nop
	set	0x4B, %o7
	ldsb	[%l7 + %o7],	%l5
	set	0x30, %l0
	stha	%o4,	[%l7 + %l0] 0x80
	nop
	set	0x52, %i2
	stb	%g4,	[%l7 + %i2]
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x89,	%g2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	set	0x38, %o2
	sta	%f12,	[%l7 + %o2] 0x88
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%i1
	nop
	set	0x30, %o3
	stx	%g6,	[%l7 + %o3]
	nop
	set	0x19, %l4
	ldsb	[%l7 + %l4],	%i0
	set	0x57, %g3
	ldstuba	[%l7 + %g3] 0x88,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%g1
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%l6
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%o4
	set	0x46, %o5
	stha	%i4,	[%l7 + %o5] 0x89
	set	0x78, %g7
	lda	[%l7 + %g7] 0x81,	%f6
	nop
	set	0x10, %g4
	std	%l0,	[%l7 + %g4]
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%i4
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%g2
	nop
	set	0x32, %o4
	lduh	[%l7 + %o4],	%o1
	nop
	set	0x70, %i3
	stw	%l3,	[%l7 + %i3]
	add	%i2,	%i6,	%o7
	nop
	set	0x08, %i0
	ldsw	[%l7 + %i0],	%o2
	set	0x28, %i5
	sta	%f10,	[%l7 + %i5] 0x81
	nop
	set	0x1E, %g2
	ldsh	[%l7 + %g2],	%i3
	or	%l0,	%o0,	%o3
	set	0x74, %l1
	stwa	%g5,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%g6
	nop
	set	0x6C, %l6
	ldsw	[%l7 + %l6],	%l5
	set	0x12, %l3
	stha	%o4,	[%l7 + %l3] 0x89
	nop
	set	0x2C, %g1
	lduh	[%l7 + %g1],	%o6
	set	0x70, %l5
	stba	%g2,	[%l7 + %l5] 0x80
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%g6
	st	%f25,	[%l7 + 0x28]
	set	0x30, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i1
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%i6
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x89,	%l4
	set	0x78, %l0
	stxa	%g1,	[%l7 + %l0] 0xeb
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i0
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%o5
	add	%i4,	%l2,	%i5
	and	%g3,	%l1,	%l3
	fpsub32	%f28,	%f8,	%f24
	nop
	set	0x18, %i4
	stw	%o1,	[%l7 + %i4]
	nop
	set	0x2F, %o6
	ldub	[%l7 + %o6],	%i6
	set	0x38, %o3
	stda	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x10, %l4
	lduh	[%l7 + %l4],	%o7
	set	0x24, %g3
	lda	[%l7 + %g3] 0x89,	%f21
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x34, %i7
	stha	%i3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x50, %o5
	stw	%o3,	[%l7 + %o5]
	nop
	set	0x08, %g7
	lduw	[%l7 + %g7],	%o0
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xe3,	%g4
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%l4
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g7
	set	0x48, %o4
	sta	%f8,	[%l7 + %o4] 0x81
	nop
	set	0x10, %i1
	std	%f4,	[%l7 + %i1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%g2
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x74, %i0
	lduh	[%l7 + %i0],	%g6
	ld	[%l7 + 0x44],	%f1
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x89,	%f16
	and	%i7,	%l4,	%i1
	set	0x38, %l1
	stba	%g1,	[%l7 + %l1] 0xea
	membar	#Sync
	and	%i0,	%o5,	%i4
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f12
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i5
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x30, %l6
	stba	%l2,	[%l7 + %l6] 0x89
	add	%l1,	%g3,	%o1
	set	0x14, %l3
	stha	%i6,	[%l7 + %l3] 0x89
	nop
	set	0x48, %l5
	stx	%l3,	[%l7 + %l5]
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%o7
	bl,a	%xcc,	loop_115
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%i2
	and	%o2,	%l0,	%o3
	set	0x57, %i2
	stba	%o0,	[%l7 + %i2] 0xe3
	membar	#Sync
loop_115:
	nop
	set	0x14, %g5
	swap	[%l7 + %g5],	%i3
	set	0x6C, %l0
	stha	%g5,	[%l7 + %l0] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l5
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%g6
	nop
	set	0x08, %o6
	std	%g4,	[%l7 + %o6]
	nop
	set	0x48, %i4
	std	%g2,	[%l7 + %i4]
	nop
	set	0x18, %l4
	std	%f2,	[%l7 + %l4]
	or	%g6,	%i7,	%o6
	nop
	set	0x50, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x64, %o3
	swapa	[%l7 + %o3] 0x88,	%i1
	set	0x26, %i7
	stha	%g1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x40, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f30
	nop
	set	0x60, %g4
	std	%f28,	[%l7 + %g4]
	set	0x69, %o5
	stba	%i0,	[%l7 + %o5] 0xea
	membar	#Sync
	and	%o5,	%l4,	%i4
	nop
	set	0x08, %l2
	std	%f14,	[%l7 + %l2]
	nop
	set	0x58, %g6
	std	%i6,	[%l7 + %g6]
	nop
	set	0x30, %o4
	stb	%l2,	[%l7 + %o4]
	add	%l1,	%i5,	%o1
	set	0x60, %i1
	stxa	%i6,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x2B, %i3
	ldub	[%l7 + %i3],	%g3
	nop
	set	0x7E, %i0
	lduh	[%l7 + %i0],	%l3
	set	0x76, %g2
	stha	%i2,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x38, %i6
	lduh	[%l7 + %i6],	%o2
	nop
	set	0x78, %i5
	std	%f12,	[%l7 + %i5]
	nop
	set	0x26, %l1
	ldub	[%l7 + %l1],	%o7
	nop
	set	0x68, %l6
	lduw	[%l7 + %l6],	%o3
	nop
	set	0x18, %o1
	std	%f14,	[%l7 + %o1]
	set	0x2A, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l0
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x81,	%i2
	nop
	set	0x6C, %g1
	ldstub	[%l7 + %g1],	%o0
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o4
	nop
	set	0x18, %l0
	std	%l4,	[%l7 + %l0]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f0
	nop
	set	0x60, %o2
	std	%f8,	[%l7 + %o2]
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	ld	[%l7 + 0x78],	%f6
	nop
	set	0x58, %o6
	std	%f28,	[%l7 + %o6]
	nop
	set	0x10, %g3
	std	%f26,	[%l7 + %g3]
	nop
	set	0x60, %o3
	lduh	[%l7 + %o3],	%g7
	nop
	set	0x47, %l4
	ldstub	[%l7 + %l4],	%g2
	nop
	set	0x6C, %o0
	swap	[%l7 + %o0],	%g4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f16
	nop
	set	0x38, %g4
	lduw	[%l7 + %g4],	%g6
	nop
	set	0x50, %i7
	swap	[%l7 + %i7],	%o6
	nop
	set	0x68, %l2
	lduw	[%l7 + %l2],	%i7
	and	%i1,	%g1,	%o5
	nop
	set	0x50, %o5
	std	%i0,	[%l7 + %o5]
	st	%f13,	[%l7 + 0x3C]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd8
	nop
	set	0x48, %i1
	stw	%l4,	[%l7 + %i1]
	and	%i4,	%l2,	%l1
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x81,	 3
	nop
	set	0x7C, %g6
	lduh	[%l7 + %g6],	%l6
	ld	[%l7 + 0x40],	%f10
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x81,	%i6
	nop
	set	0x34, %i0
	lduw	[%l7 + %i0],	%g3
	nop
	set	0x28, %i6
	std	%l2,	[%l7 + %i6]
	and	%i2,	%o2,	%o7
	nop
	set	0x48, %l1
	ldub	[%l7 + %l1],	%o1
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%l0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x88
	nop
	set	0x4F, %l5
	ldstub	[%l7 + %l5],	%i3
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x08, %l6
	stba	%o0,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x27, %i2
	ldub	[%l7 + %i2],	%o4
	nop
	set	0x50, %g1
	ldsb	[%l7 + %g1],	%o3
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x80
	set	0x20, %g5
	lda	[%l7 + %g5] 0x80,	%f12
	nop
	set	0x70, %o2
	stx	%g5,	[%l7 + %o2]
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x89,	%l5
	nop
	set	0x6C, %o7
	ldsw	[%l7 + %o7],	%g2
	set	0x60, %g3
	stxa	%g7,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x34, %o6
	stha	%g4,	[%l7 + %o6] 0x88
	nop
	set	0x28, %l4
	lduw	[%l7 + %l4],	%g6
	set	0x7B, %o3
	stba	%o6,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x58, %g7
	std	%f2,	[%l7 + %g7]
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x88,	%i7
	nop
	set	0x20, %o0
	ldsh	[%l7 + %o0],	%i1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%i0
	nop
	set	0x5D, %i7
	stb	%l4,	[%l7 + %i7]
	ld	[%l7 + 0x70],	%f2
	and	%o5,	%i4,	%l2
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%l1
	fpsub32	%f10,	%f22,	%f24
	nop
	set	0x7C, %o5
	lduh	[%l7 + %o5],	%i5
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%l6
	set	0x0A, %i3
	stha	%i6,	[%l7 + %i3] 0x89
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f0
	st	%f15,	[%l7 + 0x78]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%g3
	wr	%i2,	%o7,	%sys_tick
	nop
	set	0x2C, %g6
	prefetch	[%l7 + %g6],	 4
	add	%o2,	%o1,	%l0
	nop
	set	0x22, %i6
	ldsh	[%l7 + %i6],	%o0
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%o4
	nop
	set	0x58, %i5
	std	%o2,	[%l7 + %i5]
	set	0x10, %o1
	stwa	%g5,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f0
	nop
	set	0x20, %l5
	std	%f8,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x7B, %l6
	ldstub	[%l7 + %l6],	%l5
	or	%g2,	%i3,	%g4
	nop
	set	0x30, %i2
	ldstub	[%l7 + %i2],	%g7
	add	%g6,	%i7,	%i1
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xeb,	%o6
	ld	[%l7 + 0x34],	%f5
	set	0x2C, %l0
	stba	%i0,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x30, %g5
	stx	%g1,	[%l7 + %g5]
	st	%f25,	[%l7 + 0x5C]
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x81,	%l4
	nop
	set	0x10, %o2
	std	%f10,	[%l7 + %o2]
	set	0x10, %i4
	stxa	%i4,	[%l7 + %i4] 0x81
	nop
	set	0x6C, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x6C, %o6
	swap	[%l7 + %o6],	%l2
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%o5
	nop
	set	0x19, %o3
	ldsb	[%l7 + %o3],	%i5
	nop
	set	0x11, %g7
	ldsb	[%l7 + %g7],	%l6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x512, 	%tick_cmpr
	st	%f24,	[%l7 + 0x1C]
	nop
	set	0x3C, %o0
	stw	%i6,	[%l7 + %o0]
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%i2
	set	0x20, %l2
	sta	%f5,	[%l7 + %l2] 0x81
	nop
	set	0x08, %i7
	ldsw	[%l7 + %i7],	%o7
	nop
	set	0x08, %o5
	stb	%o2,	[%l7 + %o5]
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%o1
	nop
	set	0x50, %i1
	std	%f28,	[%l7 + %i1]
	nop
	set	0x58, %g2
	stw	%l0,	[%l7 + %g2]
	nop
	set	0x66, %i3
	ldsh	[%l7 + %i3],	%o0
	nop
	set	0x2E, %g6
	sth	%g3,	[%l7 + %g6]
	nop
	set	0x30, %l1
	stw	%o4,	[%l7 + %l1]
	bleu,pt	%icc,	loop_116
	nop
	set	0x60, %i6
	std	%f14,	[%l7 + %i6]
	nop
	set	0x7B, %i5
	ldstub	[%l7 + %i5],	%o3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g5
loop_116:
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x70, %i0
	ldx	[%l7 + %i0],	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%g4
	st	%fsr,	[%l7 + 0x08]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%g7
	set	0x54, %o1
	stha	%i7,	[%l7 + %o1] 0x81
	set	0x78, %l5
	stda	%o6,	[%l7 + %l5] 0x88
	set	0x4B, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i1
	nop
	set	0x10, %g1
	stx	%g1,	[%l7 + %g1]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f16
	nop
	set	0x7C, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x70, %l3
	std	%f2,	[%l7 + %l3]
	set	0x08, %o2
	lda	[%l7 + %o2] 0x89,	%f7
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x80,	%i0
	nop
	set	0x70, %i4
	swap	[%l7 + %i4],	%i4
	nop
	set	0x0E, %o6
	lduh	[%l7 + %o6],	%l4
	nop
	set	0x70, %l4
	std	%f4,	[%l7 + %l4]
	nop
	set	0x70, %g3
	ldub	[%l7 + %g3],	%l2
	nop
	set	0x0C, %o3
	prefetch	[%l7 + %o3],	 3
	set	0x4C, %g4
	stwa	%i5,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd2
	nop
	set	0x2A, %o7
	ldsb	[%l7 + %o7],	%l6
	st	%f5,	[%l7 + 0x2C]
	nop
	set	0x10, %g7
	swap	[%l7 + %g7],	%l1
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x81,	%l3
	wr	%o5,	%i2,	%clear_softint
	set	0x70, %o5
	stda	%i6,	[%l7 + %o5] 0x81
	bn,a	%xcc,	loop_117
	nop
	set	0x6C, %o4
	lduw	[%l7 + %o4],	%o7
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f0
loop_117:
	nop
	set	0x60, %i1
	stx	%o1,	[%l7 + %i1]
	nop
	set	0x70, %g2
	prefetch	[%l7 + %g2],	 1
	st	%fsr,	[%l7 + 0x40]
	set	0x4E, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l0
	and	%o2,	%g3,	%o0
	nop
	set	0x50, %l1
	ldx	[%l7 + %l1],	%o4
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 4
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	st	%f9,	[%l7 + 0x08]
	add	%g5,	%i3,	%g2
	set	0x6E, %i0
	stha	%g4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x64, %o1
	stba	%o3,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x81,	%g6
	nop
	set	0x3C, %i2
	ldsb	[%l7 + %i2],	%i7
	ld	[%l7 + 0x48],	%f8
	set	0x08, %g1
	lda	[%l7 + %g1] 0x80,	%f26
	set	0x28, %l5
	stwa	%g7,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x80,	%o6
	nop
	set	0x3C, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x78, %o2
	stxa	%g1,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%i1,	%i4,	%i0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd0,	%f0
	nop
	set	0x08, %l3
	stb	%l2,	[%l7 + %l3]
	nop
	set	0x28, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x1C, %o6
	stwa	%i5,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x58, %l4
	swapa	[%l7 + %l4] 0x80,	%l4
	nop
	set	0x54, %o3
	sth	%l6,	[%l7 + %o3]
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%l3
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f4
	set	0x28, %o7
	stwa	%l1,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x2C, %g7
	stwa	%o5,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f14
	set	0x48, %l2
	stha	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x64, %o5
	stw	%o7,	[%l7 + %o5]
	nop
	set	0x36, %i7
	stb	%i2,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%o1
	nop
	set	0x4C, %i1
	swap	[%l7 + %i1],	%o2
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f0
	set	0x5B, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g3
	nop
	set	0x10, %g6
	std	%f30,	[%l7 + %g6]
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%g5
	set	0x40, %i6
	stha	%i3,	[%l7 + %i6] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%g4
	be,pn	%icc,	loop_118
	nop
	set	0x16, %i0
	ldstub	[%l7 + %i0],	%g2
	nop
	set	0x30, %o1
	std	%f12,	[%l7 + %o1]
	nop
	set	0x30, %i3
	std	%f22,	[%l7 + %i3]
loop_118:
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f14
	or	%g6,	%o3,	%g7
	nop
	set	0x46, %g1
	sth	%o6,	[%l7 + %g1]
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x40, %l5
	std	%i6,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%i4
	wr	%i0,	%l2,	%sys_tick
	set	0x38, %l0
	stxa	%i5,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x38, %o2
	stx	%i1,	[%l7 + %o2]
	nop
	set	0x4B, %l6
	ldub	[%l7 + %l6],	%l6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l1
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f28
	set	0x24, %i4
	sta	%f31,	[%l7 + %i4] 0x88
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd8,	%f16
	nop
	set	0x0C, %o6
	ldsb	[%l7 + %o6],	%o5
	nop
	set	0x30, %o3
	std	%i6,	[%l7 + %o3]
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%l4
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%i2
	nop
	set	0x6C, %g4
	swap	[%l7 + %g4],	%o1
	set	0x48, %g3
	stda	%l0,	[%l7 + %g3] 0x89
	or	%g3,	%o2,	%o4
	nop
	set	0x1E, %g7
	sth	%g5,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f16
	nop
	set	0x7C, %l2
	stb	%o0,	[%l7 + %l2]
	and	%l5,	%i3,	%g4
	nop
	set	0x2C, %o0
	lduw	[%l7 + %o0],	%g2
	nop
	set	0x1D, %i7
	ldub	[%l7 + %i7],	%o3
	fpadd16	%f18,	%f30,	%f12
	st	%f3,	[%l7 + 0x64]
	nop
	set	0x4C, %i1
	ldsw	[%l7 + %i1],	%g6
	set	0x30, %o5
	ldxa	[%l7 + %o5] 0x88,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%g1
	nop
	set	0x08, %g2
	ldsh	[%l7 + %g2],	%i7
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%i5
	st	%f2,	[%l7 + 0x0C]
	nop
	set	0x78, %l1
	sth	%i4,	[%l7 + %l1]
	nop
	set	0x48, %i6
	lduh	[%l7 + %i6],	%l6
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x88,	 3
	st	%f22,	[%l7 + 0x40]
	ble	%icc,	loop_119
	nop
	set	0x44, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f24
	nop
	set	0x36, %i2
	ldsh	[%l7 + %i2],	%o5
loop_119:
	st	%fsr,	[%l7 + 0x24]
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x81,	%l1
	set	0x30, %i5
	prefetcha	[%l7 + %i5] 0x89,	 1
	set	0x4A, %l0
	stha	%o7,	[%l7 + %l0] 0x89
	nop
	set	0x7A, %o2
	ldsh	[%l7 + %o2],	%i2
	st	%fsr,	[%l7 + 0x3C]
	add	%l4,	%l0,	%o1
	nop
	set	0x30, %l5
	std	%f28,	[%l7 + %l5]
	add	%o2,	%g3,	%g5
	set	0x5C, %l6
	sta	%f24,	[%l7 + %l6] 0x80
	nop
	set	0x44, %g5
	lduh	[%l7 + %g5],	%o0
	set	0x0B, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o4
	wr	%l5,	%i3,	%sys_tick
	set	0x10, %l3
	ldstuba	[%l7 + %l3] 0x80,	%g4
	ba,a,pn	%icc,	loop_120
	nop
	set	0x38, %o6
	stw	%g2,	[%l7 + %o6]
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x80,	%g6
loop_120:
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	ld	[%l7 + 0x08],	%f15
	set	0x36, %g3
	stha	%g7,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%o6
	nop
	set	0x60, %o7
	stw	%g1,	[%l7 + %o7]
	nop
	set	0x6B, %g4
	ldsb	[%l7 + %g4],	%i7
	set	0x20, %o0
	stwa	%i0,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x80
	nop
	set	0x16, %l2
	lduh	[%l7 + %l2],	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%i4
	set	0x28, %o5
	sta	%f28,	[%l7 + %o5] 0x88
	nop
	set	0x66, %g2
	ldsh	[%l7 + %g2],	%l6
	nop
	set	0x30, %i1
	sth	%i5,	[%l7 + %i1]
	nop
	set	0x34, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%i0
	add	%o5,	%l1,	%i6
	set	0x60, %l1
	lda	[%l7 + %l1] 0x89,	%f10
	ld	[%l7 + 0x58],	%f12
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%l3
	set	0x6A, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o7
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x08, %i0
	stx	%i2,	[%l7 + %i0]
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%o1
	fpadd32s	%f17,	%f3,	%f23
	nop
	set	0x34, %i5
	sth	%o2,	[%l7 + %i5]
	nop
	set	0x50, %l0
	std	%f14,	[%l7 + %l0]
	fpsub32	%f20,	%f4,	%f14
	set	0x60, %i2
	stxa	%g3,	[%l7 + %i2] 0x88
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f2
	set	0x4C, %l6
	sta	%f10,	[%l7 + %l6] 0x81
	and	%l4,	%g5,	%o0
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x32, %g5
	sth	%l5,	[%l7 + %g5]
	nop
	set	0x08, %l3
	prefetch	[%l7 + %l3],	 0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%g4
	and	%g2,	%o4,	%g7
	nop
	set	0x70, %i4
	ldub	[%l7 + %i4],	%o6
	nop
	set	0x7C, %o3
	ldsh	[%l7 + %o3],	%g6
	nop
	set	0x0E, %o6
	lduh	[%l7 + %o6],	%i7
	ld	[%l7 + 0x20],	%f15
	set	0x70, %l4
	stwa	%i0,	[%l7 + %l4] 0x80
	nop
	set	0x76, %g7
	ldstub	[%l7 + %g7],	%o3
	set	0x0E, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g1
	nop
	set	0x48, %g4
	lduh	[%l7 + %g4],	%i4
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x80,	%l6
	nop
	set	0x58, %o0
	std	%f14,	[%l7 + %o0]
	and	%l2,	%i1,	%o5
	and	%i5,	%l1,	%i6
	set	0x63, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o7
	nop
	set	0x08, %l2
	lduh	[%l7 + %l2],	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%o1
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xeb,	%l2
	and	%o2,	%l4,	%g5
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%o0
	add	%g3,	%l5,	%i3
	nop
	set	0x38, %g6
	stx	%g4,	[%l7 + %g6]
	nop
	set	0x7E, %i1
	ldub	[%l7 + %i1],	%o4
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%g7
	nop
	set	0x31, %i6
	ldub	[%l7 + %i6],	%g2
	add	%g6,	%i7,	%i0
	set	0x38, %o4
	stha	%o6,	[%l7 + %o4] 0x89
	be,a	%icc,	loop_121
	and	%o3,	%i4,	%g1
	st	%fsr,	[%l7 + 0x7C]
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x80,	%l6
loop_121:
	ld	[%l7 + 0x6C],	%f0
	set	0x50, %i3
	stda	%i0,	[%l7 + %i3] 0x80
	set	0x76, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o5
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 4
	nop
	nop
	setx	0x42422F8FB3FA6609,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA029C1ABF04CDAB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f4
	nop
	set	0x6C, %i5
	lduh	[%l7 + %i5],	%l1
	st	%f10,	[%l7 + 0x10]
	set	0x2E, %i2
	stba	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	or	%l2,	%o7,	%i2
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%l0
	set	0x61, %l6
	stba	%l3,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x68, %o2
	stda	%o2,	[%l7 + %o2] 0x89
	nop
	set	0x78, %l5
	prefetch	[%l7 + %l5],	 3
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x80,	%o1
	set	0x20, %l3
	stba	%g5,	[%l7 + %l3] 0x88
	set	0x6B, %i4
	stba	%l4,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x14, %o3
	ldsw	[%l7 + %o3],	%g3
	set	0x38, %l4
	stda	%o0,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x10, %g7
	stxa	%l5,	[%l7 + %g7] 0x89
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%i3
	nop
	set	0x48, %g4
	std	%f24,	[%l7 + %g4]
	nop
	set	0x65, %o7
	ldub	[%l7 + %o7],	%o4
	nop
	set	0x18, %o0
	sth	%g4,	[%l7 + %o0]
	nop
	set	0x4A, %g3
	lduh	[%l7 + %g3],	%g2
	or	%g6,	%g7,	%i7
	nop
	set	0x7C, %i7
	ldsh	[%l7 + %i7],	%i0
	nop
	set	0x50, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x54, %g2
	stwa	%o6,	[%l7 + %g2] 0xea
	membar	#Sync
	and	%i4,	%o3,	%l6
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%i0
	nop
	set	0x48, %l1
	stw	%g1,	[%l7 + %l1]
	fpsub32s	%f8,	%f24,	%f1
	set	0x24, %i1
	sta	%f12,	[%l7 + %i1] 0x89
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%i6
	nop
	set	0x45, %o4
	ldub	[%l7 + %o4],	%l2
	st	%f10,	[%l7 + 0x08]
	set	0x10, %o1
	lda	[%l7 + %o1] 0x81,	%f26
	st	%fsr,	[%l7 + 0x54]
	set	0x58, %i0
	stda	%o6,	[%l7 + %i0] 0x89
	or	%i2,	%l0,	%l3
	nop
	set	0x46, %g1
	ldsh	[%l7 + %g1],	%l1
	set	0x24, %i5
	swapa	[%l7 + %i5] 0x81,	%o1
	set	0x08, %i3
	stda	%o2,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x7E, %i2
	ldstuba	[%l7 + %i2] 0x89,	%l4
	ld	[%l7 + 0x68],	%f11
	or	%g3,	%g5,	%o0
	st	%f9,	[%l7 + 0x38]
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe2,	%l4
	nop
	set	0x20, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x7C, %l5
	ldstub	[%l7 + %l5],	%g4
	nop
	set	0x6C, %g5
	stw	%g2,	[%l7 + %g5]
	nop
	set	0x18, %l3
	stx	%i3,	[%l7 + %l3]
	nop
	set	0x70, %i4
	lduw	[%l7 + %i4],	%g7
	st	%fsr,	[%l7 + 0x4C]
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xea,	%i6
	add	%i0,	%g6,	%i4
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%o3
	or	%l6,	%o6,	%g1
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x34, %g7
	stba	%i5,	[%l7 + %g7] 0x89
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	nop
	setx	0x1055D371483924D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x4C32F68400A605AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f12,	%f8
	nop
	set	0x75, %g4
	ldstub	[%l7 + %g4],	%o5
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x10, %o0
	lda	[%l7 + %o0] 0x89,	%f14
	add	%i1,	%l2,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%l0
	nop
	set	0x18, %i7
	lduw	[%l7 + %i7],	%l3
	set	0x48, %l2
	stda	%i2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x60, %g2
	std	%o0,	[%l7 + %g2]
	nop
	set	0x38, %g3
	std	%f28,	[%l7 + %g3]
	set	0x40, %g6
	stxa	%l1,	[%l7 + %g6] 0x88
	nop
	set	0x7B, %l1
	ldsb	[%l7 + %l1],	%l4
	add	%g3,	%o2,	%g5
	nop
	set	0x46, %i1
	sth	%o0,	[%l7 + %i1]
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x08, %o4
	std	%f22,	[%l7 + %o4]
	set	0x48, %o1
	stda	%o4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%l5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f16
	set	0x4C, %g1
	sta	%f28,	[%l7 + %g1] 0x81
	nop
	set	0x69, %i3
	stb	%g4,	[%l7 + %i3]
	nop
	set	0x19, %i5
	ldsb	[%l7 + %i5],	%i3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%i7
	nop
	set	0x18, %l6
	stw	%g7,	[%l7 + %l6]
	set	0x5C, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i0
	and	%g6,	%i4,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%o3
	set	0x7C, %l5
	stwa	%g1,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x70, %g5
	stda	%i4,	[%l7 + %g5] 0x80
	nop
	set	0x28, %l3
	std	%i0,	[%l7 + %l3]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%o7
	set	0x12, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l2
	nop
	set	0x4A, %i4
	ldsh	[%l7 + %i4],	%i6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	ld	[%l7 + 0x14],	%f12
	nop
	set	0x34, %l4
	ldsw	[%l7 + %l4],	%l3
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x89,	%i2
	nop
	nop
	setx	0x371D7AEF99FAD59D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x1E5AAC679AC0CA30,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f2
	nop
	nop
	setx	0x14C90168,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x154479A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f20,	%f5
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xea,	%l0
	nop
	set	0x70, %o6
	stx	%o1,	[%l7 + %o6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	fpsub32	%f4,	%f2,	%f0
	set	0x70, %o7
	ldda	[%l7 + %o7] 0xe3,	%l4
	set	0x58, %o0
	stxa	%o2,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x5C, %i7
	swapa	[%l7 + %i7] 0x80,	%g5
	nop
	set	0x3C, %l2
	stw	%o4,	[%l7 + %l2]
	set	0x40, %g2
	stxa	%l5,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x89,	%g4
	set	0x70, %g3
	stwa	%o0,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x3E, %l1
	sth	%g2,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f16
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%i2
	and	%i7,	%g7,	%i0
	set	0x30, %o4
	sta	%f28,	[%l7 + %o4] 0x89
	st	%fsr,	[%l7 + 0x5C]
	set	0x64, %o1
	stwa	%g6,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x62, %i6
	ldub	[%l7 + %i6],	%l6
	nop
	set	0x54, %i0
	ldsb	[%l7 + %i0],	%i4
	nop
	set	0x1C, %o5
	lduw	[%l7 + %o5],	%o6
	nop
	set	0x7B, %i3
	ldub	[%l7 + %i3],	%o3
	st	%f17,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x74]
	ld	[%l7 + 0x58],	%f17
	st	%fsr,	[%l7 + 0x34]
	set	0x60, %g1
	stwa	%g1,	[%l7 + %g1] 0x80
	set	0x40, %l6
	stxa	%i1,	[%l7 + %l6] 0xeb
	membar	#Sync
	and	%o5,	%o7,	%l2
	nop
	set	0x74, %i2
	stw	%i5,	[%l7 + %i2]
	nop
	set	0x68, %i5
	std	%f30,	[%l7 + %i5]
	nop
	set	0x44, %l5
	sth	%i6,	[%l7 + %l5]
	set	0x0F, %l3
	stba	%i2,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%l3
	set	0x28, %i4
	stda	%l0,	[%l7 + %i4] 0x89
	set	0x49, %l0
	stba	%l1,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x5C, %o2
	lduw	[%l7 + %o2],	%g3
	nop
	set	0x5E, %l4
	ldsh	[%l7 + %l4],	%l4
	nop
	set	0x48, %o3
	stx	%fsr,	[%l7 + %o3]
	bne,a	%xcc,	loop_122
	nop
	set	0x40, %g7
	std	%f0,	[%l7 + %g7]
	or	%o1,	%g5,	%o2
	set	0x48, %o7
	stda	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
loop_122:
	ld	[%l7 + 0x70],	%f17
	ld	[%l7 + 0x10],	%f12
	nop
	set	0x36, %o6
	sth	%o4,	[%l7 + %o6]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc2
	nop
	set	0x18, %o0
	lduh	[%l7 + %o0],	%g4
	nop
	set	0x0C, %l2
	ldsw	[%l7 + %l2],	%g2
	nop
	set	0x71, %g4
	ldub	[%l7 + %g4],	%o0
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f14
	nop
	set	0x74, %g2
	ldsw	[%l7 + %g2],	%i7
	set	0x58, %l1
	stxa	%i3,	[%l7 + %l1] 0x89
	set	0x78, %i1
	stha	%i0,	[%l7 + %i1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x50],	%f19
	or	%g7,	%l6,	%g6
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%o6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x44, %o1
	ldsh	[%l7 + %o1],	%i1
	nop
	set	0x40, %i6
	lduh	[%l7 + %i6],	%i4
	nop
	set	0x6C, %o5
	ldsw	[%l7 + %o5],	%o5
	nop
	set	0x44, %i3
	stw	%l2,	[%l7 + %i3]
	nop
	set	0x30, %g1
	ldsh	[%l7 + %g1],	%i5
	nop
	set	0x18, %l6
	std	%f0,	[%l7 + %l6]
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f8
	set	0x57, %i5
	stba	%o7,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x38, %l5
	lduh	[%l7 + %l5],	%i6
	nop
	set	0x14, %l3
	ldsw	[%l7 + %l3],	%l3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i2
	set	0x10, %i0
	stxa	%g3,	[%l7 + %i0] 0x80
	set	0x10, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l4
	set	0x4C, %g5
	sta	%f4,	[%l7 + %g5] 0x81
	nop
	set	0x50, %l0
	lduh	[%l7 + %l0],	%o1
	nop
	set	0x08, %o2
	std	%f20,	[%l7 + %o2]
	nop
	set	0x50, %l4
	prefetch	[%l7 + %l4],	 4
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x81,	%g4
	add	%l1,	%o2,	%o4
	nop
	set	0x3E, %o7
	ldub	[%l7 + %o7],	%l5
	nop
	set	0x46, %o3
	sth	%g2,	[%l7 + %o3]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x88
	nop
	set	0x68, %i7
	ldub	[%l7 + %i7],	%o0
	bne,pn	%xcc,	loop_123
	nop
	set	0x1A, %l2
	ldstub	[%l7 + %l2],	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%i3
loop_123:
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f28
	ba,a	%xcc,	loop_124
	nop
	set	0x48, %o0
	std	%g6,	[%l7 + %o0]
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f16
	set	0x78, %l1
	stda	%i6,	[%l7 + %l1] 0xea
	membar	#Sync
loop_124:
	nop
	set	0x64, %g3
	sth	%i0,	[%l7 + %g3]
	and	%o6,	%o3,	%g1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%i4
	set	0x52, %g6
	stha	%o5,	[%l7 + %g6] 0x89
	set	0x0C, %i1
	stwa	%g6,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x1C, %o4
	sta	%f4,	[%l7 + %o4] 0x81
	or	%l2,	%o7,	%i6
	nop
	set	0x54, %i6
	ldsh	[%l7 + %i6],	%i5
	nop
	set	0x24, %o1
	lduw	[%l7 + %o1],	%l3
	nop
	set	0x78, %o5
	ldsw	[%l7 + %o5],	%l0
	nop
	set	0x14, %g1
	lduw	[%l7 + %g1],	%g3
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%l4
	nop
	set	0x68, %i2
	sth	%o1,	[%l7 + %i2]
	nop
	set	0x14, %l6
	ldub	[%l7 + %l6],	%i2
	nop
	set	0x10, %i5
	stb	%g5,	[%l7 + %i5]
	nop
	set	0x24, %l5
	ldsw	[%l7 + %l5],	%o2
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%l1
	nop
	set	0x08, %i4
	stx	%o4,	[%l7 + %i4]
	bl,pt	%xcc,	loop_125
	nop
	set	0x7A, %g5
	ldsh	[%l7 + %g5],	%g2
	set	0x5C, %l3
	stha	%l5,	[%l7 + %l3] 0xea
	membar	#Sync
loop_125:
	or	%i7,	%o0,	%g4
	bge,pn	%xcc,	loop_126
	nop
	set	0x3B, %o2
	ldstub	[%l7 + %o2],	%i3
	add	%l6,	%i0,	%o6
	nop
	set	0x1C, %l0
	ldsw	[%l7 + %l0],	%o3
loop_126:
	nop
	set	0x3A, %l4
	ldsh	[%l7 + %l4],	%g7
	set	0x60, %g7
	stwa	%i1,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x68, %o3
	ldstub	[%l7 + %o3],	%g1
	nop
	set	0x58, %o6
	stx	%o5,	[%l7 + %o6]
	nop
	set	0x1A, %o7
	sth	%i4,	[%l7 + %o7]
	ld	[%l7 + 0x6C],	%f23
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x89,	%g6
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%o7
	set	0x10, %l2
	stda	%l2,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f0
	and	%i5,	%i6,	%l3
	set	0x58, %o0
	sta	%f17,	[%l7 + %o0] 0x81
	nop
	set	0x08, %g3
	stx	%l0,	[%l7 + %g3]
	ld	[%l7 + 0x1C],	%f18
	nop
	set	0x30, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x0C, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x30, %o4
	stda	%l4,	[%l7 + %o4] 0xea
	membar	#Sync
	ld	[%l7 + 0x1C],	%f21
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%g3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x88
	st	%f15,	[%l7 + 0x60]
	set	0x20, %g1
	swapa	[%l7 + %g1] 0x88,	%i2
	add	%o1,	%o2,	%g5
	set	0x68, %i3
	stda	%l0,	[%l7 + %i3] 0x89
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xcc
	fpsub16s	%f9,	%f30,	%f13
	set	0x40, %l6
	stwa	%g2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x5C, %i5
	stw	%l5,	[%l7 + %i5]
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x88,	%i7
	fpsub16s	%f29,	%f4,	%f24
	add	%o4,	%o0,	%i3
	set	0x3A, %i0
	stba	%g4,	[%l7 + %i0] 0x88
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x88,	%i0
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x80,	%l6
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%o2
	set	0x10, %i4
	lda	[%l7 + %i4] 0x88,	%f7
	nop
	set	0x20, %o2
	std	%f16,	[%l7 + %o2]
	and	%g7,	%i1,	%g1
	set	0x22, %l0
	stba	%o5,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x5B, %l4
	ldub	[%l7 + %l4],	%o6
	nop
	set	0x19, %g7
	ldstub	[%l7 + %g7],	%g6
	nop
	set	0x58, %o3
	sth	%o7,	[%l7 + %o3]
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	nop
	set	0x38, %i7
	std	%i4,	[%l7 + %i7]
	or	%i4,	%i6,	%l0
	set	0x40, %g4
	stxa	%l4,	[%l7 + %g4] 0x81
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x81,	 4
	nop
	set	0x0A, %l2
	ldstub	[%l7 + %l2],	%l3
	nop
	set	0x72, %o0
	ldsh	[%l7 + %o0],	%o1
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x80,	%i2
	nop
	set	0x5F, %g3
	ldsb	[%l7 + %g3],	%o2
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xe3,	%g4
	nop
	set	0x20, %o4
	stx	%l1,	[%l7 + %o4]
	nop
	set	0x32, %i1
	lduh	[%l7 + %i1],	%l5
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc0
	bleu,a,pt	%icc,	loop_127
	ld	[%l7 + 0x74],	%f19
	nop
	set	0x43, %o1
	ldstub	[%l7 + %o1],	%i7
	and	%g2,	%o0,	%o4
loop_127:
	nop
	nop
	setx	0xBF9B6F981D348BCA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x48E3DF4E660FE465,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f8,	%f20
	nop
	set	0x30, %l1
	swap	[%l7 + %l1],	%g4
	set	0x7A, %i3
	stha	%i3,	[%l7 + %i3] 0xe2
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%i0
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x88,	%g7
	nop
	set	0x5D, %o5
	ldsb	[%l7 + %o5],	%i1
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe2,	%g0
	nop
	set	0x28, %l6
	stw	%o3,	[%l7 + %l6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%o6
	nop
	set	0x74, %i2
	stw	%o7,	[%l7 + %i2]
	and	%g6,	%l2,	%i4
	nop
	set	0x30, %i0
	std	%f20,	[%l7 + %i0]
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%i5
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%i6
	set	0x50, %i4
	ldxa	[%l7 + %i4] 0x81,	%l4
	set	0x38, %g5
	lda	[%l7 + %g5] 0x80,	%f29
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd8
	and	%l0,	%l3,	%g3
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f10
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x88,	 3
	nop
	set	0x6D, %o3
	ldsb	[%l7 + %o3],	%o2
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%o0
	nop
	set	0x7E, %g7
	lduh	[%l7 + %g7],	%l1
	wr	%l5,	%g5,	%ccr
	nop
	set	0x6C, %i7
	ldsw	[%l7 + %i7],	%i7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%o4
	nop
	set	0x7D, %o6
	ldub	[%l7 + %o6],	%o0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f0
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x36, %g2
	lduh	[%l7 + %g2],	%g4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%i0
	nop
	set	0x74, %g3
	stw	%g7,	[%l7 + %g3]
	set	0x38, %g6
	stxa	%l6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x20, %i1
	stda	%g0,	[%l7 + %i1] 0x88
	set	0x18, %i6
	stda	%o2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x2C, %o1
	ldsw	[%l7 + %o1],	%o5
	nop
	set	0x4A, %l1
	stb	%i1,	[%l7 + %l1]
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%o6
	nop
	set	0x0A, %o4
	sth	%o7,	[%l7 + %o4]
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%g6
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x88
	nop
	set	0x38, %o5
	std	%f2,	[%l7 + %o5]
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f30
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%l2
	add	%i5,	%i6,	%i4
	nop
	set	0x28, %l5
	std	%l4,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x10, %l3
	std	%l0,	[%l7 + %l3]
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%g3
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x89,	 2
	nop
	set	0x2B, %g5
	ldsb	[%l7 + %g5],	%o2
	set	0x2C, %l0
	stwa	%o1,	[%l7 + %l0] 0x89
	add	%l3,	%l5,	%g5
	st	%f17,	[%l7 + 0x50]
	nop
	set	0x38, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x7C, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l1
	nop
	set	0x2C, %l4
	stw	%g2,	[%l7 + %l4]
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x81,	%o4
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%o0
	nop
	set	0x66, %i7
	ldstub	[%l7 + %i7],	%g4
	nop
	set	0x14, %l2
	stb	%i0,	[%l7 + %l2]
	ld	[%l7 + 0x10],	%f17
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x80,	%i3
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x80,	%l6
	nop
	set	0x24, %o6
	ldsw	[%l7 + %o6],	%g1
	ld	[%l7 + 0x54],	%f14
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%g6
	or	%o3,	%i1,	%o5
	set	0x10, %g3
	lda	[%l7 + %g3] 0x80,	%f15
	set	0x58, %g6
	stba	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x4E, %i6
	stba	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x60, %o1
	stxa	%o7,	[%l7 + %o1] 0xe2
	membar	#Sync
	and	%l2,	%i6,	%i5
	st	%f24,	[%l7 + 0x6C]
	fpsub32	%f18,	%f28,	%f28
	nop
	set	0x6B, %i1
	stb	%i4,	[%l7 + %i1]
	set	0x78, %l1
	lda	[%l7 + %l1] 0x81,	%f18
	set	0x60, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l0
	and	%g3,	%i2,	%l4
	nop
	set	0x48, %g1
	stx	%o2,	[%l7 + %g1]
	nop
	set	0x62, %i3
	sth	%o1,	[%l7 + %i3]
	fpadd32	%f12,	%f22,	%f20
	set	0x2D, %o5
	ldstuba	[%l7 + %o5] 0x81,	%l3
	nop
	set	0x5D, %i5
	ldstub	[%l7 + %i5],	%l5
	or	%i7,	%g5,	%l1
	nop
	set	0x6E, %i0
	ldsh	[%l7 + %i0],	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%o0
	nop
	nop
	setx	0xAC6A659A2825CC1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4369394B15EE77FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f22,	%f10
	nop
	set	0x0C, %l5
	stb	%i0,	[%l7 + %l5]
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x81,	 2
	nop
	set	0x20, %l3
	ldsh	[%l7 + %l3],	%g4
	nop
	set	0x37, %i2
	ldsb	[%l7 + %i2],	%l6
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 3
	fpadd32s	%f22,	%f26,	%f18
	set	0x40, %g5
	stwa	%o3,	[%l7 + %g5] 0x80
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f30
	nop
	set	0x3E, %o3
	ldsh	[%l7 + %o3],	%i1
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	set	0x22, %l0
	stba	%o5,	[%l7 + %l0] 0x80
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%g6
	nop
	set	0x2E, %i7
	stb	%o6,	[%l7 + %i7]
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x80,	%l2
	nop
	set	0x58, %g4
	ldsh	[%l7 + %g4],	%i6
	nop
	set	0x10, %o0
	lduh	[%l7 + %o0],	%o7
	nop
	set	0x18, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x1C, %g2
	stw	%i4,	[%l7 + %g2]
	set	0x0A, %o6
	stba	%i5,	[%l7 + %o6] 0x80
	nop
	set	0x20, %g3
	stw	%l0,	[%l7 + %g3]
	nop
	set	0x58, %i6
	std	%g2,	[%l7 + %i6]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1295
!	Type a   	: 19
!	Type cti   	: 33
!	Type x   	: 511
!	Type f   	: 31
!	Type i   	: 111
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
	set	0x6,	%g1
	set	0x5,	%g2
	set	0x4,	%g3
	set	0xC,	%g4
	set	0x6,	%g5
	set	0xD,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x8,	%i1
	set	-0x2,	%i2
	set	-0x5,	%i3
	set	-0x8,	%i4
	set	-0x0,	%i5
	set	-0xE,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x4CD776C1,	%l0
	set	0x5B7AB096,	%l1
	set	0x1E3FB58C,	%l2
	set	0x6EA1149B,	%l3
	set	0x44530B75,	%l4
	set	0x694BBCAA,	%l5
	set	0x1E2D2D6D,	%l6
	!# Output registers
	set	0x01E2,	%o0
	set	-0x1529,	%o1
	set	0x0772,	%o2
	set	-0x0F98,	%o3
	set	0x10DE,	%o4
	set	0x06DF,	%o5
	set	0x1CC3,	%o6
	set	0x14B3,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	nop
	set	0x70, %l1
	stx	%i2,	[%l7 + %l1]
	nop
	set	0x58, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x60, %g1
	stw	%l4,	[%l7 + %g1]
	nop
	set	0x34, %i3
	ldub	[%l7 + %i3],	%o2
	nop
	set	0x1A, %o5
	ldsh	[%l7 + %o5],	%l3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	nop
	set	0x62, %o4
	lduh	[%l7 + %o4],	%l5
	nop
	set	0x2A, %i0
	ldub	[%l7 + %i0],	%o1
	add	%i7,	%l1,	%g5
	nop
	set	0x65, %l6
	ldub	[%l7 + %l6],	%o4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEB1, 	%tick_cmpr
	set	0x44, %l5
	stwa	%i3,	[%l7 + %l5] 0xea
	membar	#Sync
	ld	[%l7 + 0x6C],	%f9
	set	0x74, %l3
	sta	%f6,	[%l7 + %l3] 0x89
	nop
	set	0x44, %i2
	lduw	[%l7 + %i2],	%g4
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x50, %i4
	stx	%i0,	[%l7 + %i4]
	nop
	set	0x38, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x80,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%l6
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	nop
	set	0x40, %l4
	std	%f20,	[%l7 + %l4]
	nop
	set	0x40, %o7
	ldsh	[%l7 + %o7],	%g1
	fpsub32s	%f2,	%f28,	%f6
	nop
	set	0x48, %g7
	ldstub	[%l7 + %g7],	%g6
	nop
	set	0x1C, %g4
	ldsw	[%l7 + %g4],	%o5
	set	0x7A, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o6
	nop
	nop
	setx	0xD152CD4616E65C82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x99A2ABC7CDC59FBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f6
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x29, %g2
	ldstuba	[%l7 + %g2] 0x88,	%l2
	nop
	set	0x20, %l2
	stw	%i6,	[%l7 + %l2]
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%o6
	nop
	set	0x50, %g3
	swap	[%l7 + %g3],	%i5
	nop
	set	0x18, %i6
	lduw	[%l7 + %i6],	%i4
	ld	[%l7 + 0x38],	%f4
	nop
	set	0x26, %i1
	lduh	[%l7 + %i1],	%l0
	set	0x18, %l1
	stwa	%i2,	[%l7 + %l1] 0x89
	fpsub32	%f0,	%f14,	%f24
	ld	[%l7 + 0x28],	%f18
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x89,	%g2
	nop
	set	0x54, %g1
	stw	%l4,	[%l7 + %g1]
	add	%l3,	%l5,	%o1
	nop
	set	0x3C, %i3
	stw	%i7,	[%l7 + %i3]
	set	0x40, %o5
	lda	[%l7 + %o5] 0x89,	%f29
	nop
	set	0x08, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	set	0x50, %o4
	stxa	%o2,	[%l7 + %o4] 0xea
	membar	#Sync
	st	%f31,	[%l7 + 0x74]
	add	%l1,	%o4,	%o0
	set	0x6F, %i0
	stba	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
	st	%f31,	[%l7 + 0x54]
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f14
	set	0x28, %l3
	stxa	%g5,	[%l7 + %l3] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i0
	fpsub16s	%f2,	%f20,	%f29
	set	0x24, %i2
	stwa	%g7,	[%l7 + %i2] 0x89
	st	%f6,	[%l7 + 0x74]
	ld	[%l7 + 0x64],	%f18
	set	0x47, %l6
	stba	%i3,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x0F, %i4
	stba	%l6,	[%l7 + %i4] 0xe2
	membar	#Sync
	ld	[%l7 + 0x78],	%f19
	add	%i1,	%g1,	%g6
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%o5
	set	0x14, %o3
	sta	%f4,	[%l7 + %o3] 0x80
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xe2,	%o6
	nop
	set	0x30, %l4
	stx	%o3,	[%l7 + %l4]
	set	0x50, %o7
	swapa	[%l7 + %o7] 0x88,	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%o7
	ld	[%l7 + 0x64],	%f24
	nop
	set	0x24, %l0
	stw	%i5,	[%l7 + %l0]
	nop
	set	0x30, %g4
	stx	%i4,	[%l7 + %g4]
	nop
	set	0x1A, %i7
	ldsh	[%l7 + %i7],	%i2
	nop
	set	0x6C, %o0
	stw	%l0,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x68]
	or	%g3,	%l4,	%l3
	nop
	set	0x17, %g2
	ldsb	[%l7 + %g2],	%l5
	set	0x10, %g7
	stha	%i7,	[%l7 + %g7] 0x80
	set	0x30, %l2
	stda	%o0,	[%l7 + %l2] 0x88
	set	0x48, %o6
	swapa	[%l7 + %o6] 0x89,	%l1
	fpsub16s	%f29,	%f11,	%f8
	nop
	set	0x20, %i6
	stw	%o4,	[%l7 + %i6]
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xe2,	%o2
	set	0x68, %i1
	sta	%f0,	[%l7 + %i1] 0x89
	nop
	set	0x7C, %g6
	swap	[%l7 + %g6],	%o0
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%g2
	ld	[%l7 + 0x30],	%f20
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x80,	%g4
	nop
	set	0x5D, %i3
	ldub	[%l7 + %i3],	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%i0
	fpadd16	%f30,	%f28,	%f12
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x89,	 0
	and	%i1,	%g1,	%g6
	or	%o5,	%o6,	%l6
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x72, %i5
	sth	%o7,	[%l7 + %i5]
	nop
	set	0x33, %o4
	ldub	[%l7 + %o4],	%i5
	nop
	set	0x40, %o1
	lduh	[%l7 + %o1],	%l2
	bleu,a	%icc,	loop_128
	nop
	set	0x70, %l5
	swap	[%l7 + %l5],	%i2
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f22
	st	%f1,	[%l7 + 0x10]
loop_128:
	nop
	set	0x48, %i2
	std	%f8,	[%l7 + %i2]
	nop
	set	0x48, %l3
	swap	[%l7 + %l3],	%l0
	nop
	set	0x1C, %l6
	ldsb	[%l7 + %l6],	%i4
	nop
	set	0x18, %i4
	prefetch	[%l7 + %i4],	 4
	nop
	set	0x5B, %o2
	stb	%g3,	[%l7 + %o2]
	set	0x47, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l3
	ld	[%l7 + 0x48],	%f3
	set	0x70, %l4
	stda	%l4,	[%l7 + %l4] 0xeb
	membar	#Sync
	add	%i7,	%l5,	%o1
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x11, %o7
	ldstub	[%l7 + %o7],	%l1
	nop
	set	0x28, %g4
	std	%f18,	[%l7 + %g4]
	wr	%o4,	%o2,	%pic
	set	0x64, %i7
	stwa	%g2,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	set	0x0C, %o0
	lda	[%l7 + %o0] 0x88,	%f12
	set	0x48, %g2
	stxa	%g5,	[%l7 + %g2] 0x89
	set	0x58, %l2
	ldxa	[%l7 + %l2] 0x80,	%g4
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x88,	 2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%i1
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%i3
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%o5
	nop
	set	0x2C, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x6C, %g6
	lda	[%l7 + %g6] 0x80,	%f31
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%o6
	or	%o3,	%l6,	%o7
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%i5
	or	%i6,	%l2,	%l0
	set	0x6E, %i5
	stba	%i4,	[%l7 + %i5] 0x89
	set	0x38, %o5
	stha	%i2,	[%l7 + %o5] 0xe3
	membar	#Sync
	wr	%g3,	%l4,	%y
	nop
	set	0x12, %o4
	ldsh	[%l7 + %o4],	%l3
	nop
	set	0x68, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x6C, %l5
	swap	[%l7 + %l5],	%i7
	set	0x10, %i0
	stda	%o0,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x5C, %i2
	prefetch	[%l7 + %i2],	 1
	and	%l1,	%l5,	%o4
	nop
	set	0x4F, %l3
	stb	%o2,	[%l7 + %l3]
	set	0x08, %l6
	stxa	%o0,	[%l7 + %l6] 0x88
	nop
	set	0x64, %o2
	stw	%g2,	[%l7 + %o2]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x89,	%g4
	ld	[%l7 + 0x50],	%f22
	nop
	set	0x64, %i4
	ldsh	[%l7 + %i4],	%g5
	nop
	set	0x50, %l4
	swap	[%l7 + %l4],	%g7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f16
	set	0x14, %o3
	stha	%i0,	[%l7 + %o3] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	nop
	set	0x0C, %i7
	prefetch	[%l7 + %i7],	 1
	fpadd16s	%f23,	%f27,	%f30
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%i1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	nop
	set	0x50, %l2
	stx	%g1,	[%l7 + %l2]
	nop
	nop
	setx	0x7AD05B08,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x7F3D2060,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f8,	%f27
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%g6
	nop
	set	0x50, %i6
	stx	%i3,	[%l7 + %i6]
	nop
	nop
	setx	0x24C3F5196770EC16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0B1DE87AA2192B8B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f22,	%f28
	nop
	set	0x43, %l0
	stb	%o5,	[%l7 + %l0]
	nop
	set	0x1C, %o6
	stw	%o3,	[%l7 + %o6]
	nop
	set	0x78, %g3
	ldsb	[%l7 + %g3],	%o6
	and	%l6,	%i5,	%i6
	nop
	set	0x19, %l1
	ldub	[%l7 + %l1],	%l2
	nop
	set	0x2C, %i1
	ldsw	[%l7 + %i1],	%o7
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	or	%i2,	%i4,	%g3
	nop
	set	0x60, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x50, %g1
	stda	%l2,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x52, %i5
	ldstuba	[%l7 + %i5] 0x80,	%i7
	and	%l4,	%l1,	%o1
	set	0x56, %o4
	stba	%l5,	[%l7 + %o4] 0x89
	nop
	set	0x40, %o5
	ldstub	[%l7 + %o5],	%o4
	set	0x08, %o1
	lda	[%l7 + %o1] 0x89,	%f30
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x5C, %l5
	stb	%o2,	[%l7 + %l5]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc4
	st	%fsr,	[%l7 + 0x2C]
	set	0x2E, %l6
	stha	%g2,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x3C, %o2
	lduh	[%l7 + %o2],	%g4
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	add	%g7,	%g5,	%i1
	nop
	set	0x7B, %i4
	ldsb	[%l7 + %i4],	%i0
	set	0x48, %l4
	sta	%f11,	[%l7 + %l4] 0x81
	nop
	set	0x44, %o7
	lduh	[%l7 + %o7],	%g1
	fpsub32s	%f9,	%f11,	%f17
	nop
	set	0x62, %o3
	ldsb	[%l7 + %o3],	%g6
	nop
	set	0x74, %g4
	lduw	[%l7 + %g4],	%o5
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%i3
	nop
	set	0x08, %o0
	std	%f8,	[%l7 + %o0]
	set	0x68, %i7
	stda	%o2,	[%l7 + %i7] 0x89
	nop
	set	0x54, %g2
	sth	%o6,	[%l7 + %g2]
	set	0x16, %l2
	stba	%l6,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x28, %i6
	stxa	%i5,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f0
	set	0x29, %g7
	stba	%l2,	[%l7 + %g7] 0x80
	nop
	set	0x68, %o6
	stx	%o7,	[%l7 + %o6]
	nop
	nop
	setx	0x5C5717B5E0E33C9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x3C9C24D30E6FBCDE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f28,	%f26
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd2,	%f0
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
	nop
	set	0x6C, %i3
	ldsw	[%l7 + %i3],	%l0
	set	0x10, %g3
	stwa	%i6,	[%l7 + %g3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x40],	%f22
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x80,	%i2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd2
	nop
	set	0x1C, %o4
	ldsw	[%l7 + %o4],	%g3
	ld	[%l7 + 0x20],	%f19
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x89,	 2
	st	%f25,	[%l7 + 0x2C]
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%l2
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%l4
	wr	%l1,	%i7,	%softint
	nop
	set	0x69, %o5
	ldub	[%l7 + %o5],	%o1
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%l4
	nop
	set	0x5F, %l3
	ldub	[%l7 + %l3],	%o2
	set	0x40, %l6
	stwa	%o4,	[%l7 + %l6] 0x88
	fpsub16s	%f30,	%f23,	%f17
	set	0x48, %i2
	stwa	%g2,	[%l7 + %i2] 0x89
	nop
	set	0x48, %o2
	swap	[%l7 + %o2],	%g4
	nop
	set	0x08, %l4
	lduh	[%l7 + %l4],	%g7
	nop
	set	0x28, %i4
	ldsw	[%l7 + %i4],	%g5
	nop
	set	0x08, %o3
	stw	%o0,	[%l7 + %o3]
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x81,	 3
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x89,	%i0
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%g1
	st	%fsr,	[%l7 + 0x68]
	or	%g6,	%i3,	%o3
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f6
	or	%o6,	%l6,	%o5
	ld	[%l7 + 0x5C],	%f5
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	nop
	set	0x40, %i7
	stb	%o7,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x34]
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x88,	%l2
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x20, %l0
	stwa	%l0,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%i6
	or	%g3,	%i4,	%i2
	nop
	set	0x62, %l1
	ldstub	[%l7 + %l1],	%l4
	nop
	set	0x7C, %o6
	ldstub	[%l7 + %o6],	%l1
	st	%f25,	[%l7 + 0x18]
	nop
	set	0x1C, %i3
	sth	%l3,	[%l7 + %i3]
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x58, %g6
	ldstub	[%l7 + %g6],	%o1
	nop
	set	0x40, %g3
	swap	[%l7 + %g3],	%l5
	nop
	set	0x61, %i5
	ldsb	[%l7 + %i5],	%o2
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f4
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x80,	%o4
	fpsub32s	%f29,	%f13,	%f2
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%i7
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f24
	nop
	set	0x78, %l5
	ldsw	[%l7 + %l5],	%g4
	set	0x18, %i0
	stxa	%g2,	[%l7 + %i0] 0xe2
	membar	#Sync
	st	%f27,	[%l7 + 0x24]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%g5
	set	0x68, %l3
	sta	%f19,	[%l7 + %l3] 0x81
	nop
	set	0x50, %l6
	std	%f6,	[%l7 + %l6]
	and	%o0,	%i1,	%i0
	add	%g1,	%i3,	%g6
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x80,	%o6
	nop
	set	0x30, %i2
	ldsw	[%l7 + %i2],	%o3
	nop
	set	0x64, %l4
	swap	[%l7 + %l4],	%l6
	and	%i5,	%o7,	%l2
	set	0x1C, %i4
	stwa	%l0,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x70, %o3
	stda	%i6,	[%l7 + %o3] 0x81
	set	0x1B, %g4
	ldstuba	[%l7 + %g4] 0x80,	%o5
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xeb,	%g2
	nop
	set	0x24, %o0
	ldsh	[%l7 + %o0],	%i4
	set	0x1C, %g2
	stwa	%l4,	[%l7 + %g2] 0x89
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%i2
	and	%l1,	%o1,	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDCC, 	%sys_tick_cmpr
	nop
	set	0x08, %i7
	ldstub	[%l7 + %i7],	%i7
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%o2
	nop
	set	0x56, %l2
	sth	%g4,	[%l7 + %l2]
	nop
	set	0x72, %g7
	lduh	[%l7 + %g7],	%g2
	set	0x1E, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g5
	nop
	set	0x08, %l1
	ldsb	[%l7 + %l1],	%g7
	nop
	set	0x5F, %o6
	stb	%o0,	[%l7 + %o6]
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%i1
	add	%g1,	%i0,	%i3
	nop
	set	0x53, %i3
	ldsb	[%l7 + %i3],	%g6
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf8
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f16
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x88,	%o3
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f26
	set	0x50, %o5
	swapa	[%l7 + %o5] 0x89,	%i5
	set	0x58, %l5
	stda	%o6,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%l2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x54, %l3
	stw	%l0,	[%l7 + %l3]
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x81,	%l6
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f0
	set	0x24, %o2
	stba	%i6,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x58, %l4
	std	%f24,	[%l7 + %l4]
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%o4
	st	%f20,	[%l7 + 0x74]
	ld	[%l7 + 0x70],	%f29
	nop
	set	0x6E, %o3
	lduh	[%l7 + %o3],	%g3
	nop
	set	0x60, %i4
	std	%l4,	[%l7 + %i4]
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%i2
	nop
	set	0x14, %o0
	swap	[%l7 + %o0],	%l1
	nop
	set	0x78, %g2
	lduw	[%l7 + %g2],	%o1
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x58, %o7
	stx	%i4,	[%l7 + %o7]
	nop
	set	0x48, %i6
	stx	%l5,	[%l7 + %i6]
	st	%f4,	[%l7 + 0x44]
	nop
	set	0x70, %l2
	std	%l2,	[%l7 + %l2]
	nop
	set	0x38, %g7
	ldsb	[%l7 + %g7],	%o4
	set	0x6A, %l0
	stha	%o2,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%i7,	%g4,	%g2
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%o0
	set	0x41, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i1
	nop
	set	0x61, %l1
	ldstub	[%l7 + %l1],	%g5
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	nop
	set	0x14, %g3
	prefetch	[%l7 + %g3],	 4
	add	%i0,	%i3,	%g6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc0
	bg,a,pn	%icc,	loop_129
	wr 	%g0, 	0x5, 	%fprs
	st	%f27,	[%l7 + 0x6C]
	set	0x58, %i1
	lda	[%l7 + %i1] 0x88,	%f25
loop_129:
	nop
	set	0x2C, %i5
	ldsw	[%l7 + %i5],	%i5
	nop
	set	0x60, %o1
	std	%f20,	[%l7 + %o1]
	set	0x18, %o5
	stha	%o7,	[%l7 + %o5] 0xe3
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%l0
	nop
	set	0x5C, %l5
	lduh	[%l7 + %l5],	%o3
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f10
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%i6
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x81,	%o5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc4
	nop
	set	0x7B, %o2
	stb	%l6,	[%l7 + %o2]
	nop
	set	0x38, %l4
	ldsh	[%l7 + %l4],	%l4
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%i2
	set	0x16, %i2
	stha	%g3,	[%l7 + %i2] 0x80
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o0
	nop
	set	0x1C, %o3
	ldsb	[%l7 + %o3],	%i4
	nop
	set	0x54, %o0
	swap	[%l7 + %o0],	%l1
	nop
	set	0x32, %g2
	ldsh	[%l7 + %g2],	%l5
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xda
	nop
	set	0x18, %o7
	prefetch	[%l7 + %o7],	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l3
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f4
	set	0x50, %i6
	stwa	%o2,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x2E, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i7
	nop
	set	0x10, %l0
	swap	[%l7 + %l0],	%g2
	nop
	set	0x30, %i7
	std	%g6,	[%l7 + %i7]
	nop
	set	0x0C, %g7
	lduw	[%l7 + %g7],	%o0
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x1B, %l1
	ldsb	[%l7 + %l1],	%i1
	bleu,a	%xcc,	loop_130
	nop
	set	0x48, %o6
	lduw	[%l7 + %o6],	%g5
	nop
	set	0x32, %g3
	lduh	[%l7 + %g3],	%g4
	set	0x1E, %g6
	stha	%i0,	[%l7 + %g6] 0xeb
	membar	#Sync
loop_130:
	nop
	set	0x1B, %i1
	stba	%g6,	[%l7 + %i1] 0xea
	membar	#Sync
	and	%i3,	%o6,	%g1
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x81,	%o6
	nop
	set	0x27, %o1
	stb	%l2,	[%l7 + %o1]
	set	0x40, %o5
	stda	%l0,	[%l7 + %o5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x68],	%f3
	st	%f12,	[%l7 + 0x0C]
	set	0x4E, %l5
	stha	%o3,	[%l7 + %l5] 0x88
	nop
	set	0x6C, %i0
	prefetch	[%l7 + %i0],	 3
	fpadd32s	%f10,	%f1,	%f10
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f16
	nop
	set	0x61, %l3
	ldsb	[%l7 + %l3],	%i6
	wr	%i5,	%l6,	%sys_tick
	nop
	set	0x6C, %g1
	sth	%l4,	[%l7 + %g1]
	st	%f0,	[%l7 + 0x70]
	set	0x4C, %o4
	sta	%f9,	[%l7 + %o4] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%i4
	nop
	set	0x48, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%l1,	%o1,	%l5
	set	0x48, %l6
	stxa	%o4,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x18, %i2
	lda	[%l7 + %i2] 0x88,	%f8
	st	%f21,	[%l7 + 0x60]
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0
	nop
	set	0x38, %i4
	std	%i6,	[%l7 + %i4]
	nop
	set	0x58, %o0
	ldsh	[%l7 + %o0],	%g2
	set	0x43, %o3
	stba	%l3,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%o0
	nop
	set	0x7A, %g5
	lduh	[%l7 + %g5],	%i1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f16
	ld	[%l7 + 0x38],	%f11
	nop
	set	0x64, %o7
	prefetch	[%l7 + %o7],	 1
	wr	%g5,	%g7,	%sys_tick
	nop
	set	0x0E, %l2
	ldstub	[%l7 + %l2],	%i0
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f14
	set	0x28, %i7
	swapa	[%l7 + %i7] 0x89,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%g6
	set	0x62, %g7
	stba	%o6,	[%l7 + %g7] 0x88
	nop
	set	0x11, %l1
	ldsb	[%l7 + %l1],	%o7
	set	0x10, %o6
	stxa	%l2,	[%l7 + %o6] 0x89
	or	%g1,	%l0,	%i6
	nop
	set	0x48, %l0
	std	%o2,	[%l7 + %l0]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l4
	nop
	set	0x40, %g6
	lduw	[%l7 + %g6],	%i5
	bge	%xcc,	loop_131
	nop
	set	0x74, %i3
	swap	[%l7 + %i3],	%g3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i4
loop_131:
	nop
	set	0x38, %i1
	stx	%fsr,	[%l7 + %i1]
	bne	%xcc,	loop_132
	nop
	set	0x18, %o1
	swap	[%l7 + %o1],	%l1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc2
loop_132:
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%o1
	bgu,a,pt	%icc,	loop_133
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%l4
	or	%o4,	%o2,	%i7
	set	0x48, %i5
	stxa	%g2,	[%l7 + %i5] 0xe3
	membar	#Sync
loop_133:
	st	%f2,	[%l7 + 0x18]
	nop
	set	0x7D, %l3
	stb	%i2,	[%l7 + %l3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x1C, %g1
	swapa	[%l7 + %g1] 0x80,	%g5
	set	0x34, %o4
	stwa	%o0,	[%l7 + %o4] 0x88
	set	0x20, %l4
	stha	%i0,	[%l7 + %l4] 0x88
	set	0x44, %i2
	sta	%f27,	[%l7 + %i2] 0x89
	nop
	set	0x19, %o2
	ldub	[%l7 + %o2],	%g4
	set	0x2C, %i4
	sta	%f24,	[%l7 + %i4] 0x81
	nop
	set	0x4F, %l6
	ldub	[%l7 + %l6],	%i3
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x81,	%g6
	bl,a	%xcc,	loop_134
	nop
	set	0x54, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x25, %o3
	ldsb	[%l7 + %o3],	%o6
	fpadd16	%f2,	%f18,	%f10
loop_134:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%l2
	or	%o7,	%g1,	%i6
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x89,	%l0
	set	0x46, %o7
	stba	%l6,	[%l7 + %o7] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%i5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f0
	set	0x30, %i6
	sta	%f14,	[%l7 + %i6] 0x80
	and	%o3,	%g3,	%o5
	ld	[%l7 + 0x48],	%f19
	set	0x70, %i7
	stda	%i4,	[%l7 + %i7] 0x80
	set	0x20, %g4
	sta	%f3,	[%l7 + %g4] 0x89
	nop
	set	0x27, %l1
	ldstub	[%l7 + %l1],	%o1
	bg	%icc,	loop_135
	nop
	set	0x3C, %g7
	lduw	[%l7 + %g7],	%l5
	add	%l1,	%o2,	%o4
	nop
	set	0x68, %l0
	ldsw	[%l7 + %l0],	%i7
loop_135:
	nop
	set	0x30, %o6
	stda	%g2,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xB3890CE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xC7EEEA67,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f26,	%f19
	nop
	set	0x73, %g6
	ldub	[%l7 + %g6],	%i2
	bgu	%xcc,	loop_136
	nop
	set	0x73, %g3
	ldstub	[%l7 + %g3],	%l3
	ld	[%l7 + 0x0C],	%f14
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f0
loop_136:
	add	%i1,	%o0,	%i0
	set	0x68, %i3
	swapa	[%l7 + %i3] 0x89,	%g5
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%f26
	and	%g4,	%g6,	%o6
	set	0x4C, %o5
	swapa	[%l7 + %o5] 0x88,	%i3
	nop
	set	0x60, %l5
	prefetch	[%l7 + %l5],	 2
	add	%l2,	%o7,	%g1
	set	0x14, %i5
	stwa	%g7,	[%l7 + %i5] 0x88
	nop
	set	0x5B, %i0
	ldub	[%l7 + %i0],	%i6
	nop
	set	0x39, %g1
	stb	%l0,	[%l7 + %g1]
	set	0x3C, %l3
	swapa	[%l7 + %l3] 0x88,	%l6
	nop
	set	0x30, %l4
	lduw	[%l7 + %l4],	%l4
	fpsub16s	%f21,	%f5,	%f22
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x62, %o4
	ldsh	[%l7 + %o4],	%o3
	or	%g3,	%o5,	%i4
	nop
	set	0x36, %o2
	lduh	[%l7 + %o2],	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%l1
	nop
	set	0x68, %i2
	stx	%l5,	[%l7 + %i2]
	ld	[%l7 + 0x0C],	%f24
	nop
	set	0x5A, %i4
	ldub	[%l7 + %i4],	%o2
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%o4
	nop
	set	0x30, %l6
	ldstub	[%l7 + %l6],	%i7
	nop
	set	0x58, %g2
	lduw	[%l7 + %g2],	%g2
	nop
	set	0x20, %o3
	ldub	[%l7 + %o3],	%i2
	nop
	set	0x4C, %o7
	lduh	[%l7 + %o7],	%l3
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f0
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x89,	%o0
	nop
	set	0x6D, %i7
	ldstub	[%l7 + %i7],	%i1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%g4
	nop
	set	0x2D, %g4
	ldstub	[%l7 + %g4],	%g6
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%o6
	nop
	set	0x68, %g5
	ldub	[%l7 + %g5],	%i3
	ld	[%l7 + 0x3C],	%f22
	add	%g5,	%o7,	%l2
	nop
	set	0x30, %g7
	std	%f6,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x2C]
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x89,	%g1
	add	%i6,	%l0,	%g7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f0
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x10, %g3
	lduh	[%l7 + %g3],	%l4
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4C9, 	%tick_cmpr
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	or	%o1,	%i5,	%i4
	nop
	set	0x25, %o1
	ldstub	[%l7 + %o1],	%l1
	nop
	set	0x3C, %l5
	prefetch	[%l7 + %l5],	 2
	wr	%o2,	%o4,	%sys_tick
	nop
	set	0x4E, %i5
	lduh	[%l7 + %i5],	%i7
	set	0x70, %i0
	stwa	%l5,	[%l7 + %i0] 0x80
	nop
	set	0x50, %g1
	std	%i2,	[%l7 + %g1]
	nop
	set	0x48, %o5
	stx	%l3,	[%l7 + %o5]
	and	%o0,	%i1,	%i0
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd2
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%g2
	and	%g6,	%g4,	%o6
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x88,	%g5
	nop
	set	0x48, %i2
	sth	%i3,	[%l7 + %i2]
	and	%l2,	%o7,	%g1
	set	0x78, %i4
	stha	%l0,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x4C, %o0
	ldsw	[%l7 + %o0],	%i6
	st	%f0,	[%l7 + 0x28]
	and	%l4,	%l6,	%g7
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x58, %g2
	stxa	%o5,	[%l7 + %g2] 0x81
	set	0x3A, %o2
	stha	%g3,	[%l7 + %o2] 0x89
	fpsub16	%f14,	%f4,	%f30
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%i5
	st	%f30,	[%l7 + 0x64]
	ld	[%l7 + 0x1C],	%f18
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	and	%o2,	%o4,	%o1
	set	0x32, %o3
	stha	%l5,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x70, %o7
	sta	%f1,	[%l7 + %o7] 0x81
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%i6
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x88,	%l2
	set	0x78, %i7
	stda	%i2,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%o0
	add	%g2,	%i0,	%g4
	nop
	set	0x08, %g4
	stx	%g6,	[%l7 + %g4]
	st	%f7,	[%l7 + 0x54]
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xeb,	%g4
	nop
	set	0x77, %g7
	ldub	[%l7 + %g7],	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%i3
	set	0x49, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g1
	set	0x28, %g5
	stda	%l0,	[%l7 + %g5] 0x81
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%l4
	or	%o7,	%l6,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%o3
	set	0x48, %g6
	swapa	[%l7 + %g6] 0x88,	%g3
	st	%f24,	[%l7 + 0x5C]
	set	0x10, %g3
	lda	[%l7 + %g3] 0x81,	%f12
	nop
	set	0x52, %l0
	ldsh	[%l7 + %l0],	%i5
	set	0x50, %i1
	stxa	%i4,	[%l7 + %i1] 0xe2
	membar	#Sync
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l1
	nop
	set	0x78, %o1
	stx	%o1,	[%l7 + %o1]
	and	%l5,	%o4,	%l3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%i2
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x33, %i5
	ldub	[%l7 + %i5],	%i7
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x7D, %g1
	ldsb	[%l7 + %g1],	%o0
	nop
	set	0x24, %l4
	sth	%g2,	[%l7 + %l4]
	set	0x44, %o4
	sta	%f3,	[%l7 + %o4] 0x89
	nop
	set	0x53, %l3
	ldub	[%l7 + %l3],	%g4
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x40, %i2
	stxa	%i0,	[%l7 + %i2] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%g5
	nop
	set	0x78, %o0
	std	%l2,	[%l7 + %o0]
	ble	%icc,	loop_137
	nop
	set	0x36, %i4
	ldstub	[%l7 + %i4],	%o6
	nop
	set	0x0F, %l6
	ldub	[%l7 + %l6],	%i3
	nop
	set	0x42, %o2
	ldsh	[%l7 + %o2],	%l0
loop_137:
	or	%i6,	%g1,	%l4
	nop
	set	0x48, %g2
	ldsw	[%l7 + %g2],	%o7
	nop
	set	0x68, %o7
	stb	%o5,	[%l7 + %o7]
	nop
	set	0x30, %l2
	ldsw	[%l7 + %l2],	%l6
	nop
	set	0x36, %o3
	lduh	[%l7 + %o3],	%o3
	set	0x18, %i6
	stxa	%g7,	[%l7 + %i6] 0xe3
	membar	#Sync
	or	%i5,	%i4,	%g3
	add	%o2,	%l1,	%o1
	set	0x13, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o4
	fpsub32	%f2,	%f26,	%f6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%i2
	set	0x5C, %g4
	stwa	%i7,	[%l7 + %g4] 0x80
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	nop
	set	0x22, %l1
	lduh	[%l7 + %l1],	%l5
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o0
	and	%g2,	%g4,	%i0
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%i0
	nop
	set	0x36, %g3
	ldsb	[%l7 + %g3],	%g5
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x7B, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g6
	add	%o6,	%l2,	%l0
	nop
	set	0x30, %i1
	stx	%i6,	[%l7 + %i1]
	nop
	nop
	setx	0xAAA91F70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xF79869AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f11,	%f6
	nop
	set	0x1C, %i3
	stw	%g1,	[%l7 + %i3]
	set	0x20, %l5
	stxa	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%i2
	ld	[%l7 + 0x5C],	%f23
	nop
	set	0x2C, %i5
	lduw	[%l7 + %i5],	%o5
	set	0x28, %i0
	stda	%o6,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x14, %g1
	swapa	[%l7 + %g1] 0x89,	%l6
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i5
	st	%f18,	[%l7 + 0x58]
	set	0x70, %l3
	sta	%f12,	[%l7 + %l3] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%g7
	st	%f12,	[%l7 + 0x4C]
	set	0x08, %o5
	lda	[%l7 + %o5] 0x89,	%f11
	set	0x56, %l4
	stha	%o2,	[%l7 + %l4] 0x89
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%g3
	set	0x57, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l1
	set	0x48, %l6
	stwa	%o4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x80
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x48, %o7
	swap	[%l7 + %o7],	%l3
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x88,	%i2
	nop
	set	0x4E, %o3
	sth	%i7,	[%l7 + %o3]
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x30, %i7
	ldsw	[%l7 + %i7],	%o1
	bne,a	%icc,	loop_138
	nop
	set	0x58, %g2
	ldsw	[%l7 + %g2],	%o0
	nop
	set	0x70, %g7
	std	%g2,	[%l7 + %g7]
	nop
	set	0x44, %l1
	swap	[%l7 + %l1],	%g4
loop_138:
	nop
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x81,	%l4
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x64, %g3
	stw	%i1,	[%l7 + %g3]
	set	0x38, %o6
	stda	%g4,	[%l7 + %o6] 0x89
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x80,	%i0
	ld	[%l7 + 0x44],	%f19
	nop
	set	0x70, %i1
	stb	%g6,	[%l7 + %i1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%l2
	nop
	set	0x54, %i3
	stw	%l0,	[%l7 + %i3]
	nop
	set	0x1B, %o1
	ldstub	[%l7 + %o1],	%g1
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x56, %i0
	ldub	[%l7 + %i0],	%i3
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe3,	%o4
	ld	[%l7 + 0x40],	%f3
	set	0x60, %i5
	stda	%l4,	[%l7 + %i5] 0x89
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x88,	%o7
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	set	0x58, %o4
	stx	%l6,	[%l7 + %o4]
	set	0x70, %l4
	stda	%i4,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x30, %i2
	ldsb	[%l7 + %i2],	%i4
	nop
	set	0x50, %l6
	std	%o2,	[%l7 + %l6]
	st	%f22,	[%l7 + 0x40]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xda
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf0
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%l1
	set	0x4C, %i4
	stwa	%g7,	[%l7 + %i4] 0x81
	nop
	set	0x62, %l2
	ldsh	[%l7 + %l2],	%o4
	and	%l3,	%i7,	%o1
	wr	%o0,	%g2,	%set_softint
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x88,	%i2
	add	%g4,	%l5,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i0
	nop
	set	0x6A, %o3
	sth	%g6,	[%l7 + %o3]
	set	0x30, %i7
	lda	[%l7 + %i7] 0x88,	%f0
	or	%o6,	%l0,	%l2
	nop
	set	0x6A, %i6
	ldstub	[%l7 + %i6],	%g1
	nop
	set	0x40, %g7
	ldx	[%l7 + %g7],	%i3
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f26
	be	%xcc,	loop_139
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x46, %g4
	stha	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
loop_139:
	nop
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x88,	%l4
	set	0x10, %l1
	stxa	%o5,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x70, %g3
	stx	%o7,	[%l7 + %g3]
	st	%f13,	[%l7 + 0x40]
	fpadd32	%f12,	%f30,	%f4
	add	%l6,	%i5,	%o3
	nop
	set	0x7C, %l0
	lduw	[%l7 + %l0],	%i4
	st	%f16,	[%l7 + 0x08]
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%g2
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x40, %o1
	stda	%l0,	[%l7 + %o1] 0x80
	set	0x10, %i3
	swapa	[%l7 + %i3] 0x81,	%o4
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xeb,	%l2
	bge,a,pn	%icc,	loop_140
	nop
	set	0x76, %l5
	sth	%g7,	[%l7 + %l5]
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x3C, %i5
	stha	%o1,	[%l7 + %i5] 0x88
loop_140:
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x08, %l3
	stda	%i6,	[%l7 + %l3] 0x81
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%o0
	set	0x72, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g2
	and	%i2,	%g4,	%l5
	add	%g5,	%i0,	%i1
	nop
	set	0x50, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x31, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o6
	and	%l0,	%g6,	%g1
	nop
	set	0x14, %o2
	swap	[%l7 + %o2],	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%l4
	nop
	set	0x2C, %o4
	ldstub	[%l7 + %o4],	%i6
	nop
	set	0x08, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x81
	add	%o7,	%o5,	%l6
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%i4
	bne,a,pn	%xcc,	loop_141
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x78, %i7
	stx	%o3,	[%l7 + %i7]
	ld	[%l7 + 0x5C],	%f17
loop_141:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%o2
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x81,	%l0
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%i4
	nop
	set	0x10, %g2
	ldstub	[%l7 + %g2],	%l3
	ld	[%l7 + 0x3C],	%f13
	nop
	set	0x60, %g5
	ldsb	[%l7 + %g5],	%g7
	nop
	set	0x26, %g4
	ldstub	[%l7 + %g4],	%o1
	nop
	set	0x30, %g7
	stx	%o4,	[%l7 + %g7]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f16
	set	0x15, %l1
	stba	%i7,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x994, 	%tick_cmpr
	nop
	set	0x60, %l0
	stx	%i2,	[%l7 + %l0]
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f22
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%l5
	nop
	set	0x30, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x7C, %o1
	stha	%i0,	[%l7 + %o1] 0x80
	or	%g5,	%o6,	%l0
	nop
	set	0x44, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x28, %i3
	std	%g6,	[%l7 + %i3]
	nop
	set	0x74, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x7C, %g1
	stha	%g1,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x2C, %i5
	swap	[%l7 + %i5],	%i1
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	set	0x34, %l5
	stha	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x1E, %l4
	lduh	[%l7 + %l4],	%l2
	nop
	set	0x4C, %i2
	ldsw	[%l7 + %i2],	%o7
	set	0x62, %l3
	stha	%o5,	[%l7 + %l3] 0x81
	nop
	set	0x08, %o0
	std	%f8,	[%l7 + %o0]
	nop
	set	0x1A, %l6
	sth	%l6,	[%l7 + %l6]
	set	0x40, %o2
	stxa	%i5,	[%l7 + %o2] 0x89
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	set	0x2C, %l2
	sta	%f29,	[%l7 + %l2] 0x80
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x81,	%i6
	nop
	set	0x50, %o7
	lduh	[%l7 + %o7],	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%o2
	nop
	set	0x34, %i7
	ldsb	[%l7 + %i7],	%i4
	bgu,pn	%xcc,	loop_142
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %g2
	sta	%f11,	[%l7 + %g2] 0x89
loop_142:
	nop
	set	0x3C, %i6
	lda	[%l7 + %i6] 0x80,	%f11
	set	0x44, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l3
	set	0x4E, %g5
	stha	%g7,	[%l7 + %g5] 0x80
	nop
	set	0x36, %g7
	ldstub	[%l7 + %g7],	%o1
	nop
	set	0x70, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x08, %g6
	std	%f10,	[%l7 + %g6]
	nop
	set	0x44, %g3
	ldub	[%l7 + %g3],	%i7
	nop
	set	0x3C, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x40, %i1
	ldub	[%l7 + %i1],	%o0
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%f10
	set	0x0C, %i3
	lda	[%l7 + %i3] 0x81,	%f9
	nop
	set	0x68, %i0
	stx	%o4,	[%l7 + %i0]
	nop
	set	0x6E, %o1
	stb	%g2,	[%l7 + %o1]
	set	0x3E, %g1
	stba	%g4,	[%l7 + %g1] 0x89
	set	0x12, %i5
	stba	%i2,	[%l7 + %i5] 0x88
	set	0x0C, %l5
	swapa	[%l7 + %l5] 0x89,	%i0
	wr	%g5,	%o6,	%y
	and	%l5,	%g6,	%g1
	nop
	set	0x6C, %o5
	ldsh	[%l7 + %o5],	%l0
	or	%i3,	%l4,	%l2
	set	0x5E, %i2
	stha	%i1,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x48, %l3
	sta	%f18,	[%l7 + %l3] 0x88
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%o6
	nop
	set	0x20, %o0
	stx	%l6,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	nop
	set	0x20, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f26
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%o5
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%i5
	nop
	set	0x73, %o7
	ldub	[%l7 + %o7],	%o3
	fpadd32s	%f24,	%f20,	%f12
	or	%i6,	%o2,	%i4
	nop
	set	0x70, %o3
	stw	%l3,	[%l7 + %o3]
	or	%g3,	%g7,	%l1
	set	0x4C, %i7
	swapa	[%l7 + %i7] 0x89,	%i7
	and	%o0,	%o1,	%o4
	set	0x20, %i6
	swapa	[%l7 + %i6] 0x89,	%g2
	nop
	set	0x7C, %g4
	swap	[%l7 + %g4],	%i2
	set	0x0E, %g5
	ldstuba	[%l7 + %g5] 0x80,	%g4
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%i0
	add	%g5,	%o6,	%l5
	nop
	set	0x34, %l1
	ldsh	[%l7 + %l1],	%g1
	ld	[%l7 + 0x5C],	%f5
	nop
	set	0x68, %g6
	sth	%g6,	[%l7 + %g6]
	ld	[%l7 + 0x74],	%f29
	nop
	set	0x70, %g3
	std	%i2,	[%l7 + %g3]
	nop
	set	0x58, %l0
	std	%f30,	[%l7 + %l0]
	nop
	set	0x48, %g7
	stw	%l0,	[%l7 + %g7]
	nop
	set	0x48, %i1
	stx	%l2,	[%l7 + %i1]
	nop
	set	0x78, %i3
	swap	[%l7 + %i3],	%l4
	st	%f13,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f20
	nop
	set	0x4D, %o1
	ldub	[%l7 + %o1],	%o7
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%f26
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i1
	nop
	set	0x38, %i5
	ldx	[%l7 + %i5],	%o5
	add	%o3,	%i6,	%i5
	nop
	set	0x7D, %l5
	ldub	[%l7 + %l5],	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%l1
	ld	[%l7 + 0x40],	%f23
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g6
	set	0x44, %i2
	stha	%i7,	[%l7 + %i2] 0x81
	nop
	set	0x7C, %o5
	prefetch	[%l7 + %o5],	 0
	ld	[%l7 + 0x3C],	%f11
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x1C, %l3
	lduw	[%l7 + %l3],	%o1
	nop
	set	0x68, %o0
	stx	%o4,	[%l7 + %o0]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x89
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xea,	%g2
	and	%i2,	%g4,	%o0
	set	0x40, %l2
	stwa	%i0,	[%l7 + %l2] 0xe2
	membar	#Sync
	wr	%g5,	%l5,	%ccr
	ld	[%l7 + 0x60],	%f0
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%g1
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%i3
	nop
	set	0x20, %i4
	std	%f0,	[%l7 + %i4]
	set	0x53, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l2
	set	0x72, %i7
	stha	%l4,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x12, %i6
	lduh	[%l7 + %i6],	%o7
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x0F, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l6
	nop
	set	0x34, %g5
	stw	%i1,	[%l7 + %g5]
	nop
	set	0x2A, %g6
	ldsh	[%l7 + %g6],	%o5
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x48, %l0
	stw	%l0,	[%l7 + %l0]
	nop
	set	0x60, %l1
	lduw	[%l7 + %l1],	%i6
	st	%f0,	[%l7 + 0x1C]
	or	%i5,	%o3,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%o2
	nop
	set	0x40, %i1
	std	%f26,	[%l7 + %i1]
	st	%f29,	[%l7 + 0x68]
	set	0x29, %g7
	stba	%l1,	[%l7 + %g7] 0x80
	set	0x10, %i0
	sta	%f4,	[%l7 + %i0] 0x89
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%g3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%i6
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x80
	nop
	set	0x7C, %l5
	ldsb	[%l7 + %l5],	%o1
	and	%o4,	%g7,	%g2
	st	%f14,	[%l7 + 0x34]
	and	%i2,	%g4,	%o0
	add	%i0,	%l5,	%g5
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f0
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xd2
	or	%o6,	%g1,	%g6
	nop
	set	0x68, %g1
	stw	%l2,	[%l7 + %g1]
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%l6
	nop
	set	0x20, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x78, %l6
	ldsb	[%l7 + %l6],	%l4
	set	0x60, %o2
	stxa	%i1,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x58, %l2
	stwa	%o5,	[%l7 + %l2] 0xea
	membar	#Sync
	or	%l0,	%i6,	%o3
	set	0x60, %o4
	stda	%l2,	[%l7 + %o4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x68, %l4
	std	%f24,	[%l7 + %l4]
	nop
	set	0x10, %i4
	std	%f20,	[%l7 + %i4]
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%i4
	nop
	set	0x56, %o3
	lduh	[%l7 + %o3],	%i5
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%f24
	nop
	set	0x68, %i6
	stx	%o2,	[%l7 + %i6]
	nop
	set	0x7C, %g4
	swap	[%l7 + %g4],	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%o4
	nop
	set	0x70, %g6
	stw	%g7,	[%l7 + %g6]
	nop
	set	0x5C, %g3
	stw	%i7,	[%l7 + %g3]
	set	0x38, %g2
	stwa	%g2,	[%l7 + %g2] 0x89
	or	%g4,	%i2,	%i0
	wr	%l5,	%g5,	%clear_softint
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f22
	or	%o0,	%o6,	%g1
	nop
	set	0x58, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x7C, %g7
	stha	%l2,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x10, %l1
	lduw	[%l7 + %l1],	%g6
	set	0x77, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o7
	set	0x08, %o1
	stwa	%l6,	[%l7 + %o1] 0x80
	nop
	nop
	setx	0x75D8C1B076E28642,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA0B5FFF2488E9F56,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f8
	set	0x6C, %i3
	swapa	[%l7 + %i3] 0x88,	%l4
	nop
	set	0x17, %i5
	stb	%i3,	[%l7 + %i5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%i1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	set	0x20, %l5
	stda	%l0,	[%l7 + %l5] 0x89
	nop
	set	0x5C, %o5
	lduh	[%l7 + %o5],	%o3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f0
	nop
	set	0x51, %l3
	ldub	[%l7 + %l3],	%l3
	nop
	set	0x12, %i2
	stb	%i6,	[%l7 + %i2]
	nop
	set	0x6C, %l6
	ldub	[%l7 + %l6],	%i4
	nop
	set	0x2C, %o2
	stw	%o2,	[%l7 + %o2]
	nop
	set	0x27, %o0
	ldsb	[%l7 + %o0],	%g3
	or	%i5,	%o1,	%o4
	nop
	set	0x31, %l2
	stb	%g7,	[%l7 + %l2]
	ld	[%l7 + 0x1C],	%f17
	set	0x18, %l4
	stda	%i6,	[%l7 + %l4] 0x80
	set	0x48, %i4
	stxa	%g2,	[%l7 + %i4] 0x81
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%l0
	set	0x40, %o4
	stxa	%i2,	[%l7 + %o4] 0xe3
	membar	#Sync
	ld	[%l7 + 0x2C],	%f22
	or	%g4,	%l5,	%i0
	nop
	set	0x1F, %o3
	ldub	[%l7 + %o3],	%g5
	nop
	set	0x78, %i7
	ldstub	[%l7 + %i7],	%o6
	nop
	set	0x34, %i6
	ldstub	[%l7 + %i6],	%o0
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x88,	%l2
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x81,	%g6
	set	0x24, %g6
	swapa	[%l7 + %g6] 0x89,	%g1
	set	0x40, %g3
	stba	%o7,	[%l7 + %g3] 0x88
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe3,	%l4
	nop
	set	0x18, %i1
	std	%f6,	[%l7 + %i1]
	set	0x10, %g7
	stda	%i6,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x38, %l0
	ldub	[%l7 + %l0],	%i3
	set	0x10, %i0
	stda	%o4,	[%l7 + %i0] 0x88
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%l0
	ld	[%l7 + 0x34],	%f6
	nop
	set	0x6C, %i3
	lduh	[%l7 + %i3],	%o3
	nop
	set	0x38, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x10, %o6
	std	%f18,	[%l7 + %o6]
	bleu	%icc,	loop_143
	nop
	set	0x54, %o5
	swap	[%l7 + %o5],	%l3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%i6
loop_143:
	nop
	set	0x78, %l3
	stx	%i4,	[%l7 + %l3]
	and	%i1,	%o2,	%g3
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xda
	nop
	set	0x7A, %l6
	sth	%o1,	[%l7 + %l6]
	nop
	set	0x44, %o2
	lduh	[%l7 + %o2],	%i5
	st	%f7,	[%l7 + 0x1C]
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%o4
	nop
	set	0x28, %o0
	stx	%g7,	[%l7 + %o0]
	and	%g2,	%l1,	%i2
	set	0x45, %l4
	stba	%i7,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x4A, %l2
	stha	%g4,	[%l7 + %l2] 0x81
	set	0x40, %o7
	stxa	%i0,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x10, %o4
	ldsh	[%l7 + %o4],	%g5
	nop
	set	0x6A, %i4
	ldub	[%l7 + %i4],	%o6
	nop
	set	0x41, %o3
	ldsb	[%l7 + %o3],	%l5
	nop
	set	0x38, %i6
	stw	%l2,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x5C, %g4
	ldsh	[%l7 + %g4],	%o0
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%g1
	nop
	nop
	setx	0x64FC522BA04888F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xCB6F31DC294EF6B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f22
	nop
	set	0x22, %g5
	sth	%g6,	[%l7 + %g5]
	nop
	set	0x74, %g6
	stw	%o7,	[%l7 + %g6]
	set	0x7A, %g3
	stba	%l4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%i3
	nop
	set	0x2E, %i1
	lduh	[%l7 + %i1],	%l6
	set	0x70, %l0
	stda	%o4,	[%l7 + %l0] 0x81
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x2A, %g7
	ldsb	[%l7 + %g7],	%o3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%l3
	set	0x28, %l1
	ldxa	[%l7 + %l1] 0x89,	%i6
	add	%i4,	%o2,	%g3
	set	0x3C, %o1
	stba	%o1,	[%l7 + %o1] 0x89
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x89,	%i1
	nop
	set	0x2C, %o6
	ldsh	[%l7 + %o6],	%i5
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd8
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f2
	set	0x58, %g1
	stda	%g6,	[%l7 + %g1] 0x89
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe2,	%l0
	nop
	set	0x44, %l6
	ldsh	[%l7 + %l6],	%i2
	set	0x20, %o2
	stxa	%o4,	[%l7 + %o2] 0x89
	and	%i7,	%g4,	%g5
	nop
	set	0x08, %o0
	ldsh	[%l7 + %o0],	%o6
	nop
	set	0x50, %i2
	stx	%i0,	[%l7 + %i2]
	set	0x30, %l2
	ldxa	[%l7 + %l2] 0x89,	%l5
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%l2
	nop
	set	0x24, %l4
	ldsw	[%l7 + %l4],	%g1
	nop
	set	0x1E, %o4
	sth	%g6,	[%l7 + %o4]
	nop
	set	0x48, %i4
	ldsb	[%l7 + %i4],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o7
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f10
	set	0x63, %g4
	stba	%l6,	[%l7 + %g4] 0x81
	wr	%i3,	%o5,	%pic
	nop
	set	0x40, %i7
	sth	%l0,	[%l7 + %i7]
	bgu,pn	%icc,	loop_144
	add	%o3,	%i6,	%l3
	st	%f6,	[%l7 + 0x0C]
	st	%f5,	[%l7 + 0x70]
loop_144:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x20, %o3
	std	%f10,	[%l7 + %o3]
	set	0x28, %g3
	stda	%i4,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x80
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x58, %g2
	stda	%o2,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x81,	%f3
	st	%f5,	[%l7 + 0x5C]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%i1
	and	%o1,	%i5,	%g7
	and	%g2,	%l1,	%o4
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x89,	%i7
	ld	[%l7 + 0x28],	%f4
	nop
	set	0x20, %g7
	swap	[%l7 + %g7],	%g4
	add	%g5,	%o6,	%i2
	set	0x54, %l1
	sta	%f8,	[%l7 + %l1] 0x89
	nop
	set	0x76, %o1
	ldsb	[%l7 + %o1],	%l5
	nop
	set	0x60, %i5
	std	%f30,	[%l7 + %i5]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%g1
	set	0x30, %i3
	lda	[%l7 + %i3] 0x81,	%f12
	set	0x58, %o5
	stha	%g6,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x50, %g1
	swapa	[%l7 + %g1] 0x80,	%o0
	nop
	set	0x70, %l3
	ldub	[%l7 + %l3],	%l4
	set	0x1D, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o7
	set	0x34, %l5
	swapa	[%l7 + %l5] 0x81,	%l6
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x88,	%l2
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x89,	%i3
	nop
	set	0x1D, %l6
	ldstub	[%l7 + %l6],	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%i6
	nop
	set	0x2F, %l2
	stb	%l3,	[%l7 + %l2]
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x89,	%o2
	nop
	set	0x4D, %o7
	ldub	[%l7 + %o7],	%o2
	nop
	set	0x7F, %o4
	stb	%g3,	[%l7 + %o4]
	nop
	set	0x68, %i4
	sth	%i1,	[%l7 + %i4]
	wr	%o1,	%i4,	%softint
	nop
	set	0x40, %i6
	std	%i4,	[%l7 + %i6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x45, %l4
	stba	%g7,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x1E, %g4
	ldsh	[%l7 + %g4],	%i7
	nop
	set	0x66, %i7
	ldsb	[%l7 + %i7],	%o4
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f16
	set	0x29, %g5
	stba	%g5,	[%l7 + %g5] 0x88
	set	0x54, %g6
	stba	%g4,	[%l7 + %g6] 0x89
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x81,	%o6
	set	0x6C, %i1
	swapa	[%l7 + %i1] 0x80,	%l5
	wr	%i2,	%i0,	%sys_tick
	nop
	set	0x50, %l0
	ldstub	[%l7 + %l0],	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%l4
	nop
	set	0x08, %g7
	std	%o0,	[%l7 + %g7]
	nop
	set	0x64, %i0
	lduh	[%l7 + %i0],	%l6
	nop
	set	0x28, %o1
	std	%f30,	[%l7 + %o1]
	add	%l2,	%i3,	%o5
	nop
	set	0x5E, %i5
	lduh	[%l7 + %i5],	%o7
	fpsub16s	%f31,	%f17,	%f22
	nop
	set	0x4B, %i3
	ldub	[%l7 + %i3],	%l0
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%l3
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%o3
	nop
	set	0x44, %o6
	lduw	[%l7 + %o6],	%i6
	bge	%xcc,	loop_145
	add	%g3,	%i1,	%o2
	nop
	set	0x22, %o5
	ldsh	[%l7 + %o5],	%o1
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%i5
loop_145:
	nop
	set	0x1C, %o0
	ldsh	[%l7 + %o0],	%i4
	set	0x2C, %l6
	lda	[%l7 + %l6] 0x88,	%f10
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f0
	nop
	set	0x24, %l5
	stw	%g2,	[%l7 + %l5]
	nop
	set	0x20, %i2
	std	%l0,	[%l7 + %i2]
	set	0x48, %o4
	stda	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x18, %i4
	stha	%i7,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x2F, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o4
	nop
	nop
	setx	0x51A679FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC69FCB5B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f9,	%f4
	st	%f1,	[%l7 + 0x40]
	fpsub16s	%f9,	%f31,	%f4
	wr	%g4,	%o6,	%y
	nop
	set	0x50, %l4
	std	%f26,	[%l7 + %l4]
	nop
	set	0x58, %g4
	stw	%g5,	[%l7 + %g4]
	nop
	set	0x51, %i7
	ldub	[%l7 + %i7],	%i2
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%i0
	nop
	set	0x74, %o3
	stb	%l5,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x44, %g6
	prefetch	[%l7 + %g6],	 1
	wr	%g6,	%g1,	%softint
	wr	%o0,	%l4,	%y
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%l6
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x88,	%l2
	nop
	set	0x74, %i1
	sth	%o5,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	wr	%i3,	%o7,	%softint
	set	0x20, %g7
	lda	[%l7 + %g7] 0x89,	%f2
	nop
	set	0x48, %g2
	std	%l2,	[%l7 + %g2]
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%l0
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%o2
	set	0x1B, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i6
	wr	%i1,	%g3,	%set_softint
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g2
	nop
	set	0x58, %l1
	stx	%i4,	[%l7 + %l1]
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%l0
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x89,	%i7
	nop
	set	0x1C, %o6
	swap	[%l7 + %o6],	%o4
	nop
	set	0x64, %l3
	stw	%g7,	[%l7 + %l3]
	set	0x58, %o2
	stwa	%o6,	[%l7 + %o2] 0x81
	nop
	set	0x2D, %o5
	stb	%g4,	[%l7 + %o5]
	nop
	set	0x4C, %o0
	ldstub	[%l7 + %o0],	%i2
	nop
	set	0x30, %l6
	ldx	[%l7 + %l6],	%i0
	add	%g5,	%l5,	%g1
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f16
	set	0x18, %i2
	swapa	[%l7 + %i2] 0x89,	%o0
	st	%fsr,	[%l7 + 0x38]
	set	0x18, %o4
	sta	%f20,	[%l7 + %o4] 0x80
	set	0x20, %i4
	stxa	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x08, %l2
	std	%f4,	[%l7 + %l2]
	st	%f20,	[%l7 + 0x7C]
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x88,	%l4
	nop
	set	0x36, %i6
	stb	%l2,	[%l7 + %i6]
	nop
	set	0x08, %i7
	std	%f12,	[%l7 + %i7]
	set	0x48, %o7
	swapa	[%l7 + %o7] 0x81,	%l6
	st	%fsr,	[%l7 + 0x14]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%o7
	bne,a	%icc,	loop_146
	add	%l3,	%o5,	%l0
	nop
	set	0x56, %o3
	ldsh	[%l7 + %o3],	%o3
	nop
	set	0x10, %g4
	prefetch	[%l7 + %g4],	 3
loop_146:
	nop
	set	0x30, %g6
	sth	%i6,	[%l7 + %g6]
	nop
	set	0x5C, %g5
	lduh	[%l7 + %g5],	%i1
	nop
	set	0x28, %i1
	std	%f24,	[%l7 + %i1]
	set	0x68, %g3
	stha	%o1,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x1C, %l0
	stwa	%g3,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x3A, %g7
	sth	%o2,	[%l7 + %g7]
	set	0x22, %g2
	stba	%g2,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x6C, %i5
	lduh	[%l7 + %i5],	%i4
	nop
	set	0x50, %i0
	std	%i4,	[%l7 + %i0]
	nop
	set	0x22, %i3
	ldub	[%l7 + %i3],	%i7
	set	0x48, %g1
	stba	%l1,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%g7
	set	0x09, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o4
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x88,	%g4
	nop
	set	0x3E, %o6
	sth	%o6,	[%l7 + %o6]
	set	0x44, %o5
	stba	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x40, %o0
	lda	[%l7 + %o0] 0x89,	%f6
	ld	[%l7 + 0x18],	%f4
	nop
	set	0x52, %l6
	lduh	[%l7 + %l6],	%i0
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%l4
	set	0x30, %i2
	stda	%g4,	[%l7 + %i2] 0x80
	set	0x78, %l5
	stwa	%g1,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x78, %o4
	sta	%f1,	[%l7 + %o4] 0x88
	nop
	set	0x0B, %i4
	ldub	[%l7 + %i4],	%g6
	nop
	set	0x70, %l2
	stx	%l4,	[%l7 + %l2]
	set	0x50, %i6
	stda	%l2,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x4E, %i7
	ldstub	[%l7 + %i7],	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o7
	nop
	set	0x4A, %o7
	sth	%i3,	[%l7 + %o7]
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x88,	 4
	bgu	%icc,	loop_147
	add	%l3,	%o3,	%i6
	nop
	set	0x58, %g4
	sth	%l0,	[%l7 + %g4]
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f28
loop_147:
	wr	%i1,	%g3,	%clear_softint
	nop
	set	0x18, %o3
	stw	%o1,	[%l7 + %o3]
	set	0x2C, %g5
	stwa	%o2,	[%l7 + %g5] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x60]
	set	0x58, %i1
	sta	%f31,	[%l7 + %i1] 0x80
	set	0x28, %l0
	stha	%i4,	[%l7 + %l0] 0x81
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f24
	nop
	set	0x28, %g7
	ldsw	[%l7 + %g7],	%g2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x81
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f2
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x70, %g2
	ldub	[%l7 + %g2],	%l1
	ld	[%l7 + 0x4C],	%f19
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%i5
	add	%g7,	%g4,	%o6
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x89,	 3
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%i0
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%l5
	set	0x24, %l3
	ldstuba	[%l7 + %l3] 0x88,	%g5
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%o4
	nop
	set	0x0A, %l6
	ldstub	[%l7 + %l6],	%g6
	nop
	set	0x08, %o2
	std	%f6,	[%l7 + %o2]
	nop
	set	0x70, %o0
	std	%g0,	[%l7 + %o0]
	set	0x10, %i2
	sta	%f15,	[%l7 + %i2] 0x89
	nop
	set	0x53, %l5
	ldstub	[%l7 + %l5],	%l2
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x81,	%o0
	nop
	set	0x0F, %i4
	ldub	[%l7 + %i4],	%l6
	nop
	set	0x66, %l2
	ldsh	[%l7 + %l2],	%o7
	bl,a,pt	%icc,	loop_148
	nop
	set	0x4B, %i6
	stb	%l4,	[%l7 + %i6]
	set	0x20, %i7
	stda	%o4,	[%l7 + %i7] 0xe3
	membar	#Sync
loop_148:
	nop
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%i3
	nop
	set	0x28, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o1
	set	0x20, %g6
	lda	[%l7 + %g6] 0x81,	%f21
	nop
	set	0x40, %o3
	stb	%o2,	[%l7 + %o3]
	and	%g3,	%g2,	%i4
	nop
	set	0x16, %i1
	ldsb	[%l7 + %i1],	%l1
	nop
	set	0x18, %l0
	prefetch	[%l7 + %l0],	 3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%g7
	wr	%i5,	%o6,	%clear_softint
	nop
	set	0x28, %g5
	stx	%g4,	[%l7 + %g5]
	wr	%i2,	%l5,	%softint
	set	0x61, %g3
	stba	%i0,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x77, %g7
	stba	%o4,	[%l7 + %g7] 0x81
	fpadd32s	%f27,	%f26,	%f18
	nop
	nop
	setx	0xAB1A1B710D8D2407,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0BEADFD95D0714A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f24,	%f20
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%g6
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x54, %g2
	ldsh	[%l7 + %g2],	%g1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f16
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x81,	%l2
	nop
	set	0x5A, %l1
	stb	%g5,	[%l7 + %l1]
	nop
	set	0x14, %o6
	swap	[%l7 + %o6],	%l6
	nop
	set	0x30, %g1
	ldub	[%l7 + %g1],	%o7
	nop
	set	0x4A, %o5
	ldub	[%l7 + %o5],	%o0
	set	0x28, %l3
	lda	[%l7 + %l3] 0x88,	%f29
	set	0x24, %l6
	sta	%f25,	[%l7 + %l6] 0x89
	ld	[%l7 + 0x18],	%f27
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x60, %i2
	prefetch	[%l7 + %i2],	 0
	set	0x65, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o5
	nop
	set	0x34, %l5
	swap	[%l7 + %l5],	%i3
	nop
	set	0x76, %o4
	lduh	[%l7 + %o4],	%o3
	and	%l3,	%i6,	%i1
	ld	[%l7 + 0x7C],	%f11
	nop
	set	0x1D, %l2
	stb	%l0,	[%l7 + %l2]
	nop
	set	0x12, %i6
	sth	%o1,	[%l7 + %i6]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f16
	nop
	set	0x4E, %o7
	sth	%g3,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f0
	nop
	set	0x18, %i7
	ldstub	[%l7 + %i7],	%g2
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%o2
	or	%i4,	%i7,	%g7
	st	%f8,	[%l7 + 0x14]
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%i5
	set	0x30, %i1
	lda	[%l7 + %i1] 0x88,	%f19
	set	0x40, %o3
	stda	%l0,	[%l7 + %o3] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%g4
	nop
	set	0x58, %l0
	swap	[%l7 + %l0],	%i2
	nop
	set	0x38, %g3
	prefetch	[%l7 + %g3],	 2
	wr	%i0,	%o4,	%y
	nop
	set	0x38, %g5
	swap	[%l7 + %g5],	%g6
	nop
	set	0x08, %i0
	ldsw	[%l7 + %i0],	%g1
	nop
	set	0x5C, %g7
	stw	%l5,	[%l7 + %g7]
	nop
	set	0x60, %g2
	ldsw	[%l7 + %g2],	%l2
	set	0x48, %i5
	stda	%g4,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f26
	set	0x20, %i3
	swapa	[%l7 + %i3] 0x89,	%o7
	set	0x38, %l1
	stxa	%l6,	[%l7 + %l1] 0xeb
	membar	#Sync
	be	%xcc,	loop_149
	nop
	set	0x69, %o6
	ldub	[%l7 + %o6],	%l4
	nop
	set	0x38, %o5
	prefetch	[%l7 + %o5],	 4
	be	%xcc,	loop_150
loop_149:
	nop
	set	0x2C, %g1
	prefetch	[%l7 + %g1],	 3
	ld	[%l7 + 0x44],	%f1
	set	0x78, %l3
	sta	%f25,	[%l7 + %l3] 0x89
loop_150:
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f18
	set	0x28, %o2
	sta	%f1,	[%l7 + %o2] 0x80
	wr 	%g0, 	0x5, 	%fprs
	fpadd16	%f0,	%f22,	%f26
	set	0x72, %o0
	stba	%o3,	[%l7 + %o0] 0x80
	add	%l3,	%o5,	%i1
	or	%l0,	%i6,	%g3
	nop
	set	0x1D, %i2
	ldsb	[%l7 + %i2],	%g2
	set	0x08, %o4
	lda	[%l7 + %o4] 0x89,	%f13
	add	%o2,	%o1,	%i7
	nop
	set	0x10, %l2
	std	%g6,	[%l7 + %l2]
	or	%i5,	%i4,	%o6
	set	0x4C, %i6
	swapa	[%l7 + %i6] 0x81,	%g4
	nop
	set	0x0B, %l5
	ldsb	[%l7 + %l5],	%i2
	set	0x0C, %o7
	swapa	[%l7 + %o7] 0x80,	%l1
	nop
	set	0x08, %l4
	std	%f14,	[%l7 + %l4]
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xe3,	%i0
	set	0x78, %g4
	stwa	%o4,	[%l7 + %g4] 0x80
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%g6
	set	0x28, %i1
	lda	[%l7 + %i1] 0x81,	%f29
	nop
	set	0x3C, %o3
	swap	[%l7 + %o3],	%l5
	nop
	set	0x28, %l0
	ldsw	[%l7 + %l0],	%g1
	nop
	set	0x28, %i7
	swap	[%l7 + %i7],	%l2
	nop
	set	0x74, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%o6
	nop
	set	0x42, %g7
	ldstub	[%l7 + %g7],	%g5
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xca
	nop
	set	0x48, %i5
	ldsh	[%l7 + %i5],	%l4
	set	0x70, %g2
	stxa	%l6,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x40, %o1
	stxa	%i3,	[%l7 + %o1] 0x80
	nop
	set	0x40, %o5
	std	%f12,	[%l7 + %o5]
	bgu,a	%icc,	loop_151
	wr	%o0,	%l3,	%sys_tick
	bn,a	%icc,	loop_152
	nop
	set	0x3E, %g1
	lduh	[%l7 + %g1],	%o3
loop_151:
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%i1
	set	0x1C, %l6
	stha	%o5,	[%l7 + %l6] 0x89
loop_152:
	nop
	set	0x6D, %l3
	ldub	[%l7 + %l3],	%i6
	nop
	set	0x4E, %o0
	ldsh	[%l7 + %o0],	%g3
	nop
	set	0x5C, %o2
	stw	%g2,	[%l7 + %o2]
	nop
	set	0x7B, %i2
	stb	%l0,	[%l7 + %i2]
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%o2
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%o1
	set	0x3C, %l5
	stha	%g7,	[%l7 + %l5] 0x81
	nop
	set	0x30, %o7
	lduh	[%l7 + %o7],	%i5
	ld	[%l7 + 0x3C],	%f0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%o6
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%i4
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc0
	set	0x10, %l4
	lda	[%l7 + %l4] 0x81,	%f30
	add	%g4,	%i2,	%i0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f0
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f4
	or	%o4,	%g6,	%l5
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%l1
	nop
	set	0x26, %i1
	ldsh	[%l7 + %i1],	%g1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd0,	%f0
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x88,	 4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%g5
	nop
	set	0x70, %l0
	ldsw	[%l7 + %l0],	%l4
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%i6
	st	%f8,	[%l7 + 0x50]
	set	0x58, %g3
	stha	%o0,	[%l7 + %g3] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o3
	set	0x48, %i0
	stxa	%i1,	[%l7 + %i0] 0x89
	nop
	set	0x54, %i5
	sth	%i3,	[%l7 + %i5]
	nop
	set	0x14, %g2
	swap	[%l7 + %g2],	%i6
	nop
	set	0x39, %i3
	ldsb	[%l7 + %i3],	%g3
	nop
	set	0x4C, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x4C, %o5
	sta	%f21,	[%l7 + %o5] 0x89
	set	0x68, %g1
	stwa	%o5,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x80,	%l0
	nop
	set	0x33, %l6
	stb	%o2,	[%l7 + %l6]
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%g2
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x88,	%g7
	fpadd16	%f22,	%f0,	%f10
	st	%fsr,	[%l7 + 0x5C]
	fpadd32s	%f12,	%f23,	%f11
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%i5
	wr	%i7,	%o6,	%sys_tick
	set	0x34, %i2
	swapa	[%l7 + %i2] 0x80,	%i4
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x08, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%i0
	st	%f27,	[%l7 + 0x28]
	nop
	set	0x1B, %l2
	stb	%o4,	[%l7 + %l2]
	nop
	set	0x2C, %l5
	stw	%g6,	[%l7 + %l5]
	and	%g4,	%l5,	%g1
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x89,	 1
	nop
	set	0x08, %l4
	sth	%l2,	[%l7 + %l4]
	add	%l1,	%g5,	%l4
	set	0x10, %g4
	swapa	[%l7 + %g4] 0x88,	%o0
	nop
	set	0x48, %o3
	std	%f4,	[%l7 + %o3]
	nop
	set	0x74, %g6
	lduw	[%l7 + %g6],	%l3
	nop
	set	0x30, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x28, %i7
	stxa	%o3,	[%l7 + %i7] 0x81
	set	0x60, %l0
	lda	[%l7 + %l0] 0x80,	%f14
	set	0x44, %g7
	stwa	%i1,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	bn,pt	%icc,	loop_153
	nop
	set	0x60, %g3
	std	%f6,	[%l7 + %g3]
	nop
	set	0x12, %i5
	lduh	[%l7 + %i5],	%i3
	nop
	set	0x54, %g2
	ldsh	[%l7 + %g2],	%l6
loop_153:
	nop
	set	0x68, %i0
	sta	%f17,	[%l7 + %i0] 0x80
	set	0x5C, %o1
	sta	%f23,	[%l7 + %o1] 0x80
	and	%g3,	%o5,	%l0
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i6
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x56, %o5
	ldsb	[%l7 + %o5],	%g2
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xe3,	%o0
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x80,	 2
	set	0x50, %l6
	stxa	%g7,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%i4
	and	%o6,	%i7,	%i2
	nop
	set	0x7C, %o6
	swap	[%l7 + %o6],	%i4
	add	%i0,	%g6,	%o4
	or	%l5,	%g1,	%g4
	nop
	set	0x5B, %o2
	ldub	[%l7 + %o2],	%o7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%l2
	fpadd16	%f28,	%f6,	%f6
	nop
	set	0x78, %o0
	std	%g4,	[%l7 + %o0]
	add	%l4,	%o0,	%o3
	set	0x50, %i2
	stxa	%i1,	[%l7 + %i2] 0x80
	nop
	set	0x54, %i6
	prefetch	[%l7 + %i6],	 2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%l3
	set	0x5B, %o4
	stba	%l0,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x14, %l2
	sth	%o5,	[%l7 + %l2]
	nop
	set	0x48, %l5
	std	%f8,	[%l7 + %l5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x34, %o7
	ldub	[%l7 + %o7],	%o1
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x80,	 3
	set	0x34, %l4
	stba	%i5,	[%l7 + %l4] 0x88
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f16
	or	%o6,	%i7,	%i2
	bleu,a,pt	%icc,	loop_154
	and	%o2,	%i4,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%l5
loop_154:
	nop
	set	0x16, %g6
	lduh	[%l7 + %g6],	%o4
	nop
	set	0x24, %o3
	stw	%g1,	[%l7 + %o3]
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%o7
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	fpsub32s	%f28,	%f30,	%f16
	nop
	set	0x20, %i1
	sth	%g4,	[%l7 + %i1]
	nop
	set	0x4E, %g7
	ldub	[%l7 + %g7],	%l2
	set	0x60, %g5
	stda	%l4,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x08, %g3
	std	%f24,	[%l7 + %g3]
	bl,pt	%icc,	loop_155
	bne,a,pt	%xcc,	loop_156
	nop
	set	0x48, %i5
	stw	%g5,	[%l7 + %i5]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f0
loop_155:
	wr	%o3,	%i1,	%sys_tick
loop_156:
	nop
	set	0x10, %i0
	stx	%o0,	[%l7 + %i0]
	wr	%i3,	%g3,	%ccr
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f0
	ld	[%l7 + 0x0C],	%f18
	ld	[%l7 + 0x78],	%f31
	nop
	set	0x34, %o5
	stw	%l3,	[%l7 + %o5]
	set	0x10, %g1
	stxa	%l0,	[%l7 + %g1] 0xe3
	membar	#Sync
	ld	[%l7 + 0x6C],	%f9
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%l6
	nop
	set	0x28, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x2C, %o6
	stw	%i6,	[%l7 + %o6]
	set	0x68, %o2
	stxa	%g2,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x64, %o0
	ldsh	[%l7 + %o0],	%o1
	wr	%i5,	%o6,	%y
	nop
	set	0x78, %l6
	stx	%i7,	[%l7 + %l6]
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%g7
	set	0x34, %i2
	lda	[%l7 + %i2] 0x89,	%f4
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd0
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%o2
	nop
	set	0x78, %l2
	std	%i2,	[%l7 + %l2]
	set	0x08, %l4
	swapa	[%l7 + %l4] 0x80,	%i4
	fpsub32s	%f11,	%f17,	%f14
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%g6
	nop
	set	0x20, %g4
	std	%o4,	[%l7 + %g4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%o7
	nop
	set	0x62, %g6
	sth	%l1,	[%l7 + %g6]
	nop
	set	0x24, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x10, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x60, %l0
	std	%g4,	[%l7 + %l0]
	set	0x28, %o3
	stxa	%l2,	[%l7 + %o3] 0xea
	membar	#Sync
	add	%g1,	%l4,	%o3
	ld	[%l7 + 0x3C],	%f11
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x89,	%g5
	nop
	set	0x08, %g7
	lduh	[%l7 + %g7],	%i1
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x80,	%o0
	nop
	set	0x46, %g5
	ldstub	[%l7 + %g5],	%i3
	or	%g3,	%l0,	%l3
	set	0x18, %g2
	stda	%i6,	[%l7 + %g2] 0x89
	nop
	set	0x55, %i0
	stb	%o5,	[%l7 + %i0]
	wr	%i6,	%o1,	%y
	nop
	set	0x20, %i5
	std	%g2,	[%l7 + %i5]
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%o6
	nop
	set	0x54, %o1
	ldsb	[%l7 + %o1],	%i5
	nop
	set	0x28, %i3
	std	%f14,	[%l7 + %i3]
	and	%i7,	%o2,	%g7
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f22
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x6C, %o6
	sth	%i2,	[%l7 + %o6]
	nop
	set	0x26, %l3
	ldsh	[%l7 + %l3],	%i0
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%i4
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x88,	%g6
	ld	[%l7 + 0x78],	%f16
	nop
	set	0x60, %i6
	std	%o4,	[%l7 + %i6]
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xe2,	%o6
	nop
	set	0x28, %i2
	sth	%l5,	[%l7 + %i2]
	nop
	set	0x48, %o4
	std	%l0,	[%l7 + %o4]
	nop
	set	0x38, %l5
	std	%f12,	[%l7 + %l5]
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%l2
	set	0x4C, %l2
	lda	[%l7 + %l2] 0x80,	%f31
	set	0x32, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g4
	and	%g1,	%l4,	%o3
	nop
	set	0x5D, %g4
	stb	%g5,	[%l7 + %g4]
	st	%f16,	[%l7 + 0x44]
	nop
	set	0x31, %g6
	ldub	[%l7 + %g6],	%o0
	nop
	set	0x38, %i4
	std	%i0,	[%l7 + %i4]
	set	0x08, %l0
	stxa	%g3,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x70, %i7
	lda	[%l7 + %i7] 0x80,	%f29
	nop
	set	0x44, %i1
	lduw	[%l7 + %i1],	%l0
	add	%l3,	%i3,	%o5
	set	0x5C, %o3
	lda	[%l7 + %o3] 0x89,	%f1
	nop
	set	0x38, %g3
	ldx	[%l7 + %g3],	%l6
	set	0x0C, %g5
	swapa	[%l7 + %g5] 0x88,	%o1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%g2
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%o2
	and	%o6,	%i2,	%i0
	st	%f1,	[%l7 + 0x68]
	nop
	set	0x48, %g2
	std	%f30,	[%l7 + %g2]
	nop
	set	0x38, %i0
	std	%f18,	[%l7 + %i0]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%g7
	wr	%o4,	%o7,	%clear_softint
	set	0x45, %i5
	stba	%l5,	[%l7 + %i5] 0x80
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xea,	%g6
	set	0x70, %o5
	stxa	%l2,	[%l7 + %o5] 0x88
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%l0
	set	0x4A, %o1
	stha	%g4,	[%l7 + %o1] 0xe2
	membar	#Sync
	bne,pt	%xcc,	loop_157
	nop
	set	0x34, %o6
	ldstub	[%l7 + %o6],	%l4
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%o3
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xeb,	%g4
loop_157:
	nop
	set	0x76, %o0
	sth	%g1,	[%l7 + %o0]
	set	0x78, %l1
	sta	%f17,	[%l7 + %l1] 0x80
	nop
	set	0x48, %i6
	stx	%o0,	[%l7 + %i6]
	set	0x30, %l6
	lda	[%l7 + %l6] 0x81,	%f28
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x88,	%g3
	set	0x08, %i2
	lda	[%l7 + %i2] 0x80,	%f4
	nop
	set	0x7C, %l5
	swap	[%l7 + %l5],	%i1
	nop
	set	0x08, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%i3
	nop
	set	0x76, %g4
	ldsh	[%l7 + %g4],	%l6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1274
!	Type a   	: 42
!	Type cti   	: 30
!	Type x   	: 502
!	Type f   	: 35
!	Type i   	: 117
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
	set	0x3,	%g1
	set	0xE,	%g2
	set	0xD,	%g3
	set	0xF,	%g4
	set	0x4,	%g5
	set	0xC,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x9,	%i1
	set	-0x1,	%i2
	set	-0x3,	%i3
	set	-0x6,	%i4
	set	-0xF,	%i5
	set	-0x4,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x0A87D8B6,	%l0
	set	0x39272A79,	%l1
	set	0x7C6AA4B8,	%l2
	set	0x45368DA3,	%l3
	set	0x21FAA9C7,	%l4
	set	0x35687117,	%l5
	set	0x72F8FA1B,	%l6
	!# Output registers
	set	-0x1BA7,	%o0
	set	0x1835,	%o1
	set	0x13B9,	%o2
	set	0x120A,	%o3
	set	0x11DD,	%o4
	set	0x0CB4,	%o5
	set	-0x052E,	%o6
	set	-0x1580,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x80,	%i6
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%g2
	st	%f15,	[%l7 + 0x4C]
	wr 	%g0, 	0x5, 	%fprs
	add	%o2,	%i5,	%o6
	set	0x44, %l0
	stwa	%i0,	[%l7 + %l0] 0x89
	nop
	set	0x24, %i1
	swap	[%l7 + %i1],	%i4
	nop
	set	0x2C, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x58, %o3
	lda	[%l7 + %o3] 0x88,	%f21
	nop
	set	0x58, %g3
	stb	%i2,	[%l7 + %g3]
	nop
	set	0x10, %g7
	sth	%g7,	[%l7 + %g7]
	bl,a	%xcc,	loop_158
	nop
	set	0x54, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%l5
loop_158:
	nop
	set	0x68, %i0
	stxa	%g6,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x70, %i5
	stda	%o6,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f24
	set	0x62, %i3
	stha	%l1,	[%l7 + %i3] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%l4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%o3
	set	0x35, %o6
	stba	%g5,	[%l7 + %o6] 0x88
	nop
	set	0x64, %g1
	ldsh	[%l7 + %g1],	%g1
	set	0x24, %o2
	sta	%f2,	[%l7 + %o2] 0x89
	set	0x48, %o0
	sta	%f8,	[%l7 + %o0] 0x80
	and	%o0,	%l2,	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%l3
	set	0x58, %l3
	stwa	%i1,	[%l7 + %l3] 0x80
	set	0x4B, %l1
	stba	%i3,	[%l7 + %l1] 0x80
	set	0x58, %l6
	swapa	[%l7 + %l6] 0x81,	%o5
	nop
	set	0x1C, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x60, %o4
	stda	%i6,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x80,	%g2
	set	0x68, %o7
	lda	[%l7 + %o7] 0x80,	%f19
	nop
	set	0x30, %l5
	stx	%i6,	[%l7 + %l5]
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%o1
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x50, %g6
	stxa	%i7,	[%l7 + %g6] 0x81
	nop
	set	0x28, %l2
	swap	[%l7 + %l2],	%o2
	nop
	set	0x10, %i4
	lduw	[%l7 + %i4],	%i5
	set	0x28, %l0
	sta	%f13,	[%l7 + %l0] 0x89
	set	0x78, %i7
	stda	%i0,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%i4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%i2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%o4
	set	0x48, %g3
	sta	%f27,	[%l7 + %g3] 0x88
	nop
	set	0x0B, %o3
	ldsb	[%l7 + %o3],	%g6
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x80,	%l5
	st	%fsr,	[%l7 + 0x18]
	set	0x50, %g7
	stwa	%o7,	[%l7 + %g7] 0x88
	fpsub16s	%f8,	%f5,	%f10
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd8,	%f0
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x89,	%l1
	nop
	set	0x58, %o5
	std	%f26,	[%l7 + %o5]
	add	%l4,	%g4,	%g5
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x88,	%g1
	bge,pn	%xcc,	loop_159
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x88
loop_159:
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%o0
	nop
	set	0x4A, %o2
	ldsh	[%l7 + %o2],	%o3
	wr	%l2,	%l0,	%y
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f0
	nop
	set	0x5E, %o0
	lduh	[%l7 + %o0],	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i3
	set	0x62, %l3
	stha	%l3,	[%l7 + %l3] 0x81
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l6
	nop
	set	0x72, %l1
	sth	%i6,	[%l7 + %l1]
	set	0x24, %i6
	lda	[%l7 + %i6] 0x89,	%f18
	set	0x14, %l6
	stwa	%o1,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x6A, %i2
	stb	%g2,	[%l7 + %i2]
	or	%i7,	%i5,	%i0
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%o2
	nop
	set	0x38, %o7
	sth	%o6,	[%l7 + %o7]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc2
	nop
	set	0x7E, %l5
	sth	%i4,	[%l7 + %l5]
	st	%f23,	[%l7 + 0x2C]
	set	0x14, %g6
	lda	[%l7 + %g6] 0x89,	%f4
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x88,	%g7
	ld	[%l7 + 0x68],	%f10
	nop
	set	0x60, %i4
	std	%i2,	[%l7 + %i4]
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x89,	%o4
	nop
	set	0x40, %i7
	std	%g6,	[%l7 + %i7]
	nop
	set	0x5C, %i1
	ldub	[%l7 + %i1],	%o7
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f16
	nop
	set	0x20, %o3
	ldsh	[%l7 + %o3],	%l5
	and	%l1,	%l4,	%g4
	fpadd32s	%f27,	%f13,	%f26
	nop
	set	0x12, %g3
	lduh	[%l7 + %g3],	%g1
	set	0x64, %g7
	stwa	%g5,	[%l7 + %g7] 0x89
	nop
	set	0x38, %g5
	std	%o0,	[%l7 + %g5]
	add	%l2,	%o3,	%g3
	nop
	set	0x77, %i5
	stb	%l0,	[%l7 + %i5]
	nop
	set	0x62, %o5
	ldstub	[%l7 + %o5],	%i1
	set	0x72, %i3
	stha	%l3,	[%l7 + %i3] 0x81
	nop
	set	0x68, %g2
	swap	[%l7 + %g2],	%o5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%l6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%f0
	nop
	set	0x70, %i0
	stx	%o1,	[%l7 + %i0]
	nop
	set	0x78, %o6
	stb	%i6,	[%l7 + %o6]
	nop
	set	0x60, %o2
	stb	%g2,	[%l7 + %o2]
	set	0x70, %l3
	stxa	%i5,	[%l7 + %l3] 0x81
	wr	%i0,	%o2,	%y
	nop
	set	0x58, %l1
	stx	%i7,	[%l7 + %l1]
	st	%f9,	[%l7 + 0x2C]
	nop
	set	0x2E, %i6
	ldsb	[%l7 + %i6],	%o6
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%i4
	set	0x1A, %i2
	stha	%g7,	[%l7 + %i2] 0x89
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%g6
	set	0x18, %o4
	lda	[%l7 + %o4] 0x80,	%f9
	ld	[%l7 + 0x24],	%f29
	or	%o7,	%l5,	%i2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x81
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l4
	set	0x40, %l4
	sta	%f2,	[%l7 + %l4] 0x88
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%g4
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%g4
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f10
	st	%f26,	[%l7 + 0x48]
	nop
	set	0x68, %i4
	stw	%o0,	[%l7 + %i4]
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%g0
	st	%f10,	[%l7 + 0x4C]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%l2
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf1
	membar	#Sync
	set	0x50, %i1
	sta	%f11,	[%l7 + %i1] 0x81
	or	%l0,	%g3,	%l3
	nop
	set	0x38, %l0
	stx	%i1,	[%l7 + %l0]
	set	0x08, %i7
	stxa	%o5,	[%l7 + %i7] 0x80
	nop
	set	0x64, %o3
	swap	[%l7 + %o3],	%i3
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x80,	 4
	set	0x60, %g7
	stxa	%l6,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x40, %i5
	std	%f28,	[%l7 + %i5]
	set	0x4C, %g5
	stha	%i6,	[%l7 + %g5] 0x89
	st	%fsr,	[%l7 + 0x38]
	or	%i5,	%i0,	%g2
	nop
	set	0x68, %i3
	stx	%o2,	[%l7 + %i3]
	set	0x60, %g2
	swapa	[%l7 + %g2] 0x89,	%o6
	set	0x74, %o1
	stwa	%i4,	[%l7 + %o1] 0x81
	set	0x08, %o5
	stwa	%i7,	[%l7 + %o5] 0x81
	set	0x10, %g1
	stha	%o4,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x58, %o6
	ldsh	[%l7 + %o6],	%g7
	nop
	set	0x0E, %i0
	sth	%o7,	[%l7 + %i0]
	set	0x4B, %l3
	stba	%l5,	[%l7 + %l3] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%l1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%g6
	set	0x58, %o2
	stba	%g4,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x64, %l1
	swap	[%l7 + %l1],	%o0
	wr	%g1,	%g5,	%softint
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f12
	nop
	set	0x79, %i2
	ldub	[%l7 + %i2],	%l2
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	add	%o3,	%l3,	%i1
	ba,a	%xcc,	loop_160
	nop
	set	0x38, %l6
	ldsh	[%l7 + %l6],	%o5
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x81,	%i2
loop_160:
	nop
	set	0x7E, %o7
	ldub	[%l7 + %o7],	%o1
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x81,	%g3
	st	%f1,	[%l7 + 0x34]
	st	%f19,	[%l7 + 0x60]
	nop
	set	0x5E, %l2
	ldub	[%l7 + %l2],	%i6
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x81,	%i5
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%i0
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x80,	%g2
	nop
	set	0x42, %g4
	sth	%o2,	[%l7 + %g4]
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x89,	%o6
	set	0x38, %i7
	stxa	%l6,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xca
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0
	ld	[%l7 + 0x1C],	%f5
	set	0x58, %g3
	stwa	%i4,	[%l7 + %g3] 0x81
	nop
	set	0x47, %i5
	ldsb	[%l7 + %i5],	%g7
	set	0x76, %g7
	stha	%o4,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%o7,	%i2,	%l1
	nop
	set	0x70, %i3
	ldub	[%l7 + %i3],	%l4
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f18
	nop
	set	0x40, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x60, %o5
	swap	[%l7 + %o5],	%l5
	set	0x20, %g1
	stxa	%g6,	[%l7 + %g1] 0x80
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc0
	set	0x09, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o0
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe2,	%g4
	nop
	set	0x0C, %o2
	ldsb	[%l7 + %o2],	%g1
	nop
	set	0x64, %l1
	ldsh	[%l7 + %l1],	%l2
	fpadd32s	%f25,	%f22,	%f9
	nop
	set	0x5C, %l3
	stw	%l0,	[%l7 + %l3]
	nop
	set	0x30, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x88,	 2
	set	0x40, %l6
	stxa	%l3,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x28, %o0
	stwa	%g5,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x10, %i2
	ldda	[%l7 + %i2] 0xeb,	%o4
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%f24
	nop
	set	0x7C, %l2
	sth	%i1,	[%l7 + %l2]
	nop
	set	0x23, %o7
	ldub	[%l7 + %o7],	%i3
	set	0x50, %i4
	stxa	%o1,	[%l7 + %i4] 0x81
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf1,	%f16
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf8
	membar	#Sync
	nop
	set	0x70, %l0
	sth	%i6,	[%l7 + %l0]
	or	%i5,	%i0,	%g2
	or	%o2,	%o6,	%g3
	set	0x6A, %g6
	stha	%l6,	[%l7 + %g6] 0x80
	set	0x30, %o3
	stda	%i4,	[%l7 + %o3] 0x89
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x75F, 	%sys_tick_cmpr
	nop
	set	0x78, %i7
	stx	%g7,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x60, %g3
	ldsh	[%l7 + %g3],	%i2
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%l0
	set	0x68, %g7
	stda	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	or	%l5,	%g6,	%o0
	fpadd16s	%f5,	%f28,	%f2
	wr	%g4,	%g1,	%set_softint
	set	0x6A, %i3
	ldstuba	[%l7 + %i3] 0x81,	%l4
	nop
	set	0x23, %i5
	ldstub	[%l7 + %i5],	%l0
	add	%o3,	%l2,	%l3
	nop
	set	0x4C, %g2
	ldstub	[%l7 + %g2],	%o5
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%i1
	nop
	set	0x14, %g1
	ldsh	[%l7 + %g1],	%g5
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%i2
	nop
	set	0x68, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x28, %i0
	ldub	[%l7 + %i0],	%o1
	nop
	set	0x4C, %o2
	stw	%i6,	[%l7 + %o2]
	set	0x64, %l1
	stwa	%i0,	[%l7 + %l1] 0x88
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%g2
	nop
	set	0x3E, %l3
	ldsh	[%l7 + %l3],	%o2
	set	0x7C, %i6
	sta	%f11,	[%l7 + %i6] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%l6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i7
	nop
	set	0x58, %o4
	lduw	[%l7 + %o4],	%o6
	set	0x1C, %g5
	lda	[%l7 + %g5] 0x80,	%f9
	and	%g7,	%o4,	%i2
	st	%f30,	[%l7 + 0x20]
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%l1
	nop
	set	0x58, %l6
	stw	%g6,	[%l7 + %l6]
	nop
	set	0x10, %i2
	std	%o0,	[%l7 + %i2]
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	wr	%g1,	%g4,	%clear_softint
	add	%l4,	%l0,	%o3
	nop
	set	0x61, %o7
	ldstub	[%l7 + %o7],	%l3
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf0
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%i1,	%g5,	%i3
	set	0x08, %l5
	stwa	%i6,	[%l7 + %l5] 0x88
	or	%i0,	%o1,	%g2
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f26
	set	0x74, %l0
	swapa	[%l7 + %l0] 0x88,	%i5
	bne,pn	%icc,	loop_161
	nop
	set	0x48, %g6
	std	%f22,	[%l7 + %g6]
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%g3
	nop
	set	0x6C, %i7
	swap	[%l7 + %i7],	%l6
loop_161:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%i7
	st	%f5,	[%l7 + 0x28]
	nop
	set	0x1E, %o3
	ldsb	[%l7 + %o3],	%o6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%o4
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x89,	 3
	fpsub32s	%f29,	%f7,	%f18
	nop
	set	0x78, %g3
	std	%f16,	[%l7 + %g3]
	set	0x48, %i3
	stwa	%o7,	[%l7 + %i3] 0xe2
	membar	#Sync
	add	%i2,	%l5,	%l1
	nop
	nop
	setx	0x2D7874433AAC39E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x88C5E6C24AE96A5D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f14,	%f2
	nop
	set	0x5E, %i5
	ldsb	[%l7 + %i5],	%o0
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%g1
	nop
	set	0x14, %o5
	stw	%g6,	[%l7 + %o5]
	set	0x1C, %g1
	stwa	%g4,	[%l7 + %g1] 0xe2
	membar	#Sync
	fpsub16	%f22,	%f24,	%f18
	nop
	set	0x14, %g7
	swap	[%l7 + %g7],	%l0
	set	0x0C, %o1
	swapa	[%l7 + %o1] 0x89,	%l4
	nop
	set	0x72, %o6
	ldsb	[%l7 + %o6],	%o3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcc
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 0
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x68, %l3
	lduw	[%l7 + %l3],	%l3
	nop
	set	0x54, %o2
	prefetch	[%l7 + %o2],	 2
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f16
	set	0x0C, %g5
	swapa	[%l7 + %g5] 0x89,	%o5
	nop
	set	0x4B, %i6
	ldub	[%l7 + %i6],	%l2
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x81,	%i1
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 0
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x46, %o7
	sth	%i6,	[%l7 + %o7]
	nop
	set	0x44, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x20, %l5
	stda	%o0,	[%l7 + %l5] 0xe3
	membar	#Sync
	add	%g2,	%i0,	%g3
	set	0x6C, %l4
	stwa	%l6,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%i4
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f24
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f14
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x51, %i1
	ldub	[%l7 + %i1],	%o6
	set	0x3C, %g3
	stwa	%i4,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x6A, %i7
	stha	%o2,	[%l7 + %i7] 0x88
	nop
	set	0x64, %i5
	lduw	[%l7 + %i5],	%o4
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%g7
	set	0x24, %o5
	lda	[%l7 + %o5] 0x89,	%f12
	set	0x76, %i3
	stha	%o7,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x58, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i2
	nop
	set	0x2F, %o1
	stb	%l5,	[%l7 + %o1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%g1
	nop
	set	0x24, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x4A, %i0
	sth	%g6,	[%l7 + %i0]
	set	0x28, %l1
	stda	%o0,	[%l7 + %l1] 0x89
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf9
	membar	#Sync
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f18
	nop
	set	0x40, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x36, %o4
	sth	%l0,	[%l7 + %o4]
	set	0x62, %g5
	ldstuba	[%l7 + %g5] 0x89,	%o3
	set	0x70, %l6
	stxa	%l4,	[%l7 + %l6] 0x89
	nop
	set	0x78, %o0
	sth	%o5,	[%l7 + %o0]
	ld	[%l7 + 0x38],	%f27
	set	0x52, %i6
	stha	%l3,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x7C, %i2
	sta	%f8,	[%l7 + %i2] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%l2
	st	%fsr,	[%l7 + 0x1C]
	set	0x78, %i4
	stxa	%g5,	[%l7 + %i4] 0x88
	set	0x3B, %o7
	stba	%i3,	[%l7 + %o7] 0x81
	nop
	set	0x44, %l5
	stb	%i6,	[%l7 + %l5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%o1
	nop
	set	0x18, %l0
	stx	%i0,	[%l7 + %l0]
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%g2
	nop
	set	0x74, %l2
	ldsb	[%l7 + %l2],	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%i5
	nop
	set	0x20, %g4
	ldx	[%l7 + %g4],	%i4
	st	%f19,	[%l7 + 0x40]
	ld	[%l7 + 0x34],	%f11
	add	%o6,	%o2,	%g7
	nop
	set	0x28, %o3
	lduw	[%l7 + %o3],	%o4
	nop
	set	0x54, %i1
	swap	[%l7 + %i1],	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%l5
	set	0x28, %g6
	swapa	[%l7 + %g6] 0x89,	%l1
	nop
	set	0x68, %g3
	stw	%g6,	[%l7 + %g3]
	set	0x38, %i7
	stxa	%g1,	[%l7 + %i7] 0x89
	nop
	set	0x62, %i5
	sth	%g4,	[%l7 + %i5]
	nop
	set	0x12, %g2
	stb	%o0,	[%l7 + %g2]
	nop
	set	0x5E, %i3
	lduh	[%l7 + %i3],	%o3
	add	%l4,	%l0,	%o5
	set	0x40, %g7
	stxa	%i1,	[%l7 + %g7] 0x81
	nop
	set	0x68, %o5
	sth	%l3,	[%l7 + %o5]
	nop
	set	0x28, %o1
	swap	[%l7 + %o1],	%g5
	and	%i3,	%l2,	%g2
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%o0
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x88,	%i6
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f0
	nop
	set	0x23, %l1
	ldub	[%l7 + %l1],	%g3
	set	0x40, %l3
	stda	%i6,	[%l7 + %l3] 0xe2
	membar	#Sync
	bg	%icc,	loop_162
	nop
	set	0x10, %o4
	std	%f18,	[%l7 + %o4]
	and	%i0,	%i5,	%i7
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%o6
loop_162:
	nop
	set	0x3C, %l6
	sta	%f9,	[%l7 + %l6] 0x81
	and	%i4,	%o2,	%g7
	fpsub32	%f2,	%f30,	%f8
	nop
	set	0x57, %o0
	ldsb	[%l7 + %o0],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l5
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x89,	 4
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x80,	%g6
	nop
	set	0x1E, %i4
	ldstub	[%l7 + %i4],	%l1
	set	0x18, %o7
	stda	%g4,	[%l7 + %o7] 0x89
	nop
	set	0x0D, %i2
	stb	%g1,	[%l7 + %i2]
	ld	[%l7 + 0x6C],	%f11
	or	%o0,	%o3,	%l4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf9
	membar	#Sync
	nop
	set	0x18, %l5
	std	%f20,	[%l7 + %l5]
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%o4
	add	%i1,	%l3,	%l0
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%i3
	set	0x68, %o3
	stda	%l2,	[%l7 + %o3] 0x88
	fpsub32s	%f15,	%f9,	%f19
	add	%g5,	%g2,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%g3
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x81,	%l6
	set	0x68, %g6
	lda	[%l7 + %g6] 0x88,	%f17
	set	0x30, %g3
	stha	%i5,	[%l7 + %g3] 0x89
	nop
	set	0x2C, %i7
	ldsh	[%l7 + %i7],	%i7
	nop
	set	0x1F, %i5
	ldub	[%l7 + %i5],	%i0
	and	%o6,	%i4,	%g7
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f0
	nop
	set	0x42, %i3
	ldub	[%l7 + %i3],	%o2
	nop
	set	0x28, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x15, %l2
	ldsb	[%l7 + %l2],	%i2
	or	%o4,	%o7,	%l5
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x81,	%l1
	nop
	set	0x30, %o1
	stw	%g6,	[%l7 + %o1]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xeb,	%g4
	be	%xcc,	loop_163
	nop
	set	0x10, %g1
	std	%o0,	[%l7 + %g1]
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%g1
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x89,	%f27
loop_163:
	nop
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x81
	nop
	set	0x34, %o2
	ldsw	[%l7 + %o2],	%l4
	nop
	set	0x34, %l6
	ldsw	[%l7 + %l6],	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%l3
	nop
	set	0x20, %o4
	std	%o4,	[%l7 + %o4]
	wr	%i3,	%l2,	%clear_softint
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%g2
	nop
	set	0x28, %g5
	std	%l0,	[%l7 + %g5]
	nop
	set	0x20, %i6
	swap	[%l7 + %i6],	%o1
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f4
	fpadd16s	%f27,	%f29,	%f7
	set	0x6C, %o7
	stwa	%i6,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x39, %i2
	ldub	[%l7 + %i2],	%g3
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x68, %l5
	prefetch	[%l7 + %l5],	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%i7
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%i0
	nop
	set	0x58, %o3
	std	%f22,	[%l7 + %o3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%i4
	nop
	set	0x24, %l4
	lduh	[%l7 + %l4],	%g7
	bge	%xcc,	loop_164
	nop
	set	0x7C, %g6
	ldub	[%l7 + %g6],	%l6
	nop
	set	0x28, %i1
	stx	%o2,	[%l7 + %i1]
	add	%i2,	%o4,	%l5
loop_164:
	nop
	set	0x60, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x13, %i5
	ldsb	[%l7 + %i5],	%l1
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o7
	ld	[%l7 + 0x4C],	%f13
	set	0x38, %g2
	sta	%f0,	[%l7 + %g2] 0x81
	add	%g6,	%g4,	%g1
	nop
	set	0x2E, %i3
	stb	%o0,	[%l7 + %i3]
	nop
	set	0x22, %g7
	ldub	[%l7 + %g7],	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%l3
	fpadd16s	%f31,	%f14,	%f12
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%o5
	fpsub32s	%f15,	%f14,	%f8
	nop
	set	0x0C, %l2
	stw	%i3,	[%l7 + %l2]
	nop
	set	0x49, %o5
	ldstub	[%l7 + %o5],	%g5
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x89
	set	0x18, %g1
	stwa	%g2,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x30, %o6
	std	%l2,	[%l7 + %o6]
	and	%l0,	%o1,	%i6
	st	%fsr,	[%l7 + 0x3C]
	set	0x40, %i0
	stxa	%g3,	[%l7 + %i0] 0x88
	nop
	set	0x08, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f4
	nop
	set	0x70, %l6
	lduw	[%l7 + %l6],	%i7
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%o6
	or	%i4,	%g7,	%i0
	wr	%l6,	%o2,	%y
	nop
	set	0x68, %o4
	std	%f20,	[%l7 + %o4]
	nop
	set	0x10, %o2
	ldsw	[%l7 + %o2],	%o4
	fpadd32	%f20,	%f14,	%f24
	nop
	set	0x78, %i6
	std	%f8,	[%l7 + %i6]
	set	0x18, %g5
	stxa	%i2,	[%l7 + %g5] 0xe2
	membar	#Sync
	and	%l5,	%o7,	%l1
	set	0x28, %i4
	stda	%g4,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x4C, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x20, %o0
	stx	%g1,	[%l7 + %o0]
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x80,	%o0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%o3
	set	0x1C, %o7
	lda	[%l7 + %o7] 0x89,	%f30
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i3
	fpadd16	%f20,	%f8,	%f8
	add	%g5,	%l3,	%g2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x3A, %o3
	lduh	[%l7 + %o3],	%l2
	st	%f29,	[%l7 + 0x70]
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%o1
	set	0x38, %l4
	sta	%f25,	[%l7 + %l4] 0x89
	set	0x38, %i1
	stha	%l0,	[%l7 + %i1] 0xea
	membar	#Sync
	st	%f23,	[%l7 + 0x14]
	set	0x68, %g6
	stxa	%g3,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x60, %g3
	prefetch	[%l7 + %g3],	 4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x6E, %i7
	sth	%i7,	[%l7 + %i7]
	set	0x59, %i5
	ldstuba	[%l7 + %i5] 0x80,	%i6
	set	0x10, %g2
	swapa	[%l7 + %g2] 0x88,	%i5
	set	0x6C, %g7
	sta	%f2,	[%l7 + %g7] 0x81
	nop
	set	0x2D, %i3
	stb	%i4,	[%l7 + %i3]
	or	%o6,	%i0,	%g7
	nop
	set	0x38, %l2
	stw	%o2,	[%l7 + %l2]
	set	0x28, %o1
	swapa	[%l7 + %o1] 0x80,	%o4
	nop
	set	0x38, %g1
	lduw	[%l7 + %g1],	%i2
	nop
	set	0x10, %o6
	ldsh	[%l7 + %o6],	%l6
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x81,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%l5
	nop
	set	0x26, %i0
	ldub	[%l7 + %i0],	%g4
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%o0
	add	%g6,	%i1,	%g1
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x80,	%l4
	st	%f25,	[%l7 + 0x3C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%o5
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x89,	%g5
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x88,	%i3
	nop
	set	0x44, %i6
	swap	[%l7 + %i6],	%g2
	st	%fsr,	[%l7 + 0x24]
	set	0x20, %g5
	lda	[%l7 + %g5] 0x88,	%f15
	st	%fsr,	[%l7 + 0x78]
	set	0x6C, %i4
	sta	%f23,	[%l7 + %i4] 0x88
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x63, %o0
	ldub	[%l7 + %o0],	%l3
	set	0x24, %l6
	sta	%f14,	[%l7 + %l6] 0x89
	nop
	set	0x3B, %l5
	stb	%o1,	[%l7 + %l5]
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%l0
	nop
	set	0x78, %o3
	std	%f22,	[%l7 + %o3]
	bne	%xcc,	loop_165
	nop
	set	0x58, %o7
	stw	%g3,	[%l7 + %o7]
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%l2
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f10
loop_165:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%i4
	nop
	set	0x3C, %l4
	swap	[%l7 + %l4],	%i0
	nop
	set	0x6F, %g6
	stb	%o6,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x58, %i7
	ldsb	[%l7 + %i7],	%g7
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%f0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f16
	add	%o4,	%o2,	%i2
	nop
	set	0x0A, %g7
	ldsb	[%l7 + %g7],	%l6
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xea,	%l0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x88
	bgu,pt	%icc,	loop_166
	nop
	set	0x70, %i3
	std	%l4,	[%l7 + %i3]
	set	0x20, %o1
	stxa	%o7,	[%l7 + %o1] 0xea
	membar	#Sync
loop_166:
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x1C, %o6
	ldstub	[%l7 + %o6],	%o0
	add	%g4,	%i1,	%g1
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x10, %l1
	stw	%l4,	[%l7 + %l1]
	nop
	set	0x08, %l3
	ldsh	[%l7 + %l3],	%g6
	st	%f23,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x0C]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xe2,	%o2
	set	0x48, %o4
	stba	%o5,	[%l7 + %o4] 0x80
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x88,	%g5
	nop
	set	0x1B, %o2
	ldstub	[%l7 + %o2],	%g2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf8
	membar	#Sync
	set	0x3C, %i2
	stwa	%i3,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x2C, %i4
	lduh	[%l7 + %i4],	%o1
	bgu,pn	%xcc,	loop_167
	nop
	set	0x4A, %l6
	sth	%l3,	[%l7 + %l6]
	nop
	set	0x40, %l5
	ldsh	[%l7 + %l5],	%g3
	st	%f20,	[%l7 + 0x40]
loop_167:
	nop
	set	0x54, %l0
	swap	[%l7 + %l0],	%l0
	set	0x7B, %o3
	stba	%i6,	[%l7 + %o3] 0x88
	or	%l2,	%i7,	%i4
	set	0x15, %o7
	stba	%i0,	[%l7 + %o7] 0x88
	set	0x6B, %o0
	stba	%o6,	[%l7 + %o0] 0x81
	set	0x56, %i1
	stba	%g7,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x0C, %l4
	lda	[%l7 + %l4] 0x88,	%f7
	nop
	set	0x50, %g6
	stw	%o4,	[%l7 + %g6]
	set	0x25, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o2
	nop
	set	0x08, %i7
	swap	[%l7 + %i7],	%i5
	nop
	set	0x42, %g3
	sth	%l6,	[%l7 + %g3]
	nop
	nop
	setx	0xD938BABB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xCA4AB4B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f10,	%f7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%l1
	nop
	set	0x78, %g7
	ldsw	[%l7 + %g7],	%o7
	ba	%xcc,	loop_168
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%l5
	wr 	%g0, 	0x7, 	%fprs
	ld	[%l7 + 0x74],	%f9
loop_168:
	nop
	set	0x20, %i5
	ldxa	[%l7 + %i5] 0x89,	%i1
	and	%g1,	%g6,	%o3
	fpsub16	%f4,	%f14,	%f16
	nop
	nop
	setx	0xCA3C3D8A8262A5EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF2A1AAD27BEE26A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f2,	%f0
	ld	[%l7 + 0x3C],	%f15
	nop
	set	0x20, %l2
	lduh	[%l7 + %l2],	%l4
	set	0x70, %o1
	stda	%o4,	[%l7 + %o1] 0x89
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xe2,	%g2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd8
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	set	0x5A, %i0
	stha	%g5,	[%l7 + %i0] 0x89
	nop
	set	0x24, %l1
	lduw	[%l7 + %l1],	%i3
	st	%fsr,	[%l7 + 0x6C]
	set	0x50, %o5
	ldda	[%l7 + %o5] 0xe2,	%o0
	nop
	set	0x54, %l3
	ldsh	[%l7 + %l3],	%g3
	nop
	set	0x18, %i6
	std	%f20,	[%l7 + %i6]
	set	0x58, %o4
	stxa	%l0,	[%l7 + %o4] 0x80
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f14
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x89,	 4
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x89,	%l3
	nop
	set	0x5C, %g5
	swap	[%l7 + %g5],	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%i7
	nop
	set	0x70, %l5
	stx	%i0,	[%l7 + %l5]
	nop
	set	0x7C, %l0
	ldsh	[%l7 + %l0],	%o6
	nop
	set	0x76, %o3
	ldsh	[%l7 + %o3],	%g7
	nop
	set	0x48, %l6
	ldstub	[%l7 + %l6],	%o4
	and	%o2,	%i5,	%i2
	nop
	set	0x7E, %o7
	ldub	[%l7 + %o7],	%l6
	nop
	set	0x40, %o0
	std	%o6,	[%l7 + %o0]
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%l4
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%l1
	add	%g4,	%o0,	%g1
	set	0x28, %g4
	stda	%g6,	[%l7 + %g4] 0x89
	nop
	set	0x40, %i7
	ldsw	[%l7 + %i7],	%o3
	set	0x10, %g6
	stxa	%i1,	[%l7 + %g6] 0x80
	nop
	set	0x30, %g3
	prefetch	[%l7 + %g3],	 2
	set	0x0D, %g7
	stba	%o5,	[%l7 + %g7] 0x88
	set	0x0C, %g2
	stha	%g2,	[%l7 + %g2] 0xe2
	membar	#Sync
	and	%l4,	%g5,	%o1
	set	0x54, %l2
	sta	%f28,	[%l7 + %l2] 0x80
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x89,	%g3
	nop
	set	0x30, %g1
	stx	%l0,	[%l7 + %g1]
	set	0x30, %o1
	lda	[%l7 + %o1] 0x89,	%f29
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x70, %i0
	stda	%i6,	[%l7 + %i0] 0x80
	fpadd32s	%f20,	%f0,	%f24
	ld	[%l7 + 0x3C],	%f3
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%i2
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x88,	%l2
	add	%i4,	%l2,	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%o6
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x10, %i6
	stha	%g7,	[%l7 + %i6] 0x80
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f12
	or	%o2,	%o4,	%i5
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x89,	%i6
	nop
	set	0x68, %i2
	ldsh	[%l7 + %i2],	%i2
	or	%o7,	%l1,	%g4
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x57, %i4
	ldub	[%l7 + %i4],	%o0
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x89,	 2
	add	%g6,	%g1,	%o3
	set	0x0E, %l0
	stba	%i1,	[%l7 + %l0] 0x81
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f16
	nop
	set	0x28, %o3
	ldsw	[%l7 + %o3],	%g2
	set	0x1A, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o5
	nop
	set	0x78, %l6
	ldsh	[%l7 + %l6],	%l4
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xda
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	st	%f29,	[%l7 + 0x50]
	nop
	set	0x51, %g4
	ldub	[%l7 + %g4],	%o1
	st	%f9,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x6C]
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x89,	%g3
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%l0
	nop
	set	0x18, %g6
	std	%g4,	[%l7 + %g6]
	or	%i6,	%l3,	%i3
	nop
	set	0x10, %g7
	swap	[%l7 + %g7],	%i4
	nop
	set	0x74, %g2
	prefetch	[%l7 + %g2],	 2
	add	%i0,	%l2,	%o6
	nop
	set	0x72, %g3
	ldstub	[%l7 + %g3],	%g7
	set	0x36, %i5
	stha	%o2,	[%l7 + %i5] 0x81
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%o4
	set	0x70, %o1
	stxa	%i5,	[%l7 + %o1] 0xea
	membar	#Sync
	bne,a,pt	%icc,	loop_169
	nop
	set	0x38, %l2
	std	%f30,	[%l7 + %l2]
	set	0x08, %o6
	stwa	%l6,	[%l7 + %o6] 0x88
loop_169:
	fpadd16	%f4,	%f0,	%f6
	set	0x5C, %i0
	swapa	[%l7 + %i0] 0x81,	%i2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x4A, %l1
	lduh	[%l7 + %l1],	%i7
	add	%l1,	%o7,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%g6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o3
	set	0x58, %l3
	lda	[%l7 + %l3] 0x89,	%f15
	set	0x3D, %i6
	ldstuba	[%l7 + %i6] 0x89,	%g1
	set	0x08, %o4
	sta	%f6,	[%l7 + %o4] 0x81
	add	%g2,	%i1,	%o5
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%l4
	nop
	set	0x68, %i2
	sth	%o1,	[%l7 + %i2]
	nop
	set	0x30, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x68, %i3
	stda	%l0,	[%l7 + %i3] 0x88
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x81,	%g5
	set	0x30, %l0
	stda	%i6,	[%l7 + %l0] 0x88
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%g3
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%i3
	st	%fsr,	[%l7 + 0x70]
	add	%l3,	%i0,	%l2
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f18
	nop
	set	0x18, %o7
	ldsh	[%l7 + %o7],	%o6
	st	%f17,	[%l7 + 0x60]
	nop
	set	0x10, %l6
	swap	[%l7 + %l6],	%i4
	nop
	set	0x50, %o0
	swap	[%l7 + %o0],	%g7
	nop
	set	0x18, %g4
	ldsw	[%l7 + %g4],	%o4
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f22
	set	0x50, %i7
	sta	%f7,	[%l7 + %i7] 0x80
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x80,	%o2
	nop
	set	0x6E, %g7
	ldsb	[%l7 + %g7],	%l6
	nop
	set	0x18, %g2
	sth	%i5,	[%l7 + %g2]
	set	0x6C, %i1
	swapa	[%l7 + %i1] 0x80,	%i7
	nop
	set	0x6C, %i5
	prefetch	[%l7 + %i5],	 1
	set	0x28, %g1
	stda	%l0,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x14, %o1
	swap	[%l7 + %o1],	%i2
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x80,	%o6
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%o0
	set	0x48, %i0
	stxa	%l5,	[%l7 + %i0] 0x88
	nop
	set	0x14, %l1
	swap	[%l7 + %l1],	%g6
	nop
	set	0x28, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x40, %o4
	stwa	%g4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x88,	 1
	nop
	set	0x50, %i2
	stw	%g2,	[%l7 + %i2]
	nop
	set	0x60, %i6
	ldub	[%l7 + %i6],	%i1
	set	0x08, %o5
	stxa	%o5,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x38, %g5
	lduw	[%l7 + %g5],	%o3
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f2
	fpadd32s	%f16,	%f16,	%f27
	nop
	set	0x3E, %i3
	sth	%l4,	[%l7 + %i3]
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x89
	nop
	set	0x18, %o3
	swap	[%l7 + %o3],	%l0
	set	0x28, %l6
	sta	%f16,	[%l7 + %l6] 0x88
	set	0x58, %o0
	sta	%f21,	[%l7 + %o0] 0x81
	nop
	nop
	setx	0xCB9179D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x1FCA42F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f0,	%f23
	set	0x6C, %g4
	swapa	[%l7 + %g4] 0x88,	%g5
	nop
	set	0x71, %l4
	ldsb	[%l7 + %l4],	%i6
	nop
	set	0x12, %o7
	ldub	[%l7 + %o7],	%o1
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x78, %i7
	stwa	%g3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x1C, %g7
	ldub	[%l7 + %g7],	%l3
	set	0x0A, %i1
	stha	%i0,	[%l7 + %i1] 0x81
	nop
	set	0x3B, %i5
	ldsb	[%l7 + %i5],	%l2
	nop
	set	0x40, %g2
	swap	[%l7 + %g2],	%i3
	set	0x38, %g1
	stxa	%i4,	[%l7 + %g1] 0x88
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x88,	%o6
	nop
	set	0x30, %o1
	std	%f12,	[%l7 + %o1]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%g7
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x88,	%o2
	set	0x38, %g3
	stha	%i5,	[%l7 + %g3] 0x88
	nop
	set	0x1F, %l3
	ldstub	[%l7 + %l3],	%i7
	set	0x64, %l1
	stha	%l1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x56, %i2
	ldsh	[%l7 + %i2],	%l6
	nop
	set	0x58, %i6
	std	%o6,	[%l7 + %i6]
	set	0x14, %o2
	stha	%i2,	[%l7 + %o2] 0x89
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%l5
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x88,	%g6
	nop
	set	0x56, %i4
	sth	%g4,	[%l7 + %i4]
	add	%o0,	%g2,	%i1
	nop
	set	0x10, %l5
	sth	%g1,	[%l7 + %l5]
	ld	[%l7 + 0x0C],	%f22
	or	%o3,	%o5,	%l4
	add	%g5,	%i6,	%l0
	ble,pn	%icc,	loop_170
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%g3
	nop
	set	0x38, %i3
	stx	%l3,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x64]
loop_170:
	nop
	set	0x7C, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f14
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x89,	%i0
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f22
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x81,	%o1
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	fpsub16	%f0,	%f22,	%f8
	st	%f2,	[%l7 + 0x34]
	nop
	set	0x18, %g7
	stw	%l2,	[%l7 + %g7]
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x88,	 3
	nop
	set	0x24, %i1
	stw	%o6,	[%l7 + %i1]
	set	0x7C, %g2
	sta	%f11,	[%l7 + %g2] 0x80
	fpadd32s	%f16,	%f23,	%f21
	ld	[%l7 + 0x40],	%f9
	nop
	set	0x38, %g1
	ldstub	[%l7 + %g1],	%i4
	ld	[%l7 + 0x10],	%f11
	set	0x4C, %i5
	stba	%g7,	[%l7 + %i5] 0x81
	set	0x30, %l2
	stxa	%o2,	[%l7 + %l2] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x65A, 	%sys_tick_cmpr
	nop
	set	0x30, %o1
	std	%f14,	[%l7 + %o1]
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x80,	%i7
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%l6
	set	0x74, %g3
	stha	%o7,	[%l7 + %g3] 0x89
	set	0x54, %l1
	stwa	%i2,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x2F, %o4
	ldub	[%l7 + %o4],	%l5
	nop
	set	0x68, %i2
	std	%f2,	[%l7 + %i2]
	nop
	set	0x32, %l3
	sth	%g6,	[%l7 + %l3]
	add	%l1,	%g4,	%o0
	set	0x58, %i6
	lda	[%l7 + %i6] 0x88,	%f10
	wr	%g2,	%i1,	%set_softint
	set	0x70, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g1
	nop
	set	0x0B, %l0
	ldstub	[%l7 + %l0],	%o5
	nop
	set	0x78, %g5
	lduh	[%l7 + %g5],	%o3
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%g5
	nop
	set	0x0A, %l5
	ldsh	[%l7 + %l5],	%i6
	nop
	set	0x2E, %o2
	ldstub	[%l7 + %o2],	%l0
	set	0x38, %i3
	ldstuba	[%l7 + %i3] 0x81,	%l4
	nop
	set	0x5C, %l6
	ldsw	[%l7 + %l6],	%g3
	set	0x28, %o0
	lda	[%l7 + %o0] 0x80,	%f31
	set	0x08, %o3
	sta	%f16,	[%l7 + %o3] 0x89
	nop
	set	0x32, %l4
	ldsb	[%l7 + %l4],	%i0
	nop
	set	0x38, %o7
	std	%f14,	[%l7 + %o7]
	nop
	set	0x28, %i7
	std	%o0,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x44, %g4
	stw	%l2,	[%l7 + %g4]
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x80,	%i3
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x53, %g7
	stb	%l3,	[%l7 + %g7]
	nop
	set	0x58, %g2
	swap	[%l7 + %g2],	%o6
	set	0x10, %g1
	stxa	%g7,	[%l7 + %g1] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%o2
	set	0x50, %i5
	stxa	%i5,	[%l7 + %i5] 0xe2
	membar	#Sync
	or	%o4,	%l6,	%i7
	bn	%icc,	loop_171
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%o7
	nop
	set	0x20, %l2
	lduw	[%l7 + %l2],	%l5
	st	%f7,	[%l7 + 0x24]
loop_171:
	nop
	set	0x40, %i0
	sta	%f31,	[%l7 + %i0] 0x89
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%i2
	nop
	set	0x74, %l1
	swap	[%l7 + %l1],	%g6
	nop
	set	0x40, %g3
	swap	[%l7 + %g3],	%l1
	st	%f25,	[%l7 + 0x24]
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%g2
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe2,	%i0
	st	%f24,	[%l7 + 0x3C]
	set	0x18, %o5
	stxa	%g1,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x2C, %l0
	lduw	[%l7 + %l0],	%o5
	set	0x58, %i4
	sta	%f30,	[%l7 + %i4] 0x88
	nop
	set	0x60, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x40, %g5
	swap	[%l7 + %g5],	%o3
	nop
	set	0x18, %i3
	ldsb	[%l7 + %i3],	%g5
	or	%i6,	%l0,	%o0
	set	0x28, %l6
	sta	%f15,	[%l7 + %l6] 0x88
	set	0x10, %o2
	stwa	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x81,	 2
	nop
	set	0x6E, %l4
	sth	%i0,	[%l7 + %l4]
	nop
	set	0x38, %o0
	stx	%o1,	[%l7 + %o0]
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%l2
	set	0x40, %g4
	swapa	[%l7 + %g4] 0x80,	%l3
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%i3
	wr	%o6,	%i4,	%softint
	nop
	set	0x3A, %i1
	lduh	[%l7 + %i1],	%o2
	set	0x28, %g7
	stxa	%g7,	[%l7 + %g7] 0x81
	fpsub32s	%f16,	%f0,	%f18
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc2
	set	0x58, %i5
	swapa	[%l7 + %i5] 0x89,	%i5
	set	0x4C, %g2
	sta	%f20,	[%l7 + %g2] 0x80
	ld	[%l7 + 0x1C],	%f25
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f0
	nop
	set	0x74, %o1
	lduh	[%l7 + %o1],	%l6
	nop
	set	0x7C, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCA5, 	%sys_tick_cmpr
	nop
	set	0x23, %l1
	stb	%l5,	[%l7 + %l1]
	fpadd32s	%f29,	%f20,	%f24
	nop
	set	0x64, %i0
	swap	[%l7 + %i0],	%i7
	nop
	set	0x73, %g3
	ldub	[%l7 + %g3],	%i2
	nop
	set	0x2A, %o4
	sth	%l1,	[%l7 + %o4]
	set	0x28, %i6
	lda	[%l7 + %i6] 0x80,	%f17
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x89,	%g6
	nop
	set	0x60, %l0
	swap	[%l7 + %l0],	%g2
	or	%g4,	%i1,	%g1
	ba,a,pt	%xcc,	loop_172
	nop
	set	0x70, %i4
	swap	[%l7 + %i4],	%o3
	and	%o5,	%g5,	%i6
	nop
	set	0x48, %l5
	std	%l0,	[%l7 + %l5]
loop_172:
	nop
	set	0x40, %g5
	stxa	%o0,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x5C, %i3
	lda	[%l7 + %i3] 0x88,	%f25
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%l4
	st	%f17,	[%l7 + 0x2C]
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%i0
	set	0x60, %o3
	stda	%o0,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x28, %l4
	stw	%g3,	[%l7 + %l4]
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%l2
	set	0x60, %i7
	stda	%i2,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%o6
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%i4
	nop
	set	0x22, %l6
	ldstub	[%l7 + %l6],	%l3
	st	%f0,	[%l7 + 0x70]
	set	0x4C, %i1
	sta	%f16,	[%l7 + %i1] 0x80
	nop
	set	0x75, %g7
	ldub	[%l7 + %g7],	%g7
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%o2
	set	0x10, %i5
	stwa	%l6,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x30, %o7
	stxa	%i5,	[%l7 + %o7] 0x80
	set	0x30, %g2
	stxa	%o4,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x58, %l2
	ldxa	[%l7 + %l2] 0x89,	%l5
	nop
	nop
	setx	0x5CB52CF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x430A9372,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f7,	%f17
	nop
	set	0x38, %o6
	ldsb	[%l7 + %o6],	%o7
	and	%i2,	%l1,	%i7
	and	%g6,	%g4,	%g2
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f24
	add	%g1,	%o3,	%i1
	nop
	set	0x40, %i0
	stx	%g5,	[%l7 + %i0]
	nop
	set	0x2C, %g3
	stw	%o5,	[%l7 + %g3]
	nop
	set	0x75, %o4
	ldsb	[%l7 + %o4],	%i6
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x81,	%o0
	nop
	set	0x6C, %o1
	stw	%l0,	[%l7 + %o1]
	nop
	set	0x10, %l3
	stw	%i0,	[%l7 + %l3]
	bgu,a,pt	%icc,	loop_173
	fpsub32	%f24,	%f22,	%f22
	nop
	set	0x60, %i2
	stx	%o1,	[%l7 + %i2]
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 4
loop_173:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%l2
	set	0x30, %i4
	lda	[%l7 + %i4] 0x80,	%f28
	st	%f15,	[%l7 + 0x18]
	ld	[%l7 + 0x20],	%f5
	set	0x70, %g5
	stda	%i2,	[%l7 + %g5] 0x88
	nop
	set	0x74, %i3
	swap	[%l7 + %i3],	%o6
	add	%i4,	%l3,	%g3
	set	0x4C, %l5
	lda	[%l7 + %l5] 0x80,	%f10
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	set	0x64, %o3
	stw	%g7,	[%l7 + %o3]
	set	0x58, %l4
	swapa	[%l7 + %l4] 0x89,	%i5
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%i6
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xea,	%o4
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x6A, %o0
	lduh	[%l7 + %o0],	%l5
	nop
	set	0x26, %g6
	sth	%i2,	[%l7 + %g6]
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f24
	nop
	set	0x08, %g4
	stw	%l1,	[%l7 + %g4]
	nop
	set	0x40, %g7
	std	%o6,	[%l7 + %g7]
	fpsub32s	%f4,	%f18,	%f3
	st	%f23,	[%l7 + 0x14]
	set	0x5E, %i1
	stha	%g6,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x22, %g1
	stb	%i7,	[%l7 + %g1]
	nop
	set	0x40, %i5
	ldstub	[%l7 + %i5],	%g2
	nop
	set	0x35, %o7
	ldstub	[%l7 + %o7],	%g4
	nop
	set	0x13, %g2
	ldstub	[%l7 + %g2],	%o3
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x89,	 4
	set	0x52, %l2
	ldstuba	[%l7 + %l2] 0x88,	%g5
	nop
	set	0x32, %l1
	ldsh	[%l7 + %l1],	%o5
	set	0x10, %i0
	lda	[%l7 + %i0] 0x80,	%f2
	nop
	set	0x18, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x18, %i6
	stx	%g1,	[%l7 + %i6]
	nop
	set	0x18, %o1
	stx	%i6,	[%l7 + %o1]
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x81,	%o0
	set	0x56, %l3
	stba	%l0,	[%l7 + %l3] 0x80
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	nop
	set	0x70, %l0
	std	%o0,	[%l7 + %l0]
	nop
	set	0x17, %g5
	ldstub	[%l7 + %g5],	%i0
	nop
	set	0x20, %i4
	std	%l2,	[%l7 + %i4]
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%i2
	set	0x58, %l5
	stda	%o6,	[%l7 + %l5] 0x88
	nop
	set	0x3E, %o3
	lduh	[%l7 + %o3],	%i4
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%l4
	wr	%l3,	%o2,	%sys_tick
	nop
	set	0x26, %o2
	ldstub	[%l7 + %o2],	%g3
	add	%i5,	%g7,	%l6
	nop
	set	0x30, %i7
	lduw	[%l7 + %i7],	%l5
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	set	0x45, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o4
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x81,	%i2
	nop
	set	0x68, %g4
	prefetch	[%l7 + %g4],	 4
	set	0x0D, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l1
	nop
	set	0x20, %i1
	stw	%g6,	[%l7 + %i1]
	set	0x14, %g7
	stwa	%i7,	[%l7 + %g7] 0x88
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0
	nop
	set	0x38, %o7
	stx	%o7,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x70]
	set	0x0C, %g2
	stha	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x6C, %o6
	sth	%o3,	[%l7 + %o6]
	nop
	set	0x58, %g1
	std	%f20,	[%l7 + %g1]
	and	%i1,	%o5,	%g1
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x81,	%g5
	nop
	set	0x3E, %l1
	ldsh	[%l7 + %l1],	%i6
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%o0
	add	%o1,	%l0,	%i0
	nop
	set	0x50, %g3
	std	%f30,	[%l7 + %g3]
	add	%i3,	%l2,	%i4
	nop
	set	0x56, %i6
	ldstub	[%l7 + %i6],	%l4
	set	0x6C, %o1
	sta	%f3,	[%l7 + %o1] 0x88
	nop
	set	0x4F, %o4
	stb	%o6,	[%l7 + %o4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f0
	set	0x5A, %l3
	stha	%o2,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x60, %g5
	stxa	%g7,	[%l7 + %g5] 0x89
	nop
	set	0x08, %l0
	std	%f6,	[%l7 + %l0]
	nop
	set	0x28, %i4
	swap	[%l7 + %i4],	%l6
	set	0x7C, %i3
	stwa	%l5,	[%l7 + %i3] 0x89
	set	0x24, %l5
	stha	%o4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%i2
	fpsub16	%f6,	%f20,	%f4
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x80,	 4
	nop
	set	0x28, %i7
	stw	%g6,	[%l7 + %i7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%g2
	nop
	set	0x18, %o0
	std	%o6,	[%l7 + %o0]
	ble	%icc,	loop_174
	nop
	set	0x33, %o2
	ldstub	[%l7 + %o2],	%g4
	set	0x28, %l6
	lda	[%l7 + %l6] 0x80,	%f14
loop_174:
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x18, %g4
	ldub	[%l7 + %g4],	%o3
	or	%i1,	%o5,	%i7
	nop
	set	0x20, %i1
	std	%f30,	[%l7 + %i1]
	nop
	set	0x4C, %g6
	lduw	[%l7 + %g6],	%g5
	fpadd32s	%f30,	%f28,	%f4
	nop
	set	0x28, %i5
	std	%i6,	[%l7 + %i5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%o1
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f20
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f20
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%i0
	and	%i3,	%l2,	%i4
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x20, %g2
	stxa	%l4,	[%l7 + %g2] 0x88
	add	%o6,	%o0,	%l3
	nop
	set	0x58, %g1
	stx	%g3,	[%l7 + %g1]
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x1C, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x0E, %g3
	ldsh	[%l7 + %g3],	%g7
	or	%l6,	%l5,	%i2
	set	0x10, %l1
	stxa	%l1,	[%l7 + %l1] 0x81
	nop
	set	0x2D, %o1
	ldstub	[%l7 + %o1],	%g6
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%o4
	or	%g2,	%i5,	%g4
	nop
	set	0x4C, %i2
	ldsb	[%l7 + %i2],	%o3
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%o7
	add	%i1,	%o5,	%i7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xea,	%i6
	or	%g5,	%g1,	%l0
	set	0x40, %l3
	sta	%f3,	[%l7 + %l3] 0x81
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%i3
	set	0x38, %l0
	lda	[%l7 + %l0] 0x81,	%f6
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%i0
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x89,	%i4
	nop
	set	0x14, %l5
	lduw	[%l7 + %l5],	%l2
	nop
	set	0x60, %o5
	std	%f28,	[%l7 + %o5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%l4
	set	0x08, %o3
	stda	%l2,	[%l7 + %o3] 0x80
	fpadd32s	%f2,	%f12,	%f6
	nop
	set	0x18, %o0
	std	%g2,	[%l7 + %o0]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x80
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%g7
	wr	%l6,	%o2,	%set_softint
	nop
	set	0x17, %o2
	ldsb	[%l7 + %o2],	%i2
	set	0x3A, %l6
	stha	%l5,	[%l7 + %l6] 0x89
	set	0x56, %l4
	stha	%g6,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x34, %i1
	sta	%f29,	[%l7 + %i1] 0x80
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xeb,	%l0
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x81,	 1
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xeb,	%i4
	set	0x48, %o6
	stda	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x48, %g7
	stda	%o2,	[%l7 + %g7] 0x81
	set	0x10, %g2
	stwa	%g4,	[%l7 + %g2] 0x88
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%i1
	nop
	set	0x60, %i0
	std	%f22,	[%l7 + %i0]
	ld	[%l7 + 0x1C],	%f7
	nop
	set	0x78, %l1
	prefetch	[%l7 + %l1],	 2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x48, %i6
	stxa	%o5,	[%l7 + %i6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x4C],	%f22
	set	0x48, %o1
	stwa	%i7,	[%l7 + %o1] 0x80
	set	0x56, %o4
	stha	%o7,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x78, %i2
	lda	[%l7 + %i2] 0x80,	%f12
	set	0x50, %g5
	stda	%i6,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f0
	nop
	set	0x29, %i4
	stb	%g5,	[%l7 + %i4]
	nop
	set	0x70, %l3
	stx	%g1,	[%l7 + %l3]
	nop
	set	0x58, %i3
	stw	%o1,	[%l7 + %i3]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%i2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	set	0x30, %o0
	stda	%i0,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x4C, %i7
	lda	[%l7 + %i7] 0x88,	%f21
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x88,	%l0
	nop
	set	0x56, %l6
	ldsb	[%l7 + %l6],	%i4
	nop
	set	0x2C, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x60, %i1
	stw	%l2,	[%l7 + %i1]
	set	0x22, %l4
	stba	%o6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x2C, %g6
	stw	%l4,	[%l7 + %g6]
	and	%g3,	%l3,	%g7
	add	%o0,	%l6,	%o2
	nop
	set	0x78, %o7
	std	%i2,	[%l7 + %o7]
	set	0x2C, %i5
	stba	%g6,	[%l7 + %i5] 0x80
	and	%l1,	%o4,	%i5
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x81,	%g2
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%o3
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x81,	%g4
	set	0x7E, %l2
	stba	%i1,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x44, %g1
	sth	%o5,	[%l7 + %g1]
	nop
	set	0x48, %i0
	std	%l4,	[%l7 + %i0]
	and	%i7,	%i6,	%o7
	set	0x68, %g2
	stxa	%g1,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x0E, %l1
	sth	%g5,	[%l7 + %l1]
	or	%i3,	%o1,	%i0
	nop
	set	0x24, %i6
	sth	%i4,	[%l7 + %i6]
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x80,	 0
	set	0x15, %i2
	stba	%l0,	[%l7 + %i2] 0x88
	set	0x48, %g5
	stxa	%l4,	[%l7 + %g5] 0xea
	membar	#Sync
	ld	[%l7 + 0x20],	%f17
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x88,	%g3
	nop
	set	0x68, %o4
	std	%l2,	[%l7 + %o4]
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x50, %i3
	stx	%o6,	[%l7 + %i3]
	nop
	set	0x57, %l3
	ldsb	[%l7 + %l3],	%o0
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%g6
	nop
	set	0x76, %o0
	ldstub	[%l7 + %o0],	%l6
	and	%o2,	%i2,	%l1
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%g6
	st	%fsr,	[%l7 + 0x5C]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	and	%i5,	%o4,	%o3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xcc
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x2C, %i7
	stb	%g2,	[%l7 + %i7]
	set	0x6F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g4
	set	0x24, %g6
	sta	%f18,	[%l7 + %g6] 0x81
	and	%o5,	%l5,	%i1
	and	%i7,	%o7,	%i6
	set	0x74, %l4
	stha	%g5,	[%l7 + %l4] 0xe3
	membar	#Sync
	ld	[%l7 + 0x64],	%f10
	st	%f0,	[%l7 + 0x28]
	nop
	set	0x7C, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x32, %o6
	stha	%g1,	[%l7 + %o6] 0xe3
	membar	#Sync
	or	%o1,	%i0,	%i3
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f16
	nop
	set	0x1C, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%i4
	set	0x50, %i0
	stwa	%l2,	[%l7 + %i0] 0x81
	nop
	set	0x6C, %g7
	ldsh	[%l7 + %g7],	%l0
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%l4
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xea,	%g2
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%l3
	nop
	set	0x40, %g2
	stx	%o0,	[%l7 + %g2]
	nop
	set	0x30, %o1
	ldsw	[%l7 + %o1],	%o6
	st	%f3,	[%l7 + 0x48]
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x80,	%g7
	nop
	set	0x44, %i2
	sth	%l6,	[%l7 + %i2]
	nop
	set	0x32, %o4
	ldstub	[%l7 + %o4],	%o2
	nop
	set	0x6B, %i4
	ldub	[%l7 + %i4],	%l1
	or	%g6,	%i2,	%i5
	nop
	set	0x0A, %i3
	sth	%o3,	[%l7 + %i3]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f0
	nop
	set	0x70, %l5
	std	%g2,	[%l7 + %l5]
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	nop
	set	0x18, %o3
	stw	%o5,	[%l7 + %o3]
	ld	[%l7 + 0x50],	%f10
	nop
	set	0x48, %o0
	ldsh	[%l7 + %o0],	%l5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf9
	membar	#Sync
	wr	%i1,	%i7,	%set_softint
	ld	[%l7 + 0x1C],	%f24
	nop
	set	0x60, %o2
	lduh	[%l7 + %o2],	%o4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%i6
	nop
	set	0x48, %o5
	ldsh	[%l7 + %o5],	%g5
	nop
	set	0x78, %i1
	std	%f20,	[%l7 + %i1]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f30
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%o1
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 4
	and	%i0,	%g1,	%i4
	nop
	set	0x3D, %l4
	ldub	[%l7 + %l4],	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%l2
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%l4
	nop
	set	0x44, %o6
	stw	%l3,	[%l7 + %o6]
	set	0x3A, %o7
	stha	%o6,	[%l7 + %o7] 0x89
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%o0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f0
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x80,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x95F, 	%tick_cmpr
	nop
	set	0x3C, %l1
	lduh	[%l7 + %l1],	%g6
	st	%f3,	[%l7 + 0x40]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xea,	%i2
	or	%i5,	%o3,	%o2
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%g2
	nop
	set	0x6C, %i6
	swap	[%l7 + %i6],	%o5
	nop
	set	0x54, %g5
	ldstub	[%l7 + %g5],	%l5
	nop
	set	0x54, %i2
	ldsw	[%l7 + %i2],	%g4
	bn,a	%xcc,	loop_175
	wr 	%g0, 	0x6, 	%fprs
	st	%f27,	[%l7 + 0x74]
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
loop_175:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%g5
	or	%o1,	%i6,	%g1
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	set	0x1C, %o4
	stba	%i3,	[%l7 + %o4] 0x81
	fpadd16	%f4,	%f4,	%f12
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l0
	nop
	set	0x6E, %l5
	lduh	[%l7 + %l5],	%l4
	wr	%l3,	%o6,	%clear_softint
	set	0x2C, %l0
	sta	%f0,	[%l7 + %l0] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%o0
	set	0x30, %l3
	ldda	[%l7 + %l3] 0xeb,	%i6
	set	0x7C, %o0
	stwa	%l1,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%g6
	or	%g6,	%i2,	%i5
	nop
	set	0x60, %o2
	ldstub	[%l7 + %o2],	%o3
	set	0x40, %o5
	stxa	%o2,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x10, %i1
	std	%f22,	[%l7 + %i1]
	nop
	set	0x60, %o3
	std	%f30,	[%l7 + %o3]
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x88,	%g2
	and	%o5,	%g4,	%l5
	set	0x20, %i7
	stda	%o4,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x0B, %l4
	ldub	[%l7 + %l4],	%i1
	nop
	set	0x64, %i5
	stw	%i7,	[%l7 + %i5]
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x88,	%g5
	nop
	set	0x4C, %o6
	swap	[%l7 + %o6],	%o7
	nop
	set	0x30, %g4
	prefetch	[%l7 + %g4],	 1
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%i6
	nop
	set	0x7C, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%g0
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x88,	%o0
	set	0x60, %g7
	stwa	%i0,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%i4
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x80,	%l2
	nop
	set	0x50, %g5
	stw	%i3,	[%l7 + %g5]
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x88,	%l0
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%f12
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f16
	set	0x6C, %i4
	stha	%l3,	[%l7 + %i4] 0x80
	set	0x2C, %o4
	ldstuba	[%l7 + %o4] 0x81,	%l4
	set	0x40, %l5
	stwa	%g3,	[%l7 + %l5] 0x81
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd2
	set	0x35, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o6
	nop
	set	0x43, %l3
	ldub	[%l7 + %l3],	%o0
	nop
	set	0x48, %l6
	stw	%l6,	[%l7 + %l6]
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x80,	%l1
	nop
	set	0x58, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x28, %o5
	stx	%g6,	[%l7 + %o5]
	fpsub32s	%f8,	%f12,	%f28
	nop
	set	0x5E, %i1
	lduh	[%l7 + %i1],	%i2
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%g7
	st	%f15,	[%l7 + 0x2C]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc4
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc2
	nop
	set	0x78, %i5
	std	%o2,	[%l7 + %i5]
	nop
	set	0x4C, %o7
	stw	%i5,	[%l7 + %o7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%l5
	st	%fsr,	[%l7 + 0x3C]
	bne,a,pn	%xcc,	loop_176
	or	%o4,	%o5,	%i1
	set	0x3C, %g4
	lda	[%l7 + %g4] 0x80,	%f16
loop_176:
	nop
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf9
	membar	#Sync
	nop
	set	0x51, %i0
	stb	%i7,	[%l7 + %i0]
	nop
	set	0x1F, %g1
	ldub	[%l7 + %g1],	%o7
	st	%f25,	[%l7 + 0x14]
	set	0x58, %l2
	lda	[%l7 + %l2] 0x88,	%f1
	set	0x41, %g7
	stba	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x50, %l1
	ldsw	[%l7 + %l1],	%g1
	nop
	set	0x18, %i6
	ldsw	[%l7 + %i6],	%g5
	set	0x54, %g3
	sta	%f18,	[%l7 + %g3] 0x89
	nop
	set	0x08, %g2
	stx	%i0,	[%l7 + %g2]
	nop
	set	0x75, %g5
	stb	%o1,	[%l7 + %g5]
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 3
	set	0x7C, %i4
	sta	%f31,	[%l7 + %i4] 0x88
	set	0x60, %o4
	stda	%l2,	[%l7 + %o4] 0x80
	set	0x20, %l5
	swapa	[%l7 + %l5] 0x80,	%i3
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x88,	%i4
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f20
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%l2
	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%l0
	nop
	set	0x54, %o2
	ldsw	[%l7 + %o2],	%g3
	ld	[%l7 + 0x68],	%f15
	wr	%o6,	%o0,	%clear_softint
	set	0x30, %l6
	stba	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x18, %i1
	stx	%l1,	[%l7 + %i1]
	set	0x64, %g6
	stha	%g6,	[%l7 + %g6] 0x81
	nop
	set	0x41, %o5
	ldsb	[%l7 + %o5],	%l6
	add	%i2,	%g7,	%o3
	and	%o2,	%i5,	%g4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc8
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%g2
	nop
	set	0x18, %i5
	stx	%o4,	[%l7 + %i5]
	nop
	set	0x48, %l4
	lduw	[%l7 + %l4],	%o5
	set	0x58, %g4
	stwa	%l5,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x5C, %o6
	lda	[%l7 + %o6] 0x80,	%f25
	nop
	set	0x46, %i0
	lduh	[%l7 + %i0],	%i7
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x30, %o7
	stx	%i1,	[%l7 + %o7]
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x81,	 3
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x80,	 2
	nop
	set	0x44, %g7
	ldsw	[%l7 + %g7],	%g5
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x60, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x30, %l1
	ldsw	[%l7 + %l1],	%o7
	nop
	set	0x78, %g3
	lduw	[%l7 + %g3],	%o1
	nop
	set	0x48, %g5
	stx	%l2,	[%l7 + %g5]
	nop
	set	0x6F, %i2
	ldub	[%l7 + %i2],	%i3
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x89,	%f22
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf9,	%f16
	nop
	set	0x0C, %l5
	sth	%i4,	[%l7 + %l5]
	nop
	set	0x74, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x20, %o1
	stda	%l2,	[%l7 + %o1] 0x89
	nop
	set	0x52, %l3
	ldsh	[%l7 + %l3],	%l0
	add	%g3,	%i0,	%o6
	nop
	set	0x7D, %i3
	stb	%l4,	[%l7 + %i3]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd2
	fpsub16s	%f4,	%f13,	%f8
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f12
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%o0
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x70]
	set	0x34, %l6
	sta	%f7,	[%l7 + %l6] 0x88
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x0C, %o2
	stw	%l6,	[%l7 + %o2]
	add	%g6,	%i2,	%g7
	set	0x19, %g6
	stba	%o3,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%i5
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f30
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x81
	set	0x27, %i7
	stba	%g4,	[%l7 + %i7] 0x81
	or	%o4,	%o5,	%l5
	nop
	set	0x08, %l4
	lduh	[%l7 + %l4],	%g2
	nop
	set	0x68, %g4
	lduw	[%l7 + %g4],	%i7
	set	0x43, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i1
	set	0x6C, %i5
	sta	%f15,	[%l7 + %i5] 0x80
	nop
	set	0x7C, %i0
	ldsw	[%l7 + %i0],	%i6
	set	0x68, %g1
	stda	%g4,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x24, %l2
	lda	[%l7 + %l2] 0x81,	%f21
	nop
	set	0x50, %g7
	stw	%g1,	[%l7 + %g7]
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	set	0x70, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o1
	wr	%l2,	%i3,	%sys_tick
	nop
	set	0x34, %i6
	stb	%l3,	[%l7 + %i6]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%i4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%o6
	nop
	set	0x4C, %g5
	ldsw	[%l7 + %g5],	%i0
	nop
	set	0x38, %g2
	std	%f18,	[%l7 + %g2]
	set	0x2C, %i2
	lda	[%l7 + %i2] 0x89,	%f30
	nop
	set	0x34, %i4
	swap	[%l7 + %i4],	%l4
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xeb,	%l0
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 1
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f16
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xcc
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x89,	 1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f0
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x38, %i1
	stw	%g6,	[%l7 + %i1]
	nop
	set	0x60, %o2
	std	%f26,	[%l7 + %o2]
	nop
	set	0x2C, %i3
	lduh	[%l7 + %i3],	%l6
	nop
	set	0x24, %g6
	stw	%g7,	[%l7 + %g6]
	set	0x54, %o3
	lda	[%l7 + %o3] 0x80,	%f30
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f2
	nop
	set	0x78, %l4
	swap	[%l7 + %l4],	%i2
	set	0x35, %g4
	stba	%o3,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x53, %i7
	ldstub	[%l7 + %i7],	%i5
	st	%fsr,	[%l7 + 0x50]
	set	0x44, %o6
	lda	[%l7 + %o6] 0x81,	%f16
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%o2
	nop
	set	0x20, %i5
	stb	%g4,	[%l7 + %i5]
	nop
	set	0x70, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc8
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f0
	nop
	set	0x2C, %l1
	lduh	[%l7 + %l1],	%o4
	nop
	set	0x36, %i6
	lduh	[%l7 + %i6],	%o5
	nop
	set	0x6C, %g3
	lduw	[%l7 + %g3],	%l5
	nop
	set	0x74, %o7
	ldstub	[%l7 + %o7],	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%i6
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f22
	set	0x78, %i2
	stda	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x88,	%g5
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%g1
	set	0x76, %g2
	stha	%o7,	[%l7 + %g2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x3A, %o4
	ldsh	[%l7 + %o4],	%o1
	and	%i3,	%l2,	%l3
	nop
	set	0x70, %o1
	ldsw	[%l7 + %o1],	%i4
	nop
	set	0x20, %l3
	ldsw	[%l7 + %l3],	%g3
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%o6,	%l0,	%l4
	set	0x12, %o0
	stha	%l1,	[%l7 + %o0] 0x80
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%o0
	fpsub16	%f28,	%f18,	%f8
	nop
	set	0x50, %o2
	ldsw	[%l7 + %o2],	%i0
	st	%f18,	[%l7 + 0x34]
	ld	[%l7 + 0x14],	%f6
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%l6
	nop
	set	0x24, %g6
	swap	[%l7 + %g6],	%g6
	nop
	set	0x2B, %o3
	ldsb	[%l7 + %o3],	%i2
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%o3
	or	%o2,	%i5,	%g4
	nop
	set	0x08, %l4
	ldub	[%l7 + %l4],	%o5
	add	%l5,	%g2,	%i7
	fpsub32s	%f12,	%f2,	%f8
	nop
	set	0x28, %o5
	std	%f12,	[%l7 + %o5]
	set	0x70, %i7
	sta	%f6,	[%l7 + %i7] 0x89
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x89,	%o4
	set	0x5C, %i0
	stha	%i6,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x78, %i5
	stxa	%i1,	[%l7 + %i5] 0x89
	nop
	set	0x71, %l2
	ldstub	[%l7 + %l2],	%g5
	nop
	set	0x11, %g1
	ldsb	[%l7 + %g1],	%g1
	set	0x20, %g4
	ldxa	[%l7 + %g4] 0x89,	%o1
	ld	[%l7 + 0x40],	%f11
	nop
	set	0x30, %g7
	lduw	[%l7 + %g7],	%o7
	st	%f24,	[%l7 + 0x1C]
	nop
	set	0x60, %i6
	stx	%i3,	[%l7 + %i6]
	nop
	set	0x17, %g3
	ldsb	[%l7 + %g3],	%l3
	nop
	set	0x78, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x1C, %g5
	stha	%l2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x4E, %o7
	sth	%g3,	[%l7 + %o7]
	add	%i4,	%o6,	%l4
	set	0x58, %i2
	stda	%l0,	[%l7 + %i2] 0x88
	nop
	set	0x74, %i4
	prefetch	[%l7 + %i4],	 0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd2
	and	%o0,	%i0,	%l6
	nop
	set	0x76, %o4
	sth	%g6,	[%l7 + %o4]
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f2
	nop
	set	0x40, %l3
	lduw	[%l7 + %l3],	%i2
	nop
	set	0x20, %l5
	ldsw	[%l7 + %l5],	%l1
	nop
	set	0x3C, %l0
	stb	%o3,	[%l7 + %l0]
	set	0x30, %o0
	lda	[%l7 + %o0] 0x88,	%f31
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%g7
	nop
	set	0x51, %l6
	ldstub	[%l7 + %l6],	%g4
	set	0x10, %o2
	swapa	[%l7 + %o2] 0x81,	%i5
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xe2,	%o4
	nop
	set	0x5E, %g6
	sth	%g2,	[%l7 + %g6]
	set	0x58, %o3
	swapa	[%l7 + %o3] 0x88,	%l5
	ld	[%l7 + 0x78],	%f12
	nop
	set	0x1F, %l4
	ldsb	[%l7 + %l4],	%i7
	nop
	set	0x57, %o5
	ldub	[%l7 + %o5],	%o4
	nop
	set	0x35, %i7
	ldstub	[%l7 + %i7],	%i6
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x81,	%g4
	set	0x10, %i1
	ldda	[%l7 + %i1] 0xe2,	%i0
	set	0x0C, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o1
	nop
	set	0x7F, %i5
	stb	%o7,	[%l7 + %i5]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%i3
	nop
	set	0x1C, %g1
	swap	[%l7 + %g1],	%l2
	bg,a	%icc,	loop_177
	nop
	set	0x78, %l2
	lduh	[%l7 + %l2],	%l3
	ld	[%l7 + 0x7C],	%f9
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x81,	%g2
loop_177:
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%i4
	or	%l4,	%l0,	%o6
	and	%i0,	%l6,	%o0
	wr	%g6,	%i2,	%pic
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%o3
	set	0x28, %g3
	stxa	%o2,	[%l7 + %g3] 0x89
	nop
	set	0x78, %l1
	stx	%g4,	[%l7 + %l1]
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x89,	 2
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x80,	 2
	nop
	set	0x54, %o7
	stw	%o5,	[%l7 + %o7]
	nop
	set	0x50, %i2
	stw	%l5,	[%l7 + %i2]
	set	0x30, %g2
	lda	[%l7 + %g2] 0x80,	%f21
	set	0x60, %o4
	lda	[%l7 + %o4] 0x89,	%f11
	nop
	set	0x60, %i4
	std	%g2,	[%l7 + %i4]
	add	%o4,	%i7,	%i6
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x89,	%g5
	nop
	set	0x78, %o1
	stx	%o1,	[%l7 + %o1]
	add	%o7,	%g1,	%i1
	st	%fsr,	[%l7 + 0x24]
	set	0x38, %l5
	stda	%i2,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%l2
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f22
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x66, %l6
	ldstub	[%l7 + %l6],	%g3
	ld	[%l7 + 0x34],	%f31
	set	0x10, %o2
	stda	%l4,	[%l7 + %o2] 0x81
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%l0
	fpadd16	%f14,	%f8,	%f16
	st	%f31,	[%l7 + 0x4C]
	nop
	set	0x7F, %i3
	ldub	[%l7 + %i3],	%i4
	nop
	set	0x10, %o3
	std	%f4,	[%l7 + %o3]
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x37, %g6
	ldstub	[%l7 + %g6],	%o6
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x26, %o5
	ldub	[%l7 + %o5],	%l6
	wr	%i0,	%o0,	%pic
	nop
	set	0x18, %i1
	lduw	[%l7 + %i1],	%i2
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x89,	%l1
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%o3
	set	0x0C, %i5
	lda	[%l7 + %i5] 0x89,	%f7
	or	%g6,	%g4,	%i5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xda
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f20
	set	0x15, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9D1, 	%tick_cmpr
	nop
	set	0x34, %g3
	ldsw	[%l7 + %g3],	%g2
	fpsub32	%f20,	%f30,	%f8
	nop
	set	0x52, %l1
	ldsh	[%l7 + %l1],	%l5
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%i7
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%i6
	set	0x70, %o7
	stxa	%o4,	[%l7 + %o7] 0x89
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x80,	%g4
	nop
	set	0x53, %g4
	stb	%o7,	[%l7 + %g4]
	nop
	set	0x19, %g2
	stb	%g1,	[%l7 + %g2]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1269
!	Type a   	: 27
!	Type cti   	: 20
!	Type x   	: 535
!	Type f   	: 38
!	Type i   	: 111
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
	set	0x5,	%g2
	set	0xA,	%g3
	set	0xD,	%g4
	set	0x0,	%g5
	set	0xA,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xA,	%i1
	set	-0x7,	%i2
	set	-0xE,	%i3
	set	-0xB,	%i4
	set	-0x8,	%i5
	set	-0x3,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x20412978,	%l0
	set	0x1B8398DC,	%l1
	set	0x1D0AC761,	%l2
	set	0x2CAF7650,	%l3
	set	0x464EDEEB,	%l4
	set	0x35629BB5,	%l5
	set	0x09791F6A,	%l6
	!# Output registers
	set	0x06AC,	%o0
	set	-0x0CF3,	%o1
	set	0x1291,	%o2
	set	-0x14B2,	%o3
	set	0x0306,	%o4
	set	0x0C95,	%o5
	set	0x056A,	%o6
	set	-0x0112,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	nop
	set	0x73, %i4
	stb	%i1,	[%l7 + %i4]
	nop
	set	0x48, %l3
	sth	%o1,	[%l7 + %l3]
	set	0x50, %o1
	stda	%i2,	[%l7 + %o1] 0x80
	set	0x18, %l5
	stxa	%l2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x0C, %o4
	swap	[%l7 + %o4],	%g3
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x88,	%l4
	nop
	set	0x68, %o0
	lduw	[%l7 + %o0],	%l3
	nop
	set	0x68, %o2
	prefetch	[%l7 + %o2],	 0
	set	0x68, %l0
	stxa	%i4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x2C, %i3
	ldsw	[%l7 + %i3],	%o6
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%l6
	and	%l0,	%i0,	%o0
	nop
	set	0x20, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x45, %g6
	ldsb	[%l7 + %g6],	%l1
	and	%i2,	%g6,	%g4
	nop
	set	0x54, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x30, %i1
	stx	%i5,	[%l7 + %i1]
	nop
	set	0x10, %o5
	stw	%g7,	[%l7 + %o5]
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%o2
	fpsub32	%f30,	%f24,	%f20
	set	0x30, %i0
	lda	[%l7 + %i0] 0x88,	%f10
	nop
	nop
	setx	0x46C05B72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x10F361CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f19,	%f2
	nop
	set	0x28, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x48, %g1
	lduw	[%l7 + %g1],	%o5
	nop
	set	0x6C, %l2
	ldsh	[%l7 + %l2],	%g2
	and	%l5,	%o2,	%i7
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 3
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	set	0x60, %g3
	swapa	[%l7 + %g3] 0x80,	%g5
	nop
	set	0x60, %g5
	stx	%o7,	[%l7 + %g5]
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0
	nop
	set	0x3C, %i2
	ldsw	[%l7 + %i2],	%g1
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%i3
	ld	[%l7 + 0x7C],	%f25
	wr	%i1,	%l2,	%sys_tick
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%g2
	ld	[%l7 + 0x1C],	%f21
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%l4
	nop
	set	0x60, %g4
	swap	[%l7 + %g4],	%i4
	set	0x50, %o1
	stda	%l2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x60, %l5
	stda	%i6,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x43, %o4
	stba	%o6,	[%l7 + %o4] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l0
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%o0
	nop
	set	0x38, %l6
	std	%i2,	[%l7 + %l6]
	set	0x78, %o0
	stxa	%g6,	[%l7 + %o0] 0x89
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f0
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%l1
	and	%i5,	%g7,	%g4
	nop
	set	0x51, %o2
	ldub	[%l7 + %o2],	%o5
	fpadd32	%f10,	%f2,	%f12
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %o3
	std	%o2,	[%l7 + %o3]
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x88,	%l5
	nop
	set	0x18, %g6
	stx	%o2,	[%l7 + %g6]
	nop
	set	0x74, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x81,	%g2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f0
	nop
	set	0x60, %o5
	std	%i6,	[%l7 + %o5]
	set	0x33, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g5
	set	0x64, %i0
	lda	[%l7 + %i0] 0x81,	%f4
	nop
	set	0x7E, %g1
	lduh	[%l7 + %g1],	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%o1
	set	0x64, %g7
	lda	[%l7 + %g7] 0x88,	%f24
	wr	%i1,	%l2,	%softint
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xd8
	nop
	set	0x66, %g3
	stb	%i3,	[%l7 + %g3]
	set	0x68, %g5
	stba	%l4,	[%l7 + %g5] 0x88
	set	0x18, %l2
	swapa	[%l7 + %l2] 0x81,	%g3
	nop
	set	0x59, %i2
	ldstub	[%l7 + %i2],	%l3
	nop
	set	0x50, %o7
	stx	%i4,	[%l7 + %o7]
	and	%l6,	%i0,	%l0
	set	0x58, %g2
	stwa	%o6,	[%l7 + %g2] 0x80
	nop
	set	0x50, %i6
	sth	%o0,	[%l7 + %i6]
	nop
	set	0x12, %g4
	lduh	[%l7 + %g4],	%i2
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x89,	%l1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%g7
	set	0x08, %l5
	stwa	%i5,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%o5,	%g4,	%o3
	set	0x68, %o4
	ldxa	[%l7 + %o4] 0x89,	%o2
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x89
	set	0x7A, %l6
	stba	%g2,	[%l7 + %l6] 0x80
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f14
	set	0x38, %o0
	lda	[%l7 + %o0] 0x89,	%f10
	nop
	set	0x31, %i3
	ldub	[%l7 + %i3],	%i6
	or	%l5,	%g5,	%o4
	nop
	set	0x78, %l0
	swap	[%l7 + %l0],	%i7
	nop
	set	0x0C, %o2
	lduh	[%l7 + %o2],	%g1
	nop
	set	0x24, %l4
	ldsh	[%l7 + %l4],	%o7
	or	%i1,	%l2,	%i3
	fpadd32s	%f12,	%f19,	%f10
	nop
	set	0x1C, %o3
	prefetch	[%l7 + %o3],	 2
	st	%f21,	[%l7 + 0x0C]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x40, %g6
	stx	%o1,	[%l7 + %g6]
	set	0x24, %i1
	stwa	%l4,	[%l7 + %i1] 0x89
	set	0x11, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l3
	add	%i4,	%l6,	%i0
	set	0x38, %o5
	swapa	[%l7 + %o5] 0x81,	%l0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%o0
	nop
	set	0x71, %i5
	ldstub	[%l7 + %i5],	%i2
	set	0x20, %i0
	swapa	[%l7 + %i0] 0x80,	%g3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%l1
	nop
	set	0x1A, %g1
	ldstub	[%l7 + %g1],	%i5
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%o4
	ld	[%l7 + 0x44],	%f24
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%g4
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%o3
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%o2
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%f28
	set	0x08, %i2
	stba	%g2,	[%l7 + %i2] 0x80
	set	0x68, %g2
	stxa	%i6,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x18, %g4
	stxa	%g5,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x78, %o1
	stxa	%l5,	[%l7 + %o1] 0x81
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f16
	nop
	set	0x5C, %i6
	ldsh	[%l7 + %i6],	%o4
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%i1
	nop
	set	0x68, %l6
	sth	%o7,	[%l7 + %l6]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc8
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xeb,	%l2
	set	0x36, %o0
	stha	%i3,	[%l7 + %o0] 0x88
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%l4
	nop
	set	0x7B, %l0
	stb	%o1,	[%l7 + %l0]
	st	%f25,	[%l7 + 0x54]
	nop
	set	0x34, %l4
	ldstub	[%l7 + %l4],	%i4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i0
	nop
	set	0x27, %o2
	stb	%l3,	[%l7 + %o2]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x89
	set	0x17, %g6
	stba	%o6,	[%l7 + %g6] 0x88
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xe3,	%l0
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f12
	set	0x14, %i0
	stha	%g3,	[%l7 + %i0] 0x81
	set	0x68, %o6
	sta	%f6,	[%l7 + %o6] 0x88
	or	%g6,	%i2,	%l1
	nop
	set	0x20, %i5
	stx	%o5,	[%l7 + %i5]
	st	%f12,	[%l7 + 0x38]
	nop
	set	0x38, %g7
	stb	%g4,	[%l7 + %g7]
	set	0x68, %l1
	sta	%f31,	[%l7 + %l1] 0x88
	fpadd32s	%f29,	%f25,	%f10
	set	0x3C, %g1
	stha	%i5,	[%l7 + %g1] 0x81
	nop
	set	0x28, %g5
	stx	%o2,	[%l7 + %g5]
	nop
	set	0x48, %g3
	std	%g6,	[%l7 + %g3]
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%g2
	nop
	set	0x18, %i2
	std	%f2,	[%l7 + %i2]
	set	0x50, %g2
	stda	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x6A, %l2
	ldsh	[%l7 + %l2],	%g5
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%o2
	nop
	set	0x57, %l5
	ldstub	[%l7 + %l5],	%l5
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x57, %g4
	ldstub	[%l7 + %g4],	%o4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xca
	set	0x3E, %i4
	stha	%g1,	[%l7 + %i4] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	set	0x60, %l3
	sta	%f13,	[%l7 + %l3] 0x80
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%o7
	set	0x78, %o4
	stxa	%i1,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x74, %i3
	lda	[%l7 + %i3] 0x80,	%f18
	set	0x56, %l0
	stha	%i3,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xeb,	%l4
	nop
	set	0x41, %o2
	stb	%l2,	[%l7 + %o2]
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%i4
	nop
	set	0x29, %l4
	ldstub	[%l7 + %l4],	%l6
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%o1
	nop
	set	0x21, %o5
	stb	%i0,	[%l7 + %o5]
	nop
	set	0x48, %g6
	ldsh	[%l7 + %g6],	%o6
	set	0x28, %i1
	stxa	%o0,	[%l7 + %i1] 0x81
	nop
	set	0x58, %o6
	ldsh	[%l7 + %o6],	%l0
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%g3
	fpsub32s	%f13,	%f0,	%f5
	and	%g6,	%i2,	%l3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o5
	nop
	set	0x78, %g7
	stx	%g4,	[%l7 + %g7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%i5
	and	%g2,	%i6,	%g7
	set	0x74, %i5
	lda	[%l7 + %i5] 0x80,	%f3
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%g5
	nop
	set	0x14, %l1
	ldsw	[%l7 + %l1],	%o3
	add	%o4,	%l5,	%g1
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x88,	%o7
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xc8
	set	0x50, %g3
	stxa	%i1,	[%l7 + %g3] 0x88
	nop
	set	0x60, %g2
	sth	%i7,	[%l7 + %g2]
	nop
	set	0x6C, %i2
	ldstub	[%l7 + %i2],	%l4
	be	%icc,	loop_178
	nop
	set	0x28, %l2
	std	%f2,	[%l7 + %l2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%i4
loop_178:
	nop
	set	0x11, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l6
	bne	%icc,	loop_179
	be,a,pt	%icc,	loop_180
	nop
	set	0x6B, %l5
	ldub	[%l7 + %l5],	%o1
	and	%i0,	%l2,	%o0
loop_179:
	nop
	set	0x18, %g4
	stx	%l0,	[%l7 + %g4]
loop_180:
	ld	[%l7 + 0x50],	%f15
	nop
	set	0x1C, %l6
	stw	%g3,	[%l7 + %l6]
	set	0x44, %i4
	lda	[%l7 + %i4] 0x89,	%f21
	add	%o6,	%g6,	%l3
	nop
	set	0x20, %i6
	std	%f12,	[%l7 + %i6]
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%f4
	set	0x20, %i3
	stda	%i2,	[%l7 + %i3] 0x81
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x68, %o0
	ldsb	[%l7 + %o0],	%l1
	set	0x54, %o2
	stha	%g4,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x5A, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o2
	nop
	set	0x20, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%i5
	set	0x68, %o3
	stda	%o4,	[%l7 + %o3] 0x88
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	nop
	set	0x62, %i1
	sth	%g2,	[%l7 + %i1]
	st	%f24,	[%l7 + 0x3C]
	nop
	set	0x38, %g6
	stx	%g7,	[%l7 + %g6]
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x88,	%f18
	set	0x70, %g7
	stxa	%g5,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x58, %o6
	stda	%i6,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o4
	st	%fsr,	[%l7 + 0x54]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	set	0x46, %g5
	stha	%l5,	[%l7 + %g5] 0xe3
	membar	#Sync
	and	%o3,	%g1,	%o7
	set	0x34, %o7
	sta	%f29,	[%l7 + %o7] 0x88
	or	%i7,	%l4,	%i3
	set	0x60, %i5
	ldxa	[%l7 + %i5] 0x81,	%i1
	nop
	set	0x46, %g2
	ldsh	[%l7 + %g2],	%i4
	nop
	set	0x28, %g3
	ldsw	[%l7 + %g3],	%l6
	set	0x09, %l2
	stba	%o1,	[%l7 + %l2] 0x80
	nop
	set	0x38, %i2
	swap	[%l7 + %i2],	%l2
	st	%fsr,	[%l7 + 0x64]
	fpsub16	%f24,	%f0,	%f16
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f16
	nop
	set	0x48, %g4
	stx	%o0,	[%l7 + %g4]
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%i0
	or	%l0,	%o6,	%g6
	set	0x70, %l6
	stxa	%g3,	[%l7 + %l6] 0x80
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x54, %i3
	stb	%i2,	[%l7 + %i3]
	nop
	set	0x70, %o4
	sth	%l1,	[%l7 + %o4]
	nop
	set	0x78, %l3
	swap	[%l7 + %l3],	%l3
	nop
	set	0x3A, %o2
	ldsh	[%l7 + %o2],	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o2
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x88,	%g2
	set	0x54, %l0
	swapa	[%l7 + %l0] 0x88,	%g7
	st	%f10,	[%l7 + 0x08]
	set	0x61, %l4
	stba	%o5,	[%l7 + %l4] 0x80
	nop
	set	0x08, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x54, %o5
	lduh	[%l7 + %o5],	%g5
	nop
	set	0x20, %i1
	ldsb	[%l7 + %i1],	%i6
	nop
	set	0x4C, %g6
	ldsw	[%l7 + %g6],	%o4
	set	0x48, %i0
	stda	%o2,	[%l7 + %i0] 0x88
	nop
	set	0x16, %i7
	ldstub	[%l7 + %i7],	%l5
	set	0x0C, %g7
	stwa	%o7,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x24, %o6
	lda	[%l7 + %o6] 0x89,	%f3
	nop
	set	0x48, %l1
	lduh	[%l7 + %l1],	%g1
	set	0x6D, %g1
	stba	%l4,	[%l7 + %g1] 0x81
	nop
	set	0x26, %g5
	lduh	[%l7 + %g5],	%i3
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x89,	%f27
	and	%i1,	%i7,	%l6
	nop
	set	0x20, %i5
	ldsh	[%l7 + %i5],	%o1
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x1B, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l2
	set	0x08, %l2
	stxa	%i4,	[%l7 + %l2] 0x89
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%g6
	set	0x58, %i2
	stda	%o6,	[%l7 + %i2] 0x80
	nop
	set	0x50, %g4
	std	%f4,	[%l7 + %g4]
	set	0x1E, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g3
	or	%l1,	%l3,	%i2
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%g4
	nop
	set	0x28, %l6
	ldsh	[%l7 + %l6],	%o2
	set	0x7C, %i4
	stha	%i5,	[%l7 + %i4] 0x88
	nop
	set	0x20, %i3
	stw	%g7,	[%l7 + %i3]
	nop
	set	0x30, %i6
	lduh	[%l7 + %i6],	%o5
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x81,	%g5
	set	0x70, %o2
	lda	[%l7 + %o2] 0x81,	%f26
	ld	[%l7 + 0x74],	%f30
	add	%i6,	%g2,	%o4
	set	0x77, %o0
	stba	%l5,	[%l7 + %o0] 0x88
	nop
	set	0x68, %o4
	ldsw	[%l7 + %o4],	%o7
	wr 	%g0, 	0x6, 	%fprs
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x6E, %l4
	sth	%i3,	[%l7 + %l4]
	set	0x70, %l0
	stda	%o2,	[%l7 + %l0] 0xe2
	membar	#Sync
	st	%f12,	[%l7 + 0x78]
	set	0x7E, %o5
	stha	%i7,	[%l7 + %o5] 0xe2
	membar	#Sync
	or	%l6,	%o1,	%l2
	set	0x26, %o3
	stha	%i4,	[%l7 + %o3] 0x88
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x81,	%i0
	nop
	set	0x48, %i0
	prefetch	[%l7 + %i0],	 0
	fpadd32s	%f15,	%f29,	%f24
	nop
	set	0x3E, %i7
	lduh	[%l7 + %i7],	%l0
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
	nop
	set	0x60, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x40, %l1
	prefetch	[%l7 + %l1],	 4
	or	%i1,	%o0,	%o6
	st	%fsr,	[%l7 + 0x74]
	st	%f29,	[%l7 + 0x78]
	and	%g6,	%l1,	%g3
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f12
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%l3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%i2
	nop
	set	0x20, %o7
	ldsh	[%l7 + %o7],	%o2
	set	0x18, %g5
	stda	%g6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x30, %i5
	stx	%o5,	[%l7 + %i5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%g5
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x0F, %g2
	ldstub	[%l7 + %g2],	%i6
	set	0x48, %l2
	prefetcha	[%l7 + %l2] 0x89,	 2
	or	%o4,	%l5,	%g1
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%l4
	nop
	nop
	setx	0xE7BA1AC30B4AC688,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x118F748A9D997882,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f4,	%f24
	st	%fsr,	[%l7 + 0x28]
	bge,pt	%xcc,	loop_181
	nop
	set	0x74, %g4
	prefetch	[%l7 + %g4],	 2
	or	%i3,	%o7,	%o3
	set	0x7C, %g3
	stba	%l6,	[%l7 + %g3] 0xea
	membar	#Sync
loop_181:
	nop
	set	0x48, %o1
	std	%i6,	[%l7 + %o1]
	nop
	set	0x18, %l5
	ldsh	[%l7 + %l5],	%l2
	or	%i4,	%i0,	%l0
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x88,	%o1
	nop
	set	0x40, %i3
	std	%f20,	[%l7 + %i3]
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x81,	%o0
	bn	%icc,	loop_182
	add	%i1,	%o6,	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g6
loop_182:
	nop
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	nop
	set	0x4E, %o2
	ldsh	[%l7 + %o2],	%g4
	bne	%icc,	loop_183
	nop
	set	0x1C, %i6
	lduw	[%l7 + %i6],	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%i2
loop_183:
	nop
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc8
	nop
	set	0x20, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%g7
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%o5,	%i5,	%i6
	nop
	set	0x3E, %o5
	lduh	[%l7 + %o5],	%g2
	nop
	set	0x4C, %g6
	lduh	[%l7 + %g6],	%g5
	nop
	set	0x28, %i0
	stx	%fsr,	[%l7 + %i0]
	fpsub32s	%f14,	%f9,	%f30
	nop
	set	0x50, %o3
	stw	%o4,	[%l7 + %o3]
	set	0x4C, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g1
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%l4
	set	0x66, %o6
	stha	%i3,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x30, %g1
	stxa	%o7,	[%l7 + %g1] 0x81
	nop
	set	0x10, %l1
	std	%o2,	[%l7 + %l1]
	nop
	set	0x7E, %g7
	sth	%l6,	[%l7 + %g7]
	and	%i7,	%l2,	%l4
	nop
	set	0x68, %g5
	stb	%i4,	[%l7 + %g5]
	set	0x34, %o7
	stwa	%l0,	[%l7 + %o7] 0x80
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x88,	%o1
	nop
	set	0x34, %l2
	lduh	[%l7 + %l2],	%i0
	or	%o0,	%o6,	%l1
	set	0x5B, %i2
	stba	%g3,	[%l7 + %i2] 0x89
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x42, %g3
	stba	%g6,	[%l7 + %g3] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%l3
	set	0x20, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	fpsub16s	%f3,	%f22,	%f11
	or	%i2,	%o2,	%g7
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x81,	%i4
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f2
	nop
	set	0x22, %i3
	ldsb	[%l7 + %i3],	%i6
	nop
	set	0x60, %l6
	lduh	[%l7 + %l6],	%o5
	nop
	set	0x3B, %o1
	ldstub	[%l7 + %o1],	%g5
	bleu,a,pt	%icc,	loop_184
	or	%g2,	%g1,	%l5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f16
loop_184:
	nop
	set	0x38, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i3
	fpsub32	%f4,	%f12,	%f16
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%o6
	nop
	set	0x65, %l4
	stb	%o4,	[%l7 + %l4]
	set	0x78, %o0
	stda	%i6,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%o2
	nop
	set	0x78, %o4
	std	%l2,	[%l7 + %o4]
	nop
	nop
	setx	0x8A42F8CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x775FC48D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f9,	%f16
	st	%f1,	[%l7 + 0x70]
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x89,	%i7
	wr	%l4,	%i4,	%ccr
	set	0x62, %o5
	stha	%o1,	[%l7 + %o5] 0x89
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%o0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xca
	ld	[%l7 + 0x74],	%f17
	fpsub32s	%f31,	%f24,	%f29
	fpsub16	%f22,	%f16,	%f26
	nop
	set	0x0E, %o3
	stb	%i0,	[%l7 + %o3]
	nop
	set	0x38, %i1
	ldsb	[%l7 + %i1],	%l1
	nop
	set	0x54, %o6
	ldsb	[%l7 + %o6],	%g3
	nop
	set	0x78, %g1
	std	%g6,	[%l7 + %g1]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i2
	set	0x2C, %l1
	swapa	[%l7 + %l1] 0x89,	%l3
	nop
	set	0x0C, %i7
	stw	%o2,	[%l7 + %i7]
	nop
	set	0x14, %g5
	ldsh	[%l7 + %g5],	%g7
	add	%i6,	%o5,	%g5
	nop
	set	0x22, %g7
	sth	%g2,	[%l7 + %g7]
	nop
	set	0x18, %g2
	std	%f26,	[%l7 + %g2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l5
	set	0x6C, %l2
	stwa	%i3,	[%l7 + %l2] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i5
	set	0x48, %o7
	stda	%o4,	[%l7 + %o7] 0x89
	nop
	set	0x1E, %i2
	lduh	[%l7 + %i2],	%l6
	add	%o3,	%l2,	%l4
	nop
	set	0x15, %g4
	ldsb	[%l7 + %g4],	%i4
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o1
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x88,	%i6
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%l0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc4
	set	0x20, %i3
	stwa	%o0,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f22
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%g3
	set	0x10, %l3
	sta	%f27,	[%l7 + %l3] 0x88
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf1
	membar	#Sync
	and	%g6,	%g4,	%i0
	set	0x20, %i6
	stda	%i0,	[%l7 + %i6] 0x81
	set	0x68, %o2
	stwa	%i2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%f16
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc2
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%o6
	nop
	set	0x08, %l0
	stx	%o2,	[%l7 + %l0]
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%g6
	set	0x60, %o5
	lda	[%l7 + %o5] 0x89,	%f30
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f22
	bleu,a,pt	%xcc,	loop_185
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	ble,a,pt	%icc,	loop_186
	nop
	set	0x08, %o6
	ldsw	[%l7 + %o6],	%i6
loop_185:
	nop
	set	0x6C, %i1
	ldstub	[%l7 + %i1],	%l3
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd8,	%f16
loop_186:
	nop
	set	0x68, %i7
	stda	%o4,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%f8
	nop
	set	0x30, %g1
	std	%g2,	[%l7 + %g1]
	nop
	set	0x5B, %g7
	ldsb	[%l7 + %g7],	%g1
	set	0x58, %g2
	ldxa	[%l7 + %g2] 0x88,	%l5
	nop
	set	0x43, %l2
	stb	%i3,	[%l7 + %l2]
	fpsub16s	%f5,	%f31,	%f6
	nop
	set	0x30, %o7
	std	%f18,	[%l7 + %o7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%i5
	and	%o7,	%o4,	%l6
	set	0x20, %i2
	stda	%o2,	[%l7 + %i2] 0x81
	nop
	set	0x76, %g4
	sth	%l2,	[%l7 + %g4]
	nop
	set	0x3F, %i5
	ldstub	[%l7 + %i5],	%i4
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f22
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x58, %g3
	stx	%o1,	[%l7 + %g3]
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	nop
	set	0x2C, %l6
	stw	%i7,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x44]
	set	0x38, %i3
	stwa	%l0,	[%l7 + %i3] 0x81
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f16
	nop
	set	0x12, %l3
	stb	%l1,	[%l7 + %l3]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xda
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x88,	%g3
	nop
	set	0x12, %l4
	ldsh	[%l7 + %l4],	%o0
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%g4
	set	0x38, %o0
	lda	[%l7 + %o0] 0x80,	%f27
	nop
	set	0x6E, %g6
	ldub	[%l7 + %g6],	%g6
	nop
	set	0x30, %l0
	std	%i0,	[%l7 + %l0]
	set	0x08, %i0
	stxa	%i2,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	st	%fsr,	[%l7 + 0x6C]
	or	%o6,	%o2,	%g7
	and	%i6,	%l3,	%g2
	or	%o5,	%l5,	%g1
	nop
	set	0x2E, %o6
	ldsh	[%l7 + %o6],	%i3
	set	0x50, %o5
	stda	%g4,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x42, %i1
	sth	%o7,	[%l7 + %i1]
	nop
	set	0x78, %l1
	sth	%o4,	[%l7 + %l1]
	and	%i5,	%l6,	%l2
	set	0x14, %g5
	sta	%f15,	[%l7 + %g5] 0x81
	nop
	set	0x6A, %g1
	ldstub	[%l7 + %g1],	%i4
	ba,a,pn	%icc,	loop_187
	wr	%o3,	%l4,	%pic
	set	0x78, %i7
	sta	%f20,	[%l7 + %i7] 0x89
loop_187:
	nop
	set	0x48, %g2
	ldx	[%l7 + %g2],	%o1
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x18, %o7
	stda	%i6,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f20
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x81,	 1
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x81,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%g6
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x89,	%i0
	nop
	set	0x50, %l6
	std	%g4,	[%l7 + %l6]
	nop
	set	0x70, %l5
	prefetch	[%l7 + %l5],	 2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o6
	fpadd32	%f24,	%f0,	%f22
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%i2
	ld	[%l7 + 0x68],	%f15
	set	0x78, %o1
	stwa	%i6,	[%l7 + %o1] 0x80
	set	0x30, %l3
	stha	%l3,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x4C, %o2
	sta	%f4,	[%l7 + %o2] 0x80
	set	0x0C, %i3
	sta	%f31,	[%l7 + %i3] 0x88
	set	0x58, %i6
	swapa	[%l7 + %i6] 0x88,	%g2
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%g6
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%l4
	set	0x76, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o5
	set	0x5C, %l0
	stba	%g1,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x5C, %l4
	ldstub	[%l7 + %l4],	%g5
	nop
	set	0x10, %i0
	std	%i2,	[%l7 + %i0]
	nop
	set	0x70, %o6
	stx	%o4,	[%l7 + %o6]
	and	%i5,	%o7,	%l2
	set	0x4B, %o3
	stba	%i4,	[%l7 + %o3] 0xea
	membar	#Sync
	and	%l6,	%o3,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o1
	nop
	set	0x34, %o5
	sth	%l0,	[%l7 + %o5]
	set	0x59, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l1
	nop
	set	0x4C, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x89,	 2
	set	0x20, %i7
	stxa	%o0,	[%l7 + %i7] 0xeb
	membar	#Sync
	add	%i1,	%g6,	%i0
	st	%fsr,	[%l7 + 0x7C]
	set	0x6F, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o6
	nop
	set	0x54, %l2
	prefetch	[%l7 + %l2],	 4
	st	%fsr,	[%l7 + 0x10]
	set	0x0A, %o7
	stha	%o2,	[%l7 + %o7] 0x88
	nop
	set	0x7A, %g2
	ldsh	[%l7 + %g2],	%i2
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x81,	%g4
	nop
	set	0x10, %g4
	ldsw	[%l7 + %g4],	%l3
	set	0x58, %i2
	stwa	%i6,	[%l7 + %i2] 0x89
	set	0x08, %i4
	sta	%f17,	[%l7 + %i4] 0x80
	nop
	set	0x58, %i5
	std	%f26,	[%l7 + %i5]
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%g2
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f16
	nop
	set	0x32, %l3
	lduh	[%l7 + %l3],	%o5
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%g0
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf8
	membar	#Sync
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%l5
	set	0x70, %o0
	stha	%i3,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x68, %g6
	stxa	%g5,	[%l7 + %g6] 0x81
	nop
	set	0x2A, %l0
	lduh	[%l7 + %l0],	%o4
	nop
	set	0x6E, %o4
	ldsb	[%l7 + %o4],	%i5
	nop
	set	0x4A, %l4
	sth	%l2,	[%l7 + %l4]
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%o7
	nop
	set	0x6A, %o6
	sth	%l6,	[%l7 + %o6]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x81,	 3
	nop
	set	0x20, %o3
	stw	%l4,	[%l7 + %o3]
	nop
	set	0x56, %g5
	ldstub	[%l7 + %g5],	%i7
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 0
	fpadd16s	%f0,	%f30,	%f28
	nop
	set	0x0E, %i7
	ldsh	[%l7 + %i7],	%o3
	set	0x49, %g1
	stba	%o1,	[%l7 + %g1] 0x80
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x3E, %o7
	ldsh	[%l7 + %o7],	%l0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	ld	[%l7 + 0x0C],	%f18
	st	%f6,	[%l7 + 0x1C]
	nop
	set	0x78, %g2
	std	%f30,	[%l7 + %g2]
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f20
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x88,	%l1
	or	%o0,	%g3,	%i1
	nop
	set	0x37, %i4
	ldub	[%l7 + %i4],	%g6
	nop
	set	0x30, %i2
	swap	[%l7 + %i2],	%o6
	set	0x50, %i5
	stda	%o2,	[%l7 + %i5] 0x89
	set	0x5C, %l5
	stba	%i2,	[%l7 + %l5] 0x89
	nop
	set	0x78, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x50, %l6
	std	%f6,	[%l7 + %l6]
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f22
	nop
	set	0x7B, %i3
	stb	%g4,	[%l7 + %i3]
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%l2
	set	0x78, %o2
	stda	%i0,	[%l7 + %o2] 0x88
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf0
	membar	#Sync
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x81,	%i6
	nop
	set	0x1C, %o0
	ldub	[%l7 + %o0],	%g2
	nop
	nop
	setx	0x09C493F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xD3CA3F87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f6,	%f26
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x88,	%o4
	nop
	set	0x18, %o4
	std	%f26,	[%l7 + %o4]
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%g6
	nop
	set	0x1A, %o6
	lduh	[%l7 + %o6],	%l5
	nop
	set	0x2D, %o5
	stb	%g1,	[%l7 + %o5]
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x81,	 2
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f28
	nop
	set	0x42, %o3
	ldsh	[%l7 + %o3],	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l2
	and	%o7,	%l6,	%i3
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x80,	%i4
	set	0x17, %i7
	stba	%l4,	[%l7 + %i7] 0x80
	add	%i7,	%o3,	%o1
	ld	[%l7 + 0x2C],	%f25
	set	0x32, %o7
	stha	%l1,	[%l7 + %o7] 0x80
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x81,	%l0
	set	0x38, %g1
	stda	%g2,	[%l7 + %g1] 0xe2
	membar	#Sync
	st	%f21,	[%l7 + 0x38]
	nop
	set	0x48, %g2
	stw	%i1,	[%l7 + %g2]
	wr	%g6,	%o0,	%softint
	nop
	set	0x3B, %g4
	ldsb	[%l7 + %g4],	%o2
	ld	[%l7 + 0x50],	%f3
	set	0x20, %i4
	stba	%o6,	[%l7 + %i4] 0x88
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%i2
	nop
	nop
	setx	0x4B91AD60,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xA85885BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f12,	%f19
	nop
	set	0x20, %i5
	stw	%g4,	[%l7 + %i5]
	add	%i0,	%l3,	%g2
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x81,	 4
	ld	[%l7 + 0x6C],	%f20
	st	%f2,	[%l7 + 0x18]
	nop
	set	0x2C, %g3
	ldub	[%l7 + %g3],	%g7
	nop
	set	0x10, %l5
	sth	%i6,	[%l7 + %l5]
	nop
	set	0x0A, %l6
	lduh	[%l7 + %l6],	%l5
	nop
	set	0x20, %i3
	stx	%g5,	[%l7 + %i3]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%i5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd0
	set	0x30, %o2
	lda	[%l7 + %o2] 0x81,	%f22
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%l2
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x81,	%o4
	ld	[%l7 + 0x10],	%f27
	set	0x5E, %g6
	stha	%o7,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x2A, %l0
	lduh	[%l7 + %l0],	%i3
	set	0x78, %o0
	lda	[%l7 + %o0] 0x89,	%f11
	nop
	set	0x68, %o4
	std	%f26,	[%l7 + %o4]
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x80,	%i4
	nop
	set	0x58, %o5
	stx	%l4,	[%l7 + %o5]
	set	0x60, %l4
	sta	%f7,	[%l7 + %l4] 0x88
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f26
	bgu,a	%xcc,	loop_188
	wr	%l6,	%o3,	%y
	set	0x50, %g5
	stxa	%i7,	[%l7 + %g5] 0xeb
	membar	#Sync
loop_188:
	nop
	set	0x6A, %o3
	stha	%o1,	[%l7 + %o3] 0x81
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%l0
	nop
	set	0x1C, %i7
	ldstub	[%l7 + %i7],	%l1
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	set	0x68, %l2
	stda	%g6,	[%l7 + %l2] 0x88
	wr	%o0,	%i1,	%sys_tick
	nop
	set	0x4C, %g1
	sth	%o6,	[%l7 + %g1]
	st	%f10,	[%l7 + 0x14]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
	nop
	set	0x1A, %g4
	ldsh	[%l7 + %g4],	%i2
	nop
	set	0x7C, %o7
	ldsh	[%l7 + %o7],	%g4
	nop
	set	0x10, %i4
	stx	%fsr,	[%l7 + %i4]
	add	%i0,	%l3,	%o2
	nop
	set	0x6A, %i2
	ldsh	[%l7 + %i2],	%o5
	nop
	set	0x68, %g7
	stx	%g2,	[%l7 + %g7]
	wr	%g7,	%l5,	%softint
	add	%i6,	%g5,	%i5
	nop
	set	0x2C, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x38, %i5
	swap	[%l7 + %i5],	%l2
	nop
	set	0x0C, %l5
	lduw	[%l7 + %l5],	%g1
	nop
	set	0x30, %l6
	ldsw	[%l7 + %l6],	%o4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xe2,	%i2
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f10
	nop
	set	0x3D, %o2
	ldub	[%l7 + %o2],	%i4
	nop
	set	0x3B, %i6
	ldsb	[%l7 + %i6],	%l4
	set	0x17, %g6
	stba	%l6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%o1
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%o3
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x80,	%l1
	set	0x58, %o4
	stda	%g2,	[%l7 + %o4] 0x88
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%l0
	nop
	set	0x10, %l4
	lduh	[%l7 + %l4],	%g6
	set	0x6F, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o0
	set	0x5B, %g5
	stba	%i1,	[%l7 + %g5] 0x88
	nop
	set	0x34, %o3
	swap	[%l7 + %o3],	%o6
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x10, %o5
	std	%f0,	[%l7 + %o5]
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%g4
	set	0x1C, %l1
	stha	%i0,	[%l7 + %l1] 0x89
	set	0x44, %l2
	lda	[%l7 + %l2] 0x89,	%f14
	nop
	set	0x5A, %g2
	ldsb	[%l7 + %g2],	%l3
	fpsub32s	%f12,	%f21,	%f6
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%o2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf8
	membar	#Sync
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%g2
	nop
	set	0x0E, %g7
	ldub	[%l7 + %g7],	%o5
	set	0x16, %g3
	stha	%l5,	[%l7 + %g3] 0x80
	set	0x0C, %i5
	sta	%f21,	[%l7 + %i5] 0x81
	nop
	set	0x54, %l5
	swap	[%l7 + %l5],	%i6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i5
	set	0x64, %o7
	stwa	%l2,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x89,	%g1
	nop
	set	0x22, %i3
	ldstub	[%l7 + %i3],	%o4
	ld	[%l7 + 0x30],	%f15
	and	%i3,	%g7,	%l4
	fpsub32s	%f20,	%f6,	%f1
	nop
	set	0x2E, %l6
	ldsh	[%l7 + %l6],	%l6
	set	0x18, %o2
	stxa	%i4,	[%l7 + %o2] 0x89
	fpadd32s	%f27,	%f28,	%f11
	nop
	set	0x6A, %g6
	stb	%o7,	[%l7 + %g6]
	nop
	set	0x20, %l0
	swap	[%l7 + %l0],	%i7
	or	%o1,	%l1,	%g3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f0
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%o2
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%g6
	or	%l0,	%i1,	%o0
	nop
	set	0x68, %i6
	std	%g4,	[%l7 + %i6]
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x88,	%o6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	nop
	set	0x18, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x78, %o3
	stx	%i0,	[%l7 + %o3]
	st	%f16,	[%l7 + 0x38]
	nop
	set	0x20, %i1
	sth	%o2,	[%l7 + %i1]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g2
	nop
	set	0x4B, %o5
	ldub	[%l7 + %o5],	%i2
	nop
	set	0x22, %i7
	ldub	[%l7 + %i7],	%o5
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%l4
	nop
	set	0x60, %l1
	swap	[%l7 + %l1],	%g5
	be,a	%icc,	loop_189
	nop
	set	0x50, %g2
	prefetch	[%l7 + %g2],	 3
	set	0x18, %l2
	stha	%i5,	[%l7 + %l2] 0xea
	membar	#Sync
loop_189:
	nop
	set	0x29, %g4
	ldstub	[%l7 + %g4],	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%o4
	and	%i6,	%g7,	%i3
	nop
	set	0x28, %g1
	ldsw	[%l7 + %g1],	%l4
	nop
	set	0x78, %i2
	stx	%i4,	[%l7 + %i2]
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f8
	nop
	set	0x3C, %g7
	stb	%l6,	[%l7 + %g7]
	nop
	set	0x4F, %g3
	stb	%o7,	[%l7 + %g3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%l1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f16
	or	%i7,	%o3,	%g6
	or	%l0,	%g3,	%i1
	nop
	set	0x72, %l5
	ldstub	[%l7 + %l5],	%o0
	set	0x08, %o7
	stwa	%o6,	[%l7 + %o7] 0x88
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x80,	 2
	nop
	set	0x60, %l6
	ldx	[%l7 + %l6],	%o2
	set	0x18, %o2
	sta	%f30,	[%l7 + %o2] 0x80
	set	0x58, %g6
	stxa	%i0,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xeb,	%g2
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf8
	membar	#Sync
	set	0x4C, %l0
	lda	[%l7 + %l0] 0x81,	%f30
	nop
	set	0x30, %o4
	std	%i2,	[%l7 + %o4]
	st	%f3,	[%l7 + 0x14]
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%l3
	nop
	set	0x3C, %l4
	sth	%l5,	[%l7 + %l4]
	nop
	set	0x0C, %i0
	lduw	[%l7 + %i0],	%g5
	nop
	set	0x46, %l3
	lduh	[%l7 + %l3],	%i5
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%o5
	st	%f31,	[%l7 + 0x34]
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x88,	%l2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	or	%o4,	%g1,	%g7
	set	0x38, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%i3
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f12
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x81,	%l4
	set	0x42, %l2
	stha	%i4,	[%l7 + %l2] 0x88
	or	%l6,	%o1,	%o7
	set	0x28, %g2
	stda	%i6,	[%l7 + %g2] 0x80
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%o3
	nop
	set	0x64, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x69, %i2
	stb	%l1,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x2E, %i4
	ldsh	[%l7 + %i4],	%g6
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%l0
	set	0x18, %i5
	lda	[%l7 + %i5] 0x81,	%f10
	nop
	set	0x68, %l5
	stx	%g3,	[%l7 + %l5]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f16
	nop
	set	0x74, %o7
	sth	%o0,	[%l7 + %o7]
	ld	[%l7 + 0x34],	%f7
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x89,	%i1
	nop
	set	0x34, %o2
	swap	[%l7 + %o2],	%o6
	ld	[%l7 + 0x08],	%f19
	nop
	set	0x18, %l6
	prefetch	[%l7 + %l6],	 1
	add	%o2,	%i0,	%g2
	nop
	set	0x70, %g6
	lduw	[%l7 + %g6],	%g4
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x88,	 2
	nop
	set	0x4E, %l0
	sth	%l5,	[%l7 + %l0]
	set	0x7E, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g5
	st	%f16,	[%l7 + 0x34]
	ba,pn	%icc,	loop_190
	or	%i5,	%i2,	%l2
	and	%o5,	%g1,	%o4
	set	0x6A, %o4
	stha	%g7,	[%l7 + %o4] 0xe2
	membar	#Sync
loop_190:
	nop
	set	0x38, %l4
	swap	[%l7 + %l4],	%i6
	nop
	set	0x58, %i6
	std	%i2,	[%l7 + %i6]
	nop
	set	0x74, %l3
	lduh	[%l7 + %l3],	%i4
	and	%l6,	%o1,	%o7
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x89,	%i7
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f16
	nop
	set	0x2A, %o5
	ldub	[%l7 + %o5],	%o3
	and	%l1,	%l4,	%g6
	bge	%xcc,	loop_191
	nop
	set	0x50, %i1
	ldsw	[%l7 + %i1],	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%o0
loop_191:
	nop
	set	0x4A, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o6
	nop
	set	0x64, %l1
	ldub	[%l7 + %l1],	%o2
	set	0x48, %g5
	prefetcha	[%l7 + %g5] 0x89,	 4
	ld	[%l7 + 0x44],	%f6
	set	0x7B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g2
	add	%g4,	%i1,	%l3
	set	0x40, %l2
	sta	%f27,	[%l7 + %l2] 0x88
	set	0x68, %g2
	stda	%l4,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x89,	%g5
	nop
	set	0x6E, %g4
	lduh	[%l7 + %g4],	%i5
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x88,	%l2
	set	0x21, %g3
	stba	%o5,	[%l7 + %g3] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%i2
	and	%o4,	%g1,	%i6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%i3
	set	0x38, %l5
	prefetcha	[%l7 + %l5] 0x88,	 2
	nop
	set	0x18, %i2
	lduw	[%l7 + %i2],	%o1
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f0
	nop
	set	0x7A, %g7
	ldsh	[%l7 + %g7],	%o7
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
	add	%i7,	%o3,	%l1
	nop
	set	0x48, %l6
	swap	[%l7 + %l6],	%l4
	nop
	set	0x3E, %g6
	ldsb	[%l7 + %g6],	%g6
	set	0x70, %o0
	sta	%f28,	[%l7 + %o0] 0x88
	nop
	set	0x78, %l0
	stx	%l0,	[%l7 + %l0]
	nop
	set	0x43, %o1
	ldstub	[%l7 + %o1],	%l6
	set	0x50, %o2
	ldxa	[%l7 + %o2] 0x80,	%o0
	set	0x24, %o4
	swapa	[%l7 + %o4] 0x88,	%g3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%o2
	nop
	set	0x40, %l4
	ldsh	[%l7 + %l4],	%g2
	set	0x28, %l3
	sta	%f24,	[%l7 + %l3] 0x80
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0
	and	%i0,	%i1,	%l3
	add	%g5,	%i5,	%l2
	nop
	set	0x10, %i0
	sth	%l5,	[%l7 + %i0]
	set	0x74, %o3
	sta	%f19,	[%l7 + %o3] 0x80
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%g1
	or	%i6,	%g7,	%o4
	add	%i3,	%o1,	%i4
	and	%o7,	%o3,	%i7
	nop
	set	0x18, %i1
	ldsh	[%l7 + %i1],	%l1
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x38, %o6
	prefetch	[%l7 + %o6],	 1
	set	0x40, %l1
	stxa	%l4,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x80,	%l0
	nop
	set	0x14, %g5
	swap	[%l7 + %g5],	%g6
	and	%o0,	%g3,	%l6
	nop
	set	0x44, %l2
	lduw	[%l7 + %l2],	%o6
	set	0x40, %g1
	ldxa	[%l7 + %g1] 0x88,	%o2
	wr	%g4,	%g2,	%pic
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x7C, %i4
	ldsw	[%l7 + %i4],	%i0
	st	%f23,	[%l7 + 0x60]
	nop
	set	0x3B, %g3
	ldsb	[%l7 + %g3],	%l3
	set	0x34, %g4
	stwa	%i1,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x50, %i5
	std	%i4,	[%l7 + %i5]
	or	%l2,	%g5,	%o5
	fpadd32	%f0,	%f10,	%f20
	set	0x7C, %i2
	lda	[%l7 + %i2] 0x81,	%f19
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%i2
	nop
	set	0x74, %o7
	lduh	[%l7 + %o7],	%g1
	and	%l5,	%g7,	%o4
	nop
	set	0x68, %i3
	ldsw	[%l7 + %i3],	%i6
	be	%xcc,	loop_192
	and	%o1,	%i3,	%i4
	nop
	set	0x0A, %g7
	ldub	[%l7 + %g7],	%o7
	nop
	set	0x32, %l6
	ldstub	[%l7 + %l6],	%o3
loop_192:
	nop
	set	0x62, %g6
	ldsb	[%l7 + %g6],	%i7
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	nop
	set	0x4E, %o1
	ldsb	[%l7 + %o1],	%l0
	nop
	set	0x28, %o2
	std	%f2,	[%l7 + %o2]
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	or	%l1,	%g6,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o6
	nop
	set	0x25, %l4
	stb	%l6,	[%l7 + %l4]
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f0
	set	0x37, %i6
	stba	%o2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x30, %l3
	std	%g4,	[%l7 + %l3]
	st	%f14,	[%l7 + 0x58]
	ble,a	%icc,	loop_193
	nop
	set	0x60, %o3
	ldsh	[%l7 + %o3],	%g2
	nop
	set	0x5E, %i0
	lduh	[%l7 + %i0],	%i0
	fpsub16s	%f23,	%f21,	%f10
loop_193:
	nop
	set	0x48, %i1
	stxa	%i1,	[%l7 + %i1] 0x80
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x1C, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x44, %o5
	ldsb	[%l7 + %o5],	%l3
	nop
	set	0x5C, %l1
	sth	%l2,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
	set	0x11, %l2
	stba	%i5,	[%l7 + %l2] 0x81
	nop
	set	0x17, %g1
	ldub	[%l7 + %g1],	%o5
	set	0x7C, %g5
	sta	%f19,	[%l7 + %g5] 0x80
	set	0x1E, %g2
	stha	%g5,	[%l7 + %g2] 0x80
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x81,	%g1
	or	%i2,	%l5,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i6
	st	%f2,	[%l7 + 0x38]
	set	0x10, %g4
	lda	[%l7 + %g4] 0x81,	%f24
	nop
	set	0x60, %i5
	ldstub	[%l7 + %i5],	%o1
	nop
	set	0x40, %i4
	ldub	[%l7 + %i4],	%i3
	nop
	set	0x47, %i2
	ldstub	[%l7 + %i2],	%o7
	nop
	set	0x5A, %l5
	ldub	[%l7 + %l5],	%o3
	nop
	set	0x4A, %o7
	ldsh	[%l7 + %o7],	%i7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%l0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd8
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%l4
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%l1
	set	0x30, %o0
	stda	%g6,	[%l7 + %o0] 0xeb
	membar	#Sync
	st	%f10,	[%l7 + 0x78]
	nop
	set	0x70, %l6
	ldsw	[%l7 + %l6],	%o0
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f28
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%l6
	set	0x60, %o1
	stwa	%g3,	[%l7 + %o1] 0x81
	nop
	set	0x09, %l4
	ldsb	[%l7 + %l4],	%o2
	and	%g2,	%i0,	%i1
	ble,pn	%icc,	loop_194
	and	%l3,	%l2,	%g4
	nop
	set	0x1C, %l0
	stw	%o5,	[%l7 + %l0]
	nop
	set	0x54, %i6
	stb	%g5,	[%l7 + %i6]
loop_194:
	nop
	set	0x52, %o4
	stha	%i5,	[%l7 + %o4] 0x88
	add	%g1,	%l5,	%i2
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%g7
	set	0x6D, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o4
	nop
	set	0x18, %i1
	stx	%o1,	[%l7 + %i1]
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f4
	nop
	set	0x4C, %i0
	ldsh	[%l7 + %i0],	%i3
	set	0x20, %o5
	stda	%o6,	[%l7 + %o5] 0x80
	and	%o3,	%i6,	%i4
	st	%f4,	[%l7 + 0x48]
	nop
	set	0x73, %l1
	ldub	[%l7 + %l1],	%l0
	nop
	set	0x10, %i7
	stx	%l4,	[%l7 + %i7]
	nop
	set	0x08, %g1
	ldsw	[%l7 + %g1],	%l1
	nop
	set	0x70, %l2
	std	%f14,	[%l7 + %l2]
	nop
	set	0x10, %g5
	std	%g6,	[%l7 + %g5]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%o0
	set	0x54, %g3
	swapa	[%l7 + %g3] 0x81,	%o6
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f14
	nop
	set	0x70, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x68, %i4
	stda	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%i7
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%g2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f0
	bne,pt	%xcc,	loop_195
	or	%i0,	%i1,	%l3
	nop
	set	0x58, %i3
	stw	%l2,	[%l7 + %i3]
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%g3
loop_195:
	nop
	set	0x7C, %l6
	stw	%g4,	[%l7 + %l6]
	nop
	set	0x23, %o2
	stb	%o5,	[%l7 + %o2]
	add	%i5,	%g1,	%l5
	add	%i2,	%g7,	%g5
	set	0x68, %o0
	lda	[%l7 + %o0] 0x81,	%f5
	nop
	set	0x78, %l4
	sth	%o1,	[%l7 + %l4]
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x89,	%i2
	set	0x4D, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o7
	nop
	set	0x70, %o4
	stx	%o4,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x4E, %o3
	ldsh	[%l7 + %o3],	%i6
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f22
	nop
	set	0x38, %l3
	sth	%i4,	[%l7 + %l3]
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x88,	%l0
	nop
	set	0x53, %i1
	stb	%o3,	[%l7 + %i1]
	set	0x20, %i0
	stda	%l0,	[%l7 + %i0] 0x81
	nop
	set	0x31, %l1
	ldsb	[%l7 + %l1],	%g6
	nop
	set	0x58, %o5
	lduh	[%l7 + %o5],	%o0
	fpadd32	%f6,	%f14,	%f8
	nop
	set	0x78, %i7
	swap	[%l7 + %i7],	%o6
	ld	[%l7 + 0x20],	%f4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f0
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x80,	%l4
	ld	[%l7 + 0x3C],	%f23
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%l6
	set	0x68, %g1
	lda	[%l7 + %g1] 0x89,	%f11
	nop
	set	0x1A, %g4
	lduh	[%l7 + %g4],	%o2
	set	0x0E, %g3
	stba	%i7,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x58, %i5
	std	%g2,	[%l7 + %i5]
	set	0x28, %i2
	stxa	%i0,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x50, %i4
	ldx	[%l7 + %i4],	%i1
	set	0x44, %l5
	sta	%f2,	[%l7 + %l5] 0x88
	nop
	set	0x48, %g7
	std	%f6,	[%l7 + %g7]
	set	0x70, %o7
	stxa	%l2,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x54, %i3
	lduw	[%l7 + %i3],	%g3
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%l2
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x88,	%g4
	set	0x70, %o2
	sta	%f0,	[%l7 + %o2] 0x89
	nop
	set	0x70, %o0
	stb	%i5,	[%l7 + %o0]
	nop
	set	0x70, %o1
	ldsw	[%l7 + %o1],	%o5
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%g0
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f16
	nop
	set	0x50, %o3
	ldsh	[%l7 + %o3],	%l5
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x68, %l3
	lda	[%l7 + %l3] 0x88,	%f21
	nop
	set	0x0C, %o6
	ldsb	[%l7 + %o6],	%i2
	set	0x1C, %l4
	stba	%g7,	[%l7 + %l4] 0x80
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x80,	%g5
	or	%i3,	%o7,	%o1
	set	0x5A, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i6
	nop
	set	0x4E, %l1
	lduh	[%l7 + %l1],	%i4
	nop
	set	0x60, %o5
	ldsh	[%l7 + %o5],	%l0
	add	%o4,	%o3,	%l1
	or	%g6,	%o6,	%l4
	nop
	set	0x70, %l2
	stw	%o0,	[%l7 + %l2]
	nop
	set	0x58, %i7
	stb	%o2,	[%l7 + %i7]
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%l6
	nop
	set	0x46, %g2
	stb	%g2,	[%l7 + %g2]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%i1
	set	0x68, %g1
	stxa	%g3,	[%l7 + %g1] 0x89
	nop
	set	0x68, %g4
	stx	%l3,	[%l7 + %g4]
	set	0x70, %g3
	lda	[%l7 + %g3] 0x89,	%f15
	nop
	nop
	setx	0xF8D683A8DFA07C14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x86C688B119191626,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f4,	%f24
	bg,a	%xcc,	loop_196
	st	%f16,	[%l7 + 0x48]
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	nop
	setx	0xEF96760A829CCC7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x415417CF3CD0D829,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f12
loop_196:
	nop
	set	0x0A, %i4
	lduh	[%l7 + %i4],	%g4
	nop
	set	0x6A, %i5
	sth	%i5,	[%l7 + %i5]
	set	0x30, %l5
	stxa	%l2,	[%l7 + %l5] 0x88
	nop
	set	0x60, %g7
	lduh	[%l7 + %g7],	%o5
	bge,a	%xcc,	loop_197
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%l4
	set	0x28, %l6
	stda	%g0,	[%l7 + %l6] 0xe2
	membar	#Sync
loop_197:
	nop
	set	0x3B, %g6
	ldub	[%l7 + %g6],	%i2
	add	%g5,	%i3,	%g7
	nop
	set	0x29, %i3
	ldsb	[%l7 + %i3],	%o1
	nop
	set	0x40, %o2
	swap	[%l7 + %o2],	%i6
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%o4
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%o7
	nop
	set	0x70, %o4
	stx	%o3,	[%l7 + %o4]
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%g6
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%o6
	nop
	set	0x78, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x30, %o6
	stw	%l1,	[%l7 + %o6]
	set	0x14, %o3
	lda	[%l7 + %o3] 0x81,	%f15
	nop
	set	0x68, %i0
	stx	%l4,	[%l7 + %i0]
	nop
	set	0x66, %i1
	ldsh	[%l7 + %i1],	%o2
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%i7
	set	0x34, %l4
	sta	%f18,	[%l7 + %l4] 0x88
	set	0x26, %o5
	ldstuba	[%l7 + %o5] 0x88,	%l6
	fpadd32	%f6,	%f10,	%f14
	nop
	set	0x28, %l2
	std	%o0,	[%l7 + %l2]
	ld	[%l7 + 0x28],	%f23
	nop
	set	0x70, %i7
	stx	%i0,	[%l7 + %i7]
	wr	%g2,	%i1,	%pic
	nop
	set	0x44, %g2
	lduw	[%l7 + %g2],	%l3
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	wr	%g4,	%g3,	%ccr
	set	0x50, %g4
	swapa	[%l7 + %g4] 0x80,	%i5
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc4
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f8
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%o5
	set	0x6C, %i5
	stwa	%l5,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x20, %l5
	sta	%f1,	[%l7 + %l5] 0x80
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%g0
	or	%i2,	%l2,	%i3
	ble	%icc,	loop_198
	st	%f12,	[%l7 + 0x60]
	nop
	set	0x20, %o7
	stx	%g7,	[%l7 + %o7]
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
loop_198:
	nop
	set	0x20, %g6
	stx	%g5,	[%l7 + %g6]
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%i4
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x37, %g7
	ldstub	[%l7 + %g7],	%i6
	set	0x58, %i6
	stwa	%o4,	[%l7 + %i6] 0x81
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x48, %o4
	ldsb	[%l7 + %o4],	%l0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xd0
	ld	[%l7 + 0x68],	%f5
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x88,	%o6
	nop
	set	0x60, %l3
	std	%g6,	[%l7 + %l3]
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	nop
	set	0x10, %o3
	stx	%o6,	[%l7 + %o3]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f0
	set	0x4C, %i0
	stba	%l1,	[%l7 + %i0] 0x88
	nop
	set	0x37, %i1
	ldsb	[%l7 + %i1],	%o2
	nop
	set	0x7E, %l4
	ldsb	[%l7 + %l4],	%i7
	wr	%l6,	%l4,	%clear_softint
	or	%i0,	%o0,	%i1
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x20, %l1
	stda	%l2,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x20, %l2
	ldda	[%l7 + %l2] 0xea,	%g2
	ld	[%l7 + 0x24],	%f15
	nop
	set	0x20, %i7
	std	%f16,	[%l7 + %i7]
	nop
	set	0x5B, %g2
	stb	%g3,	[%l7 + %g2]
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%g4
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%i4
	nop
	set	0x34, %g5
	stw	%o5,	[%l7 + %g5]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f6
	set	0x70, %i5
	stxa	%g1,	[%l7 + %i5] 0x89
	fpadd16s	%f5,	%f30,	%f20
	nop
	set	0x2C, %i2
	swap	[%l7 + %i2],	%i2
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f10
	set	0x74, %l5
	sta	%f3,	[%l7 + %l5] 0x80
	nop
	set	0x60, %l6
	stx	%fsr,	[%l7 + %l6]
	and	%l5,	%i3,	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%g7
	set	0x68, %i3
	stxa	%g5,	[%l7 + %i3] 0x88
	nop
	set	0x64, %g6
	swap	[%l7 + %g6],	%i4
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%o4
	wr	%l0,	%i6,	%softint
	ld	[%l7 + 0x38],	%f3
	nop
	set	0x78, %i6
	ldsb	[%l7 + %i6],	%g6
	nop
	set	0x70, %o4
	stw	%o7,	[%l7 + %o4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%l1
	set	0x1C, %o1
	lda	[%l7 + %o1] 0x89,	%f13
	set	0x3C, %o0
	stwa	%o6,	[%l7 + %o0] 0xe3
	membar	#Sync
	and	%o2,	%i7,	%l4
	ld	[%l7 + 0x20],	%f12
	nop
	set	0x48, %g7
	std	%i6,	[%l7 + %g7]
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%i0
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x81,	%i1
	set	0x38, %o6
	lda	[%l7 + %o6] 0x81,	%f2
	nop
	set	0x68, %i1
	lduh	[%l7 + %i1],	%o0
	add	%l3,	%g3,	%g4
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%g2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x1E, %l4
	ldsb	[%l7 + %l4],	%i5
	nop
	set	0x40, %l1
	std	%f2,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x0C]
	ld	[%l7 + 0x48],	%f2
	wr	%o5,	%g1,	%sys_tick
	nop
	set	0x3E, %l2
	ldsh	[%l7 + %l2],	%l5
	nop
	set	0x2E, %i7
	ldsh	[%l7 + %i7],	%i2
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xeb,	%i2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x20, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%l2
	nop
	set	0x13, %g5
	stb	%g7,	[%l7 + %g5]
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x88,	 2
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	set	0x40, %i5
	swapa	[%l7 + %i5] 0x80,	%i4
	st	%fsr,	[%l7 + 0x30]
	fpadd32	%f16,	%f16,	%f18
	or	%o4,	%i6,	%l0
	set	0x3A, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o7
	and	%g6,	%l1,	%o3
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x80,	%o2
	set	0x34, %g3
	sta	%f30,	[%l7 + %g3] 0x80
	and	%i7,	%o6,	%l4
	nop
	set	0x48, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x4C, %i3
	sth	%i0,	[%l7 + %i3]
	set	0x40, %g6
	lda	[%l7 + %g6] 0x89,	%f21
	nop
	set	0x62, %o2
	ldstub	[%l7 + %o2],	%l6
	set	0x18, %i6
	lda	[%l7 + %i6] 0x80,	%f26
	nop
	set	0x4D, %o4
	ldsb	[%l7 + %o4],	%i1
	set	0x2C, %o1
	lda	[%l7 + %o1] 0x89,	%f10
	nop
	set	0x42, %l5
	lduh	[%l7 + %l5],	%l3
	and	%g3,	%o0,	%g4
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xea,	%i4
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x88,	%o5
	nop
	set	0x7E, %o3
	ldsh	[%l7 + %o3],	%g1
	nop
	set	0x3C, %l0
	stw	%g2,	[%l7 + %l0]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f16
	and	%i2,	%i3,	%l5
	nop
	set	0x5C, %l3
	ldsw	[%l7 + %l3],	%g7
	set	0x16, %i0
	stba	%g5,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x58, %i1
	std	%f8,	[%l7 + %i1]
	set	0x48, %l1
	stha	%o1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x70, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%l2
	nop
	set	0x3E, %o5
	ldstub	[%l7 + %o5],	%i4
	fpadd32s	%f27,	%f3,	%f13
	set	0x30, %g2
	stda	%i6,	[%l7 + %g2] 0x88
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f0
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%o4
	set	0x7D, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o7
	add	%g6,	%l1,	%l0
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x89,	%o2
	nop
	set	0x58, %g4
	std	%i6,	[%l7 + %g4]
	nop
	set	0x4D, %i2
	stb	%o3,	[%l7 + %i2]
	nop
	set	0x0C, %o7
	stb	%l4,	[%l7 + %o7]
	set	0x58, %i5
	stda	%i0,	[%l7 + %i5] 0x88
	set	0x18, %g3
	stda	%i6,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x77, %l6
	stb	%i1,	[%l7 + %l6]
	nop
	set	0x49, %g6
	ldub	[%l7 + %g6],	%l3
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f6
	set	0x34, %o2
	stba	%g3,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x0E, %o4
	ldsb	[%l7 + %o4],	%o6
	and	%g4,	%o0,	%i5
	nop
	set	0x28, %i6
	std	%f12,	[%l7 + %i6]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x81
	bleu,a,pt	%icc,	loop_199
	and	%g1,	%o5,	%i2
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%i3
	nop
	set	0x5A, %l5
	ldsb	[%l7 + %l5],	%g2
loop_199:
	nop
	set	0x2C, %g7
	prefetch	[%l7 + %g7],	 4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	nop
	set	0x24, %o6
	stw	%l5,	[%l7 + %o6]
	nop
	set	0x0F, %l0
	ldsb	[%l7 + %l0],	%g7
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xda
	nop
	set	0x72, %l3
	sth	%o1,	[%l7 + %l3]
	nop
	set	0x78, %i1
	lduw	[%l7 + %i1],	%g5
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x88,	%l2
	ld	[%l7 + 0x7C],	%f30
	or	%o4,	%o7,	%i6
	set	0x08, %i7
	swapa	[%l7 + %i7] 0x88,	%l1
	and	%g6,	%l0,	%i7
	st	%f24,	[%l7 + 0x60]
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f2
	set	0x65, %g5
	stba	%o2,	[%l7 + %g5] 0x89
	nop
	set	0x2A, %l2
	ldstub	[%l7 + %l2],	%o3
	nop
	set	0x68, %g1
	std	%l4,	[%l7 + %g1]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc0
	ld	[%l7 + 0x28],	%f30
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x3C, %g4
	stw	%i0,	[%l7 + %g4]
	set	0x6F, %i2
	stba	%l3,	[%l7 + %i2] 0x81
	add	%o6,	%g4,	%o0
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%g2
	nop
	nop
	setx	0x9A9BF55B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x10BB984C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f9,	%f10
	nop
	set	0x75, %g3
	ldstub	[%l7 + %g3],	%i5
	set	0x70, %i5
	stha	%g1,	[%l7 + %i5] 0xea
	membar	#Sync
	ld	[%l7 + 0x3C],	%f9
	nop
	set	0x12, %g6
	ldsh	[%l7 + %g6],	%o5
	nop
	set	0x78, %i3
	std	%f24,	[%l7 + %i3]
	add	%i2,	%g2,	%i3
	nop
	set	0x38, %o2
	ldsw	[%l7 + %o2],	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%l2
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f26
	st	%f22,	[%l7 + 0x24]
	nop
	set	0x5E, %l6
	sth	%g5,	[%l7 + %l6]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	add	%o4,	%i6,	%o7
	nop
	nop
	setx	0xE81578FD7028C6C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xBB67040DCE64B349,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f26,	%f4
	ld	[%l7 + 0x74],	%f17
	set	0x18, %o0
	stda	%l0,	[%l7 + %o0] 0xeb
	membar	#Sync
	or	%l0,	%g6,	%o2
	set	0x08, %i6
	stda	%i6,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x2C, %l5
	ldub	[%l7 + %l5],	%l4
	set	0x10, %g7
	stda	%o2,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x50, %o6
	swap	[%l7 + %o6],	%l6
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x80,	%i1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xea,	%l2
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd8
	set	0x7C, %l1
	lda	[%l7 + %l1] 0x89,	%f6
	nop
	set	0x4F, %i1
	ldstub	[%l7 + %i1],	%o6
	nop
	set	0x20, %l4
	stw	%i0,	[%l7 + %l4]
	nop
	set	0x40, %i7
	std	%o0,	[%l7 + %i7]
	nop
	set	0x30, %o5
	std	%f28,	[%l7 + %o5]
	st	%f11,	[%l7 + 0x4C]
	set	0x08, %g5
	stwa	%g4,	[%l7 + %g5] 0x89
	nop
	set	0x56, %g2
	ldsh	[%l7 + %g2],	%g3
	nop
	set	0x08, %g1
	swap	[%l7 + %g1],	%i5
	or	%o5,	%i2,	%g1
	ld	[%l7 + 0x6C],	%f24
	set	0x10, %i4
	stxa	%g2,	[%l7 + %i4] 0x80
	nop
	nop
	setx	0x185431D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x5E590A33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f8,	%f29
	add	%i3,	%l5,	%g7
	ld	[%l7 + 0x3C],	%f5
	set	0x30, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o1
	set	0x44, %g4
	stwa	%i4,	[%l7 + %g4] 0x80
	nop
	set	0x43, %i2
	ldstub	[%l7 + %i2],	%l2
	nop
	set	0x08, %g3
	std	%o4,	[%l7 + %g3]
	nop
	set	0x70, %o7
	stx	%i6,	[%l7 + %o7]
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x81,	%f24
	set	0x36, %i5
	stha	%o7,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%l0
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f16
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%g6,	%o2,	%l1
	set	0x0A, %o2
	stha	%i7,	[%l7 + %o2] 0x80
	nop
	set	0x08, %l6
	lduh	[%l7 + %l6],	%o3
	set	0x0F, %o0
	stba	%l6,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x60, %i6
	stxa	%i1,	[%l7 + %i6] 0xe3
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%o6
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f16
	set	0x48, %l5
	lda	[%l7 + %l5] 0x89,	%f17
	be,a	%xcc,	loop_200
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%g4
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x89,	%g3
loop_200:
	nop
	set	0x76, %o3
	lduh	[%l7 + %o3],	%i5
	set	0x0A, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o5
	set	0x48, %l3
	stxa	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x5E, %i0
	ldsh	[%l7 + %i0],	%g1
	nop
	set	0x36, %l1
	ldsb	[%l7 + %l1],	%g2
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%i3
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x81,	%i2
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%l5
	set	0x78, %i1
	stba	%g7,	[%l7 + %i1] 0x80
	or	%i4,	%o1,	%l2
	nop
	set	0x2B, %g5
	ldub	[%l7 + %g5],	%o4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd0
	set	0x34, %i4
	swapa	[%l7 + %i4] 0x89,	%i6
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x88,	 3
	set	0x34, %i2
	swapa	[%l7 + %i2] 0x89,	%g6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA66, 	%sys_tick_cmpr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i1
	set	0x7C, %g3
	lda	[%l7 + %g3] 0x80,	%f25
	nop
	set	0x08, %o7
	sth	%o3,	[%l7 + %o7]
	set	0x20, %g6
	sta	%f3,	[%l7 + %g6] 0x81
	nop
	set	0x6E, %g1
	stb	%l3,	[%l7 + %g1]
	bne,a,pt	%xcc,	loop_201
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%l4
	set	0x7B, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o6
loop_201:
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f10
	nop
	set	0x44, %o2
	lduh	[%l7 + %o2],	%g4
	set	0x08, %o0
	swapa	[%l7 + %o0] 0x88,	%g3
	nop
	set	0x0E, %i6
	ldub	[%l7 + %i6],	%i5
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x80,	%i0
	or	%o0,	%g1,	%g2
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%o5
	nop
	set	0x68, %o6
	ldub	[%l7 + %o6],	%i3
	nop
	set	0x24, %g7
	ldsw	[%l7 + %g7],	%i2
	or	%g7,	%i4,	%l5
	set	0x44, %l6
	swapa	[%l7 + %l6] 0x80,	%o1
	bl,a,pn	%xcc,	loop_202
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%l2
	ld	[%l7 + 0x30],	%f5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%g5
loop_202:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%g6
	nop
	set	0x24, %o3
	stb	%l0,	[%l7 + %o3]
	nop
	set	0x30, %l3
	std	%l0,	[%l7 + %l3]
	nop
	set	0x18, %l1
	std	%f30,	[%l7 + %l1]
	nop
	set	0x58, %i0
	lduw	[%l7 + %i0],	%o2
	set	0x44, %l4
	lda	[%l7 + %l4] 0x80,	%f0
	nop
	set	0x52, %o5
	sth	%i7,	[%l7 + %o5]
	set	0x30, %i7
	lda	[%l7 + %i7] 0x88,	%f2
	add	%o7,	%l6,	%i1
	nop
	set	0x12, %g5
	lduh	[%l7 + %g5],	%o3
	nop
	set	0x6E, %g2
	ldsh	[%l7 + %g2],	%l4
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%o6
	or	%g4,	%g3,	%l3
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xea,	%i4
	nop
	set	0x58, %g4
	sth	%i0,	[%l7 + %g4]
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x80,	%o0
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f8
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%o5
	nop
	set	0x24, %g6
	ldstub	[%l7 + %g6],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%i3
	nop
	set	0x40, %g1
	ldub	[%l7 + %g1],	%g7
	or	%i4,	%o1,	%l2
	nop
	set	0x28, %i3
	std	%l4,	[%l7 + %i3]
	nop
	set	0x1E, %i2
	lduh	[%l7 + %i2],	%o4
	add	%g5,	%i6,	%g6
	set	0x64, %o4
	sta	%f28,	[%l7 + %o4] 0x81
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f28
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%o2
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%l0
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	nop
	set	0x24, %i6
	swap	[%l7 + %i6],	%o7
	nop
	set	0x60, %o1
	stx	%i1,	[%l7 + %o1]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o3
	set	0x40, %l5
	stwa	%o6,	[%l7 + %l5] 0x81
	nop
	set	0x08, %g7
	stx	%g4,	[%l7 + %g7]
	nop
	set	0x10, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	set	0x54, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x0C, %o6
	prefetch	[%l7 + %o6],	 0
	add	%g3,	%l4,	%l3
	set	0x78, %l3
	stxa	%i0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x08, %i0
	prefetch	[%l7 + %i0],	 3
	fpadd16	%f10,	%f28,	%f22
	set	0x14, %l1
	lda	[%l7 + %l1] 0x80,	%f31
	st	%f4,	[%l7 + 0x5C]
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x81,	%i5
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%o0
	set	0x10, %i7
	sta	%f12,	[%l7 + %i7] 0x81
	set	0x4E, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o5
	nop
	set	0x40, %i1
	std	%f16,	[%l7 + %i1]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%i2
	nop
	set	0x58, %g5
	std	%i2,	[%l7 + %g5]
	fpadd16s	%f19,	%f3,	%f3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%g7
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x88,	%i4
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%l2
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xda
	set	0x24, %o7
	stha	%l5,	[%l7 + %o7] 0x88
	st	%f7,	[%l7 + 0x70]
	set	0x08, %g6
	lda	[%l7 + %g6] 0x88,	%f31
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%o1
	nop
	set	0x64, %g1
	swap	[%l7 + %g1],	%g5
	nop
	nop
	setx	0xFE135998,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xB661E10B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f31,	%f25
	nop
	set	0x08, %i3
	lduw	[%l7 + %i3],	%i6
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0
	nop
	set	0x7A, %g4
	sth	%o2,	[%l7 + %g4]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f22
	set	0x63, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l0
	st	%f21,	[%l7 + 0x68]
	ld	[%l7 + 0x28],	%f18
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x57, %o2
	ldstub	[%l7 + %o2],	%i7
	set	0x12, %i5
	stha	%g6,	[%l7 + %i5] 0x80
	nop
	set	0x38, %o1
	stx	%o7,	[%l7 + %o1]
	st	%f5,	[%l7 + 0x54]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f0
	or	%i1,	%l6,	%o6
	set	0x10, %g7
	stba	%o3,	[%l7 + %g7] 0x81
	or	%g3,	%g4,	%l3
	nop
	set	0x78, %l6
	lduw	[%l7 + %l6],	%i0
	nop
	set	0x2F, %l5
	ldstub	[%l7 + %l5],	%i5
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%o0
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%l4
	set	0x24, %o3
	lda	[%l7 + %o3] 0x89,	%f11
	nop
	set	0x4A, %o6
	sth	%o5,	[%l7 + %o6]
	set	0x28, %l1
	stwa	%g1,	[%l7 + %l1] 0x88
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf1
	membar	#Sync
	add	%i2,	%g2,	%i3
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x81,	%g7
	nop
	set	0x60, %l4
	ldx	[%l7 + %l4],	%i4
	nop
	set	0x2C, %g2
	swap	[%l7 + %g2],	%l5
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f8
	or	%o4,	%l2,	%o1
	set	0x20, %g5
	stha	%i6,	[%l7 + %g5] 0x88
	nop
	set	0x74, %l2
	sth	%g5,	[%l7 + %l2]
	set	0x70, %i7
	stha	%o2,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x08, %i4
	sth	%l1,	[%l7 + %i4]
	set	0x10, %g3
	stwa	%l0,	[%l7 + %g3] 0x88
	and	%g6,	%o7,	%i1
	set	0x58, %o7
	swapa	[%l7 + %o7] 0x80,	%l6
	nop
	set	0x4C, %g6
	sth	%i7,	[%l7 + %g6]
	set	0x44, %i3
	lda	[%l7 + %i3] 0x80,	%f30
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	set	0x54, %g4
	stwa	%g3,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x2C, %g1
	ldsw	[%l7 + %g1],	%g4
	nop
	nop
	setx	0x94BD45B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xBFF4FF3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f18,	%f22
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x89,	%l3
	set	0x38, %o2
	stba	%o3,	[%l7 + %o2] 0x89
	nop
	set	0x54, %i5
	stw	%i5,	[%l7 + %i5]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc8
	nop
	set	0x3C, %o0
	ldsh	[%l7 + %o0],	%o0
	nop
	set	0x40, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%l4
	nop
	set	0x44, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x08, %l0
	stx	%o5,	[%l7 + %l0]
	ld	[%l7 + 0x70],	%f28
	nop
	set	0x64, %l3
	lduw	[%l7 + %l3],	%g1
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%i0
	set	0x7F, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g2
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%i3
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x88,	%i2
	st	%f20,	[%l7 + 0x70]
	nop
	set	0x60, %i0
	stx	%g7,	[%l7 + %i0]
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%i4
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%l5
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe3,	%o4
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%o0
	set	0x3A, %g2
	stha	%i6,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x28, %l2
	lduw	[%l7 + %l2],	%g5
	set	0x28, %i7
	sta	%f15,	[%l7 + %i7] 0x88
	add	%o2,	%l2,	%l1
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f16
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%l0
	nop
	set	0x70, %g6
	std	%g6,	[%l7 + %g6]
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f26
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xda
	set	0x54, %i3
	lda	[%l7 + %i3] 0x81,	%f28
	nop
	set	0x0B, %g1
	ldub	[%l7 + %g1],	%i1
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x68, %o2
	stxa	%l6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	set	0x79, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x59, %o0
	ldub	[%l7 + %o0],	%o7
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%g4
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%o3
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o0
	nop
	set	0x44, %l0
	stw	%l3,	[%l7 + %l0]
	set	0x08, %o3
	stxa	%o5,	[%l7 + %o3] 0x88
	add	%l4,	%g1,	%i0
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x1E, %o6
	sth	%g2,	[%l7 + %o6]
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x89,	%i2
	set	0x6E, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i2
	set	0x40, %o5
	stda	%g6,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x6A, %l1
	stba	%l5,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1263
!	Type a   	: 16
!	Type cti   	: 25
!	Type x   	: 532
!	Type f   	: 39
!	Type i   	: 125
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
	set	0x8,	%g1
	set	0x1,	%g2
	set	0xC,	%g3
	set	0xB,	%g4
	set	0x4,	%g5
	set	0x3,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x1,	%i1
	set	-0xF,	%i2
	set	-0x5,	%i3
	set	-0xF,	%i4
	set	-0x5,	%i5
	set	-0x5,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x6A9E16D9,	%l0
	set	0x64BE5359,	%l1
	set	0x4F6B11D7,	%l2
	set	0x1BF7E12E,	%l3
	set	0x457B0329,	%l4
	set	0x1B61ABFB,	%l5
	set	0x65E7A0B4,	%l6
	!# Output registers
	set	-0x05DF,	%o0
	set	0x15C3,	%o1
	set	0x1F10,	%o2
	set	-0x15AD,	%o3
	set	-0x13E6,	%o4
	set	0x0E6A,	%o5
	set	-0x1125,	%o6
	set	0x018E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xCD16732133216BD5)
	INIT_TH_FP_REG(%l7,%f2,0x40A0381EF6B1DDE1)
	INIT_TH_FP_REG(%l7,%f4,0xB295A57F36BBA3DD)
	INIT_TH_FP_REG(%l7,%f6,0xF3442E2BB29D5CF5)
	INIT_TH_FP_REG(%l7,%f8,0xE15AE39F72C7E69E)
	INIT_TH_FP_REG(%l7,%f10,0xA76E98C5C88A87D6)
	INIT_TH_FP_REG(%l7,%f12,0xF0B3B2E5FAF40099)
	INIT_TH_FP_REG(%l7,%f14,0xEA18376F970549A0)
	INIT_TH_FP_REG(%l7,%f16,0x84219F30A93C04E0)
	INIT_TH_FP_REG(%l7,%f18,0x1E860E16786CB6D1)
	INIT_TH_FP_REG(%l7,%f20,0x2205B095BA76A409)
	INIT_TH_FP_REG(%l7,%f22,0xB485670A44EB28FE)
	INIT_TH_FP_REG(%l7,%f24,0xFD892A8523931793)
	INIT_TH_FP_REG(%l7,%f26,0x4DF8B75557682B8E)
	INIT_TH_FP_REG(%l7,%f28,0xA4880663CA4592B7)
	INIT_TH_FP_REG(%l7,%f30,0xF24CD3C8F5E95DB0)

	!# Execute Main Diag ..

	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f0
	ble,pt	%icc,	loop_203
	nop
	set	0x68, %g5
	sth	%i4,	[%l7 + %g5]
	set	0x40, %l2
	lda	[%l7 + %l2] 0x80,	%f2
loop_203:
	nop
	set	0x3C, %g2
	stw	%o1,	[%l7 + %g2]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd0
	nop
	set	0x52, %g3
	lduh	[%l7 + %g3],	%i6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf1
	membar	#Sync
	set	0x60, %o7
	stwa	%g5,	[%l7 + %o7] 0xea
	membar	#Sync
	fpsub32s	%f23,	%f29,	%f20
	bgu,a,pt	%xcc,	loop_204
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%o2
	set	0x14, %i4
	swapa	[%l7 + %i4] 0x89,	%l2
loop_204:
	nop
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x80,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%g6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%l6
	nop
	set	0x3C, %g1
	swap	[%l7 + %g1],	%i1
	nop
	set	0x78, %g4
	std	%f18,	[%l7 + %g4]
	nop
	set	0x58, %o2
	std	%i6,	[%l7 + %o2]
	wr	%o7,	%g3,	%y
	nop
	set	0x18, %o1
	std	%o6,	[%l7 + %o1]
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	nop
	set	0x4E, %i5
	ldub	[%l7 + %i5],	%o3
	nop
	set	0x30, %l6
	stx	%i5,	[%l7 + %l6]
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%o0
	set	0x60, %g7
	lda	[%l7 + %g7] 0x89,	%f9
	set	0x30, %l0
	lda	[%l7 + %l0] 0x89,	%f1
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x88,	 4
	nop
	set	0x4A, %o4
	ldsh	[%l7 + %o4],	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%i0
	set	0x10, %l3
	lda	[%l7 + %l3] 0x81,	%f4
	nop
	set	0x7E, %o6
	sth	%g2,	[%l7 + %o6]
	nop
	set	0x4C, %i0
	lduh	[%l7 + %i0],	%g1
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%i3
	nop
	set	0x40, %l1
	ldsw	[%l7 + %l1],	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%l5
	st	%fsr,	[%l7 + 0x7C]
	and	%o1,	%i4,	%g5
	nop
	set	0x60, %i1
	stx	%o2,	[%l7 + %i1]
	nop
	set	0x70, %l4
	ldsh	[%l7 + %l4],	%l2
	set	0x58, %g5
	stxa	%l1,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%o4,	%i6,	%g6
	nop
	set	0x70, %l2
	swap	[%l7 + %l2],	%l6
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x88,	%i1
	nop
	set	0x08, %i6
	std	%l0,	[%l7 + %i6]
	nop
	set	0x7C, %g3
	swap	[%l7 + %g3],	%i7
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f18
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%f14,	[%l7 + 0x3C]
	set	0x28, %i4
	stxa	%o7,	[%l7 + %i4] 0x81
	set	0x30, %i3
	stda	%o6,	[%l7 + %i3] 0x88
	set	0x2C, %g1
	stha	%g4,	[%l7 + %g1] 0x81
	or	%o3,	%g3,	%i5
	set	0x18, %g4
	stda	%l2,	[%l7 + %g4] 0x80
	set	0x20, %o2
	stba	%o0,	[%l7 + %o2] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%l4
	nop
	set	0x18, %o7
	stw	%i0,	[%l7 + %o7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%i3
	nop
	set	0x3E, %o0
	sth	%g2,	[%l7 + %o0]
	set	0x38, %o1
	stxa	%g7,	[%l7 + %o1] 0x81
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x80,	%f6
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f28
	bleu,a,pn	%xcc,	loop_205
	nop
	set	0x60, %i5
	std	%f20,	[%l7 + %i5]
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x80,	%i2
loop_205:
	nop
	set	0x6A, %o3
	ldstuba	[%l7 + %o3] 0x88,	%l5
	st	%f20,	[%l7 + 0x64]
	nop
	set	0x74, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x81,	 4
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%g5
	bl,a,pt	%icc,	loop_206
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%i4
	nop
	set	0x3E, %o5
	ldsh	[%l7 + %o5],	%o2
	set	0x20, %i0
	stda	%l0,	[%l7 + %i0] 0xe3
	membar	#Sync
loop_206:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd2,	%f0
	nop
	set	0x60, %l4
	swap	[%l7 + %l4],	%l2
	set	0x40, %g5
	stda	%i6,	[%l7 + %g5] 0x88
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x81,	%o4
	nop
	set	0x30, %g2
	lduh	[%l7 + %g2],	%g6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xda
	fpsub32s	%f20,	%f18,	%f20
	add	%l6,	%l0,	%i1
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f0
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%f11,	[%l7 + 0x48]
	or	%o7,	%o6,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%g3
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x24, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x5C, %i4
	stw	%i5,	[%l7 + %i4]
	nop
	set	0x68, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x30, %i3
	lduw	[%l7 + %i3],	%g4
	set	0x20, %g4
	stba	%o0,	[%l7 + %g4] 0x80
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%o5
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x1E, %o2
	sth	%l4,	[%l7 + %o2]
	nop
	set	0x12, %o0
	sth	%l3,	[%l7 + %o0]
	nop
	set	0x16, %l6
	ldub	[%l7 + %l6],	%i0
	nop
	set	0x2C, %l5
	sth	%g1,	[%l7 + %l5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%g2
	nop
	set	0x2A, %i5
	ldstub	[%l7 + %i5],	%g7
	nop
	set	0x54, %o1
	swap	[%l7 + %o1],	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%l5
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%i4
	add	%o2,	%l1,	%l2
	ba,pt	%icc,	loop_207
	and	%i6,	%o4,	%g5
	or	%l6,	%l0,	%i1
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x89,	%o6
loop_207:
	nop
	set	0x36, %l3
	stha	%o6,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x44, %l0
	lda	[%l7 + %l0] 0x80,	%f18
	ba	%icc,	loop_208
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%g6
	nop
	set	0x20, %o4
	std	%f30,	[%l7 + %o4]
	nop
	set	0x2C, %o5
	ldsw	[%l7 + %o5],	%o3
loop_208:
	nop
	set	0x28, %l1
	stxa	%g3,	[%l7 + %l1] 0x89
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%i7
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x69, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g4
	set	0x28, %g2
	stxa	%i5,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%o5
	nop
	set	0x38, %i1
	std	%f2,	[%l7 + %i1]
	nop
	set	0x38, %i6
	std	%f8,	[%l7 + %i6]
	nop
	set	0x40, %i7
	lduw	[%l7 + %i7],	%o0
	ld	[%l7 + 0x78],	%f16
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f28
	nop
	set	0x32, %g3
	lduh	[%l7 + %g3],	%l3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	nop
	set	0x28, %i4
	std	%l4,	[%l7 + %i4]
	set	0x10, %g4
	ldda	[%l7 + %g4] 0xe3,	%i0
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%i3
	nop
	set	0x1E, %o7
	ldub	[%l7 + %o7],	%g2
	nop
	set	0x64, %o2
	sth	%g7,	[%l7 + %o2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%g1
	set	0x7C, %i3
	sta	%f11,	[%l7 + %i3] 0x88
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%o0
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%l5
	set	0x33, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i4
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xca
	and	%l1,	%l2,	%o2
	set	0x68, %o3
	stha	%i6,	[%l7 + %o3] 0x80
	ld	[%l7 + 0x34],	%f5
	nop
	set	0x12, %g7
	ldsh	[%l7 + %g7],	%g5
	nop
	set	0x48, %l3
	std	%f30,	[%l7 + %l3]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc0
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%l6
	nop
	set	0x62, %o6
	ldub	[%l7 + %o6],	%o4
	add	%l0,	%o7,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%g6
	st	%f6,	[%l7 + 0x10]
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%g3
	set	0x78, %o4
	stda	%i6,	[%l7 + %o4] 0x81
	nop
	set	0x6C, %l1
	stw	%o3,	[%l7 + %l1]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%o5
	nop
	set	0x2F, %l4
	stb	%o0,	[%l7 + %l4]
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%g4
	nop
	set	0x40, %l2
	stx	%l3,	[%l7 + %l2]
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%l4
	st	%f2,	[%l7 + 0x7C]
	nop
	set	0x38, %i0
	std	%f18,	[%l7 + %i0]
	nop
	set	0x3A, %i6
	ldsh	[%l7 + %i6],	%i3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%g2
	fpadd16s	%f20,	%f27,	%f2
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x80,	%i2
	set	0x1A, %i7
	stha	%g7,	[%l7 + %i7] 0x80
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f18
	nop
	set	0x66, %i2
	lduh	[%l7 + %i2],	%g1
	nop
	set	0x10, %g3
	stw	%l5,	[%l7 + %g3]
	bne,pt	%xcc,	loop_209
	add	%o1,	%l1,	%i4
	nop
	set	0x1E, %i4
	sth	%o2,	[%l7 + %i4]
	nop
	set	0x68, %g1
	ldstub	[%l7 + %g1],	%i6
loop_209:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%l6
	set	0x34, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o4
	nop
	set	0x40, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x64, %o2
	swap	[%l7 + %o2],	%g5
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%o7
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x81,	%o6
	nop
	set	0x10, %o0
	ldstub	[%l7 + %o0],	%l0
	nop
	set	0x44, %o1
	prefetch	[%l7 + %o1],	 4
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x81,	%g6
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%i1
	set	0x58, %g7
	stxa	%g3,	[%l7 + %g7] 0x88
	nop
	set	0x36, %l0
	ldsh	[%l7 + %l0],	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB4C, 	%tick_cmpr
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x88,	%i5
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f30
	nop
	set	0x16, %o5
	ldub	[%l7 + %o5],	%o0
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%g4
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x89,	 4
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0
	set	0x3D, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i0
	wr	%g2,	%i2,	%set_softint
	nop
	set	0x45, %l1
	ldsb	[%l7 + %l1],	%g7
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x89,	%i3
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%g1
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%l5
	or	%l1,	%o1,	%o2
	nop
	set	0x1E, %l2
	stb	%i4,	[%l7 + %l2]
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x28, %g6
	ldsh	[%l7 + %g6],	%i6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f0
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x88,	%l2
	set	0x3C, %i4
	swapa	[%l7 + %i4] 0x89,	%o4
	ld	[%l7 + 0x2C],	%f20
	set	0x44, %i7
	stwa	%g5,	[%l7 + %i7] 0x88
	set	0x14, %g1
	lda	[%l7 + %g1] 0x81,	%f8
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x88,	%o6
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%o6
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%l0
	or	%l6,	%g6,	%g3
	set	0x34, %g4
	sta	%f11,	[%l7 + %g4] 0x80
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x4C, %l5
	sth	%o3,	[%l7 + %l5]
	set	0x20, %o1
	sta	%f22,	[%l7 + %o1] 0x88
	nop
	set	0x2E, %l6
	ldstub	[%l7 + %l6],	%i1
	nop
	set	0x28, %o3
	stx	%o5,	[%l7 + %o3]
	set	0x24, %g7
	stwa	%i5,	[%l7 + %g7] 0xeb
	membar	#Sync
	ld	[%l7 + 0x14],	%f22
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
	set	0x60, %l0
	ldxa	[%l7 + %l0] 0x88,	%i7
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%o0
	set	0x60, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l3
	set	0x5D, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	set	0x2E, %o4
	stha	%i0,	[%l7 + %o4] 0x89
	or	%g2,	%g7,	%i2
	nop
	set	0x70, %l1
	ldsh	[%l7 + %l1],	%g1
	set	0x48, %g2
	stxa	%l5,	[%l7 + %g2] 0x80
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc4
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%l0
	nop
	set	0x6D, %l2
	ldsb	[%l7 + %l2],	%o1
	nop
	set	0x40, %g5
	sth	%o2,	[%l7 + %g5]
	add	%i4,	%i6,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%g5
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%l2
	set	0x1F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%l6
	nop
	set	0x42, %i2
	lduh	[%l7 + %i2],	%l0
	nop
	set	0x15, %i4
	ldsb	[%l7 + %i4],	%g3
	nop
	set	0x74, %i7
	lduw	[%l7 + %i7],	%g6
	nop
	set	0x28, %g1
	std	%f20,	[%l7 + %g1]
	set	0x48, %o7
	stwa	%i1,	[%l7 + %o7] 0x88
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	set	0x4B, %o2
	stba	%o5,	[%l7 + %o2] 0x89
	nop
	set	0x65, %g4
	ldsb	[%l7 + %g4],	%o3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%g4
	nop
	set	0x43, %o0
	stb	%i5,	[%l7 + %o0]
	nop
	set	0x20, %l5
	std	%f20,	[%l7 + %l5]
	nop
	set	0x40, %o1
	stw	%l3,	[%l7 + %o1]
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x88,	%l4
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f18
	and	%o0,	%i0,	%g2
	nop
	set	0x3A, %o3
	ldub	[%l7 + %o3],	%i2
	nop
	set	0x3F, %i5
	ldub	[%l7 + %i5],	%g1
	nop
	set	0x38, %g7
	ldsw	[%l7 + %g7],	%l5
	nop
	set	0x28, %l0
	ldsw	[%l7 + %l0],	%g7
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x88,	 1
	set	0x68, %l3
	stda	%o2,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x38, %o5
	ldsw	[%l7 + %o5],	%i4
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%i6
	nop
	set	0x36, %l1
	ldstub	[%l7 + %l1],	%l1
	st	%f21,	[%l7 + 0x10]
	st	%f29,	[%l7 + 0x48]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%g5
	st	%fsr,	[%l7 + 0x0C]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%o6
	set	0x10, %o4
	ldda	[%l7 + %o4] 0xea,	%o6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc0
	nop
	set	0x19, %i0
	stb	%l6,	[%l7 + %i0]
	or	%l2,	%g3,	%l0
	nop
	set	0x63, %l2
	ldsb	[%l7 + %l2],	%g6
	nop
	set	0x30, %i6
	stw	%i1,	[%l7 + %i6]
	nop
	set	0x4C, %g6
	ldstub	[%l7 + %g6],	%o5
	nop
	set	0x50, %g5
	std	%f10,	[%l7 + %g5]
	nop
	set	0x58, %i1
	lduw	[%l7 + %i1],	%i7
	nop
	set	0x44, %i4
	stw	%o3,	[%l7 + %i4]
	set	0x44, %i7
	stwa	%g4,	[%l7 + %i7] 0x89
	nop
	set	0x78, %g1
	stx	%i5,	[%l7 + %g1]
	nop
	set	0x0A, %o7
	lduh	[%l7 + %o7],	%l4
	st	%fsr,	[%l7 + 0x7C]
	set	0x40, %i2
	stda	%o0,	[%l7 + %i2] 0x81
	nop
	set	0x48, %g3
	std	%i0,	[%l7 + %g3]
	and	%g2,	%l3,	%i2
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f12
	set	0x18, %g4
	stda	%l4,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x1C, %l5
	lda	[%l7 + %l5] 0x88,	%f4
	nop
	set	0x78, %o0
	std	%f6,	[%l7 + %o0]
	fpsub16	%f22,	%f8,	%f16
	nop
	set	0x6E, %l6
	ldsb	[%l7 + %l6],	%g1
	nop
	set	0x62, %o1
	ldstub	[%l7 + %o1],	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%o1
	nop
	set	0x66, %i3
	lduh	[%l7 + %i3],	%i4
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x81,	%i6
	set	0x40, %g7
	swapa	[%l7 + %g7] 0x81,	%o4
	nop
	set	0x38, %o3
	lduh	[%l7 + %o3],	%l1
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%g5
	nop
	set	0x0D, %l0
	ldsb	[%l7 + %l0],	%i3
	nop
	set	0x50, %l3
	stx	%o7,	[%l7 + %l3]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x88,	%o6
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%i6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%g2
	st	%f29,	[%l7 + 0x3C]
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%l0
	nop
	set	0x4C, %l2
	stb	%g6,	[%l7 + %l2]
	nop
	set	0x30, %i6
	ldstub	[%l7 + %i6],	%l2
	set	0x78, %g6
	stda	%i0,	[%l7 + %g6] 0x80
	nop
	set	0x2C, %l4
	lduw	[%l7 + %l4],	%i7
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	ld	[%l7 + 0x24],	%f18
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%g4
	nop
	set	0x33, %i1
	ldsb	[%l7 + %i1],	%i5
	bleu,a,pn	%xcc,	loop_210
	nop
	set	0x14, %i7
	stw	%o0,	[%l7 + %i7]
	nop
	set	0x2C, %o7
	ldstub	[%l7 + %o7],	%l4
	wr	%i0,	%g2,	%clear_softint
loop_210:
	nop
	set	0x45, %i2
	stba	%i2,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x88,	%l5
	nop
	set	0x30, %o2
	std	%l2,	[%l7 + %o2]
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%g0
	add	%o2,	%o1,	%g7
	nop
	set	0x2B, %g3
	ldsb	[%l7 + %g3],	%i4
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x08, %l5
	stx	%g5,	[%l7 + %l5]
	fpadd16	%f14,	%f22,	%f16
	set	0x08, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	set	0x28, %o1
	sta	%f27,	[%l7 + %o1] 0x89
	nop
	set	0x3B, %l6
	stb	%o7,	[%l7 + %l6]
	nop
	set	0x18, %i5
	sth	%i3,	[%l7 + %i5]
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f4
	set	0x20, %o3
	swapa	[%l7 + %o3] 0x80,	%l6
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f2
	nop
	set	0x62, %o6
	ldsh	[%l7 + %o6],	%g3
	nop
	set	0x68, %l0
	prefetch	[%l7 + %l0],	 3
	st	%f22,	[%l7 + 0x3C]
	nop
	set	0x60, %o5
	stw	%l0,	[%l7 + %o5]
	nop
	set	0x30, %l3
	std	%o6,	[%l7 + %l3]
	nop
	set	0x14, %o4
	ldsb	[%l7 + %o4],	%l2
	nop
	set	0x08, %g2
	ldsh	[%l7 + %g2],	%i1
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%g6
	set	0x20, %l1
	lda	[%l7 + %l1] 0x80,	%f7
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f10
	nop
	set	0x34, %l2
	swap	[%l7 + %l2],	%i7
	and	%o3,	%g4,	%i5
	wr	%o0,	%o5,	%pic
	or	%i0,	%l4,	%i2
	set	0x1C, %l4
	stha	%l5,	[%l7 + %l4] 0xe2
	membar	#Sync
	add	%g2,	%l3,	%g1
	nop
	set	0x78, %g5
	ldub	[%l7 + %g5],	%o2
	set	0x68, %i4
	sta	%f25,	[%l7 + %i4] 0x89
	nop
	set	0x4C, %g6
	lduw	[%l7 + %g6],	%o1
	nop
	set	0x08, %i7
	std	%f14,	[%l7 + %i7]
	set	0x70, %i1
	swapa	[%l7 + %i1] 0x81,	%i4
	nop
	set	0x38, %i2
	lduh	[%l7 + %i2],	%i6
	nop
	set	0x18, %g1
	std	%f12,	[%l7 + %g1]
	set	0x10, %o2
	sta	%f26,	[%l7 + %o2] 0x88
	nop
	set	0x74, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x1C, %g3
	stba	%g7,	[%l7 + %g3] 0xeb
	membar	#Sync
	and	%g5,	%l1,	%o4
	and	%i3,	%l6,	%g3
	nop
	set	0x0C, %o7
	prefetch	[%l7 + %o7],	 4
	set	0x4A, %l5
	stha	%o7,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%o6,	%l0,	%i1
	nop
	set	0x5C, %o0
	ldsb	[%l7 + %o0],	%l2
	set	0x78, %o1
	stda	%i6,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x79, %l6
	ldub	[%l7 + %l6],	%g6
	nop
	set	0x15, %i5
	ldub	[%l7 + %i5],	%g4
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x60, %i3
	stx	%o3,	[%l7 + %i3]
	st	%f10,	[%l7 + 0x3C]
	set	0x44, %g7
	sta	%f18,	[%l7 + %g7] 0x81
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%o0
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x78, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x72, %o6
	stba	%o5,	[%l7 + %o6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xda
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x64, %l3
	ldsh	[%l7 + %l3],	%l4
	nop
	set	0x75, %o4
	stb	%i2,	[%l7 + %o4]
	nop
	set	0x0A, %i0
	ldstub	[%l7 + %i0],	%i0
	set	0x70, %l1
	stwa	%g2,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x40, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x74, %l2
	lda	[%l7 + %l2] 0x81,	%f24
	nop
	set	0x47, %l4
	ldstub	[%l7 + %l4],	%l5
	nop
	set	0x46, %g5
	ldsh	[%l7 + %g5],	%g1
	st	%fsr,	[%l7 + 0x30]
	ld	[%l7 + 0x38],	%f29
	add	%o2,	%o1,	%l3
	set	0x14, %i4
	lda	[%l7 + %i4] 0x88,	%f21
	set	0x28, %g6
	stda	%i4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%g6
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f8
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x80,	%i6
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%g5
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x08, %g1
	stx	%l1,	[%l7 + %g1]
	set	0x64, %o2
	swapa	[%l7 + %o2] 0x81,	%o4
	add	%l6,	%g3,	%o7
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xeb,	%o6
	nop
	set	0x3C, %o7
	lduh	[%l7 + %o7],	%i3
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%i0
	nop
	set	0x54, %l5
	ldstub	[%l7 + %l5],	%l0
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f16
	set	0x7C, %o0
	stwa	%l2,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x5F, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g6
	nop
	set	0x50, %i5
	sth	%g4,	[%l7 + %i5]
	st	%f20,	[%l7 + 0x10]
	set	0x14, %o3
	stwa	%i7,	[%l7 + %o3] 0xea
	membar	#Sync
	and	%i5,	%o0,	%o5
	set	0x28, %i3
	lda	[%l7 + %i3] 0x88,	%f26
	nop
	set	0x72, %l0
	sth	%l4,	[%l7 + %l0]
	nop
	set	0x60, %g7
	lduh	[%l7 + %g7],	%o3
	ld	[%l7 + 0x44],	%f2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x80
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f12
	nop
	set	0x78, %l3
	lduw	[%l7 + %l3],	%i0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f16
	and	%i2,	%g2,	%l5
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f0
	nop
	set	0x39, %o4
	ldsb	[%l7 + %o4],	%g1
	set	0x77, %l2
	ldstuba	[%l7 + %l2] 0x81,	%o1
	nop
	set	0x18, %l4
	std	%f22,	[%l7 + %l4]
	nop
	set	0x3B, %g5
	ldsb	[%l7 + %g5],	%o2
	st	%f24,	[%l7 + 0x48]
	set	0x17, %g2
	stba	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x74, %g6
	lduh	[%l7 + %g6],	%l3
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%f18
	nop
	set	0x6C, %i4
	swap	[%l7 + %i4],	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%g5
	fpsub16	%f6,	%f30,	%f24
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x3A, %i6
	ldub	[%l7 + %i6],	%o4
	and	%l6,	%g3,	%o7
	or	%l1,	%i3,	%i1
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f28
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%o6
	nop
	set	0x66, %o2
	ldstub	[%l7 + %o2],	%l2
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x89,	%l0
	bgu	%xcc,	loop_211
	nop
	set	0x30, %l5
	swap	[%l7 + %l5],	%g6
	ld	[%l7 + 0x4C],	%f10
	nop
	set	0x2C, %g4
	stw	%i7,	[%l7 + %g4]
loop_211:
	st	%f27,	[%l7 + 0x64]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f16
	set	0x20, %l6
	stxa	%i5,	[%l7 + %l6] 0x81
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%o5
	nop
	set	0x48, %o0
	ldub	[%l7 + %o0],	%l4
	nop
	set	0x68, %i5
	ldstub	[%l7 + %i5],	%g4
	nop
	set	0x50, %i3
	ldx	[%l7 + %i3],	%o3
	set	0x20, %o3
	stwa	%i0,	[%l7 + %o3] 0x89
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%i2
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x89,	 4
	set	0x1C, %o6
	sta	%f11,	[%l7 + %o6] 0x81
	set	0x6C, %g7
	stwa	%g2,	[%l7 + %g7] 0x89
	bge,pn	%icc,	loop_212
	nop
	set	0x4A, %i0
	lduh	[%l7 + %i0],	%g1
	nop
	set	0x23, %l1
	ldsb	[%l7 + %l1],	%o2
	wr	%i4,	%o1,	%ccr
loop_212:
	nop
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x80,	%i6
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%g7
	bge,a,pt	%xcc,	loop_213
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x6E, %l4
	ldsh	[%l7 + %l4],	%g5
	set	0x10, %l3
	lda	[%l7 + %l3] 0x80,	%f11
loop_213:
	nop
	set	0x08, %g5
	swap	[%l7 + %g5],	%l3
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x88,	 3
	set	0x78, %g2
	ldxa	[%l7 + %g2] 0x81,	%g3
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd0
	nop
	set	0x70, %i2
	ldsh	[%l7 + %i2],	%l6
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%o6
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x34, %g1
	stw	%l1,	[%l7 + %g1]
	or	%i3,	%i1,	%l2
	st	%f27,	[%l7 + 0x0C]
	nop
	set	0x50, %i7
	std	%o6,	[%l7 + %i7]
	nop
	set	0x30, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x89,	%f14
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%g6
	nop
	set	0x18, %l5
	stw	%i7,	[%l7 + %l5]
	set	0x42, %o7
	stha	%i5,	[%l7 + %o7] 0x81
	nop
	set	0x58, %o1
	stx	%o5,	[%l7 + %o1]
	wr 	%g0, 	0x4, 	%fprs
	set	0x1E, %g4
	stha	%o3,	[%l7 + %g4] 0x80
	nop
	set	0x71, %o0
	ldsb	[%l7 + %o0],	%i0
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x10, %i3
	lda	[%l7 + %i3] 0x89,	%f27
	nop
	set	0x74, %l6
	prefetch	[%l7 + %l6],	 1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f16
	nop
	set	0x08, %o5
	std	%g4,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x44]
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x88,	%i2
	set	0x0D, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g2
	set	0x34, %g7
	swapa	[%l7 + %g7] 0x81,	%l5
	nop
	set	0x0B, %l1
	ldsb	[%l7 + %l1],	%o2
	set	0x38, %i0
	stwa	%i4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x58, %o4
	stw	%o1,	[%l7 + %o4]
	set	0x40, %l4
	stxa	%g1,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x14, %l3
	stb	%i6,	[%l7 + %l3]
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f28
	set	0x70, %g6
	stwa	%g7,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x44, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x1C, %l2
	stwa	%g5,	[%l7 + %l2] 0xea
	membar	#Sync
	wr	%o4,	%l3,	%softint
	bleu,a	%icc,	loop_214
	add	%g3,	%o7,	%l6
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xe2,	%l0
loop_214:
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%i1
	nop
	set	0x5C, %i1
	ldsw	[%l7 + %i1],	%l2
	nop
	set	0x18, %g1
	stx	%o6,	[%l7 + %g1]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f4
	nop
	set	0x1C, %g3
	lduh	[%l7 + %g3],	%l0
	nop
	set	0x6C, %i7
	lduh	[%l7 + %i7],	%g6
	ld	[%l7 + 0x18],	%f19
	bge,a,pn	%xcc,	loop_215
	nop
	set	0x56, %l5
	ldub	[%l7 + %l5],	%i3
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 0
	or	%i7,	%i5,	%o5
loop_215:
	nop
	set	0x48, %o7
	stx	%l4,	[%l7 + %o7]
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%o0
	ld	[%l7 + 0x4C],	%f4
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%o3
	bgu,pn	%xcc,	loop_216
	nop
	set	0x74, %o0
	stw	%g4,	[%l7 + %o0]
	set	0x78, %i3
	stda	%i0,	[%l7 + %i3] 0xe3
	membar	#Sync
loop_216:
	nop
	set	0x28, %i5
	std	%f8,	[%l7 + %i5]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%l4
	and	%o2,	%i2,	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF87, 	%sys_tick_cmpr
	fpsub16	%f26,	%f2,	%f28
	nop
	set	0x20, %o6
	swap	[%l7 + %o6],	%g7
	nop
	set	0x1F, %g7
	ldsb	[%l7 + %g7],	%g1
	set	0x47, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o4
	ld	[%l7 + 0x40],	%f22
	set	0x78, %i0
	stda	%l2,	[%l7 + %i0] 0x88
	set	0x30, %o4
	stxa	%g5,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x89,	%g3
	set	0x29, %l3
	stba	%o7,	[%l7 + %l3] 0x81
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 2
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	add	%l1,	%l2,	%i1
	set	0x70, %g2
	ldxa	[%l7 + %g2] 0x89,	%o6
	nop
	set	0x38, %l2
	stx	%g6,	[%l7 + %l2]
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x88,	%i3
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 4
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%i7
	ld	[%l7 + 0x70],	%f21
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x81,	%i5
	nop
	set	0x5C, %g3
	ldsb	[%l7 + %g3],	%l0
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%o4
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x88,	%o0
	set	0x2A, %i2
	stha	%o3,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xe3,	%g4
	set	0x3C, %o1
	stwa	%i0,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x40, %o7
	stx	%l4,	[%l7 + %o7]
	set	0x58, %o0
	sta	%f23,	[%l7 + %o0] 0x89
	wr	%l5,	%g2,	%set_softint
	set	0x0C, %i3
	stha	%i2,	[%l7 + %i3] 0x88
	bgu,a,pn	%xcc,	loop_217
	ld	[%l7 + 0x7C],	%f8
	nop
	set	0x38, %i5
	stx	%i4,	[%l7 + %i5]
	nop
	set	0x50, %l6
	ldsh	[%l7 + %l6],	%o1
loop_217:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%g7
	set	0x2C, %g4
	stha	%o2,	[%l7 + %g4] 0x81
	and	%g1,	%o4,	%g5
	set	0x74, %o3
	sta	%f27,	[%l7 + %o3] 0x80
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x14, %o6
	stw	%l3,	[%l7 + %o6]
	set	0x30, %g7
	lda	[%l7 + %g7] 0x81,	%f14
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f6
	nop
	set	0x08, %o4
	std	%f16,	[%l7 + %o4]
	ld	[%l7 + 0x0C],	%f0
	nop
	set	0x78, %i0
	prefetch	[%l7 + %i0],	 2
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%g2
	nop
	set	0x48, %l3
	ldx	[%l7 + %l3],	%o7
	fpadd16s	%f16,	%f24,	%f27
	set	0x44, %l1
	stha	%l6,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x58, %g5
	stda	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x0C, %g6
	lda	[%l7 + %g6] 0x80,	%f9
	set	0x58, %l2
	stwa	%l1,	[%l7 + %l2] 0x81
	set	0x30, %i6
	lda	[%l7 + %i6] 0x80,	%f9
	nop
	set	0x58, %i4
	prefetch	[%l7 + %i4],	 0
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x81,	%i1
	nop
	set	0x2C, %i1
	ldub	[%l7 + %i1],	%o6
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f16
	set	0x38, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g6
	fpadd16s	%f28,	%f26,	%f2
	nop
	set	0x08, %g2
	prefetch	[%l7 + %g2],	 2
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xca
	add	%i3,	%i5,	%l0
	nop
	set	0x34, %o2
	stw	%o5,	[%l7 + %o2]
	add	%o0,	%i7,	%o3
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%g4
	ld	[%l7 + 0x30],	%f7
	nop
	set	0x78, %o7
	stx	%i0,	[%l7 + %o7]
	set	0x68, %o0
	stwa	%l5,	[%l7 + %o0] 0x89
	nop
	set	0x59, %i2
	ldstub	[%l7 + %i2],	%l4
	set	0x68, %i5
	stwa	%g2,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x50, %l6
	std	%i4,	[%l7 + %l6]
	fpsub16s	%f11,	%f29,	%f5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%i6
	st	%fsr,	[%l7 + 0x4C]
	set	0x62, %g4
	stba	%g7,	[%l7 + %g4] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x0C]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%o2
	nop
	set	0x6A, %o3
	sth	%g1,	[%l7 + %o3]
	nop
	set	0x0C, %o5
	swap	[%l7 + %o5],	%o4
	nop
	set	0x6C, %i3
	ldsw	[%l7 + %i3],	%g5
	nop
	set	0x18, %o6
	std	%f16,	[%l7 + %o6]
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x81,	%g2
	nop
	set	0x1A, %o4
	sth	%l3,	[%l7 + %o4]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%l2
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x40, %i0
	std	%f8,	[%l7 + %i0]
	add	%l6,	%i1,	%o6
	set	0x74, %l3
	sta	%f28,	[%l7 + %l3] 0x88
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f2
	set	0x50, %l1
	stda	%g6,	[%l7 + %l1] 0x81
	set	0x38, %g5
	sta	%f3,	[%l7 + %g5] 0x89
	nop
	set	0x38, %g6
	std	%f10,	[%l7 + %g6]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xea,	%i2
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f12
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%i4
	nop
	set	0x70, %g1
	std	%l0,	[%l7 + %g1]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f16
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%o0
	set	0x28, %i1
	swapa	[%l7 + %i1] 0x88,	%l0
	set	0x48, %i7
	stda	%i6,	[%l7 + %i7] 0xe3
	membar	#Sync
	and	%g4,	%o3,	%l5
	nop
	set	0x68, %g2
	ldx	[%l7 + %g2],	%l4
	nop
	set	0x20, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x58, %o1
	swapa	[%l7 + %o1] 0x89,	%i0
	set	0x70, %o2
	ldstuba	[%l7 + %o2] 0x89,	%g2
	nop
	set	0x28, %o0
	swap	[%l7 + %o0],	%o1
	set	0x4C, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i4
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f2
	nop
	set	0x24, %l6
	ldsh	[%l7 + %l6],	%i6
	set	0x14, %o3
	sta	%f11,	[%l7 + %o3] 0x88
	nop
	set	0x0C, %o5
	ldsh	[%l7 + %o5],	%i2
	nop
	set	0x58, %i3
	lduh	[%l7 + %i3],	%o2
	nop
	set	0x53, %g4
	ldsb	[%l7 + %g4],	%o4
	nop
	set	0x0D, %o6
	stb	%g5,	[%l7 + %o6]
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%g1
	nop
	set	0x60, %o4
	stw	%o7,	[%l7 + %o4]
	or	%l2,	%l6,	%i1
	wr	%l3,	%o6,	%sys_tick
	nop
	set	0x18, %i0
	std	%i2,	[%l7 + %i0]
	set	0x1C, %l0
	stwa	%i5,	[%l7 + %l0] 0x80
	nop
	set	0x5C, %l4
	prefetch	[%l7 + %l4],	 2
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xea,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f0
	bl,a	%icc,	loop_218
	ld	[%l7 + 0x68],	%f25
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%i7
loop_218:
	ld	[%l7 + 0x28],	%f1
	set	0x08, %g6
	stxa	%l0,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x26, %g5
	ldsh	[%l7 + %g5],	%g4
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%o2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf0
	membar	#Sync
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xea,	%l4
	ld	[%l7 + 0x40],	%f12
	and	%l5,	%i0,	%g2
	set	0x58, %g3
	stda	%i4,	[%l7 + %g3] 0xe2
	membar	#Sync
	wr	%g7,	%o1,	%sys_tick
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i2
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%o4
	set	0x20, %g2
	sta	%f31,	[%l7 + %g2] 0x80
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x80,	 4
	st	%f29,	[%l7 + 0x38]
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x20, %o2
	stda	%g2,	[%l7 + %o2] 0x80
	add	%g1,	%g5,	%l2
	set	0x28, %o0
	stxa	%l6,	[%l7 + %o0] 0x81
	set	0x7A, %i1
	stha	%o7,	[%l7 + %i1] 0x80
	set	0x08, %o7
	stxa	%l3,	[%l7 + %o7] 0x88
	set	0x43, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i1
	nop
	set	0x70, %i2
	sth	%o6,	[%l7 + %i2]
	nop
	set	0x48, %o3
	std	%f2,	[%l7 + %o3]
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	fpadd32s	%f1,	%f21,	%f11
	set	0x70, %o5
	stxa	%i5,	[%l7 + %o5] 0x89
	st	%fsr,	[%l7 + 0x34]
	set	0x50, %i3
	stxa	%l1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x38, %o6
	stw	%i3,	[%l7 + %o6]
	set	0x20, %g7
	stxa	%g6,	[%l7 + %g7] 0x89
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x88,	%o0
	nop
	set	0x1E, %g4
	stb	%i7,	[%l7 + %g4]
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f22
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o5
	add	%g4,	%l4,	%o3
	bn,a	%xcc,	loop_219
	st	%f15,	[%l7 + 0x1C]
	set	0x3C, %i0
	sta	%f26,	[%l7 + %i0] 0x88
loop_219:
	st	%fsr,	[%l7 + 0x2C]
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x81,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i4
	set	0x34, %l1
	stwa	%l5,	[%l7 + %l1] 0x81
	and	%g7,	%o1,	%i6
	nop
	set	0x5B, %g6
	ldstub	[%l7 + %g6],	%i2
	nop
	set	0x70, %l4
	ldsw	[%l7 + %l4],	%o2
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x81,	%g3
	nop
	set	0x70, %g5
	std	%g0,	[%l7 + %g5]
	nop
	set	0x70, %i6
	ldsw	[%l7 + %i6],	%o4
	nop
	set	0x74, %g3
	stw	%l2,	[%l7 + %g3]
	set	0x52, %g1
	stha	%l6,	[%l7 + %g1] 0x81
	set	0x6E, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g5
	ble	%icc,	loop_220
	nop
	set	0x38, %i7
	swap	[%l7 + %i7],	%l3
	set	0x64, %l5
	sta	%f17,	[%l7 + %l5] 0x89
loop_220:
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%o7
	nop
	set	0x5A, %g2
	ldstub	[%l7 + %g2],	%o6
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	wr	%i5,	%l1,	%clear_softint
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%i2
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f12
	ld	[%l7 + 0x70],	%f10
	set	0x50, %i5
	sta	%f6,	[%l7 + %i5] 0x81
	fpsub32	%f18,	%f30,	%f6
	nop
	set	0x14, %o0
	stw	%g6,	[%l7 + %o0]
	nop
	set	0x40, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x62, %i2
	lduh	[%l7 + %i2],	%o0
	set	0x7A, %l6
	stba	%i1,	[%l7 + %l6] 0x88
	nop
	set	0x18, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x70, %o6
	lduw	[%l7 + %o6],	%l0
	set	0x0C, %g7
	stha	%o5,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%i7,	%g4,	%l4
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x81,	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%i4
	nop
	set	0x36, %g4
	lduh	[%l7 + %g4],	%l5
	nop
	set	0x28, %o4
	ldsb	[%l7 + %o4],	%g7
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x81,	 3
	set	0x2E, %l3
	stba	%g2,	[%l7 + %l3] 0x80
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x89,	%i6
	set	0x48, %g6
	lda	[%l7 + %g6] 0x88,	%f14
	set	0x7E, %l1
	ldstuba	[%l7 + %l1] 0x81,	%i2
	nop
	set	0x78, %l4
	stw	%g3,	[%l7 + %l4]
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%o2
	or	%g1,	%l2,	%o4
	and	%l6,	%l3,	%o7
	nop
	set	0x52, %l2
	ldsb	[%l7 + %l2],	%g5
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x36, %g1
	stb	%o6,	[%l7 + %g1]
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%i5
	nop
	set	0x10, %i7
	std	%f8,	[%l7 + %i7]
	or	%i3,	%l1,	%o0
	set	0x5A, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g6
	nop
	set	0x60, %o1
	std	%f18,	[%l7 + %o1]
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i1
	nop
	set	0x78, %o2
	stx	%o5,	[%l7 + %o2]
	add	%i7,	%l0,	%l4
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x81,	%g4
	set	0x58, %o7
	stda	%i0,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x5A, %i5
	ldub	[%l7 + %i5],	%i4
	nop
	set	0x60, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x0F, %i1
	stba	%o3,	[%l7 + %i1] 0x89
	set	0x24, %o3
	stwa	%l5,	[%l7 + %o3] 0x89
	nop
	set	0x38, %i2
	swap	[%l7 + %i2],	%g7
	ld	[%l7 + 0x2C],	%f11
	nop
	set	0x48, %l6
	lduh	[%l7 + %l6],	%o1
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%i6
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x80
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x81,	%i2
	nop
	set	0x60, %g4
	std	%f18,	[%l7 + %g4]
	set	0x4A, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g3
	st	%f7,	[%l7 + 0x4C]
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%o2
	set	0x2C, %o4
	stwa	%g1,	[%l7 + %o4] 0x88
	nop
	set	0x44, %l0
	lduh	[%l7 + %l0],	%g2
	st	%f9,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x1C, %l3
	ldsw	[%l7 + %l3],	%o4
	nop
	set	0x48, %l1
	ldstub	[%l7 + %l1],	%l6
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%l3
	set	0x58, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l2
	set	0x36, %g6
	stha	%o7,	[%l7 + %g6] 0x89
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x46, %g3
	ldsb	[%l7 + %g3],	%g5
	ld	[%l7 + 0x2C],	%f2
	set	0x2F, %l2
	stba	%o6,	[%l7 + %l2] 0x80
	nop
	set	0x50, %g1
	stx	%i5,	[%l7 + %g1]
	nop
	set	0x60, %i7
	ldx	[%l7 + %i7],	%i3
	nop
	set	0x40, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x7C, %o1
	swapa	[%l7 + %o1] 0x89,	%o0
	nop
	set	0x18, %l5
	ldsw	[%l7 + %l5],	%g6
	set	0x64, %i4
	lda	[%l7 + %i4] 0x88,	%f17
	and	%i1,	%o5,	%l1
	nop
	set	0x72, %o2
	stb	%l0,	[%l7 + %o2]
	nop
	set	0x34, %o7
	lduh	[%l7 + %o7],	%l4
	nop
	set	0x41, %g2
	ldstub	[%l7 + %g2],	%g4
	st	%f13,	[%l7 + 0x08]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x80
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xea,	%i6
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%i4
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd8
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x81,	%o2
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x88,	%i0
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	nop
	set	0x38, %o6
	std	%f20,	[%l7 + %o6]
	nop
	set	0x26, %g4
	ldub	[%l7 + %g4],	%o1
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%g7
	nop
	set	0x50, %o4
	ldsw	[%l7 + %o4],	%i6
	add	%g3,	%i2,	%o2
	nop
	set	0x78, %g7
	std	%g2,	[%l7 + %g7]
	or	%o4,	%g1,	%l3
	set	0x18, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l6
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	and	%o7,	%o6,	%i5
	bn,pn	%xcc,	loop_221
	ba	%xcc,	loop_222
	fpadd32s	%f2,	%f18,	%f25
	set	0x08, %l4
	stxa	%g5,	[%l7 + %l4] 0xe3
	membar	#Sync
loop_221:
	and	%i3,	%g6,	%o0
loop_222:
	nop
	set	0x34, %g5
	prefetch	[%l7 + %g5],	 2
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%i1
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f12
	nop
	set	0x6C, %i7
	ldsb	[%l7 + %i7],	%o5
	nop
	set	0x65, %i6
	stb	%l1,	[%l7 + %i6]
	set	0x50, %g3
	lda	[%l7 + %g3] 0x81,	%f4
	wr	%l4,	%l0,	%sys_tick
	set	0x14, %l5
	lda	[%l7 + %l5] 0x89,	%f14
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x89,	%g4
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f6
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x81,	%i7
	nop
	set	0x5F, %g2
	ldsb	[%l7 + %g2],	%i4
	nop
	set	0x73, %o1
	ldstub	[%l7 + %o1],	%i0
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%o2
	set	0x60, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o1
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x88,	 1
	set	0x0C, %l6
	sta	%f6,	[%l7 + %l6] 0x88
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x2F, %i1
	ldsb	[%l7 + %i1],	%l5
	nop
	set	0x44, %o5
	ldsh	[%l7 + %o5],	%g3
	wr	%i6,	%o2,	%set_softint
	set	0x32, %i2
	stha	%i2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x38, %o6
	swap	[%l7 + %o6],	%g2
	set	0x5C, %g4
	stha	%g1,	[%l7 + %g4] 0xeb
	membar	#Sync
	add	%o4,	%l6,	%l2
	set	0x78, %i0
	lda	[%l7 + %i0] 0x81,	%f12
	set	0x08, %o4
	stxa	%l3,	[%l7 + %o4] 0x89
	fpsub32	%f4,	%f24,	%f0
	set	0x2B, %g7
	stba	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x46, %i3
	stha	%i5,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x37A4BE1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x22105BA5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f20,	%f18
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x89,	%g5
	set	0x10, %l1
	ldxa	[%l7 + %l1] 0x88,	%o7
	add	%g6,	%o0,	%i1
	nop
	set	0x26, %l4
	ldsh	[%l7 + %l4],	%o5
	set	0x1A, %l0
	stha	%i3,	[%l7 + %l0] 0x80
	nop
	set	0x20, %g6
	stx	%l4,	[%l7 + %g6]
	fpsub32s	%f21,	%f14,	%f2
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x88,	%l1
	set	0x40, %g1
	swapa	[%l7 + %g1] 0x89,	%g4
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%l0
	nop
	set	0x7C, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x48, %i6
	stw	%i7,	[%l7 + %i6]
	nop
	set	0x10, %l5
	lduw	[%l7 + %l5],	%i0
	wr	%o3,	%o1,	%set_softint
	add	%i4,	%l5,	%g7
	add	%g3,	%o2,	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%i6
	st	%f0,	[%l7 + 0x64]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l6
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x80,	%g0
	set	0x14, %g3
	stwa	%l3,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x7F, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l2
	nop
	set	0x78, %o7
	std	%i4,	[%l7 + %o7]
	nop
	set	0x28, %g2
	sth	%o6,	[%l7 + %g2]
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%o6
	nop
	set	0x40, %i5
	ldsh	[%l7 + %i5],	%g5
	nop
	set	0x7C, %o1
	ldsh	[%l7 + %o1],	%g6
	set	0x18, %o3
	stha	%i1,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f18
	nop
	set	0x58, %l6
	std	%o4,	[%l7 + %l6]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f0
	nop
	set	0x50, %i2
	stw	%o0,	[%l7 + %i2]
	set	0x14, %o6
	stha	%l4,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x44, %g4
	sth	%i3,	[%l7 + %g4]
	wr	%g4,	%l0,	%pic
	nop
	set	0x3A, %o4
	ldub	[%l7 + %o4],	%l1
	st	%f16,	[%l7 + 0x50]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xe2,	%i0
	nop
	set	0x48, %i0
	ldsw	[%l7 + %i0],	%i7
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f30
	nop
	set	0x14, %l3
	ldstub	[%l7 + %l3],	%o1
	set	0x66, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i4
	add	%l5,	%o3,	%g3
	fpadd16	%f16,	%f24,	%f14
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x88,	 1
	nop
	set	0x78, %l0
	std	%f24,	[%l7 + %l0]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%g2
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f0
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x89,	%i2
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x6A, %i7
	ldub	[%l7 + %i7],	%i6
	nop
	set	0x6C, %i6
	ldsb	[%l7 + %i6],	%l6
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%g1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f0
	set	0x56, %i4
	stha	%l3,	[%l7 + %i4] 0x81
	nop
	set	0x24, %g3
	swap	[%l7 + %g3],	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o6
	nop
	set	0x76, %o7
	ldsb	[%l7 + %o7],	%i5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%o7
	nop
	set	0x5C, %o2
	lduw	[%l7 + %o2],	%g6
	st	%f4,	[%l7 + 0x10]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%o0
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%l4
	nop
	set	0x31, %i5
	stb	%i3,	[%l7 + %i5]
	nop
	set	0x38, %o0
	stx	%g4,	[%l7 + %o0]
	nop
	set	0x18, %o3
	lduw	[%l7 + %o3],	%l0
	set	0x64, %i1
	lda	[%l7 + %i1] 0x88,	%f0
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%i1
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%i7
	nop
	set	0x5C, %o6
	ldsh	[%l7 + %o6],	%o1
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%i0
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x88,	%l4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x0A, %o5
	lduh	[%l7 + %o5],	%o3
	nop
	set	0x10, %g7
	std	%g2,	[%l7 + %g7]
	ld	[%l7 + 0x20],	%f25
	and	%g7,	%i4,	%o2
	nop
	set	0x30, %i3
	stx	%g2,	[%l7 + %i3]
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	set	0x18, %l4
	stwa	%i2,	[%l7 + %l4] 0x80
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g1
	add	%i6,	%l2,	%l3
	nop
	set	0x74, %l1
	ldub	[%l7 + %l1],	%o4
	st	%f18,	[%l7 + 0x4C]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd2,	%f0
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0
	nop
	set	0x48, %g5
	swap	[%l7 + %g5],	%i5
	nop
	set	0x60, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x15, %g6
	ldub	[%l7 + %g6],	%g5
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x31, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o7
	nop
	nop
	setx	0x39E535DB3DDD8379,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x0601087253B67D17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f28
	nop
	set	0x18, %i4
	std	%g6,	[%l7 + %i4]
	nop
	set	0x6A, %g3
	ldsb	[%l7 + %g3],	%o5
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f0
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x70, %o7
	ldsh	[%l7 + %o7],	%i3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f0
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%o0
	nop
	set	0x20, %o3
	lduh	[%l7 + %o3],	%l0
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf1
	membar	#Sync
	nop
	set	0x68, %l6
	ldsw	[%l7 + %l6],	%l1
	wr	%g4,	%i7,	%clear_softint
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	ld	[%l7 + 0x64],	%f7
	or	%i0,	%l5,	%o3
	set	0x78, %o6
	stha	%g3,	[%l7 + %o6] 0x80
	add	%o1,	%g7,	%i4
	nop
	set	0x09, %o1
	ldstub	[%l7 + %o1],	%o2
	set	0x58, %o4
	swapa	[%l7 + %o4] 0x81,	%g2
	nop
	set	0x28, %g4
	stx	%l6,	[%l7 + %g4]
	set	0x14, %g7
	lda	[%l7 + %g7] 0x80,	%f19
	nop
	set	0x53, %o5
	ldub	[%l7 + %o5],	%g1
	and	%i2,	%i6,	%l3
	nop
	set	0x48, %i3
	ldsw	[%l7 + %i3],	%l2
	st	%f22,	[%l7 + 0x68]
	nop
	set	0x6C, %l3
	stw	%o4,	[%l7 + %l3]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%g5
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x52, %l1
	ldstuba	[%l7 + %l1] 0x89,	%i5
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%g6
	set	0x2E, %l2
	stha	%o5,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x60, %g5
	std	%f4,	[%l7 + %g5]
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x80,	%o6
	add	%i3,	%l0,	%o0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x3C, %l5
	lduw	[%l7 + %l5],	%i1
	set	0x0D, %l0
	stba	%i0,	[%l7 + %l0] 0x89
	st	%f4,	[%l7 + 0x40]
	ble,pn	%xcc,	loop_223
	nop
	set	0x20, %i4
	ldsh	[%l7 + %i4],	%i7
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x81,	 1
loop_223:
	st	%fsr,	[%l7 + 0x60]
	set	0x48, %g3
	stda	%g2,	[%l7 + %g3] 0x89
	set	0x68, %o2
	sta	%f19,	[%l7 + %o2] 0x80
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x81,	%o0
	and	%g7,	%i4,	%o2
	nop
	set	0x4B, %o7
	ldub	[%l7 + %o7],	%g2
	nop
	set	0x44, %o0
	ldstub	[%l7 + %o0],	%l5
	st	%f0,	[%l7 + 0x24]
	set	0x20, %o3
	stxa	%g1,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	set	0x58, %g2
	stda	%i2,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x34, %l6
	sta	%f5,	[%l7 + %l6] 0x81
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%l3
	nop
	set	0x35, %o6
	ldub	[%l7 + %o6],	%l2
	and	%i6,	%o6,	%g5
	set	0x24, %o1
	sta	%f13,	[%l7 + %o1] 0x81
	nop
	set	0x78, %o4
	stx	%i5,	[%l7 + %o4]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%g6
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x88,	%l4
	nop
	set	0x0B, %g7
	ldsb	[%l7 + %g7],	%o5
	ld	[%l7 + 0x14],	%f24
	set	0x54, %o5
	swapa	[%l7 + %o5] 0x88,	%o7
	nop
	set	0x35, %i3
	ldstub	[%l7 + %i3],	%i3
	nop
	set	0x53, %l3
	ldub	[%l7 + %l3],	%l0
	set	0x08, %l4
	stda	%l0,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%g4
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x38, %l2
	ldsb	[%l7 + %l2],	%i7
	fpsub32s	%f24,	%f26,	%f5
	set	0x18, %i7
	lda	[%l7 + %i7] 0x81,	%f26
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xe3,	%g2
	set	0x58, %g6
	stwa	%o3,	[%l7 + %g6] 0x88
	and	%o1,	%g7,	%i4
	set	0x0C, %l0
	lda	[%l7 + %l0] 0x80,	%f4
	and	%g2,	%l5,	%o2
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f0
	nop
	set	0x10, %i6
	stx	%g1,	[%l7 + %i6]
	set	0x34, %g3
	stha	%i2,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x0C, %o2
	lduw	[%l7 + %o2],	%l6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%f0
	nop
	set	0x38, %o7
	std	%f18,	[%l7 + %o7]
	nop
	set	0x2A, %i4
	ldsh	[%l7 + %i4],	%l3
	ld	[%l7 + 0x68],	%f11
	nop
	set	0x74, %o3
	stw	%i6,	[%l7 + %o3]
	nop
	set	0x48, %i5
	std	%f10,	[%l7 + %i5]
	nop
	set	0x64, %o0
	prefetch	[%l7 + %o0],	 4
	add	%o6,	%l2,	%i5
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf1
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x80,	%o4
	and	%g6,	%g5,	%l4
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l0
	nop
	set	0x70, %o1
	stb	%l1,	[%l7 + %o1]
	set	0x40, %o4
	swapa	[%l7 + %o4] 0x89,	%o7
	or	%i1,	%g4,	%i0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x53E, 	%sys_tick_cmpr
	fpadd16s	%f0,	%f5,	%f19
	nop
	set	0x48, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x7B, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o3
	nop
	set	0x4C, %i1
	sth	%o1,	[%l7 + %i1]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%i4
	set	0x30, %i3
	stda	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x5A, %l3
	stha	%g7,	[%l7 + %l3] 0x88
	fpsub16s	%f26,	%f2,	%f11
	st	%fsr,	[%l7 + 0x5C]
	set	0x54, %o5
	swapa	[%l7 + %o5] 0x88,	%l5
	nop
	set	0x08, %l1
	stw	%g1,	[%l7 + %l1]
	set	0x2C, %l4
	stba	%i2,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x70, %i0
	ldx	[%l7 + %i0],	%l6
	set	0x10, %g4
	stda	%o2,	[%l7 + %g4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x80,	%i6
	st	%f17,	[%l7 + 0x3C]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%l2
	set	0x2A, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i5
	set	0x60, %g5
	swapa	[%l7 + %g5] 0x89,	%o4
	set	0x3D, %g6
	stba	%o6,	[%l7 + %g6] 0x88
	set	0x38, %l5
	stda	%g4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x10, %l0
	ldstub	[%l7 + %l0],	%l4
	nop
	set	0x23, %g3
	ldstub	[%l7 + %g3],	%o5
	st	%f21,	[%l7 + 0x08]
	nop
	set	0x28, %i6
	lduh	[%l7 + %i6],	%g6
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x54, %o7
	ldsb	[%l7 + %o7],	%i3
	set	0x78, %i4
	swapa	[%l7 + %i4] 0x81,	%l0
	fpsub16	%f10,	%f20,	%f30
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x5C, %i5
	ldsw	[%l7 + %i5],	%l1
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 3
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f0
	nop
	set	0x38, %g2
	swap	[%l7 + %g2],	%i1
	nop
	set	0x10, %i2
	stx	%o7,	[%l7 + %i2]
	set	0x38, %l6
	lda	[%l7 + %l6] 0x80,	%f12
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x89,	%i0
	set	0x24, %o4
	sta	%f18,	[%l7 + %o4] 0x88
	set	0x36, %g7
	stha	%i7,	[%l7 + %g7] 0x81
	set	0x23, %o6
	stba	%g4,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x5C, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o3
	set	0x50, %l3
	stxa	%o1,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x1E, %o5
	stba	%o0,	[%l7 + %o5] 0xe2
	membar	#Sync
	and	%g3,	%i4,	%g2
	st	%f20,	[%l7 + 0x68]
	bg,a,pn	%icc,	loop_224
	and	%g7,	%g1,	%i2
	nop
	set	0x46, %l4
	stb	%l6,	[%l7 + %l4]
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
loop_224:
	nop
	set	0x34, %i0
	swap	[%l7 + %i0],	%o2
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o4
	nop
	set	0x0C, %g4
	stw	%l3,	[%l7 + %g4]
	and	%g5,	%o6,	%o5
	nop
	set	0x78, %i7
	prefetch	[%l7 + %i7],	 1
	ld	[%l7 + 0x50],	%f27
	nop
	set	0x6D, %g5
	ldstub	[%l7 + %g5],	%l4
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 2
	set	0x65, %l5
	stba	%g6,	[%l7 + %l5] 0x81
	ld	[%l7 + 0x70],	%f12
	nop
	set	0x2C, %l0
	stw	%l0,	[%l7 + %l0]
	nop
	set	0x78, %l2
	std	%f2,	[%l7 + %l2]
	set	0x7F, %g3
	ldstuba	[%l7 + %g3] 0x80,	%i3
	nop
	set	0x6C, %g1
	sth	%i1,	[%l7 + %g1]
	set	0x74, %o7
	lda	[%l7 + %o7] 0x89,	%f8
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%f10
	nop
	set	0x40, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%o6
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%l1
	or	%i0,	%i7,	%g4
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%o3
	nop
	set	0x5F, %g2
	ldsb	[%l7 + %g2],	%o1
	fpadd32s	%f17,	%f20,	%f20
	and	%g3,	%i4,	%o0
	set	0x60, %o3
	stxa	%g2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x29, %i2
	ldub	[%l7 + %i2],	%g1
	set	0x62, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g7
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x30, %o1
	stw	%i2,	[%l7 + %o1]
	nop
	set	0x1C, %o6
	ldsw	[%l7 + %o6],	%l6
	nop
	set	0x15, %i1
	ldsb	[%l7 + %i1],	%o2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%l5
	set	0x60, %i3
	stda	%i4,	[%l7 + %i3] 0x89
	nop
	set	0x47, %l3
	ldstub	[%l7 + %l3],	%o4
	nop
	set	0x10, %g7
	stx	%l2,	[%l7 + %g7]
	set	0x0F, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g5
	and	%l3,	%o5,	%o6
	set	0x0A, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l4
	wr	%g6,	%l0,	%sys_tick
	wr	%i1,	%o7,	%set_softint
	or	%l1,	%i3,	%i0
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x80,	%i7
	bl,a	%icc,	loop_225
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x50, %g4
	stx	%o3,	[%l7 + %g4]
	nop
	set	0x16, %g5
	sth	%g4,	[%l7 + %g5]
loop_225:
	nop
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x89,	%g3
	add	%o1,	%o0,	%i4
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x3C, %l0
	stw	%g1,	[%l7 + %l0]
	nop
	set	0x2C, %g6
	stw	%g2,	[%l7 + %g6]
	set	0x6A, %g3
	stba	%g7,	[%l7 + %g3] 0xe3
	membar	#Sync
	st	%f19,	[%l7 + 0x14]
	st	%f12,	[%l7 + 0x1C]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f16
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f0
	set	0x7C, %i4
	swapa	[%l7 + %i4] 0x80,	%l6
	st	%f21,	[%l7 + 0x08]
	and	%o2,	%i6,	%l5
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%i5
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f20
	set	0x6C, %i5
	swapa	[%l7 + %i5] 0x89,	%i2
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc0
	nop
	set	0x58, %g2
	std	%l2,	[%l7 + %g2]
	nop
	set	0x30, %o3
	ldsh	[%l7 + %o3],	%o4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%g5
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f24
	bg	%xcc,	loop_226
	add	%o5,	%o6,	%l4
	set	0x54, %l6
	lda	[%l7 + %l6] 0x89,	%f12
loop_226:
	st	%f5,	[%l7 + 0x30]
	set	0x38, %i2
	stxa	%g6,	[%l7 + %i2] 0x80
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%i1
	be,a,pn	%icc,	loop_227
	nop
	set	0x58, %o4
	std	%l0,	[%l7 + %o4]
	nop
	set	0x18, %o1
	stx	%i3,	[%l7 + %o1]
	nop
	nop
	setx	0x5C1D9C72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x96AA0C63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f23,	%f23
loop_227:
	st	%f24,	[%l7 + 0x20]
	nop
	set	0x40, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x70, %i3
	std	%i0,	[%l7 + %i3]
	set	0x7C, %l3
	stwa	%o7,	[%l7 + %l3] 0x88
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%o3
	set	0x36, %g7
	stha	%o1,	[%l7 + %g7] 0x88
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%i4
	nop
	set	0x68, %l1
	stx	%g3,	[%l7 + %l1]
	set	0x52, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x81
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%g2
	nop
	set	0x38, %o5
	stx	%g7,	[%l7 + %o5]
	set	0x48, %g5
	stwa	%l6,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x38, %l5
	std	%i6,	[%l7 + %l5]
	set	0x54, %i7
	sta	%f19,	[%l7 + %i7] 0x89
	wr	%o2,	%i5,	%ccr
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x81
	nop
	set	0x6A, %g3
	stb	%l5,	[%l7 + %g3]
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x80,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%l3
	ld	[%l7 + 0x40],	%f1
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l2
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%f4
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xea,	%o4
	set	0x08, %o7
	stwa	%g5,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x20, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x7C, %i5
	stwa	%l4,	[%l7 + %i5] 0x81
	wr 	%g0, 	0x5, 	%fprs
	add	%i1,	%g6,	%i3
	and	%i0,	%l1,	%o7
	nop
	set	0x08, %o0
	ldsh	[%l7 + %o0],	%g4
	nop
	set	0x38, %o3
	stx	%o3,	[%l7 + %o3]
	nop
	set	0x48, %i6
	stx	%fsr,	[%l7 + %i6]
	ld	[%l7 + 0x0C],	%f15
	st	%fsr,	[%l7 + 0x28]
	set	0x58, %g2
	stxa	%i7,	[%l7 + %g2] 0x88
	nop
	set	0x40, %i2
	std	%o0,	[%l7 + %i2]
	set	0x10, %l6
	stda	%i4,	[%l7 + %l6] 0x81
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	st	%f10,	[%l7 + 0x44]
	nop
	set	0x18, %o4
	stx	%o0,	[%l7 + %o4]
	set	0x08, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%g2
	nop
	set	0x30, %i1
	ldsh	[%l7 + %i1],	%l6
	nop
	set	0x73, %o6
	ldub	[%l7 + %o6],	%i6
	nop
	set	0x21, %g7
	ldstub	[%l7 + %g7],	%o2
	set	0x66, %l3
	stha	%i5,	[%l7 + %l3] 0x80
	set	0x18, %i0
	stxa	%i2,	[%l7 + %i0] 0x80
	set	0x6E, %l4
	stba	%l5,	[%l7 + %l4] 0x88
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l2
	st	%f15,	[%l7 + 0x34]
	nop
	set	0x12, %g4
	ldsh	[%l7 + %g4],	%o5
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	set	0x29, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l4
	ba	%icc,	loop_228
	nop
	set	0x55, %l5
	stb	%o6,	[%l7 + %l5]
	set	0x38, %l1
	stda	%l0,	[%l7 + %l1] 0x88
loop_228:
	nop
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	set	0x41, %g3
	stba	%g5,	[%l7 + %g3] 0x89
	nop
	set	0x2C, %g6
	stw	%i1,	[%l7 + %g6]
	set	0x38, %i7
	stwa	%i3,	[%l7 + %i7] 0x89
	nop
	set	0x4C, %g1
	stw	%i0,	[%l7 + %g1]
	set	0x1C, %l2
	sta	%f22,	[%l7 + %l2] 0x81
	nop
	set	0x10, %i4
	stw	%g6,	[%l7 + %i4]
	nop
	set	0x10, %o2
	stx	%o7,	[%l7 + %o2]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xca
	set	0x60, %o0
	stwa	%l1,	[%l7 + %o0] 0xe3
	membar	#Sync
	ld	[%l7 + 0x3C],	%f27
	nop
	set	0x34, %o3
	ldsb	[%l7 + %o3],	%g4
	nop
	set	0x6A, %o7
	ldsb	[%l7 + %o7],	%i7
	nop
	set	0x54, %i6
	stw	%o3,	[%l7 + %i6]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%g3
	set	0x5C, %g2
	stwa	%o0,	[%l7 + %g2] 0x80
	nop
	set	0x48, %l6
	ldsw	[%l7 + %l6],	%o1
	and	%g1,	%g2,	%l6
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%i6
	nop
	set	0x58, %o4
	ldsb	[%l7 + %o4],	%o2
	set	0x50, %i3
	stha	%g7,	[%l7 + %i3] 0x89
	nop
	set	0x11, %i1
	stb	%i5,	[%l7 + %i1]
	nop
	set	0x7D, %o1
	ldstub	[%l7 + %o1],	%i2
	set	0x5C, %o6
	sta	%f24,	[%l7 + %o6] 0x88
	set	0x60, %g7
	stda	%l4,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x39, %l4
	ldub	[%l7 + %l4],	%o4
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x89,	%o5
	set	0x68, %g4
	stxa	%o6,	[%l7 + %g4] 0x89
	or	%l4,	%g5,	%i1
	nop
	set	0x10, %o5
	ldsw	[%l7 + %o5],	%i3
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f14
	nop
	set	0x53, %l1
	ldstub	[%l7 + %l1],	%l0
	set	0x70, %l0
	lda	[%l7 + %l0] 0x89,	%f15
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%o7
	ld	[%l7 + 0x74],	%f24
	bn,pn	%icc,	loop_229
	nop
	set	0x08, %g3
	std	%f18,	[%l7 + %g3]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf9
	membar	#Sync
loop_229:
	wr	%i0,	%g4,	%ccr
	set	0x50, %g5
	stda	%l0,	[%l7 + %g5] 0x89
	set	0x28, %i7
	sta	%f16,	[%l7 + %i7] 0x89
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x78, %i4
	stxa	%o3,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x34, %i5
	stha	%i7,	[%l7 + %i5] 0x88
	nop
	set	0x1C, %o0
	lduw	[%l7 + %o0],	%g3
	or	%o0,	%o1,	%i4
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%g0
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	nop
	set	0x20, %i6
	std	%i6,	[%l7 + %i6]
	set	0x48, %o2
	sta	%f18,	[%l7 + %o2] 0x89
	set	0x50, %g2
	stxa	%i6,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x10, %i2
	stxa	%g7,	[%l7 + %i2] 0x80
	nop
	set	0x74, %l6
	swap	[%l7 + %l6],	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l5
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f26
	set	0x18, %i1
	stwa	%l2,	[%l7 + %i1] 0x88
	nop
	set	0x60, %o1
	std	%f6,	[%l7 + %o1]
	set	0x30, %i3
	sta	%f24,	[%l7 + %i3] 0x88
	or	%l3,	%o4,	%o2
	and	%o6,	%l4,	%o5
	nop
	set	0x2E, %o6
	stb	%g5,	[%l7 + %o6]
	fpadd16	%f22,	%f4,	%f2
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%i3
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f16
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%i1
	set	0x60, %g4
	stxa	%l0,	[%l7 + %g4] 0x89
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%g6
	nop
	set	0x16, %i0
	stb	%o7,	[%l7 + %i0]
	nop
	set	0x6B, %l5
	ldsb	[%l7 + %l5],	%g4
	nop
	set	0x49, %l1
	ldub	[%l7 + %l1],	%l1
	nop
	set	0x3C, %g3
	lduw	[%l7 + %g3],	%o3
	set	0x28, %l0
	stda	%i0,	[%l7 + %l0] 0x88
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x89,	%f9
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	add	%i7,	%o0,	%g3
	set	0x66, %g6
	stha	%o1,	[%l7 + %g6] 0x80
	set	0x65, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i4
	nop
	set	0x60, %i4
	std	%g0,	[%l7 + %i4]
	add	%l6,	%i6,	%g2
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xea,	%g6
	and	%i2,	%l5,	%l2
	set	0x60, %o0
	stda	%i4,	[%l7 + %o0] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%o4
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x81,	%o6
	nop
	set	0x10, %o7
	stw	%l4,	[%l7 + %o7]
	set	0x70, %i5
	stxa	%o5,	[%l7 + %i5] 0x89
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%o2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x89
	set	0x14, %i2
	swapa	[%l7 + %i2] 0x89,	%i3
	set	0x4C, %o4
	stwa	%g5,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%l0
	fpadd32	%f16,	%f18,	%f30
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%g6
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x37, %i3
	stb	%o7,	[%l7 + %i3]
	nop
	set	0x18, %l3
	lduh	[%l7 + %l3],	%g4
	nop
	set	0x34, %o6
	stw	%l1,	[%l7 + %o6]
	ld	[%l7 + 0x50],	%f9
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f0
	set	0x78, %g7
	stha	%i1,	[%l7 + %g7] 0x80
	set	0x28, %o5
	lda	[%l7 + %o5] 0x81,	%f14
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%o3
	nop
	set	0x18, %g4
	prefetch	[%l7 + %g4],	 1
	set	0x7C, %l5
	stha	%o0,	[%l7 + %l5] 0x81
	set	0x3C, %l1
	stwa	%g3,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	nop
	setx	0x1F5B4E18,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xDB396D7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f6,	%f17
	nop
	set	0x14, %g3
	lduh	[%l7 + %g3],	%o1
	nop
	set	0x4C, %i0
	prefetch	[%l7 + %i0],	 1
	st	%f24,	[%l7 + 0x18]
	set	0x64, %l0
	sta	%f7,	[%l7 + %l0] 0x88
	nop
	set	0x60, %i7
	swap	[%l7 + %i7],	%i7
	nop
	nop
	setx	0xC58BE78E067FD9F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD0F6E3C75AB4B6F1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f12
	nop
	set	0x0C, %g6
	ldsh	[%l7 + %g6],	%i4
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%f4
	nop
	set	0x4C, %g5
	prefetch	[%l7 + %g5],	 1
	bne,a	%icc,	loop_230
	nop
	set	0x44, %l2
	lduw	[%l7 + %l2],	%l6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x09, %o3
	ldstub	[%l7 + %o3],	%i6
loop_230:
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g2
	nop
	set	0x40, %o0
	ldsh	[%l7 + %o0],	%g1
	nop
	set	0x5A, %i5
	stb	%g7,	[%l7 + %i5]
	nop
	set	0x38, %i6
	ldstub	[%l7 + %i6],	%l5
	nop
	set	0x10, %o2
	std	%f0,	[%l7 + %o2]
	nop
	set	0x18, %g2
	ldsw	[%l7 + %g2],	%i2
	set	0x78, %o4
	stxa	%i5,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x81,	 3
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%l2
	set	0x10, %l6
	stxa	%o6,	[%l7 + %l6] 0x88
	or	%o4,	%l4,	%o2
	nop
	set	0x60, %i2
	std	%i2,	[%l7 + %i2]
	set	0x32, %i3
	stha	%o5,	[%l7 + %i3] 0xe3
	membar	#Sync
	wr	%l0,	%g6,	%y
	set	0x18, %o6
	swapa	[%l7 + %o6] 0x81,	%o7
	and	%g4,	%g5,	%i1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	nop
	set	0x66, %l3
	ldstub	[%l7 + %l3],	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o3
	set	0x48, %g7
	stxa	%g3,	[%l7 + %g7] 0x89
	st	%f2,	[%l7 + 0x6C]
	or	%o0,	%o1,	%i4
	set	0x77, %o5
	ldstuba	[%l7 + %o5] 0x81,	%l6
	nop
	set	0x10, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x20, %l1
	stx	%i6,	[%l7 + %l1]
	set	0x28, %g3
	lda	[%l7 + %g3] 0x80,	%f13
	nop
	set	0x3A, %g4
	sth	%g2,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x08]
	set	0x35, %i0
	stba	%g1,	[%l7 + %i0] 0x80
	nop
	set	0x78, %i7
	stx	%i7,	[%l7 + %i7]
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x80,	%g6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f0
	wr	%i2,	%l5,	%clear_softint
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x81,	%i5
	set	0x34, %g5
	stwa	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	bge,a,pn	%xcc,	loop_231
	nop
	set	0x34, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x44, %o3
	swapa	[%l7 + %o3] 0x81,	%o6
loop_231:
	nop
	set	0x78, %o7
	stx	%l3,	[%l7 + %o7]
	set	0x40, %o0
	stba	%l4,	[%l7 + %o0] 0x89
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd0
	set	0x23, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o4
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f10
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc8
	nop
	set	0x5C, %i6
	lduh	[%l7 + %i6],	%i3
	nop
	set	0x20, %o4
	std	%f20,	[%l7 + %o4]
	nop
	set	0x30, %i1
	lduh	[%l7 + %i1],	%o2
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f14
	nop
	set	0x40, %o1
	ldsw	[%l7 + %o1],	%o5
	add	%g6,	%l0,	%g4
	or	%g5,	%i1,	%i0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f0
	nop
	set	0x28, %o6
	swap	[%l7 + %o6],	%o7
	set	0x58, %i3
	stxa	%l1,	[%l7 + %i3] 0x81
	nop
	set	0x54, %l3
	lduw	[%l7 + %l3],	%g3
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%o3
	st	%f27,	[%l7 + 0x58]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i4
	set	0x57, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f16
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f16
	set	0x32, %g3
	stha	%l6,	[%l7 + %g3] 0x80
	nop
	set	0x48, %g4
	lduw	[%l7 + %g4],	%g2
	nop
	set	0x09, %i0
	ldsb	[%l7 + %i0],	%g1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x87A, 	%tick_cmpr
	set	0x2C, %l4
	stba	%i2,	[%l7 + %l4] 0x80
	nop
	set	0x67, %g6
	ldstub	[%l7 + %g6],	%l5
	set	0x28, %i7
	stda	%i4,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x5C, %l0
	ldsw	[%l7 + %l0],	%l2
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x80,	%g7
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0
	ld	[%l7 + 0x20],	%f25
	set	0x08, %g1
	stda	%o6,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x68, %o3
	stwa	%o4,	[%l7 + %o3] 0x89
	set	0x3C, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i3
	nop
	set	0x3C, %o7
	ldsw	[%l7 + %o7],	%o2
	nop
	set	0x58, %l2
	std	%f6,	[%l7 + %l2]
	nop
	set	0x38, %i5
	std	%f6,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x6C]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd0
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f30
	set	0x30, %o4
	sta	%f19,	[%l7 + %o4] 0x81
	set	0x34, %i1
	stwa	%l4,	[%l7 + %i1] 0x88
	nop
	set	0x64, %l6
	stw	%g6,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x7C]
	add	%l0,	%g4,	%o5
	set	0x20, %i6
	lda	[%l7 + %i6] 0x88,	%f18
	set	0x48, %i2
	stda	%g4,	[%l7 + %i2] 0x81
	nop
	set	0x40, %o1
	stw	%i1,	[%l7 + %o1]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1271
!	Type a   	: 31
!	Type cti   	: 29
!	Type x   	: 541
!	Type f   	: 28
!	Type i   	: 100
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
.word 0x45D51A1E
.word 0x245DC32C
.word 0x5FD792A2
.word 0x451028AB
.word 0xAA9F2BBB
.word 0x211058FB
.word 0xD55F8005
.word 0xF58BFD6B
.word 0xC56BA4B4
.word 0xE79C4EF6
.word 0x97D2B441
.word 0xFD899A5E
.word 0x49FB02EB
.word 0xEBB7042C
.word 0x927E06F2
.word 0xE4D05D97
.word 0xE048AC1E
.word 0xA0DBCC28
.word 0xC1F45FE0
.word 0x51F581C4
.word 0x15166E22
.word 0x78DBC968
.word 0xBCA9131A
.word 0x1FF6FF12
.word 0xC740E0FF
.word 0xCCFD183D
.word 0xF0185B18
.word 0xD0584453
.word 0x689D774D
.word 0xA1ACDC60
.word 0xC962336A
.word 0xAAE2352B
.word 0x6BD198DB
.word 0xE1094AA8
.word 0x6A71C665
.word 0x698559FE
.word 0xF9715966
.word 0x0156D2EF
.word 0x9EFDCD31
.word 0x80F6D966
.word 0x1310A6B8
.word 0x3BF83CA6
.word 0xA839A666
.word 0xCF0BC14B
.word 0x7AD84BCB
.word 0x63751381
.word 0x41E57611
.word 0x6FBACEA0
.word 0x6D5B4276
.word 0xEEE6F8B5
.word 0x39A4C62A
.word 0x8A8391C3
.word 0xAAF897B3
.word 0x11973B07
.word 0xC00238A1
.word 0x443925E4
.word 0xB17AEE07
.word 0x49F1FA06
.word 0x9BF7C993
.word 0x777433C3
.word 0xE68D75E4
.word 0x0F3EAA53
.word 0xE476B038
.word 0x1016723B
!! thread 1 data, 64 words.
.word 0xE44B4213
.word 0x7BF14093
.word 0x490C6D6B
.word 0xAE3FFCF2
.word 0xFACB255B
.word 0x8EB6E050
.word 0x220A4698
.word 0xAC79A8E5
.word 0x37E7F5CB
.word 0xEA298AED
.word 0x03F40947
.word 0x8BDED90A
.word 0x1AFC0E41
.word 0x9CC8EA55
.word 0xDEE22D03
.word 0xBA026C3C
.word 0x480D50A1
.word 0x345083C3
.word 0x6C2D6DF1
.word 0x57903F85
.word 0xA52696D6
.word 0x2C2C084B
.word 0xE087E84E
.word 0x2EB4CF6F
.word 0xEB447EB8
.word 0x20AD5CA0
.word 0x41C9313B
.word 0x1460FE94
.word 0xBFC89289
.word 0x4D2FA74C
.word 0x033C76C7
.word 0x0B54825E
.word 0x5AD4FB9B
.word 0xEB2C2D67
.word 0x7C915F0D
.word 0x52635D20
.word 0xD0B9E614
.word 0x78EF09CA
.word 0xAC3C3432
.word 0x13A7E558
.word 0x95A67135
.word 0xA9B67B02
.word 0x68BA5DBF
.word 0x502FBD2C
.word 0x5B5C1DBF
.word 0x6B295813
.word 0x8244AFC0
.word 0x5DD0C433
.word 0x1CB10397
.word 0xA7008563
.word 0x64009A25
.word 0x72994154
.word 0xFAFA4566
.word 0x107569EC
.word 0xEC84A580
.word 0x3E6069D6
.word 0x797F0C3C
.word 0xBCC368AF
.word 0x961746DE
.word 0x05F6FFD8
.word 0xEBE354FF
.word 0x927F5D09
.word 0xA4193BDA
.word 0x800F5D04
!! thread 2 data, 64 words.
.word 0x69D4C2DD
.word 0xD515BAA1
.word 0x17C61FF6
.word 0x616F06B6
.word 0xEC81F58C
.word 0x867F0195
.word 0x484A83D5
.word 0xF72267FF
.word 0x0DB83B13
.word 0xD22B18EE
.word 0x6C38BB57
.word 0xE202DC95
.word 0x2DC646A4
.word 0xB5F74A30
.word 0x62660990
.word 0x5A028CF0
.word 0x0F3079DF
.word 0x2AFD1A83
.word 0xF82B7488
.word 0xC85742B6
.word 0x90619D6B
.word 0xE4B6415F
.word 0x9A0700D7
.word 0xD96C39F1
.word 0x6D952FDC
.word 0x924F41D5
.word 0x432A78E9
.word 0xD180C4D9
.word 0x8AB2F9E6
.word 0x5A6A8A93
.word 0x06E24808
.word 0x3C4B6F4C
.word 0x6049DF74
.word 0xFD3DEAFC
.word 0x4700DFBC
.word 0x68401C46
.word 0xC98D2107
.word 0xD1372A2B
.word 0x919B1A49
.word 0x44389C07
.word 0xA734E14E
.word 0x555FBC60
.word 0xE1EC10A1
.word 0x899493D9
.word 0xEC10ECBC
.word 0xBE5C3357
.word 0x3137D860
.word 0xD91EB43E
.word 0x994ED343
.word 0x11EDDE36
.word 0xA8630080
.word 0xEC57734B
.word 0xA13B75EA
.word 0xB4C11034
.word 0x8704CE01
.word 0xEB72765B
.word 0x54098902
.word 0xDAAF288C
.word 0xD3650499
.word 0xA97C0096
.word 0xEC0E3E41
.word 0xE4C15C58
.word 0xE7514804
.word 0x2608F3BB
!! thread 3 data, 64 words.
.word 0x98888FC2
.word 0x367D94BD
.word 0xE09D20BE
.word 0x8731DEC3
.word 0x694F7303
.word 0x77E7BEAD
.word 0x4105AE3B
.word 0x699A42B1
.word 0x25E8C0EA
.word 0x1EA78B83
.word 0xA9F0CD67
.word 0x269D79BB
.word 0x2035C385
.word 0xBA2CD448
.word 0x9319A25A
.word 0xA53EBFC1
.word 0xB9EE3A65
.word 0x1F902511
.word 0x421E37C8
.word 0xA979C7CA
.word 0xADC219C9
.word 0xAE0311D5
.word 0xB29D63E3
.word 0xF0A37491
.word 0x53F85D7B
.word 0x76421DD1
.word 0xC497F549
.word 0xF175F131
.word 0x7867C4AF
.word 0xCB4D8648
.word 0x107DE748
.word 0xD5B51BDC
.word 0xE0122F88
.word 0x59E11E06
.word 0x7EAF09BD
.word 0x610E6763
.word 0x10235701
.word 0x44F09DA0
.word 0xF27B2D36
.word 0x7900C99E
.word 0x125CA2F6
.word 0x5723FFAC
.word 0x68DFF6DD
.word 0x02A39D8C
.word 0xED81A092
.word 0x43BB671A
.word 0x2EF0754E
.word 0xC8F77FDD
.word 0xF555E85C
.word 0x5344FA5B
.word 0xCEAA512F
.word 0x2F8AECE9
.word 0x67F4B8AE
.word 0x10B576F0
.word 0xEF47E669
.word 0x0DEEE84E
.word 0x7F9CF36F
.word 0x7332091A
.word 0x44520DA2
.word 0x3EC03748
.word 0xFA6B14C0
.word 0x2C253FD1
.word 0x494D3466
.word 0x1D910C03
!! thread 4 data, 64 words.
.word 0x704AD89D
.word 0xC2B47B1E
.word 0xA18461BB
.word 0x67469390
.word 0xC33A1782
.word 0xC9E6B545
.word 0xA3CAAA9A
.word 0x15E332D6
.word 0xB2DE93C5
.word 0x0EEA6C49
.word 0xA89DA5F2
.word 0xE049B7A9
.word 0x9AB467E5
.word 0x1EC02C19
.word 0xD709D044
.word 0xDD51143E
.word 0xA6772250
.word 0xF67DDF67
.word 0x4A423143
.word 0x5DCEEC4E
.word 0x21F0B1CE
.word 0x55F1C30A
.word 0xCE0E9AB6
.word 0xB63F347A
.word 0xD5D7A598
.word 0xB9215FF5
.word 0x154B9ADD
.word 0x565D1F83
.word 0xC9B53485
.word 0xE91821E8
.word 0x19EBCFA9
.word 0xFE23A8E2
.word 0xF8457D5D
.word 0xCF756EBF
.word 0x5B4635A3
.word 0x02D622E3
.word 0x0785B5B6
.word 0x702C124A
.word 0x6C4AD8B1
.word 0xB1258EFC
.word 0x7582F3FC
.word 0xCB5E879C
.word 0xE237EF7B
.word 0xC7974BC4
.word 0xBD2C1250
.word 0xD23358E6
.word 0x4B0CD6E4
.word 0x84AF4284
.word 0x213C3110
.word 0x70474CE7
.word 0xA4200536
.word 0xAA8D836B
.word 0x3D67B8DD
.word 0x0ACE4C0C
.word 0x82C644E6
.word 0x5C97CE84
.word 0x74AFB153
.word 0x59EF5001
.word 0x1D9A31FC
.word 0xA7B65DD2
.word 0x566FDBAF
.word 0x7C00E722
.word 0xEA47E379
.word 0x87A73739
!! thread 5 data, 64 words.
.word 0x378B7D74
.word 0xE7D70C5E
.word 0x048C2801
.word 0x1A7106E9
.word 0x618D1B7F
.word 0xFE9B903E
.word 0xED950B89
.word 0x91BB0994
.word 0x4B2CC3B4
.word 0x7A52F583
.word 0xF0B53671
.word 0x0F52BD7C
.word 0x8507CDCE
.word 0x972B6986
.word 0x1304CEF8
.word 0x92C31F02
.word 0x25C052B7
.word 0x5DBDF62D
.word 0x879A0772
.word 0x279D2C74
.word 0x1BFBD4DA
.word 0xE085DBE3
.word 0x413C9042
.word 0xB34FB383
.word 0x7CE5BEB1
.word 0x07796A94
.word 0x1E27570B
.word 0xC4773B07
.word 0x95F0410C
.word 0xE0290DAD
.word 0xF97BE6EB
.word 0x287BCD90
.word 0xA9E0B454
.word 0x87C57C80
.word 0x79F06AD3
.word 0x757AE53D
.word 0x165FA729
.word 0x140F2C2E
.word 0xFD3CC607
.word 0x2A63870D
.word 0x73942788
.word 0x4A5CD445
.word 0x6CECE83B
.word 0x233E56AA
.word 0xAA4637D9
.word 0x1CBAD35C
.word 0xF341E7EF
.word 0x6171075A
.word 0x24A1A640
.word 0x6F93CE80
.word 0x6E376E67
.word 0x23F9D95B
.word 0x10A238E4
.word 0x718973DE
.word 0x93788109
.word 0xF834EF52
.word 0x266A22A8
.word 0x2E59D2AB
.word 0x12F50E4D
.word 0x5557341C
.word 0xD07481E6
.word 0x10A55B70
.word 0xAE4F2A1A
.word 0xE88D97D9
!! thread 6 data, 64 words.
.word 0xC40901EC
.word 0xCF550306
.word 0x62A7632A
.word 0x7C27CB52
.word 0xAD7D1171
.word 0x1717F92F
.word 0x0784D0D8
.word 0x3C4DD4FE
.word 0x3A4A27CF
.word 0xE8054B73
.word 0x7263A2D4
.word 0x87793FCC
.word 0x7AFDB1D6
.word 0xA0CE1A59
.word 0x795B4C4C
.word 0xD2CBEF35
.word 0xD43C1135
.word 0x8C89D065
.word 0x7ABC8541
.word 0xEA4A6092
.word 0xD219F738
.word 0x3BA5326A
.word 0x28E3F09D
.word 0xCDC635CA
.word 0x85F3DB28
.word 0x359CEC87
.word 0xBC755791
.word 0x0BE40BC4
.word 0x4FAEA34B
.word 0x9BB0441B
.word 0xC0A72CD7
.word 0x11C7ED17
.word 0x41924D3B
.word 0x17D3475F
.word 0x0011F700
.word 0xD477146A
.word 0xB3B2AD3A
.word 0x1A86B6DC
.word 0xAB10DB7D
.word 0x46CD6C4F
.word 0x24C4A98B
.word 0xA00E1C8D
.word 0x4D0FC527
.word 0x98BB6A8D
.word 0x8A6FCF59
.word 0xDE0F47DE
.word 0x22257D33
.word 0x7FF0FEDF
.word 0x96FA1F27
.word 0xB8ED86DF
.word 0x9D50EEAF
.word 0x1C799C22
.word 0xEE3B8DE6
.word 0x4F1D5A80
.word 0x9E8B1351
.word 0x21578DF5
.word 0x8371452C
.word 0x63898FA7
.word 0xD1E39357
.word 0x115A4DAE
.word 0x6E7A2D73
.word 0xCB15310A
.word 0xBC00BEF7
.word 0xC580370E
!! thread 7 data, 64 words.
.word 0x039400D6
.word 0x0DB1DEF4
.word 0x065B84E0
.word 0x5C57818F
.word 0x3F05017D
.word 0x371C09F8
.word 0x0DA2A732
.word 0xC402C565
.word 0x1157A1B8
.word 0xE6B035F7
.word 0x90456918
.word 0x89AD6E11
.word 0x813ADE9A
.word 0x4EB7C3D8
.word 0x989FF7D0
.word 0x950C8402
.word 0x3298DB65
.word 0x431F58C8
.word 0x8087118C
.word 0x2C323A8C
.word 0xBE704DC1
.word 0x32CE7D44
.word 0xC0510885
.word 0x9E3F0F20
.word 0x81A58CE7
.word 0xE756BA7B
.word 0x5C9AD214
.word 0x72674411
.word 0x89856120
.word 0xE179AB84
.word 0x5AE1EADC
.word 0xFEEBABFA
.word 0x007D01B0
.word 0xCF931976
.word 0xFE0885B0
.word 0x00A1835E
.word 0xB39ABD22
.word 0xDA1556E0
.word 0x69CBBBF3
.word 0xB28F3E5B
.word 0xC7488247
.word 0xC3D347A9
.word 0x167CC7FF
.word 0x1D395578
.word 0x8E7C8AC1
.word 0x44778FE1
.word 0x8DEF24EE
.word 0xDA333453
.word 0x5863A4A0
.word 0xB4FE9626
.word 0xBF7BAFB2
.word 0x7080419C
.word 0x5D129B3B
.word 0x7D47C57E
.word 0xC320749B
.word 0x2E0EB02E
.word 0x369BD7C4
.word 0x87EDC83E
.word 0xBC6A0D74
.word 0x07FD5F11
.word 0x50E30702
.word 0xECCD68A8
.word 0x3B4DAA0F
.word 0x827CDA24
.end
