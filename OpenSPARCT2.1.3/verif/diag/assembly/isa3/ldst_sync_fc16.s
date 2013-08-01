/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc16.s
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
	set	0xD,	%g2
	set	0xA,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0xA,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xB,	%i1
	set	-0xE,	%i2
	set	-0x9,	%i3
	set	-0x1,	%i4
	set	-0x6,	%i5
	set	-0xA,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x2447395B,	%l0
	set	0x6ACA9E70,	%l1
	set	0x52029563,	%l2
	set	0x10E571C0,	%l3
	set	0x0F1ABA15,	%l4
	set	0x1DD0501A,	%l5
	set	0x69058972,	%l6
	!# Output registers
	set	0x048D,	%o0
	set	-0x152D,	%o1
	set	0x11F1,	%o2
	set	0x06CE,	%o3
	set	-0x04D4,	%o4
	set	-0x08F2,	%o5
	set	0x1EEF,	%o6
	set	-0x1D49,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x0655C2D7564E28C1)
	INIT_TH_FP_REG(%l7,%f2,0x60C2EA92743E00CE)
	INIT_TH_FP_REG(%l7,%f4,0x14F0772CB07BB6CF)
	INIT_TH_FP_REG(%l7,%f6,0x604EAEE232F7F150)
	INIT_TH_FP_REG(%l7,%f8,0x3BFB940A7124C5F5)
	INIT_TH_FP_REG(%l7,%f10,0x97C5E3FE5B46CAE3)
	INIT_TH_FP_REG(%l7,%f12,0x617061F8D105F4B2)
	INIT_TH_FP_REG(%l7,%f14,0xDD59C06F97F20FBA)
	INIT_TH_FP_REG(%l7,%f16,0xC55D6C345D019485)
	INIT_TH_FP_REG(%l7,%f18,0x1DB5C87348820EA1)
	INIT_TH_FP_REG(%l7,%f20,0xAF60D94578BA3EB3)
	INIT_TH_FP_REG(%l7,%f22,0x8D835DB4BB5AB04B)
	INIT_TH_FP_REG(%l7,%f24,0xD6417CD1904AEEC8)
	INIT_TH_FP_REG(%l7,%f26,0x189FD647CD609070)
	INIT_TH_FP_REG(%l7,%f28,0x5A0DDB142DEB3D51)
	INIT_TH_FP_REG(%l7,%f30,0x84CBD521F4A30C09)

	!# Execute Main Diag ..

	nop
	set	0x19, %i4
	ldstub	[%l7 + %i4],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x58, %i2
	stx	%g7,	[%l7 + %i2]
	ld	[%l7 + 0x28],	%f9
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%l5
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	nop
	set	0x4A, %l4
	ldsb	[%l7 + %l4],	%i2
	nop
	set	0x58, %o3
	std	%l2,	[%l7 + %o3]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f16
	set	0x32, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g1
	nop
	set	0x60, %o4
	std	%i6,	[%l7 + %o4]
	add	%l6,	%i4,	%o7
	or	%l2,	%g3,	%o1
	nop
	set	0x1C, %l2
	lduw	[%l7 + %l2],	%o5
	nop
	set	0x50, %l0
	ldsw	[%l7 + %l0],	%o4
	set	0x78, %l5
	stwa	%g5,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc0
	nop
	set	0x18, %o7
	std	%i4,	[%l7 + %o7]
	set	0x7A, %o2
	stha	%i0,	[%l7 + %o2] 0x88
	nop
	set	0x10, %g6
	stw	%o6,	[%l7 + %g6]
	nop
	set	0x3C, %l3
	stw	%i3,	[%l7 + %l3]
	set	0x58, %i7
	stda	%o0,	[%l7 + %i7] 0x81
	nop
	set	0x1E, %g4
	sth	%l1,	[%l7 + %g4]
	set	0x6B, %i0
	stba	%l4,	[%l7 + %i0] 0x81
	set	0x38, %g5
	stxa	%o2,	[%l7 + %g5] 0xe2
	membar	#Sync
	fpadd16s	%f3,	%f29,	%f5
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%i1
	nop
	set	0x14, %g7
	lduw	[%l7 + %g7],	%o3
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%f20
	nop
	set	0x18, %o0
	ldstub	[%l7 + %o0],	%i7
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x78, %i1
	stx	%g4,	[%l7 + %i1]
	set	0x4C, %i6
	lda	[%l7 + %i6] 0x80,	%f20
	nop
	set	0x08, %l6
	std	%f0,	[%l7 + %l6]
	nop
	set	0x14, %i3
	sth	%l0,	[%l7 + %i3]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x89
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%g6
	set	0x46, %g2
	stha	%g2,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f16
	set	0x5F, %l4
	ldstuba	[%l7 + %l4] 0x81,	%l5
	nop
	set	0x5C, %o3
	ldsw	[%l7 + %o3],	%g7
	add	%l3,	%g1,	%i6
	set	0x40, %i5
	lda	[%l7 + %i5] 0x88,	%f19
	set	0x54, %l1
	sta	%f4,	[%l7 + %l1] 0x88
	be,a,pt	%xcc,	loop_1
	nop
	set	0x24, %o5
	stw	%i2,	[%l7 + %o5]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd8,	%f16
