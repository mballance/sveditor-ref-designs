/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc15.s
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
	set	0x3,	%g1
	set	0x2,	%g2
	set	0x6,	%g3
	set	0xB,	%g4
	set	0xF,	%g5
	set	0xE,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xE,	%i1
	set	-0x3,	%i2
	set	-0x5,	%i3
	set	-0x4,	%i4
	set	-0xA,	%i5
	set	-0x0,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x0CF91DF4,	%l0
	set	0x46995B0D,	%l1
	set	0x2C59B7B0,	%l2
	set	0x600E319C,	%l3
	set	0x77ACD34E,	%l4
	set	0x1067EF01,	%l5
	set	0x2DE47A7A,	%l6
	!# Output registers
	set	0x0D30,	%o0
	set	0x0B8C,	%o1
	set	0x0AFE,	%o2
	set	-0x1A8F,	%o3
	set	0x19D4,	%o4
	set	0x1445,	%o5
	set	0x0887,	%o6
	set	-0x0373,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x498E436B2A17D874)
	INIT_TH_FP_REG(%l7,%f2,0x9DA70FE038E67A95)
	INIT_TH_FP_REG(%l7,%f4,0xC716D6721008BB17)
	INIT_TH_FP_REG(%l7,%f6,0x074510FD65C801EB)
	INIT_TH_FP_REG(%l7,%f8,0x2BDD2C7D9D3EFE0B)
	INIT_TH_FP_REG(%l7,%f10,0xD18DE479F59AB1D0)
	INIT_TH_FP_REG(%l7,%f12,0xF0812273C65ED1F9)
	INIT_TH_FP_REG(%l7,%f14,0xED13DB8D49B17205)
	INIT_TH_FP_REG(%l7,%f16,0xA0905399E9BD005E)
	INIT_TH_FP_REG(%l7,%f18,0xBF6734AACB353C9E)
	INIT_TH_FP_REG(%l7,%f20,0x641E97863B6AC24B)
	INIT_TH_FP_REG(%l7,%f22,0x420582CDDD78A165)
	INIT_TH_FP_REG(%l7,%f24,0x7A8277B8EBBD4490)
	INIT_TH_FP_REG(%l7,%f26,0x8569979BC5D4FF95)
	INIT_TH_FP_REG(%l7,%f28,0x70627D2372356EF3)
	INIT_TH_FP_REG(%l7,%f30,0x999975356C59280D)

	!# Execute Main Diag ..

	set	0x46, %i0
	ldstuba	[%l7 + %i0] 0x81,	%o3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%l1
	fpsub32	%f18,	%f24,	%f28
	wr	%g2,	%l3,	%sys_tick
	nop
	set	0x4A, %l2
	stb	%o4,	[%l7 + %l2]
	nop
	set	0x60, %o7
	ldstub	[%l7 + %o7],	%g3
	nop
	set	0x68, %l3
	std	%f0,	[%l7 + %l3]
	or	%l6,	%i6,	%o7
	nop
	set	0x60, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x20, %i3
	ldx	[%l7 + %i3],	%o5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i5
	nop
	set	0x44, %g3
	prefetch	[%l7 + %g3],	 0
	nop
	set	0x49, %o2
	ldstub	[%l7 + %o2],	%i4
	set	0x2C, %l6
	lda	[%l7 + %l6] 0x88,	%f31
	nop
	set	0x30, %g6
	swap	[%l7 + %g6],	%l4
	set	0x48, %l1
	swapa	[%l7 + %l1] 0x89,	%g7
	nop
	set	0x20, %l4
	std	%f4,	[%l7 + %l4]
	set	0x30, %o4
	sta	%f26,	[%l7 + %o4] 0x89
	set	0x5E, %g2
	stha	%l5,	[%l7 + %g2] 0x81
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%i1
	nop
	set	0x20, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%g4
	set	0x74, %g4
	lda	[%l7 + %g4] 0x80,	%f19
	nop
	set	0x10, %g7
	swap	[%l7 + %g7],	%l0
	nop
	set	0x6C, %g1
	lduw	[%l7 + %g1],	%i7
	set	0x48, %o3
	lda	[%l7 + %o3] 0x80,	%f13
	set	0x5A, %i1
	stba	%l2,	[%l7 + %i1] 0x88
	or	%i0,	%o6,	%o2
	st	%f10,	[%l7 + 0x3C]
	nop
	set	0x46, %o0
	sth	%g5,	[%l7 + %o0]
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	nop
	set	0x70, %g5
	ldstub	[%l7 + %g5],	%o1
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%g6
	nop
	set	0x78, %l5
	ldsh	[%l7 + %l5],	%l1
	set	0x26, %l0
	stba	%g2,	[%l7 + %l0] 0x81
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%l3
	set	0x30, %i5
	lda	[%l7 + %i5] 0x81,	%f23
	set	0x2F, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%l6
	nop
	set	0x20, %l2
	std	%f24,	[%l7 + %l2]
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x80,	%i6
	st	%f25,	[%l7 + 0x0C]
	nop
	set	0x52, %l3
	ldsh	[%l7 + %l3],	%o3
	set	0x34, %o6
	swapa	[%l7 + %o6] 0x81,	%o7
	nop
	set	0x3A, %o7
	sth	%o5,	[%l7 + %o7]
	set	0x2D, %i3
	stba	%i5,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x0C, %o2
	stw	%i4,	[%l7 + %o2]
	nop
	set	0x40, %l6
	stw	%g1,	[%l7 + %l6]
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%l4
	nop
	set	0x74, %g6
	ldsw	[%l7 + %g6],	%g7
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f20
	set	0x48, %l4
	stwa	%l5,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x3D, %o4
	ldsb	[%l7 + %o4],	%i2
	set	0x28, %g2
	stda	%i0,	[%l7 + %g2] 0x80
	st	%f10,	[%l7 + 0x30]
	nop
	set	0x20, %o5
	ldsw	[%l7 + %o5],	%i3
	nop
	set	0x68, %o1
	std	%f18,	[%l7 + %o1]
	nop
	set	0x20, %g7
	ldsh	[%l7 + %g7],	%g4
	set	0x48, %g4
	stda	%l0,	[%l7 + %g4] 0x88
	and	%l2,	%i0,	%o6
	set	0x50, %o3
	ldda	[%l7 + %o3] 0xe2,	%i6
	nop
	set	0x42, %i1
	ldsh	[%l7 + %i1],	%g5
	nop
	set	0x1E, %g1
	lduh	[%l7 + %g1],	%o2
	nop
	set	0x40, %o0
	sth	%o0,	[%l7 + %o0]
	set	0x0B, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g6
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x81,	%l1
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%g2
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x20, %i4
	stxa	%l3,	[%l7 + %i4] 0x81
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f16
	nop
	set	0x48, %i5
	ldstub	[%l7 + %i5],	%o1
	wr	%g3,	%l6,	%ccr
	add	%o4,	%o3,	%o7
	nop
	set	0x6C, %i7
	prefetch	[%l7 + %i7],	 0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%i6
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xe3,	%i4
	nop
	set	0x0B, %l2
	ldub	[%l7 + %l2],	%i4
	fpsub32s	%f22,	%f0,	%f29
	nop
	set	0x30, %o6
	std	%g0,	[%l7 + %o6]
	nop
	set	0x28, %o7
	stw	%l4,	[%l7 + %o7]
	or	%g7,	%i2,	%i1
	ld	[%l7 + 0x38],	%f7
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x81,	 1
	set	0x18, %o2
	stda	%i2,	[%l7 + %o2] 0x80
	nop
	set	0x30, %l3
	std	%g4,	[%l7 + %l3]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f0
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f16
	nop
	set	0x50, %l1
	ldx	[%l7 + %l1],	%l2
	nop
	set	0x7A, %g6
	sth	%i0,	[%l7 + %g6]
	add	%l0,	%i7,	%o6
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x81,	%g5
	nop
	set	0x20, %g2
	std	%o2,	[%l7 + %g2]
	ld	[%l7 + 0x34],	%f15
	set	0x24, %o5
	sta	%f21,	[%l7 + %o5] 0x89
	nop
	set	0x30, %o1
	std	%g6,	[%l7 + %o1]
	ld	[%l7 + 0x44],	%f23
	set	0x58, %o4
	stda	%o0,	[%l7 + %o4] 0x88
	st	%fsr,	[%l7 + 0x68]
	set	0x76, %g4
	stha	%g2,	[%l7 + %g4] 0xeb
	membar	#Sync
	ld	[%l7 + 0x68],	%f15
	add	%l1,	%l3,	%o1
	nop
	set	0x32, %g7
	ldsh	[%l7 + %g7],	%l6
	nop
	set	0x64, %o3
	stw	%o4,	[%l7 + %o3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f16
	nop
	set	0x72, %o0
	ldsb	[%l7 + %o0],	%o3
	set	0x6C, %i2
	sta	%f10,	[%l7 + %i2] 0x81
	wr	%o7,	%g3,	%ccr
	set	0x3C, %i6
	swapa	[%l7 + %i6] 0x81,	%i6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x80
	nop
	set	0x50, %l5
	std	%f4,	[%l7 + %l5]
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%o5
	nop
	set	0x4A, %l0
	ldsb	[%l7 + %l0],	%i5
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x81
	set	0x40, %i7
	stwa	%i4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x0C, %g5
	prefetch	[%l7 + %g5],	 4
	or	%l4,	%g7,	%g1
	nop
	set	0x18, %l2
	std	%f16,	[%l7 + %l2]
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%i2
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x81,	 2
	nop
	set	0x76, %i3
	sth	%i1,	[%l7 + %i3]
	nop
	set	0x20, %o2
	std	%f26,	[%l7 + %o2]
	nop
	set	0x40, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x70, %o6
	stwa	%g4,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x20, %l6
	std	%l2,	[%l7 + %l6]
	nop
	set	0x70, %l1
	std	%i2,	[%l7 + %l1]
	nop
	set	0x14, %g3
	lduh	[%l7 + %g3],	%i0
	set	0x7C, %g6
	stha	%i7,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %l4
	stwa	%l0,	[%l7 + %l4] 0x89
	set	0x68, %o5
	stda	%g4,	[%l7 + %o5] 0x80
	nop
	set	0x72, %g2
	lduh	[%l7 + %g2],	%o2
	st	%f25,	[%l7 + 0x40]
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%o6
	nop
	set	0x22, %o4
	sth	%g6,	[%l7 + %o4]
	nop
	set	0x64, %g4
	sth	%o0,	[%l7 + %g4]
	or	%g2,	%l1,	%o1
	st	%fsr,	[%l7 + 0x18]
	set	0x1A, %o3
	stha	%l6,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x58, %i1
	swap	[%l7 + %i1],	%l3
	nop
	set	0x24, %g7
	swap	[%l7 + %g7],	%o4
	nop
	set	0x5C, %o0
	stb	%o7,	[%l7 + %o0]
	nop
	set	0x78, %i2
	std	%o2,	[%l7 + %i2]
	nop
	set	0x2C, %i6
	ldsw	[%l7 + %i6],	%g3
	set	0x50, %l5
	stha	%i6,	[%l7 + %l5] 0x81
	fpsub16s	%f13,	%f23,	%f10
	nop
	set	0x7C, %i4
	sth	%o5,	[%l7 + %i4]
	set	0x64, %g1
	stwa	%i4,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%l4
	nop
	set	0x3C, %l0
	sth	%g7,	[%l7 + %l0]
	set	0x40, %i7
	stwa	%i5,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%i2
	nop
	set	0x0C, %i0
	ldsh	[%l7 + %i0],	%g1
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x88,	%l5
	set	0x74, %i3
	lda	[%l7 + %i3] 0x81,	%f23
	set	0x28, %o7
	stda	%i0,	[%l7 + %o7] 0x80
	nop
	set	0x5B, %o2
	ldub	[%l7 + %o2],	%l2
	st	%f25,	[%l7 + 0x58]
	st	%f5,	[%l7 + 0x08]
	nop
	set	0x24, %l3
	ldsb	[%l7 + %l3],	%i3
	nop
	set	0x32, %o6
	stb	%i0,	[%l7 + %o6]
	set	0x50, %l1
	stwa	%i7,	[%l7 + %l1] 0x88
	nop
	set	0x08, %g3
	std	%l0,	[%l7 + %g3]
	nop
	set	0x72, %g6
	ldstub	[%l7 + %g6],	%g4
	add	%o2,	%g5,	%o6
	nop
	set	0x50, %l4
	swap	[%l7 + %l4],	%g6
	st	%f22,	[%l7 + 0x3C]
	add	%g2,	%o0,	%o1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%l6
	nop
	set	0x7E, %g2
	ldstub	[%l7 + %g2],	%l1
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	nop
	set	0x22, %o1
	sth	%o7,	[%l7 + %o1]
	nop
	set	0x20, %g4
	sth	%l3,	[%l7 + %g4]
	nop
	set	0x3C, %i1
	lduw	[%l7 + %i1],	%o3
	set	0x7E, %g7
	stha	%g3,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x31, %o3
	ldsb	[%l7 + %o3],	%i6
	nop
	set	0x52, %o0
	stb	%i4,	[%l7 + %o0]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f0
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%o5
	nop
	set	0x50, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%l4
	nop
	nop
	setx	0x8E6C01892CDC4955,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x08DF21A3740B6C11,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f22,	%f26
	bg,a	%xcc,	loop_1
	nop
	set	0x0C, %g1
	sth	%i5,	[%l7 + %g1]
	nop
	set	0x11, %i5
	ldub	[%l7 + %i5],	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%l5
loop_1:
	nop
	set	0x0C, %i7
	swap	[%l7 + %i7],	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i3
	fpsub16s	%f7,	%f0,	%f6
	nop
	set	0x78, %l2
	std	%f14,	[%l7 + %l2]
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f14
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xe3,	%g6
	set	0x5C, %g5
	stba	%i0,	[%l7 + %g5] 0xeb
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%i7
	nop
	set	0x75, %i3
	ldsb	[%l7 + %i3],	%o2
	nop
	set	0x3C, %o7
	lduw	[%l7 + %o7],	%g4
	set	0x70, %l3
	stda	%o6,	[%l7 + %l3] 0xe2
	membar	#Sync
	and	%g6,	%g5,	%g2
	nop
	set	0x74, %o2
	swap	[%l7 + %o2],	%o0
	nop
	set	0x08, %l1
	sth	%o1,	[%l7 + %l1]
	nop
	set	0x58, %g3
	std	%l0,	[%l7 + %g3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA94, 	%sys_tick_cmpr
	set	0x2C, %g6
	sta	%f17,	[%l7 + %g6] 0x80
	nop
	set	0x62, %l4
	ldsh	[%l7 + %l4],	%l3
	bn,a	%xcc,	loop_2
	nop
	set	0x18, %o6
	stx	%fsr,	[%l7 + %o6]
	or	%o4,	%g3,	%o3
	set	0x3C, %l6
	swapa	[%l7 + %l6] 0x81,	%i6
loop_2:
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x17, %o5
	ldsb	[%l7 + %o5],	%o5
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%l4
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	nop
	setx	0x91277DE2AC620E0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7298302EB216625E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f16,	%f4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x89
	and	%i4,	%i2,	%i5
	or	%g1,	%l5,	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%g7
	nop
	set	0x48, %i1
	lduw	[%l7 + %i1],	%i0
	set	0x20, %o4
	stha	%i3,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x40, %o3
	stx	%i7,	[%l7 + %o3]
	nop
	set	0x41, %g7
	ldub	[%l7 + %g7],	%l0
	nop
	set	0x40, %o0
	std	%f8,	[%l7 + %o0]
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x81,	%g4
	set	0x1B, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o2
	nop
	set	0x50, %i6
	stx	%o6,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x78]
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%g2
	nop
	set	0x1A, %i5
	ldsb	[%l7 + %i5],	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o1
	set	0x28, %i7
	sta	%f8,	[%l7 + %i7] 0x88
	and	%l1,	%o7,	%l6
	nop
	set	0x14, %l2
	prefetch	[%l7 + %l2],	 4
	add	%o4,	%g3,	%o3
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%i6
	nop
	set	0x08, %l0
	stb	%o5,	[%l7 + %l0]
	nop
	set	0x08, %i3
	std	%l2,	[%l7 + %i3]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x80,	 1
	nop
	set	0x2E, %o2
	lduh	[%l7 + %o2],	%i4
	nop
	set	0x78, %l3
	std	%f28,	[%l7 + %l3]
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x88,	%i2
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%g0
	set	0x5C, %o6
	lda	[%l7 + %o6] 0x80,	%f17
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%i5
	set	0x70, %o5
	stxa	%l5,	[%l7 + %o5] 0x89
	nop
	set	0x0F, %l6
	ldstub	[%l7 + %l6],	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%l2
	set	0x18, %g2
	stxa	%i3,	[%l7 + %g2] 0xe2
	membar	#Sync
	bg,a,pt	%xcc,	loop_3
	nop
	set	0x58, %g4
	sth	%i7,	[%l7 + %g4]
	nop
	set	0x6C, %o1
	sth	%i0,	[%l7 + %o1]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc0
loop_3:
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xe3,	%l0
	nop
	set	0x18, %o3
	stw	%o2,	[%l7 + %o3]
	set	0x79, %l5
	stba	%o6,	[%l7 + %l5] 0x88
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x88,	%g4
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%g2
	set	0x1C, %o0
	stha	%g4,	[%l7 + %o0] 0x80
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%o0
	nop
	set	0x26, %i5
	sth	%g6,	[%l7 + %i5]
	nop
	set	0x6C, %g1
	swap	[%l7 + %g1],	%o1
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x88,	 1
	nop
	set	0x4C, %i0
	stw	%l1,	[%l7 + %i0]
	nop
	nop
	setx	0x30823BEC3C8E0C1A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9FE6088826EBA5AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f24,	%f4
	set	0x50, %l0
	stxa	%l6,	[%l7 + %l0] 0x80
	set	0x60, %i3
	stwa	%o4,	[%l7 + %i3] 0x80
	set	0x10, %g5
	stxa	%g3,	[%l7 + %g5] 0xe2
	membar	#Sync
	bleu,a	%xcc,	loop_4
	nop
	set	0x68, %i7
	std	%f10,	[%l7 + %i7]
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%o3
	and	%i6,	%o5,	%l4
loop_4:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l3
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%g1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%i5
	set	0x08, %l1
	swapa	[%l7 + %l1] 0x80,	%i1
	set	0x2A, %l3
	stba	%g7,	[%l7 + %l3] 0x89
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x88,	%l2
	nop
	set	0x55, %g6
	ldstub	[%l7 + %g6],	%i3
	nop
	set	0x0C, %o5
	ldub	[%l7 + %o5],	%i7
	bge,a	%icc,	loop_5
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f24
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x78]
loop_5:
	nop
	set	0x50, %g2
	swap	[%l7 + %g2],	%l5
	set	0x40, %o1
	stda	%i0,	[%l7 + %o1] 0x89
	set	0x40, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l0
	nop
	set	0x5C, %i1
	ldsb	[%l7 + %i1],	%o2
	nop
	set	0x18, %g7
	std	%o6,	[%l7 + %g7]
	add	%g2,	%g4,	%g5
	nop
	set	0x6C, %o3
	ldsh	[%l7 + %o3],	%o0
	st	%f24,	[%l7 + 0x34]
	st	%f15,	[%l7 + 0x2C]
	or	%o1,	%g6,	%l1
	set	0x14, %g4
	lda	[%l7 + %g4] 0x81,	%f0
	add	%o7,	%l6,	%o4
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xcc
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%o3
	nop
	set	0x3C, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x16, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%l4
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%i4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%g1
	nop
	set	0x71, %i6
	ldstub	[%l7 + %i6],	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%i1
	st	%fsr,	[%l7 + 0x7C]
	set	0x70, %l0
	lda	[%l7 + %l0] 0x80,	%f24
	set	0x70, %i3
	stxa	%g7,	[%l7 + %i3] 0x80
	or	%l2,	%i5,	%i7
	fpsub16	%f18,	%f18,	%f28
	wr	%l5,	%i0,	%ccr
	set	0x74, %i0
	swapa	[%l7 + %i0] 0x88,	%l0
	set	0x1C, %i7
	sta	%f27,	[%l7 + %i7] 0x89
	fpadd16	%f28,	%f0,	%f26
	set	0x10, %g5
	stda	%o2,	[%l7 + %g5] 0x80
	nop
	set	0x70, %o2
	std	%f16,	[%l7 + %o2]
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	ld	[%l7 + 0x54],	%f30
	nop
	set	0x24, %l1
	swap	[%l7 + %l1],	%g2
	nop
	nop
	setx	0x6BEC0E5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x002D192D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f20,	%f1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%g5
	nop
	set	0x7B, %l3
	ldstub	[%l7 + %l3],	%g4
	set	0x38, %g3
	stwa	%o1,	[%l7 + %g3] 0x88
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x2C, %g6
	ldsh	[%l7 + %g6],	%g6
	set	0x70, %o5
	lda	[%l7 + %o5] 0x80,	%f18
	nop
	set	0x62, %o6
	lduh	[%l7 + %o6],	%l1
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x81,	%o0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%i6
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x6A, %o4
	ldsh	[%l7 + %o4],	%o7
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x89,	%g3
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x89,	%o3
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%o4
	add	%o5,	%l4,	%i6
	and	%g1,	%l3,	%i2
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%i0
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%i4
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xe2,	%g6
	set	0x20, %i4
	sta	%f11,	[%l7 + %i4] 0x89
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe3,	%l2
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%i4
	set	0x08, %l2
	stda	%i6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x37, %i6
	ldsb	[%l7 + %i6],	%l5
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%l0
	nop
	set	0x21, %l0
	stb	%o2,	[%l7 + %l0]
	set	0x27, %i0
	stba	%i3,	[%l7 + %i0] 0x89
	nop
	set	0x66, %i3
	lduh	[%l7 + %i3],	%g2
	nop
	set	0x58, %g5
	ldx	[%l7 + %g5],	%i0
	nop
	set	0x58, %o2
	std	%f26,	[%l7 + %o2]
	set	0x22, %i7
	stha	%g5,	[%l7 + %i7] 0xeb
	membar	#Sync
	fpsub16	%f14,	%f22,	%f26
	nop
	set	0x3C, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x60, %l3
	stb	%o6,	[%l7 + %l3]
	and	%g4,	%g6,	%o1
	set	0x7C, %l1
	stwa	%l1,	[%l7 + %l1] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%o7
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f30
	set	0x50, %o5
	sta	%f30,	[%l7 + %o5] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g3
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	nop
	set	0x60, %o6
	ldsw	[%l7 + %o6],	%o5
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x89,	%o4
	set	0x48, %l6
	sta	%f29,	[%l7 + %l6] 0x81
	fpsub32	%f30,	%f6,	%f22
	set	0x7C, %o4
	stwa	%l4,	[%l7 + %o4] 0x80
	fpadd16s	%f22,	%f12,	%f31
	nop
	set	0x38, %l4
	std	%f10,	[%l7 + %l4]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xea,	%i6
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f12
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x80,	%g1
	nop
	set	0x1A, %o1
	ldsh	[%l7 + %o1],	%i2
	st	%f6,	[%l7 + 0x50]
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f6
	set	0x57, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd0
	nop
	set	0x50, %i2
	lduh	[%l7 + %i2],	%i4
	nop
	set	0x1C, %g4
	swap	[%l7 + %g4],	%l3
	nop
	set	0x2C, %i5
	ldub	[%l7 + %i5],	%l2
	st	%f21,	[%l7 + 0x20]
	nop
	set	0x08, %l2
	ldsw	[%l7 + %l2],	%g7
	nop
	set	0x1A, %i6
	ldsh	[%l7 + %i6],	%i5
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%i7
	wr	%l5,	%o2,	%softint
	set	0x70, %l0
	stxa	%l0,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x2B, %i3
	ldstub	[%l7 + %i3],	%i3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xca
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xcc
	set	0x7C, %i7
	stwa	%g2,	[%l7 + %i7] 0x80
	or	%g5,	%i0,	%o6
	nop
	set	0x7A, %o7
	ldub	[%l7 + %o7],	%g6
	nop
	set	0x60, %g5
	stx	%g4,	[%l7 + %g5]
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l1,	%o0,	%o1
	set	0x68, %l1
	sta	%f30,	[%l7 + %l1] 0x89
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x80,	%o7
	st	%f12,	[%l7 + 0x14]
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f28
	set	0x3B, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o3
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x89,	 4
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xe2,	%g2
	nop
	set	0x70, %l4
	stx	%l4,	[%l7 + %l4]
	nop
	set	0x48, %g2
	std	%f18,	[%l7 + %g2]
	nop
	set	0x0C, %g7
	lduw	[%l7 + %g7],	%o4
	nop
	set	0x68, %o3
	ldsh	[%l7 + %o3],	%i6
	ld	[%l7 + 0x28],	%f19
	nop
	set	0x6A, %i1
	ldub	[%l7 + %i1],	%g1
	set	0x70, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i1
	nop
	set	0x66, %o0
	stb	%i2,	[%l7 + %o0]
	set	0x18, %l5
	stxa	%i4,	[%l7 + %l5] 0x81
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f16
	nop
	set	0x28, %g4
	ldsb	[%l7 + %g4],	%l2
	nop
	set	0x38, %i4
	ldstub	[%l7 + %i4],	%l3
	fpadd32	%f0,	%f28,	%f28
	or	%i5,	%i7,	%l5
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%g6
	set	0x70, %l2
	stda	%l0,	[%l7 + %l2] 0xe2
	membar	#Sync
	bleu,a	%icc,	loop_6
	nop
	set	0x38, %g1
	stx	%o2,	[%l7 + %g1]
	nop
	set	0x3A, %i6
	lduh	[%l7 + %i6],	%g2
	nop
	set	0x40, %l0
	stx	%i3,	[%l7 + %l0]
