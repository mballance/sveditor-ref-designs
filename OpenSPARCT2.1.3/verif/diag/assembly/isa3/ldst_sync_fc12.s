/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc12.s
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
	set	0x5,	%g2
	set	0x0,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0x3,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xC,	%i1
	set	-0x5,	%i2
	set	-0xC,	%i3
	set	-0x7,	%i4
	set	-0xE,	%i5
	set	-0x4,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x620C97C4,	%l0
	set	0x07A2D4FA,	%l1
	set	0x2EE2D521,	%l2
	set	0x171BDE63,	%l3
	set	0x0F88B322,	%l4
	set	0x585DE9A3,	%l5
	set	0x488C00F5,	%l6
	!# Output registers
	set	0x0382,	%o0
	set	-0x01F1,	%o1
	set	-0x0ACC,	%o2
	set	0x006B,	%o3
	set	-0x0951,	%o4
	set	-0x14B4,	%o5
	set	0x0204,	%o6
	set	0x1427,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEE79DCB990C03F41)
	INIT_TH_FP_REG(%l7,%f2,0xBC8A8255ADB5D51A)
	INIT_TH_FP_REG(%l7,%f4,0x0A15D915FA4701C8)
	INIT_TH_FP_REG(%l7,%f6,0xE19249661C28FB98)
	INIT_TH_FP_REG(%l7,%f8,0xA2B58D43F22BE482)
	INIT_TH_FP_REG(%l7,%f10,0xC87088979B351D8B)
	INIT_TH_FP_REG(%l7,%f12,0xE3E2B42C792F6CD3)
	INIT_TH_FP_REG(%l7,%f14,0x51E453342A4153E6)
	INIT_TH_FP_REG(%l7,%f16,0x4932DDE4B7EB191A)
	INIT_TH_FP_REG(%l7,%f18,0x178959368903DA40)
	INIT_TH_FP_REG(%l7,%f20,0xF8B9CBF4B2E74C91)
	INIT_TH_FP_REG(%l7,%f22,0xEF7D9A76AD158A74)
	INIT_TH_FP_REG(%l7,%f24,0x61513C5C3A5E04DF)
	INIT_TH_FP_REG(%l7,%f26,0x8740D73532BAEFAE)
	INIT_TH_FP_REG(%l7,%f28,0x3A3E82184A9A8723)
	INIT_TH_FP_REG(%l7,%f30,0xF4DCB3E2AF0D9F95)

	!# Execute Main Diag ..

	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x88,	 2
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x89,	 3
	nop
	set	0x10, %i3
	std	%i0,	[%l7 + %i3]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd0,	%f0
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%g4
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f22
	nop
	set	0x32, %g6
	ldsh	[%l7 + %g6],	%i5
	set	0x43, %g2
	stba	%i6,	[%l7 + %g2] 0x80
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f0
	set	0x38, %l3
	lda	[%l7 + %l3] 0x81,	%f20
	set	0x1C, %l5
	ldstuba	[%l7 + %l5] 0x89,	%l3
	bleu,pt	%icc,	loop_1
	nop
	set	0x14, %o6
	swap	[%l7 + %o6],	%l1
	ld	[%l7 + 0x0C],	%f11
	bgu,a	%xcc,	loop_2
loop_1:
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%g0
	set	0x22, %l0
	stha	%i4,	[%l7 + %l0] 0xe3
	membar	#Sync
loop_2:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%o5
	nop
	set	0x50, %o4
	lduw	[%l7 + %o4],	%g4
	st	%fsr,	[%l7 + 0x78]
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	nop
	set	0x58, %g7
	ldsb	[%l7 + %g7],	%l4
	set	0x46, %i0
	stha	%o4,	[%l7 + %i0] 0x88
	bgu,a	%xcc,	loop_3
	nop
	set	0x70, %o0
	ldub	[%l7 + %o0],	%g3
	set	0x4A, %i1
	stha	%o6,	[%l7 + %i1] 0x81
loop_3:
	nop
	set	0x28, %l2
	stda	%i6,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x28, %i7
	std	%g2,	[%l7 + %i7]
	set	0x60, %g1
	prefetcha	[%l7 + %g1] 0x89,	 2
	set	0x2A, %o7
	stha	%l0,	[%l7 + %o7] 0x80
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i7
	nop
	set	0x38, %l4
	std	%o6,	[%l7 + %l4]
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f16
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x80,	%f21
	set	0x6A, %i5
	stha	%l2,	[%l7 + %i5] 0xea
	membar	#Sync
	wr	%o3,	%i2,	%y
	nop
	set	0x1C, %i6
	stw	%o0,	[%l7 + %i6]
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%g7
	set	0x74, %g3
	stwa	%i3,	[%l7 + %g3] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	bgu	%icc,	loop_4
	st	%fsr,	[%l7 + 0x34]
	set	0x2C, %g4
	stwa	%i1,	[%l7 + %g4] 0x89
