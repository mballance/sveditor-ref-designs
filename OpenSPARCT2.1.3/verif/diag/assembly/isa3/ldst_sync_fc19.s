/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc19.s
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
	set	0x2,	%g1
	set	0x7,	%g2
	set	0xF,	%g3
	set	0x4,	%g4
	set	0xB,	%g5
	set	0x2,	%g6
	set	0xE,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x7,	%i1
	set	-0x0,	%i2
	set	-0x9,	%i3
	set	-0x1,	%i4
	set	-0x3,	%i5
	set	-0x9,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x1678A43D,	%l0
	set	0x771D6EBD,	%l1
	set	0x638EA299,	%l2
	set	0x7CC8C69D,	%l3
	set	0x16A283E1,	%l4
	set	0x049C52EC,	%l5
	set	0x376E2EFE,	%l6
	!# Output registers
	set	0x0B30,	%o0
	set	0x17FB,	%o1
	set	-0x0CBC,	%o2
	set	-0x166D,	%o3
	set	-0x1F88,	%o4
	set	-0x0824,	%o5
	set	0x1885,	%o6
	set	0x06B7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7A6E82F120978C03)
	INIT_TH_FP_REG(%l7,%f2,0xA540338BE21A4EA5)
	INIT_TH_FP_REG(%l7,%f4,0xBFA5952632A337E7)
	INIT_TH_FP_REG(%l7,%f6,0x86B773BF98B08841)
	INIT_TH_FP_REG(%l7,%f8,0x753E5FEA210B1BE0)
	INIT_TH_FP_REG(%l7,%f10,0x6426D59D2B22177A)
	INIT_TH_FP_REG(%l7,%f12,0xF268BEB83BEFD9A1)
	INIT_TH_FP_REG(%l7,%f14,0x920FF5142571B14B)
	INIT_TH_FP_REG(%l7,%f16,0xD9F1FB81562EA0CD)
	INIT_TH_FP_REG(%l7,%f18,0x0A39C21655A65EA6)
	INIT_TH_FP_REG(%l7,%f20,0xE7FBB5806ADFF4CD)
	INIT_TH_FP_REG(%l7,%f22,0x23F4B6C5CDD90259)
	INIT_TH_FP_REG(%l7,%f24,0xD7CC5C2104CCF45F)
	INIT_TH_FP_REG(%l7,%f26,0xF8BDAEE8D74021AC)
	INIT_TH_FP_REG(%l7,%f28,0x3575CF229D722970)
	INIT_TH_FP_REG(%l7,%f30,0xC1785F31F8DE8E2A)

	!# Execute Main Diag ..

	set	0x14, %g4
	lda	[%l7 + %g4] 0x80,	%f26
	and	%l5,	%l3,	%o0
	nop
	set	0x28, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x40, %g2
	lda	[%l7 + %g2] 0x89,	%f10
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%i4
	set	0x48, %l4
	stda	%l2,	[%l7 + %l4] 0x89
	nop
	set	0x48, %g1
	std	%f28,	[%l7 + %g1]
	nop
	set	0x46, %i7
	ldub	[%l7 + %i7],	%g2
	nop
	set	0x58, %l6
	lduh	[%l7 + %l6],	%o3
	set	0x40, %o6
	lda	[%l7 + %o6] 0x89,	%f9
	st	%fsr,	[%l7 + 0x30]
	fpadd32	%f14,	%f18,	%f20
	or	%i1,	%o2,	%o7
	set	0x4C, %i6
	stha	%o5,	[%l7 + %i6] 0x81
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%i2
	nop
	set	0x20, %i1
	std	%o4,	[%l7 + %i1]
	set	0x2A, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l4
	set	0x70, %i3
	sta	%f24,	[%l7 + %i3] 0x80
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x3C, %o4
	lda	[%l7 + %o4] 0x80,	%f23
	set	0x78, %g6
	sta	%f6,	[%l7 + %g6] 0x88
	nop
	set	0x7F, %o2
	ldub	[%l7 + %o2],	%g1
	nop
	set	0x18, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x68, %g3
	stb	%i5,	[%l7 + %g3]
	nop
	set	0x7A, %i5
	ldub	[%l7 + %i5],	%g7
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%g5
	nop
	set	0x25, %l2
	ldsb	[%l7 + %l2],	%l1
	or	%o1,	%g4,	%l6
	st	%f25,	[%l7 + 0x40]
	nop
	set	0x64, %i0
	ldsb	[%l7 + %i0],	%o6
	nop
	set	0x4A, %o0
	sth	%i2,	[%l7 + %o0]
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%g6
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f16
	st	%fsr,	[%l7 + 0x1C]
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x80,	%i0
	ld	[%l7 + 0x64],	%f12
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f4
	set	0x60, %o7
	stda	%i6,	[%l7 + %o7] 0xea
	membar	#Sync
	st	%f18,	[%l7 + 0x44]
	set	0x1F, %g4
	ldstuba	[%l7 + %g4] 0x80,	%l0
	nop
	set	0x54, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x0A, %g2
	stba	%g3,	[%l7 + %g2] 0x89
	set	0x50, %l4
	sta	%f6,	[%l7 + %l4] 0x81
	set	0x10, %g1
	stda	%l2,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x6C, %l1
	sth	%o0,	[%l7 + %l1]
	set	0x18, %l6
	swapa	[%l7 + %l6] 0x88,	%l5
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc4
	nop
	set	0x3A, %i6
	ldsh	[%l7 + %i6],	%i7
	set	0x6A, %o6
	stha	%l2,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x40, %l0
	ldd	[%l7 + %l0],	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	ld	[%l7 + 0x3C],	%f30
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%o2
	bn,pt	%xcc,	loop_1
	nop
	set	0x4C, %i3
	prefetch	[%l7 + %i3],	 0
	nop
	set	0x28, %g5
	lduh	[%l7 + %g5],	%o7
	set	0x56, %o4
	stha	%o5,	[%l7 + %o4] 0xeb
	membar	#Sync
