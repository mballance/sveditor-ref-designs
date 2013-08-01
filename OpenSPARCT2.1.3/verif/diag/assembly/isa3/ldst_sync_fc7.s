/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc7.s
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
	set	0xA,	%g1
	set	0x9,	%g2
	set	0xC,	%g3
	set	0x7,	%g4
	set	0x5,	%g5
	set	0xD,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x4,	%i1
	set	-0x4,	%i2
	set	-0x6,	%i3
	set	-0x1,	%i4
	set	-0xC,	%i5
	set	-0xD,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x2247F6D3,	%l0
	set	0x4FBE7F43,	%l1
	set	0x03235C7B,	%l2
	set	0x15B25E2A,	%l3
	set	0x28A11A75,	%l4
	set	0x1E9D54F0,	%l5
	set	0x48BA727C,	%l6
	!# Output registers
	set	-0x1EEA,	%o0
	set	0x0FE2,	%o1
	set	-0x0B4D,	%o2
	set	0x042B,	%o3
	set	0x1112,	%o4
	set	-0x1641,	%o5
	set	-0x0E9D,	%o6
	set	0x1C72,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%i6
	and	%l2,	%g2,	%l0
	set	0x44, %i6
	stwa	%i7,	[%l7 + %i6] 0x81
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f6
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x89,	%l3
	nop
	set	0x62, %l4
	lduh	[%l7 + %l4],	%g3
	set	0x6E, %o7
	stha	%o3,	[%l7 + %o7] 0x89
	set	0x74, %i2
	lda	[%l7 + %i2] 0x81,	%f9
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o7
	add	%i6,	%o0,	%o6
	nop
	set	0x70, %g4
	stb	%i2,	[%l7 + %g4]
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x89,	 2
	nop
	set	0x6C, %g1
	ldsw	[%l7 + %g1],	%g5
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x88,	%i0
	set	0x38, %o0
	stxa	%g6,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%i5
	nop
	set	0x42, %o6
	sth	%l4,	[%l7 + %o6]
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%o4
	set	0x35, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o2
	or	%l5,	%o5,	%g7
	set	0x4C, %i0
	sta	%f28,	[%l7 + %i0] 0x89
	and	%i4,	%o1,	%g1
	nop
	set	0x10, %l1
	stx	%i3,	[%l7 + %l1]
	nop
	set	0x38, %i4
	stx	%g4,	[%l7 + %i4]
	nop
	set	0x37, %g5
	stb	%l2,	[%l7 + %g5]
	nop
	set	0x78, %g7
	swap	[%l7 + %g7],	%l6
	set	0x24, %o1
	stba	%l0,	[%l7 + %o1] 0x80
	nop
	set	0x24, %g6
	ldsw	[%l7 + %g6],	%i7
	nop
	set	0x57, %l2
	ldstub	[%l7 + %l2],	%l3
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xd0
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%g2
	nop
	set	0x50, %l5
	ldsb	[%l7 + %l5],	%g2
	set	0x54, %i7
	sta	%f24,	[%l7 + %i7] 0x80
	nop
	set	0x2C, %l6
	stw	%l1,	[%l7 + %l6]
	nop
	set	0x6E, %i6
	stb	%o7,	[%l7 + %i6]
	set	0x40, %o4
	stda	%i6,	[%l7 + %o4] 0x88
	set	0x28, %i5
	sta	%f29,	[%l7 + %i5] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%o3
	nop
	set	0x51, %l4
	ldub	[%l7 + %l4],	%o6
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%i2
	nop
	set	0x78, %g3
	ldsw	[%l7 + %g3],	%i1
	st	%f15,	[%l7 + 0x6C]
	set	0x28, %o3
	stxa	%g5,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x20, %g2
	stw	%i5,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x40, %g4
	stx	%g6,	[%l7 + %g4]
	set	0x4C, %o5
	sta	%f26,	[%l7 + %o5] 0x89
	nop
	set	0x20, %g1
	std	%f10,	[%l7 + %g1]
	nop
	set	0x10, %l3
	std	%f22,	[%l7 + %l3]
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xe3,	%o4
	wr	%l4,	%l5,	%y
	ld	[%l7 + 0x3C],	%f18
	nop
	set	0x3D, %o0
	ldsb	[%l7 + %o0],	%o2
	nop
	set	0x50, %i1
	stx	%o5,	[%l7 + %i1]
	fpadd16s	%f26,	%f3,	%f6
	nop
	set	0x2A, %i3
	sth	%i4,	[%l7 + %i3]
	set	0x1C, %i0
	stba	%o1,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x50, %l1
	std	%f30,	[%l7 + %l1]
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x80,	%g0
	nop
	nop
	setx	0x2A8EBED279C98AF6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA849D25BA2EF68BF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f2,	%f24
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x88,	%g7
	nop
	set	0x28, %o1
	ldsw	[%l7 + %o1],	%g4
	nop
	set	0x42, %g5
	ldsb	[%l7 + %g5],	%i3
	set	0x48, %l2
	sta	%f4,	[%l7 + %l2] 0x89
	nop
	set	0x60, %l0
	std	%i6,	[%l7 + %l0]
	nop
	set	0x37, %o2
	stb	%l0,	[%l7 + %o2]
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x44, %l5
	lduh	[%l7 + %l5],	%i7
	set	0x58, %l6
	sta	%f26,	[%l7 + %l6] 0x88
	add	%l2,	%g3,	%l3
	add	%l1,	%o7,	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o3
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x58, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x89,	%o0
	nop
	set	0x78, %o4
	std	%i2,	[%l7 + %o4]
	nop
	set	0x68, %l4
	ldsh	[%l7 + %l4],	%i1
	ld	[%l7 + 0x44],	%f21
	st	%f28,	[%l7 + 0x44]
	nop
	set	0x55, %i5
	stb	%o6,	[%l7 + %i5]
	add	%g5,	%i0,	%g6
	set	0x50, %g3
	lda	[%l7 + %g3] 0x88,	%f4
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x80,	%i5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%o4
	nop
	set	0x40, %i2
	stx	%o2,	[%l7 + %i2]
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x89,	%o5
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f6
	nop
	set	0x0C, %g4
	lduh	[%l7 + %g4],	%l5
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f8
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%o1
	nop
	set	0x7D, %o6
	stb	%g1,	[%l7 + %o6]
	nop
	set	0x77, %o0
	ldub	[%l7 + %o0],	%g7
	set	0x08, %g1
	stda	%i4,	[%l7 + %g1] 0xea
	membar	#Sync
	add	%g4,	%l6,	%i3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	set	0x44, %i0
	stwa	%i7,	[%l7 + %i0] 0x88
	set	0x08, %i3
	sta	%f18,	[%l7 + %i3] 0x81
	nop
	set	0x4C, %l1
	ldub	[%l7 + %l1],	%l2
	nop
	set	0x6F, %g7
	ldsb	[%l7 + %g7],	%g3
	nop
	set	0x57, %i4
	ldub	[%l7 + %i4],	%l0
	nop
	set	0x10, %o1
	std	%l2,	[%l7 + %o1]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%l0
	nop
	set	0x5C, %g5
	ldsw	[%l7 + %g5],	%g2
	nop
	set	0x08, %o2
	std	%f20,	[%l7 + %o2]
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%i6
	and	%o7,	%o3,	%i2
	set	0x08, %g6
	stwa	%i1,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x81,	%o0
	nop
	set	0x20, %i7
	prefetch	[%l7 + %i7],	 2
	and	%o6,	%g5,	%i0
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x28, %i6
	swap	[%l7 + %i6],	%g6
	set	0x44, %o4
	lda	[%l7 + %o4] 0x88,	%f7
	set	0x18, %l5
	swapa	[%l7 + %l5] 0x80,	%i5
	nop
	set	0x3C, %i5
	ldstub	[%l7 + %i5],	%l4
	nop
	set	0x5D, %l4
	stb	%o4,	[%l7 + %l4]
	set	0x28, %o3
	stwa	%o5,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%l5
	nop
	set	0x3D, %i2
	ldstub	[%l7 + %i2],	%o1
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x88,	 2
	nop
	set	0x5C, %g4
	ldsh	[%l7 + %g4],	%g7
	nop
	set	0x74, %o7
	stb	%i4,	[%l7 + %o7]
	nop
	set	0x1C, %l3
	sth	%o2,	[%l7 + %l3]
	set	0x0E, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l6
	wr	%i3,	%i7,	%clear_softint
	nop
	set	0x7C, %o5
	stb	%l2,	[%l7 + %o5]
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x88,	%g3
	nop
	set	0x48, %i1
	ldsw	[%l7 + %i1],	%l0
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f8
	and	%g4,	%l3,	%l1
	nop
	set	0x2C, %i3
	lduh	[%l7 + %i3],	%i6
	nop
	set	0x48, %i0
	stx	%g2,	[%l7 + %i0]
	set	0x60, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	set	0x2E, %i4
	stha	%i2,	[%l7 + %i4] 0x80
	fpsub16	%f12,	%f12,	%f24
	set	0x58, %g7
	stda	%i0,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x68, %o1
	stxa	%o3,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x25, %l2
	stb	%o0,	[%l7 + %l2]
	nop
	set	0x66, %o2
	lduh	[%l7 + %o2],	%o6
	nop
	set	0x7A, %g5
	stb	%g5,	[%l7 + %g5]
	or	%i0,	%i5,	%l4
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x89,	%g6
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x88,	 1
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%o4
	nop
	set	0x40, %i7
	lduw	[%l7 + %i7],	%l5
	and	%g1,	%o1,	%g7
	add	%o2,	%i4,	%i3
	nop
	set	0x08, %o4
	std	%i6,	[%l7 + %o4]
	nop
	set	0x14, %i6
	stw	%l6,	[%l7 + %i6]
	add	%g3,	%l2,	%l0
	nop
	set	0x0F, %l5
	stb	%g4,	[%l7 + %l5]
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%l1
	nop
	set	0x28, %i5
	std	%i6,	[%l7 + %i5]
	nop
	set	0x50, %o3
	stb	%l3,	[%l7 + %o3]
	add	%o7,	%i2,	%g2
	nop
	set	0x60, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f6
	set	0x08, %i2
	stxa	%o3,	[%l7 + %i2] 0x81
	st	%f24,	[%l7 + 0x4C]
	set	0x10, %g4
	swapa	[%l7 + %g4] 0x81,	%o0
	nop
	set	0x42, %l3
	ldsb	[%l7 + %l3],	%i1
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%i5
	nop
	set	0x64, %o7
	sth	%l4,	[%l7 + %o7]
	nop
	set	0x54, %g1
	stw	%g6,	[%l7 + %g1]
	nop
	set	0x58, %o5
	std	%f0,	[%l7 + %o5]
	set	0x22, %i1
	stha	%o5,	[%l7 + %i1] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%l5
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x89,	%o4
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f12
	nop
	set	0x28, %l1
	ldx	[%l7 + %l1],	%o1
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x89,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFCC, 	%sys_tick_cmpr
	nop
	set	0x53, %i0
	ldsb	[%l7 + %i0],	%g1
	set	0x34, %g7
	sta	%f31,	[%l7 + %g7] 0x81
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x20, %l2
	std	%i2,	[%l7 + %l2]
	set	0x78, %o2
	stha	%l6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f0
	set	0x14, %l0
	swapa	[%l7 + %l0] 0x88,	%i7
	nop
	set	0x40, %g5
	stw	%l2,	[%l7 + %g5]
	ld	[%l7 + 0x20],	%f14
	set	0x78, %l6
	stda	%l0,	[%l7 + %l6] 0x81
	nop
	set	0x58, %i7
	stw	%g4,	[%l7 + %i7]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB5B, 	%sys_tick_cmpr
	nop
	set	0x38, %o4
	ldsh	[%l7 + %o4],	%g3
	wr	%o7,	%i2,	%ccr
	ld	[%l7 + 0x54],	%f12
	set	0x64, %i6
	sta	%f24,	[%l7 + %i6] 0x88
	nop
	set	0x3A, %l5
	ldstub	[%l7 + %l5],	%g2
	nop
	set	0x2E, %l4
	sth	%o3,	[%l7 + %l4]
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%o0
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%l2
	nop
	set	0x30, %g3
	ldsw	[%l7 + %g3],	%o6
	set	0x20, %i2
	stha	%i0,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x38, %l3
	std	%i0,	[%l7 + %l3]
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%l4
	nop
	set	0x18, %g2
	stx	%o5,	[%l7 + %g2]
	set	0x34, %g1
	lda	[%l7 + %g1] 0x81,	%f1
	nop
	set	0x6E, %o7
	ldsb	[%l7 + %o7],	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%o4
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x30, %o5
	sta	%f2,	[%l7 + %o5] 0x81
	nop
	set	0x38, %o0
	sth	%l5,	[%l7 + %o0]
	and	%o1,	%g7,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i3
	set	0x30, %l1
	ldxa	[%l7 + %l1] 0x81,	%g1
	nop
	set	0x0A, %i4
	sth	%l6,	[%l7 + %i4]
	nop
	set	0x7C, %i0
	ldsw	[%l7 + %i0],	%l2
	set	0x2A, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x88
	nop
	set	0x58, %o1
	std	%f28,	[%l7 + %o1]
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x89,	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%i6
	set	0x68, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l1
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%o7
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%i2
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x89,	%g2
	nop
	set	0x58, %o4
	std	%g2,	[%l7 + %o4]
	nop
	set	0x5A, %i7
	ldsh	[%l7 + %i7],	%o3
	or	%o0,	%o6,	%l3
	fpsub16	%f12,	%f24,	%f6
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x88,	 4
	set	0x50, %i6
	stxa	%i1,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x10, %o3
	stxa	%l4,	[%l7 + %o3] 0x80
	or	%o5,	%g6,	%i5
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%o4
	st	%f6,	[%l7 + 0x5C]
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f10
	and	%l5,	%g5,	%o1
	and	%o2,	%g7,	%i3
	ld	[%l7 + 0x70],	%f13
	st	%f1,	[%l7 + 0x44]
	nop
	set	0x68, %g3
	stx	%g1,	[%l7 + %g3]
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%f25,	[%l7 + 0x1C]
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x89,	%i4
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x88,	%l6
	nop
	set	0x4C, %g2
	swap	[%l7 + %g2],	%l2
	set	0x38, %g4
	lda	[%l7 + %g4] 0x80,	%f11
	st	%fsr,	[%l7 + 0x68]
	set	0x1C, %g1
	swapa	[%l7 + %g1] 0x80,	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i6
	nop
	set	0x08, %o7
	ldx	[%l7 + %o7],	%i7
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x18, %o5
	stwa	%l1,	[%l7 + %o5] 0x80
	st	%fsr,	[%l7 + 0x3C]
	st	%fsr,	[%l7 + 0x70]
	add	%i2,	%g2,	%o7
	st	%fsr,	[%l7 + 0x5C]
	set	0x50, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o3
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x80,	%o0
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%o6
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f14
	fpadd16s	%f9,	%f11,	%f1
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%l3
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x1C, %g6
	sta	%f17,	[%l7 + %g6] 0x81
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%i0
	and	%g3,	%l4,	%i1
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%o5
	nop
	set	0x38, %o2
	std	%f6,	[%l7 + %o2]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf8
	membar	#Sync
	or	%g6,	%o4,	%i5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%o1
	nop
	set	0x5C, %o4
	lduw	[%l7 + %o4],	%o2
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x30]
	set	0x40, %i7
	stda	%g6,	[%l7 + %i7] 0x80
	nop
	set	0x4B, %l5
	stb	%i3,	[%l7 + %l5]
	nop
	set	0x62, %o3
	sth	%g1,	[%l7 + %o3]
	and	%i4,	%l6,	%l5
	nop
	set	0x5E, %l4
	ldub	[%l7 + %l4],	%l0
	nop
	nop
	setx	0xBA938CCB784E3671,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6103F80B2365AD8A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f14
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x70, %i6
	ldsh	[%l7 + %i6],	%i7
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x7C, %g3
	lda	[%l7 + %g3] 0x80,	%f6
	nop
	set	0x74, %i2
	stw	%i6,	[%l7 + %i2]
	add	%i2,	%g2,	%o7
	or	%l1,	%o0,	%o6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc0
	nop
	set	0x60, %g2
	std	%f26,	[%l7 + %g2]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%o3
	st	%f3,	[%l7 + 0x34]
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f20
	nop
	set	0x20, %l3
	ldsw	[%l7 + %l3],	%i0
	and	%g3,	%l4,	%o5
	set	0x40, %g1
	lda	[%l7 + %g1] 0x88,	%f1
	nop
	set	0x58, %i3
	std	%i0,	[%l7 + %i3]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf8
	membar	#Sync
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x81,	%o4
	and	%g6,	%g5,	%i5
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x80,	%o2
	set	0x50, %l1
	lda	[%l7 + %l1] 0x81,	%f7
	nop
	set	0x70, %o0
	stb	%g7,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x28]
	or	%o1,	%i3,	%i4
	nop
	set	0x50, %i0
	stw	%l6,	[%l7 + %i0]
	st	%f31,	[%l7 + 0x6C]
	nop
	set	0x3D, %i4
	ldsb	[%l7 + %i4],	%g1
	st	%f15,	[%l7 + 0x50]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l2
	set	0x38, %g7
	stxa	%g4,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x50, %g6
	stw	%i7,	[%l7 + %g6]
	st	%f5,	[%l7 + 0x7C]
	bleu,pt	%icc,	loop_1
	st	%f31,	[%l7 + 0x18]
	set	0x08, %l2
	stwa	%l5,	[%l7 + %l2] 0x88
loop_1:
	and	%i2,	%g2,	%i6
	set	0x3C, %l0
	stha	%o7,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x89,	%l1
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x81,	%o6
	add	%o0,	%o3,	%l3
	nop
	set	0x08, %o4
	std	%f24,	[%l7 + %o4]
	or	%g3,	%l4,	%i0
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%i1
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x81,	 2
	nop
	set	0x34, %o3
	ldsh	[%l7 + %o3],	%o4
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x81
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f16
	nop
	set	0x78, %i5
	stx	%g5,	[%l7 + %i5]
	st	%f18,	[%l7 + 0x18]
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%i4
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f24
	nop
	set	0x68, %o6
	swap	[%l7 + %o6],	%o2
	nop
	set	0x5C, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x0A, %g4
	ldsb	[%l7 + %g4],	%g7
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f0
	nop
	set	0x58, %i2
	ldsw	[%l7 + %i2],	%g6
	st	%f6,	[%l7 + 0x38]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%i3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f16
	set	0x7F, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i4
	add	%l6,	%l0,	%l2
	bl,a,pn	%icc,	loop_2
	nop
	set	0x52, %g1
	ldsh	[%l7 + %g1],	%g1
	nop
	set	0x20, %i1
	std	%i6,	[%l7 + %i1]
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 0
loop_2:
	nop
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x81,	%g4
	nop
	set	0x32, %l1
	ldsb	[%l7 + %l1],	%i2
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%l5
	nop
	set	0x62, %i4
	ldsh	[%l7 + %i4],	%g2
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%i6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf1
	membar	#Sync
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f6
	nop
	set	0x7A, %o1
	ldstub	[%l7 + %o1],	%l1
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x88,	%o6
	set	0x78, %l6
	stda	%o6,	[%l7 + %l6] 0xe2
	membar	#Sync
	st	%f28,	[%l7 + 0x54]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%o0
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x4C, %i7
	stw	%g3,	[%l7 + %i7]
	wr	%l4,	%l3,	%softint
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i0
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x88,	 1
	nop
	set	0x08, %o3
	std	%f0,	[%l7 + %o3]
	set	0x45, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o4
	nop
	set	0x30, %l4
	std	%g4,	[%l7 + %l4]
	nop
	set	0x48, %i6
	ldsb	[%l7 + %i6],	%o2
	nop
	set	0x67, %o6
	stb	%g7,	[%l7 + %o6]
	and	%i5,	%g6,	%i3
	fpsub16s	%f0,	%f26,	%f3
	nop
	set	0x4C, %g2
	sth	%o1,	[%l7 + %g2]
	nop
	set	0x10, %g3
	swap	[%l7 + %g3],	%l6
	nop
	set	0x14, %g4
	ldsw	[%l7 + %g4],	%i4
	nop
	set	0x74, %l3
	prefetch	[%l7 + %l3],	 0
	st	%f5,	[%l7 + 0x44]
	nop
	set	0x20, %i3
	ldsw	[%l7 + %i3],	%l0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
	bg	%icc,	loop_3
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%g1
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	fpadd32s	%f2,	%f28,	%f13
loop_3:
	ld	[%l7 + 0x44],	%f25
	nop
	set	0x08, %i1
	stx	%l2,	[%l7 + %i1]
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x81,	%g4
	and	%i7,	%l5,	%i2
	ld	[%l7 + 0x34],	%f4
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%i6
	set	0x54, %o5
	sta	%f1,	[%l7 + %o5] 0x88
	nop
	set	0x48, %i4
	swap	[%l7 + %i4],	%l1
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%g2
	nop
	set	0x1E, %l2
	lduh	[%l7 + %l2],	%o6
	nop
	set	0x33, %i0
	stb	%o7,	[%l7 + %i0]
	nop
	set	0x2A, %o2
	ldsb	[%l7 + %o2],	%o3
	set	0x70, %o1
	stwa	%o0,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%l3,	%i1,	%o5
	st	%f2,	[%l7 + 0x34]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%g5
	nop
	set	0x71, %l0
	ldub	[%l7 + %l0],	%o2
	or	%g7,	%i5,	%i0
	and	%i3,	%g6,	%o1
	nop
	set	0x7B, %g6
	ldub	[%l7 + %g6],	%l6
	set	0x3E, %l6
	stba	%l0,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x2C, %o4
	stw	%g1,	[%l7 + %o4]
	nop
	set	0x7C, %i7
	lduh	[%l7 + %i7],	%i4
	and	%g4,	%i7,	%l2
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf8
	membar	#Sync
	set	0x48, %o3
	stwa	%l5,	[%l7 + %o3] 0xeb
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%i6
	st	%f26,	[%l7 + 0x1C]
	nop
	set	0x78, %l4
	std	%g2,	[%l7 + %l4]
	nop
	set	0x68, %i5
	lduw	[%l7 + %i5],	%o6
	nop
	nop
	setx	0xFC531E0A1D5E3592,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x2BE4661A6911C1B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f2
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%o7
	set	0x78, %o6
	stxa	%l1,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x78, %g3
	ldub	[%l7 + %g3],	%o3
	set	0x6E, %g2
	stha	%o0,	[%l7 + %g2] 0x88
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%g3
	set	0x5C, %g4
	ldstuba	[%l7 + %g4] 0x81,	%l3
	set	0x0C, %l3
	swapa	[%l7 + %l3] 0x80,	%o5
	nop
	set	0x70, %i2
	std	%f26,	[%l7 + %i2]
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%o4
	nop
	set	0x75, %o7
	ldstub	[%l7 + %o7],	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%g5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f0
	add	%g7,	%i5,	%i3
	add	%i0,	%o1,	%l6
	set	0x28, %o0
	lda	[%l7 + %o0] 0x88,	%f2
	nop
	set	0x4C, %l1
	swap	[%l7 + %l1],	%l0
	nop
	set	0x34, %g1
	stb	%g1,	[%l7 + %g1]
	fpadd32	%f8,	%f20,	%f16
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%g6
	ld	[%l7 + 0x44],	%f6
	nop
	set	0x78, %o5
	swap	[%l7 + %o5],	%g4
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x81,	%i6
	nop
	set	0x6D, %i0
	ldsb	[%l7 + %i0],	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%i2
	add	%i6,	%i4,	%g2
	set	0x40, %o2
	stxa	%o7,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x3C, %l2
	swap	[%l7 + %l2],	%o6
	st	%f18,	[%l7 + 0x44]
	nop
	set	0x32, %l0
	ldsh	[%l7 + %l0],	%l1
	nop
	set	0x24, %o1
	lduw	[%l7 + %o1],	%o0
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%o3
	nop
	set	0x14, %o4
	ldsw	[%l7 + %o4],	%l4
	nop
	set	0x3C, %i7
	swap	[%l7 + %i7],	%l3
	set	0x44, %l6
	sta	%f19,	[%l7 + %l6] 0x89
	set	0x30, %l5
	stda	%o4,	[%l7 + %l5] 0x89
	nop
	set	0x7C, %o3
	lduw	[%l7 + %o3],	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%o2
	and	%i1,	%g7,	%g5
	nop
	set	0x58, %g5
	stx	%i5,	[%l7 + %g5]
	nop
	set	0x0A, %l4
	ldub	[%l7 + %l4],	%i0
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%o1
	nop
	set	0x5A, %i5
	sth	%i3,	[%l7 + %i5]
	nop
	set	0x7B, %g3
	ldub	[%l7 + %g3],	%l0
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g6
	nop
	set	0x2C, %g2
	swap	[%l7 + %g2],	%g1
	nop
	nop
	setx	0x700DD495,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x91EE30DF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f0,	%f27
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x80,	%i7
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc4
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%g4
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd8,	%f16
	nop
	set	0x34, %i3
	stw	%l5,	[%l7 + %i3]
	nop
	set	0x38, %i1
	stx	%i2,	[%l7 + %i1]
	nop
	set	0x5E, %o7
	ldstub	[%l7 + %o7],	%l2
	st	%f13,	[%l7 + 0x30]
	nop
	set	0x50, %o0
	stx	%fsr,	[%l7 + %o0]
	bl,pn	%xcc,	loop_4
	nop
	set	0x7C, %l1
	ldsw	[%l7 + %l1],	%i6
	add	%g2,	%o7,	%o6
	and	%i4,	%o0,	%l1
loop_4:
	and	%l4,	%l3,	%o5
	add	%g3,	%o4,	%o2
	nop
	set	0x48, %g1
	ldstub	[%l7 + %g1],	%i1
	nop
	set	0x3C, %i4
	swap	[%l7 + %i4],	%o3
	nop
	set	0x48, %g7
	ldsb	[%l7 + %g7],	%g7
	nop
	set	0x20, %o5
	swap	[%l7 + %o5],	%g5
	nop
	set	0x09, %o2
	ldsb	[%l7 + %o2],	%i0
	nop
	set	0x78, %i0
	ldsh	[%l7 + %i0],	%o1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xda
	nop
	set	0x1D, %l2
	ldstub	[%l7 + %l2],	%i3
	set	0x78, %o1
	lda	[%l7 + %o1] 0x89,	%f18
	add	%i5,	%l0,	%l6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%i7
	set	0x1C, %g6
	stha	%g1,	[%l7 + %g6] 0x81
	nop
	set	0x4C, %o4
	lduw	[%l7 + %o4],	%g4
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%l4
	nop
	set	0x78, %l5
	lduh	[%l7 + %l5],	%i2
	nop
	set	0x44, %o3
	stw	%i6,	[%l7 + %o3]
	nop
	set	0x10, %g5
	ldsh	[%l7 + %g5],	%l2
	nop
	set	0x3C, %l4
	lduh	[%l7 + %l4],	%g2
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x89,	%o7
	set	0x70, %i5
	lda	[%l7 + %i5] 0x89,	%f26
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%i4
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%o6
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x58, %g2
	stda	%o0,	[%l7 + %g2] 0x81
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x4B, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l1
	ld	[%l7 + 0x70],	%f31
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x80,	%l4
	set	0x5C, %i3
	swapa	[%l7 + %i3] 0x81,	%l3
	ld	[%l7 + 0x78],	%f27
	nop
	set	0x4A, %o7
	sth	%o5,	[%l7 + %o7]
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x89,	%g2
	st	%fsr,	[%l7 + 0x38]
	add	%o2,	%i1,	%o4
	nop
	set	0x50, %l1
	sth	%g7,	[%l7 + %l1]
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%g4
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x88,	%o3
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%i0
	and	%o1,	%i3,	%i5
	ld	[%l7 + 0x3C],	%f20
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x20, %o2
	stx	%l6,	[%l7 + %o2]
	nop
	set	0x68, %o5
	stx	%l0,	[%l7 + %o5]
	nop
	set	0x50, %i0
	std	%f28,	[%l7 + %i0]
	nop
	set	0x60, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x7F, %l0
	ldub	[%l7 + %l0],	%g1
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%g6
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x88,	%g4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xda,	%f16
	nop
	set	0x20, %i7
	ldstub	[%l7 + %i7],	%l5
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%i6
	set	0x10, %g5
	stda	%l2,	[%l7 + %g5] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%o7
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%i4
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xca
	nop
	set	0x1E, %g3
	sth	%o6,	[%l7 + %g3]
	nop
	set	0x6B, %l6
	ldstub	[%l7 + %l6],	%o0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc8
	set	0x26, %g2
	stha	%i2,	[%l7 + %g2] 0xe2
	membar	#Sync
	wr	%l4,	%l1,	%y
	add	%o5,	%g3,	%o2
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x10, %i2
	stx	%o4,	[%l7 + %i2]
	nop
	set	0x60, %g4
	stx	%g7,	[%l7 + %g4]
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xeb,	%g4
	set	0x65, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o3
	set	0x08, %i1
	stba	%l3,	[%l7 + %i1] 0xeb
	membar	#Sync
	wr	%i0,	%o1,	%y
	nop
	set	0x30, %l1
	lduw	[%l7 + %l1],	%i3
	fpsub32s	%f9,	%f13,	%f19
	nop
	set	0x68, %g1
	ldsh	[%l7 + %g1],	%i5
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l0
	nop
	set	0x40, %o0
	ldsw	[%l7 + %o0],	%g1
	set	0x48, %g7
	stxa	%i7,	[%l7 + %g7] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f0
	ld	[%l7 + 0x24],	%f24
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%l5
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%i6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%g6
	set	0x4C, %l2
	stwa	%l2,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x34, %o2
	stw	%o7,	[%l7 + %o2]
	set	0x1C, %l0
	sta	%f25,	[%l7 + %l0] 0x81
	nop
	set	0x78, %o1
	stx	%g2,	[%l7 + %o1]
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x88,	 2
	bn,pn	%xcc,	loop_5
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x7C, %o3
	ldsh	[%l7 + %o3],	%o6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xcc
loop_5:
	nop
	set	0x10, %g5
	stda	%i2,	[%l7 + %g5] 0x81
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x30, %l5
	ldsw	[%l7 + %l5],	%l4
	st	%f18,	[%l7 + 0x74]
	nop
	set	0x40, %i6
	lduw	[%l7 + %i6],	%o0
	nop
	set	0x1F, %g3
	ldstub	[%l7 + %g3],	%o5
	nop
	set	0x58, %l6
	ldsb	[%l7 + %l6],	%l1
	wr	%g3,	%o2,	%sys_tick
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%g7
	nop
	set	0x3A, %g2
	lduh	[%l7 + %g2],	%o4
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%o2
	st	%fsr,	[%l7 + 0x50]
	and	%l3,	%g5,	%o1
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f0
	and	%i0,	%i5,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l6
	set	0x10, %i2
	stba	%i7,	[%l7 + %i2] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f0
	nop
	set	0x50, %g4
	std	%f24,	[%l7 + %g4]
	nop
	set	0x4C, %o6
	ldstub	[%l7 + %o6],	%g4
	nop
	set	0x20, %i1
	stb	%g1,	[%l7 + %i1]
	nop
	set	0x5E, %g1
	stb	%i6,	[%l7 + %g1]
	nop
	set	0x1C, %o7
	lduh	[%l7 + %o7],	%l5
	and	%g6,	%o7,	%g2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f16
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%l2
	fpsub32s	%f24,	%f7,	%f26
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd0,	%f16
	st	%f14,	[%l7 + 0x20]
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x89,	%i4
	set	0x78, %l1
	stxa	%o6,	[%l7 + %l1] 0x80
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	set	0x18, %o2
	sta	%f3,	[%l7 + %o2] 0x80
	set	0x7F, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i2
	set	0x5C, %l0
	sta	%f18,	[%l7 + %l0] 0x80
	set	0x3B, %o4
	stba	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%l4
	set	0x14, %o3
	swapa	[%l7 + %o3] 0x88,	%o5
	nop
	set	0x64, %i7
	ldstub	[%l7 + %i7],	%l1
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%g3
	st	%f8,	[%l7 + 0x44]
	nop
	set	0x48, %l4
	ldstub	[%l7 + %l4],	%o2
	and	%i1,	%o4,	%o3
	set	0x2A, %l5
	stha	%l3,	[%l7 + %l5] 0x89
	nop
	set	0x10, %g6
	swap	[%l7 + %g6],	%g5
	nop
	set	0x10, %g3
	stw	%g7,	[%l7 + %g3]
	set	0x28, %i6
	ldxa	[%l7 + %i6] 0x80,	%i0
	nop
	set	0x28, %l6
	std	%o0,	[%l7 + %l6]
	set	0x3C, %i5
	sta	%f10,	[%l7 + %i5] 0x89
	add	%i3,	%i5,	%l6
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%l0
	set	0x0E, %i2
	stha	%g4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x14, %i3
	stw	%i6,	[%l7 + %i3]
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%g0
	nop
	set	0x72, %g1
	stb	%l5,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x58, %i1
	stx	%g6,	[%l7 + %i1]
	st	%f15,	[%l7 + 0x38]
	set	0x40, %o7
	sta	%f7,	[%l7 + %o7] 0x88
	set	0x50, %g7
	stda	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%i4
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x80,	%l2
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x10, %i4
	stwa	%i2,	[%l7 + %i4] 0x81
	nop
	nop
	setx	0xD5155F15,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xBC036F28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f2,	%f22
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd2
	set	0x2E, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o0
	set	0x19, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l4
	and	%l1,	%o5,	%o2
	fpsub32	%f18,	%f6,	%f30
	st	%f12,	[%l7 + 0x68]
	set	0x50, %o4
	swapa	[%l7 + %o4] 0x80,	%g3
	add	%o4,	%i1,	%l3
	set	0x4C, %o1
	stha	%o3,	[%l7 + %o1] 0x81
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%g7
	nop
	set	0x60, %i7
	stw	%g5,	[%l7 + %i7]
	nop
	set	0x1A, %l2
	ldstub	[%l7 + %l2],	%o1
	nop
	set	0x20, %g5
	stw	%i0,	[%l7 + %g5]
	nop
	set	0x44, %l5
	ldsw	[%l7 + %l5],	%i3
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0
	nop
	set	0x3C, %g3
	stw	%i5,	[%l7 + %g3]
	and	%g4,	%l0,	%i7
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x89,	%g1
	nop
	set	0x68, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x6C, %i5
	swap	[%l7 + %i5],	%l5
	st	%f20,	[%l7 + 0x7C]
	set	0x30, %l3
	stxa	%i6,	[%l7 + %l3] 0x89
	set	0x7C, %l6
	stha	%g6,	[%l7 + %l6] 0xe2
	membar	#Sync
	or	%g2,	%i4,	%l2
	nop
	set	0x19, %i2
	ldub	[%l7 + %i2],	%o7
	or	%o6,	%o0,	%i2
	nop
	set	0x38, %g2
	stw	%l1,	[%l7 + %g2]
	be,pn	%xcc,	loop_6
	st	%f25,	[%l7 + 0x18]
	nop
	set	0x6A, %g4
	sth	%o5,	[%l7 + %g4]
	set	0x7C, %o6
	stha	%l4,	[%l7 + %o6] 0x88
loop_6:
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%g2
	nop
	set	0x20, %i1
	ldsh	[%l7 + %i1],	%o2
	nop
	set	0x08, %g1
	std	%f8,	[%l7 + %g1]
	nop
	set	0x50, %o7
	stx	%i1,	[%l7 + %o7]
	nop
	set	0x58, %g7
	std	%o4,	[%l7 + %g7]
	nop
	set	0x47, %o5
	stb	%o3,	[%l7 + %o5]
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%g7
	fpsub16s	%f20,	%f29,	%f22
	nop
	set	0x14, %l1
	swap	[%l7 + %l1],	%g5
	nop
	set	0x44, %i4
	swap	[%l7 + %i4],	%l3
	add	%i0,	%o1,	%i3
	nop
	set	0x48, %o2
	std	%i4,	[%l7 + %o2]
	add	%g4,	%l6,	%i7
	nop
	set	0x60, %i0
	std	%f18,	[%l7 + %i0]
	set	0x55, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g1
	set	0x1C, %l0
	sta	%f11,	[%l7 + %l0] 0x81
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%i6
	nop
	set	0x5C, %o1
	lduh	[%l7 + %o1],	%g6
	and	%l5,	%i4,	%l2
	set	0x08, %o3
	stxa	%o7,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x54, %l2
	stb	%g2,	[%l7 + %l2]
	set	0x69, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o6
	nop
	set	0x58, %l5
	prefetch	[%l7 + %l5],	 4
	set	0x50, %i7
	stxa	%i2,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x48, %g6
	stx	%l1,	[%l7 + %g6]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%l4
	nop
	set	0x6C, %g3
	ldsw	[%l7 + %g3],	%g3
	nop
	set	0x68, %i6
	lduh	[%l7 + %i6],	%o2
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f22
	st	%f13,	[%l7 + 0x38]
	and	%i1,	%o4,	%o3
	nop
	set	0x7E, %l4
	ldub	[%l7 + %l4],	%g7
	set	0x08, %l6
	stxa	%g5,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x17, %i2
	ldsb	[%l7 + %i2],	%l3
	set	0x60, %l3
	stwa	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	and	%o1,	%i0,	%i3
	st	%f14,	[%l7 + 0x10]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x44, %g4
	sth	%i5,	[%l7 + %g4]
	ble,a,pt	%icc,	loop_7
	nop
	set	0x70, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%g4
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%i7
loop_7:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE21, 	%sys_tick_cmpr
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f16
	and	%i6,	%l0,	%g6
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x89,	%i4
	set	0x40, %i1
	stha	%l5,	[%l7 + %i1] 0x89
	set	0x20, %g7
	stba	%l2,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f28
	nop
	set	0x38, %o5
	std	%g2,	[%l7 + %o5]
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%o6
	ld	[%l7 + 0x24],	%f19
	nop
	set	0x08, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x34, %o2
	ldstub	[%l7 + %o2],	%i2
	nop
	set	0x16, %o4
	lduh	[%l7 + %o4],	%o7
	or	%l1,	%l4,	%o5
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%g2
	nop
	set	0x54, %i0
	ldstub	[%l7 + %i0],	%o2
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x3F, %o3
	stb	%o4,	[%l7 + %o3]
	nop
	set	0x78, %o1
	std	%o2,	[%l7 + %o1]
	st	%f29,	[%l7 + 0x0C]
	set	0x34, %l2
	stwa	%i1,	[%l7 + %l2] 0x88
	nop
	set	0x66, %g5
	ldstub	[%l7 + %g5],	%g5
	or	%l3,	%o0,	%o1
	nop
	set	0x30, %i7
	stw	%i0,	[%l7 + %i7]
	nop
	set	0x7C, %l5
	swap	[%l7 + %l5],	%g7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xeb,	%i4
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x89,	%i2
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%g0
	nop
	set	0x70, %l6
	stw	%l6,	[%l7 + %l6]
	set	0x50, %i2
	lda	[%l7 + %i2] 0x89,	%f18
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%i7
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x89,	%g6
	or	%i4,	%l0,	%l2
	nop
	set	0x5F, %g3
	ldub	[%l7 + %g3],	%g2
	wr	%l5,	%i2,	%sys_tick
	nop
	set	0x38, %o6
	std	%f28,	[%l7 + %o6]
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%o7
	set	0x38, %i3
	swapa	[%l7 + %i3] 0x80,	%l1
	nop
	set	0x20, %g2
	prefetch	[%l7 + %g2],	 0
	fpsub16s	%f29,	%f30,	%f7
	set	0x49, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o6
	nop
	set	0x08, %g1
	stw	%o5,	[%l7 + %g1]
	set	0x70, %i1
	lda	[%l7 + %i1] 0x89,	%f5
	set	0x54, %g7
	stwa	%l4,	[%l7 + %g7] 0xe3
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%o4
	wr	%o3,	%g3,	%ccr
	and	%i1,	%g5,	%o0
	ld	[%l7 + 0x50],	%f25
	ld	[%l7 + 0x68],	%f16
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%l2
	set	0x1D, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o1
	set	0x58, %i4
	stxa	%g7,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%i4
	nop
	set	0x3B, %o4
	ldsb	[%l7 + %o4],	%i3
	nop
	set	0x23, %l0
	stb	%i0,	[%l7 + %l0]
	nop
	set	0x52, %i0
	ldstub	[%l7 + %i0],	%g1
	nop
	set	0x0E, %o3
	sth	%g4,	[%l7 + %o3]
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x80,	 2
	nop
	set	0x0D, %o1
	ldub	[%l7 + %o1],	%i7
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x81
	set	0x5D, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l6
	set	0x38, %l5
	lda	[%l7 + %l5] 0x88,	%f14
	set	0x6E, %i7
	stba	%i4,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x60, %g6
	stxa	%l0,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x78, %i5
	ldsw	[%l7 + %i5],	%g6
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%l2
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%g2
	nop
	set	0x08, %i2
	swap	[%l7 + %i2],	%l5
	st	%f15,	[%l7 + 0x7C]
	set	0x20, %l3
	stda	%i2,	[%l7 + %l3] 0x81
	nop
	set	0x78, %l6
	ldsw	[%l7 + %l6],	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%o5
	add	%l1,	%l4,	%o4
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%o3
	set	0x64, %g4
	stwa	%o2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x56, %o6
	sth	%i1,	[%l7 + %o6]
	set	0x18, %i3
	lda	[%l7 + %i3] 0x81,	%f3
	nop
	set	0x6C, %o7
	stw	%g3,	[%l7 + %o7]
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f26
	nop
	set	0x08, %g1
	stx	%o0,	[%l7 + %g1]
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x89,	%l3
	set	0x2C, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g5
	and	%g7,	%i5,	%i3
	nop
	set	0x53, %o0
	ldstub	[%l7 + %o0],	%i0
	nop
	set	0x18, %o5
	stx	%g1,	[%l7 + %o5]
	set	0x38, %i4
	stxa	%g4,	[%l7 + %i4] 0xe2
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%i7
	nop
	set	0x78, %o4
	swap	[%l7 + %o4],	%i6
	set	0x69, %o2
	stba	%i4,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x38, %l0
	lduh	[%l7 + %l0],	%l0
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x88,	%f26
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g6
	nop
	set	0x20, %o3
	std	%f16,	[%l7 + %o3]
	set	0x2C, %o1
	stwa	%l2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x89,	%i2
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%g2
	set	0x28, %i7
	stha	%o7,	[%l7 + %i7] 0x80
	ld	[%l7 + 0x34],	%f6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%o6
	nop
	set	0x60, %g6
	ldsw	[%l7 + %g6],	%l1
	ld	[%l7 + 0x70],	%f24
	set	0x10, %i5
	stwa	%l4,	[%l7 + %i5] 0x89
	nop
	set	0x65, %l4
	stb	%o3,	[%l7 + %l4]
	or	%o4,	%i1,	%g3
	nop
	set	0x5E, %l1
	stb	%o0,	[%l7 + %l1]
	nop
	set	0x76, %i2
	ldsh	[%l7 + %i2],	%l3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe3,	%g4
	set	0x44, %l6
	lda	[%l7 + %l6] 0x88,	%f2
	nop
	set	0x18, %g3
	stw	%o2,	[%l7 + %g3]
	set	0x78, %g4
	stwa	%g7,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xcc
	set	0x54, %i3
	sta	%f0,	[%l7 + %i3] 0x89
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%i0
	bne,a,pt	%icc,	loop_8
	wr	%g1,	%i5,	%sys_tick
	add	%g4,	%o1,	%i6
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
loop_8:
	nop
	set	0x48, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x60, %g7
	ldsh	[%l7 + %g7],	%i4
	add	%l6,	%l0,	%g6
	set	0x76, %o0
	stba	%l5,	[%l7 + %o0] 0x89
	fpadd16s	%f28,	%f7,	%f0
	nop
	set	0x40, %i1
	stw	%i2,	[%l7 + %i1]
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	set	0x44, %o5
	stwa	%o7,	[%l7 + %o5] 0x88
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%l2
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x89,	 4
	nop
	set	0x20, %l0
	lduh	[%l7 + %l0],	%l1
	set	0x60, %o3
	lda	[%l7 + %o3] 0x89,	%f12
	nop
	set	0x6C, %i0
	lduh	[%l7 + %i0],	%o5
	set	0x30, %o1
	lda	[%l7 + %o1] 0x81,	%f11
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x0C, %l5
	stwa	%o3,	[%l7 + %l5] 0x80
	nop
	set	0x2C, %l2
	swap	[%l7 + %l2],	%l4
	nop
	set	0x14, %g6
	ldub	[%l7 + %g6],	%o4
	set	0x3A, %i7
	stha	%i1,	[%l7 + %i7] 0xe3
	membar	#Sync
	st	%f24,	[%l7 + 0x3C]
	nop
	set	0x54, %l4
	ldub	[%l7 + %l4],	%o0
	set	0x60, %i5
	stba	%g3,	[%l7 + %i5] 0x89
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x88,	%l3
	or	%o2,	%g7,	%g5
	nop
	set	0x10, %l1
	stw	%i0,	[%l7 + %l1]
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x81,	%g1
	st	%f20,	[%l7 + 0x08]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%i4
	wr	%g4,	%o1,	%set_softint
	nop
	set	0x60, %g4
	stx	%i3,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x3D, %o6
	ldsb	[%l7 + %o6],	%i6
	fpsub32	%f6,	%f8,	%f22
	nop
	set	0x08, %g3
	ldub	[%l7 + %g3],	%i7
	fpadd32	%f24,	%f28,	%f14
	nop
	set	0x4A, %i6
	lduh	[%l7 + %i6],	%i4
	set	0x50, %g2
	sta	%f31,	[%l7 + %g2] 0x80
	nop
	set	0x14, %i3
	ldsw	[%l7 + %i3],	%l0
	nop
	set	0x36, %g1
	ldstub	[%l7 + %g1],	%l6
	nop
	set	0x4F, %o7
	ldstub	[%l7 + %o7],	%l5
	st	%f19,	[%l7 + 0x24]
	nop
	set	0x2A, %o0
	sth	%g6,	[%l7 + %o0]
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f2
	st	%f24,	[%l7 + 0x64]
	and	%i2,	%o7,	%g2
	set	0x48, %i1
	stda	%o6,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f14
	set	0x1C, %o2
	lda	[%l7 + %o2] 0x88,	%f19
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x81,	%l2
	fpsub32s	%f5,	%f31,	%f23
	nop
	set	0x16, %o4
	ldsh	[%l7 + %o4],	%l1
	nop
	set	0x78, %l0
	stw	%o3,	[%l7 + %l0]
	set	0x6D, %o3
	stba	%o5,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x30, %o1
	lduw	[%l7 + %o1],	%o4
	set	0x14, %i0
	lda	[%l7 + %i0] 0x88,	%f2
	set	0x54, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i1
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xca
	nop
	set	0x13, %l5
	ldsb	[%l7 + %l5],	%o0
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x20, %i7
	stda	%g2,	[%l7 + %i7] 0xe2
	membar	#Sync
	fpadd32	%f10,	%f4,	%f14
	set	0x28, %i5
	stxa	%l4,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x40, %i2
	stwa	%l3,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%o2
	and	%g7,	%g5,	%g1
	nop
	set	0x66, %l6
	ldsb	[%l7 + %l6],	%i0
	set	0x60, %l1
	stxa	%g4,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	nop
	setx	0xC6E787F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4AFF3EC5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f23,	%f2
	add	%o1,	%i3,	%i5
	bleu	%xcc,	loop_9
	nop
	set	0x20, %l3
	std	%f10,	[%l7 + %l3]
	set	0x35, %g4
	stba	%i7,	[%l7 + %g4] 0xe2
	membar	#Sync
loop_9:
	nop
	set	0x5C, %o6
	stw	%i6,	[%l7 + %o6]
	nop
	set	0x7C, %g3
	lduh	[%l7 + %g3],	%i4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x0C, %i6
	ldsb	[%l7 + %i6],	%l6
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x88,	%l4
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%i2
	set	0x38, %g1
	stxa	%g6,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x20, %o0
	stda	%g2,	[%l7 + %o0] 0xe3
	membar	#Sync
	wr	%o6,	%l2,	%ccr
	or	%o7,	%o3,	%l1
	st	%f17,	[%l7 + 0x20]
	set	0x28, %g7
	stda	%o4,	[%l7 + %g7] 0x81
	nop
	set	0x6C, %o5
	ldsh	[%l7 + %o5],	%i1
	nop
	set	0x18, %o2
	std	%f14,	[%l7 + %o2]
	nop
	set	0x1E, %i1
	ldsh	[%l7 + %i1],	%o0
	nop
	set	0x38, %o4
	stw	%o5,	[%l7 + %o4]
	set	0x58, %l0
	stxa	%l4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x6C, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x33, %o3
	stb	%l3,	[%l7 + %o3]
	set	0x70, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g3
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x80,	%g7
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x0D, %l2
	stba	%o2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x28, %g6
	std	%f6,	[%l7 + %g6]
	nop
	set	0x78, %i7
	std	%f8,	[%l7 + %i7]
	set	0x64, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g5
	nop
	set	0x3A, %l5
	lduh	[%l7 + %l5],	%i0
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%o1
	nop
	set	0x62, %l6
	lduh	[%l7 + %l6],	%i5
	set	0x30, %i2
	swapa	[%l7 + %i2] 0x89,	%i7
	and	%i6,	%i4,	%i3
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f0
	or	%l5,	%l0,	%i2
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd0
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%l6
	fpadd16s	%f20,	%f13,	%f15
	set	0x14, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g6
	st	%f3,	[%l7 + 0x58]
	nop
	set	0x38, %i3
	ldsw	[%l7 + %i3],	%g2
	set	0x41, %i6
	stba	%l2,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x48, %g2
	stda	%o6,	[%l7 + %g2] 0x89
	set	0x50, %o7
	stda	%o6,	[%l7 + %o7] 0x89
	nop
	set	0x7D, %g1
	ldstub	[%l7 + %g1],	%l1
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x88,	%o3
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x81,	%i1
	nop
	set	0x73, %o2
	ldstub	[%l7 + %o2],	%o0
	set	0x50, %o5
	stda	%o4,	[%l7 + %o5] 0x89
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd8,	%f0
	nop
	set	0x38, %i1
	std	%f26,	[%l7 + %i1]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%o5
	nop
	set	0x1E, %l0
	ldsh	[%l7 + %l0],	%l3
	nop
	set	0x13, %o3
	stb	%g7,	[%l7 + %o3]
	bgu,a,pt	%icc,	loop_10
	nop
	set	0x38, %i4
	std	%f12,	[%l7 + %i4]
	nop
	set	0x08, %o1
	std	%f0,	[%l7 + %o1]
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x88,	%f25
loop_10:
	nop
	set	0x30, %i0
	swapa	[%l7 + %i0] 0x89,	%g3
	st	%fsr,	[%l7 + 0x4C]
	set	0x66, %l2
	stha	%g5,	[%l7 + %l2] 0x89
	nop
	set	0x14, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc4
	set	0x58, %i7
	stxa	%o2,	[%l7 + %i7] 0x81
	nop
	set	0x30, %l5
	std	%f28,	[%l7 + %l5]
	fpsub32	%f20,	%f6,	%f14
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f0
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	nop
	set	0x56, %l1
	lduh	[%l7 + %l1],	%g4
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x80,	%g0
	add	%i5,	%i7,	%o1
	nop
	set	0x26, %o6
	ldsb	[%l7 + %o6],	%i6
	nop
	set	0x30, %l3
	swap	[%l7 + %l3],	%i4
	set	0x14, %g4
	lda	[%l7 + %g4] 0x80,	%f30
	nop
	set	0x48, %g3
	stw	%i3,	[%l7 + %g3]
	st	%f18,	[%l7 + 0x7C]
	nop
	set	0x3A, %i3
	sth	%l0,	[%l7 + %i3]
	nop
	set	0x42, %i6
	ldstub	[%l7 + %i6],	%l5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x070, 	%sys_tick_cmpr
	add	%g2,	%i2,	%o6
	nop
	set	0x18, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x20, %g1
	std	%f26,	[%l7 + %g1]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xc4
	and	%o7,	%l2,	%o3
	set	0x44, %o0
	swapa	[%l7 + %o0] 0x80,	%i1
	nop
	set	0x3C, %o2
	stw	%o0,	[%l7 + %o2]
	set	0x18, %o4
	stwa	%o4,	[%l7 + %o4] 0x81
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%l0
	nop
	set	0x60, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x28, %i1
	ldsw	[%l7 + %i1],	%l4
	wr	%l3,	%g7,	%y
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%g3
	set	0x2A, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g5
	wr 	%g0, 	0x7, 	%fprs
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xea,	%i0
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%g0
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f14
	st	%f21,	[%l7 + 0x10]
	set	0x28, %i0
	lda	[%l7 + %i0] 0x88,	%f28
	or	%g4,	%i7,	%i5
	nop
	set	0x28, %g6
	std	%i6,	[%l7 + %g6]
	set	0x0C, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i4
	nop
	set	0x77, %i5
	ldstub	[%l7 + %i5],	%i3
	fpsub32	%f14,	%f2,	%f0
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%o1
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x80,	%l5
	st	%fsr,	[%l7 + 0x18]
	and	%l0,	%g6,	%g2
	fpadd32	%f30,	%f20,	%f18
	set	0x4C, %l1
	sta	%f29,	[%l7 + %l1] 0x89
	set	0x48, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i2
	or	%o6,	%l6,	%o7
	nop
	set	0x1E, %i2
	sth	%o3,	[%l7 + %i2]
	set	0x78, %l3
	stda	%i0,	[%l7 + %l3] 0x81
	or	%l2,	%o4,	%l1
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f0
	set	0x29, %g3
	stba	%o0,	[%l7 + %g3] 0x89
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f18
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g7
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%g2
	set	0x08, %i3
	lda	[%l7 + %i3] 0x88,	%f0
	nop
	set	0x3E, %o7
	ldstub	[%l7 + %o7],	%l4
	bn,a,pn	%icc,	loop_11
	wr	%g5,	%o5,	%set_softint
	nop
	set	0x70, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x89,	%o2
loop_11:
	nop
	set	0x48, %g2
	lduw	[%l7 + %g2],	%i0
	nop
	set	0x28, %o2
	ldsh	[%l7 + %o2],	%g1
	nop
	set	0x5A, %o0
	stb	%i7,	[%l7 + %o0]
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x88,	%g4
	and	%i5,	%i6,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%l5
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f2
	fpsub32s	%f8,	%f18,	%f10
	nop
	set	0x6F, %l0
	ldsb	[%l7 + %l0],	%l0
	nop
	set	0x56, %i4
	sth	%i3,	[%l7 + %i4]
	nop
	set	0x38, %o1
	lduw	[%l7 + %o1],	%g2
	and	%i2,	%o6,	%g6
	nop
	set	0x1C, %i1
	lduw	[%l7 + %i1],	%l6
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%o6
	set	0x5C, %o3
	stha	%i1,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x14, %i0
	stha	%o3,	[%l7 + %i0] 0x81
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x19, %l2
	ldstub	[%l7 + %l2],	%o4
	nop
	set	0x42, %i7
	stb	%l1,	[%l7 + %i7]
	nop
	set	0x18, %i5
	ldsw	[%l7 + %i5],	%l2
	ld	[%l7 + 0x4C],	%f6
	nop
	set	0x20, %l6
	prefetch	[%l7 + %l6],	 4
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x88,	%l3
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%o0
	fpsub32s	%f30,	%f11,	%f18
	nop
	set	0x78, %g6
	ldsw	[%l7 + %g6],	%g3
	add	%l4,	%g7,	%g5
	set	0x2A, %i2
	stba	%o5,	[%l7 + %i2] 0xeb
	membar	#Sync
	st	%f0,	[%l7 + 0x50]
	nop
	set	0x7A, %l3
	ldsh	[%l7 + %l3],	%i0
	set	0x18, %g4
	stda	%o2,	[%l7 + %g4] 0x88
	nop
	set	0x78, %g3
	lduw	[%l7 + %g3],	%g1
	nop
	set	0x60, %o6
	stx	%g4,	[%l7 + %o6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%i6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x81
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f16
	set	0x60, %g1
	lda	[%l7 + %g1] 0x81,	%f21
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%o1
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%l4
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%g2
	set	0x68, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
	nop
	set	0x7A, %g7
	ldstub	[%l7 + %g7],	%i2
	nop
	set	0x27, %o0
	ldsb	[%l7 + %o0],	%o6
	set	0x50, %o5
	sta	%f1,	[%l7 + %o5] 0x80
	nop
	set	0x68, %o4
	std	%f0,	[%l7 + %o4]
	ld	[%l7 + 0x20],	%f14
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f12
	nop
	set	0x40, %l0
	ldsh	[%l7 + %l0],	%g6
	st	%f10,	[%l7 + 0x08]
	nop
	set	0x24, %i1
	stw	%l6,	[%l7 + %i1]
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x88,	%o6
	add	%o3,	%i1,	%o4
	ld	[%l7 + 0x64],	%f11
	nop
	set	0x5A, %g5
	sth	%l2,	[%l7 + %g5]
	nop
	set	0x70, %o3
	stx	%l1,	[%l7 + %o3]
	nop
	set	0x38, %l2
	stx	%o0,	[%l7 + %l2]
	nop
	set	0x23, %i7
	ldsb	[%l7 + %i7],	%l3
	add	%l4,	%g3,	%g7
	nop
	set	0x65, %i0
	ldub	[%l7 + %i0],	%o5
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x89,	%i0
	bg,a	%icc,	loop_12
	ld	[%l7 + 0x5C],	%f19
	nop
	set	0x34, %l6
	swap	[%l7 + %l6],	%g5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf8
	membar	#Sync
loop_12:
	or	%g1,	%o2,	%i5
	set	0x58, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i6
	and	%g4,	%i4,	%l5
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	wr	%i7,	%o1,	%clear_softint
	or	%g2,	%i3,	%i2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g6
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x1C, %l3
	ldub	[%l7 + %l3],	%l6
	ld	[%l7 + 0x68],	%f8
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	bge	%icc,	loop_13
	nop
	set	0x10, %g3
	std	%o6,	[%l7 + %g3]
	nop
	set	0x0A, %o6
	ldsh	[%l7 + %o6],	%o7
	nop
	set	0x10, %g4
	ldub	[%l7 + %g4],	%o3
loop_13:
	nop
	set	0x30, %o7
	stx	%o4,	[%l7 + %o7]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f16
	set	0x44, %i3
	stwa	%i1,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x2C, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x14, %o2
	ldsw	[%l7 + %o2],	%l2
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xeb,	%o0
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%l3
	st	%fsr,	[%l7 + 0x44]
	or	%l1,	%l4,	%g3
	set	0x56, %o5
	stha	%o5,	[%l7 + %o5] 0xe2
	membar	#Sync
	wr	%g7,	%g5,	%y
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f0
	nop
	set	0x2C, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%g0
	nop
	set	0x24, %i1
	lduw	[%l7 + %i1],	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%i6
	add	%g4,	%i4,	%l5
	set	0x74, %o0
	swapa	[%l7 + %o0] 0x89,	%i7
	set	0x5C, %o1
	lda	[%l7 + %o1] 0x89,	%f24
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 4
	set	0x6C, %l2
	swapa	[%l7 + %l2] 0x80,	%o2
	ld	[%l7 + 0x28],	%f24
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f0
	ble,a,pn	%icc,	loop_14
	and	%o1,	%i3,	%i2
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%g2
	set	0x65, %i5
	stba	%g6,	[%l7 + %i5] 0x80
loop_14:
	nop
	set	0x4A, %i0
	stha	%l0,	[%l7 + %i0] 0xea
	membar	#Sync
	and	%o6,	%l6,	%o3
	set	0x64, %l6
	sta	%f13,	[%l7 + %l6] 0x88
	set	0x7A, %l5
	stha	%o7,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xe3,	%o4
	nop
	set	0x78, %i2
	std	%f0,	[%l7 + %i2]
	nop
	set	0x2A, %l3
	ldstub	[%l7 + %l3],	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%o0
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	nop
	set	0x30, %g3
	stw	%l1,	[%l7 + %g3]
	set	0x60, %l4
	stxa	%l4,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x4C, %o6
	ldsw	[%l7 + %o6],	%l3
	nop
	set	0x48, %g4
	stx	%g3,	[%l7 + %g4]
	ba,a	%icc,	loop_15
	nop
	set	0x08, %i6
	std	%f18,	[%l7 + %i6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g5
loop_15:
	nop
	set	0x18, %i3
	std	%f26,	[%l7 + %i3]
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g7
	ld	[%l7 + 0x50],	%f8
	nop
	set	0x40, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x4C, %g7
	lda	[%l7 + %g7] 0x80,	%f13
	nop
	set	0x1E, %g1
	sth	%g1,	[%l7 + %g1]
	set	0x40, %g2
	sta	%f19,	[%l7 + %g2] 0x81
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%i0
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x88,	%i6
	nop
	set	0x10, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x35, %i1
	ldstuba	[%l7 + %i1] 0x81,	%i5
	set	0x2F, %o5
	stba	%i4,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x4C, %o0
	sta	%f27,	[%l7 + %o0] 0x88
	nop
	set	0x19, %o1
	ldub	[%l7 + %o1],	%l5
	nop
	set	0x3C, %o3
	sth	%g4,	[%l7 + %o3]
	bg,pn	%icc,	loop_16
	nop
	set	0x68, %l2
	std	%f14,	[%l7 + %l2]
	add	%o2,	%i7,	%i3
	set	0x50, %g5
	stda	%i2,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_16:
	ld	[%l7 + 0x14],	%f6
	nop
	set	0x20, %i5
	std	%o0,	[%l7 + %i5]
	nop
	set	0x6C, %i0
	ldsh	[%l7 + %i0],	%g6
	set	0x45, %i7
	stba	%g2,	[%l7 + %i7] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%l0
	ld	[%l7 + 0x40],	%f11
	nop
	set	0x16, %l6
	ldsb	[%l7 + %l6],	%l6
	nop
	set	0x29, %l1
	ldub	[%l7 + %l1],	%o7
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 0
	add	%o3,	%o4,	%i1
	set	0x44, %g6
	sta	%f2,	[%l7 + %g6] 0x88
	set	0x2C, %g3
	swapa	[%l7 + %g3] 0x81,	%o0
	set	0x08, %l5
	stxa	%l2,	[%l7 + %l5] 0x89
	bl,a	%icc,	loop_17
	nop
	set	0x31, %o6
	stb	%l4,	[%l7 + %o6]
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x48, %i6
	swap	[%l7 + %i6],	%l3
loop_17:
	nop
	set	0x4B, %i3
	ldsb	[%l7 + %i3],	%l1
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%o5
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f4
	fpsub32	%f4,	%f24,	%f12
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x89,	%g5
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%g2
	nop
	set	0x44, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x28, %g2
	stx	%g1,	[%l7 + %g2]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i0
	fpsub16s	%f9,	%f0,	%f21
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%i4
	fpadd16	%f18,	%f28,	%f10
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x80,	%i6
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%i4
	nop
	set	0x26, %i1
	ldsh	[%l7 + %i1],	%l5
	nop
	set	0x72, %o0
	ldstub	[%l7 + %o0],	%o2
	nop
	set	0x3B, %o5
	ldstub	[%l7 + %o5],	%i7
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	wr	%g4,	%i3,	%softint
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x80
	set	0x5F, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o1
	nop
	set	0x26, %i5
	sth	%g6,	[%l7 + %i5]
	set	0x50, %i0
	stxa	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%i2,	%o6,	%l6
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x89,	%l0
	set	0x10, %l6
	stwa	%o3,	[%l7 + %l6] 0x88
	or	%o7,	%o4,	%o0
	nop
	set	0x38, %l1
	stx	%i1,	[%l7 + %l1]
	add	%l4,	%l3,	%l1
	or	%o5,	%g5,	%g3
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x80,	%l2
	nop
	set	0x4E, %l3
	stb	%g7,	[%l7 + %l3]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%i5
	nop
	set	0x2C, %g6
	stw	%i6,	[%l7 + %g6]
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%i0
	nop
	set	0x6A, %i2
	sth	%l5,	[%l7 + %i2]
	set	0x30, %o6
	stxa	%i4,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe2,	%i6
	nop
	set	0x44, %l4
	prefetch	[%l7 + %l4],	 1
	and	%g4,	%o2,	%i3
	fpadd32	%f18,	%f18,	%f24
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd0
	nop
	set	0x15, %g4
	ldub	[%l7 + %g4],	%o1
	set	0x55, %o7
	ldstuba	[%l7 + %o7] 0x88,	%g2
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f4
	set	0x5E, %i6
	stha	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x80,	%i2
	nop
	set	0x6C, %i4
	swap	[%l7 + %i4],	%l6
	nop
	set	0x10, %g2
	ldstub	[%l7 + %g2],	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%o7
	nop
	set	0x68, %l0
	std	%o4,	[%l7 + %l0]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc0
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f30
	fpsub32	%f0,	%f10,	%f28
	set	0x60, %o5
	sta	%f17,	[%l7 + %o5] 0x89
	st	%f19,	[%l7 + 0x7C]
	nop
	set	0x0E, %o3
	ldub	[%l7 + %o3],	%l0
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%i1
	nop
	set	0x28, %l2
	std	%o0,	[%l7 + %l2]
	set	0x1C, %i5
	stwa	%l3,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x28, %i0
	sth	%l1,	[%l7 + %i0]
	and	%o5,	%l4,	%g3
	nop
	set	0x09, %o1
	ldstub	[%l7 + %o1],	%l2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x81
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	set	0x2C, %l1
	stw	%g1,	[%l7 + %l1]
	add	%i5,	%g7,	%i6
	nop
	set	0x6D, %g5
	stb	%i0,	[%l7 + %g5]
	set	0x4B, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i4
	or	%l5,	%i7,	%o2
	nop
	set	0x70, %l3
	std	%f22,	[%l7 + %l3]
	nop
	set	0x4A, %i2
	sth	%i3,	[%l7 + %i2]
	nop
	set	0x6C, %o6
	stb	%o1,	[%l7 + %o6]
	nop
	set	0x1C, %l5
	stw	%g4,	[%l7 + %l5]
	nop
	set	0x46, %g3
	lduh	[%l7 + %g3],	%g6
	set	0x58, %i3
	stha	%i2,	[%l7 + %i3] 0x89
	ld	[%l7 + 0x28],	%f9
	nop
	set	0x78, %l4
	ldsh	[%l7 + %l4],	%l6
	st	%f13,	[%l7 + 0x08]
	nop
	set	0x30, %g4
	swap	[%l7 + %g4],	%g2
	st	%f19,	[%l7 + 0x60]
	set	0x5C, %o7
	stha	%o3,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x20, %i6
	stxa	%o7,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x68, %o2
	swap	[%l7 + %o2],	%o4
	nop
	set	0x40, %g1
	ldsw	[%l7 + %g1],	%l0
	set	0x08, %i4
	lda	[%l7 + %i4] 0x88,	%f19
	fpadd32	%f0,	%f16,	%f0
	nop
	set	0x50, %g2
	std	%o6,	[%l7 + %g2]
	and	%o0,	%l3,	%l1
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x89,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%g3
	nop
	set	0x2C, %l0
	swap	[%l7 + %l0],	%l4
	or	%g5,	%g1,	%l2
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x88,	%g7
	or	%i6,	%i5,	%i4
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x80,	%l5
	set	0x38, %o3
	stha	%i7,	[%l7 + %o3] 0x88
	nop
	set	0x08, %o5
	ldsw	[%l7 + %o5],	%i0
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f18
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%o2
	set	0x08, %i5
	lda	[%l7 + %i5] 0x80,	%f3
	set	0x6C, %l2
	swapa	[%l7 + %l2] 0x80,	%g4
	or	%g6,	%i2,	%o1
	st	%f8,	[%l7 + 0x28]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g2
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x70]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xda,	%f16
	ld	[%l7 + 0x48],	%f6
	nop
	set	0x40, %i0
	ldsw	[%l7 + %i0],	%o3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l0
	nop
	set	0x62, %l1
	sth	%o7,	[%l7 + %l1]
	add	%o0,	%l3,	%o6
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf0
	membar	#Sync
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%f30
	nop
	set	0x70, %l3
	lduw	[%l7 + %l3],	%i1
	and	%l1,	%o5,	%g3
	fpadd32	%f30,	%f28,	%f4
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x81,	%g5
	set	0x20, %g6
	stxa	%g1,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x44, %l5
	lda	[%l7 + %l5] 0x89,	%f13
	set	0x50, %g3
	lda	[%l7 + %g3] 0x89,	%f3
	set	0x40, %i3
	stwa	%l2,	[%l7 + %i3] 0x89
	nop
	set	0x64, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x17, %l4
	ldub	[%l7 + %l4],	%l4
	nop
	set	0x0E, %o7
	sth	%i6,	[%l7 + %o7]
	set	0x78, %g4
	sta	%f5,	[%l7 + %g4] 0x80
	nop
	set	0x77, %o2
	ldstub	[%l7 + %o2],	%g7
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x89,	%i4
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x5D, %i6
	ldstub	[%l7 + %i6],	%l5
	set	0x64, %g2
	sta	%f3,	[%l7 + %g2] 0x80
	set	0x1A, %g7
	stba	%i4,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x78, %i4
	sta	%f10,	[%l7 + %i4] 0x88
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x89,	%i0
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x47, %i1
	ldstub	[%l7 + %i1],	%i3
	set	0x20, %o3
	stda	%i6,	[%l7 + %o3] 0x80
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%o2
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f0
	nop
	set	0x3C, %i5
	prefetch	[%l7 + %i5],	 2
	set	0x30, %i7
	stxa	%i2,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x5E, %o1
	ldsb	[%l7 + %o1],	%g6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f16
	set	0x67, %l6
	ldstuba	[%l7 + %l6] 0x80,	%o1
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x81,	 2
	set	0x38, %g5
	stxa	%o3,	[%l7 + %g5] 0x88
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x81,	%o4
	or	%l0,	%o7,	%o0
	set	0x1C, %i2
	stha	%l3,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x38, %g6
	stx	%l6,	[%l7 + %g6]
	fpadd16s	%f15,	%f15,	%f25
	fpsub32	%f6,	%f16,	%f24
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x81
	nop
	set	0x18, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%i1
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%o6
	fpadd32	%f30,	%f0,	%f16
	set	0x30, %o7
	stda	%l0,	[%l7 + %o7] 0x80
	set	0x30, %g3
	stda	%g2,	[%l7 + %g3] 0x80
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%o5
	st	%f8,	[%l7 + 0x7C]
	fpadd32s	%f22,	%f26,	%f14
	st	%fsr,	[%l7 + 0x30]
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xe2,	%l2
	nop
	set	0x54, %g1
	ldub	[%l7 + %g1],	%g1
	set	0x28, %o2
	stda	%l4,	[%l7 + %o2] 0x80
	nop
	set	0x4C, %g2
	stw	%i6,	[%l7 + %g2]
	nop
	set	0x52, %i6
	ldstub	[%l7 + %i6],	%i5
	st	%f19,	[%l7 + 0x74]
	add	%l5,	%i4,	%i0
	nop
	set	0x18, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x3B, %l0
	ldub	[%l7 + %l0],	%i3
	add	%g7,	%o2,	%g4
	nop
	set	0x34, %o0
	ldsb	[%l7 + %o0],	%i7
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%g6
	set	0x0C, %i1
	sta	%f2,	[%l7 + %i1] 0x89
	nop
	set	0x3A, %o3
	ldsb	[%l7 + %o3],	%o1
	set	0x51, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o3
	set	0x15, %l2
	stba	%g2,	[%l7 + %l2] 0x81
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%l0
	fpsub32	%f12,	%f18,	%f14
	or	%o4,	%o7,	%l3
	nop
	set	0x4A, %o4
	ldstub	[%l7 + %o4],	%l6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x89
	st	%f17,	[%l7 + 0x68]
	or	%i1,	%o0,	%o6
	nop
	set	0x78, %i0
	swap	[%l7 + %i0],	%g3
	ld	[%l7 + 0x48],	%f31
	nop
	set	0x0D, %l6
	ldstub	[%l7 + %l6],	%l1
	set	0x64, %o1
	lda	[%l7 + %o1] 0x89,	%f3
	nop
	set	0x6A, %l1
	ldsh	[%l7 + %l1],	%g5
	nop
	set	0x20, %g5
	std	%o4,	[%l7 + %g5]
	set	0x08, %l3
	prefetcha	[%l7 + %l3] 0x88,	 0
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f24
	nop
	set	0x18, %i3
	swap	[%l7 + %i3],	%g1
	st	%f14,	[%l7 + 0x1C]
	nop
	set	0x70, %l5
	prefetch	[%l7 + %l5],	 4
	ld	[%l7 + 0x24],	%f17
	nop
	set	0x78, %o6
	std	%f24,	[%l7 + %o6]
	set	0x08, %l4
	stda	%i6,	[%l7 + %l4] 0x81
	nop
	set	0x12, %g3
	ldsh	[%l7 + %g3],	%i5
	set	0x28, %o7
	stda	%l4,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x34, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i4
	set	0x1C, %o2
	lda	[%l7 + %o2] 0x88,	%f26
	nop
	set	0x44, %g2
	lduw	[%l7 + %g2],	%l4
	set	0x6C, %g1
	sta	%f29,	[%l7 + %g1] 0x88
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x81
	set	0x40, %i4
	sta	%f8,	[%l7 + %i4] 0x89
	set	0x54, %g7
	lda	[%l7 + %g7] 0x81,	%f15
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g7
	nop
	set	0x78, %l0
	lduh	[%l7 + %l0],	%i0
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0
	set	0x44, %o3
	stha	%i7,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%i2
	nop
	set	0x12, %l2
	lduh	[%l7 + %l2],	%g4
	add	%g6,	%o3,	%g2
	fpadd16	%f24,	%f0,	%f8
	set	0x34, %i5
	stha	%o1,	[%l7 + %i5] 0x89
	nop
	set	0x30, %o4
	std	%f22,	[%l7 + %o4]
	or	%l0,	%o4,	%o7
	set	0x18, %o5
	ldstuba	[%l7 + %o5] 0x88,	%l6
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%i1
	and	%l3,	%o6,	%g3
	nop
	set	0x1D, %i0
	ldsb	[%l7 + %i0],	%o0
	set	0x78, %l6
	stxa	%g5,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x18, %l1
	sth	%l1,	[%l7 + %l1]
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x89,	%l2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xcc
	nop
	set	0x78, %l3
	ldsw	[%l7 + %l3],	%g1
	ld	[%l7 + 0x50],	%f9
	and	%o5,	%i6,	%l5
	nop
	set	0x75, %g6
	stb	%i5,	[%l7 + %g6]
	nop
	set	0x2E, %i3
	sth	%l4,	[%l7 + %i3]
	nop
	set	0x33, %l5
	ldstub	[%l7 + %l5],	%i3
	set	0x30, %i2
	swapa	[%l7 + %i2] 0x81,	%i4
	nop
	set	0x34, %l4
	lduw	[%l7 + %l4],	%i0
	set	0x42, %g3
	stba	%o2,	[%l7 + %g3] 0xeb
	membar	#Sync
	fpadd16	%f2,	%f6,	%f8
	nop
	set	0x18, %o7
	swap	[%l7 + %o7],	%g7
	or	%i7,	%g4,	%g6
	nop
	set	0x10, %g4
	std	%i2,	[%l7 + %g4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%o1
	st	%f8,	[%l7 + 0x64]
	nop
	set	0x42, %o6
	ldsh	[%l7 + %o6],	%o3
	nop
	set	0x65, %g2
	ldub	[%l7 + %g2],	%o4
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%l0
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x74, %i6
	ldsw	[%l7 + %i6],	%l6
	or	%o7,	%i1,	%l3
	set	0x0B, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o6
	st	%f16,	[%l7 + 0x30]
	nop
	set	0x16, %g7
	sth	%o0,	[%l7 + %g7]
	nop
	set	0x10, %o2
	stx	%g3,	[%l7 + %o2]
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f2
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%l0
	nop
	set	0x30, %l0
	stw	%g5,	[%l7 + %l0]
	nop
	set	0x29, %o0
	ldsb	[%l7 + %o0],	%g1
	nop
	set	0x70, %l2
	stw	%l2,	[%l7 + %l2]
	nop
	set	0x7E, %o4
	stb	%i6,	[%l7 + %o4]
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x81,	%l5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%o5
	set	0x0B, %i7
	ldstuba	[%l7 + %i7] 0x80,	%l4
	nop
	set	0x42, %i5
	ldstub	[%l7 + %i5],	%i4
	add	%i0,	%i3,	%o2
	set	0x30, %l6
	stda	%g6,	[%l7 + %l6] 0xeb
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%g6
	set	0x4C, %i0
	sta	%f19,	[%l7 + %i0] 0x89
	nop
	set	0x10, %o1
	std	%i2,	[%l7 + %o1]
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x89,	%i7
	set	0x0B, %g5
	stba	%o1,	[%l7 + %g5] 0x80
	set	0x6E, %l3
	stha	%g2,	[%l7 + %l3] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x34, %i3
	lduw	[%l7 + %i3],	%o3
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x4C]
	set	0x78, %l5
	stxa	%o4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x4C, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x6C, %l4
	ldsw	[%l7 + %l4],	%l6
	or	%o7,	%i1,	%l0
	or	%l3,	%o6,	%o0
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%l0
	set	0x64, %g6
	stwa	%g5,	[%l7 + %g6] 0x81
	nop
	set	0x22, %g4
	lduh	[%l7 + %g4],	%g3
	add	%g1,	%i6,	%l2
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x89,	%i4
	nop
	set	0x1C, %o6
	stw	%o5,	[%l7 + %o6]
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f22
	set	0x6F, %g2
	stba	%l4,	[%l7 + %g2] 0x89
	nop
	set	0x5A, %i6
	ldsb	[%l7 + %i6],	%i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1275
!	Type a   	: 24
!	Type cti   	: 17
!	Type x   	: 507
!	Type f   	: 43
!	Type i   	: 134
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
	set	0x8,	%g1
	set	0x3,	%g2
	set	0xE,	%g3
	set	0x3,	%g4
	set	0x3,	%g5
	set	0x2,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xC,	%i1
	set	-0xC,	%i2
	set	-0x3,	%i3
	set	-0xB,	%i4
	set	-0xB,	%i5
	set	-0xB,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x2E78AA1F,	%l0
	set	0x6D63D0CC,	%l1
	set	0x587C3337,	%l2
	set	0x0C823A48,	%l3
	set	0x3B5C7747,	%l4
	set	0x287F06CD,	%l5
	set	0x08092AFF,	%l6
	!# Output registers
	set	0x04B8,	%o0
	set	0x07A0,	%o1
	set	-0x1940,	%o2
	set	0x1FD6,	%o3
	set	-0x19D4,	%o4
	set	0x09E3,	%o5
	set	-0x02D4,	%o6
	set	0x020C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	set	0x70, %i4
	ldstuba	[%l7 + %i4] 0x89,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%o2
	set	0x28, %o2
	stda	%g6,	[%l7 + %o2] 0x80
	and	%g4,	%i3,	%g6
	set	0x30, %g7
	stwa	%i2,	[%l7 + %g7] 0x89
	add	%i7,	%g2,	%o1
	nop
	set	0x32, %i1
	sth	%o3,	[%l7 + %i1]
	nop
	set	0x44, %l0
	lduw	[%l7 + %l0],	%l6
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%o4
	nop
	set	0x52, %l2
	ldsh	[%l7 + %l2],	%o7
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x81,	%i1
	nop
	set	0x40, %o5
	lduw	[%l7 + %o5],	%l0
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%o6
	ld	[%l7 + 0x54],	%f22
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f22
	ld	[%l7 + 0x20],	%f1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%o0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%g3
	nop
	set	0x18, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x10, %i0
	stw	%g5,	[%l7 + %i0]
	nop
	set	0x58, %i7
	stw	%i6,	[%l7 + %i7]
	nop
	set	0x25, %o1
	ldub	[%l7 + %o1],	%g1
	set	0x30, %l1
	lda	[%l7 + %l1] 0x81,	%f22
	wr	%i5,	%o5,	%softint
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x14, %l3
	prefetch	[%l7 + %l3],	 2
	wr	%l2,	%l4,	%y
	nop
	set	0x50, %g5
	ldx	[%l7 + %g5],	%i4
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l5
	bleu	%icc,	loop_18
	nop
	set	0x68, %i2
	std	%f6,	[%l7 + %i2]
	nop
	set	0x5C, %l4
	prefetch	[%l7 + %l4],	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%g7
loop_18:
	nop
	set	0x08, %g3
	stx	%i3,	[%l7 + %g3]
	nop
	set	0x48, %g6
	std	%g6,	[%l7 + %g6]
	set	0x28, %l5
	sta	%f4,	[%l7 + %l5] 0x89
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f16
	fpsub16	%f20,	%f22,	%f8
	nop
	set	0x6C, %o6
	stw	%g4,	[%l7 + %o6]
	nop
	set	0x0C, %g1
	ldstub	[%l7 + %g1],	%i2
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%g2
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%o0
	nop
	set	0x7C, %i6
	ldsw	[%l7 + %i6],	%i7
	or	%l6,	%o4,	%o3
	nop
	set	0x44, %i4
	lduw	[%l7 + %i4],	%i1
	wr	%o7,	%l0,	%softint
	nop
	set	0x18, %g7
	swap	[%l7 + %g7],	%o6
	set	0x70, %o2
	stha	%o0,	[%l7 + %o2] 0x89
	set	0x70, %i1
	stda	%l0,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x34, %l0
	sth	%l3,	[%l7 + %l0]
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x89
	nop
	set	0x40, %o5
	sth	%i6,	[%l7 + %o5]
	nop
	set	0x48, %o0
	lduw	[%l7 + %o0],	%g5
	and	%i5,	%o5,	%g1
	nop
	set	0x30, %i5
	swap	[%l7 + %i5],	%l4
	nop
	set	0x20, %l6
	stx	%l2,	[%l7 + %l6]
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x38, %o4
	lduw	[%l7 + %o4],	%i0
	nop
	set	0x60, %i7
	lduh	[%l7 + %i7],	%l5
	and	%o2,	%i4,	%i3
	set	0x78, %l1
	stda	%g6,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g7
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%g2
	nop
	set	0x78, %g5
	std	%o0,	[%l7 + %g5]
	nop
	set	0x10, %i3
	std	%f30,	[%l7 + %i3]
	ld	[%l7 + 0x44],	%f26
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f2
	and	%i2,	%i7,	%l6
	set	0x34, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o4
	nop
	set	0x2C, %g6
	swap	[%l7 + %g6],	%i1
	st	%fsr,	[%l7 + 0x48]
	fpsub32s	%f20,	%f19,	%f1
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f4
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f28
	ble	%icc,	loop_19
	nop
	set	0x68, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fpsub16	%f8,	%f12,	%f24
loop_19:
	or	%o6,	%l0,	%o0
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%l2
	nop
	set	0x18, %g2
	ldsh	[%l7 + %g2],	%g3
	add	%i6,	%g5,	%l1
	set	0x74, %i4
	stba	%i5,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x2F, %i6
	stba	%o5,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xea,	%g0
	set	0x48, %g7
	stda	%l2,	[%l7 + %g7] 0x80
	fpadd16s	%f5,	%f4,	%f15
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%o2
	or	%l5,	%i4,	%i3
	ld	[%l7 + 0x64],	%f30
	set	0x77, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g4
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x20, %o5
	stwa	%g7,	[%l7 + %o5] 0x88
	nop
	set	0x50, %o0
	swap	[%l7 + %o0],	%g6
	set	0x20, %o3
	stxa	%o1,	[%l7 + %o3] 0x88
	nop
	set	0x60, %l6
	ldx	[%l7 + %l6],	%g2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%i2
	nop
	set	0x20, %i0
	ldsw	[%l7 + %i0],	%o4
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f24
	set	0x08, %o4
	ldxa	[%l7 + %o4] 0x89,	%l6
	or	%i1,	%o7,	%o6
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x88,	 1
	nop
	set	0x30, %o1
	stw	%o0,	[%l7 + %o1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%g3
	set	0x38, %g5
	stxa	%l0,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%g5
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%i6
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%o5
	set	0x60, %g3
	stda	%l2,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%g1
	set	0x31, %g6
	stba	%l4,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x70, %l5
	lda	[%l7 + %l5] 0x80,	%f18
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x80,	%i0
	nop
	set	0x60, %l4
	std	%f2,	[%l7 + %l4]
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x81,	%o2
	st	%f10,	[%l7 + 0x40]
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%i4
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	nop
	set	0x1D, %i4
	ldub	[%l7 + %i4],	%i3
	ld	[%l7 + 0x20],	%f2
	nop
	nop
	setx	0xD0C078129BB6A1F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC3AD75C0E0DEB7CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f8,	%f16
	nop
	set	0x50, %i6
	sth	%g7,	[%l7 + %i6]
	nop
	set	0x10, %g2
	sth	%g4,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x46, %g7
	lduh	[%l7 + %g7],	%g6
	set	0x30, %o2
	stha	%g2,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x4D, %l0
	stb	%i7,	[%l7 + %l0]
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	nop
	set	0x10, %o5
	std	%f0,	[%l7 + %o5]
	nop
	set	0x78, %i1
	stw	%o1,	[%l7 + %i1]
	st	%f6,	[%l7 + 0x58]
	set	0x28, %o0
	stwa	%o4,	[%l7 + %o0] 0x89
	set	0x58, %l6
	stxa	%i1,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x68, %o3
	std	%o6,	[%l7 + %o3]
	bn	%icc,	loop_20
	nop
	set	0x40, %i0
	stw	%l6,	[%l7 + %i0]
	ld	[%l7 + 0x5C],	%f9
	set	0x30, %o4
	stha	%o6,	[%l7 + %o4] 0x88
loop_20:
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	set	0x18, %o1
	lduh	[%l7 + %o1],	%o3
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x80,	%l3
	nop
	set	0x2A, %l1
	ldsh	[%l7 + %l1],	%g3
	set	0x74, %l3
	sta	%f12,	[%l7 + %l3] 0x88
	nop
	set	0x58, %i7
	ldub	[%l7 + %i7],	%g5
	nop
	set	0x74, %g3
	sth	%l0,	[%l7 + %g3]
	set	0x30, %i2
	ldxa	[%l7 + %i2] 0x81,	%l1
	fpadd32s	%f7,	%f31,	%f17
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	nop
	set	0x70, %i3
	prefetch	[%l7 + %i3],	 1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%o5
	set	0x50, %o7
	stxa	%l2,	[%l7 + %o7] 0x80
	set	0x4C, %l5
	lda	[%l7 + %l5] 0x80,	%f31
	st	%f19,	[%l7 + 0x58]
	or	%i5,	%l4,	%g1
	set	0x0F, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i0
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%o2
	and	%l5,	%i4,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%g6
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%g2
	nop
	set	0x1C, %o6
	ldsb	[%l7 + %o6],	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%o1
	or	%i3,	%i1,	%o7
	set	0x40, %i6
	stxa	%o4,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x78, %i4
	stb	%l6,	[%l7 + %i4]
	set	0x53, %g2
	stba	%o6,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x89,	%f26
	nop
	set	0x30, %o2
	ldsw	[%l7 + %o2],	%o0
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%o2
	set	0x19, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD7B, 	%sys_tick_cmpr
	nop
	set	0x70, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x0E, %o0
	ldub	[%l7 + %o0],	%l1
	or	%i6,	%o5,	%g5
	set	0x48, %l6
	stxa	%i5,	[%l7 + %l6] 0x81
	nop
	set	0x3C, %o5
	swap	[%l7 + %o5],	%l4
	add	%g1,	%l2,	%o2
	nop
	set	0x74, %o3
	ldub	[%l7 + %o3],	%l5
	and	%i0,	%i4,	%g4
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%g2
	nop
	set	0x1A, %i0
	lduh	[%l7 + %i0],	%g7
	nop
	set	0x78, %i5
	ldsh	[%l7 + %i5],	%i7
	ld	[%l7 + 0x74],	%f17
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%o1
	add	%i3,	%i1,	%o4
	nop
	set	0x5C, %o1
	lduw	[%l7 + %o1],	%l6
	set	0x61, %l1
	stba	%o6,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%o7
	add	%o0,	%l3,	%o3
	set	0x7E, %i7
	stha	%g3,	[%l7 + %i7] 0x88
	nop
	nop
	setx	0x42E641BD9F1B96A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x7B8D3A67B7D1F142,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f12
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x88,	%l0
	set	0x08, %i2
	stxa	%l1,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x50, %g6
	stx	%o5,	[%l7 + %g6]
	nop
	set	0x08, %i3
	stx	%i6,	[%l7 + %i3]
	set	0x1E, %g3
	stha	%i5,	[%l7 + %g3] 0x88
	nop
	set	0x22, %o7
	stb	%l4,	[%l7 + %o7]
	nop
	set	0x10, %l5
	stx	%g5,	[%l7 + %l5]
	nop
	set	0x48, %l4
	ldsb	[%l7 + %l4],	%l2
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%f16
	nop
	set	0x16, %o6
	sth	%o2,	[%l7 + %o6]
	ld	[%l7 + 0x5C],	%f19
	set	0x4A, %i6
	ldstuba	[%l7 + %i6] 0x80,	%g1
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x88,	 4
	bgu,a	%xcc,	loop_21
	nop
	set	0x6C, %g2
	ldsw	[%l7 + %g2],	%l5
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf9
	membar	#Sync
loop_21:
	nop
	set	0x60, %i4
	swapa	[%l7 + %i4] 0x81,	%i4
	nop
	set	0x70, %l2
	prefetch	[%l7 + %l2],	 3
	set	0x1A, %l0
	stha	%g6,	[%l7 + %l0] 0x80
	nop
	set	0x74, %o2
	sth	%g2,	[%l7 + %o2]
	and	%g7,	%g4,	%i2
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x80,	%i7
	set	0x6A, %l6
	stha	%o1,	[%l7 + %l6] 0x80
	set	0x48, %i1
	stwa	%i1,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x70, %o3
	swap	[%l7 + %o3],	%o4
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
	ld	[%l7 + 0x3C],	%f25
	fpsub32	%f20,	%f8,	%f2
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	nop
	set	0x64, %i5
	swap	[%l7 + %i5],	%o6
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f0
	set	0x40, %i0
	stxa	%i3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x80,	 1
	add	%l3,	%o3,	%o7
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x80
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%l0
	or	%g3,	%o5,	%l1
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x88,	%i5
	nop
	set	0x66, %o7
	stb	%l4,	[%l7 + %o7]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
	nop
	set	0x19, %g1
	ldub	[%l7 + %g1],	%i6
	set	0x48, %o6
	stba	%g5,	[%l7 + %o6] 0x80
	nop
	set	0x2C, %i6
	swap	[%l7 + %i6],	%l2
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xca
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%i0
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x89,	%l4
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%o2
	set	0x2C, %l2
	stwa	%g6,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x1A, %g4
	stha	%i4,	[%l7 + %g4] 0x80
	nop
	set	0x3E, %o2
	sth	%g2,	[%l7 + %o2]
	set	0x08, %l0
	lda	[%l7 + %l0] 0x80,	%f7
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x88,	%g4
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	add	%g7,	%i7,	%o1
	set	0x38, %i1
	stda	%o4,	[%l7 + %i1] 0x89
	set	0x20, %o3
	sta	%f8,	[%l7 + %o3] 0x88
	nop
	set	0x30, %o4
	std	%i6,	[%l7 + %o4]
	ld	[%l7 + 0x60],	%f4
	set	0x10, %o5
	stxa	%i1,	[%l7 + %o5] 0x89
	st	%f22,	[%l7 + 0x20]
	set	0x44, %i5
	stwa	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x41, %i0
	stba	%i3,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f0
	nop
	set	0x0E, %l3
	lduh	[%l7 + %l3],	%l3
	nop
	set	0x22, %g5
	lduh	[%l7 + %g5],	%o3
	nop
	set	0x20, %l1
	stx	%o7,	[%l7 + %l1]
	nop
	set	0x1C, %g6
	ldsh	[%l7 + %g6],	%o0
	nop
	set	0x64, %i2
	lduh	[%l7 + %i2],	%g3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%l0
	set	0x20, %i3
	ldda	[%l7 + %i3] 0xea,	%i4
	set	0x44, %o7
	swapa	[%l7 + %o7] 0x88,	%l1
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%l4
	ld	[%l7 + 0x20],	%f12
	nop
	set	0x08, %l5
	std	%g4,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x18]
	set	0x50, %g1
	stda	%l2,	[%l7 + %g1] 0x88
	nop
	set	0x08, %o6
	lduw	[%l7 + %o6],	%i6
	st	%f24,	[%l7 + 0x1C]
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	st	%f9,	[%l7 + 0x34]
	set	0x0C, %i6
	sta	%f13,	[%l7 + %i6] 0x81
	nop
	set	0x44, %g7
	lduw	[%l7 + %g7],	%i0
	fpadd32s	%f8,	%f30,	%f6
	nop
	set	0x28, %i4
	ldsb	[%l7 + %i4],	%o2
	st	%fsr,	[%l7 + 0x2C]
	set	0x40, %l2
	stha	%l5,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	nop
	set	0x49, %g4
	ldsb	[%l7 + %g4],	%i4
	set	0x08, %l0
	stwa	%g6,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x18, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%g2
	nop
	set	0x70, %i1
	stw	%i2,	[%l7 + %i1]
	nop
	set	0x7C, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x80
	set	0x35, %o5
	stba	%i7,	[%l7 + %o5] 0x88
	ld	[%l7 + 0x44],	%f11
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x38, %o4
	lduw	[%l7 + %o4],	%g7
	nop
	set	0x60, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x78, %i5
	std	%f4,	[%l7 + %i5]
	nop
	set	0x1F, %i7
	ldsb	[%l7 + %i7],	%o1
	nop
	set	0x4B, %l3
	ldub	[%l7 + %l3],	%o4
	bg,a	%icc,	loop_22
	or	%l6,	%o6,	%i3
	st	%fsr,	[%l7 + 0x28]
	set	0x60, %o1
	stxa	%i1,	[%l7 + %o1] 0x81
loop_22:
	ba,a,pn	%icc,	loop_23
	st	%f0,	[%l7 + 0x50]
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
loop_23:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o7
	nop
	set	0x6C, %g5
	lduw	[%l7 + %g5],	%o0
	nop
	set	0x14, %g6
	stw	%g3,	[%l7 + %g6]
	set	0x20, %i3
	stha	%o5,	[%l7 + %i3] 0x88
	and	%l0,	%i5,	%l4
	set	0x20, %i2
	sta	%f4,	[%l7 + %i2] 0x89
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	st	%f3,	[%l7 + 0x60]
	nop
	set	0x7C, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x66, %o6
	lduh	[%l7 + %o6],	%l2
	nop
	set	0x60, %g3
	std	%f12,	[%l7 + %g3]
	nop
	set	0x51, %l5
	stb	%l1,	[%l7 + %l5]
	nop
	set	0x30, %g7
	stw	%i6,	[%l7 + %g7]
	nop
	set	0x14, %i4
	prefetch	[%l7 + %i4],	 2
	set	0x10, %l2
	stxa	%g1,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x48, %i6
	stwa	%o2,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x78, %g2
	swapa	[%l7 + %g2] 0x81,	%i0
	fpadd16	%f22,	%f4,	%f12
	set	0x38, %l0
	stwa	%l5,	[%l7 + %l0] 0x80
	set	0x5C, %o2
	stwa	%g6,	[%l7 + %o2] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%g2
	nop
	set	0x38, %g4
	std	%f8,	[%l7 + %g4]
	nop
	set	0x38, %o0
	ldsh	[%l7 + %o0],	%i2
	set	0x1C, %i1
	swapa	[%l7 + %i1] 0x89,	%i4
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f24
	fpsub16	%f10,	%f0,	%f2
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xea,	%i6
	nop
	set	0x14, %o4
	stb	%o1,	[%l7 + %o4]
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%f16
	nop
	set	0x4E, %o5
	ldsh	[%l7 + %o5],	%o4
	nop
	set	0x40, %i5
	sth	%g7,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x14]
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x88,	%o6
	nop
	set	0x17, %i7
	stb	%i3,	[%l7 + %i7]
	set	0x1B, %l1
	stba	%l6,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x58, %g5
	ldx	[%l7 + %g5],	%o3
	or	%l3,	%o7,	%o0
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%o5
	bge,pt	%xcc,	loop_24
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%i5
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x80,	%g5
loop_24:
	nop
	set	0x6E, %o7
	lduh	[%l7 + %o7],	%l4
	nop
	nop
	setx	0x42472B92,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x3E958551,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f30,	%f28
	and	%l1,	%l2,	%i6
	ld	[%l7 + 0x2C],	%f7
	nop
	set	0x16, %g1
	ldsh	[%l7 + %g1],	%o2
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%g1
	st	%f30,	[%l7 + 0x30]
	set	0x10, %o6
	stxa	%l5,	[%l7 + %o6] 0x88
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%g4
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%g6
	nop
	set	0x30, %i4
	swap	[%l7 + %i4],	%g2
	nop
	set	0x78, %g2
	stx	%i4,	[%l7 + %g2]
	nop
	set	0x32, %l0
	ldstub	[%l7 + %l0],	%i7
	st	%f21,	[%l7 + 0x50]
	nop
	set	0x7C, %o2
	stw	%o1,	[%l7 + %o2]
	set	0x7B, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i2
	set	0x78, %o0
	stha	%o4,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	nop
	set	0x78, %o3
	stx	%g7,	[%l7 + %o3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i3
	set	0x30, %l6
	stxa	%l6,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x3C, %o4
	lduw	[%l7 + %o4],	%o3
	nop
	set	0x50, %i0
	ldub	[%l7 + %i0],	%l3
	nop
	set	0x58, %i6
	lduw	[%l7 + %i6],	%o7
	set	0x78, %o5
	stxa	%o0,	[%l7 + %o5] 0x89
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x81,	%i1
	add	%l0,	%g3,	%o5
	add	%g5,	%i5,	%l1
	nop
	set	0x18, %i7
	lduw	[%l7 + %i7],	%l4
	add	%i6,	%o2,	%l2
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%g1
	fpsub32	%f6,	%f26,	%f0
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%l4
	set	0x20, %o1
	stda	%i0,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x6C, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g6
	set	0x30, %g6
	swapa	[%l7 + %g6] 0x80,	%g4
	set	0x20, %o7
	sta	%f31,	[%l7 + %o7] 0x88
	nop
	set	0x54, %g1
	ldsw	[%l7 + %g1],	%g2
	nop
	set	0x78, %l4
	lduh	[%l7 + %l4],	%i4
	ld	[%l7 + 0x18],	%f2
	nop
	set	0x78, %i2
	std	%f0,	[%l7 + %i2]
	st	%f12,	[%l7 + 0x10]
	nop
	set	0x48, %g3
	stx	%i7,	[%l7 + %g3]
	set	0x48, %l5
	stxa	%i2,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x21, %o6
	ldstub	[%l7 + %o6],	%o4
	wr	%o1,	%o6,	%y
	set	0x40, %l2
	swapa	[%l7 + %l2] 0x80,	%g7
	nop
	set	0x6E, %i4
	sth	%i3,	[%l7 + %i4]
	set	0x70, %g2
	stwa	%l6,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x40, %l0
	stda	%l2,	[%l7 + %l0] 0x89
	st	%f13,	[%l7 + 0x38]
	nop
	set	0x30, %o2
	std	%o2,	[%l7 + %o2]
	ld	[%l7 + 0x40],	%f19
	nop
	set	0x70, %g4
	ldx	[%l7 + %g4],	%o0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f16
	set	0x10, %o0
	stxa	%o7,	[%l7 + %o0] 0x80
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x20, %o3
	sta	%f8,	[%l7 + %o3] 0x89
	set	0x62, %o4
	stba	%l0,	[%l7 + %o4] 0x88
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%g3
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%i0
	set	0x78, %o5
	sta	%f14,	[%l7 + %o5] 0x81
	and	%g5,	%i5,	%l1
	nop
	set	0x78, %l3
	ldsw	[%l7 + %l3],	%o5
	set	0x28, %l6
	stda	%l4,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x3C, %i7
	swapa	[%l7 + %i7] 0x88,	%i6
	set	0x34, %g5
	stha	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x50, %i5
	stx	%g1,	[%l7 + %i5]
	set	0x7F, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l5
	nop
	set	0x6C, %o1
	stw	%o2,	[%l7 + %o1]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf9
	membar	#Sync
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x24, %o7
	lduw	[%l7 + %o7],	%i0
	nop
	set	0x7C, %g1
	ldub	[%l7 + %g1],	%g6
	nop
	set	0x60, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x74, %i2
	stwa	%g2,	[%l7 + %i2] 0x80
	nop
	set	0x60, %g3
	stx	%i4,	[%l7 + %g3]
	nop
	set	0x56, %l5
	ldstub	[%l7 + %l5],	%g4
	set	0x48, %l4
	stba	%i2,	[%l7 + %l4] 0x88
	bne,pn	%xcc,	loop_25
	nop
	set	0x68, %l2
	lduw	[%l7 + %l2],	%o4
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f24
	nop
	set	0x64, %g2
	swap	[%l7 + %g2],	%i7
loop_25:
	nop
	set	0x50, %l0
	lda	[%l7 + %l0] 0x80,	%f7
	set	0x64, %o2
	sta	%f22,	[%l7 + %o2] 0x88
	ld	[%l7 + 0x2C],	%f5
	set	0x7C, %i4
	stba	%o6,	[%l7 + %i4] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	fpsub16s	%f17,	%f25,	%f29
	or	%o1,	%i3,	%g7
	set	0x0A, %g7
	stha	%l3,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x70, %o0
	std	%o2,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x5C]
	ld	[%l7 + 0x58],	%f17
	bge,a,pt	%icc,	loop_26
	ble	%xcc,	loop_27
	nop
	set	0x57, %g4
	ldub	[%l7 + %g4],	%o0
	or	%o7,	%l0,	%l6
loop_26:
	ld	[%l7 + 0x60],	%f27
loop_27:
	st	%f8,	[%l7 + 0x24]
	set	0x70, %o3
	stxa	%g3,	[%l7 + %o3] 0x80
	and	%i1,	%i5,	%l1
	add	%g5,	%l4,	%i6
	be,a	%xcc,	loop_28
	nop
	set	0x48, %o4
	stx	%o5,	[%l7 + %o4]
	or	%l2,	%l5,	%o2
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x88,	%i0
loop_28:
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%g1
	wr	%g6,	%g2,	%softint
	nop
	set	0x34, %i0
	swap	[%l7 + %i0],	%i4
	nop
	set	0x44, %o5
	swap	[%l7 + %o5],	%i2
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f8
	nop
	set	0x3C, %l3
	sth	%o4,	[%l7 + %l3]
	add	%i7,	%g4,	%o6
	and	%i3,	%g7,	%o1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f16
	set	0x08, %g5
	stda	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x50, %l1
	stxa	%o0,	[%l7 + %l1] 0x81
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	set	0x4C, %o1
	stb	%o7,	[%l7 + %o1]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xd2
	nop
	set	0x09, %g1
	ldstub	[%l7 + %g1],	%l0
	add	%g3,	%l6,	%i5
	and	%i1,	%l1,	%l4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	nop
	set	0x50, %i3
	lduw	[%l7 + %i3],	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x4C, %i2
	swapa	[%l7 + %i2] 0x80,	%l5
	set	0x2C, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l2
	nop
	set	0x10, %l4
	lduh	[%l7 + %l4],	%o2
	ld	[%l7 + 0x1C],	%f25
	nop
	set	0x10, %l2
	ldsh	[%l7 + %l2],	%i0
	set	0x70, %o6
	stda	%g0,	[%l7 + %o6] 0x80
	add	%g6,	%i4,	%g2
	nop
	set	0x18, %g2
	ldx	[%l7 + %g2],	%i2
	set	0x08, %l5
	stxa	%o4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x68, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x30, %i4
	ldstub	[%l7 + %i4],	%i7
	ld	[%l7 + 0x38],	%f1
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%i3
	nop
	set	0x70, %g7
	std	%g6,	[%l7 + %g7]
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%o1
	nop
	set	0x26, %o0
	sth	%l3,	[%l7 + %o0]
	fpsub16s	%f27,	%f15,	%f29
	set	0x70, %o3
	swapa	[%l7 + %o3] 0x80,	%o0
	add	%o6,	%o7,	%l0
	nop
	set	0x48, %i1
	lduh	[%l7 + %i1],	%o3
	nop
	set	0x1C, %i6
	ldsh	[%l7 + %i6],	%g3
	set	0x38, %o4
	lda	[%l7 + %o4] 0x81,	%f8
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f16
	nop
	set	0x40, %l6
	std	%i4,	[%l7 + %l6]
	set	0x52, %o5
	stha	%l6,	[%l7 + %o5] 0x89
	st	%f21,	[%l7 + 0x18]
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	and	%l4,	%i6,	%o5
	set	0x68, %g5
	ldxa	[%l7 + %g5] 0x80,	%i1
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%l4
	nop
	set	0x0B, %l1
	ldub	[%l7 + %l1],	%l2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%i0
	set	0x20, %i5
	stxa	%o2,	[%l7 + %i5] 0x80
	nop
	nop
	setx	0x133DB4BDDBDA905E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0957CA57AD820112,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f14,	%f2
	nop
	set	0x3C, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x6D, %o1
	stb	%g1,	[%l7 + %o1]
	set	0x14, %g1
	swapa	[%l7 + %g1] 0x88,	%g6
	nop
	set	0x2A, %i3
	lduh	[%l7 + %i3],	%g2
	nop
	set	0x40, %g6
	ldsh	[%l7 + %g6],	%i4
	and	%i2,	%o4,	%g4
	nop
	set	0x6D, %g3
	ldub	[%l7 + %g3],	%i7
	nop
	set	0x18, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x53, %l2
	ldub	[%l7 + %l2],	%i3
	nop
	set	0x3C, %l4
	lduw	[%l7 + %l4],	%o1
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x88,	%g7
	nop
	set	0x6C, %l5
	ldsh	[%l7 + %l5],	%l3
	nop
	set	0x58, %g2
	std	%o0,	[%l7 + %g2]
	set	0x14, %i4
	swapa	[%l7 + %i4] 0x89,	%o7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	or	%l0,	%o6,	%o3
	nop
	set	0x10, %l0
	lduh	[%l7 + %l0],	%i5
	nop
	set	0x39, %g4
	ldsb	[%l7 + %g4],	%l6
	ld	[%l7 + 0x40],	%f28
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%g3
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	nop
	set	0x38, %o3
	ldsw	[%l7 + %o3],	%l1
	nop
	set	0x30, %i1
	swap	[%l7 + %i1],	%i6
	set	0x28, %i6
	stda	%o4,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x7C, %i0
	stwa	%i1,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%l4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f0
	nop
	set	0x58, %l3
	stb	%l2,	[%l7 + %l3]
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%g5
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%l4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f0
	set	0x1C, %o5
	sta	%f26,	[%l7 + %o5] 0x80
	nop
	set	0x64, %o7
	ldsw	[%l7 + %o7],	%o2
	set	0x2F, %i5
	stba	%i0,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x30, %o1
	stw	%g6,	[%l7 + %o1]
	nop
	set	0x60, %g1
	stw	%g1,	[%l7 + %g1]
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x80,	 1
	set	0x1B, %g3
	ldstuba	[%l7 + %g3] 0x81,	%i4
	set	0x6C, %i3
	stwa	%i2,	[%l7 + %i3] 0x89
	and	%o4,	%g4,	%i7
	set	0x30, %l2
	lda	[%l7 + %l2] 0x80,	%f12
	nop
	set	0x2C, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%i2
	set	0x0C, %o6
	lda	[%l7 + %o6] 0x81,	%f18
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x81,	%o1
	nop
	nop
	setx	0xF82714BA302030CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x32BA45FAC86161D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f26,	%f22
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 0
	set	0x0A, %o2
	stha	%g7,	[%l7 + %o2] 0xeb
	membar	#Sync
	fpadd32	%f24,	%f10,	%f10
	set	0x4C, %i4
	stha	%o0,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x74, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x39, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l3
	set	0x60, %g7
	stwa	%o7,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x68, %o3
	stwa	%l0,	[%l7 + %o3] 0x80
	nop
	set	0x2C, %g4
	prefetch	[%l7 + %g4],	 1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%o6
	set	0x5C, %i6
	stba	%i5,	[%l7 + %i6] 0xeb
	membar	#Sync
	or	%l6,	%g3,	%i6
	set	0x5E, %i0
	stha	%l1,	[%l7 + %i0] 0x80
	st	%f8,	[%l7 + 0x08]
	nop
	set	0x48, %i1
	lduh	[%l7 + %i1],	%i1
	nop
	set	0x78, %l6
	stx	%l4,	[%l7 + %l6]
	or	%l2,	%o5,	%l5
	nop
	set	0x6A, %l3
	sth	%g5,	[%l7 + %l3]
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%o2
	set	0x50, %i7
	sta	%f12,	[%l7 + %i7] 0x80
	wr	%g6,	%g1,	%clear_softint
	add	%g2,	%i0,	%i4
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x80,	%o4
	or	%g4,	%i7,	%i2
	nop
	set	0x58, %l1
	stx	%o1,	[%l7 + %l1]
	nop
	set	0x48, %o7
	swap	[%l7 + %o7],	%g7
	nop
	set	0x60, %i5
	std	%f16,	[%l7 + %i5]
	set	0x1C, %o5
	stwa	%o0,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x38, %g1
	ldsh	[%l7 + %g1],	%l3
	add	%o7,	%i3,	%o3
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x89,	%l0
	st	%f2,	[%l7 + 0x0C]
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x80,	 4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x28, %i3
	stx	%l6,	[%l7 + %i3]
	fpadd16	%f24,	%f8,	%f24
	set	0x19, %l2
	stba	%g3,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x88,	%i6
	set	0x38, %l4
	stda	%i4,	[%l7 + %l4] 0x88
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f14
	set	0x68, %l5
	stxa	%i1,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x48, %o6
	stxa	%l4,	[%l7 + %o6] 0x88
	nop
	set	0x1C, %o2
	stw	%l2,	[%l7 + %o2]
	set	0x74, %i4
	stha	%l1,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x10, %g2
	std	%f0,	[%l7 + %g2]
	nop
	set	0x30, %o0
	prefetch	[%l7 + %o0],	 0
	nop
	set	0x50, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x3E, %o3
	lduh	[%l7 + %o3],	%o5
	set	0x1C, %g4
	sta	%f17,	[%l7 + %g4] 0x88
	nop
	set	0x5C, %l0
	prefetch	[%l7 + %l0],	 4
	fpsub32	%f26,	%f30,	%f20
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%l5
	st	%fsr,	[%l7 + 0x30]
	and	%o2,	%g5,	%g1
	set	0x74, %i0
	stba	%g2,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x6C, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x48, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x24, %i7
	stw	%i0,	[%l7 + %i7]
	set	0x60, %l3
	stwa	%g6,	[%l7 + %l3] 0xe2
	membar	#Sync
	ld	[%l7 + 0x24],	%f3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f0
	nop
	set	0x48, %o7
	stx	%i4,	[%l7 + %o7]
	set	0x38, %l1
	sta	%f9,	[%l7 + %l1] 0x89
	and	%o4,	%g4,	%i7
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f0
	nop
	set	0x5C, %g1
	swap	[%l7 + %g1],	%i2
	nop
	set	0x76, %i5
	ldub	[%l7 + %i5],	%g7
	and	%o1,	%l3,	%o0
	set	0x57, %g6
	stba	%i3,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x48, %i3
	stx	%o7,	[%l7 + %i3]
	nop
	set	0x50, %l2
	std	%f18,	[%l7 + %l2]
	nop
	set	0x4C, %o1
	stw	%o3,	[%l7 + %o1]
	nop
	set	0x28, %g3
	std	%l0,	[%l7 + %g3]
	or	%o6,	%g3,	%i6
	nop
	set	0x15, %l4
	ldstub	[%l7 + %l4],	%l6
	nop
	set	0x38, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x5C, %o6
	swap	[%l7 + %o6],	%i1
	set	0x24, %o2
	stwa	%i5,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x49, %i2
	stba	%l4,	[%l7 + %i2] 0x81
	set	0x59, %i4
	stba	%l2,	[%l7 + %i4] 0x81
	nop
	set	0x54, %g2
	ldsh	[%l7 + %g2],	%o5
	set	0x5A, %o0
	ldstuba	[%l7 + %o0] 0x81,	%l5
	set	0x5E, %g7
	stha	%l1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%g4
	bgu	%xcc,	loop_29
	st	%f16,	[%l7 + 0x0C]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o2
loop_29:
	ld	[%l7 + 0x58],	%f28
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%g2
	nop
	set	0x17, %g4
	ldstub	[%l7 + %g4],	%g6
	nop
	set	0x50, %i1
	stx	%i0,	[%l7 + %i1]
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%f12
	nop
	set	0x59, %i0
	ldsb	[%l7 + %i0],	%o4
	set	0x7A, %g5
	stba	%i4,	[%l7 + %g5] 0xeb
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%i7
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	set	0x60, %l3
	sta	%f29,	[%l7 + %l3] 0x89
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f6
	set	0x19, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o1
	nop
	set	0x10, %l1
	std	%f24,	[%l7 + %l1]
	ld	[%l7 + 0x58],	%f21
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	and	%i2,	%o0,	%l3
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%o7
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%f2
	nop
	set	0x30, %i5
	sth	%o3,	[%l7 + %i5]
	nop
	set	0x3C, %g6
	ldsw	[%l7 + %g6],	%l0
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x62, %i3
	ldsb	[%l7 + %i3],	%o6
	wr	%i6,	%g3,	%ccr
	nop
	set	0x74, %o1
	lduh	[%l7 + %o1],	%l6
	add	%i1,	%i5,	%l2
	nop
	set	0x42, %l2
	sth	%o5,	[%l7 + %l2]
	nop
	set	0x68, %l4
	std	%f4,	[%l7 + %l4]
	bge,pn	%icc,	loop_30
	and	%l4,	%l1,	%g5
	nop
	set	0x2B, %l5
	ldub	[%l7 + %l5],	%l5
	nop
	set	0x4E, %o6
	sth	%g1,	[%l7 + %o6]
loop_30:
	nop
	set	0x69, %o2
	stba	%o2,	[%l7 + %o2] 0x89
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc8
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xda
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f16
	or	%g6,	%g2,	%i0
	set	0x39, %o0
	stba	%o4,	[%l7 + %o0] 0x80
	or	%i4,	%i7,	%g4
	nop
	nop
	setx	0x8D62FF2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9EA2DB65,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f24,	%f9
	set	0x1D, %g7
	stba	%g7,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	nop
	set	0x31, %g4
	ldstub	[%l7 + %g4],	%l3
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x81,	%i2
	set	0x7E, %l0
	stba	%i3,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x68, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x78, %i6
	lda	[%l7 + %i6] 0x80,	%f12
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x81,	%o3
	nop
	set	0x18, %o4
	std	%f2,	[%l7 + %o4]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xea,	%l0
	nop
	set	0x14, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x08, %l1
	std	%f16,	[%l7 + %l1]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f16
	nop
	set	0x60, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%o6
	set	0x37, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i6
	nop
	set	0x78, %i3
	stx	%o7,	[%l7 + %i3]
	nop
	set	0x50, %o1
	stw	%l6,	[%l7 + %o1]
	set	0x58, %g6
	stxa	%i1,	[%l7 + %g6] 0x88
	fpadd16	%f14,	%f14,	%f18
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f0
	nop
	set	0x40, %l5
	std	%f22,	[%l7 + %l5]
	st	%f8,	[%l7 + 0x24]
	nop
	set	0x0C, %l4
	lduh	[%l7 + %l4],	%g3
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd2
	nop
	set	0x13, %g3
	ldub	[%l7 + %g3],	%l2
	set	0x4A, %o6
	stba	%i5,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x80,	%o5
	nop
	set	0x64, %o0
	stw	%l4,	[%l7 + %o0]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%l1
	st	%fsr,	[%l7 + 0x14]
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x88,	%g1
	or	%l5,	%o2,	%g2
	set	0x40, %i2
	stxa	%g6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%i0
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%o4
	nop
	set	0x78, %g4
	std	%i6,	[%l7 + %g4]
	nop
	set	0x28, %i1
	stx	%i4,	[%l7 + %i1]
	nop
	set	0x09, %i0
	ldub	[%l7 + %i0],	%g4
	fpsub32	%f4,	%f2,	%f16
	nop
	set	0x78, %i6
	lduw	[%l7 + %i6],	%o1
	set	0x50, %g5
	stda	%g6,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x18, %l0
	stxa	%l3,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x48, %o4
	lda	[%l7 + %o4] 0x88,	%f28
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%o0
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x89,	%o3
	ld	[%l7 + 0x48],	%f3
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%i3
	set	0x40, %o5
	lda	[%l7 + %o5] 0x81,	%f24
	st	%fsr,	[%l7 + 0x60]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l0
	set	0x38, %l6
	stda	%o6,	[%l7 + %l6] 0x80
	nop
	set	0x22, %i5
	lduh	[%l7 + %i5],	%l6
	or	%i1,	%i6,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%l2
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xea,	%o4
	nop
	set	0x76, %l1
	stb	%l4,	[%l7 + %l1]
	nop
	set	0x60, %o1
	ldsw	[%l7 + %o1],	%l1
	and	%g5,	%g1,	%o2
	nop
	set	0x10, %g6
	prefetch	[%l7 + %g6],	 2
	set	0x48, %i3
	stda	%g2,	[%l7 + %i3] 0x80
	set	0x0C, %l5
	stba	%l5,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%o4
	nop
	set	0x38, %l4
	ldsw	[%l7 + %l4],	%g6
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc2
	fpsub32s	%f28,	%f21,	%f19
	nop
	set	0x50, %l2
	std	%f30,	[%l7 + %l2]
	nop
	set	0x64, %g3
	ldsw	[%l7 + %g3],	%i4
	set	0x7C, %o6
	sta	%f15,	[%l7 + %o6] 0x88
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%g4
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%i6
	nop
	set	0x60, %i2
	stw	%o1,	[%l7 + %i2]
	set	0x48, %o3
	ldxa	[%l7 + %o3] 0x80,	%l3
	nop
	set	0x3F, %g7
	ldstub	[%l7 + %g7],	%g7
	nop
	set	0x7A, %g4
	ldub	[%l7 + %g4],	%o0
	nop
	set	0x58, %i1
	ldsw	[%l7 + %i1],	%i2
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%o3
	nop
	set	0x18, %i0
	swap	[%l7 + %i0],	%o6
	nop
	set	0x60, %g5
	std	%l0,	[%l7 + %g5]
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%o6
	set	0x30, %o4
	stba	%l6,	[%l7 + %o4] 0x89
	nop
	set	0x58, %i6
	std	%f16,	[%l7 + %i6]
	and	%i1,	%i3,	%g3
	set	0x68, %l3
	swapa	[%l7 + %l3] 0x89,	%i6
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%l2
	set	0x10, %i7
	swapa	[%l7 + %i7] 0x88,	%o5
	nop
	set	0x20, %o5
	swap	[%l7 + %o5],	%l4
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x80,	%l1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd8,	%f16
	nop
	set	0x37, %l1
	ldsb	[%l7 + %l1],	%g5
	nop
	set	0x3C, %o1
	ldsh	[%l7 + %o1],	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g1
	nop
	set	0x30, %l6
	ldsh	[%l7 + %l6],	%l5
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%o4
	nop
	set	0x4E, %l5
	sth	%g6,	[%l7 + %l5]
	set	0x10, %i3
	stxa	%g2,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x3A, %l4
	sth	%i4,	[%l7 + %l4]
	set	0x24, %l2
	swapa	[%l7 + %l2] 0x89,	%g4
	set	0x10, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o1
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x80,	%i7
	set	0x48, %o0
	stda	%g6,	[%l7 + %o0] 0xea
	membar	#Sync
	add	%o0,	%l3,	%i2
	nop
	set	0x1C, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o6
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x88,	%l0
	st	%f24,	[%l7 + 0x24]
	st	%f21,	[%l7 + 0x6C]
	fpsub32	%f26,	%f30,	%f18
	nop
	set	0x1C, %g7
	stw	%o7,	[%l7 + %g7]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	nop
	set	0x48, %i1
	prefetch	[%l7 + %i1],	 1
	be,a,pn	%xcc,	loop_31
	nop
	set	0x6D, %i4
	ldsb	[%l7 + %i4],	%i1
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x81,	%i3
loop_31:
	nop
	set	0x1C, %i0
	swap	[%l7 + %i0],	%g3
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%l6
	nop
	set	0x28, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%l2
	set	0x0F, %o7
	stba	%l4,	[%l7 + %o7] 0x89
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%l1
	set	0x38, %o5
	sta	%f18,	[%l7 + %o5] 0x88
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	nop
	set	0x38, %l3
	lduh	[%l7 + %l3],	%g5
	nop
	set	0x18, %l1
	std	%f30,	[%l7 + %l1]
	fpsub16s	%f25,	%f22,	%f24
	nop
	set	0x20, %o1
	std	%f8,	[%l7 + %o1]
	nop
	set	0x60, %g1
	stx	%i5,	[%l7 + %g1]
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xea,	%o4
	nop
	set	0x34, %l6
	stw	%g1,	[%l7 + %l6]
	set	0x26, %l5
	stba	%l5,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x54, %i3
	stwa	%o2,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%i0
	nop
	set	0x0B, %l4
	stb	%o4,	[%l7 + %l4]
	st	%f8,	[%l7 + 0x7C]
	or	%g2,	%i4,	%g4
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x80,	%o1
	or	%g6,	%g7,	%o0
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x80,	%l3
	nop
	set	0x40, %o2
	ldub	[%l7 + %o2],	%i2
	fpsub32s	%f10,	%f0,	%f14
	set	0x48, %i2
	swapa	[%l7 + %i2] 0x89,	%i7
	st	%f12,	[%l7 + 0x20]
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x89,	%o6
	set	0x60, %g7
	prefetcha	[%l7 + %g7] 0x81,	 4
	set	0x15, %o6
	ldstuba	[%l7 + %o6] 0x88,	%l0
	nop
	set	0x64, %g4
	ldstub	[%l7 + %g4],	%i1
	nop
	set	0x4A, %i1
	sth	%i3,	[%l7 + %i1]
	nop
	set	0x0C, %i4
	ldsw	[%l7 + %i4],	%o7
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%i6
	nop
	set	0x22, %l0
	stb	%g3,	[%l7 + %l0]
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%l2
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x80,	%l4
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x81,	 2
	and	%g5,	%i5,	%l6
	nop
	set	0x16, %g5
	ldsh	[%l7 + %g5],	%g1
	nop
	set	0x38, %i7
	ldub	[%l7 + %i7],	%l5
	nop
	set	0x2C, %o5
	stw	%o5,	[%l7 + %o5]
	add	%i0,	%o2,	%g2
	fpsub16s	%f20,	%f11,	%f17
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x5D, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o4
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%g4
	set	0x5C, %l3
	sta	%f22,	[%l7 + %l3] 0x80
	nop
	set	0x30, %o1
	lduh	[%l7 + %o1],	%i4
	add	%g6,	%o1,	%g7
	set	0x18, %g6
	stda	%l2,	[%l7 + %g6] 0x89
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f0
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	ba,a,pt	%xcc,	loop_32
	nop
	set	0x40, %l5
	ldsh	[%l7 + %l5],	%i2
	and	%o0,	%o6,	%o3
	nop
	set	0x35, %i3
	stb	%i7,	[%l7 + %i3]
loop_32:
	nop
	set	0x70, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x64, %l4
	stw	%l0,	[%l7 + %l4]
	set	0x28, %o0
	stda	%i2,	[%l7 + %o0] 0x88
	set	0x48, %g3
	ldxa	[%l7 + %g3] 0x81,	%o7
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x14, %o2
	sta	%f27,	[%l7 + %o2] 0x89
	nop
	set	0x3A, %g2
	sth	%i1,	[%l7 + %g2]
	fpadd32s	%f3,	%f23,	%f30
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%i6
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x80,	%f11
	nop
	set	0x67, %g4
	ldub	[%l7 + %g4],	%l2
	nop
	set	0x4D, %i4
	ldstub	[%l7 + %i4],	%g3
	fpsub32s	%f17,	%f3,	%f31
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%l1
	wr	%l4,	%g5,	%softint
	set	0x60, %l0
	stda	%i4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x24, %i0
	ldsb	[%l7 + %i0],	%g1
	add	%l5,	%o5,	%i0
	set	0x4C, %o4
	lda	[%l7 + %o4] 0x88,	%f17
	ble,a	%icc,	loop_33
	add	%l6,	%o2,	%g2
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%o4
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f0
loop_33:
	nop
	set	0x2D, %g5
	ldstub	[%l7 + %g5],	%g4
	nop
	set	0x79, %i7
	ldsb	[%l7 + %i7],	%g6
	nop
	set	0x16, %o5
	lduh	[%l7 + %o5],	%o1
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%g7
	nop
	set	0x52, %l1
	ldstub	[%l7 + %l1],	%i4
	or	%i2,	%l3,	%o0
	set	0x20, %l3
	stxa	%o6,	[%l7 + %l3] 0x80
	nop
	set	0x78, %o7
	stx	%i7,	[%l7 + %o7]
	set	0x08, %o1
	stxa	%o3,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x24, %g6
	swap	[%l7 + %g6],	%i3
	nop
	set	0x5A, %l6
	sth	%l0,	[%l7 + %l6]
	and	%o7,	%i6,	%i1
	set	0x58, %g1
	stxa	%l2,	[%l7 + %g1] 0x81
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x81,	 1
	nop
	set	0x6B, %l2
	ldsb	[%l7 + %l2],	%l4
	nop
	set	0x35, %i3
	ldub	[%l7 + %i3],	%g5
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x58, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x80,	%i4
	add	%g1,	%l1,	%l5
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe3,	%i0
	nop
	set	0x20, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x68, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x10, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l6
	st	%f10,	[%l7 + 0x74]
	nop
	set	0x50, %g4
	std	%f4,	[%l7 + %g4]
	st	%f22,	[%l7 + 0x54]
	nop
	set	0x30, %o6
	stw	%o2,	[%l7 + %o6]
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%g2
	set	0x7C, %l0
	sta	%f29,	[%l7 + %l0] 0x89
	set	0x6A, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o5
	nop
	set	0x4C, %o4
	ldsw	[%l7 + %o4],	%g4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%o4
	or	%g6,	%o1,	%g7
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%i2
	and	%l3,	%o0,	%i4
	nop
	set	0x30, %i6
	swap	[%l7 + %i6],	%i7
	nop
	set	0x34, %g5
	stb	%o6,	[%l7 + %g5]
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x33, %o5
	ldstub	[%l7 + %o5],	%o3
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x29, %i5
	ldsb	[%l7 + %i5],	%o7
	st	%fsr,	[%l7 + 0x78]
	set	0x38, %o7
	stha	%i6,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x76, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l0
	nop
	set	0x70, %l3
	prefetch	[%l7 + %l3],	 3
	st	%f23,	[%l7 + 0x10]
	nop
	set	0x39, %g6
	ldsb	[%l7 + %g6],	%i1
	st	%f31,	[%l7 + 0x64]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%l4
	ld	[%l7 + 0x44],	%f14
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	nop
	set	0x24, %l5
	lduh	[%l7 + %l5],	%i5
	nop
	set	0x18, %g1
	std	%g0,	[%l7 + %g1]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x89,	%l1
	st	%f26,	[%l7 + 0x50]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%g4
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f30
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%i0
	nop
	set	0x10, %i2
	std	%f24,	[%l7 + %i2]
	nop
	set	0x28, %o2
	std	%f22,	[%l7 + %o2]
	nop
	set	0x69, %g2
	stb	%l5,	[%l7 + %g2]
	nop
	set	0x70, %g3
	stw	%l6,	[%l7 + %g3]
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%f0
	nop
	set	0x28, %o6
	std	%f14,	[%l7 + %o6]
	nop
	set	0x6A, %g4
	ldsh	[%l7 + %g4],	%o2
	nop
	set	0x41, %i4
	ldsb	[%l7 + %i4],	%o5
	nop
	set	0x5A, %i0
	ldsh	[%l7 + %i0],	%g4
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f0
	nop
	set	0x1C, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x31, %l0
	ldstub	[%l7 + %l0],	%g2
	set	0x18, %i6
	stda	%g6,	[%l7 + %i6] 0x89
	set	0x30, %o3
	stha	%o1,	[%l7 + %o3] 0x80
	nop
	set	0x54, %i7
	stw	%g7,	[%l7 + %i7]
	nop
	set	0x72, %g5
	stb	%o4,	[%l7 + %g5]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xc0
	set	0x38, %o5
	swapa	[%l7 + %o5] 0x89,	%i2
	set	0x7F, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o0
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	or	%i4,	%i7,	%l3
	nop
	set	0x24, %i5
	lduw	[%l7 + %i5],	%o3
	add	%o6,	%i3,	%o7
	and	%i6,	%i1,	%l0
	set	0x3C, %l3
	ldstuba	[%l7 + %l3] 0x81,	%g3
	add	%l4,	%i5,	%l2
	set	0x74, %l6
	lda	[%l7 + %l6] 0x81,	%f22
	set	0x68, %l5
	prefetcha	[%l7 + %l5] 0x88,	 0
	fpadd32	%f6,	%f16,	%f26
	set	0x61, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g5
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l1
	nop
	set	0x0B, %l2
	ldstub	[%l7 + %l2],	%i0
	nop
	set	0x32, %o0
	lduh	[%l7 + %o0],	%l5
	nop
	set	0x38, %l4
	std	%f28,	[%l7 + %l4]
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f28
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x80
	and	%o2,	%o5,	%g4
	or	%l6,	%g2,	%g6
	or	%g7,	%o1,	%o4
	set	0x16, %o2
	stha	%i2,	[%l7 + %o2] 0x80
	ld	[%l7 + 0x08],	%f8
	st	%f7,	[%l7 + 0x50]
	nop
	set	0x4F, %g3
	ldstub	[%l7 + %g3],	%o0
	set	0x42, %g2
	stha	%i4,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x08, %g7
	std	%l2,	[%l7 + %g7]
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x81,	%o3
	nop
	set	0x38, %i4
	ldstub	[%l7 + %i4],	%i7
	wr 	%g0, 	0x5, 	%fprs
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x81,	%i6
	nop
	set	0x08, %o6
	std	%f10,	[%l7 + %o6]
	nop
	set	0x68, %o4
	stx	%o7,	[%l7 + %o4]
	nop
	set	0x48, %i1
	stx	%l0,	[%l7 + %i1]
	set	0x68, %i6
	stxa	%g3,	[%l7 + %i6] 0xe3
	membar	#Sync
	fpadd16s	%f30,	%f25,	%f22
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x88,	%f10
	nop
	set	0x78, %i7
	std	%l4,	[%l7 + %i7]
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x81,	%f16
	nop
	set	0x3B, %l1
	ldstub	[%l7 + %l1],	%i5
	wr 	%g0, 	0x6, 	%fprs
	fpsub32s	%f16,	%f14,	%f8
	nop
	set	0x1A, %l0
	ldstub	[%l7 + %l0],	%g1
	fpadd32	%f16,	%f24,	%f26
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	nop
	set	0x58, %o7
	std	%f24,	[%l7 + %o7]
	set	0x58, %l3
	stxa	%g5,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x44, %i5
	ldstuba	[%l7 + %i5] 0x80,	%l1
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	nop
	set	0x68, %g6
	ldsb	[%l7 + %g6],	%l5
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f10
	nop
	set	0x65, %l2
	ldsb	[%l7 + %l2],	%i0
	ld	[%l7 + 0x60],	%f23
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%o2
	nop
	set	0x34, %o0
	ldub	[%l7 + %o0],	%g4
	and	%o5,	%l6,	%g2
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x89,	%g7
	set	0x25, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o1
	nop
	set	0x54, %i2
	ldsb	[%l7 + %i2],	%o4
	set	0x6E, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g6
	nop
	set	0x18, %o2
	stx	%i2,	[%l7 + %o2]
	and	%i4,	%o0,	%o3
	ld	[%l7 + 0x4C],	%f6
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%l3
	add	%i3,	%o6,	%i7
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%o7
	fpsub16	%f4,	%f20,	%f26
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%i6
	set	0x68, %g2
	sta	%f8,	[%l7 + %g2] 0x89
	nop
	set	0x40, %i4
	lduw	[%l7 + %i4],	%l4
	add	%i5,	%i1,	%l2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g3
	add	%g5,	%l1,	%l5
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x89,	%g1
	nop
	set	0x30, %i6
	std	%f16,	[%l7 + %i6]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc4
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x89,	 4
	or	%g4,	%o5,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%o2
	nop
	set	0x4A, %g5
	sth	%g7,	[%l7 + %g5]
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x80,	%o4
	nop
	set	0x42, %l1
	ldsb	[%l7 + %l1],	%o1
	nop
	set	0x58, %l0
	lduw	[%l7 + %l0],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%o0
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xd8
	nop
	set	0x48, %o7
	stw	%g6,	[%l7 + %o7]
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x81,	 0
	nop
	set	0x48, %i5
	std	%f26,	[%l7 + %i5]
	ld	[%l7 + 0x58],	%f6
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 1
	fpsub16	%f8,	%f20,	%f6
	set	0x40, %l6
	stxa	%i3,	[%l7 + %l6] 0x80
	nop
	set	0x5C, %g6
	ldub	[%l7 + %g6],	%o3
	nop
	set	0x1C, %l2
	ldsh	[%l7 + %l2],	%o6
	nop
	set	0x38, %l5
	ldsb	[%l7 + %l5],	%o7
	set	0x60, %o0
	sta	%f29,	[%l7 + %o0] 0x89
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%i7
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x89,	%l4
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%i6
	and	%i5,	%l2,	%g3
	nop
	set	0x40, %l4
	std	%f22,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x7C]
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x81,	 4
	nop
	set	0x14, %i2
	sth	%i1,	[%l7 + %i2]
	nop
	set	0x40, %g7
	swap	[%l7 + %g7],	%l5
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%f18
	set	0x18, %o2
	swapa	[%l7 + %o2] 0x89,	%l1
	or	%g1,	%i0,	%o5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g2
	add	%o2,	%g7,	%o4
	set	0x4C, %g2
	stwa	%g4,	[%l7 + %g2] 0x81
	nop
	set	0x59, %o6
	ldub	[%l7 + %o6],	%i2
	nop
	set	0x48, %o4
	std	%f0,	[%l7 + %o4]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%o0
	set	0x78, %i4
	stwa	%g6,	[%l7 + %i4] 0x89
	nop
	set	0x26, %i0
	lduh	[%l7 + %i0],	%i4
	nop
	set	0x76, %i6
	sth	%l3,	[%l7 + %i6]
	set	0x34, %o3
	stwa	%i3,	[%l7 + %o3] 0x80
	nop
	set	0x78, %g5
	stx	%o6,	[%l7 + %g5]
	nop
	set	0x60, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x3D, %l1
	stb	%o3,	[%l7 + %l1]
	nop
	set	0x5B, %l0
	ldstub	[%l7 + %l0],	%o7
	set	0x78, %o5
	sta	%f3,	[%l7 + %o5] 0x81
	set	0x58, %o7
	ldxa	[%l7 + %o7] 0x80,	%i7
	nop
	set	0x20, %l3
	sth	%l0,	[%l7 + %l3]
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%l2
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x89,	%g2
	nop
	set	0x11, %g6
	ldub	[%l7 + %g6],	%i1
	set	0x30, %l2
	stxa	%l5,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x88,	%g5
	nop
	set	0x28, %i3
	ldstub	[%l7 + %i3],	%g1
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%l6
	nop
	nop
	setx	0x2DB8BF9D6F96831E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x3E6C63D8A2F9A2C6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f16,	%f16
	add	%i0,	%o2,	%g7
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x7D, %l4
	ldstub	[%l7 + %l4],	%o4
	nop
	set	0x37, %g3
	ldstub	[%l7 + %g3],	%g2
	set	0x60, %g1
	prefetcha	[%l7 + %g1] 0x80,	 4
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x89,	%g4
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%o0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x74, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o1
	ld	[%l7 + 0x58],	%f29
	nop
	set	0x7C, %o2
	swap	[%l7 + %o2],	%i3
	set	0x48, %g2
	lda	[%l7 + %g2] 0x80,	%f23
	fpsub32s	%f8,	%f19,	%f23
	set	0x18, %o4
	stda	%o6,	[%l7 + %o4] 0x89
	nop
	set	0x2C, %o6
	ldsw	[%l7 + %o6],	%l3
	add	%o3,	%i7,	%l0
	set	0x48, %i4
	stwa	%o7,	[%l7 + %i4] 0xeb
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%i6
	wr	%i5,	%g3,	%clear_softint
	wr	%l2,	%l5,	%set_softint
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%i1
	ble,pn	%xcc,	loop_34
	nop
	set	0x24, %i6
	ldsh	[%l7 + %i6],	%g5
	ld	[%l7 + 0x74],	%f24
	nop
	set	0x08, %o3
	stx	%l1,	[%l7 + %o3]
loop_34:
	nop
	set	0x74, %i7
	sta	%f7,	[%l7 + %i7] 0x89
	and	%o5,	%l6,	%g1
	wr	%i0,	%g7,	%ccr
	nop
	set	0x54, %l1
	prefetch	[%l7 + %l1],	 2
	and	%o2,	%o4,	%i2
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x80,	%g2
	nop
	set	0x6C, %l0
	ldsw	[%l7 + %l0],	%o0
	or	%g4,	%g6,	%i4
	nop
	set	0x10, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x4C, %o7
	lda	[%l7 + %o7] 0x88,	%f0
	nop
	set	0x0C, %o1
	stb	%o1,	[%l7 + %o1]
	set	0x5B, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o6
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f28
	or	%l3,	%i7,	%l0
	nop
	set	0x77, %g6
	stb	%o3,	[%l7 + %g6]
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%o7
	set	0x45, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i6
	set	0x18, %i5
	stha	%i5,	[%l7 + %i5] 0x81
	set	0x39, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g3
	nop
	set	0x65, %l4
	ldsb	[%l7 + %l4],	%l2
	set	0x12, %i3
	stba	%l4,	[%l7 + %i3] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%i1
	nop
	set	0x34, %g3
	ldsw	[%l7 + %g3],	%l1
	nop
	set	0x58, %g1
	stx	%fsr,	[%l7 + %g1]
	or	%g5,	%l6,	%g1
	and	%i0,	%o5,	%o2
	nop
	set	0x5A, %g4
	lduh	[%l7 + %g4],	%o4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f16
	or	%g7,	%i2,	%g2
	nop
	set	0x54, %o2
	ldsb	[%l7 + %o2],	%g4
	set	0x79, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g6
	nop
	set	0x54, %o4
	ldsh	[%l7 + %o4],	%o0
	set	0x22, %g2
	stha	%i3,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x15, %o6
	stba	%i4,	[%l7 + %o6] 0x88
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x81,	%o1
	set	0x54, %i4
	lda	[%l7 + %i4] 0x81,	%f6
	set	0x62, %i6
	stha	%o6,	[%l7 + %i6] 0x89
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xe2,	%i6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc0
	fpsub16s	%f7,	%f6,	%f13
	set	0x20, %g5
	stxa	%l3,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x38, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x14, %l0
	sth	%o7,	[%l7 + %l0]
	set	0x28, %o5
	stda	%o2,	[%l7 + %o5] 0x89
	nop
	set	0x4C, %o7
	lduw	[%l7 + %o7],	%i5
	nop
	set	0x30, %l3
	ldsw	[%l7 + %l3],	%i6
	nop
	set	0x24, %i1
	stw	%l2,	[%l7 + %i1]
	set	0x10, %l6
	stxa	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x68]
	set	0x58, %g6
	stda	%g2,	[%l7 + %g6] 0x80
	or	%l5,	%i1,	%l1
	nop
	set	0x68, %l2
	swap	[%l7 + %l2],	%g5
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x81,	%g1
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x30, %i5
	ldstub	[%l7 + %i5],	%i0
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x89,	%o2
	nop
	set	0x38, %g3
	ldsh	[%l7 + %g3],	%o4
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x28, %g4
	swap	[%l7 + %g4],	%i2
	nop
	set	0x68, %o0
	sth	%g2,	[%l7 + %o0]
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x81,	 1
	fpsub32	%f8,	%f0,	%f6
	nop
	set	0x15, %o2
	ldsb	[%l7 + %o2],	%g6
	nop
	set	0x20, %o4
	sth	%o5,	[%l7 + %o4]
	nop
	set	0x68, %i2
	lduh	[%l7 + %i2],	%i3
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f18
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x74, %g2
	ldsh	[%l7 + %g2],	%i4
	nop
	set	0x79, %i4
	stb	%o0,	[%l7 + %i4]
	and	%o1,	%o6,	%i7
	set	0x28, %i0
	stha	%l0,	[%l7 + %i0] 0x81
	set	0x4B, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o7
	nop
	set	0x18, %i7
	std	%l2,	[%l7 + %i7]
	nop
	set	0x44, %o3
	sth	%i5,	[%l7 + %o3]
	nop
	set	0x73, %l1
	ldsb	[%l7 + %l1],	%o3
	nop
	set	0x08, %l0
	ldsb	[%l7 + %l0],	%l2
	nop
	set	0x78, %o5
	stx	%i6,	[%l7 + %o5]
	and	%l4,	%g3,	%i1
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x80,	 3
	nop
	set	0x0C, %g5
	ldsw	[%l7 + %g5],	%g5
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x89,	 4
	st	%fsr,	[%l7 + 0x0C]
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x88,	%i0
	ble,a	%icc,	loop_35
	wr	%o2,	%l6,	%pic
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x40, %l5
	std	%i2,	[%l7 + %l5]
loop_35:
	nop
	set	0x09, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g2
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%g4
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%o4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f0
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%g6
	nop
	set	0x21, %i3
	ldub	[%l7 + %i3],	%i3
	nop
	nop
	setx	0x6A6255D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xE871090C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f26,	%f7
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x88,	%o5
	bg,a	%xcc,	loop_36
	nop
	set	0x28, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x68, %o0
	swap	[%l7 + %o0],	%o0
	nop
	set	0x48, %o2
	lduh	[%l7 + %o2],	%o1
loop_36:
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f20
	add	%i4,	%o6,	%i7
	nop
	set	0x44, %i2
	ldsw	[%l7 + %i2],	%o7
	nop
	set	0x14, %o6
	sth	%l3,	[%l7 + %o6]
	and	%i5,	%o3,	%l2
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x81,	%i6
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xeb,	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l4
	nop
	set	0x11, %i4
	stb	%i1,	[%l7 + %i4]
	nop
	set	0x60, %i6
	stx	%g5,	[%l7 + %i6]
	nop
	set	0x64, %i0
	stb	%l1,	[%l7 + %i0]
	nop
	set	0x3E, %i7
	ldsh	[%l7 + %i7],	%g1
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f16
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f10
	set	0x10, %o3
	stxa	%i0,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x58, %o7
	std	%f10,	[%l7 + %o7]
	set	0x24, %g5
	stwa	%l5,	[%l7 + %g5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	set	0x4C, %l3
	swapa	[%l7 + %l3] 0x88,	%o2
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x48, %l6
	stha	%g7,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x88,	 2
	set	0x2C, %o5
	lda	[%l7 + %o5] 0x89,	%f13
	or	%l6,	%g4,	%g2
	set	0x2C, %l5
	stwa	%g6,	[%l7 + %l5] 0xe3
	membar	#Sync
	ld	[%l7 + 0x78],	%f20
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%o1
	nop
	set	0x38, %o1
	stx	%o5,	[%l7 + %o1]
	ld	[%l7 + 0x3C],	%f28
	set	0x20, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o6
	nop
	set	0x60, %g3
	stw	%i7,	[%l7 + %g3]
	nop
	set	0x7E, %l4
	sth	%o7,	[%l7 + %l4]
	fpadd16s	%f0,	%f5,	%f7
	set	0x08, %g1
	ldstuba	[%l7 + %g1] 0x89,	%l3
	nop
	set	0x48, %g4
	sth	%i4,	[%l7 + %g4]
	nop
	set	0x70, %i3
	ldsw	[%l7 + %i3],	%o3
	fpadd32s	%f17,	%f19,	%f22
	set	0x30, %o0
	stxa	%l2,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x50, %o2
	stx	%i5,	[%l7 + %o2]
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%l0
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 3
	and	%g3,	%i1,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%g1
	nop
	set	0x30, %g2
	std	%f4,	[%l7 + %g2]
	set	0x48, %i4
	ldxa	[%l7 + %i4] 0x80,	%g5
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%l4
	set	0x14, %o4
	stba	%o2,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%f11,	[%l7 + 0x28]
	nop
	set	0x18, %i0
	std	%f14,	[%l7 + %i0]
	nop
	set	0x10, %i7
	std	%f24,	[%l7 + %i7]
	set	0x08, %l0
	stba	%g7,	[%l7 + %l0] 0x88
	bgu,a,pn	%icc,	loop_37
	nop
	set	0x48, %o3
	std	%f26,	[%l7 + %o3]
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%i2
	set	0x34, %o7
	lda	[%l7 + %o7] 0x81,	%f10
loop_37:
	nop
	set	0x76, %g5
	ldub	[%l7 + %g5],	%l6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	nop
	set	0x7C, %l6
	stw	%i0,	[%l7 + %l6]
	nop
	set	0x68, %i1
	std	%g2,	[%l7 + %i1]
	or	%g6,	%g4,	%o4
	set	0x7C, %l2
	lda	[%l7 + %l2] 0x80,	%f17
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%o0
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x81,	%i3
	nop
	set	0x24, %l5
	swap	[%l7 + %l5],	%o1
	fpsub16s	%f22,	%f2,	%f7
	set	0x2C, %o1
	stwa	%o6,	[%l7 + %o1] 0x80
	add	%i7,	%o7,	%o5
	nop
	set	0x6E, %g6
	ldsh	[%l7 + %g6],	%l3
	nop
	set	0x0E, %g3
	ldsb	[%l7 + %g3],	%o3
	set	0x38, %g1
	stda	%l2,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd0
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%i4
	set	0x4A, %o0
	stha	%i6,	[%l7 + %o0] 0x80
	set	0x30, %o2
	stwa	%l0,	[%l7 + %o2] 0x81
	set	0x54, %g4
	lda	[%l7 + %g4] 0x88,	%f1
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x88,	%i5
	nop
	set	0x48, %g7
	stx	%i1,	[%l7 + %g7]
	add	%g3,	%l4,	%l1
	set	0x28, %g2
	lda	[%l7 + %g2] 0x88,	%f27
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f30
	fpadd16s	%f12,	%f4,	%f30
	nop
	set	0x46, %o6
	ldub	[%l7 + %o6],	%g1
	set	0x6E, %i6
	stha	%g5,	[%l7 + %i6] 0x81
	nop
	set	0x0A, %i0
	ldsh	[%l7 + %i0],	%o2
	set	0x78, %o4
	swapa	[%l7 + %o4] 0x89,	%g7
	nop
	set	0x74, %i7
	stw	%l5,	[%l7 + %i7]
	ld	[%l7 + 0x68],	%f22
	nop
	set	0x7A, %l0
	lduh	[%l7 + %l0],	%i2
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x88,	%i0
	set	0x6F, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g2
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%l6
	fpadd32s	%f9,	%f17,	%f3
	nop
	set	0x64, %g5
	stw	%o0,	[%l7 + %g5]
	set	0x4C, %l6
	sta	%f1,	[%l7 + %l6] 0x89
	nop
	set	0x70, %i1
	lduw	[%l7 + %i1],	%o1
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xe3,	%i2
	or	%i7,	%o6,	%o7
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x81,	 0
	nop
	set	0x32, %i5
	lduh	[%l7 + %i5],	%o5
	nop
	set	0x18, %l5
	ldub	[%l7 + %l5],	%l2
	nop
	set	0x40, %o5
	ldx	[%l7 + %o5],	%o3
	add	%i4,	%i6,	%l0
	nop
	set	0x5C, %o1
	sth	%i5,	[%l7 + %o1]
	nop
	set	0x40, %g3
	std	%g2,	[%l7 + %g3]
	nop
	set	0x2A, %g1
	ldstub	[%l7 + %g1],	%l4
	set	0x7F, %g6
	stba	%l1,	[%l7 + %g6] 0x89
	nop
	set	0x18, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x72, %o0
	sth	%g1,	[%l7 + %o0]
	nop
	set	0x70, %o2
	std	%f8,	[%l7 + %o2]
	nop
	set	0x70, %l4
	std	%f4,	[%l7 + %l4]
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f0
	nop
	set	0x08, %g4
	lduw	[%l7 + %g4],	%i1
	set	0x4A, %g2
	stha	%o2,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f30
	nop
	set	0x5A, %o6
	ldsh	[%l7 + %o6],	%g7
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xd2
	set	0x74, %i6
	sta	%f13,	[%l7 + %i6] 0x88
	nop
	set	0x2C, %o4
	lduh	[%l7 + %o4],	%l5
	add	%g5,	%i2,	%g2
	and	%g6,	%i0,	%g4
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x80,	%o4
	nop
	set	0x34, %l0
	ldsw	[%l7 + %l0],	%o0
	add	%o1,	%i3,	%l6
	nop
	set	0x78, %o3
	lduw	[%l7 + %o3],	%i7
	set	0x41, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o6
	wr	%o7,	%l3,	%clear_softint
	nop
	set	0x15, %o7
	ldstub	[%l7 + %o7],	%o5
	set	0x47, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l2
	nop
	set	0x44, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x08, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x3B, %i1
	ldstub	[%l7 + %i1],	%o3
	set	0x54, %l3
	stwa	%i4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f14
	nop
	set	0x74, %i5
	prefetch	[%l7 + %i5],	 0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%i5
	nop
	set	0x1C, %o5
	ldsw	[%l7 + %o5],	%i6
	add	%g3,	%l1,	%g1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o2
	nop
	set	0x58, %l5
	std	%f22,	[%l7 + %l5]
	nop
	nop
	setx	0x67AF477F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xB2F47064,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f29,	%f1
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe2,	%g6
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x88,	%i1
	set	0x08, %o1
	stha	%l5,	[%l7 + %o1] 0x89
	nop
	set	0x08, %i3
	ldsw	[%l7 + %i3],	%g5
	set	0x70, %g6
	stwa	%i2,	[%l7 + %g6] 0x80
	set	0x20, %o2
	sta	%f27,	[%l7 + %o2] 0x88
	set	0x20, %o0
	lda	[%l7 + %o0] 0x89,	%f16
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x81,	 1
	nop
	set	0x6E, %g4
	sth	%g6,	[%l7 + %g4]
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x4C, %g2
	lduh	[%l7 + %g2],	%g4
	nop
	set	0x41, %o6
	stb	%i0,	[%l7 + %o6]
	and	%o4,	%o1,	%o0
	set	0x34, %g7
	stha	%i3,	[%l7 + %g7] 0x81
	set	0x26, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l6
	nop
	set	0x64, %i6
	stw	%o6,	[%l7 + %i6]
	set	0x40, %i7
	stxa	%o7,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x40, %o4
	ldsw	[%l7 + %o4],	%l3
	set	0x16, %l0
	stba	%o5,	[%l7 + %l0] 0x81
	nop
	set	0x3D, %i0
	stb	%l2,	[%l7 + %i0]
	fpsub32s	%f21,	%f1,	%f2
	set	0x74, %o7
	lda	[%l7 + %o7] 0x88,	%f6
	set	0x68, %l1
	stxa	%o3,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x32, %g5
	ldub	[%l7 + %g5],	%i4
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x89,	%i7
	set	0x5C, %o3
	ldstuba	[%l7 + %o3] 0x88,	%l0
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x0A, %i1
	ldsh	[%l7 + %i1],	%i5
	nop
	set	0x12, %l3
	lduh	[%l7 + %l3],	%i6
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc4
	or	%g3,	%l1,	%l4
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x89,	%o2
	nop
	set	0x58, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%g6
	add	%g1,	%i1,	%l5
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f20
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd2
	nop
	set	0x4A, %g3
	ldsh	[%l7 + %g3],	%i2
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%g4
	and	%g2,	%g4,	%g6
	set	0x48, %o0
	lda	[%l7 + %o0] 0x81,	%f10
	nop
	set	0x40, %o2
	ldsb	[%l7 + %o2],	%i0
	nop
	set	0x11, %g4
	stb	%o1,	[%l7 + %g4]
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x38, %l4
	std	%o4,	[%l7 + %l4]
	st	%f31,	[%l7 + 0x20]
	nop
	set	0x24, %g2
	prefetch	[%l7 + %g2],	 2
	wr	%o0,	%l6,	%pic
	nop
	nop
	setx	0xA39FA7D3CD7AA856,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9D0CE0AE08172304,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f24,	%f20
	nop
	set	0x32, %o6
	lduh	[%l7 + %o6],	%i3
	nop
	set	0x10, %i4
	lduw	[%l7 + %i4],	%o6
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x80,	%l3
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x88,	%o5
	set	0x44, %i6
	lda	[%l7 + %i6] 0x89,	%f3
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc8
	set	0x74, %o4
	lda	[%l7 + %o4] 0x80,	%f24
	nop
	set	0x60, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x10, %l1
	sth	%o7,	[%l7 + %l1]
	nop
	set	0x45, %g5
	ldub	[%l7 + %g5],	%l2
	nop
	set	0x1C, %i0
	ldsh	[%l7 + %i0],	%o3
	set	0x6C, %l6
	stwa	%i4,	[%l7 + %l6] 0x88
	nop
	set	0x18, %o3
	std	%i6,	[%l7 + %o3]
	nop
	set	0x63, %l3
	ldsb	[%l7 + %l3],	%i5
	add	%i6,	%g3,	%l0
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x80,	%l1
	nop
	set	0x28, %o5
	std	%o2,	[%l7 + %o5]
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%l4
	set	0x4F, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g1
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%g6
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%l4
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xe3,	%i0
	set	0x10, %g1
	sta	%f26,	[%l7 + %g1] 0x80
	nop
	set	0x39, %g6
	ldub	[%l7 + %g6],	%g5
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x89,	%g2
	set	0x40, %o2
	lda	[%l7 + %o2] 0x89,	%f5
	set	0x38, %g3
	stba	%g4,	[%l7 + %g3] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%g6
	nop
	set	0x6E, %i2
	ldsh	[%l7 + %i2],	%i0
	nop
	set	0x48, %l4
	ldsh	[%l7 + %l4],	%o1
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o4
	set	0x10, %o6
	stwa	%i3,	[%l7 + %o6] 0x88
	ld	[%l7 + 0x70],	%f2
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc4
	st	%f3,	[%l7 + 0x14]
	st	%f22,	[%l7 + 0x14]
	set	0x24, %g7
	stha	%l3,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x58, %i4
	ldsw	[%l7 + %i4],	%o5
	nop
	set	0x1A, %i7
	ldsb	[%l7 + %i7],	%o6
	set	, %l0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1265
!	Type a   	: 21
!	Type cti   	: 20
!	Type x   	: 522
!	Type f   	: 49
!	Type i   	: 123
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
	set	0x1,	%g1
	set	0x6,	%g2
	set	0x7,	%g3
	set	0xC,	%g4
	set	0x1,	%g5
	set	0x0,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x7,	%i1
	set	-0x4,	%i2
	set	-0x1,	%i3
	set	-0x9,	%i4
	set	-0x0,	%i5
	set	-0xE,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x652C8DA1,	%l0
	set	0x6E4DADCE,	%l1
	set	0x611BFD8B,	%l2
	set	0x795640FF,	%l3
	set	0x21041F0A,	%l4
	set	0x6D865545,	%l5
	set	0x28F3D20E,	%l6
	!# Output registers
	set	-0x1F62,	%o0
	set	0x03CA,	%o1
	set	0x04D6,	%o2
	set	-0x0CFF,	%o3
	set	-0x067C,	%o4
	set	-0x1013,	%o5
	set	-0x16EF,	%o6
	set	0x1F38,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	fpsub32s	%f12,	%f8,	%f20
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x48, %o7
	stx	%l2,	[%l7 + %o7]
	nop
	set	0x18, %l1
	std	%o2,	[%l7 + %l1]
	set	0x14, %o4
	sta	%f29,	[%l7 + %o4] 0x88
	nop
	set	0x5A, %g5
	stb	%o7,	[%l7 + %g5]
	nop
	set	0x50, %i0
	stx	%i4,	[%l7 + %i0]
	set	0x30, %l6
	ldxa	[%l7 + %l6] 0x80,	%i5
	nop
	set	0x78, %l3
	stw	%i6,	[%l7 + %l3]
	and	%g3,	%l0,	%l1
	set	0x09, %i1
	ldstuba	[%l7 + %i1] 0x81,	%i7
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd0
	ld	[%l7 + 0x14],	%f4
	nop
	set	0x71, %l5
	ldsb	[%l7 + %l5],	%l4
	set	0x48, %o3
	stba	%g1,	[%l7 + %o3] 0x81
	set	0x7B, %i5
	stba	%o2,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcc
	set	0x0C, %i3
	sta	%f3,	[%l7 + %i3] 0x88
	set	0x50, %o1
	sta	%f19,	[%l7 + %o1] 0x89
	ble	%icc,	loop_38
	st	%f14,	[%l7 + 0x20]
	set	0x55, %g6
	stba	%g7,	[%l7 + %g6] 0x89
loop_38:
	be,a,pt	%icc,	loop_39
	fpsub32	%f30,	%f14,	%f30
	set	0x30, %o0
	stha	%l5,	[%l7 + %o0] 0xe2
	membar	#Sync
loop_39:
	nop
	set	0x20, %g1
	sta	%f24,	[%l7 + %g1] 0x80
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%i1
	nop
	set	0x2C, %g3
	stw	%g5,	[%l7 + %g3]
	nop
	set	0x48, %i2
	ldstub	[%l7 + %i2],	%g2
	set	0x10, %l4
	stha	%i2,	[%l7 + %l4] 0x80
	or	%g4,	%g6,	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%l6
	set	0x28, %g2
	stha	%i0,	[%l7 + %g2] 0x89
	nop
	set	0x31, %g4
	ldstub	[%l7 + %g4],	%i3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x80
	nop
	set	0x38, %i4
	ldstub	[%l7 + %i4],	%l3
	nop
	set	0x70, %o6
	swap	[%l7 + %o6],	%o5
	nop
	set	0x60, %l0
	lduh	[%l7 + %l0],	%o4
	nop
	set	0x74, %i7
	prefetch	[%l7 + %i7],	 3
	wr	%l2,	%o6,	%ccr
	nop
	set	0x65, %i6
	ldub	[%l7 + %i6],	%o3
	set	0x58, %l1
	ldxa	[%l7 + %l1] 0x89,	%i4
	bne	%xcc,	loop_40
	nop
	set	0x1C, %o4
	swap	[%l7 + %o4],	%i5
	nop
	set	0x18, %o7
	std	%f24,	[%l7 + %o7]
	nop
	set	0x6E, %i0
	lduh	[%l7 + %i0],	%i6
loop_40:
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x12, %l6
	ldub	[%l7 + %l6],	%g3
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%l0
	set	0x74, %i1
	stwa	%l1,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x70, %o5
	stwa	%o7,	[%l7 + %o5] 0x88
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x36, %l5
	ldsh	[%l7 + %l5],	%i7
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x64, %l2
	ldub	[%l7 + %l2],	%g1
	ld	[%l7 + 0x68],	%f14
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o2
	st	%f5,	[%l7 + 0x08]
	nop
	set	0x72, %i3
	ldsh	[%l7 + %i3],	%g7
	or	%l5,	%i1,	%g5
	nop
	set	0x58, %o1
	ldx	[%l7 + %o1],	%i2
	set	0x6B, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g4
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	set	0x30, %g1
	stha	%o1,	[%l7 + %g1] 0x81
	nop
	set	0x34, %g6
	stw	%g2,	[%l7 + %g6]
	nop
	set	0x36, %o2
	lduh	[%l7 + %o2],	%o0
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0
	set	0x70, %g3
	stxa	%i3,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x60, %g2
	stw	%l3,	[%l7 + %g2]
	st	%f1,	[%l7 + 0x60]
	nop
	set	0x78, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%l6
	nop
	set	0x23, %g7
	ldsb	[%l7 + %g7],	%o5
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%o4
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%o6
	set	0x2C, %i4
	sta	%f10,	[%l7 + %i4] 0x88
	set	0x50, %i6
	sta	%f28,	[%l7 + %i6] 0x88
	bgu,a,pt	%xcc,	loop_41
	or	%l2,	%i4,	%i5
	add	%i6,	%g3,	%o3
	nop
	set	0x58, %i7
	ldsh	[%l7 + %i7],	%l0
loop_41:
	nop
	set	0x60, %l1
	swap	[%l7 + %l1],	%l1
	nop
	set	0x08, %o4
	lduw	[%l7 + %o4],	%i7
	or	%o7,	%l4,	%o2
	set	0x28, %i0
	stha	%g1,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x7C, %g5
	lda	[%l7 + %g5] 0x81,	%f2
	set	0x0C, %l6
	stba	%l5,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%i0
	and	%g7,	%i2,	%g5
	set	0x20, %i1
	stwa	%g4,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x38, %o5
	stda	%g6,	[%l7 + %o5] 0x80
	set	0x20, %l3
	stwa	%g2,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf0
	membar	#Sync
	set	0x0C, %l5
	stha	%o0,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x74, %l2
	lduh	[%l7 + %l2],	%o1
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f28
	and	%i0,	%i3,	%l3
	wr	%l6,	%o5,	%ccr
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x5B, %o1
	ldsb	[%l7 + %o1],	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%l2
	or	%i5,	%i6,	%g3
	set	0x48, %i5
	sta	%f5,	[%l7 + %i5] 0x80
	nop
	set	0x40, %g1
	std	%f26,	[%l7 + %g1]
	set	0x50, %o0
	stda	%o2,	[%l7 + %o0] 0x88
	and	%l0,	%l1,	%i4
	set	0x08, %o2
	lda	[%l7 + %o2] 0x89,	%f8
	nop
	set	0x17, %i2
	stb	%o7,	[%l7 + %i2]
	nop
	set	0x43, %g3
	stb	%i7,	[%l7 + %g3]
	ld	[%l7 + 0x18],	%f27
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	set	0x68, %l4
	stha	%g1,	[%l7 + %l4] 0x81
	wr 	%g0, 	0x6, 	%fprs
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i2
	nop
	set	0x38, %g6
	sth	%g5,	[%l7 + %g6]
	nop
	set	0x18, %g4
	std	%g4,	[%l7 + %g4]
	set	0x28, %o6
	sta	%f30,	[%l7 + %o6] 0x88
	or	%g7,	%g6,	%g2
	nop
	set	0x18, %g7
	std	%f18,	[%l7 + %g7]
	and	%o1,	%i0,	%i3
	set	0x34, %l0
	stwa	%o0,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xeb,	%l2
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x88,	%l6
	set	0x3C, %l1
	swapa	[%l7 + %l1] 0x89,	%o6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x80
	nop
	set	0x31, %i7
	ldstub	[%l7 + %i7],	%o5
	set	0x20, %i0
	stxa	%l2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f24
	or	%o4,	%i5,	%i6
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f4
	nop
	set	0x70, %i1
	std	%f12,	[%l7 + %i1]
	set	0x0D, %o7
	stba	%g3,	[%l7 + %o7] 0x80
	set	0x18, %l3
	stwa	%o3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x10, %o3
	ldx	[%l7 + %o3],	%l1
	nop
	set	0x4C, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x6E, %l2
	ldsb	[%l7 + %l2],	%i4
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%l0
	nop
	set	0x38, %o1
	std	%o6,	[%l7 + %o1]
	and	%i7,	%g1,	%o2
	nop
	set	0x20, %l5
	ldsw	[%l7 + %l5],	%i1
	nop
	set	0x50, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f16
	st	%f2,	[%l7 + 0x58]
	nop
	nop
	setx	0xD6C45F46,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xA6A52BBA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f24,	%f23
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%l4
	nop
	set	0x70, %i2
	lduw	[%l7 + %i2],	%i2
	fpsub16	%f26,	%f6,	%f6
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0
	set	0x1C, %g3
	swapa	[%l7 + %g3] 0x80,	%g4
	nop
	set	0x30, %l4
	stw	%l5,	[%l7 + %l4]
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x89,	%g6
	nop
	set	0x3B, %g6
	stb	%g7,	[%l7 + %g6]
	set	0x44, %g4
	lda	[%l7 + %g4] 0x88,	%f15
	set	0x7C, %o6
	lda	[%l7 + %o6] 0x88,	%f28
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%o1
	nop
	set	0x30, %g7
	sth	%i0,	[%l7 + %g7]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%l3
	nop
	set	0x1C, %l0
	ldsw	[%l7 + %l0],	%i3
	set	0x30, %i4
	stxa	%l6,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	nop
	setx	0xA1136FDFFA551D35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xAD9BAA29201F64FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f16,	%f10
	nop
	set	0x6E, %i6
	ldub	[%l7 + %i6],	%o5
	and	%o6,	%l2,	%o4
	set	0x10, %l1
	stda	%i4,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x36, %i7
	ldsb	[%l7 + %i7],	%g3
	st	%f2,	[%l7 + 0x24]
	nop
	set	0x44, %i0
	sth	%i6,	[%l7 + %i0]
	st	%f0,	[%l7 + 0x6C]
	nop
	set	0x5A, %o4
	stb	%l1,	[%l7 + %o4]
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x89,	%i4
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x48, %g5
	ldub	[%l7 + %g5],	%o3
	nop
	set	0x38, %l3
	sth	%o7,	[%l7 + %l3]
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%l0
	set	0x20, %o5
	stba	%i7,	[%l7 + %o5] 0x81
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x80,	 2
	set	0x14, %o3
	sta	%f0,	[%l7 + %o3] 0x89
	fpsub32s	%f15,	%f3,	%f24
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x81,	%o2
	set	0x68, %l5
	stda	%i0,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x1F, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i2
	nop
	set	0x30, %i3
	lduh	[%l7 + %i3],	%l4
	set	0x29, %o0
	stba	%g5,	[%l7 + %o0] 0x80
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%l4
	nop
	set	0x60, %o2
	sth	%g6,	[%l7 + %o2]
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x89,	%g7
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%g4
	nop
	set	0x60, %l4
	prefetch	[%l7 + %l4],	 2
	set	0x10, %g2
	stwa	%g2,	[%l7 + %g2] 0x80
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x80,	%o0
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%i0
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc0
	set	0x40, %l0
	lda	[%l7 + %l0] 0x81,	%f2
	nop
	set	0x78, %i4
	std	%f30,	[%l7 + %i4]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd0,	%f0
	nop
	set	0x16, %g7
	lduh	[%l7 + %g7],	%o0
	nop
	set	0x29, %l1
	ldstub	[%l7 + %l1],	%l3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f16
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	set	0x70, %i7
	sta	%f19,	[%l7 + %i7] 0x80
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%l6
	nop
	set	0x78, %g5
	std	%o4,	[%l7 + %g5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%o4
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%i5
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 3
	wr	%o6,	%g3,	%clear_softint
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f0
	set	0x1E, %o3
	ldstuba	[%l7 + %o3] 0x80,	%l1
	or	%i4,	%o3,	%o7
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x18, %o1
	std	%l0,	[%l7 + %o1]
	add	%i7,	%i6,	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%g1
	set	0x78, %i5
	stxa	%l4,	[%l7 + %i5] 0x89
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%i2
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%l5
	set	0x20, %o0
	swapa	[%l7 + %o0] 0x88,	%g5
	add	%g6,	%g7,	%g2
	nop
	set	0x16, %g1
	ldub	[%l7 + %g1],	%o1
	ld	[%l7 + 0x10],	%f25
	nop
	set	0x54, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x2C, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i0
	set	0x78, %o2
	stxa	%g4,	[%l7 + %o2] 0x89
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	set	0x10, %l4
	stxa	%o0,	[%l7 + %l4] 0x88
	ld	[%l7 + 0x70],	%f4
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%i3
	or	%l2,	%o5,	%o4
	set	0x2C, %o6
	sta	%f14,	[%l7 + %o6] 0x89
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc8
	nop
	set	0x0D, %l0
	ldub	[%l7 + %l0],	%o6
	nop
	set	0x32, %g7
	ldub	[%l7 + %g7],	%g3
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x89,	%l0
	nop
	set	0x66, %i0
	ldstub	[%l7 + %i0],	%i4
	st	%f11,	[%l7 + 0x30]
	st	%f25,	[%l7 + 0x24]
	wr	%o3,	%i5,	%clear_softint
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%o7
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x88,	%l0
	and	%i6,	%o2,	%i1
	or	%i7,	%l4,	%g1
	be,a	%xcc,	loop_42
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x14, %g5
	stw	%l5,	[%l7 + %g5]
loop_42:
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f16
	nop
	set	0x48, %o7
	ldsh	[%l7 + %o7],	%g5
	or	%i2,	%g7,	%g6
	add	%o1,	%i0,	%g4
	nop
	set	0x40, %i1
	lduw	[%l7 + %i1],	%l3
	nop
	set	0x26, %l2
	ldsh	[%l7 + %l2],	%o0
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f2
	nop
	set	0x7C, %o3
	swap	[%l7 + %o3],	%l6
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 2
	fpadd16	%f2,	%f8,	%f10
	nop
	set	0x22, %i5
	sth	%g2,	[%l7 + %i5]
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%o5
	bn,pn	%icc,	loop_43
	ble,a,pt	%xcc,	loop_44
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f16
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%o4
loop_43:
	nop
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x89,	%f1
loop_44:
	fpadd32s	%f21,	%f18,	%f24
	or	%o6,	%g3,	%l1
	add	%i4,	%i5,	%o3
	or	%o7,	%i6,	%o2
	set	0x60, %o0
	stda	%l0,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x20, %g3
	ldsw	[%l7 + %g3],	%i7
	nop
	set	0x39, %i2
	ldstub	[%l7 + %i2],	%l4
	set	0x28, %g2
	stda	%i0,	[%l7 + %g2] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%g1
	set	0x7C, %o2
	stwa	%i2,	[%l7 + %o2] 0xeb
	membar	#Sync
	add	%g5,	%g6,	%o1
	nop
	set	0x51, %g4
	ldsb	[%l7 + %g4],	%g7
	nop
	set	0x74, %l4
	swap	[%l7 + %l4],	%g4
	set	0x30, %o6
	stxa	%i0,	[%l7 + %o6] 0x88
	nop
	set	0x19, %g6
	ldstub	[%l7 + %g6],	%o0
	nop
	set	0x18, %i4
	ldsw	[%l7 + %i4],	%l6
	nop
	set	0x5D, %g7
	ldub	[%l7 + %g7],	%g2
	nop
	set	0x68, %l0
	swap	[%l7 + %l0],	%l3
	add	%i3,	%l2,	%o4
	set	0x40, %i0
	stda	%o6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x4C, %i6
	stw	%o5,	[%l7 + %i6]
	set	0x6B, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l1
	nop
	set	0x30, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x12, %i7
	ldsb	[%l7 + %i7],	%g3
	set	0x7C, %g5
	stwa	%i5,	[%l7 + %g5] 0x81
	set	0x58, %l6
	stda	%i4,	[%l7 + %l6] 0x89
	set	0x14, %i1
	swapa	[%l7 + %i1] 0x81,	%o7
	st	%f31,	[%l7 + 0x08]
	and	%o3,	%i6,	%l0
	nop
	set	0x18, %l2
	ldsw	[%l7 + %l2],	%o2
	set	0x18, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i7
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x80,	%i1
	nop
	set	0x68, %o3
	ldsh	[%l7 + %o3],	%l4
	set	0x6B, %o1
	stba	%g1,	[%l7 + %o1] 0x81
	set	0x44, %i3
	lda	[%l7 + %i3] 0x88,	%f21
	nop
	set	0x6C, %i5
	ldstub	[%l7 + %i5],	%l5
	nop
	set	0x4C, %l5
	swap	[%l7 + %l5],	%i2
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x89,	%g6
	st	%f11,	[%l7 + 0x20]
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x81,	%o1
	st	%f25,	[%l7 + 0x10]
	st	%fsr,	[%l7 + 0x24]
	and	%g7,	%g4,	%i0
	wr 	%g0, 	0x5, 	%fprs
	st	%f4,	[%l7 + 0x64]
	set	0x70, %l3
	lda	[%l7 + %l3] 0x89,	%f19
	ld	[%l7 + 0x18],	%f14
	set	0x0D, %i2
	ldstuba	[%l7 + %i2] 0x81,	%l6
	set	0x17, %g2
	ldstuba	[%l7 + %g2] 0x80,	%l3
	bleu	%icc,	loop_45
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x43, %o2
	ldsb	[%l7 + %o2],	%g2
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%i3
loop_45:
	nop
	set	0x4A, %o6
	sth	%l2,	[%l7 + %o6]
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x81,	%o6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l1
	nop
	set	0x24, %g6
	lduw	[%l7 + %g6],	%g3
	st	%f12,	[%l7 + 0x2C]
	nop
	set	0x72, %g7
	stb	%i5,	[%l7 + %g7]
	set	0x4C, %i4
	stha	%o5,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%o6
	set	0x0C, %i0
	stba	%i4,	[%l7 + %i0] 0x81
	set	0x22, %l1
	stha	%o3,	[%l7 + %l1] 0x80
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%i6
	nop
	set	0x26, %i6
	ldsh	[%l7 + %i6],	%o2
	nop
	set	0x3E, %i7
	stb	%i1,	[%l7 + %i7]
	set	0x66, %o4
	stba	%i7,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x70, %g5
	lda	[%l7 + %g5] 0x80,	%f0
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%l4
	set	0x68, %l6
	stda	%g0,	[%l7 + %l6] 0x88
	set	0x0C, %o5
	swapa	[%l7 + %o5] 0x88,	%l5
	nop
	set	0x48, %o7
	stb	%i2,	[%l7 + %o7]
	set	0x58, %l2
	swapa	[%l7 + %l2] 0x81,	%g6
	set	0x28, %o3
	stxa	%o1,	[%l7 + %o3] 0x81
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x88,	%g4
	be,pt	%xcc,	loop_46
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f6
	nop
	set	0x7E, %l5
	ldsh	[%l7 + %l5],	%i0
	set	0x40, %g1
	swapa	[%l7 + %g1] 0x81,	%g7
loop_46:
	nop
	set	0x47, %i5
	ldsb	[%l7 + %i5],	%g5
	nop
	set	0x2C, %o0
	lduw	[%l7 + %o0],	%l6
	st	%fsr,	[%l7 + 0x6C]
	set	0x18, %l3
	lda	[%l7 + %l3] 0x89,	%f0
	st	%f8,	[%l7 + 0x30]
	nop
	set	0x5B, %g2
	ldub	[%l7 + %g2],	%l3
	set	0x24, %i2
	lda	[%l7 + %i2] 0x81,	%f25
	and	%g2,	%o0,	%l2
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x89,	%i3
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%o4
	set	0x50, %g3
	stwa	%o6,	[%l7 + %g3] 0x89
	wr	%g3,	%i5,	%clear_softint
	add	%l1,	%o7,	%i4
	nop
	set	0x44, %o6
	ldsh	[%l7 + %o6],	%o3
	nop
	set	0x24, %g6
	ldsb	[%l7 + %g6],	%l0
	nop
	set	0x68, %g7
	stx	%i6,	[%l7 + %g7]
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x88,	 3
	and	%o2,	%i7,	%i1
	nop
	set	0x60, %l0
	swap	[%l7 + %l0],	%l4
	st	%f17,	[%l7 + 0x6C]
	nop
	nop
	setx	0xF76A70F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x4A00C802,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f1,	%f19
	nop
	set	0x57, %i0
	ldstub	[%l7 + %i0],	%l5
	set	0x1C, %g4
	stha	%i2,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x4C, %l1
	lda	[%l7 + %l1] 0x81,	%f28
	nop
	set	0x54, %i7
	stw	%g1,	[%l7 + %i7]
	nop
	set	0x68, %i6
	std	%f0,	[%l7 + %i6]
	set	0x28, %g5
	stda	%o0,	[%l7 + %g5] 0x89
	wr	%g4,	%i0,	%softint
	ld	[%l7 + 0x34],	%f9
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	and	%g7,	%g5,	%g6
	or	%l6,	%g2,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%l3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
	nop
	set	0x0C, %l6
	ldub	[%l7 + %l6],	%i3
	set	0x14, %o5
	lda	[%l7 + %o5] 0x88,	%f24
	set	0x58, %l2
	ldxa	[%l7 + %l2] 0x81,	%o6
	nop
	nop
	setx	0x7EA083135DB5C71E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x4A1FD717194C03B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f12,	%f18
	nop
	set	0x68, %o3
	stx	%o4,	[%l7 + %o3]
	set	0x10, %o7
	stda	%i4,	[%l7 + %o7] 0x89
	nop
	set	0x6A, %i3
	ldsh	[%l7 + %i3],	%g3
	nop
	set	0x16, %o1
	ldsh	[%l7 + %o1],	%o7
	nop
	set	0x3E, %g1
	ldsh	[%l7 + %g1],	%l1
	nop
	set	0x6C, %i5
	ldsb	[%l7 + %i5],	%i4
	nop
	set	0x28, %o0
	ldsh	[%l7 + %o0],	%o3
	nop
	set	0x19, %l5
	ldub	[%l7 + %l5],	%i6
	set	0x08, %l3
	swapa	[%l7 + %l3] 0x88,	%o5
	set	0x6D, %i2
	ldstuba	[%l7 + %i2] 0x89,	%l0
	nop
	set	0x78, %g2
	sth	%i7,	[%l7 + %g2]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%o2
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x52, %g3
	sth	%l5,	[%l7 + %g3]
	fpsub16s	%f1,	%f16,	%f26
	set	0x70, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i2
	nop
	set	0x2C, %g6
	lduh	[%l7 + %g6],	%l4
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%o1
	set	0x74, %g7
	sta	%f5,	[%l7 + %g7] 0x81
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%g1
	set	0x6C, %i4
	stha	%i0,	[%l7 + %i4] 0x80
	st	%fsr,	[%l7 + 0x28]
	set	0x60, %g4
	stda	%g6,	[%l7 + %g4] 0x81
	set	0x1C, %l1
	stwa	%g5,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%g6
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	nop
	set	0x10, %i6
	lduh	[%l7 + %i6],	%l6
	nop
	set	0x78, %o4
	swap	[%l7 + %o4],	%g4
	nop
	set	0x7C, %g5
	lduh	[%l7 + %g5],	%g2
	set	0x20, %i1
	lda	[%l7 + %i1] 0x89,	%f5
	set	0x28, %l6
	stwa	%o0,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x54, %o5
	lda	[%l7 + %o5] 0x81,	%f26
	nop
	set	0x18, %l2
	sth	%l2,	[%l7 + %l2]
	set	0x42, %o7
	stha	%l3,	[%l7 + %o7] 0x89
	nop
	set	0x40, %o3
	lduw	[%l7 + %o3],	%o6
	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	or	%o4,	%i5,	%i3
	nop
	set	0x20, %o1
	ldsw	[%l7 + %o1],	%g3
	add	%l1,	%o7,	%o3
	add	%i6,	%o5,	%i4
	st	%fsr,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x70, %i5
	swap	[%l7 + %i5],	%l0
	set	0x30, %o0
	stxa	%i1,	[%l7 + %o0] 0x89
	or	%i7,	%o2,	%i2
	nop
	set	0x58, %g1
	stx	%l4,	[%l7 + %g1]
	set	0x57, %l5
	stba	%l5,	[%l7 + %l5] 0x88
	set	0x30, %i2
	stxa	%g1,	[%l7 + %i2] 0x89
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	nop
	set	0x10, %l3
	stw	%o1,	[%l7 + %l3]
	set	0x60, %g3
	sta	%f30,	[%l7 + %g3] 0x80
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%g7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%g6
	nop
	set	0x12, %o2
	ldstub	[%l7 + %o2],	%g4
	nop
	set	0x10, %l4
	stx	%l6,	[%l7 + %l4]
	nop
	set	0x0C, %o6
	swap	[%l7 + %o6],	%g2
	nop
	set	0x6C, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x46, %g7
	sth	%o0,	[%l7 + %g7]
	nop
	set	0x5E, %l0
	lduh	[%l7 + %l0],	%l3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o4
	set	0x5E, %g4
	stha	%i5,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x78, %i4
	lduw	[%l7 + %i4],	%o6
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f0
	nop
	set	0x50, %i7
	stb	%i3,	[%l7 + %i7]
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%l1
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%o7
	nop
	set	0x46, %g5
	lduh	[%l7 + %g5],	%o3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f0
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%g2
	nop
	set	0x4F, %i1
	stb	%o5,	[%l7 + %i1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%i6
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f0
	set	0x58, %o7
	stxa	%l0,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x7E, %o3
	stha	%i7,	[%l7 + %o3] 0x89
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x81,	 1
	st	%fsr,	[%l7 + 0x64]
	add	%i2,	%l4,	%o2
	set	0x78, %i3
	stda	%l4,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%o1,	%i0,	%g1
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x6E, %o0
	lduh	[%l7 + %o0],	%g5
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%l6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x88
	nop
	set	0x71, %l5
	ldsb	[%l7 + %l5],	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%l3
	or	%o0,	%o4,	%i5
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x28, %l3
	ldx	[%l7 + %l3],	%o6
	set	0x73, %g2
	ldstuba	[%l7 + %g2] 0x80,	%l2
	nop
	set	0x18, %o2
	std	%l0,	[%l7 + %o2]
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%o7
	set	0x3C, %o6
	swapa	[%l7 + %o6] 0x89,	%g3
	nop
	set	0x5F, %g6
	ldstub	[%l7 + %g6],	%o5
	ld	[%l7 + 0x7C],	%f15
	nop
	set	0x49, %l4
	stb	%i4,	[%l7 + %l4]
	set	0x48, %l0
	stda	%i6,	[%l7 + %l0] 0x89
	nop
	set	0x66, %g7
	lduh	[%l7 + %g7],	%i7
	set	0x08, %i4
	sta	%f26,	[%l7 + %i4] 0x80
	nop
	set	0x50, %g4
	std	%f30,	[%l7 + %g4]
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%i1
	set	0x38, %i7
	stwa	%l0,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x88,	%l4
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x30, %g5
	ldsh	[%l7 + %g5],	%o2
	nop
	set	0x30, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x58, %l6
	ldsw	[%l7 + %l6],	%l5
	nop
	set	0x18, %i1
	stb	%i2,	[%l7 + %i1]
	nop
	set	0x38, %o5
	std	%f18,	[%l7 + %o5]
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%o1
	st	%fsr,	[%l7 + 0x2C]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf1
	membar	#Sync
	set	0x10, %o3
	lda	[%l7 + %o3] 0x88,	%f11
	set	0x1C, %i3
	lda	[%l7 + %i3] 0x80,	%f11
	set	0x68, %o1
	stxa	%i0,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x0A, %i5
	stha	%g7,	[%l7 + %i5] 0x89
	set	0x60, %o0
	lda	[%l7 + %o0] 0x89,	%f24
	set	0x4D, %l2
	stba	%g6,	[%l7 + %l2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x5C, %i2
	ldub	[%l7 + %i2],	%g1
	nop
	set	0x26, %l5
	stb	%g5,	[%l7 + %l5]
	nop
	set	0x42, %l3
	ldsh	[%l7 + %l3],	%l6
	set	0x78, %g1
	stxa	%g4,	[%l7 + %g1] 0x80
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f0
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%l3
	set	0x64, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o0
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%o4
	nop
	set	0x54, %l4
	swap	[%l7 + %l4],	%i5
	set	0x16, %o6
	stba	%g2,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x40, %g7
	sta	%f7,	[%l7 + %g7] 0x80
	set	0x70, %l0
	stxa	%l2,	[%l7 + %l0] 0x88
	add	%l1,	%i3,	%o3
	or	%o6,	%g3,	%o5
	ld	[%l7 + 0x5C],	%f9
	nop
	set	0x72, %g4
	ldsh	[%l7 + %g4],	%o7
	add	%i6,	%i7,	%i4
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%l0
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xeb,	%l4
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xeb,	%i0
	set	0x40, %i4
	ldxa	[%l7 + %i4] 0x89,	%o2
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	set	0x48, %o4
	stxa	%i2,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x60, %i1
	std	%f12,	[%l7 + %i1]
	nop
	set	0x43, %l6
	ldub	[%l7 + %l6],	%o1
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x24, %i6
	sta	%f5,	[%l7 + %i6] 0x88
	nop
	set	0x7A, %o5
	ldsh	[%l7 + %o5],	%i0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%g7
	set	0x42, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g6
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%l6
	nop
	set	0x62, %i5
	ldsh	[%l7 + %i5],	%g5
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x89,	%o0
	nop
	set	0x50, %i2
	std	%o4,	[%l7 + %i2]
	nop
	set	0x38, %o0
	ldsw	[%l7 + %o0],	%g4
	nop
	set	0x0C, %l3
	stw	%g2,	[%l7 + %l3]
	set	0x70, %g1
	sta	%f8,	[%l7 + %g1] 0x89
	or	%i5,	%l2,	%i3
	wr	%l1,	%o3,	%set_softint
	or	%g3,	%o5,	%o6
	or	%o7,	%i7,	%i6
	nop
	set	0x66, %o2
	lduh	[%l7 + %o2],	%i4
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	or	%i1,	%o2,	%i2
	nop
	set	0x20, %l5
	std	%f16,	[%l7 + %l5]
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%l4
	set	0x40, %l4
	stxa	%o1,	[%l7 + %l4] 0x88
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i0
	set	0x16, %g2
	stba	%g6,	[%l7 + %g2] 0x80
	nop
	set	0x70, %g7
	stw	%g1,	[%l7 + %g7]
	nop
	set	0x58, %o6
	prefetch	[%l7 + %o6],	 0
	bge,a	%xcc,	loop_47
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%g7
	nop
	set	0x70, %g4
	std	%f20,	[%l7 + %g4]
	set	0x66, %i7
	stha	%g5,	[%l7 + %i7] 0xea
	membar	#Sync
loop_47:
	nop
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x80,	%l3
	nop
	set	0x38, %i4
	lduw	[%l7 + %i4],	%o0
	set	0x30, %i0
	stxa	%l6,	[%l7 + %i0] 0x81
	nop
	set	0x28, %g5
	std	%f22,	[%l7 + %g5]
	or	%g4,	%g2,	%i5
	add	%o4,	%l2,	%i3
	nop
	set	0x4C, %i1
	stw	%l1,	[%l7 + %i1]
	nop
	set	0x28, %l6
	stw	%g3,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	nop
	set	0x20, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x10, %o5
	prefetcha	[%l7 + %o5] 0x88,	 3
	nop
	set	0x63, %i3
	ldub	[%l7 + %i3],	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%o5
	and	%i6,	%i7,	%l0
	set	0x41, %o1
	stba	%i1,	[%l7 + %o1] 0xe3
	membar	#Sync
	st	%f7,	[%l7 + 0x4C]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%i4
	nop
	set	0x38, %i5
	stx	%i2,	[%l7 + %i5]
	nop
	set	0x08, %o4
	std	%o0,	[%l7 + %o4]
	set	0x35, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l5
	nop
	set	0x4F, %i2
	ldsb	[%l7 + %i2],	%l4
	nop
	set	0x4E, %o3
	ldsh	[%l7 + %o3],	%g6
	set	0x18, %o0
	stda	%i0,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x70, %l3
	stda	%g0,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x30, %g1
	lda	[%l7 + %g1] 0x80,	%f19
	add	%g7,	%l3,	%o0
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	nop
	set	0x44, %o2
	ldsw	[%l7 + %o2],	%g5
	nop
	set	0x78, %l5
	stx	%g2,	[%l7 + %l5]
	and	%g4,	%i5,	%l2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%l1
	nop
	set	0x08, %l4
	std	%f10,	[%l7 + %l4]
	set	0x74, %g6
	stba	%g3,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x36, %g2
	sth	%i3,	[%l7 + %g2]
	set	0x48, %g7
	stxa	%o3,	[%l7 + %g7] 0x80
	nop
	set	0x18, %o6
	std	%f22,	[%l7 + %o6]
	add	%o6,	%o5,	%i6
	ld	[%l7 + 0x4C],	%f14
	nop
	set	0x50, %g4
	std	%o6,	[%l7 + %g4]
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x50, %l1
	stwa	%i7,	[%l7 + %l1] 0xe3
	membar	#Sync
	or	%l0,	%o2,	%i1
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%i4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%o1
	nop
	set	0x70, %l0
	stx	%l4,	[%l7 + %l0]
	set	0x30, %g5
	stxa	%l5,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x30, %i0
	std	%f24,	[%l7 + %i0]
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x81,	 2
	nop
	set	0x78, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x6C, %l6
	stb	%i0,	[%l7 + %l6]
	set	0x4C, %i6
	swapa	[%l7 + %i6] 0x81,	%g7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%l3
	set	0x38, %i3
	sta	%f23,	[%l7 + %i3] 0x88
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x14, %i5
	sta	%f17,	[%l7 + %i5] 0x88
	st	%fsr,	[%l7 + 0x4C]
	set	0x63, %o4
	ldstuba	[%l7 + %o4] 0x81,	%l6
	set	0x4A, %o1
	stba	%o0,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x10, %l2
	stw	%g2,	[%l7 + %l2]
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x81,	 2
	wr	%g5,	%i5,	%ccr
	bne,pt	%icc,	loop_48
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%l2
	nop
	set	0x30, %l3
	swap	[%l7 + %l3],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%l1
loop_48:
	nop
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x81,	 2
	fpadd16	%f6,	%f2,	%f16
	nop
	set	0x10, %g3
	ldub	[%l7 + %g3],	%i3
	st	%fsr,	[%l7 + 0x74]
	set	0x50, %o0
	sta	%f21,	[%l7 + %o0] 0x88
	wr	%o6,	%i6,	%set_softint
	bl	%xcc,	loop_49
	nop
	set	0x24, %o2
	ldsb	[%l7 + %o2],	%o5
	nop
	set	0x48, %l5
	std	%o6,	[%l7 + %l5]
	set	0x20, %l4
	stxa	%l0,	[%l7 + %l4] 0x89
loop_49:
	fpsub16s	%f23,	%f11,	%f19
	nop
	set	0x40, %g6
	sth	%i7,	[%l7 + %g6]
	nop
	set	0x78, %g2
	std	%f26,	[%l7 + %g2]
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	nop
	set	0x2C, %g4
	ldsb	[%l7 + %g4],	%i4
	nop
	set	0x60, %g7
	ldx	[%l7 + %g7],	%i2
	set	0x28, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o1
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f18
	ld	[%l7 + 0x28],	%f23
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x4B, %l0
	ldub	[%l7 + %l0],	%l4
	nop
	set	0x50, %g5
	ldsw	[%l7 + %g5],	%l5
	and	%o2,	%i0,	%g6
	set	0x28, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g1
	st	%fsr,	[%l7 + 0x2C]
	set	0x30, %i0
	sta	%f2,	[%l7 + %i0] 0x81
	set	0x70, %o7
	stxa	%l3,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x7B, %l6
	ldub	[%l7 + %l6],	%g7
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x20, %i3
	stx	%l6,	[%l7 + %i3]
	fpsub16	%f28,	%f6,	%f2
	nop
	set	0x34, %i6
	ldsh	[%l7 + %i6],	%o0
	add	%g2,	%g4,	%g5
	set	0x3C, %i5
	sta	%f20,	[%l7 + %i5] 0x81
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x81,	%l2
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x08, %l2
	swapa	[%l7 + %l2] 0x81,	%o4
	set	0x10, %o3
	stwa	%g3,	[%l7 + %o3] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%i5
	set	0x18, %i2
	stha	%o3,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x81,	%i3
	nop
	set	0x78, %l3
	ldsw	[%l7 + %l3],	%o6
	nop
	set	0x30, %g3
	std	%o4,	[%l7 + %g3]
	set	0x08, %o0
	stda	%i6,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x0C, %o2
	sta	%f14,	[%l7 + %o2] 0x81
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc8
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%l0
	set	0x4A, %l4
	stha	%o7,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x88,	 2
	nop
	set	0x18, %g6
	sth	%i1,	[%l7 + %g6]
	nop
	set	0x6D, %g4
	ldstub	[%l7 + %g4],	%i2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o1
	nop
	set	0x5E, %o6
	sth	%l4,	[%l7 + %o6]
	nop
	set	0x6F, %g7
	ldub	[%l7 + %g7],	%o2
	ld	[%l7 + 0x10],	%f1
	st	%f11,	[%l7 + 0x08]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f0
	set	0x67, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l5
	nop
	nop
	setx	0xA0E92D79,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xDA6660CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f26,	%f30
	set	0x18, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	set	0x1E, %i4
	stba	%g1,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x38, %i0
	sth	%i0,	[%l7 + %i0]
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%g7
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f0
	nop
	set	0x12, %i1
	ldstub	[%l7 + %i1],	%l3
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x81,	%o0
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%f28
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x81,	 3
	nop
	set	0x13, %i3
	ldsb	[%l7 + %i3],	%g4
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%g5
	nop
	set	0x4C, %l2
	swap	[%l7 + %l2],	%g2
	nop
	nop
	setx	0x15E4D23C1A95156A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5FFEE027E5CAB9D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f18
	nop
	set	0x2F, %o3
	stb	%o4,	[%l7 + %o3]
	nop
	set	0x30, %o5
	lduw	[%l7 + %o5],	%g3
	nop
	set	0x39, %o1
	ldstub	[%l7 + %o1],	%l2
	wr	%i5,	%o3,	%y
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%i3
	nop
	set	0x28, %l3
	std	%f12,	[%l7 + %l3]
	fpsub16s	%f9,	%f20,	%f15
	set	0x78, %g3
	lda	[%l7 + %g3] 0x89,	%f25
	nop
	set	0x7C, %o0
	lduh	[%l7 + %o0],	%l1
	nop
	set	0x42, %o2
	ldub	[%l7 + %o2],	%o6
	nop
	set	0x6C, %g1
	ldstub	[%l7 + %g1],	%o5
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%i6
	add	%l0,	%i7,	%i1
	set	0x70, %l5
	stda	%o6,	[%l7 + %l5] 0x89
	set	0x28, %g6
	sta	%f8,	[%l7 + %g6] 0x89
	set	0x58, %g4
	sta	%f17,	[%l7 + %g4] 0x81
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%o1
	nop
	set	0x7C, %i7
	lduh	[%l7 + %i7],	%i4
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x4A, %i4
	ldub	[%l7 + %i4],	%o2
	set	0x48, %g5
	stwa	%l5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x70, %o7
	lduh	[%l7 + %o7],	%g6
	nop
	set	0x6E, %l6
	lduh	[%l7 + %l6],	%g1
	st	%fsr,	[%l7 + 0x7C]
	fpsub16	%f18,	%f10,	%f0
	set	0x70, %i1
	stda	%g6,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x3F, %i0
	ldub	[%l7 + %i0],	%i0
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%l3
	set	0x4C, %i5
	swapa	[%l7 + %i5] 0x89,	%o0
	nop
	set	0x58, %i3
	stx	%g4,	[%l7 + %i3]
	nop
	set	0x22, %i6
	sth	%g5,	[%l7 + %i6]
	nop
	set	0x64, %l2
	lduh	[%l7 + %l2],	%g2
	ld	[%l7 + 0x38],	%f25
	set	0x20, %o3
	stda	%i6,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x20, %o4
	std	%g2,	[%l7 + %o4]
	and	%l2,	%i5,	%o4
	nop
	set	0x41, %o5
	stb	%o3,	[%l7 + %o5]
	set	0x70, %o1
	stba	%i3,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x40, %i2
	lduw	[%l7 + %i2],	%l1
	set	0x40, %g3
	stha	%o6,	[%l7 + %g3] 0x89
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x38, %l3
	std	%f18,	[%l7 + %l3]
	ld	[%l7 + 0x44],	%f27
	nop
	set	0x28, %g1
	lduh	[%l7 + %g1],	%i6
	set	0x5C, %o2
	sta	%f11,	[%l7 + %o2] 0x89
	nop
	set	0x5C, %l5
	ldsb	[%l7 + %l5],	%l0
	nop
	set	0x3C, %g6
	ldsh	[%l7 + %g6],	%i7
	st	%f11,	[%l7 + 0x40]
	wr	%o5,	%o7,	%sys_tick
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x81,	%i1
	or	%o1,	%i4,	%l4
	set	0x48, %o6
	stwa	%o2,	[%l7 + %o6] 0x80
	set	0x78, %g7
	swapa	[%l7 + %g7] 0x80,	%i2
	set	0x1F, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l5
	nop
	set	0x4A, %g4
	ldsh	[%l7 + %g4],	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%i0
	nop
	set	0x10, %l1
	ldsw	[%l7 + %l1],	%l3
	nop
	set	0x56, %i4
	stb	%o0,	[%l7 + %i4]
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x80,	%g4
	and	%g5,	%g2,	%l6
	nop
	set	0x70, %o7
	stx	%fsr,	[%l7 + %o7]
	and	%g3,	%l2,	%g6
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x5A, %l6
	sth	%i5,	[%l7 + %l6]
	wr 	%g0, 	0x7, 	%fprs
	set	0x20, %i1
	stda	%i2,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x68, %i0
	std	%f6,	[%l7 + %i0]
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x81,	%o6
	nop
	set	0x25, %i5
	ldstub	[%l7 + %i5],	%i6
	set	0x21, %i3
	stba	%l1,	[%l7 + %i3] 0x88
	nop
	nop
	setx	0x39C1383C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x1EA28CF5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f7,	%f12
	add	%l0,	%i7,	%o5
	nop
	set	0x25, %i6
	ldstub	[%l7 + %i6],	%i1
	ld	[%l7 + 0x68],	%f18
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x88,	%o1
	nop
	set	0x7C, %l2
	swap	[%l7 + %l2],	%o7
	nop
	set	0x5E, %o3
	stb	%l4,	[%l7 + %o3]
	nop
	set	0x44, %o4
	lduw	[%l7 + %o4],	%i4
	set	0x38, %o1
	swapa	[%l7 + %o1] 0x89,	%o2
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe2,	%i2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xda
	nop
	set	0x08, %o0
	std	%f24,	[%l7 + %o0]
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%l5
	nop
	set	0x18, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x78, %g1
	sth	%g1,	[%l7 + %g1]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%g6
	nop
	set	0x70, %l5
	prefetch	[%l7 + %l5],	 1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe2,	%o0
	nop
	set	0x24, %g6
	stw	%g4,	[%l7 + %g6]
	set	0x38, %o6
	stda	%g2,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x28, %i7
	stw	%g5,	[%l7 + %i7]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%l2
	bl,pt	%icc,	loop_50
	nop
	set	0x36, %g7
	lduh	[%l7 + %g7],	%g6
	nop
	set	0x62, %g4
	sth	%l6,	[%l7 + %g4]
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
loop_50:
	st	%f7,	[%l7 + 0x14]
	set	0x30, %i4
	stxa	%o3,	[%l7 + %i4] 0x81
	set	0x68, %o7
	stxa	%o4,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x5C, %g5
	sth	%o6,	[%l7 + %g5]
	set	0x78, %l6
	stxa	%i6,	[%l7 + %l6] 0x81
	nop
	set	0x74, %i0
	stw	%l1,	[%l7 + %i0]
	set	0x74, %i1
	lda	[%l7 + %i1] 0x88,	%f20
	set	0x20, %i5
	lda	[%l7 + %i5] 0x88,	%f11
	set	0x23, %g2
	stba	%i3,	[%l7 + %g2] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%o5
	st	%f28,	[%l7 + 0x6C]
	set	0x48, %i3
	stwa	%i1,	[%l7 + %i3] 0x81
	nop
	set	0x7A, %l0
	ldsh	[%l7 + %l0],	%i7
	nop
	set	0x23, %i6
	ldub	[%l7 + %i6],	%o7
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%o1
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x88,	%i4
	wr	%o2,	%l4,	%softint
	nop
	set	0x08, %o1
	std	%i2,	[%l7 + %o1]
	nop
	set	0x7B, %i2
	stb	%l5,	[%l7 + %i2]
	st	%f25,	[%l7 + 0x68]
	nop
	set	0x4A, %g3
	ldstub	[%l7 + %g3],	%g7
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	bgu,pn	%icc,	loop_51
	and	%l3,	%i0,	%o0
	nop
	set	0x4A, %o5
	ldub	[%l7 + %o5],	%g4
	st	%f27,	[%l7 + 0x7C]
loop_51:
	nop
	set	0x7F, %o0
	ldsb	[%l7 + %o0],	%g1
	nop
	set	0x50, %l3
	stw	%g2,	[%l7 + %l3]
	nop
	set	0x30, %g1
	stx	%g5,	[%l7 + %g1]
	nop
	set	0x15, %l5
	stb	%l2,	[%l7 + %l5]
	set	0x57, %o2
	ldstuba	[%l7 + %o2] 0x80,	%g6
	set	0x48, %l4
	stxa	%l6,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x2C, %o6
	sta	%f31,	[%l7 + %o6] 0x88
	set	0x38, %g6
	stha	%g3,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x15, %g7
	ldub	[%l7 + %g7],	%i5
	nop
	set	0x58, %g4
	prefetch	[%l7 + %g4],	 0
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%o3
	nop
	set	0x7E, %i4
	stb	%o6,	[%l7 + %i4]
	set	0x78, %o7
	stda	%o4,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x22, %i7
	ldsb	[%l7 + %i7],	%l1
	nop
	set	0x28, %l6
	std	%i2,	[%l7 + %l6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%l0
	add	%o5,	%i7,	%o7
	set	0x7C, %g5
	swapa	[%l7 + %g5] 0x81,	%o1
	nop
	set	0x10, %i0
	std	%f6,	[%l7 + %i0]
	add	%i1,	%o2,	%i4
	nop
	set	0x50, %i1
	std	%f14,	[%l7 + %i1]
	st	%f14,	[%l7 + 0x28]
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%i2
	nop
	set	0x54, %i3
	swap	[%l7 + %i3],	%l4
	set	0x7C, %i5
	lda	[%l7 + %i5] 0x80,	%f13
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%l4
	nop
	set	0x64, %l0
	ldub	[%l7 + %l0],	%g7
	nop
	set	0x74, %l2
	lduh	[%l7 + %l2],	%l3
	set	0x18, %o4
	stba	%i0,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xda,	%f0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%o0
	nop
	set	0x10, %g3
	ldsw	[%l7 + %g3],	%g1
	set	0x3B, %i2
	stba	%g2,	[%l7 + %i2] 0x81
	set	0x20, %o5
	stwa	%l2,	[%l7 + %o5] 0x89
	be,pn	%xcc,	loop_52
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%g6
	nop
	set	0x19, %g1
	ldub	[%l7 + %g1],	%l6
loop_52:
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%g2
	and	%i5,	%g5,	%o6
	st	%fsr,	[%l7 + 0x08]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf1
	membar	#Sync
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x88,	 3
	nop
	set	0x5C, %o6
	ldsh	[%l7 + %o6],	%o4
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%l1
	add	%i3,	%i6,	%o5
	nop
	set	0x47, %l4
	ldsb	[%l7 + %l4],	%i7
	nop
	set	0x43, %g7
	ldsb	[%l7 + %g7],	%o7
	st	%f11,	[%l7 + 0x54]
	st	%f21,	[%l7 + 0x64]
	nop
	set	0x58, %g4
	ldsw	[%l7 + %g4],	%o1
	st	%f21,	[%l7 + 0x78]
	ld	[%l7 + 0x74],	%f17
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	set	0x7C, %o7
	stwa	%l0,	[%l7 + %o7] 0x80
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%i4
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%i2
	set	0x6C, %i7
	stba	%o2,	[%l7 + %i7] 0x88
	nop
	set	0x60, %i0
	std	%l4,	[%l7 + %i0]
	ld	[%l7 + 0x40],	%f5
	nop
	set	0x0C, %i1
	ldsh	[%l7 + %i1],	%g7
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x81,	%l3
	nop
	set	0x62, %i3
	stb	%l4,	[%l7 + %i3]
	nop
	set	0x14, %i5
	ldsh	[%l7 + %i5],	%i0
	nop
	set	0x18, %i6
	sth	%o0,	[%l7 + %i6]
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x88,	%g0
	set	0x6C, %l2
	swapa	[%l7 + %l2] 0x88,	%g2
	set	0x48, %g5
	ldxa	[%l7 + %g5] 0x89,	%l2
	set	0x74, %o4
	sta	%f22,	[%l7 + %o4] 0x81
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x80,	 1
	and	%g4,	%g3,	%i5
	add	%l6,	%g5,	%o3
	nop
	set	0x14, %i2
	stw	%o6,	[%l7 + %i2]
	nop
	set	0x48, %o1
	swap	[%l7 + %o1],	%l1
	nop
	set	0x58, %o5
	stb	%i3,	[%l7 + %o5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%o5
	set	0x20, %l3
	ldda	[%l7 + %l3] 0x88,	%i6
	ld	[%l7 + 0x08],	%f30
	nop
	set	0x08, %o0
	stx	%i7,	[%l7 + %o0]
	nop
	set	0x5E, %l5
	stb	%o1,	[%l7 + %l5]
	and	%i1,	%o7,	%i4
	set	0x5E, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i2
	st	%f31,	[%l7 + 0x2C]
	nop
	set	0x3C, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x27, %o6
	stb	%o2,	[%l7 + %o6]
	set	0x78, %o2
	stda	%l0,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x80,	 2
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%l3
	nop
	set	0x40, %g7
	std	%f18,	[%l7 + %g7]
	nop
	set	0x78, %g4
	ldx	[%l7 + %g4],	%l5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%o0
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xeb,	%l4
	fpadd16s	%f13,	%f20,	%f24
	wr	%g2,	%l2,	%pic
	nop
	set	0x72, %i4
	sth	%g6,	[%l7 + %i4]
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%g1
	nop
	set	0x15, %i7
	ldsb	[%l7 + %i7],	%g3
	nop
	set	0x3E, %i0
	sth	%g4,	[%l7 + %i0]
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f12
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xe2,	%i6
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x80,	%g4
	nop
	set	0x10, %i5
	stx	%o3,	[%l7 + %i5]
	fpsub32s	%f26,	%f15,	%f19
	nop
	set	0x30, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x74, %i6
	ldstub	[%l7 + %i6],	%o6
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%i4
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x81,	%l1
	nop
	set	0x18, %o4
	std	%o4,	[%l7 + %o4]
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x81,	%o5
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f12
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%i7
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%i6
	set	0x6C, %o1
	sta	%f10,	[%l7 + %o1] 0x88
	set	0x2D, %o5
	ldstuba	[%l7 + %o5] 0x80,	%i1
	nop
	set	0x30, %l3
	swap	[%l7 + %l3],	%o1
	nop
	set	0x50, %l5
	std	%f16,	[%l7 + %l5]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc0
	nop
	set	0x70, %o3
	std	%f14,	[%l7 + %o3]
	ld	[%l7 + 0x38],	%f31
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%i4
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%o7
	set	0x34, %l4
	lda	[%l7 + %l4] 0x81,	%f3
	set	0x1C, %g1
	lda	[%l7 + %g1] 0x81,	%f11
	nop
	set	0x40, %g6
	swap	[%l7 + %g6],	%i2
	nop
	set	0x38, %g7
	std	%l0,	[%l7 + %g7]
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%g7
	nop
	set	0x0A, %l6
	stb	%l5,	[%l7 + %l6]
	nop
	set	0x70, %i7
	lduw	[%l7 + %i7],	%l3
	nop
	set	0x1C, %g4
	sth	%o0,	[%l7 + %g4]
	fpadd32s	%f22,	%f21,	%f12
	set	0x78, %i0
	lda	[%l7 + %i0] 0x88,	%f21
	nop
	set	0x72, %o7
	stb	%l4,	[%l7 + %o7]
	add	%g2,	%i0,	%l2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xd8
	and	%g6,	%g3,	%g4
	or	%l6,	%g1,	%g5
	and	%o3,	%o6,	%i5
	nop
	set	0x36, %i5
	sth	%o4,	[%l7 + %i5]
	ld	[%l7 + 0x74],	%f9
	nop
	set	0x28, %i3
	std	%f20,	[%l7 + %i3]
	nop
	set	0x24, %g2
	swap	[%l7 + %g2],	%o5
	nop
	set	0x58, %l0
	ldsw	[%l7 + %l0],	%l1
	ld	[%l7 + 0x1C],	%f7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
	nop
	set	0x6D, %o4
	ldub	[%l7 + %o4],	%i7
	add	%i6,	%i1,	%o1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f16
	set	0x14, %i6
	stwa	%i4,	[%l7 + %i6] 0x81
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%i3
	set	0x70, %i2
	swapa	[%l7 + %i2] 0x89,	%i2
	set	0x18, %o5
	lda	[%l7 + %o5] 0x81,	%f20
	add	%l0,	%o7,	%o2
	nop
	set	0x3D, %l3
	stb	%l5,	[%l7 + %l3]
	nop
	set	0x68, %l5
	stx	%g7,	[%l7 + %l5]
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%f10
	wr	%o0,	%l3,	%sys_tick
	nop
	set	0x78, %o3
	lduw	[%l7 + %o3],	%l4
	set	0x0C, %o6
	stwa	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i0
	nop
	set	0x4A, %o0
	sth	%g6,	[%l7 + %o0]
	fpsub16	%f18,	%f16,	%f2
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%g3
	set	0x50, %o2
	lda	[%l7 + %o2] 0x88,	%f7
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x7F, %g1
	stb	%g4,	[%l7 + %g1]
	ld	[%l7 + 0x3C],	%f0
	st	%fsr,	[%l7 + 0x18]
	and	%l6,	%g1,	%g5
	and	%o6,	%i5,	%o3
	nop
	set	0x27, %g7
	stb	%o4,	[%l7 + %g7]
	set	0x67, %l1
	stba	%o5,	[%l7 + %l1] 0x89
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x80,	%l1
	nop
	set	0x16, %i4
	lduh	[%l7 + %i4],	%i6
	set	0x36, %l6
	stha	%i7,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x48, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x10, %g4
	lduw	[%l7 + %g4],	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%i3
	nop
	set	0x2C, %o7
	lduw	[%l7 + %o7],	%i4
	nop
	set	0x32, %i1
	lduh	[%l7 + %i1],	%i2
	or	%o7,	%l0,	%l5
	nop
	set	0x56, %i5
	ldsb	[%l7 + %i5],	%g7
	set	0x38, %i3
	stda	%o2,	[%l7 + %i3] 0x81
	nop
	set	0x7A, %i0
	stb	%o0,	[%l7 + %i0]
	nop
	set	0x78, %l0
	ldsh	[%l7 + %l0],	%l3
	nop
	set	0x34, %g2
	lduw	[%l7 + %g2],	%l4
	set	0x28, %g5
	stxa	%l2,	[%l7 + %g5] 0x88
	and	%g2,	%g6,	%i0
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x20, %l2
	lduh	[%l7 + %l2],	%g3
	nop
	set	0x54, %i6
	lduh	[%l7 + %i6],	%g4
	wr	%l6,	%g1,	%clear_softint
	nop
	set	0x14, %o4
	lduw	[%l7 + %o4],	%g5
	set	0x60, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xe3,	%i4
	nop
	set	0x4C, %l3
	stw	%o4,	[%l7 + %l3]
	st	%f7,	[%l7 + 0x28]
	st	%f31,	[%l7 + 0x14]
	nop
	set	0x68, %o5
	lduw	[%l7 + %o5],	%o3
	and	%o5,	%i6,	%i7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%o1
	nop
	set	0x7C, %l5
	prefetch	[%l7 + %l5],	 4
	and	%i3,	%i1,	%i2
	nop
	set	0x50, %o1
	ldub	[%l7 + %o1],	%i4
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f0
	nop
	set	0x58, %o6
	swap	[%l7 + %o6],	%l0
	and	%l5,	%o7,	%o2
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%o0
	add	%l3,	%g7,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%g6
	set	0x64, %o0
	stha	%i0,	[%l7 + %o0] 0x89
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f20
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xe2,	%g2
	nop
	set	0x70, %g7
	std	%f18,	[%l7 + %g7]
	nop
	set	0x20, %g6
	prefetch	[%l7 + %g6],	 4
	st	%fsr,	[%l7 + 0x14]
	nop
	nop
	setx	0x1887C5718DC62224,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE973955ECCD5B2A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f12,	%f18
	nop
	set	0x10, %i4
	stw	%l2,	[%l7 + %i4]
	add	%g4,	%g1,	%g5
	nop
	set	0x68, %l6
	stx	%o6,	[%l7 + %l6]
	nop
	set	0x38, %i7
	std	%f26,	[%l7 + %i7]
	nop
	set	0x08, %l1
	lduw	[%l7 + %l1],	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o3
	or	%o5,	%o4,	%i7
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%i6
	fpadd32s	%f2,	%f0,	%f1
	set	0x65, %i1
	stba	%l1,	[%l7 + %i1] 0x89
	set	0x10, %i5
	sta	%f26,	[%l7 + %i5] 0x89
	nop
	set	0x0E, %i3
	ldstub	[%l7 + %i3],	%i3
	set	0x34, %i0
	stwa	%i1,	[%l7 + %i0] 0x80
	nop
	set	0x28, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i4
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x34, %g5
	lduw	[%l7 + %g5],	%l0
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%l5
	nop
	set	0x3C, %i6
	ldsw	[%l7 + %i6],	%i2
	nop
	set	0x69, %l2
	ldsb	[%l7 + %l2],	%o7
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x88,	%o0
	set	0x74, %i2
	sta	%f14,	[%l7 + %i2] 0x88
	nop
	set	0x4B, %g3
	stb	%l3,	[%l7 + %g3]
	set	0x7E, %l3
	stba	%g7,	[%l7 + %l3] 0xea
	membar	#Sync
	or	%o2,	%l4,	%g2
	add	%g6,	%g3,	%l2
	set	0x38, %l5
	lda	[%l7 + %l5] 0x89,	%f16
	nop
	set	0x6A, %o1
	ldub	[%l7 + %o1],	%i0
	nop
	set	0x4E, %o5
	stb	%g4,	[%l7 + %o5]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xd8
	nop
	set	0x2C, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x80,	%g0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%l6
	nop
	set	0x30, %l4
	ldstub	[%l7 + %l4],	%i5
	nop
	set	0x3E, %o2
	sth	%g5,	[%l7 + %o2]
	nop
	set	0x0E, %g1
	ldstub	[%l7 + %g1],	%o5
	set	0x2C, %g6
	stwa	%o4,	[%l7 + %g6] 0x89
	nop
	set	0x0D, %g7
	ldsb	[%l7 + %g7],	%i7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x47, %i4
	ldstub	[%l7 + %i4],	%o3
	nop
	set	0x29, %i7
	stb	%l1,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x0C]
	ld	[%l7 + 0x60],	%f17
	set	0x73, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i3
	nop
	set	0x54, %o7
	ldsw	[%l7 + %o7],	%i6
	st	%f30,	[%l7 + 0x54]
	set	0x14, %i1
	swapa	[%l7 + %i1] 0x89,	%o1
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	st	%f4,	[%l7 + 0x5C]
	fpsub16s	%f13,	%f4,	%f3
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x58, %i3
	lda	[%l7 + %i3] 0x80,	%f18
	set	0x38, %i0
	ldxa	[%l7 + %i0] 0x89,	%i4
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	nop
	set	0x38, %g4
	stx	%l5,	[%l7 + %g4]
	set	0x48, %g2
	lda	[%l7 + %g2] 0x89,	%f4
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0
	set	0x18, %l2
	stda	%l0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x2C, %o4
	ldstub	[%l7 + %o4],	%o0
	nop
	nop
	setx	0x69CDCA74A2914064,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x5DEDE44E379D78D0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f28,	%f16
	and	%l3,	%o7,	%g7
	nop
	set	0x10, %i2
	ldsh	[%l7 + %i2],	%l4
	nop
	set	0x20, %l3
	stx	%g2,	[%l7 + %l3]
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x89,	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g3
	set	0x18, %o1
	stha	%i0,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x15, %o5
	stba	%l2,	[%l7 + %o5] 0x81
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%g0
	nop
	set	0x6F, %l5
	ldsb	[%l7 + %l5],	%o6
	set	0x50, %o0
	swapa	[%l7 + %o0] 0x81,	%g4
	set	0x1C, %l4
	sta	%f26,	[%l7 + %l4] 0x88
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x81,	%l6
	set	0x38, %o6
	stxa	%g5,	[%l7 + %o6] 0x89
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	nop
	set	0x2C, %g7
	ldsw	[%l7 + %g7],	%o4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o4
	nop
	set	0x74, %g6
	stw	%i7,	[%l7 + %g6]
	nop
	set	0x08, %i7
	stw	%o3,	[%l7 + %i7]
	nop
	set	0x08, %o7
	lduw	[%l7 + %o7],	%l1
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x89,	 1
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%o1
	nop
	set	0x48, %i5
	ldsh	[%l7 + %i5],	%i4
	set	0x30, %i3
	stxa	%i1,	[%l7 + %i3] 0x88
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x89
	nop
	set	0x2C, %i0
	swap	[%l7 + %i0],	%i6
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x80,	%l4
	set	0x40, %l0
	sta	%f6,	[%l7 + %l0] 0x80
	nop
	set	0x31, %g2
	ldub	[%l7 + %g2],	%l0
	nop
	set	0x2A, %g5
	sth	%i2,	[%l7 + %g5]
	nop
	set	0x56, %i6
	ldub	[%l7 + %i6],	%o0
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%l3
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%o7
	nop
	set	0x28, %i2
	std	%g6,	[%l7 + %i2]
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	nop
	set	0x20, %l3
	std	%o2,	[%l7 + %l3]
	st	%f1,	[%l7 + 0x20]
	and	%g6,	%l4,	%g3
	st	%f11,	[%l7 + 0x14]
	be,pn	%xcc,	loop_53
	nop
	set	0x10, %o5
	stx	%i0,	[%l7 + %o5]
	nop
	set	0x36, %o1
	stb	%l2,	[%l7 + %o1]
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x88,	%g1
loop_53:
	nop
	set	0x46, %o3
	stha	%g4,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x88,	%o6
	nop
	set	0x6B, %o2
	ldub	[%l7 + %o2],	%g5
	set	0x42, %l4
	stha	%l6,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f16
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x89,	 4
	set	0x60, %o6
	sta	%f28,	[%l7 + %o6] 0x89
	bg,pt	%xcc,	loop_54
	st	%f24,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x1C]
	add	%i5,	%o5,	%o3
loop_54:
	nop
	set	0x40, %i4
	std	%l0,	[%l7 + %i4]
	nop
	set	0x64, %g6
	ldsb	[%l7 + %g6],	%i7
	nop
	set	0x78, %i7
	lduw	[%l7 + %i7],	%i3
	nop
	set	0x40, %o7
	std	%f24,	[%l7 + %o7]
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%o1
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x88,	%i4
	set	0x6E, %i3
	stha	%i1,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x40, %l6
	lda	[%l7 + %l6] 0x88,	%f30
	and	%l5,	%i6,	%i2
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	nop
	set	0x2A, %g4
	lduh	[%l7 + %g4],	%o0
	ld	[%l7 + 0x28],	%f6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%g7
	nop
	set	0x19, %l0
	stb	%g2,	[%l7 + %l0]
	add	%o2,	%g6,	%l4
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x80,	%g3
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x88,	%i0
	nop
	set	0x64, %g2
	ldsb	[%l7 + %g2],	%l2
	nop
	set	0x20, %i6
	stx	%o7,	[%l7 + %i6]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x88,	 3
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%o6
	fpsub16	%f26,	%f10,	%f6
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x88,	%g5
	nop
	set	0x60, %o4
	swap	[%l7 + %o4],	%l6
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%g0
	set	0x76, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o4
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f10
	nop
	set	0x54, %o0
	ldsh	[%l7 + %o0],	%o5
	set	0x68, %o2
	stda	%o2,	[%l7 + %o2] 0x88
	nop
	set	0x54, %o1
	ldsw	[%l7 + %o1],	%i5
	nop
	set	0x34, %g1
	ldsw	[%l7 + %g1],	%l1
	set	0x5D, %l4
	ldstuba	[%l7 + %l4] 0x81,	%i3
	set	0x09, %o6
	stba	%o1,	[%l7 + %o6] 0x80
	set	0x14, %g7
	sta	%f26,	[%l7 + %g7] 0x80
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x80,	%i7
	set	0x54, %i4
	lda	[%l7 + %i4] 0x81,	%f9
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%i4,	%i1,	%i6
	or	%l5,	%l0,	%i2
	set	0x58, %i7
	lda	[%l7 + %i7] 0x81,	%f4
	nop
	set	0x52, %i3
	ldstub	[%l7 + %i3],	%l3
	set	0x7A, %l6
	stha	%g7,	[%l7 + %l6] 0xe2
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%l4
	nop
	set	0x10, %i0
	std	%g6,	[%l7 + %i0]
	nop
	set	0x61, %i5
	ldstub	[%l7 + %i5],	%g3
	nop
	set	0x38, %g4
	ldsw	[%l7 + %g4],	%i0
	nop
	set	0x4E, %l1
	ldsh	[%l7 + %l1],	%l2
	set	0x40, %g5
	stxa	%o7,	[%l7 + %g5] 0x80
	st	%f3,	[%l7 + 0x1C]
	fpsub32	%f18,	%f14,	%f8
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd8
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%g4
	nop
	set	0x34, %i6
	ldsw	[%l7 + %i6],	%g5
	nop
	set	0x78, %i2
	stx	%o6,	[%l7 + %i2]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%o4
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f16
	or	%o5,	%o3,	%i5
	set	0x28, %g3
	stxa	%l6,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x24, %o5
	lda	[%l7 + %o5] 0x89,	%f13
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x88,	%i3
	nop
	set	0x18, %l5
	ldsh	[%l7 + %l5],	%l1
	set	0x24, %o3
	sta	%f6,	[%l7 + %o3] 0x80
	set	0x18, %o0
	stda	%o0,	[%l7 + %o0] 0x81
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	nop
	set	0x0A, %o1
	ldub	[%l7 + %o1],	%i4
	nop
	set	0x33, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x48, %l4
	lduh	[%l7 + %l4],	%i6
	ld	[%l7 + 0x48],	%f27
	set	0x34, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l5
	wr	%i2,	%l0,	%clear_softint
	fpadd32s	%f17,	%f11,	%f10
	add	%l3,	%g7,	%g2
	fpsub32	%f2,	%f10,	%f28
	nop
	set	0x68, %g1
	ldsw	[%l7 + %g1],	%o2
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f22
	nop
	set	0x1C, %g7
	prefetch	[%l7 + %g7],	 4
	or	%o0,	%g6,	%l4
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x80,	 2
	nop
	set	0x20, %o7
	sth	%l2,	[%l7 + %o7]
	set	0x50, %i1
	sta	%f15,	[%l7 + %i1] 0x80
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x89,	%g3
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x81,	%o7
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x89,	%g5
	wr	%g4,	%o6,	%pic
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f14
	st	%f19,	[%l7 + 0x74]
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f0
	or	%o4,	%g1,	%o5
	set	0x0C, %l1
	stba	%o3,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x2C, %g5
	stb	%l6,	[%l7 + %g5]
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%i5
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%l0
	nop
	set	0x5F, %i6
	stb	%i3,	[%l7 + %i6]
	nop
	set	0x08, %i2
	stx	%i7,	[%l7 + %i2]
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x60, %g3
	stx	%i4,	[%l7 + %g3]
	set	0x44, %g2
	swapa	[%l7 + %g2] 0x81,	%o1
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%i6
	nop
	set	0x10, %l5
	std	%l4,	[%l7 + %l5]
	set	0x20, %o5
	stxa	%i1,	[%l7 + %o5] 0x81
	nop
	set	0x42, %o0
	sth	%i2,	[%l7 + %o0]
	bge	%icc,	loop_55
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%l0
	nop
	set	0x16, %o3
	stb	%l3,	[%l7 + %o3]
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
loop_55:
	or	%g7,	%o2,	%g2
	nop
	set	0x0C, %l4
	stw	%o0,	[%l7 + %l4]
	nop
	set	0x58, %o4
	stx	%l4,	[%l7 + %o4]
	nop
	set	0x2E, %g1
	stb	%i0,	[%l7 + %g1]
	set	0x34, %g6
	lda	[%l7 + %g6] 0x80,	%f10
	set	0x3C, %g7
	stha	%g6,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x38, %o6
	stx	%l2,	[%l7 + %o6]
	set	0x44, %i4
	stwa	%o7,	[%l7 + %i4] 0x88
	bne	%xcc,	loop_56
	nop
	set	0x1C, %i1
	stw	%g3,	[%l7 + %i1]
	set	0x18, %i7
	stxa	%g4,	[%l7 + %i7] 0xeb
	membar	#Sync
loop_56:
	nop
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x81,	%o6
	nop
	set	0x2F, %o7
	ldsb	[%l7 + %o7],	%o4
	set	0x56, %i5
	stba	%g1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x50, %g4
	stb	%g5,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x08, %l6
	stx	%o5,	[%l7 + %l6]
	set	0x56, %l1
	stha	%l6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x10, %i0
	std	%i4,	[%l7 + %i0]
	nop
	set	0x39, %l0
	ldub	[%l7 + %l0],	%o3
	ble,a	%icc,	loop_57
	or	%i3,	%i7,	%l1
	set	0x48, %i6
	stxa	%o1,	[%l7 + %i6] 0x80
loop_57:
	nop
	set	0x40, %i2
	prefetch	[%l7 + %i2],	 4
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x81,	%f10
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%i4
	nop
	set	0x26, %g5
	lduh	[%l7 + %g5],	%l5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	fpsub32	%f14,	%f18,	%f10
	set	0x20, %g2
	lda	[%l7 + %g2] 0x88,	%f22
	nop
	set	0x0F, %l5
	ldsb	[%l7 + %l5],	%i6
	set	0x58, %o0
	stda	%i2,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%l0
	set	0x1D, %o3
	stba	%i1,	[%l7 + %o3] 0x88
	nop
	set	0x30, %o5
	lduw	[%l7 + %o5],	%l3
	nop
	set	0x3E, %o1
	ldsh	[%l7 + %o1],	%o2
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x88,	%o0
	set	0x7C, %g6
	sta	%f15,	[%l7 + %g6] 0x81
	set	0x4C, %g7
	sta	%f5,	[%l7 + %g7] 0x81
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%l4
	and	%g7,	%g6,	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%g3
	set	0x40, %i4
	stxa	%g4,	[%l7 + %i4] 0x80
	add	%o6,	%o4,	%g1
	set	0x48, %i1
	stwa	%g5,	[%l7 + %i1] 0x81
	nop
	set	0x40, %i7
	std	%l2,	[%l7 + %i7]
	nop
	set	0x18, %i3
	std	%i6,	[%l7 + %i3]
	set	0x1C, %o7
	sta	%f10,	[%l7 + %o7] 0x80
	nop
	set	0x0A, %i5
	ldsb	[%l7 + %i5],	%o5
	nop
	set	0x18, %g4
	stw	%i5,	[%l7 + %g4]
	fpadd16s	%f3,	%f2,	%f8
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	st	%f5,	[%l7 + 0x30]
	nop
	set	0x5F, %g1
	ldsb	[%l7 + %g1],	%i3
	nop
	set	0x58, %l1
	std	%i6,	[%l7 + %l1]
	nop
	set	0x49, %i0
	stb	%o3,	[%l7 + %i0]
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xea,	%l0
	nop
	set	0x79, %i6
	ldsb	[%l7 + %i6],	%o1
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x89,	%l5
	nop
	set	0x13, %i2
	ldstub	[%l7 + %i2],	%i6
	set	0x48, %g3
	swapa	[%l7 + %g3] 0x88,	%i4
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x80,	%l0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	nop
	set	0x3C, %g2
	ldsh	[%l7 + %g2],	%i2
	or	%l3,	%i1,	%o2
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f16
	set	0x10, %o2
	sta	%f30,	[%l7 + %o2] 0x81
	nop
	set	0x0E, %o3
	lduh	[%l7 + %o3],	%g2
	add	%l4,	%o0,	%g7
	nop
	set	0x68, %l5
	std	%f24,	[%l7 + %l5]
	add	%i0,	%o7,	%g3
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%g6
	ld	[%l7 + 0x34],	%f13
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%o6
	bgu,a,pn	%xcc,	loop_58
	add	%g4,	%o4,	%g5
	set	0x50, %l4
	sta	%f27,	[%l7 + %l4] 0x88
loop_58:
	nop
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x80,	%l2
	set	0x34, %o4
	stba	%g1,	[%l7 + %o4] 0x81
	nop
	set	0x38, %g7
	lduh	[%l7 + %g7],	%l6
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	fpsub16s	%f21,	%f21,	%f31
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x88,	%i5
	nop
	set	0x30, %i7
	ldsw	[%l7 + %i7],	%i3
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	set	0x64, %o7
	swapa	[%l7 + %o7] 0x81,	%i7
	or	%l1,	%o3,	%l5
	nop
	set	0x40, %i5
	ldsb	[%l7 + %i5],	%o1
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	nop
	set	0x30, %i4
	std	%l0,	[%l7 + %i4]
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%i4
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x80,	%i2
	nop
	set	0x18, %i0
	stx	%l3,	[%l7 + %i0]
	nop
	set	0x78, %l6
	std	%o2,	[%l7 + %l6]
	set	0x15, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i1
	nop
	set	0x30, %l2
	std	%f14,	[%l7 + %l2]
	nop
	set	0x18, %i6
	ldsh	[%l7 + %i6],	%l4
	and	%o0,	%g7,	%g2
	ld	[%l7 + 0x68],	%f30
	nop
	set	0x0A, %g3
	lduh	[%l7 + %g3],	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%g3
	add	%o6,	%g6,	%o4
	nop
	set	0x34, %g5
	lduw	[%l7 + %g5],	%g4
	fpsub32s	%f29,	%f31,	%f4
	nop
	set	0x7E, %i2
	lduh	[%l7 + %i2],	%l2
	set	0x78, %l3
	stda	%g0,	[%l7 + %l3] 0x81
	nop
	set	0x54, %g2
	lduh	[%l7 + %g2],	%g5
	nop
	set	0x2A, %o2
	ldsh	[%l7 + %o2],	%i5
	and	%i3,	%o5,	%i7
	st	%f27,	[%l7 + 0x0C]
	nop
	set	0x18, %o0
	stw	%l1,	[%l7 + %o0]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%l6
	fpsub16	%f4,	%f22,	%f24
	and	%l5,	%o1,	%l0
	nop
	set	0x36, %o3
	ldstub	[%l7 + %o3],	%i6
	set	0x14, %o1
	swapa	[%l7 + %o1] 0x88,	%i2
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x81,	%l2
	or	%i4,	%i1,	%l4
	add	%o0,	%o2,	%g7
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x88
	st	%f26,	[%l7 + 0x40]
	set	0x0C, %l4
	swapa	[%l7 + %l4] 0x81,	%g2
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f18
	set	0x6D, %o4
	stba	%i0,	[%l7 + %o4] 0x89
	nop
	set	0x24, %o6
	ldub	[%l7 + %o6],	%o7
	nop
	set	0x61, %g7
	ldstub	[%l7 + %g7],	%g3
	nop
	set	0x50, %i7
	sth	%g6,	[%l7 + %i7]
	nop
	set	0x62, %i1
	sth	%o6,	[%l7 + %i1]
	set	0x34, %i3
	swapa	[%l7 + %i3] 0x81,	%o4
	set	0x78, %o7
	stxa	%l2,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%g4
	wr	%g1,	%g5,	%sys_tick
	nop
	set	0x58, %i5
	std	%i4,	[%l7 + %i5]
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x30, %g1
	stxa	%o5,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x0C, %l1
	sth	%i3,	[%l7 + %l1]
	nop
	set	0x14, %i0
	swap	[%l7 + %i0],	%l1
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f16
	set	0x48, %l2
	stba	%i7,	[%l7 + %l2] 0x88
	set	0x6F, %l0
	stba	%l6,	[%l7 + %l0] 0x89
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%o1
	nop
	set	0x60, %g3
	stw	%l0,	[%l7 + %g3]
	set	0x7C, %g5
	sta	%f24,	[%l7 + %g5] 0x81
	nop
	set	0x48, %l3
	prefetch	[%l7 + %l3],	 0
	and	%i2,	%i6,	%l3
	nop
	set	0x44, %g2
	stw	%i1,	[%l7 + %g2]
	nop
	set	0x57, %o2
	ldstub	[%l7 + %o2],	%i4
	be	%xcc,	loop_59
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f14
	ld	[%l7 + 0x68],	%f4
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f28
loop_59:
	or	%o0,	%o2,	%g7
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%g2
	set	0x10, %l5
	stha	%l4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xea,	%i0
	set	0x78, %l4
	stxa	%o7,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x49, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x88
	add	%g6,	%o4,	%o6
	set	0x3C, %o3
	sta	%f19,	[%l7 + %o3] 0x89
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f16
	bn,pn	%icc,	loop_60
	nop
	set	0x0E, %i7
	lduh	[%l7 + %i7],	%g4
	nop
	set	0x38, %i1
	lduh	[%l7 + %i1],	%g1
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%l2
loop_60:
	nop
	set	0x60, %i3
	ldub	[%l7 + %i3],	%i5
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%g5
	set	0x3C, %i5
	lda	[%l7 + %i5] 0x81,	%f18
	nop
	set	0x1C, %i4
	stw	%o5,	[%l7 + %i4]
	nop
	set	0x49, %o7
	stb	%i3,	[%l7 + %o7]
	or	%l1,	%i7,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o1
	st	%f21,	[%l7 + 0x1C]
	set	0x70, %g1
	stwa	%l5,	[%l7 + %g1] 0x89
	wr	%l0,	%i6,	%pic
	nop
	set	0x6C, %i0
	stb	%i2,	[%l7 + %i0]
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%l3
	set	0x2C, %l6
	lda	[%l7 + %l6] 0x80,	%f17
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%i0
	set	0x24, %i6
	sta	%f1,	[%l7 + %i6] 0x89
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xeb,	%o0
	set	0x56, %g5
	stha	%i4,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x81,	%g7
	fpsub16	%f18,	%f26,	%f28
	set	0x78, %g2
	stda	%g2,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x58, %l3
	stha	%l4,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x6C, %o2
	sta	%f17,	[%l7 + %o2] 0x89
	fpsub16s	%f19,	%f4,	%f16
	nop
	set	0x70, %o0
	stx	%o2,	[%l7 + %o0]
	add	%i0,	%g3,	%g6
	or	%o4,	%o7,	%o6
	and	%g4,	%l2,	%g1
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x88,	%g5
	nop
	set	0x1C, %l5
	ldstub	[%l7 + %l5],	%i5
	wr	%i3,	%l1,	%pic
	set	0x70, %i2
	stxa	%o5,	[%l7 + %i2] 0xeb
	membar	#Sync
	be,a,pt	%icc,	loop_61
	bg	%icc,	loop_62
	nop
	set	0x1E, %o5
	stb	%o3,	[%l7 + %o5]
	nop
	set	0x40, %l4
	std	%i6,	[%l7 + %l4]
loop_61:
	nop
	set	0x1C, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o1
loop_62:
	nop
	set	0x58, %g6
	stda	%l4,	[%l7 + %g6] 0x81
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 0
	st	%fsr,	[%l7 + 0x24]
	set	0x78, %i7
	ldxa	[%l7 + %i7] 0x88,	%l6
	set	, %o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1260
!	Type a   	: 25
!	Type cti   	: 25
!	Type x   	: 529
!	Type f   	: 38
!	Type i   	: 123
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
	set	0x3,	%g1
	set	0xE,	%g2
	set	0x2,	%g3
	set	0x0,	%g4
	set	0x8,	%g5
	set	0xA,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x4,	%i1
	set	-0x1,	%i2
	set	-0x0,	%i3
	set	-0x4,	%i4
	set	-0x8,	%i5
	set	-0x5,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x4F7502B1,	%l0
	set	0x3C2875B1,	%l1
	set	0x5953F298,	%l2
	set	0x5F6B925E,	%l3
	set	0x57138DEE,	%l4
	set	0x653B9657,	%l5
	set	0x0510CD8A,	%l6
	!# Output registers
	set	-0x04CA,	%o0
	set	-0x0891,	%o1
	set	0x1303,	%o2
	set	-0x05DF,	%o3
	set	0x1B81,	%o4
	set	-0x17F7,	%o5
	set	0x1AAB,	%o6
	set	-0x0756,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	set	0x78, %g7
	stxa	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x10, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x4B, %g4
	ldub	[%l7 + %g4],	%i2
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%l3
	nop
	set	0x70, %i4
	stw	%l0,	[%l7 + %i4]
	or	%o0,	%i1,	%g7
	nop
	set	0x2E, %i3
	ldsh	[%l7 + %i3],	%i4
	nop
	set	0x78, %o7
	sth	%g2,	[%l7 + %o7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%i0
	nop
	set	0x50, %i0
	std	%f28,	[%l7 + %i0]
	set	0x20, %g1
	swapa	[%l7 + %g1] 0x80,	%l4
	add	%g3,	%g6,	%o4
	nop
	set	0x5D, %l6
	ldub	[%l7 + %l6],	%o7
	nop
	set	0x2C, %l1
	ldsw	[%l7 + %l1],	%g4
	nop
	set	0x30, %i6
	prefetch	[%l7 + %i6],	 0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	wr	%l2,	%g1,	%y
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x80,	%o6
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%i5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f0
	nop
	set	0x78, %l3
	std	%g4,	[%l7 + %l3]
	or	%i3,	%l1,	%o3
	or	%i7,	%o1,	%o5
	nop
	set	0x5C, %o2
	swap	[%l7 + %o2],	%l5
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%i6
	nop
	set	0x1C, %o1
	ldub	[%l7 + %o1],	%i2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f16
	nop
	set	0x43, %i2
	ldsb	[%l7 + %i2],	%l6
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%l3
	nop
	set	0x08, %g3
	std	%o0,	[%l7 + %g3]
	nop
	set	0x40, %o4
	std	%f12,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x1C]
	set	0x72, %g6
	stha	%i1,	[%l7 + %g6] 0xea
	membar	#Sync
	and	%g7,	%l0,	%i4
	nop
	set	0x29, %l4
	ldstub	[%l7 + %l4],	%g2
	nop
	set	0x38, %o3
	prefetch	[%l7 + %o3],	 0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%l4
	nop
	set	0x0C, %o6
	prefetch	[%l7 + %o6],	 4
	bleu,pt	%xcc,	loop_63
	nop
	set	0x70, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x80,	 4
loop_63:
	nop
	set	0x08, %g4
	ldub	[%l7 + %g4],	%g3
	set	0x3C, %i5
	sta	%f18,	[%l7 + %i5] 0x80
	set	0x58, %i1
	stxa	%g6,	[%l7 + %i1] 0x88
	set	0x28, %i3
	stda	%o6,	[%l7 + %i3] 0x88
	set	0x40, %o7
	swapa	[%l7 + %o7] 0x89,	%o4
	add	%g4,	%g1,	%o6
	nop
	set	0x60, %i0
	swap	[%l7 + %i0],	%l2
	st	%fsr,	[%l7 + 0x44]
	bg,a,pt	%xcc,	loop_64
	nop
	set	0x14, %g1
	ldsw	[%l7 + %g1],	%i5
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%i2
loop_64:
	nop
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x88,	%g5
	nop
	set	0x10, %l6
	ldsw	[%l7 + %l6],	%l1
	nop
	set	0x6A, %l0
	sth	%i7,	[%l7 + %l0]
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x89,	%o1
	or	%o3,	%l5,	%o5
	set	0x72, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i2
	nop
	set	0x46, %g2
	lduh	[%l7 + %g2],	%i6
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x88,	%l6
	nop
	set	0x57, %o2
	ldstub	[%l7 + %o2],	%o0
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xe2,	%i0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd2,	%f16
	add	%l3,	%g7,	%i4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f16
	set	0x44, %i2
	lda	[%l7 + %i2] 0x80,	%f3
	set	0x10, %l5
	stwa	%g2,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x36, %g3
	ldsb	[%l7 + %g3],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%l4
	nop
	set	0x6C, %o4
	stw	%o2,	[%l7 + %o4]
	nop
	set	0x24, %o5
	lduh	[%l7 + %o5],	%g3
	nop
	set	0x3E, %l4
	lduh	[%l7 + %l4],	%o7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o4
	nop
	set	0x64, %o3
	ldsb	[%l7 + %o3],	%g1
	fpsub32	%f18,	%f12,	%f18
	set	0x20, %o6
	stha	%g4,	[%l7 + %o6] 0x88
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%o6
	nop
	set	0x1F, %i7
	ldsb	[%l7 + %i7],	%l2
	nop
	set	0x08, %g6
	stx	%i3,	[%l7 + %g6]
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%i4
	set	0x50, %i1
	stha	%l1,	[%l7 + %i1] 0x81
	nop
	set	0x30, %g4
	swap	[%l7 + %g4],	%i7
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	set	0x14, %i3
	swapa	[%l7 + %i3] 0x88,	%o1
	ld	[%l7 + 0x64],	%f4
	nop
	set	0x70, %i0
	std	%o2,	[%l7 + %i0]
	nop
	set	0x78, %g1
	ldsh	[%l7 + %g1],	%o5
	set	0x2D, %l1
	stba	%i2,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%l5
	nop
	set	0x2E, %l6
	ldsh	[%l7 + %l6],	%l6
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%g7
	nop
	set	0x76, %g5
	stb	%i1,	[%l7 + %g5]
	set	0x58, %g2
	stxa	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%g2
	set	0x70, %o2
	stxa	%l0,	[%l7 + %o2] 0xea
	membar	#Sync
	fpadd32s	%f4,	%f13,	%f1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f0
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x89,	%l4
	nop
	set	0x28, %l3
	sth	%o2,	[%l7 + %l3]
	nop
	set	0x7A, %o1
	sth	%i0,	[%l7 + %o1]
	nop
	set	0x10, %i2
	ldsh	[%l7 + %i2],	%o7
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x68, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x54, %o4
	sth	%g6,	[%l7 + %o4]
	st	%f8,	[%l7 + 0x4C]
	set	0x2C, %o5
	lda	[%l7 + %o5] 0x81,	%f4
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x88,	%f25
	nop
	set	0x69, %l4
	ldsb	[%l7 + %l4],	%o4
	set	0x68, %g7
	stda	%g0,	[%l7 + %g7] 0x88
	nop
	set	0x24, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x60, %g6
	lduw	[%l7 + %g6],	%g4
	set	0x42, %i5
	ldstuba	[%l7 + %i5] 0x80,	%i3
	add	%i5,	%l2,	%i7
	and	%g5,	%l1,	%o1
	set	0x60, %o6
	stwa	%o5,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x18, %i1
	stw	%i2,	[%l7 + %i1]
	set	0x5C, %o7
	stha	%o3,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x74, %g4
	lda	[%l7 + %g4] 0x80,	%f22
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x88,	%l4
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%i6
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x22, %i0
	stha	%l6,	[%l7 + %i0] 0x80
	ld	[%l7 + 0x10],	%f11
	fpsub16	%f22,	%f18,	%f0
	or	%o0,	%g7,	%l3
	wr	%i1,	%i4,	%sys_tick
	add	%g2,	%l4,	%o2
	nop
	set	0x40, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x40, %i4
	stxa	%i0,	[%l7 + %i4] 0x81
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x89,	%o7
	nop
	set	0x28, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x52, %o2
	ldsb	[%l7 + %o2],	%g6
	fpsub16s	%f5,	%f28,	%f19
	nop
	set	0x10, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x78, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x78, %l2
	lduw	[%l7 + %l2],	%g3
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x81,	%o4
	nop
	nop
	setx	0x053C79E3DBCF2DEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x2664CB760DC36D55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f0
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x88,	%g1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i3
	fpadd16s	%f27,	%f28,	%f29
	set	0x48, %g3
	stda	%i4,	[%l7 + %g3] 0x81
	set	0x08, %i2
	stxa	%o6,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x48, %l5
	stxa	%i7,	[%l7 + %l5] 0xea
	membar	#Sync
	st	%f10,	[%l7 + 0x6C]
	nop
	set	0x44, %o5
	stb	%g5,	[%l7 + %o5]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%l2
	fpadd16	%f2,	%f2,	%f26
	nop
	set	0x60, %o3
	stx	%o1,	[%l7 + %o3]
	nop
	set	0x08, %o4
	swap	[%l7 + %o4],	%o5
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x81,	%o3
	set	0x0C, %i7
	lda	[%l7 + %i7] 0x88,	%f23
	nop
	set	0x49, %g7
	ldub	[%l7 + %g7],	%i2
	set	0x2F, %i5
	stba	%l5,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x38, %g6
	std	%f4,	[%l7 + %g6]
	or	%l6,	%o0,	%g7
	nop
	nop
	setx	0x479D1874C75E49AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8C0413A0AE8B9407,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f26
	nop
	set	0x74, %o6
	lduw	[%l7 + %o6],	%i6
	add	%i1,	%l3,	%g2
	set	0x14, %i1
	stba	%l4,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x18, %g4
	std	%i4,	[%l7 + %g4]
	add	%i0,	%o7,	%o2
	st	%f6,	[%l7 + 0x10]
	nop
	set	0x0A, %o7
	lduh	[%l7 + %o7],	%l0
	nop
	set	0x30, %i3
	std	%g6,	[%l7 + %i3]
	set	0x2C, %l1
	swapa	[%l7 + %l1] 0x88,	%g3
	nop
	set	0x48, %i0
	std	%f8,	[%l7 + %i0]
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i3
	nop
	set	0x40, %l6
	stx	%i5,	[%l7 + %l6]
	nop
	set	0x6C, %i4
	ldsb	[%l7 + %i4],	%o6
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x89,	 4
	nop
	set	0x34, %l0
	prefetch	[%l7 + %l0],	 3
	set	0x52, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o4
	nop
	set	0x40, %g2
	stw	%g5,	[%l7 + %g2]
	wr	%l1,	%l2,	%sys_tick
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%o1
	fpsub32	%f30,	%f24,	%f12
	add	%o3,	%i2,	%l5
	nop
	set	0x6E, %l2
	stb	%o5,	[%l7 + %l2]
	and	%o0,	%l6,	%g7
	st	%fsr,	[%l7 + 0x2C]
	ld	[%l7 + 0x40],	%f15
	nop
	set	0x44, %o0
	stw	%i1,	[%l7 + %o0]
	nop
	set	0x71, %l3
	ldsb	[%l7 + %l3],	%l3
	set	0x1A, %o1
	stba	%i6,	[%l7 + %o1] 0x81
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f16
	fpadd16s	%f22,	%f17,	%f29
	wr	%g2,	%i4,	%pic
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x80,	 1
	and	%o7,	%l4,	%l0
	nop
	set	0x60, %o5
	std	%f4,	[%l7 + %o5]
	set	0x6E, %i2
	stba	%g6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x24, %o3
	lda	[%l7 + %o3] 0x80,	%f27
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%o2
	st	%fsr,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x64]
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x80,	 4
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x80,	%i3
	add	%g1,	%i5,	%i7
	nop
	set	0x33, %g7
	stb	%o4,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x68]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%g5
	set	0x24, %i7
	lda	[%l7 + %i7] 0x89,	%f12
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x81,	%l0
	set	0x10, %g6
	stxa	%o1,	[%l7 + %g6] 0x81
	nop
	set	0x30, %o6
	lduh	[%l7 + %o6],	%l2
	nop
	set	0x40, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x78, %o7
	sth	%o3,	[%l7 + %o7]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	set	0x70, %i1
	stda	%l4,	[%l7 + %i1] 0x88
	add	%i2,	%o5,	%o0
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x88,	%g6
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x88,	%i1
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x60, %g1
	stx	%l3,	[%l7 + %g1]
	nop
	set	0x40, %g5
	stw	%l6,	[%l7 + %g5]
	nop
	set	0x3C, %l0
	ldsw	[%l7 + %l0],	%i6
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x88,	%g2
	nop
	set	0x48, %g2
	std	%f4,	[%l7 + %g2]
	set	0x70, %i4
	stda	%i0,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%i4,	%l4,	%o7
	nop
	set	0x4D, %l2
	stb	%l0,	[%l7 + %l2]
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%f8
	ld	[%l7 + 0x20],	%f6
	nop
	set	0x38, %i6
	stw	%g6,	[%l7 + %i6]
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%o2
	nop
	set	0x38, %g3
	lduw	[%l7 + %g3],	%g3
	nop
	set	0x3A, %l5
	lduh	[%l7 + %l5],	%g4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%i3
	set	0x74, %o1
	lda	[%l7 + %o1] 0x88,	%f6
	nop
	set	0x50, %i2
	std	%i4,	[%l7 + %i2]
	set	0x21, %o3
	ldstuba	[%l7 + %o3] 0x81,	%i7
	set	0x60, %o5
	lda	[%l7 + %o5] 0x80,	%f22
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f14
	nop
	set	0x23, %l4
	stb	%o6,	[%l7 + %l4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%l1
	nop
	set	0x4A, %i7
	ldsh	[%l7 + %i7],	%o4
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x81,	%f21
	nop
	set	0x20, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%l2
	nop
	set	0x13, %o6
	ldstub	[%l7 + %o6],	%o1
	nop
	set	0x58, %o7
	ldsh	[%l7 + %o7],	%o3
	set	0x6E, %g4
	stha	%l5,	[%l7 + %g4] 0x88
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%i2
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x88,	%f8
	set	0x30, %i0
	sta	%f19,	[%l7 + %i0] 0x80
	set	0x59, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%o5
	set	0x43, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l3
	add	%i1,	%i6,	%g2
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x29, %g1
	stb	%l6,	[%l7 + %g1]
	nop
	set	0x54, %l0
	ldsb	[%l7 + %l0],	%i0
	st	%f0,	[%l7 + 0x08]
	nop
	set	0x3A, %o2
	ldub	[%l7 + %o2],	%i4
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%o6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%g6
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x81,	%l0
	st	%fsr,	[%l7 + 0x24]
	set	0x6C, %i6
	stba	%g3,	[%l7 + %i6] 0x81
	nop
	set	0x58, %l3
	ldsw	[%l7 + %l3],	%g4
	set	0x10, %o0
	ldxa	[%l7 + %o0] 0x81,	%i3
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%i4
	st	%f26,	[%l7 + 0x4C]
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x80,	%g1
	nop
	set	0x3C, %g3
	swap	[%l7 + %g3],	%o6
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x1A, %i2
	ldsh	[%l7 + %i2],	%g5
	or	%i7,	%l1,	%l2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd2
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x88
	and	%o4,	%o1,	%o3
	nop
	set	0x4C, %o5
	prefetch	[%l7 + %o5],	 1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%o0
	nop
	set	0x70, %l4
	ldsh	[%l7 + %l4],	%g7
	set	0x5D, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o5
	nop
	set	0x10, %g7
	sth	%l5,	[%l7 + %g7]
	st	%f0,	[%l7 + 0x18]
	nop
	set	0x08, %g6
	std	%i0,	[%l7 + %g6]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%i6
	nop
	set	0x3B, %i5
	ldsb	[%l7 + %i5],	%l6
	nop
	set	0x38, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x38, %o6
	lduw	[%l7 + %o6],	%i0
	set	0x48, %g4
	stxa	%g2,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xea,	%i4
	nop
	set	0x60, %i1
	lduh	[%l7 + %i1],	%o7
	ble	%icc,	loop_65
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	ld	[%l7 + 0x64],	%f12
	nop
	set	0x1E, %l1
	stb	%g6,	[%l7 + %l1]
loop_65:
	nop
	set	0x46, %g5
	stba	%l4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x78, %i0
	stxa	%o2,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x50, %l0
	stwa	%l0,	[%l7 + %l0] 0x89
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%f16
	add	%g3,	%i3,	%g4
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f16
	set	0x48, %l2
	prefetcha	[%l7 + %l2] 0x89,	 1
	nop
	set	0x7A, %g2
	sth	%o6,	[%l7 + %g2]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf1
	membar	#Sync
	nop
	set	0x66, %l3
	ldsh	[%l7 + %l3],	%g5
	set	0x50, %o0
	sta	%f26,	[%l7 + %o0] 0x88
	set	0x70, %l5
	lda	[%l7 + %l5] 0x88,	%f1
	set	0x0C, %o1
	swapa	[%l7 + %o1] 0x81,	%i5
	set	0x60, %g3
	stxa	%i7,	[%l7 + %g3] 0x88
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f4
	set	0x38, %o4
	lda	[%l7 + %o4] 0x88,	%f31
	nop
	set	0x7F, %o3
	ldstub	[%l7 + %o3],	%l1
	set	0x68, %o5
	stwa	%l2,	[%l7 + %o5] 0x89
	nop
	set	0x34, %l4
	prefetch	[%l7 + %l4],	 0
	bl,a,pn	%icc,	loop_66
	ld	[%l7 + 0x2C],	%f13
	set	0x48, %g7
	stxa	%o4,	[%l7 + %g7] 0x88
loop_66:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x64, %i7
	sta	%f29,	[%l7 + %i7] 0x88
	nop
	set	0x30, %i5
	ldstub	[%l7 + %i5],	%o3
	nop
	set	0x28, %g6
	ldx	[%l7 + %g6],	%o0
	st	%f31,	[%l7 + 0x10]
	set	0x6E, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o5
	nop
	nop
	setx	0xAE2938E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x989E9129,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f31,	%f19
	or	%g7,	%i1,	%l3
	nop
	nop
	setx	0x3A8DD456,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x087DB1A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f26,	%f11
	st	%f21,	[%l7 + 0x24]
	set	0x34, %o6
	stwa	%l5,	[%l7 + %o6] 0x80
	set	0x51, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l6
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f14
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%i6
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd2
	set	0x40, %g5
	stda	%g2,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i0
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xe3,	%l4
	nop
	set	0x72, %o2
	ldstub	[%l7 + %o2],	%o2
	st	%f14,	[%l7 + 0x78]
	st	%fsr,	[%l7 + 0x24]
	set	0x28, %i4
	stda	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x08, %l2
	ldsw	[%l7 + %l2],	%g6
	nop
	set	0x7F, %g2
	ldub	[%l7 + %g2],	%g3
	and	%g4,	%i3,	%g1
	nop
	set	0x66, %i0
	ldsh	[%l7 + %i0],	%o6
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xda
	set	0x40, %o0
	stha	%i5,	[%l7 + %o0] 0x81
	set	0x30, %i6
	stda	%i6,	[%l7 + %i6] 0x88
	set	0x60, %l5
	stxa	%g5,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x08, %g3
	ldx	[%l7 + %g3],	%l1
	wr	%l2,	%o4,	%pic
	set	0x30, %o1
	stxa	%i2,	[%l7 + %o1] 0x80
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc2
	nop
	set	0x3C, %i2
	swap	[%l7 + %i2],	%o3
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x80,	%o0
	bg,a,pn	%icc,	loop_67
	nop
	set	0x4D, %o3
	ldsb	[%l7 + %o3],	%o1
	nop
	set	0x20, %g7
	ldsw	[%l7 + %g7],	%g7
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i1
loop_67:
	nop
	set	0x2C, %l4
	stha	%l3,	[%l7 + %l4] 0x80
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x80,	%l6
	nop
	set	0x28, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x6C, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x26, %i7
	lduh	[%l7 + %i7],	%l5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%i4
	st	%fsr,	[%l7 + 0x34]
	bge,pt	%icc,	loop_68
	add	%g2,	%o7,	%i0
	set	0x40, %i3
	stxa	%o2,	[%l7 + %i3] 0x88
loop_68:
	wr 	%g0, 	0x4, 	%fprs
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%g4
	set	0x30, %i1
	lda	[%l7 + %i1] 0x80,	%f18
	bne,a	%icc,	loop_69
	nop
	set	0x29, %g5
	ldub	[%l7 + %g5],	%g6
	nop
	set	0x0A, %l1
	ldub	[%l7 + %l1],	%g1
	set	0x50, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o6
loop_69:
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%i3
	nop
	set	0x6B, %i4
	stb	%i5,	[%l7 + %i4]
	set	0x21, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i7
	add	%l1,	%g5,	%l2
	nop
	set	0x18, %g2
	stx	%o4,	[%l7 + %g2]
	nop
	set	0x25, %i0
	ldstub	[%l7 + %i0],	%o3
	ld	[%l7 + 0x6C],	%f25
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf9
	membar	#Sync
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%i2
	or	%o0,	%g7,	%o1
	set	0x58, %i6
	stda	%i0,	[%l7 + %i6] 0x88
	set	0x10, %l5
	swapa	[%l7 + %l5] 0x81,	%o5
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%l6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xca
	set	0x27, %g1
	stba	%l5,	[%l7 + %g1] 0x81
	nop
	set	0x28, %o4
	ldsw	[%l7 + %o4],	%i6
	nop
	set	0x66, %i2
	ldsh	[%l7 + %i2],	%l3
	nop
	set	0x7A, %o5
	ldstub	[%l7 + %o5],	%i4
	nop
	set	0x4C, %o2
	stb	%o7,	[%l7 + %o2]
	nop
	set	0x34, %o3
	lduh	[%l7 + %o3],	%g2
	wr 	%g0, 	0x5, 	%fprs
	and	%l4,	%l0,	%g4
	set	0x40, %g7
	stxa	%g3,	[%l7 + %g7] 0x80
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f16
	nop
	set	0x74, %g6
	ldsw	[%l7 + %g6],	%g1
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	nop
	set	0x48, %l4
	ldsh	[%l7 + %l4],	%i3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%g6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%i6
	set	0x20, %g4
	ldxa	[%l7 + %g4] 0x88,	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%l2
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f22
	nop
	set	0x2A, %g5
	ldsb	[%l7 + %g5],	%i5
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xe3,	%o2
	add	%o4,	%i2,	%o0
	nop
	set	0x20, %l0
	stx	%o1,	[%l7 + %l0]
	nop
	set	0x60, %i4
	stb	%i1,	[%l7 + %i4]
	set	0x1C, %l1
	swapa	[%l7 + %l1] 0x89,	%g7
	add	%o5,	%l6,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i4
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x88,	%l4
	set	0x40, %l2
	stwa	%g2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x40, %l3
	ldsw	[%l7 + %l3],	%o7
	nop
	set	0x76, %o0
	lduh	[%l7 + %o0],	%i0
	nop
	set	0x78, %i6
	std	%o2,	[%l7 + %i6]
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	fpadd16s	%f6,	%f19,	%f25
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc2
	nop
	set	0x45, %g3
	ldstub	[%l7 + %g3],	%l0
	nop
	set	0x48, %o1
	ldsw	[%l7 + %o1],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%g1
	or	%o6,	%i3,	%g6
	nop
	set	0x78, %g1
	std	%i6,	[%l7 + %g1]
	set	0x0A, %o4
	stha	%l1,	[%l7 + %o4] 0x80
	set	0x30, %o5
	swapa	[%l7 + %o5] 0x80,	%l4
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	and	%g5,	%l2,	%i5
	nop
	set	0x36, %o2
	ldstub	[%l7 + %o2],	%o3
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f24
	nop
	set	0x28, %g7
	stx	%o4,	[%l7 + %g7]
	and	%o0,	%i2,	%o1
	nop
	set	0x18, %g6
	std	%f4,	[%l7 + %g6]
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f2
	set	0x78, %l4
	stha	%i1,	[%l7 + %l4] 0x81
	set	0x16, %i3
	stha	%g7,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x52, %o7
	lduh	[%l7 + %o7],	%l6
	be	%icc,	loop_70
	nop
	set	0x48, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x6C, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x68, %g4
	swapa	[%l7 + %g4] 0x81,	%i6
loop_70:
	and	%l3,	%o5,	%i4
	set	0x4C, %g5
	stwa	%g2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%o7
	nop
	set	0x60, %l0
	std	%i0,	[%l7 + %l0]
	and	%o2,	%l5,	%l0
	add	%g4,	%g3,	%o6
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	and	%g1,	%g6,	%i7
	bgu,pn	%icc,	loop_71
	nop
	set	0x5F, %l6
	ldsb	[%l7 + %l6],	%l1
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x6E, %l2
	lduh	[%l7 + %l2],	%g5
loop_71:
	nop
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	st	%f7,	[%l7 + 0x2C]
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%l2
	or	%o3,	%i5,	%o0
	set	0x20, %i6
	ldxa	[%l7 + %i6] 0x80,	%i2
	nop
	set	0x20, %o0
	ldsw	[%l7 + %o0],	%o4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x46, %i0
	stba	%l6,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x41, %l5
	ldstub	[%l7 + %l5],	%g7
	set	0x45, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i6
	nop
	set	0x60, %g3
	stx	%l3,	[%l7 + %g3]
	nop
	set	0x08, %g1
	std	%f20,	[%l7 + %g1]
	add	%o5,	%g2,	%i4
	set	0x58, %o5
	lda	[%l7 + %o5] 0x89,	%f12
	add	%o7,	%i0,	%o2
	nop
	set	0x70, %o4
	lduw	[%l7 + %o4],	%l5
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x76, %o2
	sth	%g4,	[%l7 + %o2]
	ld	[%l7 + 0x14],	%f0
	set	0x34, %o3
	sta	%f2,	[%l7 + %o3] 0x89
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%g3
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f28
	st	%f11,	[%l7 + 0x64]
	nop
	set	0x28, %g6
	sth	%o6,	[%l7 + %g6]
	set	0x28, %i5
	lda	[%l7 + %i5] 0x81,	%f1
	set	0x38, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l0
	st	%fsr,	[%l7 + 0x3C]
	fpsub16s	%f10,	%f23,	%f12
	add	%g1,	%i7,	%g6
	set	0x78, %o7
	lda	[%l7 + %o7] 0x89,	%f26
	set	0x33, %o6
	stba	%i3,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x67, %l4
	ldstuba	[%l7 + %l4] 0x89,	%g5
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%l0
	bl,pn	%icc,	loop_72
	wr	%l2,	%o3,	%set_softint
	st	%f2,	[%l7 + 0x08]
	nop
	set	0x48, %g5
	ldsw	[%l7 + %g5],	%i5
loop_72:
	nop
	set	0x54, %g4
	lda	[%l7 + %g4] 0x88,	%f3
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f24
	or	%o0,	%l4,	%i2
	nop
	set	0x57, %l0
	ldsb	[%l7 + %l0],	%i1
	nop
	set	0x61, %i4
	ldstub	[%l7 + %i4],	%o1
	set	0x30, %l1
	stda	%o4,	[%l7 + %l1] 0x89
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%i6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f0
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x89,	%g7
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x89
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%i6
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0
	nop
	set	0x68, %o0
	std	%f2,	[%l7 + %o0]
	nop
	set	0x4A, %i0
	lduh	[%l7 + %i0],	%g2
	nop
	set	0x64, %l5
	sth	%i4,	[%l7 + %l5]
	nop
	set	0x20, %g3
	std	%f4,	[%l7 + %g3]
	nop
	set	0x4C, %o1
	ldstub	[%l7 + %o1],	%i0
	nop
	set	0x38, %o5
	std	%f30,	[%l7 + %o5]
	and	%o2,	%o7,	%l5
	nop
	set	0x28, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%g2
	add	%g4,	%o6,	%g1
	nop
	set	0x62, %g1
	ldsb	[%l7 + %g1],	%l0
	and	%g6,	%i3,	%g5
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f16
	nop
	set	0x30, %o3
	prefetch	[%l7 + %o3],	 4
	ld	[%l7 + 0x54],	%f5
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f26
	nop
	set	0x60, %g6
	stx	%i7,	[%l7 + %g6]
	nop
	set	0x4D, %i3
	ldsb	[%l7 + %i3],	%l2
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x80,	%o3
	nop
	set	0x18, %i5
	std	%f0,	[%l7 + %i5]
	set	0x30, %o6
	prefetcha	[%l7 + %o6] 0x80,	 2
	set	0x60, %i7
	stxa	%l1,	[%l7 + %i7] 0x88
	nop
	set	0x74, %l4
	lduh	[%l7 + %l4],	%o0
	nop
	set	0x40, %g5
	ldub	[%l7 + %g5],	%l4
	set	0x7A, %i1
	stha	%i1,	[%l7 + %i1] 0xe2
	membar	#Sync
	fpadd32	%f4,	%f14,	%f16
	nop
	set	0x76, %g4
	ldsb	[%l7 + %g4],	%o1
	nop
	set	0x70, %l0
	stx	%i2,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	nop
	set	0x18, %l2
	stx	%o4,	[%l7 + %l2]
	nop
	set	0x20, %l6
	swap	[%l7 + %l6],	%l6
	set	0x70, %i4
	stda	%l2,	[%l7 + %i4] 0x89
	nop
	set	0x7F, %l3
	stb	%i6,	[%l7 + %l3]
	set	0x6C, %i6
	sta	%f2,	[%l7 + %i6] 0x88
	nop
	set	0x1C, %o0
	swap	[%l7 + %o0],	%g7
	nop
	set	0x08, %g2
	std	%g2,	[%l7 + %g2]
	nop
	set	0x4E, %l5
	sth	%i4,	[%l7 + %l5]
	nop
	set	0x7A, %i0
	sth	%o5,	[%l7 + %i0]
	or	%o2,	%o7,	%i0
	set	0x14, %o1
	stwa	%l5,	[%l7 + %o1] 0x88
	nop
	set	0x78, %g3
	std	%f22,	[%l7 + %g3]
	set	0x7B, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g3
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%g4
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%o6
	set	0x4C, %o2
	stwa	%l0,	[%l7 + %o2] 0x81
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i3
	set	0x21, %o3
	stba	%g6,	[%l7 + %o3] 0x89
	nop
	set	0x2C, %i2
	ldsw	[%l7 + %i2],	%g5
	nop
	set	0x18, %g6
	std	%f28,	[%l7 + %g6]
	fpadd16	%f18,	%f14,	%f30
	st	%fsr,	[%l7 + 0x6C]
	set	0x38, %g7
	stha	%l2,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	set	0x5C, %i5
	swapa	[%l7 + %i5] 0x81,	%i5
	set	0x2C, %o6
	ldstuba	[%l7 + %o6] 0x88,	%i7
	and	%o0,	%l4,	%l1
	nop
	set	0x7C, %i7
	lduh	[%l7 + %i7],	%o1
	set	0x0C, %o7
	stwa	%i2,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x5A, %g5
	ldsb	[%l7 + %g5],	%o4
	nop
	set	0x08, %l4
	std	%f18,	[%l7 + %l4]
	fpsub32	%f20,	%f18,	%f26
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xe2,	%i0
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x50, %g4
	lduh	[%l7 + %g4],	%l3
	set	0x5C, %l1
	stwa	%l6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x2C, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%i6
	nop
	set	0x33, %l6
	stb	%g2,	[%l7 + %l6]
	nop
	set	0x34, %i6
	ldsw	[%l7 + %i6],	%i4
	ld	[%l7 + 0x28],	%f18
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%o2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%i0
	set	0x38, %o0
	stxa	%g7,	[%l7 + %o0] 0xe3
	membar	#Sync
	or	%l5,	%g4,	%g3
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x89,	%l0
	nop
	set	0x38, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x78, %l5
	sth	%g1,	[%l7 + %l5]
	add	%i3,	%o6,	%g5
	set	0x2C, %o1
	swapa	[%l7 + %o1] 0x88,	%g6
	set	0x0C, %i0
	sta	%f17,	[%l7 + %i0] 0x80
	nop
	set	0x18, %o5
	ldsw	[%l7 + %o5],	%l2
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%o3
	set	0x4C, %o4
	stwa	%i7,	[%l7 + %o4] 0x80
	nop
	set	0x64, %o2
	ldsw	[%l7 + %o2],	%i5
	set	0x0D, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l4
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o1
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x81,	 4
	nop
	set	0x68, %i2
	ldsw	[%l7 + %i2],	%o4
	ld	[%l7 + 0x40],	%f25
	set	0x08, %g6
	lda	[%l7 + %g6] 0x88,	%f22
	add	%i2,	%l3,	%l6
	nop
	set	0x22, %i3
	ldsh	[%l7 + %i3],	%i6
	add	%g2,	%i4,	%i1
	bn,a,pt	%icc,	loop_73
	nop
	set	0x5C, %g7
	stw	%o5,	[%l7 + %g7]
	or	%o7,	%i0,	%o2
	set	0x6C, %i5
	ldstuba	[%l7 + %i5] 0x80,	%g7
loop_73:
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%f12
	nop
	set	0x64, %o7
	ldstub	[%l7 + %o7],	%g4
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x81,	%g3
	nop
	set	0x68, %o6
	std	%l4,	[%l7 + %o6]
	set	0x7C, %i1
	stwa	%l0,	[%l7 + %i1] 0x88
	nop
	set	0x68, %l4
	stb	%g1,	[%l7 + %l4]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%g5
	add	%g6,	%o6,	%o3
	nop
	set	0x40, %g4
	stx	%i7,	[%l7 + %g4]
	and	%i5,	%l2,	%l4
	nop
	set	0x39, %l1
	ldsb	[%l7 + %l1],	%o1
	nop
	set	0x10, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x64, %i4
	swap	[%l7 + %i4],	%l1
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f10
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x81,	%o4
	set	0x08, %o0
	stba	%o0,	[%l7 + %o0] 0x88
	nop
	set	0x58, %i6
	lduw	[%l7 + %i6],	%i2
	nop
	set	0x5C, %g2
	swap	[%l7 + %g2],	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i6
	nop
	set	0x68, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f4
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
	nop
	set	0x54, %o5
	lduh	[%l7 + %o5],	%g2
	bl,a,pn	%xcc,	loop_74
	nop
	set	0x20, %o1
	stx	%i4,	[%l7 + %o1]
	nop
	set	0x50, %g3
	stx	%o5,	[%l7 + %g3]
	nop
	set	0x78, %o2
	stw	%o7,	[%l7 + %o2]
loop_74:
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%i0
	set	0x44, %i2
	swapa	[%l7 + %i2] 0x88,	%i1
	nop
	set	0x30, %g6
	ldsw	[%l7 + %g6],	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%g3
	nop
	set	0x36, %i3
	sth	%g4,	[%l7 + %i3]
	nop
	set	0x0C, %g7
	ldstub	[%l7 + %g7],	%l0
	add	%g1,	%l5,	%i3
	set	0x32, %o4
	stha	%g5,	[%l7 + %o4] 0x88
	nop
	set	0x68, %i7
	stx	%g6,	[%l7 + %i7]
	set	0x14, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o6
	add	%o3,	%i7,	%i5
	nop
	set	0x40, %o7
	stx	%l4,	[%l7 + %o7]
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%o1
	nop
	set	0x1C, %g5
	ldsw	[%l7 + %g5],	%l1
	st	%f2,	[%l7 + 0x1C]
	set	0x70, %i1
	stda	%l2,	[%l7 + %i1] 0x88
	set	0x3A, %l4
	stba	%o0,	[%l7 + %l4] 0x88
	set	0x54, %g4
	sta	%f10,	[%l7 + %g4] 0x80
	fpsub32	%f26,	%f22,	%f20
	set	0x40, %l0
	stxa	%i2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x68, %i4
	std	%f20,	[%l7 + %i4]
	bleu,a,pn	%xcc,	loop_75
	nop
	set	0x2C, %l1
	ldsw	[%l7 + %l1],	%l6
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%o4
	nop
	set	0x08, %o0
	lduh	[%l7 + %o0],	%i6
loop_75:
	nop
	set	0x64, %l6
	ldsw	[%l7 + %l6],	%g2
	nop
	set	0x38, %g2
	swap	[%l7 + %g2],	%i4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x28, %l5
	ldstub	[%l7 + %l5],	%o5
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xe2,	%o6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc4
	st	%f26,	[%l7 + 0x4C]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xea,	%i0
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f12
	st	%f28,	[%l7 + 0x24]
	nop
	set	0x43, %o1
	ldub	[%l7 + %o1],	%i1
	set	0x76, %o2
	stha	%o2,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%g7,	%g3,	%l3
	set	0x5E, %o3
	stha	%g4,	[%l7 + %o3] 0x81
	set	0x48, %g1
	stda	%l0,	[%l7 + %g1] 0x88
	or	%l5,	%i3,	%g1
	set	0x62, %g3
	stha	%g5,	[%l7 + %g3] 0xe2
	membar	#Sync
	and	%g6,	%o6,	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%i5
	nop
	set	0x50, %i2
	sth	%l4,	[%l7 + %i2]
	nop
	set	0x68, %i3
	swap	[%l7 + %i3],	%o1
	set	0x68, %g7
	swapa	[%l7 + %g7] 0x88,	%l1
	wr	%l2,	%o0,	%y
	wr	%l6,	%o4,	%softint
	nop
	set	0x4E, %o4
	sth	%i6,	[%l7 + %o4]
	set	0x18, %i7
	stxa	%g2,	[%l7 + %i7] 0x81
	or	%i4,	%i2,	%o5
	bleu,pt	%icc,	loop_76
	nop
	set	0x6C, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd0
loop_76:
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f0
	nop
	set	0x20, %o7
	std	%i0,	[%l7 + %o7]
	set	0x7C, %i1
	swapa	[%l7 + %i1] 0x88,	%o7
	nop
	set	0x36, %l4
	sth	%i1,	[%l7 + %l4]
	set	0x22, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g7
	set	0x68, %l0
	sta	%f26,	[%l7 + %l0] 0x89
	or	%g3,	%l3,	%o2
	set	0x58, %i4
	swapa	[%l7 + %i4] 0x88,	%l0
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%g4
	nop
	set	0x08, %g5
	ldsb	[%l7 + %g5],	%l5
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%g0
	nop
	set	0x38, %o0
	stb	%g5,	[%l7 + %o0]
	nop
	set	0x5E, %l6
	lduh	[%l7 + %l6],	%i3
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
	set	0x2A, %i6
	stha	%o3,	[%l7 + %i6] 0x89
	set	0x34, %l5
	swapa	[%l7 + %l5] 0x81,	%i7
	nop
	set	0x58, %o5
	prefetch	[%l7 + %o5],	 2
	or	%o6,	%i5,	%o1
	fpadd16s	%f6,	%f31,	%f16
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%l2
	set	0x30, %l3
	ldda	[%l7 + %l3] 0xeb,	%o0
	st	%f14,	[%l7 + 0x3C]
	nop
	set	0x20, %o1
	lduh	[%l7 + %o1],	%l4
	nop
	set	0x68, %i0
	ldsb	[%l7 + %i0],	%o4
	nop
	set	0x60, %o3
	lduw	[%l7 + %o3],	%i6
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%l6
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x89,	%g2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%o5
	set	0x7D, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i2
	set	0x24, %i3
	stwa	%i0,	[%l7 + %i3] 0x81
	set	0x30, %g7
	stxa	%o7,	[%l7 + %g7] 0x80
	nop
	set	0x10, %o4
	std	%g6,	[%l7 + %o4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%l3
	set	0x74, %i2
	lda	[%l7 + %i2] 0x81,	%f21
	set	0x44, %i7
	stwa	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x54, %i5
	stwa	%i1,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x48, %o6
	stda	%l0,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0
	nop
	set	0x50, %o7
	stx	%g4,	[%l7 + %o7]
	nop
	set	0x20, %l4
	ldsw	[%l7 + %l4],	%g1
	nop
	set	0x3F, %i1
	ldub	[%l7 + %i1],	%g5
	nop
	set	0x4C, %l0
	ldub	[%l7 + %l0],	%i3
	nop
	set	0x20, %g4
	stw	%g6,	[%l7 + %g4]
	set	0x2C, %l1
	sta	%f13,	[%l7 + %l1] 0x89
	set	0x3F, %g5
	stba	%i7,	[%l7 + %g5] 0x89
	set	0x28, %i4
	stda	%o6,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x55, %o0
	ldub	[%l7 + %o0],	%o3
	set	0x70, %l2
	sta	%f31,	[%l7 + %l2] 0x80
	set	0x48, %g2
	swapa	[%l7 + %g2] 0x81,	%i5
	nop
	set	0x1A, %l6
	ldsh	[%l7 + %l6],	%l1
	set	0x38, %l5
	sta	%f5,	[%l7 + %l5] 0x81
	nop
	set	0x20, %o5
	stx	%o1,	[%l7 + %o5]
	set	0x14, %i6
	lda	[%l7 + %i6] 0x88,	%f26
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x64, %l3
	ldstub	[%l7 + %l3],	%l2
	set	0x78, %o3
	stxa	%o0,	[%l7 + %o3] 0x80
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x4A, %i0
	sth	%o4,	[%l7 + %i0]
	set	0x10, %g1
	sta	%f26,	[%l7 + %g1] 0x88
	nop
	set	0x78, %i3
	stx	%i6,	[%l7 + %i3]
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%g2
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x73, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i4
	ld	[%l7 + 0x10],	%f26
	or	%l6,	%o5,	%i0
	set	0x58, %i5
	stxa	%i2,	[%l7 + %i5] 0xeb
	membar	#Sync
	fpadd16s	%f19,	%f29,	%f23
	nop
	set	0x70, %o6
	stx	%fsr,	[%l7 + %o6]
	bge,a,pn	%xcc,	loop_77
	nop
	set	0x2C, %g6
	ldsh	[%l7 + %g6],	%g7
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%g3
	nop
	set	0x0A, %o7
	lduh	[%l7 + %o7],	%l3
loop_77:
	or	%o7,	%i1,	%l0
	set	0x12, %l4
	stba	%o2,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x4C, %l0
	swapa	[%l7 + %l0] 0x80,	%l5
	nop
	set	0x1D, %i1
	ldsb	[%l7 + %i1],	%g4
	set	0x30, %l1
	sta	%f18,	[%l7 + %l1] 0x88
	nop
	set	0x54, %g5
	swap	[%l7 + %g5],	%g1
	set	0x30, %g4
	stda	%g4,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x68, %o0
	ldsw	[%l7 + %o0],	%g6
	nop
	set	0x7C, %l2
	swap	[%l7 + %l2],	%i3
	set	0x34, %i4
	stba	%o6,	[%l7 + %i4] 0x80
	set	0x30, %g2
	swapa	[%l7 + %g2] 0x80,	%i7
	set	0x68, %l6
	stda	%i4,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x43, %o5
	stba	%l1,	[%l7 + %o5] 0x88
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xe2,	%o2
	nop
	set	0x52, %i6
	lduh	[%l7 + %i6],	%l2
	nop
	set	0x68, %l3
	stx	%o0,	[%l7 + %l3]
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x89,	%o1
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x88,	%l4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	nop
	set	0x70, %i0
	ldx	[%l7 + %i0],	%o4
	nop
	set	0x48, %g1
	stx	%g2,	[%l7 + %g1]
	nop
	set	0x32, %i3
	ldsb	[%l7 + %i3],	%i4
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f16
	nop
	nop
	setx	0x38F3C62B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xBA96A710,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f19,	%f7
	nop
	set	0x16, %o4
	ldub	[%l7 + %o4],	%l6
	nop
	set	0x76, %g7
	sth	%i6,	[%l7 + %g7]
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%i0
	or	%i2,	%o5,	%g3
	set	0x78, %o6
	sta	%f18,	[%l7 + %o6] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%l3
	nop
	set	0x28, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%o6
	set	0x54, %l4
	lda	[%l7 + %l4] 0x80,	%f1
	set	0x6C, %l0
	stwa	%i1,	[%l7 + %l0] 0x89
	nop
	set	0x24, %i1
	stw	%o2,	[%l7 + %i1]
	ba,a,pn	%icc,	loop_78
	fpsub16s	%f4,	%f3,	%f4
	nop
	set	0x2A, %l1
	ldsb	[%l7 + %l1],	%l0
	fpadd32s	%f17,	%f30,	%f15
loop_78:
	nop
	set	0x48, %g5
	stda	%g4,	[%l7 + %g5] 0x81
	nop
	set	0x74, %g4
	lduw	[%l7 + %g4],	%g1
	st	%f6,	[%l7 + 0x6C]
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%g5
	wr	%g6,	%i3,	%sys_tick
	wr	%l5,	%o6,	%ccr
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f0
	nop
	set	0x68, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f30
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%i6
	nop
	set	0x4C, %o5
	ldsw	[%l7 + %o5],	%i5
	set	0x4A, %l5
	stba	%l1,	[%l7 + %l5] 0x89
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f30
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	nop
	set	0x7C, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%l2
	or	%o0,	%o1,	%o3
	set	0x10, %o3
	stda	%o4,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x80,	%l4
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%g2
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x81
	nop
	set	0x08, %o2
	ldsw	[%l7 + %o2],	%l6
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd2,	%f16
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f16
	set	0x6A, %i3
	ldstuba	[%l7 + %i3] 0x89,	%i6
	set	0x14, %o6
	stha	%i4,	[%l7 + %o6] 0x80
	set	0x54, %i2
	stba	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%f30,	[%l7 + 0x78]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf8
	membar	#Sync
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x54, %i7
	ldub	[%l7 + %i7],	%i2
	nop
	set	0x5C, %l0
	swap	[%l7 + %l0],	%o5
	add	%g7,	%l3,	%o7
	set	0x5C, %l4
	stwa	%i1,	[%l7 + %l4] 0x80
	nop
	set	0x10, %i1
	std	%g2,	[%l7 + %i1]
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x80,	%o2
	ld	[%l7 + 0x34],	%f12
	nop
	set	0x38, %g4
	ldsw	[%l7 + %g4],	%l0
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	set	0x38, %l2
	stxa	%g1,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x50, %i4
	stxa	%g6,	[%l7 + %i4] 0x89
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	or	%i3,	%l5,	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%g5
	set	0x50, %o0
	stxa	%i5,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x6C, %g2
	ldsb	[%l7 + %g2],	%l2
	ble,a	%icc,	loop_79
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x76, %l5
	sth	%l1,	[%l7 + %l5]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf9
	membar	#Sync
loop_79:
	ld	[%l7 + 0x44],	%f3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%o3
	nop
	set	0x68, %l6
	sth	%o0,	[%l7 + %l6]
	add	%o4,	%g2,	%l4
	nop
	set	0x08, %l3
	prefetch	[%l7 + %l3],	 4
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f0
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%f24
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%i6
	set	0x28, %g3
	stda	%i6,	[%l7 + %g3] 0x88
	nop
	set	0x12, %i0
	sth	%i0,	[%l7 + %i0]
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x88,	%i4
	nop
	set	0x74, %g1
	stb	%i2,	[%l7 + %g1]
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x80,	 2
	set	0x34, %i3
	sta	%f20,	[%l7 + %i3] 0x81
	nop
	set	0x50, %o6
	sth	%g7,	[%l7 + %o6]
	nop
	set	0x10, %i2
	stw	%o7,	[%l7 + %i2]
	nop
	set	0x50, %g6
	ldsh	[%l7 + %g6],	%l3
	nop
	set	0x4A, %g7
	ldstub	[%l7 + %g7],	%i1
	nop
	set	0x68, %i5
	std	%o2,	[%l7 + %i5]
	st	%f23,	[%l7 + 0x50]
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x80,	%g2
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g6
	nop
	set	0x30, %i1
	std	%f18,	[%l7 + %i1]
	set	0x68, %l1
	stha	%i3,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	nop
	set	0x20, %g4
	std	%o6,	[%l7 + %g4]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%g5
	nop
	set	0x54, %l2
	swap	[%l7 + %l2],	%g1
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%l2
	set	0x18, %o7
	stxa	%l1,	[%l7 + %o7] 0x89
	set	0x18, %o0
	sta	%f13,	[%l7 + %o0] 0x81
	nop
	set	0x60, %g5
	lduw	[%l7 + %g5],	%i5
	nop
	set	0x6E, %g2
	lduh	[%l7 + %g2],	%o1
	nop
	set	0x18, %o5
	stw	%o3,	[%l7 + %o5]
	nop
	set	0x71, %l6
	ldstub	[%l7 + %l6],	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%g2
	nop
	set	0x54, %l3
	lduh	[%l7 + %l3],	%l4
	nop
	set	0x67, %l5
	ldsb	[%l7 + %l5],	%l6
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%i0
	nop
	set	0x34, %o3
	stw	%i6,	[%l7 + %o3]
	st	%f2,	[%l7 + 0x5C]
	nop
	set	0x0C, %g3
	lduw	[%l7 + %g3],	%i4
	fpadd16s	%f20,	%f18,	%f11
	add	%o5,	%i2,	%o7
	set	0x38, %i0
	stxa	%l3,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xeb,	%g6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf1
	membar	#Sync
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
	wr	%i1,	%g3,	%softint
	nop
	set	0x6C, %i3
	stw	%l0,	[%l7 + %i3]
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%g4
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x78, %o6
	std	%f8,	[%l7 + %o6]
	nop
	set	0x54, %i2
	stb	%l5,	[%l7 + %i2]
	or	%o6,	%i7,	%g1
	set	0x43, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l2
	nop
	set	0x0C, %i5
	stw	%l1,	[%l7 + %i5]
	set	0x18, %i7
	sta	%f12,	[%l7 + %i7] 0x88
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%i5
	set	0x58, %g6
	sta	%f8,	[%l7 + %g6] 0x89
	ld	[%l7 + 0x10],	%f7
	nop
	set	0x14, %l0
	ldub	[%l7 + %l0],	%o3
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x10, %l4
	swap	[%l7 + %l4],	%o0
	nop
	set	0x50, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x1C, %l2
	stw	%o4,	[%l7 + %l2]
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x88,	%o0
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xcc
	set	0x74, %o7
	lda	[%l7 + %o7] 0x80,	%f19
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x50, %g2
	stx	%l4,	[%l7 + %g2]
	ld	[%l7 + 0x74],	%f13
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x18, %l6
	lda	[%l7 + %l6] 0x81,	%f27
	nop
	set	0x15, %o5
	ldstub	[%l7 + %o5],	%g2
	set	0x1A, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i0
	and	%i6,	%l6,	%i4
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x89,	 1
	set	0x68, %l3
	sta	%f3,	[%l7 + %l3] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%o5
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xc0
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%g7
	set	0x30, %g1
	lda	[%l7 + %g1] 0x88,	%f28
	set	0x58, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	nop
	set	0x32, %i0
	ldub	[%l7 + %i0],	%i1
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x88
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%g3
	nop
	set	0x0C, %i2
	swap	[%l7 + %i2],	%l0
	nop
	set	0x09, %g7
	ldub	[%l7 + %g7],	%o2
	set	0x40, %i5
	stxa	%g4,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%i3
	ld	[%l7 + 0x1C],	%f9
	or	%g6,	%l5,	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%g1
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x81,	%l2
	set	0x26, %g6
	stha	%l1,	[%l7 + %g6] 0x89
	nop
	set	0x18, %i1
	stw	%i5,	[%l7 + %i1]
	set	0x7C, %l4
	sta	%f31,	[%l7 + %l4] 0x81
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf8
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%g5
	set	0x40, %i4
	stda	%o4,	[%l7 + %i4] 0x88
	nop
	set	0x18, %l2
	std	%f10,	[%l7 + %l2]
	ld	[%l7 + 0x5C],	%f4
	nop
	set	0x3C, %g4
	prefetch	[%l7 + %g4],	 2
	add	%o0,	%o1,	%l4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i6
	nop
	set	0x62, %o7
	ldsb	[%l7 + %o7],	%i0
	set	0x20, %g2
	sta	%f20,	[%l7 + %g2] 0x88
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x81,	%i4
	nop
	set	0x33, %l6
	ldstub	[%l7 + %l6],	%l6
	set	0x74, %g5
	sta	%f1,	[%l7 + %g5] 0x81
	nop
	set	0x50, %o5
	std	%f0,	[%l7 + %o5]
	set	0x6E, %i6
	stha	%i2,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x74, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x68, %l5
	lduh	[%l7 + %l5],	%o5
	set	0x10, %o3
	sta	%f17,	[%l7 + %o3] 0x89
	ld	[%l7 + 0x0C],	%f10
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x88,	%o7
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%l3
	bge,a	%icc,	loop_80
	nop
	set	0x28, %g3
	stw	%g7,	[%l7 + %g3]
	nop
	set	0x76, %i0
	sth	%i1,	[%l7 + %i0]
	nop
	set	0x3E, %i3
	lduh	[%l7 + %i3],	%g3
loop_80:
	nop
	set	0x66, %o6
	ldsb	[%l7 + %o6],	%o2
	nop
	set	0x40, %i2
	std	%g4,	[%l7 + %i2]
	set	0x74, %o1
	lda	[%l7 + %o1] 0x81,	%f3
	set	0x4C, %i5
	stwa	%i3,	[%l7 + %i5] 0x81
	nop
	set	0x4E, %g7
	lduh	[%l7 + %g7],	%g6
	nop
	set	0x58, %i7
	lduw	[%l7 + %i7],	%l0
	bg	%xcc,	loop_81
	bgu	%xcc,	loop_82
	st	%f4,	[%l7 + 0x34]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f0
loop_81:
	nop
	set	0x18, %o4
	sta	%f10,	[%l7 + %o4] 0x80
loop_82:
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%l4
	set	0x4E, %g6
	stha	%i7,	[%l7 + %g6] 0x89
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%o6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
	set	0x0A, %l2
	stha	%l2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x34, %g4
	swap	[%l7 + %g4],	%g1
	fpadd16	%f0,	%f20,	%f12
	set	0x50, %i4
	lda	[%l7 + %i4] 0x88,	%f5
	nop
	set	0x18, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x7C, %o7
	ldstub	[%l7 + %o7],	%i5
	st	%f21,	[%l7 + 0x64]
	nop
	set	0x08, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
	set	0x38, %o5
	sta	%f23,	[%l7 + %o5] 0x88
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x89,	%o3
	set	0x78, %l3
	stxa	%g5,	[%l7 + %l3] 0xe2
	membar	#Sync
	or	%o0,	%o1,	%o4
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%l4
	bge	%xcc,	loop_83
	nop
	set	0x30, %o3
	std	%f26,	[%l7 + %o3]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf9
	membar	#Sync
loop_83:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%i0
	nop
	set	0x74, %g1
	lduh	[%l7 + %g1],	%i4
	set	0x48, %l6
	sta	%f14,	[%l7 + %l6] 0x81
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%g2
	set	0x14, %i0
	sta	%f12,	[%l7 + %i0] 0x80
	wr	%i2,	%o5,	%pic
	set	0x5F, %o6
	stba	%l6,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x50, %i2
	ldsw	[%l7 + %i2],	%l3
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f0
	st	%f5,	[%l7 + 0x54]
	nop
	set	0x12, %i3
	lduh	[%l7 + %i3],	%g7
	nop
	set	0x78, %i5
	ldsh	[%l7 + %i5],	%o7
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%g2
	set	0x0C, %l0
	stwa	%o2,	[%l7 + %l0] 0x88
	nop
	nop
	setx	0x82F12A8244CF0F2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5E766A79DEF4410C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f18,	%f28
	nop
	set	0x50, %o4
	std	%f12,	[%l7 + %o4]
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%i1
	add	%g4,	%g6,	%l0
	nop
	nop
	setx	0x8F0F0AF924290450,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x43992573C0912B91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f22,	%f28
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%i2
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%l5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f16
	nop
	set	0x6D, %l1
	ldsb	[%l7 + %l1],	%o6
	set	0x5C, %g4
	sta	%f17,	[%l7 + %g4] 0x88
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%g1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x58, %i4
	stx	%i7,	[%l7 + %i4]
	nop
	set	0x28, %l2
	stw	%l1,	[%l7 + %l2]
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x89,	%i5
	nop
	set	0x7C, %o7
	lduw	[%l7 + %o7],	%g5
	nop
	set	0x64, %o0
	prefetch	[%l7 + %o0],	 0
	add	%o3,	%o1,	%o0
	set	0x68, %g5
	stha	%o4,	[%l7 + %g5] 0x89
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x50, %i6
	stda	%l4,	[%l7 + %i6] 0x88
	set	0x72, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i6
	set	0x28, %o3
	stwa	%i4,	[%l7 + %o3] 0x80
	set	0x18, %l5
	sta	%f30,	[%l7 + %l5] 0x89
	nop
	set	0x68, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	wr	%i2,	%o5,	%sys_tick
	set	0x18, %l6
	stxa	%l6,	[%l7 + %l6] 0xe2
	membar	#Sync
	st	%f16,	[%l7 + 0x30]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc2
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x18, %g3
	stx	%l3,	[%l7 + %g3]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%g2
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x81,	%o6
	set	0x3C, %i2
	lda	[%l7 + %i2] 0x89,	%f23
	or	%o2,	%g3,	%g4
	nop
	set	0x79, %o1
	stb	%g6,	[%l7 + %o1]
	nop
	set	0x3C, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x54, %g7
	stba	%i1,	[%l7 + %g7] 0x88
	set	0x77, %i3
	ldstuba	[%l7 + %i3] 0x81,	%l0
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%i3
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x81
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%o6
	nop
	set	0x5D, %i1
	stb	%l5,	[%l7 + %i1]
	and	%l2,	%g1,	%i7
	set	0x3C, %i7
	swapa	[%l7 + %i7] 0x80,	%i5
	nop
	set	0x10, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x7C, %g4
	stwa	%g5,	[%l7 + %g4] 0x88
	add	%l1,	%o1,	%o3
	st	%fsr,	[%l7 + 0x78]
	ld	[%l7 + 0x68],	%f2
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%o4
	set	0x20, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o0
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%i6
	or	%l4,	%i0,	%i4
	nop
	set	0x1C, %l2
	ldub	[%l7 + %l2],	%i2
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%l3
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%g7
	ld	[%l7 + 0x5C],	%f31
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%o2
	nop
	set	0x70, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x10, %i6
	std	%o6,	[%l7 + %i6]
	nop
	set	0x50, %l3
	ldsh	[%l7 + %l3],	%g4
	nop
	set	0x3F, %o3
	stb	%g3,	[%l7 + %o3]
	nop
	set	0x54, %o5
	lduw	[%l7 + %o5],	%g6
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x81,	%i1
	nop
	set	0x1A, %g1
	ldsh	[%l7 + %g1],	%i3
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xeb,	%o6
	set	0x48, %i0
	stxa	%l0,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x32, %l6
	stha	%l2,	[%l7 + %l6] 0x80
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%l5
	set	0x1C, %o6
	stha	%i5,	[%l7 + %o6] 0xeb
	membar	#Sync
	bg	%icc,	loop_84
	nop
	set	0x48, %g3
	std	%f24,	[%l7 + %g3]
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x88,	 3
loop_84:
	nop
	set	0x4E, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l1
	set	0x40, %i5
	stda	%o0,	[%l7 + %i5] 0x88
	set	0x48, %g7
	swapa	[%l7 + %g7] 0x80,	%g5
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x62, %l0
	ldub	[%l7 + %l0],	%o4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f0
	set	0x24, %g6
	stwa	%o3,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f16
	nop
	set	0x28, %l1
	lduh	[%l7 + %l1],	%i6
	set	0x74, %i7
	stwa	%o0,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x20, %i4
	std	%l4,	[%l7 + %i4]
	add	%i0,	%i2,	%i4
	and	%l6,	%l3,	%o5
	nop
	set	0x1D, %l4
	ldub	[%l7 + %l4],	%g2
	add	%o2,	%g7,	%o7
	set	0x58, %g2
	lda	[%l7 + %g2] 0x88,	%f7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xeb,	%g2
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%g6
	bgu,a,pn	%xcc,	loop_85
	nop
	set	0x68, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x60, %o0
	stda	%g4,	[%l7 + %o0] 0x88
loop_85:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	set	0x48, %l3
	swapa	[%l7 + %l3] 0x80,	%i1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f16
	set	0x48, %o3
	stha	%o6,	[%l7 + %o3] 0xeb
	membar	#Sync
	fpadd16s	%f4,	%f6,	%f9
	set	0x66, %o5
	stha	%l0,	[%l7 + %o5] 0x89
	set	0x54, %l5
	sta	%f5,	[%l7 + %l5] 0x80
	set	0x08, %g1
	stwa	%l2,	[%l7 + %g1] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf1,	%f0
	nop
	set	0x78, %l6
	stw	%g1,	[%l7 + %l6]
	nop
	set	0x74, %o2
	ldsh	[%l7 + %o2],	%i3
	set	0x70, %g3
	stda	%l4,	[%l7 + %g3] 0x89
	nop
	set	0x10, %o1
	stx	%i7,	[%l7 + %o1]
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x88,	%i5
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%l0
	nop
	set	0x5C, %i5
	stw	%o1,	[%l7 + %i5]
	set	0x2C, %g7
	stwa	%g5,	[%l7 + %g7] 0x88
	nop
	set	0x54, %l0
	stw	%o4,	[%l7 + %l0]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f16
	and	%i6,	%o0,	%o3
	ld	[%l7 + 0x78],	%f24
	or	%i0,	%l4,	%i4
	nop
	set	0x74, %g6
	stb	%i2,	[%l7 + %g6]
	ld	[%l7 + 0x30],	%f3
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x7C, %l1
	ldsw	[%l7 + %l1],	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%g2
	set	0x4B, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l3
	set	0x4C, %i7
	sta	%f24,	[%l7 + %i7] 0x80
	set	0x74, %l4
	lda	[%l7 + %l4] 0x89,	%f3
	set	0x40, %g2
	sta	%f7,	[%l7 + %g2] 0x80
	set	0x3B, %i4
	stba	%g7,	[%l7 + %i4] 0xe2
	membar	#Sync
	and	%o2,	%o7,	%g3
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x81,	%g4
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x60, %o0
	stx	%g6,	[%l7 + %o0]
	set	0x10, %g5
	stda	%i0,	[%l7 + %g5] 0x81
	st	%fsr,	[%l7 + 0x34]
	set	0x58, %g4
	stxa	%o6,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xcc
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%l0
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x29, %o3
	stba	%i3,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x81,	 1
	add	%g1,	%i5,	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%o1
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f14
	st	%fsr,	[%l7 + 0x68]
	add	%o4,	%g5,	%o0
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%o2
	nop
	set	0x31, %i0
	ldstub	[%l7 + %i0],	%i0
	nop
	set	0x20, %l6
	ldstub	[%l7 + %l6],	%l4
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%i4
	st	%fsr,	[%l7 + 0x3C]
	set	0x48, %o1
	stda	%i2,	[%l7 + %o1] 0x81
	set	0x58, %g3
	sta	%f8,	[%l7 + %g3] 0x89
	set	0x48, %o6
	stxa	%i6,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x81,	%l6
	nop
	set	0x60, %g7
	ldx	[%l7 + %g7],	%g2
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%o4
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f26
	or	%g7,	%l3,	%o2
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x80,	%g2
	st	%f29,	[%l7 + 0x64]
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%g4
	set	0x23, %i3
	ldstuba	[%l7 + %i3] 0x80,	%g6
	nop
	set	0x2C, %l1
	stw	%i1,	[%l7 + %l1]
	wr	%l2,	%l0,	%set_softint
	nop
	set	0x1C, %i7
	lduw	[%l7 + %i7],	%i3
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%o6
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%g1
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i4
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l5
	nop
	set	0x23, %o7
	ldub	[%l7 + %o7],	%l1
	nop
	set	0x2A, %i4
	lduh	[%l7 + %i4],	%i7
	st	%f17,	[%l7 + 0x68]
	set	0x60, %g5
	stwa	%o1,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x78, %g4
	stx	%g5,	[%l7 + %g4]
	wr 	%g0, 	0x7, 	%fprs
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	nop
	set	0x7E, %l3
	ldsh	[%l7 + %l3],	%i0
	be,pn	%xcc,	loop_86
	or	%i4,	%i2,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%g2
loop_86:
	nop
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%g7
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f26
	nop
	set	0x14, %l5
	stb	%l3,	[%l7 + %l5]
	nop
	set	0x40, %i0
	lduw	[%l7 + %i0],	%g3
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xeb,	%o6
	nop
	set	0x20, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%o2
	nop
	set	0x40, %o3
	std	%f22,	[%l7 + %o3]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd2
	st	%f16,	[%l7 + 0x34]
	set	0x38, %i5
	sta	%f25,	[%l7 + %i5] 0x88
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x81,	%g4
	set	0x74, %l0
	ldstuba	[%l7 + %l0] 0x80,	%i1
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x20, %o4
	lda	[%l7 + %o4] 0x88,	%f6
	nop
	set	0x38, %i2
	std	%l2,	[%l7 + %i2]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%g6
	nop
	set	0x60, %g6
	stx	%i3,	[%l7 + %g6]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%g1
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x81,	%i5
	ld	[%l7 + 0x24],	%f19
	set	0x58, %i7
	stwa	%l0,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x50, %l4
	std	%l4,	[%l7 + %l4]
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x88,	 4
	nop
	set	0x08, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x58, %l2
	lda	[%l7 + %l2] 0x88,	%f26
	st	%f3,	[%l7 + 0x30]
	set	0x78, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o1
	set	0x68, %i4
	stwa	%i7,	[%l7 + %i4] 0x80
	set	0x70, %g5
	stxa	%g5,	[%l7 + %g5] 0x88
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd2,	%f16
	nop
	set	0x4C, %i6
	lduh	[%l7 + %i6],	%o4
	set	0x5E, %g4
	stba	%o3,	[%l7 + %g4] 0x81
	nop
	set	0x60, %o5
	lduh	[%l7 + %o5],	%i4
	ld	[%l7 + 0x28],	%f8
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l4
	or	%i6,	%g2,	%o5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xcc
	ld	[%l7 + 0x7C],	%f22
	set	0x70, %i0
	ldxa	[%l7 + %i0] 0x80,	%i0
	set	0x40, %l6
	lda	[%l7 + %l6] 0x80,	%f11
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x81,	%l6
	set	0x2D, %o2
	stba	%g7,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x43, %o1
	stba	%l3,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x52, %g3
	stha	%g3,	[%l7 + %g3] 0x89
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc2
	nop
	set	0x10, %g7
	std	%o6,	[%l7 + %g7]
	nop
	set	0x64, %o6
	ldsb	[%l7 + %o6],	%g4
	nop
	set	0x48, %i2
	stb	%i1,	[%l7 + %i2]
	nop
	set	0x18, %o4
	stx	%o2,	[%l7 + %o4]
	set	0x30, %i3
	swapa	[%l7 + %i3] 0x80,	%g6
	set	0x14, %l1
	stwa	%l2,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x78, %i7
	stxa	%i3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x60, %g6
	std	%f12,	[%l7 + %g6]
	ld	[%l7 + 0x34],	%f10
	nop
	set	0x2A, %g2
	sth	%o6,	[%l7 + %g2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%l0
	nop
	set	0x52, %i1
	ldub	[%l7 + %i1],	%i5
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x81,	%l1
	set	0x68, %o7
	stda	%o0,	[%l7 + %o7] 0x81
	or	%i7,	%g5,	%l5
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc2
	wr	%o4,	%o3,	%y
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x28, %o0
	sta	%f27,	[%l7 + %o0] 0x89
	nop
	set	0x5C, %l3
	swap	[%l7 + %l3],	%i4
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x88,	 2
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%l4
	add	%i2,	%i6,	%o5
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x89,	 3
	nop
	set	0x38, %o5
	swap	[%l7 + %o5],	%g2
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x88,	%l6
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%l3
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x81
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%g3
	set	0x41, %l6
	stba	%o7,	[%l7 + %l6] 0x81
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xcc
	bne,pn	%icc,	loop_87
	nop
	set	0x60, %o1
	stx	%i1,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%g4
loop_87:
	nop
	set	0x7E, %g3
	sth	%o2,	[%l7 + %g3]
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%g6
	nop
	set	0x0E, %l0
	ldsb	[%l7 + %l0],	%l2
	nop
	set	0x28, %o6
	lduh	[%l7 + %o6],	%o6
	or	%g1,	%l0,	%i5
	nop
	set	0x30, %g7
	stw	%i3,	[%l7 + %g7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%i7
	nop
	set	0x16, %o4
	ldsh	[%l7 + %o4],	%g5
	nop
	set	0x18, %i2
	ldx	[%l7 + %i2],	%l1
	set	0x58, %l1
	sta	%f2,	[%l7 + %l1] 0x81
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%o4
	set	0x3C, %i7
	stba	%l5,	[%l7 + %i7] 0x81
	nop
	set	0x15, %g2
	ldub	[%l7 + %g2],	%o3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc2
	nop
	set	0x30, %l4
	stw	%o0,	[%l7 + %l4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%l4
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x89,	%i6
	set	0x54, %g6
	sta	%f22,	[%l7 + %g6] 0x88
	nop
	set	0x41, %g5
	ldsb	[%l7 + %g5],	%o5
	or	%i0,	%i2,	%l6
	nop
	set	0x50, %i4
	stx	%l3,	[%l7 + %i4]
	and	%g2,	%g7,	%g3
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%i1
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%o6
	ld	[%l7 + 0x70],	%f13
	nop
	nop
	setx	0x1C5D1907968D5819,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1B6E73E88651FD17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f16
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%g4
	or	%g6,	%l2,	%o2
	nop
	set	0x4C, %g4
	swap	[%l7 + %g4],	%o6
	st	%f21,	[%l7 + 0x4C]
	nop
	set	0x70, %o5
	ldstub	[%l7 + %o5],	%l0
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x81,	%g1
	set	0x24, %g1
	stwa	%i3,	[%l7 + %g1] 0x88
	st	%fsr,	[%l7 + 0x74]
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	nop
	set	0x1D, %l6
	ldsb	[%l7 + %l6],	%i7
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f16
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe2,	%i4
	nop
	set	0x58, %g3
	std	%f18,	[%l7 + %g3]
	set	0x0D, %o3
	stba	%l1,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x13, %o1
	ldsb	[%l7 + %o1],	%g5
	nop
	set	0x20, %l0
	std	%l4,	[%l7 + %l0]
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x88,	 2
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc4
	nop
	set	0x6A, %o6
	ldsb	[%l7 + %o6],	%o3
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%o0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd2,	%f16
	nop
	set	0x0A, %i7
	stb	%i4,	[%l7 + %i7]
	nop
	set	0x50, %g2
	std	%f0,	[%l7 + %g2]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf0
	membar	#Sync
	or	%i6,	%l4,	%i0
	set	0x10, %i1
	stxa	%i2,	[%l7 + %i1] 0x80
	nop
	set	0x53, %o7
	ldstub	[%l7 + %o7],	%l6
	nop
	set	0x74, %l4
	ldsw	[%l7 + %l4],	%o5
	nop
	set	0x68, %g6
	swap	[%l7 + %g6],	%g2
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f26
	st	%fsr,	[%l7 + 0x08]
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	ld	[%l7 + 0x58],	%f25
	set	0x78, %g5
	stda	%g2,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%i1
	st	%fsr,	[%l7 + 0x60]
	set	0x08, %i6
	sta	%f10,	[%l7 + %i6] 0x80
	add	%g4,	%g6,	%o7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%l2
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%l0
	nop
	set	0x7C, %l2
	ldsb	[%l7 + %l2],	%g1
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x88,	%o6
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f16
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xca
	nop
	set	0x76, %l6
	sth	%o1,	[%l7 + %l6]
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x89,	%i7
	nop
	set	0x7F, %i5
	ldub	[%l7 + %i5],	%i3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%g5
	nop
	set	0x40, %o1
	std	%f28,	[%l7 + %o1]
	set	0x60, %l0
	stxa	%o4,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%o2
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x89,	%l5
	nop
	set	0x44, %o4
	lduh	[%l7 + %o4],	%o0
	nop
	set	0x40, %o6
	std	%f16,	[%l7 + %o6]
	set	0x60, %l1
	stwa	%i4,	[%l7 + %l1] 0x80
	ble,a,pt	%icc,	loop_88
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x34, %i3
	ldstub	[%l7 + %i3],	%i6
	and	%i0,	%i2,	%l6
loop_88:
	nop
	set	0x48, %i7
	prefetch	[%l7 + %i7],	 4
	ld	[%l7 + 0x68],	%f25
	nop
	set	0x41, %i2
	ldub	[%l7 + %i2],	%l4
	nop
	set	0x10, %g2
	lduw	[%l7 + %g2],	%o5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x89,	 1
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x81,	%l3
	nop
	set	0x0A, %i4
	stb	%g3,	[%l7 + %i4]
	nop
	set	0x3A, %o0
	ldstub	[%l7 + %o0],	%g7
	set	0x2A, %l4
	stha	%i1,	[%l7 + %l4] 0x88
	or	%g4,	%o7,	%g6
	set	0x48, %i6
	stwa	%o2,	[%l7 + %i6] 0x81
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x3E, %l3
	ldub	[%l7 + %l3],	%l0
	nop
	set	0x64, %g4
	stw	%l2,	[%l7 + %g4]
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	nop
	setx	0x6F6FE9A430E0AA42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8093DA47BE8B9AED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f14,	%f6
	or	%o6,	%o1,	%g1
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%i6
	nop
	set	0x08, %i0
	ldsw	[%l7 + %i0],	%l1
	add	%i5,	%i3,	%o4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f16
	st	%f31,	[%l7 + 0x54]
	set	0x12, %l5
	stha	%g5,	[%l7 + %l5] 0x88
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x71, %i5
	ldstub	[%l7 + %i5],	%l5
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf9
	membar	#Sync
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	nop
	set	0x28, %o1
	stw	%o0,	[%l7 + %o1]
	set	0x20, %o3
	stxa	%i4,	[%l7 + %o3] 0xe2
	membar	#Sync
	and	%i0,	%i2,	%i6
	set	0x38, %o4
	stxa	%l4,	[%l7 + %o4] 0x80
	nop
	nop
	setx	0x5E42D1F069BC6C46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xD26BA12C5C1A0C81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f8,	%f22
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%o5
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xe2,	%g2
	ble,a,pt	%xcc,	loop_89
	nop
	set	0x7F, %i3
	ldub	[%l7 + %i3],	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%g3
loop_89:
	nop
	set	0x10, %i7
	ldsw	[%l7 + %i7],	%i1
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe3,	%g4
	nop
	set	0x46, %g2
	lduh	[%l7 + %g2],	%o7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%o2
	set	0x0A, %o7
	stba	%g7,	[%l7 + %o7] 0x88
	set	0x66, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l0
	set	0x54, %l1
	stwa	%o6,	[%l7 + %l1] 0x81
	ld	[%l7 + 0x6C],	%f22
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1247
!	Type a   	: 21
!	Type cti   	: 27
!	Type x   	: 566
!	Type f   	: 31
!	Type i   	: 108
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
	set	0xB,	%g1
	set	0x9,	%g2
	set	0xD,	%g3
	set	0x0,	%g4
	set	0x2,	%g5
	set	0x9,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0x7,	%i1
	set	-0x0,	%i2
	set	-0x1,	%i3
	set	-0x0,	%i4
	set	-0xB,	%i5
	set	-0xB,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x66805920,	%l0
	set	0x1C1CE5F9,	%l1
	set	0x044BE18C,	%l2
	set	0x5E400D2C,	%l3
	set	0x22AC40DD,	%l4
	set	0x1FBFA86A,	%l5
	set	0x7FB547BC,	%l6
	!# Output registers
	set	-0x0F8C,	%o0
	set	-0x0A3A,	%o1
	set	0x0A86,	%o2
	set	0x1035,	%o3
	set	-0x1600,	%o4
	set	0x04A3,	%o5
	set	0x162F,	%o6
	set	0x17C4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	set	0x48, %g6
	lda	[%l7 + %g6] 0x88,	%f5
	fpadd32	%f22,	%f10,	%f12
	nop
	set	0x10, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd8
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f30
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x89,	 3
	nop
	set	0x48, %l3
	std	%f10,	[%l7 + %l3]
	and	%l2,	%g1,	%i7
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	nop
	set	0x79, %g4
	stb	%i3,	[%l7 + %g4]
	nop
	set	0x50, %l2
	std	%i4,	[%l7 + %l2]
	nop
	set	0x5C, %g1
	ldstub	[%l7 + %g1],	%o4
	set	0x20, %i0
	stxa	%l5,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%o0
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%i4
	nop
	set	0x14, %l5
	lduh	[%l7 + %l5],	%g5
	set	0x38, %i5
	sta	%f10,	[%l7 + %i5] 0x89
	set	0x74, %g3
	lda	[%l7 + %g3] 0x88,	%f3
	set	0x28, %l6
	stxa	%i0,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x78, %o5
	lda	[%l7 + %o5] 0x81,	%f2
	set	0x34, %l0
	swapa	[%l7 + %l0] 0x88,	%i6
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%i2
	st	%fsr,	[%l7 + 0x0C]
	fpadd32	%f2,	%f16,	%f0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l4
	nop
	set	0x48, %o4
	stx	%l6,	[%l7 + %o4]
	set	0x6C, %o6
	sta	%f24,	[%l7 + %o6] 0x88
	set	0x53, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l3
	nop
	set	0x48, %o1
	std	%g2,	[%l7 + %o1]
	set	0x64, %i7
	lda	[%l7 + %i7] 0x81,	%f1
	nop
	set	0x5E, %i3
	lduh	[%l7 + %i3],	%i1
	nop
	set	0x68, %i2
	stb	%g2,	[%l7 + %i2]
	set	0x38, %g2
	stba	%o7,	[%l7 + %g2] 0x81
	fpsub16s	%f15,	%f0,	%f24
	set	0x4C, %o7
	stwa	%g4,	[%l7 + %o7] 0x88
	nop
	set	0x30, %l1
	std	%o2,	[%l7 + %l1]
	nop
	set	0x60, %g6
	std	%f28,	[%l7 + %g6]
	set	0x22, %i1
	stba	%g7,	[%l7 + %i1] 0x81
	nop
	set	0x4A, %l4
	ldsb	[%l7 + %l4],	%l0
	set	0x60, %o0
	stda	%g6,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x50, %g5
	ldx	[%l7 + %g5],	%o6
	nop
	set	0x70, %l3
	std	%o0,	[%l7 + %l3]
	nop
	set	0x18, %i4
	stx	%g1,	[%l7 + %i4]
	set	0x50, %g4
	stxa	%l2,	[%l7 + %g4] 0xeb
	membar	#Sync
	bgu,a	%xcc,	loop_90
	nop
	set	0x40, %i6
	sth	%l1,	[%l7 + %i6]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%i6
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%i3
loop_90:
	nop
	set	0x6C, %o2
	swapa	[%l7 + %o2] 0x80,	%i5
	fpadd32s	%f25,	%f1,	%f28
	set	0x1F, %i0
	stba	%o4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x58, %i5
	stb	%o3,	[%l7 + %i5]
	nop
	set	0x78, %l5
	ldstub	[%l7 + %l5],	%o0
	st	%fsr,	[%l7 + 0x70]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd8
	nop
	set	0x58, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x2C, %o5
	ldub	[%l7 + %o5],	%l5
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%i4
	nop
	set	0x18, %o4
	ldsb	[%l7 + %o4],	%i0
	set	0x60, %o6
	stxa	%i6,	[%l7 + %o6] 0x81
	or	%g5,	%o5,	%l4
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%i6
	nop
	set	0x44, %o1
	lduw	[%l7 + %o1],	%l3
	nop
	set	0x6E, %i7
	ldsh	[%l7 + %i7],	%i2
	nop
	set	0x62, %o3
	ldsh	[%l7 + %o3],	%i1
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%g2
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	nop
	set	0x38, %o7
	ldsw	[%l7 + %o7],	%o7
	nop
	set	0x68, %g2
	ldsh	[%l7 + %g2],	%o2
	nop
	set	0x68, %g6
	swap	[%l7 + %g6],	%g4
	nop
	set	0x28, %l1
	stx	%g7,	[%l7 + %l1]
	ble,a,pn	%icc,	loop_91
	nop
	set	0x4E, %l4
	ldstub	[%l7 + %l4],	%g6
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x88,	%l0
loop_91:
	nop
	set	0x30, %o0
	stx	%o6,	[%l7 + %o0]
	set	0x4C, %l3
	sta	%f25,	[%l7 + %l3] 0x88
	nop
	set	0x26, %i4
	lduh	[%l7 + %i4],	%o1
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%g1
	set	0x18, %g4
	stwa	%l2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x40, %l2
	swap	[%l7 + %l2],	%l1
	set	0x14, %g1
	stha	%i7,	[%l7 + %g1] 0xea
	membar	#Sync
	add	%i3,	%i5,	%o4
	bge,a	%icc,	loop_92
	or	%o3,	%o0,	%l5
	nop
	set	0x46, %o2
	ldstub	[%l7 + %o2],	%i4
	st	%fsr,	[%l7 + 0x30]
loop_92:
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x40, %i5
	sth	%i6,	[%l7 + %i5]
	set	0x08, %l6
	stwa	%g5,	[%l7 + %l6] 0x81
	nop
	set	0x5C, %g3
	swap	[%l7 + %g3],	%o5
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f28
	set	0x64, %l0
	stwa	%l6,	[%l7 + %l0] 0x81
	nop
	set	0x30, %o4
	ldsw	[%l7 + %o4],	%l3
	nop
	set	0x0D, %o6
	ldsb	[%l7 + %o6],	%i2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f0
	nop
	set	0x38, %o1
	stw	%l4,	[%l7 + %o1]
	st	%f24,	[%l7 + 0x4C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%i1
	set	0x64, %g7
	lda	[%l7 + %g7] 0x89,	%f7
	nop
	set	0x48, %o3
	stw	%g2,	[%l7 + %o3]
	set	0x28, %i2
	stxa	%o7,	[%l7 + %i2] 0x88
	set	0x64, %i7
	stha	%g4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%o2
	nop
	set	0x59, %g2
	ldub	[%l7 + %g2],	%g6
	set	0x50, %g6
	ldxa	[%l7 + %g6] 0x88,	%g7
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%o1
	set	0x24, %i1
	swapa	[%l7 + %i1] 0x88,	%l0
	nop
	set	0x78, %l4
	std	%l2,	[%l7 + %l4]
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x3E, %o0
	stha	%g1,	[%l7 + %o0] 0x88
	nop
	set	0x58, %g5
	std	%f6,	[%l7 + %g5]
	nop
	set	0x48, %i4
	std	%f16,	[%l7 + %i4]
	set	0x70, %g4
	ldstuba	[%l7 + %g4] 0x88,	%l1
	set	0x20, %g1
	stxa	%i7,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%o4
	set	0x0C, %o2
	stba	%i5,	[%l7 + %o2] 0x80
	set	0x0C, %i6
	sta	%f5,	[%l7 + %i6] 0x81
	set	0x2E, %i5
	stba	%o0,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x60, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l5
	set	0x70, %g3
	swapa	[%l7 + %g3] 0x80,	%o3
	st	%fsr,	[%l7 + 0x10]
	or	%i0,	%i6,	%i4
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x88,	 4
	st	%fsr,	[%l7 + 0x40]
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x81,	%i6
	nop
	set	0x1A, %l0
	ldsh	[%l7 + %l0],	%l3
	st	%fsr,	[%l7 + 0x2C]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%o5
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xea,	%l4
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f22
	set	0x20, %o4
	stxa	%g3,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%f12
	nop
	set	0x30, %o1
	stx	%i1,	[%l7 + %o1]
	or	%g2,	%o7,	%o2
	set	0x38, %o3
	stxa	%g4,	[%l7 + %o3] 0x89
	nop
	set	0x4C, %i7
	stw	%g6,	[%l7 + %i7]
	nop
	set	0x48, %o7
	ldsh	[%l7 + %o7],	%g7
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f6
	nop
	set	0x52, %i2
	lduh	[%l7 + %i2],	%o6
	add	%l0,	%l2,	%o1
	nop
	set	0x10, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%g1
	set	0x6A, %i3
	stha	%i7,	[%l7 + %i3] 0x80
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f10
	nop
	set	0x78, %i1
	lduw	[%l7 + %i1],	%l1
	nop
	set	0x18, %l3
	stb	%o4,	[%l7 + %l3]
	ld	[%l7 + 0x2C],	%f22
	set	0x18, %g5
	stda	%i4,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x78, %i4
	stha	%o0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x1C, %o0
	ldub	[%l7 + %o0],	%l5
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf9
	membar	#Sync
	nop
	set	0x4C, %g1
	stw	%o3,	[%l7 + %g1]
	set	0x33, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i3
	set	0x40, %i6
	swapa	[%l7 + %i6] 0x81,	%i6
	set	0x5A, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i4
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%i0
	add	%l6,	%l3,	%g5
	set	0x0F, %g3
	stba	%i2,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x58, %l6
	std	%l4,	[%l7 + %l6]
	nop
	set	0x49, %i5
	ldub	[%l7 + %i5],	%o5
	nop
	set	0x36, %l0
	ldsh	[%l7 + %l0],	%g3
	nop
	set	0x18, %o6
	std	%i0,	[%l7 + %o6]
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%o7
	nop
	set	0x2E, %o5
	ldsb	[%l7 + %o5],	%o2
	bn,a	%xcc,	loop_93
	nop
	set	0x58, %g7
	swap	[%l7 + %g7],	%g4
	nop
	set	0x3C, %o1
	stw	%g2,	[%l7 + %o1]
	ble,a,pn	%icc,	loop_94
loop_93:
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%g6
	nop
	set	0x30, %i7
	std	%f4,	[%l7 + %i7]
	nop
	set	0x30, %o4
	stx	%fsr,	[%l7 + %o4]
loop_94:
	nop
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x80,	%g7
	nop
	set	0x70, %i2
	std	%f24,	[%l7 + %i2]
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%o6
	nop
	set	0x1B, %l1
	ldub	[%l7 + %l1],	%l0
	nop
	set	0x38, %g6
	std	%l2,	[%l7 + %g6]
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%g1
	nop
	set	0x30, %i1
	stx	%o1,	[%l7 + %i1]
	st	%f31,	[%l7 + 0x34]
	set	0x30, %l3
	stha	%l1,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f16
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	nop
	setx	0x960A451F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x6EE832E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f16,	%f16
	nop
	set	0x60, %o0
	std	%o4,	[%l7 + %o0]
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f6
	set	0x20, %g1
	stha	%i7,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x81,	%o0
	add	%l5,	%o3,	%i3
	nop
	set	0x50, %l2
	std	%f12,	[%l7 + %l2]
	fpsub32	%f20,	%f6,	%f6
	nop
	set	0x29, %o2
	stb	%i6,	[%l7 + %o2]
	nop
	set	0x62, %i6
	sth	%i5,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x54]
	set	0x78, %i0
	lda	[%l7 + %i0] 0x89,	%f8
	nop
	set	0x54, %l6
	stw	%i4,	[%l7 + %l6]
	nop
	set	0x16, %g3
	ldsb	[%l7 + %g3],	%l6
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%l2
	nop
	set	0x62, %l5
	sth	%i2,	[%l7 + %l5]
	add	%g5,	%o5,	%l4
	wr	%i1,	%g3,	%softint
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o7
	set	0x20, %o5
	stha	%g2,	[%l7 + %o5] 0xeb
	membar	#Sync
	add	%g6,	%g4,	%g7
	nop
	set	0x14, %o6
	ldsh	[%l7 + %o6],	%o6
	nop
	set	0x10, %g7
	stx	%l0,	[%l7 + %g7]
	nop
	set	0x12, %o3
	stb	%l2,	[%l7 + %o3]
	set	0x1F, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%o0
	set	0x68, %i7
	stxa	%l5,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x4C, %g2
	lda	[%l7 + %g2] 0x81,	%f0
	nop
	set	0x22, %i2
	sth	%o3,	[%l7 + %i2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i6
	nop
	set	0x62, %o4
	ldsh	[%l7 + %o4],	%i3
	set	0x5C, %o7
	stha	%i4,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x50, %l1
	stx	%i5,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0E4, 	%tick_cmpr
	nop
	set	0x64, %l4
	stw	%l6,	[%l7 + %l4]
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%g5
	nop
	set	0x60, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%i2
	set	0x54, %i4
	stba	%l4,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x66, %o0
	lduh	[%l7 + %o0],	%i1
	nop
	set	0x3F, %g4
	stb	%o5,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xca
	nop
	set	0x68, %l2
	prefetch	[%l7 + %l2],	 1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%o2
	nop
	set	0x68, %i3
	swap	[%l7 + %i3],	%g2
	set	0x40, %i6
	ldxa	[%l7 + %i6] 0x80,	%o7
	set	0x44, %o2
	lda	[%l7 + %o2] 0x80,	%f21
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe3,	%g6
	set	0x40, %i0
	sta	%f26,	[%l7 + %i0] 0x89
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%g4
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%l0
	add	%l2,	%l1,	%g1
	nop
	set	0x43, %l0
	ldub	[%l7 + %l0],	%o4
	nop
	set	0x28, %l5
	std	%i6,	[%l7 + %l5]
	nop
	set	0x46, %o5
	stb	%l5,	[%l7 + %o5]
	nop
	set	0x3C, %g7
	stb	%o0,	[%l7 + %g7]
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe3,	%o2
	nop
	set	0x24, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f0
	set	0x23, %i7
	stba	%i6,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f8
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%i2
	nop
	set	0x4F, %g2
	stb	%o1,	[%l7 + %g2]
	nop
	set	0x62, %l1
	sth	%i4,	[%l7 + %l1]
	set	0x53, %o7
	stba	%i5,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x21, %l4
	stba	%i0,	[%l7 + %l4] 0x88
	st	%f4,	[%l7 + 0x70]
	nop
	set	0x08, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f30
	nop
	set	0x34, %l3
	ldstub	[%l7 + %l3],	%l3
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f10
	nop
	set	0x44, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x0B, %g1
	stb	%g5,	[%l7 + %g1]
	set	0x37, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i2
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x81,	%l6
	set	0x3D, %g6
	stba	%l4,	[%l7 + %g6] 0xeb
	membar	#Sync
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o5
	set	0x5C, %i6
	stwa	%g3,	[%l7 + %i6] 0x89
	nop
	set	0x38, %o2
	lduh	[%l7 + %o2],	%o2
	set	0x40, %i3
	stxa	%o7,	[%l7 + %i3] 0x80
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%g6
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x89,	%g4
	nop
	set	0x5D, %g3
	ldstub	[%l7 + %g3],	%g2
	st	%f3,	[%l7 + 0x58]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%l0
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%g6
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%l1
	nop
	set	0x7B, %l5
	ldub	[%l7 + %l5],	%g1
	nop
	set	0x1C, %g7
	stw	%l2,	[%l7 + %g7]
	set	0x40, %o3
	lda	[%l7 + %o3] 0x81,	%f0
	set	0x5D, %o1
	stba	%i7,	[%l7 + %o1] 0x81
	or	%o4,	%o0,	%l5
	nop
	set	0x38, %o6
	stx	%fsr,	[%l7 + %o6]
	ld	[%l7 + 0x64],	%f8
	nop
	set	0x2C, %i7
	lduw	[%l7 + %i7],	%i6
	set	0x0E, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o3
	nop
	set	0x4C, %i2
	swap	[%l7 + %i2],	%o1
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x2F, %l1
	stba	%i4,	[%l7 + %l1] 0xea
	membar	#Sync
	fpsub16	%f26,	%f24,	%f4
	nop
	set	0x68, %o7
	lduh	[%l7 + %o7],	%i5
	nop
	set	0x38, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x4C, %g2
	lda	[%l7 + %g2] 0x81,	%f17
	set	0x4C, %g5
	swapa	[%l7 + %g5] 0x80,	%i0
	set	0x7E, %l3
	stha	%i3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x52, %i1
	ldub	[%l7 + %i1],	%g5
	nop
	set	0x5C, %i4
	stw	%i2,	[%l7 + %i4]
	nop
	set	0x30, %g1
	stx	%l3,	[%l7 + %g1]
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x89,	%f22
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%l6
	set	0x76, %g6
	stba	%l4,	[%l7 + %g6] 0xeb
	membar	#Sync
	add	%i1,	%o5,	%g3
	set	0x50, %i6
	sta	%f27,	[%l7 + %i6] 0x80
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%o2
	nop
	set	0x48, %o2
	ldx	[%l7 + %o2],	%o7
	nop
	set	0x1A, %i3
	ldsb	[%l7 + %i3],	%g4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%g6
	nop
	set	0x34, %l6
	stw	%l0,	[%l7 + %l6]
	nop
	set	0x7C, %g3
	lduh	[%l7 + %g3],	%o6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe2,	%l2
	wr	%i7,	%o4,	%softint
	nop
	set	0x2A, %l0
	ldstub	[%l7 + %l0],	%g1
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe3,	%l4
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x89,	%o0
	nop
	set	0x60, %i5
	std	%o2,	[%l7 + %i5]
	nop
	set	0x49, %o3
	stb	%o1,	[%l7 + %o3]
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x10, %i7
	std	%i4,	[%l7 + %i7]
	set	0x44, %o6
	lda	[%l7 + %o6] 0x88,	%f7
	nop
	set	0x48, %o5
	ldx	[%l7 + %o5],	%i6
	and	%i0,	%i3,	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%l3
	nop
	set	0x58, %i2
	ldsw	[%l7 + %i2],	%i2
	or	%l4,	%l6,	%i1
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	or	%g3,	%o2,	%o7
	ld	[%l7 + 0x20],	%f18
	nop
	set	0x30, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x60, %l4
	stx	%o5,	[%l7 + %l4]
	ld	[%l7 + 0x08],	%f13
	nop
	set	0x28, %o7
	stx	%g4,	[%l7 + %o7]
	set	0x4B, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g2
	nop
	set	0x48, %l3
	ldx	[%l7 + %l3],	%g6
	wr	%l0,	%l1,	%sys_tick
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x81,	%f14
	ble,a,pt	%xcc,	loop_95
	nop
	set	0x14, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x7C, %i4
	swap	[%l7 + %i4],	%g7
	set	0x6C, %g1
	sta	%f3,	[%l7 + %g1] 0x80
loop_95:
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%l2
	set	0x71, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i7
	nop
	set	0x40, %i6
	stw	%o6,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x50]
	add	%o4,	%l5,	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o3
	and	%o1,	%i6,	%i4
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%i0
	bg,a	%icc,	loop_96
	ld	[%l7 + 0x08],	%f8
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%g5
	st	%f0,	[%l7 + 0x08]
loop_96:
	nop
	set	0x08, %l2
	sta	%f9,	[%l7 + %l2] 0x80
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x89,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i2
	set	0x30, %l6
	stxa	%i5,	[%l7 + %l6] 0xea
	membar	#Sync
	bleu,a	%xcc,	loop_97
	add	%l4,	%l6,	%i1
	nop
	set	0x50, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x14, %l0
	sth	%g3,	[%l7 + %l0]
loop_97:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%o2
	nop
	set	0x60, %l5
	stx	%g4,	[%l7 + %l5]
	set	0x22, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g2
	st	%f21,	[%l7 + 0x38]
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%g6
	nop
	set	0x48, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x2A, %g3
	sth	%o5,	[%l7 + %g3]
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f24
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x81,	%l0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f24
	wr 	%g0, 	0x5, 	%fprs
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o6
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%l1
	nop
	set	0x30, %l4
	swap	[%l7 + %l4],	%o4
	set	0x4F, %o7
	ldstuba	[%l7 + %o7] 0x89,	%g1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o0
	add	%o3,	%i6,	%i4
	set	0x46, %g5
	stha	%i0,	[%l7 + %g5] 0x81
	nop
	set	0x4D, %o4
	ldsb	[%l7 + %o4],	%o1
	nop
	set	0x0A, %l3
	ldsh	[%l7 + %l3],	%g5
	nop
	set	0x34, %g2
	sth	%l3,	[%l7 + %g2]
	nop
	set	0x4F, %i1
	stb	%i3,	[%l7 + %i1]
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%i4
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x20, %g1
	stwa	%i2,	[%l7 + %g1] 0x89
	nop
	set	0x5C, %g4
	lduw	[%l7 + %g4],	%l4
	fpsub32s	%f18,	%f30,	%f1
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%i1
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x50, %l2
	stwa	%l6,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xd2
	set	0x28, %l6
	stxa	%g3,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x1B, %i0
	ldsb	[%l7 + %i0],	%o2
	nop
	set	0x10, %o2
	stx	%g4,	[%l7 + %o2]
	nop
	set	0x18, %l5
	std	%g2,	[%l7 + %l5]
	nop
	set	0x30, %g7
	ldsw	[%l7 + %g7],	%g6
	nop
	set	0x2F, %l0
	ldstub	[%l7 + %l0],	%o5
	nop
	set	0x4C, %o3
	stw	%o7,	[%l7 + %o3]
	set	0x20, %i5
	stxa	%g7,	[%l7 + %i5] 0x89
	nop
	set	0x6A, %g3
	sth	%l2,	[%l7 + %g3]
	nop
	set	0x13, %i7
	ldub	[%l7 + %i7],	%i7
	nop
	set	0x18, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x5C, %o5
	swap	[%l7 + %o5],	%o6
	nop
	set	0x20, %i2
	std	%f6,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x28, %o1
	stx	%l1,	[%l7 + %o1]
	and	%l0,	%g1,	%o4
	bn	%xcc,	loop_98
	wr	%o0,	%o3,	%pic
	fpsub16	%f12,	%f0,	%f4
	or	%l5,	%i4,	%i0
loop_98:
	nop
	set	0x42, %l1
	stha	%i6,	[%l7 + %l1] 0x88
	set	0x50, %l4
	stda	%o0,	[%l7 + %l4] 0xeb
	membar	#Sync
	add	%l3,	%g5,	%i5
	set	0x38, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	nop
	set	0x6F, %o4
	ldstub	[%l7 + %o4],	%l4
	set	0x60, %o7
	stda	%i2,	[%l7 + %o7] 0x80
	nop
	set	0x60, %g2
	std	%i0,	[%l7 + %g2]
	nop
	set	0x08, %i1
	lduw	[%l7 + %i1],	%g3
	and	%o2,	%g4,	%g2
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x34, %o0
	lda	[%l7 + %o0] 0x80,	%f19
	nop
	set	0x63, %g1
	stb	%g6,	[%l7 + %g1]
	set	0x4C, %g4
	lda	[%l7 + %g4] 0x81,	%f4
	nop
	set	0x10, %i6
	std	%f22,	[%l7 + %i6]
	nop
	set	0x50, %i4
	ldx	[%l7 + %i4],	%o5
	nop
	set	0x7A, %l2
	ldsh	[%l7 + %l2],	%l6
	set	0x26, %i3
	stba	%g7,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x40, %l6
	std	%f20,	[%l7 + %l6]
	set	0x3C, %i0
	stwa	%l2,	[%l7 + %i0] 0x89
	bl,pn	%xcc,	loop_99
	nop
	set	0x64, %o2
	stw	%i7,	[%l7 + %o2]
	nop
	set	0x5E, %g6
	ldsh	[%l7 + %g6],	%o7
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x88,	%l1
loop_99:
	nop
	set	0x78, %g7
	ldsb	[%l7 + %g7],	%l0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xda
	set	0x70, %i5
	stwa	%g1,	[%l7 + %i5] 0x89
	or	%o4,	%o0,	%o3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f0
	st	%f2,	[%l7 + 0x5C]
	nop
	set	0x3F, %i7
	ldstub	[%l7 + %i7],	%o6
	set	0x60, %o6
	stha	%l5,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x12, %g3
	sth	%i0,	[%l7 + %g3]
	nop
	set	0x30, %o5
	std	%i6,	[%l7 + %o5]
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%f28
	set	0x30, %l1
	stda	%i4,	[%l7 + %l1] 0x88
	nop
	set	0x3A, %i2
	lduh	[%l7 + %i2],	%l3
	add	%o1,	%g5,	%i2
	nop
	set	0x40, %g5
	swap	[%l7 + %g5],	%i5
	nop
	set	0x58, %l4
	lduw	[%l7 + %l4],	%i3
	set	0x4C, %o7
	lda	[%l7 + %o7] 0x88,	%f21
	set	0x08, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i1
	nop
	set	0x50, %i1
	ldstub	[%l7 + %i1],	%l4
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	fpadd32s	%f13,	%f8,	%f17
	or	%o2,	%g4,	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%g6
	set	0x24, %o0
	sta	%f3,	[%l7 + %o0] 0x81
	ld	[%l7 + 0x78],	%f23
	set	0x77, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o5
	nop
	set	0x1C, %l3
	lduw	[%l7 + %l3],	%l6
	set	0x6F, %g4
	stba	%l2,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x48, %i6
	lda	[%l7 + %i6] 0x89,	%f12
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%i7
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f12
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x81,	%l1
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%o7
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x81,	 2
	and	%o4,	%l0,	%o0
	set	0x56, %i0
	stha	%o6,	[%l7 + %i0] 0x81
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%o3
	set	0x34, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i0
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	or	%i6,	%i4,	%l5
	and	%o1,	%g5,	%l3
	nop
	set	0x68, %o2
	lduw	[%l7 + %o2],	%i5
	nop
	set	0x20, %o3
	ldsw	[%l7 + %o3],	%i3
	nop
	set	0x65, %l0
	ldub	[%l7 + %l0],	%i1
	st	%f31,	[%l7 + 0x78]
	fpsub16s	%f20,	%f6,	%f20
	nop
	set	0x24, %i7
	ldsb	[%l7 + %i7],	%i2
	fpadd32	%f22,	%f28,	%f20
	nop
	set	0x40, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x1B, %o6
	stba	%l4,	[%l7 + %o6] 0x88
	st	%f31,	[%l7 + 0x70]
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f26
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5D3, 	%tick_cmpr
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x81
	nop
	set	0x34, %l1
	ldsw	[%l7 + %l1],	%o2
	nop
	set	0x50, %g3
	prefetch	[%l7 + %g3],	 0
	nop
	set	0x22, %g5
	ldstub	[%l7 + %g5],	%g3
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%g6
	set	0x58, %o7
	lda	[%l7 + %o7] 0x88,	%f6
	nop
	set	0x7C, %g2
	ldsw	[%l7 + %g2],	%l6
	nop
	set	0x4C, %i1
	swap	[%l7 + %i1],	%l2
	nop
	set	0x5A, %i2
	sth	%o5,	[%l7 + %i2]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc2
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	ld	[%l7 + 0x74],	%f29
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%i7
	set	0x30, %l3
	swapa	[%l7 + %l3] 0x80,	%o7
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%o4
	set	0x18, %g4
	stda	%l0,	[%l7 + %g4] 0x88
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f0
	nop
	set	0x12, %i3
	lduh	[%l7 + %i3],	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%o6
	nop
	set	0x40, %l2
	lduh	[%l7 + %l2],	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%i4
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x88,	%i0
	nop
	set	0x58, %i0
	stx	%o1,	[%l7 + %i0]
	nop
	set	0x7C, %i4
	lduh	[%l7 + %i4],	%g5
	nop
	set	0x1D, %l5
	stb	%l3,	[%l7 + %l5]
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x80,	%l4
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f18
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f16
	nop
	set	0x1C, %l0
	ldsw	[%l7 + %l0],	%i5
	nop
	set	0x6E, %i7
	ldsb	[%l7 + %i7],	%i3
	ld	[%l7 + 0x4C],	%f21
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%i2
	set	0x10, %o6
	stda	%i0,	[%l7 + %o6] 0x89
	nop
	set	0x0E, %o3
	ldsb	[%l7 + %o3],	%g4
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x89,	%l4
	add	%o2,	%g2,	%g3
	st	%f30,	[%l7 + 0x58]
	nop
	nop
	setx	0x439477955D271CDF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC63FE9E687A513DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f28,	%f16
	nop
	set	0x17, %o5
	ldstub	[%l7 + %o5],	%g6
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x81,	 2
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f30
	nop
	set	0x7F, %l4
	stb	%l6,	[%l7 + %l4]
	nop
	set	0x2A, %g3
	ldub	[%l7 + %g3],	%o5
	nop
	set	0x3B, %o7
	ldsb	[%l7 + %o7],	%i7
	nop
	set	0x3E, %i1
	ldsb	[%l7 + %i1],	%o7
	nop
	set	0x78, %g2
	std	%f6,	[%l7 + %g2]
	set	0x37, %i2
	stba	%g1,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x65, %o0
	stb	%o4,	[%l7 + %o0]
	set	0x2C, %g1
	stha	%g7,	[%l7 + %g1] 0x81
	st	%f31,	[%l7 + 0x24]
	nop
	set	0x78, %o4
	std	%l0,	[%l7 + %o4]
	and	%l0,	%o0,	%o6
	set	0x0C, %g4
	stba	%o3,	[%l7 + %g4] 0x80
	nop
	set	0x5C, %l3
	ldsw	[%l7 + %l3],	%i4
	set	0x2C, %i6
	stha	%i0,	[%l7 + %i6] 0x89
	set	0x60, %l2
	lda	[%l7 + %l2] 0x81,	%f19
	nop
	set	0x19, %i3
	stb	%i6,	[%l7 + %i3]
	wr	%g5,	%l3,	%set_softint
	nop
	set	0x7E, %i0
	lduh	[%l7 + %i0],	%o1
	ld	[%l7 + 0x74],	%f6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%i5
	nop
	set	0x78, %l6
	std	%i2,	[%l7 + %l6]
	nop
	set	0x49, %i4
	stb	%i2,	[%l7 + %i4]
	or	%i1,	%g4,	%l4
	nop
	set	0x48, %g7
	std	%g2,	[%l7 + %g7]
	set	0x14, %l5
	lda	[%l7 + %l5] 0x80,	%f3
	nop
	set	0x3C, %o2
	ldsh	[%l7 + %o2],	%g3
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x80,	%o2
	fpadd32s	%f13,	%f12,	%f2
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%g6
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f0
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%l2
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f24
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o5
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x81,	%i7
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x88,	 3
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%g7
	set	0x5F, %o1
	stba	%l1,	[%l7 + %o1] 0x81
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	ld	[%l7 + 0x5C],	%f12
	set	0x28, %g3
	sta	%f28,	[%l7 + %g3] 0x88
	add	%o0,	%l0,	%o6
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%i4
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x81,	%i0
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x81,	%i6
	nop
	set	0x60, %i1
	stx	%o3,	[%l7 + %i1]
	nop
	set	0x18, %i2
	std	%f26,	[%l7 + %i2]
	set	0x40, %g1
	stxa	%g5,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x38, %o4
	swap	[%l7 + %o4],	%l3
	set	0x4E, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o1
	set	0x60, %o0
	stda	%i4,	[%l7 + %o0] 0x80
	set	0x54, %l3
	sta	%f12,	[%l7 + %l3] 0x88
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x88,	%i3
	set	0x28, %i6
	ldxa	[%l7 + %i6] 0x80,	%i2
	set	0x0C, %i3
	lda	[%l7 + %i3] 0x89,	%f16
	set	0x30, %l6
	stxa	%i1,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%l5
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x89,	%l4
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f12
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xea,	%g2
	st	%f24,	[%l7 + 0x18]
	be,a,pn	%xcc,	loop_100
	nop
	set	0x42, %o2
	sth	%g4,	[%l7 + %o2]
	nop
	set	0x38, %i7
	stx	%o2,	[%l7 + %i7]
	nop
	set	0x08, %i5
	stx	%g6,	[%l7 + %i5]
loop_100:
	nop
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f2
	fpadd32	%f0,	%f12,	%f12
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%g3
	nop
	set	0x42, %l1
	sth	%l6,	[%l7 + %l1]
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x81,	%f15
	set	0x41, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o5
	nop
	set	0x38, %g3
	std	%i6,	[%l7 + %g3]
	wr	%g1,	%o7,	%pic
	nop
	set	0x48, %l4
	swap	[%l7 + %l4],	%o4
	set	0x20, %o7
	sta	%f10,	[%l7 + %o7] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%o0
	nop
	set	0x24, %g5
	ldsw	[%l7 + %g5],	%l0
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%o6
	wr	%i4,	%l1,	%softint
	set	0x78, %g2
	swapa	[%l7 + %g2] 0x89,	%i0
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x10, %g1
	std	%f24,	[%l7 + %g1]
	nop
	set	0x44, %o4
	swap	[%l7 + %o4],	%o3
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%g5
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	nop
	set	0x0F, %l2
	stb	%o1,	[%l7 + %l2]
	bg,pt	%xcc,	loop_101
	fpsub16	%f14,	%f28,	%f16
	nop
	set	0x1F, %l3
	ldub	[%l7 + %l3],	%i6
	nop
	set	0x10, %i6
	prefetch	[%l7 + %i6],	 4
loop_101:
	ld	[%l7 + 0x28],	%f28
	nop
	set	0x40, %l6
	std	%i2,	[%l7 + %l6]
	nop
	set	0x14, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x44, %i3
	stw	%i5,	[%l7 + %i3]
	st	%f6,	[%l7 + 0x54]
	set	0x60, %l5
	stha	%i2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x10, %i4
	stx	%l5,	[%l7 + %i4]
	set	0x50, %i7
	stda	%i0,	[%l7 + %i7] 0x88
	wr	%g2,	%g4,	%sys_tick
	ld	[%l7 + 0x44],	%f22
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%o2
	nop
	set	0x1E, %l0
	stb	%l4,	[%l7 + %l0]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
	set	0x60, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g6
	nop
	set	0x28, %o2
	sth	%g3,	[%l7 + %o2]
	ld	[%l7 + 0x74],	%f0
	or	%l6,	%l2,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o7
	wr	%g1,	%o4,	%pic
	wr	%o0,	%g7,	%y
	nop
	set	0x10, %l1
	sth	%o6,	[%l7 + %l1]
	set	0x10, %g6
	stda	%l0,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x52, %o5
	sth	%l1,	[%l7 + %o5]
	nop
	nop
	setx	0x0EA8B498,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x223B06FB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f16,	%f16
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf8
	membar	#Sync
	nop
	set	0x78, %l4
	std	%i4,	[%l7 + %l4]
	nop
	set	0x1C, %o1
	sth	%i0,	[%l7 + %o1]
	nop
	set	0x14, %g5
	stw	%g5,	[%l7 + %g5]
	nop
	set	0x08, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x50, %o7
	std	%f24,	[%l7 + %o7]
	set	0x58, %g2
	stda	%l2,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x40, %g1
	stw	%o3,	[%l7 + %g1]
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x88,	 4
	set	0x08, %o0
	stda	%i6,	[%l7 + %o0] 0x81
	set	0x36, %g4
	stha	%i5,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x1C, %l2
	sta	%f5,	[%l7 + %l2] 0x88
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x89,	%i3
	nop
	set	0x60, %l3
	std	%i2,	[%l7 + %l3]
	set	0x79, %i6
	stba	%l5,	[%l7 + %i6] 0x89
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%g2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f0
	nop
	set	0x43, %l6
	stb	%i1,	[%l7 + %l6]
	nop
	set	0x5E, %l5
	ldsh	[%l7 + %l5],	%o2
	set	0x74, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g4
	and	%l4,	%g6,	%l6
	nop
	set	0x74, %i7
	ldub	[%l7 + %i7],	%l2
	or	%o5,	%g3,	%i7
	fpsub32	%f16,	%f0,	%f20
	nop
	set	0x50, %i4
	stx	%g1,	[%l7 + %i4]
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x89,	 4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%g7
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x30, %o3
	lduw	[%l7 + %o3],	%o0
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x4C, %l1
	sta	%f24,	[%l7 + %l1] 0x89
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%f14
	ld	[%l7 + 0x40],	%f23
	nop
	set	0x66, %o5
	ldsh	[%l7 + %o5],	%o6
	nop
	set	0x14, %l4
	ldsb	[%l7 + %l4],	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%i0
	set	0x70, %g3
	stha	%l0,	[%l7 + %g3] 0xeb
	membar	#Sync
	or	%g5,	%o3,	%o1
	nop
	set	0x78, %g5
	stw	%i6,	[%l7 + %g5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%i3
	set	0x48, %o1
	stwa	%i2,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x78, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x68, %o7
	stda	%i4,	[%l7 + %o7] 0x88
	nop
	set	0x30, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x88,	%g2
	set	0x18, %g2
	stda	%l4,	[%l7 + %g2] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%o2
	set	0x5A, %o0
	stba	%g4,	[%l7 + %o0] 0x88
	set	0x54, %g4
	sta	%f19,	[%l7 + %g4] 0x81
	nop
	set	0x28, %l2
	std	%g6,	[%l7 + %l2]
	set	0x48, %o4
	lda	[%l7 + %o4] 0x88,	%f3
	set	0x0A, %l3
	stba	%l6,	[%l7 + %l3] 0xe2
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o5
	bg,a,pt	%icc,	loop_102
	nop
	set	0x5C, %i0
	ldsw	[%l7 + %i0],	%g3
	set	0x78, %i6
	stha	%l4,	[%l7 + %i6] 0x80
loop_102:
	ld	[%l7 + 0x68],	%f11
	ld	[%l7 + 0x44],	%f0
	and	%g1,	%o7,	%i7
	set	0x18, %g7
	stxa	%o4,	[%l7 + %g7] 0xeb
	membar	#Sync
	add	%o0,	%o6,	%g7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	and	%i4,	%l1,	%l0
	set	0x54, %i3
	sta	%f24,	[%l7 + %i3] 0x81
	set	0x76, %l5
	stba	%i0,	[%l7 + %l5] 0x80
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x81,	 1
	set	0x20, %l0
	stha	%g5,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x28, %i4
	swap	[%l7 + %i4],	%i6
	nop
	set	0x2C, %i5
	stw	%l3,	[%l7 + %i5]
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x81,	%i3
	nop
	set	0x20, %l1
	std	%f16,	[%l7 + %l1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%o1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i5
	and	%i1,	%o2,	%l5
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%g4
	add	%g6,	%l2,	%l6
	set	0x1A, %o2
	stha	%g3,	[%l7 + %o2] 0x89
	set	0x73, %g6
	stba	%o5,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x5C, %g3
	ldsh	[%l7 + %g3],	%g1
	nop
	set	0x78, %o5
	sth	%l4,	[%l7 + %o5]
	and	%o7,	%i7,	%o4
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x80,	 3
	and	%g7,	%o0,	%l1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6E4, 	%sys_tick_cmpr
	nop
	set	0x4C, %g5
	swap	[%l7 + %g5],	%o3
	nop
	set	0x08, %i1
	swap	[%l7 + %i1],	%i4
	nop
	set	0x18, %o7
	swap	[%l7 + %o7],	%i6
	nop
	set	0x4A, %g1
	ldsh	[%l7 + %g1],	%l3
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf8
	membar	#Sync
	set	0x61, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g5
	add	%i2,	%i3,	%g2
	nop
	set	0x60, %i2
	stx	%i5,	[%l7 + %i2]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%i0
	nop
	set	0x2C, %g4
	ldstub	[%l7 + %g4],	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%o2
	set	0x3C, %o4
	swapa	[%l7 + %o4] 0x80,	%g4
	nop
	set	0x10, %i0
	std	%l2,	[%l7 + %i0]
	nop
	set	0x6C, %i6
	ldstub	[%l7 + %i6],	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g3
	bg	%xcc,	loop_103
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%o4
	or	%l4,	%g1,	%o7
	nop
	set	0x40, %g7
	stx	%fsr,	[%l7 + %g7]
loop_103:
	nop
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x80,	%i6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd2,	%f0
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%o6
	nop
	set	0x6A, %l5
	lduh	[%l7 + %l5],	%g7
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc8
	ld	[%l7 + 0x24],	%f12
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xe2,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%l0
	set	0x44, %i5
	lda	[%l7 + %i5] 0x80,	%f24
	set	0x6C, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o4
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x80,	%i0
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	ld	[%l7 + 0x7C],	%f13
	nop
	set	0x1E, %g6
	lduh	[%l7 + %g6],	%i4
	set	0x1C, %l4
	swapa	[%l7 + %l4] 0x89,	%l3
	fpadd16s	%f8,	%f0,	%f2
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x48, %o5
	std	%f24,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f0
	set	0x2A, %g5
	stha	%i6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x33, %o1
	ldstub	[%l7 + %o1],	%i2
	set	0x68, %i1
	stxa	%i3,	[%l7 + %i1] 0x89
	fpsub16	%f4,	%f14,	%f20
	set	0x6C, %g1
	sta	%f28,	[%l7 + %g1] 0x80
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf9
	membar	#Sync
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%i4
	nop
	set	0x4E, %o0
	ldstub	[%l7 + %o0],	%g2
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	nop
	set	0x53, %l2
	stb	%o1,	[%l7 + %l2]
	fpadd16	%f10,	%f16,	%f10
	nop
	set	0x40, %o4
	std	%l4,	[%l7 + %o4]
	nop
	set	0x40, %g4
	std	%o2,	[%l7 + %g4]
	set	0x50, %i6
	ldda	[%l7 + %i6] 0xe3,	%l2
	nop
	set	0x56, %i0
	lduh	[%l7 + %i0],	%g4
	nop
	set	0x20, %l3
	sth	%g6,	[%l7 + %l3]
	set	0x18, %l6
	stda	%i6,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x28, %i3
	std	%g2,	[%l7 + %i3]
	nop
	set	0x08, %i7
	std	%o4,	[%l7 + %i7]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%o7
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xcc
	nop
	set	0x6E, %l0
	sth	%i7,	[%l7 + %l0]
	ld	[%l7 + 0x18],	%f5
	set	0x72, %g7
	stha	%l4,	[%l7 + %g7] 0x88
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd2
	ld	[%l7 + 0x7C],	%f3
	and	%o6,	%o0,	%l1
	and	%g7,	%o4,	%l0
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	nop
	set	0x60, %o3
	lduw	[%l7 + %o3],	%o3
	st	%f6,	[%l7 + 0x24]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x80
	nop
	set	0x09, %l1
	ldub	[%l7 + %l1],	%i4
	add	%g5,	%i6,	%l3
	set	0x18, %l4
	lda	[%l7 + %l4] 0x80,	%f18
	set	0x4B, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i2
	nop
	set	0x21, %g6
	stb	%i3,	[%l7 + %g6]
	nop
	set	0x46, %o2
	sth	%i5,	[%l7 + %o2]
	set	0x20, %g5
	stda	%i0,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x43, %o5
	stba	%o1,	[%l7 + %o5] 0x88
	set	0x6C, %i1
	stba	%l5,	[%l7 + %i1] 0xea
	membar	#Sync
	st	%f20,	[%l7 + 0x10]
	nop
	nop
	setx	0x7D479AFAA43DBFC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x1A2BE150FA416E99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f30,	%f26
	set	0x58, %g1
	sta	%f30,	[%l7 + %g1] 0x81
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f16
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x88,	%g2
	nop
	set	0x5D, %o0
	ldsb	[%l7 + %o0],	%l2
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%g4
	nop
	set	0x1C, %l2
	stw	%g6,	[%l7 + %l2]
	set	0x51, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o5
	st	%fsr,	[%l7 + 0x6C]
	and	%g1,	%g3,	%o7
	nop
	set	0x18, %i2
	std	%f22,	[%l7 + %i2]
	st	%f29,	[%l7 + 0x3C]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%o6
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%i7
	nop
	set	0x08, %i0
	std	%l0,	[%l7 + %i0]
	nop
	set	0x3B, %l3
	ldstub	[%l7 + %l3],	%o0
	or	%g7,	%l0,	%o4
	nop
	set	0x58, %l6
	sth	%o3,	[%l7 + %l6]
	nop
	nop
	setx	0xCDB35292161877C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5FA9FD50CD3C0EB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f30,	%f16
	set	0x76, %i3
	stha	%i0,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x43, %i7
	ldub	[%l7 + %i7],	%g5
	nop
	set	0x20, %l5
	ldsw	[%l7 + %l5],	%i6
	set	0x0C, %i6
	stba	%l3,	[%l7 + %i6] 0xe2
	membar	#Sync
	or	%i2,	%i3,	%i5
	set	0x58, %l0
	stxa	%i4,	[%l7 + %l0] 0x88
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%i1
	set	0x35, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l5
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g4
	set	0x62, %o6
	stba	%l2,	[%l7 + %o6] 0x89
	st	%f9,	[%l7 + 0x44]
	set	0x45, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o2
	nop
	set	0x52, %i5
	ldub	[%l7 + %i5],	%g6
	nop
	set	0x20, %l4
	ldsh	[%l7 + %l4],	%l6
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%g1
	ld	[%l7 + 0x38],	%f29
	nop
	set	0x38, %g6
	ldsw	[%l7 + %g6],	%g3
	nop
	set	0x13, %g5
	stb	%o7,	[%l7 + %g5]
	fpadd32	%f10,	%f4,	%f28
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%o4
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x80,	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%l1
	set	0x28, %i1
	swapa	[%l7 + %i1] 0x80,	%l4
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x88,	%o0
	set	0x16, %o7
	ldstuba	[%l7 + %o7] 0x88,	%g7
	set	0x10, %g1
	sta	%f18,	[%l7 + %g1] 0x88
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%f16
	nop
	set	0x7C, %l2
	ldsb	[%l7 + %l2],	%l0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f0
	set	0x58, %i2
	stxa	%o4,	[%l7 + %i2] 0x88
	wr	%i0,	%o3,	%ccr
	nop
	set	0x48, %g4
	std	%f20,	[%l7 + %g4]
	nop
	set	0x68, %o4
	lduh	[%l7 + %o4],	%i6
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g5
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf0
	membar	#Sync
	set	0x74, %i3
	stwa	%i2,	[%l7 + %i3] 0x80
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%f14
	nop
	set	0x6A, %l5
	ldsh	[%l7 + %l5],	%i5
	set	0x68, %i6
	sta	%f10,	[%l7 + %i6] 0x80
	set	0x60, %l6
	stha	%i4,	[%l7 + %l6] 0x80
	nop
	set	0x22, %g7
	ldsh	[%l7 + %g7],	%i3
	nop
	set	0x50, %l0
	sth	%i1,	[%l7 + %l0]
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%o1
	nop
	set	0x60, %o6
	lduh	[%l7 + %o6],	%l5
	nop
	nop
	setx	0x46340296,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x5561274F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f1,	%f24
	ld	[%l7 + 0x60],	%f17
	nop
	set	0x2E, %l1
	ldsb	[%l7 + %l1],	%g4
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%g2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%g6
	nop
	set	0x6A, %i5
	ldub	[%l7 + %i5],	%o2
	set	0x28, %l4
	stha	%g1,	[%l7 + %l4] 0xea
	membar	#Sync
	fpadd32s	%f10,	%f24,	%f18
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x6C, %g3
	lduw	[%l7 + %g3],	%g3
	wr	%l6,	%o7,	%softint
	nop
	set	0x1C, %g6
	stw	%o6,	[%l7 + %g6]
	set	0x6C, %o5
	sta	%f1,	[%l7 + %o5] 0x80
	set	0x40, %g5
	stda	%o4,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%i7
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%l4
	set	0x4C, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l1
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd2
	nop
	set	0x48, %l2
	std	%f12,	[%l7 + %l2]
	set	0x18, %o0
	swapa	[%l7 + %o0] 0x88,	%o0
	set	0x24, %i2
	stba	%l0,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x09, %g4
	ldsb	[%l7 + %g4],	%o4
	set	0x28, %o1
	lda	[%l7 + %o1] 0x89,	%f0
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%i0
	nop
	set	0x15, %l3
	ldstub	[%l7 + %l3],	%i6
	nop
	set	0x3C, %i0
	stw	%o3,	[%l7 + %i0]
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%g4
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	bne	%icc,	loop_104
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x10, %i7
	swapa	[%l7 + %i7] 0x88,	%i5
loop_104:
	nop
	set	0x59, %l6
	ldstub	[%l7 + %l6],	%i4
	or	%i3,	%i2,	%i1
	and	%o1,	%g4,	%l5
	or	%g2,	%g6,	%o2
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f26
	set	0x64, %g7
	stba	%g1,	[%l7 + %g7] 0x88
	and	%l2,	%l6,	%o7
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f6
	nop
	set	0x10, %l1
	swap	[%l7 + %l1],	%g3
	nop
	set	0x08, %i4
	stb	%o6,	[%l7 + %i4]
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	wr	%i7,	%l4,	%softint
	nop
	set	0x2C, %l4
	prefetch	[%l7 + %l4],	 3
	st	%f7,	[%l7 + 0x1C]
	fpsub32s	%f27,	%f9,	%f7
	nop
	set	0x7A, %o3
	sth	%l1,	[%l7 + %o3]
	bl	%xcc,	loop_105
	fpadd32s	%f8,	%f27,	%f25
	nop
	set	0x5D, %g6
	stb	%g7,	[%l7 + %g6]
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x80,	 4
loop_105:
	nop
	set	0x14, %g3
	stha	%l0,	[%l7 + %g3] 0x81
	set	0x14, %o2
	sta	%f3,	[%l7 + %o2] 0x81
	and	%o4,	%i6,	%o3
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf0
	membar	#Sync
	nop
	set	0x5E, %g5
	ldub	[%l7 + %g5],	%g5
	nop
	set	0x28, %g1
	std	%f30,	[%l7 + %g1]
	or	%i0,	%i5,	%i4
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f30
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%l2
	fpsub32s	%f9,	%f3,	%f6
	or	%i3,	%i1,	%i2
	set	0x4C, %o0
	lda	[%l7 + %o0] 0x81,	%f11
	set	0x2C, %o7
	sta	%f0,	[%l7 + %o7] 0x80
	set	0x20, %i2
	stda	%g4,	[%l7 + %i2] 0x81
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%l5
	set	0x30, %g4
	sta	%f31,	[%l7 + %g4] 0x80
	nop
	set	0x21, %l3
	ldsb	[%l7 + %l3],	%o1
	or	%g2,	%o2,	%g1
	st	%fsr,	[%l7 + 0x28]
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x80,	%g6
	nop
	set	0x30, %i3
	lduw	[%l7 + %i3],	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g3
	nop
	set	0x68, %o4
	ldstub	[%l7 + %o4],	%o7
	set	0x68, %l5
	sta	%f20,	[%l7 + %l5] 0x88
	nop
	set	0x28, %i6
	std	%o6,	[%l7 + %i6]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x4C, %i7
	swap	[%l7 + %i7],	%i7
	add	%o5,	%l1,	%g7
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x50, %l0
	stha	%o0,	[%l7 + %l0] 0xeb
	membar	#Sync
	st	%f2,	[%l7 + 0x28]
	nop
	set	0x3E, %o6
	ldsb	[%l7 + %o6],	%l0
	set	0x6C, %i4
	sta	%f1,	[%l7 + %i4] 0x80
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf0
	membar	#Sync
	st	%f4,	[%l7 + 0x1C]
	nop
	set	0x7C, %l1
	swap	[%l7 + %l1],	%l4
	nop
	set	0x20, %l4
	sth	%o4,	[%l7 + %l4]
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f26
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x80,	%i6
	set	0x40, %g6
	stxa	%o3,	[%l7 + %g6] 0x88
	set	0x41, %g3
	stba	%g5,	[%l7 + %g3] 0x88
	nop
	set	0x26, %o2
	ldsb	[%l7 + %o2],	%i0
	nop
	set	0x5C, %g5
	lduh	[%l7 + %g5],	%i5
	nop
	set	0x10, %g2
	std	%i4,	[%l7 + %g2]
	and	%i3,	%i1,	%l3
	or	%i2,	%g4,	%o1
	bgu,a	%xcc,	loop_106
	add	%l5,	%o2,	%g1
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%g6
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x81,	 3
loop_106:
	nop
	set	0x20, %g1
	stha	%l6,	[%l7 + %g1] 0x80
	nop
	set	0x45, %o0
	stb	%l2,	[%l7 + %o0]
	wr 	%g0, 	0x4, 	%fprs
	add	%g3,	%o5,	%i7
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%l1
	set	0x5C, %o1
	sta	%f5,	[%l7 + %o1] 0x81
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x80,	%o0
	set	0x58, %i2
	stwa	%l0,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x88,	 3
	set	0x40, %l3
	stha	%o4,	[%l7 + %l3] 0x88
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xeb,	%i6
	nop
	set	0x10, %i3
	stx	%l4,	[%l7 + %i3]
	st	%f25,	[%l7 + 0x5C]
	set	0x78, %i6
	stda	%o2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x1C, %l6
	lduw	[%l7 + %l6],	%i0
	nop
	set	0x2E, %i7
	sth	%g5,	[%l7 + %i7]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%i4
	fpadd16s	%f11,	%f1,	%f30
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xda
	nop
	set	0x40, %l0
	stx	%i3,	[%l7 + %l0]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xcc
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	nop
	set	0x70, %l1
	ldsh	[%l7 + %l1],	%i5
	nop
	set	0x18, %i4
	sth	%l3,	[%l7 + %i4]
	nop
	set	0x78, %o3
	std	%i2,	[%l7 + %o3]
	nop
	set	0x48, %o5
	lduh	[%l7 + %o5],	%i1
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%g4
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%l4
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x78, %g3
	std	%f0,	[%l7 + %g3]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%o2
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%g6
	nop
	set	0x08, %g5
	prefetch	[%l7 + %g5],	 4
	and	%g1,	%l6,	%l2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%o6
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x88,	 1
	set	0x44, %i1
	lda	[%l7 + %i1] 0x89,	%f8
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%g2
	set	0x48, %o0
	stxa	%o5,	[%l7 + %o0] 0x89
	nop
	set	0x64, %o1
	lduw	[%l7 + %o1],	%o6
	fpsub32s	%f18,	%f16,	%f0
	set	0x10, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l1
	ld	[%l7 + 0x48],	%f9
	fpsub32s	%f7,	%f19,	%f5
	set	0x58, %i2
	swapa	[%l7 + %i2] 0x81,	%i7
	nop
	set	0x38, %i0
	std	%f0,	[%l7 + %i0]
	and	%l0,	%g7,	%o4
	nop
	set	0x6C, %o4
	swap	[%l7 + %o4],	%o0
	set	0x7C, %i3
	lda	[%l7 + %i3] 0x89,	%f31
	nop
	set	0x3C, %i6
	lduw	[%l7 + %i6],	%i6
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%l4
	set	0x36, %i7
	stba	%o3,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x30, %l5
	stda	%i0,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%i4
	and	%i3,	%i5,	%l3
	set	0x34, %l6
	sta	%f5,	[%l7 + %l6] 0x88
	set	0x29, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i2
	set	0x20, %i5
	sta	%f8,	[%l7 + %i5] 0x80
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%g4
	nop
	set	0x3C, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x88,	%g4
	nop
	set	0x74, %i4
	swap	[%l7 + %i4],	%o1
	add	%l5,	%o2,	%g6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l2
	nop
	set	0x2E, %o3
	ldsh	[%l7 + %o3],	%o7
	nop
	set	0x60, %o5
	lduw	[%l7 + %o5],	%g2
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f16
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%g3
	fpadd16s	%f7,	%f29,	%f31
	set	0x28, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	and	%o6,	%g1,	%i7
	nop
	set	0x6E, %o2
	stb	%l0,	[%l7 + %o2]
	or	%l1,	%o4,	%g7
	nop
	set	0x20, %g5
	std	%i6,	[%l7 + %g5]
	nop
	set	0x3C, %l2
	lduw	[%l7 + %l2],	%o0
	set	0x51, %g2
	ldstuba	[%l7 + %g2] 0x80,	%o3
	nop
	set	0x34, %g1
	stw	%l4,	[%l7 + %g1]
	set	0x08, %i1
	stha	%i0,	[%l7 + %i1] 0x80
	and	%i3,	%i4,	%i5
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%i2
	nop
	set	0x40, %o1
	std	%f16,	[%l7 + %o1]
	set	0x43, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l3
	ld	[%l7 + 0x64],	%f31
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x89,	 4
	set	0x42, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i1
	fpadd16s	%f24,	%f2,	%f1
	nop
	set	0x48, %g4
	std	%f12,	[%l7 + %g4]
	nop
	set	0x28, %o4
	stx	%g5,	[%l7 + %o4]
	nop
	set	0x64, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x58, %i6
	stx	%o1,	[%l7 + %i6]
	nop
	set	0x28, %l3
	stx	%l5,	[%l7 + %l3]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f18
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xeb,	%g6
	nop
	set	0x18, %l5
	ldsw	[%l7 + %l5],	%o2
	add	%l6,	%l2,	%o7
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%g2
	add	%o5,	%o6,	%g3
	set	0x78, %i5
	stxa	%g1,	[%l7 + %i5] 0x81
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%i6
	st	%f13,	[%l7 + 0x78]
	nop
	set	0x50, %l0
	stw	%l0,	[%l7 + %l0]
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	nop
	set	0x76, %o5
	ldsh	[%l7 + %o5],	%l1
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%g6
	nop
	set	0x64, %g6
	stb	%i6,	[%l7 + %g6]
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x48, %o2
	stda	%o0,	[%l7 + %o2] 0x81
	nop
	set	0x22, %g3
	ldsh	[%l7 + %g3],	%o3
	ld	[%l7 + 0x58],	%f25
	nop
	set	0x5C, %l2
	ldsw	[%l7 + %l2],	%l4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf8
	membar	#Sync
	nop
	set	0x08, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x80,	 3
	nop
	set	0x78, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x78, %o1
	stxa	%i0,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x38, %g2
	swapa	[%l7 + %g2] 0x89,	%i3
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%i4
	ld	[%l7 + 0x3C],	%f17
	nop
	set	0x1C, %o7
	stw	%i4,	[%l7 + %o7]
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	add	%i2,	%i1,	%g4
	nop
	set	0x7A, %o4
	ldsh	[%l7 + %o4],	%g5
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%g6
	set	0x40, %i3
	stda	%o2,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x88,	 1
	nop
	set	0x60, %i6
	ldx	[%l7 + %i6],	%l2
	nop
	set	0x60, %i7
	std	%f30,	[%l7 + %i7]
	nop
	set	0x54, %g7
	prefetch	[%l7 + %g7],	 4
	nop
	set	0x27, %l6
	ldstub	[%l7 + %l6],	%l6
	set	0x4C, %i5
	swapa	[%l7 + %i5] 0x81,	%o7
	ld	[%l7 + 0x0C],	%f7
	add	%g2,	%o5,	%o6
	st	%f13,	[%l7 + 0x48]
	fpsub32	%f10,	%f14,	%f18
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%g1
	or	%i7,	%l0,	%g7
	set	0x2D, %l5
	ldstuba	[%l7 + %l5] 0x89,	%l1
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x89,	%o0
	nop
	set	0x36, %i4
	sth	%i6,	[%l7 + %i4]
	set	0x24, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l4
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x88,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%i0
	nop
	set	0x08, %l0
	swap	[%l7 + %l0],	%i5
	nop
	set	0x08, %o3
	ldsw	[%l7 + %o3],	%i3
	fpadd16	%f30,	%f2,	%f18
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f26
	nop
	set	0x6C, %o2
	prefetch	[%l7 + %o2],	 4
	nop
	set	0x3E, %l4
	lduh	[%l7 + %l4],	%i4
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%l3
	nop
	set	0x7E, %g5
	ldsb	[%l7 + %g5],	%i1
	nop
	set	0x54, %g1
	prefetch	[%l7 + %g1],	 0
	wr	%g4,	%g5,	%clear_softint
	nop
	set	0x42, %i1
	ldstub	[%l7 + %i1],	%i2
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x88,	%l5
	set	0x60, %g3
	stxa	%g6,	[%l7 + %g3] 0x88
	set	0x60, %g2
	sta	%f22,	[%l7 + %g2] 0x81
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x89,	 4
	nop
	set	0x26, %o7
	ldstub	[%l7 + %o7],	%l2
	add	%l6,	%o7,	%g2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%o6
	set	0x78, %o1
	stxa	%o1,	[%l7 + %o1] 0x88
	nop
	set	0x48, %o4
	lduh	[%l7 + %o4],	%g1
	nop
	set	0x3F, %g4
	ldub	[%l7 + %g4],	%g3
	nop
	set	0x20, %i0
	std	%l0,	[%l7 + %i0]
	or	%g7,	%i7,	%l1
	nop
	set	0x47, %i3
	ldub	[%l7 + %i3],	%i6
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x81,	%o0
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x48, %g7
	std	%f26,	[%l7 + %g7]
	st	%f22,	[%l7 + 0x44]
	nop
	set	0x24, %l6
	lduh	[%l7 + %l6],	%l4
	nop
	set	0x78, %i5
	ldub	[%l7 + %i5],	%o3
	nop
	set	0x2F, %l5
	ldub	[%l7 + %l5],	%i0
	set	0x50, %i7
	ldda	[%l7 + %i7] 0xe3,	%i4
	nop
	set	0x78, %i4
	stx	%o4,	[%l7 + %i4]
	nop
	set	0x0F, %o6
	stb	%i3,	[%l7 + %o6]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%i4
	set	0x40, %o5
	stwa	%i1,	[%l7 + %o5] 0x80
	st	%f29,	[%l7 + 0x30]
	nop
	set	0x22, %l0
	ldsh	[%l7 + %l0],	%l3
	set	0x68, %g6
	lda	[%l7 + %g6] 0x88,	%f17
	and	%g5,	%i2,	%g4
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x88,	 1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%l2
	nop
	set	0x37, %l2
	stb	%o2,	[%l7 + %l2]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc8
	wr	%o7,	%l6,	%softint
	nop
	set	0x47, %g1
	ldub	[%l7 + %g1],	%o5
	set	0x0C, %g5
	swapa	[%l7 + %g5] 0x88,	%o6
	or	%o1,	%g1,	%g2
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%l0
	nop
	set	0x70, %g3
	stw	%g7,	[%l7 + %g3]
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%i6
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%o0
	nop
	set	0x6C, %o7
	stw	%l4,	[%l7 + %o7]
	nop
	nop
	setx	0x897DE9250BD3385B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8E81FDC65DD3A327,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f26,	%f6
	nop
	set	0x18, %g2
	std	%f6,	[%l7 + %g2]
	set	0x30, %o4
	stxa	%o3,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x14, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i0
	set	0x2C, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g3
	set	0x30, %o1
	stwa	%o4,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%i4
	nop
	set	0x50, %i6
	lduw	[%l7 + %i6],	%i5
	add	%i1,	%g5,	%i2
	set	0x54, %i3
	stwa	%l3,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x78, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%g4
	nop
	set	0x24, %l3
	lduh	[%l7 + %l3],	%l2
	set	0x18, %i5
	swapa	[%l7 + %i5] 0x80,	%o2
	nop
	set	0x55, %l6
	stb	%l5,	[%l7 + %l6]
	nop
	set	0x30, %i7
	ldx	[%l7 + %i7],	%o7
	nop
	set	0x5C, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x1C, %i4
	stwa	%o5,	[%l7 + %i4] 0x89
	nop
	set	0x38, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x44, %o5
	lduw	[%l7 + %o5],	%l6
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	or	%o6,	%o1,	%g1
	set	0x58, %g6
	stwa	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x80,	%g7
	nop
	set	0x58, %o3
	std	%l0,	[%l7 + %o3]
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f20
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x81,	 3
	add	%i7,	%i6,	%l4
	nop
	set	0x50, %g1
	std	%f24,	[%l7 + %g1]
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%o0
	nop
	set	0x2A, %o0
	lduh	[%l7 + %o0],	%i0
	or	%o3,	%o4,	%g3
	nop
	set	0x10, %g3
	lduw	[%l7 + %g3],	%i3
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f0
	nop
	set	0x58, %i2
	stx	%i4,	[%l7 + %i2]
	ld	[%l7 + 0x24],	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i5
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x81,	%g5
	set	0x38, %g2
	prefetcha	[%l7 + %g2] 0x88,	 3
	set	0x38, %o4
	swapa	[%l7 + %o4] 0x88,	%g6
	ld	[%l7 + 0x1C],	%f5
	nop
	set	0x18, %g4
	lduw	[%l7 + %g4],	%g4
	set	0x64, %i0
	stha	%l3,	[%l7 + %i0] 0x89
	st	%f22,	[%l7 + 0x40]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc8
	set	0x65, %i3
	stba	%l2,	[%l7 + %i3] 0xea
	membar	#Sync
	or	%o2,	%o7,	%l5
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%o5
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x89,	 4
	nop
	set	0x48, %i5
	std	%f14,	[%l7 + %i5]
	nop
	set	0x64, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x76, %i7
	ldsb	[%l7 + %i7],	%o1
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x89
	set	0x08, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g1
	set	0x64, %i4
	sta	%f2,	[%l7 + %i4] 0x88
	nop
	set	0x10, %o6
	std	%f6,	[%l7 + %o6]
	fpadd32s	%f24,	%f0,	%f24
	st	%f10,	[%l7 + 0x38]
	set	0x08, %l0
	sta	%f16,	[%l7 + %l0] 0x88
	set	0x79, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g2
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x80,	%g6
	and	%l6,	%l0,	%i7
	set	0x70, %l1
	stxa	%l1,	[%l7 + %l1] 0x88
	nop
	set	0x7C, %l2
	stb	%i6,	[%l7 + %l2]
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x80,	%o0
	add	%l4,	%o3,	%i0
	nop
	set	0x48, %o3
	std	%o4,	[%l7 + %o3]
	st	%f10,	[%l7 + 0x1C]
	set	0x6B, %l4
	stba	%i3,	[%l7 + %l4] 0x80
	set	0x40, %g1
	swapa	[%l7 + %g1] 0x89,	%g3
	and	%i1,	%i4,	%i5
	set	0x20, %g3
	stda	%g4,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x1E, %i1
	lduh	[%l7 + %i1],	%g6
	set	0x46, %i2
	stha	%g4,	[%l7 + %i2] 0x81
	and	%i2,	%l3,	%l2
	nop
	set	0x76, %o7
	lduh	[%l7 + %o7],	%o7
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%l5
	nop
	set	0x09, %o0
	stb	%o2,	[%l7 + %o0]
	set	0x78, %o4
	sta	%f9,	[%l7 + %o4] 0x88
	or	%o5,	%o1,	%o6
	bl	%xcc,	loop_107
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%g0
	set	0x08, %g2
	swapa	[%l7 + %g2] 0x80,	%g7
loop_107:
	nop
	set	0x30, %i0
	stda	%g2,	[%l7 + %i0] 0x81
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	nop
	set	0x5A, %i3
	sth	%l0,	[%l7 + %i3]
	nop
	set	0x42, %l3
	ldsh	[%l7 + %l3],	%i7
	set	0x2C, %i5
	lda	[%l7 + %i5] 0x89,	%f17
	set	0x6C, %l6
	stwa	%l1,	[%l7 + %l6] 0x88
	nop
	set	0x74, %g7
	stw	%i6,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f0
	nop
	set	0x36, %l5
	lduh	[%l7 + %l5],	%o0
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%l6
	and	%o3,	%i0,	%o4
	nop
	set	0x6C, %i4
	stw	%i3,	[%l7 + %i4]
	nop
	set	0x44, %l0
	lduh	[%l7 + %l0],	%g3
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%f28
	nop
	set	0x1D, %g6
	ldsb	[%l7 + %g6],	%i1
	set	0x33, %o5
	stba	%l4,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc0
	fpadd32	%f10,	%f28,	%f26
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%g4
	wr	%i2,	%l3,	%pic
	nop
	set	0x7C, %l1
	sth	%l2,	[%l7 + %l1]
	set	0x08, %o2
	sta	%f23,	[%l7 + %o2] 0x89
	set	0x6A, %l4
	stba	%o7,	[%l7 + %l4] 0x80
	and	%l5,	%g6,	%o2
	nop
	set	0x5C, %g1
	stw	%o1,	[%l7 + %g1]
	nop
	set	0x70, %o3
	stx	%o6,	[%l7 + %o3]
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	bne	%icc,	loop_108
	st	%fsr,	[%l7 + 0x40]
	or	%o5,	%g7,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%l0
loop_108:
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f14
	nop
	set	0x30, %o7
	swap	[%l7 + %o7],	%i6
	nop
	set	0x20, %i1
	lduh	[%l7 + %i1],	%l1
	nop
	set	0x2C, %g5
	lduw	[%l7 + %g5],	%o0
	nop
	set	0x58, %o4
	ldsb	[%l7 + %o4],	%l6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%o3
	nop
	set	0x66, %g4
	ldsb	[%l7 + %g4],	%o4
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%i3
	set	0x68, %i0
	sta	%f5,	[%l7 + %i0] 0x88
	nop
	set	0x48, %g2
	ldx	[%l7 + %g2],	%i1
	nop
	set	0x32, %i3
	lduh	[%l7 + %i3],	%l4
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%g3
	set	0x4A, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i5
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x44, %l6
	stha	%g5,	[%l7 + %l6] 0x81
	nop
	set	0x08, %i6
	std	%i4,	[%l7 + %i6]
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%i2
	set	0x30, %i7
	stda	%g4,	[%l7 + %i7] 0x81
	set	0x6C, %l5
	sta	%f25,	[%l7 + %l5] 0x80
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f30
	nop
	set	0x74, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x40, %g6
	std	%f28,	[%l7 + %g6]
	nop
	set	0x70, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x88
	set	0x23, %l1
	stba	%l2,	[%l7 + %l1] 0xea
	membar	#Sync
	fpadd32s	%f3,	%f1,	%f18
	nop
	set	0x18, %o2
	std	%f22,	[%l7 + %o2]
	set	0x10, %o6
	sta	%f6,	[%l7 + %o6] 0x81
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x44, %g1
	lda	[%l7 + %g1] 0x80,	%f16
	add	%o7,	%l3,	%g6
	nop
	set	0x0C, %g3
	prefetch	[%l7 + %g3],	 0
	or	%o2,	%o1,	%o6
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x80,	 2
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%g1
	nop
	set	0x68, %o3
	stx	%o5,	[%l7 + %o3]
	nop
	set	0x70, %i1
	std	%f26,	[%l7 + %i1]
	set	0x49, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g2
	bn,a	%xcc,	loop_109
	nop
	set	0x18, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x48, %g4
	ldsh	[%l7 + %g4],	%i7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%i6
loop_109:
	nop
	set	0x1A, %i0
	stb	%l0,	[%l7 + %i0]
	st	%f31,	[%l7 + 0x70]
	nop
	set	0x14, %g2
	lduh	[%l7 + %g2],	%l1
	add	%o0,	%l6,	%o3
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%i0
	set	0x60, %o0
	sta	%f3,	[%l7 + %o0] 0x80
	nop
	set	0x20, %i5
	stw	%i3,	[%l7 + %i5]
	or	%i1,	%l4,	%o4
	fpadd16	%f18,	%f20,	%f8
	set	0x64, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i5
	nop
	set	0x34, %l3
	lduw	[%l7 + %l3],	%g5
	set	0x28, %l6
	stwa	%i4,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x88,	%i2
	nop
	set	0x69, %i7
	stb	%g3,	[%l7 + %i7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%l2
	set	0x0D, %g7
	stba	%o7,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x58, %i4
	ldxa	[%l7 + %i4] 0x88,	%g6
	nop
	set	0x28, %l5
	stx	%l3,	[%l7 + %l5]
	wr	%o1,	%o2,	%sys_tick
	set	0x4A, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o6
	nop
	set	0x42, %o5
	ldsh	[%l7 + %o5],	%g1
	or	%l5,	%o5,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%i7
	or	%l0,	%l1,	%i6
	ld	[%l7 + 0x4C],	%f10
	and	%o0,	%l6,	%o3
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%i3
	fpadd32	%f28,	%f6,	%f22
	nop
	set	0x76, %l1
	ldub	[%l7 + %l1],	%i0
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x88,	%l4
	nop
	set	0x67, %g6
	stb	%o4,	[%l7 + %g6]
	set	0x66, %l4
	stba	%i5,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x6A, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g5
	and	%i1,	%i4,	%g3
	add	%g4,	%l2,	%i2
	nop
	set	0x38, %g3
	sth	%o7,	[%l7 + %g3]
	fpadd32s	%f13,	%f20,	%f14
	nop
	set	0x44, %o6
	stw	%l3,	[%l7 + %o6]
	ld	[%l7 + 0x60],	%f12
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%g6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%f0
	nop
	set	0x40, %o3
	ldsh	[%l7 + %o3],	%o2
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x89,	 3
	set	0x6C, %o4
	lda	[%l7 + %o4] 0x88,	%f26
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f8
	set	0x28, %i1
	stba	%g1,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x70, %i0
	stx	%o1,	[%l7 + %i0]
	st	%f21,	[%l7 + 0x1C]
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	set	0x22, %g2
	stha	%l5,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x50, %o0
	swap	[%l7 + %o0],	%g7
	wr	%g2,	%l0,	%clear_softint
	set	0x70, %o1
	lda	[%l7 + %o1] 0x81,	%f0
	nop
	set	0x30, %i5
	stx	%i7,	[%l7 + %i5]
	nop
	set	0x29, %l6
	ldub	[%l7 + %l6],	%i6
	nop
	set	0x48, %i6
	stx	%o0,	[%l7 + %i6]
	nop
	set	0x7E, %l3
	lduh	[%l7 + %l3],	%l1
	nop
	set	0x24, %i7
	stw	%o3,	[%l7 + %i7]
	wr	%l6,	%i3,	%y
	set	0x78, %g7
	stxa	%l4,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%o4,	%i5,	%i0
	set	0x08, %i4
	ldxa	[%l7 + %i4] 0x88,	%g5
	nop
	set	0x33, %l5
	ldub	[%l7 + %l5],	%i1
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xeb,	%g2
	nop
	set	0x38, %o5
	ldsh	[%l7 + %o5],	%i4
	nop
	set	0x28, %l1
	std	%g4,	[%l7 + %l1]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%i2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf8
	membar	#Sync
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xe2,	%o6
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x4C, %l4
	swapa	[%l7 + %l4] 0x80,	%l3
	nop
	set	0x21, %g3
	ldsb	[%l7 + %g3],	%o2
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%g6
	set	0x38, %o7
	lda	[%l7 + %o7] 0x80,	%f19
	nop
	set	0x20, %i2
	stx	%g1,	[%l7 + %i2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%o5
	set	0x28, %g5
	stba	%o1,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x22, %o3
	ldsh	[%l7 + %o3],	%g7
	nop
	set	0x2B, %o4
	ldstub	[%l7 + %o4],	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g2
	ld	[%l7 + 0x3C],	%f27
	st	%f6,	[%l7 + 0x14]
	wr	%i7,	%o0,	%ccr
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f0
	nop
	set	0x7E, %i0
	ldsh	[%l7 + %i0],	%l1
	nop
	set	0x2C, %i1
	ldub	[%l7 + %i1],	%i6
	set	0x4C, %g2
	stwa	%l6,	[%l7 + %g2] 0x81
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%i2
	set	0x20, %i3
	stxa	%l4,	[%l7 + %i3] 0x88
	set	0x68, %i5
	sta	%f21,	[%l7 + %i5] 0x80
	nop
	set	0x0C, %o1
	ldsh	[%l7 + %o1],	%o4
	nop
	set	0x60, %i6
	lduw	[%l7 + %i6],	%o3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%g5
	nop
	set	0x76, %l6
	ldsb	[%l7 + %l6],	%i5
	ba,a,pt	%icc,	loop_110
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x60, %i7
	std	%g2,	[%l7 + %i7]
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
loop_110:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f0
	nop
	set	0x20, %l5
	std	%g4,	[%l7 + %l5]
	set	0x40, %i4
	stxa	%l2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x0C, %o5
	stwa	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x3C, %l1
	swapa	[%l7 + %l1] 0x88,	%i4
	nop
	set	0x0C, %l2
	stw	%o7,	[%l7 + %l2]
	set	0x09, %l0
	stba	%o2,	[%l7 + %l0] 0xeb
	membar	#Sync
	wr	%l3,	%g6,	%set_softint
	nop
	set	0x48, %g6
	ldsh	[%l7 + %g6],	%o6
	set	0x60, %l4
	ldda	[%l7 + %l4] 0x88,	%o4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f16
	nop
	set	0x20, %o2
	ldsw	[%l7 + %o2],	%o1
	nop
	set	0x34, %o6
	stw	%g7,	[%l7 + %o6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%l5
	nop
	set	0x21, %g1
	ldsb	[%l7 + %g1],	%g2
	nop
	set	0x7C, %i2
	swap	[%l7 + %i2],	%l0
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xe3,	%i6
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x80,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l6
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%i6
	nop
	set	0x0A, %o3
	ldub	[%l7 + %o3],	%i3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1265
!	Type a   	: 27
!	Type cti   	: 21
!	Type x   	: 538
!	Type f   	: 43
!	Type i   	: 106
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
	set	0x9,	%g1
	set	0x8,	%g2
	set	0x7,	%g3
	set	0xF,	%g4
	set	0x6,	%g5
	set	0x8,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xA,	%i1
	set	-0x6,	%i2
	set	-0x4,	%i3
	set	-0x1,	%i4
	set	-0xA,	%i5
	set	-0x4,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x39796528,	%l0
	set	0x41F24E82,	%l1
	set	0x2A7659EE,	%l2
	set	0x133109D8,	%l3
	set	0x3535AE1F,	%l4
	set	0x5431D892,	%l5
	set	0x2D4BD487,	%l6
	!# Output registers
	set	0x1C5D,	%o0
	set	0x0010,	%o1
	set	0x1607,	%o2
	set	0x1B90,	%o3
	set	-0x1584,	%o4
	set	-0x00B5,	%o5
	set	0x1EE2,	%o6
	set	0x17FB,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	set	0x20, %g4
	ldda	[%l7 + %g4] 0x80,	%l4
	nop
	set	0x72, %i0
	stb	%o3,	[%l7 + %i0]
	or	%i0,	%o4,	%i5
	set	0x24, %g2
	stha	%g5,	[%l7 + %g2] 0x89
	set	0x7C, %o0
	stwa	%i1,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%g4
	wr	%l2,	%i2,	%y
	nop
	set	0x60, %o1
	swap	[%l7 + %o1],	%i4
	nop
	set	0x50, %i6
	ldsh	[%l7 + %i6],	%o7
	nop
	set	0x18, %i5
	std	%g2,	[%l7 + %i5]
	set	0x58, %l6
	lda	[%l7 + %l6] 0x80,	%f26
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x69, %g7
	ldstuba	[%l7 + %g7] 0x89,	%l3
	nop
	set	0x24, %l5
	lduw	[%l7 + %l5],	%g6
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x81
	nop
	set	0x34, %i7
	swap	[%l7 + %i7],	%o2
	nop
	set	0x28, %o5
	std	%o6,	[%l7 + %o5]
	nop
	set	0x30, %l1
	lduw	[%l7 + %l1],	%o5
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x57, %g6
	ldub	[%l7 + %g6],	%g7
	nop
	set	0x2F, %l4
	ldstub	[%l7 + %l4],	%o1
	nop
	set	0x20, %g3
	std	%l4,	[%l7 + %g3]
	set	0x1C, %o2
	stha	%g2,	[%l7 + %o2] 0x89
	set	0x54, %o6
	sta	%f3,	[%l7 + %o6] 0x88
	st	%f27,	[%l7 + 0x0C]
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	bl,a,pn	%icc,	loop_111
	nop
	set	0x38, %i2
	std	%i6,	[%l7 + %i2]
	nop
	set	0x38, %o7
	std	%l0,	[%l7 + %o7]
	set	0x52, %g5
	stha	%o0,	[%l7 + %g5] 0x89
loop_111:
	nop
	set	0x46, %o4
	stha	%g1,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%l6
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x89,	%o2
	nop
	set	0x52, %i0
	ldsb	[%l7 + %i0],	%l4
	set	0x40, %g2
	stha	%o4,	[%l7 + %g2] 0x89
	set	0x78, %g4
	stxa	%i5,	[%l7 + %g4] 0xe2
	membar	#Sync
	wr	%g5,	%i1,	%set_softint
	set	0x64, %i3
	stwa	%g4,	[%l7 + %i3] 0x80
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i0
	nop
	set	0x24, %i1
	swap	[%l7 + %i1],	%i4
	set	0x38, %o0
	sta	%f15,	[%l7 + %o0] 0x81
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%o7
	set	0x58, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x80,	 4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd2,	%f16
	set	0x68, %i5
	stda	%g6,	[%l7 + %i5] 0x88
	nop
	set	0x40, %l5
	std	%o2,	[%l7 + %l5]
	nop
	set	0x34, %i4
	ldsh	[%l7 + %i4],	%o6
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x88
	nop
	set	0x58, %g7
	swap	[%l7 + %g7],	%o5
	set	0x6C, %o5
	stwa	%l3,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x48, %l1
	stwa	%g7,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%g2
	nop
	set	0x40, %g6
	std	%l4,	[%l7 + %g6]
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%i7
	set	0x38, %l2
	stxa	%l1,	[%l7 + %l2] 0x80
	set	0x30, %o2
	stxa	%o0,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x48, %g3
	stx	%fsr,	[%l7 + %g3]
	st	%f4,	[%l7 + 0x50]
	fpadd32	%f8,	%f4,	%f8
	set	0x20, %l0
	stxa	%l0,	[%l7 + %l0] 0xea
	membar	#Sync
	or	%i6,	%i3,	%l6
	ld	[%l7 + 0x6C],	%f9
	nop
	set	0x60, %o6
	stx	%o3,	[%l7 + %o6]
	or	%l4,	%o4,	%g1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%i1
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f26
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f20
	ld	[%l7 + 0x78],	%f17
	set	0x70, %o7
	stxa	%g5,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x3A, %o4
	ldstub	[%l7 + %o4],	%l2
	set	0x48, %g1
	sta	%f6,	[%l7 + %g1] 0x80
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xda
	nop
	set	0x30, %g2
	stw	%i0,	[%l7 + %g2]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x30, %i1
	stx	%i4,	[%l7 + %i1]
	set	0x24, %o0
	stwa	%g4,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x58, %o1
	stda	%g2,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f30
	ld	[%l7 + 0x60],	%f31
	set	0x35, %l6
	stba	%o7,	[%l7 + %l6] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%g6
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x88,	 2
	and	%o5,	%o2,	%l3
	nop
	set	0x0E, %l5
	ldstub	[%l7 + %l5],	%g7
	set	0x48, %i4
	stxa	%o1,	[%l7 + %i4] 0x89
	set	0x6C, %l3
	lda	[%l7 + %l3] 0x80,	%f9
	nop
	set	0x2D, %i7
	ldsb	[%l7 + %i7],	%g2
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x2F, %g7
	ldstub	[%l7 + %g7],	%l5
	nop
	set	0x60, %l1
	stx	%i7,	[%l7 + %l1]
	nop
	set	0x68, %g6
	stx	%o0,	[%l7 + %g6]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%i6
	nop
	set	0x08, %o5
	std	%f4,	[%l7 + %o5]
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%i3
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%l6
	nop
	set	0x78, %g3
	ldsw	[%l7 + %g3],	%l0
	nop
	set	0x58, %l0
	swap	[%l7 + %l0],	%o3
	nop
	set	0x58, %o2
	stx	%fsr,	[%l7 + %o2]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	nop
	set	0x40, %g5
	std	%o4,	[%l7 + %g5]
	fpsub16s	%f13,	%f29,	%f2
	nop
	set	0x2C, %i2
	ldsw	[%l7 + %i2],	%g1
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf1,	%f16
	st	%f12,	[%l7 + 0x64]
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%i5
	ld	[%l7 + 0x74],	%f7
	bge,pn	%xcc,	loop_112
	st	%f24,	[%l7 + 0x1C]
	nop
	set	0x40, %i0
	ldsh	[%l7 + %i0],	%l4
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i1
loop_112:
	nop
	set	0x3C, %g4
	ldsw	[%l7 + %g4],	%g5
	nop
	set	0x38, %o7
	std	%f14,	[%l7 + %o7]
	nop
	set	0x0E, %i1
	lduh	[%l7 + %i1],	%i0
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l2
	nop
	set	0x51, %o0
	ldub	[%l7 + %o0],	%g4
	set	0x38, %o1
	stda	%i4,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%g3
	set	0x2E, %i6
	stba	%i2,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x30, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x81,	%o6
	set	0x2C, %l3
	lda	[%l7 + %l3] 0x81,	%f31
	st	%fsr,	[%l7 + 0x78]
	and	%o5,	%o2,	%o7
	set	0x50, %i7
	stxa	%g7,	[%l7 + %i7] 0x80
	nop
	set	0x0A, %i4
	sth	%o1,	[%l7 + %i4]
	nop
	set	0x20, %l1
	stw	%l3,	[%l7 + %l1]
	nop
	set	0x51, %g6
	ldstub	[%l7 + %g6],	%l5
	set	0x14, %o5
	lda	[%l7 + %o5] 0x89,	%f13
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%i6
	set	0x1C, %l2
	sta	%f13,	[%l7 + %l2] 0x80
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%g2
	set	0x48, %g3
	stxa	%o0,	[%l7 + %g3] 0xea
	membar	#Sync
	add	%i6,	%i3,	%l1
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x80,	%l0
	nop
	set	0x5E, %l0
	ldub	[%l7 + %l0],	%o3
	set	0x08, %g5
	sta	%f24,	[%l7 + %g5] 0x80
	or	%o4,	%g1,	%i5
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x38, %o4
	std	%f28,	[%l7 + %o4]
	nop
	set	0x1E, %g1
	lduh	[%l7 + %g1],	%l6
	nop
	set	0x70, %o6
	swap	[%l7 + %o6],	%l4
	nop
	set	0x2C, %g2
	swap	[%l7 + %g2],	%g5
	nop
	set	0x40, %g4
	std	%i0,	[%l7 + %g4]
	nop
	set	0x48, %o7
	prefetch	[%l7 + %o7],	 1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%l2
	nop
	set	0x55, %i3
	ldstub	[%l7 + %i3],	%g4
	nop
	set	0x33, %o0
	ldub	[%l7 + %o0],	%i4
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g2
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x88,	 4
	bn,a,pn	%icc,	loop_113
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%g6
	nop
	set	0x40, %i5
	std	%i2,	[%l7 + %i5]
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x80,	%o5
loop_113:
	nop
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x80
	ld	[%l7 + 0x54],	%f1
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x50, %l3
	std	%f30,	[%l7 + %l3]
	set	0x10, %i6
	lda	[%l7 + %i6] 0x88,	%f22
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x28, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xeb,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%l3
	nop
	set	0x74, %i4
	stw	%l5,	[%l7 + %i4]
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%o7
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	ld	[%l7 + 0x50],	%f22
	st	%fsr,	[%l7 + 0x70]
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	nop
	set	0x60, %l2
	stx	%fsr,	[%l7 + %l2]
	st	%f25,	[%l7 + 0x54]
	st	%fsr,	[%l7 + 0x0C]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%g2
	st	%f7,	[%l7 + 0x1C]
	set	0x29, %g3
	ldstuba	[%l7 + %g3] 0x88,	%i6
	set	0x0C, %l4
	stha	%i3,	[%l7 + %l4] 0x88
	set	0x57, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l1
	nop
	set	0x42, %l0
	lduh	[%l7 + %l0],	%l0
	nop
	set	0x70, %i2
	stx	%o3,	[%l7 + %i2]
	nop
	set	0x4A, %o4
	ldsh	[%l7 + %o4],	%g1
	nop
	set	0x58, %g1
	std	%o4,	[%l7 + %g1]
	set	0x2E, %o6
	stha	%l6,	[%l7 + %o6] 0x89
	nop
	set	0x30, %g5
	ldsh	[%l7 + %g5],	%l4
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i5
	set	0x16, %o7
	ldstuba	[%l7 + %o7] 0x89,	%i1
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%l2
	set	0x60, %i1
	swapa	[%l7 + %i1] 0x81,	%g5
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%g4
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x80,	 3
	st	%fsr,	[%l7 + 0x14]
	set	0x5C, %o0
	sta	%f2,	[%l7 + %o0] 0x80
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%i2
	nop
	set	0x2C, %i5
	stw	%o5,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x10, %o3
	std	%g6,	[%l7 + %o3]
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x80,	%o2
	nop
	set	0x3D, %l5
	ldub	[%l7 + %l5],	%g7
	nop
	set	0x24, %i6
	prefetch	[%l7 + %i6],	 1
	or	%o6,	%l3,	%l5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	nop
	set	0x58, %l3
	std	%f18,	[%l7 + %l3]
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%o6
	set	0x60, %l1
	stwa	%o1,	[%l7 + %l1] 0x80
	nop
	set	0x20, %g7
	stx	%o0,	[%l7 + %g7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%i7
	st	%fsr,	[%l7 + 0x0C]
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x80,	 3
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%l1
	set	0x32, %g3
	ldstuba	[%l7 + %g3] 0x81,	%i6
	set	0x70, %l4
	stwa	%o3,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x31, %o2
	ldub	[%l7 + %o2],	%l0
	and	%o4,	%g1,	%l4
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%l6
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%i4
	add	%l2,	%g5,	%g4
	nop
	set	0x08, %i2
	stx	%i1,	[%l7 + %i2]
	set	0x2B, %o4
	stba	%g3,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x68, %o6
	stxa	%i4,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x45, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i2
	nop
	set	0x60, %g2
	std	%i0,	[%l7 + %g2]
	fpsub32	%f18,	%f22,	%f30
	set	0x20, %g5
	stwa	%o5,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f6
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%o2
	set	0x28, %i1
	lda	[%l7 + %i1] 0x80,	%f11
	set	0x44, %i3
	stha	%g7,	[%l7 + %i3] 0x81
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x88,	%o6
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f16
	st	%f20,	[%l7 + 0x70]
	set	0x78, %i5
	sta	%f16,	[%l7 + %i5] 0x88
	set	0x4C, %o1
	lda	[%l7 + %o1] 0x81,	%f20
	nop
	set	0x40, %o3
	stw	%g6,	[%l7 + %o3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%o7
	st	%f5,	[%l7 + 0x74]
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%l3
	set	0x64, %l5
	swapa	[%l7 + %l5] 0x89,	%o1
	set	0x72, %i6
	stha	%g2,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x5A, %l3
	stha	%i7,	[%l7 + %l3] 0x88
	nop
	set	0x7F, %i7
	stb	%i3,	[%l7 + %i7]
	add	%l1,	%o0,	%i6
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f26
	nop
	set	0x50, %g7
	std	%l0,	[%l7 + %g7]
	set	0x08, %g6
	stda	%o4,	[%l7 + %g6] 0x80
	set	0x7C, %l2
	lda	[%l7 + %l2] 0x80,	%f19
	set	0x44, %l1
	swapa	[%l7 + %l1] 0x80,	%g1
	set	0x7F, %g3
	stba	%l4,	[%l7 + %g3] 0x81
	nop
	set	0x28, %o2
	std	%f30,	[%l7 + %o2]
	set	0x6C, %o5
	sta	%f14,	[%l7 + %o5] 0x89
	and	%l6,	%o3,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%g4
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f24
	nop
	set	0x18, %l0
	std	%i4,	[%l7 + %l0]
	or	%g3,	%i1,	%i2
	nop
	set	0x5E, %i2
	sth	%i0,	[%l7 + %i2]
	bge,a,pt	%icc,	loop_114
	and	%i4,	%o5,	%o2
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%f12
	bgu,a	%icc,	loop_115
loop_114:
	nop
	set	0x60, %o6
	ldsh	[%l7 + %o6],	%g7
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x81,	%o6
loop_115:
	nop
	set	0x5C, %g5
	swap	[%l7 + %g5],	%g6
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%l5
	nop
	set	0x24, %g4
	lduw	[%l7 + %g4],	%o7
	set	0x28, %i1
	swapa	[%l7 + %i1] 0x89,	%o1
	set	0x1D, %o7
	stba	%l3,	[%l7 + %o7] 0x80
	nop
	set	0x50, %i3
	stw	%i7,	[%l7 + %i3]
	set	0x5C, %i0
	sta	%f23,	[%l7 + %i0] 0x81
	nop
	set	0x7F, %i5
	ldsb	[%l7 + %i5],	%g2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%i2
	nop
	set	0x40, %o1
	std	%f8,	[%l7 + %o1]
	set	0x60, %o3
	swapa	[%l7 + %o3] 0x88,	%l1
	nop
	set	0x78, %l5
	swap	[%l7 + %l5],	%o0
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x22, %l3
	ldsh	[%l7 + %l3],	%l0
	or	%o4,	%g1,	%i6
	nop
	set	0x2C, %i7
	swap	[%l7 + %i7],	%l6
	nop
	set	0x08, %i6
	stx	%l4,	[%l7 + %i6]
	nop
	set	0x7F, %g7
	ldub	[%l7 + %g7],	%l2
	nop
	set	0x3E, %i4
	ldsh	[%l7 + %i4],	%g5
	nop
	set	0x78, %g6
	stw	%g4,	[%l7 + %g6]
	nop
	set	0x16, %l1
	ldub	[%l7 + %l1],	%o3
	add	%i5,	%i1,	%g3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%i4
	set	0x54, %o2
	swapa	[%l7 + %o2] 0x88,	%i0
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%o2
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%g6
	nop
	set	0x08, %l4
	sth	%o6,	[%l7 + %l4]
	nop
	set	0x78, %l0
	ldsh	[%l7 + %l0],	%o5
	st	%fsr,	[%l7 + 0x1C]
	set	0x2C, %i2
	lda	[%l7 + %i2] 0x88,	%f11
	st	%f22,	[%l7 + 0x38]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	ld	[%l7 + 0x08],	%f12
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%g6
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x80,	%f22
	nop
	set	0x70, %o4
	stb	%o7,	[%l7 + %o4]
	nop
	set	0x0C, %g4
	swap	[%l7 + %g4],	%o1
	nop
	set	0x1C, %g2
	ldsb	[%l7 + %g2],	%l3
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%l5
	set	0x22, %i0
	stha	%l1,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x80
	set	0x40, %o7
	stda	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x54, %o0
	lduw	[%l7 + %o0],	%i3
	nop
	set	0x38, %o3
	std	%f10,	[%l7 + %o3]
	nop
	set	0x08, %o1
	stw	%o4,	[%l7 + %o1]
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%l0
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xe2,	%i6
	nop
	set	0x48, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x14, %l6
	lda	[%l7 + %l6] 0x80,	%f3
	st	%f12,	[%l7 + 0x3C]
	nop
	set	0x5F, %g7
	ldstub	[%l7 + %g7],	%g1
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	bne	%icc,	loop_116
	nop
	set	0x08, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%i6
	set	0x78, %l2
	stxa	%l4,	[%l7 + %l2] 0x89
loop_116:
	nop
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x80,	%l2
	nop
	set	0x0D, %g3
	stb	%g5,	[%l7 + %g3]
	add	%o3,	%i5,	%i1
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f28
	nop
	set	0x3C, %l4
	sth	%g3,	[%l7 + %l4]
	nop
	set	0x50, %l0
	std	%i2,	[%l7 + %l0]
	set	0x78, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g4
	nop
	set	0x44, %o6
	lduh	[%l7 + %o6],	%i0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%g7
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%i4
	set	0x1C, %i2
	lda	[%l7 + %i2] 0x81,	%f4
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f16
	nop
	set	0x20, %g5
	stw	%o5,	[%l7 + %g5]
	nop
	set	0x30, %g2
	std	%g6,	[%l7 + %g2]
	and	%o7,	%o1,	%l3
	set	0x50, %i1
	stwa	%o6,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x54, %i3
	swap	[%l7 + %i3],	%g2
	ble,a	%icc,	loop_117
	or	%l5,	%l1,	%o0
	set	0x4C, %g4
	sta	%f28,	[%l7 + %g4] 0x80
loop_117:
	and	%i7,	%o4,	%l0
	st	%fsr,	[%l7 + 0x14]
	ld	[%l7 + 0x70],	%f1
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f16
	set	0x08, %o7
	stba	%i6,	[%l7 + %o7] 0xe2
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%g1
	nop
	set	0x23, %o0
	ldub	[%l7 + %o0],	%l6
	nop
	set	0x60, %i0
	stx	%l4,	[%l7 + %i0]
	or	%l2,	%g5,	%i5
	set	0x50, %o3
	stwa	%i1,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x78, %o1
	ldsh	[%l7 + %o1],	%g3
	and	%i2,	%g4,	%i0
	nop
	set	0x10, %l5
	swap	[%l7 + %l5],	%o3
	st	%fsr,	[%l7 + 0x50]
	set	0x60, %i7
	stwa	%o2,	[%l7 + %i7] 0x80
	nop
	set	0x14, %l3
	swap	[%l7 + %l3],	%i4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f16
	nop
	set	0x18, %i4
	stw	%g7,	[%l7 + %i4]
	fpadd32	%f14,	%f20,	%f24
	set	0x20, %g7
	stxa	%g6,	[%l7 + %g7] 0xeb
	membar	#Sync
	st	%f15,	[%l7 + 0x10]
	nop
	set	0x6C, %g6
	ldsw	[%l7 + %g6],	%o5
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x89,	 1
	nop
	set	0x18, %o2
	ldsw	[%l7 + %o2],	%l3
	nop
	set	0x3A, %i6
	lduh	[%l7 + %i6],	%o6
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf9
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%l5
	set	0x0C, %l4
	stha	%o1,	[%l7 + %l4] 0x80
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x78, %l0
	swap	[%l7 + %l0],	%i7
	ld	[%l7 + 0x14],	%f16
	nop
	set	0x34, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x4C, %g1
	sth	%l1,	[%l7 + %g1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%l0
	or	%i3,	%i6,	%l6
	ld	[%l7 + 0x5C],	%f26
	nop
	set	0x34, %i2
	lduh	[%l7 + %i2],	%g1
	set	0x10, %o6
	sta	%f22,	[%l7 + %o6] 0x88
	nop
	set	0x78, %o4
	sth	%l4,	[%l7 + %o4]
	set	0x78, %g2
	stda	%g4,	[%l7 + %g2] 0x89
	set	0x10, %i1
	sta	%f15,	[%l7 + %i1] 0x80
	nop
	set	0x32, %i3
	ldub	[%l7 + %i3],	%l2
	nop
	set	0x51, %g4
	ldsb	[%l7 + %g4],	%i5
	nop
	set	0x58, %g5
	ldsb	[%l7 + %g5],	%i1
	set	0x1C, %o7
	swapa	[%l7 + %o7] 0x88,	%g3
	and	%i2,	%g4,	%i0
	nop
	set	0x3E, %o0
	ldsb	[%l7 + %o0],	%o2
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x74, %i0
	ldsw	[%l7 + %i0],	%o3
	nop
	set	0x23, %i5
	stb	%g7,	[%l7 + %i5]
	nop
	set	0x7C, %o1
	ldsw	[%l7 + %o1],	%i4
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%o4
	ld	[%l7 + 0x2C],	%f16
	nop
	set	0x44, %i7
	lduw	[%l7 + %i7],	%g6
	ld	[%l7 + 0x1C],	%f24
	set	0x6C, %o3
	sta	%f9,	[%l7 + %o3] 0x80
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc8
	add	%l3,	%o6,	%g2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%f0
	nop
	set	0x62, %g7
	sth	%l5,	[%l7 + %g7]
	nop
	set	0x32, %g6
	ldub	[%l7 + %g6],	%o1
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f4
	fpadd16s	%f17,	%f1,	%f17
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	ld	[%l7 + 0x3C],	%f27
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x0E, %o2
	ldsh	[%l7 + %o2],	%o7
	st	%f12,	[%l7 + 0x20]
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x89,	%i7
	set	0x70, %l1
	stha	%l1,	[%l7 + %l1] 0xea
	membar	#Sync
	and	%o0,	%l0,	%i3
	set	0x48, %l4
	lda	[%l7 + %l4] 0x88,	%f12
	nop
	set	0x58, %l0
	std	%f26,	[%l7 + %l0]
	or	%i6,	%o4,	%l6
	nop
	set	0x28, %g3
	std	%f16,	[%l7 + %g3]
	or	%g1,	%g5,	%l2
	nop
	set	0x58, %o5
	stx	%fsr,	[%l7 + %o5]
	wr	%l4,	%i5,	%ccr
	set	0x45, %i2
	stba	%g3,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x78, %g1
	lduh	[%l7 + %g1],	%i2
	set	0x50, %o6
	stda	%i0,	[%l7 + %o6] 0x88
	nop
	set	0x78, %o4
	stx	%g4,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x6D, %i1
	stb	%o2,	[%l7 + %i1]
	nop
	set	0x74, %i3
	stw	%i0,	[%l7 + %i3]
	set	0x7C, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o3
	and	%i4,	%g7,	%o5
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%l2
	add	%o6,	%g2,	%l5
	bg,a,pt	%icc,	loop_118
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 4
	st	%f7,	[%l7 + 0x64]
	fpsub16s	%f7,	%f18,	%f16
loop_118:
	nop
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x80,	%o1
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%o7
	nop
	set	0x44, %i0
	stw	%g6,	[%l7 + %i0]
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%l1
	add	%o0,	%i7,	%l0
	nop
	set	0x30, %l5
	stx	%i6,	[%l7 + %l5]
	and	%i3,	%l6,	%g1
	or	%g5,	%l2,	%l4
	nop
	set	0x4A, %o1
	ldsb	[%l7 + %o1],	%i5
	and	%o4,	%g3,	%i2
	nop
	set	0x3C, %o3
	ldsw	[%l7 + %o3],	%g4
	set	0x2E, %l6
	stba	%o2,	[%l7 + %l6] 0xe3
	membar	#Sync
	add	%i0,	%o3,	%i4
	set	0x7D, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g7
	nop
	set	0x0C, %g7
	stw	%i1,	[%l7 + %g7]
	set	0x24, %g6
	stwa	%l3,	[%l7 + %g6] 0x88
	nop
	set	0x14, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x5F, %i4
	ldub	[%l7 + %i4],	%o6
	set	0x24, %l3
	sta	%f1,	[%l7 + %l3] 0x88
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xda
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x89,	 1
	set	0x72, %l1
	stha	%o5,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x78, %l4
	stxa	%l5,	[%l7 + %l4] 0xe2
	membar	#Sync
	and	%o1,	%g6,	%l1
	nop
	set	0x28, %g3
	std	%f4,	[%l7 + %g3]
	ld	[%l7 + 0x5C],	%f16
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%o7
	nop
	set	0x3C, %l0
	swap	[%l7 + %l0],	%i7
	nop
	set	0x4B, %g1
	ldsb	[%l7 + %g1],	%l0
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f4
	nop
	set	0x46, %o4
	ldub	[%l7 + %o4],	%i6
	nop
	set	0x1D, %i1
	ldsb	[%l7 + %i1],	%i3
	st	%f11,	[%l7 + 0x44]
	st	%f28,	[%l7 + 0x0C]
	or	%o0,	%l6,	%g1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	nop
	set	0x27, %i3
	ldstub	[%l7 + %i3],	%g5
	nop
	set	0x44, %g4
	stw	%l2,	[%l7 + %g4]
	nop
	set	0x08, %o7
	lduh	[%l7 + %o7],	%i5
	nop
	set	0x17, %g2
	ldub	[%l7 + %g2],	%o4
	nop
	set	0x5C, %g5
	ldstub	[%l7 + %g5],	%l4
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	or	%g3,	%i2,	%o2
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%i0
	nop
	set	0x14, %i5
	ldsb	[%l7 + %i5],	%o3
	or	%i4,	%g7,	%g4
	set	0x08, %l5
	stwa	%l3,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x52, %o1
	lduh	[%l7 + %o1],	%o6
	add	%i1,	%g2,	%l5
	nop
	set	0x5F, %o3
	stb	%o5,	[%l7 + %o3]
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f2
	nop
	set	0x31, %g7
	ldub	[%l7 + %g7],	%o1
	nop
	set	0x74, %l6
	stb	%l1,	[%l7 + %l6]
	nop
	set	0x40, %l2
	std	%f4,	[%l7 + %l2]
	st	%f26,	[%l7 + 0x24]
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x80,	%g6
	nop
	set	0x74, %g6
	stw	%o7,	[%l7 + %g6]
	nop
	set	0x48, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x78, %l3
	prefetcha	[%l7 + %l3] 0x81,	 4
	add	%i3,	%l0,	%l6
	set	0x38, %i6
	swapa	[%l7 + %i6] 0x81,	%g1
	nop
	set	0x3C, %l4
	stw	%g5,	[%l7 + %l4]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f0
	set	0x78, %l1
	swapa	[%l7 + %l1] 0x81,	%l2
	nop
	set	0x28, %l0
	std	%f30,	[%l7 + %l0]
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%o0
	wr	%o4,	%l4,	%clear_softint
	nop
	set	0x48, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x30, %o6
	ldsb	[%l7 + %o6],	%i5
	nop
	set	0x08, %i1
	std	%f4,	[%l7 + %i1]
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%i2
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%g3
	nop
	set	0x18, %o4
	stx	%i0,	[%l7 + %o4]
	and	%o2,	%i4,	%o3
	and	%g7,	%l3,	%o6
	and	%i1,	%g4,	%l5
	and	%o5,	%o1,	%l1
	set	0x20, %g4
	stxa	%g2,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f20
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f6
	nop
	set	0x53, %o7
	ldstub	[%l7 + %o7],	%g6
	bne,pn	%icc,	loop_119
	or	%i7,	%i6,	%i3
	nop
	set	0x18, %o0
	std	%l0,	[%l7 + %o0]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc8
loop_119:
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%l6
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x60, %o3
	ldstub	[%l7 + %o3],	%g1
	nop
	set	0x34, %o1
	ldsw	[%l7 + %o1],	%o7
	st	%fsr,	[%l7 + 0x60]
	set	0x60, %i7
	sta	%f17,	[%l7 + %i7] 0x80
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x81,	%f18
	set	0x70, %g7
	stwa	%g5,	[%l7 + %g7] 0xe2
	membar	#Sync
	add	%l2,	%o0,	%l4
	nop
	set	0x14, %l2
	lduw	[%l7 + %l2],	%i5
	nop
	set	0x38, %i4
	std	%o4,	[%l7 + %i4]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xea,	%g2
	add	%i0,	%o2,	%i4
	nop
	set	0x08, %o2
	stx	%o3,	[%l7 + %o2]
	set	0x28, %l3
	stda	%g6,	[%l7 + %l3] 0x89
	add	%l3,	%i2,	%o6
	nop
	set	0x5E, %l4
	ldsh	[%l7 + %l4],	%g4
	nop
	set	0x50, %i6
	stx	%i1,	[%l7 + %i6]
	set	0x58, %l1
	stxa	%o5,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x24, %l0
	swapa	[%l7 + %l0] 0x80,	%l5
	nop
	set	0x30, %g3
	lduh	[%l7 + %g3],	%l1
	nop
	set	0x75, %g1
	stb	%g2,	[%l7 + %g1]
	ba,a	%xcc,	loop_120
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f12
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xd8
loop_120:
	nop
	set	0x75, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o1
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%i6
	st	%fsr,	[%l7 + 0x28]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%i3
	nop
	set	0x20, %i2
	stx	%l0,	[%l7 + %i2]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g6
	fpadd32s	%f10,	%f1,	%f28
	nop
	set	0x58, %g2
	stx	%o7,	[%l7 + %g2]
	wr	%g5,	%l2,	%set_softint
	nop
	set	0x2B, %g5
	stb	%o0,	[%l7 + %g5]
	wr 	%g0, 	0x5, 	%fprs
	ld	[%l7 + 0x6C],	%f3
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%o4
	set	0x3E, %o7
	stba	%l4,	[%l7 + %o7] 0xea
	membar	#Sync
	or	%i0,	%o2,	%g3
	nop
	set	0x13, %o0
	ldsb	[%l7 + %o0],	%i4
	st	%f29,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x58]
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xeb,	%o2
	nop
	set	0x5C, %l5
	stw	%l3,	[%l7 + %l5]
	nop
	set	0x7C, %g4
	ldsb	[%l7 + %g4],	%i2
	nop
	set	0x50, %o1
	std	%o6,	[%l7 + %o1]
	nop
	set	0x2A, %o3
	ldsb	[%l7 + %o3],	%g7
	nop
	set	0x40, %i7
	std	%i0,	[%l7 + %i7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%l5
	fpsub32	%f14,	%f20,	%f0
	fpadd32s	%f14,	%f27,	%f18
	set	0x20, %l6
	stxa	%l1,	[%l7 + %l6] 0x88
	nop
	set	0x4F, %g7
	ldub	[%l7 + %g7],	%g2
	nop
	set	0x34, %l2
	stw	%o5,	[%l7 + %l2]
	nop
	set	0x78, %g6
	std	%o0,	[%l7 + %g6]
	st	%f8,	[%l7 + 0x54]
	nop
	set	0x24, %o2
	prefetch	[%l7 + %o2],	 4
	and	%i6,	%i7,	%l0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f0
	bn,a	%xcc,	loop_121
	nop
	set	0x0D, %i4
	ldstub	[%l7 + %i4],	%i3
	nop
	set	0x5C, %l4
	sth	%l6,	[%l7 + %l4]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
loop_121:
	nop
	set	0x36, %l1
	lduh	[%l7 + %l1],	%g6
	set	0x4C, %l0
	lda	[%l7 + %l0] 0x88,	%f6
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%o6
	set	0x48, %g1
	stda	%g4,	[%l7 + %g1] 0x88
	set	0x72, %i1
	stha	%o0,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x56, %o6
	stba	%l2,	[%l7 + %o6] 0x89
	st	%f23,	[%l7 + 0x5C]
	add	%i5,	%o4,	%l4
	nop
	set	0x56, %o5
	sth	%g1,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x24, %i3
	swap	[%l7 + %i3],	%o2
	set	0x7E, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i0
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x34, %g5
	swap	[%l7 + %g5],	%g3
	nop
	set	0x0E, %g2
	ldub	[%l7 + %g2],	%o3
	and	%i4,	%l3,	%i2
	nop
	set	0x58, %o7
	stx	%o6,	[%l7 + %o7]
	set	0x75, %o0
	stba	%i1,	[%l7 + %o0] 0x81
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xeb,	%g6
	nop
	set	0x0C, %i5
	prefetch	[%l7 + %i5],	 4
	add	%l5,	%l1,	%g4
	set	0x09, %g4
	stba	%g2,	[%l7 + %g4] 0xe2
	membar	#Sync
	or	%o1,	%i6,	%i7
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x5F, %o3
	stb	%o5,	[%l7 + %o3]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%i3
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	fpsub32	%f28,	%f18,	%f18
	nop
	set	0x4A, %l6
	ldsh	[%l7 + %l6],	%g6
	set	0x28, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o7
	set	0x30, %i7
	stda	%i6,	[%l7 + %i7] 0x80
	or	%g5,	%o0,	%l2
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x89,	%o4
	nop
	set	0x18, %l2
	swap	[%l7 + %l2],	%l4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	nop
	set	0x7E, %i4
	ldub	[%l7 + %i4],	%i5
	set	0x78, %l3
	stxa	%o2,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x68, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x14, %i6
	swap	[%l7 + %i6],	%i0
	nop
	set	0x38, %l0
	ldstub	[%l7 + %l0],	%g1
	nop
	set	0x6A, %l1
	stb	%g3,	[%l7 + %l1]
	nop
	set	0x18, %g1
	stx	%i4,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x58, %g3
	stw	%l3,	[%l7 + %g3]
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%i2
	set	0x70, %i1
	stda	%o2,	[%l7 + %i1] 0xe3
	membar	#Sync
	add	%i1,	%o6,	%g7
	set	0x48, %i3
	stwa	%l5,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x40, %o5
	stx	%l1,	[%l7 + %o5]
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x89,	%g4
	add	%o1,	%g2,	%i7
	set	0x58, %g5
	stha	%i6,	[%l7 + %g5] 0x89
	and	%o5,	%i3,	%l0
	add	%g6,	%l6,	%o7
	nop
	set	0x48, %g2
	std	%o0,	[%l7 + %g2]
	set	0x50, %o7
	stxa	%l2,	[%l7 + %o7] 0x81
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x80,	%o4
	add	%l4,	%i5,	%o2
	or	%g5,	%i0,	%g3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd8
	nop
	set	0x68, %i5
	sth	%g1,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%i4
	set	0x58, %g4
	stda	%l2,	[%l7 + %g4] 0x88
	set	0x6E, %o1
	stba	%o3,	[%l7 + %o1] 0x88
	ld	[%l7 + 0x54],	%f8
	nop
	set	0x3A, %o3
	ldsh	[%l7 + %o3],	%i2
	bg,a	%icc,	loop_122
	fpsub16s	%f23,	%f0,	%f10
	bgu,a	%icc,	loop_123
	nop
	set	0x7E, %l5
	ldstub	[%l7 + %l5],	%i1
loop_122:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f0
loop_123:
	bn,pt	%xcc,	loop_124
	nop
	set	0x2C, %i7
	lduw	[%l7 + %i7],	%o6
	set	0x61, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l5
loop_124:
	add	%g7,	%g4,	%o1
	st	%f13,	[%l7 + 0x24]
	set	0x40, %l2
	swapa	[%l7 + %l2] 0x89,	%g2
	set	0x7C, %o2
	lda	[%l7 + %o2] 0x80,	%f26
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%l0
	nop
	set	0x2A, %l6
	stb	%i6,	[%l7 + %l6]
	wr	%o5,	%i7,	%pic
	st	%fsr,	[%l7 + 0x54]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%g6
	set	0x48, %l4
	stxa	%l6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x50, %l3
	std	%f4,	[%l7 + %l3]
	nop
	set	0x68, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x7C, %l1
	stwa	%i3,	[%l7 + %l1] 0x89
	nop
	set	0x08, %l0
	std	%o0,	[%l7 + %l0]
	set	0x10, %g1
	stba	%l2,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x32, %o6
	stha	%o4,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x58, %g3
	stx	%o7,	[%l7 + %g3]
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x70, %i3
	std	%i4,	[%l7 + %i3]
	nop
	set	0x50, %o5
	stx	%o2,	[%l7 + %o5]
	set	0x66, %i2
	stba	%l4,	[%l7 + %i2] 0x81
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x89,	%g4
	nop
	set	0x48, %g5
	lduw	[%l7 + %g5],	%i0
	nop
	set	0x70, %o0
	swap	[%l7 + %o0],	%g3
	nop
	nop
	setx	0x93F2A2C6C26C6BFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8C8D3F2C3E4BF305,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f2,	%f26
	set	0x48, %o7
	sta	%f19,	[%l7 + %o7] 0x88
	nop
	set	0x38, %o4
	stx	%g1,	[%l7 + %o4]
	set	0x16, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l3
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x20, %o1
	stx	%o3,	[%l7 + %o1]
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x88,	%i1
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x81,	%i2
	set	0x68, %o3
	stwa	%l5,	[%l7 + %o3] 0x80
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%o6
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%f8
	wr	%g4,	%o1,	%pic
	ld	[%l7 + 0x38],	%f23
	nop
	set	0x08, %l2
	stx	%g7,	[%l7 + %l2]
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%g2
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x30, %i4
	std	%f18,	[%l7 + %i4]
	nop
	set	0x38, %l6
	stw	%l1,	[%l7 + %l6]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f0
	nop
	set	0x28, %l4
	stx	%o5,	[%l7 + %l4]
	nop
	set	0x74, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x6C, %i6
	swap	[%l7 + %i6],	%i6
	set	0x78, %l0
	lda	[%l7 + %l0] 0x81,	%f14
	nop
	set	0x18, %l1
	std	%f14,	[%l7 + %l1]
	nop
	set	0x14, %g1
	stw	%l0,	[%l7 + %g1]
	nop
	set	0x68, %g3
	std	%f30,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x08]
	add	%g6,	%l6,	%i7
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%o0
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%f26
	set	0x30, %o5
	stxa	%i3,	[%l7 + %o5] 0x88
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x89,	 4
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	nop
	setx	0x5C299271,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x9B216FAE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f10,	%f12
	nop
	set	0x54, %i3
	ldub	[%l7 + %i3],	%o4
	wr	%i5,	%o2,	%y
	set	0x74, %o0
	stba	%o7,	[%l7 + %o0] 0x81
	nop
	set	0x18, %o7
	stx	%l4,	[%l7 + %o7]
	nop
	set	0x10, %g5
	std	%g4,	[%l7 + %g5]
	and	%g3,	%i0,	%l3
	nop
	set	0x38, %o4
	std	%i4,	[%l7 + %o4]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f30
	nop
	set	0x08, %o1
	stw	%o3,	[%l7 + %o1]
	set	0x20, %i5
	ldda	[%l7 + %i5] 0xea,	%i0
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x80,	%i2
	nop
	set	0x32, %l5
	lduh	[%l7 + %l5],	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%g4
	nop
	set	0x4A, %o3
	ldsh	[%l7 + %o3],	%o1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%g7
	st	%f31,	[%l7 + 0x18]
	set	0x54, %g7
	lda	[%l7 + %g7] 0x88,	%f1
	nop
	set	0x18, %g6
	stx	%i6,	[%l7 + %g6]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	nop
	set	0x4C, %l2
	stb	%l0,	[%l7 + %l2]
	or	%g6,	%l6,	%o5
	nop
	set	0x49, %l6
	stb	%o0,	[%l7 + %l6]
	nop
	set	0x14, %i4
	prefetch	[%l7 + %i4],	 3
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%l2
	st	%fsr,	[%l7 + 0x08]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%i5
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	nop
	set	0x64, %l3
	ldsw	[%l7 + %l3],	%o7
	set	0x74, %l0
	stba	%l4,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x40, %l1
	lduh	[%l7 + %l1],	%g5
	nop
	set	0x74, %i6
	ldsh	[%l7 + %i6],	%o2
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x38, %g3
	stx	%i0,	[%l7 + %g3]
	set	0x10, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l3
	nop
	set	0x61, %o6
	ldstub	[%l7 + %o6],	%g3
	or	%o3,	%i1,	%i2
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x81,	%i4
	nop
	set	0x36, %i2
	ldub	[%l7 + %i2],	%l5
	nop
	set	0x18, %i1
	std	%o6,	[%l7 + %i1]
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xe3,	%g4
	nop
	set	0x30, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x7E, %o7
	lduh	[%l7 + %o7],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%l1
	st	%f30,	[%l7 + 0x30]
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x80,	%g7
	wr	%i6,	%o1,	%sys_tick
	nop
	set	0x16, %o4
	sth	%l0,	[%l7 + %o4]
	fpadd32s	%f22,	%f21,	%f6
	set	0x2E, %g4
	stba	%g6,	[%l7 + %g4] 0x80
	set	0x45, %o0
	stba	%o5,	[%l7 + %o0] 0x81
	set	0x10, %o1
	sta	%f3,	[%l7 + %o1] 0x89
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f26
	ld	[%l7 + 0x28],	%f3
	set	0x40, %l5
	stda	%i6,	[%l7 + %l5] 0x80
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x88,	 2
	set	0x70, %i5
	sta	%f27,	[%l7 + %i5] 0x81
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x88
	nop
	set	0x28, %g6
	std	%i2,	[%l7 + %g6]
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x3A, %i7
	ldsb	[%l7 + %i7],	%o4
	ld	[%l7 + 0x70],	%f14
	nop
	set	0x28, %l6
	std	%l2,	[%l7 + %l6]
	nop
	set	0x50, %o2
	sth	%i5,	[%l7 + %o2]
	fpsub16	%f16,	%f6,	%f20
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x81,	 4
	nop
	set	0x6E, %l3
	lduh	[%l7 + %l3],	%o7
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f30
	add	%l4,	%g5,	%o2
	or	%i0,	%l3,	%o3
	fpadd16	%f16,	%f10,	%f10
	nop
	set	0x0C, %l0
	ldub	[%l7 + %l0],	%g3
	set	0x38, %l1
	sta	%f0,	[%l7 + %l1] 0x81
	add	%i2,	%i1,	%i4
	nop
	set	0x14, %i6
	lduw	[%l7 + %i6],	%l5
	or	%o6,	%g1,	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%g2
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd2
	nop
	set	0x20, %o6
	lduw	[%l7 + %o6],	%i6
	ld	[%l7 + 0x18],	%f1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd0
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o1
	set	0x48, %i2
	stwa	%l0,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%g6
	set	0x16, %g2
	stha	%o5,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x88,	%o0
	set	0x58, %i1
	stxa	%i3,	[%l7 + %i1] 0x89
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f8
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f16
	and	%l6,	%o4,	%i5
	set	0x7C, %o4
	stba	%l2,	[%l7 + %o4] 0x89
	wr	%o7,	%l4,	%clear_softint
	nop
	set	0x34, %o0
	ldsw	[%l7 + %o0],	%g5
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%i6
	set	0x20, %o1
	stxa	%i0,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x80,	%l3
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x89,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%o2
	and	%i1,	%i4,	%l5
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%o6
	set	0x30, %o3
	sta	%f4,	[%l7 + %o3] 0x81
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%i2
	nop
	set	0x74, %l2
	stb	%g1,	[%l7 + %l2]
	fpsub16	%f0,	%f28,	%f24
	nop
	set	0x56, %g7
	lduh	[%l7 + %g7],	%l1
	nop
	set	0x38, %l6
	std	%g2,	[%l7 + %l6]
	or	%g4,	%i6,	%l0
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 2
	st	%f8,	[%l7 + 0x28]
	nop
	nop
	setx	0xF167E993FF017141,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6BEB7A2AE0E48FF1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f6
	set	0x7C, %i7
	lda	[%l7 + %i7] 0x88,	%f5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f0
	set	0x74, %i4
	sta	%f4,	[%l7 + %i4] 0x81
	or	%g7,	%g6,	%o1
	nop
	set	0x20, %l3
	ldsw	[%l7 + %l3],	%o5
	set	0x20, %l1
	sta	%f12,	[%l7 + %l1] 0x81
	nop
	set	0x6C, %l0
	stw	%i3,	[%l7 + %l0]
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%l6
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%o4
	nop
	set	0x0C, %o5
	ldsb	[%l7 + %o5],	%i5
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%o0
	nop
	set	0x20, %i2
	std	%o6,	[%l7 + %i2]
	fpsub32	%f12,	%f22,	%f4
	nop
	set	0x40, %g1
	ldsb	[%l7 + %g1],	%l4
	set	0x28, %g2
	stda	%l2,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x48, %i1
	ldsw	[%l7 + %i1],	%i7
	nop
	set	0x4D, %g5
	ldstub	[%l7 + %g5],	%g5
	set	0x50, %o7
	swapa	[%l7 + %o7] 0x89,	%i0
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%l3
	wr	%o3,	%g3,	%pic
	st	%f4,	[%l7 + 0x38]
	and	%o2,	%i4,	%l5
	nop
	set	0x38, %o0
	lduw	[%l7 + %o0],	%i1
	add	%i2,	%o6,	%g1
	ld	[%l7 + 0x44],	%f13
	nop
	set	0x40, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x24, %o1
	stb	%l1,	[%l7 + %o1]
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%g2
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xd2
	set	0x70, %l5
	lda	[%l7 + %l5] 0x81,	%f25
	nop
	set	0x50, %o3
	std	%f4,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%i6
	nop
	set	0x44, %l2
	ldsh	[%l7 + %l2],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x38, %g7
	std	%f20,	[%l7 + %g7]
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xea,	%g6
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x10, %l6
	std	%o4,	[%l7 + %l6]
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x80,	%i3
	set	0x20, %i7
	sta	%f16,	[%l7 + %i7] 0x89
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%i6
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x89,	%o4
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f30
	nop
	set	0x78, %i6
	stx	%i5,	[%l7 + %i6]
	set	0x64, %l1
	lda	[%l7 + %l1] 0x89,	%f28
	set	0x64, %o6
	sta	%f14,	[%l7 + %o6] 0x89
	st	%fsr,	[%l7 + 0x6C]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA07, 	%tick_cmpr
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x88,	%l4
	set	0x72, %i2
	stha	%l2,	[%l7 + %i2] 0x81
	or	%i7,	%g5,	%i0
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x89,	%o7
	nop
	set	0x0A, %g2
	sth	%o3,	[%l7 + %g2]
	nop
	set	0x2E, %g1
	lduh	[%l7 + %g1],	%l3
	nop
	set	0x10, %g5
	ldsh	[%l7 + %g5],	%o2
	nop
	set	0x48, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%i4
	set	0x1A, %o7
	stha	%l5,	[%l7 + %o7] 0x81
	nop
	set	0x6E, %o0
	sth	%g3,	[%l7 + %o0]
	set	0x78, %o1
	lda	[%l7 + %o1] 0x88,	%f1
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x80,	 4
	nop
	set	0x1F, %i3
	stb	%o6,	[%l7 + %i3]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l1
	set	0x3F, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i2
	nop
	set	0x70, %o3
	ldsh	[%l7 + %o3],	%i6
	nop
	set	0x15, %i5
	ldsb	[%l7 + %i5],	%l0
	nop
	set	0x58, %l2
	stw	%g2,	[%l7 + %l2]
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%g4
	nop
	set	0x68, %g6
	ldub	[%l7 + %g6],	%g7
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xe3,	%g6
	nop
	set	0x54, %l6
	lduw	[%l7 + %l6],	%o5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f0
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x88,	%i3
	nop
	set	0x5C, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f22
	set	0x70, %l0
	stda	%i4,	[%l7 + %l0] 0xea
	membar	#Sync
	and	%o1,	%o4,	%o0
	nop
	nop
	setx	0xB3BD1EE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x2D4D6B25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f1,	%f28
	nop
	set	0x28, %i6
	stx	%l2,	[%l7 + %i6]
	nop
	set	0x0A, %l1
	sth	%l4,	[%l7 + %l1]
	set	0x0C, %o5
	stwa	%g5,	[%l7 + %o5] 0x80
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x81,	%i7
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%i0
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%o3
	set	0x70, %g1
	sta	%f22,	[%l7 + %g1] 0x81
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%o6
	fpadd32s	%f0,	%f19,	%f3
	nop
	set	0x10, %g2
	stw	%l3,	[%l7 + %g2]
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%o2
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%l5
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%g3
	set	0x40, %o0
	stwa	%i4,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	nop
	set	0x40, %i0
	std	%f2,	[%l7 + %i0]
	nop
	set	0x20, %i3
	std	%i0,	[%l7 + %i3]
	ld	[%l7 + 0x3C],	%f11
	nop
	set	0x58, %g4
	swap	[%l7 + %g4],	%g1
	and	%l1,	%i2,	%i6
	nop
	set	0x14, %i5
	ldsb	[%l7 + %i5],	%o6
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%l0
	nop
	set	0x38, %l5
	lduh	[%l7 + %l5],	%g2
	set	0x40, %o3
	sta	%f11,	[%l7 + %o3] 0x89
	nop
	set	0x54, %g6
	ldsh	[%l7 + %g6],	%g4
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xeb,	%g6
	nop
	set	0x56, %l4
	sth	%g6,	[%l7 + %l4]
	nop
	set	0x1A, %g7
	ldsh	[%l7 + %g7],	%o5
	nop
	set	0x70, %o2
	std	%f24,	[%l7 + %o2]
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%i2
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x89,	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o1
	set	0x68, %l0
	stxa	%o0,	[%l7 + %l0] 0x81
	st	%f15,	[%l7 + 0x54]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f16
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%l2,	%l4,	%o4
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%i0
	set	0x5B, %o5
	ldstuba	[%l7 + %o5] 0x80,	%i7
	nop
	set	0x08, %i2
	std	%o6,	[%l7 + %i2]
	wr	%o3,	%o2,	%y
	and	%l3,	%g3,	%i4
	fpsub16	%f24,	%f0,	%f26
	bgu,a,pn	%icc,	loop_125
	add	%l5,	%g1,	%l1
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc0
loop_125:
	bne,a,pn	%icc,	loop_126
	nop
	set	0x4C, %g1
	stw	%i2,	[%l7 + %g1]
	set	0x70, %o6
	lda	[%l7 + %o6] 0x80,	%f16
loop_126:
	nop
	set	0x1C, %g5
	ldsw	[%l7 + %g5],	%i6
	nop
	set	0x54, %o4
	ldsh	[%l7 + %o4],	%i1
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%o6
	nop
	set	0x50, %o7
	std	%g2,	[%l7 + %o7]
	set	0x20, %o0
	stha	%l0,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x10, %i1
	sth	%g4,	[%l7 + %i1]
	or	%g7,	%g6,	%o5
	st	%f12,	[%l7 + 0x2C]
	nop
	set	0x76, %i0
	lduh	[%l7 + %i0],	%i5
	or	%i3,	%l6,	%o1
	or	%o0,	%l2,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5BB, 	%sys_tick_cmpr
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6BF, 	%tick_cmpr
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xe2,	%o6
	nop
	set	0x3C, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x66, %g4
	stba	%o3,	[%l7 + %g4] 0xeb
	membar	#Sync
	fpadd32s	%f21,	%f25,	%f18
	set	0x2A, %i5
	stha	%l3,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i4
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x89,	%o2
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x48, %g6
	stx	%l5,	[%l7 + %g6]
	bge	%icc,	loop_127
	or	%l1,	%i2,	%g1
	nop
	set	0x2A, %l2
	ldstub	[%l7 + %l2],	%i1
	set	0x48, %l6
	stda	%i6,	[%l7 + %l6] 0x88
loop_127:
	nop
	set	0x4C, %l4
	prefetch	[%l7 + %l4],	 1
	set	0x3C, %o2
	lda	[%l7 + %o2] 0x89,	%f7
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x80,	 2
	set	0x4E, %g7
	stha	%o6,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x58, %l0
	sth	%l0,	[%l7 + %l0]
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%g7
	set	0x2D, %i6
	stba	%g4,	[%l7 + %i6] 0x81
	add	%o5,	%i5,	%g6
	nop
	set	0x64, %i7
	stw	%l6,	[%l7 + %i7]
	nop
	set	0x74, %o5
	swap	[%l7 + %o5],	%o1
	nop
	set	0x2A, %i2
	ldsh	[%l7 + %i2],	%i3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	nop
	set	0x32, %g1
	ldub	[%l7 + %g1],	%l2
	st	%f17,	[%l7 + 0x78]
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%l4
	nop
	set	0x78, %g5
	prefetch	[%l7 + %g5],	 0
	set	0x5C, %o4
	lda	[%l7 + %o4] 0x89,	%f20
	nop
	set	0x28, %o6
	std	%f20,	[%l7 + %o6]
	nop
	set	0x71, %o7
	ldsb	[%l7 + %o7],	%g5
	nop
	set	0x70, %g2
	stx	%i0,	[%l7 + %g2]
	nop
	set	0x48, %o0
	stx	%o4,	[%l7 + %o0]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xea,	%i6
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%o7
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x80,	%o0
	set	0x38, %i3
	sta	%f27,	[%l7 + %i3] 0x89
	add	%l3,	%g3,	%i4
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f30
	nop
	set	0x76, %i5
	ldsh	[%l7 + %i5],	%o3
	or	%o2,	%l1,	%l5
	nop
	set	0x64, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x29, %l5
	stb	%g1,	[%l7 + %l5]
	nop
	set	0x5E, %l2
	ldstub	[%l7 + %l2],	%i2
	set	0x18, %l6
	stda	%i6,	[%l7 + %l6] 0x88
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc2
	nop
	set	0x1F, %l4
	ldstub	[%l7 + %l4],	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%g4
	nop
	set	0x38, %i4
	ldsh	[%l7 + %i4],	%o6
	st	%fsr,	[%l7 + 0x08]
	set	0x64, %o2
	swapa	[%l7 + %o2] 0x89,	%o5
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f16
	st	%f28,	[%l7 + 0x64]
	or	%i5,	%g6,	%l6
	nop
	set	0x70, %g7
	std	%i2,	[%l7 + %g7]
	nop
	set	0x68, %l3
	ldstub	[%l7 + %l3],	%l2
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%l4
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f14
	ld	[%l7 + 0x30],	%f22
	set	0x51, %i7
	stba	%g5,	[%l7 + %i7] 0x89
	st	%fsr,	[%l7 + 0x10]
	set	0x22, %g3
	stha	%o1,	[%l7 + %g3] 0x80
	set	0x70, %g1
	sta	%f27,	[%l7 + %g1] 0x88
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f16
	st	%f14,	[%l7 + 0x48]
	wr	%i0,	%i7,	%y
	set	0x6E, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f16
	set	0x16, %o4
	stha	%o0,	[%l7 + %o4] 0x88
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x76, %g2
	sth	%o7,	[%l7 + %g2]
	nop
	set	0x30, %o0
	ldsb	[%l7 + %o0],	%l3
	set	0x71, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i4
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%o3
	nop
	set	0x7A, %i1
	lduh	[%l7 + %i1],	%o2
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x81,	%l0
	set	0x54, %i5
	stha	%l5,	[%l7 + %i5] 0x81
	nop
	set	0x6C, %i3
	lduw	[%l7 + %i3],	%i2
	nop
	set	0x20, %l5
	ldsw	[%l7 + %l5],	%g1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%i1
	nop
	set	0x30, %o3
	std	%f6,	[%l7 + %o3]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x28, %g6
	ldsh	[%l7 + %g6],	%g2
	nop
	set	0x20, %l2
	stx	%g7,	[%l7 + %l2]
	add	%g4,	%l0,	%o5
	set	0x14, %i4
	swapa	[%l7 + %i4] 0x81,	%i5
	set	0x70, %o2
	stxa	%o6,	[%l7 + %o2] 0x81
	or	%l6,	%g6,	%i3
	wr	%l2,	%g5,	%clear_softint
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x81,	%l4
	nop
	set	0x3C, %l0
	lduh	[%l7 + %l0],	%i0
	nop
	set	0x3C, %g7
	ldstub	[%l7 + %g7],	%i7
	set	0x3E, %l3
	ldstuba	[%l7 + %l3] 0x80,	%o1
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xe3,	%o4
	nop
	set	0x20, %o5
	std	%o0,	[%l7 + %o5]
	fpsub16	%f8,	%f4,	%f20
	set	0x18, %g3
	stha	%o7,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	nop
	setx	0x49DF7B216C64ADDA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x67AB9B132B19A24C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f8,	%f24
	nop
	set	0x16, %i7
	lduh	[%l7 + %i7],	%i4
	nop
	set	0x10, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x22, %g1
	ldsh	[%l7 + %g1],	%g3
	or	%o3,	%o2,	%l3
	bge	%icc,	loop_128
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%l0
	nop
	set	0x18, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x80,	%l5
loop_128:
	nop
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%i1
	st	%fsr,	[%l7 + 0x64]
	set	0x28, %g2
	stxa	%g2,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x50, %o0
	stda	%g6,	[%l7 + %o0] 0x81
	nop
	set	0x2B, %i0
	ldub	[%l7 + %i0],	%i6
	set	0x78, %g5
	lda	[%l7 + %g5] 0x80,	%f26
	nop
	set	0x3A, %i1
	sth	%g4,	[%l7 + %i1]
	nop
	set	0x28, %o1
	swap	[%l7 + %o1],	%l0
	nop
	set	0x12, %i5
	sth	%i5,	[%l7 + %i5]
	set	0x78, %i3
	prefetcha	[%l7 + %i3] 0x81,	 3
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x44, %g4
	stb	%g6,	[%l7 + %g4]
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%i3
	nop
	set	0x6E, %g6
	lduh	[%l7 + %g6],	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%l2
	nop
	set	0x40, %o3
	std	%f22,	[%l7 + %o3]
	set	0x53, %l2
	stba	%i0,	[%l7 + %l2] 0x89
	set	0x24, %o2
	swapa	[%l7 + %o2] 0x81,	%l4
	wr	%i7,	%o1,	%set_softint
	ld	[%l7 + 0x20],	%f11
	ld	[%l7 + 0x54],	%f12
	nop
	set	0x18, %l4
	stw	%o0,	[%l7 + %l4]
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%o4
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%i4
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xe3,	%o6
	set	0x78, %i6
	stxa	%g3,	[%l7 + %i6] 0xe2
	membar	#Sync
	add	%o2,	%o3,	%l1
	add	%l3,	%g1,	%i2
	and	%i1,	%g2,	%l5
	set	0x64, %g7
	stha	%i6,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x7C, %o5
	ldsh	[%l7 + %o5],	%g7
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f24
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x89,	%g4
	wr	%i5,	%l0,	%pic
	nop
	set	0x49, %g1
	ldsb	[%l7 + %g1],	%l6
	fpsub16	%f10,	%f24,	%f6
	nop
	set	0x54, %i2
	stw	%g6,	[%l7 + %i2]
	ld	[%l7 + 0x18],	%f23
	set	0x64, %o6
	stwa	%i3,	[%l7 + %o6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x28, %l1
	ldsw	[%l7 + %l1],	%o5
	nop
	set	0x14, %o7
	lduh	[%l7 + %o7],	%o6
	set	0x48, %o4
	swapa	[%l7 + %o4] 0x88,	%l2
	set	0x08, %o0
	prefetcha	[%l7 + %o0] 0x81,	 2
	set	0x3E, %g2
	stha	%l4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%i6
	nop
	set	0x10, %i1
	sth	%o1,	[%l7 + %i1]
	bge,a	%xcc,	loop_129
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%i0
	set	0x32, %g5
	stha	%o0,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_129:
	or	%o4,	%o7,	%g3
	nop
	set	0x54, %i3
	sth	%o2,	[%l7 + %i3]
	set	0x58, %i5
	stxa	%i4,	[%l7 + %i5] 0x88
	nop
	set	0x10, %g4
	ldsb	[%l7 + %g4],	%l1
	nop
	set	0x4F, %l5
	ldstub	[%l7 + %l5],	%o3
	or	%l3,	%i2,	%i1
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc8
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	nop
	set	0x68, %l6
	std	%g2,	[%l7 + %l6]
	ld	[%l7 + 0x34],	%f8
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x88,	%l5
	set	0x28, %l2
	ldstuba	[%l7 + %l2] 0x88,	%i6
	set	0x10, %l0
	sta	%f10,	[%l7 + %l0] 0x88
	set	0x20, %i4
	swapa	[%l7 + %i4] 0x88,	%g4
	set	0x2A, %l4
	stba	%i5,	[%l7 + %l4] 0x88
	nop
	set	0x08, %i6
	ldsh	[%l7 + %i6],	%g7
	nop
	set	0x78, %l3
	lduw	[%l7 + %l3],	%l0
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x81,	%l6
	nop
	set	0x54, %g3
	ldstub	[%l7 + %g3],	%g6
	or	%o5,	%o6,	%i3
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	nop
	set	0x08, %g1
	stx	%l2,	[%l7 + %g1]
	nop
	set	0x70, %i7
	lduh	[%l7 + %i7],	%g5
	set	0x6D, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l4
	nop
	set	0x30, %i2
	stw	%i7,	[%l7 + %i2]
	add	%i0,	%o0,	%o4
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%o7
	set	0x58, %o4
	lda	[%l7 + %o4] 0x89,	%f1
	set	0x44, %o7
	stwa	%o1,	[%l7 + %o7] 0x88
	nop
	set	0x34, %g2
	lduw	[%l7 + %g2],	%o2
	set	0x7E, %i0
	stba	%i4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x6C, %o0
	sta	%f25,	[%l7 + %o0] 0x88
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%g3
	set	0x52, %o1
	stba	%l1,	[%l7 + %o1] 0x80
	nop
	set	0x24, %i3
	lduh	[%l7 + %i3],	%o3
	set	0x42, %g5
	stha	%l3,	[%l7 + %g5] 0x80
	set	0x30, %g4
	stha	%i1,	[%l7 + %g4] 0x80
	nop
	set	0x30, %i5
	swap	[%l7 + %i5],	%i2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x80,	%g2
	add	%l5,	%g1,	%g4
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x80,	%i6
	nop
	set	0x58, %g6
	std	%f10,	[%l7 + %g6]
	nop
	set	0x3C, %l6
	ldsb	[%l7 + %l6],	%i5
	nop
	set	0x48, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%l0
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%l6
	set	0x68, %i4
	stha	%g7,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x08, %i6
	lda	[%l7 + %i6] 0x88,	%f29
	nop
	set	0x60, %l4
	std	%f28,	[%l7 + %l4]
	set	0x2F, %g7
	stba	%g6,	[%l7 + %g7] 0x80
	ld	[%l7 + 0x3C],	%f6
	and	%o6,	%i3,	%l2
	add	%g5,	%l4,	%o5
	set	0x6E, %l3
	stba	%i0,	[%l7 + %l3] 0x80
	nop
	set	0x76, %g3
	sth	%i7,	[%l7 + %g3]
	nop
	set	0x10, %g1
	stw	%o4,	[%l7 + %g1]
	nop
	set	0x4A, %o5
	stb	%o0,	[%l7 + %o5]
	set	0x6C, %o6
	lda	[%l7 + %o6] 0x88,	%f18
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i4
	nop
	set	0x1B, %i7
	ldub	[%l7 + %i7],	%g3
	set	0x70, %i2
	stwa	%o3,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x0A, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l1
	fpsub16s	%f17,	%f31,	%f2
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%l2
	set	0x08, %g2
	swapa	[%l7 + %g2] 0x81,	%i2
	or	%i1,	%g2,	%g1
	nop
	set	0x16, %o4
	sth	%g4,	[%l7 + %o4]
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%i6
	nop
	set	0x18, %i0
	stx	%i5,	[%l7 + %i0]
	set	0x20, %i1
	lda	[%l7 + %i1] 0x89,	%f23
	set	0x1A, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l5
	and	%l0,	%l6,	%g7
	nop
	set	0x20, %g5
	ldsh	[%l7 + %g5],	%o6
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%i3
	or	%g6,	%l2,	%l4
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%g5
	set	0x10, %l5
	sta	%f2,	[%l7 + %l5] 0x88
	or	%i0,	%i7,	%o4
	nop
	set	0x76, %i5
	ldsb	[%l7 + %i5],	%o0
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x74, %o3
	lduw	[%l7 + %o3],	%o5
	nop
	set	0x34, %l6
	ldsw	[%l7 + %l6],	%o7
	set	0x08, %l0
	stxa	%o1,	[%l7 + %l0] 0x89
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%i4
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x88,	%o2
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%o2
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%l1
	nop
	set	0x48, %g7
	std	%l2,	[%l7 + %g7]
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x81,	%g3
	nop
	set	0x78, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x43, %o2
	ldub	[%l7 + %o2],	%i2
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xcc
	nop
	set	0x78, %o5
	stw	%i1,	[%l7 + %o5]
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%g2
	st	%f25,	[%l7 + 0x08]
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x80,	 2
	add	%g1,	%i6,	%i5
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l5
	set	0x64, %o7
	lda	[%l7 + %o7] 0x88,	%f31
	nop
	set	0x14, %l1
	ldsh	[%l7 + %l1],	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o6
	and	%i3,	%g7,	%l2
	nop
	set	0x4E, %o4
	ldsh	[%l7 + %o4],	%g6
	fpadd16	%f10,	%f28,	%f4
	set	0x1C, %o0
	stwa	%l4,	[%l7 + %o0] 0xe2
	membar	#Sync
	add	%i0,	%g5,	%o4
	nop
	set	0x51, %g2
	ldub	[%l7 + %g2],	%o0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xcc
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%o5
	be,pt	%xcc,	loop_130
	nop
	set	0x60, %i3
	ldsw	[%l7 + %i3],	%o1
	wr	%i4,	%o7,	%set_softint
	nop
	set	0x70, %i0
	stx	%o3,	[%l7 + %i0]
loop_130:
	ld	[%l7 + 0x08],	%f14
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%l1
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x89,	%l3
	and	%g3,	%i2,	%i1
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f10
	nop
	set	0x30, %o1
	ldsw	[%l7 + %o1],	%g2
	set	0x26, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g4
	nop
	set	0x72, %l5
	sth	%g1,	[%l7 + %l5]
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f28
	nop
	set	0x48, %g6
	ldx	[%l7 + %g6],	%i5
	set	0x14, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f16
	set	0x3C, %l0
	lda	[%l7 + %l0] 0x80,	%f27
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x88,	%l0
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x81,	%l5
	nop
	set	0x58, %l4
	lduh	[%l7 + %l4],	%o6
	set	0x68, %l3
	stda	%i2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x33, %g7
	ldub	[%l7 + %g7],	%g7
	or	%l2,	%g6,	%l6
	nop
	set	0x34, %o2
	prefetch	[%l7 + %o2],	 3
	wr	%i0,	%g5,	%softint
	nop
	set	0x08, %g3
	std	%f24,	[%l7 + %g3]
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%l4
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xe3,	%o0
	nop
	set	0x6C, %g1
	swap	[%l7 + %g1],	%o4
	st	%f31,	[%l7 + 0x28]
	nop
	set	0x58, %o6
	stw	%o5,	[%l7 + %o6]
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%o1
	add	%i4,	%o7,	%i7
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%o3
	fpadd32s	%f7,	%f30,	%f8
	nop
	set	0x16, %o4
	ldub	[%l7 + %o4],	%l1
	set	0x61, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o2
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%g3
	set	0x12, %i1
	stha	%i2,	[%l7 + %i1] 0xea
	membar	#Sync
	and	%i1,	%l3,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%g1
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	nop
	set	0x08, %i3
	std	%f22,	[%l7 + %i3]
	set	0x58, %i0
	lda	[%l7 + %i0] 0x88,	%f25
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f16
	set	0x2F, %o1
	stba	%l0,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x48, %i5
	stxa	%i5,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x68, %g5
	std	%o6,	[%l7 + %g5]
	nop
	set	0x54, %l5
	sth	%l5,	[%l7 + %l5]
	nop
	set	0x22, %g6
	sth	%g7,	[%l7 + %g6]
	st	%f14,	[%l7 + 0x34]
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%l2
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x80,	%i3
	bleu,pn	%icc,	loop_131
	wr	%l6,	%g6,	%y
	nop
	set	0x70, %l2
	std	%g4,	[%l7 + %l2]
	nop
	set	0x4C, %l0
	lduh	[%l7 + %l0],	%i0
loop_131:
	nop
	set	0x08, %i4
	stx	%l4,	[%l7 + %i4]
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x38, %i6
	stxa	%o4,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xe3,	%o0
	nop
	set	0x2A, %o2
	ldstub	[%l7 + %o2],	%o1
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%f30
	nop
	set	0x68, %g3
	lduh	[%l7 + %g3],	%i4
	nop
	set	0x76, %i7
	lduh	[%l7 + %i7],	%o5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xcc
	set	0x2B, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i7
	set	0x6C, %o6
	sta	%f31,	[%l7 + %o6] 0x89
	set	0x72, %o7
	stha	%o7,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd2,	%f0
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%o3
	nop
	set	0x48, %g2
	stx	%o2,	[%l7 + %g2]
	nop
	set	0x6E, %i1
	sth	%g3,	[%l7 + %i1]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc0
	or	%i2,	%l1,	%i1
	or	%g4,	%l3,	%g2
	or	%g1,	%i6,	%l0
	nop
	nop
	setx	0x4415E60BA2DDCF2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD4058AFFCE7245D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l5
	nop
	set	0x12, %i3
	sth	%i5,	[%l7 + %i3]
	set	0x68, %i0
	lda	[%l7 + %i0] 0x80,	%f11
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%l2
	nop
	set	0x74, %i5
	swap	[%l7 + %i5],	%i3
	nop
	set	0x64, %g5
	ldsw	[%l7 + %g5],	%g7
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f0
	set	0x10, %g6
	stwa	%l6,	[%l7 + %g6] 0x81
	set	0x78, %g4
	stxa	%g6,	[%l7 + %g4] 0x89
	and	%i0,	%l4,	%o4
	add	%o0,	%g5,	%o1
	nop
	set	0x59, %o3
	stb	%i4,	[%l7 + %o3]
	nop
	set	0x32, %l2
	ldsh	[%l7 + %l2],	%i7
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%o4
	set	0x2E, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o7
	set	0x38, %i6
	stba	%o3,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x4C, %g7
	swapa	[%l7 + %g7] 0x88,	%g3
	nop
	set	0x6C, %l6
	lduw	[%l7 + %l6],	%o2
	st	%f29,	[%l7 + 0x28]
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%i2
	st	%f1,	[%l7 + 0x68]
	set	0x2D, %g3
	stba	%l1,	[%l7 + %g3] 0x88
	ld	[%l7 + 0x40],	%f30
	nop
	set	0x26, %i7
	lduh	[%l7 + %i7],	%i1
	nop
	set	0x42, %l3
	stb	%g4,	[%l7 + %l3]
	nop
	set	0x78, %o5
	ldsw	[%l7 + %o5],	%g2
	and	%l3,	%g1,	%i6
	bge,pn	%icc,	loop_132
	nop
	set	0x38, %o6
	std	%f4,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%l5
loop_132:
	nop
	set	0x68, %o7
	lduw	[%l7 + %o7],	%o6
	set	0x6F, %g1
	stba	%i5,	[%l7 + %g1] 0x81
	nop
	set	0x1C, %l1
	stw	%i3,	[%l7 + %l1]
	nop
	set	0x64, %o4
	lduh	[%l7 + %o4],	%g7
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc8
	nop
	set	0x58, %i1
	std	%f12,	[%l7 + %i1]
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%l2
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xcc
	set	0x32, %i3
	stha	%l6,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%g6
	nop
	set	0x1C, %i5
	lduh	[%l7 + %i5],	%i0
	set	0x44, %i0
	swapa	[%l7 + %i0] 0x88,	%o4
	set	0x10, %g5
	stha	%o0,	[%l7 + %g5] 0x80
	set	0x45, %l5
	ldstuba	[%l7 + %l5] 0x89,	%l4
	set	0x08, %g6
	stxa	%o1,	[%l7 + %g6] 0x89
	and	%i4,	%i7,	%o5
	nop
	set	0x50, %g4
	std	%f16,	[%l7 + %g4]
	set	0x58, %o3
	stda	%g4,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x58, %l2
	swapa	[%l7 + %l2] 0x88,	%o7
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd8
	nop
	set	0x18, %l0
	ldub	[%l7 + %l0],	%g3
	set	0x20, %l4
	sta	%f7,	[%l7 + %l4] 0x88
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x80,	 2
	set	0x58, %g7
	stxa	%o2,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x6F, %l6
	ldsb	[%l7 + %l6],	%l1
	set	0x5C, %g3
	lda	[%l7 + %g3] 0x88,	%f11
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	st	%f29,	[%l7 + 0x48]
	set	0x4C, %l3
	lda	[%l7 + %l3] 0x80,	%f23
	st	%f21,	[%l7 + 0x14]
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%i2
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x88,	 1
	set	0x38, %g1
	stxa	%g4,	[%l7 + %g1] 0x88
	set	0x18, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g2
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%g0
	nop
	set	0x6C, %g2
	sth	%i6,	[%l7 + %g2]
	set	0x41, %o6
	stba	%l3,	[%l7 + %o6] 0x89
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf9
	membar	#Sync
	nop
	set	0x68, %i1
	stx	%l5,	[%l7 + %i1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%o6
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%i3
	wr	%l6,	%l2,	%set_softint
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%o4
	nop
	set	0x1C, %i3
	ldsw	[%l7 + %i3],	%o0
	set	0x31, %o1
	ldstuba	[%l7 + %o1] 0x88,	%l4
	and	%o1,	%i0,	%i4
	set	0x35, %i0
	stba	%i7,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f22
	set	0x14, %g5
	lda	[%l7 + %g5] 0x88,	%f13
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%g5
	st	%fsr,	[%l7 + 0x08]
	bn,a,pn	%icc,	loop_133
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%o7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%g3
loop_133:
	or	%o2,	%l1,	%o3
	or	%i1,	%g4,	%g2
	set	0x38, %o3
	stwa	%i2,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xeb,	%g0
	set	0x6D, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l3
	wr	%l5,	%i6,	%clear_softint
	set	0x68, %l0
	stxa	%l0,	[%l7 + %l0] 0x81
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf1
	membar	#Sync
	and	%i5,	%g7,	%i3
	nop
	set	0x48, %g4
	stx	%o6,	[%l7 + %g4]
	nop
	set	0x26, %i6
	ldsh	[%l7 + %i6],	%l6
	st	%f10,	[%l7 + 0x38]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xda
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 2
	fpadd16s	%f0,	%f21,	%f17
	set	0x78, %o2
	swapa	[%l7 + %o2] 0x80,	%g6
	set	0x7C, %l3
	swapa	[%l7 + %l3] 0x89,	%o4
	nop
	set	0x6C, %o5
	lduw	[%l7 + %o5],	%o0
	nop
	set	0x28, %i7
	std	%l4,	[%l7 + %i7]
	nop
	set	0x32, %o7
	ldstub	[%l7 + %o7],	%l2
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%i0
	fpsub16	%f12,	%f24,	%f30
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	nop
	set	0x76, %o4
	ldstub	[%l7 + %o4],	%i7
	nop
	set	0x69, %l1
	stb	%g5,	[%l7 + %l1]
	nop
	set	0x1E, %g2
	lduh	[%l7 + %g2],	%o7
	set	0x6C, %o0
	lda	[%l7 + %o0] 0x81,	%f15
	set	0x70, %i1
	stxa	%o1,	[%l7 + %i1] 0x81
	set	0x6E, %o6
	stba	%g3,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x38, %i2
	stw	%o2,	[%l7 + %i2]
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f28
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f26
	nop
	set	0x20, %i5
	lduh	[%l7 + %i5],	%o5
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%l0
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%o3
	nop
	set	0x54, %i0
	swap	[%l7 + %i0],	%g4
	nop
	set	0x6A, %o3
	stb	%g2,	[%l7 + %o3]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%l3
	st	%fsr,	[%l7 + 0x44]
	set	0x68, %l0
	stda	%g0,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%l0
	set	0x38, %l4
	stda	%l4,	[%l7 + %l4] 0x80
	nop
	set	0x54, %i6
	prefetch	[%l7 + %i6],	 1
	nop
	set	0x60, %g4
	sth	%g7,	[%l7 + %g4]
	nop
	set	0x44, %g7
	ldsw	[%l7 + %g7],	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%l6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%g6
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x81,	%o4
	set	0x40, %l3
	stda	%o6,	[%l7 + %l3] 0x88
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%o0
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%l2
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%i0
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
	set	0x40, %o4
	stba	%i4,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x6D, %g1
	ldsb	[%l7 + %g1],	%i7
	nop
	nop
	setx	0x9A320965,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x83EA5134,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f9,	%f15
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%l4
	nop
	set	0x6F, %o0
	ldub	[%l7 + %o0],	%g5
	set	0x44, %l1
	stha	%o1,	[%l7 + %l1] 0xeb
	membar	#Sync
	st	%f7,	[%l7 + 0x44]
	nop
	set	0x68, %o6
	std	%o6,	[%l7 + %o6]
	set	, %i2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1273
!	Type a   	: 27
!	Type cti   	: 23
!	Type x   	: 518
!	Type f   	: 33
!	Type i   	: 126
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
	set	0x9,	%g1
	set	0x0,	%g2
	set	0x5,	%g3
	set	0x8,	%g4
	set	0x1,	%g5
	set	0xD,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x2,	%i1
	set	-0x8,	%i2
	set	-0x1,	%i3
	set	-0xB,	%i4
	set	-0xE,	%i5
	set	-0xC,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x5C11527E,	%l0
	set	0x3099EF50,	%l1
	set	0x79E24927,	%l2
	set	0x002F5045,	%l3
	set	0x5881A28F,	%l4
	set	0x2A1B652F,	%l5
	set	0x003CBF22,	%l6
	!# Output registers
	set	-0x0F3B,	%o0
	set	-0x0D3C,	%o1
	set	0x1168,	%o2
	set	0x0D66,	%o3
	set	0x14D1,	%o4
	set	-0x06F8,	%o5
	set	0x1D32,	%o6
	set	-0x04F7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%o2
	wr	%g3,	%o5,	%ccr
	st	%f2,	[%l7 + 0x64]
	nop
	set	0x70, %o1
	sth	%o3,	[%l7 + %o1]
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%l0
	nop
	set	0x7A, %i5
	sth	%g4,	[%l7 + %i5]
	set	0x6D, %g5
	stba	%i1,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x5C, %l5
	lduw	[%l7 + %l5],	%g2
	nop
	nop
	setx	0x631F6988,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x154546F0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f23,	%f6
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x88,	%l3
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f10
	set	0x20, %l2
	stda	%g0,	[%l7 + %l2] 0x88
	ble	%icc,	loop_134
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%i6
	nop
	set	0x40, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x34, %l4
	ldsw	[%l7 + %l4],	%i2
loop_134:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%l0
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x81,	%g6
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x81,	%l5
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f6
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x81,	 1
	and	%l6,	%i5,	%g6
	set	0x08, %o7
	stxa	%o6,	[%l7 + %o7] 0x80
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%o4
	nop
	set	0x38, %g7
	lduh	[%l7 + %g7],	%l2
	set	0x6C, %g3
	lda	[%l7 + %g3] 0x89,	%f21
	nop
	set	0x70, %g1
	std	%i0,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x50]
	wr	%o0,	%i7,	%y
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x88,	%l4
	set	0x2C, %o4
	sta	%f13,	[%l7 + %o4] 0x89
	ld	[%l7 + 0x38],	%f11
	nop
	set	0x28, %l1
	stx	%g5,	[%l7 + %l1]
	set	0x74, %o0
	stwa	%o1,	[%l7 + %o0] 0xe2
	membar	#Sync
	ld	[%l7 + 0x48],	%f18
	set	0x60, %i2
	stha	%i4,	[%l7 + %i2] 0x80
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x74, %o1
	ldub	[%l7 + %o1],	%o7
	nop
	set	0x27, %i3
	ldstub	[%l7 + %i3],	%g3
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x10, %o6
	std	%f10,	[%l7 + %o6]
	set	0x58, %g5
	stwa	%o2,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x60, %l5
	sta	%f29,	[%l7 + %l5] 0x80
	ld	[%l7 + 0x1C],	%f22
	ld	[%l7 + 0x3C],	%f10
	add	%o3,	%l1,	%o5
	set	0x22, %o3
	stha	%g4,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x30, %l2
	ldda	[%l7 + %l2] 0xea,	%i0
	nop
	set	0x30, %i0
	stb	%l3,	[%l7 + %i0]
	ld	[%l7 + 0x68],	%f11
	nop
	set	0x0C, %g6
	ldstub	[%l7 + %g6],	%g2
	nop
	set	0x5A, %i4
	ldstub	[%l7 + %i4],	%i6
	nop
	set	0x54, %l4
	stw	%g1,	[%l7 + %l4]
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xe3,	%l0
	nop
	set	0x64, %l0
	swap	[%l7 + %l0],	%i2
	add	%l5,	%g7,	%i3
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xeb,	%i6
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%g6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%i5
	nop
	set	0x5C, %l3
	stw	%l2,	[%l7 + %l3]
	set	0x1C, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i0
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x1C, %o5
	ldub	[%l7 + %o5],	%o4
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%o0
	set	0x48, %l6
	stwa	%i7,	[%l7 + %l6] 0x89
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%l4
	nop
	set	0x34, %g1
	ldub	[%l7 + %g1],	%o1
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xea,	%i4
	st	%f17,	[%l7 + 0x48]
	nop
	set	0x78, %o4
	std	%f28,	[%l7 + %o4]
	nop
	set	0x64, %l1
	stb	%o7,	[%l7 + %l1]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%g3
	st	%f0,	[%l7 + 0x20]
	st	%fsr,	[%l7 + 0x40]
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x89,	%o2
	set	0x37, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l1
	fpsub16s	%f11,	%f0,	%f19
	nop
	set	0x73, %o1
	ldub	[%l7 + %o1],	%o3
	nop
	set	0x49, %i3
	ldsb	[%l7 + %i3],	%o5
	nop
	set	0x28, %i2
	std	%f26,	[%l7 + %i2]
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%g4
	nop
	set	0x64, %i5
	lduw	[%l7 + %i5],	%l3
	set	0x7C, %l5
	sta	%f9,	[%l7 + %l5] 0x88
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%g2
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%i6
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f16
	nop
	set	0x1C, %g6
	lduh	[%l7 + %g6],	%g1
	st	%fsr,	[%l7 + 0x60]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd2
	set	0x68, %l4
	stba	%l0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x6E, %g4
	stha	%i1,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x81,	 2
	set	0x40, %o2
	stha	%l5,	[%l7 + %o2] 0x80
	set	0x38, %i6
	sta	%f10,	[%l7 + %i6] 0x88
	nop
	set	0x1A, %l2
	ldstub	[%l7 + %l2],	%g7
	nop
	set	0x22, %l3
	stb	%l6,	[%l7 + %l3]
	nop
	set	0x5C, %i7
	sth	%g6,	[%l7 + %i7]
	nop
	set	0x20, %o5
	stw	%o6,	[%l7 + %o5]
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x80,	%i5
	set	0x08, %o7
	lda	[%l7 + %o7] 0x80,	%f12
	set	0x64, %l6
	stha	%l2,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x71, %g3
	stb	%i0,	[%l7 + %g3]
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%o4
	set	0x15, %o4
	stba	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x18, %g2
	stb	%i3,	[%l7 + %g2]
	nop
	set	0x5D, %l1
	ldsb	[%l7 + %l1],	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x238, 	%sys_tick_cmpr
	set	0x79, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o7
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x88
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x60, %i2
	sta	%f9,	[%l7 + %i2] 0x81
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x81,	%g4
	add	%i4,	%g3,	%l1
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x5C, %l5
	swap	[%l7 + %l5],	%o2
	nop
	set	0x70, %o1
	lduw	[%l7 + %o1],	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%l3
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x24, %o3
	lduw	[%l7 + %o3],	%g2
	set	0x08, %i0
	stda	%i6,	[%l7 + %i0] 0x80
	nop
	set	0x50, %i4
	stx	%g1,	[%l7 + %i4]
	fpsub32s	%f10,	%f26,	%f29
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf9
	membar	#Sync
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f10
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc8
	ld	[%l7 + 0x24],	%f20
	nop
	set	0x76, %o2
	sth	%l0,	[%l7 + %o2]
	nop
	set	0x50, %g4
	stw	%i1,	[%l7 + %g4]
	ld	[%l7 + 0x14],	%f23
	set	0x50, %i6
	ldda	[%l7 + %i6] 0xeb,	%o2
	nop
	set	0x78, %l3
	std	%f16,	[%l7 + %l3]
	set	0x3C, %l2
	stba	%i2,	[%l7 + %l2] 0x89
	set	0x1C, %i7
	swapa	[%l7 + %i7] 0x88,	%g7
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%l5
	ld	[%l7 + 0x60],	%f3
	set	0x46, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o6
	set	0x5E, %o7
	ldstuba	[%l7 + %o7] 0x89,	%i5
	nop
	set	0x0C, %g3
	lduw	[%l7 + %g3],	%l2
	st	%f13,	[%l7 + 0x34]
	nop
	set	0x08, %g1
	std	%f20,	[%l7 + %g1]
	set	0x4C, %o4
	swapa	[%l7 + %o4] 0x89,	%i0
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc8
	or	%o4,	%o0,	%i3
	set	0x10, %g2
	stwa	%l4,	[%l7 + %g2] 0x80
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xcc
	nop
	set	0x34, %l1
	ldsh	[%l7 + %l1],	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%o7
	nop
	set	0x74, %o0
	lduh	[%l7 + %o0],	%i4
	nop
	set	0x1E, %i2
	ldub	[%l7 + %i2],	%g5
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%g2
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf0
	membar	#Sync
	nop
	set	0x75, %l5
	stb	%l1,	[%l7 + %l5]
	set	0x7C, %o1
	stha	%o5,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x34, %i5
	lduh	[%l7 + %i5],	%o2
	set	0x6C, %o3
	stwa	%l3,	[%l7 + %o3] 0x88
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%g4
	and	%g2,	%g1,	%l0
	st	%f11,	[%l7 + 0x0C]
	set	0x70, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i6
	ld	[%l7 + 0x28],	%f8
	set	0x78, %l4
	swapa	[%l7 + %l4] 0x81,	%i1
	wr	%i2,	%g7,	%clear_softint
	nop
	set	0x34, %g6
	stw	%o3,	[%l7 + %g6]
	nop
	set	0x32, %i4
	sth	%l6,	[%l7 + %i4]
	nop
	set	0x28, %o2
	ldsw	[%l7 + %o2],	%l5
	bgu	%icc,	loop_135
	st	%f13,	[%l7 + 0x70]
	nop
	set	0x18, %g4
	sth	%o6,	[%l7 + %g4]
	nop
	set	0x58, %i6
	lduh	[%l7 + %i6],	%g6
loop_135:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x24, %l3
	stwa	%o4,	[%l7 + %l3] 0x80
	set	0x1C, %l2
	stba	%l2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x78, %l0
	stx	%i3,	[%l7 + %l0]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x70, %i7
	ldsw	[%l7 + %i7],	%i7
	nop
	set	0x42, %g7
	ldsh	[%l7 + %g7],	%l4
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%o7
	set	0x70, %g1
	stda	%o0,	[%l7 + %g1] 0x88
	nop
	set	0x1A, %g3
	lduh	[%l7 + %g3],	%i4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	nop
	set	0x48, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%g3,	%g5,	%l1
	set	0x14, %i1
	sta	%f16,	[%l7 + %i1] 0x81
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xc8
	nop
	set	0x2A, %o0
	lduh	[%l7 + %o0],	%o5
	nop
	set	0x72, %o4
	lduh	[%l7 + %o4],	%l3
	ld	[%l7 + 0x18],	%f30
	bn,a,pt	%icc,	loop_136
	nop
	set	0x44, %i2
	lduh	[%l7 + %i2],	%o2
	nop
	set	0x18, %i3
	std	%f24,	[%l7 + %i3]
	set	0x28, %o6
	swapa	[%l7 + %o6] 0x80,	%g2
loop_136:
	nop
	set	0x14, %o1
	lda	[%l7 + %o1] 0x81,	%f12
	ld	[%l7 + 0x40],	%f21
	set	0x74, %i5
	stwa	%g1,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%l0,	%g4,	%i1
	set	0x6C, %o3
	stwa	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x4A, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i6
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x89,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%l5
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%o6
	set	0x08, %l4
	lda	[%l7 + %l4] 0x89,	%f28
	fpsub16s	%f29,	%f27,	%f7
	nop
	set	0x24, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o3
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x88,	%f28
	nop
	set	0x14, %i6
	ldsh	[%l7 + %i6],	%i5
	bn,pn	%icc,	loop_137
	nop
	set	0x0C, %o2
	lduh	[%l7 + %o2],	%g6
	nop
	set	0x48, %l3
	swap	[%l7 + %l3],	%o4
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f26
loop_137:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%l2
	set	0x08, %o5
	sta	%f15,	[%l7 + %o5] 0x89
	st	%f19,	[%l7 + 0x20]
	fpsub16	%f6,	%f0,	%f30
	nop
	set	0x28, %i7
	std	%f8,	[%l7 + %i7]
	nop
	set	0x11, %l0
	stb	%o0,	[%l7 + %l0]
	nop
	set	0x0C, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x58, %g1
	stx	%i3,	[%l7 + %g1]
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x58, %l6
	stx	%i7,	[%l7 + %l6]
	set	0x58, %g2
	swapa	[%l7 + %g2] 0x80,	%o7
	nop
	set	0x62, %i1
	stb	%i4,	[%l7 + %i1]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xda
	nop
	set	0x34, %l1
	lduw	[%l7 + %l1],	%o1
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	nop
	set	0x34, %i2
	ldsw	[%l7 + %i2],	%g5
	set	0x3F, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g3
	nop
	set	0x70, %o4
	swap	[%l7 + %o4],	%o5
	nop
	set	0x78, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x10, %i5
	std	%l0,	[%l7 + %i5]
	add	%o2,	%l3,	%g2
	nop
	set	0x42, %o1
	lduh	[%l7 + %o1],	%g1
	nop
	set	0x5C, %o3
	ldub	[%l7 + %o3],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i2
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%i6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x48, %l5
	stx	%g7,	[%l7 + %l5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%l5
	nop
	set	0x15, %l4
	stb	%o6,	[%l7 + %l4]
	nop
	set	0x0C, %g6
	lduh	[%l7 + %g6],	%l6
	nop
	set	0x28, %g5
	std	%f18,	[%l7 + %g5]
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f14
	nop
	set	0x20, %i6
	std	%f16,	[%l7 + %i6]
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f12
	set	0x50, %i4
	ldda	[%l7 + %i4] 0xea,	%i4
	nop
	set	0x16, %l2
	ldsh	[%l7 + %l2],	%o3
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x30, %o5
	swap	[%l7 + %o5],	%g6
	nop
	set	0x1E, %l0
	stb	%o4,	[%l7 + %l0]
	nop
	set	0x58, %i7
	stw	%i0,	[%l7 + %i7]
	ld	[%l7 + 0x10],	%f15
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%i3
	set	0x34, %o7
	stwa	%l4,	[%l7 + %o7] 0x89
	set	0x15, %g1
	stba	%i7,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x70, %g3
	swap	[%l7 + %g3],	%l2
	nop
	set	0x74, %g2
	stw	%o7,	[%l7 + %g2]
	set	0x54, %l6
	sta	%f30,	[%l7 + %l6] 0x80
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%i4
	set	0x68, %l1
	stxa	%o1,	[%l7 + %l1] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x0A, %i1
	ldsb	[%l7 + %i1],	%g5
	nop
	set	0x3C, %o0
	lduw	[%l7 + %o0],	%o5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%o2
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x6E, %i2
	sth	%g3,	[%l7 + %i2]
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%g2
	ld	[%l7 + 0x44],	%f11
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xda
	nop
	set	0x28, %o4
	std	%f26,	[%l7 + %o4]
	nop
	set	0x38, %o1
	ldsw	[%l7 + %o1],	%l3
	add	%l0,	%g4,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%i2
	set	0x62, %i5
	stha	%g7,	[%l7 + %i5] 0x88
	st	%f31,	[%l7 + 0x40]
	add	%l5,	%o6,	%i1
	ld	[%l7 + 0x54],	%f4
	nop
	set	0x40, %i0
	swap	[%l7 + %i0],	%l6
	be,pn	%icc,	loop_138
	fpsub16s	%f17,	%f5,	%f7
	nop
	set	0x0C, %l5
	ldsh	[%l7 + %l5],	%o3
	nop
	set	0x76, %o3
	sth	%i5,	[%l7 + %o3]
loop_138:
	nop
	set	0x5C, %l4
	swap	[%l7 + %l4],	%o4
	wr	%g6,	%i0,	%set_softint
	fpadd16	%f0,	%f24,	%f8
	set	0x0C, %g6
	sta	%f22,	[%l7 + %g6] 0x80
	add	%o0,	%l4,	%i3
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x74, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x7A, %g5
	lduh	[%l7 + %g5],	%l2
	set	0x08, %o2
	stba	%o7,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x7A, %i6
	ldsb	[%l7 + %i6],	%i7
	nop
	set	0x60, %l2
	prefetch	[%l7 + %l2],	 2
	or	%o1,	%i4,	%o5
	set	0x2C, %i4
	stba	%l1,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x60, %o5
	stxa	%o2,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x33, %l3
	ldsb	[%l7 + %l3],	%g5
	nop
	set	0x33, %i7
	ldsb	[%l7 + %i7],	%g3
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x81,	%g2
	nop
	set	0x28, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x89,	%l3
	nop
	set	0x2E, %g3
	ldsh	[%l7 + %g3],	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%i6
	nop
	set	0x66, %l6
	lduh	[%l7 + %l6],	%g1
	nop
	set	0x68, %g2
	stx	%g7,	[%l7 + %g2]
	set	0x48, %l1
	stwa	%l5,	[%l7 + %l1] 0x88
	set	0x09, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o6
	nop
	set	0x38, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x28, %o0
	lda	[%l7 + %o0] 0x81,	%f12
	nop
	set	0x68, %i2
	ldx	[%l7 + %i2],	%i1
	nop
	set	0x18, %o6
	swap	[%l7 + %o6],	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o3
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%o4
	set	0x54, %o4
	lda	[%l7 + %o4] 0x81,	%f1
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x68, %o1
	stwa	%g6,	[%l7 + %o1] 0x80
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x81,	 4
	set	0x35, %l5
	ldstuba	[%l7 + %l5] 0x80,	%i0
	set	0x7A, %l4
	stha	%l4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%o0
	set	0x48, %o3
	stxa	%i3,	[%l7 + %o3] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f16
	and	%l2,	%i7,	%o7
	fpsub32s	%f1,	%f20,	%f24
	or	%i4,	%o5,	%o1
	nop
	set	0x78, %g5
	ldsb	[%l7 + %g5],	%l1
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f2
	set	0x75, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o2
	nop
	set	0x20, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x4C, %i4
	stb	%g5,	[%l7 + %i4]
	set	0x30, %o5
	ldxa	[%l7 + %o5] 0x80,	%g3
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x89,	 2
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x0F, %l3
	ldstub	[%l7 + %l3],	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%i6
	or	%g1,	%g4,	%g7
	set	0x58, %o7
	stda	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x88,	%i1
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x81
	set	0x58, %l6
	stba	%i2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x51, %l0
	ldub	[%l7 + %l0],	%l6
	nop
	set	0x70, %l1
	std	%f30,	[%l7 + %l1]
	nop
	set	0x51, %g7
	stb	%o6,	[%l7 + %g7]
	nop
	set	0x68, %i1
	lduw	[%l7 + %i1],	%o4
	ba,pn	%icc,	loop_139
	nop
	set	0x20, %g2
	lduw	[%l7 + %g2],	%g6
	nop
	set	0x38, %i2
	stw	%o3,	[%l7 + %i2]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%l4
loop_139:
	nop
	set	0x49, %o0
	stba	%i5,	[%l7 + %o0] 0xea
	membar	#Sync
	ld	[%l7 + 0x18],	%f1
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%o0
	nop
	set	0x2D, %o6
	ldsb	[%l7 + %o6],	%i3
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%i7
	ld	[%l7 + 0x18],	%f2
	and	%l2,	%o7,	%i4
	set	0x58, %o1
	swapa	[%l7 + %o1] 0x81,	%o5
	set	0x6C, %i5
	swapa	[%l7 + %i5] 0x80,	%l1
	set	0x28, %l5
	stda	%o2,	[%l7 + %l5] 0x88
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	set	0x44, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g3
	set	0x2C, %o3
	stwa	%g2,	[%l7 + %o3] 0x88
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%l0
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xe3,	%o0
	nop
	set	0x7E, %o2
	ldub	[%l7 + %o2],	%l3
	nop
	set	0x58, %g5
	stx	%i6,	[%l7 + %g5]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	set	0x7C, %i4
	swapa	[%l7 + %i4] 0x80,	%g4
	nop
	set	0x10, %i6
	std	%f12,	[%l7 + %i6]
	nop
	set	0x58, %i7
	std	%g6,	[%l7 + %i7]
	nop
	set	0x4C, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f2
	set	0x50, %g1
	stha	%l5,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x78, %o7
	lduw	[%l7 + %o7],	%g1
	nop
	set	0x58, %g3
	ldsb	[%l7 + %g3],	%i1
	nop
	set	0x78, %l0
	std	%i2,	[%l7 + %l0]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%i0,	%o4,	%i5
	set	0x0C, %l1
	sta	%f16,	[%l7 + %l1] 0x88
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l4
	nop
	set	0x40, %g7
	stw	%i3,	[%l7 + %g7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%o7
	nop
	set	0x1C, %i1
	ldsh	[%l7 + %i1],	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l1
	wr	%o2,	%g5,	%ccr
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%i4
	nop
	set	0x1D, %g2
	ldub	[%l7 + %g2],	%g2
	nop
	set	0x19, %i2
	ldsb	[%l7 + %i2],	%g3
	nop
	set	0x08, %i3
	std	%f20,	[%l7 + %i3]
	set	0x78, %o0
	lda	[%l7 + %o0] 0x81,	%f17
	nop
	set	0x74, %o6
	swap	[%l7 + %o6],	%l0
	set	0x5F, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l3
	nop
	set	0x10, %o1
	std	%f2,	[%l7 + %o1]
	set	0x1C, %i5
	stwa	%i6,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x88,	%g4
	set	0x58, %i0
	lda	[%l7 + %i0] 0x88,	%f14
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%o1
	set	0x18, %g4
	stxa	%l5,	[%l7 + %g4] 0x81
	nop
	set	0x57, %o3
	ldstub	[%l7 + %o3],	%g1
	add	%i1,	%g7,	%l6
	set	0x28, %l4
	ldxa	[%l7 + %l4] 0x81,	%i2
	set	0x14, %g5
	swapa	[%l7 + %g5] 0x88,	%g6
	ld	[%l7 + 0x38],	%f11
	set	0x70, %o2
	stda	%o2,	[%l7 + %o2] 0x89
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%o6
	set	0x1C, %i6
	sta	%f2,	[%l7 + %i6] 0x80
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i0
	nop
	set	0x13, %i4
	ldub	[%l7 + %i4],	%o0
	nop
	set	0x78, %o5
	stx	%l4,	[%l7 + %o5]
	set	0x11, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i3
	bgu,a,pn	%icc,	loop_140
	nop
	set	0x7E, %g1
	ldsh	[%l7 + %g1],	%i5
	nop
	set	0x24, %i7
	stw	%o7,	[%l7 + %i7]
	nop
	set	0x4C, %o7
	lduh	[%l7 + %o7],	%i7
loop_140:
	or	%o5,	%l2,	%o2
	set	0x31, %l0
	stba	%l1,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x50, %g3
	stwa	%g5,	[%l7 + %g3] 0xe3
	membar	#Sync
	or	%g2,	%g3,	%i4
	ble	%icc,	loop_141
	nop
	set	0x4E, %l1
	lduh	[%l7 + %l1],	%l0
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%i6
loop_141:
	nop
	set	0x60, %l6
	std	%f6,	[%l7 + %l6]
	fpsub32	%f0,	%f12,	%f14
	set	0x3C, %g2
	stwa	%l3,	[%l7 + %g2] 0xe3
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%o1
	and	%g1,	%i1,	%g7
	nop
	set	0x6A, %i2
	sth	%l6,	[%l7 + %i2]
	nop
	set	0x0A, %g7
	sth	%l5,	[%l7 + %g7]
	nop
	set	0x70, %o0
	stw	%g6,	[%l7 + %o0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1E2, 	%sys_tick_cmpr
	and	%o3,	%o4,	%o0
	be,a	%icc,	loop_142
	add	%i0,	%l4,	%i5
	and	%o7,	%i7,	%o5
	nop
	set	0x70, %i3
	stx	%l2,	[%l7 + %i3]
loop_142:
	nop
	set	0x2A, %o4
	stha	%i3,	[%l7 + %o4] 0x81
	add	%l1,	%g5,	%g2
	set	0x58, %o1
	stda	%o2,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x45, %i5
	ldub	[%l7 + %i5],	%g3
	nop
	set	0x38, %o6
	sth	%i4,	[%l7 + %o6]
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f24
	ld	[%l7 + 0x64],	%f11
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x80,	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x262, 	%tick_cmpr
	set	0x10, %g6
	stxa	%o1,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	nop
	set	0x40, %o3
	stw	%i1,	[%l7 + %o3]
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x80,	 1
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x4C, %i6
	sta	%f20,	[%l7 + %i6] 0x88
	set	0x52, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g7
	ld	[%l7 + 0x0C],	%f31
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x89,	%l6
	nop
	set	0x3C, %l3
	ldub	[%l7 + %l3],	%l5
	ld	[%l7 + 0x40],	%f20
	fpadd16s	%f23,	%f16,	%f3
	nop
	set	0x2E, %g1
	sth	%i2,	[%l7 + %g1]
	nop
	set	0x44, %i7
	ldsw	[%l7 + %i7],	%o6
	nop
	set	0x2D, %o5
	ldub	[%l7 + %o5],	%o3
	nop
	set	0x70, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%g6,	%o0,	%o4
	set	0x40, %o7
	stha	%i0,	[%l7 + %o7] 0x89
	set	0x64, %l1
	lda	[%l7 + %l1] 0x89,	%f4
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x81,	%i5
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf1
	membar	#Sync
	nop
	set	0x16, %l6
	lduh	[%l7 + %l6],	%l4
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x89,	 2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x88
	ld	[%l7 + 0x7C],	%f20
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x70, %g2
	sta	%f22,	[%l7 + %g2] 0x81
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f26
	nop
	set	0x68, %i3
	std	%o4,	[%l7 + %i3]
	nop
	set	0x5A, %i5
	sth	%l2,	[%l7 + %i5]
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%i7
	set	0x20, %l5
	stha	%l1,	[%l7 + %l5] 0x81
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%g5
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%g2
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%o2
	set	0x69, %i0
	stba	%i4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x20, %g4
	std	%f14,	[%l7 + %g4]
	nop
	set	0x10, %l4
	std	%f20,	[%l7 + %l4]
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xe2,	%l0
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd0
	set	0x50, %o3
	stxa	%l3,	[%l7 + %o3] 0xea
	membar	#Sync
	fpsub16	%f12,	%f0,	%f14
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%g4
	set	0x2C, %i4
	stha	%g3,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x27, %l2
	ldsb	[%l7 + %l2],	%o1
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x60, %i7
	stda	%i6,	[%l7 + %i7] 0x88
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%i1
	ld	[%l7 + 0x18],	%f23
	nop
	set	0x3C, %l0
	ldstub	[%l7 + %l0],	%g7
	set	0x58, %o7
	stda	%g0,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	set	0x28, %o5
	stwa	%i2,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x68, %i1
	std	%f20,	[%l7 + %i1]
	set	0x10, %g3
	stxa	%l6,	[%l7 + %g3] 0x81
	set	0x18, %i2
	stda	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o0
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x80,	%o4
	wr	%g6,	%i5,	%sys_tick
	set	0x60, %o0
	sta	%f19,	[%l7 + %o0] 0x89
	nop
	set	0x4A, %g2
	ldstub	[%l7 + %g2],	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%o5
	nop
	set	0x21, %g7
	stb	%o7,	[%l7 + %g7]
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x58, %i5
	stwa	%l2,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x54, %o4
	ldsw	[%l7 + %o4],	%i7
	nop
	set	0x40, %l5
	stx	%l1,	[%l7 + %l5]
	nop
	set	0x18, %o6
	std	%f20,	[%l7 + %o6]
	add	%g5,	%i3,	%o2
	nop
	set	0x7A, %o1
	stb	%g2,	[%l7 + %o1]
	set	0x38, %i0
	lda	[%l7 + %i0] 0x89,	%f28
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x08, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x10, %g4
	std	%i4,	[%l7 + %g4]
	set	0x08, %o2
	stwa	%l3,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f16
	ba,a,pn	%xcc,	loop_143
	nop
	set	0x10, %l4
	lduw	[%l7 + %l4],	%g3
	set	0x60, %i6
	lda	[%l7 + %i6] 0x89,	%f0
loop_143:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f16
	nop
	set	0x12, %i4
	lduh	[%l7 + %i4],	%g4
	set	0x5C, %l3
	swapa	[%l7 + %l3] 0x81,	%i6
	nop
	set	0x24, %i7
	ldstub	[%l7 + %i7],	%i1
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f12
	nop
	set	0x20, %l2
	std	%g6,	[%l7 + %l2]
	or	%o1,	%l5,	%i2
	set	0x20, %o7
	stda	%i6,	[%l7 + %o7] 0xea
	membar	#Sync
	add	%o6,	%o3,	%o0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%g6
	nop
	set	0x24, %l1
	stw	%i5,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x7C, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x5D, %o5
	stba	%l4,	[%l7 + %o5] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x3B, %l6
	ldstub	[%l7 + %l6],	%o4
	nop
	set	0x14, %o0
	lduw	[%l7 + %o0],	%i0
	be,a,pn	%xcc,	loop_144
	bl,a	%xcc,	loop_145
	nop
	set	0x2C, %g3
	sth	%o5,	[%l7 + %g3]
	st	%f8,	[%l7 + 0x54]
loop_144:
	nop
	set	0x36, %g2
	lduh	[%l7 + %g2],	%l2
loop_145:
	nop
	set	0x50, %i3
	stx	%o7,	[%l7 + %i3]
	nop
	set	0x35, %g7
	stb	%l1,	[%l7 + %g7]
	nop
	set	0x29, %o4
	ldub	[%l7 + %o4],	%i7
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x88,	%i2
	nop
	set	0x48, %i5
	prefetch	[%l7 + %i5],	 3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%g5
	set	0x5C, %o1
	swapa	[%l7 + %o1] 0x89,	%l0
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x88,	%g2
	set	0x58, %i0
	stxa	%i4,	[%l7 + %i0] 0x89
	nop
	set	0x48, %g6
	swap	[%l7 + %g6],	%l3
	set	0x51, %o2
	stba	%g4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x22, %g4
	sth	%i6,	[%l7 + %g4]
	nop
	set	0x66, %l4
	stb	%g3,	[%l7 + %l4]
	set	0x54, %g5
	swapa	[%l7 + %g5] 0x81,	%g7
	set	0x43, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o1
	set	0x53, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i1
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%l5
	nop
	set	0x7C, %i7
	lduw	[%l7 + %i7],	%i2
	nop
	set	0x77, %g1
	ldsb	[%l7 + %g1],	%l6
	set	0x1C, %i4
	stha	%o3,	[%l7 + %i4] 0x89
	st	%fsr,	[%l7 + 0x0C]
	set	0x56, %l2
	stha	%o0,	[%l7 + %l2] 0x88
	nop
	set	0x68, %o7
	stx	%g1,	[%l7 + %o7]
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	nop
	set	0x48, %l0
	stx	%g6,	[%l7 + %l0]
	nop
	nop
	setx	0xE7982685,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x4F1E37E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f0,	%f21
	or	%i5,	%l4,	%i0
	nop
	set	0x14, %o5
	lduh	[%l7 + %o5],	%o4
	set	0x0B, %i2
	stba	%l2,	[%l7 + %i2] 0x80
	and	%o7,	%o5,	%i7
	nop
	set	0x12, %l6
	sth	%l1,	[%l7 + %l6]
	set	0x64, %i1
	lda	[%l7 + %i1] 0x89,	%f10
	fpsub16	%f8,	%f16,	%f16
	set	0x44, %g3
	stwa	%i3,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x4C, %o0
	ldsw	[%l7 + %o0],	%g5
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x7D, %g7
	ldstub	[%l7 + %g7],	%l0
	nop
	set	0x0C, %o4
	ldsw	[%l7 + %o4],	%g2
	set	0x4C, %i3
	lda	[%l7 + %i3] 0x88,	%f26
	nop
	set	0x58, %l5
	prefetch	[%l7 + %l5],	 2
	add	%i4,	%g4,	%l3
	nop
	set	0x58, %i5
	std	%i6,	[%l7 + %i5]
	ld	[%l7 + 0x50],	%f14
	nop
	set	0x11, %o6
	ldsb	[%l7 + %o6],	%g3
	nop
	set	0x4D, %i0
	ldsb	[%l7 + %i0],	%o1
	and	%g7,	%i1,	%l5
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%i6
	wr	%i2,	%o0,	%pic
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o6
	set	0x54, %o2
	stba	%g1,	[%l7 + %o2] 0xea
	membar	#Sync
	ld	[%l7 + 0x10],	%f4
	nop
	set	0x20, %o1
	swap	[%l7 + %o1],	%g6
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%l4
	nop
	set	0x40, %g4
	stw	%i0,	[%l7 + %g4]
	nop
	set	0x1C, %g5
	swap	[%l7 + %g5],	%o4
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x89,	%i5
	nop
	set	0x67, %l3
	stb	%l2,	[%l7 + %l3]
	set	0x48, %i6
	lda	[%l7 + %i6] 0x88,	%f4
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%o7
	nop
	set	0x1C, %i7
	ldstub	[%l7 + %i7],	%o5
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%l1
	nop
	set	0x20, %l1
	stw	%i3,	[%l7 + %l1]
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%i7
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%g4
	wr	%o2,	%l0,	%y
	set	0x7C, %i2
	lda	[%l7 + %i2] 0x89,	%f16
	ba,a	%xcc,	loop_146
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x38, %i1
	std	%f26,	[%l7 + %i1]
	ld	[%l7 + 0x70],	%f8
loop_146:
	fpsub16	%f14,	%f30,	%f30
	nop
	set	0x61, %i4
	stb	%g2,	[%l7 + %i4]
	or	%g4,	%l3,	%i4
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f14
	or	%i6,	%o1,	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%l5
	set	0x48, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l6
	set	0x4E, %g7
	stha	%i1,	[%l7 + %g7] 0x88
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x2A, %o4
	stb	%i2,	[%l7 + %o4]
	nop
	set	0x54, %l5
	sth	%o0,	[%l7 + %l5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g1
	set	0x6C, %i5
	stha	%g6,	[%l7 + %i5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x28],	%f23
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xe3,	%o6
	nop
	set	0x70, %i0
	std	%f30,	[%l7 + %i0]
	nop
	set	0x44, %i3
	stb	%i0,	[%l7 + %i3]
	nop
	set	0x5A, %o2
	ldstub	[%l7 + %o2],	%l4
	nop
	set	0x65, %g6
	ldstub	[%l7 + %g6],	%o4
	nop
	set	0x76, %l4
	ldsb	[%l7 + %l4],	%l2
	fpadd16	%f26,	%f6,	%f30
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%o5
	nop
	set	0x40, %g4
	std	%f24,	[%l7 + %g4]
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%i2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf9,	%f0
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0
	nop
	set	0x5F, %g1
	stb	%o2,	[%l7 + %g1]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%g2
	nop
	set	0x08, %i6
	ldsw	[%l7 + %i6],	%g4
	or	%l3,	%g5,	%i4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o1
	nop
	set	0x50, %l2
	ldx	[%l7 + %l2],	%g3
	set	0x60, %i7
	stda	%g6,	[%l7 + %i7] 0x80
	nop
	set	0x10, %l1
	stw	%l5,	[%l7 + %l1]
	nop
	set	0x68, %o7
	stx	%l6,	[%l7 + %o7]
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x88,	%i0
	nop
	set	0x7E, %o5
	sth	%i2,	[%l7 + %o5]
	set	0x50, %i2
	stwa	%o0,	[%l7 + %i2] 0x81
	nop
	set	0x7A, %l6
	sth	%o3,	[%l7 + %l6]
	nop
	set	0x48, %i4
	stx	%g1,	[%l7 + %i4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g6
	nop
	set	0x58, %g3
	stx	%i0,	[%l7 + %g3]
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%l4
	ld	[%l7 + 0x58],	%f2
	fpadd32s	%f23,	%f7,	%f28
	nop
	set	0x68, %o0
	std	%f4,	[%l7 + %o0]
	set	0x59, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i5
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	wr	%o5,	%o7,	%pic
	nop
	set	0x24, %o4
	stw	%l1,	[%l7 + %o4]
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%i2
	st	%f24,	[%l7 + 0x44]
	nop
	set	0x32, %l5
	ldsh	[%l7 + %l5],	%i7
	nop
	set	0x78, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%o2
	nop
	set	0x78, %o6
	std	%l0,	[%l7 + %o6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x280, 	%tick_cmpr
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%i4
	nop
	set	0x76, %o2
	ldsb	[%l7 + %o2],	%l3
	nop
	set	0x35, %l4
	ldub	[%l7 + %l4],	%o1
	set	0x27, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i6
	set	0x28, %g6
	stda	%g6,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x88,	%l5
	nop
	set	0x54, %o3
	sth	%l6,	[%l7 + %o3]
	set	0x7E, %l3
	stba	%g3,	[%l7 + %l3] 0x81
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x80,	 4
	nop
	set	0x14, %g1
	ldsw	[%l7 + %g1],	%i2
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	set	0x0E, %l2
	lduh	[%l7 + %l2],	%g1
	set	0x74, %l1
	lda	[%l7 + %l1] 0x81,	%f22
	st	%f22,	[%l7 + 0x28]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%g6
	nop
	set	0x64, %i7
	sth	%i0,	[%l7 + %i7]
	set	0x08, %o7
	sta	%f20,	[%l7 + %o7] 0x88
	nop
	set	0x30, %l0
	ldstub	[%l7 + %l0],	%o6
	nop
	set	0x0D, %i2
	ldub	[%l7 + %i2],	%o4
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x81,	 4
	nop
	set	0x4E, %l6
	sth	%i5,	[%l7 + %l6]
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f30
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x89,	 4
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	nop
	set	0x53, %g7
	ldsb	[%l7 + %g7],	%l1
	or	%i3,	%i7,	%l2
	nop
	set	0x44, %g2
	ldsh	[%l7 + %g2],	%l0
	nop
	set	0x46, %i1
	lduh	[%l7 + %i1],	%g4
	set	0x69, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g2
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f4
	set	0x3C, %l5
	stha	%g5,	[%l7 + %l5] 0x81
	fpadd32	%f28,	%f16,	%f30
	nop
	set	0x30, %i0
	ldstub	[%l7 + %i0],	%i4
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x89,	 1
	nop
	set	0x76, %o6
	ldsh	[%l7 + %o6],	%l3
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%i6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xda,	%f0
	nop
	set	0x48, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%g7
	nop
	set	0x40, %o3
	stb	%l5,	[%l7 + %o3]
	ble,a,pt	%icc,	loop_147
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%l6
	add	%g3,	%o1,	%i2
	nop
	set	0x7C, %l3
	lduh	[%l7 + %l3],	%o3
loop_147:
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f24
	wr	%g1,	%o0,	%ccr
	nop
	set	0x1C, %i6
	ldub	[%l7 + %i6],	%g6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xca
	set	0x31, %l2
	stba	%i0,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x50, %i7
	ldda	[%l7 + %i7] 0xeb,	%i0
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x18, %l0
	stha	%o4,	[%l7 + %l0] 0xe2
	membar	#Sync
	bgu,a,pn	%xcc,	loop_148
	or	%l4,	%o6,	%i5
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%o6
	set	0x50, %l1
	sta	%f23,	[%l7 + %l1] 0x81
loop_148:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%l1
	set	0x34, %o5
	sta	%f5,	[%l7 + %o5] 0x89
	nop
	set	0x78, %l6
	lduh	[%l7 + %l6],	%i3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%i6
	bleu,a,pt	%xcc,	loop_149
	nop
	set	0x48, %o0
	stx	%l0,	[%l7 + %o0]
	set	0x78, %i4
	sta	%f17,	[%l7 + %i4] 0x80
loop_149:
	nop
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f4
	nop
	set	0x2A, %i5
	lduh	[%l7 + %i5],	%g2
	nop
	set	0x60, %o4
	swap	[%l7 + %o4],	%g5
	nop
	set	0x72, %l5
	lduh	[%l7 + %l5],	%l2
	set	0x08, %g2
	stxa	%i4,	[%l7 + %g2] 0x89
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x81,	%o2
	set	0x1E, %o6
	stha	%l3,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x5C, %l4
	ldsw	[%l7 + %l4],	%g7
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x0C, %g6
	ldstub	[%l7 + %g6],	%i6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g3
	nop
	set	0x5E, %o2
	lduh	[%l7 + %o2],	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%o1
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	set	0x63, %o3
	stba	%o0,	[%l7 + %o3] 0x88
	nop
	set	0x3E, %g5
	sth	%g6,	[%l7 + %g5]
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x2B, %o1
	ldsb	[%l7 + %o1],	%o3
	nop
	set	0x14, %g1
	stw	%i1,	[%l7 + %g1]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o6
	st	%fsr,	[%l7 + 0x30]
	add	%l4,	%o7,	%i5
	nop
	set	0x64, %i6
	ldsw	[%l7 + %i6],	%o5
	nop
	set	0x3E, %i7
	lduh	[%l7 + %i7],	%i3
	nop
	set	0x28, %o7
	swap	[%l7 + %o7],	%i7
	and	%l1,	%g4,	%l0
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	nop
	set	0x08, %i2
	prefetch	[%l7 + %i2],	 1
	nop
	set	0x18, %l1
	std	%g2,	[%l7 + %l1]
	nop
	set	0x1C, %l0
	prefetch	[%l7 + %l0],	 0
	nop
	set	0x58, %o5
	ldsb	[%l7 + %o5],	%g5
	set	0x30, %g3
	stwa	%l2,	[%l7 + %g3] 0x80
	nop
	set	0x48, %l6
	stw	%i4,	[%l7 + %l6]
	or	%o2,	%g7,	%i6
	set	0x20, %i4
	stda	%i6,	[%l7 + %i4] 0x80
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%l5
	set	0x48, %o0
	stba	%i2,	[%l7 + %o0] 0x88
	fpadd32	%f16,	%f18,	%f4
	nop
	set	0x4C, %g7
	ldsh	[%l7 + %g7],	%o1
	fpsub32	%f14,	%f16,	%f24
	and	%l3,	%g1,	%o0
	add	%g6,	%o3,	%i0
	nop
	set	0x48, %i5
	std	%f2,	[%l7 + %i5]
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%o4
	set	0x10, %i1
	ldda	[%l7 + %i1] 0xea,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o5
	nop
	set	0x4A, %l5
	ldstub	[%l7 + %l5],	%i3
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%l4
	fpadd32	%f26,	%f20,	%f20
	add	%i7,	%g4,	%l1
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%g2
	set	0x3C, %o6
	sta	%f8,	[%l7 + %o6] 0x89
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcc
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x88,	%g4
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x50, %o2
	lduh	[%l7 + %o2],	%l0
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x88,	%l2
	nop
	set	0x20, %g4
	stx	%i4,	[%l7 + %g4]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f16
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf8
	membar	#Sync
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%g7
	nop
	set	0x18, %g1
	stx	%i6,	[%l7 + %g1]
	nop
	set	0x17, %i6
	ldub	[%l7 + %i6],	%o2
	nop
	set	0x64, %o7
	swap	[%l7 + %o7],	%g3
	fpadd16	%f16,	%f24,	%f8
	or	%l6,	%l5,	%i2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd2
	nop
	set	0x34, %i2
	ldstub	[%l7 + %i2],	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC5F, 	%tick_cmpr
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x89
	and	%o0,	%o3,	%i0
	nop
	set	0x4C, %l1
	stw	%i1,	[%l7 + %l1]
	set	0x4D, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g6
	set	0x5C, %l0
	lda	[%l7 + %l0] 0x81,	%f11
	nop
	set	0x48, %l6
	sth	%o6,	[%l7 + %l6]
	set	0x0C, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o7
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%o4
	nop
	set	0x58, %o0
	ldub	[%l7 + %o0],	%i3
	nop
	set	0x38, %g7
	ldsw	[%l7 + %g7],	%i7
	add	%g4,	%l4,	%l1
	nop
	set	0x60, %o4
	std	%g4,	[%l7 + %o4]
	set	0x48, %i1
	lda	[%l7 + %i1] 0x88,	%f8
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%l0
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x88,	%i4
	nop
	set	0x30, %i3
	lduw	[%l7 + %i3],	%l2
	set	0x68, %g2
	stha	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x08, %l5
	sth	%o2,	[%l7 + %l5]
	set	0x64, %o6
	stwa	%g3,	[%l7 + %o6] 0x80
	nop
	set	0x13, %i0
	stb	%l6,	[%l7 + %i0]
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f8
	nop
	set	0x4B, %g6
	ldstub	[%l7 + %g6],	%l5
	nop
	set	0x30, %g4
	stx	%g7,	[%l7 + %g4]
	wr	%l3,	%g1,	%y
	nop
	set	0x3E, %l4
	ldub	[%l7 + %l4],	%o1
	nop
	set	0x73, %l3
	ldsb	[%l7 + %l3],	%o0
	set	0x68, %o3
	stda	%o2,	[%l7 + %o3] 0xe3
	membar	#Sync
	st	%f4,	[%l7 + 0x30]
	fpadd16s	%f12,	%f9,	%f20
	nop
	set	0x18, %g5
	std	%i2,	[%l7 + %g5]
	set	0x2C, %o1
	sta	%f13,	[%l7 + %o1] 0x89
	nop
	set	0x64, %i6
	ldsw	[%l7 + %i6],	%i0
	nop
	set	0x08, %g1
	std	%f26,	[%l7 + %g1]
	nop
	set	0x5B, %i7
	ldstub	[%l7 + %i7],	%i1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%o7
	set	0x6A, %l2
	stha	%i5,	[%l7 + %l2] 0x80
	nop
	set	0x22, %i2
	ldstub	[%l7 + %i2],	%o5
	fpsub32s	%f10,	%f10,	%f3
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x2F, %l0
	stb	%o4,	[%l7 + %l0]
	add	%i3,	%i7,	%g4
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%o6
	ld	[%l7 + 0x60],	%f28
	nop
	set	0x58, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	nop
	setx	0x5CFBEAD1AF779F49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB5C26A2D49FB554C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f16
	set	0x52, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l1
	add	%g5,	%g2,	%l0
	nop
	set	0x3E, %o0
	sth	%l4,	[%l7 + %o0]
	nop
	set	0x7C, %g7
	stw	%l2,	[%l7 + %g7]
	nop
	set	0x32, %l6
	ldstub	[%l7 + %l6],	%i4
	ld	[%l7 + 0x34],	%f18
	set	0x16, %o4
	ldstuba	[%l7 + %o4] 0x88,	%o2
	nop
	set	0x30, %i5
	std	%f20,	[%l7 + %i5]
	add	%g3,	%i6,	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%l3
	ld	[%l7 + 0x44],	%f26
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x68, %g2
	ldx	[%l7 + %g2],	%g1
	nop
	set	0x50, %i3
	std	%f24,	[%l7 + %i3]
	nop
	set	0x1C, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%o1
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x81,	%o0
	set	0x68, %o6
	stda	%g6,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x80,	%o3
	or	%i0,	%i2,	%g6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xea,	%o6
	and	%i5,	%i1,	%o4
	ld	[%l7 + 0x08],	%f2
	nop
	set	0x2C, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x30, %o3
	ldxa	[%l7 + %o3] 0x88,	%i3
	fpadd16s	%f8,	%f20,	%f9
	nop
	set	0x44, %l4
	sth	%o5,	[%l7 + %l4]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o6
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%l1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xeb,	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%g2
	set	0x48, %g1
	stwa	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x5A, %i7
	sth	%l2,	[%l7 + %i7]
	nop
	set	0x78, %o7
	stx	%i4,	[%l7 + %o7]
	nop
	set	0x20, %o1
	std	%f0,	[%l7 + %o1]
	set	0x5C, %i2
	stwa	%o2,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x4A, %o5
	stha	%g3,	[%l7 + %o5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x60],	%f30
	bleu	%icc,	loop_150
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
loop_150:
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%l4
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%l6
	set	0x74, %o0
	stwa	%i6,	[%l7 + %o0] 0x80
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc2
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%l3
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%g0
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f4
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x88,	%l5
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g7
	nop
	set	0x46, %i0
	lduh	[%l7 + %i0],	%o0
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%o3
	set	0x24, %o2
	stwa	%i0,	[%l7 + %o2] 0x89
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%i2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xca
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%o7
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x80,	 1
	set	0x0C, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i1
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xe2,	%o4
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x88,	%i3
	nop
	set	0x48, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g4,	%i7,	%set_softint
	nop
	set	0x18, %i7
	std	%g4,	[%l7 + %i7]
	add	%g2,	%l2,	%i4
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	nop
	set	0x40, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x2C, %g1
	stha	%l0,	[%l7 + %g1] 0x81
	nop
	set	0x28, %o5
	stx	%l4,	[%l7 + %o5]
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%f16
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xe2,	%i6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i6
	wr	%l3,	%g1,	%pic
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%l5
	fpadd32s	%f24,	%f7,	%f10
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x80,	%g7
	set	0x34, %l2
	lda	[%l7 + %l2] 0x81,	%f5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f16
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%o0
	set	0x3C, %i4
	sta	%f11,	[%l7 + %i4] 0x80
	st	%f24,	[%l7 + 0x24]
	set	0x5C, %o0
	stha	%i0,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x20, %i5
	std	%g6,	[%l7 + %i5]
	nop
	set	0x64, %l6
	ldsh	[%l7 + %l6],	%i2
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%i5
	nop
	set	0x08, %o4
	stw	%o7,	[%l7 + %o4]
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x81,	%o3
	nop
	set	0x50, %i0
	std	%f22,	[%l7 + %i0]
	set	0x08, %l5
	stda	%o4,	[%l7 + %l5] 0x81
	ld	[%l7 + 0x68],	%f17
	nop
	set	0x30, %i3
	lduh	[%l7 + %i3],	%i1
	set	0x58, %o2
	stxa	%i3,	[%l7 + %o2] 0x81
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x89,	%o5
	nop
	set	0x30, %g6
	lduh	[%l7 + %g6],	%l1
	nop
	set	0x7A, %g4
	lduh	[%l7 + %g4],	%o6
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x81,	%i7
	add	%g4,	%g5,	%g2
	add	%l2,	%o2,	%l0
	st	%f30,	[%l7 + 0x10]
	st	%fsr,	[%l7 + 0x2C]
	set	0x6A, %l3
	stba	%l4,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x2C, %i6
	sta	%f23,	[%l7 + %i6] 0x81
	nop
	set	0x7E, %g5
	ldsb	[%l7 + %g5],	%i4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd8
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0
	nop
	set	0x14, %o7
	ldsw	[%l7 + %o7],	%i6
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%l3
	nop
	set	0x68, %o5
	stw	%g1,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	nop
	set	0x6C, %i2
	stw	%o1,	[%l7 + %i2]
	set	0x67, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g3
	or	%l5,	%g7,	%o0
	add	%i0,	%g6,	%i2
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o7
	set	0x58, %l2
	stxa	%o4,	[%l7 + %l2] 0x81
	nop
	set	0x1C, %g3
	stw	%i1,	[%l7 + %g3]
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	add	%o3,	%l1,	%o6
	st	%fsr,	[%l7 + 0x34]
	set	0x3C, %g7
	stwa	%o5,	[%l7 + %g7] 0x89
	nop
	set	0x28, %i4
	ldub	[%l7 + %i4],	%i7
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x81,	%g4
	set	0x11, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g2
	nop
	set	0x28, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f20
	st	%f7,	[%l7 + 0x74]
	set	0x68, %i1
	stha	%l2,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x64, %o4
	lda	[%l7 + %o4] 0x89,	%f6
	set	0x34, %i0
	swapa	[%l7 + %i0] 0x89,	%o2
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x88,	%l0
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f22
	st	%f6,	[%l7 + 0x7C]
	nop
	set	0x44, %o6
	stw	%l4,	[%l7 + %o6]
	nop
	set	0x24, %o2
	stw	%g5,	[%l7 + %o2]
	set	0x52, %g4
	stba	%l6,	[%l7 + %g4] 0xeb
	membar	#Sync
	wr	%i6,	%i4,	%set_softint
	set	0x48, %l4
	stxa	%l3,	[%l7 + %l4] 0x81
	set	0x62, %g6
	stha	%o1,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x78, %i6
	std	%g0,	[%l7 + %i6]
	set	0x1C, %g5
	stha	%g3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x81,	%l4
	nop
	set	0x28, %o3
	stx	%g7,	[%l7 + %o3]
	set	0x3B, %o7
	stba	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x89,	%g6
	set	0x60, %i7
	stda	%o0,	[%l7 + %i7] 0x88
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%i2
	st	%f24,	[%l7 + 0x60]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%i4
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	set	0x40, %i2
	stwa	%i1,	[%l7 + %i2] 0x80
	and	%i3,	%o4,	%l1
	nop
	set	0x74, %l1
	lduw	[%l7 + %l1],	%o3
	nop
	set	0x1C, %g3
	ldsb	[%l7 + %g3],	%o5
	nop
	set	0x34, %g7
	ldsw	[%l7 + %g7],	%o6
	nop
	set	0x60, %i5
	stx	%i7,	[%l7 + %i5]
	nop
	set	0x18, %l6
	std	%f24,	[%l7 + %l6]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g4
	st	%fsr,	[%l7 + 0x64]
	set	0x78, %o0
	stwa	%o2,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf9
	membar	#Sync
	set	0x08, %o4
	stda	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x6A, %i1
	sth	%l2,	[%l7 + %i1]
	ld	[%l7 + 0x10],	%f29
	set	0x2A, %i0
	stha	%g5,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%l4
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x80,	%l6
	nop
	set	0x44, %o6
	ldsw	[%l7 + %o6],	%i4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xeb,	%l2
	and	%i6,	%g1,	%g3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	nop
	set	0x40, %g6
	lduh	[%l7 + %g6],	%o1
	nop
	set	0x66, %i6
	ldsb	[%l7 + %i6],	%g7
	st	%fsr,	[%l7 + 0x24]
	set	0x30, %g5
	stxa	%i0,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x6D, %g4
	ldstuba	[%l7 + %g4] 0x81,	%g6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf8
	membar	#Sync
	nop
	set	0x7C, %o7
	swap	[%l7 + %o7],	%o0
	nop
	set	0x1E, %g1
	sth	%l5,	[%l7 + %g1]
	nop
	set	0x51, %i7
	ldub	[%l7 + %i7],	%i5
	set	0x08, %l0
	stxa	%o7,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x30, %o3
	ldx	[%l7 + %o3],	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xe2,	%i2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i1
	nop
	set	0x64, %l2
	sth	%o3,	[%l7 + %l2]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xea,	%o4
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	set	0x78, %l1
	stxa	%i7,	[%l7 + %l1] 0x80
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x81,	 3
	set	0x24, %i5
	swapa	[%l7 + %i5] 0x89,	%g4
	nop
	set	0x34, %l6
	swap	[%l7 + %l6],	%o2
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x80,	%l0
	add	%l0,	%g5,	%l2
	nop
	set	0x0C, %o0
	ldsb	[%l7 + %o0],	%l4
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x89,	 1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xcc
	nop
	set	0x3C, %o4
	ldub	[%l7 + %o4],	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g1
	set	0x60, %i0
	lda	[%l7 + %i0] 0x89,	%f0
	and	%i6,	%g3,	%o1
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f8
	ld	[%l7 + 0x40],	%f21
	nop
	set	0x2B, %i3
	ldstub	[%l7 + %i3],	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%g7
	nop
	set	0x5C, %l5
	lduh	[%l7 + %l5],	%o0
	nop
	set	0x1B, %o2
	ldsb	[%l7 + %o2],	%l5
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	nop
	set	0x3C, %o6
	ldsh	[%l7 + %o6],	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%o4
	set	0x70, %i6
	stda	%i0,	[%l7 + %i6] 0x89
	set	0x14, %g6
	sta	%f17,	[%l7 + %g6] 0x80
	st	%f16,	[%l7 + 0x1C]
	nop
	set	0x4F, %g5
	ldub	[%l7 + %g5],	%i3
	nop
	set	0x7D, %l3
	ldsb	[%l7 + %l3],	%o5
	nop
	set	0x33, %g4
	ldub	[%l7 + %g4],	%o3
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf9
	membar	#Sync
	set	0x51, %o7
	stba	%i7,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x44, %i7
	sth	%g2,	[%l7 + %i7]
	set	0x58, %o3
	stxa	%o6,	[%l7 + %o3] 0x89
	set	0x78, %o5
	stda	%g4,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%o2
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%l0
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f0
	nop
	set	0x34, %i2
	lduw	[%l7 + %i2],	%g5
	set	0x44, %g3
	stba	%l0,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x58, %l1
	stx	%l2,	[%l7 + %l1]
	nop
	set	0x58, %i5
	std	%f4,	[%l7 + %i5]
	ld	[%l7 + 0x38],	%f28
	nop
	set	0x28, %i4
	stx	%l4,	[%l7 + %i4]
	nop
	set	0x34, %o0
	stw	%l6,	[%l7 + %o0]
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x6C, %g7
	lduh	[%l7 + %g7],	%l3
	set	0x2A, %g2
	stha	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x36, %o4
	ldsb	[%l7 + %o4],	%i6
	fpsub16s	%f13,	%f31,	%f21
	ld	[%l7 + 0x68],	%f23
	nop
	set	0x1C, %i1
	lduw	[%l7 + %i1],	%g1
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xeb,	%g2
	nop
	set	0x08, %i3
	sth	%i0,	[%l7 + %i3]
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x89,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%o0
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	nop
	set	0x5C, %o6
	ldsb	[%l7 + %o6],	%l5
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xe2,	%o6
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%i4
	nop
	nop
	setx	0xEC5F1DD293609DFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7C9E5DAFDA6FCCFD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f2,	%f6
	nop
	set	0x56, %g5
	ldsb	[%l7 + %g5],	%o4
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x55, %g4
	stb	%i1,	[%l7 + %g4]
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%i2
	nop
	set	0x50, %g1
	lduw	[%l7 + %g1],	%i2
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x81,	%o3
	nop
	set	0x60, %o7
	std	%o4,	[%l7 + %o7]
	nop
	set	0x22, %o3
	ldsh	[%l7 + %o3],	%g2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%i7
	nop
	set	0x1C, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%g4
	set	0x32, %l0
	stba	%o6,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o2
	set	0x68, %l1
	stda	%g4,	[%l7 + %l1] 0x81
	st	%f25,	[%l7 + 0x70]
	nop
	set	0x10, %o0
	std	%f10,	[%l7 + %o0]
	bleu	%xcc,	loop_151
	nop
	set	0x6C, %i4
	ldub	[%l7 + %i4],	%l1
	or	%l2,	%l0,	%l6
	wr 	%g0, 	0x6, 	%fprs
loop_151:
	nop
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xe2,	%i4
	nop
	nop
	setx	0x4E6C5730,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x1C615703,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f23,	%f25
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x80,	 1
	nop
	set	0x08, %l6
	lduw	[%l7 + %l6],	%g3
	set	0x20, %i1
	stxa	%i6,	[%l7 + %i1] 0xe3
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%i0
	set	0x5C, %o4
	lda	[%l7 + %o4] 0x88,	%f20
	set	0x60, %i3
	swapa	[%l7 + %i3] 0x88,	%o1
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x81,	%g7
	nop
	set	0x4C, %o6
	swap	[%l7 + %o6],	%o0
	nop
	set	0x66, %l4
	ldsh	[%l7 + %l4],	%o7
	nop
	set	0x30, %l5
	stx	%l5,	[%l7 + %l5]
	set	0x68, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i5
	nop
	set	0x74, %g6
	ldsw	[%l7 + %g6],	%o4
	set	0x27, %i6
	stba	%i3,	[%l7 + %i6] 0x89
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%i2
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x80,	 4
	nop
	set	0x10, %i7
	stx	%o5,	[%l7 + %i7]
	set	0x78, %l3
	stha	%i1,	[%l7 + %l3] 0x88
	add	%g2,	%g4,	%i7
	wr	%o6,	%o2,	%y
	nop
	set	0x5C, %o7
	ldub	[%l7 + %o7],	%g5
	set	0x08, %o5
	prefetcha	[%l7 + %o5] 0x88,	 2
	nop
	set	0x0C, %l2
	swap	[%l7 + %l2],	%l2
	nop
	set	0x5A, %o1
	ldub	[%l7 + %o1],	%l6
	nop
	set	0x7C, %i2
	ldsh	[%l7 + %i2],	%l4
	nop
	set	0x5D, %o3
	ldub	[%l7 + %o3],	%l0
	nop
	set	0x78, %l0
	ldsw	[%l7 + %l0],	%i4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f16
	nop
	set	0x64, %l1
	ldsh	[%l7 + %l1],	%g1
	set	0x3E, %i5
	stha	%g3,	[%l7 + %i5] 0x88
	nop
	set	0x20, %o0
	std	%f18,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x68]
	or	%i6,	%g6,	%l3
	nop
	set	0x72, %g7
	ldub	[%l7 + %g7],	%i0
	set	0x55, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o1
	nop
	set	0x1C, %g2
	lduw	[%l7 + %g2],	%o0
	nop
	set	0x1E, %l6
	stb	%g7,	[%l7 + %l6]
	nop
	set	0x68, %o4
	swap	[%l7 + %o4],	%o7
	set	0x50, %i1
	stxa	%l5,	[%l7 + %i1] 0x80
	nop
	set	0x6C, %i3
	stb	%o4,	[%l7 + %i3]
	nop
	set	0x32, %i0
	ldsb	[%l7 + %i0],	%i5
	nop
	set	0x58, %o2
	ldsb	[%l7 + %o2],	%i2
	nop
	set	0x48, %l4
	stx	%i3,	[%l7 + %l4]
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x69, %l5
	stb	%o5,	[%l7 + %l5]
	fpsub16s	%f0,	%f10,	%f12
	add	%o3,	%g2,	%i1
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x89
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xe3,	%g4
	st	%fsr,	[%l7 + 0x20]
	or	%o6,	%i7,	%g5
	set	0x1E, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l1
	nop
	set	0x70, %g4
	std	%l2,	[%l7 + %g4]
	st	%f3,	[%l7 + 0x6C]
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f4
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%o2
	nop
	set	0x10, %i7
	stw	%l6,	[%l7 + %i7]
	nop
	set	0x30, %o5
	std	%f0,	[%l7 + %o5]
	set	0x38, %o7
	lda	[%l7 + %o7] 0x88,	%f3
	nop
	set	0x60, %o1
	stx	%l4,	[%l7 + %o1]
	bg,a,pt	%icc,	loop_152
	nop
	set	0x78, %l2
	prefetch	[%l7 + %l2],	 2
	or	%i4,	%l0,	%g3
	set	0x6D, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g1
loop_152:
	nop
	set	0x10, %l0
	stw	%g6,	[%l7 + %l0]
	nop
	set	0x20, %g3
	ldstub	[%l7 + %g3],	%i6
	ld	[%l7 + 0x10],	%f10
	nop
	set	0x64, %o3
	lduw	[%l7 + %o3],	%l3
	set	0x48, %l1
	stxa	%o1,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x60, %i5
	stwa	%o0,	[%l7 + %i5] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x1C]
	set	0x48, %g7
	lda	[%l7 + %g7] 0x80,	%f3
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%i0
	set	0x12, %g2
	stha	%g7,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x18, %l6
	stw	%o7,	[%l7 + %l6]
	set	0x2C, %i4
	sta	%f14,	[%l7 + %i4] 0x80
	set	0x7F, %o4
	stba	%l5,	[%l7 + %o4] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i5
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%i3
	nop
	set	0x6A, %i1
	ldsh	[%l7 + %i1],	%i2
	set	0x20, %o2
	lda	[%l7 + %o2] 0x88,	%f19
	set	0x38, %l4
	stxa	%o3,	[%l7 + %l4] 0x89
	nop
	set	0x40, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%g2
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x88,	%i0
	nop
	set	0x53, %i6
	ldstub	[%l7 + %i6],	%o5
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%o6
	and	%g4,	%g5,	%l1
	nop
	set	0x7C, %g5
	ldsh	[%l7 + %g5],	%i7
	nop
	set	0x7A, %g4
	lduh	[%l7 + %g4],	%l2
	set	0x24, %g1
	stha	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%i4
	nop
	set	0x1C, %i7
	lduw	[%l7 + %i7],	%l6
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x89,	%g3
	or	%g1,	%g6,	%l0
	nop
	set	0x28, %o7
	std	%f18,	[%l7 + %o7]
	or	%l3,	%o1,	%o0
	nop
	set	0x1A, %l3
	ldub	[%l7 + %l3],	%i0
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%g7
	add	%i6,	%o7,	%o4
	set	0x2D, %l2
	stba	%l5,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%i3,	%i2,	%o3
	nop
	set	0x63, %l0
	ldub	[%l7 + %l0],	%i5
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe2,	%g2
	set	0x78, %o3
	stxa	%o5,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x5C, %l1
	swap	[%l7 + %l1],	%i1
	or	%o6,	%g4,	%g5
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	nop
	set	0x08, %i5
	swap	[%l7 + %i5],	%i7
	nop
	set	0x60, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f2
	nop
	set	0x08, %l6
	std	%f14,	[%l7 + %l6]
	set	0x68, %o0
	lda	[%l7 + %o0] 0x89,	%f31
	and	%l2,	%o2,	%i4
	st	%f13,	[%l7 + 0x50]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%g3
	set	0x26, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l6
	nop
	set	0x30, %i4
	ldub	[%l7 + %i4],	%g1
	set	0x6E, %i1
	stha	%g6,	[%l7 + %i1] 0x80
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%l3
	nop
	set	0x4E, %i3
	ldub	[%l7 + %i3],	%l0
	nop
	set	0x4B, %o6
	stb	%o0,	[%l7 + %o6]
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xea,	%i0
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x88,	 1
	st	%f20,	[%l7 + 0x58]
	nop
	set	0x57, %i6
	ldsb	[%l7 + %i6],	%i6
	or	%o7,	%g7,	%l5
	set	0x30, %g6
	stxa	%o4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%i3
	nop
	set	0x3C, %g4
	prefetch	[%l7 + %g4],	 0
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%i2
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x19, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o3
	nop
	set	0x50, %i7
	stw	%i5,	[%l7 + %i7]
	nop
	set	0x62, %l3
	lduh	[%l7 + %l3],	%g2
	set	0x79, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o5
	nop
	set	0x68, %o1
	stw	%i1,	[%l7 + %o1]
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f16
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x89,	%g4
	fpsub32	%f26,	%f24,	%f14
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%o6
	fpsub16	%f4,	%f10,	%f28
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x81,	%l1
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x88,	%i6
	and	%g5,	%l2,	%i4
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x6F, %g2
	stb	%o2,	[%l7 + %g2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xca
	set	0x72, %g7
	stba	%g1,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x59, %o0
	ldub	[%l7 + %o0],	%g6
	nop
	set	0x58, %o4
	stw	%l3,	[%l7 + %o4]
	set	0x68, %i4
	swapa	[%l7 + %i4] 0x89,	%l0
	set	0x30, %i1
	stda	%g2,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x36, %o2
	sth	%o0,	[%l7 + %o2]
	ld	[%l7 + 0x0C],	%f16
	st	%f11,	[%l7 + 0x14]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x81,	%o1
	set	0x59, %l5
	stba	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%g7
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l5
	and	%i2,	%o3,	%i3
	nop
	set	0x70, %i6
	stx	%i5,	[%l7 + %i6]
	add	%g2,	%o5,	%i1
	set	0x58, %i0
	stda	%o6,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x58, %g5
	stda	%g4,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l1
	ble,a,pn	%icc,	loop_153
	nop
	set	0x40, %g6
	std	%f26,	[%l7 + %g6]
	nop
	set	0x14, %g4
	stw	%l2,	[%l7 + %g4]
	set	0x3A, %g1
	stha	%i4,	[%l7 + %g1] 0xeb
	membar	#Sync
loop_153:
	nop
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x80
	fpadd16s	%f29,	%f22,	%f13
	add	%g5,	%l4,	%l6
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%g0
	st	%fsr,	[%l7 + 0x34]
	st	%f23,	[%l7 + 0x78]
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%g6
	or	%l3,	%l0,	%o2
	nop
	set	0x18, %o7
	ldub	[%l7 + %o7],	%o0
	set	0x40, %o1
	stxa	%g3,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	add	%i0,	%i6,	%g7
	fpadd32s	%f9,	%f23,	%f19
	add	%o1,	%o7,	%l5
	bgu,a,pt	%icc,	loop_154
	nop
	set	0x14, %i7
	stw	%i2,	[%l7 + %i7]
	add	%o3,	%o4,	%i5
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f16
loop_154:
	nop
	set	0x2F, %g3
	ldub	[%l7 + %g3],	%g2
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x68, %i5
	stxa	%o5,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x30, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x66, %g2
	sth	%i1,	[%l7 + %g2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g4
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x88,	%i6
	nop
	set	0x0C, %i2
	stb	%l1,	[%l7 + %i2]
	wr	%i3,	%l2,	%set_softint
	st	%fsr,	[%l7 + 0x38]
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x89,	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%l6
	nop
	set	0x67, %o4
	ldsb	[%l7 + %o4],	%g1
	nop
	set	0x68, %i4
	std	%l4,	[%l7 + %i4]
	set	0x39, %g7
	stba	%l3,	[%l7 + %g7] 0x80
	nop
	set	0x10, %o2
	swap	[%l7 + %o2],	%g6
	set	0x20, %i3
	swapa	[%l7 + %i3] 0x80,	%o2
	nop
	set	0x60, %i1
	lduw	[%l7 + %i1],	%l0
	set	0x54, %o6
	lda	[%l7 + %o6] 0x89,	%f6
	nop
	set	0x17, %l5
	ldsb	[%l7 + %l5],	%o0
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i0
	nop
	set	0x58, %g5
	stx	%g7,	[%l7 + %g5]
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x68, %g6
	sta	%f5,	[%l7 + %g6] 0x89
	nop
	set	0x08, %g4
	std	%f12,	[%l7 + %g4]
	and	%o1,	%l5,	%o7
	nop
	set	0x54, %l4
	swap	[%l7 + %l4],	%o3
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x80,	 0
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x80,	%o4
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%g2
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%i4
	bgu,a,pn	%xcc,	loop_155
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%i1
	nop
	set	0x3C, %i7
	lduw	[%l7 + %i7],	%o5
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%o6
loop_155:
	st	%fsr,	[%l7 + 0x2C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%l1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l2
	set	0x60, %g3
	ldda	[%l7 + %g3] 0xe2,	%g4
	wr	%i4,	%l6,	%sys_tick
	set	0x1C, %l1
	stwa	%i3,	[%l7 + %l1] 0x81
	fpadd16s	%f7,	%f30,	%f25
	nop
	set	0x40, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x10, %l0
	stx	%l4,	[%l7 + %l0]
	set	0x6C, %o3
	stha	%l3,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x78, %g2
	ldsw	[%l7 + %g2],	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l0
	wr	%o2,	%o0,	%sys_tick
	nop
	set	0x50, %i2
	stb	%g3,	[%l7 + %i2]
	nop
	set	0x10, %l6
	ldstub	[%l7 + %l6],	%i6
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f16
	set	0x5E, %i4
	stha	%i0,	[%l7 + %i4] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%g7
	nop
	set	0x20, %g7
	std	%o6,	[%l7 + %g7]
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x89,	%o3
	nop
	set	0x23, %i3
	ldsb	[%l7 + %i3],	%i2
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%o4
	nop
	set	0x55, %o0
	ldstub	[%l7 + %o0],	%l5
	nop
	set	0x72, %o6
	ldub	[%l7 + %o6],	%g2
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x89,	%i5
	ld	[%l7 + 0x50],	%f24
	and	%o5,	%i1,	%g4
	nop
	set	0x7E, %i6
	sth	%o6,	[%l7 + %i6]
	set	0x78, %g5
	stda	%i6,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x88,	%l2
	nop
	set	0x10, %g4
	std	%f30,	[%l7 + %g4]
	and	%l1,	%i4,	%g5
	nop
	set	0x20, %l4
	stw	%l6,	[%l7 + %l4]
	nop
	set	0x60, %o5
	stx	%l4,	[%l7 + %o5]
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f4
	nop
	set	0x6B, %g1
	stb	%i3,	[%l7 + %g1]
	set	0x78, %l3
	stda	%g6,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	nop
	set	0x4C, %i7
	stw	%l0,	[%l7 + %i7]
	nop
	set	0x2D, %l2
	ldstub	[%l7 + %l2],	%l3
	and	%o0,	%g3,	%o2
	and	%i0,	%i6,	%g7
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x81,	%o7
	nop
	set	0x14, %l1
	stw	%o1,	[%l7 + %l1]
	nop
	set	0x34, %i5
	stb	%o3,	[%l7 + %i5]
	nop
	set	0x10, %l0
	std	%o4,	[%l7 + %l0]
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%i2
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x80,	%l5
	nop
	set	0x0F, %o3
	ldstub	[%l7 + %o3],	%g2
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%i4
	be,a	%xcc,	loop_156
	and	%o5,	%i1,	%o6
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x89,	%i7
loop_156:
	nop
	set	0x18, %i2
	prefetch	[%l7 + %i2],	 1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%g4
	and	%i4,	%g5,	%l6
	set	0x08, %i4
	swapa	[%l7 + %i4] 0x88,	%l4
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x80,	%l1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%i3
	nop
	set	0x67, %o2
	stb	%l0,	[%l7 + %o2]
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x88,	%f12
	set	0x5C, %o0
	stwa	%l3,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%o0
	nop
	set	0x21, %o6
	ldstub	[%l7 + %o6],	%g1
	st	%fsr,	[%l7 + 0x24]
	set	0x50, %i6
	swapa	[%l7 + %i6] 0x88,	%g3
	set	0x28, %l5
	stda	%o2,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x3E, %g5
	stha	%i6,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x2C, %g6
	stha	%g7,	[%l7 + %g6] 0x81
	nop
	set	0x66, %l4
	ldstub	[%l7 + %l4],	%o7
	nop
	set	0x3F, %o5
	ldsb	[%l7 + %o5],	%i0
	wr	%o3,	%o4,	%y
	nop
	set	0x5E, %g4
	sth	%i2,	[%l7 + %g4]
	nop
	set	0x12, %g1
	stb	%o1,	[%l7 + %g1]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe2,	%g2
	nop
	set	0x27, %o7
	stb	%i5,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x39, %i7
	ldsb	[%l7 + %i7],	%l5
	nop
	set	0x68, %i0
	std	%i0,	[%l7 + %i0]
	nop
	set	0x6F, %l2
	ldsb	[%l7 + %l2],	%o6
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%o4
	set	0x6E, %i5
	stha	%i7,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x76, %l0
	stha	%g4,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x08, %l1
	stxa	%i4,	[%l7 + %l1] 0x80
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x89,	 2
	set	0x68, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l2
	and	%l4,	%l1,	%l6
	and	%i3,	%g6,	%l0
	set	0x20, %i2
	stda	%o0,	[%l7 + %i2] 0x88
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%g1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1280
!	Type a   	: 30
!	Type cti   	: 23
!	Type x   	: 537
!	Type f   	: 35
!	Type i   	: 95
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
	set	0x4,	%g1
	set	0xC,	%g2
	set	0x1,	%g3
	set	0x9,	%g4
	set	0x8,	%g5
	set	0x0,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xF,	%i1
	set	-0x6,	%i2
	set	-0x2,	%i3
	set	-0xA,	%i4
	set	-0xC,	%i5
	set	-0x3,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x1BAF0E82,	%l0
	set	0x1FC88CD6,	%l1
	set	0x20D18085,	%l2
	set	0x29A40D0C,	%l3
	set	0x34A9E010,	%l4
	set	0x24DF18BE,	%l5
	set	0x159D8B67,	%l6
	!# Output registers
	set	-0x19A6,	%o0
	set	0x0D7D,	%o1
	set	0x1CC2,	%o2
	set	-0x0A8B,	%o3
	set	0x1B17,	%o4
	set	-0x1777,	%o5
	set	0x1226,	%o6
	set	0x1C5E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9055F3994858E369)
	INIT_TH_FP_REG(%l7,%f2,0x4FA9A9DFB46840DA)
	INIT_TH_FP_REG(%l7,%f4,0x923028F5BBB4C1DC)
	INIT_TH_FP_REG(%l7,%f6,0x625CA558BD058D3A)
	INIT_TH_FP_REG(%l7,%f8,0x9C8079C9ADFD26A2)
	INIT_TH_FP_REG(%l7,%f10,0xF018D8EB22C62E65)
	INIT_TH_FP_REG(%l7,%f12,0xF13CFC686F8780B2)
	INIT_TH_FP_REG(%l7,%f14,0x32551DC9E5ECE0F0)
	INIT_TH_FP_REG(%l7,%f16,0x2DE9674456CB43FE)
	INIT_TH_FP_REG(%l7,%f18,0xD8D648C7ACD35FF8)
	INIT_TH_FP_REG(%l7,%f20,0xC209454364063509)
	INIT_TH_FP_REG(%l7,%f22,0x396D559D69EAC0A3)
	INIT_TH_FP_REG(%l7,%f24,0x896658C1A1307F3E)
	INIT_TH_FP_REG(%l7,%f26,0xF6C90F717C2865D0)
	INIT_TH_FP_REG(%l7,%f28,0xA7BB8C277260C0F8)
	INIT_TH_FP_REG(%l7,%f30,0xFDA42C88317238BE)

	!# Execute Main Diag ..

	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f8
	set	0x49, %o2
	stba	%g3,	[%l7 + %o2] 0x81
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x89,	%o2
	nop
	set	0x66, %i4
	ldsb	[%l7 + %i4],	%i6
	set	0x5C, %i3
	lda	[%l7 + %i3] 0x89,	%f31
	nop
	set	0x08, %o0
	std	%g6,	[%l7 + %o0]
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%o6
	set	0x70, %o6
	stwa	%l3,	[%l7 + %o6] 0x88
	set	0x18, %l5
	stwa	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x0F, %g5
	ldub	[%l7 + %g5],	%o3
	nop
	set	0x10, %g6
	std	%f6,	[%l7 + %g6]
	nop
	set	0x40, %l4
	swap	[%l7 + %l4],	%o4
	nop
	set	0x1C, %o5
	lduw	[%l7 + %o5],	%o1
	wr	%i2,	%g2,	%clear_softint
	set	0x7C, %g1
	sta	%f8,	[%l7 + %g1] 0x80
	or	%i5,	%l5,	%o6
	set	0x64, %g4
	stha	%o5,	[%l7 + %g4] 0x80
	and	%i1,	%g4,	%i4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f16
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%g5
	or	%i7,	%l4,	%l1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l6
	ld	[%l7 + 0x68],	%f1
	st	%f1,	[%l7 + 0x1C]
	nop
	set	0x24, %l3
	prefetch	[%l7 + %l3],	 0
	and	%i3,	%g6,	%l0
	set	0x7B, %o1
	stba	%o0,	[%l7 + %o1] 0x89
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x10, %l0
	ldsw	[%l7 + %l0],	%g1
	set	0x20, %l2
	stda	%o2,	[%l7 + %l2] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f0
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%i6
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xe2,	%g2
	fpsub16s	%f19,	%f23,	%f10
	wr	%o7,	%g7,	%ccr
	set	0x10, %l1
	sta	%f20,	[%l7 + %l1] 0x89
	st	%fsr,	[%l7 + 0x54]
	and	%i0,	%o3,	%o4
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x60, %o4
	stw	%o1,	[%l7 + %o4]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%i2
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%i5
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f6
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%l5
	set	0x30, %i2
	lda	[%l7 + %i2] 0x88,	%f12
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x80,	%g2
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f6
	and	%o5,	%o6,	%i1
	nop
	set	0x40, %i4
	stx	%g4,	[%l7 + %i4]
	nop
	set	0x28, %o0
	std	%f30,	[%l7 + %o0]
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x80,	%g5
	set	0x6B, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i7
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%l4
	nop
	set	0x38, %g6
	lduw	[%l7 + %g6],	%i4
	set	0x5C, %l4
	swapa	[%l7 + %l4] 0x81,	%l1
	nop
	set	0x32, %o5
	lduh	[%l7 + %o5],	%l2
	set	0x38, %g5
	stha	%l6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x5C, %g1
	swap	[%l7 + %g1],	%g6
	nop
	set	0x70, %g4
	stb	%l0,	[%l7 + %g4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g1
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	wr	%o0,	%i6,	%sys_tick
	set	0x38, %i7
	stwa	%o2,	[%l7 + %i7] 0x81
	set	0x4A, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o7
	nop
	set	0x34, %l3
	ldstub	[%l7 + %l3],	%g7
	ld	[%l7 + 0x08],	%f21
	nop
	set	0x28, %o1
	lduh	[%l7 + %o1],	%i0
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x60, %l0
	stxa	%o3,	[%l7 + %l0] 0xeb
	membar	#Sync
	bleu	%icc,	loop_157
	nop
	set	0x38, %g2
	std	%o4,	[%l7 + %g2]
	set	0x48, %g3
	stwa	%g3,	[%l7 + %g3] 0x88
loop_157:
	nop
	set	0x10, %l2
	ldsh	[%l7 + %l2],	%l3
	nop
	set	0x4C, %l6
	stb	%i2,	[%l7 + %l6]
	nop
	set	0x5C, %o4
	ldub	[%l7 + %o4],	%i5
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%o0
	nop
	set	0x10, %g7
	std	%g2,	[%l7 + %g7]
	set	0x68, %l1
	stxa	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x28, %o2
	stw	%l5,	[%l7 + %o2]
	set	0x08, %i2
	stda	%o6,	[%l7 + %i2] 0x88
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%g5
	nop
	set	0x08, %i1
	prefetch	[%l7 + %i1],	 2
	ld	[%l7 + 0x74],	%f28
	set	0x20, %i3
	stxa	%i7,	[%l7 + %i3] 0x81
	nop
	set	0x38, %i4
	lduw	[%l7 + %i4],	%g4
	nop
	set	0x39, %o0
	stb	%l4,	[%l7 + %o0]
	st	%f21,	[%l7 + 0x50]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xe2,	%l0
	set	0x7C, %l5
	sta	%f15,	[%l7 + %l5] 0x80
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x1C, %o6
	stw	%i4,	[%l7 + %o6]
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f2
	nop
	set	0x68, %g5
	std	%f16,	[%l7 + %g5]
	set	0x50, %g1
	stha	%l6,	[%l7 + %g1] 0x89
	set	0x44, %g4
	stwa	%l2,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x08, %l4
	stha	%g6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x58, %i7
	std	%i2,	[%l7 + %i7]
	nop
	set	0x4A, %i0
	ldsh	[%l7 + %i0],	%l0
	nop
	set	0x14, %o7
	lduh	[%l7 + %o7],	%g1
	nop
	set	0x18, %l3
	lduh	[%l7 + %l3],	%o0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o2
	set	0x66, %o1
	stha	%g7,	[%l7 + %o1] 0x80
	nop
	set	0x14, %i5
	stb	%i0,	[%l7 + %i5]
	set	0x6E, %l0
	stba	%o3,	[%l7 + %l0] 0xea
	membar	#Sync
	or	%o7,	%g3,	%o4
	nop
	set	0x4D, %g2
	ldstub	[%l7 + %g2],	%i2
	or	%i5,	%l3,	%g2
	set	0x2C, %g3
	stha	%o5,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	nop
	set	0x24, %o4
	ldsw	[%l7 + %o4],	%l5
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x88,	%o0
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x81,	 3
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%i1
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x88,	%i6
	ld	[%l7 + 0x30],	%f9
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%g5
	set	0x10, %i1
	stha	%g4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x1C, %i2
	ldsh	[%l7 + %i2],	%l1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l6
	bl,a	%xcc,	loop_158
	and	%i4,	%l2,	%g6
	set	0x60, %i4
	lda	[%l7 + %i4] 0x80,	%f27
loop_158:
	nop
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x81,	 4
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g0
	or	%o0,	%l0,	%i6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf8
	membar	#Sync
	nop
	set	0x44, %o6
	lduh	[%l7 + %o6],	%g7
	set	0x64, %g6
	sta	%f31,	[%l7 + %g6] 0x81
	set	0x18, %g5
	stwa	%i0,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x52, %g1
	ldub	[%l7 + %g1],	%o2
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf9
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x68, %l4
	lduw	[%l7 + %l4],	%o3
	nop
	set	0x5A, %i7
	ldsb	[%l7 + %i7],	%o7
	set	0x18, %i0
	ldstuba	[%l7 + %i0] 0x81,	%g3
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x68, %g4
	ldxa	[%l7 + %g4] 0x88,	%i2
	set	0x76, %o1
	stba	%i5,	[%l7 + %o1] 0x81
	nop
	set	0x0A, %i5
	sth	%o4,	[%l7 + %i5]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	or	%g2,	%o5,	%l3
	nop
	set	0x50, %l0
	std	%f16,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x30, %g2
	stw	%l5,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x60]
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%i1
	add	%i7,	%o1,	%g5
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%g4
	nop
	set	0x64, %o4
	sth	%l4,	[%l7 + %o4]
	st	%f29,	[%l7 + 0x38]
	set	0x58, %o3
	sta	%f4,	[%l7 + %o3] 0x81
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x80
	add	%l6,	%l1,	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%g6
	nop
	set	0x28, %o2
	lduw	[%l7 + %o2],	%g1
	set	0x30, %l6
	ldxa	[%l7 + %l6] 0x88,	%o0
	set	0x79, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l0
	nop
	set	0x34, %i1
	lduh	[%l7 + %i1],	%i3
	nop
	set	0x54, %i2
	stw	%i6,	[%l7 + %i2]
	set	0x40, %i3
	stwa	%i0,	[%l7 + %i3] 0x80
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x89,	 2
	st	%f31,	[%l7 + 0x20]
	nop
	set	0x6C, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x80,	%o2
	bl,a,pt	%icc,	loop_159
	nop
	set	0x2C, %i4
	lduw	[%l7 + %i4],	%o3
	bne,a	%icc,	loop_160
	st	%fsr,	[%l7 + 0x18]
loop_159:
	nop
	set	0x58, %o6
	stxa	%g3,	[%l7 + %o6] 0xeb
	membar	#Sync
loop_160:
	nop
	set	0x74, %g6
	stw	%o7,	[%l7 + %g6]
	and	%i5,	%i2,	%o4
	set	0x60, %g1
	lda	[%l7 + %g1] 0x88,	%f1
	st	%fsr,	[%l7 + 0x4C]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%g2
	nop
	set	0x20, %o5
	ldsw	[%l7 + %o5],	%l5
	or	%o6,	%l3,	%i7
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x80
	wr	%i1,	%o1,	%pic
	nop
	set	0x08, %i7
	prefetch	[%l7 + %i7],	 1
	st	%f28,	[%l7 + 0x0C]
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x89,	 2
	ld	[%l7 + 0x44],	%f31
	nop
	set	0x6F, %o7
	ldsb	[%l7 + %o7],	%l4
	nop
	set	0x28, %g4
	stx	%g4,	[%l7 + %g4]
	nop
	set	0x64, %l4
	ldub	[%l7 + %l4],	%l1
	nop
	set	0x44, %o1
	stb	%l6,	[%l7 + %o1]
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f20
	ld	[%l7 + 0x1C],	%f3
	add	%i4,	%g6,	%g1
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%o0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd2
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x88
	nop
	set	0x28, %o3
	lduw	[%l7 + %o3],	%l0
	nop
	set	0x4B, %g7
	stb	%i3,	[%l7 + %g7]
	set	0x60, %o4
	lda	[%l7 + %o4] 0x81,	%f1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD49, 	%tick_cmpr
	set	0x30, %l6
	lda	[%l7 + %l6] 0x80,	%f23
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	or	%i0,	%o2,	%o3
	nop
	set	0x30, %i1
	stx	%g7,	[%l7 + %i1]
	ld	[%l7 + 0x0C],	%f18
	add	%g3,	%o7,	%i2
	nop
	set	0x60, %o2
	ldsw	[%l7 + %o2],	%i5
	nop
	set	0x30, %i3
	std	%f16,	[%l7 + %i3]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xda
	nop
	set	0x24, %i2
	ldsw	[%l7 + %i2],	%o4
	fpsub16	%f30,	%f8,	%f4
	set	0x20, %o0
	stxa	%g2,	[%l7 + %o0] 0x81
	set	0x18, %i4
	stwa	%o5,	[%l7 + %i4] 0x89
	nop
	set	0x69, %o6
	ldsb	[%l7 + %o6],	%l5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f0
	nop
	set	0x1E, %l5
	ldstub	[%l7 + %l5],	%l3
	set	0x24, %o5
	stwa	%i7,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%o6
	nop
	set	0x64, %i7
	prefetch	[%l7 + %i7],	 4
	st	%f5,	[%l7 + 0x18]
	nop
	set	0x30, %i0
	stw	%o1,	[%l7 + %i0]
	nop
	set	0x38, %g5
	std	%i0,	[%l7 + %g5]
	ld	[%l7 + 0x20],	%f30
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd2
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x88
	nop
	set	0x76, %l4
	lduh	[%l7 + %l4],	%l4
	nop
	set	0x2C, %o1
	stw	%g5,	[%l7 + %o1]
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xea,	%l0
	nop
	set	0x68, %i5
	ldsw	[%l7 + %i5],	%l6
	nop
	set	0x41, %l2
	ldsb	[%l7 + %l2],	%g4
	set	0x10, %l0
	stha	%i4,	[%l7 + %l0] 0x80
	set	0x10, %g2
	stda	%g0,	[%l7 + %g2] 0x81
	st	%f21,	[%l7 + 0x5C]
	st	%f5,	[%l7 + 0x78]
	or	%o0,	%g6,	%l0
	set	0x50, %o3
	sta	%f18,	[%l7 + %o3] 0x89
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%i3
	nop
	set	0x4C, %g7
	stw	%l2,	[%l7 + %g7]
	nop
	set	0x18, %l6
	prefetch	[%l7 + %l6],	 4
	set	0x55, %l1
	stba	%i6,	[%l7 + %l1] 0x88
	st	%f1,	[%l7 + 0x14]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x681, 	%sys_tick_cmpr
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%o3,	%g3,	%o7
	ld	[%l7 + 0x2C],	%f16
	nop
	set	0x1C, %i3
	stw	%g7,	[%l7 + %i3]
	or	%i2,	%i5,	%g2
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x81,	%o5
	nop
	set	0x30, %i2
	std	%l4,	[%l7 + %i2]
	nop
	set	0x4A, %o0
	sth	%l3,	[%l7 + %o0]
	set	0x78, %i6
	lda	[%l7 + %i6] 0x89,	%f27
	set	0x48, %o6
	stda	%o4,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x2C, %i4
	ldsw	[%l7 + %i4],	%o6
	nop
	set	0x68, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%i7
	nop
	set	0x3C, %g1
	ldstub	[%l7 + %g1],	%g5
	nop
	set	0x58, %o5
	stx	%l4,	[%l7 + %o5]
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x88,	%l6
	set	0x45, %i0
	stba	%g4,	[%l7 + %i0] 0x89
	set	0x12, %g4
	stha	%i4,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x5F, %g5
	ldub	[%l7 + %g5],	%g1
	set	0x14, %l4
	stba	%l1,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x08, %o1
	sta	%f5,	[%l7 + %o1] 0x81
	nop
	set	0x32, %l3
	sth	%o0,	[%l7 + %l3]
	nop
	set	0x48, %o7
	ldsh	[%l7 + %o7],	%g6
	nop
	set	0x41, %i5
	ldstub	[%l7 + %i5],	%l0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf8
	membar	#Sync
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x81,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i6
	nop
	set	0x70, %l0
	ldsh	[%l7 + %l0],	%o2
	nop
	set	0x6C, %o3
	ldsw	[%l7 + %o3],	%i0
	st	%f10,	[%l7 + 0x30]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f16
	set	0x24, %l6
	sta	%f18,	[%l7 + %l6] 0x88
	nop
	set	0x68, %l1
	std	%f14,	[%l7 + %l1]
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x88,	%g3
	nop
	set	0x19, %o4
	ldstub	[%l7 + %o4],	%o3
	set	0x38, %i3
	lda	[%l7 + %i3] 0x81,	%f29
	wr	%g7,	%o7,	%sys_tick
	set	0x48, %i2
	stda	%i4,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x20, %o0
	lduw	[%l7 + %o0],	%g2
	ble,pn	%xcc,	loop_161
	nop
	set	0x20, %i6
	ldsw	[%l7 + %i6],	%o5
	nop
	set	0x09, %o2
	ldsb	[%l7 + %o2],	%i2
	or	%l3,	%l5,	%o6
loop_161:
	nop
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x89
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%o4
	nop
	set	0x28, %l5
	ldsw	[%l7 + %l5],	%o1
	set	0x6E, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i1
	set	0x20, %o5
	ldda	[%l7 + %o5] 0xe2,	%i6
	nop
	set	0x3A, %i7
	ldsb	[%l7 + %i7],	%g5
	set	0x4C, %i0
	sta	%f30,	[%l7 + %i0] 0x81
	set	0x78, %g1
	stwa	%l6,	[%l7 + %g1] 0xea
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g4
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x81,	%i4
	nop
	set	0x20, %g5
	stx	%l1,	[%l7 + %g5]
	nop
	set	0x39, %l4
	ldstub	[%l7 + %l4],	%g1
	and	%o0,	%g6,	%l0
	and	%l2,	%i3,	%i6
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%o2
	nop
	set	0x2C, %i5
	lduw	[%l7 + %i5],	%i0
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd2,	%f0
	ld	[%l7 + 0x30],	%f21
	add	%g3,	%g7,	%o7
	nop
	nop
	setx	0xDC0D6B64FEE644A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x40CBD2167ED11DCA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f4,	%f30
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x81,	%i5
	nop
	set	0x26, %o3
	ldsb	[%l7 + %o3],	%o3
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x7A, %g7
	sth	%o5,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x20]
	fpadd32s	%f5,	%f13,	%f3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g2
	nop
	set	0x35, %l6
	ldub	[%l7 + %l6],	%l5
	set	0x5A, %g3
	stha	%o6,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x68, %i1
	lduw	[%l7 + %i1],	%l3
	ld	[%l7 + 0x6C],	%f0
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%o4
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x81,	%o0
	set	0x70, %i2
	stda	%i6,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x30, %l1
	stxa	%g5,	[%l7 + %l1] 0x89
	nop
	set	0x28, %i6
	stw	%l6,	[%l7 + %i6]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%l4
	fpadd16s	%f16,	%f19,	%f3
	nop
	set	0x7C, %i4
	ldsw	[%l7 + %i4],	%i1
	nop
	set	0x18, %g6
	stx	%i4,	[%l7 + %g6]
	set	0x38, %o5
	stda	%l0,	[%l7 + %o5] 0x89
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%g4
	nop
	set	0x7C, %l5
	ldstub	[%l7 + %l5],	%o0
	set	0x31, %i0
	stba	%g6,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xeb,	%g0
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f16
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%l0
	nop
	set	0x50, %g5
	std	%i2,	[%l7 + %g5]
	set	0x44, %l4
	sta	%f22,	[%l7 + %l4] 0x80
	nop
	set	0x0A, %l3
	lduh	[%l7 + %l3],	%i6
	wr	%i0,	%g3,	%set_softint
	wr	%o2,	%g7,	%pic
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%o7
	nop
	set	0x2C, %l2
	swap	[%l7 + %l2],	%o3
	nop
	set	0x38, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	nop
	set	0x18, %g2
	std	%f10,	[%l7 + %g2]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f16
	st	%f7,	[%l7 + 0x50]
	nop
	set	0x14, %g7
	lduw	[%l7 + %g7],	%i2
	nop
	set	0x25, %o3
	ldub	[%l7 + %o3],	%g2
	set	0x18, %l6
	stxa	%l5,	[%l7 + %l6] 0x88
	ld	[%l7 + 0x0C],	%f4
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%o4
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%o6
	set	0x08, %i2
	stda	%o4,	[%l7 + %i2] 0x81
	ld	[%l7 + 0x58],	%f5
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%l3
	set	0x14, %o4
	lda	[%l7 + %o4] 0x88,	%f24
	set	0x47, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o1
	st	%f28,	[%l7 + 0x7C]
	set	0x6C, %o0
	stwa	%i7,	[%l7 + %o0] 0x81
	and	%g5,	%l4,	%i1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f16
	nop
	set	0x58, %o2
	swap	[%l7 + %o2],	%i4
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%i6
	set	0x58, %o5
	stha	%g4,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x58, %i4
	stxa	%l1,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x5F, %l5
	ldsb	[%l7 + %l5],	%g6
	bn,a,pt	%icc,	loop_162
	nop
	set	0x60, %i0
	std	%o0,	[%l7 + %i0]
	nop
	set	0x30, %i7
	sth	%l2,	[%l7 + %i7]
	set	0x12, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g1
loop_162:
	or	%i3,	%l0,	%i6
	set	0x4C, %g5
	stwa	%i0,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x1C, %g1
	ldsw	[%l7 + %g1],	%g3
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%g6
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x81,	%o7
	nop
	set	0x78, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x38, %l2
	std	%o2,	[%l7 + %l2]
	nop
	set	0x12, %o7
	ldstub	[%l7 + %o7],	%i5
	set	0x50, %g2
	stda	%i2,	[%l7 + %g2] 0x80
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x40, %i5
	lduw	[%l7 + %i5],	%g2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o5
	set	0x38, %l0
	swapa	[%l7 + %l0] 0x80,	%o6
	and	%o3,	%l3,	%o1
	nop
	set	0x24, %o3
	ldsh	[%l7 + %o3],	%o4
	set	0x08, %l6
	stba	%i7,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f0
	st	%f31,	[%l7 + 0x34]
	set	0x60, %g3
	sta	%f27,	[%l7 + %g3] 0x80
	nop
	set	0x68, %i3
	lduh	[%l7 + %i3],	%g5
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%l4
	ld	[%l7 + 0x68],	%f13
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f16
	set	0x19, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i4
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x80,	%i1
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x1C]
	or	%g4,	%l6,	%l1
	ld	[%l7 + 0x0C],	%f24
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x78, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x14, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l2
	nop
	set	0x16, %o6
	sth	%g1,	[%l7 + %o6]
	set	0x1A, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i3
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%g6
	st	%f18,	[%l7 + 0x7C]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	bge,pn	%xcc,	loop_163
	and	%l0,	%i6,	%i0
	nop
	set	0x11, %i7
	ldub	[%l7 + %i7],	%g7
	set	0x18, %g4
	stda	%g2,	[%l7 + %g4] 0xea
	membar	#Sync
loop_163:
	nop
	set	0x18, %g5
	stwa	%o2,	[%l7 + %g5] 0x88
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x80,	%i5
	nop
	set	0x09, %l3
	stb	%i2,	[%l7 + %l3]
	add	%g2,	%l5,	%o5
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%o6
	nop
	set	0x5C, %o1
	lduw	[%l7 + %o1],	%o3
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f28
	nop
	set	0x40, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x18, %l0
	stw	%l3,	[%l7 + %l0]
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%o7,	%o4,	%o1
	nop
	set	0x50, %l6
	std	%f6,	[%l7 + %l6]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%l4
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%i4
	bne,a,pt	%xcc,	loop_164
	add	%g5,	%i1,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%o0
loop_164:
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f8
	nop
	set	0x78, %g3
	std	%l2,	[%l7 + %g3]
	set	0x22, %i2
	stba	%l1,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x88,	 3
	add	%i3,	%g6,	%l0
	nop
	set	0x1C, %l1
	prefetch	[%l7 + %l1],	 0
	and	%i6,	%g7,	%g3
	set	0x40, %i1
	lda	[%l7 + %i1] 0x80,	%f11
	nop
	set	0x40, %o4
	stx	%o2,	[%l7 + %o4]
	nop
	set	0x0A, %i6
	sth	%i0,	[%l7 + %i6]
	set	0x78, %o0
	stwa	%i5,	[%l7 + %o0] 0x80
	nop
	set	0x40, %o2
	std	%g2,	[%l7 + %o2]
	nop
	set	0x5A, %o6
	sth	%i2,	[%l7 + %o6]
	nop
	set	0x23, %g6
	stb	%o5,	[%l7 + %g6]
	st	%f13,	[%l7 + 0x54]
	set	0x10, %i4
	lda	[%l7 + %i4] 0x80,	%f19
	set	0x58, %o5
	stwa	%o6,	[%l7 + %o5] 0xe3
	membar	#Sync
	st	%f1,	[%l7 + 0x1C]
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%o2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%l5
	set	0x10, %i7
	stxa	%o4,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x50, %l5
	stw	%o7,	[%l7 + %l5]
	set	0x2C, %g4
	sta	%f10,	[%l7 + %g4] 0x89
	set	0x62, %g5
	stba	%o1,	[%l7 + %g5] 0x80
	nop
	set	0x3C, %g1
	stb	%l4,	[%l7 + %g1]
	set	0x1C, %l4
	sta	%f1,	[%l7 + %l4] 0x81
	fpadd32s	%f15,	%f23,	%f28
	or	%i7,	%i4,	%i1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	set	0x40, %l3
	stxa	%l6,	[%l7 + %l3] 0x88
	fpadd16s	%f27,	%f30,	%f27
	and	%g4,	%g5,	%l2
	nop
	set	0x38, %l2
	std	%o0,	[%l7 + %l2]
	nop
	set	0x12, %o7
	ldsh	[%l7 + %o7],	%g1
	nop
	set	0x0E, %l0
	sth	%i3,	[%l7 + %l0]
	add	%g6,	%l1,	%l0
	set	0x68, %g2
	stxa	%g7,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x30, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x08, %g7
	stx	%i6,	[%l7 + %g7]
	nop
	set	0x61, %l6
	ldsb	[%l7 + %l6],	%g3
	nop
	set	0x48, %o3
	std	%o2,	[%l7 + %o3]
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x88,	%i4
	nop
	set	0x1C, %i3
	lduh	[%l7 + %i3],	%g2
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x74, %l1
	swap	[%l7 + %l1],	%i0
	wr	%i2,	%o5,	%pic
	nop
	set	0x50, %i1
	std	%f30,	[%l7 + %i1]
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%o3
	nop
	set	0x61, %g3
	ldstub	[%l7 + %g3],	%l3
	bl,a,pn	%xcc,	loop_165
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%o6
	add	%o4,	%l5,	%o1
	set	0x50, %i6
	ldda	[%l7 + %i6] 0xeb,	%o6
loop_165:
	nop
	set	0x14, %o6
	stha	%l4,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x73, %o2
	ldstub	[%l7 + %o2],	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i7
	set	0x14, %i4
	sta	%f20,	[%l7 + %i4] 0x80
	nop
	set	0x5F, %g6
	ldub	[%l7 + %g6],	%g4
	nop
	set	0x3C, %i0
	stb	%g5,	[%l7 + %i0]
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%l2
	nop
	set	0x11, %l5
	ldub	[%l7 + %l5],	%l6
	nop
	set	0x50, %i7
	stb	%o0,	[%l7 + %i7]
	and	%i3,	%g6,	%g1
	ble	%xcc,	loop_166
	add	%l0,	%l1,	%i6
	nop
	set	0x74, %g5
	stb	%g3,	[%l7 + %g5]
	wr	%g7,	%i5,	%softint
loop_166:
	nop
	set	0x5C, %g4
	lduh	[%l7 + %g4],	%g2
	nop
	set	0x27, %l4
	ldstub	[%l7 + %l4],	%o2
	nop
	set	0x40, %o1
	std	%i2,	[%l7 + %o1]
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%o5
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%o3
	nop
	set	0x30, %o7
	std	%f18,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f0
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	bne,a	%xcc,	loop_167
	nop
	nop
	setx	0x28E8EDC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x62E132C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f23,	%f9
	set	0x08, %l3
	stda	%l2,	[%l7 + %l3] 0xeb
	membar	#Sync
loop_167:
	nop
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f16
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f0
	nop
	set	0x09, %o3
	ldstub	[%l7 + %o3],	%o6
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	nop
	set	0x78, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x6C, %l1
	lda	[%l7 + %l1] 0x80,	%f18
	st	%fsr,	[%l7 + 0x08]
	set	0x14, %l6
	swapa	[%l7 + %l6] 0x89,	%o4
	set	0x6C, %i1
	sta	%f31,	[%l7 + %i1] 0x81
	nop
	set	0x68, %o4
	stx	%l5,	[%l7 + %o4]
	st	%f22,	[%l7 + 0x34]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i0
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%l4
	st	%fsr,	[%l7 + 0x7C]
	set	0x0C, %o0
	sta	%f0,	[%l7 + %o0] 0x89
	or	%i4,	%o7,	%i1
	st	%f8,	[%l7 + 0x64]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	st	%fsr,	[%l7 + 0x78]
	set	0x66, %i6
	stha	%g4,	[%l7 + %i6] 0x88
	set	0x78, %o2
	stda	%i6,	[%l7 + %o2] 0x81
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	set	0x54, %i4
	stwa	%l2,	[%l7 + %i4] 0x89
	add	%o0,	%l6,	%i3
	set	0x0A, %l5
	stba	%g6,	[%l7 + %l5] 0x88
	add	%g1,	%l0,	%l1
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%i6
	nop
	set	0x6C, %g5
	stw	%g7,	[%l7 + %g5]
	nop
	set	0x28, %g4
	std	%f0,	[%l7 + %g4]
	nop
	set	0x70, %l4
	stx	%g3,	[%l7 + %l4]
	nop
	set	0x14, %o1
	ldsw	[%l7 + %o1],	%i5
	nop
	set	0x34, %i7
	ldsh	[%l7 + %i7],	%g2
	nop
	set	0x68, %l2
	sth	%o2,	[%l7 + %l2]
	nop
	set	0x5E, %g1
	ldsh	[%l7 + %g1],	%o5
	set	0x10, %o7
	ldxa	[%l7 + %o7] 0x81,	%i2
	nop
	set	0x74, %l0
	stw	%o3,	[%l7 + %l0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%o4
	or	%l5,	%o1,	%o6
	nop
	set	0x3C, %g2
	ldsh	[%l7 + %g2],	%l4
	nop
	set	0x1C, %l3
	lduh	[%l7 + %l3],	%i4
	nop
	set	0x68, %i5
	lduw	[%l7 + %i5],	%o7
	nop
	set	0x32, %o3
	ldsb	[%l7 + %o3],	%i1
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%g4
	ld	[%l7 + 0x70],	%f5
	nop
	set	0x40, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f10
	bl,pt	%icc,	loop_168
	nop
	set	0x60, %l1
	stw	%i0,	[%l7 + %l1]
	nop
	set	0x30, %i1
	std	%g4,	[%l7 + %i1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%i7
loop_168:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o0
	nop
	set	0x4D, %o4
	ldstub	[%l7 + %o4],	%i3
	ba,pt	%icc,	loop_169
	st	%f22,	[%l7 + 0x28]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g6
loop_169:
	add	%l1,	%i6,	%l0
	nop
	set	0x2E, %l6
	stb	%g3,	[%l7 + %l6]
	set	0x44, %g3
	sta	%f3,	[%l7 + %g3] 0x80
	fpsub32	%f0,	%f12,	%f24
	set	0x50, %o6
	stda	%g6,	[%l7 + %o6] 0x80
	set	0x44, %i6
	stwa	%i5,	[%l7 + %i6] 0x89
	and	%o2,	%o5,	%g2
	add	%i2,	%o3,	%l3
	ld	[%l7 + 0x0C],	%f25
	nop
	set	0x74, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x53, %o0
	ldsb	[%l7 + %o0],	%l5
	set	0x30, %i0
	ldxa	[%l7 + %i0] 0x88,	%o1
	set	0x58, %i4
	stda	%o6,	[%l7 + %i4] 0x88
	nop
	set	0x4E, %g6
	ldsh	[%l7 + %g6],	%l4
	st	%f30,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x2C]
	or	%i4,	%o7,	%i1
	nop
	set	0x68, %l5
	std	%f20,	[%l7 + %l5]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%o4
	wr	%i0,	%g5,	%pic
	nop
	set	0x0C, %g5
	ldub	[%l7 + %g5],	%i7
	set	0x58, %g4
	stda	%i6,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x7C, %l4
	stb	%o0,	[%l7 + %l4]
	nop
	set	0x3C, %o1
	ldub	[%l7 + %o1],	%i3
	nop
	set	0x5C, %i7
	sth	%g1,	[%l7 + %i7]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	set	0x50, %g1
	stda	%g6,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x7C, %o5
	swapa	[%l7 + %o5] 0x81,	%l1
	set	0x38, %l0
	stxa	%l2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x65, %o7
	ldsb	[%l7 + %o7],	%l0
	fpadd16s	%f25,	%f7,	%f7
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x89,	%g2
	set	0x58, %i5
	stxa	%g7,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x0E, %l3
	lduh	[%l7 + %l3],	%i6
	set	0x24, %i2
	sta	%f4,	[%l7 + %i2] 0x88
	nop
	set	0x38, %i3
	stx	%o2,	[%l7 + %i3]
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%i5
	nop
	set	0x41, %l1
	ldsb	[%l7 + %l1],	%o5
	nop
	set	0x40, %o3
	ldsb	[%l7 + %o3],	%g2
	fpsub32s	%f29,	%f7,	%f1
	nop
	set	0x3E, %o4
	ldsh	[%l7 + %o4],	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l5
	bn,a	%xcc,	loop_170
	nop
	set	0x10, %l6
	ldsh	[%l7 + %l6],	%l3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f0
loop_170:
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%o1
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%o6
	st	%f9,	[%l7 + 0x50]
	nop
	set	0x74, %g3
	stw	%l4,	[%l7 + %g3]
	nop
	set	0x24, %o2
	lduh	[%l7 + %o2],	%i4
	ld	[%l7 + 0x70],	%f18
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%f4
	set	0x18, %i4
	stxa	%o7,	[%l7 + %i4] 0x89
	set	0x7C, %g6
	stha	%g4,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x74, %i0
	swap	[%l7 + %i0],	%i1
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%o4
	nop
	set	0x08, %g4
	std	%f24,	[%l7 + %g4]
	nop
	set	0x11, %l5
	stb	%i0,	[%l7 + %l5]
	ld	[%l7 + 0x54],	%f5
	and	%g5,	%i7,	%o0
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f28
	set	0x7E, %l4
	stha	%l6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	nop
	setx	0x80D42AD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x6C009AC5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f23,	%f0
	set	0x08, %g1
	swapa	[%l7 + %g1] 0x89,	%g1
	set	0x10, %l2
	stwa	%i3,	[%l7 + %l2] 0x89
	nop
	set	0x1B, %l0
	stb	%g6,	[%l7 + %l0]
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f0
	be	%xcc,	loop_171
	nop
	set	0x40, %o5
	std	%f30,	[%l7 + %o5]
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x88,	%l2
loop_171:
	fpadd16	%f2,	%f14,	%f26
	nop
	set	0x20, %l3
	swap	[%l7 + %l3],	%l0
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x89,	%l1
	nop
	set	0x0C, %i5
	sth	%g3,	[%l7 + %i5]
	set	0x1C, %g7
	lda	[%l7 + %g7] 0x88,	%f3
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%i6
	st	%f9,	[%l7 + 0x20]
	nop
	set	0x10, %o3
	ldx	[%l7 + %o3],	%g7
	wr	%o2,	%i5,	%softint
	set	0x70, %i3
	stda	%o4,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x58, %l6
	ldsh	[%l7 + %l6],	%g2
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	nop
	set	0x2E, %o6
	ldub	[%l7 + %o6],	%i2
	and	%o3,	%l5,	%l3
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%o6
	nop
	set	0x0C, %g3
	lduw	[%l7 + %g3],	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%o1
	nop
	set	0x7C, %i6
	swap	[%l7 + %i6],	%g4
	st	%fsr,	[%l7 + 0x2C]
	or	%i1,	%o7,	%i0
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%o4
	st	%f18,	[%l7 + 0x0C]
	nop
	set	0x2E, %o0
	stb	%g5,	[%l7 + %o0]
	nop
	set	0x18, %g6
	ldstub	[%l7 + %g6],	%o0
	set	0x7A, %i4
	stha	%l6,	[%l7 + %i4] 0x80
	ld	[%l7 + 0x50],	%f16
	nop
	set	0x4C, %i0
	ldsb	[%l7 + %i0],	%g1
	wr	%i7,	%i3,	%ccr
	nop
	set	0x7E, %g4
	ldsh	[%l7 + %g4],	%g6
	nop
	set	0x2A, %g5
	ldsh	[%l7 + %g5],	%l0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	set	0x24, %o1
	stwa	%l1,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x89
	and	%g3,	%i6,	%l2
	st	%fsr,	[%l7 + 0x08]
	ld	[%l7 + 0x74],	%f23
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%g7
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x88,	%i5
	nop
	set	0x3C, %l2
	swap	[%l7 + %l2],	%o5
	nop
	set	0x60, %o7
	stx	%o2,	[%l7 + %o7]
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x81,	%g2
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	set	0x64, %g2
	swapa	[%l7 + %g2] 0x88,	%i2
	nop
	set	0x22, %l3
	stb	%l5,	[%l7 + %l3]
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x81,	%o6
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	and	%l4,	%i4,	%l3
	and	%g4,	%o1,	%i1
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x2F, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i0
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x81,	%g4
	and	%o0,	%l6,	%g1
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	or	%i7,	%o4,	%i3
	set	0x63, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g6
	set	0x48, %o6
	stxa	%l0,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x22, %g3
	ldsb	[%l7 + %g3],	%l1
	nop
	set	0x50, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%l2
	nop
	set	0x50, %o2
	ldub	[%l7 + %o2],	%g7
	nop
	set	0x32, %o0
	sth	%i5,	[%l7 + %o0]
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x81,	%g3
	nop
	set	0x28, %i4
	std	%f16,	[%l7 + %i4]
	st	%f14,	[%l7 + 0x5C]
	nop
	set	0x0C, %g6
	prefetch	[%l7 + %g6],	 0
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%i2
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%l5
	nop
	set	0x23, %i0
	stb	%o3,	[%l7 + %i0]
	add	%l4,	%o6,	%l3
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f4
	add	%g4,	%i4,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%o1
	nop
	set	0x69, %g5
	ldub	[%l7 + %g5],	%i0
	nop
	set	0x20, %l4
	lduw	[%l7 + %l4],	%g5
	nop
	set	0x30, %g1
	ldsw	[%l7 + %g1],	%o0
	set	0x38, %o1
	stwa	%g1,	[%l7 + %o1] 0x89
	nop
	set	0x50, %l2
	std	%f26,	[%l7 + %l2]
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%i7
	set	0x1E, %i7
	stha	%o4,	[%l7 + %i7] 0x80
	nop
	set	0x16, %o5
	ldsb	[%l7 + %o5],	%i3
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f6
	st	%f6,	[%l7 + 0x24]
	set	0x60, %l0
	ldxa	[%l7 + %l0] 0x88,	%l6
	bge,a,pn	%icc,	loop_172
	nop
	set	0x40, %i5
	swap	[%l7 + %i5],	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%l0
loop_172:
	nop
	set	0x0C, %l3
	swap	[%l7 + %l3],	%i6
	nop
	set	0x72, %i2
	ldub	[%l7 + %i2],	%l2
	ld	[%l7 + 0x68],	%f5
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%g6
	set	0x16, %l1
	stba	%i5,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x2A, %l6
	stha	%g3,	[%l7 + %l6] 0x81
	ld	[%l7 + 0x20],	%f8
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x80,	 4
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%g2
	st	%f30,	[%l7 + 0x18]
	set	0x12, %g3
	stha	%i2,	[%l7 + %g3] 0x89
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%l5
	nop
	set	0x50, %o2
	std	%o2,	[%l7 + %o2]
	set	0x36, %o0
	stha	%l4,	[%l7 + %o0] 0x88
	nop
	set	0x60, %i6
	ldx	[%l7 + %i6],	%o6
	nop
	set	0x70, %o6
	sth	%l3,	[%l7 + %o6]
	set	0x18, %i4
	lda	[%l7 + %i4] 0x88,	%f6
	st	%fsr,	[%l7 + 0x44]
	st	%f19,	[%l7 + 0x64]
	set	0x0C, %g4
	swapa	[%l7 + %g4] 0x81,	%o5
	or	%i4,	%g4,	%o7
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x81
	set	0x10, %g6
	stxa	%o1,	[%l7 + %g6] 0x81
	add	%i1,	%g5,	%i0
	nop
	set	0x20, %l5
	swap	[%l7 + %l5],	%o0
	nop
	set	0x50, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x74, %g1
	stha	%g1,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x78, %g5
	swap	[%l7 + %g5],	%o4
	ld	[%l7 + 0x58],	%f6
	nop
	set	0x40, %o1
	lduh	[%l7 + %o1],	%i7
	set	0x6A, %l2
	stha	%i3,	[%l7 + %l2] 0xea
	membar	#Sync
	and	%l6,	%l1,	%g6
	nop
	set	0x41, %o7
	ldub	[%l7 + %o7],	%l0
	nop
	set	0x64, %i7
	ldsb	[%l7 + %i7],	%i6
	set	0x6D, %g2
	stba	%l2,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x18, %l0
	stx	%g7,	[%l7 + %l0]
	nop
	set	0x64, %i5
	stw	%g3,	[%l7 + %i5]
	nop
	set	0x76, %o5
	stb	%o2,	[%l7 + %o5]
	nop
	set	0x30, %l3
	lduh	[%l7 + %l3],	%i5
	nop
	set	0x20, %i2
	ldsh	[%l7 + %i2],	%g2
	set	0x50, %l1
	stxa	%i2,	[%l7 + %l1] 0x81
	nop
	set	0x56, %g7
	stb	%o3,	[%l7 + %g7]
	nop
	set	0x5E, %i3
	ldstub	[%l7 + %i3],	%l4
	set	0x78, %l6
	stda	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x10, %o3
	swapa	[%l7 + %o3] 0x89,	%o6
	and	%o5,	%l3,	%g4
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x58, %i1
	stx	%i4,	[%l7 + %i1]
	wr	%o7,	%o1,	%pic
	set	0x30, %o4
	stxa	%g5,	[%l7 + %o4] 0x88
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%o0
	add	%i1,	%g1,	%o4
	nop
	set	0x28, %g3
	stx	%i3,	[%l7 + %g3]
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x80,	 2
	nop
	set	0x42, %i6
	ldstub	[%l7 + %i6],	%l1
	add	%l6,	%g6,	%l0
	st	%f30,	[%l7 + 0x14]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	nop
	set	0x3D, %o6
	stb	%l2,	[%l7 + %o6]
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%i6
	nop
	set	0x2C, %i0
	ldsw	[%l7 + %i0],	%g7
	nop
	set	0x48, %g4
	std	%g2,	[%l7 + %g4]
	nop
	set	0x44, %l5
	prefetch	[%l7 + %l5],	 4
	ld	[%l7 + 0x50],	%f11
	st	%f8,	[%l7 + 0x2C]
	set	0x26, %g6
	stba	%o2,	[%l7 + %g6] 0x89
	nop
	set	0x6A, %g1
	ldsb	[%l7 + %g1],	%g2
	nop
	set	0x74, %l4
	lduw	[%l7 + %l4],	%i5
	set	0x10, %o1
	stwa	%i2,	[%l7 + %o1] 0x80
	set	0x08, %l2
	stwa	%l4,	[%l7 + %l2] 0xea
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%l5
	ld	[%l7 + 0x08],	%f16
	set	0x50, %g5
	sta	%f0,	[%l7 + %g5] 0x80
	nop
	set	0x38, %i7
	std	%f20,	[%l7 + %i7]
	nop
	set	0x72, %g2
	lduh	[%l7 + %g2],	%o6
	nop
	set	0x78, %l0
	stx	%l3,	[%l7 + %l0]
	nop
	set	0x6A, %i5
	ldub	[%l7 + %i5],	%o5
	set	0x48, %o5
	stwa	%g4,	[%l7 + %o5] 0x88
	nop
	set	0x78, %l3
	std	%f30,	[%l7 + %l3]
	set	0x44, %o7
	stba	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f16
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
	ld	[%l7 + 0x4C],	%f23
	set	0x40, %i3
	sta	%f18,	[%l7 + %i3] 0x88
	bne,pt	%xcc,	loop_173
	nop
	set	0x11, %l6
	ldsb	[%l7 + %l6],	%o7
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f16
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
loop_173:
	nop
	set	0x30, %o4
	std	%g4,	[%l7 + %o4]
	nop
	set	0x11, %o3
	ldstub	[%l7 + %o3],	%o1
	bgu	%icc,	loop_174
	or	%o0,	%i0,	%i1
	nop
	set	0x34, %g3
	prefetch	[%l7 + %g3],	 2
	st	%f26,	[%l7 + 0x24]
loop_174:
	nop
	set	0x58, %o2
	lduw	[%l7 + %o2],	%g1
	nop
	set	0x5E, %o0
	ldstub	[%l7 + %o0],	%i3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%i7
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%i6
	add	%l1,	%l0,	%l2
	set	0x32, %i6
	stba	%g6,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x34, %i0
	lduw	[%l7 + %i0],	%g7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o2
	nop
	set	0x5C, %g4
	ldstub	[%l7 + %g4],	%g2
	or	%i5,	%i2,	%l4
	set	0x6C, %l5
	stha	%g3,	[%l7 + %l5] 0x81
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f0
	nop
	set	0x20, %i4
	lduh	[%l7 + %i4],	%o3
	set	0x40, %g1
	stwa	%o6,	[%l7 + %g1] 0x89
	set	0x3B, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l3
	set	0x68, %l4
	lda	[%l7 + %l4] 0x88,	%f14
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%o5
	and	%g4,	%l5,	%i4
	nop
	nop
	setx	0x2482C41C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x0214A0A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f1,	%f3
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%o7
	nop
	nop
	setx	0xF9F0589C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC430E453,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f19,	%f14
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f22
	bg	%icc,	loop_175
	and	%o1,	%g5,	%o0
	nop
	set	0x4D, %g2
	ldsb	[%l7 + %g2],	%i0
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x80,	 4
loop_175:
	nop
	set	0x10, %l0
	stx	%g1,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x58]
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x81,	%i3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%l6
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%l1
	nop
	set	0x78, %o5
	std	%f10,	[%l7 + %o5]
	set	0x08, %i2
	stda	%l0,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x64, %l1
	ldub	[%l7 + %l1],	%l2
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x89,	%o4
	nop
	set	0x3C, %i3
	stb	%g7,	[%l7 + %i3]
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f26
	nop
	set	0x64, %o4
	stw	%g6,	[%l7 + %o4]
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%i6,	%o2,	%g2
	set	0x68, %g3
	ldxa	[%l7 + %g3] 0x80,	%i2
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x89,	%f30
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x89,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%g3
	wr	%o3,	%l3,	%ccr
	nop
	set	0x44, %o2
	stb	%o5,	[%l7 + %o2]
	nop
	set	0x58, %i6
	std	%o6,	[%l7 + %i6]
	set	0x3B, %i0
	stba	%l5,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x6D, %o6
	stb	%i4,	[%l7 + %o6]
	fpadd32	%f28,	%f30,	%f24
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%g4
	nop
	set	0x48, %g6
	stx	%o1,	[%l7 + %g6]
	set	0x35, %l5
	ldstuba	[%l7 + %l5] 0x89,	%o0
	nop
	set	0x40, %g1
	stx	%i0,	[%l7 + %g1]
	set	0x5C, %i4
	stwa	%i1,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x89,	%g5
	set	0x44, %o1
	swapa	[%l7 + %o1] 0x80,	%g1
	set	0x50, %i7
	ldda	[%l7 + %i7] 0xe3,	%i6
	set	0x20, %l2
	ldda	[%l7 + %l2] 0xea,	%i2
	and	%l6,	%l0,	%l1
	st	%f26,	[%l7 + 0x1C]
	nop
	set	0x1C, %g5
	stw	%l2,	[%l7 + %g5]
	add	%g7,	%o4,	%g6
	st	%f26,	[%l7 + 0x68]
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%o2
	nop
	set	0x70, %i5
	lduw	[%l7 + %i5],	%g2
	fpsub16	%f26,	%f2,	%f18
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	st	%f20,	[%l7 + 0x10]
	set	0x1C, %o7
	stwa	%i6,	[%l7 + %o7] 0x81
	nop
	set	0x18, %o5
	swap	[%l7 + %o5],	%l4
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x88,	%i5
	and	%g3,	%l3,	%o3
	nop
	set	0x28, %l1
	stx	%o6,	[%l7 + %l1]
	nop
	set	0x48, %l6
	std	%l4,	[%l7 + %l6]
	nop
	set	0x3A, %i3
	lduh	[%l7 + %i3],	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%g4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf1
	membar	#Sync
	nop
	set	0x40, %o4
	stw	%o7,	[%l7 + %o4]
	nop
	set	0x4D, %o3
	ldsb	[%l7 + %o3],	%o1
	nop
	set	0x18, %g7
	ldsw	[%l7 + %g7],	%o0
	nop
	set	0x20, %g3
	ldsw	[%l7 + %g3],	%i0
	nop
	set	0x75, %o0
	ldstub	[%l7 + %o0],	%g5
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%g1
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%i1
	nop
	set	0x08, %i1
	std	%f14,	[%l7 + %i1]
	set	0x6C, %o6
	lda	[%l7 + %o6] 0x88,	%f26
	st	%fsr,	[%l7 + 0x40]
	set	0x3C, %i0
	stwa	%i7,	[%l7 + %i0] 0x81
	nop
	set	0x10, %g6
	stx	%i3,	[%l7 + %g6]
	nop
	set	0x2E, %g4
	stb	%l0,	[%l7 + %g4]
	nop
	set	0x48, %l5
	std	%i6,	[%l7 + %l5]
	set	0x60, %i4
	lda	[%l7 + %i4] 0x81,	%f31
	nop
	set	0x69, %g1
	stb	%l2,	[%l7 + %g1]
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%o4
	set	0x4C, %l2
	stwa	%g7,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%o2,	%g2,	%g6
	nop
	set	0x60, %g5
	stw	%i6,	[%l7 + %g5]
	nop
	set	0x58, %o1
	std	%i2,	[%l7 + %o1]
	add	%i5,	%l4,	%l3
	st	%f6,	[%l7 + 0x14]
	nop
	set	0x40, %g2
	std	%o2,	[%l7 + %g2]
	nop
	set	0x58, %i5
	stw	%o6,	[%l7 + %i5]
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%l5
	add	%g3,	%o5,	%g4
	set	0x0C, %o5
	sta	%f25,	[%l7 + %o5] 0x89
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x81,	%o7
	set	0x64, %l3
	lda	[%l7 + %l3] 0x81,	%f19
	bg,pt	%xcc,	loop_176
	add	%i4,	%o1,	%o0
	st	%f14,	[%l7 + 0x0C]
	nop
	set	0x72, %l6
	ldstub	[%l7 + %l6],	%i0
loop_176:
	nop
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xc0
	nop
	set	0x46, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%i1
	nop
	set	0x08, %o3
	ldub	[%l7 + %o3],	%g5
	set	0x46, %i2
	stha	%i3,	[%l7 + %i2] 0x88
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f28
	nop
	set	0x14, %o0
	ldsh	[%l7 + %o0],	%i7
	nop
	set	0x36, %o2
	ldub	[%l7 + %o2],	%l0
	add	%l6,	%l1,	%l2
	nop
	set	0x16, %i6
	ldsh	[%l7 + %i6],	%g7
	nop
	set	0x72, %i1
	stb	%o2,	[%l7 + %i1]
	nop
	set	0x28, %g7
	lduh	[%l7 + %g7],	%o4
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f0
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x81,	%g6
	set	0x20, %i0
	stwa	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x58, %g4
	stda	%i6,	[%l7 + %g4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x24]
	add	%i5,	%l4,	%l3
	nop
	set	0x13, %i4
	ldsb	[%l7 + %i4],	%o3
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x58, %l5
	sta	%f4,	[%l7 + %l5] 0x88
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x80,	 3
	set	0x44, %l2
	sta	%f29,	[%l7 + %l2] 0x89
	nop
	set	0x40, %g5
	stx	%l5,	[%l7 + %g5]
	nop
	set	0x45, %o1
	ldub	[%l7 + %o1],	%o6
	nop
	set	0x10, %i7
	std	%f28,	[%l7 + %i7]
	st	%f4,	[%l7 + 0x58]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%o5
	set	0x10, %i5
	stha	%g4,	[%l7 + %i5] 0x88
	nop
	set	0x2C, %g2
	ldub	[%l7 + %g2],	%o7
	set	0x3C, %o5
	swapa	[%l7 + %o5] 0x81,	%o1
	nop
	set	0x64, %o7
	prefetch	[%l7 + %o7],	 1
	and	%o0,	%i4,	%g1
	nop
	set	0x34, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x20, %l3
	stwa	%i1,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	ld	[%l7 + 0x10],	%f28
	fpsub16	%f24,	%f10,	%f6
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	nop
	set	0x10, %i3
	std	%g4,	[%l7 + %i3]
	nop
	set	0x18, %o4
	ldsb	[%l7 + %o4],	%l0
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	ld	[%l7 + 0x4C],	%f19
	nop
	set	0x48, %i2
	stx	%l1,	[%l7 + %i2]
	set	0x2C, %g3
	stwa	%l2,	[%l7 + %g3] 0x81
	set	0x11, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g7
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x80,	%i6
	nop
	set	0x14, %i1
	ldsh	[%l7 + %i1],	%o2
	nop
	set	0x30, %g7
	stx	%g6,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f0
	nop
	set	0x6E, %g6
	ldsh	[%l7 + %g6],	%o4
	nop
	set	0x40, %i0
	stx	%i6,	[%l7 + %i0]
	set	0x78, %o6
	stwa	%g2,	[%l7 + %o6] 0x89
	add	%l4,	%l3,	%i5
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%i2
	nop
	set	0x4A, %g1
	ldub	[%l7 + %g1],	%o3
	nop
	set	0x60, %g4
	ldsh	[%l7 + %g4],	%o6
	nop
	set	0x53, %l5
	ldub	[%l7 + %l5],	%l5
	nop
	set	0x7C, %l4
	prefetch	[%l7 + %l4],	 4
	and	%g3,	%g4,	%o7
	nop
	set	0x3E, %l2
	sth	%o5,	[%l7 + %l2]
	nop
	set	0x44, %g5
	stw	%o1,	[%l7 + %g5]
	nop
	set	0x78, %i7
	std	%f18,	[%l7 + %i7]
	wr	%o0,	%i4,	%pic
	fpadd16s	%f30,	%f29,	%f4
	nop
	set	0x57, %o1
	stb	%g1,	[%l7 + %o1]
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%i0
	set	0x1B, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i1
	nop
	set	0x26, %o5
	stb	%g5,	[%l7 + %o5]
	set	0x46, %o7
	stba	%l0,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x1A, %l0
	ldstub	[%l7 + %l0],	%i3
	nop
	set	0x7A, %l1
	sth	%l1,	[%l7 + %l1]
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%l2
	set	0x5E, %i3
	stha	%i7,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x30, %l6
	std	%g6,	[%l7 + %l6]
	nop
	set	0x26, %o3
	ldsb	[%l7 + %o3],	%o2
	nop
	set	0x28, %o4
	std	%g6,	[%l7 + %o4]
	add	%l6,	%o4,	%i6
	nop
	set	0x21, %g3
	stb	%g2,	[%l7 + %g3]
	set	0x08, %o0
	swapa	[%l7 + %o0] 0x80,	%l4
	set	0x43, %i2
	stba	%i5,	[%l7 + %i2] 0x88
	add	%l3,	%o3,	%o6
	nop
	set	0x30, %i1
	swap	[%l7 + %i1],	%i2
	nop
	set	0x71, %g7
	ldsb	[%l7 + %g7],	%l5
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x18, %o2
	stx	%g3,	[%l7 + %o2]
	wr	%g4,	%o7,	%pic
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x5C, %i0
	stb	%o5,	[%l7 + %i0]
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x81,	 0
	set	0x68, %g6
	stxa	%o1,	[%l7 + %g6] 0x81
	or	%g1,	%i4,	%i1
	and	%i0,	%g5,	%l0
	nop
	set	0x68, %i4
	stx	%l1,	[%l7 + %i4]
	set	0x60, %g4
	swapa	[%l7 + %g4] 0x81,	%i3
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%l2
	set	0x34, %l5
	swapa	[%l7 + %l5] 0x81,	%o2
	nop
	set	0x6B, %l4
	ldsb	[%l7 + %l4],	%g6
	nop
	set	0x4A, %l2
	ldstub	[%l7 + %l2],	%l6
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xe3,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x946, 	%tick_cmpr
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x88,	%l4
	nop
	set	0x2A, %i7
	sth	%i5,	[%l7 + %i7]
	ld	[%l7 + 0x48],	%f9
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc4
	add	%l3,	%o3,	%i2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f0
	st	%f26,	[%l7 + 0x18]
	nop
	set	0x6E, %o5
	ldub	[%l7 + %o5],	%l5
	nop
	set	0x74, %l0
	ldsb	[%l7 + %l0],	%g3
	nop
	set	0x5A, %l1
	lduh	[%l7 + %l1],	%g4
	nop
	set	0x48, %l3
	std	%f0,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x78]
	set	0x08, %o7
	stwa	%o7,	[%l7 + %o7] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%o6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd2
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%o0
	fpadd16s	%f23,	%f0,	%f28
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f26
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x88,	%g1
	wr 	%g0, 	0x4, 	%fprs
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x81,	%i1
	nop
	set	0x28, %i2
	ldsw	[%l7 + %i2],	%i0
	nop
	set	0x60, %g3
	stx	%g5,	[%l7 + %g3]
	set	0x10, %i1
	stda	%l0,	[%l7 + %i1] 0x88
	nop
	set	0x34, %o2
	stw	%i3,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x0A, %i6
	stb	%l1,	[%l7 + %i6]
	nop
	set	0x14, %g7
	stb	%i7,	[%l7 + %g7]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x80,	%g6
	wr	%l2,	%o2,	%ccr
	nop
	set	0x6F, %g6
	stb	%g6,	[%l7 + %g6]
	nop
	set	0x30, %i0
	std	%f16,	[%l7 + %i0]
	nop
	set	0x58, %i4
	stx	%l6,	[%l7 + %i4]
	set	0x18, %g1
	swapa	[%l7 + %g1] 0x88,	%i6
	nop
	set	0x20, %l5
	stb	%o4,	[%l7 + %l5]
	add	%l4,	%i5,	%g2
	set	0x5A, %g4
	stha	%l3,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xe3,	%i2
	set	0x38, %l4
	stxa	%l5,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x5A, %g5
	stha	%g3,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x44, %o1
	lduh	[%l7 + %o1],	%o3
	add	%o7,	%o5,	%g4
	set	0x44, %g2
	lda	[%l7 + %g2] 0x81,	%f27
	nop
	set	0x54, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x46, %o5
	ldsh	[%l7 + %o5],	%g1
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x89,	%o1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%o0
	nop
	set	0x54, %l0
	ldub	[%l7 + %l0],	%i0
	nop
	set	0x18, %l3
	stw	%g5,	[%l7 + %l3]
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
	nop
	set	0x18, %l1
	stb	%i3,	[%l7 + %l1]
	nop
	set	0x4A, %l6
	lduh	[%l7 + %l6],	%l0
	nop
	set	0x7C, %o4
	lduw	[%l7 + %o4],	%l1
	set	0x50, %o3
	swapa	[%l7 + %o3] 0x80,	%g7
	nop
	set	0x16, %o0
	ldub	[%l7 + %o0],	%l2
	set	0x23, %i3
	stba	%o2,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd0
	set	0x38, %i1
	stxa	%g6,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x5F, %g3
	stba	%i7,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x08, %i6
	std	%f16,	[%l7 + %i6]
	set	0x74, %g7
	stha	%l6,	[%l7 + %g7] 0x81
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc0
	ld	[%l7 + 0x70],	%f15
	nop
	set	0x5A, %o6
	lduh	[%l7 + %o6],	%i6
	set	0x3C, %i0
	swapa	[%l7 + %i0] 0x89,	%o4
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x60, %i4
	stx	%i5,	[%l7 + %i4]
	nop
	set	0x74, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd0
	set	0x20, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	nop
	set	0x10, %l2
	sth	%l3,	[%l7 + %l2]
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%l4
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x30, %l5
	stda	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0B6, 	%sys_tick_cmpr
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x88,	%o7
	nop
	set	0x75, %i7
	ldstub	[%l7 + %i7],	%o3
	st	%f14,	[%l7 + 0x74]
	nop
	set	0x76, %o5
	lduh	[%l7 + %o5],	%g4
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o5
	nop
	set	0x44, %g2
	prefetch	[%l7 + %g2],	 1
	set	0x60, %l0
	stda	%o6,	[%l7 + %l0] 0xeb
	membar	#Sync
	be,pn	%xcc,	loop_177
	nop
	set	0x24, %l3
	ldub	[%l7 + %l3],	%g1
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f8
	nop
	set	0x78, %l6
	prefetch	[%l7 + %l6],	 3
loop_177:
	nop
	set	0x25, %l1
	ldsb	[%l7 + %l1],	%i4
	add	%o0,	%i0,	%g5
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xeb,	%i0
	set	0x2C, %o4
	lda	[%l7 + %o4] 0x80,	%f4
	nop
	set	0x46, %o0
	ldsh	[%l7 + %o0],	%i3
	nop
	set	0x26, %i2
	lduh	[%l7 + %i2],	%o1
	set	0x64, %i1
	stwa	%l0,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x81,	%g7
	ba	%icc,	loop_178
	nop
	set	0x5A, %i6
	ldub	[%l7 + %i6],	%l1
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x28, %i3
	std	%l2,	[%l7 + %i3]
loop_178:
	nop
	set	0x28, %g7
	ldsb	[%l7 + %g7],	%o2
	st	%f16,	[%l7 + 0x30]
	set	0x38, %o2
	stda	%g6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x14, %i0
	lda	[%l7 + %i0] 0x89,	%f24
	set	0x08, %i4
	stda	%i6,	[%l7 + %i4] 0x88
	fpsub16s	%f27,	%f24,	%f5
	set	0x68, %g6
	sta	%f19,	[%l7 + %g6] 0x80
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f10
	nop
	set	0x70, %o6
	stx	%fsr,	[%l7 + %o6]
	st	%f9,	[%l7 + 0x20]
	nop
	set	0x7E, %g4
	sth	%i6,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x42, %l2
	ldub	[%l7 + %l2],	%o4
	wr	%i7,	%i5,	%softint
	ld	[%l7 + 0x18],	%f3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%l3
	nop
	set	0x7C, %g5
	ldsw	[%l7 + %g5],	%l5
	and	%g3,	%l4,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%o3
	wr	%o5,	%o6,	%ccr
	nop
	set	0x5E, %l5
	stb	%g1,	[%l7 + %l5]
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x88,	%g4
	or	%i4,	%i0,	%g5
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x88,	%o0
	nop
	set	0x26, %i7
	ldstub	[%l7 + %i7],	%i3
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	nop
	set	0x40, %o5
	std	%f12,	[%l7 + %o5]
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%l1
	nop
	set	0x44, %l3
	swap	[%l7 + %l3],	%l2
	and	%o2,	%g6,	%l6
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%i5
	wr	%g2,	%l5,	%set_softint
	set	0x08, %l6
	stxa	%g3,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x40, %l1
	stx	%l3,	[%l7 + %l1]
	fpsub32	%f18,	%f0,	%f16
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x40, %o4
	std	%f28,	[%l7 + %o4]
	ld	[%l7 + 0x10],	%f31
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%o7
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	ba,a,pt	%icc,	loop_179
	fpadd16s	%f28,	%f11,	%f25
	nop
	set	0x4E, %i2
	ldstub	[%l7 + %i2],	%i2
	nop
	set	0x58, %i1
	stx	%o5,	[%l7 + %i1]
loop_179:
	nop
	set	0x2C, %i6
	swap	[%l7 + %i6],	%o6
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x89,	 1
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xe2,	%g4
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%g1
	nop
	set	0x38, %g7
	stx	%i0,	[%l7 + %g7]
	nop
	set	0x23, %i4
	ldstub	[%l7 + %i4],	%g5
	nop
	set	0x70, %i0
	std	%o0,	[%l7 + %i0]
	nop
	set	0x1E, %g6
	stb	%i3,	[%l7 + %g6]
	nop
	set	0x38, %g1
	stb	%o1,	[%l7 + %g1]
	nop
	set	0x12, %g4
	ldsh	[%l7 + %g4],	%i1
	nop
	set	0x50, %l2
	ldsh	[%l7 + %l2],	%i4
	set	0x70, %g5
	stda	%l0,	[%l7 + %g5] 0x80
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xe2,	%l2
	set	0x36, %o1
	stba	%o2,	[%l7 + %o1] 0x80
	set	0x6A, %l5
	stba	%l1,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x0C, %i7
	ldstub	[%l7 + %i7],	%g6
	set	0x60, %i5
	lda	[%l7 + %i5] 0x80,	%f14
	nop
	set	0x10, %l4
	ldsw	[%l7 + %l4],	%l6
	fpsub16s	%f13,	%f29,	%f29
	nop
	set	0x22, %o5
	stb	%g7,	[%l7 + %o5]
	nop
	set	0x6C, %l0
	swap	[%l7 + %l0],	%o4
	nop
	set	0x6D, %g2
	ldstub	[%l7 + %g2],	%i7
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x88,	%i5
	nop
	set	0x50, %l6
	std	%f8,	[%l7 + %l6]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe2,	%i6
	nop
	set	0x38, %o3
	ldsw	[%l7 + %o3],	%g2
	nop
	set	0x08, %o4
	sth	%l5,	[%l7 + %o4]
	nop
	set	0x68, %o0
	std	%g2,	[%l7 + %o0]
	be,a	%xcc,	loop_180
	nop
	set	0x60, %l3
	std	%l4,	[%l7 + %l3]
	set	0x7B, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o7
loop_180:
	nop
	set	0x30, %i6
	std	%f8,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x40]
	bne,a,pt	%icc,	loop_181
	nop
	set	0x7C, %i2
	prefetch	[%l7 + %i2],	 0
	fpadd16s	%f28,	%f29,	%f6
	add	%i2,	%l3,	%o5
loop_181:
	nop
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x89,	%o2
	set	0x4C, %o2
	ldstuba	[%l7 + %o2] 0x80,	%g4
	or	%o6,	%g1,	%g5
	ld	[%l7 + 0x44],	%f14
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x80,	%o0
	nop
	set	0x26, %g3
	sth	%i3,	[%l7 + %g3]
	nop
	set	0x54, %i0
	stw	%i0,	[%l7 + %i0]
	nop
	set	0x65, %i4
	ldsb	[%l7 + %i4],	%i1
	and	%o1,	%l0,	%i4
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%l2
	set	0x40, %g4
	stda	%l0,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x7E, %g6
	stha	%g6,	[%l7 + %g6] 0x89
	set	0x58, %g5
	stda	%i6,	[%l7 + %g5] 0xe3
	membar	#Sync
	be,pt	%icc,	loop_182
	or	%g7,	%o2,	%i7
	wr	%i5,	%i6,	%pic
	nop
	set	0x20, %o6
	std	%f26,	[%l7 + %o6]
loop_182:
	add	%g2,	%l5,	%o4
	bleu,pn	%xcc,	loop_183
	nop
	set	0x64, %o1
	sth	%g3,	[%l7 + %o1]
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%l4
	nop
	set	0x28, %l2
	stx	%o7,	[%l7 + %l2]
loop_183:
	nop
	set	0x68, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe2,	%l2
	set	0x52, %l4
	stha	%o5,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x88,	%i2
	set	0x44, %g2
	stwa	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x5C, %o7
	stb	%o3,	[%l7 + %o7]
	or	%g1,	%g5,	%o6
	nop
	set	0x37, %l6
	ldsb	[%l7 + %l6],	%o0
	nop
	set	0x45, %l1
	ldsb	[%l7 + %l1],	%i0
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x89,	%i0
	set	0x68, %o0
	stda	%o0,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x6F, %i1
	stba	%i4,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xE15C83ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB4A13782,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f25,	%f22
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
	nop
	set	0x60, %i2
	stx	%l0,	[%l7 + %i2]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	bge,pt	%xcc,	loop_184
	nop
	set	0x30, %o2
	std	%f10,	[%l7 + %o2]
	set	0x50, %l3
	swapa	[%l7 + %l3] 0x80,	%l1
loop_184:
	nop
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x80,	%g6
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x70, %i0
	sta	%f13,	[%l7 + %i0] 0x88
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x80
	set	0x20, %g1
	stha	%l6,	[%l7 + %g1] 0x88
	nop
	set	0x78, %g4
	stx	%g7,	[%l7 + %g4]
	and	%o2,	%l2,	%i7
	nop
	set	0x16, %g6
	ldstub	[%l7 + %g6],	%i6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd2
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%i4
	st	%fsr,	[%l7 + 0x58]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f0
	nop
	set	0x7C, %l2
	lduw	[%l7 + %l2],	%l5
	nop
	set	0x14, %i7
	lduw	[%l7 + %i7],	%o4
	nop
	set	0x34, %l5
	stw	%g3,	[%l7 + %l5]
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x81,	%g2
	nop
	set	0x50, %i5
	stx	%l4,	[%l7 + %i5]
	st	%f8,	[%l7 + 0x1C]
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x68, %g2
	stwa	%o7,	[%l7 + %g2] 0x81
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%i2
	nop
	set	0x50, %o7
	std	%l2,	[%l7 + %o7]
	set	0x08, %l1
	stda	%o2,	[%l7 + %l1] 0x80
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xea,	%g0
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x88,	%g4
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%o6
	nop
	set	0x2B, %o0
	ldstub	[%l7 + %o0],	%o0
	nop
	set	0x60, %i1
	ldsw	[%l7 + %i1],	%i0
	and	%g5,	%i3,	%o1
	set	0x78, %o3
	stda	%i4,	[%l7 + %o3] 0x88
	nop
	set	0x16, %i2
	ldsb	[%l7 + %i2],	%i1
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%l0
	nop
	set	0x08, %o2
	std	%l0,	[%l7 + %o2]
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%g6
	nop
	set	0x58, %i3
	stx	%g7,	[%l7 + %i3]
	nop
	set	0x6C, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x64, %g3
	sta	%f5,	[%l7 + %g3] 0x89
	set	0x28, %g1
	stda	%l2,	[%l7 + %g1] 0x81
	set	0x74, %g4
	swapa	[%l7 + %g4] 0x88,	%i7
	set	0x18, %o6
	stda	%i6,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x20, %g6
	stwa	%i5,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x81,	 1
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%i6
	set	0x70, %i7
	stda	%g2,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%o4
	st	%fsr,	[%l7 + 0x10]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l4
	fpsub32s	%f21,	%f2,	%f19
	nop
	set	0x59, %l4
	stb	%o7,	[%l7 + %l4]
	set	0x20, %l2
	sta	%f17,	[%l7 + %l2] 0x80
	bl,pt	%icc,	loop_185
	st	%fsr,	[%l7 + 0x14]
	set	0x28, %i5
	stda	%i2,	[%l7 + %i5] 0x88
loop_185:
	nop
	set	0x74, %g2
	prefetch	[%l7 + %g2],	 0
	bge,a	%xcc,	loop_186
	nop
	set	0x14, %o7
	ldub	[%l7 + %o7],	%o5
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x89,	%o2
loop_186:
	nop
	set	0x5A, %l6
	stba	%l3,	[%l7 + %l6] 0xeb
	membar	#Sync
	or	%g1,	%g4,	%o0
	set	0x4C, %l1
	stba	%i0,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x41, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g5
	set	0x44, %o0
	lda	[%l7 + %o0] 0x88,	%f25
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%o6
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x80,	%i3
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%i4
	nop
	set	0x68, %i6
	ldsb	[%l7 + %i6],	%i1
	st	%f24,	[%l7 + 0x78]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%l1
	nop
	set	0x38, %o2
	ldx	[%l7 + %o2],	%l0
	nop
	set	0x6E, %l3
	stb	%g7,	[%l7 + %l3]
	nop
	set	0x20, %g7
	ldub	[%l7 + %g7],	%g6
	fpadd32s	%f21,	%f6,	%f28
	set	0x75, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l2
	set	0x08, %i0
	stba	%o2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x68, %i2
	stx	%i7,	[%l7 + %i2]
	set	0x08, %i4
	sta	%f28,	[%l7 + %i4] 0x88
	st	%f30,	[%l7 + 0x08]
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x28, %g3
	stda	%i6,	[%l7 + %g3] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f16
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc2
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%l5
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f24
	nop
	set	0x60, %i7
	ldstub	[%l7 + %i7],	%i5
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f22
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%i6
	ld	[%l7 + 0x34],	%f28
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%o4
	st	%f8,	[%l7 + 0x54]
	nop
	set	0x28, %i5
	ldx	[%l7 + %i5],	%g2
	add	%g3,	%o7,	%l4
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%o5
	nop
	set	0x52, %o7
	sth	%i2,	[%l7 + %o7]
	nop
	set	0x10, %g2
	stx	%o3,	[%l7 + %g2]
	set	0x72, %l6
	stha	%g1,	[%l7 + %l6] 0x89
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x81,	 3
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x80,	%l3
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%o0
	or	%g5,	%i0,	%i3
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%o6
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%i0
	set	0x37, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i4
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f0
	nop
	set	0x60, %i6
	ldx	[%l7 + %i6],	%l1
	nop
	set	0x10, %o2
	stw	%o1,	[%l7 + %o2]
	and	%l0,	%g7,	%g6
	set	0x48, %g7
	swapa	[%l7 + %g7] 0x89,	%l2
	nop
	set	0x30, %i3
	std	%f2,	[%l7 + %i3]
	set	0x7F, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i7
	set	0x62, %i2
	stba	%l6,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x34, %i4
	lda	[%l7 + %i4] 0x80,	%f10
	set	0x32, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l5
	add	%o2,	%i6,	%o4
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%i4
	nop
	set	0x6D, %g4
	ldsb	[%l7 + %g4],	%g2
	set	0x60, %o6
	lda	[%l7 + %o6] 0x88,	%f12
	st	%f3,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%g3
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%o7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i2
	set	0x48, %i7
	lda	[%l7 + %i7] 0x88,	%f21
	fpsub16s	%f21,	%f26,	%f3
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x89,	 3
	nop
	set	0x10, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x6C, %l4
	swapa	[%l7 + %l4] 0x89,	%o5
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f20
	st	%f30,	[%l7 + 0x34]
	nop
	set	0x48, %l2
	std	%f20,	[%l7 + %l2]
	ld	[%l7 + 0x08],	%f25
	set	0x6C, %o7
	stha	%g1,	[%l7 + %o7] 0x81
	add	%l3,	%o0,	%g5
	set	0x14, %l6
	sta	%f8,	[%l7 + %l6] 0x89
	set	0x30, %l1
	sta	%f31,	[%l7 + %l1] 0x81
	or	%i3,	%o6,	%i0
	st	%fsr,	[%l7 + 0x78]
	set	0x2A, %g2
	stba	%i1,	[%l7 + %g2] 0x89
	nop
	set	0x18, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x7C, %o0
	stw	%l1,	[%l7 + %o0]
	nop
	set	0x49, %l0
	ldsb	[%l7 + %l0],	%o1
	nop
	set	0x24, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x4C, %o4
	swap	[%l7 + %o4],	%i4
	set	0x56, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g7
	set	0x33, %o3
	stba	%l0,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x3C, %g7
	ldub	[%l7 + %g7],	%l2
	bl,pt	%icc,	loop_187
	nop
	set	0x1A, %o2
	lduh	[%l7 + %o2],	%i7
	nop
	set	0x64, %l3
	lduw	[%l7 + %l3],	%g6
	nop
	set	0x4E, %i3
	stb	%l6,	[%l7 + %i3]
loop_187:
	nop
	set	0x10, %i4
	stx	%o2,	[%l7 + %i4]
	st	%f27,	[%l7 + 0x28]
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x88,	 4
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%i6
	fpadd32s	%f8,	%f23,	%f4
	nop
	set	0x2C, %g4
	lduh	[%l7 + %g4],	%i5
	and	%o4,	%g3,	%g2
	or	%l4,	%o7,	%o3
	st	%f21,	[%l7 + 0x20]
	st	%f5,	[%l7 + 0x08]
	nop
	set	0x0A, %o6
	ldstub	[%l7 + %o6],	%i2
	and	%g4,	%o5,	%g1
	nop
	set	0x08, %g3
	std	%l2,	[%l7 + %g3]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%i3
	set	0x68, %o1
	stxa	%g5,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x50, %i7
	lduw	[%l7 + %i7],	%o6
	set	0x44, %g1
	swapa	[%l7 + %g1] 0x88,	%i1
	nop
	set	0x6C, %g6
	ldub	[%l7 + %g6],	%l1
	nop
	set	0x78, %l4
	lduw	[%l7 + %l4],	%i0
	add	%i4,	%o1,	%g7
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x89,	%l2
	nop
	set	0x1C, %g5
	stw	%i7,	[%l7 + %g5]
	nop
	set	0x1A, %l5
	ldsh	[%l7 + %l5],	%g6
	ble,pn	%icc,	loop_188
	nop
	set	0x2C, %o7
	sth	%l0,	[%l7 + %o7]
	fpsub16s	%f2,	%f8,	%f4
	set	0x7C, %l6
	stha	%l6,	[%l7 + %l6] 0xeb
	membar	#Sync
loop_188:
	and	%o2,	%l5,	%i5
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o4
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%i6
	nop
	set	0x48, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x62, %l0
	ldsh	[%l7 + %l0],	%g3
	set	0x60, %o0
	stwa	%l4,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x80,	%f22
	nop
	set	0x08, %i6
	stw	%o7,	[%l7 + %i6]
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x20, %o3
	std	%f12,	[%l7 + %o3]
	set	0x5C, %g7
	swapa	[%l7 + %g7] 0x88,	%o3
	st	%fsr,	[%l7 + 0x38]
	set	0x3C, %o2
	stha	%i2,	[%l7 + %o2] 0x81
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x89,	 4
	set	0x34, %i4
	swapa	[%l7 + %i4] 0x89,	%g2
	nop
	set	0x6C, %i3
	stb	%o5,	[%l7 + %i3]
	nop
	set	0x70, %i2
	ldub	[%l7 + %i2],	%g1
	nop
	set	0x40, %i0
	std	%o0,	[%l7 + %i0]
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%i3
	add	%l3,	%o6,	%i1
	set	0x4C, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g5
	set	0x18, %g4
	stwa	%i0,	[%l7 + %g4] 0xe2
	membar	#Sync
	wr	%l1,	%i4,	%softint
	st	%f18,	[%l7 + 0x5C]
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%f2
	nop
	set	0x1C, %i7
	swap	[%l7 + %i7],	%g7
	nop
	set	0x40, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x70, %l4
	stha	%l2,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x58, %i5
	sta	%f15,	[%l7 + %i5] 0x80
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f22
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	set	0x1C, %l5
	sta	%f25,	[%l7 + %l5] 0x80
	nop
	set	0x46, %l6
	ldsh	[%l7 + %l6],	%o1
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%g6
	set	0x20, %g2
	swapa	[%l7 + %g2] 0x81,	%l0
	set	0x10, %o5
	stha	%l6,	[%l7 + %o5] 0xea
	membar	#Sync
	st	%f9,	[%l7 + 0x60]
	set	0x64, %l2
	stwa	%o2,	[%l7 + %l2] 0x88
	set	0x4E, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l5
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%i6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1288
!	Type a   	: 28
!	Type cti   	: 32
!	Type x   	: 506
!	Type f   	: 31
!	Type i   	: 115
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
.word 0x7A253BF1
.word 0x1C73507E
.word 0x6EC95A08
.word 0x007E2D89
.word 0x7E68E509
.word 0x04B6A9BF
.word 0x9CDF691C
.word 0x6700E4E1
.word 0x963792E2
.word 0xE4E30AD5
.word 0x04DCD481
.word 0x31B3EBC5
.word 0x9FF9F115
.word 0x37699700
.word 0x799FAAF3
.word 0x425A30D5
.word 0xD713C89A
.word 0x9AD50B33
.word 0x7CE63C0F
.word 0xB99AE4E6
.word 0xAEA520C2
.word 0xE98A93C4
.word 0x81B7273D
.word 0xD9782835
.word 0xFB4FB998
.word 0x326A1FEC
.word 0x42227AFE
.word 0xBE6A53B1
.word 0xFF842B52
.word 0x38D14019
.word 0x89FC540E
.word 0x727AF272
.word 0xC3C507A1
.word 0x7069E418
.word 0x0A827AE0
.word 0xCD21E0C6
.word 0x7C615C21
.word 0x61D95BDE
.word 0x49DCAEFF
.word 0x39D6B534
.word 0xE001BBDE
.word 0xB2CCA812
.word 0xA12EE444
.word 0x30B8C5C6
.word 0xAEE1CBD4
.word 0x77021998
.word 0x5C0FA3FA
.word 0x740C1155
.word 0x211E746C
.word 0x19EC7DD9
.word 0x5A6F376F
.word 0x0DFDF1C4
.word 0x0C6B0CFC
.word 0xDAD97D58
.word 0x48A725B0
.word 0x56E0B973
.word 0xC5CFC6D8
.word 0x198097B9
.word 0x5E6CFC46
.word 0xC090CCBA
.word 0xB4907689
.word 0x470157AA
.word 0x2C1D2D81
.word 0xBB310FF8
!! thread 1 data, 64 words.
.word 0x4647BF2A
.word 0x4A3F571D
.word 0xEA8D128F
.word 0x3CB1E408
.word 0x34032D46
.word 0x3607B5A5
.word 0xED0E9B0E
.word 0x7B99BF2F
.word 0x73619202
.word 0xDDC74B4F
.word 0xB33AE5E2
.word 0x78CDA6EE
.word 0x964DF417
.word 0xCB689749
.word 0xE8D89E6D
.word 0x6F8A71E5
.word 0x003EB6AE
.word 0x581FEF2A
.word 0xB2937377
.word 0x18F965C2
.word 0x20E6A0E1
.word 0xD2B265EC
.word 0x8D6DF9DF
.word 0x85AF38B7
.word 0xAA1DAC52
.word 0x2B103624
.word 0xEA22AA04
.word 0xC5C60420
.word 0x7A6CDAEA
.word 0x23A3FD15
.word 0x7CE0FAEB
.word 0x8B72BB20
.word 0x2645AC5D
.word 0x8102E8EA
.word 0xF0A0B710
.word 0xBF1E39A4
.word 0xC0E27D85
.word 0xA68E208A
.word 0x95A60D4E
.word 0xB34A197A
.word 0xCA297A6D
.word 0xEE2772DC
.word 0x8E7C4EB2
.word 0x5B11DA4E
.word 0x2A73A10F
.word 0x598CF2D8
.word 0x90693C1C
.word 0xE604583C
.word 0x862C6058
.word 0xE03711FF
.word 0x2E8CE637
.word 0x37D06B7F
.word 0x3C0EE1EE
.word 0x1424683E
.word 0xD2F6D895
.word 0x5F1E526D
.word 0x47BF3436
.word 0x7DF25AFA
.word 0x823833E6
.word 0xF7374760
.word 0x69C40482
.word 0x5C82C9F7
.word 0x9DCED056
.word 0xFF0D84BE
!! thread 2 data, 64 words.
.word 0x2B8A03AE
.word 0x3929B460
.word 0x6AF910DB
.word 0x6190BCC3
.word 0x14C58AE8
.word 0x6E52272A
.word 0xD81CFF05
.word 0x21DB8811
.word 0x1507AF52
.word 0x9F08CBB1
.word 0x04F9148C
.word 0xCC97F620
.word 0x53793857
.word 0x98F90869
.word 0x743CFA82
.word 0xA3AFC62D
.word 0x44CD5EC2
.word 0xF3E51806
.word 0x9135EC0A
.word 0x9ABEFF20
.word 0xC013D3FF
.word 0x57A1E3A3
.word 0xB5297A70
.word 0x0FE8D808
.word 0x632E44DD
.word 0xE0D83E2C
.word 0xF771892A
.word 0x9656FBFD
.word 0xB25DC45C
.word 0xFB6BA6E1
.word 0x83528F2F
.word 0xC30311B7
.word 0x293AA9FC
.word 0xEAC69B0B
.word 0xAAD0D0F3
.word 0xD3249336
.word 0xC9F851B0
.word 0x6CA438B4
.word 0x7DC65E2B
.word 0x0A800428
.word 0x5E03A074
.word 0x93AC58F0
.word 0xE5FD6A86
.word 0xA05DA60A
.word 0x860A859B
.word 0x6DDA0550
.word 0x8AC80CB5
.word 0x09673222
.word 0x42D72672
.word 0xE86445EC
.word 0x7608BAAB
.word 0xEC33C125
.word 0xD830B38B
.word 0xE845987D
.word 0x5901E423
.word 0x5B18D912
.word 0xC4DAC628
.word 0xD6352090
.word 0xA597F248
.word 0x496C2AD5
.word 0x2830BD3C
.word 0x1EAFDC6C
.word 0x89228D23
.word 0x19B28490
!! thread 3 data, 64 words.
.word 0xDF1504C2
.word 0xF4AE4241
.word 0x4BEB610F
.word 0x8EAD2151
.word 0x1EAB1B9C
.word 0x3102DE53
.word 0x159182B4
.word 0x10162651
.word 0x83EC1DB8
.word 0x79F16DB9
.word 0x8DEBF76F
.word 0xC64DB76F
.word 0xC4F19C5F
.word 0x2011F206
.word 0x045C8F31
.word 0x7B4BA1A1
.word 0x2994A836
.word 0xD0351989
.word 0x81370E54
.word 0xDD0ECB20
.word 0x189899E2
.word 0x7E2AB69F
.word 0x7DB948BE
.word 0xD1EE1E1F
.word 0xB110D10A
.word 0xBD2ACE74
.word 0x9BD2249F
.word 0x2D07CD62
.word 0x197A3A56
.word 0x2EBCD5FF
.word 0x07A414FA
.word 0x93EA0913
.word 0xD3A0D3E4
.word 0x3CAE2266
.word 0xAD1C4DB2
.word 0xA9697FA9
.word 0x993AF912
.word 0x03F86294
.word 0xE5923E09
.word 0x277C7276
.word 0x8ED54B86
.word 0x19BA78C3
.word 0x06FF867F
.word 0x0F3967B3
.word 0xABA563B9
.word 0xAF3A6E22
.word 0x711015C4
.word 0x446065FD
.word 0x2B9DD019
.word 0xF1B60207
.word 0x809D10D4
.word 0x15E48691
.word 0x87348B55
.word 0x55BADDB3
.word 0xAEF10642
.word 0x60C305F3
.word 0x790228FB
.word 0xA77B7463
.word 0x15E74FDE
.word 0x2A78DD01
.word 0xEDD5300A
.word 0x30A796C9
.word 0x6A5BC17B
.word 0xFF0D81A4
!! thread 4 data, 64 words.
.word 0xA76615D2
.word 0x5CB1A7F7
.word 0x19CF6A46
.word 0xC6CD72DE
.word 0xD5992469
.word 0xECDFEAEB
.word 0xBDBC8443
.word 0x9EF285F0
.word 0xDD83614F
.word 0xD166A203
.word 0x3B0F31E0
.word 0xF5D9F492
.word 0x01E6CC08
.word 0x03C79E39
.word 0x27A2935E
.word 0x6F317AB3
.word 0x247D8E64
.word 0x8AECAA12
.word 0xFDCE7AB5
.word 0x0D3785B6
.word 0x8D87EF90
.word 0x03F50FB5
.word 0x17D4BBC8
.word 0xB0D4C487
.word 0xA4ADFF84
.word 0x5C77C5AF
.word 0xC67625DC
.word 0x1362245D
.word 0x0E4F66AE
.word 0xB5B7E0C2
.word 0x473AB235
.word 0x08275705
.word 0x6126F566
.word 0xDCF666DB
.word 0x2486AF37
.word 0xB138E56B
.word 0xFB8A4F25
.word 0x34AD02F5
.word 0x2B7EAF9A
.word 0xBA77279F
.word 0xABEF3203
.word 0xFF313A6C
.word 0xB65E0766
.word 0xECCD6E5F
.word 0x5857AEBF
.word 0x7CF84BC4
.word 0x6D639BE5
.word 0x135B8611
.word 0x71736A8F
.word 0x621FD406
.word 0xC124EE4D
.word 0x42B25E3C
.word 0x537873C6
.word 0x87BE9563
.word 0x774279F8
.word 0xDF38040A
.word 0x35DA01B3
.word 0x08E67548
.word 0x724ADC0F
.word 0x0224D296
.word 0x967DCF2F
.word 0xE7F60D6B
.word 0xF7259A6F
.word 0x141A69B8
!! thread 5 data, 64 words.
.word 0x3312C1F1
.word 0xFB365F6B
.word 0xB26AD20B
.word 0x17B6E370
.word 0x5E14D933
.word 0xE5CA9A12
.word 0x8E6B5DB6
.word 0x652639CF
.word 0x72AD7EA0
.word 0xD7ADFD8C
.word 0x7B532716
.word 0xB199CC61
.word 0x2E045802
.word 0x5C02371E
.word 0xDF170035
.word 0x98407BC1
.word 0x0329A03C
.word 0xA384C810
.word 0xC5B48CE1
.word 0x5F72862D
.word 0x033856DF
.word 0x1834D484
.word 0xB4EC0D63
.word 0x08ACE804
.word 0x8413AF8B
.word 0x1BFE004C
.word 0x5CA12726
.word 0x7F60D09E
.word 0x4E9701EA
.word 0x33C298E1
.word 0x2F3CA9F2
.word 0xCCB225B1
.word 0x38F8F134
.word 0x7EDF55BA
.word 0x37C7978D
.word 0xF0BD188F
.word 0xC3C2F215
.word 0xC8DE72AB
.word 0x8DE3E721
.word 0x779D8E6E
.word 0x9F7012A0
.word 0x2929253E
.word 0x674B5BC3
.word 0x249F4309
.word 0x1F10BA8A
.word 0x8C119B60
.word 0x9ADBC3CF
.word 0x6CA3E153
.word 0x286AC64A
.word 0x8C055474
.word 0x1E65C5C2
.word 0xBB3532A6
.word 0x760A1FD3
.word 0x2FF51887
.word 0x978662CC
.word 0x2A7D724B
.word 0x318AFD8B
.word 0xD149CABD
.word 0x046330C3
.word 0xEC79D884
.word 0x6E80E755
.word 0x0E525EC3
.word 0x1B574FFF
.word 0xE2C3B7B9
!! thread 6 data, 64 words.
.word 0xAF872B58
.word 0x1A2E3AB6
.word 0xA59ADFD8
.word 0x01E8CF97
.word 0xD809A439
.word 0x5E9403B8
.word 0x6FB07085
.word 0x13499D00
.word 0x267DAA6C
.word 0x8C224F49
.word 0xA8532DAC
.word 0x2622DC5C
.word 0x9C344D3E
.word 0x474CE454
.word 0xAB146CD3
.word 0xB331B4BD
.word 0x91CFFFAC
.word 0x60CB5F95
.word 0x4BE75F5E
.word 0xC6A338A4
.word 0xCA20BDCA
.word 0x55734CC4
.word 0x1BE005A4
.word 0xD85B4A17
.word 0xB92B4036
.word 0xE7918E1C
.word 0xB27886F5
.word 0xB3104EC3
.word 0xA9F48AC5
.word 0x59508900
.word 0x795CD808
.word 0x85496518
.word 0x247760F0
.word 0xD871A75A
.word 0x880F6C7C
.word 0x0CBC7469
.word 0x458DCA21
.word 0x5673CC25
.word 0xCFBA9622
.word 0x92D51ABE
.word 0x6D13A3F3
.word 0x80B73523
.word 0xC3FC6F26
.word 0xF840521B
.word 0xAB659306
.word 0x18FD9665
.word 0x324BADCB
.word 0x643AF4F9
.word 0x0E82B68A
.word 0x34090C43
.word 0x83C7BA6D
.word 0xDA88EFE6
.word 0x616F1270
.word 0x2038A90C
.word 0xED1BB84D
.word 0x473DE50B
.word 0x15756177
.word 0x04DC1A30
.word 0x590805EF
.word 0xB986DD80
.word 0x0587171E
.word 0xE35B30EC
.word 0x35B2E0B1
.word 0x0D87051F
!! thread 7 data, 64 words.
.word 0x1FCAEAEA
.word 0x192669C3
.word 0xD610609E
.word 0x205C97C4
.word 0xF987EDA1
.word 0x02A4182B
.word 0x38A1B110
.word 0x8F80747E
.word 0x0CF27901
.word 0xF909358A
.word 0xAF1A431E
.word 0xA5F82A29
.word 0x315C4C78
.word 0xBC83687E
.word 0xD8166999
.word 0x643ECC87
.word 0x81E8E125
.word 0xF69A6FC8
.word 0x686A4F02
.word 0xEC191794
.word 0xC985E61C
.word 0xFB494FF2
.word 0x7DC2267E
.word 0x2D421249
.word 0x0084602A
.word 0x474867A4
.word 0x43C1BB8B
.word 0x9C71D1F3
.word 0xF4BEFD9D
.word 0x859DB214
.word 0x089AAC8D
.word 0x60249C9E
.word 0xC5FDB499
.word 0x9837247C
.word 0xF1C27B00
.word 0x90557500
.word 0x1010112B
.word 0x48CC38D9
.word 0x1D65B6BD
.word 0x7B7E2AF0
.word 0xF0D203DC
.word 0xD0B2B038
.word 0x76829DD2
.word 0xEF1B14D6
.word 0x443F53AD
.word 0x59729007
.word 0xF7021147
.word 0x0F935DF4
.word 0x9262D0DC
.word 0x56BDDA31
.word 0xB21C63A3
.word 0xA621BD2F
.word 0x0C5F4616
.word 0x2455DF4F
.word 0x41F7B19B
.word 0xF689E786
.word 0x4CFF199A
.word 0x830BFCAA
.word 0x1919C502
.word 0x2D1F3B89
.word 0x413A4690
.word 0x5E57AF2A
.word 0x94A24D04
.word 0x834A1B89
.end