loop_4:
	nop
	set	0x34, %i3
	stha	%i0,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x50, %i4
	std	%g4,	[%l7 + %i4]
	set	0x78, %l6
	stxa	%i6,	[%l7 + %l6] 0xe2
	membar	#Sync
	fpsub16s	%f23,	%f15,	%f4
	nop
	set	0x2C, %l1
	ldstub	[%l7 + %l1],	%i5
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x88
	nop
	set	0x38, %l3
	stx	%g1,	[%l7 + %l3]
	set	0x59, %o5
	stba	%l1,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x19, %o6
	stb	%g6,	[%l7 + %o6]
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%i4
	set	0x48, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g4
	st	%fsr,	[%l7 + 0x50]
	set	0x65, %o4
	stba	%o5,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%l4
	nop
	set	0x53, %g7
	ldsb	[%l7 + %g7],	%o1
	set	0x16, %i0
	stba	%o4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x20, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x5C, %i1
	stwa	%g3,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x74, %l2
	swapa	[%l7 + %l2] 0x80,	%l6
	nop
	set	0x58, %g1
	prefetch	[%l7 + %g1],	 3
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x18, %o7
	sth	%g2,	[%l7 + %o7]
	or	%o6,	%o2,	%l0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xea,	%i6
	set	0x58, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	ld	[%l7 + 0x2C],	%f9
	nop
	set	0x20, %i7
	ldub	[%l7 + %i7],	%l2
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%o7
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	ld	[%l7 + 0x4C],	%f2
	set	0x50, %i6
	lda	[%l7 + %i6] 0x88,	%f17
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%o0
	set	0x1A, %g3
	stha	%o3,	[%l7 + %g3] 0xea
	membar	#Sync
	and	%g7,	%i1,	%i0
	set	0x60, %i3
	lda	[%l7 + %i3] 0x81,	%f12
	nop
	set	0x70, %g4
	std	%i2,	[%l7 + %g4]
	wr 	%g0, 	0x4, 	%fprs
	wr	%l3,	%g1,	%pic
	add	%l1,	%g6,	%i6
	st	%fsr,	[%l7 + 0x7C]
	set	0x15, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i4
	nop
	set	0x3E, %l6
	ldub	[%l7 + %l6],	%g4
	nop
	set	0x78, %l1
	stw	%o5,	[%l7 + %l1]
	fpsub16s	%f29,	%f31,	%f26
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc4
	set	0x4C, %g6
	stha	%l4,	[%l7 + %g6] 0x81
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x18, %o5
	ldsh	[%l7 + %o5],	%o1
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f30
	nop
	set	0x30, %l0
	std	%g2,	[%l7 + %l0]
	set	0x68, %o6
	sta	%f1,	[%l7 + %o6] 0x80
	set	0x0C, %o4
	stba	%o4,	[%l7 + %o4] 0x89
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x6C, %g7
	swap	[%l7 + %g7],	%l6
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xe3,	%g2
	or	%o6,	%o2,	%l0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc8
	set	0x5F, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i7
	nop
	set	0x29, %l2
	ldstub	[%l7 + %l2],	%l2
	nop
	set	0x5F, %g1
	stb	%o7,	[%l7 + %g1]
	set	0x3C, %o0
	lda	[%l7 + %o0] 0x81,	%f24
	nop
	set	0x50, %l4
	stw	%i2,	[%l7 + %l4]
	nop
	set	0x21, %o1
	stb	%l5,	[%l7 + %o1]
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%o3
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%o0
	nop
	set	0x40, %i5
	std	%i0,	[%l7 + %i5]
	set	0x4A, %i6
	ldstuba	[%l7 + %i6] 0x89,	%i0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f0
	and	%g7,	%g5,	%i3
	set	0x2D, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i5
	nop
	set	0x79, %g5
	stb	%g1,	[%l7 + %g5]
	set	0x68, %g4
	stba	%l1,	[%l7 + %g4] 0x89
	ld	[%l7 + 0x08],	%f22
	nop
	set	0x08, %i4
	sth	%g6,	[%l7 + %i4]
	nop
	set	0x78, %i3
	stx	%l3,	[%l7 + %i3]
	nop
	set	0x68, %l6
	stx	%i6,	[%l7 + %l6]
	st	%f10,	[%l7 + 0x10]
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x81,	%f16
	set	0x54, %g6
	lda	[%l7 + %g6] 0x80,	%f6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%g4
	nop
	set	0x18, %l3
	swap	[%l7 + %l3],	%l4
	nop
	set	0x0E, %l1
	ldub	[%l7 + %l1],	%o1
	ld	[%l7 + 0x10],	%f14
	nop
	set	0x40, %o5
	lduh	[%l7 + %o5],	%g3
	nop
	set	0x46, %l5
	ldstub	[%l7 + %l5],	%o4
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x88,	%o5
	set	0x60, %o4
	ldda	[%l7 + %o4] 0xe2,	%i6
	st	%f24,	[%l7 + 0x60]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%o2
	fpsub32	%f2,	%f30,	%f30
	nop
	set	0x10, %l0
	ldsw	[%l7 + %l0],	%g2
	nop
	set	0x70, %i2
	swap	[%l7 + %i2],	%l0
	nop
	set	0x10, %g7
	std	%f0,	[%l7 + %g7]
	nop
	set	0x44, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x20, %i0
	ldstub	[%l7 + %i0],	%l2
	ld	[%l7 + 0x58],	%f28
	nop
	set	0x60, %i1
	stw	%i7,	[%l7 + %i1]
	set	0x38, %g1
	stxa	%i2,	[%l7 + %g1] 0xea
	membar	#Sync
	ld	[%l7 + 0x38],	%f0
	set	0x30, %l2
	ldxa	[%l7 + %l2] 0x80,	%o7
	and	%o3,	%l5,	%i1
	add	%i0,	%g7,	%o0
	add	%g5,	%i3,	%g1
	set	0x28, %l4
	swapa	[%l7 + %l4] 0x89,	%l1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f0
	nop
	set	0x30, %i7
	stx	%i5,	[%l7 + %i7]
	set	0x14, %o0
	stha	%g6,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x58, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i6
	ld	[%l7 + 0x18],	%f14
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%g4
	nop
	set	0x0D, %i6
	stb	%l4,	[%l7 + %i6]
	set	0x6F, %o2
	stba	%l3,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x69, %g3
	ldsb	[%l7 + %g3],	%o1
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe3,	%g2
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x78, %i5
	std	%f16,	[%l7 + %i5]
	nop
	set	0x08, %g4
	stx	%o5,	[%l7 + %g4]
	nop
	set	0x78, %i4
	lduh	[%l7 + %i4],	%o4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc0
	nop
	set	0x4F, %g2
	ldsb	[%l7 + %g2],	%l6
	nop
	set	0x10, %g6
	std	%o6,	[%l7 + %g6]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%o2
	nop
	set	0x6D, %l3
	ldstub	[%l7 + %l3],	%g2
	nop
	set	0x78, %o5
	ldx	[%l7 + %o5],	%l0
	nop
	set	0x30, %l5
	ldsh	[%l7 + %l5],	%i7
	nop
	set	0x70, %o6
	swap	[%l7 + %o6],	%l2
	nop
	set	0x66, %o4
	lduh	[%l7 + %o4],	%o7
	nop
	set	0x2A, %l0
	lduh	[%l7 + %l0],	%i2
	set	0x2C, %i2
	stba	%o3,	[%l7 + %i2] 0x88
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%i1,	%l5,	%i0
	set	0x48, %o3
	stwa	%o0,	[%l7 + %o3] 0x81
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xea,	%g4
	nop
	set	0x24, %i0
	stb	%g7,	[%l7 + %i0]
	and	%g1,	%i3,	%i5
	nop
	set	0x08, %i1
	ldsb	[%l7 + %i1],	%l1
	nop
	set	0x58, %l2
	ldsh	[%l7 + %l2],	%i6
	st	%f15,	[%l7 + 0x0C]
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x80,	%i4
	ld	[%l7 + 0x78],	%f7
	nop
	set	0x5E, %o1
	lduh	[%l7 + %o1],	%g6
	set	0x18, %i7
	sta	%f22,	[%l7 + %i7] 0x81
	nop
	set	0x40, %o0
	std	%f6,	[%l7 + %o0]
	nop
	set	0x28, %g1
	ldub	[%l7 + %g1],	%g4
	or	%l4,	%l3,	%o1
	nop
	set	0x5A, %i6
	ldstub	[%l7 + %i6],	%o5
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%g3
	add	%l6,	%o6,	%o4
	st	%f21,	[%l7 + 0x14]
	nop
	set	0x6C, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x38, %o2
	stba	%o2,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x08, %i5
	ldsh	[%l7 + %i5],	%g2
	set	0x24, %g4
	lda	[%l7 + %g4] 0x89,	%f10
	set	0x68, %g5
	sta	%f12,	[%l7 + %g5] 0x89
	nop
	set	0x4A, %i4
	ldsh	[%l7 + %i4],	%l0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x80
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xeb,	%l2
	nop
	set	0x38, %g2
	ldsh	[%l7 + %g2],	%i7
	nop
	set	0x10, %l3
	std	%i2,	[%l7 + %l3]
	set	0x56, %o5
	stha	%o3,	[%l7 + %o5] 0x80
	set	0x35, %l5
	stba	%i1,	[%l7 + %l5] 0x88
	nop
	set	0x3E, %i3
	ldsb	[%l7 + %i3],	%l5
	or	%i0,	%o0,	%g5
	nop
	set	0x10, %o4
	ldsh	[%l7 + %o4],	%g7
	ld	[%l7 + 0x6C],	%f6
	set	0x50, %o6
	swapa	[%l7 + %o6] 0x89,	%o7
	nop
	set	0x4E, %l0
	ldstub	[%l7 + %l0],	%i3
	add	%i5,	%l1,	%g1
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%i6
	nop
	set	0x30, %o3
	swap	[%l7 + %o3],	%i4
	nop
	set	0x24, %g7
	swap	[%l7 + %g7],	%g6
	ld	[%l7 + 0x0C],	%f13
	nop
	set	0x2C, %i0
	lduh	[%l7 + %i0],	%l4
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%l3
	ld	[%l7 + 0x08],	%f31
	nop
	set	0x58, %l2
	std	%f22,	[%l7 + %l2]
	nop
	set	0x1B, %i1
	ldsb	[%l7 + %i1],	%o1
	nop
	set	0x20, %l4
	std	%f16,	[%l7 + %l4]
	nop
	nop
	setx	0xCD0BD1D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x4CB48640,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f24,	%f28
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g3
	set	0x18, %i7
	stda	%i6,	[%l7 + %i7] 0x88
	nop
	set	0x5E, %o0
	sth	%o6,	[%l7 + %o0]
	set	0x40, %g1
	ldxa	[%l7 + %g1] 0x81,	%g4
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x88,	 1
	set	0x3A, %o7
	stha	%o4,	[%l7 + %o7] 0xe3
	membar	#Sync
	or	%l0,	%l2,	%g2
	add	%i7,	%i2,	%o3
	or	%l5,	%i1,	%o0
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x88,	%i0
	set	0x70, %o2
	stxa	%g5,	[%l7 + %o2] 0x80
	set	0x40, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	set	0x30, %i5
	lda	[%l7 + %i5] 0x89,	%f27
	nop
	set	0x48, %g5
	lduw	[%l7 + %g5],	%o7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%i3
	set	0x31, %g4
	stba	%g1,	[%l7 + %g4] 0x89
	set	0x60, %i4
	stda	%l0,	[%l7 + %i4] 0x80
	nop
	set	0x22, %l6
	ldub	[%l7 + %l6],	%i6
	set	0x7C, %g6
	lda	[%l7 + %g6] 0x80,	%f22
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%i4
	nop
	set	0x0A, %o5
	stb	%l4,	[%l7 + %o5]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%g6
	ld	[%l7 + 0x30],	%f7
	set	0x20, %l5
	stda	%o0,	[%l7 + %l5] 0x80
	set	0x10, %o4
	ldda	[%l7 + %o4] 0xe2,	%o4
	set	0x44, %l0
	lda	[%l7 + %l0] 0x80,	%f9
	nop
	set	0x7C, %o6
	ldsh	[%l7 + %o6],	%l6
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%o6
	set	0x10, %i2
	sta	%f15,	[%l7 + %i2] 0x88
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x81,	 3
	nop
	set	0x4C, %g7
	ldsh	[%l7 + %g7],	%o2
	set	0x6A, %l1
	stha	%o4,	[%l7 + %l1] 0x81
	nop
	set	0x34, %l2
	stb	%l0,	[%l7 + %l2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x50, %i1
	lduw	[%l7 + %i1],	%i7
	or	%i2,	%o3,	%l2
	nop
	set	0x24, %l4
	stw	%l5,	[%l7 + %l4]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	nop
	set	0x68, %i7
	ldsh	[%l7 + %i7],	%o0
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xeb,	%i0
	set	0x14, %o7
	stba	%i1,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd2
	nop
	set	0x2C, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%g7
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 0
	st	%fsr,	[%l7 + 0x30]
	wr	%g5,	%o7,	%y
	ld	[%l7 + 0x0C],	%f31
	add	%i3,	%g1,	%i5
	nop
	set	0x58, %g5
	std	%l0,	[%l7 + %g5]
	set	0x28, %g4
	stda	%i6,	[%l7 + %g4] 0x81
	set	0x5C, %i4
	sta	%f22,	[%l7 + %i4] 0x89
	nop
	set	0x10, %i5
	ldstub	[%l7 + %i5],	%l4
	nop
	set	0x2B, %l6
	ldstub	[%l7 + %l6],	%l3
	nop
	set	0x7A, %l3
	ldub	[%l7 + %l3],	%i4
	fpadd32	%f30,	%f10,	%f6
	set	0x58, %o5
	sta	%f0,	[%l7 + %o5] 0x88
	set	0x50, %g6
	stxa	%g6,	[%l7 + %g6] 0x81
	nop
	set	0x70, %i3
	std	%o0,	[%l7 + %i3]
	ld	[%l7 + 0x64],	%f4
	nop
	set	0x7E, %g2
	ldstub	[%l7 + %g2],	%l6
	nop
	set	0x50, %l5
	stw	%o5,	[%l7 + %l5]
	set	0x7C, %o4
	stba	%o6,	[%l7 + %o4] 0x81
	set	0x18, %l0
	lda	[%l7 + %l0] 0x81,	%f2
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%g4
	st	%f22,	[%l7 + 0x44]
	nop
	set	0x40, %o6
	stx	%o4,	[%l7 + %o6]
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x81,	%o2
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x81,	%l0
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x89,	%g2
	st	%f12,	[%l7 + 0x3C]
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x88,	%g2
	nop
	set	0x48, %g7
	sth	%i2,	[%l7 + %g7]
	set	0x70, %l4
	stha	%o3,	[%l7 + %l4] 0xe3
	membar	#Sync
	fpadd16s	%f18,	%f7,	%f11
	set	0x58, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i7
	nop
	set	0x38, %i7
	std	%l4,	[%l7 + %i7]
	nop
	set	0x18, %o0
	std	%o0,	[%l7 + %o0]
	nop
	set	0x18, %o1
	stx	%l2,	[%l7 + %o1]
	nop
	set	0x45, %o7
	stb	%i0,	[%l7 + %o7]
	nop
	set	0x0D, %i6
	ldstub	[%l7 + %i6],	%g7
	and	%i1,	%o7,	%i3
	add	%g1,	%i5,	%g5
	and	%i6,	%l4,	%l3
	and	%i4,	%l1,	%g6
	nop
	set	0x20, %o2
	std	%o0,	[%l7 + %o2]
	nop
	set	0x3C, %g1
	stw	%o5,	[%l7 + %g1]
	nop
	set	0x58, %g3
	stx	%l6,	[%l7 + %g3]
	set	0x0C, %g4
	swapa	[%l7 + %g4] 0x80,	%g4
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f0
	nop
	set	0x60, %i5
	stx	%o6,	[%l7 + %i5]
	nop
	set	0x70, %g5
	lduw	[%l7 + %g5],	%o2
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	set	0x4D, %o5
	stba	%l0,	[%l7 + %o5] 0x88
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f10
	or	%g3,	%o4,	%g2
	set	0x60, %i3
	stxa	%i2,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%i7
	set	0x2C, %l5
	swapa	[%l7 + %l5] 0x89,	%o3
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x89,	%f31
	set	0x30, %l0
	stwa	%l5,	[%l7 + %l0] 0x88
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x88,	%l2
	set	0x51, %o6
	stba	%i0,	[%l7 + %o6] 0x81
	nop
	set	0x3F, %i0
	ldub	[%l7 + %i0],	%o0
	set	0x70, %o4
	sta	%f22,	[%l7 + %o4] 0x88
	nop
	set	0x68, %i2
	std	%g6,	[%l7 + %i2]
	nop
	set	0x40, %l2
	lduw	[%l7 + %l2],	%i1
	nop
	set	0x08, %l1
	swap	[%l7 + %l1],	%o7
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%g1
	nop
	set	0x0A, %l4
	ldsh	[%l7 + %l4],	%i5
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x17, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i3
	nop
	set	0x72, %o0
	ldsh	[%l7 + %o0],	%i6
	and	%g5,	%l4,	%i4
	set	0x14, %o7
	lda	[%l7 + %o7] 0x88,	%f12
	set	0x64, %o2
	lda	[%l7 + %o2] 0x89,	%f10
	set	0x54, %i6
	lda	[%l7 + %i6] 0x89,	%f6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf8
	membar	#Sync
	ld	[%l7 + 0x58],	%f22
	st	%f29,	[%l7 + 0x28]
	ld	[%l7 + 0x24],	%f14
	set	0x50, %g3
	ldda	[%l7 + %g3] 0xeb,	%l2
	add	%l1,	%o1,	%g6
	set	0x45, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o5
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xeb,	%g4
	nop
	set	0x0A, %g5
	ldsh	[%l7 + %g5],	%o6
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%o2
	or	%l6,	%g3,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%i2
	nop
	set	0x74, %o5
	ldsh	[%l7 + %o5],	%i7
	set	0x79, %l6
	stba	%o3,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x47, %g6
	ldub	[%l7 + %g6],	%l5
	st	%fsr,	[%l7 + 0x18]
	ld	[%l7 + 0x50],	%f31
	add	%l2,	%o4,	%i0
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f0
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f2
	set	0x7E, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g7
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x88,	%i1
	set	0x70, %l0
	stda	%o0,	[%l7 + %l0] 0x88
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f16
	nop
	set	0x2C, %i0
	stw	%g1,	[%l7 + %i0]
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x88,	%o7
	set	0x78, %i2
	swapa	[%l7 + %i2] 0x89,	%i5
	and	%i6,	%i3,	%l4
	ld	[%l7 + 0x18],	%f20
	nop
	set	0x37, %o4
	ldsb	[%l7 + %o4],	%i4
	or	%g5,	%l3,	%l1
	be	%xcc,	loop_5
	nop
	set	0x70, %l1
	prefetch	[%l7 + %l1],	 2
	set	0x24, %g7
	stwa	%o1,	[%l7 + %g7] 0xeb
	membar	#Sync
loop_5:
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%o4
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f16
	nop
	set	0x4C, %i7
	ldub	[%l7 + %i7],	%g4
	nop
	set	0x40, %i1
	std	%o6,	[%l7 + %i1]
	nop
	set	0x5B, %o0
	ldstub	[%l7 + %o0],	%g6
	st	%fsr,	[%l7 + 0x44]
	set	0x38, %o7
	stwa	%o2,	[%l7 + %o7] 0x81
	nop
	set	0x18, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	and	%l0,	%g2,	%g3
	or	%i2,	%o3,	%l5
	set	0x48, %o1
	stda	%l2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x0C, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o4
	fpadd32s	%f11,	%f26,	%f26
	st	%fsr,	[%l7 + 0x14]
	set	0x1C, %i4
	sta	%f2,	[%l7 + %i4] 0x89
	set	0x71, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i7
	set	0x4C, %g4
	swapa	[%l7 + %g4] 0x80,	%i0
	nop
	set	0x70, %i5
	std	%f6,	[%l7 + %i5]
	and	%g7,	%i1,	%g1
	nop
	set	0x38, %o5
	std	%o6,	[%l7 + %o5]
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x65, %l6
	stb	%i5,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x20]
	set	0x50, %l3
	stda	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%i2
	nop
	set	0x6E, %g2
	ldsh	[%l7 + %g2],	%o0
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	nop
	set	0x7F, %l0
	ldub	[%l7 + %l0],	%l4
	set	0x3C, %o6
	swapa	[%l7 + %o6] 0x89,	%i4
	or	%l3,	%g5,	%o1
	set	0x38, %i3
	lda	[%l7 + %i3] 0x89,	%f22
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x89,	%o5
	set	0x58, %i2
	sta	%f22,	[%l7 + %i2] 0x81
	nop
	set	0x79, %o4
	ldsb	[%l7 + %o4],	%g4
	nop
	set	0x20, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x34, %o3
	swap	[%l7 + %o3],	%o6
	st	%fsr,	[%l7 + 0x5C]
	set	0x54, %g7
	sta	%f9,	[%l7 + %g7] 0x89
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%l1
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%o2
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x88,	 1
	ld	[%l7 + 0x14],	%f18
	nop
	set	0x20, %o0
	stw	%l0,	[%l7 + %o0]
	nop
	set	0x18, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x5C, %o2
	ldsw	[%l7 + %o2],	%g2
	and	%l6,	%g3,	%i2
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%l4
	and	%o3,	%l2,	%o4
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%i0
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x88,	 4
	nop
	set	0x54, %g3
	stb	%i1,	[%l7 + %g3]
	nop
	set	0x48, %i4
	ldsw	[%l7 + %i4],	%i7
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f10
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%g0
	st	%fsr,	[%l7 + 0x58]
	set	0x08, %o5
	swapa	[%l7 + %o5] 0x89,	%o7
	set	0x49, %i5
	stba	%i5,	[%l7 + %i5] 0xe3
	membar	#Sync
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o0
	nop
	set	0x34, %g5
	swap	[%l7 + %g5],	%l4
	set	0x78, %l6
	lda	[%l7 + %l6] 0x89,	%f1
	nop
	set	0x0B, %l3
	ldstub	[%l7 + %l3],	%i4
	and	%i3,	%g5,	%o1
	or	%o5,	%g4,	%l3
	and	%o6,	%l1,	%o2
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x81,	%l0
	nop
	set	0x5C, %g6
	ldstub	[%l7 + %g6],	%g2
	nop
	set	0x0C, %l0
	stb	%g6,	[%l7 + %l0]
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x81,	%g3
	or	%l6,	%i2,	%o3
	nop
	set	0x1A, %l5
	stb	%l2,	[%l7 + %l5]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f0
	nop
	set	0x3C, %i2
	ldsw	[%l7 + %i2],	%l5
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f26
	nop
	set	0x4A, %o4
	sth	%i0,	[%l7 + %o4]
	nop
	set	0x28, %l1
	swap	[%l7 + %l1],	%g7
	nop
	set	0x40, %g7
	std	%f4,	[%l7 + %g7]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd0
	and	%i1,	%i7,	%o4
	set	0x58, %l4
	ldstuba	[%l7 + %l4] 0x88,	%g1
	nop
	set	0x3B, %l2
	stb	%o7,	[%l7 + %l2]
	st	%f16,	[%l7 + 0x2C]
	nop
	set	0x48, %i1
	lduw	[%l7 + %i1],	%i6
	set	0x28, %o0
	stda	%i4,	[%l7 + %o0] 0x89
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f24
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc8
	nop
	set	0x78, %i6
	stw	%o0,	[%l7 + %i6]
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%l4
	nop
	set	0x70, %o1
	stw	%i4,	[%l7 + %o1]
	nop
	set	0x78, %g3
	swap	[%l7 + %g3],	%g5
	nop
	set	0x18, %i4
	ldsw	[%l7 + %i4],	%o1
	set	0x26, %g1
	stha	%i3,	[%l7 + %g1] 0x81
	or	%g4,	%l3,	%o6
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%o5
	nop
	set	0x68, %i5
	std	%f24,	[%l7 + %i5]
	nop
	set	0x52, %g5
	lduh	[%l7 + %g5],	%l1
	nop
	set	0x38, %l6
	lduh	[%l7 + %l6],	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%g6
	set	0x38, %g4
	stha	%g3,	[%l7 + %g4] 0x81
	ld	[%l7 + 0x20],	%f15
	or	%l6,	%o2,	%i2
	bleu,a,pn	%icc,	loop_6
	st	%f16,	[%l7 + 0x2C]
	nop
	set	0x75, %g2
	ldstub	[%l7 + %g2],	%l2
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x80,	%o3
loop_6:
	nop
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x81,	%l4
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%i0
	nop
	set	0x68, %l5
	std	%i0,	[%l7 + %l5]
	wr	%g7,	%o4,	%sys_tick
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x81,	 3
	set	0x40, %i2
	stda	%i6,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x70, %i0
	stx	%i6,	[%l7 + %i0]
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x89,	%o7
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%o0
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x80,	%l4
	nop
	set	0x5A, %o3
	ldsb	[%l7 + %o3],	%i4
	or	%g5,	%i5,	%i3
	set	0x08, %l4
	stda	%o0,	[%l7 + %l4] 0x88
	nop
	set	0x68, %l2
	lduw	[%l7 + %l2],	%l3
	set	0x30, %i1
	stxa	%o6,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f22
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xe2,	%g4
	bn,a,pt	%icc,	loop_7
	nop
	set	0x10, %o2
	lduw	[%l7 + %o2],	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%g2