loop_1:
	nop
	set	0x0C, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x44, %i1
	sta	%f1,	[%l7 + %i1] 0x88
	or	%o3,	%i3,	%l4
	nop
	set	0x20, %o5
	std	%o4,	[%l7 + %o5]
	nop
	set	0x14, %o2
	lduw	[%l7 + %o2],	%i5
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x81,	 4
	nop
	set	0x0E, %o1
	ldsb	[%l7 + %o1],	%g5
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0
	nop
	set	0x28, %i0
	std	%o0,	[%l7 + %i0]
	and	%g1,	%g4,	%o6
	nop
	set	0x2C, %o0
	lduh	[%l7 + %o0],	%i2
	fpsub32	%f22,	%f28,	%f14
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%f9,	[%l7 + 0x64]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x89
	set	0x50, %i4
	sta	%f11,	[%l7 + %i4] 0x88
	nop
	set	0x2F, %o3
	stb	%l6,	[%l7 + %o3]
	st	%f13,	[%l7 + 0x3C]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f16
	nop
	set	0x67, %l3
	ldub	[%l7 + %l3],	%i0
	set	0x16, %g4
	ldstuba	[%l7 + %g4] 0x81,	%g6
	nop
	set	0x60, %g2
	swap	[%l7 + %g2],	%l0
	nop
	set	0x38, %g7
	lduh	[%l7 + %g7],	%g3
	nop
	set	0x34, %l4
	lduh	[%l7 + %l4],	%i6
	set	0x2C, %g1
	stwa	%l3,	[%l7 + %g1] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%i7
	fpadd16s	%f26,	%f21,	%f18
	nop
	set	0x38, %l1
	lduw	[%l7 + %l1],	%o0
	set	0x5B, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i1
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x2F, %i6
	stb	%o2,	[%l7 + %i6]
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x89,	 2
	add	%o7,	%o5,	%o3
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe3,	%i2
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x88,	 2
	nop
	set	0x1D, %i3
	ldub	[%l7 + %i3],	%i5
	set	0x38, %l0
	stwa	%l4,	[%l7 + %l0] 0x81
	set	0x20, %g5
	stxa	%g5,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x40, %g6
	stda	%l0,	[%l7 + %g6] 0x88
	set	0x0A, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g7
	nop
	set	0x18, %o5
	stx	%g1,	[%l7 + %o5]
	nop
	set	0x4C, %o2
	ldsh	[%l7 + %o2],	%o1
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%o6
	fpadd16s	%f12,	%f2,	%f6
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%g4
	nop
	set	0x30, %o4
	std	%f2,	[%l7 + %o4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f0
	nop
	set	0x28, %i5
	prefetch	[%l7 + %i5],	 3
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%l6
	bl,a,pt	%xcc,	loop_2
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 1
	ld	[%l7 + 0x78],	%f19
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x80,	%i2
loop_2:
	nop
	set	0x52, %l2
	stha	%g6,	[%l7 + %l2] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%g3
	nop
	set	0x36, %o7
	ldstub	[%l7 + %o7],	%i6
	nop
	set	0x47, %o3
	ldsb	[%l7 + %o3],	%l0
	nop
	set	0x7D, %l3
	ldsb	[%l7 + %l3],	%l3
	set	0x6C, %g2
	swapa	[%l7 + %g2] 0x88,	%l5
	ba,a,pt	%icc,	loop_3
	nop
	set	0x40, %g7
	ldstub	[%l7 + %g7],	%o0
	wr	%i4,	%i7,	%ccr
	nop
	set	0x58, %l4
	std	%f24,	[%l7 + %l4]
loop_3:
	nop
	set	0x18, %g4
	std	%f6,	[%l7 + %g4]
	and	%g2,	%i1,	%o2
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	bleu,a	%icc,	loop_4
	nop
	set	0x08, %i7
	std	%l2,	[%l7 + %i7]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x81,	%o4
loop_4:
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%f18
	and	%o3,	%i3,	%o7
	nop
	set	0x48, %o6
	std	%f20,	[%l7 + %o6]
	set	0x0C, %l5
	sta	%f19,	[%l7 + %l5] 0x88
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x88,	 3
	set	0x1C, %i3
	stwa	%l4,	[%l7 + %i3] 0x88
	nop
	set	0x68, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%g1
	st	%f28,	[%l7 + 0x38]
	wr	%o1,	%o6,	%softint
	set	0x20, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	set	0x48, %g6
	stxa	%g4,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x5C, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x80
	nop
	set	0x28, %i1
	stx	%i2,	[%l7 + %i1]
	set	0x39, %g3
	stba	%l6,	[%l7 + %g3] 0x80
	nop
	set	0x2C, %o1
	lduw	[%l7 + %o1],	%i0
	and	%g3,	%i6,	%g6
	set	0x60, %i0
	sta	%f28,	[%l7 + %i0] 0x89
	nop
	set	0x62, %o4
	lduh	[%l7 + %o4],	%l0
	set	0x78, %i5
	stda	%l2,	[%l7 + %i5] 0xe2
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i4
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f16
	nop
	set	0x18, %i2
	ldsw	[%l7 + %i2],	%o0
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f10
	set	0x6C, %i4
	swapa	[%l7 + %i4] 0x81,	%i7
	set	0x50, %o7
	stda	%g2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x60, %o3
	swap	[%l7 + %o3],	%o2
	set	0x14, %g2
	sta	%f6,	[%l7 + %g2] 0x80
	add	%l2,	%o5,	%o3
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x88,	%i1
	nop
	set	0x38, %g7
	sth	%i3,	[%l7 + %g7]
	nop
	set	0x48, %l4
	stx	%fsr,	[%l7 + %l4]
	ld	[%l7 + 0x08],	%f22
	set	0x3A, %g4
	stha	%o4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%l4
	nop
	set	0x70, %i7
	stx	%g5,	[%l7 + %i7]
	set	0x20, %g1
	stda	%o6,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x7C, %i6
	lduw	[%l7 + %i6],	%g7
	nop
	set	0x53, %o6
	ldstub	[%l7 + %o6],	%g1
	nop
	set	0x34, %l5
	stb	%o1,	[%l7 + %l5]
	ld	[%l7 + 0x50],	%f31
	set	0x53, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o6
	set	0x18, %i3
	stxa	%l1,	[%l7 + %i3] 0x89
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x50, %l0
	swap	[%l7 + %l0],	%g4
	nop
	set	0x60, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f16
	nop
	set	0x60, %i1
	ldstub	[%l7 + %i1],	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f16
	ld	[%l7 + 0x40],	%f28
	nop
	set	0x60, %o1
	ldsh	[%l7 + %o1],	%i5
	nop
	set	0x18, %i0
	stw	%i0,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x1C]
	add	%l6,	%i6,	%g6
	set	0x30, %g3
	stxa	%l0,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xda,	%f0
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x81,	%l3
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf8,	%f16
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%l5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f0
	nop
	set	0x2C, %i4
	lduw	[%l7 + %i4],	%i4
	fpsub16	%f12,	%f30,	%f16
	and	%i7,	%o0,	%g2
	nop
	set	0x3E, %o0
	ldsh	[%l7 + %o0],	%o2
	nop
	set	0x58, %o3
	stx	%l2,	[%l7 + %o3]
	nop
	set	0x68, %g2
	std	%o2,	[%l7 + %g2]
	set	0x70, %o7
	stxa	%o5,	[%l7 + %o7] 0x89
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x80,	%i3
	fpsub16	%f24,	%f22,	%f2
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%i1
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 3
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x81,	 2
	set	0x28, %i7
	stda	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%g7
	nop
	set	0x1C, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%g1
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%g4
	and	%o6,	%l1,	%o1
	set	0x48, %i3
	sta	%f11,	[%l7 + %i3] 0x81
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f16
	set	0x7D, %g5
	stba	%i2,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x7C, %g6
	swapa	[%l7 + %g6] 0x81,	%g4
	nop
	set	0x54, %l0
	lduh	[%l7 + %l0],	%i0
	set	0x08, %o2
	stxa	%l6,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x54, %i1
	swapa	[%l7 + %i1] 0x88,	%i5
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x89,	 2
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x80,	 3
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x88,	%g6
	set	0x70, %g3
	stwa	%l3,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xe3,	%l4
	set	0x20, %i2
	sta	%f11,	[%l7 + %i2] 0x89
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x58, %o4
	std	%f10,	[%l7 + %o4]
	nop
	set	0x78, %i4
	std	%i4,	[%l7 + %i4]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f16
	and	%i7,	%g3,	%o0
	set	0x24, %g2
	stwa	%o2,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x18, %o7
	lda	[%l7 + %o7] 0x89,	%f19
	set	0x2D, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd0
	nop
	set	0x50, %l4
	stx	%o3,	[%l7 + %l4]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f10
	set	0x14, %i7
	lda	[%l7 + %i7] 0x81,	%f30
	nop
	set	0x50, %l1
	swap	[%l7 + %l1],	%o5
	wr	%i3,	%i1,	%set_softint
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x89,	%f0
	nop
	set	0x40, %g1
	ldsw	[%l7 + %g1],	%o4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%l2
	or	%o7,	%l4,	%g1
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x89,	%g7
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%g5
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f0
	nop
	set	0x78, %l6
	std	%l0,	[%l7 + %l6]
	nop
	set	0x58, %g6
	swap	[%l7 + %g6],	%o1
	set	0x70, %o2
	stda	%o6,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x48, %l0
	stw	%g4,	[%l7 + %l0]
	nop
	set	0x38, %o5
	std	%i2,	[%l7 + %o5]
	st	%f12,	[%l7 + 0x7C]
	and	%l6,	%i5,	%i0
	set	0x30, %i1
	ldxa	[%l7 + %i1] 0x80,	%i6
	nop
	set	0x1E, %i0
	ldstub	[%l7 + %i0],	%l0
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf1,	%f16
	set	0x78, %o1
	lda	[%l7 + %o1] 0x81,	%f0
	set	0x54, %i5
	stba	%g6,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f16
	add	%l5,	%l3,	%i4
	fpsub16s	%f9,	%f11,	%f9
	nop
	set	0x4C, %o4
	ldsw	[%l7 + %o4],	%g3
	and	%i7,	%o2,	%o0
	set	0x30, %o0
	stwa	%o3,	[%l7 + %o0] 0x88
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f16
	nop
	set	0x78, %i4
	std	%o4,	[%l7 + %i4]
	nop
	set	0x30, %o3
	stb	%i3,	[%l7 + %o3]
	nop
	set	0x08, %l3
	std	%i0,	[%l7 + %l3]
	nop
	set	0x20, %l4
	stx	%fsr,	[%l7 + %l4]
	and	%g2,	%o4,	%l2
	set	0x32, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l4
	nop
	set	0x6F, %i7
	ldsb	[%l7 + %i7],	%g1
	nop
	set	0x2F, %l1
	ldsb	[%l7 + %l1],	%o7
	set	0x3C, %g7
	lda	[%l7 + %g7] 0x81,	%f2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%g5
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x74, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o1
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x1C, %i3
	lduh	[%l7 + %i3],	%l1
	st	%f15,	[%l7 + 0x34]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%i2
	set	0x45, %l5
	stba	%g4,	[%l7 + %l5] 0x88
	nop
	set	0x42, %g5
	ldsb	[%l7 + %g5],	%i5
	and	%i0,	%i6,	%l0
	set	0x2B, %i6
	stba	%l6,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0
	fpsub16	%f18,	%f26,	%f2
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd0
	set	0x78, %l6
	stba	%l3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x74, %o5
	lduw	[%l7 + %o5],	%i4
	or	%g3,	%i7,	%o2
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f0
	ld	[%l7 + 0x50],	%f8
	nop
	set	0x5E, %i0
	ldub	[%l7 + %i0],	%l5
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%o0
	nop
	set	0x18, %o1
	stx	%o5,	[%l7 + %o1]
	set	0x3F, %i5
	ldstuba	[%l7 + %i5] 0x88,	%o3
	and	%i1,	%i3,	%o4
	set	0x48, %g3
	lda	[%l7 + %g3] 0x80,	%f15
	or	%g2,	%l2,	%l4
	nop
	set	0x49, %l2
	ldsb	[%l7 + %l2],	%o7
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x80,	%g6
	set	0x54, %o0
	stwa	%g5,	[%l7 + %o0] 0x89
	set	0x48, %i2
	stxa	%g1,	[%l7 + %i2] 0x81
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%l0
	nop
	set	0x30, %g2
	std	%f12,	[%l7 + %g2]
	and	%o1,	%i2,	%g4
	nop
	set	0x47, %o3
	ldsb	[%l7 + %o3],	%i5
	set	0x4C, %l4
	swapa	[%l7 + %l4] 0x88,	%i0
	nop
	set	0x40, %o7
	std	%f20,	[%l7 + %o7]
	ld	[%l7 + 0x34],	%f11
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x68, %i7
	stx	%i6,	[%l7 + %i7]
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x88,	%l0
	ld	[%l7 + 0x10],	%f13
	set	0x0B, %g7
	stba	%o6,	[%l7 + %g7] 0x88
	fpadd32	%f28,	%f4,	%f30
	nop
	set	0x6F, %g4
	ldub	[%l7 + %g4],	%l6
	set	0x40, %g1
	lda	[%l7 + %g1] 0x80,	%f11
	set	0x22, %o6
	stba	%g6,	[%l7 + %o6] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i4
	nop
	set	0x70, %l3
	stx	%i7,	[%l7 + %l3]
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x88,	%g3
	ld	[%l7 + 0x0C],	%f12
	nop
	nop
	setx	0xDF90FDBC1316051C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD917EC3101D39F1D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f26,	%f0
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%o2
	set	0x10, %i6
	lda	[%l7 + %i6] 0x89,	%f31
	nop
	set	0x18, %l5
	stw	%o0,	[%l7 + %l5]
	nop
	set	0x38, %o2
	std	%l4,	[%l7 + %o2]
	nop
	set	0x58, %l6
	std	%o2,	[%l7 + %l6]
	nop
	set	0x64, %g6
	lduh	[%l7 + %g6],	%o5
	set	0x48, %o5
	stxa	%i1,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x60, %i0
	std	%o4,	[%l7 + %i0]
	nop
	set	0x60, %l0
	std	%g2,	[%l7 + %l0]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd0,	%f16
	set	0x18, %i1
	stwa	%l2,	[%l7 + %i1] 0x88
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf0
	membar	#Sync
	nop
	set	0x44, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x56, %l2
	stba	%i3,	[%l7 + %l2] 0x81
	set	0x18, %o4
	lda	[%l7 + %o4] 0x80,	%f1
	and	%l4,	%o7,	%g5
	nop
	set	0x4E, %o0
	ldub	[%l7 + %o0],	%g7
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x88,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%i2
	set	0x6C, %i4
	stba	%g4,	[%l7 + %i4] 0x89
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x0A, %l4
	stb	%o1,	[%l7 + %l4]
	nop
	set	0x33, %o3
	ldstub	[%l7 + %o3],	%i5
	nop
	set	0x6C, %o7
	stb	%i6,	[%l7 + %o7]
	set	0x74, %l1
	sta	%f26,	[%l7 + %l1] 0x80
	nop
	set	0x32, %g7
	lduh	[%l7 + %g7],	%l0
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x88,	%i0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g6
	nop
	set	0x3E, %g1
	ldsh	[%l7 + %g1],	%o6
	nop
	set	0x70, %o6
	lduh	[%l7 + %o6],	%i4
	fpsub16	%f4,	%f26,	%f30
	nop
	set	0x28, %l3
	stb	%i7,	[%l7 + %l3]
	fpadd32s	%f27,	%f19,	%f4
	nop
	set	0x6C, %i7
	prefetch	[%l7 + %i7],	 3
	and	%l3,	%g3,	%o2
	set	0x10, %i3
	prefetcha	[%l7 + %i3] 0x89,	 1
	set	0x50, %g5
	swapa	[%l7 + %g5] 0x80,	%o3
	or	%o0,	%o5,	%o4
	set	0x08, %l5
	stba	%g2,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x38, %i6
	stxa	%l2,	[%l7 + %i6] 0x89
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x20, %g6
	stha	%i1,	[%l7 + %g6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x0C, %o2
	swap	[%l7 + %o2],	%l4
	set	0x30, %i0
	ldda	[%l7 + %i0] 0xe3,	%o6
	nop
	set	0x30, %l0
	stx	%g5,	[%l7 + %l0]
	nop
	set	0x7C, %o5
	ldsw	[%l7 + %o5],	%i3
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f8
	set	0x68, %i1
	lda	[%l7 + %i1] 0x80,	%f29
	set	0x0C, %i5
	stwa	%l1,	[%l7 + %i5] 0x81
	set	0x6C, %g3
	sta	%f18,	[%l7 + %g3] 0x81
	set	0x50, %o4
	stxa	%g1,	[%l7 + %o4] 0xe2
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%g7
	nop
	set	0x4D, %l2
	ldstub	[%l7 + %l2],	%o1
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc0
	set	0x68, %i4
	lda	[%l7 + %i4] 0x89,	%f26
	nop
	set	0x0E, %g2
	sth	%g4,	[%l7 + %g2]
	set	0x60, %o0
	sta	%f19,	[%l7 + %o0] 0x88
	nop
	set	0x68, %l4
	std	%f2,	[%l7 + %l4]
	wr	%i6,	%i5,	%set_softint
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
	set	0x68, %o7
	stxa	%l0,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x42, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%i4
	nop
	set	0x0C, %g4
	sth	%i7,	[%l7 + %g4]
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x81,	 2
	st	%f11,	[%l7 + 0x54]
	nop
	set	0x35, %g7
	ldub	[%l7 + %g7],	%g3
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%g6
	nop
	set	0x12, %l3
	sth	%o3,	[%l7 + %l3]
	nop
	set	0x58, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x28, %i3
	std	%o0,	[%l7 + %i3]
	nop
	set	0x6E, %o6
	sth	%o5,	[%l7 + %o6]
	set	0x28, %g5
	lda	[%l7 + %g5] 0x88,	%f24
	nop
	set	0x10, %l5
	std	%l4,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %l6
	sta	%f17,	[%l7 + %l6] 0x81
	set	0x10, %i6
	stda	%g2,	[%l7 + %i6] 0x80
	wr	%o4,	%i1,	%y
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%l4
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%g5
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x81,	%o7
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%i3
	set	0x60, %l0
	stwa	%l1,	[%l7 + %l0] 0x80
	nop
	set	0x18, %o1
	std	%g0,	[%l7 + %o1]
	nop
	set	0x70, %i1
	ldx	[%l7 + %i1],	%g7
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%i2
	nop
	set	0x64, %i5
	ldub	[%l7 + %i5],	%o1
	and	%i6,	%g4,	%i5
	set	0x28, %o4
	swapa	[%l7 + %o4] 0x88,	%i0
	set	0x60, %l2
	stba	%l6,	[%l7 + %l2] 0x80
	set	0x62, %g3
	stha	%l0,	[%l7 + %g3] 0x81
	nop
	set	0x0C, %i2
	stw	%i4,	[%l7 + %i2]
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f0
	nop
	set	0x4C, %g2
	ldsh	[%l7 + %g2],	%o6
	set	0x28, %o0
	lda	[%l7 + %o0] 0x89,	%f1
	nop
	set	0x4F, %l4
	ldub	[%l7 + %l4],	%l3
	fpsub16s	%f21,	%f0,	%f23
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x89,	%i7
	nop
	set	0x10, %o3
	stx	%o2,	[%l7 + %o3]
	set	0x27, %l1
	stba	%g3,	[%l7 + %l1] 0x80
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%g6
	or	%o3,	%o5,	%o0
	set	0x70, %g7
	ldxa	[%l7 + %g7] 0x88,	%l5
	set	0x4C, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o4
	nop
	set	0x74, %i7
	sth	%i1,	[%l7 + %i7]
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x80,	%g2
	nop
	set	0x3A, %o6
	sth	%l4,	[%l7 + %o6]
	nop
	set	0x18, %i3
	stx	%g5,	[%l7 + %i3]
	set	0x72, %g5
	stha	%l2,	[%l7 + %g5] 0x81
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x89,	 1
	nop
	set	0x30, %l6
	stx	%i3,	[%l7 + %l6]
	and	%g1,	%l1,	%g7
	or	%o1,	%i2,	%i6
	nop
	set	0x69, %i6
	ldsb	[%l7 + %i6],	%g4
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f16
	nop
	set	0x77, %i0
	ldub	[%l7 + %i0],	%i0
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f22
	set	0x0D, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l6
	nop
	set	0x20, %g6
	ldsh	[%l7 + %g6],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i5
	fpsub16s	%f2,	%f29,	%f3
	nop
	set	0x73, %i1
	ldstub	[%l7 + %i1],	%l3
	wr	%i7,	%o6,	%pic
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%o2
	bleu	%icc,	loop_5
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f28
	ld	[%l7 + 0x18],	%f20
	set	0x48, %l2
	stda	%g2,	[%l7 + %l2] 0x81
loop_5:
	nop
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	nop
	set	0x20, %i2
	std	%g6,	[%l7 + %i2]
	set	0x74, %o4
	lda	[%l7 + %o4] 0x89,	%f11
	set	0x20, %g2
	stxa	%o0,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x40, %o0
	lduw	[%l7 + %o0],	%l5
	nop
	set	0x30, %l4
	swap	[%l7 + %l4],	%o4
	nop
	set	0x2C, %i4
	stb	%o5,	[%l7 + %i4]
	set	0x30, %o7
	stba	%g2,	[%l7 + %o7] 0x81
	bgu,a	%xcc,	loop_6
	add	%l4,	%g5,	%l2
	nop
	set	0x2A, %o3
	lduh	[%l7 + %o3],	%o7
	nop
	set	0x2C, %l1
	prefetch	[%l7 + %l1],	 2
loop_6:
	nop
	set	0x5E, %g7
	ldsh	[%l7 + %g7],	%i1
	nop
	set	0x14, %l3
	ldstub	[%l7 + %l3],	%i3
	nop
	set	0x0A, %i7
	ldub	[%l7 + %i7],	%l1
	nop
	set	0x64, %g4
	lduh	[%l7 + %g4],	%g7
	bgu,a	%xcc,	loop_7
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%o1
	set	0x1C, %i3
	stha	%g1,	[%l7 + %i3] 0x80
loop_7:
	nop
	set	0x40, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i6
	nop
	set	0x4E, %g5
	stb	%i2,	[%l7 + %g5]
	set	0x42, %l5
	stha	%i0,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x81
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f20
	nop
	set	0x30, %i0
	std	%g4,	[%l7 + %i0]
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%l6
	nop
	set	0x40, %l0
	stw	%i4,	[%l7 + %l0]
	nop
	set	0x38, %o1
	sth	%l0,	[%l7 + %o1]
	set	0x20, %g6
	stxa	%l3,	[%l7 + %g6] 0x81
	ble	%icc,	loop_8
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%i5
	nop
	set	0x14, %o5
	ldsh	[%l7 + %o5],	%i7
	ld	[%l7 + 0x10],	%f9
loop_8:
	st	%fsr,	[%l7 + 0x44]
	set	0x52, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%o6
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x88,	%g6
	set	0x26, %i2
	stba	%o0,	[%l7 + %i2] 0xe3
	membar	#Sync
	fpadd16s	%f22,	%f29,	%f16
	bg,pn	%icc,	loop_9
	nop
	set	0x1C, %l2
	swap	[%l7 + %l2],	%o3
	set	0x30, %g2
	stda	%o4,	[%l7 + %g2] 0x88
loop_9:
	nop
	set	0x3A, %o0
	ldsb	[%l7 + %o0],	%o5
	or	%g2,	%l5,	%l4
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%l2
	nop
	set	0x48, %l4
	ldstub	[%l7 + %l4],	%o7
	nop
	set	0x5C, %i4
	swap	[%l7 + %i4],	%g5
	ld	[%l7 + 0x40],	%f19
	nop
	set	0x48, %o7
	ldx	[%l7 + %o7],	%i3
	set	0x0E, %l1
	stha	%l1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x52, %o3
	lduh	[%l7 + %o3],	%i1
	nop
	set	0x7A, %l3
	ldsb	[%l7 + %l3],	%g7
	or	%o1,	%i6,	%i2
	set	0x4D, %i7
	ldstuba	[%l7 + %i7] 0x88,	%g1
	set	0x76, %g7
	ldstuba	[%l7 + %g7] 0x89,	%g4
	or	%i0,	%i4,	%l6
	wr	%l0,	%l3,	%sys_tick
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x76, %g4
	sth	%i5,	[%l7 + %g4]
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%i7
	nop
	set	0x78, %g1
	stx	%o2,	[%l7 + %g1]
	nop
	set	0x50, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%o6
	nop
	set	0x10, %o6
	stw	%g6,	[%l7 + %o6]
	nop
	set	0x18, %l6
	ldx	[%l7 + %l6],	%o0
	nop
	set	0x58, %i0
	std	%f8,	[%l7 + %i0]
	st	%f29,	[%l7 + 0x28]
	fpadd32s	%f6,	%f28,	%f31
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f8
	nop
	set	0x20, %o2
	lduh	[%l7 + %o2],	%o3
	set	0x50, %o1
	ldda	[%l7 + %o1] 0x80,	%o4
	nop
	set	0x6D, %g6
	ldstub	[%l7 + %g6],	%g2
	set	0x40, %i1
	stwa	%l5,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x64, %o5
	stha	%o4,	[%l7 + %o5] 0x89
	nop
	set	0x4E, %i5
	lduh	[%l7 + %i5],	%l4
	st	%f4,	[%l7 + 0x54]
	fpsub32s	%f2,	%f10,	%f21
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x89,	%o7
	nop
	set	0x1E, %i2
	ldstub	[%l7 + %i2],	%g5
	and	%l2,	%l1,	%i1
	set	0x60, %l2
	stxa	%g7,	[%l7 + %l2] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf1,	%f0
	set	0x20, %o0
	prefetcha	[%l7 + %o0] 0x80,	 3
	nop
	set	0x64, %g2
	ldsw	[%l7 + %g2],	%i3
	set	0x22, %o4
	stha	%i2,	[%l7 + %o4] 0x81
	set	0x4B, %i4
	stba	%i6,	[%l7 + %i4] 0x89
	nop
	set	0x48, %l4
	stx	%fsr,	[%l7 + %l4]
	wr 	%g0, 	0x7, 	%fprs
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%l6
	or	%l0,	%g4,	%l3
	or	%i5,	%i7,	%g3
	or	%o2,	%o6,	%g6
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%o3
	nop
	set	0x48, %o3
	ldub	[%l7 + %o3],	%o0
	or	%g2,	%l5,	%o4
	nop
	set	0x36, %l3
	ldsh	[%l7 + %l3],	%l4
	fpsub16	%f10,	%f8,	%f16
	set	0x2C, %o7
	stwa	%o7,	[%l7 + %o7] 0x88
	st	%f26,	[%l7 + 0x5C]
	nop
	set	0x32, %i7
	lduh	[%l7 + %i7],	%g5
	nop
	set	0x48, %g7
	std	%f14,	[%l7 + %g7]
	nop
	set	0x70, %g4
	ldsw	[%l7 + %g4],	%l2
	nop
	set	0x11, %i3
	stb	%o5,	[%l7 + %i3]
	nop
	set	0x28, %g5
	std	%l0,	[%l7 + %g5]
	or	%g7,	%o1,	%i1
	nop
	set	0x58, %g1
	ldub	[%l7 + %g1],	%i3
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe3,	%i6
	set	0x60, %l6
	swapa	[%l7 + %l6] 0x88,	%i2
	and	%i0,	%i4,	%l6
	ld	[%l7 + 0x74],	%f25
	or	%l0,	%g1,	%l3
	set	0x5D, %i0
	ldstuba	[%l7 + %i0] 0x80,	%g4
	nop
	set	0x73, %o6
	stb	%i7,	[%l7 + %o6]
	nop
	set	0x2C, %i6
	ldstub	[%l7 + %i6],	%g3
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xea,	%o2
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x31, %g6
	ldstub	[%l7 + %g6],	%i5
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%g6
	nop
	set	0x70, %o5
	std	%f30,	[%l7 + %o5]
	or	%o3,	%o0,	%g2
	nop
	set	0x3A, %i5
	stb	%l5,	[%l7 + %i5]
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x89,	%o6
	nop
	set	0x20, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f10
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x81,	 1
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x81,	%o7
	ld	[%l7 + 0x14],	%f10
	st	%fsr,	[%l7 + 0x78]
	st	%f16,	[%l7 + 0x1C]
	nop
	set	0x7E, %o0
	ldub	[%l7 + %o0],	%o4
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x88,	 2
	set	0x22, %i4
	stba	%g5,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%l1
	nop
	set	0x18, %g2
	swap	[%l7 + %g2],	%g7
	set	0x39, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o1
	or	%i1,	%i6,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i4
	nop
	set	0x1E, %l4
	sth	%l6,	[%l7 + %l4]
	set	0x2C, %l3
	stwa	%l0,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x48, %o3
	stxa	%g1,	[%l7 + %o3] 0xeb
	membar	#Sync
	st	%f13,	[%l7 + 0x20]
	set	0x50, %o7
	stda	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x58, %i7
	std	%g4,	[%l7 + %i7]
	set	0x20, %g7
	stda	%i6,	[%l7 + %g7] 0x80
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x80,	 2
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xe2,	%g2
	set	0x67, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o2
	ble,a,pt	%xcc,	loop_10
	add	%g6,	%i5,	%o0
	set	0x0F, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g2
loop_10:
	nop
	set	0x3A, %l5
	sth	%o3,	[%l7 + %l5]
	nop
	set	0x1A, %i0
	ldstub	[%l7 + %i0],	%l5
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%o6
	add	%o4,	%o7,	%g5
	nop
	set	0x6A, %i6
	sth	%o5,	[%l7 + %i6]
	st	%f4,	[%l7 + 0x54]
	nop
	set	0x42, %o2
	lduh	[%l7 + %o2],	%l2
	nop
	set	0x20, %o6
	prefetch	[%l7 + %o6],	 1
	fpsub32s	%f9,	%f28,	%f31
	nop
	set	0x41, %g6
	ldub	[%l7 + %g6],	%l1
	nop
	set	0x0C, %o5
	ldsw	[%l7 + %o5],	%g7
	nop
	set	0x54, %i5
	swap	[%l7 + %i5],	%i1
	set	0x0A, %l0
	stha	%o1,	[%l7 + %l0] 0xeb
	membar	#Sync
	and	%i6,	%i2,	%i4
	nop
	set	0x68, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x17, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l6
	set	0x73, %l2
	stba	%i0,	[%l7 + %l2] 0x81
	nop
	nop
	setx	0x7CEF1394,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x5164419B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f29,	%f0
	nop
	set	0x68, %g3
	lduw	[%l7 + %g3],	%g1
	nop
	set	0x68, %o0
	std	%l2,	[%l7 + %o0]
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i3
	set	0x28, %g2
	sta	%f16,	[%l7 + %g2] 0x80
	st	%f24,	[%l7 + 0x3C]
	wr	%i7,	%g3,	%softint
	set	0x56, %l1
	stha	%g6,	[%l7 + %l1] 0xe2
	membar	#Sync
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o2,	%o0
	add	%g2,	%o3,	%i5
	nop
	set	0x18, %o4
	swap	[%l7 + %o4],	%l4
	nop
	set	0x18, %l3
	stx	%o6,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x14, %l4
	ldsh	[%l7 + %l4],	%o4
	nop
	set	0x08, %o3
	std	%f26,	[%l7 + %o3]
	ld	[%l7 + 0x20],	%f0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%l5
	nop
	set	0x58, %i7
	lduw	[%l7 + %i7],	%o5
	nop
	set	0x6C, %g7
	lduw	[%l7 + %g7],	%g5
	or	%l2,	%l1,	%g7
	nop
	set	0x18, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%o1
	nop
	set	0x1C, %o7
	lduw	[%l7 + %o7],	%i1
	set	0x78, %g1
	swapa	[%l7 + %g1] 0x89,	%i2
	nop
	set	0x18, %l5
	ldub	[%l7 + %l5],	%i4
	st	%f30,	[%l7 + 0x78]
	add	%l6,	%i6,	%i0
	or	%l3,	%l0,	%g1
	wr	%g4,	%i7,	%pic
	set	0x58, %i0
	stda	%i2,	[%l7 + %i0] 0x80
	set	0x54, %l6
	sta	%f28,	[%l7 + %l6] 0x81
	set	0x38, %i6
	stda	%g2,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%g6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%g2
	or	%o2,	%i5,	%l4
	fpsub32	%f8,	%f26,	%f24
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f4
	wr	%o6,	%o4,	%pic
	set	0x10, %g6
	stwa	%o3,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	nop
	setx	0x5B87EE6458BA014C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x06DE490780E5CFC9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f10,	%f0
	nop
	set	0x08, %g5
	std	%o6,	[%l7 + %g5]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x88
	set	0x78, %l0
	stwa	%l5,	[%l7 + %l0] 0x81
	nop
	set	0x39, %o1
	stb	%g5,	[%l7 + %o1]
	or	%l2,	%o5,	%l1
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f0
	nop
	set	0x43, %i1
	ldstub	[%l7 + %i1],	%o1
	set	0x58, %l2
	stxa	%g7,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x42, %g3
	lduh	[%l7 + %g3],	%i1
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%i2
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xea,	%i4
	nop
	set	0x6E, %i2
	lduh	[%l7 + %i2],	%l6
	nop
	set	0x0A, %g2
	sth	%i0,	[%l7 + %g2]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%i6
	nop
	set	0x32, %o4
	stb	%l0,	[%l7 + %o4]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xe2,	%g0
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x64, %l4
	lduh	[%l7 + %l4],	%g4
	nop
	set	0x6E, %l3
	sth	%i3,	[%l7 + %l3]
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x81,	%i6
	nop
	set	0x48, %o3
	stx	%g6,	[%l7 + %o3]
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x88,	%o0
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f16
	set	0x70, %g4
	lda	[%l7 + %g4] 0x81,	%f29
	set	0x57, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g2
	set	0x73, %l5
	stba	%o2,	[%l7 + %l5] 0x88
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%g3
	nop
	set	0x77, %o7
	ldsb	[%l7 + %o7],	%i5
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f18
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xca
	or	%l4,	%o6,	%o4
	nop
	set	0x3D, %o6
	ldstub	[%l7 + %o6],	%o3
	nop
	set	0x2E, %g6
	lduh	[%l7 + %g6],	%l5
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x23, %g5
	ldstub	[%l7 + %g5],	%o7
	nop
	set	0x5A, %i5
	ldstub	[%l7 + %i5],	%g5
	nop
	set	0x12, %o2
	ldub	[%l7 + %o2],	%o5
	nop
	set	0x44, %l0
	lduw	[%l7 + %l0],	%l2
	st	%f2,	[%l7 + 0x10]
	nop
	set	0x68, %o5
	ldsh	[%l7 + %o5],	%l1
	set	0x7C, %o1
	swapa	[%l7 + %o1] 0x81,	%o1
	bl,pn	%xcc,	loop_11
	fpadd16s	%f5,	%f19,	%f8
	or	%i1,	%g7,	%i2
	st	%fsr,	[%l7 + 0x20]
loop_11:
	nop
	set	0x70, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x40, %g3
	std	%i4,	[%l7 + %g3]
	nop
	set	0x3F, %i1
	ldub	[%l7 + %i1],	%i0
	fpsub32s	%f9,	%f13,	%f18
	nop
	set	0x20, %o0
	stw	%l3,	[%l7 + %o0]
	nop
	set	0x08, %i2
	std	%f4,	[%l7 + %i2]
	nop
	set	0x52, %g2
	lduh	[%l7 + %g2],	%l6
	set	0x19, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i6
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x81
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%g1
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd0
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x58, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%l0
	nop
	set	0x48, %g7
	stw	%i3,	[%l7 + %g7]
	set	0x49, %g4
	stba	%g4,	[%l7 + %g4] 0x81
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x89,	%g6
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x20, %i3
	swap	[%l7 + %i3],	%i7
	nop
	set	0x16, %i0
	ldsb	[%l7 + %i0],	%o0
	set	0x22, %i6
	stha	%o2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x74, %o7
	stw	%g3,	[%l7 + %o7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l4
	nop
	set	0x58, %l6
	ldub	[%l7 + %l6],	%o6
	nop
	set	0x55, %g6
	ldstub	[%l7 + %g6],	%o4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%o3
	ld	[%l7 + 0x54],	%f16
	nop
	set	0x76, %g5
	sth	%l5,	[%l7 + %g5]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%o5
	nop
	set	0x48, %o6
	lduw	[%l7 + %o6],	%o7
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%l2
	set	0x38, %i5
	stxa	%l1,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x1C, %o5
	swap	[%l7 + %o5],	%i1
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%o1
	nop
	set	0x48, %o1
	ldub	[%l7 + %o1],	%i2
	nop
	set	0x18, %g3
	prefetch	[%l7 + %g3],	 0
	set	0x44, %i1
	stwa	%i4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x3C, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x38, %l2
	stw	%i0,	[%l7 + %l2]
	st	%f21,	[%l7 + 0x1C]
	nop
	set	0x20, %i2
	ldstub	[%l7 + %i2],	%l3
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f2
	add	%l6,	%g7,	%i6
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x81,	%g1
	set	0x50, %l4
	stda	%l0,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x74, %i4
	swap	[%l7 + %i4],	%g4
	nop
	set	0x64, %l3
	stw	%i3,	[%l7 + %l3]
	set	0x3C, %l1
	sta	%f4,	[%l7 + %l1] 0x81
	ld	[%l7 + 0x30],	%f19
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x60, %g7
	swap	[%l7 + %g7],	%g6
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f28
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f16
	set	0x10, %l5
	stxa	%o2,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x54, %g1
	lda	[%l7 + %g1] 0x88,	%f24
	nop
	set	0x0A, %i0
	stb	%o0,	[%l7 + %i0]
	and	%g3,	%l4,	%o6
	nop
	set	0x70, %i6
	stx	%g2,	[%l7 + %i6]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%o3
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x68, %i3
	stx	%o4,	[%l7 + %i3]
	nop
	set	0x4C, %o7
	sth	%g5,	[%l7 + %o7]
	nop
	set	0x44, %l6
	sth	%l5,	[%l7 + %l6]
	st	%fsr,	[%l7 + 0x2C]
	add	%o7,	%l2,	%o5
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	or	%l1,	%i1,	%o1
	nop
	set	0x38, %g5
	stx	%i4,	[%l7 + %g5]
	nop
	set	0x08, %o6
	stx	%i0,	[%l7 + %o6]
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x3C, %o5
	swap	[%l7 + %o5],	%i2
	set	0x3E, %l0
	ldstuba	[%l7 + %l0] 0x88,	%l3
	set	0x48, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	st	%fsr,	[%l7 + 0x5C]
	ld	[%l7 + 0x24],	%f9
	nop
	set	0x4A, %i1
	ldsh	[%l7 + %i1],	%g7
	nop
	set	0x30, %g3
	ldstub	[%l7 + %g3],	%g1
	nop
	set	0x73, %l2
	ldub	[%l7 + %l2],	%l0
	set	0x30, %i2
	stda	%g4,	[%l7 + %i2] 0x80
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x88,	%i6
	set	0x4A, %o4
	stha	%i3,	[%l7 + %o4] 0x89
	nop
	set	0x18, %l4
	stx	%g6,	[%l7 + %l4]
	nop
	set	0x08, %g2
	prefetch	[%l7 + %g2],	 1
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc8
	nop
	set	0x78, %i4
	std	%i6,	[%l7 + %i4]
	set	0x6F, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o2
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%o0
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%l4
	nop
	set	0x4C, %g7
	sth	%o6,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f26
	set	0x58, %i7
	lda	[%l7 + %i7] 0x80,	%f28
	set	0x28, %g1
	stxa	%g3,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x13, %i0
	ldsb	[%l7 + %i0],	%g2
	set	0x7F, %i6
	stba	%o3,	[%l7 + %i6] 0x80
	nop
	set	0x40, %i3
	lduh	[%l7 + %i3],	%o4
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%i5
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%g5
	nop
	set	0x24, %g5
	ldub	[%l7 + %g5],	%o7
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x64, %g6
	stb	%l2,	[%l7 + %g6]
	fpsub16	%f14,	%f24,	%f14
	st	%f12,	[%l7 + 0x74]
	nop
	set	0x0E, %o5
	sth	%l5,	[%l7 + %o5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%l1
	set	0x40, %i5
	stda	%o0,	[%l7 + %i5] 0x80
	or	%i4,	%i1,	%i0
	nop
	set	0x0F, %l0
	ldub	[%l7 + %l0],	%l3
	nop
	set	0x58, %o1
	ldx	[%l7 + %o1],	%i2
	nop
	set	0x1C, %o2
	swap	[%l7 + %o2],	%l6
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf9
	membar	#Sync
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%g6
	set	0x54, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g1
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc4
	ld	[%l7 + 0x58],	%f25
	add	%g4,	%i6,	%l0
	set	0x5C, %o4
	stwa	%g6,	[%l7 + %o4] 0x80
	set	0x08, %l4
	stxa	%i7,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x72, %i2
	stha	%i3,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x38, %l3
	stx	%o0,	[%l7 + %l3]
	nop
	set	0x78, %i4
	std	%f24,	[%l7 + %i4]
	nop
	set	0x7E, %o3
	ldsb	[%l7 + %o3],	%o2
	nop
	set	0x18, %l1
	std	%f10,	[%l7 + %l1]
	nop
	set	0x20, %g2
	std	%o6,	[%l7 + %g2]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	fpsub16s	%f25,	%f29,	%f15
	add	%l4,	%g3,	%g2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%i5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f0
	set	0x3C, %l5
	stba	%g5,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x70, %i0
	ldstub	[%l7 + %i0],	%o7
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x88,	%o3
	or	%l2,	%o5,	%l1
	set	0x50, %i7
	stha	%o1,	[%l7 + %i7] 0x81
	set	0x40, %o7
	stda	%i4,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	ba,a,pt	%xcc,	loop_12
	and	%i0,	%l3,	%i2
	set	0x28, %g5
	stda	%l4,	[%l7 + %g5] 0xea
	membar	#Sync
loop_12:
	nop
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f0
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%l6
	fpsub16s	%f18,	%f18,	%f18
	nop
	set	0x08, %o5
	ldsh	[%l7 + %o5],	%g1
	nop
	set	0x52, %g6
	sth	%g7,	[%l7 + %g6]
	set	0x40, %i5
	sta	%f20,	[%l7 + %i5] 0x80
	nop
	set	0x11, %o1
	ldstub	[%l7 + %o1],	%i6
	set	0x28, %o2
	lda	[%l7 + %o2] 0x80,	%f10
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x38, %l0
	stw	%i7,	[%l7 + %l0]
	set	0x0A, %l2
	stha	%i3,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x14, %g3
	stw	%o2,	[%l7 + %g3]
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x80,	%o0
	and	%o6,	%l4,	%g2
	st	%f17,	[%l7 + 0x34]
	nop
	set	0x10, %l4
	lduw	[%l7 + %l4],	%g3
	nop
	nop
	setx	0xED5381CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xFC60C204,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f15,	%f23
	add	%i5,	%o4,	%g5
	ld	[%l7 + 0x7C],	%f23
	ba	%icc,	loop_13
	nop
	set	0x4A, %i2
	ldsh	[%l7 + %i2],	%o3
	st	%f5,	[%l7 + 0x2C]
	set	0x0C, %l3
	swapa	[%l7 + %l3] 0x81,	%o7
loop_13:
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%o5
	add	%l2,	%o1,	%i4
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x80,	 2
	nop
	set	0x28, %i4
	lduw	[%l7 + %i4],	%i0
	nop
	set	0x5A, %l1
	sth	%l3,	[%l7 + %l1]
	nop
	nop
	setx	0x0A5554F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x4159C8C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f6,	%f27
	st	%f5,	[%l7 + 0x68]
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x89,	%f25
	st	%f4,	[%l7 + 0x4C]
	nop
	set	0x50, %g7
	ldstub	[%l7 + %g7],	%l1
	or	%i2,	%l6,	%g1
	nop
	set	0x0B, %g4
	stb	%g7,	[%l7 + %g4]
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%l5
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%i6
	set	0x70, %i0
	stda	%g4,	[%l7 + %i0] 0x89
	and	%l0,	%i7,	%g6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%i3
	ld	[%l7 + 0x0C],	%f13
	ld	[%l7 + 0x54],	%f0
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f28
	set	0x45, %o7
	stba	%o0,	[%l7 + %o7] 0x80
	nop
	set	0x3B, %g5
	ldsb	[%l7 + %g5],	%o2
	set	0x08, %i3
	sta	%f5,	[%l7 + %i3] 0x81
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xea,	%l4
	set	0x54, %o5
	sta	%f10,	[%l7 + %o5] 0x88
	set	0x64, %g6
	stwa	%g2,	[%l7 + %g6] 0xeb
	membar	#Sync
	add	%g3,	%o6,	%i5
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x88,	%g4
	set	0x1E, %o1
	stha	%o3,	[%l7 + %o1] 0x88
	nop
	set	0x08, %o2
	sth	%o4,	[%l7 + %o2]
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f30
	nop
	nop
	setx	0x88A9CB726A7E824C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0385194B4BD5121D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f28,	%f28
	nop
	set	0x38, %i1
	stb	%o5,	[%l7 + %i1]
	set	0x78, %l2
	ldxa	[%l7 + %l2] 0x81,	%o7
	ld	[%l7 + 0x08],	%f27
	nop
	set	0x58, %l0
	std	%f16,	[%l7 + %l0]
	nop
	set	0x60, %o4
	std	%f2,	[%l7 + %o4]
	set	0x30, %g3
	swapa	[%l7 + %g3] 0x80,	%l2
	nop
	set	0x5C, %l4
	stw	%o1,	[%l7 + %l4]
	set	0x44, %i2
	stha	%i4,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%i1,	%i0,	%l1
	set	0x78, %l3
	lda	[%l7 + %l3] 0x80,	%f22
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%i2
	nop
	set	0x2C, %i4
	ldsh	[%l7 + %i4],	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xED9, 	%sys_tick_cmpr
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x89,	%g0
	and	%l5,	%g4,	%l0
	nop
	set	0x35, %o0
	ldstub	[%l7 + %o0],	%i7
	nop
	set	0x24, %g7
	lduh	[%l7 + %g7],	%i6
	nop
	set	0x18, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x10, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x89,	%g6,	%o0
	bge	%xcc,	loop_14
	nop
	set	0x22, %l5
	sth	%o2,	[%l7 + %l5]
	nop
	set	0x52, %g1
	ldub	[%l7 + %g1],	%l4
	nop
	set	0x7B, %i0
	ldsb	[%l7 + %i0],	%g2
loop_14:
	ld	[%l7 + 0x10],	%f10
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	st	%f23,	[%l7 + 0x28]
	nop
	set	0x1C, %o7
	prefetch	[%l7 + %o7],	 4
	or	%g3,	%i5,	%g5
	nop
	set	0x2E, %i7
	ldsb	[%l7 + %i7],	%o6
	set	0x60, %i3
	stda	%o2,	[%l7 + %i3] 0xea
	membar	#Sync
	bge,pt	%icc,	loop_15
	fpsub16s	%f1,	%f28,	%f18
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
loop_15:
	and	%o5,	%o7,	%o4
	add	%l2,	%o1,	%i1
	fpsub32s	%f3,	%f26,	%f24
	set	0x40, %o5
	stda	%i4,	[%l7 + %o5] 0x80
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd0
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%i0
	set	0x48, %o1
	sta	%f28,	[%l7 + %o1] 0x81
	nop
	set	0x40, %o6
	stx	%l1,	[%l7 + %o6]
	nop
	set	0x2E, %o2
	lduh	[%l7 + %o2],	%i2
	add	%l6,	%g7,	%g1
	nop
	set	0x1B, %i1
	ldsb	[%l7 + %i1],	%l5
	nop
	set	0x30, %l6
	std	%f0,	[%l7 + %l6]
	st	%f29,	[%l7 + 0x28]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%l0
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%i7
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xc0
	nop
	set	0x30, %g3
	stw	%l3,	[%l7 + %g3]
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x88,	%i6
	nop
	set	0x38, %i2
	lduw	[%l7 + %i2],	%g6
	nop
	set	0x0C, %l4
	stw	%o0,	[%l7 + %l4]
	set	0x30, %o3
	sta	%f15,	[%l7 + %o3] 0x88
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%o2
	set	0x43, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l4
	add	%g2,	%g3,	%i5
	add	%o6,	%g5,	%o3
	set	0x18, %l3
	sta	%f14,	[%l7 + %l3] 0x88
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%o5
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%o4
	nop
	set	0x5E, %l1
	sth	%o7,	[%l7 + %l1]
	st	%f10,	[%l7 + 0x0C]
	nop
	set	0x1D, %g4
	stb	%l2,	[%l7 + %g4]
	set	0x66, %g2
	stba	%o1,	[%l7 + %g2] 0x80
	set	0x28, %l5
	ldstuba	[%l7 + %l5] 0x80,	%i4
	nop
	set	0x30, %g1
	stx	%i1,	[%l7 + %g1]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%l0
	nop
	set	0x1B, %i6
	ldsb	[%l7 + %i6],	%i0
	nop
	set	0x57, %i7
	ldub	[%l7 + %i7],	%l6
	ld	[%l7 + 0x60],	%f15
	set	0x60, %i3
	stda	%g6,	[%l7 + %i3] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f16
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd2,	%f0
	nop
	set	0x68, %g6
	stb	%g1,	[%l7 + %g6]
	nop
	set	0x56, %i5
	ldsh	[%l7 + %i5],	%i2
	nop
	set	0x60, %o1
	ldsw	[%l7 + %o1],	%g4
	nop
	set	0x70, %o6
	stx	%l5,	[%l7 + %o6]
	nop
	set	0x14, %o2
	lduh	[%l7 + %o2],	%i7
	nop
	set	0x0C, %i1
	ldsb	[%l7 + %i1],	%l3
	set	0x08, %l6
	sta	%f13,	[%l7 + %l6] 0x81
	nop
	set	0x3A, %o7
	sth	%i6,	[%l7 + %o7]
	add	%l0,	%o0,	%g6
	set	0x20, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0
	wr	%l4,	%i3,	%y
	set	0x50, %g3
	ldda	[%l7 + %g3] 0x80,	%g2
	set	0x64, %l0
	ldstuba	[%l7 + %l0] 0x80,	%g2
	set	0x5C, %i2
	stba	%o6,	[%l7 + %i2] 0x89
	nop
	set	0x74, %l4
	swap	[%l7 + %l4],	%i5
	nop
	set	0x54, %o3
	stb	%o3,	[%l7 + %o3]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%o4
	wr	%o5,	%o7,	%y
	and	%l2,	%o1,	%i4
	nop
	set	0x48, %o4
	stw	%l1,	[%l7 + %o4]
	nop
	set	0x28, %i4
	lduh	[%l7 + %i4],	%i1
	nop
	set	0x45, %o0
	ldub	[%l7 + %o0],	%l6
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xc0
	set	0x20, %l1
	stwa	%i0,	[%l7 + %l1] 0x88
	set	0x60, %g4
	stxa	%g1,	[%l7 + %g4] 0x80
	fpadd16	%f12,	%f2,	%f18
	nop
	set	0x59, %g2
	stb	%i2,	[%l7 + %g2]
	or	%g7,	%g4,	%l5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%i7
	set	0x39, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l0
	add	%i6,	%g6,	%o0
	set	0x08, %l3
	stxa	%o2,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x40, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x64, %i0
	ldsh	[%l7 + %i0],	%i3
	add	%l4,	%g3,	%o6
	nop
	set	0x29, %i6
	ldub	[%l7 + %i6],	%g2
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x81,	 3
	nop
	set	0x08, %i7
	std	%g4,	[%l7 + %i7]
	nop
	set	0x30, %g5
	stx	%o4,	[%l7 + %g5]
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x80,	%o5
	nop
	set	0x10, %i5
	ldx	[%l7 + %i5],	%o3
	nop
	set	0x32, %g6
	lduh	[%l7 + %g6],	%l2
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f10
	nop
	set	0x56, %o1
	ldsb	[%l7 + %o1],	%o1
	nop
	set	0x2E, %i1
	ldstub	[%l7 + %i1],	%o7
	set	0x08, %l6
	stha	%i4,	[%l7 + %l6] 0x80
	set	0x3C, %o2
	stwa	%i1,	[%l7 + %o2] 0x81
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x80,	%l6
	ld	[%l7 + 0x18],	%f13
	wr 	%g0, 	0x4, 	%fprs
	or	%i2,	%l1,	%g7
	nop
	set	0x70, %g3
	lduh	[%l7 + %g3],	%g4
	nop
	set	0x28, %l0
	std	%l2,	[%l7 + %l0]
	nop
	set	0x2C, %i2
	sth	%i7,	[%l7 + %i2]
	nop
	set	0x60, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%l0
	set	0x54, %o4
	stwa	%i6,	[%l7 + %o4] 0x81
	nop
	set	0x55, %i4
	ldsb	[%l7 + %i4],	%g6
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x89,	%l5
	set	0x13, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o2
	and	%o0,	%l4,	%i3
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%o6
	add	%g3,	%g2,	%i5
	nop
	set	0x70, %g4
	stx	%fsr,	[%l7 + %g4]
	ld	[%l7 + 0x70],	%f4
	set	0x1C, %g2
	sta	%f8,	[%l7 + %g2] 0x89
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x89,	%o4
	set	0x54, %l5
	swapa	[%l7 + %l5] 0x80,	%g5
	nop
	set	0x3D, %g1
	ldsb	[%l7 + %g1],	%o3
	nop
	set	0x48, %l3
	prefetch	[%l7 + %l3],	 1
	nop
	set	0x0A, %i0
	ldsh	[%l7 + %i0],	%o5
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%o1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xc0
	nop
	set	0x3C, %i7
	lduw	[%l7 + %i7],	%o7
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x28, %i5
	stx	%i4,	[%l7 + %i5]
	nop
	set	0x48, %g6
	std	%l2,	[%l7 + %g6]
	nop
	set	0x40, %g5
	std	%f18,	[%l7 + %g5]
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%i6
	set	0x08, %o1
	stha	%i1,	[%l7 + %o1] 0x88
	add	%i0,	%i2,	%g1
	nop
	set	0x7A, %l6
	ldstub	[%l7 + %l6],	%l1
	and	%g7,	%l3,	%g4
	nop
	set	0x10, %i1
	std	%f30,	[%l7 + %i1]
	set	0x20, %o2
	lda	[%l7 + %o2] 0x88,	%f24
	nop
	set	0x08, %g3
	ldsh	[%l7 + %g3],	%i7
	set	0x08, %l0
	lda	[%l7 + %l0] 0x80,	%f5
	set	0x08, %o7
	stwa	%i6,	[%l7 + %o7] 0x89
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x81,	%l0
	nop
	set	0x34, %i2
	sth	%g6,	[%l7 + %i2]
	nop
	set	0x40, %o4
	lduh	[%l7 + %o4],	%l5
	wr	%o2,	%l4,	%clear_softint
	nop
	set	0x58, %o3
	ldsh	[%l7 + %o3],	%i3
	st	%fsr,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x4C]
	set	0x60, %o0
	stxa	%o0,	[%l7 + %o0] 0xeb
	membar	#Sync
	ld	[%l7 + 0x60],	%f16
	or	%o6,	%g3,	%i5
	nop
	set	0x28, %l2
	lduw	[%l7 + %l2],	%o4
	set	0x4A, %g7
	stba	%g5,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x54, %i4
	stha	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xe2,	%o4
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%o3
	nop
	set	0x2C, %l1
	ldsh	[%l7 + %l1],	%o1
	nop
	set	0x48, %l5
	sth	%i4,	[%l7 + %l5]
	bl	%icc,	loop_16
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%o7
	and	%l2,	%l6,	%i0
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x80,	%i2
loop_16:
	nop
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x88,	%g1
	wr	%l1,	%g7,	%softint
	fpadd16	%f22,	%f14,	%f2
	nop
	set	0x70, %i0
	stx	%fsr,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x5C, %i7
	ldsb	[%l7 + %i7],	%l3
	and	%g4,	%i7,	%i6
	nop
	set	0x46, %i3
	ldstub	[%l7 + %i3],	%i1
	nop
	set	0x24, %i5
	swap	[%l7 + %i5],	%l0
	st	%f22,	[%l7 + 0x1C]
	nop
	set	0x70, %g6
	stx	%l5,	[%l7 + %g6]
	ld	[%l7 + 0x58],	%f18
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%l4
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x80
	set	0x0B, %g5
	stba	%o2,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x10, %o6
	lda	[%l7 + %o6] 0x80,	%f23
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f18
	set	0x6C, %i1
	sta	%f18,	[%l7 + %i1] 0x89
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%i3
	nop
	set	0x28, %g3
	lduw	[%l7 + %g3],	%o6
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i5
	set	0x60, %l0
	stda	%g2,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x18, %o1
	stwa	%g5,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x54, %l4
	ldsw	[%l7 + %l4],	%o4
	or	%o5,	%g2,	%o1
	st	%f20,	[%l7 + 0x48]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%f0
	ld	[%l7 + 0x18],	%f26
	nop
	set	0x08, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x74, %o3
	swapa	[%l7 + %o3] 0x88,	%o3
	set	0x44, %o4
	swapa	[%l7 + %o4] 0x81,	%i4
	add	%o7,	%l6,	%i0
	nop
	set	0x32, %o0
	lduh	[%l7 + %o0],	%l2
	set	0x38, %g7
	ldxa	[%l7 + %g7] 0x89,	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%g7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xda
	st	%f4,	[%l7 + 0x48]
	st	%f11,	[%l7 + 0x2C]
	nop
	set	0x56, %i4
	ldsh	[%l7 + %i4],	%l3
	nop
	set	0x22, %g4
	ldub	[%l7 + %g4],	%g4
	nop
	set	0x40, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x78, %l5
	std	%f0,	[%l7 + %l5]
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%l1
	nop
	set	0x54, %l3
	lduh	[%l7 + %l3],	%i7
	st	%fsr,	[%l7 + 0x18]
	set	0x52, %g1
	stba	%i1,	[%l7 + %g1] 0xe2
	membar	#Sync
	or	%i6,	%l5,	%g6
	set	0x50, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l4
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%o2
	nop
	set	0x18, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x54, %i6
	ldsh	[%l7 + %i6],	%i3
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xca
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f20
	add	%o6,	%l0,	%i5
	set	0x08, %o5
	swapa	[%l7 + %o5] 0x88,	%g3
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x89,	 3
	nop
	set	0x30, %l6
	sth	%o4,	[%l7 + %l6]
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f2
	nop
	set	0x68, %i1
	std	%o0,	[%l7 + %i1]
	nop
	set	0x28, %g3
	ldx	[%l7 + %g3],	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%o3
	set	0x34, %l0
	stba	%g2,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd0
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f22
	bne,pn	%xcc,	loop_17
	nop
	set	0x44, %o7
	stw	%i4,	[%l7 + %o7]
	nop
	set	0x0A, %o3
	ldub	[%l7 + %o3],	%o7
	and	%i0,	%l2,	%i2
loop_17:
	nop
	set	0x48, %o2
	lduw	[%l7 + %o2],	%g1
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f0
	add	%g7,	%l3,	%g4
	set	0x14, %o4
	sta	%f29,	[%l7 + %o4] 0x80
	nop
	set	0x20, %g7
	std	%f10,	[%l7 + %g7]
	nop
	set	0x46, %l2
	sth	%l1,	[%l7 + %l2]
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	st	%f9,	[%l7 + 0x48]
	nop
	set	0x38, %i4
	stw	%i7,	[%l7 + %i4]
	nop
	set	0x30, %l1
	stx	%l6,	[%l7 + %l1]
	fpadd16	%f0,	%f4,	%f18
	set	0x68, %l5
	ldxa	[%l7 + %l5] 0x81,	%i6
	set	0x35, %g2
	stba	%i1,	[%l7 + %g2] 0x80
	nop
	set	0x3C, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x58, %g1
	sta	%f0,	[%l7 + %g1] 0x89
	nop
	set	0x7C, %i0
	prefetch	[%l7 + %i0],	 2
	nop
	set	0x28, %i7
	std	%l4,	[%l7 + %i7]
	nop
	set	0x68, %i6
	std	%g6,	[%l7 + %i6]
	nop
	set	0x28, %g6
	lduw	[%l7 + %g6],	%l4
	nop
	set	0x24, %i3
	ldsw	[%l7 + %i3],	%i3
	set	0x18, %i5
	stda	%o6,	[%l7 + %i5] 0x81
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%o2
	nop
	set	0x57, %l6
	ldsb	[%l7 + %l6],	%i5
	nop
	set	0x4F, %o6
	ldsb	[%l7 + %o6],	%l0
	nop
	set	0x68, %o5
	std	%g4,	[%l7 + %o5]
	set	0x24, %g3
	swapa	[%l7 + %g3] 0x80,	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%g3
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%o1
	ld	[%l7 + 0x70],	%f15
	nop
	set	0x56, %o1
	ldsh	[%l7 + %o1],	%o3
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%o5
	nop
	set	0x21, %i2
	stb	%g2,	[%l7 + %i2]
	set	0x48, %o7
	stxa	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x25, %o3
	ldstub	[%l7 + %o3],	%o7
	nop
	set	0x4F, %l4
	ldub	[%l7 + %l4],	%i0
	nop
	set	0x58, %o0
	std	%f18,	[%l7 + %o0]
	or	%l2,	%i2,	%g1
	ld	[%l7 + 0x70],	%f12
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%g7
	st	%f17,	[%l7 + 0x08]
	nop
	set	0x61, %o2
	stb	%l1,	[%l7 + %o2]
	nop
	set	0x0B, %o4
	ldsb	[%l7 + %o4],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x9A7, 	%tick_cmpr
	and	%g6,	%i7,	%l4
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i3
	set	0x30, %g4
	lda	[%l7 + %g4] 0x88,	%f13
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%o6
	nop
	set	0x48, %i4
	swap	[%l7 + %i4],	%o2
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%l0
	set	0x1F, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g5
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%o4
	nop
	set	0x66, %g1
	ldsh	[%l7 + %g1],	%i5
	nop
	set	0x12, %i0
	lduh	[%l7 + %i0],	%g3
	nop
	set	0x18, %i7
	ldsw	[%l7 + %i7],	%o1
	nop
	set	0x28, %i6
	std	%o0,	[%l7 + %i6]
	nop
	set	0x6C, %l3
	ldstub	[%l7 + %l3],	%o5
	nop
	set	0x60, %g6
	stx	%g2,	[%l7 + %g6]
	set	0x50, %i3
	stwa	%i4,	[%l7 + %i3] 0x81
	set	0x68, %g5
	stwa	%o3,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x0C, %l6
	sth	%i0,	[%l7 + %l6]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f0
	nop
	set	0x30, %o6
	prefetch	[%l7 + %o6],	 4
	fpadd16	%f6,	%f14,	%f10
	or	%l2,	%i2,	%o7
	nop
	set	0x16, %o5
	ldsh	[%l7 + %o5],	%g1
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f12
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x88,	%l3
	nop
	set	0x18, %g3
	lduw	[%l7 + %g3],	%g7
	or	%l1,	%g4,	%l6
	set	0x60, %l0
	ldda	[%l7 + %l0] 0xe2,	%i0
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%i6
	and	%l5,	%i7,	%l4
	nop
	set	0x14, %o3
	stb	%g6,	[%l7 + %o3]
	set	0x30, %l4
	stba	%o6,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x1D, %o0
	ldsb	[%l7 + %o0],	%i3
	nop
	set	0x20, %i2
	stw	%o2,	[%l7 + %i2]
	nop
	set	0x70, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x78, %o2
	lduh	[%l7 + %o2],	%l0
	nop
	set	0x08, %g7
	ldub	[%l7 + %g7],	%g5
	nop
	set	0x7C, %l2
	stw	%o4,	[%l7 + %l2]
	set	0x49, %i4
	stba	%g3,	[%l7 + %i4] 0x88
	nop
	set	0x67, %l1
	ldstub	[%l7 + %l1],	%o1
	nop
	set	0x3C, %g4
	stw	%o0,	[%l7 + %g4]
	set	0x72, %g2
	stha	%i5,	[%l7 + %g2] 0x81
	nop
	set	0x44, %g1
	lduh	[%l7 + %g1],	%g2
	nop
	set	0x14, %i0
	swap	[%l7 + %i0],	%i4
	fpadd32s	%f6,	%f15,	%f0
	nop
	set	0x74, %l5
	stw	%o3,	[%l7 + %l5]
	nop
	set	0x4C, %i7
	stw	%o5,	[%l7 + %i7]
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%i0
	fpsub16	%f30,	%f18,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3C9, 	%tick_cmpr
	nop
	set	0x18, %g6
	stx	%o7,	[%l7 + %g6]
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%l3
	set	0x68, %g5
	stba	%g1,	[%l7 + %g5] 0x88
	set	0x26, %i3
	stba	%g7,	[%l7 + %i3] 0x80
	nop
	set	0x08, %l6
	ldsw	[%l7 + %l6],	%l1
	ld	[%l7 + 0x64],	%f20
	nop
	set	0x64, %o6
	sth	%l6,	[%l7 + %o6]
	nop
	set	0x1C, %o5
	lduh	[%l7 + %o5],	%g4
	set	0x54, %i1
	sta	%f4,	[%l7 + %i1] 0x88
	and	%i6,	%l5,	%i1
	nop
	set	0x58, %i5
	std	%f12,	[%l7 + %i5]
	nop
	set	0x68, %g3
	ldsw	[%l7 + %g3],	%i7
	nop
	set	0x30, %l0
	ldsw	[%l7 + %l0],	%l4
	nop
	set	0x6B, %o1
	ldstub	[%l7 + %o1],	%g6
	set	0x70, %o3
	swapa	[%l7 + %o3] 0x80,	%i3
	set	0x68, %l4
	sta	%f18,	[%l7 + %l4] 0x89
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xeb,	%o6
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x22, %o7
	ldsb	[%l7 + %o7],	%o2
	set	0x7C, %o4
	stha	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x20, %i2
	stx	%g5,	[%l7 + %i2]
	nop
	set	0x3A, %o2
	ldub	[%l7 + %o2],	%g3
	nop
	set	0x18, %l2
	stw	%o4,	[%l7 + %l2]
	set	0x50, %i4
	stha	%o0,	[%l7 + %i4] 0x81
	set	0x28, %l1
	stxa	%i5,	[%l7 + %l1] 0x80
	ld	[%l7 + 0x5C],	%f19
	st	%f19,	[%l7 + 0x50]
	nop
	set	0x43, %g7
	ldub	[%l7 + %g7],	%g2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%o1
	fpsub16	%f14,	%f16,	%f10
	nop
	set	0x38, %g2
	std	%f26,	[%l7 + %g2]
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%o2
	nop
	set	0x51, %i0
	stb	%o5,	[%l7 + %i0]
	set	0x28, %l5
	swapa	[%l7 + %l5] 0x80,	%i2
	set	0x18, %g1
	stxa	%i0,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x19, %i7
	stb	%o7,	[%l7 + %i7]
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	nop
	set	0x4C, %g6
	prefetch	[%l7 + %g6],	 2
	or	%l3,	%g7,	%g1
	nop
	set	0x42, %i6
	lduh	[%l7 + %i6],	%l1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%i6
	nop
	set	0x0D, %g5
	ldstub	[%l7 + %g5],	%l5
	or	%l6,	%i1,	%l4
	set	0x6B, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i7
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%g6
	set	0x6D, %o5
	stba	%o6,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x26, %i3
	stha	%i3,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%l0
	set	0x50, %i5
	sta	%f31,	[%l7 + %i5] 0x80
	nop
	set	0x10, %l0
	stx	%fsr,	[%l7 + %l0]
	add	%o2,	%g3,	%o4
	nop
	set	0x18, %o1
	ldsw	[%l7 + %o1],	%g5
	nop
	set	0x17, %o3
	ldub	[%l7 + %o3],	%i5
	set	0x3C, %l4
	swapa	[%l7 + %l4] 0x81,	%o0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf0
	membar	#Sync
	set	0x38, %o0
	ldxa	[%l7 + %o0] 0x81,	%i4
	set	0x38, %o4
	stxa	%o1,	[%l7 + %o4] 0x88
	nop
	set	0x18, %o7
	stw	%o3,	[%l7 + %o7]
	nop
	set	0x7C, %o2
	ldsh	[%l7 + %o2],	%o5
	set	0x52, %i2
	stba	%i2,	[%l7 + %i2] 0x81
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x89,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%l2
	nop
	set	0x40, %l2
	stw	%l3,	[%l7 + %l2]
	set	0x50, %l1
	stda	%g2,	[%l7 + %l1] 0x88
	nop
	set	0x43, %g7
	ldstub	[%l7 + %g7],	%g7
	set	0x13, %g4
	stba	%l1,	[%l7 + %g4] 0x81
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc0
	nop
	set	0x48, %l5
	sth	%g1,	[%l7 + %l5]
	set	0x30, %g2
	lda	[%l7 + %g2] 0x80,	%f2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x80,	%i6,	%g4
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x81,	%l6
	nop
	set	0x46, %l3
	ldub	[%l7 + %l3],	%l5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%l4
	or	%i7,	%o6,	%g6
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x89,	%l0
	st	%f10,	[%l7 + 0x70]
	nop
	set	0x64, %i6
	ldsw	[%l7 + %i6],	%i3
	nop
	set	0x13, %g5
	ldsb	[%l7 + %g5],	%o2
	or	%o4,	%g5,	%i5
	nop
	set	0x30, %g6
	stw	%g3,	[%l7 + %g6]
	and	%o0,	%o1,	%i4
	nop
	set	0x0B, %l6
	ldstub	[%l7 + %l6],	%o5
	nop
	set	0x66, %o5
	stb	%i2,	[%l7 + %o5]
	add	%i0,	%o7,	%l2
	bge	%xcc,	loop_18
	nop
	set	0x38, %o6
	stx	%l3,	[%l7 + %o6]
	set	0x08, %i1
	stda	%o2,	[%l7 + %i1] 0xea
	membar	#Sync
loop_18:
	nop
	set	0x25, %i3
	stb	%g2,	[%l7 + %i3]
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x80,	 3
	bg,a	%xcc,	loop_19
	nop
	set	0x68, %o1
	std	%l0,	[%l7 + %o1]
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f18
	nop
	set	0x74, %l4
	swap	[%l7 + %l4],	%g1
loop_19:
	nop
	set	0x18, %o3
	std	%g4,	[%l7 + %o3]
	add	%l6,	%i6,	%i1
	st	%f5,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %o0
	stda	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x4A, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i7
	nop
	set	0x59, %g3
	ldub	[%l7 + %g3],	%l5
	set	0x5C, %o7
	stwa	%o6,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x6C, %o2
	ldsh	[%l7 + %o2],	%l0
	nop
	set	0x08, %i2
	lduh	[%l7 + %i2],	%g6
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%i2
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x78, %l1
	std	%f26,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x18, %i4
	stw	%o2,	[%l7 + %i4]
	set	0x47, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o4
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x89,	%g4
	nop
	set	0x68, %l5
	prefetch	[%l7 + %l5],	 1
	nop
	set	0x3A, %g2
	sth	%g3,	[%l7 + %g2]
	nop
	set	0x7C, %g1
	lduw	[%l7 + %g1],	%o0
	set	0x14, %i0
	lda	[%l7 + %i0] 0x89,	%f10
	nop
	set	0x60, %l3
	std	%i4,	[%l7 + %l3]
	set	0x18, %i7
	sta	%f25,	[%l7 + %i7] 0x81
	nop
	set	0x58, %g5
	ldx	[%l7 + %g5],	%o1
	nop
	set	0x65, %i6
	ldsb	[%l7 + %i6],	%o5
	ld	[%l7 + 0x50],	%f31
	set	0x30, %l6
	sta	%f4,	[%l7 + %l6] 0x81
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xda
	nop
	set	0x6D, %o5
	stb	%i2,	[%l7 + %o5]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xda
	nop
	set	0x50, %o6
	std	%i4,	[%l7 + %o6]
	nop
	set	0x22, %l0
	ldsh	[%l7 + %l0],	%i0
	set	0x6C, %i3
	stwa	%l2,	[%l7 + %i3] 0x89
	nop
	set	0x0C, %o1
	stw	%o7,	[%l7 + %o1]
	nop
	set	0x08, %i5
	stx	%l3,	[%l7 + %i5]
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%o2
	or	%g7,	%l1,	%g2
	set	0x3C, %l4
	swapa	[%l7 + %l4] 0x81,	%g4
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x48, %o0
	swap	[%l7 + %o0],	%l6
	nop
	set	0x60, %o4
	std	%f2,	[%l7 + %o4]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	ld	[%l7 + 0x70],	%f16
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xea,	%g0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%l4
	set	0x48, %o2
	stxa	%i7,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x62, %i2
	lduh	[%l7 + %i2],	%i6
	nop
	set	0x3A, %l2
	lduh	[%l7 + %l2],	%l5
	ble,a,pn	%xcc,	loop_20
	nop
	set	0x28, %i4
	std	%f4,	[%l7 + %i4]
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%o6
	nop
	set	0x38, %l1
	std	%f0,	[%l7 + %l1]
loop_20:
	wr	%l0,	%i3,	%set_softint
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x80
	nop
	set	0x28, %g4
	ldsw	[%l7 + %g4],	%g6
	set	0x20, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o2
	set	0x4F, %i0
	ldstuba	[%l7 + %i0] 0x81,	%g5
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xca
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	fpadd32s	%f6,	%f10,	%f5
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x80,	%o0
	set	0x71, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g3
	set	0x2F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o1
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x81,	%o5
	and	%i2,	%i5,	%i0
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%l2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x80,	%i4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%o3
	set	0x50, %l0
	lda	[%l7 + %l0] 0x88,	%f17
	set	0x60, %o1
	ldda	[%l7 + %o1] 0x80,	%l2
	nop
	set	0x3C, %i5
	swap	[%l7 + %i5],	%l1
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xc8
	nop
	set	0x30, %i3
	stw	%g2,	[%l7 + %i3]
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%g7
	nop
	set	0x18, %o0
	stw	%g4,	[%l7 + %o0]
	nop
	set	0x44, %o4
	stw	%l6,	[%l7 + %o4]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%l4
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x28, %o7
	lduw	[%l7 + %o7],	%i7
	nop
	set	0x60, %i2
	stx	%i6,	[%l7 + %i2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x106, 	%sys_tick_cmpr
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xe2,	%l0
	set	0x45, %l2
	stba	%i1,	[%l7 + %l2] 0x89
	nop
	set	0x08, %g7
	stx	%g6,	[%l7 + %g7]
	nop
	set	0x29, %i4
	ldub	[%l7 + %i4],	%i3
	nop
	set	0x0C, %l1
	ldsw	[%l7 + %l1],	%g5
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f10
	nop
	set	0x58, %g4
	ldsb	[%l7 + %g4],	%o4
	set	0x60, %g2
	lda	[%l7 + %g2] 0x89,	%f16
	wr	%o2,	%g3,	%clear_softint
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%o5
	or	%o1,	%i5,	%i0
	set	0x28, %i0
	stda	%l2,	[%l7 + %i0] 0x88
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x89,	%i2
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%o7
	nop
	set	0x0D, %i6
	ldub	[%l7 + %i6],	%o3
	nop
	set	0x1A, %g5
	sth	%i4,	[%l7 + %g5]
	nop
	set	0x60, %l6
	stx	%l3,	[%l7 + %l6]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%g7
	set	0x20, %i7
	swapa	[%l7 + %i7] 0x81,	%g4
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%g2
	nop
	set	0x6C, %o5
	lduw	[%l7 + %o5],	%l6
	nop
	set	0x7C, %g6
	stw	%l4,	[%l7 + %g6]
	set	0x14, %l0
	sta	%f18,	[%l7 + %l0] 0x88
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%g1
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%o6
	ld	[%l7 + 0x4C],	%f11
	set	0x50, %o3
	ldda	[%l7 + %o3] 0xea,	%l4
	and	%l0,	%i1,	%i3
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%g5
	set	0x28, %i5
	sta	%f25,	[%l7 + %i5] 0x80
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%o4
	set	0x7F, %g3
	ldstuba	[%l7 + %g3] 0x80,	%o2
	nop
	set	0x18, %o4
	stx	%g6,	[%l7 + %o4]
	nop
	set	0x5E, %i2
	lduh	[%l7 + %i2],	%g3
	set	0x40, %o2
	stwa	%o5,	[%l7 + %o2] 0x81
	nop
	set	0x2C, %o7
	stw	%o1,	[%l7 + %o7]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%i4
	ble,a	%xcc,	loop_21
	nop
	set	0x2A, %g7
	sth	%o0,	[%l7 + %g7]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%i0
loop_21:
	add	%i2,	%o3,	%i4
	nop
	set	0x1C, %l5
	lduh	[%l7 + %l5],	%o7
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x88,	%l2
	set	0x78, %g2
	sta	%f29,	[%l7 + %g2] 0x89
	nop
	set	0x62, %i0
	ldsh	[%l7 + %i0],	%l1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1278
!	Type a   	: 24
!	Type cti   	: 21
!	Type x   	: 520
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
.word 0xE3F2CC23
.word 0x8F0C93D2
.word 0xAD54ABFB
.word 0xEE11AC4B
.word 0x193D965C
.word 0x881D6293
.word 0x7CE7E124
.word 0x881096FF
.word 0x0496C8D7
.word 0x9BFA1308
.word 0x7CEBC70D
.word 0x1EB09961
.word 0x32998C5A
.word 0xC893AF5B
.word 0x221FAFFB
.word 0x311B405C
.word 0xA76A85D8
.word 0xB7DB7DF9
.word 0x9EDB5D96
.word 0xE88438D7
.word 0xAFDA88FE
.word 0xA76E7C99
.word 0xA5AC67A0
.word 0xAE30F666
.word 0xD1DACDD9
.word 0x75D250E8
.word 0xC558B26D
.word 0x9AD48361
.word 0x65F5C918
.word 0xE95A8B0A
.word 0xBCE89A1F
.word 0xF0FE141C
.word 0x5C52ADDA
.word 0xA165B308
.word 0x7F3AE23D
.word 0xFF343F2C
.word 0x1E2D57C7
.word 0x15A79A38
.word 0xA5F4F9CE
.word 0x30E4110A
.word 0xF8F93D61
.word 0xA119C871
.word 0x954D407A
.word 0x541CAE2F
.word 0x925B6774
.word 0xC130EF60
.word 0xDF9F702C
.word 0xBE02882B
.word 0x3D300E91
.word 0x75B84159
.word 0xB2BB965A
.word 0xCF721C9A
.word 0xC62D2D45
.word 0x6DA2DF38
.word 0x6CC2CF46
.word 0xAE5726A0
.word 0x3D654612
.word 0x680CAA6D
.word 0x5BD1A359
.word 0xDCE9951C
.word 0x160D039C
.word 0xC2685501
.word 0x268717CA
.word 0xAF538B3A
.end
