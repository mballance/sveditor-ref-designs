/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc0.s
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
	set	0x4,	%g1
	set	0x8,	%g2
	set	0xC,	%g3
	set	0x4,	%g4
	set	0xF,	%g5
	set	0xC,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x6,	%i1
	set	-0xD,	%i2
	set	-0x7,	%i3
	set	-0x8,	%i4
	set	-0x5,	%i5
	set	-0xE,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x24E2B52E,	%l0
	set	0x2FBE6913,	%l1
	set	0x14CDA29F,	%l2
	set	0x72FBECBC,	%l3
	set	0x7D4EBB0C,	%l4
	set	0x1CC99330,	%l5
	set	0x344BF176,	%l6
	!# Output registers
	set	-0x1C58,	%o0
	set	0x1874,	%o1
	set	-0x17B5,	%o2
	set	-0x1E0C,	%o3
	set	-0x0C8C,	%o4
	set	-0x0EDB,	%o5
	set	-0x055F,	%o6
	set	0x005C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	st	%fsr,	[%l7 + 0x74]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x89,	%g1
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f6
	bne,a,pn	%icc,	loop_1
	nop
	set	0x38, %o4
	std	%g4,	[%l7 + %o4]
	bleu,pn	%icc,	loop_2
	add	%g5,	%o6,	%o2
loop_1:
	nop
	set	0x20, %i0
	sta	%f17,	[%l7 + %i0] 0x81
loop_2:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%i4
	nop
	set	0x08, %l0
	std	%f6,	[%l7 + %l0]
	set	0x6A, %o0
	stha	%o7,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f16
	set	0x54, %g4
	lda	[%l7 + %g4] 0x81,	%f27
	ld	[%l7 + 0x10],	%f20
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%g7
	wr	%g2,	%o1,	%softint
	nop
	set	0x0A, %i2
	ldsb	[%l7 + %i2],	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%l6
	fpadd16	%f16,	%f26,	%f22
	nop
	set	0x0D, %o1
	ldub	[%l7 + %o1],	%l1
	nop
	set	0x74, %o3
	ldsh	[%l7 + %o3],	%i3
	nop
	set	0x2C, %o5
	ldsb	[%l7 + %o5],	%l4
	set	0x48, %l6
	stba	%i0,	[%l7 + %l6] 0x88
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xeb,	%l0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf9
	membar	#Sync
	set	0x35, %i7
	stba	%i6,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x20, %l1
	sth	%o4,	[%l7 + %l1]
	nop
	set	0x5A, %l3
	ldstub	[%l7 + %l3],	%l5
	set	0x68, %i5
	sta	%f3,	[%l7 + %i5] 0x88
	set	0x1C, %l2
	sta	%f28,	[%l7 + %l2] 0x88
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f0
	ld	[%l7 + 0x18],	%f29
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%g2
	set	0x34, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i1
	set	0x6A, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o5
	nop
	set	0x4A, %g2
	stb	%i2,	[%l7 + %g2]
	bne,pt	%icc,	loop_3
	nop
	set	0x70, %o6
	std	%f8,	[%l7 + %o6]
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x81,	 3
loop_3:
	nop
	set	0x16, %g6
	ldstub	[%l7 + %g6],	%i5
	set	0x20, %i6
	stxa	%g4,	[%l7 + %i6] 0x88
	nop
	set	0x54, %g7
	ldsh	[%l7 + %g7],	%g1
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%f24
	nop
	nop
	setx	0x851C1588,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x40C5EC42,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f27,	%f23
	st	%f28,	[%l7 + 0x28]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%o2
	nop
	set	0x12, %o4
	ldub	[%l7 + %o4],	%o6
	nop
	set	0x4C, %i0
	ldub	[%l7 + %i0],	%o3
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x88,	%i4
	nop
	set	0x31, %l0
	ldsb	[%l7 + %l0],	%g7
	add	%o7,	%o1,	%o0
	nop
	set	0x50, %g4
	std	%f4,	[%l7 + %g4]
	st	%f20,	[%l7 + 0x20]
	nop
	set	0x1D, %l4
	stb	%g2,	[%l7 + %l4]
	set	0x48, %i2
	stda	%i6,	[%l7 + %i2] 0x80
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x50, %o1
	stx	%l6,	[%l7 + %o1]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f16
	set	0x48, %o5
	stxa	%l1,	[%l7 + %o5] 0x89
	nop
	set	0x18, %o2
	std	%f8,	[%l7 + %o2]
	nop
	set	0x18, %l6
	std	%f8,	[%l7 + %l6]
	nop
	set	0x60, %i1
	stx	%i3,	[%l7 + %i1]
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 4
	fpsub16s	%f28,	%f31,	%f18
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x88,	%l4
	nop
	set	0x0C, %l3
	ldsh	[%l7 + %l3],	%i0
	ba,a	%icc,	loop_4
	nop
	set	0x2C, %i5
	ldub	[%l7 + %i5],	%l0
	set	0x68, %l2
	stda	%o4,	[%l7 + %l2] 0x80
loop_4:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc8
	nop
	set	0x7C, %l1
	stw	%l5,	[%l7 + %l1]
	set	0x54, %i4
	sta	%f16,	[%l7 + %i4] 0x80
	nop
	set	0x18, %o7
	std	%f26,	[%l7 + %o7]
	fpsub32	%f22,	%f14,	%f24
	nop
	set	0x62, %g2
	lduh	[%l7 + %g2],	%g3
	nop
	set	0x50, %o6
	stx	%l3,	[%l7 + %o6]
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f28
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x0C, %i6
	stw	%l2,	[%l7 + %i6]
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%i6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x88,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g6
	set	0x58, %i0
	stba	%i5,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x2A, %o0
	lduh	[%l7 + %o0],	%i2
	nop
	set	0x64, %l0
	ldsw	[%l7 + %l0],	%g1
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%g4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%o6
	set	0x48, %l4
	swapa	[%l7 + %l4] 0x89,	%o3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x89
	set	0x1A, %i2
	stha	%i4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x28, %o3
	ldsh	[%l7 + %o3],	%g7
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x80,	%o2
	set	0x1B, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o7
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	or	%o1,	%g2,	%i7
	set	0x20, %i1
	stxa	%o0,	[%l7 + %i1] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x88,	%l1
	set	0x20, %g1
	swapa	[%l7 + %g1] 0x80,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%l4
	wr	%l0,	%i0,	%set_softint
	set	0x14, %o2
	ldstuba	[%l7 + %o2] 0x81,	%o4
	nop
	set	0x12, %i5
	ldsh	[%l7 + %i5],	%g3
	st	%f1,	[%l7 + 0x0C]
	fpsub32	%f18,	%f0,	%f10
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%l3
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x89,	%l2
	nop
	set	0x78, %l1
	lduh	[%l7 + %l1],	%l5
	nop
	set	0x27, %l2
	ldsb	[%l7 + %l2],	%i1
	set	0x0E, %i4
	stba	%i6,	[%l7 + %i4] 0x89
	nop
	set	0x30, %g2
	stw	%g6,	[%l7 + %g2]
	bne,pt	%icc,	loop_5
	st	%fsr,	[%l7 + 0x7C]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x89
loop_5:
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x44, %o7
	ldsb	[%l7 + %o7],	%o5
	nop
	set	0x38, %l5
	std	%f18,	[%l7 + %l5]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd2
	nop
	set	0x50, %g5
	ldx	[%l7 + %g5],	%i5
	add	%g1,	%i2,	%g5
	nop
	set	0x40, %g7
	std	%g4,	[%l7 + %g7]
	nop
	set	0x68, %g6
	ldub	[%l7 + %g6],	%o6
	set	0x75, %g3
	stba	%i4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x3D, %o0
	stb	%o3,	[%l7 + %o0]
	add	%o2,	%g7,	%o7
	set	0x3B, %l0
	stba	%g2,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x89
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x80,	%f6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%o1
	nop
	set	0x50, %o4
	ldstub	[%l7 + %o4],	%o0
	st	%f11,	[%l7 + 0x28]
	nop
	set	0x58, %i2
	lduw	[%l7 + %i2],	%l6
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x81,	%l1
	nop
	set	0x1C, %o1
	ldsh	[%l7 + %o1],	%i3
	set	0x0A, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l0
	add	%l4,	%i0,	%g3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd8,	%f16
	set	0x24, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x58, %i7
	stx	%l3,	[%l7 + %i7]
	ld	[%l7 + 0x08],	%f3
	set	0x14, %g1
	swapa	[%l7 + %g1] 0x89,	%i6
	nop
	set	0x18, %o2
	ldsw	[%l7 + %o2],	%i1
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%o4
	set	0x38, %i5
	stda	%g6,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x10, %i3
	swapa	[%l7 + %i3] 0x88,	%i5
	set	0x68, %l1
	stda	%i2,	[%l7 + %l1] 0x81
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x88,	%g0
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x81,	%g5
	nop
	set	0x4C, %i4
	lduh	[%l7 + %i4],	%g4
	nop
	set	0x48, %o7
	std	%f0,	[%l7 + %o7]
	set	0x50, %l5
	stda	%i4,	[%l7 + %l5] 0x81
	st	%fsr,	[%l7 + 0x74]
	set	0x4B, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o6
	and	%o2,	%g7,	%o7
	nop
	set	0x6F, %g5
	ldub	[%l7 + %g5],	%g2
	nop
	set	0x70, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x08, %g6
	stw	%o1,	[%l7 + %g6]
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%o3
	set	0x1C, %o0
	swapa	[%l7 + %o0] 0x88,	%l6
	nop
	set	0x08, %g3
	std	%f18,	[%l7 + %g3]
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x89,	%l1
	nop
	set	0x74, %g4
	ldsw	[%l7 + %g4],	%o0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l4
	set	0x6C, %i2
	lda	[%l7 + %i2] 0x88,	%f2
	bleu,a,pt	%icc,	loop_6
	nop
	set	0x28, %i0
	stb	%i0,	[%l7 + %i0]
	nop
	set	0x20, %o3
	stb	%g3,	[%l7 + %o3]
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x89,	%i3
loop_6:
	nop
	set	0x28, %l6
	stwa	%o4,	[%l7 + %l6] 0x88
	nop
	set	0x58, %o5
	std	%l4,	[%l7 + %o5]
	st	%f5,	[%l7 + 0x5C]
	nop
	set	0x0F, %l4
	ldub	[%l7 + %l4],	%l3
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x81,	%i6
	nop
	set	0x78, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x48, %o2
	std	%f28,	[%l7 + %o2]
	nop
	set	0x58, %i7
	swap	[%l7 + %i7],	%l2
	ld	[%l7 + 0x70],	%f24
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%o5
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	set	0x68, %l2
	stba	%i1,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x38, %g2
	std	%f16,	[%l7 + %g2]
	nop
	set	0x3C, %i4
	lduw	[%l7 + %i4],	%i2
	set	0x68, %o7
	stxa	%i5,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x4E, %l5
	sth	%g5,	[%l7 + %l5]
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f4
	set	0x34, %g5
	lda	[%l7 + %g5] 0x89,	%f20
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB74, 	%tick_cmpr
	set	0x59, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o6
	set	0x2D, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o2
	nop
	set	0x68, %g6
	std	%g4,	[%l7 + %g6]
	nop
	set	0x2C, %g7
	stw	%g7,	[%l7 + %g7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%o7
	wr	%o1,	%o3,	%sys_tick
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f0
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x2C, %l0
	stw	%i7,	[%l7 + %l0]
	or	%l1,	%l0,	%o0
	set	0x16, %o4
	ldstuba	[%l7 + %o4] 0x88,	%l4
	nop
	set	0x6F, %i2
	ldub	[%l7 + %i2],	%i0
	nop
	set	0x50, %i0
	stw	%g3,	[%l7 + %i0]
	nop
	set	0x30, %o3
	stx	%o4,	[%l7 + %o3]
	and	%i3,	%l5,	%i6
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x81,	%l2
	nop
	set	0x40, %l6
	stx	%o5,	[%l7 + %l6]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x80,	%l2
	nop
	set	0x30, %g4
	std	%f18,	[%l7 + %g4]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x81
	nop
	set	0x14, %g1
	ldub	[%l7 + %g1],	%g6
	set	0x72, %o2
	stba	%i1,	[%l7 + %o2] 0x80
	set	0x78, %i7
	stxa	%i5,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x24, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x48, %i3
	ldxa	[%l7 + %i3] 0x81,	%i2
	set	0x5C, %l1
	stwa	%g5,	[%l7 + %l1] 0x80
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xe2,	%g0
	set	0x7B, %l2
	stba	%o6,	[%l7 + %l2] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%o2
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f8
	nop
	set	0x7B, %o7
	ldsb	[%l7 + %o7],	%g7
	nop
	set	0x40, %g2
	swap	[%l7 + %g2],	%g2
	nop
	set	0x46, %i5
	lduh	[%l7 + %i5],	%o7
	nop
	set	0x68, %l5
	swap	[%l7 + %l5],	%o1
	set	0x68, %g5
	stxa	%o3,	[%l7 + %g5] 0x81
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f0
	set	0x28, %g6
	swapa	[%l7 + %g6] 0x81,	%g4
	nop
	set	0x44, %g7
	sth	%l6,	[%l7 + %g7]
	nop
	set	0x0A, %o6
	ldsh	[%l7 + %o6],	%i7
	nop
	nop
	setx	0x571D4308,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xBC1F64E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f17,	%f20
	set	0x14, %g3
	sta	%f24,	[%l7 + %g3] 0x81
	nop
	set	0x2C, %l0
	lduh	[%l7 + %l0],	%l1
	set	0x57, %o0
	stba	%o0,	[%l7 + %o0] 0x81
	and	%l4,	%i0,	%g3
	set	0x60, %o4
	stxa	%l0,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x62, %i0
	stha	%o4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x44, %o3
	stw	%l5,	[%l7 + %o3]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf9
	membar	#Sync
	nop
	set	0x30, %l6
	ldsw	[%l7 + %l6],	%i6
	nop
	set	0x7E, %o5
	sth	%l2,	[%l7 + %o5]
	nop
	set	0x30, %o1
	std	%i2,	[%l7 + %o1]
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	st	%f10,	[%l7 + 0x30]
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x88,	 2
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f16
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x80,	%o5
	nop
	set	0x68, %i7
	lduw	[%l7 + %i7],	%i1
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%i5
	add	%g1,	%g5,	%i4
	nop
	set	0x66, %i1
	ldsh	[%l7 + %i1],	%o2
	set	0x20, %i3
	stxa	%g7,	[%l7 + %i3] 0x88
	set	0x7C, %l2
	sta	%f21,	[%l7 + %l2] 0x80
	wr	%o6,	%o7,	%y
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%g2
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	nop
	setx	0xC735564F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x28608701,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f14,	%f19
	set	0x34, %g2
	sta	%f11,	[%l7 + %g2] 0x89
	and	%o1,	%g4,	%l6
	nop
	set	0x70, %i5
	ldub	[%l7 + %i5],	%o3
	nop
	set	0x18, %g5
	swap	[%l7 + %g5],	%i7
	nop
	set	0x69, %i6
	stb	%l1,	[%l7 + %i6]
	nop
	set	0x7A, %l5
	stb	%l4,	[%l7 + %l5]
	set	0x08, %g6
	stwa	%i0,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x1E, %o6
	sth	%g3,	[%l7 + %o6]
	nop
	set	0x20, %g3
	prefetch	[%l7 + %g3],	 0
	ld	[%l7 + 0x40],	%f28
	nop
	set	0x4E, %l0
	ldub	[%l7 + %l0],	%l0
	nop
	set	0x4C, %g7
	ldsh	[%l7 + %g7],	%o0
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	nop
	set	0x51, %o0
	ldub	[%l7 + %o0],	%l5
	set	0x34, %o3
	sta	%f0,	[%l7 + %o3] 0x81
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x89,	%i6
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x80,	%i3
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	ld	[%l7 + 0x44],	%f4
	nop
	set	0x48, %o5
	std	%g6,	[%l7 + %o5]
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x89,	%o4
	or	%l3,	%i1,	%i2
	st	%f5,	[%l7 + 0x34]
	nop
	set	0x42, %g1
	ldsb	[%l7 + %g1],	%i5
	set	0x20, %g4
	stda	%g4,	[%l7 + %g4] 0x80
	set	0x28, %l4
	stda	%g0,	[%l7 + %l4] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x80,	%o2
	st	%fsr,	[%l7 + 0x54]
	set	0x6C, %i7
	stwa	%i4,	[%l7 + %i7] 0x81
	nop
	set	0x1C, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x28, %i1
	stwa	%o6,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x30, %i3
	swapa	[%l7 + %i3] 0x88,	%o7
	nop
	set	0x78, %l2
	std	%f26,	[%l7 + %l2]
	nop
	set	0x6E, %l3
	lduh	[%l7 + %l3],	%g2
	set	0x24, %o7
	swapa	[%l7 + %o7] 0x88,	%g7
	fpadd32	%f12,	%f12,	%f16
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x80,	%o1
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc8
	nop
	set	0x23, %i6
	ldsb	[%l7 + %i6],	%l6
	set	0x08, %l5
	stxa	%o3,	[%l7 + %l5] 0x80
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f28
	nop
	set	0x74, %o6
	prefetch	[%l7 + %o6],	 0
	ld	[%l7 + 0x0C],	%f11
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xe2,	%g4
	set	0x68, %g7
	stxa	%l1,	[%l7 + %g7] 0x81
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x80,	 1
	nop
	set	0x20, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x34, %o4
	lduw	[%l7 + %o4],	%l4
	nop
	set	0x55, %i2
	ldsb	[%l7 + %i2],	%g3
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%i0
	nop
	set	0x20, %i0
	std	%f26,	[%l7 + %i0]
	wr	%l0,	%o0,	%set_softint
	set	0x28, %l6
	stwa	%l5,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%i3
	nop
	set	0x28, %o1
	stx	%l2,	[%l7 + %o1]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x89
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x88,	 2
	nop
	set	0x10, %g4
	ldx	[%l7 + %g4],	%o5
	nop
	nop
	setx	0x6F139904,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x9CA6293F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f1,	%f18
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	nop
	set	0x44, %i7
	ldsh	[%l7 + %i7],	%l3
	nop
	set	0x70, %i1
	swap	[%l7 + %i1],	%i2
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%i0
	nop
	set	0x25, %l2
	ldub	[%l7 + %l2],	%g5
	nop
	set	0x4E, %i3
	ldsb	[%l7 + %i3],	%i5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f0
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 0
	st	%fsr,	[%l7 + 0x5C]
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x88,	%o2
	set	0x20, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	set	0x70, %i4
	swapa	[%l7 + %i4] 0x81,	%g1
	set	0x58, %l5
	stda	%o6,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%g2
	nop
	set	0x64, %o6
	prefetch	[%l7 + %o6],	 4
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x81,	 4
	nop
	set	0x34, %g3
	ldsw	[%l7 + %g3],	%o1
	nop
	set	0x70, %g6
	std	%f26,	[%l7 + %g6]
	nop
	set	0x70, %l0
	std	%g6,	[%l7 + %l0]
	and	%l6,	%g4,	%l1
	st	%fsr,	[%l7 + 0x68]
	fpadd16	%f14,	%f12,	%f10
	nop
	set	0x28, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x10, %o4
	swapa	[%l7 + %o4] 0x88,	%o3
	ld	[%l7 + 0x08],	%f25
	and	%l4,	%g3,	%i7
	set	0x4C, %g7
	stha	%l0,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x68, %i2
	std	%o0,	[%l7 + %i2]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i0
	nop
	set	0x13, %i0
	ldub	[%l7 + %i0],	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l2
	nop
	set	0x40, %o3
	stx	%i6,	[%l7 + %o3]
	nop
	set	0x6E, %o5
	lduh	[%l7 + %o5],	%g6
	or	%o5,	%l3,	%i2
	nop
	set	0x14, %o1
	lduw	[%l7 + %o1],	%g5
	st	%f2,	[%l7 + 0x44]
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f0
	nop
	set	0x4C, %g4
	swap	[%l7 + %g4],	%i5
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%o2
	nop
	set	0x08, %g1
	ldsw	[%l7 + %g1],	%i1
	nop
	set	0x6E, %i7
	ldub	[%l7 + %i7],	%i4
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%g0
	set	0x48, %i1
	sta	%f16,	[%l7 + %i1] 0x89
	fpsub16	%f24,	%f4,	%f18
	add	%g2,	%o6,	%o1
	wr	%g7,	%l6,	%clear_softint
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f0
	nop
	set	0x44, %o7
	swap	[%l7 + %o7],	%o7
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f26
	nop
	set	0x08, %l2
	stx	%g4,	[%l7 + %l2]
	ld	[%l7 + 0x64],	%f19
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf9
	membar	#Sync
	st	%f31,	[%l7 + 0x74]
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%l1
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%o3
	nop
	set	0x10, %g5
	stx	%l4,	[%l7 + %g5]
	nop
	set	0x28, %l5
	stx	%i7,	[%l7 + %l5]
	nop
	set	0x3C, %o6
	ldstub	[%l7 + %o6],	%l0
	nop
	set	0x18, %g3
	std	%f10,	[%l7 + %g3]
	fpadd32s	%f5,	%f29,	%f30
	set	0x28, %g6
	stxa	%g3,	[%l7 + %g6] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o0
	or	%o4,	%i3,	%l2
	nop
	set	0x20, %l0
	ldsh	[%l7 + %l0],	%i0
	set	0x5F, %i6
	ldstuba	[%l7 + %i6] 0x80,	%g6
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x0C, %g7
	stb	%i6,	[%l7 + %g7]
	set	0x7C, %i2
	sta	%f0,	[%l7 + %i2] 0x81
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f0
	st	%fsr,	[%l7 + 0x28]
	wr	%l3,	%o5,	%softint
	nop
	set	0x48, %o3
	lduw	[%l7 + %o3],	%i2
	fpadd16s	%f1,	%f26,	%f15
	nop
	set	0x7E, %o0
	stb	%g5,	[%l7 + %o0]
	nop
	set	0x18, %o5
	std	%o2,	[%l7 + %o5]
	add	%i5,	%i1,	%g1
	set	0x2C, %l6
	lda	[%l7 + %l6] 0x88,	%f21
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x88
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x89,	%i4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f0
	nop
	set	0x58, %o1
	stx	%o6,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x24]
	ld	[%l7 + 0x40],	%f13
	add	%o1,	%g7,	%g2
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	nop
	set	0x50, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x08, %l1
	ldsb	[%l7 + %l1],	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%o3
	nop
	set	0x5D, %i1
	ldub	[%l7 + %i1],	%g4
	set	0x60, %i3
	lda	[%l7 + %i3] 0x81,	%f21
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x88,	%l4
	add	%i7,	%g3,	%l0
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%o0
	set	0x48, %l2
	prefetcha	[%l7 + %l2] 0x88,	 4
	nop
	set	0x24, %i5
	ldsh	[%l7 + %i5],	%o4
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x60, %i4
	std	%f12,	[%l7 + %i4]
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%f10
	nop
	set	0x0C, %g5
	ldub	[%l7 + %g5],	%i3
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%l2
	set	0x08, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x3C, %l0
	swap	[%l7 + %l0],	%g6
	nop
	set	0x60, %o4
	std	%f0,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x78]
	set	0x7E, %i6
	stba	%l3,	[%l7 + %i6] 0x89
	nop
	set	0x6C, %g7
	ldsw	[%l7 + %g7],	%i2
	nop
	set	0x29, %i0
	stb	%o5,	[%l7 + %i0]
	set	0x28, %o3
	sta	%f1,	[%l7 + %o3] 0x80
	nop
	set	0x0B, %i2
	ldstub	[%l7 + %i2],	%g5
	nop
	set	0x74, %o5
	sth	%o2,	[%l7 + %o5]
	be,pt	%xcc,	loop_7
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%i1
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x75, %l4
	stb	%i5,	[%l7 + %l4]
loop_7:
	nop
	set	0x70, %g4
	stba	%g1,	[%l7 + %g4] 0xe2
	membar	#Sync
	st	%f30,	[%l7 + 0x50]
	nop
	set	0x24, %l6
	ldsh	[%l7 + %l6],	%i4
	and	%o1,	%g7,	%o6
	set	0x10, %o2
	stxa	%g2,	[%l7 + %o2] 0x80
	nop
	set	0x58, %g1
	std	%o6,	[%l7 + %g1]
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x36, %l1
	ldstub	[%l7 + %l1],	%l1
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	set	0x36, %g2
	stha	%g4,	[%l7 + %g2] 0x80
	nop
	set	0x72, %o7
	sth	%o3,	[%l7 + %o7]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%l4
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f22
	nop
	set	0x30, %l2
	std	%l0,	[%l7 + %l2]
	nop
	set	0x30, %i5
	std	%o0,	[%l7 + %i5]
	set	0x5C, %i4
	lda	[%l7 + %i4] 0x88,	%f22
	nop
	set	0x0C, %l3
	stw	%g3,	[%l7 + %l3]
	set	0x0A, %g5
	stha	%o4,	[%l7 + %g5] 0x88
	set	0x0B, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l5
	st	%f7,	[%l7 + 0x58]
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0
	nop
	set	0x58, %o6
	ldx	[%l7 + %o6],	%l2
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f24
	nop
	set	0x47, %o4
	ldub	[%l7 + %o4],	%i6
	set	0x44, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i0
	st	%f20,	[%l7 + 0x48]
	add	%l3,	%i2,	%o5
	ld	[%l7 + 0x1C],	%f26
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i1
	fpadd32	%f0,	%f6,	%f14
	nop
	set	0x27, %i0
	stb	%i5,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x0C, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%g1
	nop
	set	0x3C, %i2
	ldub	[%l7 + %i2],	%i4
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%o2
	set	0x74, %o0
	stwa	%o1,	[%l7 + %o0] 0x81
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x40, %g4
	std	%f4,	[%l7 + %g4]
	ld	[%l7 + 0x24],	%f12
	nop
	set	0x17, %l6
	ldub	[%l7 + %l6],	%g7
	nop
	set	0x42, %o2
	ldsh	[%l7 + %o2],	%g2
	set	0x44, %l4
	sta	%f10,	[%l7 + %l4] 0x80
	nop
	set	0x64, %g1
	stb	%o6,	[%l7 + %g1]
	nop
	set	0x68, %l1
	ldsb	[%l7 + %l1],	%l6
	set	0x4C, %i1
	sta	%f9,	[%l7 + %i1] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%g4
	or	%o7,	%i7,	%o3
	or	%l0,	%o0,	%l4
	nop
	set	0x7E, %o1
	sth	%g3,	[%l7 + %o1]
	or	%o4,	%i3,	%l5
	and	%i6,	%i0,	%l2
	nop
	set	0x48, %g2
	std	%i2,	[%l7 + %g2]
	st	%f24,	[%l7 + 0x50]
	set	0x0C, %o7
	stwa	%l3,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x70, %i7
	std	%f2,	[%l7 + %i7]
	nop
	set	0x08, %l2
	std	%o4,	[%l7 + %l2]
	ld	[%l7 + 0x50],	%f10
	fpadd16s	%f7,	%f24,	%f7
	and	%g5,	%i1,	%i5
	nop
	set	0x60, %i3
	stw	%g1,	[%l7 + %i3]
	nop
	set	0x38, %i5
	stx	%g6,	[%l7 + %i5]
	and	%o2,	%o1,	%g7
	add	%i4,	%g2,	%o6
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 4
	add	%l1,	%g4,	%o7
	set	0x34, %i4
	swapa	[%l7 + %i4] 0x81,	%l6
	set	0x68, %g3
	stxa	%o3,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x59, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%o0
	nop
	set	0x50, %g5
	stw	%l4,	[%l7 + %g5]
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f24
	set	0x54, %o4
	lda	[%l7 + %o4] 0x89,	%f0
	set	0x22, %o6
	stba	%g3,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x60, %g6
	stxa	%i3,	[%l7 + %g6] 0x81
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x81,	%o4
	nop
	set	0x10, %o3
	std	%f14,	[%l7 + %o3]
	nop
	set	0x28, %i6
	std	%f16,	[%l7 + %i6]
	add	%l5,	%i6,	%i0
	nop
	set	0x73, %g7
	stb	%i2,	[%l7 + %g7]
	nop
	set	0x78, %i2
	ldsw	[%l7 + %i2],	%l2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%l3
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%g5
	set	0x50, %g4
	swapa	[%l7 + %g4] 0x81,	%i5
	ba,pt	%xcc,	loop_8
	nop
	set	0x34, %l6
	prefetch	[%l7 + %l6],	 4
	set	0x6C, %o2
	swapa	[%l7 + %o2] 0x81,	%g1
loop_8:
	nop
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x81,	%i1
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%o2
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x38, %l1
	stx	%o1,	[%l7 + %l1]
	nop
	set	0x0D, %o1
	stb	%g7,	[%l7 + %o1]
	set	0x10, %g2
	sta	%f9,	[%l7 + %g2] 0x81
	nop
	set	0x56, %i1
	ldsb	[%l7 + %i1],	%g6
	st	%f17,	[%l7 + 0x48]
	nop
	set	0x18, %i7
	stw	%g2,	[%l7 + %i7]
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%i4
	set	0x0F, %l2
	ldstuba	[%l7 + %l2] 0x81,	%o6
	fpadd16	%f28,	%f20,	%f24
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	nop
	set	0x3E, %l3
	ldstub	[%l7 + %l3],	%o7
	nop
	set	0x38, %i5
	stw	%l6,	[%l7 + %i5]
	nop
	set	0x18, %i4
	std	%l0,	[%l7 + %i4]
	set	0x22, %g3
	ldstuba	[%l7 + %g3] 0x89,	%l0
	nop
	set	0x16, %g5
	sth	%o3,	[%l7 + %g5]
	set	0x74, %l5
	stwa	%o0,	[%l7 + %l5] 0x89
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf1
	membar	#Sync
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xe2,	%i6
	fpadd16s	%f2,	%f8,	%f17
	st	%f18,	[%l7 + 0x30]
	and	%g3,	%i3,	%l4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%i6
	set	0x38, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	nop
	set	0x7C, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x60, %o3
	lduh	[%l7 + %o3],	%i2
	nop
	set	0x6C, %g6
	ldsh	[%l7 + %g6],	%l2
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%o5
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f26
	set	0x3E, %i2
	ldstuba	[%l7 + %i2] 0x81,	%l3
	set	0x60, %g4
	stda	%g4,	[%l7 + %g4] 0x81
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f16
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f12
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%i5
	set	0x20, %o0
	stba	%g1,	[%l7 + %o0] 0x88
	nop
	set	0x0C, %g1
	ldub	[%l7 + %g1],	%i1
	set	0x70, %o1
	sta	%f0,	[%l7 + %o1] 0x81
	st	%f28,	[%l7 + 0x48]
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x44, %l1
	lduh	[%l7 + %l1],	%o4
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%o2
	set	0x48, %i7
	lda	[%l7 + %i7] 0x88,	%f10
	set	0x08, %l2
	stxa	%o1,	[%l7 + %l2] 0x80
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f18
	fpsub16s	%f3,	%f11,	%f14
	nop
	set	0x26, %i3
	ldsh	[%l7 + %i3],	%g6
	nop
	set	0x3D, %l3
	ldsb	[%l7 + %l3],	%g7
	set	0x4C, %i4
	sta	%f7,	[%l7 + %i4] 0x80
	set	0x34, %g3
	stha	%i4,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x28, %i5
	stx	%g2,	[%l7 + %i5]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xeb,	%g4
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x58, %l0
	std	%o6,	[%l7 + %l0]
	add	%l6,	%o6,	%l1
	set	0x18, %o4
	swapa	[%l7 + %o4] 0x80,	%l0
	add	%o0,	%o3,	%g3
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x80,	 4
	nop
	set	0x5C, %o6
	ldsw	[%l7 + %o6],	%i7
	set	0x18, %i0
	stwa	%l4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x67, %g6
	ldstub	[%l7 + %g6],	%l5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%i6
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%f18
	set	0x44, %o3
	stwa	%i2,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x40, %i2
	lduw	[%l7 + %i2],	%l2
	nop
	set	0x1A, %i6
	ldsh	[%l7 + %i6],	%l3
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x89,	%o5
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f30
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xeb,	%g4
	nop
	set	0x22, %o5
	lduh	[%l7 + %o5],	%g1
	set	0x18, %l4
	stha	%i5,	[%l7 + %l4] 0x80
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f18
	and	%i1,	%o2,	%o4
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%g6
	nop
	set	0x66, %g2
	ldsh	[%l7 + %g2],	%o1
	nop
	set	0x09, %o1
	ldub	[%l7 + %o1],	%i4
	set	0x7D, %i1
	stba	%g7,	[%l7 + %i1] 0x88
	and	%g2,	%g4,	%o7
	and	%o6,	%l1,	%l6
	and	%o0,	%o3,	%g3
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x89
	set	0x60, %l2
	lda	[%l7 + %l2] 0x80,	%f23
	nop
	set	0x56, %i7
	ldub	[%l7 + %i7],	%l0
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 4
	set	0x40, %l3
	stxa	%i3,	[%l7 + %l3] 0x81
	set	0x34, %o7
	lda	[%l7 + %o7] 0x88,	%f20
	set	0x30, %g3
	swapa	[%l7 + %g3] 0x88,	%i7
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%l4
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%l4
	nop
	set	0x0E, %l0
	ldsh	[%l7 + %l0],	%i0
	nop
	set	0x08, %o4
	sth	%i2,	[%l7 + %o4]
	fpsub16	%f0,	%f18,	%f22
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x0C, %l5
	ldsh	[%l7 + %l5],	%i6
	nop
	set	0x3C, %g5
	stw	%l2,	[%l7 + %g5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l3
	nop
	set	0x62, %i0
	ldsh	[%l7 + %i0],	%g1
	set	0x18, %o6
	prefetcha	[%l7 + %o6] 0x81,	 0
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	ld	[%l7 + 0x20],	%f6
	and	%i1,	%g5,	%o4
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%g6
	wr	%o1,	%o2,	%softint
	nop
	set	0x1C, %i2
	lduw	[%l7 + %i2],	%g7
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%g2
	set	0x40, %g7
	stxa	%g4,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x20, %g4
	lda	[%l7 + %g4] 0x81,	%f13
	set	0x4C, %l6
	swapa	[%l7 + %l6] 0x81,	%o7
	nop
	set	0x18, %o2
	std	%f8,	[%l7 + %o2]
	nop
	set	0x5E, %l4
	ldsh	[%l7 + %l4],	%o6
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%l1
	nop
	set	0x7F, %o5
	stb	%l6,	[%l7 + %o5]
	nop
	set	0x50, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x10, %o1
	stb	%o0,	[%l7 + %o1]
	nop
	set	0x28, %g2
	lduh	[%l7 + %g2],	%i4
	nop
	set	0x17, %l1
	ldstub	[%l7 + %l1],	%o3
	nop
	set	0x10, %l2
	std	%g2,	[%l7 + %l2]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%i7
	nop
	set	0x28, %i7
	std	%i2,	[%l7 + %i7]
	add	%l5,	%l4,	%i2
	nop
	set	0x56, %i1
	ldub	[%l7 + %i1],	%i0
	and	%l2,	%i6,	%o5
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xc8
	st	%f3,	[%l7 + 0x78]
	ld	[%l7 + 0x44],	%f11
	nop
	set	0x62, %o7
	ldub	[%l7 + %o7],	%l3
	or	%i5,	%i1,	%g5
	set	0x50, %l3
	lda	[%l7 + %l3] 0x80,	%f5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xeb,	%g0
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%o4
	nop
	set	0x5C, %i5
	swap	[%l7 + %i5],	%g6
	st	%f13,	[%l7 + 0x7C]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf9
	membar	#Sync
	nop
	set	0x08, %l5
	swap	[%l7 + %l5],	%o1
	set	0x50, %l0
	lda	[%l7 + %l0] 0x88,	%f16
	set	0x35, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g7
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%g2
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%g4
	nop
	set	0x54, %o3
	lduw	[%l7 + %o3],	%o2
	ld	[%l7 + 0x54],	%f1
	set	0x52, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%o6
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%l6
	set	0x48, %g7
	swapa	[%l7 + %g7] 0x81,	%o0
	st	%fsr,	[%l7 + 0x68]
	wr	%o3,	%g3,	%set_softint
	or	%i4,	%l0,	%i7
	ld	[%l7 + 0x0C],	%f1
	nop
	set	0x20, %i2
	std	%f20,	[%l7 + %i2]
	nop
	set	0x3B, %g4
	ldstub	[%l7 + %g4],	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%i2
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%i0
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x80,	 1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i6
	set	0x2C, %o2
	sta	%f29,	[%l7 + %o2] 0x89
	nop
	set	0x68, %g1
	std	%f30,	[%l7 + %g1]
	set	0x66, %o5
	stha	%o5,	[%l7 + %o5] 0x89
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x89,	%l3
	fpadd16s	%f25,	%f8,	%f16
	set	0x20, %o0
	stha	%i5,	[%l7 + %o0] 0x80
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd8,	%f0
	add	%i1,	%g5,	%o4
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%g6
	set	0x78, %i7
	swapa	[%l7 + %i7] 0x89,	%o1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x64, %i1
	sta	%f19,	[%l7 + %i1] 0x89
	nop
	set	0x4C, %i3
	swap	[%l7 + %i3],	%g2
	nop
	set	0x44, %o7
	lduh	[%l7 + %o7],	%g4
	set	0x34, %l2
	sta	%f4,	[%l7 + %l2] 0x80
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xeb,	%o6
	st	%fsr,	[%l7 + 0x4C]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xda
	set	0x10, %i4
	stda	%l0,	[%l7 + %i4] 0xe3
	membar	#Sync
	add	%o6,	%o2,	%o0
	nop
	set	0x76, %o4
	lduh	[%l7 + %o4],	%l6
	nop
	set	0x50, %l5
	ldstub	[%l7 + %l5],	%o3
	add	%g3,	%l0,	%i7
	nop
	set	0x6B, %l0
	ldsb	[%l7 + %l0],	%i4
	nop
	set	0x60, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x1F, %o6
	ldsb	[%l7 + %o6],	%i2
	nop
	set	0x26, %i0
	ldstub	[%l7 + %i0],	%l5
	nop
	set	0x79, %o3
	ldsb	[%l7 + %o3],	%l4
	nop
	set	0x1E, %g5
	lduh	[%l7 + %g5],	%l2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	set	0x08, %i6
	stha	%i6,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x50, %g4
	ldx	[%l7 + %g4],	%i0
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%l2
	set	0x18, %l6
	lda	[%l7 + %l6] 0x80,	%f0
	nop
	set	0x48, %o2
	ldub	[%l7 + %o2],	%o5
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f16
	fpsub16s	%f6,	%f15,	%f9
	nop
	set	0x58, %g1
	sth	%i1,	[%l7 + %g1]
	nop
	set	0x20, %o1
	std	%f12,	[%l7 + %o1]
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f12
	nop
	set	0x10, %o0
	ldx	[%l7 + %o0],	%i5
	wr	%g5,	%g6,	%clear_softint
	nop
	set	0x08, %g2
	ldx	[%l7 + %g2],	%o1
	nop
	set	0x64, %i7
	stw	%o4,	[%l7 + %i7]
	nop
	set	0x72, %l1
	lduh	[%l7 + %l1],	%g7
	nop
	set	0x10, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x2C, %o7
	sth	%g2,	[%l7 + %o7]
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%o7
	and	%l1,	%o6,	%g4
	nop
	set	0x70, %l3
	swap	[%l7 + %l3],	%o0
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%l6
	fpadd16s	%f14,	%f15,	%f9
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x89,	 2
	nop
	set	0x39, %o4
	ldub	[%l7 + %o4],	%g3
	set	0x20, %l2
	ldda	[%l7 + %l2] 0xea,	%l0
	nop
	set	0x78, %l0
	std	%f4,	[%l7 + %l0]
	bg,a	%icc,	loop_9
	nop
	set	0x68, %l5
	std	%f28,	[%l7 + %l5]
	nop
	set	0x0C, %o6
	ldub	[%l7 + %o6],	%o3
	nop
	set	0x1C, %i0
	ldsw	[%l7 + %i0],	%i4
loop_9:
	nop
	set	0x38, %o3
	ldsw	[%l7 + %o3],	%i7
	add	%i3,	%l5,	%l4
	nop
	set	0x5C, %g5
	swap	[%l7 + %g5],	%i2
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%i6
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x81,	 3
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x88,	%l3
	nop
	set	0x50, %g7
	stx	%l2,	[%l7 + %g7]
	nop
	set	0x68, %g4
	prefetch	[%l7 + %g4],	 2
	set	0x40, %i2
	lda	[%l7 + %i2] 0x89,	%f8
	set	0x08, %o2
	sta	%f0,	[%l7 + %o2] 0x88
	nop
	set	0x38, %l4
	lduw	[%l7 + %l4],	%o5
	ld	[%l7 + 0x78],	%f17
	set	0x40, %g1
	stwa	%i5,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x28, %l6
	std	%f14,	[%l7 + %l6]
	nop
	set	0x44, %o5
	swap	[%l7 + %o5],	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%o1
	nop
	set	0x5E, %o0
	sth	%o4,	[%l7 + %o0]
	set	0x64, %o1
	sta	%f23,	[%l7 + %o1] 0x80
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%g1
	fpsub16s	%f27,	%f14,	%f26
	nop
	set	0x58, %i7
	stx	%g2,	[%l7 + %i7]
	nop
	set	0x14, %l1
	stw	%g5,	[%l7 + %l1]
	fpadd32	%f24,	%f26,	%f8
	set	0x48, %g2
	sta	%f29,	[%l7 + %g2] 0x81
	nop
	set	0x64, %i3
	lduh	[%l7 + %i3],	%l1
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x08, %i1
	ldsw	[%l7 + %i1],	%o0
	nop
	set	0x44, %o7
	ldsh	[%l7 + %o7],	%g4
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x81,	 4
	nop
	set	0x70, %i4
	std	%o2,	[%l7 + %i4]
	nop
	set	0x14, %l3
	ldsw	[%l7 + %l3],	%g3
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%l0
	nop
	set	0x48, %l0
	std	%f26,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x70, %l5
	stw	%o3,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x64]
	set	0x23, %l2
	stba	%i4,	[%l7 + %l2] 0x89
	set	0x58, %o6
	stxa	%i7,	[%l7 + %o6] 0xeb
	membar	#Sync
	and	%l5,	%i3,	%l4
	nop
	set	0x28, %i0
	std	%f18,	[%l7 + %i0]
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x81,	%i6
	wr	%i0,	%l3,	%pic
	nop
	set	0x44, %g5
	stw	%l2,	[%l7 + %g5]
	nop
	set	0x78, %i5
	swap	[%l7 + %i5],	%i2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f16
	or	%o5,	%i1,	%i5
	nop
	set	0x20, %g6
	stw	%g6,	[%l7 + %g6]
	st	%f4,	[%l7 + 0x34]
	and	%o1,	%o4,	%g7
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%g0
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe2,	%g2
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x80,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%o6
	set	0x50, %l4
	stxa	%o0,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x5C, %g1
	sth	%l1,	[%l7 + %g1]
	add	%g4,	%l6,	%o2
	nop
	set	0x14, %g4
	stw	%g3,	[%l7 + %g4]
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	set	0x7F, %o0
	ldstub	[%l7 + %o0],	%i4
	wr	%l0,	%i7,	%pic
	nop
	set	0x5E, %l6
	ldsh	[%l7 + %l6],	%l5
	or	%l4,	%i3,	%i6
	set	0x20, %o1
	stda	%l2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x50, %l1
	stda	%l2,	[%l7 + %l1] 0x81
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f0
	nop
	set	0x28, %i7
	std	%f10,	[%l7 + %i7]
	set	0x58, %i3
	sta	%f22,	[%l7 + %i3] 0x81
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%i0
	add	%o5,	%i2,	%i1
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%g6
	nop
	set	0x38, %i4
	ldsh	[%l7 + %i4],	%o1
	fpadd32	%f24,	%f18,	%f30
	nop
	set	0x7C, %l3
	sth	%o4,	[%l7 + %l3]
	st	%f31,	[%l7 + 0x2C]
	or	%i5,	%g7,	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%g2
	nop
	set	0x38, %o4
	std	%f12,	[%l7 + %o4]
	set	0x08, %g3
	stda	%o6,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x7C, %l0
	stba	%o6,	[%l7 + %l0] 0xe2
	membar	#Sync
	st	%f17,	[%l7 + 0x58]
	set	0x30, %l2
	lda	[%l7 + %l2] 0x81,	%f19
	st	%fsr,	[%l7 + 0x58]
	set	0x10, %o6
	stxa	%l1,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x20, %i0
	sta	%f26,	[%l7 + %i0] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x67, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o2
	bne	%xcc,	loop_10
	nop
	set	0x50, %l5
	ldsw	[%l7 + %l5],	%g3
	or	%o3,	%i4,	%l0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f0
loop_10:
	nop
	set	0x4C, %g5
	ldstub	[%l7 + %g5],	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%l4
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%i3
	bge,pt	%icc,	loop_11
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%i6
	nop
	set	0x64, %i2
	swap	[%l7 + %i2],	%l3
	set	0x30, %o2
	stha	%l5,	[%l7 + %o2] 0xe3
	membar	#Sync
loop_11:
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%i2
	nop
	set	0x10, %g7
	std	%i0,	[%l7 + %g7]
	nop
	set	0x4E, %g4
	ldstub	[%l7 + %g4],	%o5
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x89,	%g6
	set	0x74, %o0
	swapa	[%l7 + %o0] 0x80,	%o4
	and	%i5,	%g7,	%o1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%g2
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f24
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	set	0x40, %l1
	ldxa	[%l7 + %l1] 0x81,	%o7
	st	%f6,	[%l7 + 0x68]
	nop
	set	0x5C, %g2
	lduh	[%l7 + %g2],	%o6
	nop
	set	0x30, %l6
	std	%l0,	[%l7 + %l6]
	nop
	set	0x26, %i7
	sth	%o0,	[%l7 + %i7]
	set	0x62, %i3
	stba	%g5,	[%l7 + %i3] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%g3
	set	0x1C, %i1
	sta	%f16,	[%l7 + %i1] 0x81
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f24
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x13, %o4
	ldub	[%l7 + %o4],	%o2
	set	0x78, %g3
	stxa	%o3,	[%l7 + %g3] 0x88
	ld	[%l7 + 0x2C],	%f5
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x89,	%i4
	nop
	set	0x2D, %l2
	ldstub	[%l7 + %l2],	%l0
	add	%l6,	%l4,	%i3
	nop
	set	0x58, %o6
	lduh	[%l7 + %o6],	%i7
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xda
	and	%i6,	%l5,	%l3
	set	0x5D, %l0
	stba	%l2,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x89,	%i2
	set	0x58, %l5
	sta	%f19,	[%l7 + %l5] 0x81
	nop
	set	0x44, %i5
	ldstub	[%l7 + %i5],	%i0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xcc
	ld	[%l7 + 0x5C],	%f20
	set	0x2D, %g6
	stba	%i1,	[%l7 + %g6] 0x89
	set	0x54, %i2
	swapa	[%l7 + %i2] 0x89,	%g6
	nop
	set	0x70, %i6
	swap	[%l7 + %i6],	%o5
	and	%i5,	%o4,	%o1
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf8
	membar	#Sync
	and	%g2,	%o7,	%o6
	set	0x5A, %o2
	stha	%l1,	[%l7 + %o2] 0x80
	set	0x7C, %o5
	lda	[%l7 + %o5] 0x81,	%f25
	set	0x19, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o0
	nop
	set	0x6B, %g1
	ldsb	[%l7 + %g1],	%g5
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xea,	%g6
	nop
	set	0x2F, %o1
	ldstub	[%l7 + %o1],	%g4
	wr	%g3,	%o2,	%y
	or	%o3,	%l0,	%i4
	set	0x64, %l1
	stba	%l6,	[%l7 + %l1] 0x89
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f20
	nop
	set	0x60, %g2
	sth	%i3,	[%l7 + %g2]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xcc
	nop
	set	0x28, %i1
	std	%l4,	[%l7 + %i1]
	nop
	set	0x44, %i4
	stw	%i6,	[%l7 + %i4]
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x08, %i3
	stxa	%i7,	[%l7 + %i3] 0x88
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f0
	nop
	set	0x44, %g3
	lduw	[%l7 + %g3],	%l5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i2
	nop
	set	0x68, %l2
	lduh	[%l7 + %l2],	%l3
	nop
	set	0x26, %o6
	sth	%i1,	[%l7 + %o6]
	and	%i0,	%o5,	%i5
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f8
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%g6
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x88,	%o4
	and	%o1,	%g2,	%g1
	nop
	set	0x3C, %l5
	prefetch	[%l7 + %l5],	 0
	wr	%o6,	%o7,	%clear_softint
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xea,	%l0
	st	%f31,	[%l7 + 0x1C]
	nop
	set	0x46, %g5
	stb	%o0,	[%l7 + %g5]
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%g6
	nop
	set	0x6C, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%g4
	set	0x58, %i2
	stxa	%g5,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f16
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x49, %o0
	ldsb	[%l7 + %o0],	%o2
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x80,	 1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%o3
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%l6
	set	0x28, %o1
	stxa	%i3,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x1D, %l1
	stb	%i4,	[%l7 + %l1]
	nop
	set	0x08, %g4
	std	%f30,	[%l7 + %g4]
	nop
	set	0x34, %g2
	lduw	[%l7 + %g2],	%l4
	nop
	set	0x74, %i7
	stw	%i6,	[%l7 + %i7]
	set	0x10, %l6
	stwa	%l5,	[%l7 + %l6] 0x89
	st	%f11,	[%l7 + 0x7C]
	set	0x64, %i4
	sta	%f12,	[%l7 + %i4] 0x80
	wr	%l2,	%i7,	%pic
	set	0x44, %i1
	sta	%f8,	[%l7 + %i1] 0x81
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f24
	nop
	set	0x24, %o4
	ldsw	[%l7 + %o4],	%l3
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x80,	%i2
	st	%fsr,	[%l7 + 0x18]
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x89,	%i0
	set	0x30, %g3
	stha	%o5,	[%l7 + %g3] 0xeb
	membar	#Sync
	add	%i1,	%i5,	%o4
	nop
	set	0x1C, %l3
	ldsb	[%l7 + %l3],	%o1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%g1
	set	0x3D, %o6
	stba	%o6,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x80,	%o7
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%l0
	wr	%g6,	%g7,	%y
	bn	%icc,	loop_12
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%o0
	wr	%g5,	%o2,	%clear_softint
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x80,	%g3
loop_12:
	nop
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xc4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x81
	nop
	set	0x64, %l4
	swap	[%l7 + %l4],	%o3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f0
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xe3,	%i6
	set	0x48, %i6
	stwa	%i3,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x1B, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g4
	nop
	set	0x4C, %o2
	lduw	[%l7 + %o2],	%l4
	and	%i4,	%l5,	%i6
	wr 	%g0, 	0x7, 	%fprs
	st	%f11,	[%l7 + 0x38]
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x89,	 2
	nop
	set	0x78, %o1
	stx	%l2,	[%l7 + %o1]
	nop
	set	0x48, %o5
	ldub	[%l7 + %o5],	%i0
	nop
	set	0x1F, %l1
	ldstub	[%l7 + %l1],	%i1
	nop
	set	0x0C, %g2
	ldsh	[%l7 + %g2],	%i5
	nop
	set	0x14, %i7
	ldsb	[%l7 + %i7],	%o5
	nop
	set	0x58, %g4
	ldx	[%l7 + %g4],	%o4
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%g2
	nop
	set	0x68, %i1
	std	%o0,	[%l7 + %i1]
	add	%g1,	%o6,	%l1
	nop
	set	0x42, %i3
	ldsh	[%l7 + %i3],	%o7
	nop
	set	0x72, %o4
	ldub	[%l7 + %o4],	%g6
	set	0x20, %l2
	lda	[%l7 + %l2] 0x80,	%f28
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%g5
	nop
	set	0x20, %o7
	std	%g6,	[%l7 + %o7]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%o2
	nop
	set	0x74, %l3
	lduw	[%l7 + %l3],	%l0
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x89,	%o3
	set	0x2F, %l0
	stba	%l6,	[%l7 + %l0] 0x81
	set	0x7C, %l5
	stwa	%i3,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x5A, %g3
	ldstub	[%l7 + %g3],	%l4
	nop
	set	0x3A, %g5
	ldstub	[%l7 + %g5],	%g4
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	wr	%i4,	%i6,	%pic
	or	%l5,	%i7,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%i0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%i5
	nop
	set	0x1C, %i5
	prefetch	[%l7 + %i5],	 1
	add	%o5,	%i1,	%o4
	add	%g2,	%g1,	%o6
	nop
	nop
	setx	0xD2939595,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xEDC72ADA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f27,	%f19
	nop
	set	0x64, %o3
	ldstub	[%l7 + %o3],	%l1
	set	0x34, %l4
	stha	%o1,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x5C, %i2
	ldsh	[%l7 + %i2],	%o7
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x74, %i6
	sta	%f22,	[%l7 + %i6] 0x81
	and	%g6,	%g5,	%o0
	nop
	set	0x64, %o0
	swap	[%l7 + %o0],	%g3
	st	%f20,	[%l7 + 0x6C]
	set	0x18, %g6
	swapa	[%l7 + %g6] 0x81,	%g7
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x88
	nop
	set	0x10, %o1
	swap	[%l7 + %o1],	%l0
	st	%fsr,	[%l7 + 0x74]
	set	0x18, %o5
	stxa	%o3,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x88,	%l6
	nop
	set	0x40, %g2
	std	%f28,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x78, %l1
	std	%f4,	[%l7 + %l1]
	add	%i3,	%o2,	%g4
	set	0x58, %i7
	stha	%i4,	[%l7 + %i7] 0x88
	nop
	set	0x1F, %l6
	stb	%i6,	[%l7 + %l6]
	nop
	set	0x58, %i4
	ldsw	[%l7 + %i4],	%l4
	ld	[%l7 + 0x30],	%f2
	fpadd16s	%f20,	%f12,	%f5
	add	%l5,	%l3,	%i7
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%i0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf1
	membar	#Sync
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xeb,	%i2
	nop
	set	0x26, %i1
	lduh	[%l7 + %i1],	%i5
	add	%o5,	%i1,	%l2
	set	0x7C, %o7
	stba	%g2,	[%l7 + %o7] 0x89
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xda
	wr	%o4,	%g1,	%y
	set	0x18, %o6
	lda	[%l7 + %o6] 0x89,	%f28
	nop
	set	0x4C, %l5
	ldsh	[%l7 + %l5],	%o6
	wr	%l1,	%o7,	%pic
	and	%g6,	%g5,	%o1
	nop
	set	0x18, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x08, %l0
	stba	%o0,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xda
	nop
	set	0x50, %i5
	std	%g2,	[%l7 + %i5]
	nop
	set	0x48, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x25, %l4
	stb	%l0,	[%l7 + %l4]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf8
	membar	#Sync
	nop
	set	0x4C, %g7
	lduw	[%l7 + %g7],	%g7
	wr	%o3,	%l6,	%ccr
	set	0x2C, %i2
	swapa	[%l7 + %i2] 0x80,	%o2
	and	%i3,	%i4,	%g4
	nop
	set	0x2C, %i6
	ldsh	[%l7 + %i6],	%l4
	nop
	set	0x44, %o0
	ldsb	[%l7 + %o0],	%i6
	nop
	set	0x68, %g6
	lduw	[%l7 + %g6],	%l3
	set	0x28, %o1
	lda	[%l7 + %o1] 0x89,	%f15
	set	0x10, %o5
	stxa	%l5,	[%l7 + %o5] 0x89
	set	0x20, %g1
	stda	%i0,	[%l7 + %g1] 0x89
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%i7
	nop
	set	0x10, %o2
	std	%i2,	[%l7 + %o2]
	nop
	set	0x30, %l1
	stw	%i5,	[%l7 + %l1]
	be,a,pt	%xcc,	loop_13
	nop
	set	0x20, %i7
	std	%o4,	[%l7 + %i7]
	set	0x41, %l6
	stba	%i1,	[%l7 + %l6] 0xeb
	membar	#Sync
loop_13:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%o4
	set	0x08, %i4
	stha	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x88,	%g0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f16
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%f26
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%o6
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f24
	set	0x6C, %i1
	sta	%f31,	[%l7 + %i1] 0x80
	nop
	set	0x28, %l5
	ldstub	[%l7 + %l5],	%o7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%g5
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x80,	%o0
	st	%f11,	[%l7 + 0x0C]
	nop
	set	0x10, %g3
	ldub	[%l7 + %g3],	%g6
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%g3
	or	%l0,	%g7,	%o3
	set	0x64, %i5
	sta	%f20,	[%l7 + %i5] 0x89
	set	0x20, %i0
	stda	%i6,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x28, %l4
	sta	%f6,	[%l7 + %l4] 0x88
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	ld	[%l7 + 0x5C],	%f28
	nop
	set	0x0C, %g7
	sth	%o0,	[%l7 + %g7]
	nop
	set	0x48, %i2
	std	%f24,	[%l7 + %i2]
	st	%f26,	[%l7 + 0x14]
	and	%i3,	%i4,	%o2
	nop
	set	0x58, %i6
	stx	%g4,	[%l7 + %i6]
	nop
	set	0x18, %o3
	std	%i6,	[%l7 + %o3]
	nop
	set	0x16, %g6
	sth	%l3,	[%l7 + %g6]
	nop
	set	0x28, %o0
	lduw	[%l7 + %o0],	%l5
	set	0x67, %o1
	stba	%i0,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x60, %o5
	stda	%l4,	[%l7 + %o5] 0x81
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%i2
	set	0x69, %o2
	stba	%i5,	[%l7 + %o2] 0x89
	nop
	set	0x7A, %l1
	ldsb	[%l7 + %l1],	%i7
	set	0x68, %g2
	stda	%i0,	[%l7 + %g2] 0x80
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%o4
	nop
	set	0x2F, %i4
	ldub	[%l7 + %i4],	%l2
	set	0x20, %g4
	stda	%g0,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f6
	nop
	set	0x66, %i7
	lduh	[%l7 + %i7],	%g2
	set	0x64, %l2
	stwa	%o6,	[%l7 + %l2] 0x89
	nop
	set	0x44, %o7
	ldsh	[%l7 + %o7],	%l1
	set	0x78, %i3
	stxa	%g5,	[%l7 + %i3] 0x89
	nop
	set	0x20, %l3
	std	%f4,	[%l7 + %l3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%g6
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x81,	 1
	fpsub32	%f10,	%f24,	%f4
	nop
	set	0x5C, %l5
	sth	%g3,	[%l7 + %l5]
	nop
	set	0x1C, %g3
	lduh	[%l7 + %g3],	%l0
	nop
	set	0x18, %l0
	std	%f24,	[%l7 + %l0]
	set	0x08, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	set	0x7C, %o6
	sta	%f30,	[%l7 + %o6] 0x80
	nop
	set	0x70, %i0
	ldx	[%l7 + %i0],	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o0
	nop
	set	0x3A, %l4
	lduh	[%l7 + %l4],	%i4
	ld	[%l7 + 0x2C],	%f28
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x88
	nop
	set	0x77, %i6
	stb	%o2,	[%l7 + %i6]
	add	%g4,	%i3,	%i6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	set	0x7C, %g6
	sta	%f19,	[%l7 + %g6] 0x88
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x89,	%f2
	wr	%l3,	%i0,	%softint
	ld	[%l7 + 0x54],	%f26
	st	%f28,	[%l7 + 0x64]
	nop
	set	0x20, %g5
	std	%l4,	[%l7 + %g5]
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f16
	nop
	set	0x24, %o5
	ldsh	[%l7 + %o5],	%i5
	st	%fsr,	[%l7 + 0x0C]
	set	0x78, %l1
	swapa	[%l7 + %l1] 0x81,	%i7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%o5
	nop
	set	0x0A, %g2
	sth	%o4,	[%l7 + %g2]
	bge,a	%xcc,	loop_14
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f10
	add	%i1,	%l2,	%g2
	nop
	nop
	setx	0x5945C843,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xA35A0775,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f22,	%f23
loop_14:
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f28
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%o6
	nop
	set	0x14, %o4
	swap	[%l7 + %o4],	%g1
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x88,	%g5
	nop
	set	0x64, %i7
	swap	[%l7 + %i7],	%o7
	set	0x10, %l2
	swapa	[%l7 + %l2] 0x88,	%l1
	st	%f15,	[%l7 + 0x2C]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	nop
	set	0x38, %l3
	std	%o0,	[%l7 + %l3]
	or	%g3,	%l0,	%g6
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%o3
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%g7
	wr	%o0,	%l6,	%set_softint
	nop
	set	0x74, %i1
	ldsw	[%l7 + %i1],	%i4
	ld	[%l7 + 0x18],	%f16
	nop
	set	0x42, %g3
	lduh	[%l7 + %g3],	%g4
	set	0x44, %l0
	swapa	[%l7 + %l0] 0x88,	%o2
	set	0x1A, %i5
	stha	%i3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x14, %o6
	ldub	[%l7 + %o6],	%i6
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd2
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x89,	%i0
	set	0x10, %i2
	stxa	%l4,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x89,	%l3
	nop
	set	0x0C, %i6
	sth	%l5,	[%l7 + %i6]
	set	0x0C, %o3
	lda	[%l7 + %o3] 0x88,	%f17
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%i2
	nop
	set	0x50, %g5
	sth	%o5,	[%l7 + %g5]
	set	0x14, %g1
	swapa	[%l7 + %g1] 0x80,	%o4
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f8
	nop
	set	0x6E, %l1
	sth	%i7,	[%l7 + %l1]
	and	%i1,	%l2,	%g2
	add	%o6,	%g5,	%g1
	nop
	set	0x40, %o1
	ldsw	[%l7 + %o1],	%l1
	st	%fsr,	[%l7 + 0x58]
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	nop
	set	0x38, %g2
	stw	%g3,	[%l7 + %g2]
	set	0x70, %i4
	ldda	[%l7 + %i4] 0xea,	%l0
	set	0x3A, %o4
	stha	%o7,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	nop
	set	0x13, %i7
	stb	%o3,	[%l7 + %i7]
	nop
	set	0x18, %g4
	std	%g6,	[%l7 + %g4]
	set	0x13, %i3
	stba	%o0,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%i4
	nop
	set	0x14, %l3
	stb	%g4,	[%l7 + %l3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i3
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x88
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x89,	%o2
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%i0
	st	%f22,	[%l7 + 0x10]
	nop
	set	0x35, %l0
	stb	%i6,	[%l7 + %l0]
	nop
	set	0x40, %l5
	std	%f24,	[%l7 + %l5]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x88
	nop
	set	0x20, %i0
	std	%l4,	[%l7 + %i0]
	set	0x38, %l4
	stha	%l5,	[%l7 + %l4] 0x80
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x89,	 1
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%i2
	nop
	set	0x34, %i6
	lduw	[%l7 + %i6],	%o5
	bne,a	%xcc,	loop_15
	or	%l3,	%o4,	%i1
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%i6
	nop
	nop
	setx	0xB8F021D8A60AC716,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xD085D9F85A565321,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f10,	%f0
loop_15:
	nop
	set	0x0A, %g6
	ldsh	[%l7 + %g6],	%l2
	nop
	set	0x14, %o0
	ldstub	[%l7 + %o0],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%g1
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f30
	set	0x7E, %g5
	ldstuba	[%l7 + %g5] 0x89,	%o6
	ld	[%l7 + 0x20],	%f8
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%l1
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xcc
	set	0x0A, %o5
	stha	%g3,	[%l7 + %o5] 0x81
	nop
	set	0x56, %l1
	ldstub	[%l7 + %l1],	%l0
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x50, %l6
	prefetch	[%l7 + %l6],	 2
	set	0x20, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%o3
	or	%g7,	%i4,	%g4
	bne,pt	%icc,	loop_16
	nop
	set	0x7D, %o1
	ldstub	[%l7 + %o1],	%o0
	set	0x2C, %o4
	sta	%f23,	[%l7 + %o4] 0x88
loop_16:
	bl	%icc,	loop_17
	add	%i3,	%o2,	%l6
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x89,	%i0
loop_17:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l5
	nop
	set	0x48, %i7
	std	%i4,	[%l7 + %i7]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%i6
	fpadd32	%f22,	%f22,	%f18
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xe3,	%l2
	nop
	set	0x53, %i3
	ldub	[%l7 + %i3],	%o5
	nop
	set	0x68, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x0C, %l3
	stwa	%i1,	[%l7 + %l3] 0x80
	st	%f26,	[%l7 + 0x1C]
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x81,	%o4
	set	0x18, %i1
	stha	%i7,	[%l7 + %i1] 0xea
	membar	#Sync
	and	%l2,	%g2,	%g5
	nop
	set	0x38, %l2
	stx	%o6,	[%l7 + %l2]
	set	0x24, %l0
	sta	%f22,	[%l7 + %l0] 0x88
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f16
	or	%g1,	%o1,	%l1
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%g3
	set	0x73, %g3
	stba	%l0,	[%l7 + %g3] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f16
	nop
	set	0x40, %i0
	ldsw	[%l7 + %i0],	%g6
	nop
	set	0x60, %g7
	std	%f24,	[%l7 + %g7]
	fpsub32	%f26,	%f24,	%f8
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f28
	ld	[%l7 + 0x18],	%f30
	nop
	set	0x1C, %g6
	stw	%o7,	[%l7 + %g6]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f0
	set	0x2D, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g7
	nop
	set	0x35, %o0
	ldstub	[%l7 + %o0],	%i4
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%g4
	or	%o3,	%i3,	%o0
	set	0x40, %g5
	stxa	%l6,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x30, %o5
	stda	%i0,	[%l7 + %o5] 0x81
	add	%o2,	%l4,	%i5
	nop
	set	0x46, %l6
	ldsh	[%l7 + %l6],	%l5
	nop
	set	0x4C, %g2
	prefetch	[%l7 + %g2],	 4
	add	%i6,	%l3,	%o5
	set	0x78, %o1
	lda	[%l7 + %o1] 0x88,	%f28
	nop
	set	0x49, %l1
	ldstub	[%l7 + %l1],	%i1
	nop
	set	0x34, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%o4
	set	0x68, %o2
	stda	%i6,	[%l7 + %o2] 0x88
	nop
	set	0x64, %i3
	stw	%l2,	[%l7 + %i3]
	nop
	set	0x27, %g4
	ldstub	[%l7 + %g4],	%g2
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x28, %o7
	swapa	[%l7 + %o7] 0x81,	%g5
	nop
	set	0x68, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x34, %i1
	stb	%g1,	[%l7 + %i1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%l1
	set	0x4C, %l0
	stwa	%g3,	[%l7 + %l0] 0x88
	nop
	set	0x78, %l5
	lduw	[%l7 + %l5],	%l0
	nop
	set	0x62, %l2
	ldsh	[%l7 + %l2],	%g6
	wr	%o7,	%g7,	%clear_softint
	set	0x40, %o6
	stwa	%i4,	[%l7 + %o6] 0x81
	nop
	set	0x58, %g3
	std	%g4,	[%l7 + %g3]
	st	%f26,	[%l7 + 0x50]
	nop
	set	0x69, %i0
	ldub	[%l7 + %i0],	%i2
	nop
	set	0x72, %l4
	ldsh	[%l7 + %l4],	%i3
	ld	[%l7 + 0x1C],	%f9
	set	0x60, %g7
	lda	[%l7 + %g7] 0x81,	%f30
	nop
	set	0x10, %i6
	stw	%o3,	[%l7 + %i6]
	fpadd16s	%f2,	%f2,	%f11
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x80,	 0
	st	%f4,	[%l7 + 0x48]
	set	0x60, %i2
	stda	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x28, %i5
	stda	%o2,	[%l7 + %i5] 0x81
	bne,a	%xcc,	loop_18
	nop
	set	0x46, %o0
	lduh	[%l7 + %o0],	%l6
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%i4
	set	0x49, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l4
loop_18:
	nop
	set	0x0C, %o5
	lduw	[%l7 + %o5],	%i6
	set	0x48, %l6
	stxa	%l3,	[%l7 + %l6] 0x81
	fpsub32s	%f18,	%f1,	%f14
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%l4
	or	%o5,	%o4,	%i1
	nop
	set	0x30, %g2
	ldstub	[%l7 + %g2],	%i7
	ld	[%l7 + 0x30],	%f26
	set	0x20, %l1
	stha	%g2,	[%l7 + %l1] 0x80
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x51, %i4
	ldsb	[%l7 + %i4],	%l2
	nop
	set	0x10, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x53, %o2
	stb	%o1,	[%l7 + %o2]
	nop
	nop
	setx	0x870977B7FF824018,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1934911CDF5C90B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f22
	bg,pn	%xcc,	loop_19
	nop
	set	0x6C, %i3
	stb	%l1,	[%l7 + %i3]
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%g3
	set	0x2D, %g4
	stba	%l0,	[%l7 + %g4] 0x88
loop_19:
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%g6
	nop
	set	0x1A, %i7
	ldstub	[%l7 + %i7],	%o7
	add	%g1,	%i4,	%g4
	nop
	nop
	setx	0xB0F4FFC53043EC67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1E89C0397102C070,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f18
	nop
	set	0x6A, %i1
	ldsh	[%l7 + %i1],	%g7
	add	%i2,	%o3,	%i3
	set	0x70, %l0
	stwa	%i0,	[%l7 + %l0] 0x80
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l6
	nop
	set	0x38, %l5
	sth	%o0,	[%l7 + %l5]
	add	%i5,	%l4,	%i6
	set	0x38, %o7
	stda	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%o4
	ld	[%l7 + 0x54],	%f10
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x80,	 2
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x58, %g3
	lduw	[%l7 + %g3],	%l5
	ld	[%l7 + 0x54],	%f20
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%i7
	nop
	set	0x3F, %g7
	ldstub	[%l7 + %g7],	%i1
	nop
	set	0x63, %l4
	ldstub	[%l7 + %l4],	%g2
	nop
	set	0x6E, %i6
	ldsb	[%l7 + %i6],	%o6
	set	0x58, %g6
	lda	[%l7 + %g6] 0x89,	%f5
	nop
	set	0x50, %i2
	ldsw	[%l7 + %i2],	%g5
	bl	%icc,	loop_20
	nop
	set	0x36, %i5
	ldstub	[%l7 + %i5],	%o1
	nop
	set	0x46, %o0
	lduh	[%l7 + %o0],	%l1
	nop
	set	0x0B, %g5
	ldstub	[%l7 + %g5],	%l2
loop_20:
	nop
	set	0x38, %o5
	stwa	%l0,	[%l7 + %o5] 0x89
	ld	[%l7 + 0x7C],	%f26
	nop
	set	0x30, %l6
	stx	%g6,	[%l7 + %l6]
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x88,	%o7
	and	%g1,	%i4,	%g3
	set	0x40, %g2
	stwa	%g7,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f24
	set	0x6E, %l1
	stha	%i2,	[%l7 + %l1] 0x80
	st	%f29,	[%l7 + 0x34]
	nop
	set	0x09, %o4
	stb	%o3,	[%l7 + %o4]
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%i3
	set	0x65, %i3
	stba	%i0,	[%l7 + %i3] 0x80
	nop
	set	0x4F, %o1
	ldub	[%l7 + %o1],	%o2
	set	0x0E, %g4
	stha	%g4,	[%l7 + %g4] 0xea
	membar	#Sync
	fpadd32s	%f24,	%f26,	%f16
	st	%f29,	[%l7 + 0x54]
	nop
	set	0x3C, %l3
	sth	%o0,	[%l7 + %l3]
	set	0x09, %i7
	stba	%l6,	[%l7 + %i7] 0x89
	nop
	set	0x1C, %i4
	swap	[%l7 + %i4],	%i5
	st	%f15,	[%l7 + 0x08]
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%l4
	and	%i6,	%l3,	%o5
	set	0x64, %l5
	sta	%f8,	[%l7 + %l5] 0x89
	set	0x58, %o7
	stha	%l5,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x7C, %i1
	stw	%o4,	[%l7 + %i1]
	nop
	set	0x70, %o6
	stx	%i1,	[%l7 + %o6]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%g5
	set	0x58, %g3
	ldxa	[%l7 + %g3] 0x81,	%o1
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%l1
	set	0x30, %l2
	ldxa	[%l7 + %l2] 0x81,	%l2
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%l0
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x80,	%o7
	set	0x4E, %g6
	stha	%g6,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x20, %i2
	lda	[%l7 + %i2] 0x88,	%f4
	set	0x70, %g7
	lda	[%l7 + %g7] 0x81,	%f10
	add	%g1,	%i4,	%g3
	nop
	set	0x10, %i5
	ldsw	[%l7 + %i5],	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%i3
	nop
	set	0x40, %o0
	stx	%i0,	[%l7 + %o0]
	set	0x54, %g5
	swapa	[%l7 + %g5] 0x88,	%o2
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc4
	wr	%o3,	%o0,	%y
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x89,	%g4
	set	0x74, %g1
	swapa	[%l7 + %g1] 0x89,	%l6
	set	0x3C, %o3
	swapa	[%l7 + %o3] 0x80,	%l4
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%i6
	set	0x14, %g2
	stwa	%l3,	[%l7 + %g2] 0xe2
	membar	#Sync
	st	%f26,	[%l7 + 0x58]
	nop
	set	0x51, %i3
	ldub	[%l7 + %i3],	%o5
	set	0x08, %o1
	stxa	%l5,	[%l7 + %o1] 0xea
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%g2
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x55, %g4
	ldstub	[%l7 + %g4],	%o6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x10, %i7
	std	%f26,	[%l7 + %i7]
	nop
	set	0x2A, %l3
	ldstub	[%l7 + %l3],	%i7
	ld	[%l7 + 0x0C],	%f28
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%i0
	set	0x40, %l0
	swapa	[%l7 + %l0] 0x88,	%g5
	nop
	set	0x78, %l5
	std	%o0,	[%l7 + %l5]
	set	0x5D, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l2
	fpadd32s	%f24,	%f26,	%f19
	nop
	set	0x28, %o7
	lduh	[%l7 + %o7],	%l1
	set	0x5C, %o6
	sta	%f24,	[%l7 + %o6] 0x89
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x2C, %i0
	swap	[%l7 + %i0],	%l0
	and	%g6,	%o7,	%g1
	set	0x68, %l4
	lda	[%l7 + %l4] 0x81,	%f11
	add	%i4,	%g7,	%g3
	nop
	set	0x10, %l2
	std	%i2,	[%l7 + %l2]
	wr	%i2,	%i0,	%clear_softint
	nop
	set	0x14, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f4
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x80,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%g4
	nop
	set	0x48, %i5
	stw	%l6,	[%l7 + %i5]
	set	0x28, %o0
	stba	%o0,	[%l7 + %o0] 0x89
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%l4
	fpsub32	%f30,	%f24,	%f30
	nop
	set	0x43, %i2
	ldub	[%l7 + %i2],	%i6
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x88,	%f1
	set	0x5C, %o5
	lda	[%l7 + %o5] 0x89,	%f24
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x89,	%l3
	nop
	set	0x50, %g1
	stx	%o5,	[%l7 + %g1]
	nop
	set	0x54, %l1
	stw	%l5,	[%l7 + %l1]
	set	0x1A, %o4
	ldstuba	[%l7 + %o4] 0x88,	%o4
	nop
	set	0x48, %g2
	stx	%fsr,	[%l7 + %g2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%o6
	nop
	set	0x2B, %i3
	ldstub	[%l7 + %i3],	%i7
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f10
	set	0x6C, %o1
	sta	%f2,	[%l7 + %o1] 0x81
	nop
	set	0x08, %o2
	std	%i4,	[%l7 + %o2]
	nop
	set	0x39, %l3
	ldub	[%l7 + %l3],	%g5
	nop
	nop
	setx	0xB6F6F09DA689A959,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5E51EA1CF5105427,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f0,	%f28
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%i0
	nop
	set	0x4D, %i4
	stb	%o1,	[%l7 + %i4]
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x89,	%l1
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%l0
	set	0x13, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g6
	nop
	set	0x20, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x20, %g3
	ldsh	[%l7 + %g3],	%o7
	nop
	set	0x69, %i0
	ldub	[%l7 + %i0],	%l2
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xe3,	%i4
	nop
	set	0x60, %l2
	stw	%g1,	[%l7 + %l2]
	nop
	set	0x20, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x62, %g6
	ldsh	[%l7 + %g6],	%g7
	set	0x13, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i3
	or	%g3,	%i2,	%i0
	nop
	set	0x64, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x74, %o0
	stb	%o2,	[%l7 + %o0]
	set	0x6C, %l4
	swapa	[%l7 + %l4] 0x81,	%o3
	st	%f17,	[%l7 + 0x34]
	and	%l6,	%o0,	%l4
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f0
	nop
	set	0x76, %g5
	ldstub	[%l7 + %g5],	%g4
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	nop
	set	0x40, %o3
	stw	%i6,	[%l7 + %o3]
	nop
	set	0x54, %g1
	ldsh	[%l7 + %g1],	%o5
	nop
	set	0x30, %l1
	stw	%o4,	[%l7 + %l1]
	set	0x4C, %o4
	lda	[%l7 + %o4] 0x89,	%f22
	nop
	set	0x08, %i3
	stx	%l5,	[%l7 + %i3]
	add	%g2,	%o6,	%i5
	nop
	set	0x18, %g2
	std	%g4,	[%l7 + %g2]
	ld	[%l7 + 0x10],	%f21
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x58, %g4
	stda	%i0,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x4C, %o2
	lda	[%l7 + %o2] 0x80,	%f0
	set	0x78, %l3
	stha	%o1,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x7C, %i7
	stwa	%l1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x5B, %i4
	ldub	[%l7 + %i4],	%l0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1274
!	Type a   	: 33
!	Type cti   	: 20
!	Type x   	: 529
!	Type f   	: 40
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
	set	0xE,	%g1
	set	0xA,	%g2
	set	0xD,	%g3
	set	0x1,	%g4
	set	0xA,	%g5
	set	0xF,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xC,	%i1
	set	-0xC,	%i2
	set	-0xB,	%i3
	set	-0x2,	%i4
	set	-0x1,	%i5
	set	-0x8,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x506858E3,	%l0
	set	0x100F6514,	%l1
	set	0x04E0611C,	%l2
	set	0x2726A8D6,	%l3
	set	0x10CB5141,	%l4
	set	0x420BF5D9,	%l5
	set	0x0A3E78B4,	%l6
	!# Output registers
	set	-0x1532,	%o0
	set	-0x0609,	%o1
	set	0x1759,	%o2
	set	0x1BD2,	%o3
	set	-0x05B0,	%o4
	set	0x1DAB,	%o5
	set	0x0ECD,	%o6
	set	0x043C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	and	%g6,	%o7,	%i7
	st	%fsr,	[%l7 + 0x34]
	ld	[%l7 + 0x24],	%f14
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc2
	bg,a,pt	%xcc,	loop_21
	nop
	set	0x60, %l0
	swap	[%l7 + %l0],	%l2
	nop
	set	0x70, %o6
	std	%f16,	[%l7 + %o6]
	nop
	set	0x58, %i1
	sth	%g1,	[%l7 + %i1]
loop_21:
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g6
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f0
	nop
	set	0x60, %l2
	stx	%i4,	[%l7 + %l2]
	nop
	set	0x24, %i6
	sth	%g3,	[%l7 + %i6]
	set	0x14, %g6
	sta	%f27,	[%l7 + %g6] 0x80
	nop
	set	0x4D, %g3
	ldstub	[%l7 + %g3],	%i3
	nop
	set	0x40, %g7
	stx	%i2,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f0
	nop
	set	0x50, %o0
	ldsh	[%l7 + %o0],	%i0
	nop
	set	0x48, %l4
	std	%o2,	[%l7 + %l4]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x81,	%i6
	set	0x40, %l6
	sta	%f10,	[%l7 + %l6] 0x89
	set	0x1A, %o5
	stha	%o0,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x2C, %i2
	lduw	[%l7 + %i2],	%o2
	nop
	set	0x08, %g1
	stb	%l4,	[%l7 + %g1]
	nop
	set	0x10, %o3
	ldsh	[%l7 + %o3],	%l3
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%i6
	nop
	set	0x2A, %l1
	ldsh	[%l7 + %l1],	%g4
	nop
	set	0x64, %i3
	stw	%o4,	[%l7 + %i3]
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x88,	%o5
	nop
	set	0x32, %g2
	lduh	[%l7 + %g2],	%l5
	set	0x3C, %o2
	sta	%f31,	[%l7 + %o2] 0x89
	fpadd32	%f0,	%f28,	%f6
	set	0x50, %g4
	sta	%f23,	[%l7 + %g4] 0x80
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f0
	st	%fsr,	[%l7 + 0x24]
	set	0x21, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g2
	nop
	set	0x5C, %l5
	prefetch	[%l7 + %l5],	 0
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x88,	 4
	or	%g5,	%i1,	%o6
	or	%o1,	%l1,	%l0
	nop
	set	0x70, %l0
	swap	[%l7 + %l0],	%g6
	nop
	set	0x48, %i1
	swap	[%l7 + %i1],	%i7
	set	0x40, %i0
	stda	%l2,	[%l7 + %i0] 0x80
	nop
	set	0x50, %o7
	prefetch	[%l7 + %o7],	 0
	st	%f2,	[%l7 + 0x20]
	set	0x18, %l2
	stxa	%o7,	[%l7 + %l2] 0x88
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%g7
	nop
	set	0x58, %g6
	std	%i4,	[%l7 + %g6]
	set	0x38, %i6
	lda	[%l7 + %i6] 0x88,	%f15
	nop
	set	0x5C, %g7
	ldsb	[%l7 + %g7],	%g3
	ble,a,pn	%icc,	loop_22
	nop
	set	0x40, %g3
	swap	[%l7 + %g3],	%i3
	nop
	set	0x72, %o0
	stb	%g1,	[%l7 + %o0]
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
loop_22:
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%o3
	ld	[%l7 + 0x4C],	%f25
	set	0x18, %l4
	swapa	[%l7 + %l4] 0x88,	%i2
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%i6
	set	0x08, %o5
	prefetcha	[%l7 + %o5] 0x80,	 4
	nop
	set	0x68, %g1
	stx	%l4,	[%l7 + %g1]
	nop
	set	0x28, %o3
	prefetch	[%l7 + %o3],	 0
	or	%o2,	%i6,	%l3
	or	%g4,	%o5,	%l5
	set	0x50, %o4
	ldxa	[%l7 + %o4] 0x81,	%o4
	nop
	set	0x08, %i2
	std	%f4,	[%l7 + %i2]
	set	0x40, %i3
	lda	[%l7 + %i3] 0x88,	%f26
	set	0x78, %l1
	stda	%g2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x4D, %g2
	stb	%i5,	[%l7 + %g2]
	nop
	set	0x5B, %o1
	stb	%g5,	[%l7 + %o1]
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x80,	%o6
	set	0x14, %i7
	stba	%i1,	[%l7 + %i7] 0x80
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf9
	membar	#Sync
	nop
	set	0x77, %i4
	stb	%o1,	[%l7 + %i4]
	wr	%l1,	%l0,	%y
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%g6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%f0
	set	0x20, %l0
	stda	%l2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%g7
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	st	%f18,	[%l7 + 0x2C]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f16
	nop
	set	0x2E, %l2
	ldsh	[%l7 + %l2],	%o7
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x89,	%g3
	nop
	set	0x66, %g6
	ldstub	[%l7 + %g6],	%i3
	st	%f17,	[%l7 + 0x74]
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f8
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x08, %g7
	lduh	[%l7 + %g7],	%g1
	set	0x1C, %i0
	stwa	%i4,	[%l7 + %i0] 0x81
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x54, %o0
	stw	%i0,	[%l7 + %o0]
	set	0x7C, %g3
	sta	%f7,	[%l7 + %g3] 0x80
	nop
	set	0x0C, %i5
	prefetch	[%l7 + %i5],	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l6
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x81,	%o2
	add	%o0,	%l4,	%o2
	nop
	set	0x30, %g5
	std	%f30,	[%l7 + %g5]
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x80,	%i6
	set	0x7C, %l6
	lda	[%l7 + %l6] 0x88,	%f12
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o5
	nop
	set	0x70, %o3
	ldstub	[%l7 + %o3],	%l5
	set	0x6C, %o4
	stha	%o4,	[%l7 + %o4] 0xe2
	membar	#Sync
	or	%g2,	%l3,	%i5
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%o6
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%i1
	wr	%g5,	%l1,	%softint
	nop
	set	0x1B, %l1
	stb	%l0,	[%l7 + %l1]
	and	%o1,	%g6,	%l2
	and	%g7,	%i7,	%o7
	nop
	set	0x76, %g2
	stb	%i3,	[%l7 + %g2]
	nop
	set	0x68, %i3
	ldsb	[%l7 + %i3],	%g3
	fpadd32s	%f26,	%f7,	%f16
	nop
	nop
	setx	0xD7E1C1741AFBEE75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x60588E8DD04B288E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f26,	%f20
	nop
	set	0x38, %g4
	std	%f24,	[%l7 + %g4]
	st	%f12,	[%l7 + 0x48]
	nop
	set	0x6C, %i7
	ldsb	[%l7 + %i7],	%i4
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x10, %o1
	ldsh	[%l7 + %o1],	%g1
	set	0x60, %o2
	stwa	%i2,	[%l7 + %o2] 0x88
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x80,	%i0
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x89,	%o3
	nop
	set	0x08, %l3
	ldsw	[%l7 + %l3],	%l6
	set	0x66, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l4
	nop
	set	0x62, %o7
	ldsh	[%l7 + %o7],	%o2
	nop
	set	0x5C, %l2
	swap	[%l7 + %l2],	%i6
	set	0x14, %o6
	sta	%f30,	[%l7 + %o6] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%o0
	nop
	set	0x48, %i1
	stx	%o5,	[%l7 + %i1]
	nop
	set	0x78, %i6
	std	%l4,	[%l7 + %i6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%o4
	set	0x47, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l3
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%o6
	st	%f20,	[%l7 + 0x08]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f30
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd0
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x81,	 1
	st	%fsr,	[%l7 + 0x1C]
	set	0x48, %l4
	swapa	[%l7 + %l4] 0x81,	%i5
	nop
	set	0x75, %i5
	stb	%g5,	[%l7 + %i5]
	st	%f12,	[%l7 + 0x44]
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x80,	%f9
	nop
	set	0x78, %o5
	std	%f26,	[%l7 + %o5]
	add	%l1,	%o1,	%l0
	wr	%l2,	%g6,	%set_softint
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%f24
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x68, %o3
	ldstub	[%l7 + %o3],	%g7
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f0
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x48, %g2
	stx	%o7,	[%l7 + %g2]
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x89,	%i7
	set	0x40, %g4
	stxa	%i3,	[%l7 + %g4] 0x80
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x80,	 3
	bgu,a,pn	%icc,	loop_23
	nop
	set	0x20, %o1
	stx	%i4,	[%l7 + %o1]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd8
loop_23:
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%g0
	nop
	set	0x3A, %l5
	ldub	[%l7 + %l5],	%i0
	set	0x45, %o7
	stba	%i2,	[%l7 + %o7] 0x89
	st	%fsr,	[%l7 + 0x08]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	fpsub32	%f22,	%f20,	%f26
	set	0x2C, %l3
	stwa	%l6,	[%l7 + %l3] 0xeb
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o2
	nop
	set	0x3C, %o6
	stw	%i6,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x44]
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x89,	%g4
	nop
	set	0x16, %g6
	ldsh	[%l7 + %g6],	%l4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%l5
	set	0x1C, %g7
	stwa	%g2,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xd8
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%o4
	set	0x48, %g3
	stxa	%l3,	[%l7 + %g3] 0x81
	nop
	set	0x30, %i0
	std	%i0,	[%l7 + %i0]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc4
	set	0x10, %i5
	ldxa	[%l7 + %i5] 0x80,	%o6
	nop
	set	0x28, %g5
	std	%i4,	[%l7 + %g5]
	nop
	set	0x76, %o5
	ldsh	[%l7 + %o5],	%g5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f16
	set	0x3C, %o3
	stwa	%o1,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x89,	%l1
	nop
	set	0x70, %l1
	sth	%l2,	[%l7 + %l1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l0,	%g6
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x88,	%o6
	nop
	set	0x20, %i2
	lduw	[%l7 + %i2],	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g3
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%i4
	set	0x54, %g4
	stwa	%g1,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x5E, %g2
	stha	%i0,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x0B, %i7
	stb	%g7,	[%l7 + %i7]
	nop
	set	0x0C, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x0A, %o2
	sth	%i2,	[%l7 + %o2]
	set	0x4A, %l0
	stba	%l6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x08, %i4
	stha	%o2,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x14, %l5
	lduw	[%l7 + %l5],	%i6
	bge,a	%xcc,	loop_24
	st	%f18,	[%l7 + 0x2C]
	nop
	set	0x6B, %o7
	stb	%o3,	[%l7 + %o7]
	set	0x74, %l2
	stha	%g4,	[%l7 + %l2] 0xea
	membar	#Sync
loop_24:
	nop
	set	0x6A, %l3
	lduh	[%l7 + %l3],	%o5
	nop
	set	0x2A, %i6
	ldsh	[%l7 + %i6],	%l5
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x78, %o6
	prefetch	[%l7 + %o6],	 2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%o0
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%o4
	add	%l3,	%l4,	%i1
	set	0x40, %g7
	stha	%o6,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x54, %i1
	ldsw	[%l7 + %i1],	%i5
	nop
	set	0x28, %g3
	stx	%fsr,	[%l7 + %g3]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%l1
	wr	%g5,	%l2,	%ccr
	st	%fsr,	[%l7 + 0x10]
	set	0x60, %o0
	stxa	%g6,	[%l7 + %o0] 0xeb
	membar	#Sync
	wr	%o7,	%i7,	%set_softint
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc0
	set	0x68, %g5
	sta	%f12,	[%l7 + %g5] 0x88
	nop
	set	0x58, %o5
	stw	%i3,	[%l7 + %o5]
	nop
	set	0x56, %i5
	ldsb	[%l7 + %i5],	%g3
	set	0x30, %o4
	stha	%l0,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x2A, %o3
	ldstub	[%l7 + %o3],	%i4
	and	%g1,	%g7,	%i0
	set	0x60, %l6
	lda	[%l7 + %l6] 0x80,	%f16
	set	0x6C, %l1
	lda	[%l7 + %l1] 0x88,	%f8
	set	0x11, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l6
	set	0x18, %i2
	lda	[%l7 + %i2] 0x80,	%f11
	nop
	set	0x44, %g1
	ldsw	[%l7 + %g1],	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x914, 	%sys_tick_cmpr
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f12
	ba,pn	%icc,	loop_25
	nop
	set	0x64, %g2
	sth	%i2,	[%l7 + %g2]
	set	0x50, %g4
	stxa	%g4,	[%l7 + %g4] 0xeb
	membar	#Sync
loop_25:
	nop
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc0
	nop
	set	0x30, %i7
	ldstub	[%l7 + %i7],	%o5
	set	0x20, %l0
	stba	%g2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x48, %i4
	lduw	[%l7 + %i4],	%l5
	set	0x08, %l5
	ldxa	[%l7 + %l5] 0x80,	%o0
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%l3
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	bg,a,pn	%icc,	loop_26
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x70, %i6
	std	%f4,	[%l7 + %i6]
	fpadd32	%f24,	%f8,	%f24
loop_26:
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%l4
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f16
	st	%f8,	[%l7 + 0x74]
	set	0x48, %g6
	stda	%o6,	[%l7 + %g6] 0x89
	ld	[%l7 + 0x64],	%f27
	and	%i5,	%i1,	%l1
	nop
	set	0x70, %i1
	ldsh	[%l7 + %i1],	%o1
	nop
	set	0x54, %g7
	stw	%l2,	[%l7 + %g7]
	nop
	set	0x37, %g3
	stb	%g5,	[%l7 + %g3]
	nop
	set	0x68, %i0
	prefetch	[%l7 + %i0],	 0
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f16
	nop
	set	0x64, %o5
	stw	%o7,	[%l7 + %o5]
	wr	%i7,	%g6,	%softint
	nop
	set	0x68, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%g3
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%l0
	nop
	set	0x30, %o4
	prefetch	[%l7 + %o4],	 4
	st	%f3,	[%l7 + 0x3C]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xca
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	set	0x60, %l4
	ldda	[%l7 + %l4] 0xe3,	%g0
	nop
	set	0x68, %g1
	stw	%i4,	[%l7 + %g1]
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x80,	 0
	nop
	set	0x34, %g2
	lduh	[%l7 + %g2],	%l6
	set	0x50, %g4
	lda	[%l7 + %g4] 0x81,	%f22
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%o2
	ld	[%l7 + 0x3C],	%f1
	nop
	set	0x10, %i7
	std	%i0,	[%l7 + %i7]
	set	0x60, %l0
	stwa	%i6,	[%l7 + %l0] 0xeb
	membar	#Sync
	ld	[%l7 + 0x08],	%f6
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%i2
	nop
	set	0x58, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xd0
	set	0x63, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o3
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x89,	%g4
	or	%o5,	%l5,	%o0
	nop
	set	0x14, %o2
	ldsh	[%l7 + %o2],	%g2
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x7C, %i6
	stw	%l3,	[%l7 + %i6]
	nop
	set	0x34, %l2
	stb	%l4,	[%l7 + %l2]
	nop
	set	0x64, %o6
	ldsw	[%l7 + %o6],	%o4
	nop
	set	0x58, %g6
	ldub	[%l7 + %g6],	%o6
	nop
	set	0x48, %i1
	ldsw	[%l7 + %i1],	%i1
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%i4
	set	0x4C, %g3
	sta	%f20,	[%l7 + %g3] 0x89
	set	0x18, %g5
	stwa	%l1,	[%l7 + %g5] 0xeb
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%g5
	fpadd32	%f12,	%f12,	%f22
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%o7
	nop
	set	0x6E, %i0
	stb	%l2,	[%l7 + %i0]
	nop
	set	0x22, %o0
	sth	%g6,	[%l7 + %o0]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%i7
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xeb,	%l0
	set	0x10, %l1
	sta	%f8,	[%l7 + %l1] 0x81
	nop
	set	0x0C, %l6
	ldsb	[%l7 + %l6],	%g1
	nop
	set	0x52, %o4
	ldsb	[%l7 + %o4],	%i4
	wr	%g3,	%g7,	%pic
	nop
	set	0x0A, %g1
	sth	%o2,	[%l7 + %g1]
	nop
	set	0x68, %i2
	ldsb	[%l7 + %i2],	%l6
	or	%i6,	%i2,	%o3
	nop
	set	0x10, %g2
	ldsh	[%l7 + %g2],	%g4
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf1
	membar	#Sync
	set	0x60, %i3
	sta	%f3,	[%l7 + %i3] 0x81
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x80,	%i0
	nop
	set	0x37, %i7
	ldstub	[%l7 + %i7],	%l5
	wr	%o0,	%g2,	%pic
	nop
	set	0x58, %o1
	std	%f12,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x5E, %l5
	sth	%o5,	[%l7 + %l5]
	ld	[%l7 + 0x54],	%f15
	set	0x08, %o7
	stwa	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x40, %l0
	std	%f28,	[%l7 + %l0]
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x80,	%l2
	set	0x2D, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o6
	fpadd16	%f8,	%f12,	%f16
	set	0x44, %o2
	lda	[%l7 + %o2] 0x89,	%f26
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f2
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f24
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd0
	nop
	set	0x79, %i1
	ldsb	[%l7 + %i1],	%o4
	nop
	set	0x19, %g7
	ldstub	[%l7 + %g7],	%i5
	nop
	set	0x30, %g6
	stx	%l1,	[%l7 + %g6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 3
	wr 	%g0, 	0x5, 	%fprs
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd2
	nop
	set	0x78, %i5
	stw	%g6,	[%l7 + %i5]
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x88,	%i3
	set	0x08, %o0
	lda	[%l7 + %o0] 0x81,	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%i7
	set	0x40, %g3
	stha	%g1,	[%l7 + %g3] 0x89
	set	0x3C, %l1
	stwa	%l0,	[%l7 + %l1] 0x88
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xe3,	%g2
	nop
	set	0x30, %o4
	ldsw	[%l7 + %o4],	%g7
	nop
	set	0x76, %g1
	stb	%o2,	[%l7 + %g1]
	ld	[%l7 + 0x68],	%f23
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x88,	 4
	set	0x30, %i2
	sta	%f17,	[%l7 + %i2] 0x81
	nop
	set	0x0A, %g2
	sth	%i6,	[%l7 + %g2]
	set	0x75, %l4
	stba	%i2,	[%l7 + %l4] 0x81
	ld	[%l7 + 0x3C],	%f11
	nop
	set	0x76, %i3
	lduh	[%l7 + %i3],	%o3
	set	0x5C, %i7
	stha	%g4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x8E746989,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x294FBFD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f14,	%f12
	nop
	set	0x08, %g4
	prefetch	[%l7 + %g4],	 2
	add	%i0,	%l6,	%l5
	set	0x54, %l5
	stwa	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o5
	nop
	set	0x14, %o7
	swap	[%l7 + %o7],	%l3
	set	0x08, %l3
	prefetcha	[%l7 + %l3] 0x89,	 0
	nop
	set	0x2F, %i4
	stb	%o4,	[%l7 + %i4]
	set	0x14, %l0
	lda	[%l7 + %l0] 0x81,	%f18
	or	%l1,	%o1,	%i1
	nop
	set	0x28, %o2
	lduw	[%l7 + %o2],	%g5
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f16
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x80,	%i5
	nop
	set	0x0E, %i1
	sth	%g6,	[%l7 + %i1]
	set	0x37, %i6
	stba	%i3,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%o7
	or	%l2,	%i7,	%g1
	nop
	set	0x44, %g7
	sth	%g3,	[%l7 + %g7]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%o2
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x80,	%l0
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	nop
	setx	0xDAAA016F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xCF3DCBB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f24,	%f4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%i2
	set	0x2E, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o3
	set	0x6E, %i0
	stha	%g4,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x10, %g3
	std	%i6,	[%l7 + %g3]
	fpadd32s	%f2,	%f27,	%f16
	nop
	set	0x6F, %o0
	ldstub	[%l7 + %o0],	%i0
	set	0x33, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l5
	nop
	set	0x5A, %o4
	stb	%o0,	[%l7 + %o4]
	nop
	set	0x74, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x08, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x10, %g1
	std	%g2,	[%l7 + %g1]
	nop
	set	0x24, %g2
	swap	[%l7 + %g2],	%o5
	fpadd32s	%f13,	%f0,	%f30
	nop
	set	0x2E, %i2
	ldstub	[%l7 + %i2],	%l3
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f0
	and	%l4,	%o4,	%l1
	or	%o6,	%o1,	%g5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%g6
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 0
	set	0x32, %g4
	stha	%i3,	[%l7 + %g4] 0x81
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%l2
	ld	[%l7 + 0x2C],	%f5
	nop
	set	0x44, %l5
	stw	%i7,	[%l7 + %l5]
	set	0x13, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g1
	set	0x28, %i7
	lda	[%l7 + %i7] 0x81,	%f11
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%o7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f0
	set	0x74, %l0
	stwa	%g3,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x38, %l2
	stx	%g7,	[%l7 + %l2]
	nop
	set	0x54, %o2
	stw	%o2,	[%l7 + %o2]
	bgu	%xcc,	loop_27
	nop
	set	0x6B, %i1
	ldub	[%l7 + %i1],	%l0
	st	%f9,	[%l7 + 0x34]
	nop
	set	0x54, %i6
	swap	[%l7 + %i6],	%i4
loop_27:
	ld	[%l7 + 0x78],	%f11
	set	0x33, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i2
	set	0x58, %g6
	stxa	%o3,	[%l7 + %g6] 0xeb
	membar	#Sync
	bl,a,pt	%icc,	loop_28
	nop
	set	0x1C, %g7
	ldsb	[%l7 + %g7],	%i6
	set	0x58, %i5
	sta	%f16,	[%l7 + %i5] 0x89
loop_28:
	nop
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf0
	membar	#Sync
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%g4
	nop
	set	0x38, %g3
	std	%i6,	[%l7 + %g3]
	set	0x31, %o0
	stba	%l5,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x12, %o5
	stba	%o0,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%f18
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x81,	 2
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%o5
	nop
	set	0x4C, %g1
	swap	[%l7 + %g1],	%i0
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x18]
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x89,	 2
	nop
	set	0x68, %o4
	stx	%o4,	[%l7 + %o4]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	set	0x28, %l4
	sta	%f12,	[%l7 + %l4] 0x80
	nop
	set	0x10, %l5
	swap	[%l7 + %l5],	%l1
	set	0x30, %o1
	stxa	%o6,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x4B, %g4
	stb	%o1,	[%l7 + %g4]
	set	0x2E, %i7
	stha	%l3,	[%l7 + %i7] 0x88
	nop
	set	0x50, %l3
	swap	[%l7 + %l3],	%i5
	nop
	set	0x6D, %i4
	ldstub	[%l7 + %i4],	%g6
	add	%g5,	%i1,	%i3
	nop
	set	0x79, %o7
	stb	%i7,	[%l7 + %o7]
	nop
	set	0x60, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x32, %l0
	stha	%l2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x5C, %i1
	ldsw	[%l7 + %i1],	%g1
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x81,	%g3
	set	0x60, %o6
	stda	%g6,	[%l7 + %o6] 0x88
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%o2
	nop
	set	0x34, %g7
	lduh	[%l7 + %g7],	%l0
	nop
	set	0x40, %i5
	stw	%o7,	[%l7 + %i5]
	nop
	set	0x10, %o2
	std	%i4,	[%l7 + %o2]
	st	%f30,	[%l7 + 0x5C]
	nop
	set	0x17, %g5
	ldsb	[%l7 + %g5],	%i2
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%o3
	nop
	set	0x7C, %o0
	lduw	[%l7 + %o0],	%g4
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%i6
	nop
	set	0x0C, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%l5
	nop
	set	0x28, %l1
	stx	%o0,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x4C]
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x81,	%g2
	nop
	set	0x22, %g2
	stb	%o5,	[%l7 + %g2]
	and	%i0,	%l4,	%o4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc0
	nop
	set	0x78, %o4
	std	%l0,	[%l7 + %o4]
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%o6
	nop
	set	0x6C, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%o1
	set	0x40, %l5
	ldstuba	[%l7 + %l5] 0x81,	%l3
	set	0x40, %g4
	stxa	%i6,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x4C, %o1
	sth	%g6,	[%l7 + %o1]
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x80,	%i5
	set	0x18, %i4
	stda	%g4,	[%l7 + %i4] 0xe3
	membar	#Sync
	add	%i1,	%i3,	%i7
	nop
	set	0x70, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%l2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x30, %l0
	ldub	[%l7 + %l0],	%g1
	add	%g7,	%o2,	%g3
	nop
	set	0x3E, %i1
	ldsh	[%l7 + %i1],	%l0
	nop
	set	0x44, %i6
	stw	%i4,	[%l7 + %i6]
	nop
	set	0x50, %l3
	std	%f26,	[%l7 + %l3]
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i2
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%g4
	nop
	set	0x70, %g7
	ldsh	[%l7 + %g7],	%l6
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f0
	nop
	set	0x76, %o2
	ldsh	[%l7 + %o2],	%l5
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	nop
	set	0x49, %g5
	ldub	[%l7 + %g5],	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%o5
	nop
	set	0x78, %i0
	stw	%i0,	[%l7 + %i0]
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%o4
	nop
	set	0x68, %l6
	ldsw	[%l7 + %l6],	%l4
	ld	[%l7 + 0x68],	%f0
	wr	%l1,	%o6,	%set_softint
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%o1
	set	0x0C, %o5
	ldstuba	[%l7 + %o5] 0x80,	%i6
	nop
	set	0x1C, %l1
	lduh	[%l7 + %l1],	%g6
	set	0x38, %g1
	stba	%g5,	[%l7 + %g1] 0x80
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x88,	%i1
	or	%i3,	%i7,	%i5
	set	0x20, %o4
	stxa	%l2,	[%l7 + %o4] 0x81
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%g0
	wr	%g7,	%o2,	%sys_tick
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%l0
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x6C, %i3
	ldsw	[%l7 + %i3],	%i4
	nop
	set	0x5A, %l5
	ldsh	[%l7 + %l5],	%o3
	set	0x58, %g4
	stxa	%g4,	[%l7 + %g4] 0x89
	set	0x70, %o1
	stda	%i2,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x34, %l4
	prefetch	[%l7 + %l4],	 1
	set	0x60, %i7
	sta	%f19,	[%l7 + %i7] 0x88
	set	0x3C, %o7
	sta	%f20,	[%l7 + %o7] 0x80
	nop
	set	0x1E, %l2
	ldsh	[%l7 + %l2],	%l6
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%g2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xe3,	%o0
	nop
	set	0x57, %i1
	stb	%o5,	[%l7 + %i1]
	set	0x54, %l3
	stwa	%l5,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%o4
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%l1
	nop
	set	0x60, %i5
	stx	%l4,	[%l7 + %i5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x3C, %g7
	swapa	[%l7 + %g7] 0x80,	%i6
	nop
	set	0x30, %o2
	std	%g6,	[%l7 + %o2]
	or	%o1,	%g5,	%i3
	set	0x30, %g3
	stwa	%i7,	[%l7 + %g3] 0x88
	set	0x68, %i0
	stxa	%i5,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%g1
	add	%g7,	%o2,	%l2
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 1
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f0
	set	0x5C, %l6
	stwa	%l0,	[%l7 + %l6] 0xe3
	membar	#Sync
	wr	%g3,	%o7,	%y
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xeb,	%o2
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x6B, %o3
	ldstub	[%l7 + %o3],	%g4
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	set	0x2F, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i2
	set	0x42, %i3
	stha	%i4,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	nop
	set	0x6A, %l5
	ldsh	[%l7 + %l5],	%o0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%l6
	set	0x33, %o1
	stba	%l5,	[%l7 + %o1] 0x80
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%o4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%o5
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc0
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x13, %o7
	ldub	[%l7 + %o7],	%l3
	set	0x60, %l2
	stxa	%l4,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o6
	ld	[%l7 + 0x60],	%f6
	nop
	set	0x48, %l0
	stb	%g6,	[%l7 + %l0]
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%o1
	set	0x51, %l3
	stba	%i3,	[%l7 + %l3] 0x89
	set	0x68, %i4
	stda	%g4,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x81,	 2
	nop
	set	0x6E, %g6
	ldstub	[%l7 + %g6],	%i1
	nop
	set	0x77, %i5
	stb	%i7,	[%l7 + %i5]
	nop
	set	0x50, %g7
	std	%g0,	[%l7 + %g7]
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xca
	and	%o2,	%l2,	%l0
	nop
	set	0x68, %i0
	ldub	[%l7 + %i0],	%g7
	or	%g3,	%o7,	%g4
	nop
	set	0x4A, %o0
	ldsh	[%l7 + %o0],	%o3
	nop
	set	0x4C, %g3
	stw	%i2,	[%l7 + %g3]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf9
	membar	#Sync
	or	%i4,	%o0,	%g2
	nop
	set	0x28, %g5
	ldsw	[%l7 + %g5],	%l5
	st	%f21,	[%l7 + 0x44]
	set	0x1C, %g1
	sta	%f27,	[%l7 + %g1] 0x88
	set	0x5A, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l6
	set	0x5C, %o3
	sta	%f19,	[%l7 + %o3] 0x80
	st	%f6,	[%l7 + 0x78]
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%i0
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x89,	%o4
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f24
	nop
	set	0x44, %g2
	lduw	[%l7 + %g2],	%l1
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f8
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
	nop
	set	0x18, %o1
	std	%f22,	[%l7 + %o1]
	nop
	set	0x40, %g4
	prefetch	[%l7 + %g4],	 0
	st	%fsr,	[%l7 + 0x50]
	set	0x6C, %i7
	swapa	[%l7 + %i7] 0x88,	%o5
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%l4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%l3
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x81,	%o6
	set	0x74, %l2
	sta	%f25,	[%l7 + %l2] 0x89
	set	0x5A, %l4
	ldstuba	[%l7 + %l4] 0x81,	%g6
	and	%o1,	%i3,	%g5
	st	%fsr,	[%l7 + 0x0C]
	or	%i5,	%i7,	%i1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f16
	nop
	set	0x20, %i4
	ldsh	[%l7 + %i4],	%g1
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%o2
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%l0
	ld	[%l7 + 0x24],	%f31
	set	0x47, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g7
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f16
	st	%f24,	[%l7 + 0x08]
	nop
	set	0x26, %o6
	ldsh	[%l7 + %o6],	%l2
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x28, %o2
	std	%f8,	[%l7 + %o2]
	wr	%o7,	%g4,	%y
	set	0x70, %i0
	sta	%f8,	[%l7 + %i0] 0x89
	or	%o3,	%g3,	%i2
	set	0x24, %o0
	sta	%f24,	[%l7 + %o0] 0x89
	nop
	set	0x4C, %g3
	ldsh	[%l7 + %g3],	%i4
	set	0x60, %l6
	stda	%g2,	[%l7 + %l6] 0x80
	nop
	set	0x40, %g5
	std	%o0,	[%l7 + %g5]
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	and	%l6,	%i0,	%o4
	nop
	set	0x19, %o3
	ldstub	[%l7 + %o3],	%l5
	nop
	set	0x08, %o4
	stw	%l1,	[%l7 + %o4]
	st	%f12,	[%l7 + 0x3C]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	or	%o5,	%i6,	%l3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f16
	nop
	set	0x08, %g2
	ldsw	[%l7 + %g2],	%l4
	set	0x30, %l5
	stwa	%g6,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x30, %i2
	ldsw	[%l7 + %i2],	%o1
	set	0x0A, %o1
	stba	%i3,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x44, %g4
	swapa	[%l7 + %g4] 0x81,	%g5
	nop
	set	0x35, %i7
	ldub	[%l7 + %i7],	%i5
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x88
	wr	%i1,	%o6,	%set_softint
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x81,	%o2
	add	%l0,	%g1,	%l2
	nop
	set	0x10, %l2
	std	%f18,	[%l7 + %l2]
	set	0x2A, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o7
	wr	%g4,	%g7,	%clear_softint
	nop
	set	0x20, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x58, %i4
	ldsb	[%l7 + %i4],	%g3
	nop
	set	0x18, %g6
	std	%f22,	[%l7 + %g6]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xca
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f0
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%o3
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%i4
	nop
	set	0x55, %i6
	stb	%i2,	[%l7 + %i6]
	set	0x4B, %o2
	stba	%g2,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x4C, %i0
	swapa	[%l7 + %i0] 0x81,	%o0
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f8
	nop
	set	0x0C, %g3
	lduw	[%l7 + %g3],	%l6
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%i0
	nop
	set	0x48, %g1
	std	%f20,	[%l7 + %g1]
	nop
	set	0x7C, %o3
	ldsh	[%l7 + %o3],	%l5
	set	0x3C, %g5
	stwa	%o4,	[%l7 + %g5] 0xea
	membar	#Sync
	or	%o5,	%l1,	%i6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xd2
	nop
	set	0x2E, %o5
	ldsh	[%l7 + %o5],	%l3
	fpsub32s	%f20,	%f4,	%f3
	or	%g6,	%o1,	%i3
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%g4
	bl,pt	%xcc,	loop_29
	nop
	set	0x46, %l1
	lduh	[%l7 + %l1],	%l4
	nop
	nop
	setx	0x1AF6A2605135042E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB769F20E0735731C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f10
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xe3,	%i6
loop_29:
	nop
	set	0x08, %i2
	std	%i0,	[%l7 + %i2]
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%i5
	nop
	set	0x34, %o1
	ldstub	[%l7 + %o1],	%o6
	set	0x34, %i7
	sta	%f28,	[%l7 + %i7] 0x89
	set	0x68, %i3
	stwa	%o2,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x50, %l0
	stha	%l0,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%o7
	nop
	set	0x4D, %l2
	ldsb	[%l7 + %l2],	%l2
	set	0x44, %o7
	stba	%g4,	[%l7 + %o7] 0x81
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%g7
	nop
	set	0x3C, %l4
	ldsb	[%l7 + %l4],	%g3
	nop
	set	0x74, %i4
	sth	%o3,	[%l7 + %i4]
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x74, %i5
	stha	%i2,	[%l7 + %i5] 0x80
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x80,	%i4
	nop
	set	0x7D, %g7
	stb	%g2,	[%l7 + %g7]
	set	0x24, %i6
	swapa	[%l7 + %i6] 0x80,	%l6
	set	0x78, %l3
	swapa	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x70, %i0
	swap	[%l7 + %i0],	%l5
	and	%o4,	%o5,	%o0
	nop
	set	0x78, %o0
	stx	%i6,	[%l7 + %o0]
	nop
	set	0x68, %g3
	ldsw	[%l7 + %g3],	%l1
	nop
	set	0x1C, %o2
	lduh	[%l7 + %o2],	%g6
	set	0x60, %l6
	stda	%o0,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%l2
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf8
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i3
	nop
	set	0x30, %g5
	stw	%i7,	[%l7 + %g5]
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x80,	%i1
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xeb,	%l4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	nop
	set	0x4F, %l5
	ldsb	[%l7 + %l5],	%o6
	fpadd16	%f6,	%f16,	%f18
	nop
	set	0x76, %l1
	lduh	[%l7 + %l1],	%i5
	bl,a	%xcc,	loop_30
	and	%o2,	%g1,	%o7
	set	0x78, %i2
	stxa	%l0,	[%l7 + %i2] 0x89
loop_30:
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%g4
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%l2
	nop
	set	0x1E, %i3
	lduh	[%l7 + %i3],	%g3
	nop
	set	0x74, %l0
	prefetch	[%l7 + %l0],	 2
	set	0x20, %i7
	ldda	[%l7 + %i7] 0xea,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%i4
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%g7
	nop
	set	0x30, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x47, %l4
	stba	%l6,	[%l7 + %l4] 0x88
	set	0x3C, %i4
	sta	%f18,	[%l7 + %i4] 0x80
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd2
	nop
	set	0x62, %i5
	ldstub	[%l7 + %i5],	%g2
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%i0
	nop
	set	0x30, %l2
	std	%o4,	[%l7 + %l2]
	nop
	set	0x14, %g7
	stw	%o5,	[%l7 + %g7]
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 0
	ld	[%l7 + 0x38],	%f3
	set	0x18, %l3
	sta	%f1,	[%l7 + %l3] 0x88
	set	0x28, %o0
	stba	%o0,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xeb,	%i6
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x64, %g3
	stb	%l5,	[%l7 + %g3]
	or	%l1,	%g6,	%o1
	nop
	set	0x78, %l6
	stx	%g5,	[%l7 + %l6]
	add	%i3,	%i7,	%l3
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x50, %o3
	sta	%f1,	[%l7 + %o3] 0x89
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%f4
	set	0x2E, %g5
	stha	%l4,	[%l7 + %g5] 0x80
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f30
	nop
	set	0x2A, %o4
	ldub	[%l7 + %o4],	%i1
	add	%o6,	%o2,	%g1
	nop
	set	0x58, %l5
	ldsb	[%l7 + %l5],	%i5
	nop
	set	0x68, %l1
	ldsh	[%l7 + %l1],	%l0
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%g4
	nop
	set	0x4C, %g2
	sth	%l2,	[%l7 + %g2]
	nop
	set	0x6E, %o1
	lduh	[%l7 + %o1],	%g3
	set	0x54, %i3
	stba	%o7,	[%l7 + %i3] 0x88
	set	0x38, %g4
	stda	%i2,	[%l7 + %g4] 0xeb
	membar	#Sync
	or	%i4,	%o3,	%l6
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x88,	 3
	st	%f19,	[%l7 + 0x44]
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x58, %l0
	stxa	%g7,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x30, %i4
	ldsb	[%l7 + %i4],	%i0
	set	0x20, %l4
	stwa	%o5,	[%l7 + %l4] 0x88
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%o0
	and	%o4,	%l5,	%i6
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x74, %i5
	ldsh	[%l7 + %i5],	%l1
	set	0x37, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o1
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%g4
	set	0x20, %l2
	stwa	%g6,	[%l7 + %l2] 0x89
	st	%f28,	[%l7 + 0x6C]
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0
	nop
	set	0x68, %o0
	lduw	[%l7 + %o0],	%i7
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x88,	%f1
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%i1
	nop
	set	0x28, %l3
	stw	%o6,	[%l7 + %l3]
	ld	[%l7 + 0x1C],	%f9
	nop
	set	0x2B, %l6
	ldstub	[%l7 + %l6],	%o2
	and	%g1,	%l3,	%i5
	ld	[%l7 + 0x7C],	%f1
	nop
	set	0x60, %g1
	stx	%g4,	[%l7 + %g1]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x89
	add	%l2,	%l0,	%o7
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	set	0x51, %g5
	stba	%g3,	[%l7 + %g5] 0x81
	nop
	set	0x68, %o5
	std	%f30,	[%l7 + %o5]
	or	%o3,	%l6,	%i4
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f4
	set	0x35, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g2
	or	%g7,	%i0,	%o0
	fpadd32	%f22,	%f28,	%f28
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f0
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
	set	0x7E, %i3
	stba	%o5,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%l4
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f24
	nop
	set	0x23, %o7
	ldsb	[%l7 + %o7],	%l1
	set	0x4C, %g4
	lda	[%l7 + %g4] 0x88,	%f27
	nop
	set	0x30, %i1
	stw	%i6,	[%l7 + %i1]
	set	0x18, %i4
	stxa	%g5,	[%l7 + %i4] 0x89
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%g6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%o1
	set	0x40, %l0
	sta	%f9,	[%l7 + %l0] 0x89
	nop
	set	0x1C, %i5
	prefetch	[%l7 + %i5],	 4
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%i7
	nop
	set	0x16, %g7
	stb	%i1,	[%l7 + %g7]
	ld	[%l7 + 0x30],	%f12
	set	0x65, %g6
	stba	%l4,	[%l7 + %g6] 0x81
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x80,	%f28
	set	0x20, %o0
	sta	%f18,	[%l7 + %o0] 0x88
	and	%o2,	%g1,	%l3
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%o6
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x6C, %l3
	stw	%i5,	[%l7 + %l3]
	fpsub32s	%f10,	%f3,	%f18
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x88,	%l0
	nop
	set	0x44, %g1
	lduw	[%l7 + %g1],	%l2
	nop
	set	0x5F, %o3
	stb	%i2,	[%l7 + %o3]
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%g3
	nop
	set	0x64, %g5
	stw	%o3,	[%l7 + %g5]
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x81,	 0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%g2
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x81,	 4
	set	0x26, %o4
	stha	%i0,	[%l7 + %o4] 0x80
	set	0x58, %g2
	ldxa	[%l7 + %g2] 0x89,	%o4
	nop
	set	0x44, %l5
	ldsw	[%l7 + %l5],	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%l5
	set	0x0D, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i6
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x88,	%g5
	nop
	set	0x74, %i7
	sth	%l1,	[%l7 + %i7]
	nop
	set	0x3C, %i2
	ldsh	[%l7 + %i2],	%i3
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%o1
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x24, %i4
	stha	%g6,	[%l7 + %i4] 0x89
	nop
	set	0x44, %g4
	sth	%i1,	[%l7 + %g4]
	nop
	set	0x24, %l4
	lduw	[%l7 + %l4],	%i7
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%l3
	nop
	set	0x22, %o6
	lduh	[%l7 + %o6],	%o6
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x40, %l0
	ldub	[%l7 + %l0],	%g4
	nop
	set	0x12, %g6
	lduh	[%l7 + %g6],	%g1
	ba,pt	%icc,	loop_31
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%i5
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd2
loop_31:
	nop
	set	0x0C, %o0
	ldstuba	[%l7 + %o0] 0x80,	%l0
	set	0x70, %i0
	ldxa	[%l7 + %i0] 0x81,	%l2
	nop
	set	0x54, %l3
	ldsb	[%l7 + %l3],	%i2
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x81,	%o7
	set	0x13, %g1
	stba	%g3,	[%l7 + %g1] 0x88
	set	0x10, %g3
	sta	%f29,	[%l7 + %g3] 0x80
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x72, %o2
	lduh	[%l7 + %o2],	%o3
	st	%f29,	[%l7 + 0x2C]
	nop
	set	0x20, %l2
	stx	%i4,	[%l7 + %l2]
	nop
	set	0x22, %o5
	ldsh	[%l7 + %o5],	%g2
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x88,	%f0
	nop
	set	0x56, %l1
	ldsh	[%l7 + %l1],	%i0
	fpsub32	%f2,	%f30,	%f30
	nop
	set	0x4D, %g2
	ldstub	[%l7 + %g2],	%o4
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%o4
	st	%fsr,	[%l7 + 0x58]
	set	0x7C, %i3
	stwa	%o0,	[%l7 + %i3] 0x81
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	set	0x4C, %o1
	stha	%g7,	[%l7 + %o1] 0x88
	and	%l5,	%i6,	%g5
	set	0x46, %i2
	stha	%i3,	[%l7 + %i2] 0xeb
	membar	#Sync
	and	%l1,	%o1,	%g6
	set	0x08, %o7
	lda	[%l7 + %o7] 0x89,	%f24
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x50, %i1
	stha	%i7,	[%l7 + %i1] 0x80
	st	%fsr,	[%l7 + 0x24]
	ld	[%l7 + 0x20],	%f7
	set	0x2C, %g4
	lda	[%l7 + %g4] 0x80,	%f17
	nop
	set	0x50, %l4
	std	%i0,	[%l7 + %l4]
	or	%l4,	%l3,	%o2
	ld	[%l7 + 0x4C],	%f31
	bge,a	%icc,	loop_32
	bl	%icc,	loop_33
	nop
	set	0x74, %i4
	swap	[%l7 + %i4],	%o6
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%g4
loop_32:
	nop
	set	0x50, %i5
	lda	[%l7 + %i5] 0x81,	%f31
loop_33:
	or	%g1,	%l0,	%l2
	set	0x19, %l0
	stba	%i5,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x81,	%o7
	nop
	set	0x40, %g7
	lduw	[%l7 + %g7],	%i2
	and	%l6,	%o3,	%i4
	set	0x13, %i6
	ldstuba	[%l7 + %i6] 0x88,	%g2
	nop
	set	0x0F, %i0
	stb	%i0,	[%l7 + %i0]
	nop
	set	0x30, %o0
	ldub	[%l7 + %o0],	%g3
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%o4
	nop
	set	0x70, %l6
	ldsw	[%l7 + %l6],	%o5
	nop
	set	0x1C, %g3
	lduh	[%l7 + %g3],	%o0
	add	%g7,	%i6,	%g5
	ld	[%l7 + 0x70],	%f23
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%o1
	nop
	set	0x18, %o3
	std	%g6,	[%l7 + %o3]
	set	0x56, %o2
	stha	%i7,	[%l7 + %o2] 0x88
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f8
	nop
	set	0x5C, %g5
	swap	[%l7 + %g5],	%l1
	set	0x38, %l2
	stxa	%l4,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd2
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f14
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x80,	 0
	st	%fsr,	[%l7 + 0x40]
	set	0x18, %l1
	stda	%l2,	[%l7 + %l1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x10],	%f14
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%g4
	nop
	set	0x6C, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	nop
	setx	0xC390C466,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xFC71805E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f17,	%f25
	nop
	set	0x6C, %i2
	ldsw	[%l7 + %i2],	%o6
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 0
	wr 	%g0, 	0x6, 	%fprs
	add	%i5,	%o7,	%l2
	set	0x48, %l5
	stxa	%i2,	[%l7 + %l5] 0x89
	nop
	set	0x62, %i1
	ldsh	[%l7 + %i1],	%l6
	nop
	nop
	setx	0xAC576EE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x2FFB7772,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f18,	%f0
	set	0x54, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i4
	or	%o3,	%i0,	%g2
	nop
	set	0x30, %g4
	stw	%g3,	[%l7 + %g4]
	st	%f5,	[%l7 + 0x44]
	nop
	set	0x3A, %l4
	stb	%o5,	[%l7 + %l4]
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	and	%o0,	%i6,	%g5
	nop
	set	0x70, %i5
	stw	%i3,	[%l7 + %i5]
	and	%l5,	%o1,	%g6
	set	0x10, %o6
	stha	%g7,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x08, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x5C, %g7
	stw	%l4,	[%l7 + %g7]
	nop
	set	0x40, %l0
	std	%i6,	[%l7 + %l0]
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x80,	%i0
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f16
	nop
	set	0x60, %l3
	std	%f14,	[%l7 + %l3]
	or	%o2,	%l3,	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l0
	set	0x4C, %o0
	stba	%o6,	[%l7 + %o0] 0x80
	nop
	set	0x31, %l6
	ldub	[%l7 + %l6],	%i5
	set	0x60, %g3
	stxa	%l2,	[%l7 + %g3] 0x88
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xeb,	%i2
	nop
	set	0x22, %g1
	ldsh	[%l7 + %g1],	%l6
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x81,	%i4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xca
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%o7
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%o2
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc2
	nop
	set	0x28, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x89,	%g2
	st	%f22,	[%l7 + 0x68]
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x81,	%i0
	set	0x44, %i2
	sta	%f28,	[%l7 + %i2] 0x80
	nop
	set	0x42, %o7
	lduh	[%l7 + %o7],	%o5
	nop
	set	0x58, %l5
	std	%o4,	[%l7 + %l5]
	nop
	set	0x7C, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x1B, %o1
	stba	%g3,	[%l7 + %o1] 0x89
	st	%f21,	[%l7 + 0x1C]
	ld	[%l7 + 0x18],	%f10
	st	%fsr,	[%l7 + 0x64]
	or	%i6,	%g5,	%i3
	nop
	set	0x08, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x25, %i7
	ldub	[%l7 + %i7],	%o0
	set	0x60, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o1
	and	%l5,	%g6,	%g7
	set	0x40, %i5
	stda	%l4,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x1F, %i4
	ldub	[%l7 + %i4],	%l1
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f16
	set	0x70, %g7
	lda	[%l7 + %g7] 0x80,	%f18
	ld	[%l7 + 0x7C],	%f16
	nop
	set	0x0D, %o6
	ldstub	[%l7 + %o6],	%i1
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x48, %i0
	stw	%i7,	[%l7 + %i0]
	nop
	set	0x50, %i6
	ldub	[%l7 + %i6],	%g4
	nop
	set	0x34, %l3
	sth	%l3,	[%l7 + %l3]
	set	0x28, %l6
	stxa	%g1,	[%l7 + %l6] 0xe2
	membar	#Sync
	and	%l0,	%o6,	%i5
	set	0x64, %o0
	lda	[%l7 + %o0] 0x89,	%f6
	set	0x6C, %o3
	stwa	%l2,	[%l7 + %o3] 0x81
	nop
	set	0x60, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x12, %g3
	sth	%l6,	[%l7 + %g3]
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x88,	%i4
	set	0x5C, %o5
	swapa	[%l7 + %o5] 0x81,	%i2
	or	%o7,	%o3,	%g2
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xeb,	%o4
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x81,	%o4
	set	0x53, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g3
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%i6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%i3
	or	%o0,	%o1,	%g5
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x08, %i3
	swap	[%l7 + %i3],	%g6
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f22
	nop
	set	0x10, %o7
	sth	%l5,	[%l7 + %o7]
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x88,	%g7
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%l1
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f16
	nop
	set	0x2A, %i7
	ldub	[%l7 + %i7],	%i1
	st	%f25,	[%l7 + 0x40]
	nop
	set	0x4A, %g4
	ldub	[%l7 + %g4],	%o2
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%i7
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x89,	%g4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	nop
	set	0x48, %g7
	sth	%l4,	[%l7 + %g7]
	nop
	set	0x77, %o6
	ldstub	[%l7 + %o6],	%g1
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o6
	nop
	set	0x40, %g6
	std	%i4,	[%l7 + %g6]
	st	%f20,	[%l7 + 0x60]
	nop
	set	0x48, %i0
	ldsb	[%l7 + %i0],	%l2
	nop
	set	0x58, %l3
	lduh	[%l7 + %l3],	%l6
	nop
	set	0x0E, %i6
	ldstub	[%l7 + %i6],	%l0
	nop
	set	0x68, %o0
	stw	%i4,	[%l7 + %o0]
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe3,	%i2
	nop
	set	0x40, %o3
	ldx	[%l7 + %o3],	%o3
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x50, %g5
	ldx	[%l7 + %g5],	%o7
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x55, %l2
	ldub	[%l7 + %l2],	%o4
	st	%fsr,	[%l7 + 0x74]
	set	0x4C, %o5
	stba	%g3,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%o5,	%i0,	%i6
	bleu,a,pt	%xcc,	loop_34
	nop
	nop
	setx	0xF552F1A625D2AB89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9C1DBFA632EED9A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f8,	%f6
	and	%i3,	%o1,	%g5
	nop
	set	0x36, %o4
	ldub	[%l7 + %o4],	%g6
loop_34:
	nop
	set	0x64, %o2
	stwa	%o0,	[%l7 + %o2] 0x81
	set	0x32, %l1
	stba	%g7,	[%l7 + %l1] 0x80
	nop
	set	0x28, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x78, %g2
	lda	[%l7 + %g2] 0x81,	%f20
	nop
	set	0x70, %i2
	ldub	[%l7 + %i2],	%l1
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x81,	%l5
	nop
	set	0x58, %l5
	sth	%i1,	[%l7 + %l5]
	nop
	set	0x40, %o1
	stx	%i7,	[%l7 + %o1]
	nop
	set	0x1C, %i1
	lduh	[%l7 + %i1],	%o2
	set	0x7D, %g4
	stba	%g4,	[%l7 + %g4] 0x80
	set	0x10, %i7
	lda	[%l7 + %i7] 0x81,	%f18
	nop
	set	0x20, %i4
	lduh	[%l7 + %i4],	%l4
	nop
	set	0x30, %l4
	ldx	[%l7 + %l4],	%g1
	set	0x62, %i5
	ldstuba	[%l7 + %i5] 0x88,	%o6
	nop
	set	0x1F, %o6
	ldub	[%l7 + %o6],	%l3
	set	0x7C, %l0
	lda	[%l7 + %l0] 0x88,	%f5
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%i4
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%l2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f16
	nop
	set	0x64, %i0
	ldsw	[%l7 + %i0],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x88E, 	%tick_cmpr
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x80,	 3
	add	%o3,	%o7,	%g2
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x81,	 2
	or	%o4,	%o5,	%i6
	st	%fsr,	[%l7 + 0x5C]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%i0
	set	0x30, %l6
	stxa	%o1,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x4E, %o3
	ldsb	[%l7 + %o3],	%g6
	nop
	set	0x1F, %g1
	ldsb	[%l7 + %g1],	%o0
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x88,	%g5
	nop
	set	0x6C, %l2
	stw	%g7,	[%l7 + %l2]
	nop
	set	0x78, %g5
	ldsw	[%l7 + %g5],	%l1
	nop
	set	0x6C, %o5
	ldsh	[%l7 + %o5],	%i1
	or	%l5,	%o2,	%i7
	nop
	set	0x10, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x74, %l1
	lduh	[%l7 + %l1],	%g4
	set	0x58, %i3
	stxa	%g1,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x80,	%f29
	add	%l4,	%o6,	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%l0
	set	0x1A, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i2
	nop
	set	0x74, %g2
	ldub	[%l7 + %g2],	%o3
	nop
	set	0x7C, %o7
	swap	[%l7 + %o7],	%i4
	nop
	set	0x30, %l5
	stb	%g2,	[%l7 + %l5]
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x80,	 1
	fpadd32s	%f6,	%f28,	%f23
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xc8
	and	%g3,	%o5,	%i6
	wr	%o4,	%i3,	%set_softint
	and	%o1,	%i0,	%o0
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x88,	%g6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f16
	nop
	set	0x57, %i4
	ldstub	[%l7 + %i4],	%g5
	set	0x10, %i5
	stxa	%l1,	[%l7 + %i5] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%l5
	nop
	set	0x78, %l4
	stx	%o2,	[%l7 + %l4]
	set	0x60, %l0
	stwa	%i1,	[%l7 + %l0] 0xeb
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%g4
	and	%g1,	%l4,	%o6
	set	0x34, %g7
	sta	%f21,	[%l7 + %g7] 0x89
	or	%i5,	%l3,	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i2
	add	%l6,	%o3,	%i4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x88
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	st	%f24,	[%l7 + 0x0C]
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%o6
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x48, %l6
	ldstub	[%l7 + %l6],	%g2
	fpadd32s	%f27,	%f2,	%f28
	set	0x1A, %o3
	ldstuba	[%l7 + %o3] 0x80,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%i6
	nop
	set	0x14, %o0
	lduw	[%l7 + %o0],	%i3
	and	%o4,	%o1,	%o0
	and	%g6,	%i0,	%l1
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x89,	%g5
	nop
	set	0x10, %l2
	prefetch	[%l7 + %l2],	 2
	set	0x20, %g5
	stda	%l4,	[%l7 + %g5] 0x88
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0
	set	0x52, %o5
	stba	%i1,	[%l7 + %o5] 0x81
	and	%i7,	%o2,	%g4
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%l4
	set	0x74, %l1
	stba	%o6,	[%l7 + %l1] 0x89
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x88,	%g1
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%i4
	ld	[%l7 + 0x2C],	%f9
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%l0
	nop
	set	0x40, %o7
	stw	%l3,	[%l7 + %o7]
	nop
	set	0x12, %l5
	stb	%l2,	[%l7 + %l5]
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x68, %g2
	std	%f12,	[%l7 + %g2]
	bl	%icc,	loop_35
	ld	[%l7 + 0x4C],	%f30
	set	0x48, %i1
	stha	%i2,	[%l7 + %i1] 0xe2
	membar	#Sync
loop_35:
	fpsub32s	%f16,	%f9,	%f7
	set	0x30, %g4
	lda	[%l7 + %g4] 0x80,	%f15
	nop
	set	0x4C, %i7
	ldsw	[%l7 + %i7],	%l6
	set	0x60, %i5
	sta	%f24,	[%l7 + %i5] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%o7
	and	%g2,	%g3,	%i4
	set	0x38, %i4
	swapa	[%l7 + %i4] 0x80,	%o5
	and	%i3,	%i6,	%o1
	add	%o4,	%g6,	%i0
	set	0x36, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o0
	nop
	set	0x48, %g7
	swap	[%l7 + %g7],	%l1
	fpsub16s	%f12,	%f1,	%f25
	bl,pt	%icc,	loop_36
	nop
	set	0x6C, %o6
	stw	%l5,	[%l7 + %o6]
	nop
	set	0x40, %g6
	lduw	[%l7 + %g6],	%g5
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%i0
loop_36:
	nop
	set	0x60, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x60, %i6
	stxa	%i7,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x64, %l6
	sth	%o2,	[%l7 + %l6]
	set	0x28, %o3
	stwa	%g7,	[%l7 + %o3] 0x88
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%l4
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%g4
	set	0x50, %g3
	stha	%o6,	[%l7 + %g3] 0x81
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%g1
	nop
	set	0x78, %g1
	stb	%i5,	[%l7 + %g1]
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%l0
	set	0x10, %o2
	ldda	[%l7 + %o2] 0xea,	%l2
	st	%f10,	[%l7 + 0x4C]
	wr	%l3,	%l6,	%set_softint
	ld	[%l7 + 0x3C],	%f28
	nop
	set	0x26, %g5
	ldstub	[%l7 + %g5],	%i2
	set	0x55, %l1
	stba	%o7,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x56, %o4
	lduh	[%l7 + %o4],	%g2
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o3
	nop
	set	0x73, %o7
	ldsb	[%l7 + %o7],	%i3
	nop
	set	0x48, %i2
	lduh	[%l7 + %i2],	%i6
	add	%o5,	%o4,	%o1
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x58, %o1
	std	%i0,	[%l7 + %o1]
	nop
	set	0x23, %g2
	ldsb	[%l7 + %g2],	%o0
	set	0x20, %i1
	sta	%f7,	[%l7 + %i1] 0x80
	nop
	set	0x64, %g4
	lduw	[%l7 + %g4],	%g6
	nop
	set	0x1A, %i7
	stb	%l5,	[%l7 + %i7]
	st	%f20,	[%l7 + 0x50]
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x89,	 3
	nop
	set	0x71, %i5
	stb	%i1,	[%l7 + %i5]
	nop
	set	0x4C, %i4
	ldsw	[%l7 + %i4],	%l1
	set	0x39, %l4
	stba	%i7,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x7A, %o6
	ldsb	[%l7 + %o6],	%g7
	nop
	set	0x6C, %g6
	lduw	[%l7 + %g6],	%o2
	ld	[%l7 + 0x68],	%f27
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%g4
	set	0x56, %l3
	stha	%l4,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f2
	ld	[%l7 + 0x54],	%f13
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x5C, %l6
	swap	[%l7 + %l6],	%g1
	nop
	set	0x30, %o0
	stx	%i5,	[%l7 + %o0]
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x88,	 2
	set	0x70, %i0
	stha	%l0,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x54, %l2
	ldstuba	[%l7 + %l2] 0x81,	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%l3
	set	0x1F, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g2
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 0
	or	%g3,	%o3,	%i6
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x81,	%i3
	set	0x3C, %g5
	stwa	%o5,	[%l7 + %g5] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%i0
	set	0x58, %g1
	sta	%f16,	[%l7 + %g1] 0x89
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xe2,	%o0
	nop
	set	0x1D, %o4
	ldub	[%l7 + %o4],	%o0
	set	0x74, %o7
	swapa	[%l7 + %o7] 0x88,	%l5
	set	0x09, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g5
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%g6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f0
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x88,	%i0
	nop
	set	0x7C, %g4
	swap	[%l7 + %g4],	%i7
	ld	[%l7 + 0x30],	%f9
	nop
	set	0x38, %i7
	std	%l0,	[%l7 + %i7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%g4
	nop
	set	0x08, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x6F, %i2
	ldub	[%l7 + %i2],	%o2
	st	%f2,	[%l7 + 0x48]
	wr	%l4,	%g1,	%pic
	nop
	set	0x74, %i5
	swap	[%l7 + %i5],	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	or	%l2,	%l6,	%o7
	and	%l3,	%i2,	%g2
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	nop
	set	0x3E, %g6
	ldub	[%l7 + %g6],	%o3
	nop
	set	0x50, %o6
	ldsb	[%l7 + %o6],	%i6
	nop
	set	0x58, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%g3
	set	0x20, %i6
	stxa	%i3,	[%l7 + %i6] 0x88
	nop
	set	0x58, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x30, %o0
	stx	%fsr,	[%l7 + %o0]
	or	%o5,	%o4,	%o1
	nop
	set	0x1C, %o3
	ldsw	[%l7 + %o3],	%o0
	set	0x6E, %i0
	stba	%i0,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x88,	%l5
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x7C, %g3
	stwa	%g6,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f30
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f0
	or	%i1,	%g5,	%i7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x20, %g1
	stw	%l1,	[%l7 + %g1]
	nop
	set	0x40, %o4
	lduw	[%l7 + %o4],	%g7
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%g4
	and	%o2,	%l4,	%i5
	nop
	set	0x08, %l1
	ldub	[%l7 + %l1],	%g1
	set	0x48, %i3
	lda	[%l7 + %i3] 0x80,	%f20
	add	%l0,	%l2,	%o6
	set	0x0C, %g2
	ldstuba	[%l7 + %g2] 0x81,	%o7
	nop
	set	0x6C, %i1
	lduh	[%l7 + %i1],	%l3
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x58, %o1
	stda	%i6,	[%l7 + %o1] 0x88
	set	0x18, %l5
	sta	%f0,	[%l7 + %l5] 0x80
	set	0x30, %i2
	stxa	%g2,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x0B, %i5
	stb	%i4,	[%l7 + %i5]
	nop
	set	0x08, %i7
	ldsb	[%l7 + %i7],	%i2
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x89,	 3
	nop
	set	0x60, %l4
	lduw	[%l7 + %l4],	%g3
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x89,	 4
	nop
	set	0x6A, %o6
	stb	%i3,	[%l7 + %o6]
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%o5
	wr	%o4,	%o1,	%sys_tick
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f26
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd8
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xeb,	%i0
	ld	[%l7 + 0x7C],	%f1
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%l5
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x88,	%o0
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x89,	%g6
	or	%i1,	%g5,	%i7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x88
	set	0x42, %o5
	stha	%g7,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x3C, %g3
	lduh	[%l7 + %g3],	%g4
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%o2
	nop
	set	0x64, %g1
	stw	%l4,	[%l7 + %g1]
	set	0x7E, %g5
	stba	%i5,	[%l7 + %g5] 0x80
	nop
	set	0x60, %o7
	lduh	[%l7 + %o7],	%l1
	set	0x58, %o4
	stxa	%g1,	[%l7 + %o4] 0x89
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%l0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc4
	set	0x68, %i1
	lda	[%l7 + %i1] 0x88,	%f5
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x88,	%l2
	nop
	set	0x7A, %o1
	sth	%o6,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x7C]
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x80,	%o7
	nop
	set	0x54, %i3
	ldsb	[%l7 + %i3],	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i4
	nop
	set	0x3C, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x6B, %i7
	ldsb	[%l7 + %i7],	%i2
	nop
	set	0x5C, %i4
	swap	[%l7 + %i4],	%g2
	set	0x18, %i2
	sta	%f29,	[%l7 + %i2] 0x80
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%o3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f16
	set	0x78, %g7
	stxa	%g3,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x80,	%o4
	nop
	set	0x78, %i6
	std	%f8,	[%l7 + %i6]
	nop
	set	0x14, %o3
	lduw	[%l7 + %o3],	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%i0
	nop
	set	0x20, %l3
	sth	%o1,	[%l7 + %l3]
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%l5
	nop
	set	0x6A, %l2
	ldsh	[%l7 + %l2],	%g6
	add	%o0,	%i1,	%i7
	set	0x48, %o0
	stda	%g6,	[%l7 + %o0] 0x81
	nop
	set	0x38, %l6
	std	%g4,	[%l7 + %l6]
	bgu,a	%xcc,	loop_37
	ld	[%l7 + 0x28],	%f23
	set	0x09, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g4
loop_37:
	nop
	set	0x48, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x32, %g3
	sth	%l4,	[%l7 + %g3]
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f4
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%i5
	nop
	set	0x40, %o4
	ldsw	[%l7 + %o4],	%o2
	nop
	set	0x6C, %o7
	sth	%l1,	[%l7 + %o7]
	nop
	set	0x7C, %l1
	swap	[%l7 + %l1],	%g1
	set	0x7D, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l2
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%o6
	bl,a	%xcc,	loop_38
	nop
	set	0x70, %o1
	std	%l0,	[%l7 + %o1]
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%l6
	fpadd16s	%f21,	%f26,	%f25
loop_38:
	nop
	set	0x62, %l5
	ldsh	[%l7 + %l5],	%o7
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%i4
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xea,	%l2
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x12, %i2
	ldsh	[%l7 + %i2],	%g2
	nop
	set	0x68, %i4
	sth	%i2,	[%l7 + %i4]
	nop
	set	0x10, %o6
	stx	%i6,	[%l7 + %o6]
	nop
	set	0x50, %l4
	sth	%g3,	[%l7 + %l4]
	nop
	set	0x2C, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x4A, %g6
	ldstub	[%l7 + %g6],	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i3
	nop
	set	0x08, %i6
	sth	%o3,	[%l7 + %i6]
	set	0x0E, %l0
	stba	%i0,	[%l7 + %l0] 0x81
	nop
	set	0x20, %l3
	stx	%o1,	[%l7 + %l3]
	set	0x6A, %i0
	stha	%g6,	[%l7 + %i0] 0x88
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x80,	%l5
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f10
	set	0x70, %l6
	stxa	%o0,	[%l7 + %l6] 0xe3
	membar	#Sync
	fpsub32s	%f13,	%f0,	%f26
	st	%f10,	[%l7 + 0x60]
	ld	[%l7 + 0x48],	%f4
	wr	%i7,	%i1,	%set_softint
	set	0x08, %o5
	prefetcha	[%l7 + %o5] 0x80,	 2
	set	0x74, %o2
	ldstuba	[%l7 + %o2] 0x81,	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x74, %o3
	ldsw	[%l7 + %o3],	%g5
	and	%o2,	%l1,	%l2
	nop
	set	0x17, %g3
	ldsb	[%l7 + %g3],	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%l6
	set	0x3C, %g5
	sta	%f9,	[%l7 + %g5] 0x81
	set	0x50, %o4
	stda	%g0,	[%l7 + %o4] 0x80
	set	0x60, %o7
	stda	%o6,	[%l7 + %o7] 0x88
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%l2
	fpsub16	%f10,	%f0,	%f2
	set	0x4C, %i1
	stwa	%g2,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x28, %g4
	stw	%i2,	[%l7 + %g4]
	fpsub32s	%f16,	%f1,	%f15
	nop
	set	0x38, %g1
	stx	%i6,	[%l7 + %g1]
	ld	[%l7 + 0x48],	%f25
	set	0x68, %g2
	stwa	%g3,	[%l7 + %g2] 0x81
	bleu,pt	%xcc,	loop_39
	ld	[%l7 + 0x70],	%f29
	nop
	set	0x16, %o1
	sth	%o5,	[%l7 + %o1]
	add	%o4,	%i4,	%i3
loop_39:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%i0
	nop
	set	0x60, %i3
	std	%g6,	[%l7 + %i3]
	or	%o1,	%o0,	%i7
	nop
	set	0x21, %i7
	stb	%l5,	[%l7 + %i7]
	set	0x40, %l5
	prefetcha	[%l7 + %l5] 0x89,	 4
	and	%g4,	%l4,	%i5
	or	%g5,	%i1,	%l1
	and	%o2,	%l2,	%o6
	add	%l6,	%l0,	%g1
	nop
	set	0x32, %i2
	ldsh	[%l7 + %i2],	%o7
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%g2
	fpsub16s	%f31,	%f6,	%f25
	set	0x21, %i5
	stba	%l3,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xeb,	%i2
	nop
	set	0x2C, %g7
	stw	%i6,	[%l7 + %g7]
	set	0x38, %l4
	stxa	%o5,	[%l7 + %l4] 0xe3
	membar	#Sync
	add	%g3,	%i4,	%o4
	bge,pt	%xcc,	loop_40
	nop
	set	0x20, %i6
	std	%f30,	[%l7 + %i6]
	nop
	set	0x0C, %l0
	lduw	[%l7 + %l0],	%i3
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf9
	membar	#Sync
loop_40:
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%o2
	add	%g6,	%o1,	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%l5
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f12
	nop
	set	0x48, %l2
	std	%i6,	[%l7 + %l2]
	st	%f24,	[%l7 + 0x28]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%l4
	set	0x48, %o0
	stwa	%g7,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x18, %o5
	lduw	[%l7 + %o5],	%i5
	set	0x08, %o2
	stxa	%i1,	[%l7 + %o2] 0x80
	set	0x60, %o3
	swapa	[%l7 + %o3] 0x80,	%g5
	set	0x4C, %g3
	stwa	%o2,	[%l7 + %g3] 0x80
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%l2
	nop
	set	0x34, %o4
	sth	%o6,	[%l7 + %o4]
	set	0x70, %l6
	sta	%f28,	[%l7 + %l6] 0x81
	nop
	set	0x22, %l1
	ldstub	[%l7 + %l1],	%l1
	set	0x39, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l6
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x88,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%o7
	set	0x10, %g1
	stwa	%g2,	[%l7 + %g1] 0x88
	set	0x58, %o7
	stda	%l2,	[%l7 + %o7] 0x81
	set	0x31, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i6
	nop
	set	0x30, %i3
	prefetch	[%l7 + %i3],	 3
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x88,	%o4
	set	0x68, %l5
	stxa	%i2,	[%l7 + %l5] 0x81
	nop
	set	0x17, %i2
	ldub	[%l7 + %i2],	%i4
	nop
	set	0x0F, %g2
	ldub	[%l7 + %g2],	%o4
	or	%i3,	%o3,	%g6
	set	0x70, %i5
	stxa	%g3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x28, %o6
	stx	%o0,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x50]
	set	0x60, %g7
	lda	[%l7 + %g7] 0x89,	%f8
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f30
	set	0x08, %i6
	stxa	%o1,	[%l7 + %i6] 0x88
	set	0x21, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l5
	set	0x6C, %l3
	stha	%i7,	[%l7 + %l3] 0x89
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%l4
	nop
	set	0x7D, %i4
	ldub	[%l7 + %i4],	%g4
	fpadd32	%f10,	%f8,	%f28
	nop
	set	0x10, %i0
	std	%f12,	[%l7 + %i0]
	set	0x0C, %l2
	sta	%f0,	[%l7 + %l2] 0x88
	nop
	set	0x48, %g6
	std	%f12,	[%l7 + %g6]
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%i5
	nop
	set	0x78, %o2
	stx	%i1,	[%l7 + %o2]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xe3,	%g4
	or	%o2,	%g7,	%l2
	nop
	set	0x40, %o0
	std	%f0,	[%l7 + %o0]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x80
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f0
	nop
	set	0x0A, %l6
	stb	%l1,	[%l7 + %l6]
	nop
	set	0x4D, %l1
	ldsb	[%l7 + %l1],	%l6
	nop
	set	0x2C, %o4
	lduw	[%l7 + %o4],	%o6
	nop
	set	0x24, %g4
	ldsw	[%l7 + %g4],	%g1
	set	0x72, %i1
	stha	%l0,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x5D, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g2
	nop
	set	0x3D, %o7
	ldub	[%l7 + %o7],	%o7
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%l3
	nop
	set	0x28, %i3
	std	%o4,	[%l7 + %i3]
	set	0x60, %i7
	stwa	%i6,	[%l7 + %i7] 0x81
	set	0x2A, %l5
	ldstuba	[%l7 + %l5] 0x80,	%i4
	st	%fsr,	[%l7 + 0x28]
	set	0x37, %i2
	stba	%i2,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x60, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%i3,	%o4,	%g6
	nop
	set	0x34, %g2
	ldsh	[%l7 + %g2],	%o3
	nop
	set	0x0C, %o6
	lduw	[%l7 + %o6],	%g3
	set	0x2C, %l4
	stwa	%o1,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x20, %g7
	ldsw	[%l7 + %g7],	%o0
	nop
	set	0x64, %l0
	ldsw	[%l7 + %l0],	%i7
	and	%l5,	%i0,	%g4
	set	0x34, %i6
	lda	[%l7 + %i6] 0x88,	%f30
	ld	[%l7 + 0x34],	%f24
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%i5
	nop
	set	0x58, %i4
	ldsh	[%l7 + %i4],	%i1
	or	%g5,	%l4,	%g7
	fpsub16	%f26,	%f8,	%f0
	nop
	set	0x27, %l2
	ldub	[%l7 + %l2],	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%l6
	and	%o6,	%g1,	%l0
	nop
	set	0x10, %g6
	std	%f26,	[%l7 + %g6]
	set	0x60, %i0
	prefetcha	[%l7 + %i0] 0x89,	 1
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%o7
	nop
	set	0x58, %o3
	std	%l2,	[%l7 + %o3]
	fpadd32s	%f16,	%f10,	%f30
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x40, %g3
	lduw	[%l7 + %g3],	%g2
	nop
	set	0x0E, %g5
	sth	%o5,	[%l7 + %g5]
	or	%i6,	%i4,	%i2
	fpsub16	%f4,	%f18,	%f20
	set	0x3C, %l6
	stha	%o4,	[%l7 + %l6] 0x89
	add	%i3,	%g6,	%o3
	nop
	set	0x76, %l1
	sth	%o1,	[%l7 + %l1]
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f14
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x88,	 4
	nop
	set	0x40, %i1
	stw	%o0,	[%l7 + %i1]
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%i6
	add	%l5,	%i0,	%g4
	set	0x20, %o7
	stda	%i0,	[%l7 + %o7] 0x80
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x30, %i3
	std	%g4,	[%l7 + %i3]
	set	0x68, %i7
	ldxa	[%l7 + %i7] 0x80,	%l4
	nop
	set	0x18, %l5
	std	%l2,	[%l7 + %l5]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1272
!	Type a   	: 27
!	Type cti   	: 20
!	Type x   	: 537
!	Type f   	: 33
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
	set	0x2,	%g1
	set	0xC,	%g2
	set	0x4,	%g3
	set	0xA,	%g4
	set	0x2,	%g5
	set	0xB,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xD,	%i1
	set	-0x7,	%i2
	set	-0xE,	%i3
	set	-0x7,	%i4
	set	-0xC,	%i5
	set	-0x1,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x7E5AADBA,	%l0
	set	0x3E4A3BD6,	%l1
	set	0x32DB22B3,	%l2
	set	0x6184A4F7,	%l3
	set	0x79BD9E8C,	%l4
	set	0x7023764A,	%l5
	set	0x5D438ABB,	%l6
	!# Output registers
	set	0x0480,	%o0
	set	0x1A37,	%o1
	set	-0x1C34,	%o2
	set	-0x1DD5,	%o3
	set	-0x18C2,	%o4
	set	-0x0535,	%o5
	set	-0x0A96,	%o6
	set	0x1048,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	nop
	set	0x4C, %i2
	sth	%g7,	[%l7 + %i2]
	nop
	set	0x2C, %g1
	ldsh	[%l7 + %g1],	%l6
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%o6
	set	0x0D, %i5
	stba	%g1,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x68, %l4
	stda	%o2,	[%l7 + %l4] 0x80
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x10, %l0
	prefetch	[%l7 + %l0],	 0
	or	%l1,	%o7,	%l0
	nop
	set	0x50, %o6
	stx	%l3,	[%l7 + %o6]
	nop
	set	0x08, %i6
	lduh	[%l7 + %i6],	%g2
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	and	%o5,	%i4,	%i6
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%i2
	nop
	set	0x1C, %g6
	lduh	[%l7 + %g6],	%o4
	add	%i3,	%o3,	%g6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f16
	set	0x40, %i0
	lda	[%l7 + %i0] 0x88,	%f21
	set	0x40, %o3
	ldxa	[%l7 + %o3] 0x80,	%o1
	nop
	set	0x74, %o0
	ldstub	[%l7 + %o0],	%g3
	nop
	set	0x18, %g3
	swap	[%l7 + %g3],	%o0
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%i6
	nop
	set	0x38, %g5
	std	%l4,	[%l7 + %g5]
	st	%f8,	[%l7 + 0x40]
	fpsub16s	%f27,	%f29,	%f2
	set	0x2C, %l6
	stba	%g4,	[%l7 + %l6] 0x80
	set	0x6C, %o4
	stwa	%i0,	[%l7 + %o4] 0x89
	nop
	set	0x69, %l1
	stb	%i5,	[%l7 + %l1]
	wr	%i1,	%l4,	%pic
	set	0x44, %i1
	lda	[%l7 + %i1] 0x81,	%f26
	nop
	set	0x44, %g4
	prefetch	[%l7 + %g4],	 3
	st	%f11,	[%l7 + 0x4C]
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x80,	%g5
	nop
	set	0x1A, %o5
	lduh	[%l7 + %o5],	%l2
	nop
	set	0x48, %o1
	std	%g6,	[%l7 + %o1]
	nop
	set	0x74, %i3
	ldsw	[%l7 + %i3],	%o6
	st	%f22,	[%l7 + 0x6C]
	nop
	set	0x08, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x08, %i2
	stwa	%l6,	[%l7 + %i2] 0x81
	set	0x22, %g1
	stha	%g1,	[%l7 + %g1] 0x89
	nop
	set	0x26, %l5
	ldsh	[%l7 + %l5],	%l1
	and	%o2,	%l0,	%o7
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%l3
	nop
	set	0x54, %l4
	ldsw	[%l7 + %l4],	%g2
	set	0x61, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i2
	set	0x15, %l0
	ldstuba	[%l7 + %l0] 0x89,	%i4
	ld	[%l7 + 0x08],	%f6
	set	0x38, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%o3
	nop
	set	0x31, %o6
	ldub	[%l7 + %o6],	%g6
	set	0x70, %i4
	stha	%i3,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x3E, %g6
	lduh	[%l7 + %g6],	%g3
	set	0x20, %l3
	swapa	[%l7 + %l3] 0x89,	%o1
	set	0x30, %i0
	stba	%o0,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x60, %l2
	sta	%f27,	[%l7 + %l2] 0x88
	add	%l5,	%i7,	%g4
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%i0
	set	0x38, %g3
	stda	%i4,	[%l7 + %g3] 0xe3
	membar	#Sync
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%g5
	nop
	set	0x40, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x1C, %o2
	stwa	%l2,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%g7,	%i1,	%l6
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x89,	%g0
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f30
	nop
	set	0x40, %o4
	std	%f12,	[%l7 + %o4]
	set	0x40, %l1
	swapa	[%l7 + %l1] 0x80,	%o6
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%o2
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x30, %i1
	std	%f20,	[%l7 + %i1]
	set	0x34, %o1
	sta	%f4,	[%l7 + %o1] 0x81
	nop
	set	0x24, %o5
	swap	[%l7 + %o5],	%l1
	set	0x10, %i3
	stxa	%o7,	[%l7 + %i3] 0x80
	set	0x76, %i7
	stha	%l3,	[%l7 + %i7] 0xea
	membar	#Sync
	add	%g2,	%l0,	%o5
	nop
	set	0x18, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x20, %l5
	ldub	[%l7 + %l5],	%i6
	set	0x13, %i5
	stba	%i4,	[%l7 + %i5] 0x88
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x81
	nop
	set	0x76, %g7
	lduh	[%l7 + %g7],	%o4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%g6
	nop
	set	0x5C, %g2
	stw	%i2,	[%l7 + %g2]
	set	0x20, %o6
	stxa	%g3,	[%l7 + %o6] 0x89
	set	0x1C, %i6
	sta	%f10,	[%l7 + %i6] 0x80
	add	%i3,	%o0,	%l5
	nop
	set	0x38, %i4
	prefetch	[%l7 + %i4],	 4
	nop
	set	0x18, %l3
	std	%o0,	[%l7 + %l3]
	or	%g4,	%i0,	%i7
	set	0x48, %g6
	stda	%l4,	[%l7 + %g6] 0x80
	or	%i5,	%g5,	%g7
	set	0x70, %i0
	ldxa	[%l7 + %i0] 0x80,	%i1
	set	0x60, %l2
	lda	[%l7 + %l2] 0x80,	%f6
	nop
	set	0x0C, %g3
	lduw	[%l7 + %g3],	%l2
	wr	%g1,	%l6,	%y
	add	%o2,	%l1,	%o6
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f2
	bgu,pn	%xcc,	loop_41
	nop
	set	0x74, %o0
	ldub	[%l7 + %o0],	%l3
	nop
	set	0x38, %l6
	lduw	[%l7 + %l6],	%g2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%o5
loop_41:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f16
	ba,pn	%xcc,	loop_42
	nop
	set	0x10, %o2
	stw	%o7,	[%l7 + %o2]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f18
	nop
	set	0x50, %g4
	prefetch	[%l7 + %g4],	 1
loop_42:
	nop
	set	0x68, %o7
	stda	%i6,	[%l7 + %o7] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%o3
	st	%f11,	[%l7 + 0x68]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i2
	set	0x68, %o4
	sta	%f1,	[%l7 + %o4] 0x88
	and	%g6,	%i3,	%o0
	nop
	set	0x5E, %o1
	ldsh	[%l7 + %o1],	%l5
	nop
	set	0x08, %i1
	std	%g2,	[%l7 + %i1]
	add	%o1,	%i0,	%g4
	or	%i7,	%i5,	%g5
	set	0x40, %i3
	stda	%l4,	[%l7 + %i3] 0x81
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	wr	%i1,	%g7,	%clear_softint
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l2
	nop
	set	0x68, %i7
	stx	%o2,	[%l7 + %i7]
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%l1
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f18
	nop
	set	0x78, %l5
	ldsw	[%l7 + %l5],	%o6
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%l6
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f0
	set	0x60, %g2
	lda	[%l7 + %g2] 0x80,	%f18
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x80,	%g2
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f0
	nop
	set	0x65, %i4
	stb	%l0,	[%l7 + %i4]
	set	0x08, %l3
	lda	[%l7 + %l3] 0x89,	%f14
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x89,	%o4
	nop
	set	0x0D, %g6
	ldsb	[%l7 + %g6],	%o7
	nop
	set	0x08, %i0
	stx	%i6,	[%l7 + %i0]
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xe2,	%o4
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x81,	%f22
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f16
	nop
	set	0x78, %g5
	prefetch	[%l7 + %g5],	 3
	and	%l3,	%o3,	%i2
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xeb,	%g6
	nop
	set	0x72, %l6
	sth	%i4,	[%l7 + %l6]
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x4C, %o7
	stw	%o0,	[%l7 + %o7]
	set	0x74, %g4
	sta	%f18,	[%l7 + %g4] 0x89
	nop
	set	0x48, %o4
	ldsw	[%l7 + %o4],	%l5
	or	%o1,	%g3,	%g4
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x81,	 1
	and	%i7,	%i5,	%g5
	wr	%i1,	%g7,	%y
	and	%g1,	%l2,	%o2
	nop
	set	0x28, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf0
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%o6
	nop
	set	0x1C, %i7
	lduh	[%l7 + %i7],	%l4
	set	0x24, %o5
	sta	%f25,	[%l7 + %o5] 0x81
	nop
	set	0x58, %i2
	sth	%l6,	[%l7 + %i2]
	nop
	set	0x68, %l5
	ldsb	[%l7 + %l5],	%l0
	nop
	set	0x4A, %g1
	ldsh	[%l7 + %g1],	%o5
	or	%g2,	%o7,	%o4
	or	%i6,	%o3,	%i2
	set	0x18, %l4
	stxa	%l3,	[%l7 + %l4] 0x80
	set	0x50, %l0
	lda	[%l7 + %l0] 0x81,	%f20
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%i4
	nop
	set	0x60, %o6
	ldsw	[%l7 + %o6],	%i3
	nop
	set	0x40, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x46, %g7
	sth	%o0,	[%l7 + %g7]
	nop
	set	0x45, %l3
	ldstub	[%l7 + %l3],	%g6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%f0
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x80,	%l5
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd0
	bgu,a	%xcc,	loop_43
	nop
	set	0x6A, %i6
	lduh	[%l7 + %i6],	%o1
	nop
	set	0x36, %l2
	ldsb	[%l7 + %l2],	%g4
	nop
	set	0x1E, %o3
	ldstub	[%l7 + %o3],	%i0
loop_43:
	nop
	set	0x28, %g3
	std	%f4,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x50, %g5
	ldub	[%l7 + %g5],	%g3
	nop
	set	0x6C, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x30, %l6
	stx	%i5,	[%l7 + %l6]
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%g5
	nop
	set	0x34, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x6C, %l1
	swap	[%l7 + %l1],	%i7
	st	%f4,	[%l7 + 0x7C]
	nop
	set	0x58, %g4
	std	%f2,	[%l7 + %g4]
	fpadd16s	%f10,	%f7,	%f4
	add	%g7,	%i1,	%l2
	nop
	set	0x2A, %o4
	sth	%o2,	[%l7 + %o4]
	bn,a	%icc,	loop_44
	st	%fsr,	[%l7 + 0x2C]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%o6
loop_44:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	st	%fsr,	[%l7 + 0x3C]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	and	%g1,	%l6,	%l4
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x80,	%o5
	nop
	set	0x34, %o5
	stb	%g2,	[%l7 + %o5]
	ld	[%l7 + 0x5C],	%f1
	nop
	set	0x38, %i2
	stw	%l0,	[%l7 + %i2]
	wr	%o7,	%i6,	%softint
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x88,	%o3
	set	0x14, %l5
	sta	%f30,	[%l7 + %l5] 0x81
	set	0x26, %l4
	stha	%o4,	[%l7 + %l4] 0x80
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%i2
	st	%f27,	[%l7 + 0x64]
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	wr	%l3,	%i4,	%sys_tick
	nop
	set	0x60, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x18, %g2
	lda	[%l7 + %g2] 0x89,	%f23
	nop
	set	0x08, %g1
	swap	[%l7 + %g1],	%i3
	set	0x44, %l3
	lda	[%l7 + %l3] 0x81,	%f15
	nop
	set	0x76, %i4
	lduh	[%l7 + %i4],	%g6
	nop
	set	0x41, %g6
	ldub	[%l7 + %g6],	%l5
	nop
	set	0x78, %g7
	sth	%o1,	[%l7 + %g7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o0
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x88,	%i0
	nop
	set	0x38, %l2
	lduw	[%l7 + %l2],	%g3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%g5
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f0
	nop
	set	0x10, %i0
	lduw	[%l7 + %i0],	%i7
	nop
	set	0x4E, %g5
	sth	%i1,	[%l7 + %g5]
	nop
	set	0x48, %g3
	stx	%l2,	[%l7 + %g3]
	nop
	set	0x68, %l6
	lduw	[%l7 + %l6],	%g7
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x2C, %o7
	swap	[%l7 + %o7],	%l1
	set	0x20, %o2
	sta	%f28,	[%l7 + %o2] 0x81
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%g0
	nop
	set	0x68, %o4
	swap	[%l7 + %o4],	%o6
	add	%l6,	%o5,	%l4
	nop
	set	0x28, %i3
	std	%l0,	[%l7 + %i3]
	set	0x5C, %l1
	lda	[%l7 + %l1] 0x88,	%f19
	nop
	set	0x1E, %i7
	stb	%g2,	[%l7 + %i7]
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x48, %i2
	swap	[%l7 + %i2],	%i6
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x68, %l5
	stda	%o6,	[%l7 + %l5] 0x80
	nop
	set	0x0C, %l4
	stb	%o4,	[%l7 + %l4]
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%o2
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%l2
	set	0x70, %i1
	sta	%f28,	[%l7 + %i1] 0x81
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f0
	nop
	set	0x34, %g2
	swap	[%l7 + %g2],	%i2
	nop
	set	0x4E, %g1
	ldsb	[%l7 + %g1],	%i3
	add	%i4,	%l5,	%g6
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f8
	or	%g4,	%o0,	%i0
	nop
	set	0x70, %g6
	std	%g2,	[%l7 + %g6]
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x89,	 4
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%o1
	nop
	set	0x48, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%g4
	nop
	set	0x68, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x10, %g5
	stx	%i1,	[%l7 + %g5]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f16
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f16
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x89,	 1
	nop
	set	0x6D, %o7
	ldsb	[%l7 + %o7],	%g7
	nop
	set	0x6D, %o2
	ldstub	[%l7 + %o2],	%l2
	set	0x1D, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o2
	set	0x2C, %o4
	stha	%l1,	[%l7 + %o4] 0x88
	set	0x18, %i3
	stxa	%g1,	[%l7 + %i3] 0x80
	set	0x28, %g3
	stda	%i6,	[%l7 + %g3] 0x89
	set	0x3A, %l1
	stha	%o5,	[%l7 + %l1] 0x81
	nop
	set	0x24, %i7
	lduh	[%l7 + %i7],	%l4
	st	%f27,	[%l7 + 0x18]
	nop
	set	0x60, %o1
	std	%l0,	[%l7 + %o1]
	nop
	set	0x1E, %i2
	ldub	[%l7 + %i2],	%g2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%o6
	set	0x30, %l0
	ldxa	[%l7 + %l0] 0x88,	%o7
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x81,	%i6
	set	0x26, %l4
	stha	%o3,	[%l7 + %l4] 0x89
	set	0x41, %i1
	stba	%o4,	[%l7 + %i1] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f16
	nop
	set	0x1C, %g2
	ldsh	[%l7 + %g2],	%l3
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x78, %g1
	stwa	%i3,	[%l7 + %g1] 0xea
	membar	#Sync
	bg	%icc,	loop_45
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%i4
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf0
	membar	#Sync
loop_45:
	nop
	set	0x28, %g6
	lduh	[%l7 + %g6],	%i2
	set	0x23, %l2
	ldstuba	[%l7 + %l2] 0x81,	%l5
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x80,	%g6
	nop
	set	0x18, %g5
	ldx	[%l7 + %g5],	%g4
	nop
	set	0x28, %i6
	stw	%i0,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x14]
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xe3,	%o0
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%i4
	nop
	set	0x10, %o0
	stx	%g3,	[%l7 + %o0]
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%o0
	nop
	set	0x7F, %o7
	stb	%i1,	[%l7 + %o7]
	and	%i7,	%g7,	%l2
	nop
	set	0x28, %o4
	stx	%g5,	[%l7 + %o4]
	nop
	set	0x35, %i3
	ldstub	[%l7 + %i3],	%l1
	wr 	%g0, 	0x7, 	%fprs
	ld	[%l7 + 0x48],	%f30
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x81,	%o5
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x81,	%f21
	nop
	set	0x5C, %i7
	stb	%l6,	[%l7 + %i7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%o7
	nop
	set	0x18, %o1
	std	%o6,	[%l7 + %o1]
	nop
	set	0x20, %g3
	std	%o2,	[%l7 + %g3]
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%o4
	nop
	set	0x70, %o5
	stx	%l3,	[%l7 + %o5]
	nop
	set	0x1E, %l0
	lduh	[%l7 + %l0],	%i6
	nop
	set	0x0B, %i2
	ldstub	[%l7 + %i2],	%i4
	set	0x32, %l4
	stha	%i2,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x69, %i5
	ldstub	[%l7 + %i5],	%i3
	st	%fsr,	[%l7 + 0x28]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%g4
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x89,	%i0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x81
	nop
	set	0x34, %i1
	stw	%g6,	[%l7 + %i1]
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x89,	 4
	nop
	set	0x20, %g7
	lduh	[%l7 + %g7],	%g3
	nop
	set	0x40, %g1
	prefetch	[%l7 + %g1],	 3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%o1
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x1C, %g6
	stw	%i1,	[%l7 + %g6]
	nop
	set	0x70, %l2
	lduw	[%l7 + %l2],	%i7
	nop
	set	0x10, %g5
	stw	%l2,	[%l7 + %g5]
	ld	[%l7 + 0x40],	%f17
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x40, %o3
	std	%g6,	[%l7 + %o3]
	nop
	set	0x70, %l6
	stx	%g5,	[%l7 + %l6]
	bgu,pt	%icc,	loop_46
	nop
	set	0x30, %i6
	std	%f22,	[%l7 + %i6]
	set	0x09, %i0
	stba	%o2,	[%l7 + %i0] 0x80
loop_46:
	st	%f12,	[%l7 + 0x2C]
	set	0x78, %o2
	stda	%g0,	[%l7 + %o2] 0x81
	set	0x2A, %o7
	stha	%l1,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x74, %o4
	lduw	[%l7 + %o4],	%l6
	nop
	set	0x0D, %i3
	ldsb	[%l7 + %i3],	%l4
	nop
	set	0x54, %o0
	ldsh	[%l7 + %o0],	%l0
	nop
	set	0x20, %g4
	std	%f12,	[%l7 + %g4]
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x18, %o1
	std	%o4,	[%l7 + %o1]
	or	%o7,	%g2,	%o6
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x08, %i7
	ldsw	[%l7 + %i7],	%o4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i6
	set	0x64, %l5
	stwa	%o3,	[%l7 + %l5] 0x80
	nop
	set	0x38, %g3
	lduh	[%l7 + %g3],	%i2
	fpsub16s	%f3,	%f23,	%f3
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%i2
	set	0x70, %i2
	stwa	%l5,	[%l7 + %i2] 0x88
	set	0x20, %l4
	prefetcha	[%l7 + %l4] 0x88,	 3
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	bl,a	%icc,	loop_47
	nop
	set	0x14, %o6
	stb	%g4,	[%l7 + %o6]
	or	%g6,	%i0,	%g3
	add	%i5,	%o1,	%i1
loop_47:
	nop
	set	0x40, %o5
	stx	%i7,	[%l7 + %o5]
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%l2
	set	0x18, %i4
	lda	[%l7 + %i4] 0x89,	%f11
	set	0x71, %g7
	stba	%g7,	[%l7 + %g7] 0x80
	wr	%o0,	%o2,	%sys_tick
	nop
	set	0x30, %g1
	stw	%g5,	[%l7 + %g1]
	bge,a,pt	%icc,	loop_48
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	fpsub32s	%f14,	%f20,	%f21
	nop
	set	0x70, %l3
	lduw	[%l7 + %l3],	%l1
loop_48:
	nop
	set	0x10, %l2
	std	%f8,	[%l7 + %l2]
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xe3,	%g0
	nop
	set	0x6A, %l6
	stb	%l4,	[%l7 + %l6]
	nop
	set	0x5D, %i6
	ldsb	[%l7 + %i6],	%l0
	or	%o5,	%g2,	%o6
	nop
	set	0x4F, %i0
	ldstub	[%l7 + %i0],	%o4
	nop
	set	0x0D, %o2
	stb	%l3,	[%l7 + %o2]
	st	%f24,	[%l7 + 0x40]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%o7
	set	0x40, %o7
	stxa	%o3,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x81,	%i3
	set	0x30, %i3
	lda	[%l7 + %i3] 0x88,	%f0
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f30
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%i2
	set	0x26, %o0
	stha	%i4,	[%l7 + %o0] 0x88
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%g4
	set	0x31, %i7
	stba	%l5,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i0
	ld	[%l7 + 0x4C],	%f16
	set	0x6F, %g3
	stba	%g6,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x2B, %i2
	ldub	[%l7 + %i2],	%i5
	set	0x68, %l0
	stda	%g2,	[%l7 + %l0] 0x80
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x60, %o6
	stha	%i1,	[%l7 + %o6] 0x89
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%o1
	add	%i7,	%g7,	%o0
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f4
	bgu,a,pt	%xcc,	loop_49
	nop
	set	0x14, %i4
	ldstub	[%l7 + %i4],	%o2
	nop
	set	0x16, %g7
	ldsh	[%l7 + %g7],	%l2
	set	0x18, %g1
	lda	[%l7 + %g1] 0x89,	%f17
loop_49:
	nop
	set	0x38, %g2
	ldub	[%l7 + %g2],	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g1
	and	%l1,	%l4,	%l0
	set	0x70, %l3
	stxa	%g2,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x7A, %l2
	lduh	[%l7 + %l2],	%o5
	fpadd16s	%f13,	%f31,	%f10
	nop
	set	0x6A, %g6
	stb	%o6,	[%l7 + %g6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i6
	nop
	set	0x18, %o3
	lduh	[%l7 + %o3],	%o7
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%o3
	set	0x5C, %l6
	stha	%i3,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%i4
	nop
	set	0x30, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%o4
	nop
	set	0x08, %o7
	stw	%g4,	[%l7 + %o7]
	nop
	set	0x2C, %o2
	stb	%l5,	[%l7 + %o2]
	add	%i0,	%g6,	%g3
	nop
	set	0x58, %i3
	ldsw	[%l7 + %i3],	%i1
	nop
	set	0x50, %o4
	stx	%i5,	[%l7 + %o4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%i7
	nop
	set	0x20, %l1
	stx	%o0,	[%l7 + %l1]
	nop
	set	0x56, %g4
	lduh	[%l7 + %g4],	%o2
	set	0x74, %o0
	stba	%g7,	[%l7 + %o0] 0x81
	fpadd32s	%f30,	%f17,	%f4
	st	%f23,	[%l7 + 0x68]
	st	%fsr,	[%l7 + 0x2C]
	set	0x28, %o1
	stwa	%l2,	[%l7 + %o1] 0x80
	set	0x28, %i7
	sta	%f4,	[%l7 + %i7] 0x81
	nop
	set	0x66, %g3
	lduh	[%l7 + %g3],	%l6
	set	0x38, %l5
	stda	%g4,	[%l7 + %l5] 0xe3
	membar	#Sync
	fpadd16s	%f22,	%f14,	%f11
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x88,	%l1
	nop
	set	0x68, %l0
	prefetch	[%l7 + %l0],	 3
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x53, %l4
	stb	%l4,	[%l7 + %l4]
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x70, %i5
	std	%f8,	[%l7 + %i5]
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x89,	 1
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%g2
	nop
	set	0x44, %g1
	stw	%o5,	[%l7 + %g1]
	nop
	set	0x1E, %g2
	lduh	[%l7 + %g2],	%g1
	nop
	set	0x15, %o6
	ldub	[%l7 + %o6],	%l3
	nop
	set	0x16, %l2
	ldub	[%l7 + %l2],	%o6
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%i6
	nop
	set	0x12, %g6
	ldsh	[%l7 + %g6],	%o3
	nop
	set	0x1A, %g5
	lduh	[%l7 + %g5],	%i3
	ld	[%l7 + 0x58],	%f16
	nop
	set	0x14, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x30, %o3
	stw	%i2,	[%l7 + %o3]
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%i4
	nop
	set	0x20, %i1
	sth	%o4,	[%l7 + %i1]
	nop
	set	0x70, %i0
	swap	[%l7 + %i0],	%g4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	nop
	setx	0xB077C4B8F7F0BD41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x98554AC86F79B6C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f20,	%f2
	nop
	set	0x14, %o7
	lduw	[%l7 + %o7],	%l5
	ld	[%l7 + 0x30],	%f29
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%g3
	st	%f12,	[%l7 + 0x50]
	nop
	set	0x18, %o4
	stw	%i5,	[%l7 + %o4]
	nop
	set	0x7C, %i3
	stw	%o1,	[%l7 + %i3]
	nop
	set	0x7E, %l1
	lduh	[%l7 + %l1],	%i7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f16
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x89,	%o0
	set	0x0F, %o1
	stba	%o2,	[%l7 + %o1] 0x80
	nop
	set	0x72, %i7
	sth	%i1,	[%l7 + %i7]
	or	%g7,	%l2,	%g5
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f8
	add	%l4,	%l0,	%g2
	set	0x5C, %l5
	lda	[%l7 + %l5] 0x89,	%f29
	st	%f11,	[%l7 + 0x10]
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f20
	st	%fsr,	[%l7 + 0x70]
	st	%f16,	[%l7 + 0x20]
	set	0x1F, %l4
	stba	%o5,	[%l7 + %l4] 0x81
	nop
	set	0x30, %o5
	stw	%l1,	[%l7 + %o5]
	nop
	set	0x36, %i4
	ldsb	[%l7 + %i4],	%g1
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xea,	%l2
	nop
	set	0x74, %g1
	stw	%i6,	[%l7 + %g1]
	add	%o3,	%o6,	%i3
	set	0x30, %i5
	stwa	%i2,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x70, %o6
	std	%f26,	[%l7 + %o6]
	set	0x20, %l2
	stwa	%o4,	[%l7 + %l2] 0xe2
	membar	#Sync
	wr	%i4,	%o7,	%y
	and	%g4,	%i0,	%l5
	nop
	set	0x0E, %l3
	ldub	[%l7 + %l3],	%g6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f16
	nop
	set	0x24, %g5
	ldsh	[%l7 + %g5],	%i5
	nop
	set	0x52, %l6
	stb	%o1,	[%l7 + %l6]
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x89,	%g3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f0
	bleu,a	%xcc,	loop_50
	nop
	set	0x38, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x34, %i6
	sta	%f4,	[%l7 + %i6] 0x88
loop_50:
	nop
	set	0x6A, %i0
	lduh	[%l7 + %i0],	%i7
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%o2
	add	%i1,	%g7,	%l2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%g4
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f22
	add	%o0,	%l6,	%l4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	and	%l0,	%g2,	%o5
	nop
	set	0x40, %o0
	ldstub	[%l7 + %o0],	%l1
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f0
	nop
	set	0x40, %o1
	lduw	[%l7 + %o1],	%l3
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%o6
	nop
	set	0x45, %i2
	ldsb	[%l7 + %i2],	%o3
	nop
	set	0x28, %l5
	std	%f30,	[%l7 + %l5]
	set	0x08, %i7
	stxa	%i3,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x5B, %l4
	ldstub	[%l7 + %l4],	%i2
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x60, %o5
	std	%o4,	[%l7 + %o5]
	ld	[%l7 + 0x24],	%f10
	set	0x70, %i4
	sta	%f16,	[%l7 + %i4] 0x89
	nop
	nop
	setx	0x312161626B7C6E37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x9573E3B0529E75C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f6
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xea,	%g4
	nop
	set	0x18, %g1
	swap	[%l7 + %g1],	%i4
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x37, %l2
	ldub	[%l7 + %l2],	%l5
	set	0x3B, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g6
	nop
	set	0x30, %l3
	std	%i0,	[%l7 + %l3]
	nop
	set	0x2C, %g6
	swap	[%l7 + %g6],	%o1
	set	0x58, %l6
	stxa	%i5,	[%l7 + %l6] 0x88
	add	%g3,	%i7,	%i1
	set	0x4E, %g5
	stba	%o2,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g7
	nop
	set	0x41, %g2
	stb	%g5,	[%l7 + %g2]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
	nop
	set	0x5E, %i6
	ldsh	[%l7 + %i6],	%o0
	set	0x70, %i0
	sta	%f11,	[%l7 + %i0] 0x81
	nop
	set	0x60, %o3
	lduw	[%l7 + %o3],	%l6
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%l0
	nop
	set	0x5C, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f2
	ld	[%l7 + 0x40],	%f27
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf9
	membar	#Sync
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x88,	%o5
	nop
	set	0x28, %g4
	stx	%l1,	[%l7 + %g4]
	or	%l3,	%g1,	%g2
	nop
	set	0x4F, %o1
	ldub	[%l7 + %o1],	%i6
	nop
	set	0x4A, %i2
	ldstub	[%l7 + %i2],	%o3
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f26
	st	%fsr,	[%l7 + 0x7C]
	st	%f13,	[%l7 + 0x50]
	or	%i3,	%o6,	%i2
	nop
	set	0x41, %g3
	stb	%o7,	[%l7 + %g3]
	nop
	set	0x36, %i7
	lduh	[%l7 + %i7],	%g4
	nop
	set	0x32, %o5
	sth	%i4,	[%l7 + %o5]
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%l4
	or	%o4,	%i0,	%o1
	wr	%i5,	%g3,	%y
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 4
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x88,	 4
	st	%f13,	[%l7 + 0x78]
	nop
	set	0x7E, %g7
	sth	%i7,	[%l7 + %g7]
	add	%i1,	%l2,	%o2
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x70, %g1
	ldsw	[%l7 + %g1],	%g7
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%g5
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%o0
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x1E, %l6
	ldstub	[%l7 + %l6],	%l6
	fpsub32	%f28,	%f14,	%f26
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x80,	%l0
	set	0x17, %g2
	stba	%o5,	[%l7 + %g2] 0xeb
	membar	#Sync
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 2
	set	0x60, %g5
	stwa	%g1,	[%l7 + %g5] 0x88
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x80,	%l1
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x44, %i0
	lda	[%l7 + %i0] 0x81,	%f12
	nop
	set	0x28, %o4
	sth	%g2,	[%l7 + %o4]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf9
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%g4
	set	0x48, %o2
	stxa	%i2,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x2E, %o0
	ldub	[%l7 + %o0],	%l5
	ld	[%l7 + 0x18],	%f0
	set	0x60, %l1
	sta	%f31,	[%l7 + %l1] 0x81
	nop
	set	0x48, %o7
	std	%o4,	[%l7 + %o7]
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%i4
	nop
	set	0x1B, %i2
	stb	%o1,	[%l7 + %i2]
	st	%f9,	[%l7 + 0x5C]
	set	0x50, %g4
	sta	%f12,	[%l7 + %g4] 0x88
	nop
	set	0x24, %l5
	stb	%i0,	[%l7 + %l5]
	nop
	set	0x0A, %g3
	sth	%g3,	[%l7 + %g3]
	nop
	set	0x58, %i7
	std	%f28,	[%l7 + %i7]
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%i5
	nop
	set	0x48, %o5
	ldub	[%l7 + %o5],	%g6
	set	0x68, %i4
	lda	[%l7 + %i4] 0x88,	%f31
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc2
	nop
	set	0x2E, %o6
	ldstub	[%l7 + %o6],	%i7
	nop
	set	0x1F, %g7
	stb	%l2,	[%l7 + %g7]
	and	%i1,	%o2,	%g7
	nop
	set	0x34, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x49, %l3
	ldstub	[%l7 + %l3],	%o0
	nop
	set	0x20, %g1
	sth	%g5,	[%l7 + %g1]
	nop
	set	0x09, %i5
	ldub	[%l7 + %i5],	%l6
	nop
	set	0x24, %g6
	ldub	[%l7 + %g6],	%l0
	nop
	set	0x48, %l6
	swap	[%l7 + %l6],	%o5
	or	%l3,	%l4,	%l1
	set	0x60, %i1
	stha	%g2,	[%l7 + %i1] 0xeb
	membar	#Sync
	or	%g1,	%i6,	%o6
	set	0x64, %g2
	stha	%o3,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x30, %g5
	stw	%i3,	[%l7 + %g5]
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x89,	%g4
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%i2
	nop
	set	0x60, %o4
	ldub	[%l7 + %o4],	%o7
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x2C, %i3
	prefetch	[%l7 + %i3],	 3
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%l4
	set	0x74, %o2
	sta	%f3,	[%l7 + %o2] 0x80
	set	0x39, %l1
	stba	%i4,	[%l7 + %l1] 0x81
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%o1
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%g3
	nop
	set	0x34, %o1
	ldsw	[%l7 + %o1],	%i0
	set	0x7C, %l5
	sta	%f2,	[%l7 + %l5] 0x89
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f16
	nop
	set	0x68, %i7
	lduw	[%l7 + %i7],	%i5
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xda
	set	0x2E, %o5
	stha	%i7,	[%l7 + %o5] 0xeb
	membar	#Sync
	or	%g6,	%l2,	%o2
	fpadd16	%f26,	%f14,	%f14
	set	0x68, %i4
	lda	[%l7 + %i4] 0x81,	%f11
	nop
	set	0x38, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%g7,	%o0,	%i1
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x5E, %g7
	stha	%g5,	[%l7 + %g7] 0x80
	set	0x10, %o6
	stxa	%l0,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x38, %l2
	ldsb	[%l7 + %l2],	%o5
	set	0x7D, %l3
	stba	%l6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x60, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x6B, %g6
	ldsb	[%l7 + %g6],	%l4
	nop
	set	0x30, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x60, %l6
	std	%l2,	[%l7 + %l6]
	st	%f14,	[%l7 + 0x34]
	set	0x38, %i1
	sta	%f16,	[%l7 + %i1] 0x81
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x81,	%l1
	and	%g1,	%g2,	%i6
	st	%f17,	[%l7 + 0x44]
	nop
	set	0x40, %o3
	ldub	[%l7 + %o3],	%o3
	nop
	set	0x17, %g5
	stb	%o6,	[%l7 + %g5]
	set	0x64, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i3
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%g4
	nop
	set	0x1C, %i0
	lduw	[%l7 + %i0],	%i2
	nop
	set	0x44, %o0
	stb	%o7,	[%l7 + %o0]
	bne,pt	%icc,	loop_51
	fpadd32s	%f26,	%f0,	%f28
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc2
loop_51:
	nop
	set	0x08, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x1B, %l1
	stb	%l5,	[%l7 + %l1]
	set	0x58, %i2
	swapa	[%l7 + %i2] 0x81,	%o1
	nop
	set	0x28, %o1
	stb	%g3,	[%l7 + %o1]
	nop
	set	0x27, %l5
	ldstub	[%l7 + %l5],	%i0
	fpsub16s	%f6,	%f14,	%f31
	nop
	set	0x58, %g4
	lduw	[%l7 + %g4],	%i4
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x89,	%i7
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x64, %i4
	stha	%g6,	[%l7 + %i4] 0x81
	st	%f23,	[%l7 + 0x50]
	set	0x22, %l4
	stha	%l2,	[%l7 + %l4] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	nop
	set	0x50, %g7
	std	%f12,	[%l7 + %g7]
	add	%o2,	%o0,	%i1
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x81,	 2
	nop
	set	0x1A, %l2
	ldsh	[%l7 + %l2],	%g7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l0
	set	0x54, %l0
	swapa	[%l7 + %l0] 0x88,	%l4
	fpadd32s	%f21,	%f1,	%f20
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%l1
	nop
	set	0x78, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x10, %i5
	stda	%l2,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x89,	%g2
	nop
	set	0x48, %i1
	lduh	[%l7 + %i1],	%i6
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x89,	 4
	set	0x30, %g2
	swapa	[%l7 + %g2] 0x81,	%o6
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%i2
	nop
	set	0x70, %o3
	swap	[%l7 + %o3],	%o3
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x38, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x68, %i0
	stxa	%g4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x34, %i3
	lda	[%l7 + %i3] 0x89,	%f12
	ld	[%l7 + 0x14],	%f22
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc0
	or	%i2,	%o7,	%o4
	set	0x1A, %l1
	stha	%o1,	[%l7 + %l1] 0x81
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%l4
	nop
	set	0x70, %o1
	stx	%g3,	[%l7 + %o1]
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%i4
	set	0x1A, %l5
	stha	%i7,	[%l7 + %l5] 0xe2
	membar	#Sync
	ba,a,pn	%icc,	loop_52
	nop
	set	0x3A, %i7
	lduh	[%l7 + %i7],	%i0
	nop
	set	0x78, %g4
	lduw	[%l7 + %g4],	%g6
	set	0x70, %g3
	lda	[%l7 + %g3] 0x81,	%f14
loop_52:
	nop
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f0
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%l2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f0
	bleu,a,pn	%xcc,	loop_53
	st	%f0,	[%l7 + 0x78]
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x89,	%i5
loop_53:
	nop
	set	0x40, %g7
	stx	%o2,	[%l7 + %g7]
	nop
	set	0x18, %o6
	stw	%o0,	[%l7 + %o6]
	set	0x10, %l2
	ldda	[%l7 + %l2] 0xeb,	%i0
	set	0x5C, %l3
	lda	[%l7 + %l3] 0x89,	%f6
	add	%g5,	%g7,	%l0
	nop
	set	0x57, %i5
	ldsb	[%l7 + %i5],	%o5
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%l4
	set	0x28, %l6
	lda	[%l7 + %l6] 0x81,	%f5
	nop
	set	0x38, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x14, %g1
	sth	%l1,	[%l7 + %g1]
	nop
	set	0x62, %g6
	ldstub	[%l7 + %g6],	%l6
	nop
	set	0x60, %g5
	ldsh	[%l7 + %g5],	%g2
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%i6
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x57, %o4
	ldsb	[%l7 + %o4],	%l3
	set	0x44, %i6
	swapa	[%l7 + %i6] 0x88,	%o6
	set	0x24, %o3
	swapa	[%l7 + %o3] 0x89,	%i3
	nop
	set	0x70, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%g1
	set	0x14, %i3
	lda	[%l7 + %i3] 0x80,	%f5
	set	0x08, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i2
	bgu,a,pn	%icc,	loop_54
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%o4
	or	%o1,	%l5,	%g3
	nop
	set	0x72, %o1
	sth	%i4,	[%l7 + %o1]
loop_54:
	nop
	set	0x34, %i2
	swap	[%l7 + %i2],	%i7
	wr	%i0,	%o7,	%softint
	st	%f27,	[%l7 + 0x18]
	and	%l2,	%g6,	%o2
	nop
	set	0x5E, %l5
	ldsh	[%l7 + %l5],	%o0
	fpadd16	%f20,	%f12,	%f16
	nop
	set	0x40, %g4
	std	%f2,	[%l7 + %g4]
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x81,	%i0
	nop
	set	0x10, %g3
	std	%f10,	[%l7 + %g3]
	nop
	set	0x26, %l4
	ldub	[%l7 + %l4],	%g5
	or	%i5,	%l0,	%g7
	set	0x58, %i4
	stda	%l4,	[%l7 + %i4] 0x81
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f20
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l1
	set	0x7C, %g7
	sta	%f18,	[%l7 + %g7] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g2
	st	%f20,	[%l7 + 0x1C]
	nop
	set	0x2F, %o7
	stb	%l3,	[%l7 + %o7]
	st	%f0,	[%l7 + 0x54]
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f20
	nop
	set	0x50, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x44, %l3
	stb	%i3,	[%l7 + %l3]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf1
	membar	#Sync
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	and	%o6,	%g4,	%g1
	nop
	set	0x0E, %i5
	ldstub	[%l7 + %i5],	%o4
	nop
	set	0x38, %i1
	std	%f4,	[%l7 + %i1]
	nop
	set	0x2A, %g6
	ldsb	[%l7 + %g6],	%i2
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x1A, %g5
	stba	%l5,	[%l7 + %g5] 0x80
	nop
	set	0x48, %o4
	std	%f4,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x58]
	set	0x10, %g2
	stxa	%g3,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x0E, %o3
	stha	%i4,	[%l7 + %o3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	fpadd32s	%f14,	%f30,	%f27
	set	0x35, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i7
	nop
	set	0x70, %o2
	stx	%o1,	[%l7 + %o2]
	fpadd16s	%f0,	%f3,	%f1
	set	0x74, %i6
	stba	%o7,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x70, %i3
	std	%f8,	[%l7 + %i3]
	set	0x18, %l1
	sta	%f3,	[%l7 + %l1] 0x81
	set	0x6D, %o1
	ldstuba	[%l7 + %o1] 0x88,	%l2
	nop
	set	0x31, %o0
	stb	%g6,	[%l7 + %o0]
	nop
	set	0x40, %l5
	std	%i0,	[%l7 + %l5]
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x80,	 3
	ld	[%l7 + 0x78],	%f23
	nop
	set	0x20, %i7
	lduw	[%l7 + %i7],	%i1
	set	0x5F, %g4
	ldstuba	[%l7 + %g4] 0x81,	%g5
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%o0
	set	0x40, %l4
	stda	%l0,	[%l7 + %l4] 0x81
	set	0x6D, %i4
	stba	%i5,	[%l7 + %i4] 0x88
	set	0x08, %o5
	lda	[%l7 + %o5] 0x81,	%f13
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf8
	membar	#Sync
	nop
	set	0x4F, %g7
	ldstub	[%l7 + %g7],	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%o5
	set	0x48, %o6
	lda	[%l7 + %o6] 0x80,	%f8
	nop
	set	0x42, %l3
	ldsh	[%l7 + %l3],	%l6
	set	0x60, %l2
	stda	%g2,	[%l7 + %l2] 0xeb
	membar	#Sync
	or	%l3,	%l1,	%i6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o6
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x88,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%g1
	set	0x0C, %i5
	sta	%f30,	[%l7 + %i5] 0x89
	ld	[%l7 + 0x24],	%f29
	add	%o4,	%i2,	%g3
	set	0x40, %l6
	stda	%l4,	[%l7 + %l6] 0x80
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x30, %g1
	stx	%i7,	[%l7 + %g1]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i4
	nop
	set	0x24, %g5
	stw	%o7,	[%l7 + %g5]
	nop
	set	0x5C, %i1
	ldstub	[%l7 + %i1],	%g6
	bl,a,pn	%xcc,	loop_55
	wr	%l2,	%i0,	%clear_softint
	set	0x70, %o4
	stda	%i0,	[%l7 + %o4] 0xe3
	membar	#Sync
loop_55:
	wr	%o2,	%g5,	%y
	add	%l0,	%i5,	%g7
	nop
	set	0x1A, %g2
	ldsh	[%l7 + %g2],	%o0
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x08, %i0
	lduh	[%l7 + %i0],	%l4
	set	0x7A, %o3
	stba	%o5,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x5C, %i6
	swapa	[%l7 + %i6] 0x80,	%l6
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc8
	nop
	set	0x59, %o2
	ldsb	[%l7 + %o2],	%g2
	set	0x58, %o1
	stxa	%l3,	[%l7 + %o1] 0x88
	nop
	set	0x08, %l1
	lduh	[%l7 + %l1],	%i6
	nop
	set	0x58, %o0
	stx	%l1,	[%l7 + %o0]
	st	%f18,	[%l7 + 0x70]
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%o3
	and	%o6,	%i3,	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%g4
	nop
	set	0x74, %i7
	ldsh	[%l7 + %i7],	%i2
	add	%g3,	%i7,	%l5
	bleu	%xcc,	loop_56
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x20, %g3
	stxa	%o1,	[%l7 + %g3] 0xea
	membar	#Sync
loop_56:
	nop
	set	0x28, %g4
	stw	%i4,	[%l7 + %g4]
	set	0x40, %i4
	stwa	%o7,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x10, %l4
	ldsw	[%l7 + %l4],	%g6
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%l2
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x40, %o6
	std	%f28,	[%l7 + %o6]
	fpadd16s	%f29,	%f25,	%f14
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	fpadd16	%f30,	%f14,	%f6
	nop
	set	0x68, %g7
	std	%f18,	[%l7 + %g7]
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%i1
	set	0x10, %i5
	lda	[%l7 + %i5] 0x89,	%f30
	st	%f15,	[%l7 + 0x10]
	set	0x28, %l6
	swapa	[%l7 + %l6] 0x81,	%i0
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%g5
	nop
	set	0x60, %g1
	sth	%l0,	[%l7 + %g1]
	nop
	set	0x20, %l0
	stx	%i5,	[%l7 + %l0]
	nop
	set	0x58, %i1
	std	%g6,	[%l7 + %i1]
	set	0x20, %g5
	stda	%o0,	[%l7 + %g5] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf8,	%f0
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%l4
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f12
	bge	%xcc,	loop_57
	ld	[%l7 + 0x48],	%f28
	nop
	set	0x0E, %o3
	sth	%o5,	[%l7 + %o3]
	st	%f12,	[%l7 + 0x6C]
loop_57:
	nop
	set	0x08, %i6
	lda	[%l7 + %i6] 0x88,	%f12
	set	0x78, %o2
	stba	%l6,	[%l7 + %o2] 0xe2
	membar	#Sync
	st	%f19,	[%l7 + 0x08]
	set	0x20, %o1
	lda	[%l7 + %o1] 0x88,	%f2
	nop
	set	0x40, %l1
	std	%f6,	[%l7 + %l1]
	set	0x5C, %o0
	stwa	%o2,	[%l7 + %o0] 0x89
	nop
	set	0x1C, %i2
	swap	[%l7 + %i2],	%g2
	set	0x46, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l3
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%i6
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x80,	 2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f0
	nop
	set	0x6E, %i4
	stb	%o6,	[%l7 + %i4]
	or	%i3,	%o3,	%g1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE65, 	%sys_tick_cmpr
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%g3
	st	%fsr,	[%l7 + 0x14]
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x88,	%i7
	nop
	set	0x20, %o5
	std	%l4,	[%l7 + %o5]
	st	%f23,	[%l7 + 0x74]
	nop
	set	0x3C, %o7
	ldstub	[%l7 + %o7],	%o1
	nop
	set	0x34, %l4
	sth	%o7,	[%l7 + %l4]
	nop
	set	0x26, %l3
	ldsb	[%l7 + %l3],	%i4
	or	%l2,	%g6,	%i0
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x89,	%f18
	set	0x48, %o6
	stba	%i1,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x89,	%l0
	bg,a,pn	%icc,	loop_58
	fpsub32s	%f28,	%f9,	%f7
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x80,	%i5
loop_58:
	nop
	set	0x16, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g5
	nop
	set	0x70, %l6
	sth	%o0,	[%l7 + %l6]
	nop
	set	0x24, %g1
	ldstub	[%l7 + %g1],	%g7
	set	0x38, %l0
	stxa	%o5,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x2C, %i1
	swapa	[%l7 + %i1] 0x89,	%l4
	nop
	set	0x0C, %g5
	lduh	[%l7 + %g5],	%l6
	set	0x58, %o4
	stda	%o2,	[%l7 + %o4] 0x89
	set	0x68, %i0
	stda	%g2,	[%l7 + %i0] 0x88
	nop
	set	0x50, %g2
	swap	[%l7 + %g2],	%l3
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x80,	%l0
	nop
	set	0x37, %o1
	ldstub	[%l7 + %o1],	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i3
	st	%fsr,	[%l7 + 0x24]
	ble,pt	%xcc,	loop_59
	and	%g1,	%o3,	%o4
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x81,	%i2
loop_59:
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x72, %l1
	ldub	[%l7 + %l1],	%g4
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x12, %o0
	lduh	[%l7 + %o0],	%g3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f0
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%o6
	st	%fsr,	[%l7 + 0x34]
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xe2,	%o0
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%i4
	nop
	set	0x60, %g4
	swap	[%l7 + %g4],	%l2
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%g6
	set	0x78, %o5
	swapa	[%l7 + %o5] 0x88,	%i0
	nop
	set	0x24, %o7
	ldsh	[%l7 + %o7],	%l0
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x1A, %l4
	stha	%i5,	[%l7 + %l4] 0x80
	add	%i1,	%o0,	%g7
	nop
	set	0x58, %g7
	stw	%g5,	[%l7 + %g7]
	nop
	set	0x10, %l3
	stb	%l4,	[%l7 + %l3]
	nop
	set	0x34, %o6
	ldsh	[%l7 + %o6],	%l6
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x88,	 2
	st	%f4,	[%l7 + 0x64]
	set	0x08, %i5
	stda	%g2,	[%l7 + %i5] 0x88
	nop
	set	0x58, %g6
	std	%f4,	[%l7 + %g6]
	set	0x38, %l6
	stda	%o4,	[%l7 + %l6] 0x81
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%i6
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%o6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%i3
	set	0x7A, %i1
	stha	%g1,	[%l7 + %i1] 0x80
	nop
	set	0x60, %g1
	stw	%o4,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x5C]
	bgu,a,pt	%xcc,	loop_60
	ld	[%l7 + 0x50],	%f10
	nop
	set	0x13, %o4
	ldsb	[%l7 + %o4],	%o3
	nop
	set	0x4A, %g5
	ldsb	[%l7 + %g5],	%i2
loop_60:
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 3
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x81,	 2
	set	0x14, %o1
	swapa	[%l7 + %o1] 0x88,	%l5
	and	%g3,	%g4,	%o1
	set	0x49, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i4
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0
	set	0x28, %l1
	sta	%f26,	[%l7 + %l1] 0x81
	nop
	set	0x55, %o0
	ldstub	[%l7 + %o0],	%o7
	nop
	set	0x58, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%i0
	st	%f2,	[%l7 + 0x34]
	set	0x58, %i2
	sta	%f3,	[%l7 + %i2] 0x81
	nop
	set	0x64, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd8
	set	0x3E, %o5
	stha	%l0,	[%l7 + %o5] 0x81
	nop
	set	0x40, %l5
	lduh	[%l7 + %l5],	%i5
	and	%g6,	%o0,	%g7
	ld	[%l7 + 0x30],	%f11
	nop
	nop
	setx	0x7716B56C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xC86B50E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f5,	%f16
	and	%g5,	%i1,	%l4
	add	%l6,	%o2,	%o5
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f2
	or	%g2,	%i6,	%o6
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf1
	membar	#Sync
	nop
	set	0x20, %g7
	stw	%l1,	[%l7 + %g7]
	set	0x4C, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i3
	nop
	set	0x78, %l3
	std	%g0,	[%l7 + %l3]
	nop
	set	0x16, %i5
	ldstub	[%l7 + %i5],	%l3
	nop
	set	0x18, %g6
	lduw	[%l7 + %g6],	%o4
	nop
	set	0x58, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x5A, %l0
	ldsh	[%l7 + %l0],	%i2
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	add	%l5,	%o3,	%g4
	nop
	set	0x0D, %g1
	stb	%g3,	[%l7 + %g1]
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f16
	nop
	set	0x78, %o4
	std	%f8,	[%l7 + %o4]
	nop
	set	0x10, %g5
	stw	%o1,	[%l7 + %g5]
	nop
	set	0x2E, %g2
	ldsh	[%l7 + %g2],	%i4
	set	0x50, %i0
	swapa	[%l7 + %i0] 0x80,	%o7
	nop
	set	0x58, %o1
	stx	%i0,	[%l7 + %o1]
	set	0x40, %o3
	stha	%l0,	[%l7 + %o3] 0x80
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x88,	 0
	set	0x7A, %i6
	stha	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x58, %l1
	lduw	[%l7 + %l1],	%l2
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x88,	%g7
	and	%o0,	%g5,	%l4
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f10
	nop
	set	0x70, %i2
	ldx	[%l7 + %i2],	%l6
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x80,	%o2
	or	%i1,	%o5,	%g2
	nop
	set	0x60, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x76, %o5
	ldstub	[%l7 + %o5],	%o6
	fpadd32	%f24,	%f0,	%f28
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f2
	set	0x10, %g4
	stha	%l1,	[%l7 + %g4] 0x88
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	nop
	set	0x18, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x46, %g7
	ldub	[%l7 + %g7],	%i3
	nop
	set	0x1F, %l4
	ldstub	[%l7 + %l4],	%l3
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x80,	%g1
	nop
	set	0x36, %o6
	ldstub	[%l7 + %o6],	%o4
	or	%i2,	%i7,	%l5
	and	%o3,	%g3,	%g4
	nop
	set	0x76, %g6
	stb	%o1,	[%l7 + %g6]
	wr	%o7,	%i0,	%ccr
	set	0x18, %l2
	sta	%f27,	[%l7 + %l2] 0x88
	or	%l0,	%i5,	%i4
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x81,	%l2
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x89,	%g6
	nop
	set	0x20, %i5
	lduw	[%l7 + %i5],	%g7
	st	%fsr,	[%l7 + 0x28]
	and	%o0,	%l4,	%g5
	set	0x6B, %l6
	ldstuba	[%l7 + %l6] 0x81,	%l6
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x70, %g1
	ldstub	[%l7 + %g1],	%i1
	nop
	set	0x68, %g5
	std	%o2,	[%l7 + %g5]
	st	%f24,	[%l7 + 0x30]
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xea,	%o4
	st	%f29,	[%l7 + 0x20]
	set	0x70, %i0
	swapa	[%l7 + %i0] 0x80,	%g2
	nop
	set	0x4C, %o1
	stw	%o6,	[%l7 + %o1]
	ld	[%l7 + 0x48],	%f29
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x88,	%l0
	nop
	set	0x08, %o3
	std	%f20,	[%l7 + %o3]
	fpsub32s	%f2,	%f10,	%f24
	set	0x43, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i6
	nop
	set	0x2C, %i7
	ldsh	[%l7 + %i7],	%l3
	set	0x20, %l1
	stda	%i2,	[%l7 + %l1] 0x88
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f26
	nop
	set	0x26, %i2
	ldsb	[%l7 + %i2],	%o4
	nop
	set	0x20, %i3
	ldsw	[%l7 + %i3],	%g1
	nop
	set	0x1C, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x50, %l5
	ldsb	[%l7 + %l5],	%i7
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f30
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%i2
	set	0x1C, %g4
	lda	[%l7 + %g4] 0x88,	%f12
	nop
	set	0x6E, %g7
	sth	%l5,	[%l7 + %g7]
	nop
	set	0x21, %l3
	ldub	[%l7 + %l3],	%o3
	wr	%g4,	%g3,	%softint
	set	0x24, %o6
	swapa	[%l7 + %o6] 0x89,	%o7
	st	%fsr,	[%l7 + 0x18]
	set	0x08, %l4
	stwa	%o1,	[%l7 + %l4] 0x81
	nop
	set	0x0B, %g6
	ldstub	[%l7 + %g6],	%l0
	st	%fsr,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x74, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x45, %l2
	stba	%i5,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x6C, %i5
	stwa	%i4,	[%l7 + %i5] 0x80
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	nop
	set	0x4E, %l6
	ldstub	[%l7 + %l6],	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g7
	nop
	set	0x40, %o4
	stx	%i0,	[%l7 + %o4]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%g5
	and	%l6,	%l4,	%o2
	set	0x78, %g5
	stda	%o4,	[%l7 + %g5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x1C]
	and	%i1,	%g2,	%o6
	ld	[%l7 + 0x18],	%f2
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f4
	nop
	set	0x24, %g2
	lduh	[%l7 + %g2],	%i6
	set	0x24, %i0
	stba	%l1,	[%l7 + %i0] 0x88
	nop
	set	0x29, %o1
	ldstub	[%l7 + %o1],	%i3
	nop
	set	0x53, %o3
	ldsb	[%l7 + %o3],	%l3
	nop
	set	0x64, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x10, %i6
	lda	[%l7 + %i6] 0x88,	%f31
	or	%g1,	%o4,	%i2
	nop
	set	0x08, %l1
	std	%l4,	[%l7 + %l1]
	bg	%xcc,	loop_61
	nop
	set	0x48, %o0
	lduw	[%l7 + %o0],	%o3
	set	0x48, %i2
	stda	%g4,	[%l7 + %i2] 0x88
loop_61:
	nop
	set	0x2F, %i7
	ldsb	[%l7 + %i7],	%g3
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x78, %l5
	std	%f14,	[%l7 + %l5]
	nop
	set	0x5E, %i3
	ldsh	[%l7 + %i3],	%i7
	ld	[%l7 + 0x08],	%f7
	nop
	set	0x44, %g3
	ldsw	[%l7 + %g3],	%o1
	set	0x68, %i4
	lda	[%l7 + %i4] 0x88,	%f27
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xe2,	%o6
	and	%i5,	%l0,	%l2
	set	0x08, %g7
	stxa	%i4,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x39, %l3
	ldub	[%l7 + %l3],	%g6
	nop
	set	0x24, %o6
	stw	%i0,	[%l7 + %o6]
	set	0x09, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g7
	ld	[%l7 + 0x4C],	%f20
	nop
	set	0x48, %l4
	std	%f8,	[%l7 + %l4]
	st	%f7,	[%l7 + 0x64]
	set	0x28, %g6
	stba	%o0,	[%l7 + %g6] 0x89
	nop
	set	0x28, %l0
	stx	%g5,	[%l7 + %l0]
	nop
	set	0x17, %i5
	ldstub	[%l7 + %i5],	%l6
	nop
	set	0x68, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x08, %l6
	lduw	[%l7 + %l6],	%o2
	nop
	set	0x17, %o4
	stb	%l4,	[%l7 + %o4]
	add	%i1,	%o5,	%o6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%g2
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f2
	nop
	set	0x30, %i0
	ldsw	[%l7 + %i0],	%l1
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%i3
	set	0x10, %o3
	stwa	%i6,	[%l7 + %o3] 0x81
	nop
	set	0x5B, %o2
	ldub	[%l7 + %o2],	%l3
	set	0x60, %l1
	stda	%o4,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x30, %i6
	swapa	[%l7 + %i6] 0x89,	%i2
	nop
	set	0x7F, %o0
	stb	%g1,	[%l7 + %o0]
	nop
	set	0x5F, %i7
	ldub	[%l7 + %i7],	%l5
	set	0x76, %o5
	stba	%o3,	[%l7 + %o5] 0x89
	or	%g4,	%g3,	%o1
	add	%o7,	%i7,	%l0
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x81,	%i5
	ld	[%l7 + 0x74],	%f2
	nop
	set	0x69, %i3
	ldstub	[%l7 + %i3],	%i4
	set	0x50, %i2
	stda	%g6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x89,	%i0
	set	0x7C, %o7
	lda	[%l7 + %o7] 0x80,	%f15
	nop
	set	0x10, %i4
	std	%l2,	[%l7 + %i4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%g5
	set	0x58, %l3
	stxa	%l6,	[%l7 + %l3] 0x81
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x80,	%o2
	ld	[%l7 + 0x7C],	%f22
	nop
	set	0x6C, %g4
	ldstub	[%l7 + %g4],	%g7
	set	0x10, %o6
	stwa	%l4,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%o5
	set	0x48, %l0
	stxa	%o6,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%i1
	set	0x70, %l6
	sta	%f11,	[%l7 + %l6] 0x81
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%i3
	nop
	set	0x30, %i1
	stx	%l3,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%i6
	nop
	set	0x5A, %g1
	lduh	[%l7 + %g1],	%i2
	nop
	set	0x78, %i0
	std	%f16,	[%l7 + %i0]
	and	%g1,	%o4,	%o3
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f10
	wr	%g4,	%g3,	%set_softint
	nop
	set	0x2E, %o1
	sth	%l5,	[%l7 + %o1]
	set	0x60, %o2
	swapa	[%l7 + %o2] 0x88,	%o7
	st	%fsr,	[%l7 + 0x40]
	and	%o1,	%l0,	%i5
	ld	[%l7 + 0x7C],	%f27
	and	%i4,	%g6,	%i7
	nop
	set	0x4C, %l1
	sth	%l2,	[%l7 + %l1]
	set	0x4C, %o3
	swapa	[%l7 + %o3] 0x88,	%o0
	nop
	set	0x30, %i6
	stx	%g5,	[%l7 + %i6]
	or	%i0,	%o2,	%g7
	st	%f26,	[%l7 + 0x0C]
	nop
	set	0x6F, %i7
	stb	%l4,	[%l7 + %i7]
	set	0x68, %o5
	sta	%f14,	[%l7 + %o5] 0x89
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o5
	set	0x52, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i1
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f16
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x80,	 3
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f0
	set	0x68, %i2
	stda	%i2,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x3B, %g7
	ldstub	[%l7 + %g7],	%l3
	nop
	set	0x6C, %g4
	stw	%i6,	[%l7 + %g4]
	set	0x7C, %l3
	stwa	%g1,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	set	0x3F, %l4
	stba	%o4,	[%l7 + %l4] 0x88
	nop
	set	0x3E, %o6
	ldub	[%l7 + %o6],	%g4
	ld	[%l7 + 0x54],	%f22
	nop
	set	0x64, %i5
	stw	%o3,	[%l7 + %i5]
	set	0x68, %l6
	sta	%f24,	[%l7 + %l6] 0x89
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x89,	%l5
	set	0x1C, %i1
	sta	%f17,	[%l7 + %i1] 0x88
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%l0
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f20
	set	0x0C, %l2
	stwa	%g3,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%i4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	set	0x1C, %o1
	sta	%f31,	[%l7 + %o1] 0x81
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x80,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%i7
	set	0x4C, %l1
	lda	[%l7 + %l1] 0x88,	%f0
	set	0x74, %o3
	swapa	[%l7 + %o3] 0x89,	%l2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%i0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x78, %i6
	sth	%o2,	[%l7 + %i6]
	wr	%g7,	%l4,	%set_softint
	or	%g5,	%l6,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%g2
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f0
	nop
	nop
	setx	0x6B05280D4398B3A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2369788988B4F372,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f24,	%f30
	nop
	set	0x40, %o0
	stw	%l1,	[%l7 + %o0]
	wr	%i3,	%o6,	%y
	add	%i6,	%g1,	%i2
	set	0x55, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l3
	set	0x48, %l5
	stda	%o4,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x5C, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x30, %i4
	stb	%o3,	[%l7 + %i4]
	add	%l5,	%g4,	%o1
	nop
	set	0x70, %i2
	ldx	[%l7 + %i2],	%l0
	nop
	set	0x14, %g3
	stb	%o7,	[%l7 + %g3]
	fpsub32s	%f20,	%f12,	%f18
	fpadd32	%f6,	%f20,	%f10
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%i4
	and	%g3,	%g6,	%i5
	nop
	set	0x40, %l3
	stw	%i7,	[%l7 + %l3]
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f30
	or	%o0,	%i0,	%o2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x80
	ld	[%l7 + 0x40],	%f8
	add	%g7,	%l2,	%l4
	nop
	set	0x14, %o6
	sth	%g5,	[%l7 + %o6]
	and	%l6,	%i1,	%g2
	nop
	set	0x3C, %i5
	lduw	[%l7 + %i5],	%o5
	nop
	set	0x5C, %g4
	ldsw	[%l7 + %g4],	%i3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f16
	nop
	set	0x6C, %o4
	stw	%l1,	[%l7 + %o4]
	ld	[%l7 + 0x64],	%f20
	ld	[%l7 + 0x70],	%f19
	set	0x6E, %i1
	stha	%i6,	[%l7 + %i1] 0x81
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f18
	set	0x50, %l0
	stxa	%g1,	[%l7 + %l0] 0x81
	ld	[%l7 + 0x54],	%f3
	set	0x38, %g1
	stwa	%i2,	[%l7 + %g1] 0x80
	nop
	nop
	setx	0x070FA14A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x95B71A5F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f2,	%f23
	add	%l3,	%o4,	%o3
	fpadd16s	%f19,	%f21,	%f5
	st	%f8,	[%l7 + 0x5C]
	fpsub16s	%f8,	%f28,	%f17
	nop
	set	0x5C, %l2
	sth	%l5,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x5C]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%o6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x89
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f4
	add	%o1,	%g4,	%l0
	and	%o7,	%i4,	%g3
	nop
	set	0x4F, %i6
	ldstub	[%l7 + %i6],	%g6
	set	0x08, %l1
	stwa	%i5,	[%l7 + %l1] 0x88
	nop
	set	0x58, %i7
	stb	%i7,	[%l7 + %i7]
	ld	[%l7 + 0x30],	%f14
	set	0x60, %o2
	stda	%o0,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x80,	 3
	set	0x6E, %o0
	stba	%g7,	[%l7 + %o0] 0x88
	or	%o2,	%l4,	%g5
	nop
	set	0x64, %l5
	lduh	[%l7 + %l5],	%l6
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x40, %i4
	swap	[%l7 + %i4],	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%g2
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%o5
	and	%l1,	%i6,	%g1
	nop
	set	0x32, %g3
	ldub	[%l7 + %g3],	%i3
	st	%f26,	[%l7 + 0x78]
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x89,	%i2
	nop
	set	0x64, %l3
	ldsh	[%l7 + %l3],	%l3
	set	0x54, %g6
	sta	%f5,	[%l7 + %g6] 0x89
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x89,	 2
	nop
	set	0x78, %o6
	stw	%l5,	[%l7 + %o6]
	or	%o6,	%o1,	%o4
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x18, %g4
	stw	%l0,	[%l7 + %g4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%g4
	nop
	set	0x2A, %l6
	lduh	[%l7 + %l6],	%i4
	and	%g6,	%g3,	%i7
	set	0x08, %o4
	stda	%i4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x38, %i5
	stda	%i0,	[%l7 + %i5] 0x80
	nop
	set	0x38, %g5
	stx	%o0,	[%l7 + %g5]
	and	%o2,	%l4,	%g7
	add	%g5,	%l6,	%l2
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	or	%i1,	%l1,	%i6
	nop
	set	0x08, %g1
	std	%o4,	[%l7 + %g1]
	st	%f15,	[%l7 + 0x20]
	nop
	set	0x76, %l2
	sth	%i3,	[%l7 + %l2]
	set	0x2C, %g2
	stwa	%g1,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x58, %i1
	std	%f2,	[%l7 + %i1]
	nop
	set	0x0E, %i0
	ldsb	[%l7 + %i0],	%l3
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f4
	set	0x70, %o1
	swapa	[%l7 + %o1] 0x80,	%i2
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%l5
	nop
	set	0x4A, %i6
	stb	%o3,	[%l7 + %i6]
	set	0x74, %i7
	swapa	[%l7 + %i7] 0x80,	%o1
	nop
	set	0x28, %o2
	lduw	[%l7 + %o2],	%o6
	nop
	set	0x44, %o0
	sth	%o4,	[%l7 + %o0]
	add	%l0,	%o7,	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%g3
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x73, %l5
	ldstub	[%l7 + %l5],	%g4
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x3C, %i3
	stwa	%i7,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x2C, %i2
	stwa	%i5,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x3C, %g3
	prefetch	[%l7 + %g3],	 0
	nop
	set	0x10, %i4
	std	%i0,	[%l7 + %i4]
	ld	[%l7 + 0x68],	%f31
	nop
	set	0x70, %g7
	std	%o0,	[%l7 + %g7]
	nop
	set	0x78, %g6
	stw	%o2,	[%l7 + %g6]
	nop
	set	0x14, %l4
	ldsh	[%l7 + %l4],	%l4
	nop
	set	0x60, %l3
	ldsh	[%l7 + %l3],	%g7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f16
	ld	[%l7 + 0x38],	%f22
	set	0x57, %o6
	stba	%l6,	[%l7 + %o6] 0x88
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f0
	nop
	set	0x58, %g4
	std	%g4,	[%l7 + %g4]
	nop
	set	0x1C, %i5
	ldub	[%l7 + %i5],	%l2
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%i0
	nop
	set	0x22, %g5
	lduh	[%l7 + %g5],	%g2
	set	0x78, %g1
	stda	%i6,	[%l7 + %g1] 0x81
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xea,	%l0
	nop
	set	0x7C, %l2
	lduw	[%l7 + %l2],	%i3
	nop
	set	0x6C, %i1
	sth	%g1,	[%l7 + %i1]
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%o5,	%i2,	%l3
	nop
	set	0x30, %o3
	std	%f8,	[%l7 + %o3]
	nop
	set	0x2D, %o1
	ldstub	[%l7 + %o1],	%l5
	add	%o3,	%o1,	%o6
	ble,a	%xcc,	loop_62
	nop
	set	0x1C, %l1
	ldub	[%l7 + %l1],	%l0
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%o4
	nop
	set	0x24, %i7
	prefetch	[%l7 + %i7],	 2
loop_62:
	st	%f13,	[%l7 + 0x34]
	set	0x52, %o2
	stha	%o7,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x10, %o0
	ldsh	[%l7 + %o0],	%i4
	nop
	set	0x28, %i6
	sth	%g6,	[%l7 + %i6]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%i7
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x88,	%g4
	nop
	set	0x7C, %i3
	ldub	[%l7 + %i3],	%i0
	nop
	set	0x44, %o5
	ldsh	[%l7 + %o5],	%o0
	nop
	set	0x4C, %i2
	lduw	[%l7 + %i2],	%o2
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%i5
	set	0x38, %g3
	swapa	[%l7 + %g3] 0x81,	%l4
	wr	%l6,	%g5,	%set_softint
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%g7
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xea,	%i0
	nop
	set	0x4C, %l3
	stw	%g2,	[%l7 + %l3]
	nop
	set	0x18, %o7
	std	%f2,	[%l7 + %o7]
	set	0x30, %l4
	stda	%i6,	[%l7 + %l4] 0xeb
	membar	#Sync
	and	%l2,	%l1,	%g1
	nop
	set	0x4C, %o6
	stb	%o5,	[%l7 + %o6]
	nop
	set	0x75, %g4
	ldstub	[%l7 + %g4],	%i2
	bl,a,pt	%icc,	loop_63
	st	%f12,	[%l7 + 0x28]
	ba,pt	%xcc,	loop_64
	st	%f0,	[%l7 + 0x20]
loop_63:
	nop
	set	0x24, %l6
	lduh	[%l7 + %l6],	%l3
	nop
	set	0x34, %i5
	ldsw	[%l7 + %i5],	%i3
loop_64:
	nop
	set	0x14, %g5
	swapa	[%l7 + %g5] 0x80,	%l5
	or	%o3,	%o6,	%o1
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x88,	%l0
	set	0x6C, %l0
	stha	%o4,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x58, %l2
	stw	%i4,	[%l7 + %l2]
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f20
	and	%o7,	%g3,	%i7
	nop
	set	0x6B, %i1
	ldsb	[%l7 + %i1],	%g6
	nop
	set	0x40, %g2
	swap	[%l7 + %g2],	%g4
	fpsub16s	%f2,	%f12,	%f10
	nop
	set	0x3C, %o1
	prefetch	[%l7 + %o1],	 2
	set	0x10, %o3
	stxa	%i0,	[%l7 + %o3] 0x89
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%l4
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%f1,	[%l7 + 0x38]
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%l6
	bn,a,pt	%xcc,	loop_65
	nop
	set	0x48, %o0
	std	%f20,	[%l7 + %o0]
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x81,	%g7
loop_65:
	nop
	set	0x20, %l5
	stw	%g5,	[%l7 + %l5]
	and	%g2,	%i6,	%i1
	set	0x68, %i3
	stxa	%l1,	[%l7 + %i3] 0x88
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l2
	add	%o5,	%i2,	%i3
	nop
	set	0x68, %o5
	std	%l4,	[%l7 + %o5]
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x6F, %i6
	ldsb	[%l7 + %i6],	%o3
	or	%o6,	%l3,	%l0
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xd8
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x80,	%i4,	%o7
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xeb,	%g2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd8
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x89,	 3
	nop
	set	0x2C, %l3
	sth	%i7,	[%l7 + %l3]
	and	%i0,	%o0,	%o2
	set	0x6C, %l4
	swapa	[%l7 + %l4] 0x89,	%g4
	nop
	set	0x5A, %o6
	ldsb	[%l7 + %o6],	%l4
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%i5
	nop
	nop
	setx	0xFC4AC39C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xFE92E6BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f28,	%f30
	st	%f16,	[%l7 + 0x14]
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x467, 	%tick_cmpr
	nop
	set	0x65, %i5
	stb	%g2,	[%l7 + %i5]
	nop
	set	0x1A, %g5
	lduh	[%l7 + %g5],	%g5
	or	%i6,	%l1,	%g1
	nop
	set	0x08, %g1
	stw	%i1,	[%l7 + %g1]
	nop
	set	0x32, %l0
	ldsb	[%l7 + %l0],	%o5
	nop
	set	0x60, %l6
	ldstub	[%l7 + %l6],	%l2
	fpadd16	%f18,	%f18,	%f2
	set	0x60, %o4
	stxa	%i3,	[%l7 + %o4] 0x89
	set	0x58, %l2
	stha	%i2,	[%l7 + %l2] 0x89
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%l4
	nop
	set	0x68, %g2
	stx	%o6,	[%l7 + %g2]
	ble,a	%xcc,	loop_66
	nop
	set	0x20, %o1
	lduh	[%l7 + %o1],	%o3
	nop
	set	0x48, %o3
	ldsb	[%l7 + %o3],	%l0
	nop
	set	0x1B, %i0
	ldub	[%l7 + %i0],	%o1
loop_66:
	nop
	set	0x5C, %i7
	lduw	[%l7 + %i7],	%l3
	nop
	set	0x48, %o0
	std	%f20,	[%l7 + %o0]
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	nop
	set	0x1B, %l5
	ldstub	[%l7 + %l5],	%i4
	set	0x10, %o2
	ldda	[%l7 + %o2] 0xea,	%g2
	bl,a,pn	%xcc,	loop_67
	add	%g6,	%i7,	%o7
	ba,a,pn	%xcc,	loop_68
	nop
	set	0x10, %o5
	stx	%i0,	[%l7 + %o5]
loop_67:
	nop
	set	0x47, %i2
	stba	%o2,	[%l7 + %i2] 0x81
loop_68:
	fpsub16	%f2,	%f12,	%f0
	fpsub16	%f26,	%f12,	%f2
	nop
	set	0x3C, %i3
	lduh	[%l7 + %i3],	%g4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd8
	nop
	set	0x0E, %i4
	lduh	[%l7 + %i4],	%l4
	set	0x50, %g6
	sta	%f4,	[%l7 + %g6] 0x89
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%i5
	nop
	set	0x08, %l3
	stw	%l6,	[%l7 + %l3]
	set	0x34, %g3
	sta	%f6,	[%l7 + %g3] 0x88
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x89,	%g7
	nop
	set	0x74, %o6
	stw	%g2,	[%l7 + %o6]
	nop
	set	0x64, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x10, %i5
	std	%f22,	[%l7 + %i5]
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x81,	%o0
	ld	[%l7 + 0x48],	%f0
	nop
	set	0x38, %o7
	lduh	[%l7 + %o7],	%i6
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%g1
	set	0x20, %l0
	stda	%g4,	[%l7 + %l0] 0x89
	nop
	set	0x51, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x58, %l2
	ldub	[%l7 + %l2],	%o5
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%l2
	fpsub16	%f18,	%f26,	%f2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l5
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%i2
	set	0x78, %g2
	lda	[%l7 + %g2] 0x88,	%f10
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%o3
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%o0
	or	%l0,	%o4,	%l3
	set	0x5F, %o0
	stba	%i4,	[%l7 + %o0] 0x81
	nop
	set	0x60, %l1
	prefetch	[%l7 + %l1],	 3
	st	%fsr,	[%l7 + 0x2C]
	fpadd16	%f30,	%f30,	%f26
	fpadd16s	%f7,	%f22,	%f18
	nop
	set	0x4B, %l5
	ldsb	[%l7 + %l5],	%g6
	nop
	set	0x78, %i7
	stw	%i7,	[%l7 + %i7]
	nop
	set	0x20, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x24, %o2
	ldstuba	[%l7 + %o2] 0x81,	%o7
	ld	[%l7 + 0x58],	%f12
	set	0x45, %i2
	stba	%i0,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x10, %i6
	stwa	%o2,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x38, %i4
	stxa	%g3,	[%l7 + %i4] 0x89
	nop
	set	0x70, %i3
	stx	%g4,	[%l7 + %i3]
	set	0x1A, %g7
	stha	%i5,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x67, %l3
	ldstub	[%l7 + %l3],	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g2
	add	%g7,	%i6,	%o0
	nop
	set	0x3C, %g3
	swap	[%l7 + %g3],	%g1
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x80,	%l1
	nop
	set	0x28, %l4
	lduw	[%l7 + %l4],	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%l2
	st	%fsr,	[%l7 + 0x48]
	st	%f19,	[%l7 + 0x7C]
	set	0x50, %o6
	stha	%i3,	[%l7 + %o6] 0xeb
	membar	#Sync
	add	%l5,	%i2,	%o6
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x81,	%o5
	nop
	nop
	setx	0x12C9E41BBAC631C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD3957636CFC8D1FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f6,	%f6
	nop
	set	0x64, %g5
	sth	%o3,	[%l7 + %g5]
	nop
	set	0x10, %g4
	stb	%l0,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	set	0x10, %o7
	stda	%o0,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x48, %l0
	stx	%o4,	[%l7 + %l0]
	nop
	set	0x20, %l2
	std	%l2,	[%l7 + %l2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x28, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x5E, %l6
	stha	%o2,	[%l7 + %l6] 0x80
	set	0x6A, %i1
	stha	%g3,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x24, %o1
	lduh	[%l7 + %o1],	%g4
	nop
	set	0x20, %g2
	stx	%i5,	[%l7 + %g2]
	ba,a,pn	%icc,	loop_69
	nop
	set	0x35, %o3
	ldstub	[%l7 + %o3],	%i0
	nop
	set	0x4C, %o0
	stw	%l4,	[%l7 + %o0]
	nop
	set	0x58, %l1
	stw	%l6,	[%l7 + %l1]
loop_69:
	nop
	set	0x6A, %l5
	lduh	[%l7 + %l5],	%g2
	bn,a,pn	%xcc,	loop_70
	bl,a,pn	%icc,	loop_71
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x7E, %o5
	ldstub	[%l7 + %o5],	%i6
loop_70:
	nop
	set	0x28, %i7
	std	%f8,	[%l7 + %i7]
loop_71:
	nop
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x80,	%g7
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%o0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1279
!	Type a   	: 28
!	Type cti   	: 31
!	Type x   	: 502
!	Type f   	: 38
!	Type i   	: 122
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
	set	0xF,	%g2
	set	0x6,	%g3
	set	0xF,	%g4
	set	0x6,	%g5
	set	0x8,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0x5,	%i1
	set	-0x3,	%i2
	set	-0x1,	%i3
	set	-0x5,	%i4
	set	-0x6,	%i5
	set	-0x8,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x52098CE9,	%l0
	set	0x4734772E,	%l1
	set	0x50F4143C,	%l2
	set	0x1507C2F4,	%l3
	set	0x0F24532C,	%l4
	set	0x3C9FAC7F,	%l5
	set	0x3180D24F,	%l6
	!# Output registers
	set	0x1BC1,	%o0
	set	-0x05B8,	%o1
	set	-0x0704,	%o2
	set	-0x0B2A,	%o3
	set	-0x035F,	%o4
	set	0x1E7C,	%o5
	set	-0x08C1,	%o6
	set	-0x0250,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	nop
	set	0x14, %i6
	lduw	[%l7 + %i6],	%l1
	set	0x5C, %i4
	swapa	[%l7 + %i4] 0x89,	%g1
	fpadd16s	%f11,	%f15,	%f2
	nop
	set	0x50, %g7
	swap	[%l7 + %g7],	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%l2
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f30
	ld	[%l7 + 0x1C],	%f29
	nop
	set	0x5E, %g3
	ldsh	[%l7 + %g3],	%i3
	nop
	set	0x66, %g6
	sth	%l5,	[%l7 + %g6]
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f0
	nop
	set	0x3C, %i3
	lduh	[%l7 + %i3],	%i2
	fpsub32	%f12,	%f0,	%f26
	st	%fsr,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x28, %i5
	ldsw	[%l7 + %i5],	%o5
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x81,	%o6
	set	0x30, %g5
	stda	%l0,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc4
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf0
	membar	#Sync
	set	0x2C, %l0
	sta	%f17,	[%l7 + %l0] 0x89
	nop
	set	0x28, %l2
	stx	%o3,	[%l7 + %l2]
	nop
	set	0x34, %o4
	ldsw	[%l7 + %o4],	%o4
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%i4
	nop
	set	0x60, %o7
	lduh	[%l7 + %o7],	%o7
	set	0x78, %o1
	stda	%i6,	[%l7 + %o1] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	and	%o2,	%g3,	%l3
	set	0x30, %g2
	ldxa	[%l7 + %g2] 0x81,	%g4
	nop
	set	0x59, %i1
	ldub	[%l7 + %i1],	%i0
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x80,	%i5
	nop
	set	0x08, %l1
	std	%f10,	[%l7 + %l1]
	set	0x50, %o0
	stxa	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x4A, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g2
	set	0x2A, %o5
	ldstuba	[%l7 + %o5] 0x81,	%l6
	and	%i6,	%o0,	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%g1
	nop
	set	0x2B, %i7
	stb	%g5,	[%l7 + %i7]
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x1F, %i2
	ldsb	[%l7 + %i2],	%i1
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%i3
	nop
	set	0x7A, %i4
	ldsb	[%l7 + %i4],	%l5
	set	0x38, %i6
	stxa	%l2,	[%l7 + %i6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x24]
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x80,	%i2
	set	0x58, %l3
	lda	[%l7 + %l3] 0x89,	%f30
	nop
	set	0x34, %g3
	stb	%o6,	[%l7 + %g3]
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%l0
	add	%o5,	%o4,	%o1
	nop
	set	0x20, %g6
	stx	%o3,	[%l7 + %g6]
	nop
	set	0x24, %i3
	ldsw	[%l7 + %i3],	%i4
	set	0x28, %i5
	sta	%f11,	[%l7 + %i5] 0x89
	fpsub32s	%f14,	%f3,	%f6
	nop
	set	0x58, %g5
	swap	[%l7 + %g5],	%g6
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%i7
	nop
	set	0x48, %g4
	std	%o6,	[%l7 + %g4]
	nop
	set	0x2A, %g1
	stb	%g3,	[%l7 + %g1]
	set	0x14, %l0
	lda	[%l7 + %l0] 0x88,	%f11
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%o2
	and	%l3,	%g4,	%i5
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%l4
	set	0x28, %o7
	stba	%i6,	[%l7 + %o7] 0x80
	st	%f28,	[%l7 + 0x50]
	or	%o0,	%l6,	%g7
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%l0
	or	%g1,	%i1,	%g5
	set	0x10, %l6
	stda	%i2,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x38, %g2
	ldub	[%l7 + %g2],	%l2
	nop
	set	0x50, %i1
	ldsh	[%l7 + %i1],	%l5
	nop
	set	0x4D, %l1
	ldsb	[%l7 + %l1],	%i2
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x88,	%o6
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x81,	%l0
	or	%o5,	%o4,	%o3
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x88,	%o1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xea,	%i4
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f24
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd2
	nop
	set	0x67, %o2
	ldsb	[%l7 + %o2],	%o7
	or	%i7,	%g3,	%l3
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f22
	nop
	set	0x54, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x38, %l3
	stda	%o2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x30, %l4
	lduw	[%l7 + %l4],	%i5
	set	0x10, %g6
	lda	[%l7 + %g6] 0x80,	%f2
	nop
	set	0x20, %i3
	lduw	[%l7 + %i3],	%i0
	wr	%g4,	%l4,	%y
	set	0x10, %g3
	ldxa	[%l7 + %g3] 0x81,	%g2
	nop
	set	0x60, %i5
	stw	%i6,	[%l7 + %i5]
	set	0x1D, %g5
	stba	%l6,	[%l7 + %g5] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%l1
	set	0x54, %o6
	sta	%f19,	[%l7 + %o6] 0x80
	nop
	set	0x40, %g1
	swap	[%l7 + %g1],	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%g5
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f0
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f0
	nop
	set	0x6E, %l2
	sth	%g7,	[%l7 + %l2]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%l2
	set	0x28, %o7
	stxa	%i3,	[%l7 + %o7] 0xe2
	membar	#Sync
	or	%i2,	%l5,	%l0
	add	%o5,	%o4,	%o6
	add	%o1,	%o3,	%g6
	nop
	set	0x30, %o1
	ldsh	[%l7 + %o1],	%o7
	nop
	set	0x1C, %l6
	stw	%i7,	[%l7 + %l6]
	nop
	set	0x78, %g2
	std	%g2,	[%l7 + %g2]
	bg,a,pt	%icc,	loop_72
	nop
	set	0x28, %l1
	std	%f4,	[%l7 + %l1]
	set	0x10, %o3
	swapa	[%l7 + %o3] 0x81,	%i4
loop_72:
	nop
	nop
	setx	0xBD4B5E8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x963A8ADE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f16,	%f21
	set	0x28, %i1
	stda	%o2,	[%l7 + %i1] 0x88
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xeb,	%l2
	nop
	set	0x2F, %i7
	ldstub	[%l7 + %i7],	%i0
	ld	[%l7 + 0x4C],	%f19
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x06E, 	%sys_tick_cmpr
	fpsub32s	%f24,	%f4,	%f26
	nop
	nop
	setx	0x5C359E84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x4343B2E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f5,	%f7
	set	0x1A, %l5
	stha	%l4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x50, %i0
	ldsh	[%l7 + %i0],	%i6
	nop
	set	0x20, %o5
	stx	%l6,	[%l7 + %o5]
	set	0x22, %i2
	stha	%g2,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x20, %o2
	std	%l0,	[%l7 + %o2]
	nop
	set	0x38, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%g0
	nop
	set	0x50, %i4
	lduh	[%l7 + %i4],	%o0
	set	0x28, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i1
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%g5
	set	0x2C, %g3
	stwa	%g7,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x66, %i5
	lduh	[%l7 + %i5],	%i3
	nop
	set	0x64, %l3
	swap	[%l7 + %l3],	%l2
	nop
	set	0x28, %g5
	swap	[%l7 + %g5],	%i2
	fpsub16s	%f12,	%f23,	%f9
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%l0
	fpadd32s	%f9,	%f16,	%f19
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	set	0x78, %o6
	stda	%o4,	[%l7 + %o6] 0x80
	set	0x78, %l2
	stwa	%o4,	[%l7 + %l2] 0x81
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x88,	 0
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%l5
	nop
	set	0x58, %o4
	stx	%o3,	[%l7 + %o4]
	nop
	set	0x28, %l6
	stx	%o1,	[%l7 + %l6]
	set	0x18, %g2
	ldstuba	[%l7 + %g2] 0x89,	%g6
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x81,	%o7
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%g2
	set	0x5B, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i4
	set	0x14, %i1
	swapa	[%l7 + %i1] 0x80,	%o2
	ld	[%l7 + 0x38],	%f8
	nop
	set	0x22, %i7
	ldsh	[%l7 + %i7],	%l3
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%i6
	nop
	set	0x70, %i0
	std	%f18,	[%l7 + %i0]
	nop
	set	0x34, %o5
	ldstub	[%l7 + %o5],	%i0
	set	0x70, %i2
	swapa	[%l7 + %i2] 0x80,	%g4
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f16
	set	0x3F, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i5
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x88,	%i6
	and	%l6,	%g2,	%l1
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f4
	set	0x08, %g7
	stwa	%l4,	[%l7 + %g7] 0x80
	set	0x58, %g6
	stwa	%o0,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x62, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f8
	nop
	set	0x3A, %i5
	ldstub	[%l7 + %i5],	%i1
	set	0x67, %l3
	stba	%g7,	[%l7 + %l3] 0x89
	nop
	set	0x50, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x4A, %g1
	ldsb	[%l7 + %g1],	%g5
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f2
	set	0x6C, %o6
	stwa	%l2,	[%l7 + %o6] 0x81
	nop
	set	0x50, %l2
	stx	%i3,	[%l7 + %l2]
	nop
	set	0x40, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x28, %o7
	stxa	%l0,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x58, %o4
	lda	[%l7 + %o4] 0x81,	%f3
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x18, %g2
	lda	[%l7 + %g2] 0x81,	%f8
	set	0x24, %g4
	stwa	%i2,	[%l7 + %g4] 0x80
	nop
	set	0x2C, %l1
	swap	[%l7 + %l1],	%o5
	st	%f15,	[%l7 + 0x44]
	nop
	set	0x08, %o3
	ldsw	[%l7 + %o3],	%o4
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf8
	membar	#Sync
	nop
	set	0x6C, %i7
	lduw	[%l7 + %i7],	%l5
	ld	[%l7 + 0x78],	%f30
	add	%o6,	%o1,	%g6
	ble,a,pn	%xcc,	loop_73
	nop
	set	0x10, %o1
	stx	%o3,	[%l7 + %o1]
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%g2
	nop
	set	0x40, %o0
	stx	%o7,	[%l7 + %o0]
loop_73:
	nop
	set	0x4E, %i2
	stb	%o2,	[%l7 + %i2]
	nop
	set	0x18, %l5
	lduh	[%l7 + %l5],	%l3
	set	0x28, %i6
	ldxa	[%l7 + %i6] 0x81,	%i7
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%i4
	ld	[%l7 + 0x60],	%f15
	nop
	set	0x28, %o5
	stx	%i0,	[%l7 + %o5]
	nop
	set	0x2E, %i4
	sth	%g4,	[%l7 + %i4]
	nop
	set	0x54, %g7
	ldsw	[%l7 + %g7],	%i6
	nop
	set	0x64, %i3
	ldstub	[%l7 + %i3],	%l6
	set	0x2F, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i5
	set	0x48, %i5
	sta	%f5,	[%l7 + %i5] 0x89
	nop
	set	0x40, %l3
	std	%f8,	[%l7 + %l3]
	or	%l1,	%l4,	%o0
	set	0x10, %g5
	stwa	%g2,	[%l7 + %g5] 0x89
	set	0x78, %g1
	stxa	%g1,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x73, %g6
	stb	%g7,	[%l7 + %g6]
	add	%g5,	%l2,	%i1
	set	0x16, %o6
	stha	%l0,	[%l7 + %o6] 0x88
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%i3
	nop
	set	0x1F, %g3
	stb	%o5,	[%l7 + %g3]
	nop
	set	0x78, %l0
	std	%i2,	[%l7 + %l0]
	add	%l5,	%o4,	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%o6
	set	0x18, %o4
	stda	%g2,	[%l7 + %o4] 0x89
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x88,	%o7
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x80,	 3
	nop
	set	0x10, %o7
	swap	[%l7 + %o7],	%l3
	nop
	set	0x5C, %l1
	ldsw	[%l7 + %l1],	%o3
	nop
	set	0x33, %g4
	stb	%i7,	[%l7 + %g4]
	nop
	set	0x65, %o3
	ldstub	[%l7 + %o3],	%i0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i5
	nop
	set	0x51, %i7
	ldub	[%l7 + %i7],	%l1
	nop
	set	0x68, %i1
	sth	%l6,	[%l7 + %i1]
	nop
	set	0x68, %i0
	swap	[%l7 + %i0],	%o0
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xea,	%g2
	nop
	set	0x50, %i2
	std	%g0,	[%l7 + %i2]
	or	%l4,	%g5,	%l2
	set	0x7C, %o0
	sta	%f12,	[%l7 + %o0] 0x88
	set	0x72, %l5
	stba	%i1,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x1C, %o2
	swap	[%l7 + %o2],	%g7
	nop
	set	0x0A, %i6
	ldub	[%l7 + %i6],	%i3
	set	0x28, %o5
	lda	[%l7 + %o5] 0x81,	%f8
	set	0x10, %g7
	stwa	%o5,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	nop
	set	0x28, %l4
	std	%l4,	[%l7 + %l4]
	st	%f30,	[%l7 + 0x10]
	set	0x0D, %i5
	stba	%i2,	[%l7 + %i5] 0x81
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%o1
	set	0x54, %g5
	lda	[%l7 + %g5] 0x88,	%f31
	nop
	set	0x36, %i3
	ldstub	[%l7 + %i3],	%g6
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%g3
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x80,	%o7
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x80,	%o6
	nop
	set	0x41, %g3
	stb	%l3,	[%l7 + %g3]
	nop
	set	0x38, %l0
	lduw	[%l7 + %l0],	%o3
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x81,	%i7
	wr	%i0,	%o2,	%ccr
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x81
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f12
	set	0x41, %o7
	stba	%i6,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x2E, %l1
	lduh	[%l7 + %l1],	%i4
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	fpadd32	%f16,	%f10,	%f10
	nop
	set	0x08, %o3
	std	%g4,	[%l7 + %o3]
	nop
	set	0x68, %g4
	ldsw	[%l7 + %g4],	%l1
	nop
	set	0x48, %i1
	stx	%i5,	[%l7 + %i1]
	nop
	set	0x48, %i0
	stx	%l6,	[%l7 + %i0]
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f0
	nop
	set	0x6C, %o0
	stw	%o0,	[%l7 + %o0]
	set	0x70, %i2
	stwa	%g2,	[%l7 + %i2] 0x88
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe3,	%l4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f16
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x81,	%g0
	nop
	set	0x60, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd0,	%f0
	set	0x24, %i4
	swapa	[%l7 + %i4] 0x80,	%l2
	nop
	set	0x2E, %l4
	ldsb	[%l7 + %l4],	%g5
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x80,	%i1
	nop
	set	0x54, %l3
	ldsw	[%l7 + %l3],	%i3
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%g7
	set	0x53, %i3
	stba	%o5,	[%l7 + %i3] 0xea
	membar	#Sync
	or	%l5,	%i2,	%l0
	set	0x7C, %g6
	stwa	%o1,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x50, %l2
	stwa	%g6,	[%l7 + %l2] 0x80
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%o4
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%o7
	ld	[%l7 + 0x10],	%f25
	nop
	set	0x18, %l0
	std	%f28,	[%l7 + %l0]
	set	0x28, %o6
	stda	%g2,	[%l7 + %o6] 0x81
	nop
	set	0x24, %g2
	swap	[%l7 + %g2],	%l3
	set	0x58, %o7
	stxa	%o3,	[%l7 + %o7] 0x89
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%i6
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%i0
	st	%f0,	[%l7 + 0x34]
	and	%o2,	%o6,	%i6
	nop
	set	0x66, %o3
	lduh	[%l7 + %o3],	%g4
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%i4
	nop
	set	0x58, %i1
	std	%i4,	[%l7 + %i1]
	nop
	set	0x14, %i0
	ldsw	[%l7 + %i0],	%l6
	or	%l1,	%o0,	%g2
	nop
	set	0x08, %o1
	ldsw	[%l7 + %o1],	%g1
	set	0x54, %i7
	stha	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x0C, %o0
	lduh	[%l7 + %o0],	%g5
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f16
	set	0x44, %o2
	lda	[%l7 + %o2] 0x81,	%f21
	set	0x4C, %i6
	lda	[%l7 + %i6] 0x88,	%f16
	fpadd16s	%f29,	%f8,	%f12
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%i1
	set	0x38, %g7
	stda	%i2,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x5C, %i2
	stw	%g7,	[%l7 + %i2]
	nop
	set	0x50, %l4
	ldsh	[%l7 + %l4],	%o5
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc8
	set	0x22, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l2
	nop
	set	0x4C, %l3
	stw	%i2,	[%l7 + %l3]
	nop
	set	0x30, %g5
	ldsw	[%l7 + %g5],	%l0
	or	%l5,	%g6,	%o1
	nop
	set	0x48, %g6
	std	%o4,	[%l7 + %g6]
	set	0x28, %l2
	stda	%o6,	[%l7 + %l2] 0x81
	nop
	set	0x54, %i3
	stw	%g3,	[%l7 + %i3]
	nop
	set	0x08, %g1
	std	%f12,	[%l7 + %g1]
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%o3,	%l3,	%i0
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%o2
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f0
	or	%i7,	%i6,	%o6
	nop
	set	0x68, %o7
	prefetch	[%l7 + %o7],	 1
	add	%g4,	%i4,	%l6
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%i5
	nop
	set	0x76, %o6
	lduh	[%l7 + %o6],	%l1
	nop
	set	0x74, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x50, %l6
	stw	%o0,	[%l7 + %l6]
	nop
	set	0x10, %o3
	lduw	[%l7 + %o3],	%g2
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%g1
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%g5
	and	%i1,	%l4,	%g7
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xea,	%i2
	nop
	set	0x46, %i7
	lduh	[%l7 + %i7],	%l2
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f10
	nop
	set	0x40, %g4
	stx	%i2,	[%l7 + %g4]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f16
	set	0x40, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o5
	set	0x79, %o5
	ldstuba	[%l7 + %o5] 0x88,	%l5
	nop
	set	0x28, %i6
	lduh	[%l7 + %i6],	%l0
	nop
	set	0x46, %i2
	stb	%o1,	[%l7 + %i2]
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%g6
	nop
	set	0x5C, %i4
	prefetch	[%l7 + %i4],	 1
	and	%o4,	%o7,	%g3
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xe2,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%o2
	set	0x30, %l4
	stda	%i6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x3E, %g6
	lduh	[%l7 + %g6],	%i0
	set	0x1A, %g5
	stba	%o6,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i4
	set	0x20, %i3
	sta	%f12,	[%l7 + %i3] 0x88
	nop
	set	0x30, %l2
	std	%f28,	[%l7 + %l2]
	add	%l6,	%i6,	%i5
	set	0x28, %l0
	stxa	%o0,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x54, %g1
	ldub	[%l7 + %g1],	%l1
	st	%f1,	[%l7 + 0x7C]
	nop
	set	0x3C, %g2
	prefetch	[%l7 + %g2],	 3
	nop
	set	0x48, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f28
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%g1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%g4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f16
	st	%f2,	[%l7 + 0x58]
	set	0x22, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i3
	set	0x58, %o3
	stda	%l4,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x58, %i1
	std	%l2,	[%l7 + %i1]
	nop
	set	0x14, %i0
	stw	%o5,	[%l7 + %i0]
	set	0x5A, %l6
	stha	%i2,	[%l7 + %l6] 0x80
	nop
	set	0x28, %o1
	stx	%l5,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x6C]
	set	0x3B, %i7
	stba	%l0,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xe2,	%g6
	nop
	set	0x14, %o0
	swap	[%l7 + %o0],	%o4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f16
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%o1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	set	0x74, %g7
	stwa	%g3,	[%l7 + %g7] 0x80
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f0
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%o3
	and	%o7,	%o2,	%i7
	fpadd32s	%f13,	%f22,	%f28
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x62, %l4
	ldsh	[%l7 + %l4],	%l3
	set	0x42, %i5
	stba	%i0,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x35, %g6
	stb	%g4,	[%l7 + %g6]
	set	0x60, %g5
	sta	%f21,	[%l7 + %g5] 0x80
	nop
	set	0x78, %i3
	ldstub	[%l7 + %i3],	%i4
	set	0x58, %l2
	swapa	[%l7 + %l2] 0x80,	%o6
	nop
	set	0x2A, %l0
	sth	%i6,	[%l7 + %l0]
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i5
	add	%o0,	%g2,	%g1
	fpsub16s	%f30,	%f30,	%f20
	ld	[%l7 + 0x7C],	%f15
	nop
	set	0x64, %g1
	stw	%g5,	[%l7 + %g1]
	set	0x28, %g2
	stda	%i0,	[%l7 + %g2] 0x81
	fpsub32s	%f31,	%f10,	%f28
	nop
	set	0x60, %g3
	std	%g6,	[%l7 + %g3]
	or	%l1,	%i3,	%l4
	nop
	set	0x50, %o4
	stw	%l2,	[%l7 + %o4]
	set	0x44, %o7
	lda	[%l7 + %o7] 0x88,	%f17
	set	0x0C, %l1
	sta	%f2,	[%l7 + %l1] 0x80
	set	0x78, %o6
	sta	%f21,	[%l7 + %o6] 0x80
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x89,	%i2
	st	%fsr,	[%l7 + 0x0C]
	st	%f7,	[%l7 + 0x24]
	nop
	set	0x44, %i0
	stw	%l5,	[%l7 + %i0]
	set	0x3F, %l6
	stba	%l0,	[%l7 + %l6] 0xea
	membar	#Sync
	and	%g6,	%o4,	%o5
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x81,	%g3
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f20
	nop
	set	0x68, %i7
	stx	%o3,	[%l7 + %i7]
	nop
	set	0x68, %g4
	std	%o0,	[%l7 + %g4]
	st	%f7,	[%l7 + 0x44]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i7
	fpsub32s	%f31,	%f29,	%f0
	set	0x2C, %l5
	swapa	[%l7 + %l5] 0x89,	%l3
	set	0x28, %o0
	stwa	%o2,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x12, %i6
	ldub	[%l7 + %i6],	%g4
	set	0x38, %o5
	stxa	%i4,	[%l7 + %o5] 0x89
	nop
	set	0x50, %o2
	std	%i0,	[%l7 + %o2]
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x88,	%i6
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%o6
	nop
	set	0x45, %i4
	stb	%i5,	[%l7 + %i4]
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x89,	%i6
	nop
	set	0x3C, %g6
	lduw	[%l7 + %g6],	%g2
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x81,	%o0
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%g0
	set	0x30, %l2
	stxa	%i1,	[%l7 + %l2] 0x89
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%g5
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%i3
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x18, %g1
	lduw	[%l7 + %g1],	%l1
	nop
	set	0x58, %g2
	prefetch	[%l7 + %g2],	 1
	set	0x78, %g3
	sta	%f9,	[%l7 + %g3] 0x81
	wr	%l4,	%i2,	%clear_softint
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x80,	%l4
	fpsub16s	%f12,	%f1,	%f27
	set	0x4F, %o7
	stba	%l0,	[%l7 + %o7] 0x81
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%g6
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x81,	 1
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd0,	%f0
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x89,	%g2
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f24
	ld	[%l7 + 0x78],	%f27
	nop
	set	0x5A, %i0
	ldsb	[%l7 + %i0],	%o4
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f16
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%o0
	nop
	set	0x30, %i1
	ldsh	[%l7 + %i1],	%o7
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%o3
	set	0x1A, %g4
	stha	%i7,	[%l7 + %g4] 0x80
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x88,	%o2
	and	%g4,	%i4,	%l3
	set	0x1B, %o5
	stba	%i0,	[%l7 + %o5] 0xea
	membar	#Sync
	or	%o6,	%i5,	%i6
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x64, %l5
	stwa	%l6,	[%l7 + %l5] 0x88
	nop
	set	0x7C, %g7
	swap	[%l7 + %g7],	%o0
	nop
	set	0x48, %i4
	ldsw	[%l7 + %i4],	%g2
	nop
	set	0x6C, %l4
	lduw	[%l7 + %l4],	%g1
	nop
	set	0x58, %g6
	std	%i0,	[%l7 + %g6]
	nop
	set	0x7A, %i2
	ldsb	[%l7 + %i2],	%g5
	nop
	set	0x08, %i5
	std	%g6,	[%l7 + %i5]
	set	0x3C, %l2
	stwa	%i3,	[%l7 + %l2] 0x89
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf1
	membar	#Sync
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x08, %g1
	std	%f14,	[%l7 + %g1]
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f16
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x5C, %i3
	lduw	[%l7 + %i3],	%l1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%l5
	nop
	set	0x68, %g3
	std	%f24,	[%l7 + %g3]
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%l0
	set	0x44, %o4
	swapa	[%l7 + %o4] 0x88,	%i2
	nop
	set	0x20, %o3
	stw	%g6,	[%l7 + %o3]
	nop
	set	0x0A, %o6
	lduh	[%l7 + %o6],	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%o5
	set	0x60, %l1
	sta	%f31,	[%l7 + %l1] 0x81
	nop
	set	0x40, %l6
	ldsh	[%l7 + %l6],	%o4
	nop
	set	0x10, %i0
	ldsw	[%l7 + %i0],	%o7
	nop
	set	0x31, %o1
	ldstub	[%l7 + %o1],	%o1
	nop
	set	0x60, %i7
	std	%i6,	[%l7 + %i7]
	nop
	set	0x50, %i1
	lduw	[%l7 + %i1],	%o3
	ld	[%l7 + 0x24],	%f6
	set	0x46, %g4
	stha	%g4,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x72, %o0
	stba	%i4,	[%l7 + %o0] 0x80
	st	%fsr,	[%l7 + 0x48]
	set	0x1C, %o5
	stwa	%o2,	[%l7 + %o5] 0x89
	fpsub16s	%f1,	%f13,	%f10
	nop
	set	0x20, %i6
	lduw	[%l7 + %i6],	%l3
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%i0,	%i5,	%i6
	or	%o6,	%o0,	%l6
	and	%g1,	%g2,	%g5
	st	%f2,	[%l7 + 0x68]
	nop
	set	0x30, %g7
	stx	%g7,	[%l7 + %g7]
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x80,	 4
	nop
	set	0x11, %l4
	ldub	[%l7 + %l4],	%l1
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe2,	%l4
	nop
	set	0x60, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%i3
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf0
	membar	#Sync
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf9,	%f16
	ld	[%l7 + 0x2C],	%f5
	add	%l0,	%l5,	%i2
	nop
	set	0x66, %g5
	stb	%g6,	[%l7 + %g5]
	nop
	set	0x5A, %l0
	ldsb	[%l7 + %l0],	%g3
	nop
	set	0x34, %g2
	ldub	[%l7 + %g2],	%o5
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
	nop
	set	0x0B, %i3
	ldsb	[%l7 + %i3],	%o7
	nop
	set	0x74, %l3
	swap	[%l7 + %l3],	%o1
	ld	[%l7 + 0x40],	%f23
	nop
	set	0x5D, %g3
	ldsb	[%l7 + %g3],	%l2
	nop
	set	0x34, %o7
	swap	[%l7 + %o7],	%o3
	nop
	set	0x68, %o3
	std	%i6,	[%l7 + %o3]
	wr	%g4,	%i4,	%y
	nop
	set	0x58, %o4
	std	%f20,	[%l7 + %o4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i0
	add	%i5,	%i6,	%o2
	nop
	set	0x2B, %l1
	stb	%o6,	[%l7 + %l1]
	set	0x40, %l6
	stwa	%l6,	[%l7 + %l6] 0x80
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%g1
	nop
	set	0x32, %i7
	lduh	[%l7 + %i7],	%g5
	fpadd32s	%f17,	%f23,	%f25
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xea,	%g6
	nop
	set	0x61, %g4
	ldstub	[%l7 + %g4],	%i1
	nop
	set	0x46, %o0
	ldub	[%l7 + %o0],	%g2
	nop
	set	0x3C, %o5
	stw	%l4,	[%l7 + %o5]
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%i3
	set	0x60, %i1
	lda	[%l7 + %i1] 0x81,	%f28
	set	0x7C, %l5
	sta	%f24,	[%l7 + %l5] 0x80
	nop
	set	0x7C, %g7
	ldsh	[%l7 + %g7],	%l0
	fpadd16	%f8,	%f26,	%f12
	and	%l5,	%i2,	%g6
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%l1
	nop
	set	0x58, %i4
	stx	%o5,	[%l7 + %i4]
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f28
	nop
	set	0x68, %i2
	std	%g2,	[%l7 + %i2]
	set	0x37, %i5
	stba	%o4,	[%l7 + %i5] 0x89
	st	%f23,	[%l7 + 0x60]
	set	0x4F, %l2
	stba	%o1,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x7C, %g5
	swapa	[%l7 + %g5] 0x89,	%o7
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f4
	fpsub32s	%f31,	%f0,	%f26
	st	%fsr,	[%l7 + 0x2C]
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xea,	%o2
	set	0x20, %g1
	stda	%l2,	[%l7 + %g1] 0x80
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f0
	and	%i7,	%i4,	%g4
	nop
	set	0x50, %g2
	swap	[%l7 + %g2],	%i0
	nop
	set	0x70, %l3
	swap	[%l7 + %l3],	%i5
	add	%l3,	%o2,	%i6
	nop
	set	0x60, %o7
	stw	%o6,	[%l7 + %o7]
	wr	%l6,	%g1,	%pic
	nop
	set	0x48, %o3
	std	%g4,	[%l7 + %o3]
	fpadd32s	%f1,	%f4,	%f22
	or	%g7,	%o0,	%g2
	nop
	set	0x4C, %g3
	sth	%l4,	[%l7 + %g3]
	set	0x20, %l1
	stha	%i3,	[%l7 + %l1] 0x81
	ld	[%l7 + 0x58],	%f12
	st	%f4,	[%l7 + 0x58]
	nop
	set	0x28, %l6
	std	%f26,	[%l7 + %l6]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xeb,	%l0
	nop
	set	0x7D, %o1
	stb	%i1,	[%l7 + %o1]
	set	0x30, %o4
	stda	%l4,	[%l7 + %o4] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%l1
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x50, %g4
	stha	%o5,	[%l7 + %g4] 0x89
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xe2,	%i2
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x48, %o0
	ldsh	[%l7 + %o0],	%o4
	set	0x38, %i6
	stda	%o0,	[%l7 + %i6] 0x88
	set	0x2E, %o5
	stha	%o7,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x3D, %i1
	stba	%g3,	[%l7 + %i1] 0x89
	ld	[%l7 + 0x3C],	%f2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o3
	nop
	set	0x60, %l5
	std	%i4,	[%l7 + %l5]
	set	0x24, %l4
	sta	%f17,	[%l7 + %l4] 0x80
	ld	[%l7 + 0x74],	%f21
	set	0x10, %g7
	stda	%g4,	[%l7 + %g7] 0x89
	fpadd16	%f14,	%f22,	%f16
	nop
	set	0x08, %o2
	lduh	[%l7 + %o2],	%i0
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f16
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%i7
	nop
	set	0x3B, %i2
	ldub	[%l7 + %i2],	%l3
	nop
	set	0x1D, %l2
	ldstub	[%l7 + %l2],	%i5
	set	0x68, %g5
	stxa	%o2,	[%l7 + %g5] 0x81
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0
	and	%l6,	%g1,	%o6
	or	%g7,	%g5,	%o0
	set	0x64, %g6
	stwa	%g2,	[%l7 + %g6] 0x81
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x88,	%l4
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xeb,	%l0
	nop
	set	0x14, %l3
	swap	[%l7 + %l3],	%i3
	nop
	set	0x58, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x60, %o7
	swap	[%l7 + %o7],	%l5
	be	%icc,	loop_74
	nop
	set	0x50, %o3
	lduh	[%l7 + %o3],	%g6
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%i1
	nop
	set	0x6B, %g3
	ldsb	[%l7 + %g3],	%l1
loop_74:
	and	%o5,	%i2,	%o4
	set	0x66, %l6
	stba	%o7,	[%l7 + %l6] 0x89
	set	0x6C, %o6
	sta	%f18,	[%l7 + %o6] 0x89
	and	%o1,	%l2,	%o3
	nop
	set	0x67, %o1
	ldub	[%l7 + %o1],	%g3
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x89,	%g4
	nop
	set	0x36, %i0
	lduh	[%l7 + %i0],	%i0
	nop
	set	0x4C, %i7
	stw	%i7,	[%l7 + %i7]
	set	0x51, %g4
	stba	%i4,	[%l7 + %g4] 0x89
	nop
	set	0x40, %o0
	std	%i4,	[%l7 + %o0]
	wr	%l3,	%i6,	%ccr
	nop
	set	0x46, %i6
	sth	%l6,	[%l7 + %i6]
	set	0x2A, %o5
	stba	%o2,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x46, %i1
	lduh	[%l7 + %i1],	%g1
	set	0x20, %l5
	stba	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xe2,	%o6
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	ld	[%l7 + 0x44],	%f24
	set	0x72, %i4
	stba	%o0,	[%l7 + %i4] 0xe2
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g5
	nop
	set	0x28, %l4
	std	%f28,	[%l7 + %l4]
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f4
	set	0x28, %i2
	stha	%l0,	[%l7 + %i2] 0x89
	set	0x1C, %g5
	sta	%f10,	[%l7 + %g5] 0x81
	ld	[%l7 + 0x48],	%f6
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x70, %g6
	sta	%f31,	[%l7 + %g6] 0x89
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x51, %l0
	ldub	[%l7 + %l0],	%l4
	nop
	set	0x2D, %i3
	ldub	[%l7 + %i3],	%l5
	and	%g6,	%i3,	%i1
	nop
	set	0x7A, %g2
	ldstub	[%l7 + %g2],	%l1
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x80,	%o5
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%o4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xda,	%f0
	set	0x34, %l1
	lda	[%l7 + %l1] 0x81,	%f24
	nop
	set	0x44, %o7
	sth	%o7,	[%l7 + %o7]
	nop
	set	0x2F, %g3
	ldsb	[%l7 + %g3],	%o1
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xd8
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%l2
	nop
	set	0x0C, %l6
	ldsw	[%l7 + %l6],	%g3
	bne,a,pn	%xcc,	loop_75
	nop
	set	0x30, %o1
	stx	%g4,	[%l7 + %o1]
	fpadd16	%f2,	%f10,	%f0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i7
loop_75:
	nop
	set	0x5E, %i0
	stha	%i4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x70, %o4
	std	%f4,	[%l7 + %o4]
	nop
	set	0x10, %g4
	std	%f10,	[%l7 + %g4]
	add	%i5,	%o3,	%i6
	nop
	set	0x70, %o0
	std	%f28,	[%l7 + %o0]
	nop
	set	0x60, %i7
	prefetch	[%l7 + %i7],	 4
	and	%l6,	%l3,	%g1
	ld	[%l7 + 0x1C],	%f11
	nop
	set	0x22, %o5
	ldsh	[%l7 + %o5],	%g7
	nop
	set	0x31, %i6
	stb	%o2,	[%l7 + %i6]
	and	%o6,	%o0,	%g5
	nop
	set	0x27, %i1
	ldsb	[%l7 + %i1],	%l0
	fpadd32s	%f21,	%f14,	%f17
	wr	%l4,	%l5,	%pic
	or	%g6,	%i3,	%i1
	fpadd16s	%f14,	%f27,	%f30
	set	0x1C, %g7
	lda	[%l7 + %g7] 0x88,	%f8
	bgu	%xcc,	loop_76
	ld	[%l7 + 0x18],	%f8
	set	0x0C, %l5
	swapa	[%l7 + %l5] 0x89,	%g2
loop_76:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o5
	nop
	set	0x6C, %i4
	ldub	[%l7 + %i4],	%o7
	nop
	set	0x2C, %l4
	stw	%o4,	[%l7 + %l4]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%l2
	nop
	set	0x40, %o2
	std	%f8,	[%l7 + %o2]
	set	0x08, %i5
	stba	%g3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x7B, %i2
	stb	%g4,	[%l7 + %i2]
	set	0x3C, %g5
	stwa	%i0,	[%l7 + %g5] 0x89
	fpsub16s	%f26,	%f27,	%f31
	nop
	set	0x18, %g6
	ldsw	[%l7 + %g6],	%o1
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	nop
	set	0x40, %i3
	stx	%i7,	[%l7 + %i3]
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%i5
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%i6
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f26
	nop
	set	0x50, %l2
	prefetch	[%l7 + %l2],	 4
	st	%f6,	[%l7 + 0x50]
	ld	[%l7 + 0x58],	%f27
	set	0x7C, %o3
	sta	%f2,	[%l7 + %o3] 0x80
	set	0x60, %o7
	stda	%o2,	[%l7 + %o7] 0x81
	nop
	set	0x40, %l1
	lduw	[%l7 + %l1],	%l6
	ba,pn	%icc,	loop_77
	nop
	set	0x10, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x81,	%l3
loop_77:
	nop
	set	0x48, %o1
	stw	%g7,	[%l7 + %o1]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%o6
	nop
	set	0x4A, %i0
	ldub	[%l7 + %i0],	%o0
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g1
	nop
	set	0x41, %g4
	stb	%l4,	[%l7 + %g4]
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x81,	%l4
	set	0x68, %o5
	stwa	%l0,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x3A, %i6
	sth	%g6,	[%l7 + %i6]
	add	%i1,	%g2,	%l1
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x28, %i1
	stda	%i2,	[%l7 + %i1] 0xe2
	membar	#Sync
	and	%o7,	%o5,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l2
	nop
	set	0x22, %g7
	ldsb	[%l7 + %g7],	%g3
	set	0x36, %i4
	stha	%i0,	[%l7 + %i4] 0x80
	fpsub32s	%f27,	%f25,	%f0
	add	%o1,	%i4,	%i7
	set	0x30, %l5
	ldda	[%l7 + %l5] 0xeb,	%i4
	nop
	set	0x18, %l4
	std	%f16,	[%l7 + %l4]
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x80,	%g4
	nop
	set	0x50, %i2
	stx	%o3,	[%l7 + %i2]
	ba,a	%icc,	loop_78
	nop
	set	0x4B, %i5
	stb	%l6,	[%l7 + %i5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%g7
loop_78:
	nop
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xeb,	%i6
	set	0x38, %g6
	stwa	%o6,	[%l7 + %g6] 0x89
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%o2
	nop
	set	0x6D, %g2
	ldub	[%l7 + %g2],	%o0
	nop
	set	0x44, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x50, %i3
	ldda	[%l7 + %i3] 0x89,	%g4
	set	0x40, %l2
	stxa	%l4,	[%l7 + %l2] 0x89
	set	0x40, %l3
	sta	%f18,	[%l7 + %l3] 0x80
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%g1
	nop
	set	0x0E, %o3
	ldsh	[%l7 + %o3],	%l5
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x81,	 0
	set	0x5C, %l1
	sta	%f7,	[%l7 + %l1] 0x80
	ld	[%l7 + 0x48],	%f14
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x81,	%i0
	nop
	set	0x44, %i0
	swap	[%l7 + %i0],	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i3
	nop
	set	0x68, %g3
	ldsh	[%l7 + %g3],	%o7
	set	0x60, %o4
	stwa	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	add	%o4,	%i2,	%o5
	nop
	set	0x2D, %g4
	ldstub	[%l7 + %g4],	%g3
	nop
	set	0x18, %l6
	swap	[%l7 + %l6],	%l2
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x89,	 0
	nop
	set	0x78, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x08, %i6
	std	%i4,	[%l7 + %i6]
	nop
	set	0x2C, %i1
	swap	[%l7 + %i1],	%i7
	set	0x74, %i7
	swapa	[%l7 + %i7] 0x81,	%i5
	nop
	set	0x70, %i4
	stx	%i0,	[%l7 + %i4]
	set	0x58, %g7
	sta	%f15,	[%l7 + %g7] 0x89
	add	%o3,	%l6,	%g4
	set	0x42, %l5
	stha	%g7,	[%l7 + %l5] 0x89
	wr	%l3,	%i6,	%clear_softint
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%o6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xeb,	%o2
	nop
	set	0x23, %i2
	stb	%g5,	[%l7 + %i2]
	set	0x68, %i5
	lda	[%l7 + %i5] 0x81,	%f11
	set	0x60, %g5
	stxa	%l4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x89,	%o0
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	nop
	set	0x77, %g2
	stb	%g1,	[%l7 + %g2]
	add	%l5,	%i1,	%g2
	set	0x38, %i3
	lda	[%l7 + %i3] 0x81,	%f13
	nop
	set	0x60, %l2
	stb	%l1,	[%l7 + %l2]
	add	%i3,	%o7,	%g6
	nop
	set	0x20, %o7
	stx	%l0,	[%l7 + %o7]
	nop
	set	0x20, %l3
	ldsw	[%l7 + %l3],	%i2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%o5
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x664, 	%sys_tick_cmpr
	nop
	set	0x13, %o3
	ldstub	[%l7 + %o3],	%l2
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x20, %i0
	ldub	[%l7 + %i0],	%i5
	nop
	set	0x52, %g3
	ldstub	[%l7 + %g3],	%i7
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%o2
	nop
	nop
	setx	0x95867450776105A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6D7D276703FBF2AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f2
	nop
	set	0x1E, %g4
	lduh	[%l7 + %g4],	%l6
	nop
	set	0x40, %l6
	sth	%g4,	[%l7 + %l6]
	set	0x28, %o5
	sta	%f22,	[%l7 + %o5] 0x80
	set	0x58, %o0
	stda	%i0,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x68, %o4
	stw	%l3,	[%l7 + %o4]
	set	0x30, %i1
	stwa	%i6,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x80,	 2
	and	%o2,	%g7,	%l4
	fpadd32	%f12,	%f0,	%f6
	add	%o0,	%g1,	%g5
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x80,	%g2
	nop
	set	0x52, %i7
	sth	%i1,	[%l7 + %i7]
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x89,	 2
	set	0x52, %o2
	stha	%o7,	[%l7 + %o2] 0x88
	nop
	set	0x18, %i2
	prefetch	[%l7 + %i2],	 2
	ld	[%l7 + 0x1C],	%f6
	nop
	set	0x18, %l5
	stx	%g6,	[%l7 + %l5]
	or	%l0,	%i3,	%o4
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x80,	 4
	nop
	set	0x68, %g5
	std	%o4,	[%l7 + %g5]
	nop
	set	0x60, %l0
	std	%o0,	[%l7 + %l0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%l2
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%i5
	nop
	set	0x74, %g1
	lduh	[%l7 + %g1],	%i4
	set	0x70, %i3
	stda	%o2,	[%l7 + %i3] 0x89
	nop
	set	0x48, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x12, %l2
	stb	%g4,	[%l7 + %l2]
	ld	[%l7 + 0x08],	%f27
	set	0x3C, %l3
	sta	%f28,	[%l7 + %l3] 0x89
	set	0x34, %o6
	stwa	%i7,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x4E, %o3
	sth	%i0,	[%l7 + %o3]
	nop
	set	0x3A, %o1
	lduh	[%l7 + %o1],	%i6
	nop
	set	0x34, %i0
	lduh	[%l7 + %i0],	%l3
	set	0x24, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o2
	nop
	set	0x3C, %o7
	lduh	[%l7 + %o7],	%o6
	and	%g7,	%o0,	%g1
	set	0x4F, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g5
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x88,	%l4
	add	%g2,	%i1,	%l4
	st	%fsr,	[%l7 + 0x18]
	set	0x28, %g4
	stwa	%l1,	[%l7 + %g4] 0x81
	nop
	set	0x08, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x6F, %o5
	ldub	[%l7 + %o5],	%o7
	nop
	set	0x5C, %i1
	ldub	[%l7 + %i1],	%l0
	nop
	set	0x24, %i6
	ldsw	[%l7 + %i6],	%g6
	ld	[%l7 + 0x40],	%f9
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%i3
	nop
	set	0x40, %i4
	stx	%o4,	[%l7 + %i4]
	nop
	set	0x5A, %g7
	ldsh	[%l7 + %g7],	%i2
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f10
	nop
	set	0x74, %i7
	swap	[%l7 + %i7],	%o1
	or	%o5,	%l2,	%i5
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%i4
	nop
	set	0x52, %l5
	ldsb	[%l7 + %l5],	%o3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%g4
	or	%i7,	%i0,	%l6
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	set	0x0E, %i2
	stha	%o2,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x4C, %g5
	stwa	%o6,	[%l7 + %g5] 0x81
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%g6
	nop
	set	0x2A, %g1
	lduh	[%l7 + %g1],	%o0
	nop
	set	0x50, %g6
	stx	%g1,	[%l7 + %g6]
	nop
	set	0x24, %i3
	stw	%g5,	[%l7 + %i3]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	add	%l3,	%g2,	%i1
	set	0x1C, %g2
	sta	%f31,	[%l7 + %g2] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l4
	set	0x18, %l3
	sta	%f3,	[%l7 + %l3] 0x81
	nop
	set	0x42, %o3
	ldsh	[%l7 + %o3],	%l1
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x88,	%o6
	nop
	set	0x1C, %i0
	lduw	[%l7 + %i0],	%l0
	nop
	set	0x48, %o1
	prefetch	[%l7 + %o1],	 4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o4
	nop
	set	0x25, %o7
	ldub	[%l7 + %o7],	%i2
	fpadd16	%f22,	%f30,	%f22
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%i3
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%o4
	set	0x51, %g4
	stba	%o1,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x89,	%l2
	st	%fsr,	[%l7 + 0x48]
	set	0x7C, %o0
	ldstuba	[%l7 + %o0] 0x81,	%i5
	or	%i4,	%g3,	%g4
	set	0x7B, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%l6
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x08, %o5
	stx	%i6,	[%l7 + %o5]
	ld	[%l7 + 0x7C],	%f9
	set	0x0C, %o4
	swapa	[%l7 + %o4] 0x88,	%i7
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x80,	%o2
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x88,	%o6
	ble	%xcc,	loop_79
	and	%g7,	%o0,	%g5
	st	%fsr,	[%l7 + 0x54]
	set	0x18, %g7
	stxa	%g1,	[%l7 + %g7] 0x80
loop_79:
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%g2
	nop
	set	0x0D, %i7
	ldstub	[%l7 + %i7],	%i1
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x81,	 4
	nop
	set	0x18, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x16, %o2
	stb	%l5,	[%l7 + %o2]
	set	0x70, %i2
	sta	%f9,	[%l7 + %i2] 0x80
	set	0x74, %i5
	sta	%f4,	[%l7 + %i5] 0x88
	nop
	set	0x34, %l0
	lduw	[%l7 + %l0],	%l1
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x88,	%o6
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%l0
	nop
	set	0x24, %g1
	lduw	[%l7 + %g1],	%g6
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i2
	and	%i3,	%o1,	%l2
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x18, %l2
	std	%i4,	[%l7 + %l2]
	fpsub32s	%f13,	%f9,	%f11
	or	%o5,	%g3,	%i4
	nop
	set	0x16, %l3
	stb	%g4,	[%l7 + %l3]
	set	0x44, %o3
	swapa	[%l7 + %o3] 0x81,	%i0
	or	%o3,	%i6,	%l6
	nop
	set	0x50, %g2
	ldsh	[%l7 + %g2],	%o2
	set	0x0C, %i0
	stwa	%i7,	[%l7 + %i0] 0x80
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x80
	set	0x6D, %o7
	stba	%g7,	[%l7 + %o7] 0x89
	and	%o0,	%o6,	%g1
	bgu	%xcc,	loop_80
	nop
	set	0x1A, %g3
	ldsb	[%l7 + %g3],	%l3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g5
loop_80:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%l5
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x81
	set	0x3C, %g4
	sta	%f31,	[%l7 + %g4] 0x81
	nop
	set	0x7C, %o6
	lduw	[%l7 + %o6],	%l4
	nop
	set	0x79, %o0
	ldub	[%l7 + %o0],	%o7
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%l0
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x89,	%g6
	nop
	set	0x68, %i1
	stx	%o4,	[%l7 + %i1]
	set	0x6C, %o4
	sta	%f7,	[%l7 + %o4] 0x81
	nop
	set	0x60, %i6
	ldub	[%l7 + %i6],	%i2
	nop
	set	0x6C, %g7
	ldstub	[%l7 + %g7],	%i3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	set	0x10, %i4
	stda	%l0,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x3E, %o2
	ldsb	[%l7 + %o2],	%l2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xea,	%o0
	or	%i5,	%o5,	%g3
	and	%i4,	%i0,	%g4
	set	0x54, %l0
	sta	%f31,	[%l7 + %l0] 0x81
	ba,a,pn	%xcc,	loop_81
	nop
	set	0x38, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x68, %g5
	stx	%i6,	[%l7 + %g5]
	nop
	set	0x20, %g6
	std	%f12,	[%l7 + %g6]
loop_81:
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%l6
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x88,	%o2
	nop
	set	0x54, %l3
	ldstub	[%l7 + %l3],	%o3
	set	0x6B, %l2
	stba	%g7,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x81,	%o0
	fpadd16	%f12,	%f6,	%f22
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x89,	 4
	and	%g1,	%l3,	%g2
	nop
	set	0x19, %i0
	stb	%o6,	[%l7 + %i0]
	set	0x44, %o7
	stha	%g5,	[%l7 + %o7] 0x88
	add	%i1,	%l4,	%l5
	nop
	set	0x38, %o1
	std	%o6,	[%l7 + %o1]
	nop
	set	0x70, %l1
	prefetch	[%l7 + %l1],	 2
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x88,	%f6
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %o6
	sta	%f2,	[%l7 + %o6] 0x89
	set	0x18, %o0
	stda	%g6,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x66, %g3
	stha	%o4,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x5C, %o5
	stwa	%l0,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%i2
	nop
	set	0x7C, %o4
	sth	%i3,	[%l7 + %o4]
	nop
	set	0x74, %i1
	swap	[%l7 + %i1],	%l2
	nop
	set	0x77, %i6
	ldstub	[%l7 + %i6],	%l1
	st	%f17,	[%l7 + 0x28]
	bge,pt	%icc,	loop_82
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%o1
	add	%o5,	%g3,	%i5
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f20
loop_82:
	nop
	set	0x68, %i7
	ldstub	[%l7 + %i7],	%i4
	nop
	set	0x0C, %o2
	swap	[%l7 + %o2],	%i0
	nop
	set	0x16, %l5
	ldstub	[%l7 + %l5],	%i6
	or	%g4,	%o2,	%o3
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%l6
	nop
	set	0x5C, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x69, %i5
	ldstub	[%l7 + %i5],	%o0
	or	%i7,	%g7,	%g1
	nop
	set	0x40, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x34, %g6
	lduh	[%l7 + %g6],	%g2
	add	%o6,	%g5,	%l3
	nop
	set	0x18, %l0
	std	%i0,	[%l7 + %l0]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf9
	membar	#Sync
	add	%l5,	%l4,	%o7
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%o4
	nop
	set	0x6B, %l3
	stb	%g6,	[%l7 + %l3]
	nop
	set	0x66, %l2
	ldub	[%l7 + %l2],	%i2
	wr	%l0,	%i3,	%sys_tick
	nop
	set	0x2A, %o3
	lduh	[%l7 + %o3],	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%o1
	nop
	set	0x68, %i0
	stx	%g3,	[%l7 + %i0]
	set	0x78, %o7
	stwa	%i5,	[%l7 + %o7] 0x80
	or	%o5,	%i4,	%i6
	nop
	set	0x10, %o1
	std	%g4,	[%l7 + %o1]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%o3
	nop
	set	0x24, %l1
	stb	%l6,	[%l7 + %l1]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc4
	set	0x18, %o6
	stha	%o0,	[%l7 + %o6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%i0
	nop
	set	0x50, %o0
	stx	%g7,	[%l7 + %o0]
	set	0x78, %o5
	lda	[%l7 + %o5] 0x89,	%f29
	set	0x3D, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g1
	nop
	set	0x70, %o4
	std	%i6,	[%l7 + %o4]
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%o6
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%f22
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x09, %i6
	ldsb	[%l7 + %i6],	%g5
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xeb,	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%g2
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x88,	%l5
	nop
	set	0x18, %o2
	std	%f12,	[%l7 + %o2]
	nop
	set	0x54, %l5
	swap	[%l7 + %l5],	%o7
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x89
	set	0x51, %i4
	stba	%l4,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x20, %i2
	std	%o4,	[%l7 + %i2]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f0
	nop
	set	0x58, %g5
	stx	%i2,	[%l7 + %g5]
	nop
	set	0x0F, %l0
	ldstub	[%l7 + %l0],	%g6
	set	0x4F, %g1
	stba	%i3,	[%l7 + %g1] 0xe2
	membar	#Sync
	fpadd16s	%f22,	%f25,	%f4
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%l0
	nop
	set	0x6C, %l3
	stw	%l2,	[%l7 + %l3]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l1
	nop
	set	0x14, %g6
	swap	[%l7 + %g6],	%i5
	st	%f28,	[%l7 + 0x14]
	set	0x0D, %o3
	stba	%o5,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x70, %i0
	std	%g2,	[%l7 + %i0]
	nop
	set	0x68, %l2
	stx	%i4,	[%l7 + %l2]
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%i6
	nop
	set	0x4E, %l1
	ldsh	[%l7 + %l1],	%g4
	set	0x60, %g2
	ldda	[%l7 + %g2] 0xe2,	%o2
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xeb,	%o2
	set	0x0B, %g4
	stba	%o0,	[%l7 + %g4] 0x80
	and	%l6,	%g7,	%g1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	set	0x6C, %o0
	lda	[%l7 + %o0] 0x81,	%f16
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	nop
	set	0x78, %o4
	stx	%o6,	[%l7 + %o4]
	nop
	set	0x0C, %i1
	stw	%i0,	[%l7 + %i1]
	nop
	set	0x40, %i6
	stw	%g5,	[%l7 + %i6]
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x89,	%l3
	or	%g2,	%l5,	%o7
	set	0x76, %i7
	stha	%i1,	[%l7 + %i7] 0xeb
	membar	#Sync
	fpadd16	%f16,	%f22,	%f30
	set	0x54, %o2
	lda	[%l7 + %o2] 0x88,	%f8
	nop
	set	0x1A, %l5
	sth	%o4,	[%l7 + %l5]
	nop
	set	0x48, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x48, %l4
	lda	[%l7 + %l4] 0x81,	%f31
	and	%i2,	%l4,	%g6
	nop
	set	0x10, %i5
	lduh	[%l7 + %i5],	%i3
	set	0x48, %g5
	prefetcha	[%l7 + %g5] 0x89,	 3
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x68, %l0
	stx	%o1,	[%l7 + %l0]
	or	%l1,	%l0,	%i5
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%g3
	nop
	set	0x68, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x10, %g6
	sth	%i4,	[%l7 + %g6]
	nop
	set	0x70, %o3
	swap	[%l7 + %o3],	%g4
	set	0x10, %i0
	swapa	[%l7 + %i0] 0x80,	%i6
	set	0x40, %l3
	stwa	%o2,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x88,	%o3
	nop
	set	0x7B, %o7
	ldstub	[%l7 + %o7],	%o0
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%g6
	ble,a,pt	%xcc,	loop_83
	nop
	set	0x5C, %g2
	lduh	[%l7 + %g2],	%g1
	wr	%l6,	%o6,	%softint
	set	0x6C, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i7
loop_83:
	nop
	set	0x10, %g4
	ldsw	[%l7 + %g4],	%i0
	nop
	set	0x2E, %o6
	lduh	[%l7 + %o6],	%g5
	set	0x60, %o0
	ldstuba	[%l7 + %o0] 0x88,	%g2
	ld	[%l7 + 0x48],	%f26
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x74, %o5
	sth	%l5,	[%l7 + %o5]
	nop
	set	0x78, %o4
	lduw	[%l7 + %o4],	%l3
	add	%i1,	%o7,	%o4
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	nop
	set	0x0C, %i6
	ldub	[%l7 + %i6],	%i2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xca
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%g6
	nop
	set	0x08, %i7
	std	%l2,	[%l7 + %i7]
	ld	[%l7 + 0x70],	%f15
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%i3
	nop
	set	0x5C, %o2
	lduh	[%l7 + %o2],	%l1
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x88,	%l0
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x08, %i5
	stx	%i5,	[%l7 + %i5]
	fpsub32	%f14,	%f22,	%f24
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f0
	nop
	set	0x6A, %g5
	sth	%o1,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x3A, %i2
	sth	%g3,	[%l7 + %i2]
	fpsub16s	%f2,	%f21,	%f24
	nop
	set	0x60, %l0
	std	%f12,	[%l7 + %l0]
	nop
	set	0x74, %g1
	sth	%i4,	[%l7 + %g1]
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC8F, 	%tick_cmpr
	ld	[%l7 + 0x6C],	%f17
	add	%o3,	%g4,	%o0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
	nop
	set	0x28, %i0
	std	%f22,	[%l7 + %i0]
	nop
	set	0x68, %l3
	stb	%g1,	[%l7 + %l3]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%g7
	nop
	set	0x24, %o7
	swap	[%l7 + %o7],	%o6
	or	%l6,	%i0,	%g5
	set	0x48, %g2
	stda	%i6,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x4B, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g2
	nop
	set	0x10, %g4
	stb	%l5,	[%l7 + %g4]
	nop
	set	0x54, %o1
	stw	%i1,	[%l7 + %o1]
	set	0x4C, %o0
	lda	[%l7 + %o0] 0x80,	%f4
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x81,	%l3
	set	0x20, %o5
	stda	%o6,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%f5,	[%l7 + 0x28]
	nop
	set	0x68, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x28, %i6
	stw	%o4,	[%l7 + %i6]
	nop
	set	0x78, %l6
	std	%i2,	[%l7 + %l6]
	set	0x14, %i1
	sta	%f31,	[%l7 + %i1] 0x88
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x81,	%l4
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%f4
	nop
	set	0x48, %o2
	swap	[%l7 + %o2],	%g6
	set	0x14, %g7
	stwa	%l2,	[%l7 + %g7] 0x88
	st	%f10,	[%l7 + 0x44]
	nop
	set	0x78, %g3
	stb	%i3,	[%l7 + %g3]
	set	0x54, %l4
	sta	%f26,	[%l7 + %l4] 0x89
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x88,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%o1
	and	%i5,	%i4,	%o5
	nop
	set	0x12, %i5
	ldsh	[%l7 + %i5],	%i6
	nop
	set	0x40, %i2
	swap	[%l7 + %i2],	%g3
	nop
	set	0x34, %l0
	ldsb	[%l7 + %l0],	%o3
	nop
	set	0x68, %g1
	ldsw	[%l7 + %g1],	%o2
	nop
	set	0x50, %i3
	stx	%o0,	[%l7 + %i3]
	nop
	set	0x4C, %o3
	ldub	[%l7 + %o3],	%g4
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%g7
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%g1
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x80,	%o6
	set	0x0C, %g6
	lda	[%l7 + %g6] 0x89,	%f18
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%l6
	set	0x7C, %g2
	stwa	%g5,	[%l7 + %g2] 0x80
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x7E, %o7
	sth	%i7,	[%l7 + %o7]
	set	0x20, %g4
	stxa	%i0,	[%l7 + %g4] 0x88
	and	%g2,	%i1,	%l5
	or	%o7,	%o4,	%i2
	nop
	set	0x3B, %o0
	ldub	[%l7 + %o0],	%l4
	nop
	set	0x10, %o1
	std	%f10,	[%l7 + %o1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%l2
	nop
	set	0x0B, %o6
	stb	%l3,	[%l7 + %o6]
	nop
	set	0x30, %o5
	lduw	[%l7 + %o5],	%l0
	nop
	set	0x20, %i6
	stx	%i3,	[%l7 + %i6]
	nop
	set	0x2A, %l6
	ldstub	[%l7 + %l6],	%o1
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%l0
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x2F, %o4
	stb	%i5,	[%l7 + %o4]
	set	0x58, %l5
	lda	[%l7 + %l5] 0x81,	%f16
	nop
	set	0x2C, %o2
	stw	%i4,	[%l7 + %o2]
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0
	nop
	set	0x2C, %g7
	stw	%g3,	[%l7 + %g7]
	fpsub16	%f2,	%f22,	%f12
	nop
	set	0x72, %l4
	ldub	[%l7 + %l4],	%o3
	set	0x5C, %g3
	stwa	%i6,	[%l7 + %g3] 0x80
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%o2
	set	0x48, %i2
	ldxa	[%l7 + %i2] 0x80,	%o0
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%g4
	nop
	set	0x3D, %i4
	ldub	[%l7 + %i4],	%g1
	set	0x60, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0
	nop
	set	0x6C, %o3
	ldstub	[%l7 + %o3],	%o6
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x88,	%g5
	set	0x38, %l3
	stda	%i6,	[%l7 + %l3] 0x88
	nop
	set	0x28, %i3
	std	%i0,	[%l7 + %i3]
	nop
	set	0x58, %l2
	swap	[%l7 + %l2],	%g2
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x81,	%i1
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x81,	%f18
	set	0x14, %g5
	sta	%f9,	[%l7 + %g5] 0x88
	set	0x08, %o7
	stxa	%l5,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x20, %l1
	ldda	[%l7 + %l1] 0xeb,	%o6
	nop
	set	0x20, %o0
	ldsw	[%l7 + %o0],	%o4
	add	%i7,	%i2,	%l4
	ld	[%l7 + 0x28],	%f12
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x80,	%l2
	add	%l3,	%g6,	%l0
	nop
	set	0x2E, %o6
	ldsh	[%l7 + %o6],	%o1
	bne,pt	%xcc,	loop_84
	fpsub32s	%f26,	%f25,	%f25
	set	0x1C, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i3
loop_84:
	or	%i5,	%l1,	%o5
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%i4
	set	0x34, %l6
	sta	%f27,	[%l7 + %l6] 0x88
	set	0x1C, %i1
	stba	%g3,	[%l7 + %i1] 0x81
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	or	%o2,	%g4,	%g1
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x80,	 4
	nop
	set	0x10, %l5
	stw	%o0,	[%l7 + %l5]
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x88,	%g5
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%i0
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%g2
	nop
	set	0x10, %l4
	stx	%i1,	[%l7 + %l4]
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x89,	%l5
	add	%o7,	%l6,	%i7
	nop
	set	0x56, %i5
	ldsb	[%l7 + %i5],	%i2
	set	0x4C, %l0
	sta	%f24,	[%l7 + %l0] 0x88
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x88,	%l4
	nop
	set	0x58, %i4
	ldstub	[%l7 + %i4],	%l2
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%o4
	and	%l3,	%l0,	%g6
	bn,a	%xcc,	loop_85
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%i3
	nop
	set	0x60, %l3
	std	%f10,	[%l7 + %l3]
	nop
	set	0x0A, %i0
	ldub	[%l7 + %i0],	%o1
loop_85:
	and	%i5,	%l1,	%o5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f0
	nop
	set	0x68, %l2
	ldsw	[%l7 + %l2],	%i4
	set	0x78, %g2
	stxa	%g3,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o2
	or	%g4,	%i6,	%g7
	nop
	set	0x50, %l1
	ldsw	[%l7 + %l1],	%g1
	st	%f17,	[%l7 + 0x54]
	set	0x58, %o0
	sta	%f4,	[%l7 + %o0] 0x89
	nop
	set	0x5C, %o1
	ldsw	[%l7 + %o1],	%o0
	set	0x68, %o7
	lda	[%l7 + %o7] 0x89,	%f17
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4D3, 	%tick_cmpr
	nop
	set	0x7C, %g4
	lduh	[%l7 + %g4],	%o6
	nop
	set	0x1A, %o6
	ldub	[%l7 + %o6],	%g2
	nop
	set	0x38, %l6
	stx	%i1,	[%l7 + %l6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x44D, 	%tick_cmpr
	bn,a	%xcc,	loop_86
	nop
	set	0x66, %o5
	sth	%i7,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x64]
	set	0x5C, %i1
	lda	[%l7 + %i1] 0x88,	%f20
loop_86:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%o7
	nop
	set	0x58, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x18, %o2
	stx	%l4,	[%l7 + %o2]
	be,a,pt	%icc,	loop_87
	ld	[%l7 + 0x0C],	%f23
	st	%fsr,	[%l7 + 0x1C]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc4
loop_87:
	nop
	set	0x30, %g7
	std	%l2,	[%l7 + %g7]
	nop
	set	0x3E, %i7
	ldub	[%l7 + %i7],	%l3
	nop
	set	0x18, %g3
	ldsh	[%l7 + %g3],	%o4
	set	0x54, %l4
	stha	%g6,	[%l7 + %l4] 0xea
	membar	#Sync
	ld	[%l7 + 0x34],	%f21
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x80,	 1
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%l0
	set	0x4C, %l0
	stba	%i5,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f16
	set	0x57, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o1
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%o5
	set	0x22, %l3
	stba	%i4,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%l1
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%o2
	set	0x50, %g2
	swapa	[%l7 + %g2] 0x80,	%o2
	fpsub32s	%f4,	%f14,	%f5
	set	0x58, %i3
	stda	%g4,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%g3
	set	0x0E, %g6
	stha	%g7,	[%l7 + %g6] 0x88
	and	%o0,	%g5,	%i0
	nop
	set	0x48, %g5
	lduw	[%l7 + %g5],	%o6
	set	0x60, %o0
	stwa	%g1,	[%l7 + %o0] 0x81
	nop
	set	0x70, %o1
	ldsw	[%l7 + %o1],	%g2
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%i1
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x6C, %o6
	swapa	[%l7 + %o6] 0x81,	%l5
	ld	[%l7 + 0x30],	%f29
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f0
	nop
	set	0x56, %g4
	lduh	[%l7 + %g4],	%i7
	st	%fsr,	[%l7 + 0x70]
	set	0x58, %i1
	stda	%i6,	[%l7 + %i1] 0x80
	nop
	set	0x58, %o4
	ldstub	[%l7 + %o4],	%o7
	ld	[%l7 + 0x24],	%f12
	nop
	set	0x70, %l5
	sth	%l4,	[%l7 + %l5]
	set	0x14, %o5
	sta	%f3,	[%l7 + %o5] 0x88
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%i2
	nop
	set	0x48, %o2
	ldx	[%l7 + %o2],	%o4
	set	0x48, %g7
	lda	[%l7 + %g7] 0x80,	%f27
	and	%g6,	%l3,	%i3
	set	0x0C, %i7
	stwa	%i5,	[%l7 + %i7] 0x80
	set	0x20, %i6
	stba	%l0,	[%l7 + %i6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	add	%o1,	%i4,	%o5
	ld	[%l7 + 0x3C],	%f9
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%o3
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x70, %i5
	swapa	[%l7 + %i5] 0x89,	%g4
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f28
	or	%i6,	%o2,	%g3
	nop
	set	0x58, %l4
	stx	%o0,	[%l7 + %l4]
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x81,	%g6
	or	%g5,	%o6,	%i0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc2
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%g2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f16
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xea,	%i0
	set	0x10, %l2
	ldda	[%l7 + %l2] 0x88,	%l4
	ba,pn	%icc,	loop_88
	fpsub16s	%f25,	%f23,	%f14
	nop
	set	0x68, %g2
	std	%f22,	[%l7 + %g2]
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x80,	%g1
loop_88:
	nop
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x89,	%l6
	set	0x52, %g5
	stha	%i7,	[%l7 + %g5] 0x89
	add	%o7,	%l2,	%l4
	set	0x1C, %o0
	stha	%i2,	[%l7 + %o0] 0x88
	bge	%icc,	loop_89
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%g6
	nop
	set	0x50, %o7
	stw	%l3,	[%l7 + %o7]
	set	0x40, %o1
	stxa	%i3,	[%l7 + %o1] 0xeb
	membar	#Sync
loop_89:
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f22
	set	0x14, %g4
	lda	[%l7 + %g4] 0x88,	%f3
	and	%i5,	%l0,	%o1
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%i4
	nop
	set	0x50, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x60, %l5
	stda	%o2,	[%l7 + %l5] 0xea
	membar	#Sync
	st	%f25,	[%l7 + 0x6C]
	set	0x7E, %o6
	stba	%l1,	[%l7 + %o6] 0xea
	membar	#Sync
	st	%f10,	[%l7 + 0x58]
	set	0x10, %o2
	stxa	%g4,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc0
	ld	[%l7 + 0x08],	%f30
	nop
	set	0x0C, %o5
	stw	%o2,	[%l7 + %o5]
	nop
	set	0x64, %i6
	ldsh	[%l7 + %i6],	%g3
	nop
	set	0x53, %g3
	ldstub	[%l7 + %g3],	%i6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%g5
	set	0x10, %i7
	stda	%g6,	[%l7 + %i7] 0x89
	nop
	set	0x16, %i2
	sth	%i0,	[%l7 + %i2]
	add	%g2,	%i1,	%o6
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%l4
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%g0
	set	0x70, %o3
	lda	[%l7 + %o3] 0x80,	%f5
	nop
	set	0x78, %l0
	stw	%l6,	[%l7 + %l0]
	nop
	set	0x4C, %i4
	ldsb	[%l7 + %i4],	%i7
	set	0x4C, %g1
	stwa	%o7,	[%l7 + %g1] 0x81
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f14
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x89,	%l4
	set	0x48, %g2
	swapa	[%l7 + %g2] 0x88,	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%l2
	nop
	set	0x59, %i3
	stb	%l3,	[%l7 + %i3]
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x81,	%f31
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x89,	%i3
	set	0x28, %g6
	stda	%i4,	[%l7 + %g6] 0x81
	set	0x28, %g5
	stxa	%o1,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x30, %o1
	stxa	%o4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x78, %l1
	swap	[%l7 + %l1],	%o5
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%i4
	set	0x08, %g4
	stxa	%o3,	[%l7 + %g4] 0x89
	nop
	set	0x76, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	set	0x1E, %i1
	ldsh	[%l7 + %i1],	%l1
	fpsub32	%f26,	%f28,	%f10
	nop
	set	0x20, %o4
	ldsw	[%l7 + %o4],	%g4
	set	0x30, %l5
	lda	[%l7 + %l5] 0x81,	%f14
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x80,	 2
	set	0x60, %g7
	stxa	%o2,	[%l7 + %g7] 0xe2
	membar	#Sync
	and	%o0,	%i6,	%g7
	nop
	set	0x48, %o6
	stx	%g5,	[%l7 + %o6]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f0
	nop
	set	0x3C, %o5
	stw	%g2,	[%l7 + %o5]
	nop
	set	0x40, %i7
	std	%i0,	[%l7 + %i7]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xea,	%i0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x41, %i5
	stb	%l5,	[%l7 + %i5]
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x88,	%o6
	nop
	set	0x5C, %o3
	ldsb	[%l7 + %o3],	%l6
	nop
	set	0x70, %l0
	stw	%g1,	[%l7 + %l0]
	set	0x34, %g1
	lda	[%l7 + %g1] 0x81,	%f20
	nop
	set	0x37, %i4
	ldsb	[%l7 + %i4],	%o7
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%i7
	fpsub32s	%f25,	%f0,	%f11
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x80,	%i2
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f0
	set	0x7E, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l4
	set	0x34, %l2
	swapa	[%l7 + %l2] 0x81,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%i3
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%i5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%l2
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 2
	set	0x60, %g5
	stxa	%o5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x18, %l1
	stx	%i4,	[%l7 + %l1]
	set	0x4C, %o7
	stba	%o3,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x48, %o1
	stx	%l0,	[%l7 + %o1]
	nop
	set	0x32, %l6
	lduh	[%l7 + %l6],	%l1
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	fpadd32s	%f21,	%f31,	%f19
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc8
	set	0x60, %l5
	swapa	[%l7 + %l5] 0x88,	%o4
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f16
	set	0x2A, %o4
	stha	%g4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf1
	membar	#Sync
	ld	[%l7 + 0x1C],	%f27
	nop
	set	0x78, %o6
	ldsw	[%l7 + %o6],	%o2
	set	0x2C, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g3
	ld	[%l7 + 0x40],	%f5
	nop
	set	0x32, %i6
	sth	%o0,	[%l7 + %i6]
	set	0x50, %i2
	ldda	[%l7 + %i2] 0xe2,	%g6
	nop
	set	0x28, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf1
	membar	#Sync
	set	0x3F, %i5
	stba	%i6,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x71, %l4
	stba	%g2,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x20, %l0
	swap	[%l7 + %l0],	%i0
	nop
	set	0x74, %g1
	stb	%i1,	[%l7 + %g1]
	nop
	set	0x40, %o3
	ldx	[%l7 + %o3],	%g5
	fpsub16	%f30,	%f22,	%f16
	fpsub32	%f0,	%f28,	%f8
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x80
	nop
	set	0x28, %l3
	stw	%o6,	[%l7 + %l3]
	fpadd16	%f20,	%f10,	%f4
	nop
	set	0x30, %g2
	std	%l4,	[%l7 + %g2]
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%g1
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%o6
	nop
	set	0x48, %o0
	ldsw	[%l7 + %o0],	%l6
	st	%fsr,	[%l7 + 0x6C]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
	nop
	set	0x58, %l2
	std	%f4,	[%l7 + %l2]
	or	%i7,	%l4,	%i2
	wr	%g6,	%i3,	%softint
	nop
	set	0x60, %l1
	std	%i4,	[%l7 + %l1]
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x80,	%l3
	nop
	set	0x0B, %o7
	ldsb	[%l7 + %o7],	%l2
	nop
	set	0x78, %l6
	std	%o0,	[%l7 + %l6]
	add	%i4,	%o5,	%l0
	set	0x48, %i1
	stxa	%l1,	[%l7 + %i1] 0x89
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%o4
	nop
	set	0x4D, %o1
	ldsb	[%l7 + %o1],	%g4
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%o2
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%g3
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	bgu	%xcc,	loop_90
	nop
	set	0x10, %o6
	std	%o2,	[%l7 + %o6]
	set	0x58, %o5
	stxa	%o0,	[%l7 + %o5] 0xeb
	membar	#Sync
loop_90:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g7
	ld	[%l7 + 0x4C],	%f17
	set	0x40, %o4
	stda	%g2,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x4D, %i2
	ldsb	[%l7 + %i2],	%i1
	set	0x60, %i6
	sta	%f8,	[%l7 + %i6] 0x89
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%i0
	set	0x08, %i5
	lda	[%l7 + %i5] 0x88,	%f31
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%g5
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x80,	%f29
	set	0x40, %l0
	stxa	%l5,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x7F, %i7
	ldsb	[%l7 + %i7],	%o7
	nop
	set	0x4A, %g1
	lduh	[%l7 + %g1],	%l6
	nop
	set	0x4C, %i4
	swap	[%l7 + %i4],	%g1
	set	0x10, %l3
	stwa	%l4,	[%l7 + %l3] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA51, 	%sys_tick_cmpr
	set	0x40, %o3
	ldstuba	[%l7 + %o3] 0x81,	%i2
	nop
	set	0x10, %i0
	std	%f14,	[%l7 + %i0]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%i5
	nop
	set	0x3A, %i3
	stb	%l2,	[%l7 + %i3]
	set	0x2D, %o0
	stba	%l3,	[%l7 + %o0] 0x89
	nop
	set	0x1F, %g2
	ldub	[%l7 + %g2],	%o1
	nop
	set	0x40, %g6
	ldsw	[%l7 + %g6],	%o5
	set	0x30, %l1
	sta	%f26,	[%l7 + %l1] 0x80
	nop
	set	0x44, %l2
	ldsh	[%l7 + %l2],	%i4
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	and	%l1,	%l0,	%o4
	nop
	set	0x68, %o7
	stw	%g4,	[%l7 + %o7]
	ld	[%l7 + 0x70],	%f23
	fpadd32s	%f17,	%f23,	%f15
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%f0
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x80,	%o2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd8
	set	0x24, %o1
	swapa	[%l7 + %o1] 0x88,	%g3
	st	%fsr,	[%l7 + 0x48]
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x89,	%o3
	st	%f20,	[%l7 + 0x2C]
	or	%o0,	%i6,	%g2
	nop
	nop
	setx	0xED7F78BA571827F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x53B677244EFB64E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f26,	%f24
	or	%i1,	%i0,	%g7
	or	%g5,	%o6,	%o7
	nop
	set	0x34, %l5
	ldsh	[%l7 + %l5],	%l5
	nop
	set	0x12, %o6
	ldstub	[%l7 + %o6],	%l6
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	nop
	setx	0x5B5DE4DC588D4A99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x197C186DB7689D2B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f12,	%f28
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x47, %i2
	ldstub	[%l7 + %i2],	%l4
	nop
	set	0x1C, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x89,	 3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%g1
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%i3
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%i5
	set	0x58, %i5
	stxa	%i2,	[%l7 + %i5] 0x88
	set	0x10, %i7
	stxa	%l2,	[%l7 + %i7] 0x89
	wr	%o1,	%o5,	%clear_softint
	set	0x30, %g1
	stxa	%l3,	[%l7 + %g1] 0x80
	set	, %l0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1266
!	Type a   	: 20
!	Type cti   	: 19
!	Type x   	: 532
!	Type f   	: 48
!	Type i   	: 115
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
	set	0x0,	%g1
	set	0xE,	%g2
	set	0x9,	%g3
	set	0x0,	%g4
	set	0x0,	%g5
	set	0xF,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x4,	%i1
	set	-0xA,	%i2
	set	-0x6,	%i3
	set	-0x9,	%i4
	set	-0xC,	%i5
	set	-0xE,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x2F5986F0,	%l0
	set	0x13459D58,	%l1
	set	0x723A845D,	%l2
	set	0x6A7F243E,	%l3
	set	0x5E11DD82,	%l4
	set	0x75FCDDC4,	%l5
	set	0x6CF12D86,	%l6
	!# Output registers
	set	-0x0FB2,	%o0
	set	-0x06E2,	%o1
	set	0x0F20,	%o2
	set	0x060C,	%o3
	set	0x13C1,	%o4
	set	0x03A8,	%o5
	set	-0x0E51,	%o6
	set	0x1C36,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%l0
	nop
	set	0x3C, %i4
	swap	[%l7 + %i4],	%i4
	nop
	set	0x3E, %o3
	ldub	[%l7 + %o3],	%o4
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f8
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe3,	%g4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%o2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%g2
	or	%o3,	%i6,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i0
	or	%o0,	%g7,	%g5
	st	%f28,	[%l7 + 0x5C]
	set	0x0C, %o0
	lda	[%l7 + %o0] 0x80,	%f29
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x88,	%o6
	be,a	%icc,	loop_91
	nop
	set	0x34, %l2
	stw	%o7,	[%l7 + %l2]
	set	0x75, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l6
loop_91:
	nop
	set	0x68, %l1
	stwa	%l4,	[%l7 + %l1] 0x88
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%l5
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x16, %o7
	ldsb	[%l7 + %o7],	%g6
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f26
	set	0x15, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i7
	set	0x10, %o2
	stxa	%g1,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%i5
	nop
	set	0x7E, %o1
	ldsh	[%l7 + %o1],	%i3
	nop
	set	0x37, %o5
	stb	%i2,	[%l7 + %o5]
	nop
	set	0x40, %o4
	lduw	[%l7 + %o4],	%l2
	or	%o5,	%o1,	%l1
	add	%i4,	%l3,	%g4
	and	%o4,	%o2,	%g3
	ld	[%l7 + 0x4C],	%f11
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%o3
	or	%l0,	%g2,	%i1
	set	0x4E, %i6
	stha	%i6,	[%l7 + %i6] 0x81
	bgu,pn	%xcc,	loop_92
	nop
	set	0x28, %g3
	std	%f4,	[%l7 + %g3]
	ld	[%l7 + 0x18],	%f6
	nop
	set	0x65, %l4
	ldub	[%l7 + %l4],	%o0
loop_92:
	nop
	set	0x45, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g7
	nop
	set	0x70, %i5
	stb	%g5,	[%l7 + %i5]
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x89,	%o6
	set	0x3C, %g1
	stha	%o7,	[%l7 + %g1] 0x80
	st	%fsr,	[%l7 + 0x28]
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x89,	%i6
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%l4
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f0
	ld	[%l7 + 0x20],	%f28
	and	%l5,	%g6,	%i7
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	and	%g1,	%i5,	%i0
	add	%i3,	%i2,	%o5
	and	%l2,	%l1,	%o1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f16
	and	%i4,	%l3,	%o4
	set	0x54, %g2
	lda	[%l7 + %g2] 0x89,	%f25
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o2
	set	0x60, %o3
	stha	%g3,	[%l7 + %o3] 0x88
	nop
	set	0x5C, %g6
	stw	%o3,	[%l7 + %g6]
	set	0x40, %o0
	stda	%l0,	[%l7 + %o0] 0x88
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x81,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%g2
	nop
	set	0x22, %g5
	ldsb	[%l7 + %g5],	%o0
	nop
	set	0x16, %i1
	sth	%g5,	[%l7 + %i1]
	nop
	set	0x68, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x5B, %l1
	stb	%g7,	[%l7 + %l1]
	set	0x08, %g4
	sta	%f9,	[%l7 + %g4] 0x88
	nop
	set	0x3C, %o2
	stw	%o6,	[%l7 + %o2]
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	nop
	nop
	setx	0x8EA4EB0888F9C14F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xADFEB905533CEAD5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f30,	%f4
	set	0x68, %o6
	stwa	%l6,	[%l7 + %o6] 0x89
	set	0x2E, %o1
	stha	%l4,	[%l7 + %o1] 0x89
	nop
	set	0x45, %o5
	stb	%l5,	[%l7 + %o5]
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f24
	nop
	set	0x68, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x81,	%g6
	bne,pt	%icc,	loop_93
	and	%i7,	%g1,	%i0
	nop
	set	0x4C, %g3
	ldsb	[%l7 + %g3],	%i3
	or	%i5,	%o5,	%l2
loop_93:
	nop
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x81,	%i2
	set	0x4C, %g7
	lda	[%l7 + %g7] 0x89,	%f22
	or	%l1,	%i4,	%l3
	nop
	set	0x38, %l6
	swap	[%l7 + %l6],	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o2
	nop
	set	0x10, %i5
	lduw	[%l7 + %i5],	%o1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%g3
	set	0x2C, %g1
	stha	%l0,	[%l7 + %g1] 0xe3
	membar	#Sync
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%i1
	nop
	set	0x74, %i7
	lduh	[%l7 + %i7],	%o0
	nop
	set	0x28, %l3
	stw	%g2,	[%l7 + %l3]
	bne,pt	%xcc,	loop_94
	nop
	set	0x7C, %l0
	swap	[%l7 + %l0],	%g7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
loop_94:
	ld	[%l7 + 0x58],	%f28
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x88,	 2
	nop
	set	0x5C, %i0
	swap	[%l7 + %i0],	%g5
	nop
	set	0x10, %g2
	stw	%o7,	[%l7 + %g2]
	nop
	set	0x18, %g6
	std	%f20,	[%l7 + %g6]
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x89,	%l6
	nop
	set	0x36, %l2
	lduh	[%l7 + %l2],	%l4
	nop
	set	0x14, %o0
	swap	[%l7 + %o0],	%l5
	nop
	set	0x70, %i1
	swap	[%l7 + %i1],	%g6
	nop
	set	0x40, %o7
	lduh	[%l7 + %o7],	%i7
	nop
	set	0x21, %l1
	ldstub	[%l7 + %l1],	%i0
	set	0x34, %g5
	stha	%i3,	[%l7 + %g5] 0xe3
	membar	#Sync
	add	%g1,	%o5,	%l2
	ba	%icc,	loop_95
	nop
	set	0x5C, %o2
	ldsb	[%l7 + %o2],	%i5
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%i2
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f16
loop_95:
	nop
	set	0x42, %o1
	ldsh	[%l7 + %o1],	%l1
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 0
	bleu,a,pn	%xcc,	loop_96
	nop
	set	0x5C, %l5
	swap	[%l7 + %l5],	%l3
	set	0x18, %i2
	stxa	%o4,	[%l7 + %i2] 0x88
loop_96:
	nop
	set	0x30, %i6
	std	%i4,	[%l7 + %i6]
	nop
	set	0x4C, %g3
	ldsh	[%l7 + %g3],	%o2
	nop
	set	0x64, %l4
	sth	%o1,	[%l7 + %l4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%i6
	set	0x6C, %g7
	lda	[%l7 + %g7] 0x81,	%f8
	nop
	set	0x14, %o4
	lduh	[%l7 + %o4],	%g3
	set	0x70, %l6
	swapa	[%l7 + %l6] 0x89,	%i1
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x89,	%f19
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f0
	nop
	set	0x78, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x81,	%g2
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x89,	%o0
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f4
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f22
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%o6
	nop
	set	0x4C, %i0
	ldsh	[%l7 + %i0],	%g7
	nop
	set	0x5C, %o3
	lduw	[%l7 + %o3],	%g5
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%l6
	nop
	set	0x48, %l2
	ldsh	[%l7 + %l2],	%o7
	set	0x08, %i1
	swapa	[%l7 + %i1] 0x88,	%l4
	or	%g6,	%i7,	%l5
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f8
	set	0x48, %o0
	stha	%i0,	[%l7 + %o0] 0x80
	nop
	set	0x63, %g5
	ldsb	[%l7 + %g5],	%g1
	add	%i3,	%l2,	%i5
	set	0x6E, %o2
	stha	%o5,	[%l7 + %o2] 0x81
	set	0x3E, %l1
	stha	%i2,	[%l7 + %l1] 0x81
	nop
	set	0x60, %o6
	stx	%l1,	[%l7 + %o6]
	set	0x28, %o1
	stxa	%o4,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x7F, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i4
	ld	[%l7 + 0x48],	%f14
	bne,pt	%icc,	loop_97
	nop
	set	0x20, %g4
	prefetch	[%l7 + %g4],	 1
	add	%o2,	%l3,	%o1
	ba,a	%xcc,	loop_98
loop_97:
	nop
	nop
	setx	0xB93E4196,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x371B02AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f12,	%f4
	set	0x68, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o3
loop_98:
	add	%g4,	%i6,	%l0
	nop
	set	0x20, %i6
	sth	%g3,	[%l7 + %i6]
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%i1
	nop
	set	0x50, %l5
	stb	%o0,	[%l7 + %l5]
	nop
	set	0x56, %o4
	ldstub	[%l7 + %o4],	%g2
	nop
	set	0x28, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x81,	 4
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%g7
	nop
	set	0x20, %l3
	lduw	[%l7 + %l3],	%l6
	nop
	set	0x09, %i5
	ldub	[%l7 + %i5],	%g5
	nop
	set	0x74, %l0
	stw	%o7,	[%l7 + %l0]
	ld	[%l7 + 0x24],	%f16
	nop
	set	0x4C, %g1
	lduh	[%l7 + %g1],	%l4
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f30
	nop
	set	0x3F, %g2
	ldub	[%l7 + %g2],	%i7
	wr	%l5,	%i0,	%y
	and	%g1,	%g6,	%i3
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x59, %i3
	stb	%l2,	[%l7 + %i3]
	nop
	set	0x48, %i0
	std	%o4,	[%l7 + %i0]
	nop
	set	0x48, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x60, %g6
	stw	%i2,	[%l7 + %g6]
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%l0
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 1
	or	%i5,	%o4,	%i4
	add	%l3,	%o2,	%o1
	nop
	set	0x52, %o0
	ldub	[%l7 + %o0],	%g4
	set	0x68, %g5
	stxa	%i6,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x4E, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o3
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f26
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f0
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f18
	nop
	set	0x20, %g4
	stw	%i1,	[%l7 + %g4]
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%o0
	set	0x39, %i2
	stba	%g2,	[%l7 + %i2] 0x80
	nop
	set	0x48, %i6
	stw	%l0,	[%l7 + %i6]
	and	%g7,	%o6,	%l6
	st	%f30,	[%l7 + 0x0C]
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%o7
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x88,	%l4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%l5
	fpadd32s	%f3,	%f30,	%f31
	nop
	set	0x1C, %o4
	stb	%i0,	[%l7 + %o4]
	nop
	set	0x10, %l4
	stx	%g1,	[%l7 + %l4]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f16
	nop
	set	0x28, %i7
	std	%g4,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g6
	set	0x76, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o5
	set	0x68, %g7
	swapa	[%l7 + %g7] 0x80,	%i2
	wr	%l1,	%l2,	%ccr
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%i4
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x88,	 3
	fpsub16	%f26,	%f12,	%f10
	nop
	set	0x1A, %g1
	ldsh	[%l7 + %g1],	%o4
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	fpadd16	%f2,	%f18,	%f2
	wr	%o2,	%o1,	%set_softint
	nop
	set	0x2F, %i4
	ldstub	[%l7 + %i4],	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o3
	nop
	set	0x54, %i3
	stw	%i1,	[%l7 + %i3]
	nop
	set	0x71, %i0
	ldub	[%l7 + %i0],	%g3
	nop
	set	0x64, %g2
	ldsw	[%l7 + %g2],	%o0
	nop
	set	0x5A, %g6
	ldub	[%l7 + %g6],	%g2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%g7
	nop
	set	0x58, %l2
	stw	%l6,	[%l7 + %l2]
	or	%o7,	%o6,	%i7
	nop
	set	0x28, %o7
	ldsh	[%l7 + %o7],	%l4
	st	%f7,	[%l7 + 0x20]
	set	0x60, %o0
	stxa	%l5,	[%l7 + %o0] 0x81
	set	0x44, %g5
	lda	[%l7 + %g5] 0x88,	%f11
	set	0x5F, %o3
	ldstuba	[%l7 + %o3] 0x88,	%i0
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x08, %l1
	stx	%g1,	[%l7 + %l1]
	set	0x7C, %i1
	swapa	[%l7 + %i1] 0x88,	%g5
	nop
	set	0x48, %o1
	swap	[%l7 + %o1],	%i3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f16
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%g6
	set	0x2C, %g4
	stha	%l1,	[%l7 + %g4] 0x88
	nop
	set	0x68, %o5
	std	%f12,	[%l7 + %o5]
	wr	%i2,	%i5,	%softint
	and	%l2,	%l3,	%i4
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f20
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xe2,	%o2
	nop
	set	0x2A, %i6
	ldub	[%l7 + %i6],	%o1
	nop
	set	0x28, %g3
	stx	%fsr,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x10, %l5
	stx	%g4,	[%l7 + %l5]
	st	%f2,	[%l7 + 0x70]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDDD, 	%tick_cmpr
	nop
	set	0x14, %o4
	stw	%g3,	[%l7 + %o4]
	set	0x2A, %l4
	stha	%o0,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%g7
	nop
	set	0x28, %g7
	std	%i6,	[%l7 + %g7]
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f6
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x88,	%o7
	set	0x70, %i5
	stwa	%g2,	[%l7 + %i5] 0x80
	set	0x50, %i4
	lda	[%l7 + %i4] 0x81,	%f15
	add	%o6,	%l4,	%l5
	nop
	set	0x70, %l0
	lduh	[%l7 + %l0],	%i7
	nop
	set	0x78, %i3
	lduw	[%l7 + %i3],	%g1
	set	0x60, %i0
	swapa	[%l7 + %i0] 0x80,	%i0
	add	%i3,	%o5,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%l1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x89
	set	0x18, %g6
	stda	%i2,	[%l7 + %g6] 0x89
	set	0x30, %l2
	stda	%i4,	[%l7 + %l2] 0x89
	wr	%l3,	%i4,	%set_softint
	set	0x3C, %o0
	stha	%l2,	[%l7 + %o0] 0x81
	nop
	set	0x60, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%g4
	nop
	set	0x3C, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x5C, %i1
	lda	[%l7 + %i1] 0x88,	%f29
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x78, %o1
	ldsw	[%l7 + %o1],	%o2
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x88,	%o4
	set	0x20, %o5
	stha	%g3,	[%l7 + %o5] 0x89
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x80,	%o0
	set	0x10, %o6
	swapa	[%l7 + %o6] 0x80,	%l0
	nop
	set	0x3A, %i6
	lduh	[%l7 + %i6],	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%f11,	[%l7 + 0x2C]
	set	0x35, %i2
	stba	%o7,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x44, %l5
	ldsw	[%l7 + %l5],	%g2
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x80,	%l4
	nop
	set	0x5C, %l4
	swap	[%l7 + %l4],	%o6
	set	0x68, %o4
	stda	%i6,	[%l7 + %o4] 0x80
	nop
	set	0x66, %l3
	ldstub	[%l7 + %l3],	%l5
	or	%i0,	%g1,	%i3
	set	0x76, %g7
	stha	%g5,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	nop
	set	0x10, %i4
	ldsb	[%l7 + %i4],	%o5
	nop
	set	0x30, %l6
	std	%l0,	[%l7 + %l6]
	add	%i5,	%l3,	%i4
	add	%l2,	%i2,	%o1
	set	0x34, %l0
	lda	[%l7 + %l0] 0x81,	%f3
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x14, %i0
	ldsb	[%l7 + %i0],	%i6
	set	0x30, %i3
	sta	%f11,	[%l7 + %i3] 0x81
	nop
	set	0x20, %g2
	stw	%g4,	[%l7 + %g2]
	set	0x3E, %l2
	stha	%o3,	[%l7 + %l2] 0x81
	set	0x4C, %g6
	sta	%f6,	[%l7 + %g6] 0x80
	nop
	set	0x63, %o0
	ldstub	[%l7 + %o0],	%o4
	nop
	set	0x1D, %o7
	stb	%o2,	[%l7 + %o7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%g3
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%g6
	nop
	set	0x6A, %i1
	lduh	[%l7 + %i1],	%l0
	or	%i1,	%o7,	%g2
	set	0x20, %o3
	ldxa	[%l7 + %o3] 0x89,	%l4
	nop
	set	0x5C, %g5
	swap	[%l7 + %g5],	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i7
	set	0x58, %o1
	stha	%l5,	[%l7 + %o1] 0x89
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x18, %o2
	std	%f0,	[%l7 + %o2]
	nop
	set	0x60, %o5
	lduw	[%l7 + %o5],	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%g5
	nop
	set	0x37, %g4
	ldstub	[%l7 + %g4],	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%g6
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe3,	%i4
	be,pt	%icc,	loop_99
	st	%f0,	[%l7 + 0x5C]
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%f2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f16
loop_99:
	add	%l3,	%i4,	%l2
	nop
	set	0x0C, %i2
	swap	[%l7 + %i2],	%l1
	nop
	set	0x10, %l4
	stx	%o1,	[%l7 + %l4]
	nop
	set	0x38, %o4
	lduh	[%l7 + %o4],	%i6
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f28
	set	0x08, %g7
	stxa	%g4,	[%l7 + %g7] 0x80
	bleu,a	%icc,	loop_100
	and	%o3,	%o4,	%o2
	set	0x1C, %l3
	swapa	[%l7 + %l3] 0x88,	%o0
loop_100:
	fpsub32s	%f11,	%f5,	%f21
	st	%f14,	[%l7 + 0x40]
	nop
	set	0x5C, %g1
	ldsw	[%l7 + %g1],	%g3
	and	%i2,	%l0,	%g7
	fpadd32	%f4,	%f14,	%f22
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x81,	 3
	nop
	set	0x1C, %i7
	ldsh	[%l7 + %i7],	%o7
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%g2
	nop
	set	0x2A, %l6
	lduh	[%l7 + %l6],	%o6
	nop
	set	0x7F, %l0
	stb	%l4,	[%l7 + %l0]
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x81,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%g5
	set	0x78, %g2
	ldxa	[%l7 + %g2] 0x89,	%i0
	set	0x5E, %l2
	stha	%o5,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x78, %i0
	std	%i2,	[%l7 + %i0]
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x88,	%i4
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x50, %l1
	sth	%g6,	[%l7 + %l1]
	nop
	set	0x10, %i1
	ldub	[%l7 + %i1],	%l3
	set	0x74, %g6
	stha	%i4,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x38, %g5
	stxa	%l1,	[%l7 + %g5] 0x88
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%o0
	set	0x47, %o1
	stba	%l2,	[%l7 + %o1] 0x89
	set	0x08, %o2
	lda	[%l7 + %o2] 0x81,	%f30
	nop
	set	0x64, %o5
	ldub	[%l7 + %o5],	%g4
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f16
	and	%i6,	%o4,	%o3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f16
	fpadd32	%f2,	%f18,	%f24
	nop
	set	0x58, %o6
	stx	%o2,	[%l7 + %o6]
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%o0
	or	%i2,	%g3,	%g7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%l0
	nop
	set	0x72, %l4
	sth	%o7,	[%l7 + %l4]
	nop
	nop
	setx	0xA7FFBBD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC8DA1BFD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f4,	%f18
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f16
	and	%g2,	%l4,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%l5
	ld	[%l7 + 0x14],	%f16
	set	0x60, %i2
	lda	[%l7 + %i2] 0x89,	%f28
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%g1
	ld	[%l7 + 0x08],	%f18
	st	%f6,	[%l7 + 0x18]
	nop
	set	0x3C, %g7
	ldsb	[%l7 + %g7],	%i0
	bg,pt	%icc,	loop_101
	nop
	set	0x0C, %g3
	prefetch	[%l7 + %g3],	 2
	wr	%g5,	%o5,	%y
	nop
	set	0x58, %l3
	stx	%fsr,	[%l7 + %l3]
loop_101:
	or	%i5,	%g6,	%i3
	nop
	set	0x2C, %g1
	lduh	[%l7 + %g1],	%l3
	set	0x58, %i5
	stwa	%i4,	[%l7 + %i5] 0x81
	set	0x08, %i7
	stda	%o0,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x80,	%l1
	nop
	set	0x44, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x58, %i4
	stha	%l2,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x70, %g2
	ldsw	[%l7 + %g2],	%g4
	nop
	set	0x70, %i3
	stx	%i6,	[%l7 + %i3]
	nop
	set	0x20, %l2
	std	%f4,	[%l7 + %l2]
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%o4
	nop
	set	0x7B, %i0
	ldstub	[%l7 + %i0],	%o2
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%o2
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xe3,	%o0
	nop
	set	0x28, %o7
	std	%f14,	[%l7 + %o7]
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g7
	nop
	set	0x10, %g5
	stw	%l0,	[%l7 + %g5]
	nop
	set	0x6C, %o3
	ldsh	[%l7 + %o3],	%o7
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x35, %o2
	ldsb	[%l7 + %o2],	%g2
	set	0x08, %o5
	stwa	%i1,	[%l7 + %o5] 0x89
	nop
	set	0x18, %g4
	std	%f30,	[%l7 + %g4]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%o6
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	st	%f13,	[%l7 + 0x1C]
	ble,a,pt	%xcc,	loop_102
	and	%l4,	%l5,	%l6
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%i0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f0
loop_102:
	nop
	set	0x14, %o1
	swapa	[%l7 + %o1] 0x80,	%g1
	fpsub16	%f22,	%f10,	%f2
	add	%g5,	%o5,	%i5
	nop
	set	0x70, %o4
	lduh	[%l7 + %o4],	%g6
	st	%f7,	[%l7 + 0x34]
	wr 	%g0, 	0x7, 	%fprs
	st	%f17,	[%l7 + 0x68]
	set	0x75, %l4
	ldstuba	[%l7 + %l4] 0x80,	%i3
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %g3
	lda	[%l7 + %g3] 0x81,	%f1
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%l1
	nop
	set	0x1C, %g1
	ldsw	[%l7 + %g1],	%l2
	nop
	set	0x78, %l3
	ldsb	[%l7 + %l3],	%o1
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%g4
	nop
	set	0x08, %l6
	stx	%o4,	[%l7 + %l6]
	nop
	set	0x58, %i5
	stw	%i6,	[%l7 + %i5]
	nop
	set	0x68, %l0
	lduh	[%l7 + %l0],	%o3
	set	0x08, %i4
	lda	[%l7 + %i4] 0x80,	%f10
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x6C, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o2
	nop
	set	0x78, %i3
	std	%f2,	[%l7 + %i3]
	nop
	set	0x28, %o0
	ldsh	[%l7 + %o0],	%o0
	set	0x24, %i0
	stha	%g3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x14, %l1
	sth	%i2,	[%l7 + %l1]
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%l0
	nop
	set	0x56, %o7
	lduh	[%l7 + %o7],	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%i1
	set	0x20, %g6
	stxa	%i7,	[%l7 + %g6] 0x88
	fpsub16	%f18,	%f4,	%f20
	nop
	set	0x3C, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x68, %g5
	std	%f18,	[%l7 + %g5]
	and	%o6,	%g2,	%l4
	nop
	set	0x58, %o2
	std	%f12,	[%l7 + %o2]
	nop
	set	0x0C, %o5
	ldsw	[%l7 + %o5],	%l5
	nop
	set	0x26, %g4
	stb	%l6,	[%l7 + %g4]
	nop
	set	0x62, %i6
	sth	%g1,	[%l7 + %i6]
	nop
	set	0x20, %l5
	std	%f18,	[%l7 + %l5]
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%i0
	bleu,a,pn	%icc,	loop_103
	nop
	set	0x50, %o1
	std	%g4,	[%l7 + %o1]
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%g6
loop_103:
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f10
	st	%f30,	[%l7 + 0x64]
	set	0x28, %g3
	stba	%l3,	[%l7 + %g3] 0x80
	nop
	set	0x20, %i2
	stw	%i4,	[%l7 + %i2]
	nop
	set	0x50, %g1
	ldstub	[%l7 + %g1],	%i3
	nop
	nop
	setx	0x167F7E998EE2463F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2D0E5231646BFEF1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f4
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc8
	nop
	set	0x10, %i7
	std	%f12,	[%l7 + %i7]
	set	0x34, %l3
	stha	%l2,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x61, %l6
	stba	%o1,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x42, %i5
	ldub	[%l7 + %i5],	%g4
	set	0x50, %i4
	stba	%l1,	[%l7 + %i4] 0x80
	st	%fsr,	[%l7 + 0x44]
	set	0x6A, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o4
	fpadd32	%f14,	%f12,	%f12
	set	0x6C, %l2
	stwa	%i6,	[%l7 + %l2] 0x88
	nop
	set	0x50, %l0
	std	%o2,	[%l7 + %l0]
	nop
	set	0x18, %o0
	lduw	[%l7 + %o0],	%o0
	nop
	set	0x68, %i0
	ldx	[%l7 + %i0],	%o3
	nop
	set	0x40, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x4B, %l1
	ldstub	[%l7 + %l1],	%i2
	nop
	set	0x72, %i1
	ldstub	[%l7 + %i1],	%g3
	nop
	set	0x1A, %o7
	ldub	[%l7 + %o7],	%l0
	set	0x18, %g6
	lda	[%l7 + %g6] 0x81,	%f7
	set	0x2C, %g5
	stba	%g7,	[%l7 + %g5] 0xeb
	membar	#Sync
	st	%f8,	[%l7 + 0x18]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%i7
	and	%i1,	%g2,	%o6
	set	0x24, %o3
	stwa	%l5,	[%l7 + %o3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x24],	%f25
	fpsub32	%f6,	%f2,	%f10
	nop
	set	0x70, %o2
	std	%l4,	[%l7 + %o2]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	nop
	set	0x76, %i6
	sth	%l6,	[%l7 + %i6]
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%g0
	add	%g5,	%i0,	%i5
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f2
	fpadd16	%f4,	%f4,	%f4
	nop
	set	0x30, %o1
	ldx	[%l7 + %o1],	%g6
	nop
	set	0x24, %l4
	lduh	[%l7 + %l4],	%o5
	set	0x48, %o4
	stba	%l3,	[%l7 + %o4] 0x80
	set	0x08, %g3
	sta	%f8,	[%l7 + %g3] 0x81
	nop
	set	0x68, %l5
	stx	%i3,	[%l7 + %l5]
	nop
	set	0x1A, %i2
	stb	%l2,	[%l7 + %i2]
	set	0x10, %g1
	sta	%f2,	[%l7 + %g1] 0x81
	nop
	set	0x12, %i7
	sth	%o1,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f16
	nop
	set	0x11, %l6
	ldub	[%l7 + %l6],	%i4
	set	0x10, %g7
	stxa	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x08, %i4
	ldxa	[%l7 + %i4] 0x81,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%o2
	nop
	set	0x45, %i5
	ldstub	[%l7 + %i5],	%i6
	and	%o0,	%i2,	%o3
	nop
	set	0x5C, %l2
	lduh	[%l7 + %l2],	%l0
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x89,	%g2
	nop
	set	0x60, %o0
	std	%f14,	[%l7 + %o0]
	set	0x1C, %g2
	sta	%f3,	[%l7 + %g2] 0x81
	add	%g7,	%i7,	%i1
	nop
	set	0x30, %i0
	std	%g2,	[%l7 + %i0]
	nop
	nop
	setx	0xD31D9263,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC4DA3457,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f19,	%f2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%o7
	nop
	set	0x08, %i3
	std	%l4,	[%l7 + %i3]
	nop
	set	0x3B, %l1
	ldstub	[%l7 + %l1],	%l4
	set	0x20, %o7
	lda	[%l7 + %o7] 0x81,	%f4
	nop
	set	0x16, %i1
	ldsh	[%l7 + %i1],	%l6
	set	0x6C, %g5
	stba	%g5,	[%l7 + %g5] 0xe3
	membar	#Sync
	add	%g1,	%i0,	%i5
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f6
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f18
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x80
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%o5
	set	0x5A, %i6
	stba	%l3,	[%l7 + %i6] 0x89
	set	0x6C, %o6
	stwa	%i3,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x10, %g4
	stwa	%g6,	[%l7 + %g4] 0x89
	set	0x2C, %o1
	stha	%o1,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%l2
	add	%g4,	%o4,	%l1
	nop
	nop
	setx	0xCB8C803345E302D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x55E30CF528ABFE84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f6,	%f26
	wr	%i6,	%o2,	%set_softint
	set	0x50, %l4
	stxa	%i2,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x4E, %g3
	ldstub	[%l7 + %g3],	%o3
	nop
	set	0x78, %o4
	lduw	[%l7 + %o4],	%l0
	nop
	set	0x0E, %i2
	ldsh	[%l7 + %i2],	%g3
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f10
	set	0x64, %l5
	stwa	%o0,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x68, %l6
	stxa	%g7,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x1A, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i1
	nop
	set	0x1E, %g7
	ldub	[%l7 + %g7],	%i7
	set	0x54, %i4
	sta	%f14,	[%l7 + %i4] 0x89
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%o7
	nop
	set	0x50, %l2
	stx	%l5,	[%l7 + %l2]
	nop
	set	0x30, %l0
	std	%f26,	[%l7 + %l0]
	set	0x30, %o0
	swapa	[%l7 + %o0] 0x88,	%l4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g2
	nop
	set	0x35, %i5
	stb	%g5,	[%l7 + %i5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i5
	add	%o5,	%l3,	%i3
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xda
	nop
	set	0x1D, %l1
	ldsb	[%l7 + %l1],	%g6
	ble,a,pn	%icc,	loop_104
	st	%f5,	[%l7 + 0x10]
	set	0x54, %g2
	stba	%o1,	[%l7 + %g2] 0x89
loop_104:
	st	%f6,	[%l7 + 0x5C]
	nop
	set	0x24, %i1
	ldub	[%l7 + %i1],	%i0
	set	0x42, %o7
	stba	%l2,	[%l7 + %o7] 0x88
	set	0x14, %g6
	stwa	%g4,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x28, %o2
	lduh	[%l7 + %o2],	%o4
	nop
	set	0x7C, %g5
	stw	%l1,	[%l7 + %g5]
	nop
	set	0x58, %o3
	ldx	[%l7 + %o3],	%i4
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f20
	nop
	set	0x27, %i6
	stb	%i6,	[%l7 + %i6]
	set	0x30, %g4
	stwa	%i2,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf9
	membar	#Sync
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x80,	%f26
	or	%o2,	%l0,	%g3
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%o0
	or	%g7,	%i1,	%o6
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x81,	%o6
	nop
	set	0x30, %g1
	stb	%i7,	[%l7 + %g1]
	nop
	set	0x10, %i2
	std	%l4,	[%l7 + %i2]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g2
	nop
	set	0x48, %l3
	std	%g4,	[%l7 + %l3]
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%l4
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x80,	%g1
	set	0x68, %g7
	sta	%f24,	[%l7 + %g7] 0x80
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f4
	or	%i5,	%l3,	%o5
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%g6
	ld	[%l7 + 0x7C],	%f2
	nop
	set	0x4E, %l0
	ldsb	[%l7 + %l0],	%i3
	nop
	set	0x58, %o0
	prefetch	[%l7 + %o0],	 0
	set	0x7C, %i5
	sta	%f11,	[%l7 + %i5] 0x80
	nop
	set	0x30, %i0
	ldstub	[%l7 + %i0],	%i0
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x4C, %l1
	lduh	[%l7 + %l1],	%g4
	nop
	set	0x58, %l5
	stx	%o4,	[%l7 + %l5]
	nop
	set	0x68, %g2
	stx	%l1,	[%l7 + %g2]
	set	0x37, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l2
	ld	[%l7 + 0x58],	%f16
	nop
	set	0x68, %g6
	prefetch	[%l7 + %g6],	 2
	set	0x78, %o2
	stda	%i6,	[%l7 + %o2] 0xe2
	membar	#Sync
	st	%f14,	[%l7 + 0x2C]
	or	%i2,	%o3,	%o2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%l0
	set	0x3A, %o3
	stha	%i4,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%o0
	nop
	set	0x36, %o5
	ldsh	[%l7 + %o5],	%i1
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%g7
	set	0x4F, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o7
	nop
	set	0x40, %g4
	stw	%o6,	[%l7 + %g4]
	nop
	set	0x60, %o6
	ldsb	[%l7 + %o6],	%i7
	nop
	set	0x18, %g3
	stx	%fsr,	[%l7 + %g3]
	ld	[%l7 + 0x4C],	%f2
	nop
	set	0x10, %l4
	stw	%l5,	[%l7 + %l4]
	set	0x54, %o4
	stwa	%l6,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%g4
	set	0x2C, %o1
	stwa	%g2,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%l4,	%g1,	%l3
	nop
	set	0x40, %l3
	std	%o4,	[%l7 + %l3]
	ld	[%l7 + 0x68],	%f12
	nop
	set	0x0B, %i2
	ldstub	[%l7 + %i2],	%g6
	bleu,a	%xcc,	loop_105
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%i5
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%i0
	nop
	set	0x31, %i7
	ldstub	[%l7 + %i7],	%o1
loop_105:
	nop
	set	0x48, %i4
	stxa	%g4,	[%l7 + %i4] 0xe2
	membar	#Sync
	fpsub16s	%f9,	%f18,	%f14
	set	0x2E, %l0
	stha	%o4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x18, %l2
	stx	%l1,	[%l7 + %l2]
	set	0x15, %i5
	stba	%i3,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x38, %o0
	lduw	[%l7 + %o0],	%l2
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 4
	add	%i2,	%o3,	%i6
	set	0x20, %i0
	stxa	%l0,	[%l7 + %i0] 0x81
	ld	[%l7 + 0x60],	%f31
	nop
	set	0x24, %l1
	ldsw	[%l7 + %l1],	%o2
	nop
	set	0x56, %g2
	sth	%g3,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%o0
	nop
	set	0x5E, %i1
	stb	%i4,	[%l7 + %i1]
	set	0x58, %g6
	stxa	%g7,	[%l7 + %g6] 0x89
	set	0x2C, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i1
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x58, %g5
	sta	%f17,	[%l7 + %g5] 0x89
	nop
	set	0x77, %o5
	ldub	[%l7 + %o5],	%o6
	nop
	set	0x38, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x08, %i6
	stwa	%i7,	[%l7 + %i6] 0x81
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	nop
	set	0x5C, %g3
	ldsh	[%l7 + %g3],	%o7
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%i6
	st	%fsr,	[%l7 + 0x48]
	fpadd16s	%f22,	%f27,	%f26
	ld	[%l7 + 0x40],	%f24
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%g5
	ld	[%l7 + 0x6C],	%f28
	set	0x74, %g1
	lda	[%l7 + %g1] 0x81,	%f22
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x89,	%l4
	nop
	set	0x7E, %o4
	ldsh	[%l7 + %o4],	%g2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f16
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x89,	%l4
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%l3
	ld	[%l7 + 0x30],	%f15
	nop
	set	0x59, %g7
	ldstub	[%l7 + %g7],	%g1
	ld	[%l7 + 0x14],	%f2
	set	0x0D, %i7
	ldstuba	[%l7 + %i7] 0x88,	%o5
	set	0x62, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g6
	set	0x60, %l2
	stxa	%i5,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x18, %i5
	stx	%i0,	[%l7 + %i5]
	nop
	set	0x57, %o0
	ldstub	[%l7 + %o0],	%o1
	or	%g4,	%l1,	%i3
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x80,	%l2
	or	%i2,	%o4,	%i6
	set	0x13, %i0
	ldstuba	[%l7 + %i0] 0x81,	%o3
	nop
	set	0x58, %l1
	stw	%o2,	[%l7 + %l1]
	set	0x20, %l0
	swapa	[%l7 + %l0] 0x81,	%g3
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x89,	%l0
	nop
	set	0x32, %g6
	sth	%o0,	[%l7 + %g6]
	nop
	set	0x23, %l5
	ldsb	[%l7 + %l5],	%g7
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%i4
	nop
	set	0x20, %o5
	stx	%i1,	[%l7 + %o5]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xe3,	%i6
	nop
	set	0x1A, %o7
	sth	%o7,	[%l7 + %o7]
	nop
	set	0x20, %i6
	ldsw	[%l7 + %i6],	%o6
	nop
	set	0x62, %o6
	lduh	[%l7 + %o6],	%g5
	add	%l5,	%l6,	%g2
	set	0x58, %g3
	stwa	%l4,	[%l7 + %g3] 0x81
	bg,pn	%xcc,	loop_106
	nop
	set	0x56, %l4
	lduh	[%l7 + %l4],	%g1
	nop
	set	0x1C, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x78, %o1
	lda	[%l7 + %o1] 0x89,	%f3
loop_106:
	nop
	set	0x10, %o4
	stha	%o5,	[%l7 + %o4] 0x80
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x28, %i2
	stwa	%g6,	[%l7 + %i2] 0xe3
	membar	#Sync
	ld	[%l7 + 0x68],	%f31
	wr	%i5,	%i0,	%pic
	nop
	set	0x62, %l6
	lduh	[%l7 + %l6],	%o1
	nop
	set	0x58, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
	set	0x5E, %i4
	stha	%l3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x5C, %i7
	stw	%g4,	[%l7 + %i7]
	add	%l1,	%l2,	%i2
	nop
	set	0x28, %l2
	swap	[%l7 + %l2],	%o4
	set	0x30, %i5
	stxa	%i3,	[%l7 + %i5] 0x81
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%o3
	wr	%g3,	%o0,	%set_softint
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x89,	 2
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%g7
	nop
	set	0x20, %o0
	stw	%i4,	[%l7 + %o0]
	nop
	set	0x18, %l0
	stb	%i7,	[%l7 + %l0]
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x81,	 4
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%o6
	nop
	set	0x28, %g2
	ldsw	[%l7 + %g2],	%g5
	set	0x4C, %l5
	sta	%f3,	[%l7 + %l5] 0x88
	and	%o7,	%l5,	%l6
	and	%l4,	%g2,	%g1
	set	0x44, %o3
	sta	%f11,	[%l7 + %o3] 0x80
	nop
	set	0x46, %o5
	ldsh	[%l7 + %o5],	%g6
	set	0x20, %o2
	lda	[%l7 + %o2] 0x88,	%f26
	set	0x28, %o7
	lda	[%l7 + %o7] 0x80,	%f6
	st	%f16,	[%l7 + 0x28]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%i0
	nop
	set	0x7E, %g5
	ldstub	[%l7 + %g5],	%o5
	and	%l3,	%g4,	%o1
	nop
	set	0x34, %o6
	ldstub	[%l7 + %o6],	%l2
	nop
	set	0x4D, %i6
	ldstub	[%l7 + %i6],	%i2
	bleu,a	%icc,	loop_107
	nop
	set	0x08, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x5C, %g1
	lda	[%l7 + %g1] 0x80,	%f13
loop_107:
	nop
	set	0x14, %o1
	prefetch	[%l7 + %o1],	 4
	st	%fsr,	[%l7 + 0x24]
	st	%f28,	[%l7 + 0x50]
	nop
	set	0x5D, %o4
	ldstub	[%l7 + %o4],	%l1
	set	0x0A, %g4
	stha	%i3,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x13, %l4
	stba	%i6,	[%l7 + %l4] 0x88
	nop
	set	0x1E, %l6
	ldsb	[%l7 + %l6],	%o2
	set	0x5C, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o4
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%o3
	nop
	set	0x50, %i2
	stx	%o0,	[%l7 + %i2]
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%g2
	set	0x34, %l2
	sta	%f15,	[%l7 + %l2] 0x81
	set	0x40, %i7
	stha	%l0,	[%l7 + %i7] 0x89
	st	%f22,	[%l7 + 0x20]
	nop
	set	0x70, %i3
	ldub	[%l7 + %i3],	%g7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f16
	st	%f7,	[%l7 + 0x70]
	nop
	set	0x60, %i0
	stx	%i7,	[%l7 + %i0]
	nop
	set	0x31, %l1
	ldsb	[%l7 + %l1],	%i1
	nop
	set	0x78, %o0
	std	%f24,	[%l7 + %o0]
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x80,	%o6
	set	0x28, %i1
	stwa	%g5,	[%l7 + %i1] 0x81
	add	%o7,	%i4,	%l6
	nop
	set	0x40, %g2
	stx	%l5,	[%l7 + %g2]
	set	0x50, %g6
	stxa	%l4,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	fpsub16s	%f28,	%f9,	%f11
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%g6
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%i5
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%o5
	nop
	set	0x40, %o7
	swap	[%l7 + %o7],	%i0
	set	0x50, %o6
	lda	[%l7 + %o6] 0x81,	%f23
	set	0x18, %g5
	swapa	[%l7 + %g5] 0x81,	%l3
	nop
	set	0x14, %i6
	ldsw	[%l7 + %i6],	%o1
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f18
	nop
	set	0x60, %o1
	std	%f16,	[%l7 + %o1]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f16
	set	0x44, %o4
	sta	%f31,	[%l7 + %o4] 0x80
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i2
	nop
	set	0x20, %g4
	ldx	[%l7 + %g4],	%l1
	nop
	set	0x10, %l4
	ldsb	[%l7 + %l4],	%l2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	nop
	set	0x71, %l3
	ldstub	[%l7 + %l3],	%i6
	set	0x74, %l6
	stwa	%o2,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x18, %i4
	swap	[%l7 + %i4],	%o4
	nop
	set	0x0C, %i2
	stw	%i3,	[%l7 + %i2]
	set	0x78, %i7
	swapa	[%l7 + %i7] 0x88,	%o0
	and	%o3,	%l0,	%g7
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%g3
	nop
	set	0x4A, %i5
	lduh	[%l7 + %i5],	%i1
	set	0x44, %i0
	stha	%i7,	[%l7 + %i0] 0x81
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x81,	 3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%i4
	wr	%o6,	%l5,	%clear_softint
	set	0x44, %l1
	sta	%f3,	[%l7 + %l1] 0x81
	nop
	set	0x50, %o0
	swap	[%l7 + %o0],	%l4
	nop
	set	0x70, %l0
	std	%g0,	[%l7 + %l0]
	nop
	set	0x6C, %i1
	ldsh	[%l7 + %i1],	%g2
	set	0x18, %g2
	stxa	%l6,	[%l7 + %g2] 0x80
	and	%g6,	%i5,	%i0
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0
	or	%o5,	%o1,	%i2
	st	%fsr,	[%l7 + 0x70]
	bgu,a,pt	%icc,	loop_108
	nop
	set	0x70, %g6
	std	%g4,	[%l7 + %g6]
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x81,	%l1
loop_108:
	nop
	set	0x68, %o5
	std	%f26,	[%l7 + %o5]
	set	0x08, %l5
	stha	%i6,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%o2
	set	0x4C, %g5
	swapa	[%l7 + %g5] 0x88,	%l2
	nop
	set	0x72, %i6
	lduh	[%l7 + %i6],	%i3
	nop
	set	0x54, %g3
	prefetch	[%l7 + %g3],	 0
	or	%o4,	%o3,	%o0
	set	0x70, %o1
	sta	%f17,	[%l7 + %o1] 0x80
	nop
	set	0x35, %o6
	ldsb	[%l7 + %o6],	%g7
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x88,	%g2
	nop
	set	0x20, %g1
	ldsw	[%l7 + %g1],	%l0
	nop
	set	0x24, %g4
	ldsb	[%l7 + %g4],	%i1
	set	0x28, %l4
	sta	%f20,	[%l7 + %l4] 0x89
	st	%f31,	[%l7 + 0x64]
	nop
	set	0x25, %l3
	ldub	[%l7 + %l3],	%g5
	st	%f30,	[%l7 + 0x08]
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x88,	%f24
	nop
	set	0x0A, %l6
	lduh	[%l7 + %l6],	%i7
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x81,	%i4
	set	0x64, %i7
	stha	%o6,	[%l7 + %i7] 0x81
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	set	0x70, %i5
	sta	%f4,	[%l7 + %i5] 0x80
	nop
	set	0x4A, %i4
	sth	%l5,	[%l7 + %i4]
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%l4
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	nop
	set	0x3E, %l2
	ldub	[%l7 + %l2],	%g1
	nop
	set	0x6B, %l0
	ldsb	[%l7 + %l0],	%g2
	set	0x28, %i1
	stwa	%g6,	[%l7 + %i1] 0x80
	nop
	set	0x6C, %g2
	ldub	[%l7 + %g2],	%l6
	set	0x20, %o0
	stda	%i0,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x08, %o3
	std	%l2,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x5C]
	and	%i5,	%o1,	%o5
	nop
	set	0x21, %g6
	ldsb	[%l7 + %g6],	%i2
	nop
	set	0x2A, %o2
	lduh	[%l7 + %o2],	%g4
	nop
	set	0x39, %o5
	ldsb	[%l7 + %o5],	%l1
	wr	%o2,	%l2,	%softint
	ld	[%l7 + 0x5C],	%f26
	nop
	set	0x57, %o7
	ldsb	[%l7 + %o7],	%i3
	nop
	set	0x50, %g5
	stb	%o4,	[%l7 + %g5]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o3
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x89,	%o0
	nop
	set	0x30, %g3
	std	%f22,	[%l7 + %g3]
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x88,	%g2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f0
	set	0x36, %o6
	stha	%l0,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%g7
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%g4
	nop
	set	0x28, %l4
	prefetch	[%l7 + %l4],	 4
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f0
	nop
	set	0x09, %l3
	ldsb	[%l7 + %l3],	%i1
	bl	%xcc,	loop_109
	nop
	set	0x68, %l6
	ldsh	[%l7 + %l6],	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%l5
loop_109:
	and	%o6,	%l4,	%g1
	set	0x29, %i7
	stba	%g2,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x18, %i2
	lda	[%l7 + %i2] 0x89,	%f27
	nop
	set	0x50, %i3
	std	%g6,	[%l7 + %i3]
	nop
	set	0x50, %i4
	ldstub	[%l7 + %i4],	%l6
	add	%o7,	%i0,	%i5
	set	0x0A, %i5
	stba	%o1,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x10, %i0
	lda	[%l7 + %i0] 0x89,	%f22
	nop
	set	0x37, %l1
	ldsb	[%l7 + %l1],	%l3
	nop
	set	0x28, %l0
	std	%f4,	[%l7 + %l0]
	nop
	set	0x6F, %i1
	ldsb	[%l7 + %i1],	%i2
	set	0x38, %l2
	sta	%f11,	[%l7 + %l2] 0x81
	nop
	set	0x6E, %o0
	ldsh	[%l7 + %o0],	%o5
	and	%g4,	%o2,	%l1
	set	0x2C, %o3
	sta	%f13,	[%l7 + %o3] 0x81
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x81,	%l2
	nop
	set	0x1C, %o2
	ldsw	[%l7 + %o2],	%o4
	nop
	set	0x40, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x40, %g2
	stxa	%i6,	[%l7 + %g2] 0x81
	set	0x48, %o7
	swapa	[%l7 + %o7] 0x81,	%o3
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%i2
	set	0x22, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o0
	nop
	set	0x12, %l5
	stb	%l0,	[%l7 + %l5]
	nop
	set	0x20, %g3
	stx	%g7,	[%l7 + %g3]
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x80,	%g5
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%i1
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x80,	 1
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x81,	 3
	nop
	set	0x10, %l4
	ldx	[%l7 + %l4],	%l5
	set	0x64, %g4
	stwa	%i4,	[%l7 + %g4] 0xeb
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o6
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f0
	set	0x18, %l6
	stwa	%g2,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x60, %i7
	stx	%g6,	[%l7 + %i7]
	nop
	set	0x44, %l3
	sth	%g1,	[%l7 + %l3]
	set	0x4A, %i3
	stha	%o7,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x50, %i4
	stda	%i6,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x20, %i5
	ldsw	[%l7 + %i5],	%i0
	set	0x58, %i2
	stxa	%i5,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x38, %i0
	swap	[%l7 + %i0],	%o1
	set	0x60, %l1
	stda	%i2,	[%l7 + %l1] 0xeb
	membar	#Sync
	or	%o5,	%l3,	%o2
	set	0x3C, %l0
	sta	%f2,	[%l7 + %l0] 0x88
	set	0x38, %i1
	stxa	%l1,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%l2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf8
	membar	#Sync
	set	0x60, %g6
	stda	%g4,	[%l7 + %g6] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f0
	fpadd16	%f16,	%f4,	%f28
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x30, %o2
	stwa	%i6,	[%l7 + %o2] 0x80
	nop
	set	0x3F, %g2
	ldub	[%l7 + %g2],	%o4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%i3
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f22
	nop
	set	0x6C, %o7
	lduw	[%l7 + %o7],	%l0
	nop
	set	0x7C, %i6
	ldsh	[%l7 + %i6],	%g7
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x89,	%o0
	nop
	set	0x4C, %l5
	lduw	[%l7 + %l5],	%i1
	set	0x78, %o6
	swapa	[%l7 + %o6] 0x81,	%g3
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f8
	nop
	set	0x78, %o4
	stx	%g5,	[%l7 + %o4]
	st	%f5,	[%l7 + 0x24]
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x80,	%l4
	nop
	set	0x34, %g1
	sth	%i4,	[%l7 + %g1]
	nop
	set	0x28, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	bgu,a,pt	%icc,	loop_110
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f12
	nop
	set	0x42, %l3
	stb	%l4,	[%l7 + %l3]
	add	%i7,	%g2,	%g6
loop_110:
	nop
	set	0x32, %i3
	ldub	[%l7 + %i3],	%o6
	nop
	set	0x60, %i4
	swap	[%l7 + %i4],	%g1
	nop
	set	0x78, %i5
	std	%f4,	[%l7 + %i5]
	nop
	set	0x68, %i2
	ldx	[%l7 + %i2],	%o7
	nop
	set	0x30, %i7
	ldsw	[%l7 + %i7],	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%i5
	wr 	%g0, 	0x4, 	%fprs
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf1
	membar	#Sync
	nop
	set	0x28, %l0
	std	%l2,	[%l7 + %l0]
	and	%i2,	%l1,	%l2
	st	%f31,	[%l7 + 0x28]
	nop
	set	0x50, %i1
	std	%o2,	[%l7 + %i1]
	nop
	set	0x75, %o0
	ldsb	[%l7 + %o0],	%i6
	set	0x48, %l1
	sta	%f18,	[%l7 + %l1] 0x89
	st	%fsr,	[%l7 + 0x74]
	fpadd32	%f22,	%f6,	%f4
	nop
	set	0x70, %g6
	ldstub	[%l7 + %g6],	%o4
	nop
	set	0x10, %o3
	sth	%g4,	[%l7 + %o3]
	set	0x58, %o5
	stda	%i2,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x20, %l2
	stx	%o3,	[%l7 + %l2]
	bleu,a	%xcc,	loop_111
	nop
	set	0x60, %o2
	lduh	[%l7 + %o2],	%g7
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x89,	 2
loop_111:
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x40, %i6
	ldxa	[%l7 + %i6] 0x89,	%i1
	nop
	set	0x50, %o7
	stx	%o0,	[%l7 + %o7]
	nop
	set	0x69, %g3
	ldstub	[%l7 + %g3],	%g3
	ld	[%l7 + 0x0C],	%f25
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g5
	ld	[%l7 + 0x54],	%f9
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	or	%l4,	%i4,	%i7
	set	0x28, %o6
	lda	[%l7 + %o6] 0x88,	%f2
	nop
	set	0x15, %o1
	ldstub	[%l7 + %o1],	%g2
	set	0x48, %l4
	stwa	%g6,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	set	0x60, %g1
	swapa	[%l7 + %g1] 0x81,	%o6
	nop
	set	0x0A, %g7
	ldsh	[%l7 + %g7],	%o7
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x81,	%i6
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x0C, %g4
	lduw	[%l7 + %g4],	%g1
	set	0x77, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o1
	add	%i5,	%l3,	%o5
	set	0x64, %i4
	stwa	%l1,	[%l7 + %i4] 0x89
	add	%l2,	%o2,	%i2
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x70, %i7
	stw	%o4,	[%l7 + %i7]
	nop
	set	0x60, %i5
	stx	%i6,	[%l7 + %i5]
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%g4
	set	0x68, %i0
	stwa	%i3,	[%l7 + %i0] 0x81
	nop
	set	0x56, %o0
	ldsh	[%l7 + %o0],	%g7
	set	0x54, %i1
	sta	%f14,	[%l7 + %i1] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%l0
	set	0x60, %l1
	stxa	%i1,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f22
	or	%g3,	%l5,	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%i4
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x89,	 1
	nop
	set	0x5E, %g6
	ldsb	[%l7 + %g6],	%g2
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x88,	%g6
	add	%o6,	%o7,	%i7
	set	0x0C, %g5
	lda	[%l7 + %g5] 0x81,	%f21
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%l6
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%o1
	nop
	set	0x0C, %i6
	swap	[%l7 + %i6],	%i5
	set	0x28, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l3
	nop
	set	0x14, %o7
	ldsh	[%l7 + %o7],	%o5
	set	0x18, %g3
	stba	%i0,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe3,	%l0
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f30
	nop
	set	0x29, %l4
	ldub	[%l7 + %l4],	%o2
	nop
	nop
	setx	0x3EE7FD6DA7A2A5C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD9561E2829FDED7C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f4
	nop
	set	0x08, %o1
	stw	%l2,	[%l7 + %o1]
	set	0x4C, %o4
	sta	%f6,	[%l7 + %o4] 0x81
	and	%o4,	%i2,	%i6
	set	0x58, %g1
	stwa	%g4,	[%l7 + %g1] 0x89
	ble,a,pt	%icc,	loop_112
	nop
	set	0x18, %g7
	swap	[%l7 + %g7],	%i3
	st	%f11,	[%l7 + 0x5C]
	wr	%o3,	%l0,	%ccr
loop_112:
	nop
	set	0x72, %l3
	stha	%i1,	[%l7 + %l3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x68, %l6
	ldstub	[%l7 + %l6],	%g7
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 2
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe2,	%l4
	set	0x40, %i3
	lda	[%l7 + %i3] 0x89,	%f21
	or	%i4,	%g5,	%l5
	bn	%xcc,	loop_113
	nop
	set	0x08, %i7
	lduw	[%l7 + %i7],	%g6
	nop
	set	0x70, %l0
	prefetch	[%l7 + %l0],	 4
	bg,pn	%icc,	loop_114
loop_113:
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f16
loop_114:
	nop
	set	0x7D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g2
	set	0x58, %l1
	lda	[%l7 + %l1] 0x89,	%f19
	ld	[%l7 + 0x58],	%f7
	set	0x7E, %o3
	stha	%o7,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x89,	%i7
	nop
	set	0x2C, %g6
	ldsw	[%l7 + %g6],	%o6
	set	0x30, %o5
	sta	%f27,	[%l7 + %o5] 0x81
	add	%g1,	%o1,	%l6
	nop
	set	0x20, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x0C, %l2
	sta	%f5,	[%l7 + %l2] 0x80
	or	%i5,	%l3,	%i0
	st	%f3,	[%l7 + 0x50]
	nop
	set	0x2A, %o2
	sth	%o5,	[%l7 + %o2]
	nop
	set	0x3E, %g2
	ldub	[%l7 + %g2],	%l1
	nop
	set	0x40, %o7
	stx	%o2,	[%l7 + %o7]
	nop
	set	0x3F, %i6
	ldsb	[%l7 + %i6],	%l2
	add	%o4,	%i6,	%i2
	set	0x7D, %l5
	stba	%g4,	[%l7 + %l5] 0x81
	and	%i3,	%o3,	%l0
	set	0x50, %o6
	stxa	%i1,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x1B, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g7
	set	0x08, %o1
	stda	%o0,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%g3,	%l4,	%i4
	add	%l5,	%g5,	%g6
	set	0x3C, %l4
	stwa	%o7,	[%l7 + %l4] 0x89
	add	%g2,	%o6,	%i7
	set	0x57, %g1
	stba	%g1,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x28, %o4
	stx	%o1,	[%l7 + %o4]
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	or	%i5,	%l6,	%l3
	set	0x30, %g7
	ldxa	[%l7 + %g7] 0x89,	%o5
	set	0x08, %g4
	stxa	%i0,	[%l7 + %g4] 0x88
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x89,	 2
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
	nop
	set	0x7F, %l6
	ldstub	[%l7 + %l6],	%l1
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf0
	membar	#Sync
	st	%fsr,	[%l7 + 0x7C]
	set	0x38, %l0
	stxa	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
	ld	[%l7 + 0x14],	%f13
	nop
	set	0x30, %i0
	stx	%i6,	[%l7 + %i0]
	nop
	set	0x0C, %i3
	ldub	[%l7 + %i3],	%i2
	nop
	set	0x47, %o0
	ldstub	[%l7 + %o0],	%o4
	set	0x70, %l1
	stxa	%g4,	[%l7 + %l1] 0x80
	nop
	set	0x50, %i5
	std	%o2,	[%l7 + %i5]
	set	0x1C, %o3
	swapa	[%l7 + %o3] 0x89,	%i3
	nop
	set	0x2A, %i1
	ldub	[%l7 + %i1],	%i1
	set	0x18, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l0
	set	0x19, %o5
	stba	%g7,	[%l7 + %o5] 0x88
	nop
	set	0x50, %l2
	ldsw	[%l7 + %l2],	%g3
	set	0x44, %g5
	lda	[%l7 + %g5] 0x80,	%f8
	nop
	set	0x24, %o2
	sth	%l4,	[%l7 + %o2]
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%l4
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%g5
	set	0x2B, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	nop
	set	0x5A, %o1
	ldsb	[%l7 + %o1],	%g6
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xeb,	%o6
	and	%o6,	%i7,	%g1
	nop
	set	0x7B, %o4
	ldstub	[%l7 + %o4],	%g2
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f30
	set	0x0C, %g7
	sta	%f3,	[%l7 + %g7] 0x81
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%o0
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xe2,	%i6
	nop
	set	0x39, %i2
	stb	%i5,	[%l7 + %i2]
	nop
	set	0x17, %l6
	ldsb	[%l7 + %l6],	%l3
	set	0x48, %i4
	stwa	%i0,	[%l7 + %i4] 0x81
	ble,a	%xcc,	loop_115
	nop
	set	0x48, %i7
	std	%f2,	[%l7 + %i7]
	bg	%xcc,	loop_116
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%o2
loop_115:
	nop
	set	0x4B, %i3
	stb	%l1,	[%l7 + %i3]
	ld	[%l7 + 0x44],	%f16
loop_116:
	st	%fsr,	[%l7 + 0x08]
	or	%l2,	%o5,	%i6
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%o4
	nop
	set	0x2C, %o0
	stw	%g4,	[%l7 + %o0]
	nop
	set	0x25, %i5
	ldstub	[%l7 + %i5],	%o3
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x89,	 3
	nop
	set	0x60, %i1
	swap	[%l7 + %i1],	%i3
	nop
	set	0x2D, %g6
	ldstub	[%l7 + %g6],	%i1
	nop
	set	0x5A, %o3
	lduh	[%l7 + %o3],	%g7
	set	0x68, %l2
	stxa	%l0,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf0
	membar	#Sync
	nop
	set	0x24, %o2
	lduw	[%l7 + %o2],	%l4
	nop
	set	0x68, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x12, %g2
	ldsh	[%l7 + %g2],	%l5
	set	0x24, %i6
	ldstuba	[%l7 + %i6] 0x80,	%i4
	nop
	set	0x30, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x50, %o6
	stwa	%g5,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x19, %l5
	stb	%o0,	[%l7 + %l5]
	st	%f31,	[%l7 + 0x54]
	st	%fsr,	[%l7 + 0x7C]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%o6
	nop
	set	0x3C, %o1
	ldstub	[%l7 + %o1],	%o7
	ld	[%l7 + 0x74],	%f11
	add	%g1,	%g2,	%i7
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f16
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%l6
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x80,	%f5
	nop
	set	0x44, %g7
	stw	%i5,	[%l7 + %g7]
	and	%o1,	%i0,	%l3
	nop
	set	0x60, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%l0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o5
	ld	[%l7 + 0x64],	%f22
	set	0x58, %i2
	lda	[%l7 + %i2] 0x89,	%f30
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f16
	set	0x7C, %i4
	lda	[%l7 + %i4] 0x81,	%f11
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x30, %i7
	std	%f10,	[%l7 + %i7]
	set	0x58, %i0
	stxa	%o2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x64, %l0
	ldsh	[%l7 + %l0],	%o4
	set	0x78, %i3
	stda	%i6,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x7C, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o3
	set	0x34, %i5
	lda	[%l7 + %i5] 0x88,	%f21
	set	0x28, %l1
	stda	%g4,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x81,	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%i1
	set	0x40, %i1
	stda	%g6,	[%l7 + %i1] 0x81
	add	%l0,	%g3,	%l5
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f12
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%i4
	nop
	set	0x63, %o5
	ldsb	[%l7 + %o5],	%g5
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%l4
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%g6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f16
	set	0x1C, %i6
	lda	[%l7 + %i6] 0x81,	%f6
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f6
	nop
	set	0x14, %l5
	lduw	[%l7 + %l5],	%o0
	set	0x34, %o1
	lda	[%l7 + %o1] 0x89,	%f21
	nop
	set	0x08, %o6
	ldsw	[%l7 + %o6],	%o7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%g1
	set	0x57, %g3
	stba	%g2,	[%l7 + %g3] 0x80
	nop
	set	0x60, %l4
	stb	%i7,	[%l7 + %l4]
	set	0x44, %g1
	stha	%i5,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x1A, %g7
	ldub	[%l7 + %g7],	%l6
	and	%i0,	%l3,	%l1
	fpadd32	%f30,	%f16,	%f10
	set	0x78, %g4
	lda	[%l7 + %g4] 0x88,	%f4
	add	%o1,	%o5,	%l2
	nop
	set	0x10, %i2
	lduh	[%l7 + %i2],	%o4
	ld	[%l7 + 0x50],	%f5
	nop
	set	0x15, %l3
	ldsb	[%l7 + %l3],	%i6
	nop
	set	0x10, %l6
	stw	%o2,	[%l7 + %l6]
	nop
	set	0x74, %i4
	ldsb	[%l7 + %i4],	%o3
	set	0x38, %i7
	stwa	%i2,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x68, %o4
	sta	%f23,	[%l7 + %o4] 0x88
	nop
	set	0x34, %i0
	prefetch	[%l7 + %i0],	 4
	set	0x2A, %l0
	stha	%g4,	[%l7 + %l0] 0x88
	nop
	set	0x79, %i3
	stb	%i3,	[%l7 + %i3]
	nop
	set	0x68, %i5
	lduw	[%l7 + %i5],	%i1
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc4
	set	0x68, %g6
	sta	%f10,	[%l7 + %g6] 0x89
	st	%fsr,	[%l7 + 0x0C]
	and	%g7,	%l0,	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%g3
	ld	[%l7 + 0x30],	%f7
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%g5
	nop
	set	0x78, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f10
	nop
	set	0x64, %o5
	ldsb	[%l7 + %o5],	%l4
	set	0x38, %l1
	stwa	%g6,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x20, %g5
	std	%f24,	[%l7 + %g5]
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%f4
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x89,	 4
	and	%o7,	%o6,	%g2
	nop
	set	0x28, %o7
	lduw	[%l7 + %o7],	%i7
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f20
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%g0
	set	0x18, %i6
	sta	%f26,	[%l7 + %i6] 0x88
	set	0x68, %g3
	stda	%i4,	[%l7 + %g3] 0x81
	st	%f2,	[%l7 + 0x28]
	nop
	set	0x18, %o6
	lduh	[%l7 + %o6],	%i0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l3
	fpadd16	%f30,	%f6,	%f30
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f18
	set	0x22, %g7
	stha	%o1,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x56, %g4
	ldsh	[%l7 + %g4],	%o5
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x88,	%l1
	or	%o4,	%l2,	%i6
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x89,	%o2
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x88,	 1
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%f6
	nop
	set	0x28, %i4
	lduw	[%l7 + %i4],	%o3
	nop
	set	0x31, %o4
	ldstub	[%l7 + %o4],	%g4
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%i1
	set	0x30, %l0
	stda	%g6,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x80,	%l0
	ld	[%l7 + 0x7C],	%f21
	st	%f30,	[%l7 + 0x6C]
	bl,a,pt	%icc,	loop_117
	nop
	set	0x20, %i3
	std	%l4,	[%l7 + %i3]
	and	%i4,	%i3,	%g5
	nop
	set	0x26, %o0
	stb	%g3,	[%l7 + %o0]
loop_117:
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x70, %g6
	ldstub	[%l7 + %g6],	%l4
	st	%fsr,	[%l7 + 0x50]
	add	%g6,	%o0,	%o6
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x80,	 1
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x50, %l2
	lda	[%l7 + %l2] 0x81,	%f10
	nop
	set	0x76, %o5
	ldsb	[%l7 + %o5],	%i5
	ba,pn	%xcc,	loop_118
	nop
	nop
	setx	0x24BA92DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x32DFCE14,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f10,	%f20
	nop
	set	0x74, %l1
	ldsw	[%l7 + %l1],	%g1
	nop
	set	0x27, %o2
	ldstub	[%l7 + %o2],	%i0
loop_118:
	nop
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x89,	%l6
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x89,	%o1
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xeb,	%l2
	nop
	set	0x2C, %o1
	lduw	[%l7 + %o1],	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l2
	fpsub32	%f0,	%f2,	%f28
	nop
	set	0x0D, %g2
	ldstub	[%l7 + %g2],	%i6
	nop
	set	0x74, %g3
	ldstub	[%l7 + %g3],	%o2
	set	0x46, %i6
	stha	%o4,	[%l7 + %i6] 0x80
	set	0x17, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i2
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%o3
	nop
	set	0x74, %l4
	stw	%g4,	[%l7 + %l4]
	st	%f16,	[%l7 + 0x20]
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x28, %g4
	lduw	[%l7 + %g4],	%i1
	set	0x56, %l3
	stha	%g7,	[%l7 + %l3] 0x88
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x80,	%l0
	set	0x64, %o4
	lda	[%l7 + %o4] 0x80,	%f13
	set	0x58, %i4
	stxa	%l5,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%i4,	%i3,	%g3
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%l4
	add	%g5,	%g6,	%o0
	nop
	set	0x50, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x76, %i7
	lduh	[%l7 + %i7],	%o7
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%o6
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%g2
	or	%i5,	%i7,	%g1
	fpsub32	%f4,	%f28,	%f18
	st	%f27,	[%l7 + 0x14]
	nop
	set	0x58, %o3
	lduw	[%l7 + %o3],	%l6
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%i0
	ble	%icc,	loop_119
	nop
	set	0x12, %l2
	ldsh	[%l7 + %l2],	%l3
	set	0x28, %g6
	stda	%o0,	[%l7 + %g6] 0x89
loop_119:
	or	%o5,	%l1,	%l2
	nop
	set	0x25, %o5
	ldstub	[%l7 + %o5],	%i6
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	nop
	setx	0xE998A09D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x89F2216A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f26,	%f27
	st	%fsr,	[%l7 + 0x38]
	set	0x24, %g5
	sta	%f5,	[%l7 + %g5] 0x81
	nop
	set	0x0A, %o7
	ldub	[%l7 + %o7],	%o2
	nop
	set	0x60, %l1
	swap	[%l7 + %l1],	%i2
	set	0x68, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0
	set	0x6A, %g2
	stba	%g4,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x48, %o1
	std	%i0,	[%l7 + %o1]
	ld	[%l7 + 0x78],	%f0
	nop
	set	0x78, %i6
	std	%f16,	[%l7 + %i6]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	nop
	set	0x23, %g7
	ldstub	[%l7 + %g7],	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%l5
	set	0x58, %o6
	lda	[%l7 + %o6] 0x80,	%f6
	nop
	set	0x63, %g1
	ldstub	[%l7 + %g1],	%g7
	set	0x24, %g4
	stwa	%i4,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x70, %l4
	lda	[%l7 + %l4] 0x81,	%f2
	nop
	set	0x50, %i2
	swap	[%l7 + %i2],	%g3
	st	%fsr,	[%l7 + 0x28]
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x89,	 1
	set	0x54, %l3
	lda	[%l7 + %l3] 0x89,	%f8
	set	0x18, %i4
	swapa	[%l7 + %i4] 0x88,	%i3
	set	0x26, %o4
	stba	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x5C, %i0
	swap	[%l7 + %i0],	%o0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xca
	nop
	set	0x18, %i7
	std	%g4,	[%l7 + %i7]
	nop
	set	0x3C, %i3
	lduw	[%l7 + %i3],	%o6
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x88,	%f27
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%i5
	set	0x54, %i1
	swapa	[%l7 + %i1] 0x80,	%i7
	set	0x38, %i5
	sta	%f16,	[%l7 + %i5] 0x81
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x81,	 4
	nop
	set	0x70, %g6
	stx	%g2,	[%l7 + %g6]
	and	%i0,	%l3,	%l6
	st	%f1,	[%l7 + 0x1C]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x89,	%o4
	set	0x10, %l2
	sta	%f28,	[%l7 + %l2] 0x80
	nop
	set	0x28, %o2
	stx	%o1,	[%l7 + %o2]
	nop
	set	0x5D, %g5
	ldstub	[%l7 + %g5],	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%i6
	and	%o2,	%o3,	%i2
	bl,pn	%icc,	loop_120
	add	%g4,	%o4,	%i1
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x89,	 2
loop_120:
	nop
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x89,	%l5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf8
	membar	#Sync
	or	%i4,	%g3,	%l4
	or	%g7,	%i3,	%o0
	nop
	set	0x53, %i6
	stb	%g5,	[%l7 + %i6]
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f2
	nop
	set	0x2C, %o1
	ldsh	[%l7 + %o1],	%o6
	or	%o7,	%i7,	%i5
	nop
	set	0x62, %o6
	lduh	[%l7 + %o6],	%g2
	and	%i0,	%g1,	%l6
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%l3
	set	0x74, %g1
	swapa	[%l7 + %g1] 0x88,	%o5
	nop
	set	0x40, %i2
	ldub	[%l7 + %i2],	%l1
	nop
	set	0x6D, %l6
	ldub	[%l7 + %l6],	%l2
	fpsub32s	%f12,	%f19,	%f14
	set	0x78, %l4
	swapa	[%l7 + %l4] 0x88,	%i6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xeb,	%o0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%o3
	nop
	set	0x52, %i4
	sth	%g4,	[%l7 + %i4]
	add	%o4,	%i1,	%i2
	nop
	set	0x32, %o4
	sth	%l0,	[%l7 + %o4]
	set	0x58, %l0
	stxa	%l5,	[%l7 + %l0] 0x80
	or	%i4,	%l4,	%g7
	set	0x75, %i7
	stba	%i3,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x74, %i0
	ldsh	[%l7 + %i0],	%o0
	fpadd32s	%f4,	%f7,	%f12
	nop
	set	0x4F, %o0
	ldsb	[%l7 + %o0],	%g3
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x88,	 0
	nop
	nop
	setx	0xE6137BC5B50079FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x59812DB69C939F01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f4,	%f6
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x20, %o3
	stda	%o6,	[%l7 + %o3] 0x88
	set	0x1C, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o7
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x89,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%g2
	set	0x78, %l2
	stba	%i7,	[%l7 + %l2] 0xeb
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%l6
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%i0
	ld	[%l7 + 0x58],	%f13
	bleu,a	%xcc,	loop_121
	nop
	set	0x18, %i5
	std	%l2,	[%l7 + %i5]
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x81,	%l1
loop_121:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%i6
	set	0x50, %o7
	stxa	%o5,	[%l7 + %o7] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%o3
	set	0x28, %g2
	stxa	%g4,	[%l7 + %g2] 0x89
	ld	[%l7 + 0x14],	%f0
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f18
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%o0
	st	%fsr,	[%l7 + 0x40]
	or	%o4,	%i1,	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%i4
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x89,	%l4
	ld	[%l7 + 0x78],	%f26
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x50, %g3
	swapa	[%l7 + %g3] 0x81,	%g7
	nop
	set	0x74, %o1
	sth	%l5,	[%l7 + %o1]
	nop
	set	0x50, %o6
	lduw	[%l7 + %o6],	%i3
	set	0x48, %g4
	stda	%g2,	[%l7 + %g4] 0xe3
	membar	#Sync
	fpadd32	%f6,	%f18,	%f22
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%g5
	nop
	set	0x14, %l6
	ldsb	[%l7 + %l6],	%o6
	nop
	set	0x54, %g1
	ldsw	[%l7 + %g1],	%o7
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f16
	nop
	set	0x0A, %i4
	sth	%o0,	[%l7 + %i4]
	nop
	set	0x18, %l4
	ldsb	[%l7 + %l4],	%i5
	set	0x7C, %l0
	sta	%f14,	[%l7 + %l0] 0x81
	nop
	set	0x24, %i7
	ldsw	[%l7 + %i7],	%g2
	nop
	set	0x0D, %i0
	ldsb	[%l7 + %i0],	%g6
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x88,	 2
	set	0x48, %o4
	stha	%g1,	[%l7 + %o4] 0x81
	st	%fsr,	[%l7 + 0x78]
	set	0x34, %i1
	lda	[%l7 + %i1] 0x89,	%f31
	fpsub16s	%f30,	%f22,	%f7
	st	%f27,	[%l7 + 0x10]
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x81,	%l6
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x89,	%l2
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x80,	%l0
	nop
	set	0x0B, %i3
	ldub	[%l7 + %i3],	%i0
	set	0x44, %l2
	stha	%l2,	[%l7 + %l2] 0xea
	membar	#Sync
	or	%i6,	%o2,	%o5
	nop
	set	0x14, %o2
	swap	[%l7 + %o2],	%o3
	nop
	set	0x30, %i5
	std	%g4,	[%l7 + %i5]
	fpadd32	%f30,	%f16,	%f22
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%o4
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	set	0x5C, %g2
	sta	%f17,	[%l7 + %g2] 0x80
	nop
	set	0x60, %o7
	stx	%l0,	[%l7 + %o7]
	nop
	set	0x38, %g5
	sth	%i4,	[%l7 + %g5]
	nop
	set	0x48, %l5
	swap	[%l7 + %l5],	%l4
	set	0x48, %g7
	lda	[%l7 + %g7] 0x80,	%f22
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	set	0x50, %i6
	stba	%i2,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x10, %o6
	stw	%l5,	[%l7 + %o6]
	set	0x78, %o1
	swapa	[%l7 + %o1] 0x80,	%g3
	st	%fsr,	[%l7 + 0x50]
	ld	[%l7 + 0x34],	%f14
	nop
	set	0x54, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x08, %g4
	stxa	%g5,	[%l7 + %g4] 0x88
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x80,	 2
	add	%o7,	%i3,	%i5
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f16
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%f4
	ld	[%l7 + 0x44],	%f12
	nop
	set	0x32, %i4
	ldsh	[%l7 + %i4],	%o0
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	nop
	set	0x28, %l0
	std	%g6,	[%l7 + %l0]
	set	0x4B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g2
	or	%g1,	%i7,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%i0
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%f24
	wr	%l2,	%l1,	%clear_softint
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f16
	nop
	set	0x70, %o0
	stx	%o2,	[%l7 + %o0]
	set	0x14, %o3
	stwa	%i6,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x58, %i1
	lduw	[%l7 + %i1],	%o3
	nop
	set	0x28, %g6
	ldsh	[%l7 + %g6],	%g4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%o0
	set	0x22, %o5
	stha	%o4,	[%l7 + %o5] 0x88
	nop
	set	0x78, %o2
	stx	%o5,	[%l7 + %o2]
	bg,a	%xcc,	loop_122
	nop
	set	0x22, %i5
	ldsh	[%l7 + %i5],	%i1
	nop
	set	0x64, %l2
	stw	%i4,	[%l7 + %l2]
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f6
loop_122:
	nop
	set	0x41, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l4
	nop
	set	0x08, %g5
	stw	%g7,	[%l7 + %g5]
	nop
	set	0x1C, %l5
	stw	%l0,	[%l7 + %l5]
	nop
	set	0x2C, %g7
	sth	%l5,	[%l7 + %g7]
	add	%i2,	%g5,	%g3
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x20, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x7B, %i6
	stb	%o6,	[%l7 + %i6]
	nop
	set	0x65, %o6
	ldub	[%l7 + %o6],	%i3
	set	0x30, %i2
	stba	%i5,	[%l7 + %i2] 0x80
	nop
	set	0x10, %o1
	stx	%fsr,	[%l7 + %o1]
	wr 	%g0, 	0x7, 	%fprs
	and	%o7,	%g2,	%i7
	set	0x20, %g1
	lda	[%l7 + %g1] 0x80,	%f29
	set	0x2A, %g4
	stha	%g1,	[%l7 + %g4] 0x81
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%l3
	bg,pt	%xcc,	loop_123
	nop
	set	0x75, %l6
	ldub	[%l7 + %l6],	%i0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xda,	%f16
loop_123:
	nop
	set	0x38, %i4
	stxa	%l2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l1
	set	0x58, %l0
	sta	%f20,	[%l7 + %l0] 0x89
	nop
	set	0x18, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x10, %i1
	ldsh	[%l7 + %i1],	%l6
	bleu,a,pn	%xcc,	loop_124
	or	%g4,	%o1,	%o4
	set	0x50, %o0
	stda	%o4,	[%l7 + %o0] 0xe2
	membar	#Sync
loop_124:
	nop
	set	0x30, %i3
	stw	%i1,	[%l7 + %i3]
	set	0x52, %g6
	stha	%o3,	[%l7 + %g6] 0xea
	membar	#Sync
	or	%l4,	%i4,	%g7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1257
!	Type a   	: 19
!	Type cti   	: 34
!	Type x   	: 534
!	Type f   	: 35
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
	set	0x7,	%g1
	set	0x7,	%g2
	set	0x5,	%g3
	set	0xF,	%g4
	set	0xE,	%g5
	set	0x4,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0xC,	%i0
	set	-0x9,	%i1
	set	-0xA,	%i2
	set	-0x0,	%i3
	set	-0x2,	%i4
	set	-0xB,	%i5
	set	-0x1,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x39D99FA9,	%l0
	set	0x67CB0677,	%l1
	set	0x0ED8DA7B,	%l2
	set	0x68E78777,	%l3
	set	0x152A7390,	%l4
	set	0x216EBA7C,	%l5
	set	0x1EA95069,	%l6
	!# Output registers
	set	-0x1E1D,	%o0
	set	-0x0C11,	%o1
	set	0x1E35,	%o2
	set	-0x0D00,	%o3
	set	-0x1FBF,	%o4
	set	0x1E47,	%o5
	set	0x04EA,	%o6
	set	-0x0FA0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	nop
	set	0x48, %o5
	stw	%l5,	[%l7 + %o5]
	add	%l0,	%i2,	%g5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i3
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x24, %o2
	sta	%f25,	[%l7 + %o2] 0x88
	add	%i5,	%o0,	%o6
	set	0x38, %g2
	stha	%g6,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x0A, %l1
	stba	%g2,	[%l7 + %l1] 0x88
	ba	%xcc,	loop_125
	nop
	set	0x22, %l5
	lduh	[%l7 + %l5],	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%g1
loop_125:
	nop
	set	0x34, %g7
	swapa	[%l7 + %g7] 0x81,	%i0
	fpsub16s	%f21,	%f14,	%f10
	nop
	set	0x78, %g3
	stx	%l3,	[%l7 + %g3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%o2
	set	0x1E, %o7
	stha	%l1,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x2D, %i6
	ldsb	[%l7 + %i6],	%i6
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc4
	ld	[%l7 + 0x7C],	%f25
	set	0x2A, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%o4
	set	0x48, %i2
	stha	%o5,	[%l7 + %i2] 0x88
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x80,	 3
	nop
	set	0x48, %g1
	std	%o2,	[%l7 + %g1]
	nop
	set	0x3E, %l3
	ldsh	[%l7 + %l3],	%l4
	nop
	set	0x67, %g4
	ldsb	[%l7 + %g4],	%i1
	add	%i4,	%g7,	%l0
	nop
	set	0x44, %l4
	ldsw	[%l7 + %l4],	%i2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x7A, %l6
	stb	%g5,	[%l7 + %l6]
	set	0x08, %i4
	stxa	%l5,	[%l7 + %i4] 0x89
	add	%i3,	%g3,	%o0
	set	0x0E, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o6
	ble,a,pt	%xcc,	loop_126
	add	%g6,	%i5,	%i7
	nop
	set	0x39, %i0
	ldsb	[%l7 + %i0],	%o7
	and	%g2,	%i0,	%l3
loop_126:
	nop
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf1
	membar	#Sync
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x88,	%g0
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf9
	membar	#Sync
	or	%l2,	%o2,	%l1
	nop
	set	0x3C, %i1
	ldsb	[%l7 + %i1],	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o4
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x42, %o0
	ldsh	[%l7 + %o0],	%l6
	and	%o1,	%o5,	%l4
	set	0x74, %i3
	stwa	%i1,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x81,	%i4
	add	%o3,	%l0,	%i2
	nop
	set	0x42, %i5
	ldub	[%l7 + %i5],	%g7
	fpadd16	%f22,	%f2,	%f4
	nop
	set	0x6A, %o5
	stb	%g5,	[%l7 + %o5]
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f18
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%g3
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%o0
	or	%i3,	%o6,	%i5
	st	%fsr,	[%l7 + 0x44]
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x89,	%g6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i7
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	set	0x21, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l3
	st	%f2,	[%l7 + 0x60]
	set	0x66, %l5
	stha	%g1,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x9D152130E4F2797D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x32C463BFA3FC1792,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f12
	nop
	set	0x6C, %g3
	lduh	[%l7 + %g3],	%g2
	wr	%l2,	%o2,	%set_softint
	nop
	set	0x28, %o7
	ldsh	[%l7 + %o7],	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%l1
	set	0x50, %i6
	sta	%f25,	[%l7 + %i6] 0x81
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x20]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	nop
	set	0x1E, %o1
	ldsb	[%l7 + %o1],	%l6
	add	%o1,	%o4,	%o5
	nop
	nop
	setx	0x66396017,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xE39C7BA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f14,	%f2
	nop
	set	0x2F, %g1
	stb	%l4,	[%l7 + %g1]
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x80,	%i4
	nop
	set	0x5E, %i2
	ldstub	[%l7 + %i2],	%o3
	wr	%i1,	%l0,	%softint
	nop
	set	0x40, %l4
	std	%g6,	[%l7 + %l4]
	nop
	nop
	setx	0x2DF4721C0B12F045,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x16006F3C3319BDB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f4,	%f10
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%i2
	set	0x50, %l6
	stwa	%l5,	[%l7 + %l6] 0xe3
	membar	#Sync
	ld	[%l7 + 0x78],	%f11
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%g3
	nop
	set	0x28, %i4
	stx	%i3,	[%l7 + %i4]
	nop
	set	0x72, %i7
	ldub	[%l7 + %i7],	%o0
	add	%o6,	%g6,	%i5
	nop
	set	0x37, %i0
	ldstub	[%l7 + %i0],	%o7
	add	%i0,	%l3,	%g1
	add	%g2,	%i7,	%o2
	set	0x69, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i6
	set	0x50, %l0
	sta	%f13,	[%l7 + %l0] 0x89
	ld	[%l7 + 0x0C],	%f29
	or	%g4,	%l2,	%l6
	nop
	set	0x08, %o3
	std	%f18,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%o0
	nop
	set	0x1C, %o0
	sth	%o4,	[%l7 + %o0]
	nop
	set	0x3A, %i3
	lduh	[%l7 + %i3],	%o5
	nop
	set	0x28, %g6
	sth	%l1,	[%l7 + %g6]
	set	0x48, %i5
	stda	%l4,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x58, %o5
	sth	%o3,	[%l7 + %o5]
	nop
	set	0x50, %g2
	swap	[%l7 + %g2],	%i1
	nop
	set	0x10, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc4
	nop
	set	0x38, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x0C, %g7
	lduw	[%l7 + %g7],	%l0
	nop
	set	0x10, %g3
	stw	%i4,	[%l7 + %g3]
	ld	[%l7 + 0x30],	%f20
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i2
	nop
	set	0x2A, %l5
	stb	%l5,	[%l7 + %l5]
	nop
	set	0x6E, %i6
	sth	%g3,	[%l7 + %i6]
	add	%i3,	%o0,	%g5
	and	%g6,	%o6,	%o7
	set	0x50, %g5
	stxa	%i0,	[%l7 + %g5] 0xe2
	membar	#Sync
	fpsub32s	%f10,	%f2,	%f25
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB8A, 	%sys_tick_cmpr
	fpadd32s	%f10,	%f2,	%f2
	nop
	set	0x50, %o6
	std	%g2,	[%l7 + %o6]
	nop
	set	0x54, %o7
	prefetch	[%l7 + %o7],	 1
	set	0x71, %g1
	stba	%i7,	[%l7 + %g1] 0x88
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xe3,	%o2
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x88,	 4
	nop
	set	0x6C, %l4
	lduw	[%l7 + %l4],	%g1
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f14
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%l2
	nop
	set	0x68, %g4
	ldsb	[%l7 + %g4],	%l6
	add	%g4,	%o1,	%o5
	nop
	nop
	setx	0x4190BE8785E87455,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x379F4C7E94553D99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f22,	%f4
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x09, %i4
	stb	%o4,	[%l7 + %i4]
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%f12
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	nop
	set	0x30, %o3
	ldx	[%l7 + %o3],	%l4
	nop
	set	0x24, %o4
	stw	%o3,	[%l7 + %o4]
	nop
	set	0x6C, %o0
	swap	[%l7 + %o0],	%i1
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x89,	%l1
	nop
	set	0x70, %g6
	lduw	[%l7 + %g6],	%l0
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0
	nop
	set	0x38, %o5
	stx	%g7,	[%l7 + %o5]
	set	0x38, %g2
	stda	%i2,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%l5
	nop
	set	0x5C, %i5
	ldsh	[%l7 + %i5],	%g3
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x44]
	add	%i3,	%o0,	%g6
	set	0x30, %o2
	stda	%o6,	[%l7 + %o2] 0x88
	and	%o7,	%i0,	%l3
	nop
	set	0x10, %l2
	std	%f6,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x64, %g3
	sth	%g5,	[%l7 + %g3]
	nop
	nop
	setx	0x2EAA4828DC9D8CB1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x801FFB6DFE7353BB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f24,	%f8
	and	%i5,	%i7,	%g2
	nop
	set	0x7C, %g7
	sth	%o2,	[%l7 + %g7]
	or	%g1,	%l2,	%l6
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%g4
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	nop
	set	0x28, %i6
	stx	%o1,	[%l7 + %i6]
	nop
	set	0x64, %o6
	swap	[%l7 + %o6],	%o5
	nop
	set	0x76, %o7
	lduh	[%l7 + %o7],	%l4
	nop
	set	0x20, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x19, %i2
	stb	%o4,	[%l7 + %i2]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	add	%o3,	%i1,	%l0
	set	0x60, %l4
	stwa	%l1,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%g7
	add	%i2,	%i4,	%l5
	nop
	set	0x10, %g4
	std	%i2,	[%l7 + %g4]
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x24, %i7
	sta	%f26,	[%l7 + %i7] 0x81
	nop
	set	0x0E, %i0
	ldsh	[%l7 + %i0],	%g6
	st	%fsr,	[%l7 + 0x64]
	and	%g3,	%o6,	%o7
	and	%i0,	%l3,	%i5
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f26
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%g5
	nop
	set	0x70, %o4
	lduh	[%l7 + %o4],	%g2
	ld	[%l7 + 0x50],	%f26
	set	0x40, %o3
	stwa	%g1,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x28, %i1
	lduw	[%l7 + %i1],	%l2
	nop
	set	0x50, %o0
	stb	%o2,	[%l7 + %o0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	or	%g4,	%o5,	%o1
	nop
	set	0x0A, %i3
	ldub	[%l7 + %i3],	%o4
	st	%f13,	[%l7 + 0x50]
	ld	[%l7 + 0x5C],	%f10
	nop
	set	0x5D, %o5
	ldsb	[%l7 + %o5],	%l4
	set	0x18, %g2
	stda	%i0,	[%l7 + %g2] 0x80
	nop
	set	0x31, %l1
	ldsb	[%l7 + %l1],	%o3
	nop
	set	0x4E, %g6
	ldsh	[%l7 + %g6],	%l0
	set	0x60, %o2
	stxa	%g7,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x3C, %i5
	stw	%i2,	[%l7 + %i5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l1
	nop
	set	0x48, %g3
	std	%f22,	[%l7 + %g3]
	nop
	set	0x40, %l2
	lduw	[%l7 + %l2],	%i3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%l5
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xe2,	%g6
	fpsub32	%f4,	%f6,	%f20
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f16
	wr	%g3,	%o7,	%set_softint
	add	%o6,	%l3,	%i0
	nop
	set	0x54, %g5
	ldub	[%l7 + %g5],	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%g2
	nop
	set	0x54, %o6
	stw	%i5,	[%l7 + %o6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%l2
	nop
	set	0x6A, %i6
	ldsb	[%l7 + %i6],	%o2
	nop
	set	0x1A, %o7
	ldsh	[%l7 + %o7],	%l6
	nop
	set	0x69, %o1
	ldsb	[%l7 + %o1],	%i6
	nop
	set	0x5E, %g1
	lduh	[%l7 + %g1],	%g4
	nop
	set	0x3E, %l4
	lduh	[%l7 + %l4],	%o5
	ba,a	%icc,	loop_127
	nop
	set	0x10, %i2
	ldsh	[%l7 + %i2],	%o4
	set	0x78, %l6
	prefetcha	[%l7 + %l6] 0x88,	 4
loop_127:
	nop
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xca
	set	0x48, %i7
	lda	[%l7 + %i7] 0x80,	%f11
	nop
	set	0x68, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x54, %i4
	swap	[%l7 + %i4],	%i1
	nop
	set	0x18, %l3
	stx	%o3,	[%l7 + %l3]
	set	0x74, %l0
	sta	%f1,	[%l7 + %l0] 0x88
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%l0
	set	0x48, %i1
	stwa	%o1,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x58, %o3
	sta	%f24,	[%l7 + %o3] 0x81
	nop
	nop
	setx	0x9899D5DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x40F2F256,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f22,	%f28
	add	%g7,	%i2,	%l1
	nop
	set	0x33, %o0
	ldstub	[%l7 + %o0],	%i4
	set	0x74, %i3
	sta	%f17,	[%l7 + %i3] 0x81
	add	%o0,	%i3,	%l5
	wr	%g6,	%g3,	%y
	set	0x70, %g2
	stxa	%o6,	[%l7 + %g2] 0x81
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%o7
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x08, %o5
	std	%f12,	[%l7 + %o5]
	ld	[%l7 + 0x50],	%f8
	nop
	set	0x53, %l1
	ldsb	[%l7 + %l1],	%i0
	nop
	set	0x1E, %g6
	ldsh	[%l7 + %g6],	%i7
	nop
	set	0x28, %o2
	std	%f24,	[%l7 + %o2]
	nop
	set	0x10, %g3
	swap	[%l7 + %g3],	%g5
	ld	[%l7 + 0x64],	%f28
	nop
	set	0x6B, %i5
	ldsb	[%l7 + %i5],	%i5
	set	0x70, %l5
	stxa	%g1,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x42, %g7
	ldstub	[%l7 + %g7],	%g2
	and	%o2,	%l6,	%i6
	set	0x32, %l2
	stba	%l2,	[%l7 + %l2] 0x88
	nop
	set	0x48, %o6
	std	%o4,	[%l7 + %o6]
	nop
	set	0x08, %i6
	prefetch	[%l7 + %i6],	 4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%l4
	nop
	nop
	setx	0x7C628EB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE12715F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f11,	%f8
	set	0x60, %o7
	prefetcha	[%l7 + %o7] 0x80,	 1
	and	%i1,	%o3,	%l0
	set	0x44, %g5
	stwa	%g7,	[%l7 + %g5] 0x81
	nop
	set	0x26, %g1
	ldsh	[%l7 + %g1],	%o1
	nop
	set	0x70, %o1
	stx	%l1,	[%l7 + %o1]
	nop
	set	0x28, %i2
	std	%i2,	[%l7 + %i2]
	set	0x14, %l4
	sta	%f2,	[%l7 + %l4] 0x88
	set	0x58, %g4
	stxa	%i4,	[%l7 + %g4] 0x88
	nop
	set	0x47, %l6
	ldub	[%l7 + %l6],	%i3
	nop
	set	0x3E, %i0
	ldsb	[%l7 + %i0],	%l5
	and	%g6,	%o0,	%g3
	nop
	set	0x08, %i7
	std	%l2,	[%l7 + %i7]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i0
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x0C, %i4
	sta	%f9,	[%l7 + %i4] 0x80
	fpsub16	%f20,	%f26,	%f22
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x60, %o4
	stw	%i7,	[%l7 + %o4]
	st	%f13,	[%l7 + 0x48]
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%o7
	nop
	set	0x42, %o3
	stb	%i5,	[%l7 + %o3]
	ld	[%l7 + 0x14],	%f7
	nop
	set	0x38, %o0
	std	%g4,	[%l7 + %o0]
	fpadd16	%f0,	%f24,	%f24
	set	0x54, %i1
	stwa	%g1,	[%l7 + %i1] 0x81
	ld	[%l7 + 0x7C],	%f11
	ble	%icc,	loop_128
	nop
	set	0x30, %g2
	stw	%o2,	[%l7 + %g2]
	set	0x78, %o5
	stxa	%l6,	[%l7 + %o5] 0x81
loop_128:
	nop
	set	0x78, %l1
	stwa	%i6,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x81,	%g2
	nop
	set	0x38, %i3
	swap	[%l7 + %i3],	%o5
	nop
	set	0x08, %g3
	lduh	[%l7 + %g3],	%g4
	set	0x48, %i5
	stba	%l4,	[%l7 + %i5] 0xe3
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i1
	add	%o4,	%l0,	%o3
	bn,a	%icc,	loop_129
	nop
	set	0x74, %l5
	swap	[%l7 + %l5],	%o1
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	or	%g7,	%i2,	%i4
loop_129:
	nop
	set	0x18, %o2
	stx	%i3,	[%l7 + %o2]
	st	%f22,	[%l7 + 0x40]
	nop
	set	0x4B, %l2
	stb	%l1,	[%l7 + %l2]
	set	0x62, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l5
	nop
	set	0x7E, %o7
	sth	%g6,	[%l7 + %o7]
	nop
	set	0x3C, %g5
	ldsw	[%l7 + %g5],	%o0
	or	%g3,	%l3,	%i0
	set	0x50, %o6
	sta	%f4,	[%l7 + %o6] 0x81
	nop
	set	0x4C, %g1
	lduh	[%l7 + %g1],	%o6
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f20
	set	0x4C, %i2
	lda	[%l7 + %i2] 0x81,	%f29
	nop
	set	0x58, %g4
	lduw	[%l7 + %g4],	%o7
	set	0x77, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i7
	nop
	set	0x7B, %l4
	stb	%g5,	[%l7 + %l4]
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%i5
	add	%o2,	%g1,	%l6
	set	0x54, %i7
	sta	%f18,	[%l7 + %i7] 0x89
	set	0x4C, %l3
	stwa	%g2,	[%l7 + %l3] 0x81
	bge,a	%xcc,	loop_130
	nop
	set	0x28, %i4
	std	%f22,	[%l7 + %i4]
	set	0x68, %l0
	stha	%i6,	[%l7 + %l0] 0x88
loop_130:
	nop
	set	0x28, %o3
	stw	%g4,	[%l7 + %o3]
	nop
	set	0x28, %o0
	sth	%o5,	[%l7 + %o0]
	nop
	set	0x1B, %i1
	ldub	[%l7 + %i1],	%l2
	nop
	set	0x38, %o4
	stx	%i1,	[%l7 + %o4]
	set	0x64, %o5
	sta	%f12,	[%l7 + %o5] 0x81
	nop
	set	0x44, %g2
	ldsw	[%l7 + %g2],	%l4
	nop
	set	0x45, %l1
	stb	%o4,	[%l7 + %l1]
	ld	[%l7 + 0x1C],	%f7
	nop
	set	0x78, %g6
	std	%l0,	[%l7 + %g6]
	set	0x50, %i3
	stha	%o1,	[%l7 + %i3] 0x88
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x81
	and	%o3,	%i2,	%g7
	nop
	set	0x70, %g3
	ldsw	[%l7 + %g3],	%i3
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x88,	%l0
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f10
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xea,	%i4
	and	%g6,	%o0,	%g3
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%l3
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%i0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%o6
	nop
	set	0x54, %o6
	stw	%i7,	[%l7 + %o6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%g5
	set	0x18, %g1
	lda	[%l7 + %g1] 0x89,	%f31
	and	%i5,	%o2,	%g1
	st	%f14,	[%l7 + 0x58]
	nop
	set	0x48, %o2
	prefetch	[%l7 + %o2],	 3
	and	%l6,	%i6,	%g4
	set	0x20, %o1
	stxa	%g2,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x20, %g4
	stwa	%o5,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x58, %i2
	sta	%f11,	[%l7 + %i2] 0x88
	nop
	set	0x0E, %l4
	stb	%i1,	[%l7 + %l4]
	nop
	set	0x20, %i0
	stx	%fsr,	[%l7 + %i0]
	add	%l4,	%l2,	%l0
	nop
	set	0x78, %i7
	std	%o4,	[%l7 + %i7]
	set	0x73, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o3
	nop
	set	0x64, %l3
	stb	%i2,	[%l7 + %l3]
	nop
	set	0x56, %l0
	sth	%g7,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
	nop
	set	0x74, %o3
	stw	%o1,	[%l7 + %o3]
	nop
	set	0x6F, %o0
	ldstub	[%l7 + %o0],	%i3
	add	%i4,	%l1,	%o0
	and	%g3,	%l3,	%i0
	ld	[%l7 + 0x3C],	%f27
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x08, %o5
	prefetcha	[%l7 + %o5] 0x80,	 2
	nop
	set	0x64, %g2
	prefetch	[%l7 + %g2],	 1
	set	0x44, %i1
	stwa	%g6,	[%l7 + %i1] 0xea
	membar	#Sync
	nop
	set	0x58, %l1
	ldstub	[%l7 + %l1],	%o6
	nop
	set	0x48, %i3
	std	%i6,	[%l7 + %i3]
	nop
	set	0x38, %g6
	ldx	[%l7 + %g6],	%g5
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%o7,	%o2,	%i5
	set	0x60, %g3
	stxa	%l6,	[%l7 + %g3] 0x81
	nop
	set	0x2D, %g7
	ldsb	[%l7 + %g7],	%g1
	ld	[%l7 + 0x74],	%f19
	set	0x62, %l5
	stha	%g4,	[%l7 + %l5] 0x81
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f8
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%i6
	nop
	set	0x28, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc4
	bne,pn	%icc,	loop_131
	nop
	set	0x5B, %g1
	ldub	[%l7 + %g1],	%g2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf1,	%f0
loop_131:
	and	%o5,	%i1,	%l4
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x88,	%l2
	nop
	set	0x3C, %g4
	ldstub	[%l7 + %g4],	%l0
	be,pt	%xcc,	loop_132
	add	%o4,	%o3,	%i2
	nop
	set	0x65, %i2
	stb	%o1,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x58]
loop_132:
	nop
	set	0x55, %o2
	ldsb	[%l7 + %o2],	%g7
	set	0x24, %i0
	swapa	[%l7 + %i0] 0x80,	%i3
	set	0x29, %i7
	stba	%l1,	[%l7 + %i7] 0x80
	set	0x60, %l4
	stwa	%i4,	[%l7 + %l4] 0x88
	wr	%g3,	%o0,	%sys_tick
	or	%l3,	%i0,	%g6
	nop
	set	0x52, %l3
	ldstub	[%l7 + %l3],	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%g5
	set	0x60, %l0
	stxa	%o7,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x81,	%i7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f16
	nop
	set	0x30, %o0
	std	%o2,	[%l7 + %o0]
	nop
	set	0x40, %o4
	swap	[%l7 + %o4],	%l6
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x34, %g2
	ldsh	[%l7 + %g2],	%i5
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x68, %i1
	ldsw	[%l7 + %i1],	%g4
	set	0x46, %i3
	stha	%i6,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x08, %i5
	ldstub	[%l7 + %i5],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%i1
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x38, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x16, %g7
	stha	%l4,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x68, %i6
	lda	[%l7 + %i6] 0x88,	%f27
	or	%g1,	%l2,	%l0
	set	0x3B, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o3
	wr	%i2,	%o1,	%sys_tick
	be,pn	%xcc,	loop_133
	nop
	set	0x1C, %l5
	ldsh	[%l7 + %l5],	%o4
	nop
	set	0x79, %l2
	ldsb	[%l7 + %l2],	%i3
	st	%fsr,	[%l7 + 0x14]
loop_133:
	nop
	set	0x18, %g1
	stda	%g6,	[%l7 + %g1] 0x81
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x89,	%l0
	nop
	set	0x3C, %g5
	stw	%i4,	[%l7 + %g5]
	set	0x69, %o1
	stba	%g3,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%o0
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f30
	set	0x48, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	set	0x0C, %i0
	stwa	%o6,	[%l7 + %i0] 0x89
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x81,	%i0
	set	0x54, %i7
	stwa	%g5,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%o2
	set	0x2C, %l0
	sta	%f8,	[%l7 + %l0] 0x89
	set	0x10, %l6
	ldxa	[%l7 + %l6] 0x89,	%i7
	set	0x6A, %l3
	stha	%i5,	[%l7 + %l3] 0x80
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f20
	nop
	set	0x1D, %o4
	stb	%g4,	[%l7 + %o4]
	nop
	set	0x78, %o0
	std	%f10,	[%l7 + %o0]
	nop
	set	0x14, %o5
	ldsw	[%l7 + %o5],	%i6
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%l6
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%g2
	set	0x40, %o3
	stda	%i0,	[%l7 + %o3] 0x80
	add	%o5,	%g1,	%l4
	nop
	set	0x70, %i3
	std	%l0,	[%l7 + %i3]
	add	%o3,	%l2,	%i2
	set	0x68, %i1
	stxa	%o4,	[%l7 + %i1] 0x89
	st	%f16,	[%l7 + 0x44]
	set	0x14, %g6
	sta	%f18,	[%l7 + %g6] 0x88
	add	%o1,	%i3,	%l1
	set	0x20, %i5
	swapa	[%l7 + %i5] 0x88,	%i4
	set	0x63, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g3
	nop
	set	0x28, %g3
	std	%f22,	[%l7 + %g3]
	set	0x24, %o7
	lda	[%l7 + %o7] 0x80,	%f29
	set	0x58, %i6
	stxa	%l3,	[%l7 + %i6] 0x88
	or	%g7,	%g6,	%o6
	nop
	set	0x15, %l5
	stb	%o0,	[%l7 + %l5]
	and	%i0,	%l5,	%o7
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%g5
	nop
	set	0x18, %g1
	std	%i6,	[%l7 + %g1]
	set	0x24, %g5
	lda	[%l7 + %g5] 0x80,	%f22
	add	%o2,	%g4,	%i6
	st	%fsr,	[%l7 + 0x44]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%i5
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 2
	set	0x58, %g4
	stda	%i0,	[%l7 + %g4] 0x81
	nop
	set	0x08, %i2
	stw	%o5,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x5C]
	set	0x30, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0
	nop
	set	0x58, %o2
	stb	%l4,	[%l7 + %o2]
	st	%f22,	[%l7 + 0x7C]
	or	%g1,	%o3,	%l2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%i2
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xda
	nop
	set	0x4C, %l0
	swap	[%l7 + %l0],	%o4
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x88,	%o1
	nop
	set	0x48, %l4
	stx	%l0,	[%l7 + %l4]
	set	0x38, %l3
	stda	%i2,	[%l7 + %l3] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x29, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g3
	set	0x18, %o0
	stxa	%l3,	[%l7 + %o0] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%g7
	ld	[%l7 + 0x28],	%f14
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xda
	nop
	set	0x6D, %o4
	ldub	[%l7 + %o4],	%o0
	wr	%i0,	%o6,	%set_softint
	nop
	set	0x74, %l1
	stw	%o7,	[%l7 + %l1]
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x81,	%f0
	nop
	nop
	setx	0x144C9E3A27112908,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x4CED9B9DAF4FC61D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f8,	%f6
	add	%l5,	%i7,	%g5
	set	0x68, %o3
	stha	%o2,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x38, %i3
	sta	%f10,	[%l7 + %i3] 0x89
	set	0x34, %g6
	stwa	%g4,	[%l7 + %g6] 0x81
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	nop
	set	0x71, %g3
	ldsb	[%l7 + %g3],	%i6
	st	%fsr,	[%l7 + 0x40]
	set	0x0D, %i5
	stba	%i5,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i1
	or	%g2,	%o5,	%l4
	or	%o3,	%l2,	%g1
	nop
	set	0x30, %i6
	ldstub	[%l7 + %i6],	%o4
	nop
	set	0x19, %o7
	ldsb	[%l7 + %o7],	%o1
	nop
	set	0x10, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x60, %l2
	swap	[%l7 + %l2],	%i3
	or	%l0,	%i4,	%g3
	nop
	set	0x70, %g1
	swap	[%l7 + %g1],	%l1
	nop
	set	0x42, %g5
	stb	%l3,	[%l7 + %g5]
	and	%g6,	%g7,	%i0
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x0C, %i2
	sth	%o6,	[%l7 + %i2]
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x27, %o2
	ldsb	[%l7 + %o2],	%o0
	set	0x20, %i0
	sta	%f26,	[%l7 + %i0] 0x80
	set	0x19, %g4
	ldstuba	[%l7 + %g4] 0x80,	%o7
	nop
	set	0x70, %i7
	lduw	[%l7 + %i7],	%l5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe3,	%i6
	nop
	set	0x25, %l0
	ldstub	[%l7 + %l0],	%g5
	set	0x60, %l4
	stda	%g4,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x4E, %i4
	sth	%o2,	[%l7 + %i4]
	nop
	set	0x68, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x78, %o0
	std	%f16,	[%l7 + %o0]
	nop
	set	0x1B, %o5
	ldsb	[%l7 + %o5],	%l6
	nop
	set	0x27, %o4
	ldstub	[%l7 + %o4],	%i1
	be,pt	%icc,	loop_134
	nop
	set	0x20, %g2
	std	%f30,	[%l7 + %g2]
	nop
	set	0x24, %l1
	lduw	[%l7 + %l1],	%i5
	nop
	set	0x77, %i3
	ldsb	[%l7 + %i3],	%g2
loop_134:
	nop
	set	0x34, %o3
	lda	[%l7 + %o3] 0x81,	%f30
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xcc
	nop
	set	0x4A, %g7
	lduh	[%l7 + %g7],	%l4
	set	0x78, %g3
	lda	[%l7 + %g3] 0x89,	%f5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%o3
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x89,	 1
	nop
	set	0x38, %i1
	sth	%o4,	[%l7 + %i1]
	nop
	set	0x6F, %i6
	ldstub	[%l7 + %i6],	%g1
	set	0x34, %o7
	stwa	%o1,	[%l7 + %o7] 0x89
	set	0x38, %l2
	stha	%i3,	[%l7 + %l2] 0x89
	nop
	set	0x44, %g1
	swap	[%l7 + %g1],	%l0
	set	0x58, %l5
	stda	%i2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x40, %o1
	std	%f16,	[%l7 + %o1]
	set	0x50, %i2
	stda	%i4,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x23, %o6
	ldub	[%l7 + %o6],	%l1
	set	0x68, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x88,	 1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%l3
	set	0x54, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i0
	set	0x68, %i7
	stda	%o0,	[%l7 + %i7] 0x80
	bge,pt	%icc,	loop_135
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%o7
	nop
	set	0x6F, %l4
	ldstub	[%l7 + %l4],	%l5
loop_135:
	nop
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x88,	%i7
	nop
	set	0x60, %l0
	std	%o6,	[%l7 + %l0]
	nop
	set	0x7C, %o0
	prefetch	[%l7 + %o0],	 0
	nop
	set	0x65, %l3
	ldub	[%l7 + %l3],	%g5
	nop
	set	0x08, %o4
	std	%o2,	[%l7 + %o4]
	set	0x5C, %g2
	stba	%g4,	[%l7 + %g2] 0xeb
	membar	#Sync
	bl,a,pt	%xcc,	loop_136
	nop
	set	0x5C, %o5
	swap	[%l7 + %o5],	%l6
	fpadd16	%f6,	%f16,	%f16
	nop
	set	0x6E, %i3
	ldsh	[%l7 + %i3],	%i1
loop_136:
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x39, %o3
	ldsb	[%l7 + %o3],	%i6
	nop
	set	0x4E, %g6
	stb	%g2,	[%l7 + %g6]
	set	0x78, %l1
	sta	%f8,	[%l7 + %l1] 0x81
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%l4
	nop
	set	0x18, %g3
	std	%f20,	[%l7 + %g3]
	set	0x40, %i5
	stda	%o2,	[%l7 + %i5] 0x81
	set	0x58, %i1
	stwa	%l2,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x20, %i6
	std	%o4,	[%l7 + %i6]
	set	0x60, %g7
	stba	%o5,	[%l7 + %g7] 0x81
	nop
	set	0x70, %o7
	stw	%g1,	[%l7 + %o7]
	nop
	set	0x38, %l2
	std	%f0,	[%l7 + %l2]
	and	%i3,	%l0,	%i2
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f16
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f22
	set	0x30, %l5
	stxa	%i4,	[%l7 + %l5] 0x80
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%o0
	nop
	set	0x6E, %i2
	stb	%g3,	[%l7 + %i2]
	nop
	set	0x22, %i0
	ldstub	[%l7 + %i0],	%l1
	nop
	nop
	setx	0x0A13317E50DD2FBC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1626C31154C8AF31,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f22,	%f26
	nop
	set	0x76, %o2
	ldsh	[%l7 + %o2],	%g6
	nop
	set	0x08, %g4
	stb	%l3,	[%l7 + %g4]
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f26
	set	0x7A, %l6
	stha	%g7,	[%l7 + %l6] 0x89
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%o0
	set	0x27, %l4
	stba	%o7,	[%l7 + %l4] 0xeb
	membar	#Sync
	wr	%i7,	%l5,	%sys_tick
	nop
	set	0x3C, %i4
	ldsw	[%l7 + %i4],	%g5
	set	0x10, %i7
	sta	%f24,	[%l7 + %i7] 0x89
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f16
	bn,a	%xcc,	loop_137
	nop
	set	0x10, %o0
	swap	[%l7 + %o0],	%o6
	add	%g4,	%l6,	%i1
	nop
	set	0x70, %l3
	stx	%o2,	[%l7 + %l3]
loop_137:
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%i6
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x81,	%i5
	or	%l4,	%g2,	%l2
	nop
	set	0x10, %o4
	std	%o2,	[%l7 + %o4]
	set	0x18, %i3
	stwa	%o5,	[%l7 + %i3] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x3C]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x81,	%g1
	set	0x74, %g3
	sta	%f18,	[%l7 + %g3] 0x81
	nop
	set	0x3C, %l1
	lduw	[%l7 + %l1],	%i3
	nop
	set	0x08, %i5
	ldx	[%l7 + %i5],	%l0
	bg,a,pn	%icc,	loop_138
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%i2
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g3
loop_138:
	st	%fsr,	[%l7 + 0x78]
	fpadd32s	%f18,	%f29,	%f14
	nop
	set	0x5E, %o7
	sth	%l1,	[%l7 + %o7]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xe3,	%o0
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x81,	 4
	and	%g7,	%i0,	%g6
	set	0x70, %o1
	lda	[%l7 + %o1] 0x89,	%f18
	set	0x40, %i6
	stxa	%o0,	[%l7 + %i6] 0x89
	nop
	set	0x6C, %o6
	prefetch	[%l7 + %o6],	 4
	set	0x0A, %l5
	ldstuba	[%l7 + %l5] 0x88,	%o7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%l5
	set	0x74, %i0
	stha	%o6,	[%l7 + %i0] 0x81
	set	0x28, %i2
	swapa	[%l7 + %i2] 0x88,	%g4
	nop
	set	0x57, %o2
	ldub	[%l7 + %o2],	%l6
	set	0x30, %g4
	lda	[%l7 + %g4] 0x80,	%f2
	nop
	set	0x68, %g5
	std	%f0,	[%l7 + %g5]
	set	0x48, %l6
	stda	%i0,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x08, %i4
	sta	%f25,	[%l7 + %i4] 0x81
	nop
	set	0x50, %i7
	lduw	[%l7 + %i7],	%o2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x08, %l4
	stx	%g5,	[%l7 + %l4]
	nop
	set	0x60, %o0
	lduw	[%l7 + %o0],	%i6
	set	0x58, %l0
	stba	%l4,	[%l7 + %l0] 0x80
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%o3
	set	0x50, %l3
	sta	%f24,	[%l7 + %l3] 0x81
	or	%o5,	%g1,	%l0
	set	0x3E, %g2
	stha	%i3,	[%l7 + %g2] 0x81
	fpadd32s	%f13,	%f28,	%f21
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%i2
	set	0x74, %i3
	swapa	[%l7 + %i3] 0x89,	%i4
	and	%g3,	%o4,	%o1
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x88,	%l1
	set	0x48, %o3
	stha	%l3,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x4A, %o5
	ldstuba	[%l7 + %o5] 0x88,	%g7
	nop
	set	0x28, %l1
	stw	%g6,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x0C, %i5
	lduh	[%l7 + %i5],	%o0
	ld	[%l7 + 0x64],	%f4
	nop
	set	0x1E, %i1
	lduh	[%l7 + %i1],	%o7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%i7
	add	%o6,	%l5,	%g4
	set	0x7C, %g7
	lda	[%l7 + %g7] 0x89,	%f28
	nop
	set	0x48, %g3
	std	%i0,	[%l7 + %g3]
	set	0x39, %l2
	ldstuba	[%l7 + %l2] 0x88,	%o2
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f12
	set	0x38, %o7
	sta	%f29,	[%l7 + %o7] 0x88
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x88,	%g5
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x70, %o6
	std	%i6,	[%l7 + %o6]
	set	0x38, %l5
	stxa	%g2,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f4
	nop
	set	0x6A, %i0
	ldsb	[%l7 + %i0],	%l4
	nop
	set	0x5C, %g4
	lduw	[%l7 + %g4],	%l2
	nop
	set	0x58, %g5
	stw	%i5,	[%l7 + %g5]
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%o5
	nop
	set	0x1F, %i4
	ldstub	[%l7 + %i4],	%o3
	nop
	set	0x70, %i7
	stw	%g1,	[%l7 + %i7]
	st	%f9,	[%l7 + 0x7C]
	nop
	set	0x1C, %l6
	sth	%l0,	[%l7 + %l6]
	nop
	set	0x60, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x89,	%i2
	nop
	set	0x50, %o0
	lduw	[%l7 + %o0],	%i4
	add	%i3,	%o4,	%o1
	and	%l1,	%g3,	%g7
	nop
	set	0x1A, %g2
	lduh	[%l7 + %g2],	%l3
	set	0x4C, %l3
	sta	%f25,	[%l7 + %l3] 0x80
	nop
	set	0x7E, %o4
	sth	%o0,	[%l7 + %o4]
	set	0x59, %i3
	ldstuba	[%l7 + %i3] 0x80,	%g6
	set	0x0D, %o3
	ldstuba	[%l7 + %o3] 0x88,	%o7
	st	%f25,	[%l7 + 0x50]
	nop
	set	0x60, %o5
	prefetch	[%l7 + %o5],	 1
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%i0
	add	%i7,	%l5,	%g4
	nop
	set	0x52, %l1
	sth	%i1,	[%l7 + %l1]
	nop
	set	0x3C, %i1
	ldsw	[%l7 + %i1],	%o2
	wr	%g5,	%l6,	%y
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o6
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x10, %g3
	sth	%g2,	[%l7 + %g3]
	fpsub16s	%f6,	%f18,	%f14
	set	0x70, %l2
	stxa	%l2,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x40, %g7
	std	%f4,	[%l7 + %g7]
	set	0x3A, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i5
	set	0x4C, %i6
	sta	%f14,	[%l7 + %i6] 0x81
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f0
	nop
	set	0x34, %o6
	ldsb	[%l7 + %o6],	%l4
	set	0x68, %o1
	stda	%o2,	[%l7 + %o1] 0x88
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x80,	 2
	nop
	set	0x68, %i2
	ldsw	[%l7 + %i2],	%l0
	set	0x34, %g4
	lda	[%l7 + %g4] 0x80,	%f15
	and	%o5,	%i4,	%i2
	ld	[%l7 + 0x44],	%f3
	set	0x38, %i0
	stha	%o4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x38, %o2
	stw	%o1,	[%l7 + %o2]
	set	0x68, %i4
	stxa	%i3,	[%l7 + %i4] 0x89
	nop
	set	0x30, %i7
	lduh	[%l7 + %i7],	%g3
	set	0x20, %g5
	stda	%g6,	[%l7 + %g5] 0x81
	nop
	set	0x2D, %l6
	ldub	[%l7 + %l6],	%l1
	set	0x0D, %l0
	ldstuba	[%l7 + %l0] 0x88,	%l3
	fpsub16	%f4,	%f28,	%f26
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	nop
	set	0x76, %g2
	sth	%o0,	[%l7 + %g2]
	set	0x6C, %l4
	sta	%f2,	[%l7 + %l4] 0x81
	nop
	set	0x1C, %o4
	prefetch	[%l7 + %o4],	 1
	set	0x08, %l3
	stxa	%o7,	[%l7 + %l3] 0x80
	and	%i0,	%g6,	%l5
	set	0x60, %o3
	lda	[%l7 + %o3] 0x89,	%f9
	add	%g4,	%i1,	%o2
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x81,	%i7
	nop
	set	0x2E, %g6
	lduh	[%l7 + %g6],	%g5
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i6
	set	0x14, %l1
	swapa	[%l7 + %l1] 0x88,	%i6
	fpsub16s	%f19,	%f5,	%f20
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f0
	nop
	set	0x2B, %i1
	ldstub	[%l7 + %i1],	%g2
	set	0x7C, %l2
	ldstuba	[%l7 + %l2] 0x81,	%o6
	set	0x6C, %g7
	sta	%f26,	[%l7 + %g7] 0x80
	nop
	set	0x51, %g3
	ldub	[%l7 + %g3],	%i5
	nop
	set	0x1A, %o7
	ldub	[%l7 + %o7],	%l2
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x39, %i6
	ldsb	[%l7 + %i6],	%l4
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x80,	%o3
	nop
	set	0x08, %l5
	std	%l0,	[%l7 + %l5]
	nop
	set	0x5C, %o1
	stb	%g1,	[%l7 + %o1]
	nop
	set	0x70, %g4
	prefetch	[%l7 + %g4],	 4
	ld	[%l7 + 0x44],	%f0
	set	0x60, %i0
	stha	%o5,	[%l7 + %i0] 0x89
	and	%i4,	%o4,	%i2
	set	0x78, %i2
	stwa	%o1,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	ld	[%l7 + 0x6C],	%f3
	set	0x20, %i4
	lda	[%l7 + %i4] 0x89,	%f24
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%g3
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x2F, %o2
	ldub	[%l7 + %o2],	%l3
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%o0
	set	0x1C, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o7
	wr	%g7,	%g6,	%y
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g4
	nop
	set	0x10, %l6
	sth	%i1,	[%l7 + %l6]
	nop
	set	0x7A, %o0
	ldsh	[%l7 + %o0],	%i0
	fpsub32s	%f0,	%f1,	%f28
	nop
	set	0x60, %l4
	std	%f20,	[%l7 + %l4]
	set	0x3D, %g2
	stba	%i7,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x2E, %o4
	ldsh	[%l7 + %o4],	%o2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f0
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%g5
	nop
	set	0x66, %l3
	ldstub	[%l7 + %l3],	%l6
	set	0x72, %i3
	stba	%g2,	[%l7 + %i3] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%i5
	add	%l2,	%i6,	%o3
	set	0x70, %g6
	sta	%f24,	[%l7 + %g6] 0x80
	set	0x0C, %l1
	stha	%l0,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%g1
	bgu,a,pt	%icc,	loop_139
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%l4
	nop
	set	0x60, %l2
	std	%f30,	[%l7 + %l2]
	set	0x50, %g3
	lda	[%l7 + %g3] 0x80,	%f18
loop_139:
	st	%fsr,	[%l7 + 0x38]
	set	0x56, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i4
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x48, %i6
	stw	%o5,	[%l7 + %i6]
	set	0x48, %o6
	lda	[%l7 + %o6] 0x80,	%f23
	set	0x30, %l5
	stxa	%i2,	[%l7 + %l5] 0x88
	set	0x74, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o4
	nop
	set	0x34, %g4
	lduw	[%l7 + %g4],	%o1
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x30, %i0
	std	%f20,	[%l7 + %i0]
	nop
	set	0x34, %i2
	ldub	[%l7 + %i2],	%i3
	nop
	set	0x60, %i4
	std	%f8,	[%l7 + %i4]
	set	0x60, %i7
	sta	%f14,	[%l7 + %i7] 0x88
	nop
	set	0x37, %o2
	ldub	[%l7 + %o2],	%l1
	nop
	set	0x24, %o1
	swap	[%l7 + %o1],	%g3
	set	0x44, %g5
	lda	[%l7 + %g5] 0x80,	%f28
	wr	%l3,	%o7,	%ccr
	nop
	set	0x60, %l6
	std	%o0,	[%l7 + %l6]
	set	0x70, %o0
	stxa	%g6,	[%l7 + %o0] 0x89
	ld	[%l7 + 0x0C],	%f1
	nop
	set	0x59, %l0
	ldub	[%l7 + %l0],	%l5
	nop
	set	0x48, %l4
	std	%g6,	[%l7 + %l4]
	nop
	set	0x1E, %g2
	lduh	[%l7 + %g2],	%g4
	st	%fsr,	[%l7 + 0x28]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%i7
	nop
	set	0x30, %o4
	swap	[%l7 + %o4],	%o2
	set	0x66, %o3
	stha	%i1,	[%l7 + %o3] 0x89
	set	0x48, %o5
	stha	%l6,	[%l7 + %o5] 0x88
	nop
	set	0x50, %i3
	std	%g4,	[%l7 + %i3]
	nop
	set	0x7C, %g6
	lduw	[%l7 + %g6],	%o6
	set	0x48, %l3
	stwa	%g2,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x30, %i5
	stda	%i4,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x58, %l1
	stx	%l2,	[%l7 + %l1]
	nop
	set	0x1A, %l2
	ldsb	[%l7 + %l2],	%o3
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f14
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%l0
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xc2
	nop
	set	0x78, %g3
	std	%l4,	[%l7 + %g3]
	st	%f14,	[%l7 + 0x64]
	nop
	set	0x08, %o7
	lduw	[%l7 + %o7],	%i4
	set	0x2C, %i6
	stwa	%o5,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x5C, %o6
	prefetch	[%l7 + %o6],	 2
	st	%fsr,	[%l7 + 0x70]
	set	0x58, %l5
	stxa	%g1,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x88,	%o4
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o1
	set	0x40, %i2
	stxa	%i3,	[%l7 + %i2] 0x81
	nop
	set	0x48, %i4
	std	%f10,	[%l7 + %i4]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x80
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%i2
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x89,	%g3
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x80,	%l1
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x17, %g5
	ldsb	[%l7 + %g5],	%o7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x0A, %l6
	ldsh	[%l7 + %l6],	%o0
	set	0x08, %o0
	stda	%g6,	[%l7 + %o0] 0x89
	set	0x24, %l0
	swapa	[%l7 + %l0] 0x88,	%l3
	set	0x38, %l4
	lda	[%l7 + %l4] 0x88,	%f30
	nop
	set	0x44, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x18, %o3
	ldsh	[%l7 + %o3],	%g7
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%l5
	set	0x08, %i3
	stda	%i0,	[%l7 + %i3] 0x88
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%g4
	nop
	set	0x20, %g6
	std	%o2,	[%l7 + %g6]
	nop
	set	0x60, %l3
	stw	%i7,	[%l7 + %l3]
	nop
	set	0x74, %i5
	stw	%l6,	[%l7 + %i5]
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%i1
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f30
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%f12
	ld	[%l7 + 0x50],	%f16
	set	0x48, %g3
	sta	%f7,	[%l7 + %g3] 0x89
	nop
	set	0x44, %i6
	sth	%g2,	[%l7 + %i6]
	nop
	set	0x54, %o7
	prefetch	[%l7 + %o7],	 0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe2,	%i4
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x89,	%l2
	nop
	nop
	setx	0xB7687E50FE0203C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2BF781288530F2D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f2,	%f28
	set	0x1E, %g4
	stba	%g5,	[%l7 + %g4] 0x89
	nop
	set	0x30, %i2
	stw	%i6,	[%l7 + %i2]
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%l0
	nop
	set	0x18, %g1
	std	%o2,	[%l7 + %g1]
	set	0x30, %o2
	sta	%f10,	[%l7 + %o2] 0x89
	set	0x48, %i7
	stxa	%l4,	[%l7 + %i7] 0x80
	set	0x0C, %o1
	stwa	%o5,	[%l7 + %o1] 0x80
	nop
	set	0x4C, %i0
	stw	%i4,	[%l7 + %i0]
	nop
	set	0x22, %g5
	ldsb	[%l7 + %g5],	%g1
	set	0x74, %l6
	lda	[%l7 + %l6] 0x89,	%f31
	bge,a	%xcc,	loop_140
	or	%o1,	%o4,	%i3
	ld	[%l7 + 0x08],	%f7
	bn	%xcc,	loop_141
loop_140:
	nop
	nop
	setx	0xD1587D12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x62495441,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f29,	%f10
	nop
	set	0x12, %l0
	lduh	[%l7 + %l0],	%i2
	nop
	set	0x4E, %l4
	sth	%l1,	[%l7 + %l4]
loop_141:
	nop
	set	0x75, %o0
	ldstub	[%l7 + %o0],	%o7
	nop
	set	0x1C, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x30, %o3
	ldx	[%l7 + %o3],	%g3
	set	0x40, %o4
	stxa	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x56, %o5
	ldstuba	[%l7 + %o5] 0x80,	%l3
	nop
	set	0x60, %g6
	ldsb	[%l7 + %g6],	%g7
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc8
	nop
	set	0x12, %i3
	ldub	[%l7 + %i3],	%l5
	nop
	set	0x09, %i5
	ldstub	[%l7 + %i5],	%i0
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x88,	%f15
	set	0x78, %i1
	stxa	%g6,	[%l7 + %i1] 0x88
	nop
	set	0x68, %l1
	lduw	[%l7 + %l1],	%o2
	set	0x20, %g3
	stba	%g4,	[%l7 + %g3] 0x88
	and	%l6,	%i1,	%i7
	set	0x58, %i6
	stxa	%g2,	[%l7 + %i6] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f16
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%l2
	nop
	set	0x5C, %l5
	swap	[%l7 + %l5],	%i5
	nop
	set	0x50, %g7
	stw	%i6,	[%l7 + %g7]
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x81,	 1
	st	%fsr,	[%l7 + 0x2C]
	set	0x40, %i2
	sta	%f26,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd0
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xe3,	%l0
	fpsub32s	%f10,	%f18,	%f20
	or	%l4,	%o5,	%o3
	nop
	set	0x28, %o2
	std	%f16,	[%l7 + %o2]
	set	0x10, %g1
	stxa	%g1,	[%l7 + %g1] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f16
	fpadd16	%f26,	%f16,	%f16
	add	%i4,	%o1,	%i3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f0
	fpadd16	%f18,	%f4,	%f28
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%i2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l1
	nop
	set	0x7D, %l6
	ldsb	[%l7 + %l6],	%g3
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x80,	%o7
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f6
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd0
	nop
	nop
	setx	0x2BE9E97F4B5C6F26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD374BFAB4DEA74ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f20
	ld	[%l7 + 0x34],	%f6
	nop
	set	0x5C, %g2
	stw	%o0,	[%l7 + %g2]
	add	%l3,	%g7,	%i0
	nop
	set	0x64, %o3
	swap	[%l7 + %o3],	%l5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%g4
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%l6
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x88,	 2
	nop
	set	0x40, %g6
	std	%i6,	[%l7 + %g6]
	set	0x40, %o0
	stda	%g2,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x08, %l3
	std	%o6,	[%l7 + %l3]
	nop
	nop
	setx	0xA0E7B03E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x0DAF54E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f26,	%f14
	set	0x26, %i3
	stha	%o2,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x78, %l2
	stda	%l2,	[%l7 + %l2] 0xeb
	membar	#Sync
	st	%f0,	[%l7 + 0x08]
	st	%f7,	[%l7 + 0x10]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f16
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xe3,	%i4
	nop
	set	0x4A, %i6
	ldsb	[%l7 + %i6],	%i6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xcc
	and	%l0,	%g5,	%l4
	and	%o5,	%g1,	%i4
	and	%o3,	%i3,	%i2
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x89,	%o4
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf8
	membar	#Sync
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0DF, 	%tick_cmpr
	nop
	set	0x58, %i2
	stx	%l1,	[%l7 + %i2]
	nop
	set	0x69, %g7
	ldub	[%l7 + %g7],	%o7
	set	0x64, %i4
	sta	%f19,	[%l7 + %i4] 0x88
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%o0
	st	%f25,	[%l7 + 0x68]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%l3
	set	0x58, %o2
	stda	%i0,	[%l7 + %o2] 0x88
	nop
	set	0x29, %o1
	ldub	[%l7 + %o1],	%g6
	ld	[%l7 + 0x38],	%f4
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x78, %g5
	stba	%g4,	[%l7 + %g5] 0xeb
	membar	#Sync
	fpsub16s	%f28,	%f28,	%f31
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l5
	set	0x64, %i0
	stwa	%i1,	[%l7 + %i0] 0x81
	nop
	set	0x54, %l6
	ldsb	[%l7 + %l6],	%g2
	or	%i7,	%o6,	%o2
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%l2
	nop
	set	0x6B, %l4
	stb	%i5,	[%l7 + %l4]
	set	0x08, %g2
	sta	%f10,	[%l7 + %g2] 0x80
	add	%i6,	%l0,	%l4
	ld	[%l7 + 0x34],	%f26
	nop
	set	0x38, %i7
	std	%f22,	[%l7 + %i7]
	fpsub16s	%f14,	%f26,	%f25
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o5
	set	0x08, %o5
	stda	%g4,	[%l7 + %o5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x70],	%f29
	set	0x67, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i4
	nop
	set	0x30, %o0
	std	%f26,	[%l7 + %o0]
	nop
	set	0x7C, %o3
	lduh	[%l7 + %o3],	%g1
	nop
	set	0x08, %i3
	sth	%i3,	[%l7 + %i3]
	nop
	set	0x54, %l3
	ldsh	[%l7 + %l3],	%i2
	nop
	set	0x20, %l2
	stx	%o4,	[%l7 + %l2]
	add	%o1,	%o3,	%l1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%o0
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 3
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc0
	fpsub32s	%f23,	%f2,	%f25
	set	0x10, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	or	%g3,	%i0,	%g6
	set	0x08, %i5
	stxa	%g4,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x51, %o7
	ldstub	[%l7 + %o7],	%l6
	nop
	set	0x50, %l5
	std	%l4,	[%l7 + %l5]
	set	0x74, %i2
	stwa	%i1,	[%l7 + %i2] 0x80
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%i7
	nop
	set	0x5C, %o6
	stw	%g2,	[%l7 + %o6]
	set	0x5D, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o6
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f10
	set	0x75, %o2
	stba	%o2,	[%l7 + %o2] 0x80
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xda
	nop
	set	0x20, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%i5
	set	0x18, %g4
	stwa	%i6,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x78, %l6
	stwa	%l0,	[%l7 + %l6] 0x89
	and	%l4,	%g5,	%o5
	nop
	set	0x10, %l0
	stx	%g1,	[%l7 + %l0]
	or	%i4,	%i2,	%i3
	nop
	set	0x2D, %l4
	ldsb	[%l7 + %l4],	%o4
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 1
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	set	0x2C, %g2
	stwa	%o1,	[%l7 + %g2] 0x81
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%l1
	set	0x5C, %g6
	lda	[%l7 + %g6] 0x81,	%f31
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%o7
	set	0x71, %o0
	stba	%g7,	[%l7 + %o0] 0x89
	nop
	set	0x08, %o3
	stw	%g3,	[%l7 + %o3]
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%o0
	nop
	set	0x60, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd0
	or	%g6,	%i0,	%l6
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%l5
	ld	[%l7 + 0x20],	%f24
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%g4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%i7
	nop
	set	0x20, %i6
	lduh	[%l7 + %i6],	%g2
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	ld	[%l7 + 0x1C],	%f31
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf9
	membar	#Sync
	nop
	set	0x4C, %o7
	lduw	[%l7 + %o7],	%o2
	nop
	set	0x58, %o6
	std	%f18,	[%l7 + %o6]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%l0
	set	0x44, %i2
	stha	%l4,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x0B, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g5
	nop
	set	0x4D, %i4
	ldub	[%l7 + %i4],	%o5
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%i6
	fpadd32s	%f29,	%f10,	%f13
	nop
	set	0x5F, %o2
	ldsb	[%l7 + %o2],	%i4
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x88,	%g1
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x89,	 4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%i2
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%l1
	set	0x40, %l6
	stha	%o1,	[%l7 + %l6] 0x81
	nop
	set	0x30, %l0
	swap	[%l7 + %l0],	%o7
	nop
	set	0x68, %g4
	stw	%o3,	[%l7 + %g4]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%g7
	nop
	set	0x40, %i7
	std	%f22,	[%l7 + %i7]
	set	0x50, %o4
	stda	%g6,	[%l7 + %o4] 0x88
	nop
	set	0x50, %g2
	stx	%i0,	[%l7 + %g2]
	nop
	set	0x1A, %l4
	lduh	[%l7 + %l4],	%l6
	set	0x0C, %o5
	stha	%l5,	[%l7 + %o5] 0x81
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x89,	 2
	set	0x68, %g6
	stxa	%i1,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	set	0x24, %l2
	swapa	[%l7 + %l2] 0x88,	%i7
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xeb,	%g4
	nop
	set	0x68, %i1
	std	%f0,	[%l7 + %i1]
	nop
	set	0x4A, %l1
	sth	%o6,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f0
	set	0x70, %i3
	stda	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f0
	nop
	set	0x30, %l5
	stw	%o2,	[%l7 + %l5]
	nop
	set	0x60, %o7
	stx	%l2,	[%l7 + %o7]
	set	0x42, %o6
	stba	%i5,	[%l7 + %o6] 0x81
	fpadd16s	%f1,	%f30,	%f1
	nop
	set	0x34, %i2
	ldsw	[%l7 + %i2],	%l0
	set	0x18, %g7
	stxa	%l3,	[%l7 + %g7] 0xe3
	membar	#Sync
	st	%f23,	[%l7 + 0x0C]
	nop
	set	0x14, %i4
	ldsw	[%l7 + %i4],	%g5
	or	%o5,	%l4,	%i4
	nop
	set	0x3C, %o1
	stw	%i6,	[%l7 + %o1]
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f22
	bleu,a	%icc,	loop_142
	fpsub32	%f30,	%f28,	%f26
	set	0x4A, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g1
loop_142:
	nop
	set	0x78, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x6C, %i0
	swap	[%l7 + %i0],	%o4
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%i2
	nop
	set	0x60, %l0
	ldsh	[%l7 + %l0],	%i3
	set	0x62, %g4
	stba	%o1,	[%l7 + %g4] 0x80
	set	0x66, %g1
	stha	%o7,	[%l7 + %g1] 0x81
	nop
	set	0x09, %o4
	ldstub	[%l7 + %o4],	%l1
	set	0x54, %i7
	stwa	%o3,	[%l7 + %i7] 0x89
	nop
	set	0x10, %g2
	ldstub	[%l7 + %g2],	%g3
	nop
	set	0x70, %o5
	lduw	[%l7 + %o5],	%g7
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc8
	set	0x28, %l4
	stxa	%i0,	[%l7 + %l4] 0xea
	membar	#Sync
	and	%g6,	%l5,	%o0
	set	0x28, %g6
	stda	%i6,	[%l7 + %g6] 0x88
	nop
	set	0x56, %l2
	ldsh	[%l7 + %l2],	%i1
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	nop
	set	0x18, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x08, %i6
	stw	%o6,	[%l7 + %i6]
	set	0x2C, %i3
	swapa	[%l7 + %i3] 0x80,	%g4
	or	%o2,	%l2,	%g2
	nop
	nop
	setx	0x0C65571C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xBBF45A6D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f4,	%f6
	st	%f6,	[%l7 + 0x20]
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%l0
	nop
	set	0x70, %l5
	lduw	[%l7 + %l5],	%i5
	nop
	set	0x7B, %l1
	ldstub	[%l7 + %l1],	%g5
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%l3
	set	0x18, %o6
	stha	%o5,	[%l7 + %o6] 0x80
	nop
	set	0x24, %g7
	ldsw	[%l7 + %g7],	%i4
	set	0x08, %i4
	stda	%i6,	[%l7 + %i4] 0x81
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%g1
	nop
	set	0x5F, %i5
	stb	%l4,	[%l7 + %i5]
	nop
	set	0x18, %i2
	swap	[%l7 + %i2],	%i2
	nop
	set	0x38, %o2
	ldsh	[%l7 + %o2],	%i3
	nop
	set	0x7E, %g5
	ldstub	[%l7 + %g5],	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%o7
	set	0x6A, %l6
	stha	%l1,	[%l7 + %l6] 0x88
	set	0x3E, %i0
	stba	%g3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 1
	add	%g7,	%o3,	%i0
	set	0x18, %g1
	stda	%l4,	[%l7 + %g1] 0x80
	st	%f31,	[%l7 + 0x58]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%o0
	set	0x48, %o4
	stda	%i6,	[%l7 + %o4] 0x88
	nop
	set	0x4C, %i7
	stw	%i1,	[%l7 + %i7]
	set	0x68, %o5
	stxa	%i7,	[%l7 + %o5] 0x80
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xcc
	nop
	set	0x10, %l4
	stx	%o6,	[%l7 + %l4]
	nop
	set	0x2E, %o0
	ldub	[%l7 + %o0],	%g4
	set	0x4D, %l2
	stba	%g6,	[%l7 + %l2] 0x89
	set	0x40, %o3
	sta	%f16,	[%l7 + %o3] 0x88
	nop
	set	0x4D, %g6
	ldstub	[%l7 + %g6],	%o2
	nop
	set	0x35, %i1
	stb	%l2,	[%l7 + %i1]
	nop
	nop
	setx	0x4BA080D734FE7AD7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4A1743B9FEF174DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f4
	set	0x4E, %i6
	stba	%g2,	[%l7 + %i6] 0x88
	set	0x58, %l3
	stda	%l0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%i4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f16
	set	0x24, %l1
	swapa	[%l7 + %l1] 0x80,	%l3
	nop
	set	0x78, %l5
	prefetch	[%l7 + %l5],	 1
	add	%g5,	%o5,	%i4
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x81,	%i2
	set	0x67, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l4
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	wr	%o1,	%i3,	%softint
	set	0x62, %i2
	stha	%o4,	[%l7 + %i2] 0xeb
	membar	#Sync
	ld	[%l7 + 0x58],	%f23
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	nop
	nop
	setx	0x9819FBEEDA894DC0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x80E0E7D3A55FDBAD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f10,	%f28
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%g3
	ld	[%l7 + 0x44],	%f0
	ld	[%l7 + 0x70],	%f21
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f16
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%g7
	set	0x5C, %g5
	stwa	%l1,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x70, %g1
	stda	%i0,	[%l7 + %g1] 0x81
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x50, %o4
	stx	%l5,	[%l7 + %o4]
	set	0x48, %l0
	stha	%o0,	[%l7 + %l0] 0xe2
	membar	#Sync
	fpadd16	%f6,	%f20,	%f24
	nop
	set	0x5A, %i7
	lduh	[%l7 + %i7],	%l6
	set	0x60, %o5
	sta	%f4,	[%l7 + %o5] 0x80
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xe2,	%i0
	set	0x18, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o3
	nop
	set	0x38, %l2
	std	%o6,	[%l7 + %l2]
	nop
	set	0x55, %g2
	stb	%g4,	[%l7 + %g2]
	set	0x30, %g6
	ldda	[%l7 + %g6] 0xe3,	%g6
	nop
	set	0x28, %i1
	stx	%o2,	[%l7 + %i1]
	nop
	set	0x20, %o3
	ldsw	[%l7 + %o3],	%l2
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xe2,	%g2
	or	%i7,	%l0,	%i5
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x88,	 1
	add	%g5,	%i4,	%g1
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x89,	 1
	set	0x56, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i6
	fpadd16s	%f11,	%f14,	%f2
	set	0x44, %l5
	stha	%i2,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x0C, %o7
	stha	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%o1
	set	0x58, %g7
	stda	%i2,	[%l7 + %g7] 0x88
	nop
	set	0x1F, %o1
	ldub	[%l7 + %o1],	%o4
	nop
	set	0x50, %o6
	ldub	[%l7 + %o6],	%o7
	or	%g7,	%l1,	%i0
	set	0x54, %i2
	lda	[%l7 + %i2] 0x88,	%f29
	nop
	set	0x28, %i4
	stx	%g3,	[%l7 + %i4]
	nop
	set	0x20, %o2
	stx	%fsr,	[%l7 + %o2]
	ld	[%l7 + 0x5C],	%f13
	nop
	set	0x52, %i5
	ldstub	[%l7 + %i5],	%o0
	wr	%l6,	%i1,	%softint
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x80,	 0
	set	0x28, %i0
	stxa	%o6,	[%l7 + %i0] 0xe3
	membar	#Sync
	st	%f8,	[%l7 + 0x20]
	nop
	set	0x78, %g1
	ldsw	[%l7 + %g1],	%g4
	nop
	set	0x68, %g4
	sth	%g6,	[%l7 + %g4]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%l5
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%g2
	set	0x29, %l0
	stba	%l2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x6A, %o4
	ldstub	[%l7 + %o4],	%l0
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc2
	set	0x5C, %l4
	swapa	[%l7 + %l4] 0x88,	%i7
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f0
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f24
	set	0x3E, %g2
	stba	%i5,	[%l7 + %g2] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%i4
	set	0x31, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l3
	set	0x3E, %o0
	ldstuba	[%l7 + %o0] 0x80,	%g1
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%o4
	set	0x63, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i6
	nop
	set	0x70, %g3
	ldsw	[%l7 + %g3],	%l4
	set	0x38, %i6
	stxa	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x48, %i3
	sth	%i3,	[%l7 + %i3]
	nop
	set	0x20, %l3
	std	%f12,	[%l7 + %l3]
	ld	[%l7 + 0x78],	%f31
	nop
	set	0x59, %o7
	ldub	[%l7 + %o7],	%o1
	set	0x11, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o4
	nop
	set	0x0C, %g7
	ldsb	[%l7 + %g7],	%o7
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xe3,	%g6
	nop
	set	0x08, %o6
	lduw	[%l7 + %o6],	%i0
	nop
	set	0x52, %i2
	ldstub	[%l7 + %i2],	%g3
	or	%o0,	%l1,	%i1
	and	%o3,	%l6,	%o6
	set	0x28, %i4
	stda	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x30, %o2
	stda	%o2,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x60, %i5
	sth	%l5,	[%l7 + %i5]
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x89,	%g2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f16
	nop
	set	0x73, %g1
	ldstub	[%l7 + %g1],	%l2
	or	%l0,	%i7,	%g4
	add	%i5,	%g5,	%i4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%o5
	ld	[%l7 + 0x28],	%f25
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf1
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%l4
	nop
	set	0x72, %i0
	ldsh	[%l7 + %i0],	%i6
	nop
	set	0x22, %g5
	ldsh	[%l7 + %g5],	%i2
	add	%o1,	%o4,	%i3
	ld	[%l7 + 0x58],	%f7
	ld	[%l7 + 0x78],	%f2
	wr	%o7,	%i0,	%clear_softint
	set	0x10, %o4
	stxa	%g3,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x88,	%g7
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x81,	 2
	nop
	set	0x42, %i7
	sth	%o0,	[%l7 + %i7]
	nop
	set	0x64, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x10, %g2
	std	%f6,	[%l7 + %g2]
	nop
	nop
	setx	0x619D24B8FBFCFF56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5D7171082FC231A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f22
	nop
	set	0x58, %g6
	swap	[%l7 + %g6],	%i1
	nop
	set	0x7E, %o0
	sth	%l6,	[%l7 + %o0]
	nop
	nop
	setx	0x4C7E8843544A351D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDB9475EA3A9CEB29,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f2,	%f30
	set	0x2F, %o3
	stba	%o6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%o3
	add	%o2,	%l5,	%g6
	ld	[%l7 + 0x24],	%f30
	nop
	set	0x64, %g3
	ldstub	[%l7 + %g3],	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%l0
	bg,pt	%xcc,	loop_143
	nop
	set	0x7A, %i1
	ldub	[%l7 + %i1],	%i7
	st	%fsr,	[%l7 + 0x20]
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
loop_143:
	nop
	set	0x5E, %i6
	stha	%i5,	[%l7 + %i6] 0x80
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%i4
	ba,a,pt	%icc,	loop_144
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%g4
	nop
	set	0x38, %g7
	std	%g0,	[%l7 + %g7]
	set	0x10, %l5
	lda	[%l7 + %l5] 0x88,	%f8
loop_144:
	ld	[%l7 + 0x28],	%f3
	nop
	set	0x58, %o6
	stw	%l3,	[%l7 + %o6]
	nop
	set	0x48, %i2
	std	%f24,	[%l7 + %i2]
	nop
	set	0x4A, %o1
	ldstub	[%l7 + %o1],	%o5
	nop
	set	0x1C, %i4
	stb	%i6,	[%l7 + %i4]
	nop
	set	0x14, %o2
	swap	[%l7 + %o2],	%l4
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%i2
	nop
	set	0x28, %l1
	stx	%o1,	[%l7 + %l1]
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%i3
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	set	0x7B, %g1
	stba	%o7,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x2E, %g5
	stha	%g3,	[%l7 + %g5] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%l1
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%o0
	set	0x6C, %i0
	sta	%f9,	[%l7 + %i0] 0x89
	nop
	set	0x0A, %l4
	lduh	[%l7 + %l4],	%i0
	nop
	set	0x48, %i7
	stx	%i1,	[%l7 + %i7]
	nop
	nop
	setx	0x7E65A54F7685146E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF8BD158097F67CE3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f4
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x78, %l0
	lda	[%l7 + %l0] 0x81,	%f17
	set	0x2E, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l6
	nop
	set	0x54, %g2
	swap	[%l7 + %g2],	%o6
	set	0x14, %o0
	stha	%o2,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%o3
	fpadd32s	%f11,	%f25,	%f31
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%l4
	nop
	set	0x20, %g3
	stx	%l2,	[%l7 + %g3]
	set	0x50, %i3
	lda	[%l7 + %i3] 0x81,	%f4
	or	%g2,	%l0,	%g6
	add	%g4,	%i5,	%i7
	nop
	set	0x70, %i1
	std	%f22,	[%l7 + %i1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x13B, 	%tick_cmpr
	nop
	set	0x2C, %o7
	swap	[%l7 + %o7],	%l3
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x88,	 2
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f26
	nop
	set	0x70, %l5
	stw	%o5,	[%l7 + %l5]
	wr	%l4,	%i6,	%softint
	nop
	set	0x08, %g7
	sth	%o1,	[%l7 + %g7]
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x81,	%i2
	set	0x78, %o6
	stwa	%i3,	[%l7 + %o6] 0x88
	ld	[%l7 + 0x3C],	%f31
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%o7
	nop
	set	0x08, %i4
	std	%f16,	[%l7 + %i4]
	bgu,a,pt	%xcc,	loop_145
	nop
	set	0x18, %o1
	std	%f10,	[%l7 + %o1]
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x88,	%g3
loop_145:
	nop
	set	0x40, %l1
	stda	%g6,	[%l7 + %l1] 0x81
	nop
	set	0x2E, %i5
	ldsh	[%l7 + %i5],	%o0
	nop
	set	0x50, %g4
	sth	%i0,	[%l7 + %g4]
	nop
	set	0x60, %g1
	stx	%l1,	[%l7 + %g1]
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%i0
	set	0x30, %o4
	stxa	%l6,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x50, %o2
	lduw	[%l7 + %o2],	%o2
	set	0x70, %l4
	stxa	%o6,	[%l7 + %l4] 0x80
	nop
	set	0x20, %i0
	std	%o2,	[%l7 + %i0]
	add	%l2,	%l5,	%g2
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x78, %l0
	stda	%l0,	[%l7 + %l0] 0x89
	nop
	set	0x6A, %g6
	sth	%g6,	[%l7 + %g6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i7
	nop
	set	0x1C, %o0
	ldsh	[%l7 + %o0],	%g5
	set	0x30, %l2
	ldxa	[%l7 + %l2] 0x80,	%i5
	set	0x1C, %o3
	stha	%l3,	[%l7 + %o3] 0x81
	set	0x30, %g3
	stxa	%g1,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x37, %g2
	ldstub	[%l7 + %g2],	%o5
	nop
	set	0x48, %i1
	std	%f0,	[%l7 + %i1]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i6
	nop
	set	0x0E, %o7
	sth	%o1,	[%l7 + %o7]
	nop
	set	0x62, %i3
	ldsb	[%l7 + %i3],	%i2
	ld	[%l7 + 0x38],	%f19
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%i4
	set	0x10, %i6
	swapa	[%l7 + %i6] 0x81,	%i3
	set	0x10, %l5
	sta	%f17,	[%l7 + %l5] 0x80
	set	0x5C, %g7
	lda	[%l7 + %g7] 0x89,	%f22
	fpsub16	%f28,	%f22,	%f4
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%o6
	or	%g3,	%o4,	%g7
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%f21,	[%l7 + 0x0C]
	nop
	set	0x78, %o1
	ldsw	[%l7 + %o1],	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%i1
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x18, %l1
	swapa	[%l7 + %l1] 0x81,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%o6
	nop
	set	0x2B, %i4
	ldub	[%l7 + %i4],	%o3
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%l0
	nop
	set	0x14, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x08, %g1
	stx	%l2,	[%l7 + %g1]
	nop
	set	0x68, %g5
	stx	%l5,	[%l7 + %g5]
	wr 	%g0, 	0x7, 	%fprs
	and	%l0,	%i7,	%g5
	nop
	set	0x3C, %o2
	stw	%g4,	[%l7 + %o2]
	fpsub32s	%f2,	%f7,	%f1
	or	%i5,	%l3,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%o5
	set	0x60, %l4
	ldxa	[%l7 + %l4] 0x80,	%i6
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x81,	%o1
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	nop
	set	0x14, %o5
	ldsw	[%l7 + %o5],	%i3
	set	0x68, %i7
	sta	%f10,	[%l7 + %i7] 0x88
	or	%o7,	%i4,	%g3
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	add	%o4,	%i0,	%o0
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%i6
	or	%i1,	%o2,	%o6
	set	0x30, %g6
	ldda	[%l7 + %g6] 0xe3,	%l0
	nop
	set	0x68, %o3
	stx	%l2,	[%l7 + %o3]
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x81,	%l5
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%g2
	nop
	set	0x61, %l2
	stb	%o3,	[%l7 + %l2]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%i7
	nop
	set	0x3C, %i1
	lduw	[%l7 + %i1],	%l0
	set	0x08, %i3
	stda	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x68, %o7
	std	%i4,	[%l7 + %o7]
	and	%g4,	%g1,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%i6
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x80,	%l2
	nop
	set	0x66, %l5
	ldsh	[%l7 + %l5],	%i2
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0
	nop
	set	0x60, %i6
	prefetch	[%l7 + %i6],	 4
	set	0x20, %i2
	stwa	%i3,	[%l7 + %i2] 0x89
	set	0x7C, %o1
	stba	%o7,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x47, %l6
	ldsb	[%l7 + %l6],	%i4
	and	%g3,	%g7,	%o4
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x80,	%i0
	set	0x69, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o0
	set	0x34, %o6
	swapa	[%l7 + %o6] 0x80,	%i1
	set	0x50, %g4
	stwa	%o2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x44, %i5
	swap	[%l7 + %i5],	%o6
	set	0x12, %g1
	stha	%l1,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x3C, %o2
	sta	%f16,	[%l7 + %o2] 0x88
	nop
	set	0x74, %l4
	lduw	[%l7 + %l4],	%l6
	nop
	set	0x28, %i0
	swap	[%l7 + %i0],	%l2
	ld	[%l7 + 0x58],	%f0
	nop
	set	0x46, %o4
	lduh	[%l7 + %o4],	%l5
	and	%g2,	%g6,	%o3
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x80,	%l0
	set	0x1B, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i7
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xe2,	%i4
	nop
	set	0x58, %o0
	lduw	[%l7 + %o0],	%g4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xda
	or	%g1,	%l4,	%o5
	nop
	set	0x0B, %g3
	ldub	[%l7 + %g3],	%i6
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	set	0x40, %o3
	stxa	%l3,	[%l7 + %o3] 0x88
	nop
	set	0x10, %l2
	std	%o0,	[%l7 + %l2]
	nop
	set	0x42, %i1
	sth	%i2,	[%l7 + %i1]
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x81,	%o7
	set	0x28, %l3
	stba	%i4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x3A, %l5
	ldsh	[%l7 + %l5],	%g3
	fpsub16s	%f5,	%f19,	%f12
	set	0x64, %g7
	stwa	%g7,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x38, %i3
	ldub	[%l7 + %i3],	%i3
	add	%o4,	%o0,	%i1
	set	0x2C, %i6
	lda	[%l7 + %i6] 0x81,	%f9
	st	%f0,	[%l7 + 0x08]
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x89,	%i0
	set	0x74, %l6
	stwa	%o6,	[%l7 + %l6] 0x80
	nop
	set	0x6D, %o1
	ldsb	[%l7 + %o1],	%o2
	st	%f3,	[%l7 + 0x2C]
	nop
	set	0x14, %i4
	sth	%l1,	[%l7 + %i4]
	nop
	set	0x48, %l1
	std	%i6,	[%l7 + %l1]
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%l5
	set	0x50, %g4
	stda	%l2,	[%l7 + %g4] 0x89
	set	0x5A, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%g2
	set	0x2C, %i5
	sta	%f14,	[%l7 + %i5] 0x89
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%i7
	set	0x48, %l4
	lda	[%l7 + %l4] 0x88,	%f4
	set	0x68, %i0
	stxa	%i5,	[%l7 + %i0] 0x88
	nop
	set	0x34, %o4
	ldsw	[%l7 + %o4],	%g4
	ld	[%l7 + 0x0C],	%f29
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 0
	bgu,a	%xcc,	loop_146
	nop
	set	0x18, %o2
	lduh	[%l7 + %o2],	%l4
	nop
	set	0x50, %i7
	ldsw	[%l7 + %i7],	%g1
	wr	%i6,	%g5,	%sys_tick
loop_146:
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f20
	nop
	set	0x0C, %o0
	stw	%l3,	[%l7 + %o0]
	set	0x75, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o5
	nop
	set	0x2B, %g5
	ldstub	[%l7 + %g5],	%i2
	st	%f2,	[%l7 + 0x34]
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%o7
	st	%f20,	[%l7 + 0x2C]
	nop
	set	0x23, %o3
	ldsb	[%l7 + %o3],	%o1
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%i4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	set	0x78, %o7
	stda	%g2,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x38, %l3
	stda	%g6,	[%l7 + %l3] 0xe3
	membar	#Sync
	wr	%i3,	%o0,	%sys_tick
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x89,	%i0
	nop
	set	0x28, %g7
	stx	%o4,	[%l7 + %g7]
	nop
	set	0x1A, %i3
	sth	%i0,	[%l7 + %i3]
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x81,	 4
	nop
	set	0x20, %i2
	std	%f16,	[%l7 + %i2]
	nop
	set	0x20, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x40, %l6
	ldub	[%l7 + %l6],	%l1
	nop
	set	0x60, %i4
	stx	%l6,	[%l7 + %i4]
	set	0x24, %o1
	stwa	%o6,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x44, %l1
	lduw	[%l7 + %l1],	%l2
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%l5
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x88
	or	%o3,	%g2,	%l0
	nop
	set	0x0C, %i5
	ldsw	[%l7 + %i5],	%g6
	nop
	set	0x08, %g1
	ldsh	[%l7 + %g1],	%i5
	nop
	set	0x60, %i0
	stb	%i7,	[%l7 + %i0]
	fpadd32	%f20,	%f12,	%f8
	be,pn	%xcc,	loop_147
	nop
	set	0x21, %o4
	ldub	[%l7 + %o4],	%g4
	ld	[%l7 + 0x68],	%f8
	nop
	set	0x40, %o5
	stw	%g1,	[%l7 + %o5]
loop_147:
	and	%i6,	%l4,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x509, 	%sys_tick_cmpr
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%o7
	nop
	set	0x34, %o2
	stw	%g5,	[%l7 + %o2]
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%o1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1245
!	Type a   	: 24
!	Type cti   	: 23
!	Type x   	: 538
!	Type f   	: 49
!	Type i   	: 121
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
	set	0xC,	%g2
	set	0xD,	%g3
	set	0xE,	%g4
	set	0x1,	%g5
	set	0xE,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x6,	%i1
	set	-0xA,	%i2
	set	-0x2,	%i3
	set	-0x9,	%i4
	set	-0xD,	%i5
	set	-0xC,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x6EF313FA,	%l0
	set	0x6D3FD227,	%l1
	set	0x7B8D63D8,	%l2
	set	0x75F6253C,	%l3
	set	0x6828F217,	%l4
	set	0x6AA46A2F,	%l5
	set	0x2C171FB3,	%l6
	!# Output registers
	set	-0x1285,	%o0
	set	0x0BB2,	%o1
	set	0x0842,	%o2
	set	0x1505,	%o3
	set	0x19BC,	%o4
	set	-0x0418,	%o5
	set	0x0F25,	%o6
	set	-0x01F1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%g2
	nop
	set	0x78, %o0
	std	%i4,	[%l7 + %o0]
	ld	[%l7 + 0x50],	%f0
	nop
	set	0x50, %g6
	lduw	[%l7 + %g6],	%g7
	nop
	set	0x28, %g5
	prefetch	[%l7 + %g5],	 4
	ld	[%l7 + 0x30],	%f22
	add	%i3,	%i1,	%o4
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%i0
	set	0x42, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o2
	nop
	set	0x26, %l2
	sth	%o0,	[%l7 + %l2]
	fpadd16	%f24,	%f2,	%f26
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x80,	%l6
	nop
	set	0x60, %l3
	ldsw	[%l7 + %l3],	%l1
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x88,	%o6
	nop
	set	0x18, %o7
	std	%f18,	[%l7 + %o7]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xda
	set	0x20, %i6
	lda	[%l7 + %i6] 0x80,	%f6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f0
	nop
	set	0x2C, %i3
	swap	[%l7 + %i3],	%l5
	and	%l2,	%o3,	%g2
	set	0x44, %l6
	lda	[%l7 + %l6] 0x80,	%f15
	set	0x40, %i4
	sta	%f14,	[%l7 + %i4] 0x80
	set	0x20, %i1
	stda	%g6,	[%l7 + %i1] 0x88
	nop
	set	0x4C, %l1
	lduw	[%l7 + %l1],	%l0
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x81
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%i6
	st	%fsr,	[%l7 + 0x44]
	set	0x1C, %o1
	stwa	%g4,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x80,	%g1
	nop
	set	0x74, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x5C, %i0
	lduh	[%l7 + %i0],	%i6
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x89,	 1
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%i5
	fpsub32	%f22,	%f30,	%f30
	and	%l3,	%i2,	%o7
	add	%o5,	%o1,	%g5
	add	%i4,	%g3,	%g7
	nop
	set	0x40, %o2
	ldstub	[%l7 + %o2],	%i3
	wr	%i1,	%i0,	%softint
	set	0x14, %l4
	stwa	%o4,	[%l7 + %l4] 0x89
	set	0x30, %l0
	stwa	%o0,	[%l7 + %l0] 0x88
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l1
	nop
	set	0x08, %o0
	stx	%o6,	[%l7 + %o0]
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x89,	%l5
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%l6
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%l2
	nop
	set	0x74, %g6
	stw	%g2,	[%l7 + %g6]
	and	%o3,	%g6,	%l0
	and	%i7,	%g1,	%i6
	nop
	set	0x78, %l2
	swap	[%l7 + %l2],	%g4
	set	0x70, %g2
	stwa	%i5,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x24, %l3
	ldsh	[%l7 + %l3],	%l3
	nop
	set	0x1C, %g3
	ldub	[%l7 + %g3],	%l4
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x81,	 2
	fpsub16	%f18,	%f26,	%f18
	and	%i2,	%g5,	%o1
	set	0x3C, %i6
	sta	%f18,	[%l7 + %i6] 0x81
	set	0x60, %i2
	stha	%g3,	[%l7 + %i2] 0x80
	or	%i4,	%g7,	%i3
	nop
	set	0x18, %i3
	std	%i0,	[%l7 + %i3]
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x80,	%i1
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x68, %i1
	stda	%o0,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x0A, %g7
	stha	%o4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x24, %l1
	swapa	[%l7 + %l1] 0x88,	%l1
	add	%o2,	%o6,	%l5
	set	0x70, %g4
	sta	%f17,	[%l7 + %g4] 0x81
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%f8
	st	%f28,	[%l7 + 0x58]
	nop
	set	0x44, %o6
	prefetch	[%l7 + %o6],	 1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%l6
	set	0x10, %i5
	stha	%g2,	[%l7 + %i5] 0x88
	nop
	set	0x24, %g1
	sth	%o3,	[%l7 + %g1]
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%l0
	and	%i7,	%g6,	%i6
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f20
	nop
	set	0x11, %o2
	ldsb	[%l7 + %o2],	%g1
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%l3
	fpsub16s	%f1,	%f1,	%f19
	nop
	set	0x22, %l0
	ldsh	[%l7 + %l0],	%i5
	set	0x78, %i7
	stha	%l4,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x5C, %o0
	sta	%f14,	[%l7 + %o0] 0x81
	nop
	set	0x0C, %o3
	ldsh	[%l7 + %o3],	%o7
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 3
	add	%i2,	%g5,	%o1
	nop
	set	0x24, %l2
	stw	%g3,	[%l7 + %l2]
	nop
	set	0x78, %g5
	stb	%i4,	[%l7 + %g5]
	nop
	set	0x38, %l3
	ldx	[%l7 + %l3],	%o5
	nop
	set	0x1F, %g3
	ldstub	[%l7 + %g3],	%i3
	nop
	set	0x60, %g2
	ldx	[%l7 + %g2],	%g7
	nop
	set	0x50, %o7
	std	%f26,	[%l7 + %o7]
	nop
	set	0x36, %l5
	ldub	[%l7 + %l5],	%i1
	nop
	set	0x0C, %i6
	swap	[%l7 + %i6],	%o0
	st	%f4,	[%l7 + 0x10]
	nop
	set	0x60, %i2
	ldsw	[%l7 + %i2],	%i0
	set	0x28, %l6
	stda	%o4,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%f25,	[%l7 + 0x54]
	nop
	set	0x0A, %i4
	sth	%l1,	[%l7 + %i4]
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x80,	%o6
	nop
	set	0x39, %g7
	ldsb	[%l7 + %g7],	%l5
	set	0x40, %l1
	stda	%o2,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x08, %g4
	sth	%l2,	[%l7 + %g4]
	set	0x4C, %i3
	stba	%g2,	[%l7 + %i3] 0x80
	set	0x20, %o6
	stda	%i6,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x64, %o1
	stw	%o3,	[%l7 + %o1]
	ba,pt	%xcc,	loop_148
	nop
	set	0x70, %g1
	std	%f0,	[%l7 + %g1]
	nop
	set	0x34, %i0
	stw	%l0,	[%l7 + %i0]
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
loop_148:
	nop
	set	0x70, %i5
	std	%g6,	[%l7 + %i5]
	st	%f15,	[%l7 + 0x1C]
	set	0x10, %o2
	lda	[%l7 + %o2] 0x89,	%f15
	set	0x50, %o4
	stxa	%i6,	[%l7 + %o4] 0xe2
	membar	#Sync
	and	%g4,	%g1,	%i5
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf8
	membar	#Sync
	st	%f29,	[%l7 + 0x60]
	st	%f11,	[%l7 + 0x10]
	nop
	set	0x60, %l4
	stx	%l4,	[%l7 + %l4]
	nop
	set	0x2A, %i7
	lduh	[%l7 + %i7],	%l3
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x37, %o3
	ldub	[%l7 + %o3],	%o7
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f4
	add	%i2,	%g5,	%g3
	nop
	set	0x38, %g5
	stx	%i4,	[%l7 + %g5]
	st	%f30,	[%l7 + 0x0C]
	nop
	nop
	setx	0x23B403B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x400B8AC5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f11,	%f2
	st	%fsr,	[%l7 + 0x44]
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0
	nop
	set	0x4D, %g3
	ldstub	[%l7 + %g3],	%o1
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x80,	%g6
	ble	%icc,	loop_149
	nop
	set	0x09, %g2
	ldstub	[%l7 + %g2],	%i1
	nop
	set	0x37, %o7
	ldstub	[%l7 + %o7],	%i3
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f14
loop_149:
	wr	%i0,	%o4,	%clear_softint
	nop
	set	0x18, %i2
	stw	%l1,	[%l7 + %i2]
	set	0x68, %l6
	stda	%o0,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%f26
	and	%l5,	%o2,	%o6
	nop
	set	0x0F, %i4
	ldub	[%l7 + %i4],	%g2
	set	0x68, %i1
	ldxa	[%l7 + %i1] 0x88,	%l6
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%o3
	nop
	set	0x70, %l1
	prefetch	[%l7 + %l1],	 4
	add	%l2,	%i7,	%g6
	set	0x7C, %i3
	sta	%f26,	[%l7 + %i3] 0x81
	and	%l0,	%i6,	%g1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i5
	nop
	set	0x3A, %g4
	lduh	[%l7 + %g4],	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x005, 	%tick_cmpr
	nop
	set	0x10, %o6
	std	%f22,	[%l7 + %o6]
	set	0x79, %g1
	stba	%g5,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x38, %i0
	std	%f18,	[%l7 + %i0]
	set	0x08, %o5
	stwa	%l4,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xe2,	%g2
	nop
	set	0x44, %i5
	ldsh	[%l7 + %i5],	%i4
	fpadd32	%f16,	%f14,	%f2
	nop
	set	0x6F, %o2
	ldsb	[%l7 + %o2],	%o5
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xea,	%o0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc4
	nop
	set	0x38, %l4
	ldsw	[%l7 + %l4],	%g7
	nop
	set	0x2E, %i7
	lduh	[%l7 + %i7],	%i3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x34, %o3
	ldsh	[%l7 + %o3],	%i1
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%o4
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x0C, %l2
	lda	[%l7 + %l2] 0x89,	%f6
	set	0x3C, %g3
	stwa	%l1,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%i0
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%g2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe3,	%i6
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%o6
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%l2
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f16
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%g6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%g1,	%g4,	%i6
	nop
	set	0x18, %i6
	swap	[%l7 + %i6],	%i5
	fpadd16s	%f21,	%f10,	%f23
	and	%l3,	%i2,	%o7
	nop
	set	0x76, %i1
	ldstub	[%l7 + %i1],	%g5
	nop
	set	0x26, %g7
	ldub	[%l7 + %g7],	%l4
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x89,	%g2
	and	%i4,	%o5,	%o1
	set	0x48, %i3
	stxa	%i3,	[%l7 + %i3] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%g7
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd0,	%f16
	nop
	set	0x16, %g4
	ldsb	[%l7 + %g4],	%l1
	add	%o0,	%o4,	%l5
	set	0x40, %i0
	stda	%i0,	[%l7 + %i0] 0x80
	set	0x2C, %o5
	stba	%o2,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x08, %g1
	stxa	%l6,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x10, %o1
	ldsh	[%l7 + %o1],	%g2
	nop
	set	0x54, %l0
	stw	%l2,	[%l7 + %l0]
	set	0x13, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f16
	set	0x38, %i7
	sta	%f20,	[%l7 + %i7] 0x89
	set	0x79, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o6
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f26
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%g6
	fpadd16	%f22,	%f16,	%f28
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	fpadd16	%f12,	%f30,	%f24
	nop
	set	0x7E, %g3
	ldstub	[%l7 + %g3],	%g1
	add	%g4,	%i7,	%i5
	ld	[%l7 + 0x54],	%f30
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x80,	%i6
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc2
	add	%i2,	%o7,	%g5
	set	0x78, %g2
	swapa	[%l7 + %g2] 0x80,	%l4
	nop
	set	0x46, %o7
	ldsh	[%l7 + %o7],	%l3
	nop
	set	0x18, %l5
	prefetch	[%l7 + %l5],	 1
	and	%g3,	%o5,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i1
	nop
	set	0x74, %i2
	lduw	[%l7 + %i2],	%g7
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f30
	nop
	set	0x38, %i6
	std	%i4,	[%l7 + %i6]
	set	0x24, %i1
	sta	%f13,	[%l7 + %i1] 0x89
	nop
	set	0x1A, %l6
	ldstub	[%l7 + %l6],	%l1
	nop
	set	0x56, %l1
	stb	%o0,	[%l7 + %l1]
	be,pt	%icc,	loop_150
	nop
	set	0x22, %g7
	lduh	[%l7 + %g7],	%o4
	set	0x6C, %i3
	sta	%f22,	[%l7 + %i3] 0x80
loop_150:
	fpsub32	%f26,	%f30,	%f10
	nop
	set	0x38, %i4
	sth	%i0,	[%l7 + %i4]
	nop
	set	0x18, %o6
	lduw	[%l7 + %o6],	%o2
	nop
	set	0x38, %g4
	std	%f22,	[%l7 + %g4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%l6
	or	%l2,	%o3,	%g2
	set	0x38, %o5
	stxa	%l0,	[%l7 + %o5] 0x89
	nop
	set	0x68, %g1
	ldstub	[%l7 + %g1],	%o6
	nop
	set	0x6C, %i5
	ldsh	[%l7 + %i5],	%g6
	nop
	set	0x60, %i0
	swap	[%l7 + %i0],	%g4
	set	0x7C, %o1
	stha	%g1,	[%l7 + %o1] 0x89
	wr	%i5,	%i7,	%clear_softint
	add	%i6,	%o7,	%g5
	and	%l4,	%l3,	%g3
	nop
	set	0x28, %l0
	std	%o4,	[%l7 + %l0]
	st	%f19,	[%l7 + 0x0C]
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%i2
	set	0x64, %o4
	sta	%f0,	[%l7 + %o4] 0x80
	or	%i3,	%i1,	%o1
	set	0x08, %l4
	stda	%g6,	[%l7 + %l4] 0x89
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f16
	nop
	set	0x50, %o0
	lduh	[%l7 + %o0],	%l1
	set	0x20, %g5
	stxa	%i4,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x48, %g3
	stx	%o4,	[%l7 + %g3]
	nop
	set	0x68, %g6
	prefetch	[%l7 + %g6],	 2
	st	%f17,	[%l7 + 0x6C]
	set	0x20, %i7
	stxa	%i0,	[%l7 + %i7] 0x80
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	nop
	set	0x52, %l2
	ldsh	[%l7 + %l2],	%o2
	nop
	set	0x41, %o7
	ldub	[%l7 + %o7],	%l5
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x89,	%o0
	nop
	set	0x20, %i2
	stw	%l6,	[%l7 + %i2]
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x80,	%o3
	nop
	set	0x48, %i1
	sth	%l2,	[%l7 + %i1]
	nop
	set	0x64, %i6
	ldstub	[%l7 + %i6],	%l0
	bleu,a	%xcc,	loop_151
	nop
	set	0x0C, %l6
	ldsh	[%l7 + %l6],	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%g4
loop_151:
	nop
	set	0x42, %g7
	ldsh	[%l7 + %g7],	%g6
	nop
	set	0x74, %i3
	prefetch	[%l7 + %i3],	 2
	set	0x70, %l1
	stxa	%g1,	[%l7 + %l1] 0x80
	set	0x52, %i4
	stha	%i5,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x89,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%g5
	set	0x50, %g4
	stxa	%i7,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x5C, %o5
	stw	%l4,	[%l7 + %o5]
	nop
	set	0x58, %i5
	std	%g2,	[%l7 + %i5]
	nop
	set	0x74, %i0
	ldsh	[%l7 + %i0],	%o5
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x80,	%l3
	nop
	set	0x1D, %o1
	ldsb	[%l7 + %o1],	%i2
	nop
	set	0x1C, %l0
	ldub	[%l7 + %l0],	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%i3
	set	0x2C, %o2
	stba	%l1,	[%l7 + %o2] 0x80
	nop
	nop
	setx	0xBB115C2C86611C0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x27CE6DF639231EE6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xca
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g7
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x80,	 4
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f4
	wr	%i0,	%o4,	%pic
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x80,	%o2
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f26
	wr	%l5,	%l6,	%sys_tick
	nop
	set	0x48, %i7
	ldstub	[%l7 + %i7],	%o0
	nop
	set	0x3A, %g2
	ldsh	[%l7 + %g2],	%l2
	and	%l0,	%g2,	%o3
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%g4
	and	%o6,	%g1,	%g6
	and	%i5,	%o7,	%g5
	set	0x70, %o7
	stha	%i6,	[%l7 + %o7] 0xea
	membar	#Sync
	or	%i7,	%g3,	%l4
	set	0x10, %l5
	stha	%o5,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x40, %i2
	stxa	%i2,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%l3
	nop
	set	0x38, %i1
	stx	%i1,	[%l7 + %i1]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f0
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f24
	or	%o1,	%i3,	%l1
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%g6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%o4
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%i4
	set	0x50, %g6
	stda	%l4,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x2C, %i4
	lda	[%l7 + %i4] 0x81,	%f2
	nop
	set	0x48, %g4
	stx	%o2,	[%l7 + %g4]
	bgu,a	%icc,	loop_152
	or	%l6,	%l2,	%o0
	set	0x78, %o5
	sta	%f26,	[%l7 + %o5] 0x81
loop_152:
	nop
	set	0x6A, %i5
	sth	%g2,	[%l7 + %i5]
	or	%l0,	%g4,	%o6
	wr	%o3,	%g6,	%y
	set	0x30, %i0
	stxa	%i5,	[%l7 + %i0] 0x88
	st	%f1,	[%l7 + 0x78]
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o7
	nop
	set	0x45, %o1
	ldub	[%l7 + %o1],	%g1
	or	%g5,	%i7,	%g3
	wr	%l4,	%i6,	%y
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x80,	%o5
	set	0x50, %o2
	stwa	%l3,	[%l7 + %o2] 0x88
	nop
	set	0x58, %o6
	std	%f2,	[%l7 + %o6]
	add	%i1,	%i2,	%o1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%g7
	nop
	set	0x18, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%i0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1AD, 	%sys_tick_cmpr
	nop
	set	0x60, %o4
	stx	%l5,	[%l7 + %o4]
	set	0x60, %o0
	stba	%o2,	[%l7 + %o0] 0x89
	set	0x28, %g5
	stxa	%i4,	[%l7 + %g5] 0x81
	set	0x10, %g3
	stda	%l2,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x1F, %g2
	ldub	[%l7 + %g2],	%o0
	and	%l6,	%l0,	%g4
	set	0x38, %i7
	lda	[%l7 + %i7] 0x81,	%f23
	set	0x38, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g2
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%o6
	nop
	set	0x60, %i2
	std	%g6,	[%l7 + %i2]
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x88,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o7,	%g1
	nop
	set	0x1E, %i1
	ldsb	[%l7 + %i1],	%o3
	nop
	set	0x47, %i6
	ldstub	[%l7 + %i6],	%g5
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xeb,	%g2
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f12
	st	%fsr,	[%l7 + 0x0C]
	set	0x74, %i3
	lda	[%l7 + %i3] 0x80,	%f22
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xd2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i7
	ld	[%l7 + 0x10],	%f9
	st	%f18,	[%l7 + 0x1C]
	nop
	set	0x12, %g6
	ldub	[%l7 + %g6],	%o5
	nop
	set	0x68, %l3
	prefetch	[%l7 + %l3],	 4
	bge,pt	%xcc,	loop_153
	nop
	set	0x68, %i4
	swap	[%l7 + %i4],	%i6
	set	0x34, %o5
	sta	%f18,	[%l7 + %o5] 0x89
loop_153:
	nop
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x80,	%f31
	set	0x48, %g1
	lda	[%l7 + %g1] 0x88,	%f23
	nop
	set	0x08, %i5
	ldsw	[%l7 + %i5],	%i1
	add	%l3,	%o1,	%i3
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x80,	%i2
	set	0x60, %o2
	stha	%i0,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%o4
	nop
	set	0x24, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x30, %l4
	stw	%g7,	[%l7 + %l4]
	nop
	set	0x34, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x68, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%l1,	%o2,	%l5
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x80,	%l2
	st	%f6,	[%l7 + 0x6C]
	set	0x0C, %g3
	sta	%f2,	[%l7 + %g3] 0x88
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe2,	%o0
	nop
	set	0x30, %i7
	std	%i6,	[%l7 + %i7]
	nop
	set	0x60, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x68, %l2
	swapa	[%l7 + %l2] 0x80,	%i4
	set	0x68, %i2
	stwa	%l0,	[%l7 + %i2] 0x89
	set	0x28, %l5
	stxa	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x50, %o7
	stx	%o6,	[%l7 + %o7]
	nop
	set	0x0E, %i1
	ldub	[%l7 + %i1],	%g2
	nop
	set	0x19, %i6
	ldstub	[%l7 + %i6],	%g6
	nop
	set	0x60, %g7
	ldstub	[%l7 + %g7],	%o7
	nop
	set	0x30, %i3
	stx	%g1,	[%l7 + %i3]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%i5
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	nop
	set	0x58, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x2C, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%g4
	nop
	nop
	setx	0x9123FEAC3D089757,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC91285AFFC82C949,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f12
	nop
	set	0x64, %o5
	stw	%l4,	[%l7 + %o5]
	set	0x78, %i0
	stda	%g2,	[%l7 + %i0] 0x89
	st	%f22,	[%l7 + 0x0C]
	set	0x40, %g4
	sta	%f4,	[%l7 + %g4] 0x88
	nop
	set	0x10, %g1
	stx	%i7,	[%l7 + %g1]
	wr	%o5,	%i6,	%softint
	nop
	set	0x4C, %l0
	lduh	[%l7 + %l0],	%l3
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc8
	nop
	set	0x28, %o2
	lduw	[%l7 + %o2],	%i1
	set	0x40, %o6
	stda	%i2,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x24, %l4
	ldsw	[%l7 + %l4],	%o1
	nop
	set	0x68, %o1
	stx	%i2,	[%l7 + %o1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o4
	set	0x08, %o0
	stda	%g6,	[%l7 + %o0] 0x80
	and	%o2,	%l1,	%l2
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x88,	%o0
	nop
	set	0x39, %g5
	ldsb	[%l7 + %g5],	%l5
	wr	%l6,	%l0,	%softint
	set	0x1C, %g3
	lda	[%l7 + %g3] 0x88,	%f12
	nop
	set	0x2E, %g2
	ldsh	[%l7 + %g2],	%i4
	add	%g4,	%o6,	%g2
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%f30
	set	0x58, %l2
	stxa	%o7,	[%l7 + %l2] 0x89
	fpsub16	%f12,	%f10,	%f20
	nop
	set	0x18, %o3
	ldx	[%l7 + %o3],	%g1
	set	0x58, %i2
	stwa	%g6,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x10, %o7
	stx	%i5,	[%l7 + %o7]
	nop
	set	0x7F, %i1
	ldstub	[%l7 + %i1],	%g5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f16
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x80
	nop
	set	0x68, %g7
	stx	%o3,	[%l7 + %g7]
	nop
	set	0x40, %i3
	stx	%g3,	[%l7 + %i3]
	nop
	set	0x16, %l1
	ldsh	[%l7 + %l1],	%i7
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%o5
	fpadd32s	%f24,	%f4,	%f27
	nop
	set	0x08, %i4
	stx	%i6,	[%l7 + %i4]
	ble,a,pt	%icc,	loop_154
	wr 	%g0, 	0x5, 	%fprs
	ld	[%l7 + 0x30],	%f20
	set	0x64, %l6
	stwa	%i1,	[%l7 + %l6] 0xe3
	membar	#Sync
loop_154:
	nop
	set	0x28, %g6
	stx	%i3,	[%l7 + %g6]
	nop
	set	0x0C, %o5
	lduw	[%l7 + %o5],	%i2
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x1C, %g1
	stw	%i0,	[%l7 + %g1]
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f28
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x48, %g4
	stw	%g7,	[%l7 + %g4]
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x88,	%o4
	set	0x54, %o1
	stwa	%l1,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x20, %o2
	stda	%l2,	[%l7 + %o2] 0xeb
	membar	#Sync
	ld	[%l7 + 0x58],	%f1
	nop
	set	0x38, %o0
	ldsh	[%l7 + %o0],	%o0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l5
	nop
	set	0x60, %o4
	stw	%l0,	[%l7 + %o4]
	bleu,pt	%xcc,	loop_155
	nop
	set	0x2C, %g5
	stw	%g4,	[%l7 + %g5]
	and	%o6,	%g2,	%o7
	nop
	set	0x5B, %g2
	stb	%i4,	[%l7 + %g2]
loop_155:
	or	%g6,	%g1,	%g5
	nop
	set	0x58, %g3
	std	%i4,	[%l7 + %g3]
	nop
	set	0x40, %l2
	std	%g2,	[%l7 + %l2]
	set	0x68, %o3
	stxa	%o3,	[%l7 + %o3] 0x88
	fpadd32s	%f13,	%f25,	%f0
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%o5
	nop
	set	0x24, %i2
	stw	%i6,	[%l7 + %i2]
	nop
	set	0x14, %o7
	swap	[%l7 + %o7],	%i7
	st	%fsr,	[%l7 + 0x14]
	set	0x5C, %i6
	sta	%f19,	[%l7 + %i6] 0x81
	nop
	set	0x36, %i1
	ldub	[%l7 + %i1],	%l4
	set	0x28, %g7
	sta	%f21,	[%l7 + %g7] 0x88
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe3,	%l2
	nop
	set	0x58, %i3
	std	%f10,	[%l7 + %i3]
	set	0x40, %l3
	lda	[%l7 + %l3] 0x80,	%f28
	or	%i3,	%i2,	%o1
	set	0x50, %l1
	stwa	%i1,	[%l7 + %l1] 0xe3
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%o2
	nop
	set	0x4A, %i4
	lduh	[%l7 + %i4],	%g7
	set	0x68, %l6
	stxa	%o4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o0
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f24
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xe2,	%i6
	set	0x3A, %l0
	stha	%l2,	[%l7 + %l0] 0x80
	nop
	set	0x18, %i5
	stx	%l0,	[%l7 + %i5]
	nop
	set	0x50, %g4
	swap	[%l7 + %g4],	%l5
	nop
	set	0x38, %o6
	ldsw	[%l7 + %o6],	%o6
	ld	[%l7 + 0x3C],	%f11
	nop
	set	0x58, %g1
	lduh	[%l7 + %g1],	%g4
	nop
	set	0x68, %l4
	stx	%g2,	[%l7 + %l4]
	wr	%o7,	%i4,	%softint
	nop
	set	0x50, %o2
	ldsh	[%l7 + %o2],	%g1
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xe3,	%g4
	add	%g6,	%g3,	%i5
	nop
	set	0x6C, %o4
	ldub	[%l7 + %o4],	%o3
	nop
	set	0x78, %g5
	ldsh	[%l7 + %g5],	%o5
	ld	[%l7 + 0x54],	%f12
	set	0x74, %o0
	sta	%f25,	[%l7 + %o0] 0x89
	ba,a	%icc,	loop_156
	nop
	set	0x3C, %g3
	lduh	[%l7 + %g3],	%i6
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%l4
	nop
	set	0x18, %g2
	stw	%l3,	[%l7 + %g2]
loop_156:
	nop
	set	0x6A, %i7
	lduh	[%l7 + %i7],	%i3
	nop
	set	0x32, %o3
	ldstub	[%l7 + %o3],	%i7
	and	%i2,	%i1,	%o1
	st	%fsr,	[%l7 + 0x3C]
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f0
	nop
	set	0x36, %o7
	ldsb	[%l7 + %o7],	%i0
	nop
	set	0x32, %i1
	ldub	[%l7 + %i1],	%o2
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%o4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f16
	nop
	set	0x4C, %i3
	ldstub	[%l7 + %i3],	%g7
	add	%l1,	%o0,	%l6
	nop
	set	0x0C, %l3
	sth	%l2,	[%l7 + %l3]
	and	%l5,	%o6,	%l0
	nop
	set	0x30, %l5
	std	%g4,	[%l7 + %l5]
	set	0x78, %i4
	stxa	%o7,	[%l7 + %i4] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%g1
	nop
	set	0x3A, %l6
	ldsb	[%l7 + %l6],	%i4
	wr	%g6,	%g5,	%softint
	nop
	set	0x10, %o5
	ldsb	[%l7 + %o5],	%g3
	or	%i5,	%o3,	%o5
	nop
	set	0x40, %g6
	ldsw	[%l7 + %g6],	%i6
	add	%l4,	%i3,	%i7
	add	%i2,	%i1,	%l3
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x30, %i0
	prefetch	[%l7 + %i0],	 0
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%i0
	set	0x08, %l0
	stha	%o1,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x18, %i5
	sth	%o2,	[%l7 + %i5]
	nop
	set	0x2E, %g4
	ldub	[%l7 + %g4],	%o4
	st	%fsr,	[%l7 + 0x54]
	set	0x30, %o6
	ldda	[%l7 + %o6] 0xeb,	%l0
	nop
	set	0x28, %l4
	std	%f16,	[%l7 + %l4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%l6
	add	%g7,	%l2,	%l5
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%g4
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xe3,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%g1
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%o6
	set	0x5A, %g5
	stba	%g6,	[%l7 + %g5] 0x89
	and	%g5,	%g3,	%i4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%o5
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x81,	%i5
	nop
	set	0x66, %g3
	ldsh	[%l7 + %g3],	%i6
	nop
	set	0x78, %l2
	std	%f20,	[%l7 + %l2]
	or	%i3,	%i7,	%i2
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x88,	%i1
	nop
	set	0x18, %o4
	swap	[%l7 + %o4],	%l4
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xd8
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%l3
	nop
	set	0x10, %i7
	std	%i0,	[%l7 + %i7]
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%o2
	nop
	set	0x68, %i1
	lduw	[%l7 + %i1],	%o4
	set	0x15, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o1
	set	0x3A, %i3
	stha	%l1,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f0
	nop
	set	0x36, %l5
	ldsh	[%l7 + %l5],	%l6
	fpadd16	%f4,	%f14,	%f8
	and	%g7,	%l2,	%o0
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f2
	set	0x58, %l6
	stxa	%l0,	[%l7 + %l6] 0x81
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f4
	set	0x28, %o5
	stxa	%l5,	[%l7 + %o5] 0x80
	set	0x0D, %g6
	stba	%g4,	[%l7 + %g6] 0x89
	nop
	set	0x4C, %l1
	ldstub	[%l7 + %l1],	%o6
	nop
	set	0x0A, %i0
	sth	%g1,	[%l7 + %i0]
	nop
	set	0x2A, %l0
	ldub	[%l7 + %l0],	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%o7
	st	%f20,	[%l7 + 0x30]
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x40, %o6
	lda	[%l7 + %o6] 0x88,	%f13
	nop
	set	0x40, %l4
	lduw	[%l7 + %l4],	%g5
	nop
	set	0x74, %g4
	sth	%i4,	[%l7 + %g4]
	set	0x38, %g1
	stxa	%o3,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x54, %o2
	swapa	[%l7 + %o2] 0x88,	%o5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%i6
	nop
	set	0x0E, %o1
	ldsh	[%l7 + %o1],	%i3
	nop
	set	0x50, %g5
	std	%f26,	[%l7 + %g5]
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x88,	%i5
	nop
	set	0x14, %o0
	ldub	[%l7 + %o0],	%i7
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%i1
	set	0x38, %g2
	stwa	%l4,	[%l7 + %g2] 0x89
	nop
	set	0x4B, %o4
	stb	%l3,	[%l7 + %o4]
	set	0x48, %o3
	stxa	%i2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%o2
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x71, %i7
	ldsb	[%l7 + %i7],	%o1
	nop
	set	0x0A, %i1
	ldsh	[%l7 + %i1],	%o4
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xcc
	nop
	set	0x1C, %i3
	sth	%l1,	[%l7 + %i3]
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%f2
	nop
	set	0x28, %i6
	std	%i6,	[%l7 + %i6]
	fpsub16s	%f24,	%f26,	%f4
	nop
	set	0x40, %l5
	stx	%fsr,	[%l7 + %l5]
	ld	[%l7 + 0x68],	%f5
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	be,a,pn	%icc,	loop_157
	or	%g7,	%o0,	%l2
	nop
	set	0x68, %i4
	swap	[%l7 + %i4],	%l0
	set	0x6C, %l3
	sta	%f11,	[%l7 + %l3] 0x80
loop_157:
	nop
	set	0x5A, %o5
	ldstub	[%l7 + %o5],	%g4
	set	0x10, %g6
	stxa	%o6,	[%l7 + %g6] 0x88
	set	0x40, %l1
	swapa	[%l7 + %l1] 0x81,	%l5
	set	0x3E, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g1
	nop
	set	0x68, %i5
	std	%g2,	[%l7 + %i5]
	set	0x1C, %o6
	stba	%g6,	[%l7 + %o6] 0x89
	nop
	set	0x3C, %l0
	stw	%g5,	[%l7 + %l0]
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f10
	nop
	set	0x74, %g1
	lduh	[%l7 + %g1],	%i4
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x88,	%o3
	nop
	set	0x34, %o1
	ldsw	[%l7 + %o1],	%o7
	set	0x10, %o2
	stha	%o5,	[%l7 + %o2] 0x88
	nop
	set	0x38, %g3
	std	%f6,	[%l7 + %g3]
	nop
	set	0x30, %g5
	stw	%i6,	[%l7 + %g5]
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%g2
	and	%i5,	%i3,	%i1
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x88,	%i7
	or	%l4,	%l3,	%i2
	nop
	set	0x1E, %o0
	ldub	[%l7 + %o0],	%o2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f16
	nop
	set	0x48, %i2
	lduw	[%l7 + %i2],	%o1
	nop
	set	0x28, %i7
	std	%o4,	[%l7 + %i7]
	nop
	set	0x0C, %i1
	stw	%i0,	[%l7 + %i1]
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%l6
	set	0x18, %i3
	lda	[%l7 + %i3] 0x89,	%f18
	add	%g7,	%o0,	%l2
	nop
	set	0x66, %o7
	ldsh	[%l7 + %o7],	%l0
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x80,	%l1
	nop
	set	0x38, %l5
	swap	[%l7 + %l5],	%g4
	ld	[%l7 + 0x58],	%f13
	set	0x78, %l6
	stxa	%o6,	[%l7 + %l6] 0x88
	nop
	set	0x6E, %g7
	ldsh	[%l7 + %g7],	%g1
	set	0x40, %l3
	stxa	%g2,	[%l7 + %l3] 0x88
	st	%f4,	[%l7 + 0x74]
	and	%g6,	%g5,	%i4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	nop
	set	0x48, %i4
	std	%f14,	[%l7 + %i4]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x81
	set	0x12, %l1
	stha	%o3,	[%l7 + %l1] 0x88
	nop
	set	0x72, %i0
	ldsh	[%l7 + %i0],	%l5
	nop
	set	0x68, %o6
	std	%o4,	[%l7 + %o6]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i6
	set	0x60, %l0
	stxa	%g3,	[%l7 + %l0] 0xe2
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%i1
	set	0x20, %g4
	stda	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x2E, %g1
	stb	%i3,	[%l7 + %g1]
	nop
	set	0x38, %l4
	stx	%l3,	[%l7 + %l4]
	nop
	set	0x5C, %i5
	ldsw	[%l7 + %i5],	%i2
	set	0x60, %o1
	stwa	%l4,	[%l7 + %o1] 0x81
	set	0x44, %o2
	stwa	%o1,	[%l7 + %o2] 0x80
	set	0x2C, %g3
	sta	%f11,	[%l7 + %g3] 0x89
	and	%o2,	%i0,	%l6
	set	0x4D, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o4
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%g7
	add	%l2,	%o0,	%l1
	nop
	set	0x2C, %o0
	ldsh	[%l7 + %o0],	%l0
	add	%g4,	%g1,	%g2
	set	0x78, %g5
	stda	%g6,	[%l7 + %g5] 0x80
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0
	nop
	set	0x68, %o3
	stx	%i4,	[%l7 + %o3]
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x81,	%o6
	nop
	set	0x60, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x81,	%l5
	nop
	set	0x47, %i3
	stb	%o5,	[%l7 + %i3]
	st	%f1,	[%l7 + 0x2C]
	wr	%o7,	%o3,	%y
	nop
	set	0x70, %i6
	lduw	[%l7 + %i6],	%g3
	set	0x24, %l5
	lda	[%l7 + %l5] 0x89,	%f10
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%i4
	fpadd32	%f16,	%f8,	%f6
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x0B, %g7
	ldstub	[%l7 + %g7],	%i1
	st	%f9,	[%l7 + 0x50]
	nop
	set	0x76, %l3
	lduh	[%l7 + %l3],	%i6
	nop
	set	0x38, %o5
	std	%f26,	[%l7 + %o5]
	nop
	set	0x30, %i4
	stx	%i3,	[%l7 + %i4]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xc4
	st	%fsr,	[%l7 + 0x3C]
	st	%f27,	[%l7 + 0x28]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	nop
	set	0x1E, %i0
	ldub	[%l7 + %i0],	%l3
	set	0x4F, %o6
	ldstuba	[%l7 + %o6] 0x88,	%i2
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xeb,	%i6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f0
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x38, %g4
	swap	[%l7 + %g4],	%o1
	set	0x40, %i5
	stwa	%o2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x56, %l4
	sth	%l4,	[%l7 + %l4]
	nop
	set	0x10, %o2
	prefetch	[%l7 + %o2],	 3
	nop
	set	0x3D, %o1
	ldstub	[%l7 + %o1],	%l6
	nop
	set	0x48, %l2
	std	%i0,	[%l7 + %l2]
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x80,	%o4
	nop
	set	0x59, %o0
	stb	%l2,	[%l7 + %o0]
	ld	[%l7 + 0x44],	%f5
	nop
	set	0x38, %g5
	stb	%o0,	[%l7 + %g5]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc4
	nop
	set	0x72, %i2
	ldsh	[%l7 + %i2],	%g7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%l0
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%g2
	set	0x30, %o3
	lda	[%l7 + %o3] 0x80,	%f23
	nop
	set	0x2C, %i7
	stw	%g5,	[%l7 + %i7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%i4
	nop
	set	0x58, %o4
	std	%f26,	[%l7 + %o4]
	set	0x68, %i1
	stxa	%o5,	[%l7 + %i1] 0xeb
	membar	#Sync
	fpadd16s	%f4,	%f1,	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%l5
	set	0x58, %i3
	stda	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%o3
	add	%i1,	%i6,	%i3
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%i2
	nop
	set	0x28, %g7
	swap	[%l7 + %g7],	%i7
	nop
	set	0x74, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%o2
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x0C, %l3
	ldstub	[%l7 + %l3],	%o1
	nop
	set	0x40, %o7
	stx	%l4,	[%l7 + %o7]
	ld	[%l7 + 0x5C],	%f22
	set	0x16, %l1
	stba	%l6,	[%l7 + %l1] 0x88
	st	%f9,	[%l7 + 0x50]
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f18
	set	0x6C, %l0
	lda	[%l7 + %l0] 0x81,	%f4
	nop
	set	0x68, %g6
	std	%o4,	[%l7 + %g6]
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%f12
	nop
	set	0x14, %g1
	stw	%i0,	[%l7 + %g1]
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f0
	set	0x74, %l4
	stba	%o0,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x28, %i5
	stx	%l2,	[%l7 + %i5]
	nop
	set	0x34, %o2
	prefetch	[%l7 + %o2],	 4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x1C, %g3
	stha	%l1,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x60, %l2
	sta	%f1,	[%l7 + %l2] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%g1
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%g4
	set	0x2D, %g5
	stba	%l0,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x30, %i2
	sta	%f6,	[%l7 + %i2] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%g6
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%o6
	nop
	set	0x30, %o4
	swap	[%l7 + %o4],	%i4
	nop
	set	0x58, %i7
	std	%o4,	[%l7 + %i7]
	or	%l5,	%g3,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%i6
	nop
	set	0x30, %i1
	lduw	[%l7 + %i1],	%i3
	nop
	set	0x15, %l5
	ldub	[%l7 + %l5],	%l3
	nop
	set	0x55, %i3
	stb	%o3,	[%l7 + %i3]
	nop
	set	0x0C, %g7
	ldub	[%l7 + %g7],	%i5
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 1
	and	%i2,	%o2,	%o1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f0
	nop
	set	0x2D, %l3
	ldsb	[%l7 + %l3],	%l4
	set	0x4F, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o4
	set	0x20, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	nop
	set	0x30, %l1
	ldsw	[%l7 + %l1],	%l6
	nop
	set	0x16, %i0
	ldsb	[%l7 + %i0],	%l2
	set	0x40, %g6
	stda	%l0,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x88,	%o0
	set	0x20, %g1
	stda	%g0,	[%l7 + %g1] 0x89
	set	0x38, %o6
	prefetcha	[%l7 + %o6] 0x80,	 2
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x88,	%l0
	nop
	set	0x50, %i5
	stx	%g2,	[%l7 + %i5]
	set	0x20, %o2
	lda	[%l7 + %o2] 0x89,	%f23
	set	0x42, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g6
	set	0x60, %g3
	stha	%g4,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x48, %o1
	stda	%o6,	[%l7 + %o1] 0xeb
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%o5
	nop
	set	0x18, %o0
	ldsb	[%l7 + %o0],	%g5
	fpadd16	%f0,	%f28,	%f26
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%o7
	set	0x14, %l2
	stwa	%g3,	[%l7 + %l2] 0x89
	set	0x40, %g5
	stxa	%i6,	[%l7 + %g5] 0x88
	set	0x6C, %i2
	lda	[%l7 + %i2] 0x80,	%f15
	nop
	set	0x10, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD0E, 	%tick_cmpr
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x88,	 0
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x80,	%i5
	nop
	set	0x14, %g2
	swap	[%l7 + %g2],	%l3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xcc
	set	0x18, %l5
	lda	[%l7 + %l5] 0x80,	%f28
	nop
	set	0x68, %i3
	std	%i6,	[%l7 + %i3]
	ld	[%l7 + 0x54],	%f9
	st	%fsr,	[%l7 + 0x1C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%o1
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x88,	%l4
	nop
	set	0x38, %g7
	lduh	[%l7 + %g7],	%o4
	nop
	set	0x48, %o5
	ldx	[%l7 + %o5],	%i0
	nop
	set	0x6E, %i6
	ldsb	[%l7 + %i6],	%l6
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%l2
	bl,a,pt	%xcc,	loop_158
	nop
	set	0x60, %o7
	swap	[%l7 + %o7],	%o2
	nop
	set	0x50, %i4
	ldub	[%l7 + %i4],	%l1
	nop
	set	0x30, %l1
	stb	%g1,	[%l7 + %l1]
loop_158:
	bleu	%icc,	loop_159
	add	%g7,	%o0,	%l0
	nop
	set	0x54, %i0
	lduw	[%l7 + %i0],	%g2
	and	%g4,	%g6,	%o6
loop_159:
	nop
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	nop
	set	0x35, %g6
	stb	%i4,	[%l7 + %g6]
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x89,	%g5
	nop
	set	0x1C, %i5
	stw	%o7,	[%l7 + %i5]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x88,	%g3,	%i6
	nop
	set	0x6C, %o6
	lduh	[%l7 + %o6],	%i1
	wr	%i3,	%o3,	%pic
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%l5
	nop
	set	0x28, %o2
	ldsb	[%l7 + %o2],	%l3
	ld	[%l7 + 0x5C],	%f24
	nop
	set	0x50, %g3
	stx	%i5,	[%l7 + %g3]
	or	%i7,	%o1,	%l4
	nop
	set	0x33, %o0
	stb	%i2,	[%l7 + %o0]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f0
	set	0x6C, %l2
	stwa	%i0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%i6
	or	%l2,	%o4,	%l1
	nop
	set	0x50, %g5
	ldub	[%l7 + %g5],	%g1
	be,a	%xcc,	loop_160
	nop
	set	0x58, %o3
	stw	%g7,	[%l7 + %o3]
	nop
	set	0x70, %o4
	stw	%o2,	[%l7 + %o4]
	bg	%icc,	loop_161
loop_160:
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf0
	membar	#Sync
loop_161:
	nop
	set	0x40, %l5
	stwa	%l0,	[%l7 + %l5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x5C, %i3
	ldsh	[%l7 + %i3],	%g4
	set	0x68, %g2
	stwa	%g2,	[%l7 + %g2] 0x80
	set	0x1C, %l6
	stwa	%o6,	[%l7 + %l6] 0x88
	nop
	set	0x7A, %o5
	lduh	[%l7 + %o5],	%g6
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xea,	%i4
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x80,	 1
	set	0x18, %o7
	stxa	%o7,	[%l7 + %o7] 0x80
	and	%g3,	%g5,	%i6
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%i3
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f2
	or	%o3,	%i1,	%l3
	ld	[%l7 + 0x6C],	%f1
	wr	%l5,	%i5,	%softint
	nop
	set	0x18, %i0
	std	%i6,	[%l7 + %i0]
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%o1
	or	%l4,	%i0,	%l6
	nop
	set	0x4C, %g6
	ldsw	[%l7 + %g6],	%l2
	set	0x56, %g1
	stha	%o4,	[%l7 + %g1] 0x89
	nop
	set	0x0C, %l0
	swap	[%l7 + %l0],	%l1
	nop
	set	0x78, %g4
	stw	%g1,	[%l7 + %g4]
	and	%g7,	%o2,	%i2
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%o0
	and	%l0,	%g4,	%o6
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x88,	%g6
	set	0x10, %o6
	stwa	%i4,	[%l7 + %o6] 0xeb
	membar	#Sync
	or	%o5,	%o7,	%g2
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f16
	set	0x40, %o0
	sta	%f2,	[%l7 + %o0] 0x81
	nop
	set	0x20, %o2
	sth	%g5,	[%l7 + %o2]
	nop
	set	0x43, %o1
	ldstub	[%l7 + %o1],	%g3
	nop
	set	0x40, %l2
	std	%i2,	[%l7 + %l2]
	set	0x5C, %g5
	sta	%f8,	[%l7 + %g5] 0x89
	and	%i6,	%i1,	%o3
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x80,	%l3
	fpsub16	%f6,	%f24,	%f4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%i7
	nop
	set	0x08, %o4
	std	%l4,	[%l7 + %o4]
	nop
	set	0x28, %i7
	std	%f10,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%l4
	set	0x28, %i1
	stha	%o1,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x20, %i3
	ldda	[%l7 + %i3] 0xe3,	%i0
	set	0x20, %l6
	stwa	%l6,	[%l7 + %l6] 0x81
	nop
	set	0x78, %o5
	stx	%l2,	[%l7 + %o5]
	set	0x18, %g2
	stda	%l0,	[%l7 + %g2] 0x88
	ld	[%l7 + 0x6C],	%f4
	nop
	set	0x44, %i6
	stw	%g1,	[%l7 + %i6]
	st	%f29,	[%l7 + 0x58]
	nop
	set	0x4C, %g7
	lduw	[%l7 + %g7],	%g7
	set	0x30, %o7
	stxa	%o2,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x3B, %l3
	ldstub	[%l7 + %l3],	%i2
	nop
	set	0x4E, %i0
	lduh	[%l7 + %i0],	%o0
	nop
	set	0x10, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x70, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x88,	 1
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%o6
	fpsub16	%f10,	%f14,	%f6
	set	0x20, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o5
	set	0x48, %i5
	stxa	%i4,	[%l7 + %i5] 0x88
	ld	[%l7 + 0x5C],	%f29
	fpadd32s	%f6,	%f11,	%f16
	set	0x1E, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o7
	set	0x64, %g6
	stha	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x10, %g3
	stwa	%g3,	[%l7 + %g3] 0x80
	bge,pt	%icc,	loop_162
	wr 	%g0, 	0x4, 	%fprs
	set	0x60, %o6
	sta	%f12,	[%l7 + %o6] 0x88
loop_162:
	wr 	%g0, 	0x7, 	%fprs
	set	0x4C, %o2
	stwa	%l3,	[%l7 + %o2] 0x81
	nop
	set	0x58, %o0
	lduh	[%l7 + %o0],	%i1
	set	0x4E, %o1
	ldstuba	[%l7 + %o1] 0x89,	%i5
	set	0x78, %l2
	sta	%f3,	[%l7 + %l2] 0x81
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xe3,	%i6
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%l4
	set	0x38, %o3
	lda	[%l7 + %o3] 0x89,	%f14
	nop
	set	0x30, %i7
	lduw	[%l7 + %i7],	%l5
	wr	%o1,	%l6,	%set_softint
	nop
	set	0x14, %l5
	stw	%l2,	[%l7 + %l5]
	set	0x18, %i2
	stwa	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x3C, %i3
	sth	%g1,	[%l7 + %i3]
	or	%g7,	%l1,	%o2
	nop
	set	0x6C, %i1
	ldsb	[%l7 + %i1],	%o0
	nop
	set	0x0D, %o5
	stb	%l0,	[%l7 + %o5]
	nop
	set	0x30, %g2
	std	%i2,	[%l7 + %g2]
	nop
	set	0x16, %l6
	stb	%o6,	[%l7 + %l6]
	set	0x70, %i6
	stda	%o4,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x81,	%g6
	fpsub32s	%f31,	%f29,	%f1
	ld	[%l7 + 0x60],	%f4
	st	%f21,	[%l7 + 0x6C]
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x81,	%g4
	set	0x70, %g7
	lda	[%l7 + %g7] 0x80,	%f17
	or	%o5,	%o7,	%i4
	nop
	set	0x40, %l1
	stx	%g2,	[%l7 + %l1]
	set	0x45, %i4
	stba	%g3,	[%l7 + %i4] 0x89
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x81,	%i2
	nop
	set	0x59, %i0
	stb	%g5,	[%l7 + %i0]
	nop
	set	0x60, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x28, %i5
	sth	%o3,	[%l7 + %i5]
	nop
	set	0x48, %l4
	ldub	[%l7 + %l4],	%l3
	set	0x10, %g4
	swapa	[%l7 + %g4] 0x89,	%i6
	nop
	set	0x5B, %g3
	stb	%i1,	[%l7 + %g3]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xe3,	%i6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%l5
	nop
	set	0x18, %o2
	stx	%i5,	[%l7 + %o2]
	nop
	set	0x34, %o0
	stw	%o1,	[%l7 + %o0]
	nop
	set	0x60, %o1
	sth	%l6,	[%l7 + %o1]
	st	%f11,	[%l7 + 0x34]
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x58, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x68, %o4
	sta	%f9,	[%l7 + %o4] 0x80
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f30
	nop
	set	0x30, %i7
	std	%f0,	[%l7 + %i7]
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x81,	%l2
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i0
	set	0x77, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%g1
	ld	[%l7 + 0x20],	%f9
	st	%f14,	[%l7 + 0x7C]
	ld	[%l7 + 0x28],	%f13
	set	0x76, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o0
	set	0x40, %i3
	stwa	%l0,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x67, %o5
	stba	%o2,	[%l7 + %o5] 0x81
	and	%o6,	%i2,	%g6
	st	%f16,	[%l7 + 0x40]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o5
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc8
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%g4
	nop
	set	0x10, %o7
	std	%o6,	[%l7 + %o7]
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x81,	%i4
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x81,	 4
	set	0x28, %l6
	stxa	%g2,	[%l7 + %l6] 0x89
	nop
	set	0x46, %i4
	ldsh	[%l7 + %i4],	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l3
	nop
	set	0x1C, %g1
	ldub	[%l7 + %g1],	%i6
	set	0x74, %i0
	swapa	[%l7 + %i0] 0x88,	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6AC, 	%sys_tick_cmpr
	wr	%i7,	%i5,	%softint
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x80,	%o1
	nop
	set	0x2A, %l1
	lduh	[%l7 + %l1],	%l5
	set	0x71, %i5
	stba	%l6,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x88,	%i0
	fpsub16	%f28,	%f22,	%f2
	ld	[%l7 + 0x2C],	%f14
	nop
	set	0x08, %g3
	stx	%l2,	[%l7 + %g3]
	bgu,a	%xcc,	loop_163
	nop
	set	0x2E, %o6
	ldstub	[%l7 + %o6],	%g7
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf9
	membar	#Sync
loop_163:
	nop
	set	0x20, %o1
	stxa	%l1,	[%l7 + %o1] 0xeb
	membar	#Sync
	fpadd32	%f24,	%f20,	%f26
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%l0
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%g1
	set	0x4C, %g6
	stba	%o6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x08, %o4
	swap	[%l7 + %o4],	%i2
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%g6
	nop
	set	0x13, %i7
	ldsb	[%l7 + %i7],	%o4
	set	0x60, %l5
	stwa	%o2,	[%l7 + %l5] 0x80
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x80,	 3
	set	0x4A, %l2
	ldstuba	[%l7 + %l2] 0x81,	%o7
	fpadd32s	%f10,	%f28,	%f6
	set	0x44, %o3
	swapa	[%l7 + %o3] 0x80,	%i4
	nop
	set	0x68, %i1
	stx	%g3,	[%l7 + %i1]
	set	0x6F, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g2
	nop
	set	0x2E, %g2
	sth	%o5,	[%l7 + %g2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%l3
	nop
	set	0x48, %i3
	stw	%i3,	[%l7 + %i3]
	ba,a,pt	%xcc,	loop_164
	nop
	set	0x08, %i6
	std	%f12,	[%l7 + %i6]
	nop
	set	0x18, %o7
	std	%f6,	[%l7 + %o7]
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x81,	%g5
loop_164:
	st	%fsr,	[%l7 + 0x5C]
	set	0x20, %l6
	lda	[%l7 + %l6] 0x88,	%f31
	set	0x33, %g7
	stba	%i1,	[%l7 + %g7] 0x88
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x88,	%l4
	nop
	set	0x78, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x38, %l0
	stda	%i6,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xeb,	%i4
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%l4
	set	0x08, %i0
	lda	[%l7 + %i0] 0x89,	%f1
	add	%i6,	%l6,	%l2
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x08, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x34, %g3
	sta	%f18,	[%l7 + %g3] 0x81
	set	0x40, %o1
	stda	%i0,	[%l7 + %o1] 0x89
	st	%f6,	[%l7 + 0x4C]
	nop
	set	0x5E, %o0
	ldsh	[%l7 + %o0],	%l1
	nop
	set	0x7C, %g6
	stw	%o0,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x28]
	ld	[%l7 + 0x24],	%f25
	set	0x50, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l0
	or	%g1,	%i2,	%g6
	nop
	set	0x64, %o4
	stw	%o6,	[%l7 + %o4]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%g4
	set	0x38, %i7
	stha	%o7,	[%l7 + %i7] 0x89
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%i4
	or	%o4,	%g3,	%g2
	set	0x70, %l5
	stda	%o2,	[%l7 + %l5] 0x89
	st	%f1,	[%l7 + 0x64]
	set	0x60, %l2
	stda	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x30, %o3
	stha	%i3,	[%l7 + %o3] 0x89
	fpsub16	%f12,	%f18,	%f26
	or	%o5,	%i1,	%g5
	set	0x70, %i1
	swapa	[%l7 + %i1] 0x88,	%l4
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f26
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%i6
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	set	0x10, %i6
	sta	%f13,	[%l7 + %i6] 0x89
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%o0
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xea,	%i4
	set	0x15, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l5
	nop
	set	0x35, %g7
	ldsb	[%l7 + %g7],	%i6
	ld	[%l7 + 0x74],	%f28
	nop
	set	0x4B, %i4
	ldstub	[%l7 + %i4],	%l2
	and	%g7,	%i0,	%l1
	nop
	nop
	setx	0xE13279DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x3D5A79F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f24,	%f3
	bgu,a,pn	%xcc,	loop_165
	wr	%o0,	%l6,	%y
	nop
	set	0x60, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%l0
loop_165:
	st	%fsr,	[%l7 + 0x0C]
	set	0x54, %l0
	ldstuba	[%l7 + %l0] 0x80,	%i2
	set	0x5C, %i5
	stha	%g1,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x18, %l1
	stba	%g6,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x48, %i0
	std	%o6,	[%l7 + %i0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x004, 	%sys_tick_cmpr
	nop
	set	0x1F, %g4
	stb	%o7,	[%l7 + %g4]
	nop
	set	0x6C, %o6
	ldsw	[%l7 + %o6],	%i4
	nop
	set	0x54, %l4
	ldsw	[%l7 + %l4],	%o4
	nop
	set	0x68, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x46, %o0
	stba	%g3,	[%l7 + %o0] 0x89
	nop
	set	0x6C, %g3
	lduw	[%l7 + %g3],	%g2
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xe3,	%l2
	nop
	set	0x6A, %o4
	sth	%i3,	[%l7 + %o4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%o3
	nop
	set	0x40, %g6
	ldsw	[%l7 + %g6],	%g5
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%i1
	nop
	set	0x78, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x57, %l5
	ldstub	[%l7 + %l5],	%i7
	nop
	set	0x58, %l2
	stx	%l4,	[%l7 + %l2]
	add	%i5,	%l5,	%i6
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x89,	%l2
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%g7
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%l1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%o0
	fpadd16s	%f15,	%f2,	%f25
	set	0x08, %g2
	ldxa	[%l7 + %g2] 0x88,	%l6
	set	0x11, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l0
	nop
	set	0x22, %i6
	ldsh	[%l7 + %i6],	%i2
	add	%g1,	%g6,	%o2
	nop
	set	0x76, %o5
	ldub	[%l7 + %o5],	%o6
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x89,	%g4
	nop
	set	0x18, %o7
	ldsw	[%l7 + %o7],	%i4
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f24
	nop
	set	0x2C, %i4
	ldstub	[%l7 + %i4],	%o4
	nop
	set	0x60, %i2
	lduw	[%l7 + %i2],	%g3
	set	0x40, %l6
	prefetcha	[%l7 + %l6] 0x89,	 3
	nop
	set	0x7C, %g1
	ldsw	[%l7 + %g1],	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%o5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	nop
	set	0x3F, %l1
	ldstub	[%l7 + %l1],	%i3
	set	0x60, %i0
	swapa	[%l7 + %i0] 0x81,	%g5
	nop
	set	0x12, %l0
	ldsh	[%l7 + %l0],	%i1
	set	0x08, %o6
	prefetcha	[%l7 + %o6] 0x89,	 4
	nop
	set	0x4A, %l4
	sth	%l4,	[%l7 + %l4]
	set	0x39, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f16
	wr	%l5,	%i6,	%pic
	set	0x68, %o0
	stda	%i4,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x6A, %g3
	sth	%g7,	[%l7 + %g3]
	set	0x7C, %o2
	stwa	%l2,	[%l7 + %o2] 0x80
	nop
	set	0x12, %o4
	sth	%i0,	[%l7 + %o4]
	set	0x30, %g5
	stha	%l1,	[%l7 + %g5] 0x88
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%o0
	nop
	set	0x1C, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x33, %l2
	stb	%o1,	[%l7 + %l2]
	add	%l0,	%l6,	%g1
	nop
	set	0x3C, %o3
	stw	%i2,	[%l7 + %o3]
	nop
	set	0x3C, %g6
	stw	%o2,	[%l7 + %g6]
	nop
	set	0x38, %g2
	std	%f6,	[%l7 + %g2]
	nop
	set	0x2A, %i1
	ldub	[%l7 + %i1],	%g6
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%g4
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%i4
	nop
	set	0x70, %l3
	ldsh	[%l7 + %l3],	%o6
	set	0x50, %o7
	stda	%g2,	[%l7 + %o7] 0x80
	nop
	set	0x69, %i3
	ldstub	[%l7 + %i3],	%o7
	nop
	set	0x6C, %i4
	ldsh	[%l7 + %i4],	%l3
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%g2
	nop
	set	0x0C, %g7
	stw	%o5,	[%l7 + %g7]
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x88,	%i3
	nop
	set	0x70, %l6
	lduw	[%l7 + %l6],	%g5
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f4
	nop
	set	0x36, %i5
	stb	%i1,	[%l7 + %i5]
	nop
	set	0x68, %l0
	lduh	[%l7 + %l0],	%o4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x65, %o6
	ldub	[%l7 + %o6],	%l4
	st	%fsr,	[%l7 + 0x48]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%o3
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xea,	%l4
	nop
	set	0x10, %o1
	ldsw	[%l7 + %o1],	%i5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x80
	nop
	set	0x1C, %i0
	prefetch	[%l7 + %i0],	 3
	st	%f2,	[%l7 + 0x60]
	nop
	set	0x0A, %g3
	ldsh	[%l7 + %g3],	%i6
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xe2,	%g6
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x88,	%i0
	set	0x70, %g5
	stda	%l0,	[%l7 + %g5] 0x88
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x88,	%o0
	set	0x6C, %l5
	sta	%f23,	[%l7 + %l5] 0x80
	wr	%o1,	%l2,	%pic
	set	0x78, %l2
	stda	%i6,	[%l7 + %l2] 0x88
	bn,a	%xcc,	loop_166
	nop
	set	0x18, %o3
	std	%f12,	[%l7 + %o3]
	bgu,pn	%xcc,	loop_167
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%l0
loop_166:
	nop
	nop
	setx	0x7BA75F7A6CC4A5A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x13968BDC0E3EC3B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f24,	%f28
	st	%fsr,	[%l7 + 0x6C]
loop_167:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%g1
	nop
	set	0x48, %o0
	stw	%o2,	[%l7 + %o0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%i4
	nop
	set	0x0E, %i1
	ldsh	[%l7 + %i1],	%g4
	nop
	set	0x58, %g2
	std	%g2,	[%l7 + %g2]
	nop
	set	0x0F, %o5
	stb	%o6,	[%l7 + %o5]
	nop
	set	0x0C, %i6
	swap	[%l7 + %i6],	%l3
	nop
	set	0x29, %l3
	stb	%g2,	[%l7 + %l3]
	nop
	set	0x62, %o7
	sth	%o7,	[%l7 + %o7]
	nop
	set	0x58, %i3
	lduw	[%l7 + %i3],	%i3
	ba,a	%xcc,	loop_168
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%g5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xda
loop_168:
	nop
	set	0x78, %i4
	std	%o4,	[%l7 + %i4]
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%o4
	st	%fsr,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x38]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i7
	nop
	set	0x25, %l6
	ldub	[%l7 + %l6],	%l4
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x88,	%l5
	nop
	set	0x08, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x5C, %o6
	lda	[%l7 + %o6] 0x89,	%f11
	fpsub32	%f14,	%f30,	%f8
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f8
	nop
	set	0x36, %o1
	sth	%i5,	[%l7 + %o1]
	set	0x4C, %l0
	sta	%f24,	[%l7 + %l0] 0x89
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%i6
	nop
	set	0x20, %i0
	lduw	[%l7 + %i0],	%o3
	nop
	set	0x54, %g3
	lduw	[%l7 + %g3],	%i0
	set	0x7C, %o4
	ldstuba	[%l7 + %o4] 0x88,	%l1
	wr	%g7,	%o1,	%pic
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%l2
	nop
	set	0x78, %g5
	swap	[%l7 + %g5],	%o0
	set	0x1C, %i7
	stwa	%l0,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x46, %l5
	stha	%i2,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %l2
	stda	%g0,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x0C, %g6
	stwa	%l6,	[%l7 + %g6] 0x88
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xeb,	%o2
	nop
	set	0x2C, %o0
	ldsw	[%l7 + %o0],	%g6
	nop
	set	0x4C, %g2
	stb	%i4,	[%l7 + %g2]
	set	0x28, %i1
	sta	%f18,	[%l7 + %i1] 0x89
	set	0x2F, %i6
	stba	%g4,	[%l7 + %i6] 0x81
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%o6
	nop
	set	0x30, %o7
	swap	[%l7 + %o7],	%g3
	set	0x4A, %i3
	stba	%l3,	[%l7 + %i3] 0x81
	nop
	set	0x34, %l3
	ldsw	[%l7 + %l3],	%o7
	set	0x1A, %g7
	stba	%i3,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	nop
	set	0x28, %g1
	sth	%g5,	[%l7 + %g1]
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f10
	st	%fsr,	[%l7 + 0x74]
	or	%o5,	%o4,	%i1
	set	0x6C, %i5
	sta	%f13,	[%l7 + %i5] 0x89
	add	%i7,	%g2,	%l5
	or	%i5,	%i6,	%o3
	nop
	set	0x2A, %l1
	sth	%i0,	[%l7 + %l1]
	st	%f11,	[%l7 + 0x28]
	nop
	set	0x72, %o6
	ldsh	[%l7 + %o6],	%l4
	or	%l1,	%g7,	%l2
	and	%o1,	%l0,	%i2
	and	%o0,	%l6,	%o2
	and	%g6,	%g1,	%i4
	nop
	nop
	setx	0x5B5F2D685F1533DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xDB9A2EDD8686F65E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f20
	set	0x74, %i2
	lda	[%l7 + %i2] 0x89,	%f24
	set	0x68, %o1
	sta	%f8,	[%l7 + %o1] 0x88
	nop
	set	0x42, %l4
	ldstub	[%l7 + %l4],	%o6
	st	%f23,	[%l7 + 0x48]
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x89,	%g4
	ld	[%l7 + 0x1C],	%f11
	nop
	set	0x78, %g4
	std	%f18,	[%l7 + %g4]
	nop
	set	0x58, %g3
	swap	[%l7 + %g3],	%l3
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%g3
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x80,	%o7
	nop
	set	0x21, %g5
	ldsb	[%l7 + %g5],	%g5
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%i3
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f20
	or	%o4,	%i1,	%g2
	nop
	set	0x44, %l5
	lduw	[%l7 + %l5],	%l5
	nop
	set	0x28, %o2
	stx	%i7,	[%l7 + %o2]
	nop
	set	0x40, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x3D, %g6
	ldsb	[%l7 + %g6],	%i5
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x81,	%i0
	set	0x5C, %o0
	stwa	%l4,	[%l7 + %o0] 0x81
	set	0x18, %i1
	stxa	%o3,	[%l7 + %i1] 0xeb
	membar	#Sync
	add	%g7,	%l1,	%l2
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f0
	nop
	set	0x43, %i3
	ldub	[%l7 + %i3],	%l0
	nop
	set	0x5E, %l3
	ldub	[%l7 + %l3],	%i2
	nop
	set	0x64, %o7
	ldsw	[%l7 + %o7],	%o1
	st	%fsr,	[%l7 + 0x08]
	set	0x20, %i4
	stwa	%o0,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x18, %g7
	stba	%l6,	[%l7 + %g7] 0x81
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%o2
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%g0
	nop
	set	0x24, %l1
	swap	[%l7 + %l1],	%g6
	st	%fsr,	[%l7 + 0x50]
	set	0x78, %o6
	stda	%i4,	[%l7 + %o6] 0x88
	fpsub32s	%f6,	%f7,	%f20
	nop
	set	0x18, %i2
	stx	%o6,	[%l7 + %i2]
	and	%l3,	%g4,	%o7
	nop
	set	0x40, %o1
	std	%f10,	[%l7 + %o1]
	add	%g3,	%o5,	%i3
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x80,	%o4
	nop
	set	0x18, %l0
	stx	%i1,	[%l7 + %l0]
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x89,	%g5
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x52, %o4
	ldstub	[%l7 + %o4],	%g2
	ld	[%l7 + 0x14],	%f18
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%l5
	and	%i5,	%i0,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%o3
	st	%f2,	[%l7 + 0x10]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f16
	nop
	set	0x40, %g5
	ldsw	[%l7 + %g5],	%g7
	set	0x70, %i0
	stxa	%l1,	[%l7 + %i0] 0x80
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x88,	%l0
	set	0x48, %i7
	stwa	%i2,	[%l7 + %i7] 0xe3
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%o1
	nop
	set	0x20, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x09, %l2
	ldstub	[%l7 + %l2],	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%o0
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%i4
	bne,a,pt	%icc,	loop_169
	add	%o6,	%g6,	%l3
	set	0x50, %g6
	prefetcha	[%l7 + %g6] 0x89,	 3
loop_169:
	nop
	set	0x50, %o0
	swapa	[%l7 + %o0] 0x80,	%g3
	nop
	set	0x30, %g2
	lduw	[%l7 + %g2],	%o5
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x80,	 2
	nop
	set	0x3C, %i6
	ldsb	[%l7 + %i6],	%o4
	set	0x60, %i3
	ldxa	[%l7 + %i3] 0x81,	%i1
	nop
	set	0x48, %l3
	std	%i2,	[%l7 + %l3]
	set	0x39, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g5
	set	0x19, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i7
	add	%g2,	%l5,	%i0
	set	0x6C, %o7
	sta	%f29,	[%l7 + %o7] 0x81
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf0
	membar	#Sync
	nop
	set	0x50, %g1
	std	%i4,	[%l7 + %g1]
	st	%f11,	[%l7 + 0x34]
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f2
	set	0x7E, %o6
	stha	%l4,	[%l7 + %o6] 0x80
	wr 	%g0, 	0x4, 	%fprs
	set	0x7B, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o3
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%l1
	nop
	set	0x50, %l4
	swap	[%l7 + %l4],	%l0
	set	0x74, %i2
	sta	%f7,	[%l7 + %i2] 0x89
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%i2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x81
	and	%o1,	%l2,	%l6
	nop
	set	0x6C, %l6
	lduw	[%l7 + %l6],	%g1
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%o2
	nop
	set	0x78, %i0
	stx	%i4,	[%l7 + %i0]
	set	0x3C, %g5
	stwa	%o6,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x12, %i7
	stha	%o0,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x5E, %o2
	ldstub	[%l7 + %o2],	%l3
	nop
	set	0x1C, %l2
	stw	%o7,	[%l7 + %l2]
	nop
	set	0x68, %l5
	lduh	[%l7 + %l5],	%g6
	st	%fsr,	[%l7 + 0x74]
	add	%o5,	%g4,	%o4
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%g2
	fpsub16s	%f29,	%f27,	%f13
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x6C, %o0
	stw	%i1,	[%l7 + %o0]
	set	0x74, %o5
	sta	%f27,	[%l7 + %o5] 0x89
	nop
	set	0x20, %i6
	ldstub	[%l7 + %i6],	%i3
	st	%f18,	[%l7 + 0x40]
	nop
	set	0x18, %g2
	ldub	[%l7 + %g2],	%i7
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x88,	%g5
	nop
	set	0x74, %i3
	ldsh	[%l7 + %i3],	%g2
	nop
	set	0x08, %i4
	ldsh	[%l7 + %i4],	%l5
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x81,	%i0
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x80,	%l4
	nop
	set	0x08, %o7
	std	%i4,	[%l7 + %o7]
	fpsub32s	%f14,	%f16,	%f9
	set	0x70, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f16
	set	0x68, %g1
	stwa	%g7,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x7F, %i5
	ldsb	[%l7 + %i5],	%l1
	fpsub16	%f28,	%f16,	%f16
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%l0
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x88,	 4
	set	0x3E, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o3
	set	0x6E, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o1
	wr 	%g0, 	0x4, 	%fprs
	set	0x1B, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g1
	set	0x70, %l6
	stha	%i4,	[%l7 + %l6] 0x88
	nop
	set	0x48, %o4
	lduh	[%l7 + %o4],	%o2
	nop
	set	0x38, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x50, %g3
	lda	[%l7 + %g3] 0x89,	%f3
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xcc
	wr	%o0,	%l3,	%pic
	nop
	set	0x0C, %o2
	lduw	[%l7 + %o2],	%o6
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xea,	%o6
	set	0x68, %l5
	stxa	%g6,	[%l7 + %l5] 0xe2
	membar	#Sync
	bgu,pn	%xcc,	loop_170
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f30
	and	%o5,	%g4,	%o4
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%i0
loop_170:
	nop
	set	0x18, %o0
	stda	%i2,	[%l7 + %o0] 0xea
	membar	#Sync
	st	%f26,	[%l7 + 0x08]
	nop
	set	0x38, %o3
	ldsh	[%l7 + %o3],	%i7
	set	0x3C, %o5
	stwa	%g3,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%l5
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f16
	or	%g5,	%l4,	%i0
	nop
	set	0x53, %g2
	ldub	[%l7 + %g2],	%i5
	nop
	set	0x48, %i3
	ldx	[%l7 + %i3],	%i6
	set	0x08, %i4
	stha	%l1,	[%l7 + %i4] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%i2
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x80
	nop
	set	0x56, %i1
	ldstub	[%l7 + %i1],	%o3
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%o0
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%l0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f0
	set	0x3B, %g1
	ldstuba	[%l7 + %g1] 0x88,	%l2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g1
	nop
	set	0x41, %i5
	stb	%o2,	[%l7 + %i5]
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%i4
	nop
	set	0x30, %o1
	swap	[%l7 + %o1],	%l3
	or	%o6,	%o7,	%g6
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%o4
	set	0x38, %l0
	swapa	[%l7 + %l0] 0x80,	%o0
	set	0x20, %g4
	stxa	%g4,	[%l7 + %g4] 0x81
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i3
	st	%f1,	[%l7 + 0x60]
	set	0x78, %l6
	stxa	%i1,	[%l7 + %l6] 0x88
	st	%fsr,	[%l7 + 0x0C]
	and	%i7,	%g3,	%g2
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%l5
	set	0x18, %o4
	stda	%l4,	[%l7 + %o4] 0x89
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x80,	%i0
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x89,	%i5
	nop
	set	0x60, %o2
	ldsw	[%l7 + %o2],	%g5
	nop
	set	0x1C, %l2
	lduh	[%l7 + %l2],	%l1
	nop
	set	0x1C, %g5
	ldsh	[%l7 + %g5],	%i6
	set	0x28, %l5
	swapa	[%l7 + %l5] 0x80,	%g7
	set	0x4C, %i7
	stwa	%o3,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x08, %o0
	stwa	%i2,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x60, %o3
	sth	%l0,	[%l7 + %o3]
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	nop
	set	0x58, %i6
	ldx	[%l7 + %i6],	%l6
	set	0x51, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o1
	fpsub16s	%f9,	%f17,	%f17
	nop
	set	0x78, %i3
	std	%g0,	[%l7 + %i3]
	nop
	set	0x6C, %i4
	lduw	[%l7 + %i4],	%o2
	nop
	set	0x18, %l3
	ldsw	[%l7 + %l3],	%i4
	set	0x20, %g2
	swapa	[%l7 + %g2] 0x88,	%o6
	nop
	set	0x38, %i1
	std	%f18,	[%l7 + %i1]
	set	0x10, %g7
	ldxa	[%l7 + %g7] 0x80,	%l3
	or	%g6,	%o5,	%o0
	set	0x50, %o7
	stxa	%g4,	[%l7 + %o7] 0x88
	set	0x77, %o6
	stba	%o7,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x76, %i5
	ldsb	[%l7 + %i5],	%i3
	nop
	set	0x0C, %l1
	lduw	[%l7 + %l1],	%i1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g3
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x14, %o1
	lduw	[%l7 + %o1],	%g2
	set	0x40, %l0
	stwa	%o4,	[%l7 + %l0] 0x89
	nop
	set	0x68, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x30, %g4
	ldsh	[%l7 + %g4],	%l4
	nop
	set	0x2F, %l6
	ldub	[%l7 + %l6],	%l5
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f12
	set	0x50, %l4
	stda	%i4,	[%l7 + %l4] 0x81
	and	%g5,	%l1,	%i0
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x30, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x2C, %l2
	sth	%o3,	[%l7 + %l2]
	nop
	set	0x54, %g5
	stw	%g7,	[%l7 + %g5]
	nop
	set	0x78, %l5
	stx	%l0,	[%l7 + %l5]
	fpadd16	%f8,	%f4,	%f0
	ld	[%l7 + 0x0C],	%f14
	nop
	set	0x74, %i7
	stw	%i2,	[%l7 + %i7]
	nop
	set	0x08, %i0
	std	%i6,	[%l7 + %i0]
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x81,	%o1
	set	0x1A, %o3
	stba	%g1,	[%l7 + %o3] 0xea
	membar	#Sync
	add	%o2,	%l2,	%i4
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x80,	%l3
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x70, %o5
	lda	[%l7 + %o5] 0x80,	%f16
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%o6
	fpsub16s	%f30,	%f10,	%f31
	nop
	set	0x28, %i4
	std	%o4,	[%l7 + %i4]
	set	0x49, %g2
	stba	%o0,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x48, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%g4
	set	0x0C, %l3
	swapa	[%l7 + %l3] 0x80,	%g6
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x81,	%i3
	fpadd32s	%f14,	%f31,	%f21
	set	0x75, %i5
	stba	%o7,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 0
	set	0x08, %g1
	stxa	%i7,	[%l7 + %g1] 0x88
	fpsub16s	%f3,	%f2,	%f9
	set	0x76, %o6
	ldstuba	[%l7 + %o6] 0x88,	%g3
	and	%i1,	%o4,	%g2
	nop
	set	0x70, %o1
	lduw	[%l7 + %o1],	%l5
	set	0x68, %l0
	stxa	%i5,	[%l7 + %l0] 0x88
	ld	[%l7 + 0x6C],	%f14
	add	%l4,	%g5,	%i0
	ld	[%l7 + 0x20],	%f11
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x89,	%l0
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%o2
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x89
	nop
	set	0x39, %l4
	ldstub	[%l7 + %l4],	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3D5, 	%tick_cmpr
	and	%l6,	%i2,	%o1
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%g1
	set	0x20, %o2
	swapa	[%l7 + %o2] 0x88,	%l2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x89
	nop
	set	0x5F, %g5
	ldstub	[%l7 + %g5],	%i4
	nop
	set	0x36, %l5
	ldsh	[%l7 + %l5],	%o2
	set	0x40, %l2
	swapa	[%l7 + %l2] 0x88,	%l3
	nop
	set	0x64, %i7
	lduh	[%l7 + %i7],	%o5
	set	0x68, %i0
	ldstuba	[%l7 + %i0] 0x81,	%o0
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x89,	%o6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%i3
	nop
	set	0x5D, %o0
	ldsb	[%l7 + %o0],	%g4
	nop
	set	0x30, %g6
	stx	%o7,	[%l7 + %g6]
	set	, %i6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1249
!	Type a   	: 34
!	Type cti   	: 23
!	Type x   	: 537
!	Type f   	: 42
!	Type i   	: 115
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
	set	0xB,	%g2
	set	0x3,	%g3
	set	0xA,	%g4
	set	0xA,	%g5
	set	0x5,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0x8,	%i3
	set	-0x2,	%i4
	set	-0xB,	%i5
	set	-0xD,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x7FAEE0F1,	%l0
	set	0x081CD01B,	%l1
	set	0x654D63D8,	%l2
	set	0x23018868,	%l3
	set	0x7A6C3548,	%l4
	set	0x73986913,	%l5
	set	0x0D47011E,	%l6
	!# Output registers
	set	0x007F,	%o0
	set	-0x06EB,	%o1
	set	-0x0DCB,	%o2
	set	0x0B9F,	%o3
	set	0x1420,	%o4
	set	0x1192,	%o5
	set	0x1490,	%o6
	set	-0x1F05,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x6E9A1FE0D80792F3)
	INIT_TH_FP_REG(%l7,%f2,0x49F4C0AAC659B3F3)
	INIT_TH_FP_REG(%l7,%f4,0x27F1303B28DA30B2)
	INIT_TH_FP_REG(%l7,%f6,0x63A4C96C438AC97E)
	INIT_TH_FP_REG(%l7,%f8,0x2B07BA0C75F97A23)
	INIT_TH_FP_REG(%l7,%f10,0x7A1523EB3C6160A0)
	INIT_TH_FP_REG(%l7,%f12,0x25974F3E05DDEAD5)
	INIT_TH_FP_REG(%l7,%f14,0x5F3DA564B77E462F)
	INIT_TH_FP_REG(%l7,%f16,0x2A5CD50E1D67A90A)
	INIT_TH_FP_REG(%l7,%f18,0xB88DAF4B75B0265E)
	INIT_TH_FP_REG(%l7,%f20,0xFB20EE6F9D85B86F)
	INIT_TH_FP_REG(%l7,%f22,0x79F5F02BB5A7DA75)
	INIT_TH_FP_REG(%l7,%f24,0xF6A0C82204318C50)
	INIT_TH_FP_REG(%l7,%f26,0x5905E19522C930F1)
	INIT_TH_FP_REG(%l7,%f28,0x01EAA548604BEE5A)
	INIT_TH_FP_REG(%l7,%f30,0xF0FACB6DE08DD15C)

	!# Execute Main Diag ..

	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x1B, %i4
	stba	%g3,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%i1
	or	%g2,	%l5,	%o4
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%i5
	nop
	set	0x18, %i1
	lduh	[%l7 + %i1],	%l4
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f12
	nop
	set	0x40, %g7
	std	%i0,	[%l7 + %g7]
	nop
	set	0x50, %o7
	stx	%g5,	[%l7 + %o7]
	nop
	set	0x66, %l3
	ldsb	[%l7 + %l3],	%o3
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x81,	%l1
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%l0
	set	0x6C, %g1
	sta	%f24,	[%l7 + %g1] 0x88
	nop
	set	0x0C, %o6
	lduw	[%l7 + %o6],	%g7
	nop
	set	0x1E, %l0
	ldstub	[%l7 + %l0],	%l6
	nop
	set	0x2A, %g4
	sth	%i6,	[%l7 + %g4]
	nop
	set	0x78, %o1
	lduh	[%l7 + %o1],	%i2
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x89,	%g1
	and	%o1,	%l2,	%i4
	nop
	set	0x60, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x48, %i2
	stda	%l2,	[%l7 + %i2] 0x88
	nop
	set	0x18, %l4
	std	%o2,	[%l7 + %l4]
	nop
	set	0x70, %o2
	std	%o4,	[%l7 + %o2]
	ba	%xcc,	loop_171
	nop
	set	0x48, %g5
	ldsb	[%l7 + %g5],	%o0
	nop
	set	0x7E, %l5
	ldub	[%l7 + %l5],	%o6
	nop
	set	0x50, %l2
	std	%i2,	[%l7 + %l2]
loop_171:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%g6
	nop
	set	0x69, %g3
	ldsb	[%l7 + %g3],	%o7
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0
	nop
	set	0x68, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x26, %o0
	ldstub	[%l7 + %o0],	%i7
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%g2
	nop
	set	0x41, %i0
	ldub	[%l7 + %i0],	%l5
	nop
	set	0x0B, %i6
	stb	%o4,	[%l7 + %i6]
	nop
	set	0x20, %i3
	std	%f28,	[%l7 + %i3]
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%i4
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x81,	%l4
	set	0x79, %i4
	stba	%g5,	[%l7 + %i4] 0x80
	nop
	set	0x68, %i1
	std	%f18,	[%l7 + %i1]
	wr	%i0,	%o3,	%pic
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%l1
	set	0x6A, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l0
	set	0x10, %g7
	lda	[%l7 + %g7] 0x88,	%f9
	set	0x58, %l1
	lda	[%l7 + %l1] 0x80,	%f22
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	set	0x5C, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g7
	nop
	set	0x1C, %g1
	ldstub	[%l7 + %g1],	%l6
	nop
	set	0x7D, %l0
	ldsb	[%l7 + %l0],	%i2
	nop
	set	0x28, %g4
	std	%g0,	[%l7 + %g4]
	nop
	set	0x0C, %o1
	ldsh	[%l7 + %o1],	%i6
	bn,pt	%icc,	loop_172
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%l2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xca
loop_172:
	nop
	set	0x38, %o4
	stx	%o1,	[%l7 + %o4]
	nop
	set	0x08, %l4
	std	%l2,	[%l7 + %l4]
	ld	[%l7 + 0x2C],	%f14
	set	0x68, %i2
	stwa	%o2,	[%l7 + %i2] 0x80
	nop
	set	0x6C, %g5
	ldsb	[%l7 + %g5],	%o5
	nop
	set	0x0C, %l5
	ldub	[%l7 + %l5],	%i4
	set	0x1B, %o2
	stba	%o0,	[%l7 + %o2] 0x81
	and	%o6,	%i3,	%g4
	nop
	set	0x48, %g3
	ldstub	[%l7 + %g3],	%o7
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x28, %i7
	std	%f8,	[%l7 + %i7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i7
	nop
	set	0x08, %o3
	stw	%i1,	[%l7 + %o3]
	or	%g2,	%g6,	%o4
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%i4
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f16
	or	%l4,	%l5,	%g5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f0
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x89,	%i0
	set	0x3D, %i6
	ldstuba	[%l7 + %i6] 0x88,	%l1
	set	0x64, %i4
	lda	[%l7 + %i4] 0x80,	%f2
	add	%o3,	%l0,	%l6
	add	%i2,	%g1,	%g7
	set	0x18, %o5
	stda	%i6,	[%l7 + %o5] 0x88
	set	0x38, %g2
	lda	[%l7 + %g2] 0x80,	%f15
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x81,	 4
	nop
	nop
	setx	0x0F291669B5A648D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xEF4226C5D891FE5A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f16
	nop
	set	0x50, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x19, %l1
	ldstub	[%l7 + %l1],	%l3
	add	%o2,	%l2,	%o5
	nop
	set	0x55, %l3
	stb	%i4,	[%l7 + %l3]
	set	0x58, %g7
	sta	%f12,	[%l7 + %g7] 0x89
	set	0x50, %i5
	stxa	%o6,	[%l7 + %i5] 0x81
	nop
	set	0x68, %l0
	stx	%o0,	[%l7 + %l0]
	set	0x57, %g4
	stba	%i3,	[%l7 + %g4] 0x80
	wr	%o7,	%g3,	%clear_softint
	nop
	set	0x72, %g1
	lduh	[%l7 + %g1],	%i7
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x49, %o1
	ldstub	[%l7 + %o1],	%i1
	set	0x6E, %o6
	stha	%g4,	[%l7 + %o6] 0x80
	nop
	set	0x6A, %o4
	sth	%g2,	[%l7 + %o4]
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x88,	 0
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f2
	nop
	set	0x0E, %l6
	ldsb	[%l7 + %l6],	%i5
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f28
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xe3,	%l4
	nop
	set	0x28, %l5
	std	%f12,	[%l7 + %l5]
	nop
	set	0x46, %g3
	lduh	[%l7 + %g3],	%l5
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%g5
	set	0x0E, %o3
	stha	%i0,	[%l7 + %o3] 0x88
	set	0x54, %o0
	sta	%f10,	[%l7 + %o0] 0x88
	st	%f2,	[%l7 + 0x30]
	add	%l1,	%o4,	%o3
	nop
	set	0x37, %i0
	ldstub	[%l7 + %i0],	%l0
	ld	[%l7 + 0x08],	%f29
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%i2
	nop
	set	0x36, %g6
	sth	%l6,	[%l7 + %g6]
	nop
	set	0x50, %i7
	swap	[%l7 + %i7],	%g1
	nop
	set	0x08, %i4
	std	%f22,	[%l7 + %i4]
	nop
	set	0x26, %o5
	sth	%i6,	[%l7 + %o5]
	set	0x50, %g2
	stda	%g6,	[%l7 + %g2] 0x80
	and	%l3,	%o1,	%o2
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%l2
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f28
	set	0x10, %i6
	ldxa	[%l7 + %i6] 0x80,	%o5
	st	%f3,	[%l7 + 0x34]
	nop
	set	0x68, %l3
	stb	%o6,	[%l7 + %l3]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd0
	or	%i4,	%i3,	%o7
	add	%o0,	%g3,	%i1
	nop
	set	0x33, %l1
	ldub	[%l7 + %l1],	%i7
	set	0x78, %i5
	stda	%g2,	[%l7 + %i5] 0x89
	nop
	set	0x28, %g4
	ldsb	[%l7 + %g4],	%g6
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x30, %o1
	std	%f24,	[%l7 + %o1]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%l4
	nop
	set	0x54, %o6
	sth	%l5,	[%l7 + %o6]
	set	0x51, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i5
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf8
	membar	#Sync
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f18
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%g5
	nop
	set	0x64, %l6
	sth	%o4,	[%l7 + %l6]
	set	0x38, %g5
	stxa	%o3,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x28, %i2
	stda	%l0,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x38, %o2
	lduh	[%l7 + %o2],	%i2
	set	0x5C, %l5
	stha	%l6,	[%l7 + %l5] 0xe3
	membar	#Sync
	add	%g1,	%i6,	%l0
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%f4
	nop
	set	0x79, %o3
	ldstub	[%l7 + %o3],	%l3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%g7
	ld	[%l7 + 0x2C],	%f9
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xe3,	%l2
	set	0x70, %o0
	stba	%o2,	[%l7 + %o0] 0x88
	nop
	set	0x66, %i3
	ldstub	[%l7 + %i3],	%o6
	nop
	set	0x0A, %g6
	ldub	[%l7 + %g6],	%i4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf8
	membar	#Sync
	set	0x30, %i7
	stda	%o4,	[%l7 + %i7] 0xeb
	membar	#Sync
	and	%i3,	%o0,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%g3
	nop
	set	0x2A, %i4
	ldstub	[%l7 + %i4],	%i7
	nop
	set	0x28, %o5
	lduh	[%l7 + %o5],	%g6
	set	0x16, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g4
	nop
	set	0x44, %o7
	ldsh	[%l7 + %o7],	%l4
	ld	[%l7 + 0x38],	%f29
	nop
	set	0x32, %i1
	ldsh	[%l7 + %i1],	%l5
	add	%g2,	%i0,	%g5
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xda
	nop
	set	0x37, %g7
	ldstub	[%l7 + %g7],	%i5
	set	0x68, %l3
	stda	%o4,	[%l7 + %l3] 0x89
	set	0x64, %l1
	stwa	%o3,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%l1
	nop
	set	0x30, %g4
	std	%f2,	[%l7 + %g4]
	set	0x20, %i5
	stxa	%l6,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x38, %o1
	stx	%i6,	[%l7 + %o1]
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f30
	nop
	set	0x58, %l0
	swap	[%l7 + %l0],	%l0
	set	0x4C, %o6
	stwa	%l3,	[%l7 + %o6] 0x80
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%g0
	nop
	set	0x2A, %l4
	sth	%g7,	[%l7 + %l4]
	nop
	set	0x50, %g5
	sth	%o1,	[%l7 + %g5]
	nop
	set	0x4E, %i2
	sth	%o2,	[%l7 + %i2]
	nop
	set	0x78, %o2
	stx	%l2,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x28]
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x81,	%o6
	st	%fsr,	[%l7 + 0x38]
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	st	%f6,	[%l7 + 0x78]
	nop
	set	0x0A, %g3
	stb	%i4,	[%l7 + %g3]
	nop
	set	0x5A, %o3
	ldsh	[%l7 + %o3],	%i3
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%o7
	nop
	set	0x58, %l2
	std	%i0,	[%l7 + %l2]
	nop
	set	0x30, %g6
	std	%g2,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x2C, %i3
	ldstub	[%l7 + %i3],	%i7
	wr	%o0,	%g6,	%pic
	fpsub32s	%f13,	%f8,	%f20
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%l4
	ld	[%l7 + 0x58],	%f5
	nop
	set	0x70, %i4
	std	%l4,	[%l7 + %i4]
	nop
	set	0x12, %i0
	lduh	[%l7 + %i0],	%g2
	bleu	%xcc,	loop_173
	nop
	set	0x57, %o5
	ldub	[%l7 + %o5],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g5
loop_173:
	nop
	set	0x68, %g2
	std	%o4,	[%l7 + %g2]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	nop
	set	0x24, %i6
	ldstub	[%l7 + %i6],	%i5
	nop
	set	0x11, %g7
	ldub	[%l7 + %g7],	%i2
	nop
	set	0x10, %l3
	sth	%o3,	[%l7 + %l3]
	set	0x70, %i1
	stwa	%l1,	[%l7 + %i1] 0x88
	or	%i6,	%l6,	%l0
	ld	[%l7 + 0x18],	%f5
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%l2
	add	%g7,	%g1,	%o2
	nop
	set	0x0F, %l1
	stb	%l2,	[%l7 + %l1]
	nop
	set	0x08, %o1
	std	%f20,	[%l7 + %o1]
	set	0x40, %g1
	stba	%o1,	[%l7 + %g1] 0xea
	membar	#Sync
	fpsub32	%f26,	%f28,	%f30
	set	0x60, %i5
	stwa	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x89,	%o4
	nop
	set	0x35, %o4
	stb	%i3,	[%l7 + %o4]
	add	%o7,	%i1,	%i4
	nop
	set	0x72, %l0
	stb	%i7,	[%l7 + %l0]
	set	0x08, %g5
	stwa	%o0,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x81,	%g6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f16
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%g2
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	st	%f18,	[%l7 + 0x7C]
	nop
	set	0x28, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x56, %l6
	sth	%i0,	[%l7 + %l6]
	set	0x32, %o3
	stha	%g5,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x24, %g3
	ldsh	[%l7 + %g3],	%o4
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%g4
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x80,	 0
	nop
	set	0x5E, %i3
	sth	%i2,	[%l7 + %i3]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf9
	membar	#Sync
	nop
	set	0x1C, %i4
	lduw	[%l7 + %i4],	%o3
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%l1
	set	0x28, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%l3
	set	0x3A, %o5
	stha	%i6,	[%l7 + %o5] 0x81
	nop
	set	0x6C, %o7
	prefetch	[%l7 + %o7],	 0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%l2
	fpadd16s	%f0,	%f14,	%f13
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xeb,	%o0
	nop
	set	0x34, %g7
	stw	%o6,	[%l7 + %g7]
	nop
	set	0x11, %i6
	stb	%o5,	[%l7 + %i6]
	set	0x2D, %i1
	stba	%o7,	[%l7 + %i1] 0xea
	membar	#Sync
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i3
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x88,	%i6
	set	0x68, %l3
	stwa	%i4,	[%l7 + %l3] 0x88
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%g6
	set	0x58, %i5
	stda	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x81,	%o0
	nop
	set	0x1C, %g1
	stb	%l5,	[%l7 + %g1]
	set	0x68, %o4
	stda	%g2,	[%l7 + %o4] 0x80
	nop
	set	0x10, %l0
	lduw	[%l7 + %l0],	%l4
	set	0x58, %l4
	stda	%i0,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x29, %g5
	ldsb	[%l7 + %g5],	%g5
	or	%g4,	%i5,	%o4
	set	0x2C, %i2
	stha	%o3,	[%l7 + %i2] 0x89
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%i2
	nop
	set	0x67, %l5
	ldsb	[%l7 + %l5],	%l1
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f22
	wr	%l6,	%l0,	%pic
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x30, %o0
	stw	%i6,	[%l7 + %o0]
	st	%f15,	[%l7 + 0x14]
	nop
	set	0x5C, %g6
	swap	[%l7 + %g6],	%g1
	add	%l3,	%g7,	%o2
	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x2C, %i7
	lduh	[%l7 + %i7],	%o1
	nop
	set	0x12, %i4
	sth	%l2,	[%l7 + %i4]
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x88,	 3
	st	%f21,	[%l7 + 0x6C]
	and	%o6,	%o7,	%i3
	nop
	set	0x1C, %i0
	ldsw	[%l7 + %i0],	%i1
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%i4
	ld	[%l7 + 0x14],	%f6
	set	0x57, %o7
	stba	%i7,	[%l7 + %o7] 0xea
	membar	#Sync
	set	0x48, %g2
	sta	%f31,	[%l7 + %g2] 0x88
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 4
	bl,a,pn	%xcc,	loop_174
	nop
	set	0x7C, %o5
	stw	%g6,	[%l7 + %o5]
	nop
	set	0x46, %i1
	lduh	[%l7 + %i1],	%g3
	nop
	set	0x78, %i6
	ldsw	[%l7 + %i6],	%o0
loop_174:
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x89,	 1
	nop
	set	0x68, %l3
	std	%l4,	[%l7 + %l3]
	set	0x1A, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i0
	nop
	set	0x10, %o6
	stx	%g2,	[%l7 + %o6]
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x88,	%g4
	or	%i5,	%o4,	%o3
	nop
	set	0x78, %o4
	std	%f18,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x60]
	set	0x20, %g1
	lda	[%l7 + %g1] 0x88,	%f14
	set	0x38, %l4
	stxa	%g5,	[%l7 + %l4] 0xe2
	membar	#Sync
	st	%f30,	[%l7 + 0x4C]
	nop
	set	0x10, %l0
	ldstub	[%l7 + %l0],	%i2
	set	0x60, %i2
	ldda	[%l7 + %i2] 0x88,	%l0
	nop
	set	0x58, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%i6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f16
	nop
	set	0x38, %l6
	lduw	[%l7 + %l6],	%l0
	nop
	set	0x4C, %o0
	ldsb	[%l7 + %o0],	%g1
	nop
	set	0x2C, %g6
	swap	[%l7 + %g6],	%g7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%l3
	set	0x1C, %g3
	sta	%f25,	[%l7 + %g3] 0x88
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%o0
	nop
	set	0x1C, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x6E, %i4
	sth	%l2,	[%l7 + %i4]
	nop
	set	0x58, %o3
	lduw	[%l7 + %o3],	%o5
	nop
	set	0x50, %l2
	ldub	[%l7 + %l2],	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%i3
	set	0x6C, %o7
	sta	%f26,	[%l7 + %o7] 0x81
	nop
	set	0x75, %g2
	ldstub	[%l7 + %g2],	%i4
	nop
	set	0x4E, %g7
	ldsb	[%l7 + %g7],	%i7
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc8
	set	0x38, %o5
	lda	[%l7 + %o5] 0x88,	%f11
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f16
	nop
	set	0x18, %g4
	std	%g6,	[%l7 + %g4]
	set	0x68, %i1
	stda	%i0,	[%l7 + %i1] 0xe2
	membar	#Sync
	ba,a	%icc,	loop_175
	nop
	set	0x10, %l3
	sth	%o0,	[%l7 + %l3]
	set	0x10, %l1
	ldxa	[%l7 + %l1] 0x88,	%l5
loop_175:
	nop
	set	0x08, %i5
	lda	[%l7 + %i5] 0x89,	%f25
	set	0x68, %o6
	stxa	%g3,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x25, %g1
	ldsb	[%l7 + %g1],	%l4
	set	0x10, %o4
	stwa	%i0,	[%l7 + %o4] 0x89
	nop
	set	0x48, %l0
	sth	%g2,	[%l7 + %l0]
	nop
	set	0x50, %i2
	stx	%g4,	[%l7 + %i2]
	nop
	set	0x64, %l4
	ldsw	[%l7 + %l4],	%o4
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xeb,	%o2
	set	0x10, %g5
	stxa	%g5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x40, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x4B, %o0
	ldub	[%l7 + %o0],	%i5
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f26
	add	%l1,	%l6,	%l0
	ld	[%l7 + 0x54],	%f26
	add	%i6,	%g7,	%o2
	wr	%g1,	%o1,	%softint
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f0
	nop
	set	0x3C, %i3
	stw	%l2,	[%l7 + %i3]
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x89,	%l3
	set	0x60, %i4
	swapa	[%l7 + %i4] 0x89,	%o7
	or	%o6,	%o5,	%i4
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%i3
	fpadd16s	%f12,	%f26,	%f5
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f0
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%g6
	nop
	set	0x09, %g2
	ldsb	[%l7 + %g2],	%i7
	set	0x15, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o0
	set	0x10, %l2
	ldxa	[%l7 + %l2] 0x80,	%l5
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x89,	%i1
	nop
	set	0x4C, %o5
	lduw	[%l7 + %o5],	%l4
	add	%g3,	%i0,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o4
	nop
	set	0x50, %i6
	std	%f20,	[%l7 + %i6]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%g4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	set	0x78, %l1
	stda	%o2,	[%l7 + %l1] 0xea
	membar	#Sync
	add	%i2,	%l1,	%i5
	set	0x78, %l3
	stda	%i6,	[%l7 + %l3] 0x89
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%i6
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%o2
	add	%o1,	%l2,	%l3
	set	0x20, %i5
	stda	%g0,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x60, %o1
	stx	%o6,	[%l7 + %o1]
	nop
	set	0x2C, %o4
	stw	%o5,	[%l7 + %o4]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f16
	set	0x52, %i2
	stha	%o7,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%i4,	%i3,	%g6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x81
	set	0x08, %l4
	stxa	%o0,	[%l7 + %l4] 0x80
	and	%i7,	%i1,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%l4
	set	0x56, %g5
	stha	%g2,	[%l7 + %g5] 0x80
	st	%fsr,	[%l7 + 0x74]
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x89,	%g4
	set	0x2C, %o0
	stha	%o4,	[%l7 + %o0] 0x80
	set	0x38, %l5
	stha	%g5,	[%l7 + %l5] 0x81
	or	%o3,	%i2,	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%l6
	nop
	set	0x48, %l6
	std	%f16,	[%l7 + %l6]
	and	%l0,	%i6,	%g7
	fpadd16	%f10,	%f12,	%f8
	nop
	set	0x18, %g6
	std	%o2,	[%l7 + %g6]
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x80,	%o1
	nop
	nop
	setx	0x500BEBE9EC5631FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x46233E9B20966A9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f16,	%f8
	and	%l2,	%l3,	%i5
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f0
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%o6
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%g1
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc0
	nop
	set	0x68, %g2
	std	%o6,	[%l7 + %g2]
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x88,	 3
	add	%i4,	%i3,	%o0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd2
	nop
	set	0x7C, %i6
	ldsb	[%l7 + %i6],	%i7
	nop
	set	0x38, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%i0
	set	0x74, %o5
	sta	%f15,	[%l7 + %o5] 0x88
	nop
	set	0x10, %l3
	stw	%g6,	[%l7 + %l3]
	nop
	set	0x24, %o6
	ldsh	[%l7 + %o6],	%l5
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xca
	nop
	set	0x3F, %i5
	ldsb	[%l7 + %i5],	%g3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%g4
	nop
	set	0x3E, %o1
	lduh	[%l7 + %o1],	%g2
	nop
	set	0x20, %l0
	lduh	[%l7 + %l0],	%g5
	nop
	set	0x58, %i2
	stw	%o3,	[%l7 + %i2]
	add	%i2,	%o4,	%i0
	set	0x44, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l1
	st	%fsr,	[%l7 + 0x7C]
	add	%l0,	%l6,	%g7
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x7FC, 	%tick_cmpr
	set	0x64, %g5
	sta	%f26,	[%l7 + %g5] 0x81
	nop
	set	0x26, %o2
	ldsb	[%l7 + %o2],	%l2
	wr	%l3,	%i6,	%sys_tick
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%o6
	fpsub32	%f2,	%f16,	%f26
	nop
	set	0x18, %g1
	stx	%g1,	[%l7 + %g1]
	st	%f19,	[%l7 + 0x68]
	nop
	set	0x54, %l6
	sth	%i5,	[%l7 + %l6]
	set	0x58, %l5
	stha	%o5,	[%l7 + %l5] 0x88
	set	0x28, %g6
	swapa	[%l7 + %g6] 0x88,	%i4
	nop
	set	0x6C, %i3
	lduw	[%l7 + %i3],	%o7
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x44, %o3
	ldsb	[%l7 + %o3],	%o0
	nop
	set	0x6C, %g3
	stw	%i7,	[%l7 + %g3]
	set	0x7C, %g2
	ldstuba	[%l7 + %g2] 0x81,	%i3
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%i1
	nop
	set	0x12, %g7
	ldstub	[%l7 + %g7],	%g6
	nop
	set	0x7A, %l2
	ldub	[%l7 + %l2],	%l5
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	fpsub16s	%f4,	%f12,	%f1
	nop
	set	0x10, %i0
	std	%g2,	[%l7 + %i0]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x80
	nop
	set	0x34, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x40, %g4
	ldxa	[%l7 + %g4] 0x81,	%g4
	or	%g2,	%l4,	%g5
	set	0x48, %o5
	stda	%o2,	[%l7 + %o5] 0x88
	nop
	set	0x38, %o6
	stx	%i2,	[%l7 + %o6]
	bleu	%xcc,	loop_176
	nop
	set	0x50, %l1
	stx	%o4,	[%l7 + %l1]
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x88,	%i0
loop_176:
	nop
	set	0x35, %o1
	stb	%l0,	[%l7 + %o1]
	set	0x10, %i5
	stwa	%l1,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x46, %i2
	ldsh	[%l7 + %i2],	%l6
	set	0x14, %l0
	swapa	[%l7 + %l0] 0x89,	%g7
	fpadd16	%f10,	%f2,	%f12
	nop
	set	0x62, %o4
	ldub	[%l7 + %o4],	%o2
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 2
	or	%o1,	%l3,	%l2
	nop
	set	0x40, %g5
	ldsw	[%l7 + %g5],	%i6
	fpsub32	%f30,	%f30,	%f10
	st	%f29,	[%l7 + 0x5C]
	set	0x5E, %o2
	stha	%g1,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x50, %g1
	stxa	%i4,	[%l7 + %g1] 0x89
	set	0x30, %l6
	ldxa	[%l7 + %l6] 0x89,	%o6
	set	0x64, %o0
	stwa	%o7,	[%l7 + %o0] 0x80
	or	%i7,	%i3,	%o0
	nop
	set	0x19, %g6
	ldub	[%l7 + %g6],	%g6
	set	0x70, %i3
	stda	%l4,	[%l7 + %i3] 0x88
	st	%fsr,	[%l7 + 0x5C]
	set	0x50, %i4
	stha	%g3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f8
	nop
	set	0x08, %l5
	std	%f22,	[%l7 + %l5]
	set	0x20, %g2
	stda	%g4,	[%l7 + %g2] 0x80
	set	0x70, %i7
	sta	%f28,	[%l7 + %i7] 0x81
	nop
	set	0x10, %g3
	prefetch	[%l7 + %g3],	 3
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x22, %l2
	ldub	[%l7 + %l2],	%g2
	set	0x1C, %o7
	swapa	[%l7 + %o7] 0x88,	%l4
	nop
	set	0x67, %i0
	ldsb	[%l7 + %i0],	%i1
	nop
	set	0x08, %g7
	std	%o2,	[%l7 + %g7]
	nop
	set	0x50, %i1
	stx	%g5,	[%l7 + %i1]
	set	0x68, %g4
	ldstuba	[%l7 + %g4] 0x80,	%o4
	set	0x56, %o5
	stha	%i0,	[%l7 + %o5] 0xe3
	membar	#Sync
	bl,a	%xcc,	loop_177
	ble	%xcc,	loop_178
	st	%fsr,	[%l7 + 0x60]
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
loop_177:
	add	%i2,	%l6,	%g7
loop_178:
	nop
	set	0x0D, %i6
	ldub	[%l7 + %i6],	%l1
	wr	%o2,	%o1,	%set_softint
	set	0x08, %l3
	stda	%l2,	[%l7 + %l3] 0x80
	st	%f8,	[%l7 + 0x18]
	nop
	set	0x08, %l1
	lduh	[%l7 + %l1],	%i6
	set	0x12, %i5
	stha	%g1,	[%l7 + %i5] 0x88
	set	0x3C, %o1
	lda	[%l7 + %o1] 0x88,	%f22
	set	0x18, %i2
	stha	%i5,	[%l7 + %i2] 0x89
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f0
	nop
	set	0x1F, %l4
	ldub	[%l7 + %l4],	%o5
	nop
	set	0x30, %o4
	stx	%l3,	[%l7 + %o4]
	set	0x30, %g5
	stha	%o6,	[%l7 + %g5] 0x88
	set	0x48, %o2
	stwa	%i4,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%i6
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%i3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f0
	set	0x28, %i3
	stha	%o7,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x30, %o3
	std	%o0,	[%l7 + %o3]
	set	0x60, %l5
	swapa	[%l7 + %l5] 0x89,	%g6
	fpsub16s	%f21,	%f1,	%f10
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x80,	%l5
	bl	%icc,	loop_179
	and	%g3,	%g4,	%l4
	nop
	set	0x54, %i4
	sth	%g2,	[%l7 + %i4]
	nop
	set	0x50, %g3
	ldsb	[%l7 + %g3],	%i1
loop_179:
	add	%g5,	%o3,	%i0
	set	0x48, %i7
	stha	%o4,	[%l7 + %i7] 0x88
	set	0x48, %l2
	stwa	%l0,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x48, %i0
	lduw	[%l7 + %i0],	%i2
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x80,	%l6
	nop
	set	0x5A, %o7
	stb	%l1,	[%l7 + %o7]
	set	0x24, %i1
	stba	%o2,	[%l7 + %i1] 0x88
	st	%f15,	[%l7 + 0x38]
	ld	[%l7 + 0x24],	%f18
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%f2,	[%l7 + 0x74]
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f10
	nop
	set	0x56, %o6
	lduh	[%l7 + %o6],	%g7
	set	0x28, %l3
	stda	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%l2
	nop
	set	0x28, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x41, %o1
	ldstub	[%l7 + %o1],	%i6
	bn,pt	%xcc,	loop_180
	nop
	set	0x5B, %l1
	stb	%i5,	[%l7 + %l1]
	nop
	set	0x19, %i2
	ldstub	[%l7 + %i2],	%g1
	nop
	set	0x60, %l4
	std	%f4,	[%l7 + %l4]
loop_180:
	nop
	set	0x1D, %o4
	ldstub	[%l7 + %o4],	%l3
	set	0x68, %l0
	sta	%f17,	[%l7 + %l0] 0x80
	nop
	set	0x78, %g5
	std	%o4,	[%l7 + %g5]
	nop
	set	0x4B, %g1
	stb	%o6,	[%l7 + %g1]
	or	%i7,	%i3,	%i4
	st	%f30,	[%l7 + 0x44]
	nop
	set	0x4E, %o2
	ldsb	[%l7 + %o2],	%o7
	set	0x5E, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g6
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	wr	%l5,	%g3,	%pic
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xe3,	%o0
	nop
	set	0x2C, %o0
	stw	%g4,	[%l7 + %o0]
	or	%l4,	%g2,	%i1
	set	0x14, %l5
	stwa	%g5,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%i0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
	nop
	set	0x64, %g2
	lduw	[%l7 + %g2],	%o4
	fpsub32	%f20,	%f24,	%f8
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%l6
	nop
	set	0x20, %i4
	std	%f26,	[%l7 + %i4]
	nop
	set	0x41, %g3
	ldstub	[%l7 + %g3],	%i2
	set	0x1C, %i7
	stwa	%o2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x5C, %l2
	stw	%l1,	[%l7 + %l2]
	set	0x28, %g7
	stxa	%o1,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x28, %o7
	lduw	[%l7 + %o7],	%g7
	st	%f0,	[%l7 + 0x2C]
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x88,	%i6
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f10
	nop
	set	0x0E, %g4
	ldub	[%l7 + %g4],	%i5
	st	%f24,	[%l7 + 0x48]
	nop
	set	0x52, %o6
	ldsh	[%l7 + %o6],	%g1
	nop
	set	0x0A, %o5
	stb	%l2,	[%l7 + %o5]
	set	0x4A, %l3
	stha	%o5,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x74, %i6
	swap	[%l7 + %i6],	%l3
	or	%o6,	%i7,	%i3
	add	%i4,	%o7,	%l5
	st	%fsr,	[%l7 + 0x78]
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x81,	%g2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xea,	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o0
	set	0x20, %i5
	stwa	%g2,	[%l7 + %i5] 0x80
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%i1
	nop
	set	0x50, %o4
	std	%f10,	[%l7 + %o4]
	st	%f31,	[%l7 + 0x78]
	or	%l4,	%g5,	%o3
	nop
	set	0x48, %l4
	std	%f30,	[%l7 + %l4]
	nop
	set	0x30, %g5
	std	%f24,	[%l7 + %g5]
	add	%o4,	%i0,	%l0
	nop
	set	0x38, %l0
	lduw	[%l7 + %l0],	%i2
	nop
	set	0x7C, %g1
	swap	[%l7 + %g1],	%l6
	set	0x54, %o2
	sta	%f15,	[%l7 + %o2] 0x81
	set	0x0C, %l6
	stha	%o2,	[%l7 + %l6] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%l1
	nop
	set	0x18, %i3
	std	%g6,	[%l7 + %i3]
	st	%f31,	[%l7 + 0x5C]
	nop
	set	0x44, %o0
	ldsh	[%l7 + %o0],	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%l2
	st	%f23,	[%l7 + 0x20]
	st	%f16,	[%l7 + 0x34]
	set	0x6A, %l5
	stba	%o5,	[%l7 + %l5] 0x81
	st	%fsr,	[%l7 + 0x74]
	set	0x18, %o3
	sta	%f24,	[%l7 + %o3] 0x89
	set	0x48, %g2
	ldxa	[%l7 + %g2] 0x89,	%i6
	nop
	set	0x2A, %i4
	ldsh	[%l7 + %i4],	%o6
	nop
	set	0x34, %g3
	ldsw	[%l7 + %g3],	%i7
	nop
	set	0x48, %i7
	swap	[%l7 + %i7],	%l3
	ld	[%l7 + 0x54],	%f24
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%i2
	nop
	set	0x38, %l2
	ldx	[%l7 + %l2],	%o7
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x38, %g7
	ldxa	[%l7 + %g7] 0x89,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g6
	set	0x1C, %i1
	sta	%f24,	[%l7 + %i1] 0x89
	set	0x24, %i0
	swapa	[%l7 + %i0] 0x88,	%g4
	set	0x34, %g4
	swapa	[%l7 + %g4] 0x89,	%g3
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f16
	set	0x6E, %o6
	stba	%g2,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%o0
	or	%l4,	%i1,	%g5
	nop
	set	0x48, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x6F, %l1
	ldstub	[%l7 + %l1],	%i0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i2
	nop
	set	0x1C, %i5
	ldsb	[%l7 + %i5],	%l0
	ld	[%l7 + 0x60],	%f20
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x53, %o4
	stb	%o2,	[%l7 + %o4]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xda
	nop
	set	0x32, %i2
	ldub	[%l7 + %i2],	%o1
	nop
	set	0x38, %g5
	lduw	[%l7 + %g5],	%l1
	bl,pn	%icc,	loop_181
	nop
	set	0x74, %l0
	ldsh	[%l7 + %l0],	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%g1
loop_181:
	or	%l2,	%l6,	%o5
	st	%f23,	[%l7 + 0x24]
	nop
	set	0x48, %o2
	std	%i6,	[%l7 + %o2]
	set	0x48, %g1
	stxa	%i7,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x48, %i3
	stx	%l3,	[%l7 + %i3]
	nop
	set	0x45, %o0
	ldsb	[%l7 + %o0],	%o6
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f16
	st	%f23,	[%l7 + 0x38]
	nop
	set	0x20, %o3
	ldsw	[%l7 + %o3],	%i3
	nop
	set	0x5C, %g2
	swap	[%l7 + %g2],	%l5
	nop
	set	0x1E, %i4
	lduh	[%l7 + %i4],	%o7
	set	0x18, %g3
	stda	%i4,	[%l7 + %g3] 0xe3
	membar	#Sync
	and	%g6,	%g4,	%g3
	st	%f27,	[%l7 + 0x50]
	st	%f26,	[%l7 + 0x4C]
	nop
	set	0x30, %i7
	swap	[%l7 + %i7],	%g2
	nop
	set	0x14, %g6
	stw	%l4,	[%l7 + %g6]
	nop
	set	0x54, %l2
	sth	%o0,	[%l7 + %l2]
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%g5
	or	%i1,	%o4,	%i0
	wr	%o3,	%l0,	%sys_tick
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%i2
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x89,	 1
	st	%f28,	[%l7 + 0x14]
	fpadd32s	%f14,	%f9,	%f26
	nop
	set	0x60, %g4
	stx	%o1,	[%l7 + %g4]
	set	0x34, %o5
	stwa	%g7,	[%l7 + %o5] 0x81
	nop
	set	0x52, %o6
	lduh	[%l7 + %o6],	%l1
	nop
	set	0x54, %i1
	lduh	[%l7 + %i1],	%g1
	ld	[%l7 + 0x68],	%f8
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%l2
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%l6
	nop
	set	0x0B, %o1
	ldub	[%l7 + %o1],	%i6
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xda
	set	0x20, %l3
	stxa	%i7,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x60, %i5
	prefetch	[%l7 + %i5],	 4
	wr	%l3,	%o5,	%clear_softint
	and	%i3,	%o6,	%o7
	set	0x68, %l4
	sta	%f16,	[%l7 + %l4] 0x89
	set	0x30, %i2
	stxa	%l5,	[%l7 + %i2] 0x89
	nop
	set	0x30, %o4
	swap	[%l7 + %o4],	%i4
	set	0x18, %g5
	stha	%g4,	[%l7 + %g5] 0x89
	set	0x60, %o2
	stda	%g2,	[%l7 + %o2] 0x89
	nop
	set	0x10, %g1
	swap	[%l7 + %g1],	%g2
	nop
	set	0x44, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x80,	%g6
	nop
	set	0x30, %i3
	std	%f10,	[%l7 + %i3]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%f0
	nop
	set	0x6C, %g2
	stw	%l4,	[%l7 + %g2]
	set	0x70, %o3
	sta	%f6,	[%l7 + %o3] 0x88
	set	0x28, %i4
	stda	%o0,	[%l7 + %i4] 0x81
	nop
	set	0x1C, %g3
	swap	[%l7 + %g3],	%g5
	wr	%i1,	%o4,	%pic
	set	0x18, %g6
	stda	%i0,	[%l7 + %g6] 0x81
	ld	[%l7 + 0x1C],	%f20
	nop
	set	0x3C, %l2
	stw	%o3,	[%l7 + %l2]
	set	0x39, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l0
	set	0x1C, %g7
	stba	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x30, %l6
	std	%o0,	[%l7 + %l6]
	and	%g7,	%i2,	%g1
	nop
	set	0x18, %o7
	swap	[%l7 + %o7],	%i5
	ld	[%l7 + 0x3C],	%f29
	set	0x15, %i0
	ldstuba	[%l7 + %i0] 0x81,	%l1
	fpsub16	%f10,	%f30,	%f12
	fpadd16	%f24,	%f30,	%f20
	nop
	set	0x10, %o5
	swap	[%l7 + %o5],	%l2
	and	%l6,	%i7,	%l3
	ba,pn	%icc,	loop_182
	add	%o5,	%i6,	%i3
	ble,a	%icc,	loop_183
	and	%o7,	%o6,	%l5
loop_182:
	nop
	set	0x64, %o6
	lda	[%l7 + %o6] 0x80,	%f30
loop_183:
	nop
	set	0x58, %i1
	sth	%i4,	[%l7 + %i1]
	nop
	set	0x10, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x58, %g4
	stwa	%g4,	[%l7 + %g4] 0x89
	nop
	set	0x2A, %o1
	lduh	[%l7 + %o1],	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	fpadd16s	%f9,	%f21,	%f16
	nop
	set	0x28, %l1
	ldstub	[%l7 + %l1],	%o0
	wr	%l4,	%i1,	%softint
	and	%g5,	%o4,	%i0
	nop
	set	0x54, %l3
	stw	%l0,	[%l7 + %l3]
	nop
	set	0x2A, %l4
	sth	%o2,	[%l7 + %l4]
	nop
	set	0x5C, %i5
	stw	%o1,	[%l7 + %i5]
	set	0x40, %i2
	lda	[%l7 + %i2] 0x80,	%f22
	nop
	set	0x0E, %g5
	sth	%o3,	[%l7 + %g5]
	nop
	set	0x08, %o4
	std	%f12,	[%l7 + %o4]
	set	0x18, %o2
	swapa	[%l7 + %o2] 0x81,	%i2
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%g1
	nop
	set	0x1E, %o0
	ldsh	[%l7 + %o0],	%i5
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%l1
	set	0x08, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l2
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x88,	 1
	nop
	set	0x18, %g2
	std	%f24,	[%l7 + %g2]
	nop
	set	0x62, %i4
	ldub	[%l7 + %i4],	%i7
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%l3
	ld	[%l7 + 0x70],	%f9
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xeb,	%o4
	nop
	set	0x41, %o3
	stb	%g7,	[%l7 + %o3]
	st	%f16,	[%l7 + 0x7C]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f16
	or	%i6,	%o7,	%i3
	set	0x7D, %l2
	stba	%o6,	[%l7 + %l2] 0x81
	set	0x5B, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i4
	nop
	set	0x31, %g7
	ldub	[%l7 + %g7],	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%g3
	wr	%g2,	%g6,	%sys_tick
	set	0x3C, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o0
	set	0x58, %o5
	sta	%f31,	[%l7 + %o5] 0x80
	set	0x60, %o6
	lda	[%l7 + %o6] 0x80,	%f1
	set	0x4C, %i1
	stwa	%l4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x30, %i6
	lduw	[%l7 + %i6],	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%o4
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f26
	nop
	set	0x3C, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x1B, %l1
	ldub	[%l7 + %l1],	%i0
	set	0x6C, %l3
	sta	%f22,	[%l7 + %l3] 0x80
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x08, %o7
	std	%o2,	[%l7 + %o7]
	set	0x09, %l4
	ldstuba	[%l7 + %l4] 0x81,	%l0
	nop
	set	0x1B, %i2
	ldub	[%l7 + %i2],	%o3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%i2
	set	0x4C, %i5
	sta	%f5,	[%l7 + %i5] 0x81
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f20
	nop
	set	0x7A, %o2
	ldsh	[%l7 + %o2],	%i5
	nop
	set	0x21, %g1
	ldstub	[%l7 + %g1],	%g1
	set	0x78, %o0
	stxa	%l1,	[%l7 + %o0] 0x80
	wr	%l2,	%l6,	%sys_tick
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f16
	nop
	set	0x71, %i3
	ldstub	[%l7 + %i3],	%i7
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf0
	membar	#Sync
	nop
	set	0x30, %g2
	std	%f20,	[%l7 + %g2]
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%o4
	nop
	set	0x26, %l0
	ldub	[%l7 + %l0],	%g7
	nop
	set	0x0C, %g6
	sth	%i6,	[%l7 + %g6]
	set	0x5C, %g3
	lda	[%l7 + %g3] 0x89,	%f28
	nop
	set	0x4A, %o3
	ldstub	[%l7 + %o3],	%l3
	nop
	set	0x18, %l2
	stw	%i3,	[%l7 + %l2]
	set	0x6A, %i7
	stha	%o7,	[%l7 + %i7] 0x89
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	set	0x68, %l6
	swapa	[%l7 + %l6] 0x81,	%i4
	or	%o6,	%l5,	%g3
	nop
	set	0x40, %o5
	sth	%g2,	[%l7 + %o5]
	nop
	set	0x50, %o6
	std	%g6,	[%l7 + %o6]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o0
	nop
	set	0x20, %i0
	lduh	[%l7 + %i0],	%g5
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%i0
	nop
	set	0x18, %i6
	prefetch	[%l7 + %i6],	 4
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0
	st	%f18,	[%l7 + 0x58]
	nop
	set	0x10, %l1
	stw	%i0,	[%l7 + %l1]
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	st	%fsr,	[%l7 + 0x20]
	bge,a,pn	%xcc,	loop_184
	fpadd16	%f0,	%f0,	%f4
	st	%fsr,	[%l7 + 0x38]
	st	%fsr,	[%l7 + 0x64]
loop_184:
	nop
	set	0x6A, %g4
	sth	%o2,	[%l7 + %g4]
	nop
	set	0x72, %l4
	sth	%o3,	[%l7 + %l4]
	set	0x4E, %i2
	ldstuba	[%l7 + %i2] 0x80,	%o1
	nop
	set	0x08, %i5
	ldx	[%l7 + %i5],	%i2
	nop
	set	0x48, %g5
	stw	%l0,	[%l7 + %g5]
	set	0x78, %o2
	stda	%g0,	[%l7 + %o2] 0x81
	set	0x48, %g1
	stda	%l0,	[%l7 + %g1] 0x80
	set	0x0C, %o0
	stwa	%i5,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x08, %o4
	stx	%l6,	[%l7 + %o4]
	nop
	set	0x0E, %o7
	sth	%i7,	[%l7 + %o7]
	set	0x30, %l5
	ldda	[%l7 + %l5] 0xe2,	%o4
	set	0x50, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%i6
	wr 	%g0, 	0x5, 	%fprs
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc0
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%i4
	set	0x6E, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o6
	set	0x48, %g3
	ldxa	[%l7 + %g3] 0x89,	%l5
	nop
	set	0x60, %i3
	stx	%o7,	[%l7 + %i3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g6
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%g4
	set	0x58, %i7
	lda	[%l7 + %i7] 0x80,	%f6
	nop
	set	0x10, %g7
	ldub	[%l7 + %g7],	%o0
	nop
	set	0x64, %l2
	lduw	[%l7 + %l2],	%g2
	nop
	set	0x60, %l6
	std	%i0,	[%l7 + %l6]
	nop
	set	0x36, %o6
	stb	%g5,	[%l7 + %o6]
	add	%l4,	%i0,	%o2
	nop
	set	0x46, %o5
	sth	%o3,	[%l7 + %o5]
	nop
	set	0x60, %i1
	std	%o4,	[%l7 + %i1]
	add	%i2,	%l0,	%g1
	st	%f29,	[%l7 + 0x08]
	set	0x10, %i0
	ldda	[%l7 + %i0] 0xeb,	%o0
	nop
	set	0x48, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x3D, %i6
	ldsb	[%l7 + %i6],	%i5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%l6
	nop
	set	0x48, %l1
	ldsh	[%l7 + %l1],	%l2
	nop
	set	0x1D, %l3
	ldub	[%l7 + %l3],	%i6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
	set	0x50, %i2
	sta	%f20,	[%l7 + %i2] 0x80
	st	%fsr,	[%l7 + 0x30]
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x80,	%l2
	nop
	set	0x10, %g4
	ldsw	[%l7 + %g4],	%i3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f16
	nop
	set	0x7C, %g1
	lduh	[%l7 + %g1],	%i4
	nop
	set	0x4C, %g5
	ldsh	[%l7 + %g5],	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%o7
	set	0x50, %o0
	stxa	%g3,	[%l7 + %o0] 0x89
	or	%g7,	%g4,	%o0
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 3
	st	%f8,	[%l7 + 0x5C]
	set	0x70, %o7
	stda	%g2,	[%l7 + %o7] 0x81
	st	%fsr,	[%l7 + 0x10]
	fpadd16s	%f26,	%f13,	%f3
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x88,	 3
	set	0x56, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g5
	nop
	set	0x36, %g2
	stb	%g6,	[%l7 + %g2]
	nop
	set	0x7C, %l0
	lduw	[%l7 + %l0],	%i0
	be	%icc,	loop_185
	nop
	set	0x28, %g6
	stb	%o2,	[%l7 + %g6]
	nop
	set	0x72, %i3
	ldsb	[%l7 + %i3],	%l4
	add	%o4,	%o3,	%i2
loop_185:
	nop
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf8
	membar	#Sync
	and	%l0,	%g1,	%i5
	nop
	set	0x3E, %o3
	ldub	[%l7 + %o3],	%o1
	or	%l1,	%i7,	%o5
	nop
	set	0x58, %g7
	stx	%l6,	[%l7 + %g7]
	set	0x58, %i7
	stxa	%i6,	[%l7 + %i7] 0x89
	nop
	set	0x1D, %l6
	ldub	[%l7 + %l6],	%l3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i4
	nop
	set	0x74, %o6
	ldsw	[%l7 + %o6],	%o6
	set	0x68, %o5
	ldxa	[%l7 + %o5] 0x81,	%l2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%g4
	set	0x6C, %i1
	stwa	%o0,	[%l7 + %i1] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i1
	set	0x38, %i0
	stda	%g4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x48, %l2
	swapa	[%l7 + %l2] 0x88,	%g6
	nop
	set	0x1E, %o1
	ldsb	[%l7 + %o1],	%i0
	ld	[%l7 + 0x3C],	%f23
	wr	%g7,	%o2,	%softint
	nop
	set	0x08, %l1
	swap	[%l7 + %l1],	%l4
	nop
	set	0x19, %i6
	ldstub	[%l7 + %i6],	%o4
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x80,	 4
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x88,	%l0
	nop
	set	0x24, %i5
	stw	%o3,	[%l7 + %i5]
	nop
	set	0x7A, %g4
	ldsh	[%l7 + %g4],	%g1
	ba,a	%icc,	loop_186
	nop
	set	0x78, %l4
	std	%i4,	[%l7 + %l4]
	nop
	set	0x68, %g1
	stx	%l1,	[%l7 + %g1]
	nop
	set	0x18, %o2
	stx	%o1,	[%l7 + %o2]
loop_186:
	nop
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x89,	%o5
	and	%l6,	%i7,	%l3
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%i2
	set	0x78, %o7
	stxa	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x7F, %l5
	ldsb	[%l7 + %l5],	%o6
	set	0x10, %i4
	lda	[%l7 + %i4] 0x89,	%f10
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%l2
	set	0x68, %l0
	stda	%o6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x0C, %g6
	swapa	[%l7 + %g6] 0x81,	%i6
	nop
	set	0x7A, %o4
	sth	%l5,	[%l7 + %o4]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc2
	nop
	set	0x18, %o3
	stw	%g4,	[%l7 + %o3]
	or	%g3,	%o0,	%i1
	nop
	nop
	setx	0x593334C3D52AE62B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0A10ED4B21A12FBF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f24,	%f8
	set	0x48, %g7
	stda	%g2,	[%l7 + %g7] 0x89
	ld	[%l7 + 0x1C],	%f8
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f16
	set	0x38, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g5
	st	%f29,	[%l7 + 0x74]
	ld	[%l7 + 0x58],	%f17
	or	%i0,	%g7,	%o2
	nop
	set	0x38, %i7
	stx	%g6,	[%l7 + %i7]
	nop
	set	0x18, %o5
	std	%f4,	[%l7 + %o5]
	nop
	set	0x58, %o6
	std	%f12,	[%l7 + %o6]
	set	0x28, %i0
	sta	%f29,	[%l7 + %i0] 0x80
	nop
	set	0x24, %l2
	lduw	[%l7 + %l2],	%l4
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f22
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%o4
	nop
	set	0x76, %l1
	ldsh	[%l7 + %l1],	%i2
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%l0
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x10, %i5
	ldxa	[%l7 + %i5] 0x81,	%g1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x80
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%o3
	nop
	set	0x08, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xca
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i5
	nop
	set	0x12, %g4
	sth	%o5,	[%l7 + %g4]
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xeb,	%i6
	nop
	set	0x13, %g5
	ldstub	[%l7 + %g5],	%o1
	st	%f10,	[%l7 + 0x28]
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f0
	set	0x28, %l5
	stwa	%l3,	[%l7 + %l5] 0x81
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
	nop
	set	0x2C, %g6
	stw	%i3,	[%l7 + %g6]
	nop
	set	0x4C, %l0
	prefetch	[%l7 + %l0],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%o6
	nop
	set	0x18, %o4
	stx	%l2,	[%l7 + %o4]
	nop
	set	0x50, %o3
	stx	%i6,	[%l7 + %o3]
	set	0x20, %i3
	sta	%f21,	[%l7 + %i3] 0x81
	set	0x58, %g3
	ldxa	[%l7 + %g3] 0x89,	%o7
	nop
	set	0x78, %g7
	ldsb	[%l7 + %g7],	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%o0
	nop
	set	0x20, %i7
	stw	%g4,	[%l7 + %i7]
	set	0x30, %o5
	stda	%g2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x38, %o6
	stxa	%i1,	[%l7 + %o6] 0x81
	set	0x14, %l6
	sta	%f31,	[%l7 + %l6] 0x80
	or	%g5,	%i0,	%g7
	nop
	set	0x28, %i0
	std	%f10,	[%l7 + %i0]
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xea,	%o2
	or	%g6,	%o4,	%l4
	ba,a	%xcc,	loop_187
	nop
	set	0x41, %o1
	ldstub	[%l7 + %o1],	%l0
	nop
	set	0x49, %i1
	stb	%i2,	[%l7 + %i1]
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x80,	%g1
loop_187:
	nop
	set	0x7F, %l3
	ldstub	[%l7 + %l3],	%l1
	nop
	set	0x41, %i2
	ldub	[%l7 + %i2],	%i5
	nop
	set	0x30, %i6
	std	%f20,	[%l7 + %i6]
	or	%o3,	%o5,	%o1
	set	0x20, %i5
	stxa	%l6,	[%l7 + %i5] 0x80
	set	0x31, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i7
	set	0x38, %o2
	stwa	%i3,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x6C, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x10, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x10, %o7
	lda	[%l7 + %o7] 0x89,	%f19
	nop
	set	0x64, %g4
	lduw	[%l7 + %g4],	%l3
	and	%o6,	%l2,	%i6
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%o7
	wr	%g3,	%g4,	%ccr
	nop
	set	0x34, %i4
	ldsh	[%l7 + %i4],	%o0
	st	%f25,	[%l7 + 0x24]
	nop
	set	0x71, %g2
	ldstub	[%l7 + %g2],	%g2
	set	0x54, %g6
	stwa	%g5,	[%l7 + %g6] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i0
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%o2
	and	%g6,	%g7,	%l4
	nop
	set	0x30, %l5
	lduw	[%l7 + %l5],	%o4
	nop
	set	0x24, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x5A, %i3
	sth	%l0,	[%l7 + %i3]
	nop
	set	0x74, %o3
	swap	[%l7 + %o3],	%g1
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x88,	%l1
	nop
	set	0x08, %i7
	ldsw	[%l7 + %i7],	%i2
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	and	%o3,	%o5,	%o1
	nop
	set	0x56, %g7
	ldub	[%l7 + %g7],	%l6
	nop
	set	0x68, %l6
	ldsh	[%l7 + %l6],	%i5
	set	0x30, %i0
	stxa	%i7,	[%l7 + %i0] 0xeb
	membar	#Sync
	st	%f30,	[%l7 + 0x08]
	add	%i3,	%o6,	%l3
	set	0x40, %l2
	stda	%l2,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x36, %o1
	ldstub	[%l7 + %o1],	%i6
	nop
	set	0x60, %i1
	ldsh	[%l7 + %i1],	%l5
	set	0x3C, %l1
	stha	%i4,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x28, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x76, %i2
	lduh	[%l7 + %i2],	%g3
	nop
	set	0x58, %i6
	stw	%o7,	[%l7 + %i6]
	nop
	set	0x58, %g1
	ldsb	[%l7 + %g1],	%o0
	st	%f31,	[%l7 + 0x24]
	and	%g2,	%g5,	%g4
	nop
	set	0x6C, %o2
	stb	%i1,	[%l7 + %o2]
	nop
	set	0x54, %i5
	sth	%o2,	[%l7 + %i5]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f0
	set	0x50, %o7
	sta	%f4,	[%l7 + %o7] 0x81
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	and	%g6,	%g7,	%i0
	nop
	set	0x20, %g4
	std	%l4,	[%l7 + %g4]
	nop
	set	0x60, %i4
	lduh	[%l7 + %i4],	%o4
	nop
	set	0x20, %g2
	std	%f26,	[%l7 + %g2]
	set	0x48, %g5
	stwa	%g1,	[%l7 + %g5] 0x89
	nop
	set	0x6C, %g6
	ldsh	[%l7 + %g6],	%l0
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x81,	%l1
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%o3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f16
	set	0x5C, %i3
	stwa	%o5,	[%l7 + %i3] 0xe2
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%o1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f16
	and	%l6,	%i5,	%i3
	nop
	nop
	setx	0xF9ABE420,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xAAE4BCD8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f23,	%f25
	add	%i7,	%o6,	%l2
	fpsub32	%f26,	%f30,	%f10
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%l3
	st	%fsr,	[%l7 + 0x14]
	add	%l5,	%i4,	%i6
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x89,	%o6
	wr	%g3,	%g2,	%ccr
	and	%g5,	%o0,	%g4
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x89,	 3
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%g6
	nop
	set	0x74, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x10, %l2
	swapa	[%l7 + %l2] 0x88,	%g7
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f16
	nop
	set	0x34, %o6
	swap	[%l7 + %o6],	%i1
	set	0x40, %o1
	stxa	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	or	%o4,	%i0,	%l0
	ble,pt	%icc,	loop_188
	nop
	set	0x30, %l1
	stx	%l1,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x44]
	fpsub16	%f2,	%f30,	%f14
loop_188:
	nop
	set	0x20, %i1
	std	%f28,	[%l7 + %i1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x58, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x64, %i6
	ldsw	[%l7 + %i6],	%i2
	set	0x70, %g1
	stda	%o4,	[%l7 + %g1] 0x89
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%l6
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x60, %o0
	stx	%i5,	[%l7 + %o0]
	set	0x54, %o2
	lda	[%l7 + %o2] 0x89,	%f9
	nop
	set	0x26, %o7
	sth	%o1,	[%l7 + %o7]
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%i2
	set	0x17, %i4
	stba	%i7,	[%l7 + %i4] 0xe2
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%o6
	bg,a	%xcc,	loop_189
	nop
	set	0x30, %g2
	ldx	[%l7 + %g2],	%l5
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%l3
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe3,	%i6
loop_189:
	nop
	set	0x1C, %g6
	swap	[%l7 + %g6],	%i4
	nop
	set	0x40, %l5
	std	%f4,	[%l7 + %l5]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%g2
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x80,	%o7
	nop
	set	0x2A, %i3
	stb	%o0,	[%l7 + %i3]
	nop
	set	0x78, %l0
	std	%f20,	[%l7 + %l0]
	set	0x50, %g3
	stda	%g4,	[%l7 + %g3] 0x81
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x81,	%g4
	nop
	set	0x68, %i7
	ldub	[%l7 + %i7],	%o2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd0,	%f0
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%g6
	st	%fsr,	[%l7 + 0x50]
	set	0x1C, %o3
	swapa	[%l7 + %o3] 0x80,	%g7
	nop
	set	0x77, %l2
	ldsb	[%l7 + %l2],	%l4
	nop
	set	0x30, %l6
	lduw	[%l7 + %l6],	%i1
	st	%fsr,	[%l7 + 0x50]
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x88,	 1
	set	0x78, %l1
	lda	[%l7 + %l1] 0x80,	%f22
	nop
	set	0x6C, %o1
	sth	%i0,	[%l7 + %o1]
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x80,	%l0
	ld	[%l7 + 0x78],	%f8
	nop
	set	0x70, %l3
	std	%l0,	[%l7 + %l3]
	set	0x74, %i6
	lda	[%l7 + %i6] 0x80,	%f19
	set	0x70, %g1
	stha	%o3,	[%l7 + %g1] 0xea
	membar	#Sync
	ld	[%l7 + 0x5C],	%f5
	fpsub32	%f24,	%f30,	%f24
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%g0
	nop
	set	0x6C, %i5
	sth	%o5,	[%l7 + %i5]
	nop
	set	0x40, %o0
	ldsw	[%l7 + %o0],	%i2
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%l6
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x1B, %g4
	stb	%o1,	[%l7 + %g4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%i7
	set	0x76, %g2
	stha	%l2,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x7F, %g5
	ldstuba	[%l7 + %g5] 0x81,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%l5
	set	0x30, %l4
	stba	%l3,	[%l7 + %l4] 0xea
	membar	#Sync
	and	%i6,	%g3,	%i4
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x89,	%f19
	nop
	set	0x7C, %i4
	ldsw	[%l7 + %i4],	%g2
	and	%o7,	%g5,	%g4
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x81,	%o0
	nop
	set	0x7F, %i3
	stb	%g6,	[%l7 + %i3]
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x80,	%g7
	set	0x78, %l0
	sta	%f6,	[%l7 + %l0] 0x81
	set	0x40, %g3
	swapa	[%l7 + %g3] 0x81,	%o2
	nop
	set	0x48, %o5
	lduh	[%l7 + %o5],	%i1
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%l4
	set	0x64, %i0
	lda	[%l7 + %i0] 0x81,	%f28
	nop
	set	0x5C, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xe2,	%o4
	nop
	set	0x44, %l2
	lduw	[%l7 + %l2],	%l0
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%i0
	nop
	set	0x60, %l1
	std	%f4,	[%l7 + %l1]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
	set	0x40, %i1
	lda	[%l7 + %i1] 0x81,	%f18
	nop
	set	0x30, %l3
	stx	%o3,	[%l7 + %l3]
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xe2,	%l0
	fpadd32s	%f2,	%f2,	%f15
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%o5
	nop
	set	0x60, %g1
	stw	%l6,	[%l7 + %g1]
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%o1
	nop
	set	0x0A, %i2
	stb	%i2,	[%l7 + %i2]
	nop
	set	0x10, %o0
	ldstub	[%l7 + %o0],	%i5
	nop
	set	0x1C, %i5
	ldstub	[%l7 + %i5],	%l2
	fpsub32	%f22,	%f20,	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%o6
	nop
	set	0x20, %o7
	stw	%l5,	[%l7 + %o7]
	nop
	set	0x5D, %g4
	stb	%l3,	[%l7 + %g4]
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%i2
	set	0x3F, %g5
	stba	%i6,	[%l7 + %g5] 0x88
	nop
	set	0x14, %l4
	ldub	[%l7 + %l4],	%i4
	nop
	set	0x10, %g2
	std	%g2,	[%l7 + %g2]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f0
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%g2
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%o6
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%g5
	nop
	set	0x10, %o4
	ldx	[%l7 + %o4],	%o0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%g7
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%g6
	or	%o2,	%i1,	%o4
	set	0x78, %l0
	stwa	%l4,	[%l7 + %l0] 0x89
	nop
	set	0x55, %g7
	stb	%l0,	[%l7 + %g7]
	nop
	set	0x10, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x68, %i7
	stw	%o3,	[%l7 + %i7]
	or	%i0,	%l1,	%o5
	nop
	set	0x64, %i0
	prefetch	[%l7 + %i0],	 4
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x89,	%g1
	set	0x38, %l2
	stda	%o0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x35, %l1
	stb	%l6,	[%l7 + %l1]
	nop
	set	0x5C, %o6
	ldsw	[%l7 + %o6],	%i2
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%f8
	or	%l2,	%i5,	%i7
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f16
	nop
	set	0x38, %i6
	stx	%o6,	[%l7 + %i6]
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xeb,	%l4
	set	0x75, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i3
	set	0x36, %i2
	stba	%l3,	[%l7 + %i2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x6C],	%f18
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%i6
	ld	[%l7 + 0x7C],	%f0
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%i4
	nop
	set	0x78, %o7
	std	%f28,	[%l7 + %o7]
	nop
	set	0x32, %g4
	stb	%g3,	[%l7 + %g4]
	nop
	set	0x30, %o2
	swap	[%l7 + %o2],	%o7
	set	0x7C, %g5
	stba	%g5,	[%l7 + %g5] 0x88
	set	0x13, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g2
	nop
	set	0x40, %l4
	stw	%o0,	[%l7 + %l4]
	set	0x2F, %g2
	stba	%g4,	[%l7 + %g2] 0x80
	nop
	set	0x32, %l5
	stb	%g6,	[%l7 + %l5]
	set	0x10, %i4
	stda	%g6,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x72, %i3
	ldsh	[%l7 + %i3],	%o2
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	nop
	set	0x28, %g3
	ldsh	[%l7 + %g3],	%l4
	nop
	set	0x60, %g6
	ldsb	[%l7 + %g6],	%l0
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%o3
	wr	%i0,	%i1,	%y
	nop
	set	0x6A, %l0
	ldstub	[%l7 + %l0],	%o5
	nop
	set	0x38, %o5
	ldsw	[%l7 + %o5],	%g1
	nop
	set	0x6A, %i7
	stb	%o1,	[%l7 + %i7]
	nop
	set	0x44, %i0
	ldsh	[%l7 + %i0],	%l6
	fpsub16s	%f13,	%f3,	%f14
	bl,pn	%xcc,	loop_190
	nop
	set	0x32, %l2
	sth	%i2,	[%l7 + %l2]
	st	%f23,	[%l7 + 0x3C]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
loop_190:
	nop
	set	0x5E, %l1
	stb	%l1,	[%l7 + %l1]
	set	0x78, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	and	%i7,	%i5,	%o6
	set	0x08, %o6
	stxa	%i3,	[%l7 + %o6] 0x89
	nop
	set	0x6A, %i6
	ldub	[%l7 + %i6],	%l3
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x33, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i6
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x40, %i2
	std	%f20,	[%l7 + %i2]
	wr	%l5,	%g3,	%ccr
	set	0x0A, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%f16
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%g5
	wr 	%g0, 	0x7, 	%fprs
	set	0x3A, %o7
	stha	%g4,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%g7
	nop
	set	0x24, %o0
	swap	[%l7 + %o0],	%o2
	set	0x60, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%i1
	nop
	set	0x78, %o2
	std	%f10,	[%l7 + %o2]
	nop
	set	0x28, %i5
	std	%f24,	[%l7 + %i5]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%g1
	set	0x58, %g5
	stda	%o4,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x68, %l4
	swap	[%l7 + %l4],	%i2
	or	%l1,	%l2,	%i7
	set	0x4A, %l5
	stha	%o6,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%i2
	nop
	set	0x6C, %g2
	swap	[%l7 + %g2],	%l3
	nop
	set	0x18, %o4
	stx	%i5,	[%l7 + %o4]
	nop
	set	0x14, %g3
	ldsh	[%l7 + %g3],	%l5
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x88,	%i6
	nop
	set	0x08, %l0
	swap	[%l7 + %l0],	%i4
	fpadd32	%f28,	%f22,	%f22
	fpsub32s	%f13,	%f31,	%f22
	and	%g3,	%o7,	%g5
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x89,	 4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xda,	%f0
	nop
	set	0x40, %i0
	sth	%g4,	[%l7 + %i0]
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x80
	set	0x30, %g7
	stda	%o0,	[%l7 + %g7] 0x80
	wr	%g6,	%g7,	%pic
	nop
	set	0x2C, %o3
	ldsb	[%l7 + %o3],	%o4
	nop
	set	0x18, %l1
	std	%f10,	[%l7 + %l1]
	bge,a,pn	%icc,	loop_191
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%l4
	add	%o2,	%l0,	%i1
	nop
	set	0x58, %i6
	stw	%i0,	[%l7 + %i6]
loop_191:
	or	%g1,	%o5,	%l6
	or	%o3,	%o1,	%i2
	ld	[%l7 + 0x44],	%f18
	set	0x6C, %o6
	sta	%f24,	[%l7 + %o6] 0x81
	set	0x1B, %i1
	stba	%l1,	[%l7 + %i1] 0x89
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%f28
	or	%i7,	%l2,	%i3
	or	%l3,	%o6,	%l5
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%i5
	nop
	set	0x48, %g1
	ldsh	[%l7 + %g1],	%i4
	nop
	set	0x28, %l3
	std	%g2,	[%l7 + %l3]
	st	%f4,	[%l7 + 0x20]
	nop
	set	0x3E, %o7
	lduh	[%l7 + %o7],	%i6
	nop
	set	0x60, %o0
	swap	[%l7 + %o0],	%o7
	set	0x68, %g4
	sta	%f4,	[%l7 + %g4] 0x89
	set	0x1C, %o2
	sta	%f18,	[%l7 + %o2] 0x88
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%g2
	nop
	set	0x74, %i5
	lduw	[%l7 + %i5],	%g5
	nop
	set	0x50, %l5
	std	%g4,	[%l7 + %l5]
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x46, %g2
	sth	%o0,	[%l7 + %g2]
	set	0x08, %i4
	sta	%f0,	[%l7 + %i4] 0x80
	set	0x20, %o4
	prefetcha	[%l7 + %o4] 0x89,	 4
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%o4
	set	0x50, %g3
	swapa	[%l7 + %g3] 0x88,	%l4
	and	%g7,	%l0,	%i1
	nop
	set	0x0E, %l0
	ldsb	[%l7 + %l0],	%i0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%g1
	wr	%o5,	%o3,	%y
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%o1
	nop
	set	0x20, %i7
	stb	%i2,	[%l7 + %i7]
	set	0x78, %o5
	stha	%l1,	[%l7 + %o5] 0xe2
	membar	#Sync
	or	%i7,	%l2,	%l6
	nop
	set	0x58, %l2
	std	%l2,	[%l7 + %l2]
	set	0x50, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x80,	%l5
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%o6
	nop
	set	0x20, %o3
	stx	%i4,	[%l7 + %o3]
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x81,	%i5
	nop
	set	0x38, %o6
	std	%f28,	[%l7 + %o6]
	nop
	set	0x78, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x09, %i1
	ldub	[%l7 + %i1],	%i6
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x80,	%g3
	st	%f5,	[%l7 + 0x70]
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x38, %l3
	ldx	[%l7 + %l3],	%g2
	nop
	set	0x68, %o7
	swap	[%l7 + %o7],	%o7
	nop
	set	0x14, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x58, %o0
	stw	%o0,	[%l7 + %o0]
	st	%f16,	[%l7 + 0x18]
	nop
	set	0x3D, %g4
	ldub	[%l7 + %g4],	%g6
	nop
	set	0x10, %o2
	std	%f14,	[%l7 + %o2]
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%o4
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%l4
	nop
	set	0x68, %l5
	std	%g6,	[%l7 + %l5]
	or	%l0,	%g4,	%i1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%g1
	nop
	set	0x2A, %g2
	sth	%o2,	[%l7 + %g2]
	set	0x38, %l4
	lda	[%l7 + %l4] 0x88,	%f30
	nop
	set	0x38, %i4
	stw	%o5,	[%l7 + %i4]
	and	%o1,	%o3,	%l1
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%i2
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x89,	%i7
	fpadd32	%f16,	%f10,	%f6
	st	%f11,	[%l7 + 0x48]
	set	0x08, %o4
	stwa	%l2,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x40, %i3
	swapa	[%l7 + %i3] 0x88,	%l6
	nop
	set	0x08, %i7
	stx	%i3,	[%l7 + %i7]
	or	%l3,	%o6,	%i4
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%i5
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%l5
	set	0x18, %g7
	lda	[%l7 + %g7] 0x80,	%f6
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%f18
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i6
	fpadd32	%f2,	%f0,	%f28
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f0
	nop
	set	0x38, %o3
	ldsh	[%l7 + %o3],	%o7
	nop
	set	0x48, %l0
	lduw	[%l7 + %l0],	%g5
	set	0x6C, %l6
	sta	%f24,	[%l7 + %l6] 0x80
	nop
	set	0x30, %o6
	swap	[%l7 + %o6],	%g2
	set	0x2B, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o0
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x81,	 3
	and	%o4,	%l4,	%g7
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%l0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i0
	or	%i1,	%o2,	%o5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%o1
	nop
	set	0x3C, %i6
	sth	%o3,	[%l7 + %i6]
	set	0x10, %l3
	swapa	[%l7 + %l3] 0x89,	%i2
	or	%l1,	%i7,	%l6
	nop
	set	0x54, %g1
	prefetch	[%l7 + %g1],	 1
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%l2
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x81,	%l3
	set	0x1C, %o2
	swapa	[%l7 + %o2] 0x80,	%o6
	nop
	set	0x60, %i5
	stx	%i3,	[%l7 + %i5]
	nop
	set	0x4E, %o7
	stb	%i5,	[%l7 + %o7]
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x81,	%l5
	nop
	set	0x72, %g2
	lduh	[%l7 + %g2],	%i4
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%i6
	nop
	set	0x30, %i4
	std	%o6,	[%l7 + %i4]
	nop
	set	0x47, %g6
	stb	%g5,	[%l7 + %g6]
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x88,	%g2
	set	0x7E, %o4
	stha	%o0,	[%l7 + %o4] 0x88
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%g6
	set	0x74, %g3
	lda	[%l7 + %g3] 0x88,	%f17
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x88,	%o4
	set	0x43, %l2
	stba	%g3,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x88,	%g7
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	bl,pt	%xcc,	loop_192
	nop
	set	0x29, %l1
	ldub	[%l7 + %l1],	%l0
	and	%g4,	%i0,	%i1
	nop
	set	0x0D, %i0
	ldub	[%l7 + %i0],	%l4
loop_192:
	st	%f11,	[%l7 + 0x7C]
	nop
	set	0x28, %o3
	ldub	[%l7 + %o3],	%o2
	nop
	set	0x76, %l0
	lduh	[%l7 + %l0],	%o5
	add	%o1,	%o3,	%g1
	wr	%i2,	%l1,	%set_softint
	nop
	set	0x68, %l6
	std	%i6,	[%l7 + %l6]
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	nop
	set	0x78, %i1
	stw	%l3,	[%l7 + %i1]
	nop
	set	0x68, %o1
	std	%f8,	[%l7 + %o1]
	fpsub16s	%f12,	%f7,	%f21
	nop
	set	0x50, %i2
	swap	[%l7 + %i2],	%l2
	nop
	set	0x20, %l3
	stx	%i3,	[%l7 + %l3]
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x28, %o0
	std	%f14,	[%l7 + %o0]
	wr	%i5,	%l5,	%set_softint
	and	%o6,	%i6,	%i4
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x81,	%o7
	nop
	set	0x12, %i6
	lduh	[%l7 + %i6],	%g5
	nop
	set	0x22, %o2
	ldstub	[%l7 + %o2],	%o0
	nop
	set	0x38, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x4C, %i5
	stw	%g6,	[%l7 + %i5]
	nop
	set	0x2D, %l5
	ldstub	[%l7 + %l5],	%g3
	ld	[%l7 + 0x5C],	%f3
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%g7
	set	0x4C, %g2
	swapa	[%l7 + %g2] 0x89,	%l0
	nop
	set	0x50, %g6
	std	%o4,	[%l7 + %g6]
	fpsub32s	%f0,	%f19,	%f16
	ld	[%l7 + 0x60],	%f28
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%i0
	nop
	set	0x60, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x3C, %i3
	ldsw	[%l7 + %i3],	%g4
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x81,	%i0
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x80,	%l4
	nop
	set	0x46, %l2
	lduh	[%l7 + %l2],	%o5
	set	0x74, %o5
	stha	%o1,	[%l7 + %o5] 0x81
	set	0x08, %g3
	stha	%o2,	[%l7 + %g3] 0x80
	set	0x14, %g7
	sta	%f12,	[%l7 + %g7] 0x81
	nop
	set	0x10, %i0
	swap	[%l7 + %i0],	%o3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	st	%f10,	[%l7 + 0x3C]
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%i2
	or	%l1,	%l6,	%g1
	nop
	set	0x40, %l6
	stw	%l3,	[%l7 + %l6]
	set	0x4C, %l1
	lda	[%l7 + %l1] 0x89,	%f2
	nop
	set	0x36, %i1
	sth	%l2,	[%l7 + %i1]
	set	0x20, %o1
	sta	%f21,	[%l7 + %o1] 0x80
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%i7
	nop
	set	0x10, %i2
	sth	%i5,	[%l7 + %i2]
	nop
	set	0x50, %g1
	std	%f4,	[%l7 + %g1]
	set	0x6F, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i3
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x0D, %l3
	ldstub	[%l7 + %l3],	%o6
	set	0x08, %i6
	swapa	[%l7 + %i6] 0x88,	%i6
	set	0x18, %o2
	sta	%f1,	[%l7 + %o2] 0x80
	nop
	set	0x14, %g4
	ldsh	[%l7 + %g4],	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%o7
	set	0x14, %o7
	stba	%g5,	[%l7 + %o7] 0x89
	nop
	set	0x50, %i5
	swap	[%l7 + %i5],	%g2
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x88,	%g6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xca
	set	0x25, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%g7
	nop
	set	0x28, %l5
	std	%f10,	[%l7 + %l5]
	set	0x38, %l4
	stba	%o4,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x70, %i4
	ldub	[%l7 + %i4],	%i0
	and	%l0,	%i1,	%g4
	set	0x79, %o4
	stba	%l4,	[%l7 + %o4] 0x81
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x89,	%o0
	set	0x6F, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o2
	nop
	set	0x47, %l2
	ldsb	[%l7 + %l2],	%o3
	wr	%i2,	%o5,	%pic
	ld	[%l7 + 0x68],	%f4
	nop
	set	0x5C, %g3
	lduw	[%l7 + %g3],	%l1
	set	0x30, %o5
	stha	%g1,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x23, %i0
	stba	%l6,	[%l7 + %i0] 0x89
	nop
	set	0x14, %g7
	ldsh	[%l7 + %g7],	%l2
	set	0x10, %o3
	swapa	[%l7 + %o3] 0x89,	%i7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	or	%l3,	%i5,	%o6
	nop
	set	0x7D, %l0
	ldsb	[%l7 + %l0],	%i3
	nop
	set	0x08, %i1
	stx	%i4,	[%l7 + %i1]
	nop
	set	0x29, %l1
	ldstub	[%l7 + %l1],	%i6
	set	0x1E, %o6
	stha	%o7,	[%l7 + %o6] 0x81
	st	%fsr,	[%l7 + 0x74]
	and	%g5,	%g2,	%g6
	or	%l5,	%g3,	%o0
	nop
	set	0x20, %o1
	ldsw	[%l7 + %o1],	%g7
	set	0x48, %g1
	stda	%o4,	[%l7 + %g1] 0x88
	nop
	set	0x1E, %o0
	sth	%l0,	[%l7 + %o0]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf8
	membar	#Sync
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%i0
	set	0x40, %l3
	lda	[%l7 + %l3] 0x88,	%f11
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%l4
	nop
	set	0x7F, %g4
	ldub	[%l7 + %g4],	%o1
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x81,	%o2
	nop
	set	0x48, %o7
	stx	%o3,	[%l7 + %o7]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x88
	nop
	set	0x68, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x40, %g6
	stda	%i2,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x24, %l5
	stha	%o5,	[%l7 + %l5] 0x89
	set	0x74, %l4
	lda	[%l7 + %l4] 0x89,	%f23
	set	0x78, %i4
	sta	%f1,	[%l7 + %i4] 0x88
	nop
	set	0x09, %i5
	ldstub	[%l7 + %i5],	%i1
	set	0x74, %i7
	stwa	%g1,	[%l7 + %i7] 0x89
	or	%l6,	%l1,	%i7
	set	0x53, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l3
	add	%l2,	%i5,	%o6
	set	0x20, %l2
	stda	%i2,	[%l7 + %l2] 0x89
	nop
	set	0x3A, %o4
	sth	%i4,	[%l7 + %o4]
	wr	%o7,	%g5,	%ccr
	nop
	set	0x24, %g3
	sth	%g2,	[%l7 + %g3]
	nop
	set	0x32, %i0
	stb	%i6,	[%l7 + %i0]
	st	%f4,	[%l7 + 0x5C]
	set	0x3C, %o5
	stwa	%l5,	[%l7 + %o5] 0xe2
	membar	#Sync
	fpsub32s	%f1,	%f24,	%f14
	nop
	set	0x48, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%g6,	%o0,	%g7
	nop
	set	0x20, %g7
	sth	%g3,	[%l7 + %g7]
	nop
	set	0x2C, %i1
	ldsb	[%l7 + %i1],	%o4
	nop
	set	0x3E, %l1
	ldub	[%l7 + %l1],	%i0
	set	0x78, %o6
	stha	%l0,	[%l7 + %o6] 0x88
	ld	[%l7 + 0x2C],	%f4
	bleu,a,pn	%icc,	loop_193
	nop
	set	0x58, %o1
	ldsb	[%l7 + %o1],	%l4
	set	0x48, %l0
	lda	[%l7 + %l0] 0x81,	%f9
loop_193:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o2
	or	%o3,	%i2,	%o1
	ba,pn	%icc,	loop_194
	nop
	set	0x60, %o0
	stb	%o5,	[%l7 + %o0]
	and	%i1,	%l6,	%g1
	set	0x18, %i2
	stha	%i7,	[%l7 + %i2] 0xea
	membar	#Sync
loop_194:
	nop
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x81,	%l1
	nop
	set	0x6C, %i6
	prefetch	[%l7 + %i6],	 2
	add	%l3,	%i5,	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%o6
	nop
	set	0x5A, %l3
	sth	%i4,	[%l7 + %l3]
	nop
	set	0x28, %o2
	stw	%o7,	[%l7 + %o2]
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf9
	membar	#Sync
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f8
	set	0x56, %o7
	stba	%g5,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x08, %g6
	swap	[%l7 + %g6],	%g2
	nop
	set	0x58, %g2
	lduh	[%l7 + %g2],	%l5
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f0
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf9
	membar	#Sync
	nop
	set	0x64, %i5
	ldsb	[%l7 + %i5],	%i6
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 2
	set	, %i7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1275
!	Type a   	: 32
!	Type cti   	: 24
!	Type x   	: 517
!	Type f   	: 34
!	Type i   	: 118
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
.word 0x6EA5215E
.word 0xB9FF18A9
.word 0x60A6353F
.word 0xC7E0DE59
.word 0xE78B9ABE
.word 0x01F1B93F
.word 0x558B8798
.word 0xC6976654
.word 0x8AFE32AC
.word 0x05A3B012
.word 0x0C65BB95
.word 0xC451746F
.word 0x3B81AD0D
.word 0xEA7164CB
.word 0xB0D4740B
.word 0x59C8B12F
.word 0x5054E298
.word 0x08431EAA
.word 0x6D16E056
.word 0x4D4B54B9
.word 0xD8C7BD4E
.word 0xF3C7B46C
.word 0x28292C9D
.word 0xFA4FBC60
.word 0x1F1037CD
.word 0x93D921CC
.word 0x8513D480
.word 0x6C579C7C
.word 0xB906901F
.word 0xD4584339
.word 0x7E06ED07
.word 0x9CB5CC4D
.word 0x43D938AA
.word 0xDA046711
.word 0x9B93D920
.word 0x05988D8E
.word 0x25C1ADEB
.word 0x716AEB69
.word 0xCCFF2D17
.word 0xB6011854
.word 0xAE7F19DE
.word 0xAC8F5208
.word 0x055185F1
.word 0x3C4A3900
.word 0x9E4F5430
.word 0x6632567A
.word 0x6CDFA7ED
.word 0xFE22028F
.word 0x448C6AEA
.word 0x6409226B
.word 0xA3BDBCE8
.word 0xFF168812
.word 0xF4786146
.word 0x9232F232
.word 0xEA11970A
.word 0x28F7BC9B
.word 0xC0B07BD0
.word 0xDEB9C4A8
.word 0x32E28A17
.word 0x0CD7FD62
.word 0x26646041
.word 0x6B753403
.word 0x100EF8C5
.word 0xDF9359BD
!! thread 1 data, 64 words.
.word 0x4953F81D
.word 0x8451B14E
.word 0xED8CEAF3
.word 0x6A78CF38
.word 0x71E7B388
.word 0x37002669
.word 0x52EBCE2D
.word 0x77ABCB70
.word 0xDA0823CE
.word 0xCD0CCA3F
.word 0x762565F3
.word 0x431731FA
.word 0x4A5B6489
.word 0x4894BEC7
.word 0xA7408078
.word 0xF34EB526
.word 0x449F4725
.word 0x75591F48
.word 0x5275769B
.word 0x838FD02B
.word 0x3F93583F
.word 0x008B6BD6
.word 0x13201345
.word 0xB74D61F8
.word 0xEFFCA6E3
.word 0x4906EE19
.word 0x9F511F4A
.word 0x33048462
.word 0x81AA8FFC
.word 0x6D6FB0D4
.word 0xF5AA6CC6
.word 0x22F875CD
.word 0x9434E708
.word 0x4BA60BC4
.word 0xF09A6EA4
.word 0x92376FA2
.word 0x828FB70C
.word 0x3CA77256
.word 0x2E9ED201
.word 0xC820315A
.word 0x0446E6BE
.word 0xF5B4315C
.word 0x9968728E
.word 0x6B917D3C
.word 0x43A685C7
.word 0x0438DD51
.word 0xF1E2B98F
.word 0x6E7C5006
.word 0x9FA30427
.word 0x48855EA1
.word 0xD719EF5D
.word 0xB6554BDF
.word 0x22FC7B51
.word 0xE59A8351
.word 0x2ED74B6E
.word 0x51C9A3FA
.word 0x465547FB
.word 0x9D3BB0EA
.word 0x91A03ED3
.word 0xBF5649D1
.word 0x78BD185A
.word 0x17F768A6
.word 0x061249E0
.word 0x2670A3FC
!! thread 2 data, 64 words.
.word 0xA46638C3
.word 0x4D1CA6E8
.word 0x9265F5D8
.word 0x72099934
.word 0x0AF51C47
.word 0x0E765481
.word 0xD3B5B2D1
.word 0x64731CFE
.word 0x59EE0666
.word 0xA426D41E
.word 0x3A6D5DE6
.word 0x1CFD071D
.word 0x4ACF5073
.word 0xAD6CB560
.word 0xD7802E5A
.word 0x24D02783
.word 0xEECC5ED8
.word 0xF8B48158
.word 0xDFBE6A35
.word 0x24F60754
.word 0x73EE242F
.word 0x5769DE1C
.word 0x7F715340
.word 0x81E05FEE
.word 0xA2128DD1
.word 0x457FA2AB
.word 0x111E9E3E
.word 0x8A393CC0
.word 0x0365C5BB
.word 0x899F4357
.word 0xCC67EF1B
.word 0xE71D2F06
.word 0xFE878939
.word 0x3D5BE4C7
.word 0x0EB356F6
.word 0xEBBC9D35
.word 0x91927C2F
.word 0x451FB279
.word 0x3433D386
.word 0x1166AE6E
.word 0xAEF23D0F
.word 0x82945F31
.word 0xCD0E1523
.word 0xD468B57F
.word 0xE6DECF5A
.word 0xA0CE3F1D
.word 0xC7182F67
.word 0xACE063A2
.word 0x55E7C9DD
.word 0x75A5B287
.word 0xD7BCC351
.word 0x9684F9A4
.word 0x290882E6
.word 0x9621D502
.word 0x3A852EB7
.word 0x81BDAA27
.word 0x2E45791F
.word 0xF1A704D4
.word 0x5F637EBA
.word 0xC9E96345
.word 0x3B9E9239
.word 0x68FA0029
.word 0xCD918090
.word 0xFDA5345D
!! thread 3 data, 64 words.
.word 0xF2DCEBA7
.word 0x46E268A6
.word 0xAEEA2690
.word 0xA9C4E685
.word 0xE3B533E4
.word 0xF13E8EBF
.word 0xC7A4773E
.word 0x9BB988E0
.word 0xFCAA76D2
.word 0xD63DC59A
.word 0x2A69E233
.word 0x0EF47D20
.word 0xEC177305
.word 0x8AEE3300
.word 0x943DBAAF
.word 0x392AD09E
.word 0xB0ABC539
.word 0xDA6E5410
.word 0xD9A7EA7D
.word 0x9C1FACA8
.word 0x6C6225E6
.word 0x87F03DFC
.word 0x3A9FFA7A
.word 0xC8F0A8C6
.word 0x375DA0A2
.word 0x2E4427E1
.word 0x57812FEA
.word 0xE141849B
.word 0x72E1F217
.word 0xACC6EE21
.word 0x2324B095
.word 0x1530F9A8
.word 0x113F4B46
.word 0x395920AA
.word 0xCE8DF2B9
.word 0xC4581662
.word 0xA5FBA5AF
.word 0x87CE9FB6
.word 0xC73FDAD6
.word 0x514312B3
.word 0x6D07FEBD
.word 0x9EFCE095
.word 0x729F0F9E
.word 0x5D2E60E2
.word 0xFFB9770B
.word 0x50FE6F25
.word 0x0C719598
.word 0x2B7E7968
.word 0x2D4807FE
.word 0xD54C253A
.word 0xA64C9F54
.word 0xAA958EAF
.word 0x8A90B3ED
.word 0x75F89017
.word 0xA5DEB67C
.word 0xD232F8D6
.word 0x4CD4877A
.word 0x6C9F0864
.word 0xB25894AC
.word 0x179C3D82
.word 0x04721227
.word 0x050DBE56
.word 0xEB34EAAF
.word 0xFB638C41
!! thread 4 data, 64 words.
.word 0xCA051DE8
.word 0x89C34964
.word 0xA4B4403B
.word 0xAF874B16
.word 0x81F52BBA
.word 0xCF8FC08A
.word 0x1EF87083
.word 0x7341BF5E
.word 0x72B9BDF5
.word 0xE7CDC9D0
.word 0x93970E53
.word 0x1F6D5AE5
.word 0x98E3B993
.word 0x5A70F6AF
.word 0x21934917
.word 0x01890C21
.word 0xD3BE7BF3
.word 0xA066E350
.word 0x20B76FAB
.word 0x3CF6EE2F
.word 0x3EB6D7E8
.word 0x8A2A6140
.word 0x099BB28C
.word 0x9A0F9D45
.word 0x2FE38527
.word 0xFBC22630
.word 0xAFC6A9EC
.word 0xB9A07E60
.word 0x64B6083E
.word 0x65507046
.word 0x0D39E0A9
.word 0xC945AAA5
.word 0xBBF868C2
.word 0xA3D56B82
.word 0x529949E6
.word 0xF24890BC
.word 0x70A0BD29
.word 0x4F5F3BF0
.word 0x93AB3D40
.word 0x217C6377
.word 0x6E6B8CF7
.word 0xC84EEF89
.word 0xF4B21D64
.word 0x6B1F2FEF
.word 0xFE4E04B5
.word 0xBB9C8B1A
.word 0x292DFF94
.word 0x1A330888
.word 0x7A570B52
.word 0x0B8E6440
.word 0xCF26F7AF
.word 0x80309F93
.word 0xDB9A5EE0
.word 0x8E333E34
.word 0x6AF69CD5
.word 0x569A77D0
.word 0x0F2B3FD8
.word 0x7287956F
.word 0xA4E50F6D
.word 0x23187393
.word 0xED77F59E
.word 0x2FAC5841
.word 0xD3EB79AF
.word 0xA542F802
!! thread 5 data, 64 words.
.word 0x2F3B16F1
.word 0x0C34534D
.word 0xB70281F3
.word 0x26987BFC
.word 0xA20B44EE
.word 0xBDADF11A
.word 0x9E2C588A
.word 0x3E8992A0
.word 0x60DE96A2
.word 0x974CE295
.word 0xC79773F0
.word 0x99202C74
.word 0xC12BC9F5
.word 0xC16DDF9F
.word 0xB0DA4531
.word 0xD429B88D
.word 0xA70B405F
.word 0x170E2B24
.word 0xE10F645E
.word 0x07954CEE
.word 0xD1A987FB
.word 0x6B5ADC4E
.word 0xCC883268
.word 0xE8334C0B
.word 0x8F63B88D
.word 0x0A8D49A5
.word 0xEF489284
.word 0x31CDD78E
.word 0xE7371B55
.word 0x81013FC4
.word 0xDC1E2339
.word 0x9E2679A0
.word 0x3D3AA24B
.word 0xD3C3026A
.word 0x86D3D52D
.word 0xC28EEEC2
.word 0x81C8AAC7
.word 0xF0DA5282
.word 0x7B748DB7
.word 0xCCF607A0
.word 0x2A2DCD97
.word 0xCE42DE8F
.word 0x7DDEECD1
.word 0xFD19CC0B
.word 0x34E04F9A
.word 0x5DFA668B
.word 0x67A7A998
.word 0x8549F2BA
.word 0xDDFAB71B
.word 0x9F6B76FD
.word 0x3A1637BB
.word 0x0A816FB7
.word 0x120A8638
.word 0xEB74A566
.word 0xA8EE91D2
.word 0x83294C56
.word 0x2107E92C
.word 0x6C4D9B0A
.word 0xCD48BB09
.word 0xA154AF3C
.word 0x4F7AE0BD
.word 0x1E0D9FC8
.word 0xD8AA843C
.word 0x1EFF5E68
!! thread 6 data, 64 words.
.word 0x25A20DEC
.word 0xDBD89B4E
.word 0x2A76B05D
.word 0x2A6C06FB
.word 0x58968E15
.word 0xD0A33ED7
.word 0xF1B91FA6
.word 0x45871640
.word 0xD5E57325
.word 0x1DE90BE4
.word 0xE3E13477
.word 0x45C94A6F
.word 0x63E75027
.word 0xF63DB8AA
.word 0x9C654436
.word 0xCB18A6B6
.word 0xDCD160F5
.word 0x9A26CB32
.word 0x02194F1C
.word 0xAAE6F483
.word 0xCEB03499
.word 0x3ABB9DAB
.word 0xE2772FA0
.word 0x127E30E4
.word 0x2307F4D9
.word 0x6C17055B
.word 0x9B2F59FB
.word 0xCFF37018
.word 0xDC1DCBE5
.word 0x81A4F536
.word 0xAB39921F
.word 0x7C25106C
.word 0x503F3304
.word 0x6B9546F9
.word 0xE073C785
.word 0x8BBE3758
.word 0x0ADDB2DB
.word 0xC87EB3C1
.word 0x4A84AE3E
.word 0x66682754
.word 0x7440B0B6
.word 0x33AB7C08
.word 0x606D78AA
.word 0x06651EF2
.word 0x018F0BBD
.word 0x10AA9686
.word 0xD1121A28
.word 0xB43E33CC
.word 0x433A9A79
.word 0x6391F238
.word 0x3A1E2B7E
.word 0xC4E988CA
.word 0x175EFBE0
.word 0xAAC1A387
.word 0xA7B56CFD
.word 0xD399D8B0
.word 0x5278E9FB
.word 0x3820212F
.word 0xF57D1A64
.word 0x6C5F9080
.word 0xBB996BE4
.word 0x8BCD2F1C
.word 0x523007B9
.word 0x192B9042
!! thread 7 data, 64 words.
.word 0x7BF25F5E
.word 0x9623148E
.word 0xA4D29F29
.word 0x01668A06
.word 0x7441209D
.word 0x3B0B5AD9
.word 0x01DA3DFF
.word 0xFB663EB9
.word 0x005642C4
.word 0xB040DF75
.word 0xD9899A6F
.word 0xE8E8618C
.word 0xD8D0CB9A
.word 0x64E083DE
.word 0xE3366660
.word 0x42F58951
.word 0x284E12E6
.word 0x9D817A3E
.word 0xD65C7BC9
.word 0xC772929A
.word 0xD3BEEA92
.word 0x36470972
.word 0xCD26D019
.word 0xAAFB7479
.word 0x07391671
.word 0x7780D6F5
.word 0x40281425
.word 0x8CAF81F0
.word 0x9258356C
.word 0x51E2373A
.word 0x2B903E8E
.word 0xA7D31A9E
.word 0x9AA54623
.word 0xF1FBD2D5
.word 0x5DB5D7AE
.word 0x80BA0D64
.word 0xE033F356
.word 0x766FF078
.word 0xAA59617C
.word 0x1F228B4B
.word 0xD341362B
.word 0xCF29F5D9
.word 0xBE2BE1B2
.word 0x096F1A44
.word 0x381CD776
.word 0xCC46FCF3
.word 0x4938C39F
.word 0xC880112C
.word 0x1CFF85FA
.word 0x1F20ABA3
.word 0xDD32E925
.word 0x15C9D257
.word 0x9A6BFED4
.word 0x463589D1
.word 0x1BCDDEDC
.word 0xB1F33BBC
.word 0xBDA9EDD5
.word 0xDA3DCC20
.word 0x12DD60BA
.word 0xAE17152D
.word 0x3504511B
.word 0x8FC4942E
.word 0x0CC569A6
.word 0x000017C1
.end
