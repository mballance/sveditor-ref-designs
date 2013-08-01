/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc3.s
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
	set	0x6,	%g1
	set	0x7,	%g2
	set	0xC,	%g3
	set	0x9,	%g4
	set	0x6,	%g5
	set	0x2,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xA,	%i1
	set	-0xD,	%i2
	set	-0x4,	%i3
	set	-0x4,	%i4
	set	-0x5,	%i5
	set	-0x1,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x344F4E29,	%l0
	set	0x03AFE9B0,	%l1
	set	0x0380CDA2,	%l2
	set	0x4AE39CFF,	%l3
	set	0x729C6F08,	%l4
	set	0x5FFB1F9C,	%l5
	set	0x58BE83DD,	%l6
	!# Output registers
	set	0x1F13,	%o0
	set	-0x1C7F,	%o1
	set	0x17DA,	%o2
	set	0x0D75,	%o3
	set	-0x1B9D,	%o4
	set	-0x04EA,	%o5
	set	-0x0EBF,	%o6
	set	-0x0C00,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	and	%i7,	%l0,	%g4
	set	0x79, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o6
	nop
	set	0x36, %i6
	ldstub	[%l7 + %i6],	%g7
	set	0x1A, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i1
	and	%o7,	%l4,	%i3
	nop
	set	0x67, %o2
	ldstub	[%l7 + %o2],	%g1
	fpsub16	%f22,	%f22,	%f2
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f8
	nop
	set	0x09, %l2
	stb	%o2,	[%l7 + %l2]
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	set	0x10, %i2
	stda	%o4,	[%l7 + %i2] 0x89
	or	%l6,	%i5,	%i2
	set	0x70, %o1
	sta	%f19,	[%l7 + %o1] 0x88
	nop
	set	0x6E, %o5
	ldstub	[%l7 + %o5],	%l1
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	nop
	set	0x50, %l4
	stx	%i4,	[%l7 + %l4]
	nop
	set	0x28, %g1
	ldub	[%l7 + %g1],	%l5
	or	%g2,	%l2,	%g6
	set	0x14, %l1
	stwa	%l3,	[%l7 + %l1] 0x88
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x89,	%i6
	st	%f1,	[%l7 + 0x08]
	ld	[%l7 + 0x68],	%f1
	fpadd32s	%f6,	%f8,	%f8
	nop
	set	0x62, %g5
	lduh	[%l7 + %g5],	%o5
	set	0x40, %g3
	stha	%i0,	[%l7 + %g3] 0x89
	set	0x42, %l0
	stba	%g5,	[%l7 + %l0] 0xe2
	membar	#Sync
	wr	%o1,	%i7,	%clear_softint
	nop
	set	0x53, %o0
	stb	%o3,	[%l7 + %o0]
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x80,	%l0
	nop
	set	0x46, %g6
	stb	%o6,	[%l7 + %g6]
	set	0x24, %i1
	stwa	%g4,	[%l7 + %i1] 0x80
	add	%g7,	%i1,	%o7
	or	%l4,	%i3,	%g1
	nop
	set	0x78, %o3
	ldsh	[%l7 + %o3],	%o2
	nop
	set	0x28, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x68, %g4
	lda	[%l7 + %g4] 0x89,	%f3
	ble	%xcc,	loop_1
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%g3
	nop
	set	0x24, %i3
	stw	%l6,	[%l7 + %i3]
	nop
	set	0x64, %i4
	lduw	[%l7 + %i4],	%i5
loop_1:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%i2
	nop
	set	0x68, %l6
	std	%f14,	[%l7 + %l6]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x88
	nop
	set	0x78, %i6
	stx	%o0,	[%l7 + %i6]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe3,	%i4
	set	0x3F, %o4
	stba	%l1,	[%l7 + %o4] 0xea
	membar	#Sync
	bn,a,pn	%icc,	loop_2
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%l4
	fpsub16s	%f31,	%f30,	%f8
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%l2
loop_2:
	nop
	set	0x3C, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x89,	%g6
	nop
	set	0x28, %o6
	ldsb	[%l7 + %o6],	%i6
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%l3
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%i0
	set	0x64, %o5
	swapa	[%l7 + %o5] 0x88,	%g5
	set	0x28, %l4
	stda	%o4,	[%l7 + %l4] 0x88
	nop
	set	0x20, %i0
	ldsb	[%l7 + %i0],	%i7
	fpadd16	%f18,	%f18,	%f16
	nop
	set	0x61, %l1
	ldstub	[%l7 + %l1],	%o1
	nop
	set	0x43, %g1
	ldub	[%l7 + %g1],	%l0
	ld	[%l7 + 0x0C],	%f3
	nop
	set	0x52, %g5
	lduh	[%l7 + %g5],	%o3
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%f14
	nop
	set	0x30, %g3
	prefetch	[%l7 + %g3],	 4
	st	%fsr,	[%l7 + 0x4C]
	wr	%o6,	%g4,	%ccr
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x89,	%g7
	set	0x38, %o7
	sta	%f13,	[%l7 + %o7] 0x88
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%o7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x88
	nop
	set	0x50, %i1
	stw	%g1,	[%l7 + %i1]
	nop
	set	0x10, %l0
	lduw	[%l7 + %l0],	%o2
	nop
	set	0x48, %o3
	ldsh	[%l7 + %o3],	%l6
	nop
	set	0x48, %g7
	sth	%g3,	[%l7 + %g7]
	add	%o4,	%i5,	%i2
	set	0x10, %l5
	swapa	[%l7 + %l5] 0x80,	%i4
	add	%o0,	%l1,	%l5
	fpadd16	%f28,	%f8,	%f8
	nop
	set	0x6C, %i3
	lduw	[%l7 + %i3],	%g2
	add	%l2,	%i6,	%l3
	nop
	set	0x20, %g4
	ldx	[%l7 + %g4],	%g6
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f12
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%i0
	nop
	set	0x50, %i5
	stx	%o5,	[%l7 + %i5]
	nop
	set	0x14, %i6
	lduw	[%l7 + %i6],	%i7
	bl,a	%xcc,	loop_3
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%l0
	set	0x6C, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o1
loop_3:
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	wr	%o3,	%o6,	%sys_tick
	nop
	set	0x3C, %g2
	ldsh	[%l7 + %g2],	%g4
	nop
	set	0x3B, %o2
	stb	%g7,	[%l7 + %o2]
	nop
	set	0x6A, %o6
	lduh	[%l7 + %o6],	%o7
	nop
	set	0x7A, %l2
	ldstub	[%l7 + %l2],	%l4
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%i3
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%g0
	nop
	set	0x44, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x28, %l4
	stda	%o2,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x30, %i0
	stda	%i6,	[%l7 + %i0] 0x81
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f16
	nop
	set	0x50, %g5
	stw	%i1,	[%l7 + %g5]
	and	%o4,	%g3,	%i5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f0
	or	%i4,	%i2,	%l1
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xcc
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%o0
	set	0x40, %l1
	stwa	%l5,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x40, %o7
	stha	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%i6
	or	%g6,	%l3,	%i0
	add	%o5,	%i7,	%l0
	st	%f12,	[%l7 + 0x6C]
	nop
	set	0x08, %g6
	sth	%g5,	[%l7 + %g6]
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%o3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	add	%o6,	%g4,	%o1
	nop
	set	0x38, %o3
	std	%g6,	[%l7 + %o3]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xeb,	%o6
	fpsub16	%f24,	%f22,	%f0
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%l4
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xda
	wr	%g1,	%i3,	%softint
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x81,	%o2
	set	0x7C, %i6
	stwa	%i1,	[%l7 + %i6] 0x88
	nop
	set	0x68, %l3
	swap	[%l7 + %l3],	%l6
	nop
	set	0x53, %l6
	stb	%o4,	[%l7 + %l6]
	set	0x78, %g4
	stba	%i5,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x4C, %o4
	lduh	[%l7 + %o4],	%g3
	nop
	set	0x6E, %o2
	lduh	[%l7 + %o2],	%i2
	or	%i4,	%o0,	%l5
	nop
	set	0x30, %o6
	swap	[%l7 + %o6],	%l2
	set	0x6C, %g2
	stha	%g2,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x6C, %i2
	prefetch	[%l7 + %i2],	 0
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc0
	or	%l1,	%i6,	%l3
	set	0x71, %l2
	stba	%g6,	[%l7 + %l2] 0x88
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
	nop
	set	0x62, %i0
	sth	%o5,	[%l7 + %i0]
	set	0x20, %g1
	stda	%i0,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x74, %g5
	lduh	[%l7 + %g5],	%i7
	or	%g5,	%l0,	%o6
	set	0x50, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x89
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x80,	%o1
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 2
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	add	%g7,	%o7,	%o3
	set	0x18, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l4
	nop
	set	0x0C, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x58, %l0
	std	%g0,	[%l7 + %l0]
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x80,	%o2
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%i1
	set	0x34, %o3
	sta	%f25,	[%l7 + %o3] 0x89
	set	0x48, %l5
	lda	[%l7 + %l5] 0x81,	%f27
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%l6
	and	%i3,	%i5,	%o4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%g2
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%o0
	set	0x74, %i5
	lda	[%l7 + %i5] 0x80,	%f16
	nop
	set	0x78, %i6
	std	%i2,	[%l7 + %i6]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%l2
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xeb,	%l4
	nop
	set	0x24, %l3
	ldsw	[%l7 + %l3],	%g2
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%l1
	nop
	set	0x58, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x14, %o6
	lduh	[%l7 + %o6],	%i6
	nop
	set	0x68, %g2
	sth	%l3,	[%l7 + %g2]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xeb,	%o4
	nop
	set	0x50, %l2
	std	%f18,	[%l7 + %l2]
	set	0x12, %o1
	stba	%i0,	[%l7 + %o1] 0x81
	set	0x44, %l4
	lda	[%l7 + %l4] 0x80,	%f4
	nop
	set	0x5C, %i0
	stb	%g6,	[%l7 + %i0]
	nop
	set	0x48, %g1
	stb	%g5,	[%l7 + %g1]
	nop
	set	0x34, %i7
	swap	[%l7 + %i7],	%l0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf1
	membar	#Sync
	nop
	set	0x10, %g3
	ldstub	[%l7 + %g3],	%o6
	add	%i7,	%g4,	%o1
	or	%g7,	%o7,	%l4
	nop
	set	0x78, %o0
	ldx	[%l7 + %o0],	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%o3
	or	%l6,	%i1,	%i5
	nop
	set	0x70, %o5
	std	%f26,	[%l7 + %o5]
	set	0x48, %g6
	sta	%f13,	[%l7 + %g6] 0x81
	set	0x7C, %o7
	sta	%f3,	[%l7 + %o7] 0x89
	set	0x30, %l1
	ldxa	[%l7 + %l1] 0x89,	%i3
	fpsub32s	%f14,	%f10,	%f7
	nop
	set	0x2C, %i1
	stw	%g3,	[%l7 + %i1]
	set	0x20, %l0
	stxa	%i4,	[%l7 + %l0] 0x81
	nop
	set	0x50, %o3
	stb	%o0,	[%l7 + %o3]
	nop
	set	0x08, %l5
	sth	%i2,	[%l7 + %l5]
	nop
	set	0x60, %i3
	stx	%o4,	[%l7 + %i3]
	add	%l5,	%g2,	%l1
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x88,	%f7
	nop
	set	0x18, %i5
	stw	%l2,	[%l7 + %i5]
	nop
	set	0x32, %i4
	sth	%l3,	[%l7 + %i4]
	nop
	set	0x10, %i6
	std	%f18,	[%l7 + %i6]
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%i6
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%o5
	nop
	set	0x60, %o2
	prefetch	[%l7 + %o2],	 2
	nop
	set	0x3C, %o4
	sth	%g6,	[%l7 + %o4]
	or	%g5,	%i0,	%l0
	nop
	set	0x78, %l3
	std	%i6,	[%l7 + %l3]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd8,	%f0
	set	0x34, %i2
	stwa	%g4,	[%l7 + %i2] 0xe3
	membar	#Sync
	or	%o1,	%g7,	%o7
	fpsub16s	%f8,	%f27,	%f1
	fpsub16	%f10,	%f24,	%f6
	nop
	set	0x30, %g2
	swap	[%l7 + %g2],	%o6
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%o3
	nop
	set	0x22, %l4
	sth	%g1,	[%l7 + %l4]
	set	0x37, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i1
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%i6
	and	%i3,	%i5,	%g3
	nop
	set	0x1C, %i7
	ldsw	[%l7 + %i7],	%i4
	nop
	set	0x23, %g5
	stb	%o0,	[%l7 + %g5]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f0
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%i2
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x81,	%l5
	be,a	%icc,	loop_4
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f12
	set	0x12, %o7
	stha	%g2,	[%l7 + %o7] 0x89
loop_4:
	nop
	set	0x67, %l1
	stba	%o4,	[%l7 + %l1] 0x80
	or	%l2,	%l3,	%l1
	nop
	set	0x58, %o5
	stx	%i6,	[%l7 + %o5]
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f16
	or	%g6,	%g5,	%i0
	add	%o5,	%l0,	%g4
	ld	[%l7 + 0x54],	%f26
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f0
	nop
	set	0x08, %l0
	lduh	[%l7 + %l0],	%i7
	st	%f23,	[%l7 + 0x74]
	set	0x7C, %i3
	stha	%g7,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x2C, %l5
	stwa	%o7,	[%l7 + %l5] 0x81
	nop
	set	0x4E, %g7
	ldub	[%l7 + %g7],	%o6
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%l4
	fpsub32	%f20,	%f28,	%f12
	nop
	set	0x5F, %i4
	ldub	[%l7 + %i4],	%o1
	nop
	set	0x55, %i6
	ldsb	[%l7 + %i6],	%o2
	set	0x15, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g1
	add	%i1,	%l6,	%o3
	nop
	set	0x62, %l6
	lduh	[%l7 + %l6],	%i5
	set	0x50, %o2
	swapa	[%l7 + %o2] 0x89,	%g3
	nop
	set	0x7A, %o4
	sth	%i4,	[%l7 + %o4]
	nop
	set	0x10, %o6
	sth	%i3,	[%l7 + %o6]
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe3,	%i2
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x80,	%o0
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%l4
	fpadd16s	%f21,	%f13,	%f6
	st	%f30,	[%l7 + 0x38]
	or	%g2,	%l2,	%l3
	nop
	set	0x56, %g2
	ldub	[%l7 + %g2],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g6
	nop
	set	0x21, %l4
	ldub	[%l7 + %l4],	%g5
	and	%i0,	%o5,	%l0
	nop
	set	0x18, %g1
	std	%g4,	[%l7 + %g1]
	or	%i7,	%l1,	%g7
	set	0x4C, %i7
	ldstuba	[%l7 + %i7] 0x88,	%o7
	nop
	set	0x5C, %i0
	lduw	[%l7 + %i0],	%o6
	fpsub16s	%f26,	%f18,	%f14
	set	0x58, %g5
	stda	%o0,	[%l7 + %g5] 0x89
	wr	%o2,	%g1,	%sys_tick
	ld	[%l7 + 0x10],	%f26
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x10, %g3
	stx	%l4,	[%l7 + %g3]
	set	0x08, %o0
	stwa	%l6,	[%l7 + %o0] 0xeb
	membar	#Sync
	st	%f28,	[%l7 + 0x30]
	nop
	set	0x10, %g6
	std	%f10,	[%l7 + %g6]
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%i1
	nop
	set	0x13, %l1
	ldstub	[%l7 + %l1],	%o3
	st	%fsr,	[%l7 + 0x14]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x78, %l2
	std	%f30,	[%l7 + %l2]
	nop
	set	0x48, %o5
	prefetch	[%l7 + %o5],	 1
	and	%i5,	%i4,	%i3
	fpadd16	%f30,	%f20,	%f12
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f10
	nop
	set	0x48, %l0
	stw	%i2,	[%l7 + %l0]
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x88,	%g3
	nop
	set	0x24, %i1
	swap	[%l7 + %i1],	%o0
	set	0x7A, %g7
	stha	%g2,	[%l7 + %g7] 0x89
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%l5
	wr 	%g0, 	0x5, 	%fprs
	set	0x50, %l5
	stda	%i6,	[%l7 + %l5] 0x89
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%g6
	nop
	set	0x18, %g4
	std	%i0,	[%l7 + %g4]
	nop
	set	0x64, %l6
	lduw	[%l7 + %l6],	%g5
	bne,a,pt	%icc,	loop_5
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%o4
	set	0x7B, %i6
	stba	%l0,	[%l7 + %i6] 0xeb
	membar	#Sync
loop_5:
	and	%i7,	%g4,	%l1
	nop
	set	0x14, %o4
	stw	%o7,	[%l7 + %o4]
	wr	%g7,	%o6,	%set_softint
	set	0x5F, %o6
	stba	%o1,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x0C, %i2
	lda	[%l7 + %i2] 0x89,	%f25
	set	0x69, %l3
	ldstuba	[%l7 + %l3] 0x81,	%g1
	wr	%o2,	%l4,	%sys_tick
	set	0x18, %g2
	stda	%i0,	[%l7 + %g2] 0x80
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf9,	%f0
	set	0x20, %i7
	stda	%i6,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%i3
	st	%f23,	[%l7 + 0x14]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%g3
	add	%i2,	%g2,	%l5
	nop
	set	0x50, %g1
	lduw	[%l7 + %g1],	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%o0
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%l3
	fpadd32	%f24,	%f22,	%f18
	nop
	set	0x7C, %o0
	sth	%i6,	[%l7 + %o0]
	set	0x70, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g6
	ba	%xcc,	loop_6
	and	%i0,	%g5,	%o5
	and	%i7,	%l0,	%g4
	set	0x40, %g5
	stda	%l0,	[%l7 + %g5] 0x81
loop_6:
	nop
	set	0x61, %o7
	ldstub	[%l7 + %o7],	%g7
	nop
	set	0x54, %l1
	prefetch	[%l7 + %l1],	 1
	nop
	set	0x24, %l2
	ldsw	[%l7 + %l2],	%o6
	nop
	set	0x7A, %o5
	stb	%o1,	[%l7 + %o5]
	set	0x10, %l0
	lda	[%l7 + %l0] 0x88,	%f6
	set	0x0C, %i3
	stwa	%g1,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x40, %i1
	sta	%f10,	[%l7 + %i1] 0x89
	nop
	set	0x2C, %o3
	swap	[%l7 + %o3],	%o7
	nop
	set	0x58, %i5
	swap	[%l7 + %i5],	%l4
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%o2
	st	%f17,	[%l7 + 0x54]
	set	0x48, %i4
	sta	%f16,	[%l7 + %i4] 0x89
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x81,	%l6
	nop
	set	0x7E, %l5
	lduh	[%l7 + %l5],	%i4
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x81,	%i3
	nop
	set	0x54, %o2
	stw	%o3,	[%l7 + %o2]
	nop
	set	0x10, %i6
	swap	[%l7 + %i6],	%g3
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f30
	ld	[%l7 + 0x48],	%f26
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%i4
	set	0x13, %i2
	ldstuba	[%l7 + %i2] 0x81,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%l2
	set	0x20, %l3
	stda	%i2,	[%l7 + %l3] 0x80
	nop
	set	0x10, %g2
	std	%f4,	[%l7 + %g2]
	nop
	set	0x68, %l4
	lduw	[%l7 + %l4],	%o0
	ld	[%l7 + 0x34],	%f7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%i6
	nop
	set	0x3C, %o1
	ldsh	[%l7 + %o1],	%o4
	set	0x76, %i7
	stha	%i0,	[%l7 + %i7] 0x80
	nop
	set	0x38, %i0
	std	%g4,	[%l7 + %i0]
	nop
	set	0x10, %g1
	ldsh	[%l7 + %g1],	%g6
	set	0x40, %g3
	stwa	%o5,	[%l7 + %g3] 0x80
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x88,	%l0
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f6
	nop
	set	0x58, %g5
	swap	[%l7 + %g5],	%i7
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x89,	%g4
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%g7
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x89,	 2
	nop
	set	0x30, %l1
	lduw	[%l7 + %l1],	%o6
	and	%g1,	%o1,	%l4
	set	0x10, %l0
	stwa	%i1,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f0
	set	0x78, %i3
	stxa	%o2,	[%l7 + %i3] 0x80
	st	%fsr,	[%l7 + 0x40]
	set	0x34, %i1
	lda	[%l7 + %i1] 0x80,	%f26
	set	0x5C, %o3
	sta	%f22,	[%l7 + %o3] 0x89
	set	0x26, %i4
	stha	%l6,	[%l7 + %i4] 0x89
	st	%f2,	[%l7 + 0x28]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i4
	nop
	set	0x45, %i5
	ldub	[%l7 + %i5],	%i3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc2
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%o3
	nop
	set	0x74, %o2
	lduh	[%l7 + %o2],	%i5
	nop
	set	0x6A, %l6
	stb	%g2,	[%l7 + %l6]
	set	0x0C, %g4
	lda	[%l7 + %g4] 0x80,	%f28
	nop
	set	0x61, %o4
	ldub	[%l7 + %o4],	%l5
	ld	[%l7 + 0x3C],	%f0
	nop
	set	0x28, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x23, %i2
	stba	%l2,	[%l7 + %i2] 0x80
	set	0x40, %g2
	sta	%f10,	[%l7 + %g2] 0x81
	nop
	set	0x20, %l3
	swap	[%l7 + %l3],	%i2
	set	0x1C, %o1
	stba	%o0,	[%l7 + %o1] 0x80
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	set	0x10, %i7
	ldxa	[%l7 + %i7] 0x88,	%l3
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd0
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f16
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%g3
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	st	%f25,	[%l7 + 0x20]
	nop
	set	0x78, %g5
	std	%o4,	[%l7 + %g5]
	nop
	nop
	setx	0x6E251515,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xF8E8E887,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f26,	%f27
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf8
	membar	#Sync
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%i0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f0
	nop
	set	0x50, %o6
	ldub	[%l7 + %o6],	%o5
	ld	[%l7 + 0x44],	%f15
	st	%fsr,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%f29
	nop
	set	0x14, %l2
	ldub	[%l7 + %l2],	%l0
	nop
	set	0x52, %l0
	ldsb	[%l7 + %l0],	%g6
	nop
	set	0x3C, %l1
	swap	[%l7 + %l1],	%i7
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f16
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%g4
	set	0x25, %i1
	ldstuba	[%l7 + %i1] 0x88,	%l1
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f0
	nop
	set	0x32, %o3
	sth	%o6,	[%l7 + %o3]
	set	0x24, %i4
	sta	%f28,	[%l7 + %i4] 0x81
	or	%g1,	%o1,	%i1
	st	%f22,	[%l7 + 0x70]
	nop
	set	0x10, %i5
	lduh	[%l7 + %i5],	%l4
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x14, %l5
	lduw	[%l7 + %l5],	%o2
	nop
	set	0x78, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x21, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o7
	nop
	set	0x08, %g4
	ldsh	[%l7 + %g4],	%i4
	nop
	set	0x5C, %o4
	ldsh	[%l7 + %o4],	%l6
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x65, %i6
	stba	%l5,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x70, %i2
	std	%g2,	[%l7 + %i2]
	nop
	set	0x54, %l3
	ldsh	[%l7 + %l3],	%l2
	add	%o0,	%i2,	%l3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%i6
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%o4
	nop
	set	0x74, %o1
	ldsh	[%l7 + %o1],	%g5
	nop
	set	0x6A, %l4
	sth	%i0,	[%l7 + %l4]
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x88,	%l0
	st	%f7,	[%l7 + 0x1C]
	or	%g6,	%i7,	%o5
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	bgu,a,pn	%icc,	loop_7
	add	%g4,	%l1,	%g1
	nop
	set	0x70, %i0
	std	%f6,	[%l7 + %i0]
	st	%f19,	[%l7 + 0x60]
loop_7:
	fpadd32s	%f30,	%f23,	%f31
	set	0x24, %g3
	sta	%f19,	[%l7 + %g3] 0x89
	or	%o1,	%i1,	%l4
	set	0x5C, %o0
	stwa	%o6,	[%l7 + %o0] 0x81
	set	0x64, %g5
	stwa	%o2,	[%l7 + %g5] 0x81
	nop
	set	0x33, %o7
	ldstub	[%l7 + %o7],	%i4
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%o7
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x88,	%l6
	bl	%xcc,	loop_8
	nop
	set	0x36, %l1
	ldub	[%l7 + %l1],	%o3
	nop
	set	0x12, %l0
	lduh	[%l7 + %l0],	%i5
	nop
	set	0x10, %i3
	std	%l4,	[%l7 + %i3]
loop_8:
	nop
	set	0x37, %i1
	stba	%i3,	[%l7 + %i1] 0x80
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x80,	%g2
	nop
	set	0x10, %o5
	stx	%o0,	[%l7 + %o5]
	nop
	set	0x48, %i5
	lduh	[%l7 + %i5],	%i2
	nop
	set	0x37, %i4
	ldstub	[%l7 + %i4],	%l2
	or	%l3,	%i6,	%g3
	nop
	set	0x40, %g7
	std	%o4,	[%l7 + %g7]
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	set	0x20, %l5
	lduh	[%l7 + %l5],	%i0
	nop
	set	0x40, %g4
	stx	%l0,	[%l7 + %g4]
	ld	[%l7 + 0x1C],	%f22
	nop
	set	0x70, %o2
	sth	%g6,	[%l7 + %o2]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i7
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x80,	%g4
	ld	[%l7 + 0x78],	%f12
	nop
	set	0x1B, %i6
	stb	%l1,	[%l7 + %i6]
	set	0x59, %l3
	stba	%g7,	[%l7 + %l3] 0xea
	membar	#Sync
	or	%o1,	%g1,	%i1
	nop
	set	0x70, %i2
	ldsw	[%l7 + %i2],	%o6
	nop
	set	0x50, %g2
	swap	[%l7 + %g2],	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%i4
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%o6
	ble,a,pn	%xcc,	loop_9
	nop
	set	0x58, %i7
	std	%f0,	[%l7 + %i7]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc8
loop_9:
	nop
	set	0x54, %i0
	ldsw	[%l7 + %i0],	%l6
	nop
	set	0x5E, %g1
	lduh	[%l7 + %g1],	%o3
	nop
	set	0x38, %o0
	ldsh	[%l7 + %o0],	%i5
	nop
	set	0x40, %g3
	stw	%l5,	[%l7 + %g3]
	and	%g2,	%i3,	%o0
	set	0x34, %g5
	lda	[%l7 + %g5] 0x80,	%f11
	set	0x37, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i2
	nop
	set	0x74, %o7
	prefetch	[%l7 + %o7],	 0
	add	%l3,	%i6,	%g3
	nop
	set	0x7C, %l2
	lduw	[%l7 + %l2],	%o4
	and	%l2,	%g5,	%l0
	set	0x63, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i0
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	ld	[%l7 + 0x34],	%f25
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	nop
	set	0x48, %i3
	lduh	[%l7 + %i3],	%g6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f16
	nop
	set	0x16, %i5
	ldstub	[%l7 + %i5],	%i7
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x80,	 1
	nop
	set	0x78, %i4
	std	%f2,	[%l7 + %i4]
	nop
	set	0x66, %g7
	ldsb	[%l7 + %g7],	%l1
	nop
	set	0x28, %l6
	stx	%o1,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f0
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x1A, %o2
	ldstub	[%l7 + %o2],	%o6
	nop
	set	0x28, %l5
	stx	%l4,	[%l7 + %l5]
	set	0x3C, %o4
	sta	%f15,	[%l7 + %o4] 0x81
	and	%g7,	%i4,	%o2
	nop
	set	0x10, %l3
	sth	%o7,	[%l7 + %l3]
	add	%o3,	%l6,	%l5
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x80,	%i5
	nop
	set	0x58, %g2
	stx	%g2,	[%l7 + %g2]
	nop
	set	0x38, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i3
	nop
	set	0x38, %i7
	sth	%l3,	[%l7 + %i7]
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i2
	set	0x38, %i0
	ldxa	[%l7 + %i0] 0x89,	%g3
	or	%l2,	%g5,	%o4
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%i0
	nop
	set	0x40, %i2
	std	%f2,	[%l7 + %i2]
	nop
	set	0x10, %g3
	std	%f4,	[%l7 + %g3]
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%o5
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x89,	%l0
	ld	[%l7 + 0x34],	%f26
	set	0x10, %o7
	sta	%f12,	[%l7 + %o7] 0x81
	nop
	set	0x38, %l2
	std	%f12,	[%l7 + %l2]
	nop
	set	0x64, %o0
	swap	[%l7 + %o0],	%g6
	nop
	set	0x08, %g6
	sth	%i7,	[%l7 + %g6]
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%l1
	set	0x6E, %i3
	stha	%o1,	[%l7 + %i3] 0xe2
	membar	#Sync
	wr	%g1,	%g4,	%pic
	nop
	set	0x28, %o3
	swap	[%l7 + %o3],	%i1
	nop
	set	0x7C, %l0
	prefetch	[%l7 + %l0],	 3
	nop
	set	0x48, %i1
	stx	%fsr,	[%l7 + %i1]
	wr	%o6,	%g7,	%clear_softint
	set	0x20, %i5
	lda	[%l7 + %i5] 0x80,	%f8
	st	%fsr,	[%l7 + 0x14]
	set	0x60, %i4
	stwa	%l4,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x70, %o5
	swap	[%l7 + %o5],	%o2
	set	0x14, %g7
	stha	%i4,	[%l7 + %g7] 0x88
	nop
	set	0x3C, %g4
	lduh	[%l7 + %g4],	%o7
	set	0x30, %o2
	stwa	%l6,	[%l7 + %o2] 0x89
	set	0x20, %l5
	stwa	%o3,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 1
	set	0x4C, %l6
	stba	%i5,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x28, %l3
	ldub	[%l7 + %l3],	%l5
	or	%o0,	%g2,	%i3
	set	0x38, %g2
	stxa	%l3,	[%l7 + %g2] 0x88
	nop
	set	0x08, %i6
	stw	%i2,	[%l7 + %i6]
	set	0x18, %l4
	swapa	[%l7 + %l4] 0x81,	%i6
	nop
	set	0x70, %o1
	std	%f24,	[%l7 + %o1]
	and	%l2,	%g5,	%g3
	nop
	set	0x10, %i7
	sth	%o4,	[%l7 + %i7]
	nop
	set	0x70, %i0
	std	%f8,	[%l7 + %i0]
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%l0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l1
	and	%g6,	%g1,	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%g4
	nop
	set	0x3C, %g3
	prefetch	[%l7 + %g3],	 2
	ld	[%l7 + 0x2C],	%f31
	set	0x0C, %g1
	swapa	[%l7 + %g1] 0x89,	%g7
	nop
	set	0x52, %g5
	lduh	[%l7 + %g5],	%l4
	nop
	set	0x50, %o6
	ldsw	[%l7 + %o6],	%o2
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%o6
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	add	%o7,	%i4,	%o3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 1
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x89,	%i4
	nop
	set	0x7A, %o3
	lduh	[%l7 + %o3],	%l6
	set	0x70, %i3
	lda	[%l7 + %i3] 0x81,	%f28
	nop
	set	0x70, %l0
	ldsh	[%l7 + %l0],	%o0
	nop
	set	0x64, %i5
	ldsh	[%l7 + %i5],	%g2
	set	0x60, %i1
	sta	%f22,	[%l7 + %i1] 0x88
	and	%l5,	%l3,	%i2
	set	0x58, %o5
	stda	%i6,	[%l7 + %o5] 0x81
	set	0x24, %i4
	stwa	%l2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x70, %g7
	stx	%g5,	[%l7 + %g7]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%g3
	set	0x7C, %o2
	stwa	%o4,	[%l7 + %o2] 0x81
	nop
	set	0x74, %l5
	lduw	[%l7 + %l5],	%i0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xeb,	%l0
	set	0x2E, %l6
	stba	%i7,	[%l7 + %l6] 0x81
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%o4
	nop
	set	0x18, %g2
	swap	[%l7 + %g2],	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%o1
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%i1
	nop
	set	0x14, %l3
	swap	[%l7 + %l3],	%l1
	nop
	set	0x60, %o1
	stw	%g4,	[%l7 + %o1]
	set	0x70, %l4
	lda	[%l7 + %l4] 0x81,	%f28
	set	0x51, %i7
	stba	%g7,	[%l7 + %i7] 0x81
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	ld	[%l7 + 0x4C],	%f2
	st	%f31,	[%l7 + 0x44]
	add	%o6,	%o7,	%i4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x88
	nop
	set	0x4A, %g1
	sth	%o2,	[%l7 + %g1]
	set	0x4E, %g5
	stha	%o3,	[%l7 + %g5] 0x80
	add	%l6,	%i5,	%o0
	nop
	set	0x7D, %o6
	ldub	[%l7 + %o6],	%l5
	nop
	set	0x2C, %g3
	sth	%l3,	[%l7 + %g3]
	set	0x17, %o7
	ldstuba	[%l7 + %o7] 0x89,	%g2
	set	0x7C, %l2
	stwa	%i6,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x70, %g6
	stda	%l2,	[%l7 + %g6] 0x81
	and	%i2,	%g5,	%i3
	ld	[%l7 + 0x0C],	%f26
	wr	%o4,	%g3,	%sys_tick
	nop
	set	0x40, %o0
	sth	%l0,	[%l7 + %o0]
	set	0x4A, %o3
	stha	%i0,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x58, %i3
	stha	%o5,	[%l7 + %i3] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x58]
	set	0x70, %l1
	stda	%g6,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x44, %l0
	ldub	[%l7 + %l0],	%i7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe2,	%g0
	ld	[%l7 + 0x2C],	%f0
	nop
	set	0x60, %i1
	std	%f10,	[%l7 + %i1]
	bn,pn	%xcc,	loop_10
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%i1
	set	0x08, %g7
	stxa	%l1,	[%l7 + %g7] 0x88
loop_10:
	nop
	set	0x2A, %o2
	stha	%o1,	[%l7 + %o2] 0xe3
	membar	#Sync
	or	%g7,	%l4,	%o6
	nop
	set	0x68, %o5
	lduh	[%l7 + %o5],	%g4
	st	%f31,	[%l7 + 0x34]
	nop
	nop
	setx	0x49B560D9C97F6BA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x5013D403F51B9A05,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f26
	set	0x18, %g4
	stxa	%o7,	[%l7 + %g4] 0xe3
	membar	#Sync
	st	%f21,	[%l7 + 0x44]
	nop
	set	0x4E, %l6
	stb	%i4,	[%l7 + %l6]
	nop
	set	0x78, %l5
	swap	[%l7 + %l5],	%o2
	set	0x38, %g2
	stxa	%o3,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f14
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x40, %o4
	std	%f10,	[%l7 + %o4]
	set	0x64, %o1
	stwa	%i5,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x41, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o0
	set	0x18, %l3
	stda	%l4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x10, %i2
	lduw	[%l7 + %i2],	%l6
	ld	[%l7 + 0x4C],	%f4
	set	0x58, %i0
	sta	%f16,	[%l7 + %i0] 0x81
	nop
	set	0x10, %g1
	stw	%l3,	[%l7 + %g1]
	nop
	set	0x50, %i7
	ldsw	[%l7 + %i7],	%i6
	nop
	set	0x1E, %g5
	ldsh	[%l7 + %g5],	%g2
	nop
	set	0x2F, %o6
	ldstub	[%l7 + %o6],	%i2
	set	0x10, %o7
	stwa	%g5,	[%l7 + %o7] 0x89
	nop
	set	0x48, %l2
	lduw	[%l7 + %l2],	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%g3
	nop
	set	0x70, %g3
	std	%l0,	[%l7 + %g3]
	wr	%i0,	%l2,	%sys_tick
	set	0x4C, %g6
	ldstuba	[%l7 + %g6] 0x89,	%o5
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%i7
	st	%f7,	[%l7 + 0x54]
	nop
	set	0x08, %i3
	stx	%g1,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	set	0x5B, %l0
	stba	%i1,	[%l7 + %l0] 0x89
	set	0x6C, %l1
	lda	[%l7 + %l1] 0x80,	%f30
	or	%g6,	%o1,	%l1
	ld	[%l7 + 0x68],	%f16
	st	%f27,	[%l7 + 0x20]
	add	%l4,	%g7,	%o6
	set	0x50, %i1
	stda	%o6,	[%l7 + %i1] 0xe3
	membar	#Sync
	or	%g4,	%o2,	%o3
	st	%f11,	[%l7 + 0x54]
	set	0x0E, %i5
	stha	%i5,	[%l7 + %i5] 0x88
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x1C, %i4
	swap	[%l7 + %i4],	%o0
	nop
	set	0x60, %g7
	std	%f24,	[%l7 + %g7]
	and	%l5,	%i4,	%l3
	nop
	set	0x1C, %o2
	ldstub	[%l7 + %o2],	%l6
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x88,	%g2
	nop
	set	0x1C, %g4
	ldsw	[%l7 + %g4],	%i2
	nop
	set	0x44, %l6
	ldsw	[%l7 + %l6],	%g5
	nop
	set	0x58, %l5
	lduh	[%l7 + %l5],	%i3
	nop
	set	0x28, %i6
	stw	%o4,	[%l7 + %i6]
	set	0x7B, %o4
	stba	%g3,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x0C, %o1
	ldsh	[%l7 + %o1],	%l0
	nop
	set	0x20, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%l2
	nop
	set	0x68, %l4
	lduh	[%l7 + %l4],	%o5
	set	0x08, %i0
	ldxa	[%l7 + %i0] 0x89,	%i7
	set	0x6E, %i7
	stba	%i0,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x1C, %g5
	sth	%i1,	[%l7 + %g5]
	set	0x6C, %g1
	stwa	%g6,	[%l7 + %g1] 0x89
	st	%f13,	[%l7 + 0x40]
	nop
	set	0x14, %o7
	ldsw	[%l7 + %o7],	%g1
	set	0x34, %o6
	stha	%l1,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x56, %g3
	lduh	[%l7 + %g3],	%l4
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x89,	 4
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%o6
	nop
	set	0x50, %o3
	std	%f30,	[%l7 + %o3]
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x89,	 1
	nop
	set	0x2F, %l0
	stb	%g4,	[%l7 + %l0]
	set	0x74, %l1
	sta	%f27,	[%l7 + %l1] 0x81
	bleu	%icc,	loop_11
	nop
	set	0x60, %o0
	std	%f0,	[%l7 + %o0]
	nop
	set	0x62, %i1
	ldsh	[%l7 + %i1],	%o7
	nop
	set	0x3C, %i4
	stb	%o3,	[%l7 + %i4]
loop_11:
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x6C, %g7
	sth	%o2,	[%l7 + %g7]
	nop
	set	0x1C, %o2
	stw	%i5,	[%l7 + %o2]
	add	%l5,	%i4,	%o0
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%l6
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x4C, %l6
	lduh	[%l7 + %l6],	%l3
	nop
	set	0x50, %l5
	ldstub	[%l7 + %l5],	%i2
	add	%g5,	%i3,	%g3
	ba,pt	%icc,	loop_12
	or	%l0,	%i6,	%o4
	st	%f23,	[%l7 + 0x74]
	nop
	set	0x08, %i6
	std	%f26,	[%l7 + %i6]
loop_12:
	nop
	set	0x1D, %o4
	ldsb	[%l7 + %o4],	%l2
	set	0x5C, %o1
	stba	%i7,	[%l7 + %o1] 0xea
	membar	#Sync
	bge,a,pt	%icc,	loop_13
	nop
	set	0x2D, %g2
	ldstub	[%l7 + %g2],	%o5
	set	0x50, %o5
	stda	%i0,	[%l7 + %o5] 0xe2
	membar	#Sync
loop_13:
	nop
	set	0x6A, %i2
	stb	%i1,	[%l7 + %i2]
	nop
	set	0x4E, %l4
	ldsh	[%l7 + %l4],	%g6
	or	%g1,	%l4,	%l1
	set	0x0F, %i0
	stba	%o6,	[%l7 + %i0] 0x81
	set	0x20, %i7
	stda	%o0,	[%l7 + %i7] 0x88
	nop
	set	0x48, %l3
	stx	%g7,	[%l7 + %l3]
	st	%f28,	[%l7 + 0x44]
	set	0x3D, %g5
	stba	%g4,	[%l7 + %g5] 0x89
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x81,	 0
	nop
	set	0x78, %o6
	stx	%o2,	[%l7 + %o6]
	or	%o7,	%l5,	%i4
	nop
	set	0x2D, %o7
	ldsb	[%l7 + %o7],	%o0
	nop
	set	0x5D, %l2
	stb	%i5,	[%l7 + %l2]
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%g2
	nop
	set	0x18, %o3
	std	%f4,	[%l7 + %o3]
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f14
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i2
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x80,	%g5
	bg,a	%icc,	loop_14
	nop
	set	0x28, %l0
	stx	%l3,	[%l7 + %l0]
	or	%g3,	%l0,	%i3
	or	%o4,	%l2,	%i7
loop_14:
	nop
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	set	0x44, %i1
	sta	%f24,	[%l7 + %i1] 0x80
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f16
	set	0x78, %g7
	stxa	%i0,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x7D, %i4
	ldub	[%l7 + %i4],	%i6
	set	0x20, %i5
	stda	%g6,	[%l7 + %i5] 0x89
	set	0x10, %g4
	ldda	[%l7 + %g4] 0xe2,	%g0
	nop
	set	0x30, %l6
	stx	%i1,	[%l7 + %l6]
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc8
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x88,	%l4
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x81,	%o6
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xe2,	%o0
	nop
	set	0x30, %g2
	std	%g6,	[%l7 + %g2]
	nop
	set	0x20, %i2
	stw	%g4,	[%l7 + %i2]
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f14
	or	%o2,	%o7,	%o3
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%l5
	nop
	set	0x08, %i0
	stx	%i4,	[%l7 + %i0]
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 3
	and	%o0,	%g2,	%i5
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g5
	nop
	set	0x54, %g5
	ldsb	[%l7 + %g5],	%i2
	set	0x30, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
	nop
	set	0x24, %o7
	sth	%l0,	[%l7 + %o7]
	nop
	set	0x56, %g1
	ldub	[%l7 + %g1],	%i3
	nop
	set	0x44, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x24, %g6
	ldsw	[%l7 + %g6],	%o4
	set	0x28, %o3
	sta	%f8,	[%l7 + %o3] 0x81
	fpsub16	%f18,	%f0,	%f30
	fpsub32	%f0,	%f20,	%f28
	set	0x31, %i3
	ldstuba	[%l7 + %i3] 0x81,	%l2
	wr	%i7,	%g3,	%set_softint
	set	0x44, %g3
	stwa	%o5,	[%l7 + %g3] 0x81
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x80,	%i0
	nop
	set	0x30, %l0
	std	%f22,	[%l7 + %l0]
	nop
	set	0x54, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x60, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i6
	ld	[%l7 + 0x70],	%f12
	add	%g6,	%i1,	%l1
	nop
	set	0x1A, %i1
	ldsh	[%l7 + %i1],	%l4
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%o6
	nop
	set	0x78, %g4
	ldsb	[%l7 + %g4],	%g1
	nop
	nop
	setx	0xB365DEEE50BFF27E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD06295072FEE0924,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f30,	%f2
	set	0x3C, %i4
	swapa	[%l7 + %i4] 0x80,	%o1
	add	%g4,	%g7,	%o2
	nop
	set	0x6C, %l6
	stw	%o3,	[%l7 + %l6]
	and	%o7,	%l5,	%i4
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x81,	%g2
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f18
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x88,	%o0
	nop
	set	0x30, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf1,	%f16
	nop
	set	0x66, %o5
	stb	%l6,	[%l7 + %o5]
	nop
	set	0x12, %i0
	sth	%i2,	[%l7 + %i0]
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f18
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g5
	set	0x13, %l3
	stba	%i3,	[%l7 + %l3] 0xe2
	membar	#Sync
	bgu,a,pn	%icc,	loop_15
	st	%f8,	[%l7 + 0x50]
	nop
	set	0x2E, %i7
	sth	%o4,	[%l7 + %i7]
	ld	[%l7 + 0x4C],	%f9
loop_15:
	nop
	set	0x3E, %g5
	ldsh	[%l7 + %g5],	%l2
	st	%fsr,	[%l7 + 0x44]
	set	0x40, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l0
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f22
	nop
	set	0x35, %l2
	stb	%i7,	[%l7 + %l2]
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%o5
	set	0x30, %o3
	swapa	[%l7 + %o3] 0x89,	%g3
	nop
	set	0x38, %g6
	swap	[%l7 + %g6],	%i6
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x89,	%i0
	bleu,a	%icc,	loop_16
	and	%g6,	%i1,	%l1
	nop
	set	0x68, %l1
	stx	%o6,	[%l7 + %l1]
	set	0x24, %l0
	swapa	[%l7 + %l0] 0x81,	%g1
loop_16:
	nop
	set	0x10, %o0
	std	%f20,	[%l7 + %o0]
	ld	[%l7 + 0x10],	%f19
	nop
	set	0x67, %g3
	ldstub	[%l7 + %g3],	%l4
	set	0x78, %g7
	prefetcha	[%l7 + %g7] 0x80,	 4
	nop
	set	0x08, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x40, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x3C, %i4
	ldsw	[%l7 + %i4],	%o1
	nop
	set	0x0C, %g4
	sth	%g7,	[%l7 + %g4]
	nop
	set	0x48, %l5
	ldsw	[%l7 + %l5],	%o2
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xeb,	%o6
	nop
	set	0x42, %i6
	lduh	[%l7 + %i6],	%o3
	set	0x1D, %o4
	stba	%i4,	[%l7 + %o4] 0x88
	nop
	set	0x5C, %o1
	prefetch	[%l7 + %o1],	 3
	set	0x28, %i2
	stda	%l4,	[%l7 + %i2] 0x89
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%o0
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	set	0x10, %i0
	stda	%i4,	[%l7 + %i0] 0x89
	set	0x58, %o2
	lda	[%l7 + %o2] 0x80,	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%i2
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x80,	%l6
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xea,	%g4
	set	0x35, %g5
	stba	%l3,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x30, %o6
	std	%o4,	[%l7 + %o6]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xda
	ld	[%l7 + 0x40],	%f2
	nop
	set	0x58, %l2
	ldsw	[%l7 + %l2],	%i3
	st	%f29,	[%l7 + 0x50]
	nop
	set	0x20, %g1
	std	%l0,	[%l7 + %g1]
	nop
	set	0x7A, %o3
	ldsh	[%l7 + %o3],	%i7
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 4
	nop
	set	0x0A, %o7
	ldub	[%l7 + %o7],	%l2
	nop
	set	0x2E, %i3
	ldstub	[%l7 + %i3],	%o5
	set	0x30, %l1
	lda	[%l7 + %l1] 0x89,	%f17
	nop
	set	0x20, %o0
	lduw	[%l7 + %o0],	%g3
	nop
	set	0x74, %l0
	lduh	[%l7 + %l0],	%i0
	set	0x08, %g7
	lda	[%l7 + %g7] 0x89,	%f5
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x80,	%g6
	nop
	set	0x58, %i5
	stx	%i1,	[%l7 + %i5]
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%l1
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x40, %g4
	stx	%o6,	[%l7 + %g4]
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%g1
	set	0x5C, %i6
	lda	[%l7 + %i6] 0x88,	%f29
	nop
	set	0x50, %o4
	ldsh	[%l7 + %o4],	%i6
	ld	[%l7 + 0x70],	%f16
	and	%l4,	%g4,	%o1
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%f0
	nop
	set	0x51, %i2
	ldstub	[%l7 + %i2],	%g7
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	and	%o2,	%i4,	%l5
	nop
	set	0x43, %l5
	stb	%o0,	[%l7 + %l5]
	set	0x74, %o5
	stwa	%i5,	[%l7 + %o5] 0x88
	nop
	set	0x54, %o2
	stw	%o3,	[%l7 + %o2]
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%i2
	set	0x50, %i0
	stxa	%g2,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f22
	set	0x40, %i7
	stda	%g4,	[%l7 + %i7] 0xea
	membar	#Sync
	add	%l6,	%o4,	%i3
	set	0x50, %l4
	lda	[%l7 + %l4] 0x88,	%f11
	nop
	set	0x65, %o6
	ldstub	[%l7 + %o6],	%l3
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x80,	 4
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%i7
	nop
	set	0x30, %o3
	stw	%o5,	[%l7 + %o3]
	nop
	set	0x7C, %g6
	stb	%l2,	[%l7 + %g6]
	bg,pt	%xcc,	loop_17
	nop
	set	0x35, %o7
	ldstub	[%l7 + %o7],	%i0
	nop
	set	0x44, %i3
	ldsh	[%l7 + %i3],	%g3
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%i1
loop_17:
	nop
	set	0x30, %l0
	stx	%g6,	[%l7 + %l0]
	set	0x10, %g7
	stda	%l0,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x54, %i1
	stwa	%g1,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%o6
	nop
	set	0x0E, %g3
	ldsh	[%l7 + %g3],	%l4
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x88,	%g4
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%i6
	set	0x34, %l6
	sta	%f10,	[%l7 + %l6] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%o7
	st	%f15,	[%l7 + 0x34]
	set	0x1F, %g4
	stba	%g7,	[%l7 + %g4] 0x88
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x81
	bn,a	%xcc,	loop_18
	nop
	set	0x20, %i6
	std	%i4,	[%l7 + %i6]
	set	0x28, %i2
	ldxa	[%l7 + %i2] 0x88,	%l5
loop_18:
	nop
	set	0x10, %o1
	lda	[%l7 + %o1] 0x89,	%f11
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	and	%i5,	%o3,	%o0
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%i2
	nop
	set	0x28, %l5
	std	%f24,	[%l7 + %l5]
	set	0x70, %l3
	stxa	%g5,	[%l7 + %l3] 0x80
	set	0x30, %i0
	ldxa	[%l7 + %i0] 0x80,	%l6
	nop
	set	0x3C, %o2
	ldsw	[%l7 + %o2],	%o4
	add	%g2,	%i3,	%l0
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%o5
	nop
	set	0x2F, %l4
	ldstub	[%l7 + %l4],	%i0
	set	0x24, %g5
	lda	[%l7 + %g5] 0x81,	%f8
	fpadd16s	%f11,	%f20,	%f31
	set	0x3E, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l2
	wr	%g3,	%i1,	%y
	wr	%l1,	%g6,	%pic
	or	%o6,	%g1,	%g4
	nop
	set	0x28, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x3C, %l2
	sta	%f5,	[%l7 + %l2] 0x88
	nop
	set	0x50, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	bgu,pn	%xcc,	loop_19
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%l4
	set	0x23, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o1
loop_19:
	nop
	set	0x2F, %g7
	ldstub	[%l7 + %g7],	%o7
	nop
	set	0x48, %i3
	lduw	[%l7 + %i3],	%i6
	fpsub16	%f16,	%f2,	%f0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x80
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x89,	%g6
	set	0x74, %i5
	stwa	%l5,	[%l7 + %i5] 0x80
	set	0x38, %i4
	stha	%o2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x30, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i4
	nop
	set	0x64, %l1
	swap	[%l7 + %l1],	%o3
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%i4
	set	0x08, %i6
	ldxa	[%l7 + %i6] 0x80,	%i2
	set	0x58, %i2
	lda	[%l7 + %i2] 0x89,	%f23
	nop
	set	0x60, %o1
	ldstub	[%l7 + %o1],	%o0
	nop
	set	0x42, %g2
	sth	%l6,	[%l7 + %g2]
	set	0x18, %o5
	stxa	%o4,	[%l7 + %o5] 0x88
	set	0x70, %g4
	stxa	%g5,	[%l7 + %g4] 0x81
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%i2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	nop
	set	0x14, %o2
	swap	[%l7 + %o2],	%l0
	nop
	set	0x18, %i0
	std	%l2,	[%l7 + %i0]
	set	0x1F, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i7
	set	0x2B, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i0
	add	%g3,	%l2,	%i1
	set	0x57, %o6
	ldstuba	[%l7 + %o6] 0x80,	%g6
	add	%l1,	%g1,	%o6
	nop
	set	0x6C, %g1
	ldstub	[%l7 + %g1],	%l4
	set	0x1F, %l2
	stba	%g4,	[%l7 + %l2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x54, %l4
	stb	%o1,	[%l7 + %l4]
	bge	%xcc,	loop_20
	nop
	set	0x33, %o7
	ldub	[%l7 + %o7],	%i6
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f0
loop_20:
	ble,a	%icc,	loop_21
	ld	[%l7 + 0x3C],	%f30
	set	0x39, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o7
loop_21:
	nop
	set	0x18, %o0
	stda	%l4,	[%l7 + %o0] 0x81
	nop
	set	0x7E, %g7
	lduh	[%l7 + %g7],	%o2
	fpsub16s	%f11,	%f21,	%f6
	be,pn	%icc,	loop_22
	nop
	set	0x7E, %l0
	ldstub	[%l7 + %l0],	%i4
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x88,	%o3
loop_22:
	nop
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	nop
	set	0x20, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x60, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x89,	 1
	set	0x3F, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o0
	nop
	set	0x48, %o4
	prefetch	[%l7 + %o4],	 1
	add	%l6,	%o4,	%g5
	ld	[%l7 + 0x54],	%f29
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%l3
	nop
	set	0x78, %i2
	ldsw	[%l7 + %i2],	%g2
	nop
	set	0x20, %i5
	ldsw	[%l7 + %i5],	%o5
	nop
	set	0x2E, %o1
	ldsb	[%l7 + %o1],	%i7
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f14
	bn,pn	%xcc,	loop_23
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%i0
	nop
	set	0x18, %g4
	lduw	[%l7 + %g4],	%g3
	fpadd16s	%f25,	%f21,	%f25
loop_23:
	nop
	set	0x3C, %l3
	sta	%f14,	[%l7 + %l3] 0x80
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%l2
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x10, %o2
	lda	[%l7 + %o2] 0x88,	%f16
	set	0x48, %i0
	sta	%f10,	[%l7 + %i0] 0x89
	set	0x4A, %g5
	stha	%g6,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDA8, 	%sys_tick_cmpr
	set	0x74, %g1
	stwa	%g4,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd8
	set	0x6C, %o7
	stwa	%l4,	[%l7 + %o7] 0x80
	bne,a	%icc,	loop_24
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f10
	nop
	set	0x08, %l4
	stx	%i6,	[%l7 + %l4]
	and	%l5,	%o2,	%i4
loop_24:
	nop
	set	0x62, %o0
	sth	%o7,	[%l7 + %o0]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f16
	set	0x54, %o3
	lda	[%l7 + %o3] 0x80,	%f22
	set	0x2A, %l0
	stba	%g7,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x3C, %g3
	prefetch	[%l7 + %g3],	 4
	st	%fsr,	[%l7 + 0x74]
	add	%i5,	%o3,	%o0
	nop
	set	0x42, %i3
	lduh	[%l7 + %i3],	%i2
	nop
	set	0x20, %i4
	std	%i6,	[%l7 + %i4]
	set	0x18, %i1
	stxa	%o4,	[%l7 + %i1] 0x89
	set	0x74, %l6
	stha	%g5,	[%l7 + %l6] 0x81
	nop
	set	0x2C, %l1
	swap	[%l7 + %l1],	%l0
	set	0x50, %o4
	stxa	%i3,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x7B, %i6
	ldstub	[%l7 + %i6],	%g2
	set	0x35, %i5
	stba	%l3,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%o5,	%i0,	%i7
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x1C, %g2
	swap	[%l7 + %g2],	%g3
	nop
	set	0x6E, %o1
	lduh	[%l7 + %o1],	%i1
	nop
	set	0x7E, %g4
	lduh	[%l7 + %g4],	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%o6
	and	%g1,	%l1,	%o1
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x17, %l5
	ldsb	[%l7 + %l5],	%g4
	set	0x6C, %l3
	lda	[%l7 + %l3] 0x88,	%f11
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	nop
	set	0x28, %i0
	std	%f24,	[%l7 + %i0]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x88
	nop
	set	0x48, %g1
	stw	%l4,	[%l7 + %g1]
	nop
	set	0x5E, %i7
	ldsh	[%l7 + %i7],	%l5
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f28
	nop
	set	0x24, %o7
	swap	[%l7 + %o7],	%i4
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x29, %g6
	ldstub	[%l7 + %g6],	%g7
	nop
	set	0x20, %l4
	std	%i4,	[%l7 + %l4]
	set	0x28, %g7
	stxa	%o3,	[%l7 + %g7] 0x80
	set	0x10, %o3
	stxa	%o0,	[%l7 + %o3] 0xeb
	membar	#Sync
	or	%o7,	%i2,	%o4
	set	0x18, %o0
	stda	%i6,	[%l7 + %o0] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%g5
	nop
	set	0x58, %g3
	std	%g2,	[%l7 + %g3]
	add	%i3,	%l3,	%o5
	nop
	set	0x35, %l0
	ldstub	[%l7 + %l0],	%i0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x88
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x80,	 3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x38, %i4
	ldx	[%l7 + %i4],	%i1
	nop
	set	0x48, %l6
	std	%f10,	[%l7 + %l6]
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%i6
	nop
	set	0x28, %i6
	std	%g6,	[%l7 + %i6]
	nop
	set	0x30, %i5
	std	%f0,	[%l7 + %i5]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%g1
	nop
	set	0x72, %i2
	ldsb	[%l7 + %i2],	%l1
	fpadd32	%f0,	%f6,	%f20
	add	%o1,	%o6,	%g4
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%i6
	nop
	set	0x52, %o1
	ldsb	[%l7 + %o1],	%l4
	set	0x78, %g4
	lda	[%l7 + %g4] 0x88,	%f8
	nop
	set	0x34, %o5
	sth	%l5,	[%l7 + %o5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%g7
	nop
	set	0x78, %l5
	std	%f16,	[%l7 + %l5]
	nop
	set	0x14, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f16
	bl,pt	%icc,	loop_25
	nop
	set	0x60, %g2
	std	%i4,	[%l7 + %g2]
	nop
	set	0x58, %i0
	std	%o2,	[%l7 + %i0]
	set	0x63, %o6
	stba	%o2,	[%l7 + %o6] 0xea
	membar	#Sync
loop_25:
	nop
	set	0x10, %g1
	stw	%o0,	[%l7 + %g1]
	or	%i2,	%o7,	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%g5
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%g2
	fpsub16s	%f31,	%f14,	%f0
	nop
	set	0x25, %i7
	stb	%i3,	[%l7 + %i7]
	nop
	set	0x64, %g5
	ldsw	[%l7 + %g5],	%l0
	set	0x10, %g6
	sta	%f5,	[%l7 + %g6] 0x81
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%o4
	nop
	set	0x7F, %g7
	ldub	[%l7 + %g7],	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%i1
	nop
	set	0x14, %o7
	lduh	[%l7 + %o7],	%i7
	set	0x18, %o0
	sta	%f12,	[%l7 + %o0] 0x80
	ld	[%l7 + 0x6C],	%f21
	set	0x10, %o3
	stwa	%g6,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%i0
	nop
	set	0x3C, %l0
	swap	[%l7 + %l0],	%g1
	nop
	set	0x78, %i3
	stw	%l2,	[%l7 + %i3]
	set	0x58, %i1
	stxa	%o1,	[%l7 + %i1] 0xea
	membar	#Sync
	or	%o6,	%g4,	%l1
	st	%f12,	[%l7 + 0x5C]
	st	%f27,	[%l7 + 0x18]
	nop
	set	0x53, %l6
	ldsb	[%l7 + %l6],	%l4
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%i6
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x88,	%i4
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x81,	%l5
	st	%fsr,	[%l7 + 0x28]
	or	%i5,	%g7,	%o2
	nop
	set	0x42, %i5
	ldstub	[%l7 + %i5],	%o3
	set	0x1F, %l1
	stba	%i2,	[%l7 + %l1] 0x89
	set	0x3A, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o0
	nop
	set	0x70, %i2
	lduh	[%l7 + %i2],	%o7
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x80,	%l6
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x80,	 1
	nop
	set	0x48, %g4
	ldsw	[%l7 + %g4],	%g2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	nop
	set	0x4C, %l3
	stw	%i3,	[%l7 + %l3]
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xea,	%g4
	nop
	set	0x70, %o6
	swap	[%l7 + %o6],	%o5
	nop
	set	0x12, %g1
	lduh	[%l7 + %g1],	%l3
	nop
	set	0x3A, %i0
	lduh	[%l7 + %i0],	%g3
	set	0x7C, %l2
	stha	%i1,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x46, %g5
	stha	%i7,	[%l7 + %g5] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f0
	set	0x68, %i7
	stwa	%l0,	[%l7 + %i7] 0x89
	nop
	set	0x68, %g7
	std	%f18,	[%l7 + %g7]
	set	0x3D, %l4
	stba	%g6,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x30, %o0
	lda	[%l7 + %o0] 0x80,	%f12
	ld	[%l7 + 0x20],	%f3
	fpsub16	%f24,	%f20,	%f10
	nop
	set	0x7C, %o3
	ldstub	[%l7 + %o3],	%g1
	nop
	set	0x70, %o7
	sth	%l2,	[%l7 + %o7]
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%i0
	nop
	set	0x78, %l0
	ldx	[%l7 + %l0],	%o6
	or	%o1,	%g4,	%l1
	nop
	set	0x78, %i1
	std	%l4,	[%l7 + %i1]
	set	0x58, %i3
	swapa	[%l7 + %i3] 0x88,	%i4
	nop
	set	0x0A, %o4
	stb	%i6,	[%l7 + %o4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g7
	bg,a,pn	%icc,	loop_26
	nop
	set	0x32, %i6
	ldsh	[%l7 + %i6],	%i5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f16
loop_26:
	or	%o3,	%i2,	%o0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o7,	%o2
	set	0x10, %i4
	stda	%o4,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x34, %l1
	lduw	[%l7 + %l1],	%g2
	nop
	set	0x50, %o1
	stx	%i3,	[%l7 + %o1]
	nop
	set	0x7C, %i5
	ldub	[%l7 + %i5],	%l6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xe3,	%o4
	nop
	set	0x61, %l5
	ldsb	[%l7 + %l5],	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x673, 	%tick_cmpr
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf0
	membar	#Sync
	ld	[%l7 + 0x24],	%f7
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf9
	membar	#Sync
	set	0x2C, %o2
	sta	%f29,	[%l7 + %o2] 0x88
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f16
	set	0x50, %g1
	lda	[%l7 + %g1] 0x81,	%f2
	set	0x73, %i0
	stba	%i1,	[%l7 + %i0] 0x89
	nop
	set	0x48, %o6
	std	%l0,	[%l7 + %o6]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	nop
	set	0x58, %g6
	ldsh	[%l7 + %g6],	%i7
	nop
	set	0x20, %l2
	stx	%g6,	[%l7 + %l2]
	set	0x70, %g7
	stda	%g0,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x0A, %i7
	ldstub	[%l7 + %i7],	%i0
	set	0x1F, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l2
	set	0x10, %o0
	stda	%o0,	[%l7 + %o0] 0x80
	nop
	set	0x40, %o7
	stx	%g4,	[%l7 + %o7]
	set	0x48, %g3
	stda	%o6,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x88,	%l1
	nop
	set	0x2C, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%i4
	and	%l4,	%l5,	%i6
	and	%g7,	%i5,	%i2
	st	%fsr,	[%l7 + 0x34]
	fpadd32s	%f13,	%f20,	%f12
	nop
	set	0x3C, %i3
	ldsw	[%l7 + %i3],	%o0
	nop
	set	0x30, %o4
	swap	[%l7 + %o4],	%o7
	set	0x64, %l6
	swapa	[%l7 + %l6] 0x80,	%o2
	wr	%o4,	%g2,	%softint
	be,pt	%xcc,	loop_27
	nop
	set	0x39, %i6
	stb	%i3,	[%l7 + %i6]
	st	%f19,	[%l7 + 0x40]
	nop
	set	0x34, %i4
	ldsh	[%l7 + %i4],	%l6
loop_27:
	nop
	set	0x53, %o1
	ldstub	[%l7 + %o1],	%o3
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x88
	ld	[%l7 + 0x2C],	%f19
	nop
	set	0x4C, %i5
	ldsw	[%l7 + %i5],	%o5
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%g5
	nop
	set	0x58, %i2
	ldsw	[%l7 + %i2],	%g3
	nop
	set	0x34, %o5
	sth	%i1,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	set	0x48, %l3
	stxa	%l3,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x58, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x48, %g2
	ldstuba	[%l7 + %g2] 0x81,	%i7
	add	%g6,	%g1,	%l0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x2A, %o6
	ldsh	[%l7 + %o6],	%l2
	set	0x58, %i0
	stba	%i0,	[%l7 + %i0] 0x81
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f0
	nop
	set	0x44, %g5
	lduw	[%l7 + %g5],	%o1
	set	0x36, %g7
	stha	%o6,	[%l7 + %g7] 0x89
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%l1
	fpsub16s	%f11,	%f28,	%f28
	st	%fsr,	[%l7 + 0x44]
	ld	[%l7 + 0x48],	%f30
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%l4
	and	%l5,	%i6,	%i4
	nop
	set	0x54, %l4
	lduh	[%l7 + %l4],	%i5
	nop
	set	0x65, %l2
	ldsb	[%l7 + %l2],	%g7
	st	%fsr,	[%l7 + 0x14]
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x80,	%o0
	and	%o7,	%o2,	%o4
	nop
	set	0x48, %o7
	ldx	[%l7 + %o7],	%g2
	set	0x60, %l0
	stda	%i2,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x40, %o3
	stxa	%i2,	[%l7 + %o3] 0x81
	nop
	set	0x58, %g3
	swap	[%l7 + %g3],	%l6
	set	0x5C, %i1
	stwa	%o3,	[%l7 + %i1] 0x89
	nop
	set	0x32, %o4
	lduh	[%l7 + %o4],	%o5
	set	0x38, %l6
	stda	%g2,	[%l7 + %l6] 0x80
	nop
	set	0x7D, %i3
	ldub	[%l7 + %i3],	%g5
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%f16
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x81
	nop
	set	0x71, %o1
	stb	%i1,	[%l7 + %o1]
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%i7
	nop
	set	0x48, %l5
	stw	%g6,	[%l7 + %l5]
	or	%l3,	%g1,	%l0
	set	0x62, %i5
	stha	%i0,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x58, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x55, %o5
	ldsb	[%l7 + %o5],	%l2
	or	%o6,	%g4,	%l1
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%o1
	ld	[%l7 + 0x6C],	%f7
	nop
	set	0x48, %o2
	swap	[%l7 + %o2],	%l5
	nop
	set	0x38, %g2
	std	%f26,	[%l7 + %g2]
	nop
	set	0x20, %l3
	stx	%l4,	[%l7 + %l3]
	nop
	set	0x74, %o6
	stw	%i6,	[%l7 + %o6]
	st	%f11,	[%l7 + 0x6C]
	or	%i5,	%i4,	%o0
	nop
	set	0x70, %i0
	stb	%o7,	[%l7 + %i0]
	ld	[%l7 + 0x74],	%f9
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x80,	 4
	add	%o4,	%o2,	%i3
	bg,a,pn	%xcc,	loop_28
	nop
	set	0x20, %g5
	stw	%g2,	[%l7 + %g5]
	nop
	set	0x2A, %g7
	lduh	[%l7 + %g7],	%l6
	nop
	set	0x28, %g6
	std	%i2,	[%l7 + %g6]
loop_28:
	fpadd16s	%f30,	%f8,	%f4
	set	0x60, %l4
	stha	%o5,	[%l7 + %l4] 0xea
	membar	#Sync
	and	%g3,	%g5,	%i1
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x88,	 2
	nop
	nop
	setx	0x0C913F64EE13A8E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xCDCFDB8C2E90C7C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f18,	%f14
	set	0x24, %l2
	lda	[%l7 + %l2] 0x80,	%f17
	set	0x28, %o0
	stwa	%i7,	[%l7 + %o0] 0x81
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x28, %l0
	ldsb	[%l7 + %l0],	%g6
	set	0x70, %g3
	stda	%g0,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%l3
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%l0
	fpsub32	%f16,	%f4,	%f12
	nop
	set	0x5A, %l6
	ldsb	[%l7 + %l6],	%i0
	nop
	set	0x08, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x79, %i1
	ldstub	[%l7 + %i1],	%o6
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x5A, %i6
	lduh	[%l7 + %i6],	%l2
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f24
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x7D, %l1
	stb	%g4,	[%l7 + %l1]
	nop
	set	0x1C, %l5
	lduw	[%l7 + %l5],	%l1
	nop
	set	0x32, %o1
	stb	%o1,	[%l7 + %o1]
	nop
	set	0x38, %i5
	sth	%l4,	[%l7 + %i5]
	fpadd16s	%f11,	%f12,	%f11
	nop
	set	0x09, %i2
	ldub	[%l7 + %i2],	%l5
	nop
	set	0x35, %o5
	ldstub	[%l7 + %o5],	%i5
	set	0x5C, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i4
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%o0
	nop
	set	0x78, %l3
	lduh	[%l7 + %l3],	%i6
	nop
	set	0x2C, %o6
	sth	%g7,	[%l7 + %o6]
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%o4
	nop
	set	0x24, %i0
	ldub	[%l7 + %i0],	%o2
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f0
	st	%fsr,	[%l7 + 0x44]
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	and	%o7,	%g2,	%i2
	set	0x2C, %g6
	sta	%f12,	[%l7 + %g6] 0x81
	set	0x64, %l4
	stwa	%o5,	[%l7 + %l4] 0x88
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%g3
	nop
	set	0x7A, %i7
	ldsh	[%l7 + %i7],	%g5
	set	0x0C, %l2
	stwa	%i1,	[%l7 + %l2] 0x80
	bg,a	%icc,	loop_29
	nop
	set	0x28, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x11, %o0
	ldsb	[%l7 + %o0],	%o3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f0
loop_29:
	nop
	set	0x09, %g3
	stba	%l6,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF70, 	%tick_cmpr
	nop
	set	0x60, %o3
	stx	%g6,	[%l7 + %o3]
	set	0x5C, %o4
	sta	%f8,	[%l7 + %o4] 0x89
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	set	0x5C, %i3
	lda	[%l7 + %i3] 0x81,	%f5
	nop
	set	0x4E, %i1
	ldsh	[%l7 + %i1],	%l3
	nop
	set	0x10, %i6
	ldsh	[%l7 + %i6],	%i0
	nop
	set	0x7E, %l1
	ldsb	[%l7 + %l1],	%o6
	set	0x08, %l5
	stxa	%l2,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x60, %o1
	lda	[%l7 + %o1] 0x80,	%f21
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f4
	and	%g4,	%l1,	%o1
	set	0x3C, %i4
	stwa	%l4,	[%l7 + %i4] 0x80
	nop
	set	0x2E, %o5
	ldstub	[%l7 + %o5],	%i5
	set	0x78, %o2
	stda	%l4,	[%l7 + %o2] 0x89
	and	%i4,	%o0,	%i6
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x80,	%g7
	set	0x70, %l3
	lda	[%l7 + %l3] 0x81,	%f19
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x80,	%o2
	set	0x70, %o6
	stxa	%o4,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%o6
	fpsub32	%f18,	%f24,	%f6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i3
	set	0x40, %g2
	stda	%o4,	[%l7 + %g2] 0x80
	nop
	set	0x2A, %g5
	stb	%g3,	[%l7 + %g5]
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f2
	set	0x4C, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i2
	set	0x20, %i7
	stwa	%g5,	[%l7 + %i7] 0x80
	nop
	set	0x1C, %l2
	swap	[%l7 + %l2],	%i1
	set	0x78, %g7
	swapa	[%l7 + %g7] 0x88,	%o3
	nop
	set	0x18, %o0
	ldstub	[%l7 + %o0],	%l6
	or	%g1,	%i7,	%g6
	nop
	set	0x23, %l0
	stb	%l0,	[%l7 + %l0]
	and	%i0,	%l3,	%l2
	nop
	set	0x64, %o7
	sth	%g4,	[%l7 + %o7]
	nop
	set	0x60, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x80,	%l1
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xeb,	%o0
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%o6
	set	0x48, %i1
	stxa	%i5,	[%l7 + %i1] 0x80
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%l4
	nop
	set	0x58, %i3
	std	%i4,	[%l7 + %i3]
	set	0x42, %l1
	stba	%l4,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%o0
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%i6
	nop
	set	0x76, %i4
	ldub	[%l7 + %i4],	%o2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g7
	st	%fsr,	[%l7 + 0x78]
	set	0x48, %o5
	stwa	%o7,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x48, %o2
	stw	%i3,	[%l7 + %o2]
	nop
	set	0x64, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%f10
	set	0x50, %g4
	sta	%f9,	[%l7 + %g4] 0x88
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f12
	nop
	set	0x20, %i0
	std	%f14,	[%l7 + %i0]
	nop
	set	0x31, %o6
	stb	%o5,	[%l7 + %o6]
	nop
	set	0x48, %g1
	stx	%g2,	[%l7 + %g1]
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xe3,	%g2
	set	0x38, %g5
	stda	%g4,	[%l7 + %g5] 0x80
	wr	%i1,	%i2,	%y
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%l6
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%f16
	nop
	set	0x0A, %g6
	stb	%g1,	[%l7 + %g6]
	nop
	set	0x22, %l2
	ldsh	[%l7 + %l2],	%o3
	set	0x2C, %g7
	stba	%i7,	[%l7 + %g7] 0xe2
	membar	#Sync
	ld	[%l7 + 0x4C],	%f8
	ld	[%l7 + 0x44],	%f17
	nop
	set	0x60, %o0
	stb	%g6,	[%l7 + %o0]
	nop
	set	0x7D, %o7
	stb	%i0,	[%l7 + %o7]
	nop
	set	0x30, %l0
	sth	%l3,	[%l7 + %l0]
	nop
	set	0x50, %o3
	prefetch	[%l7 + %o3],	 4
	set	0x74, %g3
	sta	%f30,	[%l7 + %g3] 0x88
	nop
	set	0x1E, %o4
	ldsb	[%l7 + %o4],	%l2
	nop
	set	0x58, %i1
	std	%f26,	[%l7 + %i1]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x88,	%g4
	set	0x64, %l6
	stha	%l0,	[%l7 + %l6] 0x88
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x80,	%l1
	set	0x60, %l5
	stxa	%o1,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x4F, %l1
	ldsb	[%l7 + %l1],	%o6
	nop
	set	0x48, %o1
	std	%i4,	[%l7 + %o1]
	set	0x20, %o5
	stda	%l4,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xea,	%i4
	set	0x60, %i2
	stha	%o0,	[%l7 + %i2] 0x80
	nop
	set	0x27, %i4
	ldstub	[%l7 + %i4],	%i6
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x16, %g4
	lduh	[%l7 + %g4],	%o2
	or	%o4,	%g7,	%o7
	set	0x7D, %i0
	stba	%i3,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x10, %i5
	stha	%l4,	[%l7 + %i5] 0xe2
	membar	#Sync
	wr	%o5,	%g3,	%y
	nop
	set	0x54, %o6
	ldsh	[%l7 + %o6],	%g5
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%g2
	and	%i1,	%i2,	%g1
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%o3
	st	%fsr,	[%l7 + 0x54]
	st	%fsr,	[%l7 + 0x70]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xea,	%i6
	nop
	set	0x28, %i7
	std	%f20,	[%l7 + %i7]
	set	0x40, %l4
	stda	%i6,	[%l7 + %l4] 0x81
	nop
	set	0x6C, %l2
	lduh	[%l7 + %l2],	%g6
	nop
	set	0x08, %g6
	stx	%l3,	[%l7 + %g6]
	nop
	set	0x29, %g7
	stb	%i0,	[%l7 + %g7]
	nop
	set	0x26, %o7
	lduh	[%l7 + %o7],	%l2
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x81,	%g4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf1
	membar	#Sync
	nop
	set	0x60, %g3
	ldstub	[%l7 + %g3],	%l0
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%o6
	nop
	set	0x78, %i1
	stw	%i5,	[%l7 + %i1]
	add	%l1,	%l5,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o0
	nop
	set	0x18, %i6
	std	%f30,	[%l7 + %i6]
	set	0x08, %o4
	ldxa	[%l7 + %o4] 0x89,	%o2
	nop
	set	0x4C, %l6
	ldsb	[%l7 + %l6],	%g7
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x88
	nop
	set	0x1C, %l5
	ldsw	[%l7 + %l5],	%o7
	and	%o4,	%l4,	%i3
	add	%o5,	%g3,	%g2
	nop
	set	0x20, %l1
	std	%f20,	[%l7 + %l1]
	nop
	set	0x78, %o5
	stx	%i1,	[%l7 + %o5]
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%i2
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%g1
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x80,	%g5
	nop
	set	0x40, %l3
	stx	%fsr,	[%l7 + %l3]
	bne,a,pn	%xcc,	loop_30
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%o3
	set	0x30, %i4
	stda	%i6,	[%l7 + %i4] 0x88
loop_30:
	nop
	set	0x56, %i5
	ldsb	[%l7 + %i5],	%i7
	st	%f11,	[%l7 + 0x2C]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf0
	membar	#Sync
	nop
	set	0x1C, %g1
	ldsh	[%l7 + %g1],	%l3
	nop
	set	0x38, %g2
	sth	%g6,	[%l7 + %g2]
	nop
	set	0x38, %i0
	std	%i0,	[%l7 + %i0]
	nop
	set	0x6E, %i7
	ldsh	[%l7 + %i7],	%l2
	nop
	set	0x14, %g5
	ldsh	[%l7 + %g5],	%g4
	fpadd16s	%f23,	%f16,	%f6
	set	0x40, %l2
	stxa	%l0,	[%l7 + %l2] 0x88
	set	0x6C, %g6
	stba	%o6,	[%l7 + %g6] 0x81
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f0
	set	0x16, %o7
	stba	%i5,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x40, %o0
	stwa	%o1,	[%l7 + %o0] 0x80
	nop
	set	0x68, %l4
	stb	%l1,	[%l7 + %l4]
	set	0x32, %l0
	stba	%i4,	[%l7 + %l0] 0x88
	fpadd32	%f30,	%f16,	%f12
	nop
	set	0x18, %g3
	lduw	[%l7 + %g3],	%i6
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xc0
	nop
	set	0x31, %i6
	stb	%o0,	[%l7 + %i6]
	or	%l5,	%g7,	%o7
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o4
	nop
	set	0x40, %l6
	ldsw	[%l7 + %l6],	%l4
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x88,	 1
	nop
	set	0x20, %l5
	lduh	[%l7 + %l5],	%o5
	set	0x3A, %i3
	stha	%i3,	[%l7 + %i3] 0x81
	nop
	set	0x71, %o5
	stb	%g3,	[%l7 + %o5]
	set	0x48, %o2
	stda	%i0,	[%l7 + %o2] 0x89
	and	%g2,	%i2,	%g1
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xea,	%g4
	set	0x4E, %l1
	stha	%l6,	[%l7 + %l1] 0x81
	nop
	set	0x5C, %o1
	ldsb	[%l7 + %o1],	%i7
	nop
	set	0x1E, %g4
	ldsb	[%l7 + %g4],	%o3
	bg	%xcc,	loop_31
	nop
	set	0x54, %i4
	lduw	[%l7 + %i4],	%l3
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f20
	nop
	set	0x1D, %o6
	ldstub	[%l7 + %o6],	%i0
loop_31:
	nop
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f16
	nop
	set	0x11, %g2
	ldub	[%l7 + %g2],	%g6
	nop
	set	0x57, %g1
	stb	%g4,	[%l7 + %g1]
	set	0x11, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l0
	nop
	set	0x30, %g5
	stb	%l2,	[%l7 + %g5]
	set	0x26, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i5
	nop
	set	0x78, %g6
	lduw	[%l7 + %g6],	%o6
	nop
	set	0x0F, %l2
	stb	%o1,	[%l7 + %l2]
	ld	[%l7 + 0x0C],	%f15
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x89
	set	0x28, %o0
	stda	%l0,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x5D, %l4
	stba	%i4,	[%l7 + %l4] 0x80
	nop
	set	0x3E, %g7
	stb	%i6,	[%l7 + %g7]
	nop
	set	0x30, %g3
	std	%o0,	[%l7 + %g3]
	nop
	set	0x5F, %l0
	stb	%l5,	[%l7 + %l0]
	set	0x0C, %i6
	sta	%f0,	[%l7 + %i6] 0x80
	set	0x0C, %o4
	stwa	%g7,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x64, %o3
	sta	%f24,	[%l7 + %o3] 0x89
	fpsub32s	%f18,	%f11,	%f11
	nop
	set	0x28, %l6
	ldsh	[%l7 + %l6],	%o7
	set	0x5C, %l5
	stha	%o4,	[%l7 + %l5] 0x80
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x81,	%o2
	set	0x68, %i3
	lda	[%l7 + %i3] 0x88,	%f31
	nop
	set	0x5E, %o2
	sth	%l4,	[%l7 + %o2]
	nop
	set	0x0C, %o5
	ldsh	[%l7 + %o5],	%o5
	nop
	set	0x50, %l1
	lduw	[%l7 + %l1],	%i3
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f14
	nop
	set	0x17, %g4
	stb	%g3,	[%l7 + %g4]
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x80,	%i0
	and	%i2,	%g1,	%g2
	set	0x50, %i2
	stda	%i6,	[%l7 + %i2] 0x81
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc4
	set	0x18, %i5
	stda	%g4,	[%l7 + %i5] 0x89
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	set	0x08, %g1
	stxa	%i7,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	, %i0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1267
!	Type a   	: 24
!	Type cti   	: 31
!	Type x   	: 519
!	Type f   	: 37
!	Type i   	: 122
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
	set	0xD,	%g1
	set	0xF,	%g2
	set	0x0,	%g3
	set	0x9,	%g4
	set	0x7,	%g5
	set	0x6,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0x0,	%i1
	set	-0x8,	%i2
	set	-0x6,	%i3
	set	-0xA,	%i4
	set	-0x2,	%i5
	set	-0xA,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x099AF1DA,	%l0
	set	0x472700D4,	%l1
	set	0x7D26FE1B,	%l2
	set	0x5D9D1778,	%l3
	set	0x1999EE3D,	%l4
	set	0x3B09B75C,	%l5
	set	0x7BFB4928,	%l6
	!# Output registers
	set	-0x06A1,	%o0
	set	0x0B07,	%o1
	set	-0x1645,	%o2
	set	-0x1293,	%o3
	set	-0x1A1A,	%o4
	set	0x1AB5,	%o5
	set	0x1EBB,	%o6
	set	-0x07B4,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	nop
	set	0x47, %g2
	ldstub	[%l7 + %g2],	%l3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%g6
	set	0x18, %g5
	lda	[%l7 + %g5] 0x88,	%f23
	nop
	set	0x48, %i7
	stx	%o3,	[%l7 + %i7]
	or	%g4,	%l2,	%l0
	nop
	set	0x10, %g6
	std	%o6,	[%l7 + %g6]
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf9,	%f16
	be,pt	%xcc,	loop_32
	bleu,a	%xcc,	loop_33
	nop
	set	0x4F, %o7
	stb	%i5,	[%l7 + %o7]
	nop
	set	0x2E, %l4
	ldsh	[%l7 + %l4],	%l1
loop_32:
	wr	%i4,	%i6,	%y
loop_33:
	nop
	set	0x5B, %g7
	stba	%o1,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x08, %l0
	sth	%o0,	[%l7 + %l0]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f0
	set	0x10, %g3
	ldxa	[%l7 + %g3] 0x81,	%l5
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f14
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f16
	nop
	set	0x30, %o3
	std	%o6,	[%l7 + %o3]
	set	0x6F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g7
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	st	%f22,	[%l7 + 0x64]
	fpadd16s	%f20,	%f30,	%f8
	set	0x18, %o2
	stda	%o4,	[%l7 + %o2] 0x81
	set	0x76, %o5
	stha	%l4,	[%l7 + %o5] 0x80
	set	0x6C, %l1
	lda	[%l7 + %l1] 0x89,	%f11
	set	0x50, %i3
	stha	%o5,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x89,	%g3
	fpadd32	%f0,	%f18,	%f20
	and	%i1,	%i2,	%i3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%l6
	set	0x2C, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g2
	nop
	set	0x50, %g4
	ldx	[%l7 + %g4],	%g5
	nop
	set	0x08, %o6
	stx	%i7,	[%l7 + %o6]
	set	0x44, %i2
	stha	%l3,	[%l7 + %i2] 0x88
	nop
	set	0x7A, %i5
	ldub	[%l7 + %i5],	%i0
	nop
	set	0x40, %g1
	lduw	[%l7 + %g1],	%g6
	nop
	set	0x12, %l3
	ldsh	[%l7 + %l3],	%g4
	st	%f30,	[%l7 + 0x1C]
	nop
	set	0x2A, %g2
	sth	%o3,	[%l7 + %g2]
	nop
	set	0x68, %g5
	stx	%l2,	[%l7 + %g5]
	nop
	set	0x60, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x3D, %g6
	ldstub	[%l7 + %g6],	%o6
	nop
	set	0x10, %l2
	prefetch	[%l7 + %l2],	 0
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x2C, %o0
	sth	%l0,	[%l7 + %o0]
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%l1
	add	%i4,	%i5,	%o1
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f6
	set	0x40, %l0
	prefetcha	[%l7 + %l0] 0x88,	 3
	set	0x24, %l4
	stwa	%l5,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x58, %g3
	sta	%f28,	[%l7 + %g3] 0x89
	set	0x34, %o4
	lda	[%l7 + %o4] 0x88,	%f30
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc8
	set	0x30, %l6
	ldxa	[%l7 + %l6] 0x89,	%o0
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%g7
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%o7
	wr 	%g0, 	0x7, 	%fprs
	add	%o5,	%g3,	%i1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%i3
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x89,	%g1
	nop
	set	0x69, %o5
	ldstub	[%l7 + %o5],	%l6
	nop
	set	0x4E, %o2
	lduh	[%l7 + %o2],	%i2
	nop
	set	0x6C, %l1
	lduh	[%l7 + %l1],	%g5
	nop
	set	0x3E, %i3
	lduh	[%l7 + %i3],	%i7
	set	0x08, %i4
	stxa	%g2,	[%l7 + %i4] 0x80
	st	%f0,	[%l7 + 0x74]
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	set	0x70, %o6
	swapa	[%l7 + %o6] 0x81,	%g6
	nop
	set	0x6A, %i2
	lduh	[%l7 + %i2],	%g4
	set	0x10, %i5
	sta	%f12,	[%l7 + %i5] 0x89
	set	0x0C, %g1
	lda	[%l7 + %g1] 0x88,	%f29
	and	%l3,	%o3,	%l2
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x6C, %o1
	stwa	%o6,	[%l7 + %o1] 0xeb
	membar	#Sync
	bne,a,pn	%xcc,	loop_34
	st	%f11,	[%l7 + 0x4C]
	set	0x38, %g2
	stxa	%l0,	[%l7 + %g2] 0x89
loop_34:
	nop
	set	0x74, %i0
	stwa	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%i6
	nop
	set	0x70, %g6
	lduh	[%l7 + %g6],	%l5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x80,	%i5
	add	%g7,	%o7,	%o0
	set	0x60, %o7
	sta	%f22,	[%l7 + %o7] 0x88
	nop
	set	0x4E, %i7
	ldub	[%l7 + %i7],	%l4
	set	0x30, %l0
	stxa	%o5,	[%l7 + %l0] 0x88
	and	%g3,	%i1,	%o2
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x88,	 2
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%i3
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%l6
	nop
	set	0x74, %o3
	ldsw	[%l7 + %o3],	%g5
	set	0x4A, %l6
	stha	%i7,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x3C, %i1
	ldub	[%l7 + %i1],	%i2
	add	%i0,	%g2,	%g6
	nop
	set	0x5E, %l5
	lduh	[%l7 + %l5],	%g4
	nop
	set	0x70, %o2
	swap	[%l7 + %o2],	%l3
	nop
	set	0x18, %o5
	std	%l2,	[%l7 + %o5]
	and	%o6,	%l0,	%o3
	set	0x14, %i3
	lda	[%l7 + %i3] 0x80,	%f17
	nop
	set	0x67, %i4
	ldstub	[%l7 + %i4],	%l1
	nop
	set	0x78, %g4
	swap	[%l7 + %g4],	%i4
	nop
	set	0x20, %o6
	ldsh	[%l7 + %o6],	%o1
	nop
	set	0x2E, %i2
	lduh	[%l7 + %i2],	%l5
	nop
	set	0x38, %l1
	stx	%fsr,	[%l7 + %l1]
	or	%i6,	%i5,	%o7
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f26
	nop
	set	0x1C, %i5
	swap	[%l7 + %i5],	%g7
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x89,	%o0
	set	0x68, %g2
	lda	[%l7 + %g2] 0x81,	%f9
	nop
	set	0x59, %i0
	ldsb	[%l7 + %i0],	%l4
	set	0x66, %g5
	stba	%o5,	[%l7 + %g5] 0xea
	membar	#Sync
	or	%g3,	%i1,	%o2
	wr	%i3,	%g1,	%softint
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	nop
	set	0x14, %l3
	lduh	[%l7 + %l3],	%o4
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i6
	st	%f9,	[%l7 + 0x0C]
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x88,	%g5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%i6
	set	0x14, %l0
	stwa	%i0,	[%l7 + %l0] 0x88
	st	%fsr,	[%l7 + 0x34]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xca
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x81,	%g2
	and	%i2,	%g6,	%l3
	set	0x0C, %g3
	sta	%f17,	[%l7 + %g3] 0x81
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	and	%o6,	%l0,	%o3
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x80,	 3
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x24, %i1
	sth	%l1,	[%l7 + %i1]
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x81,	%o1
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xea,	%l4
	st	%f29,	[%l7 + 0x34]
	set	0x40, %o2
	sta	%f0,	[%l7 + %o2] 0x80
	set	0x14, %i3
	swapa	[%l7 + %i3] 0x89,	%i4
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%i6
	st	%f29,	[%l7 + 0x44]
	nop
	set	0x68, %o5
	lduw	[%l7 + %o5],	%i5
	nop
	set	0x68, %g4
	prefetch	[%l7 + %g4],	 2
	set	0x10, %o6
	swapa	[%l7 + %o6] 0x89,	%g7
	set	0x64, %i2
	sta	%f1,	[%l7 + %i2] 0x89
	nop
	set	0x74, %g1
	ldstub	[%l7 + %g1],	%o0
	bne,pn	%xcc,	loop_35
	nop
	set	0x40, %i5
	prefetch	[%l7 + %i5],	 1
	set	0x70, %o1
	ldstuba	[%l7 + %o1] 0x89,	%l4
loop_35:
	nop
	set	0x78, %l1
	stx	%o5,	[%l7 + %l1]
	nop
	set	0x20, %g2
	std	%o6,	[%l7 + %g2]
	nop
	set	0x30, %g5
	stx	%g3,	[%l7 + %g5]
	nop
	set	0x68, %g6
	stw	%i1,	[%l7 + %g6]
	st	%f14,	[%l7 + 0x7C]
	ld	[%l7 + 0x34],	%f9
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%i3
	nop
	set	0x34, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x4C, %o7
	ldub	[%l7 + %o7],	%o2
	add	%o4,	%g1,	%g5
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x89,	%i7
	or	%l6,	%g2,	%i0
	set	0x34, %i7
	stwa	%i2,	[%l7 + %i7] 0x81
	nop
	nop
	setx	0x94160B1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x039FD172,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f19,	%f17
	set	0x0C, %l0
	sta	%f11,	[%l7 + %l0] 0x80
	set	0x20, %l2
	lda	[%l7 + %l2] 0x80,	%f22
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	set	0x08, %g3
	stda	%l2,	[%l7 + %g3] 0x89
	nop
	set	0x28, %l4
	stx	%g6,	[%l7 + %l4]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%o3
	nop
	set	0x68, %o4
	std	%g4,	[%l7 + %o4]
	set	0x72, %i6
	stha	%l1,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x38, %i1
	std	%f22,	[%l7 + %i1]
	set	0x10, %o3
	stxa	%l0,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x48, %l6
	lduw	[%l7 + %l6],	%o1
	set	0x68, %o2
	stda	%l4,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x58, %i3
	stwa	%i6,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x10, %l5
	stxa	%i4,	[%l7 + %l5] 0x80
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%i5
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x0C, %g4
	ldstub	[%l7 + %g4],	%g7
	set	0x6F, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l4
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xe3,	%o4
	nop
	set	0x44, %g1
	ldsw	[%l7 + %g1],	%o0
	nop
	set	0x22, %i2
	ldsh	[%l7 + %i2],	%o7
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x88,	 2
	nop
	nop
	setx	0x55F61EE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x2A828962,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f7,	%f17
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xcc
	add	%o2,	%o4,	%g1
	nop
	set	0x5F, %g2
	ldstub	[%l7 + %g2],	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g2
	nop
	set	0x11, %l3
	ldstub	[%l7 + %l3],	%g5
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%i2
	set	0x12, %i0
	stha	%l3,	[%l7 + %i0] 0x88
	nop
	set	0x0A, %o7
	lduh	[%l7 + %o7],	%i0
	set	0x5D, %o0
	stba	%l2,	[%l7 + %o0] 0x88
	set	0x08, %l0
	stxa	%g6,	[%l7 + %l0] 0xeb
	membar	#Sync
	fpadd32	%f12,	%f18,	%f14
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%o3
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%o6
	nop
	set	0x3C, %g3
	ldsb	[%l7 + %g3],	%l1
	and	%g4,	%l0,	%l5
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x10, %o4
	std	%f4,	[%l7 + %o4]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f0
	and	%o1,	%i4,	%i5
	nop
	set	0x0B, %i1
	ldstub	[%l7 + %i1],	%i6
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 3
	or	%g7,	%l4,	%o0
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf9
	membar	#Sync
	nop
	set	0x58, %l6
	lduh	[%l7 + %l6],	%o7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFE9, 	%tick_cmpr
	set	0x78, %o2
	lda	[%l7 + %o2] 0x80,	%f26
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x81,	%i1
	set	0x5C, %o5
	stwa	%o2,	[%l7 + %o5] 0xe3
	membar	#Sync
	wr	%o4,	%g1,	%ccr
	nop
	set	0x11, %g4
	stb	%i3,	[%l7 + %g4]
	set	0x4C, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l6
	set	0x30, %o6
	stxa	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x34, %i4
	prefetch	[%l7 + %i4],	 3
	bg,a,pn	%icc,	loop_36
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%g5
	nop
	set	0x5B, %i5
	stb	%i2,	[%l7 + %i5]
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%i7
loop_36:
	nop
	set	0x0C, %o1
	ldstub	[%l7 + %o1],	%i0
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%l2
	fpsub32s	%f2,	%f20,	%f7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%o3
	nop
	set	0x48, %i2
	lduw	[%l7 + %i2],	%l3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%g4
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x20, %g2
	sth	%o1,	[%l7 + %g2]
	nop
	set	0x70, %i0
	ldsw	[%l7 + %i0],	%i4
	set	0x0F, %o7
	stba	%l5,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x50, %o0
	stx	%fsr,	[%l7 + %o0]
	ble	%xcc,	loop_37
	nop
	set	0x08, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x19, %l0
	ldstub	[%l7 + %l0],	%i5
	and	%i6,	%l4,	%g7
loop_37:
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%f12
	nop
	set	0x64, %g3
	ldsw	[%l7 + %g3],	%o7
	add	%o5,	%g3,	%i1
	bg	%icc,	loop_38
	nop
	set	0x40, %i7
	stx	%fsr,	[%l7 + %i7]
	fpadd16	%f28,	%f10,	%f18
	nop
	set	0x74, %o4
	swap	[%l7 + %o4],	%o2
loop_38:
	be,pt	%icc,	loop_39
	nop
	set	0x68, %i6
	std	%f12,	[%l7 + %i6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%o4
loop_39:
	nop
	set	0x2D, %l2
	ldsb	[%l7 + %l2],	%g1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xe3,	%i2
	nop
	set	0x74, %l4
	swap	[%l7 + %l4],	%l6
	nop
	set	0x40, %l6
	stb	%g5,	[%l7 + %l6]
	and	%i2,	%g2,	%i7
	set	0x18, %o3
	sta	%f11,	[%l7 + %o3] 0x89
	nop
	set	0x10, %l5
	std	%f28,	[%l7 + %l5]
	set	0x74, %o5
	sta	%f15,	[%l7 + %o5] 0x80
	nop
	set	0x46, %o2
	lduh	[%l7 + %o2],	%i0
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x81,	%g6
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%l2
	add	%o3,	%l1,	%g4
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%o6
	nop
	set	0x6C, %g1
	stb	%l3,	[%l7 + %g1]
	nop
	set	0x10, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x38, %l1
	ldsh	[%l7 + %l1],	%l0
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f26
	nop
	set	0x54, %o1
	lduw	[%l7 + %o1],	%o1
	st	%f11,	[%l7 + 0x24]
	nop
	set	0x44, %i2
	sth	%l5,	[%l7 + %i2]
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%i4
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f12
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f16
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%l4
	nop
	set	0x60, %o7
	std	%i6,	[%l7 + %o7]
	set	0x34, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g7
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x48, %l0
	stxa	%o5,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%o7
	or	%i1,	%o2,	%o0
	set	0x64, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%g3
	set	0x50, %g3
	ldda	[%l7 + %g3] 0xe2,	%i6
	nop
	set	0x7E, %o4
	ldsh	[%l7 + %o4],	%g5
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xc2
	set	0x3E, %l2
	stha	%i3,	[%l7 + %l2] 0x81
	set	0x20, %i1
	stda	%g2,	[%l7 + %i1] 0x80
	nop
	set	0x22, %l4
	lduh	[%l7 + %l4],	%i2
	nop
	set	0x28, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	st	%f12,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x38, %l5
	std	%f22,	[%l7 + %l5]
	and	%i0,	%i7,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%l1
	nop
	set	0x10, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x10, %o2
	stx	%g4,	[%l7 + %o2]
	set	0x24, %l6
	swapa	[%l7 + %l6] 0x80,	%o6
	be	%icc,	loop_40
	bge	%xcc,	loop_41
	wr	%l3,	%o1,	%softint
	nop
	set	0x70, %g4
	ldsw	[%l7 + %g4],	%l0
loop_40:
	nop
	set	0x78, %i3
	stba	%l5,	[%l7 + %i3] 0x81
loop_41:
	nop
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xea,	%i4
	st	%fsr,	[%l7 + 0x28]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc2
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x80,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%i6
	set	0x54, %l1
	stwa	%o5,	[%l7 + %l1] 0x89
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x81,	%g7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xeb,	%i0
	st	%f7,	[%l7 + 0x0C]
	nop
	set	0x48, %i2
	stx	%o7,	[%l7 + %i2]
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x89,	%o0
	set	0x44, %g2
	swapa	[%l7 + %g2] 0x81,	%o2
	wr	%g1,	%o4,	%y
	nop
	set	0x0A, %o7
	lduh	[%l7 + %o7],	%l6
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x09, %g5
	ldub	[%l7 + %g5],	%g3
	nop
	set	0x6C, %g6
	ldsw	[%l7 + %g6],	%g5
	set	0x76, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g2
	nop
	set	0x68, %g7
	std	%i2,	[%l7 + %g7]
	set	0x68, %o0
	stda	%i0,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x28, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%i3
	nop
	set	0x3C, %l2
	ldsw	[%l7 + %l2],	%g6
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x54, %l4
	prefetch	[%l7 + %l4],	 1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%l1
	nop
	set	0x7C, %o4
	prefetch	[%l7 + %o4],	 0
	st	%f27,	[%l7 + 0x44]
	set	0x64, %o3
	lda	[%l7 + %o3] 0x81,	%f31
	st	%f24,	[%l7 + 0x50]
	nop
	set	0x38, %i6
	stw	%l2,	[%l7 + %i6]
	nop
	set	0x38, %l5
	lduh	[%l7 + %l5],	%o3
	or	%o6,	%l3,	%g4
	nop
	set	0x68, %o5
	std	%o0,	[%l7 + %o5]
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	nop
	set	0x30, %l6
	sth	%i5,	[%l7 + %l6]
	nop
	set	0x58, %i3
	std	%f22,	[%l7 + %i3]
	set	0x30, %g4
	lda	[%l7 + %g4] 0x80,	%f12
	set	0x66, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l5
	set	0x10, %g1
	stxa	%l4,	[%l7 + %g1] 0x81
	nop
	set	0x30, %o6
	lduw	[%l7 + %o6],	%i4
	set	0x28, %o1
	stda	%o4,	[%l7 + %o1] 0x88
	set	0x5C, %l1
	stwa	%g7,	[%l7 + %l1] 0x80
	set	0x3E, %i2
	stba	%i1,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f30
	nop
	set	0x44, %g2
	stw	%o7,	[%l7 + %g2]
	nop
	set	0x18, %o7
	stx	%o0,	[%l7 + %o7]
	fpsub32s	%f30,	%f20,	%f19
	nop
	set	0x34, %l3
	stw	%i6,	[%l7 + %l3]
	set	0x28, %g6
	stda	%o2,	[%l7 + %g6] 0xeb
	membar	#Sync
	st	%f15,	[%l7 + 0x3C]
	nop
	set	0x78, %g5
	swap	[%l7 + %g5],	%g1
	nop
	set	0x24, %g7
	stw	%o4,	[%l7 + %g7]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f4
	add	%l6,	%g3,	%g5
	set	0x5C, %l0
	stha	%i2,	[%l7 + %l0] 0xeb
	membar	#Sync
	ld	[%l7 + 0x70],	%f12
	nop
	set	0x5C, %g3
	swap	[%l7 + %g3],	%i0
	nop
	set	0x52, %i0
	ldstub	[%l7 + %i0],	%g2
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x46, %l2
	ldstuba	[%l7 + %l2] 0x88,	%g6
	nop
	set	0x40, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x32, %i1
	stb	%i7,	[%l7 + %i1]
	set	0x36, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l1
	nop
	set	0x3C, %l5
	swap	[%l7 + %l5],	%i3
	nop
	set	0x58, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%o6
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x42, %l6
	ldsh	[%l7 + %l6],	%l3
	nop
	set	0x35, %g4
	ldsb	[%l7 + %g4],	%o3
	nop
	set	0x14, %i4
	lduh	[%l7 + %i4],	%o1
	nop
	set	0x08, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x58, %g1
	std	%f22,	[%l7 + %g1]
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%l0
	nop
	set	0x60, %l1
	stw	%g4,	[%l7 + %l1]
	nop
	set	0x18, %o6
	ldub	[%l7 + %o6],	%i5
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f4
	st	%f29,	[%l7 + 0x50]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%o5
	nop
	set	0x7E, %g2
	ldsh	[%l7 + %g2],	%i1
	nop
	set	0x5B, %i2
	ldub	[%l7 + %i2],	%g7
	nop
	set	0x10, %o7
	lduw	[%l7 + %o7],	%o7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f16
	set	0x4D, %g5
	stba	%o0,	[%l7 + %g5] 0xe3
	membar	#Sync
	ld	[%l7 + 0x3C],	%f5
	wr	%i6,	%g1,	%clear_softint
	or	%o4,	%o2,	%g3
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x80,	 3
	fpadd16s	%f5,	%f4,	%f2
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f30
	st	%f11,	[%l7 + 0x28]
	or	%l6,	%i0,	%i2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x88
	set	0x7C, %o0
	sta	%f1,	[%l7 + %o0] 0x81
	set	0x08, %i0
	stxa	%g2,	[%l7 + %i0] 0xe2
	membar	#Sync
	ld	[%l7 + 0x14],	%f2
	fpsub16	%f2,	%f14,	%f8
	set	0x50, %i7
	swapa	[%l7 + %i7] 0x80,	%g6
	nop
	set	0x28, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x58, %l4
	lda	[%l7 + %l4] 0x89,	%f20
	and	%l1,	%i3,	%l2
	set	0x7A, %g3
	stha	%i7,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x14, %i1
	ldstub	[%l7 + %i1],	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%l3
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x88,	 4
	add	%g4,	%l0,	%l5
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x88,	%i5
	set	0x11, %l5
	stba	%i4,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x58, %o5
	stda	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd2
	nop
	set	0x46, %l6
	ldub	[%l7 + %l6],	%i1
	set	0x28, %g4
	stxa	%g7,	[%l7 + %g4] 0x88
	set	0x7C, %i4
	stha	%o7,	[%l7 + %i4] 0x81
	and	%l4,	%i6,	%o0
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%o4
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x88,	%g1
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%g3
	set	0x1C, %o1
	ldstuba	[%l7 + %o1] 0x81,	%o2
	or	%l6,	%g5,	%i2
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x80,	%g2
	or	%i0,	%l1,	%i3
	fpadd16	%f10,	%f12,	%f16
	nop
	set	0x4D, %l1
	ldsb	[%l7 + %l1],	%l2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%g6
	nop
	set	0x22, %i2
	ldstub	[%l7 + %i2],	%i7
	set	0x29, %g2
	stba	%o3,	[%l7 + %g2] 0x89
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x80,	%l3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%g4
	nop
	set	0x34, %o7
	ldub	[%l7 + %o7],	%l0
	set	0x2C, %g5
	lda	[%l7 + %g5] 0x81,	%f22
	add	%o6,	%l5,	%i5
	set	0x24, %g7
	stha	%i4,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x1C, %l3
	swap	[%l7 + %l3],	%i1
	nop
	set	0x30, %l0
	ldsw	[%l7 + %l0],	%o5
	set	0x44, %i0
	sta	%f26,	[%l7 + %i0] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%l4
	nop
	nop
	setx	0x1E19DF303337195A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x57427A4EE0C9B310,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f20,	%f4
	nop
	set	0x64, %i7
	ldsh	[%l7 + %i7],	%i6
	set	0x53, %l2
	stba	%o7,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x81,	%o0
	set	0x10, %o0
	stxa	%g1,	[%l7 + %o0] 0x88
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%o2
	st	%f19,	[%l7 + 0x50]
	nop
	set	0x58, %i1
	swap	[%l7 + %i1],	%l6
	set	0x08, %g3
	stda	%g2,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x38, %o3
	sta	%f2,	[%l7 + %o3] 0x89
	set	0x5A, %l5
	stha	%g5,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%i2
	nop
	set	0x6C, %o5
	ldsb	[%l7 + %o5],	%g2
	fpsub16s	%f18,	%f17,	%f17
	st	%fsr,	[%l7 + 0x50]
	set	0x28, %l6
	ldxa	[%l7 + %l6] 0x88,	%l1
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%i3
	nop
	set	0x48, %i4
	ldsh	[%l7 + %i4],	%i0
	st	%fsr,	[%l7 + 0x24]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf1
	membar	#Sync
	nop
	set	0x4C, %i3
	sth	%g6,	[%l7 + %i3]
	nop
	set	0x7E, %g1
	ldsb	[%l7 + %g1],	%i7
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%o2
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%o1
	and	%g4,	%o6,	%l0
	nop
	set	0x2D, %o2
	ldub	[%l7 + %o2],	%l5
	set	0x44, %l1
	stba	%i4,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x1C, %i5
	lduw	[%l7 + %i5],	%i1
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%i4
	nop
	set	0x62, %g2
	sth	%o5,	[%l7 + %g2]
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	or	%l4,	%i6,	%o7
	nop
	set	0x3C, %o7
	swap	[%l7 + %o7],	%o0
	set	0x6E, %g7
	stha	%g7,	[%l7 + %g7] 0x89
	nop
	set	0x40, %g5
	lduw	[%l7 + %g5],	%o4
	nop
	set	0x12, %l0
	lduh	[%l7 + %l0],	%g1
	nop
	set	0x68, %i0
	ldsw	[%l7 + %i0],	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g5
	nop
	set	0x18, %l3
	swap	[%l7 + %l3],	%i2
	set	0x30, %i7
	swapa	[%l7 + %i7] 0x81,	%g3
	nop
	set	0x08, %l2
	lduw	[%l7 + %l2],	%l1
	nop
	set	0x5C, %o0
	ldsh	[%l7 + %o0],	%g2
	nop
	set	0x48, %l4
	std	%f8,	[%l7 + %l4]
	nop
	set	0x20, %g3
	std	%f0,	[%l7 + %g3]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f16
	nop
	set	0x74, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x30, %o4
	sta	%f0,	[%l7 + %o4] 0x80
	set	0x10, %o5
	swapa	[%l7 + %o5] 0x81,	%g6
	nop
	set	0x4A, %l6
	ldsb	[%l7 + %l6],	%o3
	bne	%icc,	loop_42
	bg	%xcc,	loop_43
	nop
	set	0x28, %i1
	std	%i6,	[%l7 + %i1]
	nop
	set	0x08, %i4
	std	%l2,	[%l7 + %i4]
loop_42:
	nop
	set	0x22, %g4
	ldsb	[%l7 + %g4],	%l2
loop_43:
	nop
	set	0x50, %i3
	ldx	[%l7 + %i3],	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%g4
	nop
	set	0x18, %i6
	std	%l0,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x48]
	and	%i4,	%i1,	%l5
	nop
	set	0x44, %o1
	ldub	[%l7 + %o1],	%o5
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%l4
	add	%i5,	%o7,	%o0
	nop
	set	0x70, %g1
	stw	%i6,	[%l7 + %g1]
	nop
	set	0x52, %o2
	ldstub	[%l7 + %o2],	%g7
	nop
	set	0x08, %l1
	ldsh	[%l7 + %l1],	%o4
	set	0x3C, %i2
	stwa	%l6,	[%l7 + %i2] 0x81
	set	0x68, %i5
	lda	[%l7 + %i5] 0x88,	%f20
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%o2
	add	%g1,	%i2,	%g5
	ld	[%l7 + 0x64],	%f23
	nop
	set	0x50, %g2
	lduh	[%l7 + %g2],	%l1
	set	0x6A, %o7
	ldstuba	[%l7 + %o7] 0x88,	%g3
	set	0x38, %g7
	stxa	%i3,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x25, %g5
	stba	%g2,	[%l7 + %g5] 0xeb
	membar	#Sync
	and	%i0,	%o3,	%g6
	st	%f6,	[%l7 + 0x60]
	set	0x50, %i0
	stwa	%l3,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%i6
	st	%f28,	[%l7 + 0x3C]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%o6
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%o1
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%g4
	nop
	set	0x40, %o0
	std	%f10,	[%l7 + %o0]
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xea,	%l0
	set	0x71, %g3
	ldstuba	[%l7 + %g3] 0x88,	%i1
	nop
	set	0x24, %o3
	sth	%i4,	[%l7 + %o3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l4
	set	0x28, %l4
	stxa	%i5,	[%l7 + %l4] 0x88
	nop
	set	0x48, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x1E, %l5
	sth	%o7,	[%l7 + %l5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	wr	%i6,	%g7,	%sys_tick
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x88,	%l6
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x88,	 1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%o4
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x88,	 2
	nop
	set	0x70, %g4
	ldx	[%l7 + %g4],	%l1
	nop
	set	0x1C, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x54, %i6
	ldsw	[%l7 + %i6],	%g5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%g2
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x81,	%i2
	nop
	set	0x2C, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%i0
	ld	[%l7 + 0x2C],	%f11
	nop
	set	0x2A, %g1
	ldsh	[%l7 + %g1],	%g6
	st	%f19,	[%l7 + 0x08]
	nop
	set	0x48, %l1
	std	%o2,	[%l7 + %l1]
	nop
	set	0x14, %i2
	stw	%l3,	[%l7 + %i2]
	nop
	set	0x34, %o2
	ldsb	[%l7 + %o2],	%l2
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x88,	%o6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x18, %i5
	ldub	[%l7 + %i5],	%o1
	nop
	set	0x1C, %g2
	stw	%i7,	[%l7 + %g2]
	nop
	set	0x28, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x38, %g7
	lduw	[%l7 + %g7],	%g4
	nop
	set	0x45, %g5
	ldub	[%l7 + %g5],	%l0
	set	0x48, %i0
	stda	%i0,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x7E, %l0
	sth	%i4,	[%l7 + %l0]
	nop
	set	0x58, %l2
	ldsw	[%l7 + %l2],	%l5
	nop
	set	0x6C, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x89,	%l4
	and	%i5,	%o5,	%o7
	set	0x58, %i7
	sta	%f26,	[%l7 + %i7] 0x89
	and	%o0,	%i6,	%g7
	st	%f21,	[%l7 + 0x50]
	nop
	set	0x46, %o3
	ldsh	[%l7 + %o3],	%o2
	set	0x38, %l4
	stxa	%l6,	[%l7 + %l4] 0xeb
	membar	#Sync
	fpsub16	%f10,	%f28,	%f12
	bl	%icc,	loop_44
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%g1
	nop
	set	0x71, %l5
	ldub	[%l7 + %l5],	%i2
	nop
	nop
	setx	0xFBCDC7C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x8540A3BF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f22,	%f22
loop_44:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB38, 	%tick_cmpr
	wr	%g3,	%o4,	%softint
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%g2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%i0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f0
	nop
	set	0x30, %o4
	ldsw	[%l7 + %o4],	%o3
	set	0x10, %g4
	stwa	%g6,	[%l7 + %g4] 0xe2
	membar	#Sync
	fpsub32	%f16,	%f0,	%f24
	add	%l3,	%l2,	%o6
	set	0x10, %i3
	stda	%i6,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x80,	%g4
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f8
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%o1
	ld	[%l7 + 0x68],	%f13
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%l0
	set	0x38, %o6
	stxa	%l5,	[%l7 + %o6] 0xe3
	membar	#Sync
	bgu,pn	%xcc,	loop_45
	or	%i4,	%i5,	%l4
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%o7
	nop
	set	0x70, %l1
	lduw	[%l7 + %l1],	%o5
loop_45:
	nop
	set	0x1C, %i2
	lda	[%l7 + %i2] 0x88,	%f14
	st	%f26,	[%l7 + 0x44]
	set	0x44, %g1
	lda	[%l7 + %g1] 0x81,	%f16
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%o0
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x88,	%g7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%o2
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f18
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xe3,	%g0
	nop
	set	0x0A, %o2
	ldsb	[%l7 + %o2],	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g5
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	and	%g3,	%o4,	%g2
	set	0x50, %i0
	sta	%f28,	[%l7 + %i0] 0x80
	or	%l1,	%i0,	%o3
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd2
	nop
	set	0x1E, %l2
	ldsb	[%l7 + %l2],	%i3
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%f26
	set	0x5C, %i7
	lda	[%l7 + %i7] 0x89,	%f24
	nop
	set	0x67, %o3
	ldub	[%l7 + %o3],	%l3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x0E, %l4
	ldstub	[%l7 + %l4],	%g6
	set	0x50, %l5
	stwa	%l2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%o6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc2
	and	%i7,	%g4,	%o1
	nop
	set	0x4E, %i1
	ldsb	[%l7 + %i1],	%i1
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%l0
	set	0x1C, %i3
	sta	%f2,	[%l7 + %i3] 0x81
	set	0x4D, %i4
	stba	%l5,	[%l7 + %i4] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%i4
	nop
	set	0x6C, %i6
	stw	%o7,	[%l7 + %i6]
	nop
	set	0x28, %o6
	stx	%o5,	[%l7 + %o6]
	nop
	set	0x69, %o4
	ldsb	[%l7 + %o4],	%o0
	nop
	set	0x32, %o1
	lduh	[%l7 + %o1],	%g7
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%i6
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%l4
	nop
	set	0x6C, %i2
	ldub	[%l7 + %i2],	%g1
	nop
	set	0x38, %g6
	std	%f6,	[%l7 + %g6]
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x60, %o7
	stw	%i2,	[%l7 + %o7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%g3
	set	0x2A, %o2
	stha	%o4,	[%l7 + %o2] 0x81
	nop
	set	0x0E, %i5
	sth	%l6,	[%l7 + %i5]
	nop
	set	0x20, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x1B, %g7
	ldstub	[%l7 + %g7],	%l1
	nop
	set	0x68, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x3D, %l2
	ldub	[%l7 + %l2],	%i0
	nop
	set	0x0C, %l0
	ldsw	[%l7 + %l0],	%g2
	st	%f17,	[%l7 + 0x30]
	set	0x40, %l3
	stxa	%o3,	[%l7 + %l3] 0x89
	nop
	set	0x70, %i7
	ldx	[%l7 + %i7],	%i3
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%l3
	set	0x58, %l4
	stxa	%g6,	[%l7 + %l4] 0x89
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc2
	wr	%o6,	%i7,	%set_softint
	nop
	set	0x18, %g3
	std	%g4,	[%l7 + %g3]
	set	0x78, %o0
	lda	[%l7 + %o0] 0x89,	%f18
	nop
	set	0x24, %o5
	stw	%l2,	[%l7 + %o5]
	nop
	set	0x3A, %i1
	ldsh	[%l7 + %i1],	%i1
	fpsub32s	%f14,	%f10,	%f3
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	nop
	set	0x70, %i3
	std	%f26,	[%l7 + %i3]
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x81,	%l0
	wr 	%g0, 	0x6, 	%fprs
	set	0x6B, %i4
	stba	%i5,	[%l7 + %i4] 0x80
	nop
	set	0x34, %o6
	stb	%o7,	[%l7 + %o6]
	nop
	set	0x0C, %i6
	ldstub	[%l7 + %i6],	%o5
	set	0x36, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i4
	nop
	set	0x08, %l1
	ldx	[%l7 + %l1],	%o0
	nop
	set	0x58, %g1
	ldstub	[%l7 + %g1],	%i6
	add	%l4,	%g1,	%g7
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f0
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	nop
	set	0x1C, %g2
	swap	[%l7 + %g2],	%o2
	set	0x2C, %o4
	lda	[%l7 + %o4] 0x81,	%f18
	nop
	set	0x26, %o7
	ldstub	[%l7 + %o7],	%i2
	st	%f27,	[%l7 + 0x10]
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f30
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%g3
	nop
	set	0x5A, %i5
	ldsh	[%l7 + %i5],	%o4
	nop
	set	0x34, %i0
	prefetch	[%l7 + %i0],	 0
	set	0x10, %g7
	lda	[%l7 + %g7] 0x81,	%f18
	nop
	set	0x26, %l0
	lduh	[%l7 + %l0],	%l6
	set	0x71, %l2
	stba	%g5,	[%l7 + %l2] 0x81
	set	0x3C, %l3
	swapa	[%l7 + %l3] 0x80,	%l1
	st	%f30,	[%l7 + 0x34]
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	nop
	set	0x76, %o3
	lduh	[%l7 + %o3],	%o3
	set	0x28, %l4
	stwa	%i3,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x68, %l5
	stwa	%l3,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x1A, %o0
	stha	%g6,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x58, %g3
	stwa	%o6,	[%l7 + %g3] 0x88
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f30
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xda
	nop
	set	0x48, %i3
	std	%f16,	[%l7 + %i3]
	nop
	set	0x28, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x24, %g4
	lduw	[%l7 + %g4],	%g4
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x68, %i4
	stx	%l0,	[%l7 + %i4]
	nop
	set	0x08, %o6
	ldub	[%l7 + %o6],	%o1
	nop
	set	0x38, %i6
	swap	[%l7 + %i6],	%i1
	set	0x10, %l1
	stda	%l4,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%i5
	set	0x70, %o1
	stda	%o6,	[%l7 + %o1] 0xe2
	membar	#Sync
	add	%i4,	%o0,	%i6
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf1
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%g1
	ld	[%l7 + 0x68],	%f22
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
	set	0x08, %o4
	stxa	%o5,	[%l7 + %o4] 0x80
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x81,	%g7
	nop
	set	0x5E, %o2
	ldstub	[%l7 + %o2],	%o2
	ld	[%l7 + 0x4C],	%f12
	nop
	set	0x30, %g5
	swap	[%l7 + %g5],	%i2
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x89,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%l6
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%g5
	set	0x40, %i0
	stda	%i0,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x78, %g7
	stxa	%l1,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x80,	%o3
	nop
	set	0x50, %l0
	ldsh	[%l7 + %l0],	%l3
	st	%f24,	[%l7 + 0x14]
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x89,	%g6
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%o6
	nop
	set	0x40, %l4
	std	%i2,	[%l7 + %l4]
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xe2,	%i6
	nop
	set	0x60, %l5
	stx	%g4,	[%l7 + %l5]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xcc
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%l0
	ld	[%l7 + 0x0C],	%f29
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x80,	%g2
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x38, %o5
	std	%o0,	[%l7 + %o5]
	set	0x24, %i3
	sta	%f5,	[%l7 + %i3] 0x81
	set	0x28, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	ld	[%l7 + 0x58],	%f23
	set	0x30, %g4
	sta	%f11,	[%l7 + %g4] 0x81
	and	%i1,	%o7,	%i5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%i6
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f30
	nop
	set	0x62, %i4
	sth	%i4,	[%l7 + %i4]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
	nop
	set	0x1C, %l1
	swap	[%l7 + %l1],	%g1
	nop
	set	0x12, %i6
	stb	%l4,	[%l7 + %i6]
	add	%o5,	%o2,	%i2
	and	%o4,	%g3,	%l6
	set	0x08, %o1
	stxa	%g5,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x66, %i2
	ldsh	[%l7 + %i2],	%g7
	nop
	set	0x64, %g2
	stw	%l1,	[%l7 + %g2]
	set	0x16, %g1
	stha	%i0,	[%l7 + %g1] 0x88
	set	0x48, %g6
	stda	%o2,	[%l7 + %g6] 0x81
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%l3
	set	0x30, %o2
	lda	[%l7 + %o2] 0x89,	%f24
	nop
	set	0x48, %o4
	std	%f10,	[%l7 + %o4]
	nop
	set	0x46, %i5
	lduh	[%l7 + %i5],	%i3
	nop
	set	0x64, %g5
	stw	%i7,	[%l7 + %g5]
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x88,	%o6
	or	%l2,	%l0,	%g4
	nop
	set	0x40, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x1C, %g7
	ldsb	[%l7 + %g7],	%o1
	nop
	set	0x60, %l0
	std	%i0,	[%l7 + %l0]
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f16
	and	%o7,	%i5,	%o0
	nop
	set	0x2F, %i7
	ldstub	[%l7 + %i7],	%l5
	or	%i4,	%g1,	%i6
	nop
	set	0x1A, %l4
	lduh	[%l7 + %l4],	%o5
	or	%o2,	%l4,	%o4
	set	0x3C, %l2
	stwa	%g3,	[%l7 + %l2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x28],	%f26
	set	0x28, %l5
	lda	[%l7 + %l5] 0x81,	%f17
	set	0x78, %o0
	lda	[%l7 + %o0] 0x80,	%f26
	nop
	set	0x4C, %o3
	ldsh	[%l7 + %o3],	%l6
	nop
	set	0x78, %g3
	sth	%i2,	[%l7 + %g3]
	nop
	set	0x4C, %o5
	ldub	[%l7 + %o5],	%g7
	or	%g5,	%l1,	%i0
	nop
	set	0x0E, %i3
	stb	%g6,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x48]
	set	0x68, %l6
	lda	[%l7 + %l6] 0x81,	%f28
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x88,	%l3
	nop
	set	0x4A, %i4
	ldsh	[%l7 + %i4],	%o3
	nop
	set	0x3A, %o6
	lduh	[%l7 + %o6],	%i7
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%o6
	nop
	set	0x48, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x1C, %o1
	stwa	%i3,	[%l7 + %o1] 0x81
	nop
	set	0x0D, %i2
	ldsb	[%l7 + %i2],	%l2
	nop
	set	0x35, %g2
	ldub	[%l7 + %g2],	%g4
	set	0x10, %i6
	stxa	%g2,	[%l7 + %i6] 0xeb
	membar	#Sync
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%i1
	nop
	set	0x58, %g6
	stw	%o1,	[%l7 + %g6]
	set	0x70, %g1
	stwa	%o7,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x14, %o2
	lduh	[%l7 + %o2],	%i5
	nop
	set	0x68, %i5
	std	%f0,	[%l7 + %i5]
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%o0
	nop
	set	0x60, %i0
	prefetch	[%l7 + %i0],	 3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%o5
	nop
	set	0x4B, %o7
	stb	%o2,	[%l7 + %o7]
	set	0x2C, %g7
	stha	%g1,	[%l7 + %g7] 0x88
	ld	[%l7 + 0x38],	%f23
	or	%o4,	%g3,	%l6
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x80,	 1
	nop
	set	0x78, %l0
	std	%f20,	[%l7 + %l0]
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%l4
	nop
	set	0x50, %l4
	ldx	[%l7 + %l4],	%g5
	nop
	set	0x70, %l2
	stx	%fsr,	[%l7 + %l2]
	be,a	%xcc,	loop_46
	nop
	set	0x5E, %l5
	ldub	[%l7 + %l5],	%l1
	ld	[%l7 + 0x6C],	%f27
	and	%i0,	%g6,	%l3
loop_46:
	nop
	set	0x18, %i7
	stda	%g6,	[%l7 + %i7] 0x80
	set	0x08, %o3
	stba	%o3,	[%l7 + %o3] 0xeb
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%i3
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f26
	set	0x30, %o5
	stxa	%l2,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f2
	nop
	nop
	setx	0xEE4B2EF6FA0558AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x654EFFAB21C489A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f30
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%g4
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f16
	nop
	set	0x12, %g4
	lduh	[%l7 + %g4],	%g2
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%l0
	set	0x14, %o6
	stwa	%i1,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x66, %l1
	stha	%i7,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x74, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x58, %i2
	ldxa	[%l7 + %i2] 0x88,	%o1
	nop
	set	0x6F, %g2
	ldstub	[%l7 + %g2],	%i5
	set	0x5A, %i6
	stha	%o0,	[%l7 + %i6] 0x88
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc8
	set	0x68, %g1
	stda	%o6,	[%l7 + %g1] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x89,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%i6
	nop
	set	0x78, %i5
	std	%o4,	[%l7 + %i5]
	nop
	set	0x48, %g5
	ldub	[%l7 + %g5],	%o2
	nop
	set	0x65, %g6
	ldsb	[%l7 + %g6],	%g1
	nop
	set	0x50, %i0
	stb	%g3,	[%l7 + %i0]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf1
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x1A, %g7
	lduh	[%l7 + %g7],	%l6
	set	0x21, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o4
	nop
	set	0x28, %l3
	sth	%i2,	[%l7 + %l3]
	or	%g5,	%l1,	%i0
	fpadd32s	%f5,	%f21,	%f31
	set	0x0C, %o4
	stba	%l4,	[%l7 + %o4] 0x81
	or	%l3,	%g7,	%o3
	nop
	set	0x38, %l2
	std	%o6,	[%l7 + %l2]
	set	0x69, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g6
	set	0x36, %l4
	ldstuba	[%l7 + %l4] 0x89,	%l2
	nop
	set	0x58, %i7
	std	%f18,	[%l7 + %i7]
	fpadd16s	%f30,	%f12,	%f3
	set	0x68, %o0
	stwa	%g4,	[%l7 + %o0] 0x88
	nop
	set	0x50, %o5
	std	%f26,	[%l7 + %o5]
	nop
	set	0x7F, %o3
	ldstub	[%l7 + %o3],	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%i1
	nop
	set	0x72, %g3
	ldstub	[%l7 + %g3],	%l0
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%o0
	nop
	set	0x08, %g4
	std	%f20,	[%l7 + %g4]
	nop
	set	0x18, %l6
	ldsh	[%l7 + %l6],	%i5
	nop
	set	0x2D, %o6
	ldstub	[%l7 + %o6],	%o0
	set	0x18, %l1
	stda	%i6,	[%l7 + %l1] 0xea
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%i4
	set	0x18, %i4
	stda	%i6,	[%l7 + %i4] 0x81
	set	0x61, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o5
	set	0x38, %i2
	lda	[%l7 + %i2] 0x81,	%f30
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%l5
	nop
	set	0x08, %g2
	std	%f24,	[%l7 + %g2]
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f20
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x81,	 4
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%l6
	set	0x34, %i5
	swapa	[%l7 + %i5] 0x80,	%g3
	st	%f15,	[%l7 + 0x10]
	nop
	set	0x70, %g5
	std	%o4,	[%l7 + %g5]
	or	%g5,	%l1,	%i0
	nop
	set	0x5D, %o2
	ldstub	[%l7 + %o2],	%l4
	add	%l3,	%i2,	%o3
	set	0x2F, %i0
	ldstuba	[%l7 + %i0] 0x81,	%o6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd0
	set	0x38, %g7
	lda	[%l7 + %g7] 0x80,	%f20
	set	0x7E, %l0
	stha	%g7,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x58, %o7
	sta	%f3,	[%l7 + %o7] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%g4
	set	0x52, %l3
	stha	%i3,	[%l7 + %l3] 0x88
	nop
	set	0x70, %l2
	stx	%g2,	[%l7 + %l2]
	set	0x08, %o4
	stda	%i0,	[%l7 + %o4] 0x89
	nop
	set	0x20, %l4
	std	%f18,	[%l7 + %l4]
	ld	[%l7 + 0x28],	%f21
	set	0x34, %l5
	sta	%f29,	[%l7 + %l5] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%g6
	set	0x24, %i7
	sta	%f20,	[%l7 + %i7] 0x81
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x4C, %o5
	ldsw	[%l7 + %o5],	%o1
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x89,	%f20
	set	0x08, %g3
	lda	[%l7 + %g3] 0x81,	%f30
	nop
	set	0x60, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	nop
	set	0x6C, %l6
	lduh	[%l7 + %l6],	%i7
	nop
	set	0x50, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x18, %o6
	ldsw	[%l7 + %o6],	%o7
	set	0x1C, %i4
	stwa	%i4,	[%l7 + %i4] 0x88
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%o0
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x7D, %i1
	ldub	[%l7 + %i1],	%o5
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x81,	 4
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f0
	add	%i6,	%g1,	%l5
	set	0x30, %i2
	lda	[%l7 + %i2] 0x88,	%f27
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x24, %i5
	sta	%f0,	[%l7 + %i5] 0x81
	nop
	set	0x1C, %g5
	stw	%g3,	[%l7 + %g5]
	nop
	set	0x50, %o2
	stx	%l6,	[%l7 + %o2]
	fpadd16	%f18,	%f28,	%f20
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	nop
	set	0x48, %i6
	stw	%l1,	[%l7 + %i6]
	nop
	set	0x30, %g6
	stx	%i0,	[%l7 + %g6]
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%l4
	nop
	set	0x58, %o7
	ldstub	[%l7 + %o7],	%o4
	nop
	set	0x66, %l0
	stb	%i2,	[%l7 + %l0]
	fpadd32	%f24,	%f16,	%f18
	set	0x64, %l2
	lda	[%l7 + %l2] 0x89,	%f9
	set	0x14, %l3
	stwa	%l3,	[%l7 + %l3] 0x89
	nop
	set	0x48, %o4
	stw	%o3,	[%l7 + %o4]
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x52, %i7
	ldub	[%l7 + %i7],	%g7
	st	%f4,	[%l7 + 0x54]
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%l2
	nop
	set	0x1B, %o0
	stb	%i3,	[%l7 + %o0]
	add	%g4,	%i1,	%g2
	st	%fsr,	[%l7 + 0x54]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%o1
	nop
	set	0x3E, %g3
	sth	%g6,	[%l7 + %g3]
	st	%f22,	[%l7 + 0x30]
	nop
	set	0x4C, %g4
	ldsh	[%l7 + %g4],	%i5
	set	0x70, %l6
	sta	%f26,	[%l7 + %l6] 0x89
	set	0x78, %o3
	stda	%o6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%i4
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%o2
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f26
	nop
	set	0x54, %i1
	stw	%i6,	[%l7 + %i1]
	set	0x38, %l1
	stxa	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x1C, %o1
	swapa	[%l7 + %o1] 0x88,	%l5
	add	%g1,	%l6,	%g5
	st	%f28,	[%l7 + 0x44]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf1
	membar	#Sync
	set	0x50, %g1
	stxa	%g3,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x0C, %g2
	stha	%i0,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf8
	membar	#Sync
	nop
	set	0x2A, %i5
	ldub	[%l7 + %i5],	%l4
	or	%o4,	%l1,	%i2
	set	0x2D, %i0
	stba	%o3,	[%l7 + %i0] 0x89
	nop
	set	0x54, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xeb,	%l2
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f10
	set	0x44, %o7
	lda	[%l7 + %o7] 0x89,	%f23
	nop
	set	0x50, %g7
	stx	%g7,	[%l7 + %g7]
	nop
	set	0x68, %l0
	std	%l2,	[%l7 + %l0]
	nop
	set	0x1E, %l2
	lduh	[%l7 + %l2],	%i3
	set	0x44, %l3
	swapa	[%l7 + %l3] 0x80,	%o6
	nop
	set	0x4C, %o4
	stb	%g4,	[%l7 + %o4]
	nop
	set	0x28, %l5
	std	%i0,	[%l7 + %l5]
	set	0x20, %i7
	stda	%l0,	[%l7 + %i7] 0x89
	nop
	set	0x70, %l4
	stx	%o1,	[%l7 + %l4]
	nop
	set	0x18, %o0
	ldx	[%l7 + %o0],	%g6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd0,	%f0
	set	0x7C, %g4
	stwa	%g2,	[%l7 + %g4] 0x81
	nop
	set	0x30, %l6
	std	%f14,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x08, %o5
	sth	%o7,	[%l7 + %o5]
	set	0x30, %o3
	stxa	%i7,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x30, %o6
	swap	[%l7 + %o6],	%i5
	nop
	set	0x58, %i4
	sth	%i4,	[%l7 + %i4]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf0
	membar	#Sync
	nop
	set	0x48, %i1
	lduh	[%l7 + %i1],	%o2
	set	0x50, %o1
	sta	%f22,	[%l7 + %o1] 0x88
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%i6
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f28
	nop
	set	0x10, %i2
	lduw	[%l7 + %i2],	%o5
	nop
	set	0x38, %g1
	std	%g0,	[%l7 + %g1]
	and	%l6,	%l5,	%g3
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x1C, %g5
	ldub	[%l7 + %g5],	%i0
	add	%g5,	%l4,	%o4
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x70, %i5
	std	%l0,	[%l7 + %i5]
	st	%f12,	[%l7 + 0x64]
	nop
	set	0x4C, %i0
	ldub	[%l7 + %i0],	%o3
	and	%i2,	%l3,	%l2
	nop
	set	0x13, %g2
	ldub	[%l7 + %g2],	%i3
	st	%f11,	[%l7 + 0x08]
	set	0x78, %i6
	sta	%f28,	[%l7 + %i6] 0x89
	ld	[%l7 + 0x58],	%f23
	set	0x18, %g6
	stwa	%g7,	[%l7 + %g6] 0x81
	set	0x40, %o2
	stha	%o6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xd8
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%g4
	add	%i1,	%o1,	%l0
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xea,	%g6
	nop
	set	0x1C, %l3
	stw	%g2,	[%l7 + %l3]
	set	0x48, %l2
	stda	%i6,	[%l7 + %l2] 0xe3
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%o0
	and	%i6,	%o2,	%o5
	st	%f1,	[%l7 + 0x2C]
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf1,	%f16
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x81,	%l6
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	set	0x7C, %o0
	stha	%g3,	[%l7 + %o0] 0xea
	membar	#Sync
	st	%f25,	[%l7 + 0x28]
	nop
	set	0x18, %g3
	stx	%i0,	[%l7 + %g3]
	or	%g5,	%g1,	%o4
	nop
	set	0x58, %g4
	swap	[%l7 + %g4],	%l4
	set	0x0C, %l6
	stwa	%o3,	[%l7 + %l6] 0xe3
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%l1
	nop
	set	0x52, %l4
	sth	%l2,	[%l7 + %l4]
	and	%i3,	%l3,	%g7
	nop
	set	0x44, %o3
	stw	%o6,	[%l7 + %o3]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	bne,a	%icc,	loop_47
	nop
	set	0x74, %i4
	swap	[%l7 + %i4],	%i1
	nop
	set	0x4C, %o5
	ldsh	[%l7 + %o5],	%g4
	nop
	set	0x20, %i1
	ldsw	[%l7 + %i1],	%l0
loop_47:
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%g6
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x81,	%f24
	set	0x4A, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g2
	nop
	set	0x3C, %i2
	ldsb	[%l7 + %i2],	%o1
	nop
	set	0x1C, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x89,	%i7
	set	0x30, %i0
	stxa	%o7,	[%l7 + %i0] 0x89
	nop
	set	0x57, %g1
	ldub	[%l7 + %g1],	%i4
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	nop
	setx	0x4DA13F42F27E6E76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBAD05E6D681CFAF8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f24,	%f24
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x88,	%i5
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	fpadd32s	%f30,	%f22,	%f25
	set	0x50, %g6
	stda	%o0,	[%l7 + %g6] 0xeb
	membar	#Sync
	and	%o2,	%o5,	%l6
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x80,	 4
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x80,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%l5
	wr	%g5,	%o4,	%pic
	nop
	set	0x50, %l2
	std	%l4,	[%l7 + %l2]
	set	0x70, %o4
	stxa	%o3,	[%l7 + %o4] 0x88
	or	%i2,	%g1,	%l1
	nop
	set	0x18, %l0
	lduw	[%l7 + %l0],	%i3
	nop
	set	0x70, %i7
	stx	%fsr,	[%l7 + %i7]
	wr	%l2,	%l3,	%set_softint
	nop
	set	0x5A, %o0
	lduh	[%l7 + %o0],	%g7
	nop
	set	0x7C, %g3
	ldsh	[%l7 + %g3],	%i1
	nop
	set	0x4C, %g4
	stw	%o6,	[%l7 + %g4]
	st	%f29,	[%l7 + 0x48]
	nop
	set	0x20, %l6
	stw	%l0,	[%l7 + %l6]
	nop
	set	0x68, %l5
	std	%f6,	[%l7 + %l5]
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f6
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x81,	%f27
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 2
	fpsub16s	%f23,	%f16,	%f18
	set	0x74, %o5
	stwa	%g6,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%g4
	set	0x68, %i1
	stxa	%g2,	[%l7 + %i1] 0x88
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%o0
	nop
	set	0x18, %i3
	lduw	[%l7 + %i3],	%o7
	nop
	set	0x7B, %i2
	ldub	[%l7 + %i2],	%i4
	nop
	set	0x74, %g5
	ldsw	[%l7 + %g5],	%i7
	nop
	set	0x38, %i5
	lduw	[%l7 + %i5],	%i5
	set	0x70, %o1
	stda	%o0,	[%l7 + %o1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x44],	%f26
	set	0x52, %g1
	stba	%o5,	[%l7 + %g1] 0x80
	nop
	set	0x08, %i0
	std	%i6,	[%l7 + %i0]
	add	%i6,	%o2,	%g3
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f8
	st	%f30,	[%l7 + 0x7C]
	or	%i0,	%l5,	%o4
	nop
	set	0x14, %g2
	prefetch	[%l7 + %g2],	 3
	set	0x0C, %o2
	stwa	%l4,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x2B, %g6
	ldub	[%l7 + %g6],	%g5
	nop
	set	0x11, %o7
	ldstub	[%l7 + %o7],	%o3
	nop
	set	0x6A, %g7
	sth	%g1,	[%l7 + %g7]
	nop
	nop
	setx	0x1A05A000,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x63C64365,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f13,	%f31
	nop
	set	0x54, %l2
	ldsw	[%l7 + %l2],	%i2
	add	%l1,	%i3,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%g7
	nop
	set	0x28, %o4
	stx	%i1,	[%l7 + %o4]
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%o6
	set	0x68, %l0
	sta	%f10,	[%l7 + %l0] 0x81
	set	0x55, %o0
	stba	%l0,	[%l7 + %o0] 0xea
	membar	#Sync
	st	%f7,	[%l7 + 0x44]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%g2
	set	0x20, %i7
	sta	%f5,	[%l7 + %i7] 0x89
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%o0
	nop
	set	0x26, %l5
	lduh	[%l7 + %l5],	%g6
	nop
	set	0x28, %l4
	sth	%o7,	[%l7 + %l4]
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x88,	 2
	nop
	set	0x38, %i4
	stx	%i5,	[%l7 + %i4]
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	nop
	set	0x28, %g3
	std	%f14,	[%l7 + %g3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xe3,	%i4
	add	%o5,	%l6,	%i6
	set	0x08, %o6
	stxa	%o2,	[%l7 + %o6] 0x88
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%o0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g3
	set	0x74, %i2
	sta	%f31,	[%l7 + %i2] 0x81
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%o4
	nop
	set	0x46, %g5
	ldstub	[%l7 + %g5],	%l5
	nop
	set	0x60, %o1
	ldsh	[%l7 + %o1],	%g5
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o3
	set	0x54, %i0
	sta	%f25,	[%l7 + %i0] 0x88
	nop
	set	0x5D, %i6
	ldsb	[%l7 + %i6],	%g1
	nop
	set	0x78, %g1
	std	%f4,	[%l7 + %g1]
	set	0x13, %g2
	stba	%l4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x20, %g6
	stx	%l1,	[%l7 + %g6]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd2,	%f0
	nop
	set	0x58, %g7
	ldsh	[%l7 + %g7],	%i3
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%i2
	nop
	set	0x10, %o2
	stb	%l3,	[%l7 + %o2]
	set	0x50, %o4
	stwa	%g7,	[%l7 + %o4] 0x89
	set	0x28, %l0
	stda	%l2,	[%l7 + %l0] 0xeb
	membar	#Sync
	wr	%i1,	%o6,	%softint
	nop
	set	0x10, %o0
	std	%g4,	[%l7 + %o0]
	or	%l0,	%g2,	%o1
	add	%g6,	%o7,	%i5
	nop
	set	0x56, %i7
	ldsb	[%l7 + %i7],	%i4
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%f15,	[%l7 + 0x40]
	set	0x50, %l6
	sta	%f10,	[%l7 + %l6] 0x80
	nop
	set	0x40, %l3
	std	%f22,	[%l7 + %l3]
	set	0x22, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i6
	nop
	set	0x3C, %o3
	swap	[%l7 + %o3],	%o2
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x50, %i4
	std	%o0,	[%l7 + %i4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%g3
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f20
	nop
	set	0x3C, %l5
	swap	[%l7 + %l5],	%i7
	st	%fsr,	[%l7 + 0x58]
	fpsub32s	%f21,	%f1,	%f20
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	nop
	set	0x40, %o6
	std	%f22,	[%l7 + %o6]
	set	0x54, %g3
	lda	[%l7 + %g3] 0x88,	%f0
	bleu,a,pt	%icc,	loop_48
	nop
	set	0x54, %l1
	stw	%o4,	[%l7 + %l1]
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x80,	%o3
loop_48:
	nop
	set	0x0D, %g5
	ldub	[%l7 + %g5],	%g1
	set	0x68, %i3
	swapa	[%l7 + %i3] 0x89,	%g5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f16
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%l0
	or	%l4,	%i2,	%l3
	fpsub16s	%f4,	%f25,	%f13
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x88
	set	0x26, %g1
	stba	%i3,	[%l7 + %g1] 0x89
	nop
	set	0x68, %g2
	ldsw	[%l7 + %g2],	%l2
	wr	%g7,	%i1,	%pic
	set	0x10, %i6
	stba	%o6,	[%l7 + %i6] 0x88
	nop
	set	0x70, %g6
	stb	%l0,	[%l7 + %g6]
	set	0x44, %o7
	sta	%f29,	[%l7 + %o7] 0x89
	st	%f28,	[%l7 + 0x64]
	nop
	set	0x1E, %g7
	ldsh	[%l7 + %g7],	%g4
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%g2
	nop
	set	0x14, %l2
	ldstub	[%l7 + %l2],	%g6
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x88,	%o0
	set	0x2E, %o0
	stba	%o7,	[%l7 + %o0] 0x81
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x10, %i7
	prefetch	[%l7 + %i7],	 3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%o5
	nop
	set	0x10, %l0
	std	%f2,	[%l7 + %l0]
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x80,	%i5
	set	0x5C, %l3
	lda	[%l7 + %l3] 0x89,	%f13
	st	%f4,	[%l7 + 0x50]
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x89,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o0
	nop
	set	0x0E, %o3
	sth	%o2,	[%l7 + %o3]
	set	0x70, %i4
	stha	%g3,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x13, %o5
	stb	%i0,	[%l7 + %o5]
	set	0x64, %l6
	lda	[%l7 + %l6] 0x80,	%f20
	set	0x30, %i1
	stxa	%i7,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x88,	 3
	st	%f17,	[%l7 + 0x40]
	nop
	set	0x56, %g3
	sth	%l5,	[%l7 + %g3]
	set	0x5C, %l1
	lda	[%l7 + %l1] 0x80,	%f28
	nop
	set	0x34, %i2
	ldsw	[%l7 + %i2],	%o3
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%g1
	nop
	set	0x72, %i3
	sth	%g5,	[%l7 + %i3]
	nop
	set	0x68, %o6
	stx	%l4,	[%l7 + %o6]
	nop
	set	0x64, %o1
	ldub	[%l7 + %o1],	%l1
	nop
	set	0x41, %i0
	stb	%i2,	[%l7 + %i0]
	set	0x70, %i5
	stxa	%i3,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%l2,	%l3,	%i1
	and	%g7,	%o6,	%l0
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	be,a,pn	%xcc,	loop_49
	ld	[%l7 + 0x2C],	%f31
	set	0x6A, %i6
	stha	%g4,	[%l7 + %i6] 0x81
loop_49:
	st	%f26,	[%l7 + 0x1C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%g2
	set	0x18, %g6
	sta	%f29,	[%l7 + %g6] 0x81
	add	%o7,	%o1,	%i4
	set	0x68, %o7
	stda	%i4,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f18
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x5C, %o2
	stba	%o5,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x20, %l2
	stha	%i6,	[%l7 + %l2] 0x80
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o2
	nop
	set	0x34, %o4
	stw	%g3,	[%l7 + %o4]
	set	0x12, %i7
	stba	%o0,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%i7
	set	0x10, %g4
	stxa	%o4,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x2A, %o0
	lduh	[%l7 + %o0],	%l5
	set	0x40, %l3
	stha	%i0,	[%l7 + %l3] 0x80
	set	0x20, %o3
	lda	[%l7 + %o3] 0x81,	%f20
	set	0x20, %i4
	stxa	%o3,	[%l7 + %i4] 0x81
	set	0x60, %o5
	swapa	[%l7 + %o5] 0x89,	%g5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%l4
	nop
	set	0x44, %l6
	ldsh	[%l7 + %l6],	%i2
	nop
	set	0x45, %l4
	ldsb	[%l7 + %l4],	%i3
	set	0x70, %l5
	stxa	%l2,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f28
	nop
	set	0x34, %l1
	ldsh	[%l7 + %l1],	%l1
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%l3
	nop
	set	0x2F, %i2
	ldstub	[%l7 + %i2],	%g7
	nop
	set	0x40, %i3
	stx	%i1,	[%l7 + %i3]
	ld	[%l7 + 0x4C],	%f12
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%l0
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f28
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xea,	%g6
	set	0x58, %i0
	sta	%f14,	[%l7 + %i0] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%g4
	nop
	set	0x40, %g5
	stx	%o1,	[%l7 + %g5]
	nop
	set	0x40, %g2
	ldx	[%l7 + %g2],	%o7
	set	0x64, %i6
	stha	%i5,	[%l7 + %i6] 0x81
	set	0x58, %g6
	stda	%i4,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x28, %i5
	ldsh	[%l7 + %i5],	%i6
	nop
	set	0x3F, %o7
	stb	%o5,	[%l7 + %o7]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6A7, 	%tick_cmpr
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%g2
	or	%i7,	%o0,	%o4
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%i0
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x80,	%o3
	and	%l5,	%g5,	%g1
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	set	0x58, %l2
	sta	%f15,	[%l7 + %l2] 0x80
	nop
	set	0x34, %i7
	stb	%i3,	[%l7 + %i7]
	nop
	set	0x62, %l0
	lduh	[%l7 + %l0],	%i2
	nop
	set	0x16, %o0
	ldstub	[%l7 + %o0],	%l2
	nop
	set	0x74, %l3
	stw	%l3,	[%l7 + %l3]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f0
	nop
	set	0x7E, %o3
	ldsh	[%l7 + %o3],	%l1
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%g7
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe3,	%i0
	nop
	set	0x08, %i4
	std	%f24,	[%l7 + %i4]
	nop
	set	0x38, %l5
	ldsh	[%l7 + %l5],	%l0
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%f30
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f26
	set	0x2D, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g6
	and	%g2,	%g4,	%o6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f0
	nop
	set	0x50, %i1
	stb	%o1,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f16
	nop
	set	0x2D, %o1
	ldsb	[%l7 + %o1],	%i5
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x89,	 3
	nop
	set	0x37, %g5
	ldsb	[%l7 + %g5],	%i6
	nop
	set	0x6A, %g2
	lduh	[%l7 + %g2],	%i4
	set	0x2F, %i0
	stba	%o5,	[%l7 + %i0] 0x80
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x6C, %o7
	ldub	[%l7 + %o7],	%g3
	fpsub16s	%f18,	%f3,	%f2
	nop
	set	0x4C, %i5
	prefetch	[%l7 + %i5],	 4
	fpsub16s	%f5,	%f28,	%f26
	set	0x28, %o2
	sta	%f15,	[%l7 + %o2] 0x81
	nop
	set	0x7E, %g1
	stb	%i7,	[%l7 + %g1]
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x80,	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCD9, 	%sys_tick_cmpr
	nop
	set	0x3E, %o4
	ldsb	[%l7 + %o4],	%o0
	and	%l5,	%o3,	%g1
	ba,a	%xcc,	loop_50
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%g4
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xe3,	%l4
loop_50:
	be,a	%icc,	loop_51
	nop
	set	0x4E, %o0
	ldub	[%l7 + %o0],	%i2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd0,	%f16
loop_51:
	and	%l2,	%l3,	%i3
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xcc
	and	%l1,	%g7,	%i1
	or	%l0,	%g2,	%g6
	ble,a	%icc,	loop_52
	nop
	set	0x38, %i7
	ldsh	[%l7 + %i7],	%g4
	nop
	set	0x78, %o3
	std	%f16,	[%l7 + %o3]
	set	0x43, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o1
loop_52:
	nop
	set	0x70, %o5
	ldda	[%l7 + %o5] 0xeb,	%o6
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%o7
	nop
	set	0x68, %g3
	sth	%i6,	[%l7 + %g3]
	set	0x2C, %l4
	sta	%f14,	[%l7 + %l4] 0x88
	set	0x58, %l5
	stha	%i5,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x10, %i2
	sth	%o5,	[%l7 + %i2]
	nop
	set	0x36, %l1
	ldsb	[%l7 + %l1],	%i4
	set	0x24, %i3
	sta	%f15,	[%l7 + %i3] 0x80
	st	%f0,	[%l7 + 0x58]
	st	%fsr,	[%l7 + 0x40]
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x89,	%g3
	nop
	set	0x2C, %i1
	prefetch	[%l7 + %i1],	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%i0
	nop
	set	0x31, %g5
	ldsb	[%l7 + %g5],	%o0
	bne,a	%xcc,	loop_53
	nop
	set	0x10, %o6
	stx	%o4,	[%l7 + %o6]
	nop
	set	0x3C, %g2
	stw	%o3,	[%l7 + %g2]
	set	0x70, %i0
	stxa	%l5,	[%l7 + %i0] 0xea
	membar	#Sync
loop_53:
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x48, %i6
	stda	%g0,	[%l7 + %i6] 0x80
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	set	0x7C, %i5
	lda	[%l7 + %i5] 0x88,	%f2
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%l4
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%g5
	nop
	set	0x30, %g7
	lduw	[%l7 + %g7],	%i2
	or	%l2,	%l3,	%i3
	wr	%g7,	%l1,	%pic
	st	%f15,	[%l7 + 0x70]
	wr	%l0,	%i1,	%set_softint
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%g6
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	add	%g2,	%g4,	%o6
	nop
	set	0x50, %o0
	ldstub	[%l7 + %o0],	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i5
	add	%o7,	%i4,	%o5
	set	0x64, %l3
	stha	%g3,	[%l7 + %l3] 0x80
	st	%f25,	[%l7 + 0x64]
	nop
	set	0x18, %g4
	std	%o2,	[%l7 + %g4]
	set	0x40, %l0
	lda	[%l7 + %l0] 0x89,	%f11
	nop
	set	0x53, %i7
	ldsb	[%l7 + %i7],	%i7
	set	0x5D, %l6
	stba	%i0,	[%l7 + %l6] 0x89
	nop
	set	0x58, %o5
	std	%f26,	[%l7 + %o5]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x80,	%f0
	nop
	set	0x74, %o3
	ldsw	[%l7 + %o3],	%o0
	nop
	set	0x14, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x0B, %g3
	stb	%o4,	[%l7 + %g3]
	fpadd16	%f4,	%f24,	%f14
	bleu,a,pn	%xcc,	loop_54
	nop
	set	0x3C, %l5
	ldsh	[%l7 + %l5],	%o3
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l4
loop_54:
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%g5
	nop
	set	0x58, %o1
	ldx	[%l7 + %o1],	%l5
	nop
	set	0x30, %i3
	stw	%i2,	[%l7 + %i3]
	set	0x3C, %g5
	sta	%f24,	[%l7 + %g5] 0x89
	nop
	set	0x39, %o6
	ldsb	[%l7 + %o6],	%l2
	nop
	set	0x70, %g2
	stw	%l3,	[%l7 + %g2]
	set	0x32, %i0
	stha	%g7,	[%l7 + %i0] 0x89
	nop
	set	0x27, %i1
	ldsb	[%l7 + %i1],	%l1
	set	0x20, %g6
	stda	%l0,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x44, %o7
	ldub	[%l7 + %o7],	%i3
	and	%g6,	%i1,	%g2
	fpsub32	%f22,	%f2,	%f6
	set	0x78, %i5
	sta	%f15,	[%l7 + %i5] 0x80
	ld	[%l7 + 0x70],	%f13
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xeb,	%g4
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf9,	%f16
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x10, %g7
	std	%o0,	[%l7 + %g7]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc4
	set	0x18, %l2
	stwa	%o6,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%i5
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f10
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f0
	set	0x08, %l0
	stxa	%i6,	[%l7 + %l0] 0x89
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x80,	%i4
	set	0x7C, %i7
	swapa	[%l7 + %i7] 0x89,	%o7
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x80,	%g3
	nop
	set	0x4A, %i4
	ldsh	[%l7 + %i4],	%o2
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x80,	%o5
	set	0x30, %g3
	stda	%i6,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x20, %l5
	stx	%o0,	[%l7 + %l5]
	nop
	set	0x78, %l4
	ldub	[%l7 + %l4],	%i0
	nop
	set	0x08, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x30, %l1
	std	%o4,	[%l7 + %l1]
	nop
	set	0x46, %o1
	sth	%l6,	[%l7 + %o1]
	fpadd16s	%f10,	%f7,	%f9
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%o3
	nop
	set	0x48, %g5
	std	%l4,	[%l7 + %g5]
	ld	[%l7 + 0x2C],	%f6
	nop
	set	0x20, %i3
	prefetch	[%l7 + %i3],	 0
	set	0x2C, %o6
	lda	[%l7 + %o6] 0x81,	%f7
	add	%g5,	%l5,	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%l3
	set	0x20, %g2
	stda	%l0,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf8
	membar	#Sync
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%g6
	nop
	set	0x50, %o7
	stw	%i3,	[%l7 + %o7]
	wr	%g6,	%i1,	%pic
	nop
	set	0x2C, %i5
	lduw	[%l7 + %i5],	%l0
	set	0x39, %i6
	stba	%g2,	[%l7 + %i6] 0x80
	set	0x64, %g1
	stha	%o1,	[%l7 + %g1] 0x89
	ba	%icc,	loop_55
	nop
	set	0x56, %g7
	ldsh	[%l7 + %g7],	%g4
	st	%fsr,	[%l7 + 0x08]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%i6
loop_55:
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%i5
	nop
	set	0x41, %l2
	ldsb	[%l7 + %l2],	%o7
	set	0x39, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i4
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%o2
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf0
	membar	#Sync
	nop
	set	0x7C, %l3
	ldsh	[%l7 + %l3],	%o5
	nop
	set	0x78, %o2
	ldsb	[%l7 + %o2],	%g3
	nop
	set	0x1C, %l0
	swap	[%l7 + %l0],	%o0
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x81,	%i0
	set	0x58, %l6
	sta	%f29,	[%l7 + %l6] 0x81
	set	0x50, %o5
	stda	%i6,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x89,	%o4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	nop
	set	0x30, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x50, %g3
	stda	%g0,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x14, %l1
	ldub	[%l7 + %l1],	%o3
	nop
	set	0x60, %o1
	stx	%l4,	[%l7 + %o1]
	set	0x08, %i2
	sta	%f1,	[%l7 + %i2] 0x81
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%g4
	nop
	set	0x58, %o6
	ldx	[%l7 + %o6],	%l5
	set	0x59, %g2
	stba	%l2,	[%l7 + %g2] 0x88
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xeb,	%l2
	nop
	set	0x20, %i0
	ldsw	[%l7 + %i0],	%l1
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x40, %o7
	lda	[%l7 + %o7] 0x81,	%f29
	nop
	set	0x40, %i6
	std	%g6,	[%l7 + %i6]
	set	0x74, %g1
	stwa	%i2,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x40, %i5
	ldsw	[%l7 + %i5],	%i3
	nop
	set	0x7E, %i1
	sth	%i1,	[%l7 + %i1]
	set	0x60, %g7
	stwa	%l0,	[%l7 + %g7] 0x81
	set	0x0C, %o0
	stwa	%g2,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x72, %l2
	stha	%g6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%g4
	nop
	set	0x40, %g4
	stx	%o1,	[%l7 + %g4]
	nop
	set	0x74, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x08, %l0
	stw	%i6,	[%l7 + %l0]
	add	%i5,	%o6,	%o7
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f0
	nop
	set	0x40, %l3
	stx	%i4,	[%l7 + %l3]
	set	0x68, %l6
	stda	%o4,	[%l7 + %l6] 0x89
	nop
	set	0x2E, %o5
	lduh	[%l7 + %o5],	%o2
	add	%g3,	%i0,	%i7
	nop
	set	0x30, %o3
	std	%o0,	[%l7 + %o3]
	ld	[%l7 + 0x20],	%f31
	set	0x0C, %i4
	swapa	[%l7 + %i4] 0x80,	%o4
	nop
	set	0x10, %l5
	std	%f4,	[%l7 + %l5]
	ld	[%l7 + 0x48],	%f20
	set	0x36, %g3
	stba	%l6,	[%l7 + %g3] 0x81
	or	%o3,	%g1,	%l4
	nop
	set	0x58, %l1
	stb	%g5,	[%l7 + %l1]
	set	0x35, %l4
	stba	%l5,	[%l7 + %l4] 0x81
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%l3
	nop
	set	0x4C, %i2
	stb	%g7,	[%l7 + %i2]
	set	0x50, %o1
	swapa	[%l7 + %o1] 0x81,	%i2
	set	0x40, %i3
	lda	[%l7 + %i3] 0x81,	%f7
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%l1
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x4C, %g2
	stw	%i3,	[%l7 + %g2]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1277
!	Type a   	: 26
!	Type cti   	: 24
!	Type x   	: 538
!	Type f   	: 33
!	Type i   	: 102
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
	set	0xA,	%g1
	set	0x2,	%g2
	set	0x9,	%g3
	set	0x2,	%g4
	set	0xF,	%g5
	set	0xB,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x3,	%i1
	set	-0x4,	%i2
	set	-0x6,	%i3
	set	-0x2,	%i4
	set	-0x5,	%i5
	set	-0xE,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x3DC1CBFA,	%l0
	set	0x55DDC540,	%l1
	set	0x3B37F11B,	%l2
	set	0x4F02CE45,	%l3
	set	0x0C8E992A,	%l4
	set	0x4D91AFDE,	%l5
	set	0x48681C51,	%l6
	!# Output registers
	set	-0x0951,	%o0
	set	-0x03F5,	%o1
	set	0x1367,	%o2
	set	-0x13BE,	%o3
	set	-0x05B4,	%o4
	set	0x02B5,	%o5
	set	0x1F9B,	%o6
	set	0x0B73,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	set	0x11, %g5
	stba	%l0,	[%l7 + %g5] 0x89
	set	0x65, %g6
	ldstuba	[%l7 + %g6] 0x80,	%i1
	set	0x74, %i0
	lda	[%l7 + %i0] 0x80,	%f12
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%g4
	set	0x14, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g2
	nop
	set	0x30, %i6
	std	%o0,	[%l7 + %i6]
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%i5
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f8
	set	0x78, %g7
	prefetcha	[%l7 + %g7] 0x89,	 4
	bl	%icc,	loop_56
	nop
	set	0x6A, %i1
	sth	%o7,	[%l7 + %i1]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x81
loop_56:
	nop
	set	0x28, %l2
	ldsw	[%l7 + %l2],	%i6
	set	0x68, %o4
	stxa	%i4,	[%l7 + %o4] 0xeb
	membar	#Sync
	fpsub32s	%f24,	%f29,	%f10
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x81,	%o5
	nop
	set	0x40, %g4
	std	%g2,	[%l7 + %g4]
	fpadd32	%f4,	%f30,	%f18
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%i0
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f0
	set	0x38, %l6
	lda	[%l7 + %l6] 0x88,	%f16
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x38, %l0
	stda	%i6,	[%l7 + %l0] 0x89
	st	%fsr,	[%l7 + 0x64]
	set	0x4C, %i4
	stha	%o0,	[%l7 + %i4] 0xe2
	membar	#Sync
	and	%o4,	%o2,	%o3
	nop
	set	0x78, %l5
	ldx	[%l7 + %l5],	%l6
	wr	%g1,	%g5,	%sys_tick
	ba,a,pt	%xcc,	loop_57
	nop
	set	0x5A, %g3
	sth	%l4,	[%l7 + %g3]
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%l2
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf9
	membar	#Sync
loop_57:
	nop
	set	0x28, %i2
	std	%l4,	[%l7 + %i2]
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%l3
	ld	[%l7 + 0x40],	%f8
	ba,pt	%icc,	loop_58
	or	%i2,	%g7,	%i3
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x88,	%l1
loop_58:
	nop
	set	0x2F, %i3
	ldstuba	[%l7 + %i3] 0x80,	%l0
	wr	%i1,	%g4,	%set_softint
	nop
	set	0x38, %g2
	ldsh	[%l7 + %g2],	%g6
	nop
	nop
	setx	0x09F54E584BC2B11D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x07CABB9DC4442077,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f26
	set	0x10, %g5
	stxa	%o1,	[%l7 + %g5] 0x80
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x80,	%f4
	set	0x08, %i0
	stda	%i4,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x30, %o7
	stxa	%g2,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x38, %i6
	stxa	%o6,	[%l7 + %i6] 0x80
	nop
	set	0x23, %i5
	stb	%o7,	[%l7 + %i5]
	nop
	set	0x55, %g1
	stb	%i6,	[%l7 + %g1]
	nop
	set	0x40, %g7
	prefetch	[%l7 + %g7],	 2
	ld	[%l7 + 0x14],	%f3
	set	0x70, %i1
	stda	%i4,	[%l7 + %i1] 0x89
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 0
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x80,	%g3
	st	%f6,	[%l7 + 0x08]
	nop
	set	0x0C, %o4
	ldub	[%l7 + %o4],	%o5
	nop
	set	0x20, %o2
	std	%f24,	[%l7 + %o2]
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x88,	%f30
	nop
	set	0x60, %i7
	stx	%i7,	[%l7 + %i7]
	nop
	set	0x5C, %l3
	lduw	[%l7 + %l3],	%i0
	nop
	set	0x28, %l6
	ldsw	[%l7 + %l6],	%o0
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe3,	%o4
	nop
	set	0x78, %o5
	sth	%o3,	[%l7 + %o5]
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f24
	nop
	set	0x60, %l5
	stx	%l6,	[%l7 + %l5]
	nop
	set	0x46, %l0
	ldub	[%l7 + %l0],	%o2
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xcc
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%l4
	nop
	set	0x74, %o3
	lduh	[%l7 + %o3],	%l2
	st	%f18,	[%l7 + 0x08]
	st	%f3,	[%l7 + 0x1C]
	set	0x68, %i2
	swapa	[%l7 + %i2] 0x89,	%l5
	add	%g5,	%l3,	%g7
	nop
	set	0x76, %l1
	ldsb	[%l7 + %l1],	%i3
	fpadd32s	%f10,	%f19,	%f31
	set	0x08, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l1
	nop
	set	0x10, %o1
	std	%f4,	[%l7 + %o1]
	nop
	set	0x0C, %g5
	stw	%i2,	[%l7 + %g5]
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%i0
	nop
	set	0x32, %o7
	stb	%l0,	[%l7 + %o7]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf0
	membar	#Sync
	nop
	set	0x48, %i5
	ldsb	[%l7 + %i5],	%g4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f0
	nop
	set	0x78, %g7
	std	%g6,	[%l7 + %g7]
	nop
	set	0x38, %i1
	prefetch	[%l7 + %i1],	 4
	fpadd16s	%f15,	%f13,	%f12
	add	%i5,	%o1,	%o6
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o7
	nop
	set	0x40, %l2
	swap	[%l7 + %l2],	%g2
	st	%f12,	[%l7 + 0x60]
	nop
	set	0x78, %o0
	std	%f18,	[%l7 + %o0]
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%i6
	nop
	set	0x70, %o2
	std	%i4,	[%l7 + %o2]
	nop
	set	0x28, %i7
	swap	[%l7 + %i7],	%g3
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f20
	set	0x18, %l3
	stxa	%i7,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%fsr,	[%l7 + 0x4C]
	set	0x78, %o6
	stxa	%o4,	[%l7 + %o6] 0x81
	set	0x20, %l6
	stxa	%o3,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x24, %i4
	sta	%f29,	[%l7 + %i4] 0x80
	nop
	set	0x33, %o5
	ldstub	[%l7 + %o5],	%o0
	nop
	set	0x46, %l5
	stb	%o2,	[%l7 + %l5]
	set	0x3C, %l0
	swapa	[%l7 + %l0] 0x80,	%g1
	set	0x58, %l4
	sta	%f8,	[%l7 + %l4] 0x81
	nop
	set	0x5E, %g3
	ldstub	[%l7 + %g3],	%l6
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f26
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x89,	%l2
	nop
	set	0x4B, %i3
	ldub	[%l7 + %i3],	%l4
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%g5
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%l2
	nop
	set	0x08, %g6
	stx	%l5,	[%l7 + %g6]
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%f14
	nop
	set	0x7C, %o7
	stb	%g7,	[%l7 + %o7]
	bleu,pn	%icc,	loop_59
	and	%i3,	%l1,	%i2
	nop
	nop
	setx	0x9072144D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xD0EF2010,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f16,	%f3
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x89,	%l0
loop_59:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i1
	set	0x38, %i5
	stda	%i4,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x7C, %g1
	ldstub	[%l7 + %g1],	%o1
	nop
	set	0x08, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x10, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x64, %g7
	sta	%f18,	[%l7 + %g7] 0x81
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd2
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x4B, %o4
	ldstub	[%l7 + %o4],	%g6
	nop
	set	0x28, %o0
	std	%o6,	[%l7 + %o0]
	or	%o7,	%i6,	%i4
	nop
	set	0x10, %i7
	ldsw	[%l7 + %i7],	%g3
	nop
	nop
	setx	0xA38AA8FDE5008452,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x30E75968CD7A6808,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f10,	%f22
	nop
	set	0x3E, %g4
	sth	%i7,	[%l7 + %g4]
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%i0
	st	%f17,	[%l7 + 0x28]
	set	0x28, %o2
	stwa	%g2,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x50, %l6
	stha	%o5,	[%l7 + %l6] 0x80
	fpadd16s	%f4,	%f7,	%f10
	nop
	set	0x3E, %i4
	sth	%o4,	[%l7 + %i4]
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f0
	set	0x3A, %l5
	stha	%o0,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%o3,	%g1,	%o2
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%l4
	nop
	set	0x50, %g3
	stx	%g5,	[%l7 + %g3]
	fpadd32	%f6,	%f22,	%f4
	nop
	set	0x58, %o3
	std	%l2,	[%l7 + %o3]
	nop
	set	0x28, %o5
	std	%l4,	[%l7 + %o5]
	set	0x60, %i3
	stxa	%g7,	[%l7 + %i3] 0x80
	set	0x7C, %o1
	lda	[%l7 + %o1] 0x89,	%f4
	set	0x40, %l1
	stda	%l2,	[%l7 + %l1] 0x89
	ble,pn	%icc,	loop_60
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%l1
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
loop_60:
	wr	%l0,	%g4,	%clear_softint
	nop
	set	0x74, %i2
	sth	%i1,	[%l7 + %i2]
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 4
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f0
	and	%i5,	%o1,	%g6
	nop
	set	0x24, %i0
	sth	%o6,	[%l7 + %i0]
	set	0x70, %g1
	stxa	%i3,	[%l7 + %g1] 0x88
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	wr	%o7,	%i4,	%y
	set	0x08, %g7
	stda	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x6C, %l2
	ldsb	[%l7 + %l2],	%g3
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f2
	nop
	set	0x78, %i6
	stw	%i7,	[%l7 + %i6]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd0
	nop
	set	0x10, %o4
	lduh	[%l7 + %o4],	%g2
	fpsub32s	%f15,	%f1,	%f31
	nop
	set	0x68, %g4
	ldsw	[%l7 + %g4],	%o5
	set	0x74, %l3
	sta	%f20,	[%l7 + %l3] 0x88
	nop
	set	0x18, %o2
	std	%f20,	[%l7 + %o2]
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x78, %i4
	stw	%o4,	[%l7 + %i4]
	nop
	set	0x1E, %o6
	lduh	[%l7 + %o6],	%o0
	nop
	set	0x50, %l5
	stw	%i0,	[%l7 + %l5]
	set	0x18, %l6
	stda	%o2,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x6E, %l0
	stha	%g1,	[%l7 + %l0] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x68, %g3
	swap	[%l7 + %g3],	%o2
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x88,	 3
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc0
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f20
	fpadd32s	%f20,	%f6,	%f1
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%l4
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%g5
	and	%l5,	%g7,	%l3
	bg,a	%xcc,	loop_61
	nop
	set	0x5C, %g6
	lduh	[%l7 + %g6],	%l1
	st	%f30,	[%l7 + 0x5C]
	ld	[%l7 + 0x20],	%f15
loop_61:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%l0
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	nop
	set	0x7F, %i2
	ldstub	[%l7 + %i2],	%i2
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%i5
	wr	%i1,	%o1,	%softint
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%o6
	st	%fsr,	[%l7 + 0x34]
	set	0x15, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i3
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x89
	nop
	set	0x54, %i1
	ldstub	[%l7 + %i1],	%g6
	set	0x48, %l2
	sta	%f20,	[%l7 + %l2] 0x89
	st	%f27,	[%l7 + 0x70]
	nop
	set	0x34, %i6
	prefetch	[%l7 + %i6],	 4
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x80,	%f28
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%o7
	nop
	set	0x60, %o4
	std	%i4,	[%l7 + %o4]
	add	%g3,	%i6,	%i7
	set	0x58, %g4
	stda	%g2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x40, %l3
	lduw	[%l7 + %l3],	%o4
	st	%f11,	[%l7 + 0x44]
	wr	%o5,	%o0,	%clear_softint
	nop
	set	0x14, %i7
	sth	%o3,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%i0
	set	0x38, %o2
	stda	%o2,	[%l7 + %o2] 0x80
	set	0x68, %o6
	stwa	%l4,	[%l7 + %o6] 0xe2
	membar	#Sync
	or	%g5,	%l5,	%g7
	nop
	set	0x34, %l5
	ldsb	[%l7 + %l5],	%l6
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf8
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%l2
	wr	%l0,	%l3,	%sys_tick
	nop
	set	0x5C, %i4
	swap	[%l7 + %i4],	%g4
	and	%i5,	%i2,	%o1
	nop
	nop
	setx	0xD8FAF179,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB3EE283A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f30,	%f26
	nop
	set	0x40, %g3
	std	%i0,	[%l7 + %g3]
	nop
	set	0x0E, %l4
	ldsh	[%l7 + %l4],	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%o7
	nop
	set	0x57, %l0
	ldub	[%l7 + %l0],	%i4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g6
	nop
	set	0x78, %o3
	stw	%i6,	[%l7 + %o3]
	nop
	set	0x5D, %o5
	ldstub	[%l7 + %o5],	%i7
	nop
	set	0x08, %i3
	stx	%o4,	[%l7 + %i3]
	set	0x58, %g6
	stha	%o5,	[%l7 + %g6] 0x89
	nop
	set	0x70, %g2
	std	%g2,	[%l7 + %g2]
	nop
	set	0x4C, %i2
	swap	[%l7 + %i2],	%o3
	nop
	set	0x0E, %o7
	ldsh	[%l7 + %o7],	%o0
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x81,	%i0
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x88,	%g1
	set	0x20, %i0
	swapa	[%l7 + %i0] 0x81,	%o2
	set	0x40, %l1
	ldxa	[%l7 + %l1] 0x81,	%g5
	nop
	set	0x68, %g7
	lduw	[%l7 + %g7],	%l4
	set	0x48, %g1
	sta	%f9,	[%l7 + %g1] 0x89
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%g7
	nop
	set	0x2C, %i6
	swap	[%l7 + %i6],	%l6
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x89,	%l1
	nop
	set	0x18, %i1
	stx	%l5,	[%l7 + %i1]
	ba	%icc,	loop_62
	nop
	set	0x7F, %g5
	stb	%l0,	[%l7 + %g5]
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%l3
	nop
	set	0x6C, %l3
	stw	%l2,	[%l7 + %l3]
loop_62:
	nop
	set	0x13, %i7
	ldub	[%l7 + %i7],	%g4
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x30, %o2
	ldub	[%l7 + %o2],	%i2
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%o1
	wr	%i1,	%i5,	%ccr
	nop
	set	0x28, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f8
	set	0x44, %g4
	stwa	%o7,	[%l7 + %g4] 0x81
	and	%i4,	%g3,	%o6
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%i7
	nop
	set	0x20, %l4
	std	%i6,	[%l7 + %l4]
	nop
	set	0x18, %l0
	stx	%o4,	[%l7 + %l0]
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f26
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f2
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x81,	%o4
	or	%g2,	%o0,	%i0
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o3
	add	%o2,	%g5,	%l4
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f16
	fpsub32s	%f5,	%f6,	%f14
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%f4
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x58, %o7
	swap	[%l7 + %o7],	%g1
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%g7
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	nop
	set	0x10, %i0
	stx	%l1,	[%l7 + %i0]
	set	0x70, %l1
	sta	%f24,	[%l7 + %l1] 0x89
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f16
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%l0
	set	0x60, %g1
	prefetcha	[%l7 + %g1] 0x89,	 1
	ble,a	%icc,	loop_63
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%l2
	and	%g4,	%l3,	%i2
	set	0x50, %o0
	stha	%o1,	[%l7 + %o0] 0xeb
	membar	#Sync
loop_63:
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x18, %i1
	stwa	%i5,	[%l7 + %i1] 0x89
	or	%i3,	%o7,	%i4
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x60, %l3
	sta	%f26,	[%l7 + %l3] 0x80
	and	%g3,	%i1,	%g6
	nop
	set	0x76, %o2
	sth	%i7,	[%l7 + %o2]
	nop
	set	0x2E, %i7
	lduh	[%l7 + %i7],	%o6
	set	0x58, %l5
	lda	[%l7 + %l5] 0x80,	%f1
	and	%i6,	%o4,	%g2
	nop
	set	0x70, %o6
	stw	%o0,	[%l7 + %o6]
	st	%f27,	[%l7 + 0x2C]
	and	%i0,	%o5,	%o3
	add	%o2,	%g5,	%l4
	ld	[%l7 + 0x24],	%f7
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x88,	%g6
	nop
	set	0x6A, %l6
	ldub	[%l7 + %l6],	%l6
	set	0x56, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l1
	set	0x44, %l0
	stha	%g1,	[%l7 + %l0] 0x80
	nop
	nop
	setx	0x302859A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x75D8EAC3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f4,	%f16
	set	0x1C, %g3
	stha	%l0,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x18, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f16
	set	0x28, %i4
	lda	[%l7 + %i4] 0x88,	%f11
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%g4
	nop
	set	0x50, %i3
	stw	%l5,	[%l7 + %i3]
	set	0x18, %g2
	lda	[%l7 + %g2] 0x81,	%f5
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x30, %i5
	swap	[%l7 + %i5],	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x88,	%o1,	%i5
	nop
	set	0x22, %i0
	lduh	[%l7 + %i0],	%i3
	nop
	set	0x10, %l1
	stx	%i4,	[%l7 + %l1]
	bleu	%icc,	loop_64
	nop
	set	0x16, %o1
	ldsb	[%l7 + %o1],	%g3
	set	0x28, %g7
	stda	%i0,	[%l7 + %g7] 0xe2
	membar	#Sync
loop_64:
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x1E, %g6
	sth	%o7,	[%l7 + %g6]
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xeb,	%i6
	nop
	set	0x4C, %o0
	stw	%g6,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x40, %i6
	sth	%o6,	[%l7 + %i6]
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f30
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%o4
	nop
	set	0x20, %l2
	stx	%g2,	[%l7 + %l2]
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%i6
	set	0x1C, %o2
	sta	%f26,	[%l7 + %o2] 0x89
	nop
	set	0x14, %l3
	stw	%i0,	[%l7 + %l3]
	nop
	set	0x30, %i7
	ldx	[%l7 + %i7],	%o0
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%o4
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc0
	nop
	set	0x20, %l6
	lduw	[%l7 + %l6],	%o2
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%g5
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f26
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%l4
	nop
	set	0x18, %l0
	stw	%g7,	[%l7 + %l0]
	set	0x28, %o5
	stha	%o3,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x15, %o3
	ldstuba	[%l7 + %o3] 0x80,	%l6
	set	0x50, %i3
	swapa	[%l7 + %i3] 0x88,	%l1
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x80,	%l0
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x77, %i4
	ldstuba	[%l7 + %i4] 0x89,	%l2
	ld	[%l7 + 0x58],	%f7
	set	0x4A, %i2
	stba	%g4,	[%l7 + %i2] 0x88
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%l4
	wr	%i2,	%g1,	%clear_softint
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%o0
	set	0x38, %l1
	sta	%f24,	[%l7 + %l1] 0x88
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%i5
	nop
	set	0x28, %g7
	std	%f22,	[%l7 + %g7]
	set	0x60, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	set	0x4B, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g3
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f24
	or	%i3,	%i1,	%i7
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x88
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xca
	set	0x5F, %g5
	stba	%g6,	[%l7 + %g5] 0x80
	set	0x40, %i6
	stda	%o6,	[%l7 + %i6] 0x80
	set	0x40, %o4
	stba	%o7,	[%l7 + %o4] 0x89
	add	%o4,	%g2,	%i0
	nop
	set	0x48, %o2
	std	%f28,	[%l7 + %o2]
	add	%i6,	%o0,	%o2
	set	0x19, %l2
	stba	%o5,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x88,	%g5
	set	0x78, %i7
	swapa	[%l7 + %i7] 0x89,	%g7
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x43, %o6
	stb	%l4,	[%l7 + %o6]
	add	%l6,	%l1,	%o3
	ld	[%l7 + 0x10],	%f26
	ld	[%l7 + 0x48],	%f30
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%g4
	nop
	set	0x7C, %l5
	ldsh	[%l7 + %l5],	%l5
	set	0x0F, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf1
	membar	#Sync
	st	%f3,	[%l7 + 0x4C]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f16
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%l2
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	nop
	set	0x28, %o5
	stx	%l3,	[%l7 + %o5]
	nop
	set	0x24, %o3
	ldsh	[%l7 + %o3],	%i5
	and	%i4,	%g3,	%i3
	nop
	set	0x30, %l4
	std	%i0,	[%l7 + %l4]
	set	0x22, %i3
	stba	%i7,	[%l7 + %i3] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%g6
	nop
	set	0x20, %g2
	lduh	[%l7 + %g2],	%o7
	set	0x34, %o7
	lda	[%l7 + %o7] 0x80,	%f14
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%o4
	set	0x6B, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o6
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%i0
	nop
	set	0x20, %g7
	std	%f2,	[%l7 + %g7]
	or	%i6,	%g2,	%o2
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%o0
	set	0x40, %o1
	swapa	[%l7 + %o1] 0x89,	%o5
	nop
	set	0x22, %g1
	lduh	[%l7 + %g1],	%g5
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xe3,	%g6
	nop
	set	0x61, %i5
	ldub	[%l7 + %i5],	%l6
	set	0x08, %i1
	stxa	%l4,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x29, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l1
	set	0x1C, %o4
	stha	%l0,	[%l7 + %o4] 0x89
	nop
	set	0x50, %o2
	stx	%g4,	[%l7 + %o2]
	set	0x30, %l2
	ldda	[%l7 + %l2] 0xe2,	%l4
	nop
	set	0x44, %g5
	stb	%o3,	[%l7 + %g5]
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x89,	 1
	st	%f22,	[%l7 + 0x74]
	nop
	set	0x70, %o6
	std	%l2,	[%l7 + %o6]
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%l3
	nop
	set	0x40, %l5
	stw	%i2,	[%l7 + %l5]
	nop
	set	0x78, %l6
	std	%i4,	[%l7 + %l6]
	nop
	set	0x60, %g3
	std	%f0,	[%l7 + %g3]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xe3,	%g2
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x48, %o3
	stx	%i3,	[%l7 + %o3]
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f4
	and	%i4,	%i1,	%i7
	st	%f15,	[%l7 + 0x48]
	set	0x2D, %o5
	stba	%o1,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x55, %g2
	stba	%g6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x2A, %i3
	ldsh	[%l7 + %i3],	%o7
	nop
	set	0x6C, %o7
	prefetch	[%l7 + %o7],	 0
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%o4
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x50, %i0
	prefetch	[%l7 + %i0],	 2
	nop
	set	0x60, %i2
	ldsb	[%l7 + %i2],	%i0
	nop
	set	0x18, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f14
	set	0x30, %g6
	lda	[%l7 + %g6] 0x81,	%f6
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xe2,	%o6
	set	0x18, %o0
	swapa	[%l7 + %o0] 0x88,	%i6
	fpsub32s	%f21,	%f19,	%f27
	nop
	set	0x08, %i5
	ldsw	[%l7 + %i5],	%g2
	nop
	set	0x29, %i6
	ldstub	[%l7 + %i6],	%o2
	bl,pn	%icc,	loop_65
	nop
	set	0x78, %o4
	lduw	[%l7 + %o4],	%o0
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x89,	 1
loop_65:
	nop
	set	0x30, %i1
	stx	%g5,	[%l7 + %i1]
	set	0x40, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0
	nop
	set	0x3D, %i7
	stb	%l4,	[%l7 + %i7]
	nop
	set	0x6F, %o6
	ldstub	[%l7 + %o6],	%l1
	ld	[%l7 + 0x30],	%f23
	nop
	set	0x08, %l3
	std	%l0,	[%l7 + %l3]
	set	0x2C, %l5
	stba	%l6,	[%l7 + %l5] 0xea
	membar	#Sync
	add	%g4,	%l5,	%o3
	bg,a	%xcc,	loop_66
	nop
	set	0x08, %l2
	stw	%l2,	[%l7 + %l2]
	nop
	set	0x28, %l6
	stw	%l3,	[%l7 + %l6]
	nop
	set	0x18, %g3
	std	%f28,	[%l7 + %g3]
loop_66:
	nop
	set	0x20, %g4
	std	%i2,	[%l7 + %g4]
	set	0x6C, %o3
	stba	%g1,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x58, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x48, %o5
	std	%f6,	[%l7 + %o5]
	ble	%icc,	loop_67
	nop
	set	0x0C, %g2
	prefetch	[%l7 + %g2],	 3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
loop_67:
	nop
	nop
	setx	0xAAEBB6EB4DA509F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x389FCB32684F382B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f20,	%f20
	set	0x58, %o7
	swapa	[%l7 + %o7] 0x88,	%g3
	set	0x60, %i3
	sta	%f20,	[%l7 + %i3] 0x81
	or	%i5,	%i4,	%i3
	and	%i1,	%i7,	%o1
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x08, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x62, %i2
	ldsb	[%l7 + %i2],	%g6
	nop
	set	0x78, %i4
	prefetch	[%l7 + %i4],	 1
	set	0x74, %l1
	stwa	%o4,	[%l7 + %l1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x38],	%f6
	add	%o6,	%i6,	%g2
	nop
	set	0x3D, %g7
	ldstub	[%l7 + %g7],	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%i0
	nop
	set	0x09, %g6
	ldstub	[%l7 + %g6],	%g5
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 2
	set	0x26, %o0
	stha	%g7,	[%l7 + %o0] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l4
	ld	[%l7 + 0x44],	%f6
	wr	%l6,	%g4,	%y
	set	0x6C, %i5
	stha	%l0,	[%l7 + %i5] 0x88
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%l2
	and	%l3,	%l5,	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%i2
	set	0x68, %o1
	stwa	%i4,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x34, %i6
	stwa	%i5,	[%l7 + %i6] 0x88
	nop
	set	0x70, %o2
	std	%i2,	[%l7 + %o2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%i7
	st	%fsr,	[%l7 + 0x08]
	st	%f4,	[%l7 + 0x78]
	set	0x2F, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o1
	st	%f14,	[%l7 + 0x30]
	nop
	set	0x64, %g5
	swap	[%l7 + %g5],	%o7
	ld	[%l7 + 0x44],	%f12
	set	0x20, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g6
	and	%o6,	%o4,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%o0
	set	0x3C, %o6
	stha	%i0,	[%l7 + %o6] 0x88
	nop
	set	0x50, %l3
	stb	%o2,	[%l7 + %l3]
	nop
	set	0x33, %i7
	stb	%o5,	[%l7 + %i7]
	set	0x44, %l2
	lda	[%l7 + %l2] 0x88,	%f16
	nop
	set	0x34, %l5
	lduh	[%l7 + %l5],	%g7
	nop
	set	0x0C, %g3
	swap	[%l7 + %g3],	%l1
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x89,	%g5
	nop
	set	0x24, %g4
	swap	[%l7 + %g4],	%l4
	set	0x48, %l4
	stha	%g4,	[%l7 + %l4] 0x81
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%l0
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x4D, %l0
	stb	%l2,	[%l7 + %l0]
	fpsub16	%f16,	%f0,	%f22
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x89,	 3
	st	%f7,	[%l7 + 0x64]
	nop
	set	0x1A, %o7
	stb	%l5,	[%l7 + %o7]
	set	0x20, %i0
	stwa	%o3,	[%l7 + %i0] 0xea
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%i2
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%g2
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%i4
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%i4
	nop
	set	0x60, %g7
	lduw	[%l7 + %g7],	%i3
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%i7
	nop
	set	0x70, %g1
	swap	[%l7 + %g1],	%i1
	and	%o1,	%g6,	%o7
	nop
	set	0x16, %o0
	ldub	[%l7 + %o0],	%o4
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x89,	%o6
	ld	[%l7 + 0x50],	%f26
	st	%fsr,	[%l7 + 0x60]
	set	0x48, %i6
	stda	%g2,	[%l7 + %i6] 0x81
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x89,	%i6
	set	0x64, %o2
	stha	%o0,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%i0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd2
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x10, %o6
	stx	%g7,	[%l7 + %o6]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x81
	add	%l1,	%g5,	%o5
	st	%f4,	[%l7 + 0x2C]
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%l4
	nop
	set	0x38, %l5
	ldsw	[%l7 + %l5],	%g4
	set	0x54, %l3
	sta	%f19,	[%l7 + %l3] 0x80
	set	0x23, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l0
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f28
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf8,	%f16
	st	%f25,	[%l7 + 0x34]
	or	%l2,	%l3,	%l6
	st	%f9,	[%l7 + 0x48]
	set	0x6C, %l4
	lda	[%l7 + %l4] 0x80,	%f9
	nop
	set	0x18, %o3
	stb	%l5,	[%l7 + %o3]
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%g1
	set	0x2C, %o5
	lda	[%l7 + %o5] 0x81,	%f6
	set	0x30, %o7
	stda	%i2,	[%l7 + %o7] 0x80
	nop
	set	0x10, %g2
	ldsw	[%l7 + %g2],	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%i4
	add	%i5,	%i3,	%i7
	wr 	%g0, 	0x4, 	%fprs
	bn	%icc,	loop_68
	nop
	set	0x68, %i2
	std	%f10,	[%l7 + %i2]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%o4
loop_68:
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f28
	st	%f19,	[%l7 + 0x40]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x88
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f16
	st	%fsr,	[%l7 + 0x44]
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x80,	 4
	fpsub32s	%f9,	%f11,	%f12
	nop
	set	0x2E, %g1
	ldstub	[%l7 + %g1],	%o6
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f28
	or	%g2,	%o0,	%i6
	nop
	set	0x78, %i3
	swap	[%l7 + %i3],	%i0
	st	%fsr,	[%l7 + 0x64]
	set	0x38, %i5
	stxa	%g7,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x32, %i6
	stba	%o2,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%g5
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x80,	 0
	set	0x1A, %i1
	stha	%l4,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x40, %o1
	lda	[%l7 + %o1] 0x88,	%f11
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	set	0x44, %o6
	stba	%o5,	[%l7 + %o6] 0x81
	set	0x7B, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l0
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%l2
	wr	%l6,	%l3,	%set_softint
	set	0x24, %g5
	sta	%f19,	[%l7 + %g5] 0x80
	and	%l5,	%g1,	%o3
	set	0x3C, %l5
	stwa	%g3,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x88
	set	0x20, %l3
	stxa	%i4,	[%l7 + %l3] 0x89
	nop
	set	0x79, %g4
	ldub	[%l7 + %g4],	%i2
	and	%i3,	%i5,	%i1
	wr	%g6,	%i7,	%set_softint
	set	0x38, %l4
	stba	%o1,	[%l7 + %l4] 0x80
	nop
	set	0x50, %l6
	swap	[%l7 + %l6],	%o7
	set	0x3C, %l0
	stba	%o6,	[%l7 + %l0] 0x81
	bne,a	%icc,	loop_69
	or	%o4,	%g2,	%i6
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x88,	 1
loop_69:
	nop
	set	0x38, %o5
	stda	%o0,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x50, %o7
	stda	%o2,	[%l7 + %o7] 0x88
	bge,pt	%icc,	loop_70
	fpsub16s	%f19,	%f12,	%f3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%l1
loop_70:
	nop
	set	0x10, %i2
	swapa	[%l7 + %i2] 0x80,	%g5
	set	0x58, %g2
	ldxa	[%l7 + %g2] 0x81,	%g4
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc2
	or	%o5,	%l4,	%l0
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%l2
	nop
	set	0x41, %g6
	stb	%l3,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x18, %g1
	stx	%l6,	[%l7 + %g1]
	bl,pn	%icc,	loop_71
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%g0
	nop
	set	0x18, %g7
	stx	%o3,	[%l7 + %g7]
	add	%g3,	%i4,	%l5
loop_71:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%i5
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f4
	nop
	set	0x68, %i5
	stx	%i3,	[%l7 + %i5]
	nop
	set	0x40, %i6
	ldsw	[%l7 + %i6],	%g6
	set	0x40, %o0
	prefetcha	[%l7 + %o0] 0x81,	 4
	nop
	nop
	setx	0xF8D7CC21,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xE2D997E5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f22,	%f9
	nop
	set	0x47, %o2
	ldub	[%l7 + %o2],	%o1
	set	0x30, %i1
	lda	[%l7 + %i1] 0x81,	%f5
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%i7
	and	%o6,	%o7,	%g2
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x89,	%o4
	wr	%i6,	%i0,	%set_softint
	fpadd16	%f0,	%f14,	%f14
	set	0x20, %o4
	stxa	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%g7
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f12
	bne,a,pt	%xcc,	loop_72
	nop
	set	0x32, %l5
	sth	%o2,	[%l7 + %l5]
	set	0x58, %i7
	sta	%f11,	[%l7 + %i7] 0x88
loop_72:
	fpsub32	%f4,	%f12,	%f16
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	nop
	set	0x38, %g4
	std	%f2,	[%l7 + %g4]
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	nop
	set	0x1C, %l6
	ldsb	[%l7 + %l6],	%l1
	nop
	set	0x4A, %g3
	lduh	[%l7 + %g3],	%o5
	bleu,a,pn	%xcc,	loop_73
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%l4
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%l0
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%g4
loop_73:
	nop
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%f0
	nop
	set	0x44, %g2
	lduw	[%l7 + %g2],	%l2
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%g1
	nop
	set	0x28, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x7A, %g6
	lduh	[%l7 + %g6],	%g3
	nop
	set	0x3C, %g7
	ldsh	[%l7 + %g7],	%i4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%l5
	nop
	set	0x3C, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x32, %i5
	lduh	[%l7 + %i5],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%i5
	nop
	set	0x54, %i4
	sth	%g6,	[%l7 + %i4]
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x80,	%i1
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%i7
	nop
	set	0x08, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x0D, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o1
	set	0x7C, %o6
	stwa	%o6,	[%l7 + %o6] 0x81
	nop
	set	0x50, %i1
	ldsh	[%l7 + %i1],	%g2
	nop
	set	0x4C, %o4
	sth	%o4,	[%l7 + %o4]
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x81,	%o7
	set	0x53, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o0
	nop
	set	0x58, %l3
	std	%f28,	[%l7 + %l3]
	nop
	set	0x60, %g4
	std	%g6,	[%l7 + %g4]
	nop
	set	0x50, %l4
	std	%f18,	[%l7 + %l4]
	nop
	set	0x6C, %g5
	lduw	[%l7 + %g5],	%i0
	nop
	set	0x08, %g3
	std	%f14,	[%l7 + %g3]
	nop
	set	0x70, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x50, %l6
	std	%f4,	[%l7 + %l6]
	nop
	set	0x52, %l0
	ldub	[%l7 + %l0],	%o2
	set	0x14, %i2
	stwa	%l1,	[%l7 + %i2] 0x89
	nop
	set	0x7C, %o7
	ldub	[%l7 + %o7],	%o5
	fpsub16	%f18,	%f26,	%f18
	nop
	set	0x30, %l1
	stb	%l4,	[%l7 + %l1]
	nop
	set	0x5A, %o5
	ldstub	[%l7 + %o5],	%g5
	set	0x44, %i0
	sta	%f28,	[%l7 + %i0] 0x89
	or	%g4,	%l0,	%l6
	nop
	set	0x30, %g1
	std	%f18,	[%l7 + %g1]
	set	0x44, %g2
	stwa	%l2,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%g1
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc0
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x81,	%l2
	nop
	set	0x30, %i4
	swap	[%l7 + %i4],	%g3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f0
	set	0x24, %o2
	stba	%i4,	[%l7 + %o2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	nop
	set	0x5E, %i6
	ldsh	[%l7 + %i6],	%o3
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%l5
	set	0x34, %o6
	swapa	[%l7 + %o6] 0x88,	%i3
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%i5
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc4
	bn	%icc,	loop_74
	ble,pn	%xcc,	loop_75
	nop
	set	0x18, %l5
	prefetch	[%l7 + %l5],	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%i1
loop_74:
	nop
	set	0x5E, %i7
	lduh	[%l7 + %i7],	%i2
loop_75:
	fpsub16s	%f5,	%f9,	%f15
	set	0x5E, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i7
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x81,	 1
	nop
	set	0x77, %l4
	ldsb	[%l7 + %l4],	%o1
	nop
	set	0x08, %g3
	std	%f20,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x39, %g5
	ldstub	[%l7 + %g5],	%o4
	nop
	set	0x20, %l6
	swap	[%l7 + %l6],	%g2
	set	0x6C, %o3
	sta	%f27,	[%l7 + %o3] 0x89
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f16
	add	%o7,	%i6,	%g7
	set	0x3C, %i2
	stha	%i0,	[%l7 + %i2] 0x89
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x2A, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o0
	set	0x1E, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l1
	set	0x5F, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o5
	ld	[%l7 + 0x34],	%f12
	set	0x44, %g2
	stwa	%o2,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x89,	%l4
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%g4
	or	%l0,	%l6,	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g3
	nop
	set	0x48, %i5
	std	%l2,	[%l7 + %i5]
	fpadd32s	%f20,	%f0,	%f12
	set	0x11, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o3
	ba,pt	%icc,	loop_76
	nop
	set	0x79, %o0
	stb	%i4,	[%l7 + %o0]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
loop_76:
	nop
	set	0x34, %o1
	stwa	%l5,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	set	0x18, %i1
	stwa	%i5,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x10, %o2
	lda	[%l7 + %o2] 0x81,	%f30
	nop
	set	0x10, %o4
	std	%g6,	[%l7 + %o4]
	fpsub16s	%f22,	%f0,	%f26
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf9
	membar	#Sync
	and	%i1,	%i3,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%i2
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	ld	[%l7 + 0x7C],	%f9
	fpsub32s	%f13,	%f8,	%f8
	bl,a	%icc,	loop_77
	nop
	set	0x43, %i7
	ldstub	[%l7 + %i7],	%g2
	nop
	set	0x3E, %l5
	ldub	[%l7 + %l5],	%o7
	add	%i6,	%g7,	%i0
loop_77:
	nop
	set	0x58, %g4
	std	%f10,	[%l7 + %g4]
	nop
	set	0x5A, %l4
	stb	%o1,	[%l7 + %l4]
	nop
	set	0x2A, %l3
	sth	%o0,	[%l7 + %l3]
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x81,	%o5
	set	0x60, %g3
	lda	[%l7 + %g3] 0x81,	%f8
	set	0x3A, %o3
	stba	%o2,	[%l7 + %o3] 0x88
	nop
	set	0x49, %l6
	ldsb	[%l7 + %l6],	%l4
	set	0x10, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l1
	st	%f22,	[%l7 + 0x70]
	set	0x70, %o7
	stda	%g4,	[%l7 + %o7] 0x89
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xd2
	and	%g5,	%l6,	%l0
	set	0x24, %l0
	sta	%f17,	[%l7 + %l0] 0x88
	nop
	set	0x70, %l1
	swap	[%l7 + %l1],	%l3
	set	0x5C, %i0
	swapa	[%l7 + %i0] 0x81,	%g1
	nop
	set	0x40, %g2
	ldsw	[%l7 + %g2],	%l2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%i4
	nop
	set	0x0D, %g6
	ldsb	[%l7 + %g6],	%l5
	wr	%g3,	%i5,	%pic
	st	%f8,	[%l7 + 0x2C]
	nop
	set	0x68, %g1
	stx	%fsr,	[%l7 + %g1]
	st	%f13,	[%l7 + 0x20]
	bn,pt	%icc,	loop_78
	and	%g6,	%i3,	%i1
	nop
	set	0x5C, %g7
	ldsw	[%l7 + %g7],	%i7
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i2
loop_78:
	nop
	set	0x1E, %o0
	ldsb	[%l7 + %o0],	%o4
	set	0x28, %i4
	stxa	%o6,	[%l7 + %i4] 0x89
	ld	[%l7 + 0x50],	%f28
	set	0x68, %i5
	ldxa	[%l7 + %i5] 0x80,	%o7
	and	%i6,	%g2,	%g7
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f24
	nop
	set	0x4F, %i1
	stb	%i0,	[%l7 + %i1]
	nop
	set	0x2C, %o1
	sth	%o1,	[%l7 + %o1]
	nop
	set	0x34, %o4
	lduw	[%l7 + %o4],	%o5
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x81,	%o2
	or	%o0,	%l4,	%g4
	nop
	set	0x54, %o6
	stw	%g5,	[%l7 + %o6]
	nop
	set	0x7C, %l2
	stw	%l6,	[%l7 + %l2]
	set	0x60, %i7
	ldda	[%l7 + %i7] 0xea,	%l0
	set	0x10, %l5
	stxa	%l0,	[%l7 + %l5] 0xe2
	membar	#Sync
	fpsub16	%f12,	%f16,	%f16
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%l3
	nop
	set	0x34, %l3
	stw	%g1,	[%l7 + %l3]
	set	0x1C, %g5
	stha	%l2,	[%l7 + %g5] 0x80
	nop
	set	0x18, %l4
	lduw	[%l7 + %l4],	%i4
	nop
	set	0x10, %g3
	std	%f18,	[%l7 + %g3]
	nop
	set	0x74, %o3
	prefetch	[%l7 + %o3],	 1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f0
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x68, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x28, %o7
	stx	%i5,	[%l7 + %o7]
	set	0x4F, %o5
	ldstuba	[%l7 + %o5] 0x80,	%l5
	nop
	set	0x64, %l0
	ldsw	[%l7 + %l0],	%i3
	nop
	set	0x4C, %l1
	ldsw	[%l7 + %l1],	%g6
	nop
	set	0x69, %g2
	ldstub	[%l7 + %g2],	%i7
	set	0x63, %g6
	stba	%i2,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x62, %g1
	ldstub	[%l7 + %g1],	%i1
	st	%fsr,	[%l7 + 0x4C]
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x80,	%o6
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 1
	fpsub32s	%f2,	%f14,	%f19
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x89,	%o7
	set	0x24, %i3
	stwa	%o4,	[%l7 + %i3] 0xe3
	membar	#Sync
	or	%i6,	%g7,	%g2
	nop
	set	0x4E, %i5
	sth	%o1,	[%l7 + %i5]
	fpadd16s	%f14,	%f20,	%f13
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%o4
	set	0x4C, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i0
	ld	[%l7 + 0x7C],	%f3
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%o0
	st	%f9,	[%l7 + 0x10]
	st	%f1,	[%l7 + 0x5C]
	nop
	set	0x20, %o4
	std	%o2,	[%l7 + %o4]
	fpsub16s	%f31,	%f26,	%f7
	and	%g4,	%g5,	%l6
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f4
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x81,	%l1
	nop
	set	0x58, %i7
	std	%l0,	[%l7 + %i7]
	set	0x52, %l2
	stha	%l3,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x58, %g4
	sta	%f4,	[%l7 + %g4] 0x88
	set	0x4C, %l5
	stba	%g1,	[%l7 + %l5] 0x81
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd2
	set	0x2C, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l2
	nop
	set	0x58, %l4
	lduh	[%l7 + %l4],	%i4
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x34, %o3
	lduh	[%l7 + %o3],	%o3
	nop
	set	0x70, %l6
	ldx	[%l7 + %l6],	%l4
	nop
	set	0x50, %g3
	std	%f20,	[%l7 + %g3]
	nop
	set	0x50, %o7
	std	%f4,	[%l7 + %o7]
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x89,	%g3
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf8
	membar	#Sync
	nop
	set	0x08, %l1
	lduh	[%l7 + %l1],	%i5
	nop
	set	0x72, %g2
	lduh	[%l7 + %g2],	%l5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc8
	nop
	set	0x14, %g1
	stw	%i3,	[%l7 + %g1]
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%i7
	set	0x40, %g7
	stba	%i2,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x21, %o0
	stba	%i1,	[%l7 + %o0] 0x89
	nop
	set	0x38, %i3
	swap	[%l7 + %i3],	%o6
	st	%f15,	[%l7 + 0x64]
	add	%o7,	%g6,	%i6
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x7C, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x70, %i1
	stb	%g2,	[%l7 + %i1]
	fpadd32	%f28,	%f0,	%f6
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%o1
	set	0x68, %o4
	stba	%g7,	[%l7 + %o4] 0x88
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f14
	set	0x70, %i4
	swapa	[%l7 + %i4] 0x81,	%o5
	and	%i0,	%o0,	%o2
	set	0x68, %i7
	stha	%g4,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xda,	%f0
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	bleu,pt	%icc,	loop_79
	nop
	set	0x50, %g4
	stx	%g5,	[%l7 + %g4]
	or	%l6,	%l1,	%l3
	set	0x70, %l3
	sta	%f8,	[%l7 + %l3] 0x81
loop_79:
	nop
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xe2,	%g0
	set	0x38, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	set	0x13, %o3
	stba	%l0,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x81,	%i4
	nop
	set	0x64, %g3
	lduw	[%l7 + %g3],	%l4
	and	%g3,	%i5,	%o3
	set	0x6A, %l4
	stha	%l5,	[%l7 + %l4] 0x89
	ld	[%l7 + 0x10],	%f30
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x48, %o7
	stwa	%i3,	[%l7 + %o7] 0x88
	nop
	set	0x08, %l0
	lduh	[%l7 + %l0],	%i2
	nop
	set	0x38, %g2
	stw	%i7,	[%l7 + %g2]
	nop
	set	0x2A, %l1
	stb	%o6,	[%l7 + %l1]
	nop
	set	0x30, %g6
	std	%i0,	[%l7 + %g6]
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xca
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x52, %g7
	sth	%i6,	[%l7 + %g7]
	add	%o7,	%g2,	%o4
	nop
	set	0x5C, %o0
	stw	%g7,	[%l7 + %o0]
	nop
	set	0x44, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%o1
	nop
	set	0x20, %i5
	stx	%i0,	[%l7 + %i5]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o5
	set	0x62, %i6
	stha	%g4,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x38, %o1
	sta	%f11,	[%l7 + %o1] 0x81
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	set	0x38, %o4
	lda	[%l7 + %o4] 0x89,	%f8
	set	0x25, %o6
	ldstuba	[%l7 + %o6] 0x88,	%g5
	bgu,a	%icc,	loop_80
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x80,	%o2
loop_80:
	nop
	set	0x5B, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l6
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x7D, %g4
	ldub	[%l7 + %g4],	%l1
	st	%fsr,	[%l7 + 0x50]
	st	%f18,	[%l7 + 0x44]
	or	%l3,	%l2,	%l0
	add	%g1,	%i4,	%g3
	nop
	set	0x20, %l5
	ldsh	[%l7 + %l5],	%l4
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x80,	%i5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%o3
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf9
	membar	#Sync
	fpadd16	%f28,	%f10,	%f18
	and	%i2,	%i7,	%i3
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%o6
	set	0x52, %l4
	stha	%g6,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	nop
	set	0x30, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x60, %l0
	lduh	[%l7 + %l0],	%i1
	nop
	set	0x3C, %o7
	lduh	[%l7 + %o7],	%i6
	set	0x50, %g2
	swapa	[%l7 + %g2] 0x81,	%o7
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 3
	add	%g2,	%o4,	%o1
	set	0x38, %g6
	stxa	%g7,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x2E, %i0
	sth	%o0,	[%l7 + %i0]
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%o4
	set	0x54, %o0
	lda	[%l7 + %o0] 0x89,	%f21
	nop
	set	0x1D, %g1
	ldub	[%l7 + %g1],	%g4
	bleu	%icc,	loop_81
	nop
	nop
	setx	0xA1EC3A58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x7B138EA3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f31,	%f8
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	and	%o2,	%l6,	%l3
loop_81:
	nop
	set	0x20, %i3
	swap	[%l7 + %i3],	%l2
	nop
	set	0x50, %i5
	ldsw	[%l7 + %i5],	%l1
	nop
	set	0x58, %i6
	ldsh	[%l7 + %i6],	%l0
	set	0x5C, %o1
	lda	[%l7 + %o1] 0x80,	%f27
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%i4
	add	%g1,	%g3,	%l4
	wr	%i5,	%l5,	%sys_tick
	set	0x30, %i1
	swapa	[%l7 + %i1] 0x88,	%i2
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xeb,	%o2
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%i7
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%i3
	set	0x5C, %o2
	sta	%f28,	[%l7 + %o2] 0x88
	st	%fsr,	[%l7 + 0x0C]
	set	0x3C, %l2
	swapa	[%l7 + %l2] 0x80,	%o6
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x18, %l5
	stha	%i1,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x4C, %g4
	stb	%i6,	[%l7 + %g4]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc2
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x81,	%f6
	nop
	set	0x4D, %g3
	ldub	[%l7 + %g3],	%o7
	st	%fsr,	[%l7 + 0x50]
	set	0x64, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g6
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	ld	[%l7 + 0x74],	%f5
	nop
	set	0x26, %i2
	lduh	[%l7 + %i2],	%o4
	nop
	set	0x08, %l0
	stx	%o1,	[%l7 + %l0]
	nop
	set	0x35, %o7
	ldsb	[%l7 + %o7],	%g7
	ld	[%l7 + 0x40],	%f31
	nop
	set	0x40, %g2
	std	%o0,	[%l7 + %g2]
	set	0x70, %l1
	stxa	%g4,	[%l7 + %l1] 0x89
	nop
	set	0x58, %g6
	ldub	[%l7 + %g6],	%o5
	add	%g5,	%o2,	%l6
	nop
	nop
	setx	0x4F69952F86202BA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x07DB99F48BD60357,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f18,	%f20
	or	%i0,	%l3,	%l2
	nop
	set	0x48, %l4
	std	%f20,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x38, %g7
	std	%f16,	[%l7 + %g7]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%l1
	nop
	set	0x5B, %i0
	ldsb	[%l7 + %i0],	%i4
	nop
	set	0x40, %g1
	stx	%g1,	[%l7 + %g1]
	and	%l4,	%g3,	%i5
	st	%f16,	[%l7 + 0x28]
	fpadd16s	%f28,	%f30,	%f5
	or	%i2,	%l5,	%o3
	set	0x40, %i3
	stba	%i3,	[%l7 + %i3] 0x80
	set	0x30, %i5
	ldda	[%l7 + %i5] 0xeb,	%o6
	set	0x60, %o0
	sta	%f1,	[%l7 + %o0] 0x81
	set	0x26, %o1
	stba	%i1,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x72, %o5
	sth	%i6,	[%l7 + %o5]
	nop
	set	0x6D, %i6
	ldstub	[%l7 + %i6],	%i7
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%o7
	st	%f13,	[%l7 + 0x34]
	set	0x74, %i1
	stwa	%g6,	[%l7 + %i1] 0xea
	membar	#Sync
	ld	[%l7 + 0x50],	%f1
	nop
	set	0x70, %i4
	std	%g2,	[%l7 + %i4]
	or	%o4,	%o1,	%o0
	set	0x10, %o2
	stxa	%g4,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%g7
	wr	%g5,	%o5,	%pic
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%i6
	st	%f1,	[%l7 + 0x4C]
	st	%f12,	[%l7 + 0x78]
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x80,	%o2
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x81,	%l3
	nop
	set	0x4C, %l3
	stw	%i0,	[%l7 + %l3]
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f24
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	nop
	set	0x74, %l5
	stw	%l0,	[%l7 + %l5]
	set	0x5E, %l6
	stba	%i4,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x30, %i2
	stda	%g0,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x40, %o3
	std	%f2,	[%l7 + %o3]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%g3
	or	%l4,	%i2,	%l5
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 0
	nop
	set	0x08, %g2
	ldub	[%l7 + %g2],	%o3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%o6
	st	%f9,	[%l7 + 0x74]
	and	%i3,	%i6,	%i1
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%o4
	set	0x78, %l4
	stwa	%o1,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x09, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g6
	nop
	set	0x36, %g6
	lduh	[%l7 + %g6],	%o0
	or	%g4,	%g5,	%g7
	set	0x64, %g1
	lda	[%l7 + %g1] 0x81,	%f15
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%l6
	nop
	set	0x20, %i0
	std	%f28,	[%l7 + %i0]
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x81,	 1
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x66, %i5
	stha	%i0,	[%l7 + %i5] 0x89
	or	%o2,	%l0,	%i4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f0
	set	0x58, %o4
	sta	%f23,	[%l7 + %o4] 0x80
	set	0x5C, %i1
	stwa	%l2,	[%l7 + %i1] 0x89
	nop
	set	0x7A, %o5
	ldsh	[%l7 + %o5],	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%l4
	or	%i2,	%l5,	%l1
	nop
	set	0x40, %o2
	ldsh	[%l7 + %o2],	%i5
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x88,	 1
	nop
	set	0x17, %i7
	ldsb	[%l7 + %i7],	%i3
	set	0x58, %l2
	stda	%o2,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x50, %i4
	stx	%i6,	[%l7 + %i4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x57F, 	%tick_cmpr
	ld	[%l7 + 0x50],	%f28
	nop
	set	0x70, %l3
	prefetch	[%l7 + %l3],	 2
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x89,	%f23
	nop
	set	0x18, %g4
	std	%f2,	[%l7 + %g4]
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xeb,	%o0
	set	0x18, %l6
	lda	[%l7 + %l6] 0x81,	%f15
	set	0x46, %i2
	stba	%g6,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x89,	%o0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xca
	nop
	set	0x38, %l5
	std	%f8,	[%l7 + %l5]
	add	%g4,	%o7,	%g5
	nop
	set	0x16, %o7
	ldsb	[%l7 + %o7],	%o5
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f2
	nop
	set	0x20, %l1
	stx	%l6,	[%l7 + %l1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g7
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x80,	%o2
	set	0x50, %l4
	ldda	[%l7 + %l4] 0x81,	%i0
	fpadd16s	%f27,	%f29,	%f9
	set	0x4A, %g6
	stba	%i4,	[%l7 + %g6] 0xea
	membar	#Sync
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%l2
	add	%g3,	%g1,	%i2
	set	0x54, %g1
	lda	[%l7 + %g1] 0x80,	%f30
	set	0x34, %i0
	swapa	[%l7 + %i0] 0x88,	%l5
	nop
	set	0x3A, %o0
	lduh	[%l7 + %o0],	%l4
	st	%f10,	[%l7 + 0x24]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x68, %o1
	std	%o6,	[%l7 + %o1]
	nop
	set	0x6E, %i3
	stb	%i3,	[%l7 + %i3]
	set	0x6C, %i5
	sta	%f20,	[%l7 + %i5] 0x88
	set	0x41, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i6
	set	0x64, %i1
	lda	[%l7 + %i1] 0x80,	%f28
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%i0
	nop
	set	0x4E, %i6
	sth	%i7,	[%l7 + %i6]
	and	%o3,	%g2,	%o4
	or	%o1,	%o0,	%g4
	nop
	set	0x60, %o6
	ldub	[%l7 + %o6],	%g6
	nop
	set	0x20, %i7
	lduw	[%l7 + %i7],	%o7
	ld	[%l7 + 0x6C],	%f27
	ld	[%l7 + 0x74],	%f24
	set	0x50, %l2
	stda	%o4,	[%l7 + %l2] 0x89
	st	%f0,	[%l7 + 0x34]
	ld	[%l7 + 0x38],	%f23
	nop
	set	0x08, %i4
	stx	%g5,	[%l7 + %i4]
	bg,a	%xcc,	loop_82
	nop
	set	0x51, %l3
	stb	%l6,	[%l7 + %l3]
	nop
	set	0x50, %g5
	std	%f2,	[%l7 + %g5]
	set	0x3F, %g4
	stba	%l3,	[%l7 + %g4] 0xeb
	membar	#Sync
loop_82:
	nop
	set	0x08, %g3
	lduw	[%l7 + %g3],	%o2
	set	0x0C, %o2
	swapa	[%l7 + %o2] 0x81,	%i0
	nop
	set	0x44, %i2
	ldsh	[%l7 + %i2],	%i4
	nop
	set	0x60, %l6
	std	%f6,	[%l7 + %l6]
	set	0x58, %l0
	ldstuba	[%l7 + %l0] 0x81,	%g7
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	or	%l0,	%l2,	%g1
	nop
	set	0x14, %g2
	ldsh	[%l7 + %g2],	%g3
	fpadd16s	%f31,	%f12,	%f25
	nop
	set	0x48, %l1
	stx	%l5,	[%l7 + %l1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%l1
	set	0x50, %o7
	sta	%f15,	[%l7 + %o7] 0x80
	fpadd16s	%f13,	%f21,	%f10
	set	0x40, %l4
	sta	%f19,	[%l7 + %l4] 0x88
	nop
	set	0x54, %g7
	ldstub	[%l7 + %g7],	%l4
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%i4
	nop
	set	0x1C, %g6
	ldsw	[%l7 + %g6],	%i3
	nop
	set	0x19, %i0
	ldub	[%l7 + %i0],	%o6
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	or	%i1,	%i7,	%i6
	set	0x20, %i3
	swapa	[%l7 + %i3] 0x88,	%o3
	set	0x2C, %i5
	swapa	[%l7 + %i5] 0x80,	%o4
	nop
	set	0x74, %o4
	sth	%g2,	[%l7 + %o4]
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f0
	set	0x54, %o5
	stwa	%o0,	[%l7 + %o5] 0x81
	add	%o1,	%g6,	%g4
	set	0x10, %i1
	stda	%o6,	[%l7 + %i1] 0x80
	set	0x34, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o5
	bn,a	%icc,	loop_83
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%i6
	nop
	set	0x48, %i7
	std	%l2,	[%l7 + %i7]
	add	%o2,	%i0,	%g5
loop_83:
	nop
	set	0x6E, %l2
	ldsh	[%l7 + %l2],	%g7
	set	0x2C, %l3
	sta	%f3,	[%l7 + %l3] 0x89
	st	%f4,	[%l7 + 0x78]
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x40, %g4
	stx	%i4,	[%l7 + %g4]
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x81,	%l2
	nop
	set	0x5C, %o2
	ldsb	[%l7 + %o2],	%l0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf9
	membar	#Sync
	nop
	set	0x52, %l6
	stb	%g3,	[%l7 + %l6]
	nop
	set	0x2B, %l0
	ldsb	[%l7 + %l0],	%l5
	set	0x34, %g5
	swapa	[%l7 + %g5] 0x81,	%g1
	nop
	set	0x2C, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x54, %o3
	stha	%i2,	[%l7 + %o3] 0x81
	nop
	set	0x08, %g2
	swap	[%l7 + %g2],	%l1
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xd8
	nop
	set	0x0C, %l1
	lduh	[%l7 + %l1],	%i5
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f12
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f2
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x4A, %g1
	stha	%i3,	[%l7 + %g1] 0xea
	membar	#Sync
	bg,a	%xcc,	loop_84
	nop
	set	0x5D, %o1
	ldsb	[%l7 + %o1],	%o6
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x81,	%l4
loop_84:
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%i7
	nop
	set	0x58, %o4
	swap	[%l7 + %o4],	%i1
	set	0x4E, %o0
	stba	%i6,	[%l7 + %o0] 0x88
	nop
	set	0x5A, %o5
	ldub	[%l7 + %o5],	%o3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	set	0x1C, %i0
	stwa	%g2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x5A, %o6
	ldub	[%l7 + %o6],	%o4
	nop
	set	0x7D, %i6
	stb	%o0,	[%l7 + %i6]
	nop
	set	0x09, %l2
	ldsb	[%l7 + %l2],	%g6
	set	0x56, %l3
	stba	%o1,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x09, %i7
	ldstub	[%l7 + %i7],	%o7
	set	0x6C, %i4
	lda	[%l7 + %i4] 0x89,	%f19
	or	%o5,	%g4,	%l3
	nop
	set	0x2C, %g3
	ldsw	[%l7 + %g3],	%l6
	nop
	set	0x6C, %g4
	lduw	[%l7 + %g4],	%o2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f16
	set	0x24, %l6
	stha	%i0,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x39, %i2
	stba	%g7,	[%l7 + %i2] 0xe2
	membar	#Sync
	fpadd16s	%f23,	%f15,	%f2
	nop
	set	0x38, %l0
	prefetch	[%l7 + %l0],	 4
	fpadd32	%f20,	%f10,	%f30
	nop
	nop
	setx	0x1D8CBF856F4E9EB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xDCDAA767C1B9CA80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f16,	%f6
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%g5
	st	%fsr,	[%l7 + 0x4C]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l2
	set	0x74, %o3
	stha	%l0,	[%l7 + %o3] 0xe3
	membar	#Sync
	and	%g3,	%l5,	%g1
	set	0x58, %l5
	sta	%f13,	[%l7 + %l5] 0x89
	nop
	set	0x5C, %o7
	swap	[%l7 + %o7],	%l1
	add	%i2,	%i3,	%o6
	ble,a	%xcc,	loop_85
	nop
	set	0x70, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
loop_85:
	wr	%i5,	%l4,	%softint
	nop
	set	0x38, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x28, %g7
	std	%i6,	[%l7 + %g7]
	fpadd16	%f22,	%f2,	%f14
	nop
	set	0x68, %g1
	stx	%i1,	[%l7 + %g1]
	set	0x7C, %g6
	lda	[%l7 + %g6] 0x80,	%f0
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%i6
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x88,	 0
	set	0x58, %i5
	stxa	%o3,	[%l7 + %i5] 0x88
	set	0x1F, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o1
	set	0x76, %o4
	stha	%o7,	[%l7 + %o4] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%g4
	set	0x1A, %o5
	stba	%l3,	[%l7 + %o5] 0xe2
	membar	#Sync
	wr	%o5,	%l6,	%pic
	set	0x48, %i0
	stxa	%i0,	[%l7 + %i0] 0x80
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%o2
	set	0x24, %o6
	swapa	[%l7 + %o6] 0x80,	%g5
	set	0x50, %i1
	lda	[%l7 + %i1] 0x88,	%f20
	set	0x77, %i6
	stba	%l2,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x81,	 1
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%g3
	set	0x38, %i7
	lda	[%l7 + %i7] 0x80,	%f10
	set	0x2C, %g3
	sta	%f8,	[%l7 + %g3] 0x89
	set	0x20, %g4
	swapa	[%l7 + %g4] 0x80,	%l0
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f30
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%f24
	fpsub32	%f18,	%f20,	%f6
	nop
	set	0x78, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%l5
	nop
	set	0x40, %l6
	ldstub	[%l7 + %l6],	%g1
	set	0x08, %g5
	lda	[%l7 + %g5] 0x89,	%f12
	set	0x24, %o3
	swapa	[%l7 + %o3] 0x89,	%i2
	nop
	set	0x4D, %l5
	ldstub	[%l7 + %l5],	%l1
	set	0x68, %g2
	swapa	[%l7 + %g2] 0x89,	%i3
	set	0x76, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%i7
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%i4
	set	0x32, %g7
	stha	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	ld	[%l7 + 0x3C],	%f11
	set	0x71, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i1
	nop
	set	0x38, %l4
	std	%g2,	[%l7 + %l4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o4
	ld	[%l7 + 0x4C],	%f14
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xea,	%o0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	nop
	set	0x4D, %i3
	ldsb	[%l7 + %i3],	%o7
	nop
	set	0x2E, %o0
	ldsh	[%l7 + %o0],	%o0
	set	0x18, %o4
	stxa	%g4,	[%l7 + %o4] 0x88
	nop
	set	0x60, %i5
	stx	%l3,	[%l7 + %i5]
	and	%o5,	%g6,	%l6
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	set	0x10, %o5
	stda	%g6,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xe2,	%o2
	set	0x10, %i1
	stda	%l2,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x0C, %l2
	ldsb	[%l7 + %l2],	%i4
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f12
	set	0x48, %i7
	sta	%f7,	[%l7 + %i7] 0x88
	nop
	set	0x78, %l3
	sth	%g3,	[%l7 + %l3]
	nop
	set	0x40, %g4
	std	%g4,	[%l7 + %g4]
	nop
	set	0x0C, %o2
	sth	%l0,	[%l7 + %o2]
	nop
	set	0x60, %i4
	std	%l4,	[%l7 + %i4]
	set	0x08, %i2
	lda	[%l7 + %i2] 0x80,	%f27
	nop
	nop
	setx	0x208F6D18,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x1C5D0FAB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f2,	%f20
	nop
	set	0x52, %g3
	ldsb	[%l7 + %g3],	%g1
	add	%l1,	%i2,	%o6
	nop
	set	0x60, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x20, %l0
	ldda	[%l7 + %l0] 0xe3,	%l4
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%i3
	fpadd32s	%f21,	%f27,	%f4
	fpadd32s	%f9,	%f21,	%f22
	set	0x10, %g5
	sta	%f9,	[%l7 + %g5] 0x88
	nop
	set	0x28, %g2
	lduw	[%l7 + %g2],	%i5
	set	0x68, %o7
	stda	%i6,	[%l7 + %o7] 0x81
	set	0x58, %l1
	ldxa	[%l7 + %l1] 0x88,	%i6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%g2
	set	0x54, %l5
	swapa	[%l7 + %l5] 0x89,	%o4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd8
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x80,	%o1
	set	0x2E, %o1
	stha	%o0,	[%l7 + %o1] 0x81
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x88,	%l2
	nop
	set	0x16, %i3
	ldsh	[%l7 + %i3],	%g4
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x10, %o0
	stw	%g6,	[%l7 + %o0]
	set	0x4C, %i5
	lda	[%l7 + %i5] 0x89,	%f20
	add	%o5,	%i0,	%g7
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%o2
	and	%l2,	%i4,	%g3
	be,a,pt	%xcc,	loop_86
	nop
	set	0x40, %o5
	lduh	[%l7 + %o5],	%l6
	add	%l0,	%l5,	%g1
	st	%fsr,	[%l7 + 0x60]
loop_86:
	nop
	set	0x7C, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l1,	%i2,	%o6
	nop
	set	0x7C, %i1
	stb	%l4,	[%l7 + %i1]
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%i3
	nop
	set	0x08, %l2
	std	%f20,	[%l7 + %l2]
	nop
	set	0x24, %i7
	lduw	[%l7 + %i7],	%g5
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f30
	st	%f21,	[%l7 + 0x24]
	set	0x54, %i6
	sta	%f20,	[%l7 + %i6] 0x80
	nop
	set	0x38, %g4
	ldsb	[%l7 + %g4],	%i5
	nop
	set	0x7C, %i4
	lduw	[%l7 + %i4],	%i7
	set	0x5A, %o2
	stha	%i1,	[%l7 + %o2] 0x89
	fpsub16	%f4,	%f30,	%f14
	set	0x09, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i6
	set	0x38, %i2
	stxa	%o4,	[%l7 + %i2] 0x81
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f22
	nop
	set	0x42, %l6
	lduh	[%l7 + %l6],	%g2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xda,	%f16
	set	0x3C, %g5
	sta	%f6,	[%l7 + %g5] 0x89
	nop
	set	0x1C, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%o2
	ld	[%l7 + 0x54],	%f31
	nop
	set	0x08, %l5
	stx	%fsr,	[%l7 + %l5]
	bne,a	%icc,	loop_87
	nop
	set	0x34, %g1
	stb	%o7,	[%l7 + %g1]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xda
loop_87:
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%o0
	nop
	set	0x28, %l1
	lduw	[%l7 + %l1],	%o1
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x5C, %g6
	prefetch	[%l7 + %g6],	 3
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%l3
	nop
	set	0x28, %i3
	stx	%g4,	[%l7 + %i3]
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x89,	%o5
	nop
	set	0x54, %i5
	prefetch	[%l7 + %i5],	 4
	nop
	set	0x57, %o5
	ldstub	[%l7 + %o5],	%i0
	set	0x64, %o4
	sta	%f1,	[%l7 + %o4] 0x89
	set	0x63, %i0
	stba	%g6,	[%l7 + %i0] 0x80
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
	nop
	set	0x28, %o6
	stw	%o2,	[%l7 + %o6]
	nop
	set	0x38, %i7
	stw	%g7,	[%l7 + %i7]
	add	%l2,	%i4,	%l6
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	wr	%g3,	%g1,	%ccr
	nop
	set	0x11, %i6
	ldub	[%l7 + %i6],	%l5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%o6
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x78, %g4
	std	%f22,	[%l7 + %g4]
	nop
	set	0x5F, %l2
	stb	%l4,	[%l7 + %l2]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%g5
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	set	0x6C, %g3
	lda	[%l7 + %g3] 0x81,	%f14
	nop
	set	0x24, %i4
	stb	%l1,	[%l7 + %i4]
	set	0x18, %l0
	stda	%i4,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f0
	nop
	set	0x39, %i2
	ldsb	[%l7 + %i2],	%i7
	nop
	set	0x60, %o3
	sth	%i6,	[%l7 + %o3]
	set	0x7E, %o7
	stba	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	fpsub32	%f20,	%f24,	%f10
	set	0x4A, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o4
	set	0x1B, %g2
	stba	%o3,	[%l7 + %g2] 0x88
	nop
	set	0x08, %l5
	ldsh	[%l7 + %l5],	%o7
	nop
	set	0x30, %g1
	stx	%g2,	[%l7 + %g1]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%l3
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f14
	nop
	set	0x2C, %l1
	ldsh	[%l7 + %l1],	%o1
	nop
	set	0x24, %g7
	ldsh	[%l7 + %g7],	%g4
	nop
	set	0x11, %l4
	ldsb	[%l7 + %l4],	%i0
	nop
	set	0x4E, %g6
	lduh	[%l7 + %g6],	%o5
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%o2
	nop
	set	0x20, %i5
	ldsh	[%l7 + %i5],	%g6
	set	0x54, %o5
	stwa	%l2,	[%l7 + %o5] 0x88
	nop
	set	0x6F, %o0
	stb	%i4,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x60]
	set	0x30, %i0
	ldda	[%l7 + %i0] 0xeb,	%i6
	nop
	set	0x2B, %i1
	stb	%l0,	[%l7 + %i1]
	nop
	set	0x6F, %o6
	ldub	[%l7 + %o6],	%g7
	or	%g1,	%l5,	%g3
	set	0x58, %o4
	stxa	%i2,	[%l7 + %o4] 0x81
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%o6
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x89,	%g4
	add	%i3,	%i5,	%l1
	nop
	set	0x08, %i6
	stw	%i7,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x35, %g4
	stb	%i1,	[%l7 + %g4]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%o4
	nop
	set	0x18, %l2
	ldsw	[%l7 + %l2],	%o3
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f16
	nop
	set	0x4A, %i4
	ldstub	[%l7 + %i4],	%o7
	or	%g2,	%i6,	%o0
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%l3
	set	0x20, %l6
	lda	[%l7 + %l6] 0x88,	%f27
	add	%o1,	%i0,	%o5
	st	%fsr,	[%l7 + 0x38]
	bge,a	%icc,	loop_88
	ld	[%l7 + 0x50],	%f30
	nop
	set	0x78, %i2
	stb	%g4,	[%l7 + %i2]
	fpsub16	%f16,	%f2,	%f2
loop_88:
	nop
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f0
	or	%g6,	%l2,	%o2
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	and	%i4,	%l6,	%l0
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xea,	%g0
	nop
	set	0x28, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x26, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x81,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%o6
	nop
	set	0x34, %o1
	ldub	[%l7 + %o1],	%i2
	nop
	set	0x50, %g1
	stx	%i3,	[%l7 + %g1]
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%g5
	bl	%xcc,	loop_89
	nop
	set	0x10, %g7
	stw	%l1,	[%l7 + %g7]
	or	%i7,	%i1,	%i5
	set	0x40, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o4
loop_89:
	ld	[%l7 + 0x20],	%f21
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x88,	%o3
	set	0x50, %i5
	stxa	%o7,	[%l7 + %i5] 0x81
	or	%g2,	%i6,	%o0
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%l3
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	nop
	set	0x15, %i0
	ldstub	[%l7 + %i0],	%o5
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f12
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%g4
	or	%g6,	%l2,	%i0
	nop
	set	0x18, %o4
	ldsb	[%l7 + %o4],	%o2
	set	0x58, %l3
	sta	%f19,	[%l7 + %l3] 0x80
	nop
	set	0x36, %o0
	ldub	[%l7 + %o0],	%i4
	nop
	set	0x28, %g4
	std	%i6,	[%l7 + %g4]
	nop
	set	0x6C, %i7
	stw	%l0,	[%l7 + %i7]
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%g0
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xeb,	%g6
	ld	[%l7 + 0x44],	%f2
	nop
	set	0x4C, %o2
	lduw	[%l7 + %o2],	%g3
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	nop
	set	0x30, %i4
	stx	%o6,	[%l7 + %i4]
	nop
	set	0x16, %l6
	ldstub	[%l7 + %l6],	%i2
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x89,	%i3
	nop
	set	0x5B, %o3
	ldub	[%l7 + %o3],	%l4
	nop
	set	0x5A, %g3
	ldsh	[%l7 + %g3],	%l1
	nop
	set	0x50, %g5
	stx	%g5,	[%l7 + %g5]
	bgu,a	%xcc,	loop_90
	nop
	set	0x68, %l5
	stx	%i1,	[%l7 + %l5]
	nop
	set	0x7C, %o7
	stb	%i5,	[%l7 + %o7]
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f20
loop_90:
	nop
	set	0x5A, %g1
	ldsh	[%l7 + %g1],	%i7
	nop
	set	0x11, %l1
	ldub	[%l7 + %l1],	%o4
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x88
	nop
	set	0x7C, %l4
	stw	%o7,	[%l7 + %l4]
	nop
	set	0x5C, %g6
	lduw	[%l7 + %g6],	%o3
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%i6
	set	0x08, %i3
	stda	%o0,	[%l7 + %i3] 0xea
	membar	#Sync
	fpadd16s	%f15,	%f14,	%f26
	set	0x78, %o5
	stwa	%l3,	[%l7 + %o5] 0xea
	membar	#Sync
	ld	[%l7 + 0x10],	%f7
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x24, %i0
	stw	%o1,	[%l7 + %i0]
	fpsub32	%f6,	%f16,	%f0
	nop
	set	0x10, %o6
	std	%f14,	[%l7 + %o6]
	set	0x10, %o4
	stxa	%g2,	[%l7 + %o4] 0x88
	set	0x0A, %i1
	stba	%o5,	[%l7 + %i1] 0xea
	membar	#Sync
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x58, %l3
	lduw	[%l7 + %l3],	%i0
	set	0x38, %g4
	stxa	%o2,	[%l7 + %g4] 0xe3
	membar	#Sync
	bge	%xcc,	loop_91
	nop
	set	0x3C, %i7
	swap	[%l7 + %i7],	%l2
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%i4
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%i6
loop_91:
	nop
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xc2
	fpsub32s	%f18,	%f0,	%f27
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	add	%g3,	%l5,	%g7
	nop
	set	0x48, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x89,	%i2
	nop
	set	0x68, %l6
	swap	[%l7 + %l6],	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%l4
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x34, %g3
	sta	%f28,	[%l7 + %g3] 0x89
	nop
	set	0x0F, %l5
	ldstub	[%l7 + %l5],	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%l1
	set	0x34, %o7
	sta	%f19,	[%l7 + %o7] 0x80
	set	0x5C, %o1
	swapa	[%l7 + %o1] 0x88,	%i7
	set	0x1C, %l1
	swapa	[%l7 + %l1] 0x81,	%o4
	set	0x60, %g2
	swapa	[%l7 + %g2] 0x81,	%o7
	set	0x15, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o3
	nop
	set	0x20, %g6
	ldx	[%l7 + %g6],	%i5
	set	0x10, %l4
	lda	[%l7 + %l4] 0x80,	%f8
	nop
	set	0x39, %i5
	ldub	[%l7 + %i5],	%o0
	ld	[%l7 + 0x38],	%f29
	set	0x12, %o5
	stha	%l3,	[%l7 + %o5] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x43, %g7
	ldstub	[%l7 + %g7],	%o1
	set	0x18, %i0
	stwa	%i6,	[%l7 + %i0] 0x88
	nop
	set	0x30, %i3
	stw	%o5,	[%l7 + %i3]
	nop
	set	0x3C, %o4
	lduw	[%l7 + %o4],	%g2
	set	0x34, %o6
	sta	%f18,	[%l7 + %o6] 0x88
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f0
	and	%g4,	%g6,	%i0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1252
!	Type a   	: 27
!	Type cti   	: 36
!	Type x   	: 526
!	Type f   	: 53
!	Type i   	: 106
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
	set	0x6,	%g1
	set	0xA,	%g2
	set	0xD,	%g3
	set	0xD,	%g4
	set	0x8,	%g5
	set	0x8,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xB,	%i1
	set	-0xC,	%i2
	set	-0xA,	%i3
	set	-0x2,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x4565A71B,	%l0
	set	0x734E4C2F,	%l1
	set	0x5EBD2296,	%l2
	set	0x50477FA6,	%l3
	set	0x118922E7,	%l4
	set	0x72E064F1,	%l5
	set	0x74C1A33E,	%l6
	!# Output registers
	set	-0x1495,	%o0
	set	0x1B9C,	%o1
	set	-0x068C,	%o2
	set	0x144C,	%o3
	set	-0x07F9,	%o4
	set	0x0F8C,	%o5
	set	-0x05E8,	%o6
	set	0x116F,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	st	%fsr,	[%l7 + 0x1C]
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	set	0x58, %l3
	stwa	%i4,	[%l7 + %l3] 0x88
	nop
	set	0x0A, %i6
	sth	%l6,	[%l7 + %i6]
	nop
	set	0x48, %l2
	std	%f16,	[%l7 + %l2]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f14
	nop
	set	0x2C, %i7
	stw	%l2,	[%l7 + %i7]
	st	%f27,	[%l7 + 0x4C]
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f6
	set	0x70, %o2
	stxa	%g1,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc2
	nop
	set	0x30, %o3
	lduw	[%l7 + %o3],	%l0
	nop
	set	0x58, %l6
	lduw	[%l7 + %l6],	%l5
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%g3
	nop
	set	0x46, %g3
	ldub	[%l7 + %g3],	%i2
	and	%g7,	%i3,	%o6
	ld	[%l7 + 0x78],	%f5
	add	%g5,	%l4,	%i1
	nop
	set	0x38, %l5
	lduw	[%l7 + %l5],	%l1
	nop
	set	0x64, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x60, %o1
	std	%i6,	[%l7 + %o1]
	ble,pn	%xcc,	loop_92
	nop
	set	0x70, %o7
	std	%f12,	[%l7 + %o7]
	wr	%o4,	%o3,	%clear_softint
	set	0x30, %g2
	stxa	%i5,	[%l7 + %g2] 0xe3
	membar	#Sync
loop_92:
	add	%o7,	%o0,	%o1
	nop
	set	0x0A, %l1
	ldstub	[%l7 + %l1],	%i6
	and	%l3,	%g2,	%o5
	set	0x10, %g6
	stda	%g4,	[%l7 + %g6] 0x89
	set	0x38, %g1
	stda	%i0,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x44, %l4
	swapa	[%l7 + %l4] 0x81,	%g6
	nop
	set	0x60, %i5
	stx	%o2,	[%l7 + %i5]
	set	0x08, %g7
	stxa	%i4,	[%l7 + %g7] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	and	%l6,	%l2,	%g1
	add	%l5,	%g3,	%l0
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f8
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%g7
	ld	[%l7 + 0x50],	%f8
	nop
	set	0x3C, %o4
	stw	%i3,	[%l7 + %o4]
	or	%o6,	%i2,	%g5
	ld	[%l7 + 0x6C],	%f26
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%l4
	nop
	set	0x1C, %o6
	stw	%i7,	[%l7 + %o6]
	and	%l1,	%o4,	%o3
	nop
	set	0x5A, %i1
	ldub	[%l7 + %i1],	%o7
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f6
	nop
	set	0x38, %g4
	prefetch	[%l7 + %g4],	 2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%o1
	nop
	set	0x7A, %i6
	ldstub	[%l7 + %i6],	%o0
	nop
	set	0x70, %o0
	std	%f30,	[%l7 + %o0]
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	set	0x1E, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l3
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f2
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%g2
	or	%o5,	%i0,	%g4
	nop
	set	0x2C, %l6
	ldsb	[%l7 + %l6],	%o2
	nop
	set	0x15, %g5
	ldub	[%l7 + %g5],	%g6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f0
	set	0x30, %g3
	stxa	%l6,	[%l7 + %g3] 0x88
	add	%i4,	%g1,	%l2
	add	%l5,	%g3,	%g7
	ld	[%l7 + 0x3C],	%f20
	nop
	set	0x18, %i2
	stx	%i3,	[%l7 + %i2]
	bl,pt	%xcc,	loop_93
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%o6
	nop
	set	0x3E, %l5
	sth	%l0,	[%l7 + %l5]
	and	%i2,	%g5,	%i1
loop_93:
	nop
	set	0x38, %g2
	ldsb	[%l7 + %g2],	%l4
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xca
	nop
	set	0x6E, %l1
	ldstub	[%l7 + %l1],	%l1
	st	%f11,	[%l7 + 0x18]
	nop
	set	0x7C, %g6
	prefetch	[%l7 + %g6],	 0
	set	0x34, %g1
	swapa	[%l7 + %g1] 0x88,	%i7
	nop
	set	0x19, %i5
	ldub	[%l7 + %i5],	%o4
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%o3
	set	0x60, %l4
	ldda	[%l7 + %l4] 0x88,	%i4
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%o6
	set	0x58, %i0
	lda	[%l7 + %i0] 0x89,	%f21
	nop
	set	0x08, %i3
	std	%f2,	[%l7 + %i3]
	wr	%o0,	%o1,	%set_softint
	nop
	set	0x18, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x50, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x58, %l3
	stx	%l3,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x1C]
	set	0x78, %g4
	stxa	%i6,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x0C, %i1
	ldsb	[%l7 + %i1],	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%g4
	nop
	set	0x38, %i6
	stx	%o2,	[%l7 + %i6]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd8,	%f16
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f6
	set	0x58, %l2
	ldxa	[%l7 + %l2] 0x80,	%g6
	nop
	set	0x18, %o2
	lduh	[%l7 + %o2],	%l6
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%f31,	[%l7 + 0x30]
	nop
	set	0x18, %g5
	stx	%g2,	[%l7 + %g5]
	ld	[%l7 + 0x08],	%f13
	nop
	set	0x1E, %l6
	ldsb	[%l7 + %l6],	%i4
	set	0x10, %g3
	sta	%f1,	[%l7 + %g3] 0x80
	nop
	set	0x38, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%g1
	set	0x20, %i2
	stxa	%l5,	[%l7 + %i2] 0x80
	nop
	set	0x1E, %g2
	ldsh	[%l7 + %g2],	%g3
	nop
	set	0x76, %l5
	sth	%l2,	[%l7 + %l5]
	set	0x68, %o7
	lda	[%l7 + %o7] 0x88,	%f9
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x38, %l1
	std	%f2,	[%l7 + %l1]
	set	0x40, %g1
	stxa	%g7,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f10
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f8
	wr 	%g0, 	0x7, 	%fprs
	set	0x28, %l4
	stda	%i2,	[%l7 + %l4] 0x80
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	ld	[%l7 + 0x64],	%f6
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	nop
	set	0x10, %o5
	std	%g4,	[%l7 + %o5]
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%o6
	and	%i1,	%l1,	%i7
	nop
	set	0x10, %i3
	stx	%l4,	[%l7 + %i3]
	nop
	set	0x46, %o4
	ldsb	[%l7 + %o4],	%o3
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	ld	[%l7 + 0x58],	%f24
	nop
	set	0x16, %g4
	ldsh	[%l7 + %g4],	%i5
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%o7
	set	0x30, %i6
	swapa	[%l7 + %i6] 0x89,	%o1
	set	0x18, %i7
	lda	[%l7 + %i7] 0x88,	%f17
	nop
	set	0x30, %l2
	stw	%l3,	[%l7 + %l2]
	nop
	set	0x38, %o2
	std	%f2,	[%l7 + %o2]
	nop
	set	0x60, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x64, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x40, %g5
	swap	[%l7 + %g5],	%i6
	nop
	set	0x46, %i4
	ldub	[%l7 + %i4],	%o0
	nop
	set	0x1C, %g3
	ldsw	[%l7 + %g3],	%o5
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%g4
	and	%i0,	%g6,	%l6
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%o2
	nop
	set	0x08, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x12, %l5
	lduh	[%l7 + %l5],	%g2
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%i4
	fpsub16	%f26,	%f24,	%f20
	nop
	set	0x66, %g2
	stb	%l5,	[%l7 + %g2]
	set	0x28, %l1
	lda	[%l7 + %l1] 0x80,	%f20
	nop
	set	0x28, %i5
	ldstub	[%l7 + %i5],	%g3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x841, 	%sys_tick_cmpr
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f0
	ld	[%l7 + 0x40],	%f27
	set	0x28, %g6
	lda	[%l7 + %g6] 0x80,	%f24
	set	0x38, %l4
	swapa	[%l7 + %l4] 0x81,	%g1
	nop
	set	0x28, %i0
	std	%i2,	[%l7 + %i0]
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f4
	wr	%l0,	%g5,	%y
	nop
	set	0x34, %o6
	sth	%i2,	[%l7 + %o6]
	nop
	set	0x40, %g7
	sth	%o6,	[%l7 + %g7]
	set	0x7C, %o4
	stwa	%i1,	[%l7 + %o4] 0x88
	set	0x38, %i3
	stxa	%i7,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x81,	%l1
	set	0x18, %i1
	lda	[%l7 + %i1] 0x80,	%f20
	st	%f4,	[%l7 + 0x70]
	set	0x64, %i6
	lda	[%l7 + %i6] 0x80,	%f26
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd0
	nop
	set	0x28, %g4
	lduh	[%l7 + %g4],	%o3
	nop
	set	0x68, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x51, %l0
	ldsb	[%l7 + %l0],	%l4
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x89,	 1
	nop
	set	0x7A, %o0
	sth	%o4,	[%l7 + %o0]
	set	0x40, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0
	nop
	set	0x18, %i4
	ldsw	[%l7 + %i4],	%l3
	or	%o1,	%o0,	%o5
	and	%i6,	%i0,	%g6
	nop
	set	0x52, %l6
	ldsh	[%l7 + %l6],	%l6
	set	0x58, %g3
	stda	%o2,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x6C, %o1
	swapa	[%l7 + %o1] 0x89,	%g2
	set	0x74, %i2
	stba	%g4,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xda
	nop
	set	0x50, %o7
	swap	[%l7 + %o7],	%l5
	nop
	set	0x58, %g2
	sth	%g3,	[%l7 + %g2]
	nop
	set	0x68, %l5
	stw	%l2,	[%l7 + %l5]
	bne,a,pn	%icc,	loop_94
	nop
	nop
	setx	0xA8CEFC0A7AC44CD1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA2801FD9560E1505,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f10
	nop
	set	0x50, %l1
	swap	[%l7 + %l1],	%g7
	nop
	set	0x36, %g1
	sth	%i4,	[%l7 + %g1]
loop_94:
	nop
	set	0x5C, %g6
	stwa	%i3,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd8
	nop
	set	0x08, %i5
	stw	%g1,	[%l7 + %i5]
	nop
	set	0x2A, %o5
	lduh	[%l7 + %o5],	%g5
	nop
	set	0x48, %o6
	std	%l0,	[%l7 + %o6]
	fpadd16s	%f2,	%f22,	%f11
	or	%i2,	%o6,	%i1
	fpadd32	%f20,	%f12,	%f4
	set	0x7C, %i0
	stha	%i7,	[%l7 + %i0] 0x80
	nop
	set	0x2E, %g7
	lduh	[%l7 + %g7],	%l1
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f10
	set	0x2F, %i3
	stba	%o3,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xF0C6C478,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xCF68B42D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f29,	%f17
	fpsub16	%f2,	%f16,	%f0
	be	%icc,	loop_95
	st	%f29,	[%l7 + 0x14]
	nop
	set	0x78, %l3
	sth	%l4,	[%l7 + %l3]
	set	0x1C, %i1
	lda	[%l7 + %i1] 0x81,	%f21
loop_95:
	ld	[%l7 + 0x10],	%f25
	nop
	set	0x6B, %i7
	ldstub	[%l7 + %i7],	%o4
	nop
	set	0x50, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x60, %o2
	stx	%i5,	[%l7 + %o2]
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%l2
	fpsub16s	%f2,	%f2,	%f24
	fpsub16s	%f10,	%f8,	%f13
	set	0x7C, %l2
	swapa	[%l7 + %l2] 0x81,	%o1
	nop
	set	0x7C, %o0
	sth	%o0,	[%l7 + %o0]
	nop
	set	0x67, %g5
	ldub	[%l7 + %g5],	%o7
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%g6
	nop
	set	0x24, %l6
	ldsh	[%l7 + %l6],	%l6
	nop
	set	0x08, %i4
	std	%i0,	[%l7 + %i4]
	nop
	set	0x58, %o1
	ldx	[%l7 + %o1],	%g2
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	wr	%g4,	%o2,	%clear_softint
	set	0x46, %i2
	stba	%g3,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%f24,	[%l7 + 0x3C]
	set	0x58, %o3
	stwa	%l2,	[%l7 + %o3] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x34, %g2
	stb	%l5,	[%l7 + %g2]
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%g6
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x89,	%i3
	st	%f17,	[%l7 + 0x60]
	nop
	set	0x08, %l1
	lduw	[%l7 + %l1],	%g1
	nop
	set	0x48, %g6
	swap	[%l7 + %g6],	%g5
	nop
	set	0x24, %g1
	ldub	[%l7 + %g1],	%l0
	set	0x60, %i5
	stba	%i2,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%i4,	%i1,	%i7
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x88,	%o6
	nop
	set	0x2C, %l4
	lduh	[%l7 + %l4],	%o3
	nop
	set	0x54, %i0
	ldub	[%l7 + %i0],	%l1
	nop
	set	0x30, %g7
	stx	%l4,	[%l7 + %g7]
	set	0x3C, %o6
	stwa	%o4,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%i5
	set	0x0C, %l3
	stwa	%l3,	[%l7 + %l3] 0x80
	nop
	set	0x08, %i1
	std	%f18,	[%l7 + %i1]
	nop
	set	0x44, %i3
	lduw	[%l7 + %i3],	%o1
	nop
	set	0x71, %i7
	ldsb	[%l7 + %i7],	%o7
	set	0x3B, %g4
	stba	%o5,	[%l7 + %g4] 0x80
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	nop
	set	0x60, %l2
	ldx	[%l7 + %l2],	%i6
	nop
	set	0x36, %i6
	stb	%g6,	[%l7 + %i6]
	set	0x34, %g5
	lda	[%l7 + %g5] 0x89,	%f8
	and	%l6,	%o0,	%i0
	nop
	set	0x44, %o0
	ldsh	[%l7 + %o0],	%g2
	add	%o2,	%g3,	%g4
	set	0x60, %l6
	stba	%l5,	[%l7 + %l6] 0x81
	set	0x4F, %l0
	ldstuba	[%l7 + %l0] 0x89,	%l2
	set	0x24, %i4
	lda	[%l7 + %i4] 0x81,	%f7
	nop
	set	0x50, %o1
	ldstub	[%l7 + %o1],	%g7
	nop
	set	0x40, %g3
	stx	%g1,	[%l7 + %g3]
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f20
	nop
	set	0x66, %o3
	lduh	[%l7 + %o3],	%i3
	set	0x0C, %o7
	stwa	%l0,	[%l7 + %o7] 0xeb
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%i4
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xda
	or	%i1,	%g5,	%i7
	nop
	set	0x0B, %g2
	ldsb	[%l7 + %g2],	%o6
	nop
	set	0x60, %g6
	lduw	[%l7 + %g6],	%l1
	set	0x60, %g1
	lda	[%l7 + %g1] 0x89,	%f19
	nop
	set	0x40, %l1
	std	%l4,	[%l7 + %l1]
	set	0x20, %i5
	swapa	[%l7 + %i5] 0x80,	%o4
	set	0x30, %o5
	swapa	[%l7 + %o5] 0x89,	%i5
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f16
	wr	%o3,	%o1,	%pic
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x88,	%o7
	set	0x28, %g7
	stwa	%o5,	[%l7 + %g7] 0x88
	nop
	set	0x6E, %o4
	stb	%i6,	[%l7 + %o4]
	nop
	set	0x34, %l3
	sth	%l3,	[%l7 + %l3]
	nop
	set	0x40, %o6
	std	%f10,	[%l7 + %o6]
	nop
	set	0x18, %i3
	std	%g6,	[%l7 + %i3]
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%l6
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%i0
	fpadd16s	%f31,	%f21,	%f26
	bge,pn	%icc,	loop_96
	nop
	set	0x76, %o2
	ldub	[%l7 + %o2],	%g2
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x89,	%o2
loop_96:
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%g3
	nop
	set	0x3C, %g5
	stw	%o0,	[%l7 + %g5]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f0
	nop
	set	0x18, %l6
	stx	%l5,	[%l7 + %l6]
	nop
	set	0x38, %o0
	std	%f0,	[%l7 + %o0]
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%g4
	nop
	set	0x70, %l0
	std	%f8,	[%l7 + %l0]
	ld	[%l7 + 0x14],	%f29
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x88,	%g7
	set	0x24, %o1
	stha	%l2,	[%l7 + %o1] 0x81
	nop
	set	0x6A, %o3
	ldsb	[%l7 + %o3],	%g1
	set	0x50, %i2
	stxa	%i3,	[%l7 + %i2] 0x89
	nop
	set	0x15, %l5
	ldstub	[%l7 + %l5],	%i2
	set	0x28, %g2
	lda	[%l7 + %g2] 0x89,	%f14
	nop
	set	0x70, %o7
	ldstub	[%l7 + %o7],	%i4
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%i1
	nop
	set	0x38, %g6
	std	%g4,	[%l7 + %g6]
	and	%l0,	%o6,	%l1
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x80,	%l4
	nop
	set	0x14, %i5
	ldsw	[%l7 + %i5],	%i7
	fpadd16s	%f23,	%f10,	%f26
	add	%i5,	%o4,	%o3
	set	0x59, %i0
	stba	%o1,	[%l7 + %i0] 0xeb
	membar	#Sync
	fpadd16	%f28,	%f26,	%f8
	nop
	set	0x3C, %o5
	ldub	[%l7 + %o5],	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%o7
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x08, %g7
	lduw	[%l7 + %g7],	%g6
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	fpadd16	%f8,	%f20,	%f30
	set	0x78, %o6
	lda	[%l7 + %o6] 0x80,	%f17
	nop
	set	0x59, %o4
	ldsb	[%l7 + %o4],	%i0
	or	%l3,	%g2,	%g3
	nop
	set	0x18, %i3
	ldsw	[%l7 + %i3],	%o0
	nop
	set	0x54, %i7
	swap	[%l7 + %i7],	%o2
	nop
	set	0x6A, %o2
	ldstub	[%l7 + %o2],	%g4
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%g7
	nop
	set	0x58, %i1
	ldsw	[%l7 + %i1],	%l2
	fpsub16	%f26,	%f16,	%f6
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%l4
	nop
	set	0x5C, %i6
	sth	%g1,	[%l7 + %i6]
	nop
	set	0x44, %l6
	stb	%i3,	[%l7 + %l6]
	nop
	set	0x20, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x7C, %g5
	ldsw	[%l7 + %g5],	%i4
	bl,a	%icc,	loop_97
	bne	%icc,	loop_98
	wr	%i1,	%g5,	%sys_tick
	set	0x58, %l0
	stha	%i2,	[%l7 + %l0] 0x81
loop_97:
	add	%l0,	%o6,	%l4
loop_98:
	nop
	set	0x38, %g3
	lduw	[%l7 + %g3],	%i7
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x81,	%l1
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%o4
	set	0x31, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f16
	nop
	set	0x3C, %g2
	swap	[%l7 + %g2],	%o1
	nop
	set	0x78, %l5
	stx	%i5,	[%l7 + %l5]
	nop
	set	0x44, %o7
	sth	%o5,	[%l7 + %o7]
	ba	%xcc,	loop_99
	nop
	set	0x68, %g6
	std	%f14,	[%l7 + %g6]
	bleu,a	%xcc,	loop_100
	nop
	set	0x41, %l1
	ldsb	[%l7 + %l1],	%i6
loop_99:
	nop
	set	0x3C, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x3C, %i0
	swap	[%l7 + %i0],	%g6
loop_100:
	add	%o7,	%i0,	%l3
	set	0x20, %i5
	stda	%g2,	[%l7 + %i5] 0x89
	set	0x5C, %l4
	ldstuba	[%l7 + %l4] 0x89,	%l6
	st	%f19,	[%l7 + 0x0C]
	nop
	set	0x54, %g7
	swap	[%l7 + %g7],	%o0
	bgu,a	%icc,	loop_101
	st	%fsr,	[%l7 + 0x20]
	set	0x36, %l3
	stha	%o2,	[%l7 + %l3] 0x88
loop_101:
	nop
	set	0x50, %o5
	lduw	[%l7 + %o5],	%g4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xda,	%f16
	set	0x7E, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g3
	set	0x4C, %o6
	stwa	%g7,	[%l7 + %o6] 0xea
	membar	#Sync
	and	%l5,	%g1,	%i3
	nop
	set	0x60, %i7
	stx	%i4,	[%l7 + %i7]
	ld	[%l7 + 0x0C],	%f12
	st	%f31,	[%l7 + 0x44]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%g5
	nop
	set	0x34, %g4
	prefetch	[%l7 + %g4],	 4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%l0
	st	%f28,	[%l7 + 0x24]
	set	0x78, %i1
	sta	%f25,	[%l7 + %i1] 0x80
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f28
	nop
	set	0x58, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x6A, %l6
	ldstub	[%l7 + %l6],	%i2
	add	%l4,	%o6,	%i7
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%o4
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%o2
	set	0x0C, %g5
	lda	[%l7 + %g5] 0x89,	%f19
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xeb,	%o0
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x30]
	nop
	nop
	setx	0x52680C113932CE01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x188BB83005F3F635,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f8
	nop
	set	0x48, %l0
	swap	[%l7 + %l0],	%l1
	set	0x7C, %o1
	stba	%i5,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x20, %i2
	std	%o4,	[%l7 + %i2]
	st	%f14,	[%l7 + 0x70]
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f0
	nop
	set	0x38, %o3
	sth	%i6,	[%l7 + %o3]
	ld	[%l7 + 0x58],	%f30
	nop
	set	0x48, %o7
	stw	%g6,	[%l7 + %o7]
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%o7
	nop
	set	0x5C, %l5
	lduh	[%l7 + %l5],	%l6
	set	0x24, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g2
	fpadd32s	%f8,	%f6,	%f14
	st	%fsr,	[%l7 + 0x28]
	set	0x3C, %g1
	stha	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x18, %i0
	stx	%g4,	[%l7 + %i0]
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%g3
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%g6
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x40, %g7
	swapa	[%l7 + %g7] 0x80,	%l5
	nop
	set	0x33, %o4
	ldsb	[%l7 + %o4],	%i3
	nop
	set	0x50, %i3
	std	%g0,	[%l7 + %i3]
	nop
	set	0x3E, %o6
	ldsh	[%l7 + %o6],	%i4
	nop
	set	0x25, %o5
	ldsb	[%l7 + %o5],	%g5
	nop
	set	0x28, %i7
	std	%i0,	[%l7 + %i7]
	nop
	set	0x62, %g4
	sth	%l2,	[%l7 + %g4]
	nop
	set	0x64, %l2
	stb	%l0,	[%l7 + %l2]
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x89,	%l4
	set	0x40, %l6
	stxa	%o6,	[%l7 + %l6] 0x80
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x34, %o0
	swap	[%l7 + %o0],	%o4
	nop
	set	0x2C, %g5
	ldub	[%l7 + %g5],	%i7
	nop
	set	0x18, %i1
	std	%f16,	[%l7 + %i1]
	set	0x0C, %g3
	sta	%f6,	[%l7 + %g3] 0x88
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x4C, %o1
	stwa	%o1,	[%l7 + %o1] 0x80
	set	0x24, %i4
	stwa	%l1,	[%l7 + %i4] 0x81
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%o3
	nop
	set	0x48, %i2
	stx	%o5,	[%l7 + %i2]
	nop
	set	0x60, %o3
	std	%f6,	[%l7 + %o3]
	nop
	set	0x08, %g2
	swap	[%l7 + %g2],	%i6
	nop
	set	0x68, %g6
	stx	%g6,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x78, %o7
	std	%f6,	[%l7 + %o7]
	ld	[%l7 + 0x28],	%f4
	nop
	set	0x09, %l5
	stb	%l3,	[%l7 + %l5]
	fpadd16	%f14,	%f28,	%f16
	st	%fsr,	[%l7 + 0x78]
	fpadd16s	%f15,	%f10,	%f15
	nop
	set	0x34, %g1
	ldub	[%l7 + %g1],	%o7
	set	0x6F, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i0
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x1B, %i0
	ldstub	[%l7 + %i0],	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%g2
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x80,	%g4
	add	%g3,	%o0,	%l5
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x89,	 0
	set	0x74, %g7
	stwa	%g7,	[%l7 + %g7] 0x89
	st	%f13,	[%l7 + 0x68]
	st	%f29,	[%l7 + 0x60]
	set	0x30, %i3
	stxa	%i4,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xe3,	%g4
	bg,a,pn	%xcc,	loop_102
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f30
	or	%g1,	%i1,	%l2
	set	0x18, %o5
	stxa	%l0,	[%l7 + %o5] 0xeb
	membar	#Sync
loop_102:
	nop
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x81,	%l4
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x78, %g4
	std	%f4,	[%l7 + %g4]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf9
	membar	#Sync
	nop
	set	0x4A, %i6
	stb	%o6,	[%l7 + %i6]
	nop
	set	0x38, %o2
	stx	%i2,	[%l7 + %o2]
	set	0x58, %g5
	stwa	%o4,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x70, %i1
	stx	%o1,	[%l7 + %i1]
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	or	%i5,	%i7,	%o5
	set	0x20, %g3
	stwa	%o3,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x30, %o1
	swap	[%l7 + %o1],	%g6
	nop
	set	0x6C, %i4
	stw	%l3,	[%l7 + %i4]
	set	0x0C, %l0
	stba	%i6,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x10, %i2
	stxa	%i0,	[%l7 + %i2] 0x88
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	fpsub16	%f2,	%f24,	%f24
	nop
	set	0x4C, %g6
	ldsw	[%l7 + %g6],	%o7
	nop
	set	0x38, %g2
	lduh	[%l7 + %g2],	%o2
	set	0x5B, %o7
	stba	%g4,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x0D, %g1
	stb	%g3,	[%l7 + %g1]
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%i3
	add	%l5,	%i4,	%g5
	and	%g7,	%g1,	%l2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%l0
	nop
	set	0x60, %l5
	prefetch	[%l7 + %l5],	 3
	set	0x72, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l4
	nop
	set	0x66, %l4
	ldstub	[%l7 + %l4],	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%o1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x80
	set	0x08, %i0
	stwa	%l1,	[%l7 + %i0] 0x89
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f14
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x64, %o4
	stw	%i5,	[%l7 + %o4]
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f0
	nop
	set	0x7C, %i3
	lduw	[%l7 + %i3],	%i7
	nop
	set	0x10, %l2
	stx	%i2,	[%l7 + %l2]
	set	0x74, %i7
	stha	%o5,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x74, %l6
	ldsh	[%l7 + %l6],	%g6
	or	%l3,	%i6,	%i0
	and	%o3,	%o7,	%o2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%l6
	nop
	set	0x78, %i6
	stw	%o0,	[%l7 + %i6]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%g2
	set	0x58, %o2
	stda	%g2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x33, %g5
	stba	%i3,	[%l7 + %g5] 0x80
	set	0x10, %o0
	stwa	%i4,	[%l7 + %o0] 0x81
	nop
	set	0x28, %i1
	ldsh	[%l7 + %i1],	%g5
	nop
	set	0x78, %g3
	ldsw	[%l7 + %g3],	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l2
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x70, %l0
	ldsh	[%l7 + %l0],	%i1
	nop
	set	0x30, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x19, %i2
	ldub	[%l7 + %i2],	%l0
	ld	[%l7 + 0x68],	%f11
	set	0x72, %o3
	stba	%g1,	[%l7 + %o3] 0x89
	set	0x50, %g2
	stha	%o6,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x4A, %g1
	ldstub	[%l7 + %g1],	%o4
	nop
	set	0x34, %l1
	ldsw	[%l7 + %l1],	%o1
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%i4
	ld	[%l7 + 0x5C],	%f4
	nop
	set	0x5C, %g6
	lduh	[%l7 + %g6],	%i7
	nop
	set	0x20, %l3
	std	%f8,	[%l7 + %l3]
	set	0x40, %l5
	stda	%i2,	[%l7 + %l5] 0x81
	st	%f0,	[%l7 + 0x64]
	set	0x7C, %l4
	ldstuba	[%l7 + %l4] 0x89,	%l1
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	bleu,pn	%icc,	loop_103
	nop
	set	0x40, %g7
	swap	[%l7 + %g7],	%l3
	ld	[%l7 + 0x50],	%f21
	set	0x30, %o4
	lda	[%l7 + %o4] 0x80,	%f31
loop_103:
	nop
	set	0x2A, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o5
	set	0x10, %o6
	stba	%i0,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x78, %i3
	sta	%f10,	[%l7 + %i3] 0x80
	set	0x68, %l2
	stda	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	add	%o3,	%o2,	%o7
	set	0x42, %i7
	stba	%g4,	[%l7 + %i7] 0x80
	fpadd32s	%f8,	%f3,	%f3
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x80,	%i6
	set	0x42, %l6
	stha	%g2,	[%l7 + %l6] 0xeb
	membar	#Sync
	or	%i3,	%g3,	%g5
	nop
	set	0x34, %g5
	swap	[%l7 + %g5],	%i4
	nop
	set	0x42, %o0
	lduh	[%l7 + %o0],	%g7
	nop
	set	0x3C, %o2
	swap	[%l7 + %o2],	%l2
	nop
	nop
	setx	0xF6F44402A37724E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x1DE8B75B66B85603,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f18,	%f2
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0
	nop
	set	0x38, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x79, %l0
	ldsb	[%l7 + %l0],	%i1
	nop
	set	0x58, %i4
	prefetch	[%l7 + %i4],	 0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f0
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x7B, %o3
	stb	%g1,	[%l7 + %o3]
	nop
	set	0x7C, %g2
	lduh	[%l7 + %g2],	%o6
	and	%l0,	%o4,	%o1
	set	0x3C, %o1
	stwa	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x0C, %o7
	stb	%i5,	[%l7 + %o7]
	nop
	set	0x22, %l1
	ldsh	[%l7 + %l1],	%i7
	nop
	set	0x08, %i5
	ldsb	[%l7 + %i5],	%i2
	nop
	set	0x20, %g6
	stx	%l1,	[%l7 + %g6]
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%l3
	set	0x7B, %l5
	stba	%g6,	[%l7 + %l5] 0x88
	bge,a,pn	%xcc,	loop_104
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
loop_104:
	nop
	set	0x50, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x46, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o5
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x88,	%i6
	st	%fsr,	[%l7 + 0x24]
	set	0x60, %o6
	lda	[%l7 + %o6] 0x88,	%f9
	set	0x54, %i3
	lda	[%l7 + %i3] 0x81,	%f31
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x88,	%o3
	or	%i0,	%o2,	%g4
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd8
	nop
	set	0x74, %o4
	stw	%o0,	[%l7 + %o4]
	nop
	set	0x78, %i6
	swap	[%l7 + %i6],	%o7
	set	0x64, %l6
	lda	[%l7 + %l6] 0x80,	%f27
	set	0x30, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g2
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x81,	%i3
	st	%f15,	[%l7 + 0x18]
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	bleu,a	%xcc,	loop_105
	nop
	set	0x68, %o2
	ldsw	[%l7 + %o2],	%l6
	nop
	set	0x58, %i1
	sth	%g5,	[%l7 + %i1]
	nop
	set	0x68, %l0
	prefetch	[%l7 + %l0],	 1
loop_105:
	nop
	set	0x70, %i4
	ldda	[%l7 + %i4] 0xeb,	%g2
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%g6
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x81,	%l2
	wr	%l5,	%i1,	%sys_tick
	set	0x70, %i2
	stda	%i4,	[%l7 + %i2] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%l0
	set	0x38, %g2
	stxa	%o6,	[%l7 + %g2] 0x80
	set	0x4F, %o7
	stba	%o4,	[%l7 + %o7] 0x88
	or	%o1,	%l4,	%i7
	nop
	set	0x4E, %o1
	lduh	[%l7 + %o1],	%i2
	fpadd32s	%f17,	%f14,	%f1
	nop
	set	0x1F, %l1
	ldub	[%l7 + %l1],	%i5
	nop
	set	0x70, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x08, %g6
	lda	[%l7 + %g6] 0x88,	%f26
	nop
	set	0x44, %l5
	stw	%l1,	[%l7 + %l5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%o5
	set	0x30, %l3
	stda	%l2,	[%l7 + %l3] 0x88
	nop
	set	0x5C, %i0
	stw	%i6,	[%l7 + %i0]
	nop
	set	0x16, %l4
	stb	%i0,	[%l7 + %l4]
	set	0x77, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o0
	nop
	set	0x77, %o5
	ldstub	[%l7 + %o5],	%g4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%g2
	set	0x52, %o6
	stha	%l6,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f0
	bg,a	%xcc,	loop_106
	or	%i3,	%g5,	%g7
	nop
	set	0x2A, %l2
	sth	%l2,	[%l7 + %l2]
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x81,	%g3
loop_106:
	nop
	set	0x30, %o4
	std	%l4,	[%l7 + %o4]
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%i0
	and	%i4,	%g1,	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%l0
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	nop
	set	0x6C, %i6
	ldsb	[%l7 + %i6],	%i7
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x5D, %o0
	stb	%i2,	[%l7 + %o0]
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%i5
	or	%l4,	%l1,	%o5
	add	%l3,	%g6,	%i0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	nop
	set	0x18, %g5
	std	%o2,	[%l7 + %g5]
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%i6
	nop
	set	0x70, %i4
	std	%o0,	[%l7 + %i4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o7
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x14, %o3
	ldsh	[%l7 + %o3],	%g4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i3
	st	%f18,	[%l7 + 0x10]
	nop
	set	0x74, %g3
	prefetch	[%l7 + %g3],	 0
	ld	[%l7 + 0x70],	%f3
	set	0x60, %g2
	swapa	[%l7 + %g2] 0x81,	%g5
	nop
	set	0x1F, %i2
	ldub	[%l7 + %i2],	%g2
	nop
	set	0x60, %o7
	std	%f20,	[%l7 + %o7]
	and	%g7,	%g3,	%l2
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	set	0x29, %o1
	stba	%i1,	[%l7 + %o1] 0x81
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x18, %l5
	stha	%g1,	[%l7 + %l5] 0x80
	add	%i4,	%o6,	%l0
	ba	%icc,	loop_107
	nop
	set	0x70, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x78, %i0
	lduh	[%l7 + %i0],	%o1
	nop
	set	0x75, %l4
	ldub	[%l7 + %l4],	%i7
loop_107:
	wr	%i2,	%o4,	%y
	nop
	set	0x30, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	wr	%l4,	%i5,	%softint
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f0
	set	0x41, %o5
	stba	%l1,	[%l7 + %o5] 0x81
	nop
	set	0x6F, %i3
	ldstub	[%l7 + %i3],	%l3
	set	0x14, %i7
	stha	%o5,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd2
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x81,	 3
	nop
	set	0x65, %l2
	ldsb	[%l7 + %l2],	%o3
	nop
	set	0x6E, %l6
	lduh	[%l7 + %l6],	%i0
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f0
	and	%i6,	%o0,	%o2
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x81,	%g4
	ld	[%l7 + 0x44],	%f13
	st	%f19,	[%l7 + 0x24]
	or	%l6,	%o7,	%i3
	nop
	set	0x18, %i6
	sth	%g2,	[%l7 + %i6]
	or	%g5,	%g3,	%l2
	nop
	set	0x1D, %g5
	stb	%g7,	[%l7 + %g5]
	nop
	set	0x74, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x31, %i4
	ldsb	[%l7 + %i4],	%i1
	nop
	set	0x6C, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x4A, %o2
	ldstub	[%l7 + %o2],	%g1
	set	0x20, %g3
	sta	%f13,	[%l7 + %g3] 0x88
	st	%fsr,	[%l7 + 0x28]
	add	%l5,	%o6,	%l0
	set	0x5C, %g2
	sta	%f14,	[%l7 + %g2] 0x81
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x81,	 2
	nop
	set	0x50, %o7
	std	%i4,	[%l7 + %o7]
	st	%f3,	[%l7 + 0x44]
	nop
	set	0x3A, %i2
	ldsb	[%l7 + %i2],	%i7
	wr	%i2,	%l4,	%sys_tick
	nop
	set	0x39, %o1
	ldub	[%l7 + %o1],	%i5
	set	0x4D, %i5
	stba	%o4,	[%l7 + %i5] 0x81
	set	0x08, %l5
	lda	[%l7 + %l5] 0x81,	%f27
	nop
	set	0x44, %g6
	ldub	[%l7 + %g6],	%l3
	nop
	set	0x54, %i0
	ldub	[%l7 + %i0],	%l1
	set	0x40, %l4
	stxa	%o5,	[%l7 + %l4] 0x80
	nop
	set	0x10, %l1
	ldsh	[%l7 + %l1],	%o3
	set	0x40, %g7
	stwa	%i0,	[%l7 + %g7] 0x81
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%i6
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x81,	%o0
	nop
	set	0x34, %o6
	stw	%o2,	[%l7 + %o6]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f22
	set	0x78, %o4
	stda	%g6,	[%l7 + %o4] 0x89
	nop
	set	0x50, %i3
	stx	%g4,	[%l7 + %i3]
	nop
	set	0x48, %l2
	stw	%o7,	[%l7 + %l2]
	nop
	set	0x18, %g1
	stx	%l6,	[%l7 + %g1]
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x81,	%g2
	nop
	set	0x60, %g4
	std	%i2,	[%l7 + %g4]
	nop
	set	0x3C, %i6
	lduw	[%l7 + %i6],	%g3
	set	0x28, %o0
	swapa	[%l7 + %o0] 0x89,	%g5
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf8
	membar	#Sync
	nop
	set	0x64, %i4
	sth	%g7,	[%l7 + %i4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x663, 	%tick_cmpr
	nop
	set	0x2C, %g5
	ldsw	[%l7 + %g5],	%o1
	nop
	set	0x18, %l0
	ldsw	[%l7 + %l0],	%i7
	set	0x38, %g3
	stda	%i4,	[%l7 + %g3] 0x80
	st	%f1,	[%l7 + 0x6C]
	st	%f11,	[%l7 + 0x44]
	set	0x40, %o2
	lda	[%l7 + %o2] 0x80,	%f27
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x80,	%i2
	fpadd32s	%f4,	%f7,	%f11
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%i5
	and	%l4,	%l3,	%o4
	set	0x68, %i2
	ldxa	[%l7 + %i2] 0x80,	%l1
	fpsub32s	%f1,	%f27,	%f13
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x89,	%o4
	bne,a	%icc,	loop_108
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%o0
loop_108:
	nop
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x81,	%o2
	bl	%icc,	loop_109
	or	%g6,	%i0,	%g4
	nop
	set	0x78, %i5
	prefetch	[%l7 + %i5],	 1
	and	%o7,	%l6,	%g2
loop_109:
	nop
	set	0x28, %g6
	stx	%g3,	[%l7 + %g6]
	set	0x71, %i0
	stba	%i3,	[%l7 + %i0] 0xeb
	membar	#Sync
	and	%g5,	%g7,	%l2
	nop
	set	0x08, %l4
	stx	%i1,	[%l7 + %l4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%g1
	nop
	set	0x72, %g7
	ldsb	[%l7 + %g7],	%o6
	set	0x0C, %l1
	lda	[%l7 + %l1] 0x81,	%f19
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x81,	 1
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xca
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x81,	%o0
	set	0x18, %l3
	stha	%i7,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x70, %i3
	stwa	%i4,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x18, %o4
	sta	%f18,	[%l7 + %o4] 0x81
	nop
	set	0x50, %g1
	stw	%i5,	[%l7 + %g1]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%i2
	set	0x50, %l6
	stda	%o4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x68, %g4
	lda	[%l7 + %g4] 0x88,	%f11
	set	0x48, %i6
	stxa	%l3,	[%l7 + %i6] 0x80
	add	%l1,	%o5,	%o3
	nop
	set	0x18, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x50, %i1
	std	%i6,	[%l7 + %i1]
	nop
	set	0x78, %o0
	stb	%o0,	[%l7 + %o0]
	nop
	set	0x0C, %g5
	ldsh	[%l7 + %g5],	%o2
	fpadd16	%f16,	%f14,	%f28
	st	%f11,	[%l7 + 0x10]
	add	%g6,	%i0,	%o7
	nop
	set	0x29, %l0
	ldub	[%l7 + %l0],	%g4
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f0
	ld	[%l7 + 0x18],	%f29
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%g2
	set	0x60, %g3
	stda	%i6,	[%l7 + %g3] 0x89
	set	0x1D, %g2
	stba	%i3,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xda
	wr	%g5,	%g7,	%softint
	nop
	set	0x12, %o7
	ldub	[%l7 + %o7],	%l2
	ld	[%l7 + 0x4C],	%f18
	nop
	set	0x70, %o1
	std	%f20,	[%l7 + %o1]
	set	0x2F, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g3
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%i1
	st	%fsr,	[%l7 + 0x70]
	set	0x60, %i5
	sta	%f16,	[%l7 + %i5] 0x88
	nop
	set	0x38, %i0
	prefetch	[%l7 + %i0],	 2
	fpsub16s	%f3,	%f5,	%f26
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
	nop
	set	0x10, %g7
	sth	%o6,	[%l7 + %g7]
	set	0x60, %l1
	prefetcha	[%l7 + %l1] 0x89,	 2
	nop
	set	0x68, %g6
	std	%o0,	[%l7 + %g6]
	nop
	set	0x18, %o5
	std	%f26,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x5C, %o6
	swap	[%l7 + %o6],	%i7
	add	%g1,	%i4,	%i5
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%f4
	set	0x5E, %l3
	stha	%l4,	[%l7 + %l3] 0xea
	membar	#Sync
	and	%o4,	%i2,	%l1
	nop
	set	0x08, %i3
	ldsw	[%l7 + %i3],	%l3
	nop
	set	0x48, %o4
	stx	%o3,	[%l7 + %o4]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%o0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xeb,	%i6
	nop
	set	0x30, %l6
	stx	%g6,	[%l7 + %l6]
	set	0x7F, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o2
	nop
	set	0x70, %l2
	ldsw	[%l7 + %l2],	%i0
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f24
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%o6
	nop
	set	0x5F, %g5
	ldub	[%l7 + %g5],	%g2
	ld	[%l7 + 0x60],	%f9
	fpadd32	%f28,	%f22,	%f4
	and	%l6,	%i3,	%g4
	nop
	set	0x28, %i1
	prefetch	[%l7 + %i1],	 4
	nop
	set	0x46, %l0
	sth	%g7,	[%l7 + %l0]
	set	0x60, %o2
	lda	[%l7 + %o2] 0x81,	%f30
	nop
	set	0x10, %i4
	swap	[%l7 + %i4],	%g5
	and	%l2,	%g3,	%i1
	nop
	set	0x78, %g2
	prefetch	[%l7 + %g2],	 0
	ba,pn	%icc,	loop_110
	st	%fsr,	[%l7 + 0x74]
	set	0x37, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o6
loop_110:
	nop
	set	0x60, %o3
	lda	[%l7 + %o3] 0x89,	%f5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd2,	%f0
	set	0x14, %o7
	lda	[%l7 + %o7] 0x81,	%f29
	set	0x0C, %i2
	ldstuba	[%l7 + %i2] 0x81,	%l0
	nop
	set	0x70, %i5
	stx	%o1,	[%l7 + %i5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%l5
	nop
	set	0x47, %i0
	ldstub	[%l7 + %i0],	%i4
	set	0x28, %l4
	lda	[%l7 + %l4] 0x89,	%f27
	nop
	set	0x68, %g7
	ldsb	[%l7 + %g7],	%i5
	set	0x50, %l1
	stha	%l4,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x17, %g6
	ldstub	[%l7 + %g6],	%o4
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i2
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
	set	0x19, %l3
	stba	%l1,	[%l7 + %l3] 0x88
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%o4
	nop
	set	0x38, %i3
	stb	%o0,	[%l7 + %i3]
	be,a,pn	%icc,	loop_111
	nop
	set	0x36, %o4
	stb	%o3,	[%l7 + %o4]
	set	0x48, %g1
	lda	[%l7 + %g1] 0x80,	%f22
loop_111:
	nop
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x81,	%g6
	and	%i6,	%i0,	%o2
	st	%fsr,	[%l7 + 0x38]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%l6
	nop
	set	0x60, %i6
	stx	%i3,	[%l7 + %i6]
	nop
	set	0x50, %g4
	stw	%g4,	[%l7 + %g4]
	nop
	set	0x52, %l2
	stb	%g2,	[%l7 + %l2]
	wr	%g7,	%l2,	%sys_tick
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x88,	%g5
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xda
	fpadd16s	%f24,	%f20,	%f14
	add	%g3,	%o6,	%i1
	and	%l0,	%i7,	%l5
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x10, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x7E, %i1
	sth	%i4,	[%l7 + %i1]
	nop
	set	0x50, %g2
	std	%f4,	[%l7 + %g2]
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x89,	%i5
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%o1
	nop
	set	0x3C, %o1
	ldsw	[%l7 + %o1],	%l4
	set	0x38, %g3
	lda	[%l7 + %g3] 0x80,	%f5
	bleu,pt	%icc,	loop_112
	st	%fsr,	[%l7 + 0x44]
	bleu,a,pt	%xcc,	loop_113
	st	%fsr,	[%l7 + 0x48]
loop_112:
	nop
	set	0x08, %o7
	stx	%o4,	[%l7 + %o7]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%g1
loop_113:
	nop
	set	0x42, %i2
	lduh	[%l7 + %i2],	%l3
	nop
	set	0x24, %i5
	ldstub	[%l7 + %i5],	%l1
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	or	%o3,	%g6,	%i6
	nop
	set	0x14, %g7
	stb	%i0,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x2E, %l1
	sth	%o2,	[%l7 + %l1]
	nop
	set	0x78, %g6
	stx	%fsr,	[%l7 + %g6]
	add	%o7,	%l6,	%o0
	nop
	set	0x28, %o5
	std	%f18,	[%l7 + %o5]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf8
	membar	#Sync
	nop
	set	0x4E, %l4
	ldsb	[%l7 + %l4],	%g4
	set	0x14, %l3
	swapa	[%l7 + %l3] 0x81,	%g2
	set	0x30, %i7
	stxa	%g7,	[%l7 + %i7] 0x80
	add	%i3,	%l2,	%g3
	set	0x3C, %i3
	sta	%f18,	[%l7 + %i3] 0x80
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i1
	nop
	set	0x5C, %o6
	sth	%o6,	[%l7 + %o6]
	set	0x0E, %g1
	ldstuba	[%l7 + %g1] 0x89,	%l0
	nop
	set	0x58, %l6
	stx	%i7,	[%l7 + %l6]
	nop
	set	0x10, %o4
	std	%f16,	[%l7 + %o4]
	nop
	set	0x3C, %i6
	ldsw	[%l7 + %i6],	%i4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f0
	and	%i5,	%o1,	%l4
	nop
	set	0x64, %g5
	stb	%l5,	[%l7 + %g5]
	set	0x78, %g4
	stxa	%i2,	[%l7 + %g4] 0x89
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x80,	%g0
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%o4
	ld	[%l7 + 0x34],	%f0
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%l2
	nop
	set	0x60, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x68, %i4
	swapa	[%l7 + %i4] 0x89,	%l1
	nop
	set	0x7C, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x25, %o3
	ldstub	[%l7 + %o3],	%o5
	set	0x08, %o1
	stwa	%o3,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x57, %o7
	ldsb	[%l7 + %o7],	%i6
	set	0x70, %i2
	ldda	[%l7 + %i2] 0x80,	%g6
	nop
	set	0x18, %g3
	stx	%o2,	[%l7 + %g3]
	set	0x34, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o7
	nop
	set	0x4C, %i0
	ldub	[%l7 + %i0],	%l6
	nop
	set	0x54, %l1
	lduh	[%l7 + %l1],	%i0
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
	set	0x38, %o5
	stha	%g4,	[%l7 + %o5] 0x80
	set	0x5A, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g2
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
	nop
	set	0x4C, %g7
	stb	%o0,	[%l7 + %g7]
	set	0x48, %l3
	sta	%f0,	[%l7 + %l3] 0x81
	nop
	set	0x40, %i3
	ldsb	[%l7 + %i3],	%g7
	bne,a	%xcc,	loop_114
	nop
	set	0x20, %i7
	std	%f28,	[%l7 + %i7]
	nop
	set	0x08, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x23, %l6
	stba	%l2,	[%l7 + %l6] 0x80
loop_114:
	nop
	set	0x3C, %g1
	lduh	[%l7 + %g1],	%i3
	and	%g5,	%i1,	%g3
	nop
	set	0x65, %i6
	stb	%l0,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x65, %o4
	ldstub	[%l7 + %o4],	%i7
	or	%i4,	%o6,	%o1
	set	0x78, %g5
	stha	%i5,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x3E, %g4
	ldub	[%l7 + %g4],	%l5
	set	0x2E, %o0
	stba	%l4,	[%l7 + %o0] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%g1
	nop
	set	0x70, %o2
	ldub	[%l7 + %o2],	%o4
	nop
	set	0x29, %l2
	ldstub	[%l7 + %l2],	%l3
	add	%o5,	%l1,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%o2
	nop
	set	0x78, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f12
	ld	[%l7 + 0x14],	%f31
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f20
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%o6
	set	0x2B, %o1
	stba	%g6,	[%l7 + %o1] 0xe2
	membar	#Sync
	bl,a	%icc,	loop_115
	nop
	set	0x76, %i2
	stb	%i0,	[%l7 + %i2]
	set	0x38, %o7
	stxa	%l6,	[%l7 + %o7] 0xea
	membar	#Sync
loop_115:
	nop
	set	0x18, %i5
	prefetcha	[%l7 + %i5] 0x81,	 3
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xea,	%g2
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%g7
	add	%o0,	%i3,	%l2
	set	0x44, %l1
	stba	%g5,	[%l7 + %l1] 0x88
	nop
	set	0x0B, %o5
	ldub	[%l7 + %o5],	%g3
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%l0
	add	%i7,	%i4,	%i1
	nop
	set	0x78, %l4
	stw	%o1,	[%l7 + %l4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i5
	nop
	set	0x1A, %g7
	ldstub	[%l7 + %g7],	%l4
	set	0x65, %g6
	stba	%i2,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x66, %i3
	stha	%l5,	[%l7 + %i3] 0x80
	or	%g1,	%o4,	%o5
	nop
	set	0x38, %l3
	ldx	[%l7 + %l3],	%l1
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f24
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0D6, 	%tick_cmpr
	nop
	set	0x5E, %l6
	ldstub	[%l7 + %l6],	%i6
	nop
	set	0x38, %i7
	ldstub	[%l7 + %i7],	%o7
	st	%f3,	[%l7 + 0x4C]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x22, %i6
	ldub	[%l7 + %i6],	%g6
	nop
	set	0x39, %g1
	ldstub	[%l7 + %g1],	%o2
	nop
	set	0x28, %g5
	std	%f22,	[%l7 + %g5]
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f18
	wr 	%g0, 	0x7, 	%fprs
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%g7
	set	0x53, %o0
	stba	%o0,	[%l7 + %o0] 0x88
	nop
	set	0x78, %o2
	std	%f28,	[%l7 + %o2]
	set	0x20, %l2
	stda	%i2,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xca
	set	0x78, %l0
	stda	%g2,	[%l7 + %l0] 0xe2
	membar	#Sync
	and	%g5,	%l2,	%g3
	set	0x0C, %g2
	swapa	[%l7 + %g2] 0x89,	%l0
	and	%i4,	%i1,	%i7
	set	0x24, %i1
	lda	[%l7 + %i1] 0x81,	%f13
	set	0x54, %o3
	stha	%o1,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x19, %i4
	ldstub	[%l7 + %i4],	%i5
	wr	%l4,	%i2,	%sys_tick
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 3
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd8
	bleu,a	%icc,	loop_116
	nop
	set	0x5C, %o7
	lduw	[%l7 + %o7],	%l5
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%o6
	nop
	set	0x34, %i0
	lduw	[%l7 + %i0],	%o4
loop_116:
	nop
	nop
	setx	0xA1FB08E8EF0DAD3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x50BA82F57C18D54A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f26
	nop
	set	0x14, %l1
	stb	%o5,	[%l7 + %l1]
	set	0x70, %o5
	stda	%l0,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%l3,	%o3,	%g1
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe3,	%i6
	set	0x78, %l5
	stda	%g6,	[%l7 + %l5] 0x81
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%o7
	fpsub16s	%f28,	%f20,	%f31
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f0
	nop
	set	0x70, %g7
	std	%i6,	[%l7 + %g7]
	nop
	set	0x48, %g6
	ldx	[%l7 + %g6],	%i0
	nop
	set	0x60, %l3
	std	%g6,	[%l7 + %l3]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f12
	nop
	set	0x48, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x2C, %i7
	swap	[%l7 + %i7],	%o0
	nop
	set	0x10, %l6
	std	%i2,	[%l7 + %l6]
	set	0x34, %g1
	stwa	%g4,	[%l7 + %g1] 0x89
	nop
	set	0x38, %i6
	stx	%g5,	[%l7 + %i6]
	nop
	nop
	setx	0x156DBCD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x21951EE0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f1,	%f19
	nop
	set	0x54, %g5
	lduw	[%l7 + %g5],	%g2
	nop
	set	0x58, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x30, %o0
	std	%l2,	[%l7 + %o0]
	nop
	set	0x26, %o2
	stb	%g3,	[%l7 + %o2]
	nop
	set	0x40, %l2
	ldx	[%l7 + %l2],	%i4
	set	0x7D, %g4
	stba	%i1,	[%l7 + %g4] 0x89
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xea,	%i6
	nop
	set	0x68, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x58, %o3
	stx	%o1,	[%l7 + %o3]
	set	0x18, %i4
	stda	%i4,	[%l7 + %i4] 0xeb
	membar	#Sync
	add	%l0,	%l4,	%i2
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%l4
	or	%o6,	%o4,	%o5
	set	0x44, %g2
	lda	[%l7 + %g2] 0x80,	%f22
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x09, %o7
	ldsb	[%l7 + %o7],	%l1
	set	0x1C, %i0
	swapa	[%l7 + %i0] 0x88,	%l3
	nop
	set	0x2C, %l1
	swap	[%l7 + %l1],	%o3
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 1
	set	0x58, %i5
	stda	%g0,	[%l7 + %i5] 0x88
	set	0x38, %g3
	stwa	%g6,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x4D, %l5
	stba	%o2,	[%l7 + %l5] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	wr	%i6,	%o7,	%y
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i0
	nop
	set	0x40, %l4
	ldsw	[%l7 + %l4],	%o0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%i3
	ld	[%l7 + 0x38],	%f13
	nop
	set	0x5C, %g7
	sth	%g4,	[%l7 + %g7]
	nop
	set	0x58, %g6
	lduh	[%l7 + %g6],	%g5
	set	0x57, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l2
	set	0x20, %i3
	sta	%f23,	[%l7 + %i3] 0x88
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x89
	nop
	set	0x54, %i7
	stb	%g3,	[%l7 + %i7]
	st	%f2,	[%l7 + 0x14]
	ld	[%l7 + 0x70],	%f17
	set	0x18, %g1
	swapa	[%l7 + %g1] 0x89,	%g2
	nop
	set	0x30, %i6
	lduh	[%l7 + %i6],	%i1
	set	0x58, %g5
	stxa	%i7,	[%l7 + %g5] 0xe2
	membar	#Sync
	wr	%i4,	%i5,	%pic
	nop
	set	0x58, %o4
	std	%f0,	[%l7 + %o4]
	set	0x20, %o0
	stxa	%l0,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x40, %l6
	std	%o0,	[%l7 + %l6]
	set	0x38, %o2
	stda	%l4,	[%l7 + %o2] 0x89
	nop
	set	0x42, %l2
	ldub	[%l7 + %l2],	%l5
	nop
	set	0x20, %g4
	ldsh	[%l7 + %g4],	%o6
	set	0x10, %l0
	stda	%o4,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0C0, 	%sys_tick_cmpr
	nop
	set	0x66, %i1
	ldsh	[%l7 + %i1],	%l3
	st	%f5,	[%l7 + 0x1C]
	nop
	set	0x09, %o3
	ldsb	[%l7 + %o3],	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i2
	set	0x08, %o1
	stda	%g6,	[%l7 + %o1] 0x80
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x89,	%i6
	st	%fsr,	[%l7 + 0x50]
	add	%o2,	%l6,	%i0
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe3,	%o0
	or	%o7,	%i3,	%g7
	and	%g5,	%g4,	%g3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd0,	%f0
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%l2
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x88,	%g2
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x89,	%f23
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f16
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%i7
	add	%i4,	%i1,	%i5
	nop
	set	0x70, %l4
	std	%l0,	[%l7 + %l4]
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f4
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x3C, %g7
	ldsw	[%l7 + %g7],	%l4
	nop
	set	0x1B, %i3
	ldub	[%l7 + %i3],	%l5
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x81,	 1
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x81,	%f9
	nop
	set	0x44, %g1
	stw	%o4,	[%l7 + %g1]
	nop
	set	0x20, %g5
	stx	%o1,	[%l7 + %g5]
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x10, %o0
	swap	[%l7 + %o0],	%o5
	nop
	set	0x1A, %i6
	ldsb	[%l7 + %i6],	%l3
	set	0x40, %l6
	prefetcha	[%l7 + %l6] 0x81,	 3
	set	0x68, %o2
	stwa	%g1,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x0F, %g4
	ldstuba	[%l7 + %g4] 0x80,	%o3
	set	0x75, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g6
	or	%i2,	%o2,	%l6
	nop
	set	0x14, %l0
	lduh	[%l7 + %l0],	%i6
	nop
	set	0x44, %o3
	ldsw	[%l7 + %o3],	%i0
	set	0x42, %i1
	stha	%o0,	[%l7 + %i1] 0x89
	fpadd32	%f22,	%f8,	%f30
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%g7
	set	0x22, %g2
	stba	%g5,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x30, %i2
	stda	%g4,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x70, %o1
	std	%g2,	[%l7 + %o1]
	nop
	set	0x24, %i0
	stw	%o7,	[%l7 + %i0]
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%f6
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%g2
	nop
	set	0x42, %o7
	ldsh	[%l7 + %o7],	%i7
	set	0x38, %i4
	stda	%i4,	[%l7 + %i4] 0x88
	fpadd32	%f18,	%f2,	%f20
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%i0
	nop
	set	0x4C, %g3
	lduw	[%l7 + %g3],	%i5
	ld	[%l7 + 0x08],	%f19
	nop
	set	0x60, %l4
	std	%f24,	[%l7 + %l4]
	nop
	set	0x18, %l5
	stw	%l2,	[%l7 + %l5]
	set	0x08, %g7
	stwa	%l0,	[%l7 + %g7] 0x89
	fpadd32s	%f2,	%f20,	%f14
	nop
	set	0x4E, %i3
	ldub	[%l7 + %i3],	%l4
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x80,	 3
	nop
	set	0x12, %o6
	ldstub	[%l7 + %o6],	%o6
	set	0x6C, %i7
	lda	[%l7 + %i7] 0x88,	%f8
	nop
	set	0x68, %l3
	sth	%o4,	[%l7 + %l3]
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x4C, %g5
	ldsw	[%l7 + %g5],	%o5
	or	%o1,	%l1,	%g1
	bge,pt	%icc,	loop_117
	fpsub16s	%f28,	%f13,	%f22
	or	%o3,	%g6,	%l3
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%i2
loop_117:
	st	%f13,	[%l7 + 0x64]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xea,	%o2
	st	%f21,	[%l7 + 0x0C]
	set	0x50, %l6
	stxa	%i6,	[%l7 + %l6] 0x81
	bleu,pt	%xcc,	loop_118
	nop
	set	0x18, %o2
	std	%f22,	[%l7 + %o2]
	set	0x50, %g4
	stwa	%i0,	[%l7 + %g4] 0x89
loop_118:
	nop
	set	0x1E, %i6
	ldsh	[%l7 + %i6],	%o0
	add	%l6,	%i3,	%g7
	nop
	set	0x30, %l0
	stx	%g5,	[%l7 + %l0]
	nop
	set	0x70, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x1E, %o3
	lduh	[%l7 + %o3],	%g4
	set	0x50, %i1
	stwa	%o7,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x4C, %g2
	lda	[%l7 + %g2] 0x80,	%f7
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%f12
	nop
	set	0x4D, %i0
	ldsb	[%l7 + %i0],	%g3
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc2
	nop
	set	0x1E, %o1
	sth	%g2,	[%l7 + %o1]
	st	%f4,	[%l7 + 0x74]
	nop
	set	0x08, %o5
	std	%f30,	[%l7 + %o5]
	nop
	set	0x23, %o7
	ldstub	[%l7 + %o7],	%i7
	nop
	set	0x3A, %i4
	stb	%i1,	[%l7 + %i4]
	set	0x08, %g3
	stda	%i4,	[%l7 + %g3] 0xeb
	membar	#Sync
	st	%f19,	[%l7 + 0x74]
	set	0x46, %i5
	stha	%i5,	[%l7 + %i5] 0x89
	nop
	set	0x44, %l5
	prefetch	[%l7 + %l5],	 1
	st	%f2,	[%l7 + 0x0C]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l0
	st	%f4,	[%l7 + 0x20]
	nop
	set	0x18, %l4
	stw	%l4,	[%l7 + %l4]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf9
	membar	#Sync
	fpsub16	%f28,	%f20,	%f30
	set	0x18, %g7
	stda	%o6,	[%l7 + %g7] 0x89
	nop
	set	0x5C, %o6
	prefetch	[%l7 + %o6],	 4
	set	0x16, %i7
	stha	%o4,	[%l7 + %i7] 0xea
	membar	#Sync
	add	%l5,	%o5,	%o1
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x80,	%g1
	set	0x5C, %g1
	lda	[%l7 + %g1] 0x80,	%f14
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%o2
	set	0x5C, %o0
	stwa	%g6,	[%l7 + %o0] 0x80
	set	0x70, %g5
	prefetcha	[%l7 + %g5] 0x81,	 3
	set	0x38, %l6
	sta	%f21,	[%l7 + %l6] 0x80
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%l3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%i0
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x88,	 3
	nop
	set	0x38, %o2
	std	%f0,	[%l7 + %o2]
	set	0x6C, %i6
	swapa	[%l7 + %i6] 0x81,	%o2
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x81,	%l6
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x2C, %l0
	lduw	[%l7 + %l0],	%i3
	nop
	set	0x18, %i1
	stw	%g7,	[%l7 + %i1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%g4
	st	%f28,	[%l7 + 0x6C]
	nop
	set	0x6C, %i2
	prefetch	[%l7 + %i2],	 0
	set	0x7B, %g2
	stba	%g3,	[%l7 + %g2] 0x80
	nop
	set	0x4B, %l1
	ldub	[%l7 + %l1],	%o7
	add	%i7,	%i1,	%i4
	st	%fsr,	[%l7 + 0x10]
	add	%i5,	%l2,	%l0
	or	%l4,	%g2,	%o4
	nop
	set	0x3C, %i0
	ldsh	[%l7 + %i0],	%o6
	nop
	set	0x12, %o5
	sth	%l5,	[%l7 + %o5]
	st	%f1,	[%l7 + 0x18]
	set	0x4C, %o1
	sta	%f6,	[%l7 + %o1] 0x81
	set	0x50, %o7
	lda	[%l7 + %o7] 0x89,	%f17
	nop
	set	0x60, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	or	%o1,	%o5,	%o3
	set	0x38, %i5
	stwa	%g1,	[%l7 + %i5] 0x81
	set	0x10, %l4
	stda	%l0,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x9B7434F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xA74D3249,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f26,	%f2
	nop
	set	0x48, %i3
	std	%i2,	[%l7 + %i3]
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x89,	%l3
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f26
	wr	%i6,	%g6,	%pic
	nop
	set	0x56, %i7
	stb	%i0,	[%l7 + %i7]
	add	%o0,	%o2,	%i3
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%g7
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd2
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x80,	 4
	nop
	set	0x39, %o6
	stb	%l6,	[%l7 + %o6]
	set	0x56, %o0
	stha	%g4,	[%l7 + %o0] 0x88
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x54, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i1
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x77, %o2
	ldstub	[%l7 + %o2],	%i4
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x89,	%l2
	nop
	set	0x38, %l2
	stx	%l0,	[%l7 + %l2]
	nop
	set	0x54, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x62, %i6
	ldub	[%l7 + %i6],	%l4
	set	0x70, %l0
	stda	%i4,	[%l7 + %l0] 0xeb
	membar	#Sync
	st	%f25,	[%l7 + 0x50]
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%o4
	nop
	set	0x08, %i2
	std	%f28,	[%l7 + %i2]
	nop
	set	0x4A, %g2
	ldsh	[%l7 + %g2],	%g2
	st	%f24,	[%l7 + 0x1C]
	and	%l5,	%o6,	%o1
	nop
	set	0x5C, %l1
	stw	%o5,	[%l7 + %l1]
	or	%o3,	%g1,	%i2
	st	%f17,	[%l7 + 0x64]
	set	0x20, %o5
	lda	[%l7 + %o5] 0x88,	%f30
	set	0x18, %i0
	lda	[%l7 + %i0] 0x80,	%f29
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x81,	%l2
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%l1
	or	%i6,	%g6,	%i0
	and	%o2,	%o0,	%i3
	set	0x2A, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g7
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xca
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g4
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x89,	%g5
	nop
	set	0x70, %i5
	ldsw	[%l7 + %i5],	%g3
	nop
	set	0x48, %g7
	stx	%o7,	[%l7 + %g7]
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f28
	set	0x30, %i3
	stba	%i7,	[%l7 + %i3] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x88,	%i4
	set	0x1D, %g6
	stba	%l2,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x81,	%l0
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd0,	%f0
	nop
	set	0x28, %g5
	ldsw	[%l7 + %g5],	%i1
	and	%i5,	%l4,	%g2
	nop
	set	0x62, %l6
	sth	%o4,	[%l7 + %l6]
	nop
	set	0x64, %g4
	swap	[%l7 + %g4],	%l5
	nop
	set	0x76, %o2
	ldub	[%l7 + %o2],	%o1
	nop
	set	0x3C, %o4
	stw	%o6,	[%l7 + %o4]
	nop
	set	0x55, %o0
	ldstub	[%l7 + %o0],	%o3
	nop
	set	0x4A, %l2
	ldub	[%l7 + %l2],	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%i2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd0
	add	%l3,	%l1,	%g6
	set	0x10, %l0
	ldxa	[%l7 + %l0] 0x88,	%i0
	bn,a	%xcc,	loop_119
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%o2
	set	0x60, %i2
	sta	%f19,	[%l7 + %i2] 0x88
loop_119:
	nop
	set	0x3A, %g2
	stb	%i6,	[%l7 + %g2]
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f14
	set	0x68, %o5
	swapa	[%l7 + %o5] 0x89,	%o0
	nop
	set	0x30, %i0
	std	%g6,	[%l7 + %i0]
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	ld	[%l7 + 0x60],	%f2
	nop
	set	0x72, %o7
	ldub	[%l7 + %o7],	%g4
	nop
	set	0x20, %o3
	prefetch	[%l7 + %o3],	 2
	or	%g5,	%g3,	%o7
	set	0x24, %i4
	stwa	%i7,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x24, %l4
	ldsw	[%l7 + %l4],	%l6
	nop
	set	0x10, %i5
	swap	[%l7 + %i5],	%l2
	nop
	set	0x08, %g7
	ldstub	[%l7 + %g7],	%l0
	nop
	set	0x09, %g3
	stb	%i1,	[%l7 + %g3]
	set	0x60, %i3
	ldxa	[%l7 + %i3] 0x88,	%i4
	nop
	set	0x69, %l3
	stb	%i5,	[%l7 + %l3]
	nop
	set	0x68, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%g2
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x60, %o6
	ldxa	[%l7 + %o6] 0x88,	%l4
	set	0x7C, %g5
	swapa	[%l7 + %g5] 0x80,	%l5
	nop
	set	0x28, %l6
	std	%o0,	[%l7 + %l6]
	set	0x6D, %i7
	stba	%o6,	[%l7 + %i7] 0x80
	nop
	set	0x08, %o2
	std	%f18,	[%l7 + %o2]
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%o3
	nop
	set	0x78, %o0
	std	%o4,	[%l7 + %o0]
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%g0
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf0
	membar	#Sync
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f28
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	nop
	set	0x4C, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x14, %g4
	ldstub	[%l7 + %g4],	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%i2
	set	0x60, %l1
	stxa	%g6,	[%l7 + %l1] 0x81
	nop
	set	0x14, %g2
	swap	[%l7 + %g2],	%i0
	ld	[%l7 + 0x40],	%f27
	ld	[%l7 + 0x30],	%f19
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f16
	ld	[%l7 + 0x44],	%f19
	nop
	set	0x7C, %o5
	stb	%i6,	[%l7 + %o5]
	set	0x68, %o1
	stxa	%o2,	[%l7 + %o1] 0xe3
	membar	#Sync
	bne,a,pn	%xcc,	loop_120
	add	%o0,	%g7,	%g4
	nop
	set	0x12, %o7
	ldsh	[%l7 + %o7],	%i3
	add	%g3,	%g5,	%o7
loop_120:
	nop
	set	0x78, %i4
	stb	%l6,	[%l7 + %i4]
	nop
	set	0x54, %o3
	lduw	[%l7 + %o3],	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i1
	and	%i4,	%l0,	%g2
	nop
	set	0x18, %i5
	stw	%l4,	[%l7 + %i5]
	nop
	set	0x1A, %l4
	ldsb	[%l7 + %l4],	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%o1
	nop
	set	0x50, %g7
	swap	[%l7 + %g7],	%o3
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%o6
	wr	%g1,	%o5,	%softint
	set	0x44, %i3
	lda	[%l7 + %i3] 0x80,	%f17
	nop
	set	0x74, %g1
	prefetch	[%l7 + %g1],	 0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%l1
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x18, %l3
	std	%g6,	[%l7 + %l3]
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x88,	 2
	nop
	set	0x14, %o6
	sth	%i0,	[%l7 + %o6]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f16
	set	0x1C, %l6
	stwa	%o0,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x4A, %i7
	ldsh	[%l7 + %i7],	%o2
	set	0x70, %o2
	stxa	%g7,	[%l7 + %o2] 0x80
	set	0x2A, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i3
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%g4
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%g3
	nop
	set	0x27, %l2
	ldub	[%l7 + %l2],	%g5
	nop
	set	0x10, %l0
	stx	%l6,	[%l7 + %l0]
	nop
	set	0x58, %i1
	swap	[%l7 + %i1],	%o7
	nop
	set	0x38, %i6
	swap	[%l7 + %i6],	%l2
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x88,	 4
	nop
	set	0x50, %g4
	std	%f30,	[%l7 + %g4]
	wr	%i7,	%i4,	%ccr
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x88,	%g2
	nop
	set	0x70, %i0
	ldsh	[%l7 + %i0],	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%l4
	nop
	set	0x58, %o5
	std	%o0,	[%l7 + %o5]
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x80,	%l5
	set	0x6C, %o1
	stwa	%o6,	[%l7 + %o1] 0x89
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	nop
	set	0x28, %i4
	std	%f10,	[%l7 + %i4]
	ld	[%l7 + 0x38],	%f22
	nop
	set	0x5A, %l4
	ldsh	[%l7 + %l4],	%o3
	set	0x20, %g7
	stxa	%g1,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%f30
	nop
	set	0x33, %i5
	ldstub	[%l7 + %i5],	%o5
	nop
	set	0x28, %g1
	prefetch	[%l7 + %g1],	 1
	st	%f1,	[%l7 + 0x50]
	nop
	set	0x20, %i3
	std	%l2,	[%l7 + %i3]
	nop
	set	0x54, %l5
	prefetch	[%l7 + %l5],	 4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x80
	set	0x2C, %g5
	stwa	%l1,	[%l7 + %g5] 0x80
	nop
	set	0x4F, %l3
	ldstub	[%l7 + %l3],	%i2
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%o4
	nop
	set	0x4D, %o2
	ldub	[%l7 + %o2],	%i6
	nop
	set	0x18, %i7
	stx	%i0,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x4C]
	or	%g6,	%o0,	%g7
	nop
	set	0x79, %o4
	ldub	[%l7 + %o4],	%i3
	nop
	set	0x78, %g6
	ldub	[%l7 + %g6],	%o2
	nop
	set	0x20, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x88,	%g4
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x68, %l0
	std	%f28,	[%l7 + %l0]
	wr	%g5,	%g3,	%softint
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x88,	%o6
	fpadd32s	%f25,	%f13,	%f12
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%l6
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xe2,	%l2
	ld	[%l7 + 0x68],	%f1
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%i7
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f24
	nop
	set	0x48, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x89,	%i1
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x89,	%g2
	nop
	set	0x7D, %o3
	ldsb	[%l7 + %o3],	%i4
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%l0
	set	0x48, %i4
	stxa	%i5,	[%l7 + %i4] 0xeb
	membar	#Sync
	wr	%o1,	%l5,	%softint
	add	%l4,	%o6,	%o3
	nop
	set	0x50, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%o4
	st	%f1,	[%l7 + 0x10]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g1
	nop
	set	0x46, %g1
	lduh	[%l7 + %g1],	%i2
	ld	[%l7 + 0x6C],	%f31
	ble,a,pn	%xcc,	loop_121
	st	%f0,	[%l7 + 0x5C]
	bn	%xcc,	loop_122
	add	%o4,	%l1,	%i0
loop_121:
	nop
	set	0x28, %g7
	swap	[%l7 + %g7],	%g6
	add	%i6,	%g7,	%o0
loop_122:
	nop
	set	0x60, %l5
	ldxa	[%l7 + %l5] 0x80,	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x66F, 	%tick_cmpr
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	add	%g3,	%o7,	%g4
	nop
	set	0x27, %g5
	ldstub	[%l7 + %g5],	%l2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	set	0x18, %l3
	lda	[%l7 + %l3] 0x81,	%f25
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%i1
	nop
	set	0x60, %i7
	stx	%i4,	[%l7 + %i7]
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x89,	 3
	set	0x78, %o0
	sta	%f14,	[%l7 + %o0] 0x89
	fpsub16	%f24,	%f8,	%f20
	nop
	set	0x7A, %l0
	ldsh	[%l7 + %l0],	%l0
	nop
	set	0x3C, %i6
	lduw	[%l7 + %i6],	%i5
	nop
	set	0x6D, %i2
	stb	%l5,	[%l7 + %i2]
	set	0x7A, %o4
	stha	%o1,	[%l7 + %o4] 0x89
	st	%f13,	[%l7 + 0x70]
	set	0x20, %i1
	lda	[%l7 + %i1] 0x88,	%f25
	wr	%l4,	%o6,	%softint
	set	0x25, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o3
	nop
	set	0x32, %o5
	ldsh	[%l7 + %o5],	%o5
	nop
	set	0x59, %i0
	ldstub	[%l7 + %i0],	%l3
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f4
	st	%fsr,	[%l7 + 0x08]
	or	%g1,	%o4,	%i2
	nop
	set	0x44, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x64, %o3
	sth	%l1,	[%l7 + %o3]
	nop
	set	0x77, %g2
	ldub	[%l7 + %g2],	%i0
	ble,a,pt	%icc,	loop_123
	nop
	set	0x1E, %i4
	ldsb	[%l7 + %i4],	%g6
	set	0x0F, %l1
	stba	%i6,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_123:
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%g6
	nop
	set	0x61, %l4
	stb	%o2,	[%l7 + %l4]
	set	0x60, %g1
	stxa	%i3,	[%l7 + %g1] 0x81
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x88,	%g4
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x88,	 1
	set	0x74, %g7
	sta	%f0,	[%l7 + %g7] 0x89
	set	0x3C, %o6
	sta	%f27,	[%l7 + %o6] 0x80
	fpadd32	%f26,	%f22,	%f6
	set	0x20, %i3
	stwa	%o7,	[%l7 + %i3] 0x81
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc4
	nop
	set	0x59, %l3
	ldsb	[%l7 + %l3],	%o0
	nop
	set	0x10, %l6
	stx	%l2,	[%l7 + %l6]
	nop
	set	0x18, %i7
	stx	%l6,	[%l7 + %i7]
	nop
	set	0x48, %o2
	ldx	[%l7 + %o2],	%i7
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x26, %l2
	ldsb	[%l7 + %l2],	%g4
	ld	[%l7 + 0x0C],	%f4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf8
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%g2
	or	%i4,	%i5,	%l0
	add	%l5,	%l4,	%o6
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	nop
	set	0x60, %i6
	ldub	[%l7 + %i6],	%o5
	nop
	set	0x38, %i2
	std	%f22,	[%l7 + %i2]
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x0C, %o0
	swapa	[%l7 + %o0] 0x80,	%o1
	wr	%g1,	%l3,	%ccr
	nop
	set	0x0C, %i1
	ldstub	[%l7 + %i1],	%o4
	nop
	set	0x24, %g4
	ldub	[%l7 + %g4],	%i2
	nop
	set	0x50, %o5
	ldsh	[%l7 + %o5],	%i0
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%g6
	st	%f20,	[%l7 + 0x0C]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%i6
	nop
	set	0x5F, %i0
	ldstub	[%l7 + %i0],	%o2
	set	0x10, %o3
	stba	%i3,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x50, %o7
	std	%f18,	[%l7 + %o7]
	set	0x50, %i4
	stda	%g4,	[%l7 + %i4] 0x88
	or	%g3,	%g7,	%o7
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%o0
	st	%f1,	[%l7 + 0x14]
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%l2
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x88,	 2
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%i1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%i4
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	nop
	nop
	setx	0xCECBF14F121C7B88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x29AB3A1E8EE80BBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f22
	nop
	set	0x78, %l5
	swap	[%l7 + %l5],	%g4
	and	%l0,	%l5,	%l4
	set	0x2E, %g7
	ldstuba	[%l7 + %g7] 0x81,	%o3
	set	0x58, %i3
	lda	[%l7 + %i3] 0x89,	%f0
	nop
	set	0x10, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x68, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x2C, %g5
	lduh	[%l7 + %g5],	%o6
	nop
	set	0x20, %l6
	prefetch	[%l7 + %l6],	 4
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f0
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%o5
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x88,	 1
	set	0x4C, %l0
	sta	%f6,	[%l7 + %l0] 0x80
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%f0
	nop
	set	0x48, %i6
	stw	%g1,	[%l7 + %i6]
	set	0x51, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o4
	nop
	set	0x47, %o0
	ldub	[%l7 + %o0],	%l3
	and	%i0,	%g6,	%i2
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x81
	and	%i6,	%l1,	%o2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f0
	and	%g5,	%i3,	%g3
	st	%f19,	[%l7 + 0x20]
	set	0x75, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o7
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%g7
	set	0x08, %i0
	stda	%o0,	[%l7 + %i0] 0x88
	set	0x51, %o3
	stba	%l2,	[%l7 + %o3] 0xe2
	membar	#Sync
	bne,a	%icc,	loop_124
	nop
	set	0x0B, %g4
	ldub	[%l7 + %g4],	%i7
	set	0x14, %i4
	stha	%i1,	[%l7 + %i4] 0xe3
	membar	#Sync
loop_124:
	nop
	set	0x64, %o7
	ldsh	[%l7 + %o7],	%l6
	set	0x68, %g2
	swapa	[%l7 + %g2] 0x88,	%g2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%g4
	nop
	set	0x2F, %g3
	ldsb	[%l7 + %g3],	%l0
	add	%l5,	%i5,	%l4
	st	%f31,	[%l7 + 0x48]
	nop
	set	0x28, %l4
	lduw	[%l7 + %l4],	%o6
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x89,	 2
	nop
	set	0x58, %i5
	std	%o0,	[%l7 + %i5]
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%o5
	and	%o4,	%g1,	%l3
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x89,	%i0
	nop
	set	0x34, %l5
	ldsw	[%l7 + %l5],	%i2
	nop
	set	0x77, %i3
	stb	%i6,	[%l7 + %i3]
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%g6
	set	0x0C, %l3
	lda	[%l7 + %l3] 0x81,	%f21
	st	%f19,	[%l7 + 0x1C]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1281
!	Type a   	: 30
!	Type cti   	: 33
!	Type x   	: 499
!	Type f   	: 40
!	Type i   	: 117
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
	set	0x1,	%g1
	set	0x9,	%g2
	set	0x1,	%g3
	set	0x1,	%g4
	set	0xF,	%g5
	set	0xC,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xB,	%i1
	set	-0xB,	%i2
	set	-0x6,	%i3
	set	-0x5,	%i4
	set	-0x1,	%i5
	set	-0x7,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x6C4D72F7,	%l0
	set	0x1ADDEADB,	%l1
	set	0x49793AEF,	%l2
	set	0x0027FD4E,	%l3
	set	0x4B92F952,	%l4
	set	0x57A44808,	%l5
	set	0x094F65FA,	%l6
	!# Output registers
	set	0x1EA1,	%o0
	set	-0x122E,	%o1
	set	-0x1DD7,	%o2
	set	-0x0EAF,	%o3
	set	-0x0F1C,	%o4
	set	0x0545,	%o5
	set	-0x0E08,	%o6
	set	0x1476,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f24
	ba,a,pn	%xcc,	loop_125
	and	%o2,	%g5,	%i3
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x80,	%g3
loop_125:
	nop
	set	0x20, %i7
	swap	[%l7 + %i7],	%l1
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%g6
	nop
	set	0x50, %l2
	sth	%o7,	[%l7 + %l2]
	set	0x65, %g6
	stba	%o0,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x1C, %i6
	ldsw	[%l7 + %i6],	%l2
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x80,	 1
	nop
	set	0x4B, %o0
	ldub	[%l7 + %o0],	%l6
	set	0x3E, %l0
	stha	%i1,	[%l7 + %l0] 0xe3
	membar	#Sync
	be,pn	%icc,	loop_126
	st	%fsr,	[%l7 + 0x74]
	bg,pt	%icc,	loop_127
	nop
	set	0x7C, %i1
	ldsh	[%l7 + %i1],	%g2
loop_126:
	nop
	set	0x38, %o5
	std	%f8,	[%l7 + %o5]
	nop
	set	0x2E, %o1
	lduh	[%l7 + %o1],	%i4
loop_127:
	nop
	set	0x42, %i0
	stha	%l0,	[%l7 + %i0] 0x88
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f12
	nop
	set	0x4C, %g4
	ldsh	[%l7 + %g4],	%l5
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%l4
	nop
	nop
	setx	0xC2D460AB49B9FF81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x907DFEE740B767F3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f28
	nop
	set	0x56, %o3
	sth	%o6,	[%l7 + %o3]
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%o2
	set	0x7B, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o1
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xe3,	%o4
	fpsub32	%f14,	%f12,	%f18
	or	%i5,	%o4,	%l3
	wr	%g1,	%i0,	%clear_softint
	nop
	set	0x44, %g2
	stw	%i6,	[%l7 + %g2]
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%g6
	nop
	set	0x08, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f4
	nop
	set	0x78, %g7
	sth	%o2,	[%l7 + %g7]
	nop
	set	0x13, %l1
	stb	%g5,	[%l7 + %l1]
	nop
	set	0x78, %l5
	std	%i2,	[%l7 + %l5]
	nop
	set	0x68, %i3
	std	%l0,	[%l7 + %i3]
	set	0x78, %l3
	stwa	%g3,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x08, %o6
	stxa	%g7,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xe3,	%o6
	ld	[%l7 + 0x34],	%f17
	nop
	set	0x7E, %i7
	stb	%l2,	[%l7 + %i7]
	nop
	set	0x68, %l6
	std	%o0,	[%l7 + %l6]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xda
	or	%i7,	%l6,	%i1
	add	%g2,	%i4,	%l0
	nop
	set	0x61, %l2
	ldstub	[%l7 + %l2],	%l5
	nop
	set	0x18, %g6
	lduh	[%l7 + %g6],	%l4
	nop
	set	0x6E, %i6
	lduh	[%l7 + %i6],	%g4
	nop
	set	0x72, %o4
	lduh	[%l7 + %o4],	%o3
	fpsub16s	%f29,	%f2,	%f8
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%o1
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%i4
	fpsub32	%f26,	%f16,	%f18
	nop
	set	0x38, %l0
	ldub	[%l7 + %l0],	%o5
	nop
	set	0x10, %i1
	swap	[%l7 + %i1],	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%o4
	set	0x31, %o5
	ldstuba	[%l7 + %o5] 0x80,	%i0
	or	%g6,	%i6,	%i2
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%g5
	wr	%i3,	%l1,	%pic
	set	0x45, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o2
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f24
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x36, %i4
	ldsb	[%l7 + %i4],	%g7
	add	%o7,	%o0,	%l2
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x2D, %o3
	ldub	[%l7 + %o3],	%i1
	nop
	set	0x1E, %g2
	lduh	[%l7 + %g2],	%l6
	bgu,pt	%icc,	loop_128
	st	%f21,	[%l7 + 0x1C]
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x34, %l4
	swapa	[%l7 + %l4] 0x88,	%g2
loop_128:
	nop
	set	0x38, %i5
	stx	%i4,	[%l7 + %i5]
	nop
	set	0x12, %g7
	ldsh	[%l7 + %g7],	%l0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%l4
	set	0x10, %i3
	stxa	%l4,	[%l7 + %i3] 0x89
	set	0x34, %l3
	sta	%f8,	[%l7 + %l3] 0x88
	set	0x14, %l1
	sta	%f16,	[%l7 + %l1] 0x89
	ld	[%l7 + 0x34],	%f4
	nop
	set	0x68, %g5
	lduh	[%l7 + %g5],	%g4
	set	0x6C, %i7
	stwa	%o3,	[%l7 + %i7] 0x88
	nop
	set	0x3C, %o6
	lduw	[%l7 + %o6],	%o1
	bge,a	%icc,	loop_129
	nop
	set	0x24, %l6
	stw	%i5,	[%l7 + %l6]
	fpsub32	%f12,	%f30,	%f8
	nop
	set	0x50, %o2
	stx	%o5,	[%l7 + %o2]
loop_129:
	bne,a,pt	%xcc,	loop_130
	nop
	set	0x30, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x57, %i6
	ldstub	[%l7 + %i6],	%o6
	fpadd32	%f0,	%f24,	%f18
loop_130:
	nop
	set	0x08, %o4
	lda	[%l7 + %o4] 0x89,	%f14
	nop
	set	0x60, %l2
	std	%l2,	[%l7 + %l2]
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%g1
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%o4
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%i0
	nop
	set	0x29, %i0
	ldstub	[%l7 + %i0],	%g6
	and	%i2,	%g5,	%i3
	ble,pt	%icc,	loop_131
	nop
	set	0x2B, %o1
	ldsb	[%l7 + %o1],	%l1
	nop
	set	0x08, %o5
	swap	[%l7 + %o5],	%i6
	set	0x10, %i2
	stda	%o2,	[%l7 + %i2] 0x89
loop_131:
	nop
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	nop
	set	0x7C, %i4
	swap	[%l7 + %i4],	%g3
	add	%o7,	%o0,	%l2
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x18, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x20, %o3
	stxa	%i7,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x80,	%i0
	nop
	set	0x5E, %g1
	sth	%g2,	[%l7 + %g1]
	nop
	set	0x48, %i5
	ldub	[%l7 + %i5],	%i4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%l6
	nop
	set	0x1A, %l4
	stb	%l5,	[%l7 + %l4]
	bg,pn	%xcc,	loop_132
	st	%fsr,	[%l7 + 0x44]
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x81,	%l4
loop_132:
	nop
	set	0x48, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g4
	nop
	set	0x74, %l3
	stw	%o3,	[%l7 + %l3]
	nop
	set	0x38, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x88,	%i5
	nop
	set	0x0E, %l1
	sth	%o5,	[%l7 + %l1]
	or	%o1,	%l3,	%o6
	set	0x28, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	nop
	set	0x68, %o6
	std	%f14,	[%l7 + %o6]
	nop
	set	0x28, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x50, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x40, %g6
	std	%i0,	[%l7 + %g6]
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%g6
	fpadd16s	%f18,	%f4,	%f8
	set	0x70, %o4
	stda	%i2,	[%l7 + %o4] 0x80
	set	0x4C, %o0
	stwa	%i3,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x2A, %l2
	stb	%g5,	[%l7 + %l2]
	be	%xcc,	loop_133
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%l0
	st	%f6,	[%l7 + 0x2C]
	nop
	set	0x74, %i0
	ldub	[%l7 + %i0],	%i6
loop_133:
	add	%g7,	%o2,	%o7
	nop
	set	0x20, %o1
	std	%f10,	[%l7 + %o1]
	add	%o0,	%l2,	%i7
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x88,	%g3
	nop
	set	0x44, %i1
	swap	[%l7 + %i1],	%g2
	ld	[%l7 + 0x2C],	%f5
	set	0x30, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i4
	nop
	set	0x6C, %i4
	ldub	[%l7 + %i4],	%i1
	ld	[%l7 + 0x14],	%f19
	nop
	set	0x70, %o7
	sth	%l6,	[%l7 + %o7]
	add	%l5,	%l4,	%g4
	nop
	set	0x1C, %g4
	lduh	[%l7 + %g4],	%l0
	nop
	set	0x16, %g3
	ldub	[%l7 + %g3],	%i5
	set	0x68, %g2
	stxa	%o3,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x81,	%o1
	nop
	set	0x48, %o3
	stb	%l3,	[%l7 + %o3]
	nop
	set	0x54, %i5
	swap	[%l7 + %i5],	%o6
	nop
	set	0x72, %l4
	ldsb	[%l7 + %l4],	%g1
	set	0x64, %g7
	sta	%f8,	[%l7 + %g7] 0x89
	set	0x08, %l5
	stxa	%o4,	[%l7 + %l5] 0x89
	nop
	set	0x52, %i3
	ldsh	[%l7 + %i3],	%o5
	set	0x44, %g5
	stwa	%g6,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x24, %l3
	sta	%f24,	[%l7 + %l3] 0x81
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf1
	membar	#Sync
	or	%i2,	%i0,	%i3
	nop
	set	0x38, %i7
	ldstub	[%l7 + %i7],	%l1
	nop
	set	0x48, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x50, %o6
	stxa	%i6,	[%l7 + %o6] 0x81
	and	%g7,	%g5,	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB89, 	%tick_cmpr
	nop
	set	0x2E, %g6
	ldsh	[%l7 + %g6],	%o0
	nop
	set	0x14, %l6
	stw	%i7,	[%l7 + %l6]
	nop
	set	0x3C, %o4
	stw	%g2,	[%l7 + %o4]
	bge,a	%icc,	loop_134
	or	%g3,	%i1,	%i4
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%i6
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%l5
loop_134:
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f16
	set	0x38, %l0
	stxa	%l4,	[%l7 + %l0] 0x88
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%l0
	set	0x08, %o5
	swapa	[%l7 + %o5] 0x81,	%i5
	set	0x1C, %o1
	swapa	[%l7 + %o1] 0x89,	%g4
	set	0x38, %i2
	sta	%f2,	[%l7 + %i2] 0x88
	set	0x2C, %i1
	swapa	[%l7 + %i1] 0x80,	%o3
	nop
	set	0x7E, %o7
	ldsb	[%l7 + %o7],	%o1
	nop
	set	0x5C, %g4
	sth	%l3,	[%l7 + %g4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%o4
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%o5
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf0
	membar	#Sync
	set	0x31, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g6
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x80,	%f12
	set	0x3C, %i5
	swapa	[%l7 + %i5] 0x80,	%g1
	nop
	set	0x68, %l4
	stx	%i2,	[%l7 + %l4]
	nop
	set	0x10, %o3
	ldx	[%l7 + %o3],	%i0
	wr	%i3,	%l1,	%y
	nop
	set	0x50, %g7
	prefetch	[%l7 + %g7],	 1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%g7
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xe3,	%o2
	nop
	set	0x24, %l5
	stw	%g5,	[%l7 + %l5]
	fpsub16s	%f18,	%f4,	%f27
	nop
	set	0x0C, %l3
	stw	%o7,	[%l7 + %l3]
	and	%o0,	%i7,	%g2
	bl	%xcc,	loop_135
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%l2
	set	0x18, %i7
	ldxa	[%l7 + %i7] 0x88,	%g3
loop_135:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%l6
	nop
	set	0x48, %o2
	std	%i0,	[%l7 + %o2]
	nop
	set	0x54, %o6
	swap	[%l7 + %o6],	%l5
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%l4
	wr 	%g0, 	0x5, 	%fprs
	set	0x6C, %l6
	sta	%f16,	[%l7 + %l6] 0x88
	set	0x20, %o4
	stha	%o3,	[%l7 + %o4] 0x80
	set	0x08, %i6
	stda	%o0,	[%l7 + %i6] 0xea
	membar	#Sync
	wr	%l3,	%o6,	%clear_softint
	nop
	set	0x20, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x6C, %l2
	lduw	[%l7 + %l2],	%i5
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x80,	%o4
	nop
	set	0x5C, %i0
	stw	%g6,	[%l7 + %i0]
	set	0x48, %l0
	lda	[%l7 + %l0] 0x80,	%f0
	nop
	set	0x08, %o1
	lduw	[%l7 + %o1],	%o5
	set	0x6A, %i2
	stha	%g1,	[%l7 + %i2] 0x80
	nop
	set	0x5E, %i1
	sth	%i2,	[%l7 + %i1]
	set	0x7D, %o5
	ldstuba	[%l7 + %o5] 0x88,	%i0
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	set	0x54, %o7
	lda	[%l7 + %o7] 0x88,	%f13
	nop
	set	0x30, %i4
	lduw	[%l7 + %i4],	%i6
	nop
	set	0x50, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x6C, %g2
	prefetch	[%l7 + %g2],	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%o2
	nop
	set	0x16, %i5
	ldub	[%l7 + %i5],	%g7
	nop
	set	0x18, %l4
	std	%f24,	[%l7 + %l4]
	set	0x38, %g1
	stxa	%o7,	[%l7 + %g1] 0x80
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f24
	set	0x4C, %i3
	lda	[%l7 + %i3] 0x89,	%f16
	set	0x7E, %l5
	stha	%o0,	[%l7 + %l5] 0x89
	and	%i7,	%g5,	%l2
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%g2
	nop
	set	0x38, %l1
	swap	[%l7 + %l1],	%i4
	nop
	set	0x18, %g7
	ldsw	[%l7 + %g7],	%g2
	nop
	set	0x4A, %o2
	ldub	[%l7 + %o2],	%i1
	add	%l6,	%l5,	%l4
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x24, %g5
	swap	[%l7 + %g5],	%o3
	add	%g4,	%o1,	%o6
	set	0x18, %l6
	stda	%i4,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x26, %o6
	ldsb	[%l7 + %o6],	%l3
	set	0x24, %i6
	sta	%f10,	[%l7 + %i6] 0x81
	nop
	set	0x28, %g6
	stx	%g6,	[%l7 + %g6]
	set	0x36, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o5
	add	%g1,	%o4,	%i0
	nop
	set	0x1A, %l2
	lduh	[%l7 + %l2],	%l1
	set	0x69, %o0
	stba	%i2,	[%l7 + %o0] 0x81
	nop
	set	0x5C, %l0
	stw	%i6,	[%l7 + %l0]
	nop
	set	0x40, %i0
	stx	%o2,	[%l7 + %i0]
	fpsub16s	%f1,	%f18,	%f4
	fpadd16	%f24,	%f10,	%f22
	nop
	set	0x14, %i2
	lduh	[%l7 + %i2],	%g7
	set	0x20, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i3
	set	0x28, %o1
	stda	%o6,	[%l7 + %o1] 0x89
	nop
	set	0x48, %g4
	stx	%i7,	[%l7 + %g4]
	fpsub16	%f14,	%f10,	%f30
	set	0x28, %o7
	stha	%g5,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f0
	nop
	set	0x2E, %i4
	lduh	[%l7 + %i4],	%l2
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f28
	and	%g3,	%i4,	%g2
	st	%f11,	[%l7 + 0x68]
	nop
	set	0x14, %g2
	stw	%i1,	[%l7 + %g2]
	nop
	set	0x74, %l4
	lduw	[%l7 + %l4],	%o0
	set	0x5C, %g1
	stwa	%l6,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xea,	%l4
	nop
	set	0x30, %o3
	swap	[%l7 + %o3],	%l5
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xeb,	%l0
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x08, %l3
	swap	[%l7 + %l3],	%o3
	wr	%o1,	%o6,	%softint
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%l3
	set	0x28, %l1
	stda	%g6,	[%l7 + %l1] 0x81
	nop
	set	0x58, %g7
	prefetch	[%l7 + %g7],	 2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%g1
	st	%fsr,	[%l7 + 0x70]
	or	%i5,	%o4,	%l1
	set	0x7C, %i7
	lda	[%l7 + %i7] 0x88,	%f31
	nop
	set	0x6E, %o2
	sth	%i2,	[%l7 + %o2]
	nop
	set	0x4C, %l6
	sth	%i6,	[%l7 + %l6]
	set	0x4C, %g5
	swapa	[%l7 + %g5] 0x88,	%o2
	set	0x7F, %o6
	ldstuba	[%l7 + %o6] 0x81,	%g7
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xea,	%i0
	nop
	set	0x28, %l2
	std	%o6,	[%l7 + %l2]
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%i6
	nop
	set	0x2E, %l0
	ldub	[%l7 + %l0],	%g5
	nop
	set	0x64, %i0
	prefetch	[%l7 + %i0],	 4
	set	0x10, %g6
	lda	[%l7 + %g6] 0x89,	%f26
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g3
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%i3
	set	0x36, %o1
	ldstuba	[%l7 + %o1] 0x81,	%i4
	fpadd16s	%f31,	%f6,	%f22
	nop
	set	0x3B, %i1
	ldstub	[%l7 + %i1],	%g2
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xe2,	%i0
	nop
	set	0x3E, %o7
	sth	%l6,	[%l7 + %o7]
	fpadd16s	%f17,	%f31,	%f4
	bne	%icc,	loop_136
	nop
	set	0x6C, %o5
	stw	%l4,	[%l7 + %o5]
	ld	[%l7 + 0x14],	%f11
	and	%o0,	%l0,	%o3
loop_136:
	nop
	set	0x74, %g3
	stha	%l5,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x14, %i4
	stha	%o6,	[%l7 + %i4] 0x80
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%g4
	or	%l3,	%o1,	%o5
	nop
	set	0x10, %g2
	stx	%g1,	[%l7 + %g2]
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x88,	%i4
	nop
	set	0x10, %g1
	std	%o4,	[%l7 + %g1]
	set	0x60, %o3
	sta	%f15,	[%l7 + %o3] 0x89
	set	0x0A, %i3
	stha	%g6,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%l1
	nop
	set	0x2C, %l5
	ldsh	[%l7 + %l5],	%i6
	set	0x20, %l3
	lda	[%l7 + %l3] 0x80,	%f19
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x88,	%g7
	set	0x20, %o2
	lda	[%l7 + %o2] 0x80,	%f25
	st	%f25,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%f20
	set	0x20, %l6
	ldxa	[%l7 + %l6] 0x80,	%i0
	set	0x11, %l1
	stba	%o7,	[%l7 + %l1] 0x80
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xeb,	%i6
	nop
	set	0x5F, %i6
	stb	%o2,	[%l7 + %i6]
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%g5
	set	0x64, %l2
	sta	%f2,	[%l7 + %l2] 0x81
	wr	%g3,	%l2,	%softint
	nop
	set	0x10, %o0
	std	%i2,	[%l7 + %o0]
	set	0x37, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i4
	set	0x48, %l0
	stxa	%g2,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x20, %g6
	std	%f28,	[%l7 + %g6]
	nop
	set	0x70, %o1
	ldx	[%l7 + %o1],	%l4
	set	0x40, %i1
	swapa	[%l7 + %i1] 0x80,	%o0
	nop
	set	0x74, %g4
	sth	%l0,	[%l7 + %g4]
	nop
	set	0x52, %o5
	ldub	[%l7 + %o5],	%o3
	st	%f24,	[%l7 + 0x18]
	nop
	set	0x48, %o7
	stx	%l6,	[%l7 + %o7]
	set	0x60, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0
	or	%g4,	%l3,	%o1
	nop
	set	0x28, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%o6
	set	0x30, %i5
	sta	%f14,	[%l7 + %i5] 0x88
	bn,pt	%icc,	loop_137
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%o4
	set	0x72, %o3
	stha	%i5,	[%l7 + %o3] 0xe2
	membar	#Sync
loop_137:
	nop
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x80,	%g0
	nop
	set	0x10, %l5
	std	%f10,	[%l7 + %l5]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f16
	nop
	set	0x38, %g7
	lduw	[%l7 + %g7],	%o4
	nop
	set	0x16, %i3
	ldsh	[%l7 + %i3],	%i2
	nop
	set	0x58, %o2
	stx	%l1,	[%l7 + %o2]
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x88,	%g6
	nop
	set	0x18, %l1
	ldx	[%l7 + %l1],	%i6
	set	0x54, %g5
	sta	%f0,	[%l7 + %g5] 0x80
	set	0x60, %l6
	stda	%i0,	[%l7 + %l6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x20]
	set	0x74, %i6
	stwa	%o7,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x48, %l2
	stda	%i6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x40, %o0
	stw	%o2,	[%l7 + %o0]
	bgu,a,pn	%icc,	loop_138
	nop
	set	0x4A, %o4
	ldstub	[%l7 + %o4],	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%l2
loop_138:
	nop
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x18, %i0
	stx	%fsr,	[%l7 + %i0]
	and	%i3,	%i4,	%g2
	set	0x2C, %o6
	swapa	[%l7 + %o6] 0x88,	%i1
	set	0x08, %i2
	stda	%l4,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x74, %o1
	stha	%g3,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x78, %i1
	sth	%o0,	[%l7 + %i1]
	nop
	set	0x49, %g6
	stb	%l0,	[%l7 + %g6]
	set	0x6C, %g4
	stwa	%o3,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x54, %o7
	stwa	%l5,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x70, %o5
	prefetcha	[%l7 + %o5] 0x89,	 0
	and	%l3,	%o1,	%l6
	nop
	set	0x68, %i4
	stw	%o6,	[%l7 + %i4]
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%o4
	or	%i5,	%o4,	%i2
	set	0x73, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l1
	set	0x38, %l4
	stxa	%g6,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x2C, %o3
	ldstuba	[%l7 + %o3] 0x81,	%i6
	nop
	set	0x51, %g1
	ldub	[%l7 + %g1],	%g1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%o7
	nop
	set	0x32, %l3
	ldstub	[%l7 + %l3],	%i7
	ld	[%l7 + 0x48],	%f21
	ble,a	%icc,	loop_139
	nop
	set	0x68, %g2
	swap	[%l7 + %g2],	%o2
	set	0x40, %g7
	stda	%g4,	[%l7 + %g7] 0xeb
	membar	#Sync
loop_139:
	nop
	set	0x08, %i3
	stw	%l2,	[%l7 + %i3]
	nop
	set	0x52, %i7
	ldub	[%l7 + %i7],	%g7
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x89,	%i3
	set	0x18, %g5
	sta	%f10,	[%l7 + %g5] 0x88
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x81,	%g2
	and	%i4,	%l4,	%i1
	nop
	set	0x28, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x20, %l2
	stda	%g2,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x4C, %i6
	stwa	%l0,	[%l7 + %i6] 0x80
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x38, %l0
	stx	%o3,	[%l7 + %l0]
	add	%o0,	%g4,	%l3
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x80,	 1
	add	%l5,	%l6,	%o5
	set	0x10, %i0
	stda	%i4,	[%l7 + %i0] 0x81
	wr	%o4,	%o6,	%ccr
	set	0x50, %o6
	stxa	%i2,	[%l7 + %o6] 0x81
	set	0x40, %o1
	stda	%l0,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x17, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g6
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	nop
	set	0x38, %g6
	stx	%i0,	[%l7 + %g6]
	set	0x3C, %g4
	lda	[%l7 + %g4] 0x80,	%f30
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%i7
	nop
	set	0x40, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x81,	%i6
	nop
	set	0x74, %i4
	ldsw	[%l7 + %i4],	%o2
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f26
	add	%l2,	%g7,	%g5
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%i3
	nop
	set	0x26, %o3
	lduh	[%l7 + %o3],	%i4
	set	0x60, %g1
	stxa	%i1,	[%l7 + %g1] 0x81
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%g2
	st	%f26,	[%l7 + 0x78]
	nop
	set	0x1C, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x51, %g2
	ldstub	[%l7 + %g2],	%l4
	nop
	set	0x54, %g7
	sth	%l0,	[%l7 + %g7]
	ld	[%l7 + 0x08],	%f9
	nop
	set	0x5E, %i7
	ldsb	[%l7 + %i7],	%o3
	nop
	set	0x6A, %i3
	ldstub	[%l7 + %i3],	%o0
	set	0x58, %l1
	ldxa	[%l7 + %l1] 0x89,	%l3
	nop
	set	0x4E, %g5
	sth	%g4,	[%l7 + %g5]
	and	%l5,	%o1,	%l6
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x60, %l6
	stx	%fsr,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %o2
	sta	%f27,	[%l7 + %o2] 0x89
	nop
	set	0x7E, %i6
	ldsb	[%l7 + %i6],	%i5
	nop
	set	0x3C, %l2
	ldsh	[%l7 + %l2],	%o4
	nop
	set	0x28, %l0
	std	%o6,	[%l7 + %l0]
	nop
	set	0x47, %o4
	ldub	[%l7 + %o4],	%i2
	set	0x19, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l1
	nop
	set	0x30, %o6
	ldstub	[%l7 + %o6],	%g6
	fpadd16	%f20,	%f28,	%f20
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%i0
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x81,	%f7
	set	0x62, %i1
	stba	%o7,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x28, %o1
	stda	%i6,	[%l7 + %o1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x2C],	%f8
	set	0x70, %i2
	stwa	%o5,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x58, %g6
	std	%f18,	[%l7 + %g6]
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x89,	%o2
	fpadd32s	%f15,	%f10,	%f29
	nop
	set	0x6B, %g4
	ldstub	[%l7 + %g4],	%l2
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x7C, %i4
	ldsb	[%l7 + %i4],	%i6
	set	0x40, %i5
	stwa	%g5,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x23, %g3
	ldsb	[%l7 + %g3],	%g7
	nop
	set	0x44, %o3
	ldsw	[%l7 + %o3],	%g2
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%i4
	set	0x34, %l3
	lda	[%l7 + %l3] 0x80,	%f20
	set	0x78, %l5
	stha	%i3,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x70, %g2
	stx	%i1,	[%l7 + %g2]
	nop
	set	0x4C, %g7
	swap	[%l7 + %g7],	%l4
	nop
	set	0x26, %i7
	lduh	[%l7 + %i7],	%g3
	fpsub16s	%f21,	%f18,	%f6
	set	0x24, %i3
	lda	[%l7 + %i3] 0x89,	%f23
	set	0x5C, %l4
	swapa	[%l7 + %l4] 0x81,	%o3
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x89,	 1
	nop
	set	0x48, %l6
	std	%o0,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x0C, %o2
	ldsw	[%l7 + %o2],	%l3
	fpsub16	%f12,	%f0,	%f12
	nop
	set	0x78, %g5
	stw	%g4,	[%l7 + %g5]
	st	%f8,	[%l7 + 0x44]
	nop
	set	0x7C, %l2
	stw	%o1,	[%l7 + %l2]
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%i6
	nop
	set	0x70, %i6
	std	%f30,	[%l7 + %i6]
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x88,	 0
	or	%i5,	%o6,	%o4
	or	%i2,	%l1,	%g6
	nop
	set	0x60, %o0
	stx	%g1,	[%l7 + %o0]
	nop
	set	0x68, %o6
	std	%i0,	[%l7 + %o6]
	nop
	set	0x26, %i0
	ldstub	[%l7 + %i0],	%o7
	nop
	set	0x3E, %i1
	ldub	[%l7 + %i1],	%o5
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xeb,	%o2
	nop
	set	0x70, %i2
	prefetch	[%l7 + %i2],	 0
	fpadd16	%f30,	%f26,	%f26
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd8
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x89,	%l2
	set	0x52, %o5
	stha	%i7,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x78, %i4
	stxa	%g5,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%i6
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	and	%g2,	%i3,	%i4
	add	%l4,	%g3,	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%o0
	nop
	set	0x28, %o3
	std	%l2,	[%l7 + %o3]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xe2,	%g4
	set	0x18, %i5
	stda	%o0,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x14, %l5
	prefetch	[%l7 + %l5],	 2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o6
	nop
	set	0x70, %l3
	std	%o4,	[%l7 + %l3]
	bne	%xcc,	loop_140
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x60, %g2
	ldsb	[%l7 + %g2],	%l0
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%i2
loop_140:
	nop
	set	0x12, %i3
	ldstub	[%l7 + %i3],	%l1
	nop
	set	0x28, %g7
	stw	%g6,	[%l7 + %g7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%o7
	set	0x3D, %l1
	ldstuba	[%l7 + %l1] 0x81,	%g1
	nop
	set	0x60, %l6
	ldsh	[%l7 + %l6],	%o5
	nop
	set	0x0A, %o2
	ldsb	[%l7 + %o2],	%l2
	nop
	set	0x30, %g5
	stx	%o2,	[%l7 + %g5]
	set	0x70, %l2
	sta	%f16,	[%l7 + %l2] 0x81
	nop
	set	0x38, %l4
	std	%i6,	[%l7 + %l4]
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%g7
	nop
	set	0x58, %i6
	ldub	[%l7 + %i6],	%g2
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%g4
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%l4
	nop
	set	0x49, %o4
	stb	%g3,	[%l7 + %o4]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd2
	set	0x10, %i2
	stda	%o2,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x5C, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i1
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%o0
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x69, %i4
	stb	%g4,	[%l7 + %i4]
	nop
	set	0x32, %o5
	lduh	[%l7 + %o5],	%l3
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f6
	nop
	set	0x34, %o3
	stb	%l6,	[%l7 + %o3]
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%l5
	nop
	set	0x55, %i5
	ldub	[%l7 + %i5],	%i5
	nop
	set	0x2D, %l5
	stb	%o1,	[%l7 + %l5]
	wr	%o4,	%o6,	%set_softint
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x89,	%l0
	nop
	set	0x46, %g2
	ldstub	[%l7 + %g2],	%l1
	nop
	set	0x10, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x44, %l3
	ldsh	[%l7 + %l3],	%i2
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	or	%g6,	%o7,	%i0
	nop
	set	0x3B, %g7
	ldub	[%l7 + %g7],	%o5
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x80,	%g0
	fpsub32s	%f0,	%f2,	%f26
	and	%o2,	%i7,	%l2
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%i6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x68, %g5
	stb	%g2,	[%l7 + %g5]
	set	0x20, %l2
	ldxa	[%l7 + %l2] 0x81,	%i3
	set	0x44, %l0
	stha	%g7,	[%l7 + %l0] 0x89
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%g5
	set	0x40, %i6
	swapa	[%l7 + %i6] 0x80,	%g3
	or	%o3,	%l4,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%g4
	set	0x38, %o6
	stda	%i0,	[%l7 + %o6] 0xe2
	membar	#Sync
	fpadd32	%f18,	%f30,	%f4
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 2
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe2,	%l2
	st	%f8,	[%l7 + 0x20]
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%l6
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%o1
	nop
	set	0x65, %g6
	ldub	[%l7 + %g6],	%o4
	st	%f5,	[%l7 + 0x0C]
	set	0x28, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o6
	set	0x14, %i0
	stha	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x4B, %g4
	ldstuba	[%l7 + %g4] 0x81,	%l0
	add	%i2,	%g6,	%o7
	nop
	set	0x0C, %o5
	sth	%o5,	[%l7 + %o5]
	nop
	set	0x0C, %o7
	ldsb	[%l7 + %o7],	%i0
	nop
	set	0x10, %i4
	stx	%g1,	[%l7 + %i4]
	set	0x18, %o3
	stda	%o2,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x60, %i5
	lduw	[%l7 + %i5],	%i7
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%l2
	nop
	set	0x18, %g3
	std	%i6,	[%l7 + %g3]
	and	%g2,	%g7,	%g5
	nop
	set	0x20, %g2
	stx	%i3,	[%l7 + %g2]
	nop
	set	0x18, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x5E, %l5
	ldub	[%l7 + %l5],	%o3
	nop
	set	0x08, %l3
	ldsh	[%l7 + %l3],	%g3
	set	0x68, %i3
	stxa	%l4,	[%l7 + %i3] 0x88
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xe3,	%o0
	nop
	set	0x54, %g7
	swap	[%l7 + %g7],	%i4
	nop
	set	0x50, %o2
	std	%i0,	[%l7 + %o2]
	and	%l3,	%l6,	%g4
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%l4
	nop
	set	0x64, %l6
	lduw	[%l7 + %l6],	%i5
	wr	%o1,	%o6,	%set_softint
	nop
	set	0x40, %l2
	lduw	[%l7 + %l2],	%l1
	nop
	set	0x48, %l0
	ldstub	[%l7 + %l0],	%l0
	set	0x78, %i6
	ldxa	[%l7 + %i6] 0x80,	%o4
	and	%i2,	%o7,	%g6
	or	%o5,	%i0,	%g1
	nop
	nop
	setx	0x21AA02E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD83E7978,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f20,	%f25
	set	0x10, %l4
	stda	%o2,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x6C, %o0
	lduw	[%l7 + %o0],	%l2
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	set	0x10, %o1
	stxa	%i7,	[%l7 + %o1] 0x89
	nop
	set	0x1C, %i2
	lduh	[%l7 + %i2],	%i6
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%g2
	set	0x68, %g6
	stwa	%g7,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x80,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%l4
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%i4
	nop
	set	0x70, %g4
	std	%o0,	[%l7 + %g4]
	set	0x34, %o5
	swapa	[%l7 + %o5] 0x89,	%i1
	nop
	set	0x2C, %i4
	lduh	[%l7 + %i4],	%l6
	and	%l3,	%g4,	%l5
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0
	nop
	set	0x50, %i5
	ldsw	[%l7 + %i5],	%i5
	set	0x08, %o3
	stda	%l0,	[%l7 + %o3] 0x80
	set	0x40, %g1
	stba	%o6,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x28, %g3
	lda	[%l7 + %g3] 0x88,	%f21
	nop
	set	0x73, %g2
	ldsb	[%l7 + %g2],	%o4
	set	0x5C, %i7
	lda	[%l7 + %i7] 0x88,	%f13
	nop
	set	0x1F, %l3
	ldstub	[%l7 + %l3],	%l0
	set	0x5A, %l5
	stha	%o7,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x60, %i3
	stx	%g6,	[%l7 + %i3]
	set	0x68, %l1
	stxa	%o5,	[%l7 + %l1] 0x88
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x4A, %g5
	sth	%i0,	[%l7 + %g5]
	nop
	set	0x20, %o2
	std	%f14,	[%l7 + %o2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o2
	nop
	set	0x13, %l6
	ldsb	[%l7 + %l6],	%l2
	nop
	set	0x60, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x80,	 1
	set	0x28, %l4
	stxa	%g1,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x5C, %l2
	swapa	[%l7 + %l2] 0x81,	%g2
	nop
	set	0x14, %o0
	swap	[%l7 + %o0],	%i6
	set	0x40, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%g7
	nop
	set	0x7A, %o1
	sth	%g3,	[%l7 + %o1]
	nop
	set	0x78, %g6
	std	%l4,	[%l7 + %g6]
	add	%i3,	%o0,	%i1
	set	0x68, %o4
	stda	%i4,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x40, %i1
	stx	%l3,	[%l7 + %i1]
	add	%g4,	%l6,	%l5
	nop
	set	0x38, %g4
	stx	%i5,	[%l7 + %g4]
	set	0x34, %o5
	swapa	[%l7 + %o5] 0x81,	%l1
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%o1
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f0
	fpsub16	%f10,	%f18,	%f12
	nop
	set	0x48, %i5
	std	%f14,	[%l7 + %i5]
	and	%o4,	%l0,	%o7
	set	0x42, %o3
	stha	%o6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%o5
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%g6
	or	%i2,	%o2,	%i0
	nop
	set	0x6C, %g3
	prefetch	[%l7 + %g3],	 4
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	set	0x20, %i7
	sta	%f15,	[%l7 + %i7] 0x89
	st	%f13,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x2C]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc8
	set	0x3F, %l3
	ldstuba	[%l7 + %l3] 0x89,	%i7
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%g0
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%f18
	nop
	set	0x58, %i3
	stx	%g2,	[%l7 + %i3]
	be,a	%xcc,	loop_141
	nop
	set	0x74, %o2
	ldsh	[%l7 + %o2],	%i6
	set	0x2C, %l6
	lda	[%l7 + %l6] 0x80,	%f9
loop_141:
	nop
	set	0x3C, %l0
	stb	%g5,	[%l7 + %l0]
	or	%o3,	%g7,	%l4
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f0
	nop
	set	0x0C, %l2
	prefetch	[%l7 + %l2],	 3
	set	0x28, %o0
	stha	%i3,	[%l7 + %o0] 0x88
	nop
	set	0x3C, %l4
	ldsh	[%l7 + %l4],	%o0
	nop
	set	0x48, %i2
	stx	%g3,	[%l7 + %i2]
	nop
	set	0x49, %o1
	ldub	[%l7 + %o1],	%i1
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l3
	nop
	set	0x3E, %g6
	lduh	[%l7 + %g6],	%g4
	set	0x58, %i1
	stxa	%l6,	[%l7 + %i1] 0xe2
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%l5
	nop
	set	0x48, %o4
	ldsh	[%l7 + %o4],	%i5
	set	0x48, %o5
	stda	%o0,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x88,	%o4
	ble,a,pn	%xcc,	loop_142
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f0
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xd8
loop_142:
	bg,pt	%icc,	loop_143
	nop
	set	0x1F, %i5
	ldstub	[%l7 + %i5],	%l1
	set	0x6E, %g1
	stba	%l0,	[%l7 + %g1] 0x88
loop_143:
	nop
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x89
	nop
	set	0x18, %o7
	ldub	[%l7 + %o7],	%o6
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%o7
	nop
	set	0x5E, %g2
	sth	%o5,	[%l7 + %g2]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%i2
	nop
	set	0x78, %i7
	ldsh	[%l7 + %i7],	%o2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f0
	and	%i0,	%l2,	%i7
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%g2
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x88,	%g1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g5
	nop
	set	0x58, %g5
	stw	%o3,	[%l7 + %g5]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%i3
	nop
	set	0x62, %g7
	lduh	[%l7 + %g7],	%g7
	nop
	set	0x4C, %o2
	stw	%o0,	[%l7 + %o2]
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x89,	%i1
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x88,	%g2
	set	0x08, %i6
	stwa	%g4,	[%l7 + %i6] 0x81
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x81,	%l6
	set	0x1C, %l2
	stwa	%i4,	[%l7 + %l2] 0x80
	set	0x5E, %l4
	stha	%l5,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x5A, %i2
	stha	%l3,	[%l7 + %i2] 0x88
	set	0x5C, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o1
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f6
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%o4
	nop
	set	0x34, %i1
	lduh	[%l7 + %i1],	%i5
	nop
	set	0x2C, %o4
	stw	%l0,	[%l7 + %o4]
	nop
	set	0x34, %o5
	swap	[%l7 + %o5],	%l1
	nop
	set	0x38, %g6
	lduw	[%l7 + %g6],	%o7
	nop
	set	0x47, %i4
	ldstub	[%l7 + %i4],	%o6
	bne	%xcc,	loop_144
	nop
	set	0x52, %g4
	lduh	[%l7 + %g4],	%o5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f0
loop_144:
	or	%i2,	%o2,	%g6
	nop
	set	0x50, %g1
	lduw	[%l7 + %g1],	%l2
	or	%i7,	%g2,	%g1
	nop
	set	0x78, %i5
	swap	[%l7 + %i5],	%i6
	nop
	set	0x1A, %o7
	ldub	[%l7 + %o7],	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%l4
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x88,	 2
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i3
	nop
	set	0x08, %g3
	stw	%g7,	[%l7 + %g3]
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x81,	%o0
	and	%g3,	%g4,	%i1
	nop
	set	0x3C, %l5
	swap	[%l7 + %l5],	%i4
	set	0x62, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l5
	nop
	set	0x78, %l1
	std	%i6,	[%l7 + %l1]
	set	0x70, %g7
	stda	%o0,	[%l7 + %g7] 0x80
	nop
	set	0x20, %o2
	prefetch	[%l7 + %o2],	 2
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xea,	%o4
	set	0x10, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l3
	nop
	set	0x6C, %l0
	sth	%l0,	[%l7 + %l0]
	nop
	set	0x50, %i6
	std	%i4,	[%l7 + %i6]
	set	0x18, %l2
	stda	%o6,	[%l7 + %l2] 0x81
	set	0x68, %i3
	lda	[%l7 + %i3] 0x89,	%f2
	set	0x28, %i2
	stha	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	fpadd16	%f18,	%f22,	%f28
	set	0x34, %o0
	sta	%f25,	[%l7 + %o0] 0x81
	nop
	set	0x3C, %l4
	lduw	[%l7 + %l4],	%l1
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x89,	 4
	or	%i2,	%o2,	%l2
	add	%i7,	%g6,	%g2
	nop
	set	0x6A, %i1
	ldstub	[%l7 + %i1],	%i6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g1
	set	0x14, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g5
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%l4
	or	%i3,	%g7,	%o3
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%o0
	set	0x16, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g4
	set	0x0C, %i4
	stwa	%g3,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xda
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xeb,	%i4
	ld	[%l7 + 0x50],	%f19
	set	0x20, %i5
	prefetcha	[%l7 + %i5] 0x80,	 3
	and	%l5,	%o1,	%o4
	nop
	set	0x1D, %g4
	ldstub	[%l7 + %g4],	%l3
	nop
	set	0x4C, %o3
	ldub	[%l7 + %o3],	%l6
	fpadd32s	%f7,	%f11,	%f12
	set	0x20, %g2
	stda	%i4,	[%l7 + %g2] 0x88
	nop
	set	0x57, %g3
	ldsb	[%l7 + %g3],	%l0
	set	0x08, %i7
	swapa	[%l7 + %i7] 0x88,	%o7
	ld	[%l7 + 0x14],	%f24
	nop
	set	0x5C, %l5
	swap	[%l7 + %l5],	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%o5
	and	%i2,	%o2,	%l2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f0
	nop
	set	0x40, %o7
	stx	%g6,	[%l7 + %o7]
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x89,	%i7
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x81,	 2
	or	%g2,	%i0,	%g5
	nop
	set	0x18, %l6
	swap	[%l7 + %l6],	%l4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf1
	membar	#Sync
	nop
	set	0x26, %l0
	ldstub	[%l7 + %l0],	%i3
	nop
	set	0x20, %o2
	std	%g6,	[%l7 + %o2]
	bg,a	%xcc,	loop_145
	nop
	set	0x40, %l2
	stw	%g1,	[%l7 + %l2]
	nop
	set	0x20, %i3
	std	%f6,	[%l7 + %i3]
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f14
loop_145:
	nop
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x81,	 1
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x81,	 1
	nop
	set	0x2C, %o6
	ldstub	[%l7 + %o6],	%g4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	nop
	set	0x20, %o0
	lduh	[%l7 + %o0],	%g3
	nop
	set	0x32, %o1
	sth	%i1,	[%l7 + %o1]
	fpadd32s	%f12,	%f1,	%f2
	set	0x59, %o4
	stba	%l5,	[%l7 + %o4] 0x89
	set	0x08, %o5
	ldxa	[%l7 + %o5] 0x89,	%o1
	nop
	set	0x28, %g6
	std	%f30,	[%l7 + %g6]
	set	0x58, %i4
	stda	%i4,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	fpadd16s	%f29,	%f25,	%f29
	nop
	set	0x20, %g1
	sth	%o4,	[%l7 + %g1]
	nop
	set	0x20, %g4
	stx	%l6,	[%l7 + %g4]
	add	%i5,	%l3,	%l0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%l1
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%f16
	nop
	set	0x38, %g3
	std	%f14,	[%l7 + %g3]
	nop
	set	0x34, %o3
	ldsw	[%l7 + %o3],	%o5
	bgu,a	%xcc,	loop_146
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%i2
	nop
	set	0x2C, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x34, %l3
	prefetch	[%l7 + %l3],	 4
loop_146:
	nop
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x81,	%o2
	set	0x24, %g7
	swapa	[%l7 + %g7] 0x80,	%l2
	st	%f29,	[%l7 + 0x7C]
	add	%o7,	%g6,	%i7
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xe2,	%g2
	nop
	set	0x74, %l6
	lduw	[%l7 + %l6],	%i0
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%i6
	bn,a	%xcc,	loop_147
	add	%l4,	%i3,	%g7
	nop
	set	0x48, %l0
	swap	[%l7 + %l0],	%g1
	nop
	set	0x6A, %l2
	sth	%o0,	[%l7 + %l2]
loop_147:
	nop
	set	0x40, %i3
	stx	%g5,	[%l7 + %i3]
	set	0x28, %i2
	sta	%f30,	[%l7 + %i2] 0x81
	nop
	set	0x18, %o2
	stx	%o3,	[%l7 + %o2]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f0
	set	0x34, %l4
	swapa	[%l7 + %l4] 0x89,	%g4
	bgu,a	%xcc,	loop_148
	nop
	set	0x0E, %i1
	ldsh	[%l7 + %i1],	%i1
	nop
	set	0x0E, %o0
	ldsh	[%l7 + %o0],	%g3
	nop
	set	0x70, %o1
	prefetch	[%l7 + %o1],	 1
loop_148:
	nop
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f16
	set	0x44, %o5
	stha	%l5,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe2,	%o0
	nop
	set	0x30, %g6
	sth	%i4,	[%l7 + %g6]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%l3
	set	0x38, %i0
	stxa	%o6,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x27, %g1
	ldstuba	[%l7 + %g1] 0x88,	%l1
	nop
	set	0x28, %i4
	ldstub	[%l7 + %i4],	%o5
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%l0
	nop
	set	0x12, %i5
	ldsb	[%l7 + %i5],	%o2
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f16
	nop
	set	0x10, %g2
	ldsw	[%l7 + %g2],	%l2
	nop
	set	0x52, %o3
	ldsh	[%l7 + %o3],	%i2
	set	0x30, %l5
	lda	[%l7 + %l5] 0x88,	%f31
	nop
	set	0x17, %l3
	ldsb	[%l7 + %l3],	%o7
	set	0x1C, %o7
	stba	%g6,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xda
	set	0x52, %l1
	stba	%g2,	[%l7 + %l1] 0x88
	set	0x30, %g7
	stxa	%i0,	[%l7 + %g7] 0xea
	membar	#Sync
	or	%i7,	%l4,	%i6
	set	0x3B, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i3
	nop
	set	0x77, %l6
	ldstub	[%l7 + %l6],	%g1
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x08, %l2
	stx	%o0,	[%l7 + %l2]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%o3
	nop
	set	0x7C, %i3
	stw	%g4,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f16
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%i1
	fpadd16	%f20,	%f20,	%f10
	nop
	set	0x40, %l4
	std	%f12,	[%l7 + %l4]
	nop
	set	0x22, %i1
	ldstub	[%l7 + %i1],	%g5
	nop
	set	0x6C, %i6
	ldsb	[%l7 + %i6],	%g3
	nop
	set	0x70, %o1
	lduw	[%l7 + %o1],	%l5
	and	%o1,	%l6,	%i4
	nop
	set	0x20, %o4
	std	%o4,	[%l7 + %o4]
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%i4
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%o6
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x80,	 2
	nop
	set	0x18, %o6
	std	%f0,	[%l7 + %o6]
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%l1
	set	0x2C, %i4
	sta	%f4,	[%l7 + %i4] 0x89
	st	%f30,	[%l7 + 0x4C]
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x89,	%l0
	nop
	set	0x08, %g1
	stw	%o5,	[%l7 + %g1]
	nop
	set	0x58, %i5
	stw	%o2,	[%l7 + %i5]
	nop
	set	0x74, %g3
	ldsh	[%l7 + %g3],	%l2
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x80,	 1
	nop
	set	0x74, %g2
	ldsb	[%l7 + %g2],	%g6
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f24
	wr 	%g0, 	0x5, 	%fprs
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB7C, 	%tick_cmpr
	set	0x4C, %o7
	stwa	%i6,	[%l7 + %o7] 0x88
	nop
	set	0x78, %i7
	std	%l4,	[%l7 + %i7]
	set	0x0C, %l1
	stha	%g1,	[%l7 + %l1] 0xeb
	membar	#Sync
	and	%i3,	%o0,	%g7
	nop
	set	0x30, %g7
	std	%f20,	[%l7 + %g7]
	or	%o3,	%g4,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%g5
	nop
	set	0x47, %g5
	ldsb	[%l7 + %g5],	%l5
	set	0x32, %l3
	stha	%o1,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x58, %l6
	stx	%i4,	[%l7 + %l6]
	nop
	set	0x32, %l2
	sth	%l6,	[%l7 + %l2]
	nop
	set	0x78, %l0
	sth	%o4,	[%l7 + %l0]
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	fpadd16s	%f11,	%f2,	%f13
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x81,	%o6
	and	%l3,	%i5,	%l1
	nop
	set	0x30, %l4
	std	%o4,	[%l7 + %l4]
	set	0x1C, %o2
	stha	%l0,	[%l7 + %o2] 0xe3
	membar	#Sync
	and	%l2,	%o7,	%g6
	or	%i2,	%o2,	%i0
	set	0x4C, %i1
	sta	%f6,	[%l7 + %i1] 0x81
	set	0x60, %i6
	stwa	%g2,	[%l7 + %i6] 0xe2
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%l4
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f0
	nop
	set	0x7C, %o4
	swap	[%l7 + %o4],	%g1
	nop
	set	0x70, %o0
	swap	[%l7 + %o0],	%i7
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%o0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%g6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f0
	and	%o3,	%g4,	%i3
	set	0x38, %o6
	stha	%g3,	[%l7 + %o6] 0x80
	nop
	set	0x38, %i4
	ldub	[%l7 + %i4],	%g5
	nop
	set	0x78, %g4
	std	%f10,	[%l7 + %g4]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%i1
	add	%i4,	%o1,	%o4
	fpadd16	%f6,	%f10,	%f20
	wr	%l6,	%l3,	%clear_softint
	nop
	set	0x50, %g1
	stb	%o6,	[%l7 + %g1]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f0
	nop
	set	0x6A, %o3
	ldub	[%l7 + %o3],	%l1
	bgu	%icc,	loop_149
	nop
	set	0x1C, %g2
	stb	%o5,	[%l7 + %g2]
	add	%l0,	%i5,	%l2
	or	%o7,	%g6,	%i2
loop_149:
	nop
	set	0x18, %i5
	stxa	%o2,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x88,	%g2
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x80,	%i6
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%i0
	nop
	set	0x78, %l1
	std	%f30,	[%l7 + %l1]
	nop
	set	0x09, %g5
	ldstub	[%l7 + %g5],	%g1
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x81,	%i7
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x0A, %l2
	ldsh	[%l7 + %l2],	%l4
	set	0x13, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o0
	nop
	set	0x62, %i3
	ldsb	[%l7 + %i3],	%o3
	nop
	set	0x37, %i2
	ldsb	[%l7 + %i2],	%g4
	nop
	set	0x0A, %l6
	ldub	[%l7 + %l6],	%i3
	fpadd32	%f26,	%f18,	%f16
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%g7
	nop
	set	0x10, %l4
	ldsh	[%l7 + %l4],	%g5
	or	%g3,	%i1,	%i4
	set	0x18, %i6
	stxa	%l5,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x58, %i1
	ldstub	[%l7 + %i1],	%o4
	set	0x56, %o4
	stha	%l6,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xf1
	membar	#Sync
	set	0x36, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l3
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x89,	%o6
	add	%o1,	%o5,	%l1
	bn,a,pt	%icc,	loop_150
	nop
	set	0x30, %i0
	ldsw	[%l7 + %i0],	%l0
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x89,	%l2
loop_150:
	st	%fsr,	[%l7 + 0x30]
	fpadd32s	%f18,	%f4,	%f21
	nop
	set	0x18, %i4
	ldsh	[%l7 + %i4],	%i5
	nop
	set	0x44, %o5
	ldsh	[%l7 + %o5],	%g6
	nop
	set	0x1E, %g4
	sth	%i2,	[%l7 + %g4]
	set	0x18, %g1
	stxa	%o7,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x31, %o3
	ldsb	[%l7 + %o3],	%g2
	set	0x12, %g3
	stha	%i6,	[%l7 + %g3] 0x81
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%o2
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%i0
	or	%g1,	%l4,	%o0
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x89,	%o3
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f2
	nop
	set	0x67, %i5
	ldub	[%l7 + %i5],	%g4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xea,	%i6
	st	%f3,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x1C]
	add	%g7,	%i3,	%g3
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%g5
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x72, %l2
	ldub	[%l7 + %l2],	%i1
	nop
	set	0x10, %l3
	std	%i4,	[%l7 + %l3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%l6
	set	0x0E, %l0
	stha	%l5,	[%l7 + %l0] 0x88
	set	0x34, %i2
	sta	%f24,	[%l7 + %i2] 0x88
	fpadd16	%f24,	%f6,	%f30
	set	0x6E, %l6
	stba	%o6,	[%l7 + %l6] 0x88
	wr	%l3,	%o1,	%clear_softint
	nop
	set	0x6C, %o2
	sth	%l1,	[%l7 + %o2]
	nop
	set	0x18, %i3
	lduh	[%l7 + %i3],	%o5
	nop
	set	0x2C, %l4
	ldsh	[%l7 + %l4],	%l2
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%l0
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x89,	%g6
	nop
	set	0x5C, %i6
	ldstub	[%l7 + %i6],	%i2
	nop
	set	0x1C, %o0
	ldsw	[%l7 + %o0],	%o7
	set	0x40, %g6
	prefetcha	[%l7 + %g6] 0x81,	 3
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%i6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%g2
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x81,	%i0
	set	0x18, %o1
	sta	%f17,	[%l7 + %o1] 0x88
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%o0
	set	0x44, %g4
	sta	%f30,	[%l7 + %g4] 0x80
	set	0x18, %o5
	sta	%f24,	[%l7 + %o5] 0x88
	nop
	set	0x42, %o3
	stb	%o3,	[%l7 + %o3]
	nop
	set	0x08, %g1
	stw	%g1,	[%l7 + %g1]
	set	0x78, %g3
	stxa	%g4,	[%l7 + %g3] 0xe2
	membar	#Sync
	ld	[%l7 + 0x58],	%f31
	ld	[%l7 + 0x20],	%f4
	set	0x70, %g2
	stwa	%g7,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x68, %i7
	stx	%i3,	[%l7 + %i7]
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x70, %l5
	stda	%i6,	[%l7 + %l5] 0x88
	set	0x70, %i5
	sta	%f24,	[%l7 + %i5] 0x81
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%i1
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf0
	membar	#Sync
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x46, %l2
	stha	%g5,	[%l7 + %l2] 0xea
	membar	#Sync
	add	%o4,	%i4,	%l6
	set	0x68, %l3
	stxa	%o6,	[%l7 + %l3] 0xe3
	membar	#Sync
	or	%l3,	%o1,	%l1
	set	0x6F, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o5
	or	%l5,	%l2,	%g6
	add	%i2,	%l0,	%i5
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%o7
	set	0x10, %l0
	stxa	%i6,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x4D, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o2
	nop
	set	0x70, %i3
	std	%f10,	[%l7 + %i3]
	or	%g2,	%l4,	%o0
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%i0
	nop
	set	0x1D, %o2
	stb	%g1,	[%l7 + %o2]
	or	%o3,	%g7,	%i3
	nop
	set	0x48, %o4
	std	%i6,	[%l7 + %o4]
	nop
	set	0x6A, %i1
	ldsb	[%l7 + %i1],	%g3
	nop
	set	0x70, %i6
	lduw	[%l7 + %i6],	%i1
	nop
	set	0x18, %o0
	ldsh	[%l7 + %o0],	%g5
	nop
	set	0x48, %g6
	std	%g4,	[%l7 + %g6]
	nop
	set	0x5C, %i0
	ldub	[%l7 + %i0],	%i4
	fpadd16s	%f7,	%f18,	%f10
	set	0x70, %o1
	ldxa	[%l7 + %o1] 0x81,	%l6
	set	0x30, %i4
	stxa	%o6,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x78, %g4
	stw	%o4,	[%l7 + %g4]
	add	%o1,	%l1,	%o5
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f18
	fpsub32s	%f0,	%f21,	%f5
	nop
	set	0x40, %o3
	stx	%fsr,	[%l7 + %o3]
	ld	[%l7 + 0x6C],	%f12
	nop
	set	0x1C, %g1
	ldsw	[%l7 + %g1],	%l5
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x89,	%l2
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%g6
	set	0x40, %i7
	stda	%l2,	[%l7 + %i7] 0x80
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i5
	st	%f24,	[%l7 + 0x38]
	set	0x68, %o7
	stda	%i2,	[%l7 + %o7] 0x88
	nop
	set	0x52, %o5
	ldsh	[%l7 + %o5],	%o7
	nop
	set	0x40, %i5
	ldsw	[%l7 + %i5],	%o2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%g2
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf8
	membar	#Sync
	ld	[%l7 + 0x50],	%f10
	nop
	set	0x68, %g5
	ldsh	[%l7 + %g5],	%l4
	nop
	set	0x78, %g7
	stx	%i0,	[%l7 + %g7]
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x89,	%g1
	nop
	set	0x21, %l3
	ldub	[%l7 + %l3],	%o3
	nop
	set	0x2C, %l1
	stw	%g7,	[%l7 + %l1]
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%o0
	set	0x08, %i2
	stda	%i6,	[%l7 + %i2] 0xeb
	membar	#Sync
	set	0x70, %i3
	ldxa	[%l7 + %i3] 0x89,	%g3
	set	0x20, %l4
	stxa	%i1,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x89,	%i2
	nop
	set	0x58, %o2
	std	%f10,	[%l7 + %o2]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%g4
	nop
	set	0x59, %i1
	stb	%i4,	[%l7 + %i1]
	nop
	set	0x5F, %i6
	ldsb	[%l7 + %i6],	%l6
	nop
	set	0x64, %o0
	lduw	[%l7 + %o0],	%o6
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc0
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x80,	 4
	nop
	set	0x40, %g6
	std	%o4,	[%l7 + %g6]
	set	0x60, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l1
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%o1
	set	0x78, %o6
	stda	%l4,	[%l7 + %o6] 0x88
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	or	%o5,	%g6,	%l3
	nop
	set	0x44, %g1
	stw	%l0,	[%l7 + %g1]
	or	%l2,	%i2,	%i5
	ble,pn	%icc,	loop_151
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%o7
	set	0x4C, %i7
	stwa	%i6,	[%l7 + %i7] 0xea
	membar	#Sync
loop_151:
	fpadd16	%f18,	%f4,	%f30
	and	%o2,	%g2,	%i0
	nop
	set	0x78, %o7
	std	%f22,	[%l7 + %o7]
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x60, %i5
	std	%l4,	[%l7 + %i5]
	set	0x24, %g2
	stwa	%g1,	[%l7 + %g2] 0x80
	nop
	set	0x58, %l5
	stw	%g7,	[%l7 + %l5]
	nop
	set	0x78, %g5
	std	%f20,	[%l7 + %g5]
	fpsub16s	%f29,	%f2,	%f5
	set	0x3E, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o3
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x88,	 3
	set	0x36, %l1
	ldstuba	[%l7 + %l1] 0x81,	%i7
	set	0x24, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i1
	nop
	set	0x1C, %i2
	lduw	[%l7 + %i2],	%i3
	set	0x48, %l2
	stwa	%g3,	[%l7 + %l2] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f16
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd8
	or	%i4,	%g4,	%o6
	nop
	set	0x50, %l6
	stw	%l6,	[%l7 + %l6]
	and	%o4,	%l1,	%o1
	set	0x70, %o2
	sta	%f21,	[%l7 + %o2] 0x80
	nop
	set	0x7E, %i1
	sth	%g5,	[%l7 + %i1]
	set	0x48, %i6
	ldxa	[%l7 + %i6] 0x81,	%l5
	nop
	set	0x51, %o0
	ldub	[%l7 + %o0],	%g6
	nop
	set	0x6D, %i0
	ldub	[%l7 + %i0],	%l3
	nop
	set	0x60, %o1
	ldsw	[%l7 + %o1],	%o5
	nop
	set	0x31, %g6
	stb	%l0,	[%l7 + %g6]
	set	0x48, %o4
	stwa	%l2,	[%l7 + %o4] 0x81
	nop
	set	0x28, %g4
	ldub	[%l7 + %g4],	%i2
	add	%o7,	%i6,	%o2
	nop
	set	0x30, %o6
	ldx	[%l7 + %o6],	%i5
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f2
	nop
	set	0x70, %i4
	ldsw	[%l7 + %i4],	%g2
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%f20
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f16
	nop
	set	0x78, %o5
	stx	%l4,	[%l7 + %o5]
	nop
	set	0x08, %o7
	lduw	[%l7 + %o7],	%g1
	set	0x48, %g2
	stha	%g7,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x28, %l5
	ldxa	[%l7 + %l5] 0x81,	%o0
	set	0x3C, %g5
	stha	%i7,	[%l7 + %g5] 0x88
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc4
	nop
	set	0x52, %l1
	stb	%o3,	[%l7 + %l1]
	set	0x18, %l0
	stxa	%i3,	[%l7 + %l0] 0x81
	nop
	set	0x28, %l3
	std	%f22,	[%l7 + %l3]
	set	0x30, %i2
	stda	%g2,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x78, %l2
	stha	%i4,	[%l7 + %l2] 0x89
	nop
	set	0x28, %l4
	ldsh	[%l7 + %l4],	%i1
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f0
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f16
	nop
	set	0x30, %i6
	std	%o6,	[%l7 + %i6]
	nop
	set	0x78, %o0
	std	%f10,	[%l7 + %o0]
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f18
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g4
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0
	wr	%o1,	%l1,	%clear_softint
	set	0x1C, %g6
	sta	%f11,	[%l7 + %g6] 0x80
	nop
	set	0x18, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x64, %o1
	stwa	%g5,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x14, %o6
	stwa	%l5,	[%l7 + %o6] 0x89
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%l3
	add	%o5,	%l0,	%l2
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x89,	%i2
	nop
	set	0x4F, %i4
	stb	%g6,	[%l7 + %i4]
	or	%o7,	%o2,	%i5
	nop
	set	0x30, %i7
	ldx	[%l7 + %i7],	%i6
	or	%i0,	%g2,	%l4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xda
	nop
	set	0x0D, %g3
	ldstub	[%l7 + %g3],	%g1
	set	0x12, %o5
	stha	%o0,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x38, %o7
	stxa	%g7,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x32, %g2
	ldsh	[%l7 + %g2],	%i7
	nop
	set	0x58, %g5
	stx	%o3,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x3F, %l5
	ldsb	[%l7 + %l5],	%i3
	set	0x34, %i5
	sta	%f9,	[%l7 + %i5] 0x88
	and	%i4,	%i1,	%o6
	nop
	set	0x70, %l1
	stx	%l6,	[%l7 + %l1]
	or	%g3,	%g4,	%o4
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x81,	%o1
	nop
	set	0x30, %g7
	stx	%g5,	[%l7 + %g7]
	nop
	set	0x18, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x53, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l5
	nop
	set	0x0F, %l3
	ldub	[%l7 + %l3],	%l3
	nop
	set	0x56, %l4
	sth	%o5,	[%l7 + %l4]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%l0
	nop
	set	0x58, %i3
	ldx	[%l7 + %i3],	%i2
	nop
	set	0x08, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x70, %l6
	stx	%g6,	[%l7 + %l6]
	nop
	set	0x48, %o0
	prefetch	[%l7 + %o0],	 3
	nop
	set	0x67, %i0
	ldstub	[%l7 + %i0],	%l2
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xca
	nop
	set	0x40, %g6
	std	%o2,	[%l7 + %g6]
	set	0x74, %i6
	swapa	[%l7 + %i6] 0x89,	%o7
	nop
	set	0x3C, %o1
	lduw	[%l7 + %o1],	%i5
	set	0x60, %o6
	stwa	%i6,	[%l7 + %o6] 0x88
	set	0x18, %o4
	stxa	%i0,	[%l7 + %o4] 0x88
	set	0x57, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g2
	set	0x33, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l4
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x81,	%o0
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x17, %g1
	ldsb	[%l7 + %g1],	%g7
	nop
	set	0x5C, %g3
	ldsw	[%l7 + %g3],	%i7
	nop
	set	0x3F, %o5
	ldsb	[%l7 + %o5],	%g1
	st	%fsr,	[%l7 + 0x2C]
	set	0x08, %g2
	stxa	%i3,	[%l7 + %g2] 0x89
	nop
	set	0x4C, %o7
	ldstub	[%l7 + %o7],	%i4
	nop
	set	0x48, %g5
	std	%i0,	[%l7 + %g5]
	st	%f11,	[%l7 + 0x54]
	nop
	set	0x5A, %l5
	ldstub	[%l7 + %l5],	%o6
	set	0x48, %i5
	stxa	%l6,	[%l7 + %i5] 0x88
	nop
	set	0x2F, %l0
	ldstub	[%l7 + %l0],	%o3
	or	%g3,	%o4,	%g4
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	bl,pn	%xcc,	loop_152
	nop
	set	0x48, %i2
	stx	%g5,	[%l7 + %i2]
	wr	%o1,	%l3,	%y
	set	0x60, %l2
	sta	%f24,	[%l7 + %l2] 0x81
loop_152:
	nop
	set	0x14, %g7
	swapa	[%l7 + %g7] 0x89,	%l5
	fpsub16s	%f2,	%f21,	%f8
	nop
	set	0x50, %l3
	std	%f6,	[%l7 + %l3]
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%l1
	nop
	set	0x16, %o2
	ldsh	[%l7 + %o2],	%l0
	wr	%o5,	%g6,	%y
	bgu	%icc,	loop_153
	nop
	nop
	setx	0x749CA5B32E5C875C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEFC1F79C45E0CAAB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f8,	%f0
	set	0x5C, %l4
	lda	[%l7 + %l4] 0x88,	%f7
loop_153:
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%l2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd2
	nop
	set	0x38, %i1
	std	%f20,	[%l7 + %i1]
	set	0x2C, %g6
	stwa	%i2,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x58, %o0
	stx	%o2,	[%l7 + %o0]
	fpadd16	%f6,	%f4,	%f10
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%o6
	or	%i5,	%i0,	%i6
	nop
	set	0x30, %o6
	stx	%g2,	[%l7 + %o6]
	nop
	set	0x5C, %o1
	swap	[%l7 + %o1],	%o0
	add	%g7,	%i7,	%l4
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f16
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%g1
	set	0x48, %i4
	lda	[%l7 + %i4] 0x80,	%f7
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x88,	%i4
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x80,	%o6
	bn,a,pt	%icc,	loop_154
	nop
	set	0x64, %o3
	stb	%l6,	[%l7 + %o3]
	nop
	set	0x2C, %g1
	ldub	[%l7 + %g1],	%o3
	set	0x64, %o5
	sta	%f30,	[%l7 + %o5] 0x89
loop_154:
	nop
	set	0x7C, %g3
	lda	[%l7 + %g3] 0x81,	%f1
	set	0x1E, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g3
	set	0x7C, %g5
	sta	%f14,	[%l7 + %g5] 0x81
	nop
	set	0x5C, %o7
	ldsh	[%l7 + %o7],	%o4
	set	0x28, %i5
	lda	[%l7 + %i5] 0x80,	%f0
	add	%g4,	%g5,	%i1
	nop
	set	0x50, %l5
	ldsb	[%l7 + %l5],	%o1
	set	0x5C, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%g6
	wr	%l2,	%i2,	%y
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%l1
	set	0x64, %l2
	sta	%f25,	[%l7 + %l2] 0x80
	nop
	set	0x6C, %l0
	ldsw	[%l7 + %l0],	%o7
	st	%f20,	[%l7 + 0x10]
	nop
	set	0x48, %g7
	lduw	[%l7 + %g7],	%i5
	nop
	set	0x24, %l3
	ldsh	[%l7 + %l3],	%i0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f0
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x88,	%i6
	nop
	set	0x79, %l6
	ldstub	[%l7 + %l6],	%g2
	set	0x5D, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o2
	st	%fsr,	[%l7 + 0x54]
	set	0x48, %i0
	stwa	%g7,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x78, %g6
	stx	%o0,	[%l7 + %g6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%l4
	nop
	set	0x50, %o0
	prefetch	[%l7 + %o0],	 1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g1
	set	0x60, %i6
	lda	[%l7 + %i6] 0x89,	%f31
	nop
	set	0x7C, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x80,	 3
	nop
	set	0x1F, %i1
	stb	%l6,	[%l7 + %i1]
	nop
	set	0x18, %i4
	std	%f10,	[%l7 + %i4]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xe3,	%o6
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x4C, %o3
	stw	%o3,	[%l7 + %o3]
	nop
	set	0x5E, %i7
	stb	%g3,	[%l7 + %i7]
	set	0x60, %g1
	swapa	[%l7 + %g1] 0x81,	%o4
	nop
	set	0x30, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x32, %g3
	ldsb	[%l7 + %g3],	%g4
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%i1
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%g4
	st	%fsr,	[%l7 + 0x14]
	set	0x20, %i5
	swapa	[%l7 + %i5] 0x88,	%l3
	st	%f7,	[%l7 + 0x68]
	st	%f26,	[%l7 + 0x3C]
	wr	%o1,	%l5,	%clear_softint
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x80,	 0
	set	0x1C, %l1
	stba	%l0,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x50, %g2
	sth	%g6,	[%l7 + %g2]
	fpadd16s	%f4,	%f30,	%f3
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l2
	nop
	nop
	setx	0xD14E2600CA64867B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE1A0F475CAA906EB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f4
	nop
	set	0x62, %i2
	stb	%l1,	[%l7 + %i2]
	nop
	set	0x77, %l0
	ldsb	[%l7 + %l0],	%i2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%i5
	set	0x0F, %l3
	ldstuba	[%l7 + %l3] 0x89,	%i6
	set	0x20, %g7
	ldxa	[%l7 + %g7] 0x89,	%i0
	nop
	set	0x58, %l4
	std	%g2,	[%l7 + %l4]
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%g7
	nop
	set	0x50, %l6
	swap	[%l7 + %l6],	%o2
	st	%f22,	[%l7 + 0x20]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%l4
	add	%i3,	%g1,	%i4
	nop
	set	0x70, %i0
	prefetch	[%l7 + %i0],	 2
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%i6
	set	0x43, %o0
	stba	%o6,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x18, %i6
	stda	%i6,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x6C, %g6
	sth	%g3,	[%l7 + %g6]
	nop
	set	0x2A, %o1
	lduh	[%l7 + %o1],	%o3
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x88,	%g4
	nop
	set	0x08, %i4
	stx	%o4,	[%l7 + %i4]
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x89,	%i1
	st	%f22,	[%l7 + 0x28]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	set	0x08, %o3
	stxa	%l3,	[%l7 + %o3] 0x80
	set	0x78, %i7
	stxa	%o1,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%l5
	nop
	set	0x58, %o4
	std	%o4,	[%l7 + %o4]
	nop
	nop
	setx	0x3038D48C8BC12F4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x16C0DDF09BF6BA7A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f20,	%f24
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f30
	nop
	set	0x14, %o5
	stb	%g5,	[%l7 + %o5]
	nop
	set	0x34, %g5
	stw	%l0,	[%l7 + %g5]
	nop
	set	0x08, %i5
	ldsw	[%l7 + %i5],	%l2
	nop
	set	0x48, %o7
	ldsw	[%l7 + %o7],	%l1
	set	0x26, %l1
	stha	%g6,	[%l7 + %l1] 0x80
	set	0x18, %g2
	stha	%o7,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%i6
	nop
	set	0x40, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x76, %l0
	ldsh	[%l7 + %l0],	%o2
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%i3
	set	0x08, %i2
	stwa	%g1,	[%l7 + %i2] 0xe2
	membar	#Sync
	wr	%o0,	%i4,	%pic
	st	%f28,	[%l7 + 0x30]
	set	0x32, %o2
	stba	%o6,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x1C, %l4
	swap	[%l7 + %l4],	%l6
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%g2
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%g4
	set	0x61, %i0
	stba	%o4,	[%l7 + %i0] 0xe2
	membar	#Sync
	and	%o3,	%l3,	%o1
	set	0x14, %i6
	sta	%f18,	[%l7 + %i6] 0x89
	set	0x0C, %o1
	stha	%l5,	[%l7 + %o1] 0xe2
	membar	#Sync
	set	0x28, %i1
	stxa	%o5,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x47, %i4
	ldub	[%l7 + %i4],	%g5
	nop
	set	0x57, %g4
	ldub	[%l7 + %g4],	%l0
	nop
	set	0x0A, %g6
	ldsb	[%l7 + %g6],	%i1
	nop
	set	0x58, %o6
	lduh	[%l7 + %o6],	%l1
	st	%fsr,	[%l7 + 0x18]
	st	%f8,	[%l7 + 0x1C]
	nop
	set	0x72, %o3
	ldub	[%l7 + %o3],	%l2
	nop
	set	0x10, %g1
	stx	%o7,	[%l7 + %g1]
	set	0x28, %o4
	stxa	%i2,	[%l7 + %o4] 0xe2
	membar	#Sync
	ld	[%l7 + 0x70],	%f14
	nop
	set	0x78, %g3
	std	%g6,	[%l7 + %g3]
	and	%i0,	%g2,	%i5
	set	0x20, %o5
	sta	%f31,	[%l7 + %o5] 0x88
	set	0x17, %g5
	stba	%o2,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x80
	set	0x2E, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i6
	nop
	set	0x30, %i5
	std	%g6,	[%l7 + %i5]
	set	0x60, %l1
	sta	%f7,	[%l7 + %l1] 0x80
	set	0x10, %g2
	swapa	[%l7 + %g2] 0x88,	%i3
	add	%g1,	%l4,	%o0
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe3,	%i4
	fpadd32	%f26,	%f24,	%f18
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%i7
	nop
	set	0x2D, %l0
	ldsb	[%l7 + %l0],	%g3
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%g4
	set	0x68, %l2
	swapa	[%l7 + %l2] 0x88,	%o4
	fpadd32s	%f11,	%f29,	%f10
	fpadd32s	%f25,	%f19,	%f0
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x18, %i2
	std	%f12,	[%l7 + %i2]
	nop
	set	0x08, %o2
	stx	%o1,	[%l7 + %o2]
	nop
	set	0x58, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%o3
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%g5
	nop
	set	0x50, %l4
	std	%f26,	[%l7 + %l4]
	nop
	set	0x59, %o0
	ldub	[%l7 + %o0],	%o5
	nop
	set	0x76, %i3
	ldsh	[%l7 + %i3],	%l0
	nop
	set	0x30, %i6
	prefetch	[%l7 + %i6],	 3
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x80,	%l1
	wr	%i1,	%o7,	%y
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g6
	wr	%i0,	%g2,	%sys_tick
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x81,	%i2
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f28
	fpadd32s	%f24,	%f29,	%f23
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x10, %i4
	std	%f2,	[%l7 + %i4]
	set	0x55, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i5
	nop
	set	0x10, %o3
	lduw	[%l7 + %o3],	%o2
	bl,pn	%icc,	loop_155
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%i6
	nop
	set	0x50, %o4
	lduh	[%l7 + %o4],	%g7
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f8
loop_155:
	nop
	set	0x4B, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i3
	nop
	set	0x08, %o5
	std	%l4,	[%l7 + %o5]
	nop
	set	0x49, %i7
	stb	%g1,	[%l7 + %i7]
	nop
	set	0x68, %g5
	prefetch	[%l7 + %g5],	 3
	fpadd32s	%f25,	%f30,	%f6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%o0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x89,	%f0
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	nop
	set	0x20, %g2
	stx	%i7,	[%l7 + %g2]
	set	0x18, %i5
	lda	[%l7 + %i5] 0x88,	%f30
	nop
	set	0x70, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x1B, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o6
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xe2,	%g4
	set	0x58, %i2
	stha	%g3,	[%l7 + %i2] 0x88
	set	0x10, %l3
	stxa	%o4,	[%l7 + %l3] 0x89
	set	0x3C, %o2
	stwa	%l3,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x6C, %l6
	lda	[%l7 + %l6] 0x89,	%f15
	set	0x38, %g7
	lda	[%l7 + %g7] 0x88,	%f3
	nop
	set	0x40, %o0
	std	%o0,	[%l7 + %o0]
	fpadd16s	%f22,	%f2,	%f24
	set	0x08, %l4
	stwa	%l5,	[%l7 + %l4] 0x80
	wr	%o3,	%l6,	%sys_tick
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x88
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f20
	set	0x08, %i1
	stwa	%g5,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x4E, %i0
	sth	%o5,	[%l7 + %i0]
	nop
	set	0x74, %i3
	stw	%l0,	[%l7 + %i3]
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%i1
	nop
	set	0x20, %o6
	stx	%l1,	[%l7 + %o6]
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%o6
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%g6
	set	0x70, %o3
	stxa	%l2,	[%l7 + %o3] 0xea
	membar	#Sync
	add	%i0,	%i2,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%g2
	nop
	set	0x70, %g3
	stw	%i6,	[%l7 + %g3]
	set	0x30, %o5
	sta	%f11,	[%l7 + %o5] 0x89
	add	%g7,	%l4,	%g1
	nop
	set	0x6A, %g1
	ldsb	[%l7 + %g1],	%i3
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%i4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%o6
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	nop
	set	0x70, %l1
	ldx	[%l7 + %l1],	%o0
	add	%o4,	%l3,	%g3
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x88,	%l4
	nop
	set	0x70, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x5C, %l5
	stwa	%o3,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x40, %g2
	std	%f10,	[%l7 + %g2]
	set	0x10, %l0
	sta	%f4,	[%l7 + %l0] 0x80
	set	0x6F, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l6
	set	0x4C, %l3
	sta	%f3,	[%l7 + %l3] 0x89
	nop
	set	0x28, %i2
	stx	%g5,	[%l7 + %i2]
	nop
	set	0x6A, %l6
	sth	%o5,	[%l7 + %l6]
	nop
	set	0x77, %g7
	ldsb	[%l7 + %g7],	%o1
	bne,a,pn	%xcc,	loop_156
	st	%fsr,	[%l7 + 0x30]
	and	%l0,	%i1,	%o7
	nop
	set	0x3E, %o0
	ldsh	[%l7 + %o0],	%g6
loop_156:
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%l2
	nop
	set	0x64, %i6
	swap	[%l7 + %i6],	%l1
	set	0x17, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i2
	nop
	set	0x6C, %i1
	stw	%i5,	[%l7 + %i1]
	nop
	nop
	setx	0x4DB400E572EFD5FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x2941C2F7336C110A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f20,	%f8
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x08, %i0
	ldub	[%l7 + %i0],	%i0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1248
!	Type a   	: 25
!	Type x   	: 537
!	Type cti   	: 32
!	Type f   	: 49
!	Type i   	: 109
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
	set	0xE,	%g1
	set	0xE,	%g2
	set	0xA,	%g3
	set	0x1,	%g4
	set	0x6,	%g5
	set	0x3,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xA,	%i1
	set	-0xB,	%i2
	set	-0x8,	%i3
	set	-0x6,	%i4
	set	-0x5,	%i5
	set	-0xA,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x70C60CE5,	%l0
	set	0x5F37FD98,	%l1
	set	0x380EE47A,	%l2
	set	0x0E79556D,	%l3
	set	0x2810131B,	%l4
	set	0x05159AE0,	%l5
	set	0x05A5B989,	%l6
	!# Output registers
	set	0x03B7,	%o0
	set	-0x143D,	%o1
	set	0x1D5A,	%o2
	set	-0x02A3,	%o3
	set	0x0D79,	%o4
	set	-0x0CE5,	%o5
	set	0x1535,	%o6
	set	0x1DAD,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	nop
	set	0x4D, %o2
	stb	%g2,	[%l7 + %o2]
	or	%o2,	%g7,	%i6
	nop
	set	0x60, %i4
	sth	%g1,	[%l7 + %i4]
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%l4
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f30
	set	0x30, %g6
	stda	%i4,	[%l7 + %g6] 0x81
	set	0x12, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i7
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xe3,	%o6
	nop
	set	0x28, %o3
	std	%f0,	[%l7 + %o3]
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc2
	nop
	set	0x18, %o5
	std	%f16,	[%l7 + %o5]
	nop
	set	0x7C, %i7
	swap	[%l7 + %i7],	%g4
	bl,pn	%xcc,	loop_157
	nop
	set	0x08, %o7
	std	%f20,	[%l7 + %o7]
	or	%i3,	%o4,	%l3
	set	0x28, %l1
	stwa	%o0,	[%l7 + %l1] 0x81
loop_157:
	nop
	set	0x72, %g1
	ldstub	[%l7 + %g1],	%l5
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x80,	%f0
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x81,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o1
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xeb,	%o4
	nop
	set	0x38, %l0
	stb	%l0,	[%l7 + %l0]
	nop
	set	0x38, %l2
	std	%f8,	[%l7 + %l2]
	nop
	set	0x36, %g2
	sth	%o7,	[%l7 + %g2]
	nop
	set	0x18, %l3
	lduw	[%l7 + %l3],	%i1
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x56, %l6
	sth	%l2,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x38, %g7
	std	%l0,	[%l7 + %g7]
	add	%i2,	%g6,	%i5
	nop
	set	0x43, %o0
	stb	%g2,	[%l7 + %o0]
	nop
	set	0x34, %i2
	prefetch	[%l7 + %i2],	 1
	nop
	set	0x40, %i6
	lduw	[%l7 + %i6],	%i0
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%g7
	nop
	set	0x5E, %o1
	sth	%o2,	[%l7 + %o1]
	nop
	set	0x3A, %i0
	ldsb	[%l7 + %i0],	%i6
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf1
	membar	#Sync
	nop
	set	0x76, %o2
	stb	%g1,	[%l7 + %o2]
	set	0x60, %g4
	stda	%l4,	[%l7 + %g4] 0x81
	nop
	set	0x38, %i4
	ldsh	[%l7 + %i4],	%i4
	and	%i7,	%g4,	%o6
	nop
	set	0x34, %o6
	sth	%o4,	[%l7 + %o6]
	nop
	set	0x64, %g6
	ldsw	[%l7 + %g6],	%l3
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%i3
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x18, %o3
	std	%f24,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x10]
	set	0x58, %g3
	stwa	%o0,	[%l7 + %g3] 0xeb
	membar	#Sync
	add	%l5,	%g3,	%o3
	nop
	set	0x30, %o5
	lduw	[%l7 + %o5],	%l6
	wr	%o1,	%o5,	%y
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f26
	nop
	set	0x44, %o7
	sth	%l0,	[%l7 + %o7]
	nop
	set	0x1C, %l1
	swap	[%l7 + %l1],	%o7
	st	%f5,	[%l7 + 0x68]
	st	%f28,	[%l7 + 0x68]
	set	0x34, %i7
	stwa	%i1,	[%l7 + %i7] 0x81
	nop
	set	0x10, %g5
	ldstub	[%l7 + %g5],	%g5
	and	%l2,	%l1,	%i2
	nop
	set	0x6D, %g1
	ldub	[%l7 + %g1],	%g6
	and	%i5,	%i0,	%g7
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f18
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%i6
	set	0x48, %l5
	sta	%f0,	[%l7 + %l5] 0x81
	nop
	set	0x08, %l2
	ldx	[%l7 + %l2],	%g2
	set	0x3E, %g2
	stha	%l4,	[%l7 + %g2] 0x81
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%i4
	ld	[%l7 + 0x48],	%f30
	nop
	set	0x4E, %l6
	ldub	[%l7 + %l6],	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l3
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x89,	%i2
	nop
	set	0x48, %o0
	std	%f20,	[%l7 + %o0]
	nop
	set	0x28, %l3
	sth	%o0,	[%l7 + %l3]
	nop
	set	0x08, %i2
	ldx	[%l7 + %i2],	%o6
	nop
	set	0x44, %i6
	ldsw	[%l7 + %i6],	%g3
	bn,a	%icc,	loop_158
	nop
	set	0x10, %o1
	ldsh	[%l7 + %o1],	%o3
	set	0x18, %l4
	sta	%f22,	[%l7 + %l4] 0x89
loop_158:
	and	%l6,	%l5,	%o5
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%f22
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe2,	%l0
	nop
	set	0x59, %g4
	ldub	[%l7 + %g4],	%o1
	wr	%i1,	%g5,	%clear_softint
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%o6
	nop
	set	0x58, %o6
	std	%l2,	[%l7 + %o6]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%g6
	nop
	set	0x38, %g6
	std	%f0,	[%l7 + %g6]
	nop
	set	0x3A, %o4
	ldsb	[%l7 + %o4],	%i2
	set	0x4B, %o3
	stba	%i5,	[%l7 + %o3] 0x80
	nop
	set	0x66, %g3
	ldstub	[%l7 + %g3],	%g7
	nop
	set	0x40, %o5
	ldsh	[%l7 + %o5],	%o2
	nop
	set	0x5B, %i3
	stb	%i0,	[%l7 + %i3]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	nop
	set	0x7C, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x78, %i7
	std	%i6,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x20]
	ld	[%l7 + 0x74],	%f6
	nop
	set	0x69, %g5
	stb	%l4,	[%l7 + %g5]
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x89,	%i4
	nop
	set	0x1C, %g1
	ldub	[%l7 + %g1],	%i7
	add	%g4,	%g1,	%g2
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x81,	%o4
	nop
	set	0x70, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x89,	%l2
	nop
	set	0x43, %l0
	ldub	[%l7 + %l0],	%i3
	st	%fsr,	[%l7 + 0x40]
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x81,	%o6
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%o0
	or	%o3,	%g3,	%l5
	bleu,pn	%xcc,	loop_159
	nop
	set	0x6E, %o0
	stb	%o5,	[%l7 + %o0]
	set	0x1C, %l3
	lda	[%l7 + %l3] 0x88,	%f0
loop_159:
	nop
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xeb,	%l0
	set	0x78, %l6
	stda	%o0,	[%l7 + %l6] 0x80
	or	%i1,	%l6,	%o7
	nop
	set	0x38, %i6
	std	%l2,	[%l7 + %i6]
	set	0x5A, %l4
	stha	%l1,	[%l7 + %l4] 0x80
	be,a	%icc,	loop_160
	nop
	set	0x1E, %o1
	sth	%g6,	[%l7 + %o1]
	nop
	set	0x7C, %i0
	ldub	[%l7 + %i0],	%i2
	st	%f10,	[%l7 + 0x4C]
loop_160:
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%g4
	nop
	set	0x7E, %i4
	ldsh	[%l7 + %i4],	%g7
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%o2
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x81,	 1
	nop
	set	0x28, %o6
	ldsb	[%l7 + %o6],	%i6
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f26
	and	%i5,	%i4,	%i7
	set	0x78, %o4
	stda	%l4,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x20, %o5
	stxa	%g4,	[%l7 + %o5] 0x89
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x89,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%g1
	nop
	set	0x48, %o7
	ldx	[%l7 + %o7],	%l3
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x68, %i3
	lduw	[%l7 + %i3],	%o6
	nop
	set	0x4A, %i7
	ldstub	[%l7 + %i7],	%i3
	set	0x79, %l1
	stba	%o0,	[%l7 + %l1] 0x81
	nop
	set	0x1A, %o2
	ldub	[%l7 + %o2],	%o3
	nop
	set	0x64, %g5
	prefetch	[%l7 + %g5],	 4
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%l5
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%g3
	nop
	set	0x4C, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x2E, %l0
	ldsh	[%l7 + %l0],	%o5
	nop
	set	0x50, %g2
	lduh	[%l7 + %g2],	%l0
	set	0x3C, %o0
	stwa	%o1,	[%l7 + %o0] 0x81
	nop
	set	0x48, %g7
	stx	%l6,	[%l7 + %g7]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%l2
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x68, %l6
	std	%f8,	[%l7 + %l6]
	nop
	set	0x08, %l3
	prefetch	[%l7 + %l3],	 1
	bge,a,pt	%icc,	loop_161
	nop
	set	0x6C, %l4
	ldsb	[%l7 + %l4],	%i1
	set	0x08, %o1
	stwa	%g6,	[%l7 + %o1] 0xe3
	membar	#Sync
loop_161:
	nop
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	set	0x40, %i6
	stxa	%g5,	[%l7 + %i6] 0x80
	set	0x50, %i4
	sta	%f28,	[%l7 + %i4] 0x89
	nop
	set	0x4C, %i1
	lduh	[%l7 + %i1],	%i2
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x2A, %g6
	sth	%o2,	[%l7 + %g6]
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xe3,	%i0
	ld	[%l7 + 0x70],	%f19
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%g7
	set	0x44, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i6
	add	%i4,	%i7,	%l4
	set	0x7A, %o5
	stha	%g4,	[%l7 + %o5] 0x81
	set	0x28, %g3
	stda	%i4,	[%l7 + %g3] 0x81
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%g1
	wr	%l3,	%g2,	%pic
	nop
	set	0x24, %i3
	swap	[%l7 + %i3],	%i3
	set	0x6B, %i7
	stba	%o0,	[%l7 + %i7] 0x80
	nop
	set	0x50, %o2
	stw	%o3,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x64]
	set	0x38, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	or	%g3,	%o6,	%o5
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	ld	[%l7 + 0x50],	%f21
	ld	[%l7 + 0x78],	%f22
	nop
	set	0x5C, %i5
	lduw	[%l7 + %i5],	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o7
	or	%l2,	%i1,	%l0
	set	0x14, %l2
	ldstuba	[%l7 + %l2] 0x88,	%l1
	nop
	set	0x52, %g1
	ldsh	[%l7 + %g1],	%g6
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xe2,	%g4
	nop
	set	0x7A, %l5
	ldstub	[%l7 + %l5],	%o2
	nop
	set	0x54, %o0
	sth	%i2,	[%l7 + %o0]
	be	%xcc,	loop_162
	nop
	set	0x70, %g7
	std	%i0,	[%l7 + %g7]
	set	0x30, %g2
	ldda	[%l7 + %g2] 0x80,	%g6
loop_162:
	nop
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xd0
	set	0x6C, %l3
	stha	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x81,	%i4
	nop
	set	0x0C, %l6
	sth	%l4,	[%l7 + %l6]
	nop
	set	0x6A, %i0
	ldsh	[%l7 + %i0],	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o4
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%i7
	nop
	set	0x5F, %i4
	ldstub	[%l7 + %i4],	%g1
	set	0x62, %i1
	stba	%l3,	[%l7 + %i1] 0xe2
	membar	#Sync
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 4
	nop
	set	0x6A, %g6
	sth	%g2,	[%l7 + %g6]
	nop
	set	0x50, %o3
	std	%i2,	[%l7 + %o3]
	set	0x32, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o3
	set	0x1C, %g4
	stwa	%l5,	[%l7 + %g4] 0x89
	nop
	set	0x40, %o6
	std	%o0,	[%l7 + %o6]
	nop
	set	0x08, %o5
	std	%g2,	[%l7 + %o5]
	nop
	set	0x79, %o7
	ldsb	[%l7 + %o7],	%o5
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x89,	 3
	nop
	set	0x10, %i7
	std	%f4,	[%l7 + %i7]
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%i6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f0
	set	0x28, %g5
	lda	[%l7 + %g5] 0x88,	%f23
	nop
	set	0x78, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x10, %i5
	prefetch	[%l7 + %i5],	 1
	set	0x28, %g1
	stxa	%o7,	[%l7 + %g1] 0x88
	set	0x28, %l0
	prefetcha	[%l7 + %l0] 0x88,	 1
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%i1
	set	0x20, %o0
	stda	%o0,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x89,	 2
	set	0x10, %g2
	stxa	%g6,	[%l7 + %g2] 0x80
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%i2
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%i0
	nop
	set	0x22, %l4
	ldsb	[%l7 + %l4],	%g7
	st	%f26,	[%l7 + 0x14]
	set	0x11, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i6
	nop
	set	0x14, %i0
	swap	[%l7 + %i0],	%o2
	nop
	set	0x1D, %o1
	stb	%i4,	[%l7 + %o1]
	set	0x1A, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l4
	nop
	set	0x08, %l3
	ldx	[%l7 + %l3],	%i5
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x81,	 3
	nop
	set	0x30, %i1
	ldub	[%l7 + %i1],	%g4
	set	0x70, %g6
	lda	[%l7 + %g6] 0x80,	%f17
	st	%fsr,	[%l7 + 0x50]
	st	%f26,	[%l7 + 0x7C]
	fpsub16s	%f9,	%f31,	%f17
	nop
	set	0x7C, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x6C, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i7
	nop
	set	0x44, %o6
	ldsw	[%l7 + %o6],	%l3
	nop
	set	0x4F, %o5
	stb	%g2,	[%l7 + %o5]
	or	%i3,	%g1,	%l5
	set	0x6C, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o3
	set	0x18, %g3
	stxa	%g3,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x58, %o3
	stwa	%o0,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	fpadd32	%f8,	%f12,	%f12
	nop
	set	0x7A, %i3
	ldsh	[%l7 + %i3],	%l6
	set	0x48, %g5
	ldxa	[%l7 + %g5] 0x89,	%o7
	set	0x32, %o2
	stba	%l2,	[%l7 + %o2] 0xea
	membar	#Sync
	or	%o6,	%i1,	%o1
	nop
	set	0x58, %i5
	std	%l0,	[%l7 + %i5]
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x80,	%l0
	st	%f10,	[%l7 + 0x14]
	nop
	set	0x10, %g1
	std	%g4,	[%l7 + %g1]
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%i2
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%g6
	set	0x30, %g7
	stda	%g6,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x30, %g2
	stha	%i6,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x26, %l2
	lduh	[%l7 + %l2],	%o2
	nop
	set	0x70, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%i0,	%l4,	%i4
	bne,a,pn	%icc,	loop_163
	nop
	set	0x3C, %i2
	stb	%o4,	[%l7 + %i2]
	set	0x72, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g4
loop_163:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%i5
	wr	%l3,	%i3,	%sys_tick
	set	0x68, %l6
	stda	%g2,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%l4
	nop
	set	0x4D, %o1
	stb	%g1,	[%l7 + %o1]
	set	0x20, %i6
	stxa	%g3,	[%l7 + %i6] 0xe2
	membar	#Sync
	or	%o0,	%o3,	%o5
	set	0x78, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o7
	nop
	set	0x70, %g6
	std	%f10,	[%l7 + %g6]
	nop
	set	0x40, %o4
	lduh	[%l7 + %o4],	%l6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%o6
	add	%o1,	%i1,	%l1
	nop
	set	0x53, %g4
	ldsb	[%l7 + %g4],	%l0
	and	%g5,	%g6,	%g7
	set	0x60, %l3
	stwa	%i2,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%i6
	set	0x48, %o7
	stxa	%o2,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f0
	set	0x74, %o3
	stwa	%i0,	[%l7 + %o3] 0x89
	set	0x4C, %i7
	lda	[%l7 + %i7] 0x89,	%f27
	nop
	set	0x6F, %o5
	ldub	[%l7 + %o5],	%i4
	set	0x0C, %g5
	sta	%f19,	[%l7 + %g5] 0x81
	set	0x24, %o2
	swapa	[%l7 + %o2] 0x80,	%l4
	set	0x38, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	set	0x20, %i3
	ldxa	[%l7 + %i3] 0x89,	%o4
	nop
	set	0x66, %l1
	ldsh	[%l7 + %l1],	%i5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc0
	and	%i7,	%i3,	%g2
	st	%f13,	[%l7 + 0x68]
	set	0x50, %l0
	ldxa	[%l7 + %l0] 0x80,	%l3
	nop
	set	0x48, %g7
	stw	%l5,	[%l7 + %g7]
	nop
	set	0x46, %l5
	lduh	[%l7 + %l5],	%g1
	nop
	set	0x40, %l2
	ldsw	[%l7 + %l2],	%g3
	set	0x40, %g2
	stxa	%o0,	[%l7 + %g2] 0x81
	set	0x64, %l4
	stwa	%o5,	[%l7 + %l4] 0x81
	add	%o3,	%l6,	%o7
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f20
	nop
	set	0x14, %i0
	stb	%o6,	[%l7 + %i0]
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%l2
	nop
	set	0x5A, %o0
	lduh	[%l7 + %o0],	%i1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f0
	nop
	set	0x77, %i6
	stb	%l1,	[%l7 + %i6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%o1
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x71, %g6
	stb	%g5,	[%l7 + %g6]
	nop
	set	0x0A, %o4
	ldub	[%l7 + %o4],	%g7
	nop
	set	0x08, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x40, %i4
	stw	%g6,	[%l7 + %i4]
	nop
	set	0x18, %l3
	stx	%i2,	[%l7 + %l3]
	set	0x6C, %o6
	lda	[%l7 + %o6] 0x80,	%f17
	nop
	set	0x40, %o7
	swap	[%l7 + %o7],	%o2
	nop
	set	0x3C, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%i0
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%f0
	set	0x08, %o2
	stwa	%i4,	[%l7 + %o2] 0x88
	bge,a,pn	%icc,	loop_164
	nop
	set	0x40, %i5
	stx	%i6,	[%l7 + %i5]
	set	0x30, %g5
	stda	%g4,	[%l7 + %g5] 0x88
loop_164:
	nop
	set	0x74, %i3
	stw	%o4,	[%l7 + %i3]
	and	%i5,	%l4,	%i7
	set	0x48, %g1
	swapa	[%l7 + %g1] 0x89,	%g2
	st	%fsr,	[%l7 + 0x18]
	ld	[%l7 + 0x20],	%f19
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%l5
	add	%g1,	%l3,	%g3
	set	0x54, %l1
	stwa	%o0,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x20, %g7
	ldxa	[%l7 + %g7] 0x80,	%o3
	and	%l6,	%o5,	%o6
	set	0x51, %l5
	stba	%o7,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x1C, %l2
	swap	[%l7 + %l2],	%l2
	fpadd32	%f18,	%f10,	%f8
	nop
	set	0x10, %g2
	stx	%i1,	[%l7 + %g2]
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x89,	%l0
	set	0x40, %i2
	stda	%l0,	[%l7 + %i2] 0x81
	set	0x4F, %i0
	stba	%o1,	[%l7 + %i0] 0x88
	fpadd32	%f4,	%f22,	%f28
	set	0x60, %l4
	lda	[%l7 + %l4] 0x88,	%f2
	set	0x78, %l6
	ldxa	[%l7 + %l6] 0x88,	%g5
	set	0x08, %o0
	stda	%g6,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x50, %i6
	stb	%g6,	[%l7 + %i6]
	nop
	set	0x10, %i1
	ldsw	[%l7 + %i1],	%o2
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%i2
	set	0x26, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i0
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%i6
	set	0x1E, %g6
	stba	%i4,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x31, %l3
	ldsb	[%l7 + %l3],	%o4
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x4B, %o6
	ldstub	[%l7 + %o6],	%i5
	wr	%l4,	%g4,	%set_softint
	set	0x58, %g3
	sta	%f13,	[%l7 + %g3] 0x89
	set	0x77, %o7
	stba	%g2,	[%l7 + %o7] 0x81
	nop
	set	0x54, %i7
	ldsw	[%l7 + %i7],	%i7
	set	0x60, %o3
	stha	%l5,	[%l7 + %o3] 0x81
	nop
	set	0x12, %o2
	ldstub	[%l7 + %o2],	%g1
	nop
	set	0x38, %o5
	stx	%l3,	[%l7 + %o5]
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%i2
	set	0x20, %i5
	lda	[%l7 + %i5] 0x81,	%f24
	nop
	set	0x2B, %i3
	stb	%g3,	[%l7 + %i3]
	fpadd16	%f20,	%f8,	%f26
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%o0
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x88,	%o6
	nop
	set	0x08, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x10, %g7
	ldda	[%l7 + %g7] 0xe3,	%o6
	nop
	set	0x68, %l2
	swap	[%l7 + %l2],	%i1
	nop
	set	0x50, %l5
	ldub	[%l7 + %l5],	%l0
	ld	[%l7 + 0x50],	%f0
	fpsub16	%f0,	%f12,	%f28
	nop
	set	0x5C, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	and	%o1,	%g5,	%l2
	set	0x40, %g2
	stxa	%g6,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x6C, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o2
	nop
	set	0x46, %l6
	lduh	[%l7 + %l6],	%g7
	wr	%i0,	%i2,	%softint
	nop
	set	0x42, %o0
	lduh	[%l7 + %o0],	%i6
	set	0x38, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%l4
	set	0x3C, %i1
	stwa	%g4,	[%l7 + %i1] 0x89
	set	0x38, %i6
	swapa	[%l7 + %i6] 0x81,	%g2
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%o4
	nop
	set	0x7C, %o1
	ldsw	[%l7 + %o1],	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAF9, 	%tick_cmpr
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%l6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f0
	nop
	set	0x44, %l3
	ldsh	[%l7 + %l3],	%i3
	nop
	set	0x18, %i4
	std	%o4,	[%l7 + %i4]
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%o0
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x3C, %o7
	sta	%f12,	[%l7 + %o7] 0x80
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%o6
	nop
	set	0x20, %g3
	stx	%i1,	[%l7 + %g3]
	nop
	set	0x7A, %o3
	ldsb	[%l7 + %o3],	%l0
	nop
	set	0x1E, %o5
	lduh	[%l7 + %o5],	%o6
	nop
	set	0x48, %o2
	ldx	[%l7 + %o2],	%o1
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x80,	%g5
	nop
	set	0x34, %i5
	stw	%l2,	[%l7 + %i5]
	nop
	set	0x2A, %l1
	sth	%g6,	[%l7 + %l1]
	nop
	set	0x0C, %g1
	swap	[%l7 + %g1],	%l1
	set	0x2C, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g7
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x50, %l2
	stw	%i0,	[%l7 + %l2]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%o2
	ld	[%l7 + 0x20],	%f16
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x1E, %l5
	sth	%i4,	[%l7 + %l5]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc4
	ld	[%l7 + 0x44],	%f26
	nop
	set	0x32, %i3
	lduh	[%l7 + %i3],	%i5
	add	%i6,	%g4,	%g2
	nop
	set	0x6C, %i2
	ldub	[%l7 + %i2],	%l4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%o4
	set	0x7C, %g2
	stwa	%g1,	[%l7 + %g2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x70],	%f5
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%l5
	nop
	set	0x7C, %l6
	swap	[%l7 + %l6],	%g3
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x88,	%l2
	nop
	set	0x38, %i1
	std	%o2,	[%l7 + %i1]
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf9
	membar	#Sync
	nop
	set	0x58, %i6
	stx	%i3,	[%l7 + %i6]
	or	%l6,	%o0,	%o5
	nop
	set	0x54, %o1
	stw	%i1,	[%l7 + %o1]
	nop
	set	0x18, %g6
	sth	%o7,	[%l7 + %g6]
	or	%o6,	%l0,	%g5
	or	%o1,	%l2,	%g6
	set	0x2C, %o4
	sta	%f2,	[%l7 + %o4] 0x81
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xeb,	%g6
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x81,	%i0
	nop
	set	0x34, %g4
	ldub	[%l7 + %g4],	%l1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%i4
	add	%i2,	%i5,	%g4
	set	0x54, %l3
	swapa	[%l7 + %l3] 0x81,	%g2
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%i6
	nop
	set	0x08, %i7
	stw	%l4,	[%l7 + %i7]
	nop
	set	0x3C, %o3
	sth	%i7,	[%l7 + %o3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%l5
	st	%f21,	[%l7 + 0x34]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x34, %g3
	sth	%o3,	[%l7 + %g3]
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x88,	 3
	set	0x30, %g5
	stda	%i6,	[%l7 + %g5] 0x81
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f16
	nop
	set	0x60, %l1
	std	%f10,	[%l7 + %l1]
	nop
	set	0x20, %o5
	prefetch	[%l7 + %o5],	 3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%o5
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x88,	 1
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%o6
	set	0x78, %l2
	stda	%o6,	[%l7 + %l2] 0x80
	and	%l0,	%g5,	%i1
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%i0
	set	0x28, %l5
	stxa	%l1,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%o2
	ld	[%l7 + 0x24],	%f26
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i2
	nop
	set	0x7C, %i2
	prefetch	[%l7 + %i2],	 1
	nop
	set	0x31, %g2
	stb	%i5,	[%l7 + %g2]
	fpsub16s	%f28,	%f29,	%f3
	set	0x52, %i3
	stba	%g6,	[%l7 + %i3] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f0
	nop
	set	0x0E, %i0
	ldsh	[%l7 + %i0],	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%l4
	nop
	set	0x4C, %i1
	lduw	[%l7 + %i1],	%i7
	set	0x40, %l4
	stda	%g4,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x5D, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o4
	nop
	set	0x20, %i6
	std	%f16,	[%l7 + %i6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%l3
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%o3
	nop
	set	0x60, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f14
	nop
	set	0x20, %o6
	std	%f12,	[%l7 + %o6]
	set	0x58, %g4
	ldxa	[%l7 + %g4] 0x89,	%g1
	nop
	set	0x56, %l3
	sth	%l6,	[%l7 + %l3]
	add	%o0,	%o5,	%l5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i3,	%o6
	nop
	set	0x47, %o1
	stb	%l0,	[%l7 + %o1]
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f18
	set	0x68, %i7
	stwa	%g5,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc0
	nop
	set	0x28, %o2
	std	%f12,	[%l7 + %o2]
	nop
	set	0x4E, %g5
	lduh	[%l7 + %g5],	%i1
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	ld	[%l7 + 0x48],	%f12
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x38, %o3
	stda	%o0,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xeb,	%l2
	nop
	set	0x74, %g7
	prefetch	[%l7 + %g7],	 4
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x78, %o5
	ldsw	[%l7 + %o5],	%o2
	nop
	set	0x33, %l5
	ldstub	[%l7 + %l5],	%i0
	nop
	set	0x76, %l2
	sth	%i4,	[%l7 + %l2]
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%i5
	set	0x18, %i2
	swapa	[%l7 + %i2] 0x81,	%g6
	set	0x34, %g2
	stwa	%i2,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	bgu,pn	%icc,	loop_165
	nop
	set	0x4F, %l6
	ldstub	[%l7 + %l6],	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g4
loop_165:
	nop
	set	0x28, %i0
	ldstub	[%l7 + %i0],	%o4
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%l3
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x81,	 1
	nop
	set	0x68, %l4
	sth	%g1,	[%l7 + %l4]
	nop
	set	0x30, %i6
	std	%o2,	[%l7 + %i6]
	nop
	set	0x1C, %g6
	swap	[%l7 + %g6],	%l6
	nop
	set	0x70, %o4
	std	%o4,	[%l7 + %o4]
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%o0
	set	0x48, %o6
	swapa	[%l7 + %o6] 0x89,	%l5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%l0
	nop
	set	0x46, %o0
	lduh	[%l7 + %o0],	%i1
	nop
	set	0x5E, %g4
	ldstub	[%l7 + %g4],	%o1
	set	0x70, %l3
	lda	[%l7 + %l3] 0x80,	%f13
	set	0x08, %o1
	stda	%o6,	[%l7 + %o1] 0x89
	fpadd16	%f24,	%f12,	%f26
	bgu	%icc,	loop_166
	or	%g7,	%l2,	%o2
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xeb,	%i0
loop_166:
	nop
	set	0x56, %o7
	stba	%l1,	[%l7 + %o7] 0xe2
	membar	#Sync
	and	%i5,	%i4,	%g6
	nop
	set	0x24, %g3
	swap	[%l7 + %g3],	%g2
	nop
	nop
	setx	0x5E9389C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xA7650DE4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f16,	%f0
	nop
	set	0x70, %o2
	sth	%i2,	[%l7 + %o2]
	and	%l4,	%g4,	%o4
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%g3
	set	0x58, %l1
	stda	%l2,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x44, %g5
	stwa	%i7,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x5A, %o3
	stba	%i6,	[%l7 + %o3] 0x88
	nop
	set	0x48, %g7
	lduh	[%l7 + %g7],	%o3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f16
	wr	%g1,	%o5,	%sys_tick
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%l6
	and	%o6,	%l5,	%i3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%l0
	set	0x10, %l5
	lda	[%l7 + %l5] 0x81,	%f8
	ld	[%l7 + 0x24],	%f13
	set	0x3D, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o1
	nop
	set	0x50, %l0
	lduw	[%l7 + %l0],	%i1
	nop
	set	0x22, %l2
	lduh	[%l7 + %l2],	%g7
	nop
	set	0x40, %i2
	std	%f24,	[%l7 + %i2]
	nop
	set	0x24, %i3
	sth	%l2,	[%l7 + %i3]
	nop
	set	0x60, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x69, %i0
	stb	%o7,	[%l7 + %i0]
	set	0x7C, %i1
	stha	%o2,	[%l7 + %i1] 0x88
	nop
	set	0x18, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x46, %g6
	ldsb	[%l7 + %g6],	%i0
	nop
	set	0x20, %l4
	std	%l0,	[%l7 + %l4]
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x88,	%i4
	st	%f8,	[%l7 + 0x28]
	nop
	set	0x0E, %o6
	ldsb	[%l7 + %o6],	%g6
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x89,	%g2
	set	0x40, %o0
	stda	%i2,	[%l7 + %o0] 0xeb
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%g4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe2,	%i4
	nop
	set	0x20, %o1
	sth	%o4,	[%l7 + %o1]
	set	0x3E, %i7
	stha	%l3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x44, %o7
	ldsw	[%l7 + %o7],	%i7
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x42, %o2
	lduh	[%l7 + %o2],	%i6
	wr	%o3,	%o5,	%y
	nop
	set	0x15, %i5
	ldub	[%l7 + %i5],	%o0
	set	0x66, %g4
	ldstuba	[%l7 + %g4] 0x89,	%l6
	nop
	set	0x10, %g5
	sth	%o6,	[%l7 + %g5]
	and	%l5,	%g1,	%g5
	nop
	set	0x5E, %l1
	sth	%i3,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x589, 	%sys_tick_cmpr
	nop
	set	0x2E, %o3
	lduh	[%l7 + %o3],	%g7
	set	0x73, %g7
	stba	%i1,	[%l7 + %g7] 0x88
	or	%o7,	%l2,	%i0
	nop
	set	0x18, %g1
	stx	%o2,	[%l7 + %g1]
	nop
	set	0x74, %l5
	stw	%i4,	[%l7 + %l5]
	set	0x18, %l0
	stda	%g6,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x4C, %l2
	stw	%l1,	[%l7 + %l2]
	nop
	set	0x53, %o5
	stb	%g2,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	set	0x40, %g2
	stda	%i2,	[%l7 + %g2] 0x80
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x89,	%l4
	st	%f18,	[%l7 + 0x24]
	set	0x3C, %i2
	stha	%g4,	[%l7 + %i2] 0x80
	nop
	set	0x68, %i0
	swap	[%l7 + %i0],	%i5
	nop
	set	0x18, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%o4,	%l3,	%i7
	set	0x58, %g6
	swapa	[%l7 + %g6] 0x80,	%i6
	be	%xcc,	loop_167
	nop
	set	0x18, %i4
	lduw	[%l7 + %i4],	%g3
	or	%o5,	%o3,	%l6
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%o0
loop_167:
	nop
	set	0x5C, %o4
	stw	%l5,	[%l7 + %o4]
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%o6
	fpadd32s	%f3,	%f28,	%f31
	nop
	set	0x77, %l3
	ldub	[%l7 + %l3],	%g1
	nop
	set	0x43, %o1
	ldstub	[%l7 + %o1],	%g5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o1
	nop
	set	0x44, %i7
	lduw	[%l7 + %i7],	%g7
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	set	0x50, %g3
	stxa	%l0,	[%l7 + %g3] 0x81
	nop
	set	0x59, %o2
	ldub	[%l7 + %o2],	%o7
	bne	%xcc,	loop_168
	fpsub16s	%f13,	%f17,	%f0
	set	0x0C, %i5
	swapa	[%l7 + %i5] 0x88,	%l2
loop_168:
	nop
	set	0x78, %o7
	stwa	%i1,	[%l7 + %o7] 0xeb
	membar	#Sync
	or	%o2,	%i4,	%g6
	set	0x4A, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l1
	or	%g2,	%i0,	%i2
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x80,	%l4
	set	0x14, %l1
	lda	[%l7 + %l1] 0x89,	%f31
	bl,pt	%icc,	loop_169
	nop
	set	0x20, %g7
	stx	%g4,	[%l7 + %g7]
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%o4
	nop
	set	0x78, %l5
	std	%i4,	[%l7 + %l5]
loop_169:
	ld	[%l7 + 0x78],	%f17
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x88,	%i7
	set	0x08, %l2
	ldstuba	[%l7 + %l2] 0x88,	%i6
	nop
	set	0x22, %o5
	stb	%l3,	[%l7 + %o5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%g3
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%o3
	nop
	set	0x18, %g2
	stx	%l6,	[%l7 + %g2]
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xe2,	%o0
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x14, %i2
	stw	%l5,	[%l7 + %i2]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	nop
	set	0x44, %i6
	ldsw	[%l7 + %i6],	%g1
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd8
	nop
	set	0x14, %i4
	ldsw	[%l7 + %i4],	%g5
	nop
	set	0x60, %g6
	std	%o6,	[%l7 + %g6]
	set	0x58, %l4
	ldstuba	[%l7 + %l4] 0x80,	%i3
	add	%g7,	%o1,	%l0
	nop
	set	0x34, %o6
	stb	%l2,	[%l7 + %o6]
	nop
	set	0x5A, %l3
	ldsb	[%l7 + %l3],	%i1
	nop
	set	0x28, %o1
	swap	[%l7 + %o1],	%o2
	nop
	set	0x0E, %i7
	sth	%o7,	[%l7 + %i7]
	set	0x10, %o4
	stda	%i4,	[%l7 + %o4] 0x88
	st	%f8,	[%l7 + 0x70]
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x89,	%l1
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xe2,	%g2
	ld	[%l7 + 0x08],	%f18
	nop
	set	0x74, %o2
	stw	%i0,	[%l7 + %o2]
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%g6
	set	0x17, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l4
	set	0x08, %o7
	lda	[%l7 + %o7] 0x81,	%f11
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc8
	nop
	set	0x6F, %g7
	stb	%i2,	[%l7 + %g7]
	ld	[%l7 + 0x40],	%f1
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f22
	ld	[%l7 + 0x6C],	%f1
	wr	%g4,	%o4,	%y
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%i7
	ld	[%l7 + 0x44],	%f17
	set	0x73, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i5
	nop
	set	0x50, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x40, %g1
	std	%i6,	[%l7 + %g1]
	nop
	set	0x48, %o5
	stx	%l3,	[%l7 + %o5]
	add	%g3,	%o3,	%l6
	nop
	set	0x30, %i3
	ldsh	[%l7 + %i3],	%o0
	nop
	set	0x60, %g2
	stx	%o5,	[%l7 + %g2]
	set	0x34, %l6
	sta	%f18,	[%l7 + %l6] 0x88
	nop
	set	0x78, %i2
	lduw	[%l7 + %i2],	%g1
	set	0x08, %i6
	stda	%g4,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x78, %i1
	std	%f16,	[%l7 + %i1]
	nop
	set	0x44, %i0
	stw	%o6,	[%l7 + %i0]
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f24
	nop
	set	0x78, %l4
	ldsh	[%l7 + %l4],	%i3
	bne,a	%xcc,	loop_170
	bgu,a,pt	%xcc,	loop_171
	add	%l5,	%o1,	%g7
	set	0x4F, %o6
	stba	%l0,	[%l7 + %o6] 0x80
loop_170:
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
loop_171:
	nop
	set	0x40, %g6
	stda	%l2,	[%l7 + %g6] 0x80
	set	0x6C, %i7
	sta	%f7,	[%l7 + %i7] 0x80
	set	0x2E, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o2
	nop
	set	0x3A, %o4
	ldsh	[%l7 + %o4],	%o7
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%i1
	nop
	set	0x2A, %o0
	lduh	[%l7 + %o0],	%l1
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf1
	membar	#Sync
	set	0x60, %o2
	stda	%g2,	[%l7 + %o2] 0x81
	ld	[%l7 + 0x14],	%f5
	nop
	set	0x34, %o7
	ldstub	[%l7 + %o7],	%i0
	nop
	set	0x20, %g4
	ldub	[%l7 + %g4],	%g6
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	st	%f14,	[%l7 + 0x30]
	nop
	set	0x7E, %o3
	lduh	[%l7 + %o3],	%l4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf8
	membar	#Sync
	set	0x38, %l1
	stda	%i4,	[%l7 + %l1] 0x81
	nop
	set	0x4A, %l5
	lduh	[%l7 + %l5],	%i2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf8,	%f0
	bne,a,pt	%icc,	loop_172
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%g4
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%i6
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%i5
loop_172:
	nop
	set	0x78, %i3
	stda	%o4,	[%l7 + %i3] 0x81
	set	0x18, %g2
	stxa	%l3,	[%l7 + %g2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	set	0x10, %l6
	sta	%f5,	[%l7 + %l6] 0x81
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%o3
	nop
	set	0x18, %i2
	std	%f4,	[%l7 + %i2]
	nop
	set	0x1F, %i6
	ldstub	[%l7 + %i6],	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%o5
	set	0x1C, %i0
	sta	%f31,	[%l7 + %i0] 0x88
	nop
	set	0x48, %i1
	std	%f14,	[%l7 + %i1]
	ld	[%l7 + 0x34],	%f1
	nop
	set	0x78, %i4
	std	%g0,	[%l7 + %i4]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f16
	nop
	set	0x3F, %l3
	stb	%g5,	[%l7 + %l3]
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x81,	%o0
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f10
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%i3
	set	0x38, %o6
	stwa	%l5,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x24, %o4
	ldsh	[%l7 + %o4],	%o1
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x6D, %o0
	stb	%l0,	[%l7 + %o0]
	nop
	set	0x65, %i5
	ldstub	[%l7 + %i5],	%g7
	nop
	set	0x1C, %o2
	sth	%l2,	[%l7 + %o2]
	set	0x10, %o7
	ldxa	[%l7 + %o7] 0x88,	%o2
	and	%i1,	%l1,	%o7
	fpsub32	%f22,	%f26,	%f10
	wr	%i0,	%g2,	%pic
	set	0x60, %g3
	stxa	%g6,	[%l7 + %g3] 0x80
	set	0x40, %g4
	stba	%i4,	[%l7 + %g4] 0x89
	set	0x3F, %g5
	stba	%l4,	[%l7 + %g5] 0x88
	nop
	set	0x58, %g7
	ldsw	[%l7 + %g7],	%i2
	nop
	set	0x37, %l1
	ldstub	[%l7 + %l1],	%i7
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%g4
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0
	nop
	set	0x30, %l5
	lduw	[%l7 + %l5],	%l3
	nop
	set	0x10, %o5
	stx	%o4,	[%l7 + %o5]
	set	0x2F, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g3
	and	%i6,	%l6,	%o5
	nop
	set	0x4C, %i3
	ldsw	[%l7 + %i3],	%g1
	set	0x48, %l0
	stwa	%o3,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f16
	nop
	set	0x48, %g2
	stw	%g5,	[%l7 + %g2]
	set	0x70, %i6
	stxa	%o6,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x52, %i0
	ldstub	[%l7 + %i0],	%i3
	nop
	set	0x60, %i2
	ldsh	[%l7 + %i2],	%o0
	nop
	set	0x7F, %i1
	ldstub	[%l7 + %i1],	%o1
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x53, %l3
	ldsb	[%l7 + %l3],	%l0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%l2
	nop
	set	0x74, %i4
	prefetch	[%l7 + %i4],	 3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%g7
	nop
	set	0x1C, %g6
	stw	%l1,	[%l7 + %g6]
	set	0x5C, %i7
	stba	%i1,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x08, %o4
	stda	%o6,	[%l7 + %o4] 0x81
	fpsub16s	%f7,	%f31,	%f16
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%g6
	nop
	set	0x0A, %o6
	sth	%i0,	[%l7 + %o6]
	nop
	set	0x78, %o0
	ldsw	[%l7 + %o0],	%l4
	st	%f14,	[%l7 + 0x24]
	nop
	set	0x38, %i5
	stx	%i2,	[%l7 + %i5]
	set	0x4C, %o2
	sta	%f22,	[%l7 + %o2] 0x81
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf9
	membar	#Sync
	set	0x08, %o1
	sta	%f29,	[%l7 + %o1] 0x81
	nop
	set	0x78, %g4
	swap	[%l7 + %g4],	%i4
	set	0x54, %g3
	stwa	%i7,	[%l7 + %g3] 0x81
	set	0x6E, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i5
	and	%l3,	%g4,	%g3
	set	0x26, %l1
	ldstuba	[%l7 + %l1] 0x81,	%i6
	set	0x08, %g7
	swapa	[%l7 + %g7] 0x89,	%o4
	nop
	set	0x16, %l2
	ldstub	[%l7 + %l2],	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%o3
	set	0x60, %l5
	swapa	[%l7 + %l5] 0x80,	%g1
	add	%o6,	%g5,	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%l0
	set	0x5C, %o5
	lda	[%l7 + %o5] 0x89,	%f12
	nop
	set	0x5A, %g1
	ldstub	[%l7 + %g1],	%i3
	st	%f26,	[%l7 + 0x28]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%o2
	add	%g7,	%l2,	%l1
	nop
	set	0x79, %i3
	ldsb	[%l7 + %i3],	%o7
	nop
	set	0x50, %o3
	ldsw	[%l7 + %o3],	%g2
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x80,	 1
	nop
	set	0x6E, %g2
	ldstub	[%l7 + %g2],	%i1
	set	0x58, %l0
	sta	%f26,	[%l7 + %l0] 0x80
	set	0x18, %i0
	stxa	%i0,	[%l7 + %i0] 0x88
	nop
	set	0x32, %i2
	sth	%i2,	[%l7 + %i2]
	nop
	set	0x38, %i1
	std	%i4,	[%l7 + %i1]
	nop
	set	0x28, %i6
	lduh	[%l7 + %i6],	%l4
	set	0x4C, %l4
	stha	%i5,	[%l7 + %l4] 0x80
	set	0x58, %i4
	stwa	%i7,	[%l7 + %i4] 0x80
	set	0x50, %g6
	stxa	%g4,	[%l7 + %g6] 0x89
	set	0x24, %i7
	stha	%l3,	[%l7 + %i7] 0x81
	st	%f20,	[%l7 + 0x58]
	set	0x2E, %o4
	stba	%i6,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x0C, %l3
	stwa	%g3,	[%l7 + %l3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x34, %o0
	ldub	[%l7 + %o0],	%o4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f14
	nop
	set	0x78, %o1
	stx	%o5,	[%l7 + %o1]
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%o2
	ld	[%l7 + 0x5C],	%f21
	nop
	set	0x70, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x58, %g3
	lda	[%l7 + %g3] 0x80,	%f31
	set	0x60, %g5
	stxa	%g1,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%o6
	nop
	set	0x18, %g7
	stw	%g5,	[%l7 + %g7]
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x80,	%l6
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%o1
	nop
	set	0x78, %i3
	std	%l0,	[%l7 + %i3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l5
	set	0x78, %o3
	stxa	%o2,	[%l7 + %o3] 0x80
	set	0x5C, %o5
	sta	%f20,	[%l7 + %o5] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%g7
	nop
	set	0x68, %l6
	std	%l0,	[%l7 + %l6]
	nop
	set	0x10, %l0
	ldsw	[%l7 + %l0],	%l2
	st	%f11,	[%l7 + 0x54]
	set	0x34, %g2
	sta	%f16,	[%l7 + %g2] 0x89
	nop
	set	0x22, %i0
	ldstub	[%l7 + %i0],	%g2
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f6
	set	0x0C, %i6
	lda	[%l7 + %i6] 0x89,	%f9
	nop
	set	0x53, %l4
	ldsb	[%l7 + %l4],	%g6
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f10
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%o7
	set	0x4C, %g6
	sta	%f7,	[%l7 + %g6] 0x81
	set	0x2E, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%i4
	nop
	set	0x54, %o4
	ldstub	[%l7 + %o4],	%l4
	nop
	set	0x60, %l3
	stx	%i5,	[%l7 + %l3]
	nop
	set	0x42, %o6
	ldsb	[%l7 + %o6],	%i7
	nop
	set	0x2C, %o0
	ldsh	[%l7 + %o0],	%i2
	nop
	set	0x78, %i5
	stx	%g4,	[%l7 + %i5]
	bl,a,pn	%icc,	loop_173
	add	%i6,	%l3,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g3,	%o3
loop_173:
	nop
	set	0x20, %o1
	stwa	%o5,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x67, %o7
	ldub	[%l7 + %o7],	%o6
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x89,	%g1
	set	0x68, %o2
	lda	[%l7 + %o2] 0x81,	%f4
	nop
	set	0x6A, %g5
	stb	%l6,	[%l7 + %g5]
	nop
	set	0x48, %l1
	swap	[%l7 + %l1],	%o1
	nop
	set	0x78, %g3
	stx	%l0,	[%l7 + %g3]
	nop
	nop
	setx	0xF9EE632B99161515,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB97946E0C71F0FBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f22,	%f8
	fpsub16s	%f22,	%f12,	%f6
	nop
	set	0x34, %g7
	ldsh	[%l7 + %g7],	%g5
	nop
	set	0x0D, %l2
	ldsb	[%l7 + %l2],	%l5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%o2
	set	0x20, %l5
	stha	%g7,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x88,	%l0
	and	%i3,	%g2,	%g6
	nop
	set	0x28, %i3
	stw	%o7,	[%l7 + %i3]
	and	%i0,	%l2,	%i4
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x80,	%f16
	set	0x18, %l6
	stwa	%l4,	[%l7 + %l6] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f16
	set	0x52, %g2
	stha	%i1,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x20, %o5
	stx	%i7,	[%l7 + %o5]
	fpsub32	%f16,	%f6,	%f8
	be,pt	%xcc,	loop_174
	add	%i2,	%i5,	%i6
	nop
	set	0x21, %i0
	ldstub	[%l7 + %i0],	%l3
	or	%g4,	%o4,	%g3
loop_174:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%o6
	nop
	set	0x20, %i1
	stx	%o5,	[%l7 + %i1]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf1
	membar	#Sync
	nop
	set	0x08, %l4
	std	%i6,	[%l7 + %l4]
	nop
	set	0x68, %i2
	std	%g0,	[%l7 + %i2]
	set	0x40, %i4
	stda	%l0,	[%l7 + %i4] 0xe2
	membar	#Sync
	st	%f29,	[%l7 + 0x58]
	nop
	set	0x10, %i7
	stx	%o1,	[%l7 + %i7]
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x40, %g6
	stda	%g4,	[%l7 + %g6] 0xe2
	membar	#Sync
	set	0x20, %l3
	stda	%l4,	[%l7 + %l3] 0xe3
	membar	#Sync
	fpsub32s	%f29,	%f17,	%f27
	nop
	set	0x6F, %o6
	ldstub	[%l7 + %o6],	%o2
	nop
	set	0x60, %o0
	std	%o0,	[%l7 + %o0]
	nop
	set	0x58, %i5
	std	%f12,	[%l7 + %i5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%g7
	and	%i3,	%g6,	%o7
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xd8
	nop
	set	0x75, %g4
	ldub	[%l7 + %g4],	%i0
	or	%g2,	%i4,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%i1
	nop
	set	0x30, %o2
	stw	%i7,	[%l7 + %o2]
	set	0x50, %o7
	stxa	%i2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%i6
	set	0x34, %g7
	stba	%i5,	[%l7 + %g7] 0x88
	nop
	set	0x18, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x08, %g3
	stxa	%l3,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	nop
	setx	0xD09B8FDDFE97ABDD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xEBF54CCF6C404C72,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f4,	%f6
	ld	[%l7 + 0x58],	%f3
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%o4
	st	%f28,	[%l7 + 0x64]
	set	0x38, %g1
	stda	%g4,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x70, %o3
	lda	[%l7 + %o3] 0x80,	%f13
	nop
	set	0x4F, %i3
	stb	%g3,	[%l7 + %i3]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf8
	membar	#Sync
	nop
	set	0x3C, %l6
	lduh	[%l7 + %l6],	%o6
	nop
	set	0x28, %g2
	stx	%o5,	[%l7 + %g2]
	nop
	set	0x40, %i0
	prefetch	[%l7 + %i0],	 1
	add	%l6,	%g1,	%l0
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%o3
	set	0x35, %i6
	stba	%g5,	[%l7 + %i6] 0x88
	nop
	set	0x20, %i1
	ldsw	[%l7 + %i1],	%o1
	nop
	set	0x1A, %i2
	ldstub	[%l7 + %i2],	%l5
	add	%o0,	%o2,	%l1
	ld	[%l7 + 0x68],	%f0
	wr	%g7,	%g6,	%ccr
	and	%i3,	%o7,	%i0
	nop
	set	0x38, %i4
	stx	%g2,	[%l7 + %i4]
	set	0x38, %l4
	stxa	%i4,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x18, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x74, %g6
	ldsw	[%l7 + %g6],	%l4
	set	0x38, %o6
	stha	%l2,	[%l7 + %o6] 0x80
	or	%i7,	%i2,	%i1
	set	0x14, %l3
	sta	%f30,	[%l7 + %l3] 0x89
	nop
	set	0x28, %i5
	swap	[%l7 + %i5],	%i5
	ld	[%l7 + 0x40],	%f30
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x88,	%l3
	set	0x12, %g4
	stha	%o4,	[%l7 + %g4] 0x88
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f24
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f0
	add	%i6,	%g4,	%o6
	nop
	set	0x51, %l1
	ldstub	[%l7 + %l1],	%g3
	set	0x10, %o7
	ldda	[%l7 + %o7] 0xe2,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%l6
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%l0
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x81,	 0
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x80,	%l5
	and	%g5,	%o2,	%l1
	set	0x10, %g1
	prefetcha	[%l7 + %g1] 0x89,	 3
	set	0x78, %g7
	prefetcha	[%l7 + %g7] 0x81,	 4
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%g7
	set	0x10, %o3
	stha	%i3,	[%l7 + %o3] 0x88
	nop
	set	0x54, %l0
	swap	[%l7 + %l0],	%o7
	nop
	set	0x30, %g2
	stx	%i0,	[%l7 + %g2]
	nop
	set	0x60, %l6
	swap	[%l7 + %l6],	%g2
	nop
	set	0x28, %o5
	stx	%i4,	[%l7 + %o5]
	add	%l4,	%i7,	%i2
	nop
	set	0x14, %i6
	ldsh	[%l7 + %i6],	%l2
	set	0x1E, %i0
	stba	%i5,	[%l7 + %i0] 0x81
	set	0x6C, %i1
	lda	[%l7 + %i1] 0x80,	%f27
	set	0x20, %i4
	stwa	%l3,	[%l7 + %i4] 0x89
	set	0x10, %i2
	stxa	%i1,	[%l7 + %i2] 0x81
	nop
	set	0x70, %o4
	std	%o4,	[%l7 + %o4]
	nop
	set	0x68, %l4
	sth	%g4,	[%l7 + %l4]
	ld	[%l7 + 0x70],	%f3
	nop
	set	0x40, %i7
	ldsw	[%l7 + %i7],	%o6
	nop
	set	0x72, %g6
	ldstub	[%l7 + %g6],	%i6
	add	%g3,	%o5,	%g1
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x88,	 3
	be,a	%xcc,	loop_175
	or	%l6,	%o1,	%o3
	set	0x34, %o6
	sta	%f12,	[%l7 + %o6] 0x88
loop_175:
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%g4
	set	0x10, %g4
	stda	%l4,	[%l7 + %g4] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	bne,a	%icc,	loop_176
	nop
	set	0x30, %o0
	stb	%l1,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%o0
loop_176:
	bl,a,pn	%icc,	loop_177
	nop
	set	0x38, %l1
	std	%f20,	[%l7 + %l1]
	nop
	set	0x10, %o7
	std	%g6,	[%l7 + %o7]
	or	%i3,	%o7,	%g7
loop_177:
	ld	[%l7 + 0x34],	%f1
	bleu	%icc,	loop_178
	and	%g2,	%i4,	%i0
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%i7
	set	0x60, %l2
	stxa	%i2,	[%l7 + %l2] 0x88
loop_178:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%l4
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f4
	nop
	set	0x40, %l5
	std	%i4,	[%l7 + %l5]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc4
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%l3
	set	0x5C, %g3
	stha	%o4,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x18, %o3
	stw	%g4,	[%l7 + %o3]
	set	0x60, %i3
	swapa	[%l7 + %i3] 0x80,	%i1
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x80,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%o5
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x88,	%g3
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%f4
	nop
	set	0x77, %g2
	ldsb	[%l7 + %g2],	%l0
	nop
	set	0x09, %i0
	ldub	[%l7 + %i0],	%l6
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f30
	nop
	set	0x4C, %i6
	stw	%o1,	[%l7 + %i6]
	nop
	set	0x5C, %i4
	ldsw	[%l7 + %i4],	%o3
	nop
	set	0x68, %i2
	stx	%fsr,	[%l7 + %i2]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%g1
	nop
	set	0x20, %o4
	std	%l4,	[%l7 + %o4]
	nop
	set	0x10, %i7
	std	%f22,	[%l7 + %i7]
	nop
	set	0x12, %g6
	ldub	[%l7 + %g6],	%o2
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%l0
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x60, %i5
	ldsw	[%l7 + %i5],	%o0
	nop
	set	0x50, %g4
	stw	%g6,	[%l7 + %g4]
	set	0x20, %o1
	stxa	%o7,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x40, %o6
	stxa	%i3,	[%l7 + %o6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x68]
	set	0x6C, %l1
	stwa	%g7,	[%l7 + %l1] 0x89
	nop
	set	0x23, %o7
	ldsb	[%l7 + %o7],	%g2
	nop
	set	0x30, %g5
	ldsw	[%l7 + %g5],	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%i0
	ld	[%l7 + 0x20],	%f26
	nop
	set	0x38, %l2
	lduw	[%l7 + %l2],	%i2
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%l2
	nop
	set	0x54, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x48, %g1
	std	%l2,	[%l7 + %g1]
	and	%i5,	%o4,	%g4
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x89,	 4
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%i0
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x18, %i3
	std	%f6,	[%l7 + %i3]
	ld	[%l7 + 0x10],	%f1
	set	0x14, %l0
	stwa	%i6,	[%l7 + %l0] 0x89
	or	%o5,	%l0,	%l6
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%g3
	nop
	set	0x7C, %o5
	stw	%o3,	[%l7 + %o5]
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x80,	%o1
	st	%fsr,	[%l7 + 0x4C]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc2
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%g1
	set	0x6A, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l5
	set	0x48, %i6
	stxa	%o2,	[%l7 + %i6] 0x89
	st	%fsr,	[%l7 + 0x10]
	or	%l1,	%g5,	%o0
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xeb,	%o6
	set	0x6E, %i4
	stha	%i3,	[%l7 + %i4] 0x88
	add	%g7,	%g6,	%g2
	nop
	set	0x58, %o4
	ldsh	[%l7 + %o4],	%i4
	nop
	set	0x18, %g6
	std	%i6,	[%l7 + %g6]
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x7E, %l3
	ldstuba	[%l7 + %l3] 0x81,	%i0
	nop
	set	0x36, %l4
	lduh	[%l7 + %l4],	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%l3
	nop
	set	0x73, %g4
	stb	%l2,	[%l7 + %g4]
	nop
	set	0x62, %i5
	lduh	[%l7 + %i5],	%i5
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%g4
	bg,pn	%icc,	loop_179
	nop
	set	0x39, %o6
	ldsb	[%l7 + %o6],	%o4
	set	0x40, %l1
	swapa	[%l7 + %l1] 0x89,	%o6
loop_179:
	nop
	set	0x40, %g5
	stda	%i0,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x20, %o7
	std	%f30,	[%l7 + %o7]
	fpsub16s	%f11,	%f2,	%f27
	ld	[%l7 + 0x50],	%f9
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x81,	%o5
	nop
	set	0x3C, %l5
	ldub	[%l7 + %l5],	%i6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd0
	fpsub16	%f10,	%f24,	%f24
	add	%l6,	%g3,	%o3
	st	%f13,	[%l7 + 0x5C]
	set	0x2E, %o2
	stba	%l0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x78, %g3
	stxa	%o1,	[%l7 + %g3] 0x89
	nop
	set	0x60, %g7
	lduw	[%l7 + %g7],	%l5
	nop
	set	0x54, %i3
	ldsh	[%l7 + %i3],	%g1
	nop
	set	0x20, %o0
	swap	[%l7 + %o0],	%l1
	set	0x20, %l0
	lda	[%l7 + %l0] 0x81,	%f29
	nop
	set	0x5C, %o5
	ldub	[%l7 + %o5],	%g5
	ld	[%l7 + 0x48],	%f13
	nop
	set	0x18, %o3
	std	%o2,	[%l7 + %o3]
	set	0x58, %g2
	ldxa	[%l7 + %g2] 0x89,	%o0
	nop
	set	0x30, %l6
	ldsh	[%l7 + %l6],	%o7
	nop
	set	0x7F, %i1
	ldsb	[%l7 + %i1],	%g7
	nop
	set	0x63, %i0
	ldub	[%l7 + %i0],	%i3
	set	0x38, %i2
	prefetcha	[%l7 + %i2] 0x80,	 2
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%i4
	st	%fsr,	[%l7 + 0x30]
	nop
	nop
	setx	0xCEB52BF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x544A95E3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f0,	%f4
	nop
	set	0x1E, %o4
	ldub	[%l7 + %o4],	%g6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x88
	or	%i0,	%i7,	%l4
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x2F, %i4
	ldsb	[%l7 + %i4],	%i2
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f16
	set	0x50, %l3
	ldstuba	[%l7 + %l3] 0x80,	%l2
	nop
	set	0x5F, %g4
	stb	%l3,	[%l7 + %g4]
	set	0x1A, %l4
	stha	%g4,	[%l7 + %l4] 0x88
	nop
	set	0x53, %i5
	ldub	[%l7 + %i5],	%i5
	set	0x60, %o1
	stxa	%o6,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%o4
	wr	%i1,	%i6,	%set_softint
	nop
	set	0x73, %o6
	stb	%l6,	[%l7 + %o6]
	fpsub32	%f2,	%f24,	%f4
	nop
	set	0x30, %o7
	stw	%o5,	[%l7 + %o7]
	set	0x38, %l2
	stda	%g2,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x28, %g5
	lda	[%l7 + %g5] 0x81,	%f8
	or	%l0,	%o3,	%o1
	set	0x08, %l5
	stwa	%g1,	[%l7 + %l5] 0x89
	wr	%l5,	%g5,	%sys_tick
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xca
	set	0x40, %g1
	stwa	%o2,	[%l7 + %g1] 0x81
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%o0
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%o7
	ld	[%l7 + 0x60],	%f22
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%f4
	add	%g7,	%i3,	%g2
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%i4
	and	%g6,	%l1,	%i7
	set	0x10, %g3
	swapa	[%l7 + %g3] 0x89,	%l4
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf1,	%f0
	st	%f24,	[%l7 + 0x1C]
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%i0
	wr	%i2,	%l3,	%clear_softint
	nop
	set	0x18, %o5
	std	%f16,	[%l7 + %o5]
	fpsub32	%f8,	%f16,	%f16
	set	0x34, %i1
	sta	%f10,	[%l7 + %i1] 0x81
	set	0x48, %i0
	stxa	%l2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%i4
	nop
	set	0x7B, %i6
	ldub	[%l7 + %i6],	%g4
	wr 	%g0, 	0x6, 	%fprs
	set	0x12, %l6
	stha	%o4,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f16
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x80,	 2
	nop
	set	0x20, %i7
	std	%f26,	[%l7 + %i7]
	nop
	set	0x28, %l3
	ldsh	[%l7 + %l3],	%o5
	or	%i6,	%g3,	%l0
	nop
	set	0x18, %o4
	std	%f4,	[%l7 + %o4]
	nop
	set	0x78, %l4
	stw	%o1,	[%l7 + %l4]
	set	0x3F, %i5
	stba	%g1,	[%l7 + %i5] 0x88
	nop
	set	0x0C, %g4
	sth	%o3,	[%l7 + %g4]
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xe3,	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o0
	set	0x30, %o1
	stha	%o2,	[%l7 + %o1] 0x81
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf1
	membar	#Sync
	bn,pn	%icc,	loop_180
	nop
	set	0x49, %l2
	stb	%g7,	[%l7 + %l2]
	nop
	set	0x3C, %o6
	ldsh	[%l7 + %o6],	%o7
	nop
	set	0x20, %g5
	swap	[%l7 + %g5],	%i3
loop_180:
	add	%i4,	%g2,	%l1
	set	0x18, %o2
	stda	%i6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x89,	%g6
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%l4
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x16, %i3
	ldsh	[%l7 + %i3],	%i0
	set	0x28, %g7
	stda	%l2,	[%l7 + %g7] 0x88
	st	%f5,	[%l7 + 0x40]
	set	0x76, %l0
	stha	%i2,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x50, %o0
	stwa	%l2,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x56, %g3
	stha	%i5,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x4A, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o6
	nop
	set	0x78, %g2
	stx	%i1,	[%l7 + %g2]
	nop
	set	0x3D, %o5
	ldstub	[%l7 + %o5],	%o4
	and	%g4,	%l6,	%i6
	nop
	set	0x78, %i1
	stx	%o5,	[%l7 + %i1]
	nop
	set	0x3C, %i2
	ldstub	[%l7 + %i2],	%g3
	nop
	set	0x30, %i6
	stx	%l0,	[%l7 + %i6]
	set	0x18, %i0
	stda	%o0,	[%l7 + %i0] 0x81
	set	0x4C, %g6
	ldstuba	[%l7 + %g6] 0x88,	%o3
	nop
	set	0x68, %l6
	ldx	[%l7 + %l6],	%g1
	and	%g5,	%o0,	%o2
	nop
	set	0x10, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	nop
	set	0x23, %o4
	ldsb	[%l7 + %o4],	%g7
	set	0x34, %l4
	lda	[%l7 + %l4] 0x88,	%f6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%i4
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%g2
	wr	%o7,	%i7,	%softint
	nop
	set	0x59, %i5
	stb	%g6,	[%l7 + %i5]
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%l4
	nop
	set	0x52, %g4
	lduh	[%l7 + %g4],	%i0
	set	0x28, %o7
	stxa	%l1,	[%l7 + %o7] 0x88
	nop
	set	0x68, %l2
	std	%i2,	[%l7 + %l2]
	set	0x3C, %o1
	stwa	%l2,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x08, %o6
	stda	%i4,	[%l7 + %o6] 0x80
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o6
	st	%f9,	[%l7 + 0x70]
	nop
	set	0x08, %l5
	std	%i0,	[%l7 + %l5]
	wr	%l3,	%o4,	%y
	set	0x7C, %o2
	stha	%g4,	[%l7 + %o2] 0x89
	set	0x46, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i6
	nop
	set	0x2C, %g7
	lduw	[%l7 + %g7],	%o5
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%l6
	nop
	set	0x22, %o0
	ldstub	[%l7 + %o0],	%l0
	nop
	set	0x28, %l0
	std	%g2,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x68, %o3
	stx	%o1,	[%l7 + %o3]
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%g1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f16
	nop
	set	0x50, %g2
	std	%f22,	[%l7 + %g2]
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x81,	%g5
	set	0x7E, %i6
	stba	%o3,	[%l7 + %i6] 0x80
	nop
	set	0x5C, %i0
	lduw	[%l7 + %i0],	%o2
	set	0x6C, %g6
	sta	%f10,	[%l7 + %g6] 0x88
	set	0x78, %l6
	swapa	[%l7 + %l6] 0x89,	%l5
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x46, %i1
	sth	%g7,	[%l7 + %i1]
	set	0x22, %l3
	stha	%i3,	[%l7 + %l3] 0xea
	membar	#Sync
	set	0x72, %l4
	stha	%i4,	[%l7 + %l4] 0x89
	nop
	set	0x2C, %o4
	prefetch	[%l7 + %o4],	 2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%o0
	nop
	set	0x3E, %i7
	ldsb	[%l7 + %i7],	%o7
	st	%fsr,	[%l7 + 0x08]
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x81,	%f29
	nop
	set	0x75, %g4
	ldub	[%l7 + %g4],	%i7
	nop
	set	0x16, %o7
	ldsh	[%l7 + %o7],	%l4
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f28
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f16
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x81,	%i0
	set	0x53, %g5
	stba	%g6,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x28, %l5
	sta	%f10,	[%l7 + %l5] 0x81
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	set	0x4A, %g1
	stha	%i2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%l2
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x7F, %i3
	ldub	[%l7 + %i3],	%l1
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f2
	set	0x5C, %o3
	stwa	%o6,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%l3
	set	0x60, %o0
	stba	%o4,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x78, %o5
	lduh	[%l7 + %o5],	%g4
	nop
	set	0x78, %g2
	ldx	[%l7 + %g2],	%i5
	or	%o5,	%l6,	%i6
	nop
	set	0x08, %i6
	ldstub	[%l7 + %i6],	%l0
	nop
	set	0x63, %i2
	stb	%g3,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x20]
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x89,	%g1
	ld	[%l7 + 0x30],	%f11
	set	0x24, %l6
	lda	[%l7 + %l6] 0x89,	%f22
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd0
	wr	%g5,	%o3,	%y
	set	0x34, %i4
	sta	%f20,	[%l7 + %i4] 0x89
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%o2
	set	0x08, %i1
	ldxa	[%l7 + %i1] 0x80,	%i3
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x48, %i5
	swap	[%l7 + %i5],	%i4
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%g2
	ld	[%l7 + 0x74],	%f9
	nop
	set	0x7F, %g4
	ldstub	[%l7 + %g4],	%o0
	nop
	set	0x18, %o7
	stx	%o7,	[%l7 + %o7]
	set	0x2C, %l2
	sta	%f10,	[%l7 + %l2] 0x89
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%i6
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x88,	%l4
	nop
	set	0x50, %l5
	std	%f14,	[%l7 + %l5]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	nop
	set	0x18, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x74, %g5
	stha	%g7,	[%l7 + %g5] 0x89
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x88,	 3
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x88,	 0
	nop
	set	0x3C, %g7
	swap	[%l7 + %g7],	%i2
	set	0x48, %o3
	ldxa	[%l7 + %o3] 0x89,	%l2
	wr	%l1,	%i1,	%clear_softint
	ld	[%l7 + 0x08],	%f6
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f28
	nop
	set	0x48, %o0
	stx	%l3,	[%l7 + %o0]
	add	%o6,	%o4,	%g4
	ld	[%l7 + 0x48],	%f1
	set	0x6E, %g3
	stba	%o5,	[%l7 + %g3] 0xeb
	membar	#Sync
	and	%l6,	%i6,	%l0
	add	%i5,	%g1,	%g5
	set	0x78, %g2
	sta	%f6,	[%l7 + %g2] 0x88
	nop
	set	0x0B, %i6
	ldsb	[%l7 + %i6],	%o3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f0
	nop
	set	0x4C, %g6
	lduh	[%l7 + %g6],	%o1
	nop
	set	0x54, %l6
	swap	[%l7 + %l6],	%l5
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%g2
	nop
	set	0x24, %i4
	swap	[%l7 + %i4],	%o2
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%i4
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%i3
	set	0x64, %i0
	lda	[%l7 + %i0] 0x81,	%f12
	set	0x64, %i1
	lda	[%l7 + %i1] 0x81,	%f18
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%o0
	set	0x08, %i7
	stwa	%g2,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x28, %g4
	ldub	[%l7 + %g4],	%i7
	fpadd32s	%f19,	%f20,	%f10
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%g7
	nop
	set	0x48, %o4
	lduw	[%l7 + %o4],	%i0
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x89,	 3
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f0
	nop
	set	0x7E, %l1
	ldsb	[%l7 + %l1],	%g6
	nop
	set	0x74, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x48, %o2
	stwa	%i2,	[%l7 + %o2] 0x80
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%l0
	nop
	set	0x70, %g5
	sth	%l2,	[%l7 + %g5]
	nop
	set	0x55, %o6
	ldsb	[%l7 + %o6],	%l3
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f30
	nop
	set	0x08, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x38, %o3
	stx	%o6,	[%l7 + %o3]
	add	%i1,	%o4,	%o5
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	nop
	set	0x44, %o0
	stw	%i6,	[%l7 + %o0]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd2
	set	0x74, %g2
	swapa	[%l7 + %g2] 0x81,	%l6
	and	%l0,	%i5,	%g5
	st	%f8,	[%l7 + 0x40]
	set	0x50, %i6
	sta	%f22,	[%l7 + %i6] 0x88
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%g1
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%o0
	nop
	set	0x4E, %g6
	ldsh	[%l7 + %g6],	%g3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%i4
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f18
	nop
	set	0x4D, %l6
	ldsb	[%l7 + %l6],	%o2
	nop
	set	0x50, %l3
	swap	[%l7 + %l3],	%o0
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x81,	%i3
	nop
	set	0x36, %i4
	ldsh	[%l7 + %i4],	%i7
	nop
	set	0x08, %i1
	ldsh	[%l7 + %i1],	%l4
	set	0x40, %i0
	stxa	%g2,	[%l7 + %i0] 0x80
	add	%i0,	%o7,	%g6
	nop
	nop
	setx	0x06F32375619A1D38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB3CCA22BA4E503C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f4,	%f12
	set	0x2E, %i5
	stha	%g7,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%l1
	set	0x4C, %o4
	sta	%f26,	[%l7 + %o4] 0x89
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f12
	nop
	set	0x7A, %o1
	sth	%l2,	[%l7 + %o1]
	nop
	set	0x48, %i7
	std	%f24,	[%l7 + %i7]
	nop
	set	0x2C, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%i2
	nop
	set	0x24, %l2
	stw	%l3,	[%l7 + %l2]
	set	0x58, %l5
	stda	%o6,	[%l7 + %l5] 0x80
	set	0x44, %g5
	stwa	%o4,	[%l7 + %g5] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%g4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	set	0x34, %g7
	stwa	%i6,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x30, %o3
	stx	%o5,	[%l7 + %o3]
	nop
	set	0x70, %o6
	ldsw	[%l7 + %o6],	%l0
	nop
	set	0x3E, %i3
	ldsh	[%l7 + %i3],	%l6
	nop
	set	0x1B, %o0
	ldstub	[%l7 + %o0],	%g5
	nop
	set	0x54, %l0
	lduh	[%l7 + %l0],	%o3
	add	%g1,	%i5,	%o1
	nop
	set	0x48, %i6
	std	%f24,	[%l7 + %i6]
	nop
	set	0x4C, %o5
	ldsw	[%l7 + %o5],	%l5
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x40, %g6
	stx	%fsr,	[%l7 + %g6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%o2
	nop
	set	0x50, %g2
	ldsw	[%l7 + %g2],	%o0
	set	0x78, %i2
	swapa	[%l7 + %i2] 0x89,	%i7
	nop
	set	0x30, %l6
	std	%l4,	[%l7 + %l6]
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x81
	nop
	set	0x32, %l4
	lduh	[%l7 + %l4],	%i3
	set	0x4C, %i4
	lda	[%l7 + %i4] 0x89,	%f18
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%g2
	set	0x08, %i5
	stda	%o6,	[%l7 + %i5] 0x80
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%g6
	set	0x60, %g4
	stda	%i0,	[%l7 + %g4] 0x89
	nop
	set	0x67, %o4
	ldsb	[%l7 + %o4],	%l1
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x81,	%l2
	st	%f17,	[%l7 + 0x3C]
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%g7
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x89
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x80,	%l3
	nop
	set	0x38, %o2
	ldsh	[%l7 + %o2],	%o6
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xd2
	set	0x34, %g5
	swapa	[%l7 + %g5] 0x89,	%i2
	nop
	set	0x68, %l2
	ldsh	[%l7 + %l2],	%o4
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x81,	%i0
	bn,pt	%xcc,	loop_181
	nop
	set	0x50, %g1
	stx	%i6,	[%l7 + %g1]
	nop
	set	0x1C, %o6
	ldsb	[%l7 + %o6],	%g4
	nop
	set	0x30, %o3
	lduw	[%l7 + %o3],	%o5
loop_181:
	nop
	set	0x0C, %o0
	swap	[%l7 + %o0],	%l0
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%l6
	set	0x20, %i3
	stba	%o3,	[%l7 + %i3] 0x88
	wr	%g5,	%i5,	%pic
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x89,	 2
	fpadd16s	%f16,	%f0,	%f26
	ld	[%l7 + 0x30],	%f21
	st	%f12,	[%l7 + 0x60]
	nop
	set	0x76, %i6
	ldstub	[%l7 + %i6],	%l5
	ld	[%l7 + 0x2C],	%f12
	set	0x08, %g3
	stxa	%g3,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x08, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	add	%g1,	%o2,	%o0
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%i4
	nop
	set	0x6E, %l3
	stb	%i7,	[%l7 + %l3]
	nop
	set	0x34, %l4
	prefetch	[%l7 + %l4],	 1
	set	0x2C, %i4
	sta	%f23,	[%l7 + %i4] 0x88
	nop
	set	0x40, %i0
	ldsw	[%l7 + %i0],	%l4
	nop
	set	0x47, %l6
	ldub	[%l7 + %l6],	%g2
	set	0x14, %i1
	sta	%f26,	[%l7 + %i1] 0x89
	and	%i3,	%o7,	%i0
	nop
	set	0x52, %g4
	sth	%l1,	[%l7 + %g4]
	set	0x24, %i5
	sta	%f30,	[%l7 + %i5] 0x89
	set	0x64, %o1
	lda	[%l7 + %o1] 0x88,	%f23
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f28
	nop
	set	0x6E, %o4
	ldstub	[%l7 + %o4],	%g6
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	set	0x3E, %o7
	stba	%g7,	[%l7 + %o7] 0x80
	set	0x60, %o2
	stxa	%l2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x50, %l2
	ldub	[%l7 + %l2],	%l3
	nop
	set	0x4C, %l5
	swap	[%l7 + %l5],	%o6
	set	0x76, %g1
	stha	%o4,	[%l7 + %g1] 0x88
	nop
	set	0x17, %g7
	ldstub	[%l7 + %g7],	%i2
	set	0x48, %o6
	stda	%i6,	[%l7 + %o6] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f0
	nop
	set	0x58, %l0
	swap	[%l7 + %l0],	%g4
	nop
	set	0x60, %o0
	stx	%o5,	[%l7 + %o0]
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x81,	%i1
	set	0x3C, %i6
	swapa	[%l7 + %i6] 0x89,	%l6
	and	%o3,	%l0,	%i5
	add	%g5,	%o1,	%l5
	nop
	set	0x1C, %i3
	ldsh	[%l7 + %i3],	%g3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%i4
	or	%i7,	%o0,	%l4
	nop
	set	0x70, %g3
	stx	%i3,	[%l7 + %g3]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd8
	set	0x0A, %l3
	stba	%g2,	[%l7 + %l3] 0x88
	or	%i0,	%o7,	%g6
	st	%f22,	[%l7 + 0x64]
	or	%l1,	%l2,	%g7
	set	0x68, %g6
	stxa	%o6,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x10, %l4
	std	%f4,	[%l7 + %l4]
	nop
	set	0x60, %i0
	stx	%o4,	[%l7 + %i0]
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f6
	nop
	set	0x4C, %i1
	sth	%i2,	[%l7 + %i1]
	nop
	set	0x30, %l6
	lduw	[%l7 + %l6],	%i6
	nop
	set	0x58, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x30, %i5
	prefetch	[%l7 + %i5],	 3
	fpsub16	%f8,	%f14,	%f16
	or	%g4,	%o5,	%l3
	nop
	set	0x58, %o1
	ldsb	[%l7 + %o1],	%l6
	or	%o3,	%l0,	%i5
	bgu	%icc,	loop_182
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%g5
	nop
	set	0x68, %i7
	ldsh	[%l7 + %i7],	%o1
	add	%l5,	%g3,	%o2
loop_182:
	or	%g1,	%i4,	%i1
	nop
	set	0x14, %o7
	ldsw	[%l7 + %o7],	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%g2
	ba,a	%icc,	loop_183
	wr	%o7,	%i0,	%y
	nop
	set	0x68, %o2
	std	%f4,	[%l7 + %o2]
	wr	%g6,	%l1,	%ccr
loop_183:
	nop
	set	0x50, %g5
	stha	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%o6
	add	%g7,	%o4,	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%o5
	set	0x60, %l5
	prefetcha	[%l7 + %l5] 0x88,	 2
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x88,	%l6
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x5D, %g7
	ldub	[%l7 + %g7],	%g4
	nop
	set	0x49, %g1
	ldsb	[%l7 + %g1],	%l0
	set	0x68, %o3
	swapa	[%l7 + %o3] 0x89,	%o3
	nop
	set	0x36, %o6
	stb	%g5,	[%l7 + %o6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%i5
	nop
	set	0x73, %o0
	ldstub	[%l7 + %o0],	%g3
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x89,	%o2
	set	0x7E, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l5
	nop
	set	0x51, %i3
	ldsb	[%l7 + %i3],	%g1
	st	%fsr,	[%l7 + 0x78]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i1
	set	0x1D, %l0
	stba	%o0,	[%l7 + %l0] 0x89
	nop
	set	0x48, %g3
	sth	%i7,	[%l7 + %g3]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x81,	%i3,	%l4
	nop
	set	0x48, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f8
	nop
	set	0x64, %l3
	sth	%g2,	[%l7 + %l3]
	set	0x24, %l4
	sta	%f27,	[%l7 + %l4] 0x88
	set	0x2C, %g6
	sta	%f5,	[%l7 + %g6] 0x88
	set	0x38, %i0
	ldxa	[%l7 + %i0] 0x89,	%i0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1285
!	Type a   	: 27
!	Type cti   	: 27
!	Type x   	: 531
!	Type f   	: 27
!	Type i   	: 103
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
	set	0x7,	%g1
	set	0x5,	%g2
	set	0xD,	%g3
	set	0xA,	%g4
	set	0x4,	%g5
	set	0xF,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x9,	%i1
	set	-0x6,	%i2
	set	-0x4,	%i3
	set	-0x3,	%i4
	set	-0x3,	%i5
	set	-0xB,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x635BBD74,	%l0
	set	0x34335810,	%l1
	set	0x47B6F7E1,	%l2
	set	0x139767F4,	%l3
	set	0x0A6EE964,	%l4
	set	0x5132614B,	%l5
	set	0x62F7B5E7,	%l6
	!# Output registers
	set	-0x1CEF,	%o0
	set	-0x01DC,	%o1
	set	0x0134,	%o2
	set	0x003C,	%o3
	set	0x1B96,	%o4
	set	-0x1403,	%o5
	set	-0x00EB,	%o6
	set	-0x1F98,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	nop
	set	0x20, %i1
	swap	[%l7 + %i1],	%g6
	st	%f10,	[%l7 + 0x1C]
	nop
	set	0x34, %i4
	ldstub	[%l7 + %i4],	%l1
	and	%l2,	%o7,	%o6
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x2C, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x58, %o1
	std	%f22,	[%l7 + %o1]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f2
	set	0x78, %l6
	stwa	%o4,	[%l7 + %l6] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
	nop
	set	0x6E, %o7
	sth	%i2,	[%l7 + %o7]
	st	%f9,	[%l7 + 0x60]
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x81,	%g7
	set	0x60, %o2
	stwa	%o5,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%i6,	%l6,	%l3
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%l0
	nop
	set	0x6A, %l1
	lduh	[%l7 + %l1],	%o3
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%g5
	nop
	set	0x37, %g1
	ldstub	[%l7 + %g1],	%o1
	nop
	set	0x24, %g7
	swap	[%l7 + %g7],	%i5
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x88,	%g4
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%o2
	set	0x10, %o5
	stda	%l4,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 2
	st	%fsr,	[%l7 + 0x60]
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xea,	%g2
	set	0x18, %o0
	stxa	%g1,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x48, %g3
	std	%f6,	[%l7 + %g3]
	nop
	set	0x30, %i2
	lduw	[%l7 + %i2],	%i4
	set	0x44, %l0
	stwa	%o0,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%i6
	set	0x08, %l3
	swapa	[%l7 + %l3] 0x88,	%i1
	nop
	set	0x3C, %g6
	swap	[%l7 + %g6],	%i3
	and	%l4,	%g2,	%g6
	bl,a	%icc,	loop_184
	nop
	set	0x13, %i0
	stb	%i0,	[%l7 + %i0]
	nop
	set	0x23, %l4
	ldub	[%l7 + %l4],	%l1
	set	0x17, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o7
loop_184:
	nop
	set	0x7E, %i4
	stha	%o6,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%l2
	set	0x44, %g4
	sta	%f29,	[%l7 + %g4] 0x81
	nop
	set	0x3C, %o1
	prefetch	[%l7 + %o1],	 0
	ld	[%l7 + 0x64],	%f22
	nop
	set	0x68, %i5
	sth	%i2,	[%l7 + %i5]
	set	0x16, %l6
	stha	%o5,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x38, %i7
	ldx	[%l7 + %i7],	%g7
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%l6
	nop
	set	0x20, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%i6
	set	0x30, %o2
	stwa	%l0,	[%l7 + %o2] 0x80
	set	0x28, %l5
	stxa	%g5,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xda,	%f16
	nop
	set	0x74, %l2
	lduh	[%l7 + %l2],	%o1
	set	0x2C, %g1
	stha	%i5,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%g4
	ble	%icc,	loop_185
	nop
	set	0x2C, %o6
	swap	[%l7 + %o6],	%o3
	set	0x78, %o3
	swapa	[%l7 + %o3] 0x81,	%o2
loop_185:
	ld	[%l7 + 0x70],	%f14
	and	%l5,	%g3,	%i4
	nop
	set	0x40, %o5
	std	%f28,	[%l7 + %o5]
	nop
	set	0x69, %g5
	ldub	[%l7 + %g5],	%o0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x88
	fpsub32	%f8,	%f18,	%f28
	set	0x2C, %i6
	stha	%i7,	[%l7 + %i6] 0x89
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%i1
	nop
	set	0x68, %i2
	lduw	[%l7 + %i2],	%i3
	nop
	set	0x7C, %l0
	stw	%g1,	[%l7 + %l0]
	nop
	set	0x45, %g3
	ldsb	[%l7 + %g3],	%l4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	wr	%g6,	%g2,	%y
	nop
	nop
	setx	0x523071F25B3ED0E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4E64B69B300FB6C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o7
	nop
	set	0x3A, %l3
	ldsh	[%l7 + %l3],	%l1
	nop
	set	0x48, %g6
	std	%o4,	[%l7 + %g6]
	st	%f1,	[%l7 + 0x30]
	set	0x6C, %l4
	sta	%f27,	[%l7 + %l4] 0x81
	set	0x68, %i0
	lda	[%l7 + %i0] 0x80,	%f23
	set	0x40, %i1
	stxa	%l2,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	wr	%i2,	%o5,	%pic
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f26
	set	0x2C, %i4
	stwa	%o6,	[%l7 + %i4] 0x81
	add	%l6,	%l3,	%g7
	nop
	set	0x74, %i5
	ldsw	[%l7 + %i5],	%l0
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%i6
	nop
	set	0x44, %l6
	sth	%o1,	[%l7 + %l6]
	set	0x0A, %o7
	stha	%i5,	[%l7 + %o7] 0xe2
	membar	#Sync
	st	%f21,	[%l7 + 0x70]
	wr	%g4,	%g5,	%softint
	st	%f15,	[%l7 + 0x08]
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%o2
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x81,	%o3
	and	%g3,	%l5,	%o0
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%i7
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc8
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	nop
	setx	0xCF4926F7DF2ED433,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x6CCA59583D7675E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f26
	set	0x60, %g1
	stxa	%i1,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x52, %o6
	ldstub	[%l7 + %o6],	%i3
	set	0x73, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g1
	set	0x08, %o5
	ldxa	[%l7 + %o5] 0x81,	%i4
	nop
	set	0x30, %g5
	ldsh	[%l7 + %g5],	%g6
	nop
	set	0x34, %i6
	lduw	[%l7 + %i6],	%g2
	nop
	set	0x18, %i3
	stx	%l4,	[%l7 + %i3]
	set	0x43, %i2
	ldstuba	[%l7 + %i2] 0x80,	%o7
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x80,	%l1
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%o4
	nop
	set	0x48, %g2
	ldsw	[%l7 + %g2],	%l2
	nop
	set	0x57, %l3
	ldub	[%l7 + %l3],	%i2
	nop
	set	0x67, %g6
	stb	%i0,	[%l7 + %g6]
	nop
	set	0x20, %l4
	std	%f24,	[%l7 + %l4]
	nop
	set	0x50, %i0
	stx	%o5,	[%l7 + %i0]
	nop
	set	0x72, %i1
	sth	%l6,	[%l7 + %i1]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x48, %g4
	lduw	[%l7 + %g4],	%g7
	nop
	set	0x25, %i4
	stb	%l3,	[%l7 + %i4]
	or	%l0,	%o1,	%i5
	nop
	set	0x54, %i7
	swap	[%l7 + %i7],	%i6
	nop
	set	0x38, %l6
	std	%f4,	[%l7 + %l6]
	nop
	set	0x38, %o7
	stw	%g5,	[%l7 + %o7]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%o2
	nop
	set	0x68, %i5
	std	%f4,	[%l7 + %i5]
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%g2
	wr	%o3,	%l5,	%sys_tick
	set	0x70, %l1
	stda	%o0,	[%l7 + %l1] 0x81
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f0
	set	0x27, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i1
	or	%i7,	%i3,	%g1
	nop
	set	0x74, %g7
	lduw	[%l7 + %g7],	%g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%l1
	nop
	set	0x13, %l5
	ldub	[%l7 + %l5],	%o4
	and	%i4,	%i2,	%l2
	st	%fsr,	[%l7 + 0x54]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%l6
	set	0x40, %g1
	lda	[%l7 + %g1] 0x80,	%f4
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%i0
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x58, %o6
	stxa	%l3,	[%l7 + %o6] 0xe2
	membar	#Sync
	st	%f26,	[%l7 + 0x34]
	set	0x58, %g5
	stda	%g6,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x24, %i6
	sta	%f9,	[%l7 + %i6] 0x81
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xe3,	%l0
	set	0x38, %i3
	stxa	%i5,	[%l7 + %i3] 0x80
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%g4
	nop
	set	0x7A, %i2
	ldub	[%l7 + %i2],	%o1
	set	0x60, %g3
	stwa	%o2,	[%l7 + %g3] 0x81
	or	%o3,	%l5,	%o0
	st	%fsr,	[%l7 + 0x74]
	ld	[%l7 + 0x60],	%f6
	nop
	set	0x58, %l3
	stx	%i1,	[%l7 + %l3]
	set	0x54, %g6
	stha	%i7,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x4E, %l4
	lduh	[%l7 + %l4],	%i3
	bge	%icc,	loop_186
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%g2
	set	0x4C, %i0
	stwa	%g1,	[%l7 + %i0] 0xea
	membar	#Sync
loop_186:
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	or	%g2,	%g6,	%o7
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%l1
	nop
	set	0x64, %o1
	prefetch	[%l7 + %o1],	 4
	and	%o4,	%l4,	%i2
	set	0x48, %g4
	stxa	%l2,	[%l7 + %g4] 0x80
	nop
	set	0x28, %i4
	lduh	[%l7 + %i4],	%o5
	nop
	set	0x1A, %l6
	ldub	[%l7 + %l6],	%i4
	or	%o6,	%l6,	%l3
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf8,	%f16
	set	0x50, %i5
	ldxa	[%l7 + %i5] 0x80,	%i0
	and	%g7,	%i5,	%i6
	or	%g5,	%g4,	%o1
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x88,	%o2
	nop
	set	0x44, %i7
	ldsw	[%l7 + %i7],	%o3
	nop
	set	0x38, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3E9, 	%tick_cmpr
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f24
	nop
	set	0x4B, %l2
	ldsb	[%l7 + %l2],	%o0
	nop
	set	0x20, %g7
	swap	[%l7 + %g7],	%i7
	nop
	set	0x26, %g1
	ldsh	[%l7 + %g1],	%i1
	nop
	set	0x74, %l5
	swap	[%l7 + %l5],	%g3
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%i3
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x81,	%g6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc2
	and	%g2,	%l1,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%l4
	set	0x78, %o5
	stda	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x6B, %i6
	ldstub	[%l7 + %i6],	%l2
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x89,	%i4
	set	0x2E, %i2
	stha	%o5,	[%l7 + %i2] 0x80
	nop
	set	0x14, %o0
	stw	%o6,	[%l7 + %o0]
	ld	[%l7 + 0x74],	%f3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%l6
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%i0
	st	%f9,	[%l7 + 0x1C]
	nop
	set	0x48, %g6
	ldx	[%l7 + %g6],	%g7
	nop
	set	0x60, %l3
	swap	[%l7 + %l3],	%i6
	nop
	set	0x09, %g2
	ldub	[%l7 + %g2],	%g5
	add	%g4,	%i5,	%o1
	bgu,a	%xcc,	loop_187
	add	%o2,	%o3,	%l5
	set	0x70, %l4
	stwa	%l0,	[%l7 + %l4] 0x89
loop_187:
	nop
	set	0x53, %i0
	stb	%o0,	[%l7 + %i0]
	set	0x42, %l0
	stha	%i7,	[%l7 + %l0] 0x89
	set	0x18, %o1
	stba	%i1,	[%l7 + %o1] 0x89
	nop
	set	0x5C, %g4
	stw	%g3,	[%l7 + %g4]
	set	0x23, %i1
	stba	%g1,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x10, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i3
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	and	%g6,	%l1,	%g2
	or	%o4,	%l4,	%o7
	nop
	set	0x39, %i4
	stb	%i2,	[%l7 + %i4]
	nop
	set	0x78, %i5
	lduw	[%l7 + %i5],	%l2
	nop
	set	0x64, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x50, %l1
	std	%o4,	[%l7 + %l1]
	ld	[%l7 + 0x3C],	%f9
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%i4
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%l3
	st	%f14,	[%l7 + 0x58]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i0
	wr	%g7,	%i6,	%set_softint
	nop
	set	0x1D, %o2
	ldstub	[%l7 + %o2],	%g5
	set	0x1C, %g1
	stha	%g4,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x1C, %l5
	lda	[%l7 + %l5] 0x88,	%f8
	set	0x10, %g7
	ldxa	[%l7 + %g7] 0x88,	%o1
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%o2
	nop
	set	0x68, %o3
	swap	[%l7 + %o3],	%i5
	nop
	set	0x58, %o6
	stx	%o3,	[%l7 + %o6]
	add	%l0,	%l5,	%o0
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%i7
	set	0x78, %i3
	lda	[%l7 + %i3] 0x80,	%f19
	st	%f26,	[%l7 + 0x58]
	nop
	set	0x2D, %o5
	ldsb	[%l7 + %o5],	%i1
	nop
	set	0x38, %i2
	swap	[%l7 + %i2],	%g3
	nop
	set	0x74, %o0
	ldsw	[%l7 + %o0],	%i3
	nop
	set	0x73, %g3
	ldub	[%l7 + %g3],	%g1
	bne	%xcc,	loop_188
	nop
	set	0x0C, %g6
	ldsh	[%l7 + %g6],	%l1
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x88,	%g2
loop_188:
	wr	%g6,	%l4,	%y
	st	%f30,	[%l7 + 0x24]
	and	%o4,	%i2,	%l2
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x89,	%o7
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%o6
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%i4
	nop
	set	0x45, %o1
	ldsb	[%l7 + %o1],	%o5
	st	%fsr,	[%l7 + 0x4C]
	set	0x5C, %l0
	ldstuba	[%l7 + %l0] 0x88,	%l3
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x88,	 2
	nop
	set	0x70, %i1
	stx	%g7,	[%l7 + %i1]
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%i6
	nop
	set	0x39, %i4
	stb	%g5,	[%l7 + %i4]
	set	0x68, %i5
	swapa	[%l7 + %i5] 0x88,	%i0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%o2
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	nop
	set	0x50, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x2E, %o4
	ldub	[%l7 + %o4],	%i5
	set	0x24, %o2
	sta	%f3,	[%l7 + %o2] 0x81
	nop
	set	0x0C, %l2
	stw	%o1,	[%l7 + %l2]
	set	0x5C, %l5
	sta	%f31,	[%l7 + %l5] 0x88
	nop
	set	0x10, %g7
	std	%f14,	[%l7 + %g7]
	nop
	set	0x3C, %g1
	ldsw	[%l7 + %g1],	%o3
	set	0x20, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l0
	fpsub16s	%f6,	%f28,	%f28
	nop
	set	0x10, %o6
	swap	[%l7 + %o6],	%o0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%i1
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f0
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%g2
	nop
	set	0x70, %i6
	ldsw	[%l7 + %i6],	%i3
	nop
	set	0x44, %i2
	ldsh	[%l7 + %i2],	%i7
	nop
	set	0x3A, %o5
	sth	%g1,	[%l7 + %o5]
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x88,	%g2
	fpadd16	%f26,	%f24,	%f22
	nop
	set	0x70, %o0
	stx	%l1,	[%l7 + %o0]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%l4
	add	%o4,	%i2,	%l2
	nop
	set	0x12, %l3
	sth	%o7,	[%l7 + %l3]
	bleu	%xcc,	loop_189
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%o6
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%f23,	[%l7 + 0x40]
loop_189:
	nop
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x89,	%i4
	nop
	set	0x70, %i0
	sth	%l3,	[%l7 + %i0]
	add	%o5,	%l6,	%i6
	set	0x30, %o1
	stwa	%g7,	[%l7 + %o1] 0x81
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x88,	%i0
	nop
	set	0x18, %l0
	stx	%g5,	[%l7 + %l0]
	set	0x50, %i1
	stda	%g4,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x59, %l6
	ldstub	[%l7 + %l6],	%o2
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x18, %i4
	std	%f10,	[%l7 + %i4]
	nop
	set	0x3D, %i5
	ldub	[%l7 + %i5],	%i5
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xca
	nop
	set	0x7C, %o7
	sth	%o3,	[%l7 + %o7]
	nop
	set	0x68, %o4
	swap	[%l7 + %o4],	%o1
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	nop
	set	0x40, %l2
	stw	%l5,	[%l7 + %l2]
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%i1
	nop
	set	0x28, %g7
	stw	%o0,	[%l7 + %g7]
	nop
	set	0x22, %g1
	ldub	[%l7 + %g1],	%i3
	or	%i7,	%g1,	%g2
	st	%f3,	[%l7 + 0x40]
	set	0x44, %g5
	stwa	%l1,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x58, %o6
	swap	[%l7 + %o6],	%g3
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%l4
	set	0x48, %i7
	ldxa	[%l7 + %i7] 0x80,	%o4
	nop
	set	0x64, %i6
	lduh	[%l7 + %i6],	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%g6
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 3
	set	0x20, %o5
	stda	%o6,	[%l7 + %o5] 0xea
	membar	#Sync
	st	%f13,	[%l7 + 0x74]
	nop
	set	0x68, %g3
	stb	%o7,	[%l7 + %g3]
	set	0x78, %i2
	stda	%l2,	[%l7 + %i2] 0x80
	set	0x74, %o0
	lda	[%l7 + %o0] 0x80,	%f16
	or	%i4,	%o5,	%l6
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x81,	%g7
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%i0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc4
	nop
	set	0x70, %o1
	ldsw	[%l7 + %o1],	%g5
	nop
	set	0x74, %g4
	swap	[%l7 + %g4],	%g4
	set	0x30, %l0
	stxa	%o2,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x30, %i0
	ldxa	[%l7 + %i0] 0x89,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%l0
	st	%fsr,	[%l7 + 0x68]
	set	0x1C, %i1
	stwa	%l5,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	nop
	set	0x48, %i5
	std	%o0,	[%l7 + %i5]
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 0
	nop
	set	0x70, %l6
	swap	[%l7 + %l6],	%i1
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc2
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%i3
	set	0x50, %o2
	stha	%i7,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%g3
	set	0x30, %l5
	stda	%g2,	[%l7 + %l5] 0x81
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x89
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd8,	%f0
	set	0x70, %g1
	stda	%l4,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x0A, %o6
	ldsh	[%l7 + %o6],	%i2
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%f12
	nop
	set	0x58, %i7
	ldx	[%l7 + %i7],	%l2
	nop
	set	0x20, %o3
	ldx	[%l7 + %o3],	%g6
	nop
	set	0x20, %i3
	stx	%o4,	[%l7 + %i3]
	nop
	set	0x3A, %i6
	sth	%o7,	[%l7 + %i6]
	nop
	set	0x34, %g3
	ldub	[%l7 + %g3],	%l3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f16
	nop
	set	0x42, %i2
	sth	%o6,	[%l7 + %i2]
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	st	%f25,	[%l7 + 0x0C]
	nop
	nop
	setx	0xE250D74D4830361A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x20EEBA2A4AD67691,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f4
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%i6
	add	%o5,	%g7,	%i0
	set	0x40, %l4
	stha	%g5,	[%l7 + %l4] 0x88
	nop
	set	0x78, %g2
	stw	%g4,	[%l7 + %g2]
	set	0x50, %o1
	ldda	[%l7 + %o1] 0xe3,	%o2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xc8
	or	%o3,	%i6,	%l0
	and	%i5,	%o1,	%i1
	set	0x2C, %l3
	sta	%f16,	[%l7 + %l3] 0x89
	nop
	set	0x48, %i0
	std	%f20,	[%l7 + %i0]
	nop
	set	0x60, %i1
	ldx	[%l7 + %i1],	%l5
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x88,	 2
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%i3
	add	%g1,	%o0,	%l1
	fpsub32	%f4,	%f10,	%f2
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f28
	set	0x5C, %l1
	stwa	%g2,	[%l7 + %l1] 0x88
	nop
	nop
	setx	0xE82D2DA2E25D0115,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2A476DC67B1561B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f6,	%f14
	nop
	set	0x78, %l6
	stb	%l4,	[%l7 + %l6]
	nop
	set	0x4A, %o7
	lduh	[%l7 + %o7],	%i2
	nop
	set	0x20, %o2
	ldx	[%l7 + %o2],	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%o4
	set	0x60, %o4
	sta	%f25,	[%l7 + %o4] 0x80
	set	0x53, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o7
	set	0x44, %l5
	stba	%l2,	[%l7 + %l5] 0xea
	membar	#Sync
	and	%o6,	%i4,	%l6
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x81,	%o5
	nop
	set	0x54, %g1
	ldsw	[%l7 + %g1],	%g7
	st	%f5,	[%l7 + 0x44]
	set	0x18, %g5
	sta	%f4,	[%l7 + %g5] 0x80
	set	0x4C, %o6
	sta	%f6,	[%l7 + %o6] 0x81
	and	%l3,	%i0,	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o3
	nop
	set	0x40, %o3
	lduw	[%l7 + %o3],	%g4
	nop
	set	0x18, %i7
	std	%l0,	[%l7 + %i7]
	nop
	set	0x18, %i3
	std	%i4,	[%l7 + %i3]
	nop
	set	0x18, %i6
	stx	%o1,	[%l7 + %i6]
	nop
	set	0x3C, %g3
	ldsw	[%l7 + %g3],	%i6
	nop
	set	0x3C, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x28, %o5
	stw	%l5,	[%l7 + %o5]
	nop
	set	0x78, %g6
	std	%f2,	[%l7 + %g6]
	set	0x18, %o0
	stxa	%i7,	[%l7 + %o0] 0x80
	set	0x48, %g2
	ldxa	[%l7 + %g2] 0x81,	%i1
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x89,	%i3
	nop
	set	0x7C, %l4
	sth	%o0,	[%l7 + %l4]
	nop
	set	0x28, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%l1
	nop
	set	0x10, %i0
	prefetch	[%l7 + %i0],	 0
	bleu,pn	%xcc,	loop_190
	bge	%xcc,	loop_191
	wr	%g1,	%g2,	%ccr
	st	%f16,	[%l7 + 0x3C]
loop_190:
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%l4
loop_191:
	fpadd16s	%f14,	%f12,	%f12
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%i2
	ld	[%l7 + 0x24],	%f13
	nop
	set	0x2D, %i5
	stb	%g6,	[%l7 + %i5]
	nop
	set	0x6B, %l1
	ldub	[%l7 + %l1],	%g3
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%o4
	set	0x48, %o7
	stda	%o6,	[%l7 + %o7] 0x80
	nop
	set	0x30, %o2
	std	%f24,	[%l7 + %o2]
	set	0x18, %o4
	lda	[%l7 + %o4] 0x89,	%f23
	set	0x50, %g7
	stda	%o6,	[%l7 + %g7] 0x80
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%l2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%f16
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	nop
	set	0x54, %g1
	ldsh	[%l7 + %g1],	%l6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f0
	or	%i4,	%o5,	%l3
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x81,	%i0
	set	0x40, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	nop
	set	0x6F, %o3
	ldub	[%l7 + %o3],	%g7
	nop
	set	0x18, %i6
	std	%f0,	[%l7 + %i6]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd2
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%o3
	nop
	set	0x18, %o5
	stw	%g4,	[%l7 + %o5]
	or	%o2,	%i5,	%o1
	nop
	set	0x28, %i2
	stw	%l0,	[%l7 + %i2]
	set	0x58, %o0
	stxa	%i6,	[%l7 + %o0] 0x81
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x89,	 2
	fpadd32s	%f26,	%f29,	%f6
	nop
	set	0x2C, %g6
	lduw	[%l7 + %g6],	%l5
	add	%i3,	%i1,	%o0
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x88,	%g0
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	fpadd16s	%f26,	%f23,	%f12
	add	%g2,	%l4,	%l1
	ld	[%l7 + 0x10],	%f29
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x88,	%g6
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f14
	nop
	set	0x40, %i1
	swap	[%l7 + %i1],	%i2
	nop
	set	0x78, %i0
	std	%f16,	[%l7 + %i0]
	set	0x50, %l0
	swapa	[%l7 + %l0] 0x88,	%g3
	st	%f24,	[%l7 + 0x2C]
	set	0x74, %l1
	stwa	%o4,	[%l7 + %l1] 0xe3
	membar	#Sync
	fpsub32s	%f0,	%f8,	%f6
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x7E, %i4
	ldsb	[%l7 + %i4],	%o6
	nop
	set	0x0C, %o7
	prefetch	[%l7 + %o7],	 0
	or	%l2,	%o7,	%i4
	nop
	set	0x74, %i5
	ldsw	[%l7 + %i5],	%l6
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x88,	%l3
	nop
	set	0x0E, %g7
	ldstub	[%l7 + %g7],	%i0
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xe3,	%g4
	nop
	set	0x66, %l2
	sth	%g7,	[%l7 + %l2]
	nop
	set	0x08, %l6
	std	%f30,	[%l7 + %l6]
	set	0x64, %g1
	stwa	%o3,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f16
	nop
	set	0x6E, %o2
	ldsh	[%l7 + %o2],	%o5
	set	0x5C, %i7
	sta	%f1,	[%l7 + %i7] 0x88
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%g4
	nop
	set	0x10, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x70, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f16
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc0
	nop
	set	0x1C, %g5
	stw	%o2,	[%l7 + %g5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%l0
	wr 	%g0, 	0x4, 	%fprs
	ld	[%l7 + 0x54],	%f1
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%l5
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%o0
	st	%f5,	[%l7 + 0x34]
	be,pn	%icc,	loop_192
	add	%g1,	%g2,	%l4
	wr	%l1,	%g6,	%pic
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i2,	%i1
loop_192:
	nop
	set	0x40, %g6
	stha	%o4,	[%l7 + %g6] 0xeb
	membar	#Sync
	fpadd32	%f22,	%f10,	%f24
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x7C, %i2
	stw	%g3,	[%l7 + %i2]
	set	0x10, %o1
	stxa	%o6,	[%l7 + %o1] 0xe3
	membar	#Sync
	or	%l2,	%i4,	%o7
	nop
	set	0x48, %l3
	ldsb	[%l7 + %l3],	%l6
	nop
	set	0x78, %l4
	std	%f24,	[%l7 + %l4]
	set	0x0B, %g4
	stba	%l3,	[%l7 + %g4] 0x81
	nop
	set	0x18, %i0
	ldsw	[%l7 + %i0],	%g5
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf1
	membar	#Sync
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x89,	%g6
	set	0x70, %i4
	prefetcha	[%l7 + %i4] 0x81,	 3
	set	0x58, %o7
	ldxa	[%l7 + %o7] 0x80,	%o5
	nop
	set	0x73, %l0
	stb	%g4,	[%l7 + %l0]
	ld	[%l7 + 0x50],	%f25
	nop
	set	0x60, %i5
	prefetch	[%l7 + %i5],	 2
	set	0x48, %g7
	sta	%f9,	[%l7 + %g7] 0x80
	and	%o2,	%i0,	%i5
	fpadd16	%f26,	%f22,	%f22
	set	0x68, %o4
	stda	%l0,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%f18
	set	0x68, %l6
	lda	[%l7 + %l6] 0x89,	%f24
	nop
	set	0x54, %g1
	swap	[%l7 + %g1],	%i7
	nop
	set	0x6E, %l2
	lduh	[%l7 + %l2],	%o1
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%i6
	st	%f6,	[%l7 + 0x5C]
	nop
	set	0x2C, %o6
	swap	[%l7 + %o6],	%l5
	nop
	set	0x64, %o3
	ldsw	[%l7 + %o3],	%i3
	set	0x18, %i7
	stda	%g0,	[%l7 + %i7] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%g2
	set	0x28, %i6
	stxa	%l4,	[%l7 + %i6] 0x80
	set	0x3B, %i3
	ldstuba	[%l7 + %i3] 0x81,	%g6
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%o4
	set	0x3D, %g5
	stba	%g3,	[%l7 + %g5] 0xeb
	membar	#Sync
	ba,pt	%xcc,	loop_193
	nop
	set	0x40, %o5
	lduh	[%l7 + %o5],	%i1
	nop
	set	0x70, %g2
	swap	[%l7 + %g2],	%o6
	nop
	set	0x6A, %g6
	lduh	[%l7 + %g6],	%i4
loop_193:
	nop
	set	0x44, %i2
	sth	%l2,	[%l7 + %i2]
	ld	[%l7 + 0x30],	%f4
	wr	%o7,	%l6,	%y
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x50, %o0
	stwa	%g5,	[%l7 + %o0] 0x88
	nop
	set	0x68, %l3
	ldub	[%l7 + %l3],	%l3
	nop
	set	0x48, %l4
	stw	%g7,	[%l7 + %l4]
	nop
	set	0x78, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x5C, %i1
	stwa	%o5,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x20, %i0
	stxa	%g4,	[%l7 + %i0] 0xeb
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%o2
	fpadd16s	%f29,	%f9,	%f8
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf1
	membar	#Sync
	set	0x4D, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i0
	nop
	set	0x4C, %l0
	prefetch	[%l7 + %l0],	 4
	st	%f10,	[%l7 + 0x18]
	fpsub32	%f14,	%f30,	%f18
	nop
	set	0x20, %o7
	stw	%i5,	[%l7 + %o7]
	nop
	set	0x19, %g7
	ldstub	[%l7 + %g7],	%i7
	set	0x60, %o4
	stwa	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x69, %l5
	stb	%o1,	[%l7 + %l5]
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x89,	%i6
	nop
	set	0x78, %g1
	lduh	[%l7 + %g1],	%i3
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x88,	%l5
	add	%g1,	%o0,	%g2
	nop
	set	0x40, %l6
	ldsh	[%l7 + %l6],	%l4
	or	%g6,	%i2,	%l1
	set	0x15, %o2
	stba	%g3,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x2C, %o3
	sta	%f17,	[%l7 + %o3] 0x88
	nop
	set	0x6C, %i7
	stw	%o4,	[%l7 + %i7]
	and	%o6,	%i4,	%i1
	st	%f21,	[%l7 + 0x44]
	fpadd32	%f30,	%f10,	%f8
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%o6
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f18
	nop
	set	0x2C, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x420, 	%tick_cmpr
	nop
	set	0x78, %i3
	std	%i6,	[%l7 + %i3]
	set	0x3B, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l3
	nop
	set	0x72, %g5
	ldsh	[%l7 + %g5],	%o5
	st	%f2,	[%l7 + 0x30]
	nop
	set	0x70, %g2
	std	%g4,	[%l7 + %g2]
	bn,a	%icc,	loop_194
	fpadd16s	%f2,	%f1,	%f4
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	nop
	setx	0x5C801F314AA2B9DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC0F598592906F599,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f28,	%f16
loop_194:
	nop
	set	0x10, %o1
	stda	%g6,	[%l7 + %o1] 0x88
	nop
	set	0x30, %o0
	std	%o2,	[%l7 + %o0]
	fpsub16s	%f15,	%f28,	%f14
	and	%o2,	%i0,	%i5
	nop
	set	0x44, %i2
	stb	%i7,	[%l7 + %i2]
	nop
	set	0x72, %l3
	ldsh	[%l7 + %l3],	%l0
	set	0x0C, %l4
	swapa	[%l7 + %l4] 0x81,	%o1
	set	0x0C, %g4
	lda	[%l7 + %g4] 0x81,	%f2
	nop
	set	0x14, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x39, %i0
	ldsb	[%l7 + %i0],	%i3
	set	0x7D, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l5
	and	%g1,	%o0,	%g2
	nop
	set	0x33, %i4
	stb	%i6,	[%l7 + %i4]
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xea,	%g6
	wr	%l4,	%i2,	%clear_softint
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xca
	nop
	set	0x41, %o4
	ldstub	[%l7 + %o4],	%l1
	st	%fsr,	[%l7 + 0x5C]
	set	0x16, %g7
	stba	%g3,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x54, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x16, %g1
	ldsh	[%l7 + %g1],	%o6
	set	0x74, %l5
	stwa	%i4,	[%l7 + %l5] 0x80
	or	%i1,	%o4,	%l2
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%g4
	or	%o7,	%l3,	%o5
	set	0x64, %o2
	swapa	[%l7 + %o2] 0x80,	%l6
	set	0x18, %o3
	stda	%g4,	[%l7 + %o3] 0x80
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%g7
	ld	[%l7 + 0x10],	%f30
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x89,	%o2
	set	0x38, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i0
	nop
	set	0x2F, %i6
	ldub	[%l7 + %i6],	%o3
	set	0x30, %i3
	stda	%i4,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x10, %g3
	sta	%f25,	[%l7 + %g3] 0x81
	nop
	set	0x78, %g5
	std	%i6,	[%l7 + %g5]
	wr	%l0,	%i3,	%y
	ld	[%l7 + 0x10],	%f9
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	or	%o1,	%l5,	%g1
	nop
	set	0x76, %o5
	sth	%o0,	[%l7 + %o5]
	or	%i6,	%g2,	%l4
	set	0x2C, %g6
	sta	%f16,	[%l7 + %g6] 0x88
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x88,	 4
	set	0x68, %i2
	stda	%l0,	[%l7 + %i2] 0x80
	nop
	set	0x18, %o1
	sth	%i2,	[%l7 + %o1]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%f0
	nop
	set	0x18, %g4
	stx	%g3,	[%l7 + %g4]
	set	0x60, %l3
	stda	%o6,	[%l7 + %l3] 0x89
	nop
	set	0x5B, %i0
	ldstub	[%l7 + %i0],	%i1
	nop
	set	0x38, %l1
	std	%f24,	[%l7 + %l1]
	set	0x58, %i4
	lda	[%l7 + %i4] 0x89,	%f23
	nop
	set	0x0B, %l0
	ldstub	[%l7 + %l0],	%o4
	set	0x3D, %i1
	stba	%i4,	[%l7 + %i1] 0x88
	nop
	set	0x40, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x2C, %g7
	sta	%f16,	[%l7 + %g7] 0x80
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g5
	add	%o7,	%l3,	%l2
	ld	[%l7 + 0x70],	%f4
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe3,	%i6
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%g4
	wr	%o5,	%g7,	%y
	set	0x40, %l2
	stxa	%o2,	[%l7 + %l2] 0x80
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x88,	%o2
	nop
	set	0x28, %o3
	std	%f26,	[%l7 + %o3]
	set	0x0C, %l6
	lda	[%l7 + %l6] 0x81,	%f16
	set	0x2C, %o2
	sta	%f11,	[%l7 + %o2] 0x81
	set	0x10, %i7
	sta	%f14,	[%l7 + %i7] 0x88
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%i0
	st	%f23,	[%l7 + 0x5C]
	and	%i5,	%l0,	%i7
	wr	%o1,	%i3,	%set_softint
	nop
	set	0x64, %i6
	stw	%g1,	[%l7 + %i6]
	or	%o0,	%l5,	%g2
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xe2,	%i6
	nop
	set	0x70, %g3
	stw	%g6,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x1C]
	set	0x50, %g2
	stda	%l0,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x7C, %o5
	lduw	[%l7 + %o5],	%i2
	nop
	set	0x53, %g5
	ldsb	[%l7 + %g5],	%g3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd0
	nop
	set	0x6E, %g6
	ldub	[%l7 + %g6],	%l4
	nop
	set	0x73, %o1
	stb	%o6,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%i1
	set	0x30, %g4
	stxa	%i4,	[%l7 + %g4] 0x81
	nop
	set	0x4C, %l4
	ldsh	[%l7 + %l4],	%o4
	nop
	set	0x28, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x48, %l1
	std	%g4,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf9,	%f0
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f8
	or	%l3,	%l2,	%l6
	bg,pn	%icc,	loop_195
	ld	[%l7 + 0x18],	%f2
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%g4
	set	0x48, %i1
	stda	%o6,	[%l7 + %i1] 0xe3
	membar	#Sync
loop_195:
	nop
	set	0x20, %o4
	stda	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f20
	set	0x1E, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o2
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%o3
	set	0x38, %l2
	stxa	%i0,	[%l7 + %l2] 0xe3
	membar	#Sync
	and	%i5,	%l0,	%i7
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%i3
	set	0x0C, %i5
	sta	%f11,	[%l7 + %i5] 0x80
	nop
	set	0x4C, %o3
	stw	%g1,	[%l7 + %o3]
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%o4
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%o0
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f16
	nop
	set	0x30, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x70, %i3
	ldsw	[%l7 + %i3],	%g2
	nop
	set	0x45, %g3
	ldub	[%l7 + %g3],	%l5
	nop
	set	0x58, %l6
	ldsw	[%l7 + %l6],	%i6
	set	0x38, %o5
	stda	%g6,	[%l7 + %o5] 0x88
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f16
	st	%f12,	[%l7 + 0x78]
	set	0x50, %o0
	stxa	%l1,	[%l7 + %o0] 0x89
	nop
	set	0x68, %g2
	std	%g2,	[%l7 + %g2]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%i2
	set	0x0C, %i2
	sta	%f24,	[%l7 + %i2] 0x81
	nop
	set	0x54, %o1
	ldsh	[%l7 + %o1],	%l4
	set	0x21, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i1
	nop
	set	0x58, %l4
	ldsw	[%l7 + %l4],	%i4
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%o4
	nop
	set	0x5E, %l1
	ldstub	[%l7 + %l1],	%g5
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f14
	and	%o6,	%l3,	%l6
	set	0x73, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g4
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x80,	%l2
	set	0x11, %l0
	ldstuba	[%l7 + %l0] 0x80,	%g7
	fpadd32	%f24,	%f20,	%f8
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%o3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xda
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%i0
	add	%i5,	%o2,	%i7
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%l0
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xea,	%o0
	set	0x68, %l2
	stxa	%i3,	[%l7 + %l2] 0x89
	nop
	set	0x74, %o3
	stw	%o5,	[%l7 + %o3]
	set	0x4C, %g1
	lda	[%l7 + %g1] 0x81,	%f24
	and	%o0,	%g1,	%l5
	nop
	set	0x48, %i5
	lduw	[%l7 + %i5],	%i6
	nop
	set	0x13, %o2
	ldub	[%l7 + %o2],	%g2
	nop
	set	0x4E, %o6
	lduh	[%l7 + %o6],	%l1
	set	0x70, %i7
	stxa	%g3,	[%l7 + %i7] 0xe3
	membar	#Sync
	bgu	%xcc,	loop_196
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f16
	nop
	set	0x50, %i3
	std	%g6,	[%l7 + %i3]
	nop
	set	0x78, %g3
	std	%l4,	[%l7 + %g3]
loop_196:
	nop
	set	0x28, %l6
	stda	%i0,	[%l7 + %l6] 0x81
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%i4
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xda
	ld	[%l7 + 0x3C],	%f21
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%o4
	ld	[%l7 + 0x60],	%f17
	add	%o6,	%l6,	%g4
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xca
	nop
	set	0x70, %g6
	stx	%l3,	[%l7 + %g6]
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x5E, %g5
	sth	%g7,	[%l7 + %g5]
	and	%o7,	%l2,	%i0
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%i4
	nop
	set	0x30, %o1
	lduw	[%l7 + %o1],	%o3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x89
	set	0x40, %l1
	lda	[%l7 + %l1] 0x88,	%f24
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x10, %i4
	lda	[%l7 + %i4] 0x89,	%f29
	set	0x46, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o2
	nop
	set	0x0A, %l3
	sth	%i7,	[%l7 + %l3]
	nop
	set	0x38, %l0
	stw	%o1,	[%l7 + %l0]
	nop
	set	0x20, %o7
	std	%f14,	[%l7 + %o7]
	fpadd32s	%f9,	%f0,	%f10
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%l0
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f10
	set	0x48, %l5
	stda	%i2,	[%l7 + %l5] 0xea
	membar	#Sync
	ld	[%l7 + 0x0C],	%f22
	wr	%o5,	%g1,	%softint
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x89,	%l4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%f0
	set	0x70, %l2
	stda	%o0,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x18, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x60, %o2
	ldsh	[%l7 + %o2],	%g2
	set	0x30, %o6
	stxa	%l1,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x5C, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x0D, %i3
	ldstub	[%l7 + %i3],	%g3
	nop
	set	0x38, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x1F, %l6
	ldub	[%l7 + %l6],	%g6
	set	0x29, %o5
	stba	%i6,	[%l7 + %o5] 0x80
	nop
	set	0x6C, %g3
	lduw	[%l7 + %g3],	%i1
	ld	[%l7 + 0x0C],	%f25
	wr	%l4,	%i4,	%y
	set	0x50, %o0
	ldxa	[%l7 + %o0] 0x81,	%g5
	add	%i2,	%o6,	%l6
	set	0x68, %g6
	stda	%o4,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%g7
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%o6
	set	0x5C, %g5
	stba	%g4,	[%l7 + %g5] 0x89
	nop
	set	0x58, %g4
	ldstub	[%l7 + %g4],	%i0
	set	0x24, %o1
	sta	%f3,	[%l7 + %o1] 0x80
	and	%l2,	%i5,	%o2
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%i6
	nop
	set	0x4A, %g2
	ldub	[%l7 + %g2],	%o3
	nop
	set	0x60, %l1
	std	%f12,	[%l7 + %l1]
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc4
	st	%fsr,	[%l7 + 0x3C]
	set	0x62, %l3
	stha	%l0,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x78, %l0
	lda	[%l7 + %l0] 0x89,	%f22
	wr	%i3,	%o5,	%clear_softint
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xcc
	nop
	set	0x68, %o7
	std	%f22,	[%l7 + %o7]
	and	%o1,	%l5,	%g1
	ld	[%l7 + 0x70],	%f10
	nop
	set	0x20, %g7
	lduw	[%l7 + %g7],	%g2
	fpadd16	%f4,	%f10,	%f4
	nop
	set	0x10, %l5
	swap	[%l7 + %l5],	%l1
	nop
	set	0x54, %o3
	ldsw	[%l7 + %o3],	%o0
	nop
	set	0x20, %o4
	swap	[%l7 + %o4],	%g3
	nop
	set	0x68, %g1
	lduh	[%l7 + %g1],	%g6
	ld	[%l7 + 0x24],	%f16
	wr	%i1,	%i6,	%ccr
	nop
	nop
	setx	0x092BBE93B32AACD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5B4FF09A76C5794F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f24,	%f16
	and	%l4,	%i4,	%g5
	nop
	set	0x67, %i5
	stb	%i2,	[%l7 + %i5]
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x89,	%o6
	st	%f9,	[%l7 + 0x54]
	nop
	set	0x50, %o6
	std	%i6,	[%l7 + %o6]
	set	0x45, %i7
	stba	%l3,	[%l7 + %i7] 0x88
	set	0x40, %i3
	ldxa	[%l7 + %i3] 0x89,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x24, %o2
	swap	[%l7 + %o2],	%i0
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x81,	%o4
	nop
	set	0x60, %i6
	stx	%i5,	[%l7 + %i6]
	st	%f17,	[%l7 + 0x28]
	nop
	set	0x47, %g3
	stb	%l2,	[%l7 + %g3]
	nop
	set	0x44, %o0
	stw	%i7,	[%l7 + %o0]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%o3
	set	0x50, %o5
	sta	%f8,	[%l7 + %o5] 0x81
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	or	%o5,	%o1,	%l0
	add	%l5,	%g2,	%g1
	nop
	set	0x20, %g6
	stx	%l1,	[%l7 + %g6]
	or	%g3,	%o0,	%g6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%l4
	nop
	nop
	setx	0xA60A8D4F8BB1B178,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xDF30749C1785CD01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f30,	%f12
	nop
	set	0x1A, %g5
	lduh	[%l7 + %g5],	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%g5
	nop
	set	0x54, %g4
	swap	[%l7 + %g4],	%o6
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	wr 	%g0, 	0x5, 	%fprs
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%o7
	add	%g7,	%g4,	%i0
	set	0x1B, %g2
	stba	%o4,	[%l7 + %g2] 0x88
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x81,	%f18
	set	0x70, %i4
	sta	%f2,	[%l7 + %i4] 0x88
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f18
	set	0x18, %l3
	stwa	%i5,	[%l7 + %l3] 0x81
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x81,	%i6
	set	0x72, %i0
	stha	%l2,	[%l7 + %i0] 0x88
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f28
	set	0x64, %g7
	stba	%o3,	[%l7 + %g7] 0x89
	set	0x50, %i1
	stda	%o2,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
	set	0x28, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	st	%f3,	[%l7 + 0x54]
	nop
	set	0x18, %g1
	swap	[%l7 + %g1],	%o1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x96E, 	%tick_cmpr
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xeb,	%g0
	nop
	set	0x78, %i5
	std	%f30,	[%l7 + %i5]
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%l0
	nop
	set	0x54, %o6
	lduw	[%l7 + %o6],	%g3
	nop
	set	0x4F, %i7
	ldstub	[%l7 + %i7],	%l1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i1
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l4
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%o0
	nop
	set	0x48, %i6
	stw	%i6,	[%l7 + %i6]
	ld	[%l7 + 0x0C],	%f21
	nop
	set	0x3C, %o2
	prefetch	[%l7 + %o2],	 0
	set	0x28, %g3
	stwa	%g5,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x28, %o5
	stx	%i4,	[%l7 + %o5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o6
	nop
	set	0x24, %o0
	stb	%i2,	[%l7 + %o0]
	nop
	set	0x30, %i2
	std	%f14,	[%l7 + %i2]
	nop
	set	0x33, %g5
	ldsb	[%l7 + %g5],	%o7
	nop
	set	0x77, %g4
	ldstub	[%l7 + %g4],	%g7
	ld	[%l7 + 0x44],	%f29
	set	0x40, %g6
	stxa	%l3,	[%l7 + %g6] 0x89
	nop
	set	0x32, %g2
	ldsh	[%l7 + %g2],	%g4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%o4
	nop
	set	0x7C, %l1
	swap	[%l7 + %l1],	%l2
	set	0x28, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o3
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%o2
	set	0x68, %i4
	stda	%i2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x30, %l0
	stba	%o5,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x88,	%o1
	set	0x78, %o7
	sta	%f8,	[%l7 + %o7] 0x81
	or	%g2,	%g1,	%l5
	set	0x0F, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f0
	nop
	set	0x60, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x1A, %o4
	ldstub	[%l7 + %o4],	%l1
	set	0x5C, %g1
	stha	%g6,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x46, %l3
	lduh	[%l7 + %l3],	%i1
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x3A, %l2
	lduh	[%l7 + %l2],	%l0
	nop
	set	0x16, %l5
	ldsh	[%l7 + %l5],	%l4
	ld	[%l7 + 0x24],	%f15
	nop
	set	0x20, %i7
	stx	%o0,	[%l7 + %i7]
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%g5
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x80,	%i6
	st	%f9,	[%l7 + 0x18]
	nop
	set	0x60, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x89,	%l6
	nop
	set	0x24, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x08, %o5
	stxa	%i4,	[%l7 + %o5] 0x89
	nop
	set	0x50, %g3
	ldsw	[%l7 + %g3],	%o6
	nop
	set	0x16, %o0
	ldsb	[%l7 + %o0],	%o7
	set	0x44, %g5
	sta	%f20,	[%l7 + %g5] 0x88
	nop
	set	0x70, %i2
	swap	[%l7 + %i2],	%i2
	set	0x46, %g4
	stha	%g7,	[%l7 + %g4] 0xe3
	membar	#Sync
	or	%l3,	%g4,	%i0
	or	%i5,	%i7,	%l2
	nop
	set	0x08, %g2
	stw	%o4,	[%l7 + %g2]
	set	0x78, %l1
	sta	%f28,	[%l7 + %l1] 0x81
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x80
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x88,	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%i3
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f24
	set	0x50, %g6
	stda	%o0,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x13, %l0
	ldub	[%l7 + %l0],	%o5
	nop
	set	0x10, %o7
	ldsb	[%l7 + %o7],	%g1
	bleu,pt	%icc,	loop_197
	nop
	set	0x68, %g7
	ldsb	[%l7 + %g7],	%l5
	nop
	set	0x7C, %i1
	lduw	[%l7 + %i1],	%g2
	or	%g3,	%l1,	%g6
loop_197:
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%l0
	nop
	set	0x74, %o4
	sth	%i1,	[%l7 + %o4]
	set	0x0C, %g1
	lda	[%l7 + %g1] 0x89,	%f3
	set	0x4E, %o3
	stha	%l4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x10, %l3
	lduh	[%l7 + %l3],	%g5
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x4C, %l5
	sth	%i6,	[%l7 + %l5]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%i4
	nop
	set	0x38, %i5
	stx	%l6,	[%l7 + %i5]
	add	%o6,	%o7,	%g7
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%i2
	nop
	set	0x11, %o6
	ldub	[%l7 + %o6],	%l3
	nop
	set	0x17, %l6
	ldub	[%l7 + %l6],	%g4
	set	0x78, %o2
	lda	[%l7 + %o2] 0x88,	%f12
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%i0
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x80,	%i5
	nop
	set	0x50, %g3
	stw	%i7,	[%l7 + %g3]
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%o4
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%o3
	nop
	set	0x5D, %g4
	stb	%l2,	[%l7 + %g4]
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	ble,a,pn	%xcc,	loop_198
	nop
	set	0x20, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%i3,	%o1,	%o2
	nop
	set	0x14, %o1
	ldsw	[%l7 + %o1],	%o5
loop_198:
	nop
	set	0x78, %l1
	lda	[%l7 + %l1] 0x88,	%f17
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%g0
	nop
	set	0x28, %g6
	stw	%g2,	[%l7 + %g6]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x88
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x81,	 2
	nop
	set	0x40, %g7
	std	%f24,	[%l7 + %g7]
	nop
	set	0x5E, %l0
	ldsb	[%l7 + %l0],	%l0
	set	0x68, %i0
	stda	%i0,	[%l7 + %i0] 0x81
	set	0x48, %i1
	swapa	[%l7 + %i1] 0x81,	%l4
	or	%g5,	%l5,	%i6
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	or	%i4,	%l6,	%o0
	wr	%o7,	%g7,	%ccr
	nop
	set	0x6C, %o3
	ldub	[%l7 + %o3],	%i2
	st	%f25,	[%l7 + 0x4C]
	set	0x10, %g1
	ldda	[%l7 + %g1] 0xe2,	%l2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o6
	set	0x5C, %l3
	lda	[%l7 + %l3] 0x80,	%f0
	nop
	set	0x38, %l5
	stw	%i5,	[%l7 + %l5]
	set	0x20, %l2
	sta	%f4,	[%l7 + %l2] 0x88
	nop
	set	0x44, %i7
	stw	%i0,	[%l7 + %i7]
	nop
	set	0x08, %o6
	swap	[%l7 + %o6],	%i7
	nop
	set	0x48, %i5
	stx	%o4,	[%l7 + %i5]
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x68, %l6
	stwa	%o3,	[%l7 + %l6] 0x88
	set	0x74, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l2
	nop
	set	0x08, %i3
	ldsw	[%l7 + %i3],	%o1
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	or	%i3,	%o2,	%g1
	st	%f0,	[%l7 + 0x24]
	st	%f16,	[%l7 + 0x44]
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f16
	set	0x30, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g2
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f16
	set	0x54, %g4
	lda	[%l7 + %g4] 0x89,	%f11
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%g3
	nop
	set	0x68, %o1
	std	%f6,	[%l7 + %o1]
	add	%l1,	%o5,	%l0
	set	0x60, %o0
	stda	%i0,	[%l7 + %o0] 0x80
	nop
	set	0x28, %l1
	ldsw	[%l7 + %l1],	%l4
	wr	%g5,	%l5,	%softint
	nop
	set	0x38, %l4
	stx	%i6,	[%l7 + %l4]
	nop
	set	0x48, %g6
	sth	%g6,	[%l7 + %g6]
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%l6
	and	%o0,	%i4,	%o7
	nop
	set	0x7C, %g7
	ldsh	[%l7 + %g7],	%i2
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%l3
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%g7
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%o6
	set	0x17, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g4
	ba	%xcc,	loop_199
	nop
	set	0x5E, %o3
	lduh	[%l7 + %o3],	%i5
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe2,	%i0
loop_199:
	nop
	set	0x68, %o7
	ldub	[%l7 + %o7],	%o4
	nop
	set	0x18, %l3
	prefetch	[%l7 + %l3],	 4
	st	%f5,	[%l7 + 0x68]
	ld	[%l7 + 0x60],	%f21
	st	%fsr,	[%l7 + 0x68]
	wr	%o3,	%l2,	%sys_tick
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%o1
	ld	[%l7 + 0x10],	%f12
	set	0x28, %i7
	stxa	%i3,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x5C, %o6
	sta	%f31,	[%l7 + %o6] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%g2
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x80,	%g3
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%o2
	or	%o5,	%l1,	%l0
	set	0x50, %i5
	stha	%i1,	[%l7 + %i5] 0x80
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f30
	set	0x20, %i3
	sta	%f16,	[%l7 + %i3] 0x80
	nop
	set	0x68, %l6
	stw	%g5,	[%l7 + %l6]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf8
	membar	#Sync
	nop
	set	0x18, %o5
	ldsh	[%l7 + %o5],	%l5
	nop
	set	0x08, %i2
	lduh	[%l7 + %i2],	%i6
	ba,pn	%icc,	loop_200
	nop
	set	0x5C, %g4
	lduw	[%l7 + %g4],	%g6
	nop
	set	0x54, %g5
	swap	[%l7 + %g5],	%l4
	st	%fsr,	[%l7 + 0x20]
loop_200:
	nop
	set	0x1B, %o1
	ldsb	[%l7 + %o1],	%l6
	st	%f18,	[%l7 + 0x14]
	set	0x10, %o0
	stxa	%o0,	[%l7 + %o0] 0x80
	add	%o7,	%i4,	%l3
	set	0x08, %g2
	stxa	%g7,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x40, %l4
	stba	%o6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%g4
	fpadd32s	%f4,	%f17,	%f24
	ld	[%l7 + 0x18],	%f27
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x80,	%i2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	set	0x74, %l0
	sta	%f3,	[%l7 + %l0] 0x88
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x80,	%i4
	or	%o4,	%i0,	%l2
	ld	[%l7 + 0x3C],	%f22
	nop
	set	0x3F, %i1
	stb	%o3,	[%l7 + %i1]
	nop
	set	0x40, %o4
	std	%f30,	[%l7 + %o4]
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x89,	 4
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%o1
	wr	%g1,	%i3,	%clear_softint
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x78, %o7
	stxa	%g2,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x30, %l3
	stxa	%o2,	[%l7 + %l3] 0x88
	nop
	set	0x78, %i7
	std	%f8,	[%l7 + %i7]
	add	%o5,	%g3,	%l0
	nop
	set	0x50, %l5
	stx	%l1,	[%l7 + %l5]
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%i1
	or	%g5,	%i6,	%l5
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%g6
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%l4
	set	0x28, %i5
	stxa	%o0,	[%l7 + %i5] 0x81
	or	%l6,	%o7,	%i4
	set	0x40, %i6
	stwa	%l3,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x14, %l6
	lduh	[%l7 + %l6],	%o6
	st	%f13,	[%l7 + 0x54]
	set	0x48, %i3
	sta	%f8,	[%l7 + %i3] 0x80
	nop
	set	0x40, %g3
	stw	%g7,	[%l7 + %g3]
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x81,	%i2
	and	%i5,	%g4,	%i0
	set	0x24, %g4
	lda	[%l7 + %g4] 0x81,	%f7
	nop
	set	0x40, %g5
	sth	%o4,	[%l7 + %g5]
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%o3
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%i6
	add	%o1,	%l2,	%g1
	set	0x72, %g2
	stba	%i3,	[%l7 + %g2] 0x81
	set	0x3C, %l4
	swapa	[%l7 + %l4] 0x81,	%g2
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%o2
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x5C, %o5
	sta	%f25,	[%l7 + %o5] 0x80
	nop
	set	0x43, %l1
	ldstub	[%l7 + %l1],	%g3
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x68]
	set	0x48, %l0
	stha	%l0,	[%l7 + %l0] 0x80
	bleu,a	%icc,	loop_201
	and	%l1,	%i1,	%g5
	st	%f18,	[%l7 + 0x38]
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%i6
loop_201:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o5
	or	%g6,	%o0,	%l6
	nop
	set	0x76, %o3
	ldsh	[%l7 + %o3],	%l4
	set	0x21, %o4
	stba	%o7,	[%l7 + %o4] 0x80
	nop
	set	0x60, %g1
	ldub	[%l7 + %g1],	%i4
	nop
	set	0x76, %g7
	sth	%l3,	[%l7 + %g7]
	wr	%o6,	%i2,	%sys_tick
	set	0x6D, %l3
	ldstuba	[%l7 + %l3] 0x88,	%g7
	nop
	set	0x0C, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x34, %l5
	stwa	%i5,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	add	%g4,	%o4,	%o3
	wr	%i7,	%o1,	%sys_tick
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%i0,	%g1,	%l2
	bn	%xcc,	loop_202
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x08, %l2
	std	%g2,	[%l7 + %l2]
	and	%o2,	%g3,	%i3
loop_202:
	nop
	set	0x74, %i5
	swap	[%l7 + %i5],	%l0
	set	0x40, %i6
	stxa	%i1,	[%l7 + %i6] 0x89
	set	0x78, %o2
	lda	[%l7 + %o2] 0x89,	%f19
	nop
	set	0x28, %i3
	stw	%l1,	[%l7 + %i3]
	ld	[%l7 + 0x3C],	%f26
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%i6
	wr 	%g0, 	0x5, 	%fprs
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x88,	%o0
	nop
	set	0x28, %o1
	stb	%l6,	[%l7 + %o1]
	nop
	set	0x2E, %o0
	ldstub	[%l7 + %o0],	%l4
	wr 	%g0, 	0x7, 	%fprs
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	nop
	set	0x38, %g2
	std	%f2,	[%l7 + %g2]
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%i4
	fpadd16s	%f4,	%f1,	%f19
	nop
	set	0x70, %i4
	std	%l2,	[%l7 + %i4]
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%i2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ld	[%l7 + 0x4C],	%f20
	add	%g4,	%o4,	%o3
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x81,	%i7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f0
	bn,pt	%xcc,	loop_203
	or	%o1,	%i5,	%g1
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	fpsub32s	%f8,	%f16,	%f20
loop_203:
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%l2
	set	0x74, %g6
	sta	%f31,	[%l7 + %g6] 0x88
	set	0x70, %o4
	stda	%i0,	[%l7 + %o4] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%o2
	nop
	set	0x48, %g1
	std	%g2,	[%l7 + %g1]
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f30
	nop
	set	0x5A, %l3
	sth	%i3,	[%l7 + %l3]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf0
	membar	#Sync
	nop
	set	0x48, %l5
	std	%f22,	[%l7 + %l5]
	set	0x50, %o3
	ldda	[%l7 + %o3] 0xea,	%l0
	set	0x42, %o7
	stha	%l1,	[%l7 + %o7] 0x88
	set	0x38, %o6
	stda	%g4,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%i0
	nop
	set	0x14, %i6
	stw	%i6,	[%l7 + %i6]
	set	0x36, %o2
	stha	%o5,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x0C, %i3
	swap	[%l7 + %i3],	%o0
	st	%f20,	[%l7 + 0x08]
	nop
	set	0x74, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x0E, %g3
	lduh	[%l7 + %g3],	%l6
	nop
	set	0x62, %g4
	ldsb	[%l7 + %g4],	%l5
	nop
	set	0x58, %l6
	ldsw	[%l7 + %l6],	%l4
	st	%f13,	[%l7 + 0x50]
	nop
	set	0x78, %i2
	lduh	[%l7 + %i2],	%g6
	set	0x68, %o1
	stxa	%o7,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x18, %o0
	sth	%l3,	[%l7 + %o0]
	nop
	set	0x63, %g2
	stb	%i4,	[%l7 + %g2]
	and	%o6,	%g7,	%i2
	nop
	set	0x70, %l4
	stx	%g4,	[%l7 + %l4]
	nop
	set	0x50, %i4
	ldstub	[%l7 + %i4],	%o3
	bn,pn	%icc,	loop_204
	or	%o4,	%i7,	%o1
	bleu,a,pt	%xcc,	loop_205
	nop
	set	0x78, %g5
	prefetch	[%l7 + %g5],	 0
loop_204:
	nop
	set	0x0E, %o5
	ldsh	[%l7 + %o5],	%i5
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf0
	membar	#Sync
loop_205:
	wr	%g1,	%i0,	%y
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%l2
	nop
	set	0x50, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x5A, %g6
	sth	%g2,	[%l7 + %g6]
	or	%g3,	%o2,	%l0
	nop
	set	0x54, %l0
	ldsw	[%l7 + %l0],	%i3
	nop
	set	0x70, %g1
	ldub	[%l7 + %g1],	%l1
	set	0x64, %g7
	stba	%g5,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%i6
	be	%icc,	loop_206
	nop
	set	0x6E, %i7
	lduh	[%l7 + %i7],	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%l6
loop_206:
	nop
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f16
	nop
	set	0x64, %o3
	stw	%l5,	[%l7 + %o3]
	fpadd16	%f18,	%f28,	%f2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xe3,	%o0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%o7
	nop
	set	0x28, %o7
	std	%g6,	[%l7 + %o7]
	nop
	nop
	setx	0x3927BADA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC0828A2C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f4,	%f9
	nop
	set	0x54, %o6
	ldsh	[%l7 + %o6],	%l3
	nop
	set	0x64, %i6
	ldsw	[%l7 + %i6],	%o6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc2
	set	0x66, %o2
	stba	%g7,	[%l7 + %o2] 0x81
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x89,	 3
	or	%i4,	%g4,	%o4
	set	0x40, %l2
	stda	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x30, %g4
	stw	%o3,	[%l7 + %g4]
	add	%i5,	%o1,	%i0
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x81,	 0
	nop
	set	0x6E, %g3
	ldub	[%l7 + %g3],	%g2
	set	0x08, %o1
	swapa	[%l7 + %o1] 0x89,	%g3
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x80,	%g0
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd8,	%f16
	nop
	set	0x48, %g2
	stx	%o2,	[%l7 + %g2]
	fpadd32s	%f17,	%f19,	%f30
	ld	[%l7 + 0x78],	%f8
	set	0x78, %i4
	stwa	%i3,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x70, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x74, %o5
	swapa	[%l7 + %o5] 0x88,	%l1
	or	%g5,	%l0,	%o5
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%i6
	nop
	nop
	setx	0xEAD44AA3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x4C8B8FBE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f16,	%f12
	set	0x34, %l4
	stwa	%i1,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x10, %l1
	stxa	%l5,	[%l7 + %l1] 0x80
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%l4
	st	%fsr,	[%l7 + 0x28]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%g6
	nop
	set	0x6A, %i1
	ldsh	[%l7 + %i1],	%l6
	and	%l3,	%g7,	%i2
	nop
	set	0x48, %g6
	swap	[%l7 + %g6],	%o6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc0
	nop
	set	0x22, %l0
	ldub	[%l7 + %l0],	%i4
	nop
	set	0x74, %o4
	prefetch	[%l7 + %o4],	 4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%g4
	add	%i7,	%o3,	%i5
	set	0x54, %i7
	sta	%f11,	[%l7 + %i7] 0x80
	set	0x45, %l3
	ldstuba	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x3C, %g7
	swap	[%l7 + %g7],	%l2
	set	0x09, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o1
	nop
	set	0x10, %l5
	stx	%g3,	[%l7 + %l5]
	set	0x28, %o7
	stda	%g0,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x30, %o6
	stba	%o2,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x80,	%i2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	nop
	set	0x70, %i3
	ldsh	[%l7 + %i3],	%g2
	nop
	set	0x28, %i5
	stw	%g5,	[%l7 + %i5]
	nop
	set	0x5A, %g4
	ldub	[%l7 + %g4],	%l1
	nop
	set	0x10, %l6
	std	%o4,	[%l7 + %l6]
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%l0
	nop
	set	0x10, %o1
	ldsb	[%l7 + %o1],	%i1
	nop
	set	0x28, %l2
	ldsw	[%l7 + %l2],	%l5
	nop
	set	0x68, %o0
	swap	[%l7 + %o0],	%o0
	set	0x18, %i2
	lda	[%l7 + %i2] 0x81,	%f7
	nop
	set	0x78, %i4
	sth	%i6,	[%l7 + %i4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%o7
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x3C, %g2
	swap	[%l7 + %g2],	%g6
	bn,a,pt	%xcc,	loop_207
	nop
	set	0x50, %o5
	ldx	[%l7 + %o5],	%l3
	and	%l6,	%g7,	%i2
	set	0x39, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o6
loop_207:
	st	%f1,	[%l7 + 0x58]
	nop
	set	0x60, %l4
	std	%f24,	[%l7 + %l4]
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xe3,	%i4
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%o4
	bn,a	%xcc,	loop_208
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x89,	 4
loop_208:
	nop
	set	0x48, %l0
	stw	%o3,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x60]
	ld	[%l7 + 0x58],	%f10
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%i4
	nop
	set	0x4B, %i7
	ldub	[%l7 + %i7],	%g4
	ld	[%l7 + 0x50],	%f13
	ble	%xcc,	loop_209
	nop
	set	0x50, %l3
	stx	%i0,	[%l7 + %l3]
	set	0x34, %g7
	lda	[%l7 + %g7] 0x88,	%f19
loop_209:
	nop
	set	0x40, %o4
	ldsb	[%l7 + %o4],	%l2
	nop
	set	0x28, %o3
	stx	%o1,	[%l7 + %o3]
	ld	[%l7 + 0x64],	%f15
	nop
	set	0x6C, %l5
	prefetch	[%l7 + %l5],	 0
	ld	[%l7 + 0x38],	%f25
	set	0x1C, %o6
	stwa	%g1,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x14, %o7
	stw	%g3,	[%l7 + %o7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%g2
	nop
	set	0x1D, %o2
	ldub	[%l7 + %o2],	%g5
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x89,	%l1
	set	0x78, %i5
	stxa	%o5,	[%l7 + %i5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x24],	%f30
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f4
	add	%i3,	%i1,	%l0
	set	0x70, %l6
	stha	%o0,	[%l7 + %l6] 0x89
	wr	%i6,	%l4,	%set_softint
	add	%o7,	%g6,	%l5
	st	%f6,	[%l7 + 0x30]
	and	%l3,	%l6,	%g7
	set	0x18, %i3
	sta	%f16,	[%l7 + %i3] 0x88
	nop
	set	0x10, %o1
	lduw	[%l7 + %o1],	%o6
	nop
	set	0x5C, %l2
	lduw	[%l7 + %l2],	%i4
	set	0x08, %g3
	stba	%i2,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x20, %o0
	stxa	%i7,	[%l7 + %o0] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	add	%o3,	%i5,	%g4
	or	%o4,	%i0,	%l2
	and	%g1,	%g3,	%o1
	fpadd32	%f28,	%f12,	%f0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%f0
	nop
	set	0x34, %o5
	stw	%o2,	[%l7 + %o5]
	nop
	set	0x38, %i0
	prefetch	[%l7 + %i0],	 0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xeb,	%g4
	set	0x28, %g2
	stda	%g2,	[%l7 + %g2] 0x89
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xeb,	%l0
	set	0x30, %g1
	stda	%o4,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x30, %l0
	lda	[%l7 + %l0] 0x88,	%f7
	set	0x20, %l1
	stxa	%i1,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x10, %i7
	stx	%l0,	[%l7 + %i7]
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%i3
	set	0x58, %g7
	stda	%o0,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x2C, %o4
	stba	%i6,	[%l7 + %o4] 0x89
	nop
	set	0x2A, %o3
	lduh	[%l7 + %o3],	%l4
	or	%o7,	%l5,	%g6
	set	0x20, %g6
	swapa	[%l7 + %g6] 0x89,	%l3
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x89,	%l6
	nop
	set	0x21, %o6
	ldub	[%l7 + %o6],	%o6
	nop
	set	0x4A, %o2
	ldsb	[%l7 + %o2],	%g7
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%i2
	st	%f12,	[%l7 + 0x70]
	st	%f0,	[%l7 + 0x60]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%i4
	nop
	set	0x7A, %i5
	ldub	[%l7 + %i5],	%i5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf8
	membar	#Sync
	nop
	set	0x6C, %o7
	lduw	[%l7 + %o7],	%g4
	nop
	set	0x54, %i3
	ldsb	[%l7 + %i3],	%o3
	nop
	set	0x7C, %l6
	lduw	[%l7 + %l6],	%o4
	ba,pn	%icc,	loop_210
	add	%i0,	%l2,	%g3
	add	%g1,	%o2,	%o1
	ld	[%l7 + 0x78],	%f4
loop_210:
	add	%g5,	%g2,	%o5
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x88,	 0
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xeb,	%l0
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x80,	%i3
	nop
	set	0x14, %o1
	sth	%o0,	[%l7 + %o1]
	set	0x70, %i2
	sta	%f20,	[%l7 + %i2] 0x80
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%i6
	set	0x08, %i4
	swapa	[%l7 + %i4] 0x89,	%l1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%l4
	and	%l5,	%o7,	%l3
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x80,	 2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%g7
	nop
	set	0x10, %g5
	stw	%i2,	[%l7 + %g5]
	nop
	set	0x54, %i1
	swap	[%l7 + %i1],	%i7
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	fpadd32s	%f14,	%f19,	%f1
	set	0x48, %l0
	stha	%i5,	[%l7 + %l0] 0x80
	wr	%g4,	%g6,	%clear_softint
	set	0x28, %l1
	lda	[%l7 + %l1] 0x89,	%f5
	set	0x08, %i7
	stda	%o4,	[%l7 + %i7] 0x88
	set	0x53, %l3
	ldstuba	[%l7 + %l3] 0x80,	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%l2
	ld	[%l7 + 0x68],	%f17
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x80,	%g3
	nop
	set	0x13, %o4
	ldstub	[%l7 + %o4],	%o2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f16
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x6C, %g6
	swap	[%l7 + %g6],	%g1
	nop
	set	0x78, %o6
	ldsw	[%l7 + %o6],	%g5
	nop
	set	0x08, %o2
	std	%f22,	[%l7 + %o2]
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	nop
	set	0x50, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x5A, %l5
	sth	%o1,	[%l7 + %l5]
	nop
	set	0x68, %o7
	lduh	[%l7 + %o7],	%i1
	nop
	set	0x34, %g4
	ldsw	[%l7 + %g4],	%o5
	nop
	set	0x78, %l6
	stx	%l0,	[%l7 + %l6]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%o0
	set	0x60, %g3
	stda	%i6,	[%l7 + %g3] 0x80
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i2
	nop
	set	0x32, %o0
	sth	%l1,	[%l7 + %o0]
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x34, %o5
	sth	%l5,	[%l7 + %o5]
	nop
	set	0x40, %o1
	ldsw	[%l7 + %o1],	%o7
	nop
	set	0x6C, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x80,	 2
	nop
	set	0x2C, %g5
	lduw	[%l7 + %g5],	%l4
	set	0x11, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l6
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x89,	 3
	nop
	set	0x30, %l0
	swap	[%l7 + %l0],	%i2
	nop
	set	0x58, %l4
	std	%o6,	[%l7 + %l4]
	set	0x3C, %l1
	stwa	%i7,	[%l7 + %l1] 0x88
	ld	[%l7 + 0x6C],	%f2
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f16
	set	0x1D, %g1
	stba	%i5,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x28, %l3
	stxa	%i4,	[%l7 + %l3] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%g6
	nop
	set	0x38, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x50, %g7
	std	%o2,	[%l7 + %g7]
	nop
	set	0x70, %g6
	stb	%i0,	[%l7 + %g6]
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%l2
	set	0x1E, %o3
	stba	%g3,	[%l7 + %o3] 0x88
	nop
	set	0x5C, %o2
	swap	[%l7 + %o2],	%o4
	nop
	set	0x0F, %i6
	stb	%o2,	[%l7 + %i6]
	set	0x44, %l5
	stwa	%g5,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x18, %o7
	ldxa	[%l7 + %o7] 0x88,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%g1
	nop
	set	0x7C, %i5
	swap	[%l7 + %i5],	%i1
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f16
	set	0x3B, %g4
	stba	%l0,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x18, %l2
	stda	%o0,	[%l7 + %l2] 0x81
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%i6
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f2
	set	0x74, %i2
	sta	%f31,	[%l7 + %i2] 0x81
	nop
	set	0x56, %i3
	ldsb	[%l7 + %i3],	%o5
	set	0x3C, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%l5
	and	%o7,	%l4,	%l6
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xd8
	nop
	set	0x3D, %o1
	ldub	[%l7 + %o1],	%g7
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x54, %i4
	swapa	[%l7 + %i4] 0x88,	%l3
	nop
	set	0x26, %g2
	ldsh	[%l7 + %g2],	%i2
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f0
	nop
	set	0x3C, %l4
	swap	[%l7 + %l4],	%i7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o6
	nop
	set	0x3E, %i1
	lduh	[%l7 + %i1],	%i4
	nop
	set	0x38, %i7
	stw	%g6,	[%l7 + %i7]
	and	%o3,	%i0,	%l2
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%g4
	or	%g3,	%o2,	%o4
	nop
	set	0x58, %l3
	std	%f14,	[%l7 + %l3]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%g2
	st	%fsr,	[%l7 + 0x58]
	set	0x64, %o4
	lda	[%l7 + %o4] 0x80,	%f23
	bl,pn	%xcc,	loop_211
	nop
	set	0x78, %g1
	stx	%o1,	[%l7 + %g1]
	set	0x68, %g7
	stba	%g1,	[%l7 + %g7] 0x88
loop_211:
	nop
	set	0x2C, %o6
	stw	%l0,	[%l7 + %o6]
	nop
	set	0x5E, %o3
	sth	%i1,	[%l7 + %o3]
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xeb,	%o0
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%i6
	or	%i3,	%o5,	%l5
	nop
	set	0x18, %o2
	stw	%l1,	[%l7 + %o2]
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	nop
	set	0x5C, %o7
	lduw	[%l7 + %o7],	%l4
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x81,	 1
	nop
	set	0x48, %i5
	std	%l2,	[%l7 + %i5]
	set	0x30, %l2
	stda	%i2,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x18, %g4
	stx	%l6,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x40, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x70, %i2
	stwa	%i7,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x78, %i3
	stda	%i4,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 4
	nop
	set	0x44, %g3
	ldstub	[%l7 + %g3],	%o6
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x88,	%i4
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x20, %g5
	std	%g6,	[%l7 + %g5]
	nop
	set	0x70, %g2
	stw	%i0,	[%l7 + %g2]
	set	0x0A, %l0
	stha	%l2,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x08, %l4
	stwa	%g3,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x0E, %i1
	lduh	[%l7 + %i1],	%g4
	set	0x6C, %i4
	swapa	[%l7 + %i4] 0x88,	%o2
	nop
	set	0x50, %l1
	lduw	[%l7 + %l1],	%o4
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f0
	and	%g5,	%g2,	%o1
	add	%l0,	%i1,	%o0
	fpsub16	%f24,	%f0,	%f26
	fpsub32s	%f9,	%f4,	%f7
	nop
	set	0x28, %i7
	ldsw	[%l7 + %i7],	%i6
	and	%g1,	%i3,	%o5
	nop
	set	0x50, %o4
	stw	%l1,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x2C]
	set	0x64, %g1
	stha	%l5,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%g7
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f24
	set	0x4E, %g7
	stba	%i2,	[%l7 + %g7] 0x80
	nop
	set	0x66, %i6
	sth	%l6,	[%l7 + %i6]
	set	0x10, %g6
	sta	%f12,	[%l7 + %g6] 0x88
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	nop
	set	0x7C, %o7
	stw	%i5,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x70, %l6
	swap	[%l7 + %l6],	%l3
	nop
	set	0x5C, %l5
	swap	[%l7 + %l5],	%i4
	set	0x78, %l2
	sta	%f8,	[%l7 + %l2] 0x89
	st	%f19,	[%l7 + 0x38]
	and	%o6,	%g6,	%i0
	and	%o3,	%g3,	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o4
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x81,	 4
	ld	[%l7 + 0x34],	%f20
	and	%o2,	%g2,	%l0
	set	0x10, %o0
	ldxa	[%l7 + %o0] 0x81,	%i1
	set	0x67, %i2
	stba	%o1,	[%l7 + %i2] 0x81
	nop
	set	0x6E, %i3
	ldsb	[%l7 + %i3],	%o0
	fpadd16s	%f26,	%f14,	%f17
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%i3
	or	%i6,	%l1,	%o5
	nop
	set	0x38, %o5
	ldx	[%l7 + %o5],	%l5
	nop
	set	0x4C, %g3
	ldsw	[%l7 + %g3],	%o7
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd8
	nop
	set	0x7C, %i0
	ldsb	[%l7 + %i0],	%g7
	set	0x53, %g5
	stba	%i2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%i6
	set	0x18, %o1
	stda	%i6,	[%l7 + %o1] 0x88
	nop
	set	0x34, %i1
	ldstub	[%l7 + %i1],	%l3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1256
!	Type a   	: 35
!	Type cti   	: 28
!	Type x   	: 520
!	Type f   	: 37
!	Type i   	: 124
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
	set	0xB,	%g1
	set	0x3,	%g2
	set	0x2,	%g3
	set	0xA,	%g4
	set	0xE,	%g5
	set	0x5,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xD,	%i1
	set	-0xC,	%i2
	set	-0xC,	%i3
	set	-0x7,	%i4
	set	-0x8,	%i5
	set	-0x8,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x21CA72D6,	%l0
	set	0x600DF9C4,	%l1
	set	0x56D29540,	%l2
	set	0x539147F0,	%l3
	set	0x2C64C25D,	%l4
	set	0x072D63B2,	%l5
	set	0x4A485645,	%l6
	!# Output registers
	set	-0x008C,	%o0
	set	-0x17DB,	%o1
	set	0x0915,	%o2
	set	0x0185,	%o3
	set	-0x008D,	%o4
	set	0x07E2,	%o5
	set	-0x0FA1,	%o6
	set	0x1D40,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x88E8C192F8C3F173)
	INIT_TH_FP_REG(%l7,%f2,0x41AA1ACAABB17471)
	INIT_TH_FP_REG(%l7,%f4,0x500900D6811640AC)
	INIT_TH_FP_REG(%l7,%f6,0x7CAA46C5C2E1540B)
	INIT_TH_FP_REG(%l7,%f8,0xCDFD1AA425D042E3)
	INIT_TH_FP_REG(%l7,%f10,0xFCBD553F3BD4DE0F)
	INIT_TH_FP_REG(%l7,%f12,0x4016AB90B467F443)
	INIT_TH_FP_REG(%l7,%f14,0x5F5FB01A0D599B87)
	INIT_TH_FP_REG(%l7,%f16,0x7AB1EAD43EE70404)
	INIT_TH_FP_REG(%l7,%f18,0x9FD9894C32A9FAE2)
	INIT_TH_FP_REG(%l7,%f20,0x18F854569CC7511A)
	INIT_TH_FP_REG(%l7,%f22,0x53EDCAB472CC375F)
	INIT_TH_FP_REG(%l7,%f24,0x8D0D9E4E5BA5457E)
	INIT_TH_FP_REG(%l7,%f26,0x4379758F8B08FEA6)
	INIT_TH_FP_REG(%l7,%f28,0xBAE906FCDD427C3B)
	INIT_TH_FP_REG(%l7,%f30,0xDAC8B00E29250D0A)

	!# Execute Main Diag ..

	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%i4
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f6
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%o6
	nop
	set	0x38, %i7
	stx	%g6,	[%l7 + %i7]
	nop
	set	0x78, %o4
	stw	%i4,	[%l7 + %o4]
	set	0x58, %g1
	stxa	%o3,	[%l7 + %g1] 0x80
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x81,	%g3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%l2
	nop
	set	0x78, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f26
	st	%f17,	[%l7 + 0x68]
	and	%g4,	%o4,	%g5
	nop
	set	0x48, %i6
	prefetch	[%l7 + %i6],	 4
	nop
	set	0x38, %o3
	lduh	[%l7 + %o3],	%o2
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%f30
	set	0x7C, %o7
	sta	%f10,	[%l7 + %o7] 0x81
	fpadd32	%f22,	%f16,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%i1
	set	0x68, %l6
	stxa	%l0,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x46, %o2
	stha	%o1,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x18, %l2
	prefetcha	[%l7 + %l2] 0x89,	 4
	nop
	set	0x36, %l5
	lduh	[%l7 + %l5],	%i3
	set	0x0D, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g1
	nop
	set	0x72, %o0
	lduh	[%l7 + %o0],	%l1
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x89,	 1
	nop
	set	0x44, %o5
	stb	%o5,	[%l7 + %o5]
	set	0x70, %g3
	lda	[%l7 + %g3] 0x80,	%f28
	nop
	set	0x28, %i5
	ldsb	[%l7 + %i5],	%l5
	st	%fsr,	[%l7 + 0x64]
	and	%g7,	%o7,	%l4
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%l3
	nop
	set	0x65, %g5
	stb	%i7,	[%l7 + %g5]
	fpsub16s	%f12,	%f11,	%f27
	fpadd32	%f16,	%f8,	%f4
	and	%i5,	%g6,	%i4
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%o2
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f16
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%o6,	%g3,	%l2
	nop
	set	0x4C, %i1
	swap	[%l7 + %i1],	%i0
	or	%o4,	%g5,	%g4
	nop
	set	0x2C, %o1
	ldub	[%l7 + %o1],	%o2
	add	%i1,	%g2,	%l0
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x24, %l4
	stw	%o0,	[%l7 + %l4]
	bl,pt	%xcc,	loop_212
	bn	%xcc,	loop_213
	and	%i3,	%o1,	%g1
	nop
	set	0x3E, %l1
	stb	%i6,	[%l7 + %l1]
loop_212:
	nop
	set	0x72, %i7
	stba	%l1,	[%l7 + %i7] 0x81
loop_213:
	ld	[%l7 + 0x64],	%f8
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f16
	nop
	set	0x66, %o4
	ldsb	[%l7 + %o4],	%o5
	set	0x78, %o6
	stha	%l5,	[%l7 + %o6] 0xe3
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x88,	%g7,	%l4
	nop
	set	0x48, %g1
	lduw	[%l7 + %g1],	%o7
	nop
	set	0x79, %g7
	ldsb	[%l7 + %g7],	%l6
	set	0x10, %l3
	stxa	%i2,	[%l7 + %l3] 0xe3
	membar	#Sync
	or	%i7,	%l3,	%g6
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	add	%i5,	%i4,	%o6
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f10
	nop
	set	0x7C, %o7
	sth	%g3,	[%l7 + %o7]
	nop
	set	0x09, %l6
	ldsb	[%l7 + %l6],	%l2
	nop
	set	0x68, %o3
	std	%o2,	[%l7 + %o3]
	nop
	set	0x19, %o2
	ldstub	[%l7 + %o2],	%o4
	st	%fsr,	[%l7 + 0x18]
	set	0x24, %l2
	ldstuba	[%l7 + %l2] 0x80,	%i0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	set	0x6C, %l5
	stha	%g4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x60, %i2
	stw	%o2,	[%l7 + %i2]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%g2
	nop
	set	0x39, %o5
	ldub	[%l7 + %o5],	%l0
	nop
	nop
	setx	0x73A9173B4B822A89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0AFAF1D7E98A3DB3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f12,	%f10
	fpsub16	%f30,	%f18,	%f26
	set	0x18, %o0
	lda	[%l7 + %o0] 0x88,	%f16
	nop
	set	0x7A, %i5
	ldub	[%l7 + %i5],	%i1
	ld	[%l7 + 0x54],	%f2
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%i3
	nop
	set	0x48, %g5
	lduw	[%l7 + %g5],	%o1
	set	0x10, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o0
	nop
	set	0x4B, %l0
	ldsb	[%l7 + %l0],	%g1
	set	0x1C, %i3
	sta	%f21,	[%l7 + %i3] 0x89
	nop
	set	0x28, %i1
	stx	%l1,	[%l7 + %i1]
	nop
	set	0x5E, %o1
	sth	%o5,	[%l7 + %o1]
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%i6
	set	0x34, %l4
	lda	[%l7 + %l4] 0x81,	%f4
	set	0x10, %i7
	stxa	%l5,	[%l7 + %i7] 0x88
	nop
	set	0x18, %i4
	lduw	[%l7 + %i4],	%g7
	nop
	set	0x60, %l1
	std	%l4,	[%l7 + %l1]
	nop
	set	0x1C, %o6
	lduw	[%l7 + %o6],	%o7
	nop
	set	0x20, %o4
	ldsh	[%l7 + %o4],	%i2
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x80,	 1
	nop
	set	0x60, %l3
	swap	[%l7 + %l3],	%l3
	st	%f16,	[%l7 + 0x48]
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x28, %g6
	lda	[%l7 + %g6] 0x88,	%f12
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xC6D, 	%tick_cmpr
	nop
	set	0x70, %o7
	stb	%i4,	[%l7 + %o7]
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x80,	%o6
	nop
	set	0x54, %o3
	lduh	[%l7 + %o3],	%i5
	ld	[%l7 + 0x2C],	%f17
	set	0x10, %i6
	swapa	[%l7 + %i6] 0x80,	%g3
	set	0x64, %o2
	swapa	[%l7 + %o2] 0x88,	%l2
	set	0x08, %g4
	lda	[%l7 + %g4] 0x88,	%f22
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f8
	set	0x4D, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o3
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g4
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x81,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%g2
	nop
	set	0x58, %l5
	swap	[%l7 + %l5],	%g5
	nop
	set	0x7E, %g3
	lduh	[%l7 + %g3],	%l0
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f24
	nop
	set	0x21, %l0
	stb	%i3,	[%l7 + %l0]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xea,	%o0
	nop
	set	0x1E, %i3
	ldsh	[%l7 + %i3],	%i1
	wr	%o0,	%g1,	%pic
	add	%o5,	%i6,	%l5
	set	0x28, %o1
	stda	%l0,	[%l7 + %o1] 0x81
	set	0x58, %i1
	stxa	%l4,	[%l7 + %i1] 0xe2
	membar	#Sync
	be,a,pt	%icc,	loop_214
	ld	[%l7 + 0x18],	%f10
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%f16
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
loop_214:
	st	%f17,	[%l7 + 0x50]
	set	0x68, %i4
	prefetcha	[%l7 + %i4] 0x81,	 3
	ld	[%l7 + 0x4C],	%f6
	set	0x60, %i7
	stxa	%o7,	[%l7 + %i7] 0x89
	set	0x67, %o6
	ldstuba	[%l7 + %o6] 0x88,	%l6
	nop
	set	0x58, %l1
	std	%f4,	[%l7 + %l1]
	set	0x10, %g1
	sta	%f18,	[%l7 + %g1] 0x81
	nop
	set	0x55, %l3
	stb	%l3,	[%l7 + %l3]
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%i2
	ld	[%l7 + 0x48],	%f3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i7,	%g6
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	set	0x60, %g7
	stda	%i4,	[%l7 + %g7] 0x88
	set	0x14, %o7
	swapa	[%l7 + %o7] 0x80,	%g3
	or	%l2,	%i4,	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%o2
	nop
	set	0x20, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x18, %i6
	std	%g4,	[%l7 + %i6]
	or	%g2,	%g5,	%l0
	nop
	set	0x40, %o2
	std	%i2,	[%l7 + %o2]
	nop
	set	0x70, %g4
	ldx	[%l7 + %g4],	%o1
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f30
	set	0x6C, %i2
	lda	[%l7 + %i2] 0x88,	%f16
	st	%f13,	[%l7 + 0x44]
	nop
	set	0x20, %l2
	std	%i0,	[%l7 + %l2]
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f12
	set	0x20, %o0
	stxa	%i0,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x66, %l5
	ldsh	[%l7 + %l5],	%g1
	set	0x6C, %i5
	swapa	[%l7 + %i5] 0x81,	%o0
	set	0x08, %i0
	stda	%i6,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x0C, %l0
	stw	%o5,	[%l7 + %l0]
	nop
	set	0x3C, %g5
	ldstub	[%l7 + %g5],	%l1
	nop
	set	0x18, %i3
	swap	[%l7 + %i3],	%l4
	fpsub32s	%f20,	%f1,	%f19
	set	0x27, %g3
	stba	%l5,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x60, %i1
	ldsw	[%l7 + %i1],	%o7
	ld	[%l7 + 0x08],	%f21
	set	0x64, %o1
	stha	%l6,	[%l7 + %o1] 0x81
	nop
	set	0x60, %g2
	std	%f8,	[%l7 + %g2]
	nop
	set	0x7F, %l4
	stb	%g7,	[%l7 + %l4]
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f10
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%g6
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f0
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x88
	set	0x30, %l3
	stda	%i6,	[%l7 + %l3] 0x89
	nop
	set	0x0D, %g1
	ldstub	[%l7 + %g1],	%i5
	set	0x66, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g3
	set	0x70, %o4
	ldxa	[%l7 + %o4] 0x88,	%o6
	and	%i4,	%o4,	%o3
	or	%o2,	%l2,	%g2
	nop
	set	0x60, %g7
	std	%g4,	[%l7 + %g7]
	nop
	set	0x7A, %o7
	sth	%g4,	[%l7 + %o7]
	set	0x50, %i6
	stda	%l0,	[%l7 + %i6] 0x88
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x80,	%i3
	or	%i1,	%i0,	%o1
	and	%o0,	%i6,	%o5
	set	0x0A, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g1
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	st	%fsr,	[%l7 + 0x7C]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf0
	membar	#Sync
	set	0x24, %i2
	lda	[%l7 + %i2] 0x89,	%f8
	nop
	set	0x6C, %l2
	ldsb	[%l7 + %l2],	%l4
	nop
	set	0x30, %o5
	prefetch	[%l7 + %o5],	 3
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f0
	ld	[%l7 + 0x58],	%f8
	fpsub16	%f30,	%f8,	%f2
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%l0
	nop
	set	0x20, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f6
	nop
	set	0x79, %l0
	ldstub	[%l7 + %l0],	%l5
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%g7
	set	0x54, %i3
	lda	[%l7 + %i3] 0x88,	%f18
	nop
	set	0x44, %i1
	swap	[%l7 + %i1],	%l6
	ld	[%l7 + 0x44],	%f25
	set	0x7C, %g3
	stha	%i2,	[%l7 + %g3] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l3
	set	0x10, %g2
	lda	[%l7 + %g2] 0x80,	%f12
	nop
	set	0x48, %l4
	stx	%i7,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x74]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd0
	nop
	set	0x78, %i4
	std	%i4,	[%l7 + %i4]
	be	%xcc,	loop_215
	nop
	set	0x50, %i7
	swap	[%l7 + %i7],	%o6
	nop
	set	0x18, %o6
	prefetch	[%l7 + %o6],	 3
	nop
	set	0x50, %l1
	stx	%i4,	[%l7 + %l1]
loop_215:
	nop
	set	0x24, %l3
	ldsh	[%l7 + %l3],	%g3
	and	%o3,	%o2,	%o4
	nop
	set	0x64, %g1
	ldub	[%l7 + %g1],	%l2
	fpsub16	%f12,	%f2,	%f22
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%g2
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%g4
	nop
	set	0x46, %o7
	ldstub	[%l7 + %o7],	%g5
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%l0
	set	0x38, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0
	fpadd32	%f30,	%f26,	%f12
	nop
	set	0x34, %o2
	ldstub	[%l7 + %o2],	%i3
	st	%f20,	[%l7 + 0x2C]
	nop
	set	0x63, %g4
	stb	%i0,	[%l7 + %g4]
	set	0x6F, %o3
	stba	%o1,	[%l7 + %o3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	set	0x74, %l6
	stwa	%i6,	[%l7 + %l6] 0x89
	nop
	set	0x20, %l2
	std	%f4,	[%l7 + %l2]
	set	0x62, %o5
	stha	%o5,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x58, %i2
	stwa	%o0,	[%l7 + %i2] 0x81
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x89,	%g1
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%l0
	set	0x48, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f16
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%l5
	nop
	set	0x5F, %l0
	ldsb	[%l7 + %l0],	%g7
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
	fpsub32s	%f3,	%f30,	%f26
	set	0x44, %g3
	lda	[%l7 + %g3] 0x89,	%f7
	nop
	set	0x14, %i3
	stw	%o7,	[%l7 + %i3]
	nop
	set	0x7C, %l4
	ldstub	[%l7 + %l4],	%i2
	nop
	set	0x78, %g2
	lduw	[%l7 + %g2],	%l6
	ld	[%l7 + 0x2C],	%f21
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x80,	%i7
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f10
	nop
	set	0x38, %o1
	std	%f4,	[%l7 + %o1]
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 1
	set	0x58, %g1
	lda	[%l7 + %g1] 0x89,	%f8
	set	0x40, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l3
	set	0x2A, %g6
	stha	%i5,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x40, %g7
	swap	[%l7 + %g7],	%o6
	set	0x4E, %o7
	stha	%i4,	[%l7 + %o7] 0x89
	nop
	set	0x6C, %o4
	ldstub	[%l7 + %o4],	%o3
	nop
	set	0x59, %i6
	ldsb	[%l7 + %i6],	%g3
	nop
	set	0x62, %g4
	sth	%o2,	[%l7 + %g4]
	nop
	set	0x68, %o2
	stw	%l2,	[%l7 + %o2]
	set	0x74, %o3
	sta	%f26,	[%l7 + %o3] 0x88
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	nop
	set	0x45, %o5
	ldsb	[%l7 + %o5],	%g4
	set	0x14, %i2
	stwa	%g2,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x58, %l2
	stda	%l0,	[%l7 + %l2] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x80,	%g5,	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%i1
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xca
	nop
	set	0x22, %i5
	lduh	[%l7 + %i5],	%o1
	set	0x18, %o0
	stwa	%i6,	[%l7 + %o0] 0x80
	nop
	set	0x6A, %i0
	lduh	[%l7 + %i0],	%o0
	nop
	set	0x6C, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x14, %g5
	sta	%f25,	[%l7 + %g5] 0x80
	set	0x10, %g3
	ldda	[%l7 + %g3] 0xe2,	%o4
	nop
	set	0x2C, %i1
	stw	%g1,	[%l7 + %i1]
	or	%l1,	%l4,	%l5
	nop
	set	0x29, %i3
	stb	%g7,	[%l7 + %i3]
	nop
	set	0x20, %g2
	ldsw	[%l7 + %g2],	%o7
	set	0x70, %l4
	stxa	%l6,	[%l7 + %l4] 0x89
	nop
	set	0x08, %i4
	std	%f2,	[%l7 + %i4]
	nop
	set	0x20, %o6
	lduw	[%l7 + %o6],	%i2
	add	%g6,	%i7,	%i5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4A7, 	%tick_cmpr
	and	%i4,	%g3,	%o3
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	set	0x44, %l3
	stwa	%o2,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x0C, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%o4
	nop
	set	0x48, %g6
	std	%f30,	[%l7 + %g6]
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%g2
	set	0x68, %o7
	stda	%l0,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x50, %g7
	prefetch	[%l7 + %g7],	 3
	st	%f8,	[%l7 + 0x20]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd8
	nop
	set	0x38, %i6
	std	%g4,	[%l7 + %i6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x43, %o2
	ldstuba	[%l7 + %o2] 0x80,	%i0
	nop
	set	0x4A, %o3
	lduh	[%l7 + %o3],	%o1
	st	%f21,	[%l7 + 0x50]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f16
	ld	[%l7 + 0x0C],	%f12
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%i6
	set	0x48, %i2
	stxa	%o0,	[%l7 + %i2] 0x81
	nop
	set	0x68, %o5
	stx	%o5,	[%l7 + %o5]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x89,	 4
	set	0x38, %l5
	sta	%f14,	[%l7 + %l5] 0x81
	nop
	set	0x7C, %o0
	prefetch	[%l7 + %o0],	 3
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf0,	%f0
	nop
	set	0x70, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x20, %l0
	lda	[%l7 + %l0] 0x88,	%f6
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc4
	nop
	set	0x68, %g3
	stx	%fsr,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x50, %i1
	sth	%l1,	[%l7 + %i1]
	set	0x60, %i3
	stwa	%l4,	[%l7 + %i3] 0x88
	nop
	set	0x20, %l4
	sth	%l5,	[%l7 + %l4]
	and	%g7,	%o7,	%i1
	fpsub16s	%f2,	%f9,	%f23
	fpsub16s	%f15,	%f23,	%f15
	nop
	set	0x6D, %g2
	ldub	[%l7 + %g2],	%i2
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%g6
	nop
	set	0x18, %o6
	stb	%i7,	[%l7 + %o6]
	nop
	set	0x30, %i7
	prefetch	[%l7 + %i7],	 1
	set	0x73, %o1
	stba	%i5,	[%l7 + %o1] 0x88
	wr	%l3,	%o6,	%pic
	and	%i4,	%l6,	%g3
	nop
	set	0x70, %l3
	lduw	[%l7 + %l3],	%o2
	or	%o4,	%o3,	%g2
	nop
	set	0x4A, %g6
	lduh	[%l7 + %g6],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%l0
	nop
	set	0x7C, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x81,	%i3
	nop
	set	0x71, %g7
	ldub	[%l7 + %g7],	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%i6
	set	0x14, %o7
	swapa	[%l7 + %o7] 0x81,	%l2
	nop
	set	0x38, %i6
	std	%f8,	[%l7 + %i6]
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f18
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x88,	%o0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f16
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%g1
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%o5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc2
	fpsub16	%f10,	%f2,	%f14
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd0
	ld	[%l7 + 0x4C],	%f21
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%l4
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f16
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x80,	%l1
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe2,	%g6
	set	0x58, %l0
	lda	[%l7 + %l0] 0x81,	%f24
	set	0x44, %g5
	lda	[%l7 + %g5] 0x89,	%f19
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i1
	set	0x08, %i1
	stxa	%i2,	[%l7 + %i1] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFD4, 	%tick_cmpr
	nop
	set	0x70, %g3
	std	%l4,	[%l7 + %g3]
	add	%i5,	%l3,	%o6
	and	%l6,	%i4,	%o2
	nop
	set	0x1F, %l4
	stb	%g3,	[%l7 + %l4]
	nop
	set	0x5C, %i3
	lduw	[%l7 + %i3],	%o3
	nop
	set	0x40, %g2
	lduw	[%l7 + %g2],	%o4
	fpadd16s	%f13,	%f6,	%f13
	and	%g2,	%g5,	%l0
	set	0x60, %o6
	stda	%i2,	[%l7 + %o6] 0xe3
	membar	#Sync
	add	%i0,	%o1,	%i6
	set	0x30, %i7
	lda	[%l7 + %i7] 0x89,	%f8
	and	%l2,	%o0,	%g1
	nop
	set	0x5D, %i4
	ldub	[%l7 + %i4],	%g4
	ld	[%l7 + 0x2C],	%f14
	nop
	set	0x10, %o1
	stw	%l4,	[%l7 + %o1]
	nop
	set	0x0B, %l3
	ldsb	[%l7 + %l3],	%o5
	and	%l1,	%o7,	%i1
	nop
	set	0x3F, %l1
	ldub	[%l7 + %l1],	%i2
	and	%g7,	%i7,	%g6
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f0
	nop
	set	0x64, %g7
	stw	%l5,	[%l7 + %g7]
	ld	[%l7 + 0x08],	%f2
	nop
	set	0x3B, %g1
	ldstub	[%l7 + %g1],	%i5
	set	0x4C, %i6
	sta	%f21,	[%l7 + %i6] 0x81
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%l3
	st	%fsr,	[%l7 + 0x20]
	set	0x54, %o2
	stwa	%l6,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%i4,	%o6,	%o2
	nop
	set	0x70, %o4
	std	%g2,	[%l7 + %o4]
	nop
	set	0x28, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x34, %l6
	ldub	[%l7 + %l6],	%o3
	nop
	set	0x44, %o5
	lduh	[%l7 + %o5],	%o4
	nop
	set	0x72, %l2
	ldsh	[%l7 + %l2],	%g5
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x88,	%l0
	nop
	set	0x10, %o0
	std	%f6,	[%l7 + %o0]
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%g2
	nop
	set	0x42, %i0
	lduh	[%l7 + %i0],	%o1
	or	%i6,	%l2,	%i0
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x81,	%g1
	set	0x58, %i5
	stxa	%g4,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x80,	 2
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x1C, %g5
	ldub	[%l7 + %g5],	%o0
	nop
	set	0x38, %i1
	stx	%l1,	[%l7 + %i1]
	set	0x0C, %g3
	sta	%f4,	[%l7 + %g3] 0x88
	nop
	set	0x60, %l4
	ldsh	[%l7 + %l4],	%o5
	nop
	set	0x28, %i3
	ldub	[%l7 + %i3],	%i1
	set	0x60, %g2
	sta	%f12,	[%l7 + %g2] 0x89
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%o6
	nop
	set	0x50, %i4
	swap	[%l7 + %i4],	%g7
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x88,	%i2
	st	%f26,	[%l7 + 0x2C]
	wr	%i7,	%g6,	%y
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%l5
	set	0x40, %o1
	stda	%i6,	[%l7 + %o1] 0x88
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x80,	%l2
	nop
	set	0x5C, %l3
	stw	%i4,	[%l7 + %l3]
	nop
	set	0x24, %g7
	swap	[%l7 + %g7],	%o2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o6
	set	0x30, %g1
	ldda	[%l7 + %g1] 0x88,	%o2
	set	0x7C, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o4
	nop
	set	0x44, %i6
	swap	[%l7 + %i6],	%g5
	set	0x68, %o2
	stxa	%i3,	[%l7 + %o2] 0x81
	ld	[%l7 + 0x08],	%f12
	nop
	set	0x44, %o4
	swap	[%l7 + %o4],	%g2
	set	0x15, %g4
	stba	%o1,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x79, %l6
	ldsb	[%l7 + %l6],	%l0
	or	%i6,	%i0,	%g1
	ld	[%l7 + 0x10],	%f6
	and	%l2,	%g4,	%l4
	nop
	set	0x48, %o7
	std	%l0,	[%l7 + %o7]
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x18, %o3
	swap	[%l7 + %o3],	%o0
	set	0x23, %l2
	ldstuba	[%l7 + %l2] 0x81,	%o5
	nop
	set	0x76, %o0
	sth	%i1,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x20]
	add	%g7,	%o7,	%i2
	set	0x28, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g6
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%i5
	nop
	set	0x38, %i5
	lduh	[%l7 + %i5],	%i7
	nop
	set	0x2A, %l0
	stb	%l5,	[%l7 + %l0]
	st	%f23,	[%l7 + 0x38]
	nop
	set	0x50, %g5
	stx	%l6,	[%l7 + %g5]
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x81,	%l2
	set	0x4C, %g3
	swapa	[%l7 + %g3] 0x81,	%i4
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x1B, %i2
	ldsb	[%l7 + %i2],	%o3
	nop
	set	0x5C, %i3
	lduw	[%l7 + %i3],	%o6
	add	%o4,	%g5,	%i3
	nop
	set	0x58, %l4
	stx	%g2,	[%l7 + %l4]
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%l0
	nop
	set	0x18, %g2
	ldx	[%l7 + %g2],	%i6
	nop
	set	0x14, %i7
	ldsb	[%l7 + %i7],	%i0
	nop
	set	0x28, %i4
	stx	%g1,	[%l7 + %i4]
	set	0x2D, %l1
	stba	%l2,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xeb,	%g4
	and	%l4,	%o1,	%o0
	or	%l1,	%i1,	%o5
	set	0x29, %o1
	stba	%o7,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x12, %g1
	ldub	[%l7 + %g1],	%g7
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x89,	 1
	set	0x61, %g7
	stba	%i5,	[%l7 + %g7] 0x81
	and	%i7,	%l5,	%i2
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xe3,	%i6
	nop
	set	0x10, %o2
	stx	%l3,	[%l7 + %o2]
	nop
	set	0x79, %g4
	ldstub	[%l7 + %g4],	%i4
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x50, %o4
	std	%g2,	[%l7 + %o4]
	nop
	set	0x78, %o7
	sth	%o2,	[%l7 + %o7]
	nop
	set	0x44, %o3
	stw	%o3,	[%l7 + %o3]
	nop
	set	0x38, %l2
	stx	%o6,	[%l7 + %l2]
	nop
	set	0x2E, %o0
	stb	%g5,	[%l7 + %o0]
	set	0x52, %o5
	stha	%i3,	[%l7 + %o5] 0x89
	nop
	set	0x0A, %i0
	sth	%o4,	[%l7 + %i0]
	nop
	set	0x10, %i5
	std	%l0,	[%l7 + %i5]
	set	0x78, %l0
	stda	%i6,	[%l7 + %l0] 0x80
	set	0x18, %g5
	sta	%f0,	[%l7 + %g5] 0x81
	nop
	set	0x52, %l5
	sth	%g2,	[%l7 + %l5]
	fpadd16s	%f31,	%f19,	%f10
	nop
	set	0x54, %g3
	stb	%g1,	[%l7 + %g3]
	fpsub16	%f20,	%f10,	%f10
	nop
	set	0x35, %i2
	ldub	[%l7 + %i2],	%l2
	nop
	set	0x4E, %i1
	ldstub	[%l7 + %i1],	%i0
	nop
	set	0x60, %i3
	stb	%g4,	[%l7 + %i3]
	nop
	set	0x1A, %l4
	stb	%l4,	[%l7 + %l4]
	set	0x0C, %o6
	swapa	[%l7 + %o6] 0x80,	%o1
	nop
	set	0x78, %i7
	std	%l0,	[%l7 + %i7]
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x89,	 2
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%i0
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%o5
	wr	%o7,	%g6,	%softint
	set	0x1A, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g7
	nop
	set	0x58, %i4
	lduw	[%l7 + %i4],	%i5
	set	0x74, %g6
	lda	[%l7 + %g6] 0x81,	%f16
	and	%i7,	%l5,	%i2
	st	%f11,	[%l7 + 0x70]
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%l3
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%i4
	nop
	set	0x78, %o2
	ldsw	[%l7 + %o2],	%l6
	nop
	set	0x18, %g4
	ldx	[%l7 + %g4],	%o2
	nop
	set	0x70, %l6
	stw	%o3,	[%l7 + %l6]
	nop
	set	0x10, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x3C, %o4
	ldsb	[%l7 + %o4],	%o6
	nop
	set	0x10, %o3
	ldsh	[%l7 + %o3],	%g3
	nop
	set	0x74, %o7
	ldsb	[%l7 + %o7],	%i3
	or	%g5,	%l0,	%i6
	set	0x10, %o0
	stwa	%o4,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd8,	%f0
	nop
	set	0x34, %o5
	swap	[%l7 + %o5],	%g1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%i0
	nop
	set	0x50, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x70, %l0
	stxa	%g2,	[%l7 + %l0] 0x89
	set	0x58, %l5
	stxa	%l4,	[%l7 + %l5] 0x81
	nop
	set	0x30, %g5
	stw	%g4,	[%l7 + %g5]
	set	0x68, %i2
	stxa	%l1,	[%l7 + %i2] 0xeb
	membar	#Sync
	fpadd16s	%f15,	%f30,	%f1
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%o0
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc4
	wr	%i1,	%o5,	%sys_tick
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%o7
	st	%f23,	[%l7 + 0x38]
	nop
	set	0x70, %i7
	lduw	[%l7 + %i7],	%o1
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x80,	%g7
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%i4
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%i7
	nop
	set	0x18, %l3
	stx	%g6,	[%l7 + %l3]
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xeb,	%l4
	set	0x58, %g6
	stxa	%l3,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x58, %i4
	ldsh	[%l7 + %i4],	%i4
	nop
	set	0x28, %g1
	lduw	[%l7 + %g1],	%l6
	nop
	set	0x1C, %g7
	ldsb	[%l7 + %g7],	%i2
	set	0x67, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o3
	set	0x24, %o2
	stwa	%o2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x3C, %l6
	stwa	%o6,	[%l7 + %l6] 0x80
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%i3
	nop
	set	0x74, %o3
	ldub	[%l7 + %o3],	%g5
	nop
	set	0x6A, %o4
	lduh	[%l7 + %o4],	%l0
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%i6
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%g2
	st	%f1,	[%l7 + 0x40]
	set	0x68, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o4
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%g1
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x4DE, 	%sys_tick_cmpr
	nop
	set	0x3A, %i5
	ldsh	[%l7 + %i5],	%l4
	nop
	set	0x3D, %l0
	ldstub	[%l7 + %l0],	%l1
	set	0x1D, %l5
	stba	%g4,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%i1
	nop
	set	0x5F, %i2
	stb	%o5,	[%l7 + %i2]
	nop
	set	0x37, %g3
	ldub	[%l7 + %g3],	%o1
	st	%fsr,	[%l7 + 0x60]
	st	%f5,	[%l7 + 0x3C]
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f24
	st	%fsr,	[%l7 + 0x0C]
	set	0x70, %i1
	stda	%g6,	[%l7 + %i1] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x26, %i3
	ldsh	[%l7 + %i3],	%o7
	nop
	set	0x70, %l4
	ldsw	[%l7 + %l4],	%i5
	nop
	set	0x78, %o6
	stx	%g6,	[%l7 + %o6]
	and	%i7,	%l3,	%i4
	nop
	set	0x1C, %i7
	lduh	[%l7 + %i7],	%l6
	add	%i2,	%o3,	%l5
	nop
	set	0x37, %l1
	ldsb	[%l7 + %l1],	%o2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf0
	membar	#Sync
	nop
	set	0x18, %g2
	ldsh	[%l7 + %g2],	%o6
	nop
	set	0x78, %o1
	ldub	[%l7 + %o1],	%i3
	fpsub32	%f2,	%f22,	%f30
	nop
	set	0x40, %i4
	lduw	[%l7 + %i4],	%g5
	nop
	set	0x10, %g6
	std	%i6,	[%l7 + %g6]
	ld	[%l7 + 0x0C],	%f15
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x2A, %g4
	ldub	[%l7 + %g4],	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%g1
	nop
	set	0x54, %o2
	swap	[%l7 + %o2],	%l2
	st	%f5,	[%l7 + 0x08]
	wr 	%g0, 	0x6, 	%fprs
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x80,	 4
	nop
	set	0x6C, %i6
	sth	%l1,	[%l7 + %i6]
	nop
	set	0x50, %o3
	ldsw	[%l7 + %o3],	%l4
	nop
	set	0x10, %g7
	prefetch	[%l7 + %g7],	 3
	set	0x4D, %o4
	stba	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%g4
	nop
	set	0x45, %o0
	ldub	[%l7 + %o0],	%o5
	nop
	set	0x68, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x40, %o7
	stw	%g7,	[%l7 + %o7]
	nop
	set	0x4C, %i0
	prefetch	[%l7 + %i0],	 2
	set	0x38, %i5
	lda	[%l7 + %i5] 0x88,	%f17
	set	0x10, %o5
	swapa	[%l7 + %o5] 0x88,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%i5
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x81,	%i6
	nop
	set	0x4C, %l0
	swap	[%l7 + %l0],	%g6
	nop
	set	0x16, %g3
	sth	%i4,	[%l7 + %g3]
	set	0x58, %g5
	stda	%i6,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x36, %i1
	stha	%l3,	[%l7 + %i1] 0x88
	and	%i2,	%o3,	%o2
	nop
	set	0x44, %i2
	lduh	[%l7 + %i2],	%l5
	nop
	set	0x20, %i3
	std	%f10,	[%l7 + %i3]
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%o6
	nop
	set	0x48, %l4
	std	%f28,	[%l7 + %l4]
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f20
	nop
	set	0x38, %g2
	stx	%i3,	[%l7 + %g2]
	bl,pn	%xcc,	loop_216
	nop
	set	0x11, %o1
	ldsb	[%l7 + %o1],	%g5
	and	%i6,	%o4,	%l0
	nop
	set	0x46, %i4
	lduh	[%l7 + %i4],	%l2
loop_216:
	nop
	set	0x74, %l3
	swap	[%l7 + %l3],	%g1
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x58, %g4
	std	%f0,	[%l7 + %g4]
	fpsub32s	%f6,	%f21,	%f0
	or	%g2,	%i0,	%g3
	nop
	set	0x18, %g1
	lduh	[%l7 + %g1],	%l4
	nop
	set	0x14, %l6
	ldstub	[%l7 + %l6],	%o0
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f26
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x81,	%l1
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x37, %o3
	ldstub	[%l7 + %o3],	%i1
	nop
	set	0x38, %g7
	ldsw	[%l7 + %g7],	%o5
	nop
	set	0x78, %o0
	std	%g6,	[%l7 + %o0]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%g4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	st	%f21,	[%l7 + 0x60]
	set	0x4E, %o7
	ldstuba	[%l7 + %o7] 0x81,	%i5
	nop
	set	0x18, %i0
	sth	%o1,	[%l7 + %i0]
	nop
	set	0x58, %o4
	swap	[%l7 + %o4],	%i7
	set	0x60, %i5
	stwa	%g6,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
	set	0x6C, %o5
	stwa	%i4,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x34, %g3
	lduh	[%l7 + %g3],	%l6
	set	0x10, %g5
	ldxa	[%l7 + %g5] 0x81,	%l3
	and	%i2,	%o3,	%l5
	fpadd32	%f20,	%f4,	%f18
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x38, %i1
	std	%f4,	[%l7 + %i1]
	nop
	set	0x08, %l0
	ldstub	[%l7 + %l0],	%o6
	set	0x68, %i3
	swapa	[%l7 + %i3] 0x80,	%o2
	nop
	set	0x50, %o6
	stx	%i3,	[%l7 + %o6]
	set	0x09, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g5
	set	0x24, %i2
	lda	[%l7 + %i2] 0x89,	%f1
	nop
	set	0x70, %i7
	std	%f4,	[%l7 + %i7]
	nop
	set	0x08, %l1
	std	%i6,	[%l7 + %l1]
	nop
	set	0x50, %o1
	stw	%o4,	[%l7 + %o1]
	set	0x60, %i4
	stxa	%l0,	[%l7 + %i4] 0x80
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%l2
	add	%g2,	%g3,	%l4
	and	%o0,	%l1,	%i0
	ld	[%l7 + 0x54],	%f6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	set	0x4C, %l3
	stwa	%o5,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x68, %g4
	std	%g6,	[%l7 + %g4]
	set	0x5C, %g6
	lda	[%l7 + %g6] 0x80,	%f31
	set	0x48, %g1
	ldxa	[%l7 + %g1] 0x81,	%i1
	set	0x18, %o2
	stxa	%g4,	[%l7 + %o2] 0x89
	nop
	set	0x10, %i6
	std	%f20,	[%l7 + %i6]
	set	0x76, %o3
	stba	%i5,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x14, %l6
	stw	%o7,	[%l7 + %l6]
	nop
	set	0x36, %o0
	ldsh	[%l7 + %o0],	%o1
	set	0x44, %g7
	stwa	%g6,	[%l7 + %g7] 0x81
	or	%i7,	%i4,	%l6
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%l2
	nop
	set	0x38, %l2
	std	%f10,	[%l7 + %l2]
	nop
	set	0x18, %i0
	sth	%o3,	[%l7 + %i0]
	add	%i2,	%l5,	%o6
	nop
	set	0x60, %i5
	swap	[%l7 + %i5],	%i3
	set	0x14, %l5
	swapa	[%l7 + %l5] 0x89,	%g5
	set	0x70, %o5
	stxa	%o2,	[%l7 + %o5] 0x80
	nop
	set	0x1B, %o4
	ldsb	[%l7 + %o4],	%i6
	nop
	set	0x5C, %g3
	stw	%o4,	[%l7 + %g3]
	add	%g1,	%l2,	%l0
	nop
	set	0x38, %i1
	std	%f22,	[%l7 + %i1]
	set	0x7C, %g5
	stwa	%g2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x5B, %i3
	ldub	[%l7 + %i3],	%g3
	set	0x28, %l0
	stxa	%l4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x5E, %l4
	stb	%o0,	[%l7 + %l4]
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%i0
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f16
	or	%o5,	%l1,	%i1
	set	0x58, %i2
	stxa	%g4,	[%l7 + %i2] 0x88
	nop
	set	0x72, %o1
	ldsh	[%l7 + %o1],	%g7
	set	0x50, %l1
	stxa	%o7,	[%l7 + %l1] 0x81
	set	0x15, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i5
	nop
	set	0x40, %g2
	stx	%g6,	[%l7 + %g2]
	set	0x7C, %l3
	swapa	[%l7 + %l3] 0x81,	%i7
	nop
	set	0x2E, %g4
	lduh	[%l7 + %g4],	%i4
	set	0x29, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o1
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x89,	%i6
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%o3
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xe2,	%l2
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x5F, %l6
	ldub	[%l7 + %l6],	%l5
	st	%fsr,	[%l7 + 0x40]
	set	0x50, %o0
	stwa	%i2,	[%l7 + %o0] 0xeb
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%g5
	set	0x38, %g1
	sta	%f11,	[%l7 + %g1] 0x80
	and	%o2,	%i6,	%o4
	nop
	set	0x58, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%i2
	set	0x30, %i0
	stxa	%g1,	[%l7 + %i0] 0x89
	nop
	set	0x50, %i5
	std	%f20,	[%l7 + %i5]
	nop
	set	0x50, %l2
	std	%f4,	[%l7 + %l2]
	set	0x54, %l5
	swapa	[%l7 + %l5] 0x80,	%l0
	or	%l2,	%g3,	%g2
	nop
	set	0x08, %o5
	ldstub	[%l7 + %o5],	%o0
	nop
	set	0x3C, %g3
	prefetch	[%l7 + %g3],	 1
	nop
	set	0x38, %i1
	sth	%i0,	[%l7 + %i1]
	set	0x28, %o4
	stwa	%l4,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x68, %i3
	std	%o4,	[%l7 + %i3]
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f16
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x36, %l4
	sth	%i1,	[%l7 + %l4]
	nop
	set	0x5B, %g5
	ldsb	[%l7 + %g5],	%l1
	set	0x70, %o6
	swapa	[%l7 + %o6] 0x89,	%g4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd0,	%f16
	set	0x68, %o1
	prefetcha	[%l7 + %o1] 0x89,	 4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i4
	add	%g6,	%o1,	%o3
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc0
	nop
	set	0x38, %l1
	std	%l2,	[%l7 + %l1]
	bgu,a	%xcc,	loop_217
	nop
	set	0x68, %g2
	stx	%l5,	[%l7 + %g2]
	nop
	set	0x38, %l3
	swap	[%l7 + %l3],	%i2
	nop
	set	0x71, %i4
	ldsb	[%l7 + %i4],	%l6
loop_217:
	nop
	set	0x30, %g4
	lda	[%l7 + %g4] 0x89,	%f7
	and	%o6,	%o2,	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%i3
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%g5
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x88,	%l0
	set	0x4C, %o3
	lda	[%l7 + %o3] 0x89,	%f30
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%g0
	set	0x58, %g6
	stwa	%l2,	[%l7 + %g6] 0x89
	nop
	set	0x4A, %g1
	ldstub	[%l7 + %g1],	%g3
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f2
	nop
	set	0x20, %o0
	stw	%o0,	[%l7 + %o0]
	nop
	set	0x23, %g7
	ldub	[%l7 + %g7],	%i0
	set	0x70, %i0
	sta	%f3,	[%l7 + %i0] 0x89
	nop
	set	0x08, %l2
	std	%l4,	[%l7 + %l2]
	nop
	set	0x7C, %i5
	lduh	[%l7 + %i5],	%g2
	add	%i1,	%l1,	%o5
	nop
	set	0x58, %o5
	swap	[%l7 + %o5],	%o7
	nop
	set	0x28, %g3
	stx	%g7,	[%l7 + %g3]
	nop
	set	0x72, %l5
	lduh	[%l7 + %l5],	%i5
	nop
	set	0x40, %o4
	stb	%i7,	[%l7 + %o4]
	and	%i4,	%g6,	%o1
	nop
	set	0x48, %i1
	ldsw	[%l7 + %i1],	%o3
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x24, %l4
	stwa	%g4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x24, %i3
	stw	%l3,	[%l7 + %i3]
	nop
	set	0x48, %o6
	ldstub	[%l7 + %o6],	%i2
	set	0x38, %i7
	stha	%l5,	[%l7 + %i7] 0xe3
	membar	#Sync
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o2
	nop
	set	0x78, %g5
	stx	%o6,	[%l7 + %g5]
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f4
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%o4
	nop
	set	0x30, %g2
	ldsh	[%l7 + %g2],	%i3
	nop
	set	0x3C, %l3
	stw	%g5,	[%l7 + %l3]
	nop
	set	0x28, %i4
	swap	[%l7 + %i4],	%l0
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x89,	%g1
	set	0x08, %o2
	stxa	%l2,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x74, %i6
	stba	%i6,	[%l7 + %i6] 0xea
	membar	#Sync
	or	%g3,	%i0,	%l4
	nop
	set	0x35, %l1
	ldub	[%l7 + %l1],	%g2
	set	0x78, %l6
	stda	%i0,	[%l7 + %l6] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%o0
	nop
	set	0x6D, %g6
	ldub	[%l7 + %g6],	%o5
	nop
	set	0x60, %o3
	ldsw	[%l7 + %o3],	%o7
	set	0x28, %g1
	stba	%g7,	[%l7 + %g1] 0x81
	set	0x6C, %o0
	sta	%f16,	[%l7 + %o0] 0x80
	set	0x54, %o7
	lda	[%l7 + %o7] 0x81,	%f4
	or	%i5,	%i7,	%g6
	nop
	set	0x4B, %g7
	ldsb	[%l7 + %g7],	%o1
	or	%o3,	%i4,	%l3
	or	%g4,	%l5,	%l6
	set	0x10, %l2
	lda	[%l7 + %l2] 0x80,	%f11
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x7B, %i5
	ldsb	[%l7 + %i5],	%i2
	nop
	set	0x4B, %o5
	ldsb	[%l7 + %o5],	%o2
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x88,	%o4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%i3
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f2
	nop
	set	0x2C, %i1
	lduw	[%l7 + %i1],	%g5
	nop
	set	0x58, %l0
	std	%f24,	[%l7 + %l0]
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x80,	%f11
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l0
	set	0x5A, %o4
	stha	%l2,	[%l7 + %o4] 0x89
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f24
	nop
	set	0x31, %o6
	ldstub	[%l7 + %o6],	%g3
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f16
	nop
	set	0x18, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x08, %o1
	stda	%i0,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x54, %i2
	lda	[%l7 + %i2] 0x80,	%f7
	wr	%l4,	%g2,	%y
	set	0x0C, %l3
	swapa	[%l7 + %l3] 0x89,	%i6
	nop
	set	0x10, %i4
	ldsw	[%l7 + %i4],	%i1
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%o0
	nop
	set	0x0E, %g2
	lduh	[%l7 + %g2],	%l1
	set	0x40, %o2
	stxa	%o5,	[%l7 + %o2] 0xea
	membar	#Sync
	and	%g7,	%o7,	%i7
	nop
	set	0x44, %l1
	prefetch	[%l7 + %l1],	 4
	fpsub32	%f6,	%f10,	%f30
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%i5
	nop
	set	0x58, %l6
	stx	%o3,	[%l7 + %l6]
	nop
	set	0x38, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf0
	membar	#Sync
	nop
	set	0x4C, %g1
	ldsh	[%l7 + %g1],	%i4
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	fpadd32s	%f1,	%f15,	%f24
	nop
	set	0x2C, %i6
	lduw	[%l7 + %i6],	%l3
	nop
	set	0x0B, %o7
	ldsb	[%l7 + %o7],	%o1
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%l4
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%l6
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x81,	%g4
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%i2
	nop
	set	0x28, %i5
	prefetch	[%l7 + %i5],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x80
	add	%i3,	%o2,	%g1
	set	0x7C, %l5
	stha	%g5,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x6C, %l0
	sta	%f7,	[%l7 + %l0] 0x89
	and	%l2,	%g3,	%i0
	nop
	set	0x66, %i1
	stb	%l4,	[%l7 + %i1]
	set	0x08, %o4
	swapa	[%l7 + %o4] 0x88,	%g2
	nop
	set	0x58, %l4
	ldx	[%l7 + %l4],	%i6
	nop
	set	0x0E, %o6
	ldub	[%l7 + %o6],	%i1
	set	0x40, %i3
	lda	[%l7 + %i3] 0x88,	%f16
	nop
	set	0x37, %g5
	ldsb	[%l7 + %g5],	%o0
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x88,	%l0
	fpsub32s	%f2,	%f26,	%f19
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f8
	set	0x18, %l3
	stda	%l0,	[%l7 + %l3] 0xe3
	membar	#Sync
	and	%o5,	%g7,	%i7
	nop
	set	0x30, %i4
	lduh	[%l7 + %i4],	%g6
	set	0x65, %g4
	stba	%i5,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x58, %i2
	stx	%o7,	[%l7 + %i2]
	and	%i4,	%o3,	%o1
	fpsub16	%f18,	%f26,	%f18
	st	%f2,	[%l7 + 0x6C]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	add	%l3,	%l5,	%g4
	nop
	set	0x48, %o2
	sth	%l6,	[%l7 + %o2]
	nop
	set	0x38, %l1
	swap	[%l7 + %l1],	%i2
	set	0x6A, %l6
	stba	%o4,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x0A, %g6
	stb	%o6,	[%l7 + %g6]
	nop
	set	0x44, %o3
	swap	[%l7 + %o3],	%i3
	set	0x12, %o0
	stba	%g1,	[%l7 + %o0] 0x89
	nop
	nop
	setx	0xE2C77312,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xBAAF59C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f20,	%f14
	nop
	set	0x08, %g1
	std	%o2,	[%l7 + %g1]
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%l2
	fpsub32	%f16,	%f10,	%f0
	nop
	set	0x08, %g7
	stx	%g3,	[%l7 + %g7]
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%i0
	nop
	set	0x38, %o7
	prefetch	[%l7 + %o7],	 0
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xe2,	%g4
	nop
	set	0x50, %i0
	ldsb	[%l7 + %i0],	%l4
	bgu,pn	%xcc,	loop_218
	st	%fsr,	[%l7 + 0x1C]
	fpsub32s	%f24,	%f25,	%f9
	set	0x58, %i5
	swapa	[%l7 + %i5] 0x89,	%g2
loop_218:
	nop
	set	0x18, %g3
	stxa	%i1,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x70, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i6
	nop
	set	0x58, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x58, %i1
	stba	%l1,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x14, %l4
	stha	%o0,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x08, %o6
	stwa	%o5,	[%l7 + %o6] 0x81
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%i7
	nop
	set	0x40, %i3
	std	%f4,	[%l7 + %i3]
	nop
	set	0x2C, %g5
	ldsb	[%l7 + %g5],	%g7
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x78, %i7
	std	%f0,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x89,	 1
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x89,	 2
	bgu,pn	%icc,	loop_219
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%g6
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%i4
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xea,	%o0
loop_219:
	nop
	set	0x6C, %i2
	lda	[%l7 + %i2] 0x80,	%f2
	or	%o3,	%l3,	%l5
	nop
	set	0x2E, %o2
	sth	%g4,	[%l7 + %o2]
	nop
	set	0x48, %l1
	stx	%i2,	[%l7 + %l1]
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%o4
	nop
	set	0x2E, %o3
	ldsb	[%l7 + %o3],	%o6
	nop
	set	0x47, %o0
	stb	%i3,	[%l7 + %o0]
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x89,	 2
	nop
	set	0x08, %i6
	stb	%o2,	[%l7 + %i6]
	set	0x08, %g7
	stda	%g0,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%g3,	%l2,	%i0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x62, %l2
	lduh	[%l7 + %l2],	%g5
	nop
	set	0x70, %g1
	swap	[%l7 + %g1],	%g2
	set	0x74, %o7
	stwa	%i1,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	set	0x50, %o5
	swapa	[%l7 + %o5] 0x88,	%l1
	nop
	set	0x48, %g3
	ldsw	[%l7 + %g3],	%i6
	or	%o5,	%o0,	%i7
	nop
	set	0x22, %i5
	ldub	[%l7 + %i5],	%g7
	set	0x24, %l0
	swapa	[%l7 + %l0] 0x88,	%i5
	and	%o7,	%g6,	%l0
	set	0x58, %l5
	stwa	%i4,	[%l7 + %l5] 0x80
	nop
	set	0x48, %i1
	stx	%o3,	[%l7 + %i1]
	nop
	set	0x2C, %l4
	swap	[%l7 + %l4],	%l3
	nop
	set	0x2C, %o6
	swap	[%l7 + %o6],	%o1
	set	0x70, %g5
	stxa	%l5,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	nop
	set	0x30, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%i2
	nop
	set	0x2C, %l3
	sth	%o6,	[%l7 + %l3]
	set	0x58, %o4
	swapa	[%l7 + %o4] 0x88,	%i3
	nop
	set	0x14, %i4
	stw	%l6,	[%l7 + %i4]
	set	0x40, %g4
	stba	%o4,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x34, %g2
	stwa	%g1,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f2
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x23, %o2
	ldstuba	[%l7 + %o2] 0x89,	%g3
	st	%f21,	[%l7 + 0x24]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i0
	set	0x58, %g6
	lda	[%l7 + %g6] 0x88,	%f18
	nop
	set	0x24, %o0
	stw	%o2,	[%l7 + %o0]
	nop
	set	0x40, %l6
	std	%g2,	[%l7 + %l6]
	ld	[%l7 + 0x50],	%f12
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x88,	 1
	nop
	set	0x7C, %g7
	swap	[%l7 + %g7],	%l4
	nop
	set	0x10, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x0C, %g1
	swapa	[%l7 + %g1] 0x88,	%l1
	st	%f28,	[%l7 + 0x34]
	nop
	set	0x30, %o7
	ldsh	[%l7 + %o7],	%i1
	nop
	set	0x78, %o3
	stx	%i6,	[%l7 + %o3]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f16
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%o5
	st	%fsr,	[%l7 + 0x7C]
	ble	%icc,	loop_220
	nop
	set	0x52, %i5
	lduh	[%l7 + %i5],	%i7
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x80,	%g7
loop_220:
	nop
	set	0x58, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%o0,	%i5,	%o7
	bl,pn	%icc,	loop_221
	or	%l0,	%g6,	%i4
	or	%o3,	%l3,	%o1
	nop
	set	0x18, %o5
	lduw	[%l7 + %o5],	%g4
loop_221:
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%i2
	st	%f2,	[%l7 + 0x18]
	set	0x58, %o6
	stda	%l4,	[%l7 + %o6] 0x88
	set	0x30, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%g3
	nop
	set	0x40, %g5
	swap	[%l7 + %g5],	%l2
	nop
	set	0x30, %i3
	stw	%i0,	[%l7 + %i3]
	set	0x48, %i7
	stda	%g0,	[%l7 + %i7] 0x89
	nop
	set	0x2A, %o1
	lduh	[%l7 + %o1],	%o2
	fpsub16	%f30,	%f4,	%f14
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%g2
	wr	%l4,	%l1,	%sys_tick
	set	0x48, %i4
	stba	%i1,	[%l7 + %i4] 0x80
	set	0x38, %g4
	sta	%f23,	[%l7 + %g4] 0x89
	nop
	set	0x12, %g2
	ldub	[%l7 + %g2],	%g5
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x89,	 2
	nop
	set	0x24, %i2
	ldsb	[%l7 + %i2],	%i6
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x81,	%g7
	set	0x68, %g6
	lda	[%l7 + %g6] 0x80,	%f26
	set	0x40, %o0
	stxa	%o0,	[%l7 + %o0] 0x89
	nop
	set	0x58, %l6
	lduw	[%l7 + %l6],	%i5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x80
	bl,pt	%icc,	loop_222
	nop
	set	0x50, %l2
	lduw	[%l7 + %l2],	%i7
	add	%l0,	%o7,	%g6
	fpsub16	%f0,	%f30,	%f24
loop_222:
	nop
	set	0x40, %g1
	std	%f0,	[%l7 + %g1]
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%f14
	nop
	set	0x28, %o7
	swap	[%l7 + %o7],	%o3
	or	%i4,	%l3,	%o1
	add	%g4,	%l5,	%i2
	set	0x46, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l6
	nop
	set	0x68, %o3
	std	%f10,	[%l7 + %o3]
	nop
	set	0x23, %i5
	ldsb	[%l7 + %i5],	%i3
	nop
	set	0x7A, %g3
	ldsh	[%l7 + %g3],	%o4
	bleu,a,pt	%xcc,	loop_223
	nop
	set	0x1C, %l5
	ldstub	[%l7 + %l5],	%o6
	nop
	set	0x79, %l0
	ldsb	[%l7 + %l0],	%l2
	add	%g3,	%i0,	%g1
loop_223:
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%g2
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xeb,	%l4
	nop
	set	0x74, %o5
	swap	[%l7 + %o5],	%o2
	or	%l1,	%g5,	%i1
	set	0x08, %i1
	stda	%o4,	[%l7 + %i1] 0x80
	wr	%g7,	%i6,	%softint
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l0
	ld	[%l7 + 0x68],	%f0
	and	%o7,	%i5,	%o3
	nop
	set	0x28, %i3
	std	%g6,	[%l7 + %i3]
	set	0x6C, %o1
	stwa	%i4,	[%l7 + %o1] 0x89
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x80,	%l2
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%l5
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%i6
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%i3
	nop
	set	0x74, %l1
	ldsw	[%l7 + %l1],	%o4
	nop
	set	0x26, %g6
	ldub	[%l7 + %g6],	%o6
	ld	[%l7 + 0x40],	%f9
	fpsub16s	%f0,	%f13,	%f10
	set	0x5C, %o0
	sta	%f26,	[%l7 + %o0] 0x88
	set	0x2C, %o2
	swapa	[%l7 + %o2] 0x89,	%l2
	nop
	set	0x2B, %g7
	ldsb	[%l7 + %g7],	%g3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf0
	membar	#Sync
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd2
	set	0x44, %l6
	stha	%i2,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x1C, %i6
	swapa	[%l7 + %i6] 0x80,	%i0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%l4
	set	0x30, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x89,	%l1
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%o2
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%i0
	nop
	set	0x78, %l5
	stx	%o5,	[%l7 + %l5]
	ld	[%l7 + 0x34],	%f26
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%g7
	ld	[%l7 + 0x68],	%f31
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf9
	membar	#Sync
	set	0x50, %o3
	swapa	[%l7 + %o3] 0x88,	%g5
	nop
	set	0x38, %o5
	ldub	[%l7 + %o5],	%o0
	set	0x74, %i1
	stwa	%i7,	[%l7 + %i1] 0x81
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc0
	set	0x1C, %o6
	stwa	%i6,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x20, %i7
	std	%f12,	[%l7 + %i7]
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%l0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%i5
	nop
	set	0x50, %l3
	std	%o2,	[%l7 + %l3]
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x80,	%i4
	and	%l3,	%g6,	%o1
	nop
	set	0x36, %o4
	ldsh	[%l7 + %o4],	%l5
	set	0x60, %g4
	ldda	[%l7 + %g4] 0x81,	%g4
	nop
	set	0x50, %g2
	ldsw	[%l7 + %g2],	%i3
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%l6
	set	0x31, %l1
	stba	%o4,	[%l7 + %l1] 0x89
	bn,a,pn	%xcc,	loop_224
	nop
	set	0x79, %o1
	ldub	[%l7 + %o1],	%l2
	ld	[%l7 + 0x2C],	%f19
	nop
	set	0x5C, %g6
	ldsw	[%l7 + %g6],	%o6
loop_224:
	bl,pn	%xcc,	loop_225
	st	%f23,	[%l7 + 0x30]
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
loop_225:
	add	%i0,	%g2,	%g3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%l1
	wr	%o2,	%i1,	%pic
	nop
	set	0x68, %o2
	lduw	[%l7 + %o2],	%o5
	set	0x74, %l2
	stba	%g7,	[%l7 + %l2] 0x88
	set	0x50, %g1
	sta	%f3,	[%l7 + %g1] 0x89
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%g5
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x0E, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o0
	nop
	set	0x30, %i0
	ldub	[%l7 + %i0],	%g1
	nop
	set	0x28, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%i6
	set	0x3B, %l5
	ldstuba	[%l7 + %l5] 0x81,	%i6
	nop
	set	0x48, %l0
	ldsb	[%l7 + %l0],	%o7
	set	0x6C, %l4
	sta	%f23,	[%l7 + %l4] 0x81
	nop
	set	0x50, %g3
	lduw	[%l7 + %g3],	%l0
	nop
	set	0x60, %o3
	std	%f0,	[%l7 + %o3]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i5
	ld	[%l7 + 0x58],	%f1
	nop
	set	0x0C, %o5
	ldsh	[%l7 + %o5],	%i4
	set	0x50, %i1
	stwa	%g6,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%o1
	nop
	set	0x78, %i7
	lduh	[%l7 + %i7],	%l3
	nop
	set	0x52, %o6
	sth	%l5,	[%l7 + %o6]
	wr	%i3,	%l6,	%softint
	and	%g4,	%o4,	%o6
	nop
	set	0x48, %l3
	std	%i2,	[%l7 + %l3]
	nop
	set	0x64, %i3
	ldsw	[%l7 + %i3],	%l2
	nop
	set	0x12, %o4
	ldsh	[%l7 + %o4],	%g2
	add	%i0,	%g3,	%l4
	nop
	set	0x20, %i4
	stx	%o2,	[%l7 + %i4]
	nop
	set	0x2C, %g2
	stw	%i1,	[%l7 + %g2]
	ble	%xcc,	loop_226
	nop
	set	0x65, %i2
	ldsb	[%l7 + %i2],	%l1
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%g6
	set	0x68, %l1
	stxa	%o5,	[%l7 + %l1] 0x89
loop_226:
	nop
	set	0x44, %g6
	swapa	[%l7 + %g6] 0x88,	%g5
	and	%g1,	%o0,	%i7
	or	%o7,	%l0,	%o3
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%i4
	st	%f23,	[%l7 + 0x64]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc2
	nop
	set	0x47, %g1
	stb	%g6,	[%l7 + %g1]
	nop
	set	0x48, %l6
	ldsw	[%l7 + %l6],	%i5
	set	0x28, %g7
	stxa	%l3,	[%l7 + %g7] 0x81
	ble,pn	%xcc,	loop_227
	nop
	set	0x38, %o2
	stx	%fsr,	[%l7 + %o2]
	fpsub32	%f0,	%f20,	%f4
	nop
	set	0x40, %i0
	std	%l4,	[%l7 + %i0]
loop_227:
	nop
	set	0x36, %i5
	ldsh	[%l7 + %i5],	%i3
	nop
	set	0x38, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x7C, %i6
	ldsh	[%l7 + %i6],	%l6
	set	0x48, %l0
	stda	%g4,	[%l7 + %l0] 0x89
	nop
	set	0x68, %l5
	lduw	[%l7 + %l5],	%o4
	fpsub32	%f2,	%f0,	%f12
	set	0x4C, %g3
	stba	%o6,	[%l7 + %g3] 0x88
	and	%i2,	%g2,	%i0
	nop
	set	0x3C, %l4
	ldsh	[%l7 + %l4],	%l2
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x89,	%f2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%o2
	set	0x78, %i1
	lda	[%l7 + %i1] 0x80,	%f15
	nop
	set	0x67, %o3
	ldstub	[%l7 + %o3],	%i1
	set	0x30, %g5
	lda	[%l7 + %g5] 0x80,	%f11
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x68, %l3
	std	%g2,	[%l7 + %l3]
	set	0x5C, %o6
	swapa	[%l7 + %o6] 0x80,	%g7
	nop
	set	0x74, %o4
	ldsw	[%l7 + %o4],	%l1
	nop
	set	0x1E, %i4
	lduh	[%l7 + %i4],	%o5
	nop
	set	0x1E, %i3
	ldub	[%l7 + %i3],	%g5
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf8
	membar	#Sync
	nop
	set	0x76, %g4
	ldsb	[%l7 + %g4],	%g1
	set	0x34, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o0
	nop
	set	0x70, %i2
	stx	%i7,	[%l7 + %i2]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc8
	st	%f16,	[%l7 + 0x0C]
	set	0x70, %o0
	stha	%l0,	[%l7 + %o0] 0x89
	ld	[%l7 + 0x5C],	%f2
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%o6
	nop
	set	0x30, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x55, %g1
	ldsb	[%l7 + %g1],	%o3
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x80,	%i4
	set	0x10, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l3
	wr	%l5,	%i3,	%clear_softint
	set	0x10, %o2
	stda	%g6,	[%l7 + %o2] 0x81
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g4
	nop
	set	0x28, %i0
	sth	%o4,	[%l7 + %i0]
	st	%f21,	[%l7 + 0x68]
	nop
	set	0x32, %i5
	ldub	[%l7 + %i5],	%o6
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%i2
	and	%g2,	%l2,	%l4
	ld	[%l7 + 0x50],	%f8
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x61, %i6
	ldstub	[%l7 + %i6],	%i0
	nop
	set	0x30, %l0
	stw	%o2,	[%l7 + %l0]
	nop
	set	0x37, %l5
	stb	%g3,	[%l7 + %l5]
	nop
	set	0x58, %l4
	sth	%i1,	[%l7 + %l4]
	nop
	nop
	setx	0x9CAF0EC01CD8C36C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD737D0349A3AEAC0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f30,	%f6
	set	0x24, %o5
	stha	%l1,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xF09, 	%tick_cmpr
	nop
	set	0x0C, %g3
	lduh	[%l7 + %g3],	%o0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g7
	nop
	set	0x70, %o3
	std	%o6,	[%l7 + %o3]
	set	0x10, %i7
	ldda	[%l7 + %i7] 0xe2,	%l0
	nop
	set	0x10, %g5
	ldsw	[%l7 + %g5],	%i4
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xea,	%o2
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x2A, %i4
	stba	%i5,	[%l7 + %i4] 0xeb
	membar	#Sync
	fpsub16s	%f5,	%f10,	%f4
	set	0x08, %o4
	stda	%i6,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x74, %g2
	swap	[%l7 + %g2],	%l5
	nop
	set	0x5D, %i3
	ldub	[%l7 + %i3],	%i3
	set	0x79, %l1
	stba	%g6,	[%l7 + %l1] 0x88
	set	0x40, %i2
	stda	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x70, %o1
	prefetch	[%l7 + %o1],	 0
	nop
	set	0x57, %o0
	stb	%g4,	[%l7 + %o0]
	nop
	set	0x4E, %g4
	stb	%l3,	[%l7 + %g4]
	set	0x60, %l2
	swapa	[%l7 + %l2] 0x89,	%o6
	set	0x18, %g1
	stxa	%o4,	[%l7 + %g1] 0x81
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%i2
	st	%f22,	[%l7 + 0x60]
	set	0x0E, %l6
	stba	%g2,	[%l7 + %l6] 0x81
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x78, %o2
	std	%f0,	[%l7 + %o2]
	and	%o1,	%l4,	%i0
	nop
	set	0x0A, %g7
	stb	%o2,	[%l7 + %g7]
	nop
	set	0x7D, %i5
	ldsb	[%l7 + %i5],	%l2
	nop
	set	0x74, %i0
	sth	%g3,	[%l7 + %i0]
	nop
	set	0x2C, %i6
	sth	%l1,	[%l7 + %i6]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xd2
	ld	[%l7 + 0x20],	%f1
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%o5
	nop
	set	0x7A, %l5
	sth	%i1,	[%l7 + %l5]
	nop
	set	0x1A, %o5
	ldsh	[%l7 + %o5],	%g5
	nop
	set	0x1C, %l4
	stw	%o0,	[%l7 + %l4]
	nop
	set	0x28, %i1
	ldsh	[%l7 + %i1],	%i7
	ld	[%l7 + 0x20],	%f11
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd8
	nop
	set	0x70, %i7
	prefetch	[%l7 + %i7],	 3
	set	0x10, %o3
	stda	%g6,	[%l7 + %o3] 0x81
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%g1
	and	%o7,	%l0,	%o3
	set	0x58, %l3
	stha	%i4,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x6C, %i4
	stw	%i5,	[%l7 + %i4]
	ld	[%l7 + 0x74],	%f25
	ld	[%l7 + 0x38],	%f10
	set	0x10, %g5
	swapa	[%l7 + %g5] 0x88,	%l5
	set	0x2A, %g2
	stha	%i3,	[%l7 + %g2] 0xe2
	membar	#Sync
	or	%g6,	%l6,	%g4
	fpsub32	%f18,	%f12,	%f8
	nop
	set	0x13, %i3
	ldstub	[%l7 + %i3],	%i6
	add	%l3,	%o6,	%o4
	ld	[%l7 + 0x60],	%f26
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%i2
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x80,	%o1
	nop
	set	0x44, %o1
	lduh	[%l7 + %o1],	%l4
	set	0x48, %l1
	lda	[%l7 + %l1] 0x81,	%f1
	nop
	set	0x10, %g4
	std	%f26,	[%l7 + %g4]
	nop
	set	0x13, %o0
	ldub	[%l7 + %o0],	%g2
	set	0x30, %l2
	ldda	[%l7 + %l2] 0xe2,	%o2
	nop
	set	0x34, %g6
	stw	%l2,	[%l7 + %g6]
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%g3
	or	%i0,	%o5,	%i1
	st	%f18,	[%l7 + 0x20]
	set	0x24, %o2
	lda	[%l7 + %o2] 0x88,	%f19
	set	0x1C, %g7
	ldstuba	[%l7 + %g7] 0x80,	%l1
	nop
	set	0x5C, %i5
	swap	[%l7 + %i5],	%g5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%o0
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%g0
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%g6
	st	%f31,	[%l7 + 0x74]
	set	0x58, %i6
	ldxa	[%l7 + %i6] 0x80,	%l0
	nop
	set	0x50, %l0
	stw	%o7,	[%l7 + %l0]
	nop
	set	0x6C, %o7
	lduw	[%l7 + %o7],	%o3
	set	0x5F, %o5
	ldstuba	[%l7 + %o5] 0x88,	%i4
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f16
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x81
	nop
	set	0x68, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x50, %l4
	stxa	%l5,	[%l7 + %l4] 0x88
	nop
	set	0x18, %o3
	stb	%i3,	[%l7 + %o3]
	set	0x0B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i5
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%g6
	nop
	set	0x57, %l3
	ldstub	[%l7 + %l3],	%g4
	nop
	set	0x60, %g5
	swap	[%l7 + %g5],	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%o6
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%o4
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x54, %o4
	ldsh	[%l7 + %o4],	%i2
	nop
	set	0x2F, %i3
	ldub	[%l7 + %i3],	%i6
	set	0x61, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o1
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x89,	%g2
	nop
	set	0x68, %g4
	stx	%o2,	[%l7 + %g4]
	nop
	set	0x20, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x20, %o0
	lduw	[%l7 + %o0],	%l2
	set	0x28, %g6
	stxa	%l4,	[%l7 + %g6] 0x88
	nop
	set	0x08, %l6
	swap	[%l7 + %l6],	%i0
	add	%o5,	%i1,	%g3
	nop
	set	0x50, %l2
	sth	%g5,	[%l7 + %l2]
	be,a,pt	%icc,	loop_228
	nop
	set	0x50, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x60, %i5
	ldsw	[%l7 + %i5],	%i7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x81,	%f0
loop_228:
	nop
	set	0x48, %o2
	ldx	[%l7 + %o2],	%l1
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f30
	set	0x2A, %i6
	stha	%g1,	[%l7 + %i6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x38]
	add	%o0,	%g7,	%l0
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x81,	 3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i4
	set	0x20, %o7
	stba	%i3,	[%l7 + %o7] 0x89
	set	0x34, %o5
	stwa	%l5,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x38, %l5
	stw	%i5,	[%l7 + %l5]
	set	0x3C, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g6
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%l6
	nop
	set	0x0E, %i1
	ldsh	[%l7 + %i1],	%g4
	bl,a	%icc,	loop_229
	nop
	set	0x50, %o3
	ldx	[%l7 + %o3],	%o6
	nop
	set	0x6C, %i7
	ldsh	[%l7 + %i7],	%l3
	set	0x34, %o6
	sta	%f30,	[%l7 + %o6] 0x88
loop_229:
	nop
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x81,	%o4
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	set	0x60, %g2
	ldda	[%l7 + %g2] 0x89,	%i2
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x30, %i4
	lda	[%l7 + %i4] 0x88,	%f19
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%o0
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%o2
	nop
	set	0x4E, %g4
	ldub	[%l7 + %g4],	%l2
	nop
	set	0x14, %o1
	stb	%l4,	[%l7 + %o1]
	nop
	set	0x47, %l1
	ldstub	[%l7 + %l1],	%g2
	nop
	set	0x10, %o0
	std	%i0,	[%l7 + %o0]
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%o5
	nop
	set	0x2A, %l2
	ldsh	[%l7 + %l2],	%g3
	nop
	set	0x40, %g7
	std	%i0,	[%l7 + %g7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i7,	%g5
	fpadd32s	%f11,	%f12,	%f20
	nop
	set	0x50, %i5
	std	%f0,	[%l7 + %i5]
	nop
	set	0x38, %g6
	sth	%l1,	[%l7 + %g6]
	set	0x70, %o2
	lda	[%l7 + %o2] 0x81,	%f9
	nop
	set	0x62, %i0
	ldsb	[%l7 + %i0],	%o0
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x88,	%g1
	nop
	set	0x7B, %l0
	ldub	[%l7 + %l0],	%g7
	wr	%l0,	%o7,	%sys_tick
	st	%fsr,	[%l7 + 0x74]
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x81,	 2
	nop
	set	0x7B, %o7
	stb	%i4,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x48, %l5
	stwa	%l5,	[%l7 + %l5] 0xe2
	membar	#Sync
	st	%f31,	[%l7 + 0x18]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x28, %l4
	ldsh	[%l7 + %l4],	%i3
	nop
	set	0x30, %i1
	std	%g6,	[%l7 + %i1]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g4
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f22
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x89,	%i5
	add	%l3,	%o4,	%o6
	nop
	set	0x40, %o6
	stw	%i2,	[%l7 + %o6]
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x88,	%i6
	nop
	set	0x78, %l3
	stx	%fsr,	[%l7 + %l3]
	or	%o1,	%o2,	%l2
	nop
	set	0x7C, %g2
	lduw	[%l7 + %g2],	%g2
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
	or	%i0,	%o5,	%l4
	set	0x20, %i4
	sta	%f9,	[%l7 + %i4] 0x81
	nop
	set	0x4E, %o4
	lduh	[%l7 + %o4],	%g3
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i7
	nop
	set	0x6A, %g4
	ldstub	[%l7 + %g4],	%i1
	add	%l1,	%g5,	%g1
	add	%o0,	%l0,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%o3
	nop
	set	0x44, %o1
	ldstub	[%l7 + %o1],	%l5
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%i4
	nop
	set	0x48, %i2
	stx	%g6,	[%l7 + %i2]
	set	0x20, %l6
	stwa	%i3,	[%l7 + %l6] 0xe3
	membar	#Sync
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x10, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x08, %i5
	std	%f0,	[%l7 + %i5]
	add	%l3,	%i5,	%o4
	ld	[%l7 + 0x24],	%f14
	set	0x50, %l2
	ldxa	[%l7 + %l2] 0x81,	%i2
	nop
	set	0x44, %g6
	lduw	[%l7 + %g6],	%i6
	set	0x48, %o2
	sta	%f11,	[%l7 + %o2] 0x80
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x88,	 2
	nop
	set	0x14, %i6
	sth	%o2,	[%l7 + %i6]
	set	0x2C, %l0
	stha	%l2,	[%l7 + %l0] 0x88
	and	%g2,	%o6,	%o5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x42, %g1
	sth	%i0,	[%l7 + %g1]
	nop
	set	0x58, %l4
	stx	%g3,	[%l7 + %l4]
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x80,	%f8
	set	0x24, %i1
	lda	[%l7 + %i1] 0x80,	%f13
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xd2
	nop
	set	0x56, %o6
	sth	%l4,	[%l7 + %o6]
	nop
	set	0x24, %o3
	ldsw	[%l7 + %o3],	%i7
	set	0x34, %g5
	lda	[%l7 + %g5] 0x89,	%f15
	nop
	set	0x12, %g2
	ldsh	[%l7 + %g2],	%l1
	fpsub32	%f4,	%f4,	%f16
	set	0x70, %g3
	stxa	%i1,	[%l7 + %g3] 0x81
	set	0x48, %i4
	sta	%f1,	[%l7 + %i4] 0x80
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x81,	%g1
	nop
	set	0x58, %l3
	stx	%o0,	[%l7 + %l3]
	set	0x19, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g5
	add	%l0,	%g7,	%o7
	nop
	set	0x7C, %i3
	stw	%o3,	[%l7 + %i3]
	wr	%l5,	%g6,	%pic
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%i3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%g4
	nop
	set	0x57, %i2
	ldsb	[%l7 + %i2],	%l6
	nop
	set	0x48, %l6
	sth	%i5,	[%l7 + %l6]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd2
	set	0x30, %l1
	stxa	%l3,	[%l7 + %l1] 0x88
	and	%o4,	%i6,	%o1
	nop
	set	0x5F, %i5
	ldsb	[%l7 + %i5],	%o2
	nop
	set	0x5C, %l2
	ldub	[%l7 + %l2],	%i2
	nop
	set	0x76, %g6
	ldsb	[%l7 + %g6],	%g2
	nop
	set	0x34, %o2
	lduh	[%l7 + %o2],	%l2
	fpadd32	%f26,	%f14,	%f30
	bge,pt	%icc,	loop_230
	or	%o6,	%i0,	%o5
	set	0x24, %i0
	stwa	%l4,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_230:
	nop
	set	0x24, %g7
	prefetch	[%l7 + %g7],	 2
	or	%g3,	%l1,	%i7
	bgu,pt	%xcc,	loop_231
	add	%g1,	%o0,	%g5
	add	%l0,	%i1,	%o7
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x88,	 1
loop_231:
	nop
	set	0x7F, %l0
	stb	%l5,	[%l7 + %l0]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%i3
	nop
	set	0x33, %o5
	ldsb	[%l7 + %o5],	%o3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%f0
	ld	[%l7 + 0x3C],	%f24
	nop
	set	0x39, %l4
	stb	%g4,	[%l7 + %l4]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xd0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i5
	nop
	set	0x2C, %l5
	stb	%l6,	[%l7 + %l5]
	ld	[%l7 + 0x40],	%f7
	ld	[%l7 + 0x28],	%f22
	nop
	set	0x68, %i1
	std	%l2,	[%l7 + %i1]
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%f16
	ld	[%l7 + 0x40],	%f21
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x88,	 3
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f24
	fpsub32s	%f28,	%f17,	%f4
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x89,	 0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f0
	nop
	set	0x68, %i4
	sth	%o2,	[%l7 + %i4]
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x74, %l3
	ldsw	[%l7 + %l3],	%o1
	nop
	set	0x2C, %g4
	lduh	[%l7 + %g4],	%i2
	ld	[%l7 + 0x5C],	%f25
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%l2
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xeb,	%g2
	and	%o6,	%o5,	%l4
	set	0x1A, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f16
	nop
	set	0x60, %o0
	stw	%g3,	[%l7 + %o0]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xcc
	nop
	set	0x38, %i5
	stx	%i7,	[%l7 + %i5]
	nop
	set	0x50, %g3
	ldub	[%l7 + %g3],	%g1
	nop
	set	0x6C, %g6
	stw	%l1,	[%l7 + %g6]
	set	0x45, %l2
	stba	%g5,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x80,	%l0
	nop
	set	0x5C, %i0
	ldsh	[%l7 + %i0],	%o0
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%o7
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x89,	%g7
	nop
	set	0x28, %g1
	lduw	[%l7 + %g1],	%l5
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x80,	%g6
	or	%i1,	%o3,	%g4
	bne,a	%icc,	loop_232
	add	%i4,	%i5,	%i3
	nop
	set	0x46, %o7
	stb	%l6,	[%l7 + %o7]
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%o4
loop_232:
	nop
	set	0x16, %i1
	ldsh	[%l7 + %i1],	%l3
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x18, %o6
	ldxa	[%l7 + %o6] 0x89,	%i6
	nop
	set	0x20, %g5
	swap	[%l7 + %g5],	%o2
	set	0x52, %o3
	stba	%o1,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x14, %g2
	lda	[%l7 + %g2] 0x88,	%f13
	nop
	set	0x4C, %i7
	sth	%i2,	[%l7 + %i7]
	nop
	set	0x72, %o4
	ldsh	[%l7 + %o4],	%g2
	nop
	set	0x71, %i4
	ldsb	[%l7 + %i4],	%l2
	or	%o6,	%o5,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g3
	set	0x32, %l3
	stba	%g1,	[%l7 + %l3] 0x89
	set	0x58, %g4
	lda	[%l7 + %g4] 0x89,	%f18
	add	%i7,	%l1,	%l0
	ld	[%l7 + 0x50],	%f2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%o0
	set	0x1D, %i3
	stba	%o7,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x81
	set	0x48, %o1
	stxa	%g7,	[%l7 + %o1] 0x89
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%i1
	set	0x10, %l1
	ldda	[%l7 + %l1] 0x88,	%o2
	set	0x50, %i5
	stxa	%g4,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x1A, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%i3
	nop
	set	0x10, %g3
	stw	%l6,	[%l7 + %g3]
	nop
	set	0x08, %l2
	std	%f22,	[%l7 + %l2]
	set	0x23, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i4
	set	0x7C, %i0
	stwa	%l3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%i6
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f18
	add	%o4,	%o2,	%o1
	or	%g2,	%l2,	%o6
	nop
	set	0x58, %l0
	ldsw	[%l7 + %l0],	%i2
	nop
	set	0x7D, %l4
	ldstub	[%l7 + %l4],	%o5
	set	0x09, %o7
	stba	%i0,	[%l7 + %o7] 0x89
	set	0x24, %i6
	stha	%g3,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x09, %g1
	ldstuba	[%l7 + %g1] 0x89,	%l4
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x10, %o6
	lda	[%l7 + %o6] 0x81,	%f18
	ld	[%l7 + 0x6C],	%f11
	st	%fsr,	[%l7 + 0x54]
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x81,	%g1
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd0
	nop
	set	0x10, %g2
	ldstub	[%l7 + %g2],	%l1
	nop
	set	0x64, %o3
	lduh	[%l7 + %o3],	%i7
	nop
	set	0x34, %o4
	stw	%g5,	[%l7 + %o4]
	set	0x58, %i7
	sta	%f2,	[%l7 + %i7] 0x81
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xea,	%o0
	st	%fsr,	[%l7 + 0x5C]
	set	0x48, %g4
	stda	%l0,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x4C, %i3
	stw	%g7,	[%l7 + %i3]
	nop
	set	0x24, %i4
	sth	%o7,	[%l7 + %i4]
	set	0x30, %i2
	stda	%g6,	[%l7 + %i2] 0x81
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	nop
	set	0x50, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x4F, %o0
	ldstub	[%l7 + %o0],	%o3
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x89,	%g4
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x80,	 3
	nop
	set	0x30, %g6
	stx	%l5,	[%l7 + %g6]
	nop
	set	0x2E, %l2
	sth	%i3,	[%l7 + %l2]
	set	0x68, %i0
	stxa	%i4,	[%l7 + %i0] 0x89
	fpsub16s	%f9,	%f23,	%f5
	set	0x34, %o2
	stwa	%l6,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x28, %g7
	std	%f20,	[%l7 + %g7]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1292
!	Type a   	: 22
!	Type cti   	: 21
!	Type x   	: 508
!	Type f   	: 40
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
.word 0xEB95B464
.word 0x5E721503
.word 0xB9B9FBCA
.word 0x2EFA85C3
.word 0x9B45C0AB
.word 0x66F987EE
.word 0x6C3C1F98
.word 0xD27DDD89
.word 0xDA751855
.word 0x47C219AE
.word 0x8D04F0C2
.word 0x7617D116
.word 0xF3A409EA
.word 0xC2CC3C82
.word 0xECD1F6F9
.word 0xAAE45CDD
.word 0xFC172501
.word 0x6460323A
.word 0x56470378
.word 0x45E07953
.word 0xE0E31DE6
.word 0x90CA82D2
.word 0x33D26952
.word 0xEA2EA1A4
.word 0x37C37B4D
.word 0x50A70B65
.word 0xAE9A928E
.word 0x69002CCE
.word 0x896A1711
.word 0xC7648AF4
.word 0x0BCEE746
.word 0x44E7A9A5
.word 0x7F426950
.word 0xF6950FB9
.word 0xBB3895A6
.word 0x8707757C
.word 0x69296364
.word 0x1F8F506C
.word 0xB8D50EAB
.word 0x8FDA5EA8
.word 0xF15C8275
.word 0xE84B583F
.word 0x91C57D91
.word 0x66439784
.word 0x99AE278B
.word 0x0A051B71
.word 0x350C197A
.word 0x9E39A67E
.word 0x1D465307
.word 0x2540C6D7
.word 0x50F6E488
.word 0x7F4ED167
.word 0xF224FA0B
.word 0xC074B476
.word 0x188BA512
.word 0xF1AA09B7
.word 0x957B632B
.word 0x120ECE17
.word 0x1789044C
.word 0x9A234249
.word 0xC9E39DCA
.word 0x1D0B49C8
.word 0x1185A0B0
.word 0xC19DCFF3
!! thread 1 data, 64 words.
.word 0x7EE83F3D
.word 0xAE6DAF1C
.word 0x8F8D56D0
.word 0x5566DB7F
.word 0x52925CEF
.word 0xC272242A
.word 0xAA0A591A
.word 0xC44AA92C
.word 0xDF752EA3
.word 0xCF9C6A6D
.word 0x289E23E9
.word 0x5A299298
.word 0xC11D104D
.word 0xF5699354
.word 0x48EFAD0F
.word 0x4129E391
.word 0x1D4CA3CB
.word 0x595744E7
.word 0x57890DAB
.word 0x97708A5E
.word 0xD6C5BA11
.word 0x5853F855
.word 0xE37F7D95
.word 0x49CFC64E
.word 0x666943BC
.word 0x1A1A9726
.word 0x463EEB23
.word 0x322B18FB
.word 0xCE42E43C
.word 0x80787FB7
.word 0xB6356335
.word 0x8387F22F
.word 0x964DA4E2
.word 0x1336A17D
.word 0x4B656FE8
.word 0xDF57729E
.word 0x3AC2AECB
.word 0x1BECFA42
.word 0x92889731
.word 0xB10DA152
.word 0xA5F19818
.word 0x90345389
.word 0x44BF3D51
.word 0x1FA64FEB
.word 0x08F6A333
.word 0x163D4F85
.word 0xE086D7BA
.word 0x292F47A9
.word 0xC045F132
.word 0x84485AC4
.word 0x8C2F088A
.word 0x4CCF284B
.word 0x8CC7FE10
.word 0xD95341AC
.word 0x5ACFD2DC
.word 0x9C696E9B
.word 0xBBD25698
.word 0x2FF76013
.word 0xB3247FAF
.word 0x9A4188FB
.word 0x584029B1
.word 0x6F52A710
.word 0xCC1E5BF4
.word 0xF88AAEB2
!! thread 2 data, 64 words.
.word 0xF86AA263
.word 0x14322082
.word 0x7CB38616
.word 0x141DB156
.word 0x82D79EF2
.word 0xE930D9DE
.word 0xADA754C7
.word 0xDF1C626E
.word 0x75C4D165
.word 0xB37A0295
.word 0xB2943E9B
.word 0x487EEE5D
.word 0x09FE4CC6
.word 0x056FEB3F
.word 0x759FCA9D
.word 0x00131633
.word 0x66AD5FEE
.word 0x94C6ECF8
.word 0x6DF42968
.word 0xA0872F76
.word 0x0ECC008E
.word 0xA12D23A3
.word 0xADF24E05
.word 0xBFEAD191
.word 0x8A18453E
.word 0x67697908
.word 0x40A45923
.word 0x7FB2FE93
.word 0xE623144E
.word 0x056A863B
.word 0x8B11020E
.word 0xDD621EA2
.word 0x32108293
.word 0x0A031F4A
.word 0x581E7185
.word 0x09756758
.word 0x3B85E258
.word 0xA15A6A71
.word 0xB30646F0
.word 0x504B2CCB
.word 0x168F6C34
.word 0x9250B0D4
.word 0x3793C0C1
.word 0xEE146868
.word 0xE8A82851
.word 0x39E4CA76
.word 0x35953A1F
.word 0x583494EF
.word 0xE09375DC
.word 0x46765536
.word 0x02BF528C
.word 0xD94A4AFB
.word 0x9E5C9E08
.word 0x05D9A28D
.word 0x5DD78C1B
.word 0xA7011CE2
.word 0xC0125DFA
.word 0xC3DD588C
.word 0x87615B1B
.word 0x0E1EAD5E
.word 0x0D528F3C
.word 0x957EA96F
.word 0x06B163BF
.word 0xC067616A
!! thread 3 data, 64 words.
.word 0x5D90166F
.word 0x53015A6F
.word 0x3F7FC5F5
.word 0x64FB2D5C
.word 0xE7EF418E
.word 0xC366C61D
.word 0x73282BE5
.word 0x0D3B85B1
.word 0x0E80BB3F
.word 0xA2BFE25E
.word 0x6AD71400
.word 0x420D7022
.word 0xD82B5AEC
.word 0x43A8F4A4
.word 0x5C384025
.word 0xBDDDF048
.word 0x61B44A6A
.word 0xD8CB0372
.word 0x1A3001C3
.word 0x3342C585
.word 0x5F1F56C3
.word 0xB61AC758
.word 0xEDF572D7
.word 0x6D10B5D5
.word 0xDF7EA2D6
.word 0x10958CE0
.word 0x9B65ADA4
.word 0xB69ED582
.word 0x85D162C8
.word 0x66FC5E93
.word 0xCDE75DB2
.word 0x81639A1D
.word 0x375F9264
.word 0x04AF49FE
.word 0x2149251A
.word 0x32A2A6B3
.word 0x515AB752
.word 0x29368DD8
.word 0xFCFC548E
.word 0x90808930
.word 0x0B3F6E04
.word 0xBA820892
.word 0xC6EA5CC8
.word 0x6C05DD7F
.word 0x0E7CA8A3
.word 0xEC37F197
.word 0x7794A868
.word 0x858411E1
.word 0x16A2D0DB
.word 0x9AE480E8
.word 0x29B3A7C9
.word 0xBD0553EF
.word 0xC32E4A2E
.word 0xDEF6F4BB
.word 0xDE61AF50
.word 0xFFDAC445
.word 0x9663B25D
.word 0x6DBACFAD
.word 0xCA63BF44
.word 0x03FE1ACB
.word 0x66D0867C
.word 0x18BB32FF
.word 0x331CBC31
.word 0x4E555EF3
!! thread 4 data, 64 words.
.word 0x93B705BA
.word 0x3204F5A8
.word 0x31115B28
.word 0xA81A94E7
.word 0xEC060939
.word 0xDF8E3FE4
.word 0xCC7FD85B
.word 0x8EA46E2A
.word 0x0BC886DC
.word 0xC6BAC6BE
.word 0x74763AA7
.word 0x343AAE71
.word 0xA9644375
.word 0xBBAEA81B
.word 0x14CEA69F
.word 0xD72A68D2
.word 0xDAF23CBE
.word 0xCC69D539
.word 0x415E49ED
.word 0xE17631F8
.word 0x48572CA2
.word 0x962FFE78
.word 0x6EE15EC1
.word 0xE5F56F8A
.word 0xD9728A8E
.word 0x12833B84
.word 0xD2E850E6
.word 0xFBDCEDE7
.word 0x14282D34
.word 0x28B3F345
.word 0xBDA2466B
.word 0x9D4F9A99
.word 0xB5486BD9
.word 0x46D2AAB2
.word 0x78F44554
.word 0x5543BD90
.word 0x4CE3DA4A
.word 0x0312CFFB
.word 0x824F72FC
.word 0x9B363C27
.word 0xCB5FAA9B
.word 0x787DD89F
.word 0x4DF9F95A
.word 0xFB419930
.word 0x0475D49D
.word 0x63193EFF
.word 0x55F6F6AB
.word 0x76A1A440
.word 0x90548042
.word 0x536D4D54
.word 0x99F96D63
.word 0x1EC890EA
.word 0x066236FB
.word 0x09C202D1
.word 0xAB0EE134
.word 0xA269CD5A
.word 0xFF7725A2
.word 0xC44DA373
.word 0x14908BD0
.word 0x8CE6078E
.word 0x5CE88B3E
.word 0x20C82D0F
.word 0x4402B397
.word 0xA334DFB5
!! thread 5 data, 64 words.
.word 0x04D657C3
.word 0xF824940D
.word 0xC41C8242
.word 0x4195A1E0
.word 0x305D3791
.word 0x2243819F
.word 0xA43D0C16
.word 0x2AD6B34B
.word 0xED6DCA91
.word 0x66719AE8
.word 0x9C754BC1
.word 0x7EA7303F
.word 0x0017BF96
.word 0x8BA0FFB1
.word 0xF0E466F9
.word 0xC8D65FB1
.word 0x96C6E486
.word 0xC748A4A4
.word 0x3BE44CDD
.word 0x6A5D5844
.word 0x8E54101D
.word 0xF47305B3
.word 0x3F5AD659
.word 0x353682C8
.word 0x5DB4F0ED
.word 0x82B60C7E
.word 0x393B21BD
.word 0x89FEF5A2
.word 0x4ADB5679
.word 0xE88332CD
.word 0x2F548A52
.word 0xC7922E51
.word 0xA9E0394C
.word 0x4996345F
.word 0x6229EC89
.word 0x76920856
.word 0x92279EC1
.word 0xA4760476
.word 0xE6E7E903
.word 0x72496641
.word 0x6A69285F
.word 0x237C35E2
.word 0x0D3490E4
.word 0xEAAA98AA
.word 0xB9929F2A
.word 0x8AD93B24
.word 0x1703CCA3
.word 0x9626C182
.word 0xE5B9BC02
.word 0x507A9010
.word 0x3F1A57F7
.word 0xC1B23879
.word 0x9ABDB0AF
.word 0xD7344E00
.word 0x9733442A
.word 0x38E61720
.word 0xE54E1DCF
.word 0xE8CC493C
.word 0xD74376B9
.word 0xB267BA6D
.word 0x23030071
.word 0xBBCBA1A1
.word 0x6793E9C9
.word 0x956A2B33
!! thread 6 data, 64 words.
.word 0x844B3CA5
.word 0x27BCC201
.word 0x43A7DF2A
.word 0x773A5866
.word 0x55F87ED3
.word 0xB5E5D28B
.word 0x804C888F
.word 0xA2810639
.word 0xBDBFB3CB
.word 0xCA5069D8
.word 0x6078A2E1
.word 0xB8E5D23E
.word 0x3411FCA2
.word 0x7BEE3097
.word 0xC63361AD
.word 0x09AA0B46
.word 0x46262ED9
.word 0xDD7EAAFC
.word 0x2426FCB9
.word 0x685E0F72
.word 0x10F140A0
.word 0x77BA84FE
.word 0xC411E7B1
.word 0x1D19F8DA
.word 0x41B0CC6E
.word 0xC313B765
.word 0x8CB7D536
.word 0x46F87DC6
.word 0x1730AA78
.word 0x46A46919
.word 0x68EF3CF0
.word 0xA8FDC959
.word 0x06FEC389
.word 0x177D6530
.word 0xEF924416
.word 0x246DC836
.word 0x015F3294
.word 0x3899D095
.word 0x036528B0
.word 0x01AFE0AF
.word 0x54B0C299
.word 0x7E14FDC3
.word 0x51272FE9
.word 0xDBF991A4
.word 0x72A340E5
.word 0x3DF2F654
.word 0x02928D53
.word 0x6D811C44
.word 0x2DD32142
.word 0x2CB6C66E
.word 0xC60BBB16
.word 0x52ED9F6C
.word 0xD35EEED3
.word 0x23E99775
.word 0xAD8EAFC7
.word 0xFE153476
.word 0xF7F110AC
.word 0x5AB51F4A
.word 0x138DABEC
.word 0xAC4C5030
.word 0x2879D3C7
.word 0x65FA54F7
.word 0x0235D7C8
.word 0x1A9B656E
!! thread 7 data, 64 words.
.word 0x739578B9
.word 0x7A6657F6
.word 0xD1C06C9A
.word 0x8E615C34
.word 0x0672755D
.word 0x3A733051
.word 0x44B5F653
.word 0x614F8F6D
.word 0xBE472286
.word 0x5FF9CFB5
.word 0x358E9D4C
.word 0xB83FAC95
.word 0x834BDF7C
.word 0xD70F648E
.word 0x7965162E
.word 0x2420E5D9
.word 0xBB5833D8
.word 0x2B4299F7
.word 0x654B825F
.word 0x3ED59786
.word 0xE4C6C2A7
.word 0x3A5B5920
.word 0x0A8161C0
.word 0x9951DD88
.word 0x073AD103
.word 0xF599B572
.word 0xCED4D5FA
.word 0x99E80021
.word 0xBAC8C189
.word 0x0D4B1909
.word 0x3C0B7E9E
.word 0xE6775319
.word 0xF6FBFD43
.word 0xE81DE83F
.word 0x6258B3F2
.word 0x330AB8DE
.word 0x1FB0518B
.word 0x702694C5
.word 0xC7E7E6EF
.word 0x713ADA82
.word 0x1C2484ED
.word 0x79E3878E
.word 0xD914746B
.word 0x697517FD
.word 0xFAFBBBD3
.word 0xBCCB0224
.word 0x0CD4BE81
.word 0x5EA7D1E0
.word 0x535DDE06
.word 0x28D8D6DC
.word 0x4BD258C8
.word 0xF768EE64
.word 0x5C8867A5
.word 0x77DDE9E1
.word 0xA30B6846
.word 0xDF042992
.word 0x8A327F46
.word 0x0B7E3E28
.word 0x50F6ECBB
.word 0x5670010F
.word 0x595CA115
.word 0xD172DEF5
.word 0xE95DD73A
.word 0xD16CDC87
.end