loop_6:
	nop
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f16
	nop
	nop
	setx	0xDAC54D20F397366A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x7735B779093FAB46,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f28
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%o6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%g6
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x81,	%l1
	nop
	set	0x20, %i7
	std	%g4,	[%l7 + %i7]
	or	%o1,	%o7,	%o0
	nop
	set	0x38, %g5
	stw	%l6,	[%l7 + %g5]
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x81,	 4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xe3,	%g2
	set	0x18, %l3
	stxa	%o5,	[%l7 + %l3] 0x80
	set	0x7F, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o4
	nop
	set	0x4D, %o6
	ldstub	[%l7 + %o6],	%i6
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%f13,	[%l7 + 0x14]
	set	0x34, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g1
	add	%l4,	%i1,	%i2
	nop
	set	0x2E, %o4
	ldsh	[%l7 + %o4],	%i4
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%l2
	bge,a	%icc,	loop_7
	ld	[%l7 + 0x4C],	%f4
	nop
	set	0x70, %g2
	ldx	[%l7 + %g2],	%i5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f16
loop_7:
	bge,a	%xcc,	loop_8
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f18
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x89,	 2
loop_8:
	nop
	set	0x24, %i1
	ldsb	[%l7 + %i1],	%i7
	set	0x3B, %o1
	stba	%l5,	[%l7 + %o1] 0xe3
	membar	#Sync
	st	%f18,	[%l7 + 0x70]
	set	0x73, %l5
	stba	%l0,	[%l7 + %l5] 0x88
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x67, %i2
	ldub	[%l7 + %i2],	%o2
	nop
	set	0x0E, %o0
	stb	%g7,	[%l7 + %o0]
	st	%f14,	[%l7 + 0x78]
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x81,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%g5
	nop
	set	0x4C, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x74, %i4
	ldub	[%l7 + %i4],	%i0
	st	%f29,	[%l7 + 0x34]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f16
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f26
	nop
	set	0x4D, %l0
	stb	%g6,	[%l7 + %l0]
	set	0x1A, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o6
	nop
	set	0x50, %i0
	swap	[%l7 + %i0],	%g4
	nop
	set	0x48, %i3
	stw	%o1,	[%l7 + %i3]
	nop
	set	0x25, %i7
	ldstub	[%l7 + %i7],	%l1
	nop
	set	0x18, %o2
	stx	%o0,	[%l7 + %o2]
	nop
	set	0x0C, %o7
	ldsh	[%l7 + %o7],	%l6
	set	0x6A, %g5
	stha	%o3,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x76, %l1
	ldub	[%l7 + %l1],	%o7
	fpadd32	%f24,	%f8,	%f30
	nop
	set	0x20, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x28, %o6
	ldsw	[%l7 + %o6],	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x89,	%i6
	nop
	set	0x1C, %g6
	stw	%l4,	[%l7 + %g6]
	set	0x0C, %g3
	sta	%f29,	[%l7 + %g3] 0x80
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x88,	%g0
	nop
	set	0x26, %g2
	lduh	[%l7 + %g2],	%i1
	set	0x70, %l6
	stba	%i2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%l3
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xea,	%i4
	nop
	set	0x0A, %l4
	stb	%l2,	[%l7 + %l4]
	nop
	set	0x2B, %o1
	ldub	[%l7 + %o1],	%i5
	or	%i7,	%l5,	%o2
	nop
	set	0x58, %i1
	lduw	[%l7 + %i1],	%l0
	set	0x5C, %l5
	stha	%i3,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x79, %o0
	ldsb	[%l7 + %o0],	%g7
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x80,	%g2
	fpsub16s	%f29,	%f20,	%f20
	fpadd32s	%f30,	%f0,	%f30
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f10
	set	0x78, %i5
	stxa	%i0,	[%l7 + %i5] 0xe2
	membar	#Sync
	and	%g5,	%g6,	%o6
	wr	%o1,	%l1,	%set_softint
	or	%o0,	%l6,	%o3
	nop
	set	0x10, %g1
	std	%o6,	[%l7 + %g1]
	nop
	set	0x69, %i4
	ldsb	[%l7 + %i4],	%o5
	st	%fsr,	[%l7 + 0x08]
	fpsub32s	%f22,	%f27,	%f19
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xeb,	%g2
	set	0x33, %i6
	stba	%o4,	[%l7 + %i6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x28],	%f26
	nop
	set	0x38, %l2
	swap	[%l7 + %l2],	%g4
	set	0x2C, %i3
	swapa	[%l7 + %i3] 0x89,	%l4
	set	0x58, %i0
	stwa	%g1,	[%l7 + %i0] 0x80
	wr	%i1,	%i2,	%set_softint
	set	0x70, %o2
	stxa	%i6,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x4E, %i7
	ldsh	[%l7 + %i7],	%l3
	nop
	set	0x5C, %g5
	lduw	[%l7 + %g5],	%l2
	nop
	set	0x3C, %l1
	swap	[%l7 + %l1],	%i5
	nop
	set	0x38, %o7
	ldstub	[%l7 + %o7],	%i7
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x80,	%i4
	add	%l5,	%l0,	%o2
	add	%i3,	%g7,	%g2
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x89,	 2
	nop
	set	0x08, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%i0
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%o1
	set	0x74, %l6
	lda	[%l7 + %l6] 0x89,	%f27
	nop
	set	0x78, %g2
	std	%f30,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x1C]
	ld	[%l7 + 0x50],	%f14
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x88
	set	0x78, %g7
	stda	%o0,	[%l7 + %g7] 0x88
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x80,	 3
	nop
	set	0x4F, %o1
	stb	%o3,	[%l7 + %o1]
	ba,a,pn	%xcc,	loop_9
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%l6
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%o7
	nop
	set	0x6E, %i2
	stb	%o5,	[%l7 + %i2]
