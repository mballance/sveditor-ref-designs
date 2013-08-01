/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc17.s
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
	set	0xC,	%g1
	set	0x6,	%g2
	set	0x4,	%g3
	set	0x4,	%g4
	set	0xC,	%g5
	set	0xA,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x9,	%i0
	set	-0xC,	%i1
	set	-0xB,	%i2
	set	-0xC,	%i3
	set	-0x3,	%i4
	set	-0xF,	%i5
	set	-0xA,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x391EBF82,	%l0
	set	0x67A1B9B2,	%l1
	set	0x19DF78B6,	%l2
	set	0x0B2E7487,	%l3
	set	0x235CCC00,	%l4
	set	0x44B1A4FB,	%l5
	set	0x0EB9C7D5,	%l6
	!# Output registers
	set	0x1948,	%o0
	set	-0x02EB,	%o1
	set	0x1240,	%o2
	set	0x08E7,	%o3
	set	-0x07F6,	%o4
	set	-0x0790,	%o5
	set	-0x061D,	%o6
	set	-0x199A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBE94320315EA145)
	INIT_TH_FP_REG(%l7,%f2,0xB5471BAA5B51C6CA)
	INIT_TH_FP_REG(%l7,%f4,0x8157B066C5F2C06F)
	INIT_TH_FP_REG(%l7,%f6,0x756F6BC7D1E2E2CA)
	INIT_TH_FP_REG(%l7,%f8,0x5759B37A4BCF70B2)
	INIT_TH_FP_REG(%l7,%f10,0xDF8958CC7B1132CD)
	INIT_TH_FP_REG(%l7,%f12,0xD1C2A55D1E72113A)
	INIT_TH_FP_REG(%l7,%f14,0x2029EC7D6C4FA7EB)
	INIT_TH_FP_REG(%l7,%f16,0x940761EE5DA0BA0C)
	INIT_TH_FP_REG(%l7,%f18,0xCB9CA4E30E7CD42F)
	INIT_TH_FP_REG(%l7,%f20,0xD06D1004FC37424D)
	INIT_TH_FP_REG(%l7,%f22,0x748C550A4F15A96C)
	INIT_TH_FP_REG(%l7,%f24,0x29D4335056EAF66E)
	INIT_TH_FP_REG(%l7,%f26,0x17D7F555D161ACA5)
	INIT_TH_FP_REG(%l7,%f28,0x3EA1A737742EFDB7)
	INIT_TH_FP_REG(%l7,%f30,0xA0E6B8C67F725706)

	!# Execute Main Diag ..

	set	0x1C, %o3
	swapa	[%l7 + %o3] 0x81,	%i7
	nop
	set	0x7A, %o4
	sth	%l4,	[%l7 + %o4]
	set	0x78, %o1
	sta	%f14,	[%l7 + %o1] 0x80
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o1
	set	0x48, %g4
	stxa	%o2,	[%l7 + %g4] 0x80
	set	0x32, %o0
	stba	%l3,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%o4
	fpsub16s	%f8,	%f29,	%f2
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x89,	%l0
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%g2
	nop
	set	0x72, %l0
	ldsh	[%l7 + %l0],	%g2
	set	0x78, %o7
	stda	%i0,	[%l7 + %o7] 0x81
	nop
	set	0x62, %i1
	ldub	[%l7 + %i1],	%o5
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x26, %i4
	ldub	[%l7 + %i4],	%g5
	or	%i2,	%o6,	%i5
	nop
	set	0x16, %o5
	sth	%l2,	[%l7 + %o5]
	set	0x5A, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i0
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x80,	%g1
	nop
	set	0x66, %i6
	stb	%g4,	[%l7 + %i6]
	add	%l6,	%o3,	%l5
	nop
	set	0x20, %l6
	prefetch	[%l7 + %l6],	 1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%g6
	set	0x18, %g5
	stda	%o6,	[%l7 + %g5] 0x81
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x89,	%i4
	set	0x08, %l1
	swapa	[%l7 + %l1] 0x88,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA53, 	%tick_cmpr
	or	%l4,	%l1,	%o1
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x88,	%i3
	nop
	set	0x3C, %i3
	ldsh	[%l7 + %i3],	%o2
	nop
	set	0x16, %i5
	sth	%o4,	[%l7 + %i5]
	set	0x5C, %g3
	sta	%f15,	[%l7 + %g3] 0x80
	set	0x3C, %l3
	swapa	[%l7 + %l3] 0x81,	%l0
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%l2
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%g2
	nop
	set	0x40, %i2
	swap	[%l7 + %i2],	%g3
	set	0x08, %o3
	sta	%f8,	[%l7 + %o3] 0x88
	set	0x24, %g6
	lda	[%l7 + %g6] 0x80,	%f28
	fpsub16s	%f17,	%f7,	%f0
	set	0x10, %o1
	stda	%i0,	[%l7 + %o1] 0x88
	nop
	set	0x1F, %o4
	ldsb	[%l7 + %o4],	%o5
	set	0x48, %g4
	stda	%i2,	[%l7 + %g4] 0x80
	set	0x60, %i7
	stxa	%g5,	[%l7 + %i7] 0x81
	add	%i5,	%l2,	%i0
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%o6
	st	%fsr,	[%l7 + 0x1C]
	and	%g4,	%g1,	%o3
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x88,	 3
	set	0x26, %o0
	stha	%i6,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xe2,	%g6
	set	0x2A, %o7
	stha	%l6,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x47, %g7
	ldstub	[%l7 + %g7],	%i4
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf9
	membar	#Sync
	set	0x38, %o5
	stda	%o6,	[%l7 + %o5] 0x88
	nop
	set	0x2C, %i4
	ldstub	[%l7 + %i4],	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l4
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%l1
	set	0x18, %i6
	stwa	%o1,	[%l7 + %i6] 0xeb
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%o2
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x80,	%o4
	set	0x5C, %l6
	swapa	[%l7 + %l6] 0x89,	%l0
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xda
	nop
	set	0x54, %l1
	ldsw	[%l7 + %l1],	%o0
	nop
	set	0x08, %l5
	stx	%l3,	[%l7 + %l5]
	nop
	set	0x0C, %i3
	lduw	[%l7 + %i3],	%g3
	nop
	set	0x08, %g5
	stx	%g2,	[%l7 + %g5]
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%o5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%i1
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x89,	%g5
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%l2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o6
	set	0x30, %o6
	prefetcha	[%l7 + %o6] 0x81,	 0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%o3
	nop
	set	0x3C, %i2
	lduh	[%l7 + %i2],	%l5
	set	0x48, %o3
	stda	%g0,	[%l7 + %o3] 0x89
	nop
	set	0x08, %l4
	stw	%i6,	[%l7 + %l4]
	nop
	set	0x68, %g6
	std	%f4,	[%l7 + %g6]
	nop
	set	0x4B, %o4
	ldsb	[%l7 + %o4],	%l6
	set	0x58, %g4
	stwa	%i4,	[%l7 + %g4] 0x89
	nop
	set	0x3E, %o1
	ldub	[%l7 + %o1],	%g6
	set	0x74, %g1
	sta	%f10,	[%l7 + %g1] 0x88
	ld	[%l7 + 0x20],	%f13
	nop
	set	0x33, %i7
	ldsb	[%l7 + %i7],	%o7
	set	0x1F, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i7
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x10, %o7
	stx	%fsr,	[%l7 + %o7]
	bne,a,pt	%xcc,	loop_1
	or	%g7,	%l4,	%l1
	wr 	%g0, 	0x5, 	%fprs
	set	0x65, %i0
	ldstuba	[%l7 + %i0] 0x81,	%o2
loop_1:
	fpsub32	%f26,	%f4,	%f24
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%l0
	add	%o0,	%g3,	%g2
	ld	[%l7 + 0x1C],	%f18
	ld	[%l7 + 0x74],	%f24
	set	0x24, %g7
	sta	%f26,	[%l7 + %g7] 0x81
	nop
	set	0x30, %o5
	swap	[%l7 + %o5],	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%i2
	nop
	set	0x1C, %i1
	lduh	[%l7 + %i1],	%g5
	nop
	set	0x30, %g2
	stx	%i1,	[%l7 + %g2]
	nop
	set	0x38, %i4
	stx	%i5,	[%l7 + %i4]
	nop
	set	0x68, %i6
	ldsb	[%l7 + %i6],	%o6
	nop
	set	0x7C, %l6
	sth	%i0,	[%l7 + %l6]
	fpadd32	%f4,	%f30,	%f0
	set	0x58, %o2
	stda	%l2,	[%l7 + %o2] 0xe3
	membar	#Sync
	set	0x58, %l2
	ldstuba	[%l7 + %l2] 0x89,	%g4
	set	0x48, %l5
	stxa	%l5,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x6C, %l1
	stw	%g1,	[%l7 + %l1]
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%o3
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f16
	wr	%i6,	%i4,	%ccr
	nop
	set	0x47, %g5
	ldub	[%l7 + %g5],	%g6
	nop
	set	0x68, %l3
	lduw	[%l7 + %l3],	%o7
	nop
	set	0x30, %i5
	ldx	[%l7 + %i5],	%l6
	set	0x42, %i2
	stba	%g7,	[%l7 + %i2] 0x81
	nop
	set	0x7C, %o6
	stw	%i7,	[%l7 + %o6]
	be,a,pt	%icc,	loop_2
	and	%l1,	%i3,	%o1
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%o2
	nop
	set	0x08, %g6
	std	%f2,	[%l7 + %g6]
loop_2:
	nop
	set	0x3A, %l4
	ldsh	[%l7 + %l4],	%l4
	nop
	set	0x50, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x80,	 3
	bge	%xcc,	loop_3
	nop
	set	0x56, %o1
	ldub	[%l7 + %o1],	%l0
	nop
	set	0x19, %i7
	ldstub	[%l7 + %i7],	%g3
	nop
	set	0x3F, %g1
	ldstub	[%l7 + %g1],	%g2
