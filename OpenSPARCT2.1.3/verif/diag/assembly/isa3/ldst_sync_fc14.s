/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc14.s
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
	set	0x7,	%g1
	set	0x2,	%g2
	set	0xA,	%g3
	set	0x1,	%g4
	set	0x4,	%g5
	set	0xD,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x9,	%i1
	set	-0xC,	%i2
	set	-0xC,	%i3
	set	-0x9,	%i4
	set	-0x8,	%i5
	set	-0x0,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x4FB67054,	%l0
	set	0x30D2883E,	%l1
	set	0x1C64BFEC,	%l2
	set	0x6188C489,	%l3
	set	0x389774E3,	%l4
	set	0x41920732,	%l5
	set	0x18B51E23,	%l6
	!# Output registers
	set	0x0032,	%o0
	set	0x1E0E,	%o1
	set	0x0319,	%o2
	set	0x1DCF,	%o3
	set	0x15EF,	%o4
	set	0x0B18,	%o5
	set	-0x01C9,	%o6
	set	0x1CB0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xE11A97F1228F4C7A)
	INIT_TH_FP_REG(%l7,%f2,0x012BC635C605BB8E)
	INIT_TH_FP_REG(%l7,%f4,0xD568EB8C7DD77189)
	INIT_TH_FP_REG(%l7,%f6,0x481BB0ED340ED397)
	INIT_TH_FP_REG(%l7,%f8,0x43C24B7DBE2C0226)
	INIT_TH_FP_REG(%l7,%f10,0xBC58E7F4AC54722E)
	INIT_TH_FP_REG(%l7,%f12,0xC83EE4B15DDAB4A1)
	INIT_TH_FP_REG(%l7,%f14,0xDE7381E8F50A60A1)
	INIT_TH_FP_REG(%l7,%f16,0x2628C184000C0322)
	INIT_TH_FP_REG(%l7,%f18,0xE171747B164AFBA0)
	INIT_TH_FP_REG(%l7,%f20,0x2BD521BD1DEEC040)
	INIT_TH_FP_REG(%l7,%f22,0x89CE7CC9BD34EAD7)
	INIT_TH_FP_REG(%l7,%f24,0x30F61F990228327F)
	INIT_TH_FP_REG(%l7,%f26,0xCAA0C73EEF46725A)
	INIT_TH_FP_REG(%l7,%f28,0xC053C0AC90A97A7B)
	INIT_TH_FP_REG(%l7,%f30,0x7DCAFE2878550580)

	!# Execute Main Diag ..

	set	0x28, %o1
	stba	%o5,	[%l7 + %o1] 0x89
	set	0x68, %o3
	stxa	%g1,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%g6
	nop
	set	0x50, %o0
	stx	%g2,	[%l7 + %o0]
	set	0x56, %i6
	stha	%g3,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%i6
	or	%o4,	%l5,	%i0
	nop
	set	0x4E, %g4
	stb	%g7,	[%l7 + %g4]
	nop
	set	0x2C, %i3
	ldsh	[%l7 + %i3],	%l0
	set	0x48, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	set	0x4B, %i4
	stb	%i3,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0
	nop
	set	0x7C, %g5
	stw	%i2,	[%l7 + %g5]
	set	0x31, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i6
	and	%o0,	%i4,	%l1
	or	%i1,	%l4,	%o7
	nop
	set	0x08, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x75, %l5
	stba	%o2,	[%l7 + %l5] 0x89
	nop
	set	0x24, %g2
	ldstub	[%l7 + %g2],	%l3
	nop
	set	0x13, %g3
	ldsb	[%l7 + %g3],	%g5
	bl,a,pt	%xcc,	loop_1
	or	%l2,	%o1,	%o6
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%l6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%o5
loop_1:
	nop
	set	0x26, %g1
	sth	%g1,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x0C, %l1
	ldsb	[%l7 + %l1],	%g2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g6
	st	%f11,	[%l7 + 0x10]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i7
	nop
	set	0x1E, %o7
	stb	%i0,	[%l7 + %o7]
	nop
	set	0x1A, %o5
	ldstub	[%l7 + %o5],	%g7
	nop
	set	0x10, %i7
	std	%f18,	[%l7 + %i7]
	nop
	set	0x7C, %i1
	ldub	[%l7 + %i1],	%l5
	st	%f5,	[%l7 + 0x48]
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x40, %o6
	sta	%f4,	[%l7 + %o6] 0x81
	or	%l0,	%o3,	%i3
	nop
	set	0x18, %l2
	prefetch	[%l7 + %l2],	 0
	st	%fsr,	[%l7 + 0x64]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%i6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe2,	%o0
	nop
	set	0x14, %i2
	stw	%i2,	[%l7 + %i2]
	st	%f2,	[%l7 + 0x08]
	nop
	set	0x54, %o3
	prefetch	[%l7 + %o3],	 4
	bg,a,pt	%xcc,	loop_2
	nop
	set	0x2C, %o1
	lduh	[%l7 + %o1],	%l1
	nop
	set	0x0E, %l0
	lduh	[%l7 + %l0],	%i1
	nop
	set	0x78, %i6
	ldsh	[%l7 + %i6],	%l4
loop_2:
	nop
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%o2
	nop
	set	0x18, %g4
	sth	%i4,	[%l7 + %g4]
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%f28
	nop
	set	0x53, %i4
	ldsb	[%l7 + %i4],	%l3
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%l2
	add	%g5,	%o1,	%o6
	nop
	set	0x48, %o2
	swap	[%l7 + %o2],	%l6
	nop
	set	0x6D, %l3
	stb	%o5,	[%l7 + %l3]
	set	0x4A, %g5
	stha	%g4,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x51, %g6
	ldub	[%l7 + %g6],	%g2
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f16
	nop
	set	0x66, %l6
	ldstub	[%l7 + %l6],	%g3
	set	0x58, %g2
	stha	%g1,	[%l7 + %g2] 0x89
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x81
	nop
	set	0x14, %l1
	lduw	[%l7 + %l1],	%o4
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x88,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%i7
	set	0x0C, %o5
	sta	%f6,	[%l7 + %o5] 0x89
	nop
	set	0x08, %i7
	lduw	[%l7 + %i7],	%l5
	nop
	set	0x40, %o7
	ldsw	[%l7 + %o7],	%l0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	nop
	set	0x74, %o6
	lduw	[%l7 + %o6],	%g7
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe3,	%o2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xc0
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x10, %l2
	std	%f16,	[%l7 + %l2]
	nop
	set	0x74, %o3
	lduh	[%l7 + %o3],	%i5
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x10, %i6
	stda	%i6,	[%l7 + %i6] 0x80
	set	0x7E, %l0
	stba	%i2,	[%l7 + %l0] 0x81
	and	%l1,	%i1,	%l4
	set	0x30, %g7
	stwa	%o7,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xe3,	%o2
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%o0
	set	0x60, %g4
	stda	%l2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x0E, %i4
	ldstub	[%l7 + %i4],	%l2
	nop
	set	0x6C, %i5
	ldsw	[%l7 + %i5],	%g5
	bleu	%icc,	loop_3
	nop
	set	0x5A, %l3
	ldstub	[%l7 + %l3],	%o1
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%o6
	or	%i4,	%l6,	%o5
loop_3:
	nop
	set	0x66, %o2
	lduh	[%l7 + %o2],	%g2
	ld	[%l7 + 0x40],	%f20
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%g6
	nop
	set	0x74, %g6
	lduh	[%l7 + %g6],	%i0
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xe3,	%g0
	and	%i7,	%l5,	%l0
	ba	%xcc,	loop_4
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	bge,a,pt	%icc,	loop_5
	nop
	set	0x18, %g3
	std	%f30,	[%l7 + %g3]
loop_4:
	nop
	set	0x5C, %g1
	sta	%f19,	[%l7 + %g1] 0x81