loop_1:
	or	%i4,	%l6,	%o7
	nop
	set	0x4A, %l2
	sth	%g3,	[%l7 + %l2]
	set	0x39, %l0
	stba	%o1,	[%l7 + %l0] 0x88
	st	%f9,	[%l7 + 0x7C]
	nop
	set	0x70, %g3
	std	%f4,	[%l7 + %g3]
	set	0x74, %o7
	stwa	%o5,	[%l7 + %o7] 0x88
	nop
	set	0x0C, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x27, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o4
	and	%l2,	%i5,	%i0
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%g4
	fpadd16s	%f8,	%f7,	%f12
	set	0x42, %g6
	stba	%i3,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x20, %g4
	std	%o6,	[%l7 + %g4]
	ld	[%l7 + 0x48],	%f19
	set	0x34, %i0
	sta	%f27,	[%l7 + %i0] 0x89
	or	%l1,	%l4,	%o2
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f4
	nop
	set	0x2C, %o6
	lduw	[%l7 + %o6],	%o0
	nop
	nop
	setx	0x8EFD416B8707EEDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0821EA65D809BAC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f2,	%f8
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%o3
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f20
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x80,	%i0
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x81,	%i7
	nop
	set	0x18, %i6
	stb	%l0,	[%l7 + %i6]
	nop
	set	0x32, %l6
	stb	%g4,	[%l7 + %l6]
	nop
	set	0x20, %g1
	stx	%g2,	[%l7 + %g1]
	wr	%l5,	%g6,	%ccr
	nop
	set	0x4C, %i4
	sth	%l3,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%g1
	st	%f5,	[%l7 + 0x48]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%i2
	nop
	set	0x46, %g2
	lduh	[%l7 + %g2],	%i4
	set	0x28, %l4
	stxa	%g7,	[%l7 + %l4] 0x88
	st	%f15,	[%l7 + 0x30]
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x81,	%o6
	add	%g3,	%l6,	%o5
	set	0x6C, %i2
	sta	%f9,	[%l7 + %i2] 0x80
	set	0x15, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o1
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x89,	%l2
	set	0x50, %o5
	ldda	[%l7 + %o5] 0xeb,	%o4
	set	0x0C, %o4
	stha	%i5,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	or	%g5,	%i3,	%o6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f0
	nop
	set	0x40, %o7
	std	%f2,	[%l7 + %o7]
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f4
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x81,	%l4
	st	%f0,	[%l7 + 0x78]
	nop
	set	0x15, %l0
	ldstub	[%l7 + %l0],	%o2
	nop
	set	0x3A, %g6
	sth	%o0,	[%l7 + %g6]
	wr	%o3,	%i1,	%set_softint
	and	%i7,	%l0,	%g4
	st	%fsr,	[%l7 + 0x48]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	ld	[%l7 + 0x24],	%f8
	nop
	set	0x24, %i0
	swap	[%l7 + %i0],	%l1
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%g6
	set	0x54, %o6
	lda	[%l7 + %o6] 0x80,	%f0
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%g1
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x80,	%i6
	or	%i2,	%l3,	%g7
	nop
	set	0x36, %g7
	lduh	[%l7 + %g7],	%o7
	set	0x4D, %i1
	stba	%i4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x50, %o1
	ldsh	[%l7 + %o1],	%g3
	set	0x18, %o0
	sta	%f14,	[%l7 + %o0] 0x89
	nop
	set	0x19, %i6
	ldstub	[%l7 + %i6],	%o5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x88
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x81,	%i6
	set	0x4C, %i3
	stwa	%o1,	[%l7 + %i3] 0x80
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%o4
	nop
	set	0x08, %l4
	ldsh	[%l7 + %l4],	%l2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%g5
	set	0x38, %o3
	stda	%i4,	[%l7 + %o3] 0xe2
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%l4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xda
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%o2
	set	0x68, %i4
	stxa	%o0,	[%l7 + %i4] 0x81
	nop
	set	0x42, %i5
	lduh	[%l7 + %i5],	%o3
	nop
	set	0x10, %o5
	stx	%i1,	[%l7 + %o5]
	set	0x30, %o4
	ldxa	[%l7 + %o4] 0x80,	%i3
	nop
	set	0x56, %l2
	stb	%i7,	[%l7 + %l2]
	set	0x14, %g3
	stha	%l0,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x78, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x55, %l5
	ldub	[%l7 + %l5],	%l1
	set	0x28, %o7
	stxa	%g2,	[%l7 + %o7] 0x80
	ld	[%l7 + 0x28],	%f8
	nop
	set	0x53, %g6
	ldub	[%l7 + %g6],	%l5
	set	0x68, %l0
	lda	[%l7 + %l0] 0x89,	%f15
	nop
	set	0x78, %g4
	stw	%g6,	[%l7 + %g4]
	set	0x28, %g5
	lda	[%l7 + %g5] 0x88,	%f7
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%i6
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x80,	 4
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%g6
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x44, %g7
	sta	%f29,	[%l7 + %g7] 0x89
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	nop
	set	0x08, %o0
	stb	%o7,	[%l7 + %o0]
	ld	[%l7 + 0x1C],	%f16
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%l3
	set	0x3E, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i4
	or	%o5,	%g3,	%l6
	set	0x58, %g1
	stxa	%o1,	[%l7 + %g1] 0x80
	add	%o4,	%l2,	%i0
	nop
	set	0x60, %i1
	std	%f0,	[%l7 + %i1]
	nop
	set	0x5C, %i3
	prefetch	[%l7 + %i3],	 3
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x60, %l4
	ldsw	[%l7 + %l4],	%i5
	set	0x28, %o3
	stda	%o6,	[%l7 + %o3] 0x88
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	bn,pt	%xcc,	loop_2
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%o2
	nop
	set	0x58, %i5
	std	%f12,	[%l7 + %i5]
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%g5
loop_2:
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f0
	set	0x30, %o4
	stda	%o2,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x20, %g3
	swapa	[%l7 + %g3] 0x80,	%o0
	nop
	set	0x38, %l2
	std	%i2,	[%l7 + %l2]
	nop
	set	0x7E, %o2
	stb	%i7,	[%l7 + %o2]
	nop
	set	0x58, %l5
	stx	%i1,	[%l7 + %l5]
	nop
	set	0x44, %o7
	stw	%l0,	[%l7 + %o7]
	add	%g4,	%g2,	%l5
	nop
	set	0x2C, %l0
	ldsh	[%l7 + %l0],	%g6
	nop
	set	0x68, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x2C, %g4
	ldsw	[%l7 + %g4],	%g1
	ld	[%l7 + 0x68],	%f26
	set	0x40, %i0
	stba	%i2,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x14, %o6
	lda	[%l7 + %o6] 0x80,	%f15
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%g7
	nop
	set	0x51, %i7
	ldsb	[%l7 + %i7],	%o7
	nop
	set	0x29, %g5
	ldub	[%l7 + %g5],	%i4
	nop
	set	0x28, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%l2
	ld	[%l7 + 0x58],	%f7
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x24, %i6
	prefetch	[%l7 + %i6],	 1
	nop
	set	0x23, %o1
	stb	%o5,	[%l7 + %o1]
	set	0x40, %g1
	stda	%g2,	[%l7 + %g1] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o4
	set	0x6C, %l6
	stwa	%o1,	[%l7 + %l6] 0x80
	set	0x08, %i3
	stxa	%l2,	[%l7 + %i3] 0x81
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x89,	 4
	nop
	set	0x40, %i1
	std	%f30,	[%l7 + %i1]
	add	%i5,	%o6,	%l4
	set	0x74, %o3
	stwa	%o2,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xeb,	%o2
	nop
	set	0x40, %l1
	stw	%g5,	[%l7 + %l1]
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%o0
	st	%f4,	[%l7 + 0x28]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%i2
	set	0x60, %o5
	stwa	%i7,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x2A, %i4
	ldsh	[%l7 + %i4],	%i1
	set	0x4C, %o4
	stwa	%g4,	[%l7 + %o4] 0x80
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%l5
	set	0x68, %l2
	swapa	[%l7 + %l2] 0x80,	%l0
	nop
	set	0x42, %o2
	stb	%g6,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x60]
	set	0x38, %g3
	lda	[%l7 + %g3] 0x80,	%f24
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%l0
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x10, %g6
	ldsb	[%l7 + %g6],	%i2
	nop
	nop
	setx	0x9324198E7DDEA7CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEAE38CE29D468C36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f22
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%g7
	nop
	set	0x09, %l0
	stb	%i6,	[%l7 + %l0]
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%o7
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%i4
	set	0x38, %i0
	ldxa	[%l7 + %i0] 0x88,	%o5
	set	0x5B, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l3
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd0,	%f16
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%i6
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%g2
	set	0x50, %g5
	swapa	[%l7 + %g5] 0x88,	%o4
	nop
	set	0x19, %i6
	ldub	[%l7 + %i6],	%o1
	add	%i0,	%l2,	%o6
	set	0x0E, %o1
	stba	%i5,	[%l7 + %o1] 0x89
	nop
	set	0x10, %l6
	swap	[%l7 + %l6],	%o2
	set	0x40, %i3
	stda	%l4,	[%l7 + %i3] 0x88
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x88,	%o3
	nop
	set	0x37, %i1
	ldstub	[%l7 + %i1],	%o0
	nop
	set	0x58, %g1
	stx	%g5,	[%l7 + %g1]
	nop
	set	0x5C, %i2
	stw	%i3,	[%l7 + %i2]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i7
	nop
	set	0x50, %l1
	std	%g2,	[%l7 + %l1]
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 0
	add	%l5,	%l0,	%g6
	fpadd16s	%f12,	%f18,	%f8
	nop
	set	0x44, %i5
	stw	%l1,	[%l7 + %i5]
	nop
	set	0x08, %g2
	swap	[%l7 + %g2],	%g4
	nop
	set	0x20, %o5
	std	%f0,	[%l7 + %o5]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd2,	%f16
	fpsub16	%f6,	%f2,	%f8
	set	0x70, %l2
	stwa	%i2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%g6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f16
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f16
	nop
	set	0x32, %o7
	sth	%i6,	[%l7 + %o7]
	nop
	set	0x08, %g6
	stx	%o7,	[%l7 + %g6]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f0
	set	0x2F, %l5
	ldstuba	[%l7 + %l5] 0x89,	%g1
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc2
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x89,	%i4
	set	0x74, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o5
	set	0x10, %o6
	swapa	[%l7 + %o6] 0x89,	%l3
	or	%l6,	%o4,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%l2
	and	%o1,	%o6,	%o2
	set	0x50, %g7
	stxa	%i5,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x30, %i7
	stda	%o2,	[%l7 + %i7] 0x88
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%l4
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x14, %o0
	lda	[%l7 + %o0] 0x80,	%f14
	set	0x14, %l6
	stwa	%o0,	[%l7 + %l6] 0xe2
	membar	#Sync
	bleu	%icc,	loop_3
	nop
	set	0x40, %i3
	stx	%g5,	[%l7 + %i3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%i7
loop_3:
	wr	%i1,	%g2,	%clear_softint
	fpsub16	%f4,	%f0,	%f6
	nop
	set	0x09, %o1
	ldub	[%l7 + %o1],	%l5
	set	0x68, %i1
	ldxa	[%l7 + %i1] 0x81,	%l0
	set	0x18, %g1
	stxa	%g6,	[%l7 + %g1] 0x80
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x79, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l1
	nop
	set	0x1C, %l1
	ldsw	[%l7 + %l1],	%i2
	add	%g7,	%g4,	%i6
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%o6
	fpsub32s	%f15,	%f0,	%f6
	nop
	set	0x68, %i5
	std	%f16,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x5C]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%o5
	nop
	set	0x57, %o5
	ldstub	[%l7 + %o5],	%l3
	set	0x57, %g2
	stba	%l6,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x81,	 3
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	bl,a,pn	%xcc,	loop_4
	add	%g3,	%g1,	%l2
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x80,	%f1
loop_4:
	nop
	set	0x18, %i4
	std	%f24,	[%l7 + %i4]
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%o1
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x80,	%o6
	fpadd32	%f24,	%f8,	%f4
	add	%o2,	%i5,	%o3
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x89,	%f4
	set	0x4C, %l0
	lda	[%l7 + %l0] 0x81,	%f12
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x89,	%i0
	nop
	set	0x1C, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x76, %l3
	ldub	[%l7 + %l3],	%o0
	set	0x34, %i0
	lda	[%l7 + %i0] 0x88,	%f29
	set	0x30, %o6
	stwa	%l4,	[%l7 + %o6] 0x88
	nop
	set	0x5B, %g7
	ldub	[%l7 + %g7],	%i3
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x48, %i7
	lduh	[%l7 + %i7],	%g5
	nop
	set	0x78, %i6
	prefetch	[%l7 + %i6],	 1
	or	%i7,	%g2,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%l0
	nop
	set	0x2C, %l6
	sth	%g6,	[%l7 + %l6]
	nop
	set	0x72, %i3
	ldsh	[%l7 + %i3],	%i2
	set	0x33, %o1
	stba	%g7,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%g4
	and	%o7,	%i6,	%i4
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x88,	%o5
	set	0x30, %o0
	stda	%l2,	[%l7 + %o0] 0x89
	nop
	set	0x20, %i2
	std	%i6,	[%l7 + %i2]
	st	%f8,	[%l7 + 0x44]
	nop
	set	0x28, %l4
	std	%f2,	[%l7 + %l4]
	set	0x70, %g1
	stda	%g2,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x0E, %l1
	stb	%g1,	[%l7 + %l1]
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%f16
	nop
	set	0x20, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x5A, %g2
	stb	%o1,	[%l7 + %g2]
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%o6
	nop
	set	0x7A, %o2
	lduh	[%l7 + %o2],	%o4
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x88,	%o2
	nop
	set	0x10, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x5B, %g3
	ldsb	[%l7 + %g3],	%i5
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x5C, %g6
	stha	%i0,	[%l7 + %g6] 0x89
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%l4
	set	0x20, %l5
	stxa	%o0,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x20, %l0
	stwa	%i3,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x08, %g4
	std	%f2,	[%l7 + %g4]
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%i7
	set	0x74, %o6
	stha	%g5,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x0E, %i0
	lduh	[%l7 + %i0],	%i1
	nop
	set	0x30, %g7
	ldsw	[%l7 + %g7],	%g2
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x08, %g5
	lduw	[%l7 + %g5],	%l5
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc0
	nop
	set	0x50, %l6
	stx	%g6,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	nop
	set	0x40, %i6
	std	%f30,	[%l7 + %i6]
	nop
	set	0x10, %i1
	stb	%l0,	[%l7 + %i1]
	nop
	set	0x74, %o1
	ldsw	[%l7 + %o1],	%g7
	add	%l1,	%i2,	%o7
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%i6
	set	0x65, %i2
	stba	%i4,	[%l7 + %i2] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%l3
	or	%g4,	%g3,	%l6
	nop
	set	0x0F, %l4
	ldub	[%l7 + %l4],	%l2
	nop
	set	0x28, %l1
	ldsw	[%l7 + %l1],	%g1
	nop
	set	0x30, %g1
	stb	%o1,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x28]
	ld	[%l7 + 0x14],	%f28
	fpsub16s	%f15,	%f15,	%f7
	nop
	nop
	setx	0xB0705D8D13256BBF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x16AFACD6E91ADD95,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f10,	%f0
	nop
	set	0x6C, %o5
	ldstub	[%l7 + %o5],	%o6
	nop
	set	0x60, %g2
	stx	%o4,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x6C]
	add	%o2,	%i0,	%o3
	or	%i5,	%l4,	%i3
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o0
	add	%i7,	%g5,	%i1
	nop
	set	0x54, %o2
	stb	%l5,	[%l7 + %o2]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%l0
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f28
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%g2
	nop
	set	0x1C, %l2
	prefetch	[%l7 + %l2],	 3
	st	%f15,	[%l7 + 0x3C]
	add	%g7,	%i2,	%o7
	nop
	set	0x6A, %o4
	sth	%i6,	[%l7 + %o4]
	nop
	set	0x76, %g3
	ldsh	[%l7 + %g3],	%l1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc2
	nop
	set	0x5E, %l5
	stb	%o5,	[%l7 + %l5]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%i4
	wr	%g3,	%l6,	%sys_tick
	nop
	set	0x65, %o7
	stb	%g4,	[%l7 + %o7]
	nop
	set	0x47, %g4
	ldsb	[%l7 + %g4],	%g1
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f18
	nop
	set	0x30, %l3
	std	%l2,	[%l7 + %l3]
	set	0x3E, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o1
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	nop
	set	0x0B, %i0
	stb	%o6,	[%l7 + %i0]
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f31
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%o2
	set	0x78, %i7
	ldxa	[%l7 + %i7] 0x81,	%o4
	nop
	set	0x53, %i6
	stb	%i0,	[%l7 + %i6]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f16
	set	0x7D, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i5
	nop
	set	0x28, %i2
	ldsw	[%l7 + %i2],	%l4
	nop
	set	0x0A, %o0
	stb	%i3,	[%l7 + %o0]
	set	0x09, %l1
	stba	%o3,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%o0,	%i7,	%i1
	nop
	set	0x5F, %g1
	ldub	[%l7 + %g1],	%l5
	nop
	set	0x10, %l4
	stx	%g6,	[%l7 + %l4]
	nop
	set	0x10, %g2
	stx	%l0,	[%l7 + %g2]
	set	0x78, %o5
	lda	[%l7 + %o5] 0x89,	%f7
	set	0x14, %i5
	sta	%f26,	[%l7 + %i5] 0x88
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x88,	%g4
	nop
	set	0x2C, %i4
	stw	%g2,	[%l7 + %i4]
	set	0x54, %l2
	stha	%g7,	[%l7 + %l2] 0x81
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xe2,	%i6
	fpadd32	%f10,	%f18,	%f10
	set	0x18, %g6
	stba	%l1,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x48, %l5
	ldsw	[%l7 + %l5],	%o7
	nop
	set	0x10, %g4
	stw	%o5,	[%l7 + %g4]
	set	0x3F, %o7
	stba	%l3,	[%l7 + %o7] 0x81
	set	0x4B, %l3
	ldstuba	[%l7 + %l3] 0x81,	%g3
	add	%l6,	%i4,	%g4
	ld	[%l7 + 0x6C],	%f4
	nop
	set	0x4C, %l0
	ldub	[%l7 + %l0],	%g1
	nop
	set	0x28, %g7
	std	%l2,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x60, %o6
	ldsh	[%l7 + %o6],	%o1
	set	0x14, %i0
	lda	[%l7 + %i0] 0x81,	%f27
	nop
	set	0x68, %l6
	swap	[%l7 + %l6],	%o6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%i0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x6F, %i3
	ldsb	[%l7 + %i3],	%o4
	nop
	set	0x3C, %g5
	swap	[%l7 + %g5],	%l4
	nop
	set	0x6C, %i7
	lduw	[%l7 + %i7],	%i3
	nop
	set	0x45, %i6
	stb	%o3,	[%l7 + %i6]
	add	%i5,	%i7,	%i1
	nop
	set	0x48, %o1
	std	%f10,	[%l7 + %o1]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf1
	membar	#Sync
	nop
	set	0x22, %i1
	stb	%l0,	[%l7 + %i1]
	st	%f17,	[%l7 + 0x14]
	ld	[%l7 + 0x20],	%f5
	wr	%g6,	%g5,	%ccr
	nop
	set	0x60, %o0
	ldx	[%l7 + %o0],	%g7
	nop
	set	0x5C, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x08, %l4
	stxa	%g2,	[%l7 + %l4] 0x89
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%i2
	set	0x18, %i5
	stha	%l1,	[%l7 + %i5] 0x88
	wr	%o7,	%l3,	%softint
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%o5
	nop
	set	0x28, %i4
	stw	%g3,	[%l7 + %i4]
	nop
	set	0x60, %o2
	stw	%i4,	[%l7 + %o2]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%l6
	nop
	set	0x58, %o4
	std	%l2,	[%l7 + %o4]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc8
	nop
	set	0x18, %g6
	stx	%o1,	[%l7 + %g6]
	add	%g1,	%o2,	%o6
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x89,	%i0
	nop
	set	0x4A, %o3
	lduh	[%l7 + %o3],	%l4
	add	%i3,	%o4,	%o3
	nop
	set	0x64, %g4
	stb	%i5,	[%l7 + %g4]
	nop
	set	0x10, %l5
	std	%i0,	[%l7 + %l5]
	set	0x64, %l3
	stwa	%l5,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x40, %o7
	stx	%i7,	[%l7 + %o7]
	set	0x28, %g7
	stxa	%o0,	[%l7 + %g7] 0x81
	st	%fsr,	[%l7 + 0x58]
	st	%f8,	[%l7 + 0x40]
	bg	%icc,	loop_5
	nop
	set	0x60, %o6
	std	%g6,	[%l7 + %o6]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%g7