loop_3:
	nop
	set	0x77, %l0
	stb	%l3,	[%l7 + %l0]
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x1C, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o0
	nop
	set	0x5A, %i0
	sth	%o5,	[%l7 + %i0]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f0
	set	0x24, %i1
	stha	%i2,	[%l7 + %i1] 0x89
	add	%g5,	%i1,	%i5
	nop
	set	0x28, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x4C, %g2
	lduw	[%l7 + %g2],	%o6
	set	0x58, %i4
	stda	%i0,	[%l7 + %i4] 0x89
	and	%g4,	%l5,	%l2
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%g0
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%o2
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x88,	%i6
	nop
	set	0x70, %o2
	stw	%i4,	[%l7 + %o2]
	set	0x70, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g6
	set	0x2C, %l1
	sta	%f13,	[%l7 + %l1] 0x89
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f16
	nop
	set	0x7B, %g5
	ldstub	[%l7 + %g5],	%l6
	ld	[%l7 + 0x38],	%f25
	nop
	set	0x48, %l3
	stb	%g7,	[%l7 + %l3]
	fpadd32s	%f1,	%f3,	%f23
	nop
	set	0x30, %i5
	std	%f6,	[%l7 + %i5]
	set	0x18, %i2
	stda	%o6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x78, %o6
	stha	%l1,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%i7
	set	0x10, %g3
	ldxa	[%l7 + %g3] 0x80,	%i3
	nop
	set	0x6D, %l4
	ldsb	[%l7 + %l4],	%o1
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x88,	%l4
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%o4
	set	0x28, %g6
	prefetcha	[%l7 + %g6] 0x89,	 2
	nop
	set	0x4A, %i7
	ldub	[%l7 + %i7],	%g3
	nop
	set	0x20, %o1
	std	%f12,	[%l7 + %o1]
	set	0x22, %g1
	stha	%g2,	[%l7 + %g1] 0x88
	nop
	set	0x2E, %l0
	lduh	[%l7 + %l0],	%l3
	set	0x3F, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o0
	nop
	set	0x78, %i0
	swap	[%l7 + %i0],	%l0
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%o4
	or	%g5,	%i1,	%i5
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x81,	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%i0
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%l4
	nop
	set	0x40, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x2D, %i4
	ldstuba	[%l7 + %i4] 0x89,	%g4
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x80,	%l2
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x80,	%g1
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%o2
	ld	[%l7 + 0x24],	%f24
	nop
	set	0x36, %l2
	ldub	[%l7 + %l2],	%i4
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x81,	%g6
	set	0x48, %l1
	stwa	%l6,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
	set	0x20, %l5
	stwa	%g7,	[%l7 + %l5] 0x88
	or	%i6,	%o7,	%l1
	add	%i3,	%i7,	%o1
	wr	%l4,	%o4,	%set_softint
	nop
	set	0x7C, %g5
	sth	%o2,	[%l7 + %g5]
	nop
	set	0x48, %i5
	ldsw	[%l7 + %i5],	%g3
	or	%g2,	%o0,	%l3
	set	0x10, %l3
	stxa	%o5,	[%l7 + %l3] 0x80
	set	0x14, %i2
	ldstuba	[%l7 + %i2] 0x81,	%l0
	nop
	set	0x68, %o6
	stx	%i1,	[%l7 + %o6]
	st	%f8,	[%l7 + 0x2C]
	fpadd32s	%f15,	%f31,	%f19
	set	0x0C, %g3
	sta	%f24,	[%l7 + %g3] 0x88
	set	0x24, %l4
	swapa	[%l7 + %l4] 0x81,	%i5
	and	%o6,	%g5,	%i2
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x81,	%l5
	set	0x40, %g4
	stwa	%i0,	[%l7 + %g4] 0x80
	set	0x14, %g6
	stwa	%g4,	[%l7 + %g6] 0x81
	nop
	set	0x26, %o4
	stb	%g1,	[%l7 + %o4]
	or	%o3,	%l2,	%i4
	nop
	set	0x09, %o1
	ldub	[%l7 + %o1],	%l6
	wr	%g6,	%g7,	%set_softint
	nop
	set	0x5F, %i7
	ldsb	[%l7 + %i7],	%i6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc2
	add	%o7,	%l1,	%i7
	set	0x50, %l0
	lda	[%l7 + %l0] 0x81,	%f21
	nop
	set	0x68, %i0
	ldd	[%l7 + %i0],	%i2
	nop
	set	0x08, %o0
	stx	%l4,	[%l7 + %o0]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%o2
	nop
	set	0x20, %o7
	std	%o0,	[%l7 + %o7]
	add	%g3,	%g2,	%l3
	nop
	set	0x20, %i1
	std	%f14,	[%l7 + %i1]
	nop
	set	0x78, %g7
	std	%f16,	[%l7 + %g7]
	set	0x20, %o5
	stwa	%o5,	[%l7 + %o5] 0x80
	nop
	set	0x48, %l6
	std	%f6,	[%l7 + %l6]
	set	0x6C, %i4
	stba	%o0,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x73, %i6
	stb	%l0,	[%l7 + %i6]
	nop
	set	0x40, %g2
	ldsw	[%l7 + %g2],	%i1
	add	%i5,	%o6,	%i2
	nop
	set	0x20, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x16, %l2
	lduh	[%l7 + %l2],	%i0
	nop
	set	0x58, %i3
	std	%f2,	[%l7 + %i3]
	nop
	set	0x38, %l5
	ldstub	[%l7 + %l5],	%l5
	and	%g1,	%g4,	%o3
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%i4
	nop
	set	0x48, %i5
	lduw	[%l7 + %i5],	%l2
	nop
	set	0x28, %l3
	ldx	[%l7 + %l3],	%l6
	nop
	set	0x10, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x08, %o6
	stx	%g7,	[%l7 + %o6]
	or	%i6,	%o7,	%l1
	or	%g6,	%i3,	%l4
	nop
	set	0x52, %l1
	stb	%o4,	[%l7 + %l1]
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x30, %g3
	ldxa	[%l7 + %g3] 0x88,	%i7
	nop
	set	0x1F, %g4
	stb	%o2,	[%l7 + %g4]
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f12
	nop
	set	0x5B, %o4
	ldstub	[%l7 + %o4],	%g3
	nop
	set	0x66, %o3
	ldstub	[%l7 + %o3],	%g2
	set	0x60, %o1
	stba	%o1,	[%l7 + %o1] 0x81
	nop
	set	0x18, %i7
	ldsw	[%l7 + %i7],	%o5
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	bn	%xcc,	loop_4
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%l3
	ld	[%l7 + 0x48],	%f18
	nop
	set	0x48, %i0
	ldsh	[%l7 + %i0],	%l0
loop_4:
	nop
	set	0x2D, %o0
	ldub	[%l7 + %o0],	%i1
	st	%f23,	[%l7 + 0x10]
	wr	%i5,	%o6,	%sys_tick
	set	0x0D, %o7
	stba	%o0,	[%l7 + %o7] 0x88
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%g4
	nop
	set	0x3E, %i1
	lduh	[%l7 + %i1],	%i2
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x81,	 4
	or	%l5,	%g4,	%g1
	set	0x56, %i4
	stha	%o3,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x81,	 1
	nop
	set	0x1C, %l6
	ldsw	[%l7 + %l6],	%l6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%l2
	set	0x48, %g2
	stxa	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x40, %o2
	stw	%l1,	[%l7 + %o2]
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f8
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g6
	nop
	set	0x54, %i3
	lduh	[%l7 + %i3],	%l4
	nop
	set	0x4C, %l5
	sth	%o4,	[%l7 + %l5]
	and	%i7,	%o2,	%i3
	and	%g3,	%g2,	%o1
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe2,	%l2
	nop
	set	0x70, %l3
	ldsh	[%l7 + %l3],	%l0
	set	0x18, %i2
	stwa	%i1,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x30, %o6
	std	%i4,	[%l7 + %o6]
	set	0x73, %i5
	stba	%o5,	[%l7 + %i5] 0x80
	or	%o0,	%g5,	%o6
	nop
	set	0x26, %l1
	sth	%i0,	[%l7 + %l1]
	nop
	set	0x44, %l4
	ldsh	[%l7 + %l4],	%l5
	nop
	set	0x62, %g3
	ldsh	[%l7 + %g3],	%i2
	nop
	set	0x46, %g6
	stb	%g1,	[%l7 + %g6]
	set	0x70, %o4
	stwa	%g4,	[%l7 + %o4] 0x81
	nop
	set	0x44, %o3
	ldsw	[%l7 + %o3],	%i4
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xea,	%i6
	set	0x54, %i7
	stwa	%o3,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%f4
	set	0x34, %o1
	stba	%g7,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%l2
	set	0x55, %i0
	ldstuba	[%l7 + %i0] 0x89,	%i6
	set	0x13, %o7
	stba	%l1,	[%l7 + %o7] 0x88
	nop
	set	0x28, %o0
	swap	[%l7 + %o0],	%o7
	set	0x24, %g7
	sta	%f5,	[%l7 + %g7] 0x89
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f10
	and	%g6,	%o4,	%l4
	ld	[%l7 + 0x64],	%f31
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f8
	set	0x70, %i1
	lda	[%l7 + %i1] 0x89,	%f25
	nop
	set	0x2A, %i6
	ldsh	[%l7 + %i6],	%i7
	st	%fsr,	[%l7 + 0x58]
	set	0x08, %g2
	ldstuba	[%l7 + %g2] 0x80,	%o2
	bge,pt	%xcc,	loop_5
	nop
	set	0x68, %l6
	std	%i2,	[%l7 + %l6]
	nop
	set	0x3C, %l2
	ldsh	[%l7 + %l2],	%g3
	nop
	set	0x6D, %o2
	stb	%o1,	[%l7 + %o2]