loop_5:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g7
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x58, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x48, %o5
	stx	%i5,	[%l7 + %o5]
	set	0x7C, %l5
	lda	[%l7 + %l5] 0x88,	%f27
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f0
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x81,	%i3
	nop
	set	0x52, %o6
	ldstub	[%l7 + %o6],	%i2
	nop
	set	0x1B, %i0
	ldub	[%l7 + %i0],	%i6
	set	0x4B, %i7
	stba	%l1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x68, %l4
	stx	%l4,	[%l7 + %l4]
	nop
	set	0x5E, %l2
	lduh	[%l7 + %l2],	%i1
	nop
	set	0x39, %o3
	stb	%o2,	[%l7 + %o3]
	nop
	set	0x70, %o1
	stx	%o0,	[%l7 + %o1]
	nop
	set	0x48, %i6
	std	%o6,	[%l7 + %i6]
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f0
	nop
	set	0x60, %g7
	std	%f24,	[%l7 + %g7]
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x88,	 3
	nop
	set	0x0A, %i3
	ldsh	[%l7 + %i3],	%g5
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	set	0x0E, %i4
	stba	%o1,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o6
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%i6
	set	0x75, %g4
	stba	%g2,	[%l7 + %g4] 0x88
	nop
	set	0x68, %g5
	ldub	[%l7 + %g5],	%g4
	nop
	set	0x64, %o2
	lduh	[%l7 + %o2],	%g3
	nop
	set	0x10, %l3
	std	%o4,	[%l7 + %l3]
	set	0x72, %l6
	ldstuba	[%l7 + %l6] 0x80,	%g6
	wr	%i0,	%g1,	%y
	nop
	set	0x20, %g2
	ldsb	[%l7 + %g2],	%o5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f16
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	nop
	set	0x58, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x4C, %o4
	stw	%i7,	[%l7 + %o4]
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%l4
	nop
	set	0x6B, %l5
	ldsb	[%l7 + %l5],	%l0
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%o3
	or	%i5,	%i3,	%i2
	add	%g7,	%i6,	%l4
	set	0x54, %i1
	lda	[%l7 + %i1] 0x88,	%f12
	nop
	set	0x28, %o6
	ldsw	[%l7 + %o6],	%l1
	nop
	set	0x34, %i0
	ldsw	[%l7 + %i0],	%o2
	nop
	set	0x58, %o7
	ldsw	[%l7 + %o7],	%o0
	nop
	set	0x2B, %l4
	stb	%o7,	[%l7 + %l4]
	nop
	set	0x28, %i7
	stx	%l2,	[%l7 + %i7]
	set	0x0C, %o3
	sta	%f28,	[%l7 + %o3] 0x88
	set	0x14, %l2
	sta	%f28,	[%l7 + %l2] 0x88
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x89,	 3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA65, 	%tick_cmpr
	nop
	set	0x6B, %l0
	ldsb	[%l7 + %l0],	%o1
	nop
	set	0x50, %o1
	swap	[%l7 + %o1],	%i4
	nop
	set	0x6A, %g7
	sth	%o6,	[%l7 + %g7]
	nop
	set	0x30, %i3
	std	%i6,	[%l7 + %i3]
	nop
	set	0x20, %i2
	stx	%g4,	[%l7 + %i2]
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x60, %i4
	lda	[%l7 + %i4] 0x89,	%f21
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%o4
	and	%g6,	%g2,	%g1
	nop
	set	0x3A, %g4
	ldstub	[%l7 + %g4],	%o5
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%i6
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x12, %l3
	sth	%i0,	[%l7 + %l3]
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i5
	nop
	set	0x5D, %l6
	ldsb	[%l7 + %l6],	%l0
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%f30
	ld	[%l7 + 0x38],	%f23
	set	0x70, %g3
	prefetcha	[%l7 + %g3] 0x81,	 4
	set	0x0A, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g7
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x5D, %o4
	ldsb	[%l7 + %o4],	%i3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i6
	add	%l1,	%o2,	%o7
	bn	%icc,	loop_6
	nop
	set	0x36, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x58, %l5
	ldsw	[%l7 + %l5],	%i1
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
loop_6:
	nop
	set	0x62, %i1
	stb	%o0,	[%l7 + %i1]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf1
	membar	#Sync
	and	%l3,	%o1,	%i4
	set	0x08, %o6
	stda	%o6,	[%l7 + %o6] 0x89
	set	0x34, %o7
	swapa	[%l7 + %o7] 0x80,	%l6
	set	0x28, %l4
	stxa	%g4,	[%l7 + %l4] 0x81
	set	0x54, %i0
	sta	%f1,	[%l7 + %i0] 0x80
	nop
	set	0x0C, %i7
	stw	%g3,	[%l7 + %i7]
	set	0x6C, %o3
	swapa	[%l7 + %o3] 0x81,	%g5
	ld	[%l7 + 0x64],	%f8
	set	0x48, %i6
	stwa	%o4,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x0C, %l2
	sth	%g2,	[%l7 + %l2]
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%g1
	nop
	set	0x09, %g7
	ldsb	[%l7 + %g7],	%o5
	set	0x5C, %o1
	sta	%f28,	[%l7 + %o1] 0x81
	nop
	set	0x29, %i3
	ldstub	[%l7 + %i3],	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%g6
	nop
	set	0x67, %i2
	ldstub	[%l7 + %i2],	%o3
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%i4
	nop
	set	0x30, %o0
	ldstub	[%l7 + %o0],	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g7
	and	%i2,	%i3,	%l4
	nop
	set	0x66, %g5
	lduh	[%l7 + %g5],	%i6
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%o2,	%l1,	%l2
	nop
	set	0x60, %o2
	std	%o6,	[%l7 + %o2]
	nop
	set	0x36, %l3
	lduh	[%l7 + %l3],	%o0
	nop
	set	0x38, %l6
	std	%f16,	[%l7 + %l6]
	add	%l3,	%o1,	%i4
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%i0
	nop
	set	0x21, %g3
	ldub	[%l7 + %g3],	%l6
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x78, %l1
	stda	%o6,	[%l7 + %l1] 0xeb
	membar	#Sync
	fpsub16s	%f17,	%f1,	%f21
	nop
	set	0x0C, %o5
	ldsw	[%l7 + %o5],	%g4
	set	0x2C, %o4
	sta	%f13,	[%l7 + %o4] 0x80
	add	%g3,	%g5,	%o4
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%g2
	set	0x14, %l5
	swapa	[%l7 + %l5] 0x88,	%g1
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%o4
	and	%i7,	%l5,	%o3
	and	%g6,	%i0,	%l0
	set	0x64, %g6
	stwa	%i5,	[%l7 + %g6] 0x81
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%i2
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%g7
	set	0x54, %i0
	sta	%f25,	[%l7 + %i0] 0x89
	ld	[%l7 + 0x20],	%f20
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%i6
	set	0x32, %i7
	stha	%i3,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x89
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%l0
	st	%f17,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x32, %o3
	ldstub	[%l7 + %o3],	%l2
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xe3,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%l3
	set	0x53, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o1
	nop
	set	0x18, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x36, %i3
	ldsh	[%l7 + %i3],	%o7
	nop
	set	0x48, %o1
	stx	%i4,	[%l7 + %o1]
	set	0x14, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd2,	%f16
	nop
	set	0x22, %o0
	ldsh	[%l7 + %o0],	%l6
	set	0x6E, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g4
	set	0x60, %g4
	stxa	%o6,	[%l7 + %g4] 0x81
	nop
	set	0x28, %o2
	std	%f18,	[%l7 + %o2]
	set	0x34, %l6
	stwa	%g5,	[%l7 + %l6] 0xe2
	membar	#Sync
	or	%o4,	%g2,	%g3
	st	%f12,	[%l7 + 0x40]
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x81,	%g0
	set	0x1D, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o5
	set	0x70, %l1
	stxa	%i7,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x68, %o5
	stda	%l4,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc8
	nop
	set	0x60, %i5
	stx	%g6,	[%l7 + %i5]
	ld	[%l7 + 0x10],	%f9
	nop
	set	0x62, %l5
	lduh	[%l7 + %l5],	%o3
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%i0
	nop
	set	0x40, %g6
	std	%f26,	[%l7 + %g6]
	nop
	set	0x30, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x0D, %o6
	ldub	[%l7 + %o6],	%l0
	and	%i2,	%i5,	%l4
	nop
	set	0x10, %i0
	sth	%g7,	[%l7 + %i0]
	set	0x20, %i7
	ldda	[%l7 + %i7] 0xeb,	%i2
	or	%l1,	%i6,	%o2
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x81,	%l2
	nop
	set	0x61, %l4
	stb	%o0,	[%l7 + %l4]
	nop
	set	0x58, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%o1
	or	%o7,	%i4,	%l6
	nop
	set	0x48, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x36, %g7
	ldsb	[%l7 + %g7],	%g4
	fpsub16	%f6,	%f16,	%f14
	set	0x68, %l2
	stda	%i0,	[%l7 + %l2] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f0
	set	0x39, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g5
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	st	%f31,	[%l7 + 0x5C]
	nop
	set	0x30, %i2
	std	%f28,	[%l7 + %i2]
	nop
	set	0x19, %g5
	ldub	[%l7 + %g5],	%o6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%g3
	nop
	set	0x2F, %o0
	ldub	[%l7 + %o0],	%g2
	nop
	set	0x15, %g4
	ldsb	[%l7 + %g4],	%o5
	bl,pt	%xcc,	loop_7
	nop
	set	0x28, %l6
	ldx	[%l7 + %l6],	%g1
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x76, %o2
	lduh	[%l7 + %o2],	%i7
loop_7:
	nop
	set	0x34, %g3
	stw	%l5,	[%l7 + %g3]
	nop
	set	0x40, %l1
	swap	[%l7 + %l1],	%o3
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%i0
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%g6
	or	%l0,	%i5,	%l4
	nop
	set	0x10, %o4
	stb	%g7,	[%l7 + %o4]
	st	%f3,	[%l7 + 0x54]
	set	0x40, %l5
	lda	[%l7 + %l5] 0x88,	%f2
	and	%i3,	%l1,	%i2
	set	0x20, %g1
	sta	%f31,	[%l7 + %g1] 0x89
	nop
	set	0x68, %i5
	std	%f6,	[%l7 + %i5]
	fpsub16	%f2,	%f6,	%f10
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x38, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x48, %i0
	stx	%i6,	[%l7 + %i0]
	nop
	set	0x14, %o6
	ldsw	[%l7 + %o6],	%l2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x81
	nop
	set	0x32, %l4
	sth	%o2,	[%l7 + %l4]
	set	0x72, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l3
	st	%f25,	[%l7 + 0x68]
	set	0x3C, %o3
	lda	[%l7 + %o3] 0x88,	%f7
	set	0x40, %i6
	lda	[%l7 + %i6] 0x89,	%f16
	set	0x24, %l0
	sta	%f8,	[%l7 + %l0] 0x80
	set	0x30, %g7
	ldda	[%l7 + %g7] 0xe2,	%o0
	set	0x30, %l2
	ldda	[%l7 + %l2] 0x88,	%o0
	nop
	set	0x7C, %i3
	swap	[%l7 + %i3],	%i4
	st	%fsr,	[%l7 + 0x68]
	st	%fsr,	[%l7 + 0x44]
	st	%fsr,	[%l7 + 0x1C]
	be,a	%icc,	loop_8
	nop
	set	0x17, %o1
	ldsb	[%l7 + %o1],	%l6
	nop
	set	0x30, %i4
	std	%f22,	[%l7 + %i4]
	fpadd16s	%f1,	%f0,	%f15
