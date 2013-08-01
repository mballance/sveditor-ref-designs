/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc13.s
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
	set	0x4,	%g2
	set	0x8,	%g3
	set	0xE,	%g4
	set	0xB,	%g5
	set	0x1,	%g6
	set	0x0,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0xC,	%i1
	set	-0x9,	%i2
	set	-0xE,	%i3
	set	-0xC,	%i4
	set	-0xA,	%i5
	set	-0x1,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x5131F02F,	%l0
	set	0x472B1D6A,	%l1
	set	0x455E66A3,	%l2
	set	0x4B3FB4D3,	%l3
	set	0x7662C64C,	%l4
	set	0x46775DC4,	%l5
	set	0x03B26991,	%l6
	!# Output registers
	set	0x1D12,	%o0
	set	-0x1081,	%o1
	set	-0x196A,	%o2
	set	0x02A2,	%o3
	set	-0x0C22,	%o4
	set	-0x09A5,	%o5
	set	-0x047E,	%o6
	set	0x1305,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD576B0DD8BA9CFFD)
	INIT_TH_FP_REG(%l7,%f2,0xD277817276C8B223)
	INIT_TH_FP_REG(%l7,%f4,0xB59BC4D88C3744D8)
	INIT_TH_FP_REG(%l7,%f6,0xDFD6EE12504F28DD)
	INIT_TH_FP_REG(%l7,%f8,0xDE30F80807AECBF8)
	INIT_TH_FP_REG(%l7,%f10,0xCEDB41F7C0E8D632)
	INIT_TH_FP_REG(%l7,%f12,0x03C3FA2EEAAA9B11)
	INIT_TH_FP_REG(%l7,%f14,0x2405A13F8F035289)
	INIT_TH_FP_REG(%l7,%f16,0x49DC7285A22AF9F6)
	INIT_TH_FP_REG(%l7,%f18,0xB16A423696908194)
	INIT_TH_FP_REG(%l7,%f20,0x562F61DAE7BF7408)
	INIT_TH_FP_REG(%l7,%f22,0xBBD0BF109EB2951D)
	INIT_TH_FP_REG(%l7,%f24,0x80ADF2A5F676B429)
	INIT_TH_FP_REG(%l7,%f26,0xF64C048FB1283C8C)
	INIT_TH_FP_REG(%l7,%f28,0x05985E2E75A0EF88)
	INIT_TH_FP_REG(%l7,%f30,0xB59FEC20EEA64A7B)

	!# Execute Main Diag ..

	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f16
	ld	[%l7 + 0x5C],	%f9
	set	0x58, %g4
	stha	%g2,	[%l7 + %g4] 0x88
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x89,	%l2
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	nop
	set	0x48, %g6
	ldsh	[%l7 + %g6],	%l5
	nop
	set	0x7E, %i3
	lduh	[%l7 + %i3],	%l3
	set	0x48, %i1
	stwa	%i2,	[%l7 + %i1] 0x88
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
	or	%g6,	%g5,	%g7
	set	0x2C, %l1
	sta	%f15,	[%l7 + %l1] 0x88
	st	%f22,	[%l7 + 0x30]
	nop
	set	0x28, %i0
	stw	%i6,	[%l7 + %i0]
	nop
	set	0x7C, %o0
	swap	[%l7 + %o0],	%l0
	ld	[%l7 + 0x2C],	%f24
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o7
	ld	[%l7 + 0x14],	%f3
	nop
	set	0x50, %g2
	ldsh	[%l7 + %g2],	%l1
	nop
	set	0x64, %l2
	ldsh	[%l7 + %l2],	%i1
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x46, %o4
	lduh	[%l7 + %o4],	%i3
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%f28
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x34, %i5
	prefetch	[%l7 + %i5],	 2
	nop
	set	0x28, %o2
	stw	%o6,	[%l7 + %o2]
	nop
	set	0x1C, %o5
	stw	%o0,	[%l7 + %o5]
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%i0
	or	%o4,	%l6,	%o2
	set	0x10, %o1
	stha	%g1,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x47, %g5
	ldsb	[%l7 + %g5],	%o1
	nop
	set	0x50, %l0
	std	%o4,	[%l7 + %l0]
	bleu,pn	%xcc,	loop_1
	nop
	set	0x40, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x1F, %o6
	ldub	[%l7 + %o6],	%l4
	or	%i7,	%i5,	%g2
loop_1:
	nop
	set	0x40, %o3
	stwa	%g4,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f28
	nop
	set	0x44, %g3
	lduh	[%l7 + %g3],	%l2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x88
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	set	0x50, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc2
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%i2
	nop
	set	0x48, %g6
	std	%f14,	[%l7 + %g6]
	set	0x58, %i7
	swapa	[%l7 + %i7] 0x89,	%g6
	nop
	set	0x4E, %i1
	sth	%l5,	[%l7 + %i1]
	set	0x1A, %g7
	stha	%g5,	[%l7 + %g7] 0x89
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f8
	set	0x74, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i6
	set	0x18, %i0
	lda	[%l7 + %i0] 0x89,	%f23
	fpsub32s	%f30,	%f26,	%f22
	nop
	set	0x74, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x68, %g2
	stxa	%g7,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x2C, %o0
	lduw	[%l7 + %o0],	%o7
	nop
	set	0x28, %o4
	stw	%l1,	[%l7 + %o4]
	nop
	set	0x14, %g1
	ldsw	[%l7 + %g1],	%i1
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%i3
	nop
	set	0x3A, %l2
	sth	%o6,	[%l7 + %l2]
	nop
	set	0x27, %o5
	ldub	[%l7 + %o5],	%o0
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%i0
	or	%g3,	%l6,	%o4
	nop
	set	0x50, %l6
	lduh	[%l7 + %l6],	%g1
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	set	0x50, %l0
	sta	%f5,	[%l7 + %l0] 0x81
	nop
	set	0x4C, %l5
	sth	%o5,	[%l7 + %l5]
	set	0x70, %o6
	lda	[%l7 + %o6] 0x81,	%f4
	st	%f29,	[%l7 + 0x60]
	wr	%l4,	%i7,	%pic
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f0
	set	0x18, %o1
	stba	%i5,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%o2
	nop
	set	0x78, %g3
	std	%g4,	[%l7 + %g3]
	fpsub32s	%f0,	%f10,	%f11
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%g2
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%l2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%l2
	st	%f27,	[%l7 + 0x1C]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd0,	%f0
	set	0x64, %l4
	lda	[%l7 + %l4] 0x88,	%f25
	nop
	set	0x08, %g6
	swap	[%l7 + %g6],	%i2
	nop
	set	0x78, %i1
	stx	%o3,	[%l7 + %i1]
	and	%g6,	%l5,	%g5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%o7
	nop
	set	0x10, %i7
	stx	%l1,	[%l7 + %i7]
	nop
	set	0x68, %l1
	ldsb	[%l7 + %l1],	%i6
	or	%l0,	%i4,	%i3
	add	%o6,	%i1,	%o0
	set	0x28, %i3
	lda	[%l7 + %i3] 0x80,	%f5
	set	0x38, %g7
	stda	%i0,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe2,	%g2
	or	%o4,	%g1,	%l6
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x80,	%o1
	nop
	set	0x78, %g2
	lduh	[%l7 + %g2],	%o5
	nop
	set	0x6C, %o4
	ldsb	[%l7 + %o4],	%i7
	nop
	set	0x21, %o0
	stb	%i5,	[%l7 + %o0]
	nop
	set	0x10, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x88,	 3
	nop
	set	0x18, %o5
	stx	%o2,	[%l7 + %o5]
	nop
	set	0x30, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x26, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g2
	nop
	set	0x70, %l6
	stx	%g4,	[%l7 + %l6]
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%l2
	set	0x46, %l5
	stba	%l3,	[%l7 + %l5] 0x80
	nop
	set	0x16, %o6
	ldub	[%l7 + %o6],	%o3
	nop
	set	0x14, %o3
	stb	%i2,	[%l7 + %o3]
	nop
	set	0x58, %l0
	std	%f6,	[%l7 + %l0]
	nop
	set	0x4C, %i4
	stw	%g6,	[%l7 + %i4]
	bn,pn	%icc,	loop_2
	nop
	set	0x2C, %o1
	stb	%g5,	[%l7 + %o1]
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%l5
	ld	[%l7 + 0x54],	%f12
loop_2:
	nop
	set	0x10, %g3
	prefetch	[%l7 + %g3],	 1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%o7
	nop
	set	0x50, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x40, %i2
	stx	%l1,	[%l7 + %i2]
	set	0x44, %g4
	sta	%f14,	[%l7 + %g4] 0x88
	nop
	set	0x40, %l4
	ldub	[%l7 + %l4],	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x34B, 	%tick_cmpr
	nop
	set	0x74, %g6
	sth	%i3,	[%l7 + %g6]
	be,a	%icc,	loop_3
	wr 	%g0, 	0x6, 	%fprs
	set	0x08, %i7
	stha	%o0,	[%l7 + %i7] 0x89
loop_3:
	nop
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x80,	%g3
	nop
	set	0x5C, %i1
	sth	%o4,	[%l7 + %i1]
	nop
	set	0x64, %g7
	lduw	[%l7 + %g7],	%g1
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x14, %i3
	ldsb	[%l7 + %i3],	%i0
	nop
	set	0x56, %i0
	ldsh	[%l7 + %i0],	%o1
	nop
	set	0x14, %i6
	prefetch	[%l7 + %i6],	 2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x6A, %g2
	sth	%l6,	[%l7 + %g2]
	ble,a,pn	%icc,	loop_4
	nop
	set	0x74, %o0
	ldsw	[%l7 + %o0],	%i7
	nop
	set	0x34, %o4
	lduh	[%l7 + %o4],	%o5
	nop
	set	0x4C, %g1
	lduw	[%l7 + %g1],	%i5