loop_5:
	nop
	set	0x50, %i0
	swap	[%l7 + %i0],	%l0
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x80,	%g2
	nop
	set	0x3E, %l0
	sth	%i6,	[%l7 + %l0]
	nop
	set	0x68, %g5
	swap	[%l7 + %g5],	%l1
	set	0x50, %i3
	stda	%i2,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x88,	%l3
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x58, %i6
	swap	[%l7 + %i6],	%o7
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%o5
	nop
	set	0x30, %o0
	std	%f14,	[%l7 + %o0]
	set	0x18, %i1
	stda	%i4,	[%l7 + %i1] 0x80
	or	%g4,	%l6,	%l2
	nop
	set	0x68, %g1
	std	%o0,	[%l7 + %g1]
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x80,	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x48, %l1
	stxa	%i0,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	nop
	set	0x74, %o5
	prefetch	[%l7 + %o5],	 2
	or	%o6,	%l4,	%i3
	st	%f13,	[%l7 + 0x2C]
	nop
	set	0x68, %i5
	lduw	[%l7 + %i5],	%o3
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f18
	nop
	set	0x5A, %o4
	ldsh	[%l7 + %o4],	%i5
	set	0x48, %i4
	lda	[%l7 + %i4] 0x80,	%f25
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x88,	%o4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i7
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x28, %o3
	std	%o0,	[%l7 + %o3]
	and	%g6,	%g5,	%g7
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x22, %g4
	sth	%i1,	[%l7 + %g4]
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x81,	%l0
	set	0x30, %l3
	stda	%i6,	[%l7 + %l3] 0x81
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	st	%f25,	[%l7 + 0x68]
	set	0x70, %g7
	stxa	%l1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x80
	fpsub32	%f18,	%f6,	%f2
	nop
	set	0x60, %i0
	std	%f22,	[%l7 + %i0]
	fpsub16	%f30,	%f10,	%f22
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x80,	%i2
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x81,	 3
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xca
	nop
	set	0x2E, %i3
	lduh	[%l7 + %i3],	%l3
	set	0x68, %i7
	stda	%o6,	[%l7 + %i7] 0x80
	set	0x28, %o1
	lda	[%l7 + %o1] 0x89,	%f15
	set	0x30, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o5
	set	0x78, %l0
	stxa	%g4,	[%l7 + %l0] 0x89
	set	0x0C, %i2
	lda	[%l7 + %i2] 0x80,	%f12
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%l2
	nop
	set	0x17, %i1
	ldsb	[%l7 + %i1],	%l6
	nop
	set	0x10, %o0
	stb	%o1,	[%l7 + %o0]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	nop
	set	0x6C, %g1
	prefetch	[%l7 + %g1],	 1
	nop
	set	0x70, %l1
	swap	[%l7 + %l1],	%g1
	set	0x42, %g2
	stba	%g3,	[%l7 + %g2] 0x89
	nop
	set	0x70, %o5
	stb	%i0,	[%l7 + %o5]
	nop
	set	0x38, %i5
	swap	[%l7 + %i5],	%o6
	nop
	set	0x18, %o4
	sth	%l4,	[%l7 + %o4]
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%i3
	fpadd32s	%f30,	%f10,	%f25
	st	%f4,	[%l7 + 0x70]
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%f22,	[%l7 + 0x5C]
	nop
	set	0x10, %l2
	ldsw	[%l7 + %l2],	%o2
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%i4
	fpsub16s	%f12,	%f0,	%f23
	wr	%o4,	%l5,	%clear_softint
	nop
	set	0x24, %i4
	ldstub	[%l7 + %i4],	%o3
	nop
	set	0x66, %l5
	sth	%i7,	[%l7 + %l5]
	nop
	set	0x0E, %l3
	lduh	[%l7 + %l3],	%g6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%g7
	set	0x66, %o7
	stha	%o0,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x50, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x64, %g7
	stb	%l0,	[%l7 + %g7]
	set	0x70, %i0
	prefetcha	[%l7 + %i0] 0x88,	 1
	set	0x28, %l6
	stxa	%l1,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%i2
	st	%f27,	[%l7 + 0x5C]
	and	%g2,	%i6,	%o7
	set	0x58, %i3
	stwa	%l3,	[%l7 + %i3] 0x88
	nop
	set	0x78, %g3
	stx	%o5,	[%l7 + %g3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%o1
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%i6
	set	0x18, %i6
	stxa	%g3,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x34, %l0
	sta	%f21,	[%l7 + %l0] 0x81
	nop
	set	0x3A, %i2
	lduh	[%l7 + %i2],	%g1
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x81,	%i0
	nop
	set	0x4C, %i1
	ldsh	[%l7 + %i1],	%o6
	nop
	set	0x24, %o0
	stw	%l4,	[%l7 + %o0]
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%i3
	fpsub32	%f28,	%f22,	%f20
	nop
	set	0x7C, %l1
	swap	[%l7 + %l1],	%o2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd8,	%f16
	set	0x60, %g2
	lda	[%l7 + %g2] 0x89,	%f13
	nop
	set	0x48, %o5
	stx	%o4,	[%l7 + %o5]
	nop
	set	0x28, %o4
	swap	[%l7 + %o4],	%l5
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%i4
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x88,	%o2
	st	%fsr,	[%l7 + 0x38]
	set	0x5C, %l2
	swapa	[%l7 + %l2] 0x81,	%g6
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x89,	%f0
	set	0x6D, %o2
	stba	%g5,	[%l7 + %o2] 0xe3
	membar	#Sync
	wr	%g7,	%i7,	%pic
	fpadd16s	%f9,	%f28,	%f21
	set	0x60, %i4
	stda	%o0,	[%l7 + %i4] 0x81
	nop
	set	0x40, %l3
	stx	%l0,	[%l7 + %l3]
	nop
	set	0x20, %g4
	std	%f4,	[%l7 + %g4]
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%l1
	nop
	set	0x52, %o7
	lduh	[%l7 + %o7],	%i1
	bge,pn	%icc,	loop_6
	add	%i2,	%i6,	%g2
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
loop_6:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l3
	ld	[%l7 + 0x50],	%f8
	ld	[%l7 + 0x24],	%f14
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x50, %i0
	stw	%g4,	[%l7 + %i0]
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f26
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x81,	 1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%l6
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f28
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%g3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xe2,	%i4
	set	0x4C, %l0
	swapa	[%l7 + %l0] 0x89,	%i0
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x89,	%g1
	or	%o6,	%i3,	%o2
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%l4
	set	0x5C, %i1
	sta	%f23,	[%l7 + %i1] 0x88
	set	0x30, %o1
	stda	%o4,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x48, %o0
	ldx	[%l7 + %o0],	%l5
	set	0x14, %l4
	stha	%o3,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x58, %l1
	lduw	[%l7 + %l1],	%i5
	add	%g5,	%g6,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%l0
	nop
	set	0x0C, %g1
	lduh	[%l7 + %g1],	%l1
	nop
	set	0x34, %g2
	lduh	[%l7 + %g2],	%g7
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f22
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%i1
	set	0x74, %g6
	swapa	[%l7 + %g6] 0x81,	%i6
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x80,	%g2
	nop
	set	0x6C, %o3
	swap	[%l7 + %o3],	%i2
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f0
	nop
	set	0x6C, %i4
	lduh	[%l7 + %i4],	%o5
	nop
	set	0x1C, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x28, %l5
	stb	%o7,	[%l7 + %l5]
	fpsub16	%f6,	%f26,	%f2
	nop
	set	0x4C, %o7
	stw	%l3,	[%l7 + %o7]
	nop
	set	0x40, %o6
	std	%f22,	[%l7 + %o6]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o1
	set	0x40, %l3
	lda	[%l7 + %l3] 0x89,	%f8
	nop
	set	0x10, %g7
	swap	[%l7 + %g7],	%l6
	set	0x78, %l6
	stda	%g2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x70, %i0
	std	%f14,	[%l7 + %i0]
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%i4
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x89
	nop
	set	0x64, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x54, %l0
	stb	%i0,	[%l7 + %l0]
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f12
	set	0x38, %i2
	stwa	%g4,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x73, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g1
	set	0x52, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i3
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x6C, %l4
	swapa	[%l7 + %l4] 0x89,	%o6
	set	0x3D, %l1
	stba	%l4,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x44, %g1
	swapa	[%l7 + %g1] 0x80,	%o4
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x20, %g2
	swap	[%l7 + %g2],	%l5
	nop
	set	0x3C, %o5
	swap	[%l7 + %o5],	%o2
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%i5
	nop
	set	0x40, %o0
	stw	%o3,	[%l7 + %o0]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%i7
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f0
	wr	%g5,	%l0,	%softint
	wr	%l1,	%o0,	%sys_tick
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x80
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x89,	%f4
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x66, %o2
	ldsh	[%l7 + %o2],	%g7
	or	%i2,	%o5,	%o7
	set	0x38, %i4
	stha	%g2,	[%l7 + %i4] 0x88
	wr	%l3,	%o1,	%clear_softint
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xeb,	%l2
	set	0x7C, %l5
	sta	%f27,	[%l7 + %l5] 0x80
	set	0x40, %o7
	stda	%g2,	[%l7 + %o7] 0x89
	or	%i4,	%l6,	%g4
	set	0x10, %o6
	stxa	%g1,	[%l7 + %o6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	nop
	nop
	setx	0xD53447EFDD4553FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x6C50C0B76196804F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f12
	nop
	set	0x30, %l6
	std	%f18,	[%l7 + %l6]
	nop
	set	0x56, %g5
	lduh	[%l7 + %g5],	%o6
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xcc
	nop
	set	0x70, %i0
	stw	%i3,	[%l7 + %i0]
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f12
	or	%l4,	%l5,	%o2
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x80,	%o4
	nop
	set	0x5C, %i2
	lduw	[%l7 + %i2],	%o3
	set	0x08, %i6
	stda	%g6,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x4B, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i7
	set	0x16, %i7
	stha	%g5,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x14, %l4
	ldub	[%l7 + %l4],	%i5
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%l0
	set	0x3C, %o1
	stha	%o0,	[%l7 + %o1] 0x89
	wr	%l1,	%i6,	%ccr
	nop
	set	0x34, %g1
	ldsw	[%l7 + %g1],	%i1
	or	%g7,	%i2,	%o7
	add	%g2,	%o5,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%i4
	or	%l6,	%g3,	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i0
	nop
	set	0x5C, %o5
	stw	%i3,	[%l7 + %o5]
	set	0x0C, %i5
	lda	[%l7 + %i5] 0x80,	%f6
	nop
	set	0x32, %o0
	lduh	[%l7 + %o0],	%l4
	and	%l5,	%o6,	%o4
	st	%f1,	[%l7 + 0x20]
	st	%f26,	[%l7 + 0x34]
	set	0x6B, %l2
	stba	%o3,	[%l7 + %l2] 0x80
	nop
	set	0x28, %o3
	ldub	[%l7 + %o3],	%g6
	set	0x60, %g6
	stda	%o2,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x28, %o2
	sta	%f19,	[%l7 + %o2] 0x80
	set	0x70, %i4
	stxa	%i7,	[%l7 + %i4] 0x81
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x88,	 0
	wr	%l0,	%l1,	%clear_softint
	nop
	set	0x32, %o4
	lduh	[%l7 + %o4],	%i6
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f22
	nop
	set	0x24, %g7
	ldstub	[%l7 + %g7],	%o0
	nop
	set	0x2A, %o7
	lduh	[%l7 + %o7],	%i1
	set	0x3B, %l3
	stba	%g7,	[%l7 + %l3] 0x88
	nop
	set	0x7C, %l6
	lduh	[%l7 + %l6],	%o7
	set	0x08, %g5
	stda	%g2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x40, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%o5
	nop
	set	0x78, %l0
	swap	[%l7 + %l0],	%i2
	nop
	set	0x0C, %i0
	lduh	[%l7 + %i0],	%l3
	set	0x68, %i2
	swapa	[%l7 + %i2] 0x88,	%o1
	st	%f12,	[%l7 + 0x58]
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f8
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%i4
	set	0x44, %l4
	lda	[%l7 + %l4] 0x81,	%f30
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%f2
	nop
	set	0x60, %o1
	stw	%l2,	[%l7 + %o1]
	nop
	set	0x48, %g1
	prefetch	[%l7 + %g1],	 0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f0
	set	0x0E, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g3
	nop
	set	0x0C, %i7
	ldsw	[%l7 + %i7],	%g4
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	fpsub16	%f22,	%f20,	%f24
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f30
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%i6
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x80,	%i0
	fpsub16	%f0,	%f10,	%f26
	set	0x14, %o3
	swapa	[%l7 + %o3] 0x80,	%g1
	nop
	set	0x18, %i4
	ldstub	[%l7 + %i4],	%i3
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%l4
	ld	[%l7 + 0x38],	%f27
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x81,	%o6
	nop
	set	0x78, %l5
	std	%f20,	[%l7 + %l5]
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%l5
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%f18
	set	0x50, %o6
	stda	%o2,	[%l7 + %o6] 0xea
	membar	#Sync
	add	%o4,	%o2,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i5
	ld	[%l7 + 0x4C],	%f18
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%g4
	add	%l0,	%i6,	%o0
	nop
	set	0x44, %l6
	prefetch	[%l7 + %l6],	 0
	set	0x28, %l3
	stha	%i1,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x1D, %i3
	ldub	[%l7 + %i3],	%g7
	ld	[%l7 + 0x50],	%f21
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x80,	%l0
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x88,	%o7
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	set	0x78, %i2
	stda	%g2,	[%l7 + %i2] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf1,	%f0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%i2
	set	0x14, %i1
	stwa	%i4,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x48, %l4
	stxa	%o1,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x53, %l1
	ldsb	[%l7 + %l1],	%l2
	fpsub32	%f20,	%f20,	%f30
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x0A, %i6
	stba	%g4,	[%l7 + %i6] 0x89
	and	%g3,	%l6,	%g1
	set	0x20, %g2
	lda	[%l7 + %g2] 0x89,	%f14
	set	0x0A, %o5
	stba	%i0,	[%l7 + %o5] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%l4
	nop
	set	0x20, %i7
	ldx	[%l7 + %i7],	%o6
	set	0x3E, %o0
	stha	%o3,	[%l7 + %o0] 0x81
	nop
	set	0x4E, %g1
	stb	%o4,	[%l7 + %g1]
	fpadd32s	%f7,	%f30,	%f5
	set	0x1C, %i5
	stwa	%l5,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x5B, %g6
	ldub	[%l7 + %g6],	%g6
	nop
	set	0x3C, %o3
	lduw	[%l7 + %o3],	%i7
	add	%i5,	%g5,	%o2
	nop
	set	0x1E, %i4
	lduh	[%l7 + %i4],	%l0
	ld	[%l7 + 0x2C],	%f10
	set	0x20, %o2
	swapa	[%l7 + %o2] 0x89,	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%i1
	nop
	set	0x0E, %l2
	ldsh	[%l7 + %l2],	%g7
	nop
	set	0x10, %l5
	stx	%l1,	[%l7 + %l5]
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x81,	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%g2
	nop
	set	0x4A, %g7
	ldsb	[%l7 + %g7],	%l3
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x89,	 4
	nop
	set	0x18, %o7
	lduh	[%l7 + %o7],	%i4
	fpadd32s	%f3,	%f28,	%f10
	set	0x70, %g4
	stda	%l2,	[%l7 + %g4] 0xea
	membar	#Sync
	add	%o1,	%g4,	%g3
	nop
	set	0x1E, %l6
	stb	%l6,	[%l7 + %l6]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xeb,	%g0
	nop
	set	0x70, %l3
	std	%i0,	[%l7 + %l3]
	nop
	set	0x58, %g5
	prefetch	[%l7 + %g5],	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%l4
	nop
	set	0x60, %l0
	prefetch	[%l7 + %l0],	 3
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x54, %g3
	ldsw	[%l7 + %g3],	%o6
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%o2
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x80,	 4
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x89
	set	0x78, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l5
	set	0x50, %i6
	stda	%i6,	[%l7 + %i6] 0x89
	nop
	set	0x1F, %g2
	ldub	[%l7 + %g2],	%i5
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf0
	membar	#Sync
	set	0x20, %i7
	stda	%g4,	[%l7 + %i7] 0x80
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%l0
	nop
	set	0x6C, %o0
	ldsb	[%l7 + %o0],	%o2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	set	0x78, %g6
	lda	[%l7 + %g6] 0x89,	%f6
	nop
	set	0x6C, %g1
	sth	%i6,	[%l7 + %g1]
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%o0
	and	%i1,	%l1,	%o5
	add	%o7,	%g7,	%l3
	set	0x20, %o2
	stda	%g2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f16
	set	0x1C, %l5
	stha	%i4,	[%l7 + %l5] 0x81
	st	%f19,	[%l7 + 0x60]
	set	0x10, %l2
	stxa	%l2,	[%l7 + %l2] 0x88
	nop
	set	0x30, %g7
	stx	%o1,	[%l7 + %g7]
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%f6
	set	0x54, %o7
	stba	%g4,	[%l7 + %o7] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f16
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe2,	%i2
	and	%g3,	%l6,	%i0
	ld	[%l7 + 0x5C],	%f22
	nop
	set	0x1C, %g4
	stb	%i3,	[%l7 + %g4]
	fpadd32	%f30,	%f12,	%f12
	nop
	set	0x6E, %l3
	ldub	[%l7 + %l3],	%g1
	set	0x38, %i3
	sta	%f23,	[%l7 + %i3] 0x89
	nop
	set	0x40, %g5
	stw	%l4,	[%l7 + %g5]
	st	%f11,	[%l7 + 0x34]
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x50, %i0
	stx	%o6,	[%l7 + %i0]
	and	%o4,	%o3,	%i7
	nop
	set	0x70, %l0
	swap	[%l7 + %l0],	%l5
	nop
	set	0x08, %i1
	std	%i4,	[%l7 + %i1]
	and	%g6,	%l0,	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%i6
	st	%f13,	[%l7 + 0x64]
	set	0x4A, %l4
	stha	%i1,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x28, %l1
	ldsw	[%l7 + %l1],	%l1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f16
	set	0x78, %g2
	lda	[%l7 + %g2] 0x81,	%f23
	nop
	set	0x26, %i2
	stb	%o0,	[%l7 + %i2]
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x89,	%o7
	nop
	set	0x38, %o5
	stx	%g7,	[%l7 + %o5]
	nop
	set	0x16, %o0
	sth	%o5,	[%l7 + %o0]
	nop
	set	0x10, %g6
	std	%f28,	[%l7 + %g6]
	add	%l3,	%i4,	%g2
	set	0x6C, %i5
	sta	%f8,	[%l7 + %i5] 0x80
	nop
	set	0x1E, %g1
	sth	%o1,	[%l7 + %g1]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xda
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%i2
	nop
	set	0x34, %o3
	sth	%g4,	[%l7 + %o3]
	nop
	nop
	setx	0x43759CAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x4B5343BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f11,	%f30
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%l6
	fpadd16s	%f15,	%f18,	%f29
	set	0x34, %o2
	sta	%f5,	[%l7 + %o2] 0x81
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xeb,	%i2
	set	0x7E, %l2
	stha	%g1,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f18
	nop
	set	0x78, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l4,	%i0,	%o4
	nop
	set	0x60, %o6
	lduh	[%l7 + %o6],	%o6
	nop
	set	0x7C, %o7
	ldsw	[%l7 + %o7],	%o3
	nop
	set	0x68, %g4
	lduh	[%l7 + %g4],	%i7
	ld	[%l7 + 0x74],	%f19
	nop
	set	0x4C, %l3
	swap	[%l7 + %l3],	%i5
	nop
	set	0x60, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x52, %i3
	ldstub	[%l7 + %i3],	%l5
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x30, %g3
	std	%f12,	[%l7 + %g3]
	set	0x74, %g5
	stwa	%l0,	[%l7 + %g5] 0x80
	wr	%g6,	%o2,	%clear_softint
	nop
	set	0x75, %l0
	ldub	[%l7 + %l0],	%g5
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x50, %i0
	stx	%i1,	[%l7 + %i0]
	nop
	set	0x55, %o1
	stb	%i6,	[%l7 + %o1]
	or	%o0,	%o7,	%g7
	set	0x54, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%o5
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%g2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%l2
	nop
	set	0x0A, %l4
	sth	%i2,	[%l7 + %l4]
	set	0x6D, %g2
	stba	%i4,	[%l7 + %g2] 0xe3
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%l6
	set	0x2E, %i7
	stba	%g3,	[%l7 + %i7] 0x81
	nop
	set	0x48, %o5
	stx	%fsr,	[%l7 + %o5]
	and	%i3,	%l4,	%g1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%i0
	set	0x30, %o0
	stda	%o2,	[%l7 + %o0] 0x89
	nop
	set	0x70, %g6
	sth	%i7,	[%l7 + %g6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%o6
	nop
	set	0x1C, %i2
	swap	[%l7 + %i2],	%l5
	and	%l0,	%o2,	%g6
	set	0x14, %i5
	lda	[%l7 + %i5] 0x80,	%f29
	set	0x50, %g1
	stda	%i0,	[%l7 + %g1] 0x88
	ld	[%l7 + 0x58],	%f9
	nop
	set	0x64, %o3
	ldsw	[%l7 + %o3],	%g5
	nop
	set	0x7A, %i4
	ldsh	[%l7 + %i4],	%o0
	nop
	set	0x0A, %o2
	ldstub	[%l7 + %o2],	%o7
	set	0x1D, %l2
	ldstuba	[%l7 + %l2] 0x81,	%g7
	or	%i6,	%l3,	%o5
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%l0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xca
	ld	[%l7 + 0x6C],	%f30
	nop
	set	0x78, %o6
	std	%f14,	[%l7 + %o6]
	or	%g2,	%l2,	%o1
	set	0x38, %o4
	sta	%f12,	[%l7 + %o4] 0x89
	nop
	set	0x68, %g4
	stx	%i4,	[%l7 + %g4]
	nop
	set	0x48, %l3
	lduw	[%l7 + %l3],	%g4
	st	%f28,	[%l7 + 0x40]
	nop
	set	0x4D, %l6
	stb	%l6,	[%l7 + %l6]
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%i2
	set	0x34, %g3
	stba	%i3,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x54, %i3
	lda	[%l7 + %i3] 0x88,	%f14
	set	0x2E, %g5
	stba	%l4,	[%l7 + %g5] 0x81
	set	0x28, %i1
	sta	%f29,	[%l7 + %i1] 0x89
	fpsub32	%f18,	%f2,	%f22
	nop
	set	0x79, %i0
	stb	%g1,	[%l7 + %i0]
	fpsub16	%f30,	%f18,	%f16
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x5E, %o1
	lduh	[%l7 + %o1],	%o4
	set	0x77, %i6
	stba	%i0,	[%l7 + %i6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x68]
	and	%g3,	%o3,	%i7
	set	0x74, %l1
	stha	%o6,	[%l7 + %l1] 0x88
	st	%fsr,	[%l7 + 0x0C]
	set	0x08, %g2
	stxa	%i5,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x41, %i7
	ldsb	[%l7 + %i7],	%l5
	set	0x0E, %o5
	stha	%l0,	[%l7 + %o5] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%o2
	set	0x10, %i2
	stxa	%i1,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x7A, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g5
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf1
	membar	#Sync
	or	%o0,	%g6,	%o7
	be,a	%icc,	loop_7
	nop
	set	0x54, %g1
	swap	[%l7 + %g1],	%i6
	nop
	set	0x1C, %o3
	lduw	[%l7 + %o3],	%g7
	nop
	set	0x6C, %i4
	lduw	[%l7 + %i4],	%l3
loop_7:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%o5
	bne,pt	%icc,	loop_8
	nop
	set	0x58, %o2
	lduh	[%l7 + %o2],	%g2
	nop
	set	0x08, %l2
	stb	%o1,	[%l7 + %l2]
	set	0x26, %g7
	stha	%l2,	[%l7 + %g7] 0xea
	membar	#Sync
loop_8:
	nop
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x88,	 0
	nop
	set	0x08, %o4
	std	%f24,	[%l7 + %o4]
	add	%i4,	%l6,	%i3
	nop
	set	0x3D, %g4
	stb	%i2,	[%l7 + %g4]
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%g1
	nop
	set	0x78, %l3
	std	%f0,	[%l7 + %l3]
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x88,	%o4
	or	%l4,	%i0,	%o3
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf9
	membar	#Sync
	nop
	set	0x0A, %g3
	stb	%g3,	[%l7 + %g3]
	set	0x0A, %i3
	ldstuba	[%l7 + %i3] 0x89,	%i7
	nop
	set	0x78, %g5
	std	%i4,	[%l7 + %g5]
	and	%l5,	%l0,	%o6
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x89,	%o2
	st	%f3,	[%l7 + 0x30]
	nop
	set	0x66, %l0
	ldsb	[%l7 + %l0],	%i1
	or	%g5,	%g6,	%o7
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%i6
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x5E, %i6
	lduh	[%l7 + %i6],	%g7
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	set	0x28, %g2
	stda	%o0,	[%l7 + %g2] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%l1
	nop
	set	0x48, %o5
	lduw	[%l7 + %o5],	%o5
	set	0x18, %i7
	stda	%o0,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x89,	%l2
	set	0x30, %l4
	stba	%g2,	[%l7 + %l4] 0x80
	nop
	set	0x74, %g6
	swap	[%l7 + %g6],	%i4
	set	0x08, %i5
	swapa	[%l7 + %i5] 0x80,	%l6
	nop
	set	0x58, %g1
	ldsh	[%l7 + %g1],	%g4
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x80,	%i2
	set	0x3C, %i2
	stwa	%g1,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x28, %i4
	stx	%o4,	[%l7 + %i4]
	nop
	set	0x20, %l2
	stw	%l4,	[%l7 + %l2]
	set	0x14, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i2
	set	0x68, %o2
	lda	[%l7 + %o2] 0x89,	%f25
	set	0x4C, %o4
	swapa	[%l7 + %o4] 0x89,	%i0
	or	%o3,	%g3,	%i5
	set	0x40, %l5
	stda	%i6,	[%l7 + %l5] 0x81
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x89,	%f26
	nop
	set	0x32, %l3
	lduh	[%l7 + %l3],	%l5
	nop
	set	0x68, %o6
	std	%l0,	[%l7 + %o6]
	nop
	set	0x4A, %o7
	ldsh	[%l7 + %o7],	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%g5
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x48, %l6
	sth	%g6,	[%l7 + %l6]
	set	0x68, %g3
	stda	%o6,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x40, %g5
	std	%i6,	[%l7 + %g5]
	nop
	set	0x38, %i0
	ldx	[%l7 + %i0],	%g7
	set	0x70, %l0
	sta	%f12,	[%l7 + %l0] 0x80
	set	0x1A, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o0
	nop
	set	0x73, %i3
	ldsb	[%l7 + %i3],	%l3
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f0
	nop
	set	0x1C, %o5
	prefetch	[%l7 + %o5],	 4
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f0
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0
	nop
	set	0x77, %g6
	ldsb	[%l7 + %g6],	%o1
	nop
	set	0x12, %i5
	ldsh	[%l7 + %i5],	%o5
	nop
	set	0x20, %l4
	std	%f0,	[%l7 + %l4]
	or	%g2,	%i4,	%l6
	set	0x60, %o3
	stxa	%g4,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x57, %i2
	ldsb	[%l7 + %i2],	%i3
	set	0x68, %i4
	sta	%f19,	[%l7 + %i4] 0x88
	nop
	set	0x18, %l2
	std	%f18,	[%l7 + %l2]
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%l2
	nop
	set	0x54, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%g0
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%o4
	set	0x7C, %g4
	stwa	%i2,	[%l7 + %g4] 0xe3
	membar	#Sync
	ld	[%l7 + 0x10],	%f28
	set	0x2C, %o4
	stwa	%l4,	[%l7 + %o4] 0x81
	set	0x7C, %o6
	lda	[%l7 + %o6] 0x81,	%f11
	nop
	nop
	setx	0xC357EB2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x279DA08E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f17,	%f25
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x80,	%o2
	or	%i0,	%g3,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i7
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	st	%f1,	[%l7 + 0x34]
	nop
	set	0x42, %g3
	ldsh	[%l7 + %g3],	%l0
	nop
	set	0x08, %l3
	std	%o6,	[%l7 + %l3]
	nop
	set	0x1B, %i0
	stb	%o2,	[%l7 + %i0]
	nop
	set	0x38, %g5
	std	%g4,	[%l7 + %g5]
	nop
	set	0x74, %o1
	ldsb	[%l7 + %o1],	%g6
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xca
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%g7
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x81,	%o7
	nop
	set	0x38, %l0
	ldsw	[%l7 + %l0],	%o0
	nop
	set	0x2C, %i6
	ldstub	[%l7 + %i6],	%l3
	set	0x74, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i1
	ld	[%l7 + 0x38],	%f22
	nop
	set	0x24, %i7
	stw	%l1,	[%l7 + %i7]
	nop
	set	0x20, %o5
	stx	%o1,	[%l7 + %o5]
	be,a,pt	%icc,	loop_9
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%g2
	nop
	set	0x0B, %g6
	stb	%i4,	[%l7 + %g6]
	set	0x60, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o5
loop_9:
	nop
	set	0x20, %l4
	stx	%l6,	[%l7 + %l4]
	nop
	set	0x14, %i5
	stw	%i3,	[%l7 + %i5]
	nop
	set	0x2C, %o3
	ldsw	[%l7 + %o3],	%l2
	set	0x68, %i2
	sta	%f10,	[%l7 + %i2] 0x80
	set	0x40, %l2
	swapa	[%l7 + %l2] 0x81,	%g4
	bg,a	%icc,	loop_10
	and	%g1,	%o4,	%i2
	nop
	set	0x6C, %i4
	ldsw	[%l7 + %i4],	%l4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
loop_10:
	nop
	set	0x44, %g7
	ldsh	[%l7 + %g7],	%i0
	nop
	set	0x28, %o2
	stw	%g3,	[%l7 + %o2]
	nop
	set	0x0C, %g4
	prefetch	[%l7 + %g4],	 0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%i5
	nop
	set	0x08, %l5
	stx	%l5,	[%l7 + %l5]
	set	0x2C, %o6
	sta	%f12,	[%l7 + %o6] 0x89
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f6
	nop
	set	0x3C, %l6
	sth	%l0,	[%l7 + %l6]
	set	0x08, %g3
	lda	[%l7 + %g3] 0x80,	%f25
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xe2,	%o6
	st	%fsr,	[%l7 + 0x64]
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x80,	%i7
	and	%o2,	%g6,	%i6
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf0
	membar	#Sync
	ld	[%l7 + 0x6C],	%f30
	nop
	set	0x54, %o1
	ldub	[%l7 + %o1],	%g7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xe3,	%o6
	set	0x70, %i1
	stda	%g4,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x56, %l0
	sth	%l3,	[%l7 + %l0]
	nop
	set	0x6C, %i0
	sth	%o0,	[%l7 + %i0]
	nop
	set	0x0A, %i6
	lduh	[%l7 + %i6],	%l1
	set	0x58, %g2
	lda	[%l7 + %g2] 0x81,	%f26
	and	%i1,	%g2,	%i4
	nop
	set	0x78, %o5
	swap	[%l7 + %o5],	%o1
	st	%fsr,	[%l7 + 0x08]
	and	%o5,	%l6,	%l2
	ld	[%l7 + 0x78],	%f6
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%i2
	set	0x78, %o0
	stxa	%g1,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x08, %l1
	stxa	%o4,	[%l7 + %l1] 0xe3
	membar	#Sync
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%l4
	nop
	set	0x46, %g6
	ldsh	[%l7 + %g6],	%i0
	nop
	set	0x7A, %l4
	ldub	[%l7 + %l4],	%i2
	set	0x28, %i5
	stxa	%o3,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x64, %i2
	stwa	%g3,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i5
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%o6
	st	%fsr,	[%l7 + 0x10]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc4
	set	0x3C, %g1
	stha	%l0,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x3B, %g7
	ldstub	[%l7 + %g7],	%i7
	set	0x70, %l2
	sta	%f27,	[%l7 + %l2] 0x80
	nop
	set	0x64, %g4
	sth	%g6,	[%l7 + %g4]
	nop
	set	0x55, %o2
	stb	%o2,	[%l7 + %o2]
	set	0x5E, %l5
	stba	%g7,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x10, %o6
	lduh	[%l7 + %o6],	%o7
	nop
	set	0x30, %o4
	ldsw	[%l7 + %o4],	%g5
	set	0x38, %g3
	stda	%i6,	[%l7 + %g3] 0x88
	set	0x6F, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l3
	nop
	set	0x38, %l6
	std	%f16,	[%l7 + %l6]
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%o0
	set	0x08, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	and	%g2,	%l1,	%o1
	set	0x7C, %i3
	stwa	%i4,	[%l7 + %i3] 0x88
	nop
	set	0x30, %i1
	std	%f20,	[%l7 + %i1]
	st	%f30,	[%l7 + 0x7C]
	nop
	set	0x60, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x23, %i0
	stb	%l6,	[%l7 + %i0]
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%o4
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f0
	nop
	set	0x38, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x6A, %g2
	ldstub	[%l7 + %g2],	%g1
	nop
	set	0x38, %o0
	sth	%o4,	[%l7 + %o0]
	set	0x7F, %i7
	stba	%g4,	[%l7 + %i7] 0xe3
	membar	#Sync
	or	%i3,	%i0,	%l4
	nop
	nop
	setx	0x399CB61A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x86FA6EE5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f21,	%f26
	add	%i2,	%o3,	%l5
	set	0x78, %g6
	lda	[%l7 + %g6] 0x81,	%f16
	fpsub16	%f24,	%f28,	%f2
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%g2
	set	0x0E, %l4
	stha	%i5,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x74, %i2
	sth	%l0,	[%l7 + %i2]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	and	%i7,	%g6,	%o6
	nop
	nop
	setx	0x583D2E5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x1233813B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f12,	%f15
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x88
	set	0x26, %g1
	stha	%o2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x2C, %i5
	swap	[%l7 + %i5],	%o7
	nop
	set	0x74, %g7
	ldstub	[%l7 + %g7],	%g5
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%l3
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f22
	nop
	set	0x5B, %g4
	ldsb	[%l7 + %g4],	%i6
	set	0x66, %o2
	stha	%o0,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%f28
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x80,	%g2
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%o1
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x81,	%i4
	nop
	set	0x18, %o7
	stx	%l1,	[%l7 + %o7]
	add	%o5,	%l6,	%l2
	set	0x19, %g5
	stba	%o4,	[%l7 + %g5] 0x88
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd2
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%g1
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x88
	nop
	set	0x68, %l6
	ldsh	[%l7 + %l6],	%i3
	ld	[%l7 + 0x78],	%f21
	nop
	set	0x2E, %i0
	ldstub	[%l7 + %i0],	%g4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf8
	membar	#Sync
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f22
	set	0x58, %i6
	stxa	%l4,	[%l7 + %i6] 0xeb
	membar	#Sync
	st	%f5,	[%l7 + 0x60]
	fpsub16	%f30,	%f6,	%f2
	nop
	set	0x60, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x6C, %o0
	swap	[%l7 + %o0],	%o3
	nop
	set	0x5E, %g2
	ldsh	[%l7 + %g2],	%i0
	nop
	set	0x74, %i7
	ldsw	[%l7 + %i7],	%g3
	nop
	set	0x3E, %g6
	ldsh	[%l7 + %g6],	%i5
	nop
	nop
	setx	0x06B6C94DA3C74029,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6B7957EBDA70CCCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f18,	%f0
	set	0x38, %l4
	stxa	%l0,	[%l7 + %l4] 0x88
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%l5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%i7
	st	%fsr,	[%l7 + 0x48]
	set	0x0C, %o3
	stwa	%o2,	[%l7 + %o3] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x58]
	ld	[%l7 + 0x10],	%f22
	and	%o7,	%o6,	%g5
	and	%l3,	%g7,	%i6
	fpsub32s	%f16,	%f30,	%f7
	nop
	set	0x1C, %i4
	ldstub	[%l7 + %i4],	%o0
	nop
	set	0x50, %g1
	std	%f24,	[%l7 + %g1]
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x81,	%i1
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x81,	%o1
	set	0x21, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i4
	set	0x08, %l2
	stxa	%g2,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x38],	%f10
	set	0x3C, %o2
	stwa	%o5,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x34, %g4
	lduw	[%l7 + %g4],	%l6
	bleu,pn	%xcc,	loop_11
	and	%l2,	%o4,	%g1
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
loop_11:
	nop
	set	0x38, %l5
	stda	%l0,	[%l7 + %l5] 0x80
	set	0x38, %g3
	lda	[%l7 + %g3] 0x81,	%f30
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f0
	fpadd32	%f28,	%f30,	%f28
	set	0x58, %o7
	stda	%g4,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%i3,	%l4,	%o3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe2,	%i2
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%g3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc8
	nop
	set	0x68, %l6
	swap	[%l7 + %l6],	%i5
	add	%l0,	%i0,	%l5
	set	0x54, %i0
	stha	%i7,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc2
	set	0x5C, %i3
	stha	%g6,	[%l7 + %i3] 0x81
	nop
	set	0x78, %i6
	std	%f16,	[%l7 + %i6]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x80
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x20, %g2
	stda	%o6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x2C, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x3C, %i7
	ldub	[%l7 + %i7],	%o2
	nop
	set	0x38, %l4
	stx	%g5,	[%l7 + %l4]
	nop
	set	0x20, %g6
	std	%l2,	[%l7 + %g6]
	or	%o6,	%g7,	%o0
	nop
	set	0x50, %l1
	stx	%i1,	[%l7 + %l1]
	add	%o1,	%i6,	%g2
	bn,pn	%xcc,	loop_12
	ld	[%l7 + 0x6C],	%f14
	nop
	set	0x74, %i4
	lduw	[%l7 + %i4],	%i4
	set	0x68, %o3
	stba	%l6,	[%l7 + %o3] 0x80
loop_12:
	nop
	set	0x10, %i5
	stx	%l2,	[%l7 + %i5]
	or	%o5,	%o4,	%g1
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x34, %g1
	stw	%l1,	[%l7 + %g1]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc0
	set	0x68, %o2
	swapa	[%l7 + %o2] 0x80,	%i3
	set	0x46, %l2
	stha	%l4,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd0,	%f0
	nop
	set	0x2C, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x0C, %g3
	stwa	%g4,	[%l7 + %g3] 0x80
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%g3
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe2,	%l0
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%i0
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%i5
	nop
	set	0x20, %g5
	stw	%l5,	[%l7 + %g5]
	ld	[%l7 + 0x2C],	%f3
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%i7
	and	%g6,	%o7,	%o2
	ld	[%l7 + 0x20],	%f31
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%l2
	st	%f8,	[%l7 + 0x3C]
	set	0x5A, %i1
	stba	%g5,	[%l7 + %i1] 0x89
	st	%fsr,	[%l7 + 0x18]
	or	%o6,	%g7,	%o0
	fpsub16s	%f30,	%f20,	%f18
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f6
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f12
	set	0x21, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o1
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%i6
	set	0x58, %g2
	prefetcha	[%l7 + %g2] 0x80,	 3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc4
	ba,a,pt	%icc,	loop_13
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x20, %l4
	stha	%i1,	[%l7 + %l4] 0xea
	membar	#Sync
loop_13:
	nop
	set	0x19, %o0
	stb	%i4,	[%l7 + %o0]
	fpsub16s	%f27,	%f31,	%f5
	nop
	set	0x60, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x30, %i4
	std	%f20,	[%l7 + %i4]
	set	0x20, %i5
	sta	%f8,	[%l7 + %i5] 0x89
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x74, %g7
	lduh	[%l7 + %g7],	%l2
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	or	%o5,	%g1,	%l1
	nop
	set	0x46, %o2
	sth	%i3,	[%l7 + %o2]
	and	%o4,	%l4,	%i2
	or	%g4,	%o3,	%l0
	set	0x48, %i2
	stwa	%g3,	[%l7 + %i2] 0x88
	set	0x70, %l2
	stda	%i4,	[%l7 + %l2] 0x81
	nop
	set	0x40, %o6
	std	%l4,	[%l7 + %o6]
	nop
	set	0x2E, %l5
	ldsh	[%l7 + %l5],	%i7
	or	%g6,	%o7,	%o2
	ld	[%l7 + 0x58],	%f2
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	nop
	set	0x08, %g4
	ldsw	[%l7 + %g4],	%g5
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%i0
	nop
	set	0x7F, %l3
	ldub	[%l7 + %l3],	%o6
	nop
	set	0x20, %o4
	std	%o0,	[%l7 + %o4]
	nop
	set	0x5E, %g5
	lduh	[%l7 + %g5],	%g7
	nop
	set	0x24, %l6
	sth	%o1,	[%l7 + %l6]
	nop
	set	0x60, %i1
	stx	%g2,	[%l7 + %i1]
	nop
	set	0x6C, %i0
	ldsh	[%l7 + %i0],	%i1
	nop
	set	0x12, %i3
	sth	%i6,	[%l7 + %i3]
	nop
	set	0x2C, %o5
	ldsw	[%l7 + %o5],	%l6
	nop
	set	0x0C, %l0
	lduw	[%l7 + %l0],	%l2
	nop
	set	0x1C, %g2
	ldsw	[%l7 + %g2],	%o5
	nop
	set	0x17, %o1
	stb	%g1,	[%l7 + %o1]
	nop
	set	0x50, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x88,	%i4
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x74]
	ld	[%l7 + 0x50],	%f29
	nop
	set	0x64, %i6
	ldsw	[%l7 + %i6],	%i3
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%l1
	nop
	set	0x64, %g6
	ldsw	[%l7 + %g6],	%l4
	nop
	set	0x38, %o0
	stx	%i2,	[%l7 + %o0]
	and	%g4,	%o4,	%o3
	nop
	set	0x40, %i4
	ldub	[%l7 + %i4],	%l0
	wr	%i5,	%l5,	%set_softint
	nop
	set	0x24, %i5
	sth	%g3,	[%l7 + %i5]
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x88,	 1
	nop
	set	0x08, %g1
	stb	%o7,	[%l7 + %g1]
	nop
	set	0x68, %o2
	stw	%o2,	[%l7 + %o2]
	nop
	set	0x50, %i2
	std	%g6,	[%l7 + %i2]
	ld	[%l7 + 0x78],	%f8
	set	0x0E, %g7
	stha	%g5,	[%l7 + %g7] 0x81
	nop
	set	0x7C, %l2
	prefetch	[%l7 + %l2],	 3
	add	%l3,	%i0,	%o0
	nop
	set	0x10, %l5
	ldsh	[%l7 + %l5],	%o6
	set	0x50, %o6
	stda	%g6,	[%l7 + %o6] 0x81
	set	0x37, %g3
	ldstuba	[%l7 + %g3] 0x89,	%g2
	set	0x2C, %g4
	lda	[%l7 + %g4] 0x89,	%f15
	set	0x66, %o7
	stba	%i1,	[%l7 + %o7] 0xe3
	membar	#Sync
	and	%o1,	%i6,	%l6
	nop
	set	0x64, %l3
	ldstub	[%l7 + %l3],	%l2
	set	0x20, %g5
	stxa	%g1,	[%l7 + %g5] 0xe2
	membar	#Sync
	or	%o5,	%i3,	%l1
	st	%f15,	[%l7 + 0x7C]
	nop
	set	0x38, %o4
	std	%i4,	[%l7 + %o4]
	add	%i2,	%l4,	%o4
	bg,a	%icc,	loop_14
	nop
	set	0x3F, %l6
	stb	%g4,	[%l7 + %l6]
	nop
	set	0x58, %i1
	lduw	[%l7 + %i1],	%o3
	fpadd32s	%f9,	%f5,	%f23