loop_8:
	nop
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xca
	wr	%g4,	%i1,	%clear_softint
	set	0x08, %o0
	stwa	%g5,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x66, %g4
	lduh	[%l7 + %g4],	%o7
	nop
	set	0x08, %g5
	swap	[%l7 + %g5],	%g2
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x80,	%g2
	set	0x7F, %l6
	stba	%g1,	[%l7 + %l6] 0x88
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%l5
	set	0x56, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i7
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x89
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f28
	nop
	set	0x20, %o5
	stx	%i0,	[%l7 + %o5]
	nop
	set	0x64, %o4
	lduh	[%l7 + %o4],	%o3
	nop
	set	0x0C, %g2
	prefetch	[%l7 + %g2],	 1
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x81,	%l0
	st	%fsr,	[%l7 + 0x58]
	add	%i5,	%g6,	%l4
	nop
	set	0x58, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x18, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	wr	%g7,	%i2,	%sys_tick
	set	0x3A, %g6
	stha	%l1,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x60, %i0
	std	%f6,	[%l7 + %i0]
	nop
	set	0x66, %o6
	ldsb	[%l7 + %o6],	%i6
	nop
	set	0x70, %i7
	std	%f18,	[%l7 + %i7]
	and	%o2,	%l2,	%l3
	wr	%o0,	%i4,	%ccr
	set	0x5C, %l4
	lda	[%l7 + %l4] 0x88,	%f20
	nop
	set	0x14, %o7
	lduw	[%l7 + %o7],	%l6
	set	0x40, %i1
	stba	%o1,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xc2
	nop
	set	0x78, %i6
	sth	%g4,	[%l7 + %i6]
	set	0x70, %l0
	stda	%i0,	[%l7 + %l0] 0x81
	nop
	set	0x76, %l2
	ldstub	[%l7 + %l2],	%o6
	set	0x39, %i3
	stba	%o4,	[%l7 + %i3] 0xe3
	membar	#Sync
	add	%g5,	%g2,	%o7
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x80
	set	0x24, %o1
	stwa	%g1,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x15, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g3
	and	%l5,	%o5,	%i0
	set	0x6A, %i4
	stha	%i7,	[%l7 + %i4] 0x80
	fpsub32s	%f28,	%f11,	%f22
	and	%l0,	%o3,	%g6
	set	0x78, %o0
	stda	%i4,	[%l7 + %o0] 0xeb
	membar	#Sync
	or	%i3,	%g7,	%i2
	add	%l4,	%i6,	%o2
	nop
	set	0x3C, %g4
	ldsw	[%l7 + %g4],	%l2
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%f20
	and	%l1,	%o0,	%l3
	set	0x68, %l3
	stda	%i6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x2A, %l6
	sth	%i4,	[%l7 + %l6]
	add	%o1,	%i1,	%o6
	nop
	set	0x38, %g3
	stw	%o4,	[%l7 + %g3]
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%g5
	set	0x58, %o5
	sta	%f24,	[%l7 + %o5] 0x81
	set	0x54, %l1
	sta	%f29,	[%l7 + %l1] 0x88
	set	0x3A, %g2
	stba	%g4,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x2C, %o4
	swapa	[%l7 + %o4] 0x89,	%o7
	nop
	set	0x78, %g1
	ldx	[%l7 + %g1],	%g1
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xda
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%g2
	nop
	set	0x44, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x19, %i7
	ldstub	[%l7 + %i7],	%l5
	set	0x60, %g6
	sta	%f19,	[%l7 + %g6] 0x80
	nop
	set	0x12, %l4
	sth	%o5,	[%l7 + %l4]
	and	%g3,	%i7,	%i0
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x81,	%l0
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%g6
	nop
	set	0x70, %o3
	sth	%o3,	[%l7 + %o3]
	nop
	set	0x65, %i6
	ldstub	[%l7 + %i6],	%i5
	nop
	set	0x50, %l0
	ldsw	[%l7 + %l0],	%i3
	set	0x1C, %l2
	sta	%f11,	[%l7 + %l2] 0x88
	set	0x30, %g7
	swapa	[%l7 + %g7] 0x81,	%g7
	set	0x10, %o1
	stda	%l4,	[%l7 + %o1] 0xea
	membar	#Sync
	or	%i2,	%i6,	%o2
	set	0x64, %i3
	sta	%f20,	[%l7 + %i3] 0x88
	set	0x20, %i2
	ldda	[%l7 + %i2] 0x88,	%l2
	set	0x38, %o0
	stwa	%l1,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x08, %g4
	lduh	[%l7 + %g4],	%l3
	ld	[%l7 + 0x44],	%f0
	nop
	set	0x74, %i4
	stb	%o0,	[%l7 + %i4]
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc2
	nop
	set	0x20, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%i4
	ld	[%l7 + 0x18],	%f23
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o1
	nop
	set	0x76, %o2
	ldsb	[%l7 + %o2],	%o6
	nop
	set	0x09, %l6
	stb	%o4,	[%l7 + %l6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%g4
	nop
	set	0x50, %l1
	std	%o6,	[%l7 + %l1]
	nop
	set	0x14, %g2
	sth	%g1,	[%l7 + %g2]
	nop
	set	0x24, %o5
	stb	%g5,	[%l7 + %o5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%o5
	set	0x70, %o4
	stda	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%f25,	[%l7 + 0x58]
	add	%i7,	%i0,	%l0
	nop
	set	0x5F, %g1
	ldstub	[%l7 + %g1],	%g6
	fpadd16	%f24,	%f22,	%f22
	set	0x52, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%i3
	nop
	set	0x38, %i0
	sth	%g7,	[%l7 + %i0]
	set	0x60, %l5
	stxa	%o3,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x44, %i7
	prefetch	[%l7 + %i7],	 0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f0
	nop
	set	0x28, %o6
	std	%i2,	[%l7 + %o6]
	nop
	set	0x78, %l4
	std	%l4,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x70]
	wr	%o2,	%l2,	%sys_tick
	nop
	set	0x0E, %i1
	lduh	[%l7 + %i1],	%i6
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%l1
	set	0x30, %i6
	sta	%f11,	[%l7 + %i6] 0x89
	nop
	set	0x0C, %l0
	stw	%l3,	[%l7 + %l0]
	nop
	set	0x54, %l2
	ldub	[%l7 + %l2],	%i4
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x40, %o1
	std	%f12,	[%l7 + %o1]
	and	%l6,	%o0,	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%o4
	bge,a	%xcc,	loop_9
	add	%g4,	%i1,	%o7
	set	0x2E, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g1
loop_9:
	st	%fsr,	[%l7 + 0x74]
	and	%g5,	%o5,	%g2
	nop
	set	0x20, %i3
	lduw	[%l7 + %i3],	%i7
	or	%i0,	%l5,	%g6
	add	%l0,	%i5,	%g3
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x30, %i2
	std	%i2,	[%l7 + %i2]
	nop
	set	0x74, %o0
	stb	%o3,	[%l7 + %o0]
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f8
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x89,	%i2
	nop
	set	0x20, %g5
	ldsh	[%l7 + %g5],	%g7
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x88,	%l4
	set	0x21, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l2
	set	0x1C, %l1
	swapa	[%l7 + %l1] 0x88,	%o2
	nop
	set	0x74, %l6
	prefetch	[%l7 + %l6],	 1
	and	%i6,	%l1,	%l3
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xe3,	%i6
	st	%fsr,	[%l7 + 0x38]
	ld	[%l7 + 0x48],	%f24
	st	%fsr,	[%l7 + 0x70]
	ld	[%l7 + 0x6C],	%f19
	nop
	set	0x10, %o4
	std	%o0,	[%l7 + %o4]
	nop
	set	0x50, %o5
	swap	[%l7 + %o5],	%i4
	nop
	set	0x5F, %g1
	stb	%o6,	[%l7 + %g1]
	set	0x40, %i5
	stxa	%o1,	[%l7 + %i5] 0x89
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%o4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%o7
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x89
	nop
	set	0x1C, %i0
	lduh	[%l7 + %i0],	%g1
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x89,	 3
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%g4
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x89,	%o5
	st	%f9,	[%l7 + 0x5C]
	st	%fsr,	[%l7 + 0x50]
	add	%g2,	%i0,	%l5
	add	%i7,	%l0,	%g6
	nop
	set	0x48, %o3
	ldub	[%l7 + %o3],	%g3
	set	0x08, %i6
	stda	%i4,	[%l7 + %i6] 0x80
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x89,	%i3
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%o3
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%i2
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x80,	%l4
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%l2
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x89,	%i6
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xea,	%o2
	fpadd16s	%f19,	%f15,	%f5
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x81,	 4
	set	0x5C, %o0
	stwa	%l6,	[%l7 + %o0] 0x81
	set	0x08, %l3
	stda	%o0,	[%l7 + %l3] 0x88
	nop
	set	0x10, %i4
	stx	%i4,	[%l7 + %i4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x4D, %o2
	stba	%o4,	[%l7 + %o2] 0x89
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc8
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x88,	%o6
	nop
	set	0x36, %g3
	ldsh	[%l7 + %g3],	%i1
	nop
	set	0x50, %g2
	prefetch	[%l7 + %g2],	 3
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%o7
	set	0x3C, %o4
	sta	%f10,	[%l7 + %o4] 0x88
	ld	[%l7 + 0x10],	%f1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%g4
	fpadd16	%f26,	%f28,	%f22
	nop
	set	0x20, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x1C, %g1
	swap	[%l7 + %g1],	%o5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%g0
	wr	%i0,	%g2,	%clear_softint
	set	0x20, %i7
	stda	%l4,	[%l7 + %i7] 0xe3
	membar	#Sync
	wr	%i7,	%l0,	%set_softint
	set	0x18, %l5
	stxa	%g3,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x38, %i0
	stx	%g6,	[%l7 + %i0]
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%i4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	st	%f0,	[%l7 + 0x4C]
	nop
	set	0x28, %g6
	ldsh	[%l7 + %g6],	%o3
	nop
	set	0x14, %i6
	lduw	[%l7 + %i6],	%i2
	or	%g7,	%l4,	%l2
	add	%i6,	%o2,	%i3
	or	%l3,	%o0,	%l6
	nop
	set	0x2C, %o3
	lduw	[%l7 + %o3],	%l1
	set	0x58, %o6
	lda	[%l7 + %o6] 0x80,	%f31
	nop
	set	0x4E, %l2
	sth	%i4,	[%l7 + %l2]
	nop
	set	0x4C, %o1
	sth	%o1,	[%l7 + %o1]
	add	%o6,	%i1,	%o4
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x5B, %l0
	ldsb	[%l7 + %l0],	%g5
	or	%g4,	%o7,	%o5
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xea,	%i0
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%g2
	nop
	set	0x7C, %g4
	ldstub	[%l7 + %g4],	%l5
	nop
	set	0x20, %i3
	stw	%i7,	[%l7 + %i3]
	or	%g1,	%g3,	%l0
	nop
	set	0x60, %l3
	stx	%g6,	[%l7 + %l3]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f16
	nop
	set	0x12, %o2
	lduh	[%l7 + %o2],	%o3
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x88,	%i2
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%i5
	fpadd32	%f30,	%f4,	%f20
	nop
	set	0x20, %o0
	swap	[%l7 + %o0],	%l4
	add	%g7,	%l2,	%i6
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x4C, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x4C, %g1
	ldsw	[%l7 + %g1],	%i3
	nop
	set	0x3C, %o5
	ldsh	[%l7 + %o5],	%l3
	nop
	set	0x3F, %i7
	ldstub	[%l7 + %i7],	%o2
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x81,	 3
	nop
	set	0x52, %i5
	ldub	[%l7 + %i5],	%l1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x88,	%i4,	%o0
	set	0x60, %l4
	ldda	[%l7 + %l4] 0x81,	%o6
	add	%i1,	%o1,	%o4
	nop
	set	0x0C, %i1
	ldub	[%l7 + %i1],	%g4
	and	%g5,	%o5,	%o7
	nop
	set	0x48, %g6
	stw	%i0,	[%l7 + %g6]
	set	0x70, %i6
	stda	%g2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x64, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x7C, %o6
	ldstub	[%l7 + %o6],	%l5
	or	%g1,	%i7,	%g3
	nop
	set	0x48, %l2
	std	%g6,	[%l7 + %l2]
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xea,	%o2
	set	0x38, %g7
	stha	%i2,	[%l7 + %g7] 0x89
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	nop
	set	0x3C, %l0
	stw	%l0,	[%l7 + %l0]
	st	%f16,	[%l7 + 0x7C]
	set	0x4F, %i2
	stba	%l4,	[%l7 + %i2] 0x88
	nop
	set	0x2C, %o7
	stb	%l2,	[%l7 + %o7]
	nop
	set	0x40, %i3
	stw	%i6,	[%l7 + %i3]
	or	%g7,	%i3,	%o2
	set	0x60, %g4
	stda	%i6,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x44, %i4
	stba	%l1,	[%l7 + %i4] 0x88
	nop
	set	0x54, %o2
	lduh	[%l7 + %o2],	%i4
	or	%o0,	%o6,	%i1
	nop
	set	0x28, %l3
	stb	%o1,	[%l7 + %l3]
	set	0x3E, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o4
	nop
	set	0x70, %g5
	std	%l2,	[%l7 + %g5]
	nop
	set	0x32, %g3
	ldub	[%l7 + %g3],	%g5
	set	0x1C, %g2
	stha	%g4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x38, %l6
	swap	[%l7 + %l6],	%o7
	nop
	set	0x68, %o4
	std	%o4,	[%l7 + %o4]
	set	0x0D, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i0
	set	0x5C, %o5
	sta	%f21,	[%l7 + %o5] 0x89
	add	%g2,	%g1,	%l5
	nop
	set	0x28, %o0
	std	%f8,	[%l7 + %o0]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xca
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	or	%g3,	%g6,	%i7
	set	0x3C, %l5
	stwa	%o3,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x2E, %i1
	stb	%i5,	[%l7 + %i1]
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%l0
	bl	%icc,	loop_10
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%i2
	set	0x58, %i6
	stwa	%l4,	[%l7 + %i6] 0x88
loop_10:
	ld	[%l7 + 0x0C],	%f3
	nop
	set	0x0E, %i0
	sth	%l2,	[%l7 + %i0]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%g7
	and	%i3,	%l6,	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x1C, %o6
	lduw	[%l7 + %o6],	%l1
	nop
	set	0x63, %o1
	ldstub	[%l7 + %o1],	%i1
	set	0x18, %l2
	stxa	%o6,	[%l7 + %l2] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x18]
	set	0x10, %o3
	stda	%o4,	[%l7 + %o3] 0xe3
	membar	#Sync
	fpsub16	%f6,	%f16,	%f2
	nop
	set	0x4F, %l0
	stb	%l3,	[%l7 + %l0]
	nop
	set	0x66, %i2
	stb	%o1,	[%l7 + %i2]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xda
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x21, %g7
	ldsb	[%l7 + %g7],	%g5
	or	%o5,	%o7,	%g2
	nop
	set	0x5D, %i4
	ldstub	[%l7 + %i4],	%g1
	fpsub16	%f10,	%f0,	%f10
	ba,a	%icc,	loop_11
	ld	[%l7 + 0x64],	%f19
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%i0
	add	%g3,	%l5,	%i7
loop_11:
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%g6
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o3
	nop
	set	0x70, %l1
	ldsh	[%l7 + %l1],	%i2
	set	0x4C, %g4
	stwa	%l4,	[%l7 + %g4] 0x80
	set	0x24, %g3
	swapa	[%l7 + %g3] 0x89,	%l2
	nop
	set	0x5C, %g5
	ldsw	[%l7 + %g5],	%l0
	bleu	%icc,	loop_12
	nop
	set	0x20, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x50, %o4
	std	%f16,	[%l7 + %o4]
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%g6
loop_12:
	nop
	set	0x60, %o5
	sta	%f11,	[%l7 + %o5] 0x88
	nop
	set	0x26, %o0
	ldub	[%l7 + %o0],	%i6
	nop
	set	0x52, %i7
	sth	%l6,	[%l7 + %i7]
	nop
	set	0x20, %i5
	stx	%o2,	[%l7 + %i5]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f8
	nop
	set	0x6D, %l6
	ldstub	[%l7 + %l6],	%i4
	nop
	set	0x28, %g6
	ldsw	[%l7 + %g6],	%o0
	nop
	set	0x40, %l4
	ldsh	[%l7 + %l4],	%l1
	nop
	set	0x6E, %i6
	ldub	[%l7 + %i6],	%i3
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%i1
	nop
	set	0x60, %i1
	ldx	[%l7 + %i1],	%o4
	set	0x20, %o1
	stda	%l2,	[%l7 + %o1] 0x80
	set	0x64, %l2
	lda	[%l7 + %l2] 0x89,	%f11
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%o1
	nop
	set	0x7A, %o6
	sth	%g4,	[%l7 + %o6]
	nop
	set	0x10, %i2
	ldsh	[%l7 + %i2],	%g5
	set	0x1E, %o7
	stha	%o5,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x5C, %i3
	stb	%o6,	[%l7 + %i3]
	add	%g2,	%g1,	%o7
	nop
	set	0x30, %g7
	stx	%g3,	[%l7 + %g7]
	set	0x6C, %i4
	swapa	[%l7 + %i4] 0x88,	%l5
	st	%f5,	[%l7 + 0x5C]
	set	0x3C, %l0
	swapa	[%l7 + %l0] 0x80,	%i7
	set	0x48, %o2
	stda	%g6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x08, %l3
	stda	%i4,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x0A, %l1
	ldsb	[%l7 + %l1],	%i0
	nop
	set	0x64, %g4
	ldsh	[%l7 + %g4],	%o3
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%l4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x20, %g2
	stw	%l2,	[%l7 + %g2]
	st	%f1,	[%l7 + 0x78]
	set	0x60, %g3
	stda	%i2,	[%l7 + %g3] 0x88
	nop
	set	0x54, %g1
	stw	%g7,	[%l7 + %g1]
	nop
	set	0x08, %o4
	ldsb	[%l7 + %o4],	%i6
	st	%f7,	[%l7 + 0x34]
	nop
	set	0x70, %o5
	swap	[%l7 + %o5],	%l0
	set	0x60, %i7
	lda	[%l7 + %i7] 0x89,	%f31
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f16
	set	0x14, %l5
	swapa	[%l7 + %l5] 0x88,	%o2
	nop
	set	0x78, %o0
	stb	%l6,	[%l7 + %o0]
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x80,	 2
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%o0
	nop
	set	0x14, %l4
	lduw	[%l7 + %l4],	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%i1
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	set	0x48, %i6
	sta	%f11,	[%l7 + %i6] 0x88
	set	0x20, %i1
	stxa	%l3,	[%l7 + %i1] 0x81
	bne,pt	%xcc,	loop_13
	nop
	set	0x28, %o1
	stw	%o1,	[%l7 + %o1]
	set	0x16, %l2
	stha	%g4,	[%l7 + %l2] 0xe3
	membar	#Sync
loop_13:
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%g5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%o6
	fpsub32s	%f25,	%f2,	%f4
	nop
	set	0x1C, %o3
	stw	%o4,	[%l7 + %o3]
	set	0x10, %i2
	stda	%g2,	[%l7 + %i2] 0x81
	set	0x48, %o7
	stxa	%o7,	[%l7 + %o7] 0x88
	set	0x10, %i3
	lda	[%l7 + %i3] 0x81,	%f17
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xe2,	%g2
	set	0x3C, %g7
	swapa	[%l7 + %g7] 0x80,	%g1
	set	0x24, %l0
	stha	%i7,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%g6
	set	0x60, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	set	0x20, %l3
	stda	%i4,	[%l7 + %l3] 0x80
	bn,pn	%icc,	loop_14
	nop
	set	0x30, %g5
	std	%f0,	[%l7 + %g5]
	ld	[%l7 + 0x6C],	%f3
	set	0x38, %g4
	stwa	%o3,	[%l7 + %g4] 0xea
	membar	#Sync
loop_14:
	nop
	set	0x08, %g3
	stx	%i0,	[%l7 + %g3]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%l2
	nop
	set	0x39, %g2
	ldstub	[%l7 + %g2],	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x70, %o5
	lduw	[%l7 + %o5],	%i6
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x88,	%l0
	or	%o2,	%i4,	%o0
	set	0x0F, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i3
	nop
	set	0x44, %i5
	sth	%l1,	[%l7 + %i5]
	add	%i1,	%l6,	%o1
	set	0x64, %o0
	stwa	%g4,	[%l7 + %o0] 0x80
	wr	%l3,	%g5,	%ccr
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x60, %l6
	ldxa	[%l7 + %l6] 0x88,	%o5
	set	0x18, %l4
	sta	%f0,	[%l7 + %l4] 0x88
	add	%o6,	%o4,	%o7
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x80,	 2
	nop
	set	0x18, %i0
	std	%f28,	[%l7 + %i0]
	nop
	set	0x38, %i6
	sth	%g1,	[%l7 + %i6]
	nop
	set	0x58, %o1
	std	%f2,	[%l7 + %o1]
	nop
	set	0x48, %i1
	ldstub	[%l7 + %i1],	%i7
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x80,	%g6
	nop
	set	0x08, %o3
	stw	%l5,	[%l7 + %o3]
	nop
	set	0x2E, %i2
	ldsb	[%l7 + %i2],	%g3
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x80,	 3
	set	0x18, %o7
	stxa	%i0,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd0,	%f16
	nop
	set	0x50, %g7
	stx	%l2,	[%l7 + %g7]
	fpsub32	%f0,	%f26,	%f12
	and	%l4,	%o3,	%g7
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%l0
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x80,	 1
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x88,	%i4
	set	0x1C, %o2
	stwa	%o0,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x08, %l1
	stxa	%o2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x74, %l3
	swap	[%l7 + %l3],	%i3
	nop
	set	0x52, %g4
	stb	%l1,	[%l7 + %g4]
	nop
	set	0x74, %g3
	ldsw	[%l7 + %g3],	%i1
	nop
	set	0x1A, %g5
	lduh	[%l7 + %g5],	%o1
	nop
	set	0x18, %g2
	swap	[%l7 + %g2],	%l6
	nop
	set	0x78, %o5
	lduw	[%l7 + %o5],	%l3
	nop
	set	0x78, %g1
	std	%f6,	[%l7 + %g1]
	nop
	set	0x6E, %o4
	sth	%g5,	[%l7 + %o4]
	or	%g4,	%o6,	%o5
	set	0x76, %i7
	stha	%o7,	[%l7 + %i7] 0x89
	set	0x24, %i5
	swapa	[%l7 + %i5] 0x89,	%g2
	nop
	set	0x24, %g6
	lduw	[%l7 + %g6],	%g1
	nop
	set	0x3C, %o0
	stw	%i7,	[%l7 + %o0]
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	nop
	set	0x30, %l4
	ldsb	[%l7 + %l4],	%o4
	nop
	set	0x68, %i0
	swap	[%l7 + %i0],	%g3
	nop
	set	0x0C, %l5
	stw	%l5,	[%l7 + %l5]
	nop
	set	0x34, %o1
	swap	[%l7 + %o1],	%i5
	set	0x73, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l2
	nop
	set	0x2C, %i6
	stb	%l4,	[%l7 + %i6]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc8
	set	0x56, %i2
	stha	%i0,	[%l7 + %i2] 0x80
	nop
	set	0x78, %o6
	std	%o2,	[%l7 + %o6]
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%g6
	nop
	set	0x64, %l2
	ldstub	[%l7 + %l2],	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i4
	fpadd16	%f22,	%f18,	%f4
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	fpadd32	%f20,	%f18,	%f28
	set	0x58, %i3
	stha	%i6,	[%l7 + %i3] 0x88
	nop
	set	0x1D, %l0
	ldsb	[%l7 + %l0],	%o2
	nop
	set	0x50, %i4
	lduh	[%l7 + %i4],	%o0
	and	%l1,	%i3,	%i1
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%l6
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xeb,	%o0
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%l2
	bn,a	%icc,	loop_15
	nop
	set	0x29, %l3
	ldsb	[%l7 + %l3],	%g5
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	bleu,a	%xcc,	loop_16
loop_15:
	nop
	set	0x4D, %g5
	ldsb	[%l7 + %g5],	%g4
	nop
	set	0x0E, %g2
	sth	%o5,	[%l7 + %g2]
	set	0x38, %g1
	stxa	%o6,	[%l7 + %g1] 0xe2
	membar	#Sync
loop_16:
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%g2
	nop
	set	0x60, %i7
	std	%o6,	[%l7 + %i7]
	nop
	set	0x28, %i5
	stx	%g1,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x20]
	set	0x28, %g6
	sta	%f24,	[%l7 + %g6] 0x88
	nop
	set	0x66, %o5
	ldstub	[%l7 + %o5],	%g6
	nop
	set	0x78, %l6
	stx	%o4,	[%l7 + %l6]
	nop
	set	0x7C, %o0
	prefetch	[%l7 + %o0],	 1
	st	%f6,	[%l7 + 0x08]
	set	0x5C, %l4
	swapa	[%l7 + %l4] 0x89,	%i7
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x81,	%l5
	set	0x40, %l5
	stda	%i4,	[%l7 + %l5] 0x80
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%g2
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%l2
	nop
	set	0x24, %i6
	ldsh	[%l7 + %i6],	%l4
	or	%o3,	%g7,	%i0
	be	%xcc,	loop_17
	nop
	set	0x3C, %i2
	ldsb	[%l7 + %i2],	%l0
	nop
	set	0x0F, %o6
	ldub	[%l7 + %o6],	%i2
	set	0x54, %o3
	stha	%i4,	[%l7 + %o3] 0xe3
	membar	#Sync
