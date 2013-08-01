/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc2.s
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
	set	0x2,	%g1
	set	0xA,	%g2
	set	0xF,	%g3
	set	0xE,	%g4
	set	0xC,	%g5
	set	0xA,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x6,	%i1
	set	-0x8,	%i2
	set	-0x4,	%i3
	set	-0x9,	%i4
	set	-0xF,	%i5
	set	-0x0,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x4C1B31DB,	%l0
	set	0x63A47819,	%l1
	set	0x5E301ED1,	%l2
	set	0x10644751,	%l3
	set	0x2C95637D,	%l4
	set	0x471E7C74,	%l5
	set	0x2211C3E4,	%l6
	!# Output registers
	set	0x02F7,	%o0
	set	0x17FD,	%o1
	set	-0x0B56,	%o2
	set	0x0591,	%o3
	set	0x190B,	%o4
	set	0x027D,	%o5
	set	-0x0C42,	%o6
	set	0x03E1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%o0
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x81,	 4
	st	%f30,	[%l7 + 0x68]
	nop
	set	0x14, %i5
	ldsb	[%l7 + %i5],	%i1
	bne	%icc,	loop_1
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x47, %l1
	ldsb	[%l7 + %l1],	%i4
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f20
loop_1:
	nop
	set	0x54, %o6
	sth	%l1,	[%l7 + %o6]
	set	0x28, %o7
	sta	%f7,	[%l7 + %o7] 0x89
	set	0x7C, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o3
	nop
	set	0x58, %g3
	ldsb	[%l7 + %g3],	%g7
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x7E, %i0
	ldsh	[%l7 + %i0],	%o2
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%l4
	nop
	set	0x44, %g6
	lduw	[%l7 + %g6],	%g1
	nop
	set	0x6B, %l0
	stb	%i7,	[%l7 + %l0]
	set	0x18, %l2
	stxa	%i6,	[%l7 + %l2] 0x89
	nop
	set	0x70, %l3
	lduw	[%l7 + %l3],	%i2
	ba,pt	%xcc,	loop_2
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x46, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l3
loop_2:
	nop
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x80,	%o1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%g6
	st	%f24,	[%l7 + 0x28]
	set	0x74, %i4
	swapa	[%l7 + %i4] 0x80,	%g5
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x88
	nop
	set	0x68, %l4
	std	%f8,	[%l7 + %l4]
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	nop
	set	0x08, %o1
	prefetch	[%l7 + %o1],	 2
	st	%f17,	[%l7 + 0x34]
	nop
	set	0x5D, %g4
	ldsb	[%l7 + %g4],	%l0
	add	%i0,	%l2,	%o6
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x6D, %o2
	ldsb	[%l7 + %o2],	%o7
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%i3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%l5
	nop
	set	0x36, %i3
	ldsh	[%l7 + %i3],	%l6
	nop
	set	0x28, %l5
	std	%g2,	[%l7 + %l5]
	set	0x50, %o4
	stha	%g4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x18, %i5
	stxa	%o0,	[%l7 + %i5] 0x89
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xeb,	%o4
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%i4
	nop
	set	0x60, %g7
	std	%f26,	[%l7 + %g7]
	ld	[%l7 + 0x3C],	%f28
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4D9, 	%sys_tick_cmpr
	nop
	set	0x34, %o7
	ldstub	[%l7 + %o7],	%o3
	nop
	set	0x18, %o6
	std	%l4,	[%l7 + %o6]
	nop
	set	0x08, %g3
	stw	%o2,	[%l7 + %g3]
	nop
	set	0x27, %i2
	stb	%g1,	[%l7 + %i2]
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f28
	or	%i6,	%i7,	%i2
	set	0x4C, %o5
	sta	%f1,	[%l7 + %o5] 0x88
	fpadd32s	%f2,	%f14,	%f15
	bg	%xcc,	loop_3
	nop
	set	0x60, %i7
	sth	%l3,	[%l7 + %i7]
	set	0x5C, %g6
	sta	%f23,	[%l7 + %g6] 0x88
loop_3:
	nop
	set	0x0C, %l2
	stw	%o4,	[%l7 + %l2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%g5
	add	%g6,	%i5,	%i0
	and	%l2,	%l0,	%o7
	nop
	set	0x16, %l3
	ldsh	[%l7 + %l3],	%o6
	nop
	set	0x50, %l6
	ldsw	[%l7 + %l6],	%i3
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%g3
	add	%l6,	%l5,	%g4
	set	0x3D, %o0
	ldstuba	[%l7 + %o0] 0x81,	%g2
	nop
	set	0x68, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%o5
	set	0x26, %i4
	stha	%i4,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x81,	%i1
	nop
	set	0x76, %l4
	sth	%g7,	[%l7 + %l4]
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0
	set	0x77, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l1
	nop
	set	0x78, %o3
	swap	[%l7 + %o3],	%o2
	set	0x2C, %o2
	stwa	%g1,	[%l7 + %o2] 0x89
	ld	[%l7 + 0x08],	%f11
	nop
	set	0x5F, %g4
	stb	%l4,	[%l7 + %g4]
	nop
	set	0x28, %g1
	std	%f18,	[%l7 + %g1]
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x80,	%i7
	nop
	set	0x58, %i5
	std	%f30,	[%l7 + %i5]
	ld	[%l7 + 0x5C],	%f6
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x20, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x50, %g7
	ldsh	[%l7 + %g7],	%i2
	nop
	set	0x60, %l1
	prefetch	[%l7 + %l1],	 3
	st	%f9,	[%l7 + 0x38]
	nop
	set	0x10, %o6
	stx	%l3,	[%l7 + %o6]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o1
	nop
	set	0x5C, %g3
	swap	[%l7 + %g3],	%o4
	nop
	set	0x1A, %i2
	sth	%g6,	[%l7 + %i2]
	nop
	set	0x4E, %i0
	ldsh	[%l7 + %i0],	%g5
	nop
	set	0x20, %o5
	stb	%i0,	[%l7 + %o5]
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f12
	set	0x28, %o7
	stxa	%i5,	[%l7 + %o7] 0x89
	nop
	set	0x5C, %g6
	stw	%l0,	[%l7 + %g6]
	nop
	set	0x18, %l2
	swap	[%l7 + %l2],	%o7
	or	%o6,	%i3,	%g3
	nop
	set	0x28, %l6
	std	%l2,	[%l7 + %l6]
	nop
	set	0x78, %l3
	std	%l4,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%l6
	nop
	set	0x7C, %l0
	stw	%g2,	[%l7 + %l0]
	set	0x31, %i4
	stba	%g4,	[%l7 + %i4] 0x88
	ble,a,pn	%icc,	loop_4
	nop
	set	0x10, %o0
	ldsb	[%l7 + %o0],	%o0
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf0
	membar	#Sync
loop_4:
	nop
	set	0x40, %l4
	swapa	[%l7 + %l4] 0x88,	%o5
	fpadd32s	%f9,	%f16,	%f10
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g7
	nop
	set	0x28, %o1
	std	%f0,	[%l7 + %o1]
	set	0x58, %o3
	stxa	%i1,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%o2
	nop
	set	0x56, %g4
	lduh	[%l7 + %g4],	%l1
	set	0x14, %o2
	lda	[%l7 + %o2] 0x81,	%f13
	set	0x60, %i3
	ldxa	[%l7 + %i3] 0x89,	%o2
	set	0x6C, %g1
	stwa	%l4,	[%l7 + %g1] 0x89
	nop
	set	0x20, %i5
	stx	%i7,	[%l7 + %i5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f16
	set	0x08, %l5
	stxa	%i2,	[%l7 + %l5] 0x80
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x78, %o4
	ldsh	[%l7 + %o4],	%l3
	add	%i6,	%o1,	%g1
	nop
	set	0x28, %l1
	sth	%g6,	[%l7 + %l1]
	nop
	set	0x48, %g3
	stw	%g5,	[%l7 + %g3]
	nop
	set	0x0C, %o6
	lduw	[%l7 + %o6],	%o4
	nop
	set	0x1C, %i0
	ldsh	[%l7 + %i0],	%i0
	or	%l0,	%i5,	%o7
	fpadd16	%f12,	%f20,	%f10
	set	0x50, %i2
	stwa	%i3,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x0B, %i7
	stb	%o6,	[%l7 + %i7]
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%g3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%l2
	nop
	set	0x18, %o7
	ldsh	[%l7 + %o7],	%l6
	set	0x78, %g6
	stxa	%g2,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x4C, %l2
	ldub	[%l7 + %l2],	%o0
	nop
	set	0x74, %l6
	ldsb	[%l7 + %l6],	%o5
	set	0x30, %l3
	stxa	%g4,	[%l7 + %l3] 0x80
	nop
	set	0x58, %g2
	stx	%g7,	[%l7 + %g2]
	bne,a	%icc,	loop_5
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f22
	nop
	set	0x24, %o0
	stw	%i4,	[%l7 + %o0]
	nop
	set	0x18, %l0
	prefetch	[%l7 + %l0],	 1
loop_5:
	nop
	set	0x73, %i6
	ldstub	[%l7 + %i6],	%i1
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xe3,	%o2
	nop
	set	0x38, %o3
	stw	%l1,	[%l7 + %o3]
	nop
	set	0x10, %l4
	std	%f10,	[%l7 + %l4]
	set	0x26, %g5
	stha	%l4,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x08, %o2
	stwa	%o2,	[%l7 + %o2] 0x80
	set	0x44, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i7
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc2
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %i5
	stxa	%l3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	st	%fsr,	[%l7 + 0x24]
	fpsub16s	%f10,	%f30,	%f2
	set	0x40, %o4
	lda	[%l7 + %o4] 0x81,	%f11
	set	0x67, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i2
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%g6
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x89,	%o0
	set	0x74, %o6
	stha	%o4,	[%l7 + %o6] 0x89
	nop
	set	0x68, %i0
	std	%f24,	[%l7 + %i0]
	nop
	set	0x14, %i7
	lduw	[%l7 + %i7],	%g5
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%i0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%o7
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	ld	[%l7 + 0x78],	%f29
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x88,	%l0
	set	0x0C, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i3
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xe3,	%o6
	set	0x3C, %l3
	sta	%f5,	[%l7 + %l3] 0x89
	set	0x38, %l2
	stha	%l5,	[%l7 + %l2] 0x89
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%g3
	nop
	set	0x52, %o0
	sth	%g2,	[%l7 + %o0]
	nop
	set	0x68, %i4
	std	%o0,	[%l7 + %i4]
	fpadd32	%f22,	%f4,	%f18
	nop
	set	0x0A, %i6
	sth	%l6,	[%l7 + %i6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%g7
	st	%f2,	[%l7 + 0x50]
	nop
	set	0x50, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xe3,	%i4
	nop
	set	0x34, %o3
	ldub	[%l7 + %o3],	%g4
	nop
	set	0x40, %l4
	stw	%o3,	[%l7 + %l4]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%l4
	set	0x1E, %o2
	stha	%o2,	[%l7 + %o2] 0x81
	nop
	set	0x30, %g5
	std	%f10,	[%l7 + %g5]
	set	0x74, %g1
	lda	[%l7 + %g1] 0x89,	%f30
	or	%l1,	%i7,	%l3
	nop
	set	0x28, %i3
	std	%f14,	[%l7 + %i3]
	bge,pt	%xcc,	loop_6
	nop
	set	0x50, %i5
	std	%i6,	[%l7 + %i5]
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%g1
	nop
	set	0x74, %g4
	sth	%g6,	[%l7 + %g4]
loop_6:
	and	%o1,	%o4,	%i2
	set	0x34, %i1
	stwa	%g5,	[%l7 + %i1] 0x89
	nop
	set	0x6C, %l1
	ldsh	[%l7 + %l1],	%i5
	fpsub16	%f2,	%f22,	%f14
	set	0x24, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i0
	set	0x38, %g3
	stda	%o6,	[%l7 + %g3] 0x81
	and	%i3,	%o6,	%l5
	nop
	set	0x4E, %o6
	lduh	[%l7 + %o6],	%l0
	nop
	set	0x76, %g7
	stb	%g3,	[%l7 + %g7]
	set	0x48, %i7
	stwa	%l2,	[%l7 + %i7] 0x81
	set	0x50, %o5
	stda	%o0,	[%l7 + %o5] 0x88
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x81,	 3
	or	%o5,	%g7,	%g2
	nop
	set	0x48, %i0
	ldsh	[%l7 + %i0],	%i4
	set	0x78, %g6
	stwa	%o3,	[%l7 + %g6] 0x81
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x88,	%g4
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%l4
	nop
	set	0x2C, %l2
	ldsh	[%l7 + %l2],	%i1
	nop
	set	0x4C, %g2
	ldsw	[%l7 + %g2],	%o2
	nop
	set	0x5C, %l6
	prefetch	[%l7 + %l6],	 4
	fpsub16s	%f4,	%f24,	%f16
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x88,	%l1
	st	%fsr,	[%l7 + 0x50]
	set	0x69, %i6
	stba	%i7,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x10, %o1
	stda	%i6,	[%l7 + %o1] 0x89
	nop
	set	0x58, %i4
	std	%g0,	[%l7 + %i4]
	nop
	set	0x68, %o3
	std	%l2,	[%l7 + %o3]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%o1
	nop
	set	0x60, %l4
	ldsh	[%l7 + %l4],	%i2
	bleu,a	%icc,	loop_7
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f14
	add	%o4,	%i5,	%g5
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%i0
loop_7:
	add	%i3,	%o7,	%o6
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%l0
	nop
	set	0x73, %l0
	ldub	[%l7 + %l0],	%l5
	ld	[%l7 + 0x74],	%f31
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x81,	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l6
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x88,	%g3
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f0
	nop
	set	0x68, %i1
	prefetch	[%l7 + %i1],	 3
	add	%o5,	%g2,	%g7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i4
	nop
	set	0x69, %o4
	ldstub	[%l7 + %o4],	%i1
	set	0x68, %l1
	stxa	%l1,	[%l7 + %l1] 0x80
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%i6
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x89,	%i6
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f22
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc0
	nop
	set	0x38, %o5
	ldsh	[%l7 + %o5],	%o2
	set	0x48, %i0
	stda	%g0,	[%l7 + %i0] 0x80
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f2
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x16, %o7
	sth	%l3,	[%l7 + %o7]
	wr	%g6,	%o1,	%clear_softint
	nop
	set	0x63, %l3
	ldsb	[%l7 + %l3],	%o4
	set	0x58, %g2
	stda	%i2,	[%l7 + %g2] 0x89
	set	0x6A, %l2
	stha	%g5,	[%l7 + %l2] 0x80
	add	%i0,	%i5,	%o7
	or	%o6,	%l0,	%l5
	nop
	set	0x18, %l6
	std	%i2,	[%l7 + %l6]
	set	0x10, %i6
	stba	%l2,	[%l7 + %i6] 0x88
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x89,	%i6
	or	%g3,	%o5,	%g2
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%g7
	add	%o3,	%o0,	%l4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	nop
	set	0x14, %i4
	lduw	[%l7 + %i4],	%i4
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%i0
	set	0x79, %g5
	stba	%l1,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xeb,	%i6
	set	0x37, %l0
	stba	%g4,	[%l7 + %l0] 0x88
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f0
	nop
	set	0x44, %i3
	ldsw	[%l7 + %i3],	%i6
	nop
	set	0x1B, %l5
	ldub	[%l7 + %l5],	%o2
	nop
	set	0x10, %i5
	ldub	[%l7 + %i5],	%l3
	set	0x3E, %g4
	stha	%g6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe3,	%g0
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x1C, %o6
	lduw	[%l7 + %o6],	%o4
	st	%fsr,	[%l7 + 0x74]
	or	%i2,	%g5,	%o1
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f6
	set	0x30, %g7
	stda	%i4,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%o6
	nop
	set	0x48, %i7
	std	%f8,	[%l7 + %i7]
	st	%f24,	[%l7 + 0x34]
	nop
	set	0x78, %g3
	lduh	[%l7 + %g3],	%l0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i3
	nop
	set	0x09, %i0
	ldsb	[%l7 + %i0],	%l5
	nop
	set	0x30, %g6
	std	%l2,	[%l7 + %g6]
	set	0x20, %i2
	sta	%f31,	[%l7 + %i2] 0x89
	add	%l6,	%o5,	%g3
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x88,	%g2
	nop
	set	0x26, %o5
	lduh	[%l7 + %o5],	%g7
	nop
	set	0x4D, %l3
	ldstub	[%l7 + %l3],	%o0
	set	0x40, %l2
	sta	%f8,	[%l7 + %l2] 0x89
	nop
	set	0x22, %l6
	ldsh	[%l7 + %l6],	%o3
	ld	[%l7 + 0x58],	%f2
	nop
	set	0x3C, %i6
	ldsh	[%l7 + %i6],	%l4
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	and	%i4,	%i1,	%i7
	nop
	set	0x28, %g2
	stw	%g4,	[%l7 + %g2]
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x08, %i4
	std	%f22,	[%l7 + %i4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l3
	nop
	set	0x20, %o1
	std	%g6,	[%l7 + %o1]
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xeb,	%g0
	fpadd16s	%f26,	%f4,	%f26
	set	0x60, %o2
	lda	[%l7 + %o2] 0x88,	%f28
	nop
	nop
	setx	0x3E0507E2042FA624,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x10E8FC1F564BE703,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f28
	nop
	set	0x1B, %l0
	ldub	[%l7 + %l0],	%o4
	set	0x18, %i3
	swapa	[%l7 + %i3] 0x80,	%l1
	nop
	set	0x58, %l5
	stx	%g5,	[%l7 + %l5]
	set	0x17, %i5
	stba	%i2,	[%l7 + %i5] 0x89
	nop
	set	0x5C, %g1
	lduw	[%l7 + %g1],	%o1
	nop
	set	0x4A, %g4
	ldsh	[%l7 + %g4],	%i0
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc8
	wr	%i5,	%l0,	%clear_softint
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x50, %o4
	ldsw	[%l7 + %o4],	%o6
	fpsub32	%f4,	%f4,	%f6
	st	%f16,	[%l7 + 0x44]
	ld	[%l7 + 0x48],	%f30
	nop
	set	0x78, %l1
	stx	%o7,	[%l7 + %l1]
	nop
	set	0x40, %g7
	lduh	[%l7 + %g7],	%l5
	nop
	set	0x20, %g3
	lduh	[%l7 + %g3],	%i3
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f14
	set	0x44, %i7
	lda	[%l7 + %i7] 0x89,	%f28
	set	0x28, %g6
	lda	[%l7 + %g6] 0x80,	%f31
	nop
	set	0x4C, %i2
	swap	[%l7 + %i2],	%l6
	nop
	set	0x20, %o5
	ldsh	[%l7 + %o5],	%o5
	nop
	set	0x38, %l3
	swap	[%l7 + %l3],	%g3
	add	%g2,	%g7,	%o0
	fpadd32s	%f19,	%f20,	%f28
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x1E, %o7
	ldsh	[%l7 + %o7],	%o3
	nop
	set	0x14, %l6
	swap	[%l7 + %l6],	%l2
	set	0x72, %l2
	stba	%l4,	[%l7 + %l2] 0x88
	set	0x50, %o0
	stwa	%i4,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x46, %i6
	sth	%i1,	[%l7 + %i6]
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f26
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xe2,	%i6
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x3D, %i4
	ldsb	[%l7 + %i4],	%g4
	and	%l3,	%o2,	%g6
	nop
	set	0x1A, %g5
	ldsb	[%l7 + %g5],	%g1
	nop
	set	0x2B, %o2
	ldstub	[%l7 + %o2],	%o4
	nop
	set	0x40, %l0
	std	%l0,	[%l7 + %l0]
	nop
	set	0x74, %i3
	ldsw	[%l7 + %i3],	%g5
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x81,	%o0
	set	0x40, %l4
	stxa	%i2,	[%l7 + %l4] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%l0
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x88,	 3
	set	0x44, %g1
	swapa	[%l7 + %g1] 0x89,	%o6
	and	%l5,	%o7,	%i3
	nop
	set	0x0F, %i1
	ldub	[%l7 + %i1],	%l6
	nop
	set	0x38, %g4
	stx	%g3,	[%l7 + %g4]
	fpsub16	%f6,	%f12,	%f30
	set	0x60, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o5
	add	%g2,	%o0,	%o3
	nop
	set	0x0C, %l1
	stw	%g7,	[%l7 + %l1]
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x88,	%l2
	set	0x6E, %o6
	stha	%l4,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x28, %i0
	stda	%i0,	[%l7 + %i0] 0x80
	and	%i4,	%i7,	%g4
	nop
	set	0x40, %i7
	ldsw	[%l7 + %i7],	%l3
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	nop
	set	0x40, %g6
	std	%f12,	[%l7 + %g6]
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f16
	set	0x1D, %l3
	ldstuba	[%l7 + %l3] 0x88,	%g6
	wr	%o2,	%o4,	%ccr
	set	0x47, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g1
	set	0x40, %l6
	sta	%f8,	[%l7 + %l6] 0x81
	nop
	nop
	setx	0x6B371764D67E98E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x25886D20CEC910B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f8
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x80,	 3
	set	0x10, %g2
	lda	[%l7 + %g2] 0x89,	%f1
	nop
	set	0x16, %l2
	ldsb	[%l7 + %l2],	%o1
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x80,	%i2
	nop
	set	0x08, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x10, %o3
	std	%i4,	[%l7 + %o3]
	nop
	set	0x76, %g5
	ldub	[%l7 + %g5],	%l0
	or	%i0,	%o6,	%l5
	nop
	set	0x36, %l0
	ldstub	[%l7 + %l0],	%o7
	nop
	set	0x10, %o2
	lduw	[%l7 + %o2],	%l1
	nop
	set	0x14, %i3
	sth	%i3,	[%l7 + %i3]
	ld	[%l7 + 0x48],	%f16
	or	%g3,	%o5,	%g2
	add	%l6,	%o3,	%o0
	st	%f26,	[%l7 + 0x30]
	ld	[%l7 + 0x38],	%f26
	nop
	set	0x10, %l4
	std	%l2,	[%l7 + %l4]
	nop
	set	0x5A, %i5
	ldub	[%l7 + %i5],	%g7
	st	%f0,	[%l7 + 0x3C]
	nop
	set	0x50, %g1
	ldsh	[%l7 + %g1],	%i1
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x30, %l5
	sta	%f2,	[%l7 + %l5] 0x80
	set	0x4B, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i4
	nop
	set	0x15, %l1
	ldstub	[%l7 + %l1],	%l4
	set	0x34, %g7
	sta	%f4,	[%l7 + %g7] 0x88
	st	%fsr,	[%l7 + 0x3C]
	set	0x40, %o6
	stba	%g4,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x10, %o4
	stxa	%i7,	[%l7 + %o4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	set	0x38, %i0
	stxa	%l3,	[%l7 + %i0] 0x81
	wr	%g6,	%i6,	%pic
	nop
	set	0x2E, %i7
	ldsb	[%l7 + %i7],	%o4
	nop
	set	0x0A, %g6
	ldstub	[%l7 + %g6],	%g1
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	nop
	set	0x1C, %i2
	stw	%o1,	[%l7 + %i2]
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%i2
	st	%f15,	[%l7 + 0x64]
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x88,	%i5
	set	0x42, %o7
	stha	%o2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x52, %l3
	ldub	[%l7 + %l3],	%l0
	nop
	set	0x72, %o0
	lduh	[%l7 + %o0],	%i0
	nop
	set	0x15, %i6
	ldub	[%l7 + %i6],	%o6
	nop
	set	0x5C, %l2
	lduw	[%l7 + %l2],	%l5
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	st	%fsr,	[%l7 + 0x24]
	fpsub16s	%f31,	%f24,	%f27
	nop
	set	0x34, %i4
	lduh	[%l7 + %i4],	%i3
	nop
	set	0x68, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x89,	%g3
	fpadd16s	%f1,	%f16,	%f4
	set	0x08, %g5
	stxa	%l1,	[%l7 + %g5] 0x81
	set	0x30, %l0
	stwa	%g2,	[%l7 + %l0] 0x88
	nop
	set	0x08, %i3
	ldsb	[%l7 + %i3],	%o5
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x08]
	set	0x16, %i5
	ldstuba	[%l7 + %i5] 0x80,	%l6
	nop
	set	0x1C, %o2
	lduw	[%l7 + %o2],	%o0
	and	%o3,	%l2,	%i1
	ld	[%l7 + 0x5C],	%f11
	nop
	set	0x48, %i1
	ldstub	[%l7 + %i1],	%g7
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x89,	%i4
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x80,	%l4
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x3C, %l1
	sth	%g4,	[%l7 + %l1]
	nop
	set	0x68, %g1
	std	%i6,	[%l7 + %g1]
	nop
	set	0x37, %o6
	ldsb	[%l7 + %o6],	%l3
	nop
	set	0x1C, %g7
	ldsb	[%l7 + %g7],	%i6
	nop
	set	0x75, %i0
	ldub	[%l7 + %i0],	%g6
	nop
	set	0x64, %o4
	stw	%g1,	[%l7 + %o4]
	wr	%o4,	%o1,	%softint
	nop
	set	0x64, %i7
	ldsh	[%l7 + %i7],	%i2
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%g4
	and	%o2,	%l0,	%i5
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x89,	%i0
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x88,	%o6
	nop
	set	0x5A, %l6
	ldsb	[%l7 + %l6],	%l5
	fpadd32s	%f4,	%f3,	%f26
	nop
	set	0x48, %o7
	std	%o6,	[%l7 + %o7]
	add	%g3,	%l1,	%g2
	nop
	set	0x26, %o5
	ldsb	[%l7 + %o5],	%i3
	set	0x19, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o5
	set	0x6C, %l3
	lda	[%l7 + %l3] 0x81,	%f2
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f2
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x81,	%o3
	nop
	set	0x60, %o3
	std	%f12,	[%l7 + %o3]
	nop
	set	0x44, %l2
	sth	%l6,	[%l7 + %l2]
	set	0x11, %g5
	stba	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x28, %l0
	stda	%g6,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%l4
	nop
	set	0x50, %i3
	std	%g4,	[%l7 + %i3]
	nop
	set	0x3C, %o1
	stw	%i7,	[%l7 + %o1]
	nop
	set	0x68, %i5
	std	%i4,	[%l7 + %i5]
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%i6
	nop
	set	0x14, %o2
	prefetch	[%l7 + %o2],	 4
	ld	[%l7 + 0x0C],	%f13
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x89,	%g6
	nop
	set	0x70, %g4
	stx	%l3,	[%l7 + %g4]
	nop
	set	0x78, %i1
	stw	%o4,	[%l7 + %i1]
	set	0x4C, %g1
	swapa	[%l7 + %g1] 0x88,	%o1
	or	%i2,	%g1,	%o2
	nop
	set	0x30, %l1
	stw	%g5,	[%l7 + %l1]
	nop
	set	0x58, %o6
	ldub	[%l7 + %o6],	%i5
	set	0x40, %i0
	stda	%l0,	[%l7 + %i0] 0xe3
	membar	#Sync
	ld	[%l7 + 0x68],	%f9
	or	%i0,	%l5,	%o7
	nop
	set	0x7D, %g7
	ldub	[%l7 + %g7],	%g3
	set	0x10, %o4
	ldda	[%l7 + %o4] 0xea,	%o6
	set	0x28, %i7
	stxa	%l1,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%g2
	set	0x48, %g6
	stxa	%o5,	[%l7 + %g6] 0x81
	nop
	set	0x5C, %i2
	swap	[%l7 + %i2],	%o0
	nop
	set	0x48, %l6
	stx	%i3,	[%l7 + %l6]
	set	0x1F, %o7
	stba	%o3,	[%l7 + %o7] 0x80
	nop
	set	0x50, %o5
	std	%i6,	[%l7 + %o5]
	nop
	set	0x32, %l3
	stb	%l2,	[%l7 + %l3]
	set	0x64, %i6
	sta	%f17,	[%l7 + %i6] 0x88
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x89,	 1
	nop
	set	0x24, %i4
	stw	%i1,	[%l7 + %i4]
	add	%g4,	%i7,	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%g6
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%l3
	wr 	%g0, 	0x4, 	%fprs
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x88,	 4
	ba,a	%icc,	loop_8
	nop
	set	0x38, %l2
	ldsb	[%l7 + %l2],	%o1
	bge,a,pn	%xcc,	loop_9
	nop
	set	0x70, %g5
	std	%f6,	[%l7 + %g5]
loop_8:
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x38, %l0
	lduw	[%l7 + %l0],	%g1
loop_9:
	st	%fsr,	[%l7 + 0x14]
	bleu,a,pt	%xcc,	loop_10
	st	%fsr,	[%l7 + 0x74]
	set	0x14, %o1
	lda	[%l7 + %o1] 0x89,	%f13
loop_10:
	add	%g5,	%o2,	%l0
	nop
	set	0x1C, %i5
	ldsw	[%l7 + %i5],	%i0
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd2
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%l5
	ld	[%l7 + 0x08],	%f10
	st	%f5,	[%l7 + 0x0C]
	nop
	set	0x78, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%i5
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc2
	nop
	set	0x26, %g1
	stb	%g3,	[%l7 + %g1]
	nop
	set	0x2C, %l1
	sth	%o6,	[%l7 + %l1]
	nop
	set	0x53, %i0
	ldstub	[%l7 + %i0],	%o7
	or	%l1,	%g2,	%o5
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%o0
	nop
	set	0x10, %g7
	swap	[%l7 + %g7],	%i3
	set	0x08, %o4
	lda	[%l7 + %o4] 0x89,	%f3
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x89,	%l6
	set	0x6C, %g3
	lda	[%l7 + %g3] 0x80,	%f0
	nop
	set	0x26, %g6
	ldsh	[%l7 + %g6],	%l2
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x81,	%g7
	nop
	set	0x38, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x5E, %o5
	ldstub	[%l7 + %o5],	%i1
	set	0x78, %l3
	swapa	[%l7 + %l3] 0x89,	%g4
	set	0x40, %i6
	sta	%f13,	[%l7 + %i6] 0x89
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%o3
	st	%f25,	[%l7 + 0x68]
	add	%i7,	%l4,	%i6
	add	%l3,	%g6,	%o4
	nop
	set	0x7F, %i4
	ldsb	[%l7 + %i4],	%i2
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	nop
	set	0x6A, %g2
	sth	%i4,	[%l7 + %g2]
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x80,	%o1
	nop
	set	0x30, %o3
	stx	%g1,	[%l7 + %o3]
	or	%g5,	%o2,	%i0
	set	0x68, %g5
	stwa	%l5,	[%l7 + %g5] 0x81
	nop
	set	0x7F, %l0
	ldub	[%l7 + %l0],	%i5
	set	0x58, %o1
	stxa	%l0,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x78, %i5
	std	%f18,	[%l7 + %i5]
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%o6
	or	%g3,	%o7,	%g2
	nop
	set	0x60, %o2
	ldsw	[%l7 + %o2],	%l1
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0
	nop
	set	0x63, %g4
	ldub	[%l7 + %g4],	%o5
	set	0x58, %l5
	stda	%i2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x10, %i1
	stx	%l2,	[%l7 + %i1]
	nop
	set	0x54, %g1
	lduw	[%l7 + %g1],	%g7
	nop
	set	0x39, %l1
	stb	%l6,	[%l7 + %l1]
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%g4
	nop
	set	0x30, %i0
	lduw	[%l7 + %i0],	%i1
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%i7
	wr	%l4,	%i6,	%y
	fpadd32s	%f31,	%f18,	%f13
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x58, %g7
	ldstub	[%l7 + %g7],	%o3
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x89
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xea,	%g6
	nop
	nop
	setx	0x7AE3607F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x3E0F0820,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f27,	%f8
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f8
	set	0x68, %o5
	stda	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%l3
	set	0x30, %i2
	stxa	%o1,	[%l7 + %i2] 0x81
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f0
	set	0x2A, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i4
	set	0x64, %l3
	swapa	[%l7 + %l3] 0x89,	%g1
	set	0x18, %l6
	stda	%g4,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x10, %g2
	stx	%i0,	[%l7 + %g2]
	set	0x70, %l2
	swapa	[%l7 + %l2] 0x88,	%l5
	nop
	set	0x60, %o3
	stb	%i5,	[%l7 + %o3]
	nop
	set	0x48, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf0
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o6
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf1
	membar	#Sync
	nop
	set	0x70, %i5
	std	%f0,	[%l7 + %i5]
	set	0x34, %o1
	stwa	%o2,	[%l7 + %o1] 0x80
	set	0x40, %l4
	stda	%g2,	[%l7 + %l4] 0x88
	nop
	set	0x2C, %i3
	lduh	[%l7 + %i3],	%o7
	nop
	set	0x5C, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%g2
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x0C, %o2
	swap	[%l7 + %o2],	%l1
	or	%o5,	%o0,	%i3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%l2
	nop
	set	0x70, %g1
	lduw	[%l7 + %g1],	%g4
	fpsub16	%f20,	%f0,	%f12
	set	0x60, %l1
	stwa	%i1,	[%l7 + %l1] 0x80
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x88,	%f21
	set	0x6A, %o4
	stha	%l6,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x74, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%i7
	nop
	set	0x26, %g7
	ldsh	[%l7 + %g7],	%i6
	set	0x44, %g3
	sta	%f8,	[%l7 + %g3] 0x80
	st	%fsr,	[%l7 + 0x10]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%g6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%o4
	set	0x24, %o7
	swapa	[%l7 + %o7] 0x80,	%i2
	nop
	set	0x40, %g6
	stx	%o1,	[%l7 + %g6]
	set	0x30, %i2
	lda	[%l7 + %i2] 0x88,	%f29
	add	%l3,	%g1,	%i4
	set	0x71, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g5
	nop
	set	0x5C, %o0
	stw	%i0,	[%l7 + %o0]
	set	0x50, %i6
	ldstuba	[%l7 + %i6] 0x89,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%o6
	nop
	set	0x50, %l3
	stw	%o2,	[%l7 + %l3]
	nop
	set	0x20, %l6
	stx	%l5,	[%l7 + %l6]
	and	%o7,	%g2,	%g3
	set	0x0C, %g2
	swapa	[%l7 + %g2] 0x89,	%l1
	set	0x28, %l2
	lda	[%l7 + %l2] 0x89,	%f9
	wr	%o5,	%i3,	%softint
	nop
	set	0x70, %o3
	std	%f0,	[%l7 + %o3]
	nop
	set	0x3B, %g5
	ldstub	[%l7 + %g5],	%o0
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	or	%l2,	%g4,	%i1
	st	%f14,	[%l7 + 0x54]
	and	%g7,	%l6,	%i7
	nop
	set	0x50, %i5
	std	%i6,	[%l7 + %i5]
	nop
	set	0x44, %l0
	ldsw	[%l7 + %l0],	%g6
	nop
	set	0x38, %o1
	std	%o2,	[%l7 + %o1]
	nop
	set	0x29, %i3
	ldub	[%l7 + %i3],	%l4
	set	0x18, %l4
	lda	[%l7 + %l4] 0x89,	%f0
	or	%i2,	%o4,	%l3
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd2
	nop
	set	0x14, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x24, %o2
	stha	%o1,	[%l7 + %o2] 0x89
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd0
	nop
	set	0x16, %l5
	lduh	[%l7 + %l5],	%g1
	nop
	set	0x68, %i0
	std	%i4,	[%l7 + %i0]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%i0
	set	0x38, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o2
	nop
	set	0x0B, %o6
	stb	%o6,	[%l7 + %o6]
	set	0x68, %i7
	lda	[%l7 + %i7] 0x88,	%f26
	set	0x78, %g7
	stha	%o7,	[%l7 + %g7] 0x81
	set	0x0A, %o4
	stha	%l5,	[%l7 + %o4] 0x89
	nop
	set	0x2C, %g3
	ldsw	[%l7 + %g3],	%g3
	nop
	set	0x49, %o7
	ldsb	[%l7 + %o7],	%l1
	st	%fsr,	[%l7 + 0x2C]
	set	0x28, %i2
	stxa	%g2,	[%l7 + %i2] 0x89
	and	%o5,	%i3,	%l2
	nop
	set	0x14, %g6
	ldsw	[%l7 + %g6],	%g4
	set	0x24, %o5
	lda	[%l7 + %o5] 0x80,	%f0
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	set	0x26, %l3
	sth	%o0,	[%l7 + %l3]
	nop
	set	0x56, %o0
	ldsh	[%l7 + %o0],	%l6
	set	0x2E, %l6
	stha	%i7,	[%l7 + %l6] 0x88
	add	%i6,	%g6,	%o3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f0
	and	%g7,	%i2,	%l4
	bl,pn	%xcc,	loop_11
	nop
	set	0x78, %o3
	std	%f18,	[%l7 + %o3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%o4
loop_11:
	nop
	set	0x40, %l2
	stda	%g0,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x76, %g5
	ldsh	[%l7 + %g5],	%o1
	nop
	set	0x40, %i5
	stx	%i4,	[%l7 + %i5]
	fpadd32s	%f28,	%f22,	%f3
	or	%g5,	%i5,	%i0
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc4
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x88,	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o7
	nop
	set	0x70, %o1
	prefetch	[%l7 + %o1],	 3
	set	0x38, %i3
	stxa	%l5,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x70, %l4
	stda	%g2,	[%l7 + %l4] 0x81
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%o5
	or	%i3,	%g2,	%g4
	nop
	set	0x5C, %g4
	stb	%l2,	[%l7 + %g4]
	set	0x48, %o2
	stda	%o0,	[%l7 + %o2] 0x89
	set	0x7C, %l5
	sta	%f19,	[%l7 + %l5] 0x81
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x80,	%l6
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f4
	set	0x60, %i0
	stxa	%i7,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x71, %i7
	ldstub	[%l7 + %i7],	%i6
	nop
	set	0x38, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x40, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x74, %o6
	stha	%g6,	[%l7 + %o6] 0x80
	nop
	set	0x44, %g3
	lduw	[%l7 + %g3],	%i1
	nop
	set	0x18, %i2
	std	%g6,	[%l7 + %i2]
	ld	[%l7 + 0x54],	%f2
	set	0x18, %g6
	lda	[%l7 + %g6] 0x88,	%f31
	st	%fsr,	[%l7 + 0x74]
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
	nop
	set	0x16, %o5
	ldsb	[%l7 + %o5],	%l4
	st	%fsr,	[%l7 + 0x54]
	set	0x34, %i6
	stba	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x2E, %o0
	lduh	[%l7 + %o0],	%o4
	set	0x08, %l6
	stxa	%g1,	[%l7 + %l6] 0x88
	nop
	set	0x28, %l3
	stx	%o1,	[%l7 + %l3]
	set	0x38, %o3
	stda	%l2,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x50, %g2
	stda	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x88,	%i4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o2
	or	%l0,	%o7,	%i4
	fpsub16	%f30,	%f24,	%f30
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%o5
	ld	[%l7 + 0x68],	%f4
	st	%f9,	[%l7 + 0x6C]
	set	0x77, %l2
	stba	%o6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x36, %i5
	ldstub	[%l7 + %i5],	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%l2
	ld	[%l7 + 0x64],	%f28
	or	%g4,	%l6,	%o0
	nop
	set	0x16, %i4
	ldstub	[%l7 + %i4],	%i6
	nop
	set	0x23, %o1
	ldsb	[%l7 + %o1],	%g6
	set	0x10, %l0
	stxa	%i1,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x4E, %i3
	ldub	[%l7 + %i3],	%i7
	set	0x0C, %l4
	lda	[%l7 + %l4] 0x89,	%f8
	add	%o3,	%l4,	%g7
	wr	%o4,	%i2,	%pic
	fpadd16	%f24,	%f28,	%f2
	set	0x20, %i1
	stha	%o1,	[%l7 + %i1] 0x88
	add	%g1,	%g5,	%l3
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f22
	nop
	set	0x40, %l5
	ldstub	[%l7 + %l5],	%i0
	nop
	set	0x48, %g4
	stx	%i5,	[%l7 + %g4]
	set	0x20, %g1
	stda	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x18, %i0
	ldsh	[%l7 + %i0],	%l0
	wr	%i4,	%o7,	%clear_softint
	fpadd16s	%f1,	%f2,	%f29
	set	0x0E, %l1
	stba	%l5,	[%l7 + %l1] 0x88
	nop
	set	0x39, %i7
	ldsb	[%l7 + %i7],	%l1
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x48, %g7
	ldsw	[%l7 + %g7],	%g3
	st	%f11,	[%l7 + 0x20]
	set	0x10, %o4
	stxa	%o6,	[%l7 + %o4] 0xea
	membar	#Sync
	or	%o5,	%g2,	%i3
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%g4
	st	%fsr,	[%l7 + 0x40]
	fpadd16s	%f20,	%f15,	%f2
	set	0x6C, %i2
	sta	%f14,	[%l7 + %i2] 0x81
	nop
	set	0x10, %g6
	swap	[%l7 + %g6],	%l6
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x88,	%o0
	fpsub32s	%f29,	%f4,	%f23
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%g6
	and	%l2,	%i7,	%i1
	nop
	set	0x38, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
	set	0x1C, %i6
	swapa	[%l7 + %i6] 0x81,	%l4
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xea,	%o2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f16
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x89,	%o4
	set	0x78, %o3
	stda	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x20, %g5
	stda	%g6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x70, %l2
	std	%g0,	[%l7 + %l2]
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	fpsub16s	%f15,	%f23,	%f6
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf8
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%o1
	nop
	set	0x58, %g2
	swap	[%l7 + %g2],	%i0
	set	0x54, %o1
	swapa	[%l7 + %o1] 0x81,	%l3
	nop
	set	0x25, %i3
	ldstub	[%l7 + %i3],	%o2
	nop
	set	0x18, %l4
	stw	%i5,	[%l7 + %l4]
	nop
	set	0x20, %i1
	lduw	[%l7 + %i1],	%i4
	nop
	set	0x40, %o2
	std	%f28,	[%l7 + %o2]
	nop
	set	0x3E, %l5
	ldstub	[%l7 + %l5],	%o7
	nop
	set	0x3F, %l0
	ldub	[%l7 + %l0],	%l5
	nop
	set	0x78, %g4
	lduw	[%l7 + %g4],	%l0
	bgu,pn	%icc,	loop_12
	st	%f16,	[%l7 + 0x24]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f16
loop_12:
	nop
	set	0x0A, %i0
	ldsh	[%l7 + %i0],	%l1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd2,	%f16
	set	0x5C, %g7
	sta	%f24,	[%l7 + %g7] 0x81
	and	%g3,	%o6,	%g2
	set	0x2C, %o4
	sta	%f15,	[%l7 + %o4] 0x89
	nop
	set	0x38, %o6
	std	%f18,	[%l7 + %o6]
	nop
	set	0x5B, %i7
	ldstub	[%l7 + %i7],	%o5
	nop
	set	0x5D, %i2
	ldub	[%l7 + %i2],	%g4
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x30, %g3
	lduh	[%l7 + %g3],	%i3
	and	%l6,	%i6,	%g6
	set	0x74, %o5
	stha	%l2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x50, %o7
	stxa	%i7,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xea,	%o0
	nop
	set	0x38, %l3
	stx	%l4,	[%l7 + %l3]
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x81,	%o3
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf8
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f16
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x81,	%o4
	nop
	set	0x6C, %i5
	stw	%i1,	[%l7 + %i5]
	set	0x70, %i4
	stda	%i2,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x6E, %g5
	ldsb	[%l7 + %g5],	%g7
	set	0x68, %g2
	stwa	%g1,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%g5
	st	%fsr,	[%l7 + 0x7C]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l3
	or	%o2,	%i0,	%i5
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x1C, %i1
	lduw	[%l7 + %i1],	%i4
	nop
	set	0x20, %o2
	sth	%l5,	[%l7 + %o2]
	wr	%o7,	%l1,	%pic
	wr	%l0,	%o6,	%set_softint
	set	0x08, %l4
	lda	[%l7 + %l4] 0x88,	%f13
	be,a	%xcc,	loop_13
	bleu,a,pn	%icc,	loop_14
	and	%g2,	%g3,	%g4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o5
loop_13:
	wr 	%g0, 	0x6, 	%fprs
loop_14:
	nop
	set	0x74, %l0
	stba	%l2,	[%l7 + %l0] 0x88
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%g6
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f12
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x10, %i0
	stx	%l4,	[%l7 + %i0]
	nop
	set	0x17, %l1
	stb	%o3,	[%l7 + %l1]
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%o0
	set	0x30, %o6
	stwa	%o4,	[%l7 + %o6] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%i2
	set	0x7F, %o4
	ldstuba	[%l7 + %o4] 0x81,	%g7
	set	0x78, %i7
	stxa	%g1,	[%l7 + %i7] 0x80
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%g5
	set	0x5C, %i2
	lda	[%l7 + %i2] 0x80,	%f10
	nop
	set	0x70, %g3
	std	%f20,	[%l7 + %g3]
	nop
	set	0x7C, %o7
	ldsw	[%l7 + %o7],	%l3
	and	%o1,	%o2,	%i0
	set	0x4B, %l6
	stba	%i5,	[%l7 + %l6] 0x81
	nop
	set	0x55, %l3
	ldub	[%l7 + %l3],	%i4
	set	0x6A, %o5
	stba	%o7,	[%l7 + %o5] 0x89
	nop
	set	0x78, %o0
	stx	%l5,	[%l7 + %o0]
	nop
	set	0x20, %o3
	ldsh	[%l7 + %o3],	%l0
	nop
	set	0x78, %i6
	ldsh	[%l7 + %i6],	%o6
	fpsub16s	%f25,	%f22,	%f5
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%g2
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%l1
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%g2
	set	0x0D, %g2
	ldstuba	[%l7 + %g2] 0x88,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%i6
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f30
	set	0x34, %i4
	sta	%f28,	[%l7 + %i4] 0x80
	set	0x20, %i3
	stba	%i3,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x81,	%f11
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%l6
	nop
	set	0x68, %l0
	stx	%g6,	[%l7 + %l0]
	nop
	set	0x6E, %g4
	ldsh	[%l7 + %g4],	%l2
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%l4
	bn,a	%icc,	loop_15
	ld	[%l7 + 0x54],	%f10
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%o0
loop_15:
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%i7
	bl,a,pt	%xcc,	loop_16
	fpadd16s	%f10,	%f22,	%f13
	ld	[%l7 + 0x6C],	%f5
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
loop_16:
	nop
	set	0x11, %l1
	ldub	[%l7 + %l1],	%o4
	nop
	set	0x74, %g7
	ldsw	[%l7 + %g7],	%i1
	nop
	set	0x50, %l5
	std	%f30,	[%l7 + %l5]
	nop
	set	0x48, %o6
	sth	%g7,	[%l7 + %o6]
	nop
	set	0x74, %i7
	ldsh	[%l7 + %i7],	%i2
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%g5
	nop
	set	0x75, %i2
	ldsb	[%l7 + %i2],	%l3
	nop
	set	0x2D, %o4
	stb	%g1,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x4C]
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	nop
	set	0x5C, %g3
	ldsh	[%l7 + %g3],	%i0
	nop
	set	0x48, %l6
	std	%o2,	[%l7 + %l6]
	set	0x68, %o5
	stda	%i4,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x78, %l3
	sta	%f12,	[%l7 + %l3] 0x81
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	set	0x79, %i6
	ldstuba	[%l7 + %i6] 0x88,	%i4
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%l4
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x80,	%o7
	add	%l0,	%o6,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%g3
	and	%g4,	%o5,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%l6
	set	0x4C, %i5
	swapa	[%l7 + %i5] 0x88,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%i7
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x81,	 2
	set	0x18, %o1
	stda	%o0,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x0E, %i4
	ldstuba	[%l7 + %i4] 0x89,	%i1
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x88,	 4
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x4E, %l4
	lduh	[%l7 + %l4],	%i2
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x89
	and	%g5,	%l3,	%o1
	nop
	set	0x4C, %i1
	ldsh	[%l7 + %i1],	%i0
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x48, %g4
	std	%f4,	[%l7 + %g4]
	nop
	set	0x22, %i0
	ldsh	[%l7 + %i0],	%g1
	st	%f21,	[%l7 + 0x70]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd8,	%f0
	ld	[%l7 + 0x70],	%f16
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%i5
	nop
	set	0x58, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%l5
	set	0x7D, %g7
	stba	%i4,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x46, %i7
	sth	%o7,	[%l7 + %i7]
	set	0x17, %o6
	stba	%o6,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x46, %g6
	ldub	[%l7 + %g6],	%l0
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x37, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l1
	nop
	set	0x50, %g3
	stx	%g3,	[%l7 + %g3]
	nop
	set	0x5C, %o5
	stw	%g2,	[%l7 + %o5]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x1E, %l3
	ldstub	[%l7 + %l3],	%o5
	set	0x30, %i6
	stda	%i2,	[%l7 + %i6] 0x88
	nop
	set	0x5A, %o3
	ldstub	[%l7 + %o3],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%i6
	set	0x57, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l4
	nop
	set	0x30, %o0
	std	%f14,	[%l7 + %o0]
	wr	%l2,	%o3,	%set_softint
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x80,	%i7
	set	0x78, %g5
	stda	%o4,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x68, %o1
	stx	%g6,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%g7
	nop
	set	0x08, %i4
	std	%f10,	[%l7 + %i4]
	fpsub16s	%f23,	%f21,	%f7
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%i2
	or	%g5,	%l3,	%o1
	nop
	set	0x38, %g2
	swap	[%l7 + %g2],	%g1
	nop
	set	0x30, %l0
	ldsb	[%l7 + %l0],	%i5
	nop
	set	0x58, %o2
	ldsh	[%l7 + %o2],	%i0
	nop
	set	0x0C, %i1
	ldsh	[%l7 + %i1],	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%o7
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f28
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%o6
	nop
	set	0x18, %l1
	stw	%i4,	[%l7 + %l1]
	nop
	set	0x68, %l5
	stx	%l1,	[%l7 + %l5]
	set	0x0C, %g7
	stwa	%g3,	[%l7 + %g7] 0x80
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x23, %o6
	ldub	[%l7 + %o6],	%l0
	nop
	set	0x54, %i2
	lduw	[%l7 + %i2],	%g2
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x88,	%o5
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%i2
	nop
	set	0x49, %g6
	ldsb	[%l7 + %g6],	%l6
	set	0x61, %g3
	stba	%g4,	[%l7 + %g3] 0x89
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%l4
	set	0x08, %o5
	stxa	%l2,	[%l7 + %o5] 0x80
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f16
	set	0x08, %i6
	lda	[%l7 + %i6] 0x89,	%f19
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%i6
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x80,	%f15
	set	0x10, %l2
	sta	%f29,	[%l7 + %l2] 0x88
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x64, %i5
	ldsw	[%l7 + %i5],	%i7
	set	0x28, %g5
	stwa	%o3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x30, %i3
	stwa	%g6,	[%l7 + %i3] 0x89
	nop
	set	0x34, %i4
	ldsw	[%l7 + %i4],	%i1
	set	0x08, %l4
	stwa	%o4,	[%l7 + %l4] 0x80
	set	0x3E, %g2
	ldstuba	[%l7 + %g2] 0x88,	%g7
	nop
	set	0x68, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x08, %o2
	stda	%o0,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%g5
	nop
	set	0x28, %i1
	lduw	[%l7 + %i1],	%i2
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x54, %g4
	prefetch	[%l7 + %g4],	 2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%g1
	bgu	%xcc,	loop_17
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f2
	nop
	set	0x50, %l5
	stb	%l3,	[%l7 + %l5]
	set	0x44, %g7
	sta	%f20,	[%l7 + %g7] 0x88
loop_17:
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	or	%i5,	%l5,	%i0
	set	0x1C, %l1
	swapa	[%l7 + %l1] 0x80,	%o7
	nop
	set	0x14, %o6
	stw	%o6,	[%l7 + %o6]
	nop
	set	0x6A, %i2
	ldstub	[%l7 + %i2],	%o2
	nop
	set	0x60, %i7
	std	%i4,	[%l7 + %i7]
	set	0x30, %o7
	stxa	%g3,	[%l7 + %o7] 0x88
	nop
	set	0x0C, %g6
	stw	%l0,	[%l7 + %g6]
	fpsub16	%f30,	%f8,	%f18
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%o5
	set	0x56, %g3
	stha	%g2,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x58, %o5
	stx	%l6,	[%l7 + %o5]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x89
	and	%i3,	%l4,	%g4
	wr	%l2,	%i7,	%ccr
	nop
	set	0x34, %i6
	ldsh	[%l7 + %i6],	%i6
	nop
	set	0x17, %o3
	ldub	[%l7 + %o3],	%g6
	nop
	set	0x78, %l6
	std	%f10,	[%l7 + %l6]
	nop
	set	0x5E, %l3
	sth	%i1,	[%l7 + %l3]
	nop
	set	0x52, %l2
	ldub	[%l7 + %l2],	%o4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%o3
	st	%f14,	[%l7 + 0x68]
	set	0x58, %i5
	sta	%f31,	[%l7 + %i5] 0x89
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x89,	%o0
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x89,	%g5
	nop
	set	0x54, %l4
	ldub	[%l7 + %l4],	%i2
	nop
	set	0x30, %g2
	stx	%g7,	[%l7 + %g2]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xe3,	%g0
	nop
	set	0x44, %o1
	stb	%l3,	[%l7 + %o1]
	fpadd16	%f18,	%f12,	%f2
	nop
	set	0x54, %o2
	sth	%o1,	[%l7 + %o2]
	set	0x20, %l0
	stxa	%l5,	[%l7 + %l0] 0xea
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%o7
	and	%i0,	%o2,	%i4
	bg,pn	%icc,	loop_18
	nop
	set	0x1C, %g4
	ldsw	[%l7 + %g4],	%g3
	add	%l0,	%o6,	%o5
	nop
	set	0x3E, %i1
	ldub	[%l7 + %i1],	%l1
loop_18:
	nop
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f0
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x81,	%l6
	set	0x60, %l1
	stda	%g2,	[%l7 + %l1] 0xea
	membar	#Sync
	or	%l4,	%g4,	%i3
	nop
	set	0x70, %i0
	stx	%i7,	[%l7 + %i0]
	nop
	set	0x18, %o6
	swap	[%l7 + %o6],	%i6
	nop
	set	0x74, %i7
	swap	[%l7 + %i7],	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%g6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%o3
	ble,pt	%icc,	loop_19
	bn,a	%xcc,	loop_20
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%o0
	nop
	set	0x7C, %i2
	prefetch	[%l7 + %i2],	 0
loop_19:
	nop
	set	0x49, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g5
loop_20:
	and	%g7,	%i2,	%l3
	add	%o1,	%l5,	%g1
	wr	%i5,	%o7,	%y
	nop
	set	0x26, %g3
	stb	%o2,	[%l7 + %g3]
	wr	%i4,	%g3,	%softint
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%l0
	set	0x10, %o4
	stha	%o6,	[%l7 + %o4] 0x89
	wr	%o5,	%l6,	%set_softint
	add	%g2,	%l4,	%g4
	set	0x70, %i6
	stda	%i2,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	nop
	set	0x58, %l6
	sth	%i7,	[%l7 + %l6]
	nop
	set	0x3E, %o3
	stb	%i6,	[%l7 + %o3]
	nop
	set	0x10, %l3
	stx	%l2,	[%l7 + %l3]
	set	0x38, %o0
	stxa	%i1,	[%l7 + %o0] 0xe2
	membar	#Sync
	st	%f21,	[%l7 + 0x60]
	ld	[%l7 + 0x7C],	%f15
	set	0x68, %i5
	ldxa	[%l7 + %i5] 0x88,	%l1
	nop
	set	0x50, %i3
	ldsb	[%l7 + %i3],	%o4
	set	0x14, %l2
	stwa	%o3,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x30, %i4
	stx	%g6,	[%l7 + %i4]
	set	0x0B, %g2
	stba	%o0,	[%l7 + %g2] 0x81
	nop
	set	0x28, %l4
	std	%g6,	[%l7 + %l4]
	set	0x20, %o1
	stda	%i2,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x62, %g5
	ldstub	[%l7 + %g5],	%g5
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	nop
	set	0x0C, %g4
	sth	%l5,	[%l7 + %g4]
	set	0x0C, %i1
	stwa	%o1,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x2A, %l0
	stha	%g1,	[%l7 + %l0] 0x80
	wr	%o7,	%i5,	%clear_softint
	set	0x5F, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i4
	or	%o2,	%i0,	%g3
	bleu,a	%icc,	loop_21
	nop
	set	0x78, %g7
	std	%o6,	[%l7 + %g7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%l6
loop_21:
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%l0
	add	%l4,	%g2,	%g4
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%i3
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f24
	add	%i6,	%i7,	%i1
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%l2
	wr	%l1,	%o3,	%y
	set	0x18, %i7
	stwa	%g6,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x28, %i2
	stda	%o4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x40, %g6
	std	%f0,	[%l7 + %g6]
	nop
	set	0x76, %g3
	sth	%g7,	[%l7 + %g3]
	nop
	set	0x65, %o4
	ldstub	[%l7 + %o4],	%i2
	nop
	set	0x32, %i6
	ldsb	[%l7 + %i6],	%g5
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%o0
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%l3
	nop
	set	0x10, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x48, %o3
	lduw	[%l7 + %o3],	%o1
	nop
	set	0x27, %o0
	stb	%g1,	[%l7 + %o0]
	add	%o7,	%i5,	%l5
	nop
	set	0x3E, %l3
	ldstub	[%l7 + %l3],	%o2
	nop
	set	0x64, %i5
	ldstub	[%l7 + %i5],	%i4
	set	0x30, %i3
	stha	%i0,	[%l7 + %i3] 0x80
	nop
	set	0x08, %i4
	std	%g2,	[%l7 + %i4]
	nop
	set	0x3D, %l2
	ldub	[%l7 + %l2],	%o6
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x88,	 0
	set	0x7C, %o1
	stwa	%l6,	[%l7 + %o1] 0x80
	set	0x28, %g2
	swapa	[%l7 + %g2] 0x88,	%l4
	set	0x3C, %g5
	stha	%g2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x81,	 3
	set	0x30, %o2
	stwa	%i3,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%g4
	set	0x08, %l5
	stda	%i6,	[%l7 + %l5] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i7
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x80,	%l2
	add	%l1,	%g6,	%o3
	nop
	set	0x7F, %g1
	stb	%g7,	[%l7 + %g1]
	nop
	set	0x1C, %l0
	ldsw	[%l7 + %l0],	%o4
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%g5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%o0
	nop
	set	0x2A, %o6
	ldsb	[%l7 + %o6],	%l3
	nop
	set	0x12, %i0
	ldstub	[%l7 + %i0],	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i5
	nop
	set	0x4C, %i7
	sth	%l5,	[%l7 + %i7]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%g3
	and	%o6,	%o5,	%l6
	set	0x56, %g6
	stha	%o7,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%g2
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%l0
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%l4
	set	0x10, %o7
	ldxa	[%l7 + %o7] 0x80,	%i6
	fpadd16	%f20,	%f22,	%f26
	or	%g4,	%i7,	%i1
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%l1
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l2
	nop
	set	0x18, %o3
	lduw	[%l7 + %o3],	%o3
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	nop
	set	0x1C, %l3
	stw	%g7,	[%l7 + %l3]
	set	0x0C, %i5
	sta	%f28,	[%l7 + %i5] 0x88
	nop
	set	0x28, %i3
	lduw	[%l7 + %i3],	%g5
	ld	[%l7 + 0x38],	%f25
	or	%i2,	%o0,	%l3
	nop
	set	0x70, %i4
	std	%o4,	[%l7 + %i4]
	nop
	nop
	setx	0x01278D3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x0046370C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f15,	%f21
	nop
	set	0x3E, %l2
	ldsb	[%l7 + %l2],	%o1
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xeb,	%g0
	set	0x08, %l4
	stwa	%i5,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%l4
	nop
	set	0x45, %g4
	stb	%i4,	[%l7 + %g4]
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x88,	%o2
	set	0x4C, %o2
	sta	%f3,	[%l7 + %o2] 0x89
	nop
	set	0x66, %i1
	lduh	[%l7 + %i1],	%i0
	nop
	set	0x53, %g7
	ldstub	[%l7 + %g7],	%o6
	nop
	set	0x1E, %g1
	ldsh	[%l7 + %g1],	%o5
	nop
	set	0x20, %l5
	sth	%l6,	[%l7 + %l5]
	ld	[%l7 + 0x78],	%f5
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%o7
	st	%fsr,	[%l7 + 0x60]
	set	0x1C, %l1
	sta	%f23,	[%l7 + %l1] 0x88
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xe2,	%g2
	nop
	set	0x20, %i7
	std	%f22,	[%l7 + %i7]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%i3
	nop
	set	0x28, %o6
	swap	[%l7 + %o6],	%l0
	wr	%l4,	%i6,	%sys_tick
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x51, %o4
	stb	%i7,	[%l7 + %o4]
	set	0x38, %i6
	swapa	[%l7 + %i6] 0x88,	%i1
	nop
	set	0x10, %g6
	lduw	[%l7 + %g6],	%l1
	nop
	set	0x08, %o5
	swap	[%l7 + %o5],	%g4
	nop
	set	0x38, %o7
	ldsw	[%l7 + %o7],	%l2
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x81,	 3
	nop
	set	0x60, %g3
	stx	%g7,	[%l7 + %g3]
	set	0x46, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g5
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%g6,	%o0,	%l3
	nop
	set	0x58, %i5
	swap	[%l7 + %i5],	%o4
	nop
	set	0x4E, %i3
	stb	%o1,	[%l7 + %i3]
	set	0x0C, %o3
	stwa	%g1,	[%l7 + %o3] 0xea
	membar	#Sync
	wr	%i2,	%i5,	%softint
	set	0x6A, %l2
	stba	%l5,	[%l7 + %l2] 0xea
	membar	#Sync
	wr	%i4,	%o2,	%softint
	nop
	set	0x10, %o1
	sth	%i0,	[%l7 + %o1]
	set	0x78, %i4
	swapa	[%l7 + %i4] 0x81,	%o6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f16
	wr	%l6,	%o5,	%ccr
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x89,	%g2
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x80,	 1
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%i3
	wr	%o7,	%l4,	%y
	nop
	set	0x60, %i1
	stx	%i6,	[%l7 + %i1]
	nop
	set	0x20, %g4
	std	%l0,	[%l7 + %g4]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%i7
	and	%g4,	%l1,	%o3
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%f26
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f16
	be,pn	%icc,	loop_22
	ba	%icc,	loop_23
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%l2
	nop
	set	0x58, %l1
	swap	[%l7 + %l1],	%g7
loop_22:
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f12
loop_23:
	nop
	set	0x11, %l0
	ldsb	[%l7 + %l0],	%g5
	fpadd32s	%f0,	%f3,	%f31
	nop
	set	0x43, %o6
	ldstub	[%l7 + %o6],	%g6
	nop
	set	0x3C, %i2
	lduw	[%l7 + %i2],	%l3
	nop
	set	0x7B, %i7
	stb	%o4,	[%l7 + %i7]
	or	%o1,	%o0,	%i2
	wr 	%g0, 	0x7, 	%fprs
	set	0x60, %i6
	sta	%f21,	[%l7 + %i6] 0x80
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc8
	nop
	set	0x78, %g6
	std	%f30,	[%l7 + %g6]
	set	0x50, %o5
	lda	[%l7 + %o5] 0x81,	%f22
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x80,	%l4
	nop
	set	0x6C, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x89,	%i4
	add	%i0,	%o6,	%o2
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	nop
	set	0x5E, %i3
	ldstub	[%l7 + %i3],	%g2
	nop
	set	0x39, %i5
	ldsb	[%l7 + %i5],	%g3
	nop
	set	0x08, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%i3
	set	0x71, %o1
	stba	%o5,	[%l7 + %o1] 0x88
	nop
	set	0x6C, %i4
	stw	%l4,	[%l7 + %i4]
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x74, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x08, %o2
	lduw	[%l7 + %o2],	%i6
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%l0
	set	0x70, %g4
	lda	[%l7 + %g4] 0x88,	%f4
	nop
	set	0x68, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x1A, %l5
	ldub	[%l7 + %l5],	%o7
	set	0x50, %g7
	stha	%i7,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x5B, %l1
	stb	%g4,	[%l7 + %l1]
	nop
	set	0x24, %i0
	prefetch	[%l7 + %i0],	 0
	fpsub32s	%f27,	%f16,	%f29
	set	0x68, %l0
	stwa	%l1,	[%l7 + %l0] 0x81
	nop
	set	0x36, %i1
	lduh	[%l7 + %i1],	%o3
	set	0x28, %o6
	stxa	%i1,	[%l7 + %o6] 0x80
	nop
	set	0x62, %i2
	ldsh	[%l7 + %i2],	%g7
	nop
	set	0x50, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	nop
	set	0x6B, %i6
	ldub	[%l7 + %i6],	%l2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x35, %g6
	ldub	[%l7 + %g6],	%g6
	nop
	set	0x4E, %o5
	ldsh	[%l7 + %o5],	%g5
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x88,	%l3
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xeb,	%o4
	nop
	set	0x68, %g3
	stx	%o1,	[%l7 + %g3]
	and	%o0,	%i5,	%g1
	nop
	set	0x68, %o0
	lduw	[%l7 + %o0],	%i2
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x80,	%i4
	nop
	set	0x28, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x60, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x51, %i5
	ldstuba	[%l7 + %i5] 0x80,	%l5
	or	%i0,	%o6,	%o2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%i6
	nop
	set	0x77, %i4
	stb	%g2,	[%l7 + %i4]
	st	%f29,	[%l7 + 0x4C]
	nop
	set	0x7E, %g2
	stb	%i3,	[%l7 + %g2]
	ba,a,pn	%xcc,	loop_24
	st	%fsr,	[%l7 + 0x30]
	or	%o5,	%g3,	%l4
	nop
	set	0x40, %o3
	stx	%fsr,	[%l7 + %o3]
loop_24:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%i6
	ld	[%l7 + 0x24],	%f10
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%o6
	nop
	set	0x3F, %g5
	stb	%i7,	[%l7 + %g5]
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%l1
	nop
	set	0x3A, %g1
	lduh	[%l7 + %g1],	%o3
	set	0x70, %l5
	stxa	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x19, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g7
	add	%l2,	%g6,	%i1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f0
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x88,	%g5
	nop
	set	0x14, %i0
	ldstub	[%l7 + %i0],	%o4
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%o1
	set	0x30, %i1
	stda	%o0,	[%l7 + %i1] 0x89
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x89,	 4
	nop
	set	0x58, %i7
	std	%f18,	[%l7 + %i7]
	nop
	set	0x7C, %o4
	sth	%g1,	[%l7 + %o4]
	set	0x18, %i2
	stda	%i2,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f16
	nop
	set	0x6E, %i6
	ldsh	[%l7 + %i6],	%l3
	nop
	set	0x1C, %l6
	lduh	[%l7 + %l6],	%l5
	set	0x18, %o7
	stda	%i4,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x80,	 3
	st	%fsr,	[%l7 + 0x78]
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x89,	%o6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%g2
	nop
	set	0x5C, %g3
	ldsw	[%l7 + %g3],	%l6
	st	%f9,	[%l7 + 0x14]
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i2
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%o5
	nop
	set	0x4C, %i5
	ldsw	[%l7 + %i5],	%g3
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x88,	%l0
	set	0x48, %o1
	stda	%l4,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x60, %g2
	stda	%i6,	[%l7 + %g2] 0x81
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x81,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o3
	and	%g4,	%g7,	%l2
	nop
	nop
	setx	0xE53852D2DEC1BFE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xCB02C55D36D1B900,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f4
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%g6
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x88
	set	0x2E, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i1
	set	0x38, %l4
	stxa	%g5,	[%l7 + %l4] 0x81
	st	%f16,	[%l7 + 0x1C]
	set	0x48, %l5
	stxa	%o4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x6F, %g1
	ldub	[%l7 + %g1],	%o1
	fpadd32s	%f25,	%f20,	%f15
	or	%o0,	%i5,	%g1
	nop
	set	0x60, %l1
	stx	%i2,	[%l7 + %l1]
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x81,	%i7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%l5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf0
	membar	#Sync
	set	0x50, %l0
	stxa	%i0,	[%l7 + %l0] 0x89
	nop
	set	0x60, %i0
	std	%o6,	[%l7 + %i0]
	set	0x18, %i1
	stda	%o2,	[%l7 + %i1] 0x80
	nop
	set	0x68, %o6
	std	%f0,	[%l7 + %o6]
	ld	[%l7 + 0x30],	%f25
	nop
	set	0x20, %i7
	swap	[%l7 + %i7],	%g2
	nop
	set	0x38, %o4
	swap	[%l7 + %o4],	%l6
	st	%f27,	[%l7 + 0x44]
	nop
	set	0x5C, %g6
	stw	%i4,	[%l7 + %g6]
	set	0x56, %i6
	stha	%i3,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x3A, %l6
	stba	%g3,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x54, %o7
	lduw	[%l7 + %o7],	%l0
	nop
	set	0x09, %i2
	stb	%o5,	[%l7 + %i2]
	nop
	set	0x78, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x14, %g3
	stwa	%l4,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f16
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f24
	set	0x50, %i5
	lda	[%l7 + %i5] 0x89,	%f20
	set	0x20, %i3
	ldda	[%l7 + %i3] 0xe3,	%o6
	nop
	set	0x47, %l2
	stb	%l1,	[%l7 + %l2]
	set	0x08, %o1
	swapa	[%l7 + %o1] 0x89,	%o3
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%i6
	set	0x08, %g2
	sta	%f10,	[%l7 + %g2] 0x89
	ld	[%l7 + 0x40],	%f2
	set	0x36, %i4
	stba	%g4,	[%l7 + %i4] 0x89
	set	0x70, %o2
	stha	%g7,	[%l7 + %o2] 0x89
	set	0x5C, %g5
	sta	%f7,	[%l7 + %g5] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%g6
	set	0x58, %l4
	swapa	[%l7 + %l4] 0x81,	%g5
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x88,	%i1
	set	0x5B, %l1
	stba	%o1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%o4
	add	%i5,	%o0,	%g1
	nop
	set	0x34, %g4
	lduw	[%l7 + %g4],	%i7
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	add	%l5,	%i2,	%o6
	st	%f21,	[%l7 + 0x60]
	nop
	set	0x5C, %i0
	sth	%i0,	[%l7 + %i0]
	nop
	set	0x68, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x2C, %i1
	stw	%o2,	[%l7 + %i1]
	set	0x26, %o6
	stha	%g2,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x71, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l6
	ld	[%l7 + 0x2C],	%f5
	nop
	set	0x3C, %g6
	stw	%i3,	[%l7 + %g6]
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%i4
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x78, %l6
	std	%f2,	[%l7 + %l6]
	set	0x56, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g3
	nop
	set	0x6F, %i2
	ldsb	[%l7 + %i2],	%l0
	set	0x18, %o0
	stwa	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x48, %o7
	stxa	%o7,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x38, %o5
	lda	[%l7 + %o5] 0x80,	%f0
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%l0
	fpsub16s	%f3,	%f30,	%f25
	nop
	set	0x50, %i5
	std	%o2,	[%l7 + %i5]
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%o5
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%i6
	or	%g4,	%g7,	%g6
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%g4
	nop
	set	0x48, %o1
	stx	%l2,	[%l7 + %o1]
	nop
	set	0x60, %o3
	std	%f6,	[%l7 + %o3]
	nop
	set	0x40, %i4
	stx	%i1,	[%l7 + %i4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%i5
	nop
	set	0x42, %g2
	ldsh	[%l7 + %g2],	%o4
	nop
	set	0x45, %o2
	ldsb	[%l7 + %o2],	%o0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	set	0x08, %l4
	stwa	%i7,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x58, %l1
	stwa	%l3,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x38, %g7
	lda	[%l7 + %g7] 0x88,	%f22
	fpadd16s	%f31,	%f28,	%f22
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%l4
	set	0x48, %l0
	stwa	%g1,	[%l7 + %l0] 0x81
	nop
	set	0x0C, %i0
	lduh	[%l7 + %i0],	%i2
	nop
	set	0x50, %g1
	ldsw	[%l7 + %g1],	%o6
	nop
	set	0x4B, %i1
	ldstub	[%l7 + %i1],	%i0
	ld	[%l7 + 0x38],	%f21
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x88,	%o2
	set	0x23, %o6
	stba	%g2,	[%l7 + %o6] 0x88
	nop
	set	0x40, %g6
	std	%f6,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%i3
	nop
	set	0x34, %i7
	stb	%i4,	[%l7 + %i7]
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%g2
	nop
	set	0x28, %o4
	stx	%l0,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x78]
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x89,	%l4
	nop
	set	0x38, %o5
	ldsb	[%l7 + %o5],	%o7
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%i6
	set	0x72, %i5
	stha	%o3,	[%l7 + %i5] 0x88
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%i6
	nop
	set	0x40, %o7
	ldsb	[%l7 + %o7],	%o5
	nop
	set	0x48, %l3
	lduh	[%l7 + %l3],	%g4
	nop
	set	0x6A, %i3
	lduh	[%l7 + %i3],	%g6
	wr	%g5,	%l2,	%set_softint
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x81,	 1
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf1,	%f16
	set	0x62, %i4
	stha	%o1,	[%l7 + %i4] 0x80
	nop
	set	0x4C, %g2
	stw	%i1,	[%l7 + %g2]
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%f24
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%o0
	bge,pt	%icc,	loop_25
	st	%fsr,	[%l7 + 0x58]
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x81,	 3
loop_25:
	nop
	set	0x48, %l4
	lduw	[%l7 + %l4],	%i7
	set	0x70, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%i2
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%o6
	fpadd16s	%f14,	%f22,	%f24
	nop
	set	0x3C, %l1
	swap	[%l7 + %l1],	%i0
	nop
	set	0x08, %g4
	std	%l2,	[%l7 + %g4]
	and	%g2,	%o2,	%i4
	nop
	set	0x30, %l0
	ldub	[%l7 + %l0],	%g3
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f0
	nop
	set	0x19, %i1
	ldsb	[%l7 + %i1],	%l0
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xe3,	%l4
	set	0x70, %o6
	stxa	%o7,	[%l7 + %o6] 0x80
	nop
	set	0x40, %g6
	std	%f6,	[%l7 + %g6]
	nop
	set	0x74, %i6
	swap	[%l7 + %i6],	%i3
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%f16
	set	0x58, %l6
	ldxa	[%l7 + %l6] 0x89,	%l6
	nop
	set	0x20, %l5
	ldsw	[%l7 + %l5],	%o3
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f2
	and	%l1,	%o5,	%g4
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	add	%i6,	%g6,	%g5
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x30, %i2
	stx	%l2,	[%l7 + %i2]
	fpsub32s	%f6,	%f27,	%f16
	set	0x14, %g3
	sta	%f13,	[%l7 + %g3] 0x81
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f8
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%g6
	wr	%o1,	%i1,	%softint
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o4
	set	0x5A, %l3
	stha	%g1,	[%l7 + %l3] 0x80
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%l5
	and	%o6,	%i0,	%g2
	nop
	set	0x6A, %i3
	sth	%o2,	[%l7 + %i3]
	set	0x78, %o1
	swapa	[%l7 + %o1] 0x81,	%i4
	nop
	set	0x6B, %o3
	ldub	[%l7 + %o3],	%l3
	nop
	set	0x11, %i4
	ldstub	[%l7 + %i4],	%g3
	nop
	set	0x0C, %g2
	ldsw	[%l7 + %g2],	%l0
	set	0x3C, %l2
	stwa	%l4,	[%l7 + %l2] 0x81
	or	%o7,	%l6,	%i3
	nop
	set	0x18, %o2
	std	%o2,	[%l7 + %o2]
	nop
	set	0x5E, %o5
	ldsh	[%l7 + %o5],	%o5
	st	%fsr,	[%l7 + 0x74]
	or	%g4,	%l1,	%g6
	nop
	set	0x5C, %l4
	ldsw	[%l7 + %l4],	%g5
	and	%i6,	%g7,	%o1
	ld	[%l7 + 0x40],	%f22
	nop
	set	0x58, %g5
	sth	%i1,	[%l7 + %g5]
	nop
	set	0x74, %g7
	swap	[%l7 + %g7],	%i5
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x81,	%l2
	nop
	set	0x60, %g4
	ldstub	[%l7 + %g4],	%i7
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	ld	[%l7 + 0x54],	%f23
	set	0x1D, %i1
	stba	%o4,	[%l7 + %i1] 0x89
	nop
	set	0x68, %l0
	sth	%o0,	[%l7 + %l0]
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f26
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	and	%g1,	%i2,	%l5
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%o6
	set	0x20, %o6
	stxa	%g2,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xda
	set	0x70, %l6
	stxa	%i0,	[%l7 + %l6] 0xeb
	membar	#Sync
	add	%i4,	%l3,	%o2
	nop
	set	0x46, %o4
	lduh	[%l7 + %o4],	%g3
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%l6
	wr	%i3,	%o3,	%y
	fpadd32s	%f26,	%f9,	%f29
	nop
	set	0x16, %i2
	ldub	[%l7 + %i2],	%o5
	nop
	set	0x1C, %g3
	ldsw	[%l7 + %g3],	%g4
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xcc
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%g6
	ld	[%l7 + 0x18],	%f17
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1270
!	Type a   	: 30
!	Type cti   	: 25
!	Type x   	: 527
!	Type f   	: 42
!	Type i   	: 106
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
	set	0x4,	%g1
	set	0x9,	%g2
	set	0x8,	%g3
	set	0x2,	%g4
	set	0xB,	%g5
	set	0x6,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0xA,	%i1
	set	-0x2,	%i2
	set	-0x4,	%i3
	set	-0x2,	%i4
	set	-0xC,	%i5
	set	-0x5,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x1B5E2F9D,	%l0
	set	0x6158E0E4,	%l1
	set	0x58381C94,	%l2
	set	0x1230D2F8,	%l3
	set	0x7182C630,	%l4
	set	0x7324EDBF,	%l5
	set	0x133AF708,	%l6
	!# Output registers
	set	0x110C,	%o0
	set	-0x1AD6,	%o1
	set	0x1DE6,	%o2
	set	0x02AD,	%o3
	set	-0x0192,	%o4
	set	0x133B,	%o5
	set	0x0D52,	%o6
	set	-0x0E88,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	set	0x4C, %o7
	stwa	%g5,	[%l7 + %o7] 0x81
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%i6
	set	0x74, %l3
	stba	%l0,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x61, %i3
	stba	%o1,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x66, %o3
	lduh	[%l7 + %o3],	%i1
	nop
	set	0x20, %i4
	stx	%g7,	[%l7 + %i4]
	nop
	set	0x7E, %o1
	ldstub	[%l7 + %o1],	%i5
	st	%f16,	[%l7 + 0x0C]
	fpsub16	%f20,	%f26,	%f30
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x88,	%l2
	set	0x6A, %o2
	stha	%o4,	[%l7 + %o2] 0x89
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f0
	nop
	set	0x41, %g2
	ldstub	[%l7 + %g2],	%i7
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x76, %g5
	stha	%g1,	[%l7 + %g5] 0xe3
	membar	#Sync
	bg,a,pn	%xcc,	loop_26
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 3
	ld	[%l7 + 0x54],	%f0
	bne,pn	%xcc,	loop_27
loop_26:
	nop
	set	0x18, %l1
	stx	%o0,	[%l7 + %l1]
	nop
	set	0x11, %g1
	ldub	[%l7 + %g1],	%i2
	nop
	set	0x14, %g4
	stw	%o6,	[%l7 + %g4]
loop_27:
	nop
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	st	%fsr,	[%l7 + 0x60]
	set	0x08, %i1
	stwa	%i0,	[%l7 + %i1] 0x89
	set	0x64, %g6
	sta	%f23,	[%l7 + %g6] 0x89
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x80,	 3
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f30
	set	0x4C, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i4
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 1
	and	%g3,	%o2,	%o7
	set	0x5C, %i7
	sta	%f17,	[%l7 + %i7] 0x89
	nop
	set	0x50, %o0
	lduh	[%l7 + %o0],	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i3
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%o5
	set	0x30, %o4
	ldxa	[%l7 + %o4] 0x81,	%o3
	nop
	set	0x28, %l5
	prefetch	[%l7 + %l5],	 2
	st	%fsr,	[%l7 + 0x20]
	set	0x70, %o7
	stda	%l0,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x18, %g3
	stwa	%g6,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x88
	nop
	set	0x54, %i5
	sth	%g4,	[%l7 + %i5]
	or	%g5,	%i6,	%l0
	or	%i1,	%g7,	%i5
	fpadd32s	%f27,	%f3,	%f26
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f0
	set	0x18, %i4
	sta	%f21,	[%l7 + %i4] 0x88
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%o1
	ld	[%l7 + 0x68],	%f12
	set	0x18, %i3
	swapa	[%l7 + %i3] 0x89,	%l2
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	fpadd32	%f8,	%f10,	%f2
	and	%i7,	%o4,	%g1
	set	0x08, %l2
	stba	%o0,	[%l7 + %l2] 0x80
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x89,	%o6
	and	%l5,	%i0,	%i2
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x81,	%i4
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x60, %g5
	stha	%g2,	[%l7 + %g5] 0xeb
	membar	#Sync
	ld	[%l7 + 0x50],	%f12
	st	%f27,	[%l7 + 0x2C]
	bleu,a,pn	%icc,	loop_28
	add	%l3,	%o2,	%g3
	nop
	set	0x5C, %g7
	sth	%l4,	[%l7 + %g7]
	nop
	set	0x50, %g1
	ldsh	[%l7 + %g1],	%o7
loop_28:
	nop
	set	0x58, %g4
	stwa	%i3,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x0C, %l1
	stha	%o5,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x78, %l0
	swapa	[%l7 + %l0] 0x89,	%o3
	nop
	set	0x08, %i1
	swap	[%l7 + %i1],	%l1
	set	0x08, %i6
	lda	[%l7 + %i6] 0x89,	%f25
	and	%g6,	%g4,	%g5
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x88,	%i6
	nop
	set	0x14, %g6
	ldsw	[%l7 + %g6],	%l0
	set	0x0C, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l6
	nop
	nop
	setx	0xD06308A89FE0D780,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0DE1B00EA46D4A36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f24
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x80,	 3
	set	0x1B, %i7
	stba	%g7,	[%l7 + %i7] 0x80
	set	0x24, %i2
	swapa	[%l7 + %i2] 0x80,	%o1
	set	0x4C, %o4
	stha	%l2,	[%l7 + %o4] 0x81
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f0
	nop
	set	0x53, %o7
	ldsb	[%l7 + %o7],	%i5
	set	0x78, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%g1
	set	0x30, %l3
	stxa	%o6,	[%l7 + %l3] 0xe2
	membar	#Sync
	and	%l5,	%o0,	%i0
	nop
	set	0x64, %o0
	ldub	[%l7 + %o0],	%i2
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x81,	%g2
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
	and	%i4,	%l3,	%o2
	nop
	set	0x60, %i4
	stx	%l4,	[%l7 + %i4]
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%g2
	set	0x1C, %i3
	sta	%f16,	[%l7 + %i3] 0x88
	set	0x74, %o5
	swapa	[%l7 + %o5] 0x81,	%o7
	set	0x18, %l2
	sta	%f22,	[%l7 + %l2] 0x81
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x88,	%f9
	nop
	set	0x7C, %g5
	lduw	[%l7 + %g5],	%o5
	nop
	set	0x5E, %g2
	ldsb	[%l7 + %g2],	%i3
	set	0x7A, %g7
	stha	%o3,	[%l7 + %g7] 0x80
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x81,	%g6
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%g4
	nop
	set	0x1C, %l1
	ldstub	[%l7 + %l1],	%l1
	ld	[%l7 + 0x40],	%f7
	nop
	set	0x7C, %l0
	lduw	[%l7 + %l0],	%i6
	or	%l0,	%l6,	%g5
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x40, %i1
	std	%g6,	[%l7 + %i1]
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	ld	[%l7 + 0x6C],	%f10
	add	%i1,	%o1,	%l2
	fpsub32s	%f24,	%f11,	%f9
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f12
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i7
	and	%g1,	%i5,	%o6
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x89,	%l5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	nop
	set	0x20, %i7
	stw	%o0,	[%l7 + %i7]
	nop
	set	0x14, %i2
	stb	%i0,	[%l7 + %i2]
	nop
	set	0x34, %l6
	lduw	[%l7 + %l6],	%g2
	nop
	set	0x0C, %l5
	ldsw	[%l7 + %l5],	%i4
	nop
	set	0x2E, %o4
	stb	%i2,	[%l7 + %o4]
	nop
	set	0x44, %o7
	ldsb	[%l7 + %o7],	%l3
	nop
	set	0x23, %g3
	stb	%o2,	[%l7 + %g3]
	st	%f7,	[%l7 + 0x2C]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f12
	set	0x70, %o0
	stda	%l4,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x20, %o3
	lda	[%l7 + %o3] 0x81,	%f29
	set	0x60, %i5
	stxa	%g3,	[%l7 + %i5] 0x80
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%o7
	nop
	set	0x4A, %o2
	ldub	[%l7 + %o2],	%i3
	set	0x2C, %i3
	swapa	[%l7 + %i3] 0x88,	%o5
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x89,	%g6
	ld	[%l7 + 0x28],	%f29
	nop
	set	0x68, %i4
	ldsh	[%l7 + %i4],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%o3
	set	0x38, %l2
	stda	%i6,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x4E, %g5
	ldsb	[%l7 + %g5],	%l0
	nop
	set	0x78, %l4
	stx	%l6,	[%l7 + %l4]
	nop
	set	0x2C, %g2
	stw	%g5,	[%l7 + %g2]
	or	%i1,	%g7,	%l2
	set	0x70, %g7
	lda	[%l7 + %g7] 0x89,	%f7
	nop
	set	0x70, %g4
	std	%f26,	[%l7 + %g4]
	set	0x1E, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o4
	nop
	set	0x55, %g1
	ldstub	[%l7 + %g1],	%o1
	and	%i7,	%i5,	%g1
	nop
	set	0x48, %l0
	ldsw	[%l7 + %l0],	%l5
	nop
	set	0x2E, %i6
	sth	%o6,	[%l7 + %i6]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i0
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x88,	 1
	be,pn	%xcc,	loop_29
	nop
	set	0x16, %o6
	ldub	[%l7 + %o6],	%i2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x89
loop_29:
	and	%l3,	%o2,	%l4
	set	0x42, %i0
	stha	%i4,	[%l7 + %i0] 0x88
	set	0x48, %i7
	stda	%g2,	[%l7 + %i7] 0xe2
	membar	#Sync
	ld	[%l7 + 0x4C],	%f23
	wr	%i3,	%o7,	%softint
	nop
	set	0x5A, %i2
	lduh	[%l7 + %i2],	%o5
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x89,	 4
	nop
	set	0x3C, %o4
	stw	%g6,	[%l7 + %o4]
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x50, %o7
	std	%l0,	[%l7 + %o7]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%l0
	nop
	set	0x2F, %l3
	stb	%o3,	[%l7 + %l3]
	nop
	set	0x2B, %o0
	stb	%g5,	[%l7 + %o0]
	nop
	set	0x30, %o3
	ldsh	[%l7 + %o3],	%i1
	nop
	set	0x30, %g3
	stw	%l6,	[%l7 + %g3]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xeb,	%l2
	ld	[%l7 + 0x44],	%f13
	nop
	set	0x54, %o2
	ldsh	[%l7 + %o2],	%o4
	nop
	set	0x0C, %o1
	ldsw	[%l7 + %o1],	%o1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x89
	ld	[%l7 + 0x64],	%f24
	add	%g7,	%i7,	%i5
	set	0x6C, %i3
	stwa	%l5,	[%l7 + %i3] 0x80
	nop
	set	0x50, %l2
	stw	%g1,	[%l7 + %l2]
	nop
	set	0x48, %i4
	std	%o0,	[%l7 + %i4]
	nop
	set	0x14, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x5B, %g5
	ldsb	[%l7 + %g5],	%i0
	fpsub16s	%f30,	%f16,	%f7
	nop
	set	0x28, %g7
	stw	%o6,	[%l7 + %g7]
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i2
	set	0x5C, %l1
	stba	%l3,	[%l7 + %l1] 0x81
	bl	%xcc,	loop_30
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f22
	st	%fsr,	[%l7 + 0x0C]
loop_30:
	nop
	set	0x42, %l0
	sth	%o2,	[%l7 + %l0]
	and	%g2,	%l4,	%g3
	nop
	set	0x18, %i6
	sth	%i3,	[%l7 + %i6]
	set	0x54, %g1
	sta	%f31,	[%l7 + %g1] 0x80
	nop
	set	0x58, %o6
	std	%o6,	[%l7 + %o6]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%l1
	nop
	set	0x71, %g6
	stb	%i6,	[%l7 + %g6]
	wr	%l0,	%o3,	%set_softint
	set	0x1C, %i0
	sta	%f1,	[%l7 + %i0] 0x81
	set	0x50, %i1
	stda	%g4,	[%l7 + %i1] 0x88
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%i0
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x88,	%l6
	set	0x79, %o4
	ldstuba	[%l7 + %o4] 0x81,	%l2
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x674, 	%tick_cmpr
	nop
	set	0x68, %i7
	ldstub	[%l7 + %i7],	%i7
	nop
	set	0x0E, %o7
	sth	%o4,	[%l7 + %o7]
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%i5
	set	0x0D, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g1
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	fpsub32	%f14,	%f26,	%f30
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%i0
	set	0x24, %i5
	lda	[%l7 + %i5] 0x81,	%f10
	nop
	set	0x25, %o1
	ldsb	[%l7 + %o1],	%l5
	set	0x4C, %o5
	sta	%f22,	[%l7 + %o5] 0x80
	nop
	set	0x18, %i3
	std	%i2,	[%l7 + %i3]
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f10
	nop
	set	0x60, %l2
	stw	%l3,	[%l7 + %l2]
	set	0x54, %l4
	swapa	[%l7 + %l4] 0x89,	%o2
	st	%f22,	[%l7 + 0x20]
	nop
	set	0x2C, %i4
	ldsh	[%l7 + %i4],	%g2
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x88,	%l4
	nop
	set	0x4D, %g4
	ldsb	[%l7 + %g4],	%g3
	set	0x10, %g5
	stxa	%o6,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x20, %g2
	stda	%o6,	[%l7 + %g2] 0x89
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xea,	%o4
	nop
	set	0x10, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x48, %l1
	std	%f12,	[%l7 + %l1]
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f28
	or	%i3,	%i4,	%l1
	nop
	set	0x68, %o6
	ldsh	[%l7 + %o6],	%i6
	nop
	set	0x50, %g6
	stx	%g6,	[%l7 + %g6]
	set	0x18, %i1
	sta	%f7,	[%l7 + %i1] 0x80
	nop
	set	0x17, %i0
	ldsb	[%l7 + %i0],	%o3
	nop
	set	0x5F, %i2
	ldub	[%l7 + %i2],	%l0
	nop
	set	0x68, %o4
	std	%i0,	[%l7 + %o4]
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%l6
	set	0x24, %l5
	lda	[%l7 + %l5] 0x88,	%f4
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%g5
	nop
	set	0x48, %o7
	stx	%g4,	[%l7 + %o7]
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x42, %g3
	stha	%o1,	[%l7 + %g3] 0xea
	membar	#Sync
	add	%l2,	%i7,	%g7
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xeb,	%i4
	set	0x20, %i5
	stwa	%g1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x08, %o1
	std	%o0,	[%l7 + %o1]
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x80,	 4
	and	%l5,	%o4,	%i2
	set	0x70, %o0
	stda	%l2,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%g2
	nop
	set	0x74, %i3
	prefetch	[%l7 + %i3],	 1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%g3
	add	%l4,	%o6,	%o5
	st	%f15,	[%l7 + 0x2C]
	nop
	set	0x7E, %l2
	ldstub	[%l7 + %l2],	%i3
	nop
	set	0x28, %l4
	lduw	[%l7 + %l4],	%o7
	add	%l1,	%i6,	%i4
	nop
	set	0x13, %g7
	ldsb	[%l7 + %g7],	%g6
	nop
	set	0x18, %i4
	std	%l0,	[%l7 + %i4]
	nop
	set	0x5D, %g5
	ldstub	[%l7 + %g5],	%o3
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x81,	%i1
	nop
	set	0x24, %l0
	ldstub	[%l7 + %l0],	%l6
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x89,	%g4
	fpadd16	%f30,	%f24,	%f24
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	nop
	set	0x10, %i6
	ldub	[%l7 + %i6],	%g4
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%l2
	set	0x7A, %g1
	stha	%i7,	[%l7 + %g1] 0x81
	nop
	set	0x63, %g6
	ldstub	[%l7 + %g6],	%g7
	nop
	set	0x60, %i1
	stw	%g1,	[%l7 + %i1]
	set	0x58, %i2
	stda	%i4,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x70, %o4
	ldsb	[%l7 + %o4],	%o0
	set	0x40, %i0
	sta	%f12,	[%l7 + %i0] 0x80
	nop
	set	0x0E, %l5
	ldsh	[%l7 + %l5],	%l5
	nop
	set	0x70, %i7
	std	%f28,	[%l7 + %i7]
	add	%o4,	%i0,	%l3
	add	%i2,	%g2,	%g3
	nop
	set	0x22, %o7
	ldub	[%l7 + %o7],	%o2
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x88,	%l4
	wr	%o6,	%o5,	%softint
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f0
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x80
	nop
	set	0x18, %g3
	swap	[%l7 + %g3],	%o7
	set	0x60, %o1
	stha	%i3,	[%l7 + %o1] 0x89
	ba,a,pt	%xcc,	loop_31
	nop
	set	0x2C, %i5
	lduw	[%l7 + %i5],	%l1
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%f28
	set	0x18, %o2
	stda	%i4,	[%l7 + %o2] 0xea
	membar	#Sync
loop_31:
	nop
	set	0x48, %o0
	ldx	[%l7 + %o0],	%g6
	ld	[%l7 + 0x64],	%f12
	nop
	set	0x70, %l2
	lduh	[%l7 + %l2],	%i6
	set	0x3C, %l4
	stwa	%o3,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x22, %g7
	sth	%i1,	[%l7 + %g7]
	set	0x4A, %i4
	stha	%l0,	[%l7 + %i4] 0xe2
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o1
	nop
	set	0x27, %i3
	ldsb	[%l7 + %i3],	%g5
	set	0x4C, %g5
	stwa	%g4,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%i7
	or	%l2,	%g1,	%i5
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%o0
	set	0x58, %g4
	stxa	%g7,	[%l7 + %g4] 0xe3
	membar	#Sync
	or	%l5,	%i0,	%o4
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%i2
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe2,	%g2
	set	0x38, %o6
	sta	%f1,	[%l7 + %o6] 0x88
	ld	[%l7 + 0x64],	%f15
	nop
	set	0x50, %g6
	ldsw	[%l7 + %g6],	%g3
	add	%o2,	%l3,	%l4
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%o6
	nop
	set	0x4C, %g1
	lduw	[%l7 + %g1],	%o5
	nop
	set	0x38, %i2
	stx	%o7,	[%l7 + %i2]
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x80,	%i3
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xea,	%i4
	set	0x08, %l5
	stwa	%g6,	[%l7 + %l5] 0x89
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x80,	%f0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x40, %l3
	std	%i6,	[%l7 + %l3]
	set	0x34, %l6
	stwa	%o3,	[%l7 + %l6] 0xe2
	membar	#Sync
	and	%i1,	%l1,	%l6
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%l0
	st	%f14,	[%l7 + 0x68]
	nop
	set	0x23, %g3
	stb	%g4,	[%l7 + %g3]
	set	0x58, %i5
	stha	%i7,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc4
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%l2
	nop
	set	0x60, %o1
	lduw	[%l7 + %o1],	%g5
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%i4
	nop
	set	0x70, %o0
	lduw	[%l7 + %o0],	%o0
	set	0x40, %g7
	stda	%g0,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x40, %i4
	stda	%l4,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x38, %l4
	sta	%f28,	[%l7 + %l4] 0x81
	fpadd32	%f6,	%f16,	%f24
	set	0x47, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g7
	nop
	set	0x50, %l0
	std	%f24,	[%l7 + %l0]
	ld	[%l7 + 0x60],	%f14
	st	%fsr,	[%l7 + 0x54]
	nop
	nop
	setx	0xDE2C10BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xDB8579B4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f20,	%f14
	set	0x40, %g2
	stwa	%o4,	[%l7 + %g2] 0x81
	nop
	set	0x76, %g4
	ldsb	[%l7 + %g4],	%i0
	nop
	set	0x51, %i6
	ldsb	[%l7 + %i6],	%g2
	set	0x2C, %g5
	stwa	%g3,	[%l7 + %g5] 0x88
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe3,	%i2
	add	%o2,	%l3,	%l4
	ld	[%l7 + 0x58],	%f0
	nop
	set	0x18, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
	nop
	set	0x43, %i1
	stb	%o6,	[%l7 + %i1]
	nop
	set	0x4C, %g1
	ldsw	[%l7 + %g1],	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%i4
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%g6
	nop
	set	0x4E, %i0
	ldstub	[%l7 + %i0],	%i3
	set	0x28, %o4
	stda	%i6,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%o3
	nop
	set	0x34, %o7
	lduw	[%l7 + %o7],	%i1
	nop
	set	0x28, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%o1
	nop
	set	0x76, %i7
	sth	%l0,	[%l7 + %i7]
	set	0x7C, %o3
	stwa	%g4,	[%l7 + %o3] 0xe2
	membar	#Sync
	bl	%xcc,	loop_32
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%i6
	set	0x7E, %o5
	stha	%l2,	[%l7 + %o5] 0xe3
	membar	#Sync
loop_32:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%l1
	set	0x30, %o2
	prefetcha	[%l7 + %o2] 0x80,	 2
	and	%i5,	%g1,	%g7
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%o4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xda
	nop
	set	0x40, %g3
	prefetch	[%l7 + %g3],	 0
	fpadd16s	%f5,	%f3,	%f3
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%g2
	add	%g3,	%i2,	%o2
	add	%l3,	%i0,	%o6
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f28
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%o5
	nop
	set	0x46, %i4
	sth	%i4,	[%l7 + %i4]
	set	0x18, %i3
	stwa	%l4,	[%l7 + %i3] 0xeb
	membar	#Sync
	wr	%i3,	%i6,	%softint
	set	0x3D, %l0
	stba	%g6,	[%l7 + %l0] 0x81
	add	%i1,	%o3,	%l6
	set	0x22, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l0
	nop
	set	0x58, %g2
	swap	[%l7 + %g2],	%o1
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%g4
	nop
	set	0x43, %i6
	ldub	[%l7 + %i6],	%l2
	or	%i7,	%l1,	%g5
	nop
	set	0x48, %o6
	std	%f26,	[%l7 + %o6]
	set	0x7C, %g6
	stwa	%o0,	[%l7 + %g6] 0x88
	nop
	set	0x0C, %l1
	stw	%i5,	[%l7 + %l1]
	nop
	set	0x4C, %g1
	lduh	[%l7 + %g1],	%g1
	set	0x3D, %i2
	stba	%g7,	[%l7 + %i2] 0x88
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x81,	%o4
	nop
	set	0x70, %o4
	lduh	[%l7 + %o4],	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%i2
	nop
	set	0x4C, %l5
	ldstub	[%l7 + %l5],	%g3
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x80,	 1
	nop
	set	0x47, %l6
	ldub	[%l7 + %l6],	%i0
	nop
	set	0x08, %o7
	ldub	[%l7 + %o7],	%o2
	wr	%o6,	%o7,	%y
	nop
	set	0x1C, %i7
	ldsw	[%l7 + %i7],	%i4
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%o5
	add	%l4,	%i6,	%i3
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f2
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%g6
	nop
	set	0x28, %o5
	std	%f8,	[%l7 + %o5]
	add	%o3,	%l6,	%l0
	set	0x3C, %o1
	stha	%o1,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x7C, %l2
	swap	[%l7 + %l2],	%g4
	nop
	set	0x35, %g3
	ldsb	[%l7 + %g3],	%i1
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	set	0x7C, %o0
	stwa	%l1,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x88,	 2
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%l2
	nop
	set	0x24, %i3
	lduw	[%l7 + %i3],	%o0
	ld	[%l7 + 0x7C],	%f19
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%i5
	ld	[%l7 + 0x38],	%f29
	nop
	set	0x54, %i4
	stw	%g7,	[%l7 + %i4]
	nop
	set	0x3C, %g2
	lduw	[%l7 + %g2],	%g1
	nop
	set	0x2F, %g5
	ldstub	[%l7 + %g5],	%l5
	add	%o4,	%i2,	%g3
	set	0x5C, %g4
	stwa	%g2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x36, %i6
	ldub	[%l7 + %i6],	%l3
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x88,	%i0
	set	0x08, %o6
	stxa	%o6,	[%l7 + %o6] 0x89
	and	%o7,	%o2,	%o5
	nop
	set	0x28, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%l4
	nop
	set	0x1A, %i2
	ldsh	[%l7 + %i2],	%i4
	nop
	set	0x1F, %o4
	ldsb	[%l7 + %o4],	%i3
	and	%g6,	%i6,	%l6
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f4
	nop
	set	0x10, %i1
	stx	%l0,	[%l7 + %i1]
	nop
	set	0x74, %l5
	swap	[%l7 + %l5],	%o3
	set	0x68, %l6
	stxa	%g4,	[%l7 + %l6] 0x89
	set	0x6C, %i7
	stba	%o1,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x60, %l3
	stxa	%i1,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x20, %o7
	lduw	[%l7 + %o7],	%l1
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%o0
	nop
	set	0x57, %o3
	ldstub	[%l7 + %o3],	%g7
	set	0x7F, %l2
	stba	%i5,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x21, %o1
	ldub	[%l7 + %o1],	%l5
	nop
	set	0x3D, %o2
	ldub	[%l7 + %o2],	%o4
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%i2
	set	0x20, %g3
	stxa	%g3,	[%l7 + %g3] 0x89
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%g1
	nop
	set	0x12, %l4
	lduh	[%l7 + %l4],	%l3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%o6
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x0A, %l0
	ldsh	[%l7 + %l0],	%o7
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x81,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x58, %i3
	ldsw	[%l7 + %i3],	%o2
	ble,a,pt	%xcc,	loop_33
	nop
	set	0x40, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x10, %g5
	stda	%i4,	[%l7 + %g5] 0xe2
	membar	#Sync
loop_33:
	nop
	set	0x4C, %g4
	stba	%i3,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x88,	%i6
	nop
	set	0x2C, %o6
	swap	[%l7 + %o6],	%g6
	add	%l0,	%o3,	%g4
	nop
	set	0x40, %g1
	stx	%l6,	[%l7 + %g1]
	ld	[%l7 + 0x40],	%f0
	set	0x57, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o1
	set	0x49, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i1
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%l1
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f10
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd2
	ld	[%l7 + 0x34],	%f23
	nop
	set	0x58, %i1
	stx	%l2,	[%l7 + %i1]
	nop
	set	0x16, %l5
	ldsh	[%l7 + %l5],	%g5
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	fpadd16	%f28,	%f10,	%f26
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%g7
	nop
	set	0x6A, %i7
	ldsh	[%l7 + %i7],	%i7
	nop
	set	0x30, %o7
	stw	%l5,	[%l7 + %o7]
	set	0x46, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i5
	add	%i2,	%o4,	%g3
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x88,	 3
	set	0x20, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l3
	fpadd16s	%f30,	%f22,	%f23
	st	%fsr,	[%l7 + 0x08]
	and	%o6,	%o7,	%g2
	nop
	set	0x3C, %l2
	ldsw	[%l7 + %l2],	%i0
	nop
	set	0x60, %i5
	std	%l4,	[%l7 + %i5]
	nop
	set	0x30, %o1
	ldx	[%l7 + %o1],	%o2
	set	0x20, %o0
	lda	[%l7 + %o0] 0x88,	%f7
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xe3,	%o4
	nop
	set	0x20, %o2
	stw	%i4,	[%l7 + %o2]
	set	0x48, %l4
	stwa	%i3,	[%l7 + %l4] 0x88
	or	%i6,	%l0,	%o3
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%g4
	nop
	set	0x40, %l0
	std	%f8,	[%l7 + %l0]
	st	%f23,	[%l7 + 0x5C]
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x89,	%l6
	nop
	set	0x58, %g2
	prefetch	[%l7 + %g2],	 3
	nop
	set	0x34, %i4
	prefetch	[%l7 + %i4],	 2
	st	%f9,	[%l7 + 0x44]
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x88,	 2
	set	0x50, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i1
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f10
	wr	%l1,	%g6,	%clear_softint
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xda
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x88,	%l2
	set	0x20, %l1
	lda	[%l7 + %l1] 0x80,	%f11
	set	0x6C, %i2
	sta	%f27,	[%l7 + %i2] 0x88
	nop
	set	0x60, %i0
	std	%o0,	[%l7 + %i0]
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x89,	%g5
	add	%g7,	%l5,	%i7
	nop
	set	0x28, %i1
	sth	%i5,	[%l7 + %i1]
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	nop
	setx	0xA70F2C98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xDE1638A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f17,	%f12
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f16
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xca
	set	0x2F, %l3
	stba	%i2,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x53, %o5
	stba	%g3,	[%l7 + %o5] 0x81
	nop
	set	0x54, %o3
	ldsw	[%l7 + %o3],	%o4
	set	0x70, %o7
	lda	[%l7 + %o7] 0x81,	%f12
	ble,pt	%icc,	loop_34
	ble	%icc,	loop_35
	nop
	set	0x4C, %l2
	sth	%l3,	[%l7 + %l2]
	set	0x38, %o1
	swapa	[%l7 + %o1] 0x81,	%g1
loop_34:
	nop
	set	0x50, %i5
	ldsw	[%l7 + %i5],	%o6
loop_35:
	nop
	set	0x08, %o0
	prefetch	[%l7 + %o0],	 4
	or	%g2,	%o7,	%i0
	nop
	set	0x78, %o2
	std	%o2,	[%l7 + %o2]
	nop
	set	0x64, %l4
	stw	%l4,	[%l7 + %l4]
	or	%i4,	%i3,	%o5
	set	0x18, %g3
	stda	%l0,	[%l7 + %g3] 0x81
	set	0x18, %l0
	stxa	%i6,	[%l7 + %l0] 0x81
	set	0x1C, %i3
	lda	[%l7 + %i3] 0x88,	%f25
	nop
	set	0x0A, %g2
	ldsb	[%l7 + %g2],	%g4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%l6
	or	%i1,	%o1,	%g6
	nop
	set	0x20, %g7
	std	%f4,	[%l7 + %g7]
	st	%f27,	[%l7 + 0x4C]
	and	%l2,	%l1,	%o0
	st	%fsr,	[%l7 + 0x20]
	ld	[%l7 + 0x48],	%f24
	and	%g5,	%g7,	%l5
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x48, %g4
	stx	%i2,	[%l7 + %g4]
	nop
	set	0x24, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x60, %i4
	std	%f30,	[%l7 + %i4]
	set	0x70, %g1
	lda	[%l7 + %g1] 0x89,	%f3
	nop
	set	0x28, %o6
	sth	%g3,	[%l7 + %o6]
	set	0x10, %l1
	lda	[%l7 + %l1] 0x88,	%f24
	add	%l3,	%o4,	%g1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4EA, 	%sys_tick_cmpr
	set	0x3C, %i6
	swapa	[%l7 + %i6] 0x81,	%i0
	set	0x08, %i2
	stha	%o2,	[%l7 + %i2] 0x81
	nop
	set	0x34, %o4
	stw	%g2,	[%l7 + %o4]
	set	0x48, %i1
	lda	[%l7 + %i1] 0x89,	%f20
	nop
	set	0x08, %g6
	sth	%i4,	[%l7 + %g6]
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x88,	 4
	and	%o5,	%l0,	%i3
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%g4
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f16
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%o3
	nop
	set	0x76, %l5
	lduh	[%l7 + %l5],	%i1
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x88,	%f11
	set	0x48, %o7
	stba	%l6,	[%l7 + %o7] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%l2
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x81,	%l1
	nop
	set	0x48, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x69, %o1
	stba	%g6,	[%l7 + %o1] 0x81
	nop
	set	0x28, %i5
	stx	%o0,	[%l7 + %i5]
	st	%f30,	[%l7 + 0x38]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f0
	nop
	set	0x58, %l4
	ldsh	[%l7 + %l4],	%g7
	add	%g5,	%i7,	%l5
	set	0x6E, %o2
	stba	%i5,	[%l7 + %o2] 0xea
	membar	#Sync
	add	%i2,	%l3,	%o4
	set	0x10, %l0
	stxa	%g3,	[%l7 + %l0] 0xea
	membar	#Sync
	or	%g1,	%o7,	%i0
	set	0x79, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o6
	nop
	set	0x68, %g3
	swap	[%l7 + %g3],	%o2
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x88,	%i4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f16
	nop
	set	0x68, %g5
	stx	%l4,	[%l7 + %g5]
	set	0x67, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o5
	nop
	set	0x3C, %g4
	ldsw	[%l7 + %g4],	%g2
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x80
	st	%f11,	[%l7 + 0x24]
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f12
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	set	0x10, %i2
	stwa	%i3,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%g4
	set	0x50, %i1
	sta	%f22,	[%l7 + %i1] 0x89
	nop
	set	0x08, %i6
	ldsw	[%l7 + %i6],	%o3
	set	0x60, %i0
	stxa	%i6,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x24, %l6
	ldub	[%l7 + %l6],	%i1
	nop
	set	0x5E, %g6
	sth	%l6,	[%l7 + %g6]
	nop
	set	0x10, %l3
	std	%f4,	[%l7 + %l3]
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%l2
	nop
	set	0x58, %i7
	stx	%o1,	[%l7 + %i7]
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%l0
	nop
	nop
	setx	0xF36B1C363BF8083B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD8B1874728EB3852,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f16
	nop
	set	0x20, %l2
	ldsh	[%l7 + %l2],	%o0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f0
	nop
	set	0x61, %o1
	ldsb	[%l7 + %o1],	%g6
	nop
	set	0x7E, %o3
	ldsh	[%l7 + %o3],	%g5
	nop
	set	0x48, %o0
	std	%i6,	[%l7 + %o0]
	nop
	set	0x58, %i5
	stx	%g7,	[%l7 + %i5]
	fpsub16	%f18,	%f0,	%f4
	nop
	set	0x14, %l4
	lduh	[%l7 + %l4],	%i5
	set	0x11, %o2
	stba	%i2,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x30, %i3
	std	%l4,	[%l7 + %i3]
	nop
	set	0x54, %l0
	lduw	[%l7 + %l0],	%l3
	nop
	set	0x40, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%o4
	nop
	set	0x68, %g5
	swap	[%l7 + %g5],	%g1
	and	%g3,	%o7,	%o6
	and	%i0,	%o2,	%i4
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	ld	[%l7 + 0x48],	%f0
	or	%l4,	%l0,	%g2
	nop
	set	0x0E, %g4
	sth	%g4,	[%l7 + %g4]
	nop
	set	0x74, %o6
	ldsw	[%l7 + %o6],	%i3
	set	0x38, %l1
	stxa	%o3,	[%l7 + %l1] 0x80
	nop
	set	0x08, %i2
	prefetch	[%l7 + %i2],	 0
	set	0x58, %g1
	stwa	%i1,	[%l7 + %g1] 0x89
	set	0x34, %o4
	stwa	%i6,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x28, %i1
	lda	[%l7 + %i1] 0x89,	%f27
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%l6
	nop
	set	0x12, %i0
	lduh	[%l7 + %i0],	%o1
	ble,pt	%xcc,	loop_36
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x11, %g6
	ldstub	[%l7 + %g6],	%l1
	set	0x2C, %l5
	sta	%f9,	[%l7 + %l5] 0x80
loop_36:
	st	%f8,	[%l7 + 0x60]
	or	%o0,	%g6,	%g5
	st	%f13,	[%l7 + 0x08]
	st	%f28,	[%l7 + 0x50]
	set	0x20, %l3
	stha	%i7,	[%l7 + %l3] 0x80
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%g7
	add	%i5,	%l5,	%l3
	st	%f20,	[%l7 + 0x28]
	nop
	nop
	setx	0xE89668EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x0BA67774,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f8,	%f29
	nop
	set	0x52, %o7
	sth	%i2,	[%l7 + %o7]
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%o4
	add	%g3,	%o7,	%o6
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x88,	%i0
	set	0x18, %l2
	swapa	[%l7 + %l2] 0x88,	%g1
	nop
	set	0x08, %o3
	stx	%i4,	[%l7 + %o3]
	and	%o5,	%l4,	%o2
	set	0x28, %o1
	stda	%l0,	[%l7 + %o1] 0x81
	set	0x10, %i5
	stda	%g2,	[%l7 + %i5] 0xeb
	membar	#Sync
	bge,a	%xcc,	loop_37
	nop
	set	0x22, %l4
	sth	%g4,	[%l7 + %l4]
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%o3
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xda
loop_37:
	st	%fsr,	[%l7 + 0x48]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%i6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f16
	ld	[%l7 + 0x7C],	%f25
	and	%l6,	%o1,	%i1
	nop
	set	0x54, %g7
	ldsb	[%l7 + %g7],	%o0
	nop
	set	0x10, %o0
	stx	%l1,	[%l7 + %o0]
	st	%f25,	[%l7 + 0x0C]
	set	0x67, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g5
	nop
	set	0x70, %g5
	stx	%i7,	[%l7 + %g5]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc4
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x74, %o6
	sta	%f12,	[%l7 + %o6] 0x89
	nop
	set	0x30, %l1
	lduw	[%l7 + %l1],	%l2
	add	%g7,	%g6,	%l5
	nop
	set	0x30, %i2
	lduh	[%l7 + %i2],	%l3
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f20
	set	0x2F, %o4
	stba	%i5,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x36, %i1
	ldstub	[%l7 + %i1],	%i2
	set	0x18, %i6
	stda	%o4,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x88
	and	%g3,	%o6,	%o7
	st	%f12,	[%l7 + 0x5C]
	set	0x77, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i0
	nop
	set	0x78, %g6
	ldub	[%l7 + %g6],	%i4
	nop
	set	0x44, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x7C, %l3
	ldsw	[%l7 + %l3],	%g1
	set	0x13, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l4
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x80,	%l0
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f30
	set	0x50, %l2
	stxa	%o2,	[%l7 + %l2] 0x81
	nop
	set	0x2C, %o1
	sth	%g4,	[%l7 + %o1]
	nop
	set	0x1E, %i5
	sth	%g2,	[%l7 + %i5]
	nop
	set	0x24, %o3
	lduw	[%l7 + %o3],	%o3
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x88,	%i3
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f12
	nop
	set	0x38, %l0
	stx	%l6,	[%l7 + %l0]
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x81,	%i6
	nop
	set	0x14, %i3
	stw	%i1,	[%l7 + %i3]
	and	%o1,	%l1,	%g5
	nop
	set	0x28, %g3
	ldsb	[%l7 + %g3],	%o0
	set	0x50, %g5
	stda	%i6,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc2
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	nop
	set	0x43, %o6
	ldub	[%l7 + %o6],	%g6
	fpsub16s	%f21,	%f26,	%f8
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	or	%l5,	%l3,	%i5
	fpadd32	%f22,	%f6,	%f8
	nop
	set	0x76, %i2
	lduh	[%l7 + %i2],	%i2
	nop
	set	0x30, %g2
	ldsh	[%l7 + %g2],	%g7
	ble,pn	%xcc,	loop_38
	nop
	set	0x74, %i4
	ldsw	[%l7 + %i4],	%o4
	set	0x76, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g3
loop_38:
	nop
	set	0x7D, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o6
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%o7
	st	%fsr,	[%l7 + 0x14]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%i4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%g1
	nop
	set	0x0F, %i0
	ldstub	[%l7 + %i0],	%l0
	set	0x50, %g6
	stba	%o5,	[%l7 + %g6] 0x89
	set	0x16, %l5
	stba	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x3C],	%f15
	nop
	set	0x68, %l3
	stb	%o2,	[%l7 + %l3]
	and	%g2,	%i3,	%o3
	set	0x78, %g1
	stha	%i6,	[%l7 + %g1] 0x81
	bn,a	%xcc,	loop_39
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%i1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f0
loop_39:
	st	%fsr,	[%l7 + 0x0C]
	set	0x58, %i7
	sta	%f19,	[%l7 + %i7] 0x80
	nop
	set	0x20, %l2
	ldstub	[%l7 + %l2],	%l6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
	fpsub16s	%f11,	%f22,	%f3
	nop
	set	0x0C, %o1
	lduw	[%l7 + %o1],	%l1
	nop
	set	0x7A, %i5
	ldstub	[%l7 + %i5],	%g5
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f12
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f16
	set	0x40, %l4
	stxa	%o1,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f0
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f24
	nop
	set	0x48, %g3
	ldsh	[%l7 + %g3],	%o0
	set	0x78, %l0
	stda	%l2,	[%l7 + %l0] 0x80
	nop
	set	0x40, %o0
	std	%f18,	[%l7 + %o0]
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x81,	%i7
	or	%g6,	%l5,	%i5
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%l2
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%o4
	wr	%g3,	%g7,	%clear_softint
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i0
	nop
	set	0x60, %i2
	ldstub	[%l7 + %i2],	%o6
	set	0x40, %g2
	ldxa	[%l7 + %g2] 0x88,	%i4
	nop
	set	0x38, %g4
	lduh	[%l7 + %g4],	%g1
	or	%l4,	%o5,	%l0
	wr	%g4,	%g2,	%ccr
	add	%o2,	%o3,	%i3
	nop
	set	0x38, %i1
	stb	%i6,	[%l7 + %i1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i1
	nop
	set	0x30, %i6
	lduh	[%l7 + %i6],	%g5
	nop
	set	0x53, %o4
	stb	%o1,	[%l7 + %o4]
	set	0x10, %i4
	stba	%o0,	[%l7 + %i4] 0xeb
	membar	#Sync
	wr	%l2,	%l1,	%y
	set	0x68, %i0
	stwa	%i7,	[%l7 + %i0] 0x80
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%l4
	st	%f1,	[%l7 + 0x6C]
	nop
	set	0x74, %l3
	sth	%i5,	[%l7 + %l3]
	nop
	set	0x4A, %g1
	ldsb	[%l7 + %g1],	%l3
	nop
	set	0x48, %l6
	stw	%g6,	[%l7 + %l6]
	nop
	set	0x61, %l5
	stb	%o4,	[%l7 + %l5]
	and	%g3,	%g7,	%i2
	nop
	set	0x23, %o7
	ldstub	[%l7 + %o7],	%o7
	nop
	set	0x1A, %i7
	ldstub	[%l7 + %i7],	%o6
	set	0x28, %o5
	stda	%i4,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x3E, %o1
	ldsh	[%l7 + %o1],	%i0
	nop
	set	0x6A, %l2
	ldub	[%l7 + %l2],	%l4
	and	%o5,	%g1,	%l0
	nop
	set	0x0A, %o3
	sth	%g2,	[%l7 + %o3]
	ld	[%l7 + 0x14],	%f19
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x88,	%g4
	or	%o2,	%i3,	%i6
	nop
	set	0x70, %o2
	stx	%o3,	[%l7 + %o2]
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x88,	 4
	be	%icc,	loop_40
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%f2
	nop
	set	0x70, %g7
	stw	%g5,	[%l7 + %g7]
loop_40:
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f16
	or	%o1,	%i1,	%l2
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x68, %g5
	std	%f12,	[%l7 + %g5]
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%o0
	nop
	set	0x46, %o6
	stb	%l1,	[%l7 + %o6]
	ld	[%l7 + 0x40],	%f17
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%i5
	st	%f15,	[%l7 + 0x08]
	set	0x77, %l1
	stba	%i7,	[%l7 + %l1] 0x88
	nop
	set	0x20, %g2
	ldub	[%l7 + %g2],	%g6
	nop
	set	0x42, %i2
	stb	%o4,	[%l7 + %i2]
	set	0x28, %g4
	stxa	%g3,	[%l7 + %g4] 0xea
	membar	#Sync
	st	%f17,	[%l7 + 0x08]
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x81,	%l3
	nop
	set	0x18, %i6
	ldsw	[%l7 + %i6],	%i2
	nop
	set	0x3C, %i4
	ldsw	[%l7 + %i4],	%g7
	set	0x48, %o4
	lda	[%l7 + %o4] 0x81,	%f29
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f4
	set	0x20, %l3
	stha	%o6,	[%l7 + %l3] 0x81
	nop
	set	0x72, %i0
	stb	%o7,	[%l7 + %i0]
	and	%i0,	%l4,	%o5
	nop
	set	0x10, %l6
	ldsw	[%l7 + %l6],	%i4
	nop
	set	0x55, %l5
	stb	%l0,	[%l7 + %l5]
	nop
	set	0x50, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%g2,	%g1,	%g4
	set	0x0A, %g1
	stba	%i3,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x57, %o5
	stb	%o2,	[%l7 + %o5]
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x80,	%o2
	nop
	set	0x4E, %i7
	stb	%i6,	[%l7 + %i7]
	nop
	set	0x3C, %o3
	swap	[%l7 + %o3],	%l6
	set	0x18, %l2
	stxa	%g5,	[%l7 + %l2] 0x89
	wr	%i1,	%o1,	%y
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%l1
	nop
	set	0x0C, %o2
	lduw	[%l7 + %o2],	%o0
	nop
	set	0x68, %l4
	lduh	[%l7 + %l4],	%i5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%i6
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	set	0x78, %g7
	lda	[%l7 + %g7] 0x81,	%f16
	set	0x64, %l0
	stwa	%g6,	[%l7 + %l0] 0x88
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%o4
	nop
	set	0x5C, %o0
	stw	%l5,	[%l7 + %o0]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%g3
	set	0x38, %o6
	prefetcha	[%l7 + %o6] 0x80,	 0
	nop
	set	0x42, %l1
	ldub	[%l7 + %l1],	%i2
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%o7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f0
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f8
	set	0x7B, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o6
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc2
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x80,	%l4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%g2
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%i4
	set	0x10, %g6
	lda	[%l7 + %g6] 0x80,	%f24
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%f6
	nop
	set	0x50, %l6
	std	%f16,	[%l7 + %l6]
	wr	%g4,	%i3,	%y
	nop
	set	0x67, %l3
	ldub	[%l7 + %l3],	%o2
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x77, %l5
	ldstub	[%l7 + %l5],	%o3
	or	%i6,	%g1,	%l6
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x81,	%g5
	nop
	set	0x55, %o5
	ldsb	[%l7 + %o5],	%i1
	set	0x63, %o1
	stba	%o1,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x1C, %i7
	swap	[%l7 + %i7],	%l1
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f26
	nop
	set	0x1E, %l2
	ldsh	[%l7 + %l2],	%o0
	ld	[%l7 + 0x18],	%f4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%l2
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %o2
	ldstuba	[%l7 + %o2] 0x88,	%g6
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	st	%f6,	[%l7 + 0x68]
	nop
	set	0x1B, %i5
	stb	%i7,	[%l7 + %i5]
	set	0x58, %i3
	stha	%l5,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%o4
	set	0x23, %l0
	ldstuba	[%l7 + %l0] 0x88,	%l3
	nop
	set	0x30, %g3
	std	%f8,	[%l7 + %g3]
	set	0x78, %l4
	stda	%g6,	[%l7 + %l4] 0x80
	nop
	set	0x1C, %o0
	stw	%i2,	[%l7 + %o0]
	set	0x3C, %o6
	stwa	%g3,	[%l7 + %o6] 0x80
	set	0x50, %g2
	stwa	%o6,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x20, %l1
	stxa	%o7,	[%l7 + %l1] 0x89
	set	0x74, %g4
	lda	[%l7 + %g4] 0x81,	%f18
	nop
	set	0x50, %g5
	ldsw	[%l7 + %g5],	%o5
	nop
	set	0x4C, %i1
	ldsw	[%l7 + %i1],	%i0
	set	0x68, %i2
	stwa	%l0,	[%l7 + %i2] 0x89
	nop
	set	0x18, %i4
	prefetch	[%l7 + %i4],	 1
	fpadd32	%f24,	%f24,	%f4
	or	%g2,	%l4,	%i4
	set	0x65, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g4
	and	%i3,	%o2,	%o3
	set	0x48, %o4
	lda	[%l7 + %o4] 0x89,	%f22
	nop
	set	0x30, %i0
	ldsb	[%l7 + %i0],	%g1
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	bge,a,pn	%xcc,	loop_41
	nop
	set	0x78, %l6
	std	%i6,	[%l7 + %l6]
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x81,	%l6
loop_41:
	nop
	set	0x30, %l3
	stw	%g5,	[%l7 + %l3]
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%o1
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%l1
	set	0x60, %g1
	stxa	%i5,	[%l7 + %g1] 0xe2
	membar	#Sync
	fpadd32	%f30,	%f22,	%f26
	wr	%o0,	%g6,	%softint
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f0
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x70, %o3
	swap	[%l7 + %o3],	%l2
	set	0x28, %i5
	lda	[%l7 + %i5] 0x89,	%f30
	nop
	set	0x31, %o7
	ldstub	[%l7 + %o7],	%i7
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x60, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x68, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x5B, %l4
	ldstub	[%l7 + %l4],	%l3
	and	%o4,	%i2,	%g3
	set	0x30, %g7
	ldxa	[%l7 + %g7] 0x81,	%g7
	nop
	set	0x78, %o0
	stx	%o7,	[%l7 + %o0]
	nop
	nop
	setx	0x80C8D90D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xAE3BB052,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f19,	%f9
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%o6
	set	0x50, %o6
	stxa	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x60, %l1
	stx	%l0,	[%l7 + %l1]
	set	0x28, %g4
	stda	%i4,	[%l7 + %g4] 0x80
	nop
	set	0x65, %g5
	ldub	[%l7 + %g5],	%l4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf9
	membar	#Sync
	set	0x38, %i1
	lda	[%l7 + %i1] 0x80,	%f13
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f0
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%i2
	fpsub32	%f4,	%f26,	%f2
	set	0x20, %i4
	lda	[%l7 + %i4] 0x88,	%f29
	or	%g4,	%o3,	%o2
	nop
	set	0x40, %g6
	stx	%i6,	[%l7 + %g6]
	set	0x08, %l6
	stxa	%l6,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x88,	%g1
	or	%g5,	%i1,	%o1
	nop
	set	0x6A, %l3
	ldsh	[%l7 + %l3],	%l1
	and	%i5,	%o0,	%l2
	or	%g6,	%i7,	%l5
	set	0x76, %l5
	stha	%o4,	[%l7 + %l5] 0x89
	nop
	set	0x60, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x44, %o1
	lduh	[%l7 + %o1],	%l3
	nop
	set	0x25, %g1
	ldsb	[%l7 + %g1],	%g7
	nop
	set	0x44, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%g3
	and	%o7,	%o5,	%o6
	nop
	set	0x40, %o2
	stb	%g2,	[%l7 + %o2]
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x88,	%l0
	set	0x58, %o3
	stxa	%i0,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x76, %i3
	stha	%i4,	[%l7 + %i3] 0xea
	membar	#Sync
	ld	[%l7 + 0x58],	%f25
	add	%i3,	%g4,	%l4
	nop
	set	0x08, %o7
	std	%f2,	[%l7 + %o7]
	nop
	set	0x68, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x34, %l4
	stw	%o3,	[%l7 + %l4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%l6
	nop
	set	0x20, %l0
	sth	%g1,	[%l7 + %l0]
	nop
	set	0x2C, %g7
	ldsw	[%l7 + %g7],	%g5
	ble,a	%icc,	loop_42
	nop
	set	0x58, %g2
	std	%f14,	[%l7 + %g2]
	nop
	set	0x62, %o0
	lduh	[%l7 + %o0],	%i1
	st	%f29,	[%l7 + 0x44]
loop_42:
	nop
	set	0x43, %o6
	ldub	[%l7 + %o6],	%o1
	nop
	set	0x20, %g4
	stx	%fsr,	[%l7 + %g4]
	or	%l1,	%i5,	%i6
	set	0x75, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l2
	and	%o0,	%i7,	%l5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%g6
	nop
	set	0x7F, %i2
	ldsb	[%l7 + %i2],	%i2
	set	0x30, %i1
	lda	[%l7 + %i1] 0x88,	%f4
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x48, %i6
	stwa	%g7,	[%l7 + %i6] 0x88
	add	%g3,	%o7,	%o5
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xe2,	%o6
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x80,	%g2
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%l0
	set	0x68, %i0
	lda	[%l7 + %i0] 0x80,	%f3
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x81,	 3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f0
	nop
	set	0x6E, %l3
	sth	%i4,	[%l7 + %l3]
	nop
	set	0x10, %o1
	stx	%i3,	[%l7 + %o1]
	nop
	set	0x6E, %g1
	sth	%g4,	[%l7 + %g1]
	nop
	set	0x4E, %o5
	lduh	[%l7 + %o5],	%l4
	nop
	set	0x38, %i7
	std	%f18,	[%l7 + %i7]
	nop
	set	0x21, %o2
	stb	%i0,	[%l7 + %o2]
	nop
	set	0x38, %l2
	stx	%o2,	[%l7 + %l2]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f16
	set	0x58, %o3
	stha	%o3,	[%l7 + %o3] 0x80
	nop
	set	0x68, %g3
	stx	%g1,	[%l7 + %g3]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%i1
	nop
	set	0x79, %l4
	stb	%l6,	[%l7 + %l4]
	nop
	set	0x08, %l0
	std	%o0,	[%l7 + %l0]
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f12
	set	0x75, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l1
	set	0x36, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i5
	set	0x4C, %o0
	stha	%i6,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%o0
	bn,a	%icc,	loop_43
	nop
	set	0x2E, %g5
	stb	%l2,	[%l7 + %g5]
	set	0x3A, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l5
loop_43:
	nop
	set	0x10, %i1
	std	%i6,	[%l7 + %i1]
	nop
	set	0x31, %i2
	ldsb	[%l7 + %i2],	%o4
	nop
	set	0x7C, %l1
	ldsh	[%l7 + %l1],	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%g6
	set	0x78, %i6
	swapa	[%l7 + %i6] 0x89,	%o7
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%o5
	nop
	set	0x54, %g6
	ldub	[%l7 + %g6],	%g3
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%g2
	add	%o6,	%l3,	%i4
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xe3,	%l0
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x40, %l3
	stda	%i2,	[%l7 + %l3] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i0
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x0C, %o1
	lduh	[%l7 + %o1],	%l4
	or	%o2,	%g1,	%g5
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f24
	nop
	set	0x24, %o5
	lduh	[%l7 + %o5],	%i1
	set	0x7A, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o3
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x34, %i7
	ldub	[%l7 + %i7],	%l6
	set	0x34, %i5
	lda	[%l7 + %i5] 0x88,	%f13
	set	0x7C, %i3
	sta	%f31,	[%l7 + %i3] 0x81
	add	%o1,	%i5,	%l1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i6
	set	0x48, %g3
	sta	%f19,	[%l7 + %g3] 0x81
	and	%l2,	%l5,	%o4
	nop
	set	0x60, %l4
	ldsw	[%l7 + %l4],	%i2
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x89,	%g7
	set	0x48, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i7
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	nop
	set	0x78, %g2
	stx	%o7,	[%l7 + %g2]
	nop
	set	0x70, %g7
	sth	%g6,	[%l7 + %g7]
	nop
	set	0x52, %o6
	ldsb	[%l7 + %o6],	%g3
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xcc
	set	0x70, %o0
	stda	%g2,	[%l7 + %o0] 0x89
	and	%o6,	%l3,	%i4
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x50, %i2
	stxa	%l0,	[%l7 + %i2] 0xeb
	membar	#Sync
	and	%i3,	%g4,	%o5
	set	0x0C, %l1
	sta	%f10,	[%l7 + %l1] 0x88
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%l4
	set	0x40, %i6
	stda	%i0,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x78, %i4
	ldub	[%l7 + %i4],	%o2
	nop
	set	0x20, %o4
	ldsw	[%l7 + %o4],	%g5
	set	0x48, %g6
	stxa	%i1,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x81,	%o3
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xea,	%i6
	set	0x20, %l6
	stxa	%g1,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x30, %o1
	stb	%i5,	[%l7 + %o1]
	set	0x7E, %i0
	stha	%o1,	[%l7 + %i0] 0x88
	set	0x2C, %o5
	stha	%l1,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x88,	%o0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%l5
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	fpsub16	%f4,	%f0,	%f0
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x89,	%o4
	nop
	set	0x6C, %i3
	ldsw	[%l7 + %i3],	%i2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf1
	membar	#Sync
	nop
	set	0x4B, %l4
	ldub	[%l7 + %l4],	%i6
	nop
	set	0x17, %g1
	ldsb	[%l7 + %g1],	%i7
	set	0x38, %o7
	stxa	%g7,	[%l7 + %o7] 0x89
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	set	0x7C, %l2
	swapa	[%l7 + %l2] 0x81,	%o7
	nop
	set	0x6B, %g2
	ldstub	[%l7 + %g2],	%g3
	bne,pt	%icc,	loop_44
	st	%fsr,	[%l7 + 0x64]
	set	0x44, %o6
	sta	%f1,	[%l7 + %o6] 0x81
loop_44:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%g6
	st	%fsr,	[%l7 + 0x50]
	wr	%o6,	%i4,	%pic
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%l3
	nop
	set	0x14, %g5
	sth	%i3,	[%l7 + %g5]
	set	0x7C, %g4
	sta	%f1,	[%l7 + %g4] 0x80
	nop
	set	0x79, %o0
	ldub	[%l7 + %o0],	%g4
	nop
	set	0x6E, %l1
	ldub	[%l7 + %l1],	%l0
	nop
	set	0x4A, %i2
	ldub	[%l7 + %i2],	%l4
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%i0
	nop
	set	0x38, %i1
	std	%g4,	[%l7 + %i1]
	nop
	set	0x54, %g6
	ldsw	[%l7 + %g6],	%o2
	nop
	set	0x54, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x58, %l3
	ldub	[%l7 + %l3],	%l6
	or	%o3,	%g1,	%i5
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x48, %l5
	ldsw	[%l7 + %l5],	%l1
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x40],	%f13
	set	0x28, %i0
	stxa	%o1,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x48, %l6
	stx	%o0,	[%l7 + %l6]
	nop
	set	0x58, %o5
	lduw	[%l7 + %o5],	%l5
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%l2
	set	0x60, %o2
	stwa	%o4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x70, %i3
	stx	%i6,	[%l7 + %i3]
	wr	%i7,	%g7,	%y
	nop
	nop
	setx	0xA53E11DE9F1E7D51,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x08FB7A34A417F238,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f28,	%f10
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g3
	st	%f26,	[%l7 + 0x1C]
	set	0x70, %i5
	sta	%f0,	[%l7 + %i5] 0x81
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%g2
	nop
	set	0x68, %o3
	lduh	[%l7 + %o3],	%g6
	nop
	set	0x4C, %g1
	lduw	[%l7 + %g1],	%o7
	set	0x79, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o6
	ld	[%l7 + 0x30],	%f24
	set	0x58, %l0
	lda	[%l7 + %l0] 0x88,	%f13
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%l3
	nop
	set	0x16, %l2
	ldstub	[%l7 + %l2],	%i4
	nop
	set	0x08, %o6
	ldstub	[%l7 + %o6],	%i3
	nop
	set	0x25, %g7
	stb	%l0,	[%l7 + %g7]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xca
	set	0x10, %g5
	swapa	[%l7 + %g5] 0x88,	%g4
	nop
	set	0x31, %g4
	ldsb	[%l7 + %g4],	%l4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	ld	[%l7 + 0x6C],	%f6
	ld	[%l7 + 0x54],	%f8
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	set	0x72, %i4
	stha	%o5,	[%l7 + %i4] 0x81
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%o2
	nop
	set	0x6A, %i6
	ldub	[%l7 + %i6],	%g5
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x89,	%i1
	set	0x54, %i1
	swapa	[%l7 + %i1] 0x80,	%l6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd8,	%f16
	nop
	set	0x09, %l5
	ldub	[%l7 + %l5],	%g1
	ld	[%l7 + 0x3C],	%f4
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x88,	%i5
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%o3
	nop
	set	0x69, %i7
	ldsb	[%l7 + %i7],	%l1
	fpadd16	%f20,	%f20,	%f0
	wr	%o1,	%o0,	%set_softint
	nop
	set	0x56, %o2
	sth	%l2,	[%l7 + %o2]
	and	%o4,	%i6,	%i7
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%g7
	bg,pn	%xcc,	loop_45
	nop
	set	0x7E, %i3
	sth	%i2,	[%l7 + %i3]
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%g2
	set	0x70, %o3
	stwa	%g3,	[%l7 + %o3] 0xeb
	membar	#Sync
loop_45:
	nop
	set	0x40, %g3
	lda	[%l7 + %g3] 0x80,	%f26
	wr	%g6,	%o7,	%clear_softint
	st	%f6,	[%l7 + 0x74]
	set	0x18, %o7
	stda	%o6,	[%l7 + %o7] 0x88
	wr	%i4,	%l3,	%ccr
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf0
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%g4
	and	%i3,	%o5,	%l4
	nop
	set	0x28, %l4
	stx	%o2,	[%l7 + %l4]
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f10
	ld	[%l7 + 0x4C],	%f6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd8
	set	0x38, %g7
	stda	%i0,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x20, %g2
	lda	[%l7 + %g2] 0x88,	%f14
	nop
	set	0x63, %o6
	ldub	[%l7 + %o6],	%g5
	set	0x2C, %g4
	stwa	%i1,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x70, %g5
	stx	%g1,	[%l7 + %g5]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f22
	set	0x78, %o0
	stha	%i5,	[%l7 + %o0] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o3
	set	0x4A, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l1
	set	0x51, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o0
	set	0x78, %i2
	swapa	[%l7 + %i2] 0x81,	%o1
	ble,pn	%icc,	loop_46
	or	%l2,	%o4,	%i7
	nop
	set	0x08, %g6
	std	%f30,	[%l7 + %g6]
	nop
	set	0x36, %i1
	lduh	[%l7 + %i1],	%i6
loop_46:
	add	%l5,	%g7,	%g2
	wr	%g3,	%i2,	%clear_softint
	add	%g6,	%o6,	%i4
	st	%fsr,	[%l7 + 0x7C]
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x88,	 0
	set	0x44, %o4
	stha	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x68, %l3
	ldsh	[%l7 + %l3],	%g4
	set	0x70, %o1
	stda	%i2,	[%l7 + %o1] 0x81
	st	%fsr,	[%l7 + 0x6C]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	and	%l4,	%o2,	%i0
	set	0x08, %i7
	stwa	%i1,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
	nop
	set	0x22, %l6
	lduh	[%l7 + %l6],	%g1
	add	%i5,	%l6,	%o3
	set	0x68, %i0
	stda	%l0,	[%l7 + %i0] 0x89
	nop
	set	0x60, %i3
	stx	%g5,	[%l7 + %i3]
	and	%o1,	%o0,	%o4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x80
	nop
	set	0x24, %i5
	ldsh	[%l7 + %i5],	%i7
	set	0x20, %g3
	stda	%i6,	[%l7 + %g3] 0x80
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%l2
	nop
	set	0x38, %l4
	std	%f8,	[%l7 + %l4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%i2
	set	0x64, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g6
	add	%g3,	%o6,	%i4
	nop
	set	0x58, %l0
	swap	[%l7 + %l0],	%l3
	nop
	set	0x24, %g7
	ldsw	[%l7 + %g7],	%l0
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%i2
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x89,	%g4
	ld	[%l7 + 0x58],	%f31
	nop
	set	0x38, %g4
	std	%f10,	[%l7 + %g4]
	or	%o7,	%o5,	%o2
	and	%l4,	%i1,	%g1
	nop
	set	0x28, %o6
	std	%i0,	[%l7 + %o6]
	or	%i5,	%o3,	%l6
	bgu,a,pt	%icc,	loop_47
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%g5
	nop
	set	0x78, %g5
	std	%l0,	[%l7 + %g5]
	nop
	set	0x5C, %o0
	prefetch	[%l7 + %o0],	 1
loop_47:
	nop
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	set	0x7D, %i2
	ldsb	[%l7 + %i2],	%o0
	set	0x68, %g6
	stwa	%i7,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x2C, %i4
	ldsw	[%l7 + %i4],	%o4
	set	0x68, %l5
	stxa	%i6,	[%l7 + %l5] 0x88
	ld	[%l7 + 0x24],	%f30
	nop
	set	0x3A, %o4
	ldub	[%l7 + %o4],	%l2
	set	0x44, %l3
	stha	%l5,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x40, %i1
	lda	[%l7 + %i1] 0x80,	%f6
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%g7
	nop
	set	0x1C, %o5
	ldsh	[%l7 + %o5],	%i2
	wr	%g2,	%g3,	%set_softint
	set	0x3B, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o6
	nop
	set	0x37, %i7
	stb	%i4,	[%l7 + %i7]
	st	%f2,	[%l7 + 0x78]
	set	0x68, %l6
	sta	%f3,	[%l7 + %l6] 0x81
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xda
	set	0x17, %i0
	stba	%l3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%g6
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%i3
	nop
	set	0x1E, %o7
	lduh	[%l7 + %o7],	%l0
	bne,a	%icc,	loop_48
	nop
	set	0x40, %o3
	std	%g4,	[%l7 + %o3]
	set	0x68, %l4
	stda	%o4,	[%l7 + %l4] 0xe2
	membar	#Sync
loop_48:
	wr	%o7,	%o2,	%y
	set	0x48, %l2
	sta	%f25,	[%l7 + %l2] 0x88
	nop
	set	0x5A, %g7
	ldsb	[%l7 + %g7],	%i1
	nop
	set	0x21, %g2
	ldub	[%l7 + %g2],	%l4
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%i0
	nop
	set	0x3D, %g4
	stb	%g1,	[%l7 + %g4]
	nop
	set	0x60, %g1
	lduw	[%l7 + %g1],	%o3
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x88,	%l6
	set	0x40, %g5
	swapa	[%l7 + %g5] 0x89,	%i5
	st	%f4,	[%l7 + 0x1C]
	nop
	set	0x30, %l1
	stb	%l1,	[%l7 + %l1]
	nop
	set	0x22, %o0
	ldsb	[%l7 + %o0],	%o1
	or	%g5,	%o0,	%i7
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x45, %g6
	ldstub	[%l7 + %g6],	%o4
	and	%i6,	%l5,	%g7
	nop
	set	0x65, %i4
	ldstub	[%l7 + %i4],	%i2
	nop
	set	0x50, %l5
	std	%g2,	[%l7 + %l5]
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x81,	%l2
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%g3
	nop
	set	0x30, %i1
	std	%f16,	[%l7 + %i1]
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%o6
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%l3
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%i4
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%g6
	nop
	set	0x18, %l6
	sth	%l0,	[%l7 + %l6]
	nop
	set	0x41, %i7
	stb	%i3,	[%l7 + %i7]
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xea,	%o4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%o2
	st	%fsr,	[%l7 + 0x08]
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x89,	 1
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f18
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%i1
	or	%l4,	%g1,	%i0
	nop
	set	0x0C, %o3
	lduw	[%l7 + %o3],	%o3
	nop
	set	0x30, %l4
	sth	%l6,	[%l7 + %l4]
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x81,	%i5
	set	0x20, %l2
	lda	[%l7 + %l2] 0x89,	%f6
	nop
	set	0x5D, %g2
	ldstub	[%l7 + %g2],	%o1
	nop
	set	0x5E, %l0
	ldub	[%l7 + %l0],	%l1
	nop
	set	0x46, %g4
	ldsb	[%l7 + %g4],	%g5
	or	%o0,	%o4,	%i6
	set	0x3B, %g7
	stba	%i7,	[%l7 + %g7] 0x81
	set	0x50, %o6
	stxa	%g7,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x80,	%i2
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f30
	or	%g2,	%l2,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%l3
	and	%i4,	%g6,	%o6
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%l0
	wr	%i3,	%g4,	%ccr
	nop
	set	0x3C, %o0
	ldsw	[%l7 + %o0],	%o5
	st	%fsr,	[%l7 + 0x0C]
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x89,	%o7
	set	0x44, %i4
	sta	%f6,	[%l7 + %i4] 0x80
	nop
	set	0x7C, %g6
	stw	%o2,	[%l7 + %g6]
	ld	[%l7 + 0x3C],	%f17
	set	0x48, %l5
	swapa	[%l7 + %l5] 0x89,	%i1
	nop
	set	0x34, %i2
	ldub	[%l7 + %i2],	%g1
	nop
	set	0x44, %i1
	lduw	[%l7 + %i1],	%l4
	set	0x08, %o4
	stxa	%i0,	[%l7 + %o4] 0x88
	or	%o3,	%i5,	%l6
	set	0x10, %l3
	stha	%l1,	[%l7 + %l3] 0x88
	and	%o1,	%g5,	%o0
	nop
	set	0x18, %o1
	swap	[%l7 + %o1],	%i6
	wr	%i7,	%o4,	%softint
	nop
	set	0x40, %o2
	swap	[%l7 + %o2],	%i2
	nop
	set	0x18, %l6
	std	%f30,	[%l7 + %l6]
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%g2
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%l2
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f24
	nop
	set	0x48, %i5
	stx	%g3,	[%l7 + %i5]
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x89,	%l5
	set	0x42, %l4
	stha	%l3,	[%l7 + %l4] 0xea
	membar	#Sync
	ld	[%l7 + 0x58],	%f23
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f16
	nop
	set	0x10, %l2
	ldub	[%l7 + %l2],	%g7
	or	%i4,	%g6,	%l0
	nop
	set	0x50, %g2
	sth	%i3,	[%l7 + %g2]
	st	%f23,	[%l7 + 0x54]
	set	0x28, %l0
	swapa	[%l7 + %l0] 0x81,	%g4
	nop
	set	0x58, %g4
	stw	%o6,	[%l7 + %g4]
	fpadd32s	%f9,	%f5,	%f5
	nop
	set	0x47, %o7
	ldub	[%l7 + %o7],	%o7
	or	%o2,	%i1,	%g1
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%l4
	nop
	set	0x58, %g5
	stw	%o5,	[%l7 + %g5]
	set	0x20, %o6
	lda	[%l7 + %o6] 0x80,	%f29
	nop
	set	0x28, %g1
	stx	%fsr,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x18, %l1
	swap	[%l7 + %l1],	%i0
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f14
	set	0x5C, %i4
	sta	%f1,	[%l7 + %i4] 0x88
	set	0x4A, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x89
	nop
	set	0x7C, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x50, %i2
	std	%f26,	[%l7 + %i2]
	set	0x1E, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o3
	bgu,pn	%icc,	loop_49
	add	%l1,	%o1,	%g5
	nop
	set	0x74, %i1
	swap	[%l7 + %i1],	%l6
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x88,	 1
loop_49:
	nop
	set	0x3C, %o2
	stba	%o0,	[%l7 + %o2] 0x81
	nop
	set	0x68, %o1
	stw	%i7,	[%l7 + %o1]
	nop
	set	0x50, %l6
	std	%f2,	[%l7 + %l6]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%i2
	nop
	set	0x26, %i3
	ldsh	[%l7 + %i3],	%g2
	set	0x56, %i0
	stha	%o4,	[%l7 + %i0] 0x88
	nop
	set	0x5C, %i5
	swap	[%l7 + %i5],	%g3
	nop
	set	0x43, %i7
	ldsb	[%l7 + %i7],	%l5
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xca
	set	0x7E, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l2
	nop
	set	0x1C, %g3
	ldsb	[%l7 + %g3],	%g7
	nop
	set	0x58, %l2
	stx	%l3,	[%l7 + %l2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%l0
	nop
	set	0x74, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x78, %g2
	stw	%g4,	[%l7 + %g2]
	nop
	set	0x68, %o7
	lduw	[%l7 + %o7],	%i3
	nop
	set	0x28, %g7
	ldsh	[%l7 + %g7],	%o7
	nop
	set	0x69, %g4
	ldub	[%l7 + %g4],	%o2
	nop
	set	0x4A, %g5
	ldstub	[%l7 + %g5],	%o6
	ble,pt	%icc,	loop_50
	nop
	set	0x28, %g1
	prefetch	[%l7 + %g1],	 0
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x88,	%i1
loop_50:
	nop
	set	0x78, %o0
	stx	%l4,	[%l7 + %o0]
	set	0x50, %i4
	stxa	%g1,	[%l7 + %i4] 0x81
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%o5
	and	%i0,	%i5,	%l1
	nop
	set	0x2E, %i6
	ldub	[%l7 + %i6],	%o1
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf0
	membar	#Sync
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc4
	st	%f29,	[%l7 + 0x20]
	nop
	set	0x14, %o4
	lduw	[%l7 + %o4],	%g5
	ld	[%l7 + 0x24],	%f21
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%o3
	nop
	set	0x26, %i1
	sth	%i6,	[%l7 + %i1]
	ld	[%l7 + 0x30],	%f16
	set	0x6E, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf1
	membar	#Sync
	nop
	set	0x50, %l6
	std	%f0,	[%l7 + %l6]
	set	0x6C, %l3
	sta	%f2,	[%l7 + %l3] 0x80
	or	%o0,	%i7,	%g2
	nop
	set	0x2D, %i3
	ldub	[%l7 + %i3],	%o4
	nop
	set	0x5B, %i0
	ldsb	[%l7 + %i0],	%g3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%l5
	st	%f4,	[%l7 + 0x3C]
	set	0x7C, %o5
	stwa	%g7,	[%l7 + %o5] 0x89
	nop
	set	0x08, %i7
	stx	%l2,	[%l7 + %i7]
	nop
	set	0x40, %o3
	std	%f30,	[%l7 + %o3]
	nop
	set	0x70, %l4
	stw	%g6,	[%l7 + %l4]
	nop
	set	0x68, %g3
	lduh	[%l7 + %g3],	%l3
	fpsub32	%f26,	%f0,	%f6
	nop
	set	0x6E, %i5
	ldstub	[%l7 + %i5],	%i4
	nop
	set	0x3A, %l2
	stb	%g4,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f16
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%l0
	and	%o7,	%i3,	%o2
	nop
	set	0x24, %o7
	sth	%i1,	[%l7 + %o7]
	nop
	set	0x0E, %g4
	stb	%l4,	[%l7 + %g4]
	nop
	set	0x08, %g5
	std	%f8,	[%l7 + %g5]
	and	%g1,	%o5,	%i0
	nop
	set	0x7C, %g7
	ldsb	[%l7 + %g7],	%i5
	ba,pn	%icc,	loop_51
	wr	%l1,	%o1,	%set_softint
	fpsub16	%f20,	%f14,	%f22
	nop
	set	0x77, %g1
	stb	%g5,	[%l7 + %g1]
loop_51:
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%o6
	or	%o3,	%l6,	%o0
	set	0x50, %l1
	lda	[%l7 + %l1] 0x80,	%f19
	fpsub16s	%f30,	%f4,	%f13
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%i6
	nop
	set	0x0C, %i4
	stw	%o4,	[%l7 + %i4]
	set	0x40, %i6
	swapa	[%l7 + %i6] 0x81,	%g2
	nop
	set	0x10, %g6
	ldsh	[%l7 + %g6],	%g3
	nop
	set	0x42, %o6
	lduh	[%l7 + %o6],	%l5
	nop
	set	0x38, %o4
	ldsb	[%l7 + %o4],	%i2
	nop
	set	0x58, %l5
	stx	%g7,	[%l7 + %l5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%l3
	ble,a,pn	%xcc,	loop_52
	nop
	set	0x48, %i2
	swap	[%l7 + %i2],	%i4
	nop
	set	0x1C, %o2
	swap	[%l7 + %o2],	%g6
	nop
	set	0x20, %i1
	std	%l0,	[%l7 + %i1]
loop_52:
	nop
	set	0x21, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o7
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x81,	%i3
	set	0x08, %l3
	stda	%g4,	[%l7 + %l3] 0xea
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o2
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x80,	 3
	set	0x3A, %i0
	stba	%o5,	[%l7 + %i0] 0x89
	bne,pt	%icc,	loop_53
	nop
	nop
	setx	0xC0E50F15CDC9C56E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xABFC0E85FC8BD3A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f16,	%f22
	nop
	set	0x56, %o5
	stb	%g1,	[%l7 + %o5]
	nop
	set	0x48, %i7
	sth	%i5,	[%l7 + %i7]
loop_53:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xe3,	%i0
	nop
	set	0x0C, %g3
	lduh	[%l7 + %g3],	%o1
	nop
	set	0x2F, %l4
	ldsb	[%l7 + %l4],	%l1
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%o6
	nop
	set	0x49, %l0
	ldsb	[%l7 + %l0],	%o3
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc8
	nop
	set	0x22, %g2
	ldsb	[%l7 + %g2],	%g5
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x81,	%o0
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f4
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%i6
	set	0x18, %g4
	stda	%i6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc8
	and	%i6,	%g2,	%o4
	wr	%l5,	%i2,	%pic
	and	%g3,	%l2,	%l3
	set	0x10, %l1
	stxa	%g7,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x30, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x74, %g1
	ldub	[%l7 + %g1],	%g6
	nop
	set	0x2A, %i6
	sth	%i4,	[%l7 + %i6]
	nop
	set	0x30, %o6
	stx	%o7,	[%l7 + %o6]
	nop
	set	0x4E, %o4
	sth	%i3,	[%l7 + %o4]
	nop
	set	0x28, %l5
	ldsw	[%l7 + %l5],	%l0
	add	%g4,	%o2,	%l4
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f12
	and	%o5,	%i1,	%i5
	fpsub32s	%f31,	%f3,	%f15
	and	%i0,	%o1,	%g1
	nop
	set	0x48, %g6
	ldsb	[%l7 + %g6],	%l1
	nop
	set	0x5E, %o2
	lduh	[%l7 + %o2],	%o3
	st	%fsr,	[%l7 + 0x28]
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xe2,	%o6
	set	0x38, %i1
	lda	[%l7 + %i1] 0x89,	%f3
	ld	[%l7 + 0x7C],	%f7
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	nop
	set	0x4C, %i3
	stw	%o0,	[%l7 + %i3]
	wr	%i7,	%i6,	%ccr
	nop
	set	0x78, %l6
	ldsw	[%l7 + %l6],	%g2
	nop
	set	0x0F, %o5
	ldub	[%l7 + %o5],	%l6
	set	0x48, %i0
	stda	%l4,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x4E, %o3
	ldsh	[%l7 + %o3],	%i2
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x81,	%g3
	nop
	set	0x77, %i7
	ldub	[%l7 + %i7],	%l2
	add	%o4,	%l3,	%g6
	nop
	set	0x18, %i5
	std	%g6,	[%l7 + %i5]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x80,	%i4
	nop
	set	0x7C, %g2
	ldsh	[%l7 + %g2],	%i3
	nop
	set	0x38, %l4
	lduh	[%l7 + %l4],	%o7
	set	0x29, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g4
	nop
	set	0x19, %o7
	ldub	[%l7 + %o7],	%o2
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x88,	%l0
	ld	[%l7 + 0x7C],	%f29
	nop
	set	0x6C, %o0
	sth	%o5,	[%l7 + %o0]
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xe2,	%l4
	nop
	set	0x0E, %i4
	sth	%i5,	[%l7 + %i4]
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%i0
	set	0x38, %i6
	stda	%o0,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x35, %o6
	ldstub	[%l7 + %o6],	%i1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x20, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x2A, %l1
	ldsh	[%l7 + %l1],	%l1
	set	0x10, %i2
	stda	%o2,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x70, %l5
	std	%o6,	[%l7 + %l5]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1263
!	Type a   	: 29
!	Type cti   	: 28
!	Type x   	: 517
!	Type f   	: 33
!	Type i   	: 130
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
	set	0x9,	%g1
	set	0x5,	%g2
	set	0xD,	%g3
	set	0x1,	%g4
	set	0x6,	%g5
	set	0x1,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xD,	%i1
	set	-0xC,	%i2
	set	-0x7,	%i3
	set	-0x1,	%i4
	set	-0x1,	%i5
	set	-0x1,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x05853126,	%l0
	set	0x0E6A4049,	%l1
	set	0x6BDD3B78,	%l2
	set	0x238B9772,	%l3
	set	0x5EBD220E,	%l4
	set	0x0335D3ED,	%l5
	set	0x406F2EA3,	%l6
	!# Output registers
	set	0x1343,	%o0
	set	-0x1DB4,	%o1
	set	-0x0388,	%o2
	set	0x11D8,	%o3
	set	-0x0F01,	%o4
	set	-0x0E23,	%o5
	set	-0x1B79,	%o6
	set	-0x07D6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	set	0x5C, %g6
	lda	[%l7 + %g6] 0x81,	%f28
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%g1
	fpadd16	%f2,	%f12,	%f0
	nop
	set	0x78, %o1
	lduh	[%l7 + %o1],	%o0
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x81,	%i7
	nop
	set	0x3E, %l3
	ldstub	[%l7 + %l3],	%i6
	nop
	set	0x2E, %i1
	ldsh	[%l7 + %i1],	%g2
	nop
	set	0x4A, %i3
	lduh	[%l7 + %i3],	%l6
	set	0x45, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i2
	nop
	set	0x30, %o5
	std	%f28,	[%l7 + %o5]
	add	%l5,	%g3,	%o4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf1
	membar	#Sync
	set	0x7A, %g3
	stba	%l2,	[%l7 + %g3] 0x88
	nop
	set	0x2C, %i7
	stw	%g6,	[%l7 + %i7]
	set	0x60, %i5
	lda	[%l7 + %i5] 0x80,	%f23
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x80,	%f1
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x89,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%g7
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x89,	 4
	nop
	set	0x7A, %g2
	sth	%i3,	[%l7 + %g2]
	or	%o2,	%g4,	%o5
	nop
	set	0x7E, %g5
	ldstub	[%l7 + %g5],	%l4
	nop
	set	0x34, %l4
	ldsb	[%l7 + %l4],	%l0
	nop
	set	0x68, %g4
	std	%i0,	[%l7 + %g4]
	fpadd16s	%f28,	%f13,	%f30
	nop
	set	0x64, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x70, %g7
	stxa	%o1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x6A, %i4
	stba	%i1,	[%l7 + %i4] 0x88
	set	0x7C, %o7
	lda	[%l7 + %o7] 0x89,	%f30
	and	%i5,	%o3,	%l1
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x81,	%o6
	nop
	set	0x12, %g1
	lduh	[%l7 + %g1],	%g5
	nop
	set	0x27, %o4
	ldstub	[%l7 + %o4],	%g1
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%o0
	nop
	set	0x7E, %l5
	ldsh	[%l7 + %l5],	%i7
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%i6
	set	0x28, %g6
	stxa	%g2,	[%l7 + %g6] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f16
	set	0x74, %l3
	stha	%i2,	[%l7 + %l3] 0x88
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f0
	nop
	set	0x76, %i1
	ldsb	[%l7 + %i1],	%l5
	set	0x3E, %l6
	stba	%l6,	[%l7 + %l6] 0xea
	membar	#Sync
	wr	%o4,	%g3,	%set_softint
	nop
	set	0x38, %i3
	swap	[%l7 + %i3],	%l2
	nop
	set	0x46, %o3
	sth	%l3,	[%l7 + %o3]
	nop
	set	0x08, %o5
	std	%f28,	[%l7 + %o5]
	nop
	set	0x46, %g3
	sth	%g6,	[%l7 + %g3]
	ld	[%l7 + 0x78],	%f5
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%g6
	set	0x74, %i0
	stha	%i4,	[%l7 + %i0] 0xe2
	membar	#Sync
	add	%o7,	%o2,	%i3
	nop
	set	0x63, %i7
	ldub	[%l7 + %i7],	%g4
	or	%o5,	%l0,	%i0
	ld	[%l7 + 0x5C],	%f8
	nop
	set	0x28, %l0
	stw	%o1,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x08, %g2
	swap	[%l7 + %g2],	%i1
	nop
	set	0x44, %l2
	stw	%l4,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x34]
	and	%o3,	%i5,	%l1
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%o6
	ld	[%l7 + 0x10],	%f15
	set	0x78, %g4
	stxa	%g1,	[%l7 + %g4] 0x81
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%o0
	set	0x48, %g7
	lda	[%l7 + %g7] 0x89,	%f29
	set	0x60, %o0
	stda	%g4,	[%l7 + %o0] 0x88
	nop
	set	0x28, %i4
	stx	%i7,	[%l7 + %i4]
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x3C, %g1
	ldsb	[%l7 + %g1],	%i6
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%i2
	set	0x28, %o4
	stwa	%g2,	[%l7 + %o4] 0x81
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f28
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	set	0x70, %l5
	stxa	%l5,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x58, %g6
	lda	[%l7 + %g6] 0x80,	%f26
	nop
	set	0x4A, %o6
	ldstub	[%l7 + %o6],	%o4
	nop
	set	0x34, %o1
	ldsw	[%l7 + %o1],	%g3
	set	0x17, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xeb,	%l2
	nop
	set	0x1C, %l6
	sth	%g7,	[%l7 + %l6]
	st	%f4,	[%l7 + 0x0C]
	set	0x14, %i1
	stwa	%i4,	[%l7 + %i1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x34],	%f13
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x89,	 4
	nop
	set	0x64, %o5
	ldstub	[%l7 + %o5],	%g6
	set	0x34, %i3
	stha	%o2,	[%l7 + %i3] 0x88
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x24, %i0
	sth	%i3,	[%l7 + %i0]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l0
	set	0x28, %g3
	stxa	%g4,	[%l7 + %g3] 0x88
	nop
	set	0x54, %i7
	lduh	[%l7 + %i7],	%i0
	nop
	set	0x6D, %g2
	stb	%o1,	[%l7 + %g2]
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x80,	%f31
	or	%l4,	%o3,	%i1
	nop
	set	0x54, %l0
	stw	%l1,	[%l7 + %l0]
	nop
	set	0x1C, %g4
	ldsb	[%l7 + %g4],	%i5
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xea,	%g0
	st	%fsr,	[%l7 + 0x34]
	set	0x28, %g5
	sta	%f19,	[%l7 + %g5] 0x81
	set	0x34, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o0
	set	0x3A, %o0
	stha	%g5,	[%l7 + %o0] 0x81
	add	%o6,	%i7,	%i6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xda
	or	%i2,	%g2,	%l6
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%l4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f16
	and	%o4,	%g3,	%l3
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x80,	%l2
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%i4
	fpsub32	%f8,	%f26,	%f20
	nop
	set	0x54, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x2A, %l1
	ldsh	[%l7 + %l1],	%o7
	ld	[%l7 + 0x20],	%f4
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f28
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x18, %o1
	std	%f20,	[%l7 + %o1]
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	set	0x48, %o2
	stba	%o2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x6E, %i1
	stha	%g6,	[%l7 + %i1] 0x80
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0
	and	%l0,	%g4,	%i0
	set	0x5E, %l6
	stba	%o5,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x64, %o5
	ldsh	[%l7 + %o5],	%l4
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	set	0x70, %i0
	stx	%i1,	[%l7 + %i0]
	fpsub16s	%f24,	%f5,	%f5
	set	0x34, %g3
	sta	%f15,	[%l7 + %g3] 0x80
	nop
	set	0x2A, %i3
	sth	%o3,	[%l7 + %i3]
	set	0x78, %g2
	stwa	%l1,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x4C, %l2
	swapa	[%l7 + %l2] 0x89,	%i5
	nop
	set	0x62, %l0
	ldsh	[%l7 + %l0],	%o0
	set	0x13, %i7
	ldstuba	[%l7 + %i7] 0x88,	%g1
	or	%o6,	%i7,	%i6
	nop
	set	0x56, %g4
	ldsh	[%l7 + %g4],	%i2
	wr	%g2,	%g5,	%clear_softint
	set	0x11, %l4
	ldstuba	[%l7 + %l4] 0x88,	%l5
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xea,	%o4
	nop
	set	0x40, %o0
	ldstub	[%l7 + %o0],	%g3
	nop
	set	0x70, %g7
	stx	%l3,	[%l7 + %g7]
	set	0x58, %i4
	lda	[%l7 + %i4] 0x88,	%f8
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xda
	and	%l2,	%l6,	%i4
	nop
	set	0x10, %o7
	ldstub	[%l7 + %o7],	%g7
	nop
	set	0x50, %i2
	std	%f6,	[%l7 + %i2]
	nop
	set	0x4A, %o4
	ldsh	[%l7 + %o4],	%o7
	nop
	set	0x24, %l1
	lduh	[%l7 + %l1],	%o2
	and	%g6,	%i3,	%l0
	set	0x3C, %l5
	stba	%g4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x25, %g1
	ldstub	[%l7 + %g1],	%i0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f2
	nop
	set	0x3D, %o6
	ldsb	[%l7 + %o6],	%l4
	nop
	set	0x5A, %l3
	ldsh	[%l7 + %l3],	%o1
	nop
	set	0x10, %g6
	lduw	[%l7 + %g6],	%i1
	nop
	set	0x48, %o2
	prefetch	[%l7 + %o2],	 0
	ble,a	%icc,	loop_54
	nop
	set	0x1C, %o3
	stw	%o5,	[%l7 + %o3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%i5
loop_54:
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	set	0x38, %i5
	stxa	%o3,	[%l7 + %i5] 0x81
	set	0x08, %i0
	sta	%f15,	[%l7 + %i0] 0x80
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f0
	set	0x24, %i3
	stha	%o0,	[%l7 + %i3] 0x80
	st	%f14,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x60]
	set	0x40, %g2
	stwa	%o6,	[%l7 + %g2] 0xe2
	membar	#Sync
	or	%i7,	%i6,	%g2
	nop
	set	0x38, %l0
	swap	[%l7 + %l0],	%g5
	nop
	set	0x30, %l2
	stx	%i2,	[%l7 + %l2]
	set	0x28, %g4
	sta	%f6,	[%l7 + %g4] 0x81
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%o4
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%l2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i4
	nop
	set	0x38, %o0
	std	%f2,	[%l7 + %o0]
	set	0x28, %g7
	stda	%g6,	[%l7 + %g7] 0x88
	nop
	set	0x68, %i7
	std	%f6,	[%l7 + %i7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%o2
	wr 	%g0, 	0x7, 	%fprs
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%i3
	nop
	set	0x55, %i4
	stb	%g4,	[%l7 + %i4]
	nop
	set	0x08, %o7
	ldsb	[%l7 + %o7],	%l4
	nop
	set	0x32, %i6
	stb	%o1,	[%l7 + %i6]
	nop
	set	0x08, %o4
	std	%i0,	[%l7 + %o4]
	set	0x4E, %l1
	stha	%i0,	[%l7 + %l1] 0x80
	ld	[%l7 + 0x34],	%f12
	set	0x5C, %i2
	lda	[%l7 + %i2] 0x88,	%f29
	set	0x20, %l5
	swapa	[%l7 + %l5] 0x89,	%l1
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	nop
	set	0x30, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x4B, %l3
	stb	%i5,	[%l7 + %l3]
	nop
	set	0x5C, %o6
	stw	%o5,	[%l7 + %o6]
	nop
	set	0x37, %o2
	stb	%g1,	[%l7 + %o2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%o0
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%i7
	nop
	set	0x5C, %i1
	swap	[%l7 + %i1],	%i6
	nop
	set	0x3D, %o3
	ldsb	[%l7 + %o3],	%o6
	nop
	set	0x62, %l6
	sth	%g2,	[%l7 + %l6]
	set	0x40, %i5
	sta	%f0,	[%l7 + %i5] 0x80
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%g4
	nop
	set	0x28, %o5
	stb	%o4,	[%l7 + %o5]
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l5
	or	%i2,	%l2,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%o7
	set	0x5E, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l6
	nop
	set	0x5C, %l0
	stw	%g6,	[%l7 + %l0]
	set	0x41, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%i3
	nop
	set	0x20, %g2
	ldsh	[%l7 + %g2],	%l4
	set	0x20, %l4
	stda	%o0,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x11, %g5
	stb	%i1,	[%l7 + %g5]
	nop
	set	0x54, %o0
	stw	%g4,	[%l7 + %o0]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%l1
	set	0x4C, %g7
	swapa	[%l7 + %g7] 0x89,	%o5
	nop
	set	0x38, %i7
	std	%g0,	[%l7 + %i7]
	set	0x28, %g4
	swapa	[%l7 + %g4] 0x89,	%i5
	nop
	set	0x28, %o7
	prefetch	[%l7 + %o7],	 3
	st	%f1,	[%l7 + 0x28]
	nop
	set	0x41, %i4
	ldstub	[%l7 + %i4],	%o3
	nop
	set	0x78, %o4
	lduh	[%l7 + %o4],	%i7
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%o0
	or	%o6,	%i6,	%g5
	st	%fsr,	[%l7 + 0x0C]
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x48, %l5
	ldsb	[%l7 + %l5],	%l5
	and	%i2,	%l2,	%l3
	nop
	set	0x46, %i2
	ldsh	[%l7 + %i2],	%i4
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x89,	 3
	st	%fsr,	[%l7 + 0x5C]
	or	%g3,	%o7,	%l6
	nop
	set	0x24, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x50, %o6
	std	%f12,	[%l7 + %o6]
	nop
	set	0x38, %o2
	lduw	[%l7 + %o2],	%o4
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%g6
	nop
	set	0x48, %i1
	lduh	[%l7 + %i1],	%o2
	ld	[%l7 + 0x08],	%f27
	nop
	set	0x24, %l3
	swap	[%l7 + %l3],	%l0
	nop
	set	0x2A, %o3
	sth	%l4,	[%l7 + %o3]
	set	0x20, %i5
	sta	%f4,	[%l7 + %i5] 0x89
	nop
	set	0x70, %g3
	stx	%o1,	[%l7 + %g3]
	set	0x7C, %l6
	lda	[%l7 + %l6] 0x80,	%f22
	nop
	set	0x55, %i3
	ldsb	[%l7 + %i3],	%i3
	set	0x10, %i0
	sta	%f7,	[%l7 + %i0] 0x81
	fpadd16	%f26,	%f4,	%f8
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x81,	%i1
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%g4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f16
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%o5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%l1
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc8
	set	0x7D, %l2
	stba	%o3,	[%l7 + %l2] 0x89
	nop
	set	0x39, %o0
	ldsb	[%l7 + %o0],	%i5
	add	%i7,	%o0,	%i6
	be,pt	%xcc,	loop_55
	st	%f23,	[%l7 + 0x54]
	nop
	set	0x2C, %g5
	ldstub	[%l7 + %g5],	%g5
	and	%o6,	%l5,	%i2
loop_55:
	nop
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	nop
	set	0x78, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x74, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%l2
	st	%f19,	[%l7 + 0x48]
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%l3
	set	0x1C, %o4
	sta	%f4,	[%l7 + %o4] 0x81
	nop
	set	0x55, %l1
	ldsb	[%l7 + %l1],	%i4
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%g2
	set	0x40, %i6
	stha	%g7,	[%l7 + %i6] 0x88
	add	%o7,	%g3,	%o4
	or	%g6,	%o2,	%l6
	nop
	set	0x28, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x18, %i2
	stx	%l0,	[%l7 + %i2]
	or	%l4,	%o1,	%i3
	nop
	set	0x30, %o6
	std	%i0,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f16
	nop
	set	0x72, %o2
	sth	%i0,	[%l7 + %o2]
	set	0x08, %i1
	lda	[%l7 + %i1] 0x80,	%f18
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%o5
	nop
	set	0x35, %o3
	ldstub	[%l7 + %o3],	%g1
	nop
	set	0x66, %l3
	lduh	[%l7 + %l3],	%l1
	nop
	set	0x50, %i5
	swap	[%l7 + %i5],	%o3
	nop
	set	0x35, %l6
	stb	%i5,	[%l7 + %l6]
	set	0x18, %g3
	lda	[%l7 + %g3] 0x80,	%f23
	add	%i7,	%o0,	%g4
	set	0x6C, %i3
	stwa	%i6,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x2A, %i0
	ldsb	[%l7 + %i0],	%g5
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x50, %o5
	std	%o6,	[%l7 + %o5]
	ble	%icc,	loop_56
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f22
	set	0x24, %l2
	sta	%f25,	[%l7 + %l2] 0x80
loop_56:
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%i2
	nop
	set	0x78, %g5
	std	%f28,	[%l7 + %g5]
	nop
	set	0x35, %g7
	stb	%l5,	[%l7 + %g7]
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xea,	%l2
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%i4
	nop
	set	0x68, %i4
	std	%f24,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%l2
	st	%fsr,	[%l7 + 0x2C]
	st	%f20,	[%l7 + 0x78]
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%g7
	nop
	set	0x4E, %o4
	sth	%g2,	[%l7 + %o4]
	set	0x38, %l1
	swapa	[%l7 + %l1] 0x80,	%o7
	nop
	set	0x48, %l5
	stx	%o4,	[%l7 + %l5]
	nop
	set	0x2A, %i6
	ldsb	[%l7 + %i6],	%g3
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%g6
	wr	%l6,	%o2,	%softint
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f16
	st	%f21,	[%l7 + 0x20]
	nop
	set	0x38, %i2
	ldsh	[%l7 + %i2],	%l0
	or	%o1,	%l4,	%i3
	and	%i0,	%i1,	%g1
	st	%f9,	[%l7 + 0x44]
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x80,	 1
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x80,	%o5
	set	0x50, %g6
	stda	%i4,	[%l7 + %g6] 0x81
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f28
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f16
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x80,	%o3
	nop
	set	0x76, %i5
	ldsh	[%l7 + %i5],	%i7
	set	0x78, %g3
	lda	[%l7 + %g3] 0x88,	%f10
	set	0x20, %l6
	stda	%o0,	[%l7 + %l6] 0x88
	ld	[%l7 + 0x08],	%f5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%g4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xd2
	set	0x74, %i3
	stwa	%g5,	[%l7 + %i3] 0x89
	nop
	nop
	setx	0x4AD9DF252721F98B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD8F296AE9DFE0D9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f12,	%f14
	nop
	set	0x78, %g2
	std	%o6,	[%l7 + %g2]
	nop
	set	0x3D, %o5
	ldub	[%l7 + %o5],	%i2
	set	0x12, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l3
	nop
	set	0x68, %l2
	std	%f30,	[%l7 + %l2]
	nop
	set	0x60, %g5
	lduw	[%l7 + %g5],	%i4
	set	0x54, %l4
	stha	%l5,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x4C, %i7
	sth	%l2,	[%l7 + %i7]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc8
	set	0x2A, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g7
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%g2
	or	%o7,	%g3,	%o4
	set	0x7F, %o4
	stba	%l6,	[%l7 + %o4] 0xe2
	membar	#Sync
	wr	%o2,	%g6,	%clear_softint
	wr	%l0,	%l4,	%clear_softint
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%i2
	nop
	set	0x62, %l5
	ldsb	[%l7 + %l5],	%i0
	st	%f14,	[%l7 + 0x58]
	set	0x60, %l1
	stha	%o1,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%i1,	%g1,	%o5
	nop
	set	0x0A, %i6
	ldsh	[%l7 + %i6],	%l1
	nop
	set	0x4C, %o1
	stb	%i5,	[%l7 + %o1]
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x80,	%o3
	nop
	set	0x50, %i2
	ldsw	[%l7 + %i2],	%i7
	fpadd16	%f26,	%f28,	%f4
	nop
	set	0x76, %g1
	ldsh	[%l7 + %g1],	%i6
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f0
	and	%o0,	%g5,	%o6
	and	%g4,	%i2,	%i4
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f30
	nop
	set	0x1D, %o3
	ldstub	[%l7 + %o3],	%l3
	and	%l5,	%g7,	%l2
	nop
	set	0x52, %l3
	lduh	[%l7 + %l3],	%o7
	set	0x10, %g6
	stxa	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x40, %g3
	swap	[%l7 + %g3],	%g3
	ld	[%l7 + 0x18],	%f4
	set	0x4F, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%o4
	or	%l0,	%g6,	%i3
	nop
	set	0x70, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x18, %i0
	stxa	%l4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x18, %l0
	stwa	%o1,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%i1
	fpadd32s	%f12,	%f6,	%f15
	set	0x58, %o0
	sta	%f12,	[%l7 + %o0] 0x80
	nop
	set	0x28, %l2
	stx	%i0,	[%l7 + %l2]
	nop
	set	0x2C, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x81,	%f23
	set	0x50, %g2
	stda	%o4,	[%l7 + %g2] 0x81
	nop
	set	0x50, %i7
	std	%l0,	[%l7 + %i7]
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%i5
	set	0x58, %g7
	swapa	[%l7 + %g7] 0x80,	%o3
	nop
	set	0x54, %o7
	ldub	[%l7 + %o7],	%g1
	nop
	set	0x24, %g4
	lduh	[%l7 + %g4],	%i6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc4
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%i7
	nop
	set	0x50, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%g4
	nop
	set	0x58, %o6
	ldx	[%l7 + %o6],	%o6
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%g4
	add	%i2,	%i4,	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g7
	add	%l2,	%o7,	%l5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd8
	nop
	set	0x7F, %i6
	ldub	[%l7 + %i6],	%g2
	nop
	set	0x6E, %o2
	ldsh	[%l7 + %o2],	%l6
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x81,	%g3
	nop
	set	0x6C, %l3
	ldsh	[%l7 + %l3],	%o2
	set	0x4C, %g6
	stwa	%l0,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x18]
	set	0x6C, %l6
	lda	[%l7 + %l6] 0x80,	%f20
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x89
	set	0x0C, %i0
	sta	%f10,	[%l7 + %i0] 0x81
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o4
	and	%l4,	%i3,	%i1
	set	0x08, %i3
	stwa	%i0,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	nop
	set	0x78, %o5
	std	%l0,	[%l7 + %o5]
	nop
	set	0x42, %g3
	lduh	[%l7 + %g3],	%o1
	set	0x2C, %l2
	sta	%f15,	[%l7 + %l2] 0x81
	nop
	set	0x1C, %g5
	sth	%i5,	[%l7 + %g5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFA8, 	%sys_tick_cmpr
	nop
	set	0x38, %o0
	std	%i6,	[%l7 + %o0]
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%g0
	nop
	set	0x18, %g2
	std	%o6,	[%l7 + %g2]
	ld	[%l7 + 0x0C],	%f12
	nop
	set	0x60, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x68, %i4
	swapa	[%l7 + %i4] 0x81,	%g4
	set	0x6E, %g7
	stha	%i2,	[%l7 + %g7] 0x81
	nop
	set	0x70, %g4
	std	%g4,	[%l7 + %g4]
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x3E, %l5
	stba	%o0,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x3C, %l1
	swapa	[%l7 + %l1] 0x81,	%i4
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f0
	set	0x30, %o1
	ldxa	[%l7 + %o1] 0x80,	%g7
	set	0x74, %o6
	swapa	[%l7 + %o6] 0x88,	%l2
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l3
	st	%fsr,	[%l7 + 0x08]
	set	0x20, %i6
	swapa	[%l7 + %i6] 0x80,	%l6
	nop
	set	0x54, %o2
	lduh	[%l7 + %o2],	%g2
	set	0x2C, %i2
	stwa	%o2,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x88,	%g3
	set	0x6C, %l3
	sta	%f13,	[%l7 + %l3] 0x81
	set	0x08, %i1
	stxa	%g6,	[%l7 + %i1] 0xeb
	membar	#Sync
	and	%l0,	%l4,	%i3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xda
	bleu,a,pn	%icc,	loop_57
	nop
	set	0x6A, %i5
	sth	%o4,	[%l7 + %i5]
	set	0x28, %i0
	lda	[%l7 + %i0] 0x88,	%f10
loop_57:
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%i1
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf1
	membar	#Sync
	nop
	set	0x32, %l0
	lduh	[%l7 + %l0],	%i0
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f8
	st	%f21,	[%l7 + 0x4C]
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x89,	%l1
	ld	[%l7 + 0x7C],	%f22
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe3,	%o0
	nop
	set	0x68, %o0
	swap	[%l7 + %o0],	%o5
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xda
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%o3
	or	%i7,	%g1,	%o6
	set	0x56, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g4
	set	0x08, %i7
	stda	%i2,	[%l7 + %i7] 0x81
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f0
	or	%g5,	%i6,	%i4
	nop
	set	0x6C, %g4
	ldsw	[%l7 + %g4],	%o0
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%g6
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%l2
	nop
	set	0x28, %o4
	stx	%l5,	[%l7 + %o4]
	nop
	nop
	setx	0x552D2E14,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x65A73172,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f23,	%f27
	nop
	set	0x3B, %o1
	ldstub	[%l7 + %o1],	%l3
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%o7
	add	%l6,	%g2,	%g3
	nop
	set	0x50, %o6
	stx	%o2,	[%l7 + %o6]
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x88,	%g6
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f14
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%l4
	nop
	set	0x10, %o3
	prefetch	[%l7 + %o3],	 2
	or	%i3,	%l0,	%o4
	nop
	set	0x4A, %i2
	sth	%i0,	[%l7 + %i2]
	fpsub32	%f26,	%f2,	%f14
	st	%f13,	[%l7 + 0x70]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%o1
	set	0x31, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o5
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f20
	set	0x5C, %l3
	stha	%i5,	[%l7 + %l3] 0x88
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x80,	%o3
	set	0x70, %i0
	stxa	%l1,	[%l7 + %i0] 0x81
	set	0x72, %i3
	stha	%i7,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x29, %o5
	stba	%g1,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f2
	set	0x28, %g3
	stwa	%g4,	[%l7 + %g3] 0x80
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%o6
	st	%fsr,	[%l7 + 0x58]
	set	0x34, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i6
	add	%i4,	%o0,	%g7
	nop
	set	0x5B, %l4
	ldsb	[%l7 + %l4],	%l2
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%l5
	nop
	set	0x0A, %l0
	stb	%l3,	[%l7 + %l0]
	nop
	set	0x32, %g5
	sth	%o7,	[%l7 + %g5]
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x80,	%g5
	set	0x38, %i7
	lda	[%l7 + %i7] 0x89,	%f12
	nop
	set	0x40, %g7
	std	%f2,	[%l7 + %g7]
	nop
	set	0x08, %o7
	sth	%g2,	[%l7 + %o7]
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%g3
	nop
	set	0x10, %l5
	stw	%o2,	[%l7 + %l5]
	set	0x48, %o4
	stda	%i6,	[%l7 + %o4] 0x89
	nop
	set	0x36, %l1
	stb	%g6,	[%l7 + %l1]
	nop
	set	0x36, %o1
	ldub	[%l7 + %o1],	%i3
	st	%f7,	[%l7 + 0x6C]
	set	0x5C, %o6
	sta	%f24,	[%l7 + %o6] 0x89
	st	%fsr,	[%l7 + 0x64]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd0
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x88,	 3
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x81,	%o4
	nop
	set	0x40, %l6
	stx	%l0,	[%l7 + %l6]
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xe2,	%i0
	and	%o1,	%i0,	%i5
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f0
	nop
	set	0x68, %g6
	stx	%o5,	[%l7 + %g6]
	or	%o3,	%i7,	%l1
	set	0x7D, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g4
	wr	%i2,	%g1,	%clear_softint
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x60, %i3
	std	%o6,	[%l7 + %i3]
	ld	[%l7 + 0x40],	%f7
	nop
	set	0x56, %i1
	ldsh	[%l7 + %i1],	%i6
	nop
	set	0x44, %o5
	lduh	[%l7 + %o5],	%i4
	nop
	set	0x60, %g3
	stx	%o0,	[%l7 + %g3]
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%l2
	fpsub32s	%f11,	%f22,	%f0
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f0
	st	%f31,	[%l7 + 0x78]
	set	0x0D, %l0
	ldstuba	[%l7 + %l0] 0x81,	%l5
	or	%g7,	%o7,	%l3
	add	%g2,	%g5,	%g3
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x89,	%f31
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x80,	%l6
	set	0x3E, %i4
	stha	%g6,	[%l7 + %i4] 0x88
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xd8
	set	0x76, %i7
	stba	%o2,	[%l7 + %i7] 0x81
	nop
	set	0x5E, %o7
	ldsh	[%l7 + %o7],	%i3
	nop
	set	0x34, %g4
	stw	%o4,	[%l7 + %g4]
	nop
	set	0x30, %l5
	std	%l0,	[%l7 + %l5]
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%l4
	set	0x46, %l1
	stha	%o1,	[%l7 + %l1] 0x80
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f0
	set	0x58, %o6
	stxa	%i0,	[%l7 + %o6] 0x89
	st	%f26,	[%l7 + 0x28]
	set	0x08, %o2
	stda	%i0,	[%l7 + %o2] 0x89
	nop
	set	0x3F, %g1
	ldstub	[%l7 + %g1],	%i5
	nop
	set	0x20, %i6
	swap	[%l7 + %i6],	%o3
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%o4
	set	0x22, %l6
	stha	%l1,	[%l7 + %l6] 0xe3
	membar	#Sync
	bn,a,pt	%xcc,	loop_58
	nop
	set	0x2C, %o3
	prefetch	[%l7 + %o3],	 4
	set	0x4D, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g4
loop_58:
	or	%i7,	%i2,	%g1
	nop
	set	0x78, %g6
	std	%f22,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x6E, %i5
	ldsb	[%l7 + %i5],	%o6
	fpadd32	%f16,	%f16,	%f24
	set	0x44, %i0
	stwa	%i6,	[%l7 + %i0] 0x89
	or	%o0,	%i4,	%l5
	set	0x6C, %i1
	sta	%f6,	[%l7 + %i1] 0x81
	and	%g7,	%o7,	%l2
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f18
	wr	%g2,	%g5,	%y
	or	%l3,	%g3,	%l6
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x81,	 3
	nop
	set	0x2C, %l2
	stw	%i3,	[%l7 + %l2]
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%o4
	nop
	set	0x7A, %g3
	lduh	[%l7 + %g3],	%o2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%l0
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x30, %l4
	std	%o0,	[%l7 + %l4]
	nop
	set	0x10, %i4
	lduw	[%l7 + %i4],	%l4
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f0
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x89,	%i0
	fpsub32	%f0,	%f8,	%f6
	add	%i1,	%o3,	%i5
	set	0x1F, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o5
	nop
	set	0x36, %g4
	stb	%g4,	[%l7 + %g4]
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x81,	%i7
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x80,	%l1
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x7B, %o1
	ldstub	[%l7 + %o1],	%g1
	nop
	set	0x50, %o6
	swap	[%l7 + %o6],	%o6
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x89,	%o0
	set	0x38, %o2
	swapa	[%l7 + %o2] 0x80,	%i4
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x39, %l6
	ldsb	[%l7 + %l6],	%i6
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%l5
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x88,	%o7
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x74, %g6
	swap	[%l7 + %g6],	%l2
	nop
	set	0x4B, %i5
	stb	%g7,	[%l7 + %i5]
	bl	%xcc,	loop_59
	wr	%g2,	%g5,	%pic
	add	%g3,	%l3,	%g6
	be,a	%icc,	loop_60
loop_59:
	nop
	set	0x15, %i1
	stb	%l6,	[%l7 + %i1]
	set	0x0A, %i0
	stha	%o4,	[%l7 + %i0] 0x88
loop_60:
	nop
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x89,	%o2
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x48, %o5
	stx	%i3,	[%l7 + %o5]
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	wr	%l4,	%i0,	%set_softint
	nop
	set	0x7C, %g2
	lduw	[%l7 + %g2],	%i1
	add	%l0,	%o3,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o5
	nop
	set	0x78, %l0
	ldsh	[%l7 + %l0],	%i7
	nop
	set	0x38, %o0
	prefetch	[%l7 + %o0],	 4
	add	%l1,	%g1,	%o6
	ld	[%l7 + 0x24],	%f1
	nop
	set	0x18, %i4
	std	%i2,	[%l7 + %i4]
	nop
	set	0x30, %l4
	ldsh	[%l7 + %l4],	%o0
	add	%i6,	%i4,	%l5
	set	0x60, %g5
	stha	%o7,	[%l7 + %g5] 0x81
	nop
	set	0x73, %i7
	ldub	[%l7 + %i7],	%g7
	nop
	set	0x1B, %g7
	stb	%l2,	[%l7 + %g7]
	or	%g2,	%g5,	%g3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f16
	nop
	set	0x50, %o4
	std	%f0,	[%l7 + %o4]
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%g6
	nop
	set	0x34, %l1
	swap	[%l7 + %l1],	%l3
	wr	%o4,	%l6,	%y
	nop
	set	0x44, %o7
	ldsw	[%l7 + %o7],	%i3
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x3C, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x48, %g1
	std	%o0,	[%l7 + %g1]
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x88,	%o2
	wr	%i0,	%i1,	%set_softint
	set	0x40, %l6
	stxa	%l4,	[%l7 + %l6] 0x89
	st	%fsr,	[%l7 + 0x38]
	set	0x28, %i2
	stda	%l0,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x89,	%i5
	set	0x10, %o3
	stda	%g4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x60, %i5
	std	%o4,	[%l7 + %i5]
	set	0x44, %i1
	lda	[%l7 + %i1] 0x88,	%f15
	set	0x64, %i0
	lda	[%l7 + %i0] 0x81,	%f29
	nop
	set	0x66, %l3
	ldstub	[%l7 + %l3],	%i7
	st	%f6,	[%l7 + 0x50]
	nop
	set	0x78, %i3
	sth	%o3,	[%l7 + %i3]
	set	0x34, %l2
	lda	[%l7 + %l2] 0x88,	%f20
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%o6
	fpsub16s	%f5,	%f22,	%f11
	or	%i2,	%o0,	%l1
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x88,	%i6
	nop
	set	0x12, %o0
	lduh	[%l7 + %o0],	%i4
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x80,	%o7
	nop
	set	0x60, %g2
	std	%g6,	[%l7 + %g2]
	bgu	%icc,	loop_61
	nop
	set	0x34, %g5
	lduw	[%l7 + %g5],	%l2
	set	0x22, %l4
	ldstuba	[%l7 + %l4] 0x81,	%g2
loop_61:
	nop
	set	0x6A, %g7
	stha	%g5,	[%l7 + %g7] 0xeb
	membar	#Sync
	or	%g3,	%g6,	%l3
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x14, %g4
	ldsh	[%l7 + %g4],	%l5
	set	0x30, %o4
	lda	[%l7 + %o4] 0x81,	%f6
	add	%l6,	%o4,	%o1
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%i3
	set	0x60, %l5
	lda	[%l7 + %l5] 0x80,	%f23
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x89,	%i0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f0
	add	%o2,	%l4,	%l0
	nop
	set	0x6E, %o6
	ldsh	[%l7 + %o6],	%i1
	set	0x66, %o2
	ldstuba	[%l7 + %o2] 0x89,	%g4
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x81,	%i5
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x58, %i6
	std	%f30,	[%l7 + %i6]
	or	%i7,	%o5,	%o3
	set	0x7C, %i2
	stwa	%g1,	[%l7 + %i2] 0xeb
	membar	#Sync
	and	%i2,	%o6,	%o0
	nop
	set	0x17, %o3
	ldsb	[%l7 + %o3],	%i6
	nop
	set	0x08, %g6
	std	%l0,	[%l7 + %g6]
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x81,	%o7
	nop
	set	0x18, %i0
	std	%g6,	[%l7 + %i0]
	set	0x24, %i1
	sta	%f14,	[%l7 + %i1] 0x89
	fpadd16	%f4,	%f4,	%f4
	nop
	set	0x44, %i3
	lduh	[%l7 + %i3],	%i4
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%g2
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x81,	 1
	nop
	set	0x74, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x3C, %l0
	stwa	%l2,	[%l7 + %l0] 0x89
	fpadd16	%f28,	%f28,	%f16
	nop
	set	0x18, %g3
	ldsb	[%l7 + %g3],	%g3
	nop
	set	0x08, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%l3
	set	0x58, %g5
	stda	%l4,	[%l7 + %g5] 0x88
	nop
	set	0x4D, %o0
	ldub	[%l7 + %o0],	%l6
	nop
	set	0x48, %l4
	std	%o4,	[%l7 + %l4]
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%g6
	set	0x16, %g7
	stba	%i3,	[%l7 + %g7] 0x88
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
	add	%o2,	%l4,	%l0
	nop
	set	0x38, %l1
	lduw	[%l7 + %l1],	%i0
	nop
	set	0x08, %g4
	std	%g4,	[%l7 + %g4]
	or	%i1,	%i5,	%i7
	st	%fsr,	[%l7 + 0x70]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x08, %o7
	stwa	%g1,	[%l7 + %o7] 0x89
	set	0x44, %l5
	stba	%o6,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x3E, %o1
	stha	%o0,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%i2
	set	0x34, %g1
	sta	%f22,	[%l7 + %g1] 0x89
	nop
	set	0x62, %o6
	ldub	[%l7 + %o6],	%i6
	nop
	set	0x52, %i6
	ldsh	[%l7 + %i6],	%l1
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x89,	%o7
	set	0x28, %o3
	swapa	[%l7 + %o3] 0x88,	%g7
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xeb,	%g2
	set	0x58, %i5
	sta	%f14,	[%l7 + %i5] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%i4
	or	%l2,	%l3,	%g3
	set	0x68, %i2
	stda	%i6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x44, %i0
	sta	%f8,	[%l7 + %i0] 0x89
	nop
	set	0x0B, %i3
	stb	%l5,	[%l7 + %i3]
	wr	%g6,	%o4,	%set_softint
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x70, %l2
	stda	%o0,	[%l7 + %l2] 0x88
	nop
	set	0x5A, %i1
	lduh	[%l7 + %i1],	%o2
	nop
	set	0x08, %o5
	lduw	[%l7 + %o5],	%i3
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x89,	 3
	nop
	set	0x5A, %l0
	lduh	[%l7 + %l0],	%l4
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%i0
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x0C, %o0
	stwa	%g4,	[%l7 + %o0] 0x80
	nop
	set	0x4E, %i7
	stb	%i5,	[%l7 + %i7]
	nop
	set	0x23, %l4
	ldub	[%l7 + %l4],	%i1
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x64, %g7
	sta	%f27,	[%l7 + %g7] 0x88
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf1
	membar	#Sync
	nop
	set	0x4E, %o7
	ldsh	[%l7 + %o7],	%o5
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x80,	 3
	set	0x08, %o1
	stxa	%g1,	[%l7 + %o1] 0x88
	set	0x28, %o2
	stxa	%i7,	[%l7 + %o2] 0x81
	nop
	set	0x44, %l5
	ldstub	[%l7 + %l5],	%o6
	nop
	set	0x1C, %o6
	lduh	[%l7 + %o6],	%i2
	st	%f15,	[%l7 + 0x5C]
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%o0
	nop
	set	0x4F, %i6
	stb	%i6,	[%l7 + %i6]
	and	%o7,	%g7,	%g2
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%g4
	set	0x48, %o3
	swapa	[%l7 + %o3] 0x89,	%l1
	set	0x5C, %g6
	lda	[%l7 + %g6] 0x88,	%f30
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x80,	%i4
	nop
	set	0x5D, %i0
	ldsb	[%l7 + %i0],	%l6
	nop
	nop
	setx	0x8431D5F7D8FA0A8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1C04A8C365A0A7B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f0
	nop
	set	0x4E, %i3
	lduh	[%l7 + %i3],	%l5
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f16
	set	0x49, %i2
	stba	%g3,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x6C, %l2
	stha	%g6,	[%l7 + %l2] 0x80
	nop
	set	0x10, %o5
	lduw	[%l7 + %o5],	%o1
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xe2,	%o4
	nop
	set	0x44, %i1
	sth	%o2,	[%l7 + %i1]
	set	0x41, %i4
	ldstuba	[%l7 + %i4] 0x88,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x20, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	set	0x5C, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i5
	nop
	set	0x19, %o0
	ldsb	[%l7 + %o0],	%i0
	set	0x68, %g2
	sta	%f22,	[%l7 + %g2] 0x80
	nop
	set	0x68, %i7
	lduh	[%l7 + %i7],	%i1
	nop
	set	0x40, %l4
	sth	%o5,	[%l7 + %l4]
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%o3
	set	0x20, %g4
	stda	%i6,	[%l7 + %g4] 0x89
	nop
	set	0x57, %o7
	ldub	[%l7 + %o7],	%o6
	set	0x20, %o4
	stda	%i2,	[%l7 + %o4] 0xeb
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i6
	add	%o7,	%o0,	%g7
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x44]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%l1
	set	0x59, %o2
	stba	%g5,	[%l7 + %o2] 0x88
	nop
	set	0x08, %l5
	std	%f28,	[%l7 + %l5]
	set	0x75, %o6
	stba	%l2,	[%l7 + %o6] 0x81
	nop
	set	0x71, %g1
	ldstub	[%l7 + %g1],	%i4
	set	0x0C, %o1
	stwa	%l6,	[%l7 + %o1] 0x89
	nop
	set	0x58, %l6
	stx	%l3,	[%l7 + %l6]
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f16
	set	0x5C, %i5
	swapa	[%l7 + %i5] 0x80,	%g6
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%g3
	nop
	set	0x60, %i3
	ldsw	[%l7 + %i3],	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%i3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%l4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x350, 	%tick_cmpr
	set	0x5E, %g6
	stha	%g4,	[%l7 + %g6] 0x88
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%i0
	bne,pn	%icc,	loop_62
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x0A, %o5
	stha	%i1,	[%l7 + %o5] 0x88
loop_62:
	nop
	set	0x20, %i1
	stxa	%o5,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f0
	set	0x40, %i4
	stxa	%o3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x7C, %o0
	stw	%o6,	[%l7 + %o0]
	fpsub32	%f6,	%f10,	%f24
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g1
	nop
	set	0x70, %g5
	ldsw	[%l7 + %g5],	%i6
	or	%o7,	%i2,	%o0
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%g2
	set	0x10, %g2
	stxa	%g7,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x34, %g7
	lduw	[%l7 + %g7],	%g5
	nop
	set	0x24, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x20, %o7
	stx	%l1,	[%l7 + %o7]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f22
	set	0x24, %o4
	swapa	[%l7 + %o4] 0x81,	%i4
	set	0x14, %o2
	lda	[%l7 + %o2] 0x81,	%f21
	set	0x48, %l5
	swapa	[%l7 + %l5] 0x81,	%l6
	nop
	set	0x68, %l1
	std	%f2,	[%l7 + %l1]
	and	%l2,	%l3,	%l5
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	nop
	set	0x28, %o1
	stw	%g6,	[%l7 + %o1]
	set	0x24, %l6
	stba	%g3,	[%l7 + %l6] 0xea
	membar	#Sync
	or	%o4,	%i3,	%o2
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%l4
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%o1
	ld	[%l7 + 0x08],	%f14
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g4
	nop
	set	0x12, %i6
	ldstub	[%l7 + %i6],	%i1
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xe2,	%i0
	set	0x67, %i3
	stba	%o5,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x28, %g6
	stxa	%o3,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x60, %l3
	std	%i6,	[%l7 + %l3]
	fpadd32	%f4,	%f0,	%f24
	nop
	set	0x50, %i2
	std	%f16,	[%l7 + %i2]
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x89,	%f22
	nop
	set	0x54, %l2
	ldsh	[%l7 + %l2],	%o6
	nop
	set	0x08, %i1
	stx	%i6,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x58, %g3
	std	%g0,	[%l7 + %g3]
	nop
	set	0x08, %l0
	ldsh	[%l7 + %l0],	%i2
	nop
	set	0x14, %o0
	ldub	[%l7 + %o0],	%o0
	nop
	set	0x41, %g5
	ldub	[%l7 + %g5],	%g2
	set	0x2C, %i4
	stwa	%o7,	[%l7 + %i4] 0x88
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x6C, %g7
	stb	%g7,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%g5
	nop
	set	0x74, %l4
	stw	%l6,	[%l7 + %l4]
	nop
	set	0x4A, %g4
	lduh	[%l7 + %g4],	%l2
	nop
	set	0x3A, %o2
	ldub	[%l7 + %o2],	%l3
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f28
	set	0x6A, %l1
	stha	%l5,	[%l7 + %l1] 0x88
	set	0x70, %o4
	stha	%g3,	[%l7 + %o4] 0x88
	nop
	set	0x6A, %g1
	ldsh	[%l7 + %g1],	%g6
	set	0x08, %l6
	stba	%i3,	[%l7 + %l6] 0x81
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%o4
	nop
	set	0x2C, %o6
	lduw	[%l7 + %o6],	%o2
	set	0x60, %i5
	lda	[%l7 + %i5] 0x89,	%f19
	set	0x5A, %i6
	stha	%o1,	[%l7 + %i6] 0x89
	set	0x38, %i0
	sta	%f17,	[%l7 + %i0] 0x88
	nop
	set	0x38, %i3
	ldsh	[%l7 + %i3],	%i5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x52A, 	%tick_cmpr
	set	0x30, %g6
	stwa	%g4,	[%l7 + %g6] 0x88
	nop
	set	0x38, %o3
	stw	%i0,	[%l7 + %o3]
	wr	%i1,	%o5,	%sys_tick
	set	0x50, %l3
	swapa	[%l7 + %l3] 0x88,	%i7
	nop
	set	0x78, %o5
	std	%f10,	[%l7 + %o5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x34, %i2
	ldub	[%l7 + %i2],	%g1
	fpsub32s	%f3,	%f26,	%f30
	nop
	set	0x13, %l2
	ldsb	[%l7 + %l2],	%i6
	st	%f3,	[%l7 + 0x74]
	nop
	set	0x53, %i1
	stb	%o0,	[%l7 + %i1]
	ld	[%l7 + 0x5C],	%f24
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x81,	%i2
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%g2
	nop
	set	0x08, %o0
	std	%f4,	[%l7 + %o0]
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x89,	%g7
	set	0x30, %i4
	sta	%f22,	[%l7 + %i4] 0x81
	wr	%o7,	%l1,	%pic
	nop
	set	0x40, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x58, %g2
	stx	%g5,	[%l7 + %g2]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i4
	set	0x60, %l4
	lda	[%l7 + %l4] 0x80,	%f2
	set	0x1B, %i7
	stba	%l3,	[%l7 + %i7] 0x88
	nop
	set	0x28, %o2
	std	%f16,	[%l7 + %o2]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f0
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%l4
	nop
	set	0x4A, %l5
	ldsb	[%l7 + %l5],	%l2
	nop
	set	0x28, %g1
	lduh	[%l7 + %g1],	%g6
	nop
	set	0x20, %o4
	lduh	[%l7 + %o4],	%g3
	fpsub16s	%f0,	%f12,	%f9
	and	%o4,	%o2,	%i3
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%i5
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f16
	nop
	set	0x35, %i5
	ldsb	[%l7 + %i5],	%o1
	st	%f17,	[%l7 + 0x1C]
	set	0x60, %i6
	stxa	%l4,	[%l7 + %i6] 0x89
	set	0x74, %i3
	stha	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x80,	 2
	set	0x08, %o3
	sta	%f3,	[%l7 + %o3] 0x89
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%o5
	nop
	set	0x3C, %l3
	lduw	[%l7 + %l3],	%i7
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%o3
	nop
	set	0x18, %i2
	std	%f10,	[%l7 + %i2]
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x44, %l2
	sta	%f4,	[%l7 + %l2] 0x80
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 2
	or	%i1,	%g1,	%o6
	or	%i6,	%i2,	%o0
	set	0x14, %g3
	stwa	%g7,	[%l7 + %g3] 0x89
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x38, %i1
	ldstub	[%l7 + %i1],	%o7
	set	0x18, %g5
	sta	%f5,	[%l7 + %g5] 0x89
	set	0x41, %i4
	stba	%g2,	[%l7 + %i4] 0x81
	set	0x40, %g7
	stda	%g4,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%l6
	nop
	set	0x64, %g2
	ldsw	[%l7 + %g2],	%i4
	nop
	set	0x68, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x64, %i7
	swap	[%l7 + %i7],	%l1
	bgu,a	%xcc,	loop_63
	nop
	set	0x10, %o2
	ldsw	[%l7 + %o2],	%l5
	set	0x28, %l4
	stwa	%l2,	[%l7 + %l4] 0x81
loop_63:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%g3
	set	0x78, %l1
	stba	%o4,	[%l7 + %l1] 0x80
	set	0x2A, %l5
	stba	%o2,	[%l7 + %l5] 0x89
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g6
	nop
	set	0x16, %g1
	stb	%i5,	[%l7 + %g1]
	nop
	set	0x29, %o4
	stb	%o1,	[%l7 + %o4]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xcc
	set	0x2C, %o6
	lda	[%l7 + %o6] 0x89,	%f28
	nop
	set	0x22, %i5
	lduh	[%l7 + %i5],	%l4
	add	%g4,	%i0,	%l0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o3
	set	0x6C, %o1
	stwa	%i1,	[%l7 + %o1] 0x89
	nop
	set	0x58, %i3
	stx	%o5,	[%l7 + %i3]
	nop
	set	0x0C, %i6
	swap	[%l7 + %i6],	%o6
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xe3,	%g0
	nop
	set	0x1F, %l3
	ldstub	[%l7 + %l3],	%i6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	set	0x58, %i2
	ldxa	[%l7 + %i2] 0x88,	%i2
	set	0x78, %i0
	stda	%o0,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x80,	%g7
	wr	%o7,	%g2,	%clear_softint
	nop
	set	0x7E, %l0
	ldstub	[%l7 + %l0],	%l6
	nop
	nop
	setx	0xFE63F1F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xEA56BCF9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f15,	%f30
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i4
	nop
	set	0x2B, %g3
	stb	%l1,	[%l7 + %g3]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%l3
	bn,pt	%xcc,	loop_64
	nop
	set	0x08, %o5
	std	%l2,	[%l7 + %o5]
	set	0x40, %g5
	lda	[%l7 + %g5] 0x89,	%f25
loop_64:
	nop
	set	0x72, %i1
	ldsh	[%l7 + %i1],	%o4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%i3
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f20
	add	%g3,	%i5,	%g6
	set	0x4C, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o1
	set	0x4C, %g2
	lda	[%l7 + %g2] 0x89,	%f19
	set	0x48, %i4
	stwa	%g4,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x48, %o7
	sta	%f0,	[%l7 + %o7] 0x89
	or	%l4,	%i0,	%i7
	nop
	set	0x35, %o2
	stb	%l0,	[%l7 + %o2]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%o3
	nop
	set	0x10, %l4
	lduh	[%l7 + %l4],	%o6
	and	%g1,	%o5,	%i6
	set	0x38, %i7
	swapa	[%l7 + %i7] 0x89,	%i2
	set	0x78, %l5
	stda	%o0,	[%l7 + %l5] 0x88
	st	%f9,	[%l7 + 0x20]
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x56, %l1
	ldsh	[%l7 + %l1],	%o7
	nop
	set	0x38, %o4
	lduw	[%l7 + %o4],	%g7
	nop
	set	0x18, %l6
	std	%f6,	[%l7 + %l6]
	set	0x34, %g1
	stwa	%l6,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x18, %i5
	stb	%g2,	[%l7 + %i5]
	nop
	set	0x70, %o6
	stx	%i4,	[%l7 + %o6]
	st	%f7,	[%l7 + 0x60]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	set	0x40, %o1
	stwa	%g5,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x88,	%l5
	and	%l3,	%l1,	%l2
	st	%fsr,	[%l7 + 0x24]
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f4
	nop
	set	0x58, %i2
	prefetch	[%l7 + %i2],	 3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%g3
	set	0x50, %i0
	stda	%o2,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x20, %l2
	sth	%g6,	[%l7 + %l2]
	set	0x3C, %l0
	sta	%f18,	[%l7 + %l0] 0x81
	nop
	set	0x78, %i6
	stw	%o1,	[%l7 + %i6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%g4
	nop
	set	0x64, %o5
	lduh	[%l7 + %o5],	%l4
	nop
	set	0x0E, %g5
	ldsh	[%l7 + %g5],	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%l0
	nop
	set	0x49, %g3
	ldsb	[%l7 + %g3],	%i1
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%o3
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%o6
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%o5
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x58, %o7
	std	%f12,	[%l7 + %o7]
	nop
	set	0x3C, %g2
	ldsb	[%l7 + %g2],	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%i6
	nop
	set	0x44, %l4
	stw	%o7,	[%l7 + %l4]
	nop
	set	0x76, %o2
	ldub	[%l7 + %o2],	%g7
	or	%l6,	%g2,	%o0
	ld	[%l7 + 0x64],	%f24
	set	0x24, %l5
	stha	%g5,	[%l7 + %l5] 0x89
	set	0x26, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i4
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%f12
	nop
	set	0x18, %l1
	std	%l2,	[%l7 + %l1]
	st	%f2,	[%l7 + 0x3C]
	nop
	set	0x08, %l6
	stx	%l5,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x38, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x78, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x20, %o6
	lda	[%l7 + %o6] 0x89,	%f23
	nop
	set	0x30, %i5
	swap	[%l7 + %i5],	%l1
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	fpadd32	%f12,	%f6,	%f30
	set	0x50, %i3
	stha	%i3,	[%l7 + %i3] 0x81
	ld	[%l7 + 0x08],	%f0
	or	%o4,	%g3,	%g6
	set	0x74, %l3
	stha	%o1,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x88,	%i5
	set	0x78, %o3
	sta	%f20,	[%l7 + %o3] 0x81
	nop
	set	0x3A, %i2
	sth	%o2,	[%l7 + %i2]
	set	0x74, %i0
	stwa	%l4,	[%l7 + %i0] 0x88
	nop
	set	0x66, %l0
	ldsh	[%l7 + %l0],	%g4
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%i7
	fpsub32s	%f8,	%f11,	%f22
	set	0x28, %o5
	stxa	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%o3
	nop
	set	0x68, %i6
	lduw	[%l7 + %i6],	%o6
	fpadd16s	%f13,	%f23,	%f31
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%l0
	nop
	set	0x5A, %g3
	ldstub	[%l7 + %g3],	%g1
	nop
	set	0x59, %i1
	ldsb	[%l7 + %i1],	%o5
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%i2
	add	%i6,	%g7,	%o7
	nop
	set	0x18, %o0
	sth	%l6,	[%l7 + %o0]
	set	0x08, %i4
	stda	%g2,	[%l7 + %i4] 0x80
	and	%g5,	%i4,	%l3
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f0
	nop
	set	0x1C, %g2
	stw	%l5,	[%l7 + %g2]
	nop
	set	0x5B, %l4
	ldstub	[%l7 + %l4],	%o0
	wr	%l2,	%i3,	%y
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%g3
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f0
	nop
	set	0x23, %g4
	stb	%o4,	[%l7 + %g4]
	nop
	nop
	setx	0xD06E9EC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x289427BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f24,	%f14
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	set	0x16, %o2
	stha	%i5,	[%l7 + %o2] 0x81
	nop
	set	0x7C, %l1
	swap	[%l7 + %l1],	%o1
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x81,	 3
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%g4
	set	0x16, %o6
	stha	%l4,	[%l7 + %o6] 0x80
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i0
	nop
	set	0x3C, %o4
	lduw	[%l7 + %o4],	%i1
	nop
	set	0x18, %o1
	std	%f16,	[%l7 + %o1]
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x78, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%o6,	%l0,	%g1
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xea,	%o4
	set	0x75, %o3
	stba	%o3,	[%l7 + %o3] 0x88
	nop
	set	0x48, %i2
	ldsh	[%l7 + %i2],	%i6
	fpsub32s	%f9,	%f1,	%f0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%g7
	set	0x3C, %i0
	stwa	%l6,	[%l7 + %i0] 0x89
	nop
	set	0x60, %l2
	swap	[%l7 + %l2],	%o7
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x89,	%g4
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%g2
	ld	[%l7 + 0x3C],	%f9
	and	%l3,	%l5,	%o0
	set	0x38, %g5
	sta	%f22,	[%l7 + %g5] 0x88
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%l2
	st	%f21,	[%l7 + 0x24]
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x80,	%i3
	set	0x30, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i4
	fpsub32	%f0,	%f12,	%f2
	nop
	set	0x10, %o0
	stx	%o4,	[%l7 + %o0]
	set	0x70, %i4
	ldda	[%l7 + %i4] 0xea,	%g6
	nop
	set	0x6E, %o7
	sth	%i5,	[%l7 + %o7]
	add	%o2,	%g4,	%o1
	set	0x10, %o5
	swapa	[%l7 + %o5] 0x81,	%i7
	set	0x58, %l4
	lda	[%l7 + %l4] 0x80,	%f25
	set	0x60, %l5
	stda	%l4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x18, %g2
	ldstub	[%l7 + %g2],	%i0
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f0
	set	0x70, %o2
	stda	%o6,	[%l7 + %o2] 0xeb
	membar	#Sync
	add	%i1,	%g1,	%o5
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	nop
	set	0x7F, %g1
	ldsb	[%l7 + %g1],	%l0
	and	%o3,	%i6,	%g7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xca
	nop
	set	0x7D, %o6
	stb	%l6,	[%l7 + %o6]
	nop
	set	0x78, %g4
	stw	%i2,	[%l7 + %g4]
	set	0x3C, %o1
	stba	%o7,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x68, %o4
	stwa	%g5,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x70, %i3
	stx	%g2,	[%l7 + %i3]
	nop
	set	0x24, %l3
	stw	%l3,	[%l7 + %l3]
	nop
	set	0x28, %g6
	std	%o0,	[%l7 + %g6]
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x36, %o3
	ldsb	[%l7 + %o3],	%l2
	set	0x40, %i5
	lda	[%l7 + %i5] 0x89,	%f26
	set	0x18, %l2
	stda	%i2,	[%l7 + %l2] 0xe2
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%g3
	set	0x28, %i0
	lda	[%l7 + %i0] 0x89,	%f18
	set	0x75, %l0
	ldstuba	[%l7 + %l0] 0x81,	%l1
	set	0x26, %i6
	stha	%o4,	[%l7 + %i6] 0xe2
	membar	#Sync
	fpadd16s	%f13,	%f2,	%f3
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x81,	%g6
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x64, %g7
	sta	%f4,	[%l7 + %g7] 0x80
	set	0x08, %o0
	stxa	%i4,	[%l7 + %o0] 0x80
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%i5
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%o2
	nop
	set	0x32, %o5
	ldsh	[%l7 + %o5],	%o1
	set	0x08, %l4
	stda	%i6,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x78, %l5
	stw	%l4,	[%l7 + %l5]
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%i0
	nop
	set	0x58, %i7
	std	%f8,	[%l7 + %i7]
	nop
	set	0x21, %o2
	stb	%o6,	[%l7 + %o2]
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x4F, %g2
	ldsb	[%l7 + %g2],	%g1
	and	%o5,	%l0,	%o3
	nop
	set	0x28, %g1
	std	%i0,	[%l7 + %g1]
	nop
	set	0x17, %o6
	ldsb	[%l7 + %o6],	%i6
	set	0x2D, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g7
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i2
	wr	%o7,	%l6,	%clear_softint
	nop
	set	0x1C, %o1
	stw	%g2,	[%l7 + %o1]
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%l2
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x88,	%f11
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f2
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%g5
	nop
	set	0x58, %i5
	stw	%o0,	[%l7 + %i5]
	nop
	set	0x77, %i2
	stb	%l2,	[%l7 + %i2]
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%l5,	%g3,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%o4
	nop
	set	0x0C, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%g6
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x72, %l2
	stha	%i4,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x3D, %o0
	stb	%i5,	[%l7 + %o0]
	or	%o1,	%o2,	%l4
	nop
	set	0x69, %g7
	stb	%i7,	[%l7 + %g7]
	set	0x79, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o6
	nop
	set	0x64, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	nop
	setx	0x31EE4562,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x45E5835E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f20,	%f17
	st	%f14,	[%l7 + 0x40]
	st	%f5,	[%l7 + 0x30]
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x80,	 2
	set	0x6A, %l4
	stha	%g1,	[%l7 + %l4] 0xe3
	membar	#Sync
	fpadd32	%f18,	%f14,	%f4
	fpsub16s	%f18,	%f26,	%f21
	st	%f26,	[%l7 + 0x0C]
	nop
	set	0x60, %i4
	stx	%g4,	[%l7 + %i4]
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x80,	%l0
	or	%o3,	%i1,	%i6
	nop
	set	0x08, %o2
	stx	%o5,	[%l7 + %o2]
	nop
	set	0x2E, %l5
	lduh	[%l7 + %l5],	%i2
	add	%o7,	%g7,	%l6
	set	0x40, %g2
	lda	[%l7 + %g2] 0x81,	%f19
	nop
	set	0x70, %g1
	std	%f18,	[%l7 + %g1]
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	bne,pn	%xcc,	loop_65
	nop
	set	0x28, %l6
	stb	%l3,	[%l7 + %l6]
	st	%f28,	[%l7 + 0x64]
	or	%o0,	%l2,	%g5
loop_65:
	nop
	set	0x66, %g4
	sth	%g3,	[%l7 + %g4]
	set	0x56, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l5
	set	0x70, %l1
	stda	%i2,	[%l7 + %l1] 0x80
	set	0x58, %i3
	stxa	%o4,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x4E, %g6
	stb	%g6,	[%l7 + %g6]
	nop
	set	0x5F, %l3
	ldstub	[%l7 + %l3],	%l1
	nop
	set	0x24, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	nop
	setx	0x043D75A62C14D5C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC9681A5B145E31A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f4,	%f20
	st	%f10,	[%l7 + 0x0C]
	set	0x64, %o4
	stwa	%i5,	[%l7 + %o4] 0x80
	nop
	set	0x58, %i5
	stw	%i4,	[%l7 + %i5]
	nop
	set	0x60, %i2
	prefetch	[%l7 + %i2],	 4
	fpsub32s	%f15,	%f18,	%f9
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x89,	 1
	set	0x6C, %i6
	stwa	%o2,	[%l7 + %i6] 0x88
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f18
	st	%f14,	[%l7 + 0x28]
	nop
	set	0x40, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x3C, %g3
	ldsw	[%l7 + %g3],	%l4
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x81,	%o6
	nop
	set	0x3C, %o0
	stw	%i7,	[%l7 + %o0]
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x88,	%g1
	nop
	set	0x7C, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x10, %l4
	std	%i0,	[%l7 + %l4]
	nop
	set	0x13, %i4
	ldsb	[%l7 + %i4],	%l0
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%o3
	nop
	set	0x66, %i7
	stb	%i1,	[%l7 + %i7]
	set	0x18, %l5
	stxa	%i6,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x4C, %g2
	lduw	[%l7 + %g2],	%g4
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x81,	 3
	ba,pt	%xcc,	loop_66
	nop
	set	0x34, %o6
	lduw	[%l7 + %o6],	%o7
	set	0x48, %g1
	swapa	[%l7 + %g1] 0x81,	%g7
loop_66:
	nop
	set	0x1B, %l6
	ldub	[%l7 + %l6],	%o5
	or	%g2,	%l6,	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%o0
	wr 	%g0, 	0x7, 	%fprs
	set	0x58, %g4
	stda	%i2,	[%l7 + %g4] 0x81
	nop
	set	0x72, %o1
	ldsb	[%l7 + %o1],	%o4
	or	%g6,	%l1,	%i5
	nop
	set	0x12, %l1
	ldsh	[%l7 + %l1],	%l5
	nop
	set	0x2A, %g6
	ldsh	[%l7 + %g6],	%o1
	nop
	set	0x2C, %l3
	ldub	[%l7 + %l3],	%o2
	and	%l4,	%i4,	%o6
	nop
	set	0x0D, %o3
	ldub	[%l7 + %o3],	%g1
	be,pt	%xcc,	loop_67
	and	%i7,	%l0,	%i0
	add	%o3,	%i6,	%i1
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x89,	%i2
loop_67:
	nop
	set	0x4F, %i5
	ldsb	[%l7 + %i5],	%o7
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf0
	membar	#Sync
	nop
	set	0x78, %i2
	ldsw	[%l7 + %i2],	%g7
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%o5
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xe2,	%g4
	fpadd32s	%f17,	%f18,	%f16
	set	0x68, %i0
	sta	%f21,	[%l7 + %i0] 0x88
	nop
	set	0x67, %l2
	ldsb	[%l7 + %l2],	%g2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc4
	nop
	set	0x59, %g3
	ldstub	[%l7 + %g3],	%l6
	ld	[%l7 + 0x44],	%f28
	nop
	set	0x40, %g7
	stx	%fsr,	[%l7 + %g7]
	wr	%l2,	%o0,	%y
	set	0x70, %i1
	stxa	%l3,	[%l7 + %i1] 0x81
	set	0x46, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g5
	st	%f4,	[%l7 + 0x10]
	st	%f5,	[%l7 + 0x78]
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x80,	%g2
	nop
	set	0x40, %l4
	stx	%i3,	[%l7 + %l4]
	nop
	set	0x56, %i4
	lduh	[%l7 + %i4],	%o4
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%l1
	set	0x10, %o5
	stda	%g6,	[%l7 + %o5] 0x88
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%i5
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f26
	nop
	set	0x20, %o2
	ldsw	[%l7 + %o2],	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%o1
	set	0x30, %o6
	lda	[%l7 + %o6] 0x81,	%f2
	set	0x0C, %g1
	swapa	[%l7 + %g1] 0x81,	%l4
	set	0x28, %l6
	prefetcha	[%l7 + %l6] 0x80,	 4
	nop
	set	0x24, %o1
	prefetch	[%l7 + %o1],	 2
	add	%g1,	%i7,	%l0
	fpadd32s	%f19,	%f0,	%f23
	set	0x64, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o6
	nop
	set	0x64, %g6
	stw	%i0,	[%l7 + %g6]
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x89,	%i6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%i2
	set	0x28, %g4
	stda	%o6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x4C, %o4
	stwa	%i1,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x72, %i5
	ldub	[%l7 + %i5],	%o5
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf8
	membar	#Sync
	nop
	set	0x10, %i3
	stx	%g4,	[%l7 + %i3]
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x42, %l0
	stha	%g2,	[%l7 + %l0] 0x80
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x80,	%l6
	nop
	set	0x2C, %i0
	ldsw	[%l7 + %i0],	%l2
	nop
	set	0x75, %l2
	ldsb	[%l7 + %l2],	%g7
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x4C, %g5
	stw	%l3,	[%l7 + %g5]
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%g5
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x80,	%g3
	or	%i3,	%o0,	%l1
	nop
	set	0x28, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x78, %l4
	lduw	[%l7 + %l4],	%o4
	nop
	set	0x6E, %i4
	ldsb	[%l7 + %i4],	%g6
	fpadd32s	%f27,	%f7,	%f18
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x88,	%i5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f16
	nop
	set	0x71, %o5
	ldsb	[%l7 + %o5],	%l5
	be,pn	%icc,	loop_68
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x4B, %o2
	ldstub	[%l7 + %o2],	%o2
	st	%fsr,	[%l7 + 0x08]
loop_68:
	nop
	set	0x52, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%g1
	set	0x28, %g1
	swapa	[%l7 + %g1] 0x89,	%i7
	set	0x20, %l6
	stxa	%i4,	[%l7 + %l6] 0xe2
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%o6
	nop
	set	0x73, %o1
	ldsb	[%l7 + %o1],	%i0
	nop
	set	0x48, %l1
	stx	%o3,	[%l7 + %l1]
	set	0x7C, %g6
	stha	%i6,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x81,	%i2
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x88,	%i0
	ld	[%l7 + 0x20],	%f0
	set	0x62, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o7
	ble,a,pt	%icc,	loop_69
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%g4
	nop
	set	0x60, %o4
	stx	%g2,	[%l7 + %o4]
	add	%o5,	%l2,	%g7
loop_69:
	nop
	set	0x25, %o3
	ldub	[%l7 + %o3],	%l3
	st	%f26,	[%l7 + 0x50]
	add	%g5,	%l6,	%g3
	nop
	set	0x0C, %i2
	swap	[%l7 + %i2],	%i3
	nop
	set	0x58, %i3
	std	%o0,	[%l7 + %i3]
	add	%o4,	%g6,	%l1
	nop
	set	0x7E, %i6
	sth	%l5,	[%l7 + %i6]
	nop
	set	0x4E, %i0
	stb	%i5,	[%l7 + %i0]
	nop
	set	0x4E, %l0
	ldsh	[%l7 + %l0],	%o2
	or	%o1,	%g1,	%i7
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%i4
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x81,	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x08, %g7
	swap	[%l7 + %g7],	%i0
	nop
	set	0x4C, %g5
	ldub	[%l7 + %g5],	%o3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc4
	set	0x34, %l4
	lda	[%l7 + %l4] 0x89,	%f31
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x4E, %i7
	ldub	[%l7 + %i7],	%i6
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%i2
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%o7
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x14, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB7E, 	%tick_cmpr
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%g4
	st	%f23,	[%l7 + 0x40]
	add	%l2,	%g7,	%l3
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x89
	nop
	set	0x50, %l6
	stb	%o5,	[%l7 + %l6]
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%l6
	set	0x30, %o1
	stda	%g4,	[%l7 + %o1] 0x81
	nop
	set	0x74, %g6
	lduh	[%l7 + %g6],	%i3
	fpsub32	%f14,	%f20,	%f0
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x88,	 1
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x14, %l1
	ldsh	[%l7 + %l1],	%o4
	nop
	set	0x6C, %o6
	stw	%g6,	[%l7 + %o6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l5
	set	0x30, %i5
	stxa	%l1,	[%l7 + %i5] 0x80
	nop
	set	0x6E, %g4
	ldsb	[%l7 + %g4],	%i5
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%o0
	nop
	set	0x2B, %o3
	ldsb	[%l7 + %o3],	%g1
	fpsub16	%f16,	%f6,	%f12
	nop
	set	0x38, %i3
	stx	%o2,	[%l7 + %i3]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f0
	nop
	set	0x4E, %i6
	ldub	[%l7 + %i6],	%i7
	set	0x3A, %l0
	stha	%l4,	[%l7 + %l0] 0x89
	nop
	set	0x0C, %i0
	stw	%o6,	[%l7 + %i0]
	ld	[%l7 + 0x10],	%f26
	set	0x7C, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l0
	set	0x54, %g3
	sta	%f13,	[%l7 + %g3] 0x80
	nop
	set	0x28, %g5
	lduh	[%l7 + %g5],	%i0
	set	0x64, %i1
	stwa	%i4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x78, %l4
	stx	%i6,	[%l7 + %l4]
	nop
	set	0x5C, %o0
	swap	[%l7 + %o0],	%o3
	nop
	set	0x1C, %g7
	ldstub	[%l7 + %g7],	%o7
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x80,	%i2
	set	0x1B, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i1
	ld	[%l7 + 0x78],	%f6
	nop
	set	0x70, %i7
	stx	%g4,	[%l7 + %i7]
	ld	[%l7 + 0x58],	%f14
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%g2
	nop
	set	0x6C, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x4F, %g2
	ldub	[%l7 + %g2],	%l2
	nop
	set	0x0F, %l5
	ldub	[%l7 + %l5],	%g7
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f0
	set	0x10, %g1
	sta	%f28,	[%l7 + %g1] 0x81
	and	%o5,	%l3,	%l6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f16
	set	0x39, %o1
	stba	%g5,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x30, %l1
	ldxa	[%l7 + %l1] 0x88,	%o0
	and	%i3,	%o4,	%g6
	or	%l5,	%l1,	%i5
	set	0x38, %o6
	stda	%o0,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x18, %i5
	ldsh	[%l7 + %i5],	%g3
	nop
	set	0x2F, %g4
	stb	%o2,	[%l7 + %g4]
	ld	[%l7 + 0x3C],	%f12
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x50, %o3
	stxa	%i7,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%l4,	%o6,	%g1
	ld	[%l7 + 0x7C],	%f18
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l0
	nop
	set	0x18, %i2
	ldx	[%l7 + %i2],	%i4
	nop
	set	0x28, %i6
	swap	[%l7 + %i6],	%i0
	bn,a	%xcc,	loop_70
	nop
	nop
	setx	0xF95F0622,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x3681D7A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f26,	%f3
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%o2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f16
loop_70:
	st	%f11,	[%l7 + 0x08]
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x88,	 3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%i1
	fpadd16s	%f14,	%f29,	%f26
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%g4
	set	0x38, %i1
	stda	%g2,	[%l7 + %i1] 0x88
	nop
	set	0x44, %l4
	lduh	[%l7 + %l4],	%i6
	set	0x70, %o0
	stxa	%l2,	[%l7 + %o0] 0x88
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%g7
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x81
	set	0x28, %o5
	sta	%f17,	[%l7 + %o5] 0x88
	and	%l3,	%l6,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%i3
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf0
	membar	#Sync
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%o5
	st	%fsr,	[%l7 + 0x28]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f16
	nop
	set	0x28, %g2
	ldsw	[%l7 + %g2],	%o4
	set	0x40, %l5
	sta	%f5,	[%l7 + %l5] 0x88
	nop
	set	0x10, %i7
	lduw	[%l7 + %i7],	%g6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xda
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x80,	%l1
	nop
	set	0x48, %l6
	stw	%l5,	[%l7 + %l6]
	set	0x44, %o1
	sta	%f11,	[%l7 + %o1] 0x81
	set	0x66, %o6
	stha	%o1,	[%l7 + %o6] 0x89
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x68, %g4
	stx	%o2,	[%l7 + %g4]
	nop
	set	0x38, %i5
	lduw	[%l7 + %i5],	%g3
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x30, %l3
	stb	%l4,	[%l7 + %l3]
	wr	%i7,	%g1,	%set_softint
	set	0x52, %o4
	stha	%l0,	[%l7 + %o4] 0x89
	st	%f27,	[%l7 + 0x38]
	nop
	set	0x40, %o3
	std	%o6,	[%l7 + %o3]
	nop
	set	0x70, %i2
	ldsw	[%l7 + %i2],	%i4
	nop
	set	0x3C, %i3
	stb	%i0,	[%l7 + %i3]
	nop
	set	0x47, %l0
	ldstub	[%l7 + %l0],	%o7
	set	0x60, %i6
	stwa	%i2,	[%l7 + %i6] 0x89
	nop
	nop
	setx	0xFF6803D5EF2C22F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA9D0A9B0D79EA8EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f26,	%f26
	set	0x0B, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i1
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x89,	%g4
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f12
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	set	0x48, %i1
	stda	%o2,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x40, %o0
	std	%f22,	[%l7 + %o0]
	fpadd16	%f26,	%f24,	%f14
	set	0x37, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i6
	nop
	set	0x62, %o5
	lduh	[%l7 + %o5],	%l2
	nop
	set	0x51, %o7
	ldstub	[%l7 + %o7],	%g7
	set	0x50, %g5
	stxa	%l6,	[%l7 + %g5] 0x80
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x88,	 2
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x80,	 0
	set	0x40, %l5
	swapa	[%l7 + %l5] 0x88,	%o0
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x89,	%o5
	set	0x72, %i7
	stha	%i3,	[%l7 + %i7] 0xe2
	membar	#Sync
	or	%g6,	%o4,	%l1
	nop
	set	0x78, %g1
	ldstub	[%l7 + %g1],	%o1
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	set	0x60, %g6
	swapa	[%l7 + %g6] 0x89,	%o2
	or	%i5,	%l4,	%g3
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
	set	0x20, %l1
	stda	%l0,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x25, %g4
	ldsb	[%l7 + %g4],	%o6
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%g1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1261
!	Type a   	: 30
!	Type cti   	: 17
!	Type x   	: 537
!	Type f   	: 43
!	Type i   	: 112
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
	set	0xD,	%g1
	set	0x0,	%g2
	set	0xF,	%g3
	set	0xB,	%g4
	set	0x3,	%g5
	set	0x6,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xF,	%i1
	set	-0x2,	%i2
	set	-0x8,	%i3
	set	-0xA,	%i4
	set	-0x1,	%i5
	set	-0xC,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x7035CD2D,	%l0
	set	0x705CA16D,	%l1
	set	0x6B0B8B4B,	%l2
	set	0x1CAE48C0,	%l3
	set	0x6BECAB2D,	%l4
	set	0x2EF24CE0,	%l5
	set	0x499FAE51,	%l6
	!# Output registers
	set	0x0157,	%o0
	set	0x0F40,	%o1
	set	0x18AE,	%o2
	set	0x1994,	%o3
	set	-0x1DAB,	%o4
	set	-0x114F,	%o5
	set	-0x1953,	%o6
	set	0x0DD9,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	ld	[%l7 + 0x54],	%f8
	st	%f7,	[%l7 + 0x48]
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x28, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x7C, %l3
	stw	%i0,	[%l7 + %l3]
	nop
	set	0x44, %o3
	ldsh	[%l7 + %o3],	%o7
	or	%i2,	%i4,	%g4
	add	%i1,	%g2,	%o3
	set	0x25, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i6
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x81,	%g7
	set	0x18, %l0
	lda	[%l7 + %l0] 0x89,	%f27
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f0
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	st	%f20,	[%l7 + 0x40]
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x81,	%g5
	nop
	set	0x10, %l4
	stx	%o0,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x58, %o0
	swap	[%l7 + %o0],	%o5
	nop
	set	0x78, %g7
	stx	%i3,	[%l7 + %g7]
	bleu,pn	%xcc,	loop_71
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%l3
	ld	[%l7 + 0x10],	%f25
	ld	[%l7 + 0x68],	%f19
loop_71:
	nop
	set	0x50, %o7
	sta	%f0,	[%l7 + %o7] 0x88
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xeb,	%g6
	fpadd16	%f24,	%f18,	%f8
	ld	[%l7 + 0x6C],	%f11
	add	%o4,	%o1,	%l5
	nop
	set	0x30, %i4
	std	%f2,	[%l7 + %i4]
	set	0x14, %g3
	stwa	%l1,	[%l7 + %g3] 0x80
	set	0x0C, %g2
	swapa	[%l7 + %g2] 0x80,	%o2
	nop
	set	0x78, %o2
	std	%f16,	[%l7 + %o2]
	ld	[%l7 + 0x58],	%f14
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x24, %i7
	stba	%i5,	[%l7 + %i7] 0x88
	add	%l0,	%i7,	%g1
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%i0
	set	0x47, %l6
	stba	%o6,	[%l7 + %l6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x10],	%f26
	and	%i2,	%i4,	%g4
	nop
	set	0x34, %g1
	lduw	[%l7 + %g1],	%i1
	and	%g2,	%o3,	%o7
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%i6
	nop
	set	0x68, %g6
	stx	%g7,	[%l7 + %g6]
	nop
	set	0x68, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x1D, %o1
	stb	%l6,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x4C]
	set	0x62, %l1
	stha	%l2,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x78, %i5
	stda	%o0,	[%l7 + %i5] 0x80
	and	%o5,	%g5,	%i3
	nop
	set	0x74, %l3
	ldsw	[%l7 + %l3],	%l3
	or	%o4,	%o1,	%l5
	nop
	set	0x34, %o3
	lduh	[%l7 + %o3],	%g6
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x28, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x14, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%l0
	set	0x2F, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l4
	ld	[%l7 + 0x70],	%f12
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f0
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x88,	%o2
	nop
	set	0x0A, %i1
	lduh	[%l7 + %i1],	%g3
	nop
	set	0x5A, %o0
	sth	%l0,	[%l7 + %o0]
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%i5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i0
	nop
	set	0x10, %l4
	stx	%i7,	[%l7 + %l4]
	nop
	set	0x52, %o7
	sth	%i2,	[%l7 + %o7]
	nop
	set	0x45, %o5
	ldstub	[%l7 + %o5],	%o6
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%g4
	and	%i1,	%g2,	%o3
	st	%f14,	[%l7 + 0x28]
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xeb,	%o6
	nop
	set	0x20, %g2
	swap	[%l7 + %g2],	%i6
	nop
	set	0x13, %o2
	ldsb	[%l7 + %o2],	%g7
	set	0x30, %i7
	stda	%i6,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x0C, %g3
	sta	%f28,	[%l7 + %g3] 0x80
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f0
	set	0x6E, %l5
	stba	%i4,	[%l7 + %l5] 0x81
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%o0
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f8
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f28
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x88,	%l2
	nop
	set	0x44, %o1
	lduw	[%l7 + %o1],	%g5
	set	0x28, %i5
	stda	%i2,	[%l7 + %i5] 0x89
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f12
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x72, %o3
	stba	%l3,	[%l7 + %o3] 0xeb
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%o1
	st	%f19,	[%l7 + 0x64]
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x70, %l0
	stha	%l5,	[%l7 + %l0] 0x81
	set	0x28, %i6
	stba	%o5,	[%l7 + %i6] 0x81
	add	%g6,	%l1,	%o2
	set	0x6F, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g3
	set	0x30, %i2
	stda	%l4,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x28, %i3
	std	%f4,	[%l7 + %i3]
	set	0x08, %i1
	stha	%i5,	[%l7 + %i1] 0x80
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f14
	st	%f22,	[%l7 + 0x7C]
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%g0
	nop
	set	0x40, %l2
	ldx	[%l7 + %l2],	%i0
	set	0x78, %o7
	lda	[%l7 + %o7] 0x88,	%f5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xcc
	nop
	set	0x58, %l4
	std	%f20,	[%l7 + %l4]
	set	0x38, %g5
	stba	%l0,	[%l7 + %g5] 0x89
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x88
	ld	[%l7 + 0x64],	%f1
	set	0x60, %o2
	sta	%f8,	[%l7 + %o2] 0x80
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x0C, %g3
	stwa	%i7,	[%l7 + %g3] 0x88
	add	%i2,	%g4,	%o6
	nop
	set	0x78, %i7
	stw	%i1,	[%l7 + %i7]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%o7
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x80,	%o3
	set	0x48, %l6
	lda	[%l7 + %l6] 0x88,	%f14
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%g6
	nop
	set	0x34, %g6
	swap	[%l7 + %g6],	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%o0
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%l2
	set	0x50, %i5
	stda	%i6,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x0A, %l3
	sth	%i3,	[%l7 + %l3]
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%l2
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x4E, %o3
	sth	%g5,	[%l7 + %o3]
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f28
	set	0x55, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o4
	set	0x48, %i6
	stxa	%l5,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x34, %i0
	swapa	[%l7 + %i0] 0x81,	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%g6
	fpadd16	%f20,	%f20,	%f18
	set	0x4C, %l0
	lda	[%l7 + %l0] 0x80,	%f14
	set	0x50, %i3
	lda	[%l7 + %i3] 0x89,	%f25
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g3
	nop
	set	0x08, %i2
	std	%l0,	[%l7 + %i2]
	set	0x40, %o0
	stxa	%i5,	[%l7 + %o0] 0xe3
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%i0
	set	0x34, %i1
	sta	%f16,	[%l7 + %i1] 0x81
	and	%g1,	%i7,	%i2
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x88,	%g4
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x81,	 2
	set	0x60, %o5
	sta	%f31,	[%l7 + %o5] 0x80
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd0,	%f0
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%i1
	set	0x74, %i4
	stha	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	st	%f5,	[%l7 + 0x20]
	nop
	set	0x56, %l4
	ldsh	[%l7 + %l4],	%g2
	nop
	set	0x68, %o2
	stx	%o3,	[%l7 + %o2]
	nop
	set	0x6A, %g2
	ldsh	[%l7 + %g2],	%o7
	st	%f12,	[%l7 + 0x08]
	set	0x20, %g3
	stwa	%g7,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x18, %l5
	stwa	%i6,	[%l7 + %l5] 0x80
	nop
	set	0x38, %i7
	swap	[%l7 + %i7],	%o0
	nop
	set	0x46, %l6
	ldsh	[%l7 + %l6],	%l2
	and	%l6,	%i3,	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g5
	nop
	set	0x74, %g4
	sth	%l5,	[%l7 + %g4]
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%o4
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x88,	%o1
	set	0x3C, %i5
	stwa	%g6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x60, %o6
	std	%o2,	[%l7 + %o6]
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f28
	set	0x40, %l3
	lda	[%l7 + %l3] 0x81,	%f27
	set	0x20, %o1
	stda	%g2,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%o5,	%l1,	%l4
	set	0x5F, %o3
	stba	%i5,	[%l7 + %o3] 0x81
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 1
	fpadd16s	%f17,	%f10,	%f8
	nop
	set	0x64, %l0
	stw	%i0,	[%l7 + %l0]
	nop
	nop
	setx	0x4094AB81465BB018,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE1641D9DDEE64A6D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f6,	%f26
	st	%f25,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x70]
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x80,	 0
	nop
	set	0x0C, %i6
	prefetch	[%l7 + %i6],	 4
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%i2
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f2
	nop
	set	0x66, %l2
	ldsh	[%l7 + %l2],	%o6
	nop
	set	0x08, %i1
	std	%g4,	[%l7 + %i1]
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	set	0x58, %g7
	stwa	%l0,	[%l7 + %g7] 0x81
	nop
	set	0x65, %o7
	ldstub	[%l7 + %o7],	%o3
	bne	%xcc,	loop_72
	st	%f2,	[%l7 + 0x7C]
	nop
	set	0x5C, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f28
loop_72:
	nop
	set	0x1C, %i4
	stw	%g2,	[%l7 + %i4]
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x89,	%o7
	set	0x10, %o2
	sta	%f20,	[%l7 + %o2] 0x88
	st	%f20,	[%l7 + 0x68]
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	nop
	set	0x34, %i7
	ldsw	[%l7 + %i7],	%i6
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	and	%g7,	%o0,	%l6
	set	0x6C, %g4
	swapa	[%l7 + %g4] 0x81,	%i3
	nop
	set	0x30, %l6
	stx	%l2,	[%l7 + %l6]
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x89,	%i4
	or	%l3,	%l5,	%o4
	nop
	set	0x7C, %o6
	swap	[%l7 + %o6],	%o1
	add	%g5,	%g6,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%o5
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x81,	%l1
	set	0x38, %i5
	swapa	[%l7 + %i5] 0x80,	%l4
	nop
	set	0x54, %o1
	sth	%i5,	[%l7 + %o1]
	add	%i0,	%i7,	%i2
	set	0x20, %o3
	sta	%f28,	[%l7 + %o3] 0x80
	set	0x08, %o4
	sta	%f17,	[%l7 + %o4] 0x89
	set	0x26, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g1
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%g4
	set	0x39, %i0
	stba	%o6,	[%l7 + %i0] 0xeb
	membar	#Sync
	add	%l0,	%i1,	%o3
	set	0x10, %i3
	stxa	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xca
	ld	[%l7 + 0x2C],	%f25
	ld	[%l7 + 0x68],	%f25
	nop
	set	0x24, %i2
	ldsw	[%l7 + %i2],	%o7
	nop
	set	0x68, %i6
	lduw	[%l7 + %i6],	%i6
	st	%f28,	[%l7 + 0x74]
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x80,	%o0
	st	%fsr,	[%l7 + 0x14]
	set	0x58, %o5
	stda	%i6,	[%l7 + %o5] 0xe3
	membar	#Sync
	bne,pt	%icc,	loop_73
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%i3
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x88,	%l2
loop_73:
	nop
	set	0x18, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x6D, %i4
	ldstub	[%l7 + %i4],	%g7
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%l2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%o4
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f0
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%g6
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x38, %o2
	stx	%i4,	[%l7 + %o2]
	nop
	set	0x4E, %g3
	sth	%o2,	[%l7 + %g3]
	set	0x18, %l6
	stxa	%o5,	[%l7 + %l6] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%i0
	set	0x38, %g4
	sta	%f4,	[%l7 + %g4] 0x80
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc4
	st	%fsr,	[%l7 + 0x78]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%i7
	nop
	set	0x4E, %l1
	lduh	[%l7 + %l1],	%i2
	nop
	set	0x14, %o6
	swap	[%l7 + %o6],	%g1
	nop
	set	0x51, %o1
	ldstub	[%l7 + %o1],	%g3
	or	%g4,	%l0,	%i1
	set	0x30, %i5
	lda	[%l7 + %i5] 0x89,	%f31
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%o2
	and	%g2,	%o7,	%o6
	set	0x78, %o4
	lda	[%l7 + %o4] 0x80,	%f19
	set	0x2C, %l0
	stha	%i6,	[%l7 + %l0] 0x80
	nop
	set	0x18, %l3
	stx	%o0,	[%l7 + %l3]
	and	%i3,	%l6,	%l2
	nop
	set	0x08, %i3
	std	%g6,	[%l7 + %i3]
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xeb,	%l4
	add	%l3,	%o4,	%o1
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	fpsub16s	%f30,	%f29,	%f28
	set	0x70, %i6
	lda	[%l7 + %i6] 0x80,	%f1
	or	%g6,	%i4,	%o5
	nop
	set	0x54, %o0
	ldsh	[%l7 + %o0],	%l1
	nop
	set	0x4A, %i1
	ldub	[%l7 + %i1],	%o2
	or	%i5,	%i0,	%l4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f0
	nop
	set	0x46, %o7
	ldsh	[%l7 + %o7],	%i7
	nop
	set	0x78, %g5
	stx	%g1,	[%l7 + %g5]
	set	0x1C, %l4
	sta	%f14,	[%l7 + %l4] 0x81
	and	%i2,	%g4,	%g3
	nop
	set	0x4B, %l2
	ldstub	[%l7 + %l2],	%i1
	ld	[%l7 + 0x2C],	%f21
	set	0x18, %i4
	stda	%l0,	[%l7 + %i4] 0x88
	set	0x37, %g2
	stba	%o3,	[%l7 + %g2] 0x81
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f20
	nop
	set	0x20, %i7
	stw	%g2,	[%l7 + %i7]
	st	%f19,	[%l7 + 0x48]
	nop
	set	0x50, %g7
	stw	%o7,	[%l7 + %g7]
	and	%i6,	%o6,	%o0
	ld	[%l7 + 0x54],	%f10
	set	0x28, %g3
	stxa	%l6,	[%l7 + %g3] 0x80
	nop
	set	0x50, %o2
	std	%i2,	[%l7 + %o2]
	add	%l2,	%l5,	%g7
	nop
	set	0x28, %g4
	stx	%l3,	[%l7 + %g4]
	nop
	set	0x14, %l6
	stb	%o4,	[%l7 + %l6]
	bl,a,pt	%icc,	loop_74
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f4
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%g4
	st	%fsr,	[%l7 + 0x7C]
loop_74:
	nop
	set	0x4C, %g1
	stba	%o1,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x34, %o1
	stwa	%i4,	[%l7 + %o1] 0x88
	or	%o5,	%g6,	%l1
	or	%o2,	%i0,	%l4
	set	0x70, %o6
	lda	[%l7 + %o6] 0x89,	%f7
	nop
	set	0x0E, %i5
	ldsh	[%l7 + %i5],	%i7
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x89,	%i5
	nop
	set	0x3A, %l0
	ldsh	[%l7 + %l0],	%i2
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x80,	%g1
	set	0x08, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%g3
	or	%l0,	%o3,	%g2
	nop
	set	0x54, %i0
	swap	[%l7 + %i0],	%i6
	bn,a,pt	%icc,	loop_75
	nop
	set	0x60, %o4
	stw	%o7,	[%l7 + %o4]
	wr	%o0,	%o6,	%set_softint
	nop
	set	0x28, %i2
	std	%i6,	[%l7 + %i2]
loop_75:
	nop
	set	0x36, %o0
	ldsh	[%l7 + %o0],	%l2
	nop
	set	0x3E, %i1
	stb	%l5,	[%l7 + %i1]
	nop
	set	0x34, %o5
	lduh	[%l7 + %o5],	%i3
	nop
	set	0x58, %o7
	std	%l2,	[%l7 + %o7]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%g5
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f16
	nop
	set	0x7C, %l4
	lduh	[%l7 + %l4],	%o1
	nop
	set	0x40, %l2
	stx	%i4,	[%l7 + %l2]
	nop
	set	0x50, %g5
	ldsw	[%l7 + %g5],	%o5
	nop
	set	0x2E, %g2
	ldstub	[%l7 + %g2],	%g6
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%g7
	set	0x3D, %i7
	stba	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x22, %i4
	stha	%i0,	[%l7 + %i4] 0xe2
	membar	#Sync
	ld	[%l7 + 0x74],	%f28
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x89,	%l0
	and	%l4,	%i7,	%i5
	nop
	set	0x24, %o2
	stw	%g1,	[%l7 + %o2]
	nop
	set	0x50, %g4
	lduh	[%l7 + %g4],	%g4
	fpadd16s	%f24,	%f18,	%f8
	nop
	set	0x64, %g7
	prefetch	[%l7 + %g7],	 1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x28, %g6
	stx	%i2,	[%l7 + %g6]
	nop
	set	0x38, %l6
	ldsb	[%l7 + %l6],	%i1
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe3,	%g2
	add	%l0,	%g2,	%o3
	nop
	set	0x2C, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x48, %o6
	std	%o6,	[%l7 + %o6]
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x89,	 2
	nop
	set	0x2C, %o3
	swap	[%l7 + %o3],	%o6
	set	0x0B, %i5
	stba	%l6,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%l5
	nop
	set	0x74, %l0
	lduw	[%l7 + %l0],	%i3
	set	0x54, %i3
	swapa	[%l7 + %i3] 0x80,	%l3
	nop
	set	0x79, %o4
	ldsb	[%l7 + %o4],	%o4
	set	0x24, %i2
	sta	%f14,	[%l7 + %i2] 0x89
	set	0x08, %o0
	stwa	%o1,	[%l7 + %o0] 0x89
	nop
	set	0x5C, %i0
	ldsw	[%l7 + %i0],	%i4
	set	0x1E, %o5
	stha	%g5,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x10, %o7
	sth	%o5,	[%l7 + %o7]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xeb,	%g6
	ba,a	%icc,	loop_76
	nop
	set	0x28, %l4
	stx	%g7,	[%l7 + %l4]
	nop
	set	0x0C, %l2
	lduh	[%l7 + %l2],	%i0
	nop
	set	0x10, %i6
	std	%o2,	[%l7 + %i6]
loop_76:
	bgu,pn	%xcc,	loop_77
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%l0
	fpsub32	%f16,	%f30,	%f22
	wr	%l4,	%i5,	%clear_softint
loop_77:
	nop
	set	0x56, %g2
	lduh	[%l7 + %g2],	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%i2
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f30
	or	%g3,	%l0,	%g2
	or	%o7,	%i6,	%o6
	nop
	set	0x31, %i4
	ldstub	[%l7 + %i4],	%l6
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x81,	%o3
	set	0x44, %o2
	stha	%l2,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x20, %g3
	stha	%o0,	[%l7 + %g3] 0x89
	set	0x5C, %g4
	swapa	[%l7 + %g4] 0x88,	%i3
	nop
	set	0x79, %g7
	ldstub	[%l7 + %g7],	%l5
	set	0x44, %g6
	lda	[%l7 + %g6] 0x80,	%f11
	nop
	set	0x30, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x7C, %g1
	sth	%l3,	[%l7 + %g1]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%o1
	and	%i4,	%o5,	%g6
	nop
	set	0x68, %o1
	std	%g4,	[%l7 + %o1]
	nop
	set	0x0A, %o6
	ldsh	[%l7 + %o6],	%g7
	fpsub32s	%f15,	%f13,	%f11
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%l1
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%l4
	nop
	set	0x18, %i5
	stx	%i0,	[%l7 + %i5]
	nop
	set	0x10, %l1
	std	%f6,	[%l7 + %l1]
	nop
	set	0x61, %l3
	ldstub	[%l7 + %l3],	%g1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i7
	fpadd16s	%f8,	%f2,	%f29
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f8
	nop
	set	0x4A, %o4
	ldstub	[%l7 + %o4],	%i5
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe2,	%i0
	nop
	set	0x08, %i3
	ldsh	[%l7 + %i3],	%i2
	set	0x43, %i0
	stba	%l0,	[%l7 + %i0] 0x80
	st	%fsr,	[%l7 + 0x28]
	st	%f17,	[%l7 + 0x78]
	nop
	set	0x30, %o5
	std	%g2,	[%l7 + %o5]
	st	%f11,	[%l7 + 0x18]
	nop
	set	0x76, %o0
	ldub	[%l7 + %o0],	%g2
	nop
	set	0x08, %i1
	stx	%i6,	[%l7 + %i1]
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%o6
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%o3
	nop
	set	0x4C, %l4
	swap	[%l7 + %l4],	%l6
	set	0x38, %i6
	stxa	%o0,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x48, %g2
	stxa	%l2,	[%l7 + %g2] 0x89
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x10, %i4
	stx	%fsr,	[%l7 + %i4]
	bleu	%icc,	loop_78
	nop
	set	0x08, %i7
	swap	[%l7 + %i7],	%l5
	and	%i3,	%o4,	%o1
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x81
loop_78:
	nop
	set	0x33, %g3
	ldstuba	[%l7 + %g3] 0x80,	%i4
	or	%o5,	%l3,	%g5
	nop
	set	0x58, %g4
	ldx	[%l7 + %g4],	%g7
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x88,	%o2
	ld	[%l7 + 0x78],	%f30
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x0E, %g7
	stb	%l1,	[%l7 + %g7]
	set	0x1C, %g1
	stwa	%l4,	[%l7 + %g1] 0xe2
	membar	#Sync
	be,a	%xcc,	loop_79
	nop
	set	0x0E, %l6
	ldub	[%l7 + %l6],	%i0
	nop
	set	0x10, %o1
	std	%f22,	[%l7 + %o1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%g4
loop_79:
	bleu	%xcc,	loop_80
	nop
	set	0x28, %o6
	std	%f18,	[%l7 + %o6]
	nop
	set	0x36, %o3
	lduh	[%l7 + %o3],	%i7
	fpsub16s	%f10,	%f11,	%f9
loop_80:
	nop
	set	0x6C, %l1
	ldsw	[%l7 + %l1],	%i5
	set	0x24, %l3
	stwa	%g1,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x81,	%i2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%l0
	set	0x08, %l0
	sta	%f31,	[%l7 + %l0] 0x80
	nop
	set	0x73, %o4
	stb	%g2,	[%l7 + %o4]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%g3
	nop
	set	0x5A, %i2
	lduh	[%l7 + %i2],	%o7
	and	%o3,	%o6,	%o0
	set	0x18, %i0
	stxa	%l2,	[%l7 + %i0] 0x89
	set	0x38, %o5
	lda	[%l7 + %o5] 0x88,	%f9
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i3
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x80,	%l5
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%o4
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x89,	%o1
	nop
	set	0x20, %i6
	ldsw	[%l7 + %i6],	%o5
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%i4
	add	%g5,	%g7,	%l3
	set	0x08, %g5
	stxa	%o2,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x34, %g2
	stha	%l4,	[%l7 + %g2] 0x80
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf0
	membar	#Sync
	set	0x10, %l2
	stda	%l0,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x08, %o2
	stxa	%i0,	[%l7 + %o2] 0x88
	fpadd32s	%f25,	%f26,	%f6
	set	0x40, %i7
	stxa	%g4,	[%l7 + %i7] 0x88
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xe3,	%g6
	set	0x38, %l5
	stxa	%i5,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x71, %g6
	stba	%i7,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x0E, %g3
	sth	%g1,	[%l7 + %g3]
	nop
	set	0x38, %g1
	std	%i2,	[%l7 + %g1]
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xea,	%l0
	and	%g2,	%i6,	%g3
	wr	%o7,	%o3,	%softint
	nop
	set	0x40, %g7
	std	%f14,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f16
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%o0
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%l2
	wr	%o6,	%i3,	%sys_tick
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x28, %l1
	ldsw	[%l7 + %l1],	%l6
	set	0x60, %l3
	stha	%o4,	[%l7 + %l3] 0xe2
	membar	#Sync
	fpsub16	%f28,	%f0,	%f22
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x55, %l0
	ldub	[%l7 + %l0],	%o1
	set	0x50, %i5
	stxa	%l5,	[%l7 + %i5] 0xea
	membar	#Sync
	bne	%xcc,	loop_81
	nop
	set	0x54, %o4
	sth	%i4,	[%l7 + %o4]
	or	%o5,	%g5,	%g7
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%o2
loop_81:
	nop
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x81,	%l3
	set	0x08, %i0
	stwa	%l4,	[%l7 + %i0] 0x80
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%l0
	nop
	nop
	setx	0xD4FEDC2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x1AD281EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f16,	%f13
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%i0
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x89,	%g6
	nop
	set	0x32, %o7
	ldub	[%l7 + %o7],	%g4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%g1
	fpsub16s	%f31,	%f2,	%f12
	st	%f3,	[%l7 + 0x68]
	set	0x14, %l4
	lda	[%l7 + %l4] 0x80,	%f8
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%i2
	nop
	set	0x37, %g2
	ldsb	[%l7 + %g2],	%i5
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%l0
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x7A, %i4
	ldstub	[%l7 + %i4],	%g2
	nop
	set	0x2C, %l2
	ldsb	[%l7 + %l2],	%g3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%o3
	or	%i1,	%o0,	%o7
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x81,	%o6
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%l2
	nop
	set	0x23, %l5
	ldstub	[%l7 + %l5],	%i3
	add	%o4,	%o1,	%l5
	set	0x54, %g6
	sta	%f15,	[%l7 + %g6] 0x81
	ld	[%l7 + 0x4C],	%f21
	add	%i4,	%o5,	%g5
	nop
	set	0x18, %o2
	std	%f18,	[%l7 + %o2]
	nop
	set	0x20, %g1
	sth	%g7,	[%l7 + %g1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l3
	set	0x40, %g3
	stwa	%o2,	[%l7 + %g3] 0x80
	set	0x08, %g7
	lda	[%l7 + %g7] 0x88,	%f30
	set	0x60, %l6
	stxa	%l4,	[%l7 + %l6] 0x80
	fpsub16	%f8,	%f14,	%f24
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xe3,	%l0
	nop
	set	0x34, %l1
	sth	%g6,	[%l7 + %l1]
	nop
	set	0x38, %o1
	stw	%g4,	[%l7 + %o1]
	st	%f24,	[%l7 + 0x4C]
	wr	%i0,	%i7,	%ccr
	set	0x30, %o3
	stxa	%i2,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x3C, %l0
	stw	%g1,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x44, %i5
	sth	%l0,	[%l7 + %i5]
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%i5
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%g2
	set	0x18, %o5
	sta	%f7,	[%l7 + %o5] 0x80
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f22
	nop
	set	0x4D, %i3
	stb	%g3,	[%l7 + %i3]
	set	0x48, %i1
	sta	%f24,	[%l7 + %i1] 0x89
	add	%i6,	%i1,	%o0
	set	0x39, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o7
	nop
	set	0x10, %o7
	std	%o2,	[%l7 + %o7]
	nop
	set	0x14, %l4
	ldsh	[%l7 + %l4],	%l2
	set	0x34, %o0
	lda	[%l7 + %o0] 0x89,	%f15
	st	%f24,	[%l7 + 0x74]
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%o6
	or	%i3,	%o1,	%l5
	and	%o4,	%o5,	%g5
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x88,	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l3
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x89,	%g7
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f28
	and	%o2,	%l1,	%l4
	nop
	set	0x1C, %i7
	stw	%g6,	[%l7 + %i7]
	set	0x78, %g4
	stxa	%g4,	[%l7 + %g4] 0x89
	set	0x0C, %l5
	stwa	%i7,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x20, %l2
	std	%i0,	[%l7 + %l2]
	st	%f9,	[%l7 + 0x14]
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xeb,	%g0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f0
	and	%l0,	%i2,	%i5
	wr	%g3,	%i6,	%softint
	set	0x34, %g7
	lda	[%l7 + %g7] 0x88,	%f5
	bg,pn	%icc,	loop_82
	nop
	set	0x20, %g3
	std	%f12,	[%l7 + %g3]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f0
loop_82:
	ld	[%l7 + 0x54],	%f23
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	add	%i1,	%g2,	%o0
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc4
	set	0x61, %o3
	stba	%o7,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x68, %l0
	stxa	%l2,	[%l7 + %l0] 0x80
	nop
	set	0x74, %o1
	swap	[%l7 + %o1],	%o3
	set	0x24, %i5
	lda	[%l7 + %i5] 0x81,	%f12
	nop
	set	0x58, %o4
	std	%f10,	[%l7 + %o4]
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%o6
	set	0x63, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o1
	st	%f11,	[%l7 + 0x58]
	set	0x28, %l3
	lda	[%l7 + %l3] 0x81,	%f15
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%i2
	set	0x08, %i1
	stxa	%l5,	[%l7 + %i1] 0xe2
	membar	#Sync
	fpadd32	%f30,	%f10,	%f12
	set	0x5C, %i0
	stha	%o4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x28, %l4
	stx	%g5,	[%l7 + %l4]
	set	0x20, %o0
	sta	%f24,	[%l7 + %o0] 0x89
	add	%o5,	%i4,	%l6
	ld	[%l7 + 0x0C],	%f2
	set	0x28, %g2
	sta	%f9,	[%l7 + %g2] 0x89
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x81,	 4
	nop
	set	0x18, %i6
	std	%f6,	[%l7 + %i6]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xe2,	%o2
	set	0x5D, %i4
	stba	%l1,	[%l7 + %i4] 0x89
	and	%l3,	%g6,	%l4
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%i6
	set	0x40, %l5
	stwa	%i0,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%g4
	nop
	set	0x60, %g1
	stw	%l0,	[%l7 + %g1]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i5
	nop
	set	0x58, %g6
	std	%f18,	[%l7 + %g6]
	set	0x58, %g7
	stxa	%g3,	[%l7 + %g7] 0x81
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	or	%i6,	%g2,	%o0
	set	0x20, %o6
	stwa	%o7,	[%l7 + %o6] 0x89
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x14, %l6
	sth	%l2,	[%l7 + %l6]
	add	%o3,	%o6,	%i1
	nop
	set	0x3A, %o3
	sth	%i3,	[%l7 + %o3]
	nop
	set	0x68, %l0
	swap	[%l7 + %l0],	%l5
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x80,	%g5
	ld	[%l7 + 0x5C],	%f16
	nop
	set	0x44, %o4
	sth	%o5,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x68]
	and	%o1,	%l6,	%i4
	nop
	set	0x48, %i2
	ldub	[%l7 + %i2],	%g7
	nop
	nop
	setx	0xC23AD1265D1AB826,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9CCE0BD44ADBB992,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f28
	nop
	set	0x70, %l3
	lduh	[%l7 + %l3],	%o2
	nop
	set	0x44, %i3
	stw	%l1,	[%l7 + %i3]
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x14, %i0
	sta	%f18,	[%l7 + %i0] 0x80
	set	0x58, %o5
	lda	[%l7 + %o5] 0x89,	%f3
	nop
	set	0x58, %o0
	std	%f8,	[%l7 + %o0]
	nop
	set	0x70, %g2
	stx	%g6,	[%l7 + %g2]
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f2
	nop
	set	0x72, %o7
	ldstub	[%l7 + %o7],	%l3
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x54, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i7
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f0
	nop
	set	0x74, %g4
	ldsh	[%l7 + %g4],	%l4
	set	0x50, %l5
	stxa	%i0,	[%l7 + %l5] 0xea
	membar	#Sync
	ld	[%l7 + 0x30],	%f11
	add	%l0,	%g1,	%g4
	bn,a	%icc,	loop_83
	add	%i5,	%g3,	%i2
	set	0x64, %l2
	stha	%g2,	[%l7 + %l2] 0x81
loop_83:
	nop
	set	0x54, %i4
	stwa	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%l2
	set	0x48, %g7
	stwa	%o3,	[%l7 + %g7] 0x89
	set	0x30, %g1
	lda	[%l7 + %g1] 0x88,	%f16
	set	0x2C, %g3
	swapa	[%l7 + %g3] 0x89,	%i1
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x89,	%o6
	st	%fsr,	[%l7 + 0x30]
	and	%i3,	%l5,	%o4
	nop
	set	0x78, %o6
	lduh	[%l7 + %o6],	%g5
	set	0x70, %l6
	swapa	[%l7 + %l6] 0x88,	%o1
	set	0x08, %o3
	stxa	%o5,	[%l7 + %o3] 0xe2
	membar	#Sync
	add	%l6,	%g7,	%i4
	or	%o2,	%l1,	%g6
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%l3
	set	0x78, %l0
	lda	[%l7 + %l0] 0x89,	%f11
	set	0x4C, %i5
	sta	%f16,	[%l7 + %i5] 0x80
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x81,	%l4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%i0
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%g1
	set	0x50, %o1
	stxa	%l0,	[%l7 + %o1] 0x80
	fpsub32	%f12,	%f26,	%f6
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	nop
	set	0x14, %i1
	ldstub	[%l7 + %i1],	%i5
	nop
	set	0x5E, %i0
	lduh	[%l7 + %i0],	%g3
	st	%f9,	[%l7 + 0x1C]
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%g4
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x52, %g2
	ldsb	[%l7 + %g2],	%i2
	nop
	set	0x24, %l4
	ldstub	[%l7 + %l4],	%i6
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%g2
	set	0x58, %o5
	stda	%o0,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xe3,	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%l2
	nop
	set	0x20, %i7
	stx	%i1,	[%l7 + %i7]
	set	0x28, %i6
	lda	[%l7 + %i6] 0x88,	%f27
	set	0x50, %l5
	stwa	%o6,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x80
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%l5
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%o4
	and	%i3,	%g5,	%o5
	nop
	set	0x6E, %g4
	sth	%l6,	[%l7 + %g4]
	st	%f8,	[%l7 + 0x34]
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x6E, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o1
	nop
	set	0x3C, %o2
	lduw	[%l7 + %o2],	%i4
	st	%f16,	[%l7 + 0x60]
	nop
	set	0x20, %o6
	stx	%o2,	[%l7 + %o6]
	set	0x51, %l6
	stba	%g7,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x2A, %o3
	stb	%l1,	[%l7 + %o3]
	nop
	set	0x77, %g3
	ldstub	[%l7 + %g3],	%l3
	set	0x21, %l1
	stba	%g6,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x89,	%i6
	nop
	set	0x50, %i2
	std	%g0,	[%l7 + %i2]
	or	%l0,	%i0,	%i5
	fpsub32	%f14,	%f10,	%f16
	add	%g4,	%g3,	%i2
	ld	[%l7 + 0x4C],	%f5
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x89,	%i6
	and	%g2,	%o7,	%o3
	nop
	set	0x18, %l3
	lduw	[%l7 + %l3],	%o0
	nop
	set	0x28, %i1
	stw	%l2,	[%l7 + %i1]
	nop
	set	0x64, %i0
	ldstub	[%l7 + %i0],	%i1
	nop
	set	0x64, %i3
	prefetch	[%l7 + %i3],	 4
	fpsub32s	%f12,	%f12,	%f12
	set	0x74, %o0
	sta	%f15,	[%l7 + %o0] 0x89
	nop
	set	0x68, %g2
	stx	%o6,	[%l7 + %g2]
	nop
	set	0x78, %l4
	stx	%o4,	[%l7 + %l4]
	wr	%l5,	%g5,	%softint
	nop
	set	0x74, %o7
	swap	[%l7 + %o7],	%o5
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x89,	 4
	and	%o1,	%i4,	%o2
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%g7
	add	%l1,	%i3,	%g6
	set	0x28, %g5
	lda	[%l7 + %g5] 0x89,	%f1
	nop
	set	0x10, %i6
	ldsh	[%l7 + %i6],	%l4
	set	0x30, %l5
	sta	%f2,	[%l7 + %l5] 0x80
	st	%f3,	[%l7 + 0x30]
	wr 	%g0, 	0x7, 	%fprs
	and	%l0,	%i0,	%i5
	set	0x38, %l2
	stda	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xD67E786E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x7704A71F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f5,	%f22
	nop
	set	0x45, %i4
	stb	%g4,	[%l7 + %i4]
	nop
	set	0x38, %i7
	std	%g2,	[%l7 + %i7]
	set	0x2D, %g6
	stba	%i2,	[%l7 + %g6] 0x80
	set	0x32, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g2
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x80,	%i6
	set	0x48, %g4
	stda	%o6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x0E, %o2
	stha	%o0,	[%l7 + %o2] 0x88
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%l2
	nop
	set	0x78, %o6
	swap	[%l7 + %o6],	%o3
	nop
	set	0x25, %o3
	stb	%o6,	[%l7 + %o3]
	nop
	set	0x38, %g3
	swap	[%l7 + %g3],	%o4
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x89,	%l4
	nop
	set	0x1D, %o4
	ldub	[%l7 + %o4],	%g5
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xeb,	%o4
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	nop
	set	0x48, %i2
	ldsh	[%l7 + %i2],	%o1
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	wr	%i4,	%g7,	%ccr
	wr	%o2,	%i3,	%softint
	set	0x48, %i0
	ldxa	[%l7 + %i0] 0x89,	%g6
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%l4
	nop
	set	0x08, %l3
	stw	%i7,	[%l7 + %l3]
	wr	%l1,	%g1,	%y
	fpsub16s	%f30,	%f9,	%f15
	bge,a	%xcc,	loop_84
	nop
	set	0x18, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%i4
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x81,	%i0
loop_84:
	nop
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x81,	%l3
	set	0x38, %g5
	stxa	%g4,	[%l7 + %g5] 0x89
	bgu	%xcc,	loop_85
	wr	%i2,	%g2,	%ccr
	fpadd16	%f10,	%f4,	%f2
	or	%i6,	%g3,	%o7
loop_85:
	nop
	set	0x64, %i6
	lda	[%l7 + %i6] 0x89,	%f30
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f8
	set	0x70, %o1
	swapa	[%l7 + %o1] 0x81,	%o0
	nop
	set	0x46, %i4
	ldstub	[%l7 + %i4],	%l2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc0
	st	%f28,	[%l7 + 0x50]
	nop
	set	0x40, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x6C, %g1
	lduw	[%l7 + %g1],	%o3
	nop
	set	0x50, %g7
	sth	%o4,	[%l7 + %g7]
	set	0x75, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o6
	fpadd16	%f30,	%f4,	%f16
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x60, %l6
	stxa	%g5,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd8
	set	0x0E, %o3
	stha	%l5,	[%l7 + %o3] 0x89
	nop
	set	0x66, %o6
	sth	%l6,	[%l7 + %o6]
	bne,a	%icc,	loop_86
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f6
	st	%fsr,	[%l7 + 0x28]
	ba	%icc,	loop_87
loop_86:
	and	%o1,	%i1,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%o2
loop_87:
	nop
	set	0x30, %o4
	ldsb	[%l7 + %o4],	%i3
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%g6
	nop
	set	0x70, %l1
	stx	%o5,	[%l7 + %l1]
	nop
	set	0x24, %i5
	ldub	[%l7 + %i5],	%i7
	set	0x26, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l1
	nop
	set	0x14, %i2
	ldsh	[%l7 + %i2],	%g1
	nop
	set	0x4D, %i3
	stb	%l0,	[%l7 + %i3]
	ld	[%l7 + 0x3C],	%f0
	nop
	set	0x74, %o0
	ldsh	[%l7 + %o0],	%i5
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%i0
	set	0x40, %i0
	stba	%l4,	[%l7 + %i0] 0x88
	nop
	set	0x4C, %o7
	lduw	[%l7 + %o7],	%l3
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%g4
	add	%g2,	%i6,	%g3
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x81
	nop
	set	0x40, %g5
	std	%f0,	[%l7 + %g5]
	and	%i2,	%o7,	%o0
	set	0x18, %o5
	stda	%o2,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x88,	 4
	nop
	set	0x4E, %o1
	ldub	[%l7 + %o1],	%o6
	st	%fsr,	[%l7 + 0x38]
	set	0x5E, %l5
	stba	%l2,	[%l7 + %l5] 0x89
	add	%g5,	%l6,	%o1
	st	%f1,	[%l7 + 0x50]
	bge,a	%icc,	loop_88
	nop
	set	0x23, %l2
	ldstub	[%l7 + %l2],	%l5
	and	%i4,	%i1,	%g7
	set	0x44, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o2
loop_88:
	nop
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc4
	set	0x48, %g7
	stxa	%i3,	[%l7 + %g7] 0x88
	set	0x58, %g1
	lda	[%l7 + %g1] 0x88,	%f17
	st	%f7,	[%l7 + 0x6C]
	and	%o5,	%i7,	%g6
	set	0x72, %g4
	stha	%l1,	[%l7 + %g4] 0x88
	wr	%g1,	%l0,	%pic
	nop
	set	0x2C, %l6
	lduh	[%l7 + %l6],	%i0
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x89,	%i5
	and	%l3,	%l4,	%g4
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xeb,	%i6
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%g2
	nop
	set	0x30, %o6
	ldsw	[%l7 + %o6],	%i2
	nop
	set	0x5E, %g3
	lduh	[%l7 + %g3],	%o7
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%o0
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%g3
	fpsub16	%f20,	%f12,	%f0
	nop
	set	0x5A, %i5
	ldsb	[%l7 + %i5],	%o6
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x81,	%l2
	set	0x1A, %i1
	stha	%g5,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x30, %i3
	stx	%l6,	[%l7 + %i3]
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%o0
	st	%fsr,	[%l7 + 0x1C]
	st	%fsr,	[%l7 + 0x64]
	set	0x30, %o0
	lda	[%l7 + %o0] 0x89,	%f17
	add	%i4,	%l5,	%g7
	nop
	set	0x6F, %i0
	ldstub	[%l7 + %i0],	%i1
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	and	%i3,	%o2,	%o5
	nop
	set	0x4E, %o7
	ldstub	[%l7 + %o7],	%g6
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x89,	%l1
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%g1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc2
	set	0x20, %i6
	stxa	%i7,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	set	0x6C, %g5
	sta	%f6,	[%l7 + %g5] 0x80
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x88,	%l0
	nop
	set	0x59, %i4
	ldstub	[%l7 + %i4],	%l3
	set	0x5A, %g6
	stha	%i5,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%l4
	set	0x44, %l5
	sta	%f5,	[%l7 + %l5] 0x88
	nop
	set	0x10, %g4
	std	%i6,	[%l7 + %g4]
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%g2
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x80,	%g4
	nop
	set	0x70, %i7
	std	%o6,	[%l7 + %i7]
	add	%o0,	%o3,	%i2
	st	%fsr,	[%l7 + 0x58]
	set	0x65, %o3
	stba	%g3,	[%l7 + %o3] 0xe3
	membar	#Sync
	st	%f28,	[%l7 + 0x2C]
	set	0x25, %o6
	stba	%o4,	[%l7 + %o6] 0xe2
	membar	#Sync
	fpadd32s	%f27,	%f27,	%f9
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf8
	membar	#Sync
	nop
	set	0x5F, %g3
	ldstub	[%l7 + %g3],	%o6
	set	0x2C, %l0
	stwa	%l2,	[%l7 + %l0] 0x89
	set	0x72, %l1
	stha	%l6,	[%l7 + %l1] 0x89
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x80,	%o0
	set	0x09, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i4
	nop
	set	0x20, %i3
	std	%f4,	[%l7 + %i3]
	wr	%g5,	%l5,	%sys_tick
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	wr	%i1,	%o2,	%sys_tick
	set	0x38, %o0
	lda	[%l7 + %o0] 0x80,	%f28
	nop
	set	0x38, %i0
	stx	%o5,	[%l7 + %i0]
	st	%f23,	[%l7 + 0x70]
	add	%g6,	%l1,	%g1
	nop
	set	0x4C, %l3
	stw	%i3,	[%l7 + %l3]
	set	0x40, %o7
	stwa	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x60, %l4
	stda	%l0,	[%l7 + %l4] 0xea
	membar	#Sync
	bg,pn	%icc,	loop_89
	fpsub32s	%f23,	%f30,	%f8
	nop
	set	0x26, %g2
	sth	%l3,	[%l7 + %g2]
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%i5
loop_89:
	st	%fsr,	[%l7 + 0x24]
	set	0x76, %i6
	stha	%i7,	[%l7 + %i6] 0x88
	set	0x63, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l4
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%g2
	nop
	set	0x6C, %o1
	sth	%i6,	[%l7 + %o1]
	set	0x62, %i4
	stba	%o7,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x2C, %g6
	swapa	[%l7 + %g6] 0x88,	%g4
	nop
	set	0x30, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x6C, %l5
	sta	%f11,	[%l7 + %l5] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i2
	set	0x70, %g4
	stxa	%g3,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%o6
	add	%o3,	%l2,	%o1
	set	0x31, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA20, 	%sys_tick_cmpr
	set	0x40, %i7
	lda	[%l7 + %i7] 0x89,	%f0
	nop
	set	0x48, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd8,	%f16
	nop
	set	0x58, %o2
	swap	[%l7 + %o2],	%g7
	nop
	set	0x70, %g3
	ldsh	[%l7 + %g3],	%i1
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%o2
	nop
	set	0x29, %o4
	ldstub	[%l7 + %o4],	%o5
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x11, %i3
	ldub	[%l7 + %i3],	%g6
	set	0x54, %l0
	sta	%f9,	[%l7 + %l0] 0x88
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%f4
	nop
	set	0x70, %i0
	ldsw	[%l7 + %i0],	%g5
	set	0x5C, %l3
	swapa	[%l7 + %l3] 0x80,	%g1
	set	0x10, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%i3
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%l0
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%i0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%i4
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%i6
	set	0x18, %o5
	stxa	%l4,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x08, %o1
	ldsh	[%l7 + %o1],	%g2
	nop
	set	0x18, %g5
	ldub	[%l7 + %g5],	%o7
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x14, %i4
	sth	%i6,	[%l7 + %i4]
	nop
	set	0x48, %g7
	std	%g4,	[%l7 + %g7]
	set	0x40, %g6
	stda	%o0,	[%l7 + %g6] 0xe2
	membar	#Sync
	or	%i2,	%g3,	%o4
	set	0x42, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o3
	nop
	set	0x5C, %l5
	stw	%l2,	[%l7 + %l5]
	nop
	set	0x40, %l2
	std	%f8,	[%l7 + %l2]
	st	%f4,	[%l7 + 0x6C]
	nop
	set	0x14, %l6
	ldsh	[%l7 + %l6],	%o1
	ld	[%l7 + 0x2C],	%f25
	bl,pt	%xcc,	loop_90
	nop
	set	0x3B, %i7
	ldub	[%l7 + %i7],	%o6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
loop_90:
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%i4
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%l5
	add	%g7,	%i1,	%o2
	nop
	set	0x74, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x15, %g1
	stba	%o5,	[%l7 + %g1] 0xeb
	membar	#Sync
	and	%g6,	%g5,	%l6
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x71, %l1
	stb	%g1,	[%l7 + %l1]
	nop
	set	0x50, %o4
	lduw	[%l7 + %o4],	%l1
	or	%l0,	%i3,	%l3
	nop
	set	0x30, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	nop
	set	0x64, %i1
	ldsh	[%l7 + %i1],	%i5
	set	0x30, %i2
	stda	%l4,	[%l7 + %i2] 0x89
	nop
	set	0x50, %i0
	std	%f30,	[%l7 + %i0]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f16
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f16
	add	%i7,	%g2,	%i6
	set	0x18, %g2
	swapa	[%l7 + %g2] 0x89,	%o7
	nop
	set	0x60, %l4
	ldx	[%l7 + %l4],	%g4
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%i2
	set	0x58, %i5
	stda	%g2,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x52, %i6
	lduh	[%l7 + %i6],	%o0
	nop
	nop
	setx	0xD598D257,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x1FC4FD27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f11,	%f8
	fpadd32	%f28,	%f24,	%f8
	set	0x54, %o5
	sta	%f12,	[%l7 + %o5] 0x81
	add	%o4,	%o3,	%l2
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%o1
	nop
	set	0x70, %i4
	stw	%i4,	[%l7 + %i4]
	nop
	set	0x0C, %g7
	swap	[%l7 + %g7],	%l5
	and	%g7,	%o6,	%o2
	nop
	set	0x24, %g6
	ldsw	[%l7 + %g6],	%i1
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%o4
	nop
	set	0x78, %g5
	stx	%g6,	[%l7 + %g5]
	nop
	set	0x2C, %l2
	stw	%g5,	[%l7 + %l2]
	set	0x44, %l6
	stwa	%l6,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x26, %l5
	stb	%g1,	[%l7 + %l5]
	set	0x18, %i7
	stwa	%l1,	[%l7 + %i7] 0x80
	and	%l0,	%i3,	%i0
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xe2,	%l2
	nop
	set	0x60, %o6
	std	%f14,	[%l7 + %o6]
	set	0x08, %g3
	stxa	%i5,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x28, %o2
	std	%f0,	[%l7 + %o2]
	bg,a	%xcc,	loop_91
	nop
	set	0x08, %l1
	lduw	[%l7 + %l1],	%l4
	fpadd16	%f20,	%f28,	%f18
	nop
	set	0x08, %g1
	ldsw	[%l7 + %g1],	%i7
loop_91:
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f28
	be,a,pn	%icc,	loop_92
	ld	[%l7 + 0x58],	%f12
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
loop_92:
	or	%g2,	%o7,	%g4
	add	%i2,	%g3,	%i6
	nop
	set	0x56, %l0
	stb	%o4,	[%l7 + %l0]
	ld	[%l7 + 0x10],	%f16
	nop
	set	0x2E, %i2
	sth	%o0,	[%l7 + %i2]
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x0C, %i1
	ldsb	[%l7 + %i1],	%o3
	nop
	set	0x66, %o7
	ldstub	[%l7 + %o7],	%l2
	and	%o1,	%i4,	%l5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%g7
	and	%o2,	%i1,	%o5
	and	%g6,	%g5,	%l6
	set	0x10, %g2
	stxa	%g1,	[%l7 + %g2] 0x81
	set	0x18, %o0
	stxa	%l0,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x64, %l4
	prefetch	[%l7 + %l4],	 4
	ld	[%l7 + 0x0C],	%f21
	nop
	set	0x68, %i5
	stw	%i3,	[%l7 + %i5]
	nop
	set	0x14, %i6
	swap	[%l7 + %i6],	%i0
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x81,	%l2
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x40, %o1
	std	%f26,	[%l7 + %o1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%i7
	nop
	set	0x50, %i4
	stx	%fsr,	[%l7 + %i4]
	add	%g2,	%g4,	%i2
	set	0x1A, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g3
	nop
	set	0x6D, %g6
	stb	%i6,	[%l7 + %g6]
	set	0x20, %g4
	stda	%o4,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x80,	%o0
	nop
	set	0x40, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x32, %l6
	ldub	[%l7 + %l6],	%o7
	wr	%l2,	%o3,	%sys_tick
	set	0x20, %l5
	stda	%o0,	[%l7 + %l5] 0x89
	nop
	set	0x64, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x40, %g5
	stw	%i4,	[%l7 + %g5]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%l5
	nop
	set	0x20, %o3
	ldsw	[%l7 + %o3],	%o2
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%g6
	add	%g5,	%g7,	%g1
	st	%f4,	[%l7 + 0x24]
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%i6
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	nop
	set	0x38, %o6
	ldstub	[%l7 + %o6],	%i0
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%l2
	st	%f22,	[%l7 + 0x48]
	set	0x2C, %i3
	stba	%i5,	[%l7 + %i3] 0x80
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%l1,	%l4,	%l0
	nop
	set	0x48, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x10, %i0
	swapa	[%l7 + %i0] 0x81,	%g2
	set	0x40, %i2
	lda	[%l7 + %i2] 0x88,	%f12
	set	0x7C, %o7
	ldstuba	[%l7 + %o7] 0x89,	%g4
	nop
	set	0x40, %i1
	lduw	[%l7 + %i1],	%i2
	nop
	set	0x42, %o0
	ldub	[%l7 + %o0],	%g3
	nop
	set	0x3A, %l4
	sth	%i7,	[%l7 + %l4]
	st	%f17,	[%l7 + 0x60]
	set	0x28, %i5
	lda	[%l7 + %i5] 0x81,	%f0
	and	%o4,	%o0,	%o7
	set	0x6F, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l2
	nop
	set	0x46, %o5
	lduh	[%l7 + %o5],	%i6
	ld	[%l7 + 0x70],	%f22
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i4
	nop
	set	0x28, %o1
	ldsw	[%l7 + %o1],	%o1
	set	0x14, %i4
	swapa	[%l7 + %i4] 0x89,	%o6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%l5
	nop
	set	0x78, %g7
	stw	%i1,	[%l7 + %g7]
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%g6
	nop
	set	0x1C, %g4
	ldub	[%l7 + %g4],	%g5
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%o5
	st	%f21,	[%l7 + 0x34]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g7
	nop
	set	0x70, %l3
	lduh	[%l7 + %l3],	%l6
	nop
	set	0x5C, %l6
	sth	%i3,	[%l7 + %l6]
	nop
	set	0x1E, %l2
	sth	%i0,	[%l7 + %l2]
	set	0x40, %i7
	stxa	%l3,	[%l7 + %i7] 0x80
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%l4
	add	%i5,	%l0,	%g4
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x88,	%i2
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x88,	%g2
	nop
	set	0x08, %o3
	stx	%g2,	[%l7 + %o3]
	nop
	set	0x30, %g3
	prefetch	[%l7 + %g3],	 4
	ble,a	%icc,	loop_93
	nop
	set	0x68, %l1
	lduw	[%l7 + %l1],	%o4
	or	%i7,	%o7,	%l2
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f18
loop_93:
	nop
	set	0x76, %o2
	lduh	[%l7 + %o2],	%o0
	nop
	set	0x2C, %i3
	sth	%i6,	[%l7 + %i3]
	nop
	set	0x34, %l0
	stw	%i4,	[%l7 + %l0]
	nop
	set	0x34, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x5A, %i0
	lduh	[%l7 + %i0],	%o3
	nop
	set	0x0D, %g1
	ldub	[%l7 + %g1],	%o1
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x80,	%o2
	nop
	set	0x46, %i1
	lduh	[%l7 + %i1],	%l5
	set	0x54, %o0
	lda	[%l7 + %o0] 0x89,	%f18
	nop
	set	0x3E, %l4
	lduh	[%l7 + %l4],	%i1
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%g6
	nop
	set	0x4C, %i2
	ldsb	[%l7 + %i2],	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g1
	add	%g5,	%l6,	%i3
	st	%fsr,	[%l7 + 0x18]
	set	0x64, %o5
	lda	[%l7 + %o5] 0x80,	%f23
	nop
	set	0x08, %g2
	ldsb	[%l7 + %g2],	%i0
	fpadd16s	%f14,	%f27,	%f27
	nop
	set	0x20, %i4
	std	%f12,	[%l7 + %i4]
	nop
	set	0x50, %o1
	stb	%l3,	[%l7 + %o1]
	nop
	set	0x37, %g6
	stb	%g7,	[%l7 + %g6]
	nop
	set	0x0B, %g7
	stb	%l1,	[%l7 + %g7]
	nop
	set	0x50, %g4
	stw	%l4,	[%l7 + %g4]
	nop
	set	0x18, %i6
	stx	%i5,	[%l7 + %i6]
	set	0x64, %l3
	sta	%f18,	[%l7 + %l3] 0x81
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f22
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xda,	%f16
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f16
	nop
	set	0x18, %l5
	std	%f2,	[%l7 + %l5]
	set	0x68, %o3
	stxa	%g4,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x54, %l2
	stha	%l0,	[%l7 + %l2] 0x81
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf1
	membar	#Sync
	nop
	set	0x58, %o6
	ldx	[%l7 + %o6],	%g3
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x40, %o2
	stw	%i2,	[%l7 + %o2]
	nop
	set	0x50, %g3
	stw	%g2,	[%l7 + %g3]
	nop
	set	0x76, %i3
	ldstub	[%l7 + %i3],	%i7
	nop
	set	0x5E, %o4
	ldsh	[%l7 + %o4],	%o4
	set	0x4F, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o7
	set	0x52, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l2
	nop
	set	0x5C, %o7
	lduw	[%l7 + %o7],	%i6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i4
	ld	[%l7 + 0x2C],	%f10
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x3F, %l0
	ldsb	[%l7 + %l0],	%o1
	and	%o2,	%l5,	%o3
	and	%g6,	%i1,	%o5
	nop
	set	0x4E, %i1
	lduh	[%l7 + %i1],	%g1
	st	%f4,	[%l7 + 0x18]
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x88,	%g5
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x60, %i2
	stha	%o6,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x60, %o0
	sta	%f5,	[%l7 + %o0] 0x80
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%i3
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x88,	%l3
	nop
	set	0x10, %i4
	lduw	[%l7 + %i4],	%i0
	nop
	set	0x52, %o1
	lduh	[%l7 + %o1],	%g7
	set	0x5C, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l1
	nop
	set	0x22, %g7
	lduh	[%l7 + %g7],	%i5
	nop
	set	0x10, %g4
	std	%f26,	[%l7 + %g4]
	set	0x38, %o5
	stha	%g4,	[%l7 + %o5] 0x89
	set	0x41, %i6
	stba	%l4,	[%l7 + %i6] 0x81
	set	0x2F, %l3
	stba	%l0,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x60, %i7
	ldsb	[%l7 + %i7],	%i2
	nop
	set	0x0C, %l6
	lduh	[%l7 + %l6],	%g3
	nop
	set	0x58, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x18, %g5
	stda	%g2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%o4
	nop
	set	0x48, %l2
	stw	%o7,	[%l7 + %l2]
	and	%l2,	%i7,	%o0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f16
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x88,	%i4
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%i6
	set	0x4A, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o2
	wr	%o1,	%l5,	%sys_tick
	set	0x16, %o2
	stha	%g6,	[%l7 + %o2] 0x81
	set	0x48, %o4
	swapa	[%l7 + %o4] 0x88,	%i1
	nop
	set	0x3C, %g1
	ldstub	[%l7 + %g1],	%o3
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x89,	%g0
	set	0x10, %l0
	stda	%g4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%o6
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%l6
	nop
	set	0x65, %i5
	ldstub	[%l7 + %i5],	%i3
	or	%l3,	%o5,	%i0
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%l0
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%g7
	nop
	set	0x36, %o0
	lduh	[%l7 + %o0],	%g4
	st	%f4,	[%l7 + 0x44]
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%l0
	wr	%l4,	%i2,	%sys_tick
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	set	0x5C, %g6
	sta	%f5,	[%l7 + %g6] 0x80
	and	%g3,	%o4,	%g2
	ld	[%l7 + 0x38],	%f14
	set	0x16, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o7
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 4
	or	%i7,	%o0,	%i4
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x24, %l3
	ldsb	[%l7 + %l3],	%l2
	set	0x64, %g4
	lda	[%l7 + %g4] 0x80,	%f24
	set	0x38, %l6
	lda	[%l7 + %l6] 0x89,	%f11
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x80,	%o2
	set	0x1C, %l5
	sta	%f25,	[%l7 + %l5] 0x89
	set	0x50, %o3
	stda	%o0,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x4C, %l2
	lduh	[%l7 + %l2],	%l5
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x81,	 4
	nop
	set	0x38, %g5
	stw	%i1,	[%l7 + %g5]
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%g6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd0,	%f16
	add	%g1,	%o3,	%g5
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x1C, %o4
	sth	%o6,	[%l7 + %o4]
	st	%f3,	[%l7 + 0x60]
	nop
	set	0x68, %g1
	lduw	[%l7 + %g1],	%l3
	set	0x61, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i3
	nop
	set	0x16, %l0
	stb	%i0,	[%l7 + %l0]
	set	0x58, %i1
	stha	%l1,	[%l7 + %i1] 0x88
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f14
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%i5
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x81,	%g7
	set	0x58, %i2
	stxa	%l0,	[%l7 + %i2] 0x89
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%l4
	nop
	set	0x47, %o0
	ldub	[%l7 + %o0],	%g4
	set	0x50, %g2
	stwa	%g3,	[%l7 + %g2] 0xe2
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g2
	nop
	set	0x08, %o1
	ldub	[%l7 + %o1],	%i2
	nop
	set	0x28, %o7
	ldsw	[%l7 + %o7],	%o7
	nop
	set	0x78, %i4
	std	%f6,	[%l7 + %i4]
	nop
	set	0x10, %g7
	stx	%i7,	[%l7 + %g7]
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%i4
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f12
	add	%o2,	%l2,	%l5
	set	0x70, %l3
	sta	%f10,	[%l7 + %l3] 0x80
	nop
	set	0x70, %g4
	ldx	[%l7 + %g4],	%i6
	nop
	set	0x08, %i7
	stx	%i1,	[%l7 + %i7]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf1
	membar	#Sync
	set	0x50, %o3
	stxa	%g6,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x3E, %l5
	ldub	[%l7 + %l5],	%g1
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%o3
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x89,	%o0
	set	0x5C, %g3
	sta	%f21,	[%l7 + %g3] 0x88
	set	0x5C, %l1
	stwa	%l6,	[%l7 + %l1] 0xeb
	membar	#Sync
	ba	%icc,	loop_94
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%g5
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%o6
	nop
	set	0x74, %g1
	stw	%i3,	[%l7 + %g1]
loop_94:
	nop
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd0
	nop
	set	0x60, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x0C, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x3E, %i3
	ldsh	[%l7 + %i3],	%l3
	nop
	set	0x29, %i0
	ldub	[%l7 + %i0],	%i0
	nop
	set	0x58, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x3D, %i5
	stb	%o5,	[%l7 + %i5]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f16
	ld	[%l7 + 0x34],	%f30
	fpsub32s	%f14,	%f29,	%f21
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x89,	 4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%l0
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%l4
	wr	%g7,	%g3,	%ccr
	add	%o4,	%g2,	%i2
	nop
	set	0x10, %o7
	swap	[%l7 + %o7],	%o7
	nop
	set	0x4E, %i4
	lduh	[%l7 + %i4],	%i7
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x10, %g6
	swap	[%l7 + %g6],	%o0
	add	%g4,	%o2,	%l2
	add	%i6,	%i1,	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%o3
	nop
	set	0x48, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x38, %i6
	stx	%o1,	[%l7 + %i6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%l6
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%g5
	and	%o6,	%l3,	%i3
	or	%i0,	%o5,	%l1
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x50, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x47, %l6
	ldstub	[%l7 + %l6],	%i5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l4
	nop
	set	0x2A, %o3
	ldsb	[%l7 + %o3],	%g7
	nop
	set	0x40, %l5
	stw	%g3,	[%l7 + %l5]
	nop
	set	0x20, %o6
	stw	%g2,	[%l7 + %o6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%i4
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xcc
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x88,	%i2
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f0
	set	0x4C, %l1
	sta	%f20,	[%l7 + %l1] 0x81
	set	0x50, %g1
	stxa	%g4,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xe3,	%o2
	ld	[%l7 + 0x58],	%f31
	set	0x50, %l0
	stha	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x7B, %i3
	stba	%i6,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x20, %i0
	stxa	%o0,	[%l7 + %i0] 0x89
	nop
	set	0x10, %i2
	ldsw	[%l7 + %i2],	%i1
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%g6
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc0
	nop
	set	0x68, %g2
	lduw	[%l7 + %g2],	%l5
	set	0x1C, %l4
	swapa	[%l7 + %l4] 0x89,	%o3
	nop
	set	0x08, %o7
	std	%o0,	[%l7 + %o7]
	set	0x33, %o1
	stba	%g1,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x34, %i4
	ldsw	[%l7 + %i4],	%g5
	fpadd32	%f2,	%f4,	%f24
	nop
	set	0x64, %g6
	swap	[%l7 + %g6],	%l6
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%l3
	nop
	set	0x7E, %o5
	ldub	[%l7 + %o5],	%o6
	nop
	set	0x08, %i6
	stw	%i0,	[%l7 + %i6]
	set	0x60, %l3
	lda	[%l7 + %l3] 0x81,	%f15
	set	0x18, %g4
	stxa	%i3,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x78, %i7
	swap	[%l7 + %i7],	%o5
	set	0x18, %o3
	stxa	%l1,	[%l7 + %o3] 0x80
	nop
	set	0x4E, %l6
	ldsb	[%l7 + %l6],	%l0
	set	0x3A, %o6
	stha	%i5,	[%l7 + %o6] 0x80
	nop
	set	0x70, %l5
	sth	%g7,	[%l7 + %l5]
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%l4
	nop
	set	0x20, %l2
	stx	%g3,	[%l7 + %l2]
	nop
	set	0x32, %g5
	sth	%o4,	[%l7 + %g5]
	nop
	set	0x30, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f4
	nop
	set	0x3C, %o2
	ldub	[%l7 + %o2],	%g2
	set	0x3E, %o4
	stha	%i7,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x08, %i3
	stxa	%o7,	[%l7 + %i3] 0x88
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%i2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xca
	nop
	set	0x35, %i0
	ldstub	[%l7 + %i0],	%i4
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f0
	nop
	set	0x4B, %i5
	ldub	[%l7 + %i5],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%i6
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f18
	ld	[%l7 + 0x70],	%f20
	set	0x58, %i2
	stxa	%l2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x20, %o7
	ldub	[%l7 + %o7],	%i1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	set	0x4C, %o1
	sta	%f20,	[%l7 + %o1] 0x81
	add	%o0,	%g6,	%o3
	set	0x1C, %g6
	stwa	%l5,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x2E, %i4
	sth	%o1,	[%l7 + %i4]
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x28, %o5
	ldsw	[%l7 + %o5],	%g1
	set	0x2A, %l3
	stba	%g5,	[%l7 + %l3] 0xe3
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%o6
	st	%f13,	[%l7 + 0x54]
	nop
	set	0x20, %i6
	std	%f28,	[%l7 + %i6]
	set	0x78, %i7
	stda	%i0,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf1
	membar	#Sync
	or	%l6,	%i3,	%l1
	set	0x48, %l6
	stda	%o4,	[%l7 + %l6] 0x81
	st	%f16,	[%l7 + 0x68]
	set	0x66, %o3
	stha	%l0,	[%l7 + %o3] 0x88
	nop
	set	0x10, %l5
	sth	%g7,	[%l7 + %l5]
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%i5
	nop
	set	0x30, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x0A, %g3
	lduh	[%l7 + %g3],	%l4
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x88,	%o4
	nop
	set	0x32, %g1
	lduh	[%l7 + %g1],	%g2
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%g3
	nop
	set	0x50, %l1
	stb	%o7,	[%l7 + %l1]
	set	0x28, %i3
	stda	%i6,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f12
	nop
	set	0x18, %l0
	stx	%i4,	[%l7 + %l0]
	nop
	set	0x3C, %i0
	lduh	[%l7 + %i0],	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%i6
	nop
	set	0x7D, %o0
	stb	%l2,	[%l7 + %o0]
	set	0x25, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g4
	nop
	set	0x1C, %i5
	ldub	[%l7 + %i5],	%i1
	nop
	set	0x78, %g2
	ldub	[%l7 + %g2],	%g6
	nop
	set	0x49, %i2
	stb	%o3,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x7E, %l4
	lduh	[%l7 + %l4],	%l5
	set	0x10, %o1
	swapa	[%l7 + %o1] 0x88,	%o0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc4
	set	0x60, %i4
	stha	%g1,	[%l7 + %i4] 0x89
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l3
	nop
	set	0x48, %o7
	std	%o6,	[%l7 + %o7]
	nop
	set	0x38, %o5
	stb	%i0,	[%l7 + %o5]
	and	%g5,	%i3,	%l6
	nop
	set	0x58, %l3
	stx	%o5,	[%l7 + %l3]
	set	0x30, %g7
	ldxa	[%l7 + %g7] 0x81,	%l0
	set	0x50, %i6
	stxa	%g7,	[%l7 + %i6] 0x81
	st	%f29,	[%l7 + 0x50]
	set	0x08, %i7
	stda	%i4,	[%l7 + %i7] 0xeb
	membar	#Sync
	and	%l1,	%l4,	%o4
	bne,a	%xcc,	loop_95
	wr	%g2,	%g3,	%y
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f0
loop_95:
	nop
	set	0x10, %o3
	swapa	[%l7 + %o3] 0x88,	%i7
	set	0x1C, %l5
	sta	%f29,	[%l7 + %l5] 0x81
	and	%i4,	%o7,	%i2
	nop
	set	0x20, %o6
	stx	%fsr,	[%l7 + %o6]
	ld	[%l7 + 0x38],	%f4
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x88,	 1
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f26
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x80,	%l2
	nop
	set	0x45, %g1
	stb	%i6,	[%l7 + %g1]
	set	0x30, %g3
	stwa	%g4,	[%l7 + %g3] 0x80
	nop
	set	0x34, %o2
	lduh	[%l7 + %o2],	%i1
	set	0x50, %i3
	stxa	%o3,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x64, %o4
	lduh	[%l7 + %o4],	%l5
	nop
	set	0x58, %l0
	prefetch	[%l7 + %l0],	 1
	ld	[%l7 + 0x64],	%f7
	set	0x58, %i0
	stda	%g6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x74, %o0
	stw	%g1,	[%l7 + %o0]
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%o0
	st	%f29,	[%l7 + 0x68]
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%l2
	set	0x11, %g2
	stba	%o6,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x5C, %i2
	stwa	%o1,	[%l7 + %i2] 0x81
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%i0
	set	0x68, %o1
	stwa	%g5,	[%l7 + %o1] 0xe3
	membar	#Sync
	and	%l6,	%o5,	%l0
	set	0x20, %i5
	stxa	%g7,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x38, %g6
	swapa	[%l7 + %g6] 0x80,	%i3
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f30
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%l4
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x63, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l1
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xea,	%g2
	nop
	set	0x68, %i6
	stw	%g3,	[%l7 + %i6]
	set	0x1C, %o7
	sta	%f7,	[%l7 + %o7] 0x80
	set	0x71, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o4
	and	%i4,	%o7,	%i7
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0
	nop
	set	0x71, %l5
	stb	%l2,	[%l7 + %l5]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%g4
	fpadd16	%f22,	%f24,	%f26
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	ld	[%l7 + 0x70],	%f12
	set	0x48, %i7
	stxa	%i2,	[%l7 + %i7] 0x81
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%l5
	nop
	set	0x4C, %g5
	sth	%g6,	[%l7 + %g5]
	fpadd32s	%f4,	%f4,	%f29
	nop
	set	0x40, %g1
	swap	[%l7 + %g1],	%g1
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%o0
	nop
	set	0x16, %o2
	ldsh	[%l7 + %o2],	%l3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	set	0x70, %o4
	stxa	%o1,	[%l7 + %o4] 0xeb
	membar	#Sync
	add	%i0,	%o6,	%l6
	set	0x6C, %i3
	sta	%f10,	[%l7 + %i3] 0x89
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%o5
	set	0x48, %o0
	swapa	[%l7 + %o0] 0x89,	%l0
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%f22
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x72, %l1
	ldsh	[%l7 + %l1],	%g7
	set	0x20, %g2
	stxa	%g5,	[%l7 + %g2] 0x89
	or	%i5,	%i3,	%l1
	nop
	set	0x3D, %i2
	ldub	[%l7 + %i2],	%l4
	add	%g3,	%o4,	%i4
	nop
	set	0x64, %l4
	ldsb	[%l7 + %l4],	%g2
	set	0x0F, %i5
	stba	%o7,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x76, %o1
	ldub	[%l7 + %o1],	%i7
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x80,	 3
	nop
	set	0x1C, %i4
	lduw	[%l7 + %i4],	%l2
	nop
	set	0x4B, %l3
	stb	%g4,	[%l7 + %l3]
	set	0x10, %g7
	lda	[%l7 + %g7] 0x80,	%f22
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f30
	add	%i1,	%i2,	%i6
	set	0x48, %i6
	sta	%f21,	[%l7 + %i6] 0x81
	set	0x60, %l6
	stxa	%o3,	[%l7 + %l6] 0x80
	set	0x0C, %o7
	stwa	%g6,	[%l7 + %o7] 0x81
	add	%l5,	%o0,	%g1
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x58, %o6
	stxa	%o1,	[%l7 + %o6] 0x80
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xda
	set	0x1C, %g4
	stwa	%l3,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%o6,	%i0,	%l6
	set	0x58, %l5
	stba	%o5,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f6
	nop
	set	0x6C, %g1
	sth	%g7,	[%l7 + %g1]
	set	0x68, %o2
	ldxa	[%l7 + %o2] 0x80,	%g5
	nop
	set	0x30, %o4
	ldsb	[%l7 + %o4],	%i5
	nop
	set	0x08, %i3
	lduw	[%l7 + %i3],	%l0
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%l1
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f8
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%i2
	set	0x08, %i1
	ldxa	[%l7 + %i1] 0x80,	%l4
	ld	[%l7 + 0x54],	%f14
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%i4
	set	0x54, %l1
	sta	%f30,	[%l7 + %l1] 0x80
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x74, %o0
	ldsw	[%l7 + %o0],	%g2
	nop
	set	0x2B, %i2
	stb	%g3,	[%l7 + %i2]
	set	0x60, %l4
	stda	%i6,	[%l7 + %l4] 0x88
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%o7
	nop
	set	0x60, %i5
	std	%f22,	[%l7 + %i5]
	nop
	set	0x08, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x40, %g6
	stw	%l2,	[%l7 + %g6]
	nop
	set	0x70, %i4
	std	%f6,	[%l7 + %i4]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%i1
	wr	%g4,	%i2,	%sys_tick
	nop
	set	0x3C, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x10, %o5
	ldub	[%l7 + %o5],	%o3
	nop
	set	0x6C, %g7
	lduw	[%l7 + %g7],	%g6
	nop
	set	0x78, %i6
	stx	%i6,	[%l7 + %i6]
	nop
	set	0x18, %o7
	std	%o0,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x44]
	set	0x50, %o3
	lda	[%l7 + %o3] 0x89,	%f24
	set	0x3B, %o6
	ldstuba	[%l7 + %o6] 0x88,	%g1
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xea,	%o0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1255
!	Type a   	: 23
!	Type cti   	: 25
!	Type x   	: 535
!	Type f   	: 35
!	Type i   	: 127
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
	set	0x1,	%g2
	set	0x7,	%g3
	set	0x3,	%g4
	set	0x3,	%g5
	set	0x0,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xD,	%i1
	set	-0x8,	%i2
	set	-0x9,	%i3
	set	-0xC,	%i4
	set	-0x4,	%i5
	set	-0xF,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x1EECF3E1,	%l0
	set	0x32225C57,	%l1
	set	0x5B6C6090,	%l2
	set	0x39F71C49,	%l3
	set	0x1A238F01,	%l4
	set	0x1EBCFE4A,	%l5
	set	0x56D4F816,	%l6
	!# Output registers
	set	-0x0D65,	%o0
	set	0x15DE,	%o1
	set	-0x1C3F,	%o2
	set	0x0439,	%o3
	set	-0x0803,	%o4
	set	0x1823,	%o5
	set	0x00A7,	%o6
	set	0x037E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	st	%f30,	[%l7 + 0x1C]
	bl	%icc,	loop_96
	nop
	set	0x60, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%l2
	nop
	set	0x70, %g5
	ldsw	[%l7 + %g5],	%o6
loop_96:
	nop
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x81,	%l4
	set	0x10, %g1
	stwa	%i0,	[%l7 + %g1] 0x81
	fpadd32	%f26,	%f16,	%f6
	set	0x70, %l5
	stda	%i6,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	bleu,a	%icc,	loop_97
	or	%g5,	%i5,	%o5
	nop
	set	0x58, %i3
	swap	[%l7 + %i3],	%l1
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%i3
loop_97:
	nop
	set	0x77, %i0
	stb	%l4,	[%l7 + %i0]
	nop
	set	0x60, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%i4
	fpadd32s	%f6,	%f22,	%f21
	nop
	set	0x72, %l1
	sth	%g2,	[%l7 + %l1]
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f28
	nop
	set	0x10, %i2
	ldub	[%l7 + %i2],	%g3
	add	%i7,	%o4,	%o7
	nop
	set	0x64, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf9
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	set	0x6F, %o1
	ldstuba	[%l7 + %o1] 0x88,	%l2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%o2
	fpadd32s	%f5,	%f15,	%f25
	add	%g4,	%o3,	%g6
	fpsub32	%f20,	%f26,	%f28
	set	0x18, %i5
	stxa	%i2,	[%l7 + %i5] 0x88
	nop
	set	0x54, %g6
	sth	%i6,	[%l7 + %g6]
	nop
	set	0x22, %i4
	lduh	[%l7 + %i4],	%g1
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f16
	st	%f21,	[%l7 + 0x78]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%o0
	nop
	set	0x46, %g7
	sth	%l3,	[%l7 + %g7]
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x88,	%o6
	bg,a	%icc,	loop_98
	or	%i0,	%l5,	%g7
	ld	[%l7 + 0x60],	%f21
	set	0x32, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l6
loop_98:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%i5
	nop
	set	0x51, %o3
	ldstub	[%l7 + %o3],	%l1
	nop
	set	0x68, %o6
	std	%i2,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f0
	nop
	set	0x08, %i7
	std	%l4,	[%l7 + %i7]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD91, 	%tick_cmpr
	nop
	set	0x18, %g4
	swap	[%l7 + %g4],	%g2
	set	0x78, %g5
	sta	%f25,	[%l7 + %g5] 0x81
	nop
	set	0x78, %o5
	stb	%g3,	[%l7 + %o5]
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%i7
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x88,	%o4
	set	0x34, %o2
	lda	[%l7 + %o2] 0x89,	%f21
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x88,	 1
	set	0x08, %o4
	stda	%l2,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x58, %i3
	ldub	[%l7 + %i3],	%i1
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf1,	%f0
	nop
	set	0x3A, %l0
	ldstub	[%l7 + %l0],	%o2
	nop
	set	0x46, %g3
	ldsb	[%l7 + %g3],	%g4
	set	0x18, %i1
	stda	%o2,	[%l7 + %i1] 0x80
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	nop
	set	0x68, %o0
	ldsw	[%l7 + %o0],	%o7
	set	0x67, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	nop
	set	0x44, %o1
	ldstub	[%l7 + %o1],	%i2
	ba,a,pn	%icc,	loop_99
	nop
	set	0x20, %i2
	stw	%g1,	[%l7 + %i2]
	set	0x12, %i5
	stba	%o0,	[%l7 + %i5] 0xe2
	membar	#Sync
loop_99:
	nop
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0
	set	0x1A, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l3
	nop
	set	0x08, %g7
	lduw	[%l7 + %g7],	%i0
	set	0x5C, %g6
	stba	%o6,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f16
	set	0x28, %o6
	stwa	%g7,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x68, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	set	0x40, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x48, %g4
	sta	%f0,	[%l7 + %g4] 0x81
	nop
	set	0x1E, %o3
	sth	%l6,	[%l7 + %o3]
	set	0x1F, %o5
	stba	%l5,	[%l7 + %o5] 0x80
	set	0x38, %g5
	stda	%g4,	[%l7 + %g5] 0x88
	st	%f9,	[%l7 + 0x58]
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x88,	%i5
	nop
	set	0x70, %l2
	std	%f30,	[%l7 + %l2]
	set	0x7C, %g1
	swapa	[%l7 + %g1] 0x80,	%i3
	nop
	set	0x44, %o2
	sth	%l4,	[%l7 + %o2]
	nop
	set	0x10, %o4
	ldx	[%l7 + %o4],	%l1
	fpadd32	%f26,	%f30,	%f20
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%o4
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%g2
	bl,a	%xcc,	loop_100
	nop
	set	0x48, %i3
	swap	[%l7 + %i3],	%l0
	set	0x10, %i1
	stda	%g2,	[%l7 + %i1] 0x81
loop_100:
	nop
	set	0x24, %l1
	stw	%o4,	[%l7 + %l1]
	set	0x28, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i7
	fpadd32	%f18,	%f6,	%f16
	ld	[%l7 + 0x50],	%f17
	and	%i4,	%l2,	%i1
	st	%f17,	[%l7 + 0x7C]
	nop
	set	0x74, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x4C, %l4
	lduh	[%l7 + %l4],	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xe3,	%o6
	nop
	set	0x3E, %o1
	lduh	[%l7 + %o1],	%o3
	nop
	set	0x28, %i5
	stx	%i2,	[%l7 + %i5]
	nop
	set	0x7C, %i4
	stw	%i6,	[%l7 + %i4]
	set	0x30, %i2
	swapa	[%l7 + %i2] 0x80,	%g1
	nop
	set	0x0E, %g7
	sth	%o1,	[%l7 + %g7]
	nop
	set	0x30, %g6
	stx	%o0,	[%l7 + %g6]
	nop
	set	0x2C, %o7
	ldsw	[%l7 + %o7],	%l3
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xe3,	%o6
	nop
	set	0x78, %i6
	ldsh	[%l7 + %i6],	%i0
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x0C, %i7
	swap	[%l7 + %i7],	%l6
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f8
	set	0x60, %g4
	stda	%l4,	[%l7 + %g4] 0x89
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i3
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x89,	 4
	nop
	set	0x48, %g5
	ldsw	[%l7 + %g5],	%l1
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g2
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f16
	set	0x10, %l2
	stwa	%l0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f18
	nop
	set	0x1D, %i0
	ldub	[%l7 + %i0],	%g3
	st	%f9,	[%l7 + 0x78]
	st	%f31,	[%l7 + 0x48]
	nop
	set	0x4C, %l0
	ldsh	[%l7 + %l0],	%o5
	set	0x10, %o4
	stxa	%o4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x1C, %i3
	swapa	[%l7 + %i3] 0x88,	%i4
	fpsub16s	%f24,	%f25,	%f15
	set	0x24, %i1
	stha	%l2,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x5A, %g3
	lduh	[%l7 + %g3],	%i1
	nop
	set	0x58, %l1
	swap	[%l7 + %l1],	%i7
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f22
	nop
	set	0x34, %l4
	ldsw	[%l7 + %l4],	%o2
	nop
	set	0x0D, %o1
	stb	%g4,	[%l7 + %o1]
	set	0x64, %i5
	stba	%o7,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x4C, %g2
	swapa	[%l7 + %g2] 0x80,	%o3
	nop
	set	0x24, %i4
	ldsw	[%l7 + %i4],	%i2
	nop
	set	0x6D, %i2
	stb	%i6,	[%l7 + %i2]
	set	0x7D, %g6
	stba	%g1,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x10, %o7
	stxa	%g6,	[%l7 + %o7] 0xeb
	membar	#Sync
	wr	%o1,	%o0,	%softint
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd0,	%f0
	st	%f13,	[%l7 + 0x08]
	and	%l3,	%i0,	%o6
	nop
	set	0x70, %l3
	ldx	[%l7 + %l3],	%l6
	set	0x10, %i6
	prefetcha	[%l7 + %i6] 0x81,	 1
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%g7
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%l4
	bn,a	%xcc,	loop_101
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%i3
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f28
	nop
	set	0x10, %o5
	stw	%i5,	[%l7 + %o5]
loop_101:
	nop
	set	0x59, %o3
	ldsb	[%l7 + %o3],	%l1
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g3
	nop
	set	0x70, %g1
	sth	%l0,	[%l7 + %g1]
	nop
	set	0x57, %l5
	ldsb	[%l7 + %l5],	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l2
	nop
	set	0x18, %l2
	std	%f12,	[%l7 + %l2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0E9, 	%sys_tick_cmpr
	fpsub32s	%f8,	%f4,	%f5
	nop
	set	0x5C, %i0
	swap	[%l7 + %i0],	%o2
	nop
	set	0x38, %l0
	stx	%i1,	[%l7 + %l0]
	nop
	set	0x54, %o2
	ldsw	[%l7 + %o2],	%g4
	set	0x5D, %o4
	stba	%o7,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f16
	nop
	set	0x11, %g3
	ldub	[%l7 + %g3],	%o3
	st	%fsr,	[%l7 + 0x4C]
	bleu,pn	%icc,	loop_102
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%i6
	st	%fsr,	[%l7 + 0x7C]
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x89,	%i2
loop_102:
	add	%g1,	%o1,	%g6
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x80,	 1
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f10
	nop
	set	0x18, %o0
	stx	%l3,	[%l7 + %o0]
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x80,	%i0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	or	%g7,	%l5,	%i3
	nop
	set	0x1D, %i4
	ldsb	[%l7 + %i4],	%l6
	or	%l1,	%g2,	%l4
	nop
	set	0x08, %i2
	std	%f30,	[%l7 + %i2]
	nop
	set	0x0D, %g2
	ldub	[%l7 + %g2],	%i5
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x89,	%l0
	nop
	set	0x18, %g7
	lduh	[%l7 + %g7],	%g3
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%o4
	nop
	set	0x76, %i6
	lduh	[%l7 + %i6],	%o5
	nop
	set	0x26, %o6
	sth	%i4,	[%l7 + %o6]
	or	%l2,	%o2,	%i7
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x38, %o7
	stxa	%g4,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x20, %g4
	ldx	[%l7 + %g4],	%o7
	set	0x44, %o5
	stha	%o3,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x28, %i7
	stda	%i6,	[%l7 + %i7] 0x88
	set	0x36, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i2
	nop
	set	0x58, %g1
	stw	%g1,	[%l7 + %g1]
	set	0x74, %l5
	lda	[%l7 + %l5] 0x81,	%f29
	bge	%icc,	loop_103
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%o1
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x89,	%o0
loop_103:
	nop
	set	0x40, %l0
	std	%f28,	[%l7 + %l0]
	wr	%l3,	%i0,	%clear_softint
	set	0x68, %o2
	lda	[%l7 + %o2] 0x89,	%f10
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%g6
	wr	%g5,	%o6,	%sys_tick
	nop
	set	0x14, %l2
	stw	%g7,	[%l7 + %l2]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x88
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f2
	st	%f11,	[%l7 + 0x4C]
	bg,a	%icc,	loop_104
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f6
loop_104:
	nop
	set	0x35, %o1
	ldstub	[%l7 + %o1],	%i3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x81
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFD2, 	%sys_tick_cmpr
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x20, %i2
	stx	%l1,	[%l7 + %i2]
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x80,	%l4
	or	%i5,	%l0,	%g2
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x74, %g6
	lduh	[%l7 + %g6],	%g3
	fpadd16s	%f18,	%f31,	%f31
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x80,	%o4
	bne	%xcc,	loop_105
	or	%o5,	%i4,	%l2
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%o2
	set	0x30, %i6
	lda	[%l7 + %i6] 0x89,	%f5
loop_105:
	nop
	set	0x21, %g7
	ldsb	[%l7 + %g7],	%i1
	nop
	set	0x7B, %l6
	ldub	[%l7 + %l6],	%i7
	set	0x10, %o6
	stxa	%g4,	[%l7 + %o6] 0xe2
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%o3
	and	%i6,	%i2,	%g1
	add	%o0,	%o1,	%i0
	set	0x70, %g4
	stxa	%l3,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x3C, %o7
	lduw	[%l7 + %o7],	%g5
	fpadd32	%f8,	%f20,	%f2
	nop
	set	0x6E, %o5
	ldsb	[%l7 + %o5],	%o6
	nop
	set	0x72, %g5
	stb	%g6,	[%l7 + %g5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i3
	nop
	set	0x78, %i7
	ldub	[%l7 + %i7],	%l6
	nop
	set	0x40, %g1
	ldstub	[%l7 + %g1],	%l1
	set	0x20, %l5
	stda	%l4,	[%l7 + %l5] 0x81
	set	0x10, %i0
	swapa	[%l7 + %i0] 0x81,	%i5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%l4
	nop
	set	0x19, %l0
	ldub	[%l7 + %l0],	%g2
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%g3
	wr	%o5,	%i4,	%ccr
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%o4
	fpadd16	%f2,	%f4,	%f22
	nop
	set	0x68, %g3
	stb	%o2,	[%l7 + %g3]
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%l2
	nop
	set	0x5E, %l1
	sth	%i7,	[%l7 + %l1]
	nop
	set	0x4D, %i3
	ldstub	[%l7 + %i3],	%g4
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf0
	membar	#Sync
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%o7
	set	0x1B, %o0
	stba	%o3,	[%l7 + %o0] 0x88
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x88,	 2
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x80,	%i2
	wr	%g1,	%o0,	%y
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%o0
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xeb,	%i6
	nop
	set	0x15, %i5
	ldstub	[%l7 + %i5],	%i0
	set	0x38, %g6
	lda	[%l7 + %g6] 0x89,	%f3
	or	%g5,	%l3,	%g6
	nop
	set	0x44, %l3
	stb	%g7,	[%l7 + %l3]
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x80,	 2
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%o6
	nop
	set	0x5C, %o6
	sth	%l6,	[%l7 + %o6]
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x88,	 4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x53, %o7
	ldub	[%l7 + %o7],	%i5
	nop
	set	0x42, %o5
	stb	%l5,	[%l7 + %o5]
	set	0x66, %g5
	stba	%l4,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x89,	%g2
	bl	%icc,	loop_106
	nop
	set	0x3F, %g1
	ldub	[%l7 + %g1],	%g3
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f6
	ld	[%l7 + 0x14],	%f30
loop_106:
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	nop
	set	0x58, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x2C, %o3
	sth	%o4,	[%l7 + %o3]
	nop
	set	0x3C, %o2
	stw	%l0,	[%l7 + %o2]
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%f6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%o2
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xea,	%i6
	nop
	set	0x16, %l1
	sth	%o7,	[%l7 + %l1]
	and	%g4,	%i1,	%i2
	nop
	set	0x3C, %o4
	lduw	[%l7 + %o4],	%g1
	nop
	set	0x58, %i3
	ldx	[%l7 + %i3],	%o0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x89,	%o3
	set	0x37, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i6
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x88,	%f28
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f16
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f0
	st	%f31,	[%l7 + 0x40]
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 4
	set	0x68, %i5
	ldxa	[%l7 + %i5] 0x88,	%o1
	nop
	set	0x30, %l3
	std	%g4,	[%l7 + %l3]
	set	0x14, %g6
	swapa	[%l7 + %g6] 0x89,	%i0
	set	0x36, %g7
	stha	%l3,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x40, %o6
	std	%g6,	[%l7 + %o6]
	set	0x5C, %g4
	stwa	%i3,	[%l7 + %g4] 0x88
	and	%o6,	%l6,	%l1
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x89,	%g6
	nop
	set	0x28, %i6
	lduw	[%l7 + %i6],	%i5
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x88,	 4
	fpsub16s	%f5,	%f5,	%f2
	nop
	set	0x48, %l6
	std	%g2,	[%l7 + %l6]
	bg	%xcc,	loop_107
	nop
	set	0x68, %o5
	stx	%g3,	[%l7 + %o5]
	set	0x08, %g1
	stwa	%o5,	[%l7 + %g1] 0x81
loop_107:
	wr	%i4,	%o4,	%pic
	bg,a,pt	%icc,	loop_108
	nop
	set	0x10, %l5
	swap	[%l7 + %l5],	%l4
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f30
	nop
	set	0x10, %l0
	std	%l2,	[%l7 + %l0]
loop_108:
	nop
	set	0x2C, %i7
	stw	%l0,	[%l7 + %i7]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xe3,	%i6
	nop
	set	0x14, %l2
	ldsw	[%l7 + %l2],	%o2
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x80,	%g4
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x89,	%i1
	and	%g1,	%i2,	%o0
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f14
	nop
	set	0x08, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x08, %l4
	stx	%o3,	[%l7 + %l4]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f0
	nop
	set	0x10, %i4
	ldsw	[%l7 + %i4],	%i6
	nop
	set	0x36, %g2
	ldsb	[%l7 + %g2],	%g5
	nop
	set	0x58, %o1
	ldsh	[%l7 + %o1],	%i0
	nop
	set	0x45, %i2
	ldsb	[%l7 + %i2],	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%o1
	set	0x50, %i5
	sta	%f4,	[%l7 + %i5] 0x89
	set	0x24, %g6
	lda	[%l7 + %g6] 0x81,	%f9
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd0
	and	%o6,	%i3,	%l6
	add	%g6,	%i5,	%l5
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x89,	%l0
	nop
	set	0x50, %o6
	stx	%g3,	[%l7 + %o6]
	set	0x18, %o7
	stba	%g2,	[%l7 + %o7] 0x89
	nop
	set	0x12, %i6
	ldsh	[%l7 + %i6],	%i4
	ld	[%l7 + 0x74],	%f21
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc2
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f16
	nop
	set	0x41, %g1
	ldsb	[%l7 + %g1],	%o4
	nop
	set	0x50, %o5
	stx	%l4,	[%l7 + %o5]
	set	0x18, %l5
	stda	%l2,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x6E, %l0
	ldstub	[%l7 + %l0],	%l0
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x88,	%o5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f16
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x88,	 2
	nop
	nop
	setx	0xEB452B0AAFEF02E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC5255124550FEE6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f18,	%f8
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%o2
	nop
	set	0x1B, %l2
	ldstub	[%l7 + %l2],	%g4
	nop
	set	0x38, %l1
	std	%o6,	[%l7 + %l1]
	set	0x74, %o4
	stba	%i1,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x54, %g3
	swap	[%l7 + %g3],	%i2
	nop
	set	0x3C, %i3
	stw	%g1,	[%l7 + %i3]
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%o0
	fpadd32	%f6,	%f26,	%f0
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%o2
	or	%i6,	%g5,	%l3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd2,	%f16
	nop
	set	0x18, %g2
	std	%g6,	[%l7 + %g2]
	set	0x18, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o1
	nop
	set	0x18, %i2
	stw	%i0,	[%l7 + %i2]
	st	%f6,	[%l7 + 0x68]
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%o6
	set	0x66, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i3
	or	%g6,	%i5,	%l6
	set	0x18, %o1
	stda	%l4,	[%l7 + %o1] 0x89
	nop
	set	0x08, %l3
	stx	%g3,	[%l7 + %l3]
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%l1
	st	%fsr,	[%l7 + 0x20]
	set	0x68, %o7
	lda	[%l7 + %o7] 0x89,	%f5
	nop
	set	0x4C, %i6
	ldsw	[%l7 + %i6],	%i4
	set	0x5C, %o6
	swapa	[%l7 + %o6] 0x81,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%l0
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x24, %l6
	ldsw	[%l7 + %l6],	%o5
	set	0x10, %g1
	stxa	%i7,	[%l7 + %g1] 0x88
	nop
	set	0x70, %g4
	stb	%l2,	[%l7 + %g4]
	nop
	set	0x2F, %l5
	ldub	[%l7 + %l5],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%o7
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f0
	set	0x48, %i7
	sta	%f9,	[%l7 + %i7] 0x81
	set	0x28, %l0
	stxa	%i1,	[%l7 + %l0] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o0
	nop
	set	0x6C, %o2
	lduw	[%l7 + %o2],	%o3
	set	0x2C, %l2
	stwa	%i6,	[%l7 + %l2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x60, %o3
	lduw	[%l7 + %o3],	%g5
	wr	%i2,	%g7,	%clear_softint
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x89
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%l3
	nop
	set	0x30, %o4
	std	%f28,	[%l7 + %o4]
	nop
	set	0x77, %i3
	stb	%o6,	[%l7 + %i3]
	set	0x40, %i1
	stxa	%i0,	[%l7 + %i1] 0x81
	ble,a,pt	%icc,	loop_109
	nop
	set	0x48, %i4
	stx	%g6,	[%l7 + %i4]
	and	%i3,	%i5,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%g2
loop_109:
	nop
	set	0x70, %o0
	stda	%i6,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x1C, %l4
	sth	%i4,	[%l7 + %l4]
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%o4
	nop
	set	0x15, %i2
	ldsb	[%l7 + %i2],	%l1
	st	%f16,	[%l7 + 0x6C]
	nop
	set	0x7C, %i5
	lduh	[%l7 + %i5],	%l0
	bl	%xcc,	loop_110
	fpadd32	%f8,	%f6,	%f8
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%i7
loop_110:
	st	%fsr,	[%l7 + 0x48]
	set	0x18, %o1
	stba	%l2,	[%l7 + %o1] 0x88
	nop
	set	0x68, %l3
	stx	%g4,	[%l7 + %l3]
	set	0x48, %g7
	stxa	%o5,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0
	set	0x18, %i6
	swapa	[%l7 + %i6] 0x89,	%o7
	nop
	set	0x5F, %o7
	ldstub	[%l7 + %o7],	%g1
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xea,	%o0
	st	%fsr,	[%l7 + 0x68]
	ld	[%l7 + 0x78],	%f23
	nop
	set	0x1C, %o6
	swap	[%l7 + %o6],	%i1
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x78, %g4
	stxa	%i6,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x31, %g1
	stb	%o3,	[%l7 + %g1]
	set	0x40, %l5
	stwa	%g5,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x40, %o5
	stxa	%g7,	[%l7 + %o5] 0x88
	set	0x78, %i7
	stda	%i2,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x18, %l0
	lda	[%l7 + %l0] 0x89,	%f21
	nop
	set	0x30, %i0
	stw	%o1,	[%l7 + %i0]
	set	0x6B, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l3
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%g6
	set	0x1B, %l1
	stba	%i0,	[%l7 + %l1] 0x80
	set	0x40, %g3
	stda	%i2,	[%l7 + %g3] 0x81
	nop
	set	0x10, %o4
	std	%f4,	[%l7 + %o4]
	nop
	set	0x44, %i3
	ldsh	[%l7 + %i3],	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%g2
	set	0x38, %i1
	stda	%i6,	[%l7 + %i1] 0x80
	and	%i4,	%l5,	%o4
	nop
	set	0x48, %o2
	stx	%l1,	[%l7 + %o2]
	bn,a,pt	%icc,	loop_111
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x36, %o0
	lduh	[%l7 + %o0],	%l4
	set	0x50, %l4
	ldda	[%l7 + %l4] 0x81,	%l0
loop_111:
	nop
	set	0x7C, %g2
	ldsw	[%l7 + %g2],	%l2
	set	0x08, %i4
	stwa	%g4,	[%l7 + %i4] 0x81
	nop
	set	0x58, %i2
	ldsb	[%l7 + %i2],	%o5
	nop
	set	0x1C, %i5
	ldstub	[%l7 + %i5],	%o2
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%i6
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xda
	nop
	set	0x30, %l3
	lduw	[%l7 + %l3],	%o7
	set	0x20, %i6
	sta	%f21,	[%l7 + %i6] 0x89
	nop
	set	0x38, %o7
	std	%f6,	[%l7 + %o7]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf1
	membar	#Sync
	nop
	set	0x18, %g6
	ldsw	[%l7 + %g6],	%o0
	set	0x1A, %l6
	stba	%i1,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x89
	st	%fsr,	[%l7 + 0x50]
	or	%i6,	%o3,	%g5
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f22
	wr 	%g0, 	0x7, 	%fprs
	set	0x54, %o6
	sta	%f19,	[%l7 + %o6] 0x80
	nop
	set	0x09, %o5
	ldub	[%l7 + %o5],	%o1
	nop
	set	0x38, %i7
	std	%l2,	[%l7 + %i7]
	nop
	set	0x58, %l5
	swap	[%l7 + %l5],	%g7
	set	0x58, %i0
	lda	[%l7 + %i0] 0x81,	%f18
	nop
	set	0x38, %l2
	std	%g6,	[%l7 + %l2]
	set	0x67, %l0
	stba	%i0,	[%l7 + %l0] 0xea
	membar	#Sync
	add	%o6,	%i3,	%i5
	nop
	set	0x6B, %l1
	ldub	[%l7 + %l1],	%g3
	st	%fsr,	[%l7 + 0x08]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f0
	nop
	set	0x3C, %o3
	ldsw	[%l7 + %o3],	%l6
	set	0x69, %o4
	stba	%g2,	[%l7 + %o4] 0x88
	set	0x38, %i3
	stxa	%l5,	[%l7 + %i3] 0xeb
	membar	#Sync
	bleu,a	%xcc,	loop_112
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f4
	nop
	set	0x18, %o0
	stx	%o4,	[%l7 + %o0]
	add	%i4,	%l4,	%l1
loop_112:
	nop
	set	0x3C, %o2
	ldsw	[%l7 + %o2],	%l0
	nop
	set	0x28, %l4
	stx	%g4,	[%l7 + %l4]
	nop
	set	0x7E, %g2
	ldub	[%l7 + %g2],	%o5
	nop
	set	0x6A, %i2
	ldsh	[%l7 + %i2],	%l2
	wr	%i7,	%o2,	%sys_tick
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0
	set	0x7A, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i1
	set	0x3C, %i4
	stwa	%i6,	[%l7 + %i4] 0x80
	nop
	set	0x70, %g7
	std	%f28,	[%l7 + %g7]
	set	0x28, %i6
	stxa	%o3,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x35, %o7
	ldsb	[%l7 + %o7],	%o7
	nop
	set	0x4C, %l3
	lduw	[%l7 + %l3],	%g1
	and	%g5,	%i2,	%o1
	nop
	set	0x09, %g5
	ldsb	[%l7 + %g5],	%g7
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%i0
	nop
	set	0x3F, %g4
	stb	%o6,	[%l7 + %g4]
	nop
	set	0x24, %g6
	prefetch	[%l7 + %g6],	 1
	bne,a	%icc,	loop_113
	wr	%g6,	%i5,	%clear_softint
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%g2
	nop
	nop
	setx	0x40072EC96E7B2E9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD48C467EF42C7424,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f30
loop_113:
	nop
	set	0x28, %o6
	stx	%i3,	[%l7 + %o6]
	or	%l6,	%g2,	%o4
	nop
	set	0x40, %o5
	ldsb	[%l7 + %o5],	%l5
	nop
	set	0x25, %l5
	ldub	[%l7 + %l5],	%i4
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x80,	%l1
	nop
	set	0x44, %i7
	lduw	[%l7 + %i7],	%l0
	set	0x7B, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l4
	nop
	set	0x64, %l1
	stw	%o5,	[%l7 + %l1]
	nop
	set	0x78, %l0
	lduw	[%l7 + %l0],	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%o0
	nop
	set	0x4E, %g3
	sth	%i6,	[%l7 + %g3]
	fpadd32s	%f6,	%f13,	%f7
	set	0x70, %o4
	lda	[%l7 + %o4] 0x81,	%f0
	st	%f2,	[%l7 + 0x58]
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f16
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%i1
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x88,	 2
	st	%f13,	[%l7 + 0x74]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc2
	nop
	set	0x24, %l4
	lduw	[%l7 + %l4],	%o3
	set	0x27, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g5
	nop
	set	0x51, %i2
	ldub	[%l7 + %i2],	%i2
	nop
	set	0x28, %i5
	prefetch	[%l7 + %i5],	 2
	ld	[%l7 + 0x10],	%f10
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%g1
	set	0x18, %i4
	ldxa	[%l7 + %i4] 0x81,	%o1
	wr	%g7,	%i0,	%sys_tick
	nop
	set	0x46, %g7
	sth	%l3,	[%l7 + %g7]
	nop
	set	0x30, %i6
	stx	%g6,	[%l7 + %i6]
	nop
	set	0x48, %o7
	swap	[%l7 + %o7],	%o6
	set	0x20, %g2
	stda	%g2,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x64, %g5
	ldsh	[%l7 + %g5],	%i5
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%i2
	nop
	set	0x50, %g4
	stx	%l6,	[%l7 + %g4]
	set	0x50, %l3
	stxa	%o4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x18, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x73, %o6
	stba	%l5,	[%l7 + %o6] 0xea
	membar	#Sync
	fpadd16s	%f25,	%f11,	%f30
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%g2
	nop
	set	0x60, %l5
	std	%i4,	[%l7 + %l5]
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%l0
	fpsub32s	%f24,	%f8,	%f14
	fpsub16	%f12,	%f2,	%f22
	or	%l0,	%l4,	%g4
	ld	[%l7 + 0x60],	%f18
	nop
	set	0x34, %i0
	ldsw	[%l7 + %i0],	%i7
	and	%l2,	%o2,	%o0
	set	0x78, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o5
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x88,	%i6
	set	0x66, %l1
	stba	%i1,	[%l7 + %l1] 0xea
	membar	#Sync
	st	%f7,	[%l7 + 0x3C]
	nop
	set	0x58, %g3
	std	%f6,	[%l7 + %g3]
	set	0x08, %l0
	stxa	%o7,	[%l7 + %l0] 0x89
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xcc
	add	%g5,	%i2,	%o3
	nop
	set	0x60, %o4
	std	%f22,	[%l7 + %o4]
	nop
	set	0x2E, %i3
	ldsh	[%l7 + %i3],	%g1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f0
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%o1
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f8
	add	%g7,	%i0,	%l3
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%g3
	nop
	set	0x7B, %i2
	ldsb	[%l7 + %i2],	%o6
	nop
	set	0x35, %o0
	ldub	[%l7 + %o0],	%i5
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x88,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%l5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd0
	nop
	set	0x18, %i4
	ldub	[%l7 + %i4],	%l6
	set	0x60, %g7
	stba	%g2,	[%l7 + %g7] 0x89
	st	%f31,	[%l7 + 0x48]
	set	0x5C, %o7
	stwa	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x7A, %g2
	ldub	[%l7 + %g2],	%l0
	add	%l4,	%g4,	%l1
	nop
	set	0x3C, %g5
	sth	%i7,	[%l7 + %g5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%o2
	set	0x2E, %i6
	stba	%o0,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x2D, %g4
	stba	%o5,	[%l7 + %g4] 0x80
	set	0x50, %l6
	sta	%f6,	[%l7 + %l6] 0x88
	bgu,pt	%xcc,	loop_114
	nop
	set	0x41, %g6
	stb	%i1,	[%l7 + %g6]
	set	0x30, %l3
	stda	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
loop_114:
	nop
	set	0x64, %o6
	lduw	[%l7 + %o6],	%o7
	set	0x30, %o5
	stwa	%g5,	[%l7 + %o5] 0xe2
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i2
	st	%f22,	[%l7 + 0x38]
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	set	0x08, %i0
	sta	%f31,	[%l7 + %i0] 0x89
	nop
	set	0x44, %g1
	swap	[%l7 + %g1],	%o1
	wr	%g1,	%i0,	%clear_softint
	nop
	set	0x5C, %l2
	swap	[%l7 + %l2],	%g7
	nop
	set	0x28, %l1
	lduw	[%l7 + %l1],	%g6
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o6
	set	0x58, %g3
	swapa	[%l7 + %g3] 0x80,	%g3
	set	0x6C, %l0
	sta	%f7,	[%l7 + %l0] 0x88
	st	%f15,	[%l7 + 0x30]
	nop
	set	0x76, %o3
	sth	%i3,	[%l7 + %o3]
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%i5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB17, 	%tick_cmpr
	set	0x1C, %i3
	stba	%i4,	[%l7 + %i3] 0x80
	set	0x79, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%l1
	and	%g4,	%i7,	%o2
	set	0x68, %i1
	stda	%o0,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x26, %l4
	sth	%l2,	[%l7 + %l4]
	nop
	set	0x20, %i2
	std	%f16,	[%l7 + %i2]
	set	0x08, %o2
	stwa	%o5,	[%l7 + %o2] 0x81
	set	0x08, %i5
	stba	%i6,	[%l7 + %i5] 0x80
	add	%i1,	%o7,	%o3
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f0
	set	0x25, %o0
	stba	%g5,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x54, %g7
	lda	[%l7 + %g7] 0x89,	%f27
	nop
	set	0x18, %i4
	lduw	[%l7 + %i4],	%o1
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f16
	nop
	set	0x48, %g5
	std	%g0,	[%l7 + %g5]
	fpadd16	%f0,	%f24,	%f26
	nop
	set	0x10, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%i0
	nop
	set	0x66, %g2
	stb	%g7,	[%l7 + %g2]
	st	%f27,	[%l7 + 0x1C]
	nop
	set	0x78, %g6
	std	%f24,	[%l7 + %g6]
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x89,	%i2
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f6
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f30
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f0
	nop
	set	0x53, %l6
	stb	%l3,	[%l7 + %l6]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc8
	set	0x08, %g1
	swapa	[%l7 + %g1] 0x80,	%o6
	set	0x68, %l1
	stba	%g3,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x30, %g3
	sta	%f10,	[%l7 + %g3] 0x81
	nop
	set	0x1C, %l0
	ldub	[%l7 + %l0],	%i3
	nop
	set	0x70, %l2
	lduw	[%l7 + %l2],	%i5
	nop
	set	0x24, %o4
	lduh	[%l7 + %o4],	%g6
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f16
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x88,	%o4
	set	0x40, %i1
	stxa	%l6,	[%l7 + %i1] 0x80
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%g2
	nop
	set	0x18, %l4
	lduw	[%l7 + %l4],	%l4
	and	%l0,	%i4,	%g4
	st	%f8,	[%l7 + 0x74]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l1
	set	0x28, %i2
	stda	%o0,	[%l7 + %i2] 0xe3
	membar	#Sync
	be,a,pn	%xcc,	loop_115
	nop
	set	0x46, %i7
	sth	%l2,	[%l7 + %i7]
	set	0x18, %o2
	sta	%f17,	[%l7 + %o2] 0x88
loop_115:
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x4C, %i5
	stw	%o2,	[%l7 + %i5]
	set	0x58, %o0
	stwa	%i6,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x60, %o7
	stb	%o7,	[%l7 + %o7]
	nop
	set	0x78, %i4
	ldsw	[%l7 + %i4],	%i1
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f16
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x81,	%g4
	fpsub16	%f16,	%f26,	%f12
	nop
	set	0x0A, %g2
	lduh	[%l7 + %g2],	%o3
	nop
	set	0x19, %g6
	stb	%g1,	[%l7 + %g6]
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%o1
	add	%i0,	%i2,	%g7
	set	0x64, %l3
	stwa	%l3,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x70, %o5
	stxa	%g3,	[%l7 + %o5] 0x81
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f26
	nop
	set	0x54, %l5
	prefetch	[%l7 + %l5],	 4
	or	%i3,	%i5,	%g6
	nop
	set	0x0C, %l6
	swap	[%l7 + %l6],	%o4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%l6
	set	0x0F, %g1
	stba	%g2,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x28, %l1
	lduh	[%l7 + %l1],	%l5
	set	0x30, %g3
	lda	[%l7 + %g3] 0x80,	%f10
	st	%fsr,	[%l7 + 0x7C]
	set	0x50, %l0
	sta	%f21,	[%l7 + %l0] 0x88
	bg	%icc,	loop_116
	nop
	set	0x08, %l2
	std	%f22,	[%l7 + %l2]
	nop
	set	0x70, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
loop_116:
	fpsub32s	%f14,	%f13,	%f23
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xca
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x89,	 4
	nop
	set	0x50, %o3
	std	%g4,	[%l7 + %o3]
	nop
	set	0x50, %i2
	std	%i6,	[%l7 + %i2]
	nop
	set	0x20, %i7
	stw	%l4,	[%l7 + %i7]
	nop
	set	0x60, %l4
	std	%l0,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x68, %o2
	swap	[%l7 + %o2],	%l2
	ld	[%l7 + 0x60],	%f30
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%o0
	set	0x60, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i6
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x80,	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%i1
	nop
	set	0x37, %i5
	stb	%o7,	[%l7 + %i5]
	st	%f17,	[%l7 + 0x60]
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x89,	%o3
	nop
	set	0x35, %i6
	ldstub	[%l7 + %i6],	%g1
	nop
	set	0x50, %g4
	stx	%o1,	[%l7 + %g4]
	nop
	set	0x70, %o7
	std	%f10,	[%l7 + %o7]
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xeb,	%i0
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%g5
	nop
	set	0x30, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x4C, %o5
	stwa	%g7,	[%l7 + %o5] 0x89
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x80,	%l3
	nop
	set	0x58, %l5
	stb	%i2,	[%l7 + %l5]
	set	0x66, %l6
	stba	%g3,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x68, %g1
	stha	%i3,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x50, %l1
	ldsw	[%l7 + %l1],	%i5
	set	0x75, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g6
	and	%o4,	%o6,	%g2
	nop
	set	0x2A, %g3
	ldstub	[%l7 + %g3],	%l5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	nop
	set	0x24, %i0
	stw	%l6,	[%l7 + %i0]
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x89,	 2
	nop
	set	0x55, %l0
	stb	%g4,	[%l7 + %l0]
	or	%i4,	%l4,	%l1
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%i7
	st	%fsr,	[%l7 + 0x7C]
	set	0x10, %o3
	lda	[%l7 + %o3] 0x81,	%f0
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%o0
	set	0x10, %o4
	stda	%l2,	[%l7 + %o4] 0x80
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%o2
	and	%i6,	%i1,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%g1
	nop
	set	0x73, %o2
	ldstub	[%l7 + %o2],	%o1
	set	0x30, %l4
	stba	%i0,	[%l7 + %l4] 0x80
	nop
	set	0x53, %o1
	ldub	[%l7 + %o1],	%g5
	or	%g7,	%o3,	%l3
	nop
	set	0x7C, %g7
	ldstub	[%l7 + %g7],	%i2
	nop
	set	0x0F, %i5
	stb	%i3,	[%l7 + %i5]
	ld	[%l7 + 0x78],	%f23
	and	%g3,	%g6,	%o4
	ld	[%l7 + 0x1C],	%f19
	nop
	set	0x22, %i4
	ldsh	[%l7 + %i4],	%i5
	set	0x60, %i6
	stwa	%g2,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x30, %g4
	std	%f6,	[%l7 + %g4]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xc0
	nop
	set	0x5A, %g6
	stb	%o6,	[%l7 + %g6]
	nop
	set	0x74, %o0
	ldstub	[%l7 + %o0],	%l6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f16
	and	%l5,	%g4,	%l0
	set	0x1C, %l3
	stwa	%i4,	[%l7 + %l3] 0x81
	set	0x44, %l5
	lda	[%l7 + %l5] 0x88,	%f21
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f16
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%l0
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x89,	%l4
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x5C, %g3
	ldub	[%l7 + %g3],	%i7
	ld	[%l7 + 0x54],	%f28
	fpsub16s	%f27,	%f23,	%f22
	ld	[%l7 + 0x44],	%f12
	add	%o0,	%o2,	%l2
	nop
	set	0x28, %l2
	std	%i6,	[%l7 + %l2]
	st	%f21,	[%l7 + 0x74]
	add	%o5,	%o7,	%g1
	nop
	set	0x18, %l1
	lduh	[%l7 + %l1],	%o1
	nop
	set	0x2E, %i3
	lduh	[%l7 + %i3],	%i1
	set	0x53, %l0
	ldstuba	[%l7 + %l0] 0x89,	%i0
	nop
	set	0x4A, %i1
	lduh	[%l7 + %i1],	%g7
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%o3
	set	0x28, %i2
	stxa	%g5,	[%l7 + %i2] 0x81
	nop
	set	0x08, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x44, %o4
	sth	%l3,	[%l7 + %o4]
	set	0x7C, %i7
	stwa	%i3,	[%l7 + %i7] 0x80
	set	0x67, %l4
	stba	%i2,	[%l7 + %l4] 0x89
	ld	[%l7 + 0x2C],	%f11
	nop
	set	0x5E, %o1
	stb	%g6,	[%l7 + %o1]
	or	%o4,	%g3,	%g2
	set	0x40, %o2
	prefetcha	[%l7 + %o2] 0x80,	 2
	nop
	set	0x66, %i5
	stb	%i5,	[%l7 + %i5]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	nop
	set	0x2B, %g7
	ldub	[%l7 + %g7],	%l6
	set	0x2B, %i6
	stba	%l5,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x49, %o7
	stba	%g4,	[%l7 + %o7] 0x89
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l4
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%i7
	nop
	set	0x60, %g4
	lduw	[%l7 + %g4],	%l1
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f14
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%o2
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%o0
	nop
	set	0x70, %o6
	std	%f8,	[%l7 + %o6]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i6
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%o5
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%g0
	nop
	set	0x79, %g5
	ldsb	[%l7 + %g5],	%o7
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	nop
	set	0x60, %l2
	swap	[%l7 + %l2],	%i1
	and	%o1,	%i0,	%o3
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x88,	%g4
	nop
	set	0x5E, %g3
	ldstub	[%l7 + %g3],	%l3
	st	%f17,	[%l7 + 0x28]
	set	0x08, %i3
	sta	%f1,	[%l7 + %i3] 0x81
	set	0x68, %i1
	stda	%i2,	[%l7 + %i1] 0x81
	set	0x70, %l0
	swapa	[%l7 + %l0] 0x80,	%i2
	set	0x64, %i0
	stwa	%g6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x79, %o3
	ldub	[%l7 + %o3],	%g7
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%o4
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x4C, %i2
	stwa	%g3,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x30, %l4
	std	%o6,	[%l7 + %l4]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%l6
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%l4
	add	%g4,	%g2,	%l0
	set	0x1A, %i5
	stba	%l4,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x81,	%i7
	or	%i4,	%l1,	%o2
	nop
	set	0x50, %o1
	std	%f20,	[%l7 + %o1]
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%o0
	nop
	set	0x74, %i6
	stb	%l2,	[%l7 + %i6]
	wr	%o5,	%g1,	%sys_tick
	nop
	set	0x7B, %g6
	ldstub	[%l7 + %g6],	%o7
	set	0x48, %o0
	stba	%i6,	[%l7 + %o0] 0x81
	nop
	set	0x60, %g4
	ldsw	[%l7 + %g4],	%o1
	nop
	set	0x3A, %o7
	sth	%i1,	[%l7 + %o7]
	set	0x50, %l3
	stwa	%i0,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%o3
	nop
	set	0x1E, %o6
	ldsb	[%l7 + %o6],	%g5
	and	%i3,	%l3,	%g6
	nop
	nop
	setx	0x9BD7D0A2C6081B02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8D2FC31031A1FBA3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f8,	%f14
	nop
	set	0x30, %g2
	std	%f0,	[%l7 + %g2]
	ble,a,pt	%icc,	loop_117
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%f12
	st	%f7,	[%l7 + 0x58]
	st	%f7,	[%l7 + 0x60]
loop_117:
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f16
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%g7
	set	0x08, %l2
	stda	%o4,	[%l7 + %l2] 0xea
	membar	#Sync
	or	%g3,	%i2,	%o6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%l5
	nop
	set	0x1C, %l1
	swap	[%l7 + %l1],	%g4
	ld	[%l7 + 0x40],	%f15
	nop
	set	0x10, %g3
	std	%f24,	[%l7 + %g3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%l0
	nop
	set	0x2D, %i3
	ldsb	[%l7 + %i3],	%i5
	nop
	set	0x4D, %l0
	ldstub	[%l7 + %l0],	%l4
	fpadd32	%f8,	%f20,	%f8
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%i6
	st	%f29,	[%l7 + 0x54]
	nop
	set	0x44, %o3
	lduh	[%l7 + %o3],	%i4
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%o2
	ld	[%l7 + 0x64],	%f9
	nop
	set	0x5F, %i7
	ldub	[%l7 + %i7],	%o0
	nop
	set	0x20, %i1
	std	%l0,	[%l7 + %i1]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f0
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f2
	fpsub16s	%f27,	%f17,	%f21
	fpadd32s	%f8,	%f18,	%f6
	st	%f30,	[%l7 + 0x2C]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	nop
	set	0x0C, %i4
	ldsb	[%l7 + %i4],	%o5
	or	%g1,	%o7,	%l2
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x88,	%i6
	st	%f29,	[%l7 + 0x48]
	set	0x14, %o1
	swapa	[%l7 + %o1] 0x89,	%o1
	nop
	set	0x10, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x3D, %g6
	stba	%i1,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x1E, %o0
	stba	%i0,	[%l7 + %o0] 0x81
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%o3
	ld	[%l7 + 0x24],	%f14
	set	0x24, %g7
	stha	%i3,	[%l7 + %g7] 0x89
	nop
	set	0x67, %o7
	ldsb	[%l7 + %o7],	%l3
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	and	%o4,	%g3,	%i2
	nop
	set	0x5C, %o5
	swap	[%l7 + %o5],	%o6
	set	0x58, %g4
	stda	%g6,	[%l7 + %g4] 0x80
	ld	[%l7 + 0x2C],	%f27
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xd0
	nop
	set	0x40, %o6
	stx	%l6,	[%l7 + %o6]
	nop
	set	0x44, %g5
	stw	%l5,	[%l7 + %g5]
	set	0x70, %g1
	swapa	[%l7 + %g1] 0x89,	%g2
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x89,	 2
	nop
	set	0x2C, %l1
	sth	%i5,	[%l7 + %l1]
	or	%g4,	%i7,	%i4
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%l4
	and	%o2,	%o0,	%o5
	nop
	set	0x36, %i3
	ldsb	[%l7 + %i3],	%l1
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f26
	nop
	set	0x21, %i0
	stb	%o7,	[%l7 + %i0]
	nop
	nop
	setx	0xA80CB4905E022E46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC7E3F16F01201931,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f30,	%f24
	nop
	set	0x2E, %g3
	sth	%l2,	[%l7 + %g3]
	set	0x18, %o4
	stha	%i6,	[%l7 + %o4] 0x81
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f28
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x88,	 2
	set	0x30, %l4
	stxa	%i1,	[%l7 + %l4] 0xe3
	membar	#Sync
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%g5
	nop
	set	0x08, %i7
	sth	%o3,	[%l7 + %i7]
	set	0x7C, %i5
	sta	%f5,	[%l7 + %i5] 0x88
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x89,	%i0
	nop
	set	0x0A, %o2
	ldub	[%l7 + %o2],	%i3
	nop
	set	0x4C, %o1
	sth	%g6,	[%l7 + %o1]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xea,	%o4
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x88,	%l2
	nop
	set	0x30, %o0
	swap	[%l7 + %o0],	%g3
	set	0x28, %o7
	stwa	%o6,	[%l7 + %o7] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x58, %g7
	swap	[%l7 + %g7],	%g7
	nop
	set	0x38, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x5F, %g4
	ldsb	[%l7 + %g4],	%i2
	nop
	set	0x54, %o5
	ldsw	[%l7 + %o5],	%l5
	nop
	set	0x0C, %l5
	ldsw	[%l7 + %l5],	%g2
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f30
	nop
	set	0x14, %g2
	ldsh	[%l7 + %g2],	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i5
	set	0x28, %g5
	sta	%f3,	[%l7 + %g5] 0x80
	set	0x10, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g4
	or	%i4,	%l4,	%o2
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf0
	membar	#Sync
	nop
	set	0x08, %l2
	lduh	[%l7 + %l2],	%o0
	set	0x50, %l6
	stwa	%i7,	[%l7 + %l6] 0x80
	fpadd16	%f0,	%f28,	%f8
	set	0x40, %i3
	sta	%f27,	[%l7 + %i3] 0x81
	nop
	set	0x58, %l0
	lduh	[%l7 + %l0],	%o5
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%f6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%o7
	set	0x38, %i0
	ldxa	[%l7 + %i0] 0x89,	%i6
	fpsub16s	%f11,	%f14,	%f17
	set	0x79, %o4
	ldstuba	[%l7 + %o4] 0x81,	%l2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc0
	nop
	set	0x6A, %l4
	sth	%i1,	[%l7 + %l4]
	set	0x5B, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g1
	nop
	set	0x19, %i7
	stb	%g5,	[%l7 + %i7]
	nop
	set	0x54, %i4
	ldub	[%l7 + %i4],	%o1
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xe2,	%o2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xcc
	nop
	set	0x44, %i2
	swap	[%l7 + %i2],	%i3
	nop
	set	0x08, %o1
	swap	[%l7 + %o1],	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%l3
	set	0x20, %g6
	stha	%g3,	[%l7 + %g6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x70],	%f14
	or	%o4,	%g7,	%i2
	nop
	set	0x28, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%o6,	%g2,	%l5
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%i6
	or	%i5,	%g4,	%i4
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	ld	[%l7 + 0x2C],	%f27
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%l4
	st	%f18,	[%l7 + 0x60]
	nop
	set	0x2C, %l3
	ldsw	[%l7 + %l3],	%o0
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%i6
	set	0x4E, %o5
	stha	%o5,	[%l7 + %o5] 0x80
	set	0x40, %l5
	sta	%f21,	[%l7 + %l5] 0x89
	ld	[%l7 + 0x50],	%f15
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%o2
	set	0x50, %o6
	stwa	%o7,	[%l7 + %o6] 0x81
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%l1
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xd0
	nop
	set	0x47, %l2
	stb	%i1,	[%l7 + %l2]
	st	%f15,	[%l7 + 0x14]
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%i6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%g4
	nop
	set	0x62, %l0
	ldstub	[%l7 + %l0],	%o1
	set	0x68, %g3
	stxa	%g1,	[%l7 + %g3] 0x80
	set	0x1C, %l6
	swapa	[%l7 + %l6] 0x88,	%o3
	nop
	nop
	setx	0xFE23C2BB4E186EAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD6DD116D85920335,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f0,	%f2
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%i3
	nop
	set	0x08, %o4
	ldsw	[%l7 + %o4],	%g6
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%l3
	nop
	set	0x49, %i1
	ldub	[%l7 + %i1],	%i0
	set	0x70, %i7
	stda	%g2,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x30, %o3
	stda	%g6,	[%l7 + %o3] 0x80
	set	0x50, %i4
	stda	%i2,	[%l7 + %i4] 0x89
	nop
	set	0x46, %o2
	ldstub	[%l7 + %o2],	%o6
	or	%o4,	%l5,	%l6
	set	0x50, %i5
	swapa	[%l7 + %i5] 0x80,	%g2
	set	0x1C, %o1
	stwa	%i5,	[%l7 + %o1] 0x88
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%i4
	bg,a,pt	%icc,	loop_118
	nop
	set	0x10, %g6
	stw	%g4,	[%l7 + %g6]
	set	0x5C, %o7
	swapa	[%l7 + %o7] 0x80,	%l0
loop_118:
	or	%o0,	%l4,	%o5
	set	0x44, %o0
	sta	%f23,	[%l7 + %o0] 0x88
	fpadd32s	%f19,	%f6,	%f24
	set	0x78, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	nop
	set	0x18, %i6
	lduh	[%l7 + %i6],	%i7
	set	0x5C, %g7
	stwa	%l1,	[%l7 + %g7] 0x81
	nop
	set	0x33, %o5
	stb	%l2,	[%l7 + %o5]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f6
	nop
	set	0x78, %g4
	std	%o6,	[%l7 + %g4]
	nop
	set	0x40, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x28, %o6
	ldsh	[%l7 + %o6],	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%o1
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%g1
	ld	[%l7 + 0x08],	%f2
	add	%o3,	%i3,	%l3
	nop
	set	0x39, %l1
	ldstub	[%l7 + %l1],	%i0
	set	0x08, %l2
	lda	[%l7 + %l2] 0x81,	%f15
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x2C, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x19, %l6
	ldsb	[%l7 + %l6],	%g3
	nop
	set	0x34, %i0
	lduw	[%l7 + %i0],	%g7
	fpsub16s	%f30,	%f24,	%f17
	st	%f24,	[%l7 + 0x64]
	set	0x70, %g3
	swapa	[%l7 + %g3] 0x81,	%g6
	set	0x40, %o4
	stxa	%i2,	[%l7 + %o4] 0xeb
	membar	#Sync
	fpsub32s	%f16,	%f16,	%f10
	set	0x50, %l4
	stha	%o4,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x64, %i7
	ldsh	[%l7 + %i7],	%o6
	set	0x78, %o3
	lda	[%l7 + %o3] 0x81,	%f20
	wr	%l5,	%g2,	%pic
	nop
	set	0x40, %i4
	std	%f30,	[%l7 + %i4]
	nop
	set	0x5C, %i1
	ldsw	[%l7 + %i1],	%i5
	nop
	set	0x2C, %i5
	ldsw	[%l7 + %i5],	%l6
	nop
	set	0x6C, %o2
	swap	[%l7 + %o2],	%g4
	nop
	set	0x20, %o1
	stx	%i4,	[%l7 + %o1]
	nop
	set	0x0D, %i2
	ldub	[%l7 + %i2],	%l0
	add	%o0,	%l4,	%o5
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
	set	0x7C, %o0
	lda	[%l7 + %o0] 0x88,	%f29
	set	0x14, %l3
	stwa	%i7,	[%l7 + %l3] 0x81
	nop
	set	0x7A, %i6
	ldsh	[%l7 + %i6],	%l1
	set	0x3D, %g6
	stba	%l2,	[%l7 + %g6] 0x88
	nop
	set	0x3A, %g7
	ldsb	[%l7 + %g7],	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%i1
	nop
	set	0x38, %o5
	std	%f12,	[%l7 + %o5]
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x88,	%g5
	nop
	set	0x28, %g2
	std	%o0,	[%l7 + %g2]
	set	0x14, %l5
	lda	[%l7 + %l5] 0x81,	%f1
	nop
	set	0x48, %g5
	std	%o2,	[%l7 + %g5]
	set	0x68, %l1
	swapa	[%l7 + %l1] 0x89,	%i3
	or	%l3,	%i0,	%g3
	set	0x08, %o6
	stxa	%g7,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x40, %l2
	stda	%g0,	[%l7 + %l2] 0x80
	nop
	set	0x77, %g1
	ldsb	[%l7 + %g1],	%i2
	wr	%g6,	%o4,	%pic
	nop
	set	0x18, %i3
	ldstub	[%l7 + %i3],	%o6
	nop
	set	0x7C, %l0
	stw	%g2,	[%l7 + %l0]
	nop
	set	0x58, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x2C, %l6
	ldsw	[%l7 + %l6],	%l5
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%l6
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f16
	nop
	set	0x48, %i7
	ldsw	[%l7 + %i7],	%i5
	nop
	set	0x7E, %l4
	lduh	[%l7 + %l4],	%g4
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o0
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f0
	be,a,pt	%xcc,	loop_119
	nop
	set	0x1E, %i5
	ldub	[%l7 + %i5],	%l4
	nop
	set	0x0F, %i1
	stb	%o2,	[%l7 + %i1]
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%i6
loop_119:
	nop
	set	0x08, %i2
	stxa	%o5,	[%l7 + %i2] 0xe2
	membar	#Sync
	bne,a	%xcc,	loop_120
	nop
	set	0x14, %o2
	ldsw	[%l7 + %o2],	%l1
	nop
	set	0x64, %o0
	lduw	[%l7 + %o0],	%l2
	and	%i6,	%o7,	%i1
loop_120:
	nop
	set	0x1A, %o7
	ldsh	[%l7 + %o7],	%g5
	set	0x26, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o3
	fpsub16s	%f8,	%f15,	%f15
	set	0x0F, %i6
	stba	%i3,	[%l7 + %i6] 0x88
	nop
	set	0x3C, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x88,	%o0
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xeb,	%i0
	set	0x3C, %l5
	lda	[%l7 + %l5] 0x88,	%f16
	nop
	set	0x58, %g5
	std	%g2,	[%l7 + %g5]
	set	0x10, %g2
	swapa	[%l7 + %g2] 0x80,	%g7
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%l3
	or	%i2,	%g6,	%o4
	nop
	set	0x38, %l2
	stw	%o6,	[%l7 + %l2]
	nop
	set	0x20, %g1
	std	%g0,	[%l7 + %g1]
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%l5
	set	0x32, %l0
	stha	%l6,	[%l7 + %l0] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i5
	nop
	set	0x38, %i0
	ldstub	[%l7 + %i0],	%l0
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%i4
	nop
	set	0x68, %i3
	sth	%o2,	[%l7 + %i3]
	add	%l4,	%o5,	%i7
	nop
	set	0x48, %o4
	std	%f28,	[%l7 + %o4]
	set	0x6C, %i7
	lda	[%l7 + %i7] 0x89,	%f18
	nop
	set	0x53, %l4
	ldstub	[%l7 + %l4],	%l2
	nop
	set	0x08, %i4
	std	%f18,	[%l7 + %i4]
	nop
	set	0x74, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x6E, %g3
	ldsb	[%l7 + %g3],	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%i1
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f8
	nop
	set	0x3B, %i5
	ldub	[%l7 + %i5],	%g5
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%o3
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%l1
	set	0x1F, %o1
	stba	%i3,	[%l7 + %o1] 0xe2
	membar	#Sync
	wr	%i0,	%o1,	%clear_softint
	set	0x40, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g3
	set	0x70, %l3
	stda	%l2,	[%l7 + %l3] 0x89
	set	0x0C, %o0
	sta	%f30,	[%l7 + %o0] 0x89
	st	%f13,	[%l7 + 0x18]
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x48, %g6
	swapa	[%l7 + %g6] 0x88,	%g7
	nop
	set	0x38, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x58, %o5
	stxa	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	fpsub16	%f20,	%f12,	%f30
	nop
	set	0x69, %g7
	ldub	[%l7 + %g7],	%o4
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	nop
	set	0x30, %l5
	std	%o6,	[%l7 + %l5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%l5
	set	0x14, %o6
	ldstuba	[%l7 + %o6] 0x89,	%g1
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%g2
	set	0x28, %g1
	sta	%f10,	[%l7 + %g1] 0x88
	nop
	set	0x25, %l2
	stb	%l6,	[%l7 + %l2]
	nop
	set	0x08, %l0
	std	%i4,	[%l7 + %l0]
	wr	%l0,	%o0,	%sys_tick
	nop
	set	0x57, %l1
	ldub	[%l7 + %l1],	%i4
	nop
	set	0x5C, %l6
	ldsh	[%l7 + %l6],	%g4
	nop
	set	0x20, %i3
	prefetch	[%l7 + %i3],	 3
	wr 	%g0, 	0x4, 	%fprs
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x14, %o4
	swap	[%l7 + %o4],	%i7
	set	0x15, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i6
	nop
	set	0x18, %i0
	std	%f10,	[%l7 + %i0]
	ld	[%l7 + 0x78],	%f24
	nop
	set	0x16, %l4
	ldsb	[%l7 + %l4],	%o7
	set	0x34, %o3
	swapa	[%l7 + %o3] 0x81,	%i1
	nop
	set	0x64, %g3
	ldsb	[%l7 + %g3],	%g5
	set	0x64, %i1
	swapa	[%l7 + %i1] 0x80,	%o3
	nop
	set	0x53, %i4
	ldub	[%l7 + %i4],	%i3
	and	%l1,	%i0,	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%g7
	set	0x58, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i2
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x08, %i5
	std	%o4,	[%l7 + %i5]
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x88,	%o6
	st	%f12,	[%l7 + 0x74]
	set	0x40, %l3
	lda	[%l7 + %l3] 0x81,	%f2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%l5
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%l3
	nop
	set	0x34, %i6
	ldub	[%l7 + %i6],	%g2
	nop
	set	0x48, %o7
	lduw	[%l7 + %o7],	%g1
	nop
	set	0x27, %g4
	stb	%l6,	[%l7 + %g4]
	nop
	set	0x5C, %o5
	stb	%l0,	[%l7 + %o5]
	wr	%i5,	%o0,	%y
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	set	0x40, %g7
	stha	%g4,	[%l7 + %g7] 0x89
	ld	[%l7 + 0x50],	%f22
	nop
	set	0x28, %g5
	ldsw	[%l7 + %g5],	%o2
	st	%f11,	[%l7 + 0x7C]
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x88,	%o5
	bgu,a	%xcc,	loop_121
	nop
	set	0x4A, %o6
	ldsh	[%l7 + %o6],	%l2
	nop
	set	0x43, %g2
	stb	%l4,	[%l7 + %g2]
	st	%f1,	[%l7 + 0x1C]
loop_121:
	nop
	set	0x60, %g1
	stda	%i6,	[%l7 + %g1] 0x80
	or	%o7,	%i7,	%i1
	fpadd16s	%f3,	%f26,	%f11
	wr	%o3,	%i3,	%set_softint
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x88,	%f17
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x81,	%g5
	st	%f14,	[%l7 + 0x10]
	and	%i0,	%o1,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i2
	nop
	set	0x6C, %l6
	sth	%o4,	[%l7 + %l6]
	nop
	set	0x50, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x48, %l0
	ldsh	[%l7 + %l0],	%l1
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f16
	nop
	set	0x64, %i0
	stw	%l5,	[%l7 + %i0]
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%g6
	set	0x74, %l4
	swapa	[%l7 + %l4] 0x88,	%l3
	nop
	set	0x78, %g3
	std	%f22,	[%l7 + %g3]
	and	%g1,	%l6,	%g2
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x58, %o3
	std	%f14,	[%l7 + %o3]
	ld	[%l7 + 0x40],	%f20
	set	0x40, %i1
	stxa	%o0,	[%l7 + %i1] 0x80
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x81,	%i4
	set	0x48, %i2
	stxa	%g4,	[%l7 + %i2] 0xeb
	membar	#Sync
	fpsub16s	%f3,	%f18,	%f9
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x80,	%o2
	fpsub32	%f24,	%f28,	%f2
	nop
	set	0x54, %i5
	ldub	[%l7 + %i5],	%l2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xd2
	nop
	set	0x64, %o0
	sth	%l4,	[%l7 + %o0]
	add	%o5,	%o7,	%i7
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x81,	%i0
	fpsub16	%f16,	%f28,	%f6
	set	0x0F, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o3
	nop
	set	0x30, %g4
	stx	%i6,	[%l7 + %g4]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%i2
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f30
	add	%i0,	%o1,	%g5
	st	%f31,	[%l7 + 0x48]
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%g3
	nop
	set	0x30, %g5
	std	%f22,	[%l7 + %g5]
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x58, %o6
	sta	%f2,	[%l7 + %o6] 0x88
	add	%i2,	%o4,	%g7
	set	0x64, %l5
	sta	%f31,	[%l7 + %l5] 0x81
	nop
	set	0x38, %g1
	lduw	[%l7 + %g1],	%l1
	st	%f13,	[%l7 + 0x10]
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%o6
	nop
	set	0x16, %l2
	stb	%l5,	[%l7 + %l2]
	nop
	set	0x64, %l6
	prefetch	[%l7 + %l6],	 2
	set	0x58, %i3
	lda	[%l7 + %i3] 0x88,	%f27
	nop
	set	0x0E, %l0
	sth	%g6,	[%l7 + %l0]
	or	%l3,	%g1,	%g2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i5
	add	%l0,	%o0,	%g4
	nop
	set	0x75, %o4
	stb	%i4,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x70, %l1
	ldsb	[%l7 + %l1],	%l2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%o2
	st	%f24,	[%l7 + 0x2C]
	nop
	set	0x7C, %g3
	stb	%l4,	[%l7 + %g3]
	nop
	set	0x28, %i7
	std	%o4,	[%l7 + %i7]
	or	%o7,	%i1,	%i7
	set	0x30, %o3
	ldxa	[%l7 + %o3] 0x80,	%o3
	set	0x67, %i4
	stba	%i3,	[%l7 + %i4] 0x81
	add	%i0,	%o1,	%i6
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf0
	membar	#Sync
	or	%g5,	%g3,	%o4
	set	0x30, %o2
	stxa	%g7,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x71, %i5
	ldstub	[%l7 + %i5],	%l1
	nop
	set	0x08, %i2
	stw	%i2,	[%l7 + %i2]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd2
	nop
	set	0x48, %o1
	std	%l4,	[%l7 + %o1]
	set	0x2C, %i6
	lda	[%l7 + %i6] 0x81,	%f23
	set	0x50, %l3
	stda	%g6,	[%l7 + %l3] 0x89
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%o6
	bl,a	%icc,	loop_122
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x4C]
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x88,	%l2
loop_122:
	nop
	set	0x24, %g5
	ldsh	[%l7 + %g5],	%g2
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%g1
	nop
	set	0x65, %o6
	ldsb	[%l7 + %o6],	%i5
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x80,	%l0
	nop
	set	0x53, %g6
	ldub	[%l7 + %g6],	%o0
	set	0x68, %g2
	stwa	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x58, %g1
	swap	[%l7 + %g1],	%l6
	nop
	set	0x56, %l6
	ldstub	[%l7 + %l6],	%l2
	nop
	set	0x50, %i3
	ldx	[%l7 + %i3],	%i4
	set	0x30, %l2
	swapa	[%l7 + %l2] 0x81,	%l4
	nop
	set	0x48, %o4
	prefetch	[%l7 + %o4],	 1
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	nop
	set	0x74, %i0
	lduw	[%l7 + %i0],	%o7
	or	%i1,	%i7,	%o3
	set	0x0E, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o5
	and	%i0,	%i3,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%g3
	ld	[%l7 + 0x68],	%f8
	or	%o4,	%g7,	%g5
	set	0x18, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l1
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%l5
	nop
	set	0x78, %o3
	ldsw	[%l7 + %o3],	%i2
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%g6
	st	%f24,	[%l7 + 0x58]
	nop
	set	0x6D, %i1
	ldsb	[%l7 + %i1],	%o6
	and	%l3,	%g2,	%i5
	add	%l0,	%g1,	%o0
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%g4
	nop
	set	0x5A, %o2
	lduh	[%l7 + %o2],	%l2
	set	0x54, %i2
	swapa	[%l7 + %i2] 0x89,	%l6
	nop
	set	0x20, %o0
	stx	%i4,	[%l7 + %o0]
	set	0x10, %o1
	stxa	%l4,	[%l7 + %o1] 0x88
	set	0x69, %i5
	stba	%o2,	[%l7 + %i5] 0x89
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i1
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f12
	set	0x24, %i6
	lda	[%l7 + %i6] 0x81,	%f4
	st	%f11,	[%l7 + 0x7C]
	set	0x1A, %g7
	stha	%i7,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x4D, %o5
	ldstub	[%l7 + %o5],	%o7
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%f16
	st	%f4,	[%l7 + 0x34]
	nop
	set	0x28, %o7
	ldsb	[%l7 + %o7],	%o5
	st	%f6,	[%l7 + 0x70]
	nop
	set	0x60, %o6
	stx	%i0,	[%l7 + %o6]
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%o2
	nop
	set	0x70, %l5
	std	%i2,	[%l7 + %l5]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%g3
	st	%fsr,	[%l7 + 0x30]
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x88,	%o4
	st	%f19,	[%l7 + 0x5C]
	nop
	set	0x28, %g2
	std	%f22,	[%l7 + %g2]
	nop
	set	0x08, %l6
	swap	[%l7 + %l6],	%g7
	nop
	set	0x64, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x70, %l2
	stx	%g5,	[%l7 + %l2]
	nop
	set	0x70, %o4
	lduw	[%l7 + %o4],	%l1
	set	0x60, %l1
	stda	%i6,	[%l7 + %l1] 0x81
	nop
	set	0x39, %i0
	stb	%i2,	[%l7 + %i0]
	nop
	set	0x0C, %g3
	sth	%g6,	[%l7 + %g3]
	set	0x44, %l4
	sta	%f1,	[%l7 + %l4] 0x88
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xeb,	%l4
	nop
	set	0x68, %i7
	std	%f18,	[%l7 + %i7]
	set	0x16, %i1
	stha	%o6,	[%l7 + %i1] 0x88
	nop
	set	0x48, %o3
	ldstub	[%l7 + %o3],	%g2
	nop
	set	0x2C, %i4
	ldsh	[%l7 + %i4],	%l3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%i5
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f0
	nop
	set	0x78, %i2
	ldstub	[%l7 + %i2],	%g1
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%g4
	nop
	set	0x50, %l3
	std	%i6,	[%l7 + %l3]
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f0
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	set	0x50, %i6
	stwa	%i4,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc2
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%o2
	nop
	set	0x28, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%i1
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%i7
	set	0x58, %l5
	lda	[%l7 + %l5] 0x89,	%f21
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f16
	nop
	set	0x1C, %g6
	ldsw	[%l7 + %g6],	%l4
	nop
	set	0x62, %l6
	ldsb	[%l7 + %l6],	%o5
	set	0x70, %i3
	stxa	%i0,	[%l7 + %i3] 0x81
	ld	[%l7 + 0x3C],	%f3
	nop
	set	0x4E, %g2
	lduh	[%l7 + %g2],	%o7
	nop
	set	0x08, %o4
	stx	%o3,	[%l7 + %o4]
	set	0x1C, %l1
	swapa	[%l7 + %l1] 0x88,	%o1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xea,	%g2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f16
	set	0x46, %l4
	stba	%o4,	[%l7 + %l4] 0x89
	set	0x08, %l0
	stha	%g7,	[%l7 + %l0] 0x88
	nop
	set	0x78, %i7
	lduw	[%l7 + %i7],	%i3
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x81,	%l1
	add	%g5,	%i2,	%i6
	set	0x78, %i1
	stxa	%g6,	[%l7 + %i1] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%l5
	set	0x18, %i4
	stda	%g2,	[%l7 + %i4] 0xea
	membar	#Sync
	and	%l3,	%l0,	%i5
	nop
	set	0x7E, %o2
	ldub	[%l7 + %o2],	%g1
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f16
	nop
	set	0x38, %i2
	std	%i6,	[%l7 + %i2]
	nop
	set	0x48, %o1
	std	%f28,	[%l7 + %o1]
	nop
	set	0x20, %g4
	swap	[%l7 + %g4],	%l2
	or	%i4,	%o2,	%i1
	nop
	set	0x64, %i6
	lduw	[%l7 + %i6],	%i7
	set	0x5A, %g7
	stha	%l4,	[%l7 + %g7] 0x81
	st	%fsr,	[%l7 + 0x50]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	nop
	set	0x08, %l3
	std	%o0,	[%l7 + %l3]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%o7
	set	0x3A, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i0
	nop
	set	0x48, %o7
	std	%f22,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x24]
	bge,a	%icc,	loop_123
	st	%fsr,	[%l7 + 0x68]
	set	0x38, %l5
	stxa	%o3,	[%l7 + %l5] 0x88
loop_123:
	or	%g3,	%o4,	%o1
	and	%g7,	%l1,	%g5
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%i2
	nop
	set	0x2E, %l6
	ldub	[%l7 + %l6],	%i3
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%g6
	set	0x6B, %g2
	stba	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x22, %o4
	sth	%l5,	[%l7 + %o4]
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x34, %i0
	lduh	[%l7 + %i0],	%g2
	fpadd32	%f6,	%f0,	%f8
	nop
	set	0x18, %l1
	std	%f8,	[%l7 + %l1]
	set	0x5C, %l2
	sta	%f8,	[%l7 + %l2] 0x80
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%i5
	nop
	set	0x4C, %l4
	ldsw	[%l7 + %l4],	%g1
	nop
	set	0x4D, %l0
	ldsb	[%l7 + %l0],	%g4
	add	%l0,	%l2,	%l6
	ld	[%l7 + 0x44],	%f21
	add	%o2,	%i4,	%i1
	nop
	set	0x4C, %i7
	ldsh	[%l7 + %i7],	%l4
	nop
	set	0x64, %o3
	ldsw	[%l7 + %o3],	%i7
	nop
	set	0x38, %i1
	stx	%fsr,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f0
	nop
	set	0x18, %o0
	ldsh	[%l7 + %o0],	%o0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	set	0x18, %i2
	swapa	[%l7 + %i2] 0x80,	%o5
	nop
	set	0x70, %o1
	prefetch	[%l7 + %o1],	 3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
	set	0x78, %g4
	sta	%f2,	[%l7 + %g4] 0x80
	nop
	set	0x0A, %i6
	ldsh	[%l7 + %i6],	%i0
	and	%o7,	%o3,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g7
	bleu	%xcc,	loop_124
	nop
	set	0x48, %g7
	stw	%g3,	[%l7 + %g7]
	set	0x08, %l3
	swapa	[%l7 + %l3] 0x80,	%l1
loop_124:
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x48, %g5
	stx	%i2,	[%l7 + %g5]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%g6
	nop
	nop
	setx	0xF860CDC73550FF85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6371118890769918,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f2,	%f20
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%l5
	set	0x2A, %o6
	stha	%g2,	[%l7 + %o6] 0x88
	nop
	set	0x08, %o7
	std	%o6,	[%l7 + %o7]
	nop
	set	0x18, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x16, %l5
	ldstuba	[%l7 + %l5] 0x81,	%l3
	nop
	set	0x0E, %g6
	sth	%i3,	[%l7 + %g6]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc0
	set	0x78, %g2
	stda	%g0,	[%l7 + %g2] 0x88
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x70, %o4
	lduh	[%l7 + %o4],	%i5
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x88,	%g4
	set	0x2C, %l1
	swapa	[%l7 + %l1] 0x88,	%l0
	ld	[%l7 + 0x18],	%f2
	set	0x7B, %i0
	stba	%l2,	[%l7 + %i0] 0x89
	set	0x60, %l2
	stwa	%o2,	[%l7 + %l2] 0xeb
	membar	#Sync
	fpsub16s	%f0,	%f22,	%f26
	bl	%icc,	loop_125
	ld	[%l7 + 0x60],	%f5
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i1
loop_125:
	nop
	set	0x27, %l0
	stb	%l4,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x0C]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%l6
	nop
	set	0x4C, %i7
	prefetch	[%l7 + %i7],	 2
	or	%o5,	%i0,	%o7
	set	0x71, %o3
	ldstuba	[%l7 + %o3] 0x80,	%o3
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x81
	set	0x54, %i1
	stwa	%o0,	[%l7 + %i1] 0x89
	ld	[%l7 + 0x64],	%f26
	or	%o1,	%g7,	%o4
	nop
	set	0x27, %o2
	stb	%g3,	[%l7 + %o2]
	be	%icc,	loop_126
	nop
	set	0x08, %o0
	lduw	[%l7 + %o0],	%l1
	nop
	nop
	setx	0xE7B33F6FD20DC732,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x5FDDA91C3C97B2B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f10,	%f20
	nop
	set	0x40, %i2
	sth	%i2,	[%l7 + %i2]
loop_126:
	nop
	set	0x50, %i4
	stda	%g4,	[%l7 + %i4] 0x80
	nop
	set	0x23, %o1
	ldsb	[%l7 + %o1],	%i6
	set	0x4C, %i5
	stwa	%g6,	[%l7 + %i5] 0x89
	st	%fsr,	[%l7 + 0x34]
	ld	[%l7 + 0x54],	%f1
	nop
	set	0x38, %g4
	stw	%l5,	[%l7 + %g4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l3
	nop
	set	0x70, %i6
	stx	%o6,	[%l7 + %i6]
	nop
	set	0x24, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x50, %g5
	stda	%g0,	[%l7 + %g5] 0x81
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x88,	%i5
	ld	[%l7 + 0x28],	%f14
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x55, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i3
	nop
	set	0x19, %l5
	ldstub	[%l7 + %l5],	%l0
	set	0x30, %o6
	sta	%f20,	[%l7 + %o6] 0x89
	nop
	set	0x60, %i3
	swap	[%l7 + %i3],	%g4
	set	0x40, %g2
	lda	[%l7 + %g2] 0x89,	%f4
	nop
	set	0x48, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x34, %g6
	swapa	[%l7 + %g6] 0x89,	%l2
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x10, %g1
	std	%f10,	[%l7 + %g1]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x72, %o4
	ldub	[%l7 + %o4],	%o2
	fpsub32s	%f0,	%f30,	%f22
	nop
	set	0x24, %l1
	swap	[%l7 + %l1],	%l4
	set	0x34, %i0
	stba	%i7,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%l6
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%o5
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x89,	 2
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%o7
	nop
	set	0x14, %l0
	swap	[%l7 + %l0],	%o0
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%o0
	set	, %o2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1274
!	Type a   	: 29
!	Type x   	: 524
!	Type cti   	: 31
!	Type f   	: 46
!	Type i   	: 96
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
	set	0x7,	%g1
	set	0x6,	%g2
	set	0x2,	%g3
	set	0xC,	%g4
	set	0x8,	%g5
	set	0x8,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x8,	%i1
	set	-0x3,	%i2
	set	-0xF,	%i3
	set	-0x7,	%i4
	set	-0x9,	%i5
	set	-0x2,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x598F267C,	%l0
	set	0x47840D31,	%l1
	set	0x5128D8AD,	%l2
	set	0x7108AF12,	%l3
	set	0x5A99A6B4,	%l4
	set	0x0008CA59,	%l5
	set	0x4A099267,	%l6
	!# Output registers
	set	0x15FE,	%o0
	set	0x1173,	%o1
	set	0x0B05,	%o2
	set	-0x1A41,	%o3
	set	-0x04CF,	%o4
	set	0x00AF,	%o5
	set	-0x1DAA,	%o6
	set	0x0662,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x80,	 2
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%o3
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%g3
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x26, %o1
	ldsh	[%l7 + %o1],	%o4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i2
	nop
	nop
	setx	0xFBA3C9E74569877D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x1EF2664C83FD88E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f24,	%f0
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%l5
	nop
	set	0x4C, %i2
	lduw	[%l7 + %i2],	%g2
	and	%g5,	%l3,	%o6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x88
	nop
	set	0x70, %l3
	stx	%i5,	[%l7 + %l3]
	nop
	set	0x50, %g7
	std	%i2,	[%l7 + %g7]
	nop
	set	0x28, %o7
	stx	%g1,	[%l7 + %o7]
	ld	[%l7 + 0x58],	%f24
	nop
	set	0x57, %g5
	ldsb	[%l7 + %g5],	%g4
	set	0x28, %l5
	stda	%l2,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	set	0x3C, %i3
	lda	[%l7 + %i3] 0x81,	%f18
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x70, %o5
	lduw	[%l7 + %o5],	%i1
	set	0x66, %g2
	stba	%o2,	[%l7 + %g2] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x80,	 3
	set	0x20, %l6
	sta	%f17,	[%l7 + %l6] 0x81
	st	%fsr,	[%l7 + 0x70]
	set	0x74, %o4
	stwa	%i4,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%i6
	set	0x75, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i7
	set	0x10, %g1
	swapa	[%l7 + %g1] 0x89,	%o5
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x88,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%o1
	st	%f0,	[%l7 + 0x14]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x40, %l4
	std	%g6,	[%l7 + %l4]
	nop
	set	0x2C, %i7
	ldsb	[%l7 + %i7],	%o0
	nop
	set	0x64, %o3
	lduw	[%l7 + %o3],	%o3
	nop
	set	0x08, %g3
	ldsw	[%l7 + %g3],	%o4
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%l1
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f6
	nop
	set	0x48, %o0
	swap	[%l7 + %o0],	%g3
	and	%i6,	%i2,	%g6
	nop
	set	0x48, %i4
	ldsw	[%l7 + %i4],	%l5
	set	0x40, %o1
	stwa	%g2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x38, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	nop
	set	0x38, %l0
	prefetch	[%l7 + %l0],	 0
	ld	[%l7 + 0x20],	%f0
	nop
	set	0x4A, %g4
	ldub	[%l7 + %g4],	%o6
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x80,	%g5
	or	%i3,	%g1,	%i5
	or	%g4,	%l0,	%i1
	set	0x64, %l3
	stwa	%o2,	[%l7 + %l3] 0xea
	membar	#Sync
	and	%l4,	%i4,	%l6
	nop
	set	0x58, %i2
	stx	%i7,	[%l7 + %i2]
	nop
	set	0x43, %g7
	stb	%o5,	[%l7 + %g7]
	nop
	set	0x60, %o7
	std	%l2,	[%l7 + %o7]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%i0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f0
	set	0x08, %o6
	stwa	%g7,	[%l7 + %o6] 0x81
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%o0
	nop
	set	0x23, %i3
	stb	%o1,	[%l7 + %i3]
	set	0x32, %o5
	stba	%o4,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x2C, %g6
	stw	%o3,	[%l7 + %g6]
	nop
	set	0x70, %g2
	ldx	[%l7 + %g2],	%g3
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xeb,	%i6
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l3
	nop
	set	0x50, %l1
	sth	%o6,	[%l7 + %l1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%g5
	set	0x60, %g1
	stxa	%g1,	[%l7 + %g1] 0x89
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f0
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%i3
	fpadd32s	%f28,	%f10,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i5
	fpadd32	%f24,	%f26,	%f12
	st	%f14,	[%l7 + 0x0C]
	add	%l0,	%i1,	%o2
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f28
	nop
	set	0x70, %i7
	ldx	[%l7 + %i7],	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%l6
	nop
	set	0x60, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x18, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x10, %i1
	std	%f8,	[%l7 + %i1]
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f4
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%o5
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%l2
	be,a,pt	%xcc,	loop_127
	nop
	set	0x28, %i5
	std	%f12,	[%l7 + %i5]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc0
loop_127:
	nop
	set	0x28, %o0
	stx	%o7,	[%l7 + %o0]
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f16
	and	%g7,	%o0,	%i0
	nop
	set	0x78, %i2
	sth	%o1,	[%l7 + %i2]
	nop
	set	0x5C, %l3
	swap	[%l7 + %l3],	%o3
	set	0x22, %o7
	stha	%g3,	[%l7 + %o7] 0x81
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%i6
	nop
	set	0x5A, %g7
	lduh	[%l7 + %g7],	%o4
	ld	[%l7 + 0x6C],	%f28
	st	%f30,	[%l7 + 0x4C]
	nop
	set	0x64, %o6
	ldub	[%l7 + %o6],	%l1
	add	%g6,	%i2,	%l5
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x89,	%l3
	set	0x60, %g5
	swapa	[%l7 + %g5] 0x89,	%g2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%g1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%g4
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f22
	add	%i5,	%l0,	%i1
	set	0x3A, %o5
	stba	%o2,	[%l7 + %o5] 0x80
	set	0x40, %l6
	stda	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i4
	and	%l6,	%i7,	%l2
	nop
	set	0x11, %g2
	ldstub	[%l7 + %g2],	%o5
	set	0x58, %l1
	stxa	%o7,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x70, %o4
	std	%g6,	[%l7 + %o4]
	and	%i0,	%o1,	%o3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f0
	set	0x36, %l4
	stha	%g3,	[%l7 + %l4] 0x80
	nop
	set	0x63, %g1
	ldub	[%l7 + %g1],	%o0
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f2
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x80,	%i6
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%l1
	nop
	set	0x28, %i1
	ldsb	[%l7 + %i1],	%o4
	or	%i2,	%g6,	%l5
	set	0x48, %o2
	stda	%l2,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x6C, %o3
	swap	[%l7 + %o3],	%g2
	nop
	nop
	setx	0x5ED82364087A261A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x9DAC92680E93815D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f28,	%f24
	fpsub32	%f20,	%f10,	%f14
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%g0
	set	0x78, %i4
	lda	[%l7 + %i4] 0x89,	%f13
	st	%f21,	[%l7 + 0x40]
	set	0x68, %i5
	ldxa	[%l7 + %i5] 0x80,	%o6
	nop
	set	0x48, %l0
	std	%f28,	[%l7 + %l0]
	nop
	set	0x0C, %i6
	ldsh	[%l7 + %i6],	%g4
	set	0x34, %o0
	stha	%i5,	[%l7 + %o0] 0x81
	nop
	set	0x38, %i2
	ldstub	[%l7 + %i2],	%i3
	nop
	set	0x48, %g4
	stx	%l0,	[%l7 + %g4]
	set	0x6C, %l3
	sta	%f28,	[%l7 + %l3] 0x81
	set	0x52, %o7
	stha	%o2,	[%l7 + %o7] 0x80
	ld	[%l7 + 0x68],	%f28
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%l4
	set	0x50, %l5
	stba	%g5,	[%l7 + %l5] 0x81
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f0
	nop
	set	0x20, %g5
	lduw	[%l7 + %g5],	%i4
	and	%l6,	%i1,	%i7
	set	0x74, %g6
	stha	%l2,	[%l7 + %g6] 0x89
	set	0x40, %i3
	swapa	[%l7 + %i3] 0x88,	%o5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f16
	nop
	set	0x10, %o5
	std	%o6,	[%l7 + %o5]
	set	0x5C, %g2
	stha	%g7,	[%l7 + %g2] 0x88
	or	%i0,	%o3,	%g3
	set	0x2C, %l1
	sta	%f10,	[%l7 + %l1] 0x81
	set	0x28, %o4
	swapa	[%l7 + %o4] 0x81,	%o0
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xca
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd8
	set	0x0E, %g1
	stha	%o1,	[%l7 + %g1] 0x88
	nop
	set	0x44, %i0
	stw	%l1,	[%l7 + %i0]
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x81,	%o4
	nop
	set	0x58, %i1
	lduw	[%l7 + %i1],	%i6
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%i2
	set	0x28, %i7
	lda	[%l7 + %i7] 0x88,	%f24
	and	%g6,	%l3,	%l5
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	set	0x24, %i4
	stba	%o6,	[%l7 + %i4] 0x89
	nop
	set	0x4E, %i5
	sth	%g4,	[%l7 + %i5]
	set	0x10, %o1
	swapa	[%l7 + %o1] 0x80,	%i5
	nop
	set	0x50, %i6
	prefetch	[%l7 + %i6],	 2
	or	%i3,	%l0,	%o2
	nop
	set	0x4D, %l0
	ldsb	[%l7 + %l0],	%g1
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x89,	%g5
	nop
	set	0x60, %o0
	ldub	[%l7 + %o0],	%i4
	nop
	set	0x50, %l3
	lduh	[%l7 + %l3],	%l6
	set	0x40, %g4
	stba	%l4,	[%l7 + %g4] 0x81
	nop
	set	0x51, %g7
	ldub	[%l7 + %g7],	%i1
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f8
	bg,pt	%icc,	loop_128
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x48, %o7
	ldsh	[%l7 + %o7],	%i7
	set	0x7C, %o6
	sta	%f7,	[%l7 + %o6] 0x80
loop_128:
	nop
	set	0x64, %g5
	lda	[%l7 + %g5] 0x88,	%f25
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xe3,	%o4
	set	0x78, %i3
	stxa	%o7,	[%l7 + %i3] 0xe2
	membar	#Sync
	ld	[%l7 + 0x5C],	%f22
	nop
	set	0x40, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x44, %g2
	stwa	%l2,	[%l7 + %g2] 0x89
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%g7
	set	0x28, %l1
	stwa	%g3,	[%l7 + %l1] 0x81
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%o0,	%o3,	%l1
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%o4
	and	%i6,	%i2,	%g6
	set	0x1C, %l6
	lda	[%l7 + %l6] 0x88,	%f0
	set	0x16, %g1
	stha	%l3,	[%l7 + %g1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x44],	%f7
	nop
	set	0x54, %i0
	ldsw	[%l7 + %i0],	%o1
	nop
	set	0x30, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x4B, %g3
	ldstub	[%l7 + %g3],	%l5
	nop
	set	0x20, %i1
	std	%f18,	[%l7 + %i1]
	st	%f8,	[%l7 + 0x64]
	nop
	set	0x28, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x68, %o2
	swapa	[%l7 + %o2] 0x81,	%o6
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
	nop
	set	0x70, %o3
	std	%f24,	[%l7 + %o3]
	set	0x40, %i5
	stha	%g2,	[%l7 + %i5] 0x88
	and	%i3,	%i5,	%l0
	set	0x0C, %i6
	stba	%g1,	[%l7 + %i6] 0x80
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%o2
	add	%g5,	%l6,	%l4
	add	%i4,	%i7,	%o5
	set	0x59, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i1
	nop
	set	0x4C, %i2
	stw	%l2,	[%l7 + %i2]
	set	0x58, %l3
	stxa	%i0,	[%l7 + %l3] 0x89
	nop
	set	0x70, %o0
	std	%g6,	[%l7 + %o0]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%o0
	nop
	set	0x20, %g4
	lduw	[%l7 + %g4],	%g3
	nop
	set	0x34, %g7
	stw	%l1,	[%l7 + %g7]
	add	%o4,	%o3,	%i6
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x80,	%g6
	or	%l3,	%i2,	%l5
	set	0x38, %o6
	stwa	%o6,	[%l7 + %o6] 0x81
	and	%g4,	%g2,	%i3
	set	0x3C, %o7
	sta	%f11,	[%l7 + %o7] 0x80
	set	0x18, %g6
	stwa	%o1,	[%l7 + %g6] 0x80
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%l0
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%g0
	nop
	set	0x7A, %g2
	lduh	[%l7 + %g2],	%o2
	nop
	set	0x2B, %l1
	ldub	[%l7 + %l1],	%g5
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd8,	%f0
	or	%l6,	%i4,	%l4
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%o4
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%i7
	and	%i1,	%l2,	%i0
	set	0x12, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o7
	set	0x68, %g1
	stwa	%g7,	[%l7 + %g1] 0xeb
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x81
	set	0x24, %l2
	stwa	%l1,	[%l7 + %l2] 0x88
	nop
	set	0x78, %g3
	stx	%g6,	[%l7 + %g3]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i2
	set	0x70, %i7
	stha	%l3,	[%l7 + %i7] 0x80
	set	0x38, %i1
	sta	%f24,	[%l7 + %i1] 0x88
	set	0x18, %o2
	lda	[%l7 + %o2] 0x81,	%f20
	nop
	set	0x68, %o3
	std	%l4,	[%l7 + %o3]
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	set	0x38, %i4
	stxa	%g2,	[%l7 + %i4] 0x81
	nop
	set	0x7F, %l0
	ldstub	[%l7 + %l0],	%g4
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%i3
	nop
	set	0x76, %o1
	lduh	[%l7 + %o1],	%i5
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%o1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%l4
	nop
	set	0x7B, %o0
	ldsb	[%l7 + %o0],	%l6
	nop
	set	0x19, %i2
	ldsb	[%l7 + %i2],	%o5
	wr	%i7,	%i1,	%clear_softint
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%l2
	set	0x30, %l5
	ldda	[%l7 + %l5] 0xea,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%g3
	nop
	set	0x34, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x58, %g7
	std	%f10,	[%l7 + %g7]
	set	0x3C, %g6
	sta	%f20,	[%l7 + %g6] 0x80
	bl,a,pt	%icc,	loop_129
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%g7
	nop
	set	0x38, %g5
	swap	[%l7 + %g5],	%o4
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%o3
loop_129:
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%l1
	nop
	set	0x70, %o4
	stb	%g6,	[%l7 + %o4]
	and	%o0,	%i2,	%l3
	nop
	set	0x1C, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x68, %l4
	stda	%i6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x18, %l6
	std	%o6,	[%l7 + %l6]
	set	0x10, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l5
	nop
	set	0x30, %i0
	std	%g4,	[%l7 + %i0]
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x89,	%i2
	set	0x08, %i3
	stxa	%g2,	[%l7 + %i3] 0x89
	nop
	set	0x44, %i7
	stb	%o1,	[%l7 + %i7]
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x81,	%i5
	set	0x68, %o2
	ldxa	[%l7 + %o2] 0x80,	%g1
	set	0x70, %g3
	stxa	%l0,	[%l7 + %g3] 0x80
	set	0x4D, %o3
	stba	%o2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x58, %i4
	std	%f30,	[%l7 + %i4]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xe3,	%i4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f0
	or	%g5,	%l4,	%o5
	and	%i7,	%i1,	%l2
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%o7
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f0
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	set	0x10, %i6
	prefetcha	[%l7 + %i6] 0x81,	 1
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x80,	%i0
	set	0x31, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g7
	nop
	set	0x14, %g7
	ldsh	[%l7 + %g7],	%o4
	set	0x45, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l1
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%o3
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%o0
	ld	[%l7 + 0x70],	%f24
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x88,	%i2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	set	0x2C, %o4
	stwa	%g6,	[%l7 + %o4] 0x89
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f22
	nop
	set	0x10, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x10, %l6
	sta	%f29,	[%l7 + %l6] 0x88
	set	0x68, %g5
	stda	%l2,	[%l7 + %g5] 0xe3
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%l5
	bne	%icc,	loop_130
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x28, %i0
	ldsb	[%l7 + %i0],	%g4
	nop
	set	0x64, %l2
	prefetch	[%l7 + %l2],	 0
loop_130:
	nop
	set	0x09, %i3
	ldstub	[%l7 + %i3],	%i6
	add	%i3,	%g2,	%o1
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 1
	set	0x54, %i7
	lda	[%l7 + %i7] 0x80,	%f6
	nop
	set	0x0A, %o2
	ldsb	[%l7 + %o2],	%l0
	or	%g1,	%o2,	%g5
	nop
	set	0x6A, %i1
	lduh	[%l7 + %i1],	%l4
	nop
	set	0x54, %o3
	stw	%i4,	[%l7 + %o3]
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x89,	%i7
	set	0x08, %i4
	ldxa	[%l7 + %i4] 0x88,	%i1
	nop
	set	0x70, %i5
	std	%f26,	[%l7 + %i5]
	nop
	set	0x78, %l0
	std	%f12,	[%l7 + %l0]
	nop
	set	0x24, %l3
	ldsw	[%l7 + %l3],	%l2
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x88,	 2
	set	0x1A, %o1
	stha	%o5,	[%l7 + %o1] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	fpadd16s	%f26,	%f29,	%f21
	nop
	set	0x68, %l5
	prefetch	[%l7 + %l5],	 4
	fpadd16	%f24,	%f8,	%f28
	nop
	set	0x24, %o6
	lduw	[%l7 + %o6],	%l6
	nop
	set	0x50, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x1A, %g4
	ldsb	[%l7 + %g4],	%g3
	set	0x68, %g7
	stxa	%i0,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x10, %g6
	stw	%g7,	[%l7 + %g6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%o3
	or	%o0,	%i2,	%l1
	st	%fsr,	[%l7 + 0x2C]
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x81,	%g6
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x81,	%f26
	nop
	set	0x28, %o4
	std	%o6,	[%l7 + %o4]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	set	0x31, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l5
	set	0x14, %l4
	sta	%f28,	[%l7 + %l4] 0x89
	nop
	set	0x28, %g5
	std	%g4,	[%l7 + %g5]
	set	0x5C, %l6
	swapa	[%l7 + %l6] 0x80,	%i6
	set	0x50, %l2
	stwa	%i3,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%l2
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f0
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x80,	 0
	and	%g2,	%l0,	%i5
	st	%f27,	[%l7 + 0x3C]
	nop
	set	0x58, %o2
	stx	%g1,	[%l7 + %o2]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xca
	nop
	set	0x34, %i3
	stb	%g5,	[%l7 + %i3]
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xeb,	%l4
	nop
	set	0x20, %o3
	std	%f8,	[%l7 + %o3]
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xeb,	%i4
	nop
	set	0x0C, %l0
	stw	%i7,	[%l7 + %l0]
	set	0x08, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	set	0x28, %o0
	stxa	%l2,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x08, %o1
	stwa	%o2,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x10, %i5
	lda	[%l7 + %i5] 0x89,	%f20
	set	0x64, %l5
	sta	%f26,	[%l7 + %l5] 0x81
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%o5
	nop
	set	0x3C, %o6
	ldsh	[%l7 + %o6],	%o7
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i0
	set	0x78, %g4
	swapa	[%l7 + %g4] 0x81,	%g7
	nop
	set	0x1A, %g7
	ldsh	[%l7 + %g7],	%l6
	set	0x63, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o3
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x10, %g2
	ldsw	[%l7 + %g2],	%o0
	nop
	set	0x50, %o7
	stw	%i2,	[%l7 + %o7]
	set	0x78, %o4
	stxa	%l1,	[%l7 + %o4] 0x80
	set	0x3D, %o5
	stba	%g6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x68, %l1
	stx	%o6,	[%l7 + %l1]
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%l5
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%g4
	set	0x50, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o4
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%f16
	nop
	set	0x14, %l6
	lduh	[%l7 + %l6],	%i6
	nop
	set	0x24, %g1
	prefetch	[%l7 + %g1],	 0
	set	0x44, %o2
	stwa	%i3,	[%l7 + %o2] 0x88
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%l2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l0
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xea,	%o0
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x80,	%g0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%g5
	nop
	set	0x4C, %i7
	ldsh	[%l7 + %i7],	%l4
	set	0x7A, %o3
	stha	%i4,	[%l7 + %o3] 0xea
	membar	#Sync
	add	%i7,	%l2,	%o2
	set	0x38, %i4
	lda	[%l7 + %i4] 0x89,	%f14
	nop
	set	0x28, %l3
	lduw	[%l7 + %l3],	%i1
	set	0x3C, %o0
	sta	%f10,	[%l7 + %o0] 0x88
	nop
	set	0x1C, %o1
	ldsw	[%l7 + %o1],	%o5
	add	%g3,	%o7,	%i0
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x89
	nop
	set	0x66, %i2
	ldsh	[%l7 + %i2],	%g7
	nop
	set	0x10, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x08, %i5
	stwa	%l6,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x64, %g4
	stw	%o0,	[%l7 + %g4]
	add	%o3,	%l1,	%i2
	wr	%o6,	%l5,	%softint
	set	0x43, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g4
	nop
	set	0x44, %i6
	swap	[%l7 + %i6],	%g6
	set	0x20, %g6
	stxa	%i6,	[%l7 + %g6] 0x81
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i2
	set	0x14, %o4
	sta	%f17,	[%l7 + %o4] 0x88
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%o4
	st	%f7,	[%l7 + 0x7C]
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x88,	%g2
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x88,	%l3
	nop
	set	0x36, %g5
	lduh	[%l7 + %g5],	%o1
	set	0x3E, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l0
	nop
	set	0x58, %l2
	stw	%i5,	[%l7 + %l2]
	set	0x64, %i0
	lda	[%l7 + %i0] 0x89,	%f7
	nop
	set	0x59, %g1
	ldub	[%l7 + %g1],	%g5
	set	0x60, %o2
	stda	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x20, %i1
	stda	%g0,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x18, %i3
	lda	[%l7 + %i3] 0x89,	%f27
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe3,	%i6
	nop
	set	0x2C, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	nop
	set	0x28, %i4
	stw	%i4,	[%l7 + %i4]
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%o2
	nop
	set	0x30, %l3
	std	%f6,	[%l7 + %l3]
	bl,pt	%xcc,	loop_131
	nop
	set	0x44, %o0
	prefetch	[%l7 + %o0],	 1
	ld	[%l7 + 0x14],	%f19
	set	0x48, %l0
	stxa	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
loop_131:
	nop
	set	0x13, %o1
	ldstub	[%l7 + %o1],	%o5
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x88,	%i1
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%o7
	nop
	set	0x64, %i5
	ldsw	[%l7 + %i5],	%i0
	st	%f4,	[%l7 + 0x48]
	and	%g3,	%l6,	%o0
	nop
	set	0x48, %i2
	std	%f4,	[%l7 + %i2]
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%o3
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f0
	nop
	set	0x41, %g6
	ldstub	[%l7 + %g6],	%l1
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%i2
	nop
	set	0x63, %o4
	ldsb	[%l7 + %o4],	%g7
	set	0x18, %g7
	stwa	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x67, %o7
	stb	%l5,	[%l7 + %o7]
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x18, %o5
	lduw	[%l7 + %o5],	%g4
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x80,	%i6
	nop
	set	0x1A, %l2
	stb	%g6,	[%l7 + %l2]
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%i3
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%o4
	nop
	set	0x3C, %o2
	swap	[%l7 + %o2],	%l3
	or	%o1,	%g2,	%l0
	nop
	set	0x68, %i1
	std	%i4,	[%l7 + %i1]
	nop
	set	0x14, %i3
	swap	[%l7 + %i3],	%l4
	nop
	set	0x41, %g1
	stb	%g5,	[%l7 + %g1]
	nop
	set	0x70, %g3
	stx	%i7,	[%l7 + %g3]
	set	0x43, %i7
	ldstuba	[%l7 + %i7] 0x81,	%i4
	set	0x40, %l6
	stxa	%o2,	[%l7 + %l6] 0x80
	nop
	set	0x64, %o3
	ldub	[%l7 + %o3],	%l2
	nop
	set	0x24, %i4
	lduh	[%l7 + %i4],	%o5
	set	0x10, %l3
	sta	%f17,	[%l7 + %l3] 0x88
	set	0x50, %l0
	stba	%g1,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x16, %o1
	stb	%o7,	[%l7 + %o1]
	nop
	set	0x70, %l5
	ldsw	[%l7 + %l5],	%i1
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x80,	%g2
	nop
	set	0x0B, %i5
	ldsb	[%l7 + %i5],	%i0
	add	%o0,	%l6,	%l1
	nop
	set	0x48, %i2
	swap	[%l7 + %i2],	%i2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%g6
	nop
	set	0x68, %i6
	swap	[%l7 + %i6],	%o6
	nop
	set	0x60, %o0
	ldsh	[%l7 + %o0],	%o3
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%g4
	set	0x15, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i6
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xe3,	%l4
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l3
	nop
	set	0x3B, %l1
	ldsb	[%l7 + %l1],	%g6
	set	0x50, %o7
	swapa	[%l7 + %o7] 0x80,	%o1
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xe3,	%g2
	set	0x10, %l4
	stda	%i4,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x78, %l2
	std	%f28,	[%l7 + %l2]
	nop
	set	0x58, %g5
	ldsb	[%l7 + %g5],	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%g5
	nop
	set	0x50, %i0
	lduh	[%l7 + %i0],	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%o5
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	set	0x1F, %i3
	stba	%o7,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x34, %g1
	stha	%i1,	[%l7 + %g1] 0x88
	nop
	set	0x0C, %i1
	swap	[%l7 + %i1],	%g3
	nop
	set	0x10, %g3
	stx	%i0,	[%l7 + %g3]
	nop
	set	0x28, %l6
	ldsh	[%l7 + %l6],	%g1
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x80,	 2
	nop
	set	0x78, %i4
	swap	[%l7 + %i4],	%l6
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%l1
	fpsub16s	%f9,	%f14,	%f20
	set	0x7A, %l3
	stha	%i2,	[%l7 + %l3] 0x89
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x50, %l5
	swap	[%l7 + %l5],	%g7
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%o6
	nop
	set	0x3C, %o6
	lduw	[%l7 + %o6],	%g4
	st	%fsr,	[%l7 + 0x24]
	set	0x70, %i5
	stha	%i6,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x60, %g4
	stxa	%l5,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f16
	ld	[%l7 + 0x78],	%f4
	nop
	set	0x2C, %i2
	sth	%o3,	[%l7 + %i2]
	nop
	set	0x20, %g6
	std	%f12,	[%l7 + %g6]
	set	0x53, %g2
	stba	%o4,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x65, %o0
	ldub	[%l7 + %o0],	%i3
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x80,	%g6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%o1
	nop
	set	0x40, %l1
	stx	%i5,	[%l7 + %l1]
	fpsub32	%f30,	%f14,	%f24
	nop
	set	0x60, %g7
	stx	%g2,	[%l7 + %g7]
	and	%l0,	%l4,	%g5
	nop
	set	0x10, %o5
	stx	%i7,	[%l7 + %o5]
	nop
	set	0x78, %l4
	swap	[%l7 + %l4],	%l2
	set	0x74, %l2
	lda	[%l7 + %l2] 0x89,	%f26
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%o5
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%o2
	nop
	set	0x18, %g5
	lduw	[%l7 + %g5],	%o7
	wr	%i1,	%i0,	%y
	nop
	set	0x2B, %i0
	ldstub	[%l7 + %i0],	%g1
	or	%g3,	%o0,	%l1
	nop
	set	0x1E, %o2
	ldstub	[%l7 + %o2],	%i2
	nop
	set	0x11, %i3
	ldub	[%l7 + %i3],	%l6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xe2,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%i6
	nop
	set	0x54, %i1
	stw	%g4,	[%l7 + %i1]
	nop
	set	0x38, %l6
	stw	%o3,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x10]
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x81,	%o4
	and	%i3,	%l5,	%l3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%i5
	nop
	set	0x7D, %i4
	ldub	[%l7 + %i4],	%g6
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%l0
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%g2
	set	0x65, %o1
	stba	%l4,	[%l7 + %o1] 0x80
	nop
	set	0x16, %i7
	sth	%g5,	[%l7 + %i7]
	nop
	set	0x10, %l5
	stw	%i7,	[%l7 + %l5]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f16
	set	0x4C, %i5
	lda	[%l7 + %i5] 0x80,	%f14
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f28
	nop
	set	0x08, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x5E, %i6
	ldsb	[%l7 + %i6],	%l2
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%o5
	and	%o2,	%o7,	%i1
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x80,	%i0
	nop
	set	0x63, %g2
	stb	%g1,	[%l7 + %g2]
	ld	[%l7 + 0x6C],	%f27
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%g3
	nop
	set	0x6C, %o4
	lduh	[%l7 + %o4],	%o0
	fpadd16	%f26,	%f26,	%f6
	nop
	set	0x40, %g7
	stx	%fsr,	[%l7 + %g7]
	or	%i2,	%l6,	%l1
	nop
	set	0x76, %o5
	lduh	[%l7 + %o5],	%o6
	set	0x58, %l2
	sta	%f21,	[%l7 + %l2] 0x89
	nop
	set	0x63, %l4
	stb	%g7,	[%l7 + %l4]
	nop
	set	0x08, %g5
	std	%i6,	[%l7 + %g5]
	set	0x54, %o7
	stwa	%g4,	[%l7 + %o7] 0x89
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x81,	%o3
	add	%i3,	%o4,	%l5
	set	0x70, %o2
	stha	%l3,	[%l7 + %o2] 0x81
	nop
	set	0x12, %g1
	ldub	[%l7 + %g1],	%i5
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%f2
	set	0x2C, %i3
	swapa	[%l7 + %i3] 0x81,	%o1
	set	0x40, %l6
	stda	%g6,	[%l7 + %l6] 0x80
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x89,	 3
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f16
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x2C, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l4
	nop
	set	0x54, %o1
	ldsw	[%l7 + %o1],	%g2
	st	%fsr,	[%l7 + 0x34]
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	st	%f1,	[%l7 + 0x2C]
	nop
	set	0x2E, %o6
	lduh	[%l7 + %o6],	%l2
	nop
	set	0x64, %i7
	ldsw	[%l7 + %i7],	%g5
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%o2
	ba,pt	%icc,	loop_132
	ld	[%l7 + 0x40],	%f2
	nop
	set	0x4D, %g4
	ldstub	[%l7 + %g4],	%o5
	set	0x2C, %i6
	sta	%f28,	[%l7 + %i6] 0x81
loop_132:
	add	%o7,	%i0,	%i1
	nop
	set	0x40, %i5
	stw	%i4,	[%l7 + %i5]
	nop
	set	0x14, %i2
	swap	[%l7 + %i2],	%g3
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x10, %o0
	ldx	[%l7 + %o0],	%o0
	nop
	set	0x58, %l1
	ldsh	[%l7 + %l1],	%g1
	nop
	set	0x78, %o4
	ldsh	[%l7 + %o4],	%l6
	nop
	set	0x68, %g2
	sth	%i2,	[%l7 + %g2]
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x88,	%o6
	add	%l1,	%i6,	%g7
	nop
	set	0x19, %g7
	ldub	[%l7 + %g7],	%g4
	set	0x3F, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i3
	or	%o3,	%l5,	%o4
	nop
	set	0x44, %g5
	stw	%l3,	[%l7 + %g5]
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%i5
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%o1
	set	0x10, %o2
	stxa	%g6,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x78, %g1
	sta	%f15,	[%l7 + %g1] 0x80
	nop
	set	0x3A, %i1
	ldsh	[%l7 + %i1],	%l4
	add	%g2,	%l0,	%i7
	nop
	set	0x73, %i3
	ldstub	[%l7 + %i3],	%l2
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f28
	set	0x60, %l6
	stda	%g4,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x28, %o3
	lda	[%l7 + %o3] 0x89,	%f10
	nop
	set	0x47, %g3
	ldstub	[%l7 + %g3],	%o2
	set	0x08, %l3
	lda	[%l7 + %l3] 0x89,	%f4
	nop
	set	0x28, %o1
	std	%f0,	[%l7 + %o1]
	set	0x08, %l5
	lda	[%l7 + %l5] 0x89,	%f24
	set	0x70, %i4
	lda	[%l7 + %i4] 0x81,	%f1
	nop
	set	0x08, %o6
	stx	%o7,	[%l7 + %o6]
	fpadd16s	%f25,	%f16,	%f2
	set	0x40, %i7
	stda	%o4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%i4
	nop
	set	0x08, %g4
	stw	%o0,	[%l7 + %g4]
	nop
	set	0x6A, %i6
	ldsb	[%l7 + %i6],	%g3
	nop
	set	0x44, %i2
	stb	%l6,	[%l7 + %i2]
	nop
	set	0x1E, %g6
	ldub	[%l7 + %g6],	%i2
	st	%f5,	[%l7 + 0x10]
	nop
	set	0x6C, %i5
	prefetch	[%l7 + %i5],	 1
	ble,a,pt	%xcc,	loop_133
	fpadd16s	%f31,	%f27,	%f22
	nop
	set	0x6D, %l1
	stb	%o6,	[%l7 + %l1]
	set	0x60, %o4
	ldstuba	[%l7 + %o4] 0x80,	%g1
loop_133:
	nop
	set	0x43, %o0
	ldsb	[%l7 + %o0],	%i6
	add	%g7,	%l1,	%g4
	nop
	set	0x18, %g2
	ldsw	[%l7 + %g2],	%i3
	st	%f31,	[%l7 + 0x20]
	set	0x20, %g7
	lda	[%l7 + %g7] 0x89,	%f0
	set	0x54, %l2
	sta	%f29,	[%l7 + %l2] 0x81
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%l4
	set	0x24, %l4
	stwa	%o4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x48, %o7
	stx	%o3,	[%l7 + %o7]
	nop
	set	0x08, %g5
	sth	%i5,	[%l7 + %g5]
	set	0x60, %g1
	sta	%f2,	[%l7 + %g1] 0x80
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%l3
	set	0x78, %i3
	stha	%o1,	[%l7 + %i3] 0x81
	ba,a	%icc,	loop_134
	nop
	set	0x24, %i1
	swap	[%l7 + %i1],	%g6
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%g2
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%l4
loop_134:
	nop
	set	0x52, %l6
	sth	%i7,	[%l7 + %l6]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xcc
	nop
	set	0x58, %o1
	swap	[%l7 + %o1],	%l2
	set	0x78, %l3
	stda	%g4,	[%l7 + %l3] 0x88
	nop
	set	0x28, %i4
	sth	%l0,	[%l7 + %i4]
	nop
	set	0x3D, %l5
	ldstub	[%l7 + %l5],	%o7
	wr	%o2,	%i1,	%softint
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%i0
	nop
	set	0x58, %l0
	lduw	[%l7 + %l0],	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%g3
	nop
	set	0x1A, %g4
	ldub	[%l7 + %g4],	%i4
	nop
	set	0x34, %i6
	stb	%l6,	[%l7 + %i6]
	st	%f11,	[%l7 + 0x1C]
	st	%f7,	[%l7 + 0x40]
	set	0x66, %i2
	stba	%i2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x28, %i7
	stx	%o6,	[%l7 + %i7]
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%g1
	bl,a,pn	%icc,	loop_135
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x14, %l1
	lduh	[%l7 + %l1],	%g7
	nop
	set	0x30, %o0
	lduw	[%l7 + %o0],	%l1
loop_135:
	nop
	set	0x5D, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i6
	nop
	set	0x10, %o4
	std	%f20,	[%l7 + %o4]
	fpadd16s	%f12,	%f25,	%f25
	nop
	set	0x14, %l2
	ldsb	[%l7 + %l2],	%i3
	set	0x20, %o5
	sta	%f31,	[%l7 + %o5] 0x88
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x0E, %o7
	lduh	[%l7 + %o7],	%g4
	nop
	set	0x4C, %l4
	ldsw	[%l7 + %l4],	%l5
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%o3
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x80,	%o4
	fpsub32s	%f3,	%f24,	%f21
	nop
	set	0x37, %o2
	ldstub	[%l7 + %o2],	%l3
	nop
	set	0x4B, %i3
	stb	%o1,	[%l7 + %i3]
	nop
	set	0x78, %i1
	ldstub	[%l7 + %i1],	%i5
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf9
	membar	#Sync
	nop
	set	0x70, %l6
	std	%f30,	[%l7 + %l6]
	set	0x7C, %i0
	stba	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x41, %o1
	stb	%g6,	[%l7 + %o1]
	nop
	set	0x7C, %g3
	ldsw	[%l7 + %g3],	%i7
	nop
	set	0x22, %i4
	ldub	[%l7 + %i4],	%l4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x40, %l3
	ldub	[%l7 + %l3],	%l2
	nop
	set	0x20, %o6
	stx	%g5,	[%l7 + %o6]
	and	%l0,	%o2,	%i1
	set	0x5C, %l0
	stha	%o7,	[%l7 + %l0] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%i0
	nop
	set	0x72, %l5
	lduh	[%l7 + %l5],	%g3
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x88,	%o0
	set	0x70, %i2
	stda	%i6,	[%l7 + %i2] 0x80
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%i4
	st	%f12,	[%l7 + 0x58]
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x68, %i5
	sta	%f23,	[%l7 + %i5] 0x88
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xcc
	ld	[%l7 + 0x28],	%f21
	nop
	set	0x48, %g6
	std	%i2,	[%l7 + %g6]
	add	%g1,	%g7,	%o6
	nop
	set	0x77, %g2
	ldstub	[%l7 + %g2],	%i6
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xe3,	%i2
	nop
	set	0x3C, %o4
	lduw	[%l7 + %o4],	%g4
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x14, %g7
	swap	[%l7 + %g7],	%o3
	set	0x29, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l1
	nop
	set	0x70, %l4
	stx	%l3,	[%l7 + %l4]
	wr	%o4,	%o1,	%pic
	nop
	set	0x30, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x60, %g1
	lduw	[%l7 + %g1],	%g2
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f4
	add	%g6,	%i7,	%i5
	bne	%xcc,	loop_136
	st	%f9,	[%l7 + 0x58]
	ba,a,pt	%icc,	loop_137
	and	%l4,	%g5,	%l2
loop_136:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o2
loop_137:
	or	%o7,	%i1,	%o5
	nop
	set	0x7C, %o2
	stw	%g3,	[%l7 + %o2]
	and	%o0,	%l6,	%i4
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x88,	 1
	set	0x38, %i3
	stda	%g0,	[%l7 + %i3] 0x89
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd8
	nop
	set	0x50, %o3
	lduw	[%l7 + %o3],	%g7
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%i0
	set	0x4E, %g3
	stha	%i6,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x48, %i0
	stw	%o6,	[%l7 + %i0]
	nop
	set	0x48, %l3
	ldsw	[%l7 + %l3],	%i3
	set	0x10, %o6
	sta	%f23,	[%l7 + %o6] 0x89
	nop
	set	0x60, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%g4,	%l5,	%o3
	ld	[%l7 + 0x6C],	%f22
	nop
	set	0x3D, %i4
	ldsb	[%l7 + %i4],	%l1
	add	%o4,	%l3,	%o1
	nop
	set	0x17, %g4
	ldstub	[%l7 + %g4],	%g6
	set	0x40, %i2
	stxa	%i7,	[%l7 + %i2] 0x89
	nop
	set	0x25, %l5
	ldub	[%l7 + %l5],	%g2
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x81,	%l4
	set	0x6A, %i6
	stha	%g5,	[%l7 + %i6] 0x81
	nop
	set	0x0C, %l1
	ldsw	[%l7 + %l1],	%l2
	nop
	set	0x6E, %i5
	stb	%l0,	[%l7 + %i5]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x80,	%i5
	nop
	set	0x48, %o0
	std	%f12,	[%l7 + %o0]
	wr	%o2,	%i1,	%pic
	set	0x24, %o4
	sta	%f19,	[%l7 + %o4] 0x80
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xca
	nop
	set	0x16, %o5
	lduh	[%l7 + %o5],	%o7
	nop
	set	0x78, %l4
	stx	%g3,	[%l7 + %l4]
	nop
	set	0x10, %o7
	std	%f28,	[%l7 + %o7]
	set	0x64, %g1
	stha	%o0,	[%l7 + %g1] 0xeb
	membar	#Sync
	or	%o5,	%l6,	%i2
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x64, %o2
	sth	%g1,	[%l7 + %o2]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
	nop
	set	0x1C, %l2
	sth	%g7,	[%l7 + %l2]
	set	0x30, %i3
	stxa	%i0,	[%l7 + %i3] 0x80
	st	%fsr,	[%l7 + 0x0C]
	add	%i6,	%i4,	%o6
	set	0x4F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g4
	nop
	set	0x16, %o3
	ldsh	[%l7 + %o3],	%i3
	set	0x38, %g3
	stxa	%o3,	[%l7 + %g3] 0x81
	ld	[%l7 + 0x60],	%f20
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x88,	 1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f0
	or	%l5,	%o4,	%l3
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x81,	%g6
	or	%i7,	%o1,	%l4
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%l2
	set	0x50, %i4
	swapa	[%l7 + %i4] 0x80,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%o2
	nop
	set	0x68, %l0
	lduw	[%l7 + %l0],	%i5
	set	0x41, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i1
	set	0x46, %l5
	stha	%o7,	[%l7 + %l5] 0x81
	nop
	set	0x67, %i2
	ldub	[%l7 + %i2],	%g3
	nop
	set	0x0C, %i7
	ldstub	[%l7 + %i7],	%o0
	set	0x73, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l6
	set	0x74, %i5
	sta	%f3,	[%l7 + %i5] 0x80
	set	0x64, %g6
	sta	%f21,	[%l7 + %g6] 0x81
	fpadd16s	%f23,	%f1,	%f30
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x88,	%o4
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f6
	set	0x60, %o4
	stda	%i2,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x28, %g2
	stx	%g1,	[%l7 + %g2]
	add	%g7,	%i0,	%i4
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x80,	%o6
	nop
	set	0x54, %g7
	ldsw	[%l7 + %g7],	%i6
	set	0x3C, %o7
	lda	[%l7 + %o7] 0x81,	%f5
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%g4
	set	0x3F, %l4
	stba	%i3,	[%l7 + %l4] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f0
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f0
	nop
	set	0x2E, %i3
	stb	%l5,	[%l7 + %i3]
	ld	[%l7 + 0x78],	%f10
	set	0x78, %l2
	stwa	%o4,	[%l7 + %l2] 0x81
	set	0x48, %l6
	stxa	%l1,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x89,	%l3
	set	0x15, %o3
	stba	%i7,	[%l7 + %o3] 0x89
	or	%o1,	%g6,	%l4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd2,	%f0
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%g2
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x40, %o6
	std	%f10,	[%l7 + %o6]
	nop
	set	0x38, %i0
	stx	%l0,	[%l7 + %i0]
	nop
	set	0x2C, %i4
	stw	%g5,	[%l7 + %i4]
	set	0x58, %g4
	lda	[%l7 + %g4] 0x88,	%f25
	nop
	set	0x22, %l0
	lduh	[%l7 + %l0],	%l2
	set	0x58, %i2
	stxa	%o2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x09, %l5
	stb	%i1,	[%l7 + %l5]
	add	%i5,	%o7,	%g3
	nop
	set	0x76, %i7
	ldsh	[%l7 + %i7],	%o0
	nop
	set	0x58, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x30, %l1
	stx	%l6,	[%l7 + %l1]
	or	%i2,	%g1,	%g7
	set	0x4E, %i6
	stha	%o5,	[%l7 + %i6] 0x89
	add	%i0,	%i4,	%o6
	nop
	set	0x18, %o0
	stx	%g4,	[%l7 + %o0]
	set	0x62, %g6
	stha	%i3,	[%l7 + %g6] 0x88
	nop
	set	0x08, %g2
	stw	%i6,	[%l7 + %g2]
	st	%f11,	[%l7 + 0x48]
	set	0x68, %o4
	stwa	%o3,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x68, %g7
	swapa	[%l7 + %g7] 0x81,	%o4
	nop
	set	0x20, %o5
	std	%l4,	[%l7 + %o5]
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x80,	 1
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xda
	and	%l3,	%o1,	%i7
	and	%l4,	%g2,	%g6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l2
	nop
	set	0x10, %l4
	ldx	[%l7 + %l4],	%l0
	nop
	set	0x5C, %i1
	ldsw	[%l7 + %i1],	%o2
	nop
	set	0x4B, %g5
	ldub	[%l7 + %g5],	%i1
	nop
	set	0x48, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x34, %l2
	stw	%o7,	[%l7 + %l2]
	nop
	set	0x08, %l6
	std	%g2,	[%l7 + %l6]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc8
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f12
	or	%i5,	%l6,	%i2
	nop
	set	0x6C, %o3
	ldsh	[%l7 + %o3],	%o0
	st	%fsr,	[%l7 + 0x54]
	set	0x78, %o1
	stxa	%g7,	[%l7 + %o1] 0x89
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x88,	%o5
	nop
	set	0x20, %l3
	std	%i0,	[%l7 + %l3]
	set	0x44, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g1
	set	0x5A, %g4
	stba	%i4,	[%l7 + %g4] 0x88
	ld	[%l7 + 0x48],	%f8
	bgu	%xcc,	loop_138
	nop
	set	0x62, %l0
	ldstub	[%l7 + %l0],	%o6
	or	%i3,	%g4,	%i6
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x80
loop_138:
	nop
	set	0x5C, %l5
	swapa	[%l7 + %l5] 0x89,	%o4
	wr	%o3,	%l5,	%y
	nop
	set	0x6C, %i7
	sth	%l3,	[%l7 + %i7]
	or	%o1,	%l1,	%l4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc2
	fpadd16	%f2,	%f28,	%f30
	nop
	set	0x66, %l1
	stb	%g2,	[%l7 + %l1]
	set	0x30, %i5
	stxa	%g6,	[%l7 + %i5] 0xe3
	membar	#Sync
	or	%g5,	%i7,	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%i1
	or	%l0,	%o7,	%g3
	nop
	set	0x60, %o0
	ldsh	[%l7 + %o0],	%l6
	set	0x18, %i6
	stxa	%i5,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x48, %g6
	stda	%o0,	[%l7 + %g6] 0x81
	set	0x44, %g2
	sta	%f30,	[%l7 + %g2] 0x89
	and	%i2,	%o5,	%i0
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x58, %g7
	sth	%g7,	[%l7 + %g7]
	and	%g1,	%o6,	%i3
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f24
	nop
	set	0x71, %o4
	stb	%i4,	[%l7 + %o4]
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x88,	 0
	nop
	nop
	setx	0x36B0E829,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x73F7D43F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f20,	%f14
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g4
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x80,	 1
	set	0x14, %i1
	sta	%f2,	[%l7 + %i1] 0x88
	and	%l5,	%o1,	%l1
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe2,	%l2
	bne,a,pn	%icc,	loop_139
	add	%g2,	%g6,	%g5
	wr	%i7,	%l2,	%softint
	set	0x76, %i3
	stha	%l4,	[%l7 + %i3] 0x89
loop_139:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x89
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%o2
	fpadd32s	%f16,	%f8,	%f9
	wr	%i1,	%l0,	%sys_tick
	set	0x18, %o2
	stda	%g2,	[%l7 + %o2] 0xea
	membar	#Sync
	and	%o7,	%i5,	%o0
	set	0x74, %l2
	stha	%l6,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x50, %o3
	stw	%i2,	[%l7 + %o3]
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x88,	%i0
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%o5
	bleu,pt	%icc,	loop_140
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f26
	set	0x10, %o1
	ldxa	[%l7 + %o1] 0x80,	%g1
loop_140:
	nop
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe3,	%g6
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x81,	 4
	and	%i4,	%o6,	%o4
	nop
	set	0x7A, %i2
	sth	%i6,	[%l7 + %i2]
	nop
	set	0x64, %l0
	lduh	[%l7 + %l0],	%o3
	set	0x64, %i7
	sta	%f9,	[%l7 + %i7] 0x89
	set	0x40, %l5
	stwa	%g4,	[%l7 + %l5] 0xeb
	membar	#Sync
	or	%l5,	%l1,	%l3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xe2,	%o0
	st	%fsr,	[%l7 + 0x1C]
	fpsub16	%f16,	%f18,	%f8
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%g6
	nop
	set	0x3E, %l1
	ldsb	[%l7 + %l1],	%g2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l2
	set	0x21, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g5
	set	0x18, %g6
	sta	%f25,	[%l7 + %g6] 0x88
	and	%l4,	%o2,	%l0
	st	%f16,	[%l7 + 0x5C]
	nop
	set	0x38, %g2
	stx	%g3,	[%l7 + %g2]
	nop
	set	0x77, %i6
	stb	%i1,	[%l7 + %i6]
	wr	%o7,	%o0,	%ccr
	nop
	set	0x20, %g7
	std	%f24,	[%l7 + %g7]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%i2
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%i6
	and	%o5,	%g1,	%g7
	add	%i0,	%i3,	%i4
	nop
	set	0x20, %o5
	prefetch	[%l7 + %o5],	 1
	and	%o4,	%o6,	%i6
	nop
	set	0x40, %o7
	lduw	[%l7 + %o7],	%o3
	nop
	set	0x10, %i1
	std	%f16,	[%l7 + %i1]
	set	0x10, %l4
	stwa	%g4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x3E, %i3
	lduh	[%l7 + %i3],	%l1
	nop
	set	0x58, %g1
	std	%f20,	[%l7 + %g1]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%l2
	add	%l5,	%g6,	%o1
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf1
	membar	#Sync
	and	%i7,	%g2,	%l2
	bgu	%xcc,	loop_141
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f20
	nop
	set	0x74, %o3
	swap	[%l7 + %o3],	%g5
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x80,	 3
loop_141:
	nop
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f0
	nop
	set	0x48, %o6
	ldx	[%l7 + %o6],	%l0
	set	0x74, %l3
	sta	%f1,	[%l7 + %l3] 0x88
	or	%g3,	%l4,	%i1
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%o0
	st	%f16,	[%l7 + 0x14]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%i5
	nop
	set	0x20, %o1
	ldsw	[%l7 + %o1],	%o7
	set	0x30, %l0
	ldxa	[%l7 + %l0] 0x89,	%l6
	st	%fsr,	[%l7 + 0x60]
	ld	[%l7 + 0x78],	%f1
	nop
	set	0x1C, %l5
	ldstub	[%l7 + %l5],	%i2
	set	0x28, %i7
	stxa	%o5,	[%l7 + %i7] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g7
	nop
	set	0x28, %i5
	std	%f24,	[%l7 + %i5]
	nop
	set	0x78, %i0
	stw	%i3,	[%l7 + %i0]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc4
	set	0x50, %o0
	ldda	[%l7 + %o0] 0xeb,	%i0
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%o6
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f12
	nop
	set	0x2C, %i6
	ldsw	[%l7 + %i6],	%i6
	fpadd16s	%f4,	%f18,	%f21
	ld	[%l7 + 0x3C],	%f7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%l1
	nop
	set	0x5C, %g7
	lduw	[%l7 + %g7],	%o3
	ba,pt	%xcc,	loop_142
	nop
	set	0x33, %o5
	stb	%l3,	[%l7 + %o5]
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%l5
	set	0x3C, %o4
	stwa	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
loop_142:
	st	%f13,	[%l7 + 0x3C]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf8
	membar	#Sync
	st	%fsr,	[%l7 + 0x5C]
	set	0x20, %i3
	ldda	[%l7 + %i3] 0xe3,	%o0
	st	%fsr,	[%l7 + 0x20]
	and	%i7,	%l2,	%g5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%g2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x7B, %g1
	ldub	[%l7 + %g1],	%g3
	nop
	set	0x41, %l6
	stb	%l4,	[%l7 + %l6]
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%i1
	and	%o0,	%l0,	%o7
	add	%i5,	%i2,	%l6
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x81,	%g1
	nop
	set	0x77, %o2
	ldstub	[%l7 + %o2],	%g7
	set	0x38, %g3
	sta	%f17,	[%l7 + %g3] 0x88
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f0
	set	0x5C, %l3
	sta	%f7,	[%l7 + %l3] 0x80
	nop
	set	0x70, %i4
	std	%f24,	[%l7 + %i4]
	nop
	set	0x70, %g4
	lduw	[%l7 + %g4],	%o5
	nop
	set	0x55, %l2
	ldsb	[%l7 + %l2],	%i3
	nop
	set	0x58, %o1
	stx	%i4,	[%l7 + %o1]
	set	0x12, %l0
	stha	%o4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x20, %l5
	stw	%o6,	[%l7 + %l5]
	bg	%xcc,	loop_143
	or	%i6,	%g4,	%l1
	nop
	set	0x70, %i2
	lduw	[%l7 + %i2],	%i0
	nop
	set	0x18, %i5
	std	%l2,	[%l7 + %i5]
loop_143:
	nop
	set	0x10, %i0
	stda	%l4,	[%l7 + %i0] 0x80
	set	0x18, %i7
	lda	[%l7 + %i7] 0x89,	%f24
	set	0x5C, %o0
	stwa	%g6,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x88
	nop
	set	0x50, %g2
	ldsw	[%l7 + %g2],	%o1
	nop
	set	0x60, %i6
	lduw	[%l7 + %i6],	%i7
	nop
	set	0x40, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x38, %g7
	lda	[%l7 + %g7] 0x89,	%f13
	set	0x24, %o5
	stwa	%l2,	[%l7 + %o5] 0x88
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%g5
	nop
	set	0x1A, %o7
	ldstub	[%l7 + %o7],	%o2
	nop
	set	0x36, %i3
	ldsb	[%l7 + %i3],	%g2
	add	%o3,	%g3,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%i1
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x81,	%l0
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x89,	%i5
	set	0x28, %g5
	stda	%i2,	[%l7 + %g5] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%g1
	set	0x68, %l6
	stda	%g6,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%l6
	nop
	set	0x1F, %g3
	stb	%o5,	[%l7 + %g3]
	nop
	set	0x70, %o2
	stw	%i4,	[%l7 + %o2]
	set	0x40, %l3
	lda	[%l7 + %l3] 0x88,	%f0
	set	0x60, %i4
	stxa	%o4,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%o6,	%i6,	%g4
	or	%i3,	%l1,	%l3
	nop
	set	0x40, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x7F, %o6
	stba	%i0,	[%l7 + %o6] 0xe3
	membar	#Sync
	or	%l5,	%o1,	%g6
	or	%l2,	%i7,	%o2
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc2
	set	0x10, %l0
	stwa	%g5,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x63, %l5
	stba	%o3,	[%l7 + %l5] 0x89
	nop
	set	0x38, %i2
	stw	%g2,	[%l7 + %i2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%o0
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l4
	set	0x48, %i0
	stxa	%l0,	[%l7 + %i0] 0x80
	set	0x34, %i7
	lda	[%l7 + %i7] 0x81,	%f11
	ld	[%l7 + 0x1C],	%f13
	set	0x58, %o0
	stxa	%i1,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	nop
	set	0x08, %l2
	swap	[%l7 + %l2],	%i5
	nop
	set	0x78, %g2
	stw	%o7,	[%l7 + %g2]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xda
	set	0x50, %g7
	ldda	[%l7 + %g7] 0x89,	%i2
	set	0x1E, %i6
	stha	%g1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x48, %o4
	std	%f12,	[%l7 + %o4]
	set	0x55, %o5
	stba	%l6,	[%l7 + %o5] 0x88
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	set	0x08, %i1
	stda	%i4,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%o4
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%g7
	set	0x18, %g5
	stxa	%i6,	[%l7 + %g5] 0xeb
	membar	#Sync
	be,a,pt	%icc,	loop_144
	nop
	set	0x1A, %g1
	ldsh	[%l7 + %g1],	%g4
	st	%fsr,	[%l7 + 0x4C]
	set	0x5A, %l6
	stha	%i3,	[%l7 + %l6] 0xe2
	membar	#Sync
loop_144:
	nop
	set	0x18, %g3
	ldsh	[%l7 + %g3],	%l1
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f16
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd8
	nop
	set	0x24, %o2
	ldstub	[%l7 + %o2],	%l3
	st	%f13,	[%l7 + 0x68]
	set	0x6C, %i4
	lda	[%l7 + %i4] 0x88,	%f3
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%i0
	st	%fsr,	[%l7 + 0x08]
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	nop
	set	0x53, %l0
	stb	%o6,	[%l7 + %l0]
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%l2
	set	0x10, %i2
	lda	[%l7 + %i2] 0x89,	%f20
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x20, %i0
	stwa	%i7,	[%l7 + %i0] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%o2
	nop
	set	0x2C, %l5
	stw	%g5,	[%l7 + %l5]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%g2
	nop
	set	0x78, %i7
	stw	%o0,	[%l7 + %i7]
	and	%g3,	%l4,	%i1
	wr	%l0,	%o7,	%set_softint
	nop
	set	0x14, %o0
	ldsw	[%l7 + %o0],	%i2
	and	%i5,	%g1,	%o5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l6
	set	0x7C, %g6
	swapa	[%l7 + %g6] 0x81,	%g7
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%o4
	nop
	set	0x38, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%g4,	%i3,	%i6
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%l0
	nop
	set	0x56, %i6
	ldstub	[%l7 + %i6],	%o1
	nop
	set	0x28, %o4
	ldstub	[%l7 + %o4],	%o6
	set	0x0C, %o5
	stha	%g6,	[%l7 + %o5] 0x81
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l5
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	add	%o2,	%g5,	%o3
	fpsub32s	%f19,	%f9,	%f29
	nop
	set	0x78, %o7
	stx	%g2,	[%l7 + %o7]
	nop
	set	0x4A, %l4
	lduh	[%l7 + %l4],	%l2
	nop
	set	0x4C, %g5
	lduh	[%l7 + %g5],	%o0
	fpadd32	%f24,	%f24,	%f24
	set	0x78, %g1
	stxa	%g3,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x20, %l6
	std	%f6,	[%l7 + %l6]
	set	0x68, %g3
	sta	%f19,	[%l7 + %g3] 0x81
	st	%f29,	[%l7 + 0x70]
	st	%f1,	[%l7 + 0x30]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xda
	nop
	set	0x58, %o3
	std	%l4,	[%l7 + %o3]
	be,a,pt	%xcc,	loop_145
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	ld	[%l7 + 0x54],	%f13
	nop
	set	0x40, %i4
	std	%f28,	[%l7 + %i4]
loop_145:
	nop
	set	0x0C, %l3
	stwa	%l0,	[%l7 + %l3] 0x81
	and	%o7,	%i2,	%i1
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x81,	%i5
	nop
	set	0x24, %l0
	ldsh	[%l7 + %l0],	%o5
	nop
	set	0x6C, %g4
	ldsb	[%l7 + %g4],	%g1
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%l6
	nop
	set	0x48, %o6
	ldsh	[%l7 + %o6],	%g7
	nop
	set	0x30, %i5
	ldstub	[%l7 + %i5],	%o4
	nop
	set	0x20, %i0
	stx	%i4,	[%l7 + %i0]
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf1,	%f0
	and	%g4,	%i6,	%i3
	wr	%i0,	%l1,	%ccr
	and	%o1,	%l3,	%g6
	nop
	set	0x45, %o0
	stb	%i7,	[%l7 + %o0]
	set	0x10, %g6
	stda	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x80
	and	%o2,	%l5,	%o3
	st	%f23,	[%l7 + 0x1C]
	nop
	set	0x58, %l1
	std	%g4,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x4C]
	nop
	nop
	setx	0x4789230B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x65C9CAE5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f22,	%f27
	and	%g2,	%o0,	%g3
	set	0x58, %g7
	lda	[%l7 + %g7] 0x80,	%f30
	nop
	set	0x62, %l2
	sth	%l4,	[%l7 + %l2]
	set	0x0F, %i7
	stba	%l0,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x0E, %i6
	sth	%l2,	[%l7 + %i6]
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%o7
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x48, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x2F, %o4
	ldub	[%l7 + %o4],	%i1
	nop
	set	0x3C, %l4
	lduw	[%l7 + %l4],	%i2
	nop
	set	0x68, %g1
	sth	%o5,	[%l7 + %g1]
	set	0x13, %g5
	stba	%i5,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%l6
	nop
	set	0x35, %i3
	stb	%g7,	[%l7 + %i3]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x88
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x26, %o2
	ldsb	[%l7 + %o2],	%g1
	nop
	set	0x70, %l6
	std	%o4,	[%l7 + %l6]
	nop
	set	0x40, %i4
	std	%f30,	[%l7 + %i4]
	nop
	set	0x2C, %o1
	ldub	[%l7 + %o1],	%i4
	nop
	set	0x38, %l0
	sth	%g4,	[%l7 + %l0]
	nop
	set	0x24, %l3
	ldub	[%l7 + %l3],	%i3
	nop
	set	0x68, %g4
	swap	[%l7 + %g4],	%i0
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x75, %o6
	ldsb	[%l7 + %o6],	%l1
	nop
	set	0x14, %i5
	ldsw	[%l7 + %i5],	%i6
	set	0x29, %i0
	stba	%l3,	[%l7 + %i0] 0xe2
	membar	#Sync
	and	%o1,	%i7,	%o6
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f4
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%g6
	set	0x18, %g6
	stxa	%l5,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x4C, %g2
	ldsw	[%l7 + %g2],	%o3
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%g5
	nop
	set	0x10, %g7
	ldub	[%l7 + %g7],	%g2
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%o0
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x81,	 1
	set	0x10, %l2
	stda	%l4,	[%l7 + %l2] 0xe3
	membar	#Sync
	and	%o2,	%l0,	%l2
	nop
	set	0x42, %i1
	ldsh	[%l7 + %i1],	%i1
	nop
	set	0x46, %o5
	ldstub	[%l7 + %o5],	%i2
	and	%o5,	%o7,	%l6
	set	0x1C, %o4
	stwa	%i5,	[%l7 + %o4] 0x80
	bne,pt	%icc,	loop_146
	nop
	set	0x58, %l4
	stx	%g7,	[%l7 + %l4]
	nop
	set	0x50, %g1
	stx	%o4,	[%l7 + %g1]
	set	0x69, %o7
	stba	%g1,	[%l7 + %o7] 0xeb
	membar	#Sync
loop_146:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%i3
	set	0x70, %g5
	lda	[%l7 + %g5] 0x80,	%f15
	ld	[%l7 + 0x24],	%f27
	set	0x08, %g3
	stwa	%i0,	[%l7 + %g3] 0x81
	wr	%g4,	%l1,	%ccr
	nop
	set	0x3F, %o3
	ldub	[%l7 + %o3],	%l3
	nop
	set	0x30, %o2
	std	%i6,	[%l7 + %o2]
	and	%i7,	%o1,	%g6
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x80,	%o6
	nop
	set	0x6C, %l6
	ldsw	[%l7 + %l6],	%l5
	nop
	set	0x1E, %i4
	ldsb	[%l7 + %i4],	%o3
	nop
	set	0x28, %o1
	stx	%g5,	[%l7 + %o1]
	set	0x14, %l3
	swapa	[%l7 + %l3] 0x88,	%o0
	or	%g3,	%g2,	%l4
	set	0x58, %g4
	stwa	%o2,	[%l7 + %g4] 0x89
	add	%l0,	%l2,	%i2
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0
	nop
	set	0x45, %l0
	ldsb	[%l7 + %l0],	%i1
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	nop
	set	0x38, %i0
	stw	%i5,	[%l7 + %i0]
	set	0x28, %o6
	lda	[%l7 + %o6] 0x89,	%f8
	nop
	set	0x61, %l5
	ldsb	[%l7 + %l5],	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g7
	nop
	set	0x34, %g6
	swap	[%l7 + %g6],	%i0
	nop
	set	0x1C, %g2
	ldsw	[%l7 + %g2],	%g4
	set	0x28, %l1
	stwa	%l1,	[%l7 + %l1] 0x89
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%i3
	set	0x54, %i7
	stwa	%l3,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x60, %g7
	std	%f0,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x50, %l2
	lduh	[%l7 + %l2],	%i7
	nop
	set	0x1C, %i1
	lduh	[%l7 + %i1],	%o1
	nop
	set	0x58, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x44, %i6
	ldsw	[%l7 + %i6],	%i6
	set	0x60, %o4
	ldda	[%l7 + %o4] 0xe3,	%g6
	nop
	set	0x7C, %l4
	swap	[%l7 + %l4],	%o6
	or	%l5,	%o3,	%g5
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%g2
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%g2
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x88
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f0
	fpsub32s	%f24,	%f1,	%f19
	nop
	set	0x10, %o2
	stx	%o0,	[%l7 + %o2]
	and	%l4,	%o2,	%l0
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%l2
	set	0x34, %l6
	lda	[%l7 + %l6] 0x88,	%f29
	st	%fsr,	[%l7 + 0x4C]
	ble,pn	%icc,	loop_147
	nop
	set	0x65, %o3
	ldstub	[%l7 + %o3],	%i2
	set	0x1C, %i4
	lda	[%l7 + %i4] 0x80,	%f3
loop_147:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%o7
	ld	[%l7 + 0x70],	%f24
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x81,	%o5
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%i5
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x88,	%l6
	st	%f31,	[%l7 + 0x18]
	nop
	set	0x78, %l0
	ldsw	[%l7 + %l0],	%o4
	bgu,a	%xcc,	loop_148
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%g1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%i0
loop_148:
	nop
	set	0x10, %i2
	stwa	%i4,	[%l7 + %i2] 0x89
	set	0x74, %o6
	sta	%f31,	[%l7 + %o6] 0x81
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	and	%l1,	%i3,	%i7
	set	0x3A, %l5
	stba	%l3,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x24, %g6
	swapa	[%l7 + %g6] 0x88,	%i6
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%o1
	set	0x18, %g2
	stxa	%g6,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x68, %i7
	swap	[%l7 + %i7],	%l5
	nop
	set	0x32, %o0
	lduh	[%l7 + %o0],	%o6
	set	0x18, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o3
	wr	%g5,	%g3,	%softint
	set	0x44, %i1
	lda	[%l7 + %i1] 0x89,	%f11
	set	0x70, %o5
	stxa	%g2,	[%l7 + %o5] 0x88
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%o0
	nop
	set	0x48, %o4
	stx	%l4,	[%l7 + %o4]
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x89,	 1
	bl,pn	%icc,	loop_149
	fpadd16	%f24,	%f26,	%f24
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f2
loop_149:
	nop
	set	0x48, %g1
	swap	[%l7 + %g1],	%l2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x78, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	nop
	setx	0x9DA352E681E2C4F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6A33BFD658AFD9D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f22
	nop
	set	0x5C, %g3
	stw	%l0,	[%l7 + %g3]
	nop
	set	0x36, %g5
	ldsb	[%l7 + %g5],	%i1
	fpadd32	%f10,	%f16,	%f0
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%o6
	set	0x50, %i3
	stda	%i2,	[%l7 + %i3] 0x80
	nop
	set	0x48, %l6
	std	%i4,	[%l7 + %l6]
	and	%o5,	%l6,	%o4
	nop
	set	0x2C, %o3
	prefetch	[%l7 + %o3],	 4
	set	0x1D, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g7
	nop
	set	0x3C, %l3
	ldsh	[%l7 + %l3],	%g1
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f12
	nop
	set	0x39, %l0
	ldsb	[%l7 + %l0],	%i4
	nop
	set	0x10, %i5
	ldsh	[%l7 + %i5],	%g4
	set	0x60, %i2
	stda	%l0,	[%l7 + %i2] 0x88
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc2
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x89,	%f8
	nop
	set	0x38, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%i2
	add	%i0,	%i7,	%l3
	nop
	set	0x08, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x80,	%o1
	nop
	set	0x40, %i7
	swap	[%l7 + %i7],	%g6
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf1
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x50, %o0
	stx	%i6,	[%l7 + %o0]
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%o6
	or	%l5,	%o3,	%g5
	nop
	set	0x13, %o5
	ldsb	[%l7 + %o5],	%g3
	set	0x7C, %o4
	stwa	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%f13,	[%l7 + 0x2C]
	nop
	set	0x0E, %g7
	ldub	[%l7 + %g7],	%o0
	fpadd16	%f22,	%f20,	%f30
	set	0x18, %i6
	stha	%l4,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x08, %l4
	std	%f24,	[%l7 + %l4]
	nop
	set	0x6C, %g1
	stw	%o2,	[%l7 + %g1]
	set	0x40, %o7
	stda	%l2,	[%l7 + %o7] 0x80
	nop
	set	0x70, %g3
	std	%i0,	[%l7 + %g3]
	nop
	set	0x70, %g5
	std	%f8,	[%l7 + %g5]
	set	0x7C, %o2
	sta	%f25,	[%l7 + %o2] 0x89
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	set	0x50, %l6
	lda	[%l7 + %l6] 0x80,	%f27
	fpsub16s	%f2,	%f10,	%f28
	set	0x38, %i4
	sta	%f17,	[%l7 + %i4] 0x89
	set	0x68, %o3
	stwa	%l0,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x68, %o1
	stwa	%o7,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x80,	 3
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f4
	nop
	set	0x4C, %i2
	ldsw	[%l7 + %i2],	%o5
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x88,	 2
	set	0x60, %g4
	stda	%i4,	[%l7 + %g4] 0x80
	wr	%g7,	%g1,	%y
	nop
	set	0x33, %l5
	stb	%i4,	[%l7 + %l5]
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xea,	%o4
	nop
	set	0x6A, %g6
	lduh	[%l7 + %g6],	%l1
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd0
	or	%l3,	%o1,	%g6
	set	0x28, %i7
	stda	%i6,	[%l7 + %i7] 0x80
	set	0x1C, %i0
	sta	%f2,	[%l7 + %i0] 0x88
	and	%i6,	%o6,	%l5
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x81,	 3
	set	0x77, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g3
	set	0x70, %l2
	stxa	%g2,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x56, %o4
	stha	%o0,	[%l7 + %o4] 0x80
	and	%o3,	%o2,	%l4
	nop
	set	0x55, %g7
	ldsb	[%l7 + %g7],	%i1
	and	%l0,	%l2,	%i2
	set	0x44, %o5
	swapa	[%l7 + %o5] 0x81,	%o5
	set	0x2A, %i6
	stba	%o7,	[%l7 + %i6] 0x80
	set	0x51, %l4
	stba	%l6,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x72, %g3
	ldub	[%l7 + %g3],	%i5
	set	0x20, %g5
	sta	%f23,	[%l7 + %g5] 0x89
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i4
	nop
	set	0x54, %o2
	lduw	[%l7 + %o2],	%o4
	nop
	set	0x14, %l6
	ldsh	[%l7 + %l6],	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x88,	%i3,	%g7
	nop
	set	0x14, %i3
	ldsw	[%l7 + %i3],	%i0
	nop
	set	0x60, %i4
	stw	%g4,	[%l7 + %i4]
	set	0x76, %o3
	stha	%o1,	[%l7 + %o3] 0x88
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%l2
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x88,	%g6
	bn,pt	%xcc,	loop_150
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%i6
	nop
	set	0x0A, %i2
	stb	%i6,	[%l7 + %i2]
	nop
	set	0x28, %i5
	ldsw	[%l7 + %i5],	%l5
loop_150:
	nop
	set	0x30, %l5
	std	%f14,	[%l7 + %l5]
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x81,	 1
	fpsub32	%f20,	%f26,	%f0
	nop
	set	0x24, %o6
	ldsw	[%l7 + %o6],	%g5
	and	%g3,	%o0,	%g2
	nop
	set	0x2A, %g6
	ldstub	[%l7 + %g6],	%o2
	nop
	set	0x43, %l1
	ldstub	[%l7 + %l1],	%o3
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%i1
	set	0x70, %i0
	stda	%l4,	[%l7 + %i0] 0x80
	nop
	set	0x64, %g2
	stb	%l2,	[%l7 + %g2]
	set	0x36, %o0
	stha	%l0,	[%l7 + %o0] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x7C]
	set	0x50, %i1
	stxa	%i2,	[%l7 + %i1] 0x88
	nop
	set	0x48, %o4
	ldsh	[%l7 + %o4],	%o7
	nop
	set	0x14, %g7
	ldsw	[%l7 + %g7],	%l6
	nop
	set	0x20, %o5
	stx	%i5,	[%l7 + %o5]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%i4
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xeb,	%g0
	nop
	set	0x10, %l4
	ldsh	[%l7 + %l4],	%o4
	nop
	set	0x40, %l2
	ldsw	[%l7 + %l2],	%l1
	set	0x29, %o7
	stba	%i3,	[%l7 + %o7] 0x89
	nop
	set	0x70, %g3
	std	%i0,	[%l7 + %g3]
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f18
	nop
	set	0x54, %o2
	stw	%g7,	[%l7 + %o2]
	nop
	set	0x5C, %l6
	swap	[%l7 + %l6],	%g4
	nop
	set	0x7C, %i3
	ldsh	[%l7 + %i3],	%o1
	st	%f22,	[%l7 + 0x14]
	bleu,a,pn	%xcc,	loop_151
	nop
	set	0x24, %g5
	stw	%g6,	[%l7 + %g5]
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x80,	 1
loop_151:
	nop
	set	0x10, %o1
	swap	[%l7 + %o1],	%i6
	fpsub32s	%f11,	%f12,	%f22
	st	%f11,	[%l7 + 0x70]
	nop
	set	0x7E, %l0
	ldub	[%l7 + %l0],	%l5
	set	0x50, %l3
	sta	%f22,	[%l7 + %l3] 0x88
	nop
	set	0x28, %i2
	std	%l2,	[%l7 + %i2]
	nop
	set	0x78, %i5
	stw	%g5,	[%l7 + %i5]
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f22
	ld	[%l7 + 0x64],	%f24
	nop
	set	0x1F, %g4
	ldsb	[%l7 + %g4],	%g3
	add	%o6,	%o0,	%g2
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x41, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o2
	or	%i1,	%l4,	%o3
	set	0x24, %g6
	sta	%f18,	[%l7 + %g6] 0x88
	set	0x68, %i7
	stda	%l2,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f0
	set	0x6C, %l1
	stwa	%l0,	[%l7 + %l1] 0x81
	nop
	set	0x08, %g2
	lduw	[%l7 + %g2],	%i2
	nop
	set	0x0C, %o0
	sth	%l6,	[%l7 + %o0]
	set	0x1C, %o4
	stba	%o7,	[%l7 + %o4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%o5
	set	0x30, %i1
	stda	%i4,	[%l7 + %i1] 0x81
	nop
	set	0x0C, %o5
	stb	%i4,	[%l7 + %o5]
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x08, %l4
	std	%g0,	[%l7 + %l4]
	set	0x24, %l2
	stwa	%l1,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x63, %o7
	ldub	[%l7 + %o7],	%o4
	add	%i3,	%i0,	%g7
	st	%fsr,	[%l7 + 0x0C]
	set	0x23, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g4
	nop
	set	0x78, %o2
	lduw	[%l7 + %o2],	%o1
	nop
	set	0x28, %g1
	lduh	[%l7 + %g1],	%i7
	nop
	set	0x74, %i3
	sth	%g6,	[%l7 + %i3]
	set	0x40, %l6
	stxa	%l5,	[%l7 + %l6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x60],	%f16
	set	0x68, %g5
	ldxa	[%l7 + %g5] 0x88,	%i6
	nop
	set	0x5B, %o1
	stb	%g5,	[%l7 + %o1]
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x89,	%g2
	nop
	set	0x7E, %o3
	ldstub	[%l7 + %o3],	%o6
	nop
	set	0x38, %l3
	swap	[%l7 + %l3],	%o0
	set	0x68, %i2
	swapa	[%l7 + %i2] 0x80,	%l3
	nop
	set	0x68, %l5
	stx	%o2,	[%l7 + %l5]
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x44, %o6
	ldsh	[%l7 + %o6],	%g2
	fpsub16s	%f9,	%f24,	%f0
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x2C, %i4
	swapa	[%l7 + %i4] 0x80,	%l4
	nop
	set	0x44, %i7
	ldstub	[%l7 + %i7],	%i1
	nop
	set	0x14, %i0
	prefetch	[%l7 + %i0],	 4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x44, %o0
	ldsb	[%l7 + %o0],	%l2
	nop
	set	0x10, %g2
	std	%f26,	[%l7 + %g2]
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%o2
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f0
	nop
	set	0x1A, %i1
	ldsb	[%l7 + %i1],	%l0
	set	0x10, %i6
	stda	%i6,	[%l7 + %i6] 0x81
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x64, %l4
	ldsw	[%l7 + %l4],	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f16
	set	0x68, %o7
	lda	[%l7 + %o7] 0x80,	%f15
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x89,	%o5
	set	, %o2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1256
!	Type a   	: 17
!	Type cti   	: 25
!	Type x   	: 544
!	Type f   	: 32
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
	set	0x5,	%g1
	set	0x1,	%g2
	set	0x2,	%g3
	set	0xC,	%g4
	set	0x4,	%g5
	set	0xE,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xC,	%i1
	set	-0xD,	%i2
	set	-0xF,	%i3
	set	-0xE,	%i4
	set	-0x7,	%i5
	set	-0x0,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x70EC4246,	%l0
	set	0x75426CBC,	%l1
	set	0x40030AE3,	%l2
	set	0x1CA438BA,	%l3
	set	0x7C9D0979,	%l4
	set	0x6295495B,	%l5
	set	0x47318E5C,	%l6
	!# Output registers
	set	-0x1FF1,	%o0
	set	-0x1DAA,	%o1
	set	0x046C,	%o2
	set	0x1871,	%o3
	set	-0x07F5,	%o4
	set	0x1680,	%o5
	set	0x0670,	%o6
	set	0x024D,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%o6
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x89,	%i4
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%g1
	set	0x40, %l6
	sta	%f22,	[%l7 + %l6] 0x81
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x80,	%f21
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%i4
	nop
	set	0x26, %o1
	lduh	[%l7 + %o1],	%l1
	bn,a,pn	%icc,	loop_152
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x5D, %i2
	ldub	[%l7 + %i2],	%i0
	set	0x20, %o3
	stxa	%g7,	[%l7 + %o3] 0xe2
	membar	#Sync
loop_152:
	nop
	set	0x40, %l5
	stxa	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%i7
	nop
	set	0x68, %o6
	std	%o0,	[%l7 + %o6]
	set	0x70, %i5
	stda	%l4,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x1D, %i4
	stba	%i6,	[%l7 + %i4] 0x80
	nop
	set	0x46, %g4
	sth	%g5,	[%l7 + %g4]
	nop
	set	0x08, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%g3
	add	%o6,	%g6,	%l3
	set	0x58, %g6
	stda	%o0,	[%l7 + %g6] 0x89
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x89,	%g2
	nop
	set	0x70, %g2
	std	%l4,	[%l7 + %g2]
	nop
	set	0x0F, %o4
	stb	%o2,	[%l7 + %o4]
	or	%l2,	%i1,	%l0
	nop
	set	0x34, %g7
	lduh	[%l7 + %g7],	%o3
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x89,	 3
	nop
	set	0x2A, %i6
	ldsh	[%l7 + %i6],	%o5
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%o7
	set	0x08, %l4
	lda	[%l7 + %l4] 0x80,	%f3
	nop
	set	0x72, %o7
	ldsh	[%l7 + %o7],	%i2
	and	%i4,	%i5,	%l1
	nop
	set	0x7C, %g3
	prefetch	[%l7 + %g3],	 0
	nop
	set	0x40, %o5
	lduw	[%l7 + %o5],	%g1
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%o4
	st	%fsr,	[%l7 + 0x38]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%g4
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%i3
	set	0x5C, %i3
	sta	%f17,	[%l7 + %i3] 0x81
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xca
	set	0x14, %l6
	stwa	%g7,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf9
	membar	#Sync
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x54, %o1
	sta	%f19,	[%l7 + %o1] 0x88
	nop
	set	0x08, %i2
	swap	[%l7 + %i2],	%i7
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f14
	set	0x36, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o1
	nop
	set	0x70, %o6
	lduw	[%l7 + %o6],	%i6
	set	0x30, %i5
	sta	%f26,	[%l7 + %i5] 0x89
	and	%g5,	%l5,	%o6
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 2
	st	%f2,	[%l7 + 0x78]
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x81,	 4
	nop
	set	0x78, %g4
	std	%g2,	[%l7 + %g4]
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%o0
	and	%l3,	%l4,	%g2
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%o2
	set	0x58, %g6
	stba	%l2,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x56, %g2
	stha	%l0,	[%l7 + %g2] 0x80
	set	0x28, %i0
	sta	%f28,	[%l7 + %i0] 0x80
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f2
	nop
	set	0x0E, %g7
	stb	%o3,	[%l7 + %g7]
	nop
	set	0x3C, %i1
	stw	%i1,	[%l7 + %i1]
	and	%l6,	%o7,	%o5
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f10
	nop
	set	0x6B, %i6
	ldstub	[%l7 + %i6],	%i2
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x60, %o7
	std	%f18,	[%l7 + %o7]
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x89,	%i4
	nop
	set	0x3E, %l4
	lduh	[%l7 + %l4],	%i5
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x89,	%l1
	nop
	set	0x0C, %g1
	ldsw	[%l7 + %g1],	%g1
	nop
	nop
	setx	0x090D3603,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xD1C278CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f12,	%f2
	nop
	set	0x40, %i3
	std	%f14,	[%l7 + %i3]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	nop
	set	0x2A, %o2
	ldstub	[%l7 + %o2],	%i0
	nop
	set	0x70, %g5
	swap	[%l7 + %g5],	%i3
	set	0x64, %l0
	lda	[%l7 + %l0] 0x80,	%f6
	nop
	set	0x52, %l6
	lduh	[%l7 + %l6],	%g4
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%o1
	and	%i6,	%g7,	%g5
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f22
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%o6
	ld	[%l7 + 0x24],	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g3
	set	0x64, %i5
	sta	%f24,	[%l7 + %i5] 0x88
	fpadd32s	%f26,	%f26,	%f4
	bn,a,pn	%icc,	loop_153
	nop
	set	0x5E, %o6
	ldsh	[%l7 + %o6],	%o0
	ld	[%l7 + 0x70],	%f2
	nop
	set	0x30, %o3
	std	%l2,	[%l7 + %o3]
loop_153:
	nop
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f0
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x81,	%f27
	nop
	set	0x20, %i4
	swap	[%l7 + %i4],	%l4
	set	0x2A, %g6
	stha	%g6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x0C, %i7
	lduh	[%l7 + %i7],	%o2
	nop
	set	0x68, %i0
	std	%f6,	[%l7 + %i0]
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xeb,	%l2
	wr	%g2,	%o3,	%sys_tick
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%l0
	nop
	set	0x39, %i1
	stb	%l6,	[%l7 + %i1]
	nop
	set	0x5A, %o0
	sth	%o7,	[%l7 + %o0]
	and	%o5,	%i2,	%i4
	or	%i5,	%l1,	%g1
	nop
	set	0x0E, %g2
	lduh	[%l7 + %g2],	%i1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%i3
	set	0x68, %o7
	stxa	%o4,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f22
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g4
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%i6
	or	%g7,	%g5,	%o6
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%o0
	st	%f23,	[%l7 + 0x24]
	set	0x78, %g1
	lda	[%l7 + %g1] 0x80,	%f17
	add	%g3,	%o0,	%l3
	set	0x33, %i3
	ldstuba	[%l7 + %i3] 0x80,	%l4
	or	%l5,	%o2,	%g6
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f18
	nop
	set	0x1C, %o5
	lduw	[%l7 + %o5],	%l2
	nop
	set	0x08, %o2
	swap	[%l7 + %o2],	%g2
	nop
	set	0x76, %g5
	ldub	[%l7 + %g5],	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o3
	nop
	set	0x79, %l0
	ldub	[%l7 + %l0],	%o7
	set	0x7C, %i2
	stwa	%i2,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x80,	%o5
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x40, %l6
	lda	[%l7 + %l6] 0x88,	%f11
	nop
	set	0x0C, %i5
	swap	[%l7 + %i5],	%i4
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xea,	%i4
	add	%g1,	%i1,	%l1
	nop
	set	0x38, %o3
	ldstub	[%l7 + %o3],	%i0
	nop
	set	0x50, %o6
	std	%f30,	[%l7 + %o6]
	nop
	set	0x40, %l1
	std	%f30,	[%l7 + %l1]
	nop
	set	0x14, %g4
	stw	%i3,	[%l7 + %g4]
	set	0x38, %i4
	sta	%f21,	[%l7 + %i4] 0x89
	wr	%o4,	%i7,	%y
	add	%i6,	%g4,	%g5
	ld	[%l7 + 0x34],	%f23
	add	%g7,	%o6,	%o1
	nop
	set	0x30, %i7
	std	%o0,	[%l7 + %i7]
	nop
	set	0x5D, %g6
	ldsb	[%l7 + %g6],	%g3
	set	0x40, %o4
	stxa	%l4,	[%l7 + %o4] 0x89
	add	%l3,	%o2,	%l5
	st	%f0,	[%l7 + 0x38]
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x88,	%l2
	set	0x30, %i1
	stha	%g6,	[%l7 + %i1] 0x80
	nop
	set	0x30, %o0
	std	%f0,	[%l7 + %o0]
	set	0x08, %g7
	stwa	%g2,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x35, %o7
	ldsb	[%l7 + %o7],	%l0
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x81,	%l6
	ld	[%l7 + 0x58],	%f4
	nop
	set	0x70, %g2
	sth	%o3,	[%l7 + %g2]
	nop
	set	0x70, %l4
	std	%o6,	[%l7 + %l4]
	ld	[%l7 + 0x14],	%f6
	set	0x5B, %i6
	ldstuba	[%l7 + %i6] 0x88,	%i2
	set	0x1C, %i3
	stwa	%i4,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x60, %l2
	lduh	[%l7 + %l2],	%o5
	set	0x30, %o5
	stda	%i4,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x70, %o2
	stxa	%g1,	[%l7 + %o2] 0x81
	or	%i1,	%i0,	%i3
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%l0
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x80,	%i6
	add	%i6,	%o4,	%g5
	st	%f9,	[%l7 + 0x54]
	set	0x30, %l3
	stha	%g7,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x1E, %i2
	sth	%g4,	[%l7 + %i2]
	or	%o6,	%o0,	%g3
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%o1
	add	%l3,	%o2,	%l4
	nop
	set	0x24, %i5
	ldstub	[%l7 + %i5],	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%g2
	set	0x0A, %l5
	stha	%l0,	[%l7 + %l5] 0x81
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%l6
	ld	[%l7 + 0x44],	%f9
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%l2
	nop
	set	0x7D, %l1
	ldstub	[%l7 + %l1],	%o7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%i2
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x89,	%o5
	nop
	set	0x52, %i4
	ldub	[%l7 + %i4],	%i4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xca
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x81,	 4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd8,	%f16
	set	0x52, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i1
	set	0x7C, %i1
	sta	%f26,	[%l7 + %i1] 0x88
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xcc
	set	0x4C, %g7
	sta	%f20,	[%l7 + %g7] 0x88
	and	%i0,	%i5,	%l1
	set	0x5F, %o7
	stba	%i3,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i7
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%i6
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%g7
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%g4
	nop
	set	0x26, %g1
	ldstub	[%l7 + %g1],	%g5
	ld	[%l7 + 0x2C],	%f30
	set	0x48, %g3
	stxa	%o0,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x2A, %l2
	stb	%o6,	[%l7 + %l2]
	nop
	set	0x20, %o5
	std	%g2,	[%l7 + %o5]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%o2
	set	0x4A, %o2
	stba	%l4,	[%l7 + %o2] 0x81
	fpadd32s	%f23,	%f2,	%f24
	set	0x2A, %l0
	stha	%l5,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x40, %l3
	lduw	[%l7 + %l3],	%g6
	set	0x68, %g5
	stxa	%g2,	[%l7 + %g5] 0x80
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xeb,	%l0
	or	%l6,	%l2,	%o1
	fpsub16	%f16,	%f16,	%f10
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f26
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%o6
	nop
	set	0x60, %o3
	std	%i2,	[%l7 + %o3]
	set	0x46, %l6
	stha	%o5,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	set	0x18, %l1
	stha	%o3,	[%l7 + %l1] 0x80
	nop
	set	0x68, %l5
	std	%g0,	[%l7 + %l5]
	nop
	set	0x5C, %g4
	stw	%i4,	[%l7 + %g4]
	nop
	set	0x50, %i4
	std	%i0,	[%l7 + %i4]
	set	0x4C, %o6
	stba	%i1,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x70, %g6
	std	%f18,	[%l7 + %g6]
	nop
	set	0x30, %o4
	ldsb	[%l7 + %o4],	%i5
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	nop
	set	0x4A, %o0
	ldstub	[%l7 + %o0],	%l1
	set	0x10, %i7
	swapa	[%l7 + %i7] 0x81,	%i7
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%o4
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%i6
	set	0x6C, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g7
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x81,	%g4
	set	0x60, %i3
	ldstuba	[%l7 + %i3] 0x80,	%g4
	fpsub32	%f14,	%f28,	%f30
	nop
	set	0x4E, %g1
	ldsh	[%l7 + %g1],	%o0
	nop
	set	0x32, %i6
	stb	%o6,	[%l7 + %i6]
	add	%g3,	%o2,	%l3
	fpsub32	%f24,	%f24,	%f2
	nop
	set	0x5C, %g3
	prefetch	[%l7 + %g3],	 2
	and	%l5,	%l4,	%g2
	nop
	set	0x30, %o5
	ldsw	[%l7 + %o5],	%g6
	nop
	set	0x60, %l2
	std	%f6,	[%l7 + %l2]
	nop
	set	0x6E, %l0
	lduh	[%l7 + %l0],	%l6
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%l2
	set	0x20, %g5
	stwa	%o1,	[%l7 + %g5] 0x81
	nop
	set	0x7C, %o2
	stb	%l0,	[%l7 + %o2]
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x81,	%o7
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xea,	%o4
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x88,	 3
	nop
	set	0x18, %i5
	stx	%g1,	[%l7 + %i5]
	set	0x65, %l6
	stba	%i4,	[%l7 + %l6] 0xe2
	membar	#Sync
	add	%o3,	%i1,	%i0
	bleu,pt	%icc,	loop_154
	nop
	set	0x7C, %l1
	ldsw	[%l7 + %l1],	%i5
	nop
	set	0x20, %g4
	lduw	[%l7 + %g4],	%i3
	set	0x40, %l5
	stxa	%i7,	[%l7 + %l5] 0x81
loop_154:
	nop
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x80,	%o4
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x81,	 4
	nop
	set	0x4C, %i4
	swap	[%l7 + %i4],	%i6
	nop
	set	0x7C, %o4
	stw	%g5,	[%l7 + %o4]
	set	0x18, %i0
	stxa	%g4,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x09, %i7
	stba	%o0,	[%l7 + %i7] 0xea
	membar	#Sync
	fpadd16	%f2,	%f24,	%f2
	set	0x24, %o0
	stwa	%g7,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x28, %o7
	lda	[%l7 + %o7] 0x88,	%f20
	set	0x64, %i1
	stba	%o6,	[%l7 + %i1] 0xe2
	membar	#Sync
	ld	[%l7 + 0x10],	%f25
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%l3
	st	%fsr,	[%l7 + 0x48]
	set	0x0C, %g7
	lda	[%l7 + %g7] 0x89,	%f12
	nop
	set	0x30, %g2
	ldsh	[%l7 + %g2],	%l5
	set	0x60, %l4
	sta	%f12,	[%l7 + %l4] 0x88
	nop
	set	0x67, %i3
	ldub	[%l7 + %i3],	%l4
	nop
	set	0x20, %i6
	std	%g2,	[%l7 + %i6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%l6
	set	0x20, %g1
	stda	%g6,	[%l7 + %g1] 0x88
	set	0x1C, %g3
	stba	%l2,	[%l7 + %g3] 0x88
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x88,	%o1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%o7
	nop
	set	0x64, %o5
	ldsh	[%l7 + %o5],	%i2
	set	0x40, %l3
	stda	%o4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x10, %g5
	std	%i4,	[%l7 + %g5]
	nop
	set	0x30, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x10, %i2
	stw	%o3,	[%l7 + %i2]
	set	0x68, %o3
	stha	%i1,	[%l7 + %o3] 0x89
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xe3,	%i0
	set	0x48, %l6
	stwa	%i5,	[%l7 + %l6] 0x80
	nop
	set	0x42, %l1
	ldstub	[%l7 + %l1],	%i3
	and	%g1,	%o4,	%l1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x89,	%f24
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
	nop
	set	0x28, %g6
	lduw	[%l7 + %g6],	%i7
	nop
	set	0x7C, %i4
	sth	%g5,	[%l7 + %i4]
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%g4
	st	%f22,	[%l7 + 0x1C]
	and	%o0,	%g7,	%i6
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x88,	%o6
	set	0x53, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l3
	nop
	set	0x18, %i0
	stw	%o2,	[%l7 + %i0]
	add	%l5,	%l4,	%g3
	nop
	set	0x74, %o7
	ldsh	[%l7 + %o7],	%l6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%l0
	set	0x40, %i1
	lda	[%l7 + %i1] 0x80,	%f15
	set	0x1C, %g7
	sta	%f6,	[%l7 + %g7] 0x81
	st	%f26,	[%l7 + 0x7C]
	set	0x08, %g2
	stwa	%o7,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x60, %l4
	swapa	[%l7 + %l4] 0x81,	%i2
	nop
	set	0x78, %i3
	std	%f30,	[%l7 + %i3]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i4
	add	%o3,	%o5,	%i0
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc8
	wr	%i5,	%i1,	%set_softint
	nop
	set	0x50, %o0
	stw	%i3,	[%l7 + %o0]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f0
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o4
	nop
	set	0x7B, %l0
	ldsb	[%l7 + %l0],	%i7
	set	0x40, %o5
	stba	%g4,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x28, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%i6
	nop
	set	0x40, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x80,	%o0
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x88,	%l3
	and	%o6,	%l5,	%l4
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xe2,	%g2
	st	%fsr,	[%l7 + 0x08]
	set	0x5A, %i2
	stha	%l6,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x5C]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x58, %l6
	std	%o0,	[%l7 + %l6]
	nop
	set	0x77, %l1
	ldsb	[%l7 + %l1],	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i2
	nop
	set	0x08, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x89,	%g6
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f16
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f0
	st	%f19,	[%l7 + 0x78]
	ld	[%l7 + 0x30],	%f17
	st	%fsr,	[%l7 + 0x78]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
	set	0x6D, %o6
	ldstuba	[%l7 + %o6] 0x89,	%l2
	or	%i4,	%o5,	%o3
	nop
	set	0x60, %i5
	ldub	[%l7 + %i5],	%i5
	nop
	set	0x64, %i7
	stw	%i1,	[%l7 + %i7]
	nop
	set	0x58, %o4
	stx	%i0,	[%l7 + %o4]
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x0C, %o7
	sta	%f14,	[%l7 + %o7] 0x81
	nop
	set	0x58, %i1
	ldsw	[%l7 + %i1],	%i3
	nop
	set	0x61, %g7
	ldstub	[%l7 + %g7],	%g1
	nop
	set	0x1C, %l4
	ldstub	[%l7 + %l4],	%o4
	set	0x70, %i3
	stxa	%l1,	[%l7 + %i3] 0x81
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i7
	nop
	set	0x20, %g2
	ldsw	[%l7 + %g2],	%g5
	nop
	set	0x49, %o0
	ldub	[%l7 + %o0],	%i6
	nop
	set	0x1C, %g1
	ldsw	[%l7 + %g1],	%g7
	and	%l3,	%o0,	%o6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f0
	set	0x71, %l2
	stba	%l4,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x73, %g3
	ldstuba	[%l7 + %g3] 0x89,	%l5
	add	%g3,	%l6,	%o2
	nop
	set	0x60, %o5
	std	%f26,	[%l7 + %o5]
	nop
	set	0x18, %g5
	ldsh	[%l7 + %g5],	%o1
	nop
	set	0x3A, %o2
	lduh	[%l7 + %o2],	%l0
	set	0x4C, %l3
	sta	%f18,	[%l7 + %l3] 0x88
	set	0x3E, %i2
	stha	%o7,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x5BECF49D7C9512F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x445EA97EA7C1C25E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f20,	%f8
	set	0x09, %o3
	stba	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	set	0x3C, %l1
	stwa	%g2,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x10, %o1
	ldxa	[%l7 + %o1] 0x81,	%g6
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%l2
	nop
	set	0x68, %l5
	std	%i4,	[%l7 + %l5]
	set	0x40, %i4
	ldxa	[%l7 + %i4] 0x89,	%o3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%i1
	nop
	set	0x20, %o6
	prefetch	[%l7 + %o6],	 0
	ld	[%l7 + 0x10],	%f4
	nop
	set	0x78, %g6
	std	%i0,	[%l7 + %g6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%g1
	ld	[%l7 + 0x54],	%f6
	nop
	set	0x28, %i5
	swap	[%l7 + %i5],	%i3
	nop
	set	0x78, %i7
	stb	%l1,	[%l7 + %i7]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%o4
	nop
	set	0x20, %o4
	stx	%g5,	[%l7 + %o4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%i6
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x80,	 2
	add	%g7,	%o6,	%o0
	fpadd16	%f16,	%f14,	%f6
	nop
	set	0x0C, %i0
	lduw	[%l7 + %i0],	%l4
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x80
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x89,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o2
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f0
	fpadd16	%f28,	%f14,	%f30
	fpadd32	%f30,	%f30,	%f20
	st	%f5,	[%l7 + 0x44]
	nop
	set	0x50, %i1
	std	%o0,	[%l7 + %i1]
	and	%l0,	%o7,	%l5
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%g2
	add	%i2,	%l2,	%i4
	nop
	set	0x20, %o0
	stx	%fsr,	[%l7 + %o0]
	ba,pn	%icc,	loop_155
	nop
	set	0x0C, %g1
	swap	[%l7 + %g1],	%g6
	set	0x38, %i6
	sta	%f7,	[%l7 + %i6] 0x80
loop_155:
	nop
	set	0x40, %l0
	std	%f20,	[%l7 + %l0]
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x88,	 2
	nop
	set	0x7A, %l2
	ldstub	[%l7 + %l2],	%o5
	nop
	nop
	setx	0x2A42B8E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xCA153F5F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f7,	%f2
	add	%i0,	%i1,	%i5
	add	%g1,	%l1,	%g4
	set	0x30, %o2
	stxa	%i3,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x78, %l3
	sth	%o4,	[%l7 + %l3]
	bleu,a	%icc,	loop_156
	st	%f5,	[%l7 + 0x7C]
	nop
	set	0x2A, %i2
	ldub	[%l7 + %i2],	%g5
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%i6
loop_156:
	nop
	set	0x4E, %o3
	lduh	[%l7 + %o3],	%l3
	set	0x30, %l6
	lda	[%l7 + %l6] 0x89,	%f27
	nop
	set	0x2C, %o1
	prefetch	[%l7 + %o1],	 0
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc8
	set	0x4C, %l5
	stha	%i7,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x40, %i4
	std	%o6,	[%l7 + %i4]
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f16
	nop
	set	0x5C, %g6
	swap	[%l7 + %g6],	%g7
	st	%f7,	[%l7 + 0x50]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x80,	%l4
	nop
	set	0x34, %i7
	stb	%g3,	[%l7 + %i7]
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x88,	 2
	nop
	set	0x34, %i5
	stw	%o2,	[%l7 + %i5]
	add	%o1,	%l0,	%l6
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x77, %i0
	ldsb	[%l7 + %i0],	%l5
	nop
	set	0x24, %o7
	sth	%g2,	[%l7 + %o7]
	st	%f21,	[%l7 + 0x54]
	nop
	set	0x22, %g7
	ldsh	[%l7 + %g7],	%i2
	nop
	set	0x48, %i3
	ldsh	[%l7 + %i3],	%l2
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	nop
	set	0x12, %g2
	ldsb	[%l7 + %g2],	%g6
	nop
	set	0x38, %l4
	lduh	[%l7 + %l4],	%o3
	nop
	set	0x32, %o0
	sth	%o7,	[%l7 + %o0]
	set	0x6C, %g1
	lda	[%l7 + %g1] 0x89,	%f2
	nop
	set	0x68, %i6
	std	%f16,	[%l7 + %i6]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i1
	set	0x6A, %l0
	ldstuba	[%l7 + %l0] 0x89,	%i0
	st	%f13,	[%l7 + 0x34]
	ld	[%l7 + 0x0C],	%f7
	nop
	set	0x24, %g3
	sth	%g1,	[%l7 + %g3]
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%i5
	nop
	set	0x18, %l2
	lduh	[%l7 + %l2],	%l1
	set	0x54, %l3
	lda	[%l7 + %l3] 0x80,	%f2
	nop
	set	0x63, %i2
	ldstub	[%l7 + %i2],	%g4
	nop
	set	0x1B, %g5
	ldsb	[%l7 + %g5],	%o4
	set	0x2C, %o2
	stwa	%i3,	[%l7 + %o2] 0x80
	st	%f4,	[%l7 + 0x24]
	nop
	set	0x6E, %l6
	ldsh	[%l7 + %l6],	%i6
	fpadd16	%f18,	%f4,	%f0
	set	0x72, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l3
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	nop
	set	0x40, %l5
	stw	%o6,	[%l7 + %l5]
	nop
	set	0x30, %i4
	ldsw	[%l7 + %i4],	%g7
	set	0x44, %o3
	lda	[%l7 + %o3] 0x89,	%f11
	nop
	set	0x20, %g6
	lduh	[%l7 + %g6],	%l4
	nop
	set	0x60, %o6
	stw	%g3,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x2C]
	fpadd32	%f2,	%f30,	%f10
	nop
	set	0x6C, %l1
	lduw	[%l7 + %l1],	%i7
	set	0x72, %i7
	stba	%o2,	[%l7 + %i7] 0x81
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f16
	nop
	set	0x0C, %i0
	lduw	[%l7 + %i0],	%o0
	set	0x60, %o4
	ldda	[%l7 + %o4] 0xe3,	%o0
	nop
	set	0x62, %g7
	ldsb	[%l7 + %g7],	%l0
	ld	[%l7 + 0x68],	%f28
	nop
	set	0x10, %i3
	std	%f24,	[%l7 + %i3]
	or	%l6,	%g2,	%l5
	set	0x64, %i1
	sta	%f7,	[%l7 + %i1] 0x81
	or	%i2,	%l2,	%g6
	nop
	set	0x24, %o7
	lduw	[%l7 + %o7],	%o3
	set	0x0C, %l4
	sta	%f8,	[%l7 + %l4] 0x89
	nop
	set	0x18, %o0
	std	%o6,	[%l7 + %o0]
	ld	[%l7 + 0x10],	%f30
	nop
	set	0x14, %g1
	ldsh	[%l7 + %g1],	%i4
	or	%i1,	%o5,	%g1
	nop
	nop
	setx	0x98808E5EE4400D99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x64C1F69F6988953E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f22,	%f2
	and	%i0,	%i5,	%g4
	and	%o4,	%i3,	%i6
	wr	%l3,	%l1,	%sys_tick
	set	0x3F, %g2
	stba	%g5,	[%l7 + %g2] 0x80
	wr	%g7,	%o6,	%sys_tick
	set	0x48, %i6
	lda	[%l7 + %i6] 0x89,	%f6
	st	%fsr,	[%l7 + 0x3C]
	ld	[%l7 + 0x0C],	%f6
	and	%g3,	%l4,	%o2
	set	0x20, %g3
	lda	[%l7 + %g3] 0x81,	%f6
	set	0x33, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x12, %l2
	ldsh	[%l7 + %l2],	%i7
	set	0x0F, %l0
	stba	%l0,	[%l7 + %l0] 0x89
	wr	%o1,	%l6,	%clear_softint
	set	0x30, %i2
	stda	%g2,	[%l7 + %i2] 0x81
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%l5
	ld	[%l7 + 0x3C],	%f6
	st	%f19,	[%l7 + 0x40]
	nop
	set	0x78, %o2
	stx	%l2,	[%l7 + %o2]
	nop
	set	0x10, %g5
	ldstub	[%l7 + %g5],	%g6
	nop
	set	0x12, %l6
	lduh	[%l7 + %l6],	%i2
	st	%f28,	[%l7 + 0x3C]
	nop
	set	0x6A, %g4
	ldsb	[%l7 + %g4],	%o3
	set	0x08, %l5
	ldxa	[%l7 + %l5] 0x89,	%o7
	add	%i4,	%o5,	%g1
	nop
	set	0x24, %i4
	stw	%i0,	[%l7 + %i4]
	fpsub16s	%f14,	%f26,	%f4
	nop
	set	0x6E, %o1
	lduh	[%l7 + %o1],	%i5
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%g4
	set	0x30, %o6
	stba	%o4,	[%l7 + %o6] 0x81
	ld	[%l7 + 0x30],	%f15
	set	0x38, %g6
	stda	%i2,	[%l7 + %g6] 0x89
	nop
	set	0x20, %i7
	stw	%i1,	[%l7 + %i7]
	and	%i6,	%l3,	%l1
	nop
	set	0x54, %l1
	ldsh	[%l7 + %l1],	%g7
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xea,	%g4
	nop
	set	0x44, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x4E, %i0
	stb	%o6,	[%l7 + %i0]
	nop
	set	0x2C, %g7
	ldsw	[%l7 + %g7],	%l4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f0
	bleu	%icc,	loop_157
	add	%o2,	%o0,	%g3
	nop
	set	0x15, %o7
	ldsb	[%l7 + %o7],	%i7
	set	0x34, %i3
	lda	[%l7 + %i3] 0x81,	%f13
loop_157:
	nop
	set	0x58, %o0
	std	%o0,	[%l7 + %o0]
	nop
	set	0x4C, %g1
	stw	%l6,	[%l7 + %g1]
	ld	[%l7 + 0x2C],	%f19
	nop
	set	0x5C, %l4
	swap	[%l7 + %l4],	%l0
	add	%g2,	%l2,	%g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%i2
	set	0x14, %g2
	lda	[%l7 + %g2] 0x81,	%f15
	ld	[%l7 + 0x68],	%f2
	st	%f2,	[%l7 + 0x74]
	nop
	set	0x58, %g3
	lduw	[%l7 + %g3],	%o7
	nop
	set	0x43, %o5
	ldub	[%l7 + %o5],	%o3
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	set	0x08, %i6
	stda	%g0,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x15, %i2
	stba	%i4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x40, %l0
	stw	%i5,	[%l7 + %l0]
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%g4
	be,pt	%icc,	loop_158
	nop
	set	0x10, %l3
	ldsh	[%l7 + %l3],	%o4
	fpadd32s	%f5,	%f5,	%f24
	or	%i3,	%i0,	%i6
loop_158:
	nop
	set	0x50, %g5
	stha	%l3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xca
	set	0x5F, %l5
	stba	%i1,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x0E, %i4
	ldsb	[%l7 + %i4],	%l1
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	nop
	set	0x58, %o3
	lduh	[%l7 + %o3],	%o6
	st	%f16,	[%l7 + 0x20]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf8
	membar	#Sync
	set	0x10, %g4
	ldda	[%l7 + %g4] 0xe2,	%l4
	nop
	set	0x5E, %g6
	ldstub	[%l7 + %g6],	%g7
	set	0x28, %i7
	stda	%o2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x6A, %i5
	lduh	[%l7 + %i5],	%o0
	or	%i7,	%g3,	%l6
	or	%l0,	%g2,	%l2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xeb,	%g6
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%l5
	st	%f11,	[%l7 + 0x38]
	nop
	set	0x6F, %i0
	ldstub	[%l7 + %i0],	%i2
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xc2
	nop
	set	0x68, %o7
	stx	%o7,	[%l7 + %o7]
	fpadd16	%f18,	%f0,	%f4
	set	0x11, %i1
	ldstuba	[%l7 + %i1] 0x89,	%o1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x89
	nop
	set	0x08, %o0
	swap	[%l7 + %o0],	%o5
	and	%g1,	%i4,	%o3
	ld	[%l7 + 0x68],	%f8
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%i5
	ld	[%l7 + 0x40],	%f14
	set	0x30, %l4
	lda	[%l7 + %l4] 0x88,	%f27
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x80,	%g4
	st	%f18,	[%l7 + 0x6C]
	nop
	set	0x2C, %o5
	lduh	[%l7 + %o5],	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o4
	nop
	set	0x10, %l2
	std	%f30,	[%l7 + %l2]
	nop
	set	0x30, %g2
	std	%i6,	[%l7 + %g2]
	st	%f25,	[%l7 + 0x28]
	set	0x38, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	nop
	set	0x50, %l0
	ldstub	[%l7 + %l0],	%l3
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%l1
	nop
	set	0x64, %o2
	swap	[%l7 + %o2],	%o6
	set	0x3A, %l3
	stha	%l4,	[%l7 + %l3] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	st	%fsr,	[%l7 + 0x5C]
	set	0x7D, %g5
	stba	%g5,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x89,	%g7
	nop
	set	0x08, %o1
	std	%o0,	[%l7 + %o1]
	set	0x58, %o3
	sta	%f23,	[%l7 + %o3] 0x80
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xeb,	%o2
	or	%i7,	%l6,	%g3
	nop
	set	0x40, %g4
	stx	%l0,	[%l7 + %g4]
	or	%g2,	%g6,	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%l5
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%o5
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%g1
	set	0x68, %g6
	stxa	%o7,	[%l7 + %g6] 0xe3
	membar	#Sync
	or	%o3,	%i4,	%i5
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x80,	%i3
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe2,	%i0
	nop
	set	0x4E, %i0
	lduh	[%l7 + %i0],	%g4
	set	0x36, %g7
	stba	%o4,	[%l7 + %g7] 0x88
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f0
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x88,	%i0
	add	%l3,	%i6,	%l1
	nop
	set	0x78, %o0
	stx	%o6,	[%l7 + %o0]
	set	0x58, %i1
	swapa	[%l7 + %i1] 0x88,	%l4
	nop
	set	0x2C, %l4
	stw	%g7,	[%l7 + %l4]
	set	0x27, %g3
	ldstuba	[%l7 + %g3] 0x89,	%o0
	wr	%o2,	%i7,	%softint
	nop
	set	0x18, %g1
	lduh	[%l7 + %g1],	%g5
	or	%l6,	%l0,	%g3
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x48, %g2
	std	%g6,	[%l7 + %g2]
	ld	[%l7 + 0x28],	%f13
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%g2
	set	0x4F, %l0
	ldstuba	[%l7 + %l0] 0x89,	%l2
	add	%l5,	%i2,	%o1
	nop
	set	0x66, %o5
	sth	%o5,	[%l7 + %o5]
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%g1
	set	0x38, %l3
	stda	%o2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x53, %l6
	stb	%i4,	[%l7 + %l6]
	add	%i3,	%i5,	%i0
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%i1
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xe3,	%g4
	nop
	set	0x2C, %i4
	stw	%l3,	[%l7 + %i4]
	set	0x74, %o3
	lda	[%l7 + %o3] 0x88,	%f26
	set	0x64, %g4
	sta	%f23,	[%l7 + %g4] 0x81
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f10
	add	%l1,	%o6,	%l4
	nop
	set	0x28, %i7
	ldsw	[%l7 + %i7],	%g7
	nop
	set	0x28, %i5
	ldsw	[%l7 + %i5],	%i6
	nop
	set	0x60, %g6
	std	%o2,	[%l7 + %g6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%i7
	nop
	nop
	setx	0xB33C2305,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x7744FCDF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f1,	%f15
	st	%fsr,	[%l7 + 0x50]
	bl,a	%icc,	loop_159
	nop
	set	0x10, %i0
	ldsw	[%l7 + %i0],	%g5
	nop
	set	0x18, %g7
	swap	[%l7 + %g7],	%l0
	st	%f25,	[%l7 + 0x60]
loop_159:
	and	%g3,	%g6,	%g2
	nop
	set	0x10, %l1
	std	%i6,	[%l7 + %l1]
	nop
	set	0x1E, %o4
	ldstub	[%l7 + %o4],	%l5
	nop
	set	0x3C, %i3
	lduw	[%l7 + %i3],	%i2
	st	%f6,	[%l7 + 0x60]
	nop
	set	0x6D, %o0
	stb	%o1,	[%l7 + %o0]
	wr	%l2,	%o7,	%clear_softint
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g1
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0
	nop
	set	0x58, %i1
	lduw	[%l7 + %i1],	%i3
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x15, %g1
	stb	%i0,	[%l7 + %g1]
	nop
	set	0x5B, %l2
	ldub	[%l7 + %l2],	%o4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f0
	ld	[%l7 + 0x44],	%f25
	and	%i1,	%i5,	%g4
	nop
	set	0x58, %l4
	stw	%l3,	[%l7 + %l4]
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x81,	%l1
	wr	%o6,	%g7,	%ccr
	fpsub32s	%f23,	%f12,	%f30
	add	%i6,	%l4,	%o0
	add	%o2,	%i7,	%l0
	nop
	nop
	setx	0x6923746C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x5F642357,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f2,	%f6
	nop
	set	0x1E, %l0
	lduh	[%l7 + %l0],	%g5
	nop
	set	0x68, %o2
	stx	%g3,	[%l7 + %o2]
	ld	[%l7 + 0x34],	%f4
	add	%g6,	%g2,	%l6
	set	0x3A, %i6
	stha	%l5,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x74, %o5
	lduw	[%l7 + %o5],	%i2
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%l2
	nop
	set	0x78, %l6
	swap	[%l7 + %l6],	%o7
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%o1
	fpsub32	%f12,	%f6,	%f6
	set	0x48, %o1
	stwa	%g1,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x50, %g5
	stw	%o5,	[%l7 + %g5]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd0
	nop
	set	0x49, %i4
	ldstub	[%l7 + %i4],	%i4
	ld	[%l7 + 0x7C],	%f27
	st	%f29,	[%l7 + 0x0C]
	set	0x08, %o6
	lda	[%l7 + %o6] 0x89,	%f25
	set	0x64, %g4
	stwa	%i3,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x28, %i7
	stda	%i0,	[%l7 + %i7] 0x89
	nop
	set	0x10, %g6
	ldsh	[%l7 + %g6],	%o3
	set	0x50, %i5
	sta	%f16,	[%l7 + %i5] 0x80
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%o4
	nop
	set	0x6C, %l1
	ldstub	[%l7 + %l1],	%i5
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%l1
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%g6
	nop
	set	0x5B, %o4
	ldsb	[%l7 + %o4],	%o6
	ld	[%l7 + 0x68],	%f25
	set	0x60, %o0
	stda	%i6,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x89,	 4
	nop
	set	0x20, %i1
	stx	%o2,	[%l7 + %i1]
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f14
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x50, %g3
	std	%o0,	[%l7 + %g3]
	set	0x6C, %l2
	swapa	[%l7 + %l2] 0x80,	%l0
	set	0x11, %g1
	stba	%g5,	[%l7 + %g1] 0xea
	membar	#Sync
	and	%g3,	%i7,	%g6
	set	0x56, %l4
	stba	%g2,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x60, %i2
	stwa	%l6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%i2
	wr	%l5,	%l2,	%softint
	set	0x18, %g2
	stxa	%o1,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x48, %o2
	sta	%f23,	[%l7 + %o2] 0x88
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x89,	%o7
	set	0x54, %i6
	lda	[%l7 + %i6] 0x81,	%f8
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i4
	nop
	set	0x50, %l6
	std	%f18,	[%l7 + %l6]
	or	%o5,	%i3,	%o3
	bgu	%icc,	loop_160
	nop
	set	0x72, %l5
	lduh	[%l7 + %l5],	%o4
	or	%i0,	%i5,	%i1
	nop
	set	0x69, %l3
	ldsb	[%l7 + %l3],	%l3
loop_160:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%l1
	nop
	set	0x14, %o1
	ldsw	[%l7 + %o1],	%g7
	set	0x7A, %o3
	ldstuba	[%l7 + %o3] 0x80,	%o6
	nop
	set	0x2C, %g5
	swap	[%l7 + %g5],	%i6
	wr	%l4,	%o2,	%clear_softint
	nop
	set	0x4E, %i4
	stb	%o0,	[%l7 + %i4]
	nop
	set	0x70, %o6
	ldsh	[%l7 + %o6],	%g5
	set	0x44, %g4
	sta	%f10,	[%l7 + %g4] 0x88
	nop
	set	0x68, %g6
	std	%g2,	[%l7 + %g6]
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x58, %g7
	std	%f8,	[%l7 + %g7]
	nop
	set	0x48, %i7
	stx	%l0,	[%l7 + %i7]
	ld	[%l7 + 0x58],	%f25
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%g6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xe3,	%g2
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%l6
	nop
	set	0x31, %o4
	stb	%i2,	[%l7 + %o4]
	set	0x2C, %i3
	sta	%f22,	[%l7 + %i3] 0x81
	set	0x3C, %g3
	sta	%f15,	[%l7 + %g3] 0x80
	set	0x50, %l2
	stxa	%l5,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x3C, %i1
	swapa	[%l7 + %i1] 0x89,	%i7
	nop
	set	0x50, %l4
	ldsw	[%l7 + %l4],	%o1
	set	0x40, %g1
	stxa	%l2,	[%l7 + %g1] 0x80
	nop
	set	0x78, %i2
	std	%f24,	[%l7 + %i2]
	fpadd32	%f18,	%f4,	%f2
	nop
	set	0x68, %g2
	lduh	[%l7 + %g2],	%o7
	st	%fsr,	[%l7 + 0x68]
	or	%g1,	%o5,	%i3
	set	0x74, %o2
	lda	[%l7 + %o2] 0x81,	%f27
	nop
	set	0x76, %l0
	sth	%o3,	[%l7 + %l0]
	nop
	set	0x58, %o5
	stx	%i4,	[%l7 + %o5]
	nop
	set	0x18, %i6
	std	%f2,	[%l7 + %i6]
	nop
	set	0x71, %l6
	ldub	[%l7 + %l6],	%o4
	ld	[%l7 + 0x18],	%f21
	set	0x41, %l5
	stba	%i0,	[%l7 + %l5] 0xe3
	membar	#Sync
	ld	[%l7 + 0x6C],	%f26
	st	%f25,	[%l7 + 0x14]
	nop
	set	0x2C, %l3
	prefetch	[%l7 + %l3],	 1
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f16
	nop
	set	0x3A, %g5
	sth	%i1,	[%l7 + %g5]
	st	%f10,	[%l7 + 0x6C]
	nop
	set	0x38, %i4
	stw	%i5,	[%l7 + %i4]
	set	0x1C, %o3
	swapa	[%l7 + %o3] 0x88,	%g4
	st	%f30,	[%l7 + 0x6C]
	and	%l1,	%l3,	%g7
	set	0x16, %g4
	stha	%o6,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x72, %g6
	stha	%l4,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x40, %o6
	std	%f4,	[%l7 + %o6]
	set	0x0D, %g7
	stba	%i6,	[%l7 + %g7] 0xeb
	membar	#Sync
	wr 	%g0, 	0x7, 	%fprs
	set	0x70, %i7
	lda	[%l7 + %i7] 0x80,	%f1
	and	%o2,	%l0,	%g3
	fpsub32s	%f7,	%f30,	%f17
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x50, %l1
	stda	%g2,	[%l7 + %l1] 0x80
	nop
	set	0x7C, %o0
	ldsw	[%l7 + %o0],	%g6
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%i2
	nop
	set	0x18, %i0
	ldsh	[%l7 + %i0],	%l6
	set	0x2C, %i3
	lda	[%l7 + %i3] 0x80,	%f31
	add	%l5,	%i7,	%l2
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f24
	fpadd16	%f14,	%f30,	%f4
	st	%f0,	[%l7 + 0x30]
	bne,pt	%xcc,	loop_161
	nop
	set	0x1C, %g3
	swap	[%l7 + %g3],	%o7
	st	%f21,	[%l7 + 0x7C]
	nop
	set	0x6C, %i1
	stb	%g1,	[%l7 + %i1]
loop_161:
	nop
	set	0x38, %l4
	sta	%f20,	[%l7 + %l4] 0x88
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x80,	%o1
	be,pn	%xcc,	loop_162
	nop
	set	0x66, %i2
	stb	%i3,	[%l7 + %i2]
	ld	[%l7 + 0x40],	%f12
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%i4
loop_162:
	nop
	set	0x5C, %g2
	lda	[%l7 + %g2] 0x81,	%f23
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xeb,	%o4
	set	0x54, %l0
	sta	%f21,	[%l7 + %l0] 0x80
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x81,	 2
	nop
	set	0x7B, %i6
	ldstub	[%l7 + %i6],	%i1
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	add	%i5,	%g4,	%l3
	nop
	set	0x60, %l5
	stw	%l1,	[%l7 + %l5]
	set	0x13, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g7
	or	%o6,	%i6,	%l4
	nop
	set	0x48, %o1
	lduh	[%l7 + %o1],	%g5
	set	0x44, %l3
	stha	%o0,	[%l7 + %l3] 0xeb
	membar	#Sync
	wr	%l0,	%g3,	%pic
	nop
	set	0x68, %g5
	stx	%g2,	[%l7 + %g5]
	set	0x74, %o3
	sta	%f29,	[%l7 + %o3] 0x80
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%g6
	nop
	set	0x26, %g4
	ldsb	[%l7 + %g4],	%l6
	ble,pn	%icc,	loop_163
	nop
	set	0x42, %g6
	ldub	[%l7 + %g6],	%i2
	nop
	set	0x26, %o6
	sth	%i7,	[%l7 + %o6]
	ld	[%l7 + 0x08],	%f18
loop_163:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f16
	nop
	set	0x20, %i7
	ldsw	[%l7 + %i7],	%l5
	nop
	set	0x10, %i4
	std	%f28,	[%l7 + %i4]
	nop
	set	0x2D, %l1
	ldub	[%l7 + %l1],	%l2
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%o7
	nop
	set	0x6C, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	set	0x48, %i0
	stwa	%g1,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%o1
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xea,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%o4
	nop
	set	0x72, %g3
	lduh	[%l7 + %g3],	%i4
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f24
	nop
	set	0x44, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x18, %i2
	lduw	[%l7 + %i2],	%i1
	nop
	set	0x38, %g2
	std	%f18,	[%l7 + %g2]
	nop
	set	0x40, %i1
	lduw	[%l7 + %i1],	%o3
	wr	%i5,	%g4,	%softint
	and	%l3,	%i0,	%g7
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%l0
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x81,	%o6
	set	0x28, %o2
	stxa	%l4,	[%l7 + %o2] 0xe3
	membar	#Sync
	and	%i6,	%o0,	%l0
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%g5
	nop
	set	0x28, %l5
	std	%g2,	[%l7 + %l5]
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x88,	%o2
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 4
	nop
	set	0x19, %l3
	ldub	[%l7 + %l3],	%g6
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x88,	 3
	nop
	set	0x0E, %g5
	ldsh	[%l7 + %g5],	%l6
	nop
	set	0x20, %o3
	ldsb	[%l7 + %o3],	%i7
	nop
	set	0x0F, %g6
	ldsb	[%l7 + %g6],	%i2
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%l2
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x80,	%l5
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%g1
	nop
	set	0x5B, %i7
	stb	%o7,	[%l7 + %i7]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%o5
	set	0x38, %i4
	stxa	%o4,	[%l7 + %i4] 0x88
	nop
	set	0x10, %i5
	swap	[%l7 + %i5],	%i4
	nop
	set	0x3B, %o0
	ldsb	[%l7 + %o0],	%i1
	ba,a,pt	%xcc,	loop_164
	nop
	set	0x30, %o7
	stx	%o1,	[%l7 + %o7]
	st	%f17,	[%l7 + 0x40]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x88
loop_164:
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x20, %o4
	stw	%l3,	[%l7 + %o4]
	set	0x38, %i3
	sta	%f30,	[%l7 + %i3] 0x89
	nop
	set	0x1F, %g3
	ldsb	[%l7 + %g3],	%i0
	and	%o3,	%l1,	%g7
	set	0x60, %i0
	stwa	%l4,	[%l7 + %i0] 0x89
	set	0x7B, %l4
	stba	%o6,	[%l7 + %l4] 0x89
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x88,	%i6
	nop
	set	0x54, %l2
	stw	%l0,	[%l7 + %l2]
	set	0x58, %g2
	stxa	%o0,	[%l7 + %g2] 0x80
	nop
	set	0x2C, %l0
	stb	%g2,	[%l7 + %l0]
	set	0x34, %i1
	lda	[%l7 + %i1] 0x89,	%f27
	set	0x08, %g1
	lda	[%l7 + %g1] 0x80,	%f12
	st	%f26,	[%l7 + 0x28]
	nop
	set	0x38, %o2
	prefetch	[%l7 + %o2],	 1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g6
	set	0x78, %l5
	lda	[%l7 + %l5] 0x80,	%f21
	fpsub32	%f0,	%f22,	%f18
	nop
	set	0x24, %l6
	prefetch	[%l7 + %l6],	 0
	or	%g3,	%g5,	%i7
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x88,	 3
	nop
	set	0x78, %l3
	stw	%l2,	[%l7 + %l3]
	set	0x1C, %o1
	swapa	[%l7 + %o1] 0x88,	%l6
	nop
	set	0x3B, %i6
	ldstub	[%l7 + %i6],	%g1
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x80,	%o7
	nop
	set	0x14, %o3
	ldsh	[%l7 + %o3],	%i3
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xeb,	%o4
	nop
	set	0x6C, %g6
	ldsb	[%l7 + %g6],	%l5
	add	%o4,	%i4,	%o1
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x89,	%i5
	bgu	%icc,	loop_165
	nop
	set	0x7C, %g4
	ldub	[%l7 + %g4],	%i1
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f28
	nop
	set	0x6F, %i5
	ldsb	[%l7 + %i5],	%g4
loop_165:
	nop
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x89,	%l2
	or	%o3,	%l1,	%g7
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f14
	nop
	set	0x64, %l1
	lduh	[%l7 + %l1],	%i0
	nop
	set	0x75, %o4
	ldsb	[%l7 + %o4],	%l4
	set	0x74, %i3
	lda	[%l7 + %i3] 0x89,	%f7
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%o6
	nop
	set	0x60, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x74, %i0
	lda	[%l7 + %i0] 0x88,	%f10
	nop
	set	0x30, %i2
	std	%l0,	[%l7 + %i2]
	nop
	set	0x28, %l2
	ldsb	[%l7 + %l2],	%i6
	ba	%icc,	loop_166
	nop
	set	0x08, %l4
	std	%f4,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
loop_166:
	nop
	set	0x3D, %i1
	ldsb	[%l7 + %i1],	%o0
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc0
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x80
	nop
	set	0x58, %o2
	std	%f24,	[%l7 + %o2]
	nop
	set	0x5C, %l6
	stw	%o2,	[%l7 + %l6]
	nop
	set	0x3A, %l5
	ldub	[%l7 + %l5],	%g2
	set	0x70, %o5
	stxa	%g3,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%g5
	set	0x30, %i6
	lda	[%l7 + %i6] 0x88,	%f23
	nop
	set	0x18, %o1
	swap	[%l7 + %o1],	%g6
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f2
	nop
	set	0x18, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x72, %g7
	lduh	[%l7 + %g7],	%l2
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x81,	%i6
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x78, %i5
	stda	%i2,	[%l7 + %i5] 0x80
	set	0x60, %i7
	stxa	%o7,	[%l7 + %i7] 0x88
	nop
	nop
	setx	0x2B22DCCE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x64176FE7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f6,	%f5
	nop
	set	0x5B, %o7
	ldsb	[%l7 + %o7],	%g1
	set	0x7E, %l1
	stba	%i3,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x4E, %o4
	ldsh	[%l7 + %o4],	%o5
	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x7C, %o6
	stw	%l5,	[%l7 + %o6]
	set	0x14, %o0
	sta	%f31,	[%l7 + %o0] 0x88
	nop
	set	0x18, %g3
	sth	%o4,	[%l7 + %g3]
	nop
	set	0x18, %i0
	ldsw	[%l7 + %i0],	%o1
	nop
	set	0x3C, %l2
	stw	%i5,	[%l7 + %l2]
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%i0
	set	0x78, %g2
	ldxa	[%l7 + %g2] 0x80,	%i4
	or	%l3,	%o3,	%l1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%i0
	set	0x54, %i1
	stha	%l4,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x10, %i2
	stha	%g4,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x25, %l0
	stba	%l0,	[%l7 + %l0] 0xe3
	membar	#Sync
	bne	%icc,	loop_167
	nop
	set	0x24, %o2
	sth	%i6,	[%l7 + %o2]
	or	%o6,	%o0,	%o2
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f12
loop_167:
	add	%g3,	%g2,	%g5
	and	%g6,	%i7,	%l6
	nop
	nop
	setx	0xC8BCF47F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x75F36ECA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f5,	%f14
	nop
	set	0x78, %l5
	sth	%l2,	[%l7 + %l5]
	nop
	set	0x18, %g1
	std	%f8,	[%l7 + %g1]
	set	0x68, %l3
	stxa	%i2,	[%l7 + %l3] 0x80
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x76, %o1
	stha	%o7,	[%l7 + %o1] 0x80
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%g1
	set	0x18, %o3
	stwa	%i3,	[%l7 + %o3] 0x81
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x89,	%o5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	or	%o4,	%l5,	%o1
	nop
	set	0x68, %i4
	prefetch	[%l7 + %i4],	 1
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc8
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%i1
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%i4
	nop
	set	0x18, %i7
	prefetch	[%l7 + %i7],	 3
	bne	%icc,	loop_168
	nop
	set	0x58, %o4
	stb	%l3,	[%l7 + %o4]
	set	0x1C, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o3
loop_168:
	nop
	set	0x20, %i3
	stxa	%l1,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l4
	or	%g4,	%l0,	%g7
	nop
	set	0x50, %i0
	swap	[%l7 + %i0],	%i6
	nop
	set	0x38, %l2
	stx	%o0,	[%l7 + %l2]
	set	0x17, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o2
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f8
	nop
	set	0x48, %i1
	std	%f20,	[%l7 + %i1]
	set	0x68, %i2
	stxa	%g3,	[%l7 + %i2] 0xea
	membar	#Sync
	wr	%o6,	%g5,	%pic
	set	0x5E, %l0
	stha	%g2,	[%l7 + %l0] 0x80
	set	0x78, %o2
	swapa	[%l7 + %o2] 0x80,	%i7
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f16
	fpsub32	%f14,	%f0,	%f12
	nop
	set	0x4C, %g1
	ldsh	[%l7 + %g1],	%g6
	nop
	set	0x43, %l6
	ldub	[%l7 + %l6],	%l2
	set	0x60, %o5
	stxa	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%o7
	set	0x70, %l3
	sta	%f29,	[%l7 + %l3] 0x80
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x22, %g5
	stb	%i3,	[%l7 + %g5]
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%o5
	st	%f21,	[%l7 + 0x08]
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	or	%o4,	%l5,	%g1
	nop
	set	0x1C, %g7
	sth	%i1,	[%l7 + %g7]
	set	0x29, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o1
	nop
	set	0x48, %g4
	lduw	[%l7 + %g4],	%i4
	add	%o3,	%l3,	%i5
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f22
	set	0x10, %i5
	stda	%i0,	[%l7 + %i5] 0x81
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x37, %i7
	ldub	[%l7 + %i7],	%l4
	set	0x78, %l1
	swapa	[%l7 + %l1] 0x80,	%g4
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f10
	wr	%l0,	%g7,	%clear_softint
	set	0x65, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i6
	nop
	set	0x30, %g3
	std	%f12,	[%l7 + %g3]
	nop
	set	0x68, %o6
	std	%l0,	[%l7 + %o6]
	nop
	set	0x40, %l2
	stx	%o2,	[%l7 + %l2]
	nop
	set	0x25, %i0
	ldub	[%l7 + %i0],	%g3
	set	0x09, %o0
	stba	%o6,	[%l7 + %o0] 0x80
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%o0
	nop
	set	0x32, %l4
	lduh	[%l7 + %l4],	%g2
	ld	[%l7 + 0x28],	%f29
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%g5
	st	%f28,	[%l7 + 0x6C]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g6
	ld	[%l7 + 0x14],	%f15
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xea,	%i2
	fpadd16s	%f20,	%f24,	%f23
	nop
	set	0x42, %i2
	ldsb	[%l7 + %i2],	%o7
	nop
	set	0x3F, %g2
	ldub	[%l7 + %g2],	%o5
	fpadd32	%f4,	%f18,	%f28
	set	0x38, %g1
	stda	%i2,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x28, %o5
	stwa	%o4,	[%l7 + %o5] 0x80
	nop
	set	0x2C, %l6
	swap	[%l7 + %l6],	%g1
	nop
	set	0x3C, %o1
	lduh	[%l7 + %o1],	%l5
	nop
	set	0x5A, %o3
	ldsb	[%l7 + %o3],	%i1
	nop
	set	0x10, %l3
	lduh	[%l7 + %l3],	%o1
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%i4
	set	0x60, %g6
	stwa	%l3,	[%l7 + %g6] 0x80
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x59, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i5
	set	0x7C, %g4
	sta	%f14,	[%l7 + %g4] 0x89
	bl	%xcc,	loop_169
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%o3
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x76, %i4
	sth	%l4,	[%l7 + %i4]
loop_169:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	nop
	set	0x20, %i7
	sth	%i0,	[%l7 + %i7]
	nop
	set	0x3C, %i3
	stw	%g4,	[%l7 + %i3]
	set	0x10, %o4
	stxa	%g7,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x40, %g3
	std	%f6,	[%l7 + %g3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%l1
	nop
	set	0x0D, %o6
	ldstub	[%l7 + %o6],	%l0
	st	%fsr,	[%l7 + 0x38]
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	set	0x5A, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g3
	nop
	set	0x18, %i1
	stx	%o0,	[%l7 + %i1]
	set	0x52, %l2
	stha	%o6,	[%l7 + %l2] 0xe3
	membar	#Sync
	or	%g5,	%g2,	%l6
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x88,	%l2
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x68, %l0
	swapa	[%l7 + %l0] 0x88,	%g6
	fpadd16	%f20,	%f4,	%f26
	nop
	set	0x68, %g2
	sth	%i7,	[%l7 + %g2]
	set	0x44, %i2
	sta	%f14,	[%l7 + %i2] 0x81
	or	%o7,	%o5,	%i3
	nop
	set	0x40, %l5
	stx	%o4,	[%l7 + %l5]
	nop
	set	0x50, %g1
	sth	%g1,	[%l7 + %g1]
	add	%i2,	%i1,	%o1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x73F, 	%tick_cmpr
	nop
	set	0x50, %l6
	swap	[%l7 + %l6],	%l3
	set	0x25, %o1
	stba	%i5,	[%l7 + %o1] 0x80
	nop
	set	0x24, %o5
	ldsw	[%l7 + %o5],	%o3
	fpadd16s	%f13,	%f24,	%f15
	nop
	set	0x70, %o3
	std	%f18,	[%l7 + %o3]
	st	%f5,	[%l7 + 0x2C]
	set	0x28, %l3
	swapa	[%l7 + %l3] 0x81,	%i0
	nop
	set	0x59, %g6
	ldsb	[%l7 + %g6],	%l4
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x89,	 2
	and	%g7,	%i6,	%l0
	nop
	set	0x26, %g5
	ldsh	[%l7 + %g5],	%l1
	nop
	set	0x60, %g7
	std	%o2,	[%l7 + %g7]
	set	0x1B, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o0
	nop
	set	0x58, %g4
	ldx	[%l7 + %g4],	%o6
	set	0x50, %i5
	stda	%g4,	[%l7 + %i5] 0xe3
	membar	#Sync
	or	%g3,	%g2,	%l2
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%i6
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%f30
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%g6
	nop
	nop
	setx	0x7A89CE38F0D73BDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3B9396F158A62EB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f2,	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%i3
	fpsub16	%f20,	%f22,	%f2
	set	0x60, %o4
	stda	%o4,	[%l7 + %o4] 0x88
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x88,	%i2
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%i0
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f6
	set	0x37, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o1
	nop
	set	0x7C, %i1
	swap	[%l7 + %i1],	%l5
	set	0x08, %o0
	prefetcha	[%l7 + %o0] 0x80,	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%i4
	bl	%icc,	loop_170
	st	%f4,	[%l7 + 0x08]
	set	0x68, %l4
	stha	%o3,	[%l7 + %l4] 0x89
loop_170:
	ld	[%l7 + 0x60],	%f17
	nop
	set	0x14, %l2
	lduw	[%l7 + %l2],	%i5
	nop
	set	0x7A, %l0
	lduh	[%l7 + %l0],	%l4
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%i0
	or	%g7,	%g4,	%l0
	nop
	set	0x10, %i2
	stx	%i6,	[%l7 + %i2]
	nop
	set	0x19, %g2
	stb	%l1,	[%l7 + %g2]
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f4
	set	0x40, %g1
	sta	%f31,	[%l7 + %g1] 0x88
	set	0x64, %o1
	lda	[%l7 + %o1] 0x81,	%f7
	set	0x48, %l6
	stda	%o0,	[%l7 + %l6] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f16
	ld	[%l7 + 0x28],	%f30
	ld	[%l7 + 0x58],	%f11
	add	%o2,	%g5,	%g3
	set	0x20, %o5
	ldda	[%l7 + %o5] 0xea,	%g2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	set	0x18, %i6
	swapa	[%l7 + %i6] 0x89,	%o6
	set	0x6C, %g5
	stwa	%l6,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x54, %g7
	swap	[%l7 + %g7],	%g6
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x81
	st	%fsr,	[%l7 + 0x1C]
	add	%l2,	%o7,	%o5
	or	%i3,	%i7,	%i2
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%i1
	fpadd32	%f24,	%f26,	%f26
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	nop
	set	0x50, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%o1,	%l5,	%l3
	set	0x3C, %i7
	swapa	[%l7 + %i7] 0x88,	%g1
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%o2
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f4
	ld	[%l7 + 0x5C],	%f12
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%i4
	set	0x7E, %o4
	stha	%l4,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x81,	%i0
	and	%i5,	%g7,	%g4
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%i6
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%l1
	set	0x3F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l0
	nop
	set	0x3E, %o0
	lduh	[%l7 + %o0],	%o0
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x88,	 3
	nop
	set	0x70, %l2
	stb	%g3,	[%l7 + %l2]
	set	0x70, %l0
	stda	%g2,	[%l7 + %l0] 0x80
	nop
	set	0x15, %i2
	ldsb	[%l7 + %i2],	%o6
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f0
	nop
	set	0x24, %o2
	lduw	[%l7 + %o2],	%l6
	fpadd16	%f14,	%f0,	%f2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%g5
	nop
	set	0x24, %l5
	ldsw	[%l7 + %l5],	%l2
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%o7
	set	0x38, %o1
	stda	%i2,	[%l7 + %o1] 0x81
	set	0x2E, %o3
	stha	%i7,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x28, %l6
	std	%o4,	[%l7 + %l6]
	set	0x3C, %o5
	stwa	%i1,	[%l7 + %o5] 0x89
	nop
	set	0x12, %i6
	ldsh	[%l7 + %i6],	%i2
	nop
	set	0x60, %g5
	std	%o4,	[%l7 + %g5]
	nop
	nop
	setx	0x5DBDFE36F3B82626,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x50ACAB1CEA851FD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f30
	set	0x18, %l3
	swapa	[%l7 + %l3] 0x89,	%l5
	nop
	set	0x18, %o7
	swap	[%l7 + %o7],	%o1
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f0
	add	%g1,	%o3,	%i4
	set	0x48, %g4
	sta	%f21,	[%l7 + %g4] 0x81
	nop
	set	0x72, %g6
	ldsh	[%l7 + %g6],	%l4
	nop
	set	0x4C, %i5
	stw	%i0,	[%l7 + %i5]
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x88,	%i5
	set	0x6B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g7
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc2
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f16
	wr	%l3,	%i6,	%clear_softint
	st	%fsr,	[%l7 + 0x5C]
	and	%g4,	%l0,	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l1
	set	0x60, %o6
	stwa	%g3,	[%l7 + %o6] 0x81
	set	0x0A, %i3
	stha	%g2,	[%l7 + %i3] 0x81
	and	%l6,	%g6,	%g5
	nop
	set	0x74, %i1
	sth	%l2,	[%l7 + %i1]
	add	%o7,	%o6,	%i3
	nop
	set	0x78, %i0
	swap	[%l7 + %i0],	%o5
	nop
	set	0x4A, %o0
	sth	%i7,	[%l7 + %o0]
	nop
	set	0x68, %l2
	swap	[%l7 + %l2],	%i1
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x80,	%i2
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%l5
	nop
	set	0x2C, %l0
	stb	%o4,	[%l7 + %l0]
	and	%g1,	%o1,	%i4
	set	0x3C, %o2
	stwa	%l4,	[%l7 + %o2] 0x89
	nop
	set	0x20, %l5
	std	%f8,	[%l7 + %l5]
	set	0x48, %g1
	ldxa	[%l7 + %g1] 0x88,	%o3
	nop
	set	0x38, %o1
	stx	%i0,	[%l7 + %o1]
	nop
	set	0x7A, %g2
	ldsb	[%l7 + %g2],	%i5
	nop
	set	0x1E, %l6
	sth	%l3,	[%l7 + %l6]
	nop
	set	0x1C, %o5
	swap	[%l7 + %o5],	%g7
	set	0x20, %o3
	stxa	%i6,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x70, %g5
	sta	%f24,	[%l7 + %g5] 0x89
	set	0x2A, %i6
	stha	%g4,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x08, %l3
	stwa	%o0,	[%l7 + %l3] 0x89
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc4
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xd0
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%o2
	ld	[%l7 + 0x14],	%f23
	nop
	set	0x58, %o7
	stx	%l1,	[%l7 + %o7]
	set	0x70, %i5
	stxa	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x1C, %i7
	lduh	[%l7 + %i7],	%g2
	nop
	set	0x20, %i4
	stw	%l6,	[%l7 + %i4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%g5
	nop
	set	0x78, %l1
	stx	%l2,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%o7
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%g3
	nop
	set	0x1C, %o6
	lduw	[%l7 + %o6],	%o6
	nop
	set	0x28, %i3
	std	%i2,	[%l7 + %i3]
	nop
	set	0x3C, %i1
	lduw	[%l7 + %i1],	%o5
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x88,	%i6
	set	0x51, %l2
	stba	%i2,	[%l7 + %l2] 0x81
	nop
	set	0x48, %l4
	stx	%l5,	[%l7 + %l4]
	fpadd32	%f28,	%f16,	%f24
	or	%o4,	%i1,	%g1
	nop
	set	0x14, %i2
	stb	%i4,	[%l7 + %i2]
	set	0x59, %i0
	stba	%l4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x48, %o2
	lduw	[%l7 + %o2],	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%i5
	add	%l3,	%i0,	%g7
	and	%i6,	%o0,	%o2
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%l1
	set	0x70, %l0
	sta	%f21,	[%l7 + %l0] 0x89
	nop
	set	0x3A, %g1
	ldstub	[%l7 + %g1],	%g4
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f12
	nop
	set	0x64, %g2
	lduw	[%l7 + %g2],	%g2
	set	0x48, %l6
	swapa	[%l7 + %l6] 0x81,	%l0
	set	0x6C, %o5
	sta	%f11,	[%l7 + %o5] 0x80
	fpsub32	%f18,	%f6,	%f8
	set	0x20, %o3
	swapa	[%l7 + %o3] 0x80,	%l6
	nop
	set	0x30, %g5
	std	%g6,	[%l7 + %g5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%l2
	set	0x3C, %i6
	stwa	%o7,	[%l7 + %i6] 0xe3
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i3
	nop
	set	0x6E, %g7
	ldsh	[%l7 + %g7],	%g3
	nop
	set	0x2C, %g4
	swap	[%l7 + %g4],	%i7
	nop
	set	0x5C, %l3
	lduw	[%l7 + %l3],	%i2
	nop
	set	0x14, %o7
	swap	[%l7 + %o7],	%o5
	nop
	set	0x58, %i5
	stx	%o4,	[%l7 + %i5]
	nop
	set	0x76, %i7
	stb	%l5,	[%l7 + %i7]
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%g0
	set	0x20, %l1
	lda	[%l7 + %l1] 0x88,	%f10
	set	0x08, %g6
	stwa	%i1,	[%l7 + %g6] 0xeb
	membar	#Sync
	add	%l4,	%o1,	%i4
	nop
	set	0x7C, %o4
	ldsb	[%l7 + %o4],	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%l3
	nop
	set	0x1C, %o6
	swap	[%l7 + %o6],	%i0
	set	0x10, %g3
	lda	[%l7 + %g3] 0x88,	%f22
	set	0x17, %i1
	stba	%g7,	[%l7 + %i1] 0x81
	set	0x28, %o0
	stda	%o0,	[%l7 + %o0] 0x80
	nop
	set	0x62, %i3
	ldsb	[%l7 + %i3],	%i6
	set	0x6C, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o2
	nop
	set	0x5D, %l4
	ldub	[%l7 + %l4],	%g4
	wr	%l1,	%l0,	%set_softint
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f20
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g6
	nop
	set	0x31, %i2
	stb	%g2,	[%l7 + %i2]
	nop
	set	0x0A, %l5
	ldstub	[%l7 + %l5],	%l2
	wr	%g5,	%o6,	%clear_softint
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f2
	nop
	set	0x30, %g1
	std	%f0,	[%l7 + %g1]
	nop
	set	0x42, %l0
	ldsh	[%l7 + %l0],	%i3
	add	%g3,	%i7,	%i2
	st	%fsr,	[%l7 + 0x7C]
	and	%o5,	%o4,	%o7
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%g0
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%l4
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	nop
	set	0x21, %o1
	ldub	[%l7 + %o1],	%i1
	and	%o1,	%i4,	%o3
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x89,	%l4
	nop
	set	0x48, %g5
	std	%f4,	[%l7 + %g5]
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x80,	%l3
	set	0x4C, %g4
	sta	%f17,	[%l7 + %g4] 0x81
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd8
	set	0x10, %l3
	swapa	[%l7 + %l3] 0x80,	%i0
	nop
	set	0x48, %i5
	std	%g6,	[%l7 + %i5]
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x89,	%i5
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %l1
	stda	%o0,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%i6
	st	%f12,	[%l7 + 0x50]
	nop
	set	0x34, %o4
	ldstub	[%l7 + %o4],	%o2
	set	0x59, %o6
	ldstuba	[%l7 + %o6] 0x89,	%l1
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x89,	 2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g6
	nop
	set	0x68, %g6
	ldsw	[%l7 + %g6],	%g2
	st	%fsr,	[%l7 + 0x20]
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x88,	 4
	set	0x60, %i3
	stwa	%l2,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	set	0x4A, %l2
	ldstuba	[%l7 + %l2] 0x81,	%o6
	wr	%i3,	%g5,	%softint
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc2
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x88,	%i6
	nop
	set	0x68, %i0
	std	%f0,	[%l7 + %i0]
	set	0x56, %l5
	stha	%i2,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x69, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o5
	nop
	set	0x12, %g1
	sth	%g3,	[%l7 + %g1]
	fpadd32s	%f31,	%f29,	%f3
	nop
	set	0x18, %l0
	std	%f28,	[%l7 + %l0]
	or	%o4,	%o7,	%g1
	set	0x70, %g2
	stha	%i1,	[%l7 + %g2] 0xea
	membar	#Sync
	or	%l5,	%i4,	%o1
	ble,a	%icc,	loop_171
	nop
	set	0x68, %l6
	stx	%o3,	[%l7 + %l6]
	nop
	set	0x48, %o5
	stb	%l4,	[%l7 + %o5]
	nop
	set	0x78, %o3
	std	%f30,	[%l7 + %o3]
loop_171:
	nop
	set	0x2A, %g5
	sth	%i0,	[%l7 + %g5]
	set	0x2E, %i6
	stha	%g7,	[%l7 + %i6] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%o0
	nop
	set	0x24, %o1
	sth	%i5,	[%l7 + %o1]
	or	%o2,	%l1,	%i6
	nop
	set	0x43, %g7
	ldsb	[%l7 + %g7],	%l6
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x88,	%g6
	nop
	set	0x50, %l3
	stx	%g2,	[%l7 + %l3]
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	nop
	set	0x15, %i7
	ldsb	[%l7 + %i7],	%l2
	and	%g4,	%i3,	%o6
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%i7
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x40]
	bn,a,pn	%xcc,	loop_172
	st	%f2,	[%l7 + 0x1C]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xda
loop_172:
	nop
	set	0x70, %o6
	std	%f8,	[%l7 + %o6]
	set	0x74, %i4
	stwa	%g5,	[%l7 + %i4] 0x88
	nop
	set	0x7C, %g3
	stw	%i2,	[%l7 + %g3]
	st	%f27,	[%l7 + 0x78]
	wr	%o5,	%o4,	%sys_tick
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf9
	membar	#Sync
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%g3
	set	0x50, %i3
	stda	%i0,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 3
	set	0x78, %i2
	stwa	%g1,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf8
	membar	#Sync
	set	0x67, %l5
	stba	%i4,	[%l7 + %l5] 0x81
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x88,	%l4
	set	0x5A, %i0
	stha	%o1,	[%l7 + %i0] 0xeb
	membar	#Sync
	wr	%l4,	%i0,	%sys_tick
	nop
	set	0x78, %l0
	std	%g6,	[%l7 + %l0]
	set	0x34, %g2
	lda	[%l7 + %g2] 0x89,	%f15
	or	%o3,	%l3,	%i5
	nop
	set	0x38, %l6
	stx	%o0,	[%l7 + %l6]
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%f24
	wr	%l1,	%i6,	%softint
	nop
	set	0x1C, %g1
	ldstub	[%l7 + %g1],	%o2
	nop
	set	0x08, %g5
	std	%i6,	[%l7 + %g5]
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 2
	bgu	%xcc,	loop_173
	fpsub32s	%f13,	%f0,	%f25
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%g2
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x88,	%l0
loop_173:
	nop
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x80,	%l2
	nop
	set	0x44, %g4
	stw	%g6,	[%l7 + %g4]
	bl,a,pt	%icc,	loop_174
	nop
	set	0x60, %o7
	lduh	[%l7 + %o7],	%g4
	nop
	set	0x1C, %i7
	swap	[%l7 + %i7],	%o6
	nop
	set	0x78, %i5
	ldsh	[%l7 + %i5],	%i7
loop_174:
	bl,pt	%icc,	loop_175
	nop
	set	0x6E, %l3
	ldsh	[%l7 + %l3],	%i3
	st	%f9,	[%l7 + 0x48]
	nop
	set	0x48, %o4
	prefetch	[%l7 + %o4],	 3
loop_175:
	nop
	set	0x60, %l1
	swap	[%l7 + %l1],	%i2
	set	0x20, %o6
	sta	%f5,	[%l7 + %o6] 0x88
	set	0x48, %i4
	stda	%g4,	[%l7 + %i4] 0xea
	membar	#Sync
	st	%f28,	[%l7 + 0x70]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%o4
	wr	%o7,	%o5,	%softint
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%g1
	nop
	set	0x50, %i1
	std	%f28,	[%l7 + %i1]
	ld	[%l7 + 0x2C],	%f15
	nop
	set	0x28, %i3
	std	%f4,	[%l7 + %i3]
	nop
	set	0x18, %o0
	ldsh	[%l7 + %o0],	%i4
	st	%f1,	[%l7 + 0x60]
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x89,	 2
	add	%o1,	%l5,	%i0
	set	0x60, %l4
	lda	[%l7 + %l4] 0x89,	%f27
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%g7
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%l4
	set	0x47, %i0
	stba	%o3,	[%l7 + %i0] 0x81
	nop
	set	0x70, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x68, %g2
	sta	%f12,	[%l7 + %g2] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%i5
	add	%o0,	%i6,	%l1
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xe2,	%o2
	nop
	set	0x70, %o5
	std	%f4,	[%l7 + %o5]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%l6
	nop
	set	0x30, %g5
	stw	%l0,	[%l7 + %g5]
	nop
	set	0x48, %i6
	std	%f16,	[%l7 + %i6]
	st	%f1,	[%l7 + 0x28]
	nop
	set	0x34, %o3
	swap	[%l7 + %o3],	%g6
	or	%g4,	%l2,	%o6
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	or	%i7,	%i3,	%g5
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%i2
	set	0x4C, %l6
	sta	%f11,	[%l7 + %l6] 0x81
	ld	[%l7 + 0x60],	%f2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%o4
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g3
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	nop
	set	0x68, %i5
	ldsw	[%l7 + %i5],	%g1
	nop
	set	0x5C, %i7
	sth	%o5,	[%l7 + %i7]
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%i1
	nop
	set	0x3A, %o4
	ldstub	[%l7 + %o4],	%o1
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%l4
	set	0x68, %o6
	stwa	%i0,	[%l7 + %o6] 0x88
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f20
	nop
	set	0x10, %i4
	stx	%i4,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%g7
	st	%f9,	[%l7 + 0x38]
	nop
	set	0x30, %i1
	stx	%l3,	[%l7 + %i1]
	and	%i5,	%o3,	%o0
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	ld	[%l7 + 0x1C],	%f2
	or	%o2,	%g2,	%l6
	nop
	set	0x51, %g6
	ldub	[%l7 + %g6],	%l0
	set	0x10, %i2
	sta	%f31,	[%l7 + %i2] 0x81
	nop
	set	0x78, %l4
	lduw	[%l7 + %l4],	%g6
	nop
	set	0x5E, %l5
	sth	%g4,	[%l7 + %l5]
	nop
	set	0x48, %o2
	sth	%l2,	[%l7 + %o2]
	nop
	set	0x50, %i0
	stb	%o6,	[%l7 + %i0]
	add	%l1,	%i3,	%g5
	ld	[%l7 + 0x70],	%f31
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f0
	set	0x24, %l0
	sta	%f18,	[%l7 + %l0] 0x81
	nop
	set	0x5C, %g2
	swap	[%l7 + %g2],	%i2
	nop
	set	0x70, %l2
	ldsw	[%l7 + %l2],	%o7
	set	0x70, %g1
	stxa	%o4,	[%l7 + %g1] 0xea
	membar	#Sync
	st	%f27,	[%l7 + 0x48]
	set	0x5A, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g3
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%i6
	nop
	set	0x0F, %o3
	ldub	[%l7 + %o3],	%g1
	set	0x38, %i6
	prefetcha	[%l7 + %i6] 0x81,	 2
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%o5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd8
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x13, %o7
	stba	%o1,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x38, %i7
	swap	[%l7 + %i7],	%l5
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f30
	or	%i0,	%l4,	%g7
	nop
	set	0x10, %o4
	std	%f18,	[%l7 + %o4]
	st	%f26,	[%l7 + 0x08]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%i5
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%l3
	st	%fsr,	[%l7 + 0x20]
	set	0x44, %o6
	sta	%f0,	[%l7 + %o6] 0x88
	nop
	set	0x6A, %l3
	lduh	[%l7 + %l3],	%o0
	nop
	set	0x40, %g3
	stw	%i6,	[%l7 + %g3]
	set	0x10, %i1
	stxa	%o3,	[%l7 + %i1] 0x88
	nop
	set	0x12, %i4
	lduh	[%l7 + %i4],	%g2
	set	0x60, %g6
	sta	%f15,	[%l7 + %g6] 0x81
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x38, %l5
	stda	%o2,	[%l7 + %l5] 0x89
	and	%l0,	%l6,	%g6
	and	%g4,	%o6,	%l1
	st	%fsr,	[%l7 + 0x1C]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1258
!	Type a   	: 27
!	Type cti   	: 24
!	Type x   	: 522
!	Type f   	: 42
!	Type i   	: 127
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
	set	0x5,	%g1
	set	0xF,	%g2
	set	0x7,	%g3
	set	0xF,	%g4
	set	0x9,	%g5
	set	0x6,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0xF,	%i1
	set	-0xC,	%i2
	set	-0xE,	%i3
	set	-0x3,	%i4
	set	-0x1,	%i5
	set	-0xA,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x6F5798A2,	%l0
	set	0x3CFBFBF8,	%l1
	set	0x6E9A731D,	%l2
	set	0x3F20F88A,	%l3
	set	0x775E932A,	%l4
	set	0x314C3D39,	%l5
	set	0x2E3217B0,	%l6
	!# Output registers
	set	-0x11C4,	%o0
	set	0x1177,	%o1
	set	0x078F,	%o2
	set	-0x048C,	%o3
	set	-0x1BDF,	%o4
	set	-0x0FF6,	%o5
	set	0x0256,	%o6
	set	-0x0852,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x96346BE1C4891CCE)
	INIT_TH_FP_REG(%l7,%f2,0x2AB90A99C7EA575F)
	INIT_TH_FP_REG(%l7,%f4,0x35424BE481A22DFC)
	INIT_TH_FP_REG(%l7,%f6,0x1A0B6E7A23FFEA98)
	INIT_TH_FP_REG(%l7,%f8,0x7DB892D47E35E57B)
	INIT_TH_FP_REG(%l7,%f10,0x88A498ED459E1EE7)
	INIT_TH_FP_REG(%l7,%f12,0xAC42AED2FA1B6832)
	INIT_TH_FP_REG(%l7,%f14,0x309B5F6C29C708E7)
	INIT_TH_FP_REG(%l7,%f16,0x7B7AC6CEC0FB44CB)
	INIT_TH_FP_REG(%l7,%f18,0x09ECE412AE227434)
	INIT_TH_FP_REG(%l7,%f20,0x3F33D5EB1D930E44)
	INIT_TH_FP_REG(%l7,%f22,0x84C84C6234FA2368)
	INIT_TH_FP_REG(%l7,%f24,0xC355CA68B934CFE9)
	INIT_TH_FP_REG(%l7,%f26,0x4607BA1C1C7A0C7A)
	INIT_TH_FP_REG(%l7,%f28,0x0CF6180EA7C99762)
	INIT_TH_FP_REG(%l7,%f30,0x91236A900A768A99)

	!# Execute Main Diag ..

	nop
	set	0x0E, %i3
	sth	%l2,	[%l7 + %i3]
	set	0x70, %i0
	sta	%f21,	[%l7 + %i0] 0x80
	nop
	set	0x1C, %o2
	ldsw	[%l7 + %o2],	%g5
	nop
	set	0x30, %l0
	std	%f26,	[%l7 + %l0]
	nop
	set	0x68, %o0
	std	%f22,	[%l7 + %o0]
	wr	%i3,	%i2,	%y
	nop
	set	0x7C, %g2
	lduw	[%l7 + %g2],	%o7
	or	%o4,	%i7,	%g3
	set	0x64, %g1
	sta	%f31,	[%l7 + %g1] 0x81
	nop
	set	0x68, %o5
	ldsw	[%l7 + %o5],	%g1
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc4
	set	0x42, %o3
	ldstuba	[%l7 + %o3] 0x88,	%i1
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	or	%o5,	%l5,	%l4
	set	0x0E, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i0
	ble,a,pn	%xcc,	loop_176
	nop
	set	0x78, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x35, %o7
	ldstub	[%l7 + %o7],	%g7
	st	%f0,	[%l7 + 0x20]
loop_176:
	nop
	set	0x30, %o1
	stw	%i5,	[%l7 + %o1]
	and	%l3,	%o0,	%i4
	set	0x38, %i7
	stxa	%o3,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x1C, %g4
	sta	%f11,	[%l7 + %g4] 0x88
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	set	0x10, %o4
	lda	[%l7 + %o4] 0x80,	%f28
	set	0x74, %o6
	lda	[%l7 + %o6] 0x80,	%f12
	set	0x78, %g3
	stda	%g2,	[%l7 + %g3] 0xeb
	membar	#Sync
	ld	[%l7 + 0x28],	%f1
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 3
	st	%f7,	[%l7 + 0x58]
	st	%f16,	[%l7 + 0x64]
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f8
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	nop
	set	0x68, %i2
	std	%l0,	[%l7 + %i2]
	nop
	set	0x78, %g6
	std	%f12,	[%l7 + %g6]
	st	%f2,	[%l7 + 0x7C]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf1
	membar	#Sync
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x80,	%o2
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf1
	membar	#Sync
	nop
	set	0x48, %i3
	ldx	[%l7 + %i3],	%g6
	set	0x48, %o2
	stda	%g4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x2E, %o0
	lduh	[%l7 + %o0],	%l6
	nop
	set	0x68, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x70, %l0
	std	%l0,	[%l7 + %l0]
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x81,	%l2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	and	%g5,	%o6,	%i3
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x80,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%o4
	set	0x68, %g5
	stxa	%g3,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x30, %g7
	ldsw	[%l7 + %g7],	%g1
	nop
	set	0x3A, %o5
	ldub	[%l7 + %o5],	%i7
	nop
	set	0x48, %i6
	std	%i0,	[%l7 + %i6]
	ble,a,pt	%xcc,	loop_177
	nop
	set	0x30, %l6
	stx	%o5,	[%l7 + %l6]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%o1
loop_177:
	nop
	set	0x7F, %o1
	stba	%i0,	[%l7 + %o1] 0x80
	set	0x0A, %o7
	stha	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
	bn,a	%xcc,	loop_178
	wr	%i5,	%l3,	%set_softint
	nop
	set	0x24, %g4
	stw	%g7,	[%l7 + %g4]
	nop
	set	0x68, %i7
	ldsh	[%l7 + %i7],	%o0
loop_178:
	nop
	set	0x20, %i5
	stda	%i4,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x4C, %l1
	stw	%i6,	[%l7 + %l1]
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x89,	%g2
	nop
	set	0x58, %g3
	stw	%o3,	[%l7 + %g3]
	nop
	set	0x2C, %o6
	lduh	[%l7 + %o6],	%l0
	nop
	set	0x68, %i4
	ldub	[%l7 + %i4],	%g6
	set	0x72, %i1
	stha	%g4,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f18
	nop
	set	0x58, %g6
	stw	%l6,	[%l7 + %g6]
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%o2
	nop
	set	0x7C, %i2
	lduw	[%l7 + %i2],	%l1
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x88,	 2
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%o6
	or	%i3,	%g5,	%o7
	or	%o4,	%g3,	%i2
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x80,	 1
	nop
	set	0x64, %i0
	stw	%i1,	[%l7 + %i0]
	nop
	set	0x08, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xe3,	%o4
	nop
	set	0x37, %g1
	ldstub	[%l7 + %g1],	%g1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i0
	nop
	set	0x18, %l0
	stb	%l5,	[%l7 + %l0]
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	wr	%i5,	%l4,	%y
	nop
	set	0x34, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x08, %g7
	std	%f24,	[%l7 + %g7]
	or	%l3,	%g7,	%i4
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%o0
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%i6
	nop
	set	0x10, %l6
	ldsh	[%l7 + %l6],	%g2
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x80,	%l0
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	set	0x40, %o5
	lda	[%l7 + %o5] 0x80,	%f27
	st	%f30,	[%l7 + 0x38]
	nop
	set	0x30, %g4
	std	%f6,	[%l7 + %g4]
	nop
	set	0x78, %i7
	std	%f12,	[%l7 + %i7]
	nop
	set	0x44, %i5
	swap	[%l7 + %i5],	%o3
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f0
	set	0x60, %l1
	stda	%g4,	[%l7 + %l1] 0x89
	st	%f8,	[%l7 + 0x24]
	nop
	set	0x14, %o6
	ldub	[%l7 + %o6],	%l6
	set	0x28, %g3
	stha	%g6,	[%l7 + %g3] 0x80
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%o2
	ld	[%l7 + 0x64],	%f24
	nop
	set	0x68, %i1
	sth	%l2,	[%l7 + %i1]
	nop
	set	0x14, %g6
	lduh	[%l7 + %g6],	%l1
	nop
	set	0x51, %l3
	ldstub	[%l7 + %l3],	%o6
	fpadd16s	%f4,	%f20,	%f1
	nop
	set	0x18, %i2
	std	%f8,	[%l7 + %i2]
	set	0x6C, %l5
	sta	%f22,	[%l7 + %l5] 0x89
	set	0x14, %i3
	stba	%i3,	[%l7 + %i3] 0x81
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
	nop
	set	0x48, %i0
	stx	%fsr,	[%l7 + %i0]
	wr	%o7,	%o4,	%clear_softint
	set	0x16, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i2
	nop
	set	0x38, %o0
	swap	[%l7 + %o0],	%g3
	set	0x24, %g2
	lda	[%l7 + %g2] 0x89,	%f23
	nop
	set	0x64, %l0
	swap	[%l7 + %l0],	%i1
	set	0x78, %l2
	stwa	%o5,	[%l7 + %l2] 0x81
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x88,	%i7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x1F, %o3
	ldub	[%l7 + %o3],	%o1
	set	0x28, %g5
	stxa	%i0,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%g1
	set	0x28, %i6
	ldxa	[%l7 + %i6] 0x88,	%l5
	set	0x60, %o1
	sta	%f14,	[%l7 + %o1] 0x89
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x81,	 2
	ld	[%l7 + 0x28],	%f29
	or	%l3,	%i5,	%g7
	nop
	set	0x70, %o7
	ldsw	[%l7 + %o7],	%i4
	ld	[%l7 + 0x78],	%f2
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%o3
	set	0x40, %i7
	prefetcha	[%l7 + %i7] 0x88,	 2
	nop
	set	0x70, %i5
	std	%i6,	[%l7 + %i5]
	ld	[%l7 + 0x1C],	%f26
	ld	[%l7 + 0x54],	%f28
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%g6
	nop
	set	0x2D, %o6
	ldub	[%l7 + %o6],	%o2
	nop
	set	0x10, %l1
	stw	%l0,	[%l7 + %l1]
	nop
	set	0x62, %i4
	ldub	[%l7 + %i4],	%l1
	nop
	set	0x68, %g3
	stx	%o6,	[%l7 + %g3]
	nop
	set	0x09, %g6
	ldub	[%l7 + %g6],	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%g5
	set	0x70, %l3
	lda	[%l7 + %l3] 0x89,	%f22
	set	0x3D, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o4
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x81,	%o6
	fpsub16	%f28,	%f20,	%f16
	or	%i2,	%g3,	%o5
	nop
	set	0x60, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x0B, %l4
	ldub	[%l7 + %l4],	%i7
	bg	%icc,	loop_179
	nop
	set	0x74, %i0
	swap	[%l7 + %i0],	%o1
	nop
	set	0x6C, %o2
	ldsb	[%l7 + %o2],	%i1
	nop
	set	0x4B, %o0
	ldstub	[%l7 + %o0],	%i0
loop_179:
	nop
	set	0x2E, %g2
	ldsb	[%l7 + %g2],	%l5
	nop
	set	0x78, %l0
	stw	%g1,	[%l7 + %l0]
	ld	[%l7 + 0x38],	%f2
	set	0x22, %l2
	stha	%l4,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f28
	set	0x0D, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i5
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%l3
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x80,	%g7
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%i4
	nop
	set	0x70, %o1
	ldsh	[%l7 + %o1],	%i6
	nop
	set	0x17, %l6
	ldub	[%l7 + %l6],	%g2
	set	0x40, %o7
	stha	%o0,	[%l7 + %o7] 0x89
	nop
	set	0x08, %o5
	stx	%o3,	[%l7 + %o5]
	and	%g4,	%g6,	%o2
	set	0x38, %g5
	stwa	%l6,	[%l7 + %g5] 0x89
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f0
	nop
	set	0x78, %i5
	stb	%l1,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x7C]
	ld	[%l7 + 0x48],	%f31
	nop
	set	0x58, %g4
	stb	%l0,	[%l7 + %g4]
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%o6
	bne,pt	%xcc,	loop_180
	st	%fsr,	[%l7 + 0x50]
	bleu	%icc,	loop_181
	or	%i3,	%l2,	%g5
loop_180:
	nop
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe2,	%o4
loop_181:
	nop
	set	0x30, %o6
	stxa	%o7,	[%l7 + %o6] 0x88
	nop
	set	0x26, %g3
	lduh	[%l7 + %g3],	%i2
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f2
	ld	[%l7 + 0x60],	%f30
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f10
	nop
	set	0x48, %l3
	sth	%o5,	[%l7 + %l3]
	nop
	set	0x20, %i1
	stw	%i7,	[%l7 + %i1]
	set	0x78, %i3
	stxa	%o1,	[%l7 + %i3] 0x88
	nop
	set	0x4C, %l4
	lduw	[%l7 + %l4],	%i1
	nop
	set	0x78, %i0
	stx	%i0,	[%l7 + %i0]
	nop
	set	0x0E, %l5
	ldstub	[%l7 + %l5],	%g3
	ld	[%l7 + 0x78],	%f22
	nop
	set	0x2C, %o0
	lduh	[%l7 + %o0],	%g1
	nop
	set	0x28, %o2
	std	%f18,	[%l7 + %o2]
	nop
	set	0x74, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f6
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%g7,	%i5,	%i4
	nop
	set	0x28, %g1
	swap	[%l7 + %g1],	%g2
	ld	[%l7 + 0x18],	%f16
	nop
	set	0x30, %o3
	ldub	[%l7 + %o3],	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%o3
	nop
	set	0x20, %g2
	std	%g6,	[%l7 + %g2]
	set	0x40, %g7
	stda	%g4,	[%l7 + %g7] 0x80
	or	%l6,	%o2,	%l1
	nop
	set	0x7C, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x64, %l6
	lda	[%l7 + %l6] 0x81,	%f13
	nop
	set	0x64, %o1
	swap	[%l7 + %o1],	%l0
	set	0x77, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i3
	nop
	set	0x26, %o7
	sth	%l2,	[%l7 + %o7]
	st	%f26,	[%l7 + 0x34]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x58, %i7
	stw	%g5,	[%l7 + %i7]
	or	%o4,	%o7,	%i2
	wr	%o6,	%i7,	%pic
	set	0x68, %i5
	stda	%o4,	[%l7 + %i5] 0x89
	nop
	set	0x3C, %g4
	sth	%i1,	[%l7 + %g4]
	nop
	nop
	setx	0xEA944FB2E6B7C5EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDD9192E8D7B9BDBC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f12,	%f4
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x88,	%i0
	nop
	set	0x48, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%o0
	nop
	set	0x60, %g3
	stw	%g1,	[%l7 + %g3]
	nop
	set	0x6A, %o6
	stb	%l5,	[%l7 + %o6]
	nop
	set	0x20, %g6
	ldsb	[%l7 + %g6],	%l3
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc0
	nop
	set	0x1F, %i1
	ldstub	[%l7 + %i1],	%g7
	set	0x28, %i3
	stda	%i4,	[%l7 + %i3] 0x80
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%l4
	set	0x10, %i0
	stxa	%i6,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x80,	%o0
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%o2
	nop
	set	0x18, %o2
	ldsw	[%l7 + %o2],	%g6
	nop
	set	0x38, %l3
	std	%f10,	[%l7 + %l3]
	st	%f20,	[%l7 + 0x64]
	nop
	set	0x78, %l0
	std	%i6,	[%l7 + %l0]
	or	%g4,	%o2,	%l0
	nop
	set	0x1C, %i2
	swap	[%l7 + %i2],	%i3
	ld	[%l7 + 0x30],	%f15
	nop
	set	0x60, %g1
	std	%f16,	[%l7 + %g1]
	nop
	set	0x1E, %o3
	stb	%l1,	[%l7 + %o3]
	nop
	set	0x70, %g2
	sth	%g5,	[%l7 + %g2]
	nop
	set	0x50, %g7
	stx	%o4,	[%l7 + %g7]
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe3,	%l2
	ld	[%l7 + 0x08],	%f9
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%o7
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x89,	%i2
	set	0x60, %o5
	lda	[%l7 + %o5] 0x88,	%f19
	st	%f30,	[%l7 + 0x1C]
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x50, %l6
	std	%f26,	[%l7 + %l6]
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%o6
	nop
	set	0x38, %g4
	prefetch	[%l7 + %g4],	 1
	st	%fsr,	[%l7 + 0x20]
	ld	[%l7 + 0x34],	%f25
	nop
	set	0x1C, %o4
	lduw	[%l7 + %o4],	%o5
	add	%i7,	%i0,	%i1
	bne,a,pt	%icc,	loop_182
	nop
	set	0x18, %g5
	stx	%g3,	[%l7 + %g5]
	nop
	set	0x2B, %g3
	ldstub	[%l7 + %g3],	%g1
	ld	[%l7 + 0x18],	%f4
loop_182:
	ld	[%l7 + 0x2C],	%f16
	fpadd16s	%f7,	%f9,	%f31
	set	0x74, %l1
	lda	[%l7 + %l1] 0x80,	%f20
	or	%o1,	%l3,	%g7
	set	0x67, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i5
	set	0x5C, %i4
	stwa	%i4,	[%l7 + %i4] 0x80
	nop
	set	0x0A, %g6
	sth	%g2,	[%l7 + %g6]
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%l5
	set	0x10, %l4
	stwa	%l4,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x75, %i1
	ldsb	[%l7 + %i1],	%i6
	nop
	set	0x6E, %i0
	ldub	[%l7 + %i0],	%o3
	ld	[%l7 + 0x78],	%f16
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x5D, %o2
	stb	%g6,	[%l7 + %o2]
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x80,	%l6
	ld	[%l7 + 0x1C],	%f25
	nop
	set	0x34, %l3
	stw	%o0,	[%l7 + %l3]
	nop
	set	0x62, %i2
	ldsh	[%l7 + %i2],	%g4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd2
	nop
	set	0x2E, %l0
	sth	%l0,	[%l7 + %l0]
	and	%o2,	%l1,	%g5
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x48, %g2
	std	%f30,	[%l7 + %g2]
	st	%f30,	[%l7 + 0x54]
	nop
	set	0x68, %g7
	stx	%o4,	[%l7 + %g7]
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f8
	st	%f9,	[%l7 + 0x50]
	nop
	set	0x50, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x34, %o1
	stw	%l2,	[%l7 + %o1]
	nop
	set	0x08, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x2C, %o7
	stwa	%i3,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%i2,	%o7,	%o6
	set	0x09, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i7
	nop
	set	0x70, %l6
	std	%f12,	[%l7 + %l6]
	nop
	set	0x78, %i5
	prefetch	[%l7 + %i5],	 2
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x89,	%i0
	nop
	set	0x18, %o4
	std	%i0,	[%l7 + %o4]
	nop
	set	0x18, %g5
	swap	[%l7 + %g5],	%o5
	nop
	set	0x1D, %g4
	ldub	[%l7 + %g4],	%g1
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x89,	%g3
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	add	%o1,	%g7,	%l3
	or	%i5,	%i4,	%g2
	nop
	nop
	setx	0xF972E4A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xCAE56C79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f13,	%f25
	st	%f15,	[%l7 + 0x40]
	and	%l4,	%i6,	%o3
	nop
	set	0x38, %g3
	ldx	[%l7 + %g3],	%l5
	nop
	set	0x58, %g6
	std	%f14,	[%l7 + %g6]
	nop
	set	0x44, %i4
	ldub	[%l7 + %i4],	%g6
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	set	0x44, %l4
	swapa	[%l7 + %l4] 0x89,	%g4
	set	0x5C, %i0
	sta	%f5,	[%l7 + %i0] 0x80
	and	%l0,	%o2,	%l1
	bn,a,pn	%icc,	loop_183
	ba,a	%icc,	loop_184
	ld	[%l7 + 0x68],	%f10
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
loop_183:
	nop
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xe3,	%g4
loop_184:
	nop
	set	0x60, %o0
	ldsw	[%l7 + %o0],	%l6
	nop
	set	0x18, %l3
	sth	%l2,	[%l7 + %l3]
	nop
	set	0x4A, %i2
	ldub	[%l7 + %i2],	%i3
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 3
	fpadd16s	%f27,	%f10,	%f2
	set	0x24, %g1
	sta	%f22,	[%l7 + %g1] 0x80
	nop
	set	0x68, %l0
	stx	%o4,	[%l7 + %l0]
	nop
	set	0x4C, %g2
	lduw	[%l7 + %g2],	%i2
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x40, %i6
	std	%o6,	[%l7 + %i6]
	nop
	set	0x28, %g7
	ldsw	[%l7 + %g7],	%o6
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x89,	%i0
	wr	%i1,	%o5,	%set_softint
	ba,a,pn	%xcc,	loop_185
	nop
	set	0x5B, %o3
	stb	%g1,	[%l7 + %o3]
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%i7
	nop
	set	0x08, %i7
	swap	[%l7 + %i7],	%o1
loop_185:
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%g6
	set	0x4C, %i5
	stwa	%l3,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x1C, %l6
	stwa	%i5,	[%l7 + %l6] 0x81
	nop
	set	0x28, %o5
	std	%g2,	[%l7 + %o5]
	or	%i4,	%g2,	%l4
	set	0x28, %g5
	stwa	%i6,	[%l7 + %g5] 0x89
	nop
	set	0x68, %g4
	ldsh	[%l7 + %g4],	%o3
	nop
	set	0x38, %o4
	swap	[%l7 + %o4],	%l5
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xda
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o0
	ld	[%l7 + 0x60],	%f4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	nop
	set	0x28, %g6
	stx	%l0,	[%l7 + %g6]
	set	0x48, %i4
	ldxa	[%l7 + %i4] 0x80,	%o2
	nop
	set	0x74, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x5A, %o6
	sth	%l1,	[%l7 + %o6]
	nop
	set	0x54, %i0
	stb	%g4,	[%l7 + %i0]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf0
	membar	#Sync
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%i6
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%g5
	nop
	set	0x58, %l4
	sth	%i3,	[%l7 + %l4]
	and	%l2,	%i2,	%o4
	nop
	set	0x4C, %l3
	ldub	[%l7 + %l3],	%o7
	st	%f1,	[%l7 + 0x2C]
	fpadd32	%f26,	%f4,	%f10
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	nop
	set	0x28, %l5
	std	%f22,	[%l7 + %l5]
	set	0x18, %l0
	stda	%o6,	[%l7 + %l0] 0x88
	nop
	set	0x10, %g2
	std	%i0,	[%l7 + %g2]
	nop
	set	0x18, %i6
	stx	%o5,	[%l7 + %i6]
	nop
	set	0x0C, %g7
	ldsb	[%l7 + %g7],	%i0
	wr 	%g0, 	0x6, 	%fprs
	st	%f19,	[%l7 + 0x34]
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	set	0x7C, %o3
	stwa	%i7,	[%l7 + %o3] 0x81
	set	0x12, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g7
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xeb,	%l2
	wr	%g3,	%i5,	%clear_softint
	set	0x23, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g2
	nop
	set	0x34, %i5
	ldsh	[%l7 + %i5],	%i4
	nop
	set	0x30, %l6
	stx	%l4,	[%l7 + %l6]
	nop
	set	0x44, %i7
	stw	%o3,	[%l7 + %i7]
	nop
	set	0x1A, %g5
	ldsh	[%l7 + %g5],	%i6
	nop
	set	0x7A, %o5
	ldub	[%l7 + %o5],	%l5
	nop
	set	0x54, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x1C, %o4
	stwa	%g6,	[%l7 + %o4] 0x89
	or	%l0,	%o0,	%o2
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x88,	%f25
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%g4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%l6
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x88,	%g5
	ba,a	%icc,	loop_186
	nop
	set	0x78, %i0
	std	%f6,	[%l7 + %i0]
	set	0x44, %i3
	lda	[%l7 + %i3] 0x81,	%f16
loop_186:
	nop
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x80,	%i2
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%l2
	set	0x60, %l4
	swapa	[%l7 + %l4] 0x81,	%o4
	nop
	set	0x6E, %l3
	lduh	[%l7 + %l3],	%o7
	nop
	set	0x30, %i2
	lduh	[%l7 + %i2],	%i2
	st	%f5,	[%l7 + 0x34]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%o6
	set	0x6E, %l5
	stha	%o5,	[%l7 + %l5] 0x80
	set	0x74, %i1
	lda	[%l7 + %i1] 0x81,	%f20
	ld	[%l7 + 0x58],	%f9
	set	0x61, %l0
	stba	%i0,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x18, %i6
	lduw	[%l7 + %i6],	%o1
	nop
	set	0x14, %g7
	swap	[%l7 + %g7],	%g1
	and	%g7,	%l3,	%g3
	nop
	set	0x5D, %o1
	ldub	[%l7 + %o1],	%i7
	or	%i5,	%i4,	%g2
	nop
	set	0x70, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x20, %g2
	lduh	[%l7 + %g2],	%l4
	nop
	set	0x38, %g1
	std	%f26,	[%l7 + %g1]
	set	0x34, %l2
	stwa	%o3,	[%l7 + %l2] 0x80
	nop
	set	0x3B, %o7
	ldstub	[%l7 + %o7],	%i6
	ld	[%l7 + 0x70],	%f3
	nop
	set	0x47, %i5
	ldstub	[%l7 + %i5],	%g6
	set	0x2A, %i7
	stha	%l5,	[%l7 + %i7] 0x88
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	nop
	set	0x20, %o5
	swap	[%l7 + %o5],	%o2
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x80,	%o0
	nop
	set	0x08, %g4
	std	%f8,	[%l7 + %g4]
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xcc
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f12
	nop
	set	0x0E, %g3
	ldsb	[%l7 + %g3],	%g4
	st	%f24,	[%l7 + 0x0C]
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%i6
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd2
	nop
	set	0x5A, %i4
	ldsb	[%l7 + %i4],	%g5
	set	0x30, %o0
	stha	%l2,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x35, %l4
	ldub	[%l7 + %l4],	%i3
	fpadd32	%f28,	%f6,	%f26
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%i2
	nop
	set	0x4C, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x50, %i2
	lda	[%l7 + %i2] 0x80,	%f11
	fpsub32s	%f13,	%f9,	%f1
	nop
	set	0x43, %l5
	ldub	[%l7 + %l5],	%o7
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x81,	%i0
	nop
	set	0x68, %l3
	stb	%o6,	[%l7 + %l3]
	nop
	set	0x46, %i6
	lduh	[%l7 + %i6],	%o5
	set	0x40, %l0
	swapa	[%l7 + %l0] 0x80,	%o1
	nop
	set	0x18, %g7
	lduh	[%l7 + %g7],	%i0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l3
	set	0x7E, %o1
	stha	%g7,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x29, %o3
	ldsb	[%l7 + %o3],	%g3
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f12
	or	%i7,	%i5,	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%o3
	set	0x21, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i6
	nop
	set	0x08, %l2
	std	%f22,	[%l7 + %l2]
	or	%i4,	%g6,	%l5
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%o2
	nop
	set	0x40, %i5
	swap	[%l7 + %i5],	%o0
	nop
	set	0x4C, %g5
	lduh	[%l7 + %g5],	%l0
	set	0x73, %i7
	stba	%g4,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x30, %o5
	stda	%i6,	[%l7 + %o5] 0x80
	set	0x64, %g4
	sta	%f2,	[%l7 + %g4] 0x80
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%l2
	nop
	set	0x28, %l6
	lduw	[%l7 + %l6],	%i3
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x80,	%f24
	wr	%l1,	%i2,	%pic
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f10
	set	0x55, %l1
	stba	%o7,	[%l7 + %l1] 0x88
	set	0x5E, %g3
	stha	%o4,	[%l7 + %g3] 0x81
	or	%o6,	%i1,	%o5
	set	0x26, %o6
	stha	%o1,	[%l7 + %o6] 0x89
	ld	[%l7 + 0x38],	%f28
	nop
	set	0x3C, %i3
	swap	[%l7 + %i3],	%g1
	nop
	set	0x5C, %i0
	ldsw	[%l7 + %i0],	%l3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf9,	%f16
	nop
	set	0x21, %l4
	stb	%i0,	[%l7 + %l4]
	set	0x54, %i2
	lda	[%l7 + %i2] 0x81,	%f17
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%g6
	set	0x20, %i1
	stwa	%g3,	[%l7 + %i1] 0x88
	nop
	set	0x0A, %l3
	stb	%i5,	[%l7 + %l3]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%l4
	nop
	set	0x72, %l5
	sth	%g2,	[%l7 + %l5]
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%o3
	set	0x50, %i6
	lda	[%l7 + %i6] 0x89,	%f4
	nop
	set	0x1A, %o1
	sth	%i4,	[%l7 + %o1]
	nop
	set	0x10, %g7
	std	%f10,	[%l7 + %g7]
	wr	%i6,	%g6,	%clear_softint
	set	0x78, %o3
	stwa	%o2,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x50, %g1
	stx	%o0,	[%l7 + %g1]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc8
	nop
	set	0x76, %l2
	sth	%l5,	[%l7 + %l2]
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f24
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%g4
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f0
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f0
	nop
	set	0x28, %i7
	stw	%l6,	[%l7 + %i7]
	set	0x18, %l6
	stda	%l0,	[%l7 + %l6] 0x80
	nop
	set	0x61, %g6
	ldsb	[%l7 + %g6],	%l2
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x88,	%i3
	nop
	set	0x47, %l1
	stb	%g5,	[%l7 + %l1]
	set	0x30, %o4
	stda	%l0,	[%l7 + %o4] 0x88
	nop
	set	0x3C, %o6
	lduw	[%l7 + %o6],	%i2
	fpsub16	%f20,	%f0,	%f26
	nop
	nop
	setx	0x4AAF17BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x16A6D0D7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f22,	%f13
	nop
	set	0x45, %g3
	ldsb	[%l7 + %g3],	%o4
	or	%o7,	%i1,	%o5
	nop
	set	0x7C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%o1
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x89,	%o6
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f16
	set	0x48, %l4
	lda	[%l7 + %l4] 0x88,	%f5
	set	0x42, %o2
	stba	%g1,	[%l7 + %o2] 0x88
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x08, %l3
	stha	%l3,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x7E, %i2
	ldstub	[%l7 + %i2],	%i0
	nop
	set	0x08, %l0
	lduh	[%l7 + %l0],	%g3
	set	0x40, %l5
	stxa	%i5,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x81,	%g7
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%l4
	set	0x20, %o3
	stxa	%g2,	[%l7 + %o3] 0x81
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x88,	 0
	nop
	set	0x78, %g2
	std	%f26,	[%l7 + %g2]
	set	0x78, %o1
	stxa	%i7,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x48, %l2
	stw	%i6,	[%l7 + %l2]
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xeb,	%i4
	be,pn	%icc,	loop_187
	st	%f3,	[%l7 + 0x0C]
	nop
	set	0x53, %o7
	stb	%g6,	[%l7 + %o7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o2
loop_187:
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%g4
	nop
	set	0x25, %g5
	ldub	[%l7 + %g5],	%l5
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x88,	 1
	fpadd16s	%f18,	%f28,	%f20
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%l2
	st	%f6,	[%l7 + 0x4C]
	and	%i3,	%l6,	%l1
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o4
	nop
	set	0x59, %l1
	ldsb	[%l7 + %l1],	%o7
	nop
	set	0x25, %i7
	ldstub	[%l7 + %i7],	%i1
	st	%f22,	[%l7 + 0x2C]
	nop
	set	0x08, %o4
	ldsh	[%l7 + %o4],	%o5
	set	0x71, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%i0
	nop
	set	0x3C, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x89,	%f19
	nop
	set	0x34, %i0
	lduw	[%l7 + %i0],	%g3
	or	%g7,	%l4,	%g2
	nop
	set	0x3A, %o0
	stb	%i5,	[%l7 + %o0]
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f16
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x81,	%i6
	nop
	set	0x12, %i4
	ldsh	[%l7 + %i4],	%o3
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x88,	%i6
	set	0x78, %l0
	sta	%f24,	[%l7 + %l0] 0x80
	nop
	set	0x60, %l3
	stx	%i4,	[%l7 + %l3]
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%g6
	set	0x0C, %g7
	swapa	[%l7 + %g7] 0x81,	%o0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f0
	set	0x51, %g1
	stba	%g4,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x48, %g2
	std	%f24,	[%l7 + %g2]
	nop
	set	0x44, %l5
	stw	%o2,	[%l7 + %l5]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc0
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%l0
	nop
	set	0x10, %i5
	stx	%l2,	[%l7 + %i5]
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%i2
	set	0x13, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%l5
	or	%i2,	%g5,	%o4
	and	%i1,	%o7,	%o5
	st	%f8,	[%l7 + 0x34]
	set	0x58, %o7
	stwa	%g1,	[%l7 + %o7] 0x81
	set	0x58, %l6
	stwa	%l3,	[%l7 + %l6] 0x81
	nop
	set	0x74, %g4
	ldstub	[%l7 + %g4],	%o1
	nop
	set	0x18, %l1
	ldsh	[%l7 + %l1],	%o6
	st	%f28,	[%l7 + 0x10]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i0
	nop
	set	0x74, %i7
	swap	[%l7 + %i7],	%g7
	add	%g2,	%l4,	%i7
	bn,a	%xcc,	loop_188
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x38, %g6
	stb	%i5,	[%l7 + %g6]
	ld	[%l7 + 0x58],	%f8
loop_188:
	nop
	set	0x3B, %g3
	ldsb	[%l7 + %g3],	%i6
	set	0x40, %i3
	stwa	%o3,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%g6,	%i4,	%g4
	nop
	set	0x5C, %o6
	swap	[%l7 + %o6],	%o0
	st	%f23,	[%l7 + 0x4C]
	set	0x7C, %i0
	sta	%f19,	[%l7 + %i0] 0x89
	bl,pn	%icc,	loop_189
	nop
	set	0x50, %o0
	std	%o2,	[%l7 + %o0]
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%l0
	nop
	set	0x0C, %l4
	stw	%l2,	[%l7 + %l4]
loop_189:
	nop
	set	0x58, %i1
	stha	%l6,	[%l7 + %i1] 0xeb
	membar	#Sync
	st	%f0,	[%l7 + 0x50]
	nop
	set	0x54, %i4
	lduh	[%l7 + %i4],	%l1
	add	%l5,	%i3,	%g5
	nop
	set	0x1B, %l0
	ldstub	[%l7 + %l0],	%o4
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x81,	%i2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%o5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%g1
	set	0x58, %i2
	stxa	%o1,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x20, %i6
	std	%f8,	[%l7 + %i6]
	add	%o6,	%g3,	%i0
	add	%l3,	%g2,	%l4
	set	0x54, %g7
	stwa	%i7,	[%l7 + %g7] 0x89
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x88,	%g7
	set	0x50, %g2
	stxa	%i5,	[%l7 + %g2] 0x80
	nop
	set	0x2E, %o3
	lduh	[%l7 + %o3],	%i6
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xe2,	%g6
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%i4
	nop
	set	0x70, %i5
	prefetch	[%l7 + %i5],	 1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%o0
	set	0x66, %l5
	stba	%o2,	[%l7 + %l5] 0x88
	set	0x41, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o3
	nop
	set	0x36, %g5
	stb	%l2,	[%l7 + %g5]
	add	%l6,	%l0,	%l1
	nop
	set	0x40, %o7
	ldstub	[%l7 + %o7],	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%o4
	add	%i3,	%o7,	%o5
	set	0x48, %l6
	swapa	[%l7 + %l6] 0x80,	%i2
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%i1
	set	0x4C, %g4
	lda	[%l7 + %g4] 0x80,	%f31
	nop
	set	0x54, %o4
	stw	%o1,	[%l7 + %o4]
	set	0x5C, %i7
	sta	%f21,	[%l7 + %i7] 0x89
	nop
	set	0x6E, %g3
	ldsh	[%l7 + %g3],	%g1
	nop
	set	0x22, %i3
	ldsh	[%l7 + %i3],	%o6
	nop
	set	0x29, %o6
	ldub	[%l7 + %o6],	%g3
	nop
	set	0x1A, %i0
	sth	%l3,	[%l7 + %i0]
	add	%i0,	%l4,	%g2
	nop
	set	0x58, %o0
	std	%f16,	[%l7 + %o0]
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%i7
	nop
	set	0x21, %l4
	ldub	[%l7 + %l4],	%i5
	ld	[%l7 + 0x54],	%f11
	and	%i6,	%g7,	%g6
	or	%g4,	%i4,	%o0
	st	%f21,	[%l7 + 0x78]
	nop
	set	0x1C, %i1
	swap	[%l7 + %i1],	%o2
	st	%f7,	[%l7 + 0x48]
	set	0x60, %g6
	sta	%f19,	[%l7 + %g6] 0x81
	set	0x10, %l0
	sta	%f5,	[%l7 + %l0] 0x89
	nop
	set	0x08, %l3
	ldsh	[%l7 + %l3],	%l2
	set	0x0E, %i2
	stba	%l6,	[%l7 + %i2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x80,	%o3
	set	0x30, %g7
	stha	%l0,	[%l7 + %g7] 0x80
	set	0x5C, %g1
	stwa	%l5,	[%l7 + %g1] 0x80
	set	0x61, %g2
	stba	%g5,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x28, %i4
	lduh	[%l7 + %i4],	%o4
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x88,	%i3
	set	0x60, %o3
	stda	%l0,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x64, %i5
	lda	[%l7 + %i5] 0x88,	%f31
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%i2
	nop
	set	0x64, %l5
	sth	%i1,	[%l7 + %l5]
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x88,	%o1
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f24
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%o6
	and	%g3,	%l3,	%i0
	or	%l4,	%g1,	%i7
	nop
	set	0x6C, %g5
	lduw	[%l7 + %g5],	%g2
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%i4
	nop
	set	0x75, %o7
	ldstub	[%l7 + %o7],	%g7
	nop
	set	0x54, %l1
	stb	%g6,	[%l7 + %l1]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f16
	nop
	set	0x70, %i7
	ldsw	[%l7 + %i7],	%i6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd0
	nop
	set	0x38, %o4
	std	%f12,	[%l7 + %o4]
	and	%i4,	%g4,	%o0
	st	%f19,	[%l7 + 0x2C]
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%o2
	nop
	set	0x57, %i3
	ldub	[%l7 + %i3],	%l2
	nop
	set	0x12, %i0
	sth	%o3,	[%l7 + %i0]
	and	%l6,	%l0,	%g5
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	and	%l5,	%o4,	%i3
	set	0x60, %o0
	stxa	%l1,	[%l7 + %o0] 0x89
	nop
	set	0x42, %l4
	sth	%i2,	[%l7 + %l4]
	ld	[%l7 + 0x58],	%f21
	nop
	set	0x22, %i1
	lduh	[%l7 + %i1],	%i1
	nop
	set	0x56, %l0
	sth	%o1,	[%l7 + %l0]
	fpadd32s	%f24,	%f18,	%f9
	ld	[%l7 + 0x3C],	%f14
	st	%f27,	[%l7 + 0x2C]
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%o5
	set	0x18, %g6
	stda	%o6,	[%l7 + %g6] 0x81
	set	0x78, %i6
	swapa	[%l7 + %i6] 0x80,	%o6
	nop
	set	0x16, %g7
	ldsb	[%l7 + %g7],	%l3
	and	%i0,	%l4,	%g3
	ble,a	%xcc,	loop_190
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x54, %g1
	stw	%g1,	[%l7 + %g1]
	set	0x36, %g2
	stha	%g2,	[%l7 + %g2] 0xe3
	membar	#Sync
loop_190:
	nop
	set	0x18, %i4
	ldsb	[%l7 + %i4],	%i5
	set	0x7B, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g7
	nop
	set	0x44, %o3
	lduw	[%l7 + %o3],	%g6
	nop
	set	0x68, %i2
	std	%i6,	[%l7 + %i2]
	nop
	set	0x0F, %l5
	ldub	[%l7 + %l5],	%i6
	nop
	set	0x50, %l2
	stx	%g4,	[%l7 + %l2]
	nop
	set	0x64, %o5
	lduw	[%l7 + %o5],	%o0
	set	0x18, %i5
	stwa	%o2,	[%l7 + %i5] 0x89
	and	%i4,	%l2,	%o3
	nop
	set	0x32, %g5
	ldsh	[%l7 + %g5],	%l0
	nop
	set	0x22, %o7
	sth	%g5,	[%l7 + %o7]
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%l6
	fpsub32	%f0,	%f2,	%f18
	nop
	set	0x18, %l1
	std	%f18,	[%l7 + %l1]
	nop
	set	0x40, %g4
	stx	%l5,	[%l7 + %g4]
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%i2
	nop
	set	0x68, %o4
	std	%o4,	[%l7 + %o4]
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x81,	 1
	nop
	set	0x14, %i3
	ldsh	[%l7 + %i3],	%l1
	fpadd16s	%f10,	%f10,	%f2
	st	%f16,	[%l7 + 0x50]
	nop
	set	0x78, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x5D, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o1
	set	0x64, %o0
	lda	[%l7 + %o0] 0x88,	%f23
	set	0x34, %l4
	stha	%o5,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%i0
	and	%o6,	%o7,	%i0
	set	0x67, %l0
	ldstuba	[%l7 + %l0] 0x89,	%l3
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	nop
	set	0x20, %l3
	swap	[%l7 + %l3],	%g1
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%g3
	add	%g2,	%g7,	%g6
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i5
	and	%o0,	%g4,	%o2
	nop
	set	0x30, %g7
	stx	%l2,	[%l7 + %g7]
	nop
	set	0x33, %g1
	ldsb	[%l7 + %g1],	%o3
	nop
	set	0x48, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%l0,	%g5,	%i4
	nop
	set	0x44, %o1
	lduh	[%l7 + %o1],	%l6
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f22
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f20
	nop
	set	0x62, %o3
	sth	%i3,	[%l7 + %o3]
	nop
	set	0x20, %l5
	std	%o4,	[%l7 + %l5]
	nop
	set	0x75, %l2
	ldsb	[%l7 + %l2],	%l5
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%i2
	bleu,a,pt	%xcc,	loop_191
	st	%f26,	[%l7 + 0x30]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o5
loop_191:
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%f8
	set	0x21, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o1
	set	0x68, %g5
	stwa	%i1,	[%l7 + %g5] 0x88
	or	%o6,	%o7,	%l3
	set	0x64, %l1
	lda	[%l7 + %l1] 0x88,	%f27
	nop
	set	0x6E, %l6
	stb	%i0,	[%l7 + %l6]
	nop
	set	0x54, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x0E, %i7
	ldsh	[%l7 + %i7],	%l4
	nop
	set	0x38, %o4
	lduw	[%l7 + %o4],	%g1
	set	0x38, %g3
	stha	%g3,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x34, %i3
	lduw	[%l7 + %i3],	%g7
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%g6
	set	0x10, %o2
	stha	%i6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x2C, %l4
	sta	%f6,	[%l7 + %l4] 0x89
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%i7
	wr	%i5,	%g4,	%ccr
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x80,	%o2
	or	%l2,	%o3,	%o0
	nop
	set	0x0E, %l0
	ldub	[%l7 + %l0],	%l0
	nop
	set	0x38, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xe3,	%i4
	st	%fsr,	[%l7 + 0x08]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%l6
	set	0x78, %g6
	stxa	%o4,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f16
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i2
	fpadd32	%f20,	%f12,	%f22
	nop
	set	0x13, %g1
	ldub	[%l7 + %g1],	%l5
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xeb,	%l0
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%i2
	wr	%o1,	%o5,	%pic
	set	0x26, %i2
	stha	%i1,	[%l7 + %i2] 0x89
	fpadd32s	%f1,	%f26,	%f0
	and	%o7,	%o6,	%l3
	set	0x6C, %l5
	sta	%f23,	[%l7 + %l5] 0x81
	nop
	set	0x51, %o3
	ldsb	[%l7 + %o3],	%i0
	set	0x18, %i5
	lda	[%l7 + %i5] 0x88,	%f1
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%l4
	set	0x78, %o7
	stxa	%g3,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x60, %g5
	ldub	[%l7 + %g5],	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%g1
	set	0x7C, %l1
	lda	[%l7 + %l1] 0x88,	%f0
	nop
	set	0x1A, %l6
	ldsh	[%l7 + %l6],	%i6
	nop
	set	0x48, %g4
	std	%f28,	[%l7 + %g4]
	nop
	set	0x5C, %i7
	lduh	[%l7 + %i7],	%i7
	nop
	set	0x33, %o5
	ldstub	[%l7 + %o5],	%g6
	set	0x38, %o4
	stda	%i4,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x70, %i3
	sta	%f25,	[%l7 + %i3] 0x81
	fpsub32	%f20,	%f8,	%f28
	fpadd16s	%f28,	%f22,	%f16
	set	0x7C, %o6
	lda	[%l7 + %o6] 0x89,	%f17
	or	%g4,	%o2,	%l2
	nop
	set	0x32, %g3
	ldub	[%l7 + %g3],	%o3
	st	%f29,	[%l7 + 0x40]
	fpsub32s	%f29,	%f22,	%f10
	ble,a	%xcc,	loop_192
	or	%o0,	%l0,	%i4
	fpsub32s	%f30,	%f19,	%f23
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%l6
loop_192:
	nop
	set	0x44, %o2
	ldsh	[%l7 + %o2],	%g5
	add	%o4,	%l5,	%i3
	nop
	set	0x58, %i1
	ldsw	[%l7 + %i1],	%l1
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%f8
	set	0x5C, %i0
	sta	%f31,	[%l7 + %i0] 0x88
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0
	nop
	set	0x36, %l3
	ldstub	[%l7 + %l3],	%o5
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc4
	set	0x29, %g7
	stba	%i2,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x5E, %g2
	sth	%o7,	[%l7 + %g2]
	st	%f2,	[%l7 + 0x48]
	nop
	set	0x7C, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x76, %i6
	stha	%i1,	[%l7 + %i6] 0x81
	nop
	set	0x08, %o1
	stw	%l3,	[%l7 + %o1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%o6
	nop
	set	0x76, %i2
	ldsb	[%l7 + %i2],	%l4
	nop
	set	0x77, %i4
	stb	%g3,	[%l7 + %i4]
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%g2
	nop
	set	0x38, %i5
	swap	[%l7 + %i5],	%g1
	ba,a	%xcc,	loop_193
	nop
	set	0x0A, %l5
	lduh	[%l7 + %l5],	%g7
	or	%i7,	%g6,	%i6
	nop
	set	0x5A, %o7
	ldsh	[%l7 + %o7],	%i5
loop_193:
	ld	[%l7 + 0x38],	%f1
	nop
	set	0x60, %g5
	std	%g4,	[%l7 + %g5]
	nop
	set	0x18, %l1
	stb	%l2,	[%l7 + %l1]
	nop
	set	0x24, %l6
	lduw	[%l7 + %l6],	%o3
	nop
	set	0x20, %l2
	ldstub	[%l7 + %l2],	%o2
	and	%l0,	%i4,	%o0
	set	0x48, %i7
	sta	%f30,	[%l7 + %i7] 0x89
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%l6
	nop
	set	0x48, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x25, %g4
	ldub	[%l7 + %g4],	%g5
	fpadd32s	%f3,	%f19,	%f3
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%l4
	ld	[%l7 + 0x24],	%f21
	ld	[%l7 + 0x2C],	%f16
	nop
	set	0x70, %i3
	stx	%i3,	[%l7 + %i3]
	and	%o4,	%l1,	%o1
	nop
	set	0x78, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x48, %l4
	ldsb	[%l7 + %l4],	%o5
	set	0x42, %o2
	stha	%i2,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x3B, %i1
	ldub	[%l7 + %i1],	%i1
	fpadd32	%f20,	%f22,	%f18
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x89,	 1
	fpadd16	%f6,	%f22,	%f26
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%o6
	set	0x47, %i0
	stba	%l3,	[%l7 + %i0] 0x81
	and	%l4,	%g2,	%g3
	nop
	set	0x42, %l0
	ldstub	[%l7 + %l0],	%g7
	ld	[%l7 + 0x08],	%f15
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g6
	bn,pt	%xcc,	loop_194
	nop
	set	0x60, %g6
	sth	%g1,	[%l7 + %g6]
	nop
	set	0x21, %l3
	ldub	[%l7 + %l3],	%i5
	and	%g4,	%i6,	%o3
loop_194:
	nop
	set	0x18, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x58, %g1
	sta	%f21,	[%l7 + %g1] 0x88
	set	0x36, %g7
	stba	%l2,	[%l7 + %g7] 0x80
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%o2
	ba,a	%icc,	loop_195
	nop
	set	0x26, %i6
	stb	%o0,	[%l7 + %i6]
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x60, %i2
	stda	%i4,	[%l7 + %i2] 0x89
loop_195:
	nop
	set	0x4C, %i4
	ldsh	[%l7 + %i4],	%l6
	set	0x40, %o3
	stxa	%g5,	[%l7 + %o3] 0x81
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf1,	%f16
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x4C, %o7
	ldsb	[%l7 + %o7],	%i3
	set	0x28, %g5
	stwa	%o4,	[%l7 + %g5] 0x80
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f0
	nop
	set	0x71, %l2
	ldstub	[%l7 + %l2],	%l5
	set	0x47, %l6
	stba	%o1,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x34, %i7
	stwa	%l1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x48, %o5
	ldsw	[%l7 + %o5],	%i2
	set	0x30, %g4
	ldda	[%l7 + %g4] 0xe3,	%o4
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x89,	%i0
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%o7
	nop
	set	0x70, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x66, %g3
	lduh	[%l7 + %g3],	%i0
	nop
	set	0x64, %l4
	ldsh	[%l7 + %l4],	%l4
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x81,	%l3
	st	%f29,	[%l7 + 0x78]
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%g3
	nop
	set	0x70, %o2
	std	%g6,	[%l7 + %o2]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%i6
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f16
	nop
	set	0x6C, %g6
	lduw	[%l7 + %g6],	%g2
	nop
	set	0x40, %g2
	ldstub	[%l7 + %g2],	%g6
	set	0x7A, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g1
	set	0x78, %g7
	stxa	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%o3
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%l2
	nop
	set	0x40, %o1
	sth	%l0,	[%l7 + %o1]
	set	0x20, %i6
	stxa	%o2,	[%l7 + %i6] 0xe2
	membar	#Sync
	fpadd16s	%f9,	%f19,	%f14
	set	0x40, %i4
	ldxa	[%l7 + %i4] 0x88,	%i5
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x68, %i2
	std	%f0,	[%l7 + %i2]
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%o0
	and	%i4,	%g5,	%l6
	set	0x5A, %l5
	stha	%i3,	[%l7 + %l5] 0x80
	nop
	set	0x48, %i5
	lduw	[%l7 + %i5],	%o4
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x60, %g5
	stw	%o1,	[%l7 + %g5]
	nop
	set	0x61, %l1
	ldub	[%l7 + %l1],	%l1
	bne,a	%xcc,	loop_196
	nop
	set	0x48, %o7
	stw	%l5,	[%l7 + %o7]
	or	%o5,	%i2,	%i1
	nop
	set	0x70, %l6
	stx	%o6,	[%l7 + %l6]
loop_196:
	nop
	set	0x28, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o7
	nop
	set	0x62, %i7
	ldstub	[%l7 + %i7],	%l4
	nop
	set	0x15, %g4
	ldsb	[%l7 + %g4],	%l3
	set	0x78, %o6
	swapa	[%l7 + %o6] 0x80,	%g3
	nop
	set	0x68, %o4
	lduw	[%l7 + %o4],	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%g2
	fpadd16	%f10,	%f6,	%f20
	set	0x50, %i3
	stxa	%g6,	[%l7 + %i3] 0x89
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x89,	%i0
	nop
	set	0x5A, %l4
	sth	%g4,	[%l7 + %l4]
	wr	%i6,	%g1,	%clear_softint
	nop
	set	0x20, %i1
	ldsw	[%l7 + %i1],	%o3
	set	0x34, %o0
	stwa	%l2,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x7A, %o2
	ldsh	[%l7 + %o2],	%l0
	nop
	set	0x50, %o5
	std	%o2,	[%l7 + %o5]
	nop
	set	0x68, %i0
	stw	%i5,	[%l7 + %i0]
	nop
	set	0x78, %g6
	std	%f18,	[%l7 + %g6]
	nop
	set	0x6E, %g2
	ldsh	[%l7 + %g2],	%o0
	set	0x40, %g1
	stda	%i4,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x44, %g7
	lda	[%l7 + %g7] 0x89,	%f17
	set	0x28, %l0
	stwa	%l6,	[%l7 + %l0] 0x80
	nop
	set	0x48, %o1
	swap	[%l7 + %o1],	%i3
	nop
	set	0x38, %i6
	ldub	[%l7 + %i6],	%g5
	and	%o4,	%l1,	%o1
	set	0x0C, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l5
	wr	%i2,	%i1,	%clear_softint
	nop
	set	0x2E, %i2
	ldsh	[%l7 + %i2],	%o6
	nop
	set	0x55, %l3
	stb	%o5,	[%l7 + %l3]
	set	0x78, %l5
	stwa	%o7,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x71, %o3
	ldub	[%l7 + %o3],	%l4
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%l3
	nop
	set	0x5B, %l1
	stb	%g3,	[%l7 + %l1]
	or	%i7,	%g7,	%g2
	set	0x68, %o7
	stxa	%i0,	[%l7 + %o7] 0x81
	nop
	set	0x78, %l6
	sth	%g4,	[%l7 + %l6]
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x80,	%f13
	nop
	set	0x40, %g5
	prefetch	[%l7 + %g5],	 0
	ld	[%l7 + 0x54],	%f21
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x30, %g4
	swapa	[%l7 + %g4] 0x81,	%i6
	nop
	set	0x10, %o6
	lduh	[%l7 + %o6],	%g1
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%g6
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%o2
	nop
	set	0x71, %i3
	stb	%l0,	[%l7 + %i3]
	bleu	%xcc,	loop_197
	nop
	set	0x60, %l4
	ldsb	[%l7 + %l4],	%l2
	nop
	set	0x5B, %i1
	ldub	[%l7 + %i1],	%o2
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x88,	%i5
loop_197:
	nop
	set	0x3E, %o5
	lduh	[%l7 + %o5],	%o0
	set	0x4F, %o0
	stba	%l6,	[%l7 + %o0] 0x80
	nop
	set	0x40, %i0
	stx	%i4,	[%l7 + %i0]
	nop
	set	0x60, %g6
	std	%f28,	[%l7 + %g6]
	nop
	set	0x3A, %g1
	sth	%g5,	[%l7 + %g1]
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%i3
	set	0x20, %l0
	sta	%f10,	[%l7 + %l0] 0x89
	nop
	set	0x3B, %g2
	ldub	[%l7 + %g2],	%o4
	nop
	set	0x30, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x50, %o1
	std	%l0,	[%l7 + %o1]
	nop
	set	0x78, %i2
	ldsh	[%l7 + %i2],	%o1
	nop
	set	0x68, %i4
	lduw	[%l7 + %i4],	%l5
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd0,	%f16
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf9,	%f16
	nop
	set	0x6C, %o3
	ldsb	[%l7 + %o3],	%i1
	add	%i2,	%o5,	%o7
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x0C, %l1
	sta	%f12,	[%l7 + %l1] 0x80
	nop
	set	0x54, %l6
	lduw	[%l7 + %l6],	%o6
	nop
	set	0x60, %o7
	std	%l2,	[%l7 + %o7]
	nop
	set	0x53, %g5
	ldub	[%l7 + %g5],	%l4
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%i6
	nop
	set	0x78, %i7
	lduw	[%l7 + %i7],	%g7
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%g2
	set	0x1E, %o4
	stha	%g3,	[%l7 + %o4] 0x88
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf0
	membar	#Sync
	nop
	set	0x70, %g4
	sth	%g4,	[%l7 + %g4]
	and	%i6,	%i0,	%g1
	nop
	set	0x2D, %i1
	stb	%g6,	[%l7 + %i1]
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%l0
	add	%l2,	%o2,	%o3
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x89,	%o0
	nop
	set	0x58, %o5
	lduh	[%l7 + %o5],	%i5
	ld	[%l7 + 0x24],	%f31
	set	0x1C, %i0
	stwa	%l6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x08, %o0
	std	%g4,	[%l7 + %o0]
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	ld	[%l7 + 0x7C],	%f18
	set	0x68, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i4
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x89,	%i3
	nop
	set	0x5C, %i6
	swap	[%l7 + %i6],	%l1
	set	0x36, %o1
	stba	%o1,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x75, %i2
	stba	%o4,	[%l7 + %i2] 0x89
	nop
	set	0x54, %i4
	stw	%i1,	[%l7 + %i4]
	fpadd32	%f28,	%f2,	%f28
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%l5
	nop
	set	0x2F, %l3
	ldub	[%l7 + %l3],	%o5
	fpsub16s	%f18,	%f8,	%f3
	nop
	set	0x0A, %g2
	ldsh	[%l7 + %g2],	%o7
	nop
	set	0x13, %i5
	stb	%i2,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x30]
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x81,	%o6
	set	0x30, %l6
	stha	%l4,	[%l7 + %l6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%i6
	set	0x58, %g5
	prefetcha	[%l7 + %g5] 0x81,	 1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%g3
	st	%f28,	[%l7 + 0x08]
	fpadd32	%f6,	%f2,	%f10
	nop
	set	0x58, %o7
	swap	[%l7 + %o7],	%g2
	nop
	set	0x7E, %l2
	sth	%i6,	[%l7 + %l2]
	nop
	set	0x3A, %i7
	sth	%i0,	[%l7 + %i7]
	st	%f12,	[%l7 + 0x6C]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x80,	%g0
	bg	%icc,	loop_198
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%g4
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%l0
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%g6
loop_198:
	nop
	set	0x1E, %i3
	ldub	[%l7 + %i3],	%o2
	nop
	set	0x52, %l4
	ldub	[%l7 + %l4],	%o3
	nop
	set	0x26, %i1
	ldstub	[%l7 + %i1],	%o0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%i5
	set	0x5C, %o2
	stwa	%l6,	[%l7 + %o2] 0x80
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x88,	 4
	nop
	set	0x22, %o0
	ldsb	[%l7 + %o0],	%i3
	set	0x64, %o5
	stba	%i4,	[%l7 + %o5] 0x88
	nop
	set	0x6C, %g7
	ldstub	[%l7 + %g7],	%l1
	fpsub16s	%f6,	%f21,	%f27
	set	0x37, %g6
	ldstuba	[%l7 + %g6] 0x89,	%o4
	nop
	set	0x68, %g1
	swap	[%l7 + %g1],	%i1
	set	0x20, %l0
	stxa	%o1,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x18, %i6
	stda	%l4,	[%l7 + %i6] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f16
	nop
	set	0x0C, %i4
	ldsw	[%l7 + %i4],	%o7
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x24, %l5
	sth	%o6,	[%l7 + %l5]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%l4
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	nop
	set	0x39, %o3
	ldstub	[%l7 + %o3],	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%g3
	nop
	set	0x60, %l6
	stx	%g2,	[%l7 + %l6]
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%i6
	or	%l3,	%g1,	%i0
	nop
	set	0x5B, %g5
	ldstub	[%l7 + %g5],	%l0
	nop
	set	0x52, %l1
	ldub	[%l7 + %l1],	%g6
	or	%o2,	%o3,	%g4
	nop
	set	0x2A, %l2
	lduh	[%l7 + %l2],	%o0
	set	0x7E, %o7
	stha	%l2,	[%l7 + %o7] 0x89
	add	%l6,	%i5,	%g5
	nop
	set	0x3C, %i7
	swap	[%l7 + %i7],	%i4
	nop
	set	0x6F, %o6
	ldsb	[%l7 + %o6],	%i3
	nop
	set	0x74, %g3
	swap	[%l7 + %g3],	%o4
	fpadd32	%f2,	%f12,	%f2
	and	%i1,	%o1,	%l1
	set	0x60, %g4
	stxa	%l5,	[%l7 + %g4] 0x88
	nop
	nop
	setx	0x1D351F09AA6FA3A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0535CC9228C7A8FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f12
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%o7
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x80,	%o6
	nop
	set	0x2C, %l4
	ldsw	[%l7 + %l4],	%i2
	set	0x44, %o2
	stwa	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x14, %i0
	sta	%f4,	[%l7 + %i0] 0x89
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd2
	add	%i7,	%g7,	%g3
	nop
	set	0x30, %o5
	ldsb	[%l7 + %o5],	%o5
	set	0x24, %i1
	stba	%i6,	[%l7 + %i1] 0x81
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l3
	nop
	set	0x13, %g7
	ldstub	[%l7 + %g7],	%i0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	st	%fsr,	[%l7 + 0x48]
	or	%l0,	%g1,	%g6
	nop
	set	0x6C, %l0
	prefetch	[%l7 + %l0],	 0
	or	%o2,	%g4,	%o3
	nop
	set	0x77, %i6
	stb	%l2,	[%l7 + %i6]
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%o0
	nop
	set	0x08, %o1
	lduw	[%l7 + %o1],	%l6
	add	%g5,	%i4,	%i3
	set	0x18, %i2
	lda	[%l7 + %i2] 0x88,	%f6
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x60, %l5
	stxa	%o4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x48, %g2
	stx	%i1,	[%l7 + %g2]
	set	0x19, %l3
	stba	%i5,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	st	%f28,	[%l7 + 0x68]
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f18
	set	0x73, %g5
	stba	%o1,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x28, %l1
	std	%l4,	[%l7 + %l1]
	ld	[%l7 + 0x74],	%f10
	nop
	set	0x38, %i5
	std	%l0,	[%l7 + %i5]
	set	0x47, %o7
	stba	%o7,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x68, %i7
	stda	%i2,	[%l7 + %i7] 0x89
	set	0x1C, %o6
	swapa	[%l7 + %o6] 0x89,	%l4
	nop
	set	0x78, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x58, %g4
	std	%o6,	[%l7 + %g4]
	nop
	set	0x68, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x56, %o4
	stha	%g7,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f8
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf9
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%o5
	nop
	set	0x50, %i3
	stx	%i6,	[%l7 + %i3]
	set	0x28, %i0
	stda	%g2,	[%l7 + %i0] 0x88
	nop
	set	0x48, %o0
	ldx	[%l7 + %o0],	%l3
	nop
	set	0x58, %o5
	std	%i0,	[%l7 + %o5]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	st	%fsr,	[%l7 + 0x4C]
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xea,	%g2
	nop
	set	0x71, %l0
	stb	%l0,	[%l7 + %l0]
	nop
	set	0x2E, %i1
	ldstub	[%l7 + %i1],	%g1
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%o2
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%g6
	set	0x24, %i2
	swapa	[%l7 + %i2] 0x80,	%o3
	set	0x56, %i4
	stha	%g4,	[%l7 + %i4] 0x88
	nop
	set	0x58, %o1
	std	%f6,	[%l7 + %o1]
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f14
	nop
	set	0x76, %l3
	ldsb	[%l7 + %l3],	%l2
	be,pt	%xcc,	loop_199
	nop
	set	0x5C, %o3
	ldub	[%l7 + %o3],	%o0
	nop
	set	0x0C, %l6
	ldub	[%l7 + %l6],	%l6
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f14
loop_199:
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f20
	add	%i4,	%g5,	%o4
	ld	[%l7 + 0x44],	%f17
	nop
	set	0x74, %i5
	ldsw	[%l7 + %i5],	%i3
	ld	[%l7 + 0x60],	%f2
	nop
	set	0x40, %l1
	ldsh	[%l7 + %l1],	%i5
	set	0x36, %o7
	stha	%i1,	[%l7 + %o7] 0x89
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x81,	%l5
	nop
	set	0x66, %i7
	lduh	[%l7 + %i7],	%o1
	set	0x30, %g4
	stxa	%o7,	[%l7 + %g4] 0x89
	set	0x28, %l2
	sta	%f0,	[%l7 + %l2] 0x89
	set	0x68, %g3
	stda	%l0,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x11, %l4
	ldub	[%l7 + %l4],	%i2
	add	%l4,	%g7,	%o6
	add	%o5,	%i6,	%i7
	nop
	set	0x40, %o2
	std	%g2,	[%l7 + %o2]
	fpadd16s	%f19,	%f29,	%f24
	nop
	set	0x54, %i3
	ldsw	[%l7 + %i3],	%l3
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%i0
	nop
	set	0x43, %o4
	ldstub	[%l7 + %o4],	%g2
	or	%g1,	%o2,	%g6
	set	0x4C, %o5
	lda	[%l7 + %o5] 0x88,	%f23
	nop
	set	0x10, %o0
	ldsh	[%l7 + %o0],	%l0
	set	0x68, %g7
	stwa	%g4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc8
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x89,	%l2
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f0
	nop
	set	0x22, %g1
	sth	%o0,	[%l7 + %g1]
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%l6
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%i4
	nop
	set	0x28, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x34, %i4
	lda	[%l7 + %i4] 0x81,	%f13
	st	%fsr,	[%l7 + 0x14]
	set	0x1C, %l3
	lda	[%l7 + %l3] 0x81,	%f26
	nop
	set	0x74, %o3
	ldsb	[%l7 + %o3],	%o3
	set	0x44, %l6
	lda	[%l7 + %l6] 0x81,	%f3
	nop
	set	0x20, %g2
	stx	%g5,	[%l7 + %g2]
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	nop
	set	0x6C, %i5
	ldsh	[%l7 + %i5],	%i3
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x89,	%i1
	nop
	set	0x1C, %l1
	swap	[%l7 + %l1],	%l5
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x81,	%o1
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x81,	 1
	ld	[%l7 + 0x40],	%f6
	set	0x30, %o6
	stwa	%l1,	[%l7 + %o6] 0x80
	nop
	set	0x30, %l2
	stx	%i5,	[%l7 + %l2]
	nop
	set	0x70, %g4
	std	%l4,	[%l7 + %g4]
	nop
	set	0x27, %g3
	ldsb	[%l7 + %g3],	%g7
	st	%fsr,	[%l7 + 0x64]
	set	0x30, %l4
	lda	[%l7 + %l4] 0x89,	%f30
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%o5
	nop
	set	0x44, %i3
	swap	[%l7 + %i3],	%o6
	set	0x37, %i0
	stba	%i7,	[%l7 + %i0] 0x80
	set	0x24, %o2
	stwa	%g3,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x4C, %o5
	swapa	[%l7 + %o5] 0x80,	%l3
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%i0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xeb,	%g2
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x80,	%i6
	nop
	set	0x54, %i1
	ldsw	[%l7 + %i1],	%o2
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f0
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x80,	%g6
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x88,	%g1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	or	%l0,	%l2,	%o0
	set	0x24, %o1
	sta	%f12,	[%l7 + %o1] 0x88
	ble	%xcc,	loop_200
	fpsub16s	%f27,	%f6,	%f9
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x81
loop_200:
	nop
	set	0x68, %i4
	std	%f22,	[%l7 + %i4]
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x89,	%l6
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f22
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i4
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	nop
	set	0x60, %l3
	std	%g4,	[%l7 + %l3]
	set	0x7E, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i3
	st	%f21,	[%l7 + 0x4C]
	set	0x5C, %l5
	swapa	[%l7 + %l5] 0x89,	%i1
	wr	%l5,	%o4,	%ccr
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%o1
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f8
	nop
	set	0x68, %l1
	stx	%o7,	[%l7 + %l1]
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xe3,	%i4
	add	%l1,	%g7,	%l4
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f0
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%i2
	nop
	set	0x5C, %l2
	ldsh	[%l7 + %l2],	%o6
	add	%i7,	%g3,	%o5
	nop
	set	0x78, %l4
	std	%i0,	[%l7 + %l4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g2
	or	%i6,	%g6,	%o2
	nop
	set	0x68, %i3
	stx	%l0,	[%l7 + %i3]
	set	0x4A, %g3
	stha	%l2,	[%l7 + %g3] 0x80
	nop
	set	0x50, %i0
	stx	%g1,	[%l7 + %i0]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f16
	nop
	set	0x10, %o4
	sth	%o0,	[%l7 + %o4]
	nop
	set	0x78, %o2
	std	%i6,	[%l7 + %o2]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd2
	nop
	set	0x48, %g7
	std	%f26,	[%l7 + %g7]
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xea,	%i4
	ld	[%l7 + 0x44],	%f26
	set	0x0C, %g6
	stba	%o3,	[%l7 + %g6] 0x80
	fpsub16s	%f30,	%f9,	%f21
	set	0x6C, %i1
	sta	%f1,	[%l7 + %i1] 0x88
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%g4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	nop
	set	0x7C, %g1
	swap	[%l7 + %g1],	%g5
	set	0x70, %i4
	lda	[%l7 + %i4] 0x89,	%f25
	nop
	set	0x1C, %o3
	ldsh	[%l7 + %o3],	%i3
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%i0
	nop
	set	0x38, %g2
	std	%f14,	[%l7 + %g2]
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%o4
	nop
	set	0x58, %i5
	std	%f18,	[%l7 + %i5]
	nop
	set	0x28, %l5
	std	%f18,	[%l7 + %l5]
	set	0x6E, %g5
	stha	%l5,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x4C, %l3
	lduw	[%l7 + %l3],	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%i5
	nop
	set	0x2F, %l1
	ldstub	[%l7 + %l1],	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%i2
	nop
	set	0x7C, %o7
	lduw	[%l7 + %o7],	%l4
	set	0x20, %i7
	stda	%o6,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%g3,	%i7,	%i0
	st	%f8,	[%l7 + 0x18]
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%l2
	and	%o5,	%i6,	%g6
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x30, %l2
	std	%g2,	[%l7 + %l2]
	wr	%l0,	%o2,	%y
	bn,a	%xcc,	loop_201
	nop
	set	0x38, %l4
	lduh	[%l7 + %l4],	%l2
	and	%o0,	%l6,	%g1
	nop
	set	0x20, %g3
	std	%i4,	[%l7 + %g3]
loop_201:
	nop
	set	0x6E, %i3
	ldsh	[%l7 + %i3],	%o3
	nop
	set	0x38, %o5
	std	%f30,	[%l7 + %o5]
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x81,	%g4
	st	%fsr,	[%l7 + 0x54]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%g4
	nop
	set	0x51, %o2
	ldsb	[%l7 + %o2],	%i1
	ld	[%l7 + 0x54],	%f12
	bleu,pt	%xcc,	loop_202
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x50, %o0
	ldda	[%l7 + %o0] 0xe2,	%l4
loop_202:
	nop
	set	0x28, %g7
	stda	%o4,	[%l7 + %g7] 0x81
	ld	[%l7 + 0x68],	%f16
	set	0x43, %l0
	stba	%o1,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x80,	%o7
	set	0x10, %g6
	ldxa	[%l7 + %g6] 0x81,	%g7
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xda,	%f0
	nop
	set	0x3D, %g1
	stb	%l1,	[%l7 + %g1]
	set	0x08, %i6
	stxa	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x3C, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x58, %i2
	std	%i4,	[%l7 + %i2]
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%o6
	set	0x1D, %l6
	ldstuba	[%l7 + %l6] 0x88,	%g3
	set	0x50, %g2
	stwa	%l4,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x08, %l5
	stxa	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x54],	%f17
	set	0x09, %i5
	stba	%l3,	[%l7 + %i5] 0x80
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x89,	%f21
	nop
	set	0x73, %l1
	ldstub	[%l7 + %l1],	%i7
	nop
	set	0x60, %o7
	std	%f4,	[%l7 + %o7]
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x89,	%o5
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%g6
	nop
	set	0x30, %g4
	std	%i6,	[%l7 + %g4]
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%l0
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%g2
	add	%l2,	%o0,	%o2
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x88,	%l6
	set	0x6C, %o6
	sta	%f13,	[%l7 + %o6] 0x80
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f0
	nop
	set	0x68, %o4
	stx	%i4,	[%l7 + %o4]
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%o3
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x88,	%g5
	nop
	set	0x64, %i0
	ldsw	[%l7 + %i0],	%g1
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x89,	%g4
	ld	[%l7 + 0x54],	%f22
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%i2
	nop
	set	0x4C, %i1
	lduh	[%l7 + %i1],	%l5
	set	0x0A, %g6
	stba	%o4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x78, %o1
	stb	%o1,	[%l7 + %o1]
	nop
	set	0x78, %g1
	ldsh	[%l7 + %g1],	%i1
	set	0x08, %i6
	stda	%o6,	[%l7 + %i6] 0x81
	and	%l1,	%i2,	%g7
	nop
	set	0x3B, %o3
	ldub	[%l7 + %o3],	%o6
	nop
	set	0x78, %i2
	lduh	[%l7 + %i2],	%i5
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%f4
	nop
	set	0x0C, %l6
	stb	%l4,	[%l7 + %l6]
	or	%i0,	%g3,	%i7
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f12
	set	0x60, %g7
	prefetcha	[%l7 + %g7] 0x89,	 3
	fpsub32	%f2,	%f30,	%f20
	add	%o5,	%i6,	%l0
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%g6
	and	%l2,	%o0,	%g2
	wr	%o2,	%l6,	%ccr
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f24
	nop
	set	0x60, %l1
	std	%f8,	[%l7 + %l1]
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x89,	 2
	st	%f25,	[%l7 + 0x70]
	or	%g5,	%o3,	%g1
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%g4
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x1C, %l3
	sth	%i3,	[%l7 + %l3]
	ld	[%l7 + 0x24],	%f2
	nop
	set	0x6C, %i7
	ldsw	[%l7 + %i7],	%o4
	set	0x41, %l2
	stba	%o1,	[%l7 + %l2] 0x80
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%f10
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x88,	%i1
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x80,	%o7
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%l4
	nop
	set	0x58, %i3
	std	%i2,	[%l7 + %i3]
	bleu,pn	%xcc,	loop_203
	nop
	set	0x1C, %o4
	stw	%l1,	[%l7 + %o4]
	set	0x48, %o5
	stxa	%g7,	[%l7 + %o5] 0x80
loop_203:
	add	%i5,	%o6,	%l4
	nop
	set	0x08, %i0
	prefetch	[%l7 + %i0],	 0
	or	%i0,	%g3,	%i7
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x88,	%l3
	nop
	set	0x2A, %l0
	ldsh	[%l7 + %l0],	%o5
	set	0x58, %o2
	sta	%f17,	[%l7 + %o2] 0x89
	nop
	set	0x62, %g6
	stb	%l0,	[%l7 + %g6]
	ld	[%l7 + 0x70],	%f29
	set	0x69, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g6
	nop
	set	0x38, %g1
	std	%f18,	[%l7 + %g1]
	nop
	set	0x10, %i6
	std	%i6,	[%l7 + %i6]
	fpadd32	%f30,	%f20,	%f22
	nop
	set	0x38, %o3
	stw	%l2,	[%l7 + %o3]
	st	%f2,	[%l7 + 0x24]
	set	0x60, %o1
	stwa	%g2,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x0C, %i4
	ldsh	[%l7 + %i4],	%o0
	set	0x20, %i2
	stxa	%l6,	[%l7 + %i2] 0x81
	nop
	set	0x6E, %g2
	ldstub	[%l7 + %g2],	%o2
	set	0x5D, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i4
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f24
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%o2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd8
	set	0x4F, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g5
	ld	[%l7 + 0x30],	%f24
	nop
	set	0x35, %o7
	ldstub	[%l7 + %o7],	%g4
	st	%f1,	[%l7 + 0x14]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f0
	nop
	set	0x76, %i5
	ldub	[%l7 + %i5],	%g1
	or	%o4,	%o1,	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%l5
	fpadd32	%f6,	%f22,	%f6
	nop
	set	0x34, %i7
	swap	[%l7 + %i7],	%o7
	nop
	set	0x64, %l2
	swap	[%l7 + %l2],	%i2
	nop
	set	0x24, %l4
	sth	%g7,	[%l7 + %l4]
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x89,	%i4
	set	0x7C, %g4
	sta	%f14,	[%l7 + %g4] 0x88
	fpsub16	%f22,	%f18,	%f14
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xeb,	%l0
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%o6
	nop
	set	0x4A, %o4
	ldub	[%l7 + %o4],	%l4
	nop
	set	0x28, %o5
	swap	[%l7 + %o5],	%g3
	nop
	set	0x1C, %i0
	lduh	[%l7 + %i0],	%i7
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%i0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf8
	membar	#Sync
	nop
	set	0x21, %o0
	ldub	[%l7 + %o0],	%o5
	nop
	set	0x2B, %g6
	stb	%l0,	[%l7 + %g6]
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x80,	 1
	set	0x1F, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l3
	set	0x68, %o3
	stxa	%l2,	[%l7 + %o3] 0x89
	nop
	set	0x42, %i6
	ldstub	[%l7 + %i6],	%i6
	set	0x28, %i4
	lda	[%l7 + %i4] 0x88,	%f6
	ld	[%l7 + 0x08],	%f9
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%l6
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x30, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	nop
	set	0x10, %g7
	prefetch	[%l7 + %g7],	 1
	bgu	%xcc,	loop_204
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%o2
	nop
	set	0x60, %g5
	lduw	[%l7 + %g5],	%i4
	nop
	set	0x70, %l1
	std	%f12,	[%l7 + %l1]
loop_204:
	bge,pn	%icc,	loop_205
	nop
	set	0x20, %g2
	ldx	[%l7 + %g2],	%o3
	nop
	set	0x44, %l3
	ldsh	[%l7 + %l3],	%g4
	nop
	set	0x6A, %o7
	ldsh	[%l7 + %o7],	%g5
loop_205:
	nop
	set	0x7E, %i7
	stba	%o4,	[%l7 + %i7] 0xea
	membar	#Sync
	st	%f29,	[%l7 + 0x34]
	set	0x78, %l2
	stda	%o0,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f0
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x88,	%i3
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%g1
	set	0x55, %i3
	stba	%l5,	[%l7 + %i3] 0x81
	add	%o7,	%i1,	%i2
	nop
	set	0x14, %g4
	stw	%i5,	[%l7 + %g4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%l1
	set	0x3D, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o6
	st	%f15,	[%l7 + 0x24]
	nop
	set	0x73, %o5
	ldsb	[%l7 + %o5],	%g3
	nop
	set	0x38, %g3
	lduw	[%l7 + %g3],	%i7
	nop
	set	0x38, %l0
	sth	%i0,	[%l7 + %l0]
	and	%l4,	%o5,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%l2
	nop
	set	0x34, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x14, %i0
	swapa	[%l7 + %i0] 0x81,	%l3
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%g2
	set	0x60, %o0
	stxa	%l6,	[%l7 + %o0] 0x81
	set	0x68, %i1
	stxa	%i6,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x78, %g1
	stha	%o0,	[%l7 + %g1] 0x89
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f12
	nop
	set	0x78, %i4
	std	%i4,	[%l7 + %i4]
	nop
	set	0x1C, %o3
	lduw	[%l7 + %o3],	%o2
	wr	%o3,	%g4,	%y
	nop
	set	0x72, %o1
	lduh	[%l7 + %o1],	%g5
	nop
	set	0x20, %i2
	swap	[%l7 + %i2],	%o1
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f14
	set	0x78, %g7
	lda	[%l7 + %g7] 0x88,	%f11
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x80,	%i3
	nop
	set	0x76, %l1
	lduh	[%l7 + %l1],	%o4
	nop
	set	0x51, %g5
	ldstub	[%l7 + %g5],	%g1
	nop
	set	0x10, %g2
	stx	%l5,	[%l7 + %g2]
	set	0x74, %o7
	swapa	[%l7 + %o7] 0x89,	%i1
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x89,	%o7
	nop
	set	0x5B, %i5
	stb	%i5,	[%l7 + %i5]
	set	0x38, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%l1
	set	0x18, %g4
	stha	%o6,	[%l7 + %g4] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%i7
	wr	%i0,	%g3,	%softint
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l0
	wr	%g6,	%l2,	%clear_softint
	nop
	set	0x28, %o4
	std	%f4,	[%l7 + %o4]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xcc
	or	%l3,	%g2,	%l6
	set	0x50, %g3
	sta	%f27,	[%l7 + %g3] 0x89
	nop
	set	0x1A, %l0
	stb	%i6,	[%l7 + %l0]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	nop
	set	0x20, %o2
	stx	%o0,	[%l7 + %o2]
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%i4
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x88,	%o2
	and	%l4,	%g4,	%g5
	add	%o1,	%o3,	%i3
	set	0x1C, %i1
	sta	%f6,	[%l7 + %i1] 0x89
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%g0
	or	%l5,	%i1,	%o4
	nop
	set	0x6D, %o0
	stb	%i5,	[%l7 + %o0]
	fpadd32s	%f18,	%f12,	%f23
	nop
	set	0x60, %i6
	std	%g6,	[%l7 + %i6]
	nop
	set	0x3A, %i4
	ldsh	[%l7 + %i4],	%l1
	nop
	set	0x54, %o3
	lduh	[%l7 + %o3],	%o7
	nop
	set	0x6C, %o1
	stw	%o6,	[%l7 + %o1]
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 3
	bg	%xcc,	loop_206
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%i2
	st	%f27,	[%l7 + 0x44]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%g3
loop_206:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o5
	nop
	set	0x40, %l5
	sth	%g6,	[%l7 + %l5]
	set	0x4E, %l1
	stha	%l2,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x28, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%l3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g2
	set	0x18, %g5
	stxa	%i6,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x17, %o7
	ldsb	[%l7 + %o7],	%o0
	fpadd16s	%f7,	%f7,	%f12
	nop
	set	0x6F, %i7
	ldub	[%l7 + %i7],	%i4
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	set	0x27, %g2
	stba	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	or	%g5,	%o1,	%o3
	nop
	set	0x3C, %i5
	lduw	[%l7 + %i5],	%o2
	nop
	set	0x68, %l3
	lduw	[%l7 + %l3],	%g1
	nop
	set	0x25, %o6
	ldstub	[%l7 + %o6],	%i3
	nop
	set	0x1C, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x70, %o4
	lduh	[%l7 + %o4],	%l5
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xe3,	%o4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1303
!	Type a   	: 21
!	Type cti   	: 31
!	Type x   	: 494
!	Type f   	: 41
!	Type i   	: 110
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
.word 0x496B51DA
.word 0x66A0DB94
.word 0x9368749F
.word 0x94264163
.word 0xB3BCC23A
.word 0xDBE83C24
.word 0xC8C5B67F
.word 0x4E193286
.word 0xBE7E2A37
.word 0xE64F7893
.word 0x65E4C11C
.word 0xF9D6FB2F
.word 0xCFF102D0
.word 0x626AA7C4
.word 0xAEAE2B24
.word 0x342B58C6
.word 0x9D00FFD8
.word 0x4A1EA76D
.word 0x434EB89E
.word 0xBDB18F6B
.word 0xD9DC9F44
.word 0x58FD32C0
.word 0xF2F8D026
.word 0x1FFD1C10
.word 0xB14A2A72
.word 0x14E7BAE9
.word 0x4F4CE671
.word 0xE8BF0748
.word 0xB81B17E9
.word 0xC2448E1E
.word 0x2A1A2393
.word 0x1BAB5539
.word 0x5FE96832
.word 0x8FA56DD9
.word 0xCF64D75C
.word 0xEFABDF66
.word 0xCDC442B4
.word 0x5D6A3F5D
.word 0x4EB16C3A
.word 0x6DF5AA2E
.word 0xCC40038D
.word 0x9782099B
.word 0xEC9199AF
.word 0xA47966E4
.word 0x5EABD27A
.word 0xDF44D454
.word 0x99528760
.word 0x14C3416C
.word 0x3C7470E1
.word 0xDE626AA0
.word 0x4ECA7E2C
.word 0x1F13E7DD
.word 0x502D5B49
.word 0xC08E8B6E
.word 0x8E648337
.word 0xDBBC9337
.word 0xCD5AC41E
.word 0x128919E2
.word 0xFE4ADA6F
.word 0x1C3AFB16
.word 0xC4BEED32
.word 0x53A3A143
.word 0xBFD8B61B
.word 0xDF75E2BC
!! thread 1 data, 64 words.
.word 0x75B98CB6
.word 0x6B57922B
.word 0x80724819
.word 0x11DD45E6
.word 0x486544DB
.word 0x991A6CA6
.word 0x36EFB5DA
.word 0xE8911EB6
.word 0x1C2EC4AA
.word 0xDA2158B5
.word 0xC88A0766
.word 0xEEF1ED43
.word 0xD4886816
.word 0x48141B37
.word 0x8838B385
.word 0x1DE14C23
.word 0x1F728E26
.word 0x978CD151
.word 0x4EDDC4C6
.word 0x2C5E45BA
.word 0xDA2A4B31
.word 0xB4293875
.word 0x3A8E543D
.word 0x174933A9
.word 0x24B97964
.word 0xF700A676
.word 0x72CC0D62
.word 0x7B71B47A
.word 0xC140D1E2
.word 0xA839324C
.word 0x67B020A8
.word 0x5EF2CDDD
.word 0x4C79FB5C
.word 0x53203E6A
.word 0x36FF3739
.word 0xFDF85229
.word 0xE49B2597
.word 0xF2B3C672
.word 0x53D71839
.word 0xE942DF20
.word 0x12049C01
.word 0x875C06EE
.word 0x68A26D59
.word 0x8B2AAC9F
.word 0x01D7F130
.word 0x3CEAAC3F
.word 0x2740D731
.word 0xFF5458CD
.word 0x166C3167
.word 0xC3F5619E
.word 0x5D77EA85
.word 0x13AA0135
.word 0x5D3498E6
.word 0xDC92E75E
.word 0xFBAF114A
.word 0x832B698D
.word 0xEBCB3BBE
.word 0x9B1FAB7D
.word 0xA6293733
.word 0xBE8075D9
.word 0x7928FB2E
.word 0x9B9DF836
.word 0x0D4CE53A
.word 0x57BCAB1A
!! thread 2 data, 64 words.
.word 0xA1ED2486
.word 0xEF103A9B
.word 0x5D087A72
.word 0xD7D433A4
.word 0x3A23AE80
.word 0xF7E9971B
.word 0x1558BFC5
.word 0x128F908C
.word 0x59E5C196
.word 0xEA363DAC
.word 0x1B4C97B1
.word 0x21A8D1E7
.word 0x9EEE0603
.word 0x1996D05A
.word 0xA2C42793
.word 0xEF8E1C87
.word 0x82150BBF
.word 0x63BB2962
.word 0x1958EDEE
.word 0x86043D9F
.word 0xDE876DA7
.word 0xB3F72F48
.word 0xAB6EDD94
.word 0x4B4AFB2A
.word 0x90A27680
.word 0x0438D000
.word 0x90BF171B
.word 0x91273560
.word 0xBC4CE4DE
.word 0x32342F17
.word 0x8EC44046
.word 0xAAD2604B
.word 0x1E72C573
.word 0x27496096
.word 0x20E9017C
.word 0x79D98E52
.word 0x3C0385A1
.word 0xF67A60C6
.word 0x58ECD242
.word 0x93C97EC7
.word 0x29169A07
.word 0xD8235AFB
.word 0xB9B426CD
.word 0xD4D5C362
.word 0x8EFE1BA8
.word 0x0F089E27
.word 0x43C027B9
.word 0x2A7C126F
.word 0xFE554337
.word 0x60A006DF
.word 0x695D7F8D
.word 0x5FF1CCA5
.word 0x1C59D6A6
.word 0x9A6E39DE
.word 0x39435068
.word 0xB7134A6E
.word 0xE82C96CC
.word 0xB3522C7A
.word 0x5D7B1BD5
.word 0x9880E8BA
.word 0xE62D1877
.word 0x2107658E
.word 0x793F1616
.word 0xD60966A5
!! thread 3 data, 64 words.
.word 0x1C7FCAC8
.word 0x826CADB7
.word 0x710804A9
.word 0x1000DEF0
.word 0x462B471F
.word 0x6F44FF4E
.word 0x7A661AAC
.word 0x33B58ECC
.word 0xB7BA637C
.word 0x16BF2F7C
.word 0xC3B1344C
.word 0xA9294D90
.word 0x0BE9606A
.word 0xF98EA02C
.word 0xACFB0308
.word 0x456DCED6
.word 0xA6475A32
.word 0xF3064368
.word 0x10B90D98
.word 0x16E2D3B2
.word 0x6FEED3E6
.word 0x87991E24
.word 0xEBDE6DFA
.word 0x7E83B891
.word 0x54699D9C
.word 0x014C71EA
.word 0xCE65C5B9
.word 0x1DBE52DE
.word 0x0E44DE83
.word 0xD282BC3D
.word 0x26A77A29
.word 0x025AEEE3
.word 0xC90DFD0C
.word 0x71102675
.word 0x88BCAD76
.word 0x37D8215A
.word 0x33FA48FE
.word 0xE64AFC36
.word 0x25EA0F33
.word 0xD01DD36E
.word 0x73816CBB
.word 0x8E77CED9
.word 0x6CD83247
.word 0x527FD1ED
.word 0x3B1601DD
.word 0x74306D76
.word 0x3922017A
.word 0xD7E1B449
.word 0x712560F1
.word 0xB3CF8016
.word 0x9446C98B
.word 0x6BC3331E
.word 0x78B290EF
.word 0xD91EED8C
.word 0x23937A4A
.word 0x54592B8F
.word 0x63A2BBA9
.word 0x080E230E
.word 0x5223C2DC
.word 0xDDEA53F3
.word 0x615ED9CA
.word 0x68529720
.word 0xBC3DD08C
.word 0x274CE722
!! thread 4 data, 64 words.
.word 0x1D167715
.word 0x06258C2F
.word 0x8DFA3930
.word 0x2580B8C4
.word 0xFFE808E5
.word 0x8FC11489
.word 0x6AD030DA
.word 0xD276C3B8
.word 0x6B5DD5F9
.word 0xCA3CF1B7
.word 0x1A82044E
.word 0xE64577AB
.word 0xAB4CDD4C
.word 0xA8EE33D9
.word 0xF9FB15FC
.word 0xF9790A99
.word 0x2848710C
.word 0xDB55F46F
.word 0xF0CCA7A2
.word 0xE262AF91
.word 0x104DC772
.word 0xBE4972CB
.word 0x1DB2A5F5
.word 0x2529B5BD
.word 0x68A4F77A
.word 0x98BBDF89
.word 0x4A7EC523
.word 0x7EA8BAF4
.word 0x23F18C92
.word 0x3A2AC115
.word 0x8A50893E
.word 0xC351E31A
.word 0x300FE69C
.word 0x9C66E4BD
.word 0xC0259590
.word 0x4DA29A1E
.word 0x6C1143DA
.word 0x5A24F0D9
.word 0x8F85C58E
.word 0x197C13A7
.word 0x743BDC00
.word 0x4431EA03
.word 0xD2C95297
.word 0xF2BD5E90
.word 0x3B8699C7
.word 0x5E203481
.word 0xD88086ED
.word 0x14C877DA
.word 0x761972E9
.word 0x2D52FF09
.word 0xA23F58B7
.word 0x7E03DD4B
.word 0x07AE4C25
.word 0xC088A2B9
.word 0x38FC951D
.word 0x8B815F4E
.word 0x8BEADD53
.word 0xBEDAC115
.word 0x03E51256
.word 0x27EC99B1
.word 0xDD6EC7D2
.word 0x51940122
.word 0x4CD97579
.word 0xA914E60F
!! thread 5 data, 64 words.
.word 0x634D969E
.word 0xE8CFD429
.word 0xB7D37753
.word 0x1471B840
.word 0x33C9B7E4
.word 0xD5430F17
.word 0x2670EBE3
.word 0xD7D22E8E
.word 0x86B6AD1A
.word 0xFF4F290E
.word 0x1C941719
.word 0x7B3FD3D0
.word 0xEAC52C7A
.word 0xC0B7323D
.word 0x5611B044
.word 0x8F3BDB84
.word 0x8E002D48
.word 0x11D8084B
.word 0x7C063D95
.word 0x42CACD61
.word 0x2D39C56F
.word 0xE90BBF5C
.word 0x3B02C045
.word 0xF8FD11E5
.word 0xD5E0393A
.word 0x5089CAAE
.word 0xDDFACE54
.word 0xC2BB1A6B
.word 0x2CA10471
.word 0x62BE2204
.word 0xCD1FB721
.word 0x61F40EEC
.word 0xE69043EF
.word 0xF9FAC859
.word 0x3795EADA
.word 0x01AAB25A
.word 0x463B8FEC
.word 0x7647DE89
.word 0xE3E408F2
.word 0xE79D53BD
.word 0xD5DAC807
.word 0xEE1C57C2
.word 0xD09E64A3
.word 0x596C88BA
.word 0x10ECC6D8
.word 0x6B8ED20A
.word 0x6E8DE026
.word 0xC5EA8B7E
.word 0xED699EAE
.word 0x5B32B6FE
.word 0xD24A54D9
.word 0xFC4E7D27
.word 0x1BC38C1A
.word 0x03412CC3
.word 0x168BAF18
.word 0x146EA620
.word 0xB214DAEF
.word 0x0BA569B4
.word 0x2515FF26
.word 0x5CEDD7A8
.word 0xC4F7A68A
.word 0xC2456B86
.word 0x64634A16
.word 0xA5432648
!! thread 6 data, 64 words.
.word 0x1569BBA4
.word 0xA49EF6B3
.word 0x0DBA5EC6
.word 0xF997C426
.word 0x89F37969
.word 0xB8CD0DBA
.word 0xB4F69041
.word 0x131F5504
.word 0x1EC2E501
.word 0xA65E00C6
.word 0x5B7F67F1
.word 0x8381CB93
.word 0x80932EF2
.word 0x2BBCED63
.word 0x1B804D09
.word 0xDF82F308
.word 0xB5ACA0E3
.word 0x38D77719
.word 0x7437224F
.word 0xC908074D
.word 0x52B6B628
.word 0x7C6DF7E7
.word 0xB2F60D64
.word 0xCCF7131F
.word 0x6B6963E7
.word 0xC000092B
.word 0x1CC44B12
.word 0x31E1B629
.word 0x14E72AA0
.word 0xD8068DFE
.word 0xDF892792
.word 0x64BB0E6D
.word 0x2DBA439E
.word 0xDCF42BD0
.word 0x87152888
.word 0xFAFEF83A
.word 0xA980640D
.word 0x9CE60A5E
.word 0x97702596
.word 0xD25CF738
.word 0xB16668B9
.word 0xE1BDCCB6
.word 0xF0A3A2D8
.word 0xB779C265
.word 0x11DA818C
.word 0x01DCD6C7
.word 0xF84A263A
.word 0xF31E93FA
.word 0x1F11D67A
.word 0xD75B524D
.word 0xF73490BB
.word 0xEAD29761
.word 0x172D4B82
.word 0x603C0FAF
.word 0x34AF99E3
.word 0xA225C018
.word 0x214F1F4A
.word 0x0686B6C7
.word 0xBB5F70BF
.word 0xD84B4076
.word 0x15343CDE
.word 0x8EF5FF9F
.word 0x43B50384
.word 0xEDD1156D
!! thread 7 data, 64 words.
.word 0xDF24CCFE
.word 0x7D256D30
.word 0xF2C58317
.word 0xE2309C58
.word 0x6907EB98
.word 0x0234B341
.word 0xB2AF18CC
.word 0xFDB9F4D4
.word 0xB23E6152
.word 0x4B745047
.word 0x2E616162
.word 0x0B62A7C1
.word 0x16485E79
.word 0xE0639008
.word 0x873FBE2E
.word 0x042569A8
.word 0x84B3E242
.word 0x2D5A1AC5
.word 0xD348CD5C
.word 0x5C6D1EFD
.word 0x9DF5A4AB
.word 0xF2462FCB
.word 0x467CEF0C
.word 0xA113F7DF
.word 0xB5FBE3F5
.word 0x0570DA39
.word 0x967D794F
.word 0x14E184DF
.word 0xC158BA44
.word 0x41D7CC07
.word 0xF3F1A3FA
.word 0xA015292D
.word 0x3384F0A6
.word 0xF8BD6CD9
.word 0xB6F7076F
.word 0xB0FAF7C1
.word 0x04CC6B8D
.word 0x5FF13C36
.word 0x31893BC6
.word 0xF58CA260
.word 0x15080D54
.word 0x1B096C65
.word 0xB2FC68C8
.word 0xE295099D
.word 0x35967ED3
.word 0xA6E1F2DA
.word 0x97D1CED0
.word 0x5327AE08
.word 0x8988E8C5
.word 0x7569E7CC
.word 0xD0411DA0
.word 0xABF4CD06
.word 0xFEBCF38B
.word 0x64A07DA2
.word 0xE403261B
.word 0x96857E67
.word 0x359D0062
.word 0xC177FE4D
.word 0x8085A476
.word 0xD2267527
.word 0xB8C99C03
.word 0xA51ED58A
.word 0xB7E0D25E
.word 0xB891ED68
.end
