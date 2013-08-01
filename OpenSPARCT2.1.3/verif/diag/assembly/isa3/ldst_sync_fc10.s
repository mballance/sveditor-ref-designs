/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc10.s
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
	set	0x1,	%g2
	set	0xC,	%g3
	set	0x2,	%g4
	set	0xB,	%g5
	set	0x2,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x2,	%i1
	set	-0xB,	%i2
	set	-0xB,	%i3
	set	-0x7,	%i4
	set	-0x9,	%i5
	set	-0x7,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x1C1B4F5F,	%l0
	set	0x3FF55608,	%l1
	set	0x34FB22B0,	%l2
	set	0x226BAB06,	%l3
	set	0x4DDC38BD,	%l4
	set	0x53433A33,	%l5
	set	0x60D18071,	%l6
	!# Output registers
	set	0x00D5,	%o0
	set	-0x1BFD,	%o1
	set	-0x07EF,	%o2
	set	0x0A21,	%o3
	set	-0x1049,	%o4
	set	-0x0A33,	%o5
	set	-0x14A2,	%o6
	set	0x0CF9,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x01481286AC16B02C)
	INIT_TH_FP_REG(%l7,%f2,0x1B45CE33C995A2F4)
	INIT_TH_FP_REG(%l7,%f4,0x5E18A85568D6DE9B)
	INIT_TH_FP_REG(%l7,%f6,0x59A5910CC77D00E5)
	INIT_TH_FP_REG(%l7,%f8,0xC836DD7572A06472)
	INIT_TH_FP_REG(%l7,%f10,0x4D897B642DD0F85F)
	INIT_TH_FP_REG(%l7,%f12,0xB242544AA3D43677)
	INIT_TH_FP_REG(%l7,%f14,0x6F256B10ADCE93F8)
	INIT_TH_FP_REG(%l7,%f16,0x969FB3F7937F2B89)
	INIT_TH_FP_REG(%l7,%f18,0xB2F0CB40901CF51B)
	INIT_TH_FP_REG(%l7,%f20,0x38E76DBEB344FCDB)
	INIT_TH_FP_REG(%l7,%f22,0xF7900E28FC799F66)
	INIT_TH_FP_REG(%l7,%f24,0x705381ACB8C3A35C)
	INIT_TH_FP_REG(%l7,%f26,0x04655B7AD2CC89E6)
	INIT_TH_FP_REG(%l7,%f28,0x4BC0AAB166A86D25)
	INIT_TH_FP_REG(%l7,%f30,0xA6A39ED97B5E5B8A)

	!# Execute Main Diag ..

	nop
	set	0x1C, %g2
	sth	%l5,	[%l7 + %g2]
	nop
	set	0x3C, %g3
	lduh	[%l7 + %g3],	%i5
	ba	%icc,	loop_1
	nop
	set	0x10, %g6
	sth	%g4,	[%l7 + %g6]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%o4
	nop
	set	0x12, %l2
	lduh	[%l7 + %l2],	%o3
loop_1:
	nop
	set	0x4B, %l4
	ldstub	[%l7 + %l4],	%l1
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f16
	nop
	set	0x34, %o5
	stb	%i6,	[%l7 + %o5]
	nop
	set	0x3D, %g4
	ldsb	[%l7 + %g4],	%g1
	nop
	set	0x5C, %i4
	lduh	[%l7 + %i4],	%i7
	set	0x48, %l3
	sta	%f12,	[%l7 + %l3] 0x88
	ld	[%l7 + 0x58],	%f31
	or	%g5,	%l4,	%i0
	nop
	set	0x14, %i2
	lduw	[%l7 + %i2],	%o5
	nop
	set	0x7E, %g1
	ldub	[%l7 + %g1],	%o6
	nop
	set	0x1C, %o0
	lduw	[%l7 + %o0],	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%o2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x81
	st	%fsr,	[%l7 + 0x2C]
	ld	[%l7 + 0x7C],	%f30
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l2
	st	%f20,	[%l7 + 0x30]
	nop
	set	0x3C, %l0
	lduw	[%l7 + %l0],	%g6
	nop
	nop
	setx	0x4CCECFA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xBFE08A61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f17,	%f15
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%l3
	set	0x78, %i5
	stxa	%i3,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x58, %l6
	stwa	%l6,	[%l7 + %l6] 0x89
	nop
	set	0x30, %o4
	ldsw	[%l7 + %o4],	%o1
	ld	[%l7 + 0x58],	%f8
	set	0x6C, %l5
	sta	%f16,	[%l7 + %l5] 0x81
	set	0x1C, %g7
	stha	%l0,	[%l7 + %g7] 0xea
	membar	#Sync
	ld	[%l7 + 0x14],	%f10
	set	0x34, %o1
	stwa	%i2,	[%l7 + %o1] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%g7
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%f10
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x80,	%i4
	nop
	set	0x10, %o2
	prefetch	[%l7 + %o2],	 4
	nop
	set	0x4C, %o3
	swap	[%l7 + %o3],	%g3
	nop
	set	0x64, %o6
	ldsh	[%l7 + %o6],	%l5
	and	%i5,	%o4,	%g4
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x88,	 2
	nop
	set	0x74, %g2
	stb	%l1,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x48, %g3
	stx	%i6,	[%l7 + %g3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x435, 	%tick_cmpr
	nop
	set	0x08, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%g5
	nop
	set	0x4A, %l4
	ldsb	[%l7 + %l4],	%l4
	nop
	nop
	setx	0xAEABBD8DE89CB015,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x289B872EA5798852,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f6,	%f22
	add	%o5,	%o6,	%o0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%i0
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%g2
	nop
	set	0x68, %g6
	std	%o2,	[%l7 + %g6]
	set	0x48, %g4
	stda	%g6,	[%l7 + %g4] 0xeb
	membar	#Sync
	bge,a	%xcc,	loop_2
	nop
	set	0x64, %o5
	ldsb	[%l7 + %o5],	%l2
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x08, %i2
	sta	%f5,	[%l7 + %i2] 0x88
loop_2:
	nop
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x89,	%l3
	set	0x50, %o0
	lda	[%l7 + %o0] 0x81,	%f20
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%l6
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x0C, %i3
	swapa	[%l7 + %i3] 0x80,	%i3
	or	%o1,	%l0,	%i1
	nop
	set	0x68, %i5
	ldsw	[%l7 + %i5],	%g7
	nop
	set	0x6A, %l6
	lduh	[%l7 + %l6],	%i2
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x89,	%i4
	add	%g3,	%l5,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%o3
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xe2,	%o4
	nop
	set	0x50, %l5
	stx	%i6,	[%l7 + %l5]
	and	%l1,	%i7,	%g1
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x81,	%l4
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x32, %i0
	ldsb	[%l7 + %i0],	%g5
	nop
	set	0x42, %g5
	ldsb	[%l7 + %g5],	%o0
	bg,pn	%icc,	loop_3
	wr	%o7,	%o6,	%set_softint
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x81,	%g2
loop_3:
	nop
	set	0x21, %o2
	stba	%o2,	[%l7 + %o2] 0x80
	nop
	set	0x65, %o6
	ldsb	[%l7 + %o6],	%g6
	nop
	set	0x60, %i1
	stx	%l2,	[%l7 + %i1]
	nop
	set	0x20, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f18
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 1
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x80,	%i0
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%l6
	nop
	set	0x30, %l2
	stx	%l3,	[%l7 + %l2]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o1
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%i1
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%g7
	set	0x18, %g6
	lda	[%l7 + %g6] 0x81,	%f9
	set	0x20, %l3
	swapa	[%l7 + %l3] 0x81,	%g3
	nop
	set	0x10, %i2
	swap	[%l7 + %i2],	%l5
	nop
	set	0x68, %g1
	stx	%i5,	[%l7 + %g1]
	set	0x58, %o5
	stda	%i4,	[%l7 + %o5] 0x88
	set	0x6A, %i4
	stha	%g4,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f0
	or	%o4,	%i6,	%l1
	set	0x28, %i3
	stxa	%o3,	[%l7 + %i3] 0x89
	ld	[%l7 + 0x18],	%f21
	set	0x08, %o0
	stwa	%i7,	[%l7 + %o0] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x30]
	set	0x54, %l6
	stwa	%g1,	[%l7 + %l6] 0x80
	nop
	set	0x78, %o4
	stx	%l4,	[%l7 + %o4]
	nop
	set	0x48, %i5
	sth	%o5,	[%l7 + %i5]
	nop
	set	0x30, %l5
	sth	%o0,	[%l7 + %l5]
	nop
	set	0x32, %l0
	ldsh	[%l7 + %l0],	%g5
	or	%o7,	%g2,	%o2
	nop
	set	0x38, %g7
	ldsw	[%l7 + %g7],	%o6
	st	%f2,	[%l7 + 0x70]
	nop
	set	0x78, %o1
	ldsh	[%l7 + %o1],	%l2
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x88,	%g6
	set	0x50, %o3
	sta	%f11,	[%l7 + %o3] 0x81
	or	%l6,	%l3,	%i3
	nop
	set	0x4C, %g5
	ldsb	[%l7 + %g5],	%o1
	nop
	set	0x2A, %o6
	stb	%i0,	[%l7 + %o6]
	nop
	set	0x54, %i1
	lduw	[%l7 + %i1],	%l0
	set	0x78, %g3
	lda	[%l7 + %g3] 0x89,	%f18
	set	0x18, %o2
	sta	%f31,	[%l7 + %o2] 0x89
	or	%i2,	%i1,	%g3
	set	0x24, %i7
	lda	[%l7 + %i7] 0x80,	%f23
	bne,pn	%icc,	loop_4
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%g7
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f8
loop_4:
	fpadd16s	%f13,	%f9,	%f24
	nop
	set	0x78, %l2
	std	%f4,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x3C, %l1
	swap	[%l7 + %l1],	%l5
	bn,a	%icc,	loop_5
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f14
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x89,	%i4
loop_5:
	nop
	set	0x26, %l3
	lduh	[%l7 + %l3],	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%i6
	nop
	set	0x5E, %i2
	ldsh	[%l7 + %i2],	%l1
	nop
	set	0x28, %g4
	std	%f2,	[%l7 + %g4]
	nop
	set	0x60, %g1
	stx	%o4,	[%l7 + %g1]
	or	%o3,	%g1,	%i7
	set	0x32, %o5
	stha	%o5,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f10
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	nop
	set	0x7E, %i4
	lduh	[%l7 + %i4],	%g5
	nop
	set	0x74, %o0
	stw	%l4,	[%l7 + %o0]
	and	%o7,	%g2,	%o2
	nop
	set	0x28, %o4
	stx	%o6,	[%l7 + %o4]
	nop
	set	0x22, %i5
	ldsb	[%l7 + %i5],	%l2
	ba,pn	%icc,	loop_6
	fpsub32	%f16,	%f28,	%f22
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%i6
	nop
	set	0x52, %l0
	stb	%g6,	[%l7 + %l0]