loop_17:
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%f8
	set	0x66, %o7
	stha	%i6,	[%l7 + %o7] 0x81
	fpadd32s	%f9,	%f17,	%f25
	nop
	set	0x5B, %g7
	stb	%o0,	[%l7 + %g7]
	nop
	set	0x10, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x68, %i4
	swapa	[%l7 + %i4] 0x89,	%l1
	nop
	set	0x78, %l0
	std	%f14,	[%l7 + %l0]
	nop
	set	0x6F, %l1
	ldstub	[%l7 + %l1],	%o2
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f24
	nop
	set	0x2D, %o2
	ldub	[%l7 + %o2],	%i3
	bne	%xcc,	loop_18
	or	%l6,	%i1,	%l3
	nop
	set	0x78, %g3
	stx	%g5,	[%l7 + %g3]
	nop
	set	0x68, %g5
	prefetch	[%l7 + %g5],	 0
loop_18:
	nop
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x80,	%o1
	nop
	set	0x64, %g2
	stw	%g4,	[%l7 + %g2]
	set	0x6C, %g1
	stwa	%o6,	[%l7 + %g1] 0xe3
	membar	#Sync
	ba,a,pt	%xcc,	loop_19
	or	%g2,	%o5,	%o7
	st	%f15,	[%l7 + 0x1C]
	ld	[%l7 + 0x44],	%f29