loop_4:
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%o2
	nop
	set	0x40, %o5
	ldx	[%l7 + %o5],	%g2
	set	0x38, %l2
	stda	%l4,	[%l7 + %l2] 0x88
	set	0x40, %l6
	stxa	%l2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x59, %g5
	ldsb	[%l7 + %g5],	%l3
	set	0x2E, %l5
	stha	%g4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x3E, %o6
	sth	%o3,	[%l7 + %o6]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%g5
	set	0x13, %o3
	stba	%l5,	[%l7 + %o3] 0x81
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%g7
	set	0x74, %l0
	stwa	%i2,	[%l7 + %l0] 0x80
	set	0x78, %o1
	stxa	%o7,	[%l7 + %o1] 0x88
	nop
	set	0x2C, %o7
	swap	[%l7 + %o7],	%i6
	ld	[%l7 + 0x64],	%f19
	nop
	set	0x14, %g3
	swap	[%l7 + %g3],	%l0
	set	0x64, %l3
	ldstuba	[%l7 + %l3] 0x80,	%i4
	set	0x5C, %i4
	lda	[%l7 + %i4] 0x89,	%f11
	set	0x28, %i2
	lda	[%l7 + %i2] 0x89,	%f6
	nop
	set	0x2A, %l4
	ldstub	[%l7 + %l4],	%i3
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xeb,	%i0
	wr	%l1,	%o0,	%clear_softint
	nop
	set	0x4E, %i7
	ldsb	[%l7 + %i7],	%g3
	nop
	set	0x2A, %l1
	ldstub	[%l7 + %l1],	%o6
	st	%fsr,	[%l7 + 0x18]
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xeb,	%o4
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x88,	%i0
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%o0
	fpadd16s	%f29,	%f21,	%f27
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x89,	 2
	and	%g1,	%i7,	%o5
	set	0x50, %i6
	stxa	%o2,	[%l7 + %i6] 0x80
	set	0x48, %i0
	sta	%f21,	[%l7 + %i0] 0x88
	nop
	set	0x08, %o0
	swap	[%l7 + %o0],	%g2
	nop
	set	0x58, %g2
	sth	%l4,	[%l7 + %g2]
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x18, %g1
	ldsw	[%l7 + %g1],	%i5
	nop
	set	0x70, %i5
	std	%l2,	[%l7 + %i5]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%o3
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f6
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x88,	%l2
	set	0x0B, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g5
	nop
	set	0x58, %g5
	stw	%l5,	[%l7 + %g5]
	nop
	set	0x64, %l5
	sth	%g7,	[%l7 + %l5]
	nop
	set	0x71, %o6
	ldstub	[%l7 + %o6],	%i2
	nop
	set	0x70, %o3
	std	%g6,	[%l7 + %o3]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f16
	or	%i6,	%l0,	%o7
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	nop
	set	0x10, %o2
	sth	%i1,	[%l7 + %o2]
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0
	set	0x4C, %g3
	lda	[%l7 + %g3] 0x89,	%f7
	set	0x48, %i4
	stda	%o0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x28, %i2
	swap	[%l7 + %i2],	%g3
	set	0x17, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l1
	st	%fsr,	[%l7 + 0x4C]
	ld	[%l7 + 0x10],	%f9
	set	0x78, %l4
	swapa	[%l7 + %l4] 0x89,	%o4
	nop
	set	0x48, %i7
	stx	%o6,	[%l7 + %i7]
	nop
	set	0x5F, %l1
	ldub	[%l7 + %l1],	%o1
	set	0x6C, %g4
	sta	%f23,	[%l7 + %g4] 0x89
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%i0
	nop
	set	0x50, %g7
	ldub	[%l7 + %g7],	%g1
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x89,	 3
	nop
	set	0x30, %i6
	std	%o4,	[%l7 + %i6]
	set	0x64, %i3
	sta	%f13,	[%l7 + %i3] 0x89
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x89,	%l6
	ld	[%l7 + 0x74],	%f15
	nop
	set	0x40, %g2
	stw	%o2,	[%l7 + %g2]
	set	0x24, %i0
	lda	[%l7 + %i0] 0x81,	%f21
	nop
	set	0x50, %o4
	ldstub	[%l7 + %o4],	%g2
	nop
	set	0x50, %i5
	ldsw	[%l7 + %i5],	%i5
	nop
	set	0x62, %l2
	ldsh	[%l7 + %l2],	%l4
	nop
	set	0x34, %l6
	ldsw	[%l7 + %l6],	%l3
	set	0x50, %g1
	stxa	%o3,	[%l7 + %g1] 0x89
	nop
	set	0x5E, %g5
	ldsh	[%l7 + %g5],	%l2
	nop
	set	0x70, %l5
	std	%g4,	[%l7 + %l5]
	nop
	set	0x30, %o5
	stx	%l5,	[%l7 + %o5]
	set	0x10, %o6
	lda	[%l7 + %o6] 0x88,	%f18
	set	0x44, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g7
	st	%fsr,	[%l7 + 0x6C]
	and	%g4,	%i2,	%g6
	set	0x38, %l0
	stda	%l0,	[%l7 + %l0] 0xeb
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i4
	nop
	set	0x38, %o2
	stx	%i6,	[%l7 + %o2]
	set	0x5C, %o1
	stha	%i1,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x72, %o7
	ldub	[%l7 + %o7],	%i3
	add	%o0,	%g3,	%o4
	nop
	set	0x2A, %g3
	lduh	[%l7 + %g3],	%l1
	add	%o1,	%i0,	%g1
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%i6
	ld	[%l7 + 0x10],	%f25
	or	%o5,	%l6,	%o2
	ld	[%l7 + 0x54],	%f30
	nop
	set	0x1C, %i4
	ldsw	[%l7 + %i4],	%o6
	nop
	set	0x47, %l4
	ldsb	[%l7 + %l4],	%i5
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	nop
	set	0x0E, %l1
	ldsh	[%l7 + %l1],	%l3
	set	0x09, %l3
	stba	%o3,	[%l7 + %l3] 0x89
	and	%l4,	%l2,	%g5
	nop
	set	0x18, %g4
	ldsw	[%l7 + %g4],	%g7
	nop
	set	0x48, %g7
	lduw	[%l7 + %g7],	%l5
	nop
	set	0x58, %g6
	std	%f2,	[%l7 + %g6]
	nop
	set	0x48, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x3D, %i3
	stba	%i2,	[%l7 + %i3] 0x81
	or	%g6,	%l0,	%o7
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%g4
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x89,	%i4
	nop
	set	0x40, %g2
	swap	[%l7 + %g2],	%i1
	nop
	set	0x64, %o4
	lduh	[%l7 + %o4],	%i3
	nop
	set	0x5A, %i0
	ldsh	[%l7 + %i0],	%i6
	and	%g3,	%o4,	%o0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd0
	nop
	set	0x48, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x39, %l6
	ldsb	[%l7 + %l6],	%l1
	nop
	set	0x60, %g1
	ldsb	[%l7 + %g1],	%i0
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%g1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f16
	set	0x24, %o3
	stwa	%l6,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x08, %o2
	stxa	%o5,	[%l7 + %o2] 0x88
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%o2
	set	0x50, %o1
	stda	%o6,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x08, %o7
	stda	%g2,	[%l7 + %o7] 0xe3
	membar	#Sync
	nop
	set	0x3E, %i2
	ldstub	[%l7 + %i2],	%l3
	nop
	set	0x6A, %i4
	ldub	[%l7 + %i4],	%o3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f0
	nop
	set	0x2C, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x38, %l1
	stx	%l4,	[%l7 + %l1]
	ld	[%l7 + 0x40],	%f10
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf9,	%f16
	nop
	set	0x78, %i7
	ldsh	[%l7 + %i7],	%l2
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	or	%g5,	%g7,	%l5
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f16
	nop
	set	0x10, %i6
	stb	%i5,	[%l7 + %i6]
	nop
	set	0x30, %i3
	stb	%i2,	[%l7 + %i3]
	nop
	set	0x40, %i1
	std	%g6,	[%l7 + %i1]
	add	%l0,	%o7,	%i4
	nop
	set	0x68, %g2
	std	%f14,	[%l7 + %g2]
	nop
	set	0x5F, %o4
	stb	%g4,	[%l7 + %o4]
	nop
	set	0x08, %o0
	sth	%i3,	[%l7 + %o0]
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x80,	%i1
	nop
	set	0x66, %i0
	sth	%i6,	[%l7 + %i0]
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	set	0x60, %g1
	swapa	[%l7 + %g1] 0x89,	%o0
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x88,	%l1
	set	0x14, %l2
	stba	%o4,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x88,	%o0
	wr	%i7,	%i0,	%y
	set	0x20, %o6
	ldxa	[%l7 + %o6] 0x81,	%l6
	nop
	set	0x70, %l5
	prefetch	[%l7 + %l5],	 2
	nop
	set	0x30, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%o5
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f8
	nop
	set	0x0D, %o7
	stb	%g1,	[%l7 + %o7]
	nop
	set	0x70, %o1
	stw	%o6,	[%l7 + %o1]
	ld	[%l7 + 0x28],	%f23
	st	%f11,	[%l7 + 0x74]
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f6
	set	0x36, %g3
	stba	%g2,	[%l7 + %g3] 0x88
	ld	[%l7 + 0x5C],	%f27
	st	%f1,	[%l7 + 0x50]
	nop
	set	0x10, %i4
	std	%f22,	[%l7 + %i4]
	nop
	set	0x64, %l4
	stw	%o2,	[%l7 + %l4]
	set	0x28, %l1
	ldxa	[%l7 + %l1] 0x81,	%o3
	set	0x18, %i7
	stxa	%l3,	[%l7 + %i7] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x24]
	and	%l2,	%g5,	%l4
	nop
	set	0x40, %g7
	stx	%l5,	[%l7 + %g7]
	wr 	%g0, 	0x6, 	%fprs
	and	%i2,	%l0,	%g6
	nop
	set	0x30, %g4
	std	%f28,	[%l7 + %g4]
	and	%o7,	%i4,	%g4
	nop
	set	0x6C, %l3
	lduw	[%l7 + %l3],	%i1
	add	%i6,	%g3,	%o0
	nop
	set	0x08, %g6
	std	%i2,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%l1
	nop
	set	0x10, %i6
	stx	%o1,	[%l7 + %i6]
	st	%f26,	[%l7 + 0x4C]
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%i6
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%i0
	nop
	set	0x2B, %o4
	stb	%l6,	[%l7 + %o4]
	set	0x6A, %o0
	stha	%o5,	[%l7 + %o0] 0xeb
	membar	#Sync
	fpsub16	%f6,	%f20,	%f30
	nop
	set	0x30, %g2
	std	%o6,	[%l7 + %g2]
	nop
	set	0x3C, %i0
	lduw	[%l7 + %i0],	%g2
	set	0x1C, %l6
	swapa	[%l7 + %l6] 0x81,	%o2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f16
	bne	%xcc,	loop_5
	add	%o3,	%g1,	%l2
	wr	%g5,	%l4,	%sys_tick
	fpsub32s	%f18,	%f0,	%f28
loop_5:
	nop
	set	0x50, %g1
	swap	[%l7 + %g1],	%l5
	bleu,pn	%xcc,	loop_6
	fpsub16s	%f24,	%f19,	%f1
	nop
	set	0x48, %l2
	ldstub	[%l7 + %l2],	%l3
	set	0x48, %o5
	stxa	%i5,	[%l7 + %o5] 0x88
loop_6:
	nop
	set	0x52, %g5
	ldsh	[%l7 + %g5],	%g7
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xe2,	%l0
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf1
	membar	#Sync
	nop
	set	0x4A, %o6
	stb	%g6,	[%l7 + %o6]
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x89,	%i2
	st	%fsr,	[%l7 + 0x38]
	set	0x68, %o7
	sta	%f13,	[%l7 + %o7] 0x81
	nop
	set	0x4C, %l0
	lduh	[%l7 + %l0],	%o7
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x81
	nop
	set	0x20, %g3
	stb	%i4,	[%l7 + %g3]
	nop
	set	0x73, %i4
	ldsb	[%l7 + %i4],	%i1
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x34, %l1
	ldsw	[%l7 + %l1],	%g3
	set	0x10, %i7
	swapa	[%l7 + %i7] 0x80,	%o0
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x89,	%i2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f0
	bgu	%icc,	loop_7
	nop
	set	0x3D, %l3
	ldsb	[%l7 + %l3],	%l1
	nop
	set	0x70, %l4
	std	%o4,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x28]