loop_14:
	nop
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xca
	st	%f10,	[%l7 + 0x68]
	set	0x78, %o5
	stha	%l0,	[%l7 + %o5] 0xe2
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%l5
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x58, %g2
	sta	%f18,	[%l7 + %g2] 0x89
	and	%g3,	%i7,	%o7
	nop
	set	0x60, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x54, %l4
	stw	%g6,	[%l7 + %l4]
	and	%g5,	%o2,	%l3
	set	0x13, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o0
	nop
	set	0x60, %l1
	stx	%i0,	[%l7 + %l1]
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	set	0x30, %g6
	stda	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%g2
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x88,	%i1
	add	%o1,	%i6,	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g1
	nop
	set	0x40, %o3
	stx	%i3,	[%l7 + %o3]
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x81,	%f9
	set	0x50, %o2
	stxa	%o5,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x68, %g1
	stda	%i4,	[%l7 + %g1] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%i2
	set	0x14, %g7
	sta	%f7,	[%l7 + %g7] 0x80
	nop
	set	0x24, %l2
	stw	%l4,	[%l7 + %l2]
	bn,a	%xcc,	loop_15
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x0F, %l5
	ldub	[%l7 + %l5],	%o4
	set	0x64, %o6
	stha	%o3,	[%l7 + %o6] 0xe2
	membar	#Sync