loop_6:
	nop
	set	0x50, %l5
	stwa	%i3,	[%l7 + %l5] 0xe3
	membar	#Sync
	fpadd16s	%f19,	%f31,	%f3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x88
	nop
	set	0x40, %i0
	stx	%l3,	[%l7 + %i0]
	nop
	set	0x22, %g7
	sth	%i0,	[%l7 + %g7]
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%o0
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xeb,	%i2
	nop
	set	0x38, %i1
	ldsb	[%l7 + %i1],	%l0
	set	0x25, %g3
	stba	%i1,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x88,	%g3
	nop
	set	0x54, %o6
	stw	%g7,	[%l7 + %o6]
	st	%f12,	[%l7 + 0x24]
	nop
	set	0x30, %i7
	std	%f28,	[%l7 + %i7]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x81
	nop
	set	0x18, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x14, %l1
	swap	[%l7 + %l1],	%l5
	nop
	nop
	setx	0xE029D728,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x9F5413E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f29,	%f16
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x88,	%i4
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%g4
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x5D, %i2
	stb	%i5,	[%l7 + %i2]
	and	%i6,	%o4,	%l1
	set	0x7C, %g6
	stba	%g1,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x6D, %g1
	ldsb	[%l7 + %g1],	%i7
	nop
	set	0x1A, %o5
	ldsb	[%l7 + %o5],	%o5
	fpadd16	%f24,	%f12,	%f16
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x88,	%o0
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf0
	membar	#Sync
	or	%o3,	%l4,	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDFB, 	%tick_cmpr
	nop
	set	0x26, %i3
	ldsh	[%l7 + %i3],	%o6
	add	%l2,	%l6,	%o2
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i2
	nop
	set	0x6C, %o4
	swap	[%l7 + %o4],	%g6
	set	0x38, %i5
	stxa	%l3,	[%l7 + %i5] 0x80
	nop
	set	0x10, %l6
	ldub	[%l7 + %l6],	%o1
	nop
	set	0x3A, %i4
	ldsh	[%l7 + %i4],	%i0
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x28, %l0
	std	%f8,	[%l7 + %l0]
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x80,	%i2
	nop
	set	0x74, %g7
	stw	%i1,	[%l7 + %g7]
	nop
	set	0x48, %o3
	stw	%l0,	[%l7 + %o3]
	set	0x40, %o1
	stda	%g2,	[%l7 + %o1] 0x88
	nop
	set	0x20, %g5
	stx	%l5,	[%l7 + %g5]
	nop
	set	0x58, %i1
	ldsb	[%l7 + %i1],	%i4
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x80,	 2
	nop
	set	0x2C, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%i4
	nop
	set	0x2C, %g2
	lduh	[%l7 + %g2],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%o4
	or	%l1,	%i7,	%o5
	nop
	set	0x44, %i7
	lduh	[%l7 + %i7],	%o0
	nop
	set	0x0C, %l1
	sth	%g1,	[%l7 + %l1]
	set	0x10, %l2
	stxa	%o3,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%o7
	set	0x24, %l3
	stwa	%l4,	[%l7 + %l3] 0xe3
	membar	#Sync
	bgu,pn	%xcc,	loop_7
	add	%o6,	%g2,	%l6
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
loop_7:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%g6
	nop
	set	0x62, %l4
	sth	%l3,	[%l7 + %l4]
	nop
	set	0x78, %g1
	ldstub	[%l7 + %g1],	%o1
	fpadd16s	%f24,	%f16,	%f18
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x88,	%i0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	set	0x4C, %g4
	lda	[%l7 + %g4] 0x80,	%f3
	nop
	set	0x14, %i3
	swap	[%l7 + %i3],	%i3
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x10, %o0
	ldx	[%l7 + %o0],	%i1
	set	0x34, %o4
	lda	[%l7 + %o4] 0x80,	%f25
	set	0x20, %i5
	ldxa	[%l7 + %i5] 0x81,	%i2
	nop
	set	0x54, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	set	0x24, %i4
	stw	%g3,	[%l7 + %i4]
	nop
	set	0x28, %i6
	std	%f18,	[%l7 + %i6]
	nop
	set	0x18, %l0
	sth	%i4,	[%l7 + %l0]
	bne,a	%icc,	loop_8
	nop
	set	0x40, %l5
	std	%g6,	[%l7 + %l5]
	nop
	set	0x34, %i0
	sth	%l5,	[%l7 + %i0]
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f2
loop_8:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f16
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xcc
	nop
	set	0x78, %i1
	std	%i4,	[%l7 + %i1]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%g4
	set	0x18, %g3
	sta	%f30,	[%l7 + %g3] 0x88
	nop
	set	0x23, %o1
	stb	%o4,	[%l7 + %o1]
	nop
	set	0x2C, %o6
	ldsb	[%l7 + %o6],	%i7
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x50, %o2
	std	%f2,	[%l7 + %o2]
	set	0x10, %o7
	stwa	%o5,	[%l7 + %o7] 0x89
	nop
	set	0x70, %i7
	swap	[%l7 + %i7],	%l1
	set	0x38, %g2
	stxa	%g1,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x32, %l2
	lduh	[%l7 + %l2],	%o0
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%g5
	set	0x18, %l3
	stxa	%o7,	[%l7 + %l3] 0x81
	nop
	set	0x18, %l4
	swap	[%l7 + %l4],	%l4
	set	0x67, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o6
	set	0x20, %g6
	stwa	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x78],	%f25
	or	%l6,	%l2,	%o3
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f14
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x89,	%g6
	st	%f7,	[%l7 + 0x14]
	or	%o2,	%o1,	%i0
	nop
	set	0x50, %i3
	lduw	[%l7 + %i3],	%i3
	st	%f21,	[%l7 + 0x68]
	nop
	set	0x78, %o0
	ldub	[%l7 + %o0],	%l3
	nop
	set	0x08, %o4
	std	%i0,	[%l7 + %o4]
	add	%i2,	%g3,	%l0
	nop
	set	0x50, %g4
	ldx	[%l7 + %g4],	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%i4
	nop
	set	0x40, %l6
	sth	%i6,	[%l7 + %l6]
	set	0x54, %i4
	lda	[%l7 + %i4] 0x89,	%f26
	or	%g4,	%i5,	%i7
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x68, %l0
	sth	%o4,	[%l7 + %l0]
	nop
	set	0x0C, %l5
	swap	[%l7 + %l5],	%g1
	set	0x40, %i0
	stxa	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	bl	%xcc,	loop_9
	nop
	set	0x22, %g7
	lduh	[%l7 + %g7],	%g5
	set	0x20, %i5
	sta	%f22,	[%l7 + %i5] 0x81
loop_9:
	nop
	set	0x18, %g5
	ldsw	[%l7 + %g5],	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%o6
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x80,	 3
	set	0x30, %g3
	stda	%o6,	[%l7 + %g3] 0xea
	membar	#Sync
	or	%l6,	%o3,	%l2
	set	0x10, %o1
	stxa	%o2,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%g6,	%o1,	%i3
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x89,	%i0
	set	0x68, %o3
	stha	%l3,	[%l7 + %o3] 0x88
	nop
	set	0x74, %o2
	ldsh	[%l7 + %o2],	%i2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%l0
	nop
	set	0x50, %o7
	std	%f4,	[%l7 + %o7]
	st	%f10,	[%l7 + 0x5C]
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe3,	%g2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	nop
	set	0x20, %l1
	stx	%g7,	[%l7 + %l1]
	ba,a,pt	%xcc,	loop_10
	nop
	set	0x1E, %l3
	ldub	[%l7 + %l3],	%l5
	st	%f21,	[%l7 + 0x64]
	set	0x60, %l4
	stxa	%i4,	[%l7 + %l4] 0xea
	membar	#Sync