loop_9:
	nop
	set	0x78, %g4
	std	%o4,	[%l7 + %g4]
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x6E, %g1
	ldsh	[%l7 + %g1],	%g3
	nop
	set	0x48, %i4
	swap	[%l7 + %i4],	%l4
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc4
	nop
	set	0x54, %i6
	prefetch	[%l7 + %i6],	 1
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x78, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%g1
	nop
	set	0x2F, %i3
	ldub	[%l7 + %i3],	%i1
	nop
	set	0x15, %l2
	ldub	[%l7 + %l2],	%i2
	set	0x20, %o2
	stda	%l2,	[%l7 + %o2] 0x88
	st	%fsr,	[%l7 + 0x78]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%l2
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xcc
	set	0x52, %i0
	stha	%i5,	[%l7 + %i0] 0x89
	set	0x64, %o7
	sta	%f10,	[%l7 + %o7] 0x80
	nop
	set	0x28, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x58, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x80,	 4
	set	0x20, %g6
	stwa	%i4,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x17, %l1
	ldub	[%l7 + %l1],	%l0
	set	0x28, %o4
	stwa	%i3,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x08, %g3
	stwa	%g7,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x54, %g2
	stw	%o2,	[%l7 + %g2]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x80
	set	0x20, %o3
	stxa	%g2,	[%l7 + %o3] 0x80
	or	%g5,	%o6,	%i0
	st	%fsr,	[%l7 + 0x44]
	set	0x28, %l4
	stwa	%g6,	[%l7 + %l4] 0x81
	nop
	set	0x1C, %g7
	ldsw	[%l7 + %g7],	%o1
	add	%o0,	%o3,	%l1
	add	%o7,	%o5,	%l6
	nop
	set	0x0D, %l5
	stb	%g3,	[%l7 + %l5]
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%l4
	add	%g1,	%i1,	%g4
	nop
	set	0x5D, %i2
	stb	%i2,	[%l7 + %i2]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%l2
	nop
	set	0x46, %g4
	ldsh	[%l7 + %g4],	%i5
	nop
	set	0x49, %o1
	ldsb	[%l7 + %o1],	%l3
	set	0x3C, %g1
	sta	%f10,	[%l7 + %g1] 0x80
	set	0x44, %o0
	lda	[%l7 + %o0] 0x89,	%f17
	nop
	set	0x36, %i5
	ldsh	[%l7 + %i5],	%i7
	nop
	set	0x52, %i6
	stb	%l5,	[%l7 + %i6]
	set	0x58, %l0
	sta	%f29,	[%l7 + %l0] 0x88
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%l0
	fpadd32	%f10,	%f24,	%f12
	nop
	set	0x10, %l2
	swap	[%l7 + %l2],	%i3
	nop
	set	0x58, %o2
	stx	%g7,	[%l7 + %o2]
	nop
	set	0x56, %i7
	stb	%o2,	[%l7 + %i7]
	set	0x10, %g5
	stxa	%i4,	[%l7 + %g5] 0x89
	nop
	set	0x38, %i4
	std	%g4,	[%l7 + %i4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f16
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	nop
	set	0x20, %o7
	lduh	[%l7 + %o7],	%g2
	nop
	set	0x6C, %o5
	stw	%o6,	[%l7 + %o5]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd8
	add	%g6,	%i0,	%o1
	nop
	set	0x08, %g6
	ldsh	[%l7 + %g6],	%o3
	nop
	set	0x50, %l1
	ldstub	[%l7 + %l1],	%l1
	set	0x0F, %g3
	stba	%o7,	[%l7 + %g3] 0x80
	nop
	set	0x10, %o4
	sth	%o5,	[%l7 + %o4]
	and	%l6,	%g3,	%o4
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xea,	%l4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	nop
	set	0x60, %l4
	swap	[%l7 + %l4],	%g1
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	st	%f0,	[%l7 + 0x7C]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%o0
	set	0x0C, %l5
	lda	[%l7 + %l5] 0x89,	%f9
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f14
	nop
	nop
	setx	0x51EF1B19,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xD03F332A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f21,	%f2
	add	%i6,	%l2,	%i2
	nop
	set	0x40, %i1
	ldub	[%l7 + %i1],	%l3
	nop
	set	0x18, %g4
	std	%i6,	[%l7 + %g4]
	set	0x56, %i2
	stha	%l5,	[%l7 + %i2] 0x88
	set	0x2A, %g1
	stha	%i5,	[%l7 + %g1] 0x81
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x74, %o0
	stha	%i3,	[%l7 + %o0] 0xea
	membar	#Sync
	ld	[%l7 + 0x30],	%f12
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%g7
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f22
	set	0x7B, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l0
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%i4
	nop
	set	0x48, %i3
	ldx	[%l7 + %i3],	%g5
	or	%o2,	%o6,	%g2
	set	0x08, %i7
	lda	[%l7 + %i7] 0x89,	%f30
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x88,	%g6
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x68, %i4
	prefetch	[%l7 + %i4],	 1
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x88,	%o1
	nop
	set	0x7A, %o6
	sth	%o3,	[%l7 + %o6]
	nop
	set	0x08, %o7
	stx	%l1,	[%l7 + %o7]
	nop
	set	0x27, %o5
	stb	%i0,	[%l7 + %o5]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	and	%o7,	%l6,	%g3
	nop
	nop
	setx	0xC827550717A8455B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x3CE7A49F367AD05D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f6,	%f24
	set	0x58, %g6
	stxa	%o5,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x08, %g5
	stx	%l4,	[%l7 + %g5]
	nop
	set	0x49, %g3
	stb	%o4,	[%l7 + %g3]
	st	%f14,	[%l7 + 0x14]
	set	0x54, %l1
	stha	%g1,	[%l7 + %l1] 0xe2
	membar	#Sync
	or	%i1,	%g4,	%o0
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x89,	 4
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x4E, %l6
	lduh	[%l7 + %l6],	%i2
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%l3
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%l2
	set	0x40, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i7
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x89,	 3
	fpsub16	%f18,	%f20,	%f26
	ld	[%l7 + 0x68],	%f24
	set	0x48, %i1
	lda	[%l7 + %i1] 0x88,	%f22
	nop
	set	0x39, %g7
	ldub	[%l7 + %g7],	%i3
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x89,	%l5
	nop
	set	0x15, %i2
	ldstub	[%l7 + %i2],	%l0
	set	0x3C, %g1
	swapa	[%l7 + %g1] 0x81,	%i4
	set	0x5C, %o1
	stha	%g5,	[%l7 + %o1] 0x81
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%g7
	set	0x31, %i6
	stba	%o6,	[%l7 + %i6] 0x80
	set	0x4C, %l0
	sta	%f13,	[%l7 + %l0] 0x89
	nop
	set	0x38, %l2
	stw	%g2,	[%l7 + %l2]
	add	%o2,	%o1,	%o3
	nop
	set	0x20, %i3
	stw	%l1,	[%l7 + %i3]
	nop
	set	0x0E, %i7
	sth	%i0,	[%l7 + %i7]
	nop
	set	0x7B, %i5
	ldub	[%l7 + %i5],	%g6
	st	%f16,	[%l7 + 0x10]
	nop
	set	0x38, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f4
	nop
	set	0x14, %o6
	ldsw	[%l7 + %o6],	%l6
	fpadd16s	%f4,	%f18,	%f17
	set	0x78, %o2
	swapa	[%l7 + %o2] 0x80,	%o7
	nop
	set	0x30, %o5
	std	%f12,	[%l7 + %o5]
	nop
	set	0x16, %l3
	ldsh	[%l7 + %l3],	%g3
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x88,	%l4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%o4
	set	0x20, %g5
	stxa	%i1,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%g4,	%g1,	%i6
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%i2,	%l3,	%o0
	nop
	set	0x08, %l1
	stx	%i7,	[%l7 + %l1]
	wr	%l2,	%i3,	%softint
	nop
	set	0x58, %o4
	ldsh	[%l7 + %o4],	%i5
	set	0x28, %g3
	prefetcha	[%l7 + %g3] 0x80,	 2
	nop
	set	0x66, %l6
	ldstub	[%l7 + %l6],	%l5
	nop
	set	0x5D, %l4
	stb	%g5,	[%l7 + %l4]
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
	ld	[%l7 + 0x70],	%f17
	set	0x38, %g2
	stda	%o6,	[%l7 + %g2] 0x88
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x81,	 2
	add	%o2,	%g2,	%o1
	nop
	set	0x78, %g7
	std	%l0,	[%l7 + %g7]
	nop
	set	0x77, %l5
	stb	%i0,	[%l7 + %l5]
	nop
	set	0x32, %i2
	sth	%g6,	[%l7 + %i2]
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%l6
	set	0x48, %o1
	stba	%o7,	[%l7 + %o1] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%l4
	set	0x44, %g4
	swapa	[%l7 + %g4] 0x89,	%o5
	nop
	set	0x3A, %o0
	sth	%o4,	[%l7 + %o0]
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	nop
	set	0x70, %l2
	ldsh	[%l7 + %l2],	%g4
	nop
	set	0x08, %i3
	ldsb	[%l7 + %i3],	%g1
	set	0x28, %i7
	swapa	[%l7 + %i7] 0x80,	%i1
	nop
	set	0x50, %i5
	swap	[%l7 + %i5],	%i2
	bgu	%icc,	loop_10
	nop
	set	0x3E, %i4
	ldsb	[%l7 + %i4],	%l3
	set	0x57, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i6
loop_10:
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x30, %i0
	stw	%i7,	[%l7 + %i0]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%o0
	set	0x50, %o2
	sta	%f22,	[%l7 + %o2] 0x88
	set	0x18, %o5
	stwa	%i5,	[%l7 + %o5] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%i3
	set	0x4C, %l3
	stha	%l5,	[%l7 + %l3] 0x80
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x88
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x80,	%g4
	nop
	set	0x38, %o7
	stb	%g7,	[%l7 + %o7]
	and	%o6,	%o2,	%g2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o1
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%i0
	nop
	nop
	setx	0x7843F1AF16BB65C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0BAC49D18CE596E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f0,	%f22
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%l1
	st	%fsr,	[%l7 + 0x20]
	set	0x2C, %o4
	sta	%f16,	[%l7 + %o4] 0x80
	or	%l6,	%g6,	%g3
	nop
	set	0x2C, %l6
	ldsw	[%l7 + %l6],	%o7
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f16
	ld	[%l7 + 0x14],	%f23
	add	%l4,	%o4,	%o5
	nop
	set	0x70, %o3
	std	%o2,	[%l7 + %o3]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xeb,	%g4
	set	0x38, %i1
	stha	%g1,	[%l7 + %i1] 0xea
	membar	#Sync
	ld	[%l7 + 0x28],	%f26
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%i2
	set	0x60, %i2
	stxa	%i1,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x81,	%l2
	bne,a	%xcc,	loop_11
	nop
	set	0x08, %o1
	std	%i6,	[%l7 + %o1]
	nop
	set	0x4E, %g1
	ldsh	[%l7 + %g1],	%i7
	nop
	set	0x28, %o0
	std	%f22,	[%l7 + %o0]
loop_11:
	nop
	set	0x29, %l0
	ldub	[%l7 + %l0],	%o0
	nop
	set	0x74, %l2
	stw	%l2,	[%l7 + %l2]
	set	0x4C, %i3
	stwa	%l0,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x70, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x18, %i5
	stda	%i4,	[%l7 + %i5] 0x88
	fpadd32	%f0,	%f20,	%f6
	set	0x62, %i4
	stba	%i3,	[%l7 + %i4] 0x81
	nop
	set	0x42, %g4
	stb	%l5,	[%l7 + %g4]
	and	%g5,	%g7,	%o2
	nop
	set	0x62, %i0
	sth	%g2,	[%l7 + %i0]
	fpsub16s	%f8,	%f31,	%f23
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x80,	%i4
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f12
	nop
	set	0x71, %o5
	ldstub	[%l7 + %o5],	%o6
	set	0x4D, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i0
	set	0x28, %g6
	stba	%o1,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x44, %o7
	prefetch	[%l7 + %o7],	 3
	st	%f4,	[%l7 + 0x60]
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%l0
	nop
	set	0x50, %g5
	ldsb	[%l7 + %g5],	%g6
	add	%l6,	%o7,	%l4
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%o4
	nop
	set	0x45, %l1
	ldsb	[%l7 + %l1],	%g3
	nop
	set	0x5C, %l6
	prefetch	[%l7 + %l6],	 1
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x80,	%o4
	nop
	set	0x60, %g3
	stx	%g4,	[%l7 + %g3]
	st	%f3,	[%l7 + 0x24]
	set	0x28, %l4
	stha	%g1,	[%l7 + %l4] 0x80
	st	%f29,	[%l7 + 0x44]
	or	%o3,	%i1,	%i2
	nop
	set	0x48, %g2
	stx	%i6,	[%l7 + %g2]
	nop
	set	0x48, %l5
	std	%l2,	[%l7 + %l5]
	nop
	set	0x43, %i1
	ldsb	[%l7 + %i1],	%o0
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc8
	bg,a	%xcc,	loop_12
	add	%i7,	%l2,	%i5
	add	%i3,	%l5,	%g5
	nop
	set	0x56, %o1
	stb	%l0,	[%l7 + %o1]
loop_12:
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x4C, %g1
	stw	%o2,	[%l7 + %g1]
	st	%f20,	[%l7 + 0x4C]
	bne	%icc,	loop_13
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%g2
	or	%i4,	%o6,	%i0
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%o0
loop_13:
	nop
	set	0x5C, %o0
	sta	%f22,	[%l7 + %o0] 0x88
	nop
	set	0x2A, %i3
	ldsh	[%l7 + %i3],	%g7
	set	0x4C, %i7
	stwa	%g6,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x68, %i5
	stxa	%l6,	[%l7 + %i5] 0x80
	set	0x34, %i4
	swapa	[%l7 + %i4] 0x81,	%l1
	nop
	set	0x24, %g4
	swap	[%l7 + %g4],	%o7
	ble,a	%icc,	loop_14
	ld	[%l7 + 0x6C],	%f29
	set	0x08, %i0
	stda	%l4,	[%l7 + %i0] 0xea
	membar	#Sync
loop_14:
	nop
	set	0x60, %i6
	std	%f24,	[%l7 + %i6]
	st	%f23,	[%l7 + 0x60]
	nop
	set	0x4B, %o2
	ldstub	[%l7 + %o2],	%g3
	nop
	set	0x5E, %o5
	ldsh	[%l7 + %o5],	%o4
	nop
	set	0x34, %l3
	lduh	[%l7 + %l3],	%g4
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x6A, %o7
	stb	%g1,	[%l7 + %o7]
	set	0x30, %o6
	stxa	%o3,	[%l7 + %o6] 0x81
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xe2,	%i0
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x89,	%i2
	set	0x6C, %l1
	ldstuba	[%l7 + %l1] 0x89,	%i6
	ld	[%l7 + 0x54],	%f24
	nop
	set	0x78, %o4
	stb	%o5,	[%l7 + %o4]
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%l3
	nop
	set	0x38, %o3
	ldsb	[%l7 + %o3],	%i7
	set	0x78, %g3
	stba	%o0,	[%l7 + %g3] 0x89
	set	0x48, %l4
	stxa	%i5,	[%l7 + %l4] 0x80
	ba,pt	%icc,	loop_15
	nop
	set	0x70, %g2
	stx	%l2,	[%l7 + %g2]
	nop
	set	0x11, %i1
	ldub	[%l7 + %i1],	%i3
	fpsub16s	%f31,	%f14,	%f12
loop_15:
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%g5
	set	0x0C, %o1
	swapa	[%l7 + %o1] 0x81,	%l0
	set	0x60, %g1
	ldda	[%l7 + %g1] 0xea,	%l4
	nop
	set	0x32, %i2
	ldsh	[%l7 + %i2],	%g2
	st	%f9,	[%l7 + 0x14]
	nop
	set	0x4D, %l0
	ldstub	[%l7 + %l0],	%i4
	be,a	%icc,	loop_16
	nop
	set	0x3C, %o0
	stw	%o2,	[%l7 + %o0]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%o1
loop_16:
	nop
	set	0x30, %g7
	stx	%i0,	[%l7 + %g7]
	nop
	set	0x54, %i7
	ldsb	[%l7 + %i7],	%g6
	add	%l6,	%l1,	%o7
	set	0x60, %i5
	stwa	%l4,	[%l7 + %i5] 0xea
	membar	#Sync
	fpsub32s	%f31,	%f17,	%f18
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 0
	set	0x14, %i3
	stwa	%g3,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x6F, %i0
	stb	%o4,	[%l7 + %i0]
	nop
	set	0x64, %i6
	lduw	[%l7 + %i6],	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%g4
	nop
	set	0x3C, %o2
	sth	%o3,	[%l7 + %o2]
	nop
	set	0x5F, %o5
	ldstub	[%l7 + %o5],	%i2
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%o5
	set	0x32, %g4
	ldstuba	[%l7 + %g4] 0x89,	%l3
	wr	%i1,	%i7,	%clear_softint
	set	0x48, %g6
	stha	%o0,	[%l7 + %g6] 0x89
	nop
	set	0x30, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x80,	%f9
	nop
	set	0x41, %o7
	ldub	[%l7 + %o7],	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%g5
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%l2
	nop
	set	0x1D, %l1
	stb	%l0,	[%l7 + %l1]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%g2
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f2
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x88,	%i4
	set	0x08, %g3
	stxa	%o2,	[%l7 + %g3] 0x88
	set	0x28, %l4
	ldstuba	[%l7 + %l4] 0x88,	%l5
	nop
	set	0x5C, %i1
	swap	[%l7 + %i1],	%o1
	nop
	set	0x44, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x08, %o1
	stwa	%l6,	[%l7 + %o1] 0x89
	set	0x1A, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g6
	set	0x56, %g2
	stha	%o7,	[%l7 + %g2] 0x89
	set	0x20, %l0
	stxa	%l4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x78, %i2
	lduw	[%l7 + %i2],	%l1
	fpsub16s	%f4,	%f8,	%f21
	nop
	set	0x2C, %g7
	lduh	[%l7 + %g7],	%g3
	set	0x28, %i7
	swapa	[%l7 + %i7] 0x81,	%g7
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x08, %o0
	ldsw	[%l7 + %o0],	%o4
	nop
	set	0x40, %i5
	stx	%g4,	[%l7 + %i5]
	set	0x14, %i3
	swapa	[%l7 + %i3] 0x81,	%o3
	set	0x28, %i0
	stwa	%g1,	[%l7 + %i0] 0x89
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%o5
	nop
	set	0x54, %o2
	stw	%l3,	[%l7 + %o2]
	nop
	set	0x7C, %g4
	ldsw	[%l7 + %g4],	%i1
	set	0x68, %o5
	stda	%i6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x10, %l3
	stx	%o0,	[%l7 + %l3]
	set	0x78, %g6
	stxa	%i5,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x38, %o7
	ldub	[%l7 + %o7],	%i3
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%l2
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%l0
	nop
	set	0x20, %l2
	stx	%i4,	[%l7 + %l2]
	nop
	set	0x21, %l1
	ldub	[%l7 + %l1],	%g2
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
	add	%o1,	%o6,	%i0
	nop
	set	0x42, %o3
	lduh	[%l7 + %o3],	%l6
	ld	[%l7 + 0x60],	%f18
	and	%o2,	%o7,	%l4
	nop
	set	0x41, %g3
	ldsb	[%l7 + %g3],	%l1
	set	0x20, %l6
	stha	%g6,	[%l7 + %l6] 0xe3
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%o4
	set	0x40, %l4
	stwa	%g7,	[%l7 + %l4] 0xea
	membar	#Sync
	ble,a	%xcc,	loop_17
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%g4
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%f10
	set	0x17, %g1
	stba	%g1,	[%l7 + %g1] 0xeb
	membar	#Sync
loop_17:
	nop
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f0
	nop
	set	0x40, %o1
	stx	%o3,	[%l7 + %o1]
	nop
	set	0x4D, %l0
	ldstub	[%l7 + %l0],	%i6
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x88,	%i2
	nop
	set	0x38, %i2
	stw	%o5,	[%l7 + %i2]
	nop
	nop
	setx	0x25EBF7EA8798E3F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x70028C795560B335,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f10,	%f16
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x5F, %i7
	ldstub	[%l7 + %i7],	%i1
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x88,	%i4
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%i3
	set	0x58, %i3
	stda	%o0,	[%l7 + %i3] 0x88
	or	%g5,	%l0,	%l2
	set	0x38, %i0
	stwa	%i4,	[%l7 + %i0] 0x88
	nop
	set	0x73, %i4
	stb	%g2,	[%l7 + %i4]
	nop
	set	0x4C, %i6
	ldsw	[%l7 + %i6],	%l5
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%o6
	ld	[%l7 + 0x54],	%f8
	and	%i0,	%l6,	%o2
	st	%f1,	[%l7 + 0x18]
	nop
	set	0x74, %g4
	stw	%o7,	[%l7 + %g4]
	add	%o1,	%l4,	%l1
	add	%g6,	%g3,	%g7
	nop
	set	0x68, %l3
	std	%g4,	[%l7 + %l3]
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%g1
	set	0x60, %g6
	swapa	[%l7 + %g6] 0x89,	%o4
	nop
	set	0x30, %g5
	stb	%o3,	[%l7 + %g5]
	nop
	set	0x1C, %o6
	ldsw	[%l7 + %o6],	%i2
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%o5
	set	0x75, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l3
	set	0x50, %l1
	swapa	[%l7 + %l1] 0x89,	%i6
	nop
	set	0x7F, %o4
	stb	%i7,	[%l7 + %o4]
	nop
	set	0x57, %g3
	stb	%i1,	[%l7 + %g3]
	set	0x78, %o3
	stxa	%i3,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x32, %l4
	ldub	[%l7 + %l4],	%i5
	nop
	set	0x50, %l5
	ldsw	[%l7 + %l5],	%g5
	set	0x18, %l6
	lda	[%l7 + %l6] 0x89,	%f1
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%l0
	and	%o0,	%i4,	%g2
	set	0x4C, %g2
	stha	%l5,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x74, %i1
	swap	[%l7 + %i1],	%o6
	add	%i0,	%l6,	%l2
	set	0x60, %l0
	sta	%f5,	[%l7 + %l0] 0x89
	nop
	set	0x68, %g7
	stx	%o7,	[%l7 + %g7]
	nop
	set	0x70, %o1
	std	%f18,	[%l7 + %o1]
	nop
	set	0x55, %i7
	ldsb	[%l7 + %i7],	%o2
	nop
	set	0x30, %o0
	std	%f2,	[%l7 + %o0]
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x89,	%l4
	bgu	%icc,	loop_18
	nop
	set	0x0E, %i5
	ldsh	[%l7 + %i5],	%l1
	nop
	set	0x38, %i0
	stx	%g6,	[%l7 + %i0]
	nop
	set	0x0D, %i4
	ldstub	[%l7 + %i4],	%g3
loop_18:
	and	%o1,	%g7,	%g4
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%g1
	set	0x50, %i3
	stda	%o4,	[%l7 + %i3] 0x81
	nop
	set	0x28, %g4
	ldstub	[%l7 + %g4],	%o3
	nop
	set	0x50, %o2
	std	%o4,	[%l7 + %o2]
	set	0x77, %o5
	ldstuba	[%l7 + %o5] 0x80,	%i2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%i7
	nop
	set	0x10, %g6
	swap	[%l7 + %g6],	%i6
	nop
	set	0x20, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x71, %o6
	ldsb	[%l7 + %o6],	%i1
	nop
	set	0x6C, %g5
	stw	%i5,	[%l7 + %g5]
	ld	[%l7 + 0x60],	%f26
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x80,	 1
	fpadd32s	%f15,	%f16,	%f15
	nop
	set	0x7D, %l1
	ldstub	[%l7 + %l1],	%l0
	set	0x4A, %o4
	stha	%o0,	[%l7 + %o4] 0x80
	set	0x1C, %l2
	swapa	[%l7 + %l2] 0x88,	%i4
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x89,	%f9
	nop
	set	0x6C, %l4
	sth	%g2,	[%l7 + %l4]
	wr 	%g0, 	0x6, 	%fprs
	st	%f6,	[%l7 + 0x50]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x60, %l5
	stx	%l2,	[%l7 + %l5]
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%l6
	bl,a	%icc,	loop_19
	nop
	set	0x31, %g3
	ldsb	[%l7 + %g3],	%o2
	bge,a,pn	%icc,	loop_20
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%o7
loop_19:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g6
loop_20:
	and	%l1,	%g3,	%g7
	ld	[%l7 + 0x10],	%f14
	nop
	set	0x28, %i1
	stw	%g4,	[%l7 + %i1]
	nop
	set	0x5E, %g1
	stb	%o1,	[%l7 + %g1]
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%g1
	nop
	nop
	setx	0x85ACCEC70A46A41D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x43FB756B70675288,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f12,	%f10
	nop
	set	0x52, %g7
	stb	%o3,	[%l7 + %g7]
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o4
	st	%f2,	[%l7 + 0x38]
	nop
	set	0x33, %o1
	stb	%o5,	[%l7 + %o1]
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x80,	%l2
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	nop
	set	0x48, %i5
	stx	%i7,	[%l7 + %i5]
	set	0x56, %i4
	stba	%i1,	[%l7 + %i4] 0x80
	set	0x4C, %i6
	stha	%i6,	[%l7 + %i6] 0x80
	set	0x38, %i0
	stda	%g4,	[%l7 + %i0] 0x81
	or	%i5,	%l0,	%o0
	set	0x10, %g4
	stxa	%i4,	[%l7 + %g4] 0x89
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x81,	%l5
	st	%fsr,	[%l7 + 0x20]
	set	0x70, %i3
	stda	%o6,	[%l7 + %i3] 0xe3
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%i0
	ld	[%l7 + 0x4C],	%f31
	set	0x36, %g6
	stha	%l2,	[%l7 + %g6] 0x81
	bleu,a	%xcc,	loop_21
	nop
	set	0x42, %o5
	lduh	[%l7 + %o5],	%l6
	set	0x4E, %l3
	ldstuba	[%l7 + %l3] 0x88,	%g2
loop_21:
	and	%o7,	%o2,	%g6
	nop
	set	0x28, %o6
	std	%f14,	[%l7 + %o6]
	set	0x58, %g5
	sta	%f8,	[%l7 + %g5] 0x88
	set	0x33, %l1
	stba	%l4,	[%l7 + %l1] 0x88
	wr	%g3,	%l1,	%ccr
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f2
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x4C, %o4
	swap	[%l7 + %o4],	%o1
	nop
	set	0x4F, %l4
	ldub	[%l7 + %l4],	%g4
	wr	%g1,	%o3,	%ccr
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l3
	nop
	set	0x58, %o3
	std	%i2,	[%l7 + %o3]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%o4
	nop
	set	0x60, %l6
	ldsb	[%l7 + %l6],	%i6
	fpsub16	%f12,	%f14,	%f22
	nop
	set	0x1C, %g3
	lduw	[%l7 + %g3],	%i1
	nop
	set	0x20, %g2
	std	%f24,	[%l7 + %g2]
	and	%i5,	%l0,	%g5
	set	0x49, %l5
	stba	%o0,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x10, %g1
	std	%f30,	[%l7 + %g1]
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x88,	%i4
	and	%i3,	%o6,	%l2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf0
	membar	#Sync
	set	0x22, %o1
	stha	%l6,	[%l7 + %o1] 0x81
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%i0
	nop
	set	0x7E, %i2
	lduh	[%l7 + %i2],	%g2
	set	0x40, %i7
	sta	%f31,	[%l7 + %i7] 0x89
	nop
	set	0x72, %i4
	ldstub	[%l7 + %i4],	%o2
	nop
	set	0x3C, %i5
	swap	[%l7 + %i5],	%o7
	set	0x38, %i0
	stwa	%g6,	[%l7 + %i0] 0x89
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f26
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x4E, %i3
	ldsh	[%l7 + %i3],	%g3
	set	0x24, %g4
	lda	[%l7 + %g4] 0x88,	%f19
	and	%l1,	%l4,	%g7
	nop
	set	0x66, %o5
	ldstub	[%l7 + %o5],	%g4
	st	%fsr,	[%l7 + 0x48]
	set	0x17, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g1
	set	0x0A, %o6
	stha	%o3,	[%l7 + %o6] 0x80
	nop
	set	0x30, %g5
	stw	%o5,	[%l7 + %g5]
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x89,	%f13
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x7C, %l3
	stw	%o1,	[%l7 + %l3]
	set	0x60, %l2
	stxa	%l3,	[%l7 + %l2] 0x88
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x80,	%o4
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xe3,	%i2
	nop
	set	0x24, %g3
	ldsb	[%l7 + %g3],	%i1
	set	0x2C, %g2
	sta	%f12,	[%l7 + %g2] 0x89
	nop
	set	0x68, %o4
	stx	%i5,	[%l7 + %o4]
	nop
	set	0x10, %l5
	lduw	[%l7 + %l5],	%i6
	nop
	set	0x3C, %g1
	lduh	[%l7 + %g1],	%l0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f16
	ld	[%l7 + 0x14],	%f8
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f16
	nop
	set	0x0C, %i1
	ldsb	[%l7 + %i1],	%g5
	and	%o0,	%l5,	%i3
	st	%f10,	[%l7 + 0x28]
	ld	[%l7 + 0x1C],	%f12
	nop
	set	0x70, %o1
	std	%f0,	[%l7 + %o1]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf0
	membar	#Sync
	set	0x78, %i2
	stxa	%i4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x38, %i7
	std	%o6,	[%l7 + %i7]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%l6
	nop
	set	0x4E, %i4
	ldsh	[%l7 + %i4],	%i0
	or	%o2,	%o7,	%g2
	add	%g3,	%l1,	%g6
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f24
	nop
	set	0x38, %o2
	stx	%g7,	[%l7 + %o2]
	nop
	set	0x6C, %i3
	lduw	[%l7 + %i3],	%g4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%o3
	ld	[%l7 + 0x68],	%f11
	nop
	set	0x30, %i0
	stw	%o5,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x24]
	or	%g1,	%o1,	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%i7
	set	0x10, %g4
	sta	%f12,	[%l7 + %g4] 0x89
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%f10,	[%l7 + 0x10]
	nop
	set	0x60, %o6
	ldstub	[%l7 + %o6],	%i1
	set	0x16, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i5
	st	%f27,	[%l7 + 0x28]
	st	%f21,	[%l7 + 0x64]
	nop
	set	0x38, %o5
	ldsb	[%l7 + %o5],	%i6
	fpadd16s	%f11,	%f12,	%f0
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%i2
	add	%g5,	%o0,	%l0
	nop
	set	0x26, %o7
	ldsh	[%l7 + %o7],	%l5
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f0
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%i4
	nop
	set	0x60, %o3
	stx	%o6,	[%l7 + %o3]
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%i3
	nop
	set	0x28, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x7C, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l2
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f14
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f0
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc0
	nop
	set	0x49, %g1
	ldstub	[%l7 + %g1],	%i0
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%f8
	set	0x70, %g7
	stwa	%l6,	[%l7 + %g7] 0x81
	st	%f16,	[%l7 + 0x6C]
	set	0x10, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o7
	set	0x5A, %o0
	stha	%o2,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x11, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g2
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%l1
	set	0x18, %i7
	stxa	%g3,	[%l7 + %i7] 0x88
	add	%g7,	%g4,	%l4
	add	%g6,	%o3,	%o5
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x59, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g1
	nop
	set	0x14, %i4
	sth	%o1,	[%l7 + %i4]
	add	%l3,	%o4,	%i1
	nop
	set	0x38, %i3
	std	%f18,	[%l7 + %i3]
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%i5
	set	0x09, %g4
	stba	%i6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x88,	%i2
	nop
	nop
	setx	0xC4E75038,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x56EA0CEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f16,	%f10
	nop
	set	0x08, %o6
	ldsb	[%l7 + %o6],	%g5
	set	0x1C, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i7
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x70, %o7
	sth	%o0,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f0
	nop
	set	0x6E, %l3
	ldub	[%l7 + %l3],	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%o6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%l2
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f16
	nop
	set	0x24, %o3
	swap	[%l7 + %o3],	%i3
	nop
	set	0x48, %g3
	ldsh	[%l7 + %g3],	%i0
	set	0x40, %l6
	stda	%o6,	[%l7 + %l6] 0x80
	nop
	set	0x20, %l4
	stx	%l6,	[%l7 + %l4]
	nop
	set	0x12, %o4
	lduh	[%l7 + %o4],	%o2
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x5B, %l5
	ldstub	[%l7 + %l5],	%l1
	bleu,pn	%xcc,	loop_22
	nop
	set	0x22, %g2
	lduh	[%l7 + %g2],	%g2
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x12, %g1
	ldsb	[%l7 + %g1],	%g7
