/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc6.s
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
	set	0x8,	%g2
	set	0xC,	%g3
	set	0x2,	%g4
	set	0x3,	%g5
	set	0x7,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x6,	%i1
	set	-0x4,	%i2
	set	-0x6,	%i3
	set	-0x7,	%i4
	set	-0x2,	%i5
	set	-0x3,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x08C4D3FD,	%l0
	set	0x320074FC,	%l1
	set	0x59FD9E47,	%l2
	set	0x3880EDE5,	%l3
	set	0x3BA3CAD6,	%l4
	set	0x3734ADAF,	%l5
	set	0x08ACDDA4,	%l6
	!# Output registers
	set	-0x1559,	%o0
	set	0x1A22,	%o1
	set	0x03C0,	%o2
	set	-0x1CF6,	%o3
	set	0x0BBC,	%o4
	set	0x193D,	%o5
	set	-0x0799,	%o6
	set	-0x1BF6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	nop
	set	0x68, %o4
	std	%f18,	[%l7 + %o4]
	nop
	set	0x4C, %g7
	sth	%l2,	[%l7 + %g7]
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x81,	 4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%i5
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%l4
	add	%i6,	%o5,	%g1
	set	0x22, %g4
	stba	%o1,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x54, %l6
	sta	%f11,	[%l7 + %l6] 0x88
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x88,	%o2
	ld	[%l7 + 0x44],	%f12
	nop
	set	0x08, %l4
	std	%l0,	[%l7 + %l4]
	nop
	set	0x30, %o0
	std	%i0,	[%l7 + %o0]
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x80,	%i2
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%i4
	set	0x12, %i4
	stha	%g4,	[%l7 + %i4] 0x80
	set	0x30, %o5
	ldxa	[%l7 + %o5] 0x89,	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%g2
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	nop
	set	0x30, %o1
	stx	%g7,	[%l7 + %o1]
	fpsub32s	%f18,	%f22,	%f12
	nop
	set	0x38, %i7
	std	%f12,	[%l7 + %i7]
	nop
	set	0x5F, %g3
	ldstub	[%l7 + %g3],	%i3
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x88,	%i0
	nop
	set	0x26, %l0
	sth	%l6,	[%l7 + %l0]
	wr 	%g0, 	0x4, 	%fprs
	set	0x0D, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l3
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%o4
	or	%g3,	%l5,	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%g5
	fpsub16s	%f17,	%f6,	%f21
	nop
	set	0x1C, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x54, %g1
	stha	%l1,	[%l7 + %g1] 0x88
	nop
	set	0x78, %l5
	stx	%l4,	[%l7 + %l5]
	nop
	set	0x68, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%i6
	ld	[%l7 + 0x6C],	%f1
	nop
	set	0x58, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	set	0x10, %g6
	stba	%o5,	[%l7 + %g6] 0x81
	set	0x1A, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o1
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%g0
	nop
	set	0x14, %g7
	ldstub	[%l7 + %g7],	%l0
	bgu,pt	%xcc,	loop_1
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%i0
	set	0x40, %g4
	stxa	%o2,	[%l7 + %g4] 0xeb
	membar	#Sync
loop_1:
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%i4
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x5C, %l4
	stwa	%i2,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x61, %l6
	ldstub	[%l7 + %l6],	%g6
	nop
	set	0x30, %o6
	lduw	[%l7 + %o6],	%i7
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe3,	%g2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%o0
	nop
	set	0x26, %o0
	ldsh	[%l7 + %o0],	%g7
	set	0x70, %l3
	stda	%i2,	[%l7 + %l3] 0xeb
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%g4
	nop
	set	0x24, %o5
	lduh	[%l7 + %o5],	%o6
	set	0x61, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o3
	ld	[%l7 + 0x54],	%f21
	bl,a,pn	%icc,	loop_2
	nop
	set	0x33, %i7
	ldub	[%l7 + %i7],	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o4
loop_2:
	nop
	set	0x2A, %o2
	ldub	[%l7 + %o2],	%l5
	nop
	set	0x18, %l0
	std	%o6,	[%l7 + %l0]
	set	0x38, %g3
	stda	%l2,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x88
	nop
	set	0x7B, %g2
	ldsb	[%l7 + %g2],	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%l4
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%g2
	set	0x0C, %g1
	sta	%f13,	[%l7 + %g1] 0x88
	nop
	set	0x2C, %i0
	ldsb	[%l7 + %i0],	%i6
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%o5
	set	0x2C, %o7
	lda	[%l7 + %o7] 0x80,	%f31
	nop
	set	0x08, %g5
	std	%i4,	[%l7 + %g5]
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x89,	 4
	st	%f27,	[%l7 + 0x7C]
	set	0x30, %i5
	stba	%g1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x78, %o4
	swap	[%l7 + %o4],	%i0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%i4
	nop
	set	0x18, %i1
	ldx	[%l7 + %i1],	%l0
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%g6
	st	%f26,	[%l7 + 0x6C]
	nop
	set	0x22, %g4
	ldstub	[%l7 + %g4],	%i7
	set	0x3D, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i2
	nop
	set	0x48, %i3
	ldsw	[%l7 + %i3],	%o0
	nop
	set	0x30, %l2
	std	%f2,	[%l7 + %l2]
	nop
	set	0x28, %l4
	stx	%g7,	[%l7 + %l4]
	nop
	set	0x60, %l6
	swap	[%l7 + %l6],	%i3
	set	0x08, %l1
	stxa	%g2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x4E, %o6
	ldub	[%l7 + %o6],	%g4
	st	%f31,	[%l7 + 0x0C]
	and	%i1,	%o6,	%o3
	nop
	set	0x4C, %i4
	lduh	[%l7 + %i4],	%l6
	set	0x1B, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o4
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%l4
	set	0x18, %o1
	stxa	%o7,	[%l7 + %o1] 0x89
	nop
	set	0x70, %i7
	ldub	[%l7 + %i7],	%l3
	nop
	set	0x7F, %o5
	stb	%g5,	[%l7 + %o5]
	ld	[%l7 + 0x1C],	%f30
	nop
	set	0x1C, %o2
	lduw	[%l7 + %o2],	%l1
	st	%fsr,	[%l7 + 0x10]
	and	%l2,	%l4,	%i6
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x81,	%o5
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x60, %g2
	stda	%g2,	[%l7 + %g2] 0x88
	nop
	set	0x2A, %o3
	ldsh	[%l7 + %o3],	%o1
	nop
	set	0x7B, %i6
	stb	%g1,	[%l7 + %i6]
	or	%i5,	%o2,	%i4
	bgu,pt	%xcc,	loop_3
	ld	[%l7 + 0x4C],	%f9
	add	%i0,	%g6,	%i7
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f16
loop_3:
	nop
	set	0x5E, %i0
	lduh	[%l7 + %i0],	%i2
	set	0x62, %o7
	stha	%l0,	[%l7 + %o7] 0x80
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%o0
	nop
	set	0x58, %g5
	std	%f2,	[%l7 + %g5]
	nop
	set	0x0C, %i5
	stb	%i3,	[%l7 + %i5]
	nop
	set	0x28, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x2C, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x10, %i2
	std	%f20,	[%l7 + %i2]
	set	0x18, %i1
	stwa	%g2,	[%l7 + %i1] 0x88
	set	0x3C, %g4
	sta	%f22,	[%l7 + %g4] 0x88
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%i1
	nop
	set	0x6F, %l4
	ldsb	[%l7 + %l4],	%o6
	set	0x68, %l2
	stxa	%g7,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x20, %l6
	swap	[%l7 + %l6],	%o3
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%i6
	ld	[%l7 + 0x24],	%f11
	set	0x1C, %i4
	stwa	%l5,	[%l7 + %i4] 0x80
	st	%f28,	[%l7 + 0x38]
	nop
	set	0x60, %o0
	std	%o6,	[%l7 + %o0]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd2,	%f16
	nop
	set	0x50, %o1
	std	%f10,	[%l7 + %o1]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x80
	or	%o4,	%g5,	%l1
	nop
	set	0x28, %l3
	lduw	[%l7 + %l3],	%l3
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x5F, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l4
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%f2
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x81,	 4
	nop
	set	0x0C, %o5
	ldsw	[%l7 + %o5],	%l2
	wr 	%g0, 	0x4, 	%fprs
	add	%g1,	%g3,	%o2
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f18
	nop
	set	0x6A, %g1
	ldstub	[%l7 + %g1],	%i5
	set	0x32, %i0
	stha	%i0,	[%l7 + %i0] 0x81
	nop
	set	0x4E, %o3
	ldsh	[%l7 + %o3],	%i4
	set	0x64, %l5
	lda	[%l7 + %l5] 0x81,	%f8
	ld	[%l7 + 0x2C],	%f6
	set	0x54, %g5
	stba	%g6,	[%l7 + %g5] 0x81
	nop
	set	0x78, %o7
	swap	[%l7 + %o7],	%i7
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x89,	%l0
	nop
	set	0x12, %g6
	ldsh	[%l7 + %g6],	%i2
	set	0x5C, %i2
	stha	%o0,	[%l7 + %i2] 0x81
	nop
	set	0x10, %o4
	std	%f30,	[%l7 + %o4]
	nop
	set	0x50, %i1
	stx	%i3,	[%l7 + %i1]
	set	0x77, %g4
	stba	%g2,	[%l7 + %g4] 0x81
	bge,a	%xcc,	loop_4
	nop
	set	0x20, %g7
	swap	[%l7 + %g7],	%i1
	set	0x3C, %l4
	stha	%o6,	[%l7 + %l4] 0x80
loop_4:
	nop
	set	0x40, %l2
	std	%g6,	[%l7 + %l2]
	nop
	set	0x28, %l6
	std	%o2,	[%l7 + %l6]
	set	0x48, %i3
	stxa	%l6,	[%l7 + %i3] 0x80
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x81,	 3
	ld	[%l7 + 0x54],	%f31
	set	0x32, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd2,	%f16
	set	0x34, %o0
	sta	%f1,	[%l7 + %o0] 0x89
	wr	%o4,	%g5,	%ccr
	set	0x4C, %i7
	stha	%l1,	[%l7 + %i7] 0x80
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 2
	st	%f23,	[%l7 + 0x78]
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%l2
	set	0x74, %g3
	stba	%l4,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x78, %o2
	stda	%i6,	[%l7 + %o2] 0x80
	nop
	set	0x4C, %l0
	stw	%l2,	[%l7 + %l0]
	set	0x5C, %g2
	lda	[%l7 + %g2] 0x81,	%f20
	nop
	set	0x62, %i6
	ldsh	[%l7 + %i6],	%o5
	nop
	set	0x74, %g1
	sth	%o1,	[%l7 + %g1]
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f26
	nop
	set	0x50, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%l4
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%g1
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x2C, %o3
	stwa	%o2,	[%l7 + %o3] 0xeb
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%i0
	nop
	set	0x54, %i5
	stw	%i5,	[%l7 + %i5]
	set	0x48, %i2
	stwa	%g6,	[%l7 + %i2] 0xe3
	membar	#Sync
	add	%i7,	%i4,	%l0
	set	0x68, %g6
	lda	[%l7 + %g6] 0x81,	%f0
	set	0x34, %i1
	stha	%o0,	[%l7 + %i1] 0x89
	wr	%i2,	%g2,	%softint
	nop
	set	0x58, %o4
	lduw	[%l7 + %o4],	%i1
	nop
	set	0x54, %g7
	stw	%i3,	[%l7 + %g7]
	nop
	set	0x24, %l4
	ldsw	[%l7 + %l4],	%g7
	add	%o6,	%l6,	%g4
	set	0x14, %g4
	sta	%f15,	[%l7 + %g4] 0x89
	add	%o7,	%o3,	%o4
	set	0x58, %l2
	stxa	%l1,	[%l7 + %l2] 0x89
	and	%l3,	%l4,	%i6
	st	%f27,	[%l7 + 0x14]
	set	0x5C, %i3
	sta	%f27,	[%l7 + %i3] 0x80
	nop
	set	0x60, %l6
	stx	%l2,	[%l7 + %l6]
	set	0x48, %l1
	swapa	[%l7 + %l1] 0x89,	%g5
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%o1
	nop
	set	0x48, %o6
	lduh	[%l7 + %o6],	%o5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%o2
	nop
	set	0x0A, %o0
	sth	%g3,	[%l7 + %o0]
	nop
	set	0x6C, %o1
	ldub	[%l7 + %o1],	%i0
	ld	[%l7 + 0x44],	%f6
	nop
	set	0x1F, %i7
	ldstub	[%l7 + %i7],	%l5
	fpadd16s	%f25,	%f6,	%f1
	nop
	set	0x28, %l3
	ldx	[%l7 + %l3],	%i5
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x81,	%g6
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf0
	membar	#Sync
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%i6
	nop
	set	0x18, %i6
	std	%i4,	[%l7 + %i6]
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x88,	%o0
	nop
	set	0x50, %l0
	ldsb	[%l7 + %l0],	%l0
	nop
	set	0x7C, %o5
	ldstub	[%l7 + %o5],	%i2
	nop
	set	0x7C, %l5
	swap	[%l7 + %l5],	%i1
	nop
	set	0x7C, %g5
	lduw	[%l7 + %g5],	%g2
	nop
	set	0x6C, %o7
	lduh	[%l7 + %o7],	%g7
	nop
	set	0x48, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%i3
	ld	[%l7 + 0x64],	%f23
	nop
	set	0x5C, %i2
	ldsb	[%l7 + %i2],	%l6
	bn	%icc,	loop_5
	nop
	set	0x40, %i5
	std	%f10,	[%l7 + %i5]
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f26
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
loop_5:
	fpadd32s	%f24,	%f30,	%f19
	nop
	set	0x78, %g7
	stx	%g4,	[%l7 + %g7]
	st	%f30,	[%l7 + 0x30]
	nop
	set	0x78, %o4
	sth	%o7,	[%l7 + %o4]
	set	0x13, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o6
	set	0x30, %g4
	stda	%o2,	[%l7 + %g4] 0x80
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x81,	 3
	nop
	set	0x76, %l6
	lduh	[%l7 + %l6],	%l3
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f28
	nop
	set	0x6C, %l1
	sth	%l4,	[%l7 + %l1]
	nop
	set	0x2C, %i4
	lduw	[%l7 + %i4],	%o4
	nop
	set	0x69, %o6
	ldstub	[%l7 + %o6],	%i6
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	nop
	set	0x2C, %o1
	ldub	[%l7 + %o1],	%g5
	set	0x10, %l3
	stxa	%o1,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x30, %i7
	stw	%o5,	[%l7 + %i7]
	nop
	set	0x18, %o2
	std	%g0,	[%l7 + %o2]
	nop
	set	0x54, %g3
	ldsh	[%l7 + %g3],	%g3
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%i0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xca
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%i5
	nop
	set	0x5D, %i6
	ldsb	[%l7 + %i6],	%l5
	nop
	set	0x50, %o5
	ldsw	[%l7 + %o5],	%g6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%i4
	nop
	set	0x60, %l5
	std	%o0,	[%l7 + %l5]
	set	0x70, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l0
	nop
	set	0x0F, %o7
	stb	%i2,	[%l7 + %o7]
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x81,	%g2
	nop
	set	0x7D, %g5
	ldstub	[%l7 + %g5],	%i1
	nop
	set	0x18, %i2
	std	%i2,	[%l7 + %i2]
	nop
	set	0x6C, %i0
	ldsw	[%l7 + %i0],	%l6
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	wr	%g7,	%g4,	%softint
	or	%o6,	%o7,	%l1
	set	0x48, %i5
	stxa	%o3,	[%l7 + %i5] 0x81
	nop
	set	0x64, %g7
	ldsb	[%l7 + %g7],	%l3
	set	0x38, %o4
	stxa	%o4,	[%l7 + %o4] 0x81
	nop
	set	0x12, %l4
	lduh	[%l7 + %l4],	%l4
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xcc
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%l2
	or	%g5,	%o5,	%g1
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x89,	 4
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x80,	%i0
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f26
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	set	0x2A, %i3
	stba	%o2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x09, %o6
	ldub	[%l7 + %o6],	%l5
	nop
	set	0x3C, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x81,	%i5
	set	0x08, %l3
	stda	%g6,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x37, %i7
	ldstub	[%l7 + %i7],	%i4
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x80,	%o0
	nop
	set	0x64, %g3
	prefetch	[%l7 + %g3],	 2
	and	%i7,	%l0,	%i2
	set	0x30, %g2
	swapa	[%l7 + %g2] 0x88,	%i1
	nop
	set	0x7C, %g1
	ldsh	[%l7 + %g1],	%i3
	nop
	nop
	setx	0xA9010C0C3420E5B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x4AE20CDB237B095F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f30,	%f24
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x88,	 4
	add	%l6,	%g4,	%o6
	nop
	set	0x28, %o5
	swap	[%l7 + %o5],	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%g7
	wr	%l3,	%o4,	%y
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x80,	 4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f0
	nop
	set	0x58, %o7
	stx	%i6,	[%l7 + %o7]
	nop
	set	0x7E, %l0
	lduh	[%l7 + %l0],	%l2
	add	%g5,	%o5,	%l4
	nop
	set	0x1F, %g5
	ldsb	[%l7 + %g5],	%g1
	nop
	set	0x78, %o3
	stx	%g3,	[%l7 + %o3]
	st	%f19,	[%l7 + 0x4C]
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%i0
	bleu,a,pt	%icc,	loop_6
	nop
	set	0x60, %i2
	std	%o2,	[%l7 + %i2]
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%o0
loop_6:
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%l5
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x18, %l4
	std	%g6,	[%l7 + %l4]
	nop
	set	0x7A, %g7
	lduh	[%l7 + %g7],	%i5
	nop
	set	0x46, %i1
	stb	%o0,	[%l7 + %i1]
	nop
	set	0x40, %l6
	swap	[%l7 + %l6],	%i4
	nop
	set	0x6C, %l2
	ldstub	[%l7 + %l2],	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%i2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xea,	%i2
	or	%i1,	%l6,	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%o7
	nop
	set	0x30, %i3
	stx	%o6,	[%l7 + %i3]
	set	0x28, %g4
	sta	%f11,	[%l7 + %g4] 0x80
	ld	[%l7 + 0x24],	%f26
	nop
	set	0x13, %o0
	ldstub	[%l7 + %o0],	%g7
	nop
	set	0x68, %i4
	lduh	[%l7 + %i4],	%l1
	nop
	set	0x10, %l3
	lduh	[%l7 + %l3],	%l3
	nop
	set	0x7A, %i7
	sth	%o4,	[%l7 + %i7]
	nop
	set	0x66, %o6
	lduh	[%l7 + %o6],	%o3
	nop
	set	0x50, %o1
	stx	%i6,	[%l7 + %o1]
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x81,	%f7
	nop
	set	0x72, %g1
	ldub	[%l7 + %g1],	%g5
	set	0x7E, %i6
	stba	%o5,	[%l7 + %i6] 0x89
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd8
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g1
	nop
	set	0x20, %o5
	stx	%g3,	[%l7 + %o5]
	nop
	nop
	setx	0x356EF8644104856E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xEBCC7860D6E3C99B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f20,	%f12
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%l4
	st	%fsr,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x78]
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xeb,	%o2
	or	%o1,	%g6,	%i5
	fpsub16	%f18,	%f4,	%f6
	nop
	set	0x70, %l5
	swap	[%l7 + %l5],	%l5
	nop
	set	0x65, %l0
	ldstub	[%l7 + %l0],	%o0
	or	%i7,	%l0,	%i2
	st	%fsr,	[%l7 + 0x18]
	st	%f3,	[%l7 + 0x2C]
	nop
	set	0x40, %g5
	std	%f2,	[%l7 + %g5]
	set	0x78, %o7
	lda	[%l7 + %o7] 0x88,	%f18
	ba,a	%xcc,	loop_7
	nop
	set	0x60, %o3
	std	%i2,	[%l7 + %o3]
	set	0x38, %i2
	swapa	[%l7 + %i2] 0x88,	%i1
loop_7:
	fpadd32s	%f22,	%f27,	%f3
	st	%f27,	[%l7 + 0x40]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f0
	set	0x10, %i0
	stha	%l6,	[%l7 + %i0] 0x81
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%g2
	set	0x55, %o4
	ldstuba	[%l7 + %o4] 0x80,	%g4
	set	0x7C, %g7
	stwa	%o7,	[%l7 + %g7] 0x88
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xea,	%i4
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%g7
	nop
	set	0x20, %l6
	ldub	[%l7 + %l6],	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%l3
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xe2,	%o4
	nop
	set	0x26, %l2
	ldsh	[%l7 + %l2],	%i6
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc8
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd2,	%f16
	set	0x5B, %o0
	ldstuba	[%l7 + %o0] 0x80,	%o3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%l2
	nop
	set	0x10, %l3
	stw	%g5,	[%l7 + %l3]
	nop
	set	0x10, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x38, %o6
	stx	%g3,	[%l7 + %o6]
	nop
	set	0x08, %o1
	stw	%i0,	[%l7 + %o1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%o2
	ld	[%l7 + 0x5C],	%f21
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x80
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x81,	%g0
	nop
	set	0x12, %i6
	sth	%g6,	[%l7 + %i6]
	nop
	set	0x58, %g2
	std	%f4,	[%l7 + %g2]
	fpsub32s	%f31,	%f10,	%f20
	set	0x0F, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o1
	nop
	set	0x38, %o5
	ldsh	[%l7 + %o5],	%i5
	nop
	set	0x0E, %o2
	ldsh	[%l7 + %o2],	%o0
	nop
	set	0x78, %l0
	sth	%l5,	[%l7 + %l0]
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%i7
	st	%fsr,	[%l7 + 0x14]
	set	0x38, %g5
	sta	%f27,	[%l7 + %g5] 0x80
	and	%i2,	%i3,	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ble,a	%icc,	loop_8
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%g4
	nop
	set	0x54, %o3
	stw	%o7,	[%l7 + %o3]
	add	%g2,	%g7,	%i4
loop_8:
	add	%o6,	%l1,	%o4
	nop
	set	0x08, %i2
	ldub	[%l7 + %i2],	%i6
	set	0x60, %i5
	stha	%o3,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x28, %i0
	std	%o4,	[%l7 + %i0]
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x81,	%l3
	set	0x48, %g6
	stda	%g4,	[%l7 + %g6] 0x81
	ld	[%l7 + 0x50],	%f3
	nop
	set	0x68, %g7
	std	%f20,	[%l7 + %g7]
	set	0x60, %l4
	stda	%g2,	[%l7 + %l4] 0xea
	membar	#Sync
	bgu,pn	%xcc,	loop_9
	or	%l2,	%l4,	%o2
	set	0x1A, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g1
loop_9:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	nop
	set	0x10, %l6
	swap	[%l7 + %l6],	%i0
	st	%f22,	[%l7 + 0x44]
	set	0x32, %l2
	stba	%g6,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x80,	 0
	nop
	set	0x48, %l3
	stw	%o0,	[%l7 + %l3]
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	ld	[%l7 + 0x1C],	%f26
	set	0x30, %o6
	stxa	%l5,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x151, 	%sys_tick_cmpr
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xe3,	%l0
	nop
	set	0x70, %i4
	ldsw	[%l7 + %i4],	%l6
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x50, %i6
	std	%i2,	[%l7 + %i6]
	nop
	set	0x2C, %g1
	ldsb	[%l7 + %g1],	%i1
	set	0x70, %g3
	stwa	%g4,	[%l7 + %g3] 0x80
	nop
	set	0x74, %g2
	ldsh	[%l7 + %g2],	%o7
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc0
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x88,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x7C, %l5
	ldsw	[%l7 + %l5],	%l1
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	set	0x68, %g5
	stxa	%o4,	[%l7 + %g5] 0x80
	nop
	set	0x08, %o7
	stw	%i6,	[%l7 + %o7]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%o3
	ld	[%l7 + 0x3C],	%f20
	nop
	set	0x38, %o3
	ldub	[%l7 + %o3],	%l3
	set	0x28, %i5
	stxa	%g5,	[%l7 + %i5] 0x81
	add	%l2,	%g3,	%l4
	nop
	set	0x70, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%i0
	fpadd32	%f28,	%f30,	%f18
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x88,	%g1
	nop
	set	0x4C, %o4
	stb	%o1,	[%l7 + %o4]
	nop
	set	0x69, %g7
	ldsb	[%l7 + %g7],	%g6
	nop
	set	0x0E, %i1
	lduh	[%l7 + %i1],	%i5
	ld	[%l7 + 0x14],	%f1
	set	0x38, %l4
	swapa	[%l7 + %l4] 0x80,	%o0
	nop
	set	0x26, %l6
	ldsh	[%l7 + %l6],	%i2
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%l4
	or	%l0,	%l6,	%i7
	set	0x30, %l1
	stxa	%i1,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x2F, %i3
	ldstub	[%l7 + %i3],	%i3
	nop
	set	0x5E, %g4
	ldsh	[%l7 + %g4],	%o7
	set	0x62, %o0
	stba	%g7,	[%l7 + %o0] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%g2
	set	0x50, %l3
	stda	%l0,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x1C, %o6
	sta	%f12,	[%l7 + %o6] 0x80
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	nop
	set	0x6C, %i4
	ldsw	[%l7 + %i4],	%o4
	wr	%i6,	%i4,	%y
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xcc
	nop
	set	0x40, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x58, %g1
	stx	%o5,	[%l7 + %g1]
	set	0x20, %g3
	lda	[%l7 + %g3] 0x88,	%f18
	nop
	set	0x48, %o2
	std	%l2,	[%l7 + %o2]
	nop
	set	0x74, %o5
	lduh	[%l7 + %o5],	%o3
	set	0x38, %g2
	sta	%f15,	[%l7 + %g2] 0x89
	set	0x40, %l0
	stda	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
	add	%g5,	%g3,	%o2
	nop
	set	0x12, %g5
	ldstub	[%l7 + %g5],	%l4
	or	%i0,	%g1,	%o1
	wr	%g6,	%i5,	%pic
	or	%o0,	%l5,	%l0
	set	0x18, %l5
	stxa	%i2,	[%l7 + %l5] 0x81
	set	0x14, %o7
	lda	[%l7 + %o7] 0x80,	%f26
	nop
	set	0x24, %i5
	swap	[%l7 + %i5],	%l6
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f2
	set	0x50, %o3
	stxa	%i1,	[%l7 + %o3] 0xeb
	membar	#Sync
	add	%i7,	%i3,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%g2
	nop
	set	0x40, %i2
	std	%g6,	[%l7 + %i2]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf0
	membar	#Sync
	bleu,a	%icc,	loop_10
	nop
	set	0x10, %o4
	std	%o6,	[%l7 + %o4]
	nop
	set	0x3E, %i1
	sth	%l1,	[%l7 + %i1]
	nop
	set	0x1A, %l4
	ldsh	[%l7 + %l4],	%o4
loop_10:
	nop
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x88,	%i4
	nop
	set	0x2C, %l2
	stw	%o5,	[%l7 + %l2]
	and	%i6,	%l3,	%l2
	nop
	set	0x20, %l1
	stw	%o3,	[%l7 + %l1]
	fpadd32s	%f24,	%f26,	%f26
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x40, %l6
	ldsb	[%l7 + %l6],	%g5
	ld	[%l7 + 0x34],	%f11
	set	0x58, %o0
	sta	%f16,	[%l7 + %o0] 0x81
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%l4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd2
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x80,	 4
	set	0x2D, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g3
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%g1
	set	0x18, %i7
	stda	%o0,	[%l7 + %i7] 0x89
	nop
	set	0x26, %i6
	sth	%i5,	[%l7 + %i6]
	nop
	set	0x54, %g3
	stw	%g6,	[%l7 + %g3]
	bl,a	%icc,	loop_11
	nop
	set	0x10, %g1
	stw	%o0,	[%l7 + %g1]
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%l4
	set	0x44, %g2
	sta	%f14,	[%l7 + %g2] 0x81
loop_11:
	fpadd16s	%f14,	%f30,	%f2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf0
	membar	#Sync
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%l0
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%i2
	nop
	set	0x4C, %l5
	ldsh	[%l7 + %l5],	%i1
	nop
	set	0x66, %o7
	sth	%i7,	[%l7 + %o7]
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xeb,	%i2
	nop
	set	0x60, %i0
	std	%o6,	[%l7 + %i0]
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f0
	nop
	set	0x29, %g6
	stb	%l6,	[%l7 + %g6]
	nop
	set	0x30, %i2
	sth	%g4,	[%l7 + %i2]
	set	0x70, %o4
	swapa	[%l7 + %o4] 0x81,	%g7
	set	0x68, %l4
	sta	%f19,	[%l7 + %l4] 0x88
	nop
	set	0x58, %g7
	stx	%g2,	[%l7 + %g7]
	set	0x40, %i1
	lda	[%l7 + %i1] 0x89,	%f6
	st	%f16,	[%l7 + 0x30]
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x88,	%l0
	nop
	set	0x6C, %i3
	ldsh	[%l7 + %i3],	%o4
	or	%i4,	%o6,	%i6
	nop
	set	0x54, %l6
	ldsb	[%l7 + %l6],	%l3
	set	0x64, %l1
	swapa	[%l7 + %l1] 0x81,	%o5
	nop
	set	0x20, %o0
	swap	[%l7 + %o0],	%l2
	and	%o3,	%g5,	%o2
	nop
	set	0x5E, %o6
	sth	%l4,	[%l7 + %o6]
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f20
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x88,	%i0
	nop
	set	0x48, %i4
	stx	%g1,	[%l7 + %i4]
	nop
	set	0x3C, %o1
	stb	%g3,	[%l7 + %o1]
	nop
	set	0x68, %i6
	std	%o0,	[%l7 + %i6]
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x81,	%g6
	fpadd16	%f16,	%f24,	%f10
	nop
	set	0x68, %i7
	stw	%o0,	[%l7 + %i7]
	add	%i5,	%l5,	%l0
	nop
	set	0x2C, %o2
	swap	[%l7 + %o2],	%i1
	set	0x6C, %g2
	stwa	%i7,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	nop
	set	0x30, %o5
	std	%f6,	[%l7 + %o5]
	or	%i2,	%o7,	%g4
	set	0x10, %g5
	sta	%f29,	[%l7 + %g5] 0x89
	nop
	set	0x35, %l5
	stb	%l6,	[%l7 + %l5]
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x89,	%g2
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%g7
	nop
	set	0x48, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x5A, %i5
	ldstub	[%l7 + %i5],	%o4
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%i4
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%o6
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x5C, %i2
	prefetch	[%l7 + %i2],	 4
	ld	[%l7 + 0x14],	%f14
	set	0x6E, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l1
	nop
	set	0x48, %g7
	std	%i6,	[%l7 + %g7]
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%o5
	st	%f22,	[%l7 + 0x34]
	bl,a	%xcc,	loop_12
	st	%f7,	[%l7 + 0x18]
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 2
	bl	%icc,	loop_13
loop_12:
	nop
	set	0x36, %l2
	ldsh	[%l7 + %l2],	%l2
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x81,	%o2
loop_13:
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xeb,	%g4
	or	%o2,	%l4,	%i0
	set	0x48, %o6
	stda	%l2,	[%l7 + %o6] 0x81
	nop
	set	0x20, %l1
	std	%g2,	[%l7 + %l1]
	nop
	set	0x35, %g4
	stb	%o1,	[%l7 + %g4]
	nop
	set	0x30, %i4
	std	%g6,	[%l7 + %i4]
	add	%o0,	%i5,	%g1
	set	0x57, %o1
	stba	%l5,	[%l7 + %o1] 0x81
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x68, %g3
	stha	%l0,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	nop
	set	0x53, %i7
	stb	%i1,	[%l7 + %i7]
	nop
	set	0x0C, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%i7
	nop
	set	0x64, %o2
	stw	%i2,	[%l7 + %o2]
	nop
	set	0x30, %g5
	std	%i2,	[%l7 + %g5]
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	nop
	set	0x5A, %g1
	lduh	[%l7 + %g1],	%o7
	st	%f6,	[%l7 + 0x18]
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%g2
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%g7
	ld	[%l7 + 0x28],	%f20
	nop
	set	0x08, %i0
	ldsh	[%l7 + %i0],	%o4
	ld	[%l7 + 0x34],	%f14
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%l6
	set	0x38, %i5
	stxa	%l1,	[%l7 + %i5] 0x81
	nop
	set	0x70, %g6
	stx	%i6,	[%l7 + %g6]
	set	0x78, %i2
	stxa	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x53, %o4
	ldstub	[%l7 + %o4],	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%o3
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f0
	set	0x30, %l4
	lda	[%l7 + %l4] 0x80,	%f21
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l4
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x60, %l2
	stda	%g4,	[%l7 + %l2] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%g3
	nop
	set	0x58, %i3
	std	%o0,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f16
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%g6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	ld	[%l7 + 0x78],	%f25
	set	0x10, %l1
	sta	%f6,	[%l7 + %l1] 0x88
	set	0x5C, %o6
	sta	%f25,	[%l7 + %o6] 0x89
	nop
	set	0x68, %g4
	std	%f30,	[%l7 + %g4]
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%o0
	nop
	set	0x10, %i6
	std	%g0,	[%l7 + %i6]
	nop
	set	0x24, %g3
	lduh	[%l7 + %g3],	%i5
	wr 	%g0, 	0x4, 	%fprs
	set	0x50, %l3
	stda	%l4,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x18, %o1
	stxa	%i7,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f12
	set	0x18, %g2
	stxa	%i3,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x28, %o2
	stda	%g4,	[%l7 + %o2] 0x89
	nop
	set	0x6C, %g5
	lduw	[%l7 + %g5],	%o7
	nop
	set	0x4F, %o5
	stb	%g2,	[%l7 + %o5]
	nop
	set	0x10, %l0
	std	%g6,	[%l7 + %l0]
	set	0x58, %l5
	stxa	%o4,	[%l7 + %l5] 0x88
	nop
	set	0x35, %o7
	stb	%i4,	[%l7 + %o7]
	nop
	set	0x79, %g1
	ldstub	[%l7 + %g1],	%i2
	nop
	set	0x68, %i0
	prefetch	[%l7 + %i0],	 1
	or	%l1,	%i6,	%o6
	set	0x50, %i5
	sta	%f27,	[%l7 + %i5] 0x80
	and	%l2,	%l6,	%o3
	set	0x30, %o3
	stwa	%o2,	[%l7 + %o3] 0x80
	nop
	set	0x78, %g6
	std	%f26,	[%l7 + %g6]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%l4
	ld	[%l7 + 0x24],	%f9
	add	%g3,	%o1,	%l3
	nop
	set	0x60, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x46, %l4
	ldsh	[%l7 + %l4],	%i0
	nop
	set	0x58, %g7
	ldstub	[%l7 + %g7],	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%g6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	nop
	set	0x30, %i3
	std	%i4,	[%l7 + %i3]
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	set	0x6F, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l5
	nop
	set	0x60, %o0
	stw	%i7,	[%l7 + %o0]
	nop
	set	0x68, %l1
	stx	%l0,	[%l7 + %l1]
	nop
	set	0x10, %o6
	std	%g4,	[%l7 + %o6]
	ld	[%l7 + 0x4C],	%f2
	add	%i3,	%o7,	%g2
	set	0x40, %i4
	lda	[%l7 + %i4] 0x81,	%f17
	and	%g7,	%o4,	%i2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	nop
	set	0x46, %g3
	ldsh	[%l7 + %g3],	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%i6
	fpsub32s	%f16,	%f13,	%f13
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc0
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	ld	[%l7 + 0x44],	%f10
	nop
	set	0x08, %i7
	stx	%l2,	[%l7 + %i7]
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%o6
	nop
	set	0x10, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x78, %g5
	stx	%o2,	[%l7 + %g5]
	nop
	set	0x58, %o5
	ldsh	[%l7 + %o5],	%o3
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x89,	%g5
	nop
	set	0x70, %l0
	std	%o4,	[%l7 + %l0]
	set	0x40, %o7
	stha	%l4,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x5B, %i0
	stb	%o1,	[%l7 + %i0]
	nop
	set	0x42, %g1
	ldsb	[%l7 + %g1],	%g3
	ld	[%l7 + 0x68],	%f21
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%o0
	wr	%l3,	%g6,	%y
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f16
	nop
	set	0x1D, %i5
	stb	%g1,	[%l7 + %i5]
	fpadd32s	%f15,	%f28,	%f28
	set	0x20, %g6
	stda	%i0,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x22, %i2
	stba	%l5,	[%l7 + %i2] 0x88
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f16
	set	0x30, %o4
	stwa	%i5,	[%l7 + %o4] 0x89
	nop
	set	0x18, %l2
	ldsw	[%l7 + %l2],	%l0
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x7C, %i3
	ldstub	[%l7 + %i3],	%g4
	set	0x60, %g7
	stxa	%i7,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x3C, %i1
	lda	[%l7 + %i1] 0x80,	%f30
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f16
	add	%i3,	%g2,	%o7
	nop
	set	0x6C, %l1
	lduw	[%l7 + %l1],	%g7
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%i6
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x81,	 1
	nop
	set	0x40, %i4
	lduw	[%l7 + %i4],	%o6
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x81,	%i6
	set	0x20, %g3
	stxa	%o2,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x69, %l6
	ldub	[%l7 + %l6],	%l2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%g5
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%l4
	nop
	set	0x40, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f22
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x88,	 2
	add	%g3,	%i0,	%l3
	set	0x64, %g5
	swapa	[%l7 + %g5] 0x80,	%o0
	nop
	set	0x70, %o5
	std	%g0,	[%l7 + %o5]
	fpadd32	%f4,	%f4,	%f30
	nop
	set	0x60, %o2
	ldsw	[%l7 + %o2],	%g6
	ba,a	%xcc,	loop_14
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%l5
	bne,a,pn	%xcc,	loop_15
	nop
	set	0x70, %o7
	std	%i0,	[%l7 + %o7]
loop_14:
	nop
	set	0x30, %l5
	stxa	%l0,	[%l7 + %l5] 0x81
loop_15:
	nop
	set	0x70, %i0
	ldsb	[%l7 + %i0],	%i5
	nop
	set	0x72, %o3
	sth	%i7,	[%l7 + %o3]
	ld	[%l7 + 0x58],	%f4
	wr	%i3,	%g2,	%softint
	set	0x4C, %g1
	stba	%o7,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x5A, %i5
	stb	%g7,	[%l7 + %i5]
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f22
	add	%i2,	%g4,	%l1
	and	%i6,	%i4,	%o6
	ld	[%l7 + 0x14],	%f3
	nop
	set	0x18, %g6
	std	%f6,	[%l7 + %g6]
	set	0x12, %o4
	stba	%o4,	[%l7 + %o4] 0x89
	nop
	set	0x3E, %l2
	lduh	[%l7 + %l2],	%o2
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%i6
	nop
	nop
	setx	0xB14F97C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xEAEC83C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f21,	%f27
	nop
	set	0x70, %g7
	std	%o2,	[%l7 + %g7]
	nop
	set	0x60, %i3
	std	%l2,	[%l7 + %i3]
	nop
	set	0x08, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x52, %i1
	stha	%g5,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x50, %l1
	lduw	[%l7 + %l1],	%l4
	set	0x30, %i4
	stda	%o0,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x78, %o6
	stwa	%g3,	[%l7 + %o6] 0xe3
	membar	#Sync
	ld	[%l7 + 0x78],	%f30
	nop
	set	0x4A, %g3
	ldub	[%l7 + %g3],	%i0
	nop
	set	0x5E, %g4
	ldsh	[%l7 + %g4],	%o5
	bleu,a	%icc,	loop_16
	nop
	set	0x78, %l6
	ldstub	[%l7 + %l6],	%l3
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%g0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%g6
loop_16:
	nop
	set	0x58, %o1
	swapa	[%l7 + %o1] 0x80,	%l5
	set	0x40, %i7
	sta	%f7,	[%l7 + %i7] 0x81
	set	0x38, %i6
	stda	%i0,	[%l7 + %i6] 0x88
	wr 	%g0, 	0x6, 	%fprs
	ld	[%l7 + 0x7C],	%f1
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%i2
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x68, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x50, %l0
	std	%g2,	[%l7 + %l0]
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	set	0x4C, %l5
	stha	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x89,	 1
	add	%g4,	%i2,	%i6
	nop
	set	0x4E, %o3
	lduh	[%l7 + %o3],	%l1
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%i4
	nop
	set	0x34, %o2
	ldub	[%l7 + %o2],	%o6
	set	0x0A, %i5
	stha	%o2,	[%l7 + %i5] 0x81
	add	%o4,	%l6,	%l2
	nop
	set	0x0D, %g6
	ldstub	[%l7 + %g6],	%g5
	nop
	set	0x7F, %o4
	ldstub	[%l7 + %o4],	%l4
	nop
	set	0x53, %l2
	ldsb	[%l7 + %l2],	%o1
	fpsub32s	%f11,	%f1,	%f3
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xea,	%g2
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%i0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%l3
	nop
	set	0x28, %i3
	std	%g0,	[%l7 + %i3]
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%o0
	nop
	set	0x08, %i1
	std	%f12,	[%l7 + %i1]
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x89,	%g6
	nop
	set	0x78, %i4
	swap	[%l7 + %i4],	%l5
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%o4
	nop
	set	0x4C, %g3
	stw	%i5,	[%l7 + %g3]
	set	0x08, %o6
	sta	%f1,	[%l7 + %o6] 0x89
	add	%i7,	%i1,	%i3
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f26
	set	0x14, %l6
	stha	%g2,	[%l7 + %l6] 0x81
	fpsub16	%f22,	%f22,	%f6
	fpsub16	%f24,	%f26,	%f26
	set	0x76, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l0
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f10
	nop
	set	0x3B, %i7
	ldsb	[%l7 + %i7],	%o7
	nop
	set	0x70, %i6
	ldstub	[%l7 + %i6],	%g7
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x81,	%g4
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xe3,	%i6
	nop
	set	0x77, %l0
	ldsb	[%l7 + %l0],	%l1
	st	%f5,	[%l7 + 0x60]
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%i4
	add	%i2,	%o6,	%o2
	add	%l6,	%o4,	%g5
	nop
	set	0x68, %l5
	stx	%l4,	[%l7 + %l5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o1
	st	%f19,	[%l7 + 0x3C]
	nop
	set	0x20, %o5
	std	%f4,	[%l7 + %o5]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%o3
	nop
	set	0x2C, %i0
	stw	%g3,	[%l7 + %i0]
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%g1
	set	0x6E, %i5
	stba	%l3,	[%l7 + %i5] 0xe3
	membar	#Sync
	wr 	%g0, 	0x7, 	%fprs
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o5
	nop
	set	0x45, %o3
	ldstub	[%l7 + %o3],	%i5
	ba,a,pt	%xcc,	loop_17
	nop
	set	0x73, %g6
	ldsb	[%l7 + %g6],	%i7
	set	0x70, %l2
	sta	%f12,	[%l7 + %l2] 0x89
loop_17:
	nop
	set	0x1D, %i2
	ldsb	[%l7 + %i2],	%i3
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f16
	wr	%g2,	%i1,	%pic
	nop
	set	0x10, %i3
	std	%f22,	[%l7 + %i3]
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%o7
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x89,	%l0
	nop
	set	0x50, %i4
	ldsw	[%l7 + %i4],	%g4
	nop
	set	0x08, %l1
	ldub	[%l7 + %l1],	%i6
	set	0x74, %g3
	stba	%g7,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
	nop
	set	0x74, %g4
	prefetch	[%l7 + %g4],	 2
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x80,	%l0
	and	%i2,	%o6,	%o2
	set	0x28, %o0
	stda	%i6,	[%l7 + %o0] 0x81
	add	%g5,	%l4,	%o4
	nop
	set	0x1E, %o1
	ldub	[%l7 + %o1],	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%o1
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f16
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%f0
	nop
	set	0x0A, %g5
	ldsh	[%l7 + %g5],	%g3
	nop
	set	0x50, %g2
	lduh	[%l7 + %g2],	%o3
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x80
	set	0x10, %i6
	ldda	[%l7 + %i6] 0xea,	%l2
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xe2,	%o0
	set	0x4C, %o7
	stha	%g1,	[%l7 + %o7] 0x80
	and	%l5,	%o5,	%i5
	nop
	set	0x30, %o5
	std	%f10,	[%l7 + %o5]
	nop
	set	0x58, %g1
	std	%f6,	[%l7 + %g1]
	fpadd32s	%f21,	%f2,	%f29
	set	0x68, %o2
	stda	%i6,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x60, %i0
	std	%i2,	[%l7 + %i0]
	set	0x40, %i5
	stda	%g2,	[%l7 + %i5] 0x88
	nop
	set	0x27, %g6
	ldsb	[%l7 + %g6],	%i1
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x89,	%o7
	st	%fsr,	[%l7 + 0x68]
	set	0x78, %i2
	stxa	%g6,	[%l7 + %i2] 0x81
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%l0
	nop
	set	0x18, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%i6
	nop
	set	0x08, %l4
	std	%f20,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x30, %i1
	stx	%g7,	[%l7 + %i1]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd0
	ld	[%l7 + 0x54],	%f24
	nop
	set	0x58, %o4
	stx	%g4,	[%l7 + %o4]
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%l1
	nop
	set	0x1C, %g3
	lduw	[%l7 + %g3],	%i4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf1
	membar	#Sync
	set	0x18, %o6
	stwa	%i2,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x60, %o0
	stx	%o6,	[%l7 + %o0]
	nop
	set	0x60, %l6
	std	%f12,	[%l7 + %l6]
	nop
	set	0x3C, %l3
	ldub	[%l7 + %l3],	%l6
	st	%f31,	[%l7 + 0x08]
	set	0x14, %i7
	lda	[%l7 + %i7] 0x88,	%f11
	set	0x08, %o1
	swapa	[%l7 + %o1] 0x81,	%o2
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x88
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x80,	%l4
	set	0x28, %g5
	stha	%o4,	[%l7 + %g5] 0x88
	nop
	nop
	setx	0xC5CD8CFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9777568C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f7,	%f30
	st	%fsr,	[%l7 + 0x70]
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x81,	%l2
	nop
	set	0x40, %l5
	std	%g4,	[%l7 + %l5]
	fpsub16s	%f15,	%f14,	%f3
	set	0x1E, %o5
	stha	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x76, %g1
	sth	%o1,	[%l7 + %g1]
	set	0x4F, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o3
	nop
	set	0x1C, %i0
	lduh	[%l7 + %i0],	%l3
	nop
	set	0x3A, %o2
	stb	%o0,	[%l7 + %o2]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd0
	ld	[%l7 + 0x34],	%f9
	set	0x78, %g6
	stda	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%l5
	ble,pt	%xcc,	loop_18
	st	%f27,	[%l7 + 0x18]
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%g1
	add	%i5,	%i7,	%o5
loop_18:
	nop
	set	0x42, %i2
	ldsb	[%l7 + %i2],	%g2
	set	0x24, %l2
	lda	[%l7 + %l2] 0x80,	%f23
	fpsub16s	%f14,	%f19,	%f24
	bleu	%icc,	loop_19
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 2
	or	%i1,	%o7,	%g6
	nop
	set	0x20, %l4
	prefetch	[%l7 + %l4],	 3
loop_19:
	nop
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	set	0x50, %o4
	stwa	%i3,	[%l7 + %o4] 0x80
	set	0x54, %i4
	stwa	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x3C, %g3
	swap	[%l7 + %g3],	%i6
	nop
	set	0x08, %g4
	std	%g6,	[%l7 + %g4]
	nop
	set	0x08, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x38, %o0
	ldub	[%l7 + %o0],	%g4
	nop
	set	0x53, %o6
	ldsb	[%l7 + %o6],	%l1
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f18
	ba	%icc,	loop_20
	nop
	set	0x4B, %l3
	ldsb	[%l7 + %l3],	%i2
	add	%o6,	%l6,	%o2
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x89,	%l4
loop_20:
	or	%o4,	%l2,	%i4
	set	0x70, %g2
	stxa	%g5,	[%l7 + %g2] 0x89
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%i0
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f0
	nop
	set	0x48, %i7
	std	%o2,	[%l7 + %i7]
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x80,	 1
	set	0x71, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o0
	set	0x7C, %o5
	swapa	[%l7 + %o5] 0x80,	%g3
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f0
	set	0x0C, %g1
	stha	%o1,	[%l7 + %g1] 0x89
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%l5
	nop
	set	0x7B, %i5
	ldub	[%l7 + %i5],	%i5
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xda
	wr	%g1,	%i7,	%sys_tick
	set	0x50, %o3
	stba	%o5,	[%l7 + %o3] 0xe2
	membar	#Sync
	or	%g2,	%o7,	%i1
	fpadd32	%f6,	%f8,	%f18
	nop
	set	0x3E, %g7
	ldstub	[%l7 + %g7],	%g6
	nop
	set	0x50, %i2
	ldub	[%l7 + %i2],	%l0
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g4
	nop
	set	0x40, %i0
	lduw	[%l7 + %i0],	%l1
	set	0x60, %l4
	lda	[%l7 + %l4] 0x88,	%f9
	set	0x52, %i1
	stha	%g7,	[%l7 + %i1] 0xea
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%l6
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd2,	%f0
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%o2
	nop
	set	0x78, %g3
	prefetch	[%l7 + %g3],	 0
	and	%l4,	%o4,	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i0
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f22
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%o3
	nop
	set	0x14, %i4
	stw	%o0,	[%l7 + %i4]
	set	0x34, %o6
	stwa	%g3,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%l3
	nop
	set	0x34, %o0
	swap	[%l7 + %o0],	%l5
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%i5
	set	0x5C, %l0
	swapa	[%l7 + %l0] 0x89,	%o1
	set	0x3E, %o1
	stha	%g1,	[%l7 + %o1] 0x89
	or	%i7,	%o5,	%o7
	add	%g2,	%i1,	%l0
	nop
	set	0x38, %g5
	std	%f2,	[%l7 + %g5]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%i6
	or	%g4,	%i3,	%l1
	set	0x7C, %l5
	stha	%g7,	[%l7 + %l5] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%o2
	or	%l6,	%l4,	%i2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf1
	membar	#Sync
	st	%f13,	[%l7 + 0x78]
	set	0x70, %i7
	stxa	%o4,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xeb,	%g4
	nop
	set	0x38, %o7
	ldstub	[%l7 + %o7],	%l2
	nop
	set	0x54, %o2
	stb	%i0,	[%l7 + %o2]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f0
	ld	[%l7 + 0x38],	%f22
	ld	[%l7 + 0x4C],	%f19
	and	%o3,	%o0,	%i4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	st	%fsr,	[%l7 + 0x38]
	set	0x20, %o3
	stda	%l2,	[%l7 + %o3] 0xe2
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%g3
	nop
	set	0x6C, %i5
	prefetch	[%l7 + %i5],	 4
	nop
	set	0x68, %i2
	ldsw	[%l7 + %i2],	%o1
	nop
	set	0x48, %g7
	ldsh	[%l7 + %g7],	%g1
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x81,	%i7
	nop
	set	0x4A, %l4
	stb	%o5,	[%l7 + %l4]
	ld	[%l7 + 0x34],	%f13
	nop
	set	0x29, %i1
	ldstub	[%l7 + %i1],	%o7
	or	%g2,	%i5,	%l0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd2,	%f16
	nop
	set	0x58, %i0
	stx	%i1,	[%l7 + %i0]
	fpsub16s	%f17,	%f28,	%f24
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%i6
	nop
	set	0x30, %g3
	std	%f30,	[%l7 + %g3]
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x88,	%g4
	and	%g6,	%l1,	%i3
	nop
	set	0x48, %i4
	std	%f4,	[%l7 + %i4]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%o2
	set	0x10, %o6
	stxa	%l6,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x10, %l6
	std	%f14,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f16
	and	%l4,	%g7,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%g5
	nop
	set	0x10, %l1
	std	%f6,	[%l7 + %l1]
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x89,	%l2
	nop
	set	0x4A, %o1
	sth	%o3,	[%l7 + %o1]
	set	0x71, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o0
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%i0
	nop
	set	0x5B, %l5
	stb	%l3,	[%l7 + %l5]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%g3
	wr	%i4,	%o1,	%softint
	ld	[%l7 + 0x08],	%f26
	set	0x44, %i6
	stwa	%g1,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x81,	%o5
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%o7
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x81,	%g2
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%i5
	set	0x74, %o2
	stwa	%l0,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x64, %g6
	swap	[%l7 + %g6],	%i1
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%i6
	set	0x40, %i5
	stda	%i6,	[%l7 + %i5] 0x89
	nop
	set	0x30, %g7
	ldsw	[%l7 + %g7],	%g6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	set	0x78, %i2
	stxa	%g4,	[%l7 + %i2] 0x88
	st	%fsr,	[%l7 + 0x18]
	set	0x28, %l4
	ldxa	[%l7 + %l4] 0x89,	%i3
	and	%l1,	%o2,	%l6
	set	0x60, %i1
	stxa	%o6,	[%l7 + %i1] 0x89
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%l4
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f8
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%g7
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x80,	 3
	set	0x18, %g3
	stxa	%i2,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x18, %i4
	stw	%l2,	[%l7 + %i4]
	set	0x0D, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o3
	nop
	set	0x40, %o6
	ldub	[%l7 + %o6],	%o0
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%i0
	fpsub32s	%f31,	%f18,	%f17
	bl,pn	%icc,	loop_21
	and	%g5,	%l3,	%g3
	set	0x08, %o0
	stda	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
loop_21:
	nop
	set	0x40, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x46, %g2
	stb	%o1,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x28, %o1
	ldsw	[%l7 + %o1],	%o5
	wr	%g1,	%o7,	%clear_softint
	or	%g2,	%l0,	%i5
	set	0x10, %l3
	lda	[%l7 + %l3] 0x80,	%f1
	st	%fsr,	[%l7 + 0x14]
	set	0x4A, %l5
	stba	%i7,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x25, %g5
	stb	%i6,	[%l7 + %g5]
	set	0x50, %i6
	stxa	%g6,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x3E, %o5
	ldsb	[%l7 + %o5],	%i1
	fpsub32s	%f2,	%f19,	%f24
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%g4
	wr	%o2,	%l1,	%sys_tick
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x81,	%o6
	wr	%l6,	%l4,	%clear_softint
	set	0x48, %i7
	sta	%f15,	[%l7 + %i7] 0x80
	set	0x38, %o2
	sta	%f28,	[%l7 + %o2] 0x81
	nop
	set	0x2D, %g1
	ldstub	[%l7 + %g1],	%g7
	set	0x38, %g6
	stda	%i2,	[%l7 + %g6] 0x88
	or	%l2,	%o4,	%o0
	nop
	set	0x58, %o3
	ldsh	[%l7 + %o3],	%o3
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%g4
	nop
	set	0x52, %l2
	sth	%l3,	[%l7 + %l2]
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%g3
	nop
	set	0x46, %l4
	ldsh	[%l7 + %l4],	%i0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f16
	bge,a	%xcc,	loop_22
	or	%l5,	%i4,	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%o5
loop_22:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%l0
	nop
	set	0x6C, %i0
	stw	%i5,	[%l7 + %i0]
	nop
	set	0x78, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x18, %o4
	stxa	%o7,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x68, %g4
	lda	[%l7 + %g4] 0x88,	%f30
	nop
	set	0x3C, %g3
	stw	%i7,	[%l7 + %g3]
	nop
	set	0x58, %i1
	swap	[%l7 + %i1],	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%g6
	st	%fsr,	[%l7 + 0x2C]
	st	%f29,	[%l7 + 0x14]
	nop
	set	0x74, %i4
	ldsb	[%l7 + %i4],	%i3
	st	%f26,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x2C, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%g4
	set	0x4D, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o2
	set	0x36, %o0
	stba	%l1,	[%l7 + %o0] 0xeb
	membar	#Sync
	fpadd32	%f8,	%f0,	%f16
	set	0x5B, %l0
	stba	%o6,	[%l7 + %l0] 0x80
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x81,	%l4
	nop
	set	0x78, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x12, %l3
	ldsh	[%l7 + %l3],	%l6
	wr	%g7,	%i2,	%set_softint
	add	%l2,	%o0,	%o4
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%g4
	nop
	set	0x08, %i6
	stx	%o3,	[%l7 + %i6]
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%l3
	st	%f27,	[%l7 + 0x30]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%g3
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%i4
	nop
	set	0x6C, %i7
	sth	%o1,	[%l7 + %i7]
	or	%l5,	%o5,	%g1
	nop
	set	0x40, %o2
	prefetch	[%l7 + %o2],	 1
	set	0x44, %o7
	swapa	[%l7 + %o7] 0x80,	%l0
	set	0x30, %g1
	stda	%i4,	[%l7 + %g1] 0x80
	ld	[%l7 + 0x30],	%f0
	set	0x64, %g6
	stwa	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x1E, %o3
	stha	%i7,	[%l7 + %o3] 0x89
	fpsub32	%f4,	%f6,	%f24
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x81,	%i6
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f10
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	set	0x17, %g7
	stba	%i1,	[%l7 + %g7] 0x81
	nop
	set	0x38, %i0
	prefetch	[%l7 + %i0],	 0
	set	0x74, %i3
	sta	%f31,	[%l7 + %i3] 0x89
	set	0x2B, %i5
	stba	%i3,	[%l7 + %i5] 0x89
	set	0x08, %o4
	stda	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x10, %g4
	stw	%o2,	[%l7 + %g4]
	nop
	set	0x34, %i1
	stw	%l1,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x68, %g3
	ldsh	[%l7 + %g3],	%o6
	fpsub32s	%f19,	%f13,	%f24
	nop
	set	0x10, %o6
	ldsw	[%l7 + %o6],	%g4
	nop
	set	0x60, %i4
	std	%i6,	[%l7 + %i4]
	nop
	set	0x64, %l6
	lduw	[%l7 + %l6],	%g7
	set	0x14, %l1
	swapa	[%l7 + %l1] 0x81,	%l4
	nop
	set	0x4C, %l0
	swap	[%l7 + %l0],	%i2
	set	0x14, %o1
	sta	%f9,	[%l7 + %o1] 0x89
	wr	%o0,	%l2,	%clear_softint
	nop
	set	0x70, %o0
	stx	%o4,	[%l7 + %o0]
	nop
	set	0x7A, %g2
	stb	%o3,	[%l7 + %g2]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g5
	set	0x40, %g5
	stwa	%g3,	[%l7 + %g5] 0x81
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f8
	fpsub16	%f16,	%f30,	%f30
	nop
	set	0x36, %o5
	stb	%i0,	[%l7 + %o5]
	bl,a,pt	%xcc,	loop_23
	add	%o1,	%i4,	%l5
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x81,	%g0
loop_23:
	fpadd16s	%f31,	%f17,	%f27
	nop
	set	0x78, %i7
	ldsb	[%l7 + %i7],	%o5
	set	0x70, %o2
	sta	%f20,	[%l7 + %o2] 0x89
	st	%f0,	[%l7 + 0x5C]
	set	0x30, %o7
	stda	%i4,	[%l7 + %o7] 0x89
	set	0x6C, %l5
	lda	[%l7 + %l5] 0x89,	%f4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%i7
	set	0x58, %g6
	sta	%f18,	[%l7 + %g6] 0x81
	set	0x28, %o3
	stda	%g2,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x28, %l2
	stw	%o7,	[%l7 + %l2]
	nop
	set	0x58, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x74, %l4
	prefetch	[%l7 + %l4],	 3
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x40, %g7
	std	%i0,	[%l7 + %g7]
	nop
	set	0x78, %i2
	stw	%i3,	[%l7 + %i2]
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%f26
	set	0x6D, %i5
	stba	%i6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%g6
	nop
	set	0x70, %g4
	std	%f8,	[%l7 + %g4]
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x81,	%o2
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%l0
	nop
	set	0x49, %o6
	ldstub	[%l7 + %o6],	%g4
	nop
	nop
	setx	0x903AD43E6FAFE4EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB2420DC8A4188C3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f18
	st	%f25,	[%l7 + 0x68]
	nop
	set	0x3C, %i4
	stw	%o6,	[%l7 + %i4]
	set	0x32, %g3
	stba	%g7,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x88,	%l6
	nop
	set	0x34, %l0
	ldsh	[%l7 + %l0],	%i2
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x80,	 3
	set	0x30, %o1
	stha	%l2,	[%l7 + %o1] 0x80
	nop
	set	0x5E, %g2
	sth	%o4,	[%l7 + %g2]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f0
	set	0x68, %o0
	stda	%o0,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x5E, %i6
	ldstub	[%l7 + %i6],	%o3
	nop
	set	0x42, %o5
	ldsh	[%l7 + %o5],	%l3
	nop
	set	0x18, %l3
	std	%f26,	[%l7 + %l3]
	ble,a	%icc,	loop_24
	nop
	set	0x1C, %i7
	stw	%g5,	[%l7 + %i7]
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%g3
	nop
	set	0x5E, %l5
	lduh	[%l7 + %l5],	%i0
loop_24:
	or	%i4,	%o1,	%l5
	set	0x12, %o7
	stha	%g1,	[%l7 + %o7] 0x81
	nop
	set	0x7E, %g6
	lduh	[%l7 + %g6],	%i5
	ld	[%l7 + 0x24],	%f7
	set	0x1B, %o3
	stba	%l0,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x30, %g1
	stda	%o4,	[%l7 + %g1] 0x88
	and	%i7,	%o7,	%g2
	set	0x5C, %l4
	swapa	[%l7 + %l4] 0x80,	%i1
	nop
	set	0x58, %g7
	ldsb	[%l7 + %g7],	%i3
	set	0x14, %i2
	stwa	%g6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x79, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o2
	set	0x2C, %i5
	stwa	%l1,	[%l7 + %i5] 0xe2
	membar	#Sync
	bl,a	%icc,	loop_25
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f12
	nop
	set	0x7E, %g4
	ldstub	[%l7 + %g4],	%g4
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%i6
loop_25:
	nop
	set	0x3E, %o4
	sth	%o6,	[%l7 + %o4]
	nop
	set	0x40, %i0
	ldsh	[%l7 + %i0],	%l6
	set	0x70, %i4
	stda	%i2,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x48, %o6
	stda	%l4,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x08, %g3
	stw	%g7,	[%l7 + %g3]
	nop
	set	0x40, %l0
	ldsw	[%l7 + %l0],	%o4
	nop
	set	0x5A, %l1
	ldsh	[%l7 + %l1],	%l2
	nop
	set	0x14, %o1
	lduw	[%l7 + %o1],	%o3
	nop
	set	0x7C, %g2
	sth	%o0,	[%l7 + %g2]
	set	0x19, %l6
	ldstuba	[%l7 + %l6] 0x81,	%l3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd8
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x88,	%g4
	nop
	set	0x7F, %i6
	ldstub	[%l7 + %i6],	%g3
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%i0
	nop
	set	0x74, %l3
	lduh	[%l7 + %l3],	%o1
	st	%f14,	[%l7 + 0x74]
	bleu,pn	%icc,	loop_26
	ld	[%l7 + 0x44],	%f30
	set	0x24, %o2
	stba	%l5,	[%l7 + %o2] 0x89
loop_26:
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%i4
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x7D, %l5
	ldstub	[%l7 + %l5],	%l0
	add	%i5,	%i7,	%o5
	nop
	set	0x45, %g6
	ldstub	[%l7 + %g6],	%o7
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%g2
	add	%i1,	%g6,	%i3
	set	0x53, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o2
	nop
	set	0x67, %l4
	ldsb	[%l7 + %l4],	%l1
	nop
	set	0x18, %o3
	std	%f30,	[%l7 + %o3]
	nop
	set	0x30, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x80,	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%l6
	set	0x08, %g7
	stwa	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	st	%f14,	[%l7 + 0x28]
	set	0x48, %l2
	stxa	%l4,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%i2
	ld	[%l7 + 0x74],	%f28
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%l2
	nop
	set	0x44, %g4
	sth	%o3,	[%l7 + %g4]
	set	0x18, %i1
	stba	%o4,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f28
	ld	[%l7 + 0x70],	%f4
	nop
	set	0x58, %i0
	std	%f6,	[%l7 + %i0]
	bgu	%xcc,	loop_27
	nop
	set	0x5C, %i4
	lduw	[%l7 + %i4],	%o0
	set	0x64, %g3
	stwa	%g5,	[%l7 + %g3] 0xe2
	membar	#Sync
loop_27:
	add	%g3,	%i0,	%o1
	set	0x20, %l0
	stxa	%l3,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x20, %o6
	stw	%l5,	[%l7 + %o6]
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%g1
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x88,	 4
	nop
	set	0x20, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x44, %o0
	ldsh	[%l7 + %o0],	%i4
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x89,	%i7
	nop
	set	0x70, %g2
	ldsw	[%l7 + %g2],	%i5
	nop
	set	0x1D, %i6
	stb	%o5,	[%l7 + %i6]
	nop
	set	0x24, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x57, %l3
	stb	%o7,	[%l7 + %l3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%g6
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x81,	%i3
	set	0x46, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i1
	nop
	set	0x40, %g6
	swap	[%l7 + %g6],	%l1
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%g4
	add	%i6,	%l6,	%o6
	wr	%o2,	%i2,	%softint
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%l4
	nop
	set	0x56, %o2
	ldub	[%l7 + %o2],	%l2
	nop
	set	0x23, %l4
	stb	%o4,	[%l7 + %l4]
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f22
	set	0x28, %g1
	stda	%o0,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xeb,	%g4
	nop
	set	0x6E, %g7
	ldsh	[%l7 + %g7],	%g3
	or	%o3,	%o1,	%i0
	nop
	set	0x0C, %i3
	swap	[%l7 + %i3],	%l5
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f0
	nop
	set	0x78, %g4
	swap	[%l7 + %g4],	%l3
	set	0x68, %i1
	ldxa	[%l7 + %i1] 0x89,	%l0
	st	%fsr,	[%l7 + 0x54]
	wr	%i4,	%i7,	%softint
	st	%f11,	[%l7 + 0x08]
	set	0x26, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g1
	nop
	set	0x34, %o4
	ldub	[%l7 + %o4],	%o5
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x40, %i4
	ldsh	[%l7 + %i4],	%g6
	nop
	set	0x10, %i0
	std	%f28,	[%l7 + %i0]
	nop
	set	0x6F, %l0
	ldstub	[%l7 + %l0],	%o7
	set	0x44, %g3
	stha	%i1,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x2C, %l1
	stw	%i3,	[%l7 + %l1]
	set	0x67, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l1
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x88,	%i6
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x88,	%o6
	set	0x5A, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g4
	nop
	nop
	setx	0x5CAAF07D94FC8729,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3ACD01F0813A1F09,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f20,	%f22
	ld	[%l7 + 0x28],	%f15
	st	%f26,	[%l7 + 0x34]
	add	%i2,	%g7,	%o2
	set	0x2A, %i6
	stha	%l2,	[%l7 + %i6] 0x89
	set	0x12, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o4
	nop
	set	0x60, %o5
	std	%f2,	[%l7 + %o5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%g5
	nop
	set	0x10, %l3
	lduh	[%l7 + %l3],	%g3
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f24
	nop
	set	0x34, %g6
	ldstub	[%l7 + %g6],	%l4
	set	0x44, %i7
	lda	[%l7 + %i7] 0x80,	%f0
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%o1
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%i0
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%o2
	nop
	set	0x3D, %g1
	ldub	[%l7 + %g1],	%l3
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	nop
	set	0x28, %g7
	std	%l4,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%l0
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc2
	nop
	set	0x78, %g4
	ldsb	[%l7 + %g4],	%i4
	nop
	set	0x40, %i5
	ldsh	[%l7 + %i5],	%g1
	nop
	set	0x0C, %o4
	swap	[%l7 + %o4],	%o5
	st	%f20,	[%l7 + 0x50]
	nop
	set	0x70, %i1
	swap	[%l7 + %i1],	%i7
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf8
	membar	#Sync
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x38, %g3
	lduw	[%l7 + %g3],	%g2
	set	0x24, %i0
	stba	%i5,	[%l7 + %i0] 0xe3
	membar	#Sync
	and	%g6,	%o7,	%i3
	set	0x28, %l1
	ldxa	[%l7 + %l1] 0x80,	%l1
	nop
	set	0x4E, %o6
	stb	%i1,	[%l7 + %o6]
	nop
	set	0x52, %o1
	stb	%i6,	[%l7 + %o1]
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f18
	set	0x7F, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i2
	add	%o6,	%g7,	%l2
	nop
	set	0x70, %o0
	ldsw	[%l7 + %o0],	%o4
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x18, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x7A, %o5
	stb	%g5,	[%l7 + %o5]
	nop
	set	0x10, %l3
	stw	%g3,	[%l7 + %l3]
	bg,a,pt	%icc,	loop_28
	ld	[%l7 + 0x34],	%f0
	or	%o0,	%l4,	%o1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i0
loop_28:
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf9
	membar	#Sync
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x80,	%l5
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%l0
	set	0x54, %o3
	stba	%i4,	[%l7 + %o3] 0x81
	fpsub32s	%f20,	%f5,	%f29
	set	0x60, %l4
	stxa	%g1,	[%l7 + %l4] 0x88
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x5A, %g1
	ldsh	[%l7 + %g1],	%l3
	nop
	set	0x1C, %o2
	sth	%i7,	[%l7 + %o2]
	nop
	set	0x68, %g7
	std	%g2,	[%l7 + %g7]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%o4
	nop
	set	0x28, %i3
	std	%g6,	[%l7 + %i3]
	set	0x40, %g4
	sta	%f13,	[%l7 + %g4] 0x81
	set	0x48, %i5
	swapa	[%l7 + %i5] 0x81,	%i5
	nop
	set	0x2A, %i1
	sth	%i3,	[%l7 + %i1]
	nop
	set	0x48, %o4
	stx	%o7,	[%l7 + %o4]
	ba,a,pn	%xcc,	loop_29
	nop
	set	0x1D, %i4
	ldsb	[%l7 + %i4],	%l1
	nop
	set	0x60, %l0
	std	%f22,	[%l7 + %l0]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%l6
loop_29:
	ld	[%l7 + 0x48],	%f12
	nop
	set	0x08, %g3
	std	%i6,	[%l7 + %g3]
	and	%i2,	%o6,	%g7
	st	%f19,	[%l7 + 0x48]
	or	%l2,	%g4,	%o2
	nop
	set	0x54, %i0
	ldsb	[%l7 + %i0],	%o4
	fpadd16	%f22,	%f16,	%f12
	nop
	set	0x64, %l1
	ldub	[%l7 + %l1],	%g3
	nop
	set	0x68, %o6
	stx	%g5,	[%l7 + %o6]
	nop
	set	0x2F, %g5
	ldub	[%l7 + %g5],	%o0
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x88,	%o1
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f10
	nop
	set	0x5C, %o1
	ldsw	[%l7 + %o1],	%l4
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%i0
	fpsub32s	%f27,	%f15,	%f31
	st	%fsr,	[%l7 + 0x3C]
	set	0x44, %o5
	lda	[%l7 + %o5] 0x80,	%f7
	nop
	set	0x3C, %i6
	stw	%o3,	[%l7 + %i6]
	set	0x72, %l3
	stha	%l5,	[%l7 + %l3] 0xea
	membar	#Sync
	and	%i4,	%l0,	%l3
	wr	%i7,	%g1,	%y
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f28
	nop
	set	0x20, %l5
	swap	[%l7 + %l5],	%g2
	set	0x70, %o7
	stwa	%o5,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x89,	%i4
	add	%g6,	%o7,	%l1
	nop
	set	0x3D, %i2
	ldstub	[%l7 + %i2],	%i1
	nop
	set	0x09, %i7
	ldsb	[%l7 + %i7],	%l6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%i2
	nop
	set	0x39, %g7
	ldstub	[%l7 + %g7],	%i2
	nop
	set	0x6C, %o2
	sth	%o6,	[%l7 + %o2]
	nop
	set	0x1C, %i3
	swap	[%l7 + %i3],	%g7
	nop
	set	0x08, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x44, %l2
	lduh	[%l7 + %l2],	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i6
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	or	%g3,	%g5,	%o2
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x52, %i4
	ldstub	[%l7 + %i4],	%o1
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f10
	nop
	set	0x78, %i0
	std	%f12,	[%l7 + %i0]
	wr	%o0,	%i0,	%y
	set	0x30, %g3
	sta	%f5,	[%l7 + %g3] 0x80
	st	%f7,	[%l7 + 0x24]
	nop
	set	0x72, %o6
	ldsb	[%l7 + %o6],	%o3
	nop
	set	0x42, %l1
	sth	%l4,	[%l7 + %l1]
	nop
	set	0x1B, %l6
	ldub	[%l7 + %l6],	%l5
	set	0x4C, %g5
	swapa	[%l7 + %g5] 0x89,	%i4
	add	%l0,	%l3,	%i7
	nop
	set	0x30, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x1E, %g2
	lduh	[%l7 + %g2],	%g2
	st	%f9,	[%l7 + 0x4C]
	nop
	set	0x74, %o1
	swap	[%l7 + %o1],	%g1
	nop
	set	0x58, %o5
	std	%i4,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x0B, %i6
	ldsb	[%l7 + %i6],	%o5
	nop
	set	0x32, %g6
	ldsh	[%l7 + %g6],	%g6
	set	0x08, %l3
	stxa	%l1,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x50, %o7
	swap	[%l7 + %o7],	%i1
	nop
	set	0x58, %l5
	stw	%o7,	[%l7 + %l5]
	st	%f23,	[%l7 + 0x28]
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x81,	 4
	ld	[%l7 + 0x6C],	%f21
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%l6
	nop
	set	0x5C, %i7
	sth	%i2,	[%l7 + %i7]
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f0
	nop
	set	0x7C, %o2
	swap	[%l7 + %o2],	%o6
	st	%fsr,	[%l7 + 0x08]
	set	0x70, %i3
	stda	%l2,	[%l7 + %i3] 0x80
	or	%g7,	%i6,	%g4
	nop
	set	0x34, %g4
	swap	[%l7 + %g4],	%g3
	nop
	set	0x68, %g7
	std	%f16,	[%l7 + %g7]
	nop
	set	0x3C, %i5
	swap	[%l7 + %i5],	%o4
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x80,	%g5
	nop
	set	0x36, %i1
	ldsb	[%l7 + %i1],	%o1
	nop
	set	0x11, %i4
	ldsb	[%l7 + %i4],	%o0
	nop
	set	0x10, %o4
	std	%o2,	[%l7 + %o4]
	set	0x12, %l0
	stba	%o3,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x4C, %i0
	stha	%i0,	[%l7 + %i0] 0x88
	add	%l4,	%l5,	%i4
	and	%l0,	%i7,	%g2
	set	0x20, %g3
	stwa	%g1,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x5C, %o6
	sta	%f15,	[%l7 + %o6] 0x81
	nop
	set	0x3A, %l1
	sth	%i5,	[%l7 + %l1]
	ld	[%l7 + 0x10],	%f23
	nop
	set	0x08, %g5
	lduw	[%l7 + %g5],	%l3
	nop
	set	0x50, %l6
	ldsh	[%l7 + %l6],	%g6
	nop
	set	0x18, %g2
	ldsw	[%l7 + %g2],	%o5
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x81,	%i1
	set	0x38, %o5
	stxa	%o7,	[%l7 + %o5] 0x81
	nop
	set	0x50, %i6
	stx	%i3,	[%l7 + %i6]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%i2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDCA, 	%sys_tick_cmpr
	nop
	set	0x6C, %g6
	lduw	[%l7 + %g6],	%o6
	set	0x6D, %l3
	ldstuba	[%l7 + %l3] 0x88,	%i6
	st	%f31,	[%l7 + 0x78]
	nop
	set	0x7C, %o7
	lduw	[%l7 + %o7],	%g7
	nop
	set	0x4E, %l5
	sth	%g4,	[%l7 + %l5]
	fpsub32	%f28,	%f4,	%f16
	nop
	set	0x4E, %o3
	ldub	[%l7 + %o3],	%g3
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x78, %o1
	stw	%g5,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x77, %i7
	ldsb	[%l7 + %i7],	%o1
	add	%o4,	%o2,	%o0
	nop
	set	0x78, %l4
	stx	%o3,	[%l7 + %l4]
	or	%i0,	%l5,	%i4
	nop
	set	0x10, %g1
	std	%f20,	[%l7 + %g1]
	set	0x40, %i2
	stda	%l0,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x0C, %o2
	sta	%f1,	[%l7 + %o2] 0x80
	nop
	set	0x4C, %i3
	lduh	[%l7 + %i3],	%i7
	set	0x30, %g7
	ldxa	[%l7 + %g7] 0x88,	%l4
	nop
	set	0x7C, %g4
	ldsw	[%l7 + %g4],	%g1
	nop
	set	0x34, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x81,	%g2
	fpsub32	%f2,	%f6,	%f14
	nop
	set	0x54, %i4
	swap	[%l7 + %i4],	%l3
	st	%f30,	[%l7 + 0x34]
	nop
	set	0x50, %i5
	std	%i4,	[%l7 + %i5]
	nop
	set	0x5C, %l0
	stw	%g6,	[%l7 + %l0]
	nop
	nop
	setx	0xE54707E98D3203FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x61622C2FB52A3330,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f12
	set	0x2C, %i0
	stwa	%o5,	[%l7 + %i0] 0x88
	fpadd32s	%f11,	%f7,	%f5
	nop
	set	0x40, %o4
	stw	%i1,	[%l7 + %o4]
	nop
	set	0x08, %o6
	stx	%o7,	[%l7 + %o6]
	be,pt	%icc,	loop_30
	nop
	set	0x66, %g3
	ldsb	[%l7 + %g3],	%l1
	nop
	set	0x2A, %g5
	stb	%i2,	[%l7 + %g5]
	set	0x18, %l1
	stwa	%i3,	[%l7 + %l1] 0x80
loop_30:
	fpadd32s	%f0,	%f1,	%f13
	nop
	set	0x64, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f26
	nop
	set	0x48, %o5
	ldsh	[%l7 + %o5],	%l6
	fpadd16	%f10,	%f4,	%f12
	add	%l2,	%i6,	%g7
	set	0x51, %l6
	stba	%g4,	[%l7 + %l6] 0x89
	nop
	set	0x58, %g6
	std	%f8,	[%l7 + %g6]
	nop
	set	0x70, %l3
	ldx	[%l7 + %l3],	%o6
	nop
	set	0x38, %o7
	lduh	[%l7 + %o7],	%g3
	nop
	set	0x16, %i6
	ldstub	[%l7 + %i6],	%g5
	or	%o4,	%o2,	%o0
	nop
	set	0x20, %l5
	sth	%o1,	[%l7 + %l5]
	set	0x5B, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i0
	set	0x78, %o3
	stda	%l4,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x2E, %l4
	stha	%i4,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x6C, %g1
	stwa	%l0,	[%l7 + %g1] 0x81
	add	%o3,	%l4,	%g1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1290
!	Type a   	: 30
!	Type cti   	: 30
!	Type x   	: 505
!	Type f   	: 44
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
	set	0x5,	%g1
	set	0xA,	%g2
	set	0x0,	%g3
	set	0x5,	%g4
	set	0x9,	%g5
	set	0x1,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x5,	%i1
	set	-0x5,	%i2
	set	-0xF,	%i3
	set	-0xA,	%i4
	set	-0x2,	%i5
	set	-0x2,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x5D7366BC,	%l0
	set	0x1AC8B5A5,	%l1
	set	0x49598D55,	%l2
	set	0x73609836,	%l3
	set	0x59509C01,	%l4
	set	0x76077DA4,	%l5
	set	0x60E1E6C1,	%l6
	!# Output registers
	set	0x0ECC,	%o0
	set	0x0B8C,	%o1
	set	-0x0417,	%o2
	set	-0x12DE,	%o3
	set	0x1EBA,	%o4
	set	-0x1624,	%o5
	set	-0x0817,	%o6
	set	0x00A2,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f6
	nop
	set	0x14, %i7
	ldsw	[%l7 + %i7],	%g2
	set	0x17, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l3
	or	%i5,	%g6,	%i7
	nop
	set	0x7B, %g7
	stb	%o5,	[%l7 + %g7]
	or	%i1,	%l1,	%o7
	set	0x10, %o2
	stda	%i2,	[%l7 + %o2] 0x88
	set	0x5C, %g4
	stha	%i2,	[%l7 + %g4] 0xe2
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i6
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcc
	set	0x6D, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l2
	fpadd32	%f22,	%f14,	%f20
	nop
	set	0x77, %i5
	stb	%g7,	[%l7 + %i5]
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x6C, %i1
	stb	%o6,	[%l7 + %i1]
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%g4
	st	%f30,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x20, %o4
	stx	%g5,	[%l7 + %o4]
	be	%xcc,	loop_31
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f30
	set	0x51, %g3
	stba	%o4,	[%l7 + %g3] 0xe3
	membar	#Sync
loop_31:
	nop
	set	0x2D, %l1
	stb	%g3,	[%l7 + %l1]
	set	0x44, %g2
	swapa	[%l7 + %g2] 0x80,	%o0
	nop
	set	0x4C, %o0
	stw	%o2,	[%l7 + %o0]
	nop
	set	0x70, %g5
	std	%o0,	[%l7 + %g5]
	set	0x61, %o5
	ldstuba	[%l7 + %o5] 0x80,	%l5
	ld	[%l7 + 0x54],	%f29
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%l0
	nop
	set	0x1C, %l3
	lduh	[%l7 + %l3],	%l4
	fpadd32s	%f28,	%f0,	%f12
	nop
	set	0x4E, %o7
	ldsh	[%l7 + %o7],	%g1
	set	0x38, %l6
	lda	[%l7 + %l6] 0x80,	%f8
	ba	%icc,	loop_32
	fpadd16	%f14,	%f2,	%f28
	or	%o3,	%l3,	%i5
	set	0x68, %l5
	stxa	%g6,	[%l7 + %l5] 0xe2
	membar	#Sync
loop_32:
	nop
	set	0x64, %i6
	ldsb	[%l7 + %i6],	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l1,	%i7,	%o7
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%i3
	nop
	set	0x74, %l4
	ldsw	[%l7 + %l4],	%l6
	nop
	set	0x40, %g1
	stx	%i6,	[%l7 + %g1]
	set	0x38, %o3
	stda	%l2,	[%l7 + %o3] 0xea
	membar	#Sync
	or	%g7,	%o6,	%g4
	set	0x20, %i7
	stxa	%g5,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%g3
	nop
	set	0x33, %i2
	ldsb	[%l7 + %i2],	%o0
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x88,	%o2
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x89,	%i2
	nop
	set	0x20, %g4
	std	%l4,	[%l7 + %g4]
	set	0x60, %g7
	stxa	%i4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x14, %l2
	stb	%i0,	[%l7 + %l2]
	nop
	set	0x0D, %i4
	ldstub	[%l7 + %i4],	%o1
	fpadd32	%f26,	%f30,	%f10
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f6
	wr	%l4,	%l0,	%clear_softint
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%o3
	set	0x34, %i1
	stha	%g1,	[%l7 + %i1] 0xeb
	membar	#Sync
	st	%f21,	[%l7 + 0x1C]
	set	0x30, %i0
	ldda	[%l7 + %i0] 0xea,	%i4
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%l3
	st	%fsr,	[%l7 + 0x78]
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	nop
	set	0x2E, %o6
	stb	%g2,	[%l7 + %o6]
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x88,	%i1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xda
	set	0x49, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o5
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x89,	%l1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o7
	ld	[%l7 + 0x70],	%f5
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xe3,	%i2
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%l6
	nop
	set	0x74, %o7
	sth	%l2,	[%l7 + %o7]
	or	%g7,	%o6,	%i6
	nop
	set	0x48, %l3
	std	%f24,	[%l7 + %l3]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%g4
	nop
	set	0x72, %l6
	ldstub	[%l7 + %l6],	%o4
	and	%o0,	%g3,	%o2
	nop
	set	0x70, %l5
	stx	%l5,	[%l7 + %l5]
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%i2
	nop
	set	0x34, %l4
	ldsw	[%l7 + %l4],	%i4
	nop
	set	0x47, %i6
	ldsb	[%l7 + %i6],	%o1
	set	0x08, %o3
	stwa	%i0,	[%l7 + %o3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x3C],	%f31
	nop
	set	0x2C, %g1
	ldsw	[%l7 + %g1],	%l0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x81
	set	0x08, %i3
	swapa	[%l7 + %i3] 0x88,	%l4
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	ld	[%l7 + 0x30],	%f22
	set	0x5E, %o2
	stha	%o3,	[%l7 + %o2] 0x89
	set	0x08, %g4
	stwa	%g1,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x68, %l2
	stx	%i5,	[%l7 + %l2]
	nop
	set	0x20, %i4
	ldsw	[%l7 + %i4],	%g6
	set	0x60, %i5
	stxa	%g2,	[%l7 + %i5] 0x81
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%l3
	nop
	set	0x08, %i1
	std	%f10,	[%l7 + %i1]
	and	%i1,	%l1,	%o5
	st	%fsr,	[%l7 + 0x38]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%o7
	nop
	nop
	setx	0x94FF86B81DCDB7B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEC7ACDE0831F4569,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f6,	%f26
	set	0x30, %g7
	stxa	%i3,	[%l7 + %g7] 0x89
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x80,	%l2
	add	%g7,	%l6,	%i6
	set	0x24, %i0
	stwa	%o6,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x89,	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%o0
	nop
	set	0x10, %g3
	ldsw	[%l7 + %g3],	%o4
	nop
	set	0x56, %g2
	ldstub	[%l7 + %g2],	%g3
	fpsub16s	%f31,	%f0,	%f13
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l5
	nop
	set	0x70, %l1
	lduh	[%l7 + %l1],	%i2
	nop
	set	0x09, %g5
	ldsb	[%l7 + %g5],	%o1
	st	%f9,	[%l7 + 0x70]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l0
	nop
	set	0x25, %o0
	ldsb	[%l7 + %o0],	%i4
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f2
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%f2
	set	0x28, %g6
	stxa	%l4,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x20, %l6
	sta	%f2,	[%l7 + %l6] 0x88
	set	0x64, %l3
	stha	%g1,	[%l7 + %l3] 0x80
	set	0x14, %l5
	sta	%f27,	[%l7 + %l5] 0x81
	nop
	set	0x1C, %l4
	sth	%o3,	[%l7 + %l4]
	nop
	set	0x21, %i6
	ldstub	[%l7 + %i6],	%i5
	nop
	set	0x64, %o1
	ldsh	[%l7 + %o1],	%g2
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%f16
	nop
	set	0x28, %i7
	stx	%fsr,	[%l7 + %i7]
	or	%g6,	%l3,	%i1
	nop
	set	0x3A, %o3
	ldsh	[%l7 + %o3],	%o5
	nop
	set	0x60, %i2
	ldsh	[%l7 + %i2],	%l1
	fpadd16	%f24,	%f0,	%f20
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x80
	nop
	set	0x7C, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x30, %g4
	ldsw	[%l7 + %g4],	%i7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xe2,	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%g7
	set	0x28, %i5
	stda	%i6,	[%l7 + %i5] 0x88
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd2,	%f0
	set	0x5C, %l2
	stwa	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x35, %i1
	ldub	[%l7 + %i1],	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%l2
	nop
	set	0x56, %o4
	ldsh	[%l7 + %o4],	%o0
	nop
	set	0x78, %g7
	std	%f22,	[%l7 + %g7]
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%o4
	set	0x68, %o6
	stwa	%g5,	[%l7 + %o6] 0x81
	nop
	set	0x08, %g3
	ldx	[%l7 + %g3],	%g3
	bge,a	%icc,	loop_33
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x0E, %g5
	ldsb	[%l7 + %g5],	%l5
	set	0x50, %o0
	lda	[%l7 + %o0] 0x80,	%f7
loop_33:
	nop
	set	0x67, %o5
	ldub	[%l7 + %o5],	%o2
	nop
	set	0x2E, %l1
	lduh	[%l7 + %l1],	%i2
	set	0x1E, %o7
	stha	%o1,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%l0
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x76, %l6
	ldub	[%l7 + %l6],	%l4
	set	0x60, %l4
	sta	%f26,	[%l7 + %l4] 0x88
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f0
	nop
	set	0x68, %o1
	std	%f16,	[%l7 + %o1]
	nop
	set	0x70, %i6
	swap	[%l7 + %i6],	%g1
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%o3
	ld	[%l7 + 0x20],	%f5
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x80,	%i4
	add	%i5,	%g2,	%l3
	set	0x5E, %o3
	ldstuba	[%l7 + %o3] 0x80,	%i1
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x81,	%f22
	st	%fsr,	[%l7 + 0x10]
	set	0x08, %i2
	stxa	%g6,	[%l7 + %i2] 0x80
	st	%fsr,	[%l7 + 0x1C]
	st	%f29,	[%l7 + 0x34]
	set	0x60, %i3
	stda	%o4,	[%l7 + %i3] 0x80
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%l1
	nop
	set	0x48, %i4
	stx	%o7,	[%l7 + %i4]
	set	0x0C, %g4
	sta	%f0,	[%l7 + %g4] 0x80
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%i3
	wr	%g7,	%i6,	%ccr
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o6
	set	0x44, %l2
	lda	[%l7 + %l2] 0x89,	%f6
	add	%g4,	%l2,	%o0
	nop
	set	0x54, %i1
	ldstub	[%l7 + %i1],	%o4
	set	0x40, %l0
	lda	[%l7 + %l0] 0x89,	%f9
	set	0x45, %o4
	stba	%g5,	[%l7 + %o4] 0x80
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xe2,	%l4
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%g3
	nop
	set	0x6C, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x78, %g3
	std	%f12,	[%l7 + %g3]
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	nop
	set	0x37, %g5
	stb	%l0,	[%l7 + %g5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%i2
	nop
	set	0x3E, %o0
	ldsh	[%l7 + %o0],	%l4
	st	%f15,	[%l7 + 0x14]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xe2,	%o2
	nop
	set	0x40, %l1
	ldstub	[%l7 + %l1],	%g1
	nop
	set	0x08, %g6
	sth	%i5,	[%l7 + %g6]
	and	%i4,	%l3,	%g2
	nop
	set	0x45, %l3
	ldub	[%l7 + %l3],	%i1
	set	0x70, %o7
	sta	%f28,	[%l7 + %o7] 0x81
	nop
	set	0x58, %l6
	std	%g6,	[%l7 + %l6]
	set	0x58, %l5
	stxa	%o5,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x30, %i6
	std	%l0,	[%l7 + %i6]
	nop
	set	0x16, %l4
	ldsb	[%l7 + %l4],	%o7
	nop
	nop
	setx	0x26D15085,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x101D257A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f15,	%f20
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x89
	fpadd16	%f10,	%f28,	%f22
	set	0x10, %g1
	stxa	%i3,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x1C, %o2
	stwa	%i7,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%f22
	nop
	set	0x74, %i4
	lduw	[%l7 + %i4],	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g7
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x89,	%g4
	nop
	set	0x10, %g4
	stx	%l2,	[%l7 + %g4]
	set	0x48, %i5
	stxa	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x10, %i1
	std	%f26,	[%l7 + %i1]
	add	%o0,	%o4,	%g5
	nop
	set	0x69, %l0
	ldstub	[%l7 + %l0],	%l5
	set	0x28, %l2
	stda	%o2,	[%l7 + %l2] 0x88
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%l0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f16
	fpadd32s	%f7,	%f7,	%f26
	nop
	set	0x4C, %g7
	ldsw	[%l7 + %g7],	%i0
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xe3,	%g2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f0
	nop
	set	0x4E, %g3
	sth	%l4,	[%l7 + %g3]
	set	0x30, %g2
	stda	%o2,	[%l7 + %g2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x3C],	%f12
	set	0x50, %g5
	stxa	%i2,	[%l7 + %g5] 0x88
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%g0
	set	0x70, %o0
	stxa	%i4,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f16
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%l3
	set	0x40, %o7
	sta	%f10,	[%l7 + %o7] 0x89
	nop
	set	0x10, %l6
	std	%g2,	[%l7 + %l6]
	nop
	set	0x2C, %l1
	ldsw	[%l7 + %l1],	%i1
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x80,	%g6
	or	%i5,	%l1,	%o5
	set	0x28, %o1
	stwa	%o7,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x0C, %i6
	ldsh	[%l7 + %i6],	%i7
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%i3
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x81
	and	%l6,	%g7,	%i6
	nop
	set	0x30, %o2
	lduh	[%l7 + %o2],	%g4
	nop
	set	0x70, %g1
	std	%l2,	[%l7 + %g1]
	set	0x76, %i3
	stba	%o6,	[%l7 + %i3] 0x88
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x88
	set	0x38, %o3
	lda	[%l7 + %o3] 0x89,	%f25
	and	%o4,	%g5,	%o0
	nop
	set	0x70, %i2
	stx	%o2,	[%l7 + %i2]
	or	%l5,	%o1,	%i0
	add	%g3,	%l0,	%l4
	nop
	set	0x5C, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x38, %i1
	sta	%f1,	[%l7 + %i1] 0x81
	wr	%o3,	%i2,	%set_softint
	nop
	set	0x26, %l0
	ldstub	[%l7 + %l0],	%i4
	set	0x70, %i5
	lda	[%l7 + %i5] 0x88,	%f7
	st	%f1,	[%l7 + 0x28]
	and	%l3,	%g2,	%i1
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	bne	%xcc,	loop_34
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%g0
	nop
	set	0x28, %o6
	std	%f0,	[%l7 + %o6]
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%g6
loop_34:
	nop
	nop
	setx	0xD224B60D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x29CFE2AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f29,	%f9
	set	0x08, %l2
	stxa	%l1,	[%l7 + %l2] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	be	%xcc,	loop_35
	nop
	set	0x23, %g5
	ldsb	[%l7 + %g5],	%i5
	nop
	set	0x34, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x2C, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o7
loop_35:
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x80,	%i7
	nop
	set	0x78, %l3
	ldsw	[%l7 + %l3],	%i3
	add	%l6,	%g7,	%i6
	nop
	set	0x70, %o7
	ldstub	[%l7 + %o7],	%g4
	st	%fsr,	[%l7 + 0x14]
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	fpsub32s	%f28,	%f18,	%f4
	nop
	set	0x4C, %l5
	prefetch	[%l7 + %l5],	 4
	st	%f15,	[%l7 + 0x68]
	nop
	set	0x20, %l6
	ldstub	[%l7 + %l6],	%l2
	nop
	set	0x18, %o1
	std	%o6,	[%l7 + %o1]
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	st	%f2,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x3C]
	and	%g5,	%o0,	%o2
	nop
	set	0x28, %i6
	std	%f24,	[%l7 + %i6]
	nop
	set	0x10, %o2
	swap	[%l7 + %o2],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%i0
	set	0x34, %g1
	stwa	%o1,	[%l7 + %g1] 0x81
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f16
	add	%g3,	%l0,	%o3
	set	0x68, %i4
	stda	%l4,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x18, %o3
	stw	%i2,	[%l7 + %o3]
	set	0x77, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i4
	nop
	set	0x70, %g4
	stx	%l3,	[%l7 + %g4]
	set	0x5C, %i3
	swapa	[%l7 + %i3] 0x88,	%i1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l1,	%i5,	%o7
	nop
	set	0x44, %l0
	stw	%g1,	[%l7 + %l0]
	set	0x28, %i5
	stxa	%i3,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f0
	nop
	set	0x28, %g7
	lduh	[%l7 + %g7],	%i7
	nop
	set	0x54, %o6
	lduh	[%l7 + %o6],	%l6
	fpsub32	%f28,	%f2,	%f10
	nop
	set	0x30, %i0
	swap	[%l7 + %i0],	%g7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o5
	nop
	nop
	setx	0xE0A8FD5C31E83784,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xD1F194229F9284AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f10,	%f24
	st	%f22,	[%l7 + 0x70]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f0
	nop
	set	0x4C, %i1
	lduh	[%l7 + %i1],	%g4
	set	0x41, %g5
	ldstuba	[%l7 + %g5] 0x89,	%o6
	nop
	set	0x7C, %g3
	stw	%g5,	[%l7 + %g3]
	set	0x20, %g2
	stha	%l2,	[%l7 + %g2] 0x89
	bleu,a	%xcc,	loop_36
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f26
	set	0x0A, %g6
	stha	%o2,	[%l7 + %g6] 0xe2
	membar	#Sync
loop_36:
	nop
	set	0x30, %o0
	lduw	[%l7 + %o0],	%o0
	nop
	set	0x59, %o7
	ldub	[%l7 + %o7],	%l5
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x40, %l3
	prefetch	[%l7 + %l3],	 1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%i0
	nop
	set	0x63, %l1
	ldstub	[%l7 + %l1],	%o1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%g3
	set	0x38, %l6
	swapa	[%l7 + %l6] 0x81,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%l4
	nop
	set	0x56, %l5
	sth	%i4,	[%l7 + %l5]
	nop
	set	0x3C, %o1
	sth	%l3,	[%l7 + %o1]
	set	0x64, %i6
	lda	[%l7 + %i6] 0x88,	%f2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x78, %o2
	std	%l0,	[%l7 + %o2]
	set	0x58, %g1
	stda	%g6,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%i5
	nop
	set	0x10, %i4
	lduw	[%l7 + %i4],	%g1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%i7
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%i6
	nop
	set	0x44, %g4
	ldsb	[%l7 + %g4],	%o7
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %o3
	stxa	%i6,	[%l7 + %o3] 0x89
	set	0x68, %i3
	stba	%o5,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x58, %i5
	std	%g4,	[%l7 + %i5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%g7
	nop
	set	0x5C, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x30, %g7
	swap	[%l7 + %g7],	%g5
	nop
	set	0x1C, %o6
	lduw	[%l7 + %o6],	%l2
	and	%o2,	%l5,	%o0
	ld	[%l7 + 0x18],	%f14
	nop
	set	0x30, %i0
	std	%i0,	[%l7 + %i0]
	set	0x7C, %o4
	stha	%o4,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x68, %i1
	lduw	[%l7 + %i1],	%o1
	nop
	set	0x18, %l2
	ldsw	[%l7 + %l2],	%l0
	nop
	set	0x5C, %g5
	stb	%g3,	[%l7 + %g5]
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%o3
	st	%f0,	[%l7 + 0x10]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%i4
	nop
	set	0x08, %o5
	std	%f16,	[%l7 + %o5]
	nop
	set	0x78, %g2
	swap	[%l7 + %g2],	%l3
	ld	[%l7 + 0x18],	%f12
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd8
	set	0x64, %o7
	swapa	[%l7 + %o7] 0x81,	%l4
	nop
	set	0x70, %l3
	ldub	[%l7 + %l3],	%i1
	nop
	set	0x34, %l1
	ldsb	[%l7 + %l1],	%g2
	or	%l1,	%i5,	%g6
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f0
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%i3
	nop
	set	0x6E, %o1
	lduh	[%l7 + %o1],	%i7
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	set	0x5C, %o2
	stba	%l6,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x17, %g1
	ldsb	[%l7 + %g1],	%g1
	st	%f19,	[%l7 + 0x30]
	fpsub16s	%f2,	%f0,	%f13
	fpadd16	%f0,	%f4,	%f18
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%i6
	nop
	set	0x28, %l4
	std	%o6,	[%l7 + %l4]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o6
	nop
	set	0x08, %i6
	ldsw	[%l7 + %i6],	%g7
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x88,	 2
	set	0x1B, %g4
	stba	%g5,	[%l7 + %g4] 0x80
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f0
	set	0x30, %i3
	stda	%l2,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x48, %i2
	stxa	%l5,	[%l7 + %i2] 0x88
	nop
	set	0x58, %l0
	std	%f14,	[%l7 + %l0]
	nop
	set	0x0C, %g7
	stw	%o0,	[%l7 + %g7]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7E0, 	%sys_tick_cmpr
	nop
	set	0x3C, %i5
	stb	%o1,	[%l7 + %i5]
	set	0x7B, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l0
	and	%g3,	%o3,	%o4
	nop
	set	0x58, %o6
	std	%f2,	[%l7 + %o6]
	nop
	set	0x74, %o4
	stb	%i4,	[%l7 + %o4]
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xeb,	%i2
	and	%l3,	%l4,	%i1
	nop
	set	0x40, %g5
	std	%g2,	[%l7 + %g5]
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xea,	%i4
	nop
	set	0x11, %g3
	ldstub	[%l7 + %g3],	%l1
	and	%i3,	%g6,	%i7
	nop
	set	0x18, %o5
	stx	%g1,	[%l7 + %o5]
	set	0x70, %g2
	stwa	%i6,	[%l7 + %g2] 0x88
	st	%f12,	[%l7 + 0x7C]
	nop
	set	0x78, %o7
	lduw	[%l7 + %o7],	%o7
	nop
	set	0x2B, %l3
	ldstub	[%l7 + %l3],	%g4
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%o6
	st	%fsr,	[%l7 + 0x70]
	ld	[%l7 + 0x48],	%f17
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 4
	or	%g7,	%l6,	%g5
	nop
	set	0x44, %l6
	prefetch	[%l7 + %l6],	 2
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x88,	%o4
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xeb,	%l4
	st	%f26,	[%l7 + 0x6C]
	add	%l2,	%i0,	%o2
	st	%f9,	[%l7 + 0x34]
	nop
	set	0x68, %o0
	std	%o0,	[%l7 + %o0]
	add	%l0,	%o0,	%o3
	set	0x38, %o2
	lda	[%l7 + %o2] 0x88,	%f15
	nop
	set	0x18, %i7
	std	%o4,	[%l7 + %i7]
	set	0x58, %g1
	sta	%f24,	[%l7 + %g1] 0x88
	add	%g3,	%i4,	%l3
	set	0x64, %l4
	sta	%f20,	[%l7 + %l4] 0x81
	set	0x1B, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%g2
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f26
	nop
	set	0x78, %g4
	stx	%i5,	[%l7 + %g4]
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	ld	[%l7 + 0x48],	%f8
	nop
	set	0x0A, %i2
	sth	%l4,	[%l7 + %i2]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x14, %o3
	stw	%l1,	[%l7 + %o3]
	nop
	set	0x70, %i5
	std	%f28,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x20]
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x89,	%i3
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%i7
	nop
	set	0x50, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x18, %o6
	ldub	[%l7 + %o6],	%g1
	set	0x47, %g5
	ldstuba	[%l7 + %g5] 0x80,	%g6
	set	0x44, %l2
	lda	[%l7 + %l2] 0x80,	%f31
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%o7
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%g4
	nop
	set	0x38, %g2
	std	%f30,	[%l7 + %g2]
	nop
	set	0x64, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x16, %o5
	lduh	[%l7 + %o5],	%i6
	ble,a,pn	%icc,	loop_37
	add	%g7,	%o6,	%g5
	ble	%xcc,	loop_38
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%f14
loop_37:
	and	%l6,	%o5,	%l5
	set	0x68, %g6
	stda	%i0,	[%l7 + %g6] 0x81
loop_38:
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%o2
	or	%o1,	%l2,	%o0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%o3
	nop
	set	0x14, %l5
	ldsh	[%l7 + %l5],	%g3
	nop
	set	0x78, %o1
	lduh	[%l7 + %o1],	%o4
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%i4
	st	%f6,	[%l7 + 0x30]
	and	%l3,	%i1,	%i2
	nop
	set	0x4C, %o0
	lduh	[%l7 + %o0],	%g2
	st	%f14,	[%l7 + 0x10]
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x81,	 3
	set	0x2B, %i7
	stba	%l4,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xe3,	%l0
	and	%i3,	%i7,	%g6
	nop
	set	0x3A, %i6
	ldsb	[%l7 + %i6],	%g1
	set	0x78, %l4
	stxa	%g4,	[%l7 + %l4] 0xe3
	membar	#Sync
	fpsub16	%f8,	%f4,	%f26
	nop
	set	0x20, %i3
	sth	%i6,	[%l7 + %i3]
	set	0x78, %g4
	stxa	%o7,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x10, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x7E, %o3
	lduh	[%l7 + %o3],	%g7
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xeb,	%g4
	nop
	set	0x66, %i5
	sth	%o6,	[%l7 + %i5]
	set	0x34, %o4
	stba	%o5,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x68, %i0
	stx	%l6,	[%l7 + %i0]
	nop
	set	0x29, %g5
	ldub	[%l7 + %g5],	%l5
	nop
	set	0x3C, %l2
	stw	%i0,	[%l7 + %l2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%o2
	set	0x38, %o6
	stda	%l2,	[%l7 + %o6] 0x81
	nop
	set	0x54, %g3
	swap	[%l7 + %g3],	%l0
	ba,pn	%xcc,	loop_39
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%o0
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f8
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
loop_39:
	nop
	set	0x36, %l1
	sth	%g3,	[%l7 + %l1]
	nop
	set	0x48, %o7
	std	%o4,	[%l7 + %o7]
	set	0x16, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i4
	wr	%o3,	%l3,	%set_softint
	nop
	set	0x3F, %l3
	ldsb	[%l7 + %l3],	%i2
	set	0x70, %l6
	stda	%g2,	[%l7 + %l6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x60],	%f10
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f18
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x80,	%i5
	nop
	set	0x57, %o2
	ldub	[%l7 + %o2],	%l4
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x88,	%i1
	set	0x10, %g1
	ldxa	[%l7 + %g1] 0x88,	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%i7
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 4
	wr	%g1,	%g6,	%clear_softint
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x30, %i7
	std	%f28,	[%l7 + %i7]
	nop
	set	0x70, %l4
	lduh	[%l7 + %l4],	%i6
	wr	%o7,	%g4,	%clear_softint
	nop
	set	0x4C, %i3
	swap	[%l7 + %i3],	%g7
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%f20
	nop
	set	0x22, %g4
	sth	%o6,	[%l7 + %g4]
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%g4
	nop
	set	0x38, %l0
	std	%f26,	[%l7 + %l0]
	set	0x70, %g7
	stba	%l6,	[%l7 + %g7] 0x88
	bleu	%icc,	loop_40
	fpadd16s	%f23,	%f16,	%f14
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
loop_40:
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%i0
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%o5
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x88,	 4
	nop
	set	0x20, %g3
	ldsw	[%l7 + %g3],	%o2
	add	%l0,	%o0,	%g3
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%f0
	set	0x0A, %o4
	stha	%l2,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x10, %i1
	lduw	[%l7 + %i1],	%i4
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%o4
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f16
	ba,a,pn	%xcc,	loop_41
	st	%fsr,	[%l7 + 0x4C]
	set	0x78, %o5
	lda	[%l7 + %o5] 0x80,	%f12
loop_41:
	nop
	set	0x10, %l3
	std	%l2,	[%l7 + %l3]
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%i2
	or	%o3,	%g2,	%i5
	set	0x14, %l5
	sta	%f19,	[%l7 + %l5] 0x88
	and	%l4,	%i1,	%l1
	nop
	set	0x1F, %l6
	ldsb	[%l7 + %l6],	%i7
	set	0x70, %o1
	stxa	%i3,	[%l7 + %o1] 0xe3
	membar	#Sync
	and	%g6,	%g1,	%o7
	nop
	set	0x18, %o2
	ldsh	[%l7 + %o2],	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%o6
	and	%g5,	%l6,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o5
	nop
	set	0x28, %g1
	ldsw	[%l7 + %g1],	%o1
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%o2
	nop
	set	0x11, %o0
	stb	%l0,	[%l7 + %o0]
	bleu,a	%icc,	loop_42
	or	%o0,	%g3,	%l2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	or	%l5,	%l3,	%o3
loop_42:
	nop
	set	0x18, %i7
	swap	[%l7 + %i7],	%g2
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x70, %i3
	sta	%f25,	[%l7 + %i3] 0x89
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f26
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%i2
	set	0x5A, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i1
	st	%f3,	[%l7 + 0x0C]
	nop
	set	0x10, %i6
	std	%l0,	[%l7 + %i6]
	fpadd32	%f8,	%f14,	%f24
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x24, %l0
	sth	%g6,	[%l7 + %l0]
	nop
	set	0x1C, %g7
	ldsh	[%l7 + %g7],	%g1
	nop
	set	0x70, %o3
	stx	%i3,	[%l7 + %o3]
	set	0x7F, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o7
	nop
	set	0x70, %i0
	stx	%g4,	[%l7 + %i0]
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f16
	st	%f29,	[%l7 + 0x68]
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x88,	%i6
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x80,	%g4
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%o6
	nop
	set	0x0A, %o4
	ldsb	[%l7 + %o4],	%g7
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%o2
	set	0x34, %o7
	lda	[%l7 + %o7] 0x88,	%f30
	nop
	set	0x5C, %o5
	ldub	[%l7 + %o5],	%o5
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%o0
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%l0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xda
	set	0x48, %l6
	sta	%f28,	[%l7 + %l6] 0x88
	set	0x08, %l5
	stda	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%o4
	set	0x20, %o1
	stxa	%i4,	[%l7 + %o1] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%o3
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%g2
	nop
	set	0x68, %o2
	std	%f14,	[%l7 + %o2]
	st	%f16,	[%l7 + 0x1C]
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%i5
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x10, %i4
	stxa	%l5,	[%l7 + %i4] 0x88
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	nop
	set	0x3C, %g4
	stw	%i2,	[%l7 + %g4]
	set	0x64, %i3
	swapa	[%l7 + %i3] 0x89,	%l4
	fpadd16s	%f2,	%f14,	%f1
	fpsub32s	%f25,	%f1,	%f11
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%i6
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x30, %g7
	lda	[%l7 + %g7] 0x81,	%f9
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f20
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x80,	%g6
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x54, %i5
	ldsh	[%l7 + %i5],	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x88,	%i3,	%g1
	nop
	set	0x10, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x50, %i0
	stwa	%o7,	[%l7 + %i0] 0x81
	set	0x54, %o6
	sta	%f28,	[%l7 + %o6] 0x81
	set	0x48, %g2
	stda	%g4,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x32, %g3
	ldsh	[%l7 + %g3],	%g5
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc2
	nop
	set	0x26, %l1
	ldub	[%l7 + %l1],	%i6
	ble,pt	%icc,	loop_43
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%g7
	nop
	set	0x34, %o4
	ldsh	[%l7 + %o4],	%l6
	and	%o6,	%i0,	%o1
loop_43:
	nop
	set	0x48, %l3
	std	%f2,	[%l7 + %l3]
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x89,	%o2
	set	0x50, %g6
	stwa	%o0,	[%l7 + %g6] 0xe2
	membar	#Sync
	or	%l0,	%o5,	%l2
	set	0x48, %l6
	stda	%g2,	[%l7 + %l6] 0x80
	set	0x50, %i1
	lda	[%l7 + %i1] 0x80,	%f17
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x78, %l5
	stx	%i4,	[%l7 + %l5]
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xe3,	%o4
	set	0x08, %g1
	stda	%l2,	[%l7 + %g1] 0xe2
	membar	#Sync
	ld	[%l7 + 0x44],	%f10
	set	0x08, %o0
	stwa	%g2,	[%l7 + %o0] 0x81
	nop
	set	0x4C, %i7
	stw	%i5,	[%l7 + %i7]
	nop
	set	0x26, %o2
	ldsh	[%l7 + %o2],	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0E2, 	%sys_tick_cmpr
	nop
	set	0x70, %i4
	sth	%i1,	[%l7 + %i4]
	nop
	set	0x2C, %g4
	ldsw	[%l7 + %g4],	%l4
	nop
	set	0x50, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x50, %l4
	stw	%i7,	[%l7 + %l4]
	nop
	set	0x2B, %i2
	ldstub	[%l7 + %i2],	%g6
	nop
	set	0x0E, %i6
	ldsh	[%l7 + %i6],	%i3
	nop
	set	0x68, %g7
	std	%f4,	[%l7 + %g7]
	set	0x40, %o3
	lda	[%l7 + %o3] 0x81,	%f16
	nop
	set	0x6C, %i5
	swap	[%l7 + %i5],	%l1
	nop
	set	0x30, %l0
	swap	[%l7 + %l0],	%o7
	set	0x0C, %i0
	sta	%f0,	[%l7 + %i0] 0x89
	nop
	set	0x40, %g5
	stx	%g1,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x1E, %g2
	ldsb	[%l7 + %g2],	%g4
	wr	%i6,	%g5,	%set_softint
	set	0x47, %g3
	stba	%l6,	[%l7 + %g3] 0x80
	and	%o6,	%g7,	%o1
	set	0x7C, %l2
	sta	%f28,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x78],	%f28
	nop
	set	0x34, %l1
	lduw	[%l7 + %l1],	%i0
	fpsub16	%f18,	%f10,	%f30
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%o0
	fpadd16	%f28,	%f6,	%f2
	nop
	set	0x10, %o4
	std	%f12,	[%l7 + %o4]
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f18
	set	0x44, %o7
	sta	%f18,	[%l7 + %o7] 0x81
	nop
	set	0x54, %o5
	lduw	[%l7 + %o5],	%l0
	set	0x3C, %g6
	swapa	[%l7 + %g6] 0x88,	%o5
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x2E, %l6
	sth	%l2,	[%l7 + %l6]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc2
	set	0x48, %o0
	stxa	%g3,	[%l7 + %o0] 0x89
	set	0x44, %i7
	stwa	%o2,	[%l7 + %i7] 0x80
	set	0x10, %o2
	stda	%i4,	[%l7 + %o2] 0x80
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x2C, %g1
	sth	%l3,	[%l7 + %g1]
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd0
	nop
	set	0x59, %i4
	stb	%o4,	[%l7 + %i4]
	set	0x0C, %i3
	stwa	%i5,	[%l7 + %i3] 0x81
	nop
	set	0x2A, %l4
	sth	%g2,	[%l7 + %l4]
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 4
	fpadd32	%f16,	%f4,	%f20
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x80,	%l4
	nop
	set	0x0A, %g7
	stb	%o3,	[%l7 + %g7]
	nop
	set	0x58, %i5
	stw	%i2,	[%l7 + %i5]
	wr	%i1,	%i7,	%y
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%g6
	nop
	set	0x6C, %o3
	ldsh	[%l7 + %o3],	%l4
	ld	[%l7 + 0x38],	%f3
	nop
	set	0x38, %g5
	std	%i2,	[%l7 + %g5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o7
	set	0x70, %g2
	stxa	%g1,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x80,	%i6
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f30
	set	0x44, %l1
	stba	%g4,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x50, %g3
	std	%g4,	[%l7 + %g3]
	nop
	set	0x48, %o4
	prefetch	[%l7 + %o4],	 4
	add	%l6,	%o6,	%o1
	st	%f2,	[%l7 + 0x48]
	nop
	set	0x38, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x68, %o7
	std	%g6,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	nop
	set	0x60, %o5
	stw	%i0,	[%l7 + %o5]
	nop
	set	0x58, %i1
	ldsh	[%l7 + %i1],	%o0
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f28
	or	%l0,	%o5,	%g3
	st	%fsr,	[%l7 + 0x0C]
	add	%l2,	%o2,	%i4
	set	0x08, %g6
	sta	%f23,	[%l7 + %g6] 0x81
	nop
	set	0x6A, %o1
	ldsb	[%l7 + %o1],	%o4
	ld	[%l7 + 0x4C],	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xea,	%i4
	and	%l3,	%l5,	%o3
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%i2
	nop
	set	0x10, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x3B, %o2
	stb	%g2,	[%l7 + %o2]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%i0
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i7
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x68, %i4
	std	%g6,	[%l7 + %i4]
	wr	%i3,	%l1,	%softint
	bgu,a,pt	%xcc,	loop_44
	nop
	set	0x74, %i3
	ldstub	[%l7 + %i3],	%o7
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f0
loop_44:
	nop
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	nop
	set	0x2C, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x58, %l0
	stw	%l4,	[%l7 + %l0]
	fpsub16	%f16,	%f4,	%f22
	nop
	set	0x6C, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x7D, %o3
	stb	%g4,	[%l7 + %o3]
	or	%g5,	%o6,	%o1
	nop
	set	0x20, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x60, %g2
	stwa	%l6,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x10, %i0
	sta	%f14,	[%l7 + %i0] 0x80
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x14, %g3
	swap	[%l7 + %g3],	%i0
	set	0x76, %l2
	stha	%g7,	[%l7 + %l2] 0x81
	set	0x50, %o6
	sta	%f18,	[%l7 + %o6] 0x81
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%o5
	nop
	set	0x32, %o7
	ldub	[%l7 + %o7],	%o0
	or	%g3,	%o2,	%l2
	nop
	set	0x55, %o4
	ldub	[%l7 + %o4],	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i5
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x60, %o5
	stda	%l4,	[%l7 + %o5] 0x89
	nop
	set	0x4C, %i1
	ldsh	[%l7 + %i1],	%l3
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x46, %g6
	ldstuba	[%l7 + %g6] 0x89,	%o3
	set	0x34, %o1
	stba	%i2,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x78, %o0
	ldsw	[%l7 + %o0],	%i1
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %i7
	std	%i6,	[%l7 + %i7]
	set	0x48, %g1
	sta	%f30,	[%l7 + %g1] 0x89
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x44, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x48, %o2
	stwa	%g6,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf9
	membar	#Sync
	or	%g2,	%l1,	%o7
	ld	[%l7 + 0x68],	%f4
	set	0x56, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%l4
	nop
	set	0x09, %i6
	stb	%g4,	[%l7 + %i6]
	nop
	set	0x1E, %l4
	ldsh	[%l7 + %l4],	%g5
	st	%f25,	[%l7 + 0x60]
	nop
	set	0x0A, %i2
	stb	%o6,	[%l7 + %i2]
	nop
	set	0x30, %g7
	prefetch	[%l7 + %g7],	 4
	nop
	set	0x34, %i5
	sth	%i6,	[%l7 + %i5]
	bgu	%xcc,	loop_45
	nop
	set	0x16, %l0
	stb	%o1,	[%l7 + %l0]
	nop
	set	0x48, %g5
	stx	%i0,	[%l7 + %g5]
	nop
	set	0x20, %g2
	ldsw	[%l7 + %g2],	%g7
loop_45:
	nop
	set	0x08, %i0
	std	%f20,	[%l7 + %i0]
	and	%l6,	%o5,	%l0
	add	%g3,	%o2,	%o0
	and	%l2,	%o4,	%i5
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f30
	nop
	set	0x1A, %g3
	sth	%i4,	[%l7 + %g3]
	bge,a	%xcc,	loop_46
	nop
	set	0x39, %l2
	ldub	[%l7 + %l2],	%l5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%i2
loop_46:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i1
	add	%g6,	%g2,	%l1
	nop
	set	0x68, %l1
	lduw	[%l7 + %l1],	%i7
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x80,	%g0
	nop
	set	0x73, %o4
	ldstub	[%l7 + %o4],	%i3
	nop
	set	0x6C, %o7
	prefetch	[%l7 + %o7],	 0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%o7
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x80,	%g4
	ble,a	%xcc,	loop_47
	fpsub32	%f26,	%f18,	%f12
	nop
	set	0x7E, %o5
	ldsh	[%l7 + %o5],	%o6
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%i6
loop_47:
	nop
	set	0x1F, %g6
	ldstub	[%l7 + %g6],	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%o1
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x81,	 2
	nop
	set	0x0A, %o0
	lduh	[%l7 + %o0],	%l6
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%l0
	nop
	set	0x1C, %i7
	stw	%o5,	[%l7 + %i7]
	nop
	set	0x40, %o1
	stx	%o2,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x54]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x43C, 	%tick_cmpr
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	ld	[%l7 + 0x10],	%f4
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%o0
	nop
	nop
	setx	0x59FC0DDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xCF220118,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f9,	%f30
	nop
	set	0x38, %o2
	lduh	[%l7 + %o2],	%o4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%i4
	set	0x55, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o3
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xda
	set	0x60, %l4
	ldda	[%l7 + %l4] 0xeb,	%l4
	st	%f18,	[%l7 + 0x28]
	nop
	set	0x65, %i6
	ldub	[%l7 + %i6],	%i2
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 4
	fpsub16	%f14,	%f14,	%f2
	nop
	set	0x77, %g7
	ldsb	[%l7 + %g7],	%i1
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%l2
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%g2
	nop
	set	0x6A, %l0
	ldstub	[%l7 + %l0],	%g6
	set	0x54, %i0
	lda	[%l7 + %i0] 0x80,	%f15
	nop
	set	0x70, %g2
	prefetch	[%l7 + %g2],	 1
	bne,a	%xcc,	loop_48
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x1C, %o3
	stw	%i7,	[%l7 + %o3]
	nop
	set	0x60, %l1
	swap	[%l7 + %l1],	%l1
loop_48:
	or	%i3,	%l4,	%g1
	nop
	set	0x5C, %o6
	ldsw	[%l7 + %o6],	%o7
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x88,	%g4
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xd8
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f14
	and	%o6,	%i6,	%i0
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
	nop
	set	0x5D, %l3
	ldstub	[%l7 + %l3],	%o1
	or	%g5,	%l6,	%g7
	nop
	set	0x30, %i1
	ldub	[%l7 + %i1],	%l0
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f8
	nop
	set	0x14, %g6
	swap	[%l7 + %g6],	%o5
	set	0x0C, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g3
	nop
	set	0x68, %i7
	lduw	[%l7 + %i7],	%o2
	add	%l2,	%o0,	%o4
	nop
	nop
	setx	0x73459FE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x3BB265EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f13,	%f15
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%i5
	or	%o3,	%l5,	%i1
	nop
	set	0x3E, %o1
	stb	%i2,	[%l7 + %o1]
	set	0x79, %g1
	ldstuba	[%l7 + %g1] 0x88,	%l3
	st	%f14,	[%l7 + 0x30]
	set	0x58, %l5
	sta	%f28,	[%l7 + %l5] 0x80
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x81,	%g6
	nop
	set	0x08, %i4
	ldsb	[%l7 + %i4],	%i7
	nop
	set	0x4B, %g4
	ldstub	[%l7 + %g4],	%l1
	set	0x11, %i3
	stba	%i3,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x08, %i6
	ldsh	[%l7 + %i6],	%g2
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%l4
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%g0
	nop
	set	0x30, %g7
	stw	%o7,	[%l7 + %g7]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i6
	set	0x30, %i5
	sta	%f21,	[%l7 + %i5] 0x80
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x29, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i0
	fpsub16	%f14,	%f10,	%f30
	or	%o1,	%o6,	%g5
	nop
	set	0x68, %i0
	std	%f8,	[%l7 + %i0]
	and	%l6,	%l0,	%o5
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%g3
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	nop
	set	0x4C, %g3
	ldsb	[%l7 + %g3],	%l2
	and	%o0,	%o2,	%o4
	and	%i4,	%i5,	%l5
	nop
	set	0x54, %o4
	stw	%i1,	[%l7 + %o4]
	set	0x28, %o6
	stha	%o3,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x44, %l2
	swapa	[%l7 + %l2] 0x81,	%l3
	nop
	set	0x60, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x08, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f0
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x81,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i7
	ld	[%l7 + 0x34],	%f24
	nop
	set	0x34, %g6
	swap	[%l7 + %g6],	%l1
	set	0x48, %o0
	swapa	[%l7 + %o0] 0x89,	%i3
	nop
	set	0x78, %i7
	lduh	[%l7 + %i7],	%l4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%o7
	nop
	set	0x20, %o1
	sth	%g4,	[%l7 + %o1]
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%i6
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%i0
	set	0x28, %o2
	stxa	%g1,	[%l7 + %o2] 0x89
	nop
	set	0x5C, %i4
	ldsh	[%l7 + %i4],	%o1
	nop
	set	0x60, %g4
	ldsw	[%l7 + %g4],	%o6
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x34, %i3
	lduw	[%l7 + %i3],	%g5
	nop
	set	0x29, %l5
	ldub	[%l7 + %l5],	%l0
	nop
	set	0x36, %i6
	ldsb	[%l7 + %i6],	%l6
	or	%g3,	%g7,	%o5
	nop
	set	0x58, %i2
	sth	%o0,	[%l7 + %i2]
	set	0x59, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o2
	set	0x38, %l4
	stxa	%l2,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%i4
	nop
	set	0x30, %g5
	ldsw	[%l7 + %g5],	%i5
	set	0x40, %l0
	lda	[%l7 + %l0] 0x88,	%f27
	nop
	set	0x5C, %i0
	lduw	[%l7 + %i0],	%l5
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f30
	set	0x18, %l1
	stxa	%i1,	[%l7 + %l1] 0x89
	set	0x20, %g3
	stda	%o4,	[%l7 + %g3] 0x81
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	set	0x68, %o6
	lda	[%l7 + %o6] 0x80,	%f26
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f14
	nop
	set	0x51, %o7
	ldsb	[%l7 + %o7],	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%i2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%i3
	and	%l4,	%g2,	%o7
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x80,	%l1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xe3,	%g4
	nop
	set	0x4A, %i1
	lduh	[%l7 + %i1],	%i6
	nop
	set	0x32, %g6
	ldstub	[%l7 + %g6],	%g1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o6
	set	0x68, %o0
	stxa	%o1,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x08, %l2
	stx	%g5,	[%l7 + %l2]
	nop
	set	0x38, %o1
	std	%i6,	[%l7 + %o1]
	nop
	set	0x28, %i7
	stx	%g3,	[%l7 + %i7]
	nop
	set	0x18, %g1
	stw	%g7,	[%l7 + %g1]
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%o4
	st	%fsr,	[%l7 + 0x20]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%o2
	bg,a,pt	%icc,	loop_49
	nop
	set	0x6E, %o2
	ldsh	[%l7 + %o2],	%l2
	nop
	nop
	setx	0x6A823D03E8A615D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC63723BEEE26C47D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f18
	fpadd32	%f10,	%f2,	%f20
loop_49:
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%i4
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%l5
	nop
	set	0x1E, %l5
	ldsh	[%l7 + %l5],	%o4
	nop
	set	0x48, %i6
	ldsh	[%l7 + %i6],	%i1
	nop
	set	0x30, %i2
	lduh	[%l7 + %i2],	%o3
	set	0x24, %i3
	sta	%f23,	[%l7 + %i3] 0x81
	nop
	set	0x1C, %g7
	swap	[%l7 + %g7],	%l3
	nop
	set	0x7E, %l4
	stb	%g6,	[%l7 + %l4]
	set	0x48, %g5
	stda	%i6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x0C, %l0
	swap	[%l7 + %l0],	%i3
	nop
	set	0x58, %i0
	stw	%i2,	[%l7 + %i0]
	and	%g2,	%l4,	%o7
	wr	%l1,	%g4,	%pic
	fpsub32	%f12,	%f22,	%f8
	st	%f26,	[%l7 + 0x10]
	set	0x20, %o3
	stxa	%i6,	[%l7 + %o3] 0xe2
	membar	#Sync
	add	%i0,	%g1,	%o1
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%g5
	nop
	set	0x5A, %i5
	sth	%l6,	[%l7 + %i5]
	ba,a,pt	%xcc,	loop_50
	nop
	set	0x2C, %g3
	ldstub	[%l7 + %g3],	%g3
	nop
	set	0x40, %o4
	lduh	[%l7 + %o4],	%o6
	nop
	set	0x32, %o6
	stb	%g7,	[%l7 + %o6]
loop_50:
	nop
	set	0x34, %o7
	stwa	%o5,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x11, %g2
	stba	%o2,	[%l7 + %g2] 0x88
	nop
	set	0x62, %i1
	ldsb	[%l7 + %i1],	%l2
	set	0x48, %g6
	sta	%f28,	[%l7 + %g6] 0x80
	set	0x48, %o0
	stwa	%i5,	[%l7 + %o0] 0x89
	nop
	set	0x30, %o5
	std	%f22,	[%l7 + %o5]
	add	%l0,	%i4,	%o4
	nop
	set	0x3C, %o1
	lduh	[%l7 + %o1],	%l5
	wr	%o3,	%l3,	%pic
	bgu,pn	%icc,	loop_51
	and	%g6,	%i1,	%i3
	nop
	set	0x14, %i7
	ldsh	[%l7 + %i7],	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%i2
loop_51:
	nop
	set	0x18, %l2
	std	%f18,	[%l7 + %l2]
	set	0x24, %g1
	stba	%l4,	[%l7 + %g1] 0x81
	nop
	set	0x20, %l6
	ldsw	[%l7 + %l6],	%l1
	set	0x38, %i4
	lda	[%l7 + %i4] 0x89,	%f31
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x89,	%o7
	or	%i6,	%i0,	%g4
	or	%o1,	%g1,	%l6
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x89,	%g2
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%g7
	and	%o5,	%o0,	%o2
	nop
	set	0x64, %g4
	ldsh	[%l7 + %g4],	%l2
	nop
	set	0x28, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x56, %g7
	ldsb	[%l7 + %g7],	%o6
	nop
	set	0x78, %l4
	swap	[%l7 + %l4],	%i5
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x80,	 1
	and	%i4,	%o4,	%l5
	nop
	set	0x3E, %l0
	lduh	[%l7 + %l0],	%l3
	nop
	set	0x0C, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x72, %l1
	ldstub	[%l7 + %l1],	%g6
	nop
	set	0x50, %i5
	lduh	[%l7 + %i5],	%i1
	ld	[%l7 + 0x78],	%f25
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x80,	 3
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%i6
	fpadd32s	%f29,	%f8,	%f22
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%i3
	set	0x18, %o7
	stxa	%i2,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%g2,	%l1,	%o7
	or	%l4,	%i6,	%i0
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x88,	 2
	nop
	set	0x10, %g2
	stw	%g1,	[%l7 + %g2]
	and	%o1,	%l6,	%g5
	nop
	set	0x44, %i1
	lduh	[%l7 + %i1],	%g7
	nop
	set	0x74, %g6
	ldub	[%l7 + %g6],	%g3
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%o5
	set	0x39, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%o6
	and	%o0,	%l0,	%i4
	nop
	set	0x30, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x6C, %o1
	sta	%f22,	[%l7 + %o1] 0x80
	set	0x28, %l2
	stwa	%o4,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x78, %g1
	lda	[%l7 + %g1] 0x88,	%f30
	and	%l5,	%l3,	%i5
	add	%g6,	%o3,	%i1
	nop
	set	0x7C, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x28, %l6
	ldsw	[%l7 + %l6],	%i7
	nop
	set	0x54, %o2
	sth	%i3,	[%l7 + %o2]
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x80,	%i2
	nop
	set	0x68, %i2
	ldub	[%l7 + %i2],	%g2
	nop
	set	0x61, %i6
	stb	%l1,	[%l7 + %i6]
	st	%f21,	[%l7 + 0x30]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%l4
	or	%i0,	%i6,	%g4
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%g1
	nop
	set	0x78, %g7
	stb	%l6,	[%l7 + %g7]
	bleu,a,pn	%icc,	loop_52
	and	%o1,	%g5,	%g7
	st	%f27,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x74]
loop_52:
	and	%g3,	%o5,	%o2
	or	%o6,	%o0,	%l0
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%l2
	set	0x38, %g5
	stda	%i4,	[%l7 + %g5] 0x81
	nop
	set	0x30, %l0
	ldsw	[%l7 + %l0],	%o4
	set	0x18, %i3
	stha	%l3,	[%l7 + %i3] 0x80
	nop
	set	0x40, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x80,	%i5
	nop
	set	0x20, %g3
	std	%l4,	[%l7 + %g3]
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x48, %l1
	std	%f16,	[%l7 + %l1]
	nop
	set	0x44, %o6
	prefetch	[%l7 + %o6],	 4
	set	0x73, %i0
	stba	%o3,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x60, %l3
	sta	%f30,	[%l7 + %l3] 0x81
	set	0x20, %g2
	ldxa	[%l7 + %g2] 0x88,	%i1
	nop
	set	0x08, %o7
	std	%g6,	[%l7 + %o7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%i3
	nop
	set	0x64, %i1
	sth	%g2,	[%l7 + %i1]
	nop
	set	0x30, %o5
	lduw	[%l7 + %o5],	%i2
	nop
	nop
	setx	0x9238857C677AAE40,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xAB0414D43CB33AAD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f18
	set	0x48, %o0
	sta	%f12,	[%l7 + %o0] 0x81
	fpsub32s	%f8,	%f15,	%f24
	set	0x18, %i7
	stha	%o7,	[%l7 + %i7] 0x89
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%i0
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g1
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%l6
	wr	%o1,	%g5,	%ccr
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x14, %i4
	sth	%l4,	[%l7 + %i4]
	nop
	set	0x68, %l6
	std	%f26,	[%l7 + %l6]
	set	0x2C, %o2
	sta	%f19,	[%l7 + %o2] 0x80
	nop
	set	0x08, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f10
	nop
	set	0x1C, %l2
	ldsh	[%l7 + %l2],	%o5
	set	0x68, %g4
	stba	%g3,	[%l7 + %g4] 0x88
	add	%o2,	%o0,	%l0
	or	%l2,	%i4,	%o6
	nop
	set	0x70, %g7
	stx	%o4,	[%l7 + %g7]
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%l3
	add	%l5,	%i5,	%o3
	set	0x14, %l4
	lda	[%l7 + %l4] 0x89,	%f28
	set	0x0A, %g5
	stha	%g6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x15, %l0
	ldub	[%l7 + %l0],	%i1
	nop
	set	0x1C, %o3
	stw	%i3,	[%l7 + %o3]
	add	%i7,	%i2,	%g2
	bn	%icc,	loop_53
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%o7
	set	0x78, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0
loop_53:
	nop
	set	0x16, %g3
	lduh	[%l7 + %g3],	%i6
	set	0x28, %o4
	stxa	%g4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x3F, %l1
	stba	%g1,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x50, %i0
	ldsb	[%l7 + %i0],	%l1
	set	0x20, %o6
	lda	[%l7 + %o6] 0x81,	%f14
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%l6
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x89,	%o0
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%g7
	set	0x48, %o5
	stxa	%l4,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%o4
	nop
	set	0x1E, %i7
	stb	%g5,	[%l7 + %i7]
	set	0x08, %o1
	stba	%o2,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f30
	nop
	set	0x28, %g1
	stw	%o0,	[%l7 + %g1]
	set	0x78, %i1
	stwa	%g3,	[%l7 + %i1] 0xe3
	membar	#Sync
	ba,a,pn	%xcc,	loop_54
	nop
	set	0x34, %i4
	lduw	[%l7 + %i4],	%l2
	nop
	set	0x48, %o2
	lduh	[%l7 + %o2],	%i4
	set	0x78, %l5
	stxa	%o6,	[%l7 + %l5] 0x81
loop_54:
	nop
	set	0x68, %l6
	ldsw	[%l7 + %l6],	%l0
	nop
	set	0x74, %i2
	ldstub	[%l7 + %i2],	%l3
	or	%l5,	%o4,	%o3
	nop
	set	0x75, %g4
	ldsb	[%l7 + %g4],	%i5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd2
	nop
	set	0x60, %i6
	lduw	[%l7 + %i6],	%g6
	set	0x7C, %l4
	swapa	[%l7 + %l4] 0x89,	%i3
	nop
	set	0x74, %l2
	prefetch	[%l7 + %l2],	 3
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x80,	%i7
	nop
	set	0x2C, %o3
	lduw	[%l7 + %o3],	%i1
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%f6
	ld	[%l7 + 0x5C],	%f22
	set	0x58, %i3
	stxa	%i2,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x19, %l0
	ldsb	[%l7 + %l0],	%g2
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%o7
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x30, %o6
	stxa	%i0,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f14
	ba	%xcc,	loop_55
	nop
	set	0x5E, %g2
	lduh	[%l7 + %g2],	%i6
	set	0x18, %o7
	stda	%g0,	[%l7 + %o7] 0xea
	membar	#Sync
loop_55:
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%l1
	set	0x60, %o5
	stwa	%o1,	[%l7 + %o5] 0x81
	nop
	set	0x22, %i7
	sth	%l6,	[%l7 + %i7]
	ble	%xcc,	loop_56
	nop
	set	0x7C, %o1
	stw	%g7,	[%l7 + %o1]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%g5
loop_56:
	nop
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	set	0x5D, %o0
	stba	%l4,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x88,	 2
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x80,	 2
	nop
	set	0x50, %o2
	prefetch	[%l7 + %o2],	 0
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	set	0x46, %l6
	stba	%l2,	[%l7 + %l6] 0x89
	set	0x31, %l5
	stba	%o6,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%l0
	set	0x60, %i2
	sta	%f0,	[%l7 + %i2] 0x80
	nop
	set	0x08, %g7
	stx	%l5,	[%l7 + %g7]
	nop
	set	0x71, %i6
	stb	%o4,	[%l7 + %i6]
	nop
	nop
	setx	0x8C08D985A6A8F8FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x16958AF760040195,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f16,	%f8
	st	%fsr,	[%l7 + 0x3C]
	set	0x30, %l4
	stda	%o2,	[%l7 + %l4] 0x81
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x88,	%l3
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x80,	 2
	fpadd32s	%f23,	%f18,	%f21
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f0
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	nop
	set	0x1F, %i3
	ldstub	[%l7 + %i3],	%g6
	or	%i7,	%i2,	%i1
	wr	%g2,	%o7,	%y
	set	0x10, %g5
	stwa	%i6,	[%l7 + %g5] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf1,	%f0
	st	%f21,	[%l7 + 0x08]
	st	%f15,	[%l7 + 0x74]
	set	0x50, %o4
	stxa	%g1,	[%l7 + %o4] 0x80
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x80,	%i0
	set	0x58, %l0
	sta	%f16,	[%l7 + %l0] 0x80
	nop
	set	0x5E, %l1
	sth	%g4,	[%l7 + %l1]
	set	0x50, %o6
	stxa	%o1,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x50, %g2
	stda	%i6,	[%l7 + %g2] 0x80
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%l1
	nop
	set	0x18, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x60, %i7
	stda	%g6,	[%l7 + %i7] 0x89
	nop
	set	0x34, %o1
	swap	[%l7 + %o1],	%g5
	nop
	set	0x10, %g6
	sth	%l4,	[%l7 + %g6]
	set	0x50, %o0
	swapa	[%l7 + %o0] 0x89,	%o0
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%o5
	or	%g3,	%l2,	%o2
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%f30
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x89,	%i4
	nop
	set	0x64, %i4
	stb	%o6,	[%l7 + %i4]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
	set	0x28, %l5
	stxa	%l5,	[%l7 + %l5] 0xea
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o3
	nop
	set	0x7F, %l6
	stb	%l3,	[%l7 + %l6]
	fpsub16s	%f5,	%f27,	%f2
	nop
	set	0x44, %g7
	ldsb	[%l7 + %g7],	%o4
	bne	%icc,	loop_57
	nop
	set	0x44, %i6
	sth	%i3,	[%l7 + %i6]
	set	0x38, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i5
loop_57:
	nop
	set	0x41, %g4
	ldsb	[%l7 + %g4],	%g6
	set	0x7C, %l4
	stwa	%i7,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f4
	set	0x4A, %l2
	stba	%i2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x5D, %i3
	stb	%g2,	[%l7 + %i3]
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f28
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f26
	nop
	set	0x64, %o4
	ldstub	[%l7 + %o4],	%i1
	set	0x2C, %i0
	stba	%o7,	[%l7 + %i0] 0x88
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%i0
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	add	%g4,	%l6,	%o1
	st	%f8,	[%l7 + 0x58]
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f6
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f8
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4DF, 	%tick_cmpr
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%g7
	and	%l4,	%o5,	%g3
	set	0x60, %i7
	stda	%l2,	[%l7 + %i7] 0xe3
	membar	#Sync
	bge	%xcc,	loop_58
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o0
	nop
	set	0x42, %o7
	ldstub	[%l7 + %o7],	%o2
	nop
	set	0x74, %o0
	sth	%o6,	[%l7 + %o0]
loop_58:
	nop
	set	0x08, %o5
	stx	%i4,	[%l7 + %o5]
	nop
	set	0x60, %i1
	ldsw	[%l7 + %i1],	%l5
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f6
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%l0
	nop
	set	0x40, %g1
	std	%o2,	[%l7 + %g1]
	nop
	set	0x20, %o2
	ldsw	[%l7 + %o2],	%o4
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f6
	set	0x78, %l6
	ldxa	[%l7 + %l6] 0x89,	%l3
	ble,pn	%icc,	loop_59
	nop
	set	0x28, %i6
	ldub	[%l7 + %i6],	%i5
	add	%g6,	%i7,	%i2
	set	0x4B, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g2
loop_59:
	nop
	set	0x16, %g4
	stha	%i1,	[%l7 + %g4] 0xe3
	membar	#Sync
	or	%o7,	%i3,	%i0
	nop
	set	0x20, %g7
	stw	%i6,	[%l7 + %g7]
	and	%g1,	%l6,	%g4
	nop
	set	0x60, %o3
	stw	%l1,	[%l7 + %o3]
	nop
	set	0x2B, %l4
	stb	%o1,	[%l7 + %l4]
	nop
	set	0x11, %l2
	ldstub	[%l7 + %l2],	%g5
	nop
	set	0x2C, %i3
	prefetch	[%l7 + %i3],	 4
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x80,	%o4
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f24
	ld	[%l7 + 0x78],	%f2
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x88,	%l2
	nop
	set	0x2E, %l0
	ldsb	[%l7 + %l0],	%o0
	nop
	set	0x59, %l1
	ldsb	[%l7 + %l1],	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%o2
	set	0x72, %o6
	stha	%i4,	[%l7 + %o6] 0xea
	membar	#Sync
	ld	[%l7 + 0x64],	%f4
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x89,	%l5
	set	0x39, %g2
	stba	%l0,	[%l7 + %g2] 0xe2
	membar	#Sync
	and	%o4,	%l3,	%o3
	st	%f4,	[%l7 + 0x54]
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f8
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%i5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f16
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%g6
	nop
	set	0x60, %i1
	std	%f12,	[%l7 + %i1]
	nop
	set	0x08, %g6
	ldstub	[%l7 + %g6],	%i2
	nop
	set	0x76, %i4
	ldsh	[%l7 + %i4],	%i7
	nop
	set	0x40, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x42, %o2
	stha	%g2,	[%l7 + %o2] 0xea
	membar	#Sync
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%i3
	nop
	set	0x1B, %l6
	ldstub	[%l7 + %l6],	%i6
	nop
	set	0x1F, %l5
	ldsb	[%l7 + %l5],	%g1
	nop
	set	0x6E, %i2
	lduh	[%l7 + %i2],	%i0
	ba,a	%xcc,	loop_60
	nop
	set	0x10, %i6
	stw	%g4,	[%l7 + %i6]
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%l6
	set	0x34, %o3
	stwa	%o1,	[%l7 + %o3] 0x81
loop_60:
	fpsub16	%f24,	%f28,	%f20
	nop
	set	0x30, %g4
	std	%f0,	[%l7 + %g4]
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f6
	nop
	set	0x48, %i3
	sth	%g5,	[%l7 + %i3]
	set	0x4F, %i5
	ldstuba	[%l7 + %i5] 0x80,	%l1
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%g6
	nop
	set	0x0F, %l4
	ldstub	[%l7 + %l4],	%o5
	nop
	set	0x78, %g3
	stx	%g3,	[%l7 + %g3]
	set	0x48, %i0
	sta	%f5,	[%l7 + %i0] 0x89
	nop
	set	0x10, %g5
	lduw	[%l7 + %g5],	%o0
	set	0x70, %l1
	stda	%l4,	[%l7 + %l1] 0x88
	nop
	set	0x4C, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x18, %l3
	stx	%o6,	[%l7 + %l3]
	wr	%l2,	%i4,	%sys_tick
	nop
	set	0x26, %g2
	sth	%o2,	[%l7 + %g2]
	set	0x50, %l0
	ldda	[%l7 + %l0] 0xe3,	%l4
	set	0x08, %i7
	stwa	%l0,	[%l7 + %i7] 0xeb
	membar	#Sync
	or	%l3,	%o3,	%o4
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%i5
	set	0x54, %o1
	stwa	%g6,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x34, %o7
	lduh	[%l7 + %o7],	%i7
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x88,	 3
	nop
	set	0x58, %o5
	stx	%i1,	[%l7 + %o5]
	add	%o7,	%i2,	%i6
	nop
	set	0x0C, %o2
	ldsb	[%l7 + %o2],	%g1
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%i0
	nop
	set	0x7C, %l6
	sth	%i3,	[%l7 + %l6]
	and	%g4,	%o1,	%g5
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f26
	ld	[%l7 + 0x3C],	%f31
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g7
	or	%o5,	%g3,	%l4
	nop
	set	0x2E, %i2
	ldsb	[%l7 + %i2],	%o0
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f26
	nop
	set	0x68, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x30, %g4
	lda	[%l7 + %g4] 0x80,	%f16
	nop
	set	0x54, %o3
	ldsw	[%l7 + %o3],	%l2
	nop
	set	0x60, %l2
	std	%i4,	[%l7 + %l2]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%o6
	set	0x10, %i5
	stxa	%l5,	[%l7 + %i5] 0x80
	nop
	set	0x38, %i3
	stw	%l0,	[%l7 + %i3]
	nop
	set	0x30, %l4
	std	%f28,	[%l7 + %l4]
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f0
	wr	%o4,	%l3,	%softint
	or	%i5,	%i7,	%g2
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x88,	%i0
	nop
	set	0x44, %g5
	sth	%o7,	[%l7 + %g5]
	or	%i2,	%i6,	%g1
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x88,	%i0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%i3
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%g4
	set	0x70, %l3
	lda	[%l7 + %l3] 0x81,	%f23
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	add	%g5,	%l6,	%g7
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0
	fpadd16	%f30,	%f12,	%f14
	set	0x48, %o0
	stda	%g2,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x36, %o1
	stha	%l4,	[%l7 + %o1] 0xeb
	membar	#Sync
	or	%l1,	%o0,	%i4
	set	0x56, %i7
	stha	%l2,	[%l7 + %i7] 0x81
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	wr	%o6,	%l5,	%sys_tick
	nop
	set	0x3C, %i1
	ldub	[%l7 + %i1],	%l0
	nop
	set	0x60, %o5
	std	%f8,	[%l7 + %o5]
	nop
	set	0x21, %o2
	stb	%o3,	[%l7 + %o2]
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x89,	%o2
	nop
	set	0x72, %g1
	sth	%l3,	[%l7 + %g1]
	or	%o4,	%i7,	%i5
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%i1
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f16
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc8
	or	%o7,	%g2,	%i6
	set	0x44, %g7
	sta	%f8,	[%l7 + %g7] 0x81
	nop
	set	0x68, %i6
	stx	%g1,	[%l7 + %i6]
	set	0x78, %g4
	stda	%i2,	[%l7 + %g4] 0x80
	and	%g6,	%i0,	%g4
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x60, %i5
	stx	%o1,	[%l7 + %i5]
	nop
	set	0x40, %i3
	std	%g4,	[%l7 + %i3]
	and	%g7,	%l6,	%g3
	ble,a,pn	%icc,	loop_61
	nop
	set	0x7B, %l2
	ldsb	[%l7 + %l2],	%o5
	set	0x40, %l4
	stxa	%l1,	[%l7 + %l4] 0x89
loop_61:
	nop
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd2
	nop
	set	0x60, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%l4
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%i4
	st	%f10,	[%l7 + 0x3C]
	set	0x68, %o6
	stda	%o0,	[%l7 + %o6] 0x89
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xe2,	%l2
	set	0x56, %l1
	stha	%l5,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x5D, %g2
	stba	%o6,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x72, %l0
	sth	%o3,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f16
	nop
	set	0x60, %i7
	std	%f8,	[%l7 + %i7]
	nop
	set	0x2C, %o7
	stw	%l0,	[%l7 + %o7]
	ld	[%l7 + 0x38],	%f16
	nop
	set	0x44, %o0
	swap	[%l7 + %o0],	%l3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x81
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	nop
	set	0x6C, %g6
	ldub	[%l7 + %g6],	%o4
	or	%i7,	%i1,	%i5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc8
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x80,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i6
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x69, %o2
	ldstub	[%l7 + %o2],	%i2
	nop
	set	0x38, %g7
	stx	%g6,	[%l7 + %g7]
	nop
	set	0x68, %i6
	prefetch	[%l7 + %i6],	 4
	nop
	set	0x72, %g4
	ldstub	[%l7 + %g4],	%i0
	nop
	set	0x60, %o3
	stb	%g1,	[%l7 + %o3]
	and	%g4,	%i3,	%o1
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%g5
	nop
	set	0x73, %i5
	ldstub	[%l7 + %i5],	%g7
	nop
	set	0x18, %i3
	stx	%l6,	[%l7 + %i3]
	nop
	set	0x1E, %l2
	ldub	[%l7 + %l2],	%o5
	nop
	set	0x58, %l4
	std	%f4,	[%l7 + %l4]
	nop
	set	0x7E, %g3
	ldub	[%l7 + %g3],	%l1
	nop
	set	0x38, %o4
	stx	%g3,	[%l7 + %o4]
	set	0x21, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l4
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f24
	ld	[%l7 + 0x34],	%f29
	add	%i4,	%l2,	%l5
	nop
	set	0x49, %g5
	ldub	[%l7 + %g5],	%o0
	nop
	set	0x38, %l3
	std	%f20,	[%l7 + %l3]
	add	%o3,	%o6,	%l3
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x70, %l1
	stda	%l0,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x33, %l0
	ldub	[%l7 + %l0],	%i7
	set	0x64, %o1
	sta	%f24,	[%l7 + %o1] 0x89
	set	0x20, %i7
	stda	%i0,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x74, %o7
	swapa	[%l7 + %o7] 0x80,	%o4
	and	%g2,	%i5,	%o7
	nop
	set	0x68, %o0
	std	%i2,	[%l7 + %o0]
	set	0x50, %g2
	stda	%g6,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x50, %o5
	stda	%i0,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x30, %i1
	swap	[%l7 + %i1],	%g1
	nop
	set	0x70, %g6
	std	%i6,	[%l7 + %g6]
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%g4
	ld	[%l7 + 0x40],	%f4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x81,	%o0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	nop
	set	0x20, %l6
	ldsh	[%l7 + %l6],	%g7
	nop
	set	0x74, %i6
	ldstub	[%l7 + %i6],	%l6
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%o5
	nop
	set	0x50, %g7
	ldsb	[%l7 + %g7],	%g3
	nop
	set	0x0C, %i2
	stw	%l1,	[%l7 + %i2]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x89
	set	0x3A, %o3
	stba	%l4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x78, %i3
	stw	%i4,	[%l7 + %i3]
	set	0x5B, %l2
	stba	%l2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x3E, %l4
	ldsb	[%l7 + %l4],	%o0
	nop
	set	0x08, %g3
	ldsw	[%l7 + %g3],	%l5
	add	%o3,	%o6,	%o2
	nop
	set	0x6A, %o4
	sth	%l3,	[%l7 + %o4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f16
	set	0x68, %g5
	stxa	%l0,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x72, %i4
	ldub	[%l7 + %i4],	%i1
	nop
	set	0x28, %o6
	std	%o4,	[%l7 + %o6]
	or	%i7,	%i5,	%o7
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%g2
	nop
	set	0x54, %l0
	sth	%g6,	[%l7 + %l0]
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%i2
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%g1
	set	0x68, %i7
	lda	[%l7 + %i7] 0x88,	%f31
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x80,	%i0
	nop
	set	0x0B, %g2
	stb	%g4,	[%l7 + %g2]
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%i6
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%i3
	nop
	set	0x3C, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x88,	%g5
	nop
	set	0x14, %i1
	stw	%g7,	[%l7 + %i1]
	set	0x10, %o2
	stwa	%o1,	[%l7 + %o2] 0xea
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l6
	set	0x7D, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g3
	set	0x08, %i6
	ldstuba	[%l7 + %i6] 0x88,	%l1
	nop
	set	0x73, %g4
	ldub	[%l7 + %g4],	%i4
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x81,	%l2
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	nop
	set	0x78, %i5
	swap	[%l7 + %i5],	%o0
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x80,	 1
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	and	%o3,	%l4,	%o6
	set	0x4B, %l2
	stba	%l3,	[%l7 + %l2] 0x88
	set	0x70, %i2
	stxa	%o2,	[%l7 + %i2] 0x89
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x89,	%i0
	nop
	set	0x3C, %l4
	sth	%o4,	[%l7 + %l4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%i5
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o7
	nop
	set	0x11, %g5
	ldub	[%l7 + %g5],	%i7
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%g6
	bne	%icc,	loop_62
	or	%i2,	%g2,	%i0
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x89,	 4
loop_62:
	nop
	set	0x14, %l3
	stw	%g4,	[%l7 + %l3]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%i2
	nop
	set	0x24, %i4
	stw	%g5,	[%l7 + %i4]
	set	0x10, %l1
	stda	%g6,	[%l7 + %l1] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f0
	fpsub16s	%f21,	%f9,	%f28
	nop
	set	0x40, %i7
	stx	%o1,	[%l7 + %i7]
	nop
	set	0x60, %g2
	std	%i6,	[%l7 + %g2]
	set	0x20, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o5
	and	%g3,	%l6,	%l1
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%i4
	add	%l2,	%l5,	%o0
	set	0x74, %g6
	swapa	[%l7 + %g6] 0x89,	%l4
	set	0x50, %o5
	stxa	%o6,	[%l7 + %o5] 0x81
	nop
	set	0x48, %i1
	ldsh	[%l7 + %i1],	%o3
	nop
	set	0x3C, %l5
	lduh	[%l7 + %l5],	%l3
	nop
	set	0x6C, %l6
	stw	%o2,	[%l7 + %l6]
	nop
	set	0x5F, %i6
	ldsb	[%l7 + %i6],	%i1
	nop
	set	0x50, %g4
	std	%l0,	[%l7 + %g4]
	nop
	set	0x5A, %g1
	lduh	[%l7 + %g1],	%i5
	nop
	set	0x0E, %o2
	ldub	[%l7 + %o2],	%o4
	nop
	set	0x50, %g7
	stx	%o7,	[%l7 + %g7]
	set	0x10, %o3
	stha	%i7,	[%l7 + %o3] 0x89
	set	0x0A, %i5
	stha	%g6,	[%l7 + %i5] 0x80
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x89,	%g2
	set	0x71, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i2
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xeb,	%g0
	nop
	set	0x70, %l4
	stx	%g4,	[%l7 + %l4]
	nop
	set	0x2C, %i2
	swap	[%l7 + %i2],	%i0
	fpadd32	%f12,	%f28,	%f18
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%i3
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%g7
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x89,	 4
	set	0x60, %l3
	stxa	%i6,	[%l7 + %l3] 0x81
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x81,	%o1
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0
	nop
	set	0x56, %o6
	ldsb	[%l7 + %o6],	%l6
	set	0x28, %o1
	stda	%o4,	[%l7 + %o1] 0x89
	nop
	set	0x48, %i7
	stb	%l1,	[%l7 + %i7]
	nop
	set	0x6C, %g2
	stw	%i4,	[%l7 + %g2]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc0
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x89,	%l5
	nop
	set	0x5C, %o7
	lduw	[%l7 + %o7],	%l2
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%l4
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	set	0x20, %l5
	stxa	%o0,	[%l7 + %l5] 0x80
	bgu,pn	%xcc,	loop_63
	nop
	set	0x54, %l6
	lduh	[%l7 + %l6],	%o6
	nop
	set	0x38, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x74, %g4
	lduw	[%l7 + %g4],	%l3
loop_63:
	nop
	set	0x5D, %g1
	ldsb	[%l7 + %g1],	%o3
	and	%o2,	%i1,	%i5
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%o4
	nop
	set	0x0C, %g7
	prefetch	[%l7 + %g7],	 2
	st	%f21,	[%l7 + 0x50]
	set	, %o5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1270
!	Type a   	: 27
!	Type cti   	: 33
!	Type x   	: 502
!	Type f   	: 43
!	Type i   	: 125
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
	set	0x4,	%g2
	set	0x3,	%g3
	set	0x8,	%g4
	set	0xF,	%g5
	set	0x1,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x5,	%i1
	set	-0x3,	%i2
	set	-0x1,	%i3
	set	-0x3,	%i4
	set	-0x6,	%i5
	set	-0x8,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x64ED0AA2,	%l0
	set	0x38D3453C,	%l1
	set	0x4C6BFD04,	%l2
	set	0x45529CCB,	%l3
	set	0x19315D86,	%l4
	set	0x7E6411E1,	%l5
	set	0x1EF4F432,	%l6
	!# Output registers
	set	0x0275,	%o0
	set	0x0020,	%o1
	set	-0x1DFB,	%o2
	set	0x02BC,	%o3
	set	-0x0F3D,	%o4
	set	-0x185C,	%o5
	set	-0x0933,	%o6
	set	0x134B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	nop
	set	0x40, %o3
	std	%l0,	[%l7 + %o3]
	nop
	set	0x1E, %i5
	lduh	[%l7 + %i5],	%i7
	st	%f8,	[%l7 + 0x38]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%o7
	nop
	set	0x26, %i3
	ldsh	[%l7 + %i3],	%g2
	wr	%i2,	%g1,	%softint
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%i0
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f16
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f0
	nop
	set	0x28, %i2
	stx	%i3,	[%l7 + %i2]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xda
	nop
	set	0x5A, %g5
	lduh	[%l7 + %g5],	%g4
	nop
	set	0x70, %l3
	swap	[%l7 + %l3],	%g7
	nop
	set	0x2C, %o4
	ldstub	[%l7 + %o4],	%i6
	fpadd32	%f8,	%f20,	%f20
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%o1
	set	0x20, %l0
	stwa	%l6,	[%l7 + %l0] 0x89
	set	0x0C, %i4
	swapa	[%l7 + %i4] 0x89,	%o5
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x81,	%g3
	nop
	set	0x75, %o6
	ldsb	[%l7 + %o6],	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i4
	set	0x7A, %g2
	stha	%l4,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x77, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o0
	nop
	set	0x44, %g6
	lduw	[%l7 + %g6],	%l2
	nop
	set	0x78, %i1
	stx	%o6,	[%l7 + %i1]
	set	0x09, %o7
	stba	%o3,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x1C, %l5
	ldub	[%l7 + %l5],	%l3
	nop
	set	0x68, %l6
	std	%o2,	[%l7 + %l6]
	set	0x54, %i6
	swapa	[%l7 + %i6] 0x81,	%i1
	nop
	set	0x08, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x38, %g1
	lda	[%l7 + %g1] 0x80,	%f29
	nop
	set	0x0E, %g7
	ldsh	[%l7 + %g7],	%o4
	nop
	set	0x40, %o5
	std	%f12,	[%l7 + %o5]
	fpsub32s	%f21,	%f14,	%f25
	nop
	set	0x4C, %o3
	stw	%i5,	[%l7 + %o3]
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	be,a	%xcc,	loop_64
	add	%i7,	%g6,	%l0
	and	%g2,	%o7,	%i2
	or	%i0,	%g1,	%g4
loop_64:
	nop
	set	0x48, %i5
	swap	[%l7 + %i5],	%g7
	ld	[%l7 + 0x5C],	%f7
	fpadd16s	%f15,	%f23,	%f20
	ld	[%l7 + 0x74],	%f30
	nop
	set	0x79, %i3
	ldsb	[%l7 + %i3],	%i6
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x89,	%i3
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%o1
	set	0x1A, %i2
	stha	%l6,	[%l7 + %i2] 0x80
	or	%g5,	%g3,	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0FB, 	%sys_tick_cmpr
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x81,	%l2
	wr	%o6,	%o3,	%softint
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%l4
	nop
	set	0x79, %g5
	ldsb	[%l7 + %g5],	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%i1
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	nop
	set	0x44, %l3
	swap	[%l7 + %l3],	%o4
	fpsub16	%f24,	%f12,	%f22
	nop
	set	0x5C, %l0
	stw	%i7,	[%l7 + %l0]
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x0C, %i4
	sta	%f0,	[%l7 + %i4] 0x89
	set	0x72, %g2
	stha	%i5,	[%l7 + %g2] 0x88
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xea,	%g6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc2
	nop
	set	0x30, %l1
	stw	%l0,	[%l7 + %l1]
	nop
	set	0x3F, %o0
	ldub	[%l7 + %o0],	%o7
	nop
	set	0x70, %g6
	ldstub	[%l7 + %g6],	%g2
	nop
	set	0x58, %i1
	ldub	[%l7 + %i1],	%i2
	nop
	set	0x62, %o7
	lduh	[%l7 + %o7],	%g1
	nop
	set	0x26, %l6
	ldsb	[%l7 + %l6],	%g4
	set	0x22, %l5
	stha	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x44, %i6
	stw	%i6,	[%l7 + %i6]
	add	%g7,	%o1,	%i3
	set	0x60, %g4
	stxa	%g5,	[%l7 + %g4] 0x80
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0
	nop
	set	0x08, %g7
	ldsw	[%l7 + %g7],	%l6
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x59, %o5
	stb	%o5,	[%l7 + %o5]
	st	%f30,	[%l7 + 0x4C]
	nop
	set	0x71, %o2
	ldub	[%l7 + %o2],	%l1
	st	%f15,	[%l7 + 0x60]
	nop
	set	0x64, %o3
	lduw	[%l7 + %o3],	%i4
	set	0x56, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o0
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%l5
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x4D, %i3
	stb	%l2,	[%l7 + %i3]
	nop
	set	0x48, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x24, %l4
	stw	%o3,	[%l7 + %l4]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	nop
	set	0x5E, %i0
	sth	%o6,	[%l7 + %i0]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd0,	%f16
	nop
	set	0x40, %l3
	ldstub	[%l7 + %l3],	%o2
	nop
	set	0x08, %l0
	ldsw	[%l7 + %l0],	%l4
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%i1
	nop
	set	0x0C, %o4
	ldsw	[%l7 + %o4],	%o4
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x80
	set	0x64, %o6
	stwa	%i7,	[%l7 + %o6] 0x81
	nop
	set	0x28, %l1
	std	%i4,	[%l7 + %l1]
	set	0x2C, %g6
	swapa	[%l7 + %g6] 0x80,	%l3
	nop
	set	0x3A, %i1
	ldstub	[%l7 + %i1],	%g6
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x88,	%o7
	nop
	set	0x7C, %l6
	sth	%l0,	[%l7 + %l6]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%g1
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f16
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f4
	nop
	set	0x10, %g4
	std	%f12,	[%l7 + %g4]
	set	0x5C, %o7
	stba	%i2,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x29, %g1
	stba	%g4,	[%l7 + %g1] 0x88
	or	%i0,	%g7,	%i6
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i3
	nop
	set	0x20, %o2
	std	%o0,	[%l7 + %o2]
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%g3
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%l6
	set	0x30, %l2
	lda	[%l7 + %l2] 0x81,	%f18
	add	%o5,	%l1,	%g5
	set	0x7C, %i5
	swapa	[%l7 + %i5] 0x88,	%o0
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%i4
	set	0x58, %g3
	stxa	%l5,	[%l7 + %g3] 0x88
	set	0x30, %l4
	stda	%o2,	[%l7 + %l4] 0x88
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0
	set	0x10, %g5
	stxa	%o6,	[%l7 + %g5] 0x80
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%l4
	set	0x7C, %o1
	stha	%o2,	[%l7 + %o1] 0x80
	and	%i1,	%i7,	%o4
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x80,	%l3
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x5C, %o4
	sth	%g6,	[%l7 + %o4]
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x81,	%i4
	set	0x44, %i4
	lda	[%l7 + %i4] 0x88,	%f22
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%o7
	or	%g1,	%g2,	%g4
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd8
	set	0x64, %l1
	stwa	%i0,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x70, %g6
	stx	%g7,	[%l7 + %g6]
	nop
	nop
	setx	0xB6537A7354C1ECE3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xCD0E9D6DCECC9DBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f18,	%f8
	set	0x79, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i6
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x80,	%i3
	set	0x48, %o0
	stda	%o0,	[%l7 + %o0] 0xea
	membar	#Sync
	fpsub32s	%f24,	%f11,	%f15
	set	0x44, %l6
	sta	%f13,	[%l7 + %l6] 0x88
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x89,	%i2
	nop
	set	0x48, %g4
	ldsw	[%l7 + %g4],	%l6
	set	0x3C, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o5
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%l1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x855, 	%sys_tick_cmpr
	or	%g3,	%i4,	%o3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	set	0x1C, %o7
	stwa	%l2,	[%l7 + %o7] 0xe2
	membar	#Sync
	st	%f25,	[%l7 + 0x74]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf8
	membar	#Sync
	and	%l5,	%l4,	%o2
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x89,	%i1
	set	0x60, %o3
	stha	%o6,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x68, %l2
	stb	%o4,	[%l7 + %l2]
	add	%l3,	%g6,	%i7
	nop
	set	0x0C, %i3
	stw	%l0,	[%l7 + %i3]
	set	0x4C, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o7
	nop
	set	0x38, %g3
	prefetch	[%l7 + %g3],	 2
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	nop
	set	0x68, %l4
	lduh	[%l7 + %l4],	%i5
	set	0x28, %i0
	stxa	%g2,	[%l7 + %i0] 0x80
	nop
	set	0x64, %l0
	ldub	[%l7 + %l0],	%g1
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f0
	set	0x3C, %l3
	stwa	%g4,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x80,	 3
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	set	0x16, %i4
	stha	%i3,	[%l7 + %i4] 0x80
	nop
	set	0x74, %o4
	sth	%i6,	[%l7 + %o4]
	fpsub16	%f12,	%f6,	%f22
	nop
	set	0x50, %i7
	ldsh	[%l7 + %i7],	%i2
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%o1
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%l6
	set	0x74, %i1
	sta	%f19,	[%l7 + %i1] 0x88
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd2
	nop
	set	0x6C, %o0
	stb	%l1,	[%l7 + %o0]
	set	0x7D, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o5
	nop
	set	0x1C, %i6
	lduw	[%l7 + %i6],	%o0
	set	0x4B, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g3
	nop
	set	0x40, %g1
	stx	%i4,	[%l7 + %g1]
	nop
	set	0x37, %l5
	stb	%g5,	[%l7 + %l5]
	nop
	set	0x18, %g7
	sth	%l2,	[%l7 + %g7]
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x88,	%o3
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x81,	 3
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	nop
	set	0x38, %o7
	stx	%i1,	[%l7 + %o7]
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%o6
	nop
	set	0x7F, %l2
	ldub	[%l7 + %l2],	%o2
	nop
	set	0x48, %g3
	stb	%l3,	[%l7 + %g3]
	nop
	set	0x64, %i2
	stb	%g6,	[%l7 + %i2]
	nop
	set	0x7B, %i5
	ldub	[%l7 + %i5],	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%l0
	set	0x30, %l4
	stxa	%o7,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x10, %l0
	lduw	[%l7 + %l0],	%g2
	nop
	set	0x0E, %i0
	sth	%g1,	[%l7 + %i0]
	fpsub16	%f12,	%f8,	%f22
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%i4
	set	0x74, %o1
	lda	[%l7 + %o1] 0x88,	%f11
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%g7
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xca
	nop
	set	0x7E, %g5
	ldub	[%l7 + %g5],	%i0
	nop
	set	0x68, %i7
	std	%f14,	[%l7 + %i7]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f0
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xe3,	%g4
	nop
	set	0x28, %o6
	std	%i2,	[%l7 + %o6]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%i2
	add	%l6,	%l1,	%o5
	nop
	set	0x67, %l1
	stb	%o1,	[%l7 + %l1]
	set	0x38, %o0
	stda	%o0,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x89,	%i4
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%g5
	nop
	set	0x63, %i6
	ldsb	[%l7 + %i6],	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x89,	%l4
	ld	[%l7 + 0x08],	%f0
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x80,	%i1
	nop
	set	0x48, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x5C, %o2
	lduw	[%l7 + %o2],	%l5
	nop
	set	0x43, %o5
	stb	%o2,	[%l7 + %o5]
	st	%f1,	[%l7 + 0x68]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x80
	nop
	set	0x75, %i3
	ldsb	[%l7 + %i3],	%o6
	nop
	set	0x20, %l2
	std	%l2,	[%l7 + %l2]
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x81,	%f23
	nop
	set	0x50, %i2
	std	%f30,	[%l7 + %i2]
	nop
	set	0x08, %i5
	stx	%o4,	[%l7 + %i5]
	nop
	set	0x19, %g3
	ldub	[%l7 + %g3],	%i7
	ld	[%l7 + 0x3C],	%f15
	nop
	set	0x7E, %l4
	ldsh	[%l7 + %l4],	%l0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf0
	membar	#Sync
	set	0x28, %l3
	stda	%o6,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x10, %o1
	lduh	[%l7 + %o1],	%g2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf9
	membar	#Sync
	st	%f22,	[%l7 + 0x0C]
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x88,	%g0
	set	0x18, %g5
	prefetcha	[%l7 + %g5] 0x80,	 2
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 0
	set	0x4C, %o4
	sta	%f20,	[%l7 + %o4] 0x80
	set	0x40, %i7
	sta	%f1,	[%l7 + %i7] 0x89
	set	0x18, %o6
	stxa	%g7,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x6C, %g6
	stwa	%g6,	[%l7 + %g6] 0x81
	nop
	nop
	setx	0x8C6E350F86AF1668,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x42BB1C5EA132B3DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f2,	%f22
	nop
	set	0x0C, %o0
	stw	%g4,	[%l7 + %o0]
	nop
	set	0x67, %l1
	ldstub	[%l7 + %l1],	%i3
	set	0x69, %l6
	stba	%i0,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x7E, %i1
	ldstub	[%l7 + %i1],	%i2
	nop
	set	0x2C, %g4
	ldsw	[%l7 + %g4],	%l6
	st	%f18,	[%l7 + 0x5C]
	st	%f14,	[%l7 + 0x74]
	nop
	set	0x75, %g1
	ldub	[%l7 + %g1],	%i6
	set	0x40, %g7
	sta	%f16,	[%l7 + %g7] 0x81
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%o4
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	nop
	set	0x7E, %i6
	lduh	[%l7 + %i6],	%l1
	nop
	set	0x17, %o7
	ldsb	[%l7 + %o7],	%o0
	set	0x38, %i3
	lda	[%l7 + %i3] 0x89,	%f12
	nop
	set	0x40, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	nop
	set	0x56, %i2
	ldsh	[%l7 + %i2],	%i4
	wr	%g5,	%g3,	%softint
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%l2
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x24, %g3
	swap	[%l7 + %g3],	%o3
	set	0x64, %l4
	stwa	%l4,	[%l7 + %l4] 0x80
	nop
	set	0x34, %i0
	stw	%i1,	[%l7 + %i0]
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f0
	set	0x38, %l3
	lda	[%l7 + %l3] 0x81,	%f17
	nop
	set	0x48, %o1
	std	%f2,	[%l7 + %o1]
	set	0x24, %i4
	sta	%f14,	[%l7 + %i4] 0x88
	set	0x6E, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o1
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x88,	%l5
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xe3,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%o4
	nop
	set	0x10, %i7
	lduh	[%l7 + %i7],	%l3
	set	0x24, %o6
	sta	%f30,	[%l7 + %o6] 0x88
	nop
	set	0x58, %g6
	stx	%l0,	[%l7 + %g6]
	nop
	set	0x54, %o0
	lduh	[%l7 + %o0],	%i7
	set	0x68, %l1
	stba	%o7,	[%l7 + %l1] 0xe3
	membar	#Sync
	add	%g1,	%g2,	%g7
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%g4
	nop
	set	0x11, %i1
	stb	%g6,	[%l7 + %i1]
	set	0x0A, %g4
	stha	%i3,	[%l7 + %g4] 0x81
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%i2
	set	0x60, %l6
	stda	%i6,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x54, %l5
	swapa	[%l7 + %l5] 0x89,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%l1
	set	0x34, %g7
	stwa	%i0,	[%l7 + %g7] 0x81
	nop
	set	0x28, %i6
	std	%o0,	[%l7 + %i6]
	add	%i4,	%g3,	%g5
	ld	[%l7 + 0x4C],	%f29
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f16
	nop
	set	0x20, %i3
	lduh	[%l7 + %i3],	%l2
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x89,	%o3
	st	%f0,	[%l7 + 0x38]
	nop
	set	0x70, %o3
	stx	%l4,	[%l7 + %o3]
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%i1
	fpsub32	%f20,	%f4,	%f28
	nop
	set	0x70, %i5
	std	%o0,	[%l7 + %i5]
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x80,	%l4
	set	0x60, %i0
	stda	%o2,	[%l7 + %i0] 0x80
	set	0x18, %o5
	swapa	[%l7 + %o5] 0x88,	%o6
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%l3
	set	0x68, %o1
	stwa	%o7,	[%l7 + %o1] 0x81
	set	0x4B, %l3
	stba	%g1,	[%l7 + %l3] 0x80
	and	%i7,	%g2,	%g7
	nop
	set	0x78, %i4
	prefetch	[%l7 + %i4],	 2
	set	0x10, %l0
	stwa	%g4,	[%l7 + %l0] 0x80
	nop
	set	0x54, %g5
	swap	[%l7 + %g5],	%g6
	nop
	set	0x20, %i7
	std	%i4,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%l6
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x28, %o6
	std	%i2,	[%l7 + %o6]
	set	0x5E, %o4
	stha	%i6,	[%l7 + %o4] 0x81
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f0
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%o4
	nop
	set	0x0E, %g2
	sth	%l1,	[%l7 + %g2]
	set	0x73, %g6
	stba	%o0,	[%l7 + %g6] 0x88
	add	%i0,	%g3,	%i4
	nop
	set	0x08, %i1
	prefetch	[%l7 + %i1],	 3
	set	0x30, %g1
	stda	%g4,	[%l7 + %g1] 0x81
	nop
	set	0x7A, %l6
	sth	%l2,	[%l7 + %l6]
	nop
	set	0x48, %g4
	lduw	[%l7 + %g4],	%o3
	nop
	set	0x08, %g7
	stw	%l4,	[%l7 + %g7]
	nop
	set	0x43, %i6
	ldstub	[%l7 + %i6],	%i1
	nop
	set	0x24, %o2
	ldsw	[%l7 + %o2],	%o1
	set	0x28, %o7
	sta	%f14,	[%l7 + %o7] 0x81
	set	0x3C, %i3
	stwa	%l5,	[%l7 + %i3] 0xe3
	membar	#Sync
	or	%o6,	%o2,	%o4
	and	%l3,	%l0,	%g1
	nop
	set	0x20, %l2
	lduw	[%l7 + %l2],	%i7
	nop
	set	0x60, %l5
	std	%f8,	[%l7 + %l5]
	nop
	set	0x47, %o3
	ldstub	[%l7 + %o3],	%o7
	nop
	set	0x20, %i2
	std	%f14,	[%l7 + %i2]
	nop
	set	0x28, %i5
	std	%g6,	[%l7 + %i5]
	set	0x2B, %i0
	stba	%g2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x68, %g3
	std	%g4,	[%l7 + %g3]
	nop
	set	0x64, %o5
	stw	%i5,	[%l7 + %o5]
	ld	[%l7 + 0x10],	%f14
	nop
	set	0x2E, %l4
	lduh	[%l7 + %l4],	%g6
	set	0x18, %l3
	stwa	%l6,	[%l7 + %l3] 0x88
	set	0x50, %o1
	sta	%f0,	[%l7 + %o1] 0x89
	fpsub32	%f0,	%f2,	%f10
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	wr	%i3,	%i2,	%softint
	nop
	set	0x28, %g5
	std	%f16,	[%l7 + %g5]
	nop
	set	0x18, %i7
	lduw	[%l7 + %i7],	%o5
	set	0x08, %o6
	lda	[%l7 + %o6] 0x88,	%f18
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x10, %o4
	std	%i0,	[%l7 + %o4]
	add	%g3,	%o0,	%i4
	nop
	set	0x7B, %i4
	ldub	[%l7 + %i4],	%g5
	set	0x78, %o0
	stwa	%l2,	[%l7 + %o0] 0xea
	membar	#Sync
	and	%l4,	%i1,	%o3
	set	0x24, %g2
	sta	%f27,	[%l7 + %g2] 0x80
	nop
	set	0x65, %g6
	stb	%l5,	[%l7 + %g6]
	set	0x34, %l1
	stha	%o6,	[%l7 + %l1] 0xe2
	membar	#Sync
	add	%o2,	%o1,	%l3
	set	0x20, %g1
	stxa	%o4,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x48, %i1
	stx	%g1,	[%l7 + %i1]
	st	%f5,	[%l7 + 0x44]
	st	%f24,	[%l7 + 0x40]
	st	%f7,	[%l7 + 0x64]
	set	0x1C, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l0
	set	0x50, %g7
	stxa	%o7,	[%l7 + %g7] 0x81
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x89,	%i7
	nop
	set	0x08, %g4
	std	%g6,	[%l7 + %g4]
	or	%g2,	%i5,	%g4
	nop
	set	0x74, %o7
	ldub	[%l7 + %o7],	%g6
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%i3
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%i2
	nop
	set	0x4C, %l5
	lduh	[%l7 + %l5],	%l6
	set	0x13, %o3
	ldstuba	[%l7 + %o3] 0x81,	%i6
	nop
	set	0x24, %i2
	ldsw	[%l7 + %i2],	%l1
	set	0x10, %i5
	swapa	[%l7 + %i5] 0x80,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%o0
	nop
	set	0x11, %l2
	ldstub	[%l7 + %l2],	%i4
	nop
	set	0x76, %g3
	ldsh	[%l7 + %g3],	%g5
	and	%l2,	%l4,	%o5
	set	0x20, %i0
	stda	%i0,	[%l7 + %i0] 0x81
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xca
	bl,a,pn	%xcc,	loop_65
	nop
	set	0x08, %l4
	std	%l4,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x18]
	set	0x44, %o1
	lda	[%l7 + %o1] 0x89,	%f25
loop_65:
	fpsub16s	%f18,	%f11,	%f20
	bleu,pt	%icc,	loop_66
	nop
	set	0x58, %l3
	ldsw	[%l7 + %l3],	%o3
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x32, %i7
	ldsh	[%l7 + %i7],	%o2
loop_66:
	nop
	set	0x40, %g5
	sta	%f30,	[%l7 + %g5] 0x88
	nop
	set	0x68, %o4
	std	%f8,	[%l7 + %o4]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xd0
	nop
	set	0x5E, %o6
	sth	%o1,	[%l7 + %o6]
	or	%l3,	%o4,	%o6
	nop
	set	0x44, %g2
	ldstub	[%l7 + %g2],	%l0
	set	0x38, %o0
	stxa	%o7,	[%l7 + %o0] 0xe2
	membar	#Sync
	st	%f9,	[%l7 + 0x24]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x352, 	%tick_cmpr
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x89,	 3
	set	0x54, %l1
	sta	%f8,	[%l7 + %l1] 0x81
	set	0x70, %i1
	ldda	[%l7 + %i1] 0xe3,	%g6
	nop
	set	0x4C, %g1
	ldsw	[%l7 + %g1],	%i5
	add	%g4,	%g6,	%i2
	set	0x68, %l6
	stxa	%l6,	[%l7 + %l6] 0x89
	or	%i3,	%i6,	%i0
	nop
	set	0x54, %g7
	stw	%l1,	[%l7 + %g7]
	set	0x50, %i6
	stxa	%g3,	[%l7 + %i6] 0x81
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	nop
	set	0x20, %o7
	std	%f26,	[%l7 + %o7]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	set	0x30, %i3
	stda	%g4,	[%l7 + %i3] 0x88
	wr	%i4,	%l2,	%softint
	and	%o5,	%i1,	%l4
	set	0x60, %o3
	sta	%f27,	[%l7 + %o3] 0x88
	nop
	set	0x58, %i2
	prefetch	[%l7 + %i2],	 4
	st	%fsr,	[%l7 + 0x4C]
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x81,	 4
	set	0x4C, %l2
	sta	%f29,	[%l7 + %l2] 0x80
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 2
	fpsub16	%f22,	%f24,	%f30
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f0
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%o2
	or	%o1,	%l3,	%o6
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x57, %o5
	stb	%o4,	[%l7 + %o5]
	set	0x6B, %l3
	stba	%i7,	[%l7 + %l3] 0x80
	set	0x48, %i7
	sta	%f14,	[%l7 + %i7] 0x89
	set	0x7C, %l0
	stha	%g1,	[%l7 + %l0] 0x80
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	nop
	set	0x08, %o4
	stw	%g2,	[%l7 + %o4]
	st	%f25,	[%l7 + 0x78]
	nop
	set	0x08, %i4
	stx	%o7,	[%l7 + %i4]
	nop
	set	0x43, %o6
	ldub	[%l7 + %o6],	%g7
	add	%g4,	%i5,	%g6
	nop
	set	0x64, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x58, %o0
	lduw	[%l7 + %o0],	%i2
	bleu	%icc,	loop_67
	nop
	set	0x51, %g6
	stb	%i3,	[%l7 + %g6]
	set	0x30, %i1
	stxa	%l6,	[%l7 + %i1] 0x89
loop_67:
	nop
	set	0x5C, %g1
	ldsw	[%l7 + %g1],	%i0
	st	%fsr,	[%l7 + 0x2C]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f16
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%i6
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x89,	%g2
	nop
	set	0x58, %i6
	std	%l0,	[%l7 + %i6]
	st	%f0,	[%l7 + 0x24]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%g5
	nop
	set	0x58, %o7
	ldsh	[%l7 + %o7],	%i4
	nop
	set	0x28, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x80
	nop
	set	0x5E, %o3
	ldsh	[%l7 + %o3],	%l2
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x88,	%i1
	set	0x3C, %i3
	lda	[%l7 + %i3] 0x80,	%f0
	or	%o5,	%l4,	%l5
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%o2
	nop
	nop
	setx	0x9EE1FFB6D5F76476,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x01E7140636B976B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f8,	%f2
	set	0x2E, %i5
	stha	%o3,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x11, %g3
	ldstub	[%l7 + %g3],	%o1
	set	0x4C, %i0
	sta	%f15,	[%l7 + %i0] 0x80
	nop
	set	0x52, %l2
	lduh	[%l7 + %l2],	%l3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%o6
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f16
	nop
	set	0x4C, %o5
	ldsh	[%l7 + %o5],	%o4
	nop
	set	0x48, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x18, %i7
	stw	%g1,	[%l7 + %i7]
	nop
	set	0x2C, %l0
	ldstub	[%l7 + %l0],	%g2
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%o6
	nop
	set	0x52, %g5
	lduh	[%l7 + %g5],	%g7
	nop
	set	0x68, %i4
	stx	%g4,	[%l7 + %i4]
	set	0x70, %o4
	stxa	%i7,	[%l7 + %o4] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%i2
	nop
	set	0x18, %o6
	ldstub	[%l7 + %o6],	%i3
	set	0x37, %o0
	stba	%i5,	[%l7 + %o0] 0x88
	bge	%icc,	loop_68
	fpsub32	%f14,	%f6,	%f28
	nop
	set	0x30, %g2
	lduw	[%l7 + %g2],	%l6
	set	0x48, %g6
	stda	%i0,	[%l7 + %g6] 0xea
	membar	#Sync
loop_68:
	nop
	set	0x64, %i1
	swap	[%l7 + %i1],	%i6
	nop
	set	0x28, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%g3
	set	0x5C, %l6
	swapa	[%l7 + %l6] 0x89,	%l1
	nop
	set	0x35, %g7
	ldsb	[%l7 + %g7],	%o0
	nop
	set	0x60, %i6
	std	%i4,	[%l7 + %i6]
	and	%l2,	%g5,	%i1
	nop
	set	0x29, %o7
	ldub	[%l7 + %o7],	%l4
	set	0x64, %g4
	sta	%f0,	[%l7 + %g4] 0x89
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f0
	set	0x1A, %i2
	stha	%l5,	[%l7 + %i2] 0x89
	set	0x5A, %o3
	stba	%o5,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x09, %i3
	stba	%o3,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x10, %l5
	lduw	[%l7 + %l5],	%o1
	or	%l3,	%l0,	%o2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc8
	set	0x74, %g3
	sta	%f2,	[%l7 + %g3] 0x80
	nop
	set	0x5C, %l2
	lduw	[%l7 + %l2],	%o4
	set	0x6E, %l4
	stha	%g1,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x58, %o5
	stx	%g2,	[%l7 + %o5]
	set	0x08, %i0
	stxa	%o7,	[%l7 + %i0] 0xea
	membar	#Sync
	and	%o6,	%g4,	%i7
	nop
	set	0x34, %i7
	stb	%g7,	[%l7 + %i7]
	nop
	set	0x50, %l0
	ldsw	[%l7 + %l0],	%g6
	set	0x7C, %l3
	lda	[%l7 + %l3] 0x89,	%f14
	nop
	set	0x3C, %o1
	ldsw	[%l7 + %o1],	%i2
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f8
	set	0x58, %o4
	stda	%i4,	[%l7 + %o4] 0x80
	or	%i3,	%l6,	%i6
	nop
	set	0x6C, %o6
	ldub	[%l7 + %o6],	%g3
	set	0x10, %o0
	sta	%f17,	[%l7 + %o0] 0x81
	wr	%i0,	%o0,	%sys_tick
	nop
	set	0x38, %g5
	swap	[%l7 + %g5],	%i4
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x89,	%l2
	or	%g5,	%i1,	%l4
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%l5
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x81,	%l1
	fpsub32	%f22,	%f14,	%f10
	nop
	set	0x20, %l1
	stx	%o5,	[%l7 + %l1]
	nop
	set	0x72, %l6
	ldsh	[%l7 + %l6],	%o1
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%o3
	nop
	set	0x2C, %g1
	ldstub	[%l7 + %g1],	%l3
	nop
	set	0x70, %i6
	stx	%o2,	[%l7 + %i6]
	set	0x77, %g4
	stba	%o4,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x65, %o7
	ldub	[%l7 + %o7],	%g1
	set	0x28, %o2
	stda	%g2,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x73, %o3
	ldub	[%l7 + %o3],	%o7
	fpadd16s	%f28,	%f6,	%f21
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%o6
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%l0
	nop
	set	0x2A, %i5
	ldsh	[%l7 + %i5],	%i7
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x80,	%g4
	set	0x68, %l2
	stda	%g6,	[%l7 + %l2] 0x89
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	set	0x12, %l4
	stha	%g6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x3A, %o5
	ldstub	[%l7 + %o5],	%i3
	nop
	set	0x60, %i0
	swap	[%l7 + %i0],	%i5
	nop
	set	0x7C, %l0
	stw	%i6,	[%l7 + %l0]
	nop
	set	0x19, %i7
	stb	%g3,	[%l7 + %i7]
	set	0x68, %o1
	stha	%l6,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x28, %l3
	std	%i0,	[%l7 + %l3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%l2
	nop
	set	0x22, %o4
	lduh	[%l7 + %o4],	%o0
	nop
	set	0x4D, %i4
	ldub	[%l7 + %i4],	%g5
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x88,	 3
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%l4
	nop
	set	0x44, %g2
	ldsw	[%l7 + %g2],	%l1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o5
	bge,a	%icc,	loop_69
	nop
	set	0x38, %g5
	stx	%o1,	[%l7 + %g5]
	nop
	set	0x2E, %i1
	sth	%o3,	[%l7 + %i1]
	nop
	set	0x4A, %l1
	stb	%l3,	[%l7 + %l1]
loop_69:
	ld	[%l7 + 0x68],	%f7
	nop
	set	0x0C, %g6
	ldsb	[%l7 + %g6],	%o2
	nop
	set	0x68, %g7
	std	%f2,	[%l7 + %g7]
	set	0x4A, %g1
	stha	%g1,	[%l7 + %g1] 0x80
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	st	%fsr,	[%l7 + 0x0C]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBE7, 	%tick_cmpr
	set	0x48, %l6
	sta	%f3,	[%l7 + %l6] 0x89
	nop
	set	0x22, %g4
	sth	%o6,	[%l7 + %g4]
	or	%l0,	%o4,	%i7
	and	%g7,	%g4,	%i2
	add	%i3,	%g6,	%i5
	or	%i6,	%g3,	%l6
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x81,	%i0
	nop
	set	0x18, %o2
	ldsw	[%l7 + %o2],	%i4
	and	%o0,	%l2,	%g5
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xe2,	%l4
	nop
	set	0x78, %l5
	std	%f14,	[%l7 + %l5]
	set	0x2B, %i5
	stba	%l1,	[%l7 + %i5] 0x89
	st	%f12,	[%l7 + 0x40]
	ble	%icc,	loop_70
	bl,a	%icc,	loop_71
	or	%l4,	%o5,	%o1
	nop
	set	0x3E, %i3
	ldub	[%l7 + %i3],	%o3
loop_70:
	nop
	set	0x20, %l2
	swapa	[%l7 + %l2] 0x80,	%i1
loop_71:
	nop
	set	0x34, %i2
	stwa	%l3,	[%l7 + %i2] 0x80
	set	0x38, %g3
	stwa	%o2,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%o7
	nop
	set	0x0E, %i0
	lduh	[%l7 + %i0],	%g2
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f14
	nop
	set	0x35, %i7
	ldub	[%l7 + %i7],	%l0
	nop
	set	0x27, %o1
	ldsb	[%l7 + %o1],	%o6
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%g4
	nop
	set	0x54, %o4
	lduh	[%l7 + %o4],	%g7
	add	%i2,	%g6,	%i5
	nop
	set	0x68, %i4
	stx	%i6,	[%l7 + %i4]
	st	%f26,	[%l7 + 0x24]
	be,a,pt	%xcc,	loop_72
	nop
	set	0x68, %o6
	std	%g2,	[%l7 + %o6]
	nop
	set	0x38, %o0
	std	%i6,	[%l7 + %o0]
	nop
	set	0x14, %l4
	ldsb	[%l7 + %l4],	%i3
loop_72:
	nop
	set	0x66, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i0
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xe3,	%o0
	wr	%l2,	%g5,	%set_softint
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%l1
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xda
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe2,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE7A, 	%sys_tick_cmpr
	nop
	set	0x78, %g6
	ldsh	[%l7 + %g6],	%o3
	bn,a,pn	%xcc,	loop_73
	nop
	set	0x5C, %g7
	stb	%l4,	[%l7 + %g7]
	set	0x7C, %i6
	stha	%l3,	[%l7 + %i6] 0xeb
	membar	#Sync
loop_73:
	nop
	set	0x40, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	nop
	set	0x78, %g4
	ldx	[%l7 + %g4],	%o2
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%g0
	nop
	set	0x08, %o7
	std	%o6,	[%l7 + %o7]
	set	0x1F, %o2
	stba	%l0,	[%l7 + %o2] 0x81
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x80,	 4
	nop
	set	0x2C, %i5
	stw	%o6,	[%l7 + %i5]
	nop
	set	0x78, %i3
	stx	%o4,	[%l7 + %i3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%i2
	nop
	set	0x20, %l2
	std	%f2,	[%l7 + %l2]
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f2
	add	%g6,	%i5,	%i6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd0
	set	0x72, %g3
	stha	%l6,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x4E, %o5
	sth	%g3,	[%l7 + %o5]
	nop
	set	0x58, %i0
	std	%i2,	[%l7 + %i0]
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x88,	 1
	set	0x14, %o1
	stha	%o0,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x24, %l3
	lda	[%l7 + %l3] 0x80,	%f3
	nop
	set	0x20, %o4
	stx	%l2,	[%l7 + %o4]
	and	%g5,	%l1,	%l5
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%i4
	set	0x48, %i4
	lda	[%l7 + %i4] 0x88,	%f13
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
	st	%fsr,	[%l7 + 0x30]
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x80,	%o1
	set	0x14, %g5
	sta	%f9,	[%l7 + %g5] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%l4
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%l3
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	nop
	set	0x68, %g2
	ldsh	[%l7 + %g2],	%i1
	nop
	set	0x60, %g6
	swap	[%l7 + %g6],	%g1
	set	0x6C, %i1
	stwa	%o7,	[%l7 + %i1] 0x81
	set	0x2C, %i6
	lda	[%l7 + %i6] 0x88,	%f7
	add	%l0,	%o2,	%o6
	or	%g2,	%i7,	%o4
	nop
	set	0x38, %l6
	std	%f22,	[%l7 + %l6]
	nop
	set	0x2A, %g7
	sth	%g4,	[%l7 + %g7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%g6
	and	%i5,	%g7,	%l6
	st	%f2,	[%l7 + 0x34]
	set	0x60, %g4
	stda	%i6,	[%l7 + %g4] 0x89
	set	0x4F, %g1
	stba	%g3,	[%l7 + %g1] 0x88
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%i2
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%i0
	set	0x31, %o7
	stba	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x66, %i3
	stba	%g5,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x34, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l2
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f6
	set	0x38, %i2
	swapa	[%l7 + %i2] 0x80,	%l1
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%i4
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%o4
	set	0x64, %g3
	lda	[%l7 + %g3] 0x88,	%f17
	and	%l3,	%l4,	%i1
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x81,	%o3
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%g0
	or	%o7,	%o2,	%l0
	nop
	set	0x12, %l3
	sth	%o6,	[%l7 + %l3]
	set	0x78, %o4
	stxa	%i7,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x44, %o1
	lduh	[%l7 + %o1],	%g2
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f8
	set	0x64, %o6
	lda	[%l7 + %o6] 0x88,	%f21
	nop
	set	0x5E, %i7
	ldsh	[%l7 + %i7],	%o4
	set	0x50, %o0
	stda	%i2,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x10, %g5
	stx	%g6,	[%l7 + %g5]
	ba	%xcc,	loop_74
	or	%i5,	%g7,	%g4
	set	0x70, %l1
	lda	[%l7 + %l1] 0x81,	%f20
loop_74:
	nop
	set	0x30, %l4
	stda	%i6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x40, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x70, %g2
	std	%g2,	[%l7 + %g2]
	set	0x18, %i1
	lda	[%l7 + %i1] 0x88,	%f16
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd8,	%f0
	and	%l6,	%i0,	%i3
	nop
	set	0x18, %g7
	std	%g4,	[%l7 + %g7]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%o0
	nop
	set	0x28, %i6
	std	%f14,	[%l7 + %i6]
	nop
	set	0x3C, %g4
	stw	%l5,	[%l7 + %g4]
	nop
	set	0x2C, %o2
	lduh	[%l7 + %o2],	%o1
	bl	%icc,	loop_75
	add	%l1,	%o5,	%i4
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x80,	%l2
loop_75:
	nop
	set	0x2C, %o7
	ldub	[%l7 + %o7],	%l4
	nop
	set	0x0B, %g1
	ldsb	[%l7 + %g1],	%i1
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%o3
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x88,	%o7
	nop
	set	0x1C, %i5
	swap	[%l7 + %i5],	%o2
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%l0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f16
	nop
	set	0x64, %g3
	swap	[%l7 + %g3],	%g1
	wr	%i7,	%o6,	%pic
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x81,	%o4
	set	0x50, %i0
	stwa	%i2,	[%l7 + %i0] 0x88
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0
	nop
	set	0x78, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x18, %o4
	std	%f4,	[%l7 + %o4]
	nop
	set	0x27, %o1
	ldub	[%l7 + %o1],	%g6
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x54, %i4
	swap	[%l7 + %i4],	%g7
	set	0x50, %i7
	stda	%i4,	[%l7 + %i7] 0x89
	nop
	set	0x28, %o6
	stx	%g4,	[%l7 + %o6]
	nop
	set	0x60, %o0
	stw	%i6,	[%l7 + %o0]
	fpadd32	%f30,	%f8,	%f18
	st	%f23,	[%l7 + 0x14]
	and	%l6,	%i0,	%g3
	set	0x3C, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i3
	ld	[%l7 + 0x48],	%f14
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%o0
	set	0x40, %l1
	lda	[%l7 + %l1] 0x80,	%f20
	set	0x68, %l4
	lda	[%l7 + %l4] 0x81,	%f24
	fpadd16	%f12,	%f14,	%f0
	nop
	set	0x3C, %g2
	lduh	[%l7 + %g2],	%l5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xeb,	%l2
	nop
	set	0x24, %l6
	ldsw	[%l7 + %l6],	%o1
	ld	[%l7 + 0x34],	%f24
	nop
	set	0x48, %g7
	ldsb	[%l7 + %g7],	%o5
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%l0
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x6C, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x40, %o2
	stx	%i4,	[%l7 + %o2]
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%l3
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%i1
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%l4
	nop
	set	0x56, %l2
	lduh	[%l7 + %l2],	%o7
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x89,	%f13
	nop
	set	0x62, %o3
	stb	%o2,	[%l7 + %o3]
	set	0x18, %i2
	stxa	%l0,	[%l7 + %i2] 0x89
	nop
	set	0x7C, %g3
	stb	%g1,	[%l7 + %g3]
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x80,	%i7
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	nop
	set	0x44, %i3
	ldsh	[%l7 + %i3],	%o4
	set	0x68, %o4
	stxa	%o6,	[%l7 + %o4] 0x89
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f6
	add	%g2,	%i2,	%g7
	nop
	set	0x58, %o1
	lduh	[%l7 + %o1],	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%i6
	or	%l6,	%i0,	%g4
	and	%i3,	%g5,	%o0
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%l5
	fpsub32	%f14,	%f16,	%f28
	nop
	set	0x5E, %o6
	sth	%g3,	[%l7 + %o6]
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f2
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x4A, %l1
	ldstub	[%l7 + %l1],	%l2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%i4
	and	%l3,	%i1,	%l1
	nop
	set	0x18, %g5
	prefetch	[%l7 + %g5],	 1
	and	%l4,	%o7,	%o2
	nop
	set	0x44, %g2
	ldsw	[%l7 + %g2],	%l0
	nop
	set	0x78, %l6
	std	%i6,	[%l7 + %l6]
	set	0x13, %g6
	stba	%o3,	[%l7 + %g6] 0x80
	set	0x24, %i6
	stwa	%o4,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x08, %g7
	std	%f16,	[%l7 + %g7]
	set	0x0E, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o6
	set	0x43, %o2
	stba	%g2,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x80
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%g1
	fpadd16s	%f6,	%f12,	%f5
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xe3,	%g6
	nop
	set	0x36, %g4
	ldstub	[%l7 + %g4],	%g6
	add	%i5,	%i6,	%i2
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x81,	%l6
	or	%g4,	%i3,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%o0
	nop
	set	0x7C, %i5
	swap	[%l7 + %i5],	%l5
	nop
	set	0x50, %i2
	stx	%g3,	[%l7 + %i2]
	or	%l2,	%o1,	%i4
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%o4
	nop
	set	0x79, %o5
	stb	%l3,	[%l7 + %o5]
	add	%l1,	%l4,	%o7
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x88,	%o2
	st	%f29,	[%l7 + 0x14]
	nop
	set	0x7C, %l0
	swap	[%l7 + %l0],	%i1
	fpadd32s	%f9,	%f27,	%f27
	set	0x40, %i3
	stda	%i6,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x64, %o4
	ldub	[%l7 + %o4],	%o3
	st	%f25,	[%l7 + 0x24]
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%l0
	set	0x34, %i0
	sta	%f13,	[%l7 + %i0] 0x81
	or	%o6,	%o4,	%g1
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x10, %o6
	lduh	[%l7 + %o6],	%i5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xe2,	%i2
	or	%l6,	%i6,	%i3
	set	0x54, %o1
	lda	[%l7 + %o1] 0x81,	%f19
	bl,a,pt	%icc,	loop_76
	nop
	set	0x7E, %l1
	lduh	[%l7 + %l1],	%g5
	set	0x40, %l4
	lda	[%l7 + %l4] 0x81,	%f31
loop_76:
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	or	%i0,	%g4,	%l5
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%o0
	or	%g3,	%l2,	%i4
	ld	[%l7 + 0x24],	%f31
	set	0x65, %l6
	stba	%o1,	[%l7 + %l6] 0x88
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%l3
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	nop
	set	0x08, %g5
	std	%o4,	[%l7 + %g5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i1
	or	%o2,	%o3,	%i7
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%f14
	or	%o6,	%l0,	%o4
	nop
	set	0x14, %i1
	prefetch	[%l7 + %i1],	 3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%g0
	nop
	set	0x08, %o2
	stx	%g2,	[%l7 + %o2]
	add	%g6,	%g7,	%i5
	nop
	set	0x44, %o7
	lduw	[%l7 + %o7],	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %g1
	stda	%i2,	[%l7 + %g1] 0x89
	nop
	set	0x08, %g4
	ldsw	[%l7 + %g4],	%g5
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%g4
	nop
	set	0x6C, %i5
	lduw	[%l7 + %i5],	%l5
	nop
	set	0x70, %o5
	lduw	[%l7 + %o5],	%i0
	set	0x0E, %o3
	stba	%o0,	[%l7 + %o3] 0x80
	or	%g3,	%l2,	%o1
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x08, %l0
	std	%i4,	[%l7 + %l0]
	nop
	set	0x38, %i3
	ldsw	[%l7 + %i3],	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o7
	nop
	set	0x10, %g3
	stx	%l1,	[%l7 + %g3]
	set	0x10, %o4
	stwa	%i1,	[%l7 + %o4] 0x89
	set	0x24, %i0
	stha	%o2,	[%l7 + %i0] 0x88
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%l3
	nop
	set	0x7C, %o6
	stw	%o3,	[%l7 + %o6]
	set	0x2A, %l3
	stha	%i7,	[%l7 + %l3] 0x89
	fpadd16	%f12,	%f10,	%f26
	add	%l0,	%o6,	%g1
	nop
	set	0x61, %o0
	stb	%o4,	[%l7 + %o0]
	and	%g6,	%g2,	%i5
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%l6
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%i6
	nop
	set	0x50, %o1
	std	%g6,	[%l7 + %o1]
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%i3
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x81
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%g5
	nop
	set	0x45, %l6
	ldstub	[%l7 + %l6],	%i2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%g4
	nop
	set	0x44, %g5
	prefetch	[%l7 + %g5],	 2
	nop
	set	0x28, %i6
	prefetch	[%l7 + %i6],	 4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%i0
	nop
	set	0x7C, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x54, %o7
	stha	%o0,	[%l7 + %o7] 0x88
	nop
	set	0x66, %o2
	ldsb	[%l7 + %o2],	%g3
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f4
	nop
	set	0x08, %l2
	lduh	[%l7 + %l2],	%o1
	and	%l2,	%o5,	%l4
	set	0x18, %g1
	stwa	%i4,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x76, %i5
	ldsb	[%l7 + %i5],	%l1
	fpadd16s	%f31,	%f23,	%f16
	nop
	set	0x66, %o5
	ldsh	[%l7 + %o5],	%i1
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	nop
	set	0x2C, %l0
	lduh	[%l7 + %l0],	%o7
	nop
	set	0x14, %i2
	swap	[%l7 + %i2],	%l3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%l0
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x54, %g3
	prefetch	[%l7 + %g3],	 1
	add	%i7,	%o6,	%o4
	ld	[%l7 + 0x68],	%f24
	nop
	set	0x3A, %i0
	stb	%g6,	[%l7 + %i0]
	add	%g1,	%i5,	%g2
	set	0x48, %o4
	stha	%l6,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x74, %o6
	stba	%g7,	[%l7 + %o6] 0x89
	set	0x70, %i4
	sta	%f9,	[%l7 + %i4] 0x81
	nop
	set	0x20, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%i2
	nop
	set	0x53, %l1
	ldstub	[%l7 + %l1],	%g5
	or	%i6,	%i2,	%g4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%i0
	nop
	set	0x48, %o1
	ldub	[%l7 + %o1],	%l5
	bn,a,pn	%xcc,	loop_77
	nop
	set	0x26, %i7
	ldub	[%l7 + %i7],	%g3
	nop
	set	0x24, %l6
	ldstub	[%l7 + %l6],	%o0
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x80,	 1
loop_77:
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	bn,a	%icc,	loop_78
	nop
	set	0x36, %i1
	lduh	[%l7 + %i1],	%l2
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x81,	 2
loop_78:
	nop
	set	0x3A, %i6
	sth	%o5,	[%l7 + %i6]
	nop
	set	0x60, %l5
	stw	%i4,	[%l7 + %l5]
	nop
	set	0x76, %o2
	ldsh	[%l7 + %o2],	%i1
	nop
	set	0x40, %o7
	stx	%o2,	[%l7 + %o7]
	nop
	set	0x30, %l2
	stw	%l1,	[%l7 + %l2]
	set	0x64, %g4
	stba	%l3,	[%l7 + %g4] 0x80
	nop
	set	0x5D, %g1
	ldub	[%l7 + %g1],	%o3
	or	%o7,	%l0,	%i7
	set	0x1C, %o5
	swapa	[%l7 + %o5] 0x89,	%o6
	nop
	set	0x58, %o3
	ldsb	[%l7 + %o3],	%o4
	add	%g6,	%g1,	%i5
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f18
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x89,	 2
	set	0x38, %i2
	stwa	%l6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x88
	wr	%i3,	%g5,	%softint
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf0
	membar	#Sync
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%g7
	nop
	set	0x78, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x6F, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i6
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	set	0x7C, %l1
	stha	%i0,	[%l7 + %l1] 0x81
	nop
	set	0x14, %l4
	stw	%l5,	[%l7 + %l4]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f16
	nop
	set	0x30, %o1
	lduw	[%l7 + %o1],	%g3
	nop
	set	0x60, %i7
	ldstub	[%l7 + %i7],	%o0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	nop
	set	0x08, %l6
	prefetch	[%l7 + %l6],	 1
	set	0x44, %g6
	sta	%f27,	[%l7 + %g6] 0x89
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	st	%fsr,	[%l7 + 0x68]
	set	0x40, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o1
	nop
	set	0x1E, %g7
	sth	%l2,	[%l7 + %g7]
	nop
	set	0x78, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%i2
	nop
	set	0x44, %i6
	stw	%o5,	[%l7 + %i6]
	set	0x70, %l2
	stba	%l4,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x4B, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i4
	or	%o2,	%i1,	%l1
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%l2
	or	%o3,	%l0,	%i7
	and	%o7,	%o4,	%o6
	nop
	set	0x40, %g1
	std	%f12,	[%l7 + %g1]
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x08, %o3
	ldsw	[%l7 + %o3],	%g6
	or	%i5,	%g2,	%l6
	nop
	set	0x10, %l0
	stx	%i3,	[%l7 + %l0]
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x33, %i2
	stb	%g1,	[%l7 + %i2]
	set	0x30, %g3
	stba	%i6,	[%l7 + %g3] 0x81
	nop
	set	0x20, %o4
	std	%g6,	[%l7 + %o4]
	nop
	set	0x24, %i0
	ldsw	[%l7 + %i0],	%g4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f0
	set	0x20, %i4
	sta	%f19,	[%l7 + %i4] 0x89
	or	%l5,	%i0,	%o0
	nop
	set	0x4A, %l3
	lduh	[%l7 + %l3],	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%l2
	set	0x67, %l1
	stba	%o5,	[%l7 + %l1] 0x81
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%i2
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f18
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x88,	%i4
	nop
	set	0x21, %i7
	ldstub	[%l7 + %i7],	%o2
	nop
	set	0x50, %o0
	ldsh	[%l7 + %o0],	%i1
	ba	%xcc,	loop_79
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%l1
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
loop_79:
	nop
	set	0x3A, %l6
	stha	%l4,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x48, %i1
	swapa	[%l7 + %i1] 0x89,	%o3
	st	%f0,	[%l7 + 0x78]
	nop
	set	0x5C, %g5
	ldsw	[%l7 + %g5],	%l0
	set	0x5C, %l5
	swapa	[%l7 + %l5] 0x88,	%l3
	nop
	set	0x60, %g7
	swap	[%l7 + %g7],	%i7
	set	0x29, %o2
	stba	%o7,	[%l7 + %o2] 0x81
	set	0x5C, %l2
	sta	%f20,	[%l7 + %l2] 0x88
	set	0x50, %g4
	ldda	[%l7 + %g4] 0xea,	%o6
	nop
	set	0x10, %i6
	stx	%fsr,	[%l7 + %i6]
	fpsub16s	%f5,	%f12,	%f7
	nop
	set	0x38, %g1
	stb	%o4,	[%l7 + %g1]
	nop
	set	0x28, %o7
	sth	%g6,	[%l7 + %o7]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f16
	nop
	set	0x18, %l0
	ldsw	[%l7 + %l0],	%g2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f0
	st	%f13,	[%l7 + 0x10]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%i3
	nop
	set	0x24, %i2
	stb	%g5,	[%l7 + %i2]
	nop
	set	0x2C, %g3
	stb	%g1,	[%l7 + %g3]
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x18, %i0
	sta	%f31,	[%l7 + %i0] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%g7
	nop
	set	0x62, %o4
	ldsb	[%l7 + %o4],	%g4
	bgu,pt	%xcc,	loop_80
	nop
	set	0x60, %i4
	stx	%l6,	[%l7 + %i4]
	set	0x18, %i5
	stwa	%l5,	[%l7 + %i5] 0x88
loop_80:
	nop
	set	0x18, %l1
	std	%i0,	[%l7 + %l1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%o0
	set	0x29, %o6
	stba	%l2,	[%l7 + %o6] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x4E, %l4
	ldsh	[%l7 + %l4],	%i4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%o4
	set	0x1A, %i7
	stba	%o2,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%f26
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%l4
	nop
	set	0x52, %o0
	ldsb	[%l7 + %o0],	%l1
	or	%l0,	%l3,	%i7
	set	0x70, %g2
	lda	[%l7 + %g2] 0x80,	%f18
	ld	[%l7 + 0x60],	%f10
	fpsub32	%f4,	%f26,	%f14
	nop
	set	0x5C, %g6
	lduw	[%l7 + %g6],	%o3
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f18
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%o6
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x80,	%o6
	set	0x70, %g7
	stha	%o4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x7C, %o2
	lduh	[%l7 + %o2],	%g2
	and	%g6,	%i3,	%g5
	nop
	set	0x48, %l6
	std	%f24,	[%l7 + %l6]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i5
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	set	0x44, %i6
	stba	%g7,	[%l7 + %i6] 0x81
	set	0x44, %l2
	sta	%f16,	[%l7 + %l2] 0x89
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%g4
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x12, %l0
	stb	%i0,	[%l7 + %l0]
	nop
	set	0x28, %i3
	ldsh	[%l7 + %i3],	%l5
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	set	0x50, %g3
	sta	%f6,	[%l7 + %g3] 0x88
	add	%o1,	%l2,	%o0
	ld	[%l7 + 0x34],	%f5
	nop
	set	0x38, %o7
	stx	%i2,	[%l7 + %o7]
	nop
	set	0x5A, %o5
	ldsh	[%l7 + %o5],	%i4
	nop
	set	0x5B, %o4
	ldsb	[%l7 + %o4],	%g3
	nop
	set	0x70, %i0
	ldx	[%l7 + %i0],	%o2
	set	0x20, %i4
	sta	%f7,	[%l7 + %i4] 0x89
	set	0x30, %i5
	stxa	%i1,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%l4
	nop
	set	0x60, %l4
	stx	%l1,	[%l7 + %l4]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	nop
	set	0x72, %o1
	ldsh	[%l7 + %o1],	%o5
	set	0x3C, %i7
	stha	%l0,	[%l7 + %i7] 0xea
	membar	#Sync
	and	%l3,	%o3,	%i7
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%o6
	or	%o4,	%o7,	%g6
	bne,pn	%xcc,	loop_81
	nop
	set	0x20, %o0
	std	%i2,	[%l7 + %o0]
	nop
	set	0x28, %g2
	ldstub	[%l7 + %g2],	%g2
	st	%fsr,	[%l7 + 0x54]
loop_81:
	nop
	set	0x70, %i1
	lda	[%l7 + %i1] 0x80,	%f12
	nop
	set	0x50, %g6
	ldsw	[%l7 + %g6],	%g5
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%g0
	nop
	set	0x08, %g5
	stx	%i6,	[%l7 + %g5]
	wr	%i5,	%g4,	%ccr
	and	%l6,	%g7,	%i0
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
	set	0x20, %g7
	stda	%l4,	[%l7 + %g7] 0x81
	nop
	set	0x2C, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	set	0x38, %g4
	std	%f18,	[%l7 + %g4]
	nop
	set	0x50, %l2
	lduw	[%l7 + %l2],	%l2
	ble	%xcc,	loop_82
	nop
	set	0x7C, %g1
	ldsh	[%l7 + %g1],	%o0
	nop
	set	0x32, %o3
	ldsb	[%l7 + %o3],	%i4
	nop
	set	0x6A, %l0
	lduh	[%l7 + %l0],	%g3
loop_82:
	nop
	set	0x1C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x30, %i2
	stw	%i2,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x0A, %i6
	ldub	[%l7 + %i6],	%o2
	nop
	set	0x6E, %g3
	lduh	[%l7 + %g3],	%i1
	nop
	set	0x10, %o5
	std	%l4,	[%l7 + %o5]
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x89,	%o5
	st	%fsr,	[%l7 + 0x38]
	set	0x2C, %o7
	stwa	%l1,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x40, %i4
	lduw	[%l7 + %i4],	%l0
	nop
	set	0x56, %o6
	lduh	[%l7 + %o6],	%o3
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%l3
	set	0x70, %i5
	stwa	%o4,	[%l7 + %i5] 0x80
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x24],	%f29
	set	0x54, %l4
	stwa	%o7,	[%l7 + %l4] 0x88
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x88,	%g6
	nop
	set	0x32, %i7
	stb	%i3,	[%l7 + %i7]
	nop
	set	0x12, %o0
	ldsb	[%l7 + %o0],	%o6
	nop
	set	0x4C, %g2
	ldub	[%l7 + %g2],	%g5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%g1
	nop
	set	0x70, %i1
	sth	%i5,	[%l7 + %i1]
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%i6
	set	0x70, %g5
	stda	%g4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x6C, %o2
	swapa	[%l7 + %o2] 0x88,	%g7
	set	0x0E, %l5
	ldstuba	[%l7 + %l5] 0x80,	%i0
	nop
	set	0x18, %l6
	std	%f22,	[%l7 + %l6]
	nop
	set	0x30, %g4
	ldstub	[%l7 + %g4],	%l6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l5
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x20, %g7
	ldsw	[%l7 + %g7],	%l2
	nop
	set	0x60, %o3
	stx	%o0,	[%l7 + %o3]
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f12
	nop
	set	0x44, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x38, %l0
	ldsh	[%l7 + %l0],	%i4
	nop
	set	0x38, %i6
	ldub	[%l7 + %i6],	%i2
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f18
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x78, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f14
	nop
	set	0x1E, %o7
	sth	%g3,	[%l7 + %o7]
	nop
	set	0x38, %o4
	std	%f18,	[%l7 + %o4]
	or	%o2,	%i1,	%l4
	set	0x78, %i4
	stxa	%l1,	[%l7 + %i4] 0x89
	nop
	set	0x4E, %o6
	sth	%l0,	[%l7 + %o6]
	set	0x1C, %i5
	stwa	%o3,	[%l7 + %i5] 0x89
	set	0x78, %l1
	stwa	%o5,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x89,	%i6
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x81,	%o4
	and	%l3,	%g6,	%i3
	set	0x30, %l3
	stxa	%o7,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x14, %i7
	sta	%f24,	[%l7 + %i7] 0x81
	nop
	set	0x73, %o1
	ldub	[%l7 + %o1],	%g5
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%o6
	fpsub16	%f16,	%f14,	%f14
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f16
	add	%g2,	%g1,	%i6
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x88,	%i5
	nop
	set	0x25, %i1
	ldstub	[%l7 + %i1],	%g7
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x80,	 2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc0
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe2,	%i0
	st	%f31,	[%l7 + 0x68]
	set	0x20, %l5
	swapa	[%l7 + %l5] 0x89,	%l6
	nop
	set	0x38, %g4
	stx	%o1,	[%l7 + %g4]
	nop
	set	0x10, %l2
	stx	%l5,	[%l7 + %l2]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xcc
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x80,	%l2
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x80,	%i4
	nop
	set	0x28, %l0
	swap	[%l7 + %l0],	%i2
	nop
	set	0x58, %g7
	ldsw	[%l7 + %g7],	%g3
	and	%o2,	%o0,	%i1
	nop
	set	0x50, %g3
	lduw	[%l7 + %g3],	%l1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x89
	nop
	set	0x57, %i6
	stb	%l4,	[%l7 + %i6]
	and	%l0,	%o5,	%i7
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l3
	st	%fsr,	[%l7 + 0x64]
	and	%i3,	%o7,	%g6
	set	0x10, %i2
	stda	%o6,	[%l7 + %i2] 0xeb
	membar	#Sync
	ble,a,pn	%icc,	loop_83
	nop
	set	0x50, %o4
	std	%f28,	[%l7 + %o4]
	set	0x7E, %o6
	ldstuba	[%l7 + %o6] 0x89,	%g5
loop_83:
	nop
	set	0x78, %i4
	lduw	[%l7 + %i4],	%g1
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f28
	nop
	set	0x66, %i5
	ldstub	[%l7 + %i5],	%g2
	nop
	set	0x60, %l4
	prefetch	[%l7 + %l4],	 0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i5
	nop
	set	0x26, %l3
	ldsb	[%l7 + %l3],	%g4
	nop
	set	0x6A, %i0
	sth	%i0,	[%l7 + %i0]
	set	0x64, %o1
	sta	%f7,	[%l7 + %o1] 0x89
	bne,a	%xcc,	loop_84
	fpsub32s	%f1,	%f12,	%f21
	set	0x6C, %i7
	swapa	[%l7 + %i7] 0x88,	%g7
loop_84:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l5
	or	%l2,	%l6,	%i2
	nop
	set	0x10, %o0
	stx	%i4,	[%l7 + %o0]
	nop
	set	0x12, %g6
	lduh	[%l7 + %g6],	%o2
	st	%f18,	[%l7 + 0x20]
	set	0x14, %i1
	sta	%f1,	[%l7 + %i1] 0x89
	nop
	set	0x58, %g2
	stw	%o0,	[%l7 + %g2]
	nop
	set	0x08, %g5
	stx	%g3,	[%l7 + %g5]
	nop
	set	0x78, %l6
	swap	[%l7 + %l6],	%l1
	add	%i1,	%l4,	%o5
	set	0x60, %o2
	stda	%i6,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x20, %l5
	stda	%l0,	[%l7 + %l5] 0x81
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f10
	nop
	set	0x20, %g4
	std	%f10,	[%l7 + %g4]
	nop
	set	0x70, %o3
	ldub	[%l7 + %o3],	%o3
	nop
	set	0x18, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf8
	membar	#Sync
	bn,pn	%xcc,	loop_85
	nop
	set	0x24, %i3
	ldsw	[%l7 + %i3],	%o4
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%i2
	nop
	set	0x10, %o5
	swap	[%l7 + %o5],	%o7
loop_85:
	nop
	set	0x50, %g3
	stx	%g6,	[%l7 + %g3]
	nop
	set	0x70, %o7
	std	%f24,	[%l7 + %o7]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
	set	0x66, %o4
	stha	%o6,	[%l7 + %o4] 0x80
	nop
	set	0x40, %i2
	sth	%g5,	[%l7 + %i2]
	nop
	set	0x58, %o6
	prefetch	[%l7 + %o6],	 4
	st	%f15,	[%l7 + 0x50]
	set	0x0C, %l1
	sta	%f2,	[%l7 + %l1] 0x80
	add	%g1,	%l3,	%i6
	nop
	set	0x30, %i4
	std	%f8,	[%l7 + %i4]
	nop
	set	0x08, %i5
	std	%i4,	[%l7 + %i5]
	set	0x4C, %l3
	stha	%g4,	[%l7 + %l3] 0x89
	set	0x70, %l4
	sta	%f18,	[%l7 + %l4] 0x88
	set	0x30, %o1
	lda	[%l7 + %o1] 0x80,	%f10
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	and	%i0,	%g2,	%g7
	set	0x2C, %i7
	sta	%f22,	[%l7 + %i7] 0x81
	set	0x60, %o0
	swapa	[%l7 + %o0] 0x89,	%l5
	add	%o1,	%l2,	%l6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o2
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x37, %i1
	ldstub	[%l7 + %i1],	%i4
	set	0x54, %g2
	stha	%g3,	[%l7 + %g2] 0x80
	nop
	nop
	setx	0xB829C378,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x69A2F5A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f3,	%f1
	and	%o0,	%l1,	%i1
	and	%l4,	%i7,	%o5
	nop
	set	0x20, %g6
	ldstub	[%l7 + %g6],	%o3
	nop
	set	0x08, %l6
	std	%f20,	[%l7 + %l6]
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x80,	%o4
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%l0
	nop
	set	0x46, %l5
	ldsb	[%l7 + %l5],	%o7
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x88,	%g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l3
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x89,	%i6
	nop
	set	0x67, %g4
	stb	%o6,	[%l7 + %g4]
	set	0x56, %g1
	stha	%g4,	[%l7 + %g1] 0x89
	nop
	set	0x50, %i3
	stw	%i0,	[%l7 + %i3]
	nop
	set	0x5C, %l0
	ldsb	[%l7 + %l0],	%i5
	set	0x0C, %o5
	stwa	%g7,	[%l7 + %o5] 0x88
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	add	%g2,	%o1,	%l2
	set	0x3C, %o7
	lda	[%l7 + %o7] 0x88,	%f26
	and	%l5,	%l6,	%i2
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x54, %o4
	swapa	[%l7 + %o4] 0x80,	%o2
	or	%g3,	%i4,	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%l1
	nop
	set	0x50, %g7
	std	%f0,	[%l7 + %g7]
	set	0x40, %i2
	stwa	%i7,	[%l7 + %i2] 0x80
	set	0x1A, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l4
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x80,	%o3
	set	0x6E, %i5
	stha	%o4,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x36, %l1
	lduh	[%l7 + %l1],	%l0
	nop
	set	0x7B, %l4
	ldsb	[%l7 + %l4],	%o5
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x81,	 1
	nop
	set	0x14, %i0
	ldsw	[%l7 + %i0],	%i3
	and	%g6,	%g5,	%l3
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%g1
	nop
	set	0x61, %i7
	ldub	[%l7 + %i7],	%i6
	set	0x10, %i1
	stxa	%g4,	[%l7 + %i1] 0x89
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	set	0x76, %l6
	stha	%i0,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x30, %g2
	stwa	%o6,	[%l7 + %g2] 0x88
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%i4
	nop
	set	0x64, %o2
	ldstub	[%l7 + %o2],	%g2
	set	0x10, %l2
	stxa	%g7,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x30, %o3
	stda	%l2,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x88,	%l5
	nop
	set	0x0E, %g1
	ldub	[%l7 + %g1],	%o1
	nop
	set	0x20, %i3
	std	%f18,	[%l7 + %i3]
	nop
	set	0x22, %l0
	ldstub	[%l7 + %l0],	%l6
	and	%o2,	%i2,	%g3
	set	0x16, %l5
	stha	%i4,	[%l7 + %l5] 0x80
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%l4
	nop
	set	0x3A, %g3
	ldsh	[%l7 + %g3],	%o3
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f0
	bg,a	%icc,	loop_86
	and	%i7,	%l0,	%o5
	nop
	set	0x54, %o5
	sth	%o7,	[%l7 + %o5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%i3
loop_86:
	nop
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd8
	nop
	set	0x5C, %i6
	swap	[%l7 + %i6],	%g6
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xca
	set	0x28, %g7
	sta	%f3,	[%l7 + %g7] 0x81
	nop
	set	0x30, %i4
	stw	%g5,	[%l7 + %i4]
	nop
	set	0x08, %i5
	ldx	[%l7 + %i5],	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g1
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x18, %l4
	std	%i0,	[%l7 + %l4]
	set	0x68, %o6
	stwa	%g4,	[%l7 + %o6] 0x80
	st	%fsr,	[%l7 + 0x68]
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x88,	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%g2
	fpsub32s	%f0,	%f7,	%f11
	nop
	set	0x0D, %i0
	ldsb	[%l7 + %i0],	%l2
	set	0x60, %l3
	sta	%f18,	[%l7 + %l3] 0x88
	nop
	set	0x22, %i7
	sth	%g7,	[%l7 + %i7]
	set	0x42, %i1
	stba	%l5,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x78, %g6
	stx	%l6,	[%l7 + %g6]
	nop
	set	0x58, %o0
	lduw	[%l7 + %o0],	%o1
	set	0x09, %g2
	stba	%i2,	[%l7 + %g2] 0x81
	nop
	set	0x4D, %l6
	ldstub	[%l7 + %l6],	%o2
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x89
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x88,	%g3
	set	0x3C, %o3
	stha	%l1,	[%l7 + %o3] 0x80
	ld	[%l7 + 0x54],	%f0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f16
	set	0x18, %i3
	stda	%i0,	[%l7 + %i3] 0x81
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x81,	%l4
	set	0x0E, %l5
	stha	%o0,	[%l7 + %l5] 0x81
	nop
	set	0x50, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x80,	 2
	set	0x42, %o7
	stha	%l0,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x80,	%o3
	set	0x3C, %i6
	stwa	%o7,	[%l7 + %i6] 0x89
	nop
	set	0x0C, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x78, %o4
	stwa	%o4,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x68, %i4
	stx	%o5,	[%l7 + %i4]
	nop
	set	0x20, %i5
	std	%g6,	[%l7 + %i5]
	nop
	set	0x50, %g7
	std	%f24,	[%l7 + %g7]
	set	0x60, %l1
	stxa	%i3,	[%l7 + %l1] 0x89
	fpadd32	%f18,	%f2,	%f18
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f18
	bne,a,pn	%xcc,	loop_87
	nop
	set	0x10, %o1
	swap	[%l7 + %o1],	%l3
	fpadd32	%f30,	%f14,	%f6
	wr	%g5,	%i6,	%pic
loop_87:
	nop
	set	0x58, %o6
	stw	%i0,	[%l7 + %o6]
	nop
	set	0x34, %i0
	swap	[%l7 + %i0],	%g1
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f30
	nop
	set	0x20, %i1
	std	%i4,	[%l7 + %i1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%g2
	st	%f19,	[%l7 + 0x44]
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f22
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
	set	0x0B, %g2
	ldstuba	[%l7 + %g2] 0x88,	%l2
	set	0x76, %l6
	stha	%g7,	[%l7 + %l6] 0xe3
	membar	#Sync
	st	%f12,	[%l7 + 0x68]
	set	0x62, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g4
	nop
	set	0x7C, %l2
	stb	%l5,	[%l7 + %l2]
	nop
	set	0x18, %g5
	lduw	[%l7 + %g5],	%l6
	set	0x18, %o3
	sta	%f11,	[%l7 + %o3] 0x81
	add	%i2,	%o2,	%i4
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%g3
	nop
	set	0x2C, %i3
	ldsh	[%l7 + %i3],	%o1
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x2A, %l5
	stba	%l1,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x58, %g4
	swapa	[%l7 + %g4] 0x81,	%l4
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x88,	%i0
	set	0x4E, %g1
	stba	%i7,	[%l7 + %g1] 0x80
	set	0x4B, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o0
	set	0x5C, %o7
	sta	%f7,	[%l7 + %o7] 0x81
	nop
	set	0x3C, %i6
	ldsw	[%l7 + %i6],	%l0
	set	0x30, %i2
	swapa	[%l7 + %i2] 0x88,	%o3
	and	%o7,	%o5,	%o4
	set	0x23, %i4
	stba	%i3,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x81,	%g6
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x80,	%g4
	nop
	set	0x12, %l1
	ldub	[%l7 + %l1],	%l3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%i6
	add	%i5,	%o6,	%g1
	set	0x10, %g7
	lda	[%l7 + %g7] 0x89,	%f16
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	nop
	set	0x7C, %o6
	lduh	[%l7 + %o6],	%g2
	set	0x1A, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g4
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f28
	fpadd16s	%f3,	%f0,	%f26
	nop
	set	0x18, %i1
	std	%f2,	[%l7 + %i1]
	set	0x10, %l3
	stba	%l5,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%i2
	nop
	set	0x70, %g2
	swap	[%l7 + %g2],	%o2
	add	%l6,	%i4,	%o1
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	or	%g3,	%l1,	%l4
	set	0x10, %l6
	sta	%f21,	[%l7 + %l6] 0x81
	nop
	set	0x42, %l2
	ldsb	[%l7 + %l2],	%i7
	nop
	set	0x18, %g5
	std	%i0,	[%l7 + %g5]
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f12
	set	0x49, %o3
	ldstuba	[%l7 + %o3] 0x88,	%l0
	st	%f13,	[%l7 + 0x4C]
	nop
	set	0x0A, %i3
	stb	%o0,	[%l7 + %i3]
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f16
	nop
	set	0x21, %l5
	ldsb	[%l7 + %l5],	%o3
	ld	[%l7 + 0x48],	%f0
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%o5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%o4
	set	0x60, %l0
	stxa	%o7,	[%l7 + %l0] 0x80
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%i3
	nop
	set	0x78, %o7
	stw	%g6,	[%l7 + %o7]
	nop
	set	0x7C, %i6
	ldsw	[%l7 + %i6],	%g5
	set	0x18, %i2
	sta	%f18,	[%l7 + %i2] 0x88
	set	0x1C, %g1
	stha	%i0,	[%l7 + %g1] 0xe3
	membar	#Sync
	wr	%l3,	%i5,	%ccr
	nop
	set	0x2A, %i4
	ldub	[%l7 + %i4],	%o6
	set	0x10, %i5
	stwa	%i6,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x49, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g1
	and	%l2,	%g2,	%g4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%g7
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
	nop
	set	0x48, %o1
	ldsh	[%l7 + %o1],	%l6
	or	%i4,	%i2,	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%l4
	nop
	set	0x16, %g7
	ldsh	[%l7 + %g7],	%l1
	nop
	set	0x70, %o6
	std	%i0,	[%l7 + %o6]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%o0
	and	%o3,	%o5,	%o4
	set	0x18, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l0
	add	%i3,	%o7,	%g6
	set	0x61, %l4
	stba	%i0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x38, %i1
	stha	%l3,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x41, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i5
	ld	[%l7 + 0x4C],	%f8
	nop
	set	0x6D, %l3
	ldub	[%l7 + %l3],	%g5
	nop
	set	0x20, %i7
	ldsw	[%l7 + %i7],	%i6
	set	0x48, %l6
	sta	%f10,	[%l7 + %l6] 0x81
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%o6
	set	0x70, %l2
	lda	[%l7 + %l2] 0x89,	%f19
	nop
	set	0x18, %g5
	ldsw	[%l7 + %g5],	%l2
	set	0x38, %o3
	sta	%f30,	[%l7 + %o3] 0x89
	nop
	set	0x3C, %i3
	ldsw	[%l7 + %i3],	%g2
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%g4
	nop
	set	0x71, %l5
	ldstub	[%l7 + %l5],	%g1
	nop
	set	0x38, %g4
	lduh	[%l7 + %g4],	%l5
	ld	[%l7 + 0x7C],	%f9
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%o2
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xe3,	%g6
	nop
	set	0x5A, %g3
	ldsh	[%l7 + %g3],	%l6
	set	0x30, %o5
	ldxa	[%l7 + %o5] 0x80,	%i4
	nop
	set	0x4C, %o7
	prefetch	[%l7 + %o7],	 4
	st	%f11,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x70, %i6
	stx	%i2,	[%l7 + %i6]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%i1
	nop
	set	0x28, %i2
	ldsh	[%l7 + %i2],	%i7
	nop
	set	0x64, %g1
	stw	%o0,	[%l7 + %g1]
	or	%o3,	%o5,	%l1
	set	0x72, %i4
	stha	%l0,	[%l7 + %i4] 0x80
	add	%o4,	%o7,	%g6
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	nop
	set	0x70, %l1
	std	%f14,	[%l7 + %l1]
	nop
	set	0x5D, %o4
	ldstub	[%l7 + %o4],	%i0
	nop
	set	0x0C, %o1
	ldstub	[%l7 + %o1],	%l3
	ld	[%l7 + 0x6C],	%f20
	nop
	set	0x76, %g7
	stb	%g5,	[%l7 + %g7]
	set	0x34, %o6
	lda	[%l7 + %o6] 0x89,	%f28
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%i6
	set	0x33, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o6
	ld	[%l7 + 0x38],	%f1
	set	0x2E, %i1
	stba	%l2,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x20, %o0
	ldda	[%l7 + %o0] 0xea,	%g2
	or	%g4,	%i5,	%l5
	st	%fsr,	[%l7 + 0x28]
	st	%f6,	[%l7 + 0x1C]
	nop
	set	0x7D, %l3
	ldsb	[%l7 + %l3],	%g1
	nop
	set	0x78, %i7
	std	%f14,	[%l7 + %i7]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f16
	add	%g7,	%l6,	%o2
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f16
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f14
	set	0x35, %g5
	stba	%i2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x48, %o3
	ldsh	[%l7 + %o3],	%i4
	nop
	set	0x10, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x50, %i3
	stda	%g2,	[%l7 + %i3] 0x81
	nop
	set	0x7C, %g4
	prefetch	[%l7 + %g4],	 4
	and	%l4,	%i1,	%i7
	set	0x58, %o2
	sta	%f14,	[%l7 + %o2] 0x89
	and	%o0,	%o3,	%o1
	set	0x2C, %l0
	lda	[%l7 + %l0] 0x88,	%f22
	nop
	set	0x40, %l5
	std	%f26,	[%l7 + %l5]
	wr	%l1,	%l0,	%y
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1251
!	Type a   	: 25
!	Type cti   	: 24
!	Type x   	: 543
!	Type f   	: 33
!	Type i   	: 124
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
	set	0xB,	%g1
	set	0x9,	%g2
	set	0x5,	%g3
	set	0x3,	%g4
	set	0xB,	%g5
	set	0x3,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x1,	%i1
	set	-0x0,	%i2
	set	-0x1,	%i3
	set	-0x1,	%i4
	set	-0xA,	%i5
	set	-0xD,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x208510B5,	%l0
	set	0x51C126C2,	%l1
	set	0x4CCE65B6,	%l2
	set	0x0189012B,	%l3
	set	0x587A731E,	%l4
	set	0x50F6E47A,	%l5
	set	0x4839E307,	%l6
	!# Output registers
	set	0x094C,	%o0
	set	0x0CCF,	%o1
	set	-0x02BA,	%o2
	set	-0x1CBA,	%o3
	set	0x1B4A,	%o4
	set	0x0786,	%o5
	set	0x069B,	%o6
	set	-0x1E5A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	set	0x79, %g3
	stba	%o7,	[%l7 + %g3] 0x88
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x66, %i2
	ldstub	[%l7 + %i2],	%i3
	nop
	set	0x1C, %g1
	swap	[%l7 + %g1],	%i0
	nop
	set	0x58, %i4
	sth	%g6,	[%l7 + %i4]
	set	0x70, %o7
	stda	%l2,	[%l7 + %o7] 0x88
	nop
	set	0x34, %i5
	sth	%i6,	[%l7 + %i5]
	set	0x49, %o4
	stba	%o6,	[%l7 + %o4] 0x88
	bl,pn	%xcc,	loop_88
	wr	%g5,	%g2,	%sys_tick
	nop
	set	0x3B, %l1
	ldstub	[%l7 + %l1],	%l2
	set	0x74, %g7
	stba	%g4,	[%l7 + %g7] 0xe3
	membar	#Sync
loop_88:
	wr	%i5,	%l5,	%set_softint
	nop
	set	0x1C, %o1
	lduh	[%l7 + %o1],	%g1
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%g7
	nop
	set	0x70, %o6
	stx	%o2,	[%l7 + %o6]
	and	%i2,	%l6,	%i4
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%i1
	or	%i7,	%o0,	%o3
	and	%o1,	%l4,	%l1
	add	%l0,	%o4,	%o5
	nop
	set	0x0C, %i1
	lduw	[%l7 + %i1],	%o7
	add	%i0,	%i3,	%g6
	bn,a,pn	%icc,	loop_89
	nop
	set	0x70, %o0
	std	%f8,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x30, %l3
	std	%f30,	[%l7 + %l3]
loop_89:
	nop
	set	0x28, %i0
	stx	%i6,	[%l7 + %i0]
	set	0x5F, %g2
	stba	%o6,	[%l7 + %g2] 0x89
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 0
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%g2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f0
	ld	[%l7 + 0x0C],	%f23
	nop
	set	0x7C, %g6
	stw	%l3,	[%l7 + %g6]
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%g4
	ld	[%l7 + 0x40],	%f25
	st	%fsr,	[%l7 + 0x24]
	set	0x68, %i7
	lda	[%l7 + %i7] 0x81,	%f23
	set	0x28, %o2
	stxa	%i5,	[%l7 + %o2] 0x80
	nop
	set	0x24, %g4
	prefetch	[%l7 + %g4],	 4
	set	0x24, %l5
	lda	[%l7 + %l5] 0x81,	%f1
	set	0x4E, %o5
	stba	%l5,	[%l7 + %o5] 0x88
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f0
	nop
	set	0x0F, %l0
	ldstub	[%l7 + %l0],	%g1
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xeb,	%l2
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x81,	%g7
	nop
	set	0x18, %i4
	stx	%i2,	[%l7 + %i4]
	nop
	set	0x35, %i6
	stb	%l6,	[%l7 + %i6]
	nop
	set	0x70, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x68, %o4
	stwa	%i4,	[%l7 + %o4] 0x89
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f24
	nop
	set	0x4C, %o7
	ldsw	[%l7 + %o7],	%o2
	nop
	set	0x24, %g7
	lduh	[%l7 + %g7],	%g3
	and	%i7,	%i1,	%o0
	ble	%xcc,	loop_90
	nop
	set	0x4C, %l4
	sth	%o3,	[%l7 + %l4]
	or	%o1,	%l1,	%l0
	nop
	set	0x50, %o6
	lduh	[%l7 + %o6],	%l4
loop_90:
	nop
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x81,	%o5
	set	0x44, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o7
	or	%i0,	%o4,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%o6
	ld	[%l7 + 0x0C],	%f22
	nop
	set	0x77, %l3
	ldub	[%l7 + %l3],	%g5
	nop
	set	0x78, %i0
	ldsh	[%l7 + %i0],	%i3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g4
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x81,	%g2
	set	0x74, %l2
	stwa	%i5,	[%l7 + %l2] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	nop
	set	0x2A, %g5
	ldsh	[%l7 + %g5],	%g1
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x81,	%l2
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x63, %i3
	ldsb	[%l7 + %i3],	%l5
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xe2,	%g6
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x80,	%i2
	st	%f15,	[%l7 + 0x5C]
	nop
	set	0x6C, %o3
	ldub	[%l7 + %o3],	%l6
	nop
	set	0x7C, %g4
	stw	%o2,	[%l7 + %g4]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc4
	nop
	set	0x38, %g3
	ldsh	[%l7 + %g3],	%g3
	nop
	set	0x30, %o5
	ldsw	[%l7 + %o5],	%i7
	set	0x46, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i1
	set	0x6C, %i2
	stha	%i4,	[%l7 + %i2] 0xeb
	membar	#Sync
	ld	[%l7 + 0x34],	%f22
	set	0x38, %g1
	sta	%f11,	[%l7 + %g1] 0x89
	set	0x2E, %i6
	stba	%o0,	[%l7 + %i6] 0x89
	nop
	set	0x14, %i5
	ldsw	[%l7 + %i5],	%o1
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f22
	st	%f8,	[%l7 + 0x60]
	set	0x38, %o4
	stxa	%l1,	[%l7 + %o4] 0x81
	nop
	set	0x20, %l1
	stw	%l0,	[%l7 + %l1]
	fpsub16s	%f0,	%f18,	%f13
	nop
	set	0x62, %o7
	ldstub	[%l7 + %o7],	%l4
	nop
	set	0x18, %l4
	sth	%o3,	[%l7 + %l4]
	nop
	set	0x3B, %g7
	ldsb	[%l7 + %g7],	%o5
	nop
	set	0x2E, %o1
	ldsb	[%l7 + %o1],	%o7
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f16
	nop
	set	0x40, %l3
	std	%f18,	[%l7 + %l3]
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xea,	%i0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	set	0x19, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g6
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x74, %g2
	stwa	%i6,	[%l7 + %g2] 0x89
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x14, %i3
	lduw	[%l7 + %i3],	%o4
	or	%g5,	%o6,	%i3
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%l3
	set	0x70, %i7
	stda	%g2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%i5
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f26
	wr	%g1,	%l5,	%sys_tick
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%g7
	nop
	set	0x69, %o5
	stb	%i2,	[%l7 + %o5]
	nop
	set	0x21, %l0
	ldsb	[%l7 + %l0],	%l6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f16
	nop
	set	0x60, %i6
	swap	[%l7 + %i6],	%l2
	add	%g3,	%i7,	%o2
	nop
	set	0x6C, %g1
	swap	[%l7 + %g1],	%i1
	st	%fsr,	[%l7 + 0x58]
	set	0x48, %i5
	stxa	%o0,	[%l7 + %i5] 0x80
	or	%i4,	%l1,	%l0
	nop
	set	0x0E, %o4
	ldstub	[%l7 + %o4],	%l4
	nop
	set	0x71, %l1
	ldstub	[%l7 + %l1],	%o3
	set	0x7C, %i4
	sta	%f28,	[%l7 + %i4] 0x80
	wr	%o1,	%o5,	%ccr
	bge,pt	%icc,	loop_91
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%o7
	fpsub32s	%f30,	%f1,	%f17
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%i6
loop_91:
	nop
	set	0x30, %g7
	swapa	[%l7 + %g7] 0x89,	%o4
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%g6
	nop
	set	0x6E, %i1
	lduh	[%l7 + %i1],	%g5
	nop
	set	0x2E, %l4
	ldsh	[%l7 + %l4],	%o6
	add	%l3,	%i3,	%g2
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%i4
	set	0x60, %i0
	stxa	%g1,	[%l7 + %i0] 0x88
	set	0x40, %o6
	stha	%g4,	[%l7 + %o6] 0x88
	nop
	set	0x5A, %l2
	ldstub	[%l7 + %l2],	%g7
	nop
	set	0x56, %l6
	stb	%i2,	[%l7 + %l6]
	nop
	set	0x18, %g2
	stx	%l5,	[%l7 + %g2]
	set	0x3C, %o0
	sta	%f27,	[%l7 + %o0] 0x80
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x88,	%l6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%g3
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xe3,	%o2
	nop
	set	0x28, %i3
	std	%f16,	[%l7 + %i3]
	nop
	set	0x3C, %o3
	ldsh	[%l7 + %o3],	%i7
	set	0x4E, %o2
	stha	%o0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x1D, %l5
	stba	%i4,	[%l7 + %l5] 0x80
	nop
	set	0x08, %g4
	std	%f22,	[%l7 + %g4]
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x80,	%i1
	set	0x60, %g3
	ldda	[%l7 + %g3] 0xeb,	%l0
	nop
	set	0x74, %i2
	stb	%l4,	[%l7 + %i2]
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%l0
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%o2
	set	0x18, %i5
	stda	%o0,	[%l7 + %i5] 0x81
	set	0x1C, %g1
	sta	%f25,	[%l7 + %g1] 0x88
	set	0x46, %o4
	stha	%o5,	[%l7 + %o4] 0x80
	ld	[%l7 + 0x44],	%f10
	set	0x10, %i4
	stda	%o6,	[%l7 + %i4] 0xea
	membar	#Sync
	fpadd32	%f24,	%f4,	%f14
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%i0
	set	0x5C, %l1
	stha	%o4,	[%l7 + %l1] 0x89
	nop
	set	0x0C, %o7
	ldsw	[%l7 + %o7],	%g5
	nop
	set	0x20, %g7
	lduw	[%l7 + %g7],	%o6
	set	0x50, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g6
	set	0x70, %i1
	sta	%f23,	[%l7 + %i1] 0x80
	nop
	set	0x3A, %l3
	sth	%l3,	[%l7 + %l3]
	add	%g2,	%i3,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%g7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%l5
	nop
	set	0x58, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x0C, %o6
	swap	[%l7 + %o6],	%l6
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x78, %l2
	stx	%g1,	[%l7 + %l2]
	nop
	set	0x2E, %g2
	ldsb	[%l7 + %g2],	%l2
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f24
	set	0x54, %g5
	sta	%f30,	[%l7 + %g5] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%i7
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%o0
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x89,	%g3
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%l4
	add	%i1,	%o3,	%o1
	set	0x48, %o0
	stda	%l0,	[%l7 + %o0] 0x88
	nop
	set	0x54, %o2
	stw	%o5,	[%l7 + %o2]
	set	0x38, %l5
	sta	%f27,	[%l7 + %l5] 0x89
	set	0x44, %o3
	stwa	%i6,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%o7
	set	0x78, %g3
	stda	%o4,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x30, %g4
	ldsw	[%l7 + %g4],	%g5
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f16
	set	0x3C, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i0
	nop
	set	0x2D, %g1
	ldstub	[%l7 + %g1],	%o6
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%g6
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	nop
	set	0x18, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%i2
	nop
	set	0x50, %g7
	stw	%l3,	[%l7 + %g7]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f0
	nop
	set	0x5E, %i1
	ldsb	[%l7 + %i1],	%g4
	nop
	set	0x54, %o1
	ldsw	[%l7 + %o1],	%i5
	nop
	set	0x78, %l3
	std	%i2,	[%l7 + %l3]
	nop
	set	0x4C, %o6
	lduw	[%l7 + %o6],	%l5
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%i6
	fpadd16s	%f18,	%f16,	%f4
	set	0x7C, %l2
	stwa	%g1,	[%l7 + %l2] 0x88
	nop
	set	0x50, %g2
	std	%f22,	[%l7 + %g2]
	nop
	set	0x12, %i0
	stb	%l2,	[%l7 + %i0]
	nop
	set	0x48, %g5
	ldsw	[%l7 + %g5],	%g7
	nop
	set	0x40, %g6
	std	%f0,	[%l7 + %g6]
	nop
	set	0x50, %i7
	lduw	[%l7 + %i7],	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i7
	nop
	set	0x60, %l6
	ldsw	[%l7 + %l6],	%i4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f16
	set	0x40, %i3
	stwa	%l1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x12, %o2
	sth	%l4,	[%l7 + %o2]
	nop
	set	0x18, %o3
	std	%f26,	[%l7 + %o3]
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%i1
	set	0x44, %o5
	stba	%g3,	[%l7 + %o5] 0x88
	add	%o3,	%o1,	%l0
	nop
	set	0x78, %g3
	stx	%i6,	[%l7 + %g3]
	set	0x58, %l0
	stwa	%o5,	[%l7 + %l0] 0x88
	or	%o4,	%g5,	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%g2
	set	0x50, %i6
	stda	%i2,	[%l7 + %i6] 0x81
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x50, %g4
	stda	%g4,	[%l7 + %g4] 0xe3
	membar	#Sync
	and	%i5,	%i2,	%l3
	add	%l6,	%l5,	%g1
	nop
	set	0x7B, %o4
	ldub	[%l7 + %o4],	%g7
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%l2
	set	0x10, %o7
	ldxa	[%l7 + %o7] 0x80,	%o2
	fpsub32	%f18,	%f6,	%f0
	nop
	set	0x64, %i2
	lduh	[%l7 + %i2],	%o0
	fpadd16s	%f31,	%f25,	%f0
	nop
	set	0x59, %g7
	ldsb	[%l7 + %g7],	%i7
	nop
	set	0x08, %l1
	std	%f4,	[%l7 + %l1]
	and	%i4,	%l4,	%l1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%i1
	and	%o1,	%l0,	%i6
	nop
	set	0x49, %i1
	ldsb	[%l7 + %i1],	%o3
	nop
	set	0x30, %l3
	ldsh	[%l7 + %l3],	%o4
	nop
	set	0x1A, %o6
	stb	%g5,	[%l7 + %o6]
	nop
	set	0x58, %o1
	ldub	[%l7 + %o1],	%o5
	nop
	set	0x6F, %l2
	ldsb	[%l7 + %l2],	%i0
	set	0x20, %g2
	swapa	[%l7 + %g2] 0x80,	%o7
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	nop
	set	0x20, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x44, %g6
	ldsb	[%l7 + %g6],	%g2
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xeb,	%o6
	nop
	set	0x14, %l6
	ldstub	[%l7 + %l6],	%i3
	nop
	nop
	setx	0xCBD84961F38320E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB5AB800A405352A7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f28
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd2
	ld	[%l7 + 0x40],	%f1
	set	0x48, %i3
	stha	%g4,	[%l7 + %i3] 0x88
	add	%i2,	%i5,	%l3
	set	0x14, %o2
	stwa	%l6,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xea,	%g0
	set	0x0E, %o3
	stha	%l5,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%g7
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%o0
	nop
	set	0x30, %i6
	std	%f0,	[%l7 + %i6]
	set	0x21, %l0
	stba	%i7,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	nop
	set	0x72, %g4
	lduh	[%l7 + %g4],	%o2
	and	%l1,	%g3,	%i1
	set	0x70, %o4
	stha	%l4,	[%l7 + %o4] 0x81
	bl,pn	%icc,	loop_92
	nop
	set	0x08, %i5
	sth	%o1,	[%l7 + %i5]
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%i6
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%l0
loop_92:
	nop
	set	0x7A, %g7
	ldstuba	[%l7 + %g7] 0x89,	%o3
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%o4
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x80,	 4
	nop
	set	0x1C, %l1
	lduh	[%l7 + %l1],	%i0
	nop
	set	0x74, %o6
	sth	%o7,	[%l7 + %o6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%g2
	st	%fsr,	[%l7 + 0x30]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xda
	nop
	set	0x08, %l3
	std	%f6,	[%l7 + %l3]
	ble,a	%icc,	loop_93
	nop
	set	0x7A, %l2
	ldstub	[%l7 + %l2],	%g6
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f0
loop_93:
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%o6
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%g4
	nop
	set	0x38, %i7
	std	%f30,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x1C]
	fpadd32	%f6,	%f0,	%f26
	nop
	set	0x58, %l6
	ldstub	[%l7 + %l6],	%i2
	set	0x7C, %i0
	swapa	[%l7 + %i0] 0x81,	%i5
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf1
	membar	#Sync
	nop
	set	0x40, %i3
	ldsw	[%l7 + %i3],	%i3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g1
	ld	[%l7 + 0x44],	%f5
	and	%l5,	%l3,	%l2
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%g6
	ld	[%l7 + 0x58],	%f13
	nop
	set	0x28, %l5
	std	%i6,	[%l7 + %l5]
	nop
	set	0x5F, %o2
	ldstub	[%l7 + %o2],	%o0
	set	0x70, %o3
	stwa	%o2,	[%l7 + %o3] 0x81
	ld	[%l7 + 0x74],	%f6
	nop
	set	0x1C, %o5
	ldsw	[%l7 + %o5],	%i4
	nop
	set	0x4F, %i6
	ldub	[%l7 + %i6],	%l1
	st	%fsr,	[%l7 + 0x58]
	set	0x08, %g3
	stda	%i0,	[%l7 + %g3] 0x81
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%g2
	nop
	set	0x70, %g4
	std	%o0,	[%l7 + %g4]
	nop
	set	0x6C, %g1
	ldsw	[%l7 + %g1],	%i6
	nop
	set	0x0F, %o4
	ldstub	[%l7 + %o4],	%l0
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%l4
	nop
	nop
	setx	0x007E7328,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x06507F7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f1,	%f31
	set	0x65, %i2
	stba	%o3,	[%l7 + %i2] 0xe3
	membar	#Sync
	or	%o4,	%i0,	%o7
	and	%o5,	%g5,	%g6
	set	0x1C, %i4
	lda	[%l7 + %i4] 0x80,	%f5
	set	0x51, %o7
	ldstuba	[%l7 + %o7] 0x88,	%g2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xe2,	%g4
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%o6
	ld	[%l7 + 0x58],	%f8
	nop
	set	0x4C, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x48, %o1
	prefetch	[%l7 + %o1],	 3
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x81,	%i5
	nop
	set	0x6E, %l2
	ldsh	[%l7 + %l2],	%i3
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x80,	 2
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x80,	%i2
	set	0x4A, %l3
	stha	%l5,	[%l7 + %l3] 0x81
	set	0x40, %i7
	stwa	%l3,	[%l7 + %i7] 0x88
	set	0x4E, %l6
	stba	%l2,	[%l7 + %l6] 0x81
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%g1
	nop
	set	0x08, %i0
	stx	%i7,	[%l7 + %i0]
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x80,	%g7
	set	0x56, %g2
	stba	%o2,	[%l7 + %g2] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%o0
	or	%i1,	%l1,	%o1
	add	%i6,	%l0,	%l4
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%g3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%i0
	nop
	set	0x54, %l5
	prefetch	[%l7 + %l5],	 4
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x81,	%o6
	set	0x58, %o2
	stxa	%o5,	[%l7 + %o2] 0xeb
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%g6
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f26
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%o4
	or	%o6,	%i5,	%g4
	set	0x40, %g3
	lda	[%l7 + %g3] 0x81,	%f31
	nop
	set	0x24, %o5
	stw	%i3,	[%l7 + %o5]
	nop
	set	0x50, %l0
	stx	%l6,	[%l7 + %l0]
	set	0x1C, %g4
	swapa	[%l7 + %g4] 0x81,	%l5
	set	0x6A, %g1
	stha	%l3,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x20, %i5
	stw	%i2,	[%l7 + %i5]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g1
	nop
	set	0x18, %o4
	ldsw	[%l7 + %o4],	%i7
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	nop
	set	0x18, %o7
	lduh	[%l7 + %o7],	%o2
	nop
	set	0x14, %i2
	prefetch	[%l7 + %i2],	 1
	bn,a,pn	%xcc,	loop_94
	nop
	set	0x70, %g7
	stx	%i4,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x6C]
	set	0x4A, %o6
	stha	%o0,	[%l7 + %o6] 0x80
loop_94:
	nop
	set	0x58, %o1
	ldsw	[%l7 + %o1],	%g7
	fpsub16s	%f30,	%f6,	%f1
	bne	%xcc,	loop_95
	nop
	set	0x78, %i1
	stw	%i1,	[%l7 + %i1]
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x89,	%o1
loop_95:
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%i6
	or	%l1,	%l0,	%g3
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	add	%o3,	%i0,	%o7
	nop
	set	0x20, %l3
	std	%l4,	[%l7 + %l3]
	set	0x7B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o5
	set	0x66, %l6
	stha	%g6,	[%l7 + %l6] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%g2
	set	0x32, %g5
	stba	%o6,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x28, %g6
	stda	%o4,	[%l7 + %g6] 0xe3
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%g4
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x81,	 1
	and	%l6,	%l5,	%i2
	set	0x2C, %g2
	sta	%f17,	[%l7 + %g2] 0x80
	set	0x74, %i3
	stha	%l3,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x6E, %l5
	stha	%l2,	[%l7 + %l5] 0x89
	nop
	set	0x0F, %o3
	stb	%i7,	[%l7 + %o3]
	set	0x24, %o2
	swapa	[%l7 + %o2] 0x81,	%o2
	nop
	set	0x67, %o0
	ldstub	[%l7 + %o0],	%g1
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x7C, %o5
	ldstub	[%l7 + %o5],	%o0
	nop
	set	0x15, %i6
	stb	%i4,	[%l7 + %i6]
	add	%g7,	%i1,	%o1
	nop
	set	0x61, %g4
	stb	%l1,	[%l7 + %g4]
	set	0x24, %l0
	lda	[%l7 + %l0] 0x88,	%f14
	nop
	set	0x1E, %i5
	sth	%l0,	[%l7 + %i5]
	set	0x18, %g1
	stwa	%g3,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x6C, %i4
	sta	%f22,	[%l7 + %i4] 0x89
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x22, %i2
	lduh	[%l7 + %i2],	%i6
	bn,pn	%xcc,	loop_96
	nop
	set	0x49, %g7
	stb	%i0,	[%l7 + %g7]
	and	%o3,	%o7,	%o5
	set	0x28, %o6
	lda	[%l7 + %o6] 0x89,	%f28
loop_96:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%g6
	nop
	set	0x68, %o7
	stw	%g5,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	or	%g2,	%o6,	%i5
	or	%g4,	%o4,	%l6
	and	%i3,	%i2,	%l3
	st	%f1,	[%l7 + 0x0C]
	nop
	set	0x60, %o1
	swap	[%l7 + %o1],	%l2
	set	0x24, %l1
	stwa	%l5,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x50, %l4
	stda	%i6,	[%l7 + %l4] 0x80
	nop
	set	0x6E, %l3
	ldsh	[%l7 + %l3],	%g1
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o2
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%o0
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x80,	 2
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x80,	%f26
	ld	[%l7 + 0x2C],	%f4
	set	0x0A, %l6
	stba	%i1,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x4B, %g2
	ldsb	[%l7 + %g2],	%g7
	set	0x30, %i3
	sta	%f16,	[%l7 + %i3] 0x89
	nop
	set	0x54, %l5
	ldub	[%l7 + %l5],	%l1
	fpsub32	%f8,	%f30,	%f18
	set	0x28, %o3
	lda	[%l7 + %o3] 0x81,	%f23
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%o1
	set	0x7E, %o0
	stha	%l0,	[%l7 + %o0] 0x81
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%i6
	set	0x30, %o5
	stda	%g2,	[%l7 + %o5] 0x88
	nop
	set	0x66, %g4
	lduh	[%l7 + %g4],	%o3
	set	0x0F, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o7
	st	%fsr,	[%l7 + 0x34]
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	nop
	set	0x1E, %g1
	sth	%o5,	[%l7 + %g1]
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x81,	%g6
	ld	[%l7 + 0x74],	%f25
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i5
	set	0x70, %i4
	stda	%o6,	[%l7 + %i4] 0xeb
	membar	#Sync
	or	%o4,	%l6,	%i3
	nop
	set	0x5F, %i2
	ldstub	[%l7 + %i2],	%i2
	nop
	set	0x58, %i5
	lduw	[%l7 + %i5],	%l3
	nop
	nop
	setx	0x60558917,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xB7C4A358,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f18,	%f18
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc4
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x3E, %g7
	ldsh	[%l7 + %g7],	%l2
	nop
	set	0x24, %o7
	lduw	[%l7 + %o7],	%l5
	fpsub32s	%f0,	%f10,	%f17
	wr	%g4,	%i7,	%set_softint
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f12
	st	%f0,	[%l7 + 0x40]
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x80,	 3
	set	0x62, %l2
	stha	%g1,	[%l7 + %l2] 0x81
	set	0x70, %o1
	lda	[%l7 + %o1] 0x81,	%f7
	set	0x4A, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o0
	bl,pn	%xcc,	loop_97
	nop
	set	0x55, %i7
	ldub	[%l7 + %i7],	%i1
	set	0x40, %l4
	swapa	[%l7 + %l4] 0x89,	%g7
loop_97:
	nop
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f16
	add	%i4,	%o1,	%l1
	nop
	set	0x10, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%i6
	fpadd16s	%f11,	%f22,	%f9
	set	0x1C, %i0
	lda	[%l7 + %i0] 0x81,	%f5
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x88,	%l0
	set	0x54, %g2
	sta	%f4,	[%l7 + %g2] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%o3
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%i0
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xe3,	%o4
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x89,	%o7
	and	%g6,	%l4,	%g2
	set	0x0C, %l5
	swapa	[%l7 + %l5] 0x88,	%g5
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%i4
	nop
	set	0x28, %o5
	ldsh	[%l7 + %o5],	%o4
	nop
	set	0x57, %i6
	ldsb	[%l7 + %i6],	%l6
	nop
	set	0x18, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x0C, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o6
	nop
	set	0x4D, %o4
	stb	%i2,	[%l7 + %o4]
	set	0x78, %g1
	stda	%l2,	[%l7 + %g1] 0x81
	set	0x64, %i4
	sta	%f10,	[%l7 + %i4] 0x88
	set	0x4F, %i5
	stba	%i3,	[%l7 + %i5] 0xe2
	membar	#Sync
	and	%l2,	%l5,	%i7
	nop
	set	0x18, %i2
	ldsh	[%l7 + %i2],	%g4
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x88
	nop
	set	0x44, %i1
	sth	%o2,	[%l7 + %i1]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xea,	%i0
	set	0x48, %l2
	stxa	%g7,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x6C, %o1
	lduh	[%l7 + %o1],	%o0
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd8
	nop
	set	0x20, %i7
	std	%i4,	[%l7 + %i7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%o1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xd8
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd0
	fpadd16s	%f3,	%f9,	%f14
	ld	[%l7 + 0x34],	%f20
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	set	0x50, %g5
	stxa	%g3,	[%l7 + %g5] 0x81
	nop
	set	0x78, %l6
	std	%f14,	[%l7 + %l6]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x89,	%o3
	set	0x28, %g2
	stda	%i0,	[%l7 + %g2] 0x89
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%o5
	set	0x78, %i0
	sta	%f11,	[%l7 + %i0] 0x81
	or	%o7,	%i6,	%l4
	set	0x50, %o0
	stxa	%g2,	[%l7 + %o0] 0x81
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%g6
	set	0x0E, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g5
	set	0x40, %o5
	swapa	[%l7 + %o5] 0x81,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o6
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%l6
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x81,	%i2
	nop
	set	0x0C, %g4
	lduw	[%l7 + %g4],	%i3
	set	0x18, %l0
	stxa	%l2,	[%l7 + %l0] 0x88
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x89,	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%g4
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%g1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%o2
	nop
	set	0x64, %i5
	stw	%g7,	[%l7 + %i5]
	nop
	set	0x50, %i4
	ldx	[%l7 + %i4],	%o0
	nop
	set	0x14, %i2
	swap	[%l7 + %i2],	%i4
	nop
	set	0x33, %o6
	stb	%i1,	[%l7 + %o6]
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%l0
	nop
	set	0x74, %l1
	ldub	[%l7 + %l1],	%o1
	or	%l0,	%g3,	%i0
	ld	[%l7 + 0x34],	%f21
	nop
	set	0x68, %o7
	std	%o4,	[%l7 + %o7]
	add	%o7,	%i6,	%o3
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%l4
	set	0x29, %l2
	stba	%g6,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x81,	%g2
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x2F, %l3
	ldub	[%l7 + %l3],	%g5
	or	%i5,	%o6,	%i2
	nop
	set	0x50, %g6
	swap	[%l7 + %g6],	%l6
	nop
	set	0x3E, %l4
	sth	%i3,	[%l7 + %l4]
	nop
	set	0x60, %g5
	std	%f24,	[%l7 + %g5]
	set	0x20, %i3
	stxa	%l2,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x78, %l6
	lda	[%l7 + %l6] 0x80,	%f16
	nop
	set	0x20, %o3
	stw	%l3,	[%l7 + %o3]
	nop
	set	0x15, %i0
	ldub	[%l7 + %i0],	%g4
	nop
	set	0x7C, %g2
	stw	%g1,	[%l7 + %g2]
	nop
	set	0x38, %o2
	sth	%i7,	[%l7 + %o2]
	fpsub32s	%f8,	%f12,	%f3
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x88,	%o2
	nop
	set	0x28, %o0
	std	%g6,	[%l7 + %o0]
	set	0x10, %l5
	lda	[%l7 + %l5] 0x89,	%f1
	set	0x64, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o0
	wr	%l5,	%i1,	%y
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x89,	%i4
	add	%l1,	%l0,	%g3
	nop
	set	0x30, %i6
	std	%o0,	[%l7 + %i6]
	ld	[%l7 + 0x44],	%f25
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%o7
	nop
	set	0x08, %g1
	stx	%o5,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x38, %l0
	stx	%i6,	[%l7 + %l0]
	set	0x64, %o4
	stha	%l4,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	nop
	set	0x24, %i2
	lduh	[%l7 + %i2],	%g2
	nop
	set	0x46, %i4
	ldsb	[%l7 + %i4],	%g6
	nop
	set	0x1C, %i1
	prefetch	[%l7 + %i1],	 1
	or	%g5,	%i5,	%o6
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x81
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i3
	nop
	set	0x5B, %o6
	stb	%l6,	[%l7 + %o6]
	set	0x6E, %l2
	stba	%l3,	[%l7 + %l2] 0x89
	wr	%g4,	%l2,	%sys_tick
	or	%g1,	%i7,	%o2
	nop
	set	0x4F, %o1
	ldsb	[%l7 + %o1],	%o0
	nop
	set	0x1A, %i7
	lduh	[%l7 + %i7],	%g7
	set	0x57, %l3
	ldstuba	[%l7 + %l3] 0x89,	%l5
	set	0x0C, %g6
	lda	[%l7 + %g6] 0x81,	%f29
	and	%i4,	%l1,	%i1
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%l0
	bgu,a	%icc,	loop_98
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%o1
	set	0x48, %g5
	stha	%g3,	[%l7 + %g5] 0xea
	membar	#Sync
loop_98:
	st	%f9,	[%l7 + 0x58]
	set	0x3C, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i0
	set	0x10, %l6
	stxa	%o7,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x74, %i0
	swapa	[%l7 + %i0] 0x88,	%i6
	set	0x38, %g2
	swapa	[%l7 + %g2] 0x80,	%o5
	nop
	set	0x68, %o3
	std	%o2,	[%l7 + %o3]
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x88,	%l4
	set	0x34, %o0
	sta	%f11,	[%l7 + %o0] 0x89
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%g6
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%g2
	set	0x38, %g4
	stha	%g5,	[%l7 + %g4] 0x89
	wr	%i5,	%o6,	%clear_softint
	nop
	set	0x28, %i6
	ldsb	[%l7 + %i6],	%i2
	st	%fsr,	[%l7 + 0x18]
	set	0x10, %o5
	stxa	%i3,	[%l7 + %o5] 0x81
	nop
	set	0x28, %g1
	std	%o4,	[%l7 + %g1]
	nop
	set	0x58, %o4
	std	%f8,	[%l7 + %o4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g4
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	set	0x1C, %i5
	lda	[%l7 + %i5] 0x89,	%f24
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g1
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f16
	nop
	set	0x2A, %i4
	ldub	[%l7 + %i4],	%l2
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%i7
	nop
	set	0x66, %o7
	ldstub	[%l7 + %o7],	%o0
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xca
	nop
	set	0x48, %l2
	stx	%g7,	[%l7 + %l2]
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%o2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf0
	membar	#Sync
	nop
	set	0x48, %l3
	swap	[%l7 + %l3],	%l5
	fpsub32	%f22,	%f10,	%f26
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%i1
	nop
	set	0x31, %l4
	ldub	[%l7 + %l4],	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%g3
	st	%fsr,	[%l7 + 0x24]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%o7
	set	0x7C, %i7
	sta	%f19,	[%l7 + %i7] 0x81
	set	0x10, %g5
	stwa	%i0,	[%l7 + %g5] 0x88
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	nop
	set	0x2D, %i0
	stb	%o3,	[%l7 + %i0]
	nop
	set	0x68, %g2
	stx	%i6,	[%l7 + %g2]
	nop
	nop
	setx	0xC0AB0AA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x6D9342B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f30,	%f9
	set	0x3C, %o3
	swapa	[%l7 + %o3] 0x88,	%l4
	wr 	%g0, 	0x6, 	%fprs
	add	%i5,	%g6,	%o6
	nop
	set	0x70, %o2
	ldsh	[%l7 + %o2],	%i3
	set	0x13, %o0
	stba	%o4,	[%l7 + %o0] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i2
	nop
	set	0x7C, %g3
	prefetch	[%l7 + %g3],	 0
	add	%l6,	%g1,	%l2
	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	nop
	setx	0xA9EA71849C5289C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1321978EF299A688,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f30
	fpadd32s	%f7,	%f8,	%f14
	wr	%i7,	%g4,	%sys_tick
	nop
	set	0x60, %g4
	prefetch	[%l7 + %g4],	 4
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x80,	%o0
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x81,	%o2
	nop
	set	0x10, %g1
	stw	%g7,	[%l7 + %g1]
	nop
	set	0x28, %o4
	std	%i4,	[%l7 + %o4]
	set	0x70, %o5
	stwa	%i1,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x54, %l0
	ldsh	[%l7 + %l0],	%l0
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%l5
	nop
	set	0x60, %i4
	stw	%o1,	[%l7 + %i4]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf0
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l1
	nop
	set	0x50, %i1
	lduw	[%l7 + %i1],	%o7
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%i0
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xcc
	ld	[%l7 + 0x68],	%f17
	set	0x6C, %l2
	sta	%f20,	[%l7 + %l2] 0x80
	nop
	set	0x6A, %o6
	stb	%o3,	[%l7 + %o6]
	nop
	set	0x40, %l3
	std	%f12,	[%l7 + %l3]
	nop
	set	0x62, %g6
	sth	%i6,	[%l7 + %g6]
	nop
	set	0x33, %o1
	ldsb	[%l7 + %o1],	%l4
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x80,	%o5
	nop
	set	0x7B, %i7
	ldstub	[%l7 + %i7],	%g2
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xeb,	%i4
	nop
	set	0x08, %l6
	std	%f4,	[%l7 + %l6]
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%g6
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f2
	bleu	%xcc,	loop_99
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%o6
	nop
	set	0x24, %o2
	prefetch	[%l7 + %o2],	 2
	add	%g5,	%i3,	%o4
loop_99:
	bg	%icc,	loop_100
	or	%l3,	%l6,	%g1
	set	0x50, %o3
	stda	%l2,	[%l7 + %o3] 0x88
loop_100:
	nop
	set	0x58, %o0
	stx	%i2,	[%l7 + %o0]
	set	0x1C, %g3
	lda	[%l7 + %g3] 0x89,	%f6
	ld	[%l7 + 0x58],	%f0
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%g4
	set	0x3C, %i6
	stwa	%o0,	[%l7 + %i6] 0x81
	set	0x1C, %l5
	lda	[%l7 + %l5] 0x89,	%f21
	nop
	set	0x64, %g4
	swap	[%l7 + %g4],	%o2
	nop
	set	0x1A, %o4
	ldsh	[%l7 + %o4],	%i7
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xea,	%g6
	add	%i4,	%l0,	%l5
	nop
	set	0x78, %l0
	std	%f20,	[%l7 + %l0]
	and	%i1,	%o1,	%l1
	set	0x35, %i5
	stba	%g3,	[%l7 + %i5] 0xea
	membar	#Sync
	ld	[%l7 + 0x40],	%f24
	nop
	set	0x57, %o5
	ldub	[%l7 + %o5],	%o7
	set	0x48, %i2
	stda	%i0,	[%l7 + %i2] 0x89
	or	%o3,	%i6,	%o5
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc0
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f12
	wr	%g2,	%l4,	%softint
	nop
	set	0x10, %o7
	ldub	[%l7 + %o7],	%i5
	nop
	set	0x60, %l2
	stw	%g6,	[%l7 + %l2]
	or	%o6,	%i3,	%g5
	add	%o4,	%l6,	%g1
	set	0x16, %i1
	stha	%l3,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x08, %o6
	ldsw	[%l7 + %o6],	%l2
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f6
	set	0x70, %o1
	stba	%g4,	[%l7 + %o1] 0x80
	nop
	set	0x6C, %l4
	stw	%i2,	[%l7 + %l4]
	nop
	set	0x24, %i7
	ldsh	[%l7 + %i7],	%o0
	ld	[%l7 + 0x48],	%f21
	set	0x38, %g6
	stda	%o2,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x38, %g5
	stxa	%g7,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%i6
	set	0x68, %g2
	stxa	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	or	%l5,	%i1,	%o1
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x88,	%f12
	wr	%l1,	%g3,	%pic
	fpsub32	%f26,	%f6,	%f4
	fpadd16s	%f2,	%f13,	%f31
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xca
	add	%i0,	%o3,	%o7
	nop
	set	0x35, %o2
	stb	%o5,	[%l7 + %o2]
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	ld	[%l7 + 0x60],	%f12
	nop
	set	0x41, %i3
	stb	%l4,	[%l7 + %i3]
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%i4
	set	0x1C, %l5
	sta	%f7,	[%l7 + %l5] 0x81
	fpsub16	%f4,	%f22,	%f22
	nop
	set	0x4C, %i6
	stw	%g6,	[%l7 + %i6]
	set	0x3C, %o4
	stha	%g2,	[%l7 + %o4] 0x80
	set	0x62, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i3
	set	0x24, %g1
	swapa	[%l7 + %g1] 0x88,	%g5
	set	0x60, %i5
	stha	%o4,	[%l7 + %i5] 0x88
	nop
	set	0x34, %l0
	stw	%l6,	[%l7 + %l0]
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x70, %i4
	std	%f20,	[%l7 + %i4]
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%o6
	set	0x68, %o7
	ldxa	[%l7 + %o7] 0x89,	%l3
	nop
	set	0x1C, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x60, %i2
	std	%f2,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x13, %o6
	ldstub	[%l7 + %o6],	%l2
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%g1
	set	0x4C, %l3
	swapa	[%l7 + %l3] 0x81,	%g4
	set	0x38, %l4
	stha	%o0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x30, %o1
	stwa	%o2,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x88,	%g6
	set	0x62, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i2
	nop
	set	0x22, %g6
	sth	%i7,	[%l7 + %g6]
	set	0x54, %g2
	lda	[%l7 + %g2] 0x81,	%f7
	st	%f0,	[%l7 + 0x7C]
	ld	[%l7 + 0x3C],	%f4
	nop
	set	0x08, %g7
	std	%l4,	[%l7 + %g7]
	nop
	set	0x34, %l6
	lduh	[%l7 + %l6],	%i1
	nop
	set	0x68, %o3
	std	%f0,	[%l7 + %o3]
	nop
	set	0x08, %o2
	swap	[%l7 + %o2],	%o1
	nop
	set	0x50, %i0
	stx	%i4,	[%l7 + %i0]
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l1
	and	%g3,	%l0,	%i0
	set	0x08, %g3
	lda	[%l7 + %g3] 0x80,	%f1
	set	0x24, %o0
	swapa	[%l7 + %o0] 0x81,	%o3
	nop
	set	0x10, %i6
	std	%f14,	[%l7 + %i6]
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f0
	nop
	set	0x2C, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x78, %i5
	stda	%o6,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x50, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o5
	ld	[%l7 + 0x4C],	%f24
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x89,	%l4
	set	0x6C, %o5
	stwa	%i6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x74, %l1
	stb	%g6,	[%l7 + %l1]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc0
	set	0x15, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i5
	set	0x64, %i2
	lda	[%l7 + %i2] 0x80,	%f22
	set	0x54, %o6
	sta	%f22,	[%l7 + %o6] 0x88
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x81,	%i3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xeb,	%g2
	set	0x3C, %l4
	stwa	%g5,	[%l7 + %l4] 0xea
	membar	#Sync
	and	%o4,	%l6,	%l3
	st	%f0,	[%l7 + 0x4C]
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%o6
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f0
	set	0x08, %g5
	stxa	%l2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x30, %g6
	std	%g0,	[%l7 + %g6]
	ld	[%l7 + 0x14],	%f9
	nop
	set	0x1C, %g2
	ldstub	[%l7 + %g2],	%o0
	set	0x60, %i7
	stba	%o2,	[%l7 + %i7] 0x80
	set	0x30, %g7
	lda	[%l7 + %g7] 0x81,	%f7
	set	0x60, %l6
	stxa	%g4,	[%l7 + %l6] 0x81
	set	0x2B, %o2
	stba	%i2,	[%l7 + %o2] 0x81
	nop
	set	0x28, %i0
	lduh	[%l7 + %i0],	%g7
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%i7
	bg	%icc,	loop_101
	or	%l5,	%o1,	%i1
	set	0x40, %g3
	swapa	[%l7 + %g3] 0x89,	%i4
loop_101:
	nop
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x81,	 1
	set	0x10, %o0
	stwa	%l1,	[%l7 + %o0] 0x88
	nop
	set	0x16, %o4
	sth	%l0,	[%l7 + %o4]
	and	%i0,	%o7,	%o3
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x88,	 3
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f0
	ld	[%l7 + 0x10],	%f13
	set	0x38, %i6
	lda	[%l7 + %i6] 0x81,	%f5
	nop
	set	0x50, %g1
	stb	%i6,	[%l7 + %g1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%o5
	nop
	set	0x38, %o5
	ldsw	[%l7 + %o5],	%i5
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%g2
	nop
	set	0x5C, %i4
	sth	%g5,	[%l7 + %i4]
	add	%o4,	%i3,	%l3
	nop
	set	0x6B, %l1
	ldub	[%l7 + %l1],	%l6
	nop
	set	0x2C, %o7
	stw	%o6,	[%l7 + %o7]
	set	0x2D, %o6
	stba	%l2,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x10, %i2
	swap	[%l7 + %i2],	%o0
	fpadd16	%f8,	%f26,	%f0
	ld	[%l7 + 0x4C],	%f1
	fpadd16	%f26,	%f6,	%f26
	nop
	set	0x58, %i1
	stx	%g1,	[%l7 + %i1]
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x81,	 3
	nop
	set	0x47, %l4
	ldstub	[%l7 + %l4],	%o2
	and	%g7,	%i2,	%l5
	set	0x20, %l3
	sta	%f29,	[%l7 + %l3] 0x80
	set	0x4C, %g5
	swapa	[%l7 + %g5] 0x81,	%i7
	nop
	set	0x42, %o1
	lduh	[%l7 + %o1],	%o1
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x88,	%i4
	add	%i1,	%g3,	%l0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f0
	and	%l1,	%o7,	%i0
	nop
	set	0x70, %i7
	ldsw	[%l7 + %i7],	%l4
	set	0x20, %g7
	stha	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%o3
	nop
	set	0x68, %o2
	ldsw	[%l7 + %o2],	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%g2
	or	%o4,	%i3,	%l3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o6
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x28, %i0
	std	%f30,	[%l7 + %i0]
	nop
	set	0x2D, %l6
	ldsb	[%l7 + %l6],	%l2
	set	0x12, %o3
	stba	%g5,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x6C, %i3
	ldsh	[%l7 + %i3],	%g1
	add	%g4,	%o0,	%g7
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%l5
	set	0x44, %o4
	lda	[%l7 + %o4] 0x81,	%f23
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%i7
	add	%o1,	%i4,	%i1
	nop
	set	0x28, %g4
	lduh	[%l7 + %g4],	%o2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f0
	set	0x30, %i6
	stxa	%l0,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x38, %l5
	stxa	%l1,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x30, %o5
	stxa	%o7,	[%l7 + %o5] 0xe2
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%l4
	nop
	set	0x68, %g1
	std	%g2,	[%l7 + %g1]
	ld	[%l7 + 0x6C],	%f10
	nop
	set	0x7A, %i4
	sth	%i6,	[%l7 + %i4]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf8
	membar	#Sync
	set	0x34, %o7
	sta	%f26,	[%l7 + %o7] 0x81
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x80,	%o2
	or	%i5,	%o5,	%g2
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x81,	%g6
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%o4
	set	0x68, %o6
	stxa	%l6,	[%l7 + %o6] 0x80
	nop
	set	0x22, %l2
	sth	%o6,	[%l7 + %l2]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%l2
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x80,	 1
	wr	%g4,	%o0,	%pic
	nop
	set	0x58, %g5
	stx	%g1,	[%l7 + %g5]
	nop
	set	0x10, %o1
	swap	[%l7 + %o1],	%g7
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x2C, %g6
	swap	[%l7 + %g6],	%i2
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%i7
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o1
	set	0x70, %g2
	stda	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x08, %o2
	ldstub	[%l7 + %o2],	%i1
	set	0x30, %i0
	sta	%f5,	[%l7 + %i0] 0x81
	nop
	set	0x2C, %l6
	swap	[%l7 + %l6],	%o2
	nop
	set	0x4C, %o3
	sth	%l5,	[%l7 + %o3]
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%l0
	nop
	set	0x44, %g7
	stw	%o7,	[%l7 + %g7]
	nop
	set	0x0F, %g3
	ldstub	[%l7 + %g3],	%i0
	nop
	set	0x7F, %o0
	stb	%l4,	[%l7 + %o0]
	set	0x0C, %o4
	stba	%l0,	[%l7 + %o4] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%o3
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x89
	nop
	set	0x4C, %l5
	stb	%i5,	[%l7 + %l5]
	bne,a	%icc,	loop_102
	nop
	set	0x7C, %i6
	lduh	[%l7 + %i6],	%o5
	nop
	set	0x58, %g1
	std	%f0,	[%l7 + %g1]
	set	0x0B, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g2
loop_102:
	nop
	set	0x6E, %i4
	stba	%i6,	[%l7 + %i4] 0x80
	nop
	set	0x56, %l1
	lduh	[%l7 + %l1],	%g6
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x88,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB09, 	%sys_tick_cmpr
	set	0x40, %o7
	sta	%f22,	[%l7 + %o7] 0x88
	or	%o6,	%l2,	%l3
	st	%fsr,	[%l7 + 0x0C]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%g5
	nop
	set	0x60, %i2
	std	%g0,	[%l7 + %i2]
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%g6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc4
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf9
	membar	#Sync
	nop
	set	0x50, %o1
	std	%o0,	[%l7 + %o1]
	wr	%i7,	%i2,	%y
	ld	[%l7 + 0x20],	%f0
	fpsub32s	%f4,	%f13,	%f30
	set	0x36, %o6
	stha	%o1,	[%l7 + %o6] 0x81
	nop
	set	0x24, %g6
	sth	%i4,	[%l7 + %g6]
	set	0x70, %i7
	sta	%f28,	[%l7 + %i7] 0x80
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f14
	or	%i1,	%l5,	%l1
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%i0
	set	0x14, %i0
	stwa	%o7,	[%l7 + %i0] 0x80
	nop
	set	0x3F, %o2
	stb	%l0,	[%l7 + %o2]
	set	0x21, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g3
	fpsub32s	%f5,	%f23,	%f19
	or	%o3,	%l4,	%i5
	and	%g2,	%o5,	%g6
	add	%i3,	%l6,	%o4
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%o6
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%i6
	set	0x6E, %g3
	stha	%l2,	[%l7 + %g3] 0x81
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%l2
	wr	%g4,	%g1,	%sys_tick
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%g7
	nop
	set	0x44, %o4
	ldsb	[%l7 + %o4],	%o0
	nop
	set	0x7C, %g4
	stw	%g5,	[%l7 + %g4]
	nop
	set	0x18, %i5
	std	%f24,	[%l7 + %i5]
	ld	[%l7 + 0x6C],	%f7
	nop
	set	0x30, %i6
	ldub	[%l7 + %i6],	%i2
	set	0x14, %g1
	swapa	[%l7 + %g1] 0x80,	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%i1
	set	0x30, %l5
	lda	[%l7 + %l5] 0x89,	%f27
	nop
	set	0x2C, %i4
	stw	%i4,	[%l7 + %i4]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%l5
	and	%o2,	%i0,	%o7
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%g3
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x81,	%l0
	and	%l4,	%o3,	%g2
	nop
	set	0x26, %o7
	ldub	[%l7 + %o7],	%o5
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%i5
	set	0x10, %i2
	stwa	%g6,	[%l7 + %i2] 0x81
	be,pn	%icc,	loop_103
	nop
	set	0x2B, %l2
	ldstub	[%l7 + %l2],	%l6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd0
loop_103:
	nop
	set	0x4D, %o1
	stb	%o4,	[%l7 + %o1]
	ld	[%l7 + 0x58],	%f23
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x80,	%o6
	or	%i3,	%l2,	%l3
	nop
	set	0x38, %g6
	std	%i6,	[%l7 + %g6]
	set	0x54, %i7
	stwa	%g1,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x58, %g5
	sta	%f17,	[%l7 + %g5] 0x88
	set	0x78, %l3
	stda	%g4,	[%l7 + %l3] 0x88
	set	0x09, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g7
	nop
	set	0x18, %o2
	stx	%g5,	[%l7 + %o2]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%i2
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x89,	%o0
	and	%i7,	%i1,	%i4
	set	0x48, %g2
	stxa	%l1,	[%l7 + %g2] 0x89
	and	%o2,	%i0,	%l5
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xe3,	%g2
	nop
	set	0x68, %i3
	swap	[%l7 + %i3],	%o7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xBBD, 	%tick_cmpr
	nop
	set	0x67, %g3
	stb	%l0,	[%l7 + %g3]
	set	0x70, %g7
	stba	%g2,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x30, %o0
	stxa	%i5,	[%l7 + %o0] 0xeb
	membar	#Sync
	and	%g6,	%l6,	%o5
	nop
	set	0x50, %o4
	std	%o6,	[%l7 + %o4]
	nop
	set	0x48, %g4
	stx	%i3,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x14]
	set	0x50, %i6
	sta	%f21,	[%l7 + %i6] 0x81
	or	%o4,	%l2,	%l3
	set	0x54, %g1
	stwa	%g1,	[%l7 + %g1] 0x81
	set	0x64, %l5
	swapa	[%l7 + %l5] 0x89,	%g4
	nop
	set	0x30, %i5
	std	%f6,	[%l7 + %i5]
	nop
	set	0x18, %o5
	lduw	[%l7 + %o5],	%i6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	set	0x68, %i4
	swapa	[%l7 + %i4] 0x81,	%g5
	set	0x2C, %o7
	sta	%f18,	[%l7 + %o7] 0x80
	set	0x4A, %i1
	stha	%g7,	[%l7 + %i1] 0x88
	set	0x08, %l1
	stda	%i2,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x5C, %l2
	sta	%f27,	[%l7 + %l2] 0x89
	wr	%o1,	%i7,	%pic
	nop
	set	0x74, %l4
	swap	[%l7 + %l4],	%o0
	nop
	set	0x08, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x30, %o1
	lduh	[%l7 + %o1],	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o2
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%i0
	set	0x34, %i7
	stwa	%l1,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x89,	%l5
	and	%g3,	%l4,	%o3
	st	%fsr,	[%l7 + 0x1C]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc0
	or	%l0,	%g2,	%i5
	nop
	set	0x5A, %l3
	ldsb	[%l7 + %l3],	%g6
	or	%o7,	%o5,	%l6
	nop
	set	0x78, %o2
	stx	%fsr,	[%l7 + %o2]
	or	%o6,	%o4,	%l2
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%f26
	nop
	set	0x44, %g2
	lduw	[%l7 + %g2],	%l3
	nop
	set	0x1E, %i0
	ldsh	[%l7 + %i0],	%g1
	nop
	set	0x2E, %o3
	ldub	[%l7 + %o3],	%i3
	nop
	set	0x6C, %i3
	lduw	[%l7 + %i3],	%i6
	nop
	set	0x50, %g3
	lduh	[%l7 + %g3],	%g5
	nop
	set	0x4C, %g7
	ldsh	[%l7 + %g7],	%g7
	nop
	set	0x50, %o0
	ldsw	[%l7 + %o0],	%i2
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%i7
	nop
	set	0x77, %o4
	ldub	[%l7 + %o4],	%o0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%o2
	nop
	set	0x48, %i6
	std	%f4,	[%l7 + %i6]
	nop
	set	0x29, %g1
	stb	%i0,	[%l7 + %g1]
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x81,	%l0
	set	0x4D, %l5
	stba	%i1,	[%l7 + %l5] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f0
	nop
	set	0x4A, %i4
	lduh	[%l7 + %i4],	%l5
	st	%fsr,	[%l7 + 0x7C]
	st	%f14,	[%l7 + 0x18]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf9
	membar	#Sync
	nop
	set	0x46, %o5
	lduh	[%l7 + %o5],	%g3
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%l4
	set	0x34, %l1
	lda	[%l7 + %l1] 0x89,	%f9
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x2E, %l4
	ldsh	[%l7 + %l4],	%i5
	set	0x16, %l2
	stha	%l0,	[%l7 + %l2] 0xea
	membar	#Sync
	or	%g6,	%o7,	%o5
	nop
	set	0x1A, %o1
	sth	%l6,	[%l7 + %o1]
	nop
	set	0x30, %i2
	lduh	[%l7 + %i2],	%o4
	set	0x28, %i7
	stda	%l2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x4C, %o6
	stw	%o6,	[%l7 + %o6]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf1
	membar	#Sync
	set	0x68, %l3
	stwa	%l3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x68, %g6
	std	%i2,	[%l7 + %g6]
	nop
	set	0x3C, %l6
	ldsw	[%l7 + %l6],	%g1
	set	0x78, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i6
	nop
	set	0x40, %i0
	std	%g6,	[%l7 + %i0]
	nop
	set	0x65, %o3
	ldub	[%l7 + %o3],	%g5
	nop
	set	0x3C, %i3
	lduw	[%l7 + %i3],	%i2
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x81,	%g4
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%i7
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x88,	%o1
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%o0
	set	0x3C, %o4
	sta	%f19,	[%l7 + %o4] 0x81
	and	%i4,	%o2,	%l1
	set	0x60, %g1
	stxa	%i1,	[%l7 + %g1] 0x80
	or	%l5,	%i0,	%g3
	nop
	set	0x40, %i5
	std	%f14,	[%l7 + %i5]
	st	%f7,	[%l7 + 0x48]
	nop
	set	0x48, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x21, %i4
	ldstub	[%l7 + %i4],	%l4
	wr	%o3,	%g2,	%ccr
	nop
	set	0x14, %o7
	stw	%l0,	[%l7 + %o7]
	bgu,a,pt	%xcc,	loop_104
	nop
	set	0x16, %l5
	stb	%g6,	[%l7 + %l5]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o5
loop_104:
	nop
	set	0x20, %o5
	ldsw	[%l7 + %o5],	%l6
	nop
	set	0x14, %l1
	swap	[%l7 + %l1],	%o4
	set	0x55, %l4
	ldstuba	[%l7 + %l4] 0x81,	%l2
	set	0x34, %l2
	swapa	[%l7 + %l2] 0x89,	%o7
	set	0x24, %i1
	lda	[%l7 + %i1] 0x88,	%f16
	set	0x5C, %i2
	stba	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	set	0x60, %i7
	swapa	[%l7 + %i7] 0x89,	%i3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%i6
	and	%g7,	%g1,	%g5
	add	%g4,	%i7,	%o1
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%o0
	nop
	set	0x0A, %g5
	lduh	[%l7 + %g5],	%i4
	add	%o2,	%i2,	%l1
	set	0x40, %l3
	stda	%i0,	[%l7 + %l3] 0x81
	add	%i0,	%g3,	%l5
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x80,	%l4
	nop
	set	0x3C, %l6
	stw	%g2,	[%l7 + %l6]
	set	0x54, %o6
	stwa	%l0,	[%l7 + %o6] 0xe2
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%i5
	st	%f4,	[%l7 + 0x20]
	set	0x48, %i0
	swapa	[%l7 + %i0] 0x80,	%o3
	st	%f16,	[%l7 + 0x54]
	nop
	set	0x08, %o3
	stw	%o5,	[%l7 + %o3]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd8
	or	%l6,	%o4,	%o7
	nop
	set	0x28, %i3
	std	%f6,	[%l7 + %i3]
	nop
	set	0x70, %g7
	stx	%o6,	[%l7 + %g7]
	nop
	set	0x50, %g3
	stx	%i3,	[%l7 + %g3]
	nop
	set	0x2C, %o2
	stw	%l3,	[%l7 + %o2]
	set	0x60, %o0
	lda	[%l7 + %o0] 0x81,	%f16
	nop
	set	0x58, %o4
	stx	%l2,	[%l7 + %o4]
	nop
	set	0x3A, %g4
	stb	%g7,	[%l7 + %g4]
	nop
	set	0x30, %i5
	std	%g0,	[%l7 + %i5]
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x74, %g1
	stwa	%g5,	[%l7 + %g1] 0x88
	nop
	set	0x70, %i4
	std	%g4,	[%l7 + %i4]
	nop
	set	0x13, %l0
	ldub	[%l7 + %l0],	%i6
	set	0x2D, %l5
	stba	%o1,	[%l7 + %l5] 0x81
	set	0x3C, %o7
	swapa	[%l7 + %o7] 0x89,	%i7
	set	0x50, %l1
	stwa	%o0,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x6E, %o5
	stha	%i4,	[%l7 + %o5] 0x81
	set	0x70, %l4
	stxa	%o2,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x14, %l2
	stw	%l1,	[%l7 + %l2]
	nop
	set	0x6A, %i1
	sth	%i1,	[%l7 + %i1]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x80
	add	%i2,	%g3,	%i0
	nop
	nop
	setx	0x7A59EC671207C937,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x953AAC48AD81515B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f10,	%f2
	nop
	set	0x6C, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x10, %o1
	ldsw	[%l7 + %o1],	%l4
	ld	[%l7 + 0x68],	%f23
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l5
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%g6
	and	%i5,	%l0,	%o5
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x48, %g5
	stw	%o7,	[%l7 + %g5]
	set	0x68, %g6
	sta	%f29,	[%l7 + %g6] 0x81
	set	0x13, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o4
	nop
	set	0x15, %i0
	stb	%i3,	[%l7 + %i0]
	st	%f2,	[%l7 + 0x78]
	add	%l3,	%o6,	%l2
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f0
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x88,	%g1
	set	0x2A, %i3
	stha	%g7,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x0F, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g4
	set	0x36, %g2
	stha	%g5,	[%l7 + %g2] 0x81
	nop
	set	0x30, %o2
	swap	[%l7 + %o2],	%i6
	nop
	set	0x58, %o0
	lduw	[%l7 + %o0],	%i7
	set	0x0E, %g3
	stha	%o0,	[%l7 + %g3] 0x89
	nop
	set	0x48, %o4
	std	%i4,	[%l7 + %o4]
	nop
	set	0x2F, %i5
	stb	%o2,	[%l7 + %i5]
	nop
	set	0x64, %g4
	lduw	[%l7 + %g4],	%o1
	set	0x58, %g1
	stxa	%l1,	[%l7 + %g1] 0x88
	set	0x40, %i6
	stxa	%i1,	[%l7 + %i6] 0x89
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x88,	%g2
	nop
	set	0x40, %l0
	ldsb	[%l7 + %l0],	%i0
	nop
	set	0x18, %o7
	std	%f12,	[%l7 + %o7]
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%l4
	wr	%g2,	%l5,	%clear_softint
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f16
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xd0
	nop
	set	0x08, %l2
	lduw	[%l7 + %l2],	%i2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%l0
	set	0x14, %l4
	ldstuba	[%l7 + %l4] 0x88,	%g6
	nop
	set	0x18, %i1
	lduw	[%l7 + %i1],	%o5
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%o3
	or	%o7,	%l6,	%i3
	fpadd32s	%f10,	%f11,	%f25
	set	0x24, %o1
	lda	[%l7 + %o1] 0x88,	%f18
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x81,	%l3
	nop
	set	0x3E, %l3
	ldstub	[%l7 + %l3],	%o6
	set	0x38, %g6
	stha	%l2,	[%l7 + %g6] 0xea
	membar	#Sync
	ld	[%l7 + 0x10],	%f17
	or	%g1,	%o4,	%g4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd2,	%f16
	set	0x10, %i0
	stxa	%g7,	[%l7 + %i0] 0x88
	nop
	set	0x3A, %g5
	sth	%i6,	[%l7 + %g5]
	nop
	set	0x1C, %l6
	ldstub	[%l7 + %l6],	%g5
	set	0x44, %i3
	stwa	%i7,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x64, %g7
	sta	%f15,	[%l7 + %g7] 0x89
	nop
	set	0x50, %g2
	ldsw	[%l7 + %g2],	%o0
	nop
	set	0x40, %o2
	prefetch	[%l7 + %o2],	 1
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x81,	%i4
	nop
	set	0x4C, %g3
	swap	[%l7 + %g3],	%o2
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%l1
	nop
	set	0x38, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x18, %g4
	stx	%o1,	[%l7 + %g4]
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%g3
	set	0x0E, %i6
	stba	%i0,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x88,	 1
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f0
	set	0x50, %o7
	stxa	%l4,	[%l7 + %o7] 0x81
	set	0x50, %l0
	stda	%g2,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x74, %l5
	stha	%l5,	[%l7 + %l5] 0x80
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 0
	or	%i2,	%i5,	%g6
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%o4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf8
	membar	#Sync
	nop
	set	0x7A, %i1
	ldub	[%l7 + %i1],	%l0
	set	0x1C, %l4
	swapa	[%l7 + %l4] 0x88,	%o7
	set	0x68, %o1
	sta	%f4,	[%l7 + %o1] 0x88
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%f0
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f30
	nop
	set	0x10, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x38, %o6
	stwa	%o3,	[%l7 + %o6] 0x88
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x30, %g5
	ldstub	[%l7 + %g5],	%l6
	nop
	set	0x1C, %i0
	ldsw	[%l7 + %i0],	%l3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%o4
	set	0x50, %l6
	stxa	%g7,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%i6
	nop
	set	0x66, %g7
	ldsh	[%l7 + %g7],	%g5
	st	%fsr,	[%l7 + 0x3C]
	and	%g4,	%o0,	%i7
	set	0x38, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o2
	set	0x0D, %o2
	stba	%i4,	[%l7 + %o2] 0x89
	nop
	set	0x20, %g3
	ldsh	[%l7 + %g3],	%o1
	nop
	set	0x39, %o3
	ldub	[%l7 + %o3],	%g3
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x80,	 1
	set	0x10, %i5
	ldxa	[%l7 + %i5] 0x81,	%l1
	or	%l4,	%g2,	%l5
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x88,	%i2
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	wr	%g6,	%i1,	%sys_tick
	set	0x6E, %g1
	stha	%l0,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x1C, %i6
	sta	%f21,	[%l7 + %i6] 0x88
	set	0x50, %i4
	sta	%f4,	[%l7 + %i4] 0x81
	set	0x5C, %l0
	swapa	[%l7 + %l0] 0x81,	%o5
	set	0x3A, %o7
	stba	%o7,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x38, %l1
	stda	%i2,	[%l7 + %l1] 0x80
	set	0x3C, %l5
	lda	[%l7 + %l5] 0x81,	%f15
	set	0x70, %o5
	stwa	%l6,	[%l7 + %o5] 0xe3
	membar	#Sync
	or	%o3,	%o6,	%l2
	set	0x3A, %i1
	stha	%g1,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x6C, %o1
	swapa	[%l7 + %o1] 0x80,	%o4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%g7
	nop
	set	0x40, %i7
	ldsb	[%l7 + %i7],	%g5
	nop
	set	0x43, %l2
	ldub	[%l7 + %l2],	%g4
	set	0x74, %g6
	stwa	%i6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x89,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o0
	set	0x51, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o1
	set	0x13, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g3
	set	0x28, %i0
	stxa	%i0,	[%l7 + %i0] 0x89
	or	%l1,	%l4,	%g2
	set	0x70, %l6
	lda	[%l7 + %l6] 0x80,	%f7
	set	0x48, %i3
	stha	%i4,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x34, %g7
	stwa	%i2,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x26, %g2
	ldsb	[%l7 + %g2],	%l5
	nop
	set	0x7C, %o2
	swap	[%l7 + %o2],	%i5
	add	%i1,	%l0,	%o5
	st	%f7,	[%l7 + 0x60]
	nop
	set	0x12, %l3
	ldsb	[%l7 + %l3],	%o7
	st	%f26,	[%l7 + 0x34]
	ld	[%l7 + 0x3C],	%f16
	nop
	set	0x7C, %o3
	lduh	[%l7 + %o3],	%i3
	nop
	set	0x40, %o0
	swap	[%l7 + %o0],	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%o3
	ble,a,pt	%icc,	loop_105
	nop
	set	0x1C, %g3
	ldstub	[%l7 + %g3],	%l2
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%g0
	wr 	%g0, 	0x6, 	%fprs
loop_105:
	nop
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x80,	 1
	nop
	set	0x58, %g4
	std	%g4,	[%l7 + %g4]
	set	0x30, %i6
	stda	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	and	%g4,	%i6,	%o2
	set	0x34, %g1
	swapa	[%l7 + %g1] 0x80,	%i7
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f0
	nop
	set	0x38, %o7
	lduw	[%l7 + %o7],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%l1
	and	%l4,	%g2,	%i2
	set	0x72, %l1
	stha	%l5,	[%l7 + %l1] 0x88
	nop
	set	0x30, %i4
	stx	%fsr,	[%l7 + %i4]
	and	%i5,	%i4,	%i1
	nop
	set	0x12, %o5
	ldsh	[%l7 + %o5],	%o5
	set	0x28, %l5
	stxa	%l0,	[%l7 + %l5] 0x89
	set	0x78, %l4
	stwa	%i3,	[%l7 + %l4] 0xe2
	membar	#Sync
	fpadd32	%f20,	%f22,	%f10
	set	0x14, %o1
	stba	%o7,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x20, %i7
	ldsw	[%l7 + %i7],	%l6
	fpsub16s	%f17,	%f22,	%f10
	nop
	set	0x5C, %l2
	ldsw	[%l7 + %l2],	%o3
	nop
	set	0x6D, %g6
	ldsb	[%l7 + %g6],	%g6
	nop
	set	0x1C, %i1
	ldsb	[%l7 + %i1],	%l2
	nop
	set	0x16, %i2
	ldsh	[%l7 + %i2],	%g1
	set	0x54, %o6
	stha	%o6,	[%l7 + %o6] 0x81
	nop
	set	0x5C, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%f0
	nop
	set	0x74, %i0
	ldsh	[%l7 + %i0],	%o4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f16
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%g4
	nop
	set	0x28, %o2
	std	%i6,	[%l7 + %o2]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%i7
	nop
	set	0x7C, %l3
	lduw	[%l7 + %l3],	%g7
	nop
	set	0x2F, %o3
	stb	%o1,	[%l7 + %o3]
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f22
	nop
	set	0x70, %o0
	std	%f24,	[%l7 + %o0]
	set	0x28, %i5
	stba	%i0,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%g3
	add	%l1,	%l4,	%o0
	nop
	set	0x17, %g4
	stb	%i2,	[%l7 + %g4]
	nop
	set	0x58, %i6
	stx	%g2,	[%l7 + %i6]
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%i5
	set	0x70, %g1
	stda	%l4,	[%l7 + %g1] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i1
	nop
	set	0x46, %l1
	sth	%o5,	[%l7 + %l1]
	nop
	set	0x50, %i4
	stw	%i3,	[%l7 + %i4]
	nop
	set	0x0A, %o7
	sth	%o7,	[%l7 + %o7]
	nop
	nop
	setx	0x9DA2224D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9305B533,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f24,	%f0
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xe2,	%i6
	nop
	set	0x18, %l4
	swap	[%l7 + %l4],	%l0
	bge,a,pn	%xcc,	loop_106
	and	%g6,	%o3,	%g1
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc8
loop_106:
	nop
	set	0x10, %o5
	stx	%o6,	[%l7 + %o5]
	add	%o4,	%l3,	%g5
	nop
	set	0x24, %l2
	stw	%l2,	[%l7 + %l2]
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x88,	%i6
	ld	[%l7 + 0x08],	%f12
	set	0x50, %i1
	lda	[%l7 + %i1] 0x81,	%f5
	set	0x40, %i2
	stxa	%o2,	[%l7 + %i2] 0x80
	nop
	set	0x64, %o6
	lduh	[%l7 + %o6],	%i7
	nop
	set	0x60, %g6
	ldsb	[%l7 + %g6],	%g4
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%g7
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x89,	%o0
	nop
	set	0x60, %g7
	std	%f24,	[%l7 + %g7]
	ld	[%l7 + 0x6C],	%f7
	set	0x3C, %g2
	stha	%g3,	[%l7 + %g2] 0x89
	nop
	set	0x5C, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
	set	0x1C, %l3
	stwa	%l4,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x50, %o3
	ldda	[%l7 + %o3] 0xe2,	%o0
	nop
	set	0x40, %g3
	std	%i0,	[%l7 + %g3]
	set	0x34, %o0
	sta	%f21,	[%l7 + %o0] 0x89
	nop
	set	0x6F, %o4
	ldub	[%l7 + %o4],	%i2
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%i5
	nop
	set	0x56, %i6
	ldub	[%l7 + %i6],	%l5
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%g2
	ld	[%l7 + 0x70],	%f31
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x18, %l1
	ldub	[%l7 + %l1],	%i1
	bne,a,pn	%xcc,	loop_107
	nop
	set	0x56, %l0
	lduh	[%l7 + %l0],	%o5
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%i3
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xea,	%i4
loop_107:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%l0
	nop
	set	0x1B, %l5
	ldstub	[%l7 + %l5],	%g6
	nop
	set	0x74, %o1
	ldsw	[%l7 + %o1],	%l6
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x80,	%g0
	nop
	set	0x4F, %l2
	stb	%o6,	[%l7 + %l2]
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xea,	%o2
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x89,	%o4
	ld	[%l7 + 0x40],	%f26
	set	0x19, %i2
	stba	%g5,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x2E, %i7
	sth	%l3,	[%l7 + %i7]
	and	%l2,	%i6,	%i7
	nop
	set	0x50, %g6
	std	%o2,	[%l7 + %g6]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	nop
	set	0x30, %l6
	std	%f16,	[%l7 + %l6]
	and	%g7,	%g4,	%o1
	nop
	set	0x12, %g5
	stb	%g3,	[%l7 + %g5]
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%l1
	or	%l4,	%i0,	%o0
	nop
	set	0x48, %i3
	sth	%i5,	[%l7 + %i3]
	nop
	set	0x2C, %g2
	ldstub	[%l7 + %g2],	%i2
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x81,	%l5
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%g2
	set	0x7F, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc8
	nop
	set	0x24, %o0
	swap	[%l7 + %o0],	%i3
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%i4
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f18
	nop
	set	0x18, %g4
	std	%o6,	[%l7 + %g4]
	add	%i1,	%g6,	%l6
	nop
	set	0x38, %g1
	ldsh	[%l7 + %g1],	%l0
	nop
	set	0x10, %l1
	std	%o6,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f16
	nop
	set	0x4D, %l0
	stb	%g5,	[%l7 + %l0]
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x89,	 1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i6
	add	%i7,	%o2,	%l3
	set	0x68, %o7
	swapa	[%l7 + %o7] 0x80,	%g7
	nop
	set	0x70, %l5
	std	%g4,	[%l7 + %l5]
	set	0x1C, %o1
	stha	%o1,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x18, %l2
	sta	%f23,	[%l7 + %l2] 0x89
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%l0
	wr	%g3,	%i0,	%set_softint
	and	%l4,	%i5,	%o0
	set	0x30, %i1
	swapa	[%l7 + %i1] 0x88,	%i2
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x80,	%l5
	nop
	set	0x4C, %i7
	ldsw	[%l7 + %i7],	%o5
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%i3
	nop
	set	0x41, %g6
	ldub	[%l7 + %g6],	%g2
	st	%fsr,	[%l7 + 0x38]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6D1, 	%sys_tick_cmpr
	nop
	set	0x76, %o6
	ldsh	[%l7 + %o6],	%g6
	nop
	set	0x28, %l6
	ldsh	[%l7 + %l6],	%i1
	nop
	set	0x76, %g7
	stb	%l6,	[%l7 + %g7]
	set	0x44, %g5
	sta	%f9,	[%l7 + %g5] 0x88
	nop
	set	0x45, %g2
	ldsb	[%l7 + %g2],	%o6
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%f24
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l0,	%o3
	set	0x6A, %l3
	stba	%g1,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x50, %i3
	prefetch	[%l7 + %i3],	 1
	add	%o4,	%l2,	%g5
	nop
	set	0x1C, %g3
	stw	%i7,	[%l7 + %g3]
	nop
	set	0x6C, %i0
	stw	%i6,	[%l7 + %i0]
	add	%o2,	%g7,	%l3
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	nop
	set	0x6C, %o4
	lduh	[%l7 + %o4],	%o1
	set	0x10, %o0
	stwa	%l1,	[%l7 + %o0] 0x89
	set	0x7B, %i6
	ldstuba	[%l7 + %i6] 0x89,	%g3
	nop
	set	0x28, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x7E, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l4
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x12, %g1
	ldstub	[%l7 + %g1],	%i5
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f14
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%i0
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x88,	%i2
	set	0x32, %l0
	stha	%o0,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x48, %o1
	stwa	%o5,	[%l7 + %o1] 0xe3
	membar	#Sync
	fpadd32	%f10,	%f18,	%f30
	ld	[%l7 + 0x2C],	%f21
	ld	[%l7 + 0x30],	%f13
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 1
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f16
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x88,	%i3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	nop
	set	0x10, %l4
	swap	[%l7 + %l4],	%g2
	nop
	set	0x68, %g6
	swap	[%l7 + %g6],	%i4
	nop
	set	0x38, %o6
	std	%o6,	[%l7 + %o6]
	fpsub32	%f24,	%f20,	%f14
	set	0x5C, %i7
	stha	%g6,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x2A, %g7
	sth	%i1,	[%l7 + %g7]
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x88,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o3
	nop
	set	0x16, %g2
	ldsb	[%l7 + %g2],	%l0
	set	0x30, %g5
	lda	[%l7 + %g5] 0x88,	%f28
	nop
	set	0x1C, %l3
	ldstub	[%l7 + %l3],	%g1
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%l2
	nop
	set	0x08, %g3
	std	%g4,	[%l7 + %g3]
	nop
	set	0x38, %i3
	stx	%o4,	[%l7 + %i3]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xda
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1234
!	Type a   	: 27
!	Type cti   	: 20
!	Type x   	: 565
!	Type f   	: 34
!	Type i   	: 120
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
	set	0x8,	%g1
	set	0xA,	%g2
	set	0x3,	%g3
	set	0x1,	%g4
	set	0xD,	%g5
	set	0xB,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xE,	%i1
	set	-0xA,	%i2
	set	-0xD,	%i3
	set	-0x0,	%i4
	set	-0x3,	%i5
	set	-0xC,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x10410742,	%l0
	set	0x39DAE405,	%l1
	set	0x62DD92B8,	%l2
	set	0x4816A57B,	%l3
	set	0x2B3FBB29,	%l4
	set	0x38D6FF1D,	%l5
	set	0x102A3357,	%l6
	!# Output registers
	set	-0x0A7F,	%o0
	set	0x0A66,	%o1
	set	0x03C1,	%o2
	set	-0x0442,	%o3
	set	-0x0D0E,	%o4
	set	-0x1315,	%o5
	set	0x0114,	%o6
	set	-0x135A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	nop
	set	0x70, %o4
	stx	%i6,	[%l7 + %o4]
	set	0x52, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o2
	nop
	set	0x7C, %i0
	lduh	[%l7 + %i0],	%g7
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x3E, %l1
	ldsb	[%l7 + %l1],	%g4
	nop
	set	0x58, %i6
	stb	%o1,	[%l7 + %i6]
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l3
	set	0x50, %i4
	stxa	%g3,	[%l7 + %i4] 0x88
	nop
	set	0x40, %o7
	std	%f24,	[%l7 + %o7]
	wr 	%g0, 	0x6, 	%fprs
	fpadd16s	%f6,	%f9,	%f13
	nop
	set	0x26, %l5
	ldub	[%l7 + %l5],	%l1
	set	0x78, %g1
	stda	%i2,	[%l7 + %g1] 0x80
	nop
	set	0x38, %l0
	std	%f6,	[%l7 + %l0]
	st	%f12,	[%l7 + 0x64]
	nop
	set	0x7B, %o1
	ldsb	[%l7 + %o1],	%o0
	set	0x60, %l2
	sta	%f30,	[%l7 + %l2] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%l5
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%i3
	nop
	set	0x58, %o5
	sth	%g2,	[%l7 + %o5]
	nop
	set	0x48, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x60, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x30, %g6
	stwa	%i4,	[%l7 + %g6] 0x89
	set	0x74, %o6
	lda	[%l7 + %o6] 0x81,	%f9
	nop
	set	0x42, %g7
	lduh	[%l7 + %g7],	%o5
	st	%f24,	[%l7 + 0x30]
	nop
	set	0x6C, %l6
	stw	%g6,	[%l7 + %l6]
	set	0x20, %g2
	stda	%i0,	[%l7 + %g2] 0x80
	set	0x60, %g5
	sta	%f31,	[%l7 + %g5] 0x88
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	fpadd32s	%f28,	%f18,	%f20
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%o7
	ld	[%l7 + 0x0C],	%f24
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%l6
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd8
	set	0x0D, %o3
	stba	%o6,	[%l7 + %o3] 0x80
	or	%o3,	%g1,	%l2
	or	%g5,	%o4,	%l0
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x81,	%i6
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x81,	%g7
	and	%i7,	%g4,	%o1
	set	0x70, %i0
	sta	%f31,	[%l7 + %i0] 0x89
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
	and	%o2,	%g3,	%i5
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%l4
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f14
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%o0
	set	0x50, %i5
	ldxa	[%l7 + %i5] 0x81,	%i0
	set	0x64, %g4
	sta	%f6,	[%l7 + %g4] 0x80
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i3
	set	0x55, %o7
	stba	%g2,	[%l7 + %o7] 0x80
	set	0x49, %i4
	stba	%i4,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x37, %g1
	ldsb	[%l7 + %g1],	%o5
	fpadd16	%f14,	%f8,	%f26
	set	0x28, %l5
	stwa	%g6,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x75, %l0
	ldsb	[%l7 + %l0],	%l5
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%o6
	set	0x10, %o5
	prefetcha	[%l7 + %o5] 0x80,	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o6
	nop
	set	0x2D, %o1
	ldsb	[%l7 + %o1],	%g1
	st	%fsr,	[%l7 + 0x38]
	set	0x58, %i1
	stba	%l2,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x40, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x0C, %l4
	lduh	[%l7 + %l4],	%g5
	nop
	set	0x34, %g7
	lduh	[%l7 + %g7],	%l0
	nop
	set	0x18, %o6
	stx	%o4,	[%l7 + %o6]
	nop
	set	0x10, %l6
	prefetch	[%l7 + %l6],	 0
	st	%f25,	[%l7 + 0x10]
	st	%fsr,	[%l7 + 0x44]
	set	0x10, %g2
	stda	%g6,	[%l7 + %g2] 0x80
	nop
	set	0x50, %i7
	std	%i6,	[%l7 + %i7]
	nop
	set	0x5E, %g5
	ldub	[%l7 + %g5],	%i7
	add	%g4,	%l3,	%o1
	nop
	set	0x5D, %l3
	ldstub	[%l7 + %l3],	%g3
	nop
	set	0x4C, %o2
	ldub	[%l7 + %o2],	%i5
	nop
	nop
	setx	0x4022D2DBC22082D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x53952EB2EE89D868,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f14,	%f2
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%l4
	nop
	set	0x18, %g3
	stx	%o2,	[%l7 + %g3]
	fpsub32	%f26,	%f8,	%f14
	nop
	set	0x50, %i3
	std	%f28,	[%l7 + %i3]
	nop
	set	0x24, %i0
	stw	%i2,	[%l7 + %i0]
	nop
	set	0x1C, %o4
	ldub	[%l7 + %o4],	%i0
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x89,	%f11
	set	0x54, %i6
	stha	%l1,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0
	nop
	set	0x50, %l1
	stw	%o0,	[%l7 + %l1]
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f0
	set	0x67, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i4
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x81
	ld	[%l7 + 0x20],	%f22
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x81,	%g2
	be,a,pt	%xcc,	loop_108
	fpadd32	%f20,	%f2,	%f16
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x75, %l2
	ldstub	[%l7 + %l2],	%o5
loop_108:
	nop
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x80,	 2
	nop
	set	0x30, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x14, %o1
	swapa	[%l7 + %o1] 0x89,	%g6
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f6
	nop
	set	0x58, %g6
	std	%f2,	[%l7 + %g6]
	or	%o7,	%l6,	%i1
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x80,	 3
	nop
	set	0x14, %l4
	ldsh	[%l7 + %l4],	%g1
	set	0x20, %o6
	swapa	[%l7 + %o6] 0x80,	%l2
	be,pn	%icc,	loop_109
	and	%o3,	%g5,	%l0
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f14
	set	0x70, %l6
	swapa	[%l7 + %l6] 0x81,	%g7
loop_109:
	nop
	set	0x61, %i7
	ldstub	[%l7 + %i7],	%o4
	nop
	set	0x76, %g2
	ldsh	[%l7 + %g2],	%i7
	set	0x2A, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i6
	nop
	set	0x76, %g5
	sth	%g4,	[%l7 + %g5]
	nop
	set	0x38, %o3
	ldsw	[%l7 + %o3],	%l3
	nop
	set	0x12, %g3
	ldsb	[%l7 + %g3],	%g3
	set	0x6A, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i5
	nop
	set	0x44, %o2
	stw	%o1,	[%l7 + %o2]
	and	%l4,	%i2,	%o2
	and	%l1,	%i0,	%i3
	set	0x68, %i0
	stxa	%i4,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x20, %o4
	stxa	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	bl,a	%icc,	loop_110
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x50, %i5
	stw	%o5,	[%l7 + %i5]
	nop
	set	0x16, %l1
	lduh	[%l7 + %l1],	%g6
loop_110:
	st	%f10,	[%l7 + 0x4C]
	nop
	set	0x30, %o0
	std	%f2,	[%l7 + %o0]
	set	0x36, %g4
	stha	%o7,	[%l7 + %g4] 0x88
	set	0x60, %o7
	prefetcha	[%l7 + %o7] 0x89,	 4
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%f26
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%i1
	set	0x30, %l5
	stha	%o6,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f0
	nop
	set	0x08, %i2
	std	%f2,	[%l7 + %i2]
	and	%g1,	%o3,	%l2
	nop
	set	0x64, %o1
	swap	[%l7 + %o1],	%g5
	set	0x18, %o5
	stwa	%g7,	[%l7 + %o5] 0x89
	nop
	set	0x78, %g6
	lduh	[%l7 + %g6],	%o4
	set	0x75, %l0
	stba	%l0,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x74, %i1
	lda	[%l7 + %i1] 0x89,	%f2
	set	0x6E, %o6
	stha	%i6,	[%l7 + %o6] 0xe3
	membar	#Sync
	and	%g4,	%i7,	%g3
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f8
	set	0x78, %l6
	stwa	%l3,	[%l7 + %l6] 0x81
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x81,	%o1
	nop
	set	0x28, %g7
	std	%f18,	[%l7 + %g7]
	set	0x47, %g2
	stba	%i5,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x30, %l3
	sta	%f2,	[%l7 + %l3] 0x80
	set	0x20, %g5
	stda	%i2,	[%l7 + %g5] 0xe3
	membar	#Sync
	add	%o2,	%l1,	%l4
	nop
	set	0x38, %g3
	sth	%i3,	[%l7 + %g3]
	set	0x69, %o3
	stba	%i0,	[%l7 + %o3] 0x88
	nop
	set	0x34, %i3
	stw	%g2,	[%l7 + %i3]
	add	%o0,	%o5,	%g6
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%o7
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xe3,	%l4
	nop
	set	0x50, %i6
	ldsh	[%l7 + %i6],	%i4
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x6A, %i5
	ldsb	[%l7 + %i5],	%l6
	set	0x48, %l1
	stxa	%o6,	[%l7 + %l1] 0x81
	nop
	set	0x51, %o0
	ldstub	[%l7 + %o0],	%i1
	bn,a	%xcc,	loop_111
	nop
	set	0x78, %o7
	stx	%o3,	[%l7 + %o7]
	nop
	set	0x68, %g1
	stw	%l2,	[%l7 + %g1]
	set	0x14, %i4
	lda	[%l7 + %i4] 0x81,	%f1
loop_111:
	and	%g1,	%g7,	%o4
	nop
	set	0x10, %l5
	std	%f24,	[%l7 + %l5]
	nop
	set	0x08, %g4
	lduw	[%l7 + %g4],	%l0
	set	0x3C, %i2
	stwa	%i6,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x10, %l2
	sth	%g4,	[%l7 + %l2]
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%g5
	nop
	nop
	setx	0x39CCE73AD075ACC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x790B2E8DAE56F4AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f30,	%f8
	nop
	set	0x16, %o5
	stb	%g3,	[%l7 + %o5]
	set	0x18, %g6
	swapa	[%l7 + %g6] 0x81,	%i7
	nop
	set	0x18, %i1
	std	%f20,	[%l7 + %i1]
	nop
	set	0x1B, %l0
	ldstub	[%l7 + %l0],	%l3
	add	%o1,	%i5,	%o2
	bge,a,pt	%icc,	loop_112
	ble,a	%xcc,	loop_113
	nop
	set	0x70, %l4
	stx	%i2,	[%l7 + %l4]
	ld	[%l7 + 0x5C],	%f4
loop_112:
	nop
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x81,	%l4
loop_113:
	nop
	set	0x38, %i7
	stw	%l1,	[%l7 + %i7]
	ld	[%l7 + 0x28],	%f6
	be,pt	%icc,	loop_114
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%i0
	set	0x0E, %g2
	stba	%g2,	[%l7 + %g2] 0x89
loop_114:
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x70, %g7
	std	%i2,	[%l7 + %g7]
	set	0x70, %g3
	sta	%f26,	[%l7 + %g3] 0x80
	and	%o0,	%g6,	%o7
	nop
	set	0x48, %g5
	swap	[%l7 + %g5],	%l5
	or	%o5,	%i4,	%l6
	or	%o6,	%o3,	%l2
	nop
	set	0x20, %o3
	lduh	[%l7 + %o3],	%g1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%i1
	nop
	set	0x28, %o2
	stx	%fsr,	[%l7 + %o2]
	add	%o4,	%i6,	%g4
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%l0
	add	%g3,	%i7,	%g5
	nop
	set	0x44, %i6
	ldub	[%l7 + %i6],	%l3
	nop
	set	0x68, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%o1
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%o2
	set	0x5C, %i3
	lda	[%l7 + %i3] 0x81,	%f14
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%i2
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x88,	%i0
	ld	[%l7 + 0x38],	%f3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%l1
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%i2
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	nop
	set	0x7E, %l5
	lduh	[%l7 + %l5],	%g6
	nop
	set	0x6E, %i4
	sth	%o7,	[%l7 + %i4]
	or	%o5,	%i4,	%l5
	fpsub16s	%f22,	%f31,	%f17
	nop
	set	0x38, %g4
	std	%f12,	[%l7 + %g4]
	set	0x7C, %l2
	swapa	[%l7 + %l2] 0x89,	%l6
	nop
	set	0x68, %o1
	stx	%o6,	[%l7 + %o1]
	nop
	set	0x15, %o5
	ldsb	[%l7 + %o5],	%o3
	st	%f26,	[%l7 + 0x24]
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%l2
	set	0x10, %i2
	sta	%f26,	[%l7 + %i2] 0x89
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f16
	nop
	set	0x5C, %l0
	ldsh	[%l7 + %l0],	%g7
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x50, %l4
	stx	%i1,	[%l7 + %l4]
	set	0x44, %o6
	lda	[%l7 + %o6] 0x80,	%f16
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x81,	%o4
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%g0
	nop
	set	0x30, %l3
	lduh	[%l7 + %l3],	%g4
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%l0
	and	%i6,	%i7,	%g3
	nop
	set	0x14, %g5
	sth	%l3,	[%l7 + %g5]
	nop
	set	0x74, %o3
	sth	%g5,	[%l7 + %o3]
	set	0x40, %g3
	stxa	%o1,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x18, %o4
	lda	[%l7 + %o4] 0x80,	%f22
	nop
	set	0x10, %o2
	stw	%i5,	[%l7 + %o2]
	bn,a,pn	%xcc,	loop_115
	nop
	set	0x40, %i6
	ldsb	[%l7 + %i6],	%l4
	nop
	set	0x5E, %i5
	ldsb	[%l7 + %i5],	%o2
	set	0x52, %l1
	stha	%i0,	[%l7 + %l1] 0x81
loop_115:
	nop
	set	0x34, %i0
	ldstub	[%l7 + %i0],	%i2
	st	%f31,	[%l7 + 0x18]
	nop
	set	0x30, %i3
	lduw	[%l7 + %i3],	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l1
	set	0x30, %g1
	stha	%o0,	[%l7 + %g1] 0x80
	ld	[%l7 + 0x10],	%f12
	set	0x50, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o7
	nop
	set	0x28, %l5
	stw	%o5,	[%l7 + %l5]
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%g6
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x89,	 0
	and	%l6,	%o6,	%i4
	nop
	nop
	setx	0xD14F8583,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA98CA8E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f18,	%f15
	ld	[%l7 + 0x14],	%f12
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%o2
	bg,a,pt	%xcc,	loop_116
	nop
	set	0x4A, %l2
	sth	%g7,	[%l7 + %l2]
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x80,	%i0
loop_116:
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	fpsub16s	%f26,	%f18,	%f23
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%g1
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x81,	%o4
	st	%fsr,	[%l7 + 0x48]
	set	0x15, %o5
	stba	%l0,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x18, %l0
	std	%i6,	[%l7 + %l0]
	nop
	set	0x6B, %l6
	ldstub	[%l7 + %l6],	%g4
	ld	[%l7 + 0x20],	%f27
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%i6
	set	0x45, %o6
	ldstuba	[%l7 + %o6] 0x88,	%l3
	bl,a,pt	%xcc,	loop_117
	fpadd32	%f0,	%f24,	%f14
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x89
loop_117:
	nop
	set	0x10, %g2
	lduw	[%l7 + %g2],	%g3
	add	%g5,	%o1,	%l4
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x2C, %l3
	ldsb	[%l7 + %l3],	%o2
	nop
	set	0x2C, %l4
	stw	%i5,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
	wr	%i0,	%g2,	%sys_tick
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f8
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f16
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f0
	and	%i3,	%i2,	%o0
	nop
	set	0x59, %o4
	stb	%o7,	[%l7 + %o4]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%l6
	nop
	set	0x31, %o2
	stb	%g6,	[%l7 + %o2]
	nop
	set	0x50, %i5
	prefetch	[%l7 + %i5],	 1
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc8
	nop
	set	0x10, %i0
	ldstub	[%l7 + %i0],	%i4
	nop
	set	0x24, %i3
	swap	[%l7 + %i3],	%o3
	ld	[%l7 + 0x14],	%f5
	nop
	set	0x3C, %g1
	swap	[%l7 + %g1],	%g7
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x68, %o7
	ldxa	[%l7 + %o7] 0x88,	%o6
	fpsub32s	%f6,	%f5,	%f20
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i1
	nop
	set	0x10, %l5
	lduw	[%l7 + %l5],	%o4
	or	%l0,	%i6,	%g1
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%g4
	nop
	set	0x42, %o0
	ldsh	[%l7 + %o0],	%i7
	and	%l3,	%g5,	%o1
	set	0x60, %g4
	stxa	%l4,	[%l7 + %g4] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	set	0x78, %o1
	stwa	%o2,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x50, %g6
	stx	%g3,	[%l7 + %g6]
	set	0x78, %i2
	stwa	%i0,	[%l7 + %i2] 0x80
	st	%fsr,	[%l7 + 0x64]
	add	%i5,	%i3,	%g2
	bgu,a	%icc,	loop_118
	nop
	set	0x48, %o5
	std	%f24,	[%l7 + %o5]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xda
loop_118:
	nop
	set	0x58, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc8
	nop
	set	0x08, %o6
	ldsh	[%l7 + %o6],	%i2
	nop
	set	0x34, %i7
	stw	%o7,	[%l7 + %i7]
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x89,	%o0
	nop
	set	0x0C, %l3
	stw	%o5,	[%l7 + %l3]
	wr	%l1,	%l5,	%set_softint
	fpadd16s	%f4,	%f12,	%f2
	nop
	set	0x60, %l4
	std	%f26,	[%l7 + %l4]
	nop
	set	0x50, %l6
	lduw	[%l7 + %l6],	%g6
	nop
	set	0x30, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x30, %o3
	std	%i4,	[%l7 + %o3]
	st	%f24,	[%l7 + 0x64]
	set	0x61, %g3
	stba	%o3,	[%l7 + %g3] 0x80
	nop
	set	0x18, %g5
	prefetch	[%l7 + %g5],	 4
	st	%fsr,	[%l7 + 0x78]
	set	0x10, %o4
	lda	[%l7 + %o4] 0x80,	%f14
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%g7
	set	0x4A, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l6
	nop
	set	0x68, %i0
	swap	[%l7 + %i0],	%o6
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x08, %g1
	ldstub	[%l7 + %g1],	%i1
	and	%o4,	%l0,	%i6
	nop
	set	0x26, %l1
	sth	%l2,	[%l7 + %l1]
	set	0x1C, %o7
	swapa	[%l7 + %o7] 0x80,	%g1
	nop
	set	0x69, %i5
	stb	%i7,	[%l7 + %i5]
	nop
	set	0x0C, %i4
	ldsh	[%l7 + %i4],	%l3
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	ld	[%l7 + 0x18],	%f31
	nop
	set	0x20, %g4
	ldsh	[%l7 + %g4],	%g5
	nop
	set	0x6C, %l5
	stb	%o1,	[%l7 + %l5]
	ld	[%l7 + 0x48],	%f30
	ble,a	%xcc,	loop_119
	nop
	set	0x6C, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x65, %o5
	ldsb	[%l7 + %o5],	%l4
loop_119:
	nop
	set	0x48, %i2
	stx	%g4,	[%l7 + %i2]
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%o2
	set	0x74, %i1
	sta	%f21,	[%l7 + %i1] 0x89
	add	%g3,	%i5,	%i0
	set	0x50, %l0
	stda	%g2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x4C, %i7
	ldub	[%l7 + %i7],	%i2
	nop
	set	0x60, %o6
	swap	[%l7 + %o6],	%o7
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%o0
	nop
	set	0x18, %l4
	std	%i2,	[%l7 + %l4]
	nop
	set	0x66, %l6
	ldub	[%l7 + %l6],	%l1
	nop
	set	0x40, %g7
	stw	%l5,	[%l7 + %g7]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xcc
	nop
	set	0x48, %g3
	stx	%g6,	[%l7 + %g3]
	nop
	set	0x4C, %o3
	swap	[%l7 + %o3],	%o5
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%o3
	nop
	set	0x70, %g5
	stw	%g7,	[%l7 + %g5]
	and	%i4,	%l6,	%i1
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%o4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%i6
	add	%l2,	%l0,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%i7
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x88,	%o1
	set	0x3C, %i3
	lda	[%l7 + %i3] 0x89,	%f21
	nop
	set	0x14, %i0
	ldsw	[%l7 + %i0],	%g5
	set	0x38, %l1
	swapa	[%l7 + %l1] 0x89,	%g4
	wr	%o2,	%l4,	%set_softint
	nop
	set	0x34, %o7
	ldsb	[%l7 + %o7],	%g3
	or	%i0,	%g2,	%i5
	nop
	set	0x7F, %i5
	ldub	[%l7 + %i5],	%i2
	and	%o0,	%i3,	%l1
	fpadd16s	%f4,	%f1,	%f30
	set	0x44, %i4
	lda	[%l7 + %i4] 0x88,	%f15
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4E1, 	%sys_tick_cmpr
	fpsub32s	%f23,	%f1,	%f27
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%g6
	nop
	set	0x64, %g4
	stb	%o5,	[%l7 + %g4]
	nop
	set	0x6C, %l5
	stw	%g7,	[%l7 + %l5]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
	nop
	set	0x79, %o0
	ldstub	[%l7 + %o0],	%i4
	ld	[%l7 + 0x48],	%f27
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f16
	be	%icc,	loop_120
	nop
	set	0x68, %o1
	swap	[%l7 + %o1],	%l6
	nop
	set	0x18, %l2
	swap	[%l7 + %l2],	%o3
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
loop_120:
	nop
	set	0x24, %l0
	ldsw	[%l7 + %l0],	%o4
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x68, %i2
	lduw	[%l7 + %i2],	%i1
	nop
	set	0x50, %l3
	std	%l2,	[%l7 + %l3]
	nop
	set	0x78, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x44, %l6
	ldsw	[%l7 + %l6],	%l0
	set	0x2C, %g7
	sta	%f7,	[%l7 + %g7] 0x81
	set	0x30, %g2
	stda	%i6,	[%l7 + %g2] 0x89
	nop
	set	0x4F, %g3
	stb	%g1,	[%l7 + %g3]
	nop
	set	0x54, %o3
	stw	%l3,	[%l7 + %o3]
	nop
	set	0x64, %l4
	ldsh	[%l7 + %l4],	%i7
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x81,	%g5
	set	0x70, %o4
	lda	[%l7 + %o4] 0x80,	%f8
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%g4
	nop
	set	0x70, %i6
	std	%o2,	[%l7 + %i6]
	set	0x75, %i0
	stba	%o1,	[%l7 + %i0] 0x89
	fpadd16s	%f10,	%f3,	%f17
	nop
	set	0x4C, %i3
	lduw	[%l7 + %i3],	%g3
	nop
	set	0x28, %o7
	std	%f8,	[%l7 + %o7]
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%l4
	ld	[%l7 + 0x50],	%f4
	nop
	set	0x08, %l1
	std	%f30,	[%l7 + %l1]
	wr	%i0,	%g2,	%pic
	set	0x28, %i4
	stxa	%i5,	[%l7 + %i4] 0x89
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x81,	 0
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%i3
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f0
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f12
	nop
	set	0x78, %o5
	ldx	[%l7 + %o5],	%l1
	nop
	set	0x38, %l5
	lduw	[%l7 + %l5],	%o7
	set	0x64, %o1
	swapa	[%l7 + %o1] 0x81,	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%o5
	nop
	set	0x0B, %i1
	stb	%g7,	[%l7 + %i1]
	nop
	set	0x74, %l0
	stw	%g6,	[%l7 + %l0]
	nop
	set	0x78, %l2
	std	%i6,	[%l7 + %l2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%i4
	nop
	set	0x1D, %i2
	ldsb	[%l7 + %i2],	%o6
	nop
	set	0x30, %i7
	stx	%i1,	[%l7 + %i7]
	nop
	set	0x18, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x4A, %l6
	ldstuba	[%l7 + %l6] 0x89,	%l2
	or	%l0,	%o4,	%g1
	add	%i6,	%i7,	%l3
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x88,	%g5
	set	0x24, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g4
	or	%o2,	%o1,	%g3
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x81,	%l4
	or	%g2,	%i5,	%i0
	ble,a,pn	%xcc,	loop_121
	and	%i3,	%o0,	%l1
	set	0x14, %o3
	stha	%o7,	[%l7 + %o3] 0xe2
	membar	#Sync
loop_121:
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%i2
	nop
	set	0x64, %g3
	sth	%o5,	[%l7 + %g3]
	nop
	set	0x10, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x20, %o2
	std	%g6,	[%l7 + %o2]
	nop
	set	0x58, %i6
	lduw	[%l7 + %i6],	%l6
	nop
	set	0x48, %i0
	ldsh	[%l7 + %i0],	%o3
	set	0x38, %o4
	stxa	%i4,	[%l7 + %o4] 0x89
	nop
	set	0x78, %i3
	std	%l4,	[%l7 + %i3]
	set	0x20, %o7
	stwa	%i1,	[%l7 + %o7] 0x88
	add	%l2,	%o6,	%o4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x10, %i5
	stx	%l0,	[%l7 + %i5]
	set	0x78, %i4
	stwa	%l3,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc4
	nop
	set	0x36, %g4
	ldsh	[%l7 + %g4],	%g5
	set	0x28, %l1
	swapa	[%l7 + %l1] 0x88,	%i7
	set	0x48, %g6
	stha	%o2,	[%l7 + %g6] 0x81
	nop
	set	0x24, %o5
	stw	%g4,	[%l7 + %o5]
	set	0x61, %l5
	stba	%o1,	[%l7 + %l5] 0xe3
	membar	#Sync
	or	%l4,	%g3,	%g2
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x80,	%i0
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd2
	set	0x30, %l2
	stxa	%i5,	[%l7 + %l2] 0x89
	set	0x35, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o0
	nop
	set	0x40, %i7
	std	%l0,	[%l7 + %i7]
	set	0x7F, %l0
	stba	%o7,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x5A, %l6
	sth	%i3,	[%l7 + %l6]
	nop
	set	0x39, %l3
	ldsb	[%l7 + %l3],	%o5
	nop
	set	0x60, %o6
	std	%f24,	[%l7 + %o6]
	nop
	set	0x72, %g7
	stb	%g7,	[%l7 + %g7]
	nop
	set	0x68, %o3
	ldub	[%l7 + %o3],	%i2
	set	0x50, %g2
	stwa	%g6,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x6C, %g3
	ldsw	[%l7 + %g3],	%l6
	nop
	set	0x34, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x44, %o2
	lda	[%l7 + %o2] 0x81,	%f8
	st	%f13,	[%l7 + 0x20]
	nop
	set	0x5F, %l4
	ldstub	[%l7 + %l4],	%o3
	nop
	set	0x1A, %i0
	ldsb	[%l7 + %i0],	%i4
	nop
	set	0x48, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%l5
	nop
	set	0x42, %o7
	lduh	[%l7 + %o7],	%l2
	st	%f17,	[%l7 + 0x58]
	nop
	set	0x28, %i5
	stx	%i1,	[%l7 + %i5]
	nop
	set	0x46, %i4
	ldub	[%l7 + %i4],	%o4
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x81,	%g1
	st	%f25,	[%l7 + 0x78]
	nop
	set	0x70, %g4
	std	%o6,	[%l7 + %g4]
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%i6
	nop
	set	0x3A, %g1
	lduh	[%l7 + %g1],	%l3
	nop
	set	0x1A, %g6
	ldsb	[%l7 + %g6],	%g5
	set	0x54, %l5
	swapa	[%l7 + %l5] 0x89,	%l0
	add	%o2,	%i7,	%o1
	nop
	set	0x1C, %o0
	lduw	[%l7 + %o0],	%g4
	and	%l4,	%g3,	%g2
	set	0x74, %o1
	sta	%f10,	[%l7 + %o1] 0x88
	nop
	set	0x47, %o5
	ldstub	[%l7 + %o5],	%i5
	nop
	set	0x2C, %l2
	lduw	[%l7 + %l2],	%i0
	nop
	set	0x73, %i1
	ldstub	[%l7 + %i1],	%o0
	nop
	nop
	setx	0x7F1BD5B1C78027BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA0CFCE88A1543E9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f12,	%f20
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x832, 	%sys_tick_cmpr
	st	%f29,	[%l7 + 0x4C]
	and	%o5,	%g7,	%l1
	nop
	nop
	setx	0x3C41D9E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xCA606B04,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f28,	%f0
	and	%g6,	%i2,	%o3
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%i4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc8
	set	0x20, %l6
	stwa	%l6,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x7C, %l0
	swapa	[%l7 + %l0] 0x80,	%l2
	set	0x0C, %o6
	swapa	[%l7 + %o6] 0x88,	%i1
	nop
	set	0x30, %l3
	std	%l4,	[%l7 + %l3]
	nop
	set	0x2C, %g7
	stw	%o4,	[%l7 + %g7]
	set	0x70, %o3
	stxa	%o6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x2D, %g2
	ldub	[%l7 + %g2],	%i6
	st	%fsr,	[%l7 + 0x0C]
	add	%l3,	%g1,	%l0
	ld	[%l7 + 0x34],	%f7
	set	0x72, %g5
	stba	%o2,	[%l7 + %g5] 0x81
	ld	[%l7 + 0x30],	%f17
	set	0x78, %o2
	stda	%i6,	[%l7 + %o2] 0x88
	nop
	set	0x4C, %g3
	sth	%o1,	[%l7 + %g3]
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x4E, %i6
	ldstub	[%l7 + %i6],	%g4
	nop
	set	0x57, %l4
	ldstub	[%l7 + %l4],	%l4
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%g4
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	wr	%g2,	%i5,	%pic
	st	%fsr,	[%l7 + 0x48]
	set	0x18, %i4
	stxa	%g3,	[%l7 + %i4] 0x89
	set	0x18, %o7
	stha	%o0,	[%l7 + %o7] 0x89
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%o7
	nop
	set	0x60, %g4
	prefetch	[%l7 + %g4],	 2
	ld	[%l7 + 0x10],	%f3
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x80,	%i3
	nop
	set	0x66, %l1
	ldsh	[%l7 + %l1],	%i0
	and	%o5,	%g7,	%g6
	set	0x70, %l5
	stxa	%l1,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x80,	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i2
	nop
	set	0x28, %o1
	stw	%l6,	[%l7 + %o1]
	set	0x18, %o0
	lda	[%l7 + %o0] 0x80,	%f3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%i1
	nop
	set	0x60, %l2
	lduh	[%l7 + %l2],	%o4
	nop
	set	0x45, %o5
	ldstub	[%l7 + %o5],	%l5
	add	%i6,	%o6,	%l3
	st	%f14,	[%l7 + 0x54]
	set	0x46, %i7
	ldstuba	[%l7 + %i7] 0x80,	%l0
	set	0x60, %i2
	stda	%o2,	[%l7 + %i2] 0x81
	nop
	set	0x4A, %l6
	sth	%g1,	[%l7 + %l6]
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	ld	[%l7 + 0x44],	%f0
	wr	%g4,	%o1,	%sys_tick
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%g5
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x68, %o6
	stda	%g2,	[%l7 + %o6] 0x88
	nop
	set	0x28, %g7
	stx	%g3,	[%l7 + %g7]
	set	0x1C, %l3
	sta	%f4,	[%l7 + %l3] 0x80
	nop
	set	0x4F, %o3
	ldub	[%l7 + %o3],	%i5
	nop
	set	0x10, %g5
	lduh	[%l7 + %g5],	%o0
	ba,a	%icc,	loop_122
	nop
	set	0x72, %o2
	ldub	[%l7 + %o2],	%o7
	nop
	set	0x3C, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x32, %i0
	sth	%i3,	[%l7 + %i0]
loop_122:
	st	%f0,	[%l7 + 0x20]
	set	0x60, %i6
	stxa	%o5,	[%l7 + %i6] 0x89
	nop
	set	0x28, %g2
	lduw	[%l7 + %g2],	%g7
	st	%f29,	[%l7 + 0x38]
	nop
	set	0x68, %l4
	swap	[%l7 + %l4],	%i0
	set	0x18, %i5
	stba	%l1,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x58, %i3
	stxa	%g6,	[%l7 + %i3] 0x88
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x89,	%i4
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%i2
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x15, %g4
	ldsb	[%l7 + %g4],	%o3
	fpadd32s	%f16,	%f16,	%f29
	nop
	set	0x1E, %g1
	ldsh	[%l7 + %g1],	%l6
	nop
	set	0x18, %o4
	stx	%i1,	[%l7 + %o4]
	nop
	set	0x66, %l1
	sth	%l2,	[%l7 + %l1]
	nop
	set	0x6A, %l5
	stb	%o4,	[%l7 + %l5]
	nop
	set	0x38, %g6
	ldsw	[%l7 + %g6],	%i6
	nop
	set	0x29, %o1
	ldstub	[%l7 + %o1],	%o6
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x62, %o0
	ldsh	[%l7 + %o0],	%l3
	set	0x24, %o5
	lda	[%l7 + %o5] 0x80,	%f30
	nop
	set	0x0C, %l2
	swap	[%l7 + %l2],	%l5
	nop
	set	0x54, %i7
	stw	%l0,	[%l7 + %i7]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%o2
	nop
	set	0x0C, %i2
	swap	[%l7 + %i2],	%i7
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
	and	%g4,	%o1,	%l4
	add	%g1,	%g2,	%g3
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
	set	0x78, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g5
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x81,	 4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%i5
	set	0x4A, %l3
	stba	%o5,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x58, %g5
	sta	%f11,	[%l7 + %g5] 0x80
	set	0x38, %o2
	stba	%i3,	[%l7 + %o2] 0x81
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%i0
	set	0x15, %g3
	ldstuba	[%l7 + %g3] 0x89,	%g7
	set	0x18, %i6
	lda	[%l7 + %i6] 0x88,	%f26
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xea,	%g6
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x32, %i5
	lduh	[%l7 + %i5],	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%o3
	and	%i2,	%l6,	%i1
	st	%fsr,	[%l7 + 0x38]
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x80,	%o4
	add	%l2,	%o6,	%l3
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%f10
	set	0x64, %o7
	lda	[%l7 + %o7] 0x89,	%f10
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%i6
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x88,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%o2
	nop
	set	0x48, %g1
	stx	%g4,	[%l7 + %g1]
	set	0x24, %l1
	stwa	%o1,	[%l7 + %l1] 0x89
	nop
	set	0x68, %l5
	lduw	[%l7 + %l5],	%l4
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x81,	 3
	nop
	set	0x1C, %o4
	lduh	[%l7 + %o4],	%g2
	set	0x14, %o1
	lda	[%l7 + %o1] 0x81,	%f3
	nop
	set	0x4D, %o5
	stb	%g3,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x24]
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x80,	%i6
	set	0x58, %l2
	sta	%f25,	[%l7 + %l2] 0x81
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%g5
	fpsub32	%f0,	%f2,	%f30
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf9
	membar	#Sync
	set	0x68, %i7
	stda	%o0,	[%l7 + %i7] 0x81
	or	%o7,	%i5,	%i3
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x54, %i1
	ldsw	[%l7 + %i1],	%o5
	bl,pt	%icc,	loop_123
	nop
	set	0x7C, %o6
	ldsw	[%l7 + %o6],	%i0
	wr	%g6,	%l1,	%softint
	and	%i4,	%g7,	%o3
loop_123:
	nop
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xeb,	%i2
	nop
	set	0x67, %o3
	stb	%i1,	[%l7 + %o3]
	nop
	set	0x0A, %i2
	lduh	[%l7 + %i2],	%o4
	nop
	set	0x42, %l3
	ldstub	[%l7 + %l3],	%l2
	set	0x60, %o2
	stwa	%o6,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x40, %g5
	stx	%l6,	[%l7 + %g5]
	set	0x24, %i0
	swapa	[%l7 + %i0] 0x89,	%i6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	fpsub32	%f8,	%f18,	%f10
	nop
	set	0x3E, %i6
	ldsh	[%l7 + %i6],	%l3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%o2
	set	0x10, %l4
	lda	[%l7 + %l4] 0x81,	%f13
	set	0x26, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l0
	nop
	set	0x55, %g2
	stb	%o1,	[%l7 + %g2]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%g1
	nop
	set	0x48, %o7
	ldx	[%l7 + %o7],	%g2
	nop
	set	0x18, %i5
	lduw	[%l7 + %i5],	%l4
	nop
	set	0x40, %g4
	ldsh	[%l7 + %g4],	%g3
	nop
	set	0x28, %g1
	std	%f12,	[%l7 + %g1]
	fpsub32s	%f11,	%f13,	%f1
	st	%f30,	[%l7 + 0x7C]
	st	%f18,	[%l7 + 0x38]
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%g4
	nop
	set	0x2B, %l1
	ldsb	[%l7 + %l1],	%o0
	and	%o7,	%i5,	%i3
	nop
	set	0x58, %l5
	swap	[%l7 + %l5],	%o5
	nop
	set	0x14, %g6
	ldsw	[%l7 + %g6],	%i7
	nop
	set	0x34, %o1
	lduh	[%l7 + %o1],	%g6
	add	%i0,	%l1,	%g7
	set	0x3C, %o4
	lda	[%l7 + %o4] 0x81,	%f30
	nop
	set	0x40, %o5
	ldsh	[%l7 + %o5],	%i4
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x89,	%i2
	nop
	set	0x48, %o0
	stx	%o3,	[%l7 + %o0]
	nop
	set	0x6C, %l0
	ldsh	[%l7 + %l0],	%o4
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%l2
	nop
	set	0x7C, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f24
	nop
	set	0x78, %g7
	stx	%l6,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x1A, %i2
	ldsh	[%l7 + %i2],	%i6
	nop
	set	0x40, %o3
	swap	[%l7 + %o3],	%o6
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xeb,	%l2
	nop
	set	0x08, %o2
	stw	%l5,	[%l7 + %o2]
	nop
	set	0x2A, %g5
	sth	%l0,	[%l7 + %g5]
	nop
	nop
	setx	0x96F63C4E2031BB43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x183B4D04B318403D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f28,	%f6
	nop
	set	0x68, %g3
	stx	%o2,	[%l7 + %g3]
	nop
	set	0x28, %i0
	stw	%o1,	[%l7 + %i0]
	add	%g1,	%g4,	%g2
	nop
	set	0x72, %i6
	ldstub	[%l7 + %i6],	%l4
	nop
	set	0x0A, %i3
	lduh	[%l7 + %i3],	%g3
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x58, %l4
	stx	%o0,	[%l7 + %l4]
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x81,	%g5
	add	%o7,	%i5,	%o5
	or	%i7,	%i3,	%g6
	nop
	set	0x38, %i5
	ldsw	[%l7 + %i5],	%i0
	set	0x58, %g2
	swapa	[%l7 + %g2] 0x88,	%g7
	nop
	set	0x26, %g1
	ldub	[%l7 + %g1],	%i4
	set	0x0C, %i4
	swapa	[%l7 + %i4] 0x88,	%l1
	set	0x20, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	nop
	set	0x30, %l5
	swap	[%l7 + %l5],	%o4
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	nop
	set	0x50, %o1
	std	%f16,	[%l7 + %o1]
	nop
	set	0x08, %l1
	prefetch	[%l7 + %l1],	 0
	and	%i1,	%l2,	%l6
	nop
	set	0x18, %o4
	ldsw	[%l7 + %o4],	%i6
	nop
	set	0x12, %l2
	ldsh	[%l7 + %l2],	%o6
	ld	[%l7 + 0x38],	%f8
	nop
	set	0x3A, %o5
	ldsh	[%l7 + %o5],	%o3
	nop
	set	0x70, %l0
	ldstub	[%l7 + %l0],	%l3
	nop
	set	0x18, %i7
	stw	%l5,	[%l7 + %i7]
	set	0x40, %o0
	stxa	%l0,	[%l7 + %o0] 0x88
	nop
	set	0x70, %l6
	ldub	[%l7 + %l6],	%o2
	set	0x2C, %g7
	stwa	%g1,	[%l7 + %g7] 0xea
	membar	#Sync
	or	%g4,	%g2,	%o1
	nop
	set	0x50, %o6
	std	%f14,	[%l7 + %o6]
	nop
	set	0x58, %i2
	std	%l4,	[%l7 + %i2]
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f14
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x89,	%g5
	nop
	set	0x4C, %g5
	lduw	[%l7 + %g5],	%g3
	set	0x38, %g3
	stda	%i4,	[%l7 + %g3] 0x80
	fpadd32	%f14,	%f8,	%f2
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o5
	st	%f8,	[%l7 + 0x38]
	nop
	set	0x65, %i6
	ldstub	[%l7 + %i6],	%i7
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x88,	 2
	nop
	set	0x7E, %l4
	ldub	[%l7 + %l4],	%g6
	set	0x20, %o7
	stda	%i0,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x50, %i5
	prefetch	[%l7 + %i5],	 4
	nop
	set	0x28, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x54, %g1
	sth	%i3,	[%l7 + %g1]
	nop
	set	0x66, %i4
	lduh	[%l7 + %i4],	%i4
	set	0x2A, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l1
	ba,pt	%icc,	loop_124
	nop
	set	0x70, %l5
	lduw	[%l7 + %l5],	%i2
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%g7
loop_124:
	nop
	set	0x60, %o1
	swap	[%l7 + %o1],	%i1
	nop
	set	0x11, %o4
	ldstub	[%l7 + %o4],	%o4
	nop
	set	0x28, %l1
	std	%f20,	[%l7 + %l1]
	or	%l6,	%i6,	%l2
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x81,	%o6
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x81,	%l2
	set	0x41, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l5
	nop
	set	0x30, %o0
	stx	%o3,	[%l7 + %o0]
	set	0x08, %l6
	stda	%l0,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x26, %g7
	lduh	[%l7 + %g7],	%o2
	nop
	set	0x4E, %l0
	sth	%g4,	[%l7 + %l0]
	set	0x24, %o6
	lda	[%l7 + %o6] 0x89,	%f21
	set	0x57, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%l4
	or	%g2,	%g5,	%g3
	set	0x1C, %l3
	sta	%f25,	[%l7 + %l3] 0x89
	nop
	set	0x4C, %o2
	ldsb	[%l7 + %o2],	%i5
	add	%o5,	%o0,	%o7
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x81,	%i7
	nop
	set	0x30, %g3
	stx	%i0,	[%l7 + %g3]
	set	0x7C, %i0
	stha	%i3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%f0
	nop
	set	0x10, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%g6,	%l1,	%i4
	set	0x12, %l4
	stha	%g7,	[%l7 + %l4] 0xea
	membar	#Sync
	or	%i1,	%o4,	%l6
	set	0x23, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i6
	nop
	set	0x54, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x48, %i3
	ldstub	[%l7 + %i3],	%i2
	nop
	set	0x20, %i1
	prefetch	[%l7 + %i1],	 1
	fpadd32	%f16,	%f20,	%f14
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o6
	set	0x64, %g1
	stha	%l3,	[%l7 + %g1] 0x89
	set	0x18, %g2
	stxa	%l5,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x43, %l5
	ldstub	[%l7 + %l5],	%l0
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f16
	nop
	set	0x36, %g6
	ldsb	[%l7 + %g6],	%o2
	nop
	set	0x78, %o1
	std	%o2,	[%l7 + %o1]
	nop
	set	0x2D, %l1
	ldstub	[%l7 + %l1],	%g1
	add	%g4,	%l4,	%o1
	nop
	set	0x38, %l2
	ldx	[%l7 + %l2],	%g5
	nop
	set	0x63, %o5
	ldsb	[%l7 + %o5],	%g3
	nop
	set	0x78, %i7
	stx	%i5,	[%l7 + %i7]
	nop
	set	0x52, %o4
	ldstub	[%l7 + %o4],	%g2
	nop
	set	0x68, %o0
	lduh	[%l7 + %o0],	%o5
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x81,	 2
	nop
	set	0x38, %l0
	ldsw	[%l7 + %l0],	%i7
	and	%i0,	%o7,	%g6
	set	0x1C, %o6
	stha	%l1,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x3C, %l6
	swapa	[%l7 + %l6] 0x81,	%i3
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%i4
	nop
	set	0x74, %o2
	swap	[%l7 + %o2],	%i1
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xe3,	%g6
	bgu,a	%icc,	loop_125
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%o4
	set	0x58, %o3
	stwa	%l6,	[%l7 + %o3] 0x80
loop_125:
	nop
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f16
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe3,	%i2
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l3
	bg,a	%xcc,	loop_126
	nop
	set	0x10, %o7
	std	%f30,	[%l7 + %o7]
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f24
	nop
	set	0x58, %i3
	sth	%l5,	[%l7 + %i3]
loop_126:
	nop
	set	0x38, %i5
	swap	[%l7 + %i5],	%o6
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x89,	%l0
	and	%o3,	%o2,	%g1
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xea,	%g4
	nop
	set	0x58, %g2
	stw	%l4,	[%l7 + %g2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%g5
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%g2
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	or	%g2,	%o5,	%i7
	and	%o0,	%o7,	%g6
	nop
	set	0x10, %o1
	std	%l0,	[%l7 + %o1]
	st	%f18,	[%l7 + 0x6C]
	nop
	set	0x38, %i4
	stx	%i0,	[%l7 + %i4]
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x89,	%i4
	set	0x24, %l2
	swapa	[%l7 + %l2] 0x80,	%i1
	set	0x40, %i7
	stxa	%i3,	[%l7 + %i7] 0x80
	nop
	set	0x68, %o5
	std	%f4,	[%l7 + %o5]
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%o4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xd0
	ld	[%l7 + 0x48],	%f6
	nop
	set	0x40, %l0
	sth	%g7,	[%l7 + %l0]
	ble,a,pn	%icc,	loop_127
	fpadd16	%f20,	%f14,	%f28
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
loop_127:
	or	%i2,	%i6,	%l3
	ld	[%l7 + 0x14],	%f21
	nop
	set	0x0C, %o0
	stw	%l5,	[%l7 + %o0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l0
	bleu,pn	%icc,	loop_128
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	set	0x54, %l3
	sth	%o6,	[%l7 + %l3]
	nop
	set	0x70, %g5
	lduw	[%l7 + %g5],	%o2
loop_128:
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%g1
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o1
	set	0x3E, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g5
	nop
	set	0x3E, %i6
	ldsb	[%l7 + %i6],	%g3
	ld	[%l7 + 0x30],	%f9
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%i5
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%g2
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x40, %i3
	std	%l4,	[%l7 + %i3]
	set	0x38, %i0
	stda	%i6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%o0
	set	0x30, %g1
	stwa	%o7,	[%l7 + %g1] 0x80
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%g6
	set	0x37, %l5
	stba	%o5,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x60, %g4
	swap	[%l7 + %g4],	%i0
	set	0x68, %g2
	stha	%i4,	[%l7 + %g2] 0x89
	nop
	set	0x70, %o1
	stx	%i1,	[%l7 + %o1]
	add	%l1,	%i3,	%o4
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%g7
	nop
	set	0x53, %i4
	stb	%l6,	[%l7 + %i4]
	nop
	set	0x10, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x60, %l1
	stx	%i2,	[%l7 + %l1]
	set	0x08, %o5
	stda	%i6,	[%l7 + %o5] 0x88
	st	%fsr,	[%l7 + 0x0C]
	ld	[%l7 + 0x24],	%f20
	nop
	set	0x78, %o4
	std	%f24,	[%l7 + %o4]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%l2
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x40, %l0
	ldsw	[%l7 + %l0],	%l3
	set	0x18, %o6
	stxa	%o6,	[%l7 + %o6] 0x89
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x70, %g7
	lduh	[%l7 + %g7],	%o2
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f6
	or	%g1,	%g4,	%o3
	add	%o1,	%l0,	%g5
	st	%f26,	[%l7 + 0x1C]
	set	0x08, %l3
	stxa	%g3,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x48, %l6
	std	%g2,	[%l7 + %l6]
	st	%f26,	[%l7 + 0x18]
	nop
	set	0x44, %g5
	stb	%l4,	[%l7 + %g5]
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x89,	%i4
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%i7
	nop
	set	0x26, %i6
	lduh	[%l7 + %i6],	%o0
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x68, %o3
	lda	[%l7 + %o3] 0x88,	%f0
	and	%o7,	%o5,	%i0
	nop
	set	0x18, %o7
	stx	%g6,	[%l7 + %o7]
	set	0x52, %l4
	ldstuba	[%l7 + %l4] 0x81,	%i1
	nop
	set	0x35, %i0
	stb	%i4,	[%l7 + %i0]
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x81,	 2
	ld	[%l7 + 0x5C],	%f8
	nop
	set	0x50, %i5
	stw	%l1,	[%l7 + %i5]
	nop
	set	0x44, %g1
	sth	%g7,	[%l7 + %g1]
	nop
	set	0x68, %i1
	std	%f2,	[%l7 + %i1]
	ld	[%l7 + 0x54],	%f12
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%i6
	set	0x44, %g2
	lda	[%l7 + %g2] 0x80,	%f5
	nop
	set	0x7F, %o1
	ldsb	[%l7 + %o1],	%o4
	bne,a,pt	%xcc,	loop_129
	nop
	set	0x48, %g6
	std	%i2,	[%l7 + %g6]
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x08, %l2
	std	%l4,	[%l7 + %l2]
loop_129:
	nop
	set	0x70, %l1
	stx	%l2,	[%l7 + %l1]
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x80,	%o6
	nop
	set	0x08, %o5
	swap	[%l7 + %o5],	%o2
	ld	[%l7 + 0x34],	%f10
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f14
	fpadd16	%f4,	%f26,	%f20
	nop
	set	0x52, %i7
	sth	%g1,	[%l7 + %i7]
	nop
	set	0x18, %l0
	std	%f8,	[%l7 + %l0]
	nop
	set	0x78, %g7
	lduh	[%l7 + %g7],	%g4
	add	%l3,	%o3,	%l0
	nop
	set	0x70, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x81,	%o1
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%g4
	and	%g3,	%g2,	%l4
	set	0x3C, %g5
	lda	[%l7 + %g5] 0x89,	%f14
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%i5
	set	0x6C, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o7
	nop
	set	0x70, %g3
	stb	%o0,	[%l7 + %g3]
	nop
	set	0x70, %i6
	std	%o4,	[%l7 + %i6]
	nop
	set	0x28, %i2
	stw	%i0,	[%l7 + %i2]
	ld	[%l7 + 0x08],	%f28
	wr	%g6,	%i4,	%softint
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%i2
	bg	%xcc,	loop_130
	ld	[%l7 + 0x58],	%f10
	set	0x4A, %l3
	stba	%l1,	[%l7 + %l3] 0xea
	membar	#Sync
loop_130:
	nop
	set	0x5D, %l4
	stb	%g7,	[%l7 + %l4]
	bn,pt	%icc,	loop_131
	nop
	set	0x2A, %i0
	ldstub	[%l7 + %i0],	%i1
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%o4
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
loop_131:
	nop
	set	0x40, %i3
	stha	%l6,	[%l7 + %i3] 0xeb
	membar	#Sync
	or	%l5,	%i6,	%o6
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x89,	%l2
	nop
	set	0x49, %l5
	stb	%g1,	[%l7 + %l5]
	set	0x30, %g2
	stwa	%o2,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%o1
	nop
	set	0x2A, %o1
	lduh	[%l7 + %o1],	%g5
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%g2
	fpsub32s	%f6,	%f0,	%f22
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf0
	membar	#Sync
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x89,	%g2
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%l4
	set	0x40, %i4
	stxa	%o3,	[%l7 + %i4] 0xe2
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%o5
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%i0
	nop
	set	0x7C, %o4
	stb	%g6,	[%l7 + %o4]
	set	0x34, %i7
	sta	%f19,	[%l7 + %i7] 0x88
	set	0x4C, %l0
	stwa	%i7,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x08, %g7
	stba	%i3,	[%l7 + %g7] 0xea
	membar	#Sync
	or	%l1,	%i4,	%g7
	ld	[%l7 + 0x3C],	%f28
	or	%o4,	%i2,	%i1
	st	%fsr,	[%l7 + 0x60]
	or	%l6,	%l5,	%i6
	bl,a,pt	%icc,	loop_132
	add	%o6,	%g1,	%o2
	set	0x28, %o0
	stxa	%l2,	[%l7 + %o0] 0xeb
	membar	#Sync
loop_132:
	nop
	set	0x4C, %o5
	lduw	[%l7 + %o5],	%g4
	nop
	set	0x3C, %l6
	ldub	[%l7 + %l6],	%l3
	nop
	set	0x08, %o6
	std	%l0,	[%l7 + %o6]
	nop
	set	0x44, %o2
	lduh	[%l7 + %o2],	%g5
	set	0x08, %g3
	stwa	%o1,	[%l7 + %g3] 0xe2
	membar	#Sync
	fpadd16s	%f25,	%f27,	%f5
	set	0x2E, %i6
	stba	%g3,	[%l7 + %i6] 0x88
	nop
	set	0x49, %i2
	ldsb	[%l7 + %i2],	%g2
	nop
	set	0x7C, %o3
	swap	[%l7 + %o3],	%o3
	set	0x50, %l3
	stda	%l4,	[%l7 + %l3] 0x88
	ld	[%l7 + 0x14],	%f13
	st	%f13,	[%l7 + 0x40]
	set	0x24, %l4
	stwa	%o7,	[%l7 + %l4] 0x88
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f16
	nop
	set	0x3A, %o7
	stb	%i5,	[%l7 + %o7]
	set	0x18, %i5
	stda	%o4,	[%l7 + %i5] 0x89
	nop
	nop
	setx	0xAAC1F924,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x251C4647,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f2,	%f21
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%o0
	and	%i0,	%i7,	%i3
	nop
	set	0x60, %g5
	std	%g6,	[%l7 + %g5]
	set	0x6B, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%o4
	set	0x20, %l5
	stxa	%i2,	[%l7 + %l5] 0x88
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x80,	%i1
	or	%l6,	%g7,	%l5
	set	0x50, %g2
	sta	%f17,	[%l7 + %g2] 0x88
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x45, %g6
	ldub	[%l7 + %g6],	%o6
	fpsub16	%f20,	%f2,	%f16
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xe2,	%i6
	fpsub32	%f4,	%f14,	%f10
	nop
	set	0x48, %i4
	swap	[%l7 + %i4],	%g1
	nop
	set	0x44, %l2
	swap	[%l7 + %l2],	%l2
	add	%g4,	%l3,	%o2
	nop
	set	0x78, %l1
	ldub	[%l7 + %l1],	%g5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o1
	nop
	set	0x10, %i7
	std	%f30,	[%l7 + %i7]
	nop
	set	0x14, %l0
	lduw	[%l7 + %l0],	%g3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%l4
	set	0x30, %g7
	stxa	%o7,	[%l7 + %g7] 0x88
	nop
	set	0x45, %o0
	ldub	[%l7 + %o0],	%i5
	nop
	set	0x68, %o5
	stb	%o3,	[%l7 + %o5]
	nop
	set	0x77, %l6
	ldstub	[%l7 + %l6],	%o5
	nop
	set	0x30, %o6
	lduh	[%l7 + %o6],	%i0
	nop
	set	0x1B, %o2
	ldstub	[%l7 + %o2],	%o0
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%i3
	nop
	set	0x28, %i6
	std	%f8,	[%l7 + %i6]
	bne	%xcc,	loop_133
	and	%i7,	%g6,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%i2
loop_133:
	nop
	set	0x17, %i2
	stba	%i1,	[%l7 + %i2] 0x88
	nop
	set	0x78, %o3
	std	%f6,	[%l7 + %o3]
	nop
	set	0x4B, %l3
	ldstub	[%l7 + %l3],	%l6
	add	%g7,	%i4,	%l5
	set	0x48, %l4
	stwa	%o6,	[%l7 + %l4] 0xe3
	membar	#Sync
	fpadd16	%f22,	%f18,	%f2
	or	%i6,	%g1,	%g4
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%l3
	fpsub32s	%f30,	%f26,	%f5
	set	0x70, %i0
	stda	%o2,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x81,	%l2
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%g4
	set	0x28, %i3
	stda	%l0,	[%l7 + %i3] 0x80
	add	%o1,	%g2,	%l4
	fpsub32	%f16,	%f4,	%f20
	nop
	set	0x68, %g5
	lduw	[%l7 + %g5],	%g3
	or	%i5,	%o7,	%o3
	fpadd32	%f20,	%f28,	%f16
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf1
	membar	#Sync
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x68, %i1
	ldub	[%l7 + %i1],	%i0
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xe2,	%o0
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%o5
	set	0x18, %g2
	lda	[%l7 + %g2] 0x80,	%f9
	set	0x78, %i4
	stxa	%i7,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x89,	%i2
	bn	%xcc,	loop_134
	ld	[%l7 + 0x44],	%f23
	set	0x10, %l1
	ldxa	[%l7 + %l1] 0x81,	%l1
loop_134:
	and	%o4,	%i2,	%i1
	nop
	set	0x24, %l2
	stw	%l6,	[%l7 + %l2]
	nop
	set	0x6B, %l0
	ldsb	[%l7 + %l0],	%g7
	nop
	set	0x6C, %g7
	ldub	[%l7 + %g7],	%g6
	nop
	set	0x78, %o0
	stx	%l5,	[%l7 + %o0]
	nop
	set	0x12, %i7
	lduh	[%l7 + %i7],	%o6
	wr	%i4,	%i6,	%pic
	nop
	set	0x6D, %o5
	ldsb	[%l7 + %o5],	%g1
	set	0x30, %o6
	stxa	%g4,	[%l7 + %o6] 0xe3
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%l3
	nop
	set	0x4E, %o2
	ldsb	[%l7 + %o2],	%g5
	nop
	set	0x50, %l6
	stb	%l2,	[%l7 + %l6]
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%o0
	add	%l0,	%g2,	%g3
	set	0x74, %i2
	stwa	%l4,	[%l7 + %i2] 0x88
	nop
	set	0x5C, %o3
	stb	%o7,	[%l7 + %o3]
	nop
	set	0x0A, %l3
	ldstub	[%l7 + %l3],	%o3
	nop
	set	0x72, %l4
	lduh	[%l7 + %l4],	%i0
	nop
	set	0x10, %g3
	std	%i4,	[%l7 + %g3]
	nop
	set	0x0C, %i0
	lduw	[%l7 + %i0],	%o5
	bge,a,pt	%xcc,	loop_135
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%f3,	[%l7 + 0x54]
	ld	[%l7 + 0x40],	%f5
loop_135:
	nop
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x81,	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%i3
	st	%f12,	[%l7 + 0x70]
	nop
	nop
	setx	0x99824C0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x8F435C33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f12,	%f27
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f10
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x81,	%l1
	nop
	set	0x18, %l5
	std	%i2,	[%l7 + %l5]
	set	0x28, %i1
	stxa	%o4,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x7C, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x50, %o1
	stha	%i1,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x46, %g2
	ldsh	[%l7 + %g2],	%l6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%g6
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x88,	 2
	set	0x48, %g1
	ldxa	[%l7 + %g1] 0x88,	%l5
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	set	0x08, %l2
	sta	%f16,	[%l7 + %l2] 0x88
	set	0x26, %l0
	stha	%i4,	[%l7 + %l0] 0x88
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x81,	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%g4
	nop
	set	0x6C, %g7
	stw	%l3,	[%l7 + %g7]
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x88,	%g4
	st	%f13,	[%l7 + 0x08]
	nop
	set	0x5D, %o0
	ldub	[%l7 + %o0],	%l2
	nop
	set	0x0C, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x1F, %o2
	ldstub	[%l7 + %o2],	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%o2
	nop
	set	0x7C, %l6
	swap	[%l7 + %l6],	%g3
	st	%f29,	[%l7 + 0x60]
	or	%g2,	%o7,	%l4
	nop
	set	0x57, %o5
	stb	%o3,	[%l7 + %o5]
	nop
	set	0x68, %i2
	lduw	[%l7 + %i2],	%i0
	nop
	set	0x0E, %i6
	sth	%o5,	[%l7 + %i6]
	set	0x30, %o3
	stha	%i5,	[%l7 + %o3] 0x81
	nop
	set	0x50, %l3
	swap	[%l7 + %l3],	%i7
	nop
	set	0x2A, %g3
	ldub	[%l7 + %g3],	%i3
	nop
	set	0x7E, %l4
	sth	%o0,	[%l7 + %l4]
	nop
	set	0x17, %i0
	ldub	[%l7 + %i0],	%l1
	and	%i2,	%o4,	%l6
	nop
	set	0x08, %o7
	ldsh	[%l7 + %o7],	%i1
	nop
	set	0x68, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x22, %i3
	lduh	[%l7 + %i3],	%g7
	nop
	set	0x7F, %o4
	ldstub	[%l7 + %o4],	%o6
	set	0x35, %g5
	stba	%g6,	[%l7 + %g5] 0x89
	nop
	set	0x72, %i1
	ldub	[%l7 + %i1],	%i4
	set	0x42, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l5
	add	%g1,	%i6,	%l3
	wr	%g4,	%l2,	%clear_softint
	set	0x50, %o1
	stha	%g5,	[%l7 + %o1] 0x80
	nop
	set	0x6C, %g2
	ldsw	[%l7 + %g2],	%o1
	set	0x20, %g6
	stxa	%l0,	[%l7 + %g6] 0x89
	fpsub16	%f20,	%f14,	%f10
	nop
	set	0x62, %g1
	lduh	[%l7 + %g1],	%o2
	nop
	set	0x48, %g4
	ldsh	[%l7 + %g4],	%g3
	nop
	set	0x2C, %l2
	ldub	[%l7 + %l2],	%o7
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xea,	%l4
	set	0x48, %l1
	swapa	[%l7 + %l1] 0x88,	%g2
	nop
	set	0x76, %g7
	ldsh	[%l7 + %g7],	%o3
	set	0x20, %i4
	stxa	%o5,	[%l7 + %i4] 0x89
	nop
	set	0x0F, %i7
	stb	%i0,	[%l7 + %i7]
	st	%f18,	[%l7 + 0x6C]
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%i4
	set	0x44, %o6
	stba	%i3,	[%l7 + %o6] 0xe3
	membar	#Sync
	add	%i7,	%l1,	%o0
	set	0x60, %o2
	stda	%i2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
	nop
	set	0x64, %l6
	ldsw	[%l7 + %l6],	%o4
	and	%l6,	%g7,	%i1
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%g6
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%o6
	set	0x38, %l3
	swapa	[%l7 + %l3] 0x81,	%i4
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x81,	%g1
	set	0x68, %o3
	stwa	%l5,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd8
	set	0x10, %i5
	stda	%g4,	[%l7 + %i5] 0x89
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0
	set	0x38, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	set	0x48, %g5
	stxa	%l3,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%o1,	%o2,	%l0
	set	0x40, %i1
	lda	[%l7 + %i1] 0x89,	%f3
	add	%g3,	%l4,	%g2
	nop
	set	0x58, %l5
	swap	[%l7 + %l5],	%o7
	set	0x78, %i3
	swapa	[%l7 + %i3] 0x80,	%o3
	set	0x58, %g2
	stda	%i0,	[%l7 + %g2] 0x81
	set	0x54, %o1
	lda	[%l7 + %o1] 0x81,	%f17
	set	0x79, %g6
	stba	%o5,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x70, %g4
	std	%f12,	[%l7 + %g4]
	nop
	set	0x08, %g1
	stx	%i5,	[%l7 + %g1]
	add	%i7,	%i3,	%l1
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x08, %l2
	std	%i2,	[%l7 + %l2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%l6
	nop
	set	0x30, %l1
	swap	[%l7 + %l1],	%g7
	wr	%i1,	%o4,	%set_softint
	bg	%icc,	loop_136
	fpsub16s	%f19,	%f0,	%f2
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xe3,	%o6
loop_136:
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%g6
	nop
	set	0x79, %l0
	ldstub	[%l7 + %l0],	%g1
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%i4
	nop
	set	0x3A, %o6
	ldstub	[%l7 + %o6],	%l5
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	set	0x28, %i7
	lda	[%l7 + %i7] 0x88,	%f4
	nop
	set	0x2C, %o5
	ldsb	[%l7 + %o5],	%g4
	set	0x3D, %i6
	stba	%i6,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x28, %i2
	stda	%g4,	[%l7 + %i2] 0x81
	nop
	set	0x60, %l3
	lduh	[%l7 + %l3],	%l2
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x88,	%l2
	set	0x78, %g3
	lda	[%l7 + %g3] 0x88,	%f26
	ld	[%l7 + 0x64],	%f3
	nop
	set	0x13, %o3
	stb	%o2,	[%l7 + %o3]
	ld	[%l7 + 0x28],	%f25
	set	0x6E, %l4
	stha	%o1,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x58, %i5
	std	%l0,	[%l7 + %i5]
	nop
	set	0x30, %i0
	std	%l4,	[%l7 + %i0]
	set	0x20, %o7
	stxa	%g3,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x2C, %g5
	stw	%g2,	[%l7 + %g5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	nop
	set	0x48, %l5
	stx	%o7,	[%l7 + %l5]
	nop
	set	0x30, %i3
	ldstub	[%l7 + %i3],	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o5
	add	%i5,	%i3,	%i7
	set	0x28, %o4
	stxa	%l1,	[%l7 + %o4] 0x89
	set	0x18, %g2
	lda	[%l7 + %g2] 0x88,	%f19
	or	%o0,	%l6,	%g7
	nop
	set	0x76, %o1
	lduh	[%l7 + %o1],	%i1
	set	0x27, %g4
	stba	%o4,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f20
	nop
	set	0x7E, %g6
	stb	%i2,	[%l7 + %g6]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x88,	 3
	nop
	set	0x78, %l1
	stx	%o6,	[%l7 + %l1]
	set	0x4A, %g7
	stha	%i4,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
	add	%g4,	%g1,	%g5
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%l2
	set	0x13, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i6
	st	%f11,	[%l7 + 0x0C]
	nop
	set	0x65, %o2
	ldsb	[%l7 + %o2],	%o2
	nop
	set	0x12, %o6
	sth	%o1,	[%l7 + %o6]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	nop
	set	0x24, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x58, %i6
	stw	%l3,	[%l7 + %i6]
	set	0x53, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l4
	or	%g3,	%g2,	%l0
	set	0x7A, %l3
	stba	%i0,	[%l7 + %l3] 0x80
	set	0x78, %l6
	stxa	%o3,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x17, %o3
	ldstub	[%l7 + %o3],	%o7
	and	%i5,	%o5,	%i7
	or	%i3,	%l1,	%o0
	nop
	set	0x38, %g3
	std	%i6,	[%l7 + %g3]
	nop
	set	0x67, %i5
	ldsb	[%l7 + %i5],	%g7
	nop
	set	0x61, %i0
	stb	%o4,	[%l7 + %i0]
	nop
	set	0x4A, %o7
	sth	%i1,	[%l7 + %o7]
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x80,	%g6
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%o6
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x5B, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i4
	or	%l5,	%i2,	%g1
	nop
	set	0x58, %i3
	std	%g4,	[%l7 + %i3]
	nop
	set	0x28, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x42, %g4
	sth	%g5,	[%l7 + %g4]
	bl,a,pn	%icc,	loop_137
	bl	%xcc,	loop_138
	st	%f20,	[%l7 + 0x60]
	set	0x08, %o1
	lda	[%l7 + %o1] 0x81,	%f2
loop_137:
	nop
	set	0x68, %g1
	lda	[%l7 + %g1] 0x88,	%f4
loop_138:
	nop
	set	0x0C, %g6
	sth	%i6,	[%l7 + %g6]
	and	%l2,	%o2,	%l3
	nop
	set	0x2E, %l2
	lduh	[%l7 + %l2],	%l4
	nop
	set	0x78, %l1
	sth	%g3,	[%l7 + %l1]
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x50, %g7
	lduh	[%l7 + %g7],	%o1
	and	%l0,	%i0,	%o3
	nop
	set	0x3C, %l0
	ldub	[%l7 + %l0],	%g2
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	or	%o7,	%i5,	%i7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f0
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f18
	nop
	set	0x16, %o6
	lduh	[%l7 + %o6],	%o5
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x2C, %i6
	ldsw	[%l7 + %i6],	%i3
	ld	[%l7 + 0x34],	%f10
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%o4
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%i1
	set	0x48, %l6
	stxa	%g6,	[%l7 + %l6] 0x80
	nop
	set	0x0E, %o3
	lduh	[%l7 + %o3],	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%i4
	nop
	set	0x28, %i5
	ldx	[%l7 + %i5],	%i2
	nop
	set	0x70, %g3
	stw	%g1,	[%l7 + %g3]
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	bne,a	%xcc,	loop_139
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%l5
	set	0x40, %l4
	stxa	%g5,	[%l7 + %l4] 0xea
	membar	#Sync
loop_139:
	nop
	set	0x30, %g5
	std	%f14,	[%l7 + %g5]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f16
	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	st	%f11,	[%l7 + 0x78]
	or	%i6,	%g4,	%l2
	nop
	set	0x58, %i1
	stw	%l3,	[%l7 + %i1]
	set	0x4E, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o2
	nop
	set	0x42, %g4
	lduh	[%l7 + %g4],	%g3
	fpsub32s	%f12,	%f25,	%f22
	nop
	set	0x7B, %o4
	ldstub	[%l7 + %o4],	%o1
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%l4
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x89,	%l0
	and	%o3,	%g2,	%o7
	set	0x14, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i5
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	set	0x6C, %g1
	sta	%f28,	[%l7 + %g1] 0x89
	set	0x74, %g7
	lda	[%l7 + %g7] 0x89,	%f4
	st	%f4,	[%l7 + 0x40]
	set	0x1B, %l0
	ldstuba	[%l7 + %l0] 0x80,	%i0
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%o5
	set	0x30, %o2
	prefetcha	[%l7 + %o2] 0x88,	 1
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x80,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o4
	nop
	set	0x10, %o0
	stx	%i1,	[%l7 + %o0]
	nop
	set	0x65, %i7
	ldsb	[%l7 + %i7],	%o0
	or	%g6,	%g7,	%o6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x88
	nop
	set	0x50, %i6
	lduw	[%l7 + %i6],	%i4
	ld	[%l7 + 0x78],	%f15
	nop
	set	0x50, %i2
	lduw	[%l7 + %i2],	%g1
	st	%fsr,	[%l7 + 0x68]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%g5
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%i6
	nop
	nop
	setx	0x265DF269E40D55E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x84B5139CE6DA493B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f22,	%f22
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%l2
	nop
	set	0x68, %l3
	std	%l4,	[%l7 + %l3]
	nop
	set	0x6C, %i5
	lduw	[%l7 + %i5],	%o2
	ld	[%l7 + 0x10],	%f21
	nop
	set	0x2C, %o3
	prefetch	[%l7 + %o3],	 4
	or	%g3,	%l3,	%l4
	fpsub16	%f4,	%f4,	%f28
	nop
	set	0x68, %i0
	std	%f18,	[%l7 + %i0]
	nop
	set	0x48, %o7
	ldub	[%l7 + %o7],	%l0
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%o0
	nop
	set	0x38, %g3
	std	%f4,	[%l7 + %g3]
	nop
	set	0x0C, %l5
	swap	[%l7 + %l5],	%g2
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x89,	%o7
	nop
	set	0x30, %g2
	ldx	[%l7 + %g2],	%o3
	nop
	set	0x72, %i1
	sth	%i5,	[%l7 + %i1]
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%i0
	set	0x3A, %g4
	stba	%o5,	[%l7 + %g4] 0xe3
	membar	#Sync
	bl,pt	%icc,	loop_140
	nop
	set	0x2B, %g6
	ldub	[%l7 + %g6],	%i7
	wr	%i3,	%l6,	%sys_tick
	set	0x1A, %l2
	stha	%l1,	[%l7 + %l2] 0x80
loop_140:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%o0
	set	0x44, %o1
	swapa	[%l7 + %o1] 0x81,	%g6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x88
	set	0x15, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o4
	nop
	set	0x10, %g7
	std	%f0,	[%l7 + %g7]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
	nop
	set	0x32, %o2
	ldsb	[%l7 + %o2],	%g7
	nop
	set	0x48, %l0
	stb	%o6,	[%l7 + %l0]
	nop
	set	0x4C, %o5
	swap	[%l7 + %o5],	%i4
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	fpsub32s	%f8,	%f7,	%f12
	add	%i2,	%g5,	%g1
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x88,	%g4
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x88,	%l2
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%i6
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%l5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%g3
	nop
	set	0x54, %l3
	sth	%l3,	[%l7 + %l3]
	ld	[%l7 + 0x10],	%f18
	nop
	set	0x0E, %o3
	ldsb	[%l7 + %o3],	%l0
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xea,	%o0
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe3,	%l4
	and	%g2,	%o3,	%o7
	st	%fsr,	[%l7 + 0x34]
	set	0x28, %l4
	ldxa	[%l7 + %l4] 0x80,	%i0
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	fpsub32	%f10,	%f0,	%f4
	wr 	%g0, 	0x5, 	%fprs
	add	%i3,	%l6,	%l1
	set	0x24, %g3
	lda	[%l7 + %g3] 0x89,	%f3
	set	0x60, %o7
	lda	[%l7 + %o7] 0x80,	%f25
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xe3,	%i0
	set	0x28, %g2
	stxa	%i5,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x74, %i1
	sta	%f27,	[%l7 + %i1] 0x88
	add	%o0,	%g6,	%o4
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x30, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x14, %g4
	ldstub	[%l7 + %g4],	%o6
	nop
	set	0x58, %g6
	std	%i4,	[%l7 + %g6]
	nop
	set	0x20, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	wr	%g5,	%i2,	%set_softint
	bg,a	%xcc,	loop_141
	nop
	set	0x54, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x2C, %l2
	lduw	[%l7 + %l2],	%g1
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
loop_141:
	add	%l2,	%l5,	%i6
	and	%o2,	%g3,	%l0
	nop
	set	0x4F, %g7
	ldstub	[%l7 + %g7],	%l3
	nop
	set	0x6A, %o2
	lduh	[%l7 + %o2],	%l4
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x89,	 4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o2
	wr	%g2,	%i0,	%softint
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f16
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x81,	%o5
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%i7
	bleu,a	%xcc,	loop_142
	nop
	set	0x18, %i2
	std	%f24,	[%l7 + %i2]
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%i2
	nop
	nop
	setx	0xC4D13B289EA85503,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xADE8B393F1E51BD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f26,	%f6
loop_142:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%l1
	nop
	set	0x40, %i6
	std	%i6,	[%l7 + %i6]
	nop
	set	0x2C, %l3
	ldstub	[%l7 + %l3],	%i5
	or	%i1,	%o0,	%g6
	set	0x40, %o3
	stda	%o4,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x38, %i0
	sth	%i4,	[%l7 + %i0]
	nop
	set	0x2C, %l6
	ldstub	[%l7 + %l6],	%g7
	or	%g5,	%i2,	%g1
	nop
	set	0x22, %l4
	ldub	[%l7 + %l4],	%o6
	nop
	set	0x2C, %g5
	swap	[%l7 + %g5],	%l2
	set	0x70, %g3
	stha	%l5,	[%l7 + %g3] 0x80
	st	%f1,	[%l7 + 0x30]
	set	0x4B, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i6
	set	0x28, %l5
	stxa	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x38, %i5
	stxa	%o2,	[%l7 + %i5] 0xe3
	membar	#Sync
	and	%g3,	%l0,	%l4
	set	0x48, %g2
	ldxa	[%l7 + %g2] 0x80,	%l3
	set	0x38, %o4
	lda	[%l7 + %o4] 0x81,	%f28
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%o3
	set	0x0C, %g6
	stwa	%g2,	[%l7 + %g6] 0x88
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x08, %g1
	std	%o0,	[%l7 + %g1]
	nop
	set	0x08, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x40, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x30, %l1
	std	%f10,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x730, 	%sys_tick_cmpr
	set	0x14, %o2
	stwa	%o7,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x70, %g7
	ldda	[%l7 + %g7] 0xea,	%l0
	add	%l6,	%i5,	%i1
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%i3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%o4
	nop
	set	0x5F, %i4
	ldstub	[%l7 + %i4],	%i4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%g5
	add	%g7,	%i2,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%l5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%g4
	nop
	set	0x38, %i7
	sth	%o2,	[%l7 + %i7]
	set	0x14, %o6
	swapa	[%l7 + %o6] 0x81,	%g3
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%i6
	nop
	set	0x10, %o5
	stw	%l0,	[%l7 + %o5]
	set	0x30, %i6
	stxa	%l3,	[%l7 + %i6] 0xeb
	membar	#Sync
	or	%o3,	%l4,	%o1
	set	0x1E, %o0
	stha	%g2,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x54, %o3
	swap	[%l7 + %o3],	%i7
	nop
	set	0x30, %l3
	sth	%o5,	[%l7 + %l3]
	nop
	set	0x24, %l6
	stw	%i0,	[%l7 + %l6]
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%o6
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f14
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x14, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x58, %l5
	stx	%l6,	[%l7 + %l5]
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%i5
	set	0x5C, %i5
	lda	[%l7 + %i5] 0x89,	%f12
	set	0x42, %g2
	stba	%i1,	[%l7 + %g2] 0x88
	add	%l1,	%i3,	%o0
	set	0x72, %o4
	stba	%i4,	[%l7 + %o4] 0x80
	nop
	set	0x69, %i1
	ldsb	[%l7 + %i1],	%o4
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f8
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x6C, %g6
	sta	%f17,	[%l7 + %g6] 0x88
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%g7
	st	%f29,	[%l7 + 0x44]
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x34, %l1
	prefetch	[%l7 + %l1],	 0
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%i2
	st	%f8,	[%l7 + 0x34]
	set	0x48, %l0
	stda	%l2,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x7C, %i4
	lduw	[%l7 + %i4],	%g1
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc2
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f22
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc0
	nop
	set	0x7A, %o2
	ldsh	[%l7 + %o2],	%l5
	nop
	set	0x40, %o5
	std	%f28,	[%l7 + %o5]
	nop
	set	0x60, %i6
	lduw	[%l7 + %i6],	%o6
	nop
	set	0x40, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x70, %o0
	stw	%g4,	[%l7 + %o0]
	set	0x0C, %l3
	stha	%o2,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x48, %l4
	stw	%i6,	[%l7 + %l4]
	nop
	set	0x7C, %i0
	ldsw	[%l7 + %i0],	%g3
	nop
	set	0x5C, %l6
	ldsh	[%l7 + %l6],	%l3
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x3E, %l5
	stha	%l0,	[%l7 + %l5] 0x81
	set	0x14, %o7
	stwa	%l4,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%o3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x78, %i1
	stw	%o1,	[%l7 + %i1]
	set	0x60, %i5
	lda	[%l7 + %i5] 0x88,	%f14
	nop
	set	0x46, %i3
	lduh	[%l7 + %i3],	%i7
	set	0x58, %g1
	stwa	%g2,	[%l7 + %g1] 0x89
	set	0x18, %g4
	lda	[%l7 + %g4] 0x88,	%f3
	ld	[%l7 + 0x74],	%f1
	ld	[%l7 + 0x1C],	%f2
	nop
	set	0x10, %o1
	ldstub	[%l7 + %o1],	%i0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%o4
	nop
	set	0x10, %g6
	sth	%l6,	[%l7 + %g6]
	bn,a	%icc,	loop_143
	ba,a,pn	%xcc,	loop_144
	nop
	set	0x2A, %l1
	lduh	[%l7 + %l1],	%o7
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x88,	 1
loop_143:
	nop
	nop
	setx	0x6D91434F98026252,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB2ADE6E6DC5BEF06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f8,	%f6
loop_144:
	nop
	set	0x48, %l0
	ldstuba	[%l7 + %l0] 0x81,	%l1
	nop
	set	0x68, %i7
	ldsw	[%l7 + %i7],	%i1
	add	%o0,	%i4,	%i3
	ld	[%l7 + 0x6C],	%f24
	or	%g5,	%o4,	%g7
	set	0x10, %i4
	stxa	%i2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x2C, %i2
	prefetch	[%l7 + %i2],	 3
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xea,	%g6
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%l2
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%g1
	set	0x24, %o3
	stha	%o6,	[%l7 + %o3] 0x80
	nop
	set	0x60, %i6
	std	%f18,	[%l7 + %i6]
	and	%g4,	%o2,	%i6
	st	%fsr,	[%l7 + 0x78]
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x89,	%l5
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
	st	%f10,	[%l7 + 0x50]
	add	%l0,	%l4,	%g3
	nop
	set	0x64, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%o3
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x3E, %i0
	ldstub	[%l7 + %i0],	%i7
	set	0x60, %l5
	stda	%o0,	[%l7 + %l5] 0x81
	set	0x40, %g5
	stxa	%i0,	[%l7 + %g5] 0x89
	or	%o5,	%g2,	%o7
	nop
	set	0x2C, %g2
	swap	[%l7 + %g2],	%i5
	and	%l6,	%l1,	%i1
	nop
	set	0x50, %o4
	lduw	[%l7 + %o4],	%o0
	nop
	set	0x4A, %i1
	ldstub	[%l7 + %i1],	%i3
	or	%i4,	%o4,	%g5
	set	, %o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1278
!	Type a   	: 21
!	Type cti   	: 37
!	Type x   	: 483
!	Type f   	: 46
!	Type i   	: 135
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
	set	0xA,	%g1
	set	0xF,	%g2
	set	0xA,	%g3
	set	0xC,	%g4
	set	0x3,	%g5
	set	0x7,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xD,	%i1
	set	-0x0,	%i2
	set	-0x6,	%i3
	set	-0xA,	%i4
	set	-0x6,	%i5
	set	-0x4,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x473FD00B,	%l0
	set	0x76D4C2ED,	%l1
	set	0x1870260C,	%l2
	set	0x365E9771,	%l3
	set	0x7B28E2F5,	%l4
	set	0x65706D4F,	%l5
	set	0x7566BF81,	%l6
	!# Output registers
	set	-0x1829,	%o0
	set	0x0ECC,	%o1
	set	0x03B5,	%o2
	set	0x142C,	%o3
	set	0x051A,	%o4
	set	-0x0BF5,	%o5
	set	-0x1324,	%o6
	set	0x0118,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	nop
	set	0x37, %i5
	stb	%i2,	[%l7 + %i5]
	and	%g7,	%l2,	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o6
	nop
	set	0x1A, %i3
	ldsh	[%l7 + %i3],	%o2
	set	0x32, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g4
	bleu,pn	%icc,	loop_145
	nop
	set	0x12, %g4
	ldstub	[%l7 + %g4],	%i6
	bn	%icc,	loop_146
	nop
	set	0x38, %l2
	stx	%l3,	[%l7 + %l2]
loop_145:
	nop
	set	0x32, %o1
	stba	%l5,	[%l7 + %o1] 0x81
loop_146:
	fpadd32	%f10,	%f14,	%f30
	set	0x10, %g6
	sta	%f26,	[%l7 + %g6] 0x81
	set	0x40, %g7
	ldxa	[%l7 + %g7] 0x89,	%l0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f16
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%g2
	set	0x10, %l1
	stda	%l4,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f18
	set	0x47, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i7
	set	0x34, %i2
	lda	[%l7 + %i2] 0x89,	%f8
	set	0x20, %o5
	stha	%o3,	[%l7 + %o5] 0x88
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f10
	st	%f16,	[%l7 + 0x78]
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%i0
	nop
	set	0x72, %o3
	ldub	[%l7 + %o3],	%o5
	nop
	set	0x3B, %l4
	ldstub	[%l7 + %l4],	%g2
	ld	[%l7 + 0x1C],	%f20
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%i5
	nop
	set	0x50, %l3
	std	%i6,	[%l7 + %l3]
	wr	%o1,	%l1,	%softint
	nop
	set	0x68, %g3
	lduw	[%l7 + %g3],	%o0
	set	0x78, %i0
	stxa	%i1,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x7E, %l5
	lduh	[%l7 + %l5],	%i3
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc8
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f22
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x80,	%o4
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd8
	st	%f18,	[%l7 + 0x68]
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%g5
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf9
	membar	#Sync
	nop
	set	0x2B, %i3
	ldstub	[%l7 + %i3],	%l2
	set	0x68, %g4
	ldxa	[%l7 + %g4] 0x80,	%g6
	set	0x50, %l2
	stxa	%g1,	[%l7 + %l2] 0x89
	set	0x30, %g1
	stxa	%o6,	[%l7 + %g1] 0xea
	membar	#Sync
	st	%f20,	[%l7 + 0x20]
	nop
	set	0x34, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf9
	membar	#Sync
	set	0x28, %g6
	swapa	[%l7 + %g6] 0x88,	%g7
	nop
	set	0x1E, %i7
	sth	%g4,	[%l7 + %i7]
	set	0x3C, %l0
	sta	%f29,	[%l7 + %l0] 0x81
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%i6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l3
	fpadd16s	%f1,	%f12,	%f17
	fpsub16s	%f21,	%f29,	%f5
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%l0
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%g3
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x89,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%o3
	nop
	set	0x10, %l1
	stx	%fsr,	[%l7 + %l1]
	and	%i0,	%o5,	%g2
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%o6
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x89,	 2
	nop
	set	0x74, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x16, %o3
	sth	%l6,	[%l7 + %o3]
	st	%f13,	[%l7 + 0x18]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x80
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f0
	set	0x5C, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i7
	nop
	set	0x19, %l3
	ldub	[%l7 + %l3],	%o1
	fpadd32s	%f6,	%f27,	%f9
	ld	[%l7 + 0x24],	%f10
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	st	%f16,	[%l7 + 0x3C]
	nop
	set	0x50, %l5
	std	%i0,	[%l7 + %l5]
	or	%i3,	%o4,	%i4
	bgu	%icc,	loop_147
	st	%f10,	[%l7 + 0x50]
	nop
	set	0x1C, %g2
	ldub	[%l7 + %g2],	%i2
	or	%l1,	%l2,	%g6
loop_147:
	nop
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x80,	%g5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f16
	nop
	set	0x2C, %o7
	ldsh	[%l7 + %o7],	%o6
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%g0
	nop
	set	0x09, %i1
	ldsb	[%l7 + %i1],	%g7
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x88,	%g4
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x88,	 4
	ld	[%l7 + 0x38],	%f0
	fpsub16	%f0,	%f6,	%f6
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%i6
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%l3
	set	0x5D, %g6
	stba	%l0,	[%l7 + %g6] 0x81
	and	%l4,	%g3,	%l5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xea,	%i0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xea,	%o6
	set	0x48, %o1
	stwa	%i5,	[%l7 + %o1] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i7
	nop
	set	0x48, %i4
	stw	%o1,	[%l7 + %i4]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd8,	%f0
	set	0x6C, %o5
	sta	%f7,	[%l7 + %o5] 0x89
	nop
	set	0x28, %l1
	ldx	[%l7 + %l1],	%o0
	nop
	set	0x14, %o2
	sth	%g2,	[%l7 + %o2]
	set	0x40, %i6
	ldxa	[%l7 + %i6] 0x80,	%i3
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	nop
	set	0x61, %o6
	stb	%i4,	[%l7 + %o6]
	nop
	set	0x2C, %o3
	ldsb	[%l7 + %o3],	%o4
	nop
	set	0x70, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x0C, %i0
	swapa	[%l7 + %i0] 0x80,	%l1
	nop
	set	0x26, %g3
	sth	%l2,	[%l7 + %g3]
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%g6
	st	%f1,	[%l7 + 0x24]
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 0
	or	%g5,	%i2,	%o6
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x88,	%g0
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x81
	st	%f4,	[%l7 + 0x70]
	and	%g7,	%o2,	%g4
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f14
	set	0x23, %o7
	stba	%i6,	[%l7 + %o7] 0x80
	ld	[%l7 + 0x7C],	%f19
	st	%fsr,	[%l7 + 0x28]
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x81,	%l0
	set	0x74, %i3
	lda	[%l7 + %i3] 0x80,	%f15
	nop
	set	0x18, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x7E, %l2
	ldub	[%l7 + %l2],	%l4
	set	0x68, %i1
	stha	%l5,	[%l7 + %i1] 0x81
	nop
	set	0x62, %g7
	ldsh	[%l7 + %g7],	%i0
	and	%o3,	%g3,	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%o7
	fpsub32s	%f13,	%f18,	%f12
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f0
	nop
	set	0x52, %i7
	lduh	[%l7 + %i7],	%l6
	add	%i7,	%o1,	%o0
	set	0x7B, %l0
	ldstuba	[%l7 + %l0] 0x89,	%i3
	nop
	set	0x6A, %g1
	ldsh	[%l7 + %g1],	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%i4
	st	%f11,	[%l7 + 0x64]
	add	%l1,	%o4,	%g6
	st	%f16,	[%l7 + 0x64]
	st	%f28,	[%l7 + 0x68]
	nop
	set	0x79, %i4
	ldub	[%l7 + %i4],	%g5
	set	0x0F, %i2
	stba	%i2,	[%l7 + %i2] 0x81
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%l2
	nop
	set	0x3B, %l1
	ldsb	[%l7 + %l1],	%o6
	ld	[%l7 + 0x34],	%f5
	set	0x08, %o5
	swapa	[%l7 + %o5] 0x89,	%g7
	set	0x47, %i6
	stba	%g1,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f0
	nop
	set	0x6C, %l4
	lduw	[%l7 + %l4],	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l3
	nop
	set	0x20, %o3
	stx	%l0,	[%l7 + %o3]
	nop
	set	0x4C, %o0
	ldsw	[%l7 + %o0],	%l4
	set	0x20, %i0
	stxa	%i6,	[%l7 + %i0] 0x88
	set	0x5A, %g3
	stha	%l5,	[%l7 + %g3] 0x81
	nop
	set	0x18, %o6
	lduw	[%l7 + %o6],	%i0
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f28
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f18
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x88,	%i5
	set	0x28, %g5
	stda	%o6,	[%l7 + %g5] 0x80
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i7
	nop
	set	0x30, %l5
	std	%o0,	[%l7 + %l5]
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%o0
	ld	[%l7 + 0x24],	%f20
	nop
	set	0x17, %l6
	ldub	[%l7 + %l6],	%i3
	set	0x7C, %i5
	stwa	%i1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%g2
	nop
	set	0x24, %g4
	stw	%i4,	[%l7 + %g4]
	nop
	set	0x56, %l2
	ldsb	[%l7 + %l2],	%l1
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%o4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f16
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f20
	set	0x68, %g7
	sta	%f18,	[%l7 + %g7] 0x80
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x88,	%g6
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x2C, %g1
	sth	%i2,	[%l7 + %g1]
	and	%g5,	%l2,	%o6
	set	0x64, %o1
	stwa	%g1,	[%l7 + %o1] 0x89
	set	0x5C, %l1
	swapa	[%l7 + %l1] 0x80,	%g7
	set	0x0C, %i2
	stwa	%o2,	[%l7 + %i2] 0x80
	nop
	set	0x40, %i6
	std	%g4,	[%l7 + %i6]
	set	0x08, %o2
	stxa	%l0,	[%l7 + %o2] 0x80
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f26
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	nop
	set	0x24, %o3
	prefetch	[%l7 + %o3],	 2
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x58, %i0
	stx	%l3,	[%l7 + %i0]
	nop
	set	0x28, %g3
	swap	[%l7 + %g3],	%l5
	set	0x28, %o6
	stxa	%i0,	[%l7 + %o6] 0x81
	set	0x64, %l3
	lda	[%l7 + %l3] 0x89,	%f22
	set	0x54, %o0
	sta	%f17,	[%l7 + %o0] 0x80
	set	0x6C, %g2
	stha	%i6,	[%l7 + %g2] 0xeb
	membar	#Sync
	st	%f25,	[%l7 + 0x34]
	fpadd32	%f22,	%f30,	%f12
	nop
	set	0x78, %g5
	std	%o2,	[%l7 + %g5]
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x88,	%g3
	nop
	set	0x3E, %o7
	lduh	[%l7 + %o7],	%i5
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%o7
	set	0x70, %o4
	ldxa	[%l7 + %o4] 0x81,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%o0
	set	0x18, %i3
	stwa	%i3,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	nop
	setx	0xC54A83DE655E1A3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCA5DD6B3ED55AEAE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f2,	%f6
	or	%o1,	%g2,	%i4
	set	0x60, %i5
	stwa	%i1,	[%l7 + %i5] 0x80
	set	0x41, %l2
	stba	%l1,	[%l7 + %l2] 0x88
	set	0x10, %g4
	lda	[%l7 + %g4] 0x88,	%f5
	nop
	set	0x4E, %i1
	ldsh	[%l7 + %i1],	%o4
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%f28
	set	0x52, %g6
	stha	%g6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x34, %g7
	ldsw	[%l7 + %g7],	%i2
	and	%g5,	%l2,	%o6
	bge,pt	%xcc,	loop_148
	nop
	set	0x58, %l0
	std	%g0,	[%l7 + %l0]
	nop
	set	0x4C, %i4
	sth	%o5,	[%l7 + %i4]
	nop
	nop
	setx	0x5261797A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x31618806,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f3,	%f29
loop_148:
	nop
	set	0x11, %g1
	stb	%o2,	[%l7 + %g1]
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x81,	%g7
	nop
	set	0x30, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x30, %i2
	stw	%l4,	[%l7 + %i2]
	set	0x70, %i6
	stwa	%l3,	[%l7 + %i6] 0x80
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%l5
	nop
	set	0x0A, %l4
	ldsh	[%l7 + %l4],	%i6
	set	0x60, %o2
	stwa	%i0,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x3C, %o3
	ldsw	[%l7 + %o3],	%o3
	set	0x38, %i0
	sta	%f1,	[%l7 + %i0] 0x81
	set	0x18, %o5
	stda	%i4,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe2,	%o6
	nop
	set	0x12, %o6
	stb	%l6,	[%l7 + %o6]
	st	%f29,	[%l7 + 0x2C]
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i7
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd8
	nop
	set	0x78, %l5
	swap	[%l7 + %l5],	%i3
	add	%o1,	%o0,	%g2
	set	0x22, %o7
	stba	%i1,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x6E, %l6
	sth	%l1,	[%l7 + %l6]
	ld	[%l7 + 0x68],	%f10
	nop
	set	0x2A, %o4
	lduh	[%l7 + %o4],	%i4
	nop
	set	0x74, %g2
	swap	[%l7 + %g2],	%g6
	st	%fsr,	[%l7 + 0x24]
	or	%i2,	%o4,	%g5
	set	0x50, %i3
	sta	%f21,	[%l7 + %i3] 0x80
	wr	%l2,	%g1,	%y
	ble,pn	%icc,	loop_149
	wr	%o6,	%o5,	%pic
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x88,	 4
loop_149:
	nop
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f0
	set	0x28, %i1
	stwa	%g7,	[%l7 + %i1] 0x80
	set	0x60, %i7
	stha	%l0,	[%l7 + %i7] 0x81
	set	0x2C, %g6
	stba	%l3,	[%l7 + %g6] 0x80
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xca
	ld	[%l7 + 0x60],	%f28
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%g4
	set	0x08, %g1
	stwa	%l5,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x6D, %o1
	stb	%i6,	[%l7 + %o1]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%f0
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x81,	%i0
	and	%l4,	%i5,	%o7
	set	0x20, %i6
	ldxa	[%l7 + %i6] 0x88,	%o3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i7
	set	0x70, %l4
	stda	%i2,	[%l7 + %l4] 0x88
	nop
	set	0x40, %o3
	std	%f0,	[%l7 + %o3]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f0
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xea,	%o0
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%g3
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x88,	%g2
	nop
	set	0x28, %l3
	std	%f0,	[%l7 + %l3]
	set	0x40, %o0
	prefetcha	[%l7 + %o0] 0x89,	 3
	set	0x48, %o6
	stda	%i0,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x0C, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i4
	nop
	set	0x4A, %o7
	ldub	[%l7 + %o7],	%g6
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x81,	%i2
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%l1
	nop
	set	0x1C, %g2
	ldsh	[%l7 + %g2],	%o4
	wr	%l2,	%g5,	%y
	nop
	set	0x28, %l6
	std	%g0,	[%l7 + %l6]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%o5
	nop
	set	0x3A, %l2
	ldsh	[%l7 + %l2],	%o2
	nop
	set	0x3F, %i3
	stb	%g7,	[%l7 + %i3]
	st	%f27,	[%l7 + 0x50]
	set	0x74, %g4
	stwa	%l0,	[%l7 + %g4] 0x89
	nop
	set	0x10, %i1
	lduh	[%l7 + %i1],	%g4
	nop
	set	0x7E, %i5
	sth	%l5,	[%l7 + %i5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i6
	nop
	set	0x6E, %i7
	stb	%i0,	[%l7 + %i7]
	nop
	set	0x44, %g6
	lduh	[%l7 + %g6],	%i5
	nop
	set	0x10, %l0
	stx	%o7,	[%l7 + %l0]
	fpsub16	%f18,	%f24,	%f8
	set	0x70, %i4
	stxa	%l4,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x31, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o3
	fpadd32	%f0,	%f22,	%f2
	nop
	set	0x60, %o1
	std	%i6,	[%l7 + %o1]
	nop
	set	0x70, %g1
	ldsw	[%l7 + %g1],	%i3
	set	0x70, %i2
	sta	%f9,	[%l7 + %i2] 0x80
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x89,	%f12
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc4
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f4
	set	0x19, %l1
	stba	%o1,	[%l7 + %l1] 0x81
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f0
	set	0x2F, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g3
	ld	[%l7 + 0x3C],	%f24
	set	0x52, %o5
	stha	%g2,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x24, %o2
	lda	[%l7 + %o2] 0x89,	%f24
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x80,	%o0
	wr	%l6,	%i4,	%softint
	set	0x64, %l3
	swapa	[%l7 + %l3] 0x80,	%g6
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x88,	%i2
	set	0x60, %g5
	stda	%i0,	[%l7 + %g5] 0x89
	nop
	set	0x18, %l5
	std	%o4,	[%l7 + %l5]
	set	0x70, %o4
	lda	[%l7 + %o4] 0x89,	%f1
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%l2
	nop
	set	0x48, %g2
	std	%g4,	[%l7 + %g2]
	set	0x7E, %l6
	stha	%l1,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f8
	nop
	set	0x78, %l2
	stx	%g1,	[%l7 + %l2]
	set	0x64, %g4
	sta	%f3,	[%l7 + %g4] 0x89
	set	0x7E, %i1
	stha	%o5,	[%l7 + %i1] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%o6
	set	0x60, %i5
	stxa	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x38, %g6
	sth	%g4,	[%l7 + %g6]
	fpsub16s	%f15,	%f19,	%f22
	set	0x30, %l0
	stda	%g6,	[%l7 + %l0] 0x89
	set	0x0C, %i4
	swapa	[%l7 + %i4] 0x88,	%l5
	ba,pt	%xcc,	loop_150
	nop
	set	0x54, %i7
	ldsw	[%l7 + %i7],	%i6
	set	0x2E, %g7
	stha	%i0,	[%l7 + %g7] 0xea
	membar	#Sync
loop_150:
	nop
	set	0x1C, %g1
	swapa	[%l7 + %g1] 0x88,	%l3
	fpsub16s	%f20,	%f7,	%f15
	add	%o7,	%l4,	%i5
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	and	%o3,	%i7,	%i3
	set	0x18, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o1
	nop
	set	0x50, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%g3
	ld	[%l7 + 0x5C],	%f21
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%o0
	nop
	set	0x4C, %i0
	sth	%g2,	[%l7 + %i0]
	nop
	set	0x10, %l1
	ldsw	[%l7 + %l1],	%l6
	nop
	set	0x08, %o5
	ldsw	[%l7 + %o5],	%g6
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%i4
	or	%i1,	%i2,	%l2
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f16
	fpadd32s	%f16,	%f13,	%f5
	nop
	set	0x5C, %l3
	stw	%o4,	[%l7 + %l3]
	fpadd16	%f6,	%f2,	%f16
	nop
	set	0x13, %o0
	stb	%l1,	[%l7 + %o0]
	bl,a,pn	%icc,	loop_151
	nop
	set	0x38, %o6
	std	%f20,	[%l7 + %o6]
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%g5
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x88,	 2
loop_151:
	nop
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x89,	 4
	wr	%o2,	%o6,	%ccr
	nop
	set	0x46, %g2
	sth	%g4,	[%l7 + %g2]
	st	%f3,	[%l7 + 0x60]
	nop
	set	0x74, %l5
	swap	[%l7 + %l5],	%g7
	set	0x5C, %l6
	lda	[%l7 + %l6] 0x80,	%f0
	nop
	set	0x60, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x72, %g4
	stha	%l0,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x64, %i1
	lda	[%l7 + %i1] 0x81,	%f18
	set	0x28, %i5
	stda	%i6,	[%l7 + %i5] 0x81
	set	0x18, %g6
	swapa	[%l7 + %g6] 0x80,	%i0
	set	0x70, %l0
	sta	%f30,	[%l7 + %l0] 0x81
	set	0x7C, %i3
	swapa	[%l7 + %i3] 0x81,	%l5
	set	0x74, %i4
	lda	[%l7 + %i4] 0x80,	%f4
	nop
	set	0x1C, %g7
	stw	%o7,	[%l7 + %g7]
	or	%l3,	%l4,	%i5
	nop
	set	0x4E, %g1
	ldsh	[%l7 + %g1],	%o3
	nop
	set	0x6C, %i7
	stw	%i3,	[%l7 + %i7]
	nop
	set	0x38, %o1
	ldsh	[%l7 + %o1],	%o1
	nop
	set	0x58, %i2
	stx	%i7,	[%l7 + %i2]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%g3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%g6
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x88,	%i4
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x80,	%i1
	st	%f29,	[%l7 + 0x68]
	nop
	set	0x44, %i0
	swap	[%l7 + %i0],	%l6
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x89,	%i2
	add	%o4,	%l2,	%l1
	and	%o5,	%g5,	%o2
	nop
	set	0x7B, %l1
	ldstub	[%l7 + %l1],	%o6
	nop
	set	0x15, %g3
	ldstub	[%l7 + %g3],	%g1
	nop
	set	0x46, %l3
	ldsb	[%l7 + %l3],	%g7
	set	0x30, %o0
	stxa	%l0,	[%l7 + %o0] 0x89
	ld	[%l7 + 0x2C],	%f3
	set	0x2C, %o6
	stwa	%i6,	[%l7 + %o6] 0x81
	nop
	set	0x28, %o2
	ldsw	[%l7 + %o2],	%g4
	nop
	set	0x70, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x79, %o7
	stba	%l5,	[%l7 + %o7] 0x80
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%o7
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f8
	st	%f3,	[%l7 + 0x7C]
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f24
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%l4
	nop
	set	0x78, %l2
	ldsw	[%l7 + %l2],	%i5
	or	%o3,	%i0,	%o1
	and	%i7,	%o0,	%g3
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%i3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%i4
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	nop
	set	0x08, %i1
	stw	%i1,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x30, %i5
	stda	%g6,	[%l7 + %i5] 0x81
	nop
	nop
	setx	0x2491011044F595B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x875B040A8E0F31D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f16
	st	%fsr,	[%l7 + 0x30]
	set	0x58, %l0
	stda	%i2,	[%l7 + %l0] 0x88
	or	%l6,	%o4,	%l2
	nop
	set	0x1F, %i3
	ldsb	[%l7 + %i3],	%o5
	nop
	set	0x38, %i4
	swap	[%l7 + %i4],	%g5
	nop
	set	0x09, %g1
	stb	%o2,	[%l7 + %g1]
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x62, %o1
	sth	%l1,	[%l7 + %o1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%g7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l0
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f26
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f16
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f0
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x89,	%g4
	nop
	set	0x24, %i0
	ldsh	[%l7 + %i0],	%i6
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x88,	%o7
	st	%f10,	[%l7 + 0x30]
	nop
	set	0x60, %o3
	stx	%fsr,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x74]
	fpsub32s	%f5,	%f28,	%f0
	nop
	set	0x14, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%l5
	fpadd32	%f18,	%f18,	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%l3
	nop
	set	0x26, %l3
	lduh	[%l7 + %l3],	%i5
	nop
	set	0x08, %o6
	std	%o2,	[%l7 + %o6]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	nop
	set	0x7C, %g5
	ldsh	[%l7 + %g5],	%o1
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%i7
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd8
	add	%i0,	%g3,	%i3
	nop
	set	0x3F, %o7
	ldstub	[%l7 + %o7],	%o0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%i4
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%i0
	set	0x30, %g4
	lda	[%l7 + %g4] 0x89,	%f28
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x88,	 3
	nop
	set	0x0C, %i1
	ldstub	[%l7 + %i1],	%i2
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x38, %i5
	lduw	[%l7 + %i5],	%g2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o5
	nop
	set	0x68, %i4
	std	%g4,	[%l7 + %i4]
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%o2
	ld	[%l7 + 0x74],	%f27
	nop
	set	0x34, %i7
	lduh	[%l7 + %i7],	%l1
	nop
	set	0x10, %i3
	sth	%o6,	[%l7 + %i3]
	st	%f12,	[%l7 + 0x1C]
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x88,	%g7
	bg,pn	%xcc,	loop_152
	and	%l2,	%g1,	%g4
	set	0x29, %i2
	stba	%l0,	[%l7 + %i2] 0x80
loop_152:
	add	%i6,	%o7,	%l4
	set	0x40, %g7
	ldxa	[%l7 + %g7] 0x88,	%l3
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%l5
	nop
	set	0x26, %i0
	lduh	[%l7 + %i0],	%i5
	nop
	set	0x6F, %l4
	stb	%o1,	[%l7 + %l4]
	set	0x18, %o5
	stwa	%i7,	[%l7 + %o5] 0x88
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f16
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%i0
	nop
	set	0x63, %l3
	ldub	[%l7 + %l3],	%g3
	nop
	set	0x18, %o6
	stx	%o3,	[%l7 + %o6]
	nop
	set	0x64, %o2
	ldsw	[%l7 + %o2],	%i3
	ld	[%l7 + 0x24],	%f13
	set	0x3C, %l1
	stwa	%o0,	[%l7 + %l1] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%i4
	set	0x2D, %g5
	stba	%i2,	[%l7 + %g5] 0x88
	set	0x58, %o0
	stxa	%g6,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x38, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	nop
	set	0x1B, %o7
	stb	%l6,	[%l7 + %o7]
	nop
	set	0x28, %g2
	stw	%o4,	[%l7 + %g2]
	set	0x20, %g4
	stba	%g5,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f2
	nop
	set	0x18, %i1
	ldsw	[%l7 + %i1],	%o5
	set	0x2A, %l2
	stba	%l1,	[%l7 + %l2] 0x80
	or	%o6,	%g7,	%o2
	or	%l2,	%g1,	%l0
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%i6
	set	0x5A, %l6
	stha	%g4,	[%l7 + %l6] 0x80
	nop
	set	0x18, %l0
	ldsh	[%l7 + %l0],	%o7
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc0
	set	0x20, %g1
	stxa	%l4,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	nop
	set	0x42, %i7
	stb	%l3,	[%l7 + %i7]
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xea,	%i4
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x88,	 1
	nop
	set	0x7C, %g7
	stw	%i7,	[%l7 + %g7]
	st	%f0,	[%l7 + 0x50]
	set	0x5C, %i6
	lda	[%l7 + %i6] 0x89,	%f13
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%g3
	nop
	set	0x48, %i2
	prefetch	[%l7 + %i2],	 3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
	nop
	set	0x3E, %o5
	ldsh	[%l7 + %o5],	%i0
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x81,	%i3
	or	%o3,	%o0,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%i1
	nop
	set	0x2D, %g3
	ldub	[%l7 + %g3],	%g6
	nop
	set	0x20, %l3
	std	%f18,	[%l7 + %l3]
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x88,	%g2
	nop
	set	0x58, %l1
	std	%i6,	[%l7 + %l1]
	nop
	set	0x6E, %g5
	ldsh	[%l7 + %g5],	%o4
	ld	[%l7 + 0x1C],	%f31
	and	%g5,	%o5,	%l1
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f16
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f28
	nop
	set	0x5C, %o7
	ldstub	[%l7 + %o7],	%o6
	nop
	set	0x60, %g2
	stx	%o2,	[%l7 + %g2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5D6, 	%tick_cmpr
	nop
	set	0x58, %o4
	stw	%l0,	[%l7 + %o4]
	set	0x54, %g4
	stwa	%l2,	[%l7 + %g4] 0x80
	set	0x34, %l5
	stha	%i6,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x68, %l2
	stb	%o7,	[%l7 + %l2]
	nop
	set	0x44, %g6
	stw	%l4,	[%l7 + %g6]
	nop
	set	0x0C, %l6
	ldsw	[%l7 + %l6],	%g4
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%l3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
	set	0x18, %g1
	stba	%l5,	[%l7 + %g1] 0xeb
	membar	#Sync
	and	%i5,	%i7,	%g3
	set	0x20, %i5
	stxa	%o1,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x0A, %i7
	ldstub	[%l7 + %i7],	%i0
	set	0x4A, %i3
	stha	%o3,	[%l7 + %i3] 0x81
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xda
	nop
	set	0x32, %i4
	ldsb	[%l7 + %i4],	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%i2
	st	%f3,	[%l7 + 0x2C]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%i4
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%g6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd2
	ld	[%l7 + 0x20],	%f25
	add	%l6,	%o4,	%g5
	nop
	set	0x7A, %i2
	lduh	[%l7 + %i2],	%g2
	ld	[%l7 + 0x48],	%f19
	nop
	set	0x58, %g7
	ldub	[%l7 + %g7],	%o5
	set	0x37, %o5
	stba	%l1,	[%l7 + %o5] 0x81
	nop
	set	0x50, %o3
	stx	%o6,	[%l7 + %o3]
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x88,	%o2
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%g1
	set	0x70, %l3
	stxa	%g7,	[%l7 + %l3] 0x80
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%o7
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf8
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	set	0x49, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l4
	set	0x11, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i6
	set	0x08, %o4
	lda	[%l7 + %o4] 0x80,	%f0
	nop
	set	0x70, %o0
	ldsw	[%l7 + %o0],	%g4
	nop
	set	0x0D, %l5
	ldsb	[%l7 + %l5],	%l3
	set	0x28, %g4
	stwa	%l5,	[%l7 + %g4] 0x88
	nop
	set	0x4C, %g6
	stw	%i5,	[%l7 + %g6]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x89,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFC3, 	%sys_tick_cmpr
	bn,pt	%icc,	loop_153
	nop
	set	0x4C, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%o0
	or	%o3,	%o0,	%i3
loop_153:
	nop
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x88,	 3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%g6
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l6
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%f30
	nop
	set	0x12, %o1
	ldsb	[%l7 + %o1],	%o4
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%g5
	nop
	set	0x38, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x08, %i0
	ldsh	[%l7 + %i0],	%g2
	set	0x28, %i2
	swapa	[%l7 + %i2] 0x81,	%i4
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x81,	 1
	nop
	set	0x28, %i6
	lduh	[%l7 + %i6],	%o5
	set	0x4A, %o5
	stba	%o6,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%o2
	set	0x58, %g3
	stwa	%g7,	[%l7 + %g3] 0x89
	nop
	set	0x70, %l3
	ldx	[%l7 + %l3],	%l0
	or	%l2,	%o7,	%g1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf0
	membar	#Sync
	set	0x28, %l4
	stwa	%l4,	[%l7 + %l4] 0x89
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%g4
	set	0x58, %g5
	stxa	%l5,	[%l7 + %g5] 0xe3
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%i7
	set	0x08, %o2
	stxa	%i5,	[%l7 + %o2] 0x88
	bl	%icc,	loop_154
	fpadd16	%f24,	%f20,	%f10
	nop
	set	0x36, %o6
	ldstub	[%l7 + %o6],	%g3
	set	0x74, %o7
	stwa	%i0,	[%l7 + %o7] 0x88
loop_154:
	ld	[%l7 + 0x18],	%f26
	wr	%o1,	%o0,	%clear_softint
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f18
	nop
	set	0x37, %o0
	ldstub	[%l7 + %o0],	%i3
	nop
	set	0x60, %l5
	ldub	[%l7 + %l5],	%o3
	add	%i1,	%i2,	%l6
	add	%g6,	%g5,	%o4
	st	%f1,	[%l7 + 0x08]
	set	0x25, %o4
	stba	%i4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x24, %g4
	sta	%f14,	[%l7 + %g4] 0x81
	nop
	set	0x5C, %g6
	swap	[%l7 + %g6],	%g2
	add	%o5,	%l1,	%o2
	nop
	set	0x28, %l2
	stx	%g7,	[%l7 + %l2]
	nop
	set	0x24, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x10, %g1
	lda	[%l7 + %g1] 0x80,	%f5
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x89,	%o6
	set	0x30, %i1
	sta	%f15,	[%l7 + %i1] 0x88
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd8
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x89,	%l0
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x10, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%l2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc2
	nop
	set	0x2E, %i7
	ldub	[%l7 + %i7],	%l4
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%g1
	nop
	set	0x34, %i2
	ldsh	[%l7 + %i2],	%i6
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x4D, %i6
	ldstub	[%l7 + %i6],	%l5
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x08, %o5
	std	%f18,	[%l7 + %o5]
	fpsub32	%f20,	%f10,	%f16
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xcc
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%l2
	st	%f14,	[%l7 + 0x48]
	nop
	set	0x1C, %g3
	ldsh	[%l7 + %g3],	%g4
	set	0x6C, %g5
	stha	%i5,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x28, %o2
	stwa	%i7,	[%l7 + %o2] 0x80
	nop
	set	0x14, %o6
	stw	%i0,	[%l7 + %o6]
	set	0x22, %l4
	ldstuba	[%l7 + %l4] 0x88,	%g3
	ld	[%l7 + 0x78],	%f26
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x80,	%o1
	set	0x68, %o7
	stda	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o3
	set	0x14, %l5
	lda	[%l7 + %l5] 0x89,	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%i2
	set	0x08, %o4
	sta	%f29,	[%l7 + %o4] 0x89
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x80,	 1
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f26
	nop
	set	0x62, %o0
	ldstub	[%l7 + %o0],	%g5
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%l6
	nop
	set	0x34, %l2
	stw	%o4,	[%l7 + %l2]
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%i4
	set	0x25, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%g7
	or	%l0,	%o7,	%o6
	and	%l2,	%g1,	%i6
	set	0x18, %g1
	stha	%l5,	[%l7 + %g1] 0x88
	nop
	set	0x62, %i5
	sth	%l3,	[%l7 + %i5]
	nop
	set	0x54, %o1
	ldsh	[%l7 + %o1],	%l4
	ba,pn	%icc,	loop_155
	nop
	set	0x18, %i4
	std	%f8,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x39, %i0
	ldsb	[%l7 + %i0],	%g4
loop_155:
	or	%i7,	%i0,	%g3
	nop
	set	0x4C, %i3
	lduw	[%l7 + %i3],	%o1
	nop
	set	0x24, %i7
	sth	%i5,	[%l7 + %i7]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o3
	nop
	set	0x08, %g7
	std	%i2,	[%l7 + %g7]
	set	0x57, %i2
	stba	%i2,	[%l7 + %i2] 0x89
	nop
	set	0x10, %o3
	stw	%g6,	[%l7 + %o3]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%l6
	ld	[%l7 + 0x4C],	%f21
	set	0x30, %o5
	stda	%i0,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x3C, %i6
	lduw	[%l7 + %i6],	%g2
	set	0x48, %g3
	swapa	[%l7 + %g3] 0x80,	%o5
	nop
	set	0x2A, %g5
	lduh	[%l7 + %g5],	%l1
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x88,	%o2
	nop
	set	0x4C, %o6
	swap	[%l7 + %o6],	%g7
	nop
	set	0x70, %l4
	ldsw	[%l7 + %l4],	%l0
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%o7
	nop
	set	0x0E, %g2
	ldub	[%l7 + %g2],	%i4
	set	0x14, %l5
	stwa	%o6,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x1C, %o7
	ldsw	[%l7 + %o7],	%g1
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x89,	%l2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc2
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%i6
	set	0x74, %g4
	stwa	%l5,	[%l7 + %g4] 0xe2
	membar	#Sync
	or	%l3,	%l4,	%i7
	nop
	set	0x30, %l6
	stx	%g4,	[%l7 + %l6]
	nop
	set	0x27, %l2
	ldstub	[%l7 + %l2],	%i0
	wr	%o1,	%g3,	%pic
	nop
	set	0x56, %i1
	sth	%i5,	[%l7 + %i1]
	set	0x74, %l0
	lda	[%l7 + %l0] 0x88,	%f9
	nop
	set	0x38, %i5
	lduw	[%l7 + %i5],	%o3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%i3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%i2
	ld	[%l7 + 0x54],	%f13
	set	0x74, %i4
	stwa	%g5,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x58, %i0
	std	%i0,	[%l7 + %i0]
	set	0x58, %o1
	stxa	%l6,	[%l7 + %o1] 0xe3
	membar	#Sync
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%g2
	ble,pn	%icc,	loop_156
	nop
	set	0x20, %i7
	std	%f4,	[%l7 + %i7]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f16
loop_156:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o2
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x14, %o3
	sta	%f3,	[%l7 + %o3] 0x81
	nop
	set	0x44, %o5
	stw	%g7,	[%l7 + %o5]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f0
	set	0x2C, %g3
	sta	%f4,	[%l7 + %g3] 0x88
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%o5
	nop
	set	0x20, %l1
	stx	%l0,	[%l7 + %l1]
	nop
	set	0x74, %o6
	ldstub	[%l7 + %o6],	%o7
	nop
	set	0x76, %g5
	sth	%i4,	[%l7 + %g5]
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%g1
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%l2
	or	%o6,	%i6,	%l5
	set	0x30, %g2
	stwa	%l4,	[%l7 + %g2] 0xe3
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%l3
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%g4
	set	0x77, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i5
	or	%o3,	%o0,	%g3
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf9
	membar	#Sync
	set	0x68, %g6
	sta	%f5,	[%l7 + %g6] 0x88
	set	0x28, %g4
	stha	%g6,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x18, %l6
	swapa	[%l7 + %l6] 0x89,	%i2
	set	0x29, %l2
	stba	%i3,	[%l7 + %l2] 0x80
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x80,	 2
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 4
	ld	[%l7 + 0x2C],	%f22
	add	%i1,	%o4,	%l6
	nop
	set	0x60, %o0
	stx	%l1,	[%l7 + %o0]
	set	0x1E, %g1
	stha	%g2,	[%l7 + %g1] 0x88
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f10
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x80,	%g7
	set	0x64, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o2
	nop
	set	0x74, %i0
	stw	%l0,	[%l7 + %i0]
	nop
	set	0x5C, %g7
	stw	%o7,	[%l7 + %g7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g1
	set	0x10, %i3
	stha	%l2,	[%l7 + %i3] 0x80
	set	0x26, %o3
	stha	%i4,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x30, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x0E, %i7
	ldsb	[%l7 + %i7],	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i6
	nop
	set	0x08, %i6
	std	%f28,	[%l7 + %i6]
	nop
	set	0x38, %g3
	stw	%i7,	[%l7 + %g3]
	nop
	set	0x1D, %l1
	ldub	[%l7 + %l1],	%l4
	fpsub16s	%f23,	%f23,	%f27
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x89
	set	0x54, %i2
	ldstuba	[%l7 + %i2] 0x81,	%l3
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x08, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%i0
	ble,a,pn	%icc,	loop_157
	nop
	set	0x78, %g2
	swap	[%l7 + %g2],	%o1
	set	0x40, %g5
	stda	%i4,	[%l7 + %g5] 0xeb
	membar	#Sync
loop_157:
	nop
	set	0x28, %o4
	stda	%o0,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x2E, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o3
	nop
	set	0x78, %g6
	std	%g6,	[%l7 + %g6]
	nop
	set	0x4C, %g4
	stb	%g3,	[%l7 + %g4]
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x89,	%i3
	nop
	set	0x18, %l6
	ldstub	[%l7 + %l6],	%g5
	set	0x36, %i1
	stha	%i2,	[%l7 + %i1] 0xea
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%l6
	add	%o4,	%g2,	%g7
	nop
	set	0x54, %l2
	lduh	[%l7 + %l2],	%o2
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f0
	set	0x08, %i5
	lda	[%l7 + %i5] 0x81,	%f26
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%l0
	set	0x67, %o1
	stba	%o7,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%l2
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%g1
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%o6
	set	0x70, %g7
	stxa	%i4,	[%l7 + %g7] 0x88
	nop
	set	0x1F, %o3
	ldsb	[%l7 + %o3],	%l5
	nop
	set	0x68, %i3
	stw	%i6,	[%l7 + %i3]
	nop
	set	0x18, %o5
	std	%l4,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd8
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x89,	%i7
	nop
	set	0x60, %l1
	stx	%g4,	[%l7 + %l1]
	nop
	set	0x14, %i7
	stw	%l3,	[%l7 + %i7]
	nop
	set	0x44, %i2
	sth	%o1,	[%l7 + %i2]
	set	0x68, %o6
	stda	%i0,	[%l7 + %o6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	set	0x54, %l4
	lda	[%l7 + %l4] 0x81,	%f24
	st	%f2,	[%l7 + 0x24]
	nop
	set	0x5C, %g2
	stw	%i5,	[%l7 + %g2]
	nop
	set	0x0C, %g5
	prefetch	[%l7 + %g5],	 2
	set	0x24, %o4
	swapa	[%l7 + %o4] 0x89,	%o3
	nop
	set	0x60, %o2
	std	%f4,	[%l7 + %o2]
	set	0x5C, %o7
	swapa	[%l7 + %o7] 0x80,	%o0
	set	0x54, %g6
	sta	%f7,	[%l7 + %g6] 0x80
	nop
	set	0x36, %l5
	lduh	[%l7 + %l5],	%g6
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f0
	nop
	set	0x4E, %i1
	ldsh	[%l7 + %i1],	%i3
	nop
	set	0x24, %l2
	lduw	[%l7 + %l2],	%g5
	st	%fsr,	[%l7 + 0x78]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f28
	nop
	set	0x36, %o0
	lduh	[%l7 + %o0],	%g3
	nop
	set	0x74, %i5
	swap	[%l7 + %i5],	%i2
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%l6
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	nop
	set	0x18, %o1
	stx	%o4,	[%l7 + %o1]
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	or	%g7,	%o2,	%l0
	ld	[%l7 + 0x2C],	%f9
	set	0x64, %g7
	stwa	%i1,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFA7, 	%tick_cmpr
	nop
	set	0x60, %o3
	ldsw	[%l7 + %o3],	%l2
	set	0x6E, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o5
	set	0x6A, %l3
	stba	%g1,	[%l7 + %l3] 0x89
	set	0x70, %i6
	stwa	%i4,	[%l7 + %i6] 0x80
	nop
	set	0x38, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x80,	%o6
	nop
	set	0x28, %i7
	stb	%l5,	[%l7 + %i7]
	nop
	set	0x08, %i2
	stw	%i6,	[%l7 + %i2]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xda
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x56, %l4
	lduh	[%l7 + %l4],	%i7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%l3
	nop
	set	0x40, %l1
	lduh	[%l7 + %l1],	%o1
	set	0x20, %g5
	stwa	%i0,	[%l7 + %g5] 0x80
	and	%g4,	%o3,	%i5
	nop
	set	0x36, %o4
	lduh	[%l7 + %o4],	%g6
	nop
	set	0x20, %o2
	stx	%o0,	[%l7 + %o2]
	nop
	set	0x4C, %o7
	ldsw	[%l7 + %o7],	%g5
	nop
	set	0x52, %g2
	sth	%i3,	[%l7 + %g2]
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x81,	%i2
	st	%fsr,	[%l7 + 0x34]
	ld	[%l7 + 0x24],	%f22
	set	0x5C, %l6
	lda	[%l7 + %l6] 0x89,	%f16
	nop
	set	0x74, %l5
	ldstub	[%l7 + %l5],	%g3
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x80,	 3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%o4
	set	0x5C, %g4
	stwa	%g7,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x40, %l0
	stda	%l0,	[%l7 + %l0] 0x88
	nop
	set	0x27, %i5
	ldsb	[%l7 + %i5],	%o2
	nop
	set	0x4E, %g1
	lduh	[%l7 + %g1],	%i1
	wr 	%g0, 	0x5, 	%fprs
	set	0x78, %i0
	stha	%o5,	[%l7 + %i0] 0x80
	set	0x10, %o1
	stxa	%o7,	[%l7 + %o1] 0x88
	nop
	set	0x70, %o0
	std	%f28,	[%l7 + %o0]
	nop
	set	0x44, %i4
	prefetch	[%l7 + %i4],	 0
	wr	%i4,	%g1,	%softint
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l5
	nop
	set	0x38, %g7
	lduh	[%l7 + %g7],	%i6
	nop
	set	0x0C, %o5
	ldstub	[%l7 + %o5],	%l4
	set	0x5A, %o3
	stha	%l3,	[%l7 + %o3] 0x80
	wr	%i7,	%i0,	%ccr
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%g4
	st	%f4,	[%l7 + 0x1C]
	nop
	set	0x50, %i3
	stw	%o3,	[%l7 + %i3]
	set	0x78, %i6
	sta	%f7,	[%l7 + %i6] 0x88
	and	%o1,	%i5,	%g6
	ld	[%l7 + 0x38],	%f6
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x80,	%g5
	nop
	set	0x08, %i2
	std	%i2,	[%l7 + %i2]
	set	0x08, %g3
	stda	%o0,	[%l7 + %g3] 0x81
	nop
	set	0x50, %l4
	ldx	[%l7 + %l4],	%g3
	ld	[%l7 + 0x54],	%f9
	and	%i2,	%g2,	%o4
	nop
	set	0x27, %l1
	ldsb	[%l7 + %l1],	%g7
	or	%l0,	%o2,	%l6
	set	0x3C, %o6
	ldstuba	[%l7 + %o6] 0x88,	%l1
	set	0x4C, %g5
	stwa	%l2,	[%l7 + %g5] 0x81
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%o5
	set	0x6C, %o2
	stba	%i4,	[%l7 + %o2] 0x80
	nop
	set	0x7D, %o4
	ldstub	[%l7 + %o4],	%g1
	add	%o7,	%o6,	%i6
	nop
	set	0x43, %o7
	ldub	[%l7 + %o7],	%l4
	nop
	set	0x70, %g2
	ldsw	[%l7 + %g2],	%l3
	nop
	set	0x34, %l6
	swap	[%l7 + %l6],	%l5
	nop
	set	0x48, %l5
	ldub	[%l7 + %l5],	%i7
	nop
	set	0x08, %g6
	ldsw	[%l7 + %g6],	%g4
	nop
	set	0x5E, %i1
	sth	%i0,	[%l7 + %i1]
	or	%o3,	%o1,	%g6
	nop
	set	0x62, %l2
	sth	%i5,	[%l7 + %l2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%o0
	nop
	set	0x38, %l0
	std	%f16,	[%l7 + %l0]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%i3
	nop
	set	0x0A, %g4
	ldsh	[%l7 + %g4],	%g2
	or	%o4,	%i2,	%g7
	add	%l0,	%o2,	%l6
	nop
	set	0x78, %g1
	std	%f6,	[%l7 + %g1]
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f2
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xea,	%l2
	nop
	set	0x18, %i5
	stx	%i1,	[%l7 + %i5]
	ba,a,pt	%xcc,	loop_158
	nop
	set	0x6C, %o0
	ldsw	[%l7 + %o0],	%o5
	nop
	set	0x59, %i4
	ldstub	[%l7 + %i4],	%l1
	nop
	set	0x10, %g7
	prefetch	[%l7 + %g7],	 4
loop_158:
	nop
	set	0x34, %o5
	lda	[%l7 + %o5] 0x81,	%f10
	nop
	set	0x5C, %l3
	lduw	[%l7 + %l3],	%g1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%i4
	nop
	set	0x71, %i3
	ldub	[%l7 + %i3],	%o6
	nop
	set	0x2A, %o3
	ldsh	[%l7 + %o3],	%l4
	nop
	set	0x18, %i7
	ldstub	[%l7 + %i7],	%l3
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	set	0x30, %i6
	stxa	%i7,	[%l7 + %i6] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%l5
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%o3
	nop
	set	0x3A, %l1
	ldsh	[%l7 + %l1],	%i0
	st	%f7,	[%l7 + 0x7C]
	nop
	nop
	setx	0xAF822DAF7E9F1217,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF4A3327EF182CA03,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f6
	nop
	set	0x38, %l4
	ldsh	[%l7 + %l4],	%g6
	st	%f26,	[%l7 + 0x24]
	nop
	set	0x48, %o6
	std	%f10,	[%l7 + %o6]
	fpadd32	%f12,	%f16,	%f2
	or	%i5,	%o1,	%g5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%i3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%o4
	nop
	set	0x74, %g5
	ldsh	[%l7 + %g5],	%i2
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x80,	 1
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%l0
	set	0x58, %g2
	stxa	%o2,	[%l7 + %g2] 0xea
	membar	#Sync
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%l2
	nop
	set	0x1A, %l6
	ldsh	[%l7 + %l6],	%i1
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%o5
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x80,	%i6
	set	0x4C, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g1
	nop
	set	0x14, %g6
	prefetch	[%l7 + %g6],	 0
	st	%f6,	[%l7 + 0x08]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%l1
	add	%o6,	%i4,	%l4
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%l3
	st	%f0,	[%l7 + 0x58]
	set	0x40, %g1
	swapa	[%l7 + %g1] 0x88,	%i6
	nop
	set	0x67, %i0
	ldsb	[%l7 + %i0],	%g4
	set	0x22, %g4
	stha	%l5,	[%l7 + %g4] 0x88
	nop
	set	0x4C, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x08, %o0
	swapa	[%l7 + %o0] 0x81,	%o3
	nop
	set	0x1C, %i4
	lduw	[%l7 + %i4],	%i7
	set	0x58, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	ld	[%l7 + 0x4C],	%f3
	add	%g6,	%i5,	%o1
	st	%f21,	[%l7 + 0x48]
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x81,	%g5
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%i3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf9
	membar	#Sync
	nop
	set	0x3D, %o3
	stb	%o0,	[%l7 + %o3]
	nop
	set	0x3F, %i7
	ldstub	[%l7 + %i7],	%o4
	nop
	set	0x22, %i3
	ldub	[%l7 + %i3],	%g2
	bgu	%xcc,	loop_159
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x76, %g3
	sth	%l0,	[%l7 + %g3]
	nop
	set	0x60, %l1
	std	%f4,	[%l7 + %l1]
loop_159:
	fpsub32	%f20,	%f18,	%f24
	nop
	set	0x0E, %l4
	ldsb	[%l7 + %l4],	%o2
	set	0x60, %i2
	stda	%g2,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x7A, %g5
	sth	%l2,	[%l7 + %g5]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%i1
	nop
	set	0x12, %o6
	ldsh	[%l7 + %o6],	%l6
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x80,	%o5
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%g0
	set	0x4E, %o4
	stha	%o7,	[%l7 + %o4] 0x81
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%o6
	nop
	set	0x43, %l5
	ldsb	[%l7 + %l5],	%i4
	set	0x0F, %i1
	stba	%l4,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x28, %l6
	std	%l0,	[%l7 + %l6]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f16
	set	0x58, %l2
	stda	%i6,	[%l7 + %l2] 0x81
	nop
	set	0x7C, %l0
	ldsb	[%l7 + %l0],	%g4
	set	0x40, %i0
	stxa	%l3,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x70, %g4
	ldsh	[%l7 + %g4],	%l5
	set	0x20, %i5
	swapa	[%l7 + %i5] 0x88,	%o3
	nop
	set	0x60, %o0
	ldsw	[%l7 + %o0],	%i7
	or	%g6,	%i5,	%i0
	fpsub32	%f4,	%f18,	%f4
	set	0x68, %g1
	stwa	%o1,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x26, %i4
	lduh	[%l7 + %i4],	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%o4
	add	%i3,	%g2,	%i2
	nop
	set	0x54, %o1
	swap	[%l7 + %o1],	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g3
	nop
	set	0x0C, %o5
	ldsw	[%l7 + %o5],	%l2
	and	%g7,	%i1,	%o5
	ld	[%l7 + 0x3C],	%f1
	nop
	set	0x20, %g7
	lduw	[%l7 + %g7],	%g1
	ble	%xcc,	loop_160
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%l6
	nop
	set	0x28, %i7
	swap	[%l7 + %i7],	%o6
	st	%f31,	[%l7 + 0x0C]
loop_160:
	st	%f31,	[%l7 + 0x70]
	wr	%o7,	%l4,	%pic
	set	0x70, %i3
	stxa	%l1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x14, %l3
	ldub	[%l7 + %l3],	%i6
	add	%i4,	%l3,	%l5
	set	0x10, %g3
	stxa	%g4,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%o3
	and	%i7,	%g6,	%i5
	set	0x35, %l4
	stba	%o1,	[%l7 + %l4] 0x89
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%g5
	nop
	set	0x78, %i2
	swap	[%l7 + %i2],	%o0
	nop
	set	0x77, %o6
	ldsb	[%l7 + %o6],	%i0
	nop
	set	0x11, %g5
	stb	%i3,	[%l7 + %g5]
	nop
	set	0x4C, %o7
	stw	%g2,	[%l7 + %o7]
	nop
	set	0x2C, %o4
	stw	%i2,	[%l7 + %o4]
	nop
	set	0x28, %g2
	stw	%o4,	[%l7 + %g2]
	nop
	set	0x58, %l5
	ldstub	[%l7 + %l5],	%o2
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x20, %l6
	stwa	%l0,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f10
	bn	%icc,	loop_161
	or	%i1,	%g7,	%g1
	set	0x49, %i1
	stba	%o5,	[%l7 + %i1] 0x81
loop_161:
	nop
	set	0x78, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x7C, %l2
	lduw	[%l7 + %l2],	%o6
	nop
	set	0x18, %g4
	ldsb	[%l7 + %g4],	%o7
	st	%f0,	[%l7 + 0x20]
	nop
	set	0x50, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x3C, %o0
	lduw	[%l7 + %o0],	%l6
	add	%l1,	%l4,	%i6
	nop
	set	0x08, %i5
	ldsh	[%l7 + %i5],	%l3
	nop
	set	0x40, %i4
	stw	%i4,	[%l7 + %i4]
	set	0x28, %o1
	stda	%g4,	[%l7 + %o1] 0x81
	add	%o3,	%i7,	%g6
	set	0x30, %g1
	sta	%f5,	[%l7 + %g1] 0x89
	st	%fsr,	[%l7 + 0x58]
	set	0x48, %g7
	lda	[%l7 + %g7] 0x89,	%f7
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe3,	%l4
	set	0x10, %o5
	lda	[%l7 + %o5] 0x88,	%f16
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x81,	 1
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f26
	ld	[%l7 + 0x48],	%f18
	nop
	set	0x68, %l3
	ldsh	[%l7 + %l3],	%g5
	set	0x64, %l1
	stwa	%o0,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x48, %g3
	ldxa	[%l7 + %g3] 0x89,	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%g2
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%i3
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f12
	set	0x5C, %o6
	sta	%f16,	[%l7 + %o6] 0x88
	nop
	set	0x36, %i6
	stb	%o4,	[%l7 + %i6]
	set	0x3A, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o2
	nop
	set	0x40, %g5
	stw	%i2,	[%l7 + %g5]
	nop
	set	0x36, %o4
	ldsh	[%l7 + %o4],	%l2
	add	%l0,	%i1,	%g3
	nop
	set	0x61, %l5
	ldstub	[%l7 + %l5],	%g7
	set	0x70, %o2
	stwa	%o5,	[%l7 + %o2] 0x81
	nop
	set	0x37, %l6
	ldsb	[%l7 + %l6],	%o6
	nop
	set	0x38, %g2
	ldstub	[%l7 + %g2],	%o7
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f20
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l1
	set	0x40, %l0
	swapa	[%l7 + %l0] 0x81,	%l6
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x6C, %g4
	stw	%l4,	[%l7 + %g4]
	set	0x60, %l2
	stba	%l3,	[%l7 + %l2] 0x88
	and	%g4,	%o3,	%i7
	nop
	set	0x24, %o0
	stw	%g6,	[%l7 + %o0]
	set	0x18, %i5
	stxa	%l5,	[%l7 + %i5] 0x88
	set	0x38, %i0
	stwa	%o1,	[%l7 + %i0] 0x89
	nop
	set	0x22, %o1
	sth	%i4,	[%l7 + %o1]
	st	%f3,	[%l7 + 0x74]
	nop
	set	0x18, %g1
	sth	%g5,	[%l7 + %g1]
	add	%i0,	%o0,	%g2
	nop
	set	0x76, %g7
	ldstub	[%l7 + %g7],	%i3
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	nop
	set	0x4E, %i4
	sth	%o4,	[%l7 + %i4]
	fpsub32s	%f25,	%f30,	%f2
	set	0x68, %o5
	stxa	%o2,	[%l7 + %o5] 0xe3
	membar	#Sync
	or	%i5,	%i2,	%l2
	or	%i1,	%g3,	%g7
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x60, %i7
	std	%l0,	[%l7 + %i7]
	nop
	set	0x7C, %g3
	lduw	[%l7 + %g3],	%o5
	st	%fsr,	[%l7 + 0x10]
	set	0x38, %l4
	stwa	%o6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x54, %l1
	ldsw	[%l7 + %l1],	%o7
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 0
	st	%fsr,	[%l7 + 0x54]
	st	%f6,	[%l7 + 0x4C]
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f4
	nop
	set	0x20, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x08, %g5
	ldsh	[%l7 + %g5],	%l1
	nop
	set	0x26, %o7
	stb	%l6,	[%l7 + %o7]
	nop
	set	0x70, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%g1
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x52, %l6
	ldub	[%l7 + %l6],	%i6
	wr	%l4,	%l3,	%y
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x61, %i1
	ldub	[%l7 + %i1],	%i7
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%g4
	ld	[%l7 + 0x40],	%f12
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x89,	%l5
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x59, %g4
	ldub	[%l7 + %g4],	%o1
	nop
	set	0x40, %o0
	lduw	[%l7 + %o0],	%g6
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x88,	%g5
	set	0x4C, %o1
	swapa	[%l7 + %o1] 0x89,	%i4
	set	0x6B, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%o0
	nop
	set	0x42, %o3
	lduh	[%l7 + %o3],	%i3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o2
	nop
	set	0x48, %i4
	ldub	[%l7 + %i4],	%i2
	nop
	set	0x5D, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x50, %g1
	std	%f14,	[%l7 + %g1]
	set	0x34, %i3
	stwa	%i1,	[%l7 + %i3] 0x81
	set	0x44, %l3
	stba	%g3,	[%l7 + %l3] 0x81
	nop
	set	0x3E, %g3
	ldsh	[%l7 + %g3],	%i5
	set	0x48, %l4
	swapa	[%l7 + %l4] 0x89,	%l0
	set	0x08, %l1
	swapa	[%l7 + %l1] 0x88,	%o5
	set	0x19, %i7
	stba	%g7,	[%l7 + %i7] 0x80
	st	%fsr,	[%l7 + 0x44]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xcc
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f6
	set	0x6C, %o7
	sta	%f5,	[%l7 + %o7] 0x81
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc8
	ld	[%l7 + 0x08],	%f4
	nop
	set	0x30, %i2
	ldsw	[%l7 + %i2],	%o6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%o7
	nop
	set	0x41, %o4
	ldub	[%l7 + %o4],	%g1
	nop
	set	0x5B, %o2
	ldstub	[%l7 + %o2],	%i6
	set	0x0D, %g2
	stba	%l6,	[%l7 + %g2] 0x81
	nop
	set	0x50, %l6
	lduw	[%l7 + %l6],	%l4
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0
	nop
	set	0x54, %i1
	sth	%i7,	[%l7 + %i1]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd8
	nop
	set	0x1E, %g4
	lduh	[%l7 + %g4],	%l3
	nop
	set	0x64, %o0
	swap	[%l7 + %o0],	%l5
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%g4
	nop
	set	0x78, %l2
	stx	%o1,	[%l7 + %l2]
	fpadd32s	%f20,	%f6,	%f26
	nop
	set	0x70, %i0
	std	%g6,	[%l7 + %i0]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x89,	%i0
	fpsub16	%f30,	%f4,	%f20
	st	%f6,	[%l7 + 0x50]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	set	0x46, %o1
	stha	%i3,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%o2
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x89,	%o4
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%f2
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x81,	%l2
	set	0x27, %l3
	stba	%i1,	[%l7 + %l3] 0x80
	set	0x79, %g3
	stba	%g3,	[%l7 + %g3] 0x88
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x89,	%f24
	nop
	set	0x5C, %l1
	stw	%i2,	[%l7 + %l1]
	nop
	set	0x0C, %i6
	lduw	[%l7 + %i6],	%i5
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%o5
	nop
	set	0x10, %o6
	prefetch	[%l7 + %o6],	 1
	ld	[%l7 + 0x44],	%f7
	nop
	set	0x16, %g5
	ldub	[%l7 + %g5],	%l0
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%g7
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%l1
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x70, %o4
	stxa	%o7,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x3E, %g2
	ldsh	[%l7 + %g2],	%g1
	nop
	set	0x64, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x48, %l0
	std	%i6,	[%l7 + %l0]
	nop
	set	0x78, %o2
	stx	%fsr,	[%l7 + %o2]
	and	%l6,	%o6,	%l4
	nop
	set	0x14, %i1
	sth	%o3,	[%l7 + %i1]
	nop
	set	0x26, %g4
	ldub	[%l7 + %g4],	%i7
	st	%f25,	[%l7 + 0x3C]
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	ld	[%l7 + 0x7C],	%f25
	set	0x5E, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g4
	nop
	set	0x45, %g6
	ldub	[%l7 + %g6],	%o1
	st	%fsr,	[%l7 + 0x2C]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x89,	 1
	nop
	set	0x20, %l2
	stb	%i4,	[%l7 + %l2]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%g2
	nop
	set	0x1B, %g7
	ldsb	[%l7 + %g7],	%i3
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x88,	%o2
	nop
	set	0x10, %o5
	ldsw	[%l7 + %o5],	%i0
	set	0x7C, %g1
	stwa	%l2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x58, %i3
	stw	%i1,	[%l7 + %i3]
	set	0x10, %o3
	lda	[%l7 + %o3] 0x81,	%f24
	nop
	set	0x58, %i4
	lduh	[%l7 + %i4],	%o4
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x50, %l4
	stda	%i2,	[%l7 + %l4] 0x80
	nop
	set	0x60, %g3
	swap	[%l7 + %g3],	%i5
	nop
	set	0x56, %i6
	stb	%o5,	[%l7 + %i6]
	nop
	set	0x70, %l1
	stx	%l0,	[%l7 + %l1]
	set	0x58, %i7
	stda	%g2,	[%l7 + %i7] 0xe2
	membar	#Sync
	st	%f10,	[%l7 + 0x44]
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f28
	set	0x2C, %g5
	stha	%l1,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x60, %l5
	stwa	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	or	%o7,	%g1,	%i6
	set	0x70, %i2
	stha	%o6,	[%l7 + %i2] 0x88
	set	0x68, %o7
	sta	%f23,	[%l7 + %o7] 0x81
	nop
	set	0x62, %o4
	ldsh	[%l7 + %o4],	%l4
	add	%o3,	%i7,	%l3
	nop
	set	0x1C, %g2
	ldub	[%l7 + %g2],	%l6
	set	0x60, %l0
	stda	%g4,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x6C, %o2
	ldub	[%l7 + %o2],	%o1
	set	0x10, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g5
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x60, %l6
	std	%f12,	[%l7 + %l6]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i4
	nop
	set	0x22, %o0
	lduh	[%l7 + %o0],	%o0
	nop
	set	0x74, %i5
	swap	[%l7 + %i5],	%l5
	ld	[%l7 + 0x5C],	%f15
	nop
	set	0x16, %g4
	ldub	[%l7 + %g4],	%g2
	add	%i3,	%o2,	%l2
	nop
	set	0x70, %g6
	stw	%i0,	[%l7 + %g6]
	or	%o4,	%i2,	%i1
	set	0x0E, %i0
	stha	%i5,	[%l7 + %i0] 0x88
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x5B, %o1
	ldub	[%l7 + %o1],	%l0
	nop
	set	0x52, %l2
	ldsh	[%l7 + %l2],	%l1
	wr	%g3,	%o7,	%ccr
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x38, %i3
	std	%g0,	[%l7 + %i3]
	set	0x10, %g1
	stha	%g7,	[%l7 + %g1] 0x80
	add	%i6,	%o6,	%l4
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x80,	%o3
	and	%i7,	%l3,	%g4
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%l6
	nop
	set	0x18, %l4
	lduh	[%l7 + %l4],	%o1
	bgu	%icc,	loop_162
	or	%g6,	%g5,	%i4
	nop
	set	0x18, %l3
	ldub	[%l7 + %l3],	%l5
	st	%f19,	[%l7 + 0x34]
loop_162:
	be	%icc,	loop_163
	nop
	set	0x58, %g3
	ldsh	[%l7 + %g3],	%g2
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%o0
	set	0x74, %l1
	swapa	[%l7 + %l1] 0x89,	%i3
loop_163:
	nop
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe3,	%l2
	nop
	nop
	setx	0x3E9DE8C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA183AFB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f3,	%f21
	add	%i0,	%o2,	%i2
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f10
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%i5
	nop
	set	0x3C, %i7
	swap	[%l7 + %i7],	%i1
	nop
	set	0x60, %i2
	stx	%l0,	[%l7 + %i2]
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%l0
	st	%f14,	[%l7 + 0x28]
	set	0x50, %o4
	stha	%g3,	[%l7 + %o4] 0x89
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x88,	%o4
	nop
	set	0x5C, %g2
	swap	[%l7 + %g2],	%o7
	set	0x18, %o2
	stxa	%g7,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x38, %i1
	lda	[%l7 + %i1] 0x89,	%f7
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%i6
	nop
	set	0x20, %o0
	ldsh	[%l7 + %o0],	%g1
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x81,	%o6
	nop
	set	0x66, %g4
	ldsh	[%l7 + %g4],	%o3
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x80,	%i6
	set	0x58, %i0
	swapa	[%l7 + %i0] 0x89,	%l4
	nop
	set	0x60, %i5
	swap	[%l7 + %i5],	%g4
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%l6
	set	0x6C, %o1
	stwa	%l3,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x5B, %o5
	ldstub	[%l7 + %o5],	%g6
	nop
	set	0x7C, %i3
	prefetch	[%l7 + %i3],	 3
	nop
	set	0x38, %l2
	ldsh	[%l7 + %l2],	%o1
	set	0x48, %g1
	stda	%g4,	[%l7 + %g1] 0x80
	set	0x6C, %o3
	stha	%i4,	[%l7 + %o3] 0x80
	set	0x2F, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g2
	st	%f5,	[%l7 + 0x10]
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xe3,	%l4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc4
	set	0x18, %g3
	sta	%f23,	[%l7 + %g3] 0x81
	set	0x08, %i6
	stha	%i3,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%l2
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc8
	or	%i0,	%o2,	%o0
	ld	[%l7 + 0x08],	%f0
	wr	%o4,	%i2,	%ccr
	or	%i1,	%i5,	%l0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	wr	%l1,	%g3,	%ccr
	set	0x28, %l5
	stda	%o6,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x3E, %o7
	ldub	[%l7 + %o7],	%g7
	and	%o5,	%g1,	%o6
	nop
	set	0x2A, %o4
	ldsh	[%l7 + %o4],	%i6
	nop
	set	0x74, %o2
	swap	[%l7 + %o2],	%o3
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x81,	%i7
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd2
	nop
	set	0x10, %l6
	std	%f2,	[%l7 + %l6]
	bg,a	%icc,	loop_164
	and	%l4,	%l6,	%l3
	nop
	set	0x78, %g4
	lduw	[%l7 + %g4],	%g6
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x89,	%o1
loop_164:
	nop
	set	0x18, %i0
	stxa	%i4,	[%l7 + %i0] 0x81
	set	0x6C, %l0
	lda	[%l7 + %l0] 0x88,	%f19
	nop
	set	0x48, %i5
	std	%g4,	[%l7 + %i5]
	nop
	set	0x10, %o1
	std	%f16,	[%l7 + %o1]
	nop
	set	0x2A, %o5
	ldsh	[%l7 + %o5],	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%i3
	ld	[%l7 + 0x3C],	%f21
	nop
	set	0x18, %i3
	stx	%l2,	[%l7 + %i3]
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%o2
	set	0x40, %o3
	lda	[%l7 + %o3] 0x81,	%f2
	set	0x08, %i4
	stxa	%o0,	[%l7 + %i4] 0x81
	or	%i0,	%o4,	%i1
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x14, %l3
	stwa	%i5,	[%l7 + %l3] 0x80
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%l0
	set	0x38, %l4
	swapa	[%l7 + %l4] 0x89,	%l1
	set	0x1A, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i2
	add	%o7,	%g3,	%o5
	set	0x1A, %g5
	ldstuba	[%l7 + %g5] 0x89,	%g1
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%g7
	set	0x3B, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i6
	set	0x0C, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o6
	ba,a,pn	%xcc,	loop_165
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%o2
	nop
	set	0x34, %o7
	ldsw	[%l7 + %o7],	%i7
	set	0x08, %i2
	stwa	%l4,	[%l7 + %i2] 0xe2
	membar	#Sync
loop_165:
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%g4
	fpsub32s	%f5,	%f1,	%f17
	set	0x18, %i1
	sta	%f27,	[%l7 + %i1] 0x88
	set	0x0F, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l6
	fpadd32	%f0,	%f30,	%f30
	and	%g6,	%l3,	%o1
	nop
	set	0x4C, %o0
	ldsh	[%l7 + %o0],	%i4
	nop
	set	0x30, %o4
	std	%f24,	[%l7 + %o4]
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x89,	%g5
	nop
	set	0x50, %g4
	ldsh	[%l7 + %g4],	%g2
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%i3
	nop
	set	0x54, %g6
	ldsw	[%l7 + %g6],	%l5
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x88,	 3
	nop
	set	0x33, %l0
	ldsb	[%l7 + %l0],	%o0
	set	0x44, %o5
	lda	[%l7 + %o5] 0x81,	%f19
	set	0x18, %o1
	stda	%i0,	[%l7 + %o1] 0x89
	nop
	set	0x24, %l2
	ldsw	[%l7 + %l2],	%l2
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x81,	%o4
	nop
	set	0x78, %o3
	stb	%i5,	[%l7 + %o3]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x80
	and	%l0,	%l1,	%i2
	or	%i1,	%g3,	%o5
	nop
	set	0x14, %i4
	sth	%o7,	[%l7 + %i4]
	nop
	set	0x30, %l3
	sth	%g1,	[%l7 + %l3]
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%g6
	st	%f26,	[%l7 + 0x3C]
	wr	%o6,	%o3,	%y
	nop
	set	0x20, %l4
	ldsw	[%l7 + %l4],	%i7
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x81,	%i6
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f20
	st	%fsr,	[%l7 + 0x18]
	set	0x78, %i7
	stha	%g4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x78, %l1
	std	%f22,	[%l7 + %l1]
	nop
	nop
	setx	0x01757CF220C1BFC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x035DF6987287964E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f8,	%f0
	nop
	set	0x46, %i6
	ldstub	[%l7 + %i6],	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%l3
	nop
	set	0x30, %l5
	std	%f30,	[%l7 + %l5]
	ld	[%l7 + 0x58],	%f6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%l6
	nop
	set	0x30, %o7
	ldsh	[%l7 + %o7],	%g5
	set	0x5E, %o6
	stha	%i4,	[%l7 + %o6] 0x88
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	set	0x50, %i2
	stda	%g2,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x78, %g2
	prefetch	[%l7 + %g2],	 0
	or	%i3,	%l5,	%o2
	set	0x30, %o0
	stxa	%o0,	[%l7 + %o0] 0x89
	nop
	set	0x60, %o4
	swap	[%l7 + %o4],	%l2
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%f28
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x81,	 0
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	set	0x54, %g6
	lda	[%l7 + %g6] 0x89,	%f16
	nop
	set	0x3C, %i5
	swap	[%l7 + %i5],	%l0
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f18
	nop
	set	0x55, %o5
	ldstub	[%l7 + %o5],	%o4
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%l1
	nop
	set	0x78, %l0
	stx	%i2,	[%l7 + %l0]
	set	0x10, %g1
	stha	%g3,	[%l7 + %g1] 0x88
	fpsub32s	%f15,	%f14,	%f16
	set	0x0C, %l2
	stwa	%o5,	[%l7 + %l2] 0x89
	nop
	set	0x6C, %i3
	lduh	[%l7 + %i3],	%o7
	and	%i1,	%g7,	%g1
	nop
	set	0x63, %o3
	ldsb	[%l7 + %o3],	%o6
	nop
	set	0x37, %i4
	ldsb	[%l7 + %i4],	%o3
	nop
	set	0x48, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x7A, %l4
	ldub	[%l7 + %l4],	%i7
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x89,	 4
	set	0x60, %g5
	stwa	%l4,	[%l7 + %g5] 0x89
	nop
	nop
	setx	0x29687D40,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x48BBF0B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f1,	%f9
	nop
	set	0x54, %i7
	ldub	[%l7 + %i7],	%g4
	nop
	set	0x30, %l1
	std	%l2,	[%l7 + %l1]
	nop
	set	0x56, %i6
	ldsh	[%l7 + %i6],	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o1
	set	0x30, %l5
	lda	[%l7 + %l5] 0x81,	%f26
	set	0x3C, %g3
	lda	[%l7 + %g3] 0x81,	%f8
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x81,	%g5
	nop
	set	0x6E, %o2
	ldstub	[%l7 + %o2],	%i4
	set	0x28, %i2
	stha	%i3,	[%l7 + %i2] 0x81
	nop
	set	0x48, %g2
	stw	%g2,	[%l7 + %g2]
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x7E, %o4
	stha	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	fpadd16s	%f28,	%f16,	%f2
	nop
	set	0x74, %l6
	lduh	[%l7 + %l6],	%l2
	nop
	set	0x2C, %o0
	lduw	[%l7 + %o0],	%l5
	nop
	set	0x60, %i0
	std	%i4,	[%l7 + %i0]
	nop
	set	0x7D, %g4
	ldub	[%l7 + %g4],	%l0
	nop
	set	0x68, %g6
	ldub	[%l7 + %g6],	%o4
	ld	[%l7 + 0x44],	%f1
	nop
	set	0x70, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x42, %o5
	stha	%l1,	[%l7 + %o5] 0x81
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%i0
	nop
	set	0x78, %i1
	lduh	[%l7 + %i1],	%g3
	st	%f22,	[%l7 + 0x20]
	nop
	set	0x48, %l0
	ldsh	[%l7 + %l0],	%i2
	set	0x54, %g1
	lda	[%l7 + %g1] 0x81,	%f22
	nop
	set	0x5C, %i3
	lduh	[%l7 + %i3],	%o5
	nop
	set	0x18, %o3
	std	%f2,	[%l7 + %o3]
	nop
	set	0x68, %i4
	stx	%i1,	[%l7 + %i4]
	ble	%icc,	loop_166
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%o7
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x80,	%g6
loop_166:
	nop
	set	0x3D, %l4
	stb	%o6,	[%l7 + %l4]
	and	%o3,	%i7,	%i6
	or	%l4,	%g4,	%g1
	nop
	set	0x40, %l3
	lduw	[%l7 + %l3],	%g6
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x28, %g5
	std	%f14,	[%l7 + %g5]
	nop
	set	0x3C, %l1
	ldsb	[%l7 + %l1],	%l6
	st	%f10,	[%l7 + 0x44]
	add	%o1,	%l3,	%i4
	nop
	set	0x24, %i6
	ldsh	[%l7 + %i6],	%g5
	set	0x0C, %l5
	stwa	%g2,	[%l7 + %l5] 0x81
	nop
	set	0x74, %o7
	ldsb	[%l7 + %o7],	%i3
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	ld	[%l7 + 0x18],	%f16
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x81,	%o2
	or	%l2,	%o0,	%l5
	nop
	set	0x40, %g2
	std	%l0,	[%l7 + %g2]
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0
	nop
	set	0x5A, %o6
	lduh	[%l7 + %o6],	%o4
	nop
	set	0x78, %l6
	std	%f18,	[%l7 + %l6]
	set	0x40, %o4
	stxa	%i0,	[%l7 + %o4] 0x89
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%l1
	set	0x3C, %g4
	sta	%f17,	[%l7 + %g4] 0x89
	set	0x30, %o0
	stha	%i2,	[%l7 + %o0] 0x88
	set	0x16, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g3
	set	0x72, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o5
	set	0x40, %o5
	swapa	[%l7 + %o5] 0x89,	%o7
	fpadd16s	%f1,	%f17,	%f4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1271
!	Type a   	: 25
!	Type cti   	: 22
!	Type x   	: 550
!	Type f   	: 36
!	Type i   	: 96
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
	set	0x0,	%g1
	set	0x0,	%g2
	set	0xA,	%g3
	set	0xA,	%g4
	set	0xF,	%g5
	set	0x9,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xC,	%i1
	set	-0x5,	%i2
	set	-0xC,	%i3
	set	-0x8,	%i4
	set	-0x0,	%i5
	set	-0x0,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x7C4D13CB,	%l0
	set	0x2BF2E123,	%l1
	set	0x1A2374E1,	%l2
	set	0x11E50E6B,	%l3
	set	0x0068EE4D,	%l4
	set	0x01699988,	%l5
	set	0x1C31DB90,	%l6
	!# Output registers
	set	0x12AB,	%o0
	set	0x172F,	%o1
	set	-0x1C61,	%o2
	set	-0x0E54,	%o3
	set	0x09CF,	%o4
	set	-0x05D1,	%o5
	set	-0x06EE,	%o6
	set	-0x0219,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	nop
	set	0x76, %i1
	ldsh	[%l7 + %i1],	%g7
	nop
	set	0x28, %o1
	stw	%o6,	[%l7 + %o1]
	nop
	set	0x0C, %l0
	ldsw	[%l7 + %l0],	%o3
	st	%f1,	[%l7 + 0x68]
	set	0x0C, %i3
	swapa	[%l7 + %i3] 0x81,	%i1
	ld	[%l7 + 0x58],	%f16
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i7
	nop
	set	0x15, %g1
	ldstub	[%l7 + %g1],	%g4
	st	%f9,	[%l7 + 0x34]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%g6
	nop
	set	0x68, %i4
	stx	%g1,	[%l7 + %i4]
	set	0x7E, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o1
	nop
	set	0x20, %g7
	std	%i6,	[%l7 + %g7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%l3
	add	%g5,	%i3,	%g2
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x1C, %l4
	swap	[%l7 + %l4],	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%l5
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%l0
	st	%f5,	[%l7 + 0x70]
	nop
	set	0x60, %g5
	stw	%o2,	[%l7 + %g5]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f16
	nop
	set	0x34, %l1
	swap	[%l7 + %l1],	%i5
	nop
	set	0x7C, %i6
	ldsh	[%l7 + %i6],	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l1
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	set	0x0C, %l5
	stwa	%i2,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x30, %g3
	stwa	%o7,	[%l7 + %g3] 0x81
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f14
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x20, %o2
	stx	%g7,	[%l7 + %o2]
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%o6
	nop
	set	0x57, %i2
	ldub	[%l7 + %i2],	%o5
	nop
	set	0x48, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f16
	set	0x08, %l6
	stxa	%o3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x38, %g4
	stx	%i1,	[%l7 + %g4]
	nop
	set	0x10, %g6
	std	%f18,	[%l7 + %g6]
	set	0x18, %i5
	prefetcha	[%l7 + %i5] 0x81,	 3
	nop
	set	0x13, %o5
	ldsb	[%l7 + %o5],	%i6
	nop
	set	0x18, %o0
	std	%g4,	[%l7 + %o0]
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%g6
	nop
	nop
	setx	0x218305C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x3FCFA1A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f17,	%f23
	add	%l4,	%g1,	%l6
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x80,	%i4
	nop
	set	0x19, %i3
	stb	%o1,	[%l7 + %i3]
	and	%l3,	%i3,	%g2
	set	0x09, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g5
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x18, %l2
	ldsh	[%l7 + %l2],	%o0
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0
	ld	[%l7 + 0x4C],	%f10
	nop
	set	0x5A, %o3
	sth	%l0,	[%l7 + %o3]
	set	0x3C, %i4
	swapa	[%l7 + %i4] 0x89,	%o2
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%i0
	bne,a	%icc,	loop_167
	and	%o4,	%l1,	%g3
	set	0x2C, %l4
	swapa	[%l7 + %l4] 0x80,	%o7
loop_167:
	nop
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 4
	or	%o6,	%o5,	%g7
	nop
	set	0x5E, %i6
	ldsh	[%l7 + %i6],	%o3
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%i1
	set	0x34, %l5
	lda	[%l7 + %l5] 0x80,	%f25
	nop
	set	0x20, %l1
	std	%f18,	[%l7 + %l1]
	nop
	set	0x78, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x54, %o2
	stw	%g4,	[%l7 + %o2]
	set	0x1C, %g3
	swapa	[%l7 + %g3] 0x89,	%g6
	fpsub32s	%f16,	%f11,	%f14
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe2,	%l4
	set	0x08, %o4
	sta	%f8,	[%l7 + %o4] 0x89
	set	0x24, %o6
	stwa	%g1,	[%l7 + %o6] 0x89
	nop
	set	0x26, %l6
	ldsb	[%l7 + %l6],	%i6
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f10
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%i4
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x89,	%f18
	and	%o1,	%l3,	%i3
	st	%f10,	[%l7 + 0x50]
	nop
	set	0x60, %i5
	prefetch	[%l7 + %i5],	 2
	st	%f1,	[%l7 + 0x34]
	set	0x08, %o5
	stxa	%g2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x10, %o0
	stda	%g4,	[%l7 + %o0] 0x80
	st	%f28,	[%l7 + 0x60]
	or	%l6,	%o0,	%l0
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%o2
	set	0x10, %i3
	stda	%i4,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%l5
	nop
	set	0x27, %g1
	ldstub	[%l7 + %g1],	%o4
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x58, %l2
	sta	%f10,	[%l7 + %l2] 0x81
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xe2,	%l0
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f14
	set	0x0C, %i4
	swapa	[%l7 + %i4] 0x88,	%i0
	bne,pn	%icc,	loop_168
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f30
	nop
	set	0x16, %l3
	ldstub	[%l7 + %l3],	%g3
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x88,	%i2
loop_168:
	add	%o6,	%o7,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%o3
	or	%i7,	%i1,	%g4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%g1
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%l4
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%i6
	set	0x40, %o7
	stha	%i4,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x5C, %l5
	stwa	%o1,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%f8
	nop
	set	0x62, %g2
	ldsh	[%l7 + %g2],	%i3
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x80,	%l3
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f8
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	set	0x30, %i2
	stwa	%l6,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x5B, %l6
	stb	%g5,	[%l7 + %l6]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
	wr	%l0,	%l2,	%y
	nop
	set	0x26, %o6
	ldstub	[%l7 + %o6],	%o2
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x40, %i5
	stx	%o0,	[%l7 + %i5]
	add	%i5,	%o4,	%l1
	nop
	set	0x55, %i0
	ldstub	[%l7 + %i0],	%i0
	nop
	set	0x20, %o0
	lduw	[%l7 + %o0],	%l5
	or	%i2,	%g3,	%o7
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x74],	%f27
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%g7
	nop
	set	0x44, %o5
	lduw	[%l7 + %o5],	%o6
	ld	[%l7 + 0x38],	%f20
	or	%o3,	%i7,	%i1
	set	0x28, %i1
	swapa	[%l7 + %i1] 0x80,	%o5
	nop
	set	0x20, %l0
	stx	%g6,	[%l7 + %l0]
	wr	%g4,	%g1,	%set_softint
	or	%i6,	%i4,	%o1
	add	%l4,	%i3,	%g2
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f2
	set	0x65, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l3
	set	0x0C, %o3
	stwa	%l6,	[%l7 + %o3] 0x89
	set	0x78, %l2
	stda	%g4,	[%l7 + %l2] 0x80
	st	%f4,	[%l7 + 0x08]
	fpadd16	%f2,	%f0,	%f14
	and	%l2,	%l0,	%o0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd2,	%f0
	nop
	set	0x24, %l4
	stw	%o2,	[%l7 + %l4]
	nop
	set	0x68, %g5
	ldstub	[%l7 + %g5],	%o4
	st	%fsr,	[%l7 + 0x60]
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x88,	%i4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%l1
	set	0x30, %i7
	stxa	%l5,	[%l7 + %i7] 0x89
	set	0x18, %i6
	stxa	%g3,	[%l7 + %i6] 0x81
	fpsub16s	%f22,	%f3,	%f30
	nop
	set	0x30, %o7
	std	%f4,	[%l7 + %o7]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	wr	%i2,	%o7,	%sys_tick
	nop
	set	0x60, %l5
	lduw	[%l7 + %l5],	%g7
	nop
	set	0x10, %g2
	std	%o6,	[%l7 + %g2]
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	st	%f9,	[%l7 + 0x34]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%i1
	nop
	set	0x20, %o4
	lduh	[%l7 + %o4],	%g6
	nop
	set	0x35, %o2
	ldsb	[%l7 + %o2],	%g4
	fpsub16s	%f28,	%f10,	%f27
	nop
	set	0x54, %l6
	stw	%o5,	[%l7 + %l6]
	set	0x48, %i2
	stxa	%g1,	[%l7 + %i2] 0xeb
	membar	#Sync
	or	%i4,	%i6,	%l4
	st	%f18,	[%l7 + 0x5C]
	nop
	set	0x66, %g4
	sth	%o1,	[%l7 + %g4]
	add	%g2,	%l3,	%i3
	nop
	set	0x3F, %g6
	ldstub	[%l7 + %g6],	%g5
	nop
	set	0x25, %o6
	ldsb	[%l7 + %o6],	%l2
	nop
	set	0x34, %i5
	stw	%l6,	[%l7 + %i5]
	nop
	set	0x50, %o0
	stx	%o0,	[%l7 + %o0]
	set	0x16, %i0
	stba	%o2,	[%l7 + %i0] 0x89
	nop
	set	0x5F, %o1
	ldsb	[%l7 + %o1],	%l0
	set	0x60, %i3
	stwa	%o4,	[%l7 + %i3] 0x80
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0
	set	0x30, %i1
	sta	%f8,	[%l7 + %i1] 0x89
	nop
	set	0x7C, %g1
	sth	%l1,	[%l7 + %g1]
	set	0x48, %l0
	stda	%i0,	[%l7 + %l0] 0x89
	nop
	set	0x64, %o3
	sth	%g3,	[%l7 + %o3]
	nop
	set	0x73, %l2
	ldub	[%l7 + %l2],	%i2
	ld	[%l7 + 0x0C],	%f28
	nop
	set	0x10, %i4
	stx	%l5,	[%l7 + %i4]
	add	%o7,	%o6,	%g7
	nop
	set	0x62, %g7
	lduh	[%l7 + %g7],	%o3
	set	0x7E, %l4
	ldstuba	[%l7 + %l4] 0x81,	%i7
	nop
	set	0x3E, %g5
	lduh	[%l7 + %g5],	%g6
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%f22
	set	0x78, %l3
	stda	%i0,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x18, %o7
	sta	%f4,	[%l7 + %o7] 0x88
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
	set	0x3E, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o5
	nop
	set	0x48, %g2
	stw	%g1,	[%l7 + %g2]
	nop
	set	0x68, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc0
	nop
	set	0x68, %o2
	std	%f12,	[%l7 + %o2]
	nop
	set	0x20, %l6
	std	%f4,	[%l7 + %l6]
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x89,	%g4
	set	0x28, %g4
	stwa	%i6,	[%l7 + %g4] 0x89
	bleu,a	%xcc,	loop_169
	nop
	set	0x24, %i2
	ldsb	[%l7 + %i2],	%i4
	nop
	set	0x60, %g6
	stx	%o1,	[%l7 + %g6]
	ld	[%l7 + 0x0C],	%f29
loop_169:
	st	%fsr,	[%l7 + 0x10]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%g2
	wr	%i3,	%l3,	%set_softint
	and	%l2,	%l6,	%g5
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x80,	%o2
	nop
	set	0x6D, %o0
	ldstub	[%l7 + %o0],	%l0
	set	0x70, %i0
	stwa	%o0,	[%l7 + %i0] 0xe3
	membar	#Sync
	and	%o4,	%l1,	%i0
	set	0x70, %o1
	stha	%g3,	[%l7 + %o1] 0x88
	nop
	set	0x10, %o6
	stb	%i2,	[%l7 + %o6]
	set	0x5E, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i5
	nop
	set	0x76, %i1
	ldsh	[%l7 + %i1],	%l5
	and	%o7,	%g7,	%o6
	set	0x18, %i3
	lda	[%l7 + %i3] 0x81,	%f23
	set	0x68, %g1
	lda	[%l7 + %g1] 0x89,	%f19
	set	0x50, %o3
	stda	%i6,	[%l7 + %o3] 0x89
	nop
	set	0x50, %l2
	stx	%g6,	[%l7 + %l2]
	nop
	set	0x7E, %i4
	ldsb	[%l7 + %i4],	%i1
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%o3
	ld	[%l7 + 0x3C],	%f9
	nop
	set	0x58, %l0
	std	%f22,	[%l7 + %l0]
	set	0x38, %g5
	stba	%o5,	[%l7 + %g5] 0x81
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%g4
	set	0x54, %l3
	stwa	%i4,	[%l7 + %l3] 0xe2
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%l4
	set	0x5C, %o7
	stha	%i3,	[%l7 + %o7] 0x88
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x7E, %l5
	ldsb	[%l7 + %l5],	%l3
	nop
	set	0x44, %g2
	ldsb	[%l7 + %g2],	%l2
	nop
	set	0x49, %l4
	stb	%l6,	[%l7 + %l4]
	nop
	set	0x27, %i6
	ldstub	[%l7 + %i6],	%g2
	nop
	set	0x18, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x48, %o2
	stda	%o2,	[%l7 + %o2] 0x88
	nop
	set	0x58, %l6
	std	%l0,	[%l7 + %l6]
	nop
	set	0x58, %g4
	std	%f22,	[%l7 + %g4]
	nop
	set	0x4C, %o4
	ldsw	[%l7 + %o4],	%o0
	set	0x1B, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o4
	nop
	set	0x78, %g6
	ldsw	[%l7 + %g6],	%l1
	nop
	set	0x3A, %i5
	sth	%g5,	[%l7 + %i5]
	ld	[%l7 + 0x5C],	%f18
	set	0x68, %o0
	stwa	%i0,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x4C, %i0
	swapa	[%l7 + %i0] 0x80,	%g3
	nop
	set	0x40, %o1
	stx	%i5,	[%l7 + %o1]
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x80,	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%g7
	nop
	set	0x40, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	set	0x46, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l5
	add	%o6,	%g6,	%i1
	nop
	set	0x28, %o3
	stx	%i7,	[%l7 + %o3]
	nop
	set	0x30, %l2
	lduw	[%l7 + %l2],	%o3
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%o5
	nop
	set	0x38, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x52, %i3
	stb	%i6,	[%l7 + %i3]
	set	0x0C, %l0
	stwa	%g1,	[%l7 + %l0] 0xe3
	membar	#Sync
	and	%i4,	%g4,	%l4
	set	0x70, %g5
	sta	%f2,	[%l7 + %g5] 0x80
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%l3
	nop
	set	0x20, %l3
	ldsh	[%l7 + %l3],	%l2
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%l6
	nop
	set	0x4A, %i7
	sth	%g2,	[%l7 + %i7]
	bge,a	%icc,	loop_170
	nop
	set	0x22, %l1
	sth	%o1,	[%l7 + %l1]
	nop
	set	0x50, %l5
	std	%f0,	[%l7 + %l5]
	set	0x24, %l4
	swapa	[%l7 + %l4] 0x89,	%o2
loop_170:
	nop
	set	0x68, %g2
	std	%l0,	[%l7 + %g2]
	set	0x78, %i6
	stxa	%o0,	[%l7 + %i6] 0x81
	nop
	set	0x14, %o2
	ldstub	[%l7 + %o2],	%o4
	and	%g5,	%l1,	%i0
	nop
	set	0x58, %l6
	stw	%i5,	[%l7 + %l6]
	nop
	set	0x3A, %g4
	stb	%g3,	[%l7 + %g4]
	nop
	set	0x4C, %g3
	lduh	[%l7 + %g3],	%o7
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f0
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%g6
	or	%l5,	%i2,	%g6
	nop
	set	0x60, %i5
	swap	[%l7 + %i5],	%i1
	bge	%xcc,	loop_171
	nop
	set	0x14, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x6E, %i2
	ldsh	[%l7 + %i2],	%o6
	set	0x64, %i0
	stba	%o3,	[%l7 + %i0] 0x89
loop_171:
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f26
	nop
	set	0x74, %o5
	ldsh	[%l7 + %o5],	%i7
	nop
	set	0x48, %i1
	stx	%o5,	[%l7 + %i1]
	wr	%g1,	%i4,	%y
	nop
	set	0x53, %o1
	ldstub	[%l7 + %o1],	%i6
	nop
	set	0x53, %o3
	ldsb	[%l7 + %o3],	%l4
	nop
	set	0x6A, %l2
	lduh	[%l7 + %l2],	%i3
	ble,a	%xcc,	loop_172
	nop
	set	0x30, %g1
	stx	%g4,	[%l7 + %g1]
	nop
	set	0x18, %g7
	stw	%l2,	[%l7 + %g7]
	add	%l6,	%g2,	%l3
loop_172:
	nop
	set	0x60, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%o1
	nop
	set	0x18, %i3
	std	%o2,	[%l7 + %i3]
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x80,	%o0
	nop
	set	0x24, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x4C, %i7
	stwa	%o4,	[%l7 + %i7] 0x88
	set	0x78, %o7
	stxa	%g5,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%l1
	nop
	set	0x28, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x40, %g2
	sth	%l0,	[%l7 + %g2]
	nop
	set	0x3E, %i6
	lduh	[%l7 + %i6],	%i5
	nop
	set	0x70, %l5
	stw	%i0,	[%l7 + %l5]
	nop
	set	0x38, %l6
	swap	[%l7 + %l6],	%g3
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	fpadd16s	%f24,	%f25,	%f21
	st	%fsr,	[%l7 + 0x54]
	set	0x58, %g3
	stda	%o6,	[%l7 + %g3] 0xe2
	membar	#Sync
	or	%l5,	%g7,	%i2
	ba,a	%icc,	loop_173
	fpadd16s	%f29,	%f25,	%f27
	set	0x50, %o4
	stha	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
loop_173:
	or	%i1,	%o6,	%i7
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%o2
	set	0x4D, %i5
	stba	%g1,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%i6
	set	0x68, %o0
	stda	%l4,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x1C, %o2
	sth	%i3,	[%l7 + %o2]
	set	0x30, %i2
	lda	[%l7 + %i2] 0x81,	%f3
	nop
	set	0x70, %o6
	sth	%g4,	[%l7 + %o6]
	bg	%icc,	loop_174
	and	%o5,	%l6,	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g2
loop_174:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%o1
	fpadd32s	%f4,	%f2,	%f11
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%o4
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%o0
	nop
	set	0x1A, %o1
	lduh	[%l7 + %o1],	%g5
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x08, %o3
	std	%f22,	[%l7 + %o3]
	and	%l0,	%i5,	%i0
	nop
	nop
	setx	0x8758F173,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x5C200124,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f17,	%f24
	nop
	set	0x25, %l2
	ldstub	[%l7 + %l2],	%l1
	nop
	set	0x68, %i0
	std	%f30,	[%l7 + %i0]
	set	0x58, %g1
	stwa	%o7,	[%l7 + %g1] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%g3
	nop
	set	0x0E, %g7
	ldsh	[%l7 + %g7],	%g7
	set	0x68, %l0
	swapa	[%l7 + %l0] 0x81,	%i2
	set	0x60, %i3
	stxa	%g6,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x7C, %i4
	swap	[%l7 + %i4],	%o6
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%i0
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x30, %l3
	ldsw	[%l7 + %l3],	%i7
	set	0x30, %o7
	stda	%o2,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x40, %l4
	stda	%i4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x2B, %l1
	ldstub	[%l7 + %l1],	%i6
	add	%l4,	%g1,	%g4
	set	0x60, %i6
	stda	%i2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f26
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l2
	nop
	set	0x28, %l5
	std	%l2,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x20]
	fpadd16s	%f27,	%f28,	%f10
	ld	[%l7 + 0x64],	%f22
	set	0x20, %g4
	stda	%g2,	[%l7 + %g4] 0xeb
	membar	#Sync
	bl,pt	%xcc,	loop_175
	nop
	set	0x6A, %l6
	ldsh	[%l7 + %l6],	%o5
	set	0x36, %o4
	stha	%o1,	[%l7 + %o4] 0xeb
	membar	#Sync
loop_175:
	nop
	set	0x40, %g6
	stw	%o4,	[%l7 + %g6]
	nop
	set	0x48, %g3
	std	%f20,	[%l7 + %g3]
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xe3,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l0
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%i4
	bne	%icc,	loop_176
	nop
	set	0x40, %o0
	prefetch	[%l7 + %o0],	 0
	nop
	set	0x48, %o6
	stw	%o2,	[%l7 + %o6]
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x80,	%l1
loop_176:
	nop
	set	0x1C, %i2
	stw	%o7,	[%l7 + %i2]
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%i0
	nop
	set	0x6C, %o3
	sth	%l5,	[%l7 + %o3]
	nop
	set	0x7C, %o1
	ldsw	[%l7 + %o1],	%g3
	nop
	set	0x78, %i0
	std	%f26,	[%l7 + %i0]
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%g7
	st	%fsr,	[%l7 + 0x64]
	set	0x67, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	nop
	set	0x20, %i3
	std	%f24,	[%l7 + %i3]
	nop
	set	0x48, %l0
	std	%o6,	[%l7 + %l0]
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%i0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%g6
	nop
	set	0x3F, %i7
	stb	%o3,	[%l7 + %i7]
	nop
	set	0x5E, %l3
	ldsh	[%l7 + %l3],	%i4
	nop
	set	0x14, %o7
	ldsw	[%l7 + %o7],	%i6
	set	0x0C, %l4
	sta	%f8,	[%l7 + %l4] 0x80
	nop
	set	0x40, %i6
	stb	%l4,	[%l7 + %i6]
	nop
	set	0x6E, %g2
	ldsh	[%l7 + %g2],	%g1
	fpsub32	%f18,	%f18,	%f12
	nop
	set	0x10, %l1
	std	%i6,	[%l7 + %l1]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xeb,	%i2
	nop
	set	0x58, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x20, %o4
	std	%l2,	[%l7 + %o4]
	nop
	set	0x72, %g4
	ldsh	[%l7 + %g4],	%g4
	nop
	set	0x78, %g3
	stx	%g2,	[%l7 + %g3]
	set	0x6A, %g6
	stba	%o5,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x52, %i5
	ldsh	[%l7 + %i5],	%o1
	set	0x0B, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o4
	set	0x14, %o6
	swapa	[%l7 + %o6] 0x89,	%l3
	nop
	set	0x36, %o5
	sth	%o0,	[%l7 + %o5]
	set	0x63, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g5
	set	0x76, %i1
	stha	%l0,	[%l7 + %i1] 0x80
	st	%f3,	[%l7 + 0x08]
	and	%o2,	%l1,	%i5
	nop
	set	0x28, %o3
	std	%i0,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x6C]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f16
	or	%o7,	%g3,	%l5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f16
	nop
	set	0x50, %g1
	ldsh	[%l7 + %g1],	%g7
	fpadd32s	%f16,	%f5,	%f11
	set	0x6E, %o1
	ldstuba	[%l7 + %o1] 0x89,	%i2
	set	0x7A, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%o3
	set	0x20, %l2
	stda	%i4,	[%l7 + %l2] 0xeb
	membar	#Sync
	fpadd32s	%f4,	%f16,	%f24
	ld	[%l7 + 0x64],	%f18
	set	0x48, %i3
	sta	%f20,	[%l7 + %i3] 0x89
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%i6
	be,a	%xcc,	loop_177
	nop
	nop
	setx	0xAFEA2188,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xE35CE0D9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f13,	%f5
	nop
	set	0x72, %i7
	ldsh	[%l7 + %i7],	%g6
	set	0x78, %i4
	stwa	%g1,	[%l7 + %i4] 0x80
loop_177:
	nop
	set	0x08, %l3
	std	%f2,	[%l7 + %l3]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x40, %g2
	ldsw	[%l7 + %g2],	%i7
	or	%l4,	%l6,	%l2
	set	0x1C, %i6
	stwa	%g4,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x88,	%i3
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x7B, %o4
	stba	%o5,	[%l7 + %o4] 0xe2
	membar	#Sync
	fpsub16	%f8,	%f12,	%f16
	nop
	set	0x24, %g4
	sth	%g2,	[%l7 + %g4]
	nop
	set	0x66, %l5
	ldub	[%l7 + %l5],	%o1
	and	%l3,	%o4,	%g5
	or	%l0,	%o0,	%l1
	nop
	set	0x40, %g6
	ldsb	[%l7 + %g6],	%o2
	set	0x5B, %g3
	ldstuba	[%l7 + %g3] 0x80,	%i5
	set	0x20, %i5
	stda	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x3C, %o6
	stha	%i0,	[%l7 + %o6] 0x80
	set	0x4C, %o5
	lda	[%l7 + %o5] 0x80,	%f7
	st	%fsr,	[%l7 + 0x18]
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	st	%fsr,	[%l7 + 0x50]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f16
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%g6
	add	%l5,	%i1,	%o6
	st	%fsr,	[%l7 + 0x14]
	set	0x2F, %o3
	stba	%o3,	[%l7 + %o3] 0x88
	nop
	set	0x2A, %o0
	sth	%i2,	[%l7 + %o0]
	add	%i6,	%g6,	%g1
	nop
	set	0x25, %g1
	ldstub	[%l7 + %g1],	%i7
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x81,	%l4
	set	0x08, %g7
	sta	%f19,	[%l7 + %g7] 0x80
	nop
	set	0x6C, %i0
	ldsw	[%l7 + %i0],	%i4
	nop
	set	0x38, %l2
	swap	[%l7 + %l2],	%l2
	set	0x57, %l0
	ldstuba	[%l7 + %l0] 0x89,	%g4
	st	%fsr,	[%l7 + 0x7C]
	add	%i3,	%l6,	%o5
	nop
	set	0x10, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x74, %i3
	lda	[%l7 + %i3] 0x80,	%f2
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%f10
	fpadd32s	%f25,	%f9,	%f11
	nop
	set	0x78, %l3
	stx	%fsr,	[%l7 + %l3]
	fpsub16s	%f20,	%f27,	%f22
	nop
	set	0x60, %l4
	sth	%g2,	[%l7 + %l4]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd0
	set	0x70, %o7
	stda	%l2,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x50, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x74, %l1
	stha	%o1,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xe2,	%g4
	set	0x5F, %i6
	ldstuba	[%l7 + %i6] 0x88,	%l0
	set	0x48, %o4
	sta	%f3,	[%l7 + %o4] 0x88
	set	0x20, %l5
	stda	%o0,	[%l7 + %l5] 0x81
	or	%o4,	%o2,	%i5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f0
	nop
	set	0x34, %g4
	stw	%o7,	[%l7 + %g4]
	fpsub16s	%f9,	%f17,	%f25
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x80,	%i0
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f16
	ba,a,pn	%icc,	loop_178
	nop
	set	0x46, %g3
	sth	%g3,	[%l7 + %g3]
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%g6
	set	0x4E, %i1
	stha	%l5,	[%l7 + %i1] 0x88
loop_178:
	nop
	set	0x7C, %i2
	lda	[%l7 + %i2] 0x89,	%f0
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x48, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	nop
	set	0x68, %g1
	ldsb	[%l7 + %g1],	%o6
	nop
	set	0x28, %o0
	ldub	[%l7 + %o0],	%l1
	set	0x68, %o1
	lda	[%l7 + %o1] 0x89,	%f5
	set	0x58, %i0
	sta	%f15,	[%l7 + %i0] 0x88
	set	0x10, %g7
	stxa	%i2,	[%l7 + %g7] 0x88
	set	0x13, %l2
	stba	%i6,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x26, %g5
	lduh	[%l7 + %g5],	%o3
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%g1
	set	0x48, %i7
	swapa	[%l7 + %i7] 0x89,	%g6
	add	%i7,	%i4,	%l4
	set	0x39, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g4
	add	%l2,	%i3,	%l6
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%g2
	set	0x34, %i4
	stwa	%l3,	[%l7 + %i4] 0x89
	set	0x4A, %l4
	stha	%o5,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xe2,	%g4
	nop
	set	0x0C, %l1
	ldub	[%l7 + %l1],	%o1
	nop
	set	0x70, %l6
	std	%o0,	[%l7 + %l6]
	add	%l0,	%o4,	%i5
	nop
	set	0x10, %i6
	lduh	[%l7 + %i6],	%o7
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	nop
	set	0x34, %o4
	ldub	[%l7 + %o4],	%o2
	set	0x4A, %l5
	stha	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x70, %g4
	stha	%g3,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%l4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf9
	membar	#Sync
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%i0
	nop
	set	0x32, %o5
	ldub	[%l7 + %o5],	%g7
	nop
	set	0x7B, %i1
	ldsb	[%l7 + %i1],	%l1
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f16
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f14
	nop
	set	0x74, %o3
	sth	%o6,	[%l7 + %o3]
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x89,	%i2
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%i6
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x89,	%g1
	set	0x44, %i0
	swapa	[%l7 + %i0] 0x81,	%g6
	nop
	set	0x08, %g1
	stx	%i7,	[%l7 + %g1]
	st	%f30,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x58]
	fpadd16	%f12,	%f24,	%f0
	nop
	set	0x0E, %l2
	ldsb	[%l7 + %l2],	%o3
	nop
	set	0x10, %g5
	std	%l4,	[%l7 + %g5]
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x60, %i7
	ldsw	[%l7 + %i7],	%i4
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l2
	set	0x7C, %g7
	sta	%f2,	[%l7 + %g7] 0x88
	nop
	set	0x62, %l3
	ldsh	[%l7 + %l3],	%g4
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	st	%f7,	[%l7 + 0x0C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l3
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%g2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x81
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%o1
	set	0x30, %i6
	stxa	%g5,	[%l7 + %i6] 0x89
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f28
	nop
	set	0x7C, %l1
	stw	%o0,	[%l7 + %l1]
	add	%l0,	%o4,	%o7
	or	%i5,	%o2,	%g3
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x80,	%i0
	nop
	set	0x38, %o4
	stw	%l5,	[%l7 + %o4]
	set	0x08, %i5
	stxa	%g7,	[%l7 + %i5] 0x81
	nop
	set	0x0F, %g4
	ldstub	[%l7 + %g4],	%i1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x88,	 2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%i6
	nop
	set	0x40, %o5
	stb	%g1,	[%l7 + %o5]
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x88,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%l1
	or	%l4,	%i4,	%o3
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%l2
	nop
	set	0x24, %g3
	sth	%i3,	[%l7 + %g3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%l6
	be	%icc,	loop_179
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%l2
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x88,	%o5
loop_179:
	nop
	set	0x13, %o1
	ldub	[%l7 + %o1],	%g2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%f16
	ld	[%l7 + 0x54],	%f9
	set	0x34, %l2
	lda	[%l7 + %l2] 0x81,	%f4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%o0
	set	0x08, %l0
	sta	%f14,	[%l7 + %l0] 0x81
	nop
	set	0x34, %g5
	stb	%o1,	[%l7 + %g5]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xda,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%l0
	nop
	set	0x28, %i3
	swap	[%l7 + %i3],	%i5
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f14
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x80,	%o2
	nop
	set	0x31, %i4
	ldstub	[%l7 + %i4],	%o7
	set	0x20, %l3
	stwa	%g3,	[%l7 + %l3] 0xeb
	membar	#Sync
	ld	[%l7 + 0x18],	%f23
	nop
	set	0x5C, %l6
	ldsw	[%l7 + %l6],	%l5
	add	%i0,	%i1,	%g7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%i2
	nop
	set	0x28, %i6
	ldsh	[%l7 + %i6],	%i6
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	st	%f20,	[%l7 + 0x30]
	set	0x78, %l1
	stda	%i6,	[%l7 + %l1] 0x81
	nop
	set	0x4C, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x71, %o4
	ldub	[%l7 + %o4],	%l1
	ld	[%l7 + 0x48],	%f25
	nop
	set	0x6D, %i5
	stb	%l4,	[%l7 + %i5]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%i4
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x80,	%l2
	nop
	set	0x78, %g4
	prefetch	[%l7 + %g4],	 0
	bg,pn	%xcc,	loop_180
	ble,pn	%icc,	loop_181
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%i3
loop_180:
	nop
	set	0x08, %o6
	stx	%l6,	[%l7 + %o6]
loop_181:
	or	%l3,	%g4,	%g2
	set	0x4C, %g6
	lda	[%l7 + %g6] 0x80,	%f24
	nop
	set	0x40, %o5
	ldsw	[%l7 + %o5],	%o5
	nop
	set	0x64, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x48, %o3
	std	%g4,	[%l7 + %o3]
	nop
	set	0x08, %g3
	std	%o0,	[%l7 + %g3]
	ld	[%l7 + 0x18],	%f13
	and	%o4,	%l0,	%i5
	nop
	set	0x38, %i1
	std	%o0,	[%l7 + %i1]
	set	0x58, %o2
	stda	%o2,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x60, %o1
	lduh	[%l7 + %o1],	%g3
	set	0x38, %g1
	stwa	%l5,	[%l7 + %g1] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i0
	st	%f25,	[%l7 + 0x74]
	or	%i1,	%g7,	%o6
	nop
	set	0x74, %o0
	ldsw	[%l7 + %o0],	%i6
	or	%g1,	%i7,	%l1
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xeb,	%i2
	set	0x18, %l2
	lda	[%l7 + %l2] 0x81,	%f19
	set	0x18, %g5
	stwa	%l4,	[%l7 + %g5] 0x80
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x80,	%g6
	add	%l2,	%o3,	%i4
	set	0x30, %l0
	ldxa	[%l7 + %l0] 0x88,	%l6
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%i3
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 3
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	nop
	set	0x10, %l6
	lduh	[%l7 + %l6],	%g2
	set	0x58, %l3
	sta	%f14,	[%l7 + %l3] 0x80
	set	0x0C, %i6
	swapa	[%l7 + %i6] 0x80,	%g4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf0
	membar	#Sync
	set	0x70, %o7
	sta	%f18,	[%l7 + %o7] 0x80
	or	%g5,	%o5,	%o4
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%o0
	set	0x64, %i5
	sta	%f21,	[%l7 + %i5] 0x80
	set	0x74, %g2
	stba	%i5,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x30, %l5
	stxa	%g3,	[%l7 + %l5] 0x81
	nop
	set	0x50, %g4
	std	%o2,	[%l7 + %g4]
	set	0x38, %o6
	stxa	%l5,	[%l7 + %o6] 0x89
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x1C, %o5
	prefetch	[%l7 + %o5],	 0
	st	%fsr,	[%l7 + 0x4C]
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f0
	nop
	set	0x18, %g3
	stw	%o7,	[%l7 + %g3]
	nop
	set	0x70, %i1
	stx	%i0,	[%l7 + %i1]
	nop
	set	0x38, %o2
	stx	%g7,	[%l7 + %o2]
	set	0x20, %o1
	stwa	%i1,	[%l7 + %o1] 0xea
	membar	#Sync
	bl,pt	%xcc,	loop_182
	nop
	set	0x6C, %g1
	swap	[%l7 + %g1],	%o6
	bne,a,pt	%icc,	loop_183
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%g0
loop_182:
	nop
	set	0x10, %i0
	stda	%i6,	[%l7 + %i0] 0x89
loop_183:
	nop
	set	0x1F, %l2
	stb	%i6,	[%l7 + %l2]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%l1
	nop
	set	0x5A, %g5
	ldsh	[%l7 + %g5],	%l4
	set	0x68, %o3
	stda	%g6,	[%l7 + %o3] 0x89
	fpadd16s	%f23,	%f5,	%f20
	nop
	set	0x08, %l0
	std	%o2,	[%l7 + %l0]
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x80,	%i4
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x80,	 2
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xea,	%i2
	nop
	set	0x40, %g7
	ldsw	[%l7 + %g7],	%l2
	set	0x40, %l4
	stda	%l2,	[%l7 + %l4] 0xe3
	membar	#Sync
	add	%g2,	%g5,	%o5
	nop
	set	0x60, %l3
	lduh	[%l7 + %l3],	%g4
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%o4
	nop
	set	0x18, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%l0
	nop
	set	0x44, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x48, %i5
	std	%o0,	[%l7 + %i5]
	wr	%i5,	%g3,	%pic
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%o1
	fpadd32s	%f2,	%f12,	%f8
	and	%o2,	%o7,	%l5
	fpsub32s	%f7,	%f11,	%f13
	nop
	set	0x2C, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x78, %g2
	std	%f12,	[%l7 + %g2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%i1
	and	%i0,	%g1,	%i7
	ld	[%l7 + 0x68],	%f10
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x88,	%o6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xe2,	%i2
	nop
	set	0x7A, %g4
	sth	%l1,	[%l7 + %g4]
	nop
	set	0x64, %o5
	prefetch	[%l7 + %o5],	 0
	be	%xcc,	loop_184
	nop
	set	0x3D, %i2
	ldub	[%l7 + %i2],	%i6
	set	0x49, %i1
	stba	%g6,	[%l7 + %i1] 0xe2
	membar	#Sync
loop_184:
	nop
	set	0x10, %o2
	stda	%o2,	[%l7 + %o2] 0x89
	add	%l4,	%i4,	%l6
	nop
	set	0x40, %g3
	sth	%i3,	[%l7 + %g3]
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x6C, %o0
	stwa	%l2,	[%l7 + %o0] 0x88
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f0
	nop
	set	0x2A, %l2
	lduh	[%l7 + %l2],	%g2
	nop
	set	0x60, %g5
	std	%l2,	[%l7 + %g5]
	nop
	nop
	setx	0xBAE96BEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xA25956A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f9,	%f22
	set	0x28, %i0
	stxa	%o5,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x64, %l0
	ldstub	[%l7 + %l0],	%g4
	nop
	nop
	setx	0x049E2CA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xBB7B08EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f13,	%f2
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	nop
	setx	0x2CEEABF121032507,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x526108A38B8F86AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f12,	%f20
	ld	[%l7 + 0x24],	%f31
	bleu,a,pn	%icc,	loop_185
	add	%o4,	%l0,	%o0
	set	0x48, %i7
	lda	[%l7 + %i7] 0x89,	%f12
loop_185:
	and	%i5,	%g3,	%o1
	or	%o2,	%o7,	%g5
	nop
	set	0x30, %i4
	stx	%l5,	[%l7 + %i4]
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%g7
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%i0
	bgu,a,pt	%icc,	loop_186
	wr	%g1,	%i1,	%sys_tick
	nop
	set	0x30, %l3
	std	%f2,	[%l7 + %l3]
	set	0x6A, %l6
	stha	%i7,	[%l7 + %l6] 0xe3
	membar	#Sync
loop_186:
	nop
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x81,	%o6
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	nop
	setx	0xC67A2703,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9E90D327,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f7,	%f5
	or	%i2,	%l1,	%i6
	or	%g6,	%o3,	%l4
	wr	%i4,	%l6,	%sys_tick
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x88,	%i3
	wr	%l2,	%g2,	%ccr
	nop
	set	0x30, %o4
	ldsh	[%l7 + %o4],	%o5
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x18, %o7
	std	%l2,	[%l7 + %o7]
	nop
	set	0x74, %g2
	stw	%o4,	[%l7 + %g2]
	or	%l0,	%o0,	%i5
	st	%f19,	[%l7 + 0x2C]
	and	%g3,	%o1,	%g4
	set	0x20, %l5
	lda	[%l7 + %l5] 0x81,	%f22
	fpsub16	%f0,	%f26,	%f26
	nop
	set	0x70, %o6
	stw	%o2,	[%l7 + %o6]
	nop
	set	0x79, %g4
	ldub	[%l7 + %g4],	%g5
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%o6
	and	%l5,	%g7,	%g1
	nop
	set	0x38, %i2
	ldstub	[%l7 + %i2],	%i0
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x88
	set	0x78, %i1
	lda	[%l7 + %i1] 0x89,	%f21
	nop
	set	0x08, %g3
	std	%i0,	[%l7 + %g3]
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f28
	nop
	set	0x40, %o2
	stw	%o6,	[%l7 + %o2]
	nop
	set	0x78, %o0
	stx	%i2,	[%l7 + %o0]
	nop
	set	0x24, %g1
	stw	%i7,	[%l7 + %g1]
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xe3,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%g6
	set	0x3C, %i0
	stwa	%l4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	wr	%o3,	%l6,	%set_softint
	set	0x68, %l0
	stxa	%i3,	[%l7 + %l0] 0x80
	nop
	set	0x08, %i7
	stx	%l2,	[%l7 + %i7]
	set	0x10, %o3
	stxa	%g2,	[%l7 + %o3] 0x81
	nop
	set	0x6A, %i4
	sth	%o5,	[%l7 + %i4]
	nop
	set	0x30, %i3
	std	%l2,	[%l7 + %i3]
	nop
	set	0x44, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x48, %l6
	stxa	%o4,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x50, %g7
	stx	%i4,	[%l7 + %g7]
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%l0
	set	0x28, %l4
	stxa	%o0,	[%l7 + %l4] 0x81
	nop
	set	0x32, %i6
	ldsb	[%l7 + %i6],	%i5
	or	%o1,	%g3,	%o2
	st	%f9,	[%l7 + 0x08]
	and	%g4,	%o7,	%g5
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%l5
	nop
	set	0x1C, %o7
	stw	%g1,	[%l7 + %o7]
	nop
	set	0x58, %g2
	ldsb	[%l7 + %g2],	%g7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xe2,	%i0
	nop
	set	0x48, %o6
	swap	[%l7 + %o6],	%i0
	nop
	set	0x70, %l5
	stx	%o6,	[%l7 + %l5]
	nop
	set	0x6C, %o5
	stw	%i2,	[%l7 + %o5]
	nop
	set	0x48, %g4
	std	%f30,	[%l7 + %g4]
	add	%i7,	%l1,	%g6
	set	0x10, %i2
	ldda	[%l7 + %i2] 0xe3,	%l4
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%o3
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%l6
	nop
	set	0x58, %g3
	std	%i6,	[%l7 + %g3]
	set	0x08, %o2
	lda	[%l7 + %o2] 0x88,	%f26
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%g2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	nop
	set	0x51, %g1
	ldub	[%l7 + %g1],	%o5
	nop
	set	0x0E, %o1
	ldstub	[%l7 + %o1],	%l3
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x80
	and	%l2,	%l0,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%o1
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x6C, %l0
	stha	%i5,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x48, %i7
	sth	%g3,	[%l7 + %i7]
	nop
	set	0x77, %i4
	ldub	[%l7 + %i4],	%o2
	and	%g4,	%g5,	%o7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	and	%g1,	%g7,	%l5
	st	%f18,	[%l7 + 0x38]
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f4
	wr	%i0,	%i1,	%pic
	set	0x30, %l3
	stwa	%o6,	[%l7 + %l3] 0x88
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x89,	%i6
	set	0x4C, %l1
	stwa	%i2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x38, %l4
	swap	[%l7 + %l4],	%l1
	set	0x52, %g7
	stha	%g6,	[%l7 + %g7] 0x81
	nop
	set	0x40, %i5
	std	%f12,	[%l7 + %i5]
	nop
	set	0x60, %i6
	std	%o2,	[%l7 + %i6]
	nop
	set	0x60, %o7
	stb	%l4,	[%l7 + %o7]
	set	0x2C, %o4
	lda	[%l7 + %o4] 0x89,	%f24
	nop
	set	0x1C, %g2
	lduh	[%l7 + %g2],	%l6
	nop
	set	0x38, %o6
	swap	[%l7 + %o6],	%i6
	set	0x28, %o5
	stba	%g2,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f20
	nop
	set	0x13, %i2
	ldsb	[%l7 + %i2],	%i3
	nop
	set	0x40, %g6
	stx	%o5,	[%l7 + %g6]
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%l2
	nop
	set	0x20, %g3
	sth	%o4,	[%l7 + %g3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x68, %o2
	stb	%o0,	[%l7 + %o2]
	set	0x14, %o0
	lda	[%l7 + %o0] 0x89,	%f4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f16
	nop
	set	0x0C, %i1
	swap	[%l7 + %i1],	%o1
	and	%i4,	%g3,	%o2
	st	%fsr,	[%l7 + 0x3C]
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f0
	set	0x74, %l2
	lda	[%l7 + %l2] 0x88,	%f0
	st	%f23,	[%l7 + 0x1C]
	st	%f5,	[%l7 + 0x40]
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x81,	%i4
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x81,	%g4
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%g4
	nop
	set	0x5C, %i4
	sth	%g1,	[%l7 + %i4]
	nop
	set	0x46, %i3
	ldub	[%l7 + %i3],	%g7
	nop
	set	0x75, %o3
	stb	%o7,	[%l7 + %o3]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	nop
	set	0x2A, %l6
	ldub	[%l7 + %l6],	%i0
	nop
	set	0x34, %l1
	lduw	[%l7 + %l1],	%l5
	nop
	set	0x40, %l3
	prefetch	[%l7 + %l3],	 2
	or	%i1,	%o6,	%i2
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x81,	%l1
	set	0x54, %i5
	stwa	%i7,	[%l7 + %i5] 0x81
	nop
	set	0x40, %g7
	lduw	[%l7 + %g7],	%o3
	set	0x1C, %i6
	lda	[%l7 + %i6] 0x89,	%f21
	nop
	set	0x3A, %o7
	lduh	[%l7 + %o7],	%g6
	set	0x10, %g2
	stxa	%l4,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x48, %o6
	swapa	[%l7 + %o6] 0x89,	%l6
	set	0x40, %o4
	lda	[%l7 + %o4] 0x89,	%f15
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%g2
	nop
	set	0x70, %o5
	ldstub	[%l7 + %o5],	%i6
	nop
	set	0x12, %l5
	stb	%o5,	[%l7 + %l5]
	wr	%l3,	%i3,	%pic
	fpsub32s	%f9,	%f13,	%f24
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l2
	nop
	set	0x1F, %o2
	ldsb	[%l7 + %o2],	%o4
	nop
	set	0x67, %g6
	ldub	[%l7 + %g6],	%o0
	ld	[%l7 + 0x74],	%f1
	set	0x14, %g1
	stwa	%i4,	[%l7 + %g1] 0x80
	st	%fsr,	[%l7 + 0x0C]
	set	0x78, %o0
	stxa	%g3,	[%l7 + %o0] 0x88
	bleu,a,pt	%xcc,	loop_187
	nop
	set	0x42, %i1
	stb	%o2,	[%l7 + %i1]
	nop
	set	0x10, %l2
	stw	%o1,	[%l7 + %l2]
	nop
	set	0x25, %i0
	stb	%g4,	[%l7 + %i0]
loop_187:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%g5
	nop
	set	0x3A, %g5
	ldstub	[%l7 + %g5],	%g7
	add	%o7,	%g1,	%l5
	nop
	set	0x20, %o1
	stx	%i1,	[%l7 + %o1]
	set	0x56, %l0
	stha	%i0,	[%l7 + %l0] 0x81
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%o6
	nop
	set	0x5C, %i4
	lduw	[%l7 + %i4],	%i2
	ld	[%l7 + 0x08],	%f9
	or	%i7,	%o3,	%g6
	add	%l4,	%l1,	%l6
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f6
	nop
	set	0x08, %i7
	stw	%g2,	[%l7 + %i7]
	nop
	set	0x7C, %l1
	ldsw	[%l7 + %l1],	%i6
	set	0x27, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o5
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f6
	nop
	set	0x78, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f26
	set	0x2A, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%l2
	set	0x47, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o4
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%o0
	nop
	set	0x3A, %g2
	ldstub	[%l7 + %g2],	%i3
	nop
	set	0x18, %o4
	ldsh	[%l7 + %o4],	%i4
	nop
	set	0x08, %o6
	stx	%o2,	[%l7 + %o6]
	fpsub16s	%f11,	%f15,	%f9
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe2,	%o0
	wr	%g3,	%i5,	%softint
	fpsub16	%f26,	%f26,	%f4
	nop
	set	0x10, %o5
	ldsb	[%l7 + %o5],	%g5
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	or	%g4,	%o7,	%g7
	nop
	set	0x28, %g4
	prefetch	[%l7 + %g4],	 4
	set	0x6C, %o2
	stwa	%l5,	[%l7 + %o2] 0x81
	set	0x34, %g6
	lda	[%l7 + %g6] 0x88,	%f3
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f16
	set	0x2D, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g1
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%i0
	nop
	set	0x62, %l2
	stb	%o6,	[%l7 + %l2]
	fpsub16	%f30,	%f28,	%f28
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf0
	membar	#Sync
	nop
	set	0x09, %g5
	stb	%i1,	[%l7 + %g5]
	set	0x28, %o1
	sta	%f1,	[%l7 + %o1] 0x81
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xd8
	set	0x60, %i3
	swapa	[%l7 + %i3] 0x88,	%i7
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%i2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd8
	nop
	set	0x40, %i4
	sth	%g6,	[%l7 + %i4]
	and	%o3,	%l1,	%l4
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	nop
	set	0x58, %i7
	lduw	[%l7 + %i7],	%i6
	set	0x20, %l6
	stha	%o5,	[%l7 + %l6] 0xeb
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%l0
	nop
	set	0x40, %l3
	std	%l2,	[%l7 + %l3]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f16
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd0
	set	0x60, %o7
	sta	%f2,	[%l7 + %o7] 0x88
	or	%o4,	%l3,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%o2
	set	0x50, %l4
	ldda	[%l7 + %l4] 0x81,	%i2
	set	0x40, %i6
	stwa	%o1,	[%l7 + %i6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	set	0x38, %o4
	stda	%i4,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x0A, %g2
	lduh	[%l7 + %g2],	%g3
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x80,	%g4
	bne	%icc,	loop_188
	nop
	set	0x44, %o5
	sth	%o7,	[%l7 + %o5]
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x81,	%g5
loop_188:
	nop
	set	0x52, %g4
	stba	%l5,	[%l7 + %g4] 0x81
	or	%g1,	%g7,	%o6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x89
	set	0x74, %o2
	stwa	%i0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x5E, %g6
	stha	%i1,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x5E, %o0
	ldub	[%l7 + %o0],	%i2
	st	%f13,	[%l7 + 0x64]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%i7
	nop
	set	0x10, %g1
	std	%f28,	[%l7 + %g1]
	set	0x28, %g3
	stwa	%o3,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x14, %l2
	stwa	%l4,	[%l7 + %l2] 0x89
	set	0x78, %g5
	swapa	[%l7 + %g5] 0x81,	%l1
	nop
	set	0x53, %o1
	ldub	[%l7 + %o1],	%i6
	nop
	set	0x35, %l0
	ldstub	[%l7 + %l0],	%o5
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x10, %i3
	ldsb	[%l7 + %i3],	%l6
	nop
	set	0x24, %i1
	prefetch	[%l7 + %i1],	 4
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f16
	nop
	set	0x3E, %o3
	lduh	[%l7 + %o3],	%g2
	nop
	set	0x08, %l1
	std	%f28,	[%l7 + %l1]
	nop
	set	0x13, %i4
	ldsb	[%l7 + %i4],	%l2
	fpadd32s	%f2,	%f4,	%f24
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x80,	%l0
	or	%o4,	%o0,	%i4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc8
	nop
	set	0x34, %i5
	ldsh	[%l7 + %i5],	%l3
	nop
	set	0x38, %g7
	ldsh	[%l7 + %g7],	%o2
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%o1
	nop
	set	0x40, %o7
	ldsh	[%l7 + %o7],	%i5
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
	nop
	set	0x38, %o4
	std	%f14,	[%l7 + %o4]
	nop
	set	0x50, %i6
	stx	%g4,	[%l7 + %i6]
	fpadd16s	%f6,	%f31,	%f30
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%g5
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x89,	%o7
	and	%l5,	%g7,	%g1
	nop
	set	0x60, %l5
	lduw	[%l7 + %l5],	%o6
	nop
	set	0x60, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x3F, %o6
	ldub	[%l7 + %o6],	%i1
	set	0x28, %o5
	stda	%i2,	[%l7 + %o5] 0x81
	and	%g6,	%i0,	%o3
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%i6
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%l0
	nop
	set	0x43, %g6
	ldub	[%l7 + %g6],	%i6
	set	0x16, %g3
	stha	%o5,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x28, %g1
	std	%l4,	[%l7 + %g1]
	nop
	set	0x70, %l2
	stw	%l6,	[%l7 + %l2]
	or	%l2,	%l0,	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%i4
	set	0x14, %o1
	lda	[%l7 + %o1] 0x88,	%f0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%o2
	nop
	set	0x50, %g5
	lduh	[%l7 + %g5],	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x50, %i3
	ldx	[%l7 + %i3],	%i3
	set	0x64, %l0
	lda	[%l7 + %l0] 0x88,	%f11
	set	0x34, %i1
	stba	%g4,	[%l7 + %i1] 0x80
	nop
	set	0x38, %i0
	stx	%g3,	[%l7 + %i0]
	set	0x5D, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g5
	nop
	set	0x40, %i4
	std	%f30,	[%l7 + %i4]
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x89,	%o7
	nop
	set	0x40, %l6
	ldsw	[%l7 + %l6],	%l5
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xe2,	%g0
	fpsub16s	%f25,	%f26,	%f25
	nop
	set	0x70, %i5
	prefetch	[%l7 + %i5],	 0
	ba,a,pn	%icc,	loop_189
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%g6
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f0
loop_189:
	nop
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x80,	 2
	set	0x0E, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i2
	ble,a	%xcc,	loop_190
	or	%g6,	%i0,	%o3
	nop
	set	0x6C, %g7
	stw	%i7,	[%l7 + %g7]
	fpsub16	%f30,	%f22,	%f0
loop_190:
	nop
	set	0x24, %i6
	sth	%i1,	[%l7 + %i6]
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x80,	%l0
	nop
	set	0x3F, %g2
	ldsb	[%l7 + %g2],	%o5
	nop
	set	0x69, %l5
	ldsb	[%l7 + %l5],	%i6
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x88,	%l4
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f24
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xcc
	and	%l6,	%l2,	%l0
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x20, %o0
	std	%g2,	[%l7 + %o0]
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x88,	%i4
	set	0x20, %g3
	stha	%o4,	[%l7 + %g3] 0x88
	nop
	set	0x50, %g1
	sth	%o2,	[%l7 + %g1]
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%o0
	set	0x10, %l2
	stda	%o0,	[%l7 + %l2] 0x88
	add	%l3,	%i5,	%i3
	nop
	nop
	setx	0x2CCD29BFD42AF09D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x9A5536B8EE599FF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f18
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x81,	 1
	nop
	set	0x70, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x58, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x6E, %i1
	sth	%g4,	[%l7 + %i1]
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f2
	nop
	set	0x76, %l0
	ldsh	[%l7 + %l0],	%g5
	set	0x15, %o3
	stba	%o7,	[%l7 + %o3] 0x80
	set	0x10, %l1
	stda	%g0,	[%l7 + %l1] 0x81
	add	%g7,	%o6,	%i2
	fpsub16s	%f20,	%f31,	%f28
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	or	%g6,	%i0,	%o3
	st	%f6,	[%l7 + 0x68]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc0
	be,a,pn	%icc,	loop_191
	st	%fsr,	[%l7 + 0x5C]
	set	0x5A, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l5
loop_191:
	nop
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x76, %i5
	sth	%i7,	[%l7 + %i5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%o5
	st	%f24,	[%l7 + 0x78]
	nop
	set	0x4C, %o7
	lduw	[%l7 + %o7],	%i6
	nop
	set	0x26, %l4
	lduh	[%l7 + %l4],	%l6
	set	0x60, %g7
	stwa	%l4,	[%l7 + %g7] 0xe3
	membar	#Sync
	st	%f26,	[%l7 + 0x2C]
	nop
	set	0x50, %o4
	ldsb	[%l7 + %o4],	%l2
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x88,	%g2
	set	0x18, %i2
	stda	%i4,	[%l7 + %i2] 0x81
	nop
	set	0x48, %l5
	stx	%l0,	[%l7 + %l5]
	set	0x1F, %o6
	stba	%o4,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%o2
	set	0x38, %g4
	stxa	%o0,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x5E, %o0
	stba	%l3,	[%l7 + %o0] 0x88
	nop
	set	0x40, %o5
	std	%o0,	[%l7 + %o5]
	nop
	set	0x38, %o2
	std	%i2,	[%l7 + %o2]
	nop
	nop
	setx	0x740E6319,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xA739FF5A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f22,	%f20
	nop
	set	0x38, %g1
	sth	%i5,	[%l7 + %g1]
	nop
	set	0x7C, %g3
	stw	%g4,	[%l7 + %g3]
	set	0x54, %l2
	sta	%f29,	[%l7 + %l2] 0x89
	set	0x60, %o1
	stxa	%g5,	[%l7 + %o1] 0x80
	wr	%g3,	%o7,	%clear_softint
	nop
	set	0x50, %g5
	lduh	[%l7 + %g5],	%g7
	nop
	set	0x6B, %g6
	ldstub	[%l7 + %g6],	%o6
	nop
	set	0x0A, %i3
	stb	%i2,	[%l7 + %i3]
	and	%g1,	%g6,	%o3
	nop
	set	0x58, %i1
	std	%f30,	[%l7 + %i1]
	nop
	set	0x40, %l0
	std	%i0,	[%l7 + %l0]
	nop
	set	0x40, %o3
	stx	%i1,	[%l7 + %o3]
	wr	%l5,	%l1,	%ccr
	nop
	set	0x38, %l1
	stx	%o5,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%l6
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%l4
	set	0x14, %i0
	lda	[%l7 + %i0] 0x89,	%f1
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x78, %i4
	stx	%l2,	[%l7 + %i4]
	wr	%i7,	%g2,	%y
	nop
	set	0x4E, %o7
	ldsh	[%l7 + %o7],	%l0
	set	0x18, %i5
	stba	%o4,	[%l7 + %i5] 0x89
	fpadd16	%f2,	%f14,	%f24
	and	%o2,	%o0,	%l3
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%o0
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	nop
	set	0x44, %i6
	prefetch	[%l7 + %i6],	 2
	bleu,pt	%icc,	loop_192
	nop
	set	0x70, %i2
	lduh	[%l7 + %i2],	%i5
	nop
	set	0x40, %l5
	stx	%i4,	[%l7 + %l5]
	nop
	set	0x36, %o6
	ldub	[%l7 + %o6],	%g5
loop_192:
	nop
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
	nop
	set	0x6D, %g4
	ldsb	[%l7 + %g4],	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF44, 	%tick_cmpr
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f0
	fpsub16	%f16,	%f18,	%f8
	nop
	set	0x60, %o0
	ldstub	[%l7 + %o0],	%g1
	and	%g6,	%o3,	%i0
	nop
	set	0x0C, %o2
	stw	%i1,	[%l7 + %o2]
	nop
	set	0x40, %g1
	ldsh	[%l7 + %g1],	%l5
	set	0x70, %g3
	stda	%i2,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x30, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%l0
	nop
	set	0x08, %g5
	std	%o4,	[%l7 + %g5]
	or	%i6,	%l6,	%l4
	nop
	set	0x64, %g6
	ldsb	[%l7 + %g6],	%i7
	set	0x31, %o1
	stba	%l2,	[%l7 + %o1] 0x89
	set	0x48, %i3
	lda	[%l7 + %i3] 0x89,	%f13
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x32, %l0
	ldstub	[%l7 + %l0],	%g2
	ld	[%l7 + 0x28],	%f14
	nop
	set	0x40, %o3
	std	%o4,	[%l7 + %o3]
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%l0
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x40, %i7
	std	%f6,	[%l7 + %i7]
	nop
	set	0x68, %i0
	std	%f16,	[%l7 + %i0]
	bleu,a,pt	%icc,	loop_193
	nop
	set	0x08, %i4
	std	%o0,	[%l7 + %i4]
	nop
	set	0x74, %o7
	ldub	[%l7 + %o7],	%l3
	nop
	set	0x54, %i5
	ldsw	[%l7 + %i5],	%o1
loop_193:
	nop
	set	0x6A, %l3
	stha	%o2,	[%l7 + %l3] 0x88
	add	%i3,	%i5,	%g5
	nop
	set	0x15, %o4
	stb	%i4,	[%l7 + %o4]
	set	0x28, %l4
	stda	%g4,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xcc
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x40, %l5
	std	%f24,	[%l7 + %l5]
	set	0x3C, %o6
	stwa	%g3,	[%l7 + %o6] 0x81
	add	%g7,	%o6,	%g1
	ld	[%l7 + 0x60],	%f1
	add	%o7,	%o3,	%i0
	set	0x14, %i6
	lda	[%l7 + %i6] 0x81,	%f15
	nop
	set	0x3E, %g4
	ldsh	[%l7 + %g4],	%i1
	set	0x5C, %g2
	swapa	[%l7 + %g2] 0x89,	%g6
	set	0x63, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l5
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%l1
	add	%i2,	%o5,	%l6
	nop
	set	0x08, %g7
	ldsh	[%l7 + %g7],	%i6
	st	%fsr,	[%l7 + 0x54]
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xe3,	%i6
	add	%l4,	%l2,	%o4
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x5E, %g3
	ldsh	[%l7 + %g3],	%l0
	nop
	set	0x34, %g5
	sth	%g2,	[%l7 + %g5]
	nop
	set	0x1E, %o5
	ldstub	[%l7 + %o5],	%o0
	nop
	set	0x50, %g6
	std	%o0,	[%l7 + %g6]
	and	%l3,	%i3,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%g5
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xd8
	add	%i4,	%g4,	%g3
	set	0x6F, %i1
	stba	%o6,	[%l7 + %i1] 0x80
	nop
	set	0x50, %l0
	lduh	[%l7 + %l0],	%g1
	set	0x4C, %i3
	stba	%g7,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x0A, %o3
	stha	%o7,	[%l7 + %o3] 0x89
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x3A, %l1
	ldsh	[%l7 + %l1],	%g6
	nop
	set	0x78, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x48, %l6
	stba	%l5,	[%l7 + %l6] 0x80
	wr	%l1,	%i2,	%y
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f6
	nop
	set	0x4E, %i0
	ldsh	[%l7 + %i0],	%o5
	set	0x74, %i5
	sta	%f18,	[%l7 + %i5] 0x89
	and	%o3,	%l6,	%i7
	set	0x10, %l3
	stda	%l4,	[%l7 + %l3] 0x88
	nop
	set	0x41, %o7
	ldub	[%l7 + %o7],	%l2
	set	0x48, %l4
	sta	%f24,	[%l7 + %l4] 0x89
	nop
	set	0x38, %o4
	std	%o4,	[%l7 + %o4]
	nop
	set	0x38, %l5
	stx	%l0,	[%l7 + %l5]
	nop
	set	0x19, %i2
	ldstub	[%l7 + %i2],	%g2
	nop
	set	0x10, %o6
	stx	%fsr,	[%l7 + %o6]
	add	%o0,	%o1,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%o2
	nop
	set	0x28, %i6
	ldub	[%l7 + %i6],	%i3
	nop
	set	0x68, %g4
	std	%f16,	[%l7 + %g4]
	nop
	set	0x14, %o0
	lduw	[%l7 + %o0],	%g5
	set	0x58, %g2
	stda	%i4,	[%l7 + %g2] 0xeb
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g3
	nop
	set	0x74, %g7
	sth	%g4,	[%l7 + %g7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%o6
	and	%o7,	%i0,	%i1
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%g6
	set	0x78, %g1
	swapa	[%l7 + %g1] 0x89,	%g7
	nop
	set	0x24, %l2
	stw	%l5,	[%l7 + %l2]
	set	0x58, %g5
	stda	%i2,	[%l7 + %g5] 0x80
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x81,	%l0
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xda
	nop
	set	0x40, %o1
	std	%f6,	[%l7 + %o1]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%o5
	nop
	set	0x52, %g6
	sth	%l6,	[%l7 + %g6]
	nop
	set	0x20, %l0
	std	%l4,	[%l7 + %l0]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f16
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f24
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%i7
	set	0x44, %l1
	swapa	[%l7 + %l1] 0x81,	%l2
	set	0x30, %l6
	sta	%f15,	[%l7 + %l6] 0x89
	nop
	set	0x70, %i7
	ldsh	[%l7 + %i7],	%o4
	set	0x10, %i0
	stha	%g2,	[%l7 + %i0] 0x80
	nop
	set	0x1C, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x78, %i4
	std	%f2,	[%l7 + %i4]
	and	%o0,	%l0,	%i6
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xca
	nop
	set	0x30, %o4
	ldub	[%l7 + %o4],	%o2
	set	0x08, %o7
	stwa	%l3,	[%l7 + %o7] 0x88
	set	0x60, %l5
	sta	%f16,	[%l7 + %l5] 0x89
	and	%g5,	%i3,	%i5
	and	%g3,	%i4,	%g4
	nop
	set	0x68, %o6
	stx	%o6,	[%l7 + %o6]
	or	%g1,	%i0,	%i1
	nop
	set	0x14, %i6
	stb	%o7,	[%l7 + %i6]
	nop
	set	0x34, %i2
	swap	[%l7 + %i2],	%g6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	set	0x4C, %o0
	stwa	%g7,	[%l7 + %o0] 0x81
	fpsub32s	%f5,	%f12,	%f2
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc4
	nop
	set	0x54, %g7
	stw	%i2,	[%l7 + %g7]
	nop
	set	0x22, %g1
	ldstub	[%l7 + %g1],	%l1
	nop
	set	0x24, %l2
	ldub	[%l7 + %l2],	%o3
	set	0x3C, %o2
	lda	[%l7 + %o2] 0x81,	%f8
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%l5
	st	%f3,	[%l7 + 0x64]
	fpsub32	%f22,	%f6,	%f20
	nop
	set	0x38, %o5
	swap	[%l7 + %o5],	%l6
	nop
	set	0x1A, %g5
	stb	%o5,	[%l7 + %g5]
	nop
	set	0x64, %g6
	stw	%i7,	[%l7 + %g6]
	nop
	set	0x5C, %l0
	stw	%l4,	[%l7 + %l0]
	set	0x0C, %i1
	stwa	%o4,	[%l7 + %i1] 0x88
	add	%l2,	%o0,	%l0
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x68, %o3
	std	%i6,	[%l7 + %o3]
	nop
	set	0x6F, %o1
	ldsb	[%l7 + %o1],	%o1
	nop
	set	0x20, %l6
	stx	%o2,	[%l7 + %l6]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%l2
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xe2,	%g2
	nop
	set	0x48, %i0
	stw	%i3,	[%l7 + %i0]
	add	%i5,	%g5,	%i4
	nop
	set	0x78, %i5
	lduw	[%l7 + %i5],	%g3
	set	0x58, %l3
	ldxa	[%l7 + %l3] 0x89,	%o6
	nop
	set	0x0B, %l4
	ldsb	[%l7 + %l4],	%g4
	nop
	set	0x16, %i4
	ldsh	[%l7 + %i4],	%g1
	set	0x68, %o4
	ldxa	[%l7 + %o4] 0x80,	%i1
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f8
	set	0x7C, %o7
	ldstuba	[%l7 + %o7] 0x89,	%i0
	add	%g6,	%o7,	%g7
	ld	[%l7 + 0x70],	%f16
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x80,	 2
	nop
	set	0x1F, %i2
	stb	%o3,	[%l7 + %i2]
	nop
	set	0x28, %o6
	stw	%i2,	[%l7 + %o6]
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f16
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f0
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%l5
	set	0x64, %g1
	lda	[%l7 + %g1] 0x89,	%f11
	set	0x50, %g7
	stda	%i6,	[%l7 + %g7] 0xeb
	membar	#Sync
	and	%i7,	%l4,	%o5
	set	0x34, %o2
	ldstuba	[%l7 + %o2] 0x81,	%o4
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%i6
	st	%fsr,	[%l7 + 0x70]
	set	0x24, %l2
	swapa	[%l7 + %l2] 0x89,	%o1
	nop
	nop
	setx	0x83270BFFADFCA45F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x63BF1359C3EAB041,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f4
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x88,	%l0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xca
	set	0x38, %l0
	stwa	%o2,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x38, %i1
	sta	%f21,	[%l7 + %i1] 0x88
	nop
	set	0x20, %i3
	stw	%g2,	[%l7 + %i3]
	add	%i3,	%i5,	%g5
	add	%l3,	%i4,	%g3
	nop
	set	0x6C, %o5
	ldsh	[%l7 + %o5],	%o6
	wr	%g1,	%g4,	%ccr
	set	0x68, %o1
	sta	%f15,	[%l7 + %o1] 0x81
	and	%i1,	%g6,	%i0
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%g6
	or	%l1,	%o3,	%o7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%l5
	fpadd16	%f14,	%f24,	%f24
	nop
	set	0x14, %l1
	lduw	[%l7 + %l1],	%l6
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf9,	%f0
	nop
	set	0x6C, %i0
	ldub	[%l7 + %i0],	%l4
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x88,	%i7
	add	%o5,	%o0,	%l2
	set	0x6C, %i7
	sta	%f21,	[%l7 + %i7] 0x89
	set	0x40, %l4
	stxa	%i6,	[%l7 + %l4] 0x89
	set	0x55, %i4
	stba	%o4,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	nop
	set	0x0A, %o4
	stb	%o1,	[%l7 + %o4]
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x80,	%o2
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%i3
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f16
	nop
	set	0x59, %i2
	ldstub	[%l7 + %i2],	%i5
	nop
	set	0x50, %o0
	ldstub	[%l7 + %o0],	%g5
	nop
	set	0x46, %g2
	ldsb	[%l7 + %g2],	%l3
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x89,	%i4
	be,pt	%icc,	loop_194
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x58, %g7
	std	%f18,	[%l7 + %g7]
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%g2
loop_194:
	wr	%g3,	%g1,	%set_softint
	nop
	set	0x78, %g3
	std	%f26,	[%l7 + %g3]
	st	%f26,	[%l7 + 0x18]
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x89,	%g4
	st	%f20,	[%l7 + 0x28]
	set	0x3F, %l2
	stba	%o6,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x80
	fpadd32	%f2,	%f16,	%f16
	nop
	nop
	setx	0x5EAECD7F49B10AB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x6DE84F30F8B363B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f0
	nop
	set	0x31, %i1
	stb	%i1,	[%l7 + %i1]
	nop
	set	0x70, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x61, %o5
	stb	%g6,	[%l7 + %o5]
	nop
	set	0x30, %i3
	std	%g6,	[%l7 + %i3]
	set	0x7F, %o1
	stba	%i0,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%o7
	set	0x14, %l1
	ldstuba	[%l7 + %l1] 0x81,	%i2
	nop
	set	0x71, %l6
	ldsb	[%l7 + %l6],	%l5
	fpsub16s	%f23,	%f1,	%f8
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x81,	 4
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x58, %o3
	std	%f12,	[%l7 + %o3]
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f24
	set	0x28, %l4
	stwa	%l4,	[%l7 + %l4] 0x80
	set	0x30, %i4
	stxa	%l6,	[%l7 + %i4] 0x81
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xeb,	%i6
	nop
	set	0x40, %o4
	prefetch	[%l7 + %o4],	 2
	bge,pt	%icc,	loop_195
	nop
	set	0x18, %l5
	ldsw	[%l7 + %l5],	%o5
	nop
	set	0x68, %i5
	stw	%o0,	[%l7 + %i5]
	add	%i6,	%l2,	%o4
loop_195:
	nop
	set	0x48, %i6
	sth	%o1,	[%l7 + %i6]
	and	%l0,	%o2,	%i5
	nop
	set	0x1E, %i2
	lduh	[%l7 + %i2],	%i3
	nop
	set	0x3E, %o7
	ldsh	[%l7 + %o7],	%l3
	set	0x38, %o0
	stxa	%i4,	[%l7 + %o0] 0x88
	nop
	set	0x50, %g2
	std	%g4,	[%l7 + %g2]
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%g4
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x78, %o6
	lda	[%l7 + %o6] 0x89,	%f9
	set	0x58, %g3
	stxa	%o6,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x15, %o2
	ldub	[%l7 + %o2],	%i1
	wr	%g6,	%g2,	%set_softint
	set	0x18, %l2
	stwa	%g7,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%o2
	set	0x28, %g5
	stba	%o7,	[%l7 + %g5] 0x88
	nop
	set	0x56, %i1
	ldsb	[%l7 + %i1],	%i0
	nop
	set	0x52, %l0
	ldub	[%l7 + %l0],	%l5
	add	%i2,	%l4,	%l6
	nop
	set	0x08, %o5
	stx	%l1,	[%l7 + %o5]
	set	0x18, %g4
	prefetcha	[%l7 + %g4] 0x80,	 4
	st	%fsr,	[%l7 + 0x74]
	or	%i7,	%i6,	%l2
	set	0x48, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f16
	fpadd32s	%f31,	%f25,	%f30
	nop
	set	0x68, %l6
	ldx	[%l7 + %l6],	%o4
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f14
	set	0x40, %i0
	stda	%o0,	[%l7 + %i0] 0x89
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x2F, %i7
	ldstub	[%l7 + %i7],	%i5
	set	0x3C, %i4
	stwa	%i3,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xea,	%o2
	set	0x6B, %o4
	stba	%i4,	[%l7 + %o4] 0x88
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%g4
	nop
	set	0x2A, %i5
	ldub	[%l7 + %i5],	%l3
	set	0x08, %i6
	stwa	%g3,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x1F, %i2
	stba	%g4,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	ld	[%l7 + 0x7C],	%f13
	nop
	set	0x7C, %o7
	ldsb	[%l7 + %o7],	%g1
	nop
	set	0x60, %g2
	stx	%i1,	[%l7 + %g2]
	nop
	set	0x60, %o0
	std	%f10,	[%l7 + %o0]
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%g6
	nop
	set	0x34, %o6
	ldsb	[%l7 + %o6],	%o6
	nop
	set	0x58, %g7
	std	%g6,	[%l7 + %g7]
	nop
	set	0x14, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%g2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f0
	nop
	set	0x6A, %g5
	ldub	[%l7 + %g5],	%o3
	nop
	set	0x6E, %l2
	stb	%i0,	[%l7 + %l2]
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x81,	%o6
	nop
	set	0x64, %o5
	lduh	[%l7 + %o5],	%i2
	add	%l4,	%l6,	%l5
	set	0x40, %g4
	stda	%l0,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x54, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o5
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f18
	set	0x50, %o1
	stwa	%i6,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x28, %l6
	sta	%f10,	[%l7 + %l6] 0x81
	or	%l2,	%o0,	%i7
	nop
	set	0x50, %o3
	std	%o4,	[%l7 + %o3]
	nop
	set	0x0A, %l1
	ldsh	[%l7 + %l1],	%l0
	set	0x58, %i0
	stxa	%i5,	[%l7 + %i0] 0x89
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 0
	wr	%o1,	%i3,	%softint
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe3,	%i4
	or	%g5,	%l3,	%o2
	set	0x50, %i7
	stda	%g2,	[%l7 + %i7] 0x88
	nop
	set	0x1C, %o4
	ldstub	[%l7 + %o4],	%g1
	set	0x16, %i5
	stba	%i1,	[%l7 + %i5] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%o6
	or	%g6,	%g7,	%o3
	add	%i0,	%g2,	%o7
	nop
	set	0x0E, %l5
	ldsh	[%l7 + %l5],	%l4
	nop
	set	0x72, %i6
	sth	%i2,	[%l7 + %i6]
	set	0x50, %i2
	ldda	[%l7 + %i2] 0xea,	%i6
	set	0x7A, %o7
	stba	%l1,	[%l7 + %o7] 0x88
	nop
	set	0x18, %g2
	stb	%l5,	[%l7 + %g2]
	nop
	set	0x0A, %l4
	sth	%o5,	[%l7 + %l4]
	nop
	set	0x3A, %o0
	ldub	[%l7 + %o0],	%l2
	nop
	set	0x57, %g1
	stb	%i6,	[%l7 + %g1]
	nop
	set	0x71, %g7
	ldstub	[%l7 + %g7],	%i7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	nop
	set	0x50, %o6
	ldsw	[%l7 + %o6],	%o4
	nop
	set	0x28, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x40, %g5
	std	%f4,	[%l7 + %g5]
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%f0
	nop
	set	0x74, %i1
	sth	%o0,	[%l7 + %i1]
	nop
	set	0x20, %l2
	ldub	[%l7 + %l2],	%i5
	nop
	set	0x14, %g4
	lduh	[%l7 + %g4],	%i3
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf0
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	add	%o1,	%g5,	%l3
	nop
	set	0x36, %i3
	lduh	[%l7 + %i3],	%i4
	nop
	set	0x4C, %o1
	swap	[%l7 + %o1],	%o2
	fpsub16	%f26,	%f26,	%f6
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x80,	%g2
	set	0x77, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g1
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x2E, %l1
	ldsh	[%l7 + %l1],	%o6
	set	0x0C, %i4
	swapa	[%l7 + %i4] 0x81,	%o3
	nop
	set	0x36, %i7
	sth	%i0,	[%l7 + %i7]
	fpsub16	%f28,	%f24,	%f20
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	set	0x78, %l3
	lda	[%l7 + %l3] 0x88,	%f16
	set	0x5E, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g2
	nop
	set	0x42, %l5
	stb	%g7,	[%l7 + %l5]
	nop
	set	0x40, %i2
	std	%f28,	[%l7 + %i2]
	set	0x64, %i6
	sta	%f24,	[%l7 + %i6] 0x88
	add	%o7,	%l4,	%i2
	st	%f30,	[%l7 + 0x78]
	nop
	set	0x0C, %o7
	swap	[%l7 + %o7],	%l1
	nop
	set	0x34, %l4
	swap	[%l7 + %l4],	%l5
	set	0x60, %o0
	stda	%o4,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x3D, %g1
	stb	%l6,	[%l7 + %g1]
	ld	[%l7 + 0x58],	%f1
	nop
	set	0x6C, %g7
	swap	[%l7 + %g7],	%l2
	set	0x60, %o2
	stha	%i6,	[%l7 + %o2] 0xe3
	membar	#Sync
	and	%o4,	%i7,	%l0
	nop
	set	0x18, %o6
	stx	%i5,	[%l7 + %o6]
	st	%f29,	[%l7 + 0x10]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%i3
	nop
	set	0x2E, %g2
	lduh	[%l7 + %g2],	%o1
	set	0x20, %g6
	stda	%g4,	[%l7 + %g6] 0x88
	st	%fsr,	[%l7 + 0x30]
	fpadd32s	%f21,	%f22,	%f9
	set	0x09, %g5
	stba	%i4,	[%l7 + %g5] 0xea
	membar	#Sync
	ld	[%l7 + 0x08],	%f21
	nop
	set	0x30, %i1
	lduh	[%l7 + %i1],	%o2
	nop
	set	0x78, %l2
	ldsh	[%l7 + %l2],	%l3
	set	0x1B, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x80
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x89,	%g4
	st	%f14,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x2C]
	set	0x2D, %g3
	stba	%i1,	[%l7 + %g3] 0x88
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%g6
	bg,a	%xcc,	loop_196
	nop
	set	0x41, %o5
	stb	%o6,	[%l7 + %o5]
	nop
	set	0x7E, %l6
	sth	%o3,	[%l7 + %l6]
	set	0x54, %o3
	lda	[%l7 + %o3] 0x88,	%f23
loop_196:
	nop
	set	0x08, %i0
	stxa	%g3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	ld	[%l7 + 0x64],	%f28
	nop
	set	0x34, %i7
	stw	%g2,	[%l7 + %i7]
	nop
	set	0x34, %i4
	ldsw	[%l7 + %i4],	%i0
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f16
	st	%f16,	[%l7 + 0x74]
	nop
	nop
	setx	0xD2171EFAF509ED0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x565D16EE6ED320A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f30
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%o6
	wr	%l4,	%i2,	%y
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1247
!	Type a   	: 27
!	Type cti   	: 30
!	Type x   	: 516
!	Type f   	: 52
!	Type i   	: 128
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
	set	0xF,	%g1
	set	0x5,	%g2
	set	0x7,	%g3
	set	0x2,	%g4
	set	0xA,	%g5
	set	0x9,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x6,	%i1
	set	-0x2,	%i2
	set	-0x3,	%i3
	set	-0x0,	%i4
	set	-0x0,	%i5
	set	-0x3,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x571D4C35,	%l0
	set	0x750E0BED,	%l1
	set	0x6C788BAA,	%l2
	set	0x15C2B6FC,	%l3
	set	0x4950EA3A,	%l4
	set	0x759BEFCE,	%l5
	set	0x6A98AB6D,	%l6
	!# Output registers
	set	0x1CC2,	%o0
	set	0x0414,	%o1
	set	0x11E3,	%o2
	set	-0x0D58,	%o3
	set	-0x14EA,	%o4
	set	-0x04CC,	%o5
	set	0x0B38,	%o6
	set	-0x0410,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x50D2C45983E1314C)
	INIT_TH_FP_REG(%l7,%f2,0x4F4030478FA9DD46)
	INIT_TH_FP_REG(%l7,%f4,0xAECEFC89A324B2E9)
	INIT_TH_FP_REG(%l7,%f6,0x58D538DAB7559B93)
	INIT_TH_FP_REG(%l7,%f8,0xDCC55C8CF6A87777)
	INIT_TH_FP_REG(%l7,%f10,0x05214752683EC1C3)
	INIT_TH_FP_REG(%l7,%f12,0x090E6C1292F36852)
	INIT_TH_FP_REG(%l7,%f14,0x4AEEE78A14A49ED9)
	INIT_TH_FP_REG(%l7,%f16,0x4E479F5E4B3DBAB0)
	INIT_TH_FP_REG(%l7,%f18,0xA681E608AB6681C0)
	INIT_TH_FP_REG(%l7,%f20,0x7A9B9DD94353E6EE)
	INIT_TH_FP_REG(%l7,%f22,0x2F10070D7153F1C2)
	INIT_TH_FP_REG(%l7,%f24,0x87C52C9F1C1F4B71)
	INIT_TH_FP_REG(%l7,%f26,0xAFF347786560502C)
	INIT_TH_FP_REG(%l7,%f28,0xD58BB65DDCCEE837)
	INIT_TH_FP_REG(%l7,%f30,0xDF9B40B6AE1D95ED)

	!# Execute Main Diag ..

	set	0x44, %l5
	lda	[%l7 + %l5] 0x80,	%f23
	nop
	set	0x62, %l3
	ldsh	[%l7 + %l3],	%g7
	bge,a	%xcc,	loop_197
	st	%f22,	[%l7 + 0x1C]
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%l1
	ld	[%l7 + 0x64],	%f17
loop_197:
	nop
	set	0x40, %o7
	stda	%o4,	[%l7 + %o7] 0x81
	nop
	set	0x30, %l4
	std	%i6,	[%l7 + %l4]
	nop
	set	0x14, %i2
	swap	[%l7 + %i2],	%l2
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x89,	 2
	ld	[%l7 + 0x2C],	%f8
	nop
	set	0x22, %g7
	ldstub	[%l7 + %g7],	%l5
	nop
	set	0x57, %o2
	ldstub	[%l7 + %o2],	%o4
	nop
	set	0x18, %g1
	prefetch	[%l7 + %g1],	 4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%i7
	set	0x64, %g2
	sta	%f12,	[%l7 + %g2] 0x88
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%o0
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	nop
	set	0x48, %g5
	stw	%i3,	[%l7 + %g5]
	set	0x5C, %l2
	lda	[%l7 + %l2] 0x80,	%f24
	ld	[%l7 + 0x10],	%f14
	nop
	set	0x3E, %i1
	ldsb	[%l7 + %i1],	%o1
	nop
	set	0x1F, %l0
	ldub	[%l7 + %l0],	%i5
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%i4
	set	0x2C, %i3
	stwa	%g5,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x0C, %g3
	sta	%f21,	[%l7 + %g3] 0x88
	fpsub16s	%f8,	%f7,	%f9
	nop
	set	0x48, %o1
	ldsw	[%l7 + %o1],	%l3
	set	0x4E, %o5
	stba	%g1,	[%l7 + %o5] 0x88
	set	0x3E, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%g6
	set	0x50, %i0
	stxa	%o6,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x4C, %l1
	swapa	[%l7 + %l1] 0x81,	%i1
	set	0x38, %i7
	lda	[%l7 + %i7] 0x89,	%f18
	nop
	set	0x67, %o3
	ldstub	[%l7 + %o3],	%g3
	nop
	set	0x68, %o4
	stx	%g2,	[%l7 + %o4]
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%o3
	nop
	set	0x2F, %l5
	ldsb	[%l7 + %l5],	%o7
	nop
	set	0x33, %i5
	ldub	[%l7 + %i5],	%i0
	set	0x1C, %l3
	lda	[%l7 + %l3] 0x80,	%f25
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f28
	and	%l4,	%g7,	%l1
	nop
	set	0x0E, %i6
	ldstub	[%l7 + %i6],	%o5
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%i2
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f18
	nop
	set	0x74, %o0
	ldstub	[%l7 + %o0],	%l5
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x80,	 4
	set	0x08, %g1
	stda	%l0,	[%l7 + %g1] 0x88
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%i6
	add	%i7,	%i3,	%o0
	st	%f9,	[%l7 + 0x64]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%i5
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%g1
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%g4
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x89,	%l2
	nop
	set	0x0A, %i1
	lduh	[%l7 + %i1],	%o2
	nop
	set	0x28, %o6
	prefetch	[%l7 + %o6],	 4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f16
	nop
	set	0x30, %g4
	swap	[%l7 + %g4],	%g6
	ld	[%l7 + 0x10],	%f9
	set	0x18, %i3
	stwa	%o6,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x52, %g3
	ldsh	[%l7 + %g3],	%i1
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%g2
	nop
	set	0x38, %o5
	swap	[%l7 + %o5],	%o3
	nop
	set	0x60, %i0
	swap	[%l7 + %i0],	%o7
	set	0x10, %l6
	stxa	%g3,	[%l7 + %l6] 0x80
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x88,	%l4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd8,	%f0
	nop
	set	0x68, %o4
	stx	%i0,	[%l7 + %o4]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%o5
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%l6
	set	0x7C, %i5
	lda	[%l7 + %i5] 0x88,	%f18
	nop
	set	0x40, %o3
	stb	%l1,	[%l7 + %o3]
	ld	[%l7 + 0x7C],	%f0
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x88,	%i2
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%l4
	nop
	set	0x7C, %l4
	ldsh	[%l7 + %l4],	%o4
	nop
	set	0x24, %i2
	sth	%l2,	[%l7 + %i2]
	fpsub32s	%f17,	%f18,	%f20
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 1
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x74, %i6
	lduw	[%l7 + %i6],	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%i3
	st	%f7,	[%l7 + 0x44]
	nop
	set	0x2C, %g7
	lduh	[%l7 + %g7],	%o0
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f0
	st	%f17,	[%l7 + 0x70]
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f22
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%o1
	and	%i4,	%l0,	%i5
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%g5
	set	0x3E, %g5
	stha	%g4,	[%l7 + %g5] 0x81
	set	0x2A, %i1
	stha	%g1,	[%l7 + %i1] 0x80
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x80,	%o2
	or	%l3,	%g6,	%o6
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%i1
	nop
	nop
	setx	0x05522DAC7C507A42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1B1A0B8CB5189449,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f16,	%f26
	or	%o3,	%g2,	%o7
	set	0x68, %g4
	swapa	[%l7 + %g4] 0x80,	%l4
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%g3
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	nop
	set	0x1C, %i3
	ldsw	[%l7 + %i3],	%g7
	nop
	set	0x20, %o5
	std	%o4,	[%l7 + %o5]
	nop
	set	0x1A, %i0
	sth	%l6,	[%l7 + %i0]
	st	%f27,	[%l7 + 0x70]
	nop
	set	0x30, %o1
	std	%i2,	[%l7 + %o1]
	set	0x78, %i7
	ldxa	[%l7 + %i7] 0x80,	%l1
	nop
	set	0x7B, %l6
	ldub	[%l7 + %l6],	%o4
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x64, %l1
	lda	[%l7 + %l1] 0x89,	%f6
	nop
	set	0x38, %l5
	lduw	[%l7 + %l5],	%l5
	nop
	set	0x59, %i5
	ldstub	[%l7 + %i5],	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f0
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%o0
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x89,	%o1
	st	%fsr,	[%l7 + 0x48]
	add	%i3,	%i4,	%l0
	nop
	set	0x57, %l4
	ldstub	[%l7 + %l4],	%i5
	nop
	set	0x66, %l3
	ldsh	[%l7 + %l3],	%g5
	fpsub32	%f24,	%f28,	%f18
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x89,	%g1
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x88
	nop
	set	0x40, %i6
	ldub	[%l7 + %i6],	%o2
	and	%g4,	%g6,	%o6
	set	0x5C, %g7
	sta	%f12,	[%l7 + %g7] 0x88
	set	0x3F, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i1
	wr	%l3,	%g2,	%set_softint
	nop
	set	0x56, %g1
	lduh	[%l7 + %g1],	%o3
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x44, %g5
	swap	[%l7 + %g5],	%l4
	nop
	set	0x16, %o2
	ldsh	[%l7 + %o2],	%o7
	add	%i0,	%g3,	%g7
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x48, %o6
	prefetch	[%l7 + %o6],	 4
	fpadd32s	%f12,	%f5,	%f0
	nop
	set	0x60, %l2
	std	%f22,	[%l7 + %l2]
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	nop
	set	0x60, %g3
	std	%i2,	[%l7 + %g3]
	nop
	set	0x18, %i3
	ldub	[%l7 + %i3],	%l1
	ld	[%l7 + 0x70],	%f29
	nop
	set	0x4E, %o5
	lduh	[%l7 + %o5],	%o4
	nop
	set	0x20, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x64]
	add	%l5,	%l2,	%i7
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	add	%i6,	%o1,	%o0
	and	%i3,	%l0,	%i4
	add	%g5,	%i5,	%g1
	st	%f29,	[%l7 + 0x5C]
	or	%o2,	%g6,	%g4
	ld	[%l7 + 0x20],	%f27
	nop
	set	0x38, %o1
	stx	%o6,	[%l7 + %o1]
	set	0x48, %l6
	stwa	%l3,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x21, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x3F, %l1
	ldsb	[%l7 + %l1],	%g2
	nop
	set	0x1A, %l5
	stb	%l4,	[%l7 + %l5]
	nop
	set	0x28, %i5
	prefetch	[%l7 + %i5],	 4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x0D, %i7
	ldstub	[%l7 + %i7],	%o3
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x88,	 3
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f20
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x34, %l3
	stha	%o7,	[%l7 + %l3] 0x81
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%o5
	nop
	set	0x34, %i2
	swap	[%l7 + %i2],	%l6
	nop
	set	0x29, %o7
	ldsb	[%l7 + %o7],	%g3
	wr	%l1,	%o4,	%y
	set	0x66, %o0
	stba	%l5,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x5A, %g7
	sth	%i2,	[%l7 + %g7]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i6
	nop
	set	0x2E, %g2
	lduh	[%l7 + %g2],	%i7
	nop
	set	0x30, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x80,	%o1
	nop
	set	0x68, %g5
	std	%f8,	[%l7 + %g5]
	set	0x78, %o2
	stba	%o0,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x7C, %g1
	stb	%l0,	[%l7 + %g1]
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x80,	%i3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x4C, %g3
	ldstub	[%l7 + %g3],	%i5
	and	%o2,	%g1,	%g4
	nop
	set	0x14, %i3
	sth	%g6,	[%l7 + %i3]
	set	0x54, %o5
	lda	[%l7 + %o5] 0x80,	%f25
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f8
	and	%o6,	%i1,	%g2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o3
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%l3
	set	0x63, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i0
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x88
	nop
	set	0x46, %l6
	stb	%o7,	[%l7 + %l6]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xea,	%o4
	set	0x08, %l5
	lda	[%l7 + %l5] 0x89,	%f18
	fpsub16	%f8,	%f22,	%f16
	nop
	set	0x20, %i5
	ldsw	[%l7 + %i5],	%l6
	and	%g7,	%g3,	%o4
	nop
	set	0x09, %i7
	ldub	[%l7 + %i7],	%l1
	set	0x56, %o3
	stha	%i2,	[%l7 + %o3] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x1C, %i4
	stw	%l5,	[%l7 + %i4]
	or	%l2,	%i7,	%o1
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f8
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%o0
	nop
	set	0x2C, %l4
	stw	%i6,	[%l7 + %l4]
	st	%f4,	[%l7 + 0x48]
	nop
	set	0x18, %i2
	swap	[%l7 + %i2],	%l0
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x80,	%i3
	nop
	set	0x7A, %g7
	lduh	[%l7 + %g7],	%i4
	set	0x48, %g2
	sta	%f18,	[%l7 + %g2] 0x88
	nop
	set	0x30, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%i5
	nop
	set	0x15, %g5
	ldub	[%l7 + %g5],	%g5
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xe3,	%g0
	nop
	set	0x70, %g1
	std	%o2,	[%l7 + %g1]
	set	0x78, %o6
	stda	%g6,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x22, %g6
	stha	%g4,	[%l7 + %g6] 0x89
	or	%i1,	%g2,	%l4
	set	0x10, %l2
	ldda	[%l7 + %l2] 0xeb,	%o2
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f16
	nop
	set	0x2C, %l0
	lduh	[%l7 + %l0],	%o6
	set	0x4E, %i3
	stba	%l3,	[%l7 + %i3] 0x80
	fpadd32	%f30,	%f12,	%f2
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x88,	%o7
	and	%o5,	%i0,	%l6
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x88,	 3
	set	0x10, %i1
	ldda	[%l7 + %i1] 0xea,	%o4
	nop
	set	0x1C, %i0
	ldsh	[%l7 + %i0],	%l1
	set	0x70, %o1
	stxa	%g3,	[%l7 + %o1] 0xea
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%l5
	wr	%l2,	%i7,	%y
	nop
	set	0x20, %l1
	stb	%o0,	[%l7 + %l1]
	and	%o1,	%i6,	%i3
	set	0x58, %l6
	stxa	%i4,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x54, %l5
	sth	%l0,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x6C, %o3
	ldsw	[%l7 + %o3],	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%o2
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x18, %i5
	stxa	%g1,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x5F, %l3
	stba	%g4,	[%l7 + %l3] 0x80
	nop
	set	0x30, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x71, %l4
	ldub	[%l7 + %l4],	%g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%l4
	nop
	set	0x18, %i2
	stw	%i1,	[%l7 + %i2]
	nop
	set	0x08, %o7
	ldsb	[%l7 + %o7],	%o6
	fpadd16	%f6,	%f6,	%f26
	wr	%o3,	%l3,	%softint
	or	%o7,	%o5,	%i0
	set	0x7A, %g2
	stha	%g7,	[%l7 + %g2] 0x88
	ld	[%l7 + 0x2C],	%f12
	nop
	set	0x74, %i6
	ldstub	[%l7 + %i6],	%o4
	nop
	set	0x63, %o0
	ldsb	[%l7 + %o0],	%l1
	set	0x60, %g5
	stxa	%l6,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x50, %g7
	swapa	[%l7 + %g7] 0x88,	%g3
	nop
	set	0x43, %g1
	ldstub	[%l7 + %g1],	%l5
	nop
	set	0x24, %o2
	ldsh	[%l7 + %o2],	%i2
	nop
	set	0x1C, %o6
	lduh	[%l7 + %o6],	%i7
	nop
	set	0x56, %g6
	ldsh	[%l7 + %g6],	%o0
	nop
	set	0x1A, %l2
	ldstub	[%l7 + %l2],	%l2
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x18, %g3
	ldsw	[%l7 + %g3],	%i6
	add	%o1,	%i3,	%i4
	set	0x28, %l0
	stba	%i5,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x78, %i3
	stwa	%g5,	[%l7 + %i3] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g6
	ld	[%l7 + 0x48],	%f20
	nop
	set	0x10, %g4
	prefetch	[%l7 + %g4],	 4
	set	0x48, %i1
	stha	%g2,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x8D661945CE96DB0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5D7BFEC37453ED27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f18,	%f30
	set	0x35, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l4
	set	0x78, %o1
	swapa	[%l7 + %o1] 0x80,	%i1
	nop
	set	0x20, %i0
	swap	[%l7 + %i0],	%o6
	nop
	set	0x58, %l6
	ldstub	[%l7 + %l6],	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%l3
	nop
	set	0x1B, %l5
	ldub	[%l7 + %l5],	%o5
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%f30
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	set	0x2F, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g7
	set	0x38, %o3
	lda	[%l7 + %o3] 0x88,	%f5
	set	0x40, %i5
	stwa	%o4,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%o7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%l6
	nop
	set	0x1A, %l4
	ldub	[%l7 + %l4],	%g3
	add	%l5,	%i2,	%o0
	set	0x5C, %o7
	swapa	[%l7 + %o7] 0x88,	%i7
	nop
	set	0x29, %g2
	stb	%i6,	[%l7 + %g2]
	nop
	set	0x18, %i2
	ldx	[%l7 + %i2],	%l2
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x81,	%o1
	set	0x5E, %i6
	stba	%i4,	[%l7 + %i6] 0x89
	or	%i5,	%g5,	%i3
	set	0x38, %g5
	stda	%l0,	[%l7 + %g5] 0x88
	set	0x1E, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g1
	set	0x10, %o2
	stxa	%o2,	[%l7 + %o2] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%g2
	ld	[%l7 + 0x20],	%f5
	set	0x08, %g1
	stwa	%i1,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x5C, %o6
	sth	%o6,	[%l7 + %o6]
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xd8
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%g4
	set	0x1A, %g6
	stha	%l3,	[%l7 + %g6] 0x89
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%l4
	st	%f11,	[%l7 + 0x34]
	nop
	set	0x0C, %g3
	sth	%g7,	[%l7 + %g3]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%o7
	set	0x6E, %i3
	stba	%l1,	[%l7 + %i3] 0x89
	and	%o4,	%g3,	%l6
	nop
	set	0x1E, %g4
	sth	%l5,	[%l7 + %g4]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	st	%fsr,	[%l7 + 0x38]
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	set	0x59, %o1
	stba	%o0,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x4F, %o5
	stb	%i6,	[%l7 + %o5]
	nop
	set	0x22, %i0
	ldstub	[%l7 + %i0],	%l2
	set	0x0C, %l6
	lda	[%l7 + %l6] 0x80,	%f9
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%i7
	and	%i4,	%g5,	%i5
	nop
	set	0x58, %i7
	ldsb	[%l7 + %i7],	%l0
	nop
	set	0x23, %l5
	ldub	[%l7 + %l5],	%i3
	nop
	set	0x42, %l1
	lduh	[%l7 + %l1],	%o2
	nop
	set	0x70, %i4
	lduh	[%l7 + %i4],	%g1
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x89,	%f22
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%g6
	set	0x58, %i5
	lda	[%l7 + %i5] 0x89,	%f22
	or	%i1,	%o6,	%o3
	fpsub16s	%f29,	%f30,	%f5
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x80,	 2
	st	%f31,	[%l7 + 0x1C]
	set	0x70, %o4
	stha	%l3,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f20
	set	0x14, %i2
	lda	[%l7 + %i2] 0x81,	%f30
	nop
	set	0x68, %g2
	lduw	[%l7 + %g2],	%g4
	nop
	set	0x1D, %i6
	stb	%l4,	[%l7 + %i6]
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc0
	nop
	set	0x28, %o2
	stx	%o5,	[%l7 + %o2]
	add	%g7,	%o7,	%l1
	nop
	set	0x20, %g1
	sth	%o4,	[%l7 + %g1]
	nop
	set	0x30, %o6
	swap	[%l7 + %o6],	%i0
	nop
	set	0x3C, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x4C, %g3
	swapa	[%l7 + %g3] 0x88,	%l6
	set	0x34, %l2
	stwa	%i2,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x64],	%f22
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xe2,	%o0
	nop
	set	0x10, %g4
	prefetch	[%l7 + %g4],	 3
	fpadd16s	%f27,	%f31,	%f24
	nop
	nop
	setx	0xCB6F810462D61777,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3D69C4481EFFDEE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f22
	nop
	set	0x28, %i1
	stx	%i6,	[%l7 + %i1]
	set	0x50, %o1
	swapa	[%l7 + %o1] 0x81,	%l2
	set	0x70, %o5
	stda	%l4,	[%l7 + %o5] 0x88
	nop
	set	0x0C, %l0
	swap	[%l7 + %l0],	%i7
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%o0
	nop
	set	0x50, %i7
	std	%f8,	[%l7 + %i7]
	set	0x08, %i0
	sta	%f11,	[%l7 + %i0] 0x81
	set	0x45, %l1
	ldstuba	[%l7 + %l1] 0x81,	%g5
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%i4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x12, %o3
	ldstub	[%l7 + %o3],	%l0
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x81,	%i5
	nop
	set	0x66, %l4
	lduh	[%l7 + %l4],	%o2
	nop
	set	0x28, %o7
	std	%f0,	[%l7 + %o7]
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x81,	%i2
	nop
	set	0x5A, %g2
	ldub	[%l7 + %g2],	%g1
	and	%i1,	%g6,	%o3
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	set	0x23, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o6
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x89,	%g4
	st	%f30,	[%l7 + 0x18]
	and	%l4,	%l3,	%g7
	set	0x33, %o2
	ldstuba	[%l7 + %o2] 0x81,	%o7
	nop
	set	0x10, %g5
	std	%f22,	[%l7 + %g5]
	nop
	set	0x5A, %o6
	stb	%o5,	[%l7 + %o6]
	set	0x58, %g1
	stwa	%l1,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x64, %g6
	stwa	%o4,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x78, %o0
	stda	%g2,	[%l7 + %o0] 0x88
	nop
	set	0x50, %g3
	std	%i6,	[%l7 + %g3]
	and	%i2,	%i0,	%o0
	nop
	set	0x30, %l2
	std	%i6,	[%l7 + %l2]
	set	0x1C, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l2
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x44, %i1
	prefetch	[%l7 + %i1],	 3
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x80,	%o0
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%g5
	ld	[%l7 + 0x3C],	%f6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf9
	membar	#Sync
	or	%i4,	%l0,	%i5
	st	%f25,	[%l7 + 0x24]
	set	0x74, %l6
	stha	%l5,	[%l7 + %l6] 0x80
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%o2
	ld	[%l7 + 0x54],	%f0
	add	%i3,	%i1,	%g1
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x88,	%o3
	nop
	set	0x60, %l1
	lduh	[%l7 + %l1],	%g6
	nop
	set	0x10, %o3
	prefetch	[%l7 + %o3],	 1
	st	%f18,	[%l7 + 0x74]
	set	0x48, %l5
	stwa	%g2,	[%l7 + %l5] 0x88
	nop
	nop
	setx	0xA82FC141801D901A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x7432DB1CF0FCCD82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f0,	%f16
	nop
	set	0x22, %i5
	ldstub	[%l7 + %i5],	%g4
	nop
	set	0x60, %l4
	swap	[%l7 + %l4],	%o6
	or	%l4,	%l3,	%o7
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%g3
	nop
	set	0x26, %i2
	stb	%l6,	[%l7 + %i2]
	st	%f13,	[%l7 + 0x40]
	nop
	set	0x2A, %l3
	lduh	[%l7 + %l3],	%i2
	and	%l1,	%i0,	%i6
	wr	%l2,	%o0,	%set_softint
	nop
	set	0x60, %g2
	std	%o0,	[%l7 + %g2]
	nop
	set	0x4C, %o4
	stw	%g5,	[%l7 + %o4]
	fpsub32	%f0,	%f18,	%f28
	nop
	set	0x18, %i6
	lduw	[%l7 + %i6],	%i4
	nop
	set	0x40, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x68, %g5
	stwa	%l0,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x12, %o6
	stb	%l5,	[%l7 + %o6]
	nop
	set	0x38, %g1
	stx	%i5,	[%l7 + %g1]
	add	%o2,	%i3,	%i1
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%o3
	ld	[%l7 + 0x5C],	%f6
	set	0x4A, %g6
	stha	%g1,	[%l7 + %g6] 0x89
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%g6
	nop
	set	0x4B, %g3
	ldub	[%l7 + %g3],	%g4
	nop
	set	0x41, %g4
	ldstub	[%l7 + %g4],	%o6
	nop
	set	0x50, %i3
	stx	%g2,	[%l7 + %i3]
	nop
	set	0x37, %i1
	ldstub	[%l7 + %i1],	%l3
	nop
	set	0x58, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x3C, %o5
	stw	%l4,	[%l7 + %o5]
	nop
	set	0x6E, %o1
	lduh	[%l7 + %o1],	%o7
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%g6
	nop
	set	0x41, %i7
	stb	%o5,	[%l7 + %i7]
	nop
	set	0x34, %i4
	swap	[%l7 + %i4],	%o4
	ld	[%l7 + 0x1C],	%f7
	nop
	set	0x60, %l1
	std	%f28,	[%l7 + %l1]
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f8
	nop
	set	0x68, %l5
	ldsh	[%l7 + %l5],	%g3
	add	%i2,	%l6,	%l1
	bgu,a,pn	%icc,	loop_198
	nop
	set	0x3E, %i5
	sth	%i0,	[%l7 + %i5]
	or	%l2,	%i6,	%o1
	nop
	set	0x18, %l4
	stx	%o0,	[%l7 + %l4]
loop_198:
	add	%i4,	%i7,	%l0
	add	%g5,	%l5,	%i5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f0
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x89,	%o2
	nop
	set	0x48, %l3
	stw	%i1,	[%l7 + %l3]
	nop
	set	0x2C, %g2
	stw	%o3,	[%l7 + %g2]
	nop
	set	0x48, %o7
	stw	%i3,	[%l7 + %o7]
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x81,	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o6
	set	0x65, %o2
	ldstuba	[%l7 + %o2] 0x88,	%g6
	and	%l3,	%l4,	%o7
	add	%g7,	%g2,	%o4
	st	%fsr,	[%l7 + 0x24]
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x88,	%g3
	nop
	set	0x58, %g5
	swap	[%l7 + %g5],	%i2
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xea,	%i6
	nop
	set	0x2A, %o6
	ldsh	[%l7 + %o6],	%o5
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%l1
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%l2
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	or	%o0,	%o1,	%i7
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%l0
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x88,	%i4
	set	0x28, %i1
	sta	%f17,	[%l7 + %i1] 0x89
	nop
	set	0x2C, %l2
	lduw	[%l7 + %l2],	%l5
	nop
	set	0x54, %o0
	stw	%i5,	[%l7 + %o0]
	nop
	set	0x50, %l0
	std	%o2,	[%l7 + %l0]
	nop
	set	0x08, %o1
	std	%f14,	[%l7 + %o1]
	set	0x53, %l6
	stba	%i1,	[%l7 + %l6] 0x88
	bne,a	%icc,	loop_199
	st	%f9,	[%l7 + 0x4C]
	nop
	set	0x0C, %o5
	stw	%g5,	[%l7 + %o5]
	nop
	set	0x48, %i4
	std	%o2,	[%l7 + %i4]
loop_199:
	nop
	set	0x33, %i7
	stb	%i3,	[%l7 + %i7]
	nop
	set	0x31, %o3
	stb	%g1,	[%l7 + %o3]
	nop
	set	0x6E, %l1
	lduh	[%l7 + %l1],	%o6
	set	0x44, %l5
	stba	%g4,	[%l7 + %l5] 0x81
	ld	[%l7 + 0x38],	%f29
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x81,	%l3
	nop
	set	0x53, %i0
	stb	%l4,	[%l7 + %i0]
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%g6
	nop
	set	0x50, %l3
	stx	%g7,	[%l7 + %l3]
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f22
	set	0x7B, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g3
	or	%i2,	%l6,	%g2
	nop
	set	0x0E, %o4
	sth	%o5,	[%l7 + %o4]
	nop
	set	0x24, %i2
	ldsw	[%l7 + %i2],	%i0
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%o0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%o1
	nop
	set	0x74, %i6
	swap	[%l7 + %i6],	%i7
	st	%fsr,	[%l7 + 0x5C]
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x88,	%l0
	nop
	set	0x5E, %o6
	stb	%l5,	[%l7 + %o6]
	nop
	set	0x70, %g1
	std	%i4,	[%l7 + %g1]
	and	%i5,	%i1,	%g5
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	and	%o3,	%o2,	%i3
	and	%g1,	%g4,	%l3
	set	0x4C, %g3
	swapa	[%l7 + %g3] 0x81,	%l4
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%g6
	nop
	set	0x28, %i3
	ldstub	[%l7 + %i3],	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF65, 	%sys_tick_cmpr
	st	%fsr,	[%l7 + 0x6C]
	set	0x10, %i1
	lda	[%l7 + %i1] 0x80,	%f11
	nop
	set	0x78, %o0
	std	%o6,	[%l7 + %o0]
	ld	[%l7 + 0x34],	%f17
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f16
	nop
	set	0x34, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	and	%i2,	%l6,	%g2
	nop
	set	0x3C, %o5
	ldstub	[%l7 + %o5],	%g3
	wr 	%g0, 	0x6, 	%fprs
	set	0x58, %o1
	stxa	%o5,	[%l7 + %o1] 0x89
	nop
	set	0x6D, %i7
	ldstub	[%l7 + %i7],	%i6
	nop
	set	0x30, %o3
	stb	%l2,	[%l7 + %o3]
	set	0x57, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o0
	nop
	set	0x60, %i4
	lduh	[%l7 + %i4],	%o1
	set	0x48, %l4
	stxa	%l0,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x2A, %i0
	ldsb	[%l7 + %i0],	%l5
	st	%f13,	[%l7 + 0x78]
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%i7
	nop
	set	0x70, %i5
	ldsw	[%l7 + %i5],	%i4
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i4
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x80,	%i0
	add	%o3,	%o2,	%i3
	set	0x16, %l3
	ldstuba	[%l7 + %l3] 0x80,	%g1
	nop
	set	0x2A, %i2
	lduh	[%l7 + %i2],	%g4
	st	%f4,	[%l7 + 0x20]
	fpadd32s	%f9,	%f19,	%f1
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x88,	 1
	ba,a,pt	%icc,	loop_200
	add	%l4,	%l3,	%g6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xe2,	%g6
loop_200:
	add	%o7,	%o4,	%i2
	nop
	set	0x6C, %g5
	ldsw	[%l7 + %g5],	%l6
	set	0x20, %o2
	stwa	%g2,	[%l7 + %o2] 0x81
	set	0x30, %o6
	stda	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	bne	%icc,	loop_201
	nop
	set	0x20, %g7
	swap	[%l7 + %g7],	%i0
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%o6
	set	0x19, %g3
	ldstuba	[%l7 + %g3] 0x89,	%o5
loop_201:
	nop
	set	0x1E, %g6
	stha	%i6,	[%l7 + %g6] 0x80
	set	0x50, %g4
	stwa	%l1,	[%l7 + %g4] 0x89
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f0
	set	0x78, %i3
	stxa	%o0,	[%l7 + %i3] 0xe2
	membar	#Sync
	bge,pn	%icc,	loop_202
	and	%o1,	%l2,	%l0
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x80,	%l4
loop_202:
	st	%fsr,	[%l7 + 0x10]
	wr 	%g0, 	0x6, 	%fprs
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x89,	%i4
	set	0x34, %l6
	stwa	%i1,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x50, %l2
	ldsw	[%l7 + %l2],	%o2
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	set	0x2C, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x46, %i4
	lduh	[%l7 + %i4],	%g1
	set	0x30, %l4
	sta	%f15,	[%l7 + %l4] 0x89
	set	0x54, %i0
	stwa	%g4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f26
	nop
	set	0x62, %i5
	ldsh	[%l7 + %i5],	%l4
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x81,	%g5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f0
	nop
	set	0x6E, %o7
	ldstub	[%l7 + %o7],	%l3
	set	0x60, %i2
	ldda	[%l7 + %i2] 0x88,	%g6
	nop
	set	0x08, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x16, %g5
	stha	%o7,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x72, %o2
	ldsh	[%l7 + %o2],	%g6
	set	0x28, %i6
	stda	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xe3,	%i6
	fpadd32s	%f10,	%f21,	%f22
	nop
	set	0x36, %g7
	lduh	[%l7 + %g7],	%g2
	fpadd32	%f30,	%f26,	%f14
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f8
	ld	[%l7 + 0x2C],	%f23
	nop
	set	0x5B, %g1
	ldub	[%l7 + %g1],	%g3
	or	%i0,	%o6,	%o4
	nop
	set	0x3C, %g6
	swap	[%l7 + %g6],	%o5
	nop
	set	0x08, %g4
	std	%l0,	[%l7 + %g4]
	set	0x62, %i1
	stba	%o0,	[%l7 + %i1] 0x81
	nop
	set	0x10, %l0
	std	%i6,	[%l7 + %l0]
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x10, %l6
	std	%o0,	[%l7 + %l6]
	nop
	set	0x2A, %o0
	sth	%l0,	[%l7 + %o0]
	set	0x6C, %o5
	lda	[%l7 + %o5] 0x81,	%f4
	ble,a,pn	%xcc,	loop_203
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%l5
	nop
	set	0x78, %i7
	swap	[%l7 + %i7],	%i5
	nop
	set	0x7C, %o1
	prefetch	[%l7 + %o1],	 4
loop_203:
	nop
	set	0x68, %o3
	stxa	%i7,	[%l7 + %o3] 0xeb
	membar	#Sync
	fpsub32s	%f2,	%f20,	%f15
	nop
	set	0x3C, %i4
	swap	[%l7 + %i4],	%i1
	wr	%i4,	%o3,	%set_softint
	bgu	%icc,	loop_204
	add	%o2,	%i3,	%g1
	nop
	set	0x28, %l4
	lduh	[%l7 + %l4],	%l4
	ld	[%l7 + 0x2C],	%f3
loop_204:
	nop
	set	0x39, %l1
	ldsb	[%l7 + %l1],	%g5
	nop
	set	0x2F, %i0
	ldstub	[%l7 + %i0],	%g4
	set	0x26, %l5
	stha	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x7C, %g2
	lduw	[%l7 + %g2],	%l3
	nop
	set	0x2C, %i5
	ldstub	[%l7 + %i5],	%g6
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f4
	nop
	set	0x78, %l3
	swap	[%l7 + %l3],	%o7
	and	%l6,	%g2,	%g3
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x80,	 2
	nop
	set	0x40, %g5
	stb	%o6,	[%l7 + %g5]
	or	%o4,	%i2,	%l1
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%o5
	nop
	set	0x74, %o4
	lduh	[%l7 + %o4],	%o0
	nop
	nop
	setx	0xFCA44296A17019E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xEC04D931BAF2817E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f2,	%f8
	set	0x1F, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i6
	set	0x30, %g7
	stxa	%l2,	[%l7 + %g7] 0xea
	membar	#Sync
	bn	%xcc,	loop_205
	ld	[%l7 + 0x38],	%f15
	set	0x40, %i6
	stda	%o0,	[%l7 + %i6] 0x89
loop_205:
	ld	[%l7 + 0x70],	%f24
	nop
	set	0x20, %g1
	sth	%l0,	[%l7 + %g1]
	nop
	set	0x57, %g3
	stb	%l5,	[%l7 + %g3]
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	or	%i7,	%i5,	%i4
	nop
	set	0x70, %i1
	std	%o2,	[%l7 + %i1]
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xe2,	%i0
	nop
	set	0x42, %i3
	stb	%i3,	[%l7 + %i3]
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x88,	%g1
	add	%l4,	%o2,	%g5
	nop
	set	0x60, %o0
	std	%g4,	[%l7 + %o0]
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%f16,	[%l7 + 0x30]
	nop
	set	0x58, %l2
	lduh	[%l7 + %l2],	%l3
	nop
	set	0x28, %i7
	ldsb	[%l7 + %i7],	%g7
	set	0x6C, %o1
	stha	%o7,	[%l7 + %o1] 0x81
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xea,	%g6
	ld	[%l7 + 0x2C],	%f21
	nop
	set	0x50, %i4
	std	%f12,	[%l7 + %i4]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f16
	nop
	set	0x18, %l4
	std	%i6,	[%l7 + %l4]
	nop
	set	0x7B, %l1
	stb	%g2,	[%l7 + %l1]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f16
	set	0x3C, %l5
	sta	%f14,	[%l7 + %l5] 0x88
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	set	0x68, %o7
	stda	%g2,	[%l7 + %o7] 0x80
	nop
	set	0x40, %i5
	stw	%i0,	[%l7 + %i5]
	nop
	set	0x38, %i2
	stx	%o4,	[%l7 + %i2]
	st	%f25,	[%l7 + 0x64]
	fpsub32s	%f19,	%f19,	%f7
	nop
	set	0x34, %g5
	stw	%i2,	[%l7 + %g5]
	fpadd32	%f8,	%f6,	%f12
	nop
	set	0x20, %o2
	stx	%o6,	[%l7 + %o2]
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xe2,	%l0
	nop
	set	0x14, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x18, %g7
	std	%o4,	[%l7 + %g7]
	fpadd32s	%f26,	%f8,	%f19
	st	%f25,	[%l7 + 0x24]
	and	%i6,	%l2,	%o0
	set	0x28, %i6
	stwa	%o1,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xeb,	%l4
	nop
	set	0x7C, %g4
	sth	%l0,	[%l7 + %g4]
	set	0x1C, %i1
	sta	%f14,	[%l7 + %i1] 0x81
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i5
	nop
	set	0x6C, %i3
	swap	[%l7 + %i3],	%i4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x88
	nop
	set	0x38, %l6
	std	%i6,	[%l7 + %l6]
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x80,	%i1
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x88,	%o2
	nop
	set	0x42, %i7
	ldsh	[%l7 + %i7],	%i3
	nop
	set	0x70, %o1
	sth	%g1,	[%l7 + %o1]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f20
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%g5
	st	%fsr,	[%l7 + 0x44]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g4
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	nop
	set	0x10, %l4
	ldsw	[%l7 + %l4],	%o7
	or	%g6,	%l6,	%l3
	nop
	set	0x3B, %l1
	stb	%g2,	[%l7 + %l1]
	nop
	set	0x7C, %i0
	swap	[%l7 + %i0],	%g3
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xe3,	%i0
	nop
	set	0x28, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%i2
	nop
	set	0x2B, %i5
	ldstub	[%l7 + %i5],	%o4
	nop
	set	0x78, %o7
	stx	%l1,	[%l7 + %o7]
	nop
	set	0x1C, %i2
	stw	%o5,	[%l7 + %i2]
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x81,	%o6
	st	%f29,	[%l7 + 0x64]
	set	0x30, %l3
	lda	[%l7 + %l3] 0x81,	%f27
	nop
	set	0x68, %o4
	stx	%l2,	[%l7 + %o4]
	and	%o0,	%i6,	%l5
	nop
	set	0x78, %o6
	stx	%o1,	[%l7 + %o6]
	nop
	set	0x74, %g7
	sth	%l0,	[%l7 + %g7]
	nop
	set	0x6D, %i6
	ldub	[%l7 + %i6],	%i4
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x2B, %g4
	ldsb	[%l7 + %g4],	%i5
	ld	[%l7 + 0x6C],	%f5
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f16
	nop
	set	0x50, %l0
	ldsw	[%l7 + %l0],	%i1
	set	0x70, %i3
	stba	%o3,	[%l7 + %i3] 0x81
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x88
	or	%i3,	%i7,	%o2
	nop
	set	0x48, %l6
	stx	%g1,	[%l7 + %l6]
	set	0x24, %g3
	lda	[%l7 + %g3] 0x89,	%f28
	nop
	set	0x68, %o0
	swap	[%l7 + %o0],	%l4
	or	%g4,	%g5,	%g7
	nop
	set	0x27, %g6
	ldsb	[%l7 + %g6],	%g6
	nop
	set	0x58, %o1
	sth	%o7,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x48]
	fpsub32	%f22,	%f28,	%f0
	set	0x68, %i7
	stxa	%l3,	[%l7 + %i7] 0x89
	set	0x34, %o3
	stha	%l6,	[%l7 + %o3] 0x89
	ld	[%l7 + 0x20],	%f30
	bge,pn	%icc,	loop_206
	or	%g3,	%i0,	%i2
	nop
	set	0x7D, %i4
	ldub	[%l7 + %i4],	%o4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f0
loop_206:
	add	%l1,	%o5,	%o6
	nop
	set	0x1C, %l1
	lduw	[%l7 + %l1],	%l2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%g2
	nop
	set	0x10, %o5
	std	%f30,	[%l7 + %o5]
	nop
	set	0x18, %i0
	stb	%i6,	[%l7 + %i0]
	nop
	set	0x68, %l5
	stw	%l5,	[%l7 + %l5]
	nop
	set	0x18, %i5
	sth	%o1,	[%l7 + %i5]
	add	%i4,	%l0,	%i5
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x3C, %o7
	stw	%i1,	[%l7 + %o7]
	nop
	set	0x26, %i2
	stb	%o3,	[%l7 + %i2]
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%i7
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x54, %o4
	sth	%i3,	[%l7 + %o4]
	set	0x58, %l3
	stda	%o2,	[%l7 + %l3] 0x80
	nop
	set	0x10, %g7
	std	%f4,	[%l7 + %g7]
	bg,a	%xcc,	loop_207
	nop
	set	0x1C, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x4E, %g1
	lduh	[%l7 + %g1],	%l4
loop_207:
	nop
	set	0x28, %g4
	swapa	[%l7 + %g4] 0x81,	%g4
	set	0x66, %l0
	ldstuba	[%l7 + %l0] 0x88,	%g5
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f0
	nop
	set	0x71, %i3
	ldub	[%l7 + %i3],	%g1
	or	%g7,	%o7,	%g6
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%l6
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x81,	%l3
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	or	%i0,	%i2,	%o4
	or	%l1,	%o5,	%g3
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x88,	%f21
	nop
	set	0x16, %o0
	lduh	[%l7 + %o0],	%l2
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o0
	set	0x10, %o3
	lda	[%l7 + %o3] 0x81,	%f2
	nop
	set	0x48, %i4
	lduw	[%l7 + %i4],	%g2
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f0
	nop
	set	0x28, %l1
	std	%f14,	[%l7 + %l1]
	nop
	set	0x18, %l2
	ldsh	[%l7 + %l2],	%i6
	nop
	set	0x30, %i7
	lduh	[%l7 + %i7],	%o6
	set	0x28, %o5
	stda	%l4,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x5C, %i0
	lduh	[%l7 + %i0],	%o1
	nop
	set	0x08, %i5
	stw	%l0,	[%l7 + %i5]
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x80,	%i4
	nop
	set	0x54, %g2
	lduh	[%l7 + %g2],	%i1
	set	0x32, %o7
	stba	%i5,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x0A, %o2
	stha	%o3,	[%l7 + %o2] 0x80
	nop
	set	0x27, %o4
	stb	%i7,	[%l7 + %o4]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	set	0x3C, %l3
	stba	%o2,	[%l7 + %l3] 0x81
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%i2
	nop
	set	0x56, %g7
	ldsh	[%l7 + %g7],	%l4
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x81,	%g5
	wr	%g1,	%g7,	%clear_softint
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x88,	%f5
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x22, %i6
	lduh	[%l7 + %i6],	%o7
	nop
	set	0x56, %g5
	ldsh	[%l7 + %g5],	%g6
	set	0x6A, %i1
	stha	%g4,	[%l7 + %i1] 0x80
	nop
	set	0x18, %i3
	std	%l2,	[%l7 + %i3]
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x89,	 3
	nop
	set	0x48, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o4
	set	0x40, %g6
	lda	[%l7 + %g6] 0x89,	%f3
	set	0x60, %o0
	stwa	%l6,	[%l7 + %o0] 0x88
	and	%o5,	%g3,	%l1
	or	%l2,	%o0,	%i6
	set	0x38, %o1
	sta	%f19,	[%l7 + %o1] 0x89
	nop
	set	0x44, %o3
	lduh	[%l7 + %o3],	%o6
	nop
	set	0x35, %l4
	stb	%l5,	[%l7 + %l4]
	set	0x4C, %l1
	sta	%f5,	[%l7 + %l1] 0x81
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f14
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%g2
	nop
	set	0x68, %o5
	std	%l0,	[%l7 + %o5]
	set	0x08, %i7
	stha	%i4,	[%l7 + %i7] 0x89
	set	0x68, %i5
	stha	%o1,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o3
	fpsub32s	%f27,	%f8,	%f3
	nop
	set	0x76, %i0
	ldsh	[%l7 + %i0],	%i5
	nop
	set	0x50, %l5
	prefetch	[%l7 + %l5],	 4
	set	0x14, %o7
	lda	[%l7 + %o7] 0x80,	%f15
	ld	[%l7 + 0x3C],	%f5
	nop
	set	0x56, %g2
	ldub	[%l7 + %g2],	%o2
	and	%i7,	%i3,	%g5
	nop
	set	0x3C, %o2
	swap	[%l7 + %o2],	%g1
	or	%g7,	%o7,	%l4
	nop
	nop
	setx	0xC1CACC9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xE2EC5D8C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f20,	%f13
	or	%g6,	%l3,	%i0
	nop
	set	0x22, %i2
	stb	%g4,	[%l7 + %i2]
	set	0x6E, %l3
	stha	%i2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x1A, %o4
	lduh	[%l7 + %o4],	%o4
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%l6
	set	0x42, %o6
	stha	%g3,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x58, %g4
	stda	%l0,	[%l7 + %g4] 0x80
	and	%l2,	%o0,	%o5
	and	%o6,	%i6,	%l5
	add	%g2,	%i4,	%o1
	nop
	set	0x6B, %g1
	ldstub	[%l7 + %g1],	%i1
	fpsub32s	%f21,	%f10,	%f29
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd8
	nop
	set	0x6E, %g5
	stb	%l0,	[%l7 + %g5]
	add	%i5,	%o2,	%i7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	nop
	set	0x19, %g3
	stb	%i3,	[%l7 + %g3]
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x89,	%g5
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%g0
	set	0x6F, %o0
	stba	%o3,	[%l7 + %o0] 0x89
	set	0x58, %l6
	stwa	%g7,	[%l7 + %l6] 0x80
	nop
	set	0x40, %o3
	ldx	[%l7 + %o3],	%o7
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%i0
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x81,	%g4
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f20
	nop
	set	0x48, %i4
	std	%f30,	[%l7 + %i4]
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x89,	 1
	st	%f3,	[%l7 + 0x64]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	nop
	nop
	setx	0x0D689E086C55F4C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x2172D96B2CBA6D3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f12
	and	%i2,	%o4,	%g3
	set	0x60, %i5
	stda	%l0,	[%l7 + %i5] 0x89
	set	0x64, %i0
	swapa	[%l7 + %i0] 0x88,	%l2
	add	%o0,	%l6,	%o6
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc4
	or	%o5,	%i6,	%l5
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x89,	%g2
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%i4
	ld	[%l7 + 0x78],	%f21
	nop
	set	0x42, %g2
	lduh	[%l7 + %g2],	%o1
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 2
	fpadd32	%f12,	%f14,	%f14
	set	0x78, %l3
	stda	%l0,	[%l7 + %l3] 0x89
	nop
	set	0x1C, %g7
	ldsh	[%l7 + %g7],	%i1
	nop
	set	0x48, %o6
	std	%f16,	[%l7 + %o6]
	nop
	set	0x17, %g4
	stb	%i5,	[%l7 + %g4]
	ld	[%l7 + 0x70],	%f17
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f16
	nop
	set	0x48, %l0
	lduw	[%l7 + %l0],	%o2
	and	%i7,	%g5,	%i3
	nop
	set	0x15, %g5
	stb	%g1,	[%l7 + %g5]
	nop
	set	0x3C, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x4F, %i6
	stba	%g7,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x7C, %g3
	swapa	[%l7 + %g3] 0x81,	%o7
	nop
	set	0x5C, %g6
	sth	%o3,	[%l7 + %g6]
	and	%g6,	%i0,	%g4
	nop
	set	0x7E, %i1
	ldstub	[%l7 + %i1],	%l4
	nop
	set	0x26, %o0
	sth	%i2,	[%l7 + %o0]
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%l3
	nop
	set	0x56, %o1
	lduh	[%l7 + %o1],	%g3
	set	0x60, %l1
	stda	%o4,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x40, %o3
	std	%f8,	[%l7 + %o3]
	set	0x5C, %i4
	lda	[%l7 + %i4] 0x80,	%f10
	nop
	set	0x58, %l2
	std	%l0,	[%l7 + %l2]
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%o0
	nop
	set	0x68, %l4
	stx	%l6,	[%l7 + %l4]
	nop
	set	0x50, %i0
	std	%l2,	[%l7 + %i0]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%o5
	nop
	set	0x48, %i5
	stw	%l5,	[%l7 + %i5]
	set	0x4B, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i6
	and	%g2,	%i4,	%o1
	and	%i1,	%l0,	%i5
	or	%o2,	%g5,	%i7
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%g1
	set	0x40, %l5
	stwa	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	nop
	set	0x56, %o2
	stb	%i3,	[%l7 + %o2]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x89
	nop
	set	0x18, %l3
	ldsh	[%l7 + %l3],	%o3
	ld	[%l7 + 0x60],	%f15
	set	0x44, %g7
	lda	[%l7 + %g7] 0x81,	%f22
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f24
	nop
	set	0x6C, %g4
	stb	%o7,	[%l7 + %g4]
	set	0x68, %g1
	stxa	%i0,	[%l7 + %g1] 0x88
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x89,	 1
	nop
	set	0x3A, %g5
	lduh	[%l7 + %g5],	%g4
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x20, %i3
	std	%f18,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x74]
	set	0x30, %i6
	sta	%f21,	[%l7 + %i6] 0x88
	nop
	set	0x34, %g2
	swap	[%l7 + %g2],	%i2
	set	0x18, %g6
	stda	%l4,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xd2
	nop
	set	0x20, %g3
	std	%l2,	[%l7 + %g3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o4
	set	0x5B, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l1
	nop
	set	0x6C, %o0
	stw	%o0,	[%l7 + %o0]
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%l6
	nop
	set	0x38, %o1
	ldub	[%l7 + %o1],	%o5
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x5B, %l2
	ldstub	[%l7 + %l2],	%l5
	set	0x68, %i7
	ldxa	[%l7 + %i7] 0x80,	%g2
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%i4
	set	0x4C, %l4
	lda	[%l7 + %l4] 0x81,	%f4
	fpadd16s	%f15,	%f31,	%f8
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xe2,	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7DB, 	%tick_cmpr
	st	%f0,	[%l7 + 0x34]
	st	%f23,	[%l7 + 0x34]
	nop
	set	0x54, %o5
	sth	%g5,	[%l7 + %o5]
	nop
	set	0x14, %l5
	stw	%l0,	[%l7 + %l5]
	set	0x38, %i2
	swapa	[%l7 + %i2] 0x88,	%g1
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f0
	nop
	set	0x4B, %o4
	stb	%g7,	[%l7 + %o4]
	st	%f17,	[%l7 + 0x0C]
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x81,	%i7
	nop
	set	0x0F, %g7
	ldstub	[%l7 + %g7],	%o3
	set	0x48, %o7
	stxa	%i3,	[%l7 + %o7] 0xea
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%g6
	ld	[%l7 + 0x78],	%f13
	nop
	set	0x30, %g4
	std	%g4,	[%l7 + %g4]
	nop
	set	0x2C, %o6
	lduw	[%l7 + %o6],	%o7
	wr	%l4,	%i2,	%softint
	ld	[%l7 + 0x24],	%f31
	nop
	set	0x3A, %g1
	ldub	[%l7 + %g1],	%g3
	nop
	set	0x2B, %l0
	stb	%o4,	[%l7 + %l0]
	nop
	set	0x18, %i3
	swap	[%l7 + %i3],	%l3
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%o0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd0,	%f0
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xea,	%l2
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%l1
	add	%l6,	%o6,	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%l5
	and	%i4,	%o1,	%i6
	or	%i1,	%i5,	%g5
	nop
	set	0x74, %g3
	ldsh	[%l7 + %g3],	%l0
	nop
	set	0x1D, %l6
	ldstub	[%l7 + %l6],	%g1
	and	%o2,	%i7,	%g7
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%o3
	bne,a	%icc,	loop_208
	add	%i3,	%g6,	%i0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%g4
loop_208:
	nop
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xea,	%l4
	nop
	set	0x7C, %o0
	stw	%i2,	[%l7 + %o0]
	nop
	set	0x40, %o3
	std	%o4,	[%l7 + %o3]
	set	0x70, %o1
	lda	[%l7 + %o1] 0x88,	%f2
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%l2
	and	%o0,	%g3,	%l1
	nop
	set	0x60, %i7
	stw	%l2,	[%l7 + %i7]
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%o6
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xeb,	%i6
	st	%f24,	[%l7 + 0x54]
	nop
	set	0x40, %i0
	std	%f20,	[%l7 + %i0]
	nop
	set	0x6C, %i5
	prefetch	[%l7 + %i5],	 3
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x80,	 3
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x89,	 1
	nop
	set	0x2A, %o2
	ldsb	[%l7 + %o2],	%o5
	ld	[%l7 + 0x48],	%f11
	set	0x40, %o4
	stwa	%i4,	[%l7 + %o4] 0x89
	nop
	set	0x34, %i2
	ldsb	[%l7 + %i2],	%i6
	nop
	set	0x78, %l3
	std	%o0,	[%l7 + %l3]
	nop
	set	0x20, %g7
	stb	%i5,	[%l7 + %g7]
	set	0x60, %o7
	stda	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	add	%l0,	%g5,	%g1
	ld	[%l7 + 0x0C],	%f10
	fpsub16	%f28,	%f14,	%f18
	set	0x36, %g4
	stha	%o2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x54, %g1
	lduw	[%l7 + %g1],	%g7
	set	0x78, %o6
	stxa	%i7,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%o2
	set	0x14, %i6
	stwa	%i3,	[%l7 + %i6] 0xe2
	membar	#Sync
	add	%i0,	%o7,	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%i2
	nop
	set	0x08, %l0
	sth	%g6,	[%l7 + %l0]
	ld	[%l7 + 0x24],	%f21
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%o0
	fpadd16s	%f31,	%f12,	%f5
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x89,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%g3
	set	0x68, %i1
	lda	[%l7 + %i1] 0x88,	%f3
	add	%l2,	%l6,	%o6
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%g2
	nop
	set	0x58, %l6
	std	%f8,	[%l7 + %l6]
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%l5
	set	0x72, %l1
	stha	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o1
	set	0x26, %o3
	stba	%i5,	[%l7 + %o3] 0x81
	nop
	set	0x4A, %o1
	lduh	[%l7 + %o1],	%i6
	st	%f18,	[%l7 + 0x3C]
	nop
	set	0x6C, %g2
	stw	%l0,	[%l7 + %g2]
	nop
	set	0x60, %i7
	lduw	[%l7 + %i7],	%i1
	nop
	set	0x78, %i4
	std	%g4,	[%l7 + %i4]
	and	%g1,	%o2,	%i7
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x89,	%g7
	bge,a	%xcc,	loop_209
	nop
	set	0x18, %l4
	lduw	[%l7 + %l4],	%o3
	fpadd32	%f28,	%f28,	%f2
	set	0x28, %i5
	sta	%f14,	[%l7 + %i5] 0x81
loop_209:
	nop
	set	0x70, %i0
	ldxa	[%l7 + %i0] 0x80,	%i0
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x81,	%o7
	st	%f2,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f14
	nop
	set	0x35, %o4
	ldsb	[%l7 + %o4],	%i3
	nop
	set	0x6C, %i2
	ldsw	[%l7 + %i2],	%l4
	ld	[%l7 + 0x68],	%f27
	nop
	set	0x4F, %o5
	ldsb	[%l7 + %o5],	%i2
	nop
	set	0x58, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%g6,	%l3,	%g4
	ld	[%l7 + 0x1C],	%f11
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x89,	%o0
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%o4
	set	0x18, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g3
	nop
	set	0x0F, %o7
	stb	%l2,	[%l7 + %o7]
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x54, %i6
	sth	%o6,	[%l7 + %i6]
	or	%l1,	%g2,	%o5
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x66, %g5
	sth	%o1,	[%l7 + %g5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%i6
	set	0x7B, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i4
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe2,	%l0
	add	%g5,	%g1,	%o2
	nop
	set	0x38, %g6
	prefetch	[%l7 + %g6],	 3
	or	%i7,	%g7,	%o3
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f8
	fpadd16	%f16,	%f18,	%f26
	set	0x74, %o0
	sta	%f23,	[%l7 + %o0] 0x89
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f4
	set	0x20, %o1
	swapa	[%l7 + %o1] 0x81,	%i0
	nop
	set	0x58, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x60, %i7
	stda	%o6,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x6E, %i4
	sth	%i3,	[%l7 + %i4]
	nop
	set	0x10, %l2
	sth	%i1,	[%l7 + %l2]
	nop
	set	0x26, %l4
	ldub	[%l7 + %l4],	%l4
	set	0x2A, %i5
	stha	%i2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x5E, %o2
	sth	%g6,	[%l7 + %o2]
	set	0x0F, %l5
	stba	%g4,	[%l7 + %l5] 0x81
	nop
	set	0x14, %o4
	ldsh	[%l7 + %o4],	%l3
	set	0x14, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x48, %l3
	std	%g2,	[%l7 + %l3]
	wr	%o4,	%l6,	%pic
	set	0x68, %g7
	lda	[%l7 + %g7] 0x89,	%f11
	set	0x78, %i2
	stxa	%l2,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 2
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%g2
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f2
	nop
	set	0x6C, %i6
	prefetch	[%l7 + %i6],	 3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%l5
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	nop
	set	0x30, %g4
	std	%o0,	[%l7 + %g4]
	nop
	set	0x4C, %o6
	stw	%i5,	[%l7 + %o6]
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%i6
	ld	[%l7 + 0x34],	%f8
	add	%i4,	%l0,	%g5
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%o2
	set	0x58, %g6
	stxa	%g1,	[%l7 + %g6] 0x89
	nop
	set	0x3C, %l1
	stb	%g7,	[%l7 + %l1]
	nop
	set	0x29, %l6
	ldub	[%l7 + %l6],	%o3
	nop
	set	0x3C, %o3
	lduw	[%l7 + %o3],	%i7
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f22
	nop
	set	0x20, %o0
	stx	%o7,	[%l7 + %o0]
	nop
	set	0x18, %i1
	std	%i0,	[%l7 + %i1]
	and	%i3,	%l4,	%i2
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	ld	[%l7 + 0x58],	%f3
	be,a,pt	%icc,	loop_210
	nop
	set	0x40, %i7
	swap	[%l7 + %i7],	%g4
	ld	[%l7 + 0x78],	%f7
	set	0x4C, %l4
	stwa	%l3,	[%l7 + %l4] 0xe2
	membar	#Sync
loop_210:
	nop
	set	0x4A, %i5
	ldsh	[%l7 + %i5],	%o0
	nop
	set	0x40, %l2
	stw	%g6,	[%l7 + %l2]
	ba	%xcc,	loop_211
	nop
	set	0x62, %g2
	lduh	[%l7 + %g2],	%o4
	nop
	set	0x29, %o2
	ldstub	[%l7 + %o2],	%g3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l2
loop_211:
	nop
	set	0x6C, %i0
	sta	%f8,	[%l7 + %i0] 0x81
	set	0x40, %l5
	stxa	%o6,	[%l7 + %l5] 0x88
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x81,	 1
	nop
	nop
	setx	0x1D24F5ADA3A95435,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5D000274881CE5D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f30,	%f18
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x30, %g7
	std	%g2,	[%l7 + %g7]
	set	0x63, %o4
	stba	%l1,	[%l7 + %o4] 0x81
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x26, %g1
	lduh	[%l7 + %g1],	%l5
	ld	[%l7 + 0x6C],	%f29
	bgu,a,pn	%xcc,	loop_212
	nop
	set	0x60, %o7
	ldsw	[%l7 + %o7],	%o1
	set	0x60, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i5
loop_212:
	nop
	set	0x7C, %i2
	prefetch	[%l7 + %i2],	 1
	nop
	set	0x60, %l0
	lduh	[%l7 + %l0],	%i4
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%l0
	add	%g5,	%o2,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%o3
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%o7
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%i0
	nop
	set	0x40, %g3
	std	%l4,	[%l7 + %g3]
	nop
	set	0x28, %g6
	lduw	[%l7 + %g6],	%i2
	nop
	set	0x60, %l6
	stw	%i3,	[%l7 + %l6]
	nop
	set	0x78, %o3
	sth	%g4,	[%l7 + %o3]
	nop
	set	0x28, %l1
	ldx	[%l7 + %l1],	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%g6
	or	%o4,	%g3,	%o0
	ld	[%l7 + 0x5C],	%f12
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o6
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x80,	%o5
	nop
	set	0x5C, %o1
	lduw	[%l7 + %o1],	%g2
	and	%l2,	%l5,	%o1
	set	0x25, %i4
	stba	%l1,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x1E, %i1
	stha	%i4,	[%l7 + %i1] 0x80
	wr	%i5,	%l0,	%sys_tick
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%o2
	set	0x60, %i5
	stwa	%g5,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd0,	%f0
	nop
	set	0x68, %l2
	stx	%i6,	[%l7 + %l2]
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%g1
	set	0x48, %i0
	stha	%i7,	[%l7 + %i0] 0x81
	nop
	set	0x68, %g2
	std	%f14,	[%l7 + %g2]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f16
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x81,	%o7
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xe2,	%i0
	bgu,pn	%xcc,	loop_213
	add	%l4,	%i2,	%i3
	nop
	set	0x74, %g1
	prefetch	[%l7 + %g1],	 0
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x89,	%g6
loop_213:
	ld	[%l7 + 0x24],	%f19
	nop
	set	0x53, %o7
	stb	%i1,	[%l7 + %o7]
	set	0x52, %i3
	stha	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%g6
	nop
	set	0x2D, %i2
	stb	%l3,	[%l7 + %i2]
	nop
	set	0x3D, %i6
	ldstub	[%l7 + %i6],	%o4
	set	0x6C, %o6
	sta	%f17,	[%l7 + %o6] 0x88
	st	%fsr,	[%l7 + 0x60]
	wr	%g3,	%l6,	%clear_softint
	nop
	set	0x30, %g4
	std	%f14,	[%l7 + %g4]
	set	0x48, %g5
	lda	[%l7 + %g5] 0x81,	%f17
	nop
	set	0x13, %g3
	ldstub	[%l7 + %g3],	%o6
	st	%f23,	[%l7 + 0x3C]
	bn,a,pt	%icc,	loop_214
	nop
	set	0x78, %g6
	stx	%o5,	[%l7 + %g6]
	ble,a	%xcc,	loop_215
	nop
	set	0x1A, %l6
	lduh	[%l7 + %l6],	%o0
loop_214:
	nop
	set	0x64, %l1
	stwa	%l2,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_215:
	nop
	set	0x39, %o3
	stba	%g2,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xeb,	%o0
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%l4
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%l1
	and	%i4,	%l0,	%o2
	set	0x75, %l4
	stba	%g5,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x22, %i1
	ldsh	[%l7 + %i1],	%i6
	fpsub32s	%f0,	%f18,	%f12
	set	0x6C, %i5
	stha	%g1,	[%l7 + %i5] 0x81
	and	%i5,	%o3,	%i7
	set	0x3C, %i7
	stwa	%i0,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x2C, %l2
	sth	%o7,	[%l7 + %l2]
	nop
	nop
	setx	0x74B8A7C12DD4A804,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE71E812CBFF2A9DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f22,	%f8
	nop
	set	0x62, %i0
	lduh	[%l7 + %i0],	%l4
	nop
	set	0x2C, %g2
	ldsh	[%l7 + %g2],	%i2
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x22, %l5
	ldsh	[%l7 + %l5],	%g7
	nop
	set	0x18, %o2
	std	%i2,	[%l7 + %o2]
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%i1
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%g4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf1
	membar	#Sync
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f0
	set	0x68, %o7
	stxa	%g6,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x08, %i3
	std	%f8,	[%l7 + %i3]
	set	0x40, %l0
	stwa	%o4,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x68, %i2
	ldxa	[%l7 + %i2] 0x88,	%l3
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%l6
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe3,	%o6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f16
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%g3
	nop
	set	0x50, %g6
	sth	%o0,	[%l7 + %g6]
	nop
	set	0x58, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	nop
	setx	0xCA831FC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x36DE3132,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f24,	%f15
	nop
	set	0x38, %o3
	std	%l2,	[%l7 + %o3]
	nop
	set	0x27, %l6
	ldsb	[%l7 + %l6],	%o1
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%l1
	set	0x24, %o1
	lda	[%l7 + %o1] 0x80,	%f31
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%i4
	ld	[%l7 + 0x28],	%f5
	and	%l0,	%l5,	%o2
	nop
	set	0x12, %i5
	stb	%g5,	[%l7 + %i5]
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%g1
	set	0x28, %l4
	swapa	[%l7 + %l4] 0x80,	%i5
	nop
	set	0x47, %i0
	ldstub	[%l7 + %i0],	%i6
	ld	[%l7 + 0x2C],	%f30
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%i7
	add	%i0,	%o3,	%o7
	nop
	set	0x42, %l2
	lduh	[%l7 + %l2],	%i2
	nop
	set	0x18, %o2
	stb	%l4,	[%l7 + %o2]
	set	0x20, %l5
	swapa	[%l7 + %l5] 0x81,	%i3
	nop
	set	0x68, %l3
	lduw	[%l7 + %l3],	%i1
	set	0x60, %o5
	stxa	%g7,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x4E, %g7
	lduh	[%l7 + %g7],	%g6
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%g4
	set	0x40, %i3
	stwa	%o4,	[%l7 + %i3] 0x81
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x88,	 4
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x5A, %i6
	lduh	[%l7 + %i6],	%l3
	nop
	set	0x10, %g1
	swap	[%l7 + %g1],	%o5
	nop
	set	0x64, %o6
	lduw	[%l7 + %o6],	%o0
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%l2
	add	%o1,	%g3,	%l1
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x81,	%i4
	set	0x18, %g6
	stxa	%l0,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x63, %g5
	ldsb	[%l7 + %g5],	%l5
	set	0x38, %l1
	stda	%g2,	[%l7 + %l1] 0x89
	nop
	set	0x2C, %o3
	lduw	[%l7 + %o3],	%o2
	set	0x4D, %l6
	stba	%g5,	[%l7 + %l6] 0x89
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f16
	nop
	set	0x47, %g3
	ldsb	[%l7 + %g3],	%g1
	nop
	set	0x10, %i4
	ldsh	[%l7 + %i4],	%i6
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x88,	 2
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f16
	bgu,a,pt	%xcc,	loop_216
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%i0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x80
loop_216:
	nop
	set	0x70, %l4
	std	%i4,	[%l7 + %l4]
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x81,	%o2
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%i2
	set	0x70, %o2
	sta	%f9,	[%l7 + %o2] 0x80
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	st	%f3,	[%l7 + 0x6C]
	set	0x48, %l2
	stda	%o6,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x88,	%l4
	set	0x24, %g7
	sta	%f23,	[%l7 + %g7] 0x80
	set	0x60, %l3
	stda	%i0,	[%l7 + %l3] 0x80
	nop
	set	0x1F, %i3
	stb	%i3,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x40, %l0
	stx	%g7,	[%l7 + %l0]
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%g6
	set	0x54, %i6
	sta	%f1,	[%l7 + %i6] 0x89
	nop
	set	0x44, %g1
	lduw	[%l7 + %g1],	%g4
	nop
	set	0x62, %o7
	sth	%o4,	[%l7 + %o7]
	nop
	set	0x78, %o6
	lduh	[%l7 + %o6],	%l6
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%l2
	nop
	set	0x6C, %g4
	swap	[%l7 + %g4],	%o6
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%o4
	nop
	set	0x0A, %g6
	sth	%l2,	[%l7 + %g6]
	st	%f17,	[%l7 + 0x28]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%g3
	nop
	set	0x48, %o3
	ldsb	[%l7 + %o3],	%l1
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x0C, %o0
	stwa	%i4,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x60, %g3
	stda	%o0,	[%l7 + %g3] 0x81
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f22
	set	0x0F, %l1
	stba	%l0,	[%l7 + %l1] 0x80
	nop
	set	0x78, %i5
	stw	%l5,	[%l7 + %i5]
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%o2
	st	%f13,	[%l7 + 0x68]
	set	0x60, %i7
	sta	%f23,	[%l7 + %i7] 0x81
	and	%g2,	%g1,	%g5
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x89,	%i7
	bleu,pt	%xcc,	loop_217
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%i6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
loop_217:
	nop
	set	0x2C, %i0
	sta	%f11,	[%l7 + %i0] 0x89
	nop
	set	0x4B, %l5
	ldub	[%l7 + %l5],	%i0
	nop
	set	0x61, %o2
	ldub	[%l7 + %o2],	%o3
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xd8
	st	%f6,	[%l7 + 0x44]
	set	0x20, %o5
	stxa	%i5,	[%l7 + %o5] 0x88
	nop
	set	0x40, %g7
	std	%o6,	[%l7 + %g7]
	bg,pn	%icc,	loop_218
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x64, %i3
	stw	%i2,	[%l7 + %i3]
	nop
	set	0x40, %l0
	stb	%i1,	[%l7 + %l0]
loop_218:
	nop
	set	0x2E, %i2
	ldstub	[%l7 + %i2],	%i3
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f14
	set	0x2C, %i6
	lda	[%l7 + %i6] 0x81,	%f31
	set	0x3C, %o7
	stha	%l4,	[%l7 + %o7] 0x80
	nop
	set	0x2E, %o6
	ldstub	[%l7 + %o6],	%g7
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf9
	membar	#Sync
	set	0x34, %g4
	stha	%g6,	[%l7 + %g4] 0x88
	nop
	set	0x54, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x107, 	%sys_tick_cmpr
	set	0x76, %g6
	stha	%l3,	[%l7 + %g6] 0x89
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%o5
	set	0x08, %l6
	stxa	%l2,	[%l7 + %l6] 0x89
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f28
	fpadd32s	%f30,	%f20,	%f16
	or	%o6,	%g3,	%o0
	nop
	set	0x34, %i4
	stw	%l1,	[%l7 + %i4]
	set	0x28, %l1
	sta	%f23,	[%l7 + %l1] 0x81
	or	%o1,	%i4,	%l5
	wr	%l0,	%o2,	%y
	nop
	set	0x7D, %g3
	ldstub	[%l7 + %g3],	%g1
	set	0x18, %i5
	swapa	[%l7 + %i5] 0x89,	%g2
	or	%i7,	%g5,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%o3
	and	%i5,	%o7,	%i2
	add	%i1,	%i3,	%g7
	and	%g6,	%l4,	%o4
	bge,pt	%icc,	loop_219
	nop
	set	0x58, %i7
	ldsb	[%l7 + %i7],	%l3
	st	%f11,	[%l7 + 0x7C]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g4
loop_219:
	nop
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x89,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%l2
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	st	%f29,	[%l7 + 0x10]
	nop
	set	0x56, %g2
	ldstub	[%l7 + %g2],	%l1
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f16
	nop
	set	0x70, %l5
	stx	%g3,	[%l7 + %l5]
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x3C, %o2
	swap	[%l7 + %o2],	%o1
	add	%l5,	%i4,	%l0
	nop
	set	0x68, %l2
	std	%f10,	[%l7 + %l2]
	fpsub32	%f2,	%f0,	%f2
	or	%g1,	%o2,	%i7
	set	0x70, %o5
	stda	%g2,	[%l7 + %o5] 0x88
	ld	[%l7 + 0x38],	%f22
	nop
	set	0x2E, %l3
	ldstub	[%l7 + %l3],	%g5
	set	0x48, %i3
	stwa	%i0,	[%l7 + %i3] 0x81
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x80,	%o3
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 2
	add	%i6,	%i5,	%i2
	nop
	set	0x58, %g1
	ldub	[%l7 + %g1],	%o7
	set	0x08, %i6
	stda	%i0,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f0
	set	0x1B, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i3
	or	%g7,	%l4,	%g6
	set	0x70, %o4
	stxa	%o4,	[%l7 + %o4] 0x88
	set	0x0C, %g4
	stwa	%l3,	[%l7 + %g4] 0x80
	nop
	set	0x66, %o6
	lduh	[%l7 + %o6],	%g4
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f24
	set	0x68, %g6
	prefetcha	[%l7 + %g6] 0x88,	 3
	or	%o5,	%l2,	%o0
	set	0x20, %o3
	stda	%o6,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x74, %l6
	swap	[%l7 + %l6],	%l1
	nop
	set	0x0E, %i4
	ldsb	[%l7 + %i4],	%o1
	nop
	set	0x6A, %l1
	ldstub	[%l7 + %l1],	%g3
	nop
	set	0x7C, %o0
	prefetch	[%l7 + %o0],	 3
	st	%fsr,	[%l7 + 0x10]
	or	%i4,	%l5,	%l0
	or	%o2,	%i7,	%g2
	set	0x14, %g3
	lda	[%l7 + %g3] 0x80,	%f26
	nop
	set	0x18, %i5
	swap	[%l7 + %i5],	%g5
	nop
	set	0x64, %o1
	ldsh	[%l7 + %o1],	%g1
	set	0x70, %i7
	stda	%o2,	[%l7 + %i7] 0x81
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	nop
	set	0x60, %i0
	ldsh	[%l7 + %i0],	%i6
	add	%i5,	%i0,	%o7
	nop
	set	0x3C, %g2
	stw	%i2,	[%l7 + %g2]
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%i3
	nop
	set	0x74, %o2
	swap	[%l7 + %o2],	%i1
	nop
	set	0x6C, %l2
	swap	[%l7 + %l2],	%g7
	nop
	set	0x34, %o5
	ldsb	[%l7 + %o5],	%g6
	add	%o4,	%l3,	%l4
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%f22
	set	0x28, %l3
	stxa	%l6,	[%l7 + %l3] 0x80
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%g4
	st	%f31,	[%l7 + 0x60]
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%l2
	nop
	set	0x54, %g1
	ldsh	[%l7 + %g1],	%o0
	fpsub16s	%f25,	%f24,	%f26
	nop
	set	0x20, %i3
	swap	[%l7 + %i3],	%o6
	st	%f25,	[%l7 + 0x1C]
	set	0x20, %i2
	swapa	[%l7 + %i2] 0x88,	%l1
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x80,	%o5
	nop
	set	0x30, %i6
	lduh	[%l7 + %i6],	%o1
	set	0x18, %g4
	prefetcha	[%l7 + %g4] 0x81,	 0
	set	0x60, %o6
	lda	[%l7 + %o6] 0x89,	%f25
	nop
	set	0x24, %g5
	lduh	[%l7 + %g5],	%g3
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x88,	%l0
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f16
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	nop
	set	0x41, %o4
	ldsb	[%l7 + %o4],	%o2
	set	0x1B, %l1
	stba	%i7,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x58, %i4
	std	%l4,	[%l7 + %i4]
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x89,	%g2
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x80,	%g5
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%o3
	nop
	set	0x6C, %o1
	swap	[%l7 + %o1],	%i6
	nop
	set	0x49, %i7
	ldub	[%l7 + %i7],	%i5
	ble	%icc,	loop_220
	or	%g1,	%i0,	%i2
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc8
loop_220:
	nop
	set	0x30, %l4
	lda	[%l7 + %l4] 0x89,	%f18
	nop
	set	0x6C, %g2
	ldsh	[%l7 + %g2],	%o7
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	nop
	set	0x50, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x56, %o5
	sth	%i1,	[%l7 + %o5]
	set	0x10, %l2
	ldda	[%l7 + %l2] 0xeb,	%g6
	set	0x6C, %l3
	lda	[%l7 + %l3] 0x80,	%f5
	nop
	nop
	setx	0x7DA61118,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x828F4FFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f13,	%f26
	set	0x7F, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g6
	nop
	set	0x20, %l0
	lduh	[%l7 + %l0],	%o4
	ld	[%l7 + 0x48],	%f16
	nop
	set	0x10, %i1
	ldsw	[%l7 + %i1],	%i3
	set	0x24, %g1
	lda	[%l7 + %g1] 0x80,	%f17
	nop
	set	0x34, %i3
	ldsh	[%l7 + %i3],	%l4
	set	0x74, %i2
	swapa	[%l7 + %i2] 0x89,	%l6
	set	0x64, %o7
	sta	%f23,	[%l7 + %o7] 0x88
	nop
	set	0x08, %g4
	std	%f28,	[%l7 + %g4]
	st	%f11,	[%l7 + 0x10]
	set	0x0C, %i6
	stha	%g4,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x34, %g5
	stwa	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%o0
	nop
	set	0x60, %g6
	sth	%l1,	[%l7 + %g6]
	nop
	set	0x60, %o6
	std	%o6,	[%l7 + %o6]
	nop
	set	0x3C, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x16, %o3
	ldsh	[%l7 + %o3],	%o1
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x38, %o4
	std	%i4,	[%l7 + %o4]
	set	0x60, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
	set	0x10, %l1
	ldxa	[%l7 + %l1] 0x80,	%g3
	set	0x18, %o0
	stwa	%o2,	[%l7 + %o0] 0x88
	nop
	set	0x40, %i5
	lduw	[%l7 + %i5],	%i7
	nop
	set	0x58, %o1
	std	%l4,	[%l7 + %o1]
	nop
	set	0x32, %g3
	ldstub	[%l7 + %g3],	%l0
	add	%g2,	%o3,	%i6
	nop
	set	0x38, %i7
	stx	%i5,	[%l7 + %i7]
	set	0x40, %i0
	stda	%g0,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x45, %l4
	ldstub	[%l7 + %l4],	%i0
	nop
	set	0x70, %o2
	stx	%g5,	[%l7 + %o2]
	nop
	set	0x70, %l5
	ldsh	[%l7 + %l5],	%o7
	nop
	set	0x50, %o5
	std	%f18,	[%l7 + %o5]
	nop
	set	0x43, %l2
	stb	%i1,	[%l7 + %l2]
	nop
	set	0x24, %g2
	ldsw	[%l7 + %g2],	%i2
	nop
	set	0x30, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x72, %g7
	stha	%g6,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x7C, %l0
	stw	%o4,	[%l7 + %l0]
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x80,	 2
	or	%i3,	%l4,	%g4
	nop
	set	0x50, %i3
	swap	[%l7 + %i3],	%l6
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f8
	set	0x48, %o7
	sta	%f12,	[%l7 + %o7] 0x88
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x89,	 3
	nop
	set	0x14, %g4
	stb	%o0,	[%l7 + %g4]
	add	%l1,	%o6,	%l3
	nop
	set	0x7B, %i6
	stb	%i4,	[%l7 + %i6]
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%o5
	set	0x44, %o6
	lda	[%l7 + %o6] 0x89,	%f25
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%o1
	nop
	set	0x7E, %g6
	ldsh	[%l7 + %g6],	%i7
	nop
	set	0x60, %l6
	std	%f10,	[%l7 + %l6]
	set	0x74, %o4
	stha	%l5,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xe3,	%o2
	set	0x38, %i4
	stda	%l0,	[%l7 + %i4] 0x80
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f20
	bne,a	%icc,	loop_221
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 4
	set	0x4B, %g3
	stba	%g2,	[%l7 + %g3] 0x80
loop_221:
	nop
	set	0x74, %o0
	stha	%o3,	[%l7 + %o0] 0x81
	nop
	set	0x45, %i0
	ldub	[%l7 + %i0],	%i6
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x89,	 4
	nop
	set	0x1B, %o2
	stb	%i5,	[%l7 + %o2]
	set	0x63, %l4
	ldstuba	[%l7 + %l4] 0x80,	%i0
	nop
	nop
	setx	0x16B5EDA3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x590EAA31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f27,	%f17
	st	%f30,	[%l7 + 0x70]
	fpadd16	%f6,	%f0,	%f20
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%o7
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%f22
	nop
	set	0x6C, %g2
	swap	[%l7 + %g2],	%g5
	set	0x54, %l2
	swapa	[%l7 + %l2] 0x81,	%i1
	set	, %g7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1284
!	Type a   	: 18
!	Type cti   	: 25
!	Type x   	: 499
!	Type f   	: 43
!	Type i   	: 131
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
.word 0x81813685
.word 0xE3DD3F43
.word 0x261BB28B
.word 0xCF8D026B
.word 0x89B71F50
.word 0xCD2237A2
.word 0x827EC4F9
.word 0x5D93038E
.word 0xF3157CB3
.word 0x821D6ECE
.word 0xAD62CD4A
.word 0xEDC1AF46
.word 0xDA09AC89
.word 0x98732154
.word 0xB2652CC6
.word 0xBC5C0797
.word 0xB525818F
.word 0x111B2283
.word 0xAE695B58
.word 0x06149B3D
.word 0x58D6B556
.word 0x5CD066C6
.word 0xD4126B9A
.word 0x681C80BF
.word 0x43787E61
.word 0xC7262603
.word 0xB02701D7
.word 0xD16AD73A
.word 0x5DBF19FD
.word 0x64E34217
.word 0x21F017F3
.word 0x11818EDD
.word 0x70239E8D
.word 0x4DCA4A22
.word 0x4C34B6E1
.word 0xAE018E8F
.word 0x2B5B95C0
.word 0x9B040A9A
.word 0x37AFDC11
.word 0xF8FAE7B8
.word 0x2528150E
.word 0x494601DD
.word 0x6B8F30A9
.word 0xE25A7963
.word 0x6D1B5037
.word 0x52CFA224
.word 0x71F70795
.word 0x7858AFE6
.word 0xF39A0D6A
.word 0x9E9256A4
.word 0x017B99BD
.word 0xD079B5CB
.word 0x79E4A509
.word 0x736D9639
.word 0x60C5DA59
.word 0x4578E214
.word 0xF0B518B9
.word 0x1478AAB0
.word 0xF0DB04A1
.word 0xC286272E
.word 0x56C4AF3B
.word 0xD22E7525
.word 0x9E258C5B
.word 0xB1682396
!! thread 1 data, 64 words.
.word 0x54D0DC9F
.word 0xE84C8ED0
.word 0x21361862
.word 0x1468D693
.word 0x040F2134
.word 0xD5405DB2
.word 0x704B2EF1
.word 0x2D8237FD
.word 0xBB3F1D92
.word 0xC32BAF81
.word 0xDA1220F3
.word 0xAFF798EE
.word 0x26902076
.word 0x16694664
.word 0xEB4E4C57
.word 0xFE500819
.word 0xC53EC37E
.word 0x28F98B9A
.word 0x44890E24
.word 0x1BC57ABE
.word 0x9DEB36E7
.word 0xB632E047
.word 0xCBF4A247
.word 0x3A706305
.word 0x3DD02B21
.word 0xFE7245AC
.word 0x7426FD17
.word 0xBEBE1B18
.word 0x1014F97D
.word 0x5FF54EAE
.word 0x02687E33
.word 0x01A54275
.word 0xAEF1FBF1
.word 0x20016F10
.word 0x918DA7B0
.word 0x75023A7F
.word 0xE18CBF8C
.word 0xA7883574
.word 0xD8BD18CF
.word 0x3EC56E34
.word 0xA486CE35
.word 0x372B2AD3
.word 0xB24A873E
.word 0x24BB4C8F
.word 0x78EAB30A
.word 0x69ACD3E1
.word 0xCE85D7EE
.word 0x4559DCB7
.word 0x9C3531E1
.word 0x08E37498
.word 0x92F196BD
.word 0xABD9D625
.word 0x0BAC9E7E
.word 0x30620A90
.word 0xA80A9614
.word 0x31F521BE
.word 0xDC911B25
.word 0x5AF2B6B0
.word 0xC97072CB
.word 0x420CCB9E
.word 0x897B29C5
.word 0x4CBE401F
.word 0xCCC3F76C
.word 0x22AF9E67
!! thread 2 data, 64 words.
.word 0x21B15DFD
.word 0x4B4C282F
.word 0x1F2414F5
.word 0x443EFE08
.word 0x8A59B32A
.word 0x60131F19
.word 0xE62D6C69
.word 0x233CF7E2
.word 0x3801B6C2
.word 0x8815AB67
.word 0x93109937
.word 0x516AF017
.word 0x6B549F57
.word 0x6E3C1EB8
.word 0xBD24CAF0
.word 0x06A09D9C
.word 0x41B7E22C
.word 0x438A12DD
.word 0x0E625C53
.word 0xAABD263D
.word 0x04C6D654
.word 0x4BACAD93
.word 0x99595F60
.word 0x5E69D952
.word 0x7E767BB0
.word 0x0345D1A4
.word 0x16125331
.word 0xEB273039
.word 0x9C2F314F
.word 0x495BACA6
.word 0xE371FF26
.word 0x4DDA0630
.word 0xFFF4BD82
.word 0x865B2A6F
.word 0xBE4CBA8E
.word 0x64F2442C
.word 0xE333D846
.word 0x69B1AF38
.word 0x8016FF28
.word 0x1DB11F0F
.word 0xC198D260
.word 0xF259EF38
.word 0xD4F13020
.word 0xC5F94E84
.word 0xFC65FC30
.word 0x29462AB9
.word 0x46EFF918
.word 0x3329D594
.word 0x1C7F2D93
.word 0x433DD21A
.word 0xA251E5FD
.word 0x0D6DD422
.word 0x9DC3F620
.word 0xFED16837
.word 0x1E260288
.word 0x638CD787
.word 0x8C5E518C
.word 0x9ED1259D
.word 0xC010F1C7
.word 0x6092EE7F
.word 0x8014A078
.word 0x25AD9F79
.word 0xA03161F8
.word 0x8B7AC8EB
!! thread 3 data, 64 words.
.word 0x2D259392
.word 0xA802BA93
.word 0x5FB2B9B7
.word 0xE5AE04BF
.word 0x599EBC2B
.word 0x0EED2A88
.word 0xC6D5E5DB
.word 0xD795CD35
.word 0x4440BD29
.word 0x434646BA
.word 0xEB4D3234
.word 0x7EFBAE3E
.word 0xA9D45FB6
.word 0xF4D8368C
.word 0xE3B2CA93
.word 0x4A5C3B93
.word 0x8C1FF2C9
.word 0x68DF6F00
.word 0x3458FECC
.word 0x09986652
.word 0x9AFECB1C
.word 0x8529BDA8
.word 0x33C49490
.word 0xC1624CB7
.word 0xD31EF9F8
.word 0xA6D02DD9
.word 0x65B79A2F
.word 0xA6A2631D
.word 0x35F2878D
.word 0x6685EC00
.word 0x98926C88
.word 0x0A023430
.word 0xD310DEAA
.word 0xCFCBDD58
.word 0xA7406937
.word 0x8EF7FC15
.word 0x135E7692
.word 0x861F58A1
.word 0x772F63BE
.word 0x7C732817
.word 0xF1170B9C
.word 0x0934AAB5
.word 0xD28C0DA0
.word 0x0442970E
.word 0x9D4A6102
.word 0x9A3EB0F8
.word 0x6A168F80
.word 0x11C45E04
.word 0xD95F2E4C
.word 0xF655A7B4
.word 0xC1B36D74
.word 0x1C6F0D5D
.word 0xD2BCB255
.word 0x1F479D13
.word 0x58932327
.word 0x0012F5B7
.word 0xA521B328
.word 0x230C0CB9
.word 0xA258B47A
.word 0x6683E50E
.word 0x56B7597A
.word 0x447BB82B
.word 0xA34597E2
.word 0x96312CAD
!! thread 4 data, 64 words.
.word 0x6CD54BAF
.word 0x0CD28CEE
.word 0x501C1610
.word 0xC29594A0
.word 0x62F144E7
.word 0xC67780A3
.word 0x6AE28B5E
.word 0x564E0886
.word 0xD37EC444
.word 0x3CC7DC5E
.word 0x0B5245CC
.word 0x38595255
.word 0xFE0A9C0F
.word 0x954D180F
.word 0x83654572
.word 0x2D9AE855
.word 0x3BA1743C
.word 0xD1FDB64D
.word 0xE9A77DF2
.word 0x2261AA7A
.word 0x9417B4E4
.word 0x5C8B934B
.word 0x6B16CE73
.word 0x1CD81FA3
.word 0xF109C6DD
.word 0x9F8DD0BD
.word 0x1FF17B34
.word 0xA639429F
.word 0xC7AFD0AC
.word 0x93BB708A
.word 0x9A6727D6
.word 0xB430E054
.word 0xA6AAC10A
.word 0x9DD83871
.word 0xBD871632
.word 0x2BD3CA7D
.word 0x010AE797
.word 0xA627900D
.word 0xB63E9184
.word 0x6B0B4B5E
.word 0x323EFB3F
.word 0xE3168F47
.word 0xA2A71283
.word 0x59032521
.word 0xE7BF377B
.word 0x00BFC27A
.word 0x9C5CCEAB
.word 0x1A878225
.word 0x73334C7D
.word 0xA329954F
.word 0x64EF5D3A
.word 0xFFE9501B
.word 0x9301E65C
.word 0x6DB0A69F
.word 0xE6021518
.word 0xB7D805BF
.word 0xCD4756E5
.word 0xDB4E4389
.word 0x75DC43AC
.word 0x71AE789C
.word 0xD3CDD5EB
.word 0x14E426A8
.word 0x5ACCBB7E
.word 0xD9C292D3
!! thread 5 data, 64 words.
.word 0x92D24B9D
.word 0x4A238D68
.word 0x38CE2D0E
.word 0xC0CC0923
.word 0x8B20C15D
.word 0xC1606B6E
.word 0xE29FD22F
.word 0x9AD2FC48
.word 0x25A08FB4
.word 0x28F39D57
.word 0xC71E1117
.word 0xB0CB443C
.word 0x862CEC4D
.word 0xAB8A92B1
.word 0xD3039BA4
.word 0x083148BB
.word 0x78BD70C2
.word 0xC7930E24
.word 0xEA2B46F1
.word 0x5B503C92
.word 0xD94704F8
.word 0x0072DC88
.word 0xF949521C
.word 0x831D8955
.word 0xF8C2CBB8
.word 0xAFFE42D3
.word 0x547A5806
.word 0xF4B4A369
.word 0x29DE68FF
.word 0xAED75942
.word 0x8057CFA5
.word 0x496683D7
.word 0xB36D6DE8
.word 0x53748B49
.word 0x5C424259
.word 0x94AB02E8
.word 0xC6D5B887
.word 0xAA846916
.word 0xC60A875E
.word 0xBF7E5AAD
.word 0xE28A0B84
.word 0x771044D0
.word 0x6B12078B
.word 0x798E8264
.word 0xD5FA8FD4
.word 0xD737943E
.word 0x6167C692
.word 0x14F1E24A
.word 0xC191EC90
.word 0xA1D091A7
.word 0xFF53850E
.word 0xE7734EAF
.word 0x3C8B5BEB
.word 0x24176968
.word 0x00226CD4
.word 0x7266439E
.word 0xD071E4F7
.word 0xB2A6A35E
.word 0x7DE46379
.word 0x860A2A13
.word 0x3FCF8B95
.word 0x1192266E
.word 0x5F3E3321
.word 0x0E78EF7B
!! thread 6 data, 64 words.
.word 0x5959D10A
.word 0x8115E0E7
.word 0x2B1C6AB3
.word 0xFAEE82BB
.word 0x2A82DA49
.word 0xE326F5E3
.word 0x77B83226
.word 0x4CF9B87B
.word 0x3AA2A4B2
.word 0xFF43704E
.word 0x73C9B9D7
.word 0x6FF3B84E
.word 0x8A6C1F5B
.word 0x1F2C82DD
.word 0x057DA097
.word 0x6A762B6D
.word 0x990F1F5D
.word 0xC0C8DA84
.word 0x381D417F
.word 0xBF8DF459
.word 0xD93CE7BF
.word 0xB7038A44
.word 0xD428BABE
.word 0x2C21F17B
.word 0x39EF6BF1
.word 0x0D6E9E0D
.word 0x0B9A7076
.word 0x23692377
.word 0x9AE72E11
.word 0x4206E7E8
.word 0xBA616D51
.word 0x9A5E28A5
.word 0xD80E57C6
.word 0xC3AC93EE
.word 0x566C4249
.word 0x7BBB3799
.word 0x2AB9C010
.word 0x1E2863F2
.word 0xE1A2B582
.word 0xF2A5330B
.word 0xD1716101
.word 0x42AF08A8
.word 0xF5A5D0ED
.word 0x97FBE6BE
.word 0x98184E03
.word 0x09143BE1
.word 0xE5DCB15B
.word 0xBB657E6B
.word 0x0F05A089
.word 0x602C59CE
.word 0x616F29E2
.word 0x53F5932B
.word 0x12A7BC88
.word 0xDD5B0889
.word 0x7D561385
.word 0x3B3E3971
.word 0x032A8840
.word 0x124BC6CF
.word 0x813078CC
.word 0xDE78F55D
.word 0x7D021E48
.word 0x8EEA395F
.word 0xB68A1682
.word 0x82AACD5B
!! thread 7 data, 64 words.
.word 0x0E869395
.word 0xF24EF277
.word 0x2F0D9992
.word 0x19137A59
.word 0xCCB1B6B8
.word 0x4AD0E36B
.word 0x6F0C2346
.word 0xBDC14600
.word 0x866B5B8E
.word 0x11045117
.word 0xFD54D411
.word 0xB28312C4
.word 0xE4B5948B
.word 0xBE2B194F
.word 0x73A0286C
.word 0xA2049497
.word 0xFB060568
.word 0xC1EF6D76
.word 0x19CEE523
.word 0x67EB6AFC
.word 0x97D8AE4C
.word 0x009167B4
.word 0xBF2216EA
.word 0x822BCB81
.word 0x36F8B654
.word 0x06B28D84
.word 0x2BF687ED
.word 0xBAEA2D9B
.word 0x76D9F85D
.word 0x6E8E6885
.word 0x8AD02258
.word 0xE0411515
.word 0xC50D9BBB
.word 0x206BCE5C
.word 0xC48873EA
.word 0x65240D1B
.word 0xFDD8A7ED
.word 0xE8E5A51D
.word 0x581A3B11
.word 0x3CD6382F
.word 0x94282C31
.word 0x80B44D07
.word 0x65FC33E1
.word 0xE3CEDBB7
.word 0x9BC9C321
.word 0x6D913721
.word 0xC925C0AC
.word 0x5FE501AA
.word 0x94D3896B
.word 0xE0B260B2
.word 0x56CE5B40
.word 0xA05FF2A4
.word 0xEDB73B2F
.word 0xD7FCBD2A
.word 0x0280A49E
.word 0x6EA1DAFB
.word 0xE6B75FF0
.word 0xA85A4930
.word 0x4FB36EF8
.word 0x7D77950C
.word 0x5F37197A
.word 0xC5BC4F73
.word 0x6DCF1C4B
.word 0xCF80392D
.end