loop_10:
	nop
	set	0x10, %i7
	stw	%g4,	[%l7 + %i7]
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x0D, %g6
	ldstuba	[%l7 + %g6] 0x80,	%i6
	nop
	set	0x08, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x68, %o5
	prefetch	[%l7 + %o5],	 4
	nop
	set	0x5E, %o0
	sth	%i7,	[%l7 + %o0]
	nop
	set	0x70, %o4
	std	%f26,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x64]
	add	%o5,	%i5,	%g1
	and	%l1,	%o4,	%o0
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%g5
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 1
	or	%l4,	%o6,	%g2
	set	0x34, %i6
	stha	%o7,	[%l7 + %i6] 0x88
	st	%f19,	[%l7 + 0x78]
	set	0x5F, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o3
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xe2,	%i6
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f6
	set	0x0D, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd0
	add	%g6,	%o2,	%o1
	set	0x60, %i0
	sta	%f30,	[%l7 + %i0] 0x80
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	nop
	set	0x1C, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x36, %o1
	ldub	[%l7 + %o1],	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%i3
	st	%f11,	[%l7 + 0x18]
	and	%l0,	%g3,	%g7
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x88,	%l5
	set	0x0E, %o3
	stha	%i1,	[%l7 + %o3] 0x89
	nop
	set	0x2B, %o2
	stb	%i4,	[%l7 + %o2]
	wr	%i6,	%i7,	%clear_softint
	set	0x78, %o7
	sta	%f3,	[%l7 + %o7] 0x81
	nop
	set	0x70, %g2
	std	%f10,	[%l7 + %g2]
	set	0x08, %l2
	lda	[%l7 + %l2] 0x81,	%f31
	nop
	set	0x68, %i1
	stx	%o5,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x3A, %l3
	lduh	[%l7 + %l3],	%g4
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf0
	membar	#Sync
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x89,	 2
	set	0x76, %i2
	ldstuba	[%l7 + %i2] 0x88,	%g1
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%o4
	set	0x3C, %g1
	stwa	%o0,	[%l7 + %g1] 0x89
	set	0x38, %g6
	sta	%f8,	[%l7 + %g6] 0x89
	wr	%l1,	%l4,	%sys_tick
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf8
	membar	#Sync
	nop
	set	0x54, %o4
	ldsw	[%l7 + %o4],	%g5
	set	0x60, %g4
	stxa	%g2,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x5D, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o6
	set	0x5C, %l6
	stha	%o7,	[%l7 + %l6] 0x88
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x88,	%i6
	nop
	set	0x28, %i4
	stx	%l2,	[%l7 + %i4]
	nop
	set	0x75, %l0
	stb	%g6,	[%l7 + %l0]
	nop
	set	0x46, %l5
	ldstub	[%l7 + %l5],	%o3
	set	0x20, %g7
	stda	%o2,	[%l7 + %g7] 0x81
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x3C, %i3
	stw	%o1,	[%l7 + %i3]
	set	0x70, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x88,	%l3
	set	0x6C, %g5
	stha	%i2,	[%l7 + %g5] 0x80
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f26
	nop
	set	0x78, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	nop
	nop
	setx	0x53AE541B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x6F83A9B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f11,	%f4
	set	0x78, %o3
	lda	[%l7 + %o3] 0x89,	%f9
	set	0x6C, %o7
	stha	%l0,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x5E, %l2
	lduh	[%l7 + %l2],	%i3
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc2
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x81,	 2
	nop
	set	0x30, %i7
	stx	%i1,	[%l7 + %i7]
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x80,	%i4
	or	%g7,	%i7,	%o5
	fpadd16s	%f17,	%f8,	%f1
	set	0x40, %l1
	stxa	%g4,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x58, %i2
	stxa	%i6,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%g1
	add	%i5,	%o0,	%o4
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%l1
	nop
	set	0x21, %o4
	ldsb	[%l7 + %o4],	%l4
	nop
	set	0x6D, %g4
	ldstub	[%l7 + %g4],	%g5
	nop
	set	0x7C, %o0
	ldub	[%l7 + %o0],	%g2
	ba,a	%icc,	loop_11
	nop
	set	0x5A, %l6
	lduh	[%l7 + %l6],	%o7
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x89,	%o6
loop_11:
	nop
	set	0x0C, %i6
	swap	[%l7 + %i6],	%l6
	nop
	set	0x40, %i4
	ldsh	[%l7 + %i4],	%l2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe3,	%g6
	nop
	set	0x58, %l0
	std	%o2,	[%l7 + %l0]
	set	0x28, %g7
	sta	%f21,	[%l7 + %g7] 0x80
	nop
	set	0x38, %i3
	std	%o2,	[%l7 + %i3]
	nop
	set	0x70, %i5
	stw	%o1,	[%l7 + %i5]
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x18, %g3
	std	%f24,	[%l7 + %g3]
	set	0x1E, %o1
	stba	%i0,	[%l7 + %o1] 0x88
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xea,	%i2
	set	0x54, %o2
	sta	%f2,	[%l7 + %o2] 0x80
	nop
	set	0x7C, %g5
	swap	[%l7 + %g5],	%l3
	nop
	set	0x2E, %o3
	ldsh	[%l7 + %o3],	%l0
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%i3
	nop
	set	0x58, %l3
	ldsw	[%l7 + %l3],	%i1
	set	0x77, %l4
	stba	%l5,	[%l7 + %l4] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%i7
	set	0x48, %i7
	stwa	%g7,	[%l7 + %i7] 0x80
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x2B, %l1
	stba	%o5,	[%l7 + %l1] 0x81
	nop
	set	0x10, %i1
	stb	%g4,	[%l7 + %i1]
	nop
	set	0x10, %g1
	std	%i6,	[%l7 + %g1]
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x80,	%g1
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%o0
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
	nop
	set	0x60, %o0
	std	%f4,	[%l7 + %o0]
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc8
	nop
	set	0x48, %o5
	prefetch	[%l7 + %o5],	 0
	bgu,a,pt	%xcc,	loop_12
	nop
	set	0x15, %i6
	ldsb	[%l7 + %i6],	%i5
	nop
	set	0x14, %i4
	ldub	[%l7 + %i4],	%l4
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
loop_12:
	nop
	set	0x2B, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g2
	nop
	set	0x7A, %g7
	ldstub	[%l7 + %g7],	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o6
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	nop
	setx	0xAA552EE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x62361C6D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f10,	%f7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%g6
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f24
	add	%o3,	%o1,	%o2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x80
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%i2
	bleu,a	%xcc,	loop_13
	add	%i0,	%l3,	%g3
	nop
	set	0x38, %g3
	stw	%l0,	[%l7 + %g3]
	nop
	set	0x30, %o1
	std	%i2,	[%l7 + %o1]