loop_7:
	nop
	set	0x1C, %i6
	lduw	[%l7 + %i6],	%o5
	nop
	set	0x18, %o7
	std	%f24,	[%l7 + %o7]
	set	0x30, %o1
	stwa	%g3,	[%l7 + %o1] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o2
	nop
	set	0x40, %i7
	std	%f8,	[%l7 + %i7]
	set	0x60, %i4
	stxa	%g6,	[%l7 + %i4] 0x88
	nop
	set	0x24, %g3
	swap	[%l7 + %g3],	%i2
	nop
	set	0x30, %g1
	std	%f14,	[%l7 + %g1]
	st	%f30,	[%l7 + 0x08]
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%o3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%i0
	set	0x64, %g5
	stwa	%i1,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x50, %o5
	swap	[%l7 + %o5],	%l2
	nop
	set	0x5C, %l6
	ldsh	[%l7 + %l6],	%o4
	nop
	set	0x48, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x38, %g2
	swap	[%l7 + %g2],	%g7
	add	%i7,	%g1,	%o7
	nop
	set	0x22, %l3
	ldstub	[%l7 + %l3],	%i6
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%l4
	fpadd16s	%f20,	%f11,	%f14
	nop
	set	0x30, %l5
	stw	%i4,	[%l7 + %l5]
	nop
	set	0x50, %l0
	stw	%g5,	[%l7 + %l0]
	add	%o0,	%i5,	%i3
	and	%o1,	%l3,	%g4
	nop
	set	0x7A, %g6
	ldsh	[%l7 + %g6],	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%g2
	nop
	set	0x08, %i0
	stw	%o6,	[%l7 + %i0]
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%g3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o2
	nop
	nop
	setx	0xFDBBF238389CA6C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4D5B80BA71667D17,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f16
	nop
	set	0x34, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x20, %i2
	stxa	%g6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x30, %o3
	stda	%i2,	[%l7 + %o3] 0x89
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f20
	nop
	set	0x4A, %l2
	lduh	[%l7 + %l2],	%o5
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x81,	%l4
	or	%i0,	%o3,	%l2
	nop
	set	0x3E, %l1
	ldstub	[%l7 + %l1],	%i1
	or	%o4,	%i7,	%g1
	set	0x28, %g7
	stxa	%g7,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf0
	membar	#Sync
	fpadd32	%f26,	%f14,	%f16
	nop
	set	0x7A, %o0
	sth	%i6,	[%l7 + %o0]
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%o7
	st	%fsr,	[%l7 + 0x70]
	or	%i4,	%l4,	%o0
	add	%g5,	%i3,	%i5
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f14
	set	0x7C, %i7
	swapa	[%l7 + %i7] 0x80,	%o1
	nop
	set	0x55, %o1
	ldub	[%l7 + %o1],	%g4
	set	0x34, %g3
	stba	%l1,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%l3
	nop
	set	0x18, %i5
	stw	%g2,	[%l7 + %i5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%g3
	fpsub16s	%f19,	%f17,	%f8
	nop
	set	0x66, %g1
	sth	%o6,	[%l7 + %g1]
	nop
	set	0x20, %o5
	stx	%l6,	[%l7 + %o5]
	nop
	set	0x73, %g5
	ldstub	[%l7 + %g5],	%o2
	ld	[%l7 + 0x60],	%f5
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f16
	set	0x17, %g2
	stba	%i2,	[%l7 + %g2] 0xea
	membar	#Sync
	or	%g6,	%o5,	%i0
	ld	[%l7 + 0x5C],	%f24
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%l2
	nop
	set	0x50, %o6
	stx	%l5,	[%l7 + %o6]
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%o4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%i7
	nop
	set	0x50, %g6
	stw	%g1,	[%l7 + %g6]
	bg,pt	%xcc,	loop_8
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f6
	set	0x3C, %i0
	swapa	[%l7 + %i0] 0x89,	%g7
loop_8:
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%i6
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%o7
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x81,	%i4
	nop
	set	0x68, %i2
	std	%f8,	[%l7 + %i2]
	nop
	set	0x38, %l4
	ldub	[%l7 + %l4],	%l4
	nop
	set	0x0F, %i1
	stb	%i1,	[%l7 + %i1]
	add	%o0,	%i3,	%i5
	nop
	set	0x62, %l1
	ldsb	[%l7 + %l1],	%g5
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x81,	%g4
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x28, %o2
	std	%f0,	[%l7 + %o2]
	add	%l1,	%o1,	%g2
	nop
	set	0x58, %o0
	swap	[%l7 + %o0],	%l3
	set	0x40, %o7
	swapa	[%l7 + %o7] 0x80,	%g3
	st	%f30,	[%l7 + 0x48]
	set	0x48, %l2
	stxa	%o6,	[%l7 + %l2] 0x81
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x52, %i6
	stha	%l6,	[%l7 + %i6] 0x88
	set	0x3C, %o1
	stba	%o2,	[%l7 + %o1] 0x80
	nop
	set	0x50, %g3
	swap	[%l7 + %g3],	%l0
	add	%g6,	%i2,	%o5
	or	%i0,	%l2,	%o3
	add	%l5,	%i7,	%g1
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%o4
	bgu,a,pt	%xcc,	loop_9
	nop
	set	0x10, %g1
	stb	%i6,	[%l7 + %g1]
	set	0x4C, %o5
	swapa	[%l7 + %o5] 0x80,	%o7
loop_9:
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x40, %i4
	stx	%i4,	[%l7 + %i4]
	set	0x3E, %g4
	stba	%g7,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x34, %g2
	sta	%f25,	[%l7 + %g2] 0x81
	set	0x6B, %l6
	stba	%l4,	[%l7 + %l6] 0xe2
	membar	#Sync
	and	%o0,	%i1,	%i3
	set	0x74, %o6
	lda	[%l7 + %o6] 0x81,	%f13
	nop
	set	0x58, %l5
	sth	%i5,	[%l7 + %l5]
	set	0x64, %g6
	swapa	[%l7 + %g6] 0x81,	%g5
	ld	[%l7 + 0x2C],	%f0
	add	%l1,	%o1,	%g2
	nop
	set	0x57, %l0
	ldsb	[%l7 + %l0],	%g4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x74, %l3
	ldstub	[%l7 + %l3],	%l3
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x81,	%g3
	ld	[%l7 + 0x6C],	%f29
	set	0x5E, %o4
	stha	%o6,	[%l7 + %o4] 0x81
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x28, %o3
	sta	%f29,	[%l7 + %o3] 0x88
	nop
	set	0x50, %l4
	std	%f8,	[%l7 + %l4]
	nop
	set	0x78, %i2
	std	%i6,	[%l7 + %i2]
	nop
	set	0x5E, %i1
	stb	%o2,	[%l7 + %i1]
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%g6
	set	0x54, %o2
	stba	%i2,	[%l7 + %o2] 0xea
	membar	#Sync
	fpadd32s	%f26,	%f4,	%f3
	bl,a,pn	%xcc,	loop_10
	ld	[%l7 + 0x38],	%f10
	nop
	set	0x3F, %o0
	ldub	[%l7 + %o0],	%l0
	nop
	set	0x78, %g7
	ldsh	[%l7 + %g7],	%o5
loop_10:
	st	%fsr,	[%l7 + 0x5C]
	set	0x10, %l2
	stda	%i0,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	and	%o3,	%l2,	%l5
	set	0x1F, %i6
	stba	%i7,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%o7
	add	%i4,	%g7,	%l4
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%o0
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x10, %i5
	ldsb	[%l7 + %i5],	%i6
	nop
	set	0x0C, %o5
	stw	%i1,	[%l7 + %o5]
	nop
	set	0x2C, %g5
	swap	[%l7 + %g5],	%i5
	nop
	set	0x20, %g1
	std	%f30,	[%l7 + %g1]
	set	0x47, %i4
	stba	%i3,	[%l7 + %i4] 0x88
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x39, %g2
	ldstub	[%l7 + %g2],	%l1
	nop
	set	0x40, %o6
	std	%o0,	[%l7 + %o6]
	nop
	set	0x6F, %l5
	stb	%g2,	[%l7 + %l5]
	nop
	set	0x1C, %g6
	stw	%g5,	[%l7 + %g6]
	nop
	set	0x58, %l6
	ldsw	[%l7 + %l6],	%l3
	set	0x4C, %l0
	stha	%g3,	[%l7 + %l0] 0x88
	st	%f29,	[%l7 + 0x70]
	nop
	set	0x70, %i3
	stx	%g4,	[%l7 + %i3]
	set	0x50, %l3
	stha	%l6,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x58, %i0
	stda	%o2,	[%l7 + %i0] 0x88
	set	0x48, %o3
	sta	%f14,	[%l7 + %o3] 0x81
	nop
	set	0x58, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x6E, %l4
	stba	%o6,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f4
	nop
	set	0x53, %l1
	ldub	[%l7 + %l1],	%g6
	nop
	set	0x70, %g7
	stx	%i2,	[%l7 + %g7]
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0
	set	0x0C, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc2
	nop
	set	0x30, %i6
	sth	%i0,	[%l7 + %i6]
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%i7
	ld	[%l7 + 0x7C],	%f3
	set	0x4B, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g1
	bne,a	%icc,	loop_11
	nop
	set	0x13, %i5
	ldsb	[%l7 + %i5],	%o4
	nop
	set	0x61, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%f20
loop_11:
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f12
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%o7
	nop
	set	0x76, %g2
	sth	%i4,	[%l7 + %g2]
	nop
	set	0x2C, %o6
	lduw	[%l7 + %o6],	%l4
	set	0x5C, %g6
	stba	%g7,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x68, %l0
	stba	%i1,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f30
	nop
	set	0x53, %l3
	ldub	[%l7 + %l3],	%i5
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%i2
	nop
	set	0x44, %i3
	ldsh	[%l7 + %i3],	%l1
	nop
	set	0x5C, %o4
	lduw	[%l7 + %o4],	%o1
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xe2,	%g2
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x81,	%i6
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f18
	nop
	set	0x42, %o2
	stb	%g5,	[%l7 + %o2]
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	add	%g4,	%l6,	%o2
	set	0x3E, %g7
	stha	%l3,	[%l7 + %g7] 0x81
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x6B, %l1
	stb	%o6,	[%l7 + %l1]
	nop
	set	0x08, %o0
	stx	%g6,	[%l7 + %o0]
	set	0x24, %l2
	stwa	%o5,	[%l7 + %l2] 0x89
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%l0
	st	%f24,	[%l7 + 0x0C]
	st	%f19,	[%l7 + 0x54]
	nop
	set	0x68, %i7
	stw	%i0,	[%l7 + %i7]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd2
	nop
	set	0x20, %o1
	swap	[%l7 + %o1],	%i2
	nop
	set	0x40, %i5
	std	%l4,	[%l7 + %i5]
	set	0x60, %g5
	stwa	%i7,	[%l7 + %g5] 0xeb
	membar	#Sync
	wr	%g1,	%o3,	%sys_tick
	set	0x6A, %o7
	stha	%o4,	[%l7 + %o7] 0x88
	set	0x10, %o5
	stwa	%o7,	[%l7 + %o5] 0xeb
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%l4
	nop
	set	0x74, %g4
	swap	[%l7 + %g4],	%l2
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%o0
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
	or	%i1,	%i3,	%l1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f16
	st	%fsr,	[%l7 + 0x48]
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	nop
	set	0x3A, %g6
	ldsb	[%l7 + %g6],	%i5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%g5
	set	0x14, %l6
	swapa	[%l7 + %l6] 0x81,	%g3
	set	0x2F, %l5
	stba	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x78, %l3
	stha	%l6,	[%l7 + %l3] 0x88
	nop
	set	0x58, %l0
	ldsw	[%l7 + %l0],	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%g2
	add	%o5,	%g6,	%i0
	set	0x34, %i3
	lda	[%l7 + %i3] 0x88,	%f29
	or	%i2,	%l0,	%l5
	bl,pn	%xcc,	loop_12
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%g1
	nop
	set	0x70, %l4
	stx	%i7,	[%l7 + %l4]
	or	%o3,	%o7,	%o4
loop_12:
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%i4
	set	0x0C, %o3
	stwa	%l4,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f0
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%l2
	nop
	set	0x7C, %o0
	stb	%g7,	[%l7 + %o0]
	fpadd32s	%f24,	%f0,	%f13
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	nop
	set	0x0C, %l1
	stw	%i1,	[%l7 + %l1]
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x80,	%i3
	nop
	set	0x38, %i6
	lduh	[%l7 + %i6],	%l1
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%o1
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%i5
	add	%g5,	%i6,	%g3
	wr	%g4,	%l6,	%y
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xda
	be	%icc,	loop_13
	nop
	set	0x54, %o7
	ldstub	[%l7 + %o7],	%l3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f16
loop_13:
	nop
	set	0x50, %g1
	std	%o2,	[%l7 + %g1]
	set	0x78, %o5
	stha	%o6,	[%l7 + %o5] 0x88
	nop
	set	0x3D, %o6
	ldub	[%l7 + %o6],	%g2
	nop
	set	0x5C, %g2
	stw	%o5,	[%l7 + %g2]
	set	0x10, %i4
	lda	[%l7 + %i4] 0x80,	%f23
	set	0x42, %l6
	stha	%g6,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x7C, %g6
	lduw	[%l7 + %g6],	%i0
	bge,a	%icc,	loop_14
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%i2
	add	%l0,	%l5,	%i7
	nop
	set	0x25, %l0
	ldsb	[%l7 + %l0],	%o3
loop_14:
	st	%fsr,	[%l7 + 0x14]
	and	%g1,	%o4,	%o7
	nop
	set	0x73, %i0
	ldstub	[%l7 + %i0],	%l4
	nop
	set	0x70, %i3
	stx	%i4,	[%l7 + %i3]
	nop
	set	0x54, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x5A, %l4
	stha	%g7,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x38, %i2
	std	%f2,	[%l7 + %i2]
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%l2
	set	0x25, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o0
	nop
	set	0x73, %o2
	ldsb	[%l7 + %o2],	%i1
	set	0x33, %i1
	stba	%i3,	[%l7 + %i1] 0x80
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x89,	%o1
	fpsub16s	%f24,	%f13,	%f18
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	set	0x1E, %g7
	stha	%l1,	[%l7 + %g7] 0x80
	or	%g5,	%g3,	%i6
	nop
	set	0x38, %l1
	std	%f30,	[%l7 + %l1]
	nop
	set	0x10, %i6
	std	%g4,	[%l7 + %i6]
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%l2
	nop
	set	0x38, %g3
	stw	%l6,	[%l7 + %g3]
	set	0x1A, %o1
	stha	%o2,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x5C, %o7
	stw	%g2,	[%l7 + %o7]
	nop
	set	0x70, %i5
	stw	%o6,	[%l7 + %i5]
	set	0x51, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g6
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f24
	and	%o5,	%i0,	%i2
	nop
	set	0x32, %o6
	lduh	[%l7 + %o6],	%l5
	set	0x3C, %g2
	sta	%f15,	[%l7 + %g2] 0x80
	set	0x10, %g1
	stxa	%i7,	[%l7 + %g1] 0xe2
	membar	#Sync
	bgu,pt	%xcc,	loop_15
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x89,	%o2
loop_15:
	nop
	set	0x10, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%g1
	add	%o7,	%l4,	%o4
	nop
	nop
	setx	0x17306F752979B9C6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1E420FA4492B15F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f18
	nop
	set	0x64, %i0
	swap	[%l7 + %i0],	%i4
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x30, %l0
	lduh	[%l7 + %l0],	%g7
	add	%l2,	%o0,	%i1
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%g3
	add	%i6,	%g4,	%l1
	or	%l6,	%o2,	%l3
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%o6
	nop
	set	0x40, %o3
	ldx	[%l7 + %o3],	%g6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%i0
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x89,	%o5
	set	0x57, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l5
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
	nop
	set	0x3E, %l2
	ldsh	[%l7 + %l2],	%i7
	nop
	set	0x65, %g7
	ldub	[%l7 + %g7],	%o3
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 0
	fpadd32s	%f9,	%f19,	%f27
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x81,	%l0
	set	0x30, %i7
	stda	%i2,	[%l7 + %i7] 0x88
	set	0x4A, %g3
	stha	%o7,	[%l7 + %g3] 0x89
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf0
	membar	#Sync
	wr	%g1,	%o4,	%clear_softint
	and	%i4,	%l4,	%l2
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xe2,	%o0
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%i1
	and	%i5,	%g5,	%g3
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
	nop
	set	0x66, %o6
	sth	%i6,	[%l7 + %o6]
	nop
	set	0x78, %g2
	ldsh	[%l7 + %g2],	%i3
	nop
	set	0x18, %g1
	ldsh	[%l7 + %g1],	%g4
	bgu	%icc,	loop_16
	nop
	set	0x6E, %o5
	lduh	[%l7 + %o5],	%l6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc2
loop_16:
	ld	[%l7 + 0x4C],	%f16
	nop
	set	0x20, %l6
	stx	%o2,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x20, %i4
	std	%l2,	[%l7 + %i4]
	set	0x46, %l3
	stha	%l1,	[%l7 + %l3] 0x88
	nop
	set	0x0C, %i3
	stw	%g6,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%o5
	set	0x14, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l5
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%i6
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f16
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	set	0x18, %o3
	stwa	%o3,	[%l7 + %o3] 0x89
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf0
	membar	#Sync
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%l0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x80
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x89,	%i2
	and	%g1,	%o7,	%o4
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%i4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%o1
	or	%l2,	%i1,	%i5
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i6
	nop
	set	0x2E, %l1
	ldsh	[%l7 + %l1],	%i3
	fpsub16	%f22,	%f22,	%f16
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x81,	%g3
	and	%g4,	%o2,	%l6
	nop
	set	0x35, %g3
	ldstub	[%l7 + %g3],	%l3
	set	0x67, %i6
	stba	%l1,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x14, %o1
	ldsw	[%l7 + %o1],	%g6
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x80,	%f28
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o5
	set	0x69, %o7
	stba	%l5,	[%l7 + %o7] 0x81
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%g2
	set	0x68, %g4
	swapa	[%l7 + %g4] 0x81,	%i7
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf9
	membar	#Sync
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x81,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%o7
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%o4
	bg,pt	%xcc,	loop_17
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%g1
	nop
	set	0x3C, %g6
	sth	%l4,	[%l7 + %g6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%g7
loop_17:
	nop
	set	0x18, %o6
	stx	%i4,	[%l7 + %o6]
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%o1
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%l2
	set	0x42, %i3
	stba	%i1,	[%l7 + %i3] 0x89
	set	0x60, %l0
	stda	%i4,	[%l7 + %l0] 0x88
	nop
	set	0x60, %i0
	ldsw	[%l7 + %i0],	%g5
	ld	[%l7 + 0x48],	%f12
	set	0x16, %i4
	stha	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	fpadd16s	%f26,	%f21,	%f22
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%g2
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x80,	%g4
	nop
	set	0x3C, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x40, %o2
	swap	[%l7 + %o2],	%o2
	set	0x78, %l5
	stxa	%i3,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x88,	%l6
	be,pn	%icc,	loop_18
	add	%l3,	%g6,	%l1
	set	0x18, %l2
	stda	%i0,	[%l7 + %l2] 0x88
loop_18:
	add	%o5,	%g2,	%i7
	nop
	set	0x70, %g7
	lduw	[%l7 + %g7],	%o3
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f12
	nop
	set	0x68, %l4
	std	%f6,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x14, %i7
	ldub	[%l7 + %i7],	%l5
	ld	[%l7 + 0x08],	%f3
	set	0x10, %i6
	stha	%o6,	[%l7 + %i6] 0x81
	nop
	set	0x54, %g3
	swap	[%l7 + %g3],	%i2
	nop
	set	0x08, %g5
	stx	%o7,	[%l7 + %g5]
	nop
	set	0x48, %o7
	std	%f24,	[%l7 + %o7]
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%l0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	nop
	set	0x3E, %o0
	sth	%g1,	[%l7 + %o0]
	nop
	set	0x3A, %o1
	sth	%o4,	[%l7 + %o1]
	nop
	set	0x1C, %g2
	lduw	[%l7 + %g2],	%l4
	nop
	nop
	setx	0x6F2BCCFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x254471FF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f19,	%f21
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc4
	nop
	set	0x7D, %g6
	ldsb	[%l7 + %g6],	%g7
	set	0x30, %o6
	stxa	%i4,	[%l7 + %o6] 0x81
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf9
	membar	#Sync
	nop
	set	0x28, %l6
	sth	%o1,	[%l7 + %l6]
	and	%l2,	%i1,	%o0
	nop
	set	0x12, %l3
	lduh	[%l7 + %l3],	%i5
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%i6
	nop
	set	0x2F, %i3
	ldstub	[%l7 + %i3],	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%o2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%l6
	nop
	set	0x27, %i4
	stb	%g4,	[%l7 + %i4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f16
	ld	[%l7 + 0x64],	%f13
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%l1
	or	%l3,	%i0,	%g2
	set	0x10, %o3
	lda	[%l7 + %o3] 0x80,	%f11
	set	0x30, %o2
	lda	[%l7 + %o2] 0x89,	%f15
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%o4
	or	%o3,	%l5,	%o6
	nop
	set	0x68, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%f20
	nop
	set	0x30, %g7
	ldsw	[%l7 + %g7],	%i7
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%i2
	wr	%l0,	%g1,	%sys_tick
	ld	[%l7 + 0x14],	%f8
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x39, %l2
	ldstub	[%l7 + %l2],	%o7
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	set	0x6E, %i7
	stha	%l4,	[%l7 + %i7] 0xe3
	membar	#Sync
	or	%o4,	%g7,	%i4
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%l2
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	wr	%o1,	%i1,	%set_softint
	nop
	set	0x7B, %i5
	stb	%i5,	[%l7 + %i5]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i6
	set	0x28, %g4
	stda	%g2,	[%l7 + %g4] 0x81
	nop
	set	0x68, %o0
	swap	[%l7 + %o0],	%o2
	nop
	set	0x24, %o1
	prefetch	[%l7 + %o1],	 4
	or	%i3,	%l6,	%g5
	set	0x68, %g2
	sta	%f14,	[%l7 + %g2] 0x81
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x44, %g5
	stha	%g4,	[%l7 + %g5] 0x80
	set	0x51, %o6
	stba	%l1,	[%l7 + %o6] 0x81
	set	0x60, %g1
	ldda	[%l7 + %g1] 0xe3,	%l2
	ld	[%l7 + 0x74],	%f0
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f8
	st	%f18,	[%l7 + 0x08]
	nop
	set	0x38, %g6
	std	%f24,	[%l7 + %g6]
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x88,	 2
	nop
	set	0x28, %l0
	stw	%g2,	[%l7 + %l0]
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xe2,	%o4
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%o3
	nop
	set	0x32, %i2
	ldstub	[%l7 + %i2],	%l5
	wr	%o6,	%i0,	%softint
	set	0x6C, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i7
	set	0x4A, %i4
	stba	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x18, %o2
	lda	[%l7 + %o2] 0x80,	%f11
	nop
	set	0x58, %i1
	std	%i2,	[%l7 + %i1]
	and	%o7,	%l4,	%o4
	nop
	set	0x76, %o4
	ldsh	[%l7 + %o4],	%g1
	nop
	set	0x08, %l5
	swap	[%l7 + %l5],	%g7
	nop
	set	0x70, %l1
	std	%l2,	[%l7 + %l1]
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0
	nop
	nop
	setx	0x57498BABF7AAA062,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x3DB3AA12E3E76F5F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f26
	set	0x54, %l4
	sta	%f18,	[%l7 + %l4] 0x88
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%i1
	nop
	set	0x2E, %i6
	ldub	[%l7 + %i6],	%i5
	set	0x1E, %g3
	stha	%o0,	[%l7 + %g3] 0x80
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%i6
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x54, %g4
	stwa	%g3,	[%l7 + %g4] 0x80
	set	0x68, %o0
	stda	%o2,	[%l7 + %o0] 0x88
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%l6
	fpadd32s	%f21,	%f8,	%f8
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x80
	nop
	set	0x7C, %o1
	stw	%g5,	[%l7 + %o1]
	nop
	set	0x1A, %o5
	stb	%g4,	[%l7 + %o5]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%l1
	st	%f7,	[%l7 + 0x70]
	nop
	set	0x38, %g5
	ldsh	[%l7 + %g5],	%g6
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f4
	ld	[%l7 + 0x30],	%f24
	nop
	set	0x76, %l6
	lduh	[%l7 + %l6],	%l3
	set	0x28, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0
	nop
	set	0x30, %l3
	sth	%o5,	[%l7 + %l3]
	nop
	set	0x63, %l0
	ldstub	[%l7 + %l0],	%o3
	nop
	set	0x1E, %i3
	lduh	[%l7 + %i3],	%l5
	set	0x08, %i0
	sta	%f25,	[%l7 + %i0] 0x80
	fpadd16	%f0,	%f6,	%f18
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%o6
	and	%i0,	%i7,	%l0
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%i2
	nop
	set	0x3D, %i4
	ldub	[%l7 + %i4],	%o7
	nop
	set	0x78, %o2
	ldsw	[%l7 + %o2],	%o4
	nop
	set	0x3C, %i1
	stw	%l4,	[%l7 + %i1]
	set	0x38, %o6
	sta	%f9,	[%l7 + %o6] 0x80
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%g0
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f28
	nop
	set	0x50, %l1
	std	%l2,	[%l7 + %l1]
	nop
	set	0x30, %g7
	stw	%g7,	[%l7 + %g7]
	nop
	set	0x6F, %l2
	ldstub	[%l7 + %l2],	%i1
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x80,	 2
	set	0x28, %g3
	swapa	[%l7 + %g3] 0x81,	%o1
	fpadd16s	%f31,	%f2,	%f4
	or	%i6,	%g3,	%o2
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%l6
	set	0x09, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g5
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xea,	%i2
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xea,	%i4
	set	0x23, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l1
	nop
	set	0x6D, %o1
	ldub	[%l7 + %o1],	%g4
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%g6
	nop
	set	0x17, %o7
	stb	%g2,	[%l7 + %o7]
	nop
	set	0x74, %g1
	lduh	[%l7 + %g1],	%o5
	nop
	set	0x56, %g5
	ldsh	[%l7 + %g5],	%o3
	nop
	set	0x40, %g6
	std	%l4,	[%l7 + %g6]
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x20, %l3
	sth	%o6,	[%l7 + %l3]
	set	0x70, %i3
	sta	%f29,	[%l7 + %i3] 0x89
	nop
	set	0x10, %i0
	stx	%l3,	[%l7 + %i0]
	nop
	set	0x18, %l0
	stw	%i0,	[%l7 + %l0]
	wr	%l0,	%i2,	%pic
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x18, %o3
	ldub	[%l7 + %o3],	%i7
	wr	%o7,	%o4,	%pic
	nop
	set	0x72, %i4
	ldsh	[%l7 + %i4],	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%g1
	nop
	set	0x68, %o2
	stw	%g7,	[%l7 + %o2]
	add	%i1,	%o0,	%o1
	set	0x74, %i1
	lda	[%l7 + %i1] 0x88,	%f6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5A9, 	%tick_cmpr
	set	0x38, %o4
	sta	%f6,	[%l7 + %o4] 0x81
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x81,	%g2
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x89,	 4
	st	%f9,	[%l7 + 0x2C]
	nop
	set	0x78, %g7
	sth	%l6,	[%l7 + %g7]
	and	%i3,	%g5,	%l1
	set	0x31, %l1
	stba	%g4,	[%l7 + %l1] 0x88
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f0
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f2
	set	0x50, %i7
	stxa	%g6,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x20, %g3
	stwa	%i4,	[%l7 + %g3] 0x81
	nop
	set	0x30, %i6
	ldstub	[%l7 + %i6],	%o5
	nop
	set	0x18, %i5
	stx	%g2,	[%l7 + %i5]
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x80,	 1
	nop
	set	0x3C, %g2
	swap	[%l7 + %g2],	%l3
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%o6
	set	0x31, %o1
	stba	%l0,	[%l7 + %o1] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %o7
	std	%f20,	[%l7 + %o7]
	set	0x08, %g1
	stwa	%i0,	[%l7 + %g1] 0x81
	set	0x4C, %g5
	stwa	%i2,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x89,	%o7
	nop
	set	0x64, %l3
	swap	[%l7 + %l3],	%o4
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%i7
	set	0x30, %i0
	ldda	[%l7 + %i0] 0xea,	%l2
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x47, %o3
	ldsb	[%l7 + %o3],	%l4
	nop
	set	0x1C, %i4
	ldsh	[%l7 + %i4],	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%i1
	nop
	set	0x0A, %o2
	ldstub	[%l7 + %o2],	%o0
	set	0x50, %i1
	stxa	%i6,	[%l7 + %i1] 0x80
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%i5
	nop
	set	0x38, %o4
	lduw	[%l7 + %o4],	%o2
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x3D, %l5
	stba	%g3,	[%l7 + %l5] 0x88
	set	0x60, %g7
	sta	%f29,	[%l7 + %g7] 0x81
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%i2
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	set	0x48, %l4
	ldstuba	[%l7 + %l4] 0x89,	%g5
	set	0x70, %i7
	stha	%l1,	[%l7 + %i7] 0x81
	nop
	set	0x20, %g3
	stx	%g4,	[%l7 + %g3]
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x81,	%g6
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%o5
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%i4
	set	0x2C, %o0
	stwa	%g2,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x40, %g4
	lduw	[%l7 + %g4],	%o3
	or	%l5,	%o6,	%l3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%i2
	set	0x38, %g2
	swapa	[%l7 + %g2] 0x80,	%l0
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc2
	set	0x58, %o1
	stxa	%o4,	[%l7 + %o1] 0x88
	nop
	set	0x48, %o7
	lduw	[%l7 + %o7],	%i7
	nop
	set	0x70, %g5
	stw	%o7,	[%l7 + %g5]
	st	%f7,	[%l7 + 0x4C]
	set	0x60, %g6
	stda	%l2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x76, %i3
	sth	%g1,	[%l7 + %i3]
	nop
	set	0x1C, %g1
	ldsw	[%l7 + %g1],	%g7
	add	%l4,	%i1,	%i6
	fpsub16	%f18,	%f0,	%f20
	set	0x74, %l6
	lda	[%l7 + %l6] 0x88,	%f26
	set	0x48, %i0
	stwa	%o1,	[%l7 + %i0] 0x80
	bge,pn	%icc,	loop_19
	nop
	set	0x40, %i2
	std	%o0,	[%l7 + %i2]
	nop
	set	0x38, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x20]
loop_19:
	nop
	set	0x20, %o3
	std	%f14,	[%l7 + %o3]
	and	%o2,	%i5,	%i3
	nop
	set	0x64, %o2
	sth	%l6,	[%l7 + %o2]
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%g5
	and	%l1,	%g3,	%g6
	nop
	set	0x0E, %l0
	stb	%g4,	[%l7 + %l0]
	nop
	set	0x24, %i1
	ldsh	[%l7 + %i1],	%o5
	nop
	set	0x08, %g7
	lduw	[%l7 + %g7],	%i4
	nop
	set	0x5A, %l5
	ldsb	[%l7 + %l5],	%g2
	set	0x7C, %l2
	sta	%f28,	[%l7 + %l2] 0x88
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	add	%o3,	%l3,	%i0
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%i2
	nop
	set	0x08, %g3
	ldstub	[%l7 + %g3],	%l0
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	and	%o4,	%i7,	%o7
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf9
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x24, %i5
	lduw	[%l7 + %i5],	%o6
	set	0x4E, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%l4
	set	0x40, %g4
	stxa	%g1,	[%l7 + %g4] 0xeb
	membar	#Sync
	st	%f21,	[%l7 + 0x24]
	nop
	set	0x5C, %l4
	ldsh	[%l7 + %l4],	%i1
	nop
	set	0x34, %g2
	swap	[%l7 + %g2],	%o1
	bl,a,pn	%xcc,	loop_20
	nop
	set	0x08, %o1
	stw	%o0,	[%l7 + %o1]
	set	0x70, %o7
	stda	%o2,	[%l7 + %o7] 0xea
	membar	#Sync
loop_20:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%i5
	nop
	set	0x3F, %o5
	ldsb	[%l7 + %o5],	%i3
	nop
	set	0x2C, %g6
	ldsw	[%l7 + %g6],	%g5
	set	0x70, %g5
	stwa	%l6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x7E, %l3
	ldsh	[%l7 + %l3],	%g3
	nop
	set	0x11, %i3
	ldub	[%l7 + %i3],	%g6
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x81,	%l1
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f18
	nop
	set	0x40, %i0
	lduh	[%l7 + %i0],	%g4
	set	0x10, %i4
	stha	%i4,	[%l7 + %i4] 0x81
	add	%g2,	%l5,	%o3
	and	%o5,	%i0,	%i2
	fpadd16s	%f27,	%f29,	%f11
	set	0x68, %o3
	stha	%l3,	[%l7 + %o3] 0xeb
	membar	#Sync
	fpsub32s	%f31,	%f7,	%f11
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x81,	%o4
	set	0x24, %o4
	swapa	[%l7 + %o4] 0x81,	%i7
	set	0x30, %i2
	ldxa	[%l7 + %i2] 0x80,	%l0
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f30
	and	%o6,	%l2,	%g7
	set	0x58, %l0
	stda	%o6,	[%l7 + %l0] 0x89
	st	%fsr,	[%l7 + 0x7C]
	set	0x20, %l5
	swapa	[%l7 + %l5] 0x88,	%g1
	fpsub32s	%f0,	%f26,	%f6
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xe2,	%i0
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%o1
	ld	[%l7 + 0x14],	%f0
	set	0x78, %i7
	sta	%f4,	[%l7 + %i7] 0x89
	add	%l4,	%o0,	%i6
	nop
	set	0x48, %l2
	stx	%i5,	[%l7 + %l2]
	add	%i3,	%o2,	%g5
	nop
	set	0x58, %g3
	stx	%g3,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x74, %i6
	sth	%l6,	[%l7 + %i6]
	set	0x76, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g6
	nop
	set	0x0C, %o0
	ldsw	[%l7 + %o0],	%g4
	nop
	set	0x24, %o6
	ldsw	[%l7 + %o6],	%i4
	set	0x40, %l4
	sta	%f29,	[%l7 + %l4] 0x89
	set	0x30, %g4
	swapa	[%l7 + %g4] 0x88,	%l1
	nop
	set	0x4A, %g2
	stb	%g2,	[%l7 + %g2]
	add	%l5,	%o3,	%o5
	fpadd16s	%f14,	%f17,	%f21
	or	%i2,	%l3,	%o4
	set	0x2C, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i0
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f28
	set	0x34, %g6
	swapa	[%l7 + %g6] 0x81,	%l0
	nop
	set	0x1F, %o7
	stb	%o6,	[%l7 + %o7]
	nop
	set	0x5C, %g5
	ldub	[%l7 + %g5],	%i7
	bl,a	%xcc,	loop_21
	add	%g7,	%l2,	%g1
	set	0x7A, %i3
	stha	%i1,	[%l7 + %i3] 0xe3
	membar	#Sync
loop_21:
	nop
	set	0x0C, %l3
	ldsh	[%l7 + %l3],	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i6
	add	%i5,	%i3,	%o2
	set	0x5C, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g3
	nop
	set	0x56, %i0
	lduh	[%l7 + %i0],	%l6
	and	%g5,	%g4,	%g6
	nop
	set	0x25, %i4
	ldstub	[%l7 + %i4],	%i4
	add	%g2,	%l1,	%l5
	and	%o3,	%i2,	%o5
	nop
	set	0x67, %l6
	ldstub	[%l7 + %l6],	%o4
	bleu,a	%xcc,	loop_22
	nop
	set	0x78, %o2
	prefetch	[%l7 + %o2],	 3
	and	%l3,	%l0,	%o6
	set	0x10, %o4
	stda	%i0,	[%l7 + %o4] 0xe3
	membar	#Sync
loop_22:
	nop
	set	0x40, %i2
	std	%f2,	[%l7 + %i2]
	ble,pt	%icc,	loop_23
	nop
	set	0x78, %i1
	ldub	[%l7 + %i1],	%g7
	nop
	set	0x4E, %o3
	lduh	[%l7 + %o3],	%l2
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f28
loop_23:
	nop
	set	0x78, %l0
	lda	[%l7 + %l0] 0x81,	%f8
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%g1
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x81,	 2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%i1
	ld	[%l7 + 0x64],	%f8
	wr	%l4,	%o0,	%ccr
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%i5
	fpsub16s	%f3,	%f23,	%f28
	set	0x08, %i7
	stda	%o0,	[%l7 + %i7] 0xeb
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%i3
	set	0x64, %l2
	ldstuba	[%l7 + %l2] 0x81,	%g3
	nop
	set	0x30, %i6
	stw	%g5,	[%l7 + %i6]
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%i6
	bn,a	%icc,	loop_24
	add	%g4,	%i4,	%g6
	set	0x2C, %o0
	swapa	[%l7 + %o0] 0x89,	%l1
loop_24:
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%g2
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x80,	%o3
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x89,	%i2
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%o5
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%l5
	add	%l3,	%l0,	%o6
	set	0x2F, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o4
	or	%g7,	%l2,	%i0
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f22
	nop
	set	0x4D, %o7
	ldsb	[%l7 + %o7],	%g1
	nop
	set	0x6C, %o1
	swap	[%l7 + %o1],	%o7
	wr	%i1,	%l4,	%set_softint
	set	0x4C, %i3
	lda	[%l7 + %i3] 0x81,	%f23
	or	%o0,	%i7,	%i5
	nop
	set	0x6C, %l3
	stw	%i6,	[%l7 + %l3]
	set	0x60, %g1
	stxa	%o1,	[%l7 + %g1] 0x89
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%i3
	nop
	set	0x70, %g5
	stw	%o2,	[%l7 + %g5]
	add	%g3,	%l6,	%g5
	set	0x38, %l6
	lda	[%l7 + %l6] 0x89,	%f9
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%i4
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x80,	 3
	or	%g6,	%g2,	%l1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x60, %i4
	ldsw	[%l7 + %i4],	%i2
	set	0x74, %i1
	swapa	[%l7 + %i1] 0x88,	%o5
	set	0x3E, %o3
	ldstuba	[%l7 + %o3] 0x81,	%l5
	set	0x53, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l3
	set	0x6C, %l5
	lda	[%l7 + %l5] 0x88,	%f6
	set	0x3B, %l1
	stba	%l0,	[%l7 + %l1] 0x81
	wr	%o6,	%o3,	%softint
	st	%f31,	[%l7 + 0x5C]
	set	0x10, %g7
	ldda	[%l7 + %g7] 0xe3,	%g6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l2
	nop
	set	0x18, %l0
	sth	%i0,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x24]
	set	0x68, %l2
	stda	%o6,	[%l7 + %l2] 0x80
	and	%g1,	%l4,	%o0
	add	%i1,	%i7,	%i5
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x81,	%i6
	st	%f5,	[%l7 + 0x48]
	nop
	set	0x70, %g3
	stx	%o1,	[%l7 + %g3]
	set	0x0C, %o0
	lda	[%l7 + %o0] 0x81,	%f9
	nop
	set	0x40, %i5
	ldstub	[%l7 + %i5],	%o2
	wr	%i3,	%l6,	%y
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x89,	%g4
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	nop
	set	0x42, %l4
	sth	%g3,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x48, %g2
	ldsw	[%l7 + %g2],	%g4
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f14
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%g6
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xca
	set	0x5E, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g2
	ld	[%l7 + 0x60],	%f30
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%l1
	and	%i2,	%o5,	%l3
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x80,	%l5
	nop
	set	0x1A, %g1
	ldstub	[%l7 + %g1],	%o6
	set	0x28, %i0
	stxa	%l0,	[%l7 + %i0] 0x80
	nop
	set	0x30, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x1C, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x28, %o2
	std	%o2,	[%l7 + %o2]
	nop
	set	0x30, %l6
	stx	%o4,	[%l7 + %l6]
	set	0x48, %o4
	stxa	%i0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x44, %i4
	sth	%l2,	[%l7 + %i4]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%g0
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xea,	%o6
	nop
	set	0x14, %l5
	ldsh	[%l7 + %l5],	%o0
	nop
	set	0x7E, %l1
	ldsb	[%l7 + %l1],	%i1
	set	0x28, %g7
	stxa	%i7,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x28, %l0
	stda	%l4,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x78, %i2
	sta	%f6,	[%l7 + %i2] 0x80
	nop
	set	0x08, %l2
	sth	%i5,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x1C]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%o1
	nop
	set	0x6A, %i6
	lduh	[%l7 + %i6],	%o2
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x89,	%i6
	nop
	set	0x38, %i5
	ldsw	[%l7 + %i5],	%g5
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x81,	 4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%g4
	set	0x10, %o6
	sta	%f18,	[%l7 + %o6] 0x88
	set	0x68, %l4
	stda	%g2,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x44, %g2
	ldsb	[%l7 + %g2],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%g6
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%o5
	nop
	set	0x35, %o5
	ldub	[%l7 + %o5],	%i2
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%l5
	wr	%o6,	%l3,	%softint
	add	%l0,	%o3,	%g7
	wr	%o4,	%i0,	%y
	nop
	set	0x10, %g6
	std	%g0,	[%l7 + %g6]
	set	0x4C, %g4
	swapa	[%l7 + %g4] 0x88,	%l2
	set	0x70, %o1
	stxa	%o0,	[%l7 + %o1] 0x88
	st	%f9,	[%l7 + 0x24]
	nop
	set	0x18, %i3
	stx	%i1,	[%l7 + %i3]
	nop
	set	0x30, %g1
	std	%f16,	[%l7 + %g1]
	nop
	set	0x7F, %g5
	stb	%o7,	[%l7 + %g5]
	ld	[%l7 + 0x48],	%f21
	nop
	set	0x10, %i0
	std	%f2,	[%l7 + %i0]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l4
	or	%i5,	%o1,	%i6
	nop
	set	0x78, %o2
	std	%o2,	[%l7 + %o2]
	set	0x50, %l3
	stxa	%g5,	[%l7 + %l3] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i3
	set	0x7C, %l6
	stha	%g4,	[%l7 + %l6] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g3
	nop
	set	0x38, %o4
	std	%f22,	[%l7 + %o4]
	set	0x48, %o3
	stha	%g2,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x20, %i1
	lduh	[%l7 + %i1],	%l1
	nop
	set	0x7E, %i4
	sth	%g6,	[%l7 + %i4]
	set	0x48, %l5
	sta	%f18,	[%l7 + %l5] 0x80
	nop
	set	0x65, %l1
	ldub	[%l7 + %l1],	%o5
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xcc
	set	0x70, %i2
	stxa	%l5,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x78, %g7
	stw	%o6,	[%l7 + %g7]
	nop
	set	0x1C, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f0
	st	%fsr,	[%l7 + 0x60]
	fpsub32s	%f28,	%f16,	%f22
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f16
	nop
	set	0x41, %o0
	ldub	[%l7 + %o0],	%l3
	set	0x30, %i6
	sta	%f0,	[%l7 + %i6] 0x89
	set	0x38, %l4
	lda	[%l7 + %l4] 0x81,	%f23
	set	0x1F, %g2
	stba	%i2,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x1C, %i7
	stw	%l0,	[%l7 + %i7]
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%o3
	or	%o4,	%g7,	%i0
	set	0x52, %o6
	ldstuba	[%l7 + %o6] 0x89,	%l2
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f4
	set	0x26, %o7
	stba	%o0,	[%l7 + %o7] 0x80
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x80,	%i1
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f16
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xea,	%g0
	nop
	set	0x5D, %g1
	ldub	[%l7 + %g1],	%i7
	nop
	set	0x60, %i0
	lduw	[%l7 + %i0],	%o7
	set	0x50, %g5
	stxa	%l4,	[%l7 + %g5] 0x81
	nop
	set	0x73, %o2
	ldub	[%l7 + %o2],	%o1
	nop
	set	0x38, %l3
	std	%f22,	[%l7 + %l3]
	st	%f24,	[%l7 + 0x14]
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x89,	 2
	nop
	set	0x20, %o3
	std	%f20,	[%l7 + %o3]
	set	0x60, %o4
	stda	%i6,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc0
	nop
	set	0x10, %i1
	std	%o2,	[%l7 + %i1]
	or	%g5,	%l6,	%g4
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x88,	 1
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f16
	nop
	set	0x59, %i2
	stb	%g3,	[%l7 + %i2]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%l1
	bn	%icc,	loop_25
	add	%g6,	%g2,	%o5
	nop
	set	0x68, %g7
	stx	%o6,	[%l7 + %g7]
	set	0x64, %l0
	lda	[%l7 + %l0] 0x81,	%f28