loop_15:
	nop
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x81,	%l0
	set	0x70, %g4
	stwa	%i5,	[%l7 + %g4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x78]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f0
	nop
	set	0x10, %g3
	stw	%l5,	[%l7 + %g3]
	set	0x50, %g5
	stda	%g4,	[%l7 + %g5] 0x89
	st	%f2,	[%l7 + 0x10]
	set	0x40, %l3
	stwa	%i7,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xeb,	%o6
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	set	0x78, %i0
	stda	%g2,	[%l7 + %i0] 0x80
	set	0x3A, %i1
	stha	%g5,	[%l7 + %i1] 0x89
	nop
	set	0x73, %l0
	ldsb	[%l7 + %l0],	%o2
	wr	%l3,	%i0,	%y
	nop
	set	0x29, %o5
	stb	%g7,	[%l7 + %o5]
	nop
	set	0x4C, %g2
	lduw	[%l7 + %g2],	%o6
	nop
	set	0x32, %o1
	ldstub	[%l7 + %o1],	%o0
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x64, %i6
	lduw	[%l7 + %i6],	%i1
	nop
	set	0x32, %i3
	ldub	[%l7 + %i3],	%o1
	set	0x20, %l1
	stba	%g2,	[%l7 + %l1] 0x80
	nop
	set	0x7D, %i7
	ldub	[%l7 + %i7],	%i6
	nop
	set	0x2C, %g6
	sth	%l6,	[%l7 + %g6]
	set	0x32, %i4
	stha	%l2,	[%l7 + %i4] 0x80
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc8
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%g1
	or	%i4,	%o5,	%i2
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x68, %o2
	stw	%l1,	[%l7 + %o2]
	set	0x14, %i5
	stha	%o4,	[%l7 + %i5] 0x80
	nop
	set	0x68, %g7
	stx	%l4,	[%l7 + %g7]
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	st	%f0,	[%l7 + 0x0C]
	nop
	set	0x4A, %l5
	sth	%o3,	[%l7 + %l5]
	and	%i5,	%l0,	%g4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	add	%l5,	%i7,	%o7
	set	0x38, %i2
	stda	%g2,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x307CEABB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xA0535002,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f7,	%f20
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%g6
	nop
	set	0x68, %o7
	lduw	[%l7 + %o7],	%o2
	nop
	set	0x20, %g3
	stx	%g5,	[%l7 + %g3]
	set	0x16, %g5
	stha	%l3,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x46, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i0
	set	0x19, %l6
	stba	%g7,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x08, %l3
	swap	[%l7 + %l3],	%o6
	set	0x08, %i0
	stxa	%o0,	[%l7 + %i0] 0x81
	be,pn	%icc,	loop_16
	nop
	set	0x40, %i1
	stw	%i1,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x58]
	and	%o1,	%g2,	%i6