loop_7:
	or	%i7,	%o1,	%i0
	bgu,a	%xcc,	loop_8
	fpsub16	%f2,	%f28,	%f2
	nop
	set	0x40, %i6
	ldsh	[%l7 + %i6],	%o5
	nop
	set	0x6A, %g6
	stb	%l6,	[%l7 + %g6]
loop_8:
	nop
	set	0x30, %i1
	swapa	[%l7 + %i1] 0x89,	%o6
	fpadd16	%f24,	%f2,	%f18
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x5F, %i3
	ldub	[%l7 + %i3],	%g2
	set	0x78, %g2
	stba	%o2,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x81
	ld	[%l7 + 0x10],	%f4
	nop
	set	0x6E, %l6
	ldsh	[%l7 + %l6],	%g1
	nop
	set	0x1C, %i5
	swap	[%l7 + %i5],	%l2
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%l4
	set	0x18, %l2
	stxa	%l5,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x62, %g1
	sth	%g5,	[%l7 + %g1]
	and	%l3,	%i5,	%l0
	nop
	set	0x2C, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%g7
	and	%g6,	%o7,	%i4
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x81,	 3
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%i2
	nop
	set	0x59, %o3
	ldsb	[%l7 + %o3],	%i6
	set	0x38, %o2
	stda	%g4,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x50, %o7
	stxa	%o0,	[%l7 + %o7] 0x89
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%g2
	add	%i3,	%l1,	%i7
	set	0x24, %g3
	sta	%f5,	[%l7 + %g3] 0x81
	set	0x3C, %i2
	lda	[%l7 + %i2] 0x89,	%f22
	nop
	set	0x50, %i4
	std	%o0,	[%l7 + %i4]
	nop
	nop
	setx	0xDD7B468A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x7EE416FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f11,	%f29
	nop
	set	0x3C, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x2C, %i7
	lduh	[%l7 + %i7],	%i0
	set	0x7E, %o1
	stba	%o4,	[%l7 + %o1] 0x81
	fpadd32	%f6,	%f24,	%f8
	wr	%l6,	%o5,	%clear_softint
	set	0x46, %g7
	stba	%g2,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x4D, %l3
	stb	%o2,	[%l7 + %l3]
	nop
	set	0x30, %l4
	ldsb	[%l7 + %l4],	%g1
	nop
	set	0x58, %i6
	std	%o6,	[%l7 + %i6]
	set	0x1C, %g6
	sta	%f14,	[%l7 + %g6] 0x89
	nop
	set	0x30, %i1
	stb	%o3,	[%l7 + %i1]
	fpadd32s	%f13,	%f10,	%f21
	add	%l2,	%l5,	%g5
	nop
	set	0x1E, %g4
	sth	%l4,	[%l7 + %g4]
	set	0x40, %o4
	stda	%i4,	[%l7 + %o4] 0x89
	nop
	set	0x74, %g2
	swap	[%l7 + %g2],	%l0
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x36, %o0
	ldsh	[%l7 + %o0],	%g7
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x6A, %i5
	ldstuba	[%l7 + %i5] 0x88,	%l3
	set	0x70, %i3
	lda	[%l7 + %i3] 0x88,	%f15
	and	%g6,	%i4,	%o7
	set	0x2C, %i0
	sta	%f12,	[%l7 + %i0] 0x89
	nop
	set	0x7C, %g1
	swap	[%l7 + %g1],	%i1
	set	0x70, %g5
	stwa	%i6,	[%l7 + %g5] 0x89
	nop
	set	0x3C, %l2
	stw	%g4,	[%l7 + %l2]
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%i2
	set	0x2D, %o5
	stba	%g3,	[%l7 + %o5] 0x89
	nop
	set	0x54, %o6
	sth	%i3,	[%l7 + %o6]
	ld	[%l7 + 0x4C],	%f31
	nop
	set	0x52, %o2
	ldub	[%l7 + %o2],	%l1
	set	0x34, %o7
	stha	%i7,	[%l7 + %o7] 0x89
	nop
	set	0x40, %l0
	lduh	[%l7 + %l0],	%o1
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xeb,	%i0
	nop
	set	0x6E, %i2
	sth	%o4,	[%l7 + %i2]
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x80,	%o0
	nop
	set	0x4C, %i4
	lduh	[%l7 + %i4],	%l6
	st	%fsr,	[%l7 + 0x54]
	set	0x10, %i7
	stda	%g2,	[%l7 + %i7] 0x89
	set	0x70, %l1
	stxa	%o2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x40, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x40, %o1
	stx	%g1,	[%l7 + %o1]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%o3
	set	0x18, %l3
	stda	%o4,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x08, %i6
	std	%l2,	[%l7 + %i6]
	set	0x30, %g6
	stwa	%l5,	[%l7 + %g6] 0x89
	set	0x48, %i1
	stxa	%g5,	[%l7 + %i1] 0xe2
	membar	#Sync
	wr 	%g0, 	0x4, 	%fprs
	or	%g7,	%l3,	%g6
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f0
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x89,	%l0
	nop
	set	0x40, %g2
	std	%f6,	[%l7 + %g2]
	nop
	set	0x30, %o0
	sth	%i4,	[%l7 + %o0]
	bne	%xcc,	loop_9
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%o7
	nop
	set	0x2C, %i5
	prefetch	[%l7 + %i5],	 3
	st	%f14,	[%l7 + 0x30]
loop_9:
	add	%i6,	%g4,	%i2
	nop
	set	0x2C, %i3
	ldsh	[%l7 + %i3],	%g3
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xea,	%i0
	nop
	set	0x30, %i0
	std	%f0,	[%l7 + %i0]
	and	%i3,	%i7,	%l1
	add	%i0,	%o4,	%o0
	nop
	set	0x41, %g1
	ldub	[%l7 + %g1],	%l6
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x2A, %l2
	stb	%g2,	[%l7 + %l2]
	set	0x48, %l5
	sta	%f4,	[%l7 + %l5] 0x88
	nop
	set	0x68, %o5
	lduw	[%l7 + %o5],	%o2
	set	0x78, %o6
	lda	[%l7 + %o6] 0x80,	%f7
	nop
	set	0x78, %o2
	std	%g0,	[%l7 + %o2]
	nop
	set	0x10, %o7
	stx	%o1,	[%l7 + %o7]
	nop
	set	0x10, %l0
	std	%o2,	[%l7 + %l0]
	nop
	set	0x5C, %o3
	swap	[%l7 + %o3],	%o6
	nop
	set	0x08, %i2
	std	%f26,	[%l7 + %i2]
	set	0x58, %g3
	stwa	%o5,	[%l7 + %g3] 0x89
	nop
	set	0x40, %g5
	lduw	[%l7 + %g5],	%l2
	nop
	set	0x10, %i7
	ldsw	[%l7 + %i7],	%l5
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	set	0x68, %l1
	lda	[%l7 + %l1] 0x89,	%f8
	nop
	set	0x78, %o1
	stx	%i5,	[%l7 + %o1]
	add	%g7,	%l3,	%g5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf9
	membar	#Sync
	nop
	set	0x48, %i6
	ldsb	[%l7 + %i6],	%l0
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x89,	%g6
	or	%o7,	%i6,	%g4
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x80,	%i4
	nop
	set	0x48, %o4
	ldsw	[%l7 + %o4],	%g3
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x89,	 0
	ld	[%l7 + 0x0C],	%f22
	nop
	set	0x6C, %o0
	lduh	[%l7 + %o0],	%i3
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%i0
	or	%i7,	%i0,	%o4
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	and	%l1,	%l6,	%o0
	nop
	set	0x38, %g4
	std	%g2,	[%l7 + %g4]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g1
	set	0x60, %l4
	stha	%o3,	[%l7 + %l4] 0x80
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x80,	 2
	bge,a	%icc,	loop_10
	wr	%o5,	%l2,	%y
	set	0x7C, %i3
	stwa	%l5,	[%l7 + %i3] 0x88
loop_10:
	nop
	set	0x30, %l2
	stda	%o0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x20, %g1
	std	%f30,	[%l7 + %g1]
	nop
	set	0x2E, %l5
	sth	%i5,	[%l7 + %l5]
	nop
	set	0x10, %o6
	lduw	[%l7 + %o6],	%l4
	st	%fsr,	[%l7 + 0x64]
	add	%l3,	%g7,	%g5
	wr	%l0,	%o7,	%pic
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd8
	nop
	set	0x50, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x0A, %o3
	ldsb	[%l7 + %o3],	%g6
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%g4
	st	%f15,	[%l7 + 0x1C]
	ld	[%l7 + 0x40],	%f26
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f18
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%i4
	nop
	set	0x60, %g5
	swap	[%l7 + %g5],	%i2
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f4
	nop
	set	0x4D, %i4
	ldstub	[%l7 + %i4],	%i3
	set	0x58, %i7
	stxa	%i1,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f8
	nop
	set	0x64, %l3
	swap	[%l7 + %l3],	%i7
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%g3
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x88,	%o4
	set	0x1C, %g7
	sta	%f13,	[%l7 + %g7] 0x81
	ld	[%l7 + 0x10],	%f11
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%i0
	st	%f13,	[%l7 + 0x4C]
	fpadd32s	%f27,	%f5,	%f15
	set	0x30, %o4
	stda	%i6,	[%l7 + %o4] 0x88
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x88,	%o0
	nop
	set	0x08, %o0
	lduh	[%l7 + %o0],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g1
	set	0x10, %g2
	stha	%l1,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x6E, %l6
	ldsb	[%l7 + %l6],	%o3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%o5
	st	%fsr,	[%l7 + 0x6C]
	set	0x74, %g4
	swapa	[%l7 + %g4] 0x80,	%l2
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%o1
	set	0x54, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i5
	add	%l5,	%l3,	%l4
	or	%g7,	%l0,	%o7
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x88,	%g5
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xcc
	set	0x42, %g1
	stha	%g4,	[%l7 + %g1] 0x80
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%g6
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%i6
	or	%i2,	%i3,	%i1
	ld	[%l7 + 0x28],	%f16
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 3
	set	0x3C, %o3
	stha	%i4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%g3
	set	0x2A, %g3
	stha	%o4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x70, %g5
	ldsb	[%l7 + %g5],	%i0
	ld	[%l7 + 0x18],	%f19
	nop
	set	0x0C, %i2
	ldsw	[%l7 + %i2],	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%g2
	set	0x74, %l0
	sta	%f15,	[%l7 + %l0] 0x80
	nop
	set	0x5E, %i4
	lduh	[%l7 + %i4],	%o0
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o2
	nop
	set	0x38, %l3
	stx	%g1,	[%l7 + %l3]
	bge,a	%icc,	loop_11
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%l1
	st	%f0,	[%l7 + 0x2C]
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 3
loop_11:
	nop
	set	0x47, %g7
	ldstub	[%l7 + %g7],	%o6
	wr	%o3,	%o5,	%y
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x18, %i6
	stda	%o0,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x2D, %o1
	stb	%i5,	[%l7 + %o1]
	bge,a,pt	%icc,	loop_12
	nop
	set	0x1C, %o4
	prefetch	[%l7 + %o4],	 3
	nop
	set	0x64, %o0
	ldsw	[%l7 + %o0],	%l2
	nop
	set	0x58, %g2
	std	%l2,	[%l7 + %g2]