loop_19:
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%g0
	nop
	set	0x5A, %i5
	lduh	[%l7 + %i5],	%g6
	nop
	set	0x1F, %g6
	ldub	[%l7 + %g6],	%o4
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x28, %l6
	stx	%l5,	[%l7 + %l6]
	or	%i5,	%g3,	%l2
	add	%l4,	%o3,	%i7
	nop
	set	0x40, %o0
	swap	[%l7 + %o0],	%i0
	and	%l0,	%i2,	%g7
	set	0x30, %o5
	stxa	%i6,	[%l7 + %o5] 0x89
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%o0
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x81,	%l1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x81,	%i4
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x80,	%o2
	nop
	set	0x63, %i1
	ldsb	[%l7 + %i1],	%l6
	set	0x40, %i2
	stwa	%i1,	[%l7 + %i2] 0xeb
	membar	#Sync
	ld	[%l7 + 0x3C],	%f13
	nop
	set	0x1E, %o6
	stb	%l3,	[%l7 + %o6]
	nop
	set	0x44, %i6
	lduh	[%l7 + %i6],	%i3
	nop
	set	0x15, %l2
	ldsb	[%l7 + %l2],	%g5
	nop
	set	0x7C, %o7
	stw	%g4,	[%l7 + %o7]
	nop
	set	0x2C, %g7
	ldsw	[%l7 + %g7],	%o1
	nop
	set	0x30, %o3
	std	%f2,	[%l7 + %o3]
	nop
	set	0x6F, %i3
	ldsb	[%l7 + %i3],	%g2
	nop
	set	0x78, %l0
	ldsh	[%l7 + %l0],	%o5
	st	%fsr,	[%l7 + 0x1C]
	set	0x16, %l1
	stha	%o7,	[%l7 + %l1] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x52, %g4
	lduh	[%l7 + %g4],	%g1
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x89,	%g6
	nop
	set	0x49, %o2
	stb	%o4,	[%l7 + %o2]
	set	0x1C, %g3
	swapa	[%l7 + %g3] 0x88,	%o6
	nop
	set	0x3C, %l3
	swap	[%l7 + %l3],	%i5
	ld	[%l7 + 0x28],	%f5
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%l5
	set	0x10, %g5
	ldda	[%l7 + %g5] 0x80,	%l2
	bne	%icc,	loop_20
	nop
	set	0x58, %o4
	ldsw	[%l7 + %o4],	%l4
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	or	%g3,	%i7,	%o3
loop_20:
	nop
	set	0x28, %g6
	prefetcha	[%l7 + %g6] 0x80,	 2
	set	0x10, %g1
	ldxa	[%l7 + %g1] 0x89,	%i0
	nop
	set	0x08, %l6
	swap	[%l7 + %l6],	%i2
	fpadd32	%f16,	%f6,	%f16
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f30
	nop
	set	0x48, %o5
	ldx	[%l7 + %o5],	%i6
	or	%o0,	%g7,	%i4
	nop
	set	0x08, %i0
	ldsw	[%l7 + %i0],	%o2
	ba,pn	%icc,	loop_21
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%l0
	set	0x49, %l4
	ldstuba	[%l7 + %l4] 0x89,	%l6
loop_21:
	nop
	set	0x79, %l5
	stba	%l3,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x89,	%o5
	set	0x60, %i6
	stwa	%o7,	[%l7 + %i6] 0x81
	set	0x10, %l2
	stxa	%g1,	[%l7 + %l2] 0x80
	nop
	set	0x5A, %o6
	ldsh	[%l7 + %o6],	%g6
	add	%g2,	%o4,	%i5
	set	0x10, %o7
	stda	%o6,	[%l7 + %o7] 0x88
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x88,	 1
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x88,	 1
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xea,	%l4
	nop
	set	0x5A, %l1
	ldub	[%l7 + %l1],	%i7
	nop
	set	0x2D, %i3
	ldsb	[%l7 + %i3],	%g3
	nop
	set	0x6C, %i4
	ldsh	[%l7 + %i4],	%l0
	nop
	set	0x6E, %o2
	sth	%i0,	[%l7 + %o2]
	set	0x10, %g3
	swapa	[%l7 + %g3] 0x88,	%o3
	be,a,pt	%xcc,	loop_22
	nop
	set	0x68, %g4
	ldsh	[%l7 + %g4],	%i6
	nop
	set	0x5F, %l3
	ldub	[%l7 + %l3],	%i2
	nop
	set	0x69, %g5
	ldstub	[%l7 + %g5],	%o0
loop_22:
	nop
	set	0x48, %o4
	stx	%g7,	[%l7 + %o4]
	nop
	set	0x24, %i5
	lduw	[%l7 + %i5],	%i4
	set	0x48, %g6
	sta	%f9,	[%l7 + %g6] 0x80
	or	%l1,	%l6,	%o2
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f20
	set	0x40, %g2
	stda	%i0,	[%l7 + %g2] 0xe3
	membar	#Sync
	bne,a	%xcc,	loop_23
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x47, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g5
loop_23:
	wr	%i3,	%o1,	%pic
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o5
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x81,	%l3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f16
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x65, %l5
	stba	%g1,	[%l7 + %l5] 0x88
	st	%f27,	[%l7 + 0x44]
	wr	%g6,	%o7,	%clear_softint
	nop
	set	0x21, %l6
	ldsb	[%l7 + %l6],	%o4
	st	%fsr,	[%l7 + 0x0C]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd2,	%f16
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f28
	st	%f11,	[%l7 + 0x68]
	nop
	set	0x4C, %i6
	swap	[%l7 + %i6],	%i5
	set	0x28, %l2
	stwa	%g2,	[%l7 + %l2] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%l5
	and	%l2,	%i7,	%g3
	nop
	set	0x20, %i1
	ldx	[%l7 + %i1],	%l0
	set	0x58, %o6
	stda	%l4,	[%l7 + %o6] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%i6
	nop
	set	0x58, %o7
	std	%f20,	[%l7 + %o7]
	wr	%i2,	%o3,	%set_softint
	nop
	set	0x4D, %o3
	ldsb	[%l7 + %o3],	%o0
	set	0x5C, %g7
	swapa	[%l7 + %g7] 0x81,	%i4
	or	%g7,	%l6,	%o2
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%f2
	or	%i1,	%g5,	%i3
	ba,a	%icc,	loop_24
	nop
	set	0x0C, %l0
	stw	%o1,	[%l7 + %l0]
	nop
	set	0x76, %i3
	ldsb	[%l7 + %i3],	%l1
	set	0x64, %i4
	stwa	%o5,	[%l7 + %i4] 0x89
loop_24:
	bge,a,pt	%xcc,	loop_25
	ld	[%l7 + 0x4C],	%f23
	nop
	set	0x2A, %g3
	sth	%g4,	[%l7 + %g3]
	st	%f13,	[%l7 + 0x74]