loop_16:
	nop
	set	0x38, %l0
	std	%f12,	[%l7 + %l0]
	nop
	set	0x0E, %o4
	sth	%l6,	[%l7 + %o4]
	nop
	set	0x40, %g2
	stx	%i3,	[%l7 + %g2]
	nop
	set	0x18, %o5
	stx	%l2,	[%l7 + %o5]
	fpadd16	%f18,	%f28,	%f28
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%i4
	set	0x12, %l4
	stba	%g1,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x60, %i6
	std	%f16,	[%l7 + %i6]
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	nop
	set	0x18, %l1
	lduh	[%l7 + %l1],	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%l4
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%o3
	add	%i5,	%l0,	%o4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x81
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x88,	%l5
	set	0x36, %i4
	stba	%g4,	[%l7 + %i4] 0x80
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%o6
	nop
	set	0x6C, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x30, %i5
	std	%f4,	[%l7 + %i5]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f0
	or	%g3,	%g6,	%o2
	add	%g5,	%l3,	%i7
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x81,	 2
	nop
	set	0x5A, %o6
	ldsh	[%l7 + %o6],	%o6
	set	0x2C, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g7
	or	%i1,	%o0,	%o1
	or	%g2,	%i6,	%l6
	nop
	set	0x18, %g4
	ldsw	[%l7 + %g4],	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%g1
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x80,	%f13
	nop
	set	0x44, %o7
	lduw	[%l7 + %o7],	%i2
	ble,pn	%xcc,	loop_17
	nop
	set	0x08, %g3
	stw	%l2,	[%l7 + %g3]
	set	0x4C, %g5
	sta	%f1,	[%l7 + %g5] 0x89
