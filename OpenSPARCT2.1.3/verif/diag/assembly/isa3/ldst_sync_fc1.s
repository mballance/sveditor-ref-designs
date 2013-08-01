/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc1.s
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
	set	0xC,	%g1
	set	0x8,	%g2
	set	0x6,	%g3
	set	0xA,	%g4
	set	0x1,	%g5
	set	0xB,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x0,	%i1
	set	-0x2,	%i2
	set	-0xD,	%i3
	set	-0xC,	%i4
	set	-0x6,	%i5
	set	-0xA,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x59D6673C,	%l0
	set	0x46584FED,	%l1
	set	0x323854E0,	%l2
	set	0x20076A18,	%l3
	set	0x73806D9B,	%l4
	set	0x3517CE21,	%l5
	set	0x29FF5FD5,	%l6
	!# Output registers
	set	0x1358,	%o0
	set	0x1C68,	%o1
	set	0x0A4C,	%o2
	set	-0x0777,	%o3
	set	0x1941,	%o4
	set	0x1541,	%o5
	set	-0x0713,	%o6
	set	-0x0CE7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	set	0x10, %o1
	stda	%i0,	[%l7 + %o1] 0x88
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%o1
	nop
	set	0x72, %l1
	ldub	[%l7 + %l1],	%g3
	nop
	set	0x40, %i7
	stx	%g5,	[%l7 + %i7]
	nop
	set	0x6E, %g7
	ldstub	[%l7 + %g7],	%i7
	st	%f2,	[%l7 + 0x78]
	set	0x7F, %i5
	stba	%i1,	[%l7 + %i5] 0x88
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x7A, %g4
	sth	%i6,	[%l7 + %g4]
	st	%f24,	[%l7 + 0x24]
	add	%o3,	%l3,	%o0
	nop
	set	0x50, %o2
	std	%f0,	[%l7 + %o2]
	set	0x24, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g4
	nop
	set	0x40, %i0
	ldsh	[%l7 + %i0],	%l0
	nop
	set	0x14, %o5
	stw	%i2,	[%l7 + %o5]
	st	%f26,	[%l7 + 0x58]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f16
	nop
	set	0x0A, %l2
	stb	%i3,	[%l7 + %l2]
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%g2
	nop
	set	0x0C, %l5
	ldsh	[%l7 + %l5],	%g6
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x80,	%o2
	set	0x58, %g5
	stwa	%o6,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x28, %g6
	ldsh	[%l7 + %g6],	%o7
	set	0x57, %o7
	stba	%l6,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x61, %g1
	ldub	[%l7 + %g1],	%l5
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%g1
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x80,	%l2
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0
	fpsub16	%f12,	%f22,	%f28
	nop
	set	0x08, %i1
	stx	%fsr,	[%l7 + %i1]
	bl	%icc,	loop_1
	nop
	set	0x7C, %i2
	swap	[%l7 + %i2],	%o5
	set	0x2C, %o0
	lda	[%l7 + %o0] 0x80,	%f11
loop_1:
	nop
	set	0x20, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x70, %g2
	stda	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x34, %o1
	ldsw	[%l7 + %o1],	%l4
	nop
	set	0x7C, %o4
	stw	%l1,	[%l7 + %o4]
	nop
	set	0x0C, %o3
	lduh	[%l7 + %o3],	%i5
	nop
	set	0x48, %i7
	ldsh	[%l7 + %i7],	%g7
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%o0
	ble,a	%xcc,	loop_2
	nop
	set	0x2A, %i5
	ldstub	[%l7 + %i5],	%i0
	st	%fsr,	[%l7 + 0x58]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
loop_2:
	nop
	set	0x70, %g4
	std	%g2,	[%l7 + %g4]
	and	%g5,	%i1,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%l3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%i6
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%g4
	ld	[%l7 + 0x70],	%f27
	set	0x50, %i4
	stwa	%i2,	[%l7 + %i4] 0xe3
	membar	#Sync
	and	%i3,	%g2,	%l0
	nop
	nop
	setx	0xAD98A03B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xB41EAC84,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f8,	%f0
	fpsub32s	%f8,	%f27,	%f12
	nop
	set	0x12, %i0
	lduh	[%l7 + %i0],	%g6
	wr 	%g0, 	0x4, 	%fprs
	fpsub32	%f10,	%f22,	%f10
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%l6
	nop
	set	0x38, %l4
	lduw	[%l7 + %l4],	%l5
	nop
	set	0x76, %l2
	lduh	[%l7 + %l2],	%o2
	nop
	set	0x25, %i6
	stb	%l2,	[%l7 + %i6]
	nop
	set	0x38, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x2C, %l6
	stba	%g1,	[%l7 + %l6] 0x81
	nop
	set	0x10, %g5
	lduw	[%l7 + %g5],	%o4
	nop
	set	0x6C, %g7
	stw	%o5,	[%l7 + %g7]
	set	0x48, %g6
	stxa	%l4,	[%l7 + %g6] 0xeb
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%i4
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f30
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x38, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%o1
	nop
	set	0x38, %i1
	stw	%i5,	[%l7 + %i1]
	wr	%g3,	%g5,	%y
	nop
	set	0x58, %l0
	sth	%i1,	[%l7 + %l0]
	nop
	set	0x68, %o0
	std	%f22,	[%l7 + %o0]
	add	%i0,	%o3,	%l3
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%i7
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%i6
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x50, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xea,	%i2
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	or	%o0,	%i3,	%l0
	set	0x59, %l1
	stba	%g2,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x12, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g6
	set	0x34, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o6
	nop
	set	0x08, %g4
	std	%o6,	[%l7 + %g4]
	nop
	set	0x28, %i5
	ldstub	[%l7 + %i5],	%l6
	set	0x20, %o2
	lda	[%l7 + %o2] 0x81,	%f21
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%o2
	nop
	set	0x60, %o5
	lduh	[%l7 + %o5],	%l5
	nop
	set	0x20, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x46, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g1
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf8
	membar	#Sync
	nop
	set	0x10, %l2
	stx	%o4,	[%l7 + %l2]
	st	%f8,	[%l7 + 0x40]
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%o4
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%o1
	add	%i5,	%g7,	%g5
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%g3
	set	0x1C, %g6
	sta	%f27,	[%l7 + %g6] 0x81
	fpadd32	%f2,	%f30,	%f0
	set	0x14, %o7
	stwa	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x81,	%i0
	set	0x79, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o3
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x81,	%l3
	nop
	set	0x16, %o6
	stb	%i7,	[%l7 + %o6]
	and	%i6,	%g4,	%o0
	st	%f25,	[%l7 + 0x5C]
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%i2
	nop
	set	0x23, %o0
	ldsb	[%l7 + %o0],	%l0
	set	0x74, %i3
	stha	%i2,	[%l7 + %i3] 0x89
	and	%g2,	%o6,	%o7
	nop
	set	0x20, %i2
	swap	[%l7 + %i2],	%g6
	st	%f3,	[%l7 + 0x28]
	set	0x50, %l0
	stxa	%l6,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x38, %o4
	std	%f28,	[%l7 + %o4]
	nop
	set	0x30, %o1
	sth	%l5,	[%l7 + %o1]
	set	0x60, %i7
	stda	%g0,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x15, %l1
	stb	%o4,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	fpadd16s	%f9,	%f12,	%f20
	set	0x39, %l3
	stba	%o5,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%o2
	set	0x76, %g4
	stha	%l4,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x1F, %i5
	ldub	[%l7 + %i5],	%l1
	wr	%i4,	%o1,	%ccr
	nop
	set	0x33, %o2
	ldsb	[%l7 + %o2],	%i5
	ld	[%l7 + 0x48],	%f7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%g7
	st	%fsr,	[%l7 + 0x30]
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe3,	%g4
	nop
	set	0x38, %o5
	std	%f24,	[%l7 + %o5]
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x0E, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i0
	nop
	set	0x72, %i6
	lduh	[%l7 + %i6],	%l3
	bgu,a	%icc,	loop_3
	nop
	set	0x50, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	wr	%i7,	%o3,	%softint
loop_3:
	nop
	set	0x25, %l5
	ldub	[%l7 + %l5],	%g4
	set	0x3A, %g6
	stha	%i6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x09, %g7
	ldstub	[%l7 + %g7],	%i3
	fpadd16	%f16,	%f16,	%f20
	nop
	set	0x28, %o7
	std	%f28,	[%l7 + %o7]
	nop
	set	0x0E, %g1
	ldub	[%l7 + %g1],	%o0
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xeb,	%i2
	set	0x48, %o6
	stda	%l0,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x38, %g3
	stx	%g2,	[%l7 + %g3]
	nop
	set	0x37, %o0
	ldstub	[%l7 + %o0],	%o6
	nop
	set	0x58, %i1
	stx	%o7,	[%l7 + %i1]
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%g6
	st	%fsr,	[%l7 + 0x60]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l6
	nop
	set	0x30, %i2
	stw	%g1,	[%l7 + %i2]
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f2
	nop
	set	0x2A, %o4
	ldub	[%l7 + %o4],	%o5
	nop
	set	0x26, %o1
	stb	%o2,	[%l7 + %o1]
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x42, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l4
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x68, %o3
	std	%i4,	[%l7 + %o3]
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x88,	%o4
	and	%i5,	%l2,	%g7
	nop
	set	0x3E, %i5
	ldsh	[%l7 + %i5],	%o1
	nop
	set	0x2E, %g4
	ldub	[%l7 + %g4],	%i1
	and	%g5,	%g3,	%l3
	and	%i0,	%o3,	%g4
	fpadd32s	%f15,	%f5,	%f22
	add	%i7,	%i3,	%i6
	add	%o0,	%i2,	%g2
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%l0
	nop
	set	0x32, %i0
	ldsh	[%l7 + %i0],	%o6
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xe2,	%g6
	nop
	set	0x68, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%o6
	and	%l5,	%l6,	%o5
	nop
	set	0x68, %l2
	std	%o2,	[%l7 + %l2]
	set	0x60, %l4
	ldda	[%l7 + %l4] 0xea,	%g0
	or	%l4,	%i4,	%l1
	set	0x54, %l5
	stha	%o4,	[%l7 + %l5] 0x81
	nop
	set	0x1E, %g6
	ldsb	[%l7 + %g6],	%l2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f16
	set	0x76, %o7
	stba	%i5,	[%l7 + %o7] 0x81
	nop
	set	0x50, %g1
	stw	%g7,	[%l7 + %g1]
	set	0x77, %g5
	stba	%o1,	[%l7 + %g5] 0x81
	nop
	set	0x6A, %l6
	sth	%i1,	[%l7 + %l6]
	nop
	set	0x10, %g3
	std	%f28,	[%l7 + %g3]
	or	%g5,	%l3,	%i0
	wr	%o3,	%g3,	%pic
	nop
	set	0x44, %o6
	ldsw	[%l7 + %o6],	%i7
	nop
	set	0x70, %i1
	ldsw	[%l7 + %i1],	%g4
	set	0x38, %i3
	sta	%f20,	[%l7 + %i3] 0x80
	nop
	set	0x18, %o0
	std	%i6,	[%l7 + %o0]
	or	%o0,	%i3,	%i2
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%l0
	nop
	set	0x78, %i2
	stx	%g2,	[%l7 + %i2]
	set	0x7A, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o6
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x89,	%o6
	set	0x34, %g2
	sta	%f10,	[%l7 + %g2] 0x81
	add	%g6,	%l5,	%o5
	bleu,pn	%xcc,	loop_4
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%o2
	add	%l6,	%g1,	%i4
	or	%l4,	%o4,	%l2
loop_4:
	nop
	set	0x3D, %o3
	stb	%l1,	[%l7 + %o3]
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%g7
	set	0x2C, %i7
	stha	%i5,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x24, %i5
	lda	[%l7 + %i5] 0x80,	%f14
	nop
	set	0x68, %o2
	lduw	[%l7 + %o2],	%i1
	ld	[%l7 + 0x6C],	%f12
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x80,	 1
	set	0x0A, %i4
	stba	%l3,	[%l7 + %i4] 0x80
	nop
	set	0x43, %i0
	stb	%o1,	[%l7 + %i0]
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%i0
	nop
	set	0x2C, %o5
	ldsw	[%l7 + %o5],	%o3
	nop
	set	0x39, %l2
	ldsb	[%l7 + %l2],	%g3
	set	0x5A, %l5
	stha	%i7,	[%l7 + %l5] 0x88
	set	0x22, %l4
	stha	%g4,	[%l7 + %l4] 0x81
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x88,	%i3,	%o0
	nop
	set	0x5A, %g6
	stb	%i2,	[%l7 + %g6]
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x89,	 4
	set	0x40, %g1
	stha	%g2,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x88,	%o6
	nop
	set	0x7C, %g3
	prefetch	[%l7 + %g3],	 4
	set	0x34, %o6
	swapa	[%l7 + %o6] 0x88,	%g6
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%o6
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x81,	%l4
	nop
	set	0x4C, %o0
	stb	%o5,	[%l7 + %o0]
	fpsub16	%f16,	%f14,	%f8
	nop
	set	0x41, %i3
	stb	%l6,	[%l7 + %i3]
	nop
	set	0x50, %i2
	std	%f4,	[%l7 + %i2]
	nop
	set	0x28, %l0
	stb	%g1,	[%l7 + %l0]
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x80,	%i4
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f16
	nop
	set	0x54, %g2
	prefetch	[%l7 + %g2],	 2
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x81,	%l4
	set	0x52, %l3
	stha	%o4,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x12, %l1
	stb	%l2,	[%l7 + %l1]
	nop
	set	0x40, %i7
	std	%l0,	[%l7 + %i7]
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f8
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%g7
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%i4
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	nop
	set	0x70, %i6
	stx	%o2,	[%l7 + %i6]
	nop
	set	0x60, %g4
	std	%g4,	[%l7 + %g4]
	nop
	nop
	setx	0x8E3B716464979EFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB6BF4264A9CE850E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f28,	%f0
	nop
	set	0x30, %l2
	lduw	[%l7 + %l2],	%l3
	wr	%o1,	%i0,	%sys_tick
	nop
	set	0x1C, %o5
	stb	%o3,	[%l7 + %o5]
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%g2
	set	0x30, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g4
	or	%i6,	%i3,	%o0
	add	%i2,	%i7,	%l0
	set	0x40, %g6
	stwa	%g2,	[%l7 + %g6] 0x81
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%g6
	and	%o7,	%o6,	%l5
	set	0x58, %o7
	sta	%f18,	[%l7 + %o7] 0x80
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%l6
	st	%f26,	[%l7 + 0x4C]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%i4
	st	%f16,	[%l7 + 0x28]
	nop
	set	0x17, %g5
	ldub	[%l7 + %g5],	%l4
	nop
	set	0x28, %o6
	swap	[%l7 + %o6],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%o4
	add	%l1,	%g7,	%i5
	set	0x22, %g3
	stha	%o2,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xea,	%i0
	set	0x78, %o0
	stda	%g4,	[%l7 + %o0] 0x80
	set	0x1B, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l3
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x80,	%i0
	set	0x7D, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o3
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x80
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x80,	%g3
	nop
	set	0x41, %g2
	ldstub	[%l7 + %g2],	%o1
	ld	[%l7 + 0x28],	%f4
	fpsub32s	%f29,	%f6,	%f10
	or	%g4,	%i3,	%i6
	and	%i2,	%o0,	%i7
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%l0
	nop
	set	0x30, %o3
	stx	%g2,	[%l7 + %o3]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xca
	ld	[%l7 + 0x0C],	%f13
	set	0x38, %l1
	stda	%o6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x54, %o2
	stw	%o6,	[%l7 + %o2]
	set	0x24, %i5
	stha	%l5,	[%l7 + %i5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x4C]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%o5
	set	0x0C, %i7
	swapa	[%l7 + %i7] 0x80,	%l6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x68, %i0
	ldub	[%l7 + %i0],	%l4
	st	%fsr,	[%l7 + 0x38]
	set	0x14, %i6
	lda	[%l7 + %i6] 0x88,	%f29
	nop
	set	0x10, %g4
	stx	%i4,	[%l7 + %g4]
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x81,	%l2
	set	0x40, %o5
	stxa	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x78, %l5
	stx	%g1,	[%l7 + %l5]
	nop
	set	0x78, %i4
	ldsb	[%l7 + %i4],	%l1
	nop
	set	0x1C, %g6
	lduw	[%l7 + %g6],	%g7
	set	0x08, %l4
	stda	%i4,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x20, %g7
	std	%i0,	[%l7 + %g7]
	set	0x48, %o7
	lda	[%l7 + %o7] 0x88,	%f15
	nop
	set	0x30, %g5
	lduw	[%l7 + %g5],	%o2
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x88,	%l2
	fpsub16s	%f28,	%f25,	%f23
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	set	0x43, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g5
	nop
	set	0x10, %o0
	std	%o2,	[%l7 + %o0]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%g3
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f20
	nop
	set	0x48, %i1
	std	%i2,	[%l7 + %i1]
	or	%i6,	%i2,	%o0
	nop
	set	0x18, %i3
	std	%i6,	[%l7 + %i3]
	fpadd16	%f30,	%f30,	%f12
	nop
	set	0x08, %i2
	stx	%g4,	[%l7 + %i2]
	nop
	set	0x70, %o4
	std	%f16,	[%l7 + %o4]
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	nop
	set	0x41, %o1
	stb	%o7,	[%l7 + %o1]
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%o6
	nop
	set	0x68, %l3
	ldsh	[%l7 + %l3],	%l5
	set	0x4C, %l1
	sta	%f29,	[%l7 + %l1] 0x80
	set	0x18, %o2
	swapa	[%l7 + %o2] 0x80,	%g2
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f10
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%l6
	ld	[%l7 + 0x78],	%f7
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%g6
	nop
	set	0x70, %i7
	std	%i4,	[%l7 + %i7]
	and	%l2,	%o4,	%l4
	nop
	set	0x24, %i6
	prefetch	[%l7 + %i6],	 1
	nop
	nop
	setx	0xB02338DCA3B06022,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE3D093ED225C34A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f28
	nop
	set	0x5C, %l2
	lduh	[%l7 + %l2],	%l1
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f14
	nop
	set	0x5D, %l5
	ldsb	[%l7 + %l5],	%g1
	nop
	nop
	setx	0xBEF38573,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x168F25BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f8,	%f8
	or	%i5,	%g7,	%i1
	set	0x7C, %i4
	swapa	[%l7 + %i4] 0x81,	%o2
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%i0
	nop
	set	0x38, %g6
	prefetch	[%l7 + %g6],	 4
	st	%f5,	[%l7 + 0x5C]
	set	0x40, %g7
	ldxa	[%l7 + %g7] 0x88,	%g5
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x89,	%l3
	nop
	set	0x3C, %g5
	lduw	[%l7 + %g5],	%o1
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x81,	%g3
	nop
	set	0x66, %g1
	sth	%o3,	[%l7 + %g1]
	nop
	set	0x38, %l6
	std	%f2,	[%l7 + %l6]
	nop
	set	0x6C, %o6
	swap	[%l7 + %o6],	%i6
	or	%i2,	%o0,	%i3
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f18
	bl	%xcc,	loop_5
	nop
	set	0x41, %g3
	ldub	[%l7 + %g3],	%g4
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f8
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
loop_5:
	nop
	set	0x38, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	nop
	set	0x7A, %i3
	ldsb	[%l7 + %i3],	%l0
	set	0x30, %o1
	ldxa	[%l7 + %o1] 0x81,	%o7
	nop
	set	0x41, %l0
	ldstub	[%l7 + %l0],	%l5
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f22
	set	0x10, %l1
	swapa	[%l7 + %l1] 0x80,	%g2
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%o5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x80
	set	0x3A, %o3
	stba	%l6,	[%l7 + %o3] 0x89
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc8
	nop
	set	0x70, %i7
	swap	[%l7 + %i7],	%o6
	set	0x68, %i6
	lda	[%l7 + %i6] 0x89,	%f21
	nop
	set	0x3C, %l2
	stw	%i4,	[%l7 + %l2]
	nop
	set	0x50, %o5
	std	%g6,	[%l7 + %o5]
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%g1
	bn	%xcc,	loop_6
	nop
	set	0x38, %g4
	stw	%l4,	[%l7 + %g4]
	st	%f0,	[%l7 + 0x30]
	set	0x5E, %g6
	stha	%g7,	[%l7 + %g6] 0x80
loop_6:
	nop
	set	0x5C, %g7
	swapa	[%l7 + %g7] 0x89,	%i5
	wr	%o2,	%i0,	%ccr
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%i1
	bg,pn	%icc,	loop_7
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%l3
	st	%f14,	[%l7 + 0x70]
	set	0x37, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g5
loop_7:
	or	%g3,	%o3,	%i6
	and	%o1,	%o0,	%i3
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f6
	nop
	set	0x7C, %l6
	sth	%g4,	[%l7 + %l6]
	nop
	set	0x44, %o6
	swap	[%l7 + %o6],	%i7
	nop
	set	0x34, %g1
	ldsw	[%l7 + %g1],	%i2
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x42, %o0
	stb	%l0,	[%l7 + %o0]
	nop
	set	0x20, %g3
	sth	%l5,	[%l7 + %g3]
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x89,	%g2
	set	0x13, %o4
	stba	%o7,	[%l7 + %o4] 0xeb
	membar	#Sync
	fpadd32s	%f27,	%f6,	%f12
	nop
	set	0x08, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x68, %i1
	ldsw	[%l7 + %i1],	%o5
	fpsub32	%f8,	%f14,	%f6
	wr	%o6,	%l6,	%y
	nop
	set	0x4C, %l0
	lduw	[%l7 + %l0],	%i4
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%o4
	set	0x5E, %g2
	stha	%l2,	[%l7 + %g2] 0xe2
	membar	#Sync
	st	%f29,	[%l7 + 0x58]
	nop
	set	0x68, %l1
	lduh	[%l7 + %l1],	%l1
	or	%g6,	%l4,	%g1
	set	0x24, %o2
	stwa	%g7,	[%l7 + %o2] 0x81
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f20
	set	0x70, %o3
	stwa	%i5,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x88,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%i1
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%g5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o3
	nop
	set	0x43, %l2
	ldub	[%l7 + %l2],	%i6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%o1
	nop
	set	0x78, %i5
	lduh	[%l7 + %i5],	%o0
	set	0x68, %l5
	stha	%g4,	[%l7 + %l5] 0x80
	nop
	set	0x50, %o5
	stx	%i3,	[%l7 + %o5]
	fpadd16s	%f15,	%f10,	%f26
	set	0x70, %g4
	lda	[%l7 + %g4] 0x88,	%f18
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%i7
	nop
	set	0x58, %g6
	std	%f18,	[%l7 + %g6]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f16
	nop
	set	0x4E, %l4
	ldub	[%l7 + %l4],	%l0
	st	%f9,	[%l7 + 0x54]
	st	%f13,	[%l7 + 0x7C]
	set	0x70, %i4
	stxa	%l5,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x60, %g5
	std	%f22,	[%l7 + %g5]
	add	%i2,	%g2,	%o7
	st	%f21,	[%l7 + 0x5C]
	set	0x22, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o6
	nop
	set	0x64, %l6
	ldsb	[%l7 + %l6],	%o5
	st	%fsr,	[%l7 + 0x08]
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x89,	%i4
	set	0x7C, %g1
	stha	%o4,	[%l7 + %g1] 0x81
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xea,	%l2
	set	0x39, %i2
	stba	%l6,	[%l7 + %i2] 0x81
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x88,	%g6
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f16
	bge,pn	%icc,	loop_8
	nop
	set	0x30, %i1
	stb	%l1,	[%l7 + %i1]
	nop
	set	0x20, %i3
	stx	%l4,	[%l7 + %i3]
	nop
	set	0x10, %o1
	ldsh	[%l7 + %o1],	%g7
loop_8:
	nop
	set	0x3C, %g2
	ldsb	[%l7 + %g2],	%g1
	nop
	set	0x48, %l0
	std	%i0,	[%l7 + %l0]
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%o2
	nop
	set	0x08, %o2
	std	%i4,	[%l7 + %o2]
	set	0x6C, %l3
	stwa	%g5,	[%l7 + %l3] 0x81
	nop
	set	0x4C, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x60, %i7
	swap	[%l7 + %i7],	%g3
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f16
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%o3
	ld	[%l7 + 0x64],	%f5
	nop
	set	0x13, %l5
	ldsb	[%l7 + %l5],	%i6
	set	0x21, %l2
	ldstuba	[%l7 + %l2] 0x89,	%o1
	set	0x47, %g4
	stba	%o0,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x40, %i0
	ldsw	[%l7 + %i0],	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x231, 	%sys_tick_cmpr
	and	%i7,	%l5,	%l0
	nop
	nop
	setx	0x92791152A2124280,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5B6C0867B46E9EB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f24,	%f8
	st	%fsr,	[%l7 + 0x08]
	set	0x32, %g6
	stha	%i2,	[%l7 + %g6] 0xea
	membar	#Sync
	bg,pn	%icc,	loop_9
	nop
	set	0x78, %g7
	std	%f2,	[%l7 + %g7]
	wr	%g2,	%o7,	%set_softint
	nop
	set	0x48, %l4
	std	%o4,	[%l7 + %l4]
loop_9:
	nop
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x81,	%i4
	nop
	set	0x7C, %g5
	ldsw	[%l7 + %g5],	%o4
	set	0x10, %o7
	stxa	%o6,	[%l7 + %o7] 0xe2
	membar	#Sync
	wr	%l2,	%l6,	%pic
	nop
	set	0x38, %i4
	std	%g6,	[%l7 + %i4]
	nop
	set	0x1A, %o6
	ldsh	[%l7 + %o6],	%l1
	set	0x3E, %g1
	stha	%g7,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x10, %l6
	std	%g0,	[%l7 + %l6]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf9
	membar	#Sync
	wr	%i0,	%o2,	%sys_tick
	nop
	set	0x38, %o4
	std	%l4,	[%l7 + %o4]
	nop
	set	0x68, %g3
	prefetch	[%l7 + %g3],	 1
	wr	%g5,	%g3,	%clear_softint
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x08, %o0
	stwa	%i5,	[%l7 + %o0] 0x88
	set	0x52, %o1
	stha	%o3,	[%l7 + %o1] 0x88
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x20, %l0
	swap	[%l7 + %l0],	%i6
	or	%i1,	%o1,	%l3
	nop
	set	0x55, %l1
	ldsb	[%l7 + %l1],	%o0
	nop
	set	0x2C, %o2
	prefetch	[%l7 + %o2],	 2
	add	%g4,	%i3,	%i7
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l0
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x89,	%i2
	nop
	set	0x48, %o3
	ldsb	[%l7 + %o3],	%g2
	nop
	set	0x74, %i6
	ldstub	[%l7 + %i6],	%l5
	nop
	set	0x48, %i7
	prefetch	[%l7 + %i7],	 3
	add	%o5,	%i4,	%o7
	nop
	set	0x20, %i5
	ldd	[%l7 + %i5],	%o4
	ld	[%l7 + 0x6C],	%f19
	nop
	set	0x1D, %l5
	ldub	[%l7 + %l5],	%o6
	or	%l2,	%l6,	%l1
	ld	[%l7 + 0x50],	%f15
	nop
	set	0x48, %g4
	std	%g6,	[%l7 + %g4]
	nop
	set	0x08, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x3A, %i0
	stb	%g6,	[%l7 + %i0]
	set	0x72, %g7
	stba	%g1,	[%l7 + %g7] 0x89
	nop
	set	0x52, %g6
	ldub	[%l7 + %g6],	%i0
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%l4
	nop
	set	0x50, %g5
	std	%o2,	[%l7 + %g5]
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	set	0x0C, %o7
	lda	[%l7 + %o7] 0x81,	%f26
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g5
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f16
	set	0x7C, %g1
	stwa	%i6,	[%l7 + %g1] 0x89
	set	0x08, %l6
	stda	%o0,	[%l7 + %l6] 0x81
	set	0x50, %i2
	ldda	[%l7 + %i2] 0xeb,	%i0
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf8
	membar	#Sync
	set	0x78, %g3
	stxa	%o0,	[%l7 + %g3] 0x89
	nop
	set	0x14, %i1
	prefetch	[%l7 + %i1],	 4
	st	%f9,	[%l7 + 0x34]
	nop
	set	0x12, %o0
	ldsb	[%l7 + %o0],	%l3
	bg	%xcc,	loop_10
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x2C, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%g4
loop_10:
	nop
	set	0x40, %g2
	stx	%fsr,	[%l7 + %g2]
	bgu,a,pt	%icc,	loop_11
	wr	%l0,	%i7,	%pic
	set	0x66, %l1
	stha	%g2,	[%l7 + %l1] 0xea
	membar	#Sync
loop_11:
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%i2
	set	0x20, %o2
	stda	%l4,	[%l7 + %o2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%i4
	set	0x48, %l3
	stwa	%o7,	[%l7 + %l3] 0xeb
	membar	#Sync
	fpsub16s	%f24,	%f20,	%f15
	nop
	set	0x20, %i3
	prefetch	[%l7 + %i3],	 1
	ld	[%l7 + 0x54],	%f23
	bgu,a,pt	%xcc,	loop_12
	nop
	set	0x4B, %i6
	ldsb	[%l7 + %i6],	%o6
	nop
	set	0x14, %i7
	ldsh	[%l7 + %i7],	%o4
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
loop_12:
	nop
	set	0x54, %i5
	ldsw	[%l7 + %i5],	%l6
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x24, %g4
	ldsb	[%l7 + %g4],	%l1
	nop
	nop
	setx	0x31351765,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xB39A5232,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f20,	%f28
	set	0x56, %i0
	stha	%g7,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x2C, %l2
	sta	%f14,	[%l7 + %l2] 0x81
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf8
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%g6
	nop
	set	0x7A, %l4
	sth	%i0,	[%l7 + %l4]
	set	0x74, %g5
	lda	[%l7 + %g5] 0x81,	%f26
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%l4
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%o2
	fpsub32s	%f31,	%f15,	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%g3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%i6
	set	0x12, %o6
	stba	%g5,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x18, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x34, %l6
	swap	[%l7 + %l6],	%i1
	set	0x44, %i2
	sta	%f9,	[%l7 + %i2] 0x81
	nop
	set	0x3A, %i4
	lduh	[%l7 + %i4],	%o1
	nop
	set	0x1B, %g1
	ldsb	[%l7 + %g1],	%o0
	add	%l3,	%i3,	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i7
	fpadd16s	%f2,	%f4,	%f1
	or	%i2,	%l5,	%g2
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	ld	[%l7 + 0x54],	%f8
	set	0x34, %i1
	lda	[%l7 + %i1] 0x81,	%f29
	add	%o7,	%i4,	%o6
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x88,	%o4
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	or	%l2,	%l1,	%g7
	and	%g1,	%l6,	%i0
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x89,	%l4
	nop
	set	0x70, %g2
	ldsh	[%l7 + %g2],	%o2
	fpsub16s	%f31,	%f25,	%f6
	nop
	set	0x28, %l0
	lduh	[%l7 + %l0],	%i5
	fpsub16s	%f26,	%f11,	%f23
	nop
	set	0x1E, %l1
	sth	%g3,	[%l7 + %l1]
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x81,	%o3
	or	%g6,	%i6,	%g5
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x81,	%o0
	set	0x33, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o0
	nop
	set	0x20, %i7
	sth	%l3,	[%l7 + %i7]
	nop
	set	0x10, %o3
	std	%i0,	[%l7 + %o3]
	or	%l0,	%i3,	%i7
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%g4
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc0
	nop
	set	0x38, %i5
	ldsh	[%l7 + %i5],	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%o5
	nop
	set	0x70, %i0
	swap	[%l7 + %i0],	%o7
	nop
	set	0x78, %g4
	lduh	[%l7 + %g4],	%l5
	st	%f4,	[%l7 + 0x70]
	nop
	set	0x28, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%i4
	add	%o6,	%l2,	%l1
	set	0x6A, %l4
	stha	%g7,	[%l7 + %l4] 0x89
	nop
	set	0x60, %g5
	std	%o4,	[%l7 + %g5]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xcc
	set	0x78, %o6
	stda	%i6,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x15, %o7
	stba	%i0,	[%l7 + %o7] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f0
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%l4
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x81,	%o2
	set	0x28, %g1
	stxa	%i5,	[%l7 + %g1] 0x81
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc4
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f6
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x88,	%o3
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f8
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%g6
	set	0x7A, %g2
	stha	%g1,	[%l7 + %g2] 0x89
	wr	%i6,	%o1,	%ccr
	nop
	set	0x20, %l0
	ldsh	[%l7 + %l0],	%o0
	nop
	set	0x32, %l1
	ldsb	[%l7 + %l1],	%l3
	set	0x50, %l3
	stxa	%g5,	[%l7 + %l3] 0x89
	wr	%l0,	%i3,	%softint
	nop
	set	0x4D, %i3
	ldstub	[%l7 + %i3],	%i1
	set	0x78, %i7
	stda	%i6,	[%l7 + %i7] 0xeb
	membar	#Sync
	st	%f29,	[%l7 + 0x3C]
	set	0x31, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g4
	ble,pn	%icc,	loop_13
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%i2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xeb,	%o4
loop_13:
	nop
	set	0x4E, %o3
	ldstub	[%l7 + %o3],	%o7
	nop
	set	0x37, %i0
	ldsb	[%l7 + %i0],	%g2
	nop
	set	0x24, %g4
	ldsw	[%l7 + %g4],	%i4
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x88,	%l4
	st	%f7,	[%l7 + 0x6C]
	wr	%o6,	%l1,	%set_softint
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%l2
	nop
	set	0x6F, %l2
	ldub	[%l7 + %l2],	%o4
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x89,	%l6
	st	%fsr,	[%l7 + 0x14]
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x81,	 1
	set	0x7C, %l4
	sta	%f5,	[%l7 + %l4] 0x81
	nop
	set	0x60, %o6
	std	%l4,	[%l7 + %o6]
	nop
	set	0x23, %o7
	ldub	[%l7 + %o7],	%o2
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%i4
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	set	0x18, %g1
	stxa	%o3,	[%l7 + %g1] 0x80
	nop
	set	0x0A, %i4
	sth	%g6,	[%l7 + %i4]
	set	0x6C, %i1
	stwa	%g1,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x30, %g3
	stda	%i6,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x60, %l6
	ldx	[%l7 + %l6],	%o1
	set	0x7C, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g3
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	nop
	set	0x22, %o0
	ldsh	[%l7 + %o0],	%o0
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x81,	%l0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%i3
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%g4
	set	0x38, %l1
	stxa	%i1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x50, %i6
	lduw	[%l7 + %i6],	%g4
	add	%i7,	%i2,	%o5
	set	0x43, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g2
	nop
	set	0x78, %o3
	sth	%i4,	[%l7 + %o3]
	nop
	set	0x1C, %i0
	lduh	[%l7 + %i0],	%l5
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf9
	membar	#Sync
	st	%f25,	[%l7 + 0x10]
	set	0x08, %g7
	lda	[%l7 + %g7] 0x81,	%f13
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%o6
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x7E, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g7
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x80,	 3
	nop
	set	0x70, %i5
	std	%o4,	[%l7 + %i5]
	nop
	set	0x68, %l4
	std	%i0,	[%l7 + %l4]
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%i6
	or	%l4,	%i5,	%o3
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x80,	%g6
	nop
	set	0x30, %g6
	stx	%fsr,	[%l7 + %g6]
	and	%o2,	%i6,	%o1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%l3
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	nop
	set	0x38, %i4
	stx	%o0,	[%l7 + %i4]
	set	0x18, %i2
	stxa	%l0,	[%l7 + %i2] 0x81
	nop
	set	0x36, %i1
	ldub	[%l7 + %i1],	%i3
	nop
	set	0x3C, %l6
	ldsw	[%l7 + %l6],	%g5
	nop
	set	0x0C, %g3
	swap	[%l7 + %g3],	%g1
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f28
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x89,	%i1
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f0
	add	%g4,	%i7,	%o5
	nop
	set	0x58, %g2
	ldsw	[%l7 + %g2],	%g2
	nop
	set	0x30, %l0
	std	%i4,	[%l7 + %l0]
	wr	%i2,	%o6,	%softint
	set	0x68, %l3
	stxa	%o7,	[%l7 + %l3] 0x88
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe2,	%l0
	or	%l5,	%g7,	%o4
	nop
	set	0x3A, %i3
	ldsh	[%l7 + %i3],	%i0
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x80,	%l2
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd0
	nop
	set	0x24, %o3
	lduw	[%l7 + %o3],	%l6
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x88,	%i5
	wr	%o3,	%l4,	%clear_softint
	set	0x20, %o2
	stxa	%g6,	[%l7 + %o2] 0x88
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f16
	nop
	set	0x52, %l2
	ldub	[%l7 + %l2],	%o2
	nop
	set	0x6D, %i0
	ldsb	[%l7 + %i0],	%i6
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x89,	 4
	st	%fsr,	[%l7 + 0x5C]
	set	0x48, %o5
	stxa	%l3,	[%l7 + %o5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x5E, %g5
	ldsh	[%l7 + %g5],	%g3
	nop
	set	0x7A, %l4
	ldsb	[%l7 + %l4],	%l0
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%i2
	nop
	set	0x30, %o6
	lduw	[%l7 + %o6],	%g5
	set	0x70, %o7
	stda	%g0,	[%l7 + %o7] 0xe2
	membar	#Sync
	add	%o0,	%i1,	%g4
	set	0x10, %g1
	lda	[%l7 + %g1] 0x80,	%f28
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f0
	nop
	set	0x40, %i4
	stw	%o5,	[%l7 + %i4]
	add	%g2,	%i4,	%i2
	nop
	set	0x40, %i1
	stw	%o6,	[%l7 + %i1]
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x80,	%o7
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%l1
	and	%l5,	%i7,	%g7
	set	0x10, %o1
	stba	%o4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%l2
	wr	%i0,	%i5,	%ccr
	nop
	set	0x20, %o0
	ldsb	[%l7 + %o0],	%o3
	fpadd16s	%f12,	%f6,	%f6
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%l4
	nop
	set	0x20, %g3
	std	%i6,	[%l7 + %g3]
	or	%g6,	%o2,	%o1
	set	0x6C, %l0
	lda	[%l7 + %l0] 0x80,	%f29
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x80,	%l3
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x80
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
	nop
	set	0x74, %o3
	stw	%g3,	[%l7 + %o3]
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	nop
	set	0x44, %l5
	ldsh	[%l7 + %l5],	%g5
	nop
	set	0x30, %o2
	ldsw	[%l7 + %o2],	%l0
	nop
	set	0x64, %g7
	lduw	[%l7 + %g7],	%g1
	nop
	set	0x48, %l2
	std	%f20,	[%l7 + %l2]
	nop
	set	0x3E, %i0
	lduh	[%l7 + %i0],	%i1
	set	0x30, %g4
	stxa	%g4,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x24, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o0
	nop
	set	0x58, %l4
	prefetch	[%l7 + %l4],	 2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%g2
	add	%i2,	%i4,	%o7
	nop
	set	0x10, %i5
	ldsh	[%l7 + %i5],	%o6
	set	0x64, %o6
	lda	[%l7 + %o6] 0x88,	%f23
	wr	%l1,	%l5,	%sys_tick
	nop
	set	0x74, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x18, %o5
	stx	%g7,	[%l7 + %o5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%i7
	or	%i0,	%i5,	%o3
	st	%fsr,	[%l7 + 0x54]
	ld	[%l7 + 0x18],	%f0
	nop
	set	0x15, %g1
	ldub	[%l7 + %g1],	%l2
	nop
	set	0x14, %g6
	swap	[%l7 + %g6],	%l4
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%g6
	nop
	set	0x7C, %i2
	stb	%o2,	[%l7 + %i2]
	ld	[%l7 + 0x14],	%f20
	set	0x30, %l6
	stwa	%l6,	[%l7 + %l6] 0x81
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f24
	set	0x14, %o4
	stwa	%l3,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x40, %o0
	std	%f16,	[%l7 + %o0]
	nop
	set	0x20, %g2
	stx	%i6,	[%l7 + %g2]
	wr	%o1,	%g3,	%softint
	set	0x48, %g3
	lda	[%l7 + %g3] 0x88,	%f30
	or	%i3,	%g5,	%l0
	set	0x48, %l0
	swapa	[%l7 + %l0] 0x89,	%g1
	nop
	set	0x60, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x74, %l3
	stw	%g4,	[%l7 + %l3]
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%i1
	set	0x68, %l1
	swapa	[%l7 + %l1] 0x81,	%o0
	set	0x12, %o3
	stha	%o5,	[%l7 + %o3] 0x88
	nop
	set	0x60, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x2E, %i3
	sth	%i2,	[%l7 + %i3]
	set	0x4C, %l5
	stwa	%i4,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%o7
	st	%f12,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x74]
	set	0x28, %o2
	stda	%g2,	[%l7 + %o2] 0x80
	nop
	set	0x70, %i0
	ldub	[%l7 + %i0],	%o6
	nop
	set	0x69, %l2
	ldsb	[%l7 + %l2],	%l1
	and	%l5,	%g7,	%o4
	st	%f7,	[%l7 + 0x60]
	and	%i0,	%i5,	%i7
	and	%o3,	%l4,	%g6
	set	0x3C, %g5
	stha	%o2,	[%l7 + %g5] 0x80
	ld	[%l7 + 0x70],	%f6
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%l6
	ble,a	%xcc,	loop_14
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%f20
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
loop_14:
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%l2
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%o1
	nop
	set	0x6C, %g1
	ldsb	[%l7 + %g1],	%g3
	set	0x78, %g6
	stxa	%i6,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%i3
	nop
	set	0x38, %o5
	swap	[%l7 + %o5],	%g1
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%l0
	nop
	set	0x74, %l6
	sth	%g4,	[%l7 + %l6]
	nop
	set	0x4E, %i1
	ldub	[%l7 + %i1],	%i1
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f14
	set	0x68, %o0
	swapa	[%l7 + %o0] 0x89,	%o0
	set	0x58, %g2
	stxa	%o5,	[%l7 + %g2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	set	0x1B, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i2
	set	0x20, %l0
	swapa	[%l7 + %l0] 0x81,	%o7
	set	0x3B, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g2
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%o6
	add	%i4,	%l1,	%l5
	set	0x20, %i4
	sta	%f6,	[%l7 + %i4] 0x80
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x81,	%o4
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xea,	%g6
	wr	%i5,	%i0,	%set_softint
	and	%o3,	%l4,	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%o2
	or	%l3,	%l6,	%o1
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%g2
	add	%l2,	%i6,	%g5
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%g1
	nop
	set	0x20, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x5C, %i3
	swap	[%l7 + %i3],	%l0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i1
	set	0x40, %o2
	stda	%o0,	[%l7 + %o2] 0x88
	nop
	set	0x4C, %i0
	stw	%o5,	[%l7 + %i0]
	set	0x1A, %g7
	stha	%g4,	[%l7 + %g7] 0x89
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x81,	%o7
	ble,a	%xcc,	loop_15
	nop
	set	0x38, %g5
	std	%g2,	[%l7 + %g5]
	nop
	set	0x78, %l4
	std	%f18,	[%l7 + %l4]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f0
loop_15:
	or	%i2,	%i4,	%o6
	add	%l5,	%o4,	%g7
	set	0x75, %o6
	stba	%l1,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x89,	 3
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x88,	%o3
	set	0x6C, %g1
	sta	%f23,	[%l7 + %g1] 0x81
	nop
	set	0x1E, %o5
	sth	%i5,	[%l7 + %o5]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g6
	add	%o2,	%l4,	%l3
	nop
	set	0x14, %g6
	ldstub	[%l7 + %g6],	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%l2
	nop
	set	0x47, %i2
	ldsb	[%l7 + %i2],	%i6
	set	0x1C, %i1
	stha	%g5,	[%l7 + %i1] 0x88
	set	0x18, %l6
	stxa	%o1,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x88,	%l0
	ld	[%l7 + 0x6C],	%f25
	nop
	set	0x10, %g2
	prefetch	[%l7 + %g2],	 1
	add	%i3,	%g1,	%i1
	or	%o0,	%o5,	%g4
	nop
	set	0x44, %o0
	ldsw	[%l7 + %o0],	%g2
	nop
	set	0x67, %l0
	ldstub	[%l7 + %l0],	%o7
	nop
	set	0x30, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%i4
	or	%i2,	%o6,	%o4
	nop
	set	0x68, %i4
	lduw	[%l7 + %i4],	%g7
	set	0x09, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l5
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x89,	%i0
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	set	0x21, %i7
	stba	%i5,	[%l7 + %i7] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f16
	bg,pn	%xcc,	loop_16
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%l1
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xcc
loop_16:
	nop
	set	0x40, %o3
	std	%g6,	[%l7 + %o3]
	ld	[%l7 + 0x48],	%f15
	nop
	set	0x28, %i0
	ldsb	[%l7 + %i0],	%o2
	bleu,pn	%icc,	loop_17
	nop
	set	0x6D, %l2
	ldsb	[%l7 + %l2],	%l4
	nop
	set	0x2A, %g7
	ldsh	[%l7 + %g7],	%i7
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xeb,	%i6
loop_17:
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x1C, %l4
	sta	%f1,	[%l7 + %l4] 0x88
	and	%l3,	%l2,	%g3
	nop
	set	0x28, %o7
	std	%g4,	[%l7 + %o7]
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f26
	nop
	set	0x3A, %i5
	ldstub	[%l7 + %i5],	%i6
	add	%o1,	%l0,	%g1
	set	0x70, %o5
	ldda	[%l7 + %o5] 0xeb,	%i2
	set	0x50, %g6
	stxa	%i1,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%o5
	set	0x50, %i1
	stxa	%g4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x58, %l6
	stw	%g2,	[%l7 + %l6]
	set	0x2C, %g1
	sta	%f25,	[%l7 + %g1] 0x88
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	set	0x30, %o0
	sta	%f28,	[%l7 + %o0] 0x88
	set	0x0E, %l0
	stba	%o7,	[%l7 + %l0] 0x80
	nop
	set	0x28, %o4
	std	%f20,	[%l7 + %o4]
	set	0x20, %g3
	swapa	[%l7 + %g3] 0x89,	%i4
	ld	[%l7 + 0x4C],	%f23
	fpsub16s	%f31,	%f11,	%f4
	nop
	set	0x3C, %i4
	swap	[%l7 + %i4],	%o0
	nop
	set	0x65, %l3
	ldsb	[%l7 + %l3],	%i2
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%o6
	nop
	set	0x27, %g2
	ldsb	[%l7 + %g2],	%o4
	set	0x40, %i6
	ldxa	[%l7 + %i6] 0x89,	%g7
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xeb,	%l4
	set	0x72, %l5
	stha	%i0,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x74, %o2
	lduh	[%l7 + %o2],	%o3
	nop
	set	0x70, %i3
	stx	%l1,	[%l7 + %i3]
	set	0x52, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g6
	nop
	set	0x52, %i0
	lduh	[%l7 + %i0],	%i5
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	nop
	set	0x10, %g7
	std	%o2,	[%l7 + %g7]
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%i7
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%i6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f16
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%l4
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%g3
	nop
	set	0x58, %i5
	std	%f12,	[%l7 + %i5]
	set	0x18, %o5
	swapa	[%l7 + %o5] 0x89,	%g5
	nop
	set	0x44, %g6
	ldsw	[%l7 + %g6],	%l2
	set	0x4B, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o1
	set	0x30, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l0
	nop
	set	0x34, %i1
	stb	%i6,	[%l7 + %i1]
	nop
	set	0x3C, %g1
	ldsb	[%l7 + %g1],	%g1
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f24
	set	0x50, %l6
	sta	%f9,	[%l7 + %l6] 0x81
	set	0x28, %o0
	stxa	%i3,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x81
	set	0x14, %i4
	stwa	%o5,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x32, %l3
	stb	%i1,	[%l7 + %l3]
	nop
	set	0x18, %l1
	std	%f26,	[%l7 + %l1]
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x80,	%g4
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	nop
	set	0x66, %i7
	sth	%i4,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f16
	fpsub32s	%f17,	%f14,	%f24
	set	0x40, %o2
	stxa	%o0,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%o6
	nop
	set	0x26, %i3
	sth	%o7,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x56, %o3
	sth	%o4,	[%l7 + %o3]
	set	0x08, %i0
	stda	%g6,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x08, %l2
	swapa	[%l7 + %l2] 0x89,	%i0
	set	0x34, %o4
	stwa	%o3,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x20, %g7
	stda	%l4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x81,	%g6
	nop
	set	0x49, %l4
	ldstub	[%l7 + %l4],	%i5
	nop
	set	0x36, %o7
	sth	%o2,	[%l7 + %o7]
	set	0x38, %i5
	swapa	[%l7 + %i5] 0x81,	%l1
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%i6
	set	0x6C, %g4
	swapa	[%l7 + %g4] 0x89,	%l3
	nop
	set	0x38, %g6
	lduh	[%l7 + %g6],	%l6
	set	0x50, %o6
	sta	%f29,	[%l7 + %o6] 0x80
	and	%g3,	%g5,	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%l0
	nop
	set	0x6E, %i2
	ldsh	[%l7 + %i2],	%i6
	bleu,pt	%icc,	loop_18
	nop
	set	0x21, %g1
	ldstub	[%l7 + %g1],	%g1
	set	0x32, %i1
	stba	%i3,	[%l7 + %i1] 0xea
	membar	#Sync
loop_18:
	nop
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xe2,	%l2
	wr	%o5,	%i1,	%y
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%g2
	wr	%i4,	%g4,	%sys_tick
	set	0x20, %l0
	stwa	%o0,	[%l7 + %l0] 0x81
	set	0x10, %o0
	stda	%o6,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x48, %i4
	std	%i2,	[%l7 + %i4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%o7
	set	0x10, %l3
	sta	%f18,	[%l7 + %l3] 0x81
	and	%i0,	%o3,	%g7
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x88,	%l5
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%g6
	nop
	set	0x34, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x4B, %i7
	ldub	[%l7 + %i7],	%i5
	nop
	set	0x68, %l5
	ldd	[%l7 + %l5],	%f22
	nop
	set	0x08, %i6
	std	%o2,	[%l7 + %i6]
	nop
	set	0x77, %i3
	stb	%i7,	[%l7 + %i3]
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%l3
	nop
	set	0x70, %o3
	std	%l0,	[%l7 + %o3]
	set	0x33, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l6
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%g5
	set	0x74, %o4
	sta	%f10,	[%l7 + %o4] 0x80
	set	0x4F, %g7
	stba	%g3,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	wr	%o1,	%l0,	%clear_softint
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x88,	%l4
	nop
	set	0x0B, %i5
	ldub	[%l7 + %i5],	%i6
	nop
	set	0x60, %o7
	std	%i2,	[%l7 + %o7]
	set	0x08, %o5
	stda	%l2,	[%l7 + %o5] 0x81
	set	0x60, %g4
	sta	%f5,	[%l7 + %g4] 0x81
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc8
	set	0x58, %g6
	stda	%o4,	[%l7 + %g6] 0xe3
	membar	#Sync
	st	%f0,	[%l7 + 0x50]
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x81,	%i0
	nop
	set	0x40, %o1
	stx	%fsr,	[%l7 + %o1]
	st	%f8,	[%l7 + 0x08]
	add	%g2,	%g1,	%i4
	nop
	set	0x38, %l6
	prefetch	[%l7 + %l6],	 2
	nop
	set	0x30, %i1
	lduh	[%l7 + %i1],	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%o7
	nop
	set	0x08, %o0
	stw	%i0,	[%l7 + %o0]
	nop
	set	0x28, %i4
	sth	%i2,	[%l7 + %i4]
	set	0x78, %l0
	stxa	%o3,	[%l7 + %l0] 0x80
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%g7
	bge,a,pt	%icc,	loop_19
	nop
	set	0x59, %l3
	ldstub	[%l7 + %l3],	%g6
	set	0x16, %l1
	stha	%i5,	[%l7 + %l1] 0x88
loop_19:
	nop
	set	0x64, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i7
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xda
	set	0x40, %l5
	stba	%l3,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%l0
	ld	[%l7 + 0x44],	%f31
	nop
	set	0x68, %i3
	ldsh	[%l7 + %i3],	%o2
	nop
	set	0x58, %i6
	ldstub	[%l7 + %i6],	%l6
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%g5
	nop
	nop
	setx	0xDE2A59C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x097E2C46,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f1,	%f11
	nop
	set	0x78, %l2
	ldx	[%l7 + %l2],	%o1
	set	0x44, %o2
	stwa	%g3,	[%l7 + %o2] 0x80
	nop
	set	0x5C, %i0
	stw	%l4,	[%l7 + %i0]
	nop
	set	0x7C, %g7
	sth	%l0,	[%l7 + %g7]
	ld	[%l7 + 0x50],	%f21
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f4
	ld	[%l7 + 0x40],	%f25
	set	0x5C, %o4
	stba	%i3,	[%l7 + %o4] 0x89
	nop
	set	0x54, %i5
	stb	%l2,	[%l7 + %i5]
	nop
	set	0x70, %o7
	sth	%i6,	[%l7 + %o7]
	ld	[%l7 + 0x34],	%f12
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%i1
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x58, %g5
	std	%f22,	[%l7 + %g5]
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x80,	 1
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x80,	%g1
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%o0
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xe2,	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%o6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f16
	nop
	set	0x58, %o1
	lduh	[%l7 + %o1],	%o7
	nop
	set	0x1C, %l6
	lduh	[%l7 + %l6],	%i0
	set	0x5C, %i1
	stba	%i2,	[%l7 + %i1] 0xea
	membar	#Sync
	and	%o3,	%l5,	%g7
	fpadd32	%f18,	%f24,	%f6
	nop
	set	0x54, %o0
	lduw	[%l7 + %o0],	%g6
	nop
	set	0x24, %i2
	swap	[%l7 + %i2],	%i5
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	fpsub32s	%f6,	%f30,	%f8
	set	0x58, %l0
	sta	%f20,	[%l7 + %l0] 0x88
	nop
	set	0x25, %l1
	ldstub	[%l7 + %l1],	%i7
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x88,	%o4
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf1,	%f16
	nop
	set	0x4C, %g2
	ldsw	[%l7 + %g2],	%l1
	set	0x68, %i7
	ldxa	[%l7 + %i7] 0x88,	%o2
	nop
	set	0x20, %i3
	lduw	[%l7 + %i3],	%l6
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%l3
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xeb,	%g4
	set	0x4C, %l2
	stwa	%g3,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x6E, %l5
	ldstuba	[%l7 + %l5] 0x88,	%o1
	set	0x10, %o2
	ldstuba	[%l7 + %o2] 0x81,	%l4
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%i3
	set	0x39, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l0
	set	0x40, %l4
	stba	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f16
	set	0x6C, %o7
	stwa	%l2,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x40, %g5
	sth	%i1,	[%l7 + %g5]
	and	%g2,	%o5,	%o0
	nop
	set	0x14, %g4
	sth	%g1,	[%l7 + %g4]
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x88,	%f14
	nop
	set	0x2C, %o4
	stb	%i4,	[%l7 + %o4]
	nop
	set	0x22, %g6
	stb	%g4,	[%l7 + %g6]
	and	%o7,	%o6,	%i2
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%i0
	set	0x48, %o1
	lda	[%l7 + %o1] 0x88,	%f22
	nop
	set	0x60, %g1
	swap	[%l7 + %g1],	%o3
	nop
	set	0x42, %i1
	lduh	[%l7 + %i1],	%g7
	nop
	set	0x62, %l6
	sth	%g6,	[%l7 + %l6]
	and	%l5,	%i7,	%i5
	or	%o4,	%l1,	%o2
	or	%l6,	%g5,	%g3
	nop
	set	0x19, %i2
	ldstub	[%l7 + %i2],	%o1
	nop
	set	0x3F, %i4
	ldub	[%l7 + %i4],	%l4
	nop
	set	0x32, %l0
	sth	%i3,	[%l7 + %l0]
	nop
	set	0x14, %o0
	lduh	[%l7 + %o0],	%l3
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x81,	 1
	set	0x44, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l2
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%i6
	nop
	set	0x2C, %g2
	lduh	[%l7 + %g2],	%i1
	nop
	set	0x54, %i3
	swap	[%l7 + %i3],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%g1
	nop
	set	0x20, %i7
	std	%o4,	[%l7 + %i7]
	fpsub16	%f2,	%f2,	%f28
	set	0x6C, %i6
	swapa	[%l7 + %i6] 0x81,	%g4
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x80,	%i4
	set	0x18, %l5
	stda	%o6,	[%l7 + %l5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x38, %l2
	stw	%i2,	[%l7 + %l2]
	nop
	set	0x24, %o2
	ldsw	[%l7 + %o2],	%i0
	set	0x6C, %i0
	ldstuba	[%l7 + %i0] 0x81,	%o3
	st	%f22,	[%l7 + 0x20]
	nop
	set	0x3D, %g7
	stb	%g7,	[%l7 + %g7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l5
	set	0x68, %l4
	sta	%f23,	[%l7 + %l4] 0x81
	st	%f29,	[%l7 + 0x5C]
	nop
	set	0x3E, %i5
	lduh	[%l7 + %i5],	%i7
	add	%i5,	%o4,	%g6
	nop
	set	0x3E, %o7
	ldub	[%l7 + %o7],	%o2
	set	0x70, %g5
	stxa	%l1,	[%l7 + %g5] 0x89
	nop
	set	0x78, %o5
	std	%g4,	[%l7 + %o5]
	set	0x70, %g4
	stha	%g3,	[%l7 + %g4] 0x88
	nop
	set	0x30, %g6
	stw	%o1,	[%l7 + %g6]
	ba,pt	%icc,	loop_20
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f20
	nop
	set	0x7A, %o1
	stb	%l4,	[%l7 + %o1]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd2
loop_20:
	nop
	set	0x76, %i1
	stb	%l6,	[%l7 + %i1]
	nop
	set	0x70, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x60, %i2
	ldsh	[%l7 + %i2],	%i3
	set	0x38, %l6
	stxa	%l0,	[%l7 + %l6] 0xe3
	membar	#Sync
	fpadd32	%f12,	%f30,	%f28
	ld	[%l7 + 0x6C],	%f25
	nop
	set	0x08, %i4
	ldub	[%l7 + %i4],	%l3
	nop
	set	0x18, %o0
	swap	[%l7 + %o0],	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%i6
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x2D, %l3
	stb	%o0,	[%l7 + %l3]
	set	0x38, %l0
	sta	%f13,	[%l7 + %l0] 0x81
	set	0x3C, %g3
	stwa	%g1,	[%l7 + %g3] 0x88
	nop
	set	0x14, %g2
	stw	%o5,	[%l7 + %g2]
	set	0x20, %l1
	stxa	%g4,	[%l7 + %l1] 0x80
	add	%i4,	%g2,	%o7
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x80,	%i0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%g7
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x81,	%o6
	nop
	set	0x68, %o3
	std	%f22,	[%l7 + %o3]
	nop
	set	0x24, %l5
	sth	%i2,	[%l7 + %l5]
	fpadd16	%f8,	%f20,	%f0
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%l5
	nop
	set	0x60, %o2
	lduw	[%l7 + %o2],	%i7
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%o4
	set	0x54, %l2
	swapa	[%l7 + %l2] 0x89,	%g6
	set	0x21, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i5
	st	%f20,	[%l7 + 0x08]
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%o2
	nop
	set	0x6F, %o7
	ldub	[%l7 + %o7],	%l1
	nop
	set	0x2C, %g5
	ldsh	[%l7 + %g5],	%g3
	nop
	set	0x08, %o5
	sth	%g5,	[%l7 + %o5]
	nop
	set	0x3E, %i5
	lduh	[%l7 + %i5],	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l6
	st	%fsr,	[%l7 + 0x74]
	bg	%xcc,	loop_21
	nop
	set	0x66, %g4
	ldstub	[%l7 + %g4],	%l0
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%i3
	ld	[%l7 + 0x08],	%f7
loop_21:
	nop
	set	0x2E, %o1
	lduh	[%l7 + %o1],	%l2
	nop
	set	0x70, %o4
	std	%f28,	[%l7 + %o4]
	ld	[%l7 + 0x50],	%f13
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x18, %g1
	sth	%l3,	[%l7 + %g1]
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f24
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i1
	set	0x08, %l6
	stwa	%o0,	[%l7 + %l6] 0x88
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%g1
	nop
	set	0x6E, %i4
	ldub	[%l7 + %i4],	%i6
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc8
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf0
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%o4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%g4
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x89
	nop
	set	0x4A, %g3
	lduh	[%l7 + %g3],	%o7
	nop
	set	0x3E, %i7
	lduh	[%l7 + %i7],	%i0
	nop
	set	0x4C, %i3
	ldsw	[%l7 + %i3],	%o3
	set	0x50, %o3
	stxa	%g7,	[%l7 + %o3] 0x88
	nop
	set	0x24, %i6
	ldsw	[%l7 + %i6],	%o6
	set	0x38, %o2
	stwa	%g2,	[%l7 + %o2] 0xea
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l5
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0
	nop
	set	0x08, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x48, %l2
	sth	%i7,	[%l7 + %l2]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xca
	nop
	set	0x68, %l4
	lduw	[%l7 + %l4],	%g6
	bl,a,pn	%xcc,	loop_22
	nop
	set	0x18, %g5
	ldsw	[%l7 + %g5],	%o2
	set	0x42, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l1
loop_22:
	fpadd16	%f0,	%f0,	%f14
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%g2
	nop
	set	0x62, %i5
	ldsb	[%l7 + %i5],	%g5
	nop
	set	0x10, %g6
	stw	%i5,	[%l7 + %g6]
	wr	%o1,	%l4,	%y
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%l6
	nop
	set	0x68, %g4
	swap	[%l7 + %g4],	%l0
	set	0x70, %i1
	stda	%l2,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%i2
	set	0x60, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i1
	nop
	set	0x60, %i2
	std	%f0,	[%l7 + %i2]
	fpadd32	%f22,	%f28,	%f26
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g1
	set	0x64, %o6
	stha	%o0,	[%l7 + %o6] 0x88
	fpadd16s	%f11,	%f6,	%f11
	set	0x1C, %l6
	sta	%f0,	[%l7 + %l6] 0x88
	nop
	set	0x08, %i4
	sth	%i6,	[%l7 + %i4]
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%o5
	and	%g4,	%i4,	%i0
	nop
	set	0x34, %o0
	lduw	[%l7 + %o0],	%o3
	set	0x7A, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o7
	nop
	set	0x24, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x28, %g2
	lduw	[%l7 + %g2],	%g7
	nop
	set	0x47, %g3
	ldub	[%l7 + %g3],	%o6
	set	0x78, %i7
	ldxa	[%l7 + %i7] 0x81,	%i2
	nop
	set	0x48, %o3
	lduw	[%l7 + %o3],	%g2
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%o4
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x88,	 1
	set	0x70, %i3
	stda	%g6,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x80,	%i6
	set	0x60, %l2
	stda	%l0,	[%l7 + %l2] 0x88
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%o2
	nop
	set	0x6F, %g5
	ldstub	[%l7 + %g5],	%g3
	nop
	set	0x65, %o7
	ldstub	[%l7 + %o7],	%g5
	st	%f24,	[%l7 + 0x58]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%i5
	nop
	set	0x36, %l4
	sth	%l4,	[%l7 + %l4]
	set	0x50, %o5
	stda	%l0,	[%l7 + %o5] 0x89
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l2
	set	0x6A, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i1
	fpsub16	%f6,	%f22,	%f24
	nop
	set	0x48, %o1
	lduw	[%l7 + %o1],	%l3
	nop
	set	0x64, %g6
	stw	%g1,	[%l7 + %g6]
	nop
	set	0x70, %g4
	stw	%o0,	[%l7 + %g4]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x81,	%i2
	set	0x58, %i2
	stwa	%o5,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f22
	set	0x11, %g1
	stba	%g4,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x60, %l6
	sta	%f19,	[%l7 + %l6] 0x81
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f0
	nop
	set	0x62, %i4
	stb	%i6,	[%l7 + %i4]
	nop
	set	0x7C, %o0
	ldsw	[%l7 + %o0],	%i4
	set	0x34, %l3
	stwa	%o3,	[%l7 + %l3] 0x89
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f0
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x81,	%i0
	set	0x78, %g3
	sta	%f30,	[%l7 + %g3] 0x80
	fpsub16	%f14,	%f0,	%f20
	nop
	set	0x48, %o3
	ldsw	[%l7 + %o3],	%g7
	nop
	set	0x58, %i7
	stx	%o6,	[%l7 + %i7]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%g2
	set	0x5F, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o4
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	bgu,a	%icc,	loop_23
	nop
	set	0x50, %i0
	std	%f22,	[%l7 + %i0]
	st	%f30,	[%l7 + 0x64]
	wr 	%g0, 	0x4, 	%fprs
loop_23:
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%o2
	nop
	set	0x4C, %l2
	lduw	[%l7 + %l2],	%g6
	set	0x70, %g7
	stda	%g2,	[%l7 + %g7] 0x80
	nop
	set	0x46, %g5
	ldub	[%l7 + %g5],	%g5
	set	0x38, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i5
	st	%f29,	[%l7 + 0x40]
	nop
	set	0x3A, %l5
	lduh	[%l7 + %l5],	%l4
	and	%o1,	%l6,	%l2
	st	%f25,	[%l7 + 0x74]
	nop
	set	0x7A, %l4
	sth	%l0,	[%l7 + %l4]
	nop
	nop
	setx	0xD426A4F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xCC5E84CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f18,	%f29
	set	0x53, %o5
	stba	%l3,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x44, %i5
	stb	%g1,	[%l7 + %i5]
	set	0x10, %g6
	lda	[%l7 + %g6] 0x88,	%f13
	wr 	%g0, 	0x6, 	%fprs
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x80,	%i1
	nop
	set	0x50, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x52, %o4
	ldstub	[%l7 + %o4],	%g4
	nop
	set	0x38, %i2
	ldsb	[%l7 + %i2],	%o5
	wr	%i6,	%o3,	%pic
	set	0x74, %o6
	stwa	%i4,	[%l7 + %o6] 0xe2
	membar	#Sync
	bgu	%xcc,	loop_24
	nop
	set	0x22, %g1
	lduh	[%l7 + %g1],	%g7
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x80,	%i0
loop_24:
	nop
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xea,	%i2
	set	0x4C, %o0
	stwa	%g2,	[%l7 + %o0] 0x88
	nop
	set	0x60, %l3
	ldsb	[%l7 + %l3],	%o6
	set	0x50, %i1
	stda	%o6,	[%l7 + %i1] 0x89
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%o4
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f26
	nop
	set	0x28, %o3
	std	%f16,	[%l7 + %o3]
	nop
	set	0x6B, %i7
	ldsb	[%l7 + %i7],	%l5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f0
	set	0x74, %o2
	lda	[%l7 + %o2] 0x88,	%f23
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f6
	wr	%l1,	%o2,	%sys_tick
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%g6
	nop
	set	0x28, %i3
	sth	%i7,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f0
	nop
	nop
	setx	0x29D61E8740B48847,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8FD5268E8812413A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f18,	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%i5
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%l4
	nop
	set	0x3B, %o7
	ldsb	[%l7 + %o7],	%o1
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
	set	0x48, %l5
	stxa	%g5,	[%l7 + %l5] 0x80
	nop
	set	0x68, %l4
	ldsw	[%l7 + %l4],	%l2
	set	0x14, %o5
	swapa	[%l7 + %o5] 0x81,	%l0
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd0
	set	0x20, %i5
	stda	%l2,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x70, %o1
	swap	[%l7 + %o1],	%g1
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f12
	set	0x70, %i2
	sta	%f18,	[%l7 + %i2] 0x80
	and	%l6,	%o0,	%i1
	nop
	set	0x5C, %o6
	swap	[%l7 + %o6],	%i3
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	set	0x08, %l0
	stda	%o4,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%o3
	set	0x50, %l6
	stda	%i6,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x38, %l3
	ldstub	[%l7 + %l3],	%g7
	nop
	set	0x60, %o0
	ldx	[%l7 + %o0],	%i4
	set	0x0C, %i1
	stwa	%i2,	[%l7 + %i1] 0x81
	nop
	set	0x37, %l1
	ldstub	[%l7 + %l1],	%g2
	set	0x48, %g2
	ldxa	[%l7 + %g2] 0x81,	%i0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x53, %o3
	ldstub	[%l7 + %o3],	%o6
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x88,	%o4
	nop
	set	0x34, %o2
	ldsb	[%l7 + %o2],	%l5
	nop
	set	0x0A, %i7
	ldstub	[%l7 + %i7],	%l1
	set	0x08, %g3
	stda	%o2,	[%l7 + %g3] 0x80
	add	%g6,	%i7,	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%l4
	set	0x08, %i3
	stda	%o0,	[%l7 + %i3] 0x80
	set	0x56, %i0
	stha	%g5,	[%l7 + %i0] 0x80
	nop
	set	0x6C, %g5
	stw	%g3,	[%l7 + %g5]
	or	%l0,	%l3,	%l2
	or	%l6,	%g1,	%o0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xca
	set	0x54, %g7
	stha	%i1,	[%l7 + %g7] 0x80
	nop
	set	0x78, %l5
	prefetch	[%l7 + %l5],	 0
	fpadd16s	%f28,	%f27,	%f16
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x28, %l2
	swap	[%l7 + %l2],	%g4
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x81
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%i2
	nop
	set	0x71, %i5
	ldsb	[%l7 + %i5],	%o5
	set	0x08, %l4
	stwa	%o3,	[%l7 + %l4] 0x80
	nop
	set	0x30, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%g7
	add	%i6,	%i4,	%g2
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x88,	%i0
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%i2
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x88,	%o6
	nop
	set	0x3C, %g1
	swap	[%l7 + %g1],	%o4
	nop
	set	0x64, %i4
	prefetch	[%l7 + %i4],	 2
	or	%l5,	%o2,	%l1
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x80,	 4
	nop
	set	0x38, %l3
	swap	[%l7 + %l3],	%o7
	add	%i5,	%g6,	%o1
	and	%l4,	%g3,	%l0
	or	%l3,	%g5,	%l2
	and	%g1,	%l6,	%i1
	nop
	set	0x28, %o0
	stx	%o0,	[%l7 + %o0]
	nop
	set	0x68, %i1
	stx	%i3,	[%l7 + %i1]
	set	0x34, %l1
	stwa	%g4,	[%l7 + %l1] 0x88
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%g7
	ld	[%l7 + 0x20],	%f18
	nop
	set	0x78, %g2
	prefetch	[%l7 + %g2],	 3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%i6
	nop
	set	0x25, %o3
	ldub	[%l7 + %o3],	%g2
	nop
	set	0x50, %l0
	std	%i4,	[%l7 + %l0]
	nop
	set	0x50, %o2
	prefetch	[%l7 + %o2],	 1
	set	0x28, %i7
	sta	%f24,	[%l7 + %i7] 0x81
	nop
	set	0x38, %i6
	ldsh	[%l7 + %i6],	%i0
	ld	[%l7 + 0x64],	%f20
	nop
	set	0x64, %i3
	stw	%i2,	[%l7 + %i3]
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	nop
	set	0x70, %g5
	ldsh	[%l7 + %g5],	%l5
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%o4
	nop
	set	0x10, %o7
	stw	%o2,	[%l7 + %o7]
	set	0x30, %l5
	stwa	%i7,	[%l7 + %l5] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%i5
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%l1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%o1
	set	0x20, %l2
	stxa	%l4,	[%l7 + %l2] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%l0
	set	0x50, %o5
	lda	[%l7 + %o5] 0x88,	%f9
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf8
	membar	#Sync
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%g5
	set	0x28, %l4
	swapa	[%l7 + %l4] 0x89,	%l3
	nop
	set	0x38, %o1
	std	%f20,	[%l7 + %o1]
	ld	[%l7 + 0x38],	%f29
	set	0x30, %g4
	stwa	%g1,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x13, %i2
	stba	%l2,	[%l7 + %i2] 0xeb
	membar	#Sync
	fpadd16	%f10,	%f2,	%f10
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x88,	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%l6
	nop
	set	0x50, %g1
	ldsw	[%l7 + %g1],	%i3
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x81,	%o4
	nop
	set	0x3A, %l6
	ldsh	[%l7 + %l6],	%g4
	set	0x68, %o6
	stxa	%g7,	[%l7 + %o6] 0x80
	nop
	set	0x6B, %l3
	ldsb	[%l7 + %l3],	%i6
	nop
	set	0x5C, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x74, %o0
	lduh	[%l7 + %o0],	%o3
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x81,	%f2
	nop
	set	0x52, %l0
	ldsh	[%l7 + %l0],	%i4
	or	%g2,	%i0,	%i2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%o6
	set	0x1D, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o4
	st	%f24,	[%l7 + 0x48]
	nop
	set	0x1F, %i6
	ldub	[%l7 + %i6],	%i7
	set	0x44, %i3
	sta	%f9,	[%l7 + %i3] 0x89
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x81
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%o2
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%o7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f16
	nop
	set	0x1B, %g3
	ldstub	[%l7 + %g3],	%l1
	nop
	set	0x40, %g7
	std	%g6,	[%l7 + %g7]
	nop
	set	0x48, %l2
	std	%f0,	[%l7 + %l2]
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x80,	%o1
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%i4
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%l4
	set	0x44, %o5
	sta	%f0,	[%l7 + %o5] 0x89
	nop
	set	0x2D, %l4
	ldsb	[%l7 + %l4],	%g3
	nop
	set	0x28, %g4
	lduw	[%l7 + %g4],	%g5
	set	0x5C, %i2
	swapa	[%l7 + %i2] 0x80,	%l0
	and	%g1,	%l2,	%l3
	fpadd32	%f22,	%f28,	%f2
	nop
	set	0x18, %o1
	sth	%i1,	[%l7 + %o1]
	nop
	set	0x50, %g1
	std	%f30,	[%l7 + %g1]
	set	0x10, %i4
	stda	%i6,	[%l7 + %i4] 0x88
	nop
	set	0x48, %l6
	swap	[%l7 + %l6],	%i3
	nop
	set	0x6D, %o4
	stb	%o5,	[%l7 + %o4]
	nop
	set	0x54, %o6
	lduh	[%l7 + %o6],	%g4
	nop
	set	0x1F, %i1
	ldsb	[%l7 + %i1],	%o0
	nop
	nop
	setx	0x2543DE64,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x515E0F44,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f14,	%f22
	set	0x18, %l3
	lda	[%l7 + %l3] 0x88,	%f14
	st	%fsr,	[%l7 + 0x74]
	set	0x30, %l1
	stxa	%g7,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x1C, %o0
	stw	%o3,	[%l7 + %o0]
	nop
	set	0x64, %o3
	swap	[%l7 + %o3],	%i4
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i6
	fpadd32s	%f11,	%f14,	%f19
	or	%i2,	%l5,	%o6
	nop
	set	0x70, %g2
	std	%f20,	[%l7 + %g2]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x81
	nop
	set	0x0F, %i3
	ldub	[%l7 + %i3],	%o4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x4F, %i6
	ldsb	[%l7 + %i6],	%o2
	add	%o7,	%i7,	%g6
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x67, %g5
	ldstub	[%l7 + %g5],	%l1
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xeb,	%i4
	and	%l4,	%o1,	%g3
	nop
	set	0x36, %i7
	ldsh	[%l7 + %i7],	%l0
	nop
	set	0x7C, %g3
	ldsw	[%l7 + %g3],	%g5
	nop
	set	0x10, %g7
	std	%f10,	[%l7 + %g7]
	nop
	set	0x38, %l2
	swap	[%l7 + %l2],	%l2
	bn,pt	%icc,	loop_25
	nop
	set	0x67, %l5
	stb	%l3,	[%l7 + %l5]
	set	0x0C, %o7
	stba	%i1,	[%l7 + %o7] 0x89
loop_25:
	nop
	set	0x48, %g6
	swap	[%l7 + %g6],	%l6
	set	0x6F, %i5
	stba	%i3,	[%l7 + %i5] 0x81
	nop
	set	0x76, %o5
	ldub	[%l7 + %o5],	%o5
	be,a	%icc,	loop_26
	nop
	set	0x50, %l4
	std	%f8,	[%l7 + %l4]
	fpadd16s	%f8,	%f13,	%f12
	st	%fsr,	[%l7 + 0x5C]
loop_26:
	nop
	set	0x3C, %i2
	prefetch	[%l7 + %i2],	 2
	and	%g4,	%g1,	%g7
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x80,	%o0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd2,	%f0
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f16
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%i4
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f16
	nop
	set	0x50, %o6
	stw	%g2,	[%l7 + %o6]
	nop
	set	0x38, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x30, %o4
	std	%f6,	[%l7 + %o4]
	nop
	set	0x70, %l3
	sth	%i0,	[%l7 + %l3]
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x80,	%o3
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x88,	%i6
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	and	%o6,	%o4,	%o2
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1267
!	Type a   	: 32
!	Type cti   	: 26
!	Type x   	: 524
!	Type f   	: 47
!	Type i   	: 104
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
	set	0xC,	%g1
	set	0x4,	%g2
	set	0xC,	%g3
	set	0x1,	%g4
	set	0x1,	%g5
	set	0x8,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x2,	%i1
	set	-0xD,	%i2
	set	-0x3,	%i3
	set	-0xD,	%i4
	set	-0x2,	%i5
	set	-0xA,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x44EEDC82,	%l0
	set	0x1882471E,	%l1
	set	0x6229E9B7,	%l2
	set	0x10D1FDB7,	%l3
	set	0x21201F08,	%l4
	set	0x13BD75A7,	%l5
	set	0x2CB6FA49,	%l6
	!# Output registers
	set	-0x0688,	%o0
	set	-0x19BE,	%o1
	set	0x1A17,	%o2
	set	-0x133E,	%o3
	set	-0x16AF,	%o4
	set	0x09ED,	%o5
	set	-0x03BF,	%o6
	set	0x09F6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	set	0x1B, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i2
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x6C, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i7
	or	%g6,	%l1,	%i5
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x88,	%f30
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 0
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x66, %g5
	ldstub	[%l7 + %g5],	%l4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f16
	nop
	set	0x38, %g3
	stx	%l0,	[%l7 + %g3]
	set	0x6C, %i0
	stwa	%g5,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x08, %g7
	sth	%g3,	[%l7 + %g7]
	set	0x2C, %l5
	swapa	[%l7 + %l5] 0x88,	%l3
	set	0x28, %o7
	stda	%i0,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x30, %l2
	swapa	[%l7 + %l2] 0x81,	%l6
	nop
	nop
	setx	0x4085326BC78C32E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xD6FBBDC113BC0BD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f24,	%f20
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%l2
	nop
	set	0x29, %o5
	stb	%o5,	[%l7 + %o5]
	nop
	set	0x68, %i5
	swap	[%l7 + %i5],	%g4
	nop
	set	0x54, %i2
	lduh	[%l7 + %i2],	%g1
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x88,	%i2
	set	0x68, %g4
	stda	%g6,	[%l7 + %g4] 0x81
	nop
	set	0x58, %o1
	std	%o0,	[%l7 + %o1]
	nop
	set	0x48, %g1
	stb	%g2,	[%l7 + %g1]
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x88,	%i4
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x89,	 3
	nop
	set	0x40, %i1
	ldsw	[%l7 + %i1],	%o3
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xe2,	%i6
	nop
	set	0x1C, %l3
	ldsh	[%l7 + %l3],	%o6
	set	0x2C, %l1
	sta	%f31,	[%l7 + %l1] 0x88
	nop
	set	0x28, %o0
	std	%f12,	[%l7 + %o0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x579, 	%tick_cmpr
	ba	%icc,	loop_27
	nop
	set	0x38, %o6
	stx	%fsr,	[%l7 + %o6]
	ld	[%l7 + 0x3C],	%f12
	bgu,a	%icc,	loop_28
loop_27:
	nop
	set	0x40, %g2
	stw	%o2,	[%l7 + %g2]
	set	0x68, %o2
	stba	%i7,	[%l7 + %o2] 0x88
loop_28:
	add	%i2,	%l1,	%g6
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%i5
	bg,pt	%xcc,	loop_29
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f16
	set	0x23, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o7
loop_29:
	nop
	set	0x2C, %l0
	stb	%o1,	[%l7 + %l0]
	nop
	set	0x3C, %i7
	prefetch	[%l7 + %i7],	 4
	set	0x74, %i0
	lda	[%l7 + %i0] 0x88,	%f20
	set	0x7E, %g7
	stha	%l4,	[%l7 + %g7] 0x88
	set	0x2C, %l5
	swapa	[%l7 + %l5] 0x89,	%l0
	nop
	set	0x78, %g3
	prefetch	[%l7 + %g3],	 3
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f0
	set	0x40, %o7
	stda	%g2,	[%l7 + %o7] 0x88
	nop
	set	0x0C, %o5
	stw	%l3,	[%l7 + %o5]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd8
	set	0x48, %i5
	stda	%g4,	[%l7 + %i5] 0x81
	or	%i1,	%l6,	%l2
	set	0x31, %i2
	ldstuba	[%l7 + %i2] 0x81,	%g4
	set	0x1C, %l4
	lda	[%l7 + %l4] 0x81,	%f22
	nop
	set	0x5F, %o1
	ldstub	[%l7 + %o1],	%o5
	set	0x24, %g4
	sta	%f21,	[%l7 + %g4] 0x88
	set	0x44, %g1
	sta	%f29,	[%l7 + %g1] 0x88
	nop
	set	0x0A, %i4
	ldsb	[%l7 + %i4],	%g1
	nop
	set	0x64, %l6
	stw	%g7,	[%l7 + %l6]
	or	%i3,	%g2,	%o0
	set	0x30, %o4
	stda	%i4,	[%l7 + %o4] 0x80
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%o2
	nop
	set	0x30, %i1
	std	%i0,	[%l7 + %i1]
	bl,a,pt	%icc,	loop_30
	nop
	set	0x14, %l1
	ldsw	[%l7 + %l1],	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l5
loop_30:
	nop
	set	0x18, %o0
	sta	%f15,	[%l7 + %o0] 0x89
	set	0x44, %o6
	lda	[%l7 + %o6] 0x89,	%f15
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%o2
	set	0x48, %g2
	stwa	%i6,	[%l7 + %g2] 0x80
	nop
	set	0x10, %i6
	std	%i6,	[%l7 + %i6]
	set	0x7C, %o3
	stha	%i2,	[%l7 + %o3] 0x80
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%i5
	nop
	set	0x7C, %i3
	stw	%g6,	[%l7 + %i3]
	nop
	set	0x24, %g5
	lduw	[%l7 + %g5],	%o7
	nop
	set	0x32, %i7
	sth	%l4,	[%l7 + %i7]
	set	0x20, %l0
	stxa	%o1,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x18, %g7
	std	%l0,	[%l7 + %g7]
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x81,	%l3
	nop
	set	0x58, %i0
	prefetch	[%l7 + %i0],	 3
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x81,	%g3
	nop
	set	0x30, %o7
	ldsw	[%l7 + %o7],	%g5
	or	%i1,	%l2,	%l6
	nop
	set	0x60, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x30, %g6
	ldsw	[%l7 + %g6],	%g4
	nop
	set	0x5C, %o5
	ldstub	[%l7 + %o5],	%g1
	nop
	set	0x30, %i2
	std	%o4,	[%l7 + %i2]
	ld	[%l7 + 0x14],	%f16
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f30
	nop
	set	0x20, %i5
	stx	%g7,	[%l7 + %i5]
	nop
	set	0x12, %o1
	ldub	[%l7 + %o1],	%i3
	add	%g2,	%o0,	%i4
	fpadd16s	%f2,	%f13,	%f15
	set	0x3C, %g4
	stha	%o3,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x1C, %g1
	sta	%f21,	[%l7 + %g1] 0x81
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%o4
	wr	%o6,	%l5,	%clear_softint
	set	0x69, %l6
	stba	%i6,	[%l7 + %l6] 0x80
	nop
	set	0x76, %o4
	lduh	[%l7 + %o4],	%i7
	nop
	set	0x6C, %i4
	stw	%o2,	[%l7 + %i4]
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x81,	%l1
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x38, %o0
	ldstub	[%l7 + %o0],	%i5
	nop
	set	0x4E, %o6
	lduh	[%l7 + %o6],	%g6
	st	%fsr,	[%l7 + 0x1C]
	set	0x68, %o2
	stda	%o6,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%i2
	set	0x60, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l4
	nop
	set	0x0C, %i6
	swap	[%l7 + %i6],	%l0
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%l2
	set	0x4C, %o3
	stha	%g3,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%g5
	or	%i1,	%l2,	%l6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g1
	set	0x51, %g5
	stba	%o5,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x24, %g7
	swap	[%l7 + %g7],	%g7
	nop
	set	0x3E, %l0
	lduh	[%l7 + %l0],	%g4
	add	%i3,	%g2,	%i4
	set	0x58, %i0
	stda	%o2,	[%l7 + %i0] 0x80
	nop
	set	0x20, %g3
	sth	%i0,	[%l7 + %g3]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x80
	set	0x78, %l2
	stda	%o4,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x78, %g6
	lduw	[%l7 + %g6],	%o0
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x81,	%l5
	set	0x14, %l5
	sta	%f25,	[%l7 + %l5] 0x80
	nop
	set	0x48, %i2
	std	%o6,	[%l7 + %i2]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xeb,	%i6
	st	%f23,	[%l7 + 0x48]
	nop
	set	0x5A, %l4
	sth	%o2,	[%l7 + %l4]
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf8
	membar	#Sync
	set	0x41, %o1
	stba	%l1,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x1A, %g1
	stb	%i7,	[%l7 + %g1]
	st	%f4,	[%l7 + 0x68]
	nop
	set	0x18, %o4
	stw	%i5,	[%l7 + %o4]
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x81,	%g6
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xeb,	%o6
	nop
	set	0x69, %i1
	ldsb	[%l7 + %i1],	%l4
	and	%l0,	%i2,	%l3
	nop
	set	0x20, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%g5
	nop
	set	0x6C, %o2
	stb	%l2,	[%l7 + %o2]
	nop
	set	0x60, %l1
	stx	%i1,	[%l7 + %l1]
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x1E, %g2
	sth	%l6,	[%l7 + %g2]
	nop
	set	0x74, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%o5
	nop
	set	0x1C, %i6
	ldsw	[%l7 + %i6],	%o1
	ld	[%l7 + 0x40],	%f11
	nop
	set	0x10, %i7
	ldsb	[%l7 + %i7],	%g4
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%i3
	set	0x10, %g7
	ldxa	[%l7 + %g7] 0x80,	%g7
	set	0x60, %l0
	stda	%g2,	[%l7 + %l0] 0x80
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%i0
	set	0x4C, %i0
	sta	%f18,	[%l7 + %i0] 0x81
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f16
	wr	%o3,	%o0,	%sys_tick
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xd2
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%l4
	fpsub32s	%f19,	%f8,	%f26
	st	%f14,	[%l7 + 0x08]
	nop
	set	0x54, %g6
	ldstub	[%l7 + %g6],	%o6
	wr	%i6,	%o2,	%clear_softint
	set	0x50, %o5
	sta	%f7,	[%l7 + %o5] 0x88
	ld	[%l7 + 0x5C],	%f24
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f6
	nop
	set	0x68, %i5
	ldsb	[%l7 + %i5],	%o4
	nop
	set	0x19, %l5
	ldub	[%l7 + %l5],	%l1
	set	0x48, %l4
	swapa	[%l7 + %l4] 0x80,	%i5
	and	%i7,	%g6,	%o7
	set	0x1E, %g4
	stba	%l0,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x29, %o1
	stb	%i2,	[%l7 + %o1]
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%l4
	st	%fsr,	[%l7 + 0x0C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%l3
	set	0x54, %i4
	stha	%l2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x0D, %o4
	ldub	[%l7 + %o4],	%i1
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%l6
	nop
	set	0x78, %i1
	ldstub	[%l7 + %i1],	%g5
	or	%g1,	%o5,	%g4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%i2
	nop
	set	0x40, %o2
	stw	%o1,	[%l7 + %o2]
	set	0x1D, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%i4
	st	%fsr,	[%l7 + 0x7C]
	set	0x54, %g2
	swapa	[%l7 + %g2] 0x80,	%g2
	st	%f11,	[%l7 + 0x44]
	set	0x3E, %l3
	stha	%o3,	[%l7 + %l3] 0x81
	fpsub16s	%f3,	%f10,	%f6
	nop
	set	0x0B, %o3
	ldsb	[%l7 + %o3],	%i0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%o6
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x81,	%i6
	st	%f11,	[%l7 + 0x40]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l5
	fpadd16	%f18,	%f16,	%f10
	st	%f5,	[%l7 + 0x20]
	set	0x48, %i7
	sta	%f4,	[%l7 + %i7] 0x88
	nop
	set	0x20, %i6
	stx	%l1,	[%l7 + %i6]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%i7
	nop
	set	0x7E, %g5
	ldstub	[%l7 + %g5],	%g6
	or	%o4,	%o7,	%l0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf8,	%f0
	fpsub16	%f16,	%f28,	%f2
	nop
	set	0x54, %i0
	stb	%i2,	[%l7 + %i0]
	add	%g3,	%l4,	%l2
	st	%f22,	[%l7 + 0x6C]
	set	0x4A, %o7
	stba	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x89,	 0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f0
	set	0x25, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l6
	nop
	set	0x28, %g6
	std	%g4,	[%l7 + %g6]
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%o4
	nop
	set	0x18, %i5
	swap	[%l7 + %i5],	%g4
	nop
	set	0x2D, %l5
	ldub	[%l7 + %l5],	%g1
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x81,	%o1
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f18
	add	%i3,	%g7,	%i4
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x0E, %o1
	stb	%g2,	[%l7 + %o1]
	be,a	%icc,	loop_31
	nop
	set	0x10, %g1
	ldsw	[%l7 + %g1],	%o3
	set	0x40, %i4
	stxa	%i0,	[%l7 + %i4] 0xe3
	membar	#Sync
loop_31:
	ld	[%l7 + 0x74],	%f30
	nop
	nop
	setx	0x04260183,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xE4D8113F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f24,	%f8
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%i6
	set	0x58, %g4
	stwa	%o2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x58, %l6
	std	%f14,	[%l7 + %l6]
	nop
	set	0x27, %i1
	ldsb	[%l7 + %i1],	%l5
	set	0x68, %o0
	stxa	%o0,	[%l7 + %o0] 0x88
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	set	0x40, %o2
	stda	%i6,	[%l7 + %o2] 0x80
	nop
	set	0x35, %o6
	ldub	[%l7 + %o6],	%i5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o7
	set	0x3A, %g2
	stba	%l0,	[%l7 + %g2] 0x88
	set	0x18, %l3
	sta	%f18,	[%l7 + %l3] 0x88
	or	%o4,	%g3,	%l4
	fpadd16	%f30,	%f12,	%f14
	nop
	set	0x50, %l1
	stx	%i2,	[%l7 + %l1]
	ld	[%l7 + 0x60],	%f11
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%l3
	set	0x58, %o3
	sta	%f5,	[%l7 + %o3] 0x88
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%l2
	nop
	set	0x58, %i7
	swap	[%l7 + %i7],	%g5
	nop
	set	0x34, %i6
	lduw	[%l7 + %i6],	%o5
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x74, %g5
	stha	%g4,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x3A, %o7
	lduh	[%l7 + %o7],	%l6
	nop
	set	0x7C, %i0
	lduh	[%l7 + %i0],	%g1
	fpadd16	%f28,	%f30,	%f22
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x81
	nop
	set	0x4C, %g3
	sth	%i3,	[%l7 + %g3]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%o1
	nop
	set	0x1E, %g6
	ldsh	[%l7 + %g6],	%i4
	add	%g2,	%i0,	%o6
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x88,	%o3
	nop
	set	0x78, %i5
	sth	%i6,	[%l7 + %i5]
	fpadd32	%f28,	%f4,	%f28
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o0
	nop
	set	0x20, %l5
	prefetch	[%l7 + %l5],	 2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%l5
	and	%i7,	%i5,	%o7
	nop
	set	0x38, %i2
	ldsw	[%l7 + %i2],	%l0
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%g6
	add	%o4,	%l4,	%i2
	nop
	set	0x74, %o1
	swap	[%l7 + %o1],	%i1
	set	0x1E, %o5
	stha	%l3,	[%l7 + %o5] 0xea
	membar	#Sync
	ld	[%l7 + 0x5C],	%f14
	nop
	set	0x20, %i4
	swap	[%l7 + %i4],	%g3
	nop
	set	0x38, %g1
	ldsh	[%l7 + %g1],	%l2
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%o4
	and	%g5,	%g4,	%l6
	set	0x2F, %g4
	stba	%i3,	[%l7 + %g4] 0x88
	set	0x24, %o0
	sta	%f7,	[%l7 + %o0] 0x89
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%g1
	set	0x18, %o2
	stxa	%o1,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x56, %o6
	stha	%g7,	[%l7 + %o6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xcc
	set	0x3C, %l3
	stwa	%g2,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x44, %o3
	stwa	%i0,	[%l7 + %o3] 0x89
	nop
	set	0x64, %l1
	swap	[%l7 + %l1],	%o6
	set	0x30, %i3
	stwa	%i6,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x10, %i6
	sta	%f8,	[%l7 + %i6] 0x89
	st	%f17,	[%l7 + 0x18]
	set	0x18, %l0
	stda	%o2,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%o0,	%l1,	%o2
	set	0x50, %g5
	stha	%l5,	[%l7 + %g5] 0x81
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%i7
	or	%i5,	%l0,	%g6
	wr	%o4,	%o7,	%set_softint
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%g3
	set	0x62, %o7
	stha	%l2,	[%l7 + %o7] 0x88
	or	%o5,	%g5,	%g4
	set	0x08, %g7
	stxa	%l6,	[%l7 + %g7] 0x89
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f22
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x46, %l2
	lduh	[%l7 + %l2],	%g1
	ld	[%l7 + 0x78],	%f28
	ld	[%l7 + 0x2C],	%f19
	set	0x57, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l3
	st	%fsr,	[%l7 + 0x48]
	or	%o1,	%g7,	%i4
	nop
	set	0x7C, %i5
	lduh	[%l7 + %i5],	%i0
	nop
	set	0x34, %i2
	sth	%g2,	[%l7 + %i2]
	nop
	set	0x42, %l4
	sth	%i6,	[%l7 + %l4]
	nop
	set	0x6C, %l5
	prefetch	[%l7 + %l5],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%o3
	nop
	set	0x30, %o1
	swap	[%l7 + %o1],	%o0
	nop
	set	0x6C, %i4
	stw	%l1,	[%l7 + %i4]
	nop
	set	0x2C, %o5
	ldsh	[%l7 + %o5],	%o2
	set	0x39, %l6
	stba	%i7,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x28, %g1
	stw	%l5,	[%l7 + %g1]
	set	0x08, %o0
	stda	%i4,	[%l7 + %o0] 0x80
	wr	%g6,	%l0,	%y
	nop
	set	0x6A, %o4
	lduh	[%l7 + %o4],	%o4
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%l4
	set	0x4F, %o6
	stba	%i1,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x68, %g4
	stx	%o7,	[%l7 + %g4]
	nop
	set	0x3C, %g2
	swap	[%l7 + %g2],	%i2
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%o5
	add	%g3,	%g5,	%l6
	nop
	set	0x40, %o3
	std	%g4,	[%l7 + %o3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%g1
	set	0x7C, %l1
	stba	%o1,	[%l7 + %l1] 0x80
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf1
	membar	#Sync
	and	%g7,	%i4,	%l3
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f6
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x7D, %g5
	stba	%i0,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x0F, %i7
	stba	%g2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x1C, %i3
	stw	%o6,	[%l7 + %i3]
	nop
	set	0x76, %g7
	ldsb	[%l7 + %g7],	%o3
	set	0x18, %o7
	stda	%o0,	[%l7 + %o7] 0x88
	nop
	set	0x4C, %i0
	stw	%i6,	[%l7 + %i0]
	nop
	set	0x7C, %g3
	stw	%l1,	[%l7 + %g3]
	set	0x3F, %g6
	ldstuba	[%l7 + %g6] 0x88,	%o2
	nop
	set	0x24, %i5
	ldub	[%l7 + %i5],	%l5
	and	%i7,	%g6,	%l0
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%o4
	st	%f6,	[%l7 + 0x34]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%l4
	set	0x42, %l4
	stha	%i1,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x18, %l2
	ldsh	[%l7 + %l2],	%i2
	nop
	set	0x23, %o1
	ldub	[%l7 + %o1],	%o7
	nop
	set	0x48, %l5
	ldsh	[%l7 + %l5],	%o5
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%f26
	ld	[%l7 + 0x7C],	%f30
	set	0x62, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g3
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	nop
	set	0x2E, %l6
	sth	%g5,	[%l7 + %l6]
	nop
	set	0x40, %o4
	std	%f16,	[%l7 + %o4]
	st	%f8,	[%l7 + 0x4C]
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%l6
	and	%g4,	%l2,	%i3
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%g0
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f4
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%o1
	nop
	set	0x4C, %i1
	lduw	[%l7 + %i1],	%g7
	set	0x74, %o3
	lda	[%l7 + %o3] 0x88,	%f28
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	nop
	set	0x19, %g2
	ldsb	[%l7 + %g2],	%l3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%g2
	nop
	set	0x70, %l3
	stx	%o6,	[%l7 + %l3]
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f28
	set	0x30, %l0
	stwa	%o3,	[%l7 + %l0] 0x81
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x80,	 1
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe2,	%i0
	nop
	set	0x7C, %g5
	ldsh	[%l7 + %g5],	%l1
	nop
	set	0x30, %o7
	std	%o2,	[%l7 + %o7]
	nop
	set	0x5D, %g7
	ldub	[%l7 + %g7],	%l5
	nop
	set	0x5E, %g3
	ldstub	[%l7 + %g3],	%i7
	set	0x2A, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g6
	set	0x50, %g6
	stda	%l0,	[%l7 + %g6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x10],	%f18
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f16
	set	0x59, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o4
	set	0x50, %l2
	stwa	%i5,	[%l7 + %l2] 0x88
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x88,	 4
	nop
	set	0x08, %o1
	ldsw	[%l7 + %o1],	%i1
	or	%l4,	%i2,	%o5
	add	%g3,	%o7,	%g5
	nop
	set	0x10, %i4
	stx	%l6,	[%l7 + %i4]
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x81,	%l2
	set	0x40, %l6
	lda	[%l7 + %l6] 0x80,	%f29
	nop
	set	0x5C, %o4
	stw	%i3,	[%l7 + %o4]
	and	%g1,	%g4,	%g7
	nop
	set	0x3B, %o0
	stb	%o1,	[%l7 + %o0]
	set	0x18, %o5
	lda	[%l7 + %o5] 0x81,	%f3
	set	0x20, %o2
	stwa	%l3,	[%l7 + %o2] 0x80
	set	0x3E, %g4
	stha	%g2,	[%l7 + %g4] 0x88
	nop
	set	0x09, %o6
	ldstub	[%l7 + %o6],	%o6
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x10, %i1
	stx	%i4,	[%l7 + %i1]
	nop
	set	0x0C, %l1
	swap	[%l7 + %l1],	%o3
	and	%i0,	%o0,	%o2
	nop
	set	0x4C, %g2
	swap	[%l7 + %g2],	%l1
	nop
	set	0x54, %o3
	prefetch	[%l7 + %o3],	 1
	set	0x50, %i6
	stha	%i7,	[%l7 + %i6] 0x80
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%l5
	set	0x68, %l3
	stda	%l0,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f10
	and	%i5,	%o4,	%i6
	set	0x73, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l4
	ld	[%l7 + 0x34],	%f25
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%i2
	set	0x60, %i3
	stxa	%o5,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%o6
	nop
	set	0x10, %g5
	std	%g4,	[%l7 + %g5]
	bne,pt	%icc,	loop_32
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%i6
	set	0x30, %g3
	swapa	[%l7 + %g3] 0x89,	%l2
loop_32:
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%g2
	nop
	set	0x30, %i2
	stx	%i3,	[%l7 + %i2]
	add	%g1,	%g4,	%o1
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x88,	%g7
	nop
	set	0x08, %i5
	swap	[%l7 + %i5],	%l3
	nop
	set	0x30, %l4
	stw	%g2,	[%l7 + %l4]
	nop
	set	0x59, %l5
	stb	%o6,	[%l7 + %l5]
	wr	%i4,	%i0,	%sys_tick
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%l1
	set	0x4C, %i4
	lda	[%l7 + %i4] 0x81,	%f21
	ld	[%l7 + 0x64],	%f10
	wr	%i7,	%o2,	%y
	add	%l5,	%g6,	%l0
	set	0x18, %o1
	stha	%o4,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x60, %g1
	swapa	[%l7 + %g1] 0x80,	%i6
	nop
	set	0x7C, %l6
	sth	%l4,	[%l7 + %l6]
	nop
	set	0x56, %o0
	ldsb	[%l7 + %o0],	%i5
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 2
	and	%i1,	%o5,	%i2
	set	0x60, %o2
	stxa	%g5,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x89,	%o7
	fpsub32	%f18,	%f4,	%f28
	nop
	set	0x09, %o6
	ldsb	[%l7 + %o6],	%l2
	wr	%l6,	%g3,	%clear_softint
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g1
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x40, %g4
	stx	%o1,	[%l7 + %g4]
	nop
	set	0x78, %l1
	sth	%g7,	[%l7 + %l1]
	set	0x40, %g2
	swapa	[%l7 + %g2] 0x89,	%g4
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x89,	%l3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f2
	set	0x54, %i6
	stha	%o6,	[%l7 + %i6] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%i4
	and	%o3,	%i0,	%l1
	ld	[%l7 + 0x18],	%f17
	nop
	set	0x5A, %i7
	lduh	[%l7 + %i7],	%i7
	nop
	set	0x78, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x10, %o7
	swapa	[%l7 + %o7] 0x89,	%o2
	nop
	set	0x18, %l0
	stx	%o0,	[%l7 + %l0]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd8
	nop
	set	0x40, %g3
	swap	[%l7 + %g3],	%l5
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%g6
	set	0x61, %g7
	stba	%i6,	[%l7 + %g7] 0x89
	nop
	set	0x6C, %i0
	ldsh	[%l7 + %i0],	%l4
	nop
	set	0x5E, %i2
	ldub	[%l7 + %i2],	%i5
	nop
	set	0x08, %i5
	stw	%i1,	[%l7 + %i5]
	nop
	set	0x0B, %g6
	ldsb	[%l7 + %g6],	%o5
	nop
	set	0x4A, %l4
	ldsh	[%l7 + %l4],	%i2
	nop
	set	0x28, %l5
	std	%f12,	[%l7 + %l5]
	nop
	set	0x48, %l2
	stx	%o4,	[%l7 + %l2]
	st	%f21,	[%l7 + 0x18]
	set	0x2C, %o1
	stwa	%o7,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x89,	%l2
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%i6
	nop
	set	0x58, %o0
	lduh	[%l7 + %o0],	%g5
	set	0x34, %l6
	stha	%i3,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x42, %o2
	ldsh	[%l7 + %o2],	%g1
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xea,	%g2
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%o1
	nop
	set	0x28, %g4
	ldstub	[%l7 + %g4],	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g7
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%o6
	set	0x11, %o4
	stba	%g2,	[%l7 + %o4] 0x89
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%o3
	fpsub32s	%f18,	%f4,	%f6
	st	%f2,	[%l7 + 0x20]
	set	0x60, %g2
	stba	%i4,	[%l7 + %g2] 0xe2
	membar	#Sync
	bl,a	%xcc,	loop_33
	or	%l1,	%i0,	%o2
	nop
	set	0x7A, %l3
	ldub	[%l7 + %l3],	%i7
	nop
	set	0x74, %i1
	ldsw	[%l7 + %i1],	%o0
loop_33:
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%l0
	nop
	set	0x18, %i7
	ldsh	[%l7 + %i7],	%g6
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xe2,	%l4
	nop
	set	0x20, %l0
	sth	%l4,	[%l7 + %l0]
	nop
	set	0x10, %o7
	stx	%i5,	[%l7 + %o7]
	set	0x2B, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i6
	nop
	set	0x14, %g7
	ldsh	[%l7 + %g7],	%o5
	nop
	set	0x6E, %i0
	sth	%i2,	[%l7 + %i0]
	nop
	set	0x66, %g5
	lduh	[%l7 + %g5],	%o4
	ld	[%l7 + 0x1C],	%f8
	nop
	set	0x10, %i5
	std	%o6,	[%l7 + %i5]
	nop
	set	0x1C, %g6
	ldsb	[%l7 + %g6],	%l2
	set	0x08, %i2
	sta	%f1,	[%l7 + %i2] 0x80
	nop
	set	0x6A, %l4
	stb	%l6,	[%l7 + %l4]
	set	0x5C, %l5
	sta	%f25,	[%l7 + %l5] 0x81
	set	0x2C, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g5
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x57, %i4
	stb	%i3,	[%l7 + %i4]
	set	0x74, %g1
	swapa	[%l7 + %g1] 0x80,	%i1
	nop
	set	0x44, %l6
	ldsh	[%l7 + %l6],	%g1
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x08, %o2
	std	%f30,	[%l7 + %o2]
	set	0x70, %o5
	lda	[%l7 + %o5] 0x88,	%f11
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x81,	%g3
	add	%o1,	%l3,	%g4
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%o6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xea,	%g2
	add	%o3,	%g7,	%i4
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f28
	nop
	set	0x48, %g2
	stx	%i0,	[%l7 + %g2]
	nop
	set	0x5A, %l3
	sth	%o2,	[%l7 + %l3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f0
	wr	%i7,	%l1,	%softint
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xea,	%o0
	set	0x78, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l0
	nop
	set	0x50, %i3
	stx	%g6,	[%l7 + %i3]
	st	%f9,	[%l7 + 0x68]
	nop
	set	0x4E, %l0
	lduh	[%l7 + %l0],	%l4
	ld	[%l7 + 0x70],	%f4
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xc2
	nop
	set	0x38, %i7
	swap	[%l7 + %i7],	%i5
	set	0x5B, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l5
	set	0x1C, %i0
	stwa	%i6,	[%l7 + %i0] 0x88
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i2
	set	0x3C, %g5
	stwa	%o4,	[%l7 + %g5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x63, %g6
	ldub	[%l7 + %g6],	%l2
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l6
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%g4
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x81,	%i3
	set	0x14, %l5
	stha	%i1,	[%l7 + %l5] 0x81
	nop
	set	0x28, %l2
	std	%f20,	[%l7 + %l2]
	set	0x08, %o1
	sta	%f2,	[%l7 + %o1] 0x88
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f14
	ld	[%l7 + 0x70],	%f14
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%o7
	set	0x68, %l6
	stda	%g0,	[%l7 + %l6] 0x88
	fpadd16s	%f12,	%f3,	%f25
	set	0x78, %o2
	ldstuba	[%l7 + %o2] 0x80,	%g3
	st	%fsr,	[%l7 + 0x34]
	set	0x20, %o5
	stxa	%o1,	[%l7 + %o5] 0x81
	nop
	set	0x60, %o0
	lduw	[%l7 + %o0],	%l3
	nop
	set	0x0A, %o6
	lduh	[%l7 + %o6],	%o6
	nop
	set	0x10, %l1
	std	%f8,	[%l7 + %l1]
	set	0x20, %o4
	stda	%g2,	[%l7 + %o4] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g4
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f24
	set	0x58, %g2
	stba	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x30, %o3
	stx	%o2,	[%l7 + %o3]
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f18
	nop
	set	0x38, %i3
	stx	%g7,	[%l7 + %i3]
	nop
	set	0x60, %i6
	std	%l0,	[%l7 + %i6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%o0
	or	%l0,	%l4,	%g6
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%l5
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%i5
	set	0x78, %i7
	sta	%f8,	[%l7 + %i7] 0x81
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xe3,	%i2
	nop
	set	0x57, %i0
	stb	%o5,	[%l7 + %i0]
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%l2
	fpsub32s	%f10,	%f7,	%f5
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x11, %g6
	ldsb	[%l7 + %g6],	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%g5
	add	%i3,	%o7,	%i1
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%g1
	and	%o1,	%g3,	%l3
	or	%o6,	%o3,	%g4
	set	0x3C, %g3
	lda	[%l7 + %g3] 0x81,	%f14
	and	%i4,	%g2,	%o2
	nop
	set	0x39, %i2
	ldub	[%l7 + %i2],	%i0
	st	%fsr,	[%l7 + 0x64]
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x88,	%g7
	nop
	set	0x50, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x62, %l2
	sth	%l1,	[%l7 + %l2]
	nop
	set	0x49, %o1
	ldsb	[%l7 + %o1],	%o0
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x80
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x88,	%i7
	nop
	set	0x48, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%l4
	nop
	set	0x74, %o0
	sth	%g6,	[%l7 + %o0]
	st	%f4,	[%l7 + 0x14]
	nop
	set	0x7D, %o5
	ldub	[%l7 + %o5],	%l0
	set	0x48, %l1
	swapa	[%l7 + %l1] 0x80,	%i6
	nop
	set	0x33, %o6
	ldsb	[%l7 + %o6],	%i5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l5
	set	0x10, %g4
	stha	%o5,	[%l7 + %g4] 0x80
	nop
	set	0x44, %g2
	lduw	[%l7 + %g2],	%o4
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x89,	 0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g5
	nop
	set	0x59, %l3
	ldsb	[%l7 + %l3],	%o7
	nop
	set	0x58, %i1
	stx	%i3,	[%l7 + %i1]
	nop
	set	0x20, %o3
	ldub	[%l7 + %o3],	%g1
	nop
	set	0x7B, %i3
	ldsb	[%l7 + %i3],	%i1
	st	%f7,	[%l7 + 0x48]
	set	0x38, %i6
	sta	%f27,	[%l7 + %i6] 0x80
	nop
	set	0x28, %l0
	std	%f30,	[%l7 + %l0]
	set	0x44, %o7
	sta	%f22,	[%l7 + %o7] 0x89
	nop
	set	0x0C, %i7
	stw	%g3,	[%l7 + %i7]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%o6
	nop
	set	0x2E, %i0
	lduh	[%l7 + %i0],	%o1
	add	%g4,	%i4,	%g2
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x89,	%o2
	nop
	set	0x2C, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x5C, %g7
	stw	%i0,	[%l7 + %g7]
	and	%g7,	%o2,	%l1
	st	%f30,	[%l7 + 0x64]
	nop
	set	0x34, %g3
	ldsw	[%l7 + %g3],	%i7
	set	0x6C, %i2
	swapa	[%l7 + %i2] 0x89,	%o0
	nop
	set	0x7A, %l4
	lduh	[%l7 + %l4],	%g6
	nop
	set	0x58, %l5
	std	%l0,	[%l7 + %l5]
	nop
	set	0x40, %l2
	swap	[%l7 + %l2],	%i6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f0
	set	0x20, %i5
	ldxa	[%l7 + %i5] 0x81,	%i5
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f16
	add	%l4,	%l5,	%o5
	nop
	set	0x58, %o2
	stw	%i2,	[%l7 + %o2]
	nop
	set	0x7C, %g1
	stw	%o4,	[%l7 + %g1]
	nop
	set	0x3A, %l6
	sth	%l2,	[%l7 + %l6]
	nop
	set	0x50, %o5
	lduw	[%l7 + %o5],	%l6
	set	0x28, %l1
	ldxa	[%l7 + %l1] 0x89,	%g5
	nop
	set	0x72, %o0
	stb	%o7,	[%l7 + %o0]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd0,	%f0
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xeb,	%g0
	nop
	set	0x2D, %o4
	ldub	[%l7 + %o4],	%i1
	nop
	nop
	setx	0x2BA86450,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x54BD51D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f14,	%f19
	nop
	set	0x6C, %g4
	swap	[%l7 + %g4],	%i3
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f24
	set	0x0A, %o3
	stba	%l3,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o6
	st	%fsr,	[%l7 + 0x50]
	set	0x28, %i3
	stxa	%o1,	[%l7 + %i3] 0x88
	or	%g4,	%i4,	%g2
	ld	[%l7 + 0x1C],	%f23
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	st	%f30,	[%l7 + 0x5C]
	set	0x50, %l3
	stxa	%o3,	[%l7 + %l3] 0x89
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%g7
	nop
	set	0x70, %i7
	stx	%i0,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x4C, %i0
	swap	[%l7 + %i0],	%o2
	set	0x70, %g6
	stda	%i6,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x14, %g7
	sta	%f7,	[%l7 + %g7] 0x88
	nop
	set	0x3D, %g5
	ldstub	[%l7 + %g5],	%l1
	fpsub32s	%f16,	%f13,	%f30
	set	0x78, %g3
	sta	%f13,	[%l7 + %g3] 0x88
	set	0x48, %i2
	stwa	%o0,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x30, %l5
	std	%f6,	[%l7 + %l5]
	set	0x22, %l4
	stba	%l0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x44, %o1
	stwa	%g6,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc4
	set	0x4C, %i4
	lda	[%l7 + %i4] 0x80,	%f1
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%i6
	ld	[%l7 + 0x3C],	%f18
	set	0x28, %l2
	stxa	%i5,	[%l7 + %l2] 0x80
	set	0x70, %l6
	stda	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x78, %g1
	stwa	%o5,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x27, %o5
	stb	%i2,	[%l7 + %o5]
	wr 	%g0, 	0x6, 	%fprs
	st	%f30,	[%l7 + 0x64]
	ld	[%l7 + 0x54],	%f21
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x88,	%l6
	nop
	set	0x44, %l1
	ldsb	[%l7 + %l1],	%g5
	st	%f20,	[%l7 + 0x28]
	set	0x34, %g2
	swapa	[%l7 + %g2] 0x88,	%l4
	nop
	set	0x50, %o4
	sth	%o7,	[%l7 + %o4]
	nop
	set	0x68, %o6
	std	%f22,	[%l7 + %o6]
	set	0x0A, %i1
	stba	%i1,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x89,	 2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x0E, %g4
	stha	%g4,	[%l7 + %g4] 0x88
	bg	%xcc,	loop_34
	nop
	set	0x66, %i6
	ldsh	[%l7 + %i6],	%i4
	nop
	nop
	setx	0x1864999880DAA699,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x925AEAEFC84045EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f28,	%f8
	nop
	set	0x30, %i3
	prefetch	[%l7 + %i3],	 2
loop_34:
	nop
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	or	%o3,	%g2,	%i0
	and	%g7,	%o2,	%i7
	set	0x30, %l0
	stda	%l0,	[%l7 + %l0] 0x80
	nop
	set	0x28, %i7
	ldsw	[%l7 + %i7],	%l0
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%g6
	nop
	set	0x63, %o7
	ldub	[%l7 + %o7],	%o0
	set	0x2A, %g6
	stha	%i5,	[%l7 + %g6] 0x81
	nop
	set	0x68, %g5
	swap	[%l7 + %g5],	%i6
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%o4
	set	0x6C, %g3
	lda	[%l7 + %g3] 0x88,	%f16
	add	%l5,	%o4,	%i2
	nop
	set	0x7E, %l5
	lduh	[%l7 + %l5],	%l6
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%l2
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0
	nop
	set	0x20, %i5
	prefetch	[%l7 + %i5],	 4
	and	%o7,	%g5,	%i3
	fpadd16	%f22,	%f22,	%f14
	add	%i1,	%l3,	%g3
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%o6
	set	0x10, %l2
	sta	%f0,	[%l7 + %l2] 0x81
	set	0x08, %l6
	stxa	%i4,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x89,	%o1
	nop
	set	0x42, %g1
	lduh	[%l7 + %g1],	%g4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%i0
	nop
	set	0x14, %o5
	stb	%g7,	[%l7 + %o5]
	nop
	set	0x25, %o0
	ldsb	[%l7 + %o0],	%o3
	set	0x70, %l1
	lda	[%l7 + %l1] 0x81,	%f21
	or	%o2,	%l1,	%l0
	nop
	set	0x18, %g2
	ldx	[%l7 + %g2],	%g6
	nop
	set	0x5A, %o4
	ldub	[%l7 + %o4],	%o0
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f22
	set	0x58, %i1
	stxa	%i5,	[%l7 + %i1] 0x88
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	and	%i7,	%l5,	%o4
	nop
	set	0x3C, %i6
	ldsw	[%l7 + %i6],	%i2
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe2,	%o4
	nop
	set	0x1C, %g4
	stw	%l6,	[%l7 + %g4]
	set	0x0C, %l0
	swapa	[%l7 + %l0] 0x88,	%l4
	set	0x30, %l3
	lda	[%l7 + %l3] 0x81,	%f8
	nop
	set	0x66, %i7
	lduh	[%l7 + %i7],	%o7
	nop
	set	0x60, %i0
	std	%l2,	[%l7 + %i0]
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x18, %g5
	stwa	%g5,	[%l7 + %g5] 0x89
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	nop
	set	0x2F, %g3
	stb	%i1,	[%l7 + %g3]
	nop
	set	0x38, %l5
	std	%f12,	[%l7 + %l5]
	set	0x68, %i2
	stwa	%i3,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x38, %l4
	swap	[%l7 + %l4],	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC2B, 	%sys_tick_cmpr
	and	%i4,	%g1,	%o1
	nop
	set	0x48, %g6
	ldx	[%l7 + %g6],	%g2
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f24
	set	0x17, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i0
	or	%g4,	%g7,	%o2
	nop
	set	0x1C, %l2
	lduh	[%l7 + %l2],	%l1
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x80
	nop
	set	0x78, %o1
	ldstub	[%l7 + %o1],	%o3
	nop
	set	0x25, %g1
	ldstub	[%l7 + %g1],	%l0
	nop
	nop
	setx	0x1E832CAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x647F365C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f28,	%f8
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x81,	%g6
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x89,	%f4
	st	%f19,	[%l7 + 0x74]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x2D, %o5
	ldub	[%l7 + %o5],	%i5
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x78, %o4
	stha	%o0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x3A, %o6
	ldsh	[%l7 + %o6],	%i6
	set	0x68, %l1
	stxa	%i7,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x50, %o3
	std	%l4,	[%l7 + %o3]
	nop
	set	0x18, %i1
	std	%f12,	[%l7 + %i1]
	set	0x58, %i6
	lda	[%l7 + %i6] 0x80,	%f11
	set	0x08, %g4
	stxa	%o4,	[%l7 + %g4] 0x89
	nop
	set	0x3A, %i3
	sth	%i2,	[%l7 + %i3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%l6
	nop
	set	0x40, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x6C, %i7
	stw	%o7,	[%l7 + %i7]
	fpsub32s	%f0,	%f6,	%f27
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x81
	nop
	set	0x1C, %o7
	sth	%l4,	[%l7 + %o7]
	set	0x55, %l0
	stba	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%g5
	nop
	set	0x10, %g3
	stw	%i3,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x14, %l5
	ldstub	[%l7 + %l5],	%l3
	nop
	set	0x7A, %i2
	ldsh	[%l7 + %i2],	%g3
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f0
	bge,pn	%icc,	loop_35
	and	%i1,	%i4,	%o6
	nop
	set	0x29, %l4
	ldub	[%l7 + %l4],	%g1
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f16
loop_35:
	st	%f6,	[%l7 + 0x40]
	set	0x43, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g2
	set	0x40, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	set	0x48, %l6
	stda	%i0,	[%l7 + %l6] 0xe3
	membar	#Sync
	bne,a,pn	%icc,	loop_36
	st	%f12,	[%l7 + 0x20]
	nop
	set	0x18, %l2
	std	%g6,	[%l7 + %l2]
	set	0x6F, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o2
loop_36:
	nop
	set	0x68, %g1
	stxa	%l1,	[%l7 + %g1] 0x88
	nop
	set	0x68, %o0
	stw	%o3,	[%l7 + %o0]
	fpadd32	%f18,	%f26,	%f28
	and	%l0,	%g4,	%g6
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f30
	be,pn	%icc,	loop_37
	nop
	set	0x0E, %o4
	ldstub	[%l7 + %o4],	%i5
	and	%i6,	%o0,	%l5
	nop
	set	0x10, %o6
	std	%i6,	[%l7 + %o6]
loop_37:
	nop
	set	0x58, %l1
	stda	%i2,	[%l7 + %l1] 0xe3
	membar	#Sync
	fpadd32	%f28,	%f12,	%f0
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x88,	%o4
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x80,	%l6
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%o6
	set	0x60, %i6
	stwa	%o5,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x37, %g4
	ldsb	[%l7 + %g4],	%l4
	fpadd16s	%f23,	%f6,	%f31
	nop
	set	0x74, %l3
	stw	%g5,	[%l7 + %l3]
	set	0x48, %i3
	sta	%f13,	[%l7 + %i3] 0x80
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f28
	bn,pt	%xcc,	loop_38
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%f8
	nop
	set	0x20, %l0
	sth	%i3,	[%l7 + %l0]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g3
loop_38:
	or	%i1,	%l3,	%i4
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f22
	ld	[%l7 + 0x70],	%f17
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%g0
	ld	[%l7 + 0x34],	%f3
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%o6,	%o1,	%i0
	add	%g2,	%o2,	%g7
	set	0x38, %l5
	sta	%f10,	[%l7 + %l5] 0x81
	nop
	set	0x1C, %i2
	swap	[%l7 + %i2],	%o3
	set	0x51, %l4
	stba	%l1,	[%l7 + %l4] 0x80
	nop
	set	0x6B, %i4
	stb	%g4,	[%l7 + %i4]
	add	%g6,	%l0,	%i5
	st	%f3,	[%l7 + 0x78]
	nop
	set	0x34, %g5
	lduh	[%l7 + %g5],	%i6
	set	0x57, %o2
	stba	%l5,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x18, %l6
	stxa	%i7,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x70, %l2
	stwa	%i2,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x0C, %g6
	stha	%o0,	[%l7 + %g6] 0x88
	st	%f31,	[%l7 + 0x70]
	and	%l6,	%o4,	%o7
	fpsub16	%f30,	%f6,	%f30
	set	0x38, %g1
	sta	%f5,	[%l7 + %g1] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%g5
	fpsub16s	%f7,	%f16,	%f10
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xda,	%f16
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x81,	%l4
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	ld	[%l7 + 0x48],	%f22
	nop
	set	0x64, %o6
	lduh	[%l7 + %o6],	%l2
	nop
	set	0x58, %o4
	stx	%i3,	[%l7 + %o4]
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f4
	nop
	set	0x16, %o3
	lduh	[%l7 + %o3],	%g3
	wr	%i1,	%i4,	%set_softint
	nop
	set	0x40, %o5
	ldsb	[%l7 + %o5],	%g1
	set	0x68, %i1
	stda	%l2,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x4B, %g4
	stba	%o6,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x76, %i6
	ldsb	[%l7 + %i6],	%o1
	nop
	set	0x30, %l3
	stw	%i0,	[%l7 + %l3]
	nop
	set	0x34, %i7
	sth	%g2,	[%l7 + %i7]
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%g6
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
	set	0x24, %l0
	sta	%f22,	[%l7 + %l0] 0x88
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f16
	set	0x4C, %g7
	stha	%o3,	[%l7 + %g7] 0xe3
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%g4
	nop
	set	0x60, %l5
	std	%f16,	[%l7 + %l5]
	nop
	set	0x14, %g3
	ldsb	[%l7 + %g3],	%g6
	set	0x0C, %l4
	stha	%l0,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x62, %i4
	lduh	[%l7 + %i4],	%o2
	fpadd32	%f4,	%f4,	%f4
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x89,	%i6
	or	%l5,	%i7,	%i2
	nop
	set	0x26, %o2
	sth	%i5,	[%l7 + %o2]
	set	0x60, %l6
	sta	%f20,	[%l7 + %l6] 0x88
	or	%l6,	%o4,	%o7
	and	%o0,	%o5,	%l4
	set	0x14, %g6
	sta	%f5,	[%l7 + %g6] 0x89
	nop
	set	0x18, %l2
	std	%f2,	[%l7 + %l2]
	set	0x6C, %o1
	stha	%g5,	[%l7 + %o1] 0x81
	add	%i3,	%g3,	%l2
	set	0x64, %g1
	stwa	%i4,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%i1
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x81,	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o1
	set	0x44, %o6
	swapa	[%l7 + %o6] 0x81,	%o6
	nop
	set	0x58, %o0
	lduh	[%l7 + %o0],	%g2
	nop
	set	0x1C, %o4
	ldsb	[%l7 + %o4],	%g7
	set	0x30, %o3
	lda	[%l7 + %o3] 0x81,	%f31
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x50, %i1
	sth	%o3,	[%l7 + %i1]
	ld	[%l7 + 0x68],	%f29
	add	%l1,	%g4,	%i0
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xeb,	%g6
	nop
	set	0x2C, %i6
	ldsh	[%l7 + %i6],	%l0
	ld	[%l7 + 0x2C],	%f9
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc0
	set	0x4E, %i7
	stba	%i6,	[%l7 + %i7] 0x81
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x81,	%l5
	nop
	set	0x40, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x70, %l0
	stxa	%o2,	[%l7 + %l0] 0x80
	nop
	set	0x20, %g4
	stx	%i7,	[%l7 + %g4]
	fpadd16	%f16,	%f4,	%f20
	set	0x60, %o7
	lda	[%l7 + %o7] 0x80,	%f21
	set	0x2D, %g7
	stba	%i2,	[%l7 + %g7] 0x80
	set	0x0C, %g3
	sta	%f1,	[%l7 + %g3] 0x80
	or	%l6,	%i5,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%o5
	fpsub32	%f16,	%f0,	%f24
	set	0x1C, %l5
	stwa	%o0,	[%l7 + %l5] 0x81
	set	0x34, %l4
	swapa	[%l7 + %l4] 0x89,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g3
	wr	%i3,	%i4,	%clear_softint
	nop
	set	0x7C, %i4
	stw	%i1,	[%l7 + %i4]
	set	0x50, %i2
	stda	%l2,	[%l7 + %i2] 0x89
	set	0x78, %g5
	lda	[%l7 + %g5] 0x88,	%f24
	nop
	set	0x58, %l6
	std	%f10,	[%l7 + %l6]
	set	0x38, %g6
	stxa	%l2,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x30, %l2
	ldda	[%l7 + %l2] 0xea,	%o0
	nop
	set	0x68, %o1
	ldsh	[%l7 + %o1],	%g1
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%o6
	nop
	set	0x12, %g2
	lduh	[%l7 + %g2],	%g2
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%f30
	bne,a,pn	%xcc,	loop_39
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%o2
	add	%g7,	%l1,	%i0
	set	0x46, %i5
	stha	%g6,	[%l7 + %i5] 0x80
loop_39:
	nop
	set	0x50, %o0
	std	%l0,	[%l7 + %o0]
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f14
	nop
	set	0x50, %o5
	stb	%i6,	[%l7 + %o5]
	nop
	set	0x08, %i1
	sth	%l5,	[%l7 + %i1]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%i7
	set	0x5C, %o4
	stha	%i2,	[%l7 + %o4] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	nop
	set	0x60, %l3
	lduw	[%l7 + %l3],	%l6
	nop
	set	0x70, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x22, %i7
	sth	%i5,	[%l7 + %i7]
	nop
	set	0x24, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x62, %i0
	ldub	[%l7 + %i0],	%o7
	nop
	set	0x7D, %l0
	ldstub	[%l7 + %l0],	%o4
	st	%fsr,	[%l7 + 0x50]
	set	0x14, %g4
	swapa	[%l7 + %g4] 0x81,	%o5
	ble,pt	%icc,	loop_40
	nop
	set	0x4C, %o7
	sth	%g4,	[%l7 + %o7]
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x08, %l5
	ldxa	[%l7 + %l5] 0x89,	%g5
loop_40:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%o0
	set	0x20, %g7
	ldxa	[%l7 + %g7] 0x89,	%i3
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x30, %i2
	stw	%g3,	[%l7 + %i2]
	nop
	set	0x36, %l4
	lduh	[%l7 + %l4],	%i4
	nop
	set	0x5F, %l6
	ldsb	[%l7 + %l6],	%l3
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%l2
	add	%i1,	%o1,	%g1
	nop
	set	0x30, %g6
	stx	%o6,	[%l7 + %g6]
	set	0x40, %l2
	swapa	[%l7 + %l2] 0x88,	%g2
	set	0x2C, %g1
	swapa	[%l7 + %g1] 0x89,	%o3
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%l1
	nop
	set	0x18, %o2
	stx	%g7,	[%l7 + %o2]
	nop
	set	0x78, %o6
	stx	%g6,	[%l7 + %o6]
	add	%l0,	%i6,	%i0
	nop
	set	0x34, %i5
	ldsw	[%l7 + %i5],	%l5
	or	%o2,	%i7,	%i2
	add	%i5,	%o7,	%l6
	set	0x30, %o0
	stxa	%o5,	[%l7 + %o0] 0x80
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%g4
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%g5
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%l4
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%o0
	nop
	set	0x38, %o4
	prefetch	[%l7 + %o4],	 3
	and	%i3,	%o4,	%g3
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 1
	or	%i4,	%l2,	%l3
	wr	%i1,	%g1,	%pic
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
	st	%f8,	[%l7 + 0x6C]
	set	0x30, %i7
	stha	%o1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x56, %i3
	ldsh	[%l7 + %i3],	%g2
	nop
	set	0x32, %l1
	ldub	[%l7 + %l1],	%o6
	set	0x3E, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o3
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x0C, %l0
	sth	%l1,	[%l7 + %l0]
	nop
	set	0x7C, %g4
	ldsw	[%l7 + %g4],	%g7
	st	%fsr,	[%l7 + 0x3C]
	set	0x24, %g3
	lda	[%l7 + %g3] 0x80,	%f29
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%i6
	nop
	set	0x70, %o7
	stw	%i0,	[%l7 + %o7]
	nop
	set	0x18, %g7
	stx	%l5,	[%l7 + %g7]
	nop
	set	0x20, %i4
	stx	%g6,	[%l7 + %i4]
	nop
	set	0x3B, %i2
	ldsb	[%l7 + %i2],	%o2
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x81,	%i2
	nop
	set	0x70, %l4
	std	%f28,	[%l7 + %l4]
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x80,	%i4
	nop
	set	0x40, %l6
	std	%f6,	[%l7 + %l6]
	st	%f28,	[%l7 + 0x2C]
	nop
	set	0x70, %l2
	lduw	[%l7 + %l2],	%o7
	nop
	set	0x6B, %g1
	stb	%i7,	[%l7 + %g1]
	nop
	set	0x5E, %o1
	stb	%l6,	[%l7 + %o1]
	set	0x20, %o2
	stwa	%g4,	[%l7 + %o2] 0xeb
	membar	#Sync
	or	%o5,	%g5,	%o0
	nop
	set	0x58, %g6
	ldsh	[%l7 + %g6],	%i3
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f0
	and	%l4,	%o4,	%i4
	st	%fsr,	[%l7 + 0x24]
	set	0x28, %o6
	stda	%l2,	[%l7 + %o6] 0x81
	set	0x50, %o0
	sta	%f18,	[%l7 + %o0] 0x80
	nop
	set	0x50, %o3
	std	%l2,	[%l7 + %o3]
	set	0x2C, %o5
	stba	%i1,	[%l7 + %o5] 0x89
	set	0x60, %i1
	stwa	%g1,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f8
	ld	[%l7 + 0x10],	%f18
	nop
	set	0x70, %g2
	ldsw	[%l7 + %g2],	%g3
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0
	nop
	set	0x74, %i7
	lduh	[%l7 + %i7],	%o6
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%g2
	set	0x24, %i3
	lda	[%l7 + %i3] 0x89,	%f19
	add	%o3,	%l1,	%g7
	nop
	set	0x1B, %i0
	ldstub	[%l7 + %i0],	%i6
	set	0x30, %l0
	stwa	%l0,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x50, %l1
	stwa	%l5,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x4C, %g4
	sth	%i0,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x60]
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x80,	%o2
	nop
	set	0x2D, %g3
	stb	%i2,	[%l7 + %g3]
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x80,	 2
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd0
	nop
	set	0x4D, %i4
	ldstub	[%l7 + %i4],	%g6
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xe3,	%o6
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
	nop
	set	0x20, %g5
	stx	%i7,	[%l7 + %g5]
	nop
	set	0x30, %l2
	lduw	[%l7 + %l2],	%g4
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x81,	%o5
	nop
	set	0x45, %l6
	ldsb	[%l7 + %l6],	%o0
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%g4
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x68, %o1
	stx	%i3,	[%l7 + %o1]
	nop
	set	0x75, %o6
	ldub	[%l7 + %o6],	%o4
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x88,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%l4
	nop
	set	0x70, %o3
	stw	%i1,	[%l7 + %o3]
	nop
	set	0x38, %o0
	std	%g0,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x40, %o5
	stb	%g3,	[%l7 + %o5]
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%o0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	set	0x50, %i6
	swapa	[%l7 + %i6] 0x89,	%l3
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%o6
	nop
	set	0x2B, %o4
	ldstub	[%l7 + %o4],	%o3
	and	%g2,	%l1,	%i6
	ld	[%l7 + 0x0C],	%f10
	nop
	set	0x0C, %l3
	lduh	[%l7 + %l3],	%g7
	st	%f31,	[%l7 + 0x28]
	nop
	set	0x60, %i3
	ldsb	[%l7 + %i3],	%l5
	nop
	set	0x70, %i0
	stx	%i0,	[%l7 + %i0]
	nop
	set	0x32, %l1
	stb	%l0,	[%l7 + %l1]
	nop
	set	0x72, %g4
	sth	%i2,	[%l7 + %g4]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xcc
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x16, %g7
	ldsh	[%l7 + %g7],	%o2
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%g6
	add	%i5,	%l6,	%i7
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%g4
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x80
	nop
	set	0x78, %l4
	swap	[%l7 + %l4],	%o7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%i3
	set	0x20, %i4
	stba	%i4,	[%l7 + %i4] 0x80
	nop
	set	0x40, %l2
	stw	%o4,	[%l7 + %l2]
	nop
	set	0x40, %g1
	std	%f26,	[%l7 + %g1]
	nop
	set	0x30, %l6
	std	%l4,	[%l7 + %l6]
	set	0x78, %o2
	stwa	%l2,	[%l7 + %o2] 0x81
	nop
	set	0x60, %g6
	ldsh	[%l7 + %g6],	%i1
	nop
	set	0x40, %g5
	ldsh	[%l7 + %g5],	%g3
	set	0x62, %o6
	stba	%g1,	[%l7 + %o6] 0x80
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f2
	set	0x08, %o1
	stxa	%o1,	[%l7 + %o1] 0x89
	add	%o6,	%o3,	%g2
	set	0x27, %o0
	stba	%l3,	[%l7 + %o0] 0x80
	nop
	set	0x52, %o3
	ldsh	[%l7 + %o3],	%l1
	nop
	set	0x18, %i1
	lduw	[%l7 + %i1],	%g7
	set	0x6B, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i6
	set	0x1A, %i6
	stba	%i0,	[%l7 + %i6] 0x89
	nop
	set	0x58, %i7
	stb	%l5,	[%l7 + %i7]
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x81,	%i2
	nop
	set	0x58, %l3
	std	%o2,	[%l7 + %l3]
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x88,	%g6
	set	0x40, %o5
	stda	%i4,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x18, %i0
	stxa	%l6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x32, %g4
	ldsh	[%l7 + %g4],	%l0
	ble	%icc,	loop_41
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f6
	fpsub32	%f14,	%f4,	%f16
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%i7
loop_41:
	nop
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x81,	%g4
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x80
	set	0x66, %l0
	stha	%o7,	[%l7 + %l0] 0x80
	set	0x58, %g3
	stda	%o4,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x81
	set	0x10, %i4
	stwa	%o0,	[%l7 + %i4] 0x80
	nop
	set	0x6E, %l4
	ldsb	[%l7 + %l4],	%i3
	nop
	set	0x20, %g1
	stx	%g5,	[%l7 + %g1]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l4
	nop
	set	0x48, %l6
	stw	%o4,	[%l7 + %l6]
	nop
	set	0x68, %o2
	std	%l2,	[%l7 + %o2]
	set	0x68, %g6
	stda	%g2,	[%l7 + %g6] 0x80
	nop
	set	0x74, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x35, %g5
	stb	%g1,	[%l7 + %g5]
	nop
	set	0x5C, %i5
	ldub	[%l7 + %i5],	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%o6
	st	%f5,	[%l7 + 0x5C]
	set	0x68, %o1
	stxa	%g2,	[%l7 + %o1] 0xe2
	membar	#Sync
	bne	%icc,	loop_42
	nop
	set	0x08, %o6
	stw	%o3,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f0
loop_42:
	nop
	set	0x68, %i1
	stda	%l2,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x81,	%g7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%i0
	nop
	set	0x15, %g2
	ldsb	[%l7 + %g2],	%l5
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x81
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	nop
	set	0x59, %l3
	ldsb	[%l7 + %l3],	%i6
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%i2
	nop
	set	0x38, %o5
	stx	%g6,	[%l7 + %o5]
	nop
	set	0x18, %i0
	ldsh	[%l7 + %i0],	%i5
	nop
	set	0x0C, %g4
	lduw	[%l7 + %g4],	%o2
	ld	[%l7 + 0x18],	%f23
	nop
	set	0x08, %l1
	swap	[%l7 + %l1],	%l0
	or	%i7,	%l6,	%g4
	set	0x50, %i3
	swapa	[%l7 + %i3] 0x89,	%o7
	set	0x30, %o7
	ldda	[%l7 + %o7] 0x80,	%o4
	set	0x20, %g7
	sta	%f16,	[%l7 + %g7] 0x89
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	ld	[%l7 + 0x10],	%f21
	nop
	set	0x2B, %g3
	stb	%o0,	[%l7 + %g3]
	set	0x38, %i2
	swapa	[%l7 + %i2] 0x89,	%i4
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x80,	%g5
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc2
	set	0x0A, %g1
	ldstuba	[%l7 + %g1] 0x89,	%l4
	set	0x6C, %i4
	stwa	%l2,	[%l7 + %i4] 0x89
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%o4
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xe2,	%g2
	nop
	set	0x3A, %g6
	stb	%o1,	[%l7 + %g6]
	nop
	set	0x54, %g5
	ldsh	[%l7 + %g5],	%g1
	nop
	set	0x28, %i5
	ldx	[%l7 + %i5],	%i1
	set	0x48, %o1
	stxa	%o6,	[%l7 + %o1] 0x81
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f16
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l3
	set	0x10, %l2
	lda	[%l7 + %l2] 0x89,	%f11
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	nop
	set	0x50, %o3
	prefetch	[%l7 + %o3],	 2
	set	0x30, %i1
	lda	[%l7 + %i1] 0x80,	%f30
	st	%f31,	[%l7 + 0x74]
	set	0x3A, %g2
	stha	%g7,	[%l7 + %g2] 0xe2
	membar	#Sync
	st	%f0,	[%l7 + 0x4C]
	set	0x3C, %i6
	stwa	%o3,	[%l7 + %i6] 0x81
	nop
	set	0x6C, %i7
	swap	[%l7 + %i7],	%l1
	or	%l5,	%i0,	%i2
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%i4
	set	0x20, %g4
	stxa	%o2,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f26
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x3C, %i3
	swap	[%l7 + %i3],	%g6
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%i6
	nop
	set	0x24, %g7
	ldstub	[%l7 + %g7],	%l6
	nop
	set	0x0C, %l1
	ldstub	[%l7 + %l1],	%l0
	nop
	set	0x0A, %g3
	ldub	[%l7 + %g3],	%g4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf9
	membar	#Sync
	ld	[%l7 + 0x48],	%f17
	nop
	set	0x69, %l5
	ldsb	[%l7 + %l5],	%o5
	nop
	set	0x78, %l4
	std	%f4,	[%l7 + %l4]
	set	0x60, %i2
	stda	%i2,	[%l7 + %i2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x7A, %i4
	ldsh	[%l7 + %i4],	%o0
	nop
	set	0x68, %g1
	std	%o6,	[%l7 + %g1]
	set	0x50, %l6
	stha	%i4,	[%l7 + %l6] 0x81
	set	0x74, %g6
	swapa	[%l7 + %g6] 0x81,	%g5
	nop
	set	0x48, %o2
	stw	%l4,	[%l7 + %o2]
	st	%f12,	[%l7 + 0x74]
	nop
	set	0x20, %i5
	stw	%o4,	[%l7 + %i5]
	and	%l2,	%g3,	%g1
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x81,	 1
	bg,a	%icc,	loop_43
	or	%g2,	%o6,	%l3
	fpsub16s	%f20,	%f24,	%f11
	nop
	set	0x44, %l2
	swap	[%l7 + %l2],	%g7
loop_43:
	nop
	set	0x30, %o0
	prefetch	[%l7 + %o0],	 2
	ld	[%l7 + 0x3C],	%f4
	nop
	set	0x78, %o3
	std	%o2,	[%l7 + %o3]
	nop
	set	0x2D, %g5
	ldsb	[%l7 + %g5],	%l5
	fpsub32s	%f4,	%f24,	%f19
	wr	%i0,	%i2,	%pic
	nop
	nop
	setx	0xDE8585F1A058AD6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xE2D4076CF601C516,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f28,	%f30
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%i6
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%o2
	nop
	set	0x20, %i1
	stx	%i5,	[%l7 + %i1]
	wr	%g6,	%l6,	%sys_tick
	set	0x10, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l0
	set	0x21, %l3
	ldstuba	[%l7 + %l3] 0x81,	%g4
	set	0x2C, %i6
	sta	%f27,	[%l7 + %i6] 0x80
	nop
	set	0x0C, %i0
	stw	%o5,	[%l7 + %i0]
	nop
	set	0x54, %g4
	stw	%i3,	[%l7 + %g4]
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f26
	nop
	set	0x2E, %i3
	lduh	[%l7 + %i3],	%o0
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x80,	%i7
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x81,	%i4
	nop
	set	0x2B, %g7
	ldsb	[%l7 + %g7],	%o7
	st	%fsr,	[%l7 + 0x30]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f0
	ld	[%l7 + 0x10],	%f14
	nop
	set	0x48, %l0
	ldsw	[%l7 + %l0],	%g5
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	st	%f29,	[%l7 + 0x40]
	nop
	set	0x08, %g3
	std	%f4,	[%l7 + %g3]
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%l4
	nop
	set	0x08, %i4
	stx	%l2,	[%l7 + %i4]
	set	0x28, %i2
	stha	%g3,	[%l7 + %i2] 0x88
	set	0x5C, %g1
	lda	[%l7 + %g1] 0x89,	%f16
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x89,	%o4
	nop
	set	0x40, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x18, %i5
	stx	%o1,	[%l7 + %i5]
	and	%g1,	%g2,	%o6
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x48, %o1
	stda	%l2,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x18, %l2
	lda	[%l7 + %l2] 0x88,	%f5
	st	%f31,	[%l7 + 0x6C]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf1,	%f16
	st	%fsr,	[%l7 + 0x30]
	ld	[%l7 + 0x4C],	%f30
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%g7
	nop
	set	0x44, %o0
	swap	[%l7 + %o0],	%l5
	nop
	set	0x7E, %o3
	sth	%i0,	[%l7 + %o3]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f16
	nop
	set	0x28, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x20, %i7
	stxa	%o3,	[%l7 + %i7] 0xea
	membar	#Sync
	fpadd16	%f18,	%f12,	%f10
	nop
	set	0x50, %i1
	std	%f22,	[%l7 + %i1]
	nop
	set	0x08, %l3
	sth	%i2,	[%l7 + %l3]
	and	%l1,	%i6,	%o2
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f16
	nop
	set	0x68, %i0
	lduh	[%l7 + %i0],	%g6
	nop
	set	0x46, %g4
	ldsh	[%l7 + %g4],	%i5
	or	%l0,	%g4,	%l6
	nop
	set	0x50, %i3
	ldub	[%l7 + %i3],	%o5
	or	%o0,	%i7,	%i4
	nop
	set	0x08, %o7
	ldstub	[%l7 + %o7],	%i3
	set	0x6C, %o4
	sta	%f18,	[%l7 + %o4] 0x88
	nop
	set	0x10, %o5
	std	%f6,	[%l7 + %o5]
	nop
	set	0x0C, %g7
	ldstub	[%l7 + %g7],	%g5
	set	0x6C, %l0
	swapa	[%l7 + %l0] 0x80,	%o7
	nop
	set	0x30, %l5
	stx	%l2,	[%l7 + %l5]
	nop
	set	0x64, %l1
	lduw	[%l7 + %l1],	%l4
	nop
	set	0x48, %l4
	stw	%g3,	[%l7 + %l4]
	nop
	set	0x0E, %i4
	ldub	[%l7 + %i4],	%o1
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x89
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x81
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%o4
	set	0x64, %o2
	stha	%g2,	[%l7 + %o2] 0xea
	membar	#Sync
	and	%g1,	%l3,	%o6
	nop
	set	0x48, %l6
	stx	%i1,	[%l7 + %l6]
	nop
	set	0x0E, %g6
	ldsh	[%l7 + %g6],	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%l5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%o3
	nop
	set	0x2F, %i5
	ldstub	[%l7 + %i5],	%i6
	nop
	set	0x26, %l2
	lduh	[%l7 + %l2],	%l1
	nop
	set	0x13, %o1
	stb	%o2,	[%l7 + %o1]
	nop
	set	0x5A, %o6
	lduh	[%l7 + %o6],	%g6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%g4
	bge,a,pt	%icc,	loop_44
	or	%i5,	%o5,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%l6
loop_44:
	or	%i3,	%i4,	%g5
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x89,	%o7
	nop
	set	0x78, %o0
	stx	%fsr,	[%l7 + %o0]
	and	%l2,	%l4,	%g3
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xcc
	set	0x48, %g2
	stwa	%o4,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x88
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 3
	wr	%o1,	%g2,	%pic
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x40, %i0
	std	%f2,	[%l7 + %i0]
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%l3
	set	0x3E, %i3
	stba	%g1,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x24, %o7
	ldsb	[%l7 + %o7],	%i1
	nop
	set	0x68, %o4
	stx	%o6,	[%l7 + %o4]
	nop
	set	0x20, %i6
	ldsh	[%l7 + %i6],	%g7
	set	0x48, %g7
	stwa	%i0,	[%l7 + %g7] 0x88
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x89,	%l5
	set	0x74, %l5
	sta	%f6,	[%l7 + %l5] 0x80
	set	0x1C, %l1
	sta	%f15,	[%l7 + %l1] 0x89
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%i2
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%o2
	st	%f2,	[%l7 + 0x48]
	nop
	set	0x11, %i2
	stb	%i6,	[%l7 + %i2]
	nop
	set	0x78, %i4
	ldsw	[%l7 + %i4],	%o2
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x88,	%g6
	set	0x60, %o2
	stda	%l0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x68, %l6
	stxa	%l1,	[%l7 + %l6] 0x88
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd2
	ld	[%l7 + 0x60],	%f6
	set	0x74, %i5
	sta	%f9,	[%l7 + %i5] 0x88
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o5
	fpsub32	%f8,	%f18,	%f8
	nop
	set	0x78, %g6
	swap	[%l7 + %g6],	%i5
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f20
	nop
	set	0x64, %o6
	ldub	[%l7 + %o6],	%i7
	nop
	set	0x52, %o3
	stb	%o0,	[%l7 + %o3]
	nop
	set	0x3C, %o0
	lduw	[%l7 + %o0],	%l6
	ld	[%l7 + 0x34],	%f7
	nop
	set	0x3C, %o1
	lduh	[%l7 + %o1],	%i4
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%i3
	set	0x68, %i1
	sta	%f29,	[%l7 + %i1] 0x80
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	nop
	set	0x28, %l3
	std	%f24,	[%l7 + %l3]
	set	0x40, %g2
	stda	%g4,	[%l7 + %g2] 0x80
	nop
	set	0x68, %g4
	stx	%o7,	[%l7 + %g4]
	set	0x38, %i0
	swapa	[%l7 + %i0] 0x88,	%l4
	and	%l2,	%g3,	%o1
	nop
	set	0x1C, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x20, %o4
	stw	%g2,	[%l7 + %o4]
	set	0x5C, %i6
	stwa	%o4,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x38, %o7
	swap	[%l7 + %o7],	%g1
	fpsub32s	%f9,	%f0,	%f18
	and	%i1,	%o6,	%l3
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%g6
	set	0x58, %l5
	sta	%f19,	[%l7 + %l5] 0x89
	nop
	set	0x74, %g7
	ldsh	[%l7 + %g7],	%i0
	nop
	set	0x40, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x60, %l1
	std	%i2,	[%l7 + %l1]
	set	0x28, %i2
	ldxa	[%l7 + %i2] 0x80,	%l5
	set	0x40, %l0
	lda	[%l7 + %l0] 0x81,	%f3
	nop
	set	0x40, %i4
	std	%i6,	[%l7 + %i4]
	set	0x58, %g3
	stda	%o2,	[%l7 + %g3] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%l0
	nop
	set	0x2E, %o2
	ldsh	[%l7 + %o2],	%l1
	nop
	set	0x62, %l6
	lduh	[%l7 + %l6],	%g4
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%o5
	set	0x48, %g6
	swapa	[%l7 + %g6] 0x89,	%o2
	nop
	set	0x10, %l2
	std	%i4,	[%l7 + %l2]
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%f28
	set	0x40, %o6
	stxa	%o0,	[%l7 + %o6] 0x80
	set	0x25, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l6
	ld	[%l7 + 0x58],	%f29
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f4
	nop
	set	0x30, %g5
	std	%i6,	[%l7 + %g5]
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%i3
	add	%g5,	%o7,	%i4
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l4
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x80,	%g3
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%o1
	and	%o4,	%g1,	%i1
	ld	[%l7 + 0x28],	%f7
	fpadd32s	%f25,	%f11,	%f15
	nop
	set	0x6C, %i7
	ldsb	[%l7 + %i7],	%g2
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%o6
	nop
	set	0x5A, %o4
	ldub	[%l7 + %o4],	%l3
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x80,	%i0
	nop
	set	0x5D, %o7
	stb	%g7,	[%l7 + %o7]
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x88,	%i2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x50, %l4
	stxa	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x40, %g7
	lduh	[%l7 + %g7],	%o3
	set	0x08, %i2
	swapa	[%l7 + %i2] 0x80,	%l5
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	nop
	set	0x4C, %i4
	ldsw	[%l7 + %i4],	%l1
	set	0x68, %l0
	stda	%g6,	[%l7 + %l0] 0x89
	nop
	set	0x70, %o2
	stx	%g4,	[%l7 + %o2]
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%o2
	nop
	set	0x7C, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x55, %g6
	ldstub	[%l7 + %g6],	%i5
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	nop
	set	0x18, %i5
	ldsh	[%l7 + %i5],	%i7
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x88,	%l6
	st	%f4,	[%l7 + 0x44]
	nop
	set	0x31, %l2
	ldstub	[%l7 + %l2],	%g5
	set	0x48, %o0
	stda	%i2,	[%l7 + %o0] 0x81
	nop
	set	0x20, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x18, %i1
	swapa	[%l7 + %i1] 0x89,	%i4
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	and	%l2,	%l4,	%o1
	nop
	set	0x30, %o1
	ldub	[%l7 + %o1],	%o4
	set	0x10, %g2
	stda	%g0,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x64, %g4
	lduh	[%l7 + %g4],	%i1
	nop
	set	0x52, %l3
	lduh	[%l7 + %l3],	%g3
	set	0x38, %i3
	stha	%o6,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x68, %i7
	ldxa	[%l7 + %i7] 0x88,	%l3
	nop
	set	0x20, %i6
	ldsw	[%l7 + %i6],	%g2
	add	%g7,	%i2,	%i6
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	set	0x48, %o5
	stwa	%i0,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x3F, %l5
	ldub	[%l7 + %l5],	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%g4
	nop
	set	0x0C, %i0
	sth	%g6,	[%l7 + %i0]
	nop
	set	0x7A, %l4
	stb	%o5,	[%l7 + %l4]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o0
	fpsub32s	%f7,	%f9,	%f30
	or	%i7,	%o2,	%g5
	set	0x20, %g7
	stba	%l6,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x28, %i2
	ldsh	[%l7 + %i2],	%i3
	set	0x1F, %l1
	stba	%i4,	[%l7 + %l1] 0x88
	nop
	set	0x3A, %l0
	sth	%l2,	[%l7 + %l0]
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x7C, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x3C, %l6
	ldsw	[%l7 + %l6],	%l4
	add	%o4,	%g1,	%g3
	nop
	set	0x64, %g1
	lduh	[%l7 + %g1],	%o6
	nop
	set	0x18, %i4
	std	%f8,	[%l7 + %i4]
	nop
	set	0x10, %g3
	ldsw	[%l7 + %g3],	%i1
	add	%g2,	%l3,	%i2
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	wr	%o3,	%i0,	%softint
	nop
	set	0x72, %o6
	ldsh	[%l7 + %o6],	%l0
	or	%g7,	%l1,	%l5
	add	%g6,	%o5,	%g4
	and	%o0,	%i5,	%o2
	nop
	set	0x28, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x40, %o0
	std	%f2,	[%l7 + %o0]
	set	0x60, %g5
	ldxa	[%l7 + %g5] 0x88,	%i7
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x80,	%l6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%l2
	nop
	set	0x38, %i1
	std	%f26,	[%l7 + %i1]
	st	%f18,	[%l7 + 0x18]
	set	0x1C, %o1
	stwa	%i4,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x68, %i3
	lduw	[%l7 + %i3],	%l4
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%g3
	nop
	set	0x50, %i6
	sth	%o4,	[%l7 + %i6]
	nop
	set	0x68, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x14, %o4
	stha	%i1,	[%l7 + %o4] 0x88
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%l3
	nop
	set	0x68, %l5
	ldsb	[%l7 + %l5],	%i6
	set	0x18, %i0
	stda	%i2,	[%l7 + %i0] 0x89
	wr	%o3,	%l0,	%sys_tick
	set	0x48, %o5
	stwa	%g7,	[%l7 + %o5] 0x81
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd0
	add	%l1,	%l5,	%g6
	nop
	set	0x10, %l4
	std	%i0,	[%l7 + %l4]
	nop
	set	0x70, %l1
	ldsh	[%l7 + %l1],	%o5
	nop
	set	0x38, %l0
	stx	%g4,	[%l7 + %l0]
	set	0x43, %i2
	stba	%o0,	[%l7 + %i2] 0x88
	nop
	set	0x54, %l6
	lduw	[%l7 + %l6],	%o2
	nop
	set	0x58, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x5E, %g1
	stha	%i7,	[%l7 + %g1] 0x89
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x89,	%i5
	nop
	set	0x78, %g3
	std	%f18,	[%l7 + %g3]
	nop
	set	0x35, %o6
	ldsb	[%l7 + %o6],	%g5
	nop
	set	0x2C, %i5
	stb	%i3,	[%l7 + %i5]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f16
	fpadd32s	%f24,	%f21,	%f24
	nop
	set	0x12, %g5
	ldsh	[%l7 + %g5],	%l6
	set	0x08, %g6
	stba	%i4,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x30, %o0
	lda	[%l7 + %o0] 0x80,	%f20
	st	%fsr,	[%l7 + 0x70]
	or	%o1,	%l2,	%l4
	or	%o7,	%g3,	%o4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1275
!	Type a   	: 23
!	Type cti   	: 18
!	Type x   	: 535
!	Type f   	: 38
!	Type i   	: 111
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
	set	0xB,	%g1
	set	0x7,	%g2
	set	0x2,	%g3
	set	0x3,	%g4
	set	0x2,	%g5
	set	0x2,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x8,	%i1
	set	-0x7,	%i2
	set	-0x3,	%i3
	set	-0x1,	%i4
	set	-0x3,	%i5
	set	-0xD,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x6B4E81FB,	%l0
	set	0x5D99C5E5,	%l1
	set	0x660C45A8,	%l2
	set	0x7F27659A,	%l3
	set	0x2FC06596,	%l4
	set	0x53D7CE69,	%l5
	set	0x3F58728C,	%l6
	!# Output registers
	set	0x1245,	%o0
	set	-0x028F,	%o1
	set	0x1209,	%o2
	set	0x039A,	%o3
	set	-0x0477,	%o4
	set	0x0C66,	%o5
	set	-0x1B2D,	%o6
	set	0x16D6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	ba,pt	%icc,	loop_45
	or	%i1,	%g1,	%o6
	wr	%l3,	%g2,	%set_softint
	nop
	set	0x60, %o3
	ldsb	[%l7 + %o3],	%i2
loop_45:
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%o3
	set	0x78, %i1
	stda	%i6,	[%l7 + %i1] 0x80
	wr	%l0,	%l1,	%pic
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%f0
	nop
	set	0x28, %l3
	stb	%g7,	[%l7 + %l3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%g6
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x81,	%i0
	set	0x54, %g4
	stha	%g4,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x48, %i6
	std	%o4,	[%l7 + %i6]
	set	0x3C, %o4
	sta	%f25,	[%l7 + %o4] 0x80
	wr	%o2,	%o0,	%y
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%g5
	fpsub16	%f6,	%f0,	%f30
	add	%i7,	%i3,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%o1
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x89,	 0
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xeb,	%l4
	set	0x69, %i7
	stba	%g3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x50, %o5
	std	%f26,	[%l7 + %o5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%o7
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	add	%i1,	%g1,	%o6
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%g2
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf0
	membar	#Sync
	nop
	set	0x54, %l0
	lduh	[%l7 + %l0],	%l3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%i6
	nop
	set	0x10, %i2
	std	%f2,	[%l7 + %i2]
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f24
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x81,	%l0
	set	0x18, %g1
	swapa	[%l7 + %g1] 0x88,	%l1
	add	%g7,	%l5,	%o3
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%i0
	nop
	set	0x1A, %i4
	ldub	[%l7 + %i4],	%g4
	wr	%g6,	%o2,	%pic
	nop
	set	0x59, %g3
	stb	%o5,	[%l7 + %g3]
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x2B, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o0
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%i4
	nop
	set	0x32, %g5
	ldsh	[%l7 + %g5],	%i7
	nop
	set	0x20, %g6
	std	%i2,	[%l7 + %g6]
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x6C, %o1
	swapa	[%l7 + %o1] 0x89,	%l2
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%l4
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f24
	set	0x3E, %l3
	stha	%o1,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x3C, %g2
	stwa	%o4,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x78, %g4
	sta	%f8,	[%l7 + %g4] 0x89
	nop
	set	0x5C, %i3
	ldub	[%l7 + %i3],	%g3
	set	0x1C, %i6
	stha	%o7,	[%l7 + %i6] 0x80
	set	0x67, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g1
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%o6
	nop
	set	0x48, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%i1
	nop
	set	0x59, %o5
	stb	%g2,	[%l7 + %o5]
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f18
	nop
	set	0x60, %l1
	stb	%i2,	[%l7 + %l1]
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f8
	st	%f30,	[%l7 + 0x28]
	set	0x10, %l0
	stda	%i6,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x80,	%l0
	nop
	set	0x0E, %i2
	lduh	[%l7 + %i2],	%l1
	ld	[%l7 + 0x68],	%f19
	set	0x42, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l3
	or	%l5,	%o3,	%i0
	nop
	set	0x4A, %l4
	stb	%g7,	[%l7 + %l4]
	and	%g4,	%g6,	%o5
	nop
	set	0x50, %o2
	std	%o0,	[%l7 + %o2]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd2,	%f0
	or	%o2,	%i7,	%i5
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%i6
	nop
	set	0x3F, %l2
	stb	%g5,	[%l7 + %l2]
	nop
	set	0x50, %g3
	lduw	[%l7 + %g3],	%i4
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%l2
	st	%fsr,	[%l7 + 0x60]
	set	0x28, %g6
	stba	%l4,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x20, %o3
	std	%o0,	[%l7 + %o3]
	nop
	set	0x60, %g5
	std	%o4,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x14]
	fpadd16s	%f4,	%f8,	%f28
	wr	%g3,	%i3,	%ccr
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x1C, %i1
	stha	%o7,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x78, %l3
	lda	[%l7 + %l3] 0x89,	%f29
	set	0x5F, %g2
	ldstuba	[%l7 + %g2] 0x88,	%g1
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x88,	 2
	nop
	set	0x34, %i3
	ldsh	[%l7 + %i3],	%g2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%i6
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x88,	%l0
	set	0x74, %o7
	stwa	%i2,	[%l7 + %o7] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	set	0x58, %i6
	stxa	%l3,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xeb,	%l4
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x89,	%o3
	nop
	set	0x48, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x08, %g7
	std	%i0,	[%l7 + %g7]
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%l1
	st	%fsr,	[%l7 + 0x20]
	ld	[%l7 + 0x14],	%f24
	nop
	set	0x39, %i0
	stb	%g4,	[%l7 + %i0]
	st	%f13,	[%l7 + 0x7C]
	nop
	set	0x26, %l0
	ldsh	[%l7 + %l0],	%g6
	set	0x1C, %o5
	stwa	%g7,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x40, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x3F, %i2
	stb	%o5,	[%l7 + %i2]
	set	0x6F, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o0
	set	0x48, %o2
	stda	%i6,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x08, %i4
	stx	%o2,	[%l7 + %i4]
	set	0x70, %l4
	stwa	%l6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x78, %l2
	stx	%fsr,	[%l7 + %l2]
	wr	%g5,	%i5,	%softint
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%l2
	ld	[%l7 + 0x20],	%f1
	set	0x2C, %i5
	stwa	%o1,	[%l7 + %i5] 0x81
	and	%o4,	%g3,	%l4
	set	0x58, %g3
	ldxa	[%l7 + %g3] 0x88,	%i3
	nop
	set	0x68, %g6
	ldstub	[%l7 + %g6],	%o7
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%i0
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x81,	%g2
	nop
	set	0x0C, %o6
	stw	%g1,	[%l7 + %o6]
	nop
	set	0x28, %i1
	std	%o6,	[%l7 + %i1]
	st	%f25,	[%l7 + 0x6C]
	nop
	set	0x2A, %l3
	lduh	[%l7 + %l3],	%i6
	fpadd16	%f4,	%f30,	%f14
	nop
	set	0x18, %o1
	std	%i2,	[%l7 + %o1]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%l0
	set	0x0A, %g4
	stha	%l5,	[%l7 + %g4] 0x80
	set	0x1A, %g2
	stha	%o3,	[%l7 + %g2] 0x80
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x88,	%i0
	nop
	set	0x32, %i3
	stb	%g4,	[%l7 + %i3]
	nop
	set	0x11, %i6
	stb	%l1,	[%l7 + %i6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%o5
	set	0x7C, %i7
	swapa	[%l7 + %i7] 0x81,	%o0
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f18
	nop
	set	0x0F, %l5
	ldsb	[%l7 + %l5],	%i7
	nop
	set	0x24, %o4
	stw	%o2,	[%l7 + %o4]
	nop
	set	0x44, %g7
	sth	%l6,	[%l7 + %g7]
	or	%g7,	%g5,	%i5
	nop
	set	0x08, %l1
	std	%l2,	[%l7 + %l1]
	nop
	set	0x36, %i0
	sth	%i4,	[%l7 + %i0]
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%o4
	or	%g3,	%l4,	%i3
	set	0x53, %l0
	stba	%o1,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x2C, %i2
	stwa	%i1,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	nop
	setx	0xE4BA81B5E6883589,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA9B9271B8CEC4FBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f24,	%f26
	set	0x4C, %g1
	stwa	%o7,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x10, %o2
	stw	%g1,	[%l7 + %o2]
	nop
	set	0x6D, %i4
	stb	%g2,	[%l7 + %i4]
	wr	%o6,	%i2,	%pic
	nop
	set	0x2C, %l4
	prefetch	[%l7 + %l4],	 1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%l0
	add	%l5,	%o3,	%i6
	nop
	set	0x70, %l2
	ldsw	[%l7 + %l2],	%g4
	set	0x1C, %i5
	ldstuba	[%l7 + %i5] 0x80,	%i0
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%l0
	wr	%g6,	%o5,	%set_softint
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%o0
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%o2
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f8
	or	%l6,	%g5,	%g7
	nop
	set	0x0E, %g5
	sth	%l2,	[%l7 + %g5]
	nop
	set	0x60, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd2
	set	0x4E, %i1
	stba	%i5,	[%l7 + %i1] 0x81
	set	0x30, %l3
	ldstuba	[%l7 + %l3] 0x89,	%i4
	nop
	set	0x10, %o1
	std	%o4,	[%l7 + %o1]
	and	%l4,	%i3,	%g3
	set	0x74, %g2
	sta	%f0,	[%l7 + %g2] 0x81
	nop
	set	0x10, %g4
	stb	%i1,	[%l7 + %g4]
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f30
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x20, %i7
	std	%f20,	[%l7 + %i7]
	nop
	set	0x38, %o7
	prefetch	[%l7 + %o7],	 2
	fpsub16s	%f17,	%f8,	%f17
	nop
	set	0x50, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x4C, %o4
	stwa	%g1,	[%l7 + %o4] 0xe2
	membar	#Sync
	bgu,a	%icc,	loop_46
	nop
	set	0x64, %g7
	stw	%g2,	[%l7 + %g7]
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xea,	%o6
loop_46:
	st	%f15,	[%l7 + 0x68]
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%i2
	set	0x08, %o5
	stha	%l3,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%f30,	[%l7 + 0x64]
	nop
	set	0x38, %l0
	ldstub	[%l7 + %l0],	%o7
	nop
	set	0x5A, %i0
	ldub	[%l7 + %i0],	%l0
	nop
	set	0x78, %i2
	prefetch	[%l7 + %i2],	 0
	or	%l5,	%o3,	%i6
	nop
	set	0x30, %g1
	std	%i0,	[%l7 + %g1]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%g6
	nop
	set	0x0C, %i4
	stw	%g4,	[%l7 + %i4]
	set	0x26, %o2
	stba	%i7,	[%l7 + %o2] 0x81
	nop
	set	0x0C, %l2
	prefetch	[%l7 + %l2],	 1
	st	%fsr,	[%l7 + 0x44]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%o2
	set	0x50, %l4
	stwa	%l6,	[%l7 + %l4] 0x81
	nop
	set	0x1E, %i5
	ldsb	[%l7 + %i5],	%o0
	ble,a,pt	%xcc,	loop_47
	or	%g7,	%l2,	%i5
	set	0x3E, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i4
loop_47:
	fpsub32s	%f13,	%f7,	%f16
	nop
	set	0x68, %l6
	std	%o4,	[%l7 + %l6]
	bge,a	%xcc,	loop_48
	nop
	set	0x1E, %o3
	lduh	[%l7 + %o3],	%l4
	set	0x68, %o6
	stxa	%g5,	[%l7 + %o6] 0xeb
	membar	#Sync
loop_48:
	nop
	set	0x4B, %g3
	ldsb	[%l7 + %g3],	%g3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd2
	nop
	set	0x6E, %g5
	sth	%i1,	[%l7 + %g5]
	nop
	set	0x10, %o1
	stw	%o1,	[%l7 + %o1]
	nop
	set	0x20, %g2
	stw	%g1,	[%l7 + %g2]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd8,	%f16
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%o6
	nop
	set	0x38, %g4
	std	%f12,	[%l7 + %g4]
	set	0x63, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i2
	set	0x58, %i6
	stxa	%i3,	[%l7 + %i6] 0x80
	nop
	set	0x40, %i7
	lduh	[%l7 + %i7],	%o7
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xea,	%l2
	set	0x6B, %l5
	stba	%l5,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x30, %o4
	std	%f16,	[%l7 + %o4]
	or	%l0,	%o3,	%i6
	nop
	set	0x66, %l1
	ldub	[%l7 + %l1],	%i0
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%f10
	nop
	set	0x3E, %g7
	ldstub	[%l7 + %g7],	%l1
	nop
	set	0x40, %l0
	std	%g4,	[%l7 + %l0]
	st	%f11,	[%l7 + 0x3C]
	ld	[%l7 + 0x20],	%f2
	or	%g6,	%i7,	%o2
	add	%l6,	%o5,	%g7
	nop
	set	0x64, %o5
	ldstub	[%l7 + %o5],	%l2
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x38, %i0
	std	%i4,	[%l7 + %i0]
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%o0
	wr	%o4,	%l4,	%sys_tick
	set	0x78, %i2
	swapa	[%l7 + %i2] 0x80,	%i4
	st	%f23,	[%l7 + 0x38]
	fpsub32s	%f1,	%f16,	%f11
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%f6
	and	%g3,	%i1,	%o1
	add	%g5,	%g1,	%g2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf8
	membar	#Sync
	set	0x28, %l4
	stxa	%i2,	[%l7 + %l4] 0x88
	ld	[%l7 + 0x70],	%f23
	nop
	set	0x48, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x28, %i5
	stx	%i3,	[%l7 + %i5]
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x89,	%o6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x4C, %l6
	ldub	[%l7 + %l6],	%l0
	fpadd16	%f2,	%f12,	%f16
	set	0x6A, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o3
	st	%f25,	[%l7 + 0x7C]
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%i0
	nop
	set	0x78, %g3
	std	%o6,	[%l7 + %g3]
	set	0x48, %g5
	stxa	%g4,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x77, %o1
	ldsb	[%l7 + %o1],	%g6
	set	0x40, %i1
	stda	%l0,	[%l7 + %i1] 0x80
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd8
	nop
	set	0x42, %g4
	stb	%i7,	[%l7 + %g4]
	fpadd32s	%f15,	%f6,	%f4
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf0
	membar	#Sync
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 1
	st	%f28,	[%l7 + 0x08]
	st	%f12,	[%l7 + 0x70]
	nop
	set	0x74, %i6
	lduw	[%l7 + %i6],	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%o2
	set	0x54, %o7
	sta	%f16,	[%l7 + %o7] 0x81
	nop
	set	0x46, %i7
	lduh	[%l7 + %i7],	%g7
	nop
	set	0x30, %l5
	stx	%l2,	[%l7 + %l5]
	nop
	set	0x74, %o4
	ldsh	[%l7 + %o4],	%o0
	nop
	set	0x1D, %l1
	stb	%o4,	[%l7 + %l1]
	fpadd16	%f16,	%f8,	%f8
	st	%f25,	[%l7 + 0x6C]
	nop
	set	0x58, %g7
	ldsh	[%l7 + %g7],	%i5
	nop
	set	0x68, %i3
	ldsh	[%l7 + %i3],	%l4
	set	0x76, %o5
	stba	%g3,	[%l7 + %o5] 0x89
	fpadd32	%f0,	%f30,	%f10
	set	0x50, %l0
	stda	%i0,	[%l7 + %l0] 0xeb
	membar	#Sync
	ld	[%l7 + 0x28],	%f17
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x18, %i0
	ldub	[%l7 + %i0],	%o1
	or	%i4,	%g1,	%g5
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	set	0x42, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i3
	nop
	set	0x08, %i4
	std	%f20,	[%l7 + %i4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%l3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%l4
	nop
	set	0x54, %l4
	lduw	[%l7 + %l4],	%l0
	set	0x18, %o2
	stda	%o2,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x20, %g6
	prefetch	[%l7 + %g6],	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%i0
	nop
	set	0x64, %i5
	swap	[%l7 + %i5],	%o7
	nop
	set	0x10, %o6
	lduh	[%l7 + %o6],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%l1
	bn	%icc,	loop_49
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%g6
loop_49:
	ld	[%l7 + 0x50],	%f18
	fpadd16s	%f17,	%f29,	%f7
	set	0x54, %l6
	stwa	%l6,	[%l7 + %l6] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%g7
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%o2
	set	0x2C, %g3
	stwa	%l2,	[%l7 + %g3] 0x88
	nop
	set	0x11, %o1
	stb	%o4,	[%l7 + %o1]
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x88,	%f11
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x80,	%o0
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%i5
	set	0x68, %l3
	stxa	%g3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f26
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f12
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f0
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x81,	%l4
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%i0
	st	%fsr,	[%l7 + 0x3C]
	or	%o1,	%g1,	%g5
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd0
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x81
	nop
	set	0x51, %l1
	ldstub	[%l7 + %l1],	%g2
	nop
	set	0x60, %o5
	ldsh	[%l7 + %o5],	%i3
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%i4
	nop
	set	0x64, %i0
	prefetch	[%l7 + %i0],	 4
	add	%i2,	%l5,	%l3
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x80,	%o3
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%o6
	set	0x0B, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l0
	or	%i0,	%o7,	%i6
	st	%f26,	[%l7 + 0x7C]
	set	0x54, %l2
	stwa	%g4,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f20
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f16
	nop
	set	0x26, %g6
	ldstub	[%l7 + %g6],	%l1
	nop
	set	0x10, %i5
	std	%g6,	[%l7 + %i5]
	and	%l6,	%i7,	%g7
	and	%o2,	%l2,	%o4
	nop
	set	0x30, %i4
	ldsh	[%l7 + %i4],	%o5
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf8
	membar	#Sync
	add	%i5,	%g3,	%o0
	nop
	set	0x31, %l6
	stb	%l4,	[%l7 + %l6]
	set	0x28, %g5
	stda	%o0,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x5E, %g3
	stb	%i1,	[%l7 + %g3]
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%g0
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f0
	nop
	set	0x29, %g2
	stb	%g5,	[%l7 + %g2]
	or	%i3,	%g2,	%i4
	st	%f20,	[%l7 + 0x60]
	and	%i2,	%l3,	%o3
	nop
	set	0x39, %g4
	ldstub	[%l7 + %g4],	%o6
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%l5
	nop
	set	0x54, %i6
	stb	%l0,	[%l7 + %i6]
	st	%f17,	[%l7 + 0x58]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf9
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%i6
	nop
	set	0x7C, %o7
	ldsw	[%l7 + %o7],	%i0
	set	0x64, %i7
	lda	[%l7 + %i7] 0x89,	%f10
	add	%l1,	%g6,	%g4
	set	0x08, %o0
	stba	%i7,	[%l7 + %o0] 0x81
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc2
	set	0x48, %g7
	stda	%i6,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%l2
	nop
	set	0x72, %o4
	ldsh	[%l7 + %o4],	%o4
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc4
	nop
	set	0x4C, %o5
	sth	%o5,	[%l7 + %o5]
	nop
	set	0x3A, %i3
	sth	%o2,	[%l7 + %i3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%o0
	nop
	set	0x18, %i0
	swap	[%l7 + %i0],	%l4
	ld	[%l7 + 0x48],	%f10
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	or	%g3,	%i1,	%g1
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x81,	%o1
	nop
	set	0x22, %l2
	sth	%g5,	[%l7 + %l2]
	set	0x28, %i2
	stxa	%i3,	[%l7 + %i2] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%i2
	nop
	set	0x30, %o2
	stw	%l3,	[%l7 + %o2]
	set	0x34, %g6
	stwa	%i4,	[%l7 + %g6] 0x81
	nop
	set	0x20, %i5
	std	%o2,	[%l7 + %i5]
	wr	%l5,	%o6,	%sys_tick
	st	%f0,	[%l7 + 0x58]
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%l0
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%f16
	nop
	set	0x19, %g5
	stb	%o7,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x6C]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%l1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x63, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i7
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f26
	fpadd16	%f20,	%f22,	%f28
	nop
	set	0x68, %o1
	stx	%l6,	[%l7 + %o1]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x80
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%g4
	nop
	set	0x1A, %o6
	ldsh	[%l7 + %o6],	%l2
	nop
	set	0x38, %i1
	stw	%g7,	[%l7 + %i1]
	nop
	set	0x10, %l3
	swap	[%l7 + %l3],	%o4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o5
	or	%o0,	%i5,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%i1
	and	%o1,	%g1,	%g5
	set	0x18, %o7
	lda	[%l7 + %o7] 0x80,	%f25
	or	%g2,	%i3,	%i2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf9
	membar	#Sync
	nop
	set	0x30, %i6
	stx	%i4,	[%l7 + %i6]
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	nop
	setx	0xA56126CE2CAEBFE8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xEADB1400816713FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f12,	%f30
	nop
	set	0x70, %l5
	std	%f26,	[%l7 + %l5]
	set	0x08, %o4
	sta	%f12,	[%l7 + %o4] 0x81
	nop
	set	0x68, %g7
	lduh	[%l7 + %g7],	%o3
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%l2
	nop
	set	0x68, %o5
	swap	[%l7 + %o5],	%l5
	set	0x18, %i3
	stda	%l0,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x50, %i0
	std	%f12,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x38]
	set	0x60, %g1
	lda	[%l7 + %g1] 0x88,	%f2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%f0
	nop
	set	0x48, %l0
	stx	%o7,	[%l7 + %l0]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xda
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f18
	ld	[%l7 + 0x10],	%f7
	and	%o6,	%l1,	%i6
	set	0x10, %i5
	swapa	[%l7 + %i5] 0x88,	%i0
	nop
	set	0x1C, %l4
	ldsh	[%l7 + %l4],	%g6
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x81,	%l6
	set	0x6C, %i2
	stwa	%g4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x12, %i4
	sth	%l2,	[%l7 + %i4]
	and	%i7,	%o4,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g7
	set	0x40, %l6
	stda	%i4,	[%l7 + %l6] 0x80
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f16
	set	0x30, %o1
	stxa	%g3,	[%l7 + %o1] 0xea
	membar	#Sync
	or	%o0,	%l4,	%o1
	nop
	set	0x7F, %g3
	ldub	[%l7 + %g3],	%g1
	set	0x66, %g2
	stha	%i1,	[%l7 + %g2] 0x80
	nop
	set	0x58, %g4
	stx	%g2,	[%l7 + %g4]
	fpadd32	%f30,	%f22,	%f28
	and	%g5,	%i2,	%i3
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xeb,	%l2
	set	0x78, %i1
	stxa	%i4,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x3E239E32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x03306118,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f18,	%f20
	nop
	set	0x70, %i7
	ldsb	[%l7 + %i7],	%l0
	set	0x18, %o7
	stda	%o6,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x70, %i6
	std	%l4,	[%l7 + %i6]
	set	0x54, %l5
	sta	%f4,	[%l7 + %l5] 0x80
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x89
	set	0x30, %o0
	stda	%l0,	[%l7 + %o0] 0x88
	st	%fsr,	[%l7 + 0x38]
	set	0x48, %l1
	swapa	[%l7 + %l1] 0x89,	%i6
	nop
	nop
	setx	0xDB9CF407,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x42647123,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f14,	%f0
	nop
	set	0x0E, %o5
	ldub	[%l7 + %o5],	%i0
	nop
	set	0x36, %g7
	sth	%g6,	[%l7 + %g7]
	set	0x60, %i0
	stda	%i6,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x1C, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x31, %l0
	stb	%o6,	[%l7 + %l0]
	nop
	set	0x18, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x53, %o2
	stba	%l2,	[%l7 + %o2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x2C, %g6
	ldstub	[%l7 + %g6],	%i7
	nop
	set	0x0C, %l4
	stw	%g4,	[%l7 + %l4]
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%o2
	or	%o4,	%o5,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o0
	wr	%g3,	%l4,	%softint
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x80,	%o1
	nop
	set	0x48, %l6
	ldsh	[%l7 + %l6],	%g1
	nop
	set	0x30, %i4
	prefetch	[%l7 + %i4],	 3
	st	%f26,	[%l7 + 0x2C]
	nop
	set	0x70, %g5
	ldsw	[%l7 + %g5],	%i1
	or	%g2,	%g5,	%i2
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x0C, %g2
	ldsw	[%l7 + %g2],	%o3
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%l3
	set	0x68, %o6
	swapa	[%l7 + %o6] 0x81,	%i4
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x80,	 2
	nop
	set	0x10, %l3
	std	%f4,	[%l7 + %l3]
	nop
	set	0x2D, %i7
	ldub	[%l7 + %i7],	%i3
	set	0x48, %i1
	ldxa	[%l7 + %i1] 0x80,	%l5
	set	0x5C, %o7
	swapa	[%l7 + %o7] 0x81,	%l1
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%i6
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x0C, %o0
	stb	%o7,	[%l7 + %o0]
	nop
	set	0x73, %i6
	ldub	[%l7 + %i6],	%g6
	nop
	set	0x14, %l1
	lduw	[%l7 + %l1],	%l6
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%o6
	st	%f25,	[%l7 + 0x4C]
	set	0x64, %g7
	sta	%f17,	[%l7 + %g7] 0x80
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%i0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i7
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xd2
	set	0x2B, %l0
	stba	%o2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x57, %l2
	ldstub	[%l7 + %l2],	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAF5, 	%tick_cmpr
	set	0x4C, %g1
	stwa	%i5,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x49, %g6
	ldsb	[%l7 + %g6],	%o0
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f14
	set	0x30, %i5
	stxa	%g7,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x48, %l4
	ldstub	[%l7 + %l4],	%g3
	set	0x1C, %o3
	stha	%o1,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x80,	%g1
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%l4
	nop
	set	0x6D, %i4
	stb	%i1,	[%l7 + %i4]
	set	0x20, %o1
	stxa	%g5,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x68, %g2
	stxa	%g2,	[%l7 + %g2] 0x80
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%o3
	nop
	set	0x1E, %o6
	ldub	[%l7 + %o6],	%l3
	set	0x1F, %g5
	stba	%i4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xe2,	%i2
	nop
	nop
	setx	0x21EB058D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x94B153CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f1,	%f29
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x40, %i1
	stx	%i3,	[%l7 + %i1]
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe2,	%l0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf0
	membar	#Sync
	nop
	set	0x5C, %o4
	lduw	[%l7 + %o4],	%l5
	and	%l1,	%i6,	%o7
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
	nop
	set	0x4B, %o0
	stb	%l6,	[%l7 + %o0]
	set	0x4C, %i6
	stwa	%g6,	[%l7 + %i6] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%l2
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g4
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x2A, %o5
	ldstub	[%l7 + %o5],	%i7
	set	0x50, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x5A, %l0
	ldsb	[%l7 + %l0],	%o4
	nop
	set	0x34, %l2
	swap	[%l7 + %l2],	%i5
	st	%f2,	[%l7 + 0x38]
	nop
	set	0x0F, %i0
	ldstub	[%l7 + %i0],	%g7
	set	0x64, %g1
	sta	%f18,	[%l7 + %g1] 0x80
	st	%f17,	[%l7 + 0x28]
	nop
	set	0x7A, %o2
	sth	%g3,	[%l7 + %o2]
	nop
	set	0x12, %i5
	sth	%o1,	[%l7 + %i5]
	ld	[%l7 + 0x40],	%f26
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%o0
	nop
	set	0x12, %g6
	sth	%l4,	[%l7 + %g6]
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x1A, %o3
	stha	%g1,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x2C, %i2
	lduw	[%l7 + %i2],	%g5
	set	0x40, %i4
	ldxa	[%l7 + %i4] 0x80,	%i1
	nop
	set	0x40, %o1
	sth	%o3,	[%l7 + %o1]
	nop
	set	0x28, %g4
	std	%f0,	[%l7 + %g4]
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x88,	 1
	ld	[%l7 + 0x20],	%f30
	set	0x7E, %g2
	stha	%i4,	[%l7 + %g2] 0x81
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f16
	nop
	set	0x10, %i7
	std	%l2,	[%l7 + %i7]
	set	0x58, %i1
	stha	%i3,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%l0
	set	0x6E, %g5
	stha	%l5,	[%l7 + %g5] 0x80
	nop
	set	0x48, %l5
	ldsb	[%l7 + %l5],	%i2
	nop
	set	0x2A, %o4
	ldub	[%l7 + %o4],	%l1
	set	0x7C, %o0
	lda	[%l7 + %o0] 0x81,	%f7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%l6
	nop
	set	0x70, %i6
	stx	%g6,	[%l7 + %i6]
	nop
	set	0x45, %g3
	ldstub	[%l7 + %g3],	%i6
	add	%i0,	%o6,	%o2
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%g4
	fpsub32s	%f4,	%f14,	%f29
	nop
	set	0x4F, %g7
	ldstub	[%l7 + %g7],	%i7
	nop
	set	0x28, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x63, %o5
	ldub	[%l7 + %o5],	%l2
	nop
	nop
	setx	0xAADEB51E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x6376B573,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f0,	%f18
	st	%fsr,	[%l7 + 0x7C]
	and	%o4,	%o5,	%g7
	nop
	set	0x1C, %l0
	stw	%g3,	[%l7 + %l0]
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f30
	set	0x40, %g1
	stda	%o0,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x44, %o2
	ldsb	[%l7 + %o2],	%o0
	set	0x44, %i5
	stha	%l4,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x6C, %l4
	sth	%g1,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
	nop
	set	0x70, %l6
	stx	%i5,	[%l7 + %l6]
	nop
	set	0x4A, %l2
	ldstub	[%l7 + %l2],	%g5
	nop
	set	0x68, %i2
	stx	%i1,	[%l7 + %i2]
	bne,a,pn	%xcc,	loop_50
	and	%g2,	%o3,	%i4
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%l3
	ld	[%l7 + 0x60],	%f20
loop_50:
	nop
	set	0x19, %o3
	stba	%i3,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x38, %o1
	stda	%l0,	[%l7 + %o1] 0x80
	or	%l5,	%l1,	%o7
	nop
	set	0x3C, %o6
	stw	%l6,	[%l7 + %o6]
	set	0x30, %g4
	stda	%i2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x44, %l3
	lduh	[%l7 + %l3],	%g6
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x88,	%i0
	nop
	set	0x44, %i1
	ldsw	[%l7 + %i1],	%i6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%o6
	nop
	set	0x40, %g2
	std	%f10,	[%l7 + %g2]
	set	0x7C, %g5
	swapa	[%l7 + %g5] 0x88,	%g4
	set	0x54, %l5
	lda	[%l7 + %l5] 0x89,	%f9
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x80,	%i7
	nop
	set	0x64, %o0
	lduh	[%l7 + %o0],	%l2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f16
	set	0x08, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o4
	st	%f22,	[%l7 + 0x08]
	nop
	set	0x34, %i6
	ldsb	[%l7 + %i6],	%o5
	nop
	set	0x08, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x3E, %g7
	stha	%g3,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x88,	%o1
	nop
	set	0x40, %o5
	std	%f10,	[%l7 + %o5]
	set	0x23, %l0
	ldstuba	[%l7 + %l0] 0x88,	%g7
	ld	[%l7 + 0x18],	%f4
	nop
	set	0x40, %g1
	std	%o0,	[%l7 + %g1]
	set	0x20, %i0
	sta	%f13,	[%l7 + %i0] 0x81
	set	0x48, %o2
	stda	%l4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x5C, %i5
	swap	[%l7 + %i5],	%i5
	set	0x18, %g6
	stwa	%g1,	[%l7 + %g6] 0x80
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%g4
	set	0x7A, %l4
	stba	%g2,	[%l7 + %l4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	fpsub16	%f8,	%f24,	%f16
	set	0x74, %i2
	stha	%o3,	[%l7 + %i2] 0x80
	set	0x38, %l2
	stxa	%i1,	[%l7 + %l2] 0x80
	set	0x18, %i4
	stwa	%l3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x5C, %o1
	lduw	[%l7 + %o1],	%i3
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x89,	%i4
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x80,	%l0
	set	0x68, %o3
	stxa	%l5,	[%l7 + %o3] 0x89
	nop
	set	0x10, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%l1
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xeb,	%i6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe3,	%i2
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x80,	%g6
	nop
	set	0x4A, %l5
	ldub	[%l7 + %l5],	%o7
	nop
	set	0x26, %o0
	ldub	[%l7 + %o0],	%i0
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%i6
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%o6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf0
	membar	#Sync
	nop
	set	0x10, %i6
	ldstub	[%l7 + %i6],	%g4
	ld	[%l7 + 0x20],	%f25
	nop
	set	0x56, %l1
	ldsb	[%l7 + %l1],	%i7
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%l2
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x30, %l0
	std	%f18,	[%l7 + %l0]
	fpadd32s	%f15,	%f27,	%f26
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
	nop
	set	0x74, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x2A, %g1
	ldub	[%l7 + %g1],	%o4
	nop
	set	0x50, %o2
	std	%o4,	[%l7 + %o2]
	wr	%g3,	%g7,	%y
	nop
	set	0x1C, %i5
	ldsh	[%l7 + %i5],	%o1
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x17, %l6
	stb	%o0,	[%l7 + %l6]
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%i5
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%g0
	nop
	set	0x38, %i4
	swap	[%l7 + %i4],	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%o3
	set	0x3E, %i2
	stha	%i1,	[%l7 + %i2] 0x80
	set	0x24, %o1
	stha	%g2,	[%l7 + %o1] 0x80
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i3
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%l0
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xe3,	%i4
	nop
	set	0x3A, %o3
	sth	%l1,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x5C, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x08, %l3
	prefetch	[%l7 + %l3],	 0
	nop
	set	0x23, %i1
	ldub	[%l7 + %i1],	%l5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%g6
	nop
	set	0x3C, %g5
	lduw	[%l7 + %g5],	%l6
	nop
	set	0x60, %g2
	std	%f12,	[%l7 + %g2]
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x81,	 4
	set	0x38, %o7
	stha	%o7,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%i6
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0
	bleu,a	%icc,	loop_51
	nop
	set	0x44, %i6
	ldstub	[%l7 + %i6],	%i7
	set	0x78, %l1
	stwa	%l2,	[%l7 + %l1] 0xe2
	membar	#Sync
loop_51:
	nop
	set	0x48, %g7
	ldub	[%l7 + %g7],	%o6
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%o2
	and	%o5,	%g3,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%o1
	nop
	set	0x30, %l0
	std	%f30,	[%l7 + %l0]
	fpsub32	%f14,	%f2,	%f10
	fpsub16s	%f0,	%f26,	%f13
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 1
	set	0x7B, %i0
	ldstuba	[%l7 + %i0] 0x89,	%i5
	nop
	set	0x48, %g1
	std	%f22,	[%l7 + %g1]
	add	%g1,	%l4,	%o0
	set	0x4C, %o4
	sta	%f2,	[%l7 + %o4] 0x80
	set	0x44, %i5
	swapa	[%l7 + %i5] 0x80,	%g5
	and	%o3,	%i1,	%g2
	set	0x6C, %g6
	stwa	%l3,	[%l7 + %g6] 0x81
	nop
	set	0x78, %l6
	ldsh	[%l7 + %l6],	%l0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd0
	or	%i4,	%i3,	%l5
	nop
	set	0x40, %l2
	swap	[%l7 + %l2],	%i2
	set	0x18, %i4
	swapa	[%l7 + %i4] 0x81,	%l1
	nop
	set	0x66, %l4
	ldub	[%l7 + %l4],	%l6
	set	0x24, %o1
	stwa	%i0,	[%l7 + %o1] 0x88
	set	0x70, %g4
	stda	%o6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc0
	add	%g6,	%i6,	%g4
	set	0x29, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l2
	nop
	set	0x20, %o3
	stx	%o6,	[%l7 + %o3]
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x89,	%o2
	nop
	set	0x0A, %i7
	lduh	[%l7 + %i7],	%o5
	nop
	set	0x08, %i1
	stx	%g3,	[%l7 + %i1]
	nop
	set	0x50, %g2
	std	%f24,	[%l7 + %g2]
	nop
	set	0x5C, %o0
	swap	[%l7 + %o0],	%i7
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x26, %l5
	stba	%o1,	[%l7 + %l5] 0x81
	add	%i5,	%o4,	%l4
	nop
	set	0x58, %g3
	lduw	[%l7 + %g3],	%g1
	set	0x58, %l1
	stxa	%o0,	[%l7 + %l1] 0x88
	nop
	set	0x10, %g7
	ldsh	[%l7 + %g7],	%o3
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	wr	%g2,	%l3,	%y
	set	0x68, %l0
	stxa	%l0,	[%l7 + %l0] 0xe3
	membar	#Sync
	and	%g5,	%i3,	%l5
	set	0x29, %o5
	stba	%i2,	[%l7 + %o5] 0x81
	nop
	set	0x1E, %i0
	lduh	[%l7 + %i0],	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i0
	set	0x5F, %g1
	ldstuba	[%l7 + %g1] 0x88,	%l1
	set	0x68, %i6
	sta	%f27,	[%l7 + %i6] 0x80
	nop
	set	0x26, %i5
	ldsh	[%l7 + %i5],	%o7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f0
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%g6
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x80,	%g4
	st	%fsr,	[%l7 + 0x08]
	st	%f25,	[%l7 + 0x3C]
	wr 	%g0, 	0x5, 	%fprs
	set	0x14, %l2
	lda	[%l7 + %l2] 0x89,	%f15
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x54, %o2
	lduw	[%l7 + %o2],	%o2
	nop
	set	0x40, %i4
	stx	%o6,	[%l7 + %i4]
	nop
	set	0x40, %o1
	stx	%g3,	[%l7 + %o1]
	nop
	set	0x08, %l4
	std	%f28,	[%l7 + %l4]
	st	%f18,	[%l7 + 0x64]
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%o5
	ble,a,pn	%icc,	loop_52
	fpsub32	%f0,	%f30,	%f8
	nop
	set	0x58, %o6
	std	%g6,	[%l7 + %o6]
	set	0x3E, %o3
	ldstuba	[%l7 + %o3] 0x89,	%i7
loop_52:
	nop
	set	0x1B, %i2
	ldub	[%l7 + %i2],	%o1
	set	0x0B, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o4
	set	0x48, %i7
	sta	%f31,	[%l7 + %i7] 0x81
	nop
	set	0x34, %g2
	ldsb	[%l7 + %g2],	%l4
	set	0x30, %i1
	lda	[%l7 + %i1] 0x89,	%f11
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x54, %o7
	ldsw	[%l7 + %o7],	%g1
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f30
	fpsub32	%f30,	%f12,	%f22
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%o3
	st	%f31,	[%l7 + 0x1C]
	bg,pn	%xcc,	loop_53
	nop
	set	0x66, %l5
	sth	%o0,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x78, %o0
	std	%f26,	[%l7 + %o0]
loop_53:
	nop
	set	0x20, %g3
	stw	%i1,	[%l7 + %g3]
	nop
	set	0x2A, %l1
	ldub	[%l7 + %l1],	%g2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x88
	nop
	set	0x74, %l0
	lduh	[%l7 + %l0],	%l3
	nop
	set	0x28, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%i3
	set	0x28, %o5
	stda	%l4,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x80,	%f4
	st	%f21,	[%l7 + 0x28]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i4
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	and	%i2,	%l6,	%l1
	set	0x24, %i5
	stwa	%i0,	[%l7 + %i5] 0xe2
	membar	#Sync
	or	%o7,	%g6,	%l2
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x88,	%g4
	set	0x38, %g1
	stxa	%o2,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x14, %l6
	prefetch	[%l7 + %l6],	 1
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x81,	%o6
	or	%i6,	%o5,	%g3
	set	0x48, %g6
	stwa	%g7,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f18
	be,a	%xcc,	loop_54
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x55, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o1
loop_54:
	or	%i7,	%o4,	%g1
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x81,	%i5
	set	0x3C, %o6
	ldstuba	[%l7 + %o6] 0x88,	%l4
	or	%o0,	%o3,	%g2
	or	%i1,	%l0,	%i3
	add	%l3,	%g5,	%i4
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	set	0x5C, %o1
	lda	[%l7 + %o1] 0x89,	%f2
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%i2
	nop
	set	0x30, %i7
	std	%l0,	[%l7 + %i7]
	nop
	set	0x32, %i2
	lduh	[%l7 + %i2],	%l6
	set	0x4C, %g2
	sta	%f17,	[%l7 + %g2] 0x88
	nop
	set	0x0B, %i1
	stb	%i0,	[%l7 + %i1]
	nop
	set	0x58, %o7
	ldub	[%l7 + %o7],	%o7
	set	0x40, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f6
	nop
	set	0x43, %g3
	ldstub	[%l7 + %g3],	%o2
	st	%fsr,	[%l7 + 0x64]
	and	%o6,	%o5,	%g3
	nop
	set	0x7C, %l5
	swap	[%l7 + %l5],	%i6
	nop
	set	0x72, %l1
	sth	%o1,	[%l7 + %l1]
	bl,pt	%xcc,	loop_55
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x16, %l0
	lduh	[%l7 + %l0],	%i7
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%g7
loop_55:
	nop
	set	0x68, %o5
	stxa	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	or	%g1,	%i5,	%l4
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%o2
	set	0x48, %i6
	stda	%g2,	[%l7 + %i6] 0x89
	set	0x4C, %i3
	stba	%i1,	[%l7 + %i3] 0x88
	nop
	set	0x10, %o4
	ldx	[%l7 + %o4],	%o0
	set	0x70, %g1
	stda	%i2,	[%l7 + %g1] 0x88
	nop
	set	0x28, %l6
	lduw	[%l7 + %l6],	%l3
	nop
	set	0x4A, %l2
	ldsb	[%l7 + %l2],	%g5
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x58, %i4
	stx	%i4,	[%l7 + %i4]
	st	%f21,	[%l7 + 0x5C]
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%l4
	fpsub16	%f8,	%f4,	%f24
	nop
	set	0x78, %g6
	std	%f30,	[%l7 + %g6]
	nop
	set	0x78, %l4
	sth	%l0,	[%l7 + %l4]
	set	0x60, %g4
	lda	[%l7 + %g4] 0x81,	%f17
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%l6
	fpadd16	%f28,	%f0,	%f14
	nop
	set	0x3C, %o6
	sth	%i2,	[%l7 + %o6]
	add	%i0,	%o7,	%l2
	nop
	set	0x10, %o1
	stw	%g4,	[%l7 + %o1]
	nop
	set	0x1F, %o3
	ldub	[%l7 + %o3],	%g6
	nop
	set	0x24, %l3
	stb	%o2,	[%l7 + %l3]
	nop
	set	0x78, %i7
	std	%o6,	[%l7 + %i7]
	set	0x68, %i2
	lda	[%l7 + %i2] 0x88,	%f2
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%g3
	nop
	set	0x30, %o7
	std	%i6,	[%l7 + %o7]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f0
	nop
	set	0x78, %g5
	stx	%o1,	[%l7 + %g5]
	or	%o5,	%g7,	%i7
	nop
	set	0x47, %g3
	ldub	[%l7 + %g3],	%o4
	nop
	set	0x4A, %o0
	ldsh	[%l7 + %o0],	%i5
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%f6
	set	0x30, %l1
	stwa	%l4,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x53, %l0
	ldub	[%l7 + %l0],	%o3
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%i1
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x38, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x3A, %i3
	sth	%i3,	[%l7 + %i3]
	set	0x6F, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l3
	set	0x1F, %o4
	stba	%g5,	[%l7 + %o4] 0x80
	and	%o0,	%l5,	%l0
	set	0x60, %l6
	stda	%i4,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%l1
	st	%f26,	[%l7 + 0x10]
	nop
	set	0x5C, %g1
	swap	[%l7 + %g1],	%i2
	and	%i0,	%o7,	%l6
	set	0x1C, %i5
	lda	[%l7 + %i5] 0x89,	%f1
	or	%l2,	%g4,	%g6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%g3
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x81,	%i6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%o5
	nop
	set	0x20, %o2
	std	%f16,	[%l7 + %o2]
	set	0x48, %g6
	stha	%o2,	[%l7 + %g6] 0xea
	membar	#Sync
	fpadd32	%f28,	%f10,	%f4
	nop
	set	0x68, %l4
	std	%f12,	[%l7 + %l4]
	add	%g7,	%o4,	%i7
	bg,a,pt	%xcc,	loop_56
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%i5
	set	0x58, %g4
	stxa	%o3,	[%l7 + %g4] 0xe2
	membar	#Sync
loop_56:
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 4
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f16
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f0
	fpadd16s	%f30,	%f14,	%f8
	nop
	set	0x34, %o1
	lduw	[%l7 + %o1],	%g2
	set	0x38, %i2
	ldxa	[%l7 + %i2] 0x80,	%l4
	nop
	set	0x70, %o7
	swap	[%l7 + %o7],	%i1
	nop
	set	0x62, %i1
	ldsh	[%l7 + %i1],	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%l3
	ld	[%l7 + 0x5C],	%f31
	bgu	%icc,	loop_57
	bleu,a	%xcc,	loop_58
	nop
	set	0x68, %g2
	ldsw	[%l7 + %g2],	%o0
	ld	[%l7 + 0x68],	%f8
loop_57:
	or	%l5,	%g5,	%i4
loop_58:
	nop
	set	0x30, %g3
	std	%f28,	[%l7 + %g3]
	nop
	set	0x6C, %g5
	ldsw	[%l7 + %g5],	%l0
	nop
	set	0x60, %o0
	swap	[%l7 + %o0],	%l1
	nop
	set	0x4C, %l5
	swap	[%l7 + %l5],	%i2
	fpsub32s	%f26,	%f7,	%f6
	nop
	set	0x70, %l1
	stx	%o7,	[%l7 + %l1]
	set	0x38, %l0
	sta	%f3,	[%l7 + %l0] 0x80
	set	0x10, %o5
	lda	[%l7 + %o5] 0x80,	%f30
	nop
	set	0x18, %i0
	std	%i6,	[%l7 + %i0]
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%l2
	nop
	set	0x24, %i3
	lduh	[%l7 + %i3],	%g4
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f16
	set	0x4C, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i0
	nop
	set	0x74, %l2
	ldsw	[%l7 + %l2],	%o6
	add	%g3,	%g6,	%o1
	set	0x70, %g1
	prefetcha	[%l7 + %g1] 0x88,	 0
	nop
	set	0x68, %g7
	swap	[%l7 + %g7],	%i6
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf9
	membar	#Sync
	set	0x20, %o2
	stda	%o2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x30, %i5
	prefetcha	[%l7 + %i5] 0x88,	 2
	and	%o4,	%i7,	%o3
	nop
	set	0x12, %l4
	ldsb	[%l7 + %l4],	%i5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f0
	nop
	set	0x48, %g4
	std	%l4,	[%l7 + %g4]
	set	0x2A, %o6
	stha	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f16
	nop
	set	0x70, %l3
	stx	%i1,	[%l7 + %l3]
	nop
	set	0x18, %o1
	std	%f0,	[%l7 + %o1]
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%i3
	nop
	set	0x78, %i1
	std	%f20,	[%l7 + %i1]
	nop
	set	0x10, %o7
	std	%f8,	[%l7 + %o7]
	nop
	set	0x20, %g2
	stx	%g1,	[%l7 + %g2]
	st	%f18,	[%l7 + 0x34]
	nop
	set	0x62, %g3
	sth	%o0,	[%l7 + %g3]
	set	0x10, %g5
	stda	%l4,	[%l7 + %g5] 0x88
	and	%l3,	%i4,	%l0
	set	0x4C, %o0
	stwa	%l1,	[%l7 + %o0] 0x89
	nop
	set	0x28, %l1
	stx	%i2,	[%l7 + %l1]
	wr	%g5,	%o7,	%ccr
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l2
	nop
	set	0x4E, %l0
	ldstub	[%l7 + %l0],	%i0
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%g4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%g3
	nop
	set	0x48, %l5
	prefetch	[%l7 + %l5],	 2
	nop
	set	0x0C, %o4
	sth	%g6,	[%l7 + %o4]
	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%f18
	nop
	set	0x2F, %g1
	stb	%o6,	[%l7 + %g1]
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x4C, %i4
	lduw	[%l7 + %i4],	%i6
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f10
	nop
	set	0x29, %i5
	ldstub	[%l7 + %i5],	%o1
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x3D, %l4
	ldstub	[%l7 + %l4],	%g7
	nop
	nop
	setx	0x8B970F7C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xE988148A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f27,	%f6
	nop
	set	0x18, %g6
	ldstub	[%l7 + %g6],	%o2
	fpadd32s	%f1,	%f7,	%f4
	nop
	set	0x24, %l2
	ldsh	[%l7 + %l2],	%o4
	nop
	set	0x5A, %g4
	sth	%i7,	[%l7 + %g4]
	nop
	nop
	setx	0xB4AA305D6BF5AF20,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBA548E1227DD3115,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f30
	set	0x58, %o6
	stda	%i4,	[%l7 + %o6] 0x81
	nop
	set	0x17, %i7
	ldub	[%l7 + %i7],	%o3
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x89,	%l4
	and	%i1,	%g2,	%i3
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%g1
	nop
	set	0x10, %l3
	stx	%o0,	[%l7 + %l3]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	nop
	set	0x40, %i1
	sth	%l3,	[%l7 + %i1]
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x89,	 4
	nop
	set	0x52, %g3
	lduh	[%l7 + %g3],	%l0
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x89,	%i4
	bg,a,pt	%xcc,	loop_59
	st	%fsr,	[%l7 + 0x24]
	and	%l1,	%g5,	%i2
	bleu,a,pt	%icc,	loop_60
loop_59:
	nop
	set	0x60, %o0
	std	%f14,	[%l7 + %o0]
	set	0x18, %l1
	sta	%f2,	[%l7 + %l1] 0x88
loop_60:
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x48, %o5
	prefetch	[%l7 + %o5],	 1
	set	0x10, %i0
	stxa	%o7,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x54, %l0
	lda	[%l7 + %l0] 0x88,	%f23
	set	0x24, %i6
	stwa	%l2,	[%l7 + %i6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x70, %l5
	std	%i6,	[%l7 + %l5]
	set	0x25, %o4
	stba	%g4,	[%l7 + %o4] 0x81
	nop
	set	0x64, %l6
	swap	[%l7 + %l6],	%i0
	add	%g3,	%o6,	%g6
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%o4
	set	0x18, %i3
	lda	[%l7 + %i3] 0x81,	%f26
	nop
	set	0x68, %g7
	stw	%o1,	[%l7 + %g7]
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%i6
	st	%fsr,	[%l7 + 0x28]
	fpadd16s	%f30,	%f16,	%f21
	nop
	set	0x34, %i5
	sth	%o2,	[%l7 + %i5]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	nop
	set	0x10, %g6
	std	%f20,	[%l7 + %g6]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i7
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x81,	%i5
	nop
	set	0x6C, %i4
	stb	%o3,	[%l7 + %i4]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc4
	nop
	set	0x30, %i7
	lduh	[%l7 + %i7],	%l4
	st	%f14,	[%l7 + 0x14]
	nop
	set	0x75, %g4
	ldstub	[%l7 + %g4],	%i1
	set	0x74, %o1
	stwa	%g7,	[%l7 + %o1] 0x89
	nop
	set	0x0C, %l3
	prefetch	[%l7 + %l3],	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g1
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%l3
	nop
	set	0x60, %g2
	ldsh	[%l7 + %g2],	%l5
	fpadd32	%f14,	%f28,	%f4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%i4
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x20, %i1
	ldsh	[%l7 + %i1],	%l1
	nop
	set	0x7E, %o0
	sth	%g5,	[%l7 + %o0]
	fpadd32	%f30,	%f30,	%f14
	set	0x3A, %l1
	stha	%o0,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x12, %o7
	lduh	[%l7 + %o7],	%o7
	nop
	set	0x38, %o5
	swap	[%l7 + %o5],	%i2
	nop
	set	0x3C, %g5
	ldsb	[%l7 + %g5],	%l2
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0
	nop
	set	0x44, %l0
	ldsh	[%l7 + %l0],	%i0
	set	0x77, %i6
	stba	%g3,	[%l7 + %i6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x20],	%f6
	nop
	set	0x3E, %o4
	ldsh	[%l7 + %o4],	%g4
	nop
	set	0x6C, %l5
	swap	[%l7 + %l5],	%o6
	fpadd16s	%f0,	%f13,	%f9
	or	%g6,	%o5,	%o1
	set	0x69, %l6
	stba	%o2,	[%l7 + %l6] 0x88
	nop
	set	0x40, %i3
	swap	[%l7 + %i3],	%o4
	nop
	set	0x12, %g1
	ldsb	[%l7 + %g1],	%i6
	set	0x28, %g7
	stda	%i4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x32, %i5
	stha	%o3,	[%l7 + %i5] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i7
	nop
	set	0x10, %o2
	stx	%i1,	[%l7 + %o2]
	nop
	set	0x20, %g6
	std	%f2,	[%l7 + %g6]
	nop
	set	0x16, %l2
	sth	%i3,	[%l7 + %l2]
	set	0x4A, %l4
	stha	%g7,	[%l7 + %l4] 0xe2
	membar	#Sync
	fpsub32	%f4,	%f6,	%f14
	set	0x58, %o6
	stda	%g0,	[%l7 + %o6] 0x89
	add	%l3,	%l5,	%g2
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x88,	 3
	add	%i4,	%g5,	%o0
	nop
	set	0x18, %g4
	stw	%o7,	[%l7 + %g4]
	set	0x48, %i7
	stha	%l1,	[%l7 + %i7] 0x89
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%l2
	nop
	set	0x64, %l3
	lduh	[%l7 + %l3],	%i2
	set	0x60, %o3
	lda	[%l7 + %o3] 0x88,	%f10
	st	%fsr,	[%l7 + 0x0C]
	set	0x52, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l6
	nop
	set	0x4D, %g3
	ldsb	[%l7 + %g3],	%i0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc8
	and	%g4,	%g3,	%g6
	set	0x40, %i1
	stda	%o6,	[%l7 + %i1] 0xe2
	membar	#Sync
	fpadd32	%f4,	%f10,	%f28
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x68, %o0
	std	%o4,	[%l7 + %o0]
	set	0x0A, %o7
	stha	%o1,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x28, %o5
	std	%f0,	[%l7 + %o5]
	and	%i5,	%i6,	%o3
	nop
	set	0x3C, %g5
	stw	%i7,	[%l7 + %g5]
	nop
	set	0x58, %l1
	ldsb	[%l7 + %l1],	%l4
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x34, %i0
	stw	%i1,	[%l7 + %i0]
	nop
	set	0x7B, %o4
	stb	%i3,	[%l7 + %o4]
	set	0x2A, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g1
	or	%g7,	%l5,	%g2
	ld	[%l7 + 0x44],	%f28
	nop
	set	0x56, %l6
	stb	%l3,	[%l7 + %l6]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l0
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x28, %i3
	lduw	[%l7 + %i3],	%g5
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x80,	 1
	nop
	set	0x70, %i5
	stx	%l1,	[%l7 + %i5]
	set	0x78, %g7
	prefetcha	[%l7 + %g7] 0x80,	 3
	nop
	set	0x56, %g6
	ldsh	[%l7 + %g6],	%l2
	nop
	set	0x58, %l2
	ldsh	[%l7 + %l2],	%i0
	nop
	set	0x7C, %l4
	stw	%g4,	[%l7 + %l4]
	set	0x78, %o6
	stxa	%l6,	[%l7 + %o6] 0xeb
	membar	#Sync
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x70, %i4
	lduh	[%l7 + %i4],	%o5
	nop
	set	0x60, %g4
	std	%f20,	[%l7 + %g4]
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x88,	 3
	nop
	set	0x18, %l3
	swap	[%l7 + %l3],	%o2
	nop
	set	0x10, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x25, %i2
	ldsb	[%l7 + %i2],	%o4
	set	0x58, %o3
	stwa	%o1,	[%l7 + %o3] 0x88
	or	%i6,	%i5,	%i7
	set	0x6C, %g3
	sta	%f19,	[%l7 + %g3] 0x80
	nop
	set	0x4E, %i1
	ldsh	[%l7 + %i1],	%l4
	set	0x08, %g2
	lda	[%l7 + %g2] 0x80,	%f29
	set	0x32, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o3
	nop
	set	0x18, %o5
	std	%f4,	[%l7 + %o5]
	or	%i3,	%g1,	%i1
	nop
	set	0x7A, %g5
	sth	%g7,	[%l7 + %g5]
	nop
	set	0x60, %l1
	std	%f8,	[%l7 + %l1]
	set	0x68, %o7
	stda	%g2,	[%l7 + %o7] 0xeb
	membar	#Sync
	bge,a,pn	%icc,	loop_61
	nop
	set	0x1E, %i0
	sth	%l3,	[%l7 + %i0]
	ld	[%l7 + 0x24],	%f20
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf0
	membar	#Sync
loop_61:
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%i4
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%l5
	nop
	set	0x7D, %i6
	ldub	[%l7 + %i6],	%o0
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%l0
	set	0x10, %g1
	stxa	%o7,	[%l7 + %g1] 0x81
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	nop
	set	0x62, %g7
	ldsb	[%l7 + %g7],	%i2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xda
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x89,	%g5
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%i0
	set	0x18, %o6
	stwa	%g4,	[%l7 + %o6] 0x81
	nop
	set	0x20, %g6
	stw	%l2,	[%l7 + %g6]
	ld	[%l7 + 0x3C],	%f14
	st	%fsr,	[%l7 + 0x28]
	nop
	nop
	setx	0x60B57F79,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xDD7A0AAC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f1,	%f17
	set	0x10, %i4
	stda	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x64, %o2
	ldsw	[%l7 + %o2],	%o6
	nop
	set	0x72, %g4
	ldsh	[%l7 + %g4],	%o5
	nop
	set	0x77, %l3
	ldstub	[%l7 + %l3],	%l6
	set	0x68, %o1
	stxa	%o2,	[%l7 + %o1] 0x80
	add	%g6,	%o4,	%o1
	set	0x68, %i7
	sta	%f9,	[%l7 + %i7] 0x88
	set	0x58, %i2
	sta	%f3,	[%l7 + %i2] 0x81
	nop
	set	0x2C, %o3
	stw	%i5,	[%l7 + %o3]
	nop
	set	0x44, %i1
	lduh	[%l7 + %i1],	%i6
	and	%i7,	%l4,	%i3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f0
	set	0x58, %o0
	ldxa	[%l7 + %o0] 0x89,	%o3
	set	0x78, %o5
	stda	%g0,	[%l7 + %o5] 0x89
	nop
	set	0x6C, %g5
	sth	%g7,	[%l7 + %g5]
	nop
	set	0x20, %l1
	ldsw	[%l7 + %l1],	%g2
	or	%l3,	%i1,	%i4
	or	%l5,	%o0,	%o7
	add	%l0,	%i2,	%l1
	set	0x35, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i0
	st	%f25,	[%l7 + 0x48]
	nop
	set	0x0C, %i0
	lduh	[%l7 + %i0],	%g5
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x70, %o4
	stb	%l2,	[%l7 + %o4]
	nop
	set	0x50, %l5
	stx	%g3,	[%l7 + %l5]
	set	0x10, %l0
	stxa	%g4,	[%l7 + %l0] 0x81
	set	0x50, %g3
	stha	%o5,	[%l7 + %g3] 0x89
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x89,	%o6
	nop
	set	0x58, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x68, %i3
	lduh	[%l7 + %i3],	%o2
	wr	%l6,	%g6,	%softint
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x45, %i5
	ldub	[%l7 + %i5],	%o1
	set	0x44, %l4
	stwa	%i6,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x08, %o6
	stw	%i5,	[%l7 + %o6]
	set	0x30, %g6
	stxa	%i7,	[%l7 + %g6] 0x88
	nop
	set	0x56, %i4
	stb	%l4,	[%l7 + %i4]
	nop
	set	0x24, %o2
	lduw	[%l7 + %o2],	%i3
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x88,	%g1
	set	0x39, %l3
	stba	%o3,	[%l7 + %l3] 0x81
	nop
	set	0x70, %g4
	prefetch	[%l7 + %g4],	 4
	set	0x60, %o1
	sta	%f1,	[%l7 + %o1] 0x88
	set	0x58, %i2
	stwa	%g7,	[%l7 + %i2] 0x80
	nop
	set	0x50, %o3
	std	%l2,	[%l7 + %o3]
	or	%i1,	%i4,	%l5
	set	0x50, %i7
	stda	%g2,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x23, %g2
	stba	%o0,	[%l7 + %g2] 0x89
	nop
	set	0x20, %o0
	swap	[%l7 + %o0],	%o7
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x88,	%l0
	bgu,a,pt	%icc,	loop_62
	nop
	set	0x46, %g5
	ldsh	[%l7 + %g5],	%l1
	set	0x48, %l1
	sta	%f5,	[%l7 + %l1] 0x81
loop_62:
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%i2
	set	0x30, %o7
	ldda	[%l7 + %o7] 0x81,	%l2
	set	0x34, %l0
	stba	%g5,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x10, %l5
	stx	%g4,	[%l7 + %l5]
	and	%o5,	%g3,	%o6
	set	0x28, %g3
	stwa	%o2,	[%l7 + %g3] 0x81
	nop
	set	0x30, %g1
	sth	%g6,	[%l7 + %g1]
	or	%o4,	%o1,	%i6
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%f22
	nop
	set	0x42, %i3
	lduh	[%l7 + %i3],	%i5
	bgu,pt	%xcc,	loop_63
	nop
	set	0x62, %g7
	sth	%l6,	[%l7 + %g7]
	st	%f23,	[%l7 + 0x08]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l4
loop_63:
	nop
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x81,	%i2
	nop
	set	0x56, %l4
	lduh	[%l7 + %l4],	%o3
	set	0x7C, %i5
	stwa	%g7,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%g1
	bge	%icc,	loop_64
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%l3
	nop
	set	0x50, %i4
	stw	%i4,	[%l7 + %i4]
	ld	[%l7 + 0x30],	%f15
loop_64:
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%i0
	set	0x08, %l3
	sta	%f25,	[%l7 + %l3] 0x88
	nop
	set	0x1A, %l2
	lduh	[%l7 + %l2],	%g2
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%l5
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	nop
	set	0x20, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x18, %g2
	sth	%o0,	[%l7 + %g2]
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%l0
	fpsub16s	%f13,	%f25,	%f23
	set	0x2C, %o5
	stha	%i0,	[%l7 + %o5] 0x89
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%l2
	nop
	set	0x78, %i2
	ldsw	[%l7 + %i2],	%i2
	nop
	set	0x74, %g5
	lduh	[%l7 + %g5],	%g4
	nop
	set	0x10, %l1
	std	%g4,	[%l7 + %l1]
	ld	[%l7 + 0x54],	%f7
	nop
	set	0x28, %i1
	stw	%g3,	[%l7 + %i1]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f12
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x88,	%o5
	nop
	set	0x6C, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x7C, %l0
	swap	[%l7 + %l0],	%o2
	nop
	set	0x1C, %g3
	sth	%o6,	[%l7 + %g3]
	nop
	set	0x28, %g1
	std	%g6,	[%l7 + %g1]
	set	0x50, %l6
	swapa	[%l7 + %l6] 0x80,	%o4
	set	0x60, %l5
	swapa	[%l7 + %l5] 0x88,	%i6
	bge	%icc,	loop_65
	nop
	set	0x7C, %g7
	stw	%o1,	[%l7 + %g7]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x80
loop_65:
	nop
	set	0x18, %l4
	std	%f0,	[%l7 + %l4]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x88
	and	%l6,	%i7,	%i5
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%i3
	nop
	set	0x70, %i5
	lduh	[%l7 + %i5],	%l4
	ld	[%l7 + 0x38],	%f20
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f30
	set	0x0E, %o2
	stha	%g7,	[%l7 + %o2] 0x80
	or	%g1,	%l3,	%o3
	nop
	set	0x78, %i4
	lduw	[%l7 + %i4],	%i1
	add	%g2,	%l5,	%o7
	nop
	set	0x5F, %l3
	ldub	[%l7 + %l3],	%i4
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	nop
	set	0x4C, %l2
	lduw	[%l7 + %l2],	%o0
	nop
	set	0x20, %o3
	ldsw	[%l7 + %o3],	%i0
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%l1
	set	0x79, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l2
	set	0x08, %o0
	prefetcha	[%l7 + %o0] 0x80,	 1
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%l0
	nop
	set	0x38, %i2
	std	%g4,	[%l7 + %i2]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd8
	set	0x70, %l1
	stda	%g4,	[%l7 + %l1] 0x81
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x89,	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%o6
	bgu	%icc,	loop_66
	st	%f31,	[%l7 + 0x64]
	set	0x30, %o4
	stwa	%o2,	[%l7 + %o4] 0xe3
	membar	#Sync
loop_66:
	nop
	set	0x28, %i1
	stxa	%o4,	[%l7 + %i1] 0x89
	st	%f11,	[%l7 + 0x68]
	and	%i6,	%g6,	%l6
	nop
	set	0x70, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%i7
	set	0x6C, %g3
	lda	[%l7 + %g3] 0x80,	%f0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f16
	be,a,pt	%icc,	loop_67
	ld	[%l7 + 0x44],	%f25
	or	%o1,	%i5,	%i3
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%l4
loop_67:
	nop
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x88,	%g7
	set	0x50, %g7
	stda	%g0,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x43, %i6
	stb	%l3,	[%l7 + %i6]
	set	0x30, %l0
	sta	%f27,	[%l7 + %l0] 0x81
	and	%i1,	%g2,	%o3
	fpadd16	%f8,	%f22,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%l5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xda
	nop
	set	0x30, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x14, %i5
	sth	%o0,	[%l7 + %i5]
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xe3,	%i4
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x88,	%l0
	set	0x77, %i4
	stba	%l2,	[%l7 + %i4] 0x88
	nop
	set	0x20, %l3
	std	%i2,	[%l7 + %l3]
	nop
	set	0x42, %o1
	ldsb	[%l7 + %o1],	%l0
	nop
	set	0x60, %o6
	ldsh	[%l7 + %o6],	%i0
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f14
	set	0x3C, %o3
	sta	%f10,	[%l7 + %o3] 0x89
	st	%f17,	[%l7 + 0x0C]
	set	0x38, %i7
	stda	%g4,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f0
	set	0x54, %g2
	sta	%f28,	[%l7 + %g2] 0x88
	set	0x54, %g4
	swapa	[%l7 + %g4] 0x81,	%o5
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x80,	%g3
	fpadd16	%f16,	%f28,	%f6
	set	0x7C, %l1
	lda	[%l7 + %l1] 0x89,	%f11
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf8
	membar	#Sync
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g4
	nop
	set	0x68, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x52, %i1
	sth	%o6,	[%l7 + %i1]
	fpsub16	%f18,	%f2,	%f10
	set	0x08, %o7
	lda	[%l7 + %o7] 0x80,	%f7
	set	0x50, %g3
	sta	%f9,	[%l7 + %g3] 0x89
	nop
	set	0x16, %g1
	ldub	[%l7 + %g1],	%o4
	and	%i6,	%o2,	%g6
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f8
	nop
	set	0x0E, %l5
	lduh	[%l7 + %l5],	%i7
	nop
	set	0x30, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x60, %g7
	stw	%o1,	[%l7 + %g7]
	or	%i3,	%l4,	%g7
	set	0x14, %l0
	lda	[%l7 + %l0] 0x89,	%f27
	add	%i5,	%g1,	%i1
	nop
	set	0x10, %l4
	ldsw	[%l7 + %l4],	%l3
	set	0x54, %i6
	stwa	%g2,	[%l7 + %i6] 0x80
	set	0x56, %i3
	stha	%o7,	[%l7 + %i3] 0x80
	add	%o3,	%o0,	%l5
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x80,	 4
	ble,a,pn	%xcc,	loop_68
	fpadd16s	%f22,	%f19,	%f19
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%l2
	nop
	set	0x38, %g6
	std	%l0,	[%l7 + %g6]
loop_68:
	nop
	set	0x64, %l3
	sth	%i2,	[%l7 + %l3]
	bg	%icc,	loop_69
	fpadd16	%f2,	%f8,	%f14
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x38, %i4
	stw	%i0,	[%l7 + %i4]
loop_69:
	nop
	set	0x6C, %o1
	lda	[%l7 + %o1] 0x88,	%f20
	nop
	set	0x28, %l2
	std	%f20,	[%l7 + %l2]
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%l0
	nop
	set	0x30, %o3
	std	%f12,	[%l7 + %o3]
	wr	%o5,	%g5,	%clear_softint
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%g4
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x88,	%o6
	nop
	set	0x5E, %i7
	ldsb	[%l7 + %i7],	%g3
	nop
	set	0x5A, %o5
	ldsh	[%l7 + %o5],	%i6
	set	0x20, %l1
	stda	%o4,	[%l7 + %l1] 0x88
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	nop
	set	0x69, %o4
	ldsb	[%l7 + %o4],	%g6
	and	%i7,	%l6,	%o1
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x88,	%i3
	ble,a	%xcc,	loop_70
	nop
	set	0x74, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%g7
	nop
	set	0x6C, %g3
	ldsb	[%l7 + %g3],	%l4
loop_70:
	nop
	set	0x2B, %g1
	ldub	[%l7 + %g1],	%g1
	and	%i5,	%i1,	%l3
	set	0x27, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o7
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%o3
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%g2
	ld	[%l7 + 0x64],	%f17
	nop
	set	0x28, %g7
	stx	%o0,	[%l7 + %g7]
	or	%i4,	%l5,	%l2
	bl	%xcc,	loop_71
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%i2
	nop
	set	0x53, %l6
	ldsb	[%l7 + %l6],	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%l0
loop_71:
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%g5
	nop
	set	0x38, %i3
	stw	%o5,	[%l7 + %i3]
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f22
	nop
	set	0x64, %o2
	ldsw	[%l7 + %o2],	%g4
	set	0x38, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	nop
	set	0x76, %g6
	stb	%i6,	[%l7 + %g6]
	set	0x68, %i4
	sta	%f24,	[%l7 + %i4] 0x88
	set	0x28, %o1
	lda	[%l7 + %o1] 0x89,	%f22
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x80,	%g3
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f18
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x88,	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x54, %g2
	ldsw	[%l7 + %g2],	%i7
	fpadd32s	%f31,	%f16,	%f5
	set	0x48, %i7
	stxa	%l6,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x3B, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i3
	nop
	set	0x0C, %l1
	sth	%g7,	[%l7 + %l1]
	add	%l4,	%o1,	%i5
	nop
	set	0x1C, %o0
	swap	[%l7 + %o0],	%i1
	nop
	set	0x10, %g4
	stx	%l3,	[%l7 + %g4]
	nop
	set	0x08, %i2
	stx	%o7,	[%l7 + %i2]
	nop
	set	0x70, %g5
	std	%f20,	[%l7 + %g5]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf0
	membar	#Sync
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f12
	nop
	set	0x58, %g1
	stx	%fsr,	[%l7 + %g1]
	st	%f20,	[%l7 + 0x68]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%g2
	set	0x39, %o7
	stba	%o3,	[%l7 + %o7] 0x88
	st	%f29,	[%l7 + 0x0C]
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	set	0x78, %l5
	stda	%l4,	[%l7 + %l5] 0xe2
	membar	#Sync
	bgu	%icc,	loop_72
	nop
	set	0x40, %g7
	stx	%i4,	[%l7 + %g7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%i0
loop_72:
	nop
	set	0x3C, %i0
	stwa	%l1,	[%l7 + %i0] 0x81
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f16
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%l0
	set	0x68, %l4
	stda	%l2,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x09, %o2
	stb	%o6,	[%l7 + %o2]
	nop
	set	0x7C, %i5
	sth	%i6,	[%l7 + %i5]
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%g3
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%g4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	wr	%o4,	%g6,	%sys_tick
	nop
	nop
	setx	0xA4F8C491AEEBC629,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x33F72D3AB6482852,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f26,	%f18
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%l6
	set	0x6C, %i4
	lda	[%l7 + %i4] 0x80,	%f10
	add	%i7,	%i3,	%l4
	set	0x28, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o1
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f20
	nop
	set	0x58, %l2
	lduw	[%l7 + %l2],	%g7
	nop
	set	0x78, %g2
	std	%i4,	[%l7 + %g2]
	and	%i1,	%l3,	%g1
	nop
	set	0x34, %l3
	ldstub	[%l7 + %l3],	%o7
	set	0x08, %i7
	stwa	%g2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x76, %l1
	ldub	[%l7 + %l1],	%o3
	st	%f17,	[%l7 + 0x2C]
	and	%o0,	%l5,	%i4
	or	%i2,	%i0,	%l1
	set	0x30, %o5
	lda	[%l7 + %o5] 0x88,	%f24
	set	0x6C, %o0
	stha	%l0,	[%l7 + %o0] 0x81
	set	0x3C, %g4
	lda	[%l7 + %g4] 0x88,	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%o5
	nop
	set	0x4E, %g5
	ldsb	[%l7 + %g5],	%o6
	or	%l2,	%g3,	%g4
	set	0x74, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i6
	nop
	set	0x18, %i1
	stx	%g6,	[%l7 + %i1]
	nop
	set	0x78, %o4
	stx	%o4,	[%l7 + %o4]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x58, %o7
	std	%i2,	[%l7 + %o7]
	set	0x13, %g3
	ldstuba	[%l7 + %g3] 0x80,	%i7
	nop
	set	0x08, %l5
	swap	[%l7 + %l5],	%l4
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%o1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%i1
	nop
	set	0x78, %g7
	stw	%l3,	[%l7 + %g7]
	nop
	set	0x48, %l6
	stx	%g7,	[%l7 + %l6]
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o3
	nop
	set	0x64, %i6
	stw	%o0,	[%l7 + %i6]
	nop
	set	0x78, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f30
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x89,	%l4
	nop
	set	0x56, %g6
	ldsh	[%l7 + %g6],	%g2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%i4
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x88,	%l1
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%g5
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x88,	%l0
	add	%o6,	%o5,	%l2
	set	0x30, %i4
	lda	[%l7 + %i4] 0x89,	%f29
	ld	[%l7 + 0x2C],	%f22
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%g3
	nop
	set	0x32, %o3
	lduh	[%l7 + %o3],	%i6
	nop
	set	0x4C, %o1
	ldsw	[%l7 + %o1],	%g6
	nop
	set	0x46, %l2
	ldsh	[%l7 + %l2],	%g4
	nop
	set	0x30, %l3
	lduw	[%l7 + %l3],	%l6
	set	0x54, %i7
	stwa	%o2,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x69, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i3
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f14
	nop
	set	0x47, %o0
	ldstub	[%l7 + %o0],	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%i5
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%l2
	nop
	set	0x7E, %g5
	stb	%i1,	[%l7 + %g5]
	add	%g7,	%o7,	%o3
	nop
	set	0x3C, %i2
	swap	[%l7 + %i2],	%o0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f16
	nop
	set	0x1B, %i1
	ldstub	[%l7 + %i1],	%g1
	set	0x1D, %o4
	ldstuba	[%l7 + %o4] 0x80,	%g2
	nop
	set	0x6C, %o7
	ldsb	[%l7 + %o7],	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%l5
	set	0x3C, %l5
	sta	%f0,	[%l7 + %l5] 0x88
	nop
	set	0x38, %g3
	std	%f4,	[%l7 + %g3]
	nop
	set	0x58, %g7
	stx	%l1,	[%l7 + %g7]
	nop
	set	0x30, %g1
	prefetch	[%l7 + %g1],	 2
	add	%g5,	%l0,	%i0
	nop
	set	0x10, %l0
	std	%f6,	[%l7 + %l0]
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f31
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%o6
	nop
	set	0x74, %i6
	lduh	[%l7 + %i6],	%l2
	nop
	set	0x70, %i5
	stw	%g3,	[%l7 + %i5]
	set	0x70, %i0
	stda	%i6,	[%l7 + %i0] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g4
	nop
	set	0x70, %g6
	std	%f18,	[%l7 + %g6]
	nop
	set	0x35, %o2
	ldstub	[%l7 + %o2],	%g6
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x88,	%o2
	wr	%l6,	%i7,	%set_softint
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xeb,	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%o4
	nop
	nop
	setx	0x3DB6919E20267FAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x72CC1DCC2610ED3D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f6,	%f2
	nop
	set	0x73, %i3
	stb	%i5,	[%l7 + %i3]
	nop
	set	0x0A, %o3
	lduh	[%l7 + %o3],	%l3
	set	0x4C, %l2
	sta	%f10,	[%l7 + %l2] 0x80
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%l4
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%g7
	set	0x14, %l3
	swapa	[%l7 + %l3] 0x89,	%i1
	nop
	set	0x38, %l1
	stw	%o3,	[%l7 + %l1]
	nop
	set	0x10, %g2
	ldsw	[%l7 + %g2],	%o0
	nop
	set	0x42, %o5
	ldstub	[%l7 + %o5],	%o7
	nop
	set	0x28, %o0
	stw	%g1,	[%l7 + %o0]
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x0F, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g2
	set	0x48, %i1
	stda	%i2,	[%l7 + %i1] 0x89
	nop
	set	0x0C, %o4
	lduw	[%l7 + %o4],	%i4
	nop
	set	0x60, %g5
	stx	%l5,	[%l7 + %g5]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%g5
	nop
	set	0x0C, %g3
	ldsh	[%l7 + %g3],	%l0
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%l0
	nop
	set	0x30, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x1C, %l6
	lda	[%l7 + %l6] 0x89,	%f18
	nop
	set	0x08, %l4
	std	%f30,	[%l7 + %l4]
	fpsub16s	%f12,	%f10,	%f23
	set	0x70, %l0
	swapa	[%l7 + %l0] 0x88,	%o6
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f30
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x88,	 2
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x0D, %o6
	stb	%o5,	[%l7 + %o6]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1269
!	Type a   	: 30
!	Type x   	: 510
!	Type cti   	: 28
!	Type f   	: 51
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
	set	0x1,	%g1
	set	0xE,	%g2
	set	0x1,	%g3
	set	0xB,	%g4
	set	0xD,	%g5
	set	0xE,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0x4,	%i1
	set	-0x9,	%i2
	set	-0x1,	%i3
	set	-0xE,	%i4
	set	-0x6,	%i5
	set	-0x5,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x4D5D2B8F,	%l0
	set	0x5A227714,	%l1
	set	0x26ABB37B,	%l2
	set	0x7D8BF4A2,	%l3
	set	0x0AF969B2,	%l4
	set	0x5DF4CF3C,	%l5
	set	0x4955D096,	%l6
	!# Output registers
	set	-0x10B1,	%o0
	set	-0x056F,	%o1
	set	-0x0163,	%o2
	set	0x0004,	%o3
	set	0x033E,	%o4
	set	0x0EB0,	%o5
	set	0x1960,	%o6
	set	0x0F84,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xe2,	%g6
	set	0x4C, %l2
	lda	[%l7 + %l2] 0x89,	%f6
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x81,	%i6
	nop
	set	0x30, %i7
	std	%f16,	[%l7 + %i7]
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x30, %l3
	std	%f12,	[%l7 + %l3]
	nop
	set	0x6B, %g2
	ldstub	[%l7 + %g2],	%i7
	st	%f11,	[%l7 + 0x68]
	set	0x20, %o5
	stxa	%i3,	[%l7 + %o5] 0x88
	st	%f2,	[%l7 + 0x6C]
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%o1
	nop
	set	0x0C, %o0
	ldsw	[%l7 + %o0],	%o4
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%i5
	ble,a,pt	%icc,	loop_73
	nop
	set	0x16, %i1
	sth	%l3,	[%l7 + %i1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g7
loop_73:
	nop
	set	0x28, %o4
	swapa	[%l7 + %o4] 0x88,	%i1
	nop
	set	0x38, %g5
	ldsw	[%l7 + %g5],	%o2
	nop
	set	0x68, %o7
	ldsb	[%l7 + %o7],	%o3
	set	0x74, %l5
	stha	%o7,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x60, %i2
	std	%f8,	[%l7 + %i2]
	set	0x30, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0
	nop
	set	0x4C, %g3
	ldsh	[%l7 + %g3],	%g2
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%g0
	set	0x24, %l4
	stwa	%i4,	[%l7 + %l4] 0x88
	nop
	set	0x28, %l0
	std	%l4,	[%l7 + %l0]
	st	%f29,	[%l7 + 0x74]
	set	0x20, %g1
	swapa	[%l7 + %g1] 0x89,	%g5
	nop
	set	0x18, %i6
	stw	%l0,	[%l7 + %i6]
	and	%l1,	%o6,	%i0
	nop
	set	0x28, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x5C, %o2
	stw	%l2,	[%l7 + %o2]
	nop
	set	0x18, %g6
	std	%i2,	[%l7 + %g6]
	nop
	set	0x08, %o6
	std	%f12,	[%l7 + %o6]
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f18
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	nop
	set	0x24, %l2
	ldsh	[%l7 + %l2],	%g3
	nop
	set	0x58, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%g4
	set	0x0C, %i7
	stha	%o5,	[%l7 + %i7] 0x89
	ld	[%l7 + 0x54],	%f17
	add	%i6,	%l6,	%g6
	set	0x64, %l3
	swapa	[%l7 + %l3] 0x80,	%i7
	nop
	set	0x20, %g2
	sth	%o1,	[%l7 + %g2]
	add	%o4,	%i3,	%i5
	and	%l4,	%g7,	%i1
	nop
	set	0x71, %o1
	ldub	[%l7 + %o1],	%o2
	st	%f29,	[%l7 + 0x3C]
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x81,	%l2
	nop
	set	0x40, %o0
	swap	[%l7 + %o0],	%o7
	nop
	set	0x64, %g4
	stw	%o0,	[%l7 + %g4]
	set	0x5E, %l1
	stha	%o3,	[%l7 + %l1] 0x88
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	set	0x48, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	nop
	nop
	setx	0x4267A9AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x9A9F7170,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f4,	%f23
	set	0x70, %o7
	stba	%i4,	[%l7 + %o7] 0x89
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x89,	%g2
	nop
	set	0x64, %i2
	lduw	[%l7 + %i2],	%g5
	nop
	set	0x60, %o4
	std	%l4,	[%l7 + %o4]
	fpsub16	%f24,	%f2,	%f28
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	nop
	set	0x2E, %l6
	lduh	[%l7 + %l6],	%o6
	nop
	set	0x78, %l4
	lduw	[%l7 + %l4],	%i0
	set	0x3C, %l0
	swapa	[%l7 + %l0] 0x89,	%l2
	nop
	set	0x78, %g7
	stw	%i2,	[%l7 + %g7]
	fpadd32	%f20,	%f16,	%f6
	nop
	set	0x48, %g1
	ldsh	[%l7 + %g1],	%g3
	nop
	set	0x48, %i6
	stw	%l0,	[%l7 + %i6]
	nop
	set	0x10, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x24, %g6
	stw	%g4,	[%l7 + %g6]
	nop
	set	0x40, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x28, %i4
	swap	[%l7 + %i4],	%i6
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f30
	nop
	set	0x3D, %i5
	ldsb	[%l7 + %i5],	%l6
	nop
	set	0x08, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x58, %o3
	stda	%g6,	[%l7 + %o3] 0x88
	set	0x79, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o1
	set	0x75, %i7
	stba	%i7,	[%l7 + %i7] 0x80
	and	%o4,	%i5,	%i3
	nop
	set	0x50, %g2
	std	%l4,	[%l7 + %g2]
	nop
	set	0x28, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x18, %l3
	std	%f26,	[%l7 + %l3]
	nop
	set	0x74, %o5
	ldub	[%l7 + %o5],	%g7
	nop
	set	0x10, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x30, %l1
	std	%i0,	[%l7 + %l1]
	set	0x6E, %g4
	stba	%o2,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x5F, %g5
	ldub	[%l7 + %g5],	%l3
	set	0x28, %o7
	stda	%o0,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x54, %l5
	swap	[%l7 + %l5],	%o7
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x88,	%g1
	and	%o3,	%g2,	%g5
	nop
	set	0x40, %i2
	ldstub	[%l7 + %i2],	%i4
	set	0x7E, %o4
	stba	%l1,	[%l7 + %o4] 0x81
	set	0x70, %l6
	stba	%l5,	[%l7 + %l6] 0x88
	nop
	set	0x1E, %l4
	ldsh	[%l7 + %l4],	%i0
	nop
	set	0x38, %l0
	std	%f26,	[%l7 + %l0]
	add	%l2,	%i2,	%o6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%o5
	nop
	set	0x67, %g7
	ldsb	[%l7 + %g7],	%l0
	nop
	set	0x0C, %g3
	lduh	[%l7 + %g3],	%i6
	add	%g4,	%g6,	%l6
	nop
	set	0x7A, %g1
	ldstub	[%l7 + %g1],	%i7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f0
	nop
	set	0x78, %i6
	std	%f22,	[%l7 + %i6]
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%o4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x89
	nop
	set	0x30, %i5
	ldx	[%l7 + %i5],	%i5
	nop
	set	0x3D, %l2
	ldsb	[%l7 + %l2],	%i3
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	set	0x44, %o3
	stwa	%l4,	[%l7 + %o3] 0x88
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x46, %i3
	sth	%g7,	[%l7 + %i3]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%i1
	set	0x2C, %i7
	lda	[%l7 + %i7] 0x80,	%f29
	nop
	set	0x40, %g2
	stx	%g1,	[%l7 + %g2]
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	or	%o7,	%g2,	%g5
	nop
	set	0x30, %o1
	stw	%i4,	[%l7 + %o1]
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%o2
	wr	%l5,	%l1,	%softint
	set	0x48, %o5
	stwa	%i0,	[%l7 + %o5] 0x81
	nop
	set	0x10, %g4
	stw	%l2,	[%l7 + %g4]
	nop
	set	0x44, %g5
	sth	%o6,	[%l7 + %g5]
	set	0x37, %o7
	stba	%g3,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x72, %l1
	sth	%i2,	[%l7 + %l1]
	fpsub32s	%f24,	%f12,	%f14
	set	0x14, %l5
	stwa	%o5,	[%l7 + %l5] 0x88
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xda,	%f0
	add	%i6,	%g4,	%l0
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f22
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%g6
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%o4
	set	0x08, %g7
	stxa	%i5,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x20, %g3
	stxa	%i3,	[%l7 + %g3] 0x81
	set	0x50, %l0
	stxa	%o1,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x28, %g1
	stda	%i6,	[%l7 + %g1] 0xea
	membar	#Sync
	or	%g7,	%o2,	%l3
	fpadd16s	%f16,	%f21,	%f25
	set	0x6C, %o2
	stwa	%l4,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x38, %i6
	stw	%o0,	[%l7 + %i6]
	nop
	set	0x38, %g6
	stw	%g1,	[%l7 + %g6]
	ble	%xcc,	loop_74
	nop
	set	0x5F, %i0
	ldub	[%l7 + %i0],	%o7
	nop
	set	0x35, %i4
	ldsb	[%l7 + %i4],	%g2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf1
	membar	#Sync
loop_74:
	nop
	set	0x58, %l2
	stxa	%g5,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x64, %o6
	sta	%f15,	[%l7 + %o6] 0x81
	nop
	set	0x18, %o3
	stw	%i4,	[%l7 + %o3]
	nop
	set	0x28, %i3
	stx	%o3,	[%l7 + %i3]
	set	0x20, %i7
	stha	%l5,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f16
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%l1
	set	0x17, %o0
	stba	%i1,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x60, %o5
	ldsh	[%l7 + %o5],	%l2
	nop
	set	0x67, %l3
	ldstub	[%l7 + %l3],	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%g3
	fpsub16s	%f1,	%f12,	%f29
	nop
	set	0x7C, %g5
	ldsw	[%l7 + %g5],	%i2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc4
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x81,	%i6
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x54, %l1
	ldsw	[%l7 + %l1],	%g4
	nop
	set	0x18, %i2
	lduw	[%l7 + %i2],	%l0
	nop
	set	0x7A, %l5
	sth	%g6,	[%l7 + %l5]
	set	0x08, %l6
	sta	%f26,	[%l7 + %l6] 0x88
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%o4
	nop
	set	0x18, %l4
	stw	%i5,	[%l7 + %l4]
	and	%i3,	%o1,	%i7
	set	0x78, %o4
	stda	%i6,	[%l7 + %o4] 0x89
	nop
	set	0x10, %i1
	ldub	[%l7 + %i1],	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%l4
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%o0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf0
	membar	#Sync
	nop
	set	0x3F, %g1
	ldub	[%l7 + %g1],	%g1
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%g7
	set	0x22, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g2
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x88,	%g5
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%f30
	set	0x20, %g6
	sta	%f16,	[%l7 + %g6] 0x88
	nop
	set	0x6C, %i5
	stw	%i4,	[%l7 + %i5]
	or	%o7,	%o3,	%l5
	set	0x28, %l2
	lda	[%l7 + %l2] 0x81,	%f2
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x81,	%l1
	set	0x7C, %o3
	stwa	%i1,	[%l7 + %o3] 0x80
	nop
	set	0x16, %i4
	sth	%l2,	[%l7 + %i4]
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	st	%f6,	[%l7 + 0x40]
	fpsub16	%f30,	%f4,	%f20
	set	0x38, %g2
	stxa	%o6,	[%l7 + %g2] 0x81
	set	0x30, %i7
	sta	%f15,	[%l7 + %i7] 0x80
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%g3
	nop
	set	0x44, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x58, %l3
	stw	%i0,	[%l7 + %l3]
	set	0x7C, %g5
	sta	%f26,	[%l7 + %g5] 0x81
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%i2
	nop
	set	0x18, %o5
	ldsw	[%l7 + %o5],	%g4
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x4B, %i2
	ldstub	[%l7 + %i2],	%l0
	nop
	set	0x52, %l5
	ldsh	[%l7 + %l5],	%i6
	set	0x34, %l6
	sta	%f4,	[%l7 + %l6] 0x81
	set	0x18, %l1
	lda	[%l7 + %l1] 0x81,	%f15
	nop
	set	0x54, %l4
	lduw	[%l7 + %l4],	%g6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o5
	nop
	set	0x58, %o4
	stx	%i3,	[%l7 + %o4]
	add	%i5,	%i7,	%o1
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x81,	 1
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x81,	%l3
	ld	[%l7 + 0x1C],	%f10
	nop
	set	0x16, %g1
	lduh	[%l7 + %g1],	%o2
	nop
	set	0x48, %o2
	ldsh	[%l7 + %o2],	%l4
	nop
	set	0x60, %l0
	stb	%o0,	[%l7 + %l0]
	fpsub32s	%f1,	%f4,	%f3
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f12
	nop
	set	0x78, %g3
	lduw	[%l7 + %g3],	%g7
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x63, %i5
	stba	%g1,	[%l7 + %i5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x70],	%f15
	nop
	set	0x40, %i0
	lduh	[%l7 + %i0],	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%o7
	add	%g5,	%l5,	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%o3
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%l2
	set	0x14, %o3
	sta	%f2,	[%l7 + %o3] 0x89
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f24
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o6
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x80,	%i0
	fpadd32	%f26,	%f10,	%f0
	nop
	set	0x41, %g2
	ldsb	[%l7 + %g2],	%i2
	set	0x5C, %i7
	swapa	[%l7 + %i7] 0x81,	%g3
	set	0x2B, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g4
	ld	[%l7 + 0x30],	%f31
	nop
	set	0x28, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f10
	nop
	set	0x40, %g4
	lduw	[%l7 + %g4],	%l0
	nop
	set	0x30, %o5
	ldsw	[%l7 + %o5],	%o4
	nop
	set	0x10, %o0
	std	%g6,	[%l7 + %o0]
	add	%o5,	%i5,	%i7
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%i3
	add	%o1,	%l3,	%l6
	nop
	set	0x34, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd8,	%f16
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%o2
	set	0x68, %l6
	stda	%l4,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x24, %o4
	stw	%o0,	[%l7 + %o4]
	nop
	set	0x5C, %g7
	lduw	[%l7 + %g7],	%g1
	nop
	set	0x09, %l4
	ldsb	[%l7 + %l4],	%g7
	nop
	set	0x64, %g1
	ldsh	[%l7 + %g1],	%i4
	set	0x18, %o2
	stha	%o7,	[%l7 + %o2] 0x89
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%g5
	nop
	set	0x62, %l0
	ldstub	[%l7 + %l0],	%g2
	nop
	set	0x38, %i6
	std	%l0,	[%l7 + %i6]
	bge,pt	%xcc,	loop_75
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xea,	%l4
loop_75:
	nop
	set	0x50, %g3
	std	%o2,	[%l7 + %g3]
	nop
	set	0x68, %i0
	ldub	[%l7 + %i0],	%i1
	nop
	set	0x50, %o6
	ldub	[%l7 + %o6],	%l2
	wr	%o6,	%i0,	%clear_softint
	nop
	set	0x30, %l2
	stx	%g3,	[%l7 + %l2]
	nop
	set	0x5C, %o3
	ldsw	[%l7 + %o3],	%i2
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x80,	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%l0
	st	%fsr,	[%l7 + 0x60]
	nop
	nop
	setx	0x2F4B4779,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x550FA096,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f29,	%f7
	set	0x48, %i4
	stba	%g6,	[%l7 + %i4] 0x80
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x0C, %g2
	stw	%o5,	[%l7 + %g2]
	nop
	set	0x50, %i7
	std	%f0,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x48, %o1
	std	%o4,	[%l7 + %o1]
	set	0x78, %l3
	sta	%f25,	[%l7 + %l3] 0x88
	nop
	set	0x56, %g4
	ldsh	[%l7 + %g4],	%i5
	set	0x08, %g5
	stwa	%i7,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x6C, %o0
	stw	%o1,	[%l7 + %o0]
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%i3
	set	0x74, %o7
	stha	%l6,	[%l7 + %o7] 0x89
	nop
	set	0x30, %i2
	stw	%l3,	[%l7 + %i2]
	set	0x0C, %l5
	swapa	[%l7 + %l5] 0x80,	%o2
	add	%o0,	%g1,	%l4
	nop
	set	0x3A, %l1
	lduh	[%l7 + %l1],	%g7
	and	%o7,	%i4,	%g2
	set	0x14, %l6
	swapa	[%l7 + %l6] 0x89,	%g5
	nop
	set	0x4C, %g7
	prefetch	[%l7 + %g7],	 4
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x68, %g1
	stw	%l5,	[%l7 + %g1]
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x80,	%l0
	ld	[%l7 + 0x2C],	%f25
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%f28
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%i0
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x88,	%o3
	st	%fsr,	[%l7 + 0x34]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	st	%f18,	[%l7 + 0x18]
	nop
	set	0x3C, %i6
	lduh	[%l7 + %i6],	%l2
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x89,	%g3
	set	0x58, %i0
	swapa	[%l7 + %i0] 0x89,	%i0
	ble,a,pt	%icc,	loop_76
	add	%i2,	%i6,	%g4
	nop
	set	0x30, %o3
	std	%f4,	[%l7 + %o3]
	set	0x18, %l2
	stda	%g6,	[%l7 + %l2] 0xe2
	membar	#Sync
loop_76:
	nop
	set	0x48, %i3
	stw	%o5,	[%l7 + %i3]
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%l0
	nop
	set	0x48, %i7
	std	%f22,	[%l7 + %i7]
	nop
	set	0x7F, %o1
	ldstub	[%l7 + %o1],	%o4
	or	%i5,	%i7,	%o1
	or	%i3,	%l6,	%l3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f0
	nop
	set	0x32, %g4
	ldsh	[%l7 + %g4],	%o0
	fpadd16s	%f0,	%f29,	%f28
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%o2
	bgu	%xcc,	loop_77
	st	%f5,	[%l7 + 0x4C]
	set	0x47, %g5
	stba	%l4,	[%l7 + %g5] 0xe2
	membar	#Sync
loop_77:
	nop
	set	0x55, %l3
	stba	%g7,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x28, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x28, %o7
	ldsh	[%l7 + %o7],	%i4
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%o6
	nop
	set	0x48, %l5
	std	%f2,	[%l7 + %l5]
	and	%g5,	%g2,	%l1
	set	0x3D, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i1
	set	0x2F, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o3
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x80,	 4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g3
	set	0x40, %g7
	stwa	%i0,	[%l7 + %g7] 0x81
	nop
	set	0x62, %l4
	stb	%i2,	[%l7 + %l4]
	ld	[%l7 + 0x10],	%f13
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0
	nop
	nop
	setx	0x2921FBC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x11FDD96C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f10,	%f31
	nop
	set	0x38, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x46, %o4
	stba	%o6,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x60, %l0
	swap	[%l7 + %l0],	%g4
	nop
	set	0x28, %g6
	std	%f20,	[%l7 + %g6]
	set	0x3C, %o2
	stwa	%g6,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x1C, %i5
	stb	%l0,	[%l7 + %i5]
	nop
	set	0x4C, %g3
	sth	%o5,	[%l7 + %g3]
	wr	%o4,	%i5,	%set_softint
	ble	%xcc,	loop_78
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x28, %i6
	stw	%o1,	[%l7 + %i6]
	set	0x70, %o3
	lda	[%l7 + %o3] 0x80,	%f4
loop_78:
	nop
	set	0x10, %i0
	sta	%f14,	[%l7 + %i0] 0x89
	nop
	set	0x68, %i3
	std	%i2,	[%l7 + %i3]
	set	0x3C, %l2
	sta	%f24,	[%l7 + %l2] 0x89
	set	0x20, %i4
	stxa	%l6,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x38, %i7
	sta	%f19,	[%l7 + %i7] 0x89
	nop
	set	0x10, %g2
	stx	%i7,	[%l7 + %g2]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f0
	nop
	set	0x58, %g4
	std	%l2,	[%l7 + %g4]
	set	0x7A, %g5
	stha	%o0,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x58, %o5
	prefetch	[%l7 + %o5],	 2
	ld	[%l7 + 0x68],	%f5
	bge,a,pn	%xcc,	loop_79
	nop
	set	0x1C, %l3
	stw	%o2,	[%l7 + %l3]
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f18
	nop
	set	0x20, %i2
	prefetch	[%l7 + %i2],	 1
loop_79:
	nop
	set	0x68, %l5
	ldsw	[%l7 + %l5],	%l4
	add	%g1,	%g7,	%i4
	set	0x70, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g5
	nop
	set	0x78, %l6
	prefetch	[%l7 + %l6],	 2
	nop
	set	0x20, %g7
	ldsb	[%l7 + %g7],	%g2
	nop
	set	0x3A, %o0
	sth	%l1,	[%l7 + %o0]
	nop
	set	0x32, %g1
	sth	%i1,	[%l7 + %g1]
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%o6
	nop
	set	0x64, %o4
	swap	[%l7 + %o4],	%o3
	st	%fsr,	[%l7 + 0x60]
	set	0x54, %l0
	lda	[%l7 + %l0] 0x89,	%f5
	set	0x30, %g6
	swapa	[%l7 + %g6] 0x81,	%l5
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f8
	set	0x46, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g3
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%i2
	bg,a	%icc,	loop_80
	nop
	set	0x38, %g3
	std	%l2,	[%l7 + %g3]
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
loop_80:
	nop
	set	0x54, %o6
	stha	%g4,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x16, %i0
	ldsb	[%l7 + %i0],	%g6
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%i6
	wr	%l0,	%o5,	%sys_tick
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%o1
	set	0x14, %i4
	lda	[%l7 + %i4] 0x89,	%f14
	fpsub32	%f12,	%f4,	%f30
	nop
	set	0x60, %i7
	sth	%i3,	[%l7 + %i7]
	nop
	set	0x50, %g2
	stx	%i7,	[%l7 + %g2]
	nop
	set	0x70, %i3
	std	%f24,	[%l7 + %i3]
	nop
	set	0x0C, %o1
	ldsh	[%l7 + %o1],	%l3
	nop
	set	0x6E, %g4
	ldub	[%l7 + %g4],	%l6
	fpadd16s	%f12,	%f8,	%f21
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%o0
	st	%f3,	[%l7 + 0x34]
	nop
	set	0x08, %o5
	ldsw	[%l7 + %o5],	%o2
	ld	[%l7 + 0x38],	%f30
	set	0x20, %l3
	stxa	%l4,	[%l7 + %l3] 0x81
	nop
	set	0x09, %i2
	ldstub	[%l7 + %i2],	%g1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%g5
	set	0x08, %l5
	stda	%g6,	[%l7 + %l5] 0xe3
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%i1
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%o7
	set	0x60, %o7
	sta	%f22,	[%l7 + %o7] 0x80
	nop
	set	0x0D, %g7
	ldsb	[%l7 + %g7],	%l1
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xeb,	%o2
	nop
	set	0x0A, %g1
	ldub	[%l7 + %g1],	%l5
	nop
	set	0x30, %o0
	ldstub	[%l7 + %o0],	%g3
	nop
	set	0x48, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x18, %l0
	stda	%i0,	[%l7 + %l0] 0x80
	nop
	set	0x08, %o4
	swap	[%l7 + %o4],	%i2
	nop
	set	0x76, %o2
	sth	%l2,	[%l7 + %o2]
	or	%g4,	%g6,	%o6
	nop
	set	0x4E, %i1
	ldsb	[%l7 + %i1],	%l0
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%i6
	nop
	set	0x50, %g3
	lduh	[%l7 + %g3],	%o5
	set	0x72, %i6
	ldstuba	[%l7 + %i6] 0x80,	%i5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
	set	0x5C, %o6
	stha	%o1,	[%l7 + %o6] 0x89
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xeb,	%i2
	set	0x7C, %i0
	sta	%f19,	[%l7 + %i0] 0x88
	set	0x51, %i4
	stba	%o4,	[%l7 + %i4] 0x88
	set	0x3A, %l2
	stha	%l3,	[%l7 + %l2] 0x80
	set	0x14, %i7
	lda	[%l7 + %i7] 0x81,	%f0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc4
	add	%l6,	%i7,	%o2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe3,	%o0
	set	0x6C, %g4
	stwa	%l4,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x20, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g1
	set	0x34, %g5
	stwa	%i4,	[%l7 + %g5] 0x88
	nop
	set	0x50, %o5
	std	%f14,	[%l7 + %o5]
	nop
	set	0x18, %i2
	ldsb	[%l7 + %i2],	%g7
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%g4
	set	0x08, %l1
	stxa	%i1,	[%l7 + %l1] 0x88
	and	%g2,	%o7,	%l1
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%o3
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x89,	 3
	st	%fsr,	[%l7 + 0x30]
	ld	[%l7 + 0x6C],	%f31
	set	0x5C, %l6
	sta	%f27,	[%l7 + %l6] 0x88
	nop
	set	0x20, %g1
	std	%f14,	[%l7 + %g1]
	nop
	set	0x11, %o0
	ldub	[%l7 + %o0],	%i0
	ld	[%l7 + 0x3C],	%f10
	nop
	set	0x08, %g7
	std	%g2,	[%l7 + %g7]
	nop
	set	0x48, %l4
	stx	%i2,	[%l7 + %l4]
	set	0x0E, %o4
	stha	%l2,	[%l7 + %o4] 0x80
	nop
	set	0x53, %l0
	stb	%g6,	[%l7 + %l0]
	nop
	set	0x78, %o2
	std	%o6,	[%l7 + %o2]
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%g4
	nop
	set	0x48, %g3
	ldsh	[%l7 + %g3],	%l0
	nop
	set	0x0C, %i6
	stw	%i6,	[%l7 + %i6]
	set	0x28, %g6
	stda	%i4,	[%l7 + %g6] 0x80
	nop
	set	0x72, %o6
	ldsb	[%l7 + %o6],	%o5
	nop
	set	0x64, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x2C, %i0
	stwa	%i3,	[%l7 + %i0] 0x80
	set	0x70, %o3
	stwa	%o4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x64, %l2
	lduw	[%l7 + %l2],	%o1
	set	0x30, %i4
	stda	%l2,	[%l7 + %i4] 0x88
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x80,	%i6
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f0
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xea,	%o2
	or	%i7,	%o0,	%g1
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x80,	 0
	nop
	set	0x7C, %g5
	swap	[%l7 + %g5],	%g7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%l4
	or	%g2,	%o7,	%l1
	set	0x2A, %o5
	stha	%i1,	[%l7 + %o5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x64, %o1
	ldsw	[%l7 + %o1],	%l5
	set	0x64, %l5
	lda	[%l7 + %l5] 0x88,	%f2
	nop
	set	0x58, %l1
	std	%f28,	[%l7 + %l1]
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f20
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%i0
	nop
	set	0x4C, %l3
	stw	%i2,	[%l7 + %l3]
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%l2
	nop
	set	0x08, %l6
	sth	%g3,	[%l7 + %l6]
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x88,	%g6
	set	0x58, %g7
	sta	%f7,	[%l7 + %g7] 0x88
	and	%o6,	%l0,	%g4
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f20
	set	0x58, %l0
	stxa	%i6,	[%l7 + %l0] 0x80
	set	0x38, %l4
	lda	[%l7 + %l4] 0x88,	%f29
	set	0x54, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i5
	wr	%i3,	%o4,	%ccr
	wr	%o1,	%l3,	%softint
	nop
	set	0x60, %g3
	stx	%o5,	[%l7 + %g3]
	nop
	set	0x28, %i6
	swap	[%l7 + %i6],	%o2
	set	0x30, %i1
	stwa	%i7,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
	nop
	set	0x18, %i5
	stw	%l6,	[%l7 + %i5]
	wr	%g1,	%o0,	%ccr
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xeb,	%g6
	add	%i4,	%l4,	%g5
	nop
	set	0x08, %i0
	std	%f14,	[%l7 + %i0]
	nop
	set	0x08, %l2
	std	%f12,	[%l7 + %l2]
	and	%g2,	%o7,	%l1
	nop
	nop
	setx	0xF241354B55E3A128,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x2A344F44903F01D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f30
	set	0x0C, %o3
	stha	%l5,	[%l7 + %o3] 0xeb
	membar	#Sync
	ld	[%l7 + 0x20],	%f18
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%i1
	nop
	set	0x48, %i7
	stx	%i0,	[%l7 + %i7]
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i2
	nop
	set	0x38, %g2
	ldsw	[%l7 + %g2],	%l2
	nop
	set	0x5C, %i3
	swap	[%l7 + %i3],	%g6
	nop
	set	0x70, %g5
	std	%f14,	[%l7 + %g5]
	nop
	set	0x50, %o5
	stx	%o6,	[%l7 + %o5]
	nop
	set	0x50, %o1
	std	%l0,	[%l7 + %o1]
	ld	[%l7 + 0x78],	%f13
	or	%g3,	%i6,	%g4
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x54]
	set	0x18, %o7
	swapa	[%l7 + %o7] 0x89,	%o4
	nop
	set	0x7F, %i2
	ldstub	[%l7 + %i2],	%o1
	bn,pn	%icc,	loop_81
	nop
	nop
	setx	0x51C98F5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x32479625,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f21,	%f16
	set	0x43, %l3
	ldstuba	[%l7 + %l3] 0x89,	%l3
loop_81:
	nop
	set	0x10, %l6
	std	%f24,	[%l7 + %l6]
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f0
	add	%i5,	%o5,	%o2
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%f18
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x88,	 0
	nop
	set	0x24, %o4
	sth	%g1,	[%l7 + %o4]
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f18
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xeb,	%i6
	nop
	set	0x3C, %g3
	sth	%o0,	[%l7 + %g3]
	nop
	set	0x18, %i6
	stw	%i4,	[%l7 + %i6]
	nop
	set	0x18, %l0
	ldstub	[%l7 + %l0],	%l4
	set	0x48, %i1
	stha	%g5,	[%l7 + %i1] 0xeb
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%g7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%l5
	ld	[%l7 + 0x5C],	%f25
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x29, %i5
	stb	%o7,	[%l7 + %i5]
	set	0x10, %o6
	stxa	%i1,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x60, %i0
	stw	%i0,	[%l7 + %i0]
	set	0x10, %l2
	stwa	%i2,	[%l7 + %l2] 0xe2
	membar	#Sync
	or	%l2,	%g6,	%o6
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xe3,	%o2
	nop
	set	0x76, %i7
	ldstub	[%l7 + %i7],	%g3
	set	0x20, %i4
	ldstuba	[%l7 + %i4] 0x89,	%l0
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x71, %g6
	stb	%g4,	[%l7 + %g6]
	bleu	%xcc,	loop_82
	nop
	set	0x34, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x89,	%i2
loop_82:
	nop
	set	0x60, %o5
	prefetch	[%l7 + %o5],	 4
	fpadd32	%f0,	%f20,	%f20
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%f0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x88
	nop
	set	0x20, %l5
	lduw	[%l7 + %l5],	%o4
	nop
	set	0x28, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x14, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x44, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x81,	%l2
	set	0x20, %l6
	stxa	%i6,	[%l7 + %l6] 0xeb
	membar	#Sync
	bn,pt	%xcc,	loop_83
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x14, %g7
	lda	[%l7 + %g7] 0x88,	%f31
loop_83:
	nop
	set	0x64, %g1
	swapa	[%l7 + %g1] 0x80,	%i5
	nop
	set	0x60, %l4
	std	%o4,	[%l7 + %l4]
	nop
	set	0x68, %o4
	ldsw	[%l7 + %o4],	%o2
	set	0x30, %g3
	swapa	[%l7 + %g3] 0x80,	%i7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	set	0x14, %l0
	swapa	[%l7 + %l0] 0x81,	%l6
	nop
	set	0x5E, %i1
	ldsh	[%l7 + %i1],	%o0
	nop
	set	0x08, %i6
	stw	%i4,	[%l7 + %i6]
	set	0x37, %i5
	stba	%g1,	[%l7 + %i5] 0x80
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f14
	nop
	set	0x38, %l2
	stb	%g5,	[%l7 + %l2]
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x89,	%l4
	nop
	set	0x20, %o3
	stx	%g7,	[%l7 + %o3]
	set	0x3C, %i7
	stba	%l1,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x28, %g4
	stwa	%g2,	[%l7 + %g4] 0x89
	nop
	set	0x48, %i4
	std	%l4,	[%l7 + %i4]
	nop
	set	0x54, %i3
	lduw	[%l7 + %i3],	%o7
	ld	[%l7 + 0x1C],	%f28
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%i1
	nop
	set	0x39, %g6
	ldsb	[%l7 + %g6],	%l2
	set	0x70, %o5
	lda	[%l7 + %o5] 0x88,	%f20
	set	0x4C, %g2
	swapa	[%l7 + %g2] 0x88,	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%g6
	set	0x20, %g5
	stda	%o2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x0C, %l5
	lduw	[%l7 + %l5],	%l0
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%o4
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f8
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%g4
	nop
	set	0x74, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x30, %l6
	swap	[%l7 + %l6],	%i5
	set	0x48, %o0
	stda	%i6,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x36, %o7
	ldub	[%l7 + %o7],	%o5
	nop
	set	0x30, %g1
	sth	%i7,	[%l7 + %g1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%l6
	nop
	set	0x64, %l4
	ldsh	[%l7 + %l4],	%o0
	bl,pn	%icc,	loop_84
	nop
	set	0x18, %o4
	stx	%i4,	[%l7 + %o4]
	or	%g1,	%g5,	%l4
	add	%l1,	%g2,	%l5
loop_84:
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x28, %g3
	stw	%o7,	[%l7 + %g3]
	nop
	set	0x78, %o2
	ldsh	[%l7 + %o2],	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%l2
	nop
	set	0x7C, %g7
	stw	%i1,	[%l7 + %g7]
	nop
	nop
	setx	0xD690471B79BCF7FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4CE9E665067653B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f28,	%f12
	set	0x78, %l0
	stha	%o6,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x4C, %i6
	stwa	%i2,	[%l7 + %i6] 0x88
	add	%o3,	%l0,	%g6
	wr	%g3,	%i3,	%set_softint
	nop
	set	0x15, %i5
	stb	%o4,	[%l7 + %i5]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd2,	%f16
	bn,a,pt	%icc,	loop_85
	nop
	set	0x54, %l2
	ldsw	[%l7 + %l2],	%o1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f0
loop_85:
	add	%g4,	%l3,	%i5
	nop
	set	0x0C, %o3
	lduw	[%l7 + %o3],	%i6
	nop
	set	0x10, %i7
	std	%f14,	[%l7 + %i7]
	st	%f15,	[%l7 + 0x20]
	bn,a	%xcc,	loop_86
	nop
	set	0x68, %i0
	stw	%o5,	[%l7 + %i0]
	set	0x14, %i4
	sta	%f7,	[%l7 + %i4] 0x80
loop_86:
	nop
	set	0x2E, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o2
	nop
	set	0x4C, %g6
	ldsh	[%l7 + %g6],	%i7
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x81,	%l6
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x24, %g2
	lduw	[%l7 + %g2],	%g1
	nop
	set	0x14, %g5
	prefetch	[%l7 + %g5],	 4
	and	%i4,	%l4,	%g5
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%l0
	add	%l5,	%o7,	%i0
	set	0x14, %o1
	sta	%f1,	[%l7 + %o1] 0x81
	nop
	set	0x67, %i2
	ldsb	[%l7 + %i2],	%g2
	set	0x74, %l1
	stha	%l2,	[%l7 + %l1] 0x81
	nop
	set	0x11, %l6
	stb	%i1,	[%l7 + %l6]
	nop
	set	0x1D, %l3
	ldstub	[%l7 + %l3],	%o6
	set	0x27, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i2
	nop
	set	0x20, %g1
	stx	%g7,	[%l7 + %g1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x88
	set	0x32, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g3
	set	0x58, %o4
	stwa	%i3,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x78, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x88,	%o4
	set	0x53, %g7
	stba	%l0,	[%l7 + %g7] 0x80
	set	0x50, %l0
	sta	%f28,	[%l7 + %l0] 0x88
	set	0x50, %i6
	lda	[%l7 + %i6] 0x88,	%f29
	set	0x6C, %o6
	stha	%o1,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x80,	%g4
	nop
	set	0x2F, %i1
	ldub	[%l7 + %i1],	%i5
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f16
	set	0x20, %i7
	stda	%i6,	[%l7 + %i7] 0x89
	nop
	set	0x78, %i5
	stx	%l3,	[%l7 + %i5]
	set	0x28, %i4
	stxa	%o2,	[%l7 + %i4] 0x89
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%o5
	wr	%i7,	%l6,	%pic
	wr	%o0,	%i4,	%softint
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xeb,	%g0
	fpadd32s	%f24,	%f11,	%f12
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%l0
	set	0x58, %g5
	stxa	%l5,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%f28
	set	0x32, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o7
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x80,	 1
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%g2
	nop
	set	0x7C, %l6
	stw	%l2,	[%l7 + %l6]
	set	0x14, %l3
	lda	[%l7 + %l3] 0x80,	%f5
	set	0x20, %o1
	stda	%i0,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x28, %g1
	stx	%g5,	[%l7 + %g1]
	set	0x3D, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o6
	nop
	set	0x3C, %o7
	ldstub	[%l7 + %o7],	%g7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x30, %o0
	std	%i2,	[%l7 + %o0]
	set	0x56, %o4
	ldstuba	[%l7 + %o4] 0x81,	%g6
	set	0x3C, %g3
	swapa	[%l7 + %g3] 0x81,	%o3
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%g3
	ld	[%l7 + 0x68],	%f2
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	set	0x09, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o4
	nop
	set	0x10, %o6
	std	%f14,	[%l7 + %o6]
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%i3
	or	%g4,	%i5,	%o1
	nop
	set	0x64, %o3
	ldsh	[%l7 + %o3],	%i6
	fpadd16	%f4,	%f24,	%f22
	set	0x1C, %i7
	sta	%f18,	[%l7 + %i7] 0x88
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%l2
	or	%o5,	%o2,	%i7
	set	0x64, %i5
	stwa	%l6,	[%l7 + %i5] 0x80
	nop
	set	0x46, %i0
	sth	%o0,	[%l7 + %i0]
	set	0x28, %i4
	sta	%f29,	[%l7 + %i4] 0x81
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x80,	 3
	nop
	set	0x6C, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f26
	st	%f0,	[%l7 + 0x44]
	and	%l4,	%i4,	%l1
	nop
	set	0x78, %g5
	lduw	[%l7 + %g5],	%o7
	st	%fsr,	[%l7 + 0x5C]
	ld	[%l7 + 0x08],	%f9
	nop
	set	0x38, %g6
	swap	[%l7 + %g6],	%l5
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%g2,	%l2,	%i1
	set	0x3C, %i2
	stwa	%g5,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xe2,	%i0
	bl,pn	%xcc,	loop_87
	st	%f2,	[%l7 + 0x20]
	nop
	set	0x6C, %o5
	ldsw	[%l7 + %o5],	%o6
	nop
	set	0x70, %l6
	ldx	[%l7 + %l6],	%i2
loop_87:
	nop
	set	0x38, %l3
	stda	%g6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x0F, %g1
	ldstub	[%l7 + %g1],	%o3
	nop
	set	0x36, %l4
	lduh	[%l7 + %l4],	%g7
	nop
	set	0x68, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f20
	set	0x58, %o4
	sta	%f29,	[%l7 + %o4] 0x80
	ba,pt	%icc,	loop_88
	nop
	set	0x72, %o0
	ldsh	[%l7 + %o0],	%g3
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xe2,	%l0
loop_88:
	nop
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x81,	%i2
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x80,	%o4
	add	%i5,	%o1,	%g4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xcc
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xcc
	set	0x40, %i1
	stda	%i6,	[%l7 + %i1] 0x89
	st	%fsr,	[%l7 + 0x68]
	set	0x78, %o3
	swapa	[%l7 + %o3] 0x89,	%o5
	nop
	set	0x64, %i6
	lduh	[%l7 + %i6],	%l3
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%i7
	nop
	set	0x76, %l2
	ldub	[%l7 + %l2],	%o2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%g1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	fpadd32s	%f17,	%f12,	%f12
	nop
	set	0x0C, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x08, %i3
	stxa	%l6,	[%l7 + %i3] 0xea
	membar	#Sync
	wr	%i4,	%l4,	%clear_softint
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	ld	[%l7 + 0x08],	%f25
	nop
	set	0x4D, %i4
	stb	%o7,	[%l7 + %i4]
	nop
	set	0x48, %g5
	std	%l4,	[%l7 + %g5]
	nop
	set	0x08, %g2
	std	%l0,	[%l7 + %g2]
	and	%l2,	%i1,	%g5
	set	0x28, %l5
	stxa	%i0,	[%l7 + %l5] 0x89
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%o6
	nop
	set	0x68, %l1
	ldsh	[%l7 + %l1],	%g2
	nop
	set	0x79, %o5
	stb	%i2,	[%l7 + %o5]
	set	0x35, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o3
	nop
	set	0x08, %l6
	stw	%g6,	[%l7 + %l6]
	nop
	set	0x10, %g1
	std	%f10,	[%l7 + %g1]
	set	0x5A, %l4
	stha	%g7,	[%l7 + %l4] 0x80
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%g2
	st	%f24,	[%l7 + 0x20]
	nop
	set	0x54, %o1
	lduw	[%l7 + %o1],	%i3
	nop
	set	0x14, %o4
	swap	[%l7 + %o4],	%l0
	st	%f31,	[%l7 + 0x5C]
	nop
	set	0x40, %o0
	swap	[%l7 + %o0],	%i5
	nop
	set	0x58, %o7
	std	%f14,	[%l7 + %o7]
	bg,pt	%icc,	loop_89
	st	%f15,	[%l7 + 0x30]
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o4
	set	0x18, %g7
	stwa	%g4,	[%l7 + %g7] 0xeb
	membar	#Sync
loop_89:
	nop
	set	0x48, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x08, %o6
	stx	%o1,	[%l7 + %o6]
	nop
	set	0x54, %i1
	stb	%o5,	[%l7 + %i1]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%i6
	nop
	set	0x34, %o3
	stw	%o2,	[%l7 + %o3]
	set	0x54, %l0
	lda	[%l7 + %l0] 0x88,	%f6
	st	%f6,	[%l7 + 0x50]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%o0
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x80,	%i7
	fpsub16s	%f22,	%f17,	%f14
	nop
	set	0x48, %i5
	std	%f18,	[%l7 + %i5]
	nop
	set	0x20, %i0
	lduh	[%l7 + %i0],	%l6
	nop
	set	0x18, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x18, %g4
	prefetcha	[%l7 + %g4] 0x81,	 3
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x89,	%l4
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x88,	%o7
	set	0x40, %i3
	sta	%f2,	[%l7 + %i3] 0x80
	set	0x24, %l5
	stwa	%l5,	[%l7 + %l5] 0x89
	nop
	set	0x78, %g2
	std	%f0,	[%l7 + %g2]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x80,	%g0
	nop
	nop
	setx	0x39B63B49AA31D0F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0174E5C6AF96E1B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f28,	%f20
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%l1
	set	0x24, %g6
	swapa	[%l7 + %g6] 0x81,	%i1
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%l2
	set	0x52, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g5
	st	%f20,	[%l7 + 0x44]
	nop
	set	0x18, %l4
	std	%f22,	[%l7 + %l4]
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%i0
	wr	%o6,	%g2,	%ccr
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%i2
	nop
	nop
	setx	0xBDC39DFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x0561D374,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f27,	%f19
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	nop
	set	0x18, %o4
	swap	[%l7 + %o4],	%g6
	set	0x18, %o7
	stxa	%o3,	[%l7 + %o7] 0x80
	set	0x18, %o0
	stda	%g2,	[%l7 + %o0] 0x80
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 0
	set	0x70, %o6
	stda	%i2,	[%l7 + %o6] 0x89
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%l0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x38, %i1
	ldsb	[%l7 + %i1],	%o4
	set	0x1E, %o3
	stha	%g4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f2
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i5
	set	0x28, %l2
	stxa	%o5,	[%l7 + %l2] 0xeb
	membar	#Sync
	or	%l3,	%o1,	%o2
	set	0x20, %i5
	sta	%f31,	[%l7 + %i5] 0x88
	nop
	set	0x1C, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x40, %i6
	swap	[%l7 + %i6],	%i6
	set	0x4A, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o0
	nop
	set	0x30, %i4
	stx	%i7,	[%l7 + %i4]
	set	0x5F, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i4
	st	%fsr,	[%l7 + 0x30]
	set	0x44, %i3
	lda	[%l7 + %i3] 0x80,	%f20
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x88,	%l6
	nop
	set	0x20, %i7
	ldx	[%l7 + %i7],	%l4
	fpsub16s	%f5,	%f21,	%f18
	and	%l5,	%g1,	%l1
	nop
	set	0x38, %l1
	stw	%o7,	[%l7 + %l1]
	add	%l2,	%i1,	%g5
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%i0
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%o6
	nop
	set	0x08, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x48, %o5
	stx	%g2,	[%l7 + %o5]
	set	0x08, %l3
	stxa	%g6,	[%l7 + %l3] 0x89
	nop
	set	0x53, %l4
	stb	%o3,	[%l7 + %l4]
	or	%g3,	%i2,	%i3
	nop
	set	0x64, %l6
	stb	%l0,	[%l7 + %l6]
	nop
	set	0x30, %o4
	lduw	[%l7 + %o4],	%o4
	nop
	set	0x50, %o1
	std	%f12,	[%l7 + %o1]
	nop
	set	0x78, %o0
	swap	[%l7 + %o0],	%g4
	nop
	set	0x4D, %o7
	ldub	[%l7 + %o7],	%g7
	st	%f11,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f28
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xe2,	%o4
	nop
	set	0x28, %i1
	swap	[%l7 + %i1],	%l3
	nop
	set	0x6B, %o2
	ldstub	[%l7 + %o2],	%o1
	nop
	set	0x58, %l0
	std	%o2,	[%l7 + %l0]
	nop
	set	0x74, %g7
	ldsw	[%l7 + %g7],	%i6
	nop
	set	0x46, %l2
	sth	%i5,	[%l7 + %l2]
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	set	0x54, %i0
	ldsw	[%l7 + %i0],	%l6
	st	%f16,	[%l7 + 0x38]
	nop
	set	0x1E, %g4
	ldsh	[%l7 + %g4],	%i4
	set	0x10, %i6
	lda	[%l7 + %i6] 0x88,	%f5
	wr	%l5,	%l4,	%sys_tick
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xea,	%g0
	set	0x5C, %i3
	stha	%o7,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x40, %l5
	stw	%l1,	[%l7 + %l5]
	nop
	set	0x30, %g5
	std	%i0,	[%l7 + %g5]
	nop
	set	0x7B, %l1
	ldsb	[%l7 + %l1],	%l2
	set	0x54, %i7
	lda	[%l7 + %i7] 0x88,	%f30
	nop
	set	0x4C, %i2
	ldstub	[%l7 + %i2],	%g5
	nop
	set	0x74, %g2
	ldsh	[%l7 + %g2],	%i0
	set	0x10, %g1
	stda	%g2,	[%l7 + %g1] 0x80
	or	%g6,	%o3,	%o6
	set	0x68, %o5
	stda	%g2,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x54, %l3
	sth	%i2,	[%l7 + %l3]
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f12
	nop
	set	0x3B, %l6
	ldub	[%l7 + %l6],	%l0
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x88
	set	0x45, %o1
	stba	%o4,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x18, %l4
	stxa	%g4,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x66, %o7
	ldstub	[%l7 + %o7],	%i3
	set	0x3E, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o5
	nop
	set	0x60, %o6
	swap	[%l7 + %o6],	%g7
	nop
	set	0x50, %g3
	std	%l2,	[%l7 + %g3]
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x89,	%o2
	set	0x16, %i1
	stha	%i6,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xca
	set	0x48, %g7
	stda	%i4,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f0
	set	0x08, %i0
	ldxa	[%l7 + %i0] 0x81,	%i7
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%o1
	ld	[%l7 + 0x28],	%f25
	nop
	set	0x28, %i6
	ldsb	[%l7 + %i6],	%l6
	set	0x2C, %l2
	lda	[%l7 + %l2] 0x80,	%f9
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%o0
	or	%l5,	%l4,	%g1
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x81,	%o7
	nop
	set	0x40, %i4
	ldub	[%l7 + %i4],	%i4
	nop
	set	0x15, %l1
	ldub	[%l7 + %l1],	%l1
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x88,	%l2
	set	0x44, %g5
	stha	%g5,	[%l7 + %g5] 0x89
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x89,	%i1
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	or	%g2,	%g6,	%o6
	add	%g3,	%o3,	%l0
	nop
	set	0x6E, %g1
	sth	%i2,	[%l7 + %g1]
	set	0x54, %o5
	stwa	%g4,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f20
	bleu,a,pn	%icc,	loop_90
	nop
	set	0x54, %l6
	lduh	[%l7 + %l6],	%o4
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f26
	nop
	set	0x0C, %o1
	ldsw	[%l7 + %o1],	%i3
loop_90:
	add	%g7,	%l3,	%o5
	nop
	set	0x20, %l3
	stb	%o2,	[%l7 + %l3]
	set	0x76, %o7
	stha	%i5,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x60, %o0
	stda	%i6,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x5C, %l4
	stw	%i7,	[%l7 + %l4]
	st	%f6,	[%l7 + 0x08]
	nop
	set	0x6A, %g3
	ldsh	[%l7 + %g3],	%l6
	st	%fsr,	[%l7 + 0x38]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%l5
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x32, %o6
	ldsh	[%l7 + %o6],	%l4
	st	%f8,	[%l7 + 0x18]
	nop
	set	0x5C, %l0
	ldsw	[%l7 + %l0],	%o0
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f30
	set	0x18, %g7
	lda	[%l7 + %g7] 0x88,	%f19
	nop
	set	0x76, %i0
	lduh	[%l7 + %i0],	%g1
	nop
	set	0x43, %g4
	ldub	[%l7 + %g4],	%i4
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x81,	%l1
	nop
	set	0x50, %l2
	std	%f16,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x48]
	set	0x28, %i3
	stda	%l2,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x5A, %l5
	stba	%o7,	[%l7 + %l5] 0x80
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd0,	%f16
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xd8
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%g5,	%i0,	%i1
	and	%g6,	%o6,	%g2
	nop
	set	0x74, %i7
	lduw	[%l7 + %i7],	%o3
	nop
	set	0x28, %g5
	ldsh	[%l7 + %g5],	%l0
	nop
	set	0x6C, %i2
	lduh	[%l7 + %i2],	%g3
	nop
	nop
	setx	0x671A983BE9A1774A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCAA850358FE060A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f28,	%f26
	fpadd16	%f6,	%f6,	%f16
	set	0x60, %g1
	sta	%f7,	[%l7 + %g1] 0x80
	and	%g4,	%o4,	%i2
	nop
	set	0x24, %g2
	ldsw	[%l7 + %g2],	%i3
	set	0x78, %o5
	stxa	%g7,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%l3,	%o2,	%i5
	set	0x10, %g6
	stda	%i6,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x28, %o4
	lduw	[%l7 + %o4],	%i7
	set	0x20, %o1
	lda	[%l7 + %o1] 0x89,	%f6
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%l6
	nop
	set	0x20, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%o0
	nop
	set	0x78, %l4
	ldstub	[%l7 + %l4],	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%i4
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f14
	st	%f14,	[%l7 + 0x7C]
	nop
	set	0x64, %o2
	ldsw	[%l7 + %o2],	%l1
	st	%f25,	[%l7 + 0x70]
	nop
	set	0x28, %g3
	prefetch	[%l7 + %g3],	 0
	ld	[%l7 + 0x74],	%f1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xe3,	%l2
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf0
	membar	#Sync
	nop
	set	0x62, %o6
	ldsh	[%l7 + %o6],	%l4
	nop
	set	0x77, %g7
	stb	%o7,	[%l7 + %g7]
	set	0x18, %i0
	stda	%g4,	[%l7 + %i0] 0x89
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%i0
	nop
	set	0x34, %i5
	stb	%g6,	[%l7 + %i5]
	nop
	set	0x2C, %l2
	stw	%i1,	[%l7 + %l2]
	set	0x14, %i3
	stwa	%o6,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%g2,	%l0,	%o3
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x89,	%g4
	st	%f13,	[%l7 + 0x2C]
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x81
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd0
	set	0x68, %i7
	lda	[%l7 + %i7] 0x88,	%f20
	nop
	set	0x38, %g5
	swap	[%l7 + %g5],	%i2
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%o4
	set	0x1E, %g1
	stha	%g7,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x7D, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i3
	set	0x68, %i4
	stda	%l2,	[%l7 + %i4] 0x88
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%o2
	nop
	set	0x20, %g6
	swap	[%l7 + %g6],	%i5
	nop
	set	0x3C, %o4
	lduh	[%l7 + %o4],	%i7
	or	%l6,	%o1,	%i6
	nop
	set	0x52, %l3
	ldub	[%l7 + %l3],	%o5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f16
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%o0
	set	0x70, %l6
	stha	%l5,	[%l7 + %l6] 0x89
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%i4
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%g1
	set	0x60, %o2
	stda	%l2,	[%l7 + %o2] 0x88
	ld	[%l7 + 0x78],	%f10
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%l4
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x81,	%o7
	set	0x46, %o6
	stba	%l1,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x70, %g7
	std	%i0,	[%l7 + %g7]
	set	0x58, %i1
	stba	%g5,	[%l7 + %i1] 0x80
	and	%g6,	%o6,	%g2
	or	%i1,	%l0,	%g4
	nop
	set	0x08, %i0
	swap	[%l7 + %i0],	%g3
	set	0x76, %g4
	stha	%i2,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x49, %l2
	ldstuba	[%l7 + %l2] 0x89,	%o3
	add	%o4,	%i3,	%l3
	or	%g7,	%i5,	%o2
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xe3,	%i6
	add	%o1,	%i6,	%o5
	nop
	set	0x1C, %o3
	ldstub	[%l7 + %o3],	%l6
	nop
	set	0x28, %l5
	stx	%l5,	[%l7 + %l5]
	set	0x70, %i6
	lda	[%l7 + %i6] 0x89,	%f15
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	nop
	set	0x38, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x16, %g5
	ldstub	[%l7 + %g5],	%o0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%g1
	fpadd32s	%f28,	%f5,	%f2
	nop
	set	0x30, %i7
	std	%f0,	[%l7 + %i7]
	nop
	set	0x54, %g1
	lduw	[%l7 + %g1],	%l4
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x81,	%l2
	set	0x0A, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l1
	nop
	set	0x08, %o5
	lduw	[%l7 + %o5],	%o7
	set	0x18, %g2
	stda	%g4,	[%l7 + %g2] 0x89
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%g6
	set	0x40, %l3
	stwa	%o6,	[%l7 + %l3] 0x88
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x81,	 1
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x81,	%i0
	ld	[%l7 + 0x50],	%f18
	nop
	set	0x39, %l6
	ldub	[%l7 + %l6],	%g2
	set	0x6C, %o7
	stwa	%g4,	[%l7 + %o7] 0xeb
	membar	#Sync
	or	%l0,	%i2,	%g3
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xeb,	%o4
	ld	[%l7 + 0x38],	%f22
	nop
	set	0x7C, %o0
	lduw	[%l7 + %o0],	%o3
	set	0x22, %o2
	stba	%l3,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x51, %l0
	ldub	[%l7 + %l0],	%g7
	nop
	set	0x30, %o6
	std	%i4,	[%l7 + %o6]
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x81,	%o2
	bge,a	%icc,	loop_91
	fpsub32	%f10,	%f10,	%f10
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x80,	%i3
loop_91:
	nop
	set	0x2E, %g7
	ldstub	[%l7 + %g7],	%i7
	set	0x70, %i0
	stda	%o0,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x3E, %l2
	sth	%i6,	[%l7 + %l2]
	set	0x7C, %i3
	stha	%l6,	[%l7 + %i3] 0x81
	set	0x20, %g4
	stxa	%o5,	[%l7 + %g4] 0x89
	nop
	set	0x5C, %o3
	stw	%o0,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x7C]
	set	0x10, %i6
	sta	%f11,	[%l7 + %i6] 0x88
	ble,a,pt	%xcc,	loop_92
	nop
	set	0x44, %l5
	ldub	[%l7 + %l5],	%i4
	set	0x18, %i5
	stxa	%g1,	[%l7 + %i5] 0x81
loop_92:
	or	%l5,	%l2,	%l1
	nop
	set	0x2F, %g5
	stb	%l4,	[%l7 + %g5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%g6
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%o6
	ld	[%l7 + 0x40],	%f25
	nop
	set	0x6D, %l1
	ldub	[%l7 + %l1],	%o7
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x89,	%i0
	set	0x30, %i4
	stxa	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	and	%g4,	%i1,	%i2
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x81,	%g3
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x70, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x24, %o5
	ldsh	[%l7 + %o5],	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%l3
	add	%i5,	%g7,	%o2
	bge,a,pn	%icc,	loop_93
	ld	[%l7 + 0x6C],	%f17
	set	0x5E, %g6
	stha	%i7,	[%l7 + %g6] 0xe2
	membar	#Sync
loop_93:
	nop
	set	0x2C, %l3
	ldstub	[%l7 + %l3],	%i3
	wr	%o1,	%l6,	%set_softint
	nop
	set	0x30, %o1
	std	%f0,	[%l7 + %o1]
	nop
	set	0x24, %o4
	prefetch	[%l7 + %o4],	 2
	add	%o5,	%i6,	%o0
	set	0x1C, %l6
	lda	[%l7 + %l6] 0x88,	%f28
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f0
	set	0x44, %o7
	swapa	[%l7 + %o7] 0x81,	%g1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%l2
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f6
	nop
	set	0x44, %l0
	lduh	[%l7 + %l0],	%l5
	set	0x58, %o0
	lda	[%l7 + %o0] 0x80,	%f12
	set	0x10, %o6
	sta	%f6,	[%l7 + %o6] 0x88
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f0
	set	0x3A, %i1
	stha	%l4,	[%l7 + %i1] 0x80
	st	%f14,	[%l7 + 0x44]
	set	0x20, %g7
	stha	%l1,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x70, %i0
	stda	%g4,	[%l7 + %i0] 0x81
	nop
	set	0x20, %i3
	stx	%o6,	[%l7 + %i3]
	nop
	set	0x68, %g4
	lduh	[%l7 + %g4],	%g6
	and	%i0,	%o7,	%g2
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%i1
	nop
	set	0x1B, %i6
	ldstub	[%l7 + %i6],	%g4
	and	%i2,	%l0,	%g3
	nop
	set	0x1E, %l2
	sth	%o3,	[%l7 + %l2]
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%l3
	nop
	set	0x6C, %g5
	ldsh	[%l7 + %g5],	%o4
	set	0x1C, %i7
	swapa	[%l7 + %i7] 0x80,	%g7
	nop
	set	0x24, %g1
	stw	%o2,	[%l7 + %g1]
	nop
	set	0x08, %l1
	stw	%i7,	[%l7 + %l1]
	ba	%icc,	loop_94
	nop
	set	0x52, %i2
	ldsb	[%l7 + %i2],	%i5
	set	0x08, %g2
	stda	%i2,	[%l7 + %g2] 0xe3
	membar	#Sync
loop_94:
	and	%l6,	%o5,	%o1
	nop
	set	0x0B, %o5
	ldsb	[%l7 + %o5],	%o0
	set	0x51, %g6
	stba	%g1,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x7D, %i4
	stba	%i4,	[%l7 + %i4] 0x89
	nop
	set	0x30, %o1
	std	%l2,	[%l7 + %o1]
	nop
	set	0x30, %o4
	stw	%i6,	[%l7 + %o4]
	and	%l4,	%l1,	%l5
	set	0x4D, %l3
	stba	%g5,	[%l7 + %l3] 0x81
	nop
	set	0x70, %l6
	stx	%o6,	[%l7 + %l6]
	nop
	set	0x64, %o7
	lduw	[%l7 + %o7],	%g6
	nop
	set	0x30, %l4
	std	%o6,	[%l7 + %l4]
	set	0x68, %l0
	stda	%g2,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc2
	set	0x70, %o0
	stda	%i0,	[%l7 + %o0] 0x81
	nop
	set	0x4E, %g3
	lduh	[%l7 + %g3],	%g4
	add	%i0,	%l0,	%i2
	nop
	set	0x38, %o6
	std	%o2,	[%l7 + %o6]
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 3
	set	0x78, %i0
	stha	%g3,	[%l7 + %i0] 0x88
	or	%l3,	%g7,	%o4
	or	%o2,	%i7,	%i5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o5
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe2,	%o0
	nop
	set	0x74, %g7
	lduh	[%l7 + %g7],	%o0
	nop
	set	0x58, %g4
	stw	%g1,	[%l7 + %g4]
	nop
	set	0x0C, %o3
	ldsh	[%l7 + %o3],	%i4
	nop
	set	0x10, %i6
	stx	%l2,	[%l7 + %i6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%i3
	set	0x3E, %l5
	stba	%l4,	[%l7 + %l5] 0x81
	nop
	set	0x5C, %i5
	sth	%l5,	[%l7 + %i5]
	nop
	set	0x0E, %g5
	ldsb	[%l7 + %g5],	%l1
	set	0x24, %i7
	lda	[%l7 + %i7] 0x80,	%f22
	nop
	set	0x42, %l2
	ldstub	[%l7 + %l2],	%g5
	set	0x4C, %l1
	sta	%f28,	[%l7 + %l1] 0x88
	set	0x10, %g1
	stda	%g6,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x14, %i2
	stb	%o7,	[%l7 + %i2]
	nop
	set	0x1C, %o5
	lduw	[%l7 + %o5],	%g2
	nop
	set	0x1E, %g2
	ldstub	[%l7 + %g2],	%o6
	set	0x34, %g6
	stha	%g4,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x2A, %o1
	lduh	[%l7 + %o1],	%i0
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%i1
	set	0x08, %l3
	lda	[%l7 + %l3] 0x80,	%f12
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x80,	%l0
	nop
	set	0x60, %o7
	stw	%o3,	[%l7 + %o7]
	nop
	set	0x68, %l4
	stx	%i2,	[%l7 + %l4]
	nop
	set	0x4C, %o4
	ldub	[%l7 + %o4],	%g3
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x88,	%g6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%o4
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%o2
	nop
	set	0x12, %o0
	ldsh	[%l7 + %o0],	%i5
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f26
	wr	%i7,	%l6,	%softint
	set	0x13, %i1
	stba	%o1,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x50, %g3
	stwa	%o5,	[%l7 + %g3] 0x88
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%o0
	nop
	set	0x38, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	nop
	setx	0xB14C68FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x01718263,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f17,	%f3
	set	0x1B, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i4
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	ld	[%l7 + 0x08],	%f4
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x81,	%i6
	nop
	set	0x62, %g7
	ldsh	[%l7 + %g7],	%l2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x88,	%l4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x80
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%l1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	set	0x56, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g5
	set	0x08, %i5
	stwa	%l5,	[%l7 + %i5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	nop
	nop
	setx	0x7764884ABE956AD3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x3DF162EA4B03A176,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f10,	%f6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc0
	fpsub16	%f2,	%f30,	%f22
	set	0x7C, %l1
	sta	%f5,	[%l7 + %l1] 0x81
	nop
	set	0x4F, %o5
	ldstub	[%l7 + %o5],	%o7
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%g6
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	nop
	set	0x6B, %o1
	stb	%g4,	[%l7 + %o1]
	set	0x18, %i4
	stda	%i0,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x80,	%i0
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x81,	 2
	set	0x70, %o7
	stda	%l0,	[%l7 + %o7] 0x80
	nop
	set	0x34, %l4
	lduw	[%l7 + %l4],	%o3
	or	%g3,	%i2,	%l3
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x80,	%g7
	nop
	set	0x3C, %o2
	stw	%o4,	[%l7 + %o2]
	nop
	set	0x4C, %o4
	swap	[%l7 + %o4],	%o2
	nop
	set	0x18, %l0
	stx	%i7,	[%l7 + %l0]
	nop
	set	0x10, %o0
	std	%i4,	[%l7 + %o0]
	set	0x08, %i1
	ldxa	[%l7 + %i1] 0x89,	%o1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l6
	nop
	set	0x60, %i3
	stx	%g1,	[%l7 + %i3]
	nop
	set	0x4C, %i0
	ldub	[%l7 + %i0],	%o5
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%o0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
	nop
	set	0x0C, %g7
	ldstub	[%l7 + %g7],	%i6
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f8
	set	0x3E, %i7
	stha	%l2,	[%l7 + %i7] 0x81
	set	0x50, %l2
	stda	%i4,	[%l7 + %l2] 0x88
	set	0x20, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	and	%l4,	%g5,	%l5
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%f14
	set	0x30, %l1
	stxa	%o7,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x50, %l5
	stda	%l0,	[%l7 + %l5] 0x88
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	set	0x68, %i2
	stwa	%g6,	[%l7 + %i2] 0x80
	nop
	set	0x3D, %o5
	stb	%g2,	[%l7 + %o5]
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	nop
	setx	0xBA363554,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xAF3C4F69,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f16,	%f5
	nop
	set	0x7C, %i4
	prefetch	[%l7 + %i4],	 0
	set	0x60, %g6
	lda	[%l7 + %g6] 0x88,	%f22
	ld	[%l7 + 0x48],	%f2
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xe2,	%i0
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f24
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x89,	%i1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%o6
	bne,pt	%icc,	loop_95
	nop
	set	0x5F, %o4
	ldub	[%l7 + %o4],	%o3
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f16
loop_95:
	nop
	set	0x1C, %l0
	swap	[%l7 + %l0],	%g3
	set	0x14, %o0
	lda	[%l7 + %o0] 0x89,	%f24
	fpsub32	%f14,	%f4,	%f30
	set	0x32, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l3
	set	0x68, %o6
	stda	%g6,	[%l7 + %o6] 0x81
	nop
	set	0x40, %g3
	stw	%o4,	[%l7 + %g3]
	nop
	set	0x5C, %i3
	swap	[%l7 + %i3],	%o2
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x2C, %o3
	ldsb	[%l7 + %o3],	%i2
	nop
	set	0x2C, %g4
	ldsh	[%l7 + %g4],	%i7
	or	%o1,	%i5,	%g1
	nop
	set	0x70, %i0
	std	%f8,	[%l7 + %i0]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xca
	set	0x5C, %g7
	lda	[%l7 + %g7] 0x80,	%f29
	nop
	set	0x28, %g5
	std	%f8,	[%l7 + %g5]
	nop
	set	0x21, %i7
	stb	%o5,	[%l7 + %i7]
	set	0x2C, %l2
	ldstuba	[%l7 + %l2] 0x89,	%o0
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%l6
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x80,	 2
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%i6,	%i4,	%i3
	nop
	set	0x0C, %l5
	ldsb	[%l7 + %l5],	%l4
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%g5
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x89,	%o7
	or	%l1,	%g6,	%g2
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%g4
	ld	[%l7 + 0x28],	%f23
	nop
	set	0x3C, %g6
	stw	%i0,	[%l7 + %g6]
	set	0x2C, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l5
	set	0x68, %o5
	lda	[%l7 + %o5] 0x88,	%f4
	or	%l0,	%o6,	%i1
	nop
	set	0x2C, %l6
	stw	%g3,	[%l7 + %l6]
	nop
	set	0x4C, %l4
	lduw	[%l7 + %l4],	%l3
	set	0x14, %o2
	stwa	%g7,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x7E, %o4
	stb	%o4,	[%l7 + %o4]
	or	%o2,	%o3,	%i2
	nop
	set	0x30, %l0
	ldsw	[%l7 + %l0],	%i7
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x88,	%o1
	ble,pn	%xcc,	loop_96
	bne,a	%xcc,	loop_97
	nop
	set	0x59, %o0
	ldsb	[%l7 + %o0],	%g1
	set	0x56, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o5
loop_96:
	nop
	set	0x70, %i3
	stxa	%i5,	[%l7 + %i3] 0x81
loop_97:
	nop
	set	0x58, %o3
	stxa	%l6,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x20, %g4
	stx	%o0,	[%l7 + %g4]
	nop
	set	0x49, %o6
	ldstub	[%l7 + %o6],	%i6
	set	0x30, %i0
	stwa	%l2,	[%l7 + %i0] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%l4
	nop
	set	0x54, %g7
	lduw	[%l7 + %g7],	%g5
	nop
	set	0x1C, %g5
	stw	%i4,	[%l7 + %g5]
	set	0x18, %i7
	stda	%o6,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x18, %l2
	ldub	[%l7 + %l2],	%g6
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%l1
	nop
	set	0x60, %g1
	stx	%g4,	[%l7 + %g1]
	nop
	set	0x30, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x7C, %i5
	lduh	[%l7 + %i5],	%i0
	set	0x2C, %l5
	stha	%l5,	[%l7 + %l5] 0x88
	add	%g2,	%l0,	%o6
	nop
	set	0x52, %g2
	sth	%i1,	[%l7 + %g2]
	nop
	set	0x40, %o1
	lduh	[%l7 + %o1],	%g3
	nop
	set	0x28, %i2
	stb	%l3,	[%l7 + %i2]
	set	0x22, %i4
	stha	%g7,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x18, %g6
	stw	%o4,	[%l7 + %g6]
	nop
	set	0x6E, %l3
	lduh	[%l7 + %l3],	%o2
	nop
	set	0x78, %o5
	ldsw	[%l7 + %o5],	%o3
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x89,	%i6
	nop
	set	0x08, %o2
	lduw	[%l7 + %o2],	%o1
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x80,	%g0
	nop
	set	0x24, %o4
	stw	%i2,	[%l7 + %o4]
	nop
	set	0x70, %o7
	stx	%o5,	[%l7 + %o7]
	nop
	set	0x44, %l0
	ldsh	[%l7 + %l0],	%l6
	set	0x64, %i1
	swapa	[%l7 + %i1] 0x88,	%o0
	nop
	set	0x5E, %o0
	sth	%i6,	[%l7 + %o0]
	st	%f23,	[%l7 + 0x50]
	or	%i5,	%i3,	%l4
	set	0x14, %g3
	sta	%f3,	[%l7 + %g3] 0x88
	or	%g5,	%i4,	%l2
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%o7
	nop
	set	0x14, %g4
	lduw	[%l7 + %g4],	%l1
	fpsub32s	%f4,	%f18,	%f24
	nop
	set	0x18, %i3
	stx	%g4,	[%l7 + %i3]
	nop
	set	0x08, %i0
	lduh	[%l7 + %i0],	%g6
	nop
	set	0x0E, %g7
	ldsh	[%l7 + %g7],	%i0
	nop
	set	0x20, %o6
	sth	%l5,	[%l7 + %o6]
	set	0x48, %i7
	lda	[%l7 + %i7] 0x89,	%f19
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x81
	ba,a	%xcc,	loop_98
	nop
	set	0x44, %i6
	swap	[%l7 + %i6],	%l0
	set	0x58, %g1
	stda	%g2,	[%l7 + %g1] 0xeb
	membar	#Sync
loop_98:
	nop
	set	0x08, %g5
	stwa	%i1,	[%l7 + %g5] 0xe2
	membar	#Sync
	or	%o6,	%g3,	%l3
	or	%o4,	%g7,	%o3
	or	%o2,	%o1,	%g1
	add	%i7,	%o5,	%i2
	set	0x54, %l1
	stha	%o0,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x60, %i5
	stw	%i6,	[%l7 + %i5]
	and	%i5,	%i3,	%l4
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f22
	ld	[%l7 + 0x1C],	%f10
	set	0x5C, %o1
	stha	%l6,	[%l7 + %o1] 0x81
	and	%g5,	%l2,	%i4
	nop
	set	0x19, %g2
	ldsb	[%l7 + %g2],	%l1
	nop
	set	0x4A, %i2
	lduh	[%l7 + %i2],	%o7
	set	0x08, %g6
	lda	[%l7 + %g6] 0x89,	%f24
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xe2,	%g6
	nop
	set	0x49, %l3
	ldub	[%l7 + %l3],	%g4
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x14, %l4
	ldstub	[%l7 + %l4],	%l5
	nop
	set	0x24, %o2
	stw	%i0,	[%l7 + %o2]
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	nop
	set	0x62, %o7
	ldsh	[%l7 + %o7],	%g2
	set	0x20, %l0
	stha	%l0,	[%l7 + %l0] 0x89
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%o6
	nop
	set	0x6E, %i1
	ldub	[%l7 + %i1],	%i1
	set	0x20, %o0
	stwa	%g3,	[%l7 + %o0] 0x89
	nop
	set	0x60, %o3
	prefetch	[%l7 + %o3],	 0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%l3
	and	%o3,	%o2,	%o1
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f28
	ld	[%l7 + 0x0C],	%f17
	nop
	set	0x18, %g4
	lduw	[%l7 + %g4],	%g7
	nop
	set	0x38, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x40, %i0
	lduw	[%l7 + %i0],	%g1
	nop
	set	0x60, %g7
	ldx	[%l7 + %g7],	%i7
	wr	%o5,	%i2,	%y
	wr	%i6,	%i5,	%clear_softint
	nop
	set	0x5A, %i7
	ldstub	[%l7 + %i7],	%o0
	nop
	set	0x18, %l2
	stx	%l4,	[%l7 + %l2]
	set	0x60, %i6
	lda	[%l7 + %i6] 0x81,	%f22
	set	0x58, %g1
	stda	%i6,	[%l7 + %g1] 0x88
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%i3
	set	0x24, %l1
	lda	[%l7 + %l1] 0x81,	%f10
	nop
	set	0x60, %i5
	lduw	[%l7 + %i5],	%l2
	wr	%g5,	%l1,	%softint
	ld	[%l7 + 0x10],	%f3
	nop
	set	0x72, %o6
	sth	%o7,	[%l7 + %o6]
	set	0x60, %l5
	stda	%g6,	[%l7 + %l5] 0x88
	nop
	set	0x58, %g2
	std	%f10,	[%l7 + %g2]
	ld	[%l7 + 0x50],	%f1
	set	0x3E, %i2
	stha	%g4,	[%l7 + %i2] 0x80
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x1A, %i4
	ldstub	[%l7 + %i4],	%i0
	add	%l5,	%l0,	%o6
	st	%fsr,	[%l7 + 0x24]
	set	0x64, %g6
	stha	%i1,	[%l7 + %g6] 0x81
	set	0x2C, %l3
	stwa	%g2,	[%l7 + %l3] 0x89
	set	0x70, %l4
	stxa	%o4,	[%l7 + %l4] 0x89
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%o2
	add	%o1,	%g7,	%o3
	set	0x57, %l6
	stba	%g1,	[%l7 + %l6] 0x89
	nop
	set	0x10, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x2C, %l0
	sth	%i7,	[%l7 + %l0]
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x80,	%o5
	nop
	set	0x30, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x78, %o0
	stw	%i2,	[%l7 + %o0]
	nop
	set	0x70, %o3
	std	%f2,	[%l7 + %o3]
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%o0
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf1
	membar	#Sync
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%l4
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	ba,a,pt	%icc,	loop_99
	nop
	set	0x48, %i0
	ldsw	[%l7 + %i0],	%l6
	nop
	set	0x50, %i7
	stw	%i3,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x7C]
loop_99:
	nop
	set	0x54, %g7
	swap	[%l7 + %g7],	%i5
	nop
	set	0x0C, %i6
	lduw	[%l7 + %i6],	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%l2
	set	0x4E, %l2
	stha	%g6,	[%l7 + %l2] 0x80
	bne,a,pt	%xcc,	loop_100
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%o7
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x88,	%f0
loop_100:
	nop
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x88,	%g4
	wr	%i4,	%l5,	%clear_softint
	and	%i0,	%l0,	%i1
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf8
	membar	#Sync
	bgu,pt	%icc,	loop_101
	nop
	set	0x7C, %i5
	lduh	[%l7 + %i5],	%g2
	nop
	set	0x4E, %g2
	sth	%o4,	[%l7 + %g2]
	set	0x30, %i2
	sta	%f27,	[%l7 + %i2] 0x88
loop_101:
	fpadd16s	%f12,	%f13,	%f18
	set	0x3E, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l3
	set	0x44, %l5
	sta	%f8,	[%l7 + %l5] 0x89
	set	0x54, %i4
	sta	%f24,	[%l7 + %i4] 0x81
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%f8
	set	0x20, %l4
	lda	[%l7 + %l4] 0x80,	%f5
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%g2
	nop
	set	0x5E, %o5
	sth	%o2,	[%l7 + %o5]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g7
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xe3,	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%i7
	nop
	set	0x0C, %l6
	lduw	[%l7 + %l6],	%o5
	set	0x48, %l0
	sta	%f6,	[%l7 + %l0] 0x88
	and	%o3,	%i2,	%i6
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%o0
	ld	[%l7 + 0x70],	%f23
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f20
	set	0x58, %o3
	stxa	%l4,	[%l7 + %o3] 0x81
	nop
	set	0x08, %o2
	stb	%i3,	[%l7 + %o2]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i5
	st	%f19,	[%l7 + 0x10]
	fpsub32	%f18,	%f16,	%f28
	set	0x2A, %g4
	stha	%g5,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x57, %g3
	stb	%l2,	[%l7 + %g3]
	set	0x2E, %i1
	stba	%l1,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%o7
	nop
	set	0x2C, %i0
	ldsb	[%l7 + %i0],	%g6
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x89,	%g4
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x81,	 2
	nop
	set	0x68, %l2
	std	%f16,	[%l7 + %l2]
	bgu,pt	%xcc,	loop_102
	st	%f5,	[%l7 + 0x68]
	nop
	set	0x45, %i6
	ldsb	[%l7 + %i6],	%l5
	nop
	set	0x5C, %g1
	swap	[%l7 + %g1],	%l0
loop_102:
	nop
	set	0x78, %g5
	stha	%i1,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f0
	nop
	set	0x58, %l1
	stx	%g2,	[%l7 + %l1]
	set	0x50, %i5
	ldxa	[%l7 + %i5] 0x81,	%o4
	nop
	set	0x2B, %g2
	stb	%l3,	[%l7 + %g2]
	nop
	set	0x30, %i2
	stx	%i0,	[%l7 + %i2]
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%o1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%o6
	nop
	set	0x4C, %o1
	ldsh	[%l7 + %o1],	%g7
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f0
	set	0x3A, %l3
	stba	%g1,	[%l7 + %l3] 0xe2
	membar	#Sync
	and	%o5,	%o3,	%i7
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f28
	nop
	set	0x16, %g6
	ldstub	[%l7 + %g6],	%i2
	set	0x4B, %l6
	stba	%o0,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%i6
	set	0x5B, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i3
	nop
	set	0x40, %o4
	std	%f14,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x34]
	st	%f6,	[%l7 + 0x68]
	nop
	set	0x08, %o0
	stw	%l4,	[%l7 + %o0]
	set	0x2C, %o3
	stba	%l6,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%l2
	nop
	set	0x58, %o2
	std	%f4,	[%l7 + %o2]
	set	, %g3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1280
!	Type a   	: 20
!	Type cti   	: 30
!	Type x   	: 532
!	Type f   	: 37
!	Type i   	: 101
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
	set	0xD,	%g1
	set	0x5,	%g2
	set	0x7,	%g3
	set	0xD,	%g4
	set	0x5,	%g5
	set	0xC,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x1,	%i1
	set	-0x2,	%i2
	set	-0x7,	%i3
	set	-0xC,	%i4
	set	-0x9,	%i5
	set	-0xF,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x541980A3,	%l0
	set	0x041B4D83,	%l1
	set	0x13414015,	%l2
	set	0x13816B07,	%l3
	set	0x4B227F81,	%l4
	set	0x518A3FE3,	%l5
	set	0x3E24877E,	%l6
	!# Output registers
	set	0x1309,	%o0
	set	0x0938,	%o1
	set	0x09F9,	%o2
	set	0x0034,	%o3
	set	-0x0CB7,	%o4
	set	-0x1502,	%o5
	set	0x1F9C,	%o6
	set	0x1F07,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x60, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%g5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%o6
	nop
	set	0x30, %g7
	std	%f20,	[%l7 + %g7]
	and	%l1,	%g4,	%g6
	set	0x3A, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i4
	nop
	set	0x2C, %i3
	sth	%l0,	[%l7 + %i3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g2
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x89
	set	0x15, %g5
	stba	%i1,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x6B, %g1
	stb	%l3,	[%l7 + %g1]
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f8
	and	%i0,	%o2,	%o1
	nop
	set	0x29, %l1
	ldsb	[%l7 + %l1],	%g3
	nop
	set	0x50, %g2
	lduw	[%l7 + %g2],	%g7
	add	%o6,	%g1,	%o5
	nop
	set	0x4E, %i5
	ldsh	[%l7 + %i5],	%i7
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f28
	set	0x50, %i4
	stda	%i2,	[%l7 + %i4] 0x81
	nop
	set	0x52, %l5
	lduh	[%l7 + %l5],	%o0
	set	0x10, %o1
	stxa	%i6,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%i3
	nop
	set	0x28, %l4
	std	%f20,	[%l7 + %l4]
	set	0x30, %l3
	swapa	[%l7 + %l3] 0x88,	%l6
	set	0x70, %g6
	stda	%i4,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x15, %l6
	stba	%l2,	[%l7 + %l6] 0x80
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x88,	%g4
	nop
	set	0x34, %l0
	lduw	[%l7 + %l0],	%o7
	nop
	set	0x10, %o7
	stx	%l1,	[%l7 + %o7]
	wr	%l4,	%g4,	%softint
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x81,	%g6
	nop
	set	0x32, %o4
	ldsh	[%l7 + %o4],	%l0
	and	%i4,	%g2,	%o4
	st	%fsr,	[%l7 + 0x40]
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xeb,	%l4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc2
	set	0x6E, %g3
	stha	%i1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x35, %g4
	ldsb	[%l7 + %g4],	%l3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x80
	nop
	set	0x78, %i1
	stw	%i0,	[%l7 + %i1]
	and	%o1,	%g3,	%o2
	set	0x7F, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o6
	nop
	set	0x26, %i3
	sth	%g7,	[%l7 + %i3]
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x14, %i6
	stwa	%g1,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x58, %l2
	stda	%i6,	[%l7 + %l2] 0x81
	set	0x0C, %g5
	stwa	%o5,	[%l7 + %g5] 0x88
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%o0
	nop
	set	0x7C, %o6
	sth	%i2,	[%l7 + %o6]
	nop
	set	0x10, %g2
	swap	[%l7 + %g2],	%o3
	nop
	set	0x1E, %i5
	lduh	[%l7 + %i5],	%i6
	set	0x08, %i2
	ldstuba	[%l7 + %i2] 0x89,	%l6
	set	0x46, %i4
	stha	%i3,	[%l7 + %i4] 0x89
	nop
	set	0x37, %l1
	ldub	[%l7 + %l1],	%i5
	nop
	set	0x70, %l5
	lduw	[%l7 + %l5],	%l2
	set	0x2E, %l4
	stha	%g5,	[%l7 + %l4] 0x81
	wr 	%g0, 	0x7, 	%fprs
	st	%f10,	[%l7 + 0x30]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%o7
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x6E, %g6
	lduh	[%l7 + %g6],	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%i4
	nop
	set	0x18, %l3
	sth	%g2,	[%l7 + %l3]
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xe3,	%o4
	nop
	set	0x4A, %o5
	stb	%l5,	[%l7 + %o5]
	nop
	set	0x58, %l0
	stw	%i1,	[%l7 + %l0]
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x08, %o4
	stwa	%l3,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	nop
	setx	0xBC3912C914A57998,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB73218095296EBEA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f28,	%f8
	nop
	set	0x62, %o0
	stb	%i0,	[%l7 + %o0]
	nop
	set	0x52, %o3
	stb	%g3,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x68]
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x89,	%o1
	ld	[%l7 + 0x70],	%f19
	ld	[%l7 + 0x6C],	%f17
	set	0x1B, %g4
	stba	%o2,	[%l7 + %g4] 0xeb
	membar	#Sync
	st	%f1,	[%l7 + 0x5C]
	and	%g7,	%g1,	%i7
	nop
	set	0x6C, %i0
	stw	%o5,	[%l7 + %i0]
	or	%o0,	%o6,	%i2
	nop
	set	0x77, %g3
	stb	%o3,	[%l7 + %g3]
	nop
	set	0x08, %i1
	std	%f26,	[%l7 + %i1]
	ld	[%l7 + 0x1C],	%f24
	nop
	set	0x66, %g7
	sth	%l6,	[%l7 + %g7]
	add	%i3,	%i6,	%l2
	nop
	set	0x40, %i3
	ldsw	[%l7 + %i3],	%i5
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%l0
	nop
	set	0x28, %i7
	stb	%l4,	[%l7 + %i7]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%g4
	set	0x50, %g5
	lda	[%l7 + %g5] 0x89,	%f8
	set	0x48, %l2
	stda	%o6,	[%l7 + %l2] 0x88
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x40, %o6
	std	%f26,	[%l7 + %o6]
	set	0x0C, %i5
	sta	%f21,	[%l7 + %i5] 0x81
	set	0x10, %g2
	stha	%i4,	[%l7 + %g2] 0x80
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%l0
	set	0x70, %l1
	stxa	%g2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x2E, %i4
	ldsb	[%l7 + %i4],	%l5
	st	%f25,	[%l7 + 0x48]
	nop
	set	0x64, %l4
	stw	%o4,	[%l7 + %l4]
	set	0x70, %o1
	stxa	%l3,	[%l7 + %o1] 0x80
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x89,	%i0
	bg	%xcc,	loop_103
	nop
	set	0x2C, %l3
	stw	%i1,	[%l7 + %l3]
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x64, %l6
	stwa	%o1,	[%l7 + %l6] 0x80
loop_103:
	st	%f26,	[%l7 + 0x10]
	nop
	set	0x18, %l0
	std	%g2,	[%l7 + %l0]
	set	0x12, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o2
	nop
	set	0x52, %o4
	ldsh	[%l7 + %o4],	%g7
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xda
	and	%i7,	%o5,	%o0
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%i2
	add	%o3,	%o6,	%l6
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x88,	 3
	set	0x50, %i0
	stxa	%i3,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xea,	%i4
	nop
	set	0x28, %g4
	stb	%l2,	[%l7 + %g4]
	set	0x18, %i1
	stxa	%l4,	[%l7 + %i1] 0x80
	set	0x78, %g7
	sta	%f9,	[%l7 + %g7] 0x89
	ld	[%l7 + 0x28],	%f27
	nop
	set	0x40, %i3
	lduh	[%l7 + %i3],	%l1
	nop
	set	0x77, %i6
	stb	%g5,	[%l7 + %i6]
	nop
	set	0x3C, %g5
	stb	%g4,	[%l7 + %g5]
	nop
	set	0x7C, %l2
	ldub	[%l7 + %l2],	%o7
	nop
	set	0x3C, %g1
	ldub	[%l7 + %g1],	%i4
	set	0x7C, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l0
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x88,	 2
	nop
	set	0x7C, %g2
	lduw	[%l7 + %g2],	%g6
	nop
	set	0x3E, %i7
	lduh	[%l7 + %i7],	%o4
	or	%l5,	%l3,	%i0
	nop
	set	0x64, %i2
	stw	%i1,	[%l7 + %i2]
	set	0x2E, %l1
	stba	%g3,	[%l7 + %l1] 0x88
	st	%f19,	[%l7 + 0x08]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%o1
	st	%f12,	[%l7 + 0x2C]
	nop
	set	0x18, %l4
	stw	%g1,	[%l7 + %l4]
	nop
	set	0x70, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x20, %o1
	ldsb	[%l7 + %o1],	%i7
	nop
	set	0x3C, %l5
	stw	%g7,	[%l7 + %l5]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	nop
	set	0x78, %g6
	sth	%o5,	[%l7 + %g6]
	nop
	set	0x72, %l0
	lduh	[%l7 + %l0],	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%o6
	nop
	set	0x78, %l6
	lduw	[%l7 + %l6],	%l6
	nop
	set	0x34, %o7
	ldsw	[%l7 + %o7],	%i6
	or	%o3,	%i3,	%i5
	nop
	set	0x15, %o3
	ldstub	[%l7 + %o3],	%l4
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%g5
	set	0x70, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g4
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%o6
	nop
	set	0x79, %g3
	stb	%l1,	[%l7 + %g3]
	nop
	set	0x56, %o2
	ldsh	[%l7 + %o2],	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%g6
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%g2
	bge	%xcc,	loop_104
	nop
	set	0x5E, %g7
	lduh	[%l7 + %g7],	%o4
	set	0x68, %i3
	stwa	%l5,	[%l7 + %i3] 0xe3
	membar	#Sync
loop_104:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%l3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f16
	and	%g3,	%i1,	%o2
	set	0x24, %g5
	lda	[%l7 + %g5] 0x81,	%f26
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%g1
	set	0x62, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g7
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x81,	%o4
	and	%i2,	%i7,	%o0
	nop
	set	0x10, %g1
	stw	%o6,	[%l7 + %g1]
	nop
	set	0x34, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x46, %g2
	ldstub	[%l7 + %g2],	%l6
	set	0x39, %i7
	stba	%i6,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x1C, %o6
	stwa	%i3,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x7C, %i2
	lda	[%l7 + %i2] 0x81,	%f23
	bge,pn	%icc,	loop_105
	nop
	set	0x09, %l4
	ldsb	[%l7 + %l4],	%i5
	set	0x70, %l1
	lda	[%l7 + %l1] 0x81,	%f4
loop_105:
	nop
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x88
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%o3
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%l2
	set	0x4B, %l0
	stba	%g4,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x1F, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g5
	fpadd32s	%f0,	%f9,	%f1
	nop
	set	0x0C, %o5
	stw	%o7,	[%l7 + %o5]
	nop
	set	0x16, %l6
	stb	%l0,	[%l7 + %l6]
	set	0x0B, %o7
	stba	%l1,	[%l7 + %o7] 0x80
	nop
	set	0x7B, %o3
	stb	%g6,	[%l7 + %o3]
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%o4
	set	0x68, %i0
	stba	%l5,	[%l7 + %i0] 0x80
	st	%f9,	[%l7 + 0x08]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x89
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%g3
	ld	[%l7 + 0x20],	%f0
	nop
	set	0x54, %o2
	ldsw	[%l7 + %o2],	%i1
	and	%i4,	%o1,	%o2
	nop
	set	0x4D, %i1
	ldstub	[%l7 + %i1],	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%o5
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x88,	%i2
	nop
	set	0x16, %i6
	ldsb	[%l7 + %i6],	%o0
	wr	%i7,	%l6,	%clear_softint
	and	%o6,	%i3,	%i6
	fpadd32	%f22,	%f20,	%f14
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%i4
	nop
	set	0x70, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f14
	set	0x24, %g4
	lda	[%l7 + %g4] 0x89,	%f15
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	and	%l4,	%g4,	%l2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%g4
	set	0x69, %i7
	stba	%l0,	[%l7 + %i7] 0xeb
	membar	#Sync
	bgu	%xcc,	loop_106
	nop
	set	0x28, %o6
	std	%l0,	[%l7 + %o6]
	nop
	set	0x1D, %g1
	stb	%g6,	[%l7 + %g1]
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x88,	%o6
loop_106:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%l5
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x48, %l1
	stw	%o4,	[%l7 + %l1]
	nop
	set	0x0A, %o1
	ldub	[%l7 + %o1],	%l3
	or	%i0,	%i1,	%g3
	st	%fsr,	[%l7 + 0x78]
	st	%f13,	[%l7 + 0x1C]
	nop
	set	0x5A, %i4
	sth	%i4,	[%l7 + %i4]
	or	%o1,	%o2,	%g7
	set	0x34, %g6
	lda	[%l7 + %g6] 0x89,	%f14
	fpadd16	%f24,	%f8,	%f22
	nop
	set	0x77, %l3
	stb	%o5,	[%l7 + %l3]
	nop
	set	0x16, %l5
	ldsb	[%l7 + %l5],	%g1
	set	0x78, %o5
	sta	%f2,	[%l7 + %o5] 0x80
	bleu	%xcc,	loop_107
	nop
	set	0x44, %l0
	swap	[%l7 + %l0],	%i2
	set	0x58, %o7
	stha	%i7,	[%l7 + %o7] 0xea
	membar	#Sync
loop_107:
	nop
	set	0x69, %l6
	ldsb	[%l7 + %l6],	%o0
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%l6
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%i3
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%i6
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x7F, %o2
	ldstub	[%l7 + %o2],	%i5
	set	0x48, %i1
	stwa	%o3,	[%l7 + %i1] 0x81
	set	0x6A, %i3
	stha	%l4,	[%l7 + %i3] 0x89
	set	0x79, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o6
	set	0x7C, %g5
	stba	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x44, %i6
	stwa	%g4,	[%l7 + %i6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x28]
	set	0x18, %l2
	stwa	%l0,	[%l7 + %l2] 0x81
	nop
	set	0x40, %g7
	ldsw	[%l7 + %g7],	%g5
	set	0x74, %g4
	sta	%f0,	[%l7 + %g4] 0x81
	bgu	%xcc,	loop_108
	or	%g6,	%l1,	%o7
	set	0x78, %g2
	stxa	%g2,	[%l7 + %g2] 0x80
loop_108:
	nop
	set	0x59, %i5
	ldstuba	[%l7 + %i5] 0x80,	%l5
	nop
	set	0x44, %o6
	lduw	[%l7 + %o6],	%o4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i1
	nop
	set	0x13, %g1
	ldstub	[%l7 + %g1],	%g3
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x58, %l4
	stxa	%i0,	[%l7 + %l4] 0x88
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%i4
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 0
	nop
	set	0x28, %i2
	stw	%g7,	[%l7 + %i2]
	nop
	set	0x40, %i4
	stw	%o2,	[%l7 + %i4]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	or	%g1,	%o5,	%i7
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%o0
	nop
	set	0x58, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x64, %o5
	swap	[%l7 + %o5],	%l6
	set	0x5C, %l0
	stha	%i2,	[%l7 + %l0] 0xe2
	membar	#Sync
	add	%i3,	%i5,	%o3
	set	0x30, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i6
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xe2,	%o6
	set	0x0C, %o4
	sta	%f24,	[%l7 + %o4] 0x89
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%l4
	nop
	set	0x40, %i0
	stw	%g4,	[%l7 + %i0]
	set	0x54, %o3
	sta	%f13,	[%l7 + %o3] 0x81
	bg,pt	%xcc,	loop_109
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%l0
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc8
loop_109:
	nop
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x89,	%g5
	nop
	set	0x58, %g3
	lduh	[%l7 + %g3],	%l2
	nop
	set	0x5B, %o0
	ldstub	[%l7 + %o0],	%g6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc0
	or	%l1,	%o7,	%g2
	set	0x10, %l2
	stxa	%l5,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x30, %g7
	stda	%l2,	[%l7 + %g7] 0x80
	set	0x52, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i1
	nop
	set	0x43, %g5
	ldsb	[%l7 + %g5],	%o4
	nop
	set	0x6A, %g2
	stb	%i0,	[%l7 + %g2]
	or	%o1,	%i4,	%g7
	nop
	set	0x18, %o6
	stx	%g3,	[%l7 + %o6]
	set	0x40, %i5
	sta	%f19,	[%l7 + %i5] 0x88
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%o2
	nop
	set	0x24, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x18, %l1
	stda	%o4,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x30, %i2
	stwa	%i7,	[%l7 + %i2] 0x80
	nop
	set	0x0A, %l4
	stb	%g1,	[%l7 + %l4]
	nop
	set	0x1C, %i4
	stw	%l6,	[%l7 + %i4]
	nop
	set	0x08, %o1
	stw	%o0,	[%l7 + %o1]
	set	0x70, %l5
	swapa	[%l7 + %l5] 0x89,	%i3
	set	0x51, %o5
	stba	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x10, %g6
	stx	%i5,	[%l7 + %g6]
	nop
	set	0x78, %l0
	sth	%o3,	[%l7 + %l0]
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x64, %o4
	lduh	[%l7 + %o4],	%o6
	nop
	set	0x70, %o7
	stx	%l4,	[%l7 + %o7]
	nop
	set	0x30, %l6
	std	%f0,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x48]
	or	%g4,	%i6,	%l0
	nop
	set	0x28, %i0
	swap	[%l7 + %i0],	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%g6
	set	0x08, %o3
	lda	[%l7 + %o3] 0x81,	%f19
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f30
	add	%l1,	%o7,	%g2
	ld	[%l7 + 0x14],	%f4
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%l3
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf1,	%f16
	or	%i1,	%o4,	%l5
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xea,	%o0
	or	%i4,	%g7,	%i0
	set	0x46, %i6
	stha	%g3,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x5C, %l2
	stwa	%o2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x6E, %g7
	ldsh	[%l7 + %g7],	%i7
	nop
	set	0x0C, %o0
	stw	%o5,	[%l7 + %o0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%g1
	set	0x10, %g4
	stxa	%o0,	[%l7 + %g4] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%i2
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	ld	[%l7 + 0x50],	%f17
	fpsub32	%f22,	%f16,	%f22
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i5
	nop
	set	0x3A, %g2
	lduh	[%l7 + %g2],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%o6
	nop
	set	0x0A, %i7
	ldsb	[%l7 + %i7],	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x7A, %g1
	stba	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x3C, %l1
	stw	%l1,	[%l7 + %l1]
	set	0x1E, %i5
	stba	%o7,	[%l7 + %i5] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%l3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe2,	%i0
	set	0x20, %i2
	stda	%o4,	[%l7 + %i2] 0x89
	fpsub32	%f2,	%f20,	%f8
	nop
	set	0x79, %i4
	ldstub	[%l7 + %i4],	%l5
	set	0x34, %o1
	stba	%g6,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%o1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f0
	nop
	set	0x40, %l0
	std	%g6,	[%l7 + %l0]
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x81,	%i0
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%g2
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x88,	%o2
	set	0x2A, %l6
	stha	%i7,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f30
	nop
	set	0x28, %o3
	std	%i4,	[%l7 + %o3]
	nop
	set	0x64, %i1
	stw	%o5,	[%l7 + %i1]
	set	0x78, %o2
	stda	%g0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe3,	%i6
	nop
	set	0x50, %g3
	std	%f30,	[%l7 + %g3]
	nop
	set	0x2E, %i6
	ldsh	[%l7 + %i6],	%i3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f0
	set	0x24, %l2
	sta	%f12,	[%l7 + %l2] 0x89
	nop
	set	0x68, %g7
	std	%i2,	[%l7 + %g7]
	set	0x5D, %o0
	stba	%o3,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x64, %g5
	ldsh	[%l7 + %g5],	%i5
	nop
	set	0x16, %g4
	sth	%o0,	[%l7 + %g4]
	nop
	set	0x28, %o6
	std	%l4,	[%l7 + %o6]
	and	%g4,	%o6,	%i6
	set	0x28, %i7
	stda	%g4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x48, %g1
	sth	%l2,	[%l7 + %g1]
	and	%l0,	%o7,	%g2
	nop
	set	0x3C, %l1
	ldsh	[%l7 + %l1],	%l1
	set	0x16, %i5
	stba	%l3,	[%l7 + %i5] 0x88
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x6C, %i2
	lduw	[%l7 + %i2],	%o4
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x89,	%f18
	or	%i1,	%l5,	%g6
	nop
	set	0x0C, %o1
	sth	%g7,	[%l7 + %o1]
	nop
	set	0x50, %i4
	stb	%i0,	[%l7 + %i4]
	set	0x14, %o5
	stba	%g3,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x45, %l5
	ldub	[%l7 + %l5],	%o1
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x88,	 3
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x80,	%i4
	set	0x65, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o5
	nop
	set	0x78, %o4
	ldx	[%l7 + %o4],	%i7
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x80
	set	0x20, %o3
	stxa	%g1,	[%l7 + %o3] 0x89
	set	0x41, %l6
	stba	%l6,	[%l7 + %l6] 0x89
	ble	%icc,	loop_110
	wr	%i3,	%i2,	%clear_softint
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f0
loop_110:
	nop
	set	0x28, %i1
	stw	%i5,	[%l7 + %i1]
	add	%o3,	%l4,	%o0
	nop
	set	0x0D, %i0
	ldsb	[%l7 + %i0],	%o6
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	nop
	set	0x2D, %i3
	ldsb	[%l7 + %i3],	%i6
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%g5
	nop
	set	0x48, %g3
	std	%l2,	[%l7 + %g3]
	ble,a	%icc,	loop_111
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%g4
	set	0x18, %g5
	stda	%l0,	[%l7 + %g5] 0xe2
	membar	#Sync
loop_111:
	nop
	set	0x24, %g7
	lda	[%l7 + %g7] 0x88,	%f27
	set	0x20, %g4
	stda	%o6,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x7C, %i7
	prefetch	[%l7 + %i7],	 1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f16
	set	0x40, %g1
	lda	[%l7 + %g1] 0x81,	%f1
	set	0x42, %i5
	stha	%l1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x34, %l4
	lduh	[%l7 + %l4],	%l3
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%g2
	nop
	set	0x40, %g2
	ldub	[%l7 + %g2],	%o4
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x81,	%i0
	wr	%g6,	%g7,	%set_softint
	nop
	set	0x28, %l1
	stw	%i0,	[%l7 + %l1]
	set	0x47, %o5
	stba	%l5,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x35, %l5
	stb	%o1,	[%l7 + %l5]
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f20
	nop
	set	0x69, %l3
	stb	%g3,	[%l7 + %l3]
	ld	[%l7 + 0x1C],	%f7
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x88,	%o2
	nop
	set	0x38, %o4
	stx	%o5,	[%l7 + %o4]
	or	%i7,	%g1,	%l6
	nop
	nop
	setx	0x6C34AEC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xFB34C253,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f27,	%f22
	nop
	set	0x14, %o3
	ldstub	[%l7 + %o3],	%i2
	st	%fsr,	[%l7 + 0x74]
	set	0x50, %g6
	swapa	[%l7 + %g6] 0x89,	%i3
	set	0x33, %o2
	stba	%o3,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x50, %l6
	swapa	[%l7 + %l6] 0x89,	%l4
	set	0x1C, %i0
	swapa	[%l7 + %i0] 0x81,	%i5
	nop
	set	0x30, %i6
	sth	%o0,	[%l7 + %i6]
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%i6
	nop
	set	0x25, %l2
	stb	%g5,	[%l7 + %l2]
	and	%l2,	%o6,	%g4
	add	%l0,	%o7,	%l1
	nop
	set	0x68, %i3
	swap	[%l7 + %i3],	%g2
	add	%o4,	%l3,	%g6
	set	0x11, %o0
	stba	%i1,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x18, %g3
	stx	%i0,	[%l7 + %g3]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x88,	%l5
	nop
	set	0x6E, %g5
	ldstub	[%l7 + %g5],	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i4
	nop
	set	0x68, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x20, %i7
	stxa	%o2,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x89,	%o4
	add	%g7,	%i7,	%g1
	nop
	set	0x5D, %i5
	ldsb	[%l7 + %i5],	%l6
	set	0x48, %i2
	ldstuba	[%l7 + %i2] 0x88,	%i2
	nop
	set	0x3A, %g2
	ldsh	[%l7 + %g2],	%i3
	and	%l4,	%i5,	%o0
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x80,	%i6
	st	%f17,	[%l7 + 0x3C]
	st	%f23,	[%l7 + 0x78]
	set	0x60, %l1
	stda	%o2,	[%l7 + %l1] 0x88
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x81,	%l2
	ld	[%l7 + 0x70],	%f16
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x34, %l5
	stw	%o6,	[%l7 + %l5]
	or	%g5,	%l0,	%o7
	nop
	set	0x34, %i4
	ldsw	[%l7 + %i4],	%l1
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%g4
	set	0x3E, %l0
	stha	%g2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x48, %o7
	std	%f10,	[%l7 + %o7]
	set	0x0C, %o5
	stha	%l3,	[%l7 + %o5] 0x89
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f16
	nop
	set	0x24, %g6
	ldsh	[%l7 + %g6],	%o4
	set	0x0C, %o2
	stwa	%g6,	[%l7 + %o2] 0x89
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%i0
	nop
	set	0x48, %i0
	stx	%i1,	[%l7 + %i0]
	nop
	set	0x3B, %o4
	ldub	[%l7 + %o4],	%o1
	nop
	set	0x1A, %i6
	ldsb	[%l7 + %i6],	%g3
	set	0x18, %l2
	stba	%l5,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x928, 	%sys_tick_cmpr
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%i7
	nop
	set	0x6F, %i3
	ldub	[%l7 + %i3],	%g7
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xda
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x81,	%l6
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f14
	set	0x34, %g4
	sta	%f14,	[%l7 + %g4] 0x81
	st	%fsr,	[%l7 + 0x10]
	set	0x20, %g5
	stha	%g1,	[%l7 + %g5] 0x80
	nop
	set	0x5C, %o6
	prefetch	[%l7 + %o6],	 4
	st	%fsr,	[%l7 + 0x6C]
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x80,	%i2
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x66, %i7
	stha	%l4,	[%l7 + %i7] 0x89
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x5E, %g2
	ldub	[%l7 + %g2],	%o0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o3
	nop
	set	0x24, %i5
	swap	[%l7 + %i5],	%i6
	and	%o6,	%l2,	%g5
	nop
	set	0x08, %l1
	stw	%o7,	[%l7 + %l1]
	nop
	set	0x20, %l4
	lduw	[%l7 + %l4],	%l1
	or	%g4,	%g2,	%l3
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f0
	nop
	set	0x3C, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x44, %l3
	stw	%l0,	[%l7 + %l3]
	st	%f27,	[%l7 + 0x48]
	set	0x60, %i4
	stxa	%g6,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x18, %o7
	stxa	%i0,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	nop
	set	0x08, %o3
	lduw	[%l7 + %o3],	%o1
	nop
	set	0x30, %g6
	swap	[%l7 + %g6],	%g3
	nop
	set	0x4A, %l0
	stb	%l5,	[%l7 + %l0]
	nop
	set	0x29, %o2
	ldub	[%l7 + %o2],	%i4
	set	0x08, %l6
	stxa	%o5,	[%l7 + %l6] 0x80
	or	%o4,	%i7,	%o2
	ld	[%l7 + 0x34],	%f5
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x81,	%l6
	bleu,a	%icc,	loop_112
	nop
	set	0x58, %i6
	stx	%g1,	[%l7 + %i6]
	nop
	set	0x34, %o4
	swap	[%l7 + %o4],	%i3
	nop
	set	0x24, %i3
	ldsb	[%l7 + %i3],	%l4
loop_112:
	nop
	set	0x79, %i1
	ldub	[%l7 + %i1],	%i2
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x81,	%g6
	nop
	set	0x18, %g7
	std	%f22,	[%l7 + %g7]
	fpadd16	%f20,	%f16,	%f30
	add	%o0,	%i5,	%o3
	set	0x41, %g4
	stba	%o6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xe2,	%l2
	set	0x64, %l2
	stwa	%i6,	[%l7 + %l2] 0x80
	and	%o7,	%l1,	%g5
	nop
	set	0x68, %g3
	std	%g2,	[%l7 + %g3]
	or	%g4,	%l0,	%g6
	add	%i0,	%l3,	%o1
	set	0x18, %o6
	lda	[%l7 + %o6] 0x88,	%f31
	st	%fsr,	[%l7 + 0x70]
	set	0x3E, %g1
	stba	%g3,	[%l7 + %g1] 0x81
	set	0x68, %i2
	ldxa	[%l7 + %i2] 0x80,	%i1
	nop
	set	0x3E, %i7
	lduh	[%l7 + %i7],	%i4
	be	%xcc,	loop_113
	nop
	set	0x59, %g2
	stb	%l5,	[%l7 + %g2]
	set	0x5C, %i5
	sta	%f29,	[%l7 + %i5] 0x89
loop_113:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%o4
	fpadd32s	%f15,	%f13,	%f28
	nop
	set	0x46, %l4
	sth	%o2,	[%l7 + %l4]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	set	0x68, %l5
	lda	[%l7 + %l5] 0x80,	%f18
	nop
	set	0x40, %l3
	stx	%i7,	[%l7 + %l3]
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	ld	[%l7 + 0x48],	%f26
	and	%i3,	%g1,	%i2
	or	%l4,	%o0,	%g7
	set	0x63, %i4
	stba	%i5,	[%l7 + %i4] 0x89
	set	0x1F, %o7
	stba	%o3,	[%l7 + %o7] 0x88
	wr	%l2,	%o6,	%sys_tick
	or	%i6,	%l1,	%g5
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x70, %o3
	stxa	%g2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%o7
	nop
	set	0x1A, %l6
	sth	%g4,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%l0
	ld	[%l7 + 0x14],	%f11
	ld	[%l7 + 0x40],	%f11
	add	%g6,	%l3,	%o1
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%i0
	nop
	set	0x4A, %o4
	stb	%g3,	[%l7 + %o4]
	set	0x20, %i3
	lda	[%l7 + %i3] 0x81,	%f17
	wr	%i1,	%i4,	%y
	nop
	set	0x2A, %i1
	ldsh	[%l7 + %i1],	%o5
	nop
	set	0x7C, %o0
	lduh	[%l7 + %o0],	%o4
	wr	%o2,	%i7,	%set_softint
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%l6
	nop
	set	0x32, %g4
	ldsh	[%l7 + %g4],	%i3
	or	%l5,	%g1,	%l4
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%o0
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x89,	 0
	set	0x4C, %g3
	stwa	%i5,	[%l7 + %g3] 0x88
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x89,	%o3
	and	%i2,	%o6,	%l2
	nop
	set	0x20, %g1
	std	%i6,	[%l7 + %g1]
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%l1
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc4
	wr	%g2,	%o7,	%pic
	nop
	set	0x42, %i7
	ldstub	[%l7 + %i7],	%g5
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%g4
	ld	[%l7 + 0x74],	%f2
	wr	%l0,	%l3,	%y
	nop
	set	0x48, %l1
	stx	%g6,	[%l7 + %l1]
	nop
	set	0x79, %g2
	ldub	[%l7 + %g2],	%o1
	nop
	set	0x30, %l5
	swap	[%l7 + %l5],	%g3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f30
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%i0
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xe2,	%i0
	nop
	set	0x2C, %o5
	ldsw	[%l7 + %o5],	%o5
	nop
	set	0x48, %o3
	ldsw	[%l7 + %o3],	%i4
	set	0x1A, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o4
	nop
	set	0x30, %l6
	stx	%i7,	[%l7 + %l6]
	set	0x73, %l0
	ldstuba	[%l7 + %l0] 0x88,	%l6
	nop
	set	0x38, %o2
	stx	%i3,	[%l7 + %o2]
	nop
	set	0x45, %o4
	ldstub	[%l7 + %o4],	%o2
	set	0x11, %i0
	stba	%g1,	[%l7 + %i0] 0x81
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x80,	%l4
	ld	[%l7 + 0x78],	%f27
	nop
	set	0x48, %o0
	swap	[%l7 + %o0],	%o0
	nop
	set	0x2A, %i1
	lduh	[%l7 + %i1],	%g7
	nop
	set	0x36, %g4
	sth	%l5,	[%l7 + %g4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%o3
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x81,	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i6
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%o6
	nop
	set	0x08, %g3
	ldsw	[%l7 + %g3],	%g2
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x0E, %o6
	lduh	[%l7 + %o6],	%l1
	nop
	set	0x28, %i2
	stw	%g5,	[%l7 + %i2]
	set	0x3E, %l2
	stha	%o7,	[%l7 + %l2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f30
	st	%f6,	[%l7 + 0x38]
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x89
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x88,	%l3
	set	0x36, %l1
	stha	%l0,	[%l7 + %l1] 0x81
	add	%o1,	%g6,	%g3
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f20
	nop
	set	0x30, %l3
	stw	%i1,	[%l7 + %l3]
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x89,	 4
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%i0
	set	0x27, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i4
	set	0x12, %o5
	stha	%i7,	[%l7 + %o5] 0xea
	membar	#Sync
	and	%o4,	%l6,	%i3
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x0E, %g6
	sth	%g1,	[%l7 + %g6]
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%l4
	or	%o0,	%g7,	%o2
	nop
	set	0x70, %o3
	prefetch	[%l7 + %o3],	 3
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x81,	%l5
	nop
	set	0x3B, %o4
	ldstub	[%l7 + %o4],	%i5
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x88
	set	0x74, %i0
	sta	%f21,	[%l7 + %i0] 0x80
	and	%o3,	%l2,	%i6
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x80,	%o6
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%g2
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x89,	%o7
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%g4
	set	0x3C, %g7
	swapa	[%l7 + %g7] 0x81,	%l3
	ble,pt	%icc,	loop_114
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%g5
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%o0
	nop
	set	0x54, %i1
	sth	%g6,	[%l7 + %i1]
loop_114:
	nop
	set	0x10, %i2
	swap	[%l7 + %i2],	%l0
	set	0x14, %o6
	sta	%f22,	[%l7 + %o6] 0x81
	set	0x24, %l2
	lda	[%l7 + %l2] 0x89,	%f29
	nop
	set	0x5A, %i7
	ldsh	[%l7 + %i7],	%g3
	nop
	set	0x48, %g1
	stb	%o5,	[%l7 + %g1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%i0
	nop
	set	0x14, %l4
	ldsw	[%l7 + %l4],	%i7
	nop
	set	0x08, %i5
	ldsw	[%l7 + %i5],	%o4
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%l6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%i4
	and	%l4,	%g1,	%o0
	nop
	set	0x54, %l3
	stw	%g7,	[%l7 + %l3]
	nop
	set	0x58, %l5
	stx	%l5,	[%l7 + %l5]
	set	0x50, %i4
	stxa	%i5,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l2
	set	0x64, %l1
	stwa	%i6,	[%l7 + %l1] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%o6
	st	%f12,	[%l7 + 0x30]
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f8
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x74, %o1
	ldsh	[%l7 + %o1],	%i2
	or	%l1,	%o7,	%g2
	nop
	set	0x30, %g6
	ldsh	[%l7 + %g6],	%l3
	or	%g5,	%g4,	%g6
	and	%o1,	%l0,	%o5
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x28, %o5
	stxa	%i1,	[%l7 + %o5] 0x80
	nop
	set	0x12, %o2
	ldsb	[%l7 + %o2],	%g3
	set	0x2A, %o3
	stha	%i7,	[%l7 + %o3] 0x80
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%i0
	set	0x4C, %i0
	stwa	%l6,	[%l7 + %i0] 0x80
	nop
	set	0x78, %o4
	sth	%i3,	[%l7 + %o4]
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x80,	%i4
	st	%f13,	[%l7 + 0x5C]
	set	0x30, %i3
	stda	%o4,	[%l7 + %i3] 0x88
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%g1
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%o0
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x60, %g7
	lda	[%l7 + %g7] 0x89,	%f8
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%l5
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x88,	%i5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x81
	nop
	set	0x52, %i2
	ldsh	[%l7 + %i2],	%g7
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%l2
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%o2
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%f18
	set	0x68, %l4
	stba	%o3,	[%l7 + %l4] 0x88
	nop
	set	0x1D, %g1
	ldub	[%l7 + %g1],	%i6
	or	%i2,	%o6,	%l1
	fpsub32s	%f6,	%f26,	%f8
	set	0x5C, %g2
	sta	%f11,	[%l7 + %g2] 0x81
	or	%o7,	%l3,	%g5
	set	0x6C, %l3
	stwa	%g2,	[%l7 + %l3] 0x80
	set	0x2A, %i5
	stha	%g6,	[%l7 + %i5] 0x81
	set	0x28, %i4
	stwa	%g4,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x54, %l5
	stw	%l0,	[%l7 + %l5]
	nop
	set	0x38, %l1
	swap	[%l7 + %l1],	%o1
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%i0
	set	0x50, %g6
	swapa	[%l7 + %g6] 0x80,	%g3
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x81,	 1
	ld	[%l7 + 0x30],	%f9
	be,a	%xcc,	loop_115
	and	%i7,	%l6,	%i0
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0
loop_115:
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%g1
	set	0x63, %o2
	ldstuba	[%l7 + %o2] 0x80,	%o0
	set	0x74, %l0
	lda	[%l7 + %l0] 0x80,	%f18
	nop
	set	0x1C, %i0
	ldstub	[%l7 + %i0],	%l4
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f26
	set	0x28, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l5
	nop
	set	0x48, %i3
	stw	%i5,	[%l7 + %i3]
	set	0x58, %i6
	stda	%g6,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x5D, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o2
	nop
	set	0x60, %g5
	lduw	[%l7 + %g5],	%l2
	set	0x28, %g4
	sta	%f13,	[%l7 + %g4] 0x80
	st	%f22,	[%l7 + 0x38]
	add	%i6,	%i2,	%o6
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x88,	%o3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf8
	membar	#Sync
	nop
	set	0x7E, %i2
	lduh	[%l7 + %i2],	%o7
	st	%f21,	[%l7 + 0x2C]
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x89,	%l1
	set	0x30, %o6
	stxa	%g5,	[%l7 + %o6] 0x81
	nop
	set	0x54, %i7
	ldstub	[%l7 + %i7],	%l3
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%g6
	nop
	set	0x1C, %g1
	sth	%g2,	[%l7 + %g1]
	nop
	set	0x0E, %g7
	ldsb	[%l7 + %g7],	%g4
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%l0
	nop
	set	0x48, %i5
	sth	%i1,	[%l7 + %i5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%g3
	nop
	set	0x76, %i4
	sth	%i7,	[%l7 + %i4]
	nop
	set	0x78, %l3
	ldsb	[%l7 + %l3],	%l6
	nop
	set	0x74, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x30, %l5
	std	%f10,	[%l7 + %l5]
	set	0x34, %o1
	sta	%f16,	[%l7 + %o1] 0x80
	nop
	set	0x38, %o7
	std	%o4,	[%l7 + %o7]
	nop
	set	0x08, %o5
	sth	%i0,	[%l7 + %o5]
	nop
	set	0x7E, %g6
	stb	%i3,	[%l7 + %g6]
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x88,	%f1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%o4
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f0
	add	%g1,	%l4,	%o0
	nop
	set	0x74, %l0
	sth	%i5,	[%l7 + %l0]
	nop
	set	0x50, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x88,	%l5
	nop
	set	0x45, %i3
	stb	%o2,	[%l7 + %i3]
	nop
	set	0x30, %i6
	lduw	[%l7 + %i6],	%l2
	nop
	set	0x52, %o0
	ldub	[%l7 + %o0],	%g7
	nop
	set	0x48, %o3
	std	%i6,	[%l7 + %o3]
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x30, %g5
	lduw	[%l7 + %g5],	%i2
	set	0x50, %g3
	stda	%o6,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x20, %i1
	stxa	%o7,	[%l7 + %i1] 0xe2
	membar	#Sync
	or	%o3,	%l1,	%l3
	nop
	set	0x34, %l2
	swap	[%l7 + %l2],	%g5
	set	0x31, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g2
	nop
	set	0x4C, %i7
	ldsw	[%l7 + %i7],	%g6
	nop
	set	0x22, %o6
	ldsb	[%l7 + %o6],	%l0
	nop
	set	0x64, %g1
	sth	%i1,	[%l7 + %g1]
	set	0x60, %g7
	stxa	%g4,	[%l7 + %g7] 0x81
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	wr	%g3,	%i7,	%sys_tick
	set	0x58, %i4
	sta	%f24,	[%l7 + %i4] 0x88
	set	0x08, %l3
	stda	%o0,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x4E, %l1
	lduh	[%l7 + %l1],	%l6
	set	0x44, %g2
	stha	%i0,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x69, %l5
	stb	%i3,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x6C, %o7
	lduh	[%l7 + %o7],	%o5
	set	0x2E, %o5
	stha	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x30, %g6
	std	%g0,	[%l7 + %g6]
	set	0x46, %o1
	stha	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%o0
	st	%f17,	[%l7 + 0x34]
	nop
	set	0x50, %l0
	ldub	[%l7 + %l0],	%i5
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x89,	%i4
	nop
	set	0x70, %o4
	sth	%l5,	[%l7 + %o4]
	set	0x18, %i3
	stba	%l2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x3F, %i6
	ldub	[%l7 + %i6],	%g7
	wr	%i6,	%o2,	%sys_tick
	wr	%o6,	%o7,	%sys_tick
	nop
	set	0x28, %o0
	stx	%i2,	[%l7 + %o0]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%l3
	nop
	set	0x34, %o3
	stw	%o3,	[%l7 + %o3]
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x80,	%g2
	set	0x24, %i0
	stwa	%g6,	[%l7 + %i0] 0x81
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x28, %g5
	std	%g4,	[%l7 + %g5]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f16
	or	%l0,	%g4,	%i1
	set	0x50, %l2
	stwa	%i7,	[%l7 + %l2] 0x89
	nop
	set	0x2C, %i2
	sth	%g3,	[%l7 + %i2]
	bleu,a	%xcc,	loop_116
	nop
	set	0x4C, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x50, %o6
	ldda	[%l7 + %o6] 0x81,	%i6
loop_116:
	nop
	set	0x70, %g1
	stx	%i0,	[%l7 + %g1]
	set	0x68, %g7
	stda	%o0,	[%l7 + %g7] 0x80
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%i3
	nop
	set	0x10, %l4
	ldsw	[%l7 + %l4],	%o4
	set	0x6A, %i4
	stha	%o5,	[%l7 + %i4] 0x80
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xeb,	%l4
	set	0x1C, %l1
	stwa	%g1,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x18, %i5
	std	%i4,	[%l7 + %i5]
	nop
	set	0x7A, %g2
	sth	%o0,	[%l7 + %g2]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f16
	set	0x50, %o7
	lda	[%l7 + %o7] 0x80,	%f13
	or	%i4,	%l2,	%l5
	wr	%g7,	%o2,	%clear_softint
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x08, %o5
	ldsh	[%l7 + %o5],	%o6
	nop
	set	0x48, %l6
	std	%f20,	[%l7 + %l6]
	nop
	set	0x28, %l0
	ldsw	[%l7 + %l0],	%i6
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f10
	wr	%i2,	%l1,	%y
	set	0x20, %o2
	swapa	[%l7 + %o2] 0x81,	%l3
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x81,	%o3
	or	%o7,	%g2,	%g6
	nop
	set	0x0C, %o4
	ldsh	[%l7 + %o4],	%l0
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f30
	ld	[%l7 + 0x6C],	%f9
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%i1
	set	0x38, %o3
	stxa	%i7,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	nop
	set	0x38, %g4
	stx	%l6,	[%l7 + %g4]
	set	0x12, %i0
	stha	%g3,	[%l7 + %i0] 0x88
	nop
	set	0x76, %g3
	ldstub	[%l7 + %g3],	%i0
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%o1
	nop
	set	0x28, %l2
	swap	[%l7 + %l2],	%o4
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x88,	 3
	or	%o5,	%l4,	%i5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i4
	set	0x44, %i2
	lda	[%l7 + %i2] 0x89,	%f25
	st	%fsr,	[%l7 + 0x7C]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc8
	wr	%l2,	%o0,	%pic
	fpadd16	%f4,	%f6,	%f14
	wr	%g7,	%l5,	%ccr
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%o2
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x89,	 4
	set	0x38, %l4
	stxa	%o6,	[%l7 + %l4] 0xe3
	membar	#Sync
	or	%i2,	%l3,	%o3
	set	0x58, %i4
	ldxa	[%l7 + %i4] 0x88,	%l1
	set	0x50, %g7
	sta	%f21,	[%l7 + %g7] 0x89
	ble,a	%xcc,	loop_117
	ld	[%l7 + 0x64],	%f28
	nop
	set	0x60, %l3
	swap	[%l7 + %l3],	%g2
	and	%g6,	%l0,	%g4
loop_117:
	add	%o7,	%i1,	%g5
	or	%l6,	%i7,	%i0
	nop
	set	0x14, %l1
	lduw	[%l7 + %l1],	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%o5
	nop
	set	0x32, %g2
	sth	%l4,	[%l7 + %g2]
	set	0x48, %l5
	lda	[%l7 + %l5] 0x88,	%f8
	set	0x38, %o7
	stwa	%g1,	[%l7 + %o7] 0x80
	or	%i5,	%i4,	%l2
	add	%o0,	%l5,	%o2
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x88,	%i6
	nop
	set	0x38, %o5
	ldsw	[%l7 + %o5],	%g7
	set	0x0A, %g6
	stha	%i2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x67, %l6
	ldstub	[%l7 + %l6],	%l3
	nop
	set	0x09, %l0
	ldub	[%l7 + %l0],	%o3
	nop
	set	0x32, %o1
	lduh	[%l7 + %o1],	%l1
	nop
	set	0x08, %i3
	std	%f10,	[%l7 + %i3]
	or	%o6,	%g6,	%g2
	add	%l0,	%o7,	%i1
	set	0x18, %o2
	ldxa	[%l7 + %o2] 0x89,	%g5
	and	%g4,	%l6,	%i7
	nop
	set	0x78, %o4
	stx	%o1,	[%l7 + %o4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o4
	set	0x50, %i6
	stwa	%g3,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x78, %o3
	sta	%f6,	[%l7 + %o3] 0x81
	and	%o5,	%i3,	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x89
	nop
	set	0x10, %o0
	std	%l2,	[%l7 + %o0]
	ld	[%l7 + 0x7C],	%f21
	nop
	set	0x4C, %g3
	stw	%o0,	[%l7 + %g3]
	nop
	set	0x2C, %i0
	sth	%l5,	[%l7 + %i0]
	nop
	set	0x40, %l2
	std	%f6,	[%l7 + %l2]
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%o2
	nop
	set	0x08, %i2
	stw	%i5,	[%l7 + %i2]
	nop
	set	0x08, %o6
	stx	%i6,	[%l7 + %o6]
	wr	%i2,	%g7,	%set_softint
	set	0x08, %g1
	stda	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	fpsub32	%f6,	%f10,	%f10
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%l2
	set	0x58, %i7
	sta	%f18,	[%l7 + %i7] 0x80
	nop
	set	0x08, %l4
	std	%f6,	[%l7 + %l4]
	and	%l1,	%g6,	%o6
	fpsub16	%f4,	%f22,	%f20
	nop
	set	0x44, %g7
	lduw	[%l7 + %g7],	%g2
	st	%f1,	[%l7 + 0x58]
	ld	[%l7 + 0x7C],	%f27
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xeb,	%o6
	set	0x50, %l1
	swapa	[%l7 + %l1] 0x89,	%i1
	set	0x5C, %i4
	stwa	%l0,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x0C, %l5
	ldub	[%l7 + %l5],	%g4
	nop
	set	0x52, %o7
	sth	%l6,	[%l7 + %o7]
	nop
	set	0x5A, %i5
	lduh	[%l7 + %i5],	%i7
	nop
	set	0x38, %g2
	std	%o0,	[%l7 + %g2]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f30
	fpadd16	%f18,	%f10,	%f14
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc8
	set	0x08, %l0
	sta	%f30,	[%l7 + %l0] 0x88
	nop
	set	0x30, %o1
	lduw	[%l7 + %o1],	%i0
	nop
	set	0x3C, %g6
	ldsw	[%l7 + %g6],	%o4
	nop
	set	0x75, %i3
	ldstub	[%l7 + %i3],	%g3
	set	0x34, %o2
	swapa	[%l7 + %o2] 0x81,	%o5
	set	0x40, %o4
	lda	[%l7 + %o4] 0x80,	%f18
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf8
	membar	#Sync
	nop
	set	0x33, %g4
	stb	%i3,	[%l7 + %g4]
	set	0x08, %i6
	stwa	%g1,	[%l7 + %i6] 0x89
	nop
	set	0x7D, %g3
	stb	%l4,	[%l7 + %g3]
	set	0x14, %i0
	sta	%f31,	[%l7 + %i0] 0x88
	set	0x2E, %l2
	stha	%g5,	[%l7 + %l2] 0x89
	add	%l2,	%i4,	%o0
	nop
	set	0x7A, %o0
	sth	%l5,	[%l7 + %o0]
	nop
	set	0x70, %i2
	lduw	[%l7 + %i2],	%o2
	ba,a,pn	%xcc,	loop_118
	add	%i5,	%i6,	%g7
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%i2
	set	0x38, %g5
	sta	%f24,	[%l7 + %g5] 0x89
loop_118:
	nop
	set	0x68, %i1
	ldsb	[%l7 + %i1],	%o3
	set	0x19, %g1
	ldstuba	[%l7 + %g1] 0x89,	%l3
	set	0x14, %i7
	lda	[%l7 + %i7] 0x81,	%f7
	nop
	nop
	setx	0xCE13F006888EFF06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x266D0470317290A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f16
	ld	[%l7 + 0x50],	%f31
	and	%l1,	%o6,	%g6
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%g2
	nop
	set	0x60, %l3
	stx	%i1,	[%l7 + %l3]
	nop
	set	0x40, %l1
	stw	%o7,	[%l7 + %l1]
	nop
	set	0x30, %i4
	stb	%l0,	[%l7 + %i4]
	st	%f18,	[%l7 + 0x6C]
	nop
	set	0x54, %l5
	sth	%g4,	[%l7 + %l5]
	st	%f26,	[%l7 + 0x18]
	set	0x34, %l4
	swapa	[%l7 + %l4] 0x88,	%i7
	nop
	set	0x40, %o7
	std	%i6,	[%l7 + %o7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%o4
	nop
	set	0x74, %g2
	lduh	[%l7 + %g2],	%i0
	nop
	set	0x18, %i5
	stw	%g3,	[%l7 + %i5]
	nop
	set	0x6C, %l6
	stw	%o5,	[%l7 + %l6]
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%g1
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x81,	%l4
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%i3
	set	0x10, %i3
	stwa	%g5,	[%l7 + %i3] 0x89
	st	%f29,	[%l7 + 0x6C]
	st	%f22,	[%l7 + 0x2C]
	nop
	set	0x69, %g6
	ldstub	[%l7 + %g6],	%i4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f0
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x81,	%l2
	set	0x78, %g4
	stda	%o0,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x08, %i6
	ldxa	[%l7 + %i6] 0x88,	%o2
	nop
	set	0x2C, %g3
	ldsb	[%l7 + %g3],	%i5
	ld	[%l7 + 0x7C],	%f22
	set	0x34, %o3
	lda	[%l7 + %o3] 0x89,	%f20
	set	0x36, %l2
	stha	%l5,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x88,	 3
	set	0x30, %i2
	stwa	%g7,	[%l7 + %i2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x4C],	%f13
	set	0x14, %o6
	stba	%o3,	[%l7 + %o6] 0x80
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%l3
	nop
	set	0x2C, %i0
	lduw	[%l7 + %i0],	%i2
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%l0
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o6
	nop
	set	0x36, %g1
	ldsh	[%l7 + %g1],	%g2
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f16
	nop
	set	0x2C, %g7
	prefetch	[%l7 + %g7],	 4
	set	0x24, %l1
	stha	%g6,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x70, %i4
	sta	%f5,	[%l7 + %i4] 0x81
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f16
	nop
	set	0x42, %o7
	ldstub	[%l7 + %o7],	%o7
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%l0
	nop
	set	0x30, %l5
	stx	%g4,	[%l7 + %l5]
	nop
	set	0x53, %l6
	ldub	[%l7 + %l6],	%i7
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x80,	%l6
	and	%o1,	%i1,	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%i0
	nop
	set	0x48, %o1
	ldsw	[%l7 + %o1],	%g1
	nop
	set	0x0C, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x48, %i5
	std	%o4,	[%l7 + %i5]
	set	0x40, %i3
	stha	%i3,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xe2,	%g4
	st	%f13,	[%l7 + 0x6C]
	set	0x18, %o4
	stda	%i4,	[%l7 + %o4] 0x81
	or	%l2,	%l4,	%o0
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x89,	%i5
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x80,	%o2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f0
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x0C, %l2
	swap	[%l7 + %l2],	%l5
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f0
	wr	%i6,	%g7,	%clear_softint
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	nop
	set	0x10, %i2
	ldsw	[%l7 + %i2],	%l3
	nop
	set	0x70, %o6
	std	%i2,	[%l7 + %o6]
	set	0x36, %i0
	stha	%o6,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x68, %i1
	stxa	%g2,	[%l7 + %i1] 0x80
	add	%l1,	%o7,	%l0
	set	0x20, %i7
	stxa	%g6,	[%l7 + %i7] 0x89
	wr	%g4,	%i7,	%sys_tick
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc0
	set	0x50, %l3
	ldda	[%l7 + %l3] 0xeb,	%i6
	nop
	set	0x60, %g5
	stx	%i1,	[%l7 + %g5]
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0
	and	%o4,	%g3,	%i0
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%g1
	set	0x3C, %l4
	stwa	%i3,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	st	%f8,	[%l7 + 0x18]
	wr	%i4,	%l4,	%pic
	set	0x78, %o7
	stda	%o0,	[%l7 + %o7] 0xeb
	membar	#Sync
	st	%f9,	[%l7 + 0x2C]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%i5
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o2
	nop
	set	0x5A, %l1
	ldsh	[%l7 + %l1],	%l5
	fpadd32	%f0,	%f12,	%f12
	nop
	nop
	setx	0x205C9406,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2B73644D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f21,	%f22
	set	0x10, %l5
	stda	%i6,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x28, %l6
	lda	[%l7 + %l6] 0x80,	%f31
	nop
	set	0x68, %o1
	std	%f18,	[%l7 + %o1]
	set	0x10, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g7
	nop
	set	0x3E, %l0
	lduh	[%l7 + %l0],	%o3
	set	0x54, %i5
	sta	%f9,	[%l7 + %i5] 0x81
	nop
	set	0x20, %i3
	ldsw	[%l7 + %i3],	%i2
	nop
	set	0x34, %g6
	swap	[%l7 + %g6],	%l3
	set	0x08, %o2
	sta	%f29,	[%l7 + %o2] 0x89
	nop
	set	0x3A, %g4
	ldsb	[%l7 + %g4],	%o6
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x88,	%l1
	nop
	set	0x79, %i6
	ldsb	[%l7 + %i6],	%o7
	set	0x4E, %o3
	stha	%g2,	[%l7 + %o3] 0x89
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%l0
	fpadd32	%f26,	%f0,	%f18
	set	0x78, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc0
	set	0x21, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i7
	nop
	set	0x0E, %o0
	stb	%l6,	[%l7 + %o0]
	nop
	set	0x3D, %i0
	stb	%o1,	[%l7 + %i0]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf1,	%f0
	or	%o4,	%g3,	%i0
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%i0
	st	%f2,	[%l7 + 0x40]
	set	0x18, %i7
	lda	[%l7 + %i7] 0x80,	%f18
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%g1
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%i2
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%g5
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xea,	%i4
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x80,	%o4
	nop
	set	0x48, %i4
	std	%l4,	[%l7 + %i4]
	ld	[%l7 + 0x18],	%f6
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x89
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f0
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x18, %l6
	swap	[%l7 + %l6],	%l2
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x80,	%o0
	st	%fsr,	[%l7 + 0x44]
	st	%f24,	[%l7 + 0x78]
	wr 	%g0, 	0x6, 	%fprs
	set	0x2A, %o5
	stha	%l5,	[%l7 + %o5] 0x88
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%g7
	and	%o3,	%i6,	%i2
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0
	nop
	set	0x28, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x35, %g6
	ldsb	[%l7 + %g6],	%l1
	ld	[%l7 + 0x6C],	%f30
	nop
	set	0x58, %i5
	stx	%o6,	[%l7 + %i5]
	nop
	set	0x08, %g4
	std	%f28,	[%l7 + %g4]
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x80,	%g2
	set	0x6A, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g6
	st	%f21,	[%l7 + 0x2C]
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%o7
	nop
	set	0x6F, %g3
	ldsb	[%l7 + %g3],	%g4
	set	0x24, %o3
	swapa	[%l7 + %o3] 0x89,	%i7
	bleu	%xcc,	loop_119
	nop
	set	0x60, %l2
	stx	%l0,	[%l7 + %l2]
	and	%l6,	%o4,	%o1
	nop
	set	0x6C, %o0
	stw	%i0,	[%l7 + %o0]
loop_119:
	and	%g3,	%i1,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i3
	bleu	%xcc,	loop_120
	nop
	set	0x62, %i2
	stb	%i4,	[%l7 + %i2]
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x81,	%l4
loop_120:
	nop
	set	0x6C, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f18
	nop
	set	0x56, %i7
	stb	%l2,	[%l7 + %i7]
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x81,	%o4
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x80,	%o0
	nop
	set	0x54, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x08, %g5
	lduw	[%l7 + %g5],	%o2
	set	0x20, %i4
	stxa	%l5,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x3C, %g2
	sth	%i5,	[%l7 + %g2]
	bgu,a	%xcc,	loop_121
	nop
	set	0x6C, %l1
	ldsw	[%l7 + %l1],	%g7
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
loop_121:
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%i2
	nop
	set	0x0E, %o5
	stb	%l3,	[%l7 + %o5]
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%l1
	nop
	set	0x24, %l0
	ldsw	[%l7 + %l0],	%o3
	nop
	set	0x0F, %l5
	ldstub	[%l7 + %l5],	%o6
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%g6
	nop
	set	0x40, %i5
	stx	%o7,	[%l7 + %i5]
	set	0x52, %g4
	stha	%i7,	[%l7 + %g4] 0x80
	set	0x30, %g6
	stda	%g4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x17, %i6
	ldub	[%l7 + %i6],	%l6
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	nop
	set	0x40, %o2
	ldsh	[%l7 + %o2],	%o1
	st	%f17,	[%l7 + 0x30]
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f2
	set	0x78, %l2
	stda	%o4,	[%l7 + %l2] 0x81
	nop
	set	0x6F, %g3
	stb	%g3,	[%l7 + %g3]
	set	0x14, %i2
	lda	[%l7 + %i2] 0x80,	%f28
	nop
	set	0x78, %o0
	std	%i0,	[%l7 + %o0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x10, %i0
	stw	%i3,	[%l7 + %i0]
	nop
	set	0x24, %i1
	ldsb	[%l7 + %i1],	%i4
	set	0x28, %i7
	prefetcha	[%l7 + %i7] 0x89,	 1
	set	0x28, %l3
	stxa	%g5,	[%l7 + %l3] 0x80
	nop
	set	0x36, %o6
	sth	%l2,	[%l7 + %o6]
	add	%o0,	%o2,	%o5
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	fpadd16s	%f22,	%f22,	%f31
	set	0x20, %g7
	stba	%l5,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x28, %g5
	ldsh	[%l7 + %g5],	%g7
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%i5
	nop
	set	0x64, %g2
	swap	[%l7 + %g2],	%i2
	nop
	set	0x28, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x20, %l1
	stx	%i6,	[%l7 + %l1]
	wr	%l1,	%o3,	%ccr
	and	%l3,	%o6,	%g2
	set	0x60, %l6
	lda	[%l7 + %l6] 0x88,	%f27
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	nop
	set	0x28, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x68, %l0
	ldstuba	[%l7 + %l0] 0x80,	%i7
	nop
	set	0x08, %l5
	lduh	[%l7 + %l5],	%g6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%l6
	ld	[%l7 + 0x30],	%f19
	st	%fsr,	[%l7 + 0x60]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd2
	set	0x78, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	nop
	set	0x38, %i5
	std	%f10,	[%l7 + %i5]
	nop
	set	0x1E, %g6
	ldsb	[%l7 + %g6],	%l0
	ld	[%l7 + 0x64],	%f25
	nop
	set	0x36, %i6
	ldsb	[%l7 + %i6],	%o4
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%i0
	wr	%g1,	%g3,	%y
	nop
	set	0x28, %o2
	stb	%i1,	[%l7 + %o2]
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x77, %o3
	ldstub	[%l7 + %o3],	%i4
	set	0x3E, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l4
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x81,	%i3
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%l2
	set	0x48, %i0
	stha	%o0,	[%l7 + %i0] 0x81
	nop
	set	0x10, %o0
	stx	%g5,	[%l7 + %o0]
	or	%o5,	%l5,	%o2
	or	%g7,	%i5,	%i2
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x80,	 4
	nop
	set	0x5C, %l3
	lduh	[%l7 + %l3],	%i6
	set	0x74, %o6
	sta	%f6,	[%l7 + %o6] 0x89
	or	%l3,	%o3,	%g2
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%f22
	or	%o7,	%i7,	%g6
	nop
	set	0x70, %g1
	lduh	[%l7 + %g1],	%o6
	bgu,a	%icc,	loop_122
	nop
	set	0x24, %g5
	lduw	[%l7 + %g5],	%l6
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%g4
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc0
loop_122:
	st	%fsr,	[%l7 + 0x34]
	st	%f27,	[%l7 + 0x1C]
	set	0x51, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l0
	set	0x70, %g7
	sta	%f12,	[%l7 + %g7] 0x89
	nop
	set	0x70, %l6
	stx	%o4,	[%l7 + %l6]
	nop
	set	0x48, %o7
	std	%o0,	[%l7 + %o7]
	set	0x62, %o5
	stba	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	add	%g1,	%g3,	%i1
	nop
	set	0x20, %l1
	std	%i4,	[%l7 + %l1]
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%l4
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	ld	[%l7 + 0x18],	%f10
	and	%i3,	%l2,	%g5
	set	0x38, %i3
	stba	%o0,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x68, %l5
	ldstuba	[%l7 + %l5] 0x89,	%o5
	nop
	set	0x78, %g6
	lduw	[%l7 + %g6],	%o2
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	nop
	set	0x74, %i6
	ldstub	[%l7 + %i6],	%i5
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%i6
	set	0x08, %o4
	stxa	%l3,	[%l7 + %o4] 0xe2
	membar	#Sync
	st	%f22,	[%l7 + 0x34]
	set	0x46, %o2
	stha	%l1,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x10, %o3
	std	%g2,	[%l7 + %o3]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%o7
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x89,	%g6
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x81,	%i6
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x89,	%o6
	nop
	set	0x50, %l2
	ldsw	[%l7 + %l2],	%l6
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%l0
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x14, %o6
	sta	%f14,	[%l7 + %o6] 0x89
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x89,	%o4
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
	set	0x54, %g5
	stba	%i0,	[%l7 + %g5] 0x89
	nop
	set	0x68, %l4
	swap	[%l7 + %l4],	%o1
	or	%g3,	%i1,	%i4
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	st	%fsr,	[%l7 + 0x20]
	set	0x14, %i4
	stha	%l4,	[%l7 + %i4] 0x81
	add	%i3,	%g1,	%l2
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x88,	%o0
	set	0x14, %i7
	sta	%f27,	[%l7 + %i7] 0x80
	set	0x7C, %o7
	stwa	%g5,	[%l7 + %o7] 0xea
	membar	#Sync
	or	%o5,	%o2,	%l5
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%i2
	nop
	set	0x08, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x80,	 3
	nop
	set	0x38, %o1
	ldsb	[%l7 + %o1],	%i6
	nop
	set	0x66, %l6
	ldub	[%l7 + %l6],	%g7
	set	0x3C, %i3
	stha	%l1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f30
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%g2
	nop
	set	0x13, %i6
	ldstub	[%l7 + %i6],	%l3
	nop
	set	0x20, %i5
	stx	%o7,	[%l7 + %i5]
	set	0x34, %o4
	lda	[%l7 + %o4] 0x89,	%f16
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x89,	%o3
	nop
	set	0x68, %g4
	stw	%g6,	[%l7 + %g4]
	add	%i7,	%o6,	%l0
	nop
	set	0x3C, %i2
	ldub	[%l7 + %i2],	%o4
	set	0x46, %o3
	stba	%g4,	[%l7 + %o3] 0x88
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i0
	set	0x30, %g3
	sta	%f29,	[%l7 + %g3] 0x81
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9BC, 	%sys_tick_cmpr
	wr	%i4,	%g3,	%softint
	nop
	set	0x78, %i0
	lduh	[%l7 + %i0],	%l4
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f20
	set	0x58, %i1
	stxa	%i3,	[%l7 + %i1] 0xea
	membar	#Sync
	fpsub32	%f14,	%f18,	%f18
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%g1
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%o0
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f8
	set	0x14, %g5
	sta	%f31,	[%l7 + %g5] 0x81
	nop
	set	0x20, %g1
	sth	%g5,	[%l7 + %g1]
	nop
	set	0x30, %l4
	lduh	[%l7 + %l4],	%l2
	ld	[%l7 + 0x50],	%f28
	nop
	nop
	setx	0xB8D3C87C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x63B500EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f28,	%f2
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	st	%fsr,	[%l7 + 0x54]
	fpsub32	%f14,	%f10,	%f10
	set	0x78, %g7
	stda	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x9B923EE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xB8D71B22,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f22,	%f19
	set	0x5C, %i7
	lda	[%l7 + %i7] 0x88,	%f23
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%i2
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f12
	set	0x28, %o5
	stxa	%l5,	[%l7 + %o5] 0xe2
	membar	#Sync
	be,a,pn	%xcc,	loop_123
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%i4
	st	%f23,	[%l7 + 0x40]
	set	0x28, %o1
	swapa	[%l7 + %o1] 0x88,	%g7
loop_123:
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%l1
	nop
	set	0x08, %i3
	swap	[%l7 + %i3],	%g2
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%i6
	nop
	set	0x10, %g6
	std	%o6,	[%l7 + %g6]
	nop
	set	0x50, %i6
	lduh	[%l7 + %i6],	%o3
	nop
	set	0x58, %i5
	std	%l2,	[%l7 + %i5]
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%g6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%l0
	fpadd16s	%f31,	%f1,	%f23
	nop
	set	0x38, %o2
	std	%f18,	[%l7 + %o2]
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	ld	[%l7 + 0x0C],	%f14
	bgu,pt	%xcc,	loop_124
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%l6
loop_124:
	nop
	set	0x38, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x34, %g3
	swap	[%l7 + %g3],	%g4
	and	%o1,	%i4,	%i1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xe2,	%g2
	set	0x44, %i0
	swapa	[%l7 + %i0] 0x81,	%i3
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x30, %i1
	lduw	[%l7 + %i1],	%g1
	ld	[%l7 + 0x4C],	%f8
	nop
	set	0x48, %l2
	sth	%o0,	[%l7 + %l2]
	set	0x40, %o0
	sta	%f26,	[%l7 + %o0] 0x89
	or	%l4,	%l2,	%g5
	nop
	set	0x64, %o6
	swap	[%l7 + %o6],	%o5
	st	%f25,	[%l7 + 0x30]
	nop
	set	0x68, %g5
	stx	%o2,	[%l7 + %g5]
	nop
	set	0x7A, %g1
	lduh	[%l7 + %g1],	%l5
	add	%i2,	%g7,	%i5
	fpsub32	%f24,	%f14,	%f30
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x80
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x81,	%l1
	nop
	set	0x10, %i7
	stx	%g2,	[%l7 + %i7]
	nop
	set	0x18, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x20, %i4
	std	%o6,	[%l7 + %i4]
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%o3
	and	%l3,	%g6,	%i6
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc2
	nop
	set	0x7A, %o5
	lduh	[%l7 + %o5],	%o6
	nop
	set	0x65, %o1
	ldsb	[%l7 + %o1],	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%l0
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i0
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	set	0x60, %l6
	stda	%i6,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i4
	set	0x31, %i6
	stba	%o1,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x20, %l5
	std	%i0,	[%l7 + %l5]
	set	0x14, %o2
	stba	%g3,	[%l7 + %o2] 0x80
	set	0x7C, %i5
	stwa	%g1,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x6C, %g4
	lduh	[%l7 + %g4],	%o0
	or	%l4,	%l2,	%i3
	st	%fsr,	[%l7 + 0x5C]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%o5
	set	0x38, %o4
	ldstuba	[%l7 + %o4] 0x88,	%o2
	set	0x2C, %g3
	sta	%f1,	[%l7 + %g3] 0x89
	set	0x18, %o3
	stda	%i2,	[%l7 + %o3] 0x89
	nop
	set	0x0C, %i0
	ldstub	[%l7 + %i0],	%g7
	or	%l5,	%i5,	%l1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%g2
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%o3
	nop
	set	0x08, %o0
	sth	%g6,	[%l7 + %o0]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	nop
	set	0x34, %o6
	lduh	[%l7 + %o6],	%l3
	wr	%o6,	%i6,	%set_softint
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%o4
	bn,a,pt	%icc,	loop_125
	ld	[%l7 + 0x34],	%f28
	nop
	set	0x7E, %g1
	ldsb	[%l7 + %g1],	%l0
	nop
	set	0x54, %g2
	ldsw	[%l7 + %g2],	%i0
loop_125:
	nop
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x88,	%l6
	set	0x64, %l3
	stwa	%i7,	[%l7 + %l3] 0x81
	add	%i4,	%o1,	%i1
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x81,	%g4
	nop
	set	0x38, %g7
	stx	%g3,	[%l7 + %g7]
	nop
	set	0x38, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x2F, %l0
	ldub	[%l7 + %l0],	%g1
	or	%o0,	%l2,	%l4
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%g5
	set	0x10, %o7
	stxa	%o5,	[%l7 + %o7] 0x88
	nop
	set	0x1C, %o1
	lduw	[%l7 + %o1],	%i3
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%i2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	and	%o2,	%l5,	%i5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%g7
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%f12
	set	0x54, %l5
	stwa	%g2,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x20, %o2
	stx	%o3,	[%l7 + %o2]
	nop
	set	0x5F, %l6
	ldsb	[%l7 + %l6],	%o7
	nop
	set	0x13, %i5
	ldstub	[%l7 + %i5],	%g6
	set	0x54, %g4
	sta	%f15,	[%l7 + %g4] 0x80
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x89,	%o6
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	or	%l3,	%i6,	%l0
	add	%o4,	%i0,	%l6
	nop
	set	0x78, %i0
	ldsh	[%l7 + %i0],	%i4
	nop
	set	0x3E, %o3
	ldsh	[%l7 + %o3],	%o1
	wr	%i1,	%g4,	%softint
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%g1
	st	%f27,	[%l7 + 0x58]
	nop
	set	0x5A, %i2
	ldsh	[%l7 + %i2],	%o0
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%l2
	fpadd16	%f22,	%f10,	%f22
	fpadd32	%f28,	%f18,	%f2
	nop
	set	0x78, %i1
	lduw	[%l7 + %i1],	%g3
	set	0x08, %l2
	stda	%g4,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x1C, %o6
	swap	[%l7 + %o6],	%l4
	st	%fsr,	[%l7 + 0x38]
	set	0x68, %g5
	stwa	%o5,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%i2
	st	%f10,	[%l7 + 0x64]
	set	0x55, %g2
	stba	%i3,	[%l7 + %g2] 0x81
	set	0x70, %l4
	lda	[%l7 + %l4] 0x88,	%f1
	set	0x24, %i7
	stwa	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x68, %l3
	ldsh	[%l7 + %l3],	%l5
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x88,	%i4
	add	%l1,	%g2,	%g7
	nop
	set	0x23, %i4
	ldsb	[%l7 + %i4],	%o7
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x80,	%o3
	set	0x70, %l0
	lda	[%l7 + %l0] 0x80,	%f28
	and	%g6,	%o6,	%l3
	nop
	set	0x22, %o7
	stb	%l0,	[%l7 + %o7]
	nop
	set	0x74, %o1
	ldsw	[%l7 + %o1],	%o4
	set	0x50, %i3
	stxa	%i0,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x60, %l1
	stw	%i6,	[%l7 + %l1]
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xea,	%i4
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x38, %o2
	std	%o0,	[%l7 + %o2]
	nop
	set	0x1E, %l6
	ldsb	[%l7 + %l6],	%l6
	nop
	set	0x50, %i5
	stw	%g4,	[%l7 + %i5]
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f20
	set	0x1B, %l5
	stba	%i7,	[%l7 + %l5] 0x80
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%i0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%o0
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x80,	%g3
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x34, %o3
	swap	[%l7 + %o3],	%l2
	set	0x0C, %i2
	sta	%f12,	[%l7 + %i2] 0x80
	add	%g5,	%o5,	%l4
	set	0x60, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i3
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x81,	 3
	set	0x6C, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i2
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x81,	%l5
	nop
	set	0x30, %g5
	stx	%l1,	[%l7 + %g5]
	fpsub16s	%f19,	%f12,	%f21
	nop
	set	0x42, %i1
	ldstub	[%l7 + %i1],	%g2
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x89,	%i5
	fpsub32	%f6,	%f30,	%f30
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x80,	%o7
	fpsub16s	%f3,	%f22,	%f11
	nop
	set	0x6E, %i7
	ldstub	[%l7 + %i7],	%g7
	nop
	set	0x10, %g7
	std	%f20,	[%l7 + %g7]
	set	0x68, %l3
	stwa	%o3,	[%l7 + %l3] 0x88
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x10, %i4
	std	%o6,	[%l7 + %i4]
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f16
	fpsub16s	%f24,	%f9,	%f8
	or	%l3,	%l0,	%o4
	set	0x20, %o1
	swapa	[%l7 + %o1] 0x80,	%g6
	set	0x5C, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i0
	nop
	set	0x40, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x50, %g6
	stda	%i4,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x7E, %l1
	stha	%i6,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%l6
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x7C, %o2
	lduw	[%l7 + %o2],	%o1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f16
	nop
	set	0x42, %l5
	ldsb	[%l7 + %l5],	%i7
	fpsub16	%f4,	%f6,	%f14
	set	0x08, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g4
	and	%g1,	%o0,	%g3
	ld	[%l7 + 0x70],	%f23
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%i0
	nop
	set	0x20, %o3
	ldsw	[%l7 + %o3],	%g5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%o5
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%l4
	nop
	set	0x28, %o4
	std	%f14,	[%l7 + %o4]
	nop
	set	0x40, %i0
	stw	%i3,	[%l7 + %i0]
	nop
	set	0x70, %l2
	std	%f22,	[%l7 + %l2]
	set	0x56, %o0
	stba	%o2,	[%l7 + %o0] 0x80
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x88,	%l5
	nop
	set	0x08, %o6
	stx	%i2,	[%l7 + %o6]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1254
!	Type a   	: 32
!	Type cti   	: 23
!	Type x   	: 539
!	Type f   	: 32
!	Type i   	: 120
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
	set	0xC,	%g2
	set	0x1,	%g3
	set	0xB,	%g4
	set	0x6,	%g5
	set	0x5,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xE,	%i1
	set	-0xE,	%i2
	set	-0x0,	%i3
	set	-0x4,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x073FD8BA,	%l0
	set	0x3A763866,	%l1
	set	0x3B5BD4FE,	%l2
	set	0x7B97BFBF,	%l3
	set	0x5F157D3F,	%l4
	set	0x3A82D674,	%l5
	set	0x48B4E12C,	%l6
	!# Output registers
	set	0x06A6,	%o0
	set	0x0BDB,	%o1
	set	0x1AB7,	%o2
	set	0x10D7,	%o3
	set	0x0A38,	%o4
	set	0x105E,	%o5
	set	0x1677,	%o6
	set	0x0A0F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	set	0x10, %g1
	lda	[%l7 + %g1] 0x81,	%f25
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x88,	%g2
	and	%l1,	%o7,	%i5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f0
	set	0x34, %l4
	sta	%f2,	[%l7 + %l4] 0x81
	and	%g7,	%o6,	%o3
	nop
	set	0x10, %i7
	stx	%l3,	[%l7 + %i7]
	set	0x3E, %l3
	stha	%o4,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x48, %g7
	stxa	%l0,	[%l7 + %g7] 0x81
	or	%g6,	%i0,	%i6
	nop
	set	0x58, %i4
	lduw	[%l7 + %i4],	%l6
	nop
	set	0x1C, %o5
	prefetch	[%l7 + %o5],	 3
	ld	[%l7 + 0x64],	%f15
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%o1
	st	%f31,	[%l7 + 0x50]
	or	%i4,	%g4,	%g1
	nop
	set	0x58, %o1
	std	%i6,	[%l7 + %o1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%i1
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%g4
	nop
	set	0x1C, %i3
	stw	%o0,	[%l7 + %i3]
	nop
	set	0x5E, %g6
	ldstub	[%l7 + %g6],	%l2
	fpsub16	%f26,	%f10,	%f22
	set	0x24, %i6
	stha	%l4,	[%l7 + %i6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%o5
	nop
	set	0x48, %l6
	swap	[%l7 + %l6],	%i3
	set	0x18, %i5
	stda	%l4,	[%l7 + %i5] 0x81
	nop
	set	0x56, %l5
	sth	%o2,	[%l7 + %l5]
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%i2
	nop
	set	0x20, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x56, %o3
	lduh	[%l7 + %o3],	%g2
	and	%o7,	%i5,	%l1
	set	0x12, %i0
	stba	%o6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x64, %o4
	ldstub	[%l7 + %o4],	%l3
	nop
	set	0x6C, %o0
	ldub	[%l7 + %o0],	%o4
	nop
	set	0x58, %o6
	lduw	[%l7 + %o6],	%l0
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%i0
	nop
	set	0x51, %g5
	ldsb	[%l7 + %g5],	%i6
	set	0x28, %g1
	stxa	%g6,	[%l7 + %g1] 0x88
	nop
	set	0x08, %g2
	ldstub	[%l7 + %g2],	%l6
	nop
	set	0x70, %i1
	sth	%i4,	[%l7 + %i1]
	nop
	set	0x40, %l4
	ldub	[%l7 + %l4],	%g4
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%o1
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%i6
	st	%f29,	[%l7 + 0x38]
	nop
	set	0x7C, %g7
	ldstub	[%l7 + %g7],	%g1
	set	0x4C, %o5
	sta	%f16,	[%l7 + %o5] 0x81
	nop
	set	0x60, %i4
	ldsh	[%l7 + %i4],	%i1
	nop
	set	0x6C, %o1
	lduh	[%l7 + %o1],	%g3
	set	0x7B, %l0
	stba	%g5,	[%l7 + %l0] 0x81
	and	%o0,	%l4,	%l2
	nop
	set	0x1C, %i3
	sth	%o5,	[%l7 + %i3]
	nop
	set	0x08, %g6
	std	%f20,	[%l7 + %g6]
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x49, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l5
	nop
	set	0x19, %o7
	stb	%o2,	[%l7 + %o7]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd8
	nop
	set	0x5C, %l6
	ldsw	[%l7 + %l6],	%i2
	wr	%g2,	%i3,	%clear_softint
	nop
	set	0x10, %g4
	stw	%i5,	[%l7 + %g4]
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%o6
	nop
	set	0x6C, %g3
	swap	[%l7 + %g3],	%l1
	set	0x18, %i2
	stda	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x28, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x63, %o3
	ldsb	[%l7 + %o3],	%g7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l0
	or	%l3,	%o3,	%i0
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x80,	%g6
	add	%i6,	%l6,	%g4
	set	0x7C, %o4
	sta	%f0,	[%l7 + %o4] 0x89
	nop
	set	0x4E, %o0
	lduh	[%l7 + %o0],	%o1
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%i4
	and	%g1,	%i7,	%i1
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f8
	set	0x60, %g5
	swapa	[%l7 + %g5] 0x89,	%g5
	nop
	set	0x1C, %i1
	stw	%o0,	[%l7 + %i1]
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%l4
	nop
	set	0x7F, %g2
	ldub	[%l7 + %g2],	%g3
	set	0x20, %i7
	swapa	[%l7 + %i7] 0x89,	%o5
	nop
	set	0x48, %g7
	swap	[%l7 + %g7],	%l2
	nop
	set	0x24, %l3
	ldsw	[%l7 + %l3],	%l5
	nop
	set	0x64, %o5
	stw	%i2,	[%l7 + %o5]
	st	%f8,	[%l7 + 0x18]
	nop
	set	0x70, %o1
	stx	%g2,	[%l7 + %o1]
	set	0x18, %l0
	stda	%o2,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x44, %i3
	sta	%f5,	[%l7 + %i3] 0x88
	nop
	set	0x76, %g6
	lduh	[%l7 + %g6],	%i5
	and	%o7,	%l1,	%i3
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f14
	nop
	set	0x7C, %l1
	stb	%g7,	[%l7 + %l1]
	nop
	nop
	setx	0xE08A5DA1929C8A93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDF9EF6F4FBF59580,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f22,	%f10
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f4
	nop
	set	0x22, %o7
	ldstub	[%l7 + %o7],	%o6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x5E0, 	%tick_cmpr
	nop
	set	0x70, %i5
	stw	%o4,	[%l7 + %i5]
	add	%i0,	%g6,	%o3
	nop
	set	0x5C, %l6
	ldub	[%l7 + %l6],	%l6
	nop
	set	0x10, %l5
	stw	%i6,	[%l7 + %l5]
	nop
	set	0x26, %g4
	lduh	[%l7 + %g4],	%g4
	nop
	set	0x1C, %i2
	sth	%o1,	[%l7 + %i2]
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%i4
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%g0
	set	0x40, %o3
	lda	[%l7 + %o3] 0x89,	%f23
	nop
	set	0x6F, %l2
	ldstub	[%l7 + %l2],	%i7
	nop
	set	0x18, %i0
	std	%f26,	[%l7 + %i0]
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	nop
	set	0x70, %o0
	std	%i0,	[%l7 + %o0]
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x81,	%o0
	set	0x34, %o6
	lda	[%l7 + %o6] 0x81,	%f16
	nop
	set	0x60, %i1
	lduw	[%l7 + %i1],	%g3
	nop
	set	0x7A, %g5
	ldsh	[%l7 + %g5],	%l4
	nop
	set	0x30, %l4
	lduw	[%l7 + %l4],	%l2
	st	%f30,	[%l7 + 0x34]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%i2
	set	0x78, %g2
	stwa	%g2,	[%l7 + %g2] 0x81
	nop
	set	0x38, %g7
	stw	%o2,	[%l7 + %g7]
	set	0x60, %i7
	stda	%i4,	[%l7 + %i7] 0x80
	nop
	set	0x73, %o5
	ldstub	[%l7 + %o5],	%l5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xda
	nop
	set	0x5F, %l0
	ldsb	[%l7 + %l0],	%l1
	and	%o7,	%g7,	%o6
	and	%i3,	%l3,	%l0
	set	0x28, %i3
	lda	[%l7 + %i3] 0x89,	%f26
	and	%i0,	%g6,	%o3
	or	%l6,	%i6,	%o4
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x80,	%o1
	nop
	set	0x55, %i6
	ldstub	[%l7 + %i6],	%g4
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%g0
	nop
	set	0x3A, %l1
	ldsh	[%l7 + %l1],	%i4
	fpsub16	%f6,	%f0,	%f26
	nop
	set	0x20, %i5
	std	%f10,	[%l7 + %i5]
	nop
	set	0x68, %l6
	swap	[%l7 + %l6],	%g5
	set	0x10, %l5
	swapa	[%l7 + %l5] 0x88,	%i1
	nop
	set	0x1E, %g4
	ldstub	[%l7 + %g4],	%i7
	and	%o0,	%g3,	%l2
	set	0x28, %o7
	stda	%l4,	[%l7 + %o7] 0x81
	nop
	set	0x0B, %i2
	ldstub	[%l7 + %i2],	%o5
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x80,	%i2
	and	%g2,	%o2,	%i5
	nop
	set	0x76, %o3
	stb	%l5,	[%l7 + %o3]
	nop
	set	0x0B, %g3
	ldub	[%l7 + %g3],	%l1
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%o7
	ld	[%l7 + 0x60],	%f0
	nop
	set	0x08, %o4
	ldsw	[%l7 + %o4],	%o6
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xcc
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x28, %o6
	ldsb	[%l7 + %o6],	%l3
	nop
	set	0x0C, %i1
	ldstub	[%l7 + %i1],	%l0
	nop
	set	0x58, %g5
	swap	[%l7 + %g5],	%i3
	ld	[%l7 + 0x08],	%f17
	nop
	set	0x7C, %l4
	stb	%g6,	[%l7 + %l4]
	nop
	set	0x4C, %g2
	stw	%o3,	[%l7 + %g2]
	nop
	set	0x18, %g7
	ldsw	[%l7 + %g7],	%i0
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%l6
	or	%i6,	%o1,	%o4
	wr	%g4,	%g1,	%ccr
	nop
	set	0x4E, %i7
	lduh	[%l7 + %i7],	%i4
	set	0x24, %o1
	lda	[%l7 + %o1] 0x89,	%f4
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%g4
	fpsub16	%f8,	%f16,	%f28
	nop
	set	0x20, %l3
	std	%i0,	[%l7 + %l3]
	nop
	set	0x30, %i3
	ldub	[%l7 + %i3],	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l2
	and	%l4,	%g3,	%o5
	or	%g2,	%i2,	%o2
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%i5
	nop
	set	0x68, %g6
	stx	%l5,	[%l7 + %g6]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x89
	nop
	set	0x10, %i4
	ldx	[%l7 + %i4],	%l1
	and	%o7,	%g7,	%l3
	set	0x40, %l6
	stda	%l0,	[%l7 + %l6] 0x89
	set	0x18, %i5
	stda	%o6,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x68, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x28, %o7
	ldstub	[%l7 + %o7],	%g6
	ld	[%l7 + 0x5C],	%f3
	nop
	set	0x2C, %g4
	sth	%i3,	[%l7 + %g4]
	set	0x3C, %o2
	stha	%o3,	[%l7 + %o2] 0x80
	nop
	set	0x1F, %i2
	stb	%i0,	[%l7 + %i2]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xcc
	nop
	set	0x4C, %o3
	ldsw	[%l7 + %o3],	%i6
	fpsub16s	%f28,	%f16,	%f10
	nop
	set	0x24, %o4
	stb	%l6,	[%l7 + %o4]
	nop
	set	0x3C, %o0
	swap	[%l7 + %o0],	%o1
	nop
	set	0x2C, %i0
	lduw	[%l7 + %i0],	%o4
	nop
	set	0x38, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f0
	nop
	nop
	setx	0x0AD78F2E53CE8EA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x3AAB46F87948AE34,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f30
	or	%g1,	%g4,	%g5
	nop
	set	0x34, %l2
	lduh	[%l7 + %l2],	%i1
	wr	%i4,	%i7,	%pic
	set	0x41, %i1
	ldstuba	[%l7 + %i1] 0x80,	%l2
	nop
	set	0x38, %g5
	std	%f2,	[%l7 + %g5]
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x81,	%l4
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x80,	%g3
	st	%fsr,	[%l7 + 0x64]
	set	0x78, %l4
	stda	%o4,	[%l7 + %l4] 0x89
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%o0
	nop
	set	0x50, %l0
	ldstub	[%l7 + %l0],	%g2
	nop
	set	0x28, %l3
	std	%i2,	[%l7 + %l3]
	wr	%o2,	%i5,	%ccr
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x3A, %i3
	stba	%l1,	[%l7 + %i3] 0x89
	bleu,a	%icc,	loop_126
	nop
	set	0x38, %g6
	lduh	[%l7 + %g6],	%l5
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%g6
	nop
	set	0x30, %i4
	std	%o6,	[%l7 + %i4]
loop_126:
	nop
	set	0x78, %l6
	stwa	%l0,	[%l7 + %l6] 0xeb
	membar	#Sync
	st	%f11,	[%l7 + 0x0C]
	wr	%o6,	%g6,	%sys_tick
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o3
	nop
	set	0x3A, %l1
	sth	%i3,	[%l7 + %l1]
	set	0x28, %l5
	stxa	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	fpadd16	%f14,	%f14,	%f12
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f0
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%i6
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%i6
	set	0x49, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o1
	nop
	set	0x22, %o3
	sth	%o4,	[%l7 + %o3]
	nop
	set	0x18, %i2
	std	%g0,	[%l7 + %i2]
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x80,	 1
	nop
	set	0x1F, %o0
	stb	%i1,	[%l7 + %o0]
	nop
	set	0x48, %i0
	lduw	[%l7 + %i0],	%g4
	set	0x2C, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i7
	set	0x48, %l2
	lda	[%l7 + %l2] 0x88,	%f29
	set	0x58, %o6
	stda	%l2,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x0A, %g5
	stba	%l4,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%i4
	nop
	set	0x30, %g7
	std	%f14,	[%l7 + %g7]
	st	%f0,	[%l7 + 0x18]
	nop
	nop
	setx	0x5E021F28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x3E64D960,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f6,	%f10
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%g3
	nop
	set	0x30, %i7
	ldx	[%l7 + %i7],	%o0
	st	%f29,	[%l7 + 0x48]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%o4
	nop
	set	0x38, %l4
	std	%g2,	[%l7 + %l4]
	nop
	set	0x28, %l3
	stx	%o2,	[%l7 + %l3]
	nop
	set	0x0B, %l0
	ldsb	[%l7 + %l0],	%i5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	set	0x7A, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i2
	nop
	set	0x20, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x18, %i3
	stba	%l1,	[%l7 + %i3] 0x89
	nop
	set	0x49, %l6
	ldsb	[%l7 + %l6],	%l5
	ld	[%l7 + 0x5C],	%f0
	nop
	set	0x5B, %i4
	stb	%g7,	[%l7 + %i4]
	set	0x28, %l1
	stxa	%l0,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x2A, %l5
	stha	%o7,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x39, %i5
	stba	%o6,	[%l7 + %i5] 0x81
	set	0x30, %g4
	stda	%g6,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x0D, %o2
	stba	%o3,	[%l7 + %o2] 0x81
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f14
	nop
	set	0x30, %g3
	ldsh	[%l7 + %g3],	%i3
	fpsub16s	%f25,	%f3,	%f28
	nop
	set	0x49, %o3
	ldsb	[%l7 + %o3],	%l3
	nop
	set	0x76, %o4
	stb	%l6,	[%l7 + %o4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f16
	nop
	set	0x72, %i2
	ldsh	[%l7 + %i2],	%o1
	nop
	set	0x68, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f26
	nop
	set	0x64, %l2
	ldsb	[%l7 + %l2],	%g1
	ld	[%l7 + 0x58],	%f9
	ld	[%l7 + 0x20],	%f0
	add	%o4,	%i1,	%g4
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x81,	 3
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x89,	%i7
	fpadd16s	%f23,	%f15,	%f6
	set	0x08, %o6
	stda	%l2,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x52, %g2
	sth	%i4,	[%l7 + %g2]
	set	0x15, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g3
	nop
	set	0x4A, %i7
	sth	%l4,	[%l7 + %i7]
	set	0x6D, %o5
	stba	%o0,	[%l7 + %o5] 0x89
	set	0x38, %l4
	stda	%o4,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x74, %l3
	ldsw	[%l7 + %l3],	%g2
	and	%o2,	%i5,	%l1
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%i2
	nop
	set	0x24, %l0
	lduh	[%l7 + %l0],	%g7
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe2,	%l0
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x88,	 4
	nop
	set	0x78, %g6
	std	%l4,	[%l7 + %g6]
	set	0x75, %i4
	stba	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f26
	nop
	set	0x4C, %l6
	lduh	[%l7 + %l6],	%o3
	nop
	set	0x62, %i5
	ldsh	[%l7 + %i5],	%o6
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xda
	nop
	set	0x60, %l5
	lduh	[%l7 + %l5],	%l3
	nop
	set	0x66, %o2
	sth	%i3,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%i6
	nop
	set	0x3C, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%i6
	be,a	%xcc,	loop_127
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%i0
	nop
	set	0x70, %o0
	std	%f20,	[%l7 + %o0]
	nop
	set	0x54, %i0
	stw	%o1,	[%l7 + %i0]
loop_127:
	nop
	set	0x10, %i2
	stda	%g0,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x48, %g1
	ldxa	[%l7 + %g1] 0x81,	%o4
	set	0x54, %g5
	stwa	%i1,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcc
	nop
	set	0x2C, %o6
	ldub	[%l7 + %o6],	%g5
	nop
	set	0x20, %g2
	ldsw	[%l7 + %g2],	%i7
	st	%fsr,	[%l7 + 0x78]
	set	0x20, %i1
	stwa	%l2,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x89,	%i4
	set	0x6E, %o5
	stha	%g4,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%g2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc2
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f12
	set	0x18, %l0
	sta	%f16,	[%l7 + %l0] 0x89
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%g2
	nop
	set	0x30, %i3
	std	%o4,	[%l7 + %i3]
	fpadd16s	%f21,	%f14,	%f19
	nop
	set	0x7A, %o1
	lduh	[%l7 + %o1],	%i5
	st	%fsr,	[%l7 + 0x6C]
	st	%fsr,	[%l7 + 0x24]
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xeb,	%o2
	nop
	set	0x7B, %l1
	ldstub	[%l7 + %l1],	%i2
	set	0x30, %l6
	stwa	%l1,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	nop
	set	0x50, %g4
	ldsh	[%l7 + %g4],	%l0
	nop
	set	0x66, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x10, %o2
	ldda	[%l7 + %o2] 0xeb,	%o6
	set	0x63, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o3
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%o6
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f16
	nop
	set	0x31, %o4
	stb	%g6,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x78]
	ld	[%l7 + 0x74],	%f6
	add	%i3,	%l3,	%l6
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f0
	nop
	set	0x48, %i0
	ldsh	[%l7 + %i0],	%i6
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f16
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%o0
	fpsub16	%f12,	%f20,	%f18
	st	%f24,	[%l7 + 0x54]
	set	0x10, %g5
	sta	%f27,	[%l7 + %g5] 0x89
	set	0x56, %l2
	stba	%i0,	[%l7 + %l2] 0x80
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%g1
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f20
	nop
	set	0x20, %g2
	std	%o4,	[%l7 + %g2]
	nop
	set	0x7C, %i7
	stw	%g5,	[%l7 + %i7]
	nop
	set	0x68, %i1
	stx	%i1,	[%l7 + %i1]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f0
	nop
	set	0x34, %l4
	lduw	[%l7 + %l4],	%l2
	nop
	set	0x58, %l0
	std	%f24,	[%l7 + %l0]
	nop
	set	0x5D, %l3
	ldsb	[%l7 + %l3],	%i7
	set	0x0C, %i6
	sta	%f5,	[%l7 + %i6] 0x89
	nop
	set	0x18, %i3
	std	%f22,	[%l7 + %i3]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf9
	membar	#Sync
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%g4
	set	0x40, %l6
	stwa	%g3,	[%l7 + %l6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x38]
	set	0x38, %o1
	stxa	%l4,	[%l7 + %o1] 0x81
	nop
	set	0x44, %g4
	swap	[%l7 + %g4],	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%o5
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%i4
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f0
	nop
	set	0x40, %i5
	swap	[%l7 + %i5],	%o2
	st	%f26,	[%l7 + 0x44]
	nop
	set	0x0C, %o2
	swap	[%l7 + %o2],	%i2
	set	0x31, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l1
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x80,	%g7
	ba,a,pt	%xcc,	loop_128
	wr	%l0,	%l5,	%pic
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%o7
loop_128:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%g6
	set	0x0A, %o7
	stha	%o3,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x7C, %o0
	stw	%i3,	[%l7 + %o0]
	set	0x3C, %i0
	sta	%f1,	[%l7 + %i0] 0x81
	nop
	set	0x48, %i2
	std	%f10,	[%l7 + %i2]
	set	0x40, %g3
	stha	%l6,	[%l7 + %g3] 0xe3
	membar	#Sync
	st	%f25,	[%l7 + 0x14]
	set	0x54, %g5
	lda	[%l7 + %g5] 0x89,	%f2
	fpadd16	%f16,	%f4,	%f6
	nop
	set	0x20, %l2
	stb	%i6,	[%l7 + %l2]
	nop
	set	0x66, %o6
	sth	%o1,	[%l7 + %o6]
	and	%i0,	%l3,	%o4
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x81,	%g4
	nop
	nop
	setx	0xA42A9374,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x7624FAAA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f24,	%f3
	set	0x2C, %i7
	stwa	%i1,	[%l7 + %i7] 0x80
	nop
	set	0x52, %i1
	ldsh	[%l7 + %i1],	%g1
	nop
	set	0x7A, %g2
	ldstub	[%l7 + %g2],	%i7
	nop
	nop
	setx	0x244934D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x6BDF7E27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f18,	%f22
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x89,	%g4
	set	0x14, %o5
	sta	%f20,	[%l7 + %o5] 0x81
	set	0x60, %l0
	stba	%l2,	[%l7 + %l0] 0x89
	and	%l4,	%g3,	%o0
	set	0x68, %l4
	stwa	%i4,	[%l7 + %l4] 0x80
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%i4
	nop
	set	0x28, %l3
	ldx	[%l7 + %l3],	%o5
	set	0x18, %i4
	stxa	%i2,	[%l7 + %i4] 0xeb
	membar	#Sync
	ld	[%l7 + 0x10],	%f2
	set	0x63, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l1
	nop
	set	0x34, %i3
	lduh	[%l7 + %i3],	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xca
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%g2
	st	%f4,	[%l7 + 0x28]
	nop
	set	0x40, %l6
	std	%o6,	[%l7 + %l6]
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x88,	%l4
	nop
	set	0x28, %g6
	std	%f0,	[%l7 + %g6]
	nop
	set	0x0A, %o2
	ldstub	[%l7 + %o2],	%o6
	ld	[%l7 + 0x24],	%f16
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f18
	nop
	set	0x64, %i5
	prefetch	[%l7 + %i5],	 1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%o2
	set	0x1F, %o4
	stba	%i3,	[%l7 + %o4] 0xea
	membar	#Sync
	fpsub32s	%f28,	%f19,	%f23
	nop
	set	0x24, %o0
	swap	[%l7 + %o0],	%g6
	set	0x5C, %i0
	swapa	[%l7 + %i0] 0x88,	%i6
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%o1
	nop
	set	0x08, %g5
	swap	[%l7 + %g5],	%l6
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x88,	 1
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x81,	%o4
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x88,	%g4
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
	or	%i0,	%g1,	%i7
	set	0x54, %g2
	stwa	%i1,	[%l7 + %g2] 0x80
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%g4
	add	%g3,	%l4,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%i5
	nop
	set	0x34, %g7
	lduh	[%l7 + %g7],	%o5
	set	0x7A, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i2
	set	0x38, %l0
	stda	%o2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x36, %l4
	ldub	[%l7 + %l4],	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%g7
	st	%f22,	[%l7 + 0x5C]
	nop
	set	0x50, %g1
	lduw	[%l7 + %g1],	%o7
	add	%g2,	%l5,	%o3
	nop
	set	0x50, %l3
	sth	%i3,	[%l7 + %l3]
	and	%g6,	%i6,	%o1
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x81,	%o6
	set	0x74, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l6
	and	%l3,	%g5,	%i0
	nop
	set	0x1C, %i3
	ldsw	[%l7 + %i3],	%g1
	st	%f15,	[%l7 + 0x40]
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%o4
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%i1
	nop
	set	0x60, %l6
	std	%i6,	[%l7 + %l6]
	set	0x66, %l5
	stha	%l2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%g2
	set	0x1C, %g6
	stha	%g4,	[%l7 + %g6] 0x89
	nop
	set	0x27, %o3
	ldsb	[%l7 + %o3],	%o0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd2
	nop
	set	0x64, %i5
	sth	%i4,	[%l7 + %i5]
	nop
	set	0x1E, %o4
	ldsh	[%l7 + %o4],	%i5
	nop
	set	0x13, %o0
	ldub	[%l7 + %o0],	%o5
	nop
	set	0x54, %i0
	sth	%l4,	[%l7 + %i0]
	nop
	set	0x10, %o7
	std	%i2,	[%l7 + %o7]
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x81,	%o2
	nop
	set	0x42, %g3
	ldub	[%l7 + %g3],	%l0
	set	0x6E, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l1
	set	0x7C, %i2
	swapa	[%l7 + %i2] 0x89,	%g7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f0
	nop
	set	0x28, %i1
	swap	[%l7 + %i1],	%o7
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%g2
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x39, %g2
	ldub	[%l7 + %g2],	%o3
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x81,	%l5
	wr	%g6,	%i6,	%set_softint
	nop
	set	0x70, %l4
	std	%o0,	[%l7 + %l4]
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f28
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xea,	%o6
	nop
	set	0x10, %i6
	ldsb	[%l7 + %i6],	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%l3
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x64, %i3
	sth	%i0,	[%l7 + %i3]
	or	%g1,	%g5,	%o4
	set	0x14, %o1
	lda	[%l7 + %o1] 0x89,	%f7
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f16
	nop
	set	0x38, %i4
	stb	%i1,	[%l7 + %i4]
	set	0x20, %l6
	stda	%l2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	be,a,pt	%xcc,	loop_129
	nop
	set	0x50, %g6
	ldstub	[%l7 + %g6],	%i7
	nop
	set	0x38, %o3
	stw	%g4,	[%l7 + %o3]
	st	%f15,	[%l7 + 0x08]
loop_129:
	nop
	set	0x32, %g4
	lduh	[%l7 + %g4],	%g3
	nop
	set	0x38, %i5
	stw	%o0,	[%l7 + %i5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o5
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%l4
	st	%fsr,	[%l7 + 0x4C]
	fpadd16s	%f31,	%f20,	%f17
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xeb,	%i2
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf9
	membar	#Sync
	fpsub16s	%f8,	%f16,	%f2
	nop
	set	0x3A, %o7
	stb	%i5,	[%l7 + %o7]
	nop
	set	0x09, %g5
	stb	%o2,	[%l7 + %g5]
	fpadd32s	%f5,	%f8,	%f25
	ld	[%l7 + 0x18],	%f31
	nop
	set	0x0C, %l2
	prefetch	[%l7 + %l2],	 2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%g7
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%o6
	set	0x14, %g3
	stwa	%l1,	[%l7 + %g3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x4D, %o6
	stb	%g2,	[%l7 + %o6]
	set	0x08, %i7
	stda	%l4,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x60, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x28, %g2
	stxa	%g6,	[%l7 + %g2] 0x81
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x81,	%o3
	nop
	set	0x08, %l4
	stx	%o1,	[%l7 + %l4]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x89
	set	0x70, %g7
	stxa	%o6,	[%l7 + %g7] 0x80
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x89,	%i6
	nop
	set	0x74, %l0
	sth	%i6,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	set	0x2A, %o1
	stha	%l3,	[%l7 + %o1] 0xea
	membar	#Sync
	fpsub32s	%f22,	%f6,	%f4
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 4
	nop
	set	0x38, %i4
	std	%i0,	[%l7 + %i4]
	nop
	set	0x10, %l6
	ldsh	[%l7 + %l6],	%i3
	nop
	set	0x68, %g6
	lduw	[%l7 + %g6],	%g1
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xe3,	%g4
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x81,	%i1
	nop
	set	0x36, %g4
	lduh	[%l7 + %g4],	%l2
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%i7
	set	0x7C, %o2
	sta	%f19,	[%l7 + %o2] 0x89
	set	0x34, %i5
	lda	[%l7 + %i5] 0x88,	%f23
	set	0x5C, %i0
	swapa	[%l7 + %i0] 0x81,	%o4
	nop
	set	0x2C, %o7
	swap	[%l7 + %o7],	%g4
	nop
	set	0x22, %o0
	sth	%o0,	[%l7 + %o0]
	nop
	set	0x48, %l2
	std	%f28,	[%l7 + %l2]
	nop
	set	0x34, %g5
	ldsh	[%l7 + %g5],	%g3
	add	%o5,	%l4,	%i2
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	nop
	set	0x50, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f28
	set	0x64, %g2
	stba	%o2,	[%l7 + %g2] 0x89
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%g7
	nop
	set	0x70, %o5
	stb	%o7,	[%l7 + %o5]
	set	0x08, %g1
	lda	[%l7 + %g1] 0x88,	%f17
	set	0x10, %l4
	stxa	%g2,	[%l7 + %l4] 0x80
	set	0x44, %l3
	stha	%l5,	[%l7 + %l3] 0x80
	nop
	set	0x12, %g7
	lduh	[%l7 + %g7],	%g6
	nop
	set	0x68, %i3
	ldsb	[%l7 + %i3],	%l1
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x89,	 2
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%l6
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc2
	nop
	set	0x58, %l1
	ldsb	[%l7 + %l1],	%o6
	nop
	set	0x2E, %l6
	stb	%l3,	[%l7 + %l6]
	nop
	set	0x44, %g6
	sth	%i0,	[%l7 + %g6]
	set	0x60, %i4
	ldda	[%l7 + %i4] 0xe3,	%i2
	fpadd32	%f28,	%f12,	%f26
	nop
	set	0x77, %o3
	ldsb	[%l7 + %o3],	%g1
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x88,	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i6
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x88,	%f12
	nop
	set	0x68, %g4
	stw	%i7,	[%l7 + %g4]
	set	0x74, %i5
	swapa	[%l7 + %i5] 0x80,	%o4
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%g4
	nop
	set	0x18, %o7
	std	%f10,	[%l7 + %o7]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf8
	membar	#Sync
	set	0x7B, %l2
	stba	%o0,	[%l7 + %l2] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%g3
	set	0x28, %i2
	ldxa	[%l7 + %i2] 0x88,	%l2
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x81,	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l4
	nop
	set	0x48, %i7
	lduh	[%l7 + %i7],	%o2
	add	%i5,	%i4,	%l0
	fpadd16	%f28,	%f18,	%f2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%o7
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x80,	%l5
	set	0x40, %g2
	lda	[%l7 + %g2] 0x88,	%f24
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x1C, %l4
	sth	%g2,	[%l7 + %l4]
	set	0x6D, %l3
	stba	%l1,	[%l7 + %l3] 0x81
	st	%f15,	[%l7 + 0x5C]
	nop
	set	0x09, %g7
	ldsb	[%l7 + %g7],	%o1
	nop
	set	0x70, %i3
	sth	%g6,	[%l7 + %i3]
	nop
	set	0x41, %l0
	stb	%l6,	[%l7 + %l0]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%o3
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f16
	ld	[%l7 + 0x14],	%f28
	set	0x50, %i6
	stxa	%l3,	[%l7 + %i6] 0xe2
	membar	#Sync
	or	%i3,	%g1,	%g5
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%i1
	nop
	set	0x38, %l1
	stx	%i6,	[%l7 + %l1]
	nop
	set	0x12, %l6
	ldstub	[%l7 + %l6],	%i0
	add	%o4,	%i7,	%o0
	set	0x52, %i4
	stha	%g4,	[%l7 + %i4] 0x88
	or	%g3,	%o5,	%l2
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%l4
	nop
	set	0x5A, %o3
	ldsh	[%l7 + %o3],	%i2
	and	%i5,	%i4,	%l0
	bge,pt	%xcc,	loop_130
	nop
	set	0x10, %l5
	stx	%g7,	[%l7 + %l5]
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xcc
loop_130:
	nop
	set	0x64, %i5
	ldub	[%l7 + %i5],	%o7
	nop
	nop
	setx	0x0437C79F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x7913972F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f9,	%f7
	nop
	set	0x72, %i0
	lduh	[%l7 + %i0],	%o2
	set	0x38, %o4
	stda	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x64, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x7D, %g5
	ldsb	[%l7 + %g5],	%l5
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x89,	 3
	ba	%icc,	loop_131
	st	%fsr,	[%l7 + 0x70]
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x89,	%g6
loop_131:
	nop
	set	0x6C, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o6
	nop
	set	0x08, %i2
	stw	%l3,	[%l7 + %i2]
	st	%f11,	[%l7 + 0x1C]
	set	0x24, %g3
	swapa	[%l7 + %g3] 0x89,	%o3
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd8
	nop
	set	0x56, %i1
	lduh	[%l7 + %i1],	%i3
	nop
	set	0x35, %o5
	stb	%g5,	[%l7 + %o5]
	set	0x50, %g2
	stba	%g1,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x81,	%i1
	nop
	set	0x50, %g7
	std	%i6,	[%l7 + %g7]
	set	0x12, %l4
	stha	%o4,	[%l7 + %l4] 0x89
	set	0x52, %i3
	stha	%i7,	[%l7 + %i3] 0xea
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%g4
	st	%f21,	[%l7 + 0x3C]
	nop
	set	0x18, %o1
	std	%f0,	[%l7 + %o1]
	or	%o0,	%o5,	%g3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f16
	set	0x58, %l0
	sta	%f21,	[%l7 + %l0] 0x89
	nop
	set	0x70, %l1
	ldx	[%l7 + %l1],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i2
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%i4
	or	%i5,	%g7,	%o7
	ld	[%l7 + 0x08],	%f10
	bg,pn	%icc,	loop_132
	nop
	set	0x5C, %g1
	ldstub	[%l7 + %g1],	%l0
	st	%f4,	[%l7 + 0x20]
	add	%o2,	%l5,	%g2
loop_132:
	nop
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f16
	nop
	set	0x66, %l5
	sth	%g6,	[%l7 + %l5]
	set	0x48, %g4
	sta	%f6,	[%l7 + %g4] 0x81
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%l6
	set	0x2A, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o1
	nop
	set	0x18, %i0
	stb	%l3,	[%l7 + %i0]
	nop
	set	0x28, %o4
	stw	%o6,	[%l7 + %o4]
	set	0x60, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i3
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f6
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x81,	%o3
	and	%g1,	%g5,	%i6
	nop
	set	0x3C, %o2
	ldub	[%l7 + %o2],	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i0
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	set	0x68, %l2
	stxa	%g4,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x20, %o6
	stwa	%i7,	[%l7 + %o6] 0x80
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x88,	%o0
	set	0x14, %i7
	stwa	%g3,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x78, %i1
	stda	%o4,	[%l7 + %i1] 0xeb
	membar	#Sync
	or	%l2,	%i2,	%i4
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x52, %o5
	ldsh	[%l7 + %o5],	%l4
	set	0x44, %g2
	stwa	%g7,	[%l7 + %g2] 0x89
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x88,	%i5
	nop
	set	0x08, %g7
	stx	%l0,	[%l7 + %g7]
	set	0x58, %l3
	sta	%f31,	[%l7 + %l3] 0x80
	set	0x70, %i3
	stda	%o6,	[%l7 + %i3] 0x88
	nop
	set	0x14, %o1
	stb	%o2,	[%l7 + %o1]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%g2
	nop
	set	0x4C, %l4
	prefetch	[%l7 + %l4],	 2
	st	%f9,	[%l7 + 0x18]
	set	0x0C, %i6
	swapa	[%l7 + %i6] 0x80,	%l1
	nop
	set	0x18, %l0
	sth	%g6,	[%l7 + %l0]
	add	%l6,	%l3,	%o6
	nop
	set	0x14, %l6
	lduw	[%l7 + %l6],	%o1
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%i3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f16
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x88,	 2
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x81,	%g5
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%i6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xeb,	%o2
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f20
	set	0x30, %o7
	ldda	[%l7 + %o7] 0x89,	%o4
	and	%i0,	%i7,	%o0
	nop
	nop
	setx	0x1FC57FAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x0C94DDE4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f0,	%f26
	set	0x21, %i4
	stba	%g3,	[%l7 + %i4] 0x89
	st	%f1,	[%l7 + 0x6C]
	nop
	set	0x08, %g5
	stx	%g4,	[%l7 + %g5]
	nop
	set	0x32, %o2
	ldstub	[%l7 + %o2],	%l2
	nop
	set	0x60, %i5
	std	%f0,	[%l7 + %i5]
	nop
	set	0x18, %l2
	lduh	[%l7 + %l2],	%o5
	nop
	set	0x20, %o0
	ldub	[%l7 + %o0],	%i4
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf1,	%f16
	set	0x64, %i2
	stwa	%i2,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%g6
	nop
	set	0x1E, %i7
	ldsh	[%l7 + %i7],	%i5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xeb,	%l0
	set	0x35, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l4
	nop
	set	0x34, %o5
	swap	[%l7 + %o5],	%o7
	set	0x1C, %g7
	stha	%l5,	[%l7 + %g7] 0x88
	set	0x52, %l3
	ldstuba	[%l7 + %l3] 0x88,	%g2
	and	%l1,	%g6,	%l6
	nop
	set	0x50, %i3
	stx	%l3,	[%l7 + %i3]
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%o2
	nop
	set	0x51, %l4
	ldstub	[%l7 + %l4],	%o1
	set	0x48, %l0
	stda	%i2,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%g5
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%i6
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f18
	set	0x5C, %l1
	lda	[%l7 + %l1] 0x80,	%f2
	or	%g1,	%i1,	%o4
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x89,	%i0
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	set	0x70, %g1
	lda	[%l7 + %g1] 0x88,	%f28
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x80,	%f30
	nop
	set	0x0E, %i0
	ldsh	[%l7 + %i0],	%o0
	or	%i7,	%g4,	%l2
	set	0x55, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g3
	fpsub16s	%f31,	%f30,	%f5
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%i4
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%i2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%o5
	fpadd32	%f28,	%f24,	%f24
	set	0x72, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l0
	set	0x38, %o7
	stwa	%i5,	[%l7 + %o7] 0x88
	set	0x14, %o2
	lda	[%l7 + %o2] 0x81,	%f14
	fpadd32s	%f19,	%f8,	%f22
	nop
	set	0x32, %l2
	ldub	[%l7 + %l2],	%l4
	nop
	set	0x08, %i5
	std	%o6,	[%l7 + %i5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%g2
	fpsub32	%f16,	%f10,	%f16
	nop
	set	0x30, %o0
	stx	%g6,	[%l7 + %o0]
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x89,	%l1
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf0
	membar	#Sync
	set	0x08, %i1
	stwa	%l6,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x37, %g2
	ldub	[%l7 + %g2],	%l3
	set	0x48, %i7
	stda	%o2,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x74, %o5
	stw	%i3,	[%l7 + %o5]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%o0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f0
	st	%f26,	[%l7 + 0x70]
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%g5
	set	0x7C, %l3
	swapa	[%l7 + %l3] 0x81,	%g1
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%i1
	ld	[%l7 + 0x48],	%f25
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%o3
	nop
	set	0x22, %l4
	ldsb	[%l7 + %l4],	%o0
	st	%f30,	[%l7 + 0x40]
	nop
	set	0x14, %i6
	sth	%o4,	[%l7 + %i6]
	set	0x72, %l6
	stha	%i7,	[%l7 + %l6] 0x80
	nop
	set	0x68, %l1
	std	%l2,	[%l7 + %l1]
	nop
	set	0x3F, %o3
	ldub	[%l7 + %o3],	%g4
	nop
	set	0x37, %l0
	ldub	[%l7 + %l0],	%g3
	st	%f30,	[%l7 + 0x24]
	nop
	set	0x24, %g1
	lduh	[%l7 + %g1],	%i2
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%g7
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xeb,	%i4
	or	%l0,	%o5,	%i5
	nop
	set	0x36, %o4
	lduh	[%l7 + %o4],	%l4
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	set	0x70, %g4
	stxa	%l5,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x78, %g5
	ldsh	[%l7 + %g5],	%g2
	nop
	set	0x38, %o2
	lduw	[%l7 + %o2],	%o7
	set	0x5E, %l2
	stha	%l1,	[%l7 + %l2] 0x89
	nop
	set	0x62, %o7
	lduh	[%l7 + %o7],	%g6
	nop
	set	0x28, %i5
	stx	%l3,	[%l7 + %i5]
	nop
	set	0x34, %o0
	ldsw	[%l7 + %o0],	%o2
	nop
	set	0x42, %o6
	stb	%l6,	[%l7 + %o6]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%o6
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	set	0x1E, %g2
	stba	%i6,	[%l7 + %g2] 0x89
	set	0x48, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g1
	ld	[%l7 + 0x18],	%f27
	set	0x35, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g5
	nop
	set	0x30, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x60, %i3
	std	%f18,	[%l7 + %i3]
	set	0x32, %l3
	stha	%i0,	[%l7 + %l3] 0x80
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%o0
	set	0x50, %l4
	stda	%o4,	[%l7 + %l4] 0x89
	be,pt	%xcc,	loop_133
	wr 	%g0, 	0x5, 	%fprs
	set	0x10, %g7
	ldxa	[%l7 + %g7] 0x88,	%g4
loop_133:
	nop
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x81,	%g2
	nop
	set	0x70, %i6
	ldub	[%l7 + %i6],	%i2
	nop
	set	0x50, %l1
	stb	%i4,	[%l7 + %l1]
	nop
	set	0x28, %o3
	sth	%g7,	[%l7 + %o3]
	set	0x30, %l0
	lda	[%l7 + %l0] 0x80,	%f27
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i5
	nop
	set	0x42, %g6
	ldstub	[%l7 + %g6],	%l4
	nop
	set	0x60, %g1
	stx	%l5,	[%l7 + %g1]
	set	0x7C, %i0
	swapa	[%l7 + %i0] 0x88,	%o5
	nop
	set	0x78, %o4
	lduh	[%l7 + %o4],	%g2
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f10
	or	%l1,	%g6,	%l3
	nop
	set	0x48, %i4
	ldsw	[%l7 + %i4],	%o2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%l6
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xca
	set	0x12, %o2
	stha	%i3,	[%l7 + %o2] 0x81
	set	0x18, %g5
	stxa	%o1,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%i6,	%g1,	%g5
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%o6
	or	%i0,	%i1,	%o0
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x0E, %o0
	ldsb	[%l7 + %o0],	%o3
	set	0x48, %i5
	stwa	%i7,	[%l7 + %i5] 0x80
	set	0x08, %i2
	stxa	%l2,	[%l7 + %i2] 0x81
	add	%g4,	%g3,	%o4
	nop
	set	0x57, %i1
	ldsb	[%l7 + %i1],	%i4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%l0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe2,	%i4
	nop
	set	0x48, %o5
	lduh	[%l7 + %o5],	%l4
	nop
	set	0x28, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x40, %g3
	stx	%g7,	[%l7 + %g3]
	set	0x10, %i7
	stxa	%o5,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x64, %i3
	lda	[%l7 + %i3] 0x89,	%f19
	nop
	set	0x36, %o1
	stb	%l5,	[%l7 + %o1]
	set	0x14, %l3
	lda	[%l7 + %l3] 0x81,	%f9
	set	0x1C, %g7
	sta	%f23,	[%l7 + %g7] 0x88
	nop
	set	0x2C, %l6
	ldsh	[%l7 + %l6],	%l1
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%g2
	nop
	set	0x28, %i6
	sth	%g6,	[%l7 + %i6]
	or	%o2,	%l3,	%o7
	set	0x10, %o3
	swapa	[%l7 + %o3] 0x88,	%l6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%i3
	nop
	set	0x4C, %l0
	swap	[%l7 + %l0],	%i6
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x80,	%g4
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%i1
	and	%o0,	%g1,	%i7
	set	0x68, %i0
	swapa	[%l7 + %i0] 0x80,	%l2
	nop
	nop
	setx	0xC31BCB27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x74D3348F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f31,	%f11
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%g4
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%g2
	or	%i4,	%i2,	%o4
	nop
	set	0x28, %o4
	stx	%l0,	[%l7 + %o4]
	nop
	set	0x5F, %l5
	ldsb	[%l7 + %l5],	%l4
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x89,	%g7
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xea,	%i4
	set	0x74, %g5
	stwa	%l5,	[%l7 + %g5] 0xea
	membar	#Sync
	or	%l1,	%g2,	%o5
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%l3
	add	%l6,	%o7,	%o1
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf1
	membar	#Sync
	set	0x68, %l2
	lda	[%l7 + %l2] 0x81,	%f9
	set	0x50, %i5
	swapa	[%l7 + %i5] 0x80,	%i3
	nop
	set	0x75, %i1
	stb	%g5,	[%l7 + %i1]
	or	%i6,	%i0,	%o6
	nop
	set	0x08, %g2
	lduw	[%l7 + %g2],	%i1
	nop
	set	0x5E, %i2
	ldsh	[%l7 + %i2],	%o0
	fpsub32	%f10,	%f26,	%f12
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x88,	%i7
	nop
	set	0x48, %o6
	stx	%g1,	[%l7 + %o6]
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x89,	%l2
	ld	[%l7 + 0x20],	%f25
	nop
	set	0x54, %i3
	stw	%o3,	[%l7 + %i3]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	nop
	set	0x3C, %g3
	lduw	[%l7 + %g3],	%g3
	set	0x2C, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i4
	nop
	set	0x38, %l6
	stw	%g4,	[%l7 + %l6]
	nop
	set	0x30, %l4
	std	%i2,	[%l7 + %l4]
	add	%l0,	%l4,	%g7
	st	%fsr,	[%l7 + 0x58]
	set	0x14, %i6
	stwa	%i5,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x68, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%o4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xea,	%l4
	st	%fsr,	[%l7 + 0x48]
	add	%g2,	%o5,	%o2
	st	%fsr,	[%l7 + 0x38]
	st	%f17,	[%l7 + 0x44]
	st	%f26,	[%l7 + 0x0C]
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%g6
	add	%l1,	%l3,	%l6
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x81,	%o0
	nop
	set	0x0C, %i0
	sth	%o7,	[%l7 + %i0]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%g4
	nop
	set	0x38, %i4
	ldub	[%l7 + %i4],	%i6
	nop
	set	0x48, %l5
	std	%i0,	[%l7 + %l5]
	nop
	set	0x50, %g4
	std	%f8,	[%l7 + %g4]
	set	0x60, %g5
	stda	%o6,	[%l7 + %g5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x4C],	%f8
	nop
	set	0x0D, %o7
	ldub	[%l7 + %o7],	%i1
	and	%i3,	%o0,	%g1
	nop
	set	0x20, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%l2
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x80,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%i4
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%o3
	set	0x60, %i1
	lda	[%l7 + %i1] 0x81,	%f3
	nop
	set	0x46, %g2
	lduh	[%l7 + %g2],	%g4
	nop
	set	0x50, %i2
	stw	%l0,	[%l7 + %i2]
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%l4
	set	0x60, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g7
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%i2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%o4
	nop
	set	0x28, %o5
	std	%l4,	[%l7 + %o5]
	nop
	set	0x68, %o1
	stw	%o5,	[%l7 + %o1]
	nop
	set	0x38, %g3
	stx	%o2,	[%l7 + %g3]
	set	0x68, %l6
	stda	%g6,	[%l7 + %l6] 0x80
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%g2
	set	0x1C, %i6
	swapa	[%l7 + %i6] 0x88,	%l1
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f16
	set	0x40, %g7
	stda	%l2,	[%l7 + %g7] 0x88
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x88,	 3
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x89,	%l6
	ld	[%l7 + 0x18],	%f19
	bn,a,pn	%xcc,	loop_134
	nop
	set	0x41, %l0
	ldub	[%l7 + %l0],	%g5
	nop
	set	0x19, %g1
	ldsb	[%l7 + %g1],	%o7
	nop
	set	0x18, %i0
	swap	[%l7 + %i0],	%i6
loop_134:
	nop
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xea,	%o6
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x81,	%i1
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f0
	nop
	set	0x4C, %g4
	stw	%i3,	[%l7 + %g4]
	and	%i0,	%g1,	%o0
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x80,	 3
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe2,	%l2
	nop
	set	0x60, %o7
	std	%g2,	[%l7 + %o7]
	and	%i4,	%o3,	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%l0
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f16
	and	%g7,	%i5,	%i2
	nop
	set	0x4A, %l2
	lduh	[%l7 + %l2],	%l5
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%o4
	set	0x78, %i5
	stda	%o4,	[%l7 + %i5] 0xe2
	membar	#Sync
	or	%g6,	%g2,	%o2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xca
	nop
	set	0x4C, %i2
	ldsw	[%l7 + %i2],	%l3
	set	0x18, %o6
	stha	%l1,	[%l7 + %o6] 0xe2
	membar	#Sync
	wr	%o1,	%g5,	%softint
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%l6
	nop
	set	0x24, %i3
	ldub	[%l7 + %i3],	%i6
	bn,a,pn	%xcc,	loop_135
	st	%fsr,	[%l7 + 0x6C]
	set	0x7C, %g2
	stwa	%i1,	[%l7 + %g2] 0x89
loop_135:
	nop
	set	0x79, %o5
	ldstub	[%l7 + %o5],	%i3
	nop
	set	0x58, %o1
	prefetch	[%l7 + %o1],	 3
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd2
	nop
	set	0x40, %l6
	ldstub	[%l7 + %l6],	%o6
	set	0x78, %i6
	stda	%g0,	[%l7 + %i6] 0x80
	nop
	set	0x52, %l4
	ldub	[%l7 + %l4],	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%l2
	set	0x7C, %l3
	lda	[%l7 + %l3] 0x81,	%f8
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc0
	nop
	set	0x62, %g6
	ldsh	[%l7 + %g6],	%o0
	add	%i4,	%o3,	%g4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%l4
	set	0x58, %o3
	stwa	%g3,	[%l7 + %o3] 0x89
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x88,	%g6
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f0
	nop
	set	0x38, %o4
	swap	[%l7 + %o4],	%i5
	set	0x18, %i4
	sta	%f31,	[%l7 + %i4] 0x80
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x81,	%l0
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%i2
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x80,	%l4
	st	%fsr,	[%l7 + 0x24]
	fpadd16s	%f30,	%f20,	%f25
	set	0x0C, %g5
	swapa	[%l7 + %g5] 0x88,	%o5
	nop
	set	0x18, %o2
	stx	%o4,	[%l7 + %o2]
	fpadd32	%f10,	%f18,	%f8
	nop
	set	0x13, %o7
	ldsb	[%l7 + %o7],	%g2
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%g6
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%o2
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f20
	nop
	set	0x30, %i1
	std	%l2,	[%l7 + %i1]
	or	%o1,	%l1,	%g5
	wr	%l6,	%i6,	%clear_softint
	st	%f28,	[%l7 + 0x18]
	st	%f20,	[%l7 + 0x60]
	set	0x38, %o6
	sta	%f29,	[%l7 + %o6] 0x88
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%i0
	nop
	set	0x1A, %i2
	lduh	[%l7 + %i2],	%i3
	nop
	set	0x30, %g2
	stx	%o7,	[%l7 + %g2]
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%o6
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f28
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%i0
	st	%f12,	[%l7 + 0x08]
	nop
	set	0x60, %l6
	stx	%i7,	[%l7 + %l6]
	set	0x58, %i3
	sta	%f24,	[%l7 + %i3] 0x89
	nop
	set	0x08, %i6
	stx	%g1,	[%l7 + %i6]
	set	0x60, %l4
	stxa	%l2,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x55, %l3
	ldsb	[%l7 + %l3],	%i4
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x88,	%f31
	nop
	set	0x18, %l0
	std	%f2,	[%l7 + %l0]
	nop
	set	0x19, %o3
	ldstub	[%l7 + %o3],	%o0
	nop
	set	0x31, %g7
	ldsb	[%l7 + %g7],	%o3
	st	%fsr,	[%l7 + 0x64]
	and	%g4,	%l4,	%g3
	or	%g7,	%l0,	%i5
	nop
	set	0x5D, %g1
	ldub	[%l7 + %g1],	%i2
	or	%o5,	%o4,	%l5
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xea,	%g2
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	set	0x2A, %i0
	stha	%o2,	[%l7 + %i0] 0x81
	nop
	nop
	setx	0x711AD06E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF3A28081,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f3,	%f18
	st	%fsr,	[%l7 + 0x2C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%l3
	nop
	set	0x50, %g4
	stw	%l1,	[%l7 + %g4]
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x80,	 2
	nop
	set	0x36, %g5
	lduh	[%l7 + %g5],	%l6
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f0
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf1
	membar	#Sync
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x40, %l2
	std	%f14,	[%l7 + %l2]
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	st	%f29,	[%l7 + 0x08]
	set	0x1F, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i3
	nop
	set	0x38, %o0
	ldsw	[%l7 + %o0],	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%i0
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%o6
	set	0x53, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g1
	nop
	set	0x12, %i2
	sth	%l2,	[%l7 + %i2]
	set	0x68, %g2
	swapa	[%l7 + %g2] 0x88,	%i4
	add	%o0,	%o3,	%g4
	nop
	set	0x6A, %o5
	sth	%l4,	[%l7 + %o5]
	set	0x1D, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g3
	set	0x48, %o1
	stwa	%g7,	[%l7 + %o1] 0x88
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f28
	nop
	set	0x62, %i6
	stb	%l0,	[%l7 + %i6]
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%i7
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x89,	%i2
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x1E, %l0
	ldsb	[%l7 + %l0],	%o4
	set	0x60, %g6
	swapa	[%l7 + %g6] 0x88,	%l5
	nop
	set	0x20, %g7
	prefetch	[%l7 + %g7],	 4
	nop
	set	0x42, %g1
	ldsh	[%l7 + %g1],	%g2
	st	%f31,	[%l7 + 0x20]
	nop
	set	0x5A, %o3
	ldsb	[%l7 + %o3],	%g6
	nop
	set	0x3F, %o4
	stb	%i5,	[%l7 + %o4]
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x81,	%o2
	add	%l3,	%o1,	%g5
	ld	[%l7 + 0x48],	%f20
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%l1
	be,pt	%xcc,	loop_136
	nop
	set	0x65, %g4
	ldsb	[%l7 + %g4],	%l6
	nop
	set	0x69, %g5
	ldub	[%l7 + %g5],	%i1
	set	0x18, %l1
	stwa	%i3,	[%l7 + %l1] 0x89
loop_136:
	nop
	set	0x68, %o2
	sth	%o6,	[%l7 + %o2]
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x81,	%i0
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%o6
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x10, %i5
	lduw	[%l7 + %i5],	%g1
	nop
	set	0x78, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x80,	%l2
	nop
	set	0x30, %i7
	ldsw	[%l7 + %i7],	%i4
	nop
	set	0x70, %i2
	swap	[%l7 + %i2],	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%o0
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x78, %o5
	std	%l4,	[%l7 + %o5]
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%g2
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x89,	%g4
	set	0x6C, %l6
	stwa	%g7,	[%l7 + %l6] 0xe2
	membar	#Sync
	fpsub32s	%f4,	%f12,	%f10
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	nop
	set	0x50, %i3
	std	%i6,	[%l7 + %i3]
	set	0x13, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o5
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xe2,	%o4
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%l5
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x81,	%i2
	bgu	%icc,	loop_137
	nop
	set	0x3E, %l0
	lduh	[%l7 + %l0],	%g6
	nop
	set	0x60, %g1
	stx	%g2,	[%l7 + %g1]
	fpsub16	%f28,	%f2,	%f30
loop_137:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o2
	nop
	set	0x1D, %g7
	stb	%o1,	[%l7 + %g7]
	set	0x2B, %o4
	ldstuba	[%l7 + %o4] 0x80,	%g5
	set	0x08, %o3
	sta	%f11,	[%l7 + %o3] 0x89
	and	%l3,	%l6,	%i1
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xe3,	%i2
	nop
	set	0x50, %g4
	swap	[%l7 + %g4],	%l1
	nop
	set	0x3C, %i0
	stb	%i0,	[%l7 + %i0]
	set	0x20, %g5
	stda	%o6,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%g1
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f22
	set	0x10, %l5
	swapa	[%l7 + %l5] 0x81,	%i4
	fpsub32s	%f11,	%f21,	%f28
	nop
	set	0x13, %o2
	ldsb	[%l7 + %o2],	%i6
	set	0x60, %l2
	sta	%f2,	[%l7 + %l2] 0x80
	nop
	set	0x5C, %o7
	stw	%o3,	[%l7 + %o7]
	set	0x5D, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o0
	nop
	set	0x38, %o6
	std	%f4,	[%l7 + %o6]
	set	0x1D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f0
	set	0x48, %g2
	sta	%f28,	[%l7 + %g2] 0x80
	or	%l2,	%g3,	%g7
	nop
	set	0x48, %o5
	stx	%l0,	[%l7 + %o5]
	add	%g4,	%i7,	%o4
	nop
	set	0x34, %g3
	sth	%o5,	[%l7 + %g3]
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x80,	%i2
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x80,	%g6
	nop
	set	0x18, %o0
	std	%g2,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x3C]
	set	0x62, %i3
	stba	%i5,	[%l7 + %i3] 0x89
	set	0x20, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l5
	and	%o1,	%o2,	%l3
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x76, %i6
	sth	%g5,	[%l7 + %i6]
	set	0x35, %l4
	stba	%i1,	[%l7 + %l4] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%l6
	set	0x28, %l3
	stba	%l1,	[%l7 + %l3] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	set	0x75, %g1
	stba	%o7,	[%l7 + %g1] 0x89
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xea,	%o6
	wr	%i0,	%g1,	%softint
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x89,	%f30
	set	0x48, %o3
	stda	%i4,	[%l7 + %o3] 0x88
	ld	[%l7 + 0x28],	%f20
	set	0x10, %g7
	stda	%i6,	[%l7 + %g7] 0x81
	nop
	set	0x6F, %i4
	stb	%o0,	[%l7 + %i4]
	nop
	set	0x08, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x88,	%o3
	set	0x28, %i0
	stxa	%l2,	[%l7 + %i0] 0x89
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1D2, 	%tick_cmpr
	set	0x74, %l5
	stwa	%l4,	[%l7 + %l5] 0x89
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%i7
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	nop
	set	0x60, %o7
	ldsb	[%l7 + %o7],	%l0
	nop
	set	0x50, %i1
	stx	%o5,	[%l7 + %i1]
	set	0x28, %o6
	stda	%i2,	[%l7 + %o6] 0x89
	add	%g6,	%o4,	%i5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f0
	nop
	nop
	setx	0x11FB8F688CE4CF0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x6C4C6BE70253A0F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f30,	%f4
	set	0x48, %i7
	stda	%l4,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	set	0x34, %o5
	sta	%f21,	[%l7 + %o5] 0x81
	nop
	set	0x08, %o2
	stw	%o1,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%l2
	or	%o2,	%g5,	%i3
	set	0x32, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l6
	nop
	set	0x08, %o0
	ldub	[%l7 + %o0],	%i1
	set	0x20, %g3
	swapa	[%l7 + %g3] 0x81,	%o7
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf1
	membar	#Sync
	nop
	set	0x42, %o1
	sth	%l1,	[%l7 + %o1]
	set	0x4A, %l4
	stha	%o6,	[%l7 + %l4] 0xea
	membar	#Sync
	ld	[%l7 + 0x2C],	%f14
	fpadd16s	%f20,	%f31,	%f13
	st	%fsr,	[%l7 + 0x48]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%i4
	nop
	set	0x44, %l3
	ldsh	[%l7 + %l3],	%g1
	st	%fsr,	[%l7 + 0x0C]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x81
	add	%i6,	%o0,	%l2
	and	%g3,	%o3,	%g7
	nop
	set	0x50, %g1
	lduw	[%l7 + %g1],	%g4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f0
	nop
	set	0x0C, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x5A, %o3
	lduh	[%l7 + %o3],	%i7
	set	0x4C, %o4
	stwa	%l0,	[%l7 + %o4] 0x80
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x88,	 3
	nop
	set	0x6F, %i4
	ldsb	[%l7 + %i4],	%o5
	and	%g6,	%o4,	%i2
	ba,pt	%xcc,	loop_138
	bg,a	%icc,	loop_139
	add	%l5,	%i5,	%o1
	be,pt	%icc,	loop_140
loop_138:
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f22
loop_139:
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f30
	set	0x18, %l5
	stda	%g2,	[%l7 + %l5] 0x80
loop_140:
	nop
	set	0x44, %i0
	sth	%o2,	[%l7 + %i0]
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x80,	%g5
	set	0x2C, %o7
	stwa	%l3,	[%l7 + %o7] 0x80
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xeb,	%i2
	wr 	%g0, 	0x5, 	%fprs
	fpsub16	%f20,	%f24,	%f20
	nop
	set	0x2C, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	and	%l1,	%o6,	%o7
	set	0x14, %i7
	sta	%f0,	[%l7 + %i7] 0x80
	add	%i0,	%g1,	%i4
	nop
	set	0x6C, %l1
	stw	%o0,	[%l7 + %l1]
	fpsub16	%f6,	%f14,	%f10
	and	%l2,	%i6,	%g3
	nop
	set	0x68, %o5
	stw	%g7,	[%l7 + %o5]
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x7A, %o2
	ldub	[%l7 + %o2],	%i7
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x81,	%l0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x81
	or	%g4,	%l4,	%o5
	nop
	set	0x68, %g3
	prefetch	[%l7 + %g3],	 2
	fpadd16	%f26,	%f26,	%f2
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%g6
	nop
	set	0x10, %o1
	stx	%o4,	[%l7 + %o1]
	fpadd32s	%f17,	%f0,	%f7
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x40, %i3
	stb	%l5,	[%l7 + %i3]
	nop
	set	0x48, %l4
	ldsh	[%l7 + %l4],	%i2
	nop
	set	0x1E, %l3
	ldsh	[%l7 + %l3],	%o1
	nop
	set	0x4E, %l0
	stb	%g2,	[%l7 + %l0]
	set	0x5A, %i6
	stha	%o2,	[%l7 + %i6] 0x88
	add	%i5,	%l3,	%g5
	wr	%i3,	%l6,	%clear_softint
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x81,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%o7
	or	%i0,	%g1,	%i4
	set	0x7C, %o3
	stba	%o6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x50, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xca
	nop
	set	0x08, %o4
	std	%f10,	[%l7 + %o4]
	set	0x28, %g5
	lda	[%l7 + %g5] 0x88,	%f12
	nop
	set	0x38, %i4
	stx	%l2,	[%l7 + %i4]
	add	%i6,	%g3,	%g7
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc2
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x88,	 2
	nop
	set	0x10, %i0
	stw	%o3,	[%l7 + %i0]
	nop
	set	0x1C, %l2
	stw	%i7,	[%l7 + %l2]
	set	0x74, %i1
	stwa	%g4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%l4
	nop
	set	0x30, %o6
	lduw	[%l7 + %o6],	%l0
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f22
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc8
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc4
	and	%o5,	%o4,	%l5
	nop
	set	0x28, %i5
	std	%f2,	[%l7 + %i5]
	ble,pt	%icc,	loop_141
	nop
	set	0x64, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	nop
	setx	0x9EED191A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x66BA976A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f5,	%f12
	set	0x6C, %g2
	sta	%f9,	[%l7 + %g2] 0x81
loop_141:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%o1
	set	0x28, %l6
	stxa	%g6,	[%l7 + %l6] 0x80
	nop
	set	0x58, %g3
	std	%f20,	[%l7 + %g3]
	nop
	set	0x74, %o0
	stb	%g2,	[%l7 + %o0]
	set	0x2A, %i2
	stha	%o2,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x49, %i3
	ldub	[%l7 + %i3],	%i5
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%l3
	nop
	set	0x28, %l3
	lduw	[%l7 + %l3],	%g5
	set	0x48, %l0
	stda	%i2,	[%l7 + %l0] 0x89
	set	0x10, %i6
	stda	%l0,	[%l7 + %i6] 0x88
	nop
	set	0x10, %l4
	ldstub	[%l7 + %l4],	%l6
	nop
	set	0x18, %o3
	lduw	[%l7 + %o3],	%i1
	nop
	set	0x60, %g1
	ldsb	[%l7 + %g1],	%i0
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x81,	%o7
	nop
	set	0x70, %o4
	stw	%i4,	[%l7 + %o4]
	nop
	set	0x64, %g5
	sth	%o6,	[%l7 + %g5]
	nop
	set	0x22, %i4
	sth	%l2,	[%l7 + %i4]
	nop
	set	0x32, %g7
	lduh	[%l7 + %g7],	%g1
	nop
	set	0x08, %l5
	stx	%i6,	[%l7 + %l5]
	set	0x78, %g4
	stha	%g3,	[%l7 + %g4] 0x81
	set	0x26, %i0
	stba	%o0,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%f28
	or	%o3,	%i7,	%g7
	nop
	set	0x2E, %o7
	ldstub	[%l7 + %o7],	%l4
	nop
	set	0x48, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x70, %l2
	lda	[%l7 + %l2] 0x89,	%f18
	nop
	set	0x60, %i7
	stx	%l0,	[%l7 + %i7]
	set	0x68, %l1
	stda	%o4,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x20, %i5
	stwa	%g4,	[%l7 + %i5] 0x81
	set	0x50, %o5
	stda	%l4,	[%l7 + %o5] 0xea
	membar	#Sync
	or	%i2,	%o4,	%o1
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc2
	bleu,pn	%xcc,	loop_142
	nop
	set	0x38, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x30, %o2
	stda	%g2,	[%l7 + %o2] 0x81
loop_142:
	nop
	set	0x60, %g3
	stxa	%g6,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x10, %i2
	sta	%f21,	[%l7 + %i2] 0x81
	nop
	set	0x79, %i3
	stb	%i5,	[%l7 + %i3]
	nop
	set	0x31, %o1
	ldstub	[%l7 + %o1],	%o2
	and	%g5,	%i3,	%l1
	set	0x08, %l3
	stxa	%l3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x6C, %o0
	stb	%l6,	[%l7 + %o0]
	set	0x58, %i6
	swapa	[%l7 + %i6] 0x88,	%i1
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%o7
	set	0x2C, %o3
	sta	%f2,	[%l7 + %o3] 0x81
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f16
	nop
	set	0x28, %g1
	std	%i0,	[%l7 + %g1]
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f10
	fpadd32	%f16,	%f28,	%f24
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l2
	nop
	set	0x3A, %g6
	sth	%o6,	[%l7 + %g6]
	nop
	set	0x7B, %g5
	stb	%i6,	[%l7 + %g5]
	nop
	set	0x0C, %i4
	lduw	[%l7 + %i4],	%g3
	set	0x08, %g7
	stxa	%o0,	[%l7 + %g7] 0x89
	nop
	set	0x34, %g4
	sth	%o3,	[%l7 + %g4]
	nop
	set	0x15, %l5
	stb	%i7,	[%l7 + %l5]
	nop
	set	0x70, %i0
	stx	%g7,	[%l7 + %i0]
	nop
	set	0x7E, %i1
	lduh	[%l7 + %i1],	%l4
	add	%g1,	%l0,	%o5
	set	0x40, %o7
	sta	%f22,	[%l7 + %o7] 0x80
	wr	%l5,	%i2,	%sys_tick
	set	0x50, %o6
	ldda	[%l7 + %o6] 0x80,	%o4
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%f28
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xd2
	set	0x44, %l1
	sta	%f20,	[%l7 + %l1] 0x89
	nop
	set	0x10, %o5
	ldsh	[%l7 + %o5],	%g4
	nop
	set	0x54, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x40, %l6
	stx	%o1,	[%l7 + %l6]
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%g6
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%i5
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%o2
	nop
	set	0x75, %i3
	ldsb	[%l7 + %i3],	%g5
	nop
	set	0x68, %g3
	ldsh	[%l7 + %g3],	%g2
	wr	%i3,	%l3,	%clear_softint
	nop
	set	0x20, %o1
	swap	[%l7 + %o1],	%l6
	nop
	set	0x20, %l3
	std	%l0,	[%l7 + %l3]
	ld	[%l7 + 0x34],	%f21
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%o7
	set	0x38, %o0
	stda	%i0,	[%l7 + %o0] 0x80
	nop
	set	0x68, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x18, %i6
	stda	%i4,	[%l7 + %i6] 0xeb
	membar	#Sync
	or	%o6,	%l2,	%g3
	set	0x28, %l4
	swapa	[%l7 + %l4] 0x81,	%i6
	set	0x70, %o3
	stda	%o2,	[%l7 + %o3] 0xea
	membar	#Sync
	fpsub32s	%f12,	%f8,	%f5
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%i7
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x89,	 2
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f18
	nop
	set	0x20, %g6
	lduw	[%l7 + %g6],	%l4
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x88,	 3
	nop
	set	0x20, %g4
	std	%g0,	[%l7 + %g4]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l5
	nop
	set	0x74, %g7
	ldsw	[%l7 + %g7],	%i2
	nop
	set	0x20, %i1
	stb	%l0,	[%l7 + %i1]
	nop
	set	0x32, %o7
	ldsh	[%l7 + %o7],	%o4
	and	%g4,	%g6,	%o1
	st	%fsr,	[%l7 + 0x70]
	add	%o2,	%g5,	%g2
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x81,	%i5
	set	0x0C, %i0
	stha	%i3,	[%l7 + %i0] 0x81
	set	0x7C, %l2
	sta	%f24,	[%l7 + %l2] 0x88
	set	0x58, %i7
	lda	[%l7 + %i7] 0x89,	%f30
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x20, %o5
	ldsb	[%l7 + %o5],	%l1
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%i1
	fpadd32s	%f24,	%f31,	%f15
	set	0x70, %l1
	lda	[%l7 + %l1] 0x89,	%f28
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%i0
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 4
	nop
	set	0x13, %o2
	ldstub	[%l7 + %o2],	%o6
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%l2
	set	0x60, %i2
	stda	%o6,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x68, %g3
	lduh	[%l7 + %g3],	%i6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xda,	%f0
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x60, %o0
	std	%f16,	[%l7 + %o0]
	and	%o3,	%i7,	%g3
	set	0x10, %l3
	swapa	[%l7 + %l3] 0x89,	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%o0
	set	0x0B, %l0
	stba	%g1,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x6C, %l4
	ldub	[%l7 + %l4],	%o5
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x89,	%i2
	set	0x50, %o4
	stxa	%l0,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%o4
	set	0x73, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g4
	nop
	set	0x78, %g6
	ldub	[%l7 + %g6],	%l5
	nop
	set	0x10, %g1
	std	%o0,	[%l7 + %g1]
	set	0x34, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o2
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x89,	%g5
	set	0x60, %l5
	stxa	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x70, %i1
	ldsw	[%l7 + %i1],	%g6
	or	%i5,	%i3,	%l6
	nop
	set	0x24, %o7
	prefetch	[%l7 + %o7],	 2
	set	0x74, %g7
	stwa	%l1,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%i0
	nop
	set	0x28, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x78, %l2
	ldx	[%l7 + %l2],	%l3
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%o6
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%l2
	bl,a,pn	%icc,	loop_143
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f14
	and	%i0,	%i6,	%o3
	nop
	set	0x72, %l6
	ldstub	[%l7 + %l6],	%o7
loop_143:
	nop
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	nop
	set	0x18, %i3
	stb	%g3,	[%l7 + %i3]
	nop
	set	0x18, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x1C, %i2
	stwa	%l4,	[%l7 + %i2] 0x89
	nop
	set	0x4C, %o1
	stw	%g7,	[%l7 + %o1]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x88
	nop
	set	0x18, %l3
	stx	%o0,	[%l7 + %l3]
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x89,	%g1
	or	%i2,	%l0,	%o4
	and	%g4,	%o5,	%o1
	add	%l5,	%g5,	%o2
	nop
	set	0x70, %l4
	stx	%g6,	[%l7 + %l4]
	st	%f12,	[%l7 + 0x34]
	wr	%i5,	%g2,	%ccr
	set	0x2C, %i6
	sta	%f16,	[%l7 + %i6] 0x80
	set	0x75, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i3
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd0,	%f0
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x81,	%l6
	add	%l1,	%i1,	%i4
	set	0x51, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l3
	and	%o6,	%l2,	%i0
	set	0x38, %g1
	stda	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%o6
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%g3
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%i6
	add	%i7,	%g7,	%o0
	nop
	set	0x18, %o7
	ldsw	[%l7 + %o7],	%l4
	add	%i2,	%g1,	%l0
	nop
	set	0x09, %g7
	ldstub	[%l7 + %g7],	%o4
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f22
	set	0x0C, %o6
	lda	[%l7 + %o6] 0x89,	%f23
	nop
	set	0x58, %l2
	ldsh	[%l7 + %l2],	%o5
	bleu,a,pt	%icc,	loop_144
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x0A, %i0
	ldstub	[%l7 + %i0],	%o1
	nop
	set	0x16, %i7
	lduh	[%l7 + %i7],	%g4
loop_144:
	bgu,a	%icc,	loop_145
	nop
	set	0x22, %o5
	ldsh	[%l7 + %o5],	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g6
loop_145:
	nop
	set	0x20, %g2
	ldx	[%l7 + %g2],	%g5
	or	%g2,	%i5,	%l6
	nop
	set	0x28, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x6B, %i5
	ldsb	[%l7 + %i5],	%i3
	or	%i1,	%i4,	%l3
	or	%l1,	%o6,	%i0
	set	0x50, %l6
	lda	[%l7 + %l6] 0x89,	%f16
	nop
	set	0x38, %o2
	stx	%o3,	[%l7 + %o2]
	set	0x4D, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o7
	nop
	set	0x60, %i2
	std	%f28,	[%l7 + %i2]
	set	0x4D, %o0
	stba	%g3,	[%l7 + %o0] 0x89
	or	%i6,	%i7,	%g7
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f14
	nop
	set	0x64, %o1
	ldub	[%l7 + %o1],	%l2
	nop
	set	0x78, %l4
	std	%l4,	[%l7 + %l4]
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%o0
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x81,	 2
	nop
	set	0x35, %o4
	ldub	[%l7 + %o4],	%l0
	set	0x20, %o3
	stda	%o4,	[%l7 + %o3] 0x89
	st	%fsr,	[%l7 + 0x48]
	set	0x4F, %l0
	ldstuba	[%l7 + %l0] 0x88,	%g1
	or	%o5,	%o1,	%g4
	nop
	set	0x4C, %g5
	stw	%o2,	[%l7 + %g5]
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x81,	%l5
	nop
	set	0x55, %i4
	stb	%g5,	[%l7 + %i4]
	nop
	set	0x50, %g4
	ldsw	[%l7 + %g4],	%g6
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%i4
	nop
	set	0x58, %g6
	lduw	[%l7 + %g6],	%g2
	or	%l6,	%i1,	%i4
	set	0x10, %g7
	stwa	%i3,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x30, %o7
	std	%l0,	[%l7 + %o7]
	nop
	set	0x3E, %o6
	ldsh	[%l7 + %o6],	%o6
	nop
	set	0x70, %l2
	stx	%l3,	[%l7 + %l2]
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x80,	%o2
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%o7
	set	0x28, %i7
	prefetcha	[%l7 + %i7] 0x89,	 3
	nop
	set	0x2E, %g2
	ldsh	[%l7 + %g2],	%i6
	set	0x46, %o5
	stha	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%g6
	set	, %l6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1263
!	Type a   	: 20
!	Type cti   	: 20
!	Type x   	: 535
!	Type f   	: 46
!	Type i   	: 116
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
	set	0x2,	%g1
	set	0xF,	%g2
	set	0xE,	%g3
	set	0x3,	%g4
	set	0x3,	%g5
	set	0x7,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xF,	%i1
	set	-0xB,	%i2
	set	-0xA,	%i3
	set	-0xD,	%i4
	set	-0xD,	%i5
	set	-0x4,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x24E15AF2,	%l0
	set	0x76420E09,	%l1
	set	0x65D9F2CE,	%l2
	set	0x3F3F0871,	%l3
	set	0x52D9C0E1,	%l4
	set	0x2F4FCAD4,	%l5
	set	0x0962266C,	%l6
	!# Output registers
	set	-0x187E,	%o0
	set	0x152D,	%o1
	set	0x1967,	%o2
	set	-0x13D8,	%o3
	set	0x1CFD,	%o4
	set	-0x1AA4,	%o5
	set	-0x0E76,	%o6
	set	0x17DF,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%l2
	nop
	set	0x0E, %l1
	stb	%l4,	[%l7 + %l1]
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x89,	%i7
	nop
	set	0x74, %i3
	ldsh	[%l7 + %i3],	%o0
	set	0x08, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x68, %o0
	std	%o4,	[%l7 + %o0]
	set	0x74, %l4
	sta	%f26,	[%l7 + %l4] 0x88
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	ld	[%l7 + 0x64],	%f2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%i2
	nop
	set	0x24, %i6
	swap	[%l7 + %i6],	%o1
	and	%g4,	%o5,	%l5
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf1,	%f16
	nop
	set	0x28, %o4
	swap	[%l7 + %o4],	%g5
	or	%o2,	%i5,	%g6
	nop
	set	0x25, %l0
	ldsb	[%l7 + %l0],	%g2
	nop
	set	0x38, %g5
	std	%i0,	[%l7 + %g5]
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x89,	 1
	st	%f30,	[%l7 + 0x18]
	set	0x5D, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i3
	nop
	set	0x48, %l5
	std	%i4,	[%l7 + %l5]
	nop
	set	0x4B, %g1
	ldstub	[%l7 + %g1],	%l1
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x88,	%l3
	nop
	set	0x24, %g7
	ldsb	[%l7 + %g7],	%o3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g3
	be,a,pt	%icc,	loop_146
	st	%fsr,	[%l7 + 0x1C]
	add	%o6,	%i6,	%i0
	fpsub32	%f14,	%f0,	%f24
loop_146:
	and	%g7,	%l4,	%l2
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%i7
	nop
	set	0x20, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x70, %l2
	stx	%fsr,	[%l7 + %l2]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o4
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%f22
	wr	%i2,	%o1,	%pic
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x81,	%g1
	set	0x54, %g2
	swapa	[%l7 + %g2] 0x81,	%g4
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xd0
	bg,a	%xcc,	loop_147
	fpadd32	%f18,	%f28,	%f18
	nop
	set	0x24, %i5
	stw	%l5,	[%l7 + %i5]
	nop
	set	0x58, %o5
	stx	%g5,	[%l7 + %o5]
loop_147:
	nop
	set	0x58, %o2
	stda	%o4,	[%l7 + %o2] 0x80
	nop
	set	0x6B, %l6
	stb	%i5,	[%l7 + %l6]
	set	0x28, %i2
	sta	%f10,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 3
	set	0x18, %l3
	stwa	%o2,	[%l7 + %l3] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF29, 	%tick_cmpr
	nop
	set	0x20, %o0
	stx	%l6,	[%l7 + %o0]
	set	0x78, %i3
	stxa	%i1,	[%l7 + %i3] 0x89
	nop
	set	0x24, %g3
	ldsh	[%l7 + %g3],	%i3
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x81,	 1
	nop
	set	0x1A, %l4
	ldsh	[%l7 + %l4],	%l3
	ld	[%l7 + 0x54],	%f1
	nop
	set	0x16, %i6
	ldsh	[%l7 + %i6],	%o3
	nop
	set	0x2E, %o3
	lduh	[%l7 + %o3],	%i4
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%g3
	ld	[%l7 + 0x60],	%f6
	nop
	set	0x48, %g5
	std	%i0,	[%l7 + %g5]
	wr	%g7,	%l4,	%y
	add	%i6,	%l2,	%i7
	set	0x69, %i4
	stba	%o0,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x65, %g4
	stb	%o4,	[%l7 + %g4]
	nop
	set	0x58, %o4
	stw	%l0,	[%l7 + %o4]
	nop
	nop
	setx	0x0F088BDE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xC0DC65DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f25,	%f10
	or	%o1,	%g1,	%g4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf9
	membar	#Sync
	bge,a,pn	%xcc,	loop_148
	nop
	set	0x40, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x50, %g6
	std	%f30,	[%l7 + %g6]
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
loop_148:
	nop
	set	0x59, %o6
	ldstub	[%l7 + %o6],	%g5
	set	0x18, %l2
	swapa	[%l7 + %l2] 0x80,	%l5
	set	0x78, %i0
	stwa	%o5,	[%l7 + %i0] 0x88
	set	0x14, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o2
	nop
	set	0x60, %i7
	ldsw	[%l7 + %i7],	%g6
	set	0x24, %i1
	stba	%i5,	[%l7 + %i1] 0x80
	set	0x20, %i5
	lda	[%l7 + %i5] 0x81,	%f18
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x1C, %o2
	lduw	[%l7 + %o2],	%l6
	add	%i1,	%i3,	%l1
	fpadd32	%f12,	%f14,	%f6
	nop
	set	0x14, %g2
	ldstub	[%l7 + %g2],	%l3
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x18, %i2
	lduw	[%l7 + %i2],	%g2
	set	0x44, %l3
	stwa	%i4,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x80,	%o2
	set	0x76, %i3
	stba	%o6,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o7
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x88,	%i0
	st	%f18,	[%l7 + 0x54]
	nop
	set	0x6C, %l1
	lduw	[%l7 + %l1],	%g7
	set	0x08, %o1
	stha	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x72, %i6
	sth	%l2,	[%l7 + %i6]
	fpsub16s	%f30,	%f24,	%f15
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%i6
	set	0x60, %l4
	stxa	%i6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x0C, %g5
	ldub	[%l7 + %g5],	%o4
	set	0x78, %l0
	stda	%l0,	[%l7 + %l0] 0x88
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f12
	and	%o1,	%g1,	%o0
	set	0x70, %i4
	stda	%i2,	[%l7 + %i4] 0x81
	nop
	nop
	setx	0xF51566B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xAF759ACF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f0,	%f25
	and	%g4,	%l5,	%g5
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f16
	and	%o5,	%g6,	%o2
	nop
	set	0x40, %g1
	std	%f0,	[%l7 + %g1]
	ble,pt	%icc,	loop_149
	st	%f21,	[%l7 + 0x70]
	set	0x68, %l5
	prefetcha	[%l7 + %l5] 0x81,	 1
loop_149:
	st	%f25,	[%l7 + 0x74]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%i5
	nop
	set	0x7C, %g6
	ldstub	[%l7 + %g6],	%i3
	nop
	set	0x1C, %o6
	ldsh	[%l7 + %o6],	%l1
	set	0x40, %l2
	stxa	%l3,	[%l7 + %l2] 0x88
	nop
	set	0x58, %i0
	std	%f0,	[%l7 + %i0]
	nop
	set	0x35, %g7
	ldub	[%l7 + %g7],	%g2
	set	0x58, %o7
	stwa	%i4,	[%l7 + %o7] 0x89
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%o3
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x80,	%g3
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%o7
	nop
	set	0x58, %o2
	stw	%i0,	[%l7 + %o2]
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	set	0x28, %g2
	stxa	%l4,	[%l7 + %g2] 0x89
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%i7
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x81,	%i6
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%o4
	set	0x70, %l3
	stxa	%l0,	[%l7 + %l3] 0x89
	nop
	set	0x14, %o0
	swap	[%l7 + %o0],	%o1
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%g1
	set	0x34, %l1
	sta	%f0,	[%l7 + %l1] 0x81
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%o6
	nop
	set	0x58, %i3
	ldx	[%l7 + %i3],	%o0
	nop
	set	0x6A, %o3
	ldsh	[%l7 + %o3],	%g4
	set	0x50, %l4
	ldda	[%l7 + %l4] 0xe3,	%l4
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f20
	nop
	set	0x70, %l0
	std	%i2,	[%l7 + %l0]
	nop
	set	0x7C, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x1A, %i4
	lduh	[%l7 + %i4],	%o5
	st	%f23,	[%l7 + 0x48]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xeb,	%g6
	bn	%icc,	loop_150
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x20, %g1
	stw	%g5,	[%l7 + %g1]
	ba	%icc,	loop_151
loop_150:
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f4
	set	0x4C, %o4
	lda	[%l7 + %o4] 0x89,	%f6
loop_151:
	nop
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x81,	 1
	nop
	set	0x52, %l2
	lduh	[%l7 + %l2],	%i1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x335, 	%sys_tick_cmpr
	set	0x0C, %i0
	sta	%f23,	[%l7 + %i0] 0x89
	nop
	set	0x3C, %o7
	lduw	[%l7 + %o7],	%l1
	st	%fsr,	[%l7 + 0x7C]
	st	%f6,	[%l7 + 0x7C]
	fpadd32	%f8,	%f22,	%f20
	nop
	set	0x50, %i1
	lduw	[%l7 + %i1],	%l3
	nop
	set	0x0C, %g7
	swap	[%l7 + %g7],	%g2
	add	%i4,	%o3,	%i3
	nop
	set	0x7B, %i5
	stb	%g3,	[%l7 + %i5]
	and	%o7,	%i0,	%l4
	nop
	set	0x2B, %i7
	ldstub	[%l7 + %i7],	%l2
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xe2,	%g6
	nop
	set	0x0D, %o2
	ldstub	[%l7 + %o2],	%i7
	set	0x1C, %i2
	sta	%f13,	[%l7 + %i2] 0x81
	or	%o4,	%l0,	%i6
	nop
	set	0x44, %l6
	lduw	[%l7 + %l6],	%g1
	nop
	set	0x40, %g2
	lduw	[%l7 + %g2],	%o6
	set	0x2E, %l3
	stha	%o1,	[%l7 + %l3] 0xeb
	membar	#Sync
	and	%o0,	%l5,	%i2
	nop
	nop
	setx	0x0D79C5C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xA5EC90DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f19,	%f25
	and	%g4,	%g6,	%o5
	set	0x47, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g5
	nop
	set	0x26, %o0
	ldsh	[%l7 + %o0],	%o2
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%i4
	nop
	set	0x0C, %o1
	lduw	[%l7 + %o1],	%l1
	nop
	set	0x60, %o3
	prefetch	[%l7 + %o3],	 0
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x28, %g5
	ldsh	[%l7 + %g5],	%l3
	set	0x2C, %l0
	stwa	%l6,	[%l7 + %l0] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g2
	or	%o3,	%g3,	%i3
	nop
	set	0x50, %l4
	std	%o6,	[%l7 + %l4]
	nop
	set	0x2B, %g4
	ldstub	[%l7 + %g4],	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%i0
	nop
	set	0x30, %i6
	swap	[%l7 + %i6],	%g7
	nop
	set	0x10, %i4
	stw	%o4,	[%l7 + %i4]
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%i7
	st	%f19,	[%l7 + 0x3C]
	nop
	set	0x48, %o4
	stx	%l0,	[%l7 + %o4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g1
	set	0x79, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o6
	nop
	set	0x1C, %l2
	lduw	[%l7 + %l2],	%o1
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%l4
	nop
	set	0x55, %i0
	ldstub	[%l7 + %i0],	%i2
	nop
	set	0x0A, %o7
	sth	%o0,	[%l7 + %o7]
	nop
	set	0x24, %g7
	stw	%g4,	[%l7 + %g7]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%g5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf9
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%i1
	fpsub16s	%f15,	%f12,	%f14
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f16
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
	st	%f4,	[%l7 + 0x14]
	bg,pn	%xcc,	loop_152
	nop
	set	0x45, %i7
	stb	%i5,	[%l7 + %i7]
	or	%l1,	%l3,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g2
loop_152:
	nop
	set	0x41, %i2
	stb	%o3,	[%l7 + %i2]
	set	0x38, %l6
	stda	%i6,	[%l7 + %l6] 0x89
	set	0x2C, %o2
	stwa	%i3,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x78, %g2
	std	%g2,	[%l7 + %g2]
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%l4
	nop
	set	0x1E, %o0
	ldsh	[%l7 + %o0],	%o7
	nop
	set	0x78, %l1
	lduw	[%l7 + %l1],	%i0
	nop
	set	0x1C, %o1
	stw	%l2,	[%l7 + %o1]
	set	0x50, %o3
	stda	%g6,	[%l7 + %o3] 0xeb
	membar	#Sync
	and	%o4,	%l0,	%i6
	ld	[%l7 + 0x18],	%f17
	set	0x30, %g5
	stwa	%g1,	[%l7 + %g5] 0x81
	nop
	set	0x7C, %l0
	stw	%i7,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	set	0x4C, %g4
	stwa	%o1,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xcc
	nop
	set	0x38, %i4
	std	%o6,	[%l7 + %i4]
	nop
	set	0x70, %l5
	std	%l4,	[%l7 + %l5]
	nop
	set	0x08, %o4
	ldsb	[%l7 + %o4],	%o0
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x68, %l4
	sth	%g4,	[%l7 + %l4]
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x89,	 3
	set	0x50, %g6
	stxa	%g5,	[%l7 + %g6] 0x81
	nop
	set	0x10, %g1
	stx	%o2,	[%l7 + %g1]
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f22
	set	0x40, %o7
	stda	%i0,	[%l7 + %o7] 0x89
	st	%f14,	[%l7 + 0x18]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%l1
	nop
	set	0x74, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x60, %o6
	std	%g6,	[%l7 + %o6]
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	nop
	setx	0xC89E6358F84738A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB29023F54AA5152D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f0,	%f6
	add	%o5,	%i4,	%l3
	nop
	set	0x4E, %i5
	ldstub	[%l7 + %i5],	%g2
	nop
	set	0x52, %o5
	ldsh	[%l7 + %o5],	%l6
	nop
	set	0x70, %i2
	std	%i2,	[%l7 + %i2]
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f0
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x81,	%o3
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%g2
	st	%f29,	[%l7 + 0x40]
	set	0x30, %g2
	sta	%f10,	[%l7 + %g2] 0x80
	set	0x40, %l3
	stxa	%o7,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x64, %o0
	stha	%l4,	[%l7 + %o0] 0x81
	or	%l2,	%g7,	%i0
	add	%l0,	%i6,	%g1
	set	0x4C, %g3
	swapa	[%l7 + %g3] 0x80,	%i7
	nop
	set	0x73, %o1
	ldstub	[%l7 + %o1],	%o1
	nop
	set	0x7A, %l1
	lduh	[%l7 + %l1],	%o4
	nop
	set	0x18, %g5
	std	%l4,	[%l7 + %g5]
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x80,	%o6
	add	%g4,	%o0,	%g5
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%o2
	nop
	set	0x20, %i3
	std	%f24,	[%l7 + %i3]
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%i2
	nop
	set	0x13, %i6
	ldub	[%l7 + %i6],	%i5
	set	0x70, %l5
	stda	%i0,	[%l7 + %l5] 0xe2
	membar	#Sync
	wr	%l1,	%o5,	%y
	nop
	set	0x4C, %o4
	ldsw	[%l7 + %o4],	%i4
	set	0x2C, %l4
	stwa	%l3,	[%l7 + %l4] 0x81
	set	0x54, %l2
	stha	%g6,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x68, %g6
	stx	%l6,	[%l7 + %g6]
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f0
	or	%g2,	%o3,	%i3
	nop
	set	0x0B, %i4
	stb	%g3,	[%l7 + %i4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
	set	0x69, %o7
	stba	%l4,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x34, %o6
	stw	%o7,	[%l7 + %o6]
	bne	%xcc,	loop_153
	nop
	set	0x39, %g7
	ldstub	[%l7 + %g7],	%g7
	add	%l2,	%l0,	%i0
	set	0x0D, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g1
loop_153:
	nop
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x80,	 4
	nop
	set	0x28, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x5C, %o5
	ldub	[%l7 + %o5],	%o1
	nop
	set	0x54, %l6
	swap	[%l7 + %l6],	%o4
	nop
	set	0x30, %i7
	std	%i6,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x6C, %g2
	stb	%o6,	[%l7 + %g2]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x89
	nop
	set	0x78, %o0
	stw	%g4,	[%l7 + %o0]
	set	0x48, %g3
	ldxa	[%l7 + %g3] 0x88,	%o0
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x1C],	%f9
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%o2
	set	0x48, %l3
	swapa	[%l7 + %l3] 0x80,	%i2
	and	%g5,	%i5,	%l1
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x88,	%i0
	set	0x28, %o3
	lda	[%l7 + %o3] 0x81,	%f22
	nop
	set	0x62, %i3
	ldsh	[%l7 + %i3],	%i4
	wr	%o5,	%l3,	%softint
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x89,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%o3
	set	0x18, %g4
	stda	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x24, %l5
	stb	%i3,	[%l7 + %l5]
	set	0x68, %i6
	stxa	%g3,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%o7
	ba,a,pt	%icc,	loop_154
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%g7
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x81,	%l4
loop_154:
	nop
	set	0x2B, %l2
	ldsb	[%l7 + %l2],	%l0
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%l2
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%i0
	set	0x39, %i0
	stba	%g1,	[%l7 + %i0] 0x89
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc0
	nop
	set	0x0F, %g7
	ldub	[%l7 + %g7],	%o1
	set	0x7C, %o6
	stwa	%o4,	[%l7 + %o6] 0x81
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%i7
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x81,	%g4
	st	%f18,	[%l7 + 0x1C]
	set	0x28, %o5
	swapa	[%l7 + %o5] 0x88,	%o0
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x81,	 2
	nop
	set	0x10, %l6
	stb	%l5,	[%l7 + %l6]
	nop
	set	0x28, %g2
	std	%o2,	[%l7 + %g2]
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x80,	%g4
	and	%i2,	%l1,	%i5
	set	0x48, %o2
	stxa	%i4,	[%l7 + %o2] 0x80
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f24
	nop
	set	0x38, %o1
	stw	%o5,	[%l7 + %o1]
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%l2
	nop
	set	0x08, %g3
	std	%i0,	[%l7 + %g3]
	nop
	set	0x74, %l3
	ldub	[%l7 + %l3],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%o3
	fpsub32s	%f9,	%f29,	%f27
	set	0x32, %o3
	stha	%i3,	[%l7 + %o3] 0x81
	nop
	set	0x28, %g5
	stw	%g3,	[%l7 + %g5]
	nop
	set	0x4D, %i3
	ldstub	[%l7 + %i3],	%l6
	bg	%icc,	loop_155
	nop
	set	0x1C, %l0
	lduh	[%l7 + %l0],	%o7
	nop
	set	0x1D, %g4
	ldsb	[%l7 + %g4],	%l4
	set	0x78, %l5
	stba	%g7,	[%l7 + %l5] 0xe2
	membar	#Sync
loop_155:
	nop
	set	0x19, %i6
	stb	%l2,	[%l7 + %i6]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf1
	membar	#Sync
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xcc
	set	0x47, %g6
	stba	%i0,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x08, %i4
	std	%f4,	[%l7 + %i4]
	nop
	set	0x40, %l2
	ldsh	[%l7 + %l2],	%g1
	nop
	set	0x58, %i0
	stx	%o1,	[%l7 + %i0]
	ld	[%l7 + 0x60],	%f19
	set	0x18, %o7
	stxa	%o4,	[%l7 + %o7] 0x81
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x80,	 1
	nop
	set	0x20, %o6
	std	%i6,	[%l7 + %o6]
	and	%l0,	%o0,	%g4
	set	0x52, %i5
	ldstuba	[%l7 + %i5] 0x88,	%o6
	or	%o2,	%g5,	%i2
	nop
	set	0x76, %g1
	lduh	[%l7 + %g1],	%l5
	nop
	set	0x30, %i2
	std	%l0,	[%l7 + %i2]
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f30
	set	0x28, %o5
	stwa	%i5,	[%l7 + %o5] 0x88
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f0
	fpsub32s	%f20,	%f13,	%f1
	set	0x25, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%i1
	nop
	set	0x74, %o2
	stw	%l3,	[%l7 + %o2]
	add	%g2,	%o3,	%i3
	nop
	set	0x67, %o0
	ldsb	[%l7 + %o0],	%g6
	nop
	set	0x28, %o1
	ldsb	[%l7 + %o1],	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o7
	set	0x51, %l1
	stba	%l4,	[%l7 + %l1] 0xe2
	membar	#Sync
	and	%g7,	%l2,	%i0
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f24
	st	%fsr,	[%l7 + 0x64]
	set	0x68, %g3
	stda	%o0,	[%l7 + %g3] 0x81
	set	0x28, %l3
	stxa	%g1,	[%l7 + %l3] 0x89
	set	0x47, %o3
	stba	%o4,	[%l7 + %o3] 0x80
	set	0x16, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i6
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%l0
	set	0x2E, %l0
	stha	%o0,	[%l7 + %l0] 0x81
	set	0x76, %l5
	stba	%g4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x68, %i6
	stx	%o6,	[%l7 + %i6]
	nop
	set	0x50, %o4
	stx	%i7,	[%l7 + %o4]
	nop
	set	0x4A, %g4
	ldub	[%l7 + %g4],	%o2
	wr	%i2,	%l5,	%pic
	nop
	set	0x16, %g6
	stb	%l1,	[%l7 + %g6]
	or	%g5,	%i4,	%i5
	nop
	set	0x38, %l4
	std	%f20,	[%l7 + %l4]
	nop
	set	0x38, %l2
	ldsh	[%l7 + %l2],	%o5
	nop
	set	0x77, %i4
	ldsb	[%l7 + %i4],	%l3
	nop
	set	0x64, %i0
	lduw	[%l7 + %i0],	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g2
	set	0x79, %o7
	stba	%g6,	[%l7 + %o7] 0x88
	nop
	set	0x3E, %g7
	stb	%g3,	[%l7 + %g7]
	st	%f2,	[%l7 + 0x10]
	nop
	set	0x38, %i5
	stx	%i3,	[%l7 + %i5]
	ld	[%l7 + 0x40],	%f6
	nop
	set	0x58, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x10, %o6
	sta	%f23,	[%l7 + %o6] 0x81
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x80
	nop
	set	0x6C, %o5
	sth	%o7,	[%l7 + %o5]
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x38, %l6
	swapa	[%l7 + %l6] 0x80,	%l6
	or	%l4,	%g7,	%l2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f0
	and	%o1,	%i0,	%g1
	set	0x60, %g2
	stwa	%i6,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x54, %o1
	ldsb	[%l7 + %o1],	%o4
	nop
	set	0x38, %l1
	ldsw	[%l7 + %l1],	%o0
	nop
	set	0x60, %i7
	lduw	[%l7 + %i7],	%g4
	set	0x60, %g3
	stxa	%o6,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x40, %l3
	stda	%l0,	[%l7 + %l3] 0xeb
	membar	#Sync
	or	%i7,	%o2,	%i2
	nop
	set	0x70, %o0
	std	%f28,	[%l7 + %o0]
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%l5
	nop
	set	0x40, %i3
	stx	%l1,	[%l7 + %i3]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf1
	membar	#Sync
	nop
	set	0x3E, %g5
	ldsh	[%l7 + %g5],	%i4
	nop
	set	0x18, %i6
	std	%f18,	[%l7 + %i6]
	or	%i5,	%g5,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%l3
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x80,	%o3
	nop
	set	0x70, %g4
	std	%f2,	[%l7 + %g4]
	nop
	set	0x50, %l5
	stw	%g6,	[%l7 + %l5]
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x89,	%g2
	add	%g3,	%o7,	%i3
	nop
	set	0x50, %l4
	std	%i6,	[%l7 + %l4]
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x81,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	st	%fsr,	[%l7 + 0x74]
	set	0x10, %i0
	stxa	%i0,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x50, %l2
	stxa	%g1,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x30, %o7
	lda	[%l7 + %o7] 0x80,	%f14
	fpadd32	%f26,	%f16,	%f14
	set	0x60, %i5
	stwa	%i6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x2C, %g1
	sth	%o1,	[%l7 + %g1]
	nop
	nop
	setx	0x1128074B6F4383A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE29BEBD2E2AAD2CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f24
	set	0x64, %o6
	stba	%o0,	[%l7 + %o6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x0C]
	or	%g4,	%o4,	%l0
	nop
	set	0x40, %g7
	stx	%i7,	[%l7 + %g7]
	set	0x65, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o2
	nop
	set	0x74, %o5
	stw	%i2,	[%l7 + %o5]
	nop
	set	0x17, %l6
	ldstub	[%l7 + %l6],	%l5
	nop
	set	0x28, %i1
	std	%o6,	[%l7 + %i1]
	bl,pt	%xcc,	loop_156
	nop
	set	0x08, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%l0
	set	0x24, %l1
	stwa	%i4,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_156:
	nop
	set	0x28, %i7
	stxa	%i5,	[%l7 + %i7] 0x81
	nop
	set	0x74, %g3
	sth	%g5,	[%l7 + %g3]
	wr	%o5,	%l3,	%softint
	ld	[%l7 + 0x14],	%f7
	nop
	set	0x38, %g2
	prefetch	[%l7 + %g2],	 1
	and	%i1,	%g6,	%o3
	set	0x6C, %o0
	sta	%f30,	[%l7 + %o0] 0x81
	set	0x22, %o3
	stha	%g3,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%g2
	set	0x48, %l3
	stxa	%o7,	[%l7 + %l3] 0x80
	nop
	set	0x30, %g5
	stx	%i3,	[%l7 + %g5]
	nop
	set	0x30, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%g7,	%l6,	%l2
	set	0x7E, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i0
	set	0x44, %l0
	lda	[%l7 + %l0] 0x89,	%f11
	set	0x18, %l5
	stxa	%g1,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x68, %g6
	std	%l4,	[%l7 + %g6]
	set	0x50, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i6
	be,pn	%icc,	loop_157
	nop
	set	0x08, %i4
	prefetch	[%l7 + %i4],	 1
	set	0x2C, %l4
	stha	%o0,	[%l7 + %l4] 0xeb
	membar	#Sync
loop_157:
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%g4
	fpsub32s	%f0,	%f8,	%f5
	fpadd32	%f2,	%f26,	%f6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%o1
	nop
	set	0x38, %o7
	std	%f0,	[%l7 + %o7]
	nop
	set	0x60, %i0
	lduw	[%l7 + %i0],	%i7
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x88,	%l0
	set	0x68, %o6
	stda	%i2,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x81
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%o2
	nop
	set	0x60, %g7
	std	%f6,	[%l7 + %g7]
	set	0x10, %l6
	stxa	%l5,	[%l7 + %l6] 0x89
	nop
	set	0x74, %o5
	ldsw	[%l7 + %o5],	%o6
	set	0x60, %i1
	stwa	%i4,	[%l7 + %i1] 0x89
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x68, %l1
	stxa	%i5,	[%l7 + %l1] 0x80
	ble	%icc,	loop_158
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%g5
	or	%o5,	%l1,	%l3
	set	0x18, %i7
	stwa	%g6,	[%l7 + %i7] 0xeb
	membar	#Sync
loop_158:
	nop
	set	0x40, %g3
	sth	%i1,	[%l7 + %g3]
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x88,	%g3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f16
	ld	[%l7 + 0x30],	%f4
	nop
	set	0x0C, %g2
	ldsw	[%l7 + %g2],	%o3
	set	0x54, %i3
	sta	%f23,	[%l7 + %i3] 0x88
	set	0x20, %g5
	stxa	%o7,	[%l7 + %g5] 0x80
	set	0x50, %i6
	stxa	%i3,	[%l7 + %i6] 0x81
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	fpadd32	%f28,	%f26,	%f26
	set	0x34, %l3
	stwa	%l6,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x66, %l0
	lduh	[%l7 + %l0],	%l2
	set	0x68, %g6
	stxa	%i0,	[%l7 + %g6] 0xeb
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%g1
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	set	0x42, %i4
	stba	%o0,	[%l7 + %i4] 0x81
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xe3,	%i6
	set	0x14, %l2
	sta	%f2,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x64],	%f0
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf1
	membar	#Sync
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x30, %i0
	stx	%o4,	[%l7 + %i0]
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%o1
	set	0x10, %i5
	lda	[%l7 + %i5] 0x89,	%f6
	set	0x40, %i2
	stda	%i6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x6C, %g1
	sta	%f4,	[%l7 + %g1] 0x80
	nop
	set	0x2C, %g7
	stw	%g4,	[%l7 + %g7]
	set	0x74, %o5
	stwa	%l0,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x58, %l6
	stwa	%i2,	[%l7 + %l6] 0xeb
	membar	#Sync
	and	%o2,	%o6,	%l5
	set	0x18, %i1
	lda	[%l7 + %i1] 0x81,	%f21
	wr	%i4,	%g5,	%softint
	nop
	set	0x68, %l1
	lduh	[%l7 + %l1],	%i5
	st	%f11,	[%l7 + 0x4C]
	add	%l1,	%l3,	%o5
	nop
	set	0x58, %o2
	ldsw	[%l7 + %o2],	%i1
	or	%g6,	%o3,	%o7
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%g2
	set	0x18, %i7
	swapa	[%l7 + %i7] 0x88,	%g7
	set	0x72, %o0
	stha	%l6,	[%l7 + %o0] 0x88
	nop
	set	0x4C, %g3
	lduw	[%l7 + %g3],	%i3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	nop
	set	0x40, %o3
	stx	%l2,	[%l7 + %o3]
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x88,	%g2
	nop
	set	0x1E, %i3
	sth	%i0,	[%l7 + %i3]
	set	0x40, %o4
	stwa	%g1,	[%l7 + %o4] 0x89
	nop
	set	0x58, %l3
	std	%l4,	[%l7 + %l3]
	nop
	set	0x14, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x38, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x88,	%i6
	set	0x44, %i4
	stba	%o4,	[%l7 + %i4] 0x81
	fpsub32s	%f19,	%f27,	%f19
	nop
	set	0x60, %g4
	std	%f18,	[%l7 + %g4]
	bgu,a,pn	%icc,	loop_159
	nop
	set	0x18, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x08, %o7
	lduw	[%l7 + %o7],	%i7
	nop
	set	0x68, %l4
	std	%o0,	[%l7 + %l4]
loop_159:
	or	%g4,	%i2,	%l0
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%o6
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc2
	nop
	set	0x58, %i5
	std	%f16,	[%l7 + %i5]
	nop
	set	0x78, %i2
	std	%f12,	[%l7 + %i2]
	nop
	set	0x4A, %o6
	ldsb	[%l7 + %o6],	%l5
	bl	%xcc,	loop_160
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%o2
	nop
	set	0x1C, %g7
	stb	%i4,	[%l7 + %g7]
	nop
	set	0x4C, %o5
	prefetch	[%l7 + %o5],	 4
loop_160:
	nop
	set	0x6F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i5
	st	%f19,	[%l7 + 0x68]
	set	0x10, %l1
	stxa	%l1,	[%l7 + %l1] 0x80
	nop
	set	0x64, %o2
	ldsb	[%l7 + %o2],	%g5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%i1
	nop
	set	0x70, %i1
	lduh	[%l7 + %i1],	%g6
	st	%fsr,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x64]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f0
	set	0x30, %g3
	swapa	[%l7 + %g3] 0x81,	%o3
	add	%o5,	%g3,	%o7
	fpsub32	%f2,	%f30,	%f8
	set	0x6A, %g2
	stba	%l6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x40, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x20, %g5
	std	%f30,	[%l7 + %g5]
	nop
	set	0x65, %o3
	ldub	[%l7 + %o3],	%g7
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf9
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%g2
	nop
	set	0x60, %l3
	std	%i2,	[%l7 + %l3]
	set	0x57, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i0
	nop
	set	0x78, %i6
	stb	%g1,	[%l7 + %i6]
	set	0x60, %l5
	stxa	%o0,	[%l7 + %l5] 0xea
	membar	#Sync
	or	%l4,	%o4,	%i7
	nop
	set	0x48, %l0
	std	%o0,	[%l7 + %l0]
	set	0x50, %i4
	stxa	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x7E, %l2
	ldsh	[%l7 + %l2],	%g4
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%l0
	set	0x38, %l4
	swapa	[%l7 + %l4] 0x88,	%o6
	and	%i2,	%o2,	%i4
	or	%i5,	%l5,	%l1
	set	0x28, %g6
	stwa	%l3,	[%l7 + %g6] 0x88
	set	0x30, %i0
	stwa	%g5,	[%l7 + %i0] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x48, %i5
	prefetch	[%l7 + %i5],	 0
	or	%g6,	%o3,	%o5
	set	0x64, %o7
	stba	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x6D, %i2
	ldstub	[%l7 + %i2],	%g3
	nop
	set	0x68, %g1
	std	%o6,	[%l7 + %g1]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x80,	%i6
	nop
	set	0x0B, %o5
	stb	%l2,	[%l7 + %o5]
	and	%g7,	%g2,	%i0
	and	%g1,	%o0,	%l4
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	fpadd32	%f14,	%f28,	%f0
	nop
	set	0x40, %l1
	std	%f20,	[%l7 + %l1]
	fpsub16	%f8,	%f0,	%f14
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x80,	%o4
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x2C, %o1
	swap	[%l7 + %o1],	%i3
	nop
	set	0x24, %i1
	swap	[%l7 + %i1],	%o1
	nop
	set	0x52, %o2
	ldsh	[%l7 + %o2],	%i6
	nop
	set	0x28, %g3
	lduh	[%l7 + %g3],	%i7
	set	0x10, %o0
	stda	%l0,	[%l7 + %o0] 0x88
	and	%o6,	%i2,	%g4
	wr	%o2,	%i5,	%softint
	set	0x0C, %g2
	stba	%i4,	[%l7 + %g2] 0x88
	nop
	set	0x54, %g5
	ldub	[%l7 + %g5],	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%g5
	nop
	set	0x4C, %i7
	swap	[%l7 + %i7],	%g6
	add	%o3,	%o5,	%i1
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x24, %o3
	stw	%l3,	[%l7 + %o3]
	set	0x18, %l3
	stda	%g2,	[%l7 + %l3] 0x88
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f12
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x89,	%i6
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f14
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%g7
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd2
	set	0x2C, %i4
	sta	%f18,	[%l7 + %i4] 0x89
	nop
	set	0x72, %l0
	ldsh	[%l7 + %l0],	%g2
	or	%l2,	%i0,	%o0
	set	0x14, %g4
	lda	[%l7 + %g4] 0x89,	%f19
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x20, %l4
	stwa	%i3,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x20, %l2
	lduh	[%l7 + %l2],	%o1
	nop
	set	0x5C, %g6
	ldub	[%l7 + %g6],	%i6
	nop
	set	0x75, %i0
	ldsb	[%l7 + %i0],	%g1
	set	0x5D, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i7
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f8
	nop
	set	0x18, %g1
	stb	%o6,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%i2
	bge,a	%xcc,	loop_161
	st	%f0,	[%l7 + 0x50]
	add	%g4,	%l0,	%o2
	nop
	set	0x57, %g7
	ldstub	[%l7 + %g7],	%i4
loop_161:
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%i5
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	set	0x08, %o6
	stda	%l4,	[%l7 + %o6] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l1
	st	%f13,	[%l7 + 0x34]
	nop
	set	0x1C, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%g6
	fpadd16	%f30,	%f2,	%f26
	nop
	set	0x57, %o2
	stb	%o5,	[%l7 + %o2]
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x80,	%i0
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	nop
	set	0x48, %g2
	stw	%o3,	[%l7 + %g2]
	nop
	set	0x72, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x36, %o0
	ldstub	[%l7 + %o0],	%l6
	fpsub16	%f26,	%f14,	%f16
	nop
	set	0x59, %o3
	ldsb	[%l7 + %o3],	%l3
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x89,	%o7
	set	0x40, %i3
	stwa	%g2,	[%l7 + %i3] 0x88
	st	%f10,	[%l7 + 0x40]
	nop
	set	0x38, %i7
	std	%f0,	[%l7 + %i7]
	nop
	set	0x40, %l5
	lduh	[%l7 + %l5],	%l2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%i0
	set	0x24, %o4
	stwa	%l4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x58, %i4
	stxa	%o4,	[%l7 + %i4] 0xe3
	membar	#Sync
	wr	%o0,	%o1,	%clear_softint
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f16
	nop
	set	0x0C, %l0
	stb	%i6,	[%l7 + %l0]
	set	0x70, %g4
	stda	%g0,	[%l7 + %g4] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i7
	nop
	set	0x68, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x10, %l4
	prefetch	[%l7 + %l4],	 4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%o6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f16
	st	%f3,	[%l7 + 0x7C]
	set	0x58, %i0
	stda	%g4,	[%l7 + %i0] 0x81
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%o2
	add	%l0,	%i4,	%l5
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xca
	ld	[%l7 + 0x70],	%f12
	nop
	set	0x28, %g1
	stx	%i5,	[%l7 + %g1]
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x81,	%g5
	set	0x40, %l6
	sta	%f21,	[%l7 + %l6] 0x89
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%l0
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%o5
	fpsub16s	%f25,	%f13,	%f25
	st	%f12,	[%l7 + 0x14]
	nop
	set	0x46, %g7
	sth	%i1,	[%l7 + %g7]
	nop
	set	0x28, %l1
	stx	%o3,	[%l7 + %l1]
	set	0x77, %g3
	stba	%g6,	[%l7 + %g3] 0x89
	fpadd16s	%f10,	%f8,	%f0
	nop
	set	0x40, %i1
	stx	%g3,	[%l7 + %i1]
	nop
	set	0x15, %o2
	stb	%l6,	[%l7 + %o2]
	set	0x18, %g2
	stha	%l3,	[%l7 + %g2] 0x89
	set	0x0C, %g5
	lda	[%l7 + %g5] 0x88,	%f22
	bl,pt	%icc,	loop_162
	st	%fsr,	[%l7 + 0x34]
	set	0x18, %o3
	stba	%o7,	[%l7 + %o3] 0x80
loop_162:
	nop
	set	0x34, %o0
	sta	%f22,	[%l7 + %o0] 0x81
	nop
	set	0x4C, %l3
	swap	[%l7 + %l3],	%g2
	fpsub16s	%f14,	%f25,	%f19
	nop
	set	0x28, %i7
	ldsh	[%l7 + %i7],	%l2
	fpadd16s	%f25,	%f10,	%f2
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%i0
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x88,	 0
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x80,	%l4
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%o0
	set	0x54, %l0
	lda	[%l7 + %l0] 0x89,	%f15
	nop
	set	0x42, %i6
	stb	%o1,	[%l7 + %i6]
	nop
	set	0x14, %l2
	ldsw	[%l7 + %l2],	%i6
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%o4
	nop
	set	0x1B, %g6
	ldstub	[%l7 + %g6],	%g1
	nop
	set	0x21, %l4
	ldub	[%l7 + %l4],	%i7
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f0
	set	0x44, %i2
	sta	%f8,	[%l7 + %i2] 0x81
	nop
	set	0x0C, %i5
	lduh	[%l7 + %i5],	%i2
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x89,	%i3
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x89,	 1
	nop
	set	0x78, %o7
	stx	%o2,	[%l7 + %o7]
	set	0x24, %o6
	stwa	%l0,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x30, %l6
	ldx	[%l7 + %l6],	%o6
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%l5
	nop
	set	0x7C, %g7
	stw	%i4,	[%l7 + %g7]
	nop
	set	0x4C, %g3
	stw	%i5,	[%l7 + %g3]
	set	0x0B, %l1
	stba	%g5,	[%l7 + %l1] 0x89
	set	0x7C, %i1
	sta	%f11,	[%l7 + %i1] 0x81
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x81,	%l0
	nop
	set	0x1E, %o2
	ldsb	[%l7 + %o2],	%i1
	nop
	set	0x5E, %o3
	lduh	[%l7 + %o3],	%o5
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x81,	%g6
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x81,	%g3
	nop
	set	0x18, %i7
	ldx	[%l7 + %i7],	%l6
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%l2
	set	0x68, %l3
	sta	%f31,	[%l7 + %l3] 0x81
	nop
	set	0x6C, %i4
	swap	[%l7 + %i4],	%o7
	bgu,pn	%icc,	loop_163
	bn,a	%icc,	loop_164
	nop
	set	0x70, %i3
	ldsh	[%l7 + %i3],	%g2
	st	%f16,	[%l7 + 0x3C]
loop_163:
	nop
	set	0x31, %l0
	stb	%l2,	[%l7 + %l0]
loop_164:
	or	%i0,	%g7,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%o1
	nop
	set	0x14, %i6
	stb	%o3,	[%l7 + %i6]
	fpsub32	%f16,	%f18,	%f6
	set	0x6C, %o4
	sta	%f2,	[%l7 + %o4] 0x81
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xca
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xcc
	st	%f10,	[%l7 + 0x24]
	nop
	set	0x11, %g4
	ldsb	[%l7 + %g4],	%o4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
	add	%i6,	%i7,	%g1
	nop
	set	0x2E, %l4
	lduh	[%l7 + %l4],	%i3
	set	0x68, %i5
	lda	[%l7 + %i5] 0x89,	%f23
	nop
	set	0x7E, %g1
	sth	%g4,	[%l7 + %g1]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f16
	nop
	set	0x5C, %o6
	lduh	[%l7 + %o6],	%o2
	and	%l0,	%i2,	%o6
	or	%i4,	%i5,	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%l5
	nop
	set	0x31, %l6
	ldub	[%l7 + %l6],	%o5
	nop
	set	0x50, %o1
	std	%f18,	[%l7 + %o1]
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%g3
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f26
	nop
	set	0x0C, %l1
	ldsw	[%l7 + %l1],	%i1
	nop
	set	0x76, %g7
	ldub	[%l7 + %g7],	%l6
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%l3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%l2
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	nop
	set	0x0C, %g2
	ldsb	[%l7 + %g2],	%o7
	nop
	set	0x20, %o3
	prefetch	[%l7 + %o3],	 1
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe3,	%g6
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	nop
	set	0x64, %l5
	ldsh	[%l7 + %l5],	%l4
	nop
	set	0x78, %l3
	swap	[%l7 + %l3],	%o0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x8D5, 	%tick_cmpr
	set	0x30, %i4
	stxa	%o4,	[%l7 + %i4] 0x81
	nop
	set	0x16, %i3
	ldstub	[%l7 + %i3],	%i7
	and	%i6,	%i3,	%g4
	nop
	set	0x50, %i7
	std	%g0,	[%l7 + %i7]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%l0
	set	0x28, %l0
	stxa	%o2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x7A, %l2
	ldub	[%l7 + %l2],	%i2
	nop
	set	0x10, %o4
	stx	%o6,	[%l7 + %o4]
	nop
	set	0x79, %g4
	stb	%i5,	[%l7 + %g4]
	nop
	set	0x31, %g6
	ldub	[%l7 + %g6],	%g5
	set	0x38, %i0
	stwa	%i4,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x1C, %l4
	swapa	[%l7 + %l4] 0x89,	%l1
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l5
	nop
	set	0x58, %g1
	std	%o4,	[%l7 + %g1]
	bn,pt	%icc,	loop_165
	bne,a,pt	%xcc,	loop_166
	nop
	set	0x40, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%g6
loop_165:
	nop
	set	0x7C, %l6
	swap	[%l7 + %l6],	%g3
loop_166:
	bgu	%icc,	loop_167
	and	%i1,	%l3,	%l6
	nop
	set	0x34, %o1
	lduw	[%l7 + %o1],	%l2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%o7
loop_167:
	nop
	set	0x78, %i2
	stda	%g2,	[%l7 + %i2] 0x81
	ba,a,pt	%xcc,	loop_168
	nop
	set	0x30, %g3
	lduh	[%l7 + %g3],	%l4
	nop
	set	0x36, %o7
	ldsb	[%l7 + %o7],	%g7
	and	%o0,	%o3,	%o1
loop_168:
	nop
	set	0x0C, %l1
	stw	%o4,	[%l7 + %l1]
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x88,	 3
	set	0x24, %i1
	stba	%i7,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x60, %g2
	sta	%f1,	[%l7 + %g2] 0x88
	nop
	set	0x48, %o2
	stx	%g4,	[%l7 + %o2]
	nop
	set	0x32, %o3
	stb	%g1,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x70]
	set	0x48, %g5
	stwa	%l0,	[%l7 + %g5] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%i3
	fpsub32s	%f30,	%f9,	%f24
	nop
	set	0x14, %o0
	ldsw	[%l7 + %o0],	%i5
	set	0x53, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i4
	nop
	set	0x40, %i4
	sth	%l1,	[%l7 + %i4]
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x89,	%f31
	or	%l5,	%g5,	%g6
	nop
	set	0x50, %i7
	ldstub	[%l7 + %i7],	%g3
	add	%i1,	%l3,	%l6
	and	%o5,	%l2,	%i0
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x88,	%g2
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%o7
	set	0x20, %l2
	stda	%g6,	[%l7 + %l2] 0x88
	nop
	set	0x78, %i6
	std	%l4,	[%l7 + %i6]
	nop
	set	0x50, %o4
	lduh	[%l7 + %o4],	%o0
	or	%o1,	%o3,	%o4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf8
	membar	#Sync
	or	%i6,	%i7,	%g4
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x81,	%g1
	bn,pn	%xcc,	loop_169
	st	%f15,	[%l7 + 0x14]
	nop
	set	0x20, %i0
	std	%l0,	[%l7 + %i0]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%o6
loop_169:
	nop
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xda
	nop
	set	0x6C, %g1
	swap	[%l7 + %g1],	%i2
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%i4
	nop
	set	0x5D, %o5
	ldub	[%l7 + %o5],	%i4
	set	0x5B, %l6
	stba	%l1,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x40, %o6
	stda	%i2,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x44, %i2
	swapa	[%l7 + %i2] 0x81,	%g5
	and	%g6,	%g3,	%i1
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%l2
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%l6
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x89,	%l5
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x89,	%l2
	nop
	set	0x16, %l1
	lduh	[%l7 + %l1],	%i0
	nop
	set	0x20, %g2
	stw	%o5,	[%l7 + %g2]
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x89,	%o7
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o0
	nop
	set	0x18, %i1
	stw	%o1,	[%l7 + %i1]
	nop
	set	0x78, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x49, %g5
	ldsb	[%l7 + %g5],	%o3
	set	0x68, %i4
	stda	%g2,	[%l7 + %i4] 0x89
	nop
	set	0x2E, %l3
	lduh	[%l7 + %l3],	%o4
	nop
	set	0x48, %i7
	stx	%i7,	[%l7 + %i7]
	nop
	set	0x58, %i3
	stx	%i6,	[%l7 + %i3]
	nop
	set	0x78, %l0
	lduh	[%l7 + %l0],	%g4
	nop
	set	0x71, %l5
	ldstub	[%l7 + %l5],	%g1
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x80,	%o2
	set	0x0E, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o6
	or	%l0,	%i5,	%i4
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x20, %g6
	stda	%i2,	[%l7 + %g6] 0x89
	set	0x38, %i0
	stwa	%i3,	[%l7 + %i0] 0x80
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%g4
	set	0x7D, %g4
	stba	%l1,	[%l7 + %g4] 0x81
	nop
	nop
	setx	0x14D8696D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x11CDAB79,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f8,	%f3
	nop
	set	0x08, %g1
	lduh	[%l7 + %g1],	%g3
	nop
	set	0x4C, %o5
	lduh	[%l7 + %o5],	%g6
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe3,	%i0
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%l2
	wr	%l5,	%l6,	%ccr
	set	0x50, %i2
	stda	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x38, %o1
	std	%f2,	[%l7 + %o1]
	and	%l2,	%o5,	%o7
	nop
	nop
	setx	0x426CF398,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x800E5A95,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f10,	%f17
	and	%g7,	%l4,	%o1
	nop
	set	0x34, %i5
	swap	[%l7 + %i5],	%o3
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	nop
	set	0x08, %g3
	std	%f6,	[%l7 + %g3]
	nop
	set	0x6E, %g7
	lduh	[%l7 + %g7],	%g2
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x81,	%o0
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x80,	 2
	set	0x6C, %o2
	lda	[%l7 + %o2] 0x81,	%f14
	st	%fsr,	[%l7 + 0x2C]
	ble,a	%xcc,	loop_170
	nop
	nop
	setx	0xDB4666AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x90814547,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f22,	%f20
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
loop_170:
	nop
	set	0x10, %o0
	stda	%i6,	[%l7 + %o0] 0x80
	nop
	set	0x30, %o3
	std	%f30,	[%l7 + %o3]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7C7, 	%sys_tick_cmpr
	set	0x38, %i4
	stba	%g1,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x38, %l3
	std	%f16,	[%l7 + %l3]
	set	0x18, %g5
	stxa	%o6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f24
	set	0x08, %i7
	stha	%l0,	[%l7 + %i7] 0x81
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x80,	%i5
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x48, %i6
	ldsw	[%l7 + %i6],	%i4
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x80,	%o2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f16
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x80,	%i2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%g4
	set	0x69, %g4
	stba	%i3,	[%l7 + %g4] 0x80
	nop
	set	0x48, %g1
	lduw	[%l7 + %g1],	%g3
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%f26
	nop
	set	0x3E, %o5
	ldsb	[%l7 + %o5],	%l1
	and	%i1,	%l3,	%l5
	nop
	set	0x58, %l6
	std	%g6,	[%l7 + %l6]
	nop
	set	0x58, %o6
	ldx	[%l7 + %o6],	%i0
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x0A, %i5
	lduh	[%l7 + %i5],	%l2
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%o5
	fpsub16s	%f28,	%f14,	%f8
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	nop
	set	0x40, %g7
	sth	%l6,	[%l7 + %g7]
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x89,	%g6
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%l4
	set	0x40, %g2
	lda	[%l7 + %g2] 0x81,	%f26
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x89,	%o7
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%o1
	nop
	set	0x24, %o2
	ldsw	[%l7 + %o2],	%o3
	set	0x56, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g2
	nop
	set	0x20, %l3
	ldub	[%l7 + %l3],	%o0
	set	0x28, %g5
	stxa	%i6,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x52, %i3
	ldub	[%l7 + %i3],	%g4
	add	%o4,	%g1,	%i7
	nop
	set	0x38, %i7
	std	%o6,	[%l7 + %i7]
	nop
	set	0x28, %l5
	swap	[%l7 + %l5],	%l0
	nop
	set	0x69, %i4
	ldstub	[%l7 + %i4],	%i4
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x80,	%i5
	bgu,a	%xcc,	loop_171
	ld	[%l7 + 0x10],	%f12
	nop
	set	0x3C, %o4
	sth	%o2,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x08]
loop_171:
	add	%i2,	%i3,	%g3
	add	%g5,	%l1,	%i1
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	or	%l5,	%i0,	%l2
	set	0x64, %g6
	lda	[%l7 + %g6] 0x89,	%f4
	add	%g6,	%o5,	%l6
	set	0x5C, %i0
	sta	%f25,	[%l7 + %i0] 0x88
	nop
	set	0x38, %l2
	std	%g6,	[%l7 + %l2]
	nop
	set	0x21, %g4
	stb	%o7,	[%l7 + %g4]
	nop
	set	0x2C, %l4
	lduw	[%l7 + %l4],	%l4
	bne	%icc,	loop_172
	nop
	set	0x58, %o5
	sth	%o3,	[%l7 + %o5]
	nop
	set	0x70, %l6
	swap	[%l7 + %l6],	%g2
	nop
	set	0x4F, %o6
	ldub	[%l7 + %o6],	%o0
loop_172:
	nop
	set	0x3C, %o1
	swapa	[%l7 + %o1] 0x81,	%o1
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%i6
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%o4
	set	0x5C, %g1
	lda	[%l7 + %g1] 0x80,	%f1
	or	%g4,	%i7,	%o6
	nop
	set	0x14, %g7
	lduh	[%l7 + %g7],	%g1
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%i4
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe3,	%i4
	nop
	set	0x24, %g3
	lduh	[%l7 + %g3],	%o2
	nop
	set	0x60, %g2
	ldsw	[%l7 + %g2],	%l0
	set	0x3C, %i1
	stha	%i2,	[%l7 + %i1] 0x88
	nop
	set	0x20, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x78, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i3
	or	%g3,	%l1,	%i1
	fpadd16	%f22,	%f14,	%f20
	set	0x7C, %l3
	swapa	[%l7 + %l3] 0x89,	%g5
	nop
	set	0x0D, %o3
	stb	%l3,	[%l7 + %o3]
	set	0x48, %g5
	stda	%l4,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x10, %i3
	std	%f2,	[%l7 + %i3]
	set	0x40, %i7
	stda	%i0,	[%l7 + %i7] 0x81
	add	%l2,	%g6,	%o5
	set	0x40, %l5
	sta	%f2,	[%l7 + %l5] 0x80
	nop
	set	0x52, %i6
	sth	%l6,	[%l7 + %i6]
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%g7
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%o3
	and	%g2,	%o1,	%i6
	set	0x19, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o0
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%f20
	nop
	set	0x68, %g6
	swap	[%l7 + %g6],	%g4
	set	0x50, %l2
	stxa	%i7,	[%l7 + %l2] 0x81
	nop
	set	0x48, %g4
	stx	%o4,	[%l7 + %g4]
	or	%o6,	%i4,	%i5
	set	0x14, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g1
	ld	[%l7 + 0x2C],	%f30
	set	0x20, %o5
	stha	%o2,	[%l7 + %o5] 0x81
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x88
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%i2
	set	0x46, %i5
	stha	%l0,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x58, %l6
	sta	%f22,	[%l7 + %l6] 0x89
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xd0
	set	0x6C, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i3
	set	0x25, %g1
	stba	%g3,	[%l7 + %g1] 0x81
	nop
	set	0x10, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x7C, %l1
	ldsw	[%l7 + %l1],	%i1
	nop
	set	0x10, %g2
	std	%l0,	[%l7 + %g2]
	nop
	set	0x34, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x88,	 3
	nop
	set	0x78, %o2
	stx	%fsr,	[%l7 + %o2]
	add	%g5,	%i0,	%l2
	nop
	set	0x3E, %l3
	ldsh	[%l7 + %l3],	%g6
	nop
	set	0x08, %o3
	stx	%o5,	[%l7 + %o3]
	add	%l6,	%g7,	%l5
	nop
	set	0x38, %g5
	prefetch	[%l7 + %g5],	 3
	and	%o7,	%o3,	%l4
	nop
	set	0x48, %i1
	std	%o0,	[%l7 + %i1]
	ld	[%l7 + 0x6C],	%f21
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x88,	%i6
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%o0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
	or	%g2,	%i7,	%o4
	nop
	set	0x30, %i6
	ldsh	[%l7 + %i6],	%o6
	nop
	set	0x25, %o4
	stb	%g4,	[%l7 + %o4]
	nop
	set	0x0C, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x30, %i0
	ldsw	[%l7 + %i0],	%i5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x011, 	%tick_cmpr
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f28
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x88,	%i2
	and	%i4,	%l0,	%i3
	fpadd16	%f20,	%f16,	%f6
	nop
	set	0x6C, %l2
	lduh	[%l7 + %l2],	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%l1
	fpsub32	%f22,	%f6,	%f24
	st	%fsr,	[%l7 + 0x1C]
	set	0x1B, %l4
	stba	%l3,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x67, %o5
	stba	%g5,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f12
	set	0x28, %o6
	sta	%f26,	[%l7 + %o6] 0x88
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%l2
	set	0x20, %l6
	stxa	%g6,	[%l7 + %l6] 0x80
	and	%i0,	%o5,	%l6
	set	0x3C, %o7
	swapa	[%l7 + %o7] 0x89,	%l5
	nop
	set	0x30, %g7
	stw	%o7,	[%l7 + %g7]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%g7
	nop
	set	0x0E, %g1
	ldsb	[%l7 + %g1],	%l4
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%i6
	set	0x38, %i2
	stxa	%o1,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x10, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o0
	ld	[%l7 + 0x70],	%f2
	ld	[%l7 + 0x7C],	%f7
	set	0x74, %g2
	stba	%g2,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x34, %o0
	stw	%i7,	[%l7 + %o0]
	nop
	set	0x40, %g3
	std	%o4,	[%l7 + %g3]
	nop
	set	0x7B, %o2
	stb	%o6,	[%l7 + %o2]
	nop
	set	0x58, %l3
	std	%i4,	[%l7 + %l3]
	wr	%g4,	%g1,	%set_softint
	wr	%o2,	%i2,	%ccr
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%i3
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%i1
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%l0
	st	%fsr,	[%l7 + 0x50]
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	set	0x39, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l1
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x08, %l5
	lduw	[%l7 + %l5],	%l3
	nop
	set	0x20, %i6
	stx	%fsr,	[%l7 + %i6]
	and	%g5,	%g6,	%l2
	nop
	set	0x70, %o4
	std	%f6,	[%l7 + %o4]
	add	%o5,	%l6,	%l5
	set	0x20, %i3
	stwa	%i0,	[%l7 + %i3] 0x80
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%o7
	nop
	set	0x10, %i0
	std	%g6,	[%l7 + %i0]
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x89,	%l4
	nop
	set	0x2B, %l0
	stb	%i6,	[%l7 + %l0]
	nop
	set	0x24, %l2
	ldsw	[%l7 + %l2],	%o1
	st	%f8,	[%l7 + 0x2C]
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f14
	nop
	set	0x21, %i4
	stb	%g2,	[%l7 + %i4]
	nop
	set	0x50, %o5
	std	%i6,	[%l7 + %o5]
	set	0x30, %o6
	lda	[%l7 + %o6] 0x89,	%f14
	nop
	nop
	setx	0x69B5E392745414D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xBC2B9624106F9C2B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f2,	%f10
	set	0x60, %i5
	stda	%o4,	[%l7 + %i5] 0x81
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%o0
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x88,	 1
	set	0x64, %g7
	stwa	%g4,	[%l7 + %g7] 0x81
	nop
	set	0x59, %g4
	stb	%g1,	[%l7 + %g4]
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x80,	%o2
	nop
	set	0x38, %i2
	lduh	[%l7 + %i2],	%i2
	nop
	set	0x52, %o1
	ldstub	[%l7 + %o1],	%i4
	set	0x20, %g2
	stda	%o6,	[%l7 + %g2] 0x81
	set	0x78, %o0
	swapa	[%l7 + %o0] 0x89,	%i1
	nop
	set	0x1C, %l1
	ldsw	[%l7 + %l1],	%i3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%g3
	nop
	set	0x7A, %o2
	sth	%l3,	[%l7 + %o2]
	nop
	set	0x0D, %l3
	ldsb	[%l7 + %l3],	%g5
	nop
	set	0x52, %g3
	ldsh	[%l7 + %g3],	%l1
	nop
	set	0x77, %o3
	stb	%g6,	[%l7 + %o3]
	nop
	set	0x77, %g5
	ldub	[%l7 + %g5],	%l2
	nop
	set	0x34, %i7
	prefetch	[%l7 + %i7],	 4
	fpadd32	%f12,	%f2,	%f8
	nop
	set	0x1C, %l5
	ldsh	[%l7 + %l5],	%l6
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%f22
	nop
	set	0x0C, %o4
	swap	[%l7 + %o4],	%l5
	nop
	set	0x14, %i1
	lduw	[%l7 + %i1],	%i0
	bne,a,pn	%icc,	loop_173
	st	%f31,	[%l7 + 0x24]
	and	%o5,	%o3,	%o7
	set	0x5B, %i3
	stba	%g7,	[%l7 + %i3] 0xe2
	membar	#Sync
loop_173:
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%l4
	set	0x7C, %l0
	swapa	[%l7 + %l0] 0x80,	%o1
	nop
	set	0x7C, %l2
	lduw	[%l7 + %l2],	%g2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf0
	membar	#Sync
	nop
	set	0x38, %i0
	stx	%i7,	[%l7 + %i0]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xca
	ld	[%l7 + 0x44],	%f14
	nop
	set	0x48, %o6
	swap	[%l7 + %o6],	%i6
	set	0x26, %o5
	stha	%o4,	[%l7 + %o5] 0x88
	add	%i5,	%g4,	%o0
	nop
	set	0x58, %l6
	stx	%g1,	[%l7 + %l6]
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%o2
	nop
	set	0x79, %o7
	stb	%i4,	[%l7 + %o7]
	nop
	set	0x70, %g4
	ldsw	[%l7 + %g4],	%i2
	nop
	set	0x56, %g7
	stb	%i1,	[%l7 + %g7]
	set	0x6E, %g1
	stba	%i3,	[%l7 + %g1] 0x88
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%g3
	set	0x5C, %i2
	lda	[%l7 + %i2] 0x80,	%f4
	ld	[%l7 + 0x3C],	%f0
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%l3
	set	0x1C, %l1
	stwa	%g5,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%o6
	set	0x68, %o0
	stda	%l0,	[%l7 + %o0] 0x89
	and	%g6,	%l2,	%l6
	set	0x78, %l3
	stha	%i0,	[%l7 + %l3] 0xe3
	membar	#Sync
	add	%o5,	%l5,	%o3
	nop
	set	0x40, %o3
	stx	%g7,	[%l7 + %o3]
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%o7
	nop
	set	0x70, %g5
	lduw	[%l7 + %g5],	%o1
	set	0x67, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g2
	nop
	set	0x56, %i6
	stb	%l4,	[%l7 + %i6]
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f18
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%i7
	set	0x7C, %o4
	stwa	%o4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	nop
	set	0x38, %l0
	ldstub	[%l7 + %l0],	%g4
	set	0x68, %i3
	sta	%f16,	[%l7 + %i3] 0x88
	set	0x26, %l4
	stba	%i5,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x28, %l2
	stx	%g1,	[%l7 + %l2]
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%o2
	nop
	set	0x70, %o6
	sth	%i4,	[%l7 + %o6]
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x89,	%i2
	nop
	set	0x44, %l6
	ldsw	[%l7 + %l6],	%i1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f0
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%i3
	nop
	set	0x0C, %o5
	lduw	[%l7 + %o5],	%l0
	st	%f15,	[%l7 + 0x20]
	nop
	set	0x2C, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x54, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x10, %g1
	stxa	%o6,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x4E, %i2
	stba	%l1,	[%l7 + %i2] 0x89
	nop
	set	0x26, %o1
	lduh	[%l7 + %o1],	%l2
	set	0x40, %l1
	swapa	[%l7 + %l1] 0x80,	%l6
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%i0
	set	0x6C, %o0
	stwa	%o5,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x88,	 2
	set	0x68, %l3
	stxa	%l5,	[%l7 + %l3] 0xe3
	membar	#Sync
	or	%g7,	%o7,	%o1
	nop
	set	0x20, %o3
	std	%g2,	[%l7 + %o3]
	set	0x30, %g5
	stxa	%o3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x81,	%l4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f16
	nop
	set	0x11, %i7
	ldsb	[%l7 + %i7],	%i7
	nop
	set	0x60, %g3
	stx	%i6,	[%l7 + %g3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%g4
	nop
	set	0x38, %i1
	ldsh	[%l7 + %i1],	%i5
	add	%o2,	%i4,	%i2
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x89,	%i1
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc2
	nop
	set	0x10, %l0
	stx	%o0,	[%l7 + %l0]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%l0
	set	0x2C, %i3
	stwa	%g1,	[%l7 + %i3] 0xea
	membar	#Sync
	add	%g3,	%l3,	%o6
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%f8
	nop
	set	0x42, %l2
	ldsh	[%l7 + %l2],	%l1
	nop
	set	0x10, %o6
	ldsw	[%l7 + %o6],	%g5
	nop
	set	0x60, %i4
	lduh	[%l7 + %i4],	%l6
	nop
	set	0x3A, %l6
	ldstub	[%l7 + %l6],	%l2
	add	%o5,	%i0,	%l5
	set	0x3B, %i5
	stba	%g7,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x68, %o7
	stx	%o7,	[%l7 + %o7]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x89
	nop
	set	0x3A, %o5
	sth	%o1,	[%l7 + %o5]
	or	%g2,	%o3,	%g6
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x60, %g1
	std	%l4,	[%l7 + %g1]
	nop
	set	0x3C, %g7
	ldub	[%l7 + %g7],	%i6
	set	0x68, %i2
	sta	%f2,	[%l7 + %i2] 0x89
	ld	[%l7 + 0x24],	%f8
	set	0x40, %o1
	lda	[%l7 + %o1] 0x80,	%f10
	fpsub16s	%f18,	%f3,	%f12
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%f22
	nop
	set	0x40, %o0
	lduw	[%l7 + %o0],	%o4
	and	%i7,	%i5,	%g4
	set	0x08, %l1
	lda	[%l7 + %l1] 0x89,	%f21
	nop
	set	0x18, %g2
	std	%o2,	[%l7 + %g2]
	nop
	set	0x50, %o3
	sth	%i4,	[%l7 + %o3]
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x80,	%i1
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xcc
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd0
	nop
	set	0x3E, %i7
	sth	%o0,	[%l7 + %i7]
	add	%i3,	%l0,	%g1
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x88,	%g3
	set	0x5C, %l5
	stha	%l3,	[%l7 + %l5] 0x88
	set	0x38, %o4
	ldstuba	[%l7 + %o4] 0x88,	%o6
	or	%l1,	%g5,	%i2
	set	0x12, %i1
	stha	%l6,	[%l7 + %i1] 0x88
	set	0x78, %g6
	stxa	%l2,	[%l7 + %g6] 0x81
	nop
	set	0x6A, %l0
	ldstub	[%l7 + %l0],	%o5
	nop
	set	0x54, %i3
	prefetch	[%l7 + %i3],	 4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%g7
	fpadd16s	%f20,	%f9,	%f12
	set	0x14, %l2
	sta	%f3,	[%l7 + %l2] 0x89
	and	%o7,	%o1,	%i0
	add	%o3,	%g6,	%l4
	set	0x70, %o6
	sta	%f8,	[%l7 + %o6] 0x88
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x81,	 4
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x81,	 3
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x70, %i5
	std	%i6,	[%l7 + %i5]
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	nop
	set	0x18, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x40, %g4
	std	%f10,	[%l7 + %g4]
	set	0x28, %o7
	stxa	%o4,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x88,	%o2
	nop
	set	0x48, %g1
	std	%f22,	[%l7 + %g1]
	ba,pn	%xcc,	loop_174
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%i4
	and	%i1,	%g4,	%i3
	set	0x50, %o2
	stxa	%o0,	[%l7 + %o2] 0xe3
	membar	#Sync
loop_174:
	ld	[%l7 + 0x44],	%f15
	set	0x77, %o0
	stba	%g1,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd8,	%f0
	nop
	set	0x51, %g2
	stb	%g3,	[%l7 + %g2]
	nop
	set	0x10, %l1
	std	%l2,	[%l7 + %l1]
	set	0x1F, %o3
	ldstuba	[%l7 + %o3] 0x88,	%o6
	add	%l1,	%l0,	%g5
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x88,	%i2
	nop
	set	0x4C, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x81,	%l2
	nop
	set	0x30, %l5
	lduh	[%l7 + %l5],	%l6
	set	0x25, %o4
	stba	%l5,	[%l7 + %o4] 0x89
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf0
	membar	#Sync
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x89,	%g7
	set	0x50, %l0
	sta	%f21,	[%l7 + %l0] 0x88
	and	%o7,	%o5,	%o1
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x64, %g3
	sta	%f21,	[%l7 + %g3] 0x80
	set	0x38, %o6
	stda	%i0,	[%l7 + %o6] 0x88
	nop
	set	0x7C, %l2
	ldub	[%l7 + %l2],	%g6
	set	0x23, %i4
	stba	%o3,	[%l7 + %i4] 0xeb
	membar	#Sync
	and	%g2,	%i6,	%l4
	nop
	set	0x44, %l4
	ldsw	[%l7 + %l4],	%i5
	st	%fsr,	[%l7 + 0x24]
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x81,	%o4
	nop
	set	0x0C, %i0
	ldstub	[%l7 + %i0],	%o2
	nop
	set	0x18, %o5
	std	%f20,	[%l7 + %o5]
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%i4
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f14
	nop
	set	0x58, %o7
	ldstub	[%l7 + %o7],	%i1
	nop
	set	0x7E, %g7
	ldsh	[%l7 + %g7],	%i7
	set	0x30, %g1
	stxa	%i3,	[%l7 + %g1] 0x88
	nop
	set	0x74, %o2
	ldsh	[%l7 + %o2],	%g4
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f12
	set	0x30, %i2
	stda	%o0,	[%l7 + %i2] 0xe3
	membar	#Sync
	ld	[%l7 + 0x1C],	%f17
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
	set	0x1D, %g2
	stba	%g1,	[%l7 + %g2] 0x88
	and	%g3,	%l3,	%l1
	add	%l0,	%g5,	%i2
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%o6
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x80,	 0
	nop
	set	0x38, %l3
	lduh	[%l7 + %l3],	%l5
	wr	%g7,	%o7,	%ccr
	fpsub16s	%f30,	%f7,	%f2
	nop
	set	0x34, %i6
	stw	%o5,	[%l7 + %i6]
	set	0x40, %o3
	ldxa	[%l7 + %o3] 0x81,	%o1
	and	%i0,	%g6,	%l2
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	fpsub16s	%f2,	%f12,	%f13
	add	%g2,	%i6,	%l4
	nop
	set	0x28, %o4
	stx	%o3,	[%l7 + %o4]
	nop
	set	0x20, %l5
	ldstub	[%l7 + %l5],	%o4
	nop
	set	0x58, %g6
	ldsh	[%l7 + %g6],	%i5
	nop
	set	0x40, %i1
	std	%f16,	[%l7 + %i1]
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x88,	%i4
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	nop
	set	0x0C, %o6
	stw	%o2,	[%l7 + %o6]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc4
	st	%f23,	[%l7 + 0x40]
	or	%i3,	%g4,	%i7
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%g1
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x89,	%g3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x88,	 3
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc4
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%o0
	set	0x5E, %l6
	ldstuba	[%l7 + %l6] 0x89,	%l1
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x81
	nop
	set	0x64, %g7
	ldsh	[%l7 + %g7],	%l0
	set	0x51, %o7
	ldstuba	[%l7 + %o7] 0x89,	%i2
	set	0x31, %o2
	stba	%o6,	[%l7 + %o2] 0x88
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc4
	set	0x30, %i2
	stda	%g4,	[%l7 + %i2] 0x80
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	nop
	set	0x15, %g1
	ldsb	[%l7 + %g1],	%l5
	st	%f24,	[%l7 + 0x3C]
	set	0x32, %g2
	stha	%g7,	[%l7 + %g2] 0x89
	nop
	set	0x50, %g5
	std	%i6,	[%l7 + %g5]
	set	0x3E, %l3
	stha	%o5,	[%l7 + %l3] 0x89
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f0
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%i0
	nop
	set	0x5B, %i7
	ldub	[%l7 + %i7],	%g6
	nop
	set	0x50, %l1
	std	%l2,	[%l7 + %l1]
	nop
	set	0x30, %l5
	ldsw	[%l7 + %l5],	%g2
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x89,	%f21
	fpsub32s	%f21,	%f6,	%f11
	set	0x58, %i1
	stda	%o0,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x88,	%l4
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x81,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o4
	set	0x64, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i5
	nop
	set	0x10, %l0
	prefetch	[%l7 + %l0],	 1
	fpsub16s	%f14,	%f10,	%f14
	set	0x5A, %g3
	stha	%i4,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xd2
	set	0x30, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o2
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xcc
	nop
	set	0x13, %l4
	stb	%i1,	[%l7 + %l4]
	set	0x28, %i5
	lda	[%l7 + %i5] 0x80,	%f21
	nop
	set	0x22, %l6
	sth	%i3,	[%l7 + %l6]
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%i7
	set	0x68, %g7
	stda	%g4,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x08, %o7
	stba	%g1,	[%l7 + %o7] 0x81
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc8
	nop
	set	0x0F, %o1
	ldsb	[%l7 + %o1],	%g3
	or	%o0,	%l3,	%l0
	nop
	set	0x60, %i2
	ldsh	[%l7 + %i2],	%l1
	nop
	set	0x6F, %o2
	ldub	[%l7 + %o2],	%i2
	set	0x68, %o0
	swapa	[%l7 + %o0] 0x89,	%g5
	set	0x68, %g1
	swapa	[%l7 + %g1] 0x81,	%l5
	set	0x0C, %g5
	stwa	%o6,	[%l7 + %g5] 0x80
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x88,	%g6
	add	%l6,	%o5,	%i0
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe2,	%o6
	st	%fsr,	[%l7 + 0x50]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf8
	membar	#Sync
	or	%l2,	%g2,	%o1
	set	0x1E, %i7
	stha	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x52, %l1
	stha	%o3,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x68, %l5
	std	%f18,	[%l7 + %l5]
	nop
	set	0x14, %o3
	lduh	[%l7 + %o3],	%i6
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%g6
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f8
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%i5
	nop
	set	0x18, %g6
	stx	%i4,	[%l7 + %g6]
	set	0x10, %l0
	stda	%o2,	[%l7 + %l0] 0x81
	nop
	set	0x58, %o6
	std	%f14,	[%l7 + %o6]
	nop
	set	0x20, %i4
	stx	%o4,	[%l7 + %i4]
	nop
	set	0x08, %l2
	prefetch	[%l7 + %l2],	 4
	add	%i3,	%i7,	%i1
	set	0x66, %i0
	stha	%g4,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x6C, %l4
	stw	%g3,	[%l7 + %l4]
	set	0x16, %i5
	stha	%o0,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%g1,	%l3,	%l1
	nop
	set	0x45, %g3
	ldub	[%l7 + %g3],	%i2
	set	0x78, %g4
	stwa	%l0,	[%l7 + %g4] 0x81
	nop
	set	0x40, %g7
	ldsw	[%l7 + %g7],	%l5
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x89,	%o6
	bgu,pn	%xcc,	loop_175
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%g5
	st	%f2,	[%l7 + 0x44]
	nop
	set	0x78, %o7
	ldsh	[%l7 + %o7],	%g7
loop_175:
	fpadd32s	%f0,	%f8,	%f28
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xca
	nop
	set	0x2E, %o0
	stb	%l6,	[%l7 + %o0]
	set	0x08, %i2
	stda	%o4,	[%l7 + %i2] 0x88
	nop
	set	0x48, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%o7,	%i0,	%g2
	set	0x54, %g1
	sta	%f9,	[%l7 + %g1] 0x81
	set	0x30, %l3
	ldda	[%l7 + %l3] 0xe2,	%l2
	nop
	set	0x5A, %i6
	stb	%o1,	[%l7 + %i6]
	nop
	set	0x64, %g2
	stw	%o3,	[%l7 + %g2]
	set	0x48, %l1
	stwa	%l4,	[%l7 + %l1] 0x89
	and	%i6,	%i5,	%i4
	st	%fsr,	[%l7 + 0x48]
	bgu,a,pt	%icc,	loop_176
	st	%f14,	[%l7 + 0x40]
	fpsub16s	%f0,	%f20,	%f28
	nop
	set	0x0C, %l5
	ldub	[%l7 + %l5],	%g6
loop_176:
	nop
	set	0x22, %o3
	sth	%o2,	[%l7 + %o3]
	add	%i3,	%o4,	%i1
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%i7
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x18, %i3
	std	%f20,	[%l7 + %i3]
	or	%g3,	%g4,	%o0
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x88,	%l3
	st	%f29,	[%l7 + 0x24]
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x89,	%g0
	nop
	set	0x10, %l0
	std	%i2,	[%l7 + %l0]
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%l1
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%l0
	add	%o6,	%l5,	%g5
	nop
	set	0x14, %l2
	ldsw	[%l7 + %l2],	%g7
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f28
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f8
	nop
	set	0x14, %l4
	ldstub	[%l7 + %l4],	%o5
	set	0x14, %g3
	sta	%f19,	[%l7 + %g3] 0x80
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%l6
	set	0x50, %g7
	stxa	%o7,	[%l7 + %g7] 0x89
	set	0x38, %l6
	stwa	%g2,	[%l7 + %l6] 0x88
	nop
	set	0x14, %i5
	lduh	[%l7 + %i5],	%i0
	fpadd16	%f26,	%f6,	%f22
	set	0x4C, %o5
	sta	%f26,	[%l7 + %o5] 0x80
	nop
	set	0x6E, %o7
	ldsh	[%l7 + %o7],	%o1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%l4
	st	%f16,	[%l7 + 0x3C]
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f0
	nop
	set	0x48, %o0
	std	%l2,	[%l7 + %o0]
	ld	[%l7 + 0x48],	%f20
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%i6
	nop
	set	0x68, %i2
	swap	[%l7 + %i2],	%i4
	set	0x42, %g5
	stha	%i5,	[%l7 + %g5] 0x88
	nop
	set	0x45, %g1
	ldsb	[%l7 + %g1],	%o2
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%g6
	set	0x10, %i6
	stwa	%i3,	[%l7 + %i6] 0x88
	ld	[%l7 + 0x28],	%f26
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%i1
	nop
	set	0x20, %g2
	std	%i6,	[%l7 + %g2]
	set	0x38, %o3
	stda	%o4,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xe3,	%g2
	st	%f16,	[%l7 + 0x30]
	bn	%xcc,	loop_177
	nop
	set	0x28, %i1
	std	%f28,	[%l7 + %i1]
	and	%o0,	%l3,	%g1
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%g4
loop_177:
	nop
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x80,	%i2
	nop
	set	0x30, %l0
	stx	%l0,	[%l7 + %l0]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	nop
	set	0x14, %o4
	ldub	[%l7 + %o4],	%l1
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x81,	%l5
	ld	[%l7 + 0x20],	%f31
	nop
	set	0x09, %l2
	stb	%o6,	[%l7 + %l2]
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x88,	%g7
	nop
	set	0x30, %i0
	stw	%o5,	[%l7 + %i0]
	set	0x3A, %g3
	stba	%l6,	[%l7 + %g3] 0x89
	ld	[%l7 + 0x70],	%f8
	nop
	set	0x50, %l4
	std	%g4,	[%l7 + %l4]
	set	0x20, %g7
	stda	%o6,	[%l7 + %g7] 0x81
	and	%i0,	%o1,	%o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1242
!	Type a   	: 22
!	Type cti   	: 32
!	Type x   	: 531
!	Type f   	: 47
!	Type i   	: 126
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
	set	0xC,	%g1
	set	0xE,	%g2
	set	0x7,	%g3
	set	0xA,	%g4
	set	0x9,	%g5
	set	0xC,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x9,	%i1
	set	-0x2,	%i2
	set	-0x2,	%i3
	set	-0x3,	%i4
	set	-0xD,	%i5
	set	-0xD,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x6BD89A10,	%l0
	set	0x02554D09,	%l1
	set	0x19D2AA21,	%l2
	set	0x668C9FBD,	%l3
	set	0x07DA81DC,	%l4
	set	0x3072296D,	%l5
	set	0x3F654AA7,	%l6
	!# Output registers
	set	0x0321,	%o0
	set	-0x0AFA,	%o1
	set	-0x0DF4,	%o2
	set	-0x038C,	%o3
	set	0x0A37,	%o4
	set	-0x1A53,	%o5
	set	0x086B,	%o6
	set	0x1C06,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x974ED5F179ED8C75)
	INIT_TH_FP_REG(%l7,%f2,0xAD99E66D88D995E7)
	INIT_TH_FP_REG(%l7,%f4,0x33B3A8C578EB8294)
	INIT_TH_FP_REG(%l7,%f6,0x398DD2D8BA8AA5D0)
	INIT_TH_FP_REG(%l7,%f8,0xF30BBFA0618D170C)
	INIT_TH_FP_REG(%l7,%f10,0xA66E4BC5C26D1CDB)
	INIT_TH_FP_REG(%l7,%f12,0x3628031191C258FB)
	INIT_TH_FP_REG(%l7,%f14,0x0CBC5F32B659DAFD)
	INIT_TH_FP_REG(%l7,%f16,0xAD5D6999FDFB67DB)
	INIT_TH_FP_REG(%l7,%f18,0x4CB423507888E9B4)
	INIT_TH_FP_REG(%l7,%f20,0xB2B01E161C326D9F)
	INIT_TH_FP_REG(%l7,%f22,0x052F8CCD61007025)
	INIT_TH_FP_REG(%l7,%f24,0xD7599EDB2A8DFF91)
	INIT_TH_FP_REG(%l7,%f26,0xA7AEEBCB547D88EA)
	INIT_TH_FP_REG(%l7,%f28,0x442F557C1F9636D9)
	INIT_TH_FP_REG(%l7,%f30,0xA13CE2F260C43C25)

	!# Execute Main Diag ..

	nop
	set	0x56, %g4
	sth	%l4,	[%l7 + %g4]
	nop
	set	0x50, %l6
	std	%f4,	[%l7 + %l6]
	set	0x38, %o5
	stxa	%l2,	[%l7 + %o5] 0x81
	set	0x34, %o7
	swapa	[%l7 + %o7] 0x80,	%i6
	set	0x38, %o2
	lda	[%l7 + %o2] 0x89,	%f26
	wr	%g2,	%i5,	%pic
	ld	[%l7 + 0x50],	%f10
	set	0x59, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o2
	set	0x6C, %o1
	lda	[%l7 + %o1] 0x80,	%f6
	nop
	set	0x28, %i2
	stw	%g6,	[%l7 + %i2]
	nop
	set	0x30, %g5
	std	%f28,	[%l7 + %g5]
	set	0x0C, %g1
	sta	%f0,	[%l7 + %g1] 0x80
	nop
	set	0x28, %o0
	stw	%i3,	[%l7 + %o0]
	nop
	set	0x30, %i6
	std	%i0,	[%l7 + %i6]
	set	0x2C, %l1
	swapa	[%l7 + %l1] 0x81,	%i7
	nop
	set	0x1E, %l3
	sth	%i4,	[%l7 + %l3]
	set	0x0C, %o3
	sta	%f0,	[%l7 + %o3] 0x88
	ble,a,pt	%icc,	loop_178
	and	%g3,	%o0,	%l3
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x67, %l5
	ldub	[%l7 + %l5],	%i2
loop_178:
	nop
	set	0x6E, %g2
	ldub	[%l7 + %g2],	%g4
	fpsub16	%f2,	%f6,	%f14
	nop
	set	0x6A, %i1
	ldstub	[%l7 + %i1],	%l1
	set	0x18, %i3
	stxa	%l0,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x80,	 4
	nop
	set	0x68, %g6
	ldsw	[%l7 + %g6],	%g7
	nop
	set	0x0C, %l0
	lduw	[%l7 + %l0],	%o5
	set	0x30, %i4
	stxa	%o6,	[%l7 + %i4] 0x89
	nop
	set	0x60, %l2
	prefetch	[%l7 + %l2],	 3
	wr	%l6,	%o7,	%ccr
	set	0x5C, %o6
	stwa	%g5,	[%l7 + %o6] 0xeb
	membar	#Sync
	add	%o1,	%o3,	%l4
	nop
	set	0x34, %o4
	prefetch	[%l7 + %o4],	 0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%i6
	nop
	set	0x40, %i0
	std	%g2,	[%l7 + %i0]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%i0
	set	0x60, %g3
	stda	%o2,	[%l7 + %g3] 0xeb
	membar	#Sync
	or	%i3,	%g6,	%i1
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%i7
	bn	%xcc,	loop_179
	nop
	set	0x40, %g4
	std	%g2,	[%l7 + %g4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x605, 	%sys_tick_cmpr
	nop
	set	0x13, %g7
	ldstub	[%l7 + %g7],	%o0
loop_179:
	nop
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	nop
	set	0x40, %o7
	std	%o4,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x74]
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	nop
	set	0x34, %i5
	swap	[%l7 + %i5],	%i2
	set	0x60, %o5
	stda	%g4,	[%l7 + %o5] 0x80
	st	%fsr,	[%l7 + 0x10]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%l5
	ld	[%l7 + 0x74],	%f16
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc4
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xeb,	%g6
	nop
	nop
	setx	0x4012EF9AD67D9E88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA941B9D6D606811D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f22
	set	0x5C, %o1
	sta	%f13,	[%l7 + %o1] 0x88
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x89,	 1
	nop
	set	0x38, %o0
	stx	%o6,	[%l7 + %o0]
	add	%l6,	%l0,	%g5
	set	0x08, %i6
	stxa	%o7,	[%l7 + %i6] 0xe3
	membar	#Sync
	ba,a	%icc,	loop_180
	nop
	set	0x76, %l3
	ldsb	[%l7 + %l3],	%o3
	st	%fsr,	[%l7 + 0x38]
	set	0x27, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l4
loop_180:
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%l2
	ld	[%l7 + 0x68],	%f6
	fpsub16s	%f8,	%f15,	%f20
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	fpsub32s	%f15,	%f1,	%f2
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f2
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x20, %i7
	std	%o0,	[%l7 + %i7]
	nop
	set	0x28, %i3
	sth	%g2,	[%l7 + %i3]
	nop
	set	0x58, %g6
	stx	%i5,	[%l7 + %g6]
	set	0x3C, %i4
	stba	%i0,	[%l7 + %i4] 0x80
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f20
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x80,	%o2
	wr	%g6,	%i1,	%y
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%i7
	set	0x14, %i0
	sta	%f20,	[%l7 + %i0] 0x81
	set	0x28, %g3
	stda	%g2,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%i3
	set	0x7D, %g4
	stba	%i4,	[%l7 + %g4] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	set	0x63, %g7
	stba	%l3,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x10, %l6
	std	%f16,	[%l7 + %l6]
	nop
	set	0x67, %l4
	ldstub	[%l7 + %l4],	%o4
	nop
	set	0x10, %o7
	ldstub	[%l7 + %o7],	%o0
	nop
	set	0x60, %i5
	lduh	[%l7 + %i5],	%g1
	nop
	set	0x2E, %o5
	sth	%g4,	[%l7 + %o5]
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%l0
	nop
	set	0x2B, %g5
	ldsb	[%l7 + %g5],	%i2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%l6
	set	0x2C, %i2
	lda	[%l7 + %i2] 0x88,	%f17
	nop
	set	0x70, %g1
	lduw	[%l7 + %g1],	%o6
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x81,	%l0
	nop
	set	0x1A, %i6
	sth	%g5,	[%l7 + %i6]
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xeb,	%o2
	set	0x2B, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l4
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x81,	%o7
	or	%i6,	%l2,	%o1
	or	%g2,	%i0,	%i5
	nop
	set	0x60, %o3
	stx	%fsr,	[%l7 + %o3]
	ba,a	%icc,	loop_181
	nop
	set	0x10, %i1
	stw	%g6,	[%l7 + %i1]
	nop
	set	0x4A, %l5
	stb	%o2,	[%l7 + %l5]
	and	%i1,	%g3,	%i3
loop_181:
	nop
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	set	0x44, %i7
	sta	%f30,	[%l7 + %i7] 0x81
	nop
	set	0x64, %g6
	ldsw	[%l7 + %g6],	%l3
	set	0x0C, %i3
	swapa	[%l7 + %i3] 0x81,	%i7
	nop
	set	0x58, %i4
	std	%f6,	[%l7 + %i4]
	set	0x08, %l0
	lda	[%l7 + %l0] 0x81,	%f9
	or	%o0,	%g1,	%o4
	nop
	set	0x38, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%l1
	wr	%g4,	%i2,	%pic
	set	0x3C, %g3
	lda	[%l7 + %g3] 0x80,	%f31
	nop
	set	0x12, %i0
	stb	%g7,	[%l7 + %i0]
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x80,	%o5
	and	%l5,	%o6,	%l6
	bgu,a	%icc,	loop_182
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%g4
	nop
	set	0x60, %g7
	stx	%l0,	[%l7 + %g7]
	nop
	set	0x1E, %l4
	sth	%l4,	[%l7 + %l4]
loop_182:
	nop
	set	0x50, %o7
	sta	%f12,	[%l7 + %o7] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x837, 	%sys_tick_cmpr
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x89,	%o3
	nop
	set	0x40, %o5
	stw	%l2,	[%l7 + %o5]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd2
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x70, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x54, %g1
	stw	%o1,	[%l7 + %g1]
	nop
	set	0x6C, %o0
	stw	%g2,	[%l7 + %o0]
	wr	%i5,	%i0,	%softint
	and	%g6,	%o2,	%i1
	nop
	set	0x4F, %g5
	ldub	[%l7 + %g5],	%g3
	wr	%i4,	%i3,	%clear_softint
	set	0x78, %l3
	stxa	%l3,	[%l7 + %l3] 0x80
	set	0x20, %l1
	ldstuba	[%l7 + %l1] 0x81,	%i7
	be,pn	%icc,	loop_183
	nop
	set	0x50, %i6
	std	%f30,	[%l7 + %i6]
	set	0x18, %o3
	stxa	%o0,	[%l7 + %o3] 0xea
	membar	#Sync
loop_183:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%g1
	ld	[%l7 + 0x38],	%f16
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%g4
	set	0x62, %i1
	stba	%l1,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x22, %l5
	sth	%i2,	[%l7 + %l5]
	set	0x10, %g2
	stxa	%o5,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x28, %g6
	sta	%f25,	[%l7 + %g6] 0x80
	set	0x38, %i3
	stda	%l4,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o6
	set	0x30, %i7
	stxa	%l0,	[%l7 + %i7] 0x81
	add	%g5,	%l4,	%i6
	nop
	set	0x5E, %o4
	lduh	[%l7 + %o4],	%o3
	and	%l2,	%o7,	%g2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd0
	nop
	set	0x1E, %l0
	lduh	[%l7 + %l0],	%o1
	nop
	set	0x52, %i0
	stb	%i5,	[%l7 + %i0]
	set	0x6C, %l2
	stwa	%i0,	[%l7 + %l2] 0xeb
	membar	#Sync
	be,a	%icc,	loop_184
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%o2
	nop
	set	0x39, %g4
	ldstub	[%l7 + %g4],	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%g6
loop_184:
	nop
	set	0x60, %g7
	stxa	%i3,	[%l7 + %g7] 0xeb
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%i7
	set	0x32, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o0
	set	0x63, %l6
	stba	%o4,	[%l7 + %l6] 0x81
	set	0x37, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%g0
	nop
	set	0x6C, %i5
	lduw	[%l7 + %i5],	%g4
	set	0x63, %i2
	stba	%i2,	[%l7 + %i2] 0x80
	ble	%xcc,	loop_185
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%f10
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%l5
loop_185:
	nop
	set	0x50, %g1
	stda	%g6,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x5A, %g5
	stha	%l1,	[%l7 + %g5] 0x89
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3B0, 	%sys_tick_cmpr
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%l0
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x80
	nop
	set	0x62, %l3
	ldsh	[%l7 + %l3],	%l4
	nop
	set	0x69, %i6
	stb	%i6,	[%l7 + %i6]
	fpsub16	%f18,	%f6,	%f18
	nop
	set	0x4A, %o1
	ldstub	[%l7 + %o1],	%g5
	set	0x60, %i1
	swapa	[%l7 + %i1] 0x80,	%l2
	nop
	set	0x4A, %l5
	stb	%o7,	[%l7 + %l5]
	set	0x61, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o3
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%g2
	nop
	set	0x10, %i3
	std	%f18,	[%l7 + %i3]
	add	%i5,	%i0,	%o2
	bge	%xcc,	loop_186
	nop
	set	0x60, %g6
	ldsb	[%l7 + %g6],	%i1
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x88,	%g3
loop_186:
	nop
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x80,	 1
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x88,	 3
	bne	%xcc,	loop_187
	wr	%i3,	%i7,	%clear_softint
	nop
	set	0x10, %o4
	ldsb	[%l7 + %o4],	%o0
	nop
	set	0x35, %l0
	ldub	[%l7 + %l0],	%l3
loop_187:
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%o4
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	set	0x18, %g4
	sta	%f27,	[%l7 + %g4] 0x88
	nop
	set	0x36, %g7
	sth	%i4,	[%l7 + %g7]
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x89,	 2
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%g1
	set	0x74, %l6
	stha	%o5,	[%l7 + %l6] 0x88
	nop
	set	0x41, %l4
	ldub	[%l7 + %l4],	%l5
	set	0x76, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l1
	set	0x6C, %i2
	stwa	%g7,	[%l7 + %i2] 0x88
	and	%o6,	%l6,	%l4
	nop
	set	0x34, %o2
	lduh	[%l7 + %o2],	%l0
	set	0x5C, %g1
	lda	[%l7 + %g1] 0x80,	%f22
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x81,	%g4
	nop
	set	0x36, %o0
	ldstub	[%l7 + %o0],	%i6
	nop
	set	0x5C, %l3
	ldsw	[%l7 + %l3],	%l2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc0
	set	0x3E, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o7
	nop
	set	0x38, %l1
	ldsw	[%l7 + %l1],	%g2
	set	0x40, %i1
	stxa	%o3,	[%l7 + %i1] 0x80
	nop
	set	0x58, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x4E, %o3
	ldstub	[%l7 + %o3],	%i5
	set	0x18, %g2
	sta	%f10,	[%l7 + %g2] 0x89
	set	0x12, %g6
	stha	%o2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%i0
	nop
	set	0x20, %i7
	swap	[%l7 + %i7],	%i1
	set	0x48, %i4
	stwa	%g3,	[%l7 + %i4] 0x80
	add	%o1,	%g6,	%i3
	nop
	set	0x08, %o4
	ldsw	[%l7 + %o4],	%i7
	nop
	nop
	setx	0x59450FF82787AA39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA58F49D9B8874530,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f2,	%f0
	nop
	set	0x10, %l0
	swap	[%l7 + %l0],	%o0
	nop
	set	0x10, %l2
	std	%l2,	[%l7 + %l2]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%i4
	ble	%icc,	loop_188
	nop
	set	0x18, %i0
	std	%f0,	[%l7 + %i0]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g1
loop_188:
	and	%o5,	%g4,	%l5
	nop
	set	0x12, %g4
	lduh	[%l7 + %g4],	%l1
	nop
	set	0x28, %g7
	std	%f8,	[%l7 + %g7]
	nop
	set	0x10, %o6
	stw	%o6,	[%l7 + %o6]
	nop
	set	0x47, %o7
	stb	%l6,	[%l7 + %o7]
	set	0x60, %g3
	stba	%l4,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x08, %l6
	stx	%l0,	[%l7 + %l6]
	set	0x48, %l4
	stda	%g6,	[%l7 + %l4] 0x89
	set	0x38, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i6
	nop
	set	0x68, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x0C, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x3C, %g1
	ldstub	[%l7 + %g1],	%o7
	nop
	set	0x60, %o2
	std	%f16,	[%l7 + %o2]
	nop
	set	0x30, %o0
	lduh	[%l7 + %o0],	%g5
	add	%o3,	%g2,	%i5
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc0
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%i0
	or	%i1,	%g3,	%o1
	set	0x20, %o1
	stda	%g6,	[%l7 + %o1] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%i7
	nop
	set	0x20, %l1
	std	%f8,	[%l7 + %l1]
	nop
	set	0x08, %l3
	stx	%o0,	[%l7 + %l3]
	add	%i3,	%o4,	%i4
	wr	%l3,	%g1,	%pic
	and	%o5,	%g4,	%i2
	set	0x34, %i1
	sta	%f12,	[%l7 + %i1] 0x89
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	or	%l1,	%l5,	%l6
	nop
	set	0x0C, %g2
	swap	[%l7 + %g2],	%l4
	set	0x0E, %o3
	stha	%l0,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x18, %i3
	stda	%o6,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x68, %g6
	std	%i6,	[%l7 + %g6]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%o7
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%g7
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xe2,	%g4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x81
	fpsub16s	%f13,	%f0,	%f2
	nop
	set	0x4D, %l2
	ldsb	[%l7 + %l2],	%o3
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xca
	nop
	set	0x48, %o4
	std	%i4,	[%l7 + %o4]
	set	0x6C, %g7
	stwa	%g2,	[%l7 + %g7] 0xe2
	membar	#Sync
	and	%i1,	%g3,	%i0
	and	%o1,	%g6,	%i7
	nop
	set	0x34, %o6
	stw	%o0,	[%l7 + %o6]
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x60, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x4C, %g4
	stha	%o2,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x08, %l4
	ldub	[%l7 + %l4],	%o4
	nop
	set	0x16, %l6
	ldsb	[%l7 + %l6],	%i4
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xeb,	%i2
	add	%g1,	%o5,	%g4
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%l3
	nop
	set	0x72, %i5
	lduh	[%l7 + %i5],	%i2
	nop
	set	0x4C, %g1
	ldsw	[%l7 + %g1],	%l1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l5
	set	0x08, %o2
	stwa	%l4,	[%l7 + %o2] 0x81
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%l0
	nop
	set	0x20, %g5
	stx	%o6,	[%l7 + %g5]
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x81,	%i6
	and	%o7,	%l2,	%g7
	set	0x18, %i6
	stxa	%o3,	[%l7 + %i6] 0xe3
	membar	#Sync
	and	%i5,	%g2,	%i1
	set	0x24, %l3
	stha	%g5,	[%l7 + %l3] 0x88
	add	%i0,	%g3,	%o1
	set	0x54, %i1
	stha	%i7,	[%l7 + %i1] 0x88
	nop
	set	0x2F, %l5
	stb	%o0,	[%l7 + %l5]
	set	0x4C, %l1
	swapa	[%l7 + %l1] 0x80,	%o2
	nop
	set	0x2D, %g2
	ldsb	[%l7 + %g2],	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%g6
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%i2
	set	0x3C, %i4
	sta	%f14,	[%l7 + %i4] 0x88
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x81,	%g1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f16
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o5
	nop
	set	0x2E, %l2
	sth	%l3,	[%l7 + %l2]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc8
	or	%l1,	%l6,	%i2
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%l4
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%l5
	nop
	set	0x56, %g6
	lduh	[%l7 + %g6],	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%o7
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%l2
	ld	[%l7 + 0x20],	%f26
	nop
	set	0x6B, %o6
	ldub	[%l7 + %o6],	%g7
	set	0x26, %g3
	stba	%l0,	[%l7 + %g3] 0x89
	or	%o3,	%i5,	%g2
	add	%i1,	%i0,	%g3
	nop
	set	0x58, %g4
	std	%o0,	[%l7 + %g4]
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
	add	%o0,	%o2,	%g5
	set	0x0C, %i2
	sta	%f7,	[%l7 + %i2] 0x88
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe3,	%i4
	set	0x71, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o4
	set	0x2C, %g1
	lda	[%l7 + %g1] 0x81,	%f2
	set	0x30, %o2
	stxa	%g6,	[%l7 + %o2] 0x88
	nop
	set	0x16, %o0
	ldub	[%l7 + %o0],	%i3
	set	0x58, %g5
	ldxa	[%l7 + %g5] 0x88,	%g1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf9,	%f0
	nop
	set	0x1A, %i5
	sth	%g4,	[%l7 + %i5]
	nop
	set	0x68, %l3
	std	%o4,	[%l7 + %l3]
	set	0x20, %i1
	stxa	%l3,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%l1
	nop
	set	0x10, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x1D, %g2
	ldub	[%l7 + %g2],	%l6
	ld	[%l7 + 0x50],	%f1
	nop
	set	0x54, %i6
	lduw	[%l7 + %i6],	%i2
	nop
	set	0x70, %i3
	std	%l4,	[%l7 + %i3]
	set	0x44, %o3
	lda	[%l7 + %o3] 0x80,	%f22
	nop
	set	0x28, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x78, %i4
	stx	%l5,	[%l7 + %i4]
	set	0x37, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i6
	set	0x24, %i0
	stwa	%l2,	[%l7 + %i0] 0x80
	nop
	set	0x38, %l0
	ldsw	[%l7 + %l0],	%o7
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x88,	%l0
	set	0x68, %g6
	prefetcha	[%l7 + %g6] 0x81,	 1
	set	0x48, %g7
	stwa	%g7,	[%l7 + %g7] 0x80
	nop
	set	0x18, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x6E, %g3
	sth	%i1,	[%l7 + %g3]
	nop
	set	0x48, %o6
	std	%i4,	[%l7 + %o6]
	and	%g3,	%o1,	%i0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%o0
	set	0x50, %g4
	ldda	[%l7 + %g4] 0xea,	%o2
	nop
	set	0x75, %i2
	ldsb	[%l7 + %i2],	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g6
	set	0x2C, %l4
	stwa	%i3,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x38, %g1
	stx	%g1,	[%l7 + %g1]
	nop
	set	0x48, %o0
	sth	%g4,	[%l7 + %o0]
	ld	[%l7 + 0x60],	%f6
	nop
	set	0x46, %g5
	ldsh	[%l7 + %g5],	%g5
	nop
	set	0x48, %o1
	stb	%o5,	[%l7 + %o1]
	set	0x46, %i5
	stha	%l3,	[%l7 + %i5] 0x80
	ld	[%l7 + 0x64],	%f14
	set	0x44, %o2
	sta	%f8,	[%l7 + %o2] 0x89
	nop
	set	0x5C, %i1
	ldsh	[%l7 + %i1],	%l1
	set	0x60, %l3
	stda	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f26
	set	0x2C, %l5
	sta	%f29,	[%l7 + %l5] 0x80
	wr	%i2,	%o6,	%softint
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%l4
	nop
	set	0x24, %i6
	swap	[%l7 + %i6],	%l5
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%l2
	nop
	set	0x6C, %o3
	ldsh	[%l7 + %o3],	%i6
	nop
	set	0x78, %i7
	sth	%o7,	[%l7 + %i7]
	set	0x10, %i4
	sta	%f13,	[%l7 + %i4] 0x81
	or	%l0,	%o3,	%g7
	nop
	set	0x5B, %i0
	stb	%g2,	[%l7 + %i0]
	add	%i1,	%i5,	%g3
	nop
	set	0x20, %l2
	sth	%i0,	[%l7 + %l2]
	add	%o1,	%o0,	%i7
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%o2
	nop
	set	0x36, %g6
	ldstub	[%l7 + %g6],	%o4
	set	0x20, %g7
	lda	[%l7 + %g7] 0x88,	%f13
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%g6
	fpadd32	%f20,	%f20,	%f24
	bge,a,pt	%icc,	loop_189
	or	%i3,	%g4,	%g1
	nop
	set	0x78, %o7
	ldub	[%l7 + %o7],	%o5
	nop
	set	0x08, %g3
	ldx	[%l7 + %g3],	%l3
loop_189:
	nop
	set	0x60, %o4
	swap	[%l7 + %o4],	%g5
	nop
	set	0x1A, %g4
	ldub	[%l7 + %g4],	%l1
	nop
	set	0x1C, %i2
	prefetch	[%l7 + %i2],	 3
	set	0x78, %o6
	lda	[%l7 + %o6] 0x80,	%f28
	set	0x40, %l4
	stda	%i2,	[%l7 + %l4] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%o6
	nop
	set	0x5C, %o5
	stw	%l5,	[%l7 + %o5]
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%l2
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%l4
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%i6
	set	0x64, %o0
	stha	%l0,	[%l7 + %o0] 0x81
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f30
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x89,	 0
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	wr	%g7,	%g2,	%set_softint
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f22
	nop
	set	0x08, %l3
	lduw	[%l7 + %l3],	%i1
	fpsub32	%f16,	%f4,	%f8
	add	%o3,	%g3,	%i0
	set	0x2D, %l1
	ldstuba	[%l7 + %l1] 0x89,	%i5
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x68, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o1
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f26
	nop
	set	0x78, %o3
	stx	%o0,	[%l7 + %o3]
	ld	[%l7 + 0x2C],	%f6
	nop
	set	0x20, %l5
	std	%o2,	[%l7 + %l5]
	nop
	set	0x60, %i4
	std	%f4,	[%l7 + %i4]
	set	0x38, %i7
	stha	%i7,	[%l7 + %i7] 0x89
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 3
	set	0x48, %l2
	stwa	%o4,	[%l7 + %l2] 0x89
	and	%i4,	%i3,	%g6
	nop
	set	0x2D, %l0
	ldub	[%l7 + %l0],	%g1
	nop
	set	0x40, %g7
	stx	%fsr,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x14]
	set	0x40, %g6
	stxa	%o5,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x70, %g3
	stwa	%l3,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%g4
	set	0x38, %o4
	stba	%g5,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x7D, %g4
	ldsb	[%l7 + %g4],	%i2
	nop
	set	0x2C, %i2
	stb	%l6,	[%l7 + %i2]
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l1
	and	%l5,	%l2,	%o6
	nop
	set	0x18, %l4
	stx	%l4,	[%l7 + %l4]
	nop
	set	0x5C, %g1
	lduw	[%l7 + %g1],	%l0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	set	0x64, %g5
	swapa	[%l7 + %g5] 0x89,	%o7
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%g7
	nop
	set	0x2E, %o5
	stb	%i6,	[%l7 + %o5]
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	and	%i1,	%g3,	%o3
	nop
	set	0x25, %i1
	ldub	[%l7 + %i1],	%i5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i4
	nop
	set	0x40, %o2
	swap	[%l7 + %o2],	%i3
	nop
	set	0x7D, %l1
	ldub	[%l7 + %l1],	%i7
	nop
	set	0x48, %g2
	ldx	[%l7 + %g2],	%g1
	st	%f25,	[%l7 + 0x40]
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%o5
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x80,	 1
	nop
	set	0x33, %o3
	ldub	[%l7 + %o3],	%l3
	set	0x24, %l5
	stwa	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f16
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x88
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x80
	nop
	set	0x18, %l2
	stx	%i2,	[%l7 + %l2]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	nop
	set	0x24, %g6
	stb	%l6,	[%l7 + %g6]
	ld	[%l7 + 0x18],	%f28
	ld	[%l7 + 0x48],	%f29
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x50, %g3
	ldub	[%l7 + %g3],	%g5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x81
	set	0x60, %g4
	swapa	[%l7 + %g4] 0x81,	%l5
	st	%fsr,	[%l7 + 0x0C]
	set	0x1D, %i2
	ldstuba	[%l7 + %i2] 0x89,	%l2
	set	0x4B, %o6
	stba	%l1,	[%l7 + %o6] 0x89
	nop
	set	0x38, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x61, %l4
	ldub	[%l7 + %l4],	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%o7
	set	0x61, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o6
	nop
	set	0x64, %l6
	swap	[%l7 + %l6],	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%g7
	bn,a	%xcc,	loop_190
	fpadd16s	%f23,	%f27,	%f0
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x48, %g5
	std	%i0,	[%l7 + %g5]
loop_190:
	nop
	set	0x14, %o5
	ldsw	[%l7 + %o5],	%i5
	nop
	set	0x1C, %i5
	ldsw	[%l7 + %i5],	%o3
	nop
	set	0x24, %o1
	ldsb	[%l7 + %o1],	%o1
	set	0x60, %o2
	stwa	%o0,	[%l7 + %o2] 0x88
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x80,	 2
	nop
	nop
	setx	0x56AEFD12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xC2D9320A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f1,	%f26
	set	0x2E, %i1
	stha	%o4,	[%l7 + %i1] 0x89
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xe2,	%i0
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x89,	%f22
	and	%i4,	%i7,	%i3
	nop
	set	0x50, %i6
	stw	%g1,	[%l7 + %i6]
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%o4
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x89,	 2
	and	%g6,	%i2,	%l6
	fpsub16s	%f12,	%f12,	%f24
	st	%f9,	[%l7 + 0x40]
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%g4
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f8
	nop
	set	0x3A, %i0
	lduh	[%l7 + %i0],	%l5
	nop
	set	0x1C, %l2
	stw	%g5,	[%l7 + %l2]
	nop
	set	0x20, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%f12
	set	0x18, %i4
	ldxa	[%l7 + %i4] 0x81,	%l2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x449, 	%sys_tick_cmpr
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%l0
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f18
	nop
	set	0x1A, %g4
	ldsb	[%l7 + %g4],	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%g2
	nop
	set	0x70, %o7
	std	%g6,	[%l7 + %o7]
	set	0x28, %i2
	sta	%f2,	[%l7 + %i2] 0x88
	nop
	set	0x3A, %o4
	ldstub	[%l7 + %o4],	%o6
	nop
	set	0x38, %l4
	ldsw	[%l7 + %l4],	%g3
	set	0x7A, %o6
	stha	%i1,	[%l7 + %o6] 0x80
	set	0x7C, %g1
	ldstuba	[%l7 + %g1] 0x81,	%o3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o1
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%f6
	set	0x4C, %o0
	stwa	%o2,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%o4
	set	0x08, %o5
	prefetcha	[%l7 + %o5] 0x81,	 4
	nop
	set	0x68, %o1
	stb	%o0,	[%l7 + %o1]
	nop
	set	0x70, %o2
	prefetch	[%l7 + %o2],	 1
	set	0x08, %i5
	ldxa	[%l7 + %i5] 0x80,	%i7
	nop
	set	0x38, %i1
	std	%i4,	[%l7 + %i1]
	fpadd32	%f2,	%f26,	%f20
	nop
	set	0x78, %l3
	prefetch	[%l7 + %l3],	 2
	set	0x53, %l1
	stba	%g1,	[%l7 + %l1] 0x89
	set	0x30, %i6
	stda	%o4,	[%l7 + %i6] 0xea
	membar	#Sync
	add	%i3,	%g6,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g4
	st	%f26,	[%l7 + 0x44]
	nop
	set	0x1D, %g2
	stb	%i2,	[%l7 + %g2]
	st	%f26,	[%l7 + 0x0C]
	add	%g5,	%l2,	%l4
	nop
	set	0x18, %i3
	std	%f12,	[%l7 + %i3]
	wr	%l0,	%l5,	%pic
	set	0x4B, %l5
	stba	%l1,	[%l7 + %l5] 0x88
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x81,	%g2
	set	0x64, %l2
	lda	[%l7 + %l2] 0x88,	%f19
	add	%i6,	%o6,	%g3
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x89,	%i0
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x24, %g7
	ldub	[%l7 + %g7],	%o3
	nop
	set	0x64, %g6
	ldsw	[%l7 + %g6],	%g7
	st	%f2,	[%l7 + 0x34]
	st	%f9,	[%l7 + 0x08]
	nop
	set	0x52, %i4
	lduh	[%l7 + %i4],	%o1
	nop
	set	0x21, %l0
	ldstub	[%l7 + %l0],	%o2
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xea,	%i4
	set	0x64, %o7
	sta	%f18,	[%l7 + %o7] 0x80
	fpsub32s	%f23,	%f30,	%f6
	ld	[%l7 + 0x54],	%f15
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%i0
	set	0x28, %o4
	stxa	%o4,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%f5,	[%l7 + 0x60]
	wr	%o0,	%i4,	%pic
	or	%i7,	%g1,	%i3
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%g6
	add	%l3,	%l6,	%o5
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x89,	%g4
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xda
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%i2
	or	%g5,	%l4,	%l0
	nop
	set	0x68, %l6
	stx	%l5,	[%l7 + %l6]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f22
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd0
	set	0x48, %o2
	ldstuba	[%l7 + %o2] 0x81,	%l2
	set	0x4C, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o7
	set	0x0A, %i1
	stba	%l1,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x69, %l3
	stb	%i6,	[%l7 + %l3]
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f24
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x81,	%o6
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc0
	fpadd16	%f12,	%f28,	%f14
	nop
	set	0x64, %g2
	stw	%g3,	[%l7 + %g2]
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%o2
	nop
	set	0x79, %l5
	ldsb	[%l7 + %l5],	%i1
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x88,	%f21
	nop
	set	0x7D, %i0
	stb	%g7,	[%l7 + %i0]
	set	0x14, %g7
	swapa	[%l7 + %g7] 0x88,	%o2
	nop
	set	0x6B, %i7
	ldub	[%l7 + %i7],	%o1
	nop
	set	0x60, %i4
	stb	%i0,	[%l7 + %i4]
	add	%o4,	%i5,	%i4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x38, %g6
	ldsw	[%l7 + %g6],	%o0
	nop
	set	0x44, %g4
	swap	[%l7 + %g4],	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i7
	nop
	set	0x1C, %g3
	ldsw	[%l7 + %g3],	%g6
	nop
	set	0x38, %o7
	std	%i6,	[%l7 + %o7]
	fpadd16s	%f4,	%f14,	%f15
	set	0x24, %o4
	stwa	%l3,	[%l7 + %o4] 0x88
	nop
	set	0x7E, %l4
	ldsb	[%l7 + %l4],	%o5
	set	0x15, %i2
	stba	%g4,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x18, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f16
	st	%f23,	[%l7 + 0x14]
	nop
	set	0x40, %o6
	std	%f30,	[%l7 + %o6]
	set	0x40, %l6
	swapa	[%l7 + %l6] 0x80,	%l4
	set	0x48, %o5
	stwa	%l0,	[%l7 + %o5] 0x80
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%i2
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%l5
	add	%o7,	%l1,	%i6
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x24, %l3
	sth	%l2,	[%l7 + %l3]
	and	%g2,	%g3,	%o6
	set	0x78, %o1
	stda	%o2,	[%l7 + %o1] 0x88
	set	0x4F, %l1
	stba	%i1,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%g7
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x1C, %g2
	sta	%f11,	[%l7 + %g2] 0x80
	set	0x14, %o3
	swapa	[%l7 + %o3] 0x81,	%i0
	set	0x2C, %i6
	lda	[%l7 + %i6] 0x89,	%f26
	nop
	set	0x35, %l5
	stb	%o4,	[%l7 + %l5]
	nop
	set	0x78, %i0
	ldsw	[%l7 + %i0],	%i5
	add	%i4,	%o0,	%g1
	set	0x4D, %g7
	stba	%i3,	[%l7 + %g7] 0x80
	or	%i7,	%o1,	%l6
	nop
	set	0x6C, %l2
	lduh	[%l7 + %l2],	%l3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
	nop
	set	0x44, %i4
	lduw	[%l7 + %i4],	%o5
	set	0x44, %l0
	sta	%f28,	[%l7 + %l0] 0x80
	fpsub32s	%f11,	%f19,	%f13
	set	0x18, %g6
	stxa	%g4,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x7D, %g3
	ldstub	[%l7 + %g3],	%g6
	or	%l4,	%l0,	%i2
	and	%l5,	%g5,	%l1
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%i6
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x80,	%f29
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	ld	[%l7 + 0x40],	%f14
	set	0x30, %l4
	lda	[%l7 + %l4] 0x89,	%f3
	st	%f22,	[%l7 + 0x64]
	or	%g2,	%g3,	%o6
	nop
	set	0x33, %i2
	ldsb	[%l7 + %i2],	%o3
	wr	%i1,	%l2,	%pic
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f24
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%o2
	nop
	set	0x4A, %g1
	ldstub	[%l7 + %g1],	%g7
	set	0x50, %o5
	stwa	%i0,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%i5
	ld	[%l7 + 0x38],	%f7
	nop
	set	0x58, %o2
	ldsh	[%l7 + %o2],	%o4
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x81,	%o0
	set	0x0A, %l3
	stba	%i4,	[%l7 + %l3] 0x88
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%i3
	set	0x18, %o1
	stda	%i6,	[%l7 + %o1] 0x81
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%g1
	set	0x08, %i5
	stda	%o0,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xeb,	%l2
	nop
	set	0x34, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x58, %l5
	stx	%o5,	[%l7 + %l5]
	set	0x10, %g2
	stda	%g4,	[%l7 + %g2] 0x88
	set	0x40, %i0
	stwa	%l6,	[%l7 + %i0] 0x89
	set	0x78, %l2
	stxa	%g6,	[%l7 + %l2] 0x88
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x81,	%l4
	nop
	set	0x76, %i7
	ldub	[%l7 + %i7],	%l0
	wr	%l5,	%g5,	%y
	set	0x60, %i4
	sta	%f21,	[%l7 + %i4] 0x89
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x81,	%i2
	and	%l1,	%i6,	%g2
	nop
	set	0x2F, %g3
	ldstub	[%l7 + %g3],	%o7
	nop
	set	0x70, %o7
	stx	%fsr,	[%l7 + %o7]
	fpadd32s	%f1,	%f28,	%f29
	st	%f25,	[%l7 + 0x24]
	nop
	set	0x44, %g4
	swap	[%l7 + %g4],	%o6
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%o2
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x4C, %l0
	swap	[%l7 + %l0],	%g3
	set	0x70, %i2
	stxa	%i1,	[%l7 + %i2] 0x80
	st	%f27,	[%l7 + 0x40]
	or	%l2,	%o2,	%g7
	nop
	set	0x48, %o0
	stx	%i0,	[%l7 + %o0]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc8
	nop
	set	0x28, %g1
	stx	%o4,	[%l7 + %g1]
	nop
	set	0x30, %o6
	ldsw	[%l7 + %o6],	%i5
	set	0x19, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i4
	set	0x5A, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i3
	nop
	set	0x6E, %l6
	stb	%i7,	[%l7 + %l6]
	nop
	set	0x24, %l3
	ldstub	[%l7 + %l3],	%g1
	fpadd16	%f24,	%f28,	%f2
	nop
	set	0x30, %o5
	stx	%o0,	[%l7 + %o5]
	nop
	set	0x09, %o1
	ldsb	[%l7 + %o1],	%o1
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	set	0x36, %i5
	stha	%l3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x34, %l1
	stw	%g4,	[%l7 + %l1]
	nop
	set	0x24, %i3
	ldsh	[%l7 + %i3],	%g6
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%l4
	nop
	set	0x48, %o3
	lduh	[%l7 + %o3],	%l0
	nop
	set	0x38, %g2
	ldsw	[%l7 + %g2],	%l5
	nop
	set	0x10, %l5
	swap	[%l7 + %l5],	%g5
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	set	0x52, %i0
	stba	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x31, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i6
	set	0x4C, %i4
	stwa	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	fpadd32s	%f2,	%f17,	%f30
	st	%f7,	[%l7 + 0x60]
	nop
	set	0x10, %g6
	stx	%i2,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f16
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f4
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%o6
	fpadd32s	%f11,	%f6,	%f20
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%o7
	nop
	set	0x50, %g7
	std	%f4,	[%l7 + %g7]
	set	0x32, %l0
	stba	%o3,	[%l7 + %l0] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x30]
	bg,pn	%icc,	loop_191
	nop
	set	0x0C, %i2
	swap	[%l7 + %i2],	%g3
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x80,	%i1
loop_191:
	nop
	set	0x4C, %l4
	stwa	%o2,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f24
	set	0x50, %o6
	ldda	[%l7 + %o6] 0x81,	%g6
	add	%l2,	%i0,	%i5
	set	0x38, %g5
	stha	%i4,	[%l7 + %g5] 0x80
	st	%fsr,	[%l7 + 0x60]
	and	%o4,	%i3,	%i7
	nop
	set	0x4C, %o2
	sth	%o0,	[%l7 + %o2]
	nop
	set	0x74, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f16
	nop
	set	0x24, %o5
	stb	%o1,	[%l7 + %o5]
	nop
	set	0x2A, %i1
	sth	%o5,	[%l7 + %i1]
	nop
	set	0x58, %o1
	lduh	[%l7 + %o1],	%g1
	or	%l3,	%g6,	%l4
	nop
	set	0x74, %i5
	ldub	[%l7 + %i5],	%l0
	nop
	set	0x48, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x54, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g4
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%g5
	nop
	set	0x50, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 1
	st	%f28,	[%l7 + 0x10]
	nop
	set	0x08, %l2
	std	%f28,	[%l7 + %l2]
	nop
	set	0x2C, %l5
	stw	%l6,	[%l7 + %l5]
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xeb,	%l4
	set	0x44, %i0
	sta	%f4,	[%l7 + %i0] 0x89
	st	%fsr,	[%l7 + 0x10]
	set	0x20, %g6
	stda	%i6,	[%l7 + %g6] 0x81
	nop
	set	0x20, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x80,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o6
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%o6
	or	%g2,	%o3,	%i1
	nop
	set	0x6C, %g4
	lduh	[%l7 + %g4],	%g3
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xca
	set	0x30, %o4
	swapa	[%l7 + %o4] 0x80,	%g7
	nop
	set	0x61, %l0
	ldstub	[%l7 + %l0],	%l2
	nop
	set	0x4C, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x5C, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x54, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x89,	 3
	nop
	set	0x0B, %o6
	ldsb	[%l7 + %o6],	%i0
	nop
	set	0x38, %g5
	std	%f12,	[%l7 + %g5]
	set	0x08, %l3
	stda	%i4,	[%l7 + %l3] 0x80
	nop
	set	0x2C, %l6
	ldub	[%l7 + %l6],	%o4
	bn	%icc,	loop_192
	nop
	set	0x44, %o2
	swap	[%l7 + %o2],	%i3
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xeb,	%i6
loop_192:
	nop
	set	0x0C, %o1
	lduw	[%l7 + %o1],	%o0
	nop
	set	0x28, %o5
	ldsw	[%l7 + %o5],	%o1
	nop
	set	0x58, %l1
	std	%o4,	[%l7 + %l1]
	ld	[%l7 + 0x34],	%f2
	and	%g1,	%i4,	%g6
	nop
	set	0x6C, %i3
	stw	%l4,	[%l7 + %i3]
	set	0x50, %i5
	stwa	%l3,	[%l7 + %i5] 0x88
	nop
	set	0x70, %g2
	std	%f24,	[%l7 + %g2]
	set	0x48, %o3
	lda	[%l7 + %o3] 0x89,	%f2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%l0
	nop
	set	0x45, %i6
	ldsb	[%l7 + %i6],	%l6
	set	0x10, %l2
	lda	[%l7 + %l2] 0x88,	%f3
	set	0x10, %i7
	stxa	%g5,	[%l7 + %i7] 0x81
	or	%i6,	%l5,	%l1
	set	0x48, %l5
	sta	%f17,	[%l7 + %l5] 0x88
	nop
	set	0x0E, %g6
	ldstub	[%l7 + %g6],	%i2
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%o7
	fpsub32	%f24,	%f8,	%f2
	set	0x7C, %i0
	stwa	%o6,	[%l7 + %i0] 0xeb
	membar	#Sync
	add	%o3,	%i1,	%g2
	set	0x6C, %o7
	lda	[%l7 + %o7] 0x88,	%f16
	nop
	set	0x30, %g3
	ldub	[%l7 + %g3],	%g3
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f0
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f28
	nop
	set	0x74, %l0
	ldstub	[%l7 + %l0],	%g7
	ld	[%l7 + 0x38],	%f29
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i0
	nop
	set	0x24, %o4
	ldsw	[%l7 + %o4],	%o2
	nop
	set	0x4C, %o0
	stw	%o4,	[%l7 + %o0]
	nop
	set	0x3A, %i2
	ldub	[%l7 + %i2],	%i5
	wr	%i3,	%o0,	%set_softint
	nop
	set	0x60, %l4
	std	%i6,	[%l7 + %l4]
	or	%o1,	%g1,	%i4
	nop
	set	0x74, %o6
	lduh	[%l7 + %o6],	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%l4
	add	%l3,	%l0,	%l6
	nop
	set	0x20, %g1
	std	%g4,	[%l7 + %g1]
	nop
	set	0x2F, %l3
	ldstub	[%l7 + %l3],	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%l1
	set	0x10, %l6
	stba	%i2,	[%l7 + %l6] 0x80
	st	%f13,	[%l7 + 0x14]
	set	0x30, %g5
	stxa	%l5,	[%l7 + %g5] 0x88
	nop
	set	0x08, %o2
	std	%f22,	[%l7 + %o2]
	ld	[%l7 + 0x28],	%f28
	nop
	nop
	setx	0x9B47974901F6858A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x1A4A397B7240CC9C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f18,	%f4
	set	0x24, %o1
	swapa	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%o3
	nop
	set	0x12, %o5
	lduh	[%l7 + %o5],	%o7
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xea,	%i0
	nop
	set	0x28, %i3
	swap	[%l7 + %i3],	%g3
	nop
	set	0x32, %i5
	ldsh	[%l7 + %i5],	%g2
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f26
	nop
	set	0x6E, %i6
	sth	%g7,	[%l7 + %i6]
	nop
	set	0x57, %l2
	ldub	[%l7 + %l2],	%l2
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%i0
	nop
	set	0x77, %l5
	stb	%o4,	[%l7 + %l5]
	set	0x18, %g6
	stxa	%i5,	[%l7 + %g6] 0x80
	set	0x24, %i4
	sta	%f27,	[%l7 + %i4] 0x81
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f20
	nop
	set	0x70, %o7
	sth	%i3,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	ld	[%l7 + 0x40],	%f7
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%o1
	ld	[%l7 + 0x68],	%f31
	wr 	%g0, 	0x4, 	%fprs
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x88,	 3
	set	0x60, %g4
	prefetcha	[%l7 + %g4] 0x88,	 3
	nop
	set	0x1E, %o4
	ldsb	[%l7 + %o4],	%l4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%l0
	nop
	set	0x38, %o0
	stb	%l6,	[%l7 + %o0]
	add	%g4,	%i6,	%o5
	nop
	set	0x08, %i2
	lduw	[%l7 + %i2],	%l1
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f20
	set	0x7A, %o6
	stba	%g5,	[%l7 + %o6] 0x89
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%i2
	st	%f23,	[%l7 + 0x64]
	nop
	set	0x6A, %l3
	ldsh	[%l7 + %l3],	%o6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe3,	%l4
	fpsub32	%f2,	%f26,	%f30
	nop
	set	0x08, %g5
	std	%o6,	[%l7 + %g5]
	nop
	set	0x30, %o2
	std	%f28,	[%l7 + %o2]
	ld	[%l7 + 0x74],	%f28
	and	%o3,	%g3,	%g2
	nop
	set	0x08, %o1
	std	%f10,	[%l7 + %o1]
	fpsub32s	%f2,	%f15,	%f6
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%g6
	nop
	set	0x64, %l1
	stw	%i1,	[%l7 + %l1]
	nop
	set	0x38, %i1
	std	%f2,	[%l7 + %i1]
	set	0x58, %i5
	stba	%l2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x08, %i3
	stx	%fsr,	[%l7 + %i3]
	and	%i0,	%o4,	%i5
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%i3
	st	%f14,	[%l7 + 0x38]
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%i7
	nop
	set	0x46, %l2
	ldub	[%l7 + %l2],	%o1
	or	%o2,	%i4,	%g6
	nop
	set	0x54, %o3
	swap	[%l7 + %o3],	%g1
	ld	[%l7 + 0x1C],	%f11
	set	0x70, %g6
	stxa	%l4,	[%l7 + %g6] 0x89
	bn	%icc,	loop_193
	nop
	set	0x60, %l5
	std	%f0,	[%l7 + %l5]
	set	0x5C, %i7
	stwa	%o0,	[%l7 + %i7] 0xe3
	membar	#Sync
loop_193:
	nop
	set	0x08, %i4
	ldxa	[%l7 + %i4] 0x88,	%l3
	set	0x78, %g3
	sta	%f18,	[%l7 + %g3] 0x80
	set	0x70, %o7
	stda	%l0,	[%l7 + %o7] 0x89
	ba,a	%xcc,	loop_194
	or	%g4,	%i6,	%o5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l1
loop_194:
	st	%fsr,	[%l7 + 0x4C]
	set	0x48, %i0
	stda	%i2,	[%l7 + %i0] 0x81
	nop
	set	0x18, %g7
	std	%o6,	[%l7 + %g7]
	set	0x4F, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l5
	set	0x7A, %o4
	ldstuba	[%l7 + %o4] 0x88,	%o7
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	ld	[%l7 + 0x58],	%f25
	nop
	set	0x70, %o0
	lduw	[%l7 + %o0],	%g5
	add	%g3,	%g2,	%g7
	set	0x50, %i2
	lda	[%l7 + %i2] 0x80,	%f7
	set	0x50, %o6
	stxa	%o3,	[%l7 + %o6] 0x88
	nop
	set	0x14, %l4
	ldsw	[%l7 + %l4],	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%o4
	wr 	%g0, 	0x4, 	%fprs
	set	0x72, %l3
	stha	%i5,	[%l7 + %l3] 0x89
	nop
	set	0x59, %l6
	stb	%i7,	[%l7 + %l6]
	st	%f1,	[%l7 + 0x6C]
	set	0x1D, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o1
	set	0x7C, %o2
	stba	%o2,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x48, %o1
	stx	%g6,	[%l7 + %o1]
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%i4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f16
	nop
	set	0x24, %i1
	lduw	[%l7 + %i1],	%l4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%l3
	nop
	set	0x10, %i5
	ldsw	[%l7 + %i5],	%l0
	nop
	set	0x1E, %i3
	ldub	[%l7 + %i3],	%g4
	wr	%i6,	%o5,	%pic
	nop
	set	0x3A, %g2
	ldub	[%l7 + %g2],	%o0
	bn,a	%xcc,	loop_195
	nop
	set	0x50, %o5
	ldsw	[%l7 + %o5],	%l6
	st	%f8,	[%l7 + 0x70]
	set	0x50, %l2
	stha	%i2,	[%l7 + %l2] 0xea
	membar	#Sync
loop_195:
	nop
	set	0x10, %i6
	stw	%o6,	[%l7 + %i6]
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x89,	%l5
	nop
	set	0x34, %l5
	ldstub	[%l7 + %l5],	%o7
	ble,a	%xcc,	loop_196
	nop
	set	0x0C, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x44, %i7
	lduw	[%l7 + %i7],	%g5
	nop
	set	0x18, %i4
	ldsw	[%l7 + %i4],	%g3
loop_196:
	st	%f9,	[%l7 + 0x3C]
	nop
	set	0x0A, %o7
	sth	%g2,	[%l7 + %o7]
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x81,	%g7
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	and	%l1,	%l2,	%i1
	nop
	set	0x50, %g3
	std	%f14,	[%l7 + %g3]
	nop
	set	0x6E, %o4
	stb	%o3,	[%l7 + %o4]
	nop
	set	0x28, %l0
	swap	[%l7 + %l0],	%o4
	nop
	set	0x58, %g4
	ldsb	[%l7 + %g4],	%i3
	nop
	set	0x5D, %i2
	ldsb	[%l7 + %i2],	%i0
	nop
	set	0x28, %o0
	lduw	[%l7 + %o0],	%i5
	st	%fsr,	[%l7 + 0x54]
	st	%f13,	[%l7 + 0x6C]
	nop
	set	0x64, %l4
	prefetch	[%l7 + %l4],	 3
	set	0x30, %l3
	lda	[%l7 + %l3] 0x88,	%f5
	st	%fsr,	[%l7 + 0x1C]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	nop
	set	0x2F, %g5
	ldub	[%l7 + %g5],	%o1
	nop
	set	0x64, %o2
	ldub	[%l7 + %o2],	%i7
	nop
	set	0x54, %l6
	ldsh	[%l7 + %l6],	%o2
	set	0x70, %g1
	stwa	%i4,	[%l7 + %g1] 0x88
	or	%g6,	%g1,	%l4
	nop
	set	0x38, %o1
	stx	%l3,	[%l7 + %o1]
	set	0x68, %i1
	stxa	%g4,	[%l7 + %i1] 0x89
	add	%i6,	%o5,	%o0
	wr	%l0,	%i2,	%softint
	nop
	set	0x20, %i5
	ldsh	[%l7 + %i5],	%l6
	nop
	set	0x50, %l1
	ldx	[%l7 + %l1],	%l5
	set	0x08, %g2
	stda	%o6,	[%l7 + %g2] 0xea
	membar	#Sync
	and	%g5,	%o7,	%g3
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc0
	nop
	set	0x1B, %l2
	stb	%g2,	[%l7 + %l2]
	nop
	set	0x2B, %i6
	ldub	[%l7 + %i6],	%l1
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x80,	%g7
	bge,a	%xcc,	loop_197
	nop
	set	0x7B, %l5
	ldstub	[%l7 + %l5],	%i1
	and	%o3,	%o4,	%i3
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%l2
loop_197:
	nop
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xea,	%i4
	nop
	set	0x7C, %i4
	lduw	[%l7 + %i4],	%o1
	st	%fsr,	[%l7 + 0x14]
	ld	[%l7 + 0x2C],	%f12
	nop
	set	0x5E, %o7
	lduh	[%l7 + %o7],	%i7
	nop
	set	0x62, %i0
	sth	%i0,	[%l7 + %i0]
	nop
	set	0x68, %i7
	std	%i4,	[%l7 + %i7]
	set	0x58, %g7
	stxa	%o2,	[%l7 + %g7] 0x81
	and	%g1,	%g6,	%l3
	and	%g4,	%l4,	%o5
	and	%i6,	%o0,	%l0
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x48, %l0
	stxa	%l6,	[%l7 + %l0] 0x81
	set	0x20, %o4
	ldxa	[%l7 + %o4] 0x81,	%i2
	set	0x6C, %g4
	sta	%f3,	[%l7 + %g4] 0x81
	nop
	set	0x68, %o0
	std	%l4,	[%l7 + %o0]
	add	%g5,	%o7,	%g3
	set	0x28, %i2
	stxa	%g2,	[%l7 + %i2] 0x80
	set	0x58, %l4
	stxa	%l1,	[%l7 + %l4] 0xea
	membar	#Sync
	fpsub16	%f0,	%f24,	%f28
	bleu,pt	%icc,	loop_198
	nop
	set	0x0D, %l3
	ldsb	[%l7 + %l3],	%o6
	nop
	set	0x10, %g5
	std	%i0,	[%l7 + %g5]
	set	0x3C, %o6
	swapa	[%l7 + %o6] 0x88,	%o3
loop_198:
	nop
	set	0x6A, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g7
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%o4
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%i3
	set	0x08, %i1
	swapa	[%l7 + %i1] 0x81,	%i5
	nop
	set	0x52, %o1
	sth	%l2,	[%l7 + %o1]
	set	0x4A, %l1
	stba	%i7,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x0C, %g2
	sth	%i0,	[%l7 + %g2]
	set	0x24, %o5
	stba	%o1,	[%l7 + %o5] 0x80
	nop
	set	0x0C, %l2
	ldsw	[%l7 + %l2],	%i4
	nop
	set	0x0D, %i5
	ldstub	[%l7 + %i5],	%o2
	nop
	set	0x64, %i3
	stw	%g6,	[%l7 + %i3]
	nop
	set	0x38, %i6
	swap	[%l7 + %i6],	%g1
	set	0x40, %g6
	stxa	%l3,	[%l7 + %g6] 0x81
	nop
	set	0x68, %o3
	stw	%g4,	[%l7 + %o3]
	or	%o5,	%i6,	%o0
	set	0x20, %l5
	stda	%l4,	[%l7 + %l5] 0x80
	nop
	set	0x18, %i4
	ldsh	[%l7 + %i4],	%l6
	nop
	set	0x2C, %i0
	swap	[%l7 + %i0],	%l0
	nop
	set	0x75, %i7
	stb	%i2,	[%l7 + %i7]
	or	%l5,	%g5,	%o7
	nop
	set	0x08, %o7
	ldsh	[%l7 + %o7],	%g2
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%g2
	nop
	set	0x2D, %l0
	ldsb	[%l7 + %l0],	%o6
	set	0x13, %g7
	stba	%l1,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x3C, %o4
	sta	%f0,	[%l7 + %o4] 0x89
	wr	%i1,	%o3,	%set_softint
	nop
	set	0x50, %o0
	ldsw	[%l7 + %o0],	%g7
	nop
	set	0x78, %i2
	std	%o4,	[%l7 + %i2]
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f8
	set	0x24, %l3
	stwa	%i3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x89
	bne,a,pn	%xcc,	loop_199
	nop
	set	0x7A, %l6
	ldstub	[%l7 + %l6],	%i5
	set	0x40, %g4
	stba	%i7,	[%l7 + %g4] 0x88
loop_199:
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%l2
	set	0x35, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i0
	nop
	set	0x52, %o1
	sth	%o1,	[%l7 + %o1]
	or	%o2,	%i4,	%g1
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%f4
	bn,a	%xcc,	loop_200
	st	%fsr,	[%l7 + 0x44]
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x80,	%g6
loop_200:
	nop
	set	0x08, %g2
	sth	%l3,	[%l7 + %g2]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%g4
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%i6
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f16
	nop
	set	0x4B, %i3
	stb	%l4,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f0
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%f22
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%l6
	nop
	set	0x53, %l5
	ldsb	[%l7 + %l5],	%o0
	or	%i2,	%l5,	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g2
	nop
	set	0x7D, %i4
	stb	%g5,	[%l7 + %i4]
	nop
	set	0x1A, %i0
	ldsh	[%l7 + %i0],	%g3
	set	0x11, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o6
	nop
	set	0x2C, %o7
	lduw	[%l7 + %o7],	%l1
	nop
	set	0x18, %g6
	stx	%i1,	[%l7 + %g6]
	nop
	set	0x64, %g3
	prefetch	[%l7 + %g3],	 3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o4
	nop
	set	0x65, %l0
	ldsb	[%l7 + %l0],	%i3
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%g7
	and	%i7,	%i5,	%i0
	set	0x44, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o1
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x16, %i2
	ldsh	[%l7 + %i2],	%o2
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%l2
	set	0x48, %o0
	sta	%f16,	[%l7 + %o0] 0x81
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x88
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%i4
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	bgu,a	%icc,	loop_201
	nop
	set	0x18, %o2
	ldsw	[%l7 + %o2],	%g6
	nop
	set	0x18, %l6
	sth	%l3,	[%l7 + %l6]
	set	0x64, %o1
	stba	%o5,	[%l7 + %o1] 0xe2
	membar	#Sync
loop_201:
	nop
	set	0x78, %l1
	sth	%g1,	[%l7 + %l1]
	set	0x3D, %i1
	stba	%g4,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x30, %g1
	stx	%l4,	[%l7 + %g1]
	nop
	set	0x08, %g2
	sth	%l6,	[%l7 + %g2]
	nop
	set	0x44, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x78, %o5
	sta	%f24,	[%l7 + %o5] 0x88
	ld	[%l7 + 0x28],	%f21
	set	0x08, %i6
	lda	[%l7 + %i6] 0x81,	%f27
	nop
	set	0x6A, %i3
	ldsh	[%l7 + %i3],	%i6
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x89,	%o0
	or	%i2,	%l5,	%o7
	set	0x49, %l2
	ldstuba	[%l7 + %l2] 0x80,	%g2
	nop
	set	0x3C, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x38, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x7A, %i4
	ldsh	[%l7 + %i4],	%g5
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%l0
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%g3
	nop
	set	0x2C, %g3
	stw	%o6,	[%l7 + %g3]
	nop
	set	0x48, %l0
	stw	%i1,	[%l7 + %l0]
	nop
	set	0x38, %g6
	stx	%l1,	[%l7 + %g6]
	nop
	set	0x10, %o4
	stw	%o4,	[%l7 + %o4]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f4
	nop
	set	0x78, %g7
	ldsb	[%l7 + %g7],	%i3
	nop
	set	0x28, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x36, %o0
	sth	%g7,	[%l7 + %o0]
	bleu	%icc,	loop_202
	nop
	set	0x38, %l3
	ldx	[%l7 + %l3],	%i7
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	nop
	setx	0xD7176B220EDF5129,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x75F192156621A500,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f4,	%f14
loop_202:
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%o3
	set	0x48, %g4
	stxa	%i5,	[%l7 + %g4] 0x80
	fpadd16s	%f25,	%f5,	%f1
	fpadd32s	%f6,	%f29,	%f9
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xe2,	%o0
	nop
	set	0x3A, %l6
	ldub	[%l7 + %l6],	%o2
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%l2
	nop
	set	0x18, %i1
	ldx	[%l7 + %i1],	%i4
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%g6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%l3
	or	%o5,	%g4,	%l4
	nop
	set	0x1E, %l1
	sth	%l6,	[%l7 + %l1]
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%g1
	nop
	set	0x2E, %g2
	ldstub	[%l7 + %g2],	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%o0
	and	%l5,	%o7,	%g5
	set	0x14, %i6
	swapa	[%l7 + %i6] 0x88,	%g2
	set	0x53, %i3
	stba	%l0,	[%l7 + %i3] 0x88
	or	%o6,	%g3,	%i1
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%f12
	set	0x4B, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o4
	nop
	set	0x52, %l5
	ldsh	[%l7 + %l5],	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g7
	nop
	set	0x10, %i0
	ldsw	[%l7 + %i0],	%o3
	nop
	set	0x1A, %l2
	sth	%i5,	[%l7 + %l2]
	set	0x30, %i4
	stha	%i7,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x30, %i7
	swapa	[%l7 + %i7] 0x88,	%o1
	nop
	set	0x4F, %g3
	ldstub	[%l7 + %g3],	%o2
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%i4
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x89,	%l2
	nop
	set	0x5C, %o4
	lduh	[%l7 + %o4],	%i0
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x5C, %g7
	swapa	[%l7 + %g7] 0x80,	%l3
	nop
	set	0x60, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x60, %o0
	lduw	[%l7 + %o0],	%o5
	nop
	set	0x3C, %l4
	sth	%g4,	[%l7 + %l4]
	set	0x1A, %g5
	ldstuba	[%l7 + %g5] 0x80,	%g6
	set	0x58, %l3
	stwa	%l6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x38, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x2C, %o2
	sth	%g1,	[%l7 + %o2]
	set	0x1C, %g4
	swapa	[%l7 + %g4] 0x88,	%i6
	nop
	set	0x13, %l6
	ldstub	[%l7 + %l6],	%l4
	nop
	set	0x08, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x58, %g1
	std	%f2,	[%l7 + %g1]
	nop
	set	0x6C, %i1
	swap	[%l7 + %i1],	%o0
	nop
	set	0x08, %i5
	ldx	[%l7 + %i5],	%l5
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x81,	%o7
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%i2
	bgu,a	%icc,	loop_203
	and	%g2,	%g5,	%l0
	nop
	set	0x22, %g2
	lduh	[%l7 + %g2],	%g3
	nop
	set	0x1E, %i3
	sth	%i1,	[%l7 + %i3]
loop_203:
	nop
	set	0x60, %o3
	sta	%f11,	[%l7 + %o3] 0x88
	set	0x68, %l5
	swapa	[%l7 + %l5] 0x80,	%o4
	nop
	set	0x34, %o5
	ldsh	[%l7 + %o5],	%o6
	or	%i3,	%l1,	%o3
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%g7
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%i6
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%f16
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%o0
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x64, %l2
	sth	%i5,	[%l7 + %l2]
	ld	[%l7 + 0x2C],	%f5
	nop
	set	0x18, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x16, %g6
	ldsh	[%l7 + %g6],	%o2
	st	%f13,	[%l7 + 0x50]
	nop
	set	0x30, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x50, %g7
	stda	%l2,	[%l7 + %g7] 0x89
	nop
	set	0x5A, %o7
	stb	%i0,	[%l7 + %o7]
	nop
	set	0x68, %o4
	std	%i4,	[%l7 + %o4]
	nop
	set	0x48, %l4
	std	%l2,	[%l7 + %l4]
	set	0x58, %o0
	lda	[%l7 + %o0] 0x81,	%f11
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x80,	%f31
	add	%o5,	%g4,	%l6
	or	%g1,	%i6,	%l4
	fpsub16s	%f18,	%f24,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%g6
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	set	0x54, %l3
	swapa	[%l7 + %l3] 0x89,	%o7
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x89,	%i2
	nop
	set	0x60, %g4
	stx	%g5,	[%l7 + %g4]
	nop
	set	0x28, %l6
	swap	[%l7 + %l6],	%l0
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%g2
	fpsub32s	%f30,	%f0,	%f25
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f22
	and	%i1,	%g3,	%o6
	set	0x78, %i5
	stxa	%o4,	[%l7 + %i5] 0x80
	nop
	set	0x79, %g1
	stb	%i3,	[%l7 + %g1]
	nop
	set	0x6B, %i6
	ldub	[%l7 + %i6],	%o3
	set	0x6A, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g7
	set	0x7C, %g2
	swapa	[%l7 + %g2] 0x89,	%i7
	nop
	set	0x57, %i3
	ldstub	[%l7 + %i3],	%l1
	nop
	set	0x40, %o3
	swap	[%l7 + %o3],	%i5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%o2
	nop
	set	0x10, %o5
	std	%i0,	[%l7 + %o5]
	set	0x40, %l5
	stxa	%l2,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%l2
	st	%fsr,	[%l7 + 0x74]
	set	0x08, %i0
	ldxa	[%l7 + %i0] 0x88,	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o5
	add	%g1,	%i6,	%l6
	wr	%l4,	%o0,	%clear_softint
	or	%g6,	%o7,	%l5
	nop
	set	0x5C, %i7
	stw	%i2,	[%l7 + %i7]
	ld	[%l7 + 0x6C],	%f24
	nop
	set	0x42, %l2
	ldsb	[%l7 + %l2],	%g5
	set	0x0A, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g2
	nop
	set	0x68, %l0
	stw	%l0,	[%l7 + %l0]
	nop
	set	0x68, %i2
	lduw	[%l7 + %i2],	%g3
	set	0x4A, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i1
	nop
	set	0x08, %o7
	ldx	[%l7 + %o7],	%o4
	nop
	set	0x08, %o4
	lduw	[%l7 + %o4],	%o6
	and	%o3,	%g7,	%i3
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x28, %g6
	stda	%l0,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc0
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x1E, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i7
	nop
	set	0x58, %l3
	stx	%o1,	[%l7 + %l3]
	st	%f24,	[%l7 + 0x38]
	nop
	set	0x5A, %g4
	sth	%o2,	[%l7 + %g4]
	or	%i5,	%l2,	%l3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f0
	set	0x60, %o1
	stda	%i0,	[%l7 + %o1] 0x89
	nop
	set	0x58, %l6
	stw	%g4,	[%l7 + %l6]
	set	0x24, %i1
	stha	%i4,	[%l7 + %i1] 0x80
	nop
	set	0x27, %g1
	ldsb	[%l7 + %g1],	%g1
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x80,	%i6
	add	%o5,	%l4,	%o0
	nop
	set	0x20, %i5
	stx	%l6,	[%l7 + %i5]
	nop
	set	0x10, %l1
	std	%o6,	[%l7 + %l1]
	nop
	set	0x2A, %i3
	ldsh	[%l7 + %i3],	%g6
	set	0x3C, %g2
	stha	%l5,	[%l7 + %g2] 0x89
	or	%g5,	%i2,	%g2
	nop
	set	0x14, %o5
	sth	%l0,	[%l7 + %o5]
	and	%i1,	%g3,	%o6
	nop
	set	0x0A, %o3
	lduh	[%l7 + %o3],	%o4
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f2
	nop
	set	0x68, %i0
	std	%o2,	[%l7 + %i0]
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x88,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x97A, 	%tick_cmpr
	nop
	set	0x47, %i7
	ldstub	[%l7 + %i7],	%i7
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x80,	 2
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f16
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%o2
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%i5
	nop
	set	0x58, %g7
	swap	[%l7 + %g7],	%l2
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f30
	ld	[%l7 + 0x54],	%f11
	nop
	set	0x60, %g6
	stx	%i0,	[%l7 + %g6]
	and	%l3,	%i4,	%g1
	add	%g4,	%o5,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%i6
	nop
	set	0x3C, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x48, %o4
	lduw	[%l7 + %o4],	%o7
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x4E, %l3
	lduh	[%l7 + %l3],	%l6
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x89,	%l4
	set	0x30, %o6
	sta	%f16,	[%l7 + %o6] 0x81
	nop
	set	0x12, %o1
	sth	%g5,	[%l7 + %o1]
	add	%g6,	%g2,	%i2
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%l0
	set	0x3C, %l6
	swapa	[%l7 + %l6] 0x81,	%g3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x88
	set	0x08, %g1
	stda	%o6,	[%l7 + %g1] 0x88
	set	0x40, %i5
	stda	%o4,	[%l7 + %i5] 0x81
	st	%f1,	[%l7 + 0x20]
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o3
	set	0x14, %i3
	stwa	%i1,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x70, %l1
	lduh	[%l7 + %l1],	%g7
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xca
	nop
	set	0x3E, %g2
	sth	%l1,	[%l7 + %g2]
	nop
	set	0x54, %o3
	swap	[%l7 + %o3],	%i3
	set	0x24, %i0
	stwa	%i7,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x88,	%o1
	set	0x4C, %l5
	stha	%o2,	[%l7 + %l5] 0x80
	nop
	set	0x34, %i7
	swap	[%l7 + %i7],	%i5
	set	0x38, %l2
	swapa	[%l7 + %l2] 0x88,	%i0
	nop
	set	0x15, %i2
	ldub	[%l7 + %i2],	%l3
	nop
	set	0x5E, %g3
	ldub	[%l7 + %g3],	%i4
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	nop
	set	0x40, %g7
	stw	%l2,	[%l7 + %g7]
	and	%g4,	%l4,	%o5
	set	0x42, %l4
	stha	%i6,	[%l7 + %l4] 0x89
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	nop
	set	0x35, %g6
	stb	%l6,	[%l7 + %g6]
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x81,	 1
	set	0x59, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g5
	nop
	set	0x40, %o4
	std	%o0,	[%l7 + %o4]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf0
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x3A, %g4
	sth	%g6,	[%l7 + %g4]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%i2
	nop
	set	0x34, %o1
	ldstub	[%l7 + %o1],	%l0
	ld	[%l7 + 0x7C],	%f29
	and	%g3,	%g2,	%o6
	nop
	nop
	setx	0x904CF942,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x18CE9EEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f15,	%f9
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%o3
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f26
	wr	%o4,	%i1,	%softint
	bge,a	%xcc,	loop_204
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f18
	set	0x44, %i6
	stwa	%g7,	[%l7 + %i6] 0x81
loop_204:
	nop
	set	0x64, %i3
	swap	[%l7 + %i3],	%i3
	nop
	set	0x0E, %l1
	sth	%l1,	[%l7 + %l1]
	set	0x40, %l6
	prefetcha	[%l7 + %l6] 0x89,	 1
	nop
	set	0x70, %o5
	lduh	[%l7 + %o5],	%i7
	nop
	set	0x34, %g2
	stb	%o2,	[%l7 + %g2]
	nop
	set	0x48, %i0
	ldd	[%l7 + %i0],	%f22
	set	0x24, %o3
	sta	%f23,	[%l7 + %o3] 0x88
	set	0x70, %i4
	lda	[%l7 + %i4] 0x81,	%f20
	add	%i5,	%l3,	%i4
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%i0
	nop
	set	0x20, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x30, %l2
	std	%f30,	[%l7 + %l2]
	set	0x2C, %i2
	stha	%l2,	[%l7 + %i2] 0x81
	nop
	set	0x48, %o7
	stw	%g4,	[%l7 + %o7]
	nop
	set	0x72, %g3
	stb	%l4,	[%l7 + %g3]
	nop
	set	0x60, %g7
	stx	%g1,	[%l7 + %g7]
	set	0x5F, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%l6
	nop
	set	0x78, %l4
	stx	%i6,	[%l7 + %l4]
	nop
	set	0x39, %g5
	ldsb	[%l7 + %g5],	%g5
	nop
	set	0x3D, %o0
	stb	%l5,	[%l7 + %o0]
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x89,	%o0
	or	%g6,	%l0,	%g3
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x88,	%i2
	nop
	set	0x38, %l3
	std	%f26,	[%l7 + %l3]
	nop
	set	0x54, %g4
	lduh	[%l7 + %g4],	%o6
	st	%f29,	[%l7 + 0x70]
	set	0x66, %o2
	stha	%g2,	[%l7 + %o2] 0x81
	and	%o4,	%i1,	%g7
	set	0x48, %o1
	stxa	%i3,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x1A, %i1
	lduh	[%l7 + %i1],	%o3
	st	%fsr,	[%l7 + 0x2C]
	set	0x78, %g1
	stda	%o0,	[%l7 + %g1] 0x80
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x81,	%l1
	nop
	set	0x42, %i6
	ldsh	[%l7 + %i6],	%i7
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xe3,	%i4
	nop
	set	0x50, %l1
	ldstub	[%l7 + %l1],	%l3
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	bgu,a	%icc,	loop_205
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%o2
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0
loop_205:
	nop
	set	0x3B, %i0
	stb	%i4,	[%l7 + %i0]
	nop
	set	0x73, %g2
	ldub	[%l7 + %g2],	%l2
	nop
	set	0x28, %o3
	std	%f4,	[%l7 + %o3]
	nop
	set	0x48, %i4
	ldsw	[%l7 + %i4],	%g4
	ble,pt	%icc,	loop_206
	nop
	set	0x6E, %l5
	sth	%g1,	[%l7 + %l5]
	nop
	set	0x08, %l2
	stx	%fsr,	[%l7 + %l2]
	fpsub32s	%f1,	%f18,	%f27
loop_206:
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%o4
	nop
	set	0x19, %i7
	stb	%l4,	[%l7 + %i7]
	nop
	set	0x34, %g3
	swap	[%l7 + %g3],	%o7
	nop
	set	0x3C, %g7
	swap	[%l7 + %g7],	%i6
	set	0x28, %l0
	stba	%l6,	[%l7 + %l0] 0x80
	fpsub16	%f30,	%f26,	%f18
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%o0
	add	%g5,	%g6,	%l0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xca
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%g2
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xda
	set	0x0F, %g6
	stba	%i2,	[%l7 + %g6] 0x88
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x81,	%o6
	nop
	set	0x08, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x50, %l3
	stx	%g2,	[%l7 + %l3]
	nop
	set	0x18, %o2
	stx	%i1,	[%l7 + %o2]
	set	0x37, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%o4
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l1
	set	0x50, %g1
	stwa	%i5,	[%l7 + %g1] 0xe3
	membar	#Sync
	add	%i7,	%o2,	%i0
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%i4
	nop
	set	0x2C, %o6
	sth	%l3,	[%l7 + %o6]
	nop
	set	0x46, %i5
	ldstub	[%l7 + %i5],	%g4
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	ld	[%l7 + 0x54],	%f9
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	set	0x0A, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l2
	set	0x64, %i3
	stwa	%o5,	[%l7 + %i3] 0x81
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%f24
	set	0x79, %g2
	ldstuba	[%l7 + %g2] 0x88,	%l4
	nop
	set	0x54, %o3
	swap	[%l7 + %o3],	%o7
	fpsub16	%f2,	%f26,	%f26
	nop
	set	0x50, %i4
	std	%i6,	[%l7 + %i4]
	fpsub32	%f4,	%f12,	%f14
	set	0x3E, %i0
	stha	%l6,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%l4
	nop
	set	0x64, %i2
	ldstub	[%l7 + %i2],	%o0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f16
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x89,	 4
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf8
	membar	#Sync
	nop
	set	0x40, %g7
	std	%g0,	[%l7 + %g7]
	nop
	set	0x4F, %l0
	ldstub	[%l7 + %l0],	%g6
	set	0x70, %o7
	stda	%l0,	[%l7 + %o7] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x22, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x6C, %o0
	sth	%o6,	[%l7 + %o0]
	set	0x64, %g6
	swapa	[%l7 + %g6] 0x81,	%i2
	set	0x20, %l4
	stxa	%g2,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x78, %l3
	std	%f28,	[%l7 + %l3]
	nop
	set	0x7E, %o4
	lduh	[%l7 + %o4],	%i1
	set	0x60, %o2
	lda	[%l7 + %o2] 0x89,	%f26
	set	0x20, %g4
	stda	%i2,	[%l7 + %g4] 0x89
	set	0x3C, %o1
	swapa	[%l7 + %o1] 0x80,	%o4
	nop
	set	0x1A, %i1
	ldsh	[%l7 + %i1],	%o1
	set	0x7E, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g7
	set	0x34, %i5
	swapa	[%l7 + %i5] 0x81,	%l1
	or	%o3,	%i7,	%i5
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	nop
	set	0x0C, %l6
	prefetch	[%l7 + %l6],	 2
	set	0x58, %l1
	stda	%o2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x7C, %i3
	swap	[%l7 + %i3],	%i4
	set	0x28, %o5
	stxa	%l3,	[%l7 + %o5] 0xe3
	membar	#Sync
	or	%g4,	%i0,	%o5
	set	0x38, %g2
	prefetcha	[%l7 + %g2] 0x80,	 3
	set	0x54, %o3
	stha	%l4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%i6
	nop
	set	0x48, %i0
	std	%f20,	[%l7 + %i0]
	add	%l6,	%l5,	%o7
	nop
	set	0x4C, %g1
	stw	%g5,	[%l7 + %g1]
	wr	%o0,	%g1,	%y
	wr	%g6,	%l0,	%ccr
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%f0
	set	0x68, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	ld	[%l7 + 0x44],	%f7
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x28, %i7
	stw	%o6,	[%l7 + %i7]
	st	%f17,	[%l7 + 0x3C]
	nop
	set	0x34, %g7
	stb	%g2,	[%l7 + %g7]
	nop
	set	0x48, %g3
	ldsh	[%l7 + %g3],	%i2
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	set	0x45, %g6
	stba	%o4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f30
	add	%i3,	%o1,	%l1
	set	0x14, %o2
	sta	%f29,	[%l7 + %o2] 0x88
	set	0x18, %g4
	stda	%o2,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x48, %o4
	stda	%i6,	[%l7 + %o4] 0x88
	set	0x5C, %i1
	lda	[%l7 + %i1] 0x81,	%f24
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%i5
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%o2
	or	%g7,	%l3,	%g4
	add	%i0,	%i4,	%o5
	nop
	set	0x2E, %i5
	lduh	[%l7 + %i5],	%l4
	nop
	set	0x50, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf9
	membar	#Sync
	nop
	set	0x34, %l1
	ldsh	[%l7 + %l1],	%l2
	nop
	set	0x56, %o5
	sth	%i6,	[%l7 + %o5]
	set	0x76, %g2
	stha	%l6,	[%l7 + %g2] 0x80
	nop
	set	0x10, %i3
	stb	%o7,	[%l7 + %i3]
	nop
	set	0x42, %i4
	ldstub	[%l7 + %i4],	%l5
	nop
	set	0x5C, %o3
	ldsw	[%l7 + %o3],	%g5
	set	0x1F, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o0
	st	%fsr,	[%l7 + 0x48]
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x89,	%g6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g3
	nop
	set	0x48, %g1
	stw	%l0,	[%l7 + %g1]
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%o6
	nop
	set	0x26, %l2
	ldsh	[%l7 + %l2],	%i2
	nop
	set	0x42, %i7
	sth	%i1,	[%l7 + %i7]
	add	%g2,	%i3,	%o4
	nop
	set	0x6B, %g3
	ldstub	[%l7 + %g3],	%o1
	nop
	set	0x28, %o7
	std	%f12,	[%l7 + %o7]
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x81,	%o3
	nop
	set	0x6D, %o0
	ldub	[%l7 + %o0],	%l1
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xeb,	%i6
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x80
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x88,	 4
	nop
	set	0x28, %g6
	swap	[%l7 + %g6],	%g7
	nop
	set	0x0C, %o2
	stw	%l3,	[%l7 + %o2]
	set	0x28, %l3
	stha	%g4,	[%l7 + %l3] 0x88
	and	%o2,	%i0,	%i4
	wr	%o5,	%l4,	%sys_tick
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f16
	nop
	nop
	setx	0x34171579,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB3E84022,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f1,	%f5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xda
	add	%i6,	%l2,	%o7
	nop
	set	0x14, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x0E, %o1
	ldsh	[%l7 + %o1],	%l5
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%l6
	set	0x78, %i5
	stxa	%g5,	[%l7 + %i5] 0x80
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%g1
	st	%f23,	[%l7 + 0x14]
	nop
	set	0x3C, %l6
	stw	%g3,	[%l7 + %l6]
	ba,a,pn	%xcc,	loop_207
	add	%l0,	%o0,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%i2
loop_207:
	nop
	set	0x48, %i6
	swap	[%l7 + %i6],	%i3
	st	%fsr,	[%l7 + 0x30]
	set	0x5C, %l1
	stha	%g2,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%o4
	set	, %o5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1268
!	Type a   	: 31
!	Type cti   	: 30
!	Type x   	: 511
!	Type f   	: 37
!	Type i   	: 123
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
.word 0x6C8EE563
.word 0x5967EC0E
.word 0x289456DA
.word 0x3F9B32EB
.word 0x06462D6C
.word 0x6F4B02D3
.word 0x10673827
.word 0x7B378818
.word 0x89F2AABB
.word 0x5BCF1ED2
.word 0xE7996A5E
.word 0xE04F814A
.word 0x7638A6CB
.word 0xA4421040
.word 0xD0EF279D
.word 0xEE154062
.word 0x188FBC84
.word 0xA8055211
.word 0x45BF0976
.word 0xFE3A2F96
.word 0x276C3433
.word 0xF4A88574
.word 0xCDB19DDA
.word 0x872D4ED3
.word 0x5E66DF72
.word 0xF053496B
.word 0x1E4D877B
.word 0x4D4C99FA
.word 0x1E7C76FC
.word 0x44F3350F
.word 0xACD28097
.word 0x1861EBCF
.word 0x0E6C629F
.word 0x75527DB1
.word 0xF5A1CA2B
.word 0xA0A8C322
.word 0xE085D92A
.word 0xB39D779D
.word 0x8056B321
.word 0x137FDCDC
.word 0xA4EA7B20
.word 0x3A8CBD6F
.word 0xA9D273C5
.word 0x3BD71BF3
.word 0x797F7A2F
.word 0xF7C54B71
.word 0xFE81CF7C
.word 0xB3A043CA
.word 0x7A888D1A
.word 0x87DB8683
.word 0xFBA137AA
.word 0xB2ADB724
.word 0xBB0B5447
.word 0x3D171475
.word 0x3E06ADB2
.word 0xF9A3F921
.word 0xD794619A
.word 0xE2021547
.word 0xDC21BDA5
.word 0xDF69E4DF
.word 0xAC443AC7
.word 0xF918FABF
.word 0x188FB541
.word 0xC7A65DF9
!! thread 1 data, 64 words.
.word 0x8571C749
.word 0x9625955F
.word 0xFDE9034A
.word 0xDDA21E0C
.word 0x23EE886E
.word 0x630B6E50
.word 0x546576CE
.word 0x2B08D576
.word 0x68448A2B
.word 0x9CC80187
.word 0xD2A8246D
.word 0x57FC4491
.word 0xDDF47B7D
.word 0x9CD78FA1
.word 0x4C66FEE4
.word 0x1F458B03
.word 0x8F680D53
.word 0xFAC60FEB
.word 0xE069DF22
.word 0xCDCF8905
.word 0x0E0053B9
.word 0x38D92457
.word 0xFB87B4CF
.word 0xC7A5CE7E
.word 0xE72D1FEA
.word 0xDF4B08D7
.word 0x33E10148
.word 0xC537C42D
.word 0x78C04C9F
.word 0x9D7658F3
.word 0x178E6B95
.word 0x48B22485
.word 0x4AC9E55F
.word 0x8FA2968E
.word 0xA7A33921
.word 0x2533BDE1
.word 0x7E03855F
.word 0xD4B7D7D7
.word 0x44D48D15
.word 0x0DD62D0D
.word 0x21CED729
.word 0xBAB87D3E
.word 0xC20D7BE9
.word 0x32BAB863
.word 0x35DECDE1
.word 0x9B7DB72E
.word 0x6308FA0B
.word 0x62A2B76A
.word 0xF84904E0
.word 0x0F48BA82
.word 0x0E3360E7
.word 0xE309A322
.word 0xD367271E
.word 0x00F9676F
.word 0x81845C58
.word 0xDA8CBF12
.word 0x9D56C620
.word 0xE937CCAA
.word 0x0E436919
.word 0x647F94AE
.word 0xE7C38B2C
.word 0x9C6824BB
.word 0x2F903B36
.word 0x0D42A0EF
!! thread 2 data, 64 words.
.word 0x48251005
.word 0x9BA6D23C
.word 0x381536A1
.word 0xE6C997FB
.word 0xE0A64889
.word 0x4C6075FD
.word 0x9B912372
.word 0xB0CD9E0F
.word 0x0F508EAA
.word 0x46B5D2BC
.word 0xD6C43162
.word 0xCA47759D
.word 0x3567E1B6
.word 0x9813FD03
.word 0x4A0EA8A3
.word 0x1612B407
.word 0xA3388162
.word 0x48DBD242
.word 0x2EC300CA
.word 0x75C7EE4D
.word 0x2649F9C6
.word 0x285B435B
.word 0x1C2FE678
.word 0x7F98F913
.word 0xB7D2273F
.word 0x358451F1
.word 0xDB8E9D5C
.word 0x2124D81B
.word 0xB9BA5BFF
.word 0x638B484E
.word 0xE2E07BE5
.word 0xB57CFD61
.word 0xDEEA4794
.word 0xCB408FF8
.word 0x110886C8
.word 0xEA5EBCC7
.word 0xC384A416
.word 0x042E5CCC
.word 0xDAD6BC50
.word 0x9D063846
.word 0xBFFF10F6
.word 0xAD9E39EA
.word 0x342EE62D
.word 0x8A19F3BC
.word 0x3A3C7259
.word 0x8859526F
.word 0x234405BA
.word 0x754F3C00
.word 0x9F07275B
.word 0xA7AF551B
.word 0x21950E85
.word 0xF3BCBEF3
.word 0xEF846DFD
.word 0x941D2B6C
.word 0x8FBBCCB4
.word 0xADD34FE7
.word 0xFFEB48EC
.word 0xF59BE128
.word 0x71E6E7A2
.word 0x1CB2AE3E
.word 0xE7BB9E33
.word 0xD746521B
.word 0x1BBD0267
.word 0x170A243B
!! thread 3 data, 64 words.
.word 0xE8746F82
.word 0x84EB291A
.word 0x1F625AD3
.word 0x0D33796D
.word 0x0E5CD90B
.word 0xB380E613
.word 0xC4DBFA6D
.word 0x703298E9
.word 0xCEF2C28D
.word 0x4458D800
.word 0x1904D271
.word 0x3CE29DC7
.word 0xDC252DE3
.word 0xC585E727
.word 0xA678E98E
.word 0x11000351
.word 0xA7E40D35
.word 0x7D50B710
.word 0x92D248CD
.word 0x142557FB
.word 0xB494474E
.word 0x90D8ED36
.word 0xE084784A
.word 0xA0F00516
.word 0xC168B922
.word 0xCA6F7AC5
.word 0x3C8D3C48
.word 0x3AC6106A
.word 0x489AC741
.word 0xE35FB58D
.word 0x18C0B764
.word 0x7941D99B
.word 0x2F408E67
.word 0x8FB335E0
.word 0xFA9D2A37
.word 0x2388FBBE
.word 0x2C609678
.word 0x12C0169E
.word 0x446D0623
.word 0x71F904A4
.word 0x76A4A698
.word 0xE22EE959
.word 0x4721EBB9
.word 0x03978E9A
.word 0x068C06DB
.word 0xFB4BE325
.word 0xDE6B2D62
.word 0x75688125
.word 0xED28203D
.word 0x8E5E3885
.word 0x03697A7F
.word 0x1BFB6F83
.word 0x4F747EAC
.word 0xA4F0EEBE
.word 0xBC39148E
.word 0x4922F36D
.word 0xDA892D69
.word 0x657A89E5
.word 0x3C2B3E25
.word 0xEA9FCEAB
.word 0x7F0829B8
.word 0xA87FBE25
.word 0x5A490840
.word 0x8639F6EE
!! thread 4 data, 64 words.
.word 0xE12817F8
.word 0x2B6DCCC5
.word 0x35500CF2
.word 0x7F6577E1
.word 0xC885E2D6
.word 0xDC2575DC
.word 0xB69C8CCE
.word 0xBE5463A2
.word 0x7D59C37D
.word 0x683EBCFA
.word 0xFC4A8589
.word 0xD15A8F43
.word 0x1B252FFF
.word 0x73F15293
.word 0xA6AB2970
.word 0x45FF5C88
.word 0x8FFD139C
.word 0x012ECE35
.word 0xC20251A7
.word 0x873AB5B2
.word 0x0F67C0CB
.word 0x9FEB5F1F
.word 0x03F57B45
.word 0x10001C02
.word 0xE4FA6C85
.word 0xD6A4E8EA
.word 0x58103C1F
.word 0x35914F0C
.word 0xB09C65F5
.word 0xC6CB3440
.word 0x10D731F6
.word 0x70E6C87B
.word 0x7A964115
.word 0xB5DFD370
.word 0x5EC0CF6C
.word 0x9C49D030
.word 0xB2D6EF0F
.word 0xC9885728
.word 0x15645A32
.word 0x84F31F9C
.word 0xFA9F5138
.word 0xB5F5825C
.word 0xFBF56C09
.word 0xEC91573A
.word 0x9D76C1F4
.word 0x415A43C0
.word 0x6A878CAD
.word 0x4E067AE4
.word 0x5B18D953
.word 0x99819B94
.word 0x551470A5
.word 0x971F5D85
.word 0xC2DB5634
.word 0x66B058D2
.word 0xF7793AFD
.word 0x7267952E
.word 0xF7CA81E2
.word 0x07333840
.word 0x808828C9
.word 0x92830F11
.word 0x85F204D8
.word 0x4569B415
.word 0x8C7865F2
.word 0xD0498CF2
!! thread 5 data, 64 words.
.word 0xAABB5DA2
.word 0x5CF06214
.word 0x3557C0D0
.word 0x6FFBBF05
.word 0x6ED7D3EE
.word 0x0F3C9541
.word 0x834E8BC5
.word 0xDD8CE3E3
.word 0x75C0B1FE
.word 0x8A68E903
.word 0x2A0778A0
.word 0xF4CB0EB6
.word 0xE7780B19
.word 0xC314170C
.word 0xA4EB8EB5
.word 0x0632B090
.word 0x337AA52F
.word 0xC12DFEDB
.word 0xD5E5B950
.word 0x455EA7A5
.word 0x2A3575B0
.word 0xFCE3F62D
.word 0x8140B773
.word 0xEF47DBBA
.word 0x825C3B09
.word 0xE1B086F9
.word 0x220F8BFE
.word 0xFE77E6BC
.word 0xF3C23C9A
.word 0x9712B69B
.word 0x2D31C8F4
.word 0xAF7016F3
.word 0xB0C94899
.word 0x5DD53885
.word 0x8A2E3AE9
.word 0xE0338277
.word 0xEAC73935
.word 0xD3CABFA9
.word 0xB8145E1B
.word 0xB14C3F6A
.word 0xDD3C3492
.word 0xD2DB9231
.word 0x36A9A089
.word 0xEDD212F4
.word 0x6725891A
.word 0x096B00C2
.word 0xA1447BA2
.word 0x0F441359
.word 0xC21079D4
.word 0xDDD12F37
.word 0xBC86D217
.word 0x1C6E6F18
.word 0x53B0005F
.word 0x4B2957CF
.word 0x23B163DF
.word 0xCB9785CD
.word 0xC065EF2F
.word 0xA6E64D77
.word 0x699D6E75
.word 0xD9FE0E1E
.word 0x4CF1DF5D
.word 0x3BA44C71
.word 0x54594BE5
.word 0x52B49098
!! thread 6 data, 64 words.
.word 0xB221D60A
.word 0x513E455D
.word 0x559EE471
.word 0xDD6C0A39
.word 0xE00CE6F5
.word 0x24C6BA29
.word 0xCE4F9433
.word 0x392928D9
.word 0xD737A0E3
.word 0xE6195499
.word 0xDAFC7D6B
.word 0xCFA2FC9E
.word 0xE50E8CD4
.word 0x956ABD16
.word 0xFD7399DC
.word 0x21A9EF08
.word 0xD67C3FBB
.word 0x737E6D06
.word 0x9CECE4F7
.word 0x74BAB827
.word 0x602AA7FF
.word 0x227D9CFA
.word 0x07381764
.word 0x2B255812
.word 0x46D9908A
.word 0xEFC7BA18
.word 0xD9F63F78
.word 0x0BB8E46E
.word 0x1DA5741A
.word 0x7EA28AE2
.word 0xD7085EB7
.word 0x31C2610D
.word 0x89924F0A
.word 0x04893F3A
.word 0x7CB6AD13
.word 0xA294A75A
.word 0x5C7940B3
.word 0xE8A3CE26
.word 0xF20F78DF
.word 0x913D6493
.word 0xEAF78E71
.word 0x2CEA51FE
.word 0x26EE4FFC
.word 0x1B63E7DC
.word 0x53F987F8
.word 0xF5F97610
.word 0x6CA36A19
.word 0xF2155C09
.word 0x02C9661B
.word 0x9464C3EF
.word 0x54ED98C5
.word 0x96E24115
.word 0x31037F2B
.word 0xFC79CE11
.word 0xA9807B61
.word 0xFE73BCA5
.word 0x29EF080A
.word 0xDC514FF4
.word 0xB1E0B45C
.word 0xE7D67975
.word 0x4F637932
.word 0xD2D8AAB3
.word 0x717F7D39
.word 0xA6BB3409
!! thread 7 data, 64 words.
.word 0x8F86F7B2
.word 0x5FE44FDC
.word 0xC7CD838A
.word 0x99D13E12
.word 0xF4A6AAAF
.word 0x4D792E1B
.word 0x70967A19
.word 0xE12FCCC7
.word 0x035884D8
.word 0xB789DEE1
.word 0x5FF87CA9
.word 0xF566FEE3
.word 0xA96E04D7
.word 0xC1E1DB72
.word 0x3B3B4109
.word 0x8B2577CE
.word 0xF0100DEB
.word 0x1D875F15
.word 0x2B3C4434
.word 0x42FD150E
.word 0x7EE6F39F
.word 0xF8A6B8FC
.word 0xAD8293C0
.word 0x45A09C41
.word 0x3C03DA95
.word 0xEF8BD774
.word 0xA379A237
.word 0x5C91D8DB
.word 0x161FD14F
.word 0x4AD0D911
.word 0xBB839605
.word 0xD25B236D
.word 0xDB459F1F
.word 0xD990D163
.word 0x89FDC5C6
.word 0x6637F996
.word 0x1F55D920
.word 0x34D5EAF6
.word 0xA8EB5E6A
.word 0x99897B6F
.word 0xCA40E646
.word 0x40063C44
.word 0xF0E58212
.word 0x44314611
.word 0x3F554812
.word 0x6EDB6CA6
.word 0x13C03B54
.word 0x9BF83F7D
.word 0xEC48BEEF
.word 0x40636F50
.word 0x5F835AF8
.word 0x1CD420BF
.word 0xD9B0325C
.word 0x96D1BF9C
.word 0x4CBF6176
.word 0x283E9936
.word 0xE5A118B5
.word 0x186FA108
.word 0x5C6BD16A
.word 0xE3B1174E
.word 0x265759FD
.word 0xAE77BAA2
.word 0x1DCE4B4F
.word 0x351102C6
.end