loop_12:
	nop
	set	0x74, %l6
	stba	%l4,	[%l7 + %l6] 0x88
	nop
	set	0x18, %i5
	std	%f20,	[%l7 + %i5]
	set	0x58, %g4
	swapa	[%l7 + %g4] 0x80,	%g7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f0
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x88,	%l5
	set	0x10, %i3
	stxa	%o7,	[%l7 + %i3] 0x81
	nop
	set	0x30, %g1
	stw	%g5,	[%l7 + %g1]
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%g4,	%g6,	%l0
	nop
	set	0x60, %l2
	stx	%i6,	[%l7 + %l2]
	and	%i2,	%i1,	%i3
	st	%f5,	[%l7 + 0x1C]
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x80,	%g2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xc8
	st	%f19,	[%l7 + 0x0C]
	nop
	set	0x52, %o3
	sth	%o4,	[%l7 + %o3]
	fpadd16s	%f17,	%f16,	%f11
	wr	%i4,	%l6,	%softint
	set	0x50, %o6
	ldda	[%l7 + %o6] 0xea,	%i6
	nop
	set	0x63, %o7
	ldstub	[%l7 + %o7],	%i0
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%g2
	nop
	set	0x30, %i2
	stw	%o2,	[%l7 + %i2]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%l1
	nop
	set	0x10, %l0
	stw	%g1,	[%l7 + %l0]
	nop
	set	0x68, %i4
	ldsw	[%l7 + %i4],	%o6
	set	0x34, %i7
	sta	%f21,	[%l7 + %i7] 0x81
	or	%o5,	%o1,	%o3
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x89
	set	0x28, %l1
	ldxa	[%l7 + %l1] 0x81,	%i5
	bg	%xcc,	loop_13
	fpadd16	%f14,	%f0,	%f24
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
loop_13:
	nop
	set	0x50, %g6
	std	%l2,	[%l7 + %g6]
	set	0x40, %i1
	lda	[%l7 + %i1] 0x88,	%f14
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%g6
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%l4
	nop
	set	0x7C, %o4
	ldub	[%l7 + %o4],	%o7
	set	0x44, %o0
	stha	%l5,	[%l7 + %o0] 0x81
	nop
	set	0x30, %g7
	lduh	[%l7 + %g7],	%g4
	set	0x18, %g2
	lda	[%l7 + %g2] 0x81,	%f4
	bl,a	%icc,	loop_14
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%l0
	nop
	set	0x5C, %i5
	ldsw	[%l7 + %i5],	%g6
loop_14:
	nop
	set	0x74, %i0
	lduw	[%l7 + %i0],	%i6
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	or	%i1,	%i3,	%g3
	nop
	set	0x50, %g1
	std	%f30,	[%l7 + %g1]
	set	0x3B, %l4
	stba	%i2,	[%l7 + %l4] 0xeb
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%o4
	set	0x6C, %l2
	lda	[%l7 + %l2] 0x80,	%f0
	nop
	set	0x42, %l5
	lduh	[%l7 + %l5],	%i7
	st	%f1,	[%l7 + 0x54]
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x81,	%i0
	set	0x0C, %o2
	lda	[%l7 + %o2] 0x80,	%f29
	nop
	set	0x08, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x60, %o7
	ldub	[%l7 + %o7],	%l6
	and	%g2,	%o0,	%l1
	nop
	set	0x44, %g5
	ldsw	[%l7 + %g5],	%o2
	ld	[%l7 + 0x40],	%f5
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f8
	nop
	set	0x1E, %l0
	ldstub	[%l7 + %l0],	%g1
	nop
	set	0x1C, %i4
	ldsb	[%l7 + %i4],	%o5
	set	0x24, %o6
	stha	%o6,	[%l7 + %o6] 0x88
	set	0x08, %l3
	lda	[%l7 + %l3] 0x89,	%f13
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x80,	%o0
	and	%i5,	%l2,	%l3
	set	0x48, %l1
	stwa	%o3,	[%l7 + %l1] 0xea
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x81,	%g7,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%l4
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%g5
	nop
	set	0x68, %g6
	lduw	[%l7 + %g6],	%g4
	nop
	set	0x28, %i6
	std	%f10,	[%l7 + %i6]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xcc
	set	0x68, %i1
	ldxa	[%l7 + %i1] 0x89,	%l0
	nop
	set	0x1A, %o4
	ldsb	[%l7 + %o4],	%g6
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f16
	and	%i6,	%i3,	%g3
	nop
	set	0x7F, %g2
	ldub	[%l7 + %g2],	%i1
	set	0x08, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	bn,pt	%icc,	loop_15
	nop
	set	0x3A, %l6
	lduh	[%l7 + %l6],	%i4
	set	0x50, %g4
	stxa	%o4,	[%l7 + %g4] 0xeb
	membar	#Sync
loop_15:
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%i6
	or	%l6,	%g2,	%i0
	nop
	set	0x70, %i0
	sth	%l1,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x18]
	ld	[%l7 + 0x34],	%f30
	nop
	set	0x58, %i3
	std	%f28,	[%l7 + %i3]
	set	0x30, %g1
	ldxa	[%l7 + %g1] 0x89,	%o0
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%o2
	set	0x7A, %l2
	stba	%g1,	[%l7 + %l2] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %o5
	sta	%f6,	[%l7 + %o5] 0x80
	and	%o6,	%o1,	%i5
	nop
	set	0x0D, %l5
	ldub	[%l7 + %l5],	%o5
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%l2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%g7
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%o3
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%o6
	nop
	set	0x28, %g5
	ldsh	[%l7 + %g5],	%l5
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%g5
	bn,a,pt	%icc,	loop_16
	nop
	set	0x60, %l0
	stx	%g4,	[%l7 + %l0]
	nop
	set	0x1E, %o6
	stb	%l0,	[%l7 + %o6]
	set	0x20, %l3
	ldda	[%l7 + %l3] 0x88,	%l4
loop_16:
	and	%g6,	%i6,	%g3
	nop
	set	0x4E, %i7
	lduh	[%l7 + %i7],	%i3
	set	0x1A, %l1
	stba	%i1,	[%l7 + %l1] 0x89
	nop
	set	0x28, %i4
	stx	%fsr,	[%l7 + %i4]
	or	%i4,	%i2,	%o4
	nop
	set	0x38, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%l6
	fpsub32	%f26,	%f14,	%f20
	nop
	set	0x08, %o1
	ldsw	[%l7 + %o1],	%g2
	set	0x48, %i1
	lda	[%l7 + %i1] 0x81,	%f12
	nop
	set	0x28, %g3
	lduw	[%l7 + %g3],	%i0
	nop
	nop
	setx	0x1713FCCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x0D6094E3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f22,	%f6
	st	%fsr,	[%l7 + 0x10]
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x88,	%l0
	nop
	set	0x58, %o4
	ldsw	[%l7 + %o4],	%i7
	nop
	set	0x7D, %o0
	ldstub	[%l7 + %o0],	%o2
	wr	%g1,	%o0,	%set_softint
	nop
	set	0x37, %g2
	ldsb	[%l7 + %g2],	%o1
	nop
	set	0x70, %l6
	std	%i4,	[%l7 + %l6]
	set	0x30, %g4
	stwa	%o5,	[%l7 + %g4] 0x88
	wr	%l2,	%l3,	%ccr
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%o6
	nop
	set	0x44, %i5
	ldsw	[%l7 + %i5],	%g7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%o3
	or	%g5,	%l5,	%l0
	nop
	set	0x4C, %g1
	ldsw	[%l7 + %g1],	%g4
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f22
	nop
	set	0x08, %l4
	lduw	[%l7 + %l4],	%g6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x89
	fpadd32s	%f31,	%f7,	%f9
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%l4
	nop
	nop
	setx	0x4F1B518C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x13EE2CF5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f27,	%f17
	nop
	set	0x23, %l2
	stb	%g3,	[%l7 + %l2]
	nop
	set	0x72, %o7
	ldsh	[%l7 + %o7],	%i3
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f18
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i6
	nop
	set	0x60, %g5
	std	%i2,	[%l7 + %g5]
	set	0x60, %i2
	stxa	%i4,	[%l7 + %i2] 0x81
	nop
	set	0x32, %l0
	ldsb	[%l7 + %l0],	%l6
	nop
	set	0x70, %o3
	std	%g2,	[%l7 + %o3]
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x30, %i7
	std	%f20,	[%l7 + %i7]
	or	%o4,	%i7,	%l1
	bl,a,pn	%xcc,	loop_17
	nop
	set	0x78, %o6
	ldsh	[%l7 + %o6],	%o2
	nop
	set	0x50, %i4
	lduw	[%l7 + %i4],	%o0
	set	0x2D, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g1