loop_17:
	nop
	set	0x23, %l2
	stba	%o5,	[%l7 + %l2] 0xe3
	membar	#Sync
	and	%l4,	%o3,	%i5
	set	0x2C, %l6
	swapa	[%l7 + %l6] 0x89,	%l1
	set	0x28, %i0
	stda	%o4,	[%l7 + %i0] 0x80
	set	0x50, %i1
	stxa	%l5,	[%l7 + %i1] 0x89
	fpadd16s	%f6,	%f30,	%f22
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%l0
	or	%o7,	%g3,	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%g6
	nop
	set	0x4F, %l0
	stb	%l3,	[%l7 + %l0]
	set	0x48, %o4
	swapa	[%l7 + %o4] 0x81,	%i7
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f24
	add	%g5,	%i0,	%g7
	nop
	set	0x61, %g2
	ldub	[%l7 + %g2],	%o6
	set	0x6A, %o1
	stha	%o0,	[%l7 + %o1] 0x89
	nop
	set	0x38, %l4
	std	%o0,	[%l7 + %l4]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x88,	%i1
	fpsub16	%f22,	%f2,	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%l6
	set	0x7E, %l1
	stha	%i3,	[%l7 + %l1] 0x80
	nop
	set	0x50, %i6
	stx	%g2,	[%l7 + %i6]
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x88,	%g1
	st	%f29,	[%l7 + 0x68]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1256