loop_22:
	nop
	set	0x54, %g7
	prefetch	[%l7 + %g7],	 0
	ld	[%l7 + 0x54],	%f3
	set	0x60, %l0
	stwa	%g3,	[%l7 + %l0] 0x81
	nop
	set	0x0C, %i1
	lduw	[%l7 + %i1],	%l4
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%g4
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x89,	%g6
	add	%o5,	%g1,	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%o3
	nop
	set	0x24, %i7
	stw	%i1,	[%l7 + %i7]
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x81,	%o4
	nop
	set	0x74, %i6
	swap	[%l7 + %i6],	%i5
	st	%fsr,	[%l7 + 0x20]
	set	0x6C, %o0
	swapa	[%l7 + %o0] 0x80,	%i2
	nop
	set	0x08, %i4
	stx	%g5,	[%l7 + %i4]
	nop
	set	0x5A, %o2
	ldsh	[%l7 + %o2],	%i6
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f26
	nop
	set	0x5A, %g6
	ldsh	[%l7 + %g6],	%o0
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x80,	%f0
	nop
	set	0x28, %i0
	ldsw	[%l7 + %i0],	%l0
	set	0x48, %o5
	stxa	%i4,	[%l7 + %o5] 0x81
	nop
	set	0x11, %i3
	stb	%i7,	[%l7 + %i3]
	wr 	%g0, 	0x4, 	%fprs
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x89
	and	%l2,	%i0,	%i3
	fpsub16s	%f1,	%f15,	%f19
	set	0x6D, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o7
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xe2,	%o2
	nop
	nop
	setx	0xB982A25F08603F97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4BCA06F7DFF2289C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f28,	%f2
	add	%l1,	%l6,	%g2
	set	0x1B, %l2
	stba	%g3,	[%l7 + %l2] 0x88
	set	0x48, %o3
	stda	%g6,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x0C, %g3
	sth	%g4,	[%l7 + %g3]
	set	0x38, %o7
	stda	%g6,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x80,	%l4
	nop
	set	0x6C, %l6
	prefetch	[%l7 + %l6],	 4
	bleu,pt	%icc,	loop_23
	nop
	set	0x0C, %l5
	stw	%g1,	[%l7 + %l5]
	add	%o5,	%l3,	%o1
	nop
	set	0x28, %g2
	std	%i0,	[%l7 + %g2]