loop_25:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%g6
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x88,	 0
	nop
	set	0x2D, %o2
	ldstub	[%l7 + %o2],	%o7
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x44, %g5
	swap	[%l7 + %g5],	%i5
	nop
	set	0x48, %l3
	std	%f4,	[%l7 + %l3]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x80
	st	%f9,	[%l7 + 0x4C]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%l5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%g3
	set	0x2C, %i5
	lda	[%l7 + %i5] 0x81,	%f21
	nop
	set	0x48, %g6
	std	%l2,	[%l7 + %g6]
	nop
	set	0x18, %g1
	std	%f2,	[%l7 + %g1]
	nop
	set	0x54, %g2
	ldsh	[%l7 + %g2],	%l0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f26
	nop
	set	0x20, %i0
	swap	[%l7 + %i0],	%i0
	add	%l4,	%i2,	%i6
	add	%o0,	%i4,	%o3
	st	%fsr,	[%l7 + 0x28]
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f0
	set	0x50, %o0
	stda	%g6,	[%l7 + %o0] 0x80
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd0,	%f16
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x88,	%l6
	nop
	set	0x38, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x50, %i6
	stx	%i1,	[%l7 + %i6]
	set	0x38, %l2
	stwa	%o2,	[%l7 + %l2] 0x80
	nop
	set	0x6C, %i1
	ldub	[%l7 + %i1],	%g5
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x48, %o6
	prefetch	[%l7 + %o6],	 1
	or	%o1,	%i3,	%l1
	set	0x60, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g4
	fpsub16	%f22,	%f4,	%f4
	nop
	set	0x18, %o3
	stx	%o5,	[%l7 + %o3]
	st	%f24,	[%l7 + 0x54]
	set	0x56, %g7
	stha	%g6,	[%l7 + %g7] 0x81
	set	0x68, %l1
	stxa	%l3,	[%l7 + %l1] 0xe2
	membar	#Sync
	st	%f13,	[%l7 + 0x3C]
	nop
	set	0x34, %o7
	lduh	[%l7 + %o7],	%o7
	st	%fsr,	[%l7 + 0x40]
	set	0x2C, %l0
	ldstuba	[%l7 + %l0] 0x89,	%o4
	set	0x20, %i3
	stda	%g2,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x08, %i4
	lda	[%l7 + %i4] 0x88,	%f22
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%g1
	set	0x08, %g3
	stda	%l4,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x28, %g4
	stw	%o6,	[%l7 + %g4]
	nop
	set	0x0E, %o2
	ldsh	[%l7 + %o2],	%g3
	or	%i7,	%l2,	%l0
	nop
	set	0x18, %l3
	ldx	[%l7 + %l3],	%i0
	set	0x0B, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i2
	bne	%icc,	loop_26
	wr	%i6,	%l4,	%set_softint
	st	%fsr,	[%l7 + 0x60]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o3
loop_26:
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%g7
	and	%i4,	%l6,	%i1
	add	%o2,	%o1,	%i3
	fpadd16	%f4,	%f0,	%f8
	set	0x24, %g6
	lda	[%l7 + %g6] 0x80,	%f21
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc4
	set	0x10, %g2
	stha	%l1,	[%l7 + %g2] 0x89
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f6
	and	%g5,	%g4,	%o5
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x48, %i7
	stda	%g6,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x13, %l4
	ldstub	[%l7 + %l4],	%o7
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f0
	st	%f11,	[%l7 + 0x20]
	and	%l3,	%g2,	%o4
	nop
	set	0x42, %l5
	ldsh	[%l7 + %l5],	%g1
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x81,	%l5
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%o6
	nop
	set	0x2E, %o1
	ldsh	[%l7 + %o1],	%g3
	nop
	set	0x58, %l2
	stx	%i7,	[%l7 + %l2]
	st	%f14,	[%l7 + 0x38]
	set	0x28, %i6
	stxa	%i5,	[%l7 + %i6] 0x89
	st	%f10,	[%l7 + 0x6C]
	nop
	set	0x79, %o6
	ldub	[%l7 + %o6],	%l0
	nop
	set	0x08, %l6
	stw	%l2,	[%l7 + %l6]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%i2
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	nop
	set	0x08, %o3
	lduw	[%l7 + %o3],	%i6
	nop
	set	0x18, %l1
	std	%o0,	[%l7 + %l1]
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x80,	%l4
	nop
	set	0x50, %l0
	prefetch	[%l7 + %l0],	 2
	ld	[%l7 + 0x74],	%f1
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%o3
	and	%g7,	%l6,	%i1
	add	%i4,	%o1,	%o2
	fpsub32	%f8,	%f0,	%f20
	add	%i3,	%l1,	%g5
	set	0x5F, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g4
	nop
	set	0x70, %g7
	swap	[%l7 + %g7],	%g6
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f24
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	ld	[%l7 + 0x24],	%f6
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%o7
	nop
	set	0x4C, %o4
	swap	[%l7 + %o4],	%l3
	nop
	set	0x60, %l3
	stw	%g2,	[%l7 + %l3]
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%o4
	st	%fsr,	[%l7 + 0x2C]
	st	%f1,	[%l7 + 0x08]
	nop
	set	0x08, %i5
	ldsh	[%l7 + %i5],	%g1
	nop
	set	0x7C, %g2
	stw	%o5,	[%l7 + %g2]
	nop
	set	0x70, %g6
	ldx	[%l7 + %g6],	%o6
	nop
	set	0x33, %o5
	stb	%l5,	[%l7 + %o5]
	nop
	set	0x2A, %i7
	ldsb	[%l7 + %i7],	%g3
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc0
	set	0x2E, %o0
	stha	%i7,	[%l7 + %o0] 0x88
	nop
	set	0x50, %l4
	std	%f8,	[%l7 + %l4]
	nop
	set	0x33, %i0
	stb	%l0,	[%l7 + %i0]
	nop
	set	0x2B, %l5
	ldstub	[%l7 + %l5],	%l2
	set	0x08, %i2
	lda	[%l7 + %i2] 0x81,	%f31
	set	0x10, %l2
	stwa	%i5,	[%l7 + %l2] 0x89
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%i0
	set	0x2C, %i6
	sta	%f13,	[%l7 + %i6] 0x89
	st	%fsr,	[%l7 + 0x4C]
	set	0x5C, %l6
	lda	[%l7 + %l6] 0x81,	%f1
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x81,	%i2
	nop
	set	0x59, %o3
	ldsb	[%l7 + %o3],	%i6
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	ld	[%l7 + 0x10],	%f9
	nop
	set	0x40, %o7
	std	%f18,	[%l7 + %o7]
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x88,	%l4
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x30, %i3
	stda	%o2,	[%l7 + %i3] 0x88
	nop
	set	0x7A, %i4
	ldsh	[%l7 + %i4],	%o0
	set	0x5D, %g3
	ldstuba	[%l7 + %g3] 0x89,	%l6
	nop
	set	0x2A, %g4
	lduh	[%l7 + %g4],	%i1
	ld	[%l7 + 0x58],	%f5
	fpadd16	%f26,	%f14,	%f0
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%g6
	nop
	set	0x0C, %g7
	ldsb	[%l7 + %g7],	%o1
	nop
	set	0x68, %l3
	std	%f4,	[%l7 + %l3]
	nop
	set	0x5C, %g5
	prefetch	[%l7 + %g5],	 0
	set	0x58, %o4
	stxa	%i4,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x54, %g2
	sta	%f26,	[%l7 + %g2] 0x89
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x81,	%i2
	set	0x1C, %o5
	stha	%o2,	[%l7 + %o5] 0xe3
	membar	#Sync
	ld	[%l7 + 0x64],	%f22
	nop
	set	0x70, %i7
	std	%f18,	[%l7 + %i7]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x89
	nop
	set	0x48, %o0
	stx	%g5,	[%l7 + %o0]
	nop
	set	0x5F, %l4
	ldub	[%l7 + %l4],	%g4
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o7
	set	0x76, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g6
	set	0x4C, %l5
	sta	%f29,	[%l7 + %l5] 0x80
	nop
	set	0x08, %l2
	swap	[%l7 + %l2],	%l3
	nop
	set	0x6A, %o1
	sth	%g2,	[%l7 + %o1]
	set	0x10, %i2
	ldda	[%l7 + %i2] 0xe3,	%g0
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%o4
	nop
	set	0x74, %o6
	lduw	[%l7 + %o6],	%o5
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%l4
	and	%g3,	%i7,	%o6
	nop
	set	0x2D, %i1
	ldub	[%l7 + %i1],	%l2
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%i5
	set	0x52, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i0
	nop
	set	0x50, %l0
	ldsw	[%l7 + %l0],	%l0
	st	%fsr,	[%l7 + 0x54]
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xe3,	%i2
	wr	%l4,	%o3,	%y
	nop
	set	0x60, %i3
	prefetch	[%l7 + %i3],	 3
	set	0x10, %g3
	ldxa	[%l7 + %g3] 0x80,	%i6
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x81,	 3
	or	%o0,	%i1,	%g7
	nop
	nop
	setx	0x08A6B4DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x8139917B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f0,	%f1
	nop
	set	0x34, %i4
	ldsb	[%l7 + %i4],	%o1
	nop
	set	0x10, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x10, %g7
	stx	%i3,	[%l7 + %g7]
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%o2
	nop
	set	0x76, %l3
	ldsh	[%l7 + %l3],	%i4
	set	0x44, %o4
	ldstuba	[%l7 + %o4] 0x80,	%g4
	nop
	set	0x30, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x08, %g2
	stx	%g5,	[%l7 + %g2]
	st	%f9,	[%l7 + 0x5C]
	and	%l1,	%g6,	%l3
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x80,	%g2
	nop
	set	0x6A, %g1
	ldsh	[%l7 + %g1],	%o7
	nop
	set	0x78, %o0
	lduw	[%l7 + %o0],	%o4
	nop
	set	0x50, %l4
	ldx	[%l7 + %l4],	%o5
	set	0x08, %i5
	stda	%l4,	[%l7 + %i5] 0x88
	set	0x12, %i7
	stha	%g1,	[%l7 + %i7] 0x81
	set	0x49, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i7
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f20
	nop
	set	0x68, %l2
	std	%f10,	[%l7 + %l2]
	nop
	set	0x30, %o1
	ldx	[%l7 + %o1],	%g3
	nop
	set	0x4E, %i2
	ldstub	[%l7 + %i2],	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%i0
	nop
	set	0x30, %o6
	lduh	[%l7 + %o6],	%l0
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe2,	%i4
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%l6
	nop
	set	0x58, %i6
	stx	%o3,	[%l7 + %i6]
	nop
	set	0x68, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x4C, %l0
	sth	%o0,	[%l7 + %l0]
	set	0x76, %o3
	stba	%g7,	[%l7 + %o3] 0x88
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%o0
	set	0x30, %l1
	stwa	%i1,	[%l7 + %l1] 0xea
	membar	#Sync
	add	%o2,	%i3,	%g4
	ld	[%l7 + 0x3C],	%f31
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x89,	%g4
	or	%i4,	%l1,	%l3
	ld	[%l7 + 0x78],	%f21
	set	0x08, %i4
	stda	%g6,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x68, %o2
	ldx	[%l7 + %o2],	%g2
	nop
	set	0x44, %g7
	ldsw	[%l7 + %g7],	%o4
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x2C, %g4
	ldsh	[%l7 + %g4],	%o5
	set	0x34, %l3
	swapa	[%l7 + %l3] 0x89,	%l5
	nop
	set	0x4F, %o4
	ldsb	[%l7 + %o4],	%o7
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xe2,	%g0
	nop
	set	0x60, %g2
	std	%g2,	[%l7 + %g2]
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%l2
	nop
	set	0x18, %o5
	lduw	[%l7 + %o5],	%i7
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x80,	%i0
	nop
	set	0x48, %o0
	std	%l0,	[%l7 + %o0]
	nop
	set	0x20, %i5
	swap	[%l7 + %i5],	%o6
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x80,	%i2
	nop
	set	0x0A, %i0
	stb	%l4,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x1C]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x78, %i7
	std	%f26,	[%l7 + %i7]
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x81,	 2
	ld	[%l7 + 0x78],	%f15
	set	0x38, %o1
	sta	%f24,	[%l7 + %o1] 0x88
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o3
	nop
	set	0x50, %i2
	prefetch	[%l7 + %i2],	 1
	ld	[%l7 + 0x20],	%f16
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%i6
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%g7
	or	%o1,	%o0,	%i1
	nop
	set	0x50, %l6
	ldub	[%l7 + %l6],	%i3
	nop
	set	0x44, %i6
	swap	[%l7 + %i6],	%g4
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x80,	%o2
	nop
	set	0x5A, %l0
	lduh	[%l7 + %l0],	%g5
	nop
	set	0x2A, %o3
	lduh	[%l7 + %o3],	%i4
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%l2
	nop
	set	0x4E, %l1
	lduh	[%l7 + %l1],	%l1
	and	%g2,	%o4,	%g6
	and	%o5,	%l5,	%o7
	set	0x30, %o7
	stwa	%g1,	[%l7 + %o7] 0x89
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x6F, %i4
	ldsb	[%l7 + %i4],	%g3
	nop
	set	0x5C, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x18, %g7
	swap	[%l7 + %g7],	%l2
	nop
	set	0x14, %o2
	ldsb	[%l7 + %o2],	%i0
	wr	%i7,	%l0,	%softint
	nop
	set	0x68, %g4
	std	%i2,	[%l7 + %g4]
	nop
	set	0x5B, %l3
	ldsb	[%l7 + %l3],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%l6
	st	%fsr,	[%l7 + 0x20]
	set	0x4C, %g5
	lda	[%l7 + %g5] 0x80,	%f2
	nop
	set	0x76, %o4
	ldstub	[%l7 + %o4],	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xea,	%g6
	nop
	set	0x50, %o5
	std	%o0,	[%l7 + %o5]
	set	0x23, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o1
	fpsub32	%f22,	%f14,	%f20
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f16
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x48, %o0
	lduw	[%l7 + %o0],	%i1
	and	%g4,	%i3,	%o2
	nop
	set	0x40, %i5
	std	%i4,	[%l7 + %i5]
	set	0x0C, %i0
	lda	[%l7 + %i0] 0x80,	%f4
	wr 	%g0, 	0x5, 	%fprs
	set	0x28, %i7
	stxa	%g2,	[%l7 + %i7] 0xeb
	membar	#Sync
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%g6
	set	0x3C, %l4
	sta	%f12,	[%l7 + %l4] 0x89
	bge,a,pt	%xcc,	loop_27
	nop
	set	0x08, %l5
	ldsw	[%l7 + %l5],	%o5
	set	0x64, %o1
	stha	%l5,	[%l7 + %o1] 0xeb
	membar	#Sync