!	Type a   	: 18
!	Type cti   	: 17
!	Type x   	: 547
!	Type f   	: 45
!	Type i   	: 117
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
.word 0x5E1E2D9D
.word 0xDFD0DEDF
.word 0x2E8813D7
.word 0x60717E9D
.word 0x80537814
.word 0x60B3F54A
.word 0x895C196E
.word 0x49F08722
.word 0x4449BE1F
.word 0xBC14D752
.word 0xCF4CA77F
.word 0x81B8F662
.word 0xC66FB27B
.word 0x3A7D9E18
.word 0xEA206A6E
.word 0x9BB6C05A
.word 0x612F20CF
.word 0xEFDE9464
.word 0x73541200
.word 0x0FC0A9CB
.word 0xF1F811E0
.word 0xD386EB75
.word 0xD5360AF3
.word 0xC2032E19
.word 0x08118C90
.word 0x98E6DAC8
.word 0xE5C98C1C
.word 0xD38B9AFE
.word 0x00C6E031
.word 0x3C33F3C7
.word 0x02924650
.word 0xE457B597
.word 0xEFA3E6BE
.word 0x7E90A78A
.word 0x2DA08880
.word 0x8C2BE81F
.word 0xC06F8C34
.word 0x176E560A
.word 0x8F766CF0
.word 0x85C7705E
.word 0x0DFCCD65
.word 0x0AC1AE9B
.word 0x9B2CEC82
.word 0xB8EB9208
.word 0xD4CE5433
.word 0x4BFDE2E1
.word 0xEC5A66D2
.word 0x834D2695
.word 0x34C1B29D
.word 0xD2851420
.word 0x95983F6E
.word 0xCEFEB8D8
.word 0x7B0E3733
.word 0x4B0B95C5
.word 0xBC72324E
.word 0x4F3FD7F7
.word 0x662B790F
.word 0x323BF644
.word 0x09889E4F
.word 0xB1B19605
.word 0x11926C1B
.word 0xFBE347A9
.word 0x1A8F78CC
.word 0x6BABD4F0
.end