loop_23:
	nop
	set	0x26, %o4
	stha	%o4,	[%l7 + %o4] 0x89
	st	%f19,	[%l7 + 0x7C]
	nop
	set	0x7A, %g1
	ldsh	[%l7 + %g1],	%o3
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%i5
	set	0x72, %i1
	stha	%i2,	[%l7 + %i1] 0x81
	nop
	set	0x35, %l0
	ldub	[%l7 + %l0],	%i6
	nop
	set	0x28, %o1
	std	%g4,	[%l7 + %o1]
	add	%o0,	%i4,	%i7
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x80,	%l0
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f22
	ld	[%l7 + 0x70],	%f23
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x80,	%l5
	nop
	set	0x1C, %i6
	lduh	[%l7 + %i6],	%l2
	nop
	set	0x58, %i4
	std	%f6,	[%l7 + %i4]
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xe2,	%i0
	set	0x60, %g4
	stha	%o6,	[%l7 + %g4] 0xeb
	membar	#Sync
	bl	%xcc,	loop_24
	bgu	%icc,	loop_25
	nop
	set	0x78, %o2
	stx	%o7,	[%l7 + %o2]
	set	0x78, %o6
	sta	%f23,	[%l7 + %o6] 0x80
loop_24:
	nop
	set	0x76, %i0
	stha	%i3,	[%l7 + %i0] 0xeb
	membar	#Sync