loop_27:
	nop
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x89,	%o4
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%g1
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x24]
	st	%f10,	[%l7 + 0x70]
	set	0x78, %l6
	stda	%g2,	[%l7 + %l6] 0x89
	nop
	set	0x17, %i6
	ldstub	[%l7 + %i6],	%l2
	nop
	set	0x70, %i1
	ldx	[%l7 + %i1],	%o7
	set	0x18, %o3
	lda	[%l7 + %o3] 0x80,	%f22
	nop
	set	0x60, %l0
	ldub	[%l7 + %l0],	%i7
	set	0x08, %i3
	stxa	%i0,	[%l7 + %i3] 0x80
	nop
	set	0x40, %l1
	stx	%l0,	[%l7 + %l1]
	bleu,a,pn	%icc,	loop_28
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%l4
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f6
	nop
	set	0x29, %g7
	ldub	[%l7 + %g7],	%o6
loop_28:
	nop
	set	0x14, %o2
	swapa	[%l7 + %o2] 0x81,	%l6
	st	%fsr,	[%l7 + 0x18]
	set	0x70, %g3
	stwa	%i2,	[%l7 + %g3] 0x81
	nop
	set	0x64, %l3
	swap	[%l7 + %l3],	%i6
	set	0x50, %g5
	swapa	[%l7 + %g5] 0x80,	%o3
	nop
	set	0x68, %o4
	sth	%g7,	[%l7 + %o4]
	nop
	set	0x72, %g6
	stb	%o0,	[%l7 + %g6]
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xeb,	%o0
	add	%i5,	%g4,	%i3
	set	0x10, %g4
	stwa	%o2,	[%l7 + %g4] 0xeb
	membar	#Sync
	ld	[%l7 + 0x70],	%f1
	nop
	set	0x64, %g2
	sth	%i4,	[%l7 + %g2]
	ld	[%l7 + 0x38],	%f6
	nop
	set	0x70, %o0
	ldstub	[%l7 + %o0],	%l3
	set	0x30, %g1
	stba	%l1,	[%l7 + %g1] 0x88
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%g2
	nop
	set	0x58, %i0
	prefetch	[%l7 + %i0],	 4
	set	0x30, %l4
	stda	%g4,	[%l7 + %l4] 0x88
	set	0x0D, %i7
	ldstuba	[%l7 + %i7] 0x88,	%g6
	nop
	set	0x24, %l5
	lduh	[%l7 + %l5],	%i1
	nop
	set	0x78, %o1
	ldx	[%l7 + %o1],	%l5
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%o4
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xcc
	set	0x17, %i2
	stba	%g1,	[%l7 + %i2] 0x88
	nop
	set	0x30, %l6
	swap	[%l7 + %l6],	%g3
	nop
	set	0x62, %i1
	stb	%o5,	[%l7 + %i1]
	set	0x60, %o3
	stda	%o6,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x08, %i6
	ldsw	[%l7 + %i6],	%i7
	nop
	set	0x5B, %i3
	stb	%i0,	[%l7 + %i3]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%l0
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x81,	%o6
	nop
	set	0x11, %l1
	stb	%l4,	[%l7 + %l1]
	nop
	set	0x72, %i4
	sth	%i2,	[%l7 + %i4]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%o3
	nop
	nop
	setx	0xFCCC96E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x2B2058FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f26,	%f10
	nop
	set	0x6D, %o7
	ldsb	[%l7 + %o7],	%l6
	nop
	set	0x10, %g7
	std	%f14,	[%l7 + %g7]
	st	%f10,	[%l7 + 0x3C]
	ld	[%l7 + 0x20],	%f28
	set	0x6C, %o2
	sta	%f19,	[%l7 + %o2] 0x81
	set	0x10, %l3
	lda	[%l7 + %l3] 0x88,	%f12
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%g6
	nop
	set	0x08, %o4
	prefetch	[%l7 + %o4],	 2
	set	0x78, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0
	set	0x10, %o5
	swapa	[%l7 + %o5] 0x80,	%o0
	nop
	set	0x70, %g5
	sth	%g4,	[%l7 + %g5]
	set	0x1D, %g4
	stba	%i5,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x5D, %o0
	ldstub	[%l7 + %o0],	%o2
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x72, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%l1
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xe2,	%l2
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%g6
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x89,	%l5
	nop
	set	0x48, %l4
	ldd	[%l7 + %l4],	%o4
	nop
	set	0x48, %l5
	sth	%g1,	[%l7 + %l5]
	nop
	set	0x49, %o1
	ldstub	[%l7 + %o1],	%i1
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%g3
	nop
	set	0x44, %l2
	lduw	[%l7 + %l2],	%o7
	and	%i7,	%o5,	%l2
	nop
	set	0x30, %i2
	std	%i0,	[%l7 + %i2]
	nop
	set	0x20, %i1
	stx	%o6,	[%l7 + %i1]
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xe3,	%l4
	st	%fsr,	[%l7 + 0x70]
	set	0x7C, %i6
	stwa	%l0,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc4
	nop
	set	0x54, %i3
	prefetch	[%l7 + %i3],	 3
	wr	%i6,	%o3,	%softint
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	set	0x28, %i4
	stda	%i2,	[%l7 + %i4] 0x80
	add	%g7,	%o1,	%o0
	nop
	nop
	setx	0x708C66AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x11FACD91,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f14,	%f6
	nop
	set	0x38, %l1
	std	%f30,	[%l7 + %l1]
	nop
	set	0x2C, %o7
	ldsh	[%l7 + %o7],	%g4
	fpadd32s	%f22,	%f0,	%f4
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%i4
	set	0x2C, %g7
	sta	%f10,	[%l7 + %g7] 0x80
	ba,pn	%icc,	loop_29
	nop
	set	0x5C, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x5C, %g3
	sta	%f3,	[%l7 + %g3] 0x81
loop_29:
	nop
	set	0x42, %o4
	stba	%o2,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x24, %g6
	stwa	%i3,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x2C, %g5
	sth	%l6,	[%l7 + %g5]
	set	0x60, %g4
	stda	%l0,	[%l7 + %g4] 0x80
	set	0x08, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	nop
	set	0x5A, %o0
	lduh	[%l7 + %o0],	%i4
	set	0x78, %g1
	stxa	%g2,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x0E, %i5
	stb	%g5,	[%l7 + %i5]
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xe2,	%g6
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%o4
	nop
	set	0x10, %l4
	prefetch	[%l7 + %l4],	 3
	set	0x30, %i7
	prefetcha	[%l7 + %i7] 0x80,	 2
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f20
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f16
	nop
	set	0x12, %l2
	stb	%l5,	[%l7 + %l2]
	nop
	set	0x48, %l5
	stb	%i1,	[%l7 + %l5]
	nop
	set	0x54, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%o7
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%f20
	set	0x58, %l6
	lda	[%l7 + %l6] 0x81,	%f7
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x81,	%g3
	set	0x20, %l0
	ldda	[%l7 + %l0] 0x88,	%o4
	nop
	set	0x57, %i4
	ldub	[%l7 + %i4],	%i7
	nop
	set	0x74, %i3
	lduh	[%l7 + %i3],	%i0
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%l2
	st	%f26,	[%l7 + 0x50]
	nop
	set	0x5C, %o7
	prefetch	[%l7 + %o7],	 4
	set	0x74, %g7
	lda	[%l7 + %g7] 0x89,	%f9
	nop
	set	0x08, %o2
	stx	%o6,	[%l7 + %o2]
	nop
	set	0x4F, %l3
	ldub	[%l7 + %l3],	%l4
	nop
	nop
	setx	0x350851BC9422449E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x62495FCAAC1D651A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f30,	%f24
	fpsub32	%f0,	%f30,	%f0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f0
	fpadd32s	%f10,	%f26,	%f17
	st	%fsr,	[%l7 + 0x20]
	set	0x28, %g6
	sta	%f27,	[%l7 + %g6] 0x81
	nop
	set	0x10, %g3
	std	%f0,	[%l7 + %g3]
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x38, %o0
	ldsw	[%l7 + %o0],	%i6
	ld	[%l7 + 0x0C],	%f4
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x1C, %i5
	swapa	[%l7 + %i5] 0x81,	%l0
	nop
	set	0x46, %g1
	ldstub	[%l7 + %g1],	%i2
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%g7
	and	%o3,	%o0,	%o1
	or	%i5,	%o2,	%g4
	fpsub16	%f14,	%f4,	%f4
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x54, %l4
	stba	%i3,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%l6
	bge,a,pn	%icc,	loop_30
	bne,pt	%icc,	loop_31
	st	%f14,	[%l7 + 0x08]
	set	0x28, %o6
	stha	%l1,	[%l7 + %o6] 0xeb
	membar	#Sync