loop_17:
	nop
	set	0x2C, %g6
	stb	%o1,	[%l7 + %g6]
	nop
	set	0x79, %o1
	ldstub	[%l7 + %o1],	%o5
	nop
	set	0x14, %i6
	ldsh	[%l7 + %i6],	%l2
	nop
	set	0x40, %g3
	lduh	[%l7 + %g3],	%l3
	st	%f17,	[%l7 + 0x78]
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x80,	%o6
	nop
	set	0x46, %i1
	ldub	[%l7 + %i1],	%g7
	set	0x3C, %o0
	lda	[%l7 + %o0] 0x81,	%f0
	ld	[%l7 + 0x48],	%f30
	set	0x40, %g2
	stda	%i4,	[%l7 + %g2] 0x88
	nop
	set	0x48, %l6
	stx	%o3,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x1E, %g4
	ldub	[%l7 + %g4],	%g5
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xe3,	%o6
	nop
	set	0x58, %i5
	stx	%l5,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x14]
	set	0x38, %g1
	stxa	%l0,	[%l7 + %g1] 0xeb
	membar	#Sync
	st	%f28,	[%l7 + 0x50]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd2,	%f0
	wr	%g6,	%g4,	%softint
	set	0x18, %l4
	prefetcha	[%l7 + %l4] 0x88,	 1
	nop
	set	0x38, %o5
	std	%i2,	[%l7 + %o5]
	set	0x28, %i0
	sta	%f17,	[%l7 + %i0] 0x88
	set	0x74, %l5
	lda	[%l7 + %l5] 0x80,	%f17
	add	%i1,	%g3,	%i2
	ld	[%l7 + 0x0C],	%f21
	nop
	set	0x35, %o7
	ldsb	[%l7 + %o7],	%i4
	nop
	set	0x68, %l2
	stx	%i6,	[%l7 + %l2]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x2A, %i2
	ldsb	[%l7 + %i2],	%g2
	ld	[%l7 + 0x48],	%f8
	and	%l6,	%o4,	%i0
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%i6
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f16
	add	%l1,	%o0,	%o2
	set	0x74, %o3
	lda	[%l7 + %o3] 0x89,	%f24
	nop
	set	0x3A, %i7
	ldub	[%l7 + %i7],	%g1
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%o1
	set	0x58, %i4
	ldxa	[%l7 + %i4] 0x81,	%o5
	nop
	set	0x2C, %l3
	ldstub	[%l7 + %l3],	%l3
	st	%fsr,	[%l7 + 0x2C]
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x89,	%l2
	nop
	set	0x41, %o1
	ldsb	[%l7 + %o1],	%o6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f0
	nop
	set	0x18, %g6
	ldsb	[%l7 + %g6],	%i5
	nop
	set	0x7F, %g3
	stb	%o3,	[%l7 + %g3]
	nop
	set	0x74, %i1
	ldsh	[%l7 + %i1],	%g5
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%g7
	set	0x2C, %g2
	swapa	[%l7 + %g2] 0x89,	%l5
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x89,	%o6
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x89,	 0
	ld	[%l7 + 0x64],	%f4
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x80,	%g4
	be,a	%icc,	loop_18
	nop
	set	0x0A, %i5
	stb	%g6,	[%l7 + %i5]
	add	%i3,	%l4,	%g3
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f2
loop_18:
	nop
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x88,	%i2
	nop
	set	0x2D, %g1
	ldsb	[%l7 + %g1],	%i4
	fpsub32	%f10,	%f2,	%f14
	nop
	set	0x4C, %o5
	swap	[%l7 + %o5],	%i1
	st	%fsr,	[%l7 + 0x58]
	ld	[%l7 + 0x28],	%f26
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x81,	%g2
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%i6
	st	%fsr,	[%l7 + 0x18]
	bgu	%xcc,	loop_19
	ld	[%l7 + 0x74],	%f15
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f6
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%l6
loop_19:
	nop
	set	0x68, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x08, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x88,	%i0
	ld	[%l7 + 0x20],	%f3
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x18, %i7
	lda	[%l7 + %i7] 0x88,	%f25
	set	0x3C, %o3
	stwa	%o4,	[%l7 + %o3] 0xea
	membar	#Sync
	fpsub32	%f22,	%f24,	%f10
	nop
	set	0x26, %o6
	sth	%l1,	[%l7 + %o6]
	nop
	set	0x36, %l3
	stb	%i7,	[%l7 + %l3]
	nop
	set	0x38, %i4
	swap	[%l7 + %i4],	%o0
	set	0x40, %l1
	ldxa	[%l7 + %l1] 0x80,	%g1
	nop
	set	0x40, %o1
	stx	%fsr,	[%l7 + %o1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%o5
	nop
	set	0x54, %g6
	ldsb	[%l7 + %g6],	%l3
	nop
	set	0x70, %i6
	std	%f18,	[%l7 + %i6]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%o2
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x88,	%i5
	nop
	set	0x60, %o0
	stx	%o3,	[%l7 + %o0]
	set	0x2B, %i1
	stba	%g5,	[%l7 + %i1] 0x89
	nop
	set	0x5A, %g2
	sth	%o6,	[%l7 + %g2]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%o7
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x7C, %g4
	lduw	[%l7 + %g4],	%l0
	nop
	set	0x60, %g7
	stx	%l5,	[%l7 + %g7]
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x81,	 1
	nop
	set	0x20, %i5
	std	%f22,	[%l7 + %i5]
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x80,	%g6
	nop
	set	0x7D, %o5
	ldsb	[%l7 + %o5],	%l4
	set	0x10, %i0
	stxa	%g3,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%i3,	%i4,	%i1
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f12
	nop
	set	0x70, %o7
	prefetch	[%l7 + %o7],	 2
	ld	[%l7 + 0x58],	%f24
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	nop
	set	0x18, %l4
	swap	[%l7 + %l4],	%i6
	nop
	set	0x66, %g1
	ldsb	[%l7 + %g1],	%g2
	bleu,a	%icc,	loop_20
	nop
	set	0x78, %o2
	ldsh	[%l7 + %o2],	%l6
	set	0x58, %i2
	stha	%i0,	[%l7 + %i2] 0xeb
	membar	#Sync
loop_20:
	nop
	set	0x30, %l0
	stxa	%l1,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x58, %g5
	ldstuba	[%l7 + %g5] 0x88,	%o4
	wr	%i7,	%o0,	%sys_tick
	nop
	set	0x5C, %o3
	lduw	[%l7 + %o3],	%g1
	st	%f18,	[%l7 + 0x10]
	set	0x65, %o6
	stba	%o1,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x6A, %i4
	stb	%l3,	[%l7 + %i4]
	set	0x14, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l2
	set	0x2C, %o1
	swapa	[%l7 + %o1] 0x80,	%o2
	nop
	set	0x2E, %l1
	sth	%o5,	[%l7 + %l1]
	bn,a	%xcc,	loop_21
	st	%f4,	[%l7 + 0x74]
	nop
	set	0x10, %g6
	lduw	[%l7 + %g6],	%o3
	set	0x44, %i6
	sta	%f7,	[%l7 + %i6] 0x88
loop_21:
	nop
	set	0x23, %g3
	ldsb	[%l7 + %g3],	%g5
	set	0x0D, %i1
	ldstuba	[%l7 + %i1] 0x81,	%i5
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x89
	nop
	set	0x62, %l6
	ldsh	[%l7 + %l6],	%o6
	nop
	set	0x18, %g2
	std	%f20,	[%l7 + %g2]
	and	%g7,	%l0,	%l5
	bne,a,pn	%icc,	loop_22
	nop
	set	0x68, %g7
	std	%f8,	[%l7 + %g7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%g4
loop_22:
	wr	%g6,	%l4,	%softint
	nop
	set	0x4B, %g4
	stb	%g3,	[%l7 + %g4]
	nop
	set	0x28, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x88,	%i4
	nop
	set	0x7C, %i3
	ldsw	[%l7 + %i3],	%i1
	nop
	set	0x0D, %i0
	ldsb	[%l7 + %i0],	%i2
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf9
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x88,	%i3,	%g2
	and	%i6,	%i0,	%l1
	nop
	set	0x6E, %o5
	sth	%o4,	[%l7 + %o5]
	nop
	set	0x78, %l2
	stw	%i7,	[%l7 + %l2]
	nop
	set	0x30, %o7
	stb	%o0,	[%l7 + %o7]
	nop
	set	0x62, %g1
	ldsh	[%l7 + %g1],	%g1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	add	%o1,	%l6,	%l2
	set	0x4C, %i2
	swapa	[%l7 + %i2] 0x80,	%o2
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f0
	nop
	set	0x36, %o2
	sth	%o5,	[%l7 + %o2]
	nop
	set	0x2C, %i7
	lduh	[%l7 + %i7],	%l3
	nop
	set	0x79, %o3
	ldstub	[%l7 + %o3],	%g5
	set	0x58, %o6
	lda	[%l7 + %o6] 0x81,	%f1
	set	0x56, %g5
	stba	%i5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%o3
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	nop
	set	0x4A, %l1
	sth	%g7,	[%l7 + %l1]
	nop
	set	0x50, %g6
	std	%l4,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x7F, %i6
	ldub	[%l7 + %i6],	%o7
	st	%f9,	[%l7 + 0x3C]
	or	%g4,	%l0,	%l4
	set	0x60, %g3
	stda	%g2,	[%l7 + %g3] 0x80
	nop
	set	0x51, %o1
	ldsb	[%l7 + %o1],	%i4
	add	%g6,	%i2,	%i1
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x88,	%g2
	nop
	set	0x50, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x27, %o0
	ldstub	[%l7 + %o0],	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o4
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x88,	%i7
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%o0
	nop
	set	0x61, %i5
	ldub	[%l7 + %i5],	%i0
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x89,	%o1
	set	0x30, %i3
	stxa	%g1,	[%l7 + %i3] 0x88
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x88
	st	%f24,	[%l7 + 0x6C]
	wr 	%g0, 	0x5, 	%fprs
	bge,pt	%xcc,	loop_23
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%o5
	nop
	set	0x34, %g7
	lduw	[%l7 + %g7],	%l3
	set	0x3D, %l2
	stba	%g5,	[%l7 + %l2] 0xeb
	membar	#Sync
loop_23:
	nop
	set	0x78, %o5
	std	%i6,	[%l7 + %o5]
	nop
	set	0x62, %o7
	stb	%o3,	[%l7 + %o7]
	bgu,pt	%xcc,	loop_24
	nop
	set	0x10, %g1
	std	%f8,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x3E, %l4
	ldsb	[%l7 + %l4],	%o6
loop_24:
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd0,	%f16
	nop
	set	0x52, %i7
	sth	%i5,	[%l7 + %i7]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%l5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc8
	set	0x20, %o6
	swapa	[%l7 + %o6] 0x80,	%o7
	nop
	set	0x2A, %o3
	sth	%l0,	[%l7 + %o3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x81,	%l4,	%g3
	set	0x22, %g5
	stba	%g4,	[%l7 + %g5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x66, %l3
	sth	%i4,	[%l7 + %l3]
	fpsub16	%f2,	%f8,	%f8
	st	%f25,	[%l7 + 0x10]
	nop
	set	0x1E, %l1
	ldsh	[%l7 + %l1],	%i2
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f30
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f0
	nop
	set	0x20, %g3
	ldsh	[%l7 + %g3],	%i1
	nop
	set	0x09, %i4
	ldsb	[%l7 + %i4],	%g2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%i3
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%g6
	nop
	set	0x64, %l6
	ldstub	[%l7 + %l6],	%o4
	nop
	set	0x0C, %o0
	stw	%i7,	[%l7 + %o0]
	add	%l1,	%i0,	%o1
	nop
	set	0x0C, %o1
	prefetch	[%l7 + %o1],	 2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f16
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%o0
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%o5
	nop
	set	0x53, %i5
	ldstub	[%l7 + %i5],	%l3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%l6
	nop
	set	0x68, %o4
	std	%o2,	[%l7 + %o4]
	add	%o6,	%i5,	%l5
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f16
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%o6
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x81,	 1
	set	0x69, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l4
	nop
	set	0x08, %o5
	stw	%g3,	[%l7 + %o5]
	nop
	set	0x1C, %l2
	lduh	[%l7 + %l2],	%g4
	add	%i4,	%i2,	%i1
	nop
	set	0x46, %g1
	lduh	[%l7 + %g1],	%g7
	nop
	set	0x30, %o7
	stb	%i6,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x68]
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x80,	%i2
	set	0x68, %l4
	stda	%g6,	[%l7 + %l4] 0x89
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f16
	set	0x60, %o2
	stha	%o4,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x2A, %o6
	lduh	[%l7 + %o6],	%i7
	nop
	set	0x29, %i2
	ldub	[%l7 + %i2],	%l1
	set	0x50, %g5
	ldxa	[%l7 + %g5] 0x88,	%g2
	add	%i0,	%o1,	%o0
	nop
	set	0x60, %o3
	stw	%g1,	[%l7 + %o3]
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x81,	%l2
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x89,	%o2
	set	0x2E, %i6
	stha	%o5,	[%l7 + %i6] 0x88
	bl,a	%icc,	loop_25
	st	%fsr,	[%l7 + 0x10]
	set	0x54, %g3
	lda	[%l7 + %g3] 0x88,	%f6
loop_25:
	nop
	set	0x20, %i4
	stx	%g5,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x1C]
	set	0x4E, %g6
	stba	%l6,	[%l7 + %g6] 0xe3
	membar	#Sync
	and	%l3,	%o3,	%i5
	set	0x20, %l6
	swapa	[%l7 + %l6] 0x81,	%o6
	nop
	set	0x18, %i1
	ldsh	[%l7 + %i1],	%o7
	and	%l0,	%l5,	%g3
	nop
	set	0x1E, %o1
	ldsb	[%l7 + %o1],	%g4
	nop
	set	0x13, %o0
	ldstub	[%l7 + %o0],	%i4
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%i2
	set	0x2A, %i5
	stha	%l4,	[%l7 + %i5] 0x81
	nop
	set	0x14, %g2
	lduw	[%l7 + %g2],	%i1
	nop
	set	0x34, %i0
	stw	%i6,	[%l7 + %i0]
	set	0x70, %i3
	stxa	%g7,	[%l7 + %i3] 0x81
	set	0x18, %o4
	sta	%f23,	[%l7 + %o4] 0x89
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%g6
	and	%o4,	%i7,	%i3
	nop
	set	0x52, %o5
	ldsh	[%l7 + %o5],	%g2
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%l1
	nop
	set	0x20, %g1
	stw	%o1,	[%l7 + %g1]
	nop
	set	0x7B, %g7
	ldstub	[%l7 + %g7],	%o0
	nop
	set	0x18, %o7
	stw	%i0,	[%l7 + %o7]
	nop
	set	0x4A, %l0
	lduh	[%l7 + %l0],	%l2
	set	0x2C, %l4
	sta	%f27,	[%l7 + %l4] 0x89
	nop
	set	0x32, %i7
	sth	%g1,	[%l7 + %i7]
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%o2
	nop
	set	0x0A, %i2
	ldub	[%l7 + %i2],	%g5
	nop
	set	0x50, %g5
	ldsw	[%l7 + %g5],	%l6
	nop
	set	0x1B, %o3
	ldsb	[%l7 + %o3],	%l3
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	nop
	set	0x0F, %o6
	ldsb	[%l7 + %o6],	%o3
	nop
	set	0x4E, %i6
	ldsh	[%l7 + %i6],	%o5
	add	%o6,	%i5,	%l0
	bn	%icc,	loop_26
	nop
	nop
	setx	0xD3CC458D07489AF0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x849B775FCC26D4ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f26
	nop
	set	0x34, %g3
	swap	[%l7 + %g3],	%o7
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
loop_26:
	nop
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x88,	%g3
	set	0x18, %i4
	sta	%f26,	[%l7 + %i4] 0x81
	nop
	set	0x2A, %l6
	ldsh	[%l7 + %l6],	%g4
	nop
	set	0x60, %i1
	ldx	[%l7 + %i1],	%i4
	set	0x10, %o1
	stha	%l4,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x09, %o0
	stb	%i2,	[%l7 + %o0]
	st	%f9,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f0
	st	%f17,	[%l7 + 0x60]
	nop
	set	0x39, %g2
	ldub	[%l7 + %g2],	%i1
	add	%i6,	%g6,	%g7
	set	0x20, %i0
	stxa	%i7,	[%l7 + %i0] 0x88
	nop
	set	0x32, %i3
	stb	%i3,	[%l7 + %i3]
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x80,	 1
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x88,	%l1
	set	0x60, %o4
	sta	%f28,	[%l7 + %o4] 0x80
	set	0x2A, %o5
	stha	%o1,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x89,	%o0
	st	%fsr,	[%l7 + 0x68]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%i0
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%g1
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%o2
	set	0x08, %g7
	stxa	%l2,	[%l7 + %g7] 0x81
	nop
	set	0x10, %l4
	stx	%g5,	[%l7 + %l4]
	nop
	set	0x44, %i7
	stw	%l6,	[%l7 + %i7]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xcc
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x1C, %l0
	swap	[%l7 + %l0],	%o3
	add	%o5,	%l3,	%i5
	set	0x6C, %g5
	sta	%f25,	[%l7 + %g5] 0x80
	nop
	set	0x54, %l1
	stw	%l0,	[%l7 + %l1]
	nop
	set	0x22, %o3
	ldub	[%l7 + %o3],	%o6
	nop
	set	0x68, %i6
	ldsh	[%l7 + %i6],	%o7
	and	%l5,	%g4,	%g3
	nop
	set	0x41, %g3
	stb	%i4,	[%l7 + %g3]
	nop
	set	0x36, %l3
	stb	%i2,	[%l7 + %l3]
	set	0x3E, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l4
	bn,a	%xcc,	loop_27
	st	%f30,	[%l7 + 0x1C]
	set	0x60, %g6
	sta	%f17,	[%l7 + %g6] 0x80
loop_27:
	nop
	set	0x10, %l6
	ldsh	[%l7 + %l6],	%i6
	nop
	set	0x50, %i1
	std	%i0,	[%l7 + %i1]
	nop
	set	0x0C, %o1
	ldsb	[%l7 + %o1],	%g6
	nop
	set	0x4A, %o0
	stb	%g7,	[%l7 + %o0]
	nop
	set	0x26, %i4
	stb	%i7,	[%l7 + %i4]
	set	0x48, %g2
	stda	%i2,	[%l7 + %g2] 0x89
	set	0x38, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o4
	nop
	set	0x48, %i3
	ldsh	[%l7 + %i3],	%l1
	nop
	set	0x49, %i5
	stb	%o0,	[%l7 + %i5]
	nop
	set	0x45, %l5
	ldstub	[%l7 + %l5],	%o1
	ld	[%l7 + 0x64],	%f20
	nop
	set	0x64, %g4
	lduh	[%l7 + %g4],	%g2
	nop
	set	0x18, %o4
	prefetch	[%l7 + %o4],	 2
	wr	%i0,	%g1,	%ccr
	nop
	set	0x50, %o5
	lduw	[%l7 + %o5],	%o2
	set	0x2C, %l2
	stha	%l2,	[%l7 + %l2] 0x88
	nop
	set	0x58, %g1
	std	%i6,	[%l7 + %g1]
	nop
	set	0x22, %g7
	ldub	[%l7 + %g7],	%g5
	nop
	set	0x6D, %l4
	ldstub	[%l7 + %l4],	%o5
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x81,	%o3
	set	0x64, %o7
	lda	[%l7 + %o7] 0x80,	%f18
	nop
	set	0x7E, %o2
	sth	%i5,	[%l7 + %o2]
	nop
	set	0x25, %i2
	ldsb	[%l7 + %i2],	%l3
	st	%fsr,	[%l7 + 0x18]
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xe3,	%o6
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%o7
	nop
	set	0x34, %o3
	sth	%l0,	[%l7 + %o3]
	nop
	set	0x60, %i6
	stw	%l5,	[%l7 + %i6]
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%g3
	nop
	set	0x36, %l3
	lduh	[%l7 + %l3],	%g4
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	nop
	set	0x4A, %g6
	lduh	[%l7 + %g6],	%i2
	add	%l4,	%i4,	%i1
	ld	[%l7 + 0x5C],	%f3
	nop
	set	0x4C, %l6
	ldsh	[%l7 + %l6],	%i6
	nop
	set	0x48, %g5
	ldsw	[%l7 + %g5],	%g6
	fpadd32s	%f5,	%f0,	%f2
	set	0x34, %o1
	stwa	%i7,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f24
	nop
	set	0x58, %i4
	stx	%g7,	[%l7 + %i4]
	and	%o4,	%i3,	%l1
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%o0
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%o1
	nop
	set	0x08, %i3
	ldsh	[%l7 + %i3],	%i0
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%g2
	nop
	set	0x60, %l5
	stw	%g1,	[%l7 + %l5]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	nop
	set	0x72, %o4
	ldstub	[%l7 + %o4],	%l2
	nop
	set	0x72, %o5
	sth	%o2,	[%l7 + %o5]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	and	%g5,	%o5,	%o3
	nop
	set	0x78, %g4
	std	%i4,	[%l7 + %g4]
	wr	%l3,	%l6,	%set_softint
	and	%o6,	%l0,	%l5
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xea,	%o6
	ld	[%l7 + 0x1C],	%f9
	fpsub32s	%f6,	%f31,	%f19
	set	0x0C, %l4
	sta	%f31,	[%l7 + %l4] 0x81
	nop
	set	0x63, %g1
	ldsb	[%l7 + %g1],	%g4
	set	0x38, %o7
	stxa	%i2,	[%l7 + %o7] 0x88
	and	%g3,	%i4,	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i6
	nop
	set	0x60, %o2
	lduh	[%l7 + %o2],	%g6
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f16
	and	%i7,	%o4,	%i3
	nop
	set	0x10, %i7
	ldsw	[%l7 + %i7],	%l1
	nop
	set	0x4A, %l1
	ldub	[%l7 + %l1],	%g7
	nop
	set	0x78, %o3
	sth	%o0,	[%l7 + %o3]
	nop
	set	0x71, %i6
	ldstub	[%l7 + %i6],	%i0
	nop
	set	0x0C, %g3
	ldsw	[%l7 + %g3],	%g2
	nop
	set	0x19, %l3
	stb	%o1,	[%l7 + %l3]
	and	%l2,	%o2,	%g1
	nop
	set	0x0B, %o6
	ldub	[%l7 + %o6],	%o5
	nop
	set	0x38, %g6
	ldsh	[%l7 + %g6],	%o3
	nop
	set	0x10, %l0
	stx	%g5,	[%l7 + %l0]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%l6
	nop
	set	0x18, %g5
	lduw	[%l7 + %g5],	%i5
	set	0x7C, %l6
	lda	[%l7 + %l6] 0x88,	%f5
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x81,	%o6
	nop
	set	0x3C, %i4
	ldsw	[%l7 + %i4],	%l0
	nop
	set	0x3C, %g2
	ldstub	[%l7 + %g2],	%o7
	set	0x68, %o0
	stda	%g4,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x66, %i1
	lduh	[%l7 + %i1],	%i2
	add	%l5,	%i4,	%g3
	fpadd16s	%f1,	%f1,	%f8
	be	%xcc,	loop_28
	nop
	set	0x0C, %i5
	lduh	[%l7 + %i5],	%i1
	fpadd32	%f0,	%f4,	%f24
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%l4
loop_28:
	nop
	nop
	setx	0xB3CE1194,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x99CA4D15,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f0,	%f19
	bgu,pt	%xcc,	loop_29
	nop
	set	0x38, %i3
	stx	%fsr,	[%l7 + %i3]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%g6
loop_29:
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f18
	or	%i7,	%o4,	%i3
	nop
	set	0x6B, %o5
	ldstub	[%l7 + %o5],	%l1
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%g2
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	nop
	set	0x36, %g4
	ldub	[%l7 + %g4],	%o0
	set	0x7B, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l2
	or	%o2,	%g1,	%o5
	nop
	set	0x66, %g1
	ldsh	[%l7 + %g1],	%o3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%l6
	set	0x18, %o7
	stda	%i4,	[%l7 + %o7] 0x81
	nop
	set	0x26, %l4
	lduh	[%l7 + %l4],	%l3
	nop
	set	0x30, %o2
	ldsw	[%l7 + %o2],	%o6
	nop
	set	0x5C, %i2
	ldsw	[%l7 + %i2],	%o7
	set	0x28, %l1
	stxa	%l0,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x6C, %i7
	stw	%i2,	[%l7 + %i7]
	nop
	set	0x0C, %o3
	stb	%l5,	[%l7 + %o3]
	set	0x28, %g3
	stda	%g4,	[%l7 + %g3] 0x81
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
	add	%g3,	%i4,	%l4
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f2
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%i1
	nop
	set	0x08, %l0
	ldsb	[%l7 + %l0],	%g6
	nop
	set	0x62, %g5
	ldsb	[%l7 + %g5],	%i6
	set	0x34, %g6
	sta	%f1,	[%l7 + %g6] 0x81
	set	0x2C, %l6
	sta	%f7,	[%l7 + %l6] 0x80
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x80,	 4
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x24, %g2
	ldsw	[%l7 + %g2],	%i3
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x56, %i5
	ldsh	[%l7 + %i5],	%l1
	fpsub32s	%f26,	%f14,	%f31
	be	%icc,	loop_30
	nop
	set	0x26, %o0
	ldsb	[%l7 + %o0],	%o4
	fpsub16	%f2,	%f26,	%f12
	nop
	set	0x5E, %l5
	sth	%g7,	[%l7 + %l5]
loop_30:
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 3
	fpsub32	%f8,	%f8,	%f24
	nop
	set	0x28, %l2
	std	%f10,	[%l7 + %l2]
	nop
	set	0x60, %o5
	lduw	[%l7 + %o5],	%i0
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x52, %g7
	ldsb	[%l7 + %g7],	%o1
	nop
	set	0x70, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x09, %o7
	ldub	[%l7 + %o7],	%l2
	set	0x74, %g1
	swapa	[%l7 + %g1] 0x81,	%o0
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f0
	nop
	set	0x3A, %l4
	sth	%o2,	[%l7 + %l4]
	set	0x70, %l1
	sta	%f31,	[%l7 + %l1] 0x88
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd2
	set	0x08, %o3
	swapa	[%l7 + %o3] 0x80,	%g1
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf8
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f16
	st	%fsr,	[%l7 + 0x0C]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x81,	%o3
	set	0x60, %l0
	sta	%f25,	[%l7 + %l0] 0x81
	set	0x51, %g5
	ldstuba	[%l7 + %g5] 0x81,	%o5
	nop
	set	0x50, %l3
	std	%g4,	[%l7 + %l3]
	nop
	set	0x68, %g6
	sth	%i5,	[%l7 + %g6]
	ld	[%l7 + 0x74],	%f30
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f14
	set	0x16, %o1
	stba	%l6,	[%l7 + %o1] 0xe2
	membar	#Sync
	ld	[%l7 + 0x74],	%f23
	nop
	set	0x74, %g2
	ldsh	[%l7 + %g2],	%l3
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f30
	nop
	set	0x60, %l6
	ldsh	[%l7 + %l6],	%o6
	set	0x20, %o0
	stda	%l0,	[%l7 + %o0] 0x80
	and	%i2,	%o7,	%l5
	set	0x0B, %i5
	stba	%g4,	[%l7 + %i5] 0x89
	nop
	set	0x08, %o4
	lduw	[%l7 + %o4],	%g3
	st	%fsr,	[%l7 + 0x0C]
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x88,	 3
	st	%f31,	[%l7 + 0x14]
	nop
	set	0x0E, %i3
	sth	%i1,	[%l7 + %i3]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
	set	0x59, %g4
	stba	%l4,	[%l7 + %g4] 0x88
	nop
	set	0x6C, %l2
	ldsb	[%l7 + %l2],	%i6
	nop
	set	0x68, %g7
	std	%g6,	[%l7 + %g7]
	or	%i3,	%i7,	%o4
	and	%g7,	%l1,	%i0
	nop
	set	0x10, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x20, %g1
	lduh	[%l7 + %g1],	%g2
	or	%l2,	%o0,	%o2
	set	0x10, %o7
	sta	%f1,	[%l7 + %o7] 0x88
	set	0x40, %o2
	stha	%o1,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x81,	%g0
	nop
	set	0x6A, %l4
	ldub	[%l7 + %l4],	%o5
	nop
	set	0x3C, %i2
	swap	[%l7 + %i2],	%g5
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x89,	%f18
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%i5
	or	%l6,	%l3,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%i2
	or	%o3,	%l5,	%g4
	set	0x64, %g3
	stha	%g3,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x50, %o6
	stwa	%i4,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x74, %l0
	ldub	[%l7 + %l0],	%o7
	set	0x60, %g5
	stxa	%l4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x58, %l3
	stwa	%i1,	[%l7 + %l3] 0x80
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i3
	nop
	set	0x30, %i7
	lduw	[%l7 + %i7],	%g6
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f22
	set	0x30, %o1
	sta	%f13,	[%l7 + %o1] 0x80
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%i7
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xe3,	%g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%l1
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f18
	nop
	nop
	setx	0xD9C6556725DB9C95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC2E7EC8497FEE908,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f20
	set	0x2C, %i1
	ldstuba	[%l7 + %i1] 0x81,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%o0
	nop
	set	0x50, %l6
	stx	%o2,	[%l7 + %l6]
	ld	[%l7 + 0x60],	%f5
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc4
	nop
	set	0x08, %o4
	sth	%o1,	[%l7 + %o4]
	nop
	set	0x48, %l5
	std	%g0,	[%l7 + %l5]
	nop
	set	0x2A, %o0
	ldub	[%l7 + %o0],	%o5
	nop
	set	0x28, %i3
	stb	%i5,	[%l7 + %i3]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%l6
	nop
	set	0x61, %o5
	stb	%l3,	[%l7 + %o5]
	set	0x4A, %g4
	stha	%l0,	[%l7 + %g4] 0x88
	set	0x56, %g7
	stha	%i2,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x16, %i0
	ldub	[%l7 + %i0],	%o3
	set	0x24, %g1
	swapa	[%l7 + %g1] 0x81,	%l5
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0
	fpsub32s	%f25,	%f25,	%f17
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x80,	%g3
	nop
	set	0x4C, %l2
	lduh	[%l7 + %l2],	%o6
	set	0x60, %l4
	stxa	%i4,	[%l7 + %l4] 0x80
	set	0x30, %l1
	stda	%o6,	[%l7 + %l1] 0xe3
	membar	#Sync
	and	%l4,	%i6,	%i1
	nop
	set	0x58, %o3
	ldx	[%l7 + %o3],	%g6
	nop
	set	0x6A, %i2
	lduh	[%l7 + %i2],	%i3
	nop
	set	0x40, %i6
	std	%i6,	[%l7 + %i6]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%f0
	set	0x60, %o6
	sta	%f14,	[%l7 + %o6] 0x89
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%g7
	nop
	set	0x5F, %l3
	ldsb	[%l7 + %l3],	%o4
	set	0x38, %i7
	sta	%f25,	[%l7 + %i7] 0x88
	nop
	set	0x10, %g5
	std	%l0,	[%l7 + %g5]
	set	0x7C, %i4
	stha	%i0,	[%l7 + %i4] 0x88
	nop
	set	0x78, %g2
	ldsb	[%l7 + %g2],	%l2
	nop
	set	0x54, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	nop
	setx	0x54245B646D702C26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF06AE00F3359F56D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f2,	%f20
	nop
	set	0x20, %g6
	ldsh	[%l7 + %g6],	%o0
	nop
	set	0x40, %i1
	stw	%o2,	[%l7 + %i1]
	nop
	set	0x50, %i5
	lduw	[%l7 + %i5],	%g2
	nop
	set	0x58, %l6
	stx	%g1,	[%l7 + %l6]
	nop
	set	0x78, %l5
	std	%f18,	[%l7 + %l5]
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%o0
	st	%fsr,	[%l7 + 0x5C]
	and	%i5,	%o5,	%l6
	nop
	set	0x42, %o4
	ldub	[%l7 + %o4],	%l3
	set	0x28, %i3
	stxa	%g5,	[%l7 + %i3] 0xe2
	membar	#Sync
	st	%f27,	[%l7 + 0x40]
	add	%l0,	%i2,	%o3
	set	0x14, %g4
	ldstuba	[%l7 + %g4] 0x81,	%l5
	nop
	set	0x68, %g7
	ldub	[%l7 + %g7],	%g4
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%f8
	wr	%o6,	%g3,	%ccr
	nop
	set	0x5A, %o5
	stb	%o7,	[%l7 + %o5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i4
	nop
	set	0x30, %g1
	std	%f16,	[%l7 + %g1]
	nop
	set	0x10, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x18, %l2
	stw	%i1,	[%l7 + %l2]
	set	0x24, %l4
	lda	[%l7 + %l4] 0x80,	%f12
	set	0x6C, %o2
	stha	%i6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd2,	%f0
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	nop
	set	0x50, %g3
	std	%f12,	[%l7 + %g3]
	nop
	set	0x7C, %o6
	stw	%i7,	[%l7 + %o6]
	nop
	set	0x60, %i6
	lduw	[%l7 + %i6],	%i3
	set	0x78, %l3
	swapa	[%l7 + %l3] 0x88,	%g7
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x80,	%l1
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%f18
	st	%fsr,	[%l7 + 0x40]
	or	%o4,	%l2,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%g2
	nop
	set	0x28, %g5
	stx	%o2,	[%l7 + %g5]
	set	0x78, %g2
	ldxa	[%l7 + %g2] 0x81,	%g1
	nop
	set	0x68, %i4
	stx	%i5,	[%l7 + %i4]
	nop
	set	0x53, %o1
	ldub	[%l7 + %o1],	%o5
	nop
	set	0x38, %i1
	lduh	[%l7 + %i1],	%o1
	set	0x5C, %g6
	stwa	%l6,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x37, %l6
	ldub	[%l7 + %l6],	%g5
	nop
	set	0x5D, %l5
	stb	%l3,	[%l7 + %l5]
	add	%l0,	%o3,	%i2
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%l4
	or	%g4,	%g3,	%o7
	nop
	set	0x28, %o4
	std	%f30,	[%l7 + %o4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%i4
	nop
	set	0x68, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%l4
	nop
	set	0x28, %g4
	sth	%i1,	[%l7 + %g4]
	ld	[%l7 + 0x7C],	%f31
	or	%g6,	%i7,	%i6
	add	%i3,	%g7,	%l1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o0
	ba,pt	%icc,	loop_31
	wr	%i0,	%g2,	%softint
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%g1
loop_31:
	nop
	set	0x58, %i0
	stxa	%l2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x4A, %g7
	ldub	[%l7 + %g7],	%i5
	set	0x6A, %g1
	stha	%o5,	[%l7 + %g1] 0x89
	nop
	set	0x17, %o5
	ldsb	[%l7 + %o5],	%o1
	nop
	set	0x78, %o7
	swap	[%l7 + %o7],	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l3
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x88,	%l0
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x89,	%o2
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf8
	membar	#Sync
	set	0x48, %l4
	stxa	%l5,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x80,	%g4
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x38, %g3
	stx	%i2,	[%l7 + %g3]
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x48, %o6
	sta	%f3,	[%l7 + %o6] 0x88
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x88,	%g3
	or	%o6,	%o7,	%i4
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x81,	 2
	nop
	set	0x58, %i6
	std	%f4,	[%l7 + %i6]
	nop
	set	0x25, %g5
	ldstub	[%l7 + %g5],	%g6
	nop
	set	0x4C, %g2
	lduw	[%l7 + %g2],	%i7
	bge,a,pt	%xcc,	loop_32
	nop
	set	0x29, %l0
	ldub	[%l7 + %l0],	%i1
	nop
	set	0x50, %i4
	ldd	[%l7 + %i4],	%f14
	nop
	set	0x2F, %i1
	ldub	[%l7 + %i1],	%i3
loop_32:
	nop
	set	0x30, %o1
	sta	%f14,	[%l7 + %o1] 0x81
	nop
	set	0x14, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%g6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%i6
	st	%f23,	[%l7 + 0x4C]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	nop
	set	0x34, %l5
	ldsw	[%l7 + %l5],	%o0
	set	0x18, %i3
	swapa	[%l7 + %i3] 0x80,	%o4
	nop
	set	0x0C, %i5
	stw	%i0,	[%l7 + %i5]
	nop
	set	0x28, %o4
	stb	%g2,	[%l7 + %o4]
	nop
	set	0x4A, %g4
	ldsh	[%l7 + %g4],	%g1
	set	0x4E, %g7
	stha	%o2,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x88,	%i5
	or	%l2,	%o5,	%o1
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x80,	%i6
	ld	[%l7 + 0x20],	%f20
	nop
	set	0x14, %o5
	ldsb	[%l7 + %o5],	%l3
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	st	%fsr,	[%l7 + 0x74]
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xea,	%g4
	nop
	set	0x64, %o7
	lduw	[%l7 + %o7],	%o3
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x80,	 0
	nop
	set	0x1C, %o3
	stw	%g4,	[%l7 + %o3]
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%i2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l5,	%g3
	set	0x58, %l1
	ldxa	[%l7 + %l1] 0x89,	%o6
	nop
	set	0x74, %o6
	swap	[%l7 + %o6],	%i4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc8
	set	0x18, %i2
	stxa	%o7,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%l4,	%g6,	%i1
	nop
	set	0x40, %i6
	stw	%i7,	[%l7 + %i6]
	wr	%i3,	%l1,	%set_softint
	nop
	set	0x64, %i7
	lduw	[%l7 + %i7],	%g7
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x81
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f0
	nop
	set	0x75, %i1
	ldub	[%l7 + %i1],	%i6
	add	%g1,	%o2,	%g2
	ld	[%l7 + 0x5C],	%f0
	nop
	set	0x48, %i4
	stx	%l2,	[%l7 + %i4]
	ld	[%l7 + 0x24],	%f18
	nop
	set	0x20, %o1
	stb	%i5,	[%l7 + %o1]
	nop
	set	0x20, %g6
	std	%f20,	[%l7 + %g6]
	nop
	set	0x6C, %l6
	lduw	[%l7 + %l6],	%o1
	nop
	set	0x68, %l5
	std	%i6,	[%l7 + %l5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%o5
	ld	[%l7 + 0x48],	%f18
	nop
	set	0x0E, %o0
	lduh	[%l7 + %o0],	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%o3
	or	%i2,	%l5,	%g3
	nop
	set	0x60, %i5
	lduw	[%l7 + %i5],	%o6
	set	0x38, %o4
	swapa	[%l7 + %o4] 0x81,	%i4
	set	0x44, %g4
	sta	%f17,	[%l7 + %g4] 0x89
	nop
	set	0x24, %i3
	sth	%g4,	[%l7 + %i3]
	nop
	set	0x4C, %g7
	prefetch	[%l7 + %g7],	 3
	set	0x68, %g1
	sta	%f15,	[%l7 + %g1] 0x81
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%g6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%i7
	nop
	set	0x70, %i0
	stx	%i3,	[%l7 + %i0]
	nop
	set	0x2C, %o5
	swap	[%l7 + %o5],	%i1
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x80,	 1
	fpsub16s	%f31,	%f18,	%f5
	set	0x18, %l2
	stda	%l0,	[%l7 + %l2] 0x80
	st	%f18,	[%l7 + 0x14]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xcc
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	nop
	set	0x25, %g3
	stb	%o0,	[%l7 + %g3]
	nop
	set	0x5E, %l1
	ldsh	[%l7 + %l1],	%o4
	set	0x28, %l4
	stda	%i0,	[%l7 + %l4] 0x80
	nop
	set	0x4C, %o6
	lduw	[%l7 + %o6],	%i6
	nop
	set	0x48, %i2
	ldx	[%l7 + %i2],	%g1
	nop
	set	0x74, %i6
	stb	%g2,	[%l7 + %i6]
	set	0x58, %i7
	stxa	%o2,	[%l7 + %i7] 0xea
	membar	#Sync
	or	%l2,	%i5,	%l6
	or	%o1,	%l3,	%o5
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd2
	set	0x68, %g5
	stxa	%l0,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x20, %l3
	stba	%o3,	[%l7 + %l3] 0xeb
	membar	#Sync
	add	%g5,	%i2,	%l5
	nop
	set	0x2B, %i1
	stb	%o6,	[%l7 + %i1]
	st	%f21,	[%l7 + 0x68]
	st	%f9,	[%l7 + 0x30]
	or	%i4,	%g3,	%g4
	ld	[%l7 + 0x48],	%f25
	st	%f9,	[%l7 + 0x40]
	add	%o7,	%l4,	%g6
	set	0x08, %i4
	stxa	%i7,	[%l7 + %i4] 0x80
	set	0x18, %l0
	sta	%f9,	[%l7 + %l0] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x60, %o1
	stda	%l0,	[%l7 + %o1] 0xeb
	membar	#Sync
	ba,a	%icc,	loop_33
	fpadd32s	%f16,	%f19,	%f5
	and	%o0,	%g7,	%i0
	nop
	set	0x50, %l6
	std	%i6,	[%l7 + %l6]
loop_33:
	or	%o4,	%g1,	%g2
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x88,	%l2
	set	0x58, %g6
	stwa	%i5,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f2
	nop
	set	0x64, %i5
	sth	%o2,	[%l7 + %i5]
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x81,	%o0
	add	%l6,	%o5,	%l3
	nop
	set	0x14, %o4
	lduw	[%l7 + %o4],	%l0
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%g5
	set	0x10, %g1
	stxa	%o3,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%f22
	set	0x78, %o5
	stxa	%l5,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x78, %o2
	ldstub	[%l7 + %o2],	%o6
	nop
	set	0x6C, %i0
	stb	%i4,	[%l7 + %i0]
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xe3,	%g2
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf9
	membar	#Sync
	nop
	set	0x2C, %g3
	swap	[%l7 + %g3],	%g4
	nop
	set	0x58, %o3
	ldstub	[%l7 + %o3],	%i2
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x3C, %o6
	sta	%f22,	[%l7 + %o6] 0x81
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%o7
	nop
	set	0x18, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%l4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f0
	set	0x15, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i7
	nop
	set	0x32, %l3
	ldsh	[%l7 + %l3],	%g6
	bl,pt	%xcc,	loop_34
	nop
	set	0x68, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x08, %i4
	swapa	[%l7 + %i4] 0x88,	%i3
loop_34:
	add	%i1,	%l1,	%g7
	nop
	set	0x6C, %l0
	ldub	[%l7 + %l0],	%o0
	and	%i0,	%i6,	%o4
	nop
	set	0x68, %l1
	stw	%g2,	[%l7 + %l1]
	nop
	set	0x2F, %o1
	ldstub	[%l7 + %o1],	%l2
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%g1
	nop
	set	0x48, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x6C, %o0
	lduh	[%l7 + %o0],	%o2
	nop
	set	0x1F, %i5
	ldub	[%l7 + %i5],	%i5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o5
	nop
	set	0x48, %l6
	stw	%l6,	[%l7 + %l6]
	set	0x74, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l0
	add	%g5,	%o3,	%l5
	nop
	set	0x24, %g4
	lduw	[%l7 + %g4],	%o6
	set	0x28, %g1
	lda	[%l7 + %g1] 0x80,	%f14
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xe2,	%l2
	or	%i4,	%g3,	%i2
	set	0x38, %o5
	sta	%f9,	[%l7 + %o5] 0x80
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1298
!	Type a   	: 27
!	Type cti   	: 34
!	Type x   	: 488
!	Type f   	: 35
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
.word 0xCB7E96D6
.word 0xA8436486
.word 0xBE7F6D71
.word 0xA1E2DB1F
.word 0x24F78E8E
.word 0xB30CB202
.word 0xCABED63E
.word 0xEA9F388B
.word 0x7DE94838
.word 0xF24901F8
.word 0x266EE40F
.word 0x76A73D84
.word 0x535509CE
.word 0xBBCBA647
.word 0xAD2088F4
.word 0x43F23E3B
.word 0x9093CCFA
.word 0x175FC199
.word 0x406A3863
.word 0xEF8CCE5B
.word 0x5D459AC2
.word 0xBA4767A0
.word 0xF68416BE
.word 0x94CC719D
.word 0x5B47D397
.word 0xBCEB975F
.word 0x66ECE725
.word 0xBB9FB28C
.word 0x5BB2746D
.word 0xAB99F497
.word 0xC49E665C
.word 0xB8F65A8E
.word 0x9EDF8AFB
.word 0xBB0E3FFE
.word 0x134AC041
.word 0x8F70FC6D
.word 0x8CAAE212
.word 0xEF5EE687
.word 0xAF528867
.word 0x57EA8BEF
.word 0x73564E06
.word 0x408895FD
.word 0xB17C7535
.word 0x122B541A
.word 0x8D2B68D6
.word 0x5133B27D
.word 0x75945F35
.word 0xDEFC9A0F
.word 0x233BC2D6
.word 0x33157B3F
.word 0xE8C97E91
.word 0x97E5C58C
.word 0xBF1C00E0
.word 0x45D8701E
.word 0xDF68542D
.word 0x5E6F8870
.word 0xA9AAC58C
.word 0x43747C3E
.word 0xD4ED5090
.word 0x97008FF6
.word 0x6ADFFCF5
.word 0x8BD204C0
.word 0x59B157B4
.word 0x2AF28112
.end