loop_25:
	nop
	set	0x1C, %o5
	sta	%f30,	[%l7 + %o5] 0x81
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%l6
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%l1
	and	%g2,	%g3,	%g4
	nop
	set	0x6C, %l1
	ldsw	[%l7 + %l1],	%g6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g1
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x3A, %l3
	ldstuba	[%l7 + %l3] 0x80,	%o5
	set	0x28, %l2
	stxa	%l3,	[%l7 + %l2] 0x80
	nop
	set	0x60, %o3
	stx	%o1,	[%l7 + %o3]
	nop
	set	0x1D, %o7
	stb	%g7,	[%l7 + %o7]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%o3
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x81,	%i5
	nop
	set	0x70, %g3
	ldsh	[%l7 + %g3],	%i2
	set	0x20, %l5
	stwa	%i1,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x4C, %o4
	lduh	[%l7 + %o4],	%i6
	nop
	set	0x68, %g2
	ldsw	[%l7 + %g2],	%o0
	add	%g5,	%i4,	%i7
	nop
	set	0x4E, %g1
	ldsh	[%l7 + %g1],	%l5
	set	0x60, %g7
	stwa	%l2,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x40, %i1
	stha	%i0,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x20, %o1
	lduw	[%l7 + %o1],	%l0
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%f26
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f16
	or	%o7,	%o6,	%o2
	st	%f23,	[%l7 + 0x44]
	nop
	set	0x40, %i5
	lduw	[%l7 + %i5],	%l6
	wr	%i3,	%l1,	%sys_tick
	nop
	set	0x2A, %i2
	stb	%g2,	[%l7 + %i2]
	nop
	set	0x58, %i4
	stx	%g4,	[%l7 + %i4]
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%g6
	nop
	set	0x2A, %g4
	ldstub	[%l7 + %g4],	%l4
	nop
	set	0x48, %o0
	std	%f26,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x33, %o2
	stb	%g3,	[%l7 + %o2]
	nop
	set	0x68, %i0
	std	%g0,	[%l7 + %i0]
	or	%l3,	%o5,	%o1
	and	%o4,	%o3,	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%i5
	nop
	set	0x38, %o6
	lduw	[%l7 + %o6],	%i6
	nop
	set	0x28, %g6
	std	%f2,	[%l7 + %g6]
	nop
	set	0x68, %o5
	stx	%i1,	[%l7 + %o5]
	set	0x08, %i3
	stda	%o0,	[%l7 + %i3] 0x88
	nop
	set	0x28, %l1
	stw	%g5,	[%l7 + %l1]
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xeb,	%i6
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x88,	%i4
	nop
	set	0x50, %l2
	std	%l2,	[%l7 + %l2]
	add	%l5,	%l0,	%i0
	set	0x3C, %o7
	stwa	%o7,	[%l7 + %o7] 0x81
	nop
	set	0x74, %o3
	ldsb	[%l7 + %o3],	%o6
	set	0x08, %l6
	stha	%o2,	[%l7 + %l6] 0x81
	and	%l6,	%l1,	%g2
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe3,	%i2
	set	0x18, %g3
	stda	%g4,	[%l7 + %g3] 0x89
	set	0x30, %o4
	stda	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
	ld	[%l7 + 0x70],	%f16
	set	0x50, %g2
	sta	%f22,	[%l7 + %g2] 0x81
	wr 	%g0, 	0x6, 	%fprs
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f16
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o1
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x80,	 1
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f0
	st	%fsr,	[%l7 + 0x6C]
	set	0x1F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o4
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%g7
	set	0x70, %i7
	stba	%o3,	[%l7 + %i7] 0x89
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%i2
	and	%i6,	%i1,	%o0
	nop
	set	0x1E, %i4
	ldub	[%l7 + %i4],	%i5
	set	0x09, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g5
	set	0x50, %g4
	ldda	[%l7 + %g4] 0xe3,	%i4
	set	0x70, %o0
	stxa	%l2,	[%l7 + %o0] 0x89
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%l0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f0
	set	0x2C, %o6
	sta	%f29,	[%l7 + %o6] 0x80
	set	0x79, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i0
	set	0x0C, %o5
	swapa	[%l7 + %o5] 0x89,	%o7
	set	0x6C, %i3
	stha	%i7,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x1C, %l1
	swapa	[%l7 + %l1] 0x88,	%o6
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%o2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xeb,	%l0
	nop
	set	0x78, %g5
	stx	%l6,	[%l7 + %g5]
	nop
	set	0x38, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x7E, %o3
	ldsh	[%l7 + %o3],	%i3
	ld	[%l7 + 0x0C],	%f24
	nop
	set	0x52, %l2
	ldub	[%l7 + %l2],	%g4
	nop
	set	0x60, %l6
	std	%g2,	[%l7 + %l6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%g1
	and	%l4,	%o1,	%l3
	nop
	set	0x16, %l4
	stb	%o4,	[%l7 + %l4]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xeb,	%o4
	set	0x74, %g3
	stha	%g7,	[%l7 + %g3] 0xeb
	membar	#Sync
	and	%i2,	%o3,	%i1
	set	0x78, %g2
	stxa	%o0,	[%l7 + %g2] 0x89
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x88,	%i6
	nop
	set	0x3F, %g1
	ldstub	[%l7 + %g1],	%g5
	nop
	set	0x4A, %i1
	lduh	[%l7 + %i1],	%i5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%l5
	and	%l0,	%i0,	%o7
	set	0x08, %o1
	stda	%l2,	[%l7 + %o1] 0x89
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x88,	%o6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd0
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%i6
	nop
	set	0x10, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0
	st	%f8,	[%l7 + 0x1C]
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x88,	%i6
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%o2
	nop
	set	0x78, %i5
	stx	%i3,	[%l7 + %i5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%g3
	wr	%g6,	%g1,	%sys_tick
	bn	%icc,	loop_26
	nop
	set	0x78, %o6
	stx	%l4,	[%l7 + %o6]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd8
loop_26:
	nop
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x80,	%o1
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x88,	%g4
	nop
	set	0x78, %g6
	sth	%o4,	[%l7 + %g6]
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x4C, %o2
	prefetch	[%l7 + %o2],	 1
	set	0x54, %g5
	swapa	[%l7 + %g5] 0x81,	%g7
	nop
	set	0x78, %o7
	std	%i2,	[%l7 + %o7]
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	nop
	set	0x2C, %l2
	sth	%o3,	[%l7 + %l2]
	nop
	set	0x18, %o3
	std	%f28,	[%l7 + %o3]
	set	0x28, %l4
	stda	%i0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x50, %l6
	lda	[%l7 + %l6] 0x89,	%f6
	add	%o0,	%g5,	%i6
	set	0x58, %g3
	sta	%f20,	[%l7 + %g3] 0x81
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x80,	%i5
	nop
	set	0x34, %l5
	ldsb	[%l7 + %l5],	%l5
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%i4
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x34, %l0
	ldsw	[%l7 + %l0],	%i0
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x81,	%l0
	nop
	set	0x14, %i2
	ldub	[%l7 + %i2],	%l2
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x88
	nop
	set	0x7A, %i7
	ldub	[%l7 + %i7],	%o7
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%i7
	set	0x31, %g4
	stba	%l1,	[%l7 + %g4] 0x89
	set	0x1C, %o0
	stwa	%o6,	[%l7 + %o0] 0x80
	nop
	set	0x10, %i5
	stw	%l6,	[%l7 + %i5]
	nop
	set	0x36, %i0
	ldsb	[%l7 + %i0],	%i3
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	set	0x74, %i3
	stb	%g3,	[%l7 + %i3]
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f12
	fpsub32s	%f26,	%f31,	%f30
	set	0x0B, %l1
	stba	%g6,	[%l7 + %l1] 0x89
	wr	%g1,	%g2,	%pic
	set	0x28, %g6
	stha	%l4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x68, %g5
	stx	%g4,	[%l7 + %g5]
	set	0x36, %o2
	stha	%o4,	[%l7 + %o2] 0x80
	set	0x27, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o1
	set	0x29, %l2
	stba	%o5,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x64, %l3
	ldsw	[%l7 + %l3],	%i2
	nop
	set	0x1C, %l4
	ldub	[%l7 + %l4],	%g7
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%o2
	nop
	set	0x63, %l6
	ldstub	[%l7 + %l6],	%l3
	nop
	set	0x6E, %g3
	ldub	[%l7 + %g3],	%o0
	ble	%xcc,	loop_27
	nop
	set	0x77, %l5
	ldsb	[%l7 + %l5],	%i1
	or	%i6,	%i5,	%g5
	set	0x78, %g7
	sta	%f27,	[%l7 + %g7] 0x88
loop_27:
	nop
	set	0x23, %o4
	ldstub	[%l7 + %o4],	%i4
	nop
	set	0x28, %g2
	ldsw	[%l7 + %g2],	%l5
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%i0
	st	%fsr,	[%l7 + 0x28]
	set	0x7B, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l0
	set	0x1C, %l0
	sta	%f27,	[%l7 + %l0] 0x89
	or	%l2,	%i7,	%l1
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x80,	%o6
	nop
	set	0x68, %i4
	stx	%l6,	[%l7 + %i4]
	and	%o6,	%o2,	%i3
	nop
	set	0x2A, %i7
	ldsh	[%l7 + %i7],	%g3
	bg	%icc,	loop_28
	nop
	nop
	setx	0x2FB2C4943F5144AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x992BFB9CB3896714,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f12
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f6
	and	%g6,	%g2,	%l4
loop_28:
	nop
	set	0x6C, %i6
	swap	[%l7 + %i6],	%g4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g1
	nop
	set	0x14, %o0
	stw	%o5,	[%l7 + %o0]
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0
	nop
	set	0x60, %i0
	stx	%o1,	[%l7 + %i0]
	set	0x70, %o5
	sta	%f16,	[%l7 + %o5] 0x80
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%o3
	nop
	set	0x7C, %g4
	stw	%o0,	[%l7 + %g4]
	add	%i1,	%l3,	%i5
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%g5
	set	0x70, %l1
	stda	%i6,	[%l7 + %l1] 0x88
	wr	%i4,	%l5,	%y
	and	%l0,	%i0,	%i7
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x89,	%l1
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf9
	membar	#Sync
	nop
	set	0x1C, %o2
	ldstub	[%l7 + %o2],	%l2
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x3F, %l2
	stb	%o7,	[%l7 + %l2]
	add	%o6,	%l6,	%i3
	and	%g3,	%o2,	%g6
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f0
	nop
	set	0x08, %l4
	stb	%g2,	[%l7 + %l4]
	and	%l4,	%o4,	%g1
	nop
	set	0x58, %l3
	stx	%o5,	[%l7 + %l3]
	set	0x78, %o3
	stda	%g4,	[%l7 + %o3] 0x88
	set	0x7A, %g3
	stha	%o1,	[%l7 + %g3] 0x81
	set	0x56, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%o0
	nop
	set	0x28, %l6
	std	%f14,	[%l7 + %l6]
	or	%i2,	%i1,	%i5
	nop
	set	0x28, %o4
	ldub	[%l7 + %o4],	%g5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%l2
	nop
	set	0x0C, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x58, %i1
	lduh	[%l7 + %i1],	%i6
	nop
	set	0x28, %l0
	lduh	[%l7 + %l0],	%l5
	nop
	set	0x14, %i2
	lduw	[%l7 + %i2],	%l0
	nop
	set	0x4E, %o1
	ldstub	[%l7 + %o1],	%i4
	nop
	set	0x08, %i7
	std	%f0,	[%l7 + %i7]
	nop
	set	0x30, %g1
	ldsh	[%l7 + %g1],	%i7
	ble,a	%icc,	loop_29
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x30, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x48]
loop_29:
	st	%f6,	[%l7 + 0x48]
	set	0x78, %o0
	stxa	%l2,	[%l7 + %o0] 0x89
	set	0x20, %i0
	stwa	%o7,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x38, %o5
	std	%o6,	[%l7 + %o5]
	set	0x14, %g4
	stwa	%l6,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x89,	%i3
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x60, %o6
	stwa	%o2,	[%l7 + %o6] 0x80
	set	0x44, %g6
	stwa	%g6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x24, %o2
	stha	%g2,	[%l7 + %o2] 0x88
	ld	[%l7 + 0x7C],	%f19
	set	0x38, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l1
	and	%l4,	%o4,	%o5
	nop
	set	0x5C, %o7
	swap	[%l7 + %o7],	%g1
	set	0x30, %l4
	sta	%f20,	[%l7 + %l4] 0x80
	nop
	set	0x40, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x42, %g5
	ldstub	[%l7 + %g5],	%o1
	nop
	nop
	setx	0x62E08614493F6978,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2E0DE373B70A7856,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f12
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%g4
	set	0x3F, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o0
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f16
	set	0x4C, %l5
	lda	[%l7 + %l5] 0x88,	%f7
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x88,	%i1
	nop
	set	0x20, %g2
	std	%f24,	[%l7 + %g2]
	st	%f1,	[%l7 + 0x58]
	nop
	set	0x40, %g7
	ldstub	[%l7 + %g7],	%i2
	set	0x28, %l0
	sta	%f24,	[%l7 + %l0] 0x88
	add	%g5,	%i5,	%i6
	st	%f13,	[%l7 + 0x40]
	set	0x70, %i1
	stwa	%l5,	[%l7 + %i1] 0x81
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd0
	nop
	set	0x20, %o1
	ldstub	[%l7 + %o1],	%l0
	nop
	set	0x6A, %g1
	ldub	[%l7 + %g1],	%i4
	nop
	set	0x4A, %i7
	ldsh	[%l7 + %i7],	%i7
	bl	%xcc,	loop_30
loop_30:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1270
!	Type a   	: 23
!	Type cti   	: 30
!	Type x   	: 525
!	Type f   	: 41
!	Type i   	: 111
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
.word 0x72934C68
.word 0xBFFD01CE
.word 0x9E86791C
.word 0x7DE15493
.word 0xDFB3A244
.word 0x0119F7D2
.word 0x86B4AF0A
.word 0xD0BE8BE8
.word 0x449CACE7
.word 0xC0F97D96
.word 0x8C8518EB
.word 0xB5EC8D99
.word 0xA0C21E86
.word 0x51C33BA5
.word 0x1D2C0202
.word 0xD826620D
.word 0x1C49A935
.word 0x2CEEB509
.word 0xCAD8B067
.word 0xE178476A
.word 0x75C2EA30
.word 0xD51770E0
.word 0x98255AAE
.word 0xEBFBA3B0
.word 0xC4C0A4F1
.word 0xC6E26ECA
.word 0x9192EECD
.word 0x7D2C86D9
.word 0x118E674B
.word 0x80531579
.word 0xA1AD2BE2
.word 0xCCB59AF2
.word 0x360DAF5F
.word 0xAE964C1E
.word 0xF71CE5A9
.word 0x93D842A2
.word 0x15390B82
.word 0x13998A8A
.word 0x9261C40C
.word 0xB4CC02A5
.word 0x61EFBE41
.word 0x026A23ED
.word 0x355B23EC
.word 0x61FCF775
.word 0xF14E639E
.word 0x8C5D5751
.word 0xC600AFBD
.word 0x2C07C5A5
.word 0x55246BCB
.word 0xCCB477F1
.word 0x88BE3889
.word 0x4B8B63E8
.word 0x357D57A7
.word 0xA61F2DBA
.word 0x6BC8C1DD
.word 0x5048857E
.word 0x725D3191
.word 0xC00CFEFE
.word 0xF3D4A5F1
.word 0xFBC8F31F
.word 0x75A54C98
.word 0x734B61C6
.word 0x71BD5B81
.word 0xC1206C49
.end