loop_13:
	nop
	set	0x28, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%i0
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	st	%f13,	[%l7 + 0x20]
	nop
	set	0x50, %o2
	stx	%i4,	[%l7 + %o2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%o5
	set	0x55, %o7
	stba	%i7,	[%l7 + %o7] 0xeb
	membar	#Sync
	st	%f8,	[%l7 + 0x68]
	nop
	set	0x70, %l3
	std	%f6,	[%l7 + %l3]
	ld	[%l7 + 0x48],	%f14
	set	0x78, %l4
	stha	%i6,	[%l7 + %l4] 0x89
	set	0x54, %i7
	stha	%g4,	[%l7 + %i7] 0xeb
	membar	#Sync
	wr	%g1,	%o0,	%set_softint
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%o4
	nop
	set	0x64, %g2
	prefetch	[%l7 + %g2],	 4
	and	%g5,	%g2,	%o7
	set	0x30, %l2
	ldda	[%l7 + %l2] 0xe2,	%l0
	nop
	set	0x48, %l1
	sth	%o6,	[%l7 + %l1]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%l2
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x24]
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	nop
	set	0x1C, %i2
	ldsw	[%l7 + %i2],	%o3
	nop
	set	0x08, %g6
	std	%i6,	[%l7 + %g6]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f16
	nop
	set	0x50, %o0
	sth	%o2,	[%l7 + %o0]
	nop
	set	0x34, %g4
	sth	%i2,	[%l7 + %g4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i0
	nop
	set	0x11, %o5
	ldstub	[%l7 + %o5],	%l3
	nop
	set	0x5C, %i6
	prefetch	[%l7 + %i6],	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%l0
	nop
	set	0x15, %i4
	ldsb	[%l7 + %i4],	%i3
	st	%fsr,	[%l7 + 0x30]
	set	0x78, %l6
	lda	[%l7 + %l6] 0x81,	%f7
	nop
	set	0x70, %g1
	sth	%l5,	[%l7 + %g1]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	nop
	set	0x29, %l5
	stb	%i4,	[%l7 + %l5]
	st	%f6,	[%l7 + 0x7C]
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x80,	%f19
	nop
	set	0x5E, %i0
	ldsh	[%l7 + %i0],	%g7
	nop
	set	0x42, %g3
	ldsb	[%l7 + %g3],	%o5
	set	0x2C, %l0
	sta	%f2,	[%l7 + %l0] 0x81
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x89,	%i7
	set	0x30, %o1
	stxa	%i6,	[%l7 + %o1] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f0
	nop
	set	0x2C, %o2
	ldstub	[%l7 + %o2],	%g4
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xea,	%i0
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o4
	set	0x10, %l3
	stwa	%g5,	[%l7 + %l3] 0xeb
	membar	#Sync
	and	%g2,	%o7,	%l1
	nop
	set	0x1E, %i7
	stb	%o6,	[%l7 + %i7]
	nop
	set	0x48, %g2
	std	%g0,	[%l7 + %g2]
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x28, %l2
	std	%o2,	[%l7 + %l2]
	set	0x78, %l1
	stba	%l6,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x68, %i1
	std	%o2,	[%l7 + %i1]
	or	%i2,	%l2,	%o1
	or	%i0,	%g3,	%l3
	nop
	set	0x60, %l4
	ldsw	[%l7 + %l4],	%l0
	nop
	set	0x20, %i2
	std	%l4,	[%l7 + %i2]
	ble	%xcc,	loop_14
	st	%fsr,	[%l7 + 0x1C]
	ld	[%l7 + 0x30],	%f30
	add	%i4,	%i3,	%o5
loop_14:
	nop
	set	0x68, %o4
	ldub	[%l7 + %o4],	%g7
	st	%f24,	[%l7 + 0x44]
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x80,	%i6
	add	%i6,	%i1,	%g4
	set	0x20, %g6
	stda	%o0,	[%l7 + %g6] 0x89
	nop
	set	0x18, %o5
	lduh	[%l7 + %o5],	%o4
	set	0x50, %i6
	stxa	%i5,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x38, %i4
	stda	%g4,	[%l7 + %i4] 0xe2
	membar	#Sync
	st	%f9,	[%l7 + 0x28]
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x38, %g4
	std	%o6,	[%l7 + %g4]
	nop
	nop
	setx	0xE6FB9228,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x8BA1CDA8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f29,	%f1
	nop
	set	0x71, %g1
	stb	%g2,	[%l7 + %g1]
	add	%l1,	%o6,	%l4
	and	%g6,	%o3,	%g1
	set	0x10, %l6
	stxa	%o2,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%i6
	nop
	set	0x0E, %i3
	ldstub	[%l7 + %i3],	%l2
	nop
	set	0x38, %l5
	ldsw	[%l7 + %l5],	%o1
	nop
	set	0x72, %i0
	ldsh	[%l7 + %i0],	%i2
	bg,a,pn	%xcc,	loop_15
	nop
	set	0x14, %g3
	ldub	[%l7 + %g3],	%i0
	set	0x74, %i5
	stha	%g3,	[%l7 + %i5] 0xeb
	membar	#Sync
loop_15:
	nop
	set	0x71, %o6
	stba	%l3,	[%l7 + %o6] 0x89
	nop
	set	0x49, %l0
	ldsb	[%l7 + %l0],	%l5
	or	%i4,	%i3,	%o5
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x89,	%l0
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x88,	 3
	nop
	set	0x14, %o7
	ldsh	[%l7 + %o7],	%g7
	nop
	set	0x35, %o2
	ldsb	[%l7 + %o2],	%i1
	nop
	set	0x44, %l3
	sth	%i6,	[%l7 + %l3]
	set	0x20, %o3
	lda	[%l7 + %o3] 0x80,	%f8
	set	0x78, %g2
	stxa	%o0,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x78, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x0C, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x4C, %l1
	lduw	[%l7 + %l1],	%o4
	set	0x1C, %l4
	sta	%f18,	[%l7 + %l4] 0x89
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%g4
	set	0x60, %o4
	stxa	%g5,	[%l7 + %o4] 0x81
	nop
	set	0x34, %o0
	stb	%o7,	[%l7 + %o0]
	set	0x72, %g6
	stha	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	wr	%i5,	%o6,	%set_softint
	nop
	set	0x60, %i1
	lduh	[%l7 + %i1],	%l4
	nop
	set	0x58, %i6
	sth	%l1,	[%l7 + %i6]
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%o3
	nop
	set	0x24, %g4
	prefetch	[%l7 + %g4],	 4
	wr	%g1,	%o2,	%set_softint
	and	%g6,	%l2,	%l6
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%o1
	add	%i0,	%i2,	%l3
	st	%fsr,	[%l7 + 0x44]
	set	0x50, %l6
	stxa	%g3,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x44, %i3
	stw	%l5,	[%l7 + %i3]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x81,	%i4
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%i2
	nop
	set	0x70, %g3
	stx	%o5,	[%l7 + %g3]
	nop
	set	0x23, %l5
	ldub	[%l7 + %l5],	%i7
	set	0x28, %i5
	stha	%g7,	[%l7 + %i5] 0x81
	nop
	nop
	setx	0xB1F63B66E588BC82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3070D901DC6261D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f14
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x54, %l0
	ldsb	[%l7 + %l0],	%i1
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f6
	nop
	set	0x28, %o1
	stx	%l0,	[%l7 + %o1]
	nop
	set	0x20, %g5
	stw	%i6,	[%l7 + %g5]
	set	0x08, %o2
	sta	%f4,	[%l7 + %o2] 0x81
	nop
	set	0x12, %l3
	stb	%o0,	[%l7 + %l3]
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f0
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f10
	nop
	set	0x3A, %g2
	lduh	[%l7 + %g2],	%g4
	nop
	set	0x5A, %i7
	lduh	[%l7 + %i7],	%o4
	nop
	set	0x1B, %l4
	ldstub	[%l7 + %l4],	%g5
	nop
	set	0x1E, %l1
	ldsb	[%l7 + %l1],	%o7
	fpsub16	%f20,	%f8,	%f2
	set	0x6C, %o4
	swapa	[%l7 + %o4] 0x81,	%g2
	nop
	set	0x64, %o0
	ldsh	[%l7 + %o0],	%o6
	add	%i5,	%l1,	%l4
	nop
	set	0x60, %g6
	std	%o2,	[%l7 + %g6]
	fpadd32	%f0,	%f2,	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%g1
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xca
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f2
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x24, %o5
	swap	[%l7 + %o5],	%g6
	fpsub32	%f24,	%f14,	%f24
	set	0x44, %i4
	stwa	%l2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x28, %g4
	swapa	[%l7 + %g4] 0x81,	%l6
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x18, %g1
	stda	%i0,	[%l7 + %g1] 0x89
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f18
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x73, %g7
	ldstub	[%l7 + %g7],	%o1
	add	%l3,	%i2,	%l5
	add	%g3,	%i3,	%i4
	nop
	set	0x54, %g3
	lduw	[%l7 + %g3],	%o5
	nop
	set	0x74, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x70, %i5
	ldstub	[%l7 + %i5],	%i7
	nop
	set	0x20, %l0
	std	%f30,	[%l7 + %l0]
	set	0x64, %l5
	stha	%i1,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc0
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x81,	 1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f0
	nop
	set	0x68, %l3
	stb	%i6,	[%l7 + %l3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%o4
	nop
	set	0x34, %o6
	lduh	[%l7 + %o6],	%g5
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g2
	nop
	set	0x78, %o3
	stb	%o6,	[%l7 + %o3]
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x81,	%i4
	nop
	set	0x11, %g2
	stb	%l1,	[%l7 + %g2]
	wr	%o7,	%l4,	%sys_tick
	nop
	set	0x63, %l4
	stb	%o2,	[%l7 + %l4]
	nop
	set	0x48, %i7
	stw	%g1,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x18]
	set	0x34, %l1
	swapa	[%l7 + %l1] 0x80,	%g6
	nop
	set	0x0B, %o4
	ldsb	[%l7 + %o4],	%l2
	nop
	set	0x3C, %o0
	ldsw	[%l7 + %o0],	%o3
	or	%i0,	%o1,	%l6
	or	%i2,	%l5,	%l3
	set	0x7D, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g3
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%i3
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%i7
	nop
	nop
	setx	0x3E718C7B23E1E2C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xEBE2B15F22FFB3DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f26
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f16
	nop
	set	0x64, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x37, %i4
	ldub	[%l7 + %i4],	%i1
	nop
	set	0x74, %g4
	lduw	[%l7 + %g4],	%o5
	set	0x64, %g1
	swapa	[%l7 + %g1] 0x89,	%l0
	nop
	set	0x70, %i3
	ldub	[%l7 + %i3],	%o0
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x43, %g3
	ldsb	[%l7 + %g3],	%i6
	nop
	set	0x28, %i0
	ldsb	[%l7 + %i0],	%g4
	set	0x5B, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g7
	nop
	set	0x78, %l0
	sth	%o4,	[%l7 + %l0]
	ld	[%l7 + 0x14],	%f28
	nop
	set	0x60, %l5
	std	%f24,	[%l7 + %l5]
	nop
	set	0x4D, %i5
	ldsb	[%l7 + %i5],	%g5
	set	0x58, %o1
	sta	%f12,	[%l7 + %o1] 0x89
	set	0x68, %o2
	ldxa	[%l7 + %o2] 0x80,	%g2
	nop
	set	0x0C, %g5
	lduw	[%l7 + %g5],	%i5
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x81,	%o6
	nop
	set	0x59, %o7
	stb	%l1,	[%l7 + %o7]
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%l4
	set	0x0C, %l2
	sta	%f12,	[%l7 + %l2] 0x89
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%g1
	set	0x26, %l4
	stba	%o2,	[%l7 + %l4] 0x80
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 0
	fpadd16	%f4,	%f28,	%f2
	nop
	set	0x15, %l1
	ldsb	[%l7 + %l1],	%g6
	nop
	set	0x28, %o4
	swap	[%l7 + %o4],	%o3
	set	0x48, %g2
	stda	%l2,	[%l7 + %g2] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%o1
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xe2,	%i2
	bge	%icc,	loop_16
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f26
	or	%l6,	%l5,	%l3
	nop
	set	0x34, %i6
	swap	[%l7 + %i6],	%g3
loop_16:
	nop
	set	0x78, %i2
	sta	%f3,	[%l7 + %i2] 0x88
	set	0x58, %i1
	swapa	[%l7 + %i1] 0x81,	%i3
	ble,pt	%icc,	loop_17
	wr	%i4,	%i7,	%clear_softint
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
loop_17:
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f26
	set	0x38, %o5
	swapa	[%l7 + %o5] 0x81,	%o5
	set	0x68, %g1
	stxa	%l0,	[%l7 + %g1] 0x81
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x89,	%o0
	nop
	set	0x68, %l6
	ldub	[%l7 + %l6],	%i1
	nop
	set	0x7A, %g3
	sth	%i6,	[%l7 + %g3]
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%g6
	nop
	set	0x74, %g7
	ldsh	[%l7 + %g7],	%g4
	set	0x38, %l0
	lda	[%l7 + %l0] 0x80,	%f8
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%g5
	set	0x30, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc0
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x80,	%g2
	nop
	set	0x60, %g5
	swap	[%l7 + %g5],	%i5
	set	0x30, %l3
	stwa	%o6,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x50, %o3
	ldsb	[%l7 + %o3],	%o7
	nop
	set	0x70, %l2
	std	%l4,	[%l7 + %l2]
	set	0x30, %o6
	stda	%g0,	[%l7 + %o6] 0x80
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%o2
	set	0x40, %o7
	stwa	%l1,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x1C, %l1
	ldsw	[%l7 + %l1],	%o3
	set	0x70, %o4
	swapa	[%l7 + %o4] 0x80,	%l2
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd0
	set	0x5F, %o0
	stba	%o1,	[%l7 + %o0] 0x89
	add	%g6,	%i2,	%l5
	ba	%xcc,	loop_18
	nop
	set	0x08, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x6C, %g6
	ldsw	[%l7 + %g6],	%g3
	nop
	set	0x70, %i2
	lduh	[%l7 + %i2],	%i3
loop_18:
	nop
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x80,	 1
	nop
	set	0x20, %i4
	ldstub	[%l7 + %i4],	%i4
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f2
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%o5
	nop
	set	0x10, %i3
	lduh	[%l7 + %i3],	%l0
	ld	[%l7 + 0x18],	%f22
	set	0x34, %l6
	swapa	[%l7 + %l6] 0x80,	%i7
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%i1
	fpsub32s	%f20,	%f9,	%f20
	nop
	set	0x20, %i0
	lduw	[%l7 + %i0],	%o0
	set	0x78, %o5
	stxa	%i6,	[%l7 + %o5] 0x80
	nop
	set	0x70, %g7
	std	%g6,	[%l7 + %g7]
	set	0x18, %l5
	lda	[%l7 + %l5] 0x88,	%f11
	set	0x24, %l0
	stwa	%g4,	[%l7 + %l0] 0x88
	nop
	set	0x1C, %i5
	swap	[%l7 + %i5],	%g5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x80
	nop
	set	0x22, %o2
	ldstub	[%l7 + %o2],	%g2
	nop
	set	0x59, %l3
	stb	%o4,	[%l7 + %l3]
	nop
	set	0x34, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x54, %l2
	ldstub	[%l7 + %l2],	%o6
	nop
	set	0x48, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x34, %o6
	swap	[%l7 + %o6],	%i5
	nop
	set	0x58, %l4
	ldsb	[%l7 + %l4],	%o7
	nop
	set	0x58, %l1
	stx	%g1,	[%l7 + %l1]
	and	%l4,	%o2,	%l1
	nop
	set	0x48, %o4
	std	%l2,	[%l7 + %o4]
	nop
	set	0x08, %o7
	stx	%o3,	[%l7 + %o7]
	nop
	set	0x46, %i7
	sth	%o1,	[%l7 + %i7]
	st	%f24,	[%l7 + 0x0C]
	nop
	set	0x6E, %o0
	sth	%g6,	[%l7 + %o0]
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%i2
	fpadd16s	%f14,	%f9,	%f8
	set	0x70, %g6
	stha	%i0,	[%l7 + %g6] 0x88
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%l5
	ble,pn	%xcc,	loop_19
	st	%f6,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x74]
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
loop_19:
	nop
	set	0x4A, %g2
	ldub	[%l7 + %g2],	%g3
	nop
	set	0x5C, %i1
	ldsw	[%l7 + %i1],	%l6
	set	0x0C, %g4
	stha	%o5,	[%l7 + %g4] 0x89
	set	0x74, %i4
	lda	[%l7 + %i4] 0x88,	%f16
	set	0x68, %g1
	sta	%f16,	[%l7 + %g1] 0x80
	set	0x40, %i3
	stxa	%i4,	[%l7 + %i3] 0xe3
	membar	#Sync
	and	%l0,	%i1,	%i7
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x80,	%i6
	nop
	set	0x7A, %i0
	sth	%o0,	[%l7 + %i0]
	set	0x70, %l6
	stwa	%g7,	[%l7 + %l6] 0x81
	nop
	set	0x27, %g7
	ldsb	[%l7 + %g7],	%g4
	nop
	set	0x4F, %l5
	ldub	[%l7 + %l5],	%g5
	set	0x44, %l0
	stba	%o4,	[%l7 + %l0] 0x81
	and	%g2,	%i5,	%o7
	nop
	set	0x74, %o5
	stw	%o6,	[%l7 + %o5]
	set	0x5C, %o1
	lda	[%l7 + %o1] 0x89,	%f13
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x88
	set	0x5E, %i5
	stha	%o2,	[%l7 + %i5] 0x80
	nop
	set	0x54, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x2B, %o3
	ldsb	[%l7 + %o3],	%l1
	add	%l2,	%o3,	%o1
	nop
	set	0x38, %g5
	std	%f14,	[%l7 + %g5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i2
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xeb,	%i0
	nop
	set	0x78, %l1
	stw	%l3,	[%l7 + %l1]
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	add	%l5,	%g3,	%l6
	nop
	set	0x44, %o6
	ldsw	[%l7 + %o6],	%i3
	nop
	set	0x46, %o7
	stb	%o5,	[%l7 + %o7]
	nop
	set	0x3F, %i7
	ldstub	[%l7 + %i7],	%l0
	nop
	set	0x76, %i6
	stb	%i1,	[%l7 + %i6]
	nop
	set	0x1F, %g6
	ldstub	[%l7 + %g6],	%i7
	set	0x76, %i2
	stha	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x60, %g2
	stda	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x58, %i1
	stxa	%g7,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%o0
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%o4
	bne,a,pt	%icc,	loop_20
	nop
	set	0x48, %i3
	ldx	[%l7 + %i3],	%g5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%o7
loop_20:
	nop
	set	0x10, %g3
	sta	%f26,	[%l7 + %g3] 0x81
	nop
	set	0x08, %i0
	std	%g2,	[%l7 + %i0]
	add	%g1,	%o2,	%l1
	set	0x36, %l6
	stba	%l2,	[%l7 + %l6] 0x89
	set	0x6A, %g7
	ldstuba	[%l7 + %g7] 0x89,	%o6
	nop
	set	0x6C, %l5
	lduh	[%l7 + %l5],	%o1
	set	0x20, %o0
	stxa	%o3,	[%l7 + %o0] 0xe3
	membar	#Sync
	wr	%i2,	%l4,	%clear_softint
	set	0x58, %o5
	stda	%l2,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x5C, %o1
	ldsw	[%l7 + %o1],	%i0
	nop
	set	0x39, %o2
	stb	%g6,	[%l7 + %o2]
	nop
	set	0x6F, %l0
	ldstub	[%l7 + %l0],	%l5
	set	0x55, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g3
	nop
	set	0x78, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	nop
	set	0x4C, %g5
	lduw	[%l7 + %g5],	%l6
	st	%f10,	[%l7 + 0x64]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%l0
	nop
	set	0x5A, %l4
	ldstub	[%l7 + %l4],	%i1
	fpadd16	%f2,	%f14,	%f28
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%i7
	ld	[%l7 + 0x60],	%f19
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe3,	%i4
	nop
	set	0x18, %o6
	swap	[%l7 + %o6],	%g7
	set	0x7C, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o0
	nop
	set	0x16, %l1
	lduh	[%l7 + %l1],	%i6
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%g4
	ld	[%l7 + 0x14],	%f14
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%g5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%o7
	nop
	set	0x70, %i2
	ldub	[%l7 + %i2],	%o4
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x80,	 0
	fpadd32	%f26,	%f20,	%f10
	set	0x40, %i6
	ldstuba	[%l7 + %i6] 0x89,	%g1
	set	0x4C, %i1
	lda	[%l7 + %i1] 0x81,	%f28
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%l1
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%o2
	nop
	set	0x52, %g4
	lduh	[%l7 + %g4],	%o6
	bne,a	%xcc,	loop_21
	fpsub32	%f26,	%f20,	%f0
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x81,	%o1
loop_21:
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x0A, %i3
	sth	%l2,	[%l7 + %i3]
	set	0x34, %l6
	stha	%o3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x51, %i0
	ldsb	[%l7 + %i0],	%l4
	and	%l3,	%i2,	%g6
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf1
	membar	#Sync
	nop
	nop
	setx	0x689102905DF30778,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5C4D01AE115D03E4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f26
	or	%l5,	%g3,	%i3
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%i0
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%l6
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	st	%f24,	[%l7 + 0x70]
	nop
	set	0x28, %o1
	swap	[%l7 + %o1],	%i7
	set	0x28, %l0
	lda	[%l7 + %l0] 0x80,	%f19
	nop
	set	0x38, %i5
	ldsb	[%l7 + %i5],	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i4
	and	%i6,	%g4,	%o0
	nop
	set	0x7A, %l2
	sth	%i5,	[%l7 + %l2]
	set	0x54, %o2
	stba	%o7,	[%l7 + %o2] 0x81
	set	0x7C, %g5
	swapa	[%l7 + %g5] 0x88,	%o4
	and	%g2,	%g1,	%g5
	nop
	set	0x50, %l4
	ldx	[%l7 + %l4],	%o2
	add	%l1,	%o1,	%o6
	nop
	set	0x08, %o3
	stx	%l2,	[%l7 + %o3]
	nop
	set	0x60, %o4
	stx	%l4,	[%l7 + %o4]
	ld	[%l7 + 0x58],	%f19
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i2
	nop
	set	0x28, %o6
	std	%g6,	[%l7 + %o6]
	nop
	set	0x64, %o7
	ldub	[%l7 + %o7],	%l5
	or	%l3,	%g3,	%i0
	nop
	set	0x75, %l1
	ldub	[%l7 + %l1],	%o5
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB05, 	%sys_tick_cmpr
	st	%f12,	[%l7 + 0x24]
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%l0
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%i7
	set	0x38, %g2
	sta	%f26,	[%l7 + %g2] 0x80
	nop
	set	0x1A, %i6
	ldstub	[%l7 + %i6],	%i4
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%i6
	set	0x66, %g1
	stba	%g4,	[%l7 + %g1] 0x81
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	set	0x4C, %g3
	stwa	%g7,	[%l7 + %g3] 0x89
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x80,	%i5
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%o6
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x81,	%o0
	nop
	set	0x1E, %g7
	ldsh	[%l7 + %g7],	%g2
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x81,	%g1
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x20, %o0
	std	%g4,	[%l7 + %o0]
	wr	%l1,	%o2,	%softint
	st	%fsr,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x20, %o1
	stx	%o1,	[%l7 + %o1]
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	nop
	set	0x27, %l0
	ldsb	[%l7 + %l0],	%l4
	ld	[%l7 + 0x54],	%f24
	and	%o6,	%o3,	%g6
	st	%f4,	[%l7 + 0x5C]
	add	%l5,	%i2,	%l3
	set	0x20, %l2
	stxa	%i0,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x7E, %g5
	stha	%o5,	[%l7 + %g5] 0xe2
	membar	#Sync
	or	%g3,	%i3,	%i1
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%l0
	set	0x6A, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i7
	or	%l6,	%i6,	%g4
	set	0x4E, %o3
	stha	%i4,	[%l7 + %o3] 0x89
	set	0x50, %o4
	stda	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x75, %o7
	stb	%i5,	[%l7 + %o7]
	and	%o0,	%g2,	%g1
	nop
	set	0x40, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xea,	%o4
	set	0x10, %l3
	lda	[%l7 + %l3] 0x81,	%f20
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	nop
	set	0x64, %i7
	lduh	[%l7 + %i7],	%g5
	nop
	set	0x48, %g2
	stx	%o2,	[%l7 + %g2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%o1
	or	%l4,	%o6,	%o3
	nop
	set	0x2A, %i2
	lduh	[%l7 + %i2],	%g6
	nop
	set	0x58, %i6
	std	%f2,	[%l7 + %i6]
	nop
	set	0x38, %i4
	ldsw	[%l7 + %i4],	%l2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f16
	nop
	set	0x24, %g3
	lduh	[%l7 + %g3],	%i2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	nop
	set	0x10, %i1
	lduw	[%l7 + %i1],	%l3
	nop
	set	0x1E, %i0
	ldsb	[%l7 + %i0],	%i0
	and	%o5,	%g3,	%l5
	nop
	set	0x24, %g4
	lduw	[%l7 + %g4],	%i1
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f0
	nop
	set	0x4A, %l5
	ldsh	[%l7 + %l5],	%i3
	nop
	set	0x50, %o5
	std	%f20,	[%l7 + %o5]
	set	0x74, %o0
	ldstuba	[%l7 + %o0] 0x80,	%l0
	ld	[%l7 + 0x60],	%f30
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i7
	nop
	set	0x24, %l6
	ldstub	[%l7 + %l6],	%i6
	set	0x4A, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i4
	nop
	set	0x19, %l0
	ldsb	[%l7 + %l0],	%g4
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f22
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%i4
	nop
	set	0x78, %l2
	ldsw	[%l7 + %l2],	%o0
	nop
	set	0x18, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x0C, %l4
	stha	%g7,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x38, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x78, %o7
	std	%g0,	[%l7 + %o7]
	nop
	set	0x25, %l1
	ldsb	[%l7 + %l1],	%o4
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%o7
	add	%g2,	%g5,	%o2
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x3F, %l3
	ldsb	[%l7 + %l3],	%o1
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%l1
	nop
	set	0x28, %g2
	stx	%o6,	[%l7 + %g2]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g6
	nop
	set	0x6C, %i2
	ldsw	[%l7 + %i2],	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%l3
	set	0x60, %g6
	swapa	[%l7 + %g6] 0x80,	%i2
	fpsub32	%f20,	%f6,	%f10
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%o5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i1
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f16
	set	0x40, %g1
	sta	%f25,	[%l7 + %g1] 0x88
	nop
	set	0x38, %g3
	std	%f10,	[%l7 + %g3]
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x80,	%i2
	nop
	set	0x68, %i4
	lduw	[%l7 + %i4],	%l5
	nop
	nop
	setx	0x2F643D899E870000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x0C5C1732936E3471,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f2
	nop
	set	0x47, %i1
	ldub	[%l7 + %i1],	%l0
	nop
	set	0x22, %i0
	ldsb	[%l7 + %i0],	%i7
	set	0x30, %g7
	stba	%l6,	[%l7 + %g7] 0x88
	add	%i4,	%g4,	%i6
	nop
	set	0x40, %l5
	prefetch	[%l7 + %l5],	 3
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	or	%i5,	%o0,	%g1
	set	0x64, %g4
	sta	%f20,	[%l7 + %g4] 0x81
	nop
	set	0x40, %o0
	std	%o4,	[%l7 + %o0]
	set	0x30, %l6
	stwa	%o7,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x5A, %i5
	ldub	[%l7 + %i5],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%o2
	nop
	set	0x1C, %o1
	swap	[%l7 + %o1],	%o1
	bn	%xcc,	loop_22
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x0E, %g5
	lduh	[%l7 + %g5],	%l1
	st	%fsr,	[%l7 + 0x38]
loop_22:
	nop
	set	0x50, %l0
	lduh	[%l7 + %l0],	%g5
	nop
	set	0x30, %o2
	stw	%o6,	[%l7 + %o2]
	set	0x08, %l4
	stda	%l4,	[%l7 + %l4] 0x80
	nop
	set	0x10, %l2
	stx	%g6,	[%l7 + %l2]
	nop
	set	0x70, %o3
	sth	%l2,	[%l7 + %o3]
	nop
	set	0x7C, %o7
	ldsw	[%l7 + %o7],	%o3
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	nop
	set	0x32, %o4
	sth	%i2,	[%l7 + %o4]
	nop
	set	0x74, %l1
	sth	%o5,	[%l7 + %l1]
	fpadd32	%f16,	%f22,	%f10
	nop
	set	0x58, %i7
	std	%i0,	[%l7 + %i7]
	and	%i1,	%i3,	%g3
	nop
	set	0x50, %l3
	std	%f10,	[%l7 + %l3]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x89
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc8
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%i7
	ld	[%l7 + 0x58],	%f26
	wr	%l0,	%i4,	%softint
	st	%f4,	[%l7 + 0x5C]
	or	%g4,	%i6,	%i5
	add	%o0,	%g1,	%l6
	set	0x70, %i2
	stxa	%o7,	[%l7 + %i2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	set	0x08, %i6
	stda	%o4,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	bne,a	%icc,	loop_23
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%o2
	nop
	set	0x58, %g1
	std	%f22,	[%l7 + %g1]
	nop
	set	0x18, %i4
	lduw	[%l7 + %i4],	%o1
loop_23:
	nop
	set	0x79, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g2
	nop
	set	0x44, %g7
	stw	%g5,	[%l7 + %g7]
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x6B, %l5
	stba	%o6,	[%l7 + %l5] 0xe3
	membar	#Sync
	and	%l1,	%l4,	%g6
	nop
	set	0x54, %o5
	swap	[%l7 + %o5],	%o3
	or	%l2,	%l3,	%i2
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%o5
	set	0x18, %g4
	stda	%i0,	[%l7 + %g4] 0x80
	set	0x57, %l6
	stba	%i3,	[%l7 + %l6] 0x89
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x89,	%g2
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x80,	%i0
	nop
	set	0x2C, %l0
	stw	%i7,	[%l7 + %l0]
	add	%l0,	%i4,	%g4
	fpadd32	%f30,	%f26,	%f22
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%i5
	nop
	set	0x18, %o1
	std	%f12,	[%l7 + %o1]
	ld	[%l7 + 0x2C],	%f28
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%o0
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x80,	%l5
	set	0x6A, %o3
	stba	%g1,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x10, %o2
	stx	%l6,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x28, %o7
	std	%f4,	[%l7 + %o7]
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x80,	%o4
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%g7
	set	0x6C, %i7
	stha	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g5
	nop
	set	0x50, %l3
	stb	%o6,	[%l7 + %l3]
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x81,	 4
	st	%f31,	[%l7 + 0x4C]
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x30, %i6
	ldstuba	[%l7 + %i6] 0x88,	%l1
	nop
	set	0x2E, %g6
	sth	%l4,	[%l7 + %g6]
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%o3
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%g6
	and	%l3,	%l2,	%i2
	bleu,pn	%xcc,	loop_24
	nop
	set	0x4A, %g3
	sth	%i1,	[%l7 + %g3]
	nop
	set	0x50, %i0
	ldsb	[%l7 + %i0],	%i3
	bne,a	%icc,	loop_25
loop_24:
	nop
	set	0x50, %g7
	stb	%o5,	[%l7 + %g7]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i7
loop_25:
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%l0
	bl,a,pn	%icc,	loop_26
	ld	[%l7 + 0x68],	%f12
	set	0x50, %i4
	sta	%f9,	[%l7 + %i4] 0x89
loop_26:
	st	%f31,	[%l7 + 0x48]
	nop
	set	0x28, %o5
	stx	%i4,	[%l7 + %o5]
	nop
	set	0x14, %o0
	stw	%g4,	[%l7 + %o0]
	nop
	set	0x20, %l5
	ldsh	[%l7 + %l5],	%i6
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%i0
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe3,	%i4
	nop
	set	0x32, %g5
	lduh	[%l7 + %g5],	%o0
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xeb,	%g0
	nop
	set	0x58, %l0
	std	%f20,	[%l7 + %l0]
	nop
	set	0x68, %o1
	stx	%l5,	[%l7 + %o1]
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%i6
	nop
	set	0x24, %l4
	lduh	[%l7 + %l4],	%o7
	add	%o4,	%g7,	%o2
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%g2
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%o0
	set	0x12, %o3
	stha	%l1,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x24, %o4
	ldsb	[%l7 + %o4],	%l4
	ld	[%l7 + 0x7C],	%f0
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%o3
	nop
	set	0x34, %l1
	lduw	[%l7 + %l1],	%o6
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf0
	membar	#Sync
	add	%l3,	%i2,	%l2
	set	0x5C, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i1
	add	%o5,	%g3,	%i7
	nop
	set	0x68, %i2
	stx	%l0,	[%l7 + %i2]
	set	0x5C, %g2
	lda	[%l7 + %g2] 0x81,	%f28
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%i2
	set	0x28, %i6
	stda	%i4,	[%l7 + %i6] 0x89
	fpsub16s	%f26,	%f13,	%f28
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f0
	st	%f13,	[%l7 + 0x30]
	nop
	set	0x34, %g3
	swap	[%l7 + %g3],	%g4
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%i6
	fpsub16s	%f27,	%f26,	%f10
	set	0x53, %g1
	stba	%i0,	[%l7 + %g1] 0x88
	nop
	set	0x58, %g7
	sth	%o0,	[%l7 + %g7]
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%g0
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x80,	%i4
	nop
	set	0x15, %o0
	stb	%l6,	[%l7 + %o0]
	nop
	set	0x10, %l5
	std	%l4,	[%l7 + %l5]
	nop
	set	0x78, %i4
	std	%o6,	[%l7 + %i4]
	set	0x2C, %l6
	lda	[%l7 + %l6] 0x89,	%f11
	nop
	set	0x50, %g4
	ldx	[%l7 + %g4],	%g7
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	nop
	set	0x74, %i5
	lduw	[%l7 + %i5],	%o4
	nop
	set	0x48, %l0
	stx	%g5,	[%l7 + %l0]
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%o2
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x4A, %o2
	lduh	[%l7 + %o2],	%o1
	set	0x0D, %o3
	stba	%l1,	[%l7 + %o3] 0x88
	nop
	set	0x4A, %o4
	ldstub	[%l7 + %o4],	%l4
	set	0x2C, %l4
	stha	%g2,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x60, %o7
	stx	%o3,	[%l7 + %o7]
	set	0x6C, %o6
	lda	[%l7 + %o6] 0x80,	%f21
	add	%g6,	%o6,	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%i1
	nop
	set	0x3C, %l1
	ldsh	[%l7 + %l1],	%o5
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x58, %g2
	swap	[%l7 + %g2],	%i2
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%i7
	fpadd32s	%f30,	%f28,	%f16
	set	0x18, %i6
	stxa	%l0,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x20, %i7
	stw	%i4,	[%l7 + %i7]
	nop
	set	0x10, %i3
	ldsw	[%l7 + %i3],	%i3
	nop
	set	0x3C, %g3
	ldstub	[%l7 + %g3],	%g4
	set	0x58, %i0
	ldstuba	[%l7 + %i0] 0x89,	%i6
	nop
	set	0x1E, %g1
	ldstub	[%l7 + %g1],	%o0
	nop
	set	0x7C, %g7
	swap	[%l7 + %g7],	%i0
	nop
	set	0x30, %o5
	std	%f30,	[%l7 + %o5]
	add	%i5,	%g1,	%l5
	set	0x5A, %o0
	stha	%l6,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x68, %l5
	lduw	[%l7 + %l5],	%g7
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	nop
	set	0x10, %l6
	stw	%o7,	[%l7 + %l6]
	st	%f10,	[%l7 + 0x68]
	nop
	set	0x70, %i1
	lduw	[%l7 + %i1],	%g5
	set	0x24, %g5
	lda	[%l7 + %g5] 0x81,	%f22
	nop
	set	0x3E, %i5
	ldsh	[%l7 + %i5],	%o1
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%o2
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%l1
	nop
	set	0x40, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x20, %g4
	stda	%g2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x23, %o2
	stb	%o3,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x0C]
	set	0x7E, %o3
	stha	%g6,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x21, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l4
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x88,	%l3
	nop
	set	0x24, %o6
	ldsw	[%l7 + %o6],	%o6
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%i1
	set	0x0F, %l3
	stba	%o5,	[%l7 + %l3] 0x81
	and	%l2,	%g3,	%i7
	set	0x74, %l1
	lda	[%l7 + %l1] 0x80,	%f2
	nop
	set	0x60, %g2
	sth	%l0,	[%l7 + %g2]
	nop
	set	0x08, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xea,	%i4
	nop
	set	0x2C, %g6
	ldstub	[%l7 + %g6],	%i2
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x89,	%g4
	nop
	set	0x50, %g3
	stb	%i3,	[%l7 + %g3]
	and	%o0,	%i6,	%i5
	ld	[%l7 + 0x54],	%f12
	nop
	set	0x48, %i0
	stx	%g1,	[%l7 + %i0]
	nop
	set	0x38, %g1
	std	%i0,	[%l7 + %g1]
	nop
	set	0x53, %i3
	ldsb	[%l7 + %i3],	%l6
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f16
	nop
	set	0x71, %o5
	ldub	[%l7 + %o5],	%g7
	and	%o4,	%l5,	%g5
	set	0x58, %l5
	stxa	%o7,	[%l7 + %l5] 0x88
	nop
	set	0x69, %i4
	stb	%o2,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x1C]
	add	%o1,	%g2,	%l1
	wr	%o3,	%g6,	%softint
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%l3
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x76, %g5
	sth	%o6,	[%l7 + %g5]
	set	0x5C, %i5
	lda	[%l7 + %i5] 0x89,	%f31
	nop
	set	0x1E, %l0
	ldstub	[%l7 + %l0],	%i1
	nop
	set	0x5C, %l6
	ldsw	[%l7 + %l6],	%l4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xe3,	%o4
	and	%g3,	%l2,	%i7
	set	0x70, %g4
	stxa	%i4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%l0
	nop
	set	0x7C, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x24, %o1
	prefetch	[%l7 + %o1],	 3
	fpadd32s	%f10,	%f18,	%f4
	nop
	set	0x08, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x5F, %l4
	stba	%g4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x54, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x72, %l3
	ldub	[%l7 + %l3],	%i3
	nop
	set	0x10, %l1
	std	%f10,	[%l7 + %l1]
	nop
	set	0x60, %o6
	std	%i2,	[%l7 + %o6]
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x80,	%i6
	or	%o0,	%g1,	%i0
	nop
	set	0x2C, %i6
	stw	%i5,	[%l7 + %i6]
	fpsub32	%f10,	%f30,	%f2
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x78, %i7
	stb	%l6,	[%l7 + %i7]
	nop
	set	0x40, %g3
	stx	%g7,	[%l7 + %g3]
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%l4
	set	0x78, %g1
	lda	[%l7 + %g1] 0x81,	%f12
	nop
	set	0x68, %i3
	std	%f0,	[%l7 + %i3]
	fpsub16s	%f20,	%f5,	%f21
	set	0x24, %g7
	swapa	[%l7 + %g7] 0x89,	%g5
	bl,pn	%xcc,	loop_27
	or	%o4,	%o7,	%o1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
loop_27:
	st	%f29,	[%l7 + 0x4C]
	nop
	set	0x48, %l5
	std	%o2,	[%l7 + %l5]
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f30
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x88,	%g2
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	set	0x62, %o0
	stha	%o3,	[%l7 + %o0] 0x80
	set	0x16, %g5
	stha	%g6,	[%l7 + %g5] 0x89
	or	%l3,	%o6,	%i1
	and	%l4,	%l1,	%g3
	set	0x60, %i5
	ldxa	[%l7 + %i5] 0x88,	%l2
	nop
	nop
	setx	0xEC5F2017,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x5F4EC4DF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f14,	%f6
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x80,	%i7
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc0
	set	0x48, %g4
	lda	[%l7 + %g4] 0x89,	%f10
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x88,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%l0
	ble,a	%icc,	loop_28
	add	%g4,	%i3,	%i2
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x81,	%o0
loop_28:
	nop
	set	0x08, %o1
	stda	%i6,	[%l7 + %o1] 0x88
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f16
	nop
	set	0x54, %l2
	stw	%i0,	[%l7 + %l2]
	nop
	set	0x42, %o7
	stb	%i5,	[%l7 + %o7]
	set	0x30, %l3
	ldda	[%l7 + %l3] 0xe2,	%g0
	nop
	set	0x3C, %l1
	lduh	[%l7 + %l1],	%l6
	nop
	set	0x28, %o6
	swap	[%l7 + %o6],	%l5
	set	0x5E, %i2
	stha	%g5,	[%l7 + %i2] 0xeb
	membar	#Sync
	fpsub32s	%f18,	%f17,	%f8
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%g6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x88,	%o4
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x80,	%o1
	nop
	set	0x16, %g3
	lduh	[%l7 + %g3],	%o7
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x88,	 2
	nop
	set	0x0C, %i0
	stw	%o3,	[%l7 + %i0]
	set	0x40, %g1
	lda	[%l7 + %g1] 0x89,	%f8
	nop
	set	0x5E, %i3
	sth	%g2,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x38, %g7
	ldsw	[%l7 + %g7],	%g6
	and	%o6,	%i1,	%l3
	nop
	set	0x30, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x88
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	nop
	set	0x48, %o5
	stx	%g3,	[%l7 + %o5]
	set	0x10, %o0
	lda	[%l7 + %o0] 0x89,	%f9
	set	0x64, %g5
	lda	[%l7 + %g5] 0x89,	%f30
	set	0x6A, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l1
	set	0x78, %l0
	stxa	%i7,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x38, %i5
	stx	%l2,	[%l7 + %i5]
	wr	%o5,	%i4,	%set_softint
	set	0x70, %g4
	stxa	%g4,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x30, %o2
	stda	%l0,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x30, %o3
	ldstub	[%l7 + %o3],	%i2
	nop
	set	0x68, %l6
	ldsb	[%l7 + %l6],	%o0
	nop
	set	0x72, %o1
	ldub	[%l7 + %o1],	%i3
	wr	%i0,	%i6,	%set_softint
	wr	%i5,	%g1,	%set_softint
	nop
	set	0x20, %l2
	prefetch	[%l7 + %l2],	 0
	nop
	set	0x74, %o7
	swap	[%l7 + %o7],	%l6
	and	%g5,	%l5,	%g7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%o7
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x89,	%o2
	set	0x6C, %l1
	stwa	%o1,	[%l7 + %l1] 0xe3
	membar	#Sync
	bge,a	%xcc,	loop_29
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%o2
	nop
	set	0x24, %o6
	ldsb	[%l7 + %o6],	%g2
	nop
	set	0x78, %i2
	lduw	[%l7 + %i2],	%o6
loop_29:
	add	%g6,	%i1,	%l4
	nop
	set	0x2E, %g2
	ldsh	[%l7 + %g2],	%g3
	nop
	set	0x20, %i6
	stx	%l3,	[%l7 + %i6]
	set	0x40, %g3
	prefetcha	[%l7 + %g3] 0x80,	 1
	nop
	set	0x2C, %l4
	stw	%i7,	[%l7 + %l4]
	nop
	set	0x4C, %i0
	prefetch	[%l7 + %i0],	 2
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x80,	%l2
	nop
	set	0x30, %i7
	ldsh	[%l7 + %i7],	%i4
	nop
	set	0x38, %i3
	sth	%o5,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	nop
	set	0x28, %g7
	swap	[%l7 + %g7],	%g4
	set	0x70, %l5
	stda	%l0,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x88,	%o0
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 3
	st	%f31,	[%l7 + 0x38]
	and	%i2,	%i3,	%i6
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%l6
	st	%f28,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x68, %i1
	ldsh	[%l7 + %i1],	%i0
	set	0x1C, %g5
	sta	%f13,	[%l7 + %g5] 0x88
	nop
	set	0x3C, %l0
	ldstub	[%l7 + %l0],	%g5
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x89,	 3
	nop
	set	0x60, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%o7
	set	0x48, %o2
	stxa	%o4,	[%l7 + %o2] 0x80
	nop
	set	0x70, %l6
	ldsw	[%l7 + %l6],	%o2
	st	%fsr,	[%l7 + 0x1C]
	set	0x0C, %o1
	stwa	%o3,	[%l7 + %o1] 0x81
	set	0x2C, %l2
	sta	%f30,	[%l7 + %l2] 0x89
	st	%fsr,	[%l7 + 0x30]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	set	0x14, %o3
	lda	[%l7 + %o3] 0x88,	%f17
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x81,	%o0
	nop
	set	0x0D, %o4
	ldstub	[%l7 + %o4],	%o6
	nop
	set	0x10, %l3
	stw	%g2,	[%l7 + %l3]
	set	0x18, %i2
	swapa	[%l7 + %i2] 0x80,	%g6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	and	%i1,	%g3,	%l4
	bgu	%icc,	loop_30
	st	%f16,	[%l7 + 0x78]
	set	0x14, %o6
	stba	%l3,	[%l7 + %o6] 0x80
loop_30:
	nop
	set	0x28, %i6
	ldsb	[%l7 + %i6],	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%l2
	nop
	set	0x4A, %l4
	sth	%o5,	[%l7 + %l4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f0
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	fpsub16s	%f14,	%f23,	%f27
	nop
	set	0x74, %g3
	lduw	[%l7 + %g3],	%i4
	nop
	set	0x14, %i3
	lduw	[%l7 + %i3],	%l0
	set	0x18, %i7
	lda	[%l7 + %i7] 0x89,	%f17
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%g4
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x88,	%o0
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%i2
	set	0x3D, %g6
	stba	%i3,	[%l7 + %g6] 0x81
	set	0x18, %o0
	sta	%f23,	[%l7 + %o0] 0x80
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%g1
	set	0x50, %i1
	stxa	%i5,	[%l7 + %i1] 0x80
	nop
	set	0x4C, %g5
	ldsw	[%l7 + %g5],	%l6
	nop
	set	0x14, %o5
	lduh	[%l7 + %o5],	%i0
	nop
	set	0x30, %g4
	prefetch	[%l7 + %g4],	 2
	set	0x1C, %i5
	swapa	[%l7 + %i5] 0x89,	%l5
	nop
	set	0x74, %o2
	lduw	[%l7 + %o2],	%g7
	set	0x40, %l6
	sta	%f14,	[%l7 + %l6] 0x80
	st	%f29,	[%l7 + 0x4C]
	nop
	set	0x34, %l0
	ldsw	[%l7 + %l0],	%o7
	nop
	set	0x34, %o1
	sth	%g5,	[%l7 + %o1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%o2
	nop
	set	0x2C, %l2
	stw	%o1,	[%l7 + %l2]
	ld	[%l7 + 0x38],	%f23
	fpsub16s	%f30,	%f4,	%f5
	set	0x70, %o3
	stwa	%o3,	[%l7 + %o3] 0x80
	nop
	set	0x3B, %o7
	stb	%g2,	[%l7 + %o7]
	nop
	set	0x56, %o4
	lduh	[%l7 + %o4],	%o6
	set	0x38, %l3
	swapa	[%l7 + %l3] 0x80,	%i1
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%g6
	nop
	set	0x62, %i2
	ldub	[%l7 + %i2],	%l4
	nop
	set	0x6C, %o6
	sth	%l3,	[%l7 + %o6]
	nop
	set	0x08, %g2
	ldub	[%l7 + %g2],	%i7
	nop
	set	0x5D, %i6
	ldsb	[%l7 + %i6],	%g3
	set	0x54, %i0
	swapa	[%l7 + %i0] 0x81,	%l1
	and	%l2,	%o5,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%g4
	or	%i2,	%o0,	%i6
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%i3
	nop
	set	0x46, %g3
	ldsh	[%l7 + %g3],	%i5
	nop
	set	0x70, %g1
	stw	%g1,	[%l7 + %g1]
	and	%i0,	%l6,	%g7
	nop
	set	0x5E, %i3
	ldsb	[%l7 + %i3],	%l5
	or	%g5,	%o4,	%o2
	nop
	set	0x40, %g7
	stw	%o1,	[%l7 + %g7]
	and	%o7,	%g2,	%o6
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%o3
	bl,a,pt	%xcc,	loop_31
	st	%f31,	[%l7 + 0x2C]
	nop
	set	0x38, %l5
	stx	%i1,	[%l7 + %l5]
	nop
	set	0x6E, %i4
	ldub	[%l7 + %i4],	%l4
loop_31:
	nop
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x89,	%g6
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x81,	%i6
	nop
	set	0x3C, %i1
	ldsh	[%l7 + %i1],	%g3
	nop
	set	0x3F, %o5
	stb	%l3,	[%l7 + %o5]
	nop
	set	0x0C, %g4
	ldsh	[%l7 + %g4],	%l2
	set	0x4B, %g5
	stba	%l1,	[%l7 + %g5] 0x89
	set	0x41, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o5
	set	0x70, %i5
	lda	[%l7 + %i5] 0x89,	%f0
	set	0x14, %l6
	swapa	[%l7 + %l6] 0x80,	%i4
	and	%g4,	%l0,	%o0
	or	%i2,	%i3,	%i6
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f30
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x81,	%g1
	set	0x10, %l0
	stxa	%i5,	[%l7 + %l0] 0xe2
	membar	#Sync
	add	%i0,	%l6,	%l5
	and	%g5,	%o4,	%g7
	nop
	set	0x28, %o7
	std	%o2,	[%l7 + %o7]
	nop
	set	0x10, %o3
	std	%o0,	[%l7 + %o3]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%o6
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%o3
	ld	[%l7 + 0x34],	%f24
	nop
	set	0x50, %o4
	std	%f12,	[%l7 + %o4]
	nop
	set	0x44, %l1
	stw	%g2,	[%l7 + %l1]
	set	0x20, %o6
	sta	%f7,	[%l7 + %o6] 0x81
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%i1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x3C, %i0
	swap	[%l7 + %i0],	%g6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA48, 	%tick_cmpr
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x74, %l4
	ldsw	[%l7 + %l4],	%l4
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f30
	ld	[%l7 + 0x4C],	%f6
	ld	[%l7 + 0x40],	%f2
	set	0x14, %g3
	stwa	%l3,	[%l7 + %g3] 0x81
	fpsub16s	%f30,	%f24,	%f12
	set	0x18, %g1
	sta	%f22,	[%l7 + %g1] 0x81
	set	0x6B, %i3
	stba	%l2,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 3
	set	0x36, %i7
	stha	%o5,	[%l7 + %i7] 0x88
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xe3,	%l0
	nop
	set	0x38, %o0
	lduw	[%l7 + %o0],	%g4
	add	%i4,	%l0,	%o0
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%i2
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%i6
	nop
	set	0x4D, %i1
	ldsb	[%l7 + %i1],	%g1
	fpsub16	%f22,	%f2,	%f20
	set	0x14, %o5
	stwa	%i3,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x68, %g5
	lduw	[%l7 + %g5],	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%l5
	nop
	set	0x50, %g4
	std	%f14,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x78, %o2
	stx	%l6,	[%l7 + %o2]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd8
	nop
	set	0x28, %o1
	std	%f0,	[%l7 + %o1]
	and	%o4,	%g7,	%o2
	nop
	set	0x2B, %l2
	ldstub	[%l7 + %l2],	%o1
	set	0x24, %l0
	ldstuba	[%l7 + %l0] 0x89,	%g5
	and	%o6,	%o3,	%o7
	bgu,pn	%xcc,	loop_32
	nop
	nop
	setx	0xD19A516BB865AADF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7F3DAB5719A671EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f2,	%f28
	set	0x74, %i5
	sta	%f8,	[%l7 + %i5] 0x88
loop_32:
	ld	[%l7 + 0x10],	%f17
	set	0x0C, %o3
	swapa	[%l7 + %o3] 0x88,	%g2
	nop
	set	0x0C, %o7
	ldsw	[%l7 + %o7],	%i1
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x81,	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%i7
	set	0x78, %o4
	lda	[%l7 + %o4] 0x89,	%f14
	set	0x11, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l4
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%l2
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%l3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%g4
	nop
	set	0x10, %i2
	std	%o4,	[%l7 + %i2]
	fpadd16	%f18,	%f22,	%f14
	nop
	set	0x40, %l4
	stw	%i4,	[%l7 + %l4]
	set	0x40, %g2
	lda	[%l7 + %g2] 0x89,	%f15
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%o0
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x88,	%l0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g1
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xda
	set	0x66, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i6
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f26
	set	0x7C, %g6
	sta	%f8,	[%l7 + %g6] 0x81
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f16
	st	%f22,	[%l7 + 0x50]
	ld	[%l7 + 0x54],	%f29
	fpadd16	%f26,	%f6,	%f16
	nop
	set	0x68, %i1
	std	%f14,	[%l7 + %i1]
	ld	[%l7 + 0x34],	%f18
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%i3
	nop
	set	0x68, %o5
	ldub	[%l7 + %o5],	%i5
	nop
	set	0x74, %g5
	stw	%i0,	[%l7 + %g5]
	set	0x19, %g4
	stba	%l6,	[%l7 + %g4] 0xe3
	membar	#Sync
	add	%o4,	%g7,	%l5
	nop
	set	0x64, %o2
	swap	[%l7 + %o2],	%o1
	or	%o2,	%o6,	%g5
	nop
	set	0x52, %l6
	ldsh	[%l7 + %l6],	%o7
	set	0x14, %l2
	lda	[%l7 + %l2] 0x88,	%f25
	set	0x68, %o1
	stda	%o2,	[%l7 + %o1] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc4
	nop
	set	0x3E, %l0
	lduh	[%l7 + %l0],	%i1
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x80,	%g2
	set	0x70, %o4
	stwa	%g3,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
	nop
	set	0x38, %o3
	stx	%g6,	[%l7 + %o3]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%i7
	set	0x30, %i6
	lda	[%l7 + %i6] 0x80,	%f11
	nop
	set	0x58, %i2
	std	%l2,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x0C]
	set	0x20, %l1
	sta	%f23,	[%l7 + %l1] 0x80
	set	0x5C, %g2
	ldstuba	[%l7 + %g2] 0x88,	%l1
	set	0x50, %g3
	stda	%g4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x10, %g1
	sth	%o5,	[%l7 + %g1]
	st	%f29,	[%l7 + 0x14]
	wr	%i4,	%l3,	%clear_softint
	set	0x40, %i0
	stha	%o0,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x89
	set	0x64, %g7
	stha	%i2,	[%l7 + %g7] 0x80
	nop
	set	0x58, %i7
	stx	%g1,	[%l7 + %i7]
	and	%l0,	%i6,	%i5
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f26
	nop
	set	0x08, %o0
	sth	%i3,	[%l7 + %o0]
	nop
	set	0x5C, %i1
	swap	[%l7 + %i1],	%l6
	ld	[%l7 + 0x30],	%f16
	nop
	set	0x54, %l5
	sth	%o4,	[%l7 + %l5]
	set	0x68, %g6
	lda	[%l7 + %g6] 0x80,	%f1
	set	0x50, %o5
	stxa	%g7,	[%l7 + %o5] 0x81
	nop
	set	0x73, %g5
	stb	%l5,	[%l7 + %g5]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%o0
	ld	[%l7 + 0x18],	%f30
	set	0x54, %o2
	swapa	[%l7 + %o2] 0x89,	%i0
	set	0x0A, %l6
	stha	%o2,	[%l7 + %l6] 0x80
	nop
	set	0x28, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x74, %l2
	swapa	[%l7 + %l2] 0x88,	%g5
	add	%o6,	%o3,	%o7
	set	0x0C, %l0
	stha	%i1,	[%l7 + %l0] 0x80
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1277
!	Type a   	: 21
!	Type x   	: 512
!	Type cti   	: 32
!	Type f   	: 43
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
.word 0x4E4AF8F3
.word 0xD506FF8A
.word 0xFA24730B
.word 0xFB5F032F
.word 0xBD5FC058
.word 0xB90A2742
.word 0xCD0BA224
.word 0xCEEC7400
.word 0xAA165F05
.word 0xFA0011B2
.word 0x5110AFBB
.word 0x5D9CE049
.word 0x178D656F
.word 0x2F7C263B
.word 0xD108A86B
.word 0x1E2E1EB5
.word 0x5FF38A0F
.word 0x82914810
.word 0xC5C3E189
.word 0xC108A392
.word 0xCD56C110
.word 0x61EC3E52
.word 0x56900D21
.word 0xB65CDB54
.word 0x722895EE
.word 0xC9366623
.word 0x2F648DBC
.word 0xF93DFFFC
.word 0x2B1D0D46
.word 0xE47DA8D2
.word 0x3B01BBBD
.word 0x7007CEAD
.word 0x5097DD72
.word 0x37DE40C7
.word 0xB045DA28
.word 0x49DB2726
.word 0x51251724
.word 0xF3C54D94
.word 0x0511EF63
.word 0x50C5B475
.word 0x32A480A0
.word 0xAE8B521D
.word 0xE66EDC30
.word 0xA6FF1F32
.word 0xB2B8FE96
.word 0x2865887B
.word 0x025A6068
.word 0x43F4642C
.word 0x839BFA33
.word 0xED1C6CA3
.word 0xBA34758C
.word 0x706C49A7
.word 0x6E704448
.word 0xDBCF3D18
.word 0x4BA1F553
.word 0xA2BCAF12
.word 0x21D77E6D
.word 0xB6E693A7
.word 0x76FD08A2
.word 0x584BD295
.word 0x393885E5
.word 0x98D014BA
.word 0x8C56BB6B
.word 0xC2A172C0
.end