loop_25:
	nop
	set	0x08, %l2
	stwa	%l3,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd2
	nop
	set	0x21, %o0
	ldstub	[%l7 + %o0],	%l5
	nop
	set	0x29, %i5
	ldstub	[%l7 + %i5],	%i2
	nop
	set	0x34, %l4
	swap	[%l7 + %l4],	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%o4
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	nop
	set	0x38, %i7
	stx	%g7,	[%l7 + %i7]
	set	0x24, %o5
	lda	[%l7 + %o5] 0x88,	%f16
	set	0x7C, %o6
	swapa	[%l7 + %o6] 0x80,	%l2
	nop
	set	0x33, %g6
	ldstub	[%l7 + %g6],	%i1
	nop
	nop
	setx	0xDEB74EF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x87CB2EF8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f13,	%f30
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x88,	 1
	nop
	set	0x74, %g4
	swap	[%l7 + %g4],	%i7
	nop
	set	0x0B, %o1
	ldstub	[%l7 + %o1],	%g1
	set	0x64, %o7
	stba	%l4,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x16, %i3
	sth	%o7,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x40]
	fpsub16s	%f9,	%f29,	%f10
	set	0x68, %g1
	stba	%i5,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x54, %g5
	sta	%f25,	[%l7 + %g5] 0x81
	set	0x68, %o2
	sta	%f19,	[%l7 + %o2] 0x81
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x89
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%o1
	nop
	set	0x70, %i0
	lduh	[%l7 + %i0],	%i6
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd2,	%f0
	set	0x78, %i4
	stwa	%g5,	[%l7 + %i4] 0x88
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x38, %i1
	lda	[%l7 + %i1] 0x88,	%f30
	set	0x0C, %l5
	stwa	%o2,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x24, %l1
	lda	[%l7 + %l1] 0x89,	%f23
	nop
	set	0x60, %g7
	std	%g4,	[%l7 + %g7]
	wr	%l6,	%g3,	%pic
	st	%fsr,	[%l7 + 0x78]
	st	%f17,	[%l7 + 0x70]
	nop
	set	0x25, %l0
	ldsb	[%l7 + %l0],	%i3
	nop
	set	0x60, %l2
	std	%f2,	[%l7 + %l2]
	nop
	set	0x6A, %g3
	sth	%i4,	[%l7 + %g3]
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xeb,	%l0
	nop
	set	0x08, %i5
	swap	[%l7 + %i5],	%g6
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%g2
	nop
	set	0x77, %l4
	ldub	[%l7 + %l4],	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%l3
	set	0x40, %i7
	stda	%l4,	[%l7 + %i7] 0x81
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x38, %o5
	stb	%l0,	[%l7 + %o5]
	nop
	set	0x40, %o6
	stx	%o3,	[%l7 + %o6]
	set	0x48, %g2
	stba	%o4,	[%l7 + %g2] 0x80
	ld	[%l7 + 0x68],	%f1
	nop
	set	0x48, %i6
	stx	%i0,	[%l7 + %i6]
	nop
	set	0x18, %g4
	stw	%i2,	[%l7 + %g4]
	and	%g7,	%l2,	%o0
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%i0
	and	%i7,	%g1,	%o7
	set	0x40, %o7
	stwa	%l4,	[%l7 + %o7] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%i6
	bge,a	%xcc,	loop_26
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%g4
	nop
	set	0x4B, %g1
	ldub	[%l7 + %g1],	%i5
	set	0x54, %g5
	swapa	[%l7 + %g5] 0x81,	%o2