loop_30:
	nop
	set	0x28, %i7
	lda	[%l7 + %i7] 0x80,	%f12
loop_31:
	nop
	set	0x74, %l2
	stw	%l3,	[%l7 + %l2]
	nop
	set	0x10, %i1
	std	%i4,	[%l7 + %i1]
	set	0x34, %l5
	stha	%g2,	[%l7 + %l5] 0x88
	nop
	set	0x32, %i2
	ldub	[%l7 + %i2],	%g6
	nop
	set	0x5A, %l6
	sth	%g5,	[%l7 + %l6]
	nop
	set	0x78, %i6
	stx	%g1,	[%l7 + %i6]
	nop
	set	0x64, %l0
	lduh	[%l7 + %l0],	%l5
	set	0x44, %o3
	sta	%f2,	[%l7 + %o3] 0x88
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
	and	%o4,	%o7,	%i1
	nop
	set	0x28, %i3
	std	%f10,	[%l7 + %i3]
	set	0x78, %l1
	stda	%g2,	[%l7 + %l1] 0x81
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%i6
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%i0
	set	0x1C, %g7
	stwa	%o6,	[%l7 + %g7] 0x89
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f20
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l4
	set	0x08, %g6
	lda	[%l7 + %g6] 0x89,	%f10
	set	0x48, %o4
	stwa	%i6,	[%l7 + %o4] 0x81
	add	%i2,	%g7,	%l0
	nop
	set	0x4E, %g5
	ldstub	[%l7 + %g5],	%o0
	nop
	set	0x78, %o5
	ldx	[%l7 + %o5],	%o1
	ld	[%l7 + 0x7C],	%f23
	nop
	set	0x70, %o0
	std	%f6,	[%l7 + %o0]
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%o3
	nop
	set	0x60, %i5
	stw	%i5,	[%l7 + %i5]
	nop
	nop
	setx	0x60AE5EF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xFD7168AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f14,	%f27
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f16
	and	%g4,	%i3,	%o2
	nop
	set	0x40, %g1
	std	%f4,	[%l7 + %g1]
	nop
	set	0x38, %i0
	stw	%l1,	[%l7 + %i0]
	ld	[%l7 + 0x14],	%f8
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x20, %l4
	std	%f6,	[%l7 + %l4]
	fpadd16	%f0,	%f20,	%f10
	nop
	set	0x53, %o1
	ldstub	[%l7 + %o1],	%l3
	st	%fsr,	[%l7 + 0x64]
	fpadd16s	%f26,	%f23,	%f0
	and	%l6,	%i4,	%g6
	or	%g2,	%g5,	%l5
	nop
	set	0x0E, %o6
	sth	%g1,	[%l7 + %o6]
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
	st	%f18,	[%l7 + 0x70]
	or	%o4,	%g3,	%i7
	nop
	set	0x18, %l2
	swap	[%l7 + %l2],	%o5
	nop
	set	0x68, %i1
	ldsw	[%l7 + %i1],	%i1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%i0
	nop
	set	0x0F, %l5
	ldub	[%l7 + %l5],	%l4
	add	%i6,	%l2,	%i2
	set	0x5B, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l0
	nop
	set	0x40, %i2
	std	%f14,	[%l7 + %i2]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf0
	membar	#Sync
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%f20
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x76, %i3
	ldsh	[%l7 + %i3],	%g7
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%o1
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%o3
	set	0x6E, %o2
	stba	%o0,	[%l7 + %o2] 0x80
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x80,	%g4
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x81,	 4
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xea,	%i4
	nop
	set	0x70, %l3
	ldx	[%l7 + %l3],	%o2
	st	%f14,	[%l7 + 0x3C]
	nop
	set	0x4C, %g5
	stw	%l3,	[%l7 + %g5]
	ld	[%l7 + 0x60],	%f22
	add	%l6,	%i4,	%g6
	set	0x08, %o4
	ldxa	[%l7 + %o4] 0x88,	%l1
	nop
	set	0x40, %o5
	lduw	[%l7 + %o5],	%g5
	nop
	set	0x74, %o0
	stb	%l5,	[%l7 + %o0]
	add	%g2,	%g1,	%o4
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%g3
	nop
	set	0x42, %i5
	ldsb	[%l7 + %i5],	%o7
	nop
	set	0x5C, %g4
	prefetch	[%l7 + %g4],	 0
	nop
	set	0x58, %i0
	stw	%i7,	[%l7 + %i0]
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xe2,	%o4
	nop
	set	0x33, %o1
	stb	%i1,	[%l7 + %o1]
	nop
	set	0x76, %o6
	sth	%i0,	[%l7 + %o6]
	nop
	set	0x78, %i7
	std	%o6,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x6C, %l2
	stw	%l4,	[%l7 + %l2]
	nop
	set	0x64, %g1
	sth	%l2,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x50]
	set	0x44, %l5
	sta	%f26,	[%l7 + %l5] 0x89
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%l0
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x80,	%f17
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%o1
	ld	[%l7 + 0x68],	%f6
	nop
	set	0x60, %i2
	std	%o2,	[%l7 + %i2]
	nop
	set	0x52, %i1
	lduh	[%l7 + %i1],	%o0
	bne,a,pt	%icc,	loop_32
	nop
	set	0x6F, %i6
	ldsb	[%l7 + %i6],	%g4
	nop
	set	0x48, %l6
	ldub	[%l7 + %l6],	%g7
	nop
	set	0x2B, %o3
	ldsb	[%l7 + %o3],	%i3
loop_32:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%i4
	set	0x6C, %l0
	sta	%f6,	[%l7 + %l0] 0x81
	set	0x70, %i4
	stha	%l6,	[%l7 + %i4] 0x88
	set	0x70, %o7
	stwa	%g6,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x64, %o2
	lda	[%l7 + %o2] 0x80,	%f16
	nop
	set	0x1A, %i3
	ldsh	[%l7 + %i3],	%g5
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x48, %l3
	stx	%l5,	[%l7 + %l3]
	nop
	set	0x5C, %g5
	lduw	[%l7 + %g5],	%g2
	or	%g1,	%o4,	%g3
	set	0x54, %o4
	lda	[%l7 + %o4] 0x80,	%f31
	set	0x29, %o5
	ldstuba	[%l7 + %o5] 0x88,	%l1
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x80,	%i7
	nop
	set	0x3E, %g3
	stb	%o7,	[%l7 + %g3]
	nop
	set	0x1A, %o0
	ldub	[%l7 + %o0],	%i1
	nop
	set	0x3C, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x52, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o5
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%o6
	nop
	set	0x11, %i0
	ldub	[%l7 + %i0],	%i0
	wr	%l4,	%l2,	%ccr
	nop
	set	0x20, %o1
	stx	%i2,	[%l7 + %o1]
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%l0
	set	0x69, %i7
	stba	%o1,	[%l7 + %i7] 0x88
	bgu,pn	%icc,	loop_33
	nop
	set	0x44, %l2
	ldsw	[%l7 + %l2],	%o3
	bne	%xcc,	loop_34
	add	%i6,	%o0,	%g7
loop_33:
	nop
	set	0x5A, %l5
	sth	%g4,	[%l7 + %l5]
	nop
	set	0x72, %g2
	lduh	[%l7 + %g2],	%i3
loop_34:
	nop
	set	0x2C, %i2
	stha	%o2,	[%l7 + %i2] 0x81
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%i4
	nop
	set	0x30, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x54, %l6
	swap	[%l7 + %l6],	%i4
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%l2
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f10
	set	0x50, %l0
	stxa	%l6,	[%l7 + %l0] 0x89
	set	0x18, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g5
	or	%g6,	%l5,	%g1
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x89,	 3
	nop
	set	0x6E, %i3
	sth	%g3,	[%l7 + %i3]
	set	0x3C, %o7
	lda	[%l7 + %o7] 0x88,	%f16
	nop
	set	0x3A, %g7
	ldsb	[%l7 + %g7],	%o4
	nop
	set	0x36, %g6
	ldsh	[%l7 + %g6],	%l1
	or	%o7,	%i1,	%o5
	st	%f12,	[%l7 + 0x2C]
	nop
	set	0x48, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x08, %o4
	stx	%o6,	[%l7 + %o4]
	nop
	set	0x48, %o5
	sth	%i0,	[%l7 + %o5]
	and	%l2,	%i2,	%l4
	set	, %g5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1296
!	Type a   	: 24
!	Type cti   	: 34
!	Type x   	: 491
!	Type f   	: 33
!	Type i   	: 122
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
.word 0xFC82D583
.word 0xECAA907C
.word 0xC9D190B2
.word 0x83B3E715
.word 0x66108A5C
.word 0xCD687985
.word 0x0CE5AD4D
.word 0xB91D20AE
.word 0x76CFEA40
.word 0xD573A6FF
.word 0xB63F3C72
.word 0x5B13C9CA
.word 0xF5772919
.word 0x89072126
.word 0x3F553855
.word 0x6A82BF80
.word 0x91A14436
.word 0xF84FAB5A
.word 0x5AAC1FD8
.word 0xD2E427D5
.word 0x6C9A11A5
.word 0x84B96F6E
.word 0x18787C91
.word 0x30F7371F
.word 0xB8EA4C97
.word 0x96FEDFA9
.word 0x829EA691
.word 0x58D297EC
.word 0x4701DF4E
.word 0xDE74EA6D
.word 0xB502720C
.word 0x4785E45E
.word 0xB388C5A3
.word 0x76C32EFC
.word 0xA598E7DD
.word 0x776F597D
.word 0xD6F941EC
.word 0x9D167358
.word 0x049787CF
.word 0x04FB7A8A
.word 0x3736E093
.word 0x9B8F242F
.word 0xB6B4F721
.word 0x8AFDE0C9
.word 0x78592537
.word 0x57731A85
.word 0x2656D9C5
.word 0x7F7F53FB
.word 0x03378840
.word 0xBEFAAAC3
.word 0xDA1637C2
.word 0x530B963A
.word 0x6AD28C2F
.word 0xDBEE7F28
.word 0x9CB5DDBA
.word 0xE20B59BE
.word 0x204CA8F4
.word 0xEBCFD0E9
.word 0xD9821B7B
.word 0x71C1A6EA
.word 0x132D316E
.word 0xD2FA073D
.word 0x4D77F407
.word 0x8CEFCB81
.end