loop_5:
	nop
	set	0x10, %i3
	stwa	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x80,	 0
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f22
	set	0x60, %l3
	lda	[%l7 + %l3] 0x88,	%f30
	nop
	set	0x3E, %o6
	sth	%i1,	[%l7 + %o6]
	and	%i5,	%l3,	%o0
	set	0x08, %i5
	lda	[%l7 + %i5] 0x81,	%f21
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	wr	%o5,	%g5,	%ccr
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x6C, %g3
	swap	[%l7 + %g3],	%i0
	nop
	set	0x21, %i2
	ldsb	[%l7 + %i2],	%l5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f16
	fpadd32s	%f3,	%f7,	%f31
	set	0x10, %o4
	lda	[%l7 + %o4] 0x81,	%f15
	nop
	set	0x20, %o3
	ldsb	[%l7 + %o3],	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g1
	set	0x49, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g4
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%f22
	and	%l6,	%i4,	%g7
	nop
	set	0x47, %o1
	ldub	[%l7 + %o1],	%o3
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x50, %l0
	std	%i6,	[%l7 + %l0]
	set	0x68, %i0
	lda	[%l7 + %i0] 0x88,	%f20
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x89,	%l1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	nop
	set	0x40, %g7
	std	%f18,	[%l7 + %g7]
	nop
	set	0x5B, %o5
	ldub	[%l7 + %o5],	%o7
	nop
	set	0x23, %o0
	ldstub	[%l7 + %o0],	%g6
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
	set	0x18, %i6
	stxa	%l4,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%i7
	set	0x5C, %g2
	swapa	[%l7 + %g2] 0x81,	%g3
	set	0x63, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i3
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f16
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x30, %g5
	std	%o0,	[%l7 + %g5]
	ld	[%l7 + 0x50],	%f12
	bleu	%icc,	loop_6
	nop
	set	0x60, %i3
	stx	%l0,	[%l7 + %i3]
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f28
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x89,	 3
loop_6:
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	nop
	setx	0xA44A3A9950EAB16F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB8152E19EE0CE781,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f6
	set	0x5A, %l1
	stba	%i5,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0
	set	0x64, %g3
	stba	%o0,	[%l7 + %g3] 0x80
	set	0x51, %i2
	ldstuba	[%l7 + %i2] 0x89,	%l3
	and	%o5,	%g5,	%i0
	nop
	set	0x68, %l4
	sth	%l5,	[%l7 + %l4]
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f4
	nop
	set	0x65, %o3
	ldsb	[%l7 + %o3],	%o6
	add	%g1,	%i2,	%l6
	set	0x25, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o3
	st	%f29,	[%l7 + 0x30]
	nop
	set	0x0C, %i7
	lduw	[%l7 + %i7],	%g7
	nop
	set	0x68, %g4
	lduw	[%l7 + %g4],	%l1
	nop
	set	0x40, %l0
	std	%f0,	[%l7 + %l0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x58, %o1
	ldxa	[%l7 + %o1] 0x88,	%g6
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%l4
	nop
	set	0x7C, %g1
	ldsw	[%l7 + %g1],	%o4
	set	0x61, %g7
	stba	%l2,	[%l7 + %g7] 0xeb
	membar	#Sync
	nop
	set	0x2B, %o7
	ldsb	[%l7 + %o7],	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%i3
	set	0x50, %o0
	ldda	[%l7 + %o0] 0xea,	%g2
	nop
	set	0x4C, %i4
	prefetch	[%l7 + %i4],	 4
	nop
	set	0x4B, %o5
	ldub	[%l7 + %o5],	%l0
	nop
	set	0x61, %i6
	ldstub	[%l7 + %i6],	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%o1
	or	%o0,	%l3,	%o5
	nop
	set	0x18, %g2
	std	%g4,	[%l7 + %g2]
	nop
	set	0x20, %l2
	swap	[%l7 + %l2],	%g2
	set	0x18, %i1
	lda	[%l7 + %i1] 0x80,	%f21
	nop
	set	0x0C, %l6
	stb	%l5,	[%l7 + %l6]
	ld	[%l7 + 0x1C],	%f14
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%i0
	nop
	set	0x60, %g5
	std	%f28,	[%l7 + %g5]
	st	%f20,	[%l7 + 0x78]
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%g1
	nop
	set	0x58, %o6
	lduw	[%l7 + %o6],	%o6
	set	0x78, %l3
	stxa	%l6,	[%l7 + %l3] 0x88
	set	0x58, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g4
	nop
	set	0x68, %i3
	sth	%i4,	[%l7 + %i3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%i2
	nop
	set	0x7C, %i5
	ldsw	[%l7 + %i5],	%l1
	nop
	set	0x28, %i2
	ldstub	[%l7 + %i2],	%g7
	set	0x5D, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o7
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%g6
	nop
	set	0x43, %g3
	ldub	[%l7 + %g3],	%i6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xc8
	set	0x50, %i7
	stwa	%o4,	[%l7 + %i7] 0x88
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf0
	membar	#Sync
	nop
	set	0x54, %o3
	stw	%l4,	[%l7 + %o3]
	nop
	set	0x43, %l0
	ldub	[%l7 + %l0],	%l2
	nop
	set	0x72, %o1
	ldsh	[%l7 + %o1],	%i7
	nop
	set	0x58, %g1
	swap	[%l7 + %g1],	%i3
	or	%o2,	%l0,	%i1
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x80,	%g3
	nop
	set	0x44, %i0
	stb	%o1,	[%l7 + %i0]
	bleu,pn	%xcc,	loop_7
	nop
	set	0x38, %o0
	swap	[%l7 + %o0],	%i5
	or	%o0,	%o5,	%g5
	nop
	set	0x63, %i4
	ldsb	[%l7 + %i4],	%l3
loop_7:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i0
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%g2
	and	%o6,	%g1,	%l6
	set	0x14, %i6
	sta	%f1,	[%l7 + %i6] 0x89
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xea,	%g4
	st	%fsr,	[%l7 + 0x14]
	set	0x10, %l2
	stwa	%i4,	[%l7 + %l2] 0x80
	wr	%i2,	%o3,	%clear_softint
	ld	[%l7 + 0x2C],	%f31
	nop
	nop
	setx	0x7F75E585,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x4A63A480,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f19,	%f17
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%o7
	set	0x18, %i1
	stda	%g6,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x38, %g2
	stha	%g6,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x6F, %l6
	stba	%i6,	[%l7 + %l6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
	ld	[%l7 + 0x44],	%f1
	set	0x4C, %l5
	stba	%l4,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x56, %o6
	lduh	[%l7 + %o6],	%l2
	st	%f8,	[%l7 + 0x28]
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x88,	%i7
	bne,a,pn	%xcc,	loop_8
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%o4
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%o2
	set	0x5B, %i5
	stba	%l0,	[%l7 + %i5] 0xe3
	membar	#Sync
loop_8:
	and	%i3,	%g3,	%o1
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x81,	%i5
	nop
	set	0x10, %i2
	std	%f2,	[%l7 + %i2]
	nop
	set	0x58, %o4
	std	%i0,	[%l7 + %o4]
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f28
	or	%o0,	%o5,	%l3
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x89,	%l5
	nop
	set	0x50, %i7
	std	%f2,	[%l7 + %i7]
	set	0x66, %l4
	stha	%i0,	[%l7 + %l4] 0x89
	st	%f5,	[%l7 + 0x3C]
	nop
	set	0x4D, %g4
	ldsb	[%l7 + %g4],	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%o6
	nop
	set	0x10, %o3
	ldsh	[%l7 + %o3],	%g1
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf0
	membar	#Sync
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xea,	%i6
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x14, %l0
	lduw	[%l7 + %l0],	%i4
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf8
	membar	#Sync
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%i2
	and	%o3,	%g4,	%l1
	ld	[%l7 + 0x7C],	%f8
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x89,	%g7
	nop
	set	0x10, %o7
	std	%g6,	[%l7 + %o7]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0xea,	%i6
	ld	[%l7 + 0x1C],	%f13
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o7
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%o2
	set	0x78, %i1
	ldxa	[%l7 + %i1] 0x81,	%i3
	nop
	set	0x40, %o5
	lduw	[%l7 + %o5],	%l0
	add	%g3,	%i5,	%i1
	nop
	set	0x46, %l6
	ldsb	[%l7 + %l6],	%o1
	set	0x34, %g5
	stwa	%o5,	[%l7 + %g5] 0x89
	nop
	set	0x58, %g2
	ldub	[%l7 + %g2],	%l3
	add	%o0,	%i0,	%l5
	nop
	set	0x5C, %l5
	stw	%g5,	[%l7 + %l5]
	nop
	set	0x64, %o2
	swap	[%l7 + %o2],	%g2
	st	%f14,	[%l7 + 0x28]
	nop
	set	0x32, %o6
	ldstub	[%l7 + %o6],	%g1
	set	0x18, %i3
	sta	%f27,	[%l7 + %i3] 0x89
	set	0x6D, %i5
	stba	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x2C, %l3
	swap	[%l7 + %l3],	%l6
	wr	%i4,	%o3,	%ccr
	nop
	set	0x7C, %l1
	ldstub	[%l7 + %l1],	%g4
	nop
	set	0x40, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x5D, %g3
	ldsb	[%l7 + %g3],	%l1
	nop
	set	0x27, %o4
	stb	%g7,	[%l7 + %o4]
	or	%g6,	%i2,	%i6
	set	0x08, %i7
	stxa	%l4,	[%l7 + %i7] 0x80
	nop
	set	0x64, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x10, %g4
	stda	%o6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xda,	%f0
	set	0x70, %l4
	stba	%i7,	[%l7 + %l4] 0x89
	and	%l2,	%o2,	%o4
	nop
	set	0x1D, %g1
	stb	%l0,	[%l7 + %g1]
	set	0x71, %g7
	stba	%i3,	[%l7 + %g7] 0x80
	and	%i5,	%i1,	%o1
	st	%fsr,	[%l7 + 0x78]
	set	0x18, %l0
	swapa	[%l7 + %l0] 0x88,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%o0
	set	0x44, %o1
	sta	%f27,	[%l7 + %o1] 0x81
	set	0x60, %i4
	lda	[%l7 + %i4] 0x89,	%f11
	add	%l3,	%l5,	%i0
	fpadd16	%f4,	%f22,	%f4
	set	0x78, %i0
	stba	%g5,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x08, %o0
	std	%f20,	[%l7 + %o0]
	nop
	set	0x52, %i6
	ldsb	[%l7 + %i6],	%g1
	nop
	set	0x59, %o7
	ldstub	[%l7 + %o7],	%o6
	set	0x38, %l2
	ldxa	[%l7 + %l2] 0x81,	%g2
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%i6
	nop
	set	0x14, %l6
	ldsh	[%l7 + %l6],	%i4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%g4
	nop
	set	0x78, %o5
	std	%g6,	[%l7 + %o5]
	nop
	set	0x75, %g5
	ldstub	[%l7 + %g5],	%g6
	set	0x32, %g2
	stba	%l1,	[%l7 + %g2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x54],	%f31
	set	0x6B, %o2
	stba	%i6,	[%l7 + %o2] 0x88
	bl,pt	%icc,	loop_9
	nop
	set	0x40, %l5
	ldsh	[%l7 + %l5],	%l4
	set	0x08, %o6
	swapa	[%l7 + %o6] 0x89,	%o7
loop_9:
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f8
	set	0x60, %l3
	stwa	%i2,	[%l7 + %l3] 0x88
	set	0x5E, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l2
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%o2
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f0
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	and	%o4,	%i7,	%i3
	set	0x14, %i7
	swapa	[%l7 + %i7] 0x88,	%i5
	set	0x38, %o4
	swapa	[%l7 + %o4] 0x80,	%i1
	fpsub32	%f0,	%f12,	%f14
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x89,	%f1
	nop
	set	0x78, %g4
	lduw	[%l7 + %g4],	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%o5
	nop
	set	0x60, %g1
	lduh	[%l7 + %g1],	%o0
	ld	[%l7 + 0x54],	%f8
	nop
	set	0x20, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%l2
	add	%l5,	%g5,	%i0
	add	%o6,	%g2,	%g1
	add	%i4,	%o3,	%g4
	nop
	set	0x24, %o1
	lduw	[%l7 + %o1],	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%l1
	set	0x58, %g7
	lda	[%l7 + %g7] 0x80,	%f2
	nop
	set	0x50, %i0
	stb	%i6,	[%l7 + %i0]
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xea,	%l4
	add	%g6,	%o7,	%i2
	or	%o2,	%o4,	%l2
	bg,a	%xcc,	loop_10
	add	%i7,	%i5,	%i3
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f6
	nop
	set	0x58, %o7
	stw	%i1,	[%l7 + %o7]
loop_10:
	nop
	set	0x4C, %l2
	lda	[%l7 + %l2] 0x81,	%f8
	set	0x3C, %i1
	swapa	[%l7 + %i1] 0x81,	%o1
	nop
	set	0x64, %l6
	swap	[%l7 + %l6],	%l0
	set	0x58, %i4
	stxa	%o5,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xcc
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf0,	%f0
	nop
	set	0x7D, %l5
	stb	%g3,	[%l7 + %l5]
	nop
	set	0x25, %o5
	ldstub	[%l7 + %o5],	%l3
	set	0x18, %o6
	prefetcha	[%l7 + %o6] 0x88,	 2
	fpadd16s	%f3,	%f1,	%f24
	wr	%g5,	%i0,	%clear_softint
	nop
	set	0x4D, %i5
	ldub	[%l7 + %i5],	%o6
	set	0x74, %l1
	lda	[%l7 + %l1] 0x88,	%f4
	wr	%o0,	%g1,	%clear_softint
	add	%i4,	%o3,	%g2
	set	0x20, %l3
	stda	%g4,	[%l7 + %l3] 0xeb
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%l1
	set	0x24, %i2
	stwa	%g7,	[%l7 + %i2] 0x80
	and	%i6,	%l4,	%o7
	nop
	set	0x6C, %g3
	sth	%g6,	[%l7 + %g3]
	nop
	set	0x7E, %i3
	lduh	[%l7 + %i3],	%i2
	set	0x62, %i7
	stha	%o2,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x48, %o4
	lda	[%l7 + %o4] 0x89,	%f20
	set	0x1A, %g6
	stba	%o4,	[%l7 + %g6] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%l2
	set	0x17, %g1
	stba	%i5,	[%l7 + %g1] 0x81
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x88,	%i3
	set	0x10, %l4
	stda	%i6,	[%l7 + %l4] 0x80
	set	0x34, %o1
	lda	[%l7 + %o1] 0x81,	%f0
	nop
	set	0x58, %l0
	std	%f2,	[%l7 + %l0]
	nop
	set	0x18, %i0
	stx	%o1,	[%l7 + %i0]
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x80,	%i1
	nop
	set	0x74, %i6
	ldsw	[%l7 + %i6],	%l0
	nop
	set	0x6B, %o0
	ldsb	[%l7 + %o0],	%g3
	nop
	set	0x0C, %l2
	prefetch	[%l7 + %l2],	 1
	fpsub32	%f10,	%f26,	%f28
	ld	[%l7 + 0x50],	%f26
	nop
	set	0x28, %o7
	std	%l2,	[%l7 + %o7]
	nop
	set	0x3C, %l6
	stb	%o5,	[%l7 + %l6]
	nop
	set	0x0A, %i1
	sth	%l5,	[%l7 + %i1]
	nop
	set	0x33, %i4
	ldub	[%l7 + %i4],	%i0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc0
	st	%fsr,	[%l7 + 0x44]
	ld	[%l7 + 0x0C],	%f28
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	nop
	set	0x18, %l5
	std	%f12,	[%l7 + %l5]
	set	0x5C, %o5
	lda	[%l7 + %o5] 0x89,	%f10
	nop
	set	0x78, %o6
	stw	%o0,	[%l7 + %o6]
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x88,	%g1
	nop
	set	0x48, %l1
	ldsw	[%l7 + %l1],	%g5
	bg,a	%xcc,	loop_11
	nop
	set	0x2D, %i5
	ldsb	[%l7 + %i5],	%i4
	nop
	set	0x70, %l3
	ldsw	[%l7 + %l3],	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%o3
loop_11:
	nop
	set	0x78, %i2
	ldx	[%l7 + %i2],	%l6
	set	0x08, %i3
	stba	%l1,	[%l7 + %i3] 0xe3
	membar	#Sync
	bge	%xcc,	loop_12
	and	%g7,	%i6,	%o7
	nop
	set	0x62, %i7
	ldstub	[%l7 + %i7],	%g6
	set	0x10, %o4
	stxa	%l4,	[%l7 + %o4] 0x81
loop_12:
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%o2
	and	%i2,	%o4,	%l2
	nop
	set	0x70, %g4
	ldub	[%l7 + %g4],	%i3
	nop
	set	0x60, %g1
	std	%i4,	[%l7 + %g1]
	st	%f5,	[%l7 + 0x78]
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xeb,	%i6
	and	%o1,	%i1,	%g3
	ld	[%l7 + 0x24],	%f7
	nop
	set	0x7A, %g6
	ldstub	[%l7 + %g6],	%l3
	set	0x48, %l4
	stwa	%l0,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x44, %o1
	stwa	%l5,	[%l7 + %o1] 0x80
	or	%o5,	%o6,	%i0
	nop
	set	0x54, %l0
	lduw	[%l7 + %l0],	%g1
	nop
	set	0x28, %i0
	prefetch	[%l7 + %i0],	 1
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x47, %i6
	stb	%o0,	[%l7 + %i6]
	set	0x0F, %g7
	stba	%i4,	[%l7 + %g7] 0xeb
	membar	#Sync
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x81,	%g2
	set	0x1C, %o7
	lda	[%l7 + %o7] 0x88,	%f13
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%g4
	ld	[%l7 + 0x74],	%f26
	set	0x64, %i1
	swapa	[%l7 + %i1] 0x81,	%g5
	nop
	set	0x50, %l6
	sth	%o3,	[%l7 + %l6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l1
	ld	[%l7 + 0x4C],	%f23
	st	%f10,	[%l7 + 0x4C]
	or	%i6,	%o7,	%g6
	nop
	set	0x4C, %i4
	sth	%g7,	[%l7 + %i4]
	nop
	set	0x28, %g5
	stx	%l4,	[%l7 + %g5]
	wr	%o2,	%i2,	%set_softint
	nop
	set	0x5C, %l5
	ldsb	[%l7 + %l5],	%l2
	nop
	set	0x20, %o5
	std	%o4,	[%l7 + %o5]
	set	0x4E, %o6
	stba	%i5,	[%l7 + %o6] 0x89
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x81,	%o1
	nop
	set	0x74, %l1
	stw	%i7,	[%l7 + %l1]
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x80,	%i1
	nop
	set	0x13, %i2
	stb	%l3,	[%l7 + %i2]
	and	%g3,	%l5,	%l0
	set	0x20, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0
	nop
	set	0x68, %i3
	stx	%i0,	[%l7 + %i3]
	add	%g1,	%o6,	%i4
	or	%o0,	%g4,	%g5
	nop
	set	0x4C, %i7
	ldsw	[%l7 + %i7],	%g2
	nop
	set	0x78, %o4
	sth	%l6,	[%l7 + %o4]
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x88,	 3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%o7
	set	0x48, %g3
	stwa	%i6,	[%l7 + %g3] 0xeb
	membar	#Sync
	st	%f15,	[%l7 + 0x44]
	set	0x34, %o3
	swapa	[%l7 + %o3] 0x88,	%g6
	bl	%xcc,	loop_13
	nop
	set	0x58, %g6
	std	%l4,	[%l7 + %g6]
	ld	[%l7 + 0x6C],	%f5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf9
	membar	#Sync
loop_13:
	nop
	set	0x14, %o1
	ldsh	[%l7 + %o1],	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%l2
	set	0x10, %l4
	stxa	%o2,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f0
	nop
	set	0x78, %i6
	stb	%o4,	[%l7 + %i6]
	set	0x2A, %g7
	stha	%i5,	[%l7 + %g7] 0x80
	nop
	set	0x22, %i0
	ldsh	[%l7 + %i0],	%o1
	nop
	set	0x38, %o0
	ldsw	[%l7 + %o0],	%i7
	set	0x70, %l2
	stda	%i2,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x78, %i1
	stda	%i0,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x1A, %o7
	lduh	[%l7 + %o7],	%g3
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x4E, %i4
	stb	%l3,	[%l7 + %i4]
	nop
	set	0x3E, %l6
	ldsh	[%l7 + %l6],	%l0
	nop
	set	0x48, %g5
	stw	%o5,	[%l7 + %g5]
	nop
	set	0x6E, %l5
	lduh	[%l7 + %l5],	%l5
	and	%g1,	%o6,	%i0
	nop
	set	0x30, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x7F, %o2
	ldsb	[%l7 + %o2],	%i4
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f22
	nop
	set	0x78, %l1
	swap	[%l7 + %l1],	%o0
	set	0x60, %l3
	ldxa	[%l7 + %l3] 0x81,	%g5
	nop
	set	0x08, %o6
	std	%g4,	[%l7 + %o6]
	nop
	set	0x28, %i5
	stw	%l6,	[%l7 + %i5]
	set	0x68, %i3
	stda	%g2,	[%l7 + %i3] 0x80
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x80,	%o3
	nop
	set	0x74, %i7
	lduw	[%l7 + %i7],	%o7
	nop
	set	0x20, %g4
	ldub	[%l7 + %g4],	%i6
	add	%l1,	%l4,	%g7
	nop
	set	0x18, %o4
	std	%i2,	[%l7 + %o4]
	nop
	set	0x7E, %g3
	lduh	[%l7 + %g3],	%l2
	nop
	set	0x26, %g6
	lduh	[%l7 + %g6],	%o2
	nop
	set	0x70, %g1
	lduh	[%l7 + %g1],	%o4
	set	0x50, %o1
	lda	[%l7 + %o1] 0x80,	%f6
	set	0x78, %o3
	stwa	%g6,	[%l7 + %o3] 0x89
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%o1
	nop
	set	0x58, %l0
	swap	[%l7 + %l0],	%i3
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x80,	%i1
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x89,	%g3
	ld	[%l7 + 0x64],	%f15
	add	%i7,	%l3,	%l0
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 2
	set	0x78, %i0
	sta	%f19,	[%l7 + %i0] 0x80
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%o4
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x80,	%l4
	nop
	set	0x3C, %o7
	lduh	[%l7 + %o7],	%o6
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x10, %i4
	stx	%i0,	[%l7 + %i4]
	set	0x78, %g5
	stda	%i4,	[%l7 + %g5] 0x80
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f0
	nop
	set	0x1C, %o5
	swap	[%l7 + %o5],	%g1
	fpadd16	%f26,	%f2,	%f28
	nop
	set	0x36, %o2
	lduh	[%l7 + %o2],	%g5
	nop
	set	0x7C, %l6
	sth	%g4,	[%l7 + %l6]
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%l6
	nop
	set	0x32, %l3
	ldsb	[%l7 + %l3],	%o0
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x80,	%o3
	nop
	set	0x34, %l1
	ldsw	[%l7 + %l1],	%o7
	set	0x2C, %i5
	stwa	%g2,	[%l7 + %i5] 0x88
	nop
	set	0x45, %i2
	ldstub	[%l7 + %i2],	%l1
	set	0x09, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l4
	nop
	set	0x58, %g4
	ldub	[%l7 + %g4],	%g7
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	nop
	set	0x76, %g3
	ldstub	[%l7 + %g3],	%i6
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f30
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%l2
	nop
	set	0x5C, %o1
	sth	%o2,	[%l7 + %o1]
	or	%o4,	%g6,	%i2
	nop
	set	0x4B, %g1
	ldsb	[%l7 + %g1],	%o1
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x10, %o3
	sth	%i3,	[%l7 + %o3]
	set	0x58, %l4
	stxa	%i5,	[%l7 + %l4] 0x88
	nop
	set	0x29, %l0
	stb	%i1,	[%l7 + %l0]
	set	0x18, %g7
	swapa	[%l7 + %g7] 0x89,	%g3
	nop
	set	0x44, %i0
	swap	[%l7 + %i0],	%l3
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f8
	nop
	set	0x21, %i6
	ldub	[%l7 + %i6],	%i7
	nop
	set	0x68, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x24, %i1
	stw	%l0,	[%l7 + %i1]
	nop
	set	0x24, %i4
	stw	%l5,	[%l7 + %i4]
	nop
	set	0x7A, %g5
	stb	%o5,	[%l7 + %g5]
	set	0x08, %o0
	stda	%o6,	[%l7 + %o0] 0xe2
	membar	#Sync
	add	%i0,	%g1,	%i4
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x80,	%g4
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x88,	 3
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x80,	%o0
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	and	%o7,	%g2,	%g5
	nop
	set	0x14, %o6
	lduh	[%l7 + %o6],	%l1
	set	0x4C, %l6
	stwa	%g7,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x52, %l1
	sth	%i6,	[%l7 + %l1]
	nop
	set	0x23, %i2
	ldsb	[%l7 + %i2],	%l2
	nop
	set	0x4F, %i5
	ldub	[%l7 + %i5],	%o2
	set	0x48, %i7
	stda	%l4,	[%l7 + %i7] 0x88
	nop
	set	0x68, %i3
	lduw	[%l7 + %i3],	%o4
	set	0x44, %g4
	swapa	[%l7 + %g4] 0x80,	%g6
	set	0x48, %o4
	sta	%f10,	[%l7 + %o4] 0x80
	set	0x60, %g3
	stwa	%o1,	[%l7 + %g3] 0x88
	set	0x69, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i3
	nop
	set	0x30, %o1
	stx	%i5,	[%l7 + %o1]
	st	%f11,	[%l7 + 0x6C]
	nop
	set	0x58, %o3
	std	%i2,	[%l7 + %o3]
	or	%g3,	%i1,	%i7
	set	0x16, %g1
	stha	%l0,	[%l7 + %g1] 0x88
	set	0x74, %l4
	swapa	[%l7 + %l4] 0x89,	%l5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%o6
	nop
	set	0x24, %l0
	swap	[%l7 + %l0],	%o5
	set	0x44, %i0
	swapa	[%l7 + %i0] 0x89,	%g1
	ld	[%l7 + 0x34],	%f20
	set	0x10, %g7
	stxa	%i4,	[%l7 + %g7] 0x80
	nop
	set	0x40, %i6
	std	%i0,	[%l7 + %i6]
	nop
	set	0x18, %l2
	ldub	[%l7 + %l2],	%l6
	nop
	set	0x40, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x70, %i4
	std	%g4,	[%l7 + %i4]
	nop
	set	0x4C, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x81,	%o6
	fpadd32	%f18,	%f6,	%f28
	set	0x50, %i1
	ldda	[%l7 + %i1] 0xe3,	%g2
	nop
	set	0x60, %l5
	ldsw	[%l7 + %l5],	%o3
	set	0x18, %o5
	stxa	%g5,	[%l7 + %o5] 0x89
	nop
	set	0x24, %g2
	ldsb	[%l7 + %g2],	%g7
	bleu	%icc,	loop_14
	or	%i6,	%l2,	%l1
	or	%o2,	%l4,	%o4
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x89,	%o1
loop_14:
	nop
	set	0x0D, %o2
	stba	%g6,	[%l7 + %o2] 0x89
	set	0x1C, %l6
	stha	%i3,	[%l7 + %l6] 0xeb
	membar	#Sync
	fpadd32s	%f29,	%f24,	%f22
	add	%i5,	%g3,	%i2
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x80,	%i7
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x89,	%i1
	st	%fsr,	[%l7 + 0x20]
	add	%l0,	%l3,	%o6
	fpsub16	%f8,	%f24,	%f8
	set	0x38, %l1
	stba	%l5,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%g1
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x24, %i3
	ldsw	[%l7 + %i3],	%i4
	nop
	set	0x2C, %i5
	sth	%i0,	[%l7 + %i5]
	fpsub32	%f4,	%f20,	%f2
	set	0x78, %o4
	sta	%f20,	[%l7 + %o4] 0x88
	nop
	set	0x08, %g3
	stw	%l6,	[%l7 + %g3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%o7
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x81,	%o0
	st	%f5,	[%l7 + 0x1C]
	set	0x30, %o1
	ldxa	[%l7 + %o1] 0x80,	%g2
	nop
	set	0x2E, %g4
	lduh	[%l7 + %g4],	%g5
	nop
	set	0x7C, %o3
	stw	%g7,	[%l7 + %o3]
	set	0x50, %l4
	stba	%i6,	[%l7 + %l4] 0x80
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%o3
	and	%l2,	%l1,	%l4
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x88,	%o2
	set	0x6D, %i0
	stba	%o4,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x41, %g7
	stba	%g6,	[%l7 + %g7] 0x89
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%o1
	nop
	set	0x5A, %l2
	ldstub	[%l7 + %l2],	%i5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x89,	%g3
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	set	0x10, %o0
	ldxa	[%l7 + %o0] 0x89,	%i2
	nop
	set	0x45, %i6
	ldub	[%l7 + %i6],	%l0
	nop
	set	0x08, %i1
	ldsb	[%l7 + %i1],	%l3
	or	%o6,	%i1,	%l5
	nop
	set	0x24, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x19, %g2
	stb	%g1,	[%l7 + %g2]
	nop
	set	0x12, %l5
	ldsh	[%l7 + %l5],	%i4
	and	%i0,	%o5,	%l6
	nop
	set	0x48, %o2
	ldx	[%l7 + %o2],	%g4
	fpadd32	%f12,	%f20,	%f14
	nop
	set	0x34, %l6
	swap	[%l7 + %l6],	%o7
	wr	%o0,	%g2,	%pic
	nop
	set	0x14, %o6
	lduh	[%l7 + %o6],	%g7
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%g5
	nop
	set	0x7C, %l3
	lduw	[%l7 + %l3],	%o3
	set	0x44, %l1
	sta	%f19,	[%l7 + %l1] 0x80
	or	%i6,	%l1,	%l2
	or	%o2,	%l4,	%o4
	nop
	set	0x40, %i3
	swap	[%l7 + %i3],	%g6
	nop
	set	0x50, %i7
	std	%f24,	[%l7 + %i7]
	nop
	set	0x70, %i5
	stx	%i3,	[%l7 + %i5]
	nop
	set	0x50, %o4
	stx	%o1,	[%l7 + %o4]
	set	0x5C, %g6
	stwa	%g3,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x46, %g3
	stba	%i5,	[%l7 + %g3] 0xe3
	membar	#Sync
	or	%i2,	%i7,	%l3
	ble,a	%icc,	loop_15
	nop
	set	0x6C, %o1
	ldsb	[%l7 + %o1],	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i1
loop_15:
	and	%g1,	%l5,	%i4
	ld	[%l7 + 0x20],	%f0
	or	%i0,	%o5,	%l6
	nop
	set	0x1C, %g4
	swap	[%l7 + %g4],	%g4
	add	%o7,	%g2,	%o0
	nop
	set	0x55, %o3
	ldub	[%l7 + %o3],	%g7
	st	%f23,	[%l7 + 0x74]
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%f28
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f6
	nop
	set	0x18, %l0
	sth	%o3,	[%l7 + %l0]
	nop
	set	0x58, %i0
	stx	%i6,	[%l7 + %i0]
	set	0x50, %g7
	stda	%g4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x1C, %o7
	stw	%l2,	[%l7 + %o7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xea,	%l4
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x89
	set	0x57, %g5
	stba	%g6,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x88,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%i5
	set	0x65, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g3
	nop
	set	0x50, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x64, %l5
	lduh	[%l7 + %l5],	%l3
	nop
	set	0x72, %o2
	lduh	[%l7 + %o2],	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%l0
	nop
	set	0x61, %l6
	stb	%i1,	[%l7 + %l6]
	nop
	set	0x7C, %o5
	ldub	[%l7 + %o5],	%g1
	nop
	set	0x4A, %o6
	lduh	[%l7 + %o6],	%i4
	nop
	set	0x4C, %l3
	ldsh	[%l7 + %l3],	%i0
	nop
	set	0x10, %l1
	lduw	[%l7 + %l1],	%l5
	set	0x20, %i2
	stxa	%o5,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x73, %i7
	ldstub	[%l7 + %i7],	%g4
	set	0x17, %i3
	ldstuba	[%l7 + %i3] 0x81,	%o7
	and	%l6,	%o0,	%g2
	or	%o3,	%g7,	%g5
	set	0x70, %o4
	swapa	[%l7 + %o4] 0x80,	%l2
	nop
	set	0x1C, %i5
	ldstub	[%l7 + %i5],	%i6
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf8,	%f0
	nop
	set	0x5C, %g6
	lduw	[%l7 + %g6],	%o2
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f4
	nop
	set	0x42, %o1
	ldstub	[%l7 + %o1],	%l1
	fpsub32s	%f29,	%f3,	%f25
	st	%fsr,	[%l7 + 0x0C]
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	nop
	set	0x2C, %l4
	lduw	[%l7 + %l4],	%g6
	set	0x40, %o3
	stba	%i3,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x38, %l0
	stda	%o0,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x78, %g7
	ldsb	[%l7 + %g7],	%i5
	or	%g3,	%i7,	%o4
	and	%i2,	%l3,	%o6
	nop
	set	0x2A, %o7
	lduh	[%l7 + %o7],	%l0
	nop
	set	0x61, %l2
	ldsb	[%l7 + %l2],	%g1
	add	%i1,	%i4,	%i0
	and	%o5,	%g4,	%l5
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%l6
	nop
	set	0x20, %i4
	swap	[%l7 + %i4],	%o0
	or	%g2,	%o7,	%g7
	set	0x48, %o0
	lda	[%l7 + %o0] 0x81,	%f0
	bne,pt	%icc,	loop_16
	nop
	set	0x66, %i6
	lduh	[%l7 + %i6],	%o3
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	fpadd32	%f10,	%f6,	%f12
loop_16:
	nop
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x80,	%g5
	nop
	set	0x70, %g5
	std	%i6,	[%l7 + %g5]
	add	%o2,	%l1,	%l2
	ld	[%l7 + 0x3C],	%f11
	nop
	set	0x44, %o2
	ldsb	[%l7 + %o2],	%l4
	set	0x28, %l5
	stxa	%g6,	[%l7 + %l5] 0x88
	nop
	set	0x4C, %o5
	lduh	[%l7 + %o5],	%i3
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f14
	wr 	%g0, 	0x7, 	%fprs
	or	%g3,	%i7,	%o4
	nop
	set	0x4E, %l3
	lduh	[%l7 + %l3],	%l3
	nop
	set	0x08, %l1
	swap	[%l7 + %l1],	%i2
	nop
	set	0x08, %l6
	std	%f22,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x3C]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f0
	and	%o6,	%l0,	%i1
	nop
	set	0x08, %i2
	stw	%g1,	[%l7 + %i2]
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f8
	nop
	set	0x48, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%f2
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x80,	 3
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%o4
	set	0x33, %g4
	stba	%g4,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x6D, %o1
	ldub	[%l7 + %o1],	%i0
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x89
	fpsub16s	%f19,	%f28,	%f13
	st	%f5,	[%l7 + 0x08]
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%l5
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%o0
	ble,a	%xcc,	loop_17
	or	%l6,	%o7,	%g2
	nop
	set	0x14, %g7
	stw	%o3,	[%l7 + %g7]
	set	0x56, %o3
	stha	%g5,	[%l7 + %o3] 0x81
loop_17:
	bg,a	%icc,	loop_18
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%g6
	or	%o2,	%i6,	%l1
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x80
loop_18:
	ld	[%l7 + 0x74],	%f9
	set	0x70, %i0
	stxa	%l4,	[%l7 + %i0] 0x89
	nop
	set	0x44, %o0
	swap	[%l7 + %o0],	%g6
	nop
	set	0x4A, %i4
	stb	%l2,	[%l7 + %i4]
	nop
	set	0x10, %i1
	stx	%i3,	[%l7 + %i1]
	set	0x34, %g2
	sta	%f13,	[%l7 + %g2] 0x81
	or	%i5,	%o1,	%g3
	nop
	set	0x14, %g5
	sth	%o4,	[%l7 + %g5]
	nop
	set	0x10, %i6
	ldsw	[%l7 + %i6],	%l3
	nop
	set	0x6F, %l5
	stb	%i2,	[%l7 + %l5]
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%o6
	nop
	set	0x67, %o6
	ldub	[%l7 + %o6],	%i7
	set	0x68, %o2
	sta	%f5,	[%l7 + %o2] 0x89
	fpsub16	%f16,	%f18,	%f6
	and	%i1,	%l0,	%i4
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%o4
	nop
	set	0x10, %l6
	stw	%g1,	[%l7 + %l6]
	nop
	set	0x5E, %i7
	sth	%g4,	[%l7 + %i7]
	nop
	set	0x11, %l3
	ldstub	[%l7 + %l3],	%l5
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x88,	%i0
	set	0x30, %i2
	stba	%o0,	[%l7 + %i2] 0x80
	set	0x2A, %g3
	stba	%o7,	[%l7 + %g3] 0xeb
	membar	#Sync
	bgu	%icc,	loop_19
	nop
	set	0x28, %g6
	stx	%g2,	[%l7 + %g6]
	ld	[%l7 + 0x58],	%f19
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f26
loop_19:
	nop
	set	0x44, %g4
	lda	[%l7 + %g4] 0x81,	%f22
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%i6
	nop
	set	0x38, %l4
	std	%f24,	[%l7 + %l4]
	nop
	set	0x17, %i3
	stb	%g5,	[%l7 + %i3]
	bleu	%xcc,	loop_20
	nop
	set	0x0A, %l0
	stb	%g7,	[%l7 + %l0]
	set	0x48, %g7
	swapa	[%l7 + %g7] 0x80,	%o2
loop_20:
	nop
	set	0x60, %o3
	lda	[%l7 + %o3] 0x88,	%f6
	set	0x44, %g1
	stwa	%o3,	[%l7 + %g1] 0xeb
	membar	#Sync
	and	%i6,	%l4,	%g6
	set	0x6A, %l2
	stba	%l1,	[%l7 + %l2] 0x88
	ba,a,pt	%icc,	loop_21
	nop
	set	0x18, %i0
	stx	%i3,	[%l7 + %i0]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o1
loop_21:
	nop
	set	0x18, %o7
	stx	%g3,	[%l7 + %o7]
	nop
	set	0x10, %o0
	stx	%l2,	[%l7 + %o0]
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x81,	%o4
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%l3
	nop
	set	0x5C, %g5
	sth	%o6,	[%l7 + %g5]
	set	0x30, %i4
	prefetcha	[%l7 + %i4] 0x89,	 1
	set	0x18, %i6
	stxa	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x3A, %l5
	ldstub	[%l7 + %l5],	%i1
	st	%f27,	[%l7 + 0x5C]
	set	0x2F, %o5
	stba	%l0,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd8
	add	%o5,	%g1,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i0
	set	0x29, %l1
	stba	%o0,	[%l7 + %l1] 0x88
	add	%o7,	%l5,	%g2
	set	0x71, %o2
	stba	%g5,	[%l7 + %o2] 0x89
	or	%g7,	%o2,	%l6
	nop
	set	0x70, %i7
	stb	%i6,	[%l7 + %i7]
	nop
	set	0x28, %l3
	lduw	[%l7 + %l3],	%o3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l4
	fpsub16s	%f5,	%f19,	%f29
	set	0x7C, %o4
	stwa	%l1,	[%l7 + %o4] 0x81
	nop
	set	0x5C, %i2
	prefetch	[%l7 + %i2],	 4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%i3
	set	0x30, %g3
	stda	%g2,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x50, %l6
	stxa	%l2,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x81,	%f30
	ld	[%l7 + 0x30],	%f0
	nop
	set	0x70, %g6
	std	%f26,	[%l7 + %g6]
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f4
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%o4
	set	0x25, %i3
	stba	%o1,	[%l7 + %i3] 0x89
	set	0x14, %l4
	lda	[%l7 + %l4] 0x88,	%f7
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%l3
	nop
	set	0x70, %g7
	sth	%o6,	[%l7 + %g7]
	nop
	set	0x52, %o3
	ldstub	[%l7 + %o3],	%i2
	ld	[%l7 + 0x64],	%f8
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x44, %g1
	prefetch	[%l7 + %g1],	 4
	set	0x38, %o7
	stxa	%i1,	[%l7 + %o7] 0x81
	or	%l0,	%i7,	%g1
	set	0x3C, %o0
	stwa	%o5,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x7B, %i1
	stb	%i4,	[%l7 + %i1]
	set	0x4C, %g2
	stwa	%g4,	[%l7 + %g2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x68],	%f7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xe2,	%o0
	fpadd32	%f20,	%f8,	%f16
	nop
	set	0x18, %i4
	stx	%o7,	[%l7 + %i4]
	set	0x3C, %i6
	sta	%f22,	[%l7 + %i6] 0x81
	set	0x74, %g5
	stwa	%l5,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%i0
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%g7
	nop
	set	0x08, %o6
	ldsw	[%l7 + %o6],	%g5
	set	0x46, %o5
	stba	%l6,	[%l7 + %o5] 0x80
	nop
	set	0x29, %o2
	ldstub	[%l7 + %o2],	%o2
	set	0x68, %l1
	swapa	[%l7 + %l1] 0x89,	%i6
	nop
	set	0x70, %i7
	ldx	[%l7 + %i7],	%o3
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%g6
	nop
	set	0x43, %l3
	ldub	[%l7 + %l3],	%l4
	set	0x30, %i2
	stxa	%i5,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%i3
	set	0x50, %l6
	sta	%f20,	[%l7 + %l6] 0x81
	nop
	set	0x60, %g6
	stb	%l1,	[%l7 + %g6]
	nop
	set	0x70, %g4
	sth	%l2,	[%l7 + %g4]
	add	%g3,	%o1,	%l3
	nop
	set	0x5B, %o1
	ldub	[%l7 + %o1],	%o6
	or	%o4,	%i2,	%i1
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%i7
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%o5
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x5C, %l0
	ldsw	[%l7 + %l0],	%g1
	nop
	set	0x38, %g7
	std	%f20,	[%l7 + %g7]
	set	0x60, %o3
	lda	[%l7 + %o3] 0x80,	%f0
	set	0x60, %l2
	stda	%i4,	[%l7 + %l2] 0xea
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%o7
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x80,	%l5
	nop
	set	0x64, %o7
	stw	%o0,	[%l7 + %o7]
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x80,	%i0
	nop
	set	0x38, %g1
	lduh	[%l7 + %g1],	%g7
	nop
	set	0x52, %g2
	sth	%g5,	[%l7 + %g2]
	nop
	set	0x3D, %i0
	ldub	[%l7 + %i0],	%l6
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f30
	nop
	set	0x11, %i6
	stb	%o2,	[%l7 + %i6]
	nop
	set	0x68, %i1
	stx	%g2,	[%l7 + %i1]
	set	0x24, %l5
	sta	%f25,	[%l7 + %l5] 0x88
	set	0x5E, %g5
	stha	%o3,	[%l7 + %g5] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf1,	%f16
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%i6
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%l4
	set	0x10, %i7
	stda	%i4,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x72, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i3
	nop
	set	0x73, %l3
	ldub	[%l7 + %l3],	%l1
	set	0x78, %i2
	stxa	%l2,	[%l7 + %i2] 0x88
	set	0x42, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g6
	set	0x40, %l1
	stxa	%g3,	[%l7 + %l1] 0x88
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x89,	%o1
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%o6
	or	%l3,	%o4,	%i2
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%i7
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf1
	membar	#Sync
	nop
	set	0x18, %l4
	ldx	[%l7 + %l4],	%i1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o5
	nop
	set	0x0C, %l0
	stw	%g1,	[%l7 + %l0]
	set	0x14, %i5
	swapa	[%l7 + %i5] 0x80,	%g4
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%o6
	nop
	set	0x54, %o3
	ldub	[%l7 + %o3],	%i4
	nop
	set	0x40, %l2
	std	%o0,	[%l7 + %l2]
	and	%i0,	%g7,	%g5
	set	0x7C, %o7
	stwa	%l6,	[%l7 + %o7] 0x88
	nop
	set	0x08, %o0
	std	%o2,	[%l7 + %o0]
	nop
	set	0x40, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%g2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	nop
	set	0x3E, %i4
	ldstub	[%l7 + %i4],	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x22, %i0
	lduh	[%l7 + %i0],	%i5
	nop
	set	0x5E, %i6
	stb	%l4,	[%l7 + %i6]
	ld	[%l7 + 0x54],	%f9
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x80,	%f22
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%i3
	st	%f13,	[%l7 + 0x5C]
	set	0x50, %g5
	swapa	[%l7 + %g5] 0x81,	%l1
	add	%l2,	%g3,	%o1
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x88,	 4
	fpadd16s	%f28,	%f29,	%f15
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x88,	%o6
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l3
	set	0x35, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i2
	nop
	set	0x0C, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x5C, %l3
	lduh	[%l7 + %l3],	%i7
	nop
	set	0x78, %g3
	std	%o4,	[%l7 + %g3]
	set	0x10, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i1
	set	0x0A, %g6
	stba	%l0,	[%l7 + %g6] 0x80
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f10
	wr	%g1,	%o5,	%ccr
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%o7
	nop
	set	0x68, %l6
	stx	%i4,	[%l7 + %l6]
	add	%o0,	%i0,	%g7
	set	0x78, %o1
	lda	[%l7 + %o1] 0x80,	%f30
	nop
	set	0x40, %l4
	lduw	[%l7 + %l4],	%g4
	or	%l6,	%g5,	%o2
	nop
	set	0x1C, %l0
	swap	[%l7 + %l0],	%g2
	st	%f9,	[%l7 + 0x60]
	set	0x50, %i5
	stba	%i6,	[%l7 + %i5] 0xe3
	membar	#Sync
	and	%l5,	%i5,	%l4
	fpadd16s	%f30,	%f4,	%f20
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f16
	nop
	set	0x48, %l2
	lduw	[%l7 + %l2],	%i3
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x89,	%l0
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	nop
	set	0x7E, %o3
	ldstub	[%l7 + %o3],	%o3
	or	%g3,	%o1,	%l2
	nop
	set	0x72, %g2
	sth	%g6,	[%l7 + %g2]
	nop
	set	0x6E, %i3
	lduh	[%l7 + %i3],	%o6
	set	0x41, %i4
	stba	%i2,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x4A, %i0
	ldsh	[%l7 + %i0],	%i7
	nop
	set	0x3C, %g1
	lduh	[%l7 + %g1],	%l3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%l0
	add	%g1,	%i1,	%o5
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x80,	%i4
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f0
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%o0
	ld	[%l7 + 0x2C],	%f14
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc8
	or	%o7,	%g7,	%g4
	nop
	set	0x2E, %o2
	ldsh	[%l7 + %o2],	%i0
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	add	%o2,	%g2,	%l6
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x14, %o4
	ldsw	[%l7 + %o4],	%i6
	nop
	set	0x18, %l3
	swap	[%l7 + %l3],	%l5
	nop
	set	0x44, %g3
	ldsh	[%l7 + %g3],	%i5
	wr	%i3,	%l1,	%set_softint
	add	%l4,	%o3,	%o1
	set	0x44, %i2
	sta	%f27,	[%l7 + %i2] 0x88
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x14, %g4
	lduh	[%l7 + %g4],	%l2
	add	%g3,	%g6,	%o6
	nop
	set	0x36, %l1
	sth	%i2,	[%l7 + %l1]
	nop
	set	0x28, %l6
	ldsh	[%l7 + %l6],	%l3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%l0
	nop
	set	0x3C, %o5
	lduh	[%l7 + %o5],	%g1
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x88,	%i7
	set	0x6C, %l4
	lda	[%l7 + %l4] 0x89,	%f18
	nop
	set	0x2C, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x4E, %g7
	ldsh	[%l7 + %g7],	%i1
	nop
	set	0x78, %i5
	stx	%o5,	[%l7 + %i5]
	st	%f21,	[%l7 + 0x78]
	nop
	set	0x24, %o7
	ldub	[%l7 + %o7],	%o0
	set	0x20, %l2
	stda	%i4,	[%l7 + %l2] 0x80
	nop
	set	0x30, %o3
	std	%f28,	[%l7 + %o3]
	nop
	set	0x2E, %o0
	lduh	[%l7 + %o0],	%g7
	set	0x5F, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g4
	nop
	set	0x54, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x2C, %i0
	ldsw	[%l7 + %i0],	%i0
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x81,	%g4
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xea,	%o6
	ld	[%l7 + 0x24],	%f0
	set	0x21, %l5
	ldstuba	[%l7 + %l5] 0x88,	%g2
	nop
	set	0x30, %i6
	std	%f22,	[%l7 + %i6]
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	ld	[%l7 + 0x08],	%f27
	or	%o2,	%i6,	%l5
	or	%l6,	%i5,	%l1
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x88,	%i3
	nop
	set	0x30, %o6
	stx	%l4,	[%l7 + %o6]
	set	0x70, %o2
	stda	%o2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x88,	 0
	nop
	set	0x78, %l3
	std	%l2,	[%l7 + %l3]
	add	%g3,	%o6,	%g6
	set	0x5C, %g3
	swapa	[%l7 + %g3] 0x80,	%l3
	nop
	set	0x70, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%o4
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f0
	set	0x24, %l1
	stwa	%l0,	[%l7 + %l1] 0x89
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f16
	set	0x70, %o5
	stda	%i2,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x24, %o1
	lduh	[%l7 + %o1],	%g1
	nop
	set	0x6F, %l4
	ldub	[%l7 + %l4],	%i7
	nop
	set	0x56, %l6
	lduh	[%l7 + %l6],	%o5
	nop
	set	0x54, %g7
	sth	%o0,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf9,	%f0
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%i4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%i1
	bne,pn	%icc,	loop_22
	fpsub16s	%f9,	%f27,	%f20
	nop
	set	0x11, %i5
	ldstub	[%l7 + %i5],	%g4
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x80,	 2
loop_22:
	nop
	set	0x50, %i4
	std	%g6,	[%l7 + %i4]
	nop
	set	0x18, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x30, %o0
	std	%g4,	[%l7 + %o0]
	set	0x3F, %g1
	stba	%o2,	[%l7 + %g1] 0xea
	membar	#Sync
	or	%i6,	%l5,	%l6
	set	0x55, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g2
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x81,	%i4
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x88,	%l1
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%l4
	nop
	set	0x0C, %g5
	ldsw	[%l7 + %g5],	%i3
	fpadd32	%f26,	%f6,	%f28
	nop
	set	0x54, %o6
	lduh	[%l7 + %o6],	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%g3
	be,a,pn	%icc,	loop_23
	nop
	set	0x5C, %o4
	stb	%o6,	[%l7 + %o4]
	set	0x44, %o2
	sta	%f10,	[%l7 + %o2] 0x88
loop_23:
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x7F, %l3
	stb	%g6,	[%l7 + %l3]
	nop
	set	0x28, %i2
	std	%l2,	[%l7 + %i2]
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%o4
	set	0x4C, %g6
	lda	[%l7 + %g6] 0x88,	%f8
	nop
	set	0x54, %l1
	ldsw	[%l7 + %l1],	%o3
	bne	%icc,	loop_24
	nop
	set	0x68, %i7
	stw	%i2,	[%l7 + %i7]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x81
loop_24:
	nop
	set	0x08, %o1
	ldstuba	[%l7 + %o1] 0x88,	%g1
	nop
	set	0x54, %g4
	stw	%i7,	[%l7 + %g4]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%o5
	nop
	set	0x1C, %l6
	sth	%l0,	[%l7 + %l6]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xda
	nop
	set	0x40, %o7
	stx	%i4,	[%l7 + %o7]
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x81,	 3
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x34, %o3
	swapa	[%l7 + %o3] 0x81,	%g4
	ld	[%l7 + 0x14],	%f31
	or	%o0,	%i0,	%g7
	nop
	set	0x68, %i5
	ldub	[%l7 + %i5],	%o7
	nop
	set	0x7C, %i4
	lduh	[%l7 + %i4],	%o2
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x80,	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%l6
	nop
	set	0x3A, %g2
	sth	%l5,	[%l7 + %g2]
	fpadd32s	%f20,	%f2,	%f11
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f20
	set	0x10, %o0
	swapa	[%l7 + %o0] 0x88,	%g2
	set	0x70, %l5
	stda	%l0,	[%l7 + %l5] 0x88
	nop
	set	0x3C, %i6
	ldstub	[%l7 + %i6],	%l4
	set	0x0C, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i3
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	fpsub32	%f12,	%f26,	%f2
	set	0x0E, %g5
	stha	%i5,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%l2
	set	0x7C, %o2
	lda	[%l7 + %o2] 0x89,	%f12
	add	%o1,	%g3,	%g6
	nop
	set	0x10, %l3
	stx	%o6,	[%l7 + %l3]
	set	0x10, %i2
	stda	%l2,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%o2
	nop
	set	0x5E, %o4
	lduh	[%l7 + %o4],	%i2
	nop
	set	0x2C, %g6
	ldsh	[%l7 + %g6],	%g1
	set	0x60, %l1
	stxa	%i7,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x4A, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o5
	nop
	set	0x78, %i7
	ldsh	[%l7 + %i7],	%o4
	nop
	set	0x68, %g4
	swap	[%l7 + %g4],	%i4
	nop
	set	0x78, %o1
	swap	[%l7 + %o1],	%i1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xd2
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%g4
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%o0
	nop
	set	0x34, %l2
	lduw	[%l7 + %l2],	%i0
	set	0x7C, %o7
	sta	%f29,	[%l7 + %o7] 0x80
	nop
	set	0x3C, %o3
	ldstub	[%l7 + %o3],	%l0
	wr	%g7,	%o2,	%ccr
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%o7
	nop
	set	0x20, %i5
	std	%f2,	[%l7 + %i5]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%l5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%g2
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f28
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x80,	 4
	nop
	set	0x60, %g2
	sth	%i3,	[%l7 + %g2]
	wr	%i5,	%l2,	%clear_softint
	nop
	set	0x70, %l0
	stx	%o1,	[%l7 + %l0]
	nop
	set	0x73, %o0
	ldstub	[%l7 + %o0],	%g3
	set	0x38, %l5
	stba	%l4,	[%l7 + %l5] 0x81
	nop
	set	0x27, %g1
	stb	%g6,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x38]
	add	%l3,	%o3,	%i2
	set	0x40, %i6
	stda	%o6,	[%l7 + %i6] 0x80
	or	%i7,	%g1,	%o4
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x89
	nop
	set	0x2C, %i3
	ldsw	[%l7 + %i3],	%o5
	nop
	set	0x1B, %o6
	ldsb	[%l7 + %o6],	%i4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	st	%fsr,	[%l7 + 0x78]
	ld	[%l7 + 0x08],	%f28
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x89,	%g4
	set	0x2C, %g5
	lda	[%l7 + %g5] 0x80,	%f0
	set	0x78, %i2
	swapa	[%l7 + %i2] 0x81,	%o0
	nop
	set	0x70, %g3
	swap	[%l7 + %g3],	%i0
	set	0x48, %o4
	stda	%l0,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x5C, %l1
	sta	%f22,	[%l7 + %l1] 0x89
	or	%g7,	%o2,	%i1
	or	%o7,	%g5,	%l6
	add	%l5,	%g2,	%i6
	wr	%l1,	%i3,	%sys_tick
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd0,	%f0
	nop
	set	0x64, %i7
	swap	[%l7 + %i7],	%l2
	bn,a	%icc,	loop_25
	and	%i5,	%g3,	%l4
	st	%f15,	[%l7 + 0x6C]
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xe2,	%o0
loop_25:
	nop
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xda
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x80,	%l3
	set	0x55, %l4
	ldstuba	[%l7 + %l4] 0x81,	%g6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%o3
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xeb,	%o6
	nop
	set	0x58, %g7
	stx	%i7,	[%l7 + %g7]
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x88,	%o4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x80
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%o4
	nop
	set	0x18, %i5
	std	%g0,	[%l7 + %i5]
	wr	%i4,	%o0,	%sys_tick
	nop
	set	0x36, %i0
	sth	%g4,	[%l7 + %i0]
	ld	[%l7 + 0x44],	%f11
	wr 	%g0, 	0x6, 	%fprs
	add	%l0,	%o2,	%o7
	nop
	set	0x50, %i4
	stx	%i1,	[%l7 + %i4]
	or	%l6,	%g5,	%g2
	nop
	set	0x62, %l0
	stb	%i6,	[%l7 + %l0]
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	nop
	set	0x0A, %l5
	lduh	[%l7 + %l5],	%i3
	set	0x18, %g1
	stxa	%l2,	[%l7 + %g1] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%i5
	nop
	set	0x10, %o0
	swap	[%l7 + %o0],	%l4
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x81,	%g3
	nop
	nop
	setx	0xB327E641,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x491ABF1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f17,	%f9
	nop
	set	0x28, %i6
	std	%l2,	[%l7 + %i6]
	add	%o1,	%i2,	%g6
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%o2
	nop
	set	0x66, %l3
	ldsb	[%l7 + %l3],	%o6
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o4
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f16
	set	0x50, %o2
	stda	%o4,	[%l7 + %o2] 0x80
	nop
	set	0x4A, %g3
	ldsh	[%l7 + %g3],	%i7
	nop
	set	0x7C, %l1
	sth	%g1,	[%l7 + %l1]
	set	0x28, %g6
	prefetcha	[%l7 + %g6] 0x80,	 4
	nop
	set	0x10, %i7
	stw	%i4,	[%l7 + %i7]
	nop
	set	0x58, %o4
	std	%f18,	[%l7 + %o4]
	nop
	set	0x40, %o1
	stw	%g4,	[%l7 + %o1]
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%g7
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x89,	 3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf8
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x89,	%l0
	nop
	set	0x12, %g7
	ldsh	[%l7 + %g7],	%o7
	nop
	set	0x76, %o7
	sth	%o2,	[%l7 + %o7]
	and	%l6,	%i1,	%g2
	set	0x70, %o3
	stxa	%g5,	[%l7 + %o3] 0x89
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%l0
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x20, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i3
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f16
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x08, %g2
	prefetch	[%l7 + %g2],	 3
	set	0x30, %l5
	ldda	[%l7 + %l5] 0xe3,	%l2
	nop
	set	0x38, %g1
	lduw	[%l7 + %g1],	%l5
	nop
	set	0x08, %i0
	ldsh	[%l7 + %i0],	%i5
	set	0x7C, %o0
	swapa	[%l7 + %o0] 0x81,	%l4
	add	%g3,	%l3,	%o1
	set	0x77, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i2
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x80,	%g6
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x88,	%o3
	and	%o6,	%o4,	%o5
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x2E, %o6
	stha	%i7,	[%l7 + %o6] 0x81
	ba	%xcc,	loop_26
	st	%fsr,	[%l7 + 0x70]
	set	0x70, %g5
	stxa	%o0,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_26:
	nop
	set	0x4C, %i2
	ldsw	[%l7 + %i2],	%g1
	nop
	set	0x2E, %o2
	stb	%g4,	[%l7 + %o2]
	and	%g7,	%i0,	%i4
	set	0x2B, %l1
	stba	%o7,	[%l7 + %l1] 0xe2
	membar	#Sync
	ble,a,pt	%xcc,	loop_27
	nop
	set	0x3E, %g6
	lduh	[%l7 + %g6],	%l0
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x88,	 3
loop_27:
	nop
	set	0x58, %o4
	lduh	[%l7 + %o4],	%i1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%g2
	nop
	set	0x38, %o1
	lduw	[%l7 + %o1],	%g5
	set	0x54, %g3
	stwa	%i6,	[%l7 + %g3] 0xea
	membar	#Sync
	st	%f12,	[%l7 + 0x08]
	add	%l1,	%l2,	%i3
	nop
	set	0x78, %o5
	lduw	[%l7 + %o5],	%i5
	nop
	set	0x20, %g4
	sth	%l5,	[%l7 + %g4]
	fpsub16	%f18,	%f2,	%f0
	nop
	set	0x10, %l6
	stw	%l4,	[%l7 + %l6]
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%l2
	nop
	set	0x40, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x5B, %o3
	ldsb	[%l7 + %o3],	%g3
	set	0x60, %i5
	stda	%o0,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x7D, %l2
	ldstuba	[%l7 + %l2] 0x89,	%i2
	set	0x28, %l4
	lda	[%l7 + %l4] 0x80,	%f28
	nop
	set	0x50, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%f12,	[%l7 + 0x58]
	and	%o3,	%o6,	%g6
	nop
	set	0x14, %l0
	lduh	[%l7 + %l0],	%o4
	or	%i7,	%o0,	%o5
	nop
	set	0x32, %l5
	ldsb	[%l7 + %l5],	%g4
	nop
	set	0x68, %g2
	std	%g0,	[%l7 + %g2]
	set	0x70, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i0
	nop
	set	0x5C, %i0
	ldsw	[%l7 + %i0],	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%l0
	nop
	set	0x24, %o0
	swap	[%l7 + %o0],	%i4
	and	%i1,	%o2,	%g2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x7C, %i1
	ldsh	[%l7 + %i1],	%l6
	set	0x3C, %i3
	swapa	[%l7 + %i3] 0x81,	%g5
	nop
	set	0x68, %l3
	prefetch	[%l7 + %l3],	 1
	ld	[%l7 + 0x18],	%f18
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x88,	%i6
	st	%f1,	[%l7 + 0x18]
	nop
	set	0x44, %i6
	ldsh	[%l7 + %i6],	%l2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc8
	set	0x2F, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l1
	nop
	set	0x58, %l1
	std	%i4,	[%l7 + %l1]
	nop
	set	0x08, %g6
	lduw	[%l7 + %g6],	%i3
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f28
	and	%l3,	%g3,	%l4
	nop
	set	0x4A, %i7
	ldub	[%l7 + %i7],	%i2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf1
	membar	#Sync
	wr	%o1,	%o6,	%sys_tick
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0
	nop
	set	0x48, %g4
	stx	%o3,	[%l7 + %g4]
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%o4
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i7
	st	%fsr,	[%l7 + 0x30]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%o5
	nop
	set	0x38, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x68, %o3
	stda	%g0,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%g7
	nop
	set	0x42, %i5
	sth	%l0,	[%l7 + %i5]
	set	0x78, %g7
	swapa	[%l7 + %g7] 0x89,	%o7
	set	0x44, %l4
	swapa	[%l7 + %l4] 0x88,	%i1
	set	0x3C, %l2
	stha	%i4,	[%l7 + %l2] 0x80
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x38, %l5
	stx	%o2,	[%l7 + %l5]
	nop
	set	0x6F, %g2
	ldub	[%l7 + %g2],	%g2
	set	0x28, %g1
	stda	%i6,	[%l7 + %g1] 0x80
	wr	%i6,	%l2,	%y
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f26
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%g4
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%l1
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%i3
	nop
	set	0x74, %i3
	swap	[%l7 + %i3],	%l5
	add	%i5,	%g3,	%l3
	nop
	set	0x58, %o6
	stw	%l4,	[%l7 + %o6]
	and	%i2,	%o6,	%g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1249
!	Type a   	: 26
!	Type cti   	: 27
!	Type x   	: 525
!	Type f   	: 33
!	Type i   	: 140
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
.word 0x10EBD5A8
.word 0xFF7E8CC6
.word 0x024E98E5
.word 0x379294DB
.word 0x44C8D4E4
.word 0x8D18C81C
.word 0x7BD6B304
.word 0x809E877E
.word 0x0A8B21A9
.word 0xB4631813
.word 0xD1CC1E91
.word 0x7A6ABF3E
.word 0x7A3CECA6
.word 0x7A0DB540
.word 0xFB096406
.word 0x0CBDBECC
.word 0xFF815B5C
.word 0xF5EE0623
.word 0xE1BB86F5
.word 0xFD2BA765
.word 0xD9E8E29C
.word 0x149B43AC
.word 0xDC885152
.word 0x163EE52D
.word 0x1C7B4675
.word 0x73A24AB7
.word 0x22C5E8FB
.word 0x38B64E8C
.word 0x2EC37C5E
.word 0x28D4BFDC
.word 0x2A446B2D
.word 0x0CABE5A6
.word 0x4AC98EF4
.word 0x9BD5978C
.word 0x88DDFB80
.word 0x6BB7356F
.word 0xEC4E83DF
.word 0x9194228D
.word 0x7FE42E75
.word 0xF421C7D3
.word 0x5A71738E
.word 0x3CF775D0
.word 0x9EB9D336
.word 0xCDA9EE0D
.word 0x6E658546
.word 0x6BC0F8B7
.word 0xB197AF81
.word 0xAF23DB0B
.word 0x0C23974D
.word 0x8C9F46E8
.word 0x6D290FD3
.word 0xEEFA8EEC
.word 0xCCAEF981
.word 0x5F68AEC9
.word 0x53F75D0D
.word 0x7BFB4EB1
.word 0x8A23F625
.word 0x2D5045E6
.word 0x3BD1F4F2
.word 0x45C03736
.word 0x8AFED8C2
.word 0xB089D0E8
.word 0x9399FBE7
.word 0xF93F1DCA
.end