loop_26:
	nop
	set	, %o2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1262
!	Type a   	: 22
!	Type cti   	: 26
!	Type x   	: 531
!	Type f   	: 32
!	Type i   	: 127
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
.word 0x86EB2F7D
.word 0x17303FB3
.word 0x7678CAC0
.word 0x1900AC3C
.word 0x2A8A7725
.word 0x5DA5ECA8
.word 0xAA1168CA
.word 0x64DE6F3A
.word 0xD92251E3
.word 0xE2E95F55
.word 0x4830DE9C
.word 0x4B639673
.word 0xA4B5A14C
.word 0xFEDC8FE5
.word 0x9821E74C
.word 0x80946828
.word 0xF44B1505
.word 0x85F8B1E9
.word 0xC9A30C2F
.word 0x8ED43059
.word 0x286B195E
.word 0x3FC8B9F4
.word 0xB566FE2E
.word 0x90B9A14F
.word 0x8A432D7F
.word 0xDCA6C350
.word 0x4C7041C1
.word 0x834CD7D1
.word 0xF26A8F5F
.word 0x0E38C51B
.word 0x92ECFC6D
.word 0xD880E327
.word 0x381043B1
.word 0x42370020
.word 0x0302F140
.word 0x31CD0DF4
.word 0x240C8CB5
.word 0xEF1E9CDF
.word 0xE38C067E
.word 0xB96FBA31
.word 0x60F5523D
.word 0x118631EA
.word 0x27F30163
.word 0xCBCD8B70
.word 0x0ACDF842
.word 0xCA959961
.word 0x679773D5
.word 0xC6C14FD3
.word 0xF9B102BF
.word 0x66A065F5
.word 0x26FF899A
.word 0x37E0E03A
.word 0x5B97C7F3
.word 0x0BDD58CE
.word 0x38EEDD3F
.word 0xF9BCB5C4
.word 0x66A3A048
.word 0x040FEEB0
.word 0x448D97E8
.word 0x68DBAD56
.word 0xE68486B0
.word 0xD8A80F49
.word 0x45E0AFC2
.word 0xDF64393B
.end
