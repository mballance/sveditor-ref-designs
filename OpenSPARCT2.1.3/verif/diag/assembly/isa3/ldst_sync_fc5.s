/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc5.s
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
	set	0x9,	%g1
	set	0x2,	%g2
	set	0x2,	%g3
	set	0xA,	%g4
	set	0xA,	%g5
	set	0x7,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xA,	%i1
	set	-0xE,	%i2
	set	-0xE,	%i3
	set	-0x3,	%i4
	set	-0x2,	%i5
	set	-0x7,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x4CFF6260,	%l0
	set	0x5076F4C5,	%l1
	set	0x73995B5C,	%l2
	set	0x2243C158,	%l3
	set	0x68AC654C,	%l4
	set	0x424B89DE,	%l5
	set	0x375ED6BD,	%l6
	!# Output registers
	set	0x184C,	%o0
	set	0x0DFE,	%o1
	set	0x149D,	%o2
	set	-0x1A64,	%o3
	set	-0x1A0C,	%o4
	set	-0x1782,	%o5
	set	0x14DF,	%o6
	set	0x1026,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	nop
	set	0x22, %i2
	ldstub	[%l7 + %i2],	%l3
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	and	%o7,	%l6,	%o6
	nop
	set	0x0D, %i4
	ldstub	[%l7 + %i4],	%l2
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf9
	membar	#Sync
	set	0x20, %l2
	ldda	[%l7 + %l2] 0xea,	%o0
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f16
	nop
	set	0x54, %l3
	prefetch	[%l7 + %l3],	 3
	set	0x08, %l4
	stxa	%l1,	[%l7 + %l4] 0x89
	st	%fsr,	[%l7 + 0x4C]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc4
	nop
	set	0x40, %o7
	stb	%i5,	[%l7 + %o7]
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x89,	 3
	and	%g7,	%i1,	%l0
	nop
	set	0x71, %o3
	ldstub	[%l7 + %o3],	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%g1
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%g3
	st	%f29,	[%l7 + 0x34]
	set	0x40, %l0
	stxa	%i6,	[%l7 + %l0] 0x80
	nop
	set	0x20, %i1
	std	%i0,	[%l7 + %i1]
	nop
	set	0x1C, %g3
	prefetch	[%l7 + %g3],	 4
	set	0x69, %i5
	ldstuba	[%l7 + %i5] 0x89,	%g2
	nop
	set	0x50, %g1
	std	%i2,	[%l7 + %g1]
	nop
	set	0x62, %o6
	ldsh	[%l7 + %o6],	%l4
	nop
	set	0x62, %l1
	ldstub	[%l7 + %l1],	%l5
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%g5
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf9
	membar	#Sync
	nop
	set	0x2A, %i3
	sth	%i7,	[%l7 + %i3]
	st	%f13,	[%l7 + 0x74]
	set	0x2C, %i0
	lda	[%l7 + %i0] 0x81,	%f25
	set	0x42, %g5
	stba	%o5,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x67, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o2
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%o0
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%i2
	set	0x20, %g4
	swapa	[%l7 + %g4] 0x80,	%o3
	set	0x78, %i6
	sta	%f29,	[%l7 + %i6] 0x80
	nop
	set	0x33, %g7
	ldsb	[%l7 + %g7],	%i4
	nop
	set	0x6A, %i4
	sth	%l3,	[%l7 + %i4]
	set	0x48, %l5
	stha	%l6,	[%l7 + %l5] 0x88
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%o6
	nop
	set	0x3A, %o2
	ldsh	[%l7 + %o2],	%o6
	set	0x44, %l3
	stha	%o1,	[%l7 + %l3] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
	nop
	set	0x38, %l4
	std	%l0,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f0
	wr	%i5,	%l2,	%softint
	nop
	set	0x30, %o0
	ldsh	[%l7 + %o0],	%o4
	nop
	set	0x50, %o3
	ldub	[%l7 + %o3],	%i1
	st	%fsr,	[%l7 + 0x14]
	nop
	nop
	setx	0xFF9F5A5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x7778415D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f20,	%f0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xca
	wr	%l0,	%g7,	%sys_tick
	set	0x38, %l0
	stwa	%g6,	[%l7 + %l0] 0xea
	membar	#Sync
	st	%f6,	[%l7 + 0x78]
	or	%g4,	%g1,	%g3
	nop
	set	0x26, %o7
	lduh	[%l7 + %o7],	%i0
	nop
	set	0x73, %g3
	ldstub	[%l7 + %g3],	%g2
	and	%i2,	%i6,	%l5
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x88
	or	%l4,	%g5,	%o5
	nop
	set	0x40, %g1
	stx	%i7,	[%l7 + %g1]
	nop
	set	0x40, %i1
	ldsb	[%l7 + %i1],	%o2
	nop
	set	0x78, %l1
	std	%f20,	[%l7 + %l1]
	and	%o0,	%i3,	%o3
	wr	%i4,	%l3,	%clear_softint
	set	0x74, %o6
	swapa	[%l7 + %o6] 0x80,	%l6
	set	0x38, %o1
	sta	%f1,	[%l7 + %o1] 0x80
	nop
	set	0x2F, %i3
	ldub	[%l7 + %i3],	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%o7
	set	0x38, %i7
	stwa	%l1,	[%l7 + %i7] 0x88
	ld	[%l7 + 0x58],	%f27
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%i5
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%l2
	nop
	set	0x34, %l6
	ldsw	[%l7 + %l6],	%i1
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc0
	nop
	set	0x20, %g6
	lduw	[%l7 + %g6],	%o4
	set	0x68, %i6
	stda	%g6,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x08, %g4
	std	%f0,	[%l7 + %g4]
	set	0x67, %g7
	stba	%l0,	[%l7 + %g7] 0x89
	nop
	set	0x38, %i4
	stw	%g6,	[%l7 + %i4]
	or	%g1,	%g4,	%g3
	nop
	nop
	setx	0x53F758FE480F0E7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3F6FCD0FB932DC7E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f12,	%f20
	nop
	set	0x44, %l5
	lduw	[%l7 + %l5],	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%i6
	set	0x5C, %i2
	stha	%i2,	[%l7 + %i2] 0x89
	nop
	set	0x10, %o2
	ldx	[%l7 + %o2],	%l5
	nop
	set	0x78, %l3
	ldx	[%l7 + %l3],	%l4
	or	%g5,	%i7,	%o5
	set	0x40, %l2
	stxa	%o0,	[%l7 + %l2] 0x89
	set	0x7C, %o5
	lda	[%l7 + %o5] 0x80,	%f10
	nop
	set	0x70, %o0
	ldx	[%l7 + %o0],	%i3
	set	0x41, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o3
	set	0x28, %o3
	sta	%f29,	[%l7 + %o3] 0x80
	set	0x16, %o4
	stba	%i4,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x28, %l0
	stx	%l3,	[%l7 + %l0]
	nop
	set	0x38, %g3
	std	%o2,	[%l7 + %g3]
	nop
	set	0x20, %i5
	std	%f20,	[%l7 + %i5]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f0
	ld	[%l7 + 0x0C],	%f3
	set	0x2C, %g1
	swapa	[%l7 + %g1] 0x81,	%o6
	ld	[%l7 + 0x60],	%f23
	set	0x40, %i1
	lda	[%l7 + %i1] 0x88,	%f21
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x88,	 3
	bgu	%icc,	loop_1
	add	%o1,	%l1,	%i5
	set	0x3C, %l1
	stba	%o7,	[%l7 + %l1] 0x80
loop_1:
	nop
	set	0x3C, %o1
	lda	[%l7 + %o1] 0x81,	%f20
	wr	%l2,	%i1,	%softint
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f16
	nop
	set	0x4C, %i0
	ldsb	[%l7 + %i0],	%o4
	set	0x20, %i7
	swapa	[%l7 + %i7] 0x89,	%g7
	nop
	set	0x67, %l6
	ldub	[%l7 + %l6],	%g6
	nop
	set	0x58, %g2
	ldub	[%l7 + %g2],	%l0
	set	0x2C, %g5
	lda	[%l7 + %g5] 0x80,	%f5
	set	0x74, %g6
	lda	[%l7 + %g6] 0x88,	%f0
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x52, %g7
	stha	%g4,	[%l7 + %g7] 0x88
	nop
	set	0x60, %i4
	stx	%g3,	[%l7 + %i4]
	set	0x48, %l5
	stda	%i0,	[%l7 + %l5] 0xe3
	membar	#Sync
	bleu,a,pt	%xcc,	loop_2
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f14
	set	0x38, %o2
	lda	[%l7 + %o2] 0x89,	%f23
loop_2:
	nop
	set	0x68, %l3
	stha	%g1,	[%l7 + %l3] 0x80
	nop
	set	0x38, %i6
	std	%f22,	[%l7 + %i6]
	fpsub16s	%f15,	%f23,	%f28
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f22
	nop
	set	0x4C, %l2
	lduw	[%l7 + %l2],	%i6
	nop
	set	0x3C, %l4
	stw	%g2,	[%l7 + %l4]
	nop
	set	0x40, %o3
	swap	[%l7 + %o3],	%i2
	nop
	set	0x60, %o4
	stw	%l4,	[%l7 + %o4]
	nop
	set	0x72, %o0
	sth	%l5,	[%l7 + %o0]
	nop
	set	0x64, %g3
	ldsw	[%l7 + %g3],	%i7
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x80,	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i3
	and	%o5,	%i4,	%o3
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x80,	%l3
	nop
	set	0x78, %g1
	lduw	[%l7 + %g1],	%o6
	set	0x31, %i1
	stba	%o2,	[%l7 + %i1] 0x88
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x89,	%l6
	nop
	set	0x69, %l1
	ldstub	[%l7 + %l1],	%l1
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f18
	nop
	set	0x11, %o7
	ldstub	[%l7 + %o7],	%o1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%o4
	set	0x29, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l2
	nop
	set	0x36, %i7
	lduh	[%l7 + %i7],	%g6
	nop
	set	0x22, %l6
	ldsb	[%l7 + %l6],	%g7
	st	%fsr,	[%l7 + 0x30]
	set	0x6C, %i3
	lda	[%l7 + %i3] 0x88,	%f3
	add	%g4,	%l0,	%g3
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%i0
	nop
	set	0x28, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x28, %g4
	ldsw	[%l7 + %g4],	%g1
	ld	[%l7 + 0x1C],	%f8
	set	0x38, %g6
	stwa	%g2,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x38, %i4
	ldub	[%l7 + %i4],	%i2
	set	0x08, %l5
	swapa	[%l7 + %l5] 0x89,	%i6
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x89,	%l5
	set	0x30, %i2
	prefetcha	[%l7 + %i2] 0x81,	 3
	nop
	set	0x42, %l3
	ldub	[%l7 + %l3],	%g5
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x80,	%i7
	nop
	set	0x74, %o5
	stw	%i3,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f0
	nop
	set	0x5A, %l2
	sth	%o5,	[%l7 + %l2]
	or	%o0,	%o3,	%i4
	or	%o6,	%o2,	%l6
	or	%l1,	%l3,	%o7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%i5
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%o4
	set	0x4A, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i1
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf0
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%g7
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%l2
	set	0x48, %g3
	sta	%f10,	[%l7 + %g3] 0x89
	set	0x5C, %l0
	swapa	[%l7 + %l0] 0x88,	%l0
	bg,pn	%xcc,	loop_3
	nop
	set	0x58, %g1
	lduh	[%l7 + %g1],	%g3
	set	0x0C, %i5
	stba	%g4,	[%l7 + %i5] 0xea
	membar	#Sync
loop_3:
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x1A, %l1
	stha	%i0,	[%l7 + %l1] 0xe3
	membar	#Sync
	fpadd16	%f30,	%f30,	%f30
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f18
	nop
	set	0x46, %o1
	sth	%g2,	[%l7 + %o1]
	nop
	set	0x48, %i0
	stx	%fsr,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc4
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f18
	set	0x58, %i3
	stda	%g0,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x80,	%i2
	nop
	set	0x18, %g5
	std	%i6,	[%l7 + %g5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%g5
	nop
	set	0x24, %g4
	ldsw	[%l7 + %g4],	%l4
	set	0x60, %g6
	lda	[%l7 + %g6] 0x88,	%f18
	nop
	set	0x67, %i4
	stb	%i3,	[%l7 + %i4]
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%o5
	nop
	set	0x44, %g7
	ldub	[%l7 + %g7],	%i7
	nop
	set	0x68, %g2
	prefetch	[%l7 + %g2],	 0
	nop
	set	0x5A, %l3
	stb	%o3,	[%l7 + %l3]
	wr	%o0,	%o6,	%set_softint
	nop
	set	0x64, %i2
	ldsh	[%l7 + %i2],	%i4
	set	0x40, %o5
	stxa	%l6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	nop
	setx	0xADAA6A120B0C0E7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB7126061990202B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f12
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0
	nop
	set	0x6D, %o2
	ldub	[%l7 + %o2],	%l3
	nop
	set	0x68, %l2
	swap	[%l7 + %l2],	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o1
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x80,	%o4
	st	%fsr,	[%l7 + 0x7C]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i5
	nop
	set	0x64, %o4
	lduw	[%l7 + %o4],	%g7
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xcc
	set	0x48, %g3
	sta	%f24,	[%l7 + %g3] 0x80
	set	0x30, %o0
	stda	%g6,	[%l7 + %o0] 0x81
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	set	0x38, %l0
	stxa	%l2,	[%l7 + %l0] 0x88
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x89,	%g3
	nop
	set	0x44, %l1
	ldsw	[%l7 + %l1],	%g4
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%l0
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%g2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd0
	nop
	set	0x2C, %i7
	lduw	[%l7 + %i7],	%g1
	set	0x36, %i0
	stba	%i2,	[%l7 + %i0] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x14, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	nop
	setx	0xDDE4B2819C309E32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCFCE675EFCC45B47,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f18
	set	0x0C, %o7
	stwa	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x3A, %g5
	sth	%i6,	[%l7 + %g5]
	set	0x30, %g4
	stda	%g4,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x5C, %g6
	lduw	[%l7 + %g6],	%l5
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f0
	nop
	set	0x4B, %i3
	stb	%i3,	[%l7 + %i3]
	nop
	set	0x38, %l5
	ldsw	[%l7 + %l5],	%l4
	nop
	set	0x4B, %g7
	ldstub	[%l7 + %g7],	%o5
	set	0x61, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o3
	bl,a	%xcc,	loop_4
	nop
	set	0x64, %i2
	stw	%i7,	[%l7 + %i2]
	nop
	set	0x0C, %g2
	stb	%o6,	[%l7 + %g2]
	set	0x34, %o5
	stwa	%i4,	[%l7 + %o5] 0x88
loop_4:
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f28
	nop
	set	0x0C, %o2
	ldsb	[%l7 + %o2],	%o0
	nop
	set	0x50, %l2
	std	%i6,	[%l7 + %l2]
	fpadd32	%f14,	%f14,	%f4
	add	%l1,	%l3,	%o2
	set	0x60, %o4
	stwa	%o1,	[%l7 + %o4] 0xeb
	membar	#Sync
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%o7
	nop
	set	0x0F, %o3
	ldstub	[%l7 + %o3],	%i5
	nop
	set	0x5E, %g3
	lduh	[%l7 + %g3],	%g7
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f16
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%g6
	set	0x48, %l0
	stha	%i1,	[%l7 + %l0] 0x80
	nop
	set	0x68, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x08, %g1
	swap	[%l7 + %g1],	%l2
	nop
	set	0x53, %l1
	ldsb	[%l7 + %l1],	%g4
	set	0x08, %o1
	stxa	%g3,	[%l7 + %o1] 0xe3
	membar	#Sync
	add	%l0,	%g1,	%g2
	or	%i0,	%i6,	%i2
	nop
	set	0x0C, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x68, %i5
	sth	%g5,	[%l7 + %i5]
	nop
	set	0x50, %i7
	stx	%i3,	[%l7 + %i7]
	set	0x34, %i0
	sta	%f27,	[%l7 + %i0] 0x80
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf9
	membar	#Sync
	nop
	set	0x37, %o7
	stb	%l5,	[%l7 + %o7]
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xeb,	%o4
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x89,	%l4
	nop
	set	0x7C, %g6
	sth	%i7,	[%l7 + %g6]
	set	0x34, %i4
	stwa	%o3,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%i4,	%o6,	%l6
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x80,	%l0
	set	0x15, %i3
	stba	%l3,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x68, %l3
	std	%f20,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x60, %i2
	std	%f10,	[%l7 + %i2]
	nop
	set	0x58, %g7
	swap	[%l7 + %g7],	%o0
	nop
	set	0x64, %o5
	stb	%o1,	[%l7 + %o5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g7
	ld	[%l7 + 0x20],	%f16
	set	0x2E, %i6
	ldstuba	[%l7 + %i6] 0x80,	%g6
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x80,	%i1
	nop
	set	0x20, %l2
	std	%f24,	[%l7 + %l2]
	add	%l2,	%g4,	%i5
	be,a	%xcc,	loop_5
	add	%l0,	%g1,	%g2
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd8
loop_5:
	nop
	set	0x60, %o3
	ldsw	[%l7 + %o3],	%i0
	set	0x24, %o2
	sta	%f11,	[%l7 + %o2] 0x88
	set	0x5C, %o0
	swapa	[%l7 + %o0] 0x81,	%g3
	add	%i2,	%i6,	%i3
	set	0x50, %g3
	ldda	[%l7 + %g3] 0xe3,	%l4
	nop
	set	0x2E, %l0
	ldsh	[%l7 + %l0],	%g5
	set	0x32, %l4
	stha	%l4,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x36, %g1
	stha	%i7,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x3C, %i1
	stw	%o3,	[%l7 + %i1]
	nop
	set	0x44, %o1
	swap	[%l7 + %o1],	%o5
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
	nop
	set	0x65, %l1
	ldub	[%l7 + %l1],	%i4
	set	0x08, %i7
	lda	[%l7 + %i7] 0x88,	%f10
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x88,	%f2
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%l6
	and	%l1,	%o6,	%l3
	nop
	set	0x6C, %i5
	sth	%o0,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x18, %g4
	ldub	[%l7 + %g4],	%o2
	set	0x34, %o7
	swapa	[%l7 + %o7] 0x89,	%o1
	nop
	set	0x27, %g6
	ldsb	[%l7 + %g6],	%o7
	or	%g7,	%g6,	%i1
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%o4
	nop
	set	0x54, %g5
	lduw	[%l7 + %g5],	%l2
	nop
	set	0x14, %i3
	lduh	[%l7 + %i3],	%g4
	st	%f20,	[%l7 + 0x14]
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x88,	%l0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	nop
	set	0x34, %i2
	lduh	[%l7 + %i2],	%i5
	fpsub32	%f20,	%f8,	%f26
	set	0x43, %o5
	stba	%g1,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x72, %g7
	sth	%i0,	[%l7 + %g7]
	set	0x1C, %g2
	sta	%f20,	[%l7 + %g2] 0x80
	set	0x30, %i6
	stwa	%g2,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x70, %l2
	stda	%g2,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x40, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i2
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x81,	%i6
	nop
	set	0x28, %o0
	prefetch	[%l7 + %o0],	 4
	st	%f5,	[%l7 + 0x70]
	set	0x20, %g3
	swapa	[%l7 + %g3] 0x89,	%l5
	ld	[%l7 + 0x58],	%f20
	st	%f15,	[%l7 + 0x64]
	nop
	set	0x7D, %l0
	ldub	[%l7 + %l0],	%i3
	ble,pn	%icc,	loop_6
	nop
	set	0x0A, %l4
	stb	%l4,	[%l7 + %l4]
	add	%g5,	%o3,	%o5
	set	0x5C, %g1
	sta	%f28,	[%l7 + %g1] 0x88
loop_6:
	nop
	set	0x6D, %o3
	ldstub	[%l7 + %o3],	%i4
	and	%l6,	%l1,	%o6
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x81,	%i7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%o0
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc0
	nop
	set	0x14, %l1
	sth	%o1,	[%l7 + %l1]
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xea,	%o2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%o7
	add	%g6,	%i1,	%o4
	set	0x44, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l2
	nop
	set	0x44, %l6
	ldstub	[%l7 + %l6],	%l0
	set	0x48, %i5
	lda	[%l7 + %i5] 0x89,	%f2
	nop
	set	0x18, %g4
	std	%f8,	[%l7 + %g4]
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%i5
	st	%f2,	[%l7 + 0x14]
	nop
	set	0x2C, %o7
	ldub	[%l7 + %o7],	%g4
	nop
	set	0x6A, %g6
	ldsh	[%l7 + %g6],	%i0
	set	0x50, %i4
	stda	%g2,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x3C, %g5
	ldsb	[%l7 + %g5],	%g1
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%g3
	nop
	set	0x78, %i3
	ldsw	[%l7 + %i3],	%i6
	set	0x14, %i2
	sta	%f21,	[%l7 + %i2] 0x88
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f16
	nop
	set	0x72, %g7
	ldsh	[%l7 + %g7],	%i2
	nop
	set	0x08, %l3
	std	%f10,	[%l7 + %l3]
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%i3
	set	0x3A, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l4
	set	0x20, %l2
	stwa	%g5,	[%l7 + %l2] 0x88
	and	%o3,	%o5,	%l5
	and	%i4,	%l1,	%o6
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f16
	st	%f30,	[%l7 + 0x58]
	nop
	set	0x2D, %o4
	ldub	[%l7 + %o4],	%i7
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%l2
	nop
	set	0x42, %g3
	lduh	[%l7 + %g3],	%l6
	fpadd32	%f10,	%f30,	%f28
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%o0
	nop
	set	0x28, %l4
	stx	%fsr,	[%l7 + %l4]
	ld	[%l7 + 0x44],	%f10
	set	0x6C, %o3
	stwa	%o2,	[%l7 + %o3] 0x88
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x89,	 4
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x88,	%o7
	set	0x60, %i1
	stda	%i0,	[%l7 + %i1] 0x81
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%o4
	nop
	set	0x34, %o6
	sth	%g6,	[%l7 + %o6]
	fpadd16s	%f13,	%f7,	%f23
	st	%fsr,	[%l7 + 0x2C]
	fpsub32s	%f27,	%f18,	%f1
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xd2
	st	%fsr,	[%l7 + 0x7C]
	set	0x72, %i5
	stha	%l0,	[%l7 + %i5] 0x89
	nop
	set	0x64, %g4
	lduw	[%l7 + %g4],	%l2
	or	%i5,	%g4,	%g2
	nop
	set	0x5C, %i7
	stw	%g1,	[%l7 + %i7]
	nop
	set	0x68, %o7
	stx	%g3,	[%l7 + %o7]
	nop
	set	0x10, %i4
	stw	%i0,	[%l7 + %i4]
	nop
	set	0x10, %g6
	ldsw	[%l7 + %g6],	%i6
	or	%i3,	%l4,	%g5
	set	0x5C, %g5
	lda	[%l7 + %g5] 0x81,	%f17
	nop
	set	0x76, %i3
	sth	%i2,	[%l7 + %i3]
	nop
	set	0x30, %i2
	stb	%o3,	[%l7 + %i2]
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x80,	%l5
	add	%i4,	%o5,	%o6
	nop
	set	0x48, %g7
	std	%l0,	[%l7 + %g7]
	nop
	set	0x3E, %l5
	ldsh	[%l7 + %l5],	%i7
	nop
	set	0x24, %i6
	ldsw	[%l7 + %i6],	%l3
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x10, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x5A, %o2
	sth	%o2,	[%l7 + %o2]
	nop
	set	0x13, %o4
	ldstub	[%l7 + %o4],	%g7
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%o1
	nop
	set	0x08, %g3
	lduh	[%l7 + %g3],	%o7
	or	%i1,	%o4,	%o0
	set	0x48, %g2
	stda	%g6,	[%l7 + %g2] 0x80
	st	%f25,	[%l7 + 0x70]
	nop
	set	0x18, %l0
	sth	%l2,	[%l7 + %l0]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%i5
	nop
	set	0x3C, %o3
	ldsh	[%l7 + %o3],	%g4
	ld	[%l7 + 0x6C],	%f13
	nop
	set	0x48, %l4
	ldsh	[%l7 + %l4],	%g2
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc8
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xeb,	%g0
	nop
	set	0x08, %i1
	swap	[%l7 + %i1],	%i0
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%g3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%i3
	nop
	set	0x78, %o1
	ldsh	[%l7 + %o1],	%g5
	wr	%l4,	%i2,	%ccr
	set	0x54, %o6
	stba	%o3,	[%l7 + %o6] 0x81
	nop
	set	0x08, %l6
	std	%f22,	[%l7 + %l6]
	nop
	set	0x20, %g4
	sth	%i4,	[%l7 + %g4]
	nop
	set	0x7B, %i7
	ldstub	[%l7 + %i7],	%o5
	or	%l5,	%l1,	%i7
	nop
	set	0x7B, %i5
	ldstub	[%l7 + %i5],	%l3
	nop
	set	0x16, %o7
	stb	%l6,	[%l7 + %o7]
	or	%o6,	%g7,	%o1
	set	0x68, %g6
	swapa	[%l7 + %g6] 0x89,	%o2
	st	%fsr,	[%l7 + 0x74]
	set	0x14, %g5
	stwa	%o7,	[%l7 + %g5] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
	nop
	set	0x3C, %i2
	lduh	[%l7 + %i2],	%i1
	set	0x48, %o5
	stda	%o0,	[%l7 + %o5] 0x81
	set	0x58, %g7
	stxa	%o4,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%l2
	add	%g6,	%l0,	%g4
	st	%f7,	[%l7 + 0x68]
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%g2
	set	0x14, %l3
	swapa	[%l7 + %l3] 0x81,	%i5
	set	0x5C, %l2
	stha	%g1,	[%l7 + %l2] 0x89
	nop
	set	0x10, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x0C, %o4
	stw	%g3,	[%l7 + %o4]
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%i6
	set	0x58, %o0
	stda	%g4,	[%l7 + %o0] 0xe3
	membar	#Sync
	ld	[%l7 + 0x18],	%f10
	set	0x28, %g3
	stxa	%i3,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x60, %l0
	stx	%l4,	[%l7 + %l0]
	nop
	set	0x08, %g2
	std	%f20,	[%l7 + %g2]
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xd0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA30, 	%tick_cmpr
	nop
	set	0x74, %o3
	ldsw	[%l7 + %o3],	%i4
	add	%l5,	%l1,	%o5
	set	0x78, %l1
	sta	%f31,	[%l7 + %l1] 0x88
	nop
	set	0x78, %i1
	stw	%l3,	[%l7 + %i1]
	st	%fsr,	[%l7 + 0x50]
	set	0x68, %i0
	stda	%i6,	[%l7 + %i0] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%g7
	or	%o6,	%o1,	%o7
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%o2
	fpsub16	%f0,	%f8,	%f26
	ld	[%l7 + 0x44],	%f18
	set	0x4E, %o1
	stha	%i1,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x40, %l6
	sta	%f12,	[%l7 + %l6] 0x80
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd0
	set	0x20, %o6
	stwa	%o0,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x74, %i5
	sth	%o4,	[%l7 + %i5]
	nop
	set	0x6A, %i7
	sth	%l2,	[%l7 + %i7]
	and	%l0,	%g6,	%g2
	set	0x28, %o7
	lda	[%l7 + %o7] 0x89,	%f17
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x81,	 3
	wr	%i5,	%i0,	%softint
	nop
	set	0x4C, %g5
	swap	[%l7 + %g5],	%g1
	nop
	set	0x5E, %i2
	sth	%i6,	[%l7 + %i2]
	nop
	set	0x68, %o5
	ldsh	[%l7 + %o5],	%g3
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%i2
	set	0x6C, %l5
	sta	%f6,	[%l7 + %l5] 0x81
	nop
	set	0x5C, %i3
	stw	%g5,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x38, %l3
	stx	%i2,	[%l7 + %l3]
	nop
	set	0x30, %g7
	swap	[%l7 + %g7],	%o3
	nop
	set	0x08, %l2
	ldx	[%l7 + %l2],	%l4
	nop
	nop
	setx	0xDEF2DFCF71FEE925,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF05050A428D2AA10,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f22
	set	0x1B, %i6
	ldstuba	[%l7 + %i6] 0x81,	%i4
	fpsub16s	%f29,	%f2,	%f11
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%l1
	nop
	set	0x58, %o0
	std	%o4,	[%l7 + %o0]
	set	0x21, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l3
	nop
	set	0x5C, %l0
	ldub	[%l7 + %l0],	%l6
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	and	%i7,	%l5,	%o6
	nop
	set	0x6C, %l4
	ldstub	[%l7 + %l4],	%o1
	fpsub32	%f14,	%f18,	%f16
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf1,	%f0
	or	%o7,	%o2,	%g7
	wr	%o0,	%i1,	%y
	nop
	set	0x19, %g2
	ldsb	[%l7 + %g2],	%l2
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%o4
	nop
	set	0x40, %i1
	stw	%l0,	[%l7 + %i1]
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f6
	set	0x24, %g1
	stha	%g6,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x48, %l6
	sta	%f23,	[%l7 + %l6] 0x81
	ld	[%l7 + 0x34],	%f2
	nop
	set	0x58, %o1
	std	%g4,	[%l7 + %o1]
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x88,	%i5
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf0,	%f16
	nop
	set	0x08, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x27, %i7
	ldub	[%l7 + %i7],	%g2
	nop
	set	0x34, %o7
	ldsw	[%l7 + %o7],	%i0
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x80,	%i6
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc2
	nop
	set	0x30, %o5
	swap	[%l7 + %o5],	%g1
	bg,a,pn	%icc,	loop_7
	wr	%g3,	%i3,	%set_softint
	nop
	set	0x74, %i2
	stw	%i2,	[%l7 + %i2]
	nop
	set	0x28, %i4
	std	%f24,	[%l7 + %i4]
loop_7:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%o3
	st	%fsr,	[%l7 + 0x68]
	and	%l4,	%i4,	%o5
	set	0x58, %i3
	swapa	[%l7 + %i3] 0x81,	%l1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf1
	membar	#Sync
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%l6
	nop
	set	0x76, %l3
	ldub	[%l7 + %l3],	%i7
	nop
	set	0x40, %g7
	swap	[%l7 + %g7],	%l5
	bge	%icc,	loop_8
	fpsub16	%f6,	%f30,	%f30
	set	0x3A, %i6
	stha	%o1,	[%l7 + %i6] 0x89
loop_8:
	nop
	set	0x08, %o4
	lduh	[%l7 + %o4],	%o7
	set	0x0C, %o0
	sta	%f7,	[%l7 + %o0] 0x89
	nop
	set	0x50, %l2
	ldx	[%l7 + %l2],	%o2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%g7
	set	0x74, %l0
	sta	%f7,	[%l7 + %l0] 0x88
	nop
	set	0x7B, %g3
	stb	%i1,	[%l7 + %g3]
	add	%o0,	%o4,	%l0
	set	0x20, %l4
	stha	%g6,	[%l7 + %l4] 0x89
	fpsub32	%f12,	%f10,	%f6
	nop
	set	0x14, %o2
	prefetch	[%l7 + %o2],	 1
	bn,a,pt	%icc,	loop_9
	nop
	set	0x64, %o3
	stw	%l2,	[%l7 + %o3]
	set	0x20, %g2
	stxa	%i5,	[%l7 + %g2] 0xe2
	membar	#Sync
loop_9:
	bl	%xcc,	loop_10
	nop
	set	0x78, %l1
	lduw	[%l7 + %l1],	%g4
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x88,	%g2
loop_10:
	nop
	set	0x28, %g1
	stw	%i0,	[%l7 + %g1]
	set	0x58, %l6
	stda	%i6,	[%l7 + %l6] 0xea
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%i3
	set	0x68, %o1
	ldxa	[%l7 + %o1] 0x88,	%i2
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%f24
	nop
	set	0x40, %o6
	sth	%g5,	[%l7 + %o6]
	nop
	set	0x30, %g4
	std	%f6,	[%l7 + %g4]
	ld	[%l7 + 0x7C],	%f25
	set	0x0C, %i5
	stwa	%g1,	[%l7 + %i5] 0xea
	membar	#Sync
	ld	[%l7 + 0x48],	%f28
	or	%o3,	%i4,	%o5
	nop
	nop
	setx	0x65433E37,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x732021EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f30,	%f0
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%l1
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x81,	%l4
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%l3
	nop
	set	0x70, %g5
	sth	%i7,	[%l7 + %g5]
	set	0x68, %i2
	stwa	%l6,	[%l7 + %i2] 0x80
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x80,	%l5
	set	0x64, %o5
	stwa	%o7,	[%l7 + %o5] 0x81
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%o1
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%o6
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x88,	%g7
	nop
	set	0x0B, %i6
	stb	%o2,	[%l7 + %i6]
	add	%o0,	%o4,	%i1
	nop
	set	0x48, %o0
	stx	%fsr,	[%l7 + %o0]
	st	%f17,	[%l7 + 0x64]
	and	%g6,	%l2,	%i5
	nop
	set	0x50, %l2
	stx	%fsr,	[%l7 + %l2]
	and	%l0,	%g2,	%i0
	nop
	set	0x68, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%i3
	set	0x48, %o4
	swapa	[%l7 + %o4] 0x89,	%i2
	set	0x17, %o2
	ldstuba	[%l7 + %o2] 0x89,	%g5
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f10
	nop
	set	0x54, %o3
	swap	[%l7 + %o3],	%g1
	set	0x74, %l1
	stha	%o3,	[%l7 + %l1] 0x81
	set	0x14, %i1
	stwa	%i4,	[%l7 + %i1] 0x80
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
	nop
	set	0x74, %g2
	swap	[%l7 + %g2],	%g3
	and	%l1,	%o5,	%l3
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%l4
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f14
	set	0x50, %i0
	swapa	[%l7 + %i0] 0x88,	%l6
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%l5
	nop
	set	0x3C, %g4
	ldstub	[%l7 + %g4],	%o7
	st	%f29,	[%l7 + 0x5C]
	nop
	set	0x24, %i5
	ldsh	[%l7 + %i5],	%i7
	nop
	set	0x38, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%g7
	set	0x64, %o7
	sta	%f21,	[%l7 + %o7] 0x88
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x89,	%o2
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x81,	%o6
	nop
	set	0x64, %i2
	swap	[%l7 + %i2],	%o4
	nop
	set	0x5A, %i4
	ldsb	[%l7 + %i4],	%i1
	nop
	set	0x18, %o5
	stx	%g6,	[%l7 + %o5]
	nop
	nop
	setx	0xD833E95367473256,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x8AA6E68017C033CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f10,	%f22
	set	0x44, %i3
	stwa	%l2,	[%l7 + %i3] 0x89
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%i5
	nop
	set	0x14, %l3
	sth	%o0,	[%l7 + %l3]
	nop
	set	0x64, %i6
	swap	[%l7 + %i6],	%l0
	set	0x3E, %o0
	stha	%i0,	[%l7 + %o0] 0x80
	wr	%i6,	%g4,	%clear_softint
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%i3
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%i2
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x89,	 2
	add	%g1,	%i4,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%o5
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf1
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd2
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f12
	nop
	set	0x68, %o2
	ldsh	[%l7 + %o2],	%l3
	nop
	set	0x5C, %o3
	lduw	[%l7 + %o3],	%l1
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%l4
	set	0x0C, %l4
	stwa	%l5,	[%l7 + %l4] 0x81
	ba	%xcc,	loop_11
	ld	[%l7 + 0x2C],	%f20
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf8
	membar	#Sync
loop_11:
	nop
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xe2,	%o6
	nop
	set	0x19, %o1
	stb	%l6,	[%l7 + %o1]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%g7
	nop
	set	0x1A, %g2
	ldsh	[%l7 + %g2],	%o1
	nop
	set	0x4C, %i0
	lduh	[%l7 + %i0],	%o2
	set	0x68, %o6
	ldxa	[%l7 + %o6] 0x80,	%o4
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x88,	%o6
	set	0x5C, %l6
	swapa	[%l7 + %l6] 0x80,	%i1
	nop
	set	0x6E, %i7
	stb	%g6,	[%l7 + %i7]
	set	0x2C, %i5
	lda	[%l7 + %i5] 0x80,	%f25
	and	%l2,	%i5,	%o0
	nop
	set	0x0A, %o7
	sth	%l0,	[%l7 + %o7]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f0
	set	0x1C, %i2
	stwa	%i0,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x40, %g6
	stx	%i6,	[%l7 + %g6]
	nop
	set	0x70, %i4
	swap	[%l7 + %i4],	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i3
	nop
	set	0x7A, %i3
	sth	%i2,	[%l7 + %i3]
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x81,	%g4
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%g3
	ba,a,pt	%icc,	loop_12
	wr	%o3,	%o5,	%pic
	set	0x7C, %i6
	lda	[%l7 + %i6] 0x80,	%f26
loop_12:
	nop
	set	0x60, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f18
	set	0x10, %l2
	stha	%l3,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x54, %g3
	prefetch	[%l7 + %g3],	 2
	set	0x18, %g7
	stha	%l4,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x28, %l0
	stwa	%l1,	[%l7 + %l0] 0xeb
	membar	#Sync
	add	%o7,	%l5,	%l6
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%o0
	and	%o2,	%i7,	%o6
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i1
	nop
	set	0x76, %l4
	ldsh	[%l7 + %l4],	%l2
	set	0x58, %i1
	stxa	%i5,	[%l7 + %i1] 0xea
	membar	#Sync
	and	%o0,	%l0,	%i0
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%i6
	set	0x60, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g6
	and	%g2,	%g4,	%i3
	or	%i2,	%i4,	%g5
	and	%g1,	%g3,	%o3
	nop
	set	0x66, %g2
	lduh	[%l7 + %g2],	%o5
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
	st	%f17,	[%l7 + 0x68]
	fpsub32s	%f4,	%f0,	%f4
	set	0x5E, %i0
	stha	%l4,	[%l7 + %i0] 0x88
	wr	%o7,	%l1,	%sys_tick
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	set	0x28, %o6
	stxa	%l5,	[%l7 + %o6] 0xe3
	membar	#Sync
	wr	%g7,	%l6,	%clear_softint
	nop
	set	0x18, %l6
	lduh	[%l7 + %l6],	%o2
	be	%xcc,	loop_13
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%i6
	nop
	set	0x78, %i5
	std	%o0,	[%l7 + %i5]
	st	%f14,	[%l7 + 0x58]
loop_13:
	nop
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0
	ble,a,pn	%icc,	loop_14
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%i1
	nop
	set	0x50, %i2
	ldub	[%l7 + %i2],	%l2
	nop
	set	0x74, %g6
	sth	%i5,	[%l7 + %g6]
loop_14:
	nop
	set	0x4B, %i4
	ldstub	[%l7 + %i4],	%o6
	nop
	set	0x30, %i3
	sth	%o0,	[%l7 + %i3]
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%l0
	set	0x7C, %o5
	swapa	[%l7 + %o5] 0x88,	%i6
	st	%f27,	[%l7 + 0x40]
	nop
	set	0x72, %o0
	stb	%i0,	[%l7 + %o0]
	set	0x18, %l5
	stwa	%g6,	[%l7 + %l5] 0x81
	set	0x40, %i6
	stda	%g4,	[%l7 + %i6] 0x89
	nop
	set	0x34, %l2
	swap	[%l7 + %l2],	%g2
	nop
	set	0x28, %g7
	sth	%i2,	[%l7 + %g7]
	bge,a	%xcc,	loop_15
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%i4
	nop
	set	0x50, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
loop_15:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g5
	set	0x4C, %o2
	lda	[%l7 + %o2] 0x89,	%f27
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%g3
	set	0x3F, %l4
	stba	%o3,	[%l7 + %l4] 0xeb
	membar	#Sync
	st	%f26,	[%l7 + 0x0C]
	st	%fsr,	[%l7 + 0x40]
	set	0x38, %o4
	ldxa	[%l7 + %o4] 0x81,	%l3
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%l4
	nop
	set	0x26, %o1
	stb	%o7,	[%l7 + %o1]
	set	0x08, %g1
	stda	%o4,	[%l7 + %g1] 0x88
	nop
	set	0x54, %g2
	lduw	[%l7 + %g2],	%l1
	nop
	set	0x40, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x68, %g4
	stx	%l5,	[%l7 + %g4]
	or	%g7,	%l6,	%i7
	nop
	set	0x08, %i0
	std	%f22,	[%l7 + %i0]
	nop
	set	0x18, %l6
	stw	%o2,	[%l7 + %l6]
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x80,	 2
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x6E, %o6
	sth	%i1,	[%l7 + %o6]
	ld	[%l7 + 0x18],	%f23
	set	0x08, %g5
	swapa	[%l7 + %g5] 0x88,	%o1
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	nop
	set	0x31, %i2
	stb	%i5,	[%l7 + %i2]
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xea,	%o6
	nop
	set	0x71, %g6
	stb	%o0,	[%l7 + %g6]
	and	%l0,	%i6,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g4
	nop
	set	0x48, %i4
	stw	%i2,	[%l7 + %i4]
	nop
	set	0x28, %l3
	std	%f16,	[%l7 + %l3]
	st	%f11,	[%l7 + 0x28]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i4
	nop
	set	0x7C, %i3
	ldsh	[%l7 + %i3],	%i3
	and	%g1,	%g5,	%o3
	or	%l3,	%g3,	%l4
	set	0x78, %o5
	stxa	%o5,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x44, %o0
	stw	%o7,	[%l7 + %o0]
	set	0x40, %i6
	ldxa	[%l7 + %i6] 0x88,	%l1
	and	%g7,	%l5,	%i7
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x28, %l2
	stx	%o2,	[%l7 + %l2]
	st	%f31,	[%l7 + 0x14]
	nop
	set	0x66, %l5
	sth	%o4,	[%l7 + %l5]
	nop
	set	0x28, %g3
	std	%i0,	[%l7 + %g3]
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%f4
	nop
	set	0x34, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x08, %o3
	sta	%f0,	[%l7 + %o3] 0x89
	add	%l6,	%o1,	%l2
	be,a,pn	%icc,	loop_16
	nop
	set	0x7A, %l4
	lduh	[%l7 + %l4],	%i5
	nop
	set	0x40, %o4
	lduw	[%l7 + %o4],	%o0
	st	%f25,	[%l7 + 0x70]
loop_16:
	ld	[%l7 + 0x24],	%f29
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%o6
	add	%i6,	%g6,	%l0
	nop
	set	0x08, %o1
	std	%g4,	[%l7 + %o1]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x78, %g2
	ldsw	[%l7 + %g2],	%i0
	ld	[%l7 + 0x10],	%f2
	set	0x68, %l1
	ldxa	[%l7 + %l1] 0x89,	%i2
	nop
	set	0x26, %g4
	ldstub	[%l7 + %g4],	%g2
	nop
	set	0x08, %o2
	stx	%i3,	[%l7 + %o2]
	set	0x48, %i0
	lda	[%l7 + %i0] 0x88,	%f5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f0
	add	%i4,	%g1,	%o3
	nop
	set	0x30, %i7
	stw	%l3,	[%l7 + %i7]
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f20
	nop
	set	0x44, %o6
	swap	[%l7 + %o6],	%g3
	or	%g5,	%l4,	%o7
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%o5,	%g7,	%l1
	nop
	set	0x08, %o7
	ldsw	[%l7 + %o7],	%l5
	nop
	set	0x58, %i2
	stx	%i7,	[%l7 + %i2]
	nop
	set	0x62, %i4
	ldsb	[%l7 + %i4],	%o4
	ld	[%l7 + 0x18],	%f13
	nop
	set	0x5A, %l3
	lduh	[%l7 + %l3],	%i1
	nop
	set	0x54, %i3
	lduw	[%l7 + %i3],	%l6
	nop
	set	0x0E, %g6
	sth	%o2,	[%l7 + %g6]
	nop
	set	0x64, %o5
	stw	%l2,	[%l7 + %o5]
	nop
	set	0x7B, %o0
	ldstub	[%l7 + %o0],	%i5
	set	0x68, %l2
	stxa	%o0,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x44, %i6
	lda	[%l7 + %i6] 0x88,	%f4
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%o1
	add	%o6,	%i6,	%l0
	nop
	set	0x20, %g3
	std	%f16,	[%l7 + %g3]
	set	0x39, %l0
	stba	%g4,	[%l7 + %l0] 0xe3
	membar	#Sync
	add	%g6,	%i2,	%i0
	set	0x20, %g7
	ldxa	[%l7 + %g7] 0x80,	%i3
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x89,	%i4
	set	0x20, %l4
	sta	%f17,	[%l7 + %l4] 0x88
	set	0x70, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g1
	set	0x60, %o4
	stha	%g2,	[%l7 + %o4] 0x80
	set	0x49, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o3
	nop
	set	0x68, %g1
	ldsw	[%l7 + %g1],	%l3
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x89,	%g3
	ld	[%l7 + 0x1C],	%f14
	nop
	set	0x50, %g4
	std	%g4,	[%l7 + %g4]
	nop
	set	0x78, %l1
	stx	%l4,	[%l7 + %l1]
	nop
	set	0x55, %i0
	ldub	[%l7 + %i0],	%o5
	nop
	set	0x7F, %o2
	stb	%o7,	[%l7 + %o2]
	nop
	set	0x10, %l6
	ldub	[%l7 + %l6],	%l1
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%o4
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x81,	%g7
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f8
	set	0x2C, %i7
	stwa	%i1,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x34, %o7
	stwa	%o2,	[%l7 + %o7] 0x89
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd8
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f12
	fpadd32s	%f18,	%f0,	%f29
	nop
	set	0x20, %i3
	prefetch	[%l7 + %i3],	 4
	nop
	set	0x5A, %l3
	ldstub	[%l7 + %l3],	%l2
	st	%f22,	[%l7 + 0x18]
	nop
	set	0x43, %o5
	ldstub	[%l7 + %o5],	%i5
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%i6
	nop
	set	0x70, %g6
	swap	[%l7 + %g6],	%o0
	nop
	set	0x16, %l2
	ldsb	[%l7 + %l2],	%o6
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%i6
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%f4
	nop
	set	0x70, %g3
	std	%o0,	[%l7 + %g3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%g6
	nop
	set	0x1A, %l0
	ldub	[%l7 + %l0],	%i2
	ble	%xcc,	loop_17
	nop
	set	0x44, %o3
	swap	[%l7 + %o3],	%i0
	set	0x50, %l4
	stda	%l0,	[%l7 + %l4] 0x88
loop_17:
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%i2
	fpadd32s	%f20,	%f8,	%f19
	nop
	set	0x24, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x64, %o1
	stha	%g1,	[%l7 + %o1] 0x80
	st	%f23,	[%l7 + 0x38]
	nop
	set	0x5C, %o4
	stw	%i4,	[%l7 + %o4]
	set	0x74, %g1
	sta	%f16,	[%l7 + %g1] 0x81
	nop
	set	0x6D, %g4
	ldstub	[%l7 + %g4],	%o3
	nop
	set	0x48, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x7C, %i0
	lduh	[%l7 + %i0],	%l3
	set	0x68, %g2
	stxa	%g2,	[%l7 + %g2] 0x89
	nop
	set	0x08, %o2
	ldsb	[%l7 + %o2],	%g5
	nop
	set	0x40, %l6
	std	%l4,	[%l7 + %l6]
	nop
	set	0x58, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x20, %g5
	stx	%o5,	[%l7 + %g5]
	ld	[%l7 + 0x38],	%f19
	nop
	set	0x6C, %i5
	stw	%o7,	[%l7 + %i5]
	nop
	set	0x38, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x38, %i7
	stx	%l1,	[%l7 + %i7]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%o4
	set	0x40, %i4
	stxa	%i7,	[%l7 + %i4] 0x80
	nop
	set	0x24, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%g7
	nop
	set	0x18, %o5
	stx	%o2,	[%l7 + %o5]
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f10
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xd0
	nop
	set	0x1F, %g6
	ldsb	[%l7 + %g6],	%l2
	nop
	set	0x2D, %l5
	ldub	[%l7 + %l5],	%i5
	nop
	set	0x5E, %l2
	lduh	[%l7 + %l2],	%l6
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%i0
	nop
	set	0x2C, %l0
	ldub	[%l7 + %l0],	%o0
	wr	%o6,	%o1,	%softint
	nop
	set	0x6C, %g3
	ldsh	[%l7 + %g3],	%g4
	set	0x42, %o3
	ldstuba	[%l7 + %o3] 0x80,	%g6
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%l0
	fpadd32s	%f8,	%f17,	%f0
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x89,	%f20
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f0
	add	%i0,	%i3,	%i4
	set	0x38, %o1
	stda	%o2,	[%l7 + %o1] 0x88
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x4F, %o4
	ldsb	[%l7 + %o4],	%g1
	set	0x7C, %l1
	ldstuba	[%l7 + %l1] 0x89,	%g2
	or	%l3,	%l4,	%o5
	nop
	set	0x30, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x08, %g2
	stda	%g4,	[%l7 + %g2] 0x88
	nop
	set	0x70, %o2
	std	%o6,	[%l7 + %o2]
	nop
	set	0x7C, %l6
	ldub	[%l7 + %l6],	%l1
	nop
	set	0x4C, %o6
	ldsh	[%l7 + %o6],	%g3
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%o4
	nop
	set	0x10, %g5
	swap	[%l7 + %g5],	%l5
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x89,	 0
	nop
	set	0x5C, %i7
	stw	%o2,	[%l7 + %i7]
	and	%l2,	%i5,	%g7
	set	0x30, %i5
	stha	%i1,	[%l7 + %i5] 0x88
	st	%f25,	[%l7 + 0x74]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f16
	fpadd16s	%f15,	%f12,	%f11
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f16
	nop
	set	0x68, %i2
	std	%i6,	[%l7 + %i2]
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x88,	%o6
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x1A, %g6
	ldsh	[%l7 + %g6],	%o0
	nop
	set	0x68, %l5
	stb	%g4,	[%l7 + %l5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g6
	nop
	set	0x11, %o5
	ldsb	[%l7 + %o5],	%i6
	nop
	set	0x14, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x34, %i6
	lduh	[%l7 + %i6],	%l0
	nop
	set	0x28, %g3
	ldsw	[%l7 + %g3],	%i0
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%i2
	or	%i4,	%o3,	%i3
	bgu,a,pn	%icc,	loop_18
	nop
	set	0x6A, %o3
	ldsb	[%l7 + %o3],	%g1
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf9,	%f16
loop_18:
	nop
	set	0x10, %g7
	stxa	%l3,	[%l7 + %g7] 0x80
	nop
	set	0x40, %l4
	ldd	[%l7 + %l4],	%f26
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%g2
	set	0x50, %g1
	stba	%o5,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f0
	st	%fsr,	[%l7 + 0x58]
	wr	%l4,	%g5,	%set_softint
	st	%f25,	[%l7 + 0x5C]
	or	%o7,	%l1,	%g3
	nop
	set	0x7B, %g4
	ldub	[%l7 + %g4],	%o4
	set	0x40, %g2
	sta	%f22,	[%l7 + %g2] 0x80
	st	%fsr,	[%l7 + 0x78]
	bleu,a,pn	%xcc,	loop_19
	nop
	set	0x38, %o4
	std	%l4,	[%l7 + %o4]
	st	%f29,	[%l7 + 0x20]
	nop
	set	0x2C, %l6
	ldsh	[%l7 + %l6],	%o2
loop_19:
	nop
	set	0x56, %o2
	stb	%l2,	[%l7 + %o2]
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%i7
	set	0x38, %o6
	stha	%i5,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x7C, %g5
	lduh	[%l7 + %g5],	%g7
	nop
	set	0x3D, %i7
	ldstub	[%l7 + %i7],	%l6
	nop
	set	0x0E, %o7
	ldub	[%l7 + %o7],	%o6
	set	0x70, %i3
	stwa	%i1,	[%l7 + %i3] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%g4
	nop
	set	0x68, %i4
	stx	%g6,	[%l7 + %i4]
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x88,	%o1
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f24
	nop
	set	0x6E, %o0
	ldsh	[%l7 + %o0],	%i6
	nop
	set	0x5C, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x26, %l5
	stba	%l0,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xca
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xcc
	nop
	set	0x20, %g3
	swap	[%l7 + %g3],	%i4
	bne,a	%icc,	loop_20
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x28, %o3
	sta	%f30,	[%l7 + %o3] 0x80
loop_20:
	nop
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x80,	 4
	set	0x4C, %g7
	stha	%i3,	[%l7 + %g7] 0x81
	nop
	set	0x6C, %i6
	swap	[%l7 + %i6],	%g1
	add	%l3,	%i0,	%g2
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x80,	%o5
	bl,a	%icc,	loop_21
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x08, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x81,	 4
loop_21:
	st	%fsr,	[%l7 + 0x1C]
	or	%g5,	%l1,	%o7
	nop
	set	0x24, %g4
	ldsw	[%l7 + %g4],	%o4
	set	0x50, %g1
	swapa	[%l7 + %g1] 0x89,	%g3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%l2
	nop
	set	0x68, %o4
	prefetch	[%l7 + %o4],	 0
	set	0x54, %g2
	sta	%f27,	[%l7 + %g2] 0x80
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f16
	nop
	set	0x40, %l6
	swap	[%l7 + %l6],	%i7
	nop
	set	0x3D, %i0
	ldub	[%l7 + %i0],	%l5
	nop
	set	0x08, %g5
	lduh	[%l7 + %g5],	%i5
	nop
	set	0x58, %o6
	swap	[%l7 + %o6],	%l6
	set	0x66, %o7
	stba	%o6,	[%l7 + %o7] 0x80
	nop
	set	0x48, %i7
	ldx	[%l7 + %i7],	%i1
	or	%o0,	%g4,	%g6
	set	0x78, %i3
	stxa	%g7,	[%l7 + %i3] 0x89
	set	0x78, %i4
	stxa	%i6,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x50, %i5
	stxa	%o1,	[%l7 + %i5] 0x81
	set	0x28, %i2
	stxa	%l0,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	set	0x34, %l5
	ldstuba	[%l7 + %l5] 0x88,	%i4
	and	%o3,	%g1,	%l3
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x88,	%i3
	set	0x0A, %o5
	stha	%g2,	[%l7 + %o5] 0x88
	nop
	set	0x0A, %g3
	sth	%o5,	[%l7 + %g3]
	nop
	set	0x65, %l2
	ldub	[%l7 + %l2],	%i0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%l1
	nop
	set	0x40, %o3
	lduw	[%l7 + %o3],	%o7
	nop
	set	0x50, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%l4
	wr	%o4,	%o2,	%pic
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%i7
	set	0x70, %i6
	stxa	%l5,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x28, %g7
	std	%i4,	[%l7 + %g7]
	nop
	set	0x37, %o1
	stb	%g3,	[%l7 + %o1]
	nop
	set	0x1E, %l4
	sth	%l6,	[%l7 + %l4]
	set	0x78, %g4
	swapa	[%l7 + %g4] 0x81,	%o6
	nop
	set	0x48, %l1
	stb	%i1,	[%l7 + %l1]
	wr	%o0,	%g6,	%softint
	set	0x08, %g1
	stda	%g6,	[%l7 + %g1] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x60, %o4
	ldub	[%l7 + %o4],	%i6
	nop
	set	0x4E, %g2
	ldstub	[%l7 + %g2],	%g4
	nop
	set	0x6B, %l6
	ldub	[%l7 + %l6],	%l0
	nop
	set	0x74, %i0
	lduw	[%l7 + %i0],	%i2
	set	0x5C, %o2
	stwa	%i4,	[%l7 + %o2] 0x89
	nop
	set	0x76, %g5
	ldub	[%l7 + %g5],	%o3
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f14
	set	0x10, %o7
	stda	%o0,	[%l7 + %o7] 0x89
	nop
	set	0x10, %i3
	ldstub	[%l7 + %i3],	%l3
	set	0x18, %i7
	stda	%i2,	[%l7 + %i7] 0x80
	nop
	set	0x24, %i4
	ldstub	[%l7 + %i4],	%g1
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f2
	nop
	set	0x4A, %i2
	ldstub	[%l7 + %i2],	%g2
	set	0x48, %l5
	prefetcha	[%l7 + %l5] 0x81,	 3
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xe2,	%o4
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%f26
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%g4
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc4
	nop
	set	0x75, %l2
	ldub	[%l7 + %l2],	%l1
	and	%l4,	%o4,	%o7
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f16
	nop
	set	0x37, %o3
	ldsb	[%l7 + %o3],	%l2
	nop
	set	0x78, %l0
	lduw	[%l7 + %l0],	%i7
	fpsub32s	%f8,	%f9,	%f9
	nop
	set	0x74, %i1
	stw	%o2,	[%l7 + %i1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x3F9, 	%sys_tick_cmpr
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%o6
	or	%i1,	%l6,	%g6
	set	0x38, %i6
	stxa	%o0,	[%l7 + %i6] 0x88
	nop
	set	0x1C, %o1
	ldsh	[%l7 + %o1],	%g7
	nop
	set	0x34, %g7
	lduw	[%l7 + %g7],	%i6
	st	%f10,	[%l7 + 0x30]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x48, %g4
	std	%l0,	[%l7 + %g4]
	and	%i2,	%i4,	%g4
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x81,	%o2
	nop
	set	0x58, %l1
	std	%f6,	[%l7 + %l1]
	nop
	set	0x10, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x48, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x5C]
	st	%f30,	[%l7 + 0x3C]
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%i3
	set	0x14, %o4
	stha	%o1,	[%l7 + %o4] 0x89
	nop
	set	0x21, %o2
	ldub	[%l7 + %o2],	%g2
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x28, %o6
	swap	[%l7 + %o6],	%g1
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%o4
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f14
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f20
	set	0x59, %i7
	stba	%i0,	[%l7 + %i7] 0x89
	nop
	set	0x5C, %i5
	prefetch	[%l7 + %i5],	 4
	nop
	set	0x38, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x63, %i2
	ldstub	[%l7 + %i2],	%g5
	nop
	set	0x70, %l5
	stw	%l1,	[%l7 + %l5]
	nop
	set	0x17, %g6
	ldsb	[%l7 + %g6],	%l4
	nop
	set	0x2C, %o0
	lduw	[%l7 + %o0],	%o7
	st	%f20,	[%l7 + 0x20]
	fpsub16s	%f9,	%f13,	%f6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%o4
	nop
	set	0x78, %g3
	stx	%i7,	[%l7 + %g3]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	nop
	set	0x2B, %o5
	stb	%o2,	[%l7 + %o5]
	set	0x38, %l3
	stwa	%l5,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x28, %o3
	std	%i4,	[%l7 + %o3]
	nop
	set	0x70, %l0
	ldsh	[%l7 + %l0],	%o6
	nop
	set	0x66, %i6
	lduh	[%l7 + %i6],	%i1
	set	0x4C, %o1
	stwa	%l6,	[%l7 + %o1] 0x81
	nop
	set	0x50, %g7
	ldsh	[%l7 + %g7],	%g3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
	set	0x78, %i1
	lda	[%l7 + %i1] 0x80,	%f15
	set	0x13, %l1
	stba	%g6,	[%l7 + %l1] 0x81
	nop
	set	0x41, %l4
	ldub	[%l7 + %l4],	%g7
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%i6
	ld	[%l7 + 0x54],	%f0
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x81,	%l0
	add	%o0,	%i4,	%i2
	set	0x30, %g2
	lda	[%l7 + %g2] 0x88,	%f0
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%o3
	set	0x48, %g5
	ldstuba	[%l7 + %g5] 0x89,	%l3
	fpadd32	%f10,	%f2,	%f6
	nop
	set	0x5D, %o4
	stb	%g4,	[%l7 + %o4]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%i3
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	and	%g2,	%o5,	%i0
	set	0x6C, %i0
	lda	[%l7 + %i0] 0x88,	%f5
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%g0
	nop
	set	0x58, %o6
	stx	%l1,	[%l7 + %o6]
	ld	[%l7 + 0x5C],	%f4
	set	0x50, %i7
	ldxa	[%l7 + %i7] 0x80,	%g5
	nop
	set	0x67, %i4
	stb	%o7,	[%l7 + %i4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%o4
	set	0x5C, %i5
	stwa	%l4,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x64, %l5
	sta	%f0,	[%l7 + %l5] 0x88
	st	%f24,	[%l7 + 0x74]
	fpadd32s	%f7,	%f27,	%f30
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x80
	ld	[%l7 + 0x7C],	%f17
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%i6
	set	0x08, %l2
	sta	%f23,	[%l7 + %l2] 0x80
	ld	[%l7 + 0x58],	%f1
	nop
	set	0x0C, %o5
	ldstub	[%l7 + %o5],	%l5
	nop
	set	0x78, %l3
	ldstub	[%l7 + %l3],	%i5
	ld	[%l7 + 0x6C],	%f3
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xda
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x80,	%o6
	nop
	set	0x40, %i6
	std	%f14,	[%l7 + %i6]
	add	%i1,	%l6,	%o2
	set	0x68, %o1
	lda	[%l7 + %o1] 0x81,	%f20
	and	%g6,	%g3,	%i6
	set	0x24, %g7
	lda	[%l7 + %g7] 0x80,	%f2
	set	0x50, %o0
	stda	%g6,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x6A, %i1
	stb	%l0,	[%l7 + %i1]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	set	0x4E, %l4
	stba	%i4,	[%l7 + %l4] 0xe2
	membar	#Sync
	ld	[%l7 + 0x38],	%f5
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f26
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%i2
	nop
	set	0x28, %g1
	std	%f22,	[%l7 + %g1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%o0
	set	0x64, %o2
	stwa	%g4,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x08, %g5
	sta	%f17,	[%l7 + %g5] 0x89
	nop
	set	0x68, %o4
	ldsb	[%l7 + %o4],	%o1
	wr	%i3,	%g2,	%pic
	set	0x48, %o7
	stda	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x0E, %g2
	ldsh	[%l7 + %g2],	%i0
	set	0x70, %i3
	lda	[%l7 + %i3] 0x88,	%f14
	nop
	set	0x20, %o6
	swap	[%l7 + %o6],	%o5
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x48, %i0
	stx	%g1,	[%l7 + %i0]
	set	0x08, %i4
	stwa	%l1,	[%l7 + %i4] 0xea
	membar	#Sync
	and	%o7,	%l2,	%o4
	nop
	set	0x38, %l5
	stx	%fsr,	[%l7 + %l5]
	wr 	%g0, 	0x7, 	%fprs
	and	%l4,	%i5,	%l5
	nop
	set	0x20, %g6
	stx	%o6,	[%l7 + %g6]
	set	0x18, %i2
	stda	%i0,	[%l7 + %i2] 0xea
	membar	#Sync
	st	%f12,	[%l7 + 0x48]
	nop
	set	0x48, %g3
	std	%f28,	[%l7 + %g3]
	nop
	set	0x10, %i5
	swap	[%l7 + %i5],	%o2
	add	%l6,	%g6,	%g3
	and	%i6,	%g7,	%i4
	set	0x45, %o5
	stba	%i2,	[%l7 + %o5] 0x80
	nop
	set	0x08, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%l0
	set	0x78, %l0
	stxa	%o3,	[%l7 + %l0] 0x89
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%g4
	add	%o1,	%i3,	%o0
	set	0x70, %o1
	stwa	%g2,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x0B, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i0
	st	%f26,	[%l7 + 0x74]
	nop
	set	0x30, %o0
	stx	%o5,	[%l7 + %o0]
	add	%g1,	%l3,	%o7
	set	0x40, %i1
	stba	%l2,	[%l7 + %i1] 0x89
	nop
	set	0x64, %i6
	ldstub	[%l7 + %i6],	%o4
	nop
	set	0x54, %l1
	stw	%g5,	[%l7 + %l1]
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x80,	%l1
	wr	%l4,	%i7,	%softint
	set	0x28, %l4
	stda	%l4,	[%l7 + %l4] 0x81
	nop
	set	0x52, %l6
	ldstub	[%l7 + %l6],	%i5
	nop
	set	0x60, %g1
	sth	%o6,	[%l7 + %g1]
	nop
	set	0x08, %o2
	stw	%i1,	[%l7 + %o2]
	nop
	set	0x51, %g5
	ldstub	[%l7 + %g5],	%o2
	nop
	set	0x18, %o7
	sth	%g6,	[%l7 + %o7]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f0
	set	0x78, %o4
	stha	%l6,	[%l7 + %o4] 0x88
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x81E, 	%tick_cmpr
	nop
	set	0x24, %i3
	stw	%i4,	[%l7 + %i3]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf9
	membar	#Sync
	nop
	set	0x70, %i0
	stx	%g7,	[%l7 + %i0]
	nop
	set	0x54, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x1C, %l5
	lduh	[%l7 + %l5],	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l0,	%o3
	nop
	set	0x3D, %i4
	ldsb	[%l7 + %i4],	%g4
	set	0x10, %g6
	ldxa	[%l7 + %g6] 0x89,	%i3
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc4
	nop
	set	0x44, %g3
	ldsw	[%l7 + %g3],	%o1
	nop
	set	0x2A, %i5
	ldsh	[%l7 + %i5],	%g2
	nop
	set	0x1C, %l2
	sth	%i0,	[%l7 + %l2]
	nop
	set	0x34, %l3
	ldsw	[%l7 + %l3],	%o0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l3
	set	0x10, %o5
	stxa	%g1,	[%l7 + %o5] 0x89
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd2
	nop
	set	0x66, %o1
	lduh	[%l7 + %o1],	%o7
	nop
	set	0x32, %o3
	ldstub	[%l7 + %o3],	%o4
	nop
	set	0x0C, %o0
	stw	%g5,	[%l7 + %o0]
	nop
	set	0x38, %g7
	std	%l2,	[%l7 + %g7]
	nop
	set	0x38, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x0C, %l1
	swap	[%l7 + %l1],	%l1
	nop
	set	0x08, %g4
	sth	%i7,	[%l7 + %g4]
	nop
	set	0x75, %l4
	stb	%l4,	[%l7 + %l4]
	set	0x64, %l6
	stwa	%i5,	[%l7 + %l6] 0xea
	membar	#Sync
	nop
	set	0x6C, %i1
	stw	%l5,	[%l7 + %i1]
	nop
	set	0x48, %o2
	stx	%fsr,	[%l7 + %o2]
	fpadd16s	%f15,	%f21,	%f6
	nop
	set	0x2F, %g1
	ldstub	[%l7 + %g1],	%i1
	nop
	set	0x24, %g5
	lduw	[%l7 + %g5],	%o6
	nop
	set	0x18, %o7
	lduw	[%l7 + %o7],	%o2
	set	0x28, %g2
	stha	%g6,	[%l7 + %g2] 0x80
	nop
	set	0x1F, %i3
	ldub	[%l7 + %i3],	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%g3
	nop
	set	0x52, %o4
	ldub	[%l7 + %o4],	%g7
	nop
	set	0x65, %o6
	ldub	[%l7 + %o6],	%i4
	set	0x72, %i7
	stha	%l0,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x58, %l5
	ldx	[%l7 + %l5],	%o3
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g4
	nop
	set	0x28, %g6
	ldx	[%l7 + %g6],	%i2
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%i3
	ba,a	%xcc,	loop_22
	ld	[%l7 + 0x74],	%f20
	nop
	set	0x10, %i2
	std	%f26,	[%l7 + %i2]
	nop
	set	0x58, %i5
	ldstub	[%l7 + %i5],	%g2
loop_22:
	nop
	set	0x44, %l2
	prefetch	[%l7 + %l2],	 1
	st	%f4,	[%l7 + 0x28]
	set	0x68, %g3
	ldxa	[%l7 + %g3] 0x81,	%o1
	and	%o0,	%o5,	%i0
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xda
	fpadd32	%f20,	%f18,	%f20
	nop
	set	0x68, %l0
	lduw	[%l7 + %l0],	%l3
	nop
	set	0x44, %o1
	sth	%g1,	[%l7 + %o1]
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%o6
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x81,	%g5
	nop
	set	0x48, %o3
	stx	%l2,	[%l7 + %o3]
	set	0x10, %g7
	stwa	%o4,	[%l7 + %g7] 0x88
	set	0x14, %i6
	stwa	%i7,	[%l7 + %i6] 0x80
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x80,	%l4
	nop
	set	0x10, %l4
	std	%i4,	[%l7 + %l4]
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x88,	 3
	nop
	set	0x7F, %i1
	stb	%i1,	[%l7 + %i1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%o2
	set	0x34, %g4
	lda	[%l7 + %g4] 0x81,	%f20
	nop
	set	0x45, %g1
	stb	%o6,	[%l7 + %g1]
	nop
	set	0x10, %g5
	std	%f12,	[%l7 + %g5]
	nop
	set	0x7C, %o7
	prefetch	[%l7 + %o7],	 1
	set	0x28, %g2
	stxa	%i6,	[%l7 + %g2] 0x81
	nop
	set	0x09, %o2
	stb	%g6,	[%l7 + %o2]
	nop
	set	0x58, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x89,	%i6
	nop
	set	0x76, %i7
	ldsh	[%l7 + %i7],	%g7
	or	%g3,	%i4,	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i2
	nop
	set	0x50, %o4
	std	%f12,	[%l7 + %o4]
	nop
	set	0x5E, %i0
	lduh	[%l7 + %i0],	%i3
	nop
	set	0x6C, %l5
	ldstub	[%l7 + %l5],	%g2
	nop
	set	0x16, %g6
	ldsh	[%l7 + %g6],	%o1
	fpsub16s	%f13,	%f16,	%f4
	set	0x72, %i4
	stba	%o0,	[%l7 + %i4] 0xe3
	membar	#Sync
	ld	[%l7 + 0x68],	%f9
	set	0x3C, %i5
	lda	[%l7 + %i5] 0x88,	%f16
	st	%fsr,	[%l7 + 0x34]
	set	0x30, %l2
	swapa	[%l7 + %l2] 0x80,	%l0
	nop
	set	0x40, %i2
	stx	%o5,	[%l7 + %i2]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	or	%l3,	%i0,	%o7
	set	0x49, %l0
	ldstuba	[%l7 + %l0] 0x89,	%g1
	nop
	set	0x14, %g3
	ldsw	[%l7 + %g3],	%g5
	nop
	set	0x60, %o1
	lduw	[%l7 + %o1],	%l2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f16
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd8
	nop
	set	0x38, %o0
	lduw	[%l7 + %o0],	%o4
	nop
	set	0x14, %i6
	stw	%l4,	[%l7 + %i6]
	set	0x40, %g7
	stwa	%i5,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x5E, %l1
	stb	%i7,	[%l7 + %l1]
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	set	0x22, %i1
	stha	%i1,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x81,	%o2
	set	0x54, %g1
	sta	%f17,	[%l7 + %g1] 0x80
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%l4
	nop
	set	0x40, %g5
	std	%i6,	[%l7 + %g5]
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%o6
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%l6
	nop
	set	0x70, %i3
	lduw	[%l7 + %i3],	%g6
	set	0x24, %o6
	lda	[%l7 + %o6] 0x89,	%f13
	nop
	set	0x48, %i7
	std	%g2,	[%l7 + %i7]
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x89,	%f21
	set	0x38, %o4
	swapa	[%l7 + %o4] 0x89,	%i4
	nop
	set	0x60, %l5
	stw	%o3,	[%l7 + %l5]
	add	%g4,	%g7,	%i3
	and	%i2,	%o1,	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x81,	%l0,	%o5
	set	0x7C, %i0
	stwa	%l3,	[%l7 + %i0] 0x89
	nop
	set	0x30, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x20, %i5
	stda	%i0,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xcc
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%o6
	set	0x14, %l3
	sta	%f14,	[%l7 + %l3] 0x88
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%g2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%o4
	nop
	set	0x68, %l0
	stx	%l4,	[%l7 + %l0]
	nop
	set	0x38, %g3
	std	%i4,	[%l7 + %g3]
	nop
	set	0x14, %o1
	ldsw	[%l7 + %o1],	%i7
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x89
	nop
	set	0x08, %o3
	std	%f8,	[%l7 + %o3]
	add	%l1,	%l2,	%i1
	set	0x20, %o0
	ldda	[%l7 + %o0] 0xeb,	%o2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i6
	fpadd32s	%f18,	%f20,	%f2
	nop
	set	0x54, %g7
	stw	%l6,	[%l7 + %g7]
	set	0x1C, %i2
	sta	%f21,	[%l7 + %i2] 0x88
	nop
	set	0x0D, %l4
	ldstub	[%l7 + %l4],	%g6
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xe2,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%i4
	set	0x2C, %g4
	lda	[%l7 + %g4] 0x80,	%f23
	and	%o3,	%g4,	%g7
	nop
	set	0x3C, %l1
	swap	[%l7 + %l1],	%i3
	set	0x21, %g1
	stba	%o1,	[%l7 + %g1] 0xeb
	membar	#Sync
	bg,a,pn	%xcc,	loop_23
	add	%o0,	%l0,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%i2
loop_23:
	nop
	set	0x28, %g5
	stxa	%i0,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%o7
	set	0x62, %l6
	ldstuba	[%l7 + %l6] 0x81,	%g1
	nop
	set	0x60, %o2
	stx	%g5,	[%l7 + %o2]
	nop
	set	0x68, %o6
	swap	[%l7 + %o6],	%o4
	nop
	set	0x1E, %i7
	ldsb	[%l7 + %i7],	%g2
	nop
	set	0x18, %g2
	std	%f22,	[%l7 + %g2]
	nop
	set	0x53, %o4
	ldsb	[%l7 + %o4],	%l4
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x68, %i3
	std	%f10,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x3C, %i0
	sth	%i5,	[%l7 + %i0]
	nop
	set	0x3C, %l5
	ldsh	[%l7 + %l5],	%l1
	nop
	set	0x40, %i5
	std	%f24,	[%l7 + %i5]
	set	0x1D, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i7
	nop
	set	0x42, %l2
	stb	%i1,	[%l7 + %l2]
	nop
	set	0x64, %g6
	swap	[%l7 + %g6],	%l2
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x88,	%o2
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	nop
	set	0x08, %g3
	ldx	[%l7 + %g3],	%l6
	nop
	set	0x26, %o1
	stb	%g6,	[%l7 + %o1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%l5
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%g2
	ba,a,pt	%icc,	loop_24
	st	%f24,	[%l7 + 0x54]
	nop
	set	0x18, %o3
	ldsh	[%l7 + %o3],	%o3
	st	%fsr,	[%l7 + 0x74]
loop_24:
	nop
	set	0x68, %o0
	std	%f30,	[%l7 + %o0]
	set	0x2C, %i6
	stha	%g4,	[%l7 + %i6] 0x89
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%i3
	ld	[%l7 + 0x5C],	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%o1
	nop
	set	0x16, %g7
	ldsb	[%l7 + %g7],	%l0
	set	0x30, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o0
	set	0x34, %i2
	stwa	%o5,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%l3
	nop
	set	0x18, %i1
	std	%i2,	[%l7 + %i1]
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f8
	set	0x30, %g5
	stda	%i0,	[%l7 + %g5] 0x88
	set	0x08, %g1
	sta	%f6,	[%l7 + %g1] 0x81
	set	0x50, %l6
	ldda	[%l7 + %l6] 0x89,	%g0
	set	0x7C, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o7
	or	%o4,	%g2,	%l4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x89
	nop
	set	0x48, %i7
	stx	%g5,	[%l7 + %i7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i5
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x88,	%f16
	nop
	set	0x3B, %o4
	stb	%i7,	[%l7 + %o4]
	set	0x4A, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i1
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x88,	%l2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xca
	nop
	set	0x78, %i0
	std	%f4,	[%l7 + %i0]
	nop
	set	0x70, %l2
	stw	%o2,	[%l7 + %l2]
	set	0x50, %i4
	stxa	%i6,	[%l7 + %i4] 0x81
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%i6
	nop
	set	0x30, %l0
	ldsh	[%l7 + %l0],	%o6
	nop
	set	0x14, %l3
	prefetch	[%l7 + %l3],	 4
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x6F, %o1
	ldub	[%l7 + %o1],	%l5
	and	%g6,	%o3,	%g4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%g7
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x81,	%i3
	set	0x5C, %o3
	swapa	[%l7 + %o3] 0x80,	%o1
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f14
	nop
	set	0x74, %i6
	ldub	[%l7 + %i6],	%l0
	and	%i4,	%o0,	%o5
	nop
	set	0x78, %o0
	swap	[%l7 + %o0],	%l3
	st	%f17,	[%l7 + 0x5C]
	set	0x40, %g7
	sta	%f9,	[%l7 + %g7] 0x81
	nop
	set	0x1A, %i2
	ldub	[%l7 + %i2],	%i2
	nop
	set	0x20, %g4
	sth	%i0,	[%l7 + %g4]
	set	0x7C, %l4
	stha	%o7,	[%l7 + %l4] 0xe2
	membar	#Sync
	or	%o4,	%g2,	%g1
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%g5
	set	0x48, %g5
	stda	%l0,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x28, %i1
	std	%f4,	[%l7 + %i1]
	ble	%icc,	loop_25
	nop
	set	0x50, %g1
	std	%f28,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x18]
	set	0x08, %o7
	lda	[%l7 + %o7] 0x80,	%f14
loop_25:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%l2
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd0,	%f16
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x81,	%i7
	st	%fsr,	[%l7 + 0x58]
	set	0x2C, %g2
	stha	%o2,	[%l7 + %g2] 0x88
	set	0x68, %l6
	lda	[%l7 + %l6] 0x88,	%f13
	set	0x26, %o2
	stha	%i6,	[%l7 + %o2] 0xea
	membar	#Sync
	ld	[%l7 + 0x1C],	%f29
	set	0x68, %i3
	stwa	%o6,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x4C, %o4
	ldsh	[%l7 + %o4],	%l6
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f4
	add	%g6,	%l5,	%o3
	nop
	set	0x54, %i0
	stw	%g4,	[%l7 + %i0]
	set	0x61, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g7
	nop
	set	0x23, %i4
	ldsb	[%l7 + %i4],	%i3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f18
	nop
	set	0x42, %g6
	ldsh	[%l7 + %g6],	%o1
	nop
	set	0x41, %l3
	ldub	[%l7 + %l3],	%o0
	add	%o5,	%l3,	%i2
	set	0x48, %o1
	swapa	[%l7 + %o1] 0x81,	%i0
	nop
	set	0x40, %o5
	ldstub	[%l7 + %o5],	%i4
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x88,	%o6
	nop
	set	0x2E, %g3
	stb	%o4,	[%l7 + %g3]
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x80,	%g0
	set	0x7C, %l0
	swapa	[%l7 + %l0] 0x89,	%g5
	set	0x66, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g2
	nop
	set	0x72, %g7
	stb	%l1,	[%l7 + %g7]
	or	%l4,	%i5,	%l2
	set	0x7C, %g4
	lda	[%l7 + %g4] 0x80,	%f29
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%o2
	nop
	set	0x70, %i2
	std	%f16,	[%l7 + %i2]
	nop
	set	0x24, %l4
	swap	[%l7 + %l4],	%i7
	set	0x68, %g5
	stda	%o6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x10, %i1
	std	%i6,	[%l7 + %i1]
	nop
	set	0x3A, %l1
	ldsb	[%l7 + %l1],	%i6
	nop
	set	0x20, %g1
	std	%f22,	[%l7 + %g1]
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f20
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%g6
	nop
	set	0x28, %o7
	ldsw	[%l7 + %o7],	%o3
	nop
	set	0x64, %l6
	lduh	[%l7 + %l6],	%l5
	st	%f14,	[%l7 + 0x7C]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%i3
	set	0x40, %g2
	swapa	[%l7 + %g2] 0x81,	%g4
	nop
	set	0x38, %o2
	stb	%l0,	[%l7 + %o2]
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f24
	fpadd32s	%f16,	%f31,	%f26
	nop
	set	0x2C, %i3
	ldsw	[%l7 + %i3],	%g3
	nop
	set	0x0E, %l5
	ldsh	[%l7 + %l5],	%o0
	nop
	set	0x20, %i0
	lduw	[%l7 + %i0],	%o1
	nop
	set	0x24, %i4
	stw	%l3,	[%l7 + %i4]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%o4
	nop
	set	0x38, %g6
	ldsw	[%l7 + %g6],	%i0
	set	0x6C, %i5
	sta	%f28,	[%l7 + %i5] 0x88
	nop
	set	0x26, %l3
	lduh	[%l7 + %l3],	%i2
	set	0x10, %o1
	stwa	%o7,	[%l7 + %o1] 0x88
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x88,	%o4
	set	0x60, %g3
	sta	%f22,	[%l7 + %g3] 0x80
	st	%fsr,	[%l7 + 0x38]
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x88,	%g0
	set	0x0C, %o5
	swapa	[%l7 + %o5] 0x80,	%i4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xda,	%f16
	nop
	set	0x38, %g7
	std	%f14,	[%l7 + %g7]
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	st	%f11,	[%l7 + 0x0C]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%g5
	set	0x34, %i2
	sta	%f15,	[%l7 + %i2] 0x81
	ble	%xcc,	loop_26
	ld	[%l7 + 0x3C],	%f12
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x88,	%l4,	%l2
loop_26:
	nop
	set	0x40, %o0
	stwa	%i1,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xea,	%o2
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x81,	%i7
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x88,	%i4
	bleu,a	%icc,	loop_27
	and	%o6,	%i6,	%l6
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o3
	set	0x78, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l5
loop_27:
	nop
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	nop
	set	0x30, %o7
	stw	%i3,	[%l7 + %o7]
	st	%f31,	[%l7 + 0x58]
	set	0x74, %l1
	stha	%g6,	[%l7 + %l1] 0x89
	nop
	set	0x64, %l6
	ldsw	[%l7 + %l6],	%l0
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
	nop
	set	0x67, %o4
	ldub	[%l7 + %o4],	%g4
	nop
	set	0x4F, %o2
	stb	%o0,	[%l7 + %o2]
	nop
	set	0x20, %i3
	std	%f22,	[%l7 + %i3]
	nop
	set	0x48, %i0
	ldx	[%l7 + %i0],	%l3
	nop
	set	0x54, %l5
	swap	[%l7 + %l5],	%o1
	nop
	set	0x54, %l2
	ldsw	[%l7 + %l2],	%i0
	or	%i2,	%o5,	%o7
	nop
	set	0x70, %g6
	lduw	[%l7 + %g6],	%g1
	wr	%i4,	%g2,	%softint
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%l1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1285
!	Type a   	: 25
!	Type cti   	: 27
!	Type x   	: 524
!	Type f   	: 33
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
	set	0xA,	%g1
	set	0x8,	%g2
	set	0xD,	%g3
	set	0xB,	%g4
	set	0xA,	%g5
	set	0xA,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0xA,	%i1
	set	-0xA,	%i2
	set	-0x4,	%i3
	set	-0x9,	%i4
	set	-0x6,	%i5
	set	-0x8,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x48191A71,	%l0
	set	0x6713E639,	%l1
	set	0x235FD6FB,	%l2
	set	0x1081B3EC,	%l3
	set	0x34B2131F,	%l4
	set	0x39BBFA22,	%l5
	set	0x58316FC2,	%l6
	!# Output registers
	set	0x163D,	%o0
	set	-0x14A7,	%o1
	set	0x11C7,	%o2
	set	0x00FF,	%o3
	set	0x002D,	%o4
	set	0x039E,	%o5
	set	0x1623,	%o6
	set	-0x0A6E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	set	0x68, %i4
	stxa	%g5,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x50, %i5
	stx	%l2,	[%l7 + %i5]
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	fpsub16s	%f12,	%f23,	%f4
	ld	[%l7 + 0x74],	%f29
	nop
	set	0x24, %o3
	stw	%i1,	[%l7 + %o3]
	set	0x1A, %g3
	stba	%i7,	[%l7 + %g3] 0x89
	set	0x14, %i6
	lda	[%l7 + %i6] 0x81,	%f26
	bl,a,pn	%icc,	loop_28
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%o2
	add	%o6,	%i5,	%l6
	ld	[%l7 + 0x4C],	%f28
loop_28:
	nop
	set	0x44, %l0
	ldsw	[%l7 + %l0],	%i6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f0
	nop
	set	0x20, %g7
	stb	%o3,	[%l7 + %g7]
	nop
	set	0x29, %i2
	ldsb	[%l7 + %i2],	%l5
	add	%i3,	%g6,	%l0
	nop
	set	0x3F, %o0
	ldub	[%l7 + %o0],	%g7
	nop
	set	0x77, %g4
	ldub	[%l7 + %g4],	%g4
	set	0x74, %l4
	lda	[%l7 + %l4] 0x89,	%f30
	set	0x48, %i1
	stwa	%o0,	[%l7 + %i1] 0xea
	membar	#Sync
	and	%g3,	%o1,	%l3
	set	0x18, %g5
	stha	%i0,	[%l7 + %g5] 0x89
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%i2
	nop
	set	0x20, %g1
	sth	%o7,	[%l7 + %g1]
	nop
	set	0x30, %i7
	std	%o4,	[%l7 + %i7]
	nop
	set	0x10, %l1
	lduw	[%l7 + %l1],	%i4
	set	0x38, %o7
	stxa	%g2,	[%l7 + %o7] 0x89
	nop
	set	0x4C, %l6
	lduw	[%l7 + %l6],	%g1
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc4
	nop
	set	0x48, %i3
	std	%f8,	[%l7 + %i3]
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x08, %i0
	stwa	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l2
	nop
	set	0x18, %l2
	stx	%g5,	[%l7 + %l2]
	nop
	set	0x6E, %l5
	ldsb	[%l7 + %l5],	%i1
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf9,	%f0
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%l4
	add	%o2,	%i7,	%o6
	set	0x3C, %g6
	swapa	[%l7 + %g6] 0x88,	%l6
	set	0x40, %o3
	ldxa	[%l7 + %o3] 0x89,	%i5
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x80,	%i6
	fpsub32	%f16,	%f22,	%f28
	nop
	set	0x10, %o1
	std	%f24,	[%l7 + %o1]
	nop
	set	0x54, %o5
	swap	[%l7 + %o5],	%o3
	and	%i3,	%g6,	%l0
	nop
	set	0x38, %l0
	std	%g6,	[%l7 + %l0]
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x88,	 1
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x6A, %g7
	ldsb	[%l7 + %g7],	%o0
	and	%g3,	%o1,	%l3
	ld	[%l7 + 0x28],	%f22
	bgu,a,pt	%xcc,	loop_29
	nop
	set	0x23, %i2
	ldstub	[%l7 + %i2],	%i0
	set	0x74, %l3
	ldstuba	[%l7 + %l3] 0x88,	%i2
loop_29:
	nop
	set	0x50, %o0
	std	%f14,	[%l7 + %o0]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x4E, %l4
	ldstub	[%l7 + %l4],	%l5
	and	%o5,	%o7,	%g2
	nop
	set	0x14, %i1
	lduw	[%l7 + %i1],	%g1
	nop
	set	0x6C, %g5
	ldsh	[%l7 + %g5],	%l1
	st	%f18,	[%l7 + 0x20]
	nop
	set	0x10, %g4
	ldx	[%l7 + %g4],	%o4
	set	0x3C, %g1
	lda	[%l7 + %g1] 0x88,	%f19
	or	%i4,	%g5,	%i1
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%l4
	nop
	set	0x28, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x70, %l6
	stda	%o2,	[%l7 + %l6] 0x89
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i7
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf9
	membar	#Sync
	nop
	set	0x3A, %l1
	ldsb	[%l7 + %l1],	%l6
	st	%f18,	[%l7 + 0x58]
	nop
	set	0x60, %i3
	ldsh	[%l7 + %i3],	%i5
	add	%i6,	%o6,	%o3
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%i3
	st	%fsr,	[%l7 + 0x34]
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x80,	 4
	set	0x10, %l2
	stda	%g6,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%g4
	set	0x74, %i4
	swapa	[%l7 + %i4] 0x88,	%o0
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%g3
	set	0x48, %g6
	lda	[%l7 + %g6] 0x88,	%f4
	set	0x48, %o3
	sta	%f5,	[%l7 + %o3] 0x89
	set	0x24, %i5
	sta	%f16,	[%l7 + %i5] 0x89
	nop
	set	0x20, %g3
	stx	%l0,	[%l7 + %g3]
	set	0x20, %o1
	stxa	%l3,	[%l7 + %o1] 0x81
	nop
	set	0x23, %o5
	ldub	[%l7 + %o5],	%i0
	set	0x56, %l0
	stha	%o1,	[%l7 + %l0] 0x81
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f16
	nop
	set	0x38, %i2
	stx	%i2,	[%l7 + %i2]
	nop
	set	0x46, %g7
	ldsh	[%l7 + %g7],	%l5
	set	0x08, %o0
	stwa	%o7,	[%l7 + %o0] 0x89
	nop
	set	0x58, %l4
	ldsb	[%l7 + %l4],	%o5
	set	0x18, %l3
	stwa	%g1,	[%l7 + %l3] 0xea
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%l1
	nop
	set	0x18, %i1
	stb	%o4,	[%l7 + %i1]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i1
	set	0x18, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	set	0x46, %g1
	stha	%o2,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x17, %o6
	ldsb	[%l7 + %o6],	%i7
	nop
	set	0x68, %g5
	prefetch	[%l7 + %g5],	 0
	or	%i5,	%i6,	%o6
	set	0x68, %o7
	ldxa	[%l7 + %o7] 0x81,	%o3
	nop
	set	0x1A, %l6
	ldsb	[%l7 + %l6],	%l6
	set	0x78, %i7
	stxa	%g6,	[%l7 + %i7] 0x88
	nop
	set	0x44, %l1
	swap	[%l7 + %l1],	%i3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f16
	nop
	set	0x6C, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x54, %o2
	stwa	%g4,	[%l7 + %o2] 0x81
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%o0
	nop
	set	0x1E, %l2
	sth	%g7,	[%l7 + %l2]
	set	0x50, %i0
	lda	[%l7 + %i0] 0x80,	%f16
	nop
	set	0x68, %i4
	lduh	[%l7 + %i4],	%l0
	add	%g3,	%l3,	%i0
	nop
	set	0x1E, %g6
	lduh	[%l7 + %g6],	%i2
	nop
	set	0x3A, %l5
	lduh	[%l7 + %l5],	%l5
	and	%o1,	%o7,	%g1
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f22
	nop
	set	0x08, %g3
	std	%g2,	[%l7 + %g3]
	ld	[%l7 + 0x30],	%f9
	set	0x68, %o1
	lda	[%l7 + %o1] 0x89,	%f26
	nop
	set	0x78, %o5
	std	%o4,	[%l7 + %o5]
	nop
	set	0x58, %i5
	std	%l0,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x18, %l0
	std	%o4,	[%l7 + %l0]
	nop
	set	0x56, %i2
	sth	%g5,	[%l7 + %i2]
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%l4
	nop
	set	0x5F, %o0
	stb	%i4,	[%l7 + %o0]
	set	0x66, %i6
	stba	%i1,	[%l7 + %i6] 0xe2
	membar	#Sync
	or	%l2,	%o2,	%i7
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f4
	set	0x60, %i1
	stda	%i4,	[%l7 + %i1] 0x81
	nop
	nop
	setx	0xB909B214,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x6A3F1F2F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f20,	%f29
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%i6
	set	0x73, %g4
	stba	%o6,	[%l7 + %g4] 0x89
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	st	%f31,	[%l7 + 0x34]
	add	%l6,	%o3,	%g6
	set	0x39, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g4
	set	0x25, %g5
	ldstuba	[%l7 + %g5] 0x89,	%i3
	set	0x08, %o7
	stwa	%o0,	[%l7 + %o7] 0xea
	membar	#Sync
	fpadd16	%f14,	%f22,	%f20
	ld	[%l7 + 0x48],	%f15
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f16
	nop
	set	0x10, %l1
	swap	[%l7 + %l1],	%g7
	nop
	set	0x37, %g2
	ldsb	[%l7 + %g2],	%g3
	or	%l0,	%l3,	%i2
	nop
	set	0x3F, %l6
	ldstub	[%l7 + %l6],	%l5
	nop
	set	0x18, %o2
	stx	%o1,	[%l7 + %o2]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x80,	%o7
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%g1
	bg,pn	%xcc,	loop_30
	ld	[%l7 + 0x2C],	%f29
	set	0x64, %i4
	ldstuba	[%l7 + %i4] 0x88,	%g2
loop_30:
	nop
	set	0x18, %g6
	ldxa	[%l7 + %g6] 0x88,	%i0
	set	0x6F, %l5
	stba	%l1,	[%l7 + %l5] 0x88
	nop
	set	0x68, %o3
	stw	%o4,	[%l7 + %o3]
	fpadd16s	%f3,	%f15,	%f29
	nop
	set	0x7C, %g3
	lduw	[%l7 + %g3],	%g5
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x88,	%o5
	set	0x3C, %o5
	stwa	%l4,	[%l7 + %o5] 0x80
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%i4
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%l2
	and	%o2,	%i1,	%i7
	st	%fsr,	[%l7 + 0x70]
	set	0x38, %i5
	stba	%i6,	[%l7 + %i5] 0x81
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f26
	nop
	set	0x78, %i2
	std	%f10,	[%l7 + %i2]
	and	%i5,	%l6,	%o3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f0
	nop
	set	0x64, %l4
	swap	[%l7 + %l4],	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g4
	fpsub32	%f8,	%f22,	%f30
	set	0x38, %i1
	stda	%o0,	[%l7 + %i1] 0x88
	st	%f3,	[%l7 + 0x0C]
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%i3
	fpadd32	%f10,	%f16,	%f6
	nop
	set	0x5C, %o0
	ldsw	[%l7 + %o0],	%g7
	bl,pn	%xcc,	loop_31
	nop
	set	0x40, %g4
	std	%l0,	[%l7 + %g4]
	nop
	set	0x58, %o6
	std	%f24,	[%l7 + %o6]
	set	0x32, %g1
	stha	%g3,	[%l7 + %g1] 0x81
loop_31:
	nop
	set	0x38, %g5
	std	%f28,	[%l7 + %g5]
	nop
	set	0x2C, %i7
	prefetch	[%l7 + %i7],	 2
	and	%i2,	%l3,	%o1
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%g0
	set	0x08, %l6
	stda	%g2,	[%l7 + %l6] 0x89
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf0
	membar	#Sync
	and	%i0,	%o7,	%l1
	set	0x4A, %l2
	stha	%o4,	[%l7 + %l2] 0x89
	nop
	set	0x40, %i3
	ldsw	[%l7 + %i3],	%o5
	nop
	set	0x1D, %i4
	ldstub	[%l7 + %i4],	%g5
	nop
	set	0x10, %g6
	lduw	[%l7 + %g6],	%i4
	set	0x58, %l5
	stxa	%l4,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%l2,	%i1,	%o2
	set	0x68, %i0
	stda	%i6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x54, %g3
	lduw	[%l7 + %g3],	%i5
	nop
	set	0x3C, %o3
	stw	%i7,	[%l7 + %o3]
	fpadd16s	%f19,	%f31,	%f16
	or	%l6,	%o6,	%g6
	nop
	set	0x68, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x5A, %o1
	ldsb	[%l7 + %o1],	%g4
	nop
	set	0x1C, %o5
	ldsw	[%l7 + %o5],	%o0
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x81,	%i3
	add	%g7,	%l0,	%g3
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%o3
	set	0x57, %g7
	stba	%i2,	[%l7 + %g7] 0x88
	set	0x20, %i2
	swapa	[%l7 + %i2] 0x89,	%o1
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x89,	%l3
	nop
	set	0x30, %l3
	std	%l4,	[%l7 + %l3]
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x81,	%g1
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%g2
	nop
	set	0x1C, %g4
	prefetch	[%l7 + %g4],	 0
	nop
	set	0x18, %o6
	stx	%o7,	[%l7 + %o6]
	st	%fsr,	[%l7 + 0x4C]
	set	0x14, %g5
	lda	[%l7 + %g5] 0x81,	%f13
	st	%f7,	[%l7 + 0x48]
	and	%i0,	%o4,	%o5
	set	0x14, %i7
	lda	[%l7 + %i7] 0x80,	%f15
	nop
	set	0x20, %l1
	lduw	[%l7 + %l1],	%g5
	nop
	set	0x4E, %g1
	lduh	[%l7 + %g1],	%l1
	set	0x1C, %l6
	lda	[%l7 + %l6] 0x80,	%f11
	nop
	set	0x44, %o2
	lduw	[%l7 + %o2],	%l4
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	add	%i4,	%i1,	%i6
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f26
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i5
	set	0x08, %i4
	swapa	[%l7 + %i4] 0x80,	%i7
	nop
	set	0x3A, %l2
	ldsh	[%l7 + %l2],	%o2
	nop
	set	0x2C, %g6
	lduh	[%l7 + %g6],	%l6
	set	0x0A, %l5
	stba	%o6,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x70, %i0
	std	%f4,	[%l7 + %i0]
	set	0x68, %g3
	lda	[%l7 + %g3] 0x88,	%f21
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf1
	membar	#Sync
	set	0x0E, %o1
	stha	%g4,	[%l7 + %o1] 0x89
	nop
	set	0x70, %o5
	sth	%o0,	[%l7 + %o5]
	nop
	set	0x0D, %i5
	ldub	[%l7 + %i5],	%i3
	wr	%g6,	%g7,	%sys_tick
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%g2
	nop
	set	0x13, %l0
	ldsb	[%l7 + %l0],	%l0
	nop
	nop
	setx	0x6DCF6689EBEB98AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x1961782230AB97F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f16,	%f22
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x89,	 1
	add	%o3,	%l3,	%o1
	add	%l5,	%g1,	%o7
	nop
	set	0x12, %g7
	sth	%g2,	[%l7 + %g7]
	wr	%i0,	%o4,	%clear_softint
	set	0x30, %l4
	lda	[%l7 + %l4] 0x88,	%f17
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x08, %i6
	stxa	%g5,	[%l7 + %i6] 0xea
	membar	#Sync
	or	%l1,	%l4,	%l2
	nop
	set	0x78, %i1
	sth	%i4,	[%l7 + %i1]
	bg,pt	%icc,	loop_32
	nop
	set	0x30, %g4
	std	%o4,	[%l7 + %g4]
	nop
	set	0x08, %o6
	stx	%i1,	[%l7 + %o6]
	and	%i6,	%i7,	%o2
loop_32:
	nop
	set	0x28, %o0
	prefetch	[%l7 + %o0],	 4
	set	0x7C, %g5
	lda	[%l7 + %g5] 0x81,	%f12
	set	0x70, %i7
	stxa	%l6,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%o6
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f24
	add	%g4,	%o0,	%i3
	nop
	set	0x44, %g1
	ldsb	[%l7 + %g1],	%i5
	add	%g7,	%g6,	%l0
	set	0x58, %g2
	lda	[%l7 + %g2] 0x81,	%f0
	nop
	set	0x50, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x78, %i3
	ldsw	[%l7 + %i3],	%g3
	set	0x75, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i2
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x80,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%l5
	fpadd16	%f22,	%f14,	%f26
	nop
	set	0x5C, %o2
	ldub	[%l7 + %o2],	%g1
	st	%fsr,	[%l7 + 0x30]
	and	%o1,	%o7,	%g2
	nop
	set	0x7C, %g6
	lduw	[%l7 + %g6],	%o4
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f6
	fpsub32	%f22,	%f6,	%f0
	set	0x28, %l5
	prefetcha	[%l7 + %l5] 0x88,	 1
	nop
	nop
	setx	0x2B1902ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x953D4BD0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f16,	%f22
	set	0x18, %o4
	stxa	%l1,	[%l7 + %o4] 0xe3
	membar	#Sync
	fpadd32s	%f19,	%f23,	%f20
	nop
	set	0x2A, %o1
	ldsb	[%l7 + %o1],	%i0
	set	0x24, %o5
	stwa	%l4,	[%l7 + %o5] 0xeb
	membar	#Sync
	fpadd32s	%f14,	%f11,	%f0
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f16
	and	%i4,	%l2,	%o5
	nop
	set	0x74, %o3
	prefetch	[%l7 + %o3],	 4
	set	0x46, %l0
	ldstuba	[%l7 + %l0] 0x80,	%i6
	set	0x38, %i2
	stda	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x48, %i5
	std	%f4,	[%l7 + %i5]
	set	0x08, %l4
	stwa	%o2,	[%l7 + %l4] 0x81
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%i1
	bleu,a,pt	%icc,	loop_33
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f0
loop_33:
	nop
	set	0x50, %i6
	ldx	[%l7 + %i6],	%l6
	nop
	set	0x34, %o6
	stb	%o6,	[%l7 + %o6]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	set	0x48, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g4
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	nop
	set	0x4C, %i7
	ldsb	[%l7 + %i7],	%i3
	set	0x08, %l6
	stxa	%i5,	[%l7 + %l6] 0x88
	nop
	set	0x7B, %g1
	ldsb	[%l7 + %g1],	%g7
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x38, %o7
	std	%l0,	[%l7 + %o7]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%i2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%o2
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%g3
	add	%l5,	%l3,	%o1
	ld	[%l7 + 0x0C],	%f11
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	set	0x50, %g6
	stda	%g2,	[%l7 + %g6] 0x80
	nop
	set	0x40, %i0
	stb	%o4,	[%l7 + %i0]
	nop
	set	0x78, %l5
	ldsw	[%l7 + %l5],	%g1
	st	%f27,	[%l7 + 0x18]
	bleu,a	%xcc,	loop_34
	nop
	set	0x7E, %o4
	ldsb	[%l7 + %o4],	%g5
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%i0
	nop
	set	0x1C, %o5
	stw	%l4,	[%l7 + %o5]
loop_34:
	nop
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xea,	%l0
	fpsub16	%f24,	%f18,	%f10
	add	%i4,	%l2,	%o5
	set	0x48, %o3
	stxa	%i6,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x20, %l2
	swapa	[%l7 + %l2] 0x81,	%o2
	nop
	set	0x34, %l0
	stw	%i1,	[%l7 + %l0]
	nop
	set	0x14, %i2
	swap	[%l7 + %i2],	%l6
	nop
	set	0x3A, %l4
	stb	%o6,	[%l7 + %l4]
	wr	%g4,	%o0,	%y
	st	%f8,	[%l7 + 0x08]
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%i3
	nop
	set	0x08, %l3
	std	%f16,	[%l7 + %l3]
	and	%i7,	%i5,	%l0
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x24, %i6
	swap	[%l7 + %i6],	%g6
	set	0x70, %o6
	stda	%i2,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x6C, %o0
	ldsh	[%l7 + %o0],	%o3
	nop
	set	0x24, %g4
	swap	[%l7 + %g4],	%g3
	and	%l5,	%l3,	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%o7
	nop
	set	0x78, %g7
	ldsh	[%l7 + %g7],	%g2
	or	%o4,	%g1,	%i0
	set	0x44, %i7
	swapa	[%l7 + %i7] 0x80,	%l4
	set	0x24, %l6
	stha	%g5,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x40, %g1
	std	%i4,	[%l7 + %g1]
	set	0x38, %l1
	sta	%f27,	[%l7 + %l1] 0x89
	set	0x30, %g5
	stha	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x20, %o7
	std	%f2,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x7C]
	add	%o5,	%i6,	%l1
	set	0x52, %i4
	stha	%i1,	[%l7 + %i4] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%l6
	set	0x3C, %g2
	stwa	%g4,	[%l7 + %g2] 0xe2
	membar	#Sync
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%o6
	nop
	set	0x2E, %o2
	ldsh	[%l7 + %o2],	%i3
	wr	%i7,	%i5,	%pic
	nop
	set	0x79, %g6
	stb	%g6,	[%l7 + %g6]
	set	0x20, %i3
	stda	%l0,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%o3
	set	0x78, %i0
	stda	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x48, %o4
	stba	%l5,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x63, %o5
	stba	%l3,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x1A, %g3
	sth	%i2,	[%l7 + %g3]
	set	0x68, %o3
	swapa	[%l7 + %o3] 0x88,	%g7
	nop
	set	0x58, %o1
	std	%o0,	[%l7 + %o1]
	set	0x38, %l0
	stxa	%o7,	[%l7 + %l0] 0x89
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%g2
	fpsub32s	%f16,	%f19,	%f5
	nop
	set	0x76, %i2
	ldsh	[%l7 + %i2],	%g1
	set	0x74, %l4
	lda	[%l7 + %l4] 0x81,	%f30
	add	%i0,	%l4,	%g5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%l2
	nop
	set	0x18, %i5
	stw	%i4,	[%l7 + %i5]
	nop
	set	0x1C, %l3
	lduw	[%l7 + %l3],	%o5
	nop
	set	0x18, %i1
	swap	[%l7 + %i1],	%l1
	set	0x20, %i6
	stxa	%i1,	[%l7 + %i6] 0x88
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xe2,	%o2
	set	0x50, %o6
	lda	[%l7 + %o6] 0x80,	%f4
	st	%f27,	[%l7 + 0x20]
	nop
	set	0x10, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x54, %g4
	swapa	[%l7 + %g4] 0x89,	%l6
	nop
	set	0x3C, %i7
	ldsw	[%l7 + %i7],	%g4
	nop
	set	0x48, %l6
	std	%f20,	[%l7 + %l6]
	nop
	set	0x48, %l1
	ldsw	[%l7 + %l1],	%i6
	nop
	nop
	setx	0x942F312FB68BB1FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x849AC7B6ED00181D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f24
	nop
	set	0x61, %g5
	ldsb	[%l7 + %g5],	%o6
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%o0
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%i7
	nop
	set	0x30, %g2
	ldx	[%l7 + %g2],	%i3
	nop
	set	0x38, %i4
	std	%i4,	[%l7 + %i4]
	ld	[%l7 + 0x2C],	%f27
	nop
	set	0x10, %o2
	stw	%g6,	[%l7 + %o2]
	nop
	set	0x77, %i3
	stb	%l0,	[%l7 + %i3]
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x89,	%o3
	nop
	set	0x20, %g6
	std	%f14,	[%l7 + %g6]
	nop
	set	0x48, %o4
	ldub	[%l7 + %o4],	%l5
	set	0x20, %o5
	stxa	%g3,	[%l7 + %o5] 0x89
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%l3
	add	%g7,	%o1,	%o7
	nop
	set	0x1E, %g3
	ldsh	[%l7 + %g3],	%g2
	fpsub16s	%f30,	%f29,	%f19
	set	0x40, %i0
	stha	%g1,	[%l7 + %i0] 0x89
	fpsub32s	%f25,	%f6,	%f13
	set	0x28, %o1
	prefetcha	[%l7 + %o1] 0x88,	 4
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%l4
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xeb,	%o4
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%f22
	set	0x10, %o3
	stwa	%l2,	[%l7 + %o3] 0x89
	nop
	set	0x55, %l4
	ldstub	[%l7 + %l4],	%g5
	nop
	set	0x68, %l3
	std	%f8,	[%l7 + %l3]
	set	0x7C, %i1
	stwa	%o5,	[%l7 + %i1] 0x80
	nop
	set	0x54, %i5
	ldsw	[%l7 + %i5],	%l1
	or	%i4,	%i1,	%o2
	nop
	set	0x64, %o0
	swap	[%l7 + %o0],	%l6
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x80
	set	0x48, %g7
	sta	%f1,	[%l7 + %g7] 0x80
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x80,	 4
	set	0x50, %g4
	stxa	%o6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x50, %i7
	ldda	[%l7 + %i7] 0xeb,	%o0
	nop
	set	0x30, %l6
	ldsw	[%l7 + %l6],	%g4
	nop
	set	0x4C, %g5
	lduw	[%l7 + %g5],	%i3
	set	0x10, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe3,	%i6
	set	0x5A, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g6
	set	0x50, %i4
	lda	[%l7 + %i4] 0x81,	%f16
	nop
	set	0x44, %o2
	ldsw	[%l7 + %o2],	%l0
	add	%o3,	%l5,	%g3
	nop
	set	0x0C, %i3
	ldstub	[%l7 + %i3],	%i2
	set	0x78, %g6
	stxa	%l3,	[%l7 + %g6] 0x88
	set	0x38, %l5
	stwa	%g7,	[%l7 + %l5] 0x80
	nop
	set	0x3A, %o4
	sth	%o1,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x44]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%g2
	wr	%o7,	%i0,	%clear_softint
	nop
	set	0x40, %g3
	std	%f12,	[%l7 + %g3]
	fpadd16s	%f12,	%f26,	%f16
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%l4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l2
	st	%fsr,	[%l7 + 0x58]
	st	%f21,	[%l7 + 0x08]
	nop
	set	0x5E, %i0
	stb	%o4,	[%l7 + %i0]
	st	%f19,	[%l7 + 0x20]
	set	0x3C, %l2
	stwa	%g5,	[%l7 + %l2] 0x80
	set	0x2C, %l0
	sta	%f13,	[%l7 + %l0] 0x88
	set	0x18, %o3
	ldxa	[%l7 + %o3] 0x88,	%l1
	set	0x40, %l4
	sta	%f24,	[%l7 + %l4] 0x81
	nop
	set	0x1C, %l3
	sth	%o5,	[%l7 + %l3]
	fpsub32s	%f8,	%f10,	%f28
	nop
	set	0x74, %i1
	ldsw	[%l7 + %i1],	%i4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%l6
	nop
	set	0x44, %i2
	swap	[%l7 + %i2],	%i6
	and	%o6,	%o0,	%g4
	nop
	set	0x49, %o0
	ldub	[%l7 + %o0],	%i3
	nop
	set	0x68, %i5
	lduw	[%l7 + %i5],	%o2
	nop
	set	0x65, %g7
	ldsb	[%l7 + %g7],	%i7
	nop
	set	0x40, %o6
	std	%f28,	[%l7 + %o6]
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xeb,	%i4
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%o3
	nop
	set	0x56, %i7
	ldsh	[%l7 + %i7],	%g6
	nop
	set	0x50, %l6
	swap	[%l7 + %l6],	%g3
	nop
	set	0x68, %g5
	swap	[%l7 + %g5],	%l5
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%i2
	ld	[%l7 + 0x0C],	%f29
	nop
	set	0x78, %g1
	std	%l2,	[%l7 + %g1]
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%g6
	set	0x6A, %g2
	stha	%g2,	[%l7 + %g2] 0x80
	nop
	set	0x28, %o2
	stx	%o1,	[%l7 + %o2]
	nop
	set	0x7A, %i3
	stb	%o7,	[%l7 + %i3]
	set	0x0A, %i4
	stha	%i0,	[%l7 + %i4] 0x88
	nop
	set	0x38, %g6
	std	%l4,	[%l7 + %g6]
	set	0x1E, %l5
	stha	%l2,	[%l7 + %l5] 0xeb
	membar	#Sync
	add	%o4,	%g1,	%g5
	nop
	set	0x54, %o4
	stw	%l1,	[%l7 + %o4]
	nop
	set	0x0E, %o5
	ldub	[%l7 + %o5],	%o5
	and	%i1,	%l6,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%i6
	nop
	set	0x18, %o1
	prefetch	[%l7 + %o1],	 1
	or	%o0,	%g4,	%o2
	nop
	set	0x0C, %i0
	stw	%i3,	[%l7 + %i0]
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%i4
	nop
	set	0x66, %g3
	lduh	[%l7 + %g3],	%i7
	nop
	set	0x33, %o3
	ldsb	[%l7 + %o3],	%o3
	set	0x40, %l4
	stda	%g6,	[%l7 + %l4] 0xea
	membar	#Sync
	st	%f22,	[%l7 + 0x2C]
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%g2
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%l0
	nop
	set	0x1C, %l0
	ldsw	[%l7 + %l0],	%l5
	ld	[%l7 + 0x58],	%f21
	set	0x41, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i2
	nop
	set	0x7B, %i5
	ldsb	[%l7 + %i5],	%l3
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%g2
	nop
	set	0x25, %i2
	ldub	[%l7 + %i2],	%g7
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0
	nop
	set	0x20, %g4
	lduw	[%l7 + %g4],	%o1
	fpsub32s	%f24,	%f21,	%f11
	nop
	set	0x64, %o6
	lduw	[%l7 + %o6],	%i0
	set	0x70, %i7
	swapa	[%l7 + %i7] 0x88,	%l2
	wr	%o4,	%l4,	%pic
	set	0x20, %g5
	stba	%g1,	[%l7 + %g5] 0x88
	nop
	set	0x24, %l6
	lduw	[%l7 + %l6],	%g5
	st	%f24,	[%l7 + 0x28]
	nop
	set	0x3E, %g1
	ldstub	[%l7 + %g1],	%l1
	set	0x66, %l1
	stba	%i1,	[%l7 + %l1] 0x88
	st	%fsr,	[%l7 + 0x30]
	add	%l6,	%o5,	%o6
	set	0x57, %g2
	stba	%i6,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%o0
	nop
	set	0x56, %o2
	ldsh	[%l7 + %o2],	%i4
	set	0x4C, %i3
	sta	%f31,	[%l7 + %i3] 0x88
	nop
	set	0x40, %i4
	swap	[%l7 + %i4],	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x13E, 	%sys_tick_cmpr
	ld	[%l7 + 0x0C],	%f10
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x81,	%i5
	set	0x62, %o4
	stha	%i7,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x30, %g6
	stxa	%o3,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%g6
	set	0x64, %i0
	lda	[%l7 + %i0] 0x81,	%f9
	nop
	set	0x2C, %o5
	ldsb	[%l7 + %o5],	%l0
	nop
	set	0x58, %g3
	std	%g2,	[%l7 + %g3]
	nop
	set	0x1C, %l2
	ldstub	[%l7 + %l2],	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x81,	%l5,	%g2
	set	0x64, %o3
	stwa	%g7,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%l3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc4
	nop
	set	0x44, %l3
	swap	[%l7 + %l3],	%i0
	nop
	set	0x68, %l0
	ldstub	[%l7 + %l0],	%l2
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x89,	%o4
	set	0x56, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o1
	wr	%g1,	%g5,	%softint
	nop
	set	0x60, %o0
	swap	[%l7 + %o0],	%l1
	nop
	set	0x15, %g7
	ldstub	[%l7 + %g7],	%i1
	or	%l4,	%o5,	%o6
	nop
	set	0x50, %i2
	stx	%i6,	[%l7 + %i2]
	fpsub32	%f12,	%f4,	%f20
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f16
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x81
	nop
	nop
	setx	0x676B80ADB6C9EA74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0E45D9A1D84A451B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f10,	%f0
	nop
	set	0x33, %o6
	ldstub	[%l7 + %o6],	%o0
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%f20
	or	%i4,	%l6,	%i3
	ld	[%l7 + 0x34],	%f27
	nop
	set	0x10, %i7
	ldx	[%l7 + %i7],	%g4
	nop
	set	0x47, %l6
	ldsb	[%l7 + %l6],	%o2
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%i6
	set	0x46, %l1
	stba	%o3,	[%l7 + %l1] 0x80
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%l0
	fpsub16s	%f24,	%f15,	%f26
	and	%g3,	%i5,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%g7
	and	%i2,	%l3,	%i0
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x48, %g2
	std	%l2,	[%l7 + %g2]
	nop
	set	0x34, %o2
	ldsh	[%l7 + %o2],	%o4
	nop
	set	0x10, %o7
	prefetch	[%l7 + %o7],	 3
	nop
	set	0x10, %i3
	prefetch	[%l7 + %i3],	 4
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f14
	fpadd32	%f12,	%f2,	%f12
	st	%f21,	[%l7 + 0x54]
	set	0x74, %o4
	lda	[%l7 + %o4] 0x81,	%f25
	nop
	set	0x70, %g6
	lduh	[%l7 + %g6],	%o1
	add	%g1,	%o7,	%g5
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xea,	%l0
	nop
	set	0x6E, %l5
	sth	%l4,	[%l7 + %l5]
	fpsub32s	%f6,	%f2,	%f3
	and	%o5,	%o6,	%i1
	nop
	set	0x10, %i0
	ldsw	[%l7 + %i0],	%i6
	set	0x4C, %o5
	stwa	%i4,	[%l7 + %o5] 0x80
	ld	[%l7 + 0x6C],	%f2
	nop
	set	0x28, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x58, %g3
	std	%i6,	[%l7 + %g3]
	nop
	set	0x24, %l4
	lduw	[%l7 + %l4],	%o0
	or	%g4,	%i3,	%o2
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%o2
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f10
	set	0x70, %l3
	sta	%f19,	[%l7 + %l3] 0x88
	nop
	set	0x30, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x81,	%g6
	nop
	set	0x08, %g7
	lduw	[%l7 + %g7],	%i7
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%l0
	nop
	set	0x40, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x10, %g4
	std	%f14,	[%l7 + %g4]
	nop
	set	0x56, %o6
	stb	%i5,	[%l7 + %o6]
	nop
	set	0x28, %i2
	lduh	[%l7 + %i2],	%g3
	ld	[%l7 + 0x24],	%f22
	st	%f22,	[%l7 + 0x24]
	nop
	set	0x4A, %i7
	ldsh	[%l7 + %i7],	%l5
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x81,	%g7
	and	%i2,	%l3,	%i0
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x89,	%g2
	st	%f1,	[%l7 + 0x38]
	nop
	set	0x64, %l1
	lduw	[%l7 + %l1],	%l2
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 0
	set	0x44, %o2
	lda	[%l7 + %o2] 0x88,	%f8
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x88,	%o1
	nop
	set	0x7C, %i3
	prefetch	[%l7 + %i3],	 4
	set	0x58, %g1
	stxa	%g1,	[%l7 + %g1] 0x89
	or	%o4,	%o7,	%l1
	nop
	set	0x18, %o4
	lduh	[%l7 + %o4],	%g5
	and	%l4,	%o5,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i4
	nop
	set	0x74, %g6
	stw	%l6,	[%l7 + %g6]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x81
	nop
	set	0x44, %l5
	ldsw	[%l7 + %l5],	%i1
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%o0
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%o2
	nop
	set	0x4C, %l2
	stw	%g6,	[%l7 + %l2]
	ba,pt	%xcc,	loop_35
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%o3
	or	%i7,	%l0,	%g3
	set	0x60, %l4
	ldda	[%l7 + %l4] 0xe2,	%l4
loop_35:
	nop
	set	0x48, %o5
	stwa	%g7,	[%l7 + %o5] 0xea
	membar	#Sync
	wr	%i2,	%i5,	%ccr
	set	0x4C, %l0
	stwa	%i0,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x7A, %o3
	stb	%g2,	[%l7 + %o3]
	or	%l2,	%l3,	%o1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x42, %l3
	ldsh	[%l7 + %l3],	%o4
	set	0x14, %i1
	swapa	[%l7 + %i1] 0x88,	%g1
	fpsub32	%f0,	%f4,	%f0
	add	%l1,	%o7,	%g5
	ld	[%l7 + 0x30],	%f7
	nop
	set	0x50, %g7
	std	%f18,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x1E, %o0
	ldstub	[%l7 + %o0],	%o5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x80,	%f16
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd0,	%f16
	nop
	set	0x60, %o6
	stx	%l4,	[%l7 + %o6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x18, %g4
	ldstub	[%l7 + %g4],	%i4
	nop
	set	0x0A, %i7
	ldub	[%l7 + %i7],	%l6
	nop
	set	0x08, %i2
	stx	%o0,	[%l7 + %i2]
	nop
	set	0x4E, %g5
	ldstub	[%l7 + %g5],	%i1
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xda
	nop
	set	0x13, %l1
	ldstub	[%l7 + %l1],	%i3
	and	%o2,	%g4,	%o3
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd2
	nop
	nop
	setx	0xE5ABB1C5BA72EAC0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF346E08D86908B82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f0,	%f4
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe2,	%g6
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	nop
	set	0x38, %g1
	std	%f24,	[%l7 + %g1]
	set	0x1E, %o4
	stha	%g3,	[%l7 + %o4] 0x89
	set	0x38, %g6
	stxa	%l0,	[%l7 + %g6] 0x89
	nop
	set	0x37, %i3
	ldsb	[%l7 + %i3],	%g7
	set	0x5C, %o1
	sta	%f29,	[%l7 + %o1] 0x88
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%i2
	set	0x5F, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l5
	nop
	set	0x2C, %i0
	stw	%i5,	[%l7 + %i0]
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x88,	 4
	set	0x70, %l4
	stba	%l2,	[%l7 + %l4] 0xea
	membar	#Sync
	set	0x20, %g3
	stxa	%l3,	[%l7 + %g3] 0x80
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xcc
	nop
	set	0x78, %l0
	sth	%g2,	[%l7 + %l0]
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%o4
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%g1
	nop
	set	0x2C, %o3
	lduh	[%l7 + %o3],	%o7
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%o5
	nop
	set	0x2B, %i6
	ldstub	[%l7 + %i6],	%g5
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x81,	%o6
	nop
	set	0x52, %o0
	ldstub	[%l7 + %o0],	%l4
	nop
	set	0x08, %g4
	stx	%i4,	[%l7 + %g4]
	set	0x27, %i2
	stba	%l6,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x20, %g5
	stw	%i6,	[%l7 + %g5]
	nop
	set	0x0E, %l6
	ldstub	[%l7 + %l6],	%o0
	fpadd32	%f20,	%f28,	%f2
	set	0x20, %i7
	stxa	%i3,	[%l7 + %i7] 0x80
	nop
	set	0x49, %l1
	ldsb	[%l7 + %l1],	%i1
	fpadd32	%f16,	%f8,	%f6
	set	0x3D, %o2
	stba	%g4,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x20, %g2
	swapa	[%l7 + %g2] 0x80,	%o3
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf0
	membar	#Sync
	set	0x48, %o4
	stda	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x88,	%f16
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x25, %o1
	stba	%i7,	[%l7 + %o1] 0x89
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%f4
	and	%g3,	%l0,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%l5
	set	0x7E, %l5
	ldstuba	[%l7 + %l5] 0x89,	%i2
	nop
	set	0x12, %i4
	sth	%i0,	[%l7 + %i4]
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%l2
	set	0x28, %l2
	lda	[%l7 + %l2] 0x81,	%f31
	nop
	set	0x63, %g3
	stb	%l3,	[%l7 + %g3]
	and	%i5,	%g2,	%o1
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x81,	%l0
	nop
	set	0x50, %o5
	ldsw	[%l7 + %o5],	%o4
	nop
	set	0x5D, %l3
	stb	%o7,	[%l7 + %l3]
	and	%g1,	%g5,	%o6
	set	0x1A, %i1
	stha	%o5,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x58, %l0
	lduw	[%l7 + %l0],	%l4
	nop
	set	0x44, %o3
	swap	[%l7 + %o3],	%i4
	ld	[%l7 + 0x58],	%f16
	nop
	set	0x60, %i5
	sth	%i6,	[%l7 + %i5]
	set	0x3C, %g7
	lda	[%l7 + %g7] 0x80,	%f22
	add	%l6,	%i3,	%o0
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc4
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x89,	 0
	nop
	set	0x30, %o6
	std	%f30,	[%l7 + %o6]
	nop
	set	0x54, %g4
	ldsb	[%l7 + %g4],	%i1
	ld	[%l7 + 0x40],	%f8
	nop
	set	0x48, %i2
	stx	%o3,	[%l7 + %i2]
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf0,	%f16
	set	0x40, %g5
	stxa	%i7,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x50, %i7
	std	%g2,	[%l7 + %i7]
	set	0x30, %o2
	stxa	%g6,	[%l7 + %o2] 0x81
	ld	[%l7 + 0x0C],	%f11
	nop
	set	0x70, %l1
	stw	%o2,	[%l7 + %l1]
	nop
	set	0x75, %g2
	stb	%l0,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x58, %o7
	std	%f18,	[%l7 + %o7]
	set	0x60, %o4
	stda	%g6,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x6F, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i2
	set	0x35, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i0
	nop
	set	0x68, %g6
	std	%l4,	[%l7 + %g6]
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%l3
	nop
	set	0x2C, %i4
	sth	%l2,	[%l7 + %i4]
	nop
	set	0x18, %i0
	std	%g2,	[%l7 + %i0]
	nop
	set	0x0C, %l5
	ldsb	[%l7 + %l5],	%o1
	fpadd16	%f28,	%f14,	%f8
	nop
	set	0x20, %l2
	stx	%l1,	[%l7 + %l2]
	nop
	set	0x0C, %l4
	ldub	[%l7 + %l4],	%i5
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f0
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f4
	nop
	set	0x0C, %i1
	ldsh	[%l7 + %i1],	%o4
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x08, %o3
	std	%g0,	[%l7 + %o3]
	or	%o7,	%g5,	%o5
	st	%f20,	[%l7 + 0x2C]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%i4
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%i6
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x88,	%l6
	or	%o6,	%o0,	%i3
	set	0x74, %g7
	lda	[%l7 + %g7] 0x80,	%f4
	add	%g4,	%i1,	%o3
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x89,	 2
	or	%i7,	%o2,	%l0
	ld	[%l7 + 0x3C],	%f6
	nop
	set	0x6C, %o0
	sth	%g7,	[%l7 + %o0]
	set	0x64, %g4
	sta	%f15,	[%l7 + %g4] 0x89
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f16
	ld	[%l7 + 0x54],	%f2
	set	0x30, %l6
	stxa	%i2,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x10, %g5
	stxa	%i0,	[%l7 + %g5] 0x88
	set	0x60, %i2
	stha	%g6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x38, %o2
	stha	%l3,	[%l7 + %o2] 0x81
	fpsub32	%f12,	%f6,	%f24
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%l2
	nop
	set	0x18, %g2
	stx	%l5,	[%l7 + %g2]
	set	0x08, %o7
	sta	%f30,	[%l7 + %o7] 0x89
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f8
	st	%f29,	[%l7 + 0x24]
	nop
	set	0x53, %o4
	ldsb	[%l7 + %o4],	%g2
	nop
	set	0x58, %i3
	stx	%o1,	[%l7 + %i3]
	add	%l1,	%i5,	%o4
	nop
	set	0x68, %g1
	lduw	[%l7 + %g1],	%o7
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%g5
	set	0x58, %o1
	sta	%f0,	[%l7 + %o1] 0x88
	bg,a,pt	%xcc,	loop_36
	or	%g1,	%o5,	%i4
	or	%i6,	%l4,	%l6
	set	0x76, %i4
	stha	%o6,	[%l7 + %i4] 0xea
	membar	#Sync
loop_36:
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x6A, %i0
	lduh	[%l7 + %i0],	%o0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	and	%i3,	%i1,	%g4
	set	0x78, %l4
	ldxa	[%l7 + %l4] 0x89,	%o3
	set	0x60, %l2
	stxa	%i7,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x44, %g3
	sta	%f0,	[%l7 + %g3] 0x89
	set	0x58, %o5
	sta	%f25,	[%l7 + %o5] 0x80
	set	0x3A, %i1
	stba	%g3,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x7C, %o3
	swap	[%l7 + %o3],	%o2
	nop
	set	0x7C, %l3
	ldsw	[%l7 + %l3],	%g7
	set	0x29, %l0
	stba	%i2,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x80,	 1
	nop
	set	0x48, %g7
	ldsh	[%l7 + %g7],	%g6
	set	0x48, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	nop
	set	0x38, %i6
	std	%l0,	[%l7 + %i6]
	nop
	set	0x5B, %o6
	ldub	[%l7 + %o6],	%l5
	set	0x29, %g4
	stba	%l2,	[%l7 + %g4] 0xe3
	membar	#Sync
	ld	[%l7 + 0x5C],	%f31
	be,a	%icc,	loop_37
	fpadd32s	%f29,	%f3,	%f10
	or	%g2,	%o1,	%i5
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%f14
loop_37:
	nop
	set	0x56, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l1
	nop
	set	0x38, %o2
	lduw	[%l7 + %o2],	%o7
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%o4
	set	0x60, %i2
	prefetcha	[%l7 + %i2] 0x81,	 2
	add	%g5,	%i4,	%o5
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x89
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x48, %l1
	sta	%f7,	[%l7 + %l1] 0x88
	fpsub32	%f28,	%f16,	%f22
	wr	%l4,	%l6,	%softint
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xda
	wr	%o6,	%i6,	%y
	set	0x24, %g1
	stba	%o0,	[%l7 + %g1] 0x80
	nop
	set	0x0C, %g6
	swap	[%l7 + %g6],	%i1
	nop
	set	0x48, %o1
	stw	%i3,	[%l7 + %o1]
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%g4
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%i7
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x68, %l4
	std	%f14,	[%l7 + %l4]
	add	%o3,	%o2,	%g3
	nop
	set	0x20, %l2
	ldsw	[%l7 + %l2],	%i2
	nop
	set	0x78, %g3
	stx	%i0,	[%l7 + %g3]
	set	0x2A, %l5
	stha	%g6,	[%l7 + %l5] 0x88
	ble,pt	%icc,	loop_38
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%l3
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf0,	%f0
loop_38:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%g7
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%l2
	ba,a,pn	%icc,	loop_39
	nop
	set	0x1C, %l0
	stw	%g2,	[%l7 + %l0]
	fpsub16s	%f15,	%f19,	%f20
	set	0x7A, %i5
	ldstuba	[%l7 + %i5] 0x89,	%l5
loop_39:
	nop
	set	0x14, %g7
	stha	%o1,	[%l7 + %g7] 0x88
	nop
	set	0x68, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%i5
	nop
	set	0x50, %i1
	ldub	[%l7 + %i1],	%o7
	nop
	set	0x44, %g4
	ldsh	[%l7 + %g4],	%o4
	fpsub16	%f2,	%f16,	%f30
	nop
	set	0x14, %o6
	stw	%g1,	[%l7 + %o6]
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%g4
	ld	[%l7 + 0x78],	%f2
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%i4
	set	0x1E, %i7
	stba	%l1,	[%l7 + %i7] 0x88
	set	0x60, %i2
	lda	[%l7 + %i2] 0x80,	%f2
	nop
	set	0x08, %g5
	prefetch	[%l7 + %g5],	 2
	nop
	set	0x10, %g2
	stx	%o5,	[%l7 + %g2]
	nop
	set	0x1E, %o7
	ldsh	[%l7 + %o7],	%l4
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o6
	nop
	set	0x38, %i3
	ldstub	[%l7 + %i3],	%i6
	set	0x14, %g6
	stha	%o0,	[%l7 + %g6] 0x88
	nop
	set	0x22, %o1
	ldub	[%l7 + %o1],	%i3
	st	%f2,	[%l7 + 0x7C]
	set	0x58, %g1
	lda	[%l7 + %g1] 0x81,	%f18
	set	0x24, %i4
	ldstuba	[%l7 + %i4] 0x88,	%i1
	nop
	set	0x40, %o4
	stw	%g4,	[%l7 + %o4]
	nop
	set	0x6E, %l4
	lduh	[%l7 + %l4],	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%g3
	set	0x60, %i0
	stxa	%i2,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf8
	membar	#Sync
	nop
	set	0x63, %l5
	stb	%o2,	[%l7 + %l5]
	ld	[%l7 + 0x18],	%f26
	nop
	set	0x7C, %g3
	sth	%i0,	[%l7 + %g3]
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f14
	or	%l3,	%g6,	%l0
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x80,	%l2
	st	%f22,	[%l7 + 0x34]
	or	%g2,	%g7,	%o1
	fpadd16	%f8,	%f24,	%f20
	add	%i5,	%l5,	%o4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%g5
	nop
	set	0x12, %l0
	lduh	[%l7 + %l0],	%i4
	nop
	set	0x1C, %o3
	prefetch	[%l7 + %o3],	 0
	set	0x0D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%g1
	or	%l1,	%o5,	%l6
	or	%l4,	%i6,	%o6
	set	0x77, %g7
	stba	%i3,	[%l7 + %g7] 0xeb
	membar	#Sync
	or	%i1,	%o0,	%o3
	nop
	set	0x30, %i6
	std	%i6,	[%l7 + %i6]
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x18, %g4
	ldsb	[%l7 + %g4],	%g3
	nop
	set	0x7C, %o6
	ldsw	[%l7 + %o6],	%i2
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf1
	membar	#Sync
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%g4
	nop
	set	0x3C, %o2
	stw	%o2,	[%l7 + %o2]
	add	%l3,	%i0,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%g2
	set	0x50, %i7
	sta	%f18,	[%l7 + %i7] 0x88
	nop
	set	0x36, %i2
	lduh	[%l7 + %i2],	%g6
	nop
	set	0x3E, %g5
	sth	%g7,	[%l7 + %g5]
	nop
	set	0x70, %g2
	std	%f30,	[%l7 + %g2]
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xca
	nop
	set	0x68, %l1
	ldx	[%l7 + %l1],	%o1
	nop
	set	0x38, %i3
	ldsw	[%l7 + %i3],	%i5
	set	0x5B, %g6
	stba	%l5,	[%l7 + %g6] 0x80
	nop
	set	0x18, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x68, %i4
	std	%f8,	[%l7 + %i4]
	nop
	set	0x52, %o4
	ldstub	[%l7 + %o4],	%o7
	nop
	set	0x70, %l4
	ldstub	[%l7 + %l4],	%g5
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%g1
	nop
	set	0x18, %l2
	std	%l0,	[%l7 + %l2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x39A, 	%sys_tick_cmpr
	set	0x28, %g1
	swapa	[%l7 + %g1] 0x89,	%l4
	set	0x44, %g3
	lda	[%l7 + %g3] 0x89,	%f14
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%i4
	nop
	set	0x66, %l5
	sth	%o6,	[%l7 + %l5]
	st	%f1,	[%l7 + 0x10]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i1
	nop
	set	0x47, %l3
	ldub	[%l7 + %l3],	%o0
	nop
	set	0x38, %o3
	std	%i2,	[%l7 + %o3]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x88,	%o3
	nop
	set	0x68, %i6
	lduw	[%l7 + %i6],	%g3
	nop
	set	0x7A, %o0
	ldsh	[%l7 + %o0],	%i2
	set	0x28, %g7
	lda	[%l7 + %g7] 0x89,	%f18
	and	%i7,	%g4,	%l3
	set	0x08, %o6
	lda	[%l7 + %o6] 0x80,	%f28
	set	0x20, %g4
	stha	%i0,	[%l7 + %g4] 0xe2
	membar	#Sync
	wr	%l0,	%l2,	%clear_softint
	set	0x50, %l6
	ldxa	[%l7 + %l6] 0x80,	%g2
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f16
	set	0x78, %o2
	sta	%f13,	[%l7 + %o2] 0x80
	set	0x48, %i7
	stxa	%g6,	[%l7 + %i7] 0x81
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g7
	nop
	set	0x50, %g5
	lduw	[%l7 + %g5],	%o1
	nop
	set	0x68, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x24, %i2
	lda	[%l7 + %i2] 0x88,	%f16
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f24
	nop
	set	0x7A, %o7
	ldsh	[%l7 + %o7],	%l5
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%i5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	fpadd16	%f12,	%f12,	%f2
	nop
	set	0x20, %o1
	lduw	[%l7 + %o1],	%o4
	st	%fsr,	[%l7 + 0x64]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	wr	%o7,	%g1,	%clear_softint
	set	0x50, %o4
	stxa	%l1,	[%l7 + %o4] 0xea
	membar	#Sync
	add	%g5,	%o5,	%l4
	nop
	set	0x74, %l2
	ldsw	[%l7 + %l2],	%i4
	nop
	set	0x7C, %g1
	lduh	[%l7 + %g1],	%o6
	and	%i6,	%l6,	%o0
	set	0x68, %g3
	stda	%i2,	[%l7 + %g3] 0x88
	and	%i1,	%o3,	%i2
	nop
	set	0x68, %i0
	ldub	[%l7 + %i0],	%g3
	nop
	set	0x08, %l5
	swap	[%l7 + %l5],	%i7
	or	%g4,	%i0,	%l3
	add	%l0,	%l2,	%g2
	set	0x50, %o5
	sta	%f31,	[%l7 + %o5] 0x89
	nop
	set	0x6E, %o3
	stb	%o2,	[%l7 + %o3]
	nop
	set	0x28, %i5
	std	%f20,	[%l7 + %i5]
	nop
	set	0x14, %l3
	stw	%g6,	[%l7 + %l3]
	nop
	set	0x64, %l0
	ldstub	[%l7 + %l0],	%o1
	set	0x3F, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l5
	nop
	set	0x0C, %g7
	ldstub	[%l7 + %g7],	%i5
	nop
	set	0x2E, %o6
	ldub	[%l7 + %o6],	%g7
	set	0x16, %o0
	ldstuba	[%l7 + %o0] 0x88,	%o7
	fpadd32s	%f21,	%f14,	%f20
	bne,a,pt	%icc,	loop_40
	ld	[%l7 + 0x14],	%f9
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc8
loop_40:
	nop
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%g1
	nop
	set	0x50, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x40, %i1
	std	%f30,	[%l7 + %i1]
	set	0x78, %g5
	stda	%l0,	[%l7 + %g5] 0x89
	nop
	set	0x62, %i2
	stb	%g5,	[%l7 + %i2]
	set	0x10, %g2
	stda	%o4,	[%l7 + %g2] 0x88
	nop
	set	0x60, %o7
	lduh	[%l7 + %o7],	%o4
	wr 	%g0, 	0x4, 	%fprs
	add	%i4,	%l6,	%o0
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x81,	%f0
	nop
	set	0x30, %g6
	ldsw	[%l7 + %g6],	%i3
	nop
	set	0x38, %i3
	std	%i6,	[%l7 + %i3]
	nop
	set	0x08, %o1
	ldsh	[%l7 + %o1],	%o3
	nop
	set	0x50, %l4
	std	%i2,	[%l7 + %l4]
	set	0x0C, %i4
	sta	%f7,	[%l7 + %i4] 0x80
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i7
	set	0x10, %o4
	stwa	%g3,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x89,	%i0
	nop
	set	0x7C, %g3
	prefetch	[%l7 + %g3],	 4
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xeb,	%l2
	and	%l0,	%l2,	%g4
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	or	%o2,	%g6,	%o1
	set	0x2C, %o3
	sta	%f9,	[%l7 + %o3] 0x81
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%l5
	st	%f21,	[%l7 + 0x40]
	nop
	set	0x38, %i5
	std	%i4,	[%l7 + %i5]
	nop
	set	0x30, %l0
	stx	%g7,	[%l7 + %l0]
	nop
	set	0x20, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x78, %i6
	std	%g0,	[%l7 + %i6]
	nop
	set	0x7C, %g7
	ldsh	[%l7 + %g7],	%l1
	set	0x08, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	nop
	set	0x62, %o6
	sth	%g5,	[%l7 + %o6]
	nop
	set	0x37, %l6
	ldub	[%l7 + %l6],	%o5
	nop
	set	0x42, %g4
	ldsh	[%l7 + %g4],	%o4
	and	%l4,	%o6,	%i4
	nop
	nop
	setx	0x8945CCF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x8D58366A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f28,	%f23
	nop
	set	0x2A, %i7
	lduh	[%l7 + %i7],	%o0
	nop
	set	0x2D, %i1
	ldstub	[%l7 + %i1],	%l6
	set	0x7E, %o2
	stha	%i6,	[%l7 + %o2] 0x88
	nop
	set	0x30, %g5
	stx	%i3,	[%l7 + %g5]
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x89,	%i2
	set	0x14, %g2
	lda	[%l7 + %g2] 0x88,	%f19
	set	0x5C, %l1
	swapa	[%l7 + %l1] 0x80,	%i1
	wr	%i7,	%g3,	%sys_tick
	nop
	set	0x2E, %o7
	ldsb	[%l7 + %o7],	%i0
	nop
	set	0x62, %i3
	stb	%l3,	[%l7 + %i3]
	set	0x20, %o1
	sta	%f14,	[%l7 + %o1] 0x80
	st	%fsr,	[%l7 + 0x2C]
	and	%l0,	%o3,	%g4
	nop
	set	0x50, %l4
	std	%g2,	[%l7 + %l4]
	set	0x7B, %i4
	stba	%l2,	[%l7 + %i4] 0x88
	nop
	set	0x68, %o4
	lduw	[%l7 + %o4],	%o2
	nop
	set	0x0E, %g6
	ldstub	[%l7 + %g6],	%g6
	set	0x70, %g1
	stwa	%l5,	[%l7 + %g1] 0x80
	nop
	set	0x18, %g3
	std	%f18,	[%l7 + %g3]
	nop
	set	0x62, %i0
	stb	%i5,	[%l7 + %i0]
	nop
	set	0x34, %l5
	stw	%o1,	[%l7 + %l5]
	nop
	set	0x44, %l2
	prefetch	[%l7 + %l2],	 0
	nop
	set	0x7C, %o3
	sth	%g1,	[%l7 + %o3]
	nop
	set	0x16, %i5
	lduh	[%l7 + %i5],	%g7
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%l1
	st	%fsr,	[%l7 + 0x1C]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf9
	membar	#Sync
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f16
	ld	[%l7 + 0x78],	%f25
	set	0x64, %i6
	stha	%g5,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x78, %g7
	stwa	%o5,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x20, %o0
	stwa	%o4,	[%l7 + %o0] 0x81
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x81,	%o7
	wr	%l4,	%i4,	%ccr
	set	0x14, %g4
	sta	%f28,	[%l7 + %g4] 0x81
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf9
	membar	#Sync
	set	0x30, %i1
	stda	%o0,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x50, %o2
	sta	%f19,	[%l7 + %o2] 0x88
	st	%fsr,	[%l7 + 0x28]
	st	%f26,	[%l7 + 0x60]
	nop
	set	0x6C, %i7
	lduw	[%l7 + %i7],	%o6
	add	%l6,	%i3,	%i2
	set	0x4B, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i6
	set	0x48, %g2
	stda	%i0,	[%l7 + %g2] 0x81
	nop
	set	0x20, %l1
	swap	[%l7 + %l1],	%i7
	nop
	set	0x0C, %g5
	ldsh	[%l7 + %g5],	%g3
	nop
	set	0x70, %o7
	std	%f8,	[%l7 + %o7]
	ld	[%l7 + 0x74],	%f28
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%i0
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x81,	%l2
	nop
	set	0x40, %l4
	prefetch	[%l7 + %l4],	 1
	nop
	set	0x08, %i4
	std	%f0,	[%l7 + %i4]
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f22
	be	%icc,	loop_41
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f6
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%l0
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x89,	%o2
loop_41:
	nop
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x89,	%g2
	nop
	set	0x40, %l5
	ldsb	[%l7 + %l5],	%g4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%o2
	set	0x50, %l2
	stba	%l5,	[%l7 + %l2] 0x80
	nop
	set	0x72, %o3
	ldsh	[%l7 + %o3],	%g6
	set	0x60, %o5
	sta	%f26,	[%l7 + %o5] 0x88
	nop
	set	0x74, %l0
	ldstub	[%l7 + %l0],	%i5
	add	%g1,	%g7,	%o1
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xe2,	%g4
	or	%o5,	%l1,	%o4
	nop
	set	0x24, %i5
	swap	[%l7 + %i5],	%o7
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f0
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%l4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	set	0x20, %g4
	sta	%f9,	[%l7 + %g4] 0x81
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%o0
	nop
	set	0x48, %l6
	stx	%fsr,	[%l7 + %l6]
	fpadd16	%f8,	%f4,	%f30
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x89,	%i4
	set	0x0E, %i1
	stba	%o6,	[%l7 + %i1] 0x89
	st	%f13,	[%l7 + 0x40]
	nop
	set	0x20, %i2
	std	%f0,	[%l7 + %i2]
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 2
	set	0x70, %l1
	sta	%f29,	[%l7 + %l1] 0x89
	nop
	set	0x0C, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x78, %o7
	std	%f0,	[%l7 + %o7]
	and	%l6,	%i3,	%i2
	nop
	set	0x16, %i7
	ldsb	[%l7 + %i7],	%i1
	nop
	set	0x48, %o1
	std	%i6,	[%l7 + %o1]
	set	0x62, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i7
	add	%i0,	%g3,	%l3
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x88,	%o2
	set	0x44, %g6
	lda	[%l7 + %g6] 0x81,	%f21
	nop
	set	0x38, %g1
	std	%l0,	[%l7 + %g1]
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%g2
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xc2
	nop
	set	0x54, %i0
	ldstub	[%l7 + %i0],	%l2
	nop
	set	0x14, %i4
	ldsw	[%l7 + %i4],	%g4
	nop
	set	0x14, %l5
	stb	%o2,	[%l7 + %l5]
	fpadd16	%f18,	%f22,	%f10
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%l5
	or	%g6,	%i5,	%g1
	set	0x38, %o3
	stxa	%g7,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x49, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%o5
	set	0x68, %l3
	prefetcha	[%l7 + %l3] 0x89,	 3
	set	0x61, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o4
	nop
	set	0x4A, %o5
	ldsh	[%l7 + %o5],	%l4
	nop
	set	0x33, %g7
	ldstub	[%l7 + %g7],	%o0
	nop
	set	0x78, %o0
	stw	%o7,	[%l7 + %o0]
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f0
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x89,	 2
	bg,a,pn	%icc,	loop_42
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	or	%i4,	%i3,	%i2
loop_42:
	nop
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f16
	add	%i1,	%i6,	%l6
	set	0x70, %o6
	swapa	[%l7 + %o6] 0x80,	%i0
	wr	%i7,	%l3,	%y
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f16
	add	%g3,	%o3,	%g2
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%l2
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x80,	 3
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x81,	%l0
	nop
	set	0x4C, %i7
	swap	[%l7 + %i7],	%l5
	set	0x50, %o7
	lda	[%l7 + %o7] 0x89,	%f25
	nop
	set	0x60, %o1
	std	%f2,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x24]
	or	%o2,	%i5,	%g1
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%g7
	nop
	set	0x75, %g6
	ldstub	[%l7 + %g6],	%o1
	or	%g6,	%g5,	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l4
	add	%o0,	%o7,	%o4
	nop
	nop
	setx	0x4878CEDA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xFAFF2F8F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f30,	%f15
	nop
	set	0x75, %g1
	ldsb	[%l7 + %g1],	%i4
	set	0x6D, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i3
	and	%o6,	%i1,	%i2
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%i6
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%l6
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i6
	set	0x20, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i0
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x88,	%l3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd8
	nop
	set	0x50, %o3
	lduw	[%l7 + %o3],	%g3
	nop
	set	0x22, %l3
	ldstub	[%l7 + %l3],	%o3
	set	0x0C, %l0
	sta	%f21,	[%l7 + %l0] 0x81
	fpsub16s	%f31,	%f28,	%f17
	be,a,pn	%icc,	loop_43
	nop
	set	0x20, %i5
	std	%l2,	[%l7 + %i5]
	nop
	set	0x3C, %o5
	stw	%g2,	[%l7 + %o5]
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%l0
loop_43:
	wr 	%g0, 	0x4, 	%fprs
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xcc
	set	0x50, %g4
	stxa	%i5,	[%l7 + %g4] 0x88
	nop
	set	0x0A, %i6
	lduh	[%l7 + %i6],	%g1
	or	%o2,	%o1,	%g7
	nop
	set	0x3F, %l6
	ldstub	[%l7 + %l6],	%g6
	nop
	set	0x70, %o6
	stx	%l1,	[%l7 + %o6]
	nop
	set	0x72, %i2
	ldstub	[%l7 + %i2],	%g5
	set	0x70, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	fpsub16	%f22,	%f8,	%f4
	set	0x22, %o2
	stba	%o5,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x08, %l1
	stx	%fsr,	[%l7 + %l1]
	or	%o0,	%o4,	%o7
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xd2
	st	%f11,	[%l7 + 0x48]
	fpsub16	%f2,	%f28,	%f16
	set	0x50, %g5
	swapa	[%l7 + %g5] 0x88,	%i4
	st	%fsr,	[%l7 + 0x1C]
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x89,	 3
	set	0x20, %o7
	ldxa	[%l7 + %o7] 0x80,	%i1
	nop
	set	0x20, %o1
	ldsw	[%l7 + %o1],	%i2
	nop
	set	0x3E, %l4
	sth	%i3,	[%l7 + %l4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%i7
	st	%fsr,	[%l7 + 0x08]
	wr	%i0,	%l3,	%sys_tick
	nop
	set	0x60, %g1
	std	%f22,	[%l7 + %g1]
	bge,a	%icc,	loop_44
	nop
	set	0x68, %o4
	std	%i6,	[%l7 + %o4]
	nop
	set	0x78, %g6
	std	%g2,	[%l7 + %g6]
	set	0x7A, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l2
loop_44:
	and	%g2,	%l0,	%o3
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l5
	or	%g4,	%i5,	%g1
	add	%o2,	%o1,	%g6
	ld	[%l7 + 0x24],	%f25
	nop
	set	0x54, %i4
	stw	%g7,	[%l7 + %i4]
	set	0x5C, %l5
	stha	%l1,	[%l7 + %l5] 0x88
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x81,	%l4
	set	0x70, %l2
	stda	%g4,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x4B, %o3
	stba	%o5,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x2C, %l3
	swapa	[%l7 + %l3] 0x89,	%o0
	add	%o4,	%o7,	%i4
	or	%i1,	%o6,	%i3
	nop
	set	0x70, %l0
	stw	%i2,	[%l7 + %l0]
	nop
	set	0x08, %o5
	std	%f8,	[%l7 + %o5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x80,	%i7,	%i0
	nop
	set	0x3C, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x0C, %g7
	swap	[%l7 + %g7],	%i6
	ble,pt	%icc,	loop_45
	and	%l6,	%l3,	%g3
	nop
	set	0x20, %g4
	std	%f22,	[%l7 + %g4]
	set	0x25, %i6
	stba	%l2,	[%l7 + %i6] 0xe3
	membar	#Sync
loop_45:
	nop
	set	0x28, %l6
	stxa	%l0,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x30, %o0
	stha	%o3,	[%l7 + %o0] 0x89
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f0
	nop
	set	0x72, %g2
	ldsb	[%l7 + %g2],	%l5
	or	%g4,	%g2,	%g1
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x81,	 3
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xd2
	set	0x0C, %i1
	stwa	%i5,	[%l7 + %i1] 0xeb
	membar	#Sync
	and	%o1,	%g6,	%l1
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%l4
	set	0x25, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%o0
	nop
	set	0x20, %o7
	stw	%o4,	[%l7 + %o7]
	nop
	set	0x1C, %o1
	stw	%o7,	[%l7 + %o1]
	set	0x28, %l4
	stxa	%i4,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd2
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x89,	 2
	set	0x7F, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o6
	fpsub16	%f12,	%f26,	%f4
	nop
	set	0x68, %o4
	stx	%i1,	[%l7 + %o4]
	fpadd16s	%f24,	%f0,	%f20
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	set	0x08, %i3
	swapa	[%l7 + %i3] 0x80,	%i2
	nop
	set	0x2B, %i4
	ldstub	[%l7 + %i4],	%i7
	set	0x20, %i0
	sta	%f22,	[%l7 + %i0] 0x80
	or	%i0,	%i6,	%l6
	nop
	set	0x3C, %l5
	ldsw	[%l7 + %l5],	%i3
	wr	%g3,	%l3,	%set_softint
	nop
	set	0x54, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	st	%f12,	[%l7 + 0x78]
	nop
	set	0x30, %l0
	stw	%l0,	[%l7 + %l0]
	set	0x60, %o5
	stwa	%l2,	[%l7 + %o5] 0x80
	bl,pt	%xcc,	loop_46
	nop
	set	0x1A, %i5
	stb	%o3,	[%l7 + %i5]
	nop
	set	0x20, %g7
	stx	%g4,	[%l7 + %g7]
	set	0x52, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g2
loop_46:
	bn,a,pn	%xcc,	loop_47
	st	%fsr,	[%l7 + 0x58]
	set	0x52, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l5
loop_47:
	st	%f26,	[%l7 + 0x1C]
	set	0x48, %g4
	sta	%f16,	[%l7 + %g4] 0x89
	or	%o2,	%g1,	%o1
	nop
	set	0x18, %l6
	std	%f26,	[%l7 + %l6]
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%g6
	fpsub16s	%f8,	%f10,	%f22
	st	%f30,	[%l7 + 0x4C]
	nop
	set	0x20, %o2
	std	%f2,	[%l7 + %o2]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x89
	nop
	set	0x0E, %l1
	sth	%l1,	[%l7 + %l1]
	nop
	set	0x3A, %g5
	sth	%i5,	[%l7 + %g5]
	set	0x71, %i7
	stba	%g5,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x36, %o7
	ldsb	[%l7 + %o7],	%l4
	nop
	set	0x40, %o1
	std	%o0,	[%l7 + %o1]
	nop
	set	0x40, %l4
	prefetch	[%l7 + %l4],	 2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f0
	nop
	set	0x48, %o6
	swap	[%l7 + %o6],	%o5
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x89
	add	%o7,	%o4,	%g7
	nop
	set	0x70, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f20
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%o6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xea,	%i4
	set	0x68, %i0
	stda	%i0,	[%l7 + %i0] 0xea
	membar	#Sync
	fpsub32	%f14,	%f18,	%f18
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x80,	%i2
	set	0x28, %l2
	stda	%i0,	[%l7 + %l2] 0x80
	nop
	set	0x46, %l0
	ldsh	[%l7 + %l0],	%i7
	set	0x3D, %l3
	ldstuba	[%l7 + %l3] 0x88,	%i6
	set	0x30, %i5
	stda	%i6,	[%l7 + %i5] 0x81
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x18, %o3
	sta	%f30,	[%l7 + %o3] 0x80
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l3
	nop
	set	0x10, %o5
	ldsb	[%l7 + %o5],	%l0
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x81,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%o3
	nop
	set	0x54, %l6
	ldsb	[%l7 + %l6],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%g4
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%o2
	nop
	set	0x68, %o0
	stx	%g1,	[%l7 + %o0]
	ld	[%l7 + 0x44],	%f8
	set	0x34, %g2
	sta	%f10,	[%l7 + %g2] 0x80
	nop
	set	0x4C, %i2
	stw	%o1,	[%l7 + %i2]
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%l1
	st	%fsr,	[%l7 + 0x70]
	set	0x3C, %l1
	stwa	%g6,	[%l7 + %l1] 0x89
	nop
	set	0x78, %i1
	ldub	[%l7 + %i1],	%g5
	set	0x78, %i7
	sta	%f14,	[%l7 + %i7] 0x81
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x89,	%l4
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%o0
	and	%i5,	%o5,	%o4
	nop
	set	0x70, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%g7,	%o6,	%i4
	nop
	set	0x20, %l4
	ldsh	[%l7 + %l4],	%o7
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f8
	nop
	set	0x08, %o6
	ldd	[%l7 + %o6],	%f30
	nop
	set	0x17, %o4
	ldub	[%l7 + %o4],	%i2
	set	0x36, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%i7
	set	0x34, %i4
	swapa	[%l7 + %i4] 0x80,	%i6
	set	0x50, %g3
	lda	[%l7 + %g3] 0x89,	%f0
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x81,	%g3
	add	%l6,	%l0,	%l3
	add	%l2,	%i3,	%o3
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f6
	nop
	set	0x6F, %l2
	ldub	[%l7 + %l2],	%g2
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f30
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x43, %i3
	stba	%g4,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x23, %g7
	stb	%l5,	[%l7 + %g7]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x88
	set	0x30, %o5
	stwa	%g1,	[%l7 + %o5] 0x88
	set	0x20, %i5
	stda	%o0,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x28, %l6
	stwa	%o2,	[%l7 + %l6] 0x88
	nop
	set	0x38, %i6
	ldub	[%l7 + %i6],	%g6
	nop
	set	0x7A, %o0
	ldstub	[%l7 + %o0],	%l1
	nop
	set	0x60, %g4
	lduh	[%l7 + %g4],	%l4
	set	0x10, %i2
	swapa	[%l7 + %i2] 0x80,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%o5
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf9
	membar	#Sync
	add	%o4,	%g5,	%o6
	nop
	set	0x16, %l1
	sth	%g7,	[%l7 + %l1]
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x80,	%o7
	nop
	set	0x36, %i7
	ldsh	[%l7 + %i7],	%i4
	and	%i2,	%i1,	%i0
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%l6
	nop
	set	0x2E, %o1
	ldstub	[%l7 + %o1],	%i6
	nop
	set	0x6E, %o7
	ldsh	[%l7 + %o7],	%l3
	nop
	set	0x64, %l4
	ldsw	[%l7 + %l4],	%l2
	set	0x48, %g5
	ldxa	[%l7 + %g5] 0x81,	%i3
	bg,pt	%xcc,	loop_48
	add	%l0,	%g2,	%o3
	st	%f17,	[%l7 + 0x68]
	bgu,pn	%icc,	loop_49
loop_48:
	nop
	set	0x28, %g1
	stx	%l5,	[%l7 + %g1]
	set	0x35, %o6
	ldstuba	[%l7 + %o6] 0x88,	%g4
loop_49:
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%o1
	nop
	set	0x20, %i4
	prefetch	[%l7 + %i4],	 3
	set	0x70, %g3
	stda	%o2,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x2C, %i0
	stw	%g1,	[%l7 + %i0]
	nop
	set	0x68, %l5
	lduw	[%l7 + %l5],	%g6
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f6
	set	0x30, %o4
	stda	%l4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x81,	%o0
	nop
	set	0x41, %l0
	ldsb	[%l7 + %l0],	%i5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0
	fpadd16s	%f9,	%f22,	%f23
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x3C, %o5
	lduw	[%l7 + %o5],	%o4
	nop
	set	0x0C, %i5
	ldsh	[%l7 + %i5],	%g5
	st	%f6,	[%l7 + 0x44]
	nop
	set	0x44, %l6
	lduh	[%l7 + %l6],	%l1
	set	0x3C, %i3
	sta	%f8,	[%l7 + %i3] 0x89
	set	0x50, %i6
	stxa	%g7,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x38, %g4
	lduh	[%l7 + %g4],	%o7
	set	0x58, %o0
	stda	%i4,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xe3,	%o6
	set	0x30, %l1
	stda	%i2,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%i0
	nop
	set	0x10, %i1
	stx	%i0,	[%l7 + %i1]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f0
	fpsub32s	%f10,	%f23,	%f31
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%i6
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x88,	%i6
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f20
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x89,	 4
	nop
	set	0x28, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x14, %g6
	swapa	[%l7 + %g6] 0x81,	%l3
	set	0x5C, %i4
	swapa	[%l7 + %i4] 0x89,	%i3
	nop
	set	0x54, %o6
	ldsw	[%l7 + %o6],	%l0
	set	0x78, %g3
	stda	%g2,	[%l7 + %g3] 0x80
	nop
	set	0x20, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%l2
	nop
	set	0x2C, %o4
	ldsw	[%l7 + %o4],	%l5
	fpsub16s	%f31,	%f4,	%f25
	set	0x68, %l5
	lda	[%l7 + %l5] 0x80,	%f21
	nop
	set	0x3C, %l3
	sth	%o3,	[%l7 + %l3]
	nop
	set	0x72, %g7
	ldsb	[%l7 + %g7],	%g4
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x89,	%o2
	nop
	set	0x6C, %o3
	lduh	[%l7 + %o3],	%o1
	nop
	set	0x41, %i5
	ldsb	[%l7 + %i5],	%g6
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x60, %l6
	ldd	[%l7 + %l6],	%l4
	add	%o0,	%g1,	%i5
	ld	[%l7 + 0x48],	%f18
	nop
	set	0x0C, %o5
	lduh	[%l7 + %o5],	%o4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%l1
	nop
	set	0x24, %i6
	stw	%g5,	[%l7 + %i6]
	nop
	set	0x2A, %i3
	stb	%g7,	[%l7 + %i3]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%i4
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%i2
	set	0x23, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%i1
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f4
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%i7
	nop
	set	0x70, %i1
	stx	%l6,	[%l7 + %i1]
	set	0x54, %g2
	lda	[%l7 + %g2] 0x89,	%f15
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%i6
	nop
	set	0x63, %i7
	ldub	[%l7 + %i7],	%l3
	set	0x30, %i2
	stba	%l0,	[%l7 + %i2] 0xe3
	membar	#Sync
	nop
	set	0x25, %l4
	ldub	[%l7 + %l4],	%g2
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%l2
	nop
	set	0x78, %o7
	std	%i2,	[%l7 + %o7]
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%o2
	bn,pn	%icc,	loop_50
	add	%l5,	%g4,	%o1
	nop
	set	0x26, %g6
	lduh	[%l7 + %g6],	%o2
	nop
	set	0x10, %i4
	std	%f4,	[%l7 + %i4]
loop_50:
	or	%l4,	%g6,	%o0
	nop
	set	0x4C, %o1
	ldsh	[%l7 + %o1],	%i5
	nop
	set	0x21, %g3
	ldsb	[%l7 + %g3],	%o4
	set	0x32, %o6
	stha	%g1,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x48, %l2
	std	%o4,	[%l7 + %l2]
	set	0x40, %o4
	stwa	%l1,	[%l7 + %o4] 0x88
	nop
	set	0x62, %i0
	stb	%g7,	[%l7 + %i0]
	nop
	set	0x5C, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x26, %g7
	ldub	[%l7 + %g7],	%g5
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%o7
	set	0x10, %l3
	stxa	%i2,	[%l7 + %l3] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x74]
	set	0x54, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o6
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f20
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%i1
	set	0x4C, %o5
	swapa	[%l7 + %o5] 0x80,	%i7
	nop
	set	0x50, %o3
	swap	[%l7 + %o3],	%l6
	or	%i4,	%i6,	%g3
	set	0x1C, %i6
	lda	[%l7 + %i6] 0x80,	%f12
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x40, %o0
	stw	%l0,	[%l7 + %o0]
	nop
	set	0x70, %g4
	std	%l2,	[%l7 + %g4]
	nop
	set	0x08, %i3
	stx	%l2,	[%l7 + %i3]
	or	%g2,	%o3,	%i3
	add	%l5,	%o1,	%g4
	set	0x11, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o2
	nop
	set	0x40, %i1
	stx	%g6,	[%l7 + %i1]
	set	0x10, %g2
	sta	%f13,	[%l7 + %g2] 0x88
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x81,	%o0
	set	0x14, %i7
	swapa	[%l7 + %i7] 0x89,	%l4
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x88,	 3
	nop
	set	0x48, %g5
	ldsh	[%l7 + %g5],	%i5
	set	0x75, %l4
	stba	%o5,	[%l7 + %l4] 0x81
	nop
	set	0x7C, %g1
	stw	%g1,	[%l7 + %g1]
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x89,	%l1
	set	0x30, %o7
	stwa	%g5,	[%l7 + %o7] 0x81
	nop
	set	0x0C, %o1
	swap	[%l7 + %o1],	%g7
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x80,	%o7
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%o6
	ld	[%l7 + 0x5C],	%f9
	set	0x2C, %l2
	lda	[%l7 + %l2] 0x88,	%f10
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x30, %o6
	stha	%i2,	[%l7 + %o6] 0xea
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%i7
	nop
	set	0x28, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%i0
	nop
	set	0x50, %l0
	std	%f20,	[%l7 + %l0]
	and	%i4,	%l6,	%i6
	set	0x50, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l0
	st	%f14,	[%l7 + 0x54]
	set	0x28, %l3
	swapa	[%l7 + %l3] 0x80,	%l3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xda,	%f0
	set	0x4C, %i5
	stha	%g3,	[%l7 + %i5] 0x80
	set	0x10, %o3
	ldxa	[%l7 + %o3] 0x81,	%g2
	nop
	set	0x5E, %i6
	lduh	[%l7 + %i6],	%l2
	nop
	set	0x74, %o5
	ldsh	[%l7 + %o5],	%i3
	add	%l5,	%o3,	%g4
	nop
	set	0x08, %o0
	swap	[%l7 + %o0],	%o1
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x80,	%g6
	fpsub32	%f10,	%f6,	%f28
	nop
	set	0x2C, %l1
	lduw	[%l7 + %l1],	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%l4
	set	0x30, %g4
	sta	%f0,	[%l7 + %g4] 0x89
	nop
	set	0x70, %i1
	lduw	[%l7 + %i1],	%o4
	and	%i5,	%g1,	%l1
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%g5
	set	0x38, %g2
	prefetcha	[%l7 + %g2] 0x81,	 1
	st	%f27,	[%l7 + 0x70]
	set	0x36, %i2
	stba	%o7,	[%l7 + %i2] 0x89
	nop
	set	0x28, %i7
	swap	[%l7 + %i7],	%o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1248
!	Type a   	: 22
!	Type cti   	: 23
!	Type x   	: 516
!	Type f   	: 55
!	Type i   	: 136
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
	set	0x5,	%g1
	set	0x7,	%g2
	set	0xD,	%g3
	set	0x3,	%g4
	set	0xE,	%g5
	set	0x1,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x7,	%i1
	set	-0x7,	%i2
	set	-0xD,	%i3
	set	-0x6,	%i4
	set	-0x2,	%i5
	set	-0x5,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x0CD4B1C3,	%l0
	set	0x4C720DD1,	%l1
	set	0x566D1FBB,	%l2
	set	0x261B7D3E,	%l3
	set	0x613D1E7C,	%l4
	set	0x54AA5923,	%l5
	set	0x15BEF5D2,	%l6
	!# Output registers
	set	-0x1781,	%o0
	set	0x146C,	%o1
	set	0x0EF9,	%o2
	set	0x184B,	%o3
	set	-0x0640,	%o4
	set	-0x01E1,	%o5
	set	0x146C,	%o6
	set	0x0006,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	or	%i2,	%o5,	%i0
	nop
	set	0x30, %g5
	stx	%i7,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x08, %g1
	std	%f8,	[%l7 + %g1]
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%i4
	bleu,a	%icc,	loop_51
	and	%i1,	%i6,	%l0
	set	0x48, %g6
	stxa	%l3,	[%l7 + %g6] 0xe2
	membar	#Sync
loop_51:
	nop
	set	0x6C, %o7
	stha	%g3,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x80,	%l6
	nop
	set	0x40, %o1
	std	%g2,	[%l7 + %o1]
	set	0x1C, %l2
	stha	%l2,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x48, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i3
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%l5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%o3
	set	0x10, %l5
	stwa	%o2,	[%l7 + %l5] 0xea
	membar	#Sync
	and	%l4,	%o4,	%i5
	nop
	set	0x48, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcc
	set	0x14, %g7
	sta	%f19,	[%l7 + %g7] 0x88
	nop
	set	0x5B, %l3
	ldsb	[%l7 + %l3],	%o0
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x88,	%f24
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%g5
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%g1
	set	0x71, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g7
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x20, %o5
	stx	%fsr,	[%l7 + %o5]
	add	%o6,	%i2,	%o7
	set	0x28, %i5
	lda	[%l7 + %i5] 0x88,	%f22
	add	%i0,	%o5,	%i7
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%i4
	nop
	set	0x68, %o0
	sth	%i1,	[%l7 + %o0]
	nop
	set	0x50, %g4
	std	%l0,	[%l7 + %g4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%l3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%i3
	nop
	set	0x56, %i1
	sth	%g3,	[%l7 + %i1]
	nop
	set	0x3B, %l1
	stb	%l5,	[%l7 + %l1]
	set	0x55, %g2
	stba	%o1,	[%l7 + %g2] 0x88
	nop
	set	0x64, %o2
	sth	%g6,	[%l7 + %o2]
	nop
	set	0x54, %i2
	ldsw	[%l7 + %i2],	%g4
	nop
	set	0x30, %g5
	std	%o2,	[%l7 + %g5]
	nop
	set	0x78, %i7
	lduw	[%l7 + %i7],	%l4
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	fpadd16	%f20,	%f14,	%f6
	nop
	set	0x34, %g6
	ldsb	[%l7 + %g6],	%o4
	nop
	set	0x47, %l4
	ldub	[%l7 + %l4],	%i5
	nop
	set	0x18, %o7
	std	%f10,	[%l7 + %o7]
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%l1
	nop
	set	0x12, %o1
	ldub	[%l7 + %o1],	%o0
	nop
	set	0x40, %i4
	swap	[%l7 + %i4],	%g1
	nop
	set	0x58, %o6
	std	%g4,	[%l7 + %o6]
	add	%o6,	%i2,	%o7
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf8
	membar	#Sync
	or	%i0,	%o5,	%g7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x2C, %l5
	ldstub	[%l7 + %l5],	%i7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%i6
	st	%f16,	[%l7 + 0x28]
	nop
	set	0x7A, %g7
	sth	%l0,	[%l7 + %g7]
	nop
	set	0x7C, %l3
	sth	%l3,	[%l7 + %l3]
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x38, %l0
	ldd	[%l7 + %l0],	%f10
	set	0x78, %i6
	prefetcha	[%l7 + %i6] 0x80,	 1
	nop
	set	0x48, %o3
	ldsb	[%l7 + %o3],	%l2
	bne,a,pn	%xcc,	loop_52
	or	%i3,	%g2,	%g3
	nop
	set	0x50, %o5
	ldsb	[%l7 + %o5],	%l5
	nop
	set	0x7D, %i5
	ldstub	[%l7 + %i5],	%g6
loop_52:
	add	%g4,	%o1,	%l4
	set	0x70, %i3
	stda	%o4,	[%l7 + %i3] 0x81
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd8,	%f0
	add	%o3,	%o2,	%l1
	nop
	set	0x22, %i1
	ldstub	[%l7 + %i1],	%o0
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x80,	 4
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x89,	%g4
	set	0x50, %o2
	lda	[%l7 + %o2] 0x88,	%f18
	nop
	set	0x58, %i2
	stx	%o6,	[%l7 + %i2]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f0
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x89,	%g1
	nop
	set	0x44, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x75, %g1
	ldstub	[%l7 + %g1],	%o7
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f0
	set	0x54, %o7
	swapa	[%l7 + %o7] 0x88,	%i2
	add	%o5,	%i0,	%g7
	set	0x20, %g3
	stxa	%i1,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x54, %l2
	ldsh	[%l7 + %l2],	%i7
	set	0x14, %i4
	stwa	%i6,	[%l7 + %i4] 0x80
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x89
	nop
	set	0x54, %o1
	stw	%i4,	[%l7 + %o1]
	set	0x50, %o4
	stwa	%l0,	[%l7 + %o4] 0x81
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%l6
	set	0x78, %l5
	stxa	%l3,	[%l7 + %l5] 0x80
	nop
	set	0x08, %l3
	stw	%i3,	[%l7 + %l3]
	nop
	set	0x7C, %l6
	lduw	[%l7 + %l6],	%l2
	set	0x4C, %g7
	stha	%g2,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x40, %i6
	stda	%g2,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x89,	%g6
	set	0x1C, %l0
	swapa	[%l7 + %l0] 0x81,	%g4
	set	0x31, %o5
	stba	%o1,	[%l7 + %o5] 0x89
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	set	0x7F, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l5
	st	%f20,	[%l7 + 0x20]
	nop
	set	0x2F, %i1
	ldub	[%l7 + %i1],	%o4
	set	0x3C, %g4
	lda	[%l7 + %g4] 0x88,	%f3
	set	0x50, %l1
	stxa	%l4,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x50, %o2
	ldxa	[%l7 + %o2] 0x88,	%o3
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xeb,	%l0
	st	%f15,	[%l7 + 0x24]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	nop
	set	0x7A, %g5
	sth	%o2,	[%l7 + %g5]
	nop
	set	0x6F, %g2
	ldub	[%l7 + %g2],	%i5
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f16
	nop
	set	0x44, %l4
	sth	%g5,	[%l7 + %l4]
	and	%o6,	%o0,	%g1
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%i2
	nop
	set	0x58, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x39, %g1
	stba	%o5,	[%l7 + %g1] 0x89
	nop
	set	0x58, %l2
	swap	[%l7 + %l2],	%o7
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f26
	set	0x4A, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g7
	nop
	set	0x50, %i4
	std	%f2,	[%l7 + %i4]
	bl	%xcc,	loop_53
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%i0
	nop
	set	0x0C, %i0
	stw	%i7,	[%l7 + %i0]
	fpadd16s	%f12,	%f31,	%f23
loop_53:
	add	%i1,	%i4,	%l0
	nop
	set	0x7E, %l3
	sth	%l6,	[%l7 + %l3]
	fpadd32s	%f17,	%f5,	%f1
	nop
	set	0x21, %l5
	ldstub	[%l7 + %l5],	%l3
	nop
	set	0x70, %l6
	stw	%i3,	[%l7 + %l6]
	set	0x58, %g7
	stba	%l2,	[%l7 + %g7] 0x80
	nop
	set	0x16, %o3
	ldsh	[%l7 + %o3],	%i6
	nop
	set	0x10, %l0
	lduw	[%l7 + %l0],	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x88,	%g6,	%g3
	set	0x24, %i6
	sta	%f19,	[%l7 + %i6] 0x88
	nop
	set	0x42, %o5
	ldsb	[%l7 + %o5],	%o1
	nop
	set	0x5E, %i5
	ldsb	[%l7 + %i5],	%g4
	set	0x10, %i1
	swapa	[%l7 + %i1] 0x89,	%l5
	set	0x10, %o0
	ldxa	[%l7 + %o0] 0x80,	%l4
	nop
	set	0x0E, %l1
	stb	%o4,	[%l7 + %l1]
	set	0x70, %o2
	lda	[%l7 + %o2] 0x81,	%f27
	nop
	set	0x6E, %g4
	ldstub	[%l7 + %g4],	%o3
	nop
	set	0x37, %i2
	ldsb	[%l7 + %i2],	%o2
	set	0x30, %i3
	stxa	%i5,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x1F, %g2
	stb	%g5,	[%l7 + %g2]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0x81,	%o6
	nop
	set	0x60, %i7
	ldstub	[%l7 + %i7],	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%i2
	set	0x30, %g6
	stda	%g0,	[%l7 + %g6] 0x89
	nop
	set	0x73, %o7
	ldstub	[%l7 + %o7],	%o5
	set	0x44, %l4
	stwa	%o7,	[%l7 + %l4] 0x81
	set	0x38, %g3
	stxa	%i0,	[%l7 + %g3] 0x80
	nop
	set	0x20, %l2
	std	%f22,	[%l7 + %l2]
	and	%i7,	%g7,	%i4
	nop
	set	0x15, %o6
	ldsb	[%l7 + %o6],	%i1
	nop
	set	0x24, %g1
	ldsh	[%l7 + %g1],	%l6
	nop
	set	0x24, %o1
	ldsw	[%l7 + %o1],	%l0
	set	0x7D, %i4
	stba	%l3,	[%l7 + %i4] 0x80
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%g6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%o1
	fpsub32	%f24,	%f30,	%f24
	st	%f21,	[%l7 + 0x48]
	set	0x50, %o4
	swapa	[%l7 + %o4] 0x80,	%g4
	set	0x50, %i0
	stda	%g2,	[%l7 + %i0] 0x89
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f12
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f8
	st	%fsr,	[%l7 + 0x28]
	set	0x58, %g7
	stxa	%l5,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x80,	%o4
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x89,	%o3
	add	%l4,	%i5,	%g5
	nop
	set	0x14, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%o6
	set	0x5A, %i5
	stha	%o2,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x68, %i1
	ldub	[%l7 + %i1],	%l1
	nop
	set	0x3C, %o0
	sth	%o0,	[%l7 + %o0]
	set	0x3A, %l1
	stha	%i2,	[%l7 + %l1] 0x80
	nop
	set	0x10, %o5
	std	%f2,	[%l7 + %o5]
	nop
	set	0x58, %o2
	ldsw	[%l7 + %o2],	%g1
	nop
	set	0x58, %g4
	std	%f26,	[%l7 + %g4]
	bn	%xcc,	loop_54
	st	%f29,	[%l7 + 0x18]
	or	%o7,	%i0,	%i7
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%f22
loop_54:
	nop
	set	0x1C, %i3
	lda	[%l7 + %i3] 0x88,	%f10
	nop
	set	0x36, %g2
	ldsh	[%l7 + %g2],	%g7
	nop
	set	0x70, %i7
	stx	%i4,	[%l7 + %i7]
	set	0x20, %g6
	stda	%i0,	[%l7 + %g6] 0x81
	ld	[%l7 + 0x1C],	%f26
	set	0x68, %g5
	stxa	%o5,	[%l7 + %g5] 0x89
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f4
	set	0x2C, %g3
	lda	[%l7 + %g3] 0x80,	%f7
	nop
	set	0x10, %l2
	lduw	[%l7 + %l2],	%l0
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xea,	%i6
	nop
	set	0x1B, %g1
	ldub	[%l7 + %g1],	%l2
	nop
	set	0x28, %o7
	swap	[%l7 + %o7],	%i6
	and	%g2,	%g6,	%l3
	set	0x3C, %i4
	sta	%f7,	[%l7 + %i4] 0x88
	set	0x16, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i3
	or	%g4,	%g3,	%o1
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x64, %o4
	swap	[%l7 + %o4],	%l5
	set	0x66, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o4
	nop
	set	0x74, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%o2
	set	0x10, %g7
	ldda	[%l7 + %g7] 0xea,	%l4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f0
	nop
	set	0x38, %l6
	std	%g4,	[%l7 + %l6]
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x88,	%i5
	nop
	set	0x44, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	nop
	set	0x34, %i1
	swap	[%l7 + %i1],	%o2
	nop
	set	0x54, %o0
	ldsb	[%l7 + %o0],	%o0
	nop
	set	0x3A, %o5
	stb	%l1,	[%l7 + %o5]
	ld	[%l7 + 0x38],	%f8
	set	0x30, %o2
	prefetcha	[%l7 + %o2] 0x80,	 3
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xeb,	%g0
	or	%i0,	%o7,	%i7
	fpsub16	%f0,	%f10,	%f16
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%f20
	set	0x5D, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i4
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x80,	%i1
	wr 	%g0, 	0x4, 	%fprs
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f16
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%l0
	set	0x5C, %g2
	swapa	[%l7 + %g2] 0x89,	%l6
	nop
	set	0x74, %l4
	lduw	[%l7 + %l4],	%l2
	nop
	set	0x70, %g3
	ldsw	[%l7 + %g3],	%i6
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%g2
	set	0x5A, %o6
	stba	%l3,	[%l7 + %o6] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
	nop
	set	0x1C, %o7
	ldsh	[%l7 + %o7],	%i3
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x3E, %i4
	lduh	[%l7 + %i4],	%g4
	set	0x4C, %o4
	swapa	[%l7 + %o4] 0x89,	%g3
	nop
	set	0x5C, %o1
	ldsw	[%l7 + %o1],	%o1
	nop
	set	0x64, %l5
	swap	[%l7 + %l5],	%l5
	nop
	set	0x58, %l3
	stw	%o4,	[%l7 + %l3]
	nop
	set	0x58, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x12, %o3
	sth	%o3,	[%l7 + %o3]
	or	%l4,	%g5,	%o6
	nop
	set	0x40, %i0
	std	%f24,	[%l7 + %i0]
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xeb,	%i4
	set	0x28, %i6
	stda	%o2,	[%l7 + %i6] 0xe3
	membar	#Sync
	add	%o0,	%l1,	%g1
	nop
	set	0x58, %l0
	ldsw	[%l7 + %l0],	%i2
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f16
	ld	[%l7 + 0x78],	%f12
	nop
	set	0x70, %o0
	prefetch	[%l7 + %o0],	 1
	set	0x58, %i1
	stha	%o7,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f12
	nop
	set	0x08, %o2
	lduh	[%l7 + %o2],	%i7
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%i0
	set	0x74, %i2
	swapa	[%l7 + %i2] 0x80,	%i4
	nop
	set	0x58, %g4
	ldsw	[%l7 + %g4],	%i1
	nop
	set	0x34, %i3
	swap	[%l7 + %i3],	%g7
	set	0x40, %g6
	sta	%f10,	[%l7 + %g6] 0x89
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x48, %g2
	ldub	[%l7 + %g2],	%o5
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%l2
	nop
	set	0x1E, %g3
	lduh	[%l7 + %g3],	%l6
	nop
	set	0x5C, %g5
	lduw	[%l7 + %g5],	%g2
	nop
	set	0x44, %l2
	stw	%l3,	[%l7 + %l2]
	set	0x6C, %o7
	swapa	[%l7 + %o7] 0x80,	%i3
	nop
	set	0x78, %o6
	stb	%g6,	[%l7 + %o6]
	nop
	set	0x18, %g1
	stw	%i6,	[%l7 + %g1]
	nop
	set	0x5B, %i4
	ldstub	[%l7 + %i4],	%g3
	nop
	set	0x08, %o4
	ldx	[%l7 + %o4],	%o1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xc8
	ld	[%l7 + 0x1C],	%f15
	st	%f6,	[%l7 + 0x18]
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x44, %g7
	sta	%f18,	[%l7 + %g7] 0x89
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x42, %i0
	ldsh	[%l7 + %i0],	%o3
	fpsub16s	%f8,	%f30,	%f4
	st	%f21,	[%l7 + 0x2C]
	set	0x20, %l6
	stxa	%l4,	[%l7 + %l6] 0x88
	nop
	set	0x5F, %i6
	ldub	[%l7 + %i6],	%o6
	set	0x6A, %l0
	stha	%g5,	[%l7 + %l0] 0x88
	nop
	set	0x14, %i5
	stb	%o2,	[%l7 + %i5]
	and	%o0,	%i5,	%l1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc4
	and	%o7,	%i0,	%i7
	or	%i1,	%g7,	%i4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f0
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f24
	and	%l0,	%o5,	%l2
	nop
	set	0x44, %o5
	stw	%l6,	[%l7 + %o5]
	set	0x58, %o2
	stda	%l2,	[%l7 + %o2] 0x89
	nop
	set	0x44, %l1
	stw	%g2,	[%l7 + %l1]
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f30
	nop
	set	0x68, %i2
	stx	%i3,	[%l7 + %i2]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	ld	[%l7 + 0x30],	%f14
	nop
	set	0x10, %i3
	stx	%i6,	[%l7 + %i3]
	set	0x5C, %g2
	swapa	[%l7 + %g2] 0x80,	%g3
	nop
	set	0x58, %l4
	prefetch	[%l7 + %l4],	 2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%l5
	nop
	set	0x78, %g3
	std	%o0,	[%l7 + %g3]
	nop
	set	0x64, %i7
	sth	%g4,	[%l7 + %i7]
	nop
	set	0x16, %l2
	stb	%o3,	[%l7 + %l2]
	and	%o4,	%o6,	%g5
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x81,	%l4
	nop
	set	0x5F, %o7
	stb	%o2,	[%l7 + %o7]
	bl,a	%icc,	loop_55
	nop
	set	0x12, %o6
	ldsh	[%l7 + %o6],	%o0
	set	0x60, %i4
	stda	%l0,	[%l7 + %i4] 0x80
loop_55:
	nop
	set	0x18, %g1
	stda	%i4,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x4E, %l5
	stb	%i2,	[%l7 + %l5]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%g1
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%i7
	or	%i0,	%i1,	%g7
	set	0x58, %o4
	sta	%f30,	[%l7 + %o4] 0x88
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd8
	nop
	set	0x24, %g7
	swap	[%l7 + %g7],	%l0
	set	0x2C, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i4
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf9
	membar	#Sync
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x60, %i5
	stxa	%o5,	[%l7 + %i5] 0xe3
	membar	#Sync
	ld	[%l7 + 0x70],	%f5
	nop
	set	0x2A, %i0
	sth	%l6,	[%l7 + %i0]
	nop
	nop
	setx	0xA76EEA9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB84C7436,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f15,	%f9
	ld	[%l7 + 0x64],	%f29
	nop
	set	0x2C, %i1
	stw	%l2,	[%l7 + %i1]
	and	%l3,	%g2,	%i3
	ld	[%l7 + 0x54],	%f7
	st	%fsr,	[%l7 + 0x6C]
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xea,	%g2
	nop
	set	0x69, %o5
	stb	%g6,	[%l7 + %o5]
	and	%i6,	%o1,	%l5
	nop
	set	0x38, %o2
	stx	%o3,	[%l7 + %o2]
	nop
	set	0x69, %o0
	stb	%o4,	[%l7 + %o0]
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x88,	 0
	nop
	set	0x50, %l1
	lduw	[%l7 + %l1],	%o6
	nop
	set	0x7C, %i2
	ldsh	[%l7 + %i2],	%l4
	ld	[%l7 + 0x2C],	%f5
	nop
	set	0x10, %g6
	std	%o2,	[%l7 + %g6]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f0
	set	0x28, %l4
	stxa	%g5,	[%l7 + %l4] 0x80
	nop
	set	0x30, %g3
	std	%o0,	[%l7 + %g3]
	add	%i5,	%i2,	%l1
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x26, %i7
	ldsb	[%l7 + %i7],	%g1
	nop
	set	0x38, %g5
	std	%f22,	[%l7 + %g5]
	nop
	set	0x50, %o7
	std	%i6,	[%l7 + %o7]
	nop
	set	0x17, %l2
	stb	%i0,	[%l7 + %l2]
	wr	%o7,	%g7,	%set_softint
	nop
	set	0x30, %o6
	std	%i0,	[%l7 + %o6]
	nop
	set	0x22, %i4
	stb	%i4,	[%l7 + %i4]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%o5
	set	0x48, %g1
	stda	%l2,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x4C, %o1
	stha	%l6,	[%l7 + %o1] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%i3
	or	%g3,	%g6,	%g2
	set	0x5A, %l5
	stba	%i6,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x10, %l3
	lduh	[%l7 + %l3],	%l5
	set	0x74, %g7
	stha	%o3,	[%l7 + %g7] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x88,	%f16
	nop
	set	0x20, %i6
	std	%o0,	[%l7 + %i6]
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%o4
	set	0x30, %i5
	stda	%g4,	[%l7 + %i5] 0x80
	wr	%o6,	%o2,	%sys_tick
	nop
	set	0x64, %l0
	lduh	[%l7 + %l0],	%l4
	set	0x58, %i0
	stwa	%o0,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x40, %o3
	std	%f2,	[%l7 + %o3]
	nop
	set	0x34, %i1
	ldsw	[%l7 + %i1],	%g5
	ld	[%l7 + 0x14],	%f5
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%i2
	nop
	set	0x68, %o0
	lduw	[%l7 + %o0],	%i5
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f10
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%g1
	or	%l1,	%i7,	%i0
	nop
	set	0x60, %i2
	ldsb	[%l7 + %i2],	%g7
	fpadd32	%f24,	%f30,	%f18
	nop
	set	0x14, %g4
	ldsw	[%l7 + %g4],	%o7
	nop
	set	0x16, %g6
	ldstub	[%l7 + %g6],	%i4
	nop
	set	0x14, %l4
	ldsh	[%l7 + %l4],	%l0
	set	0x18, %g3
	ldxa	[%l7 + %g3] 0x88,	%i1
	or	%l2,	%o5,	%l3
	set	0x20, %i3
	stda	%i2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x60, %i7
	ldsh	[%l7 + %i7],	%l6
	add	%g3,	%g6,	%g2
	set	0x40, %g5
	sta	%f18,	[%l7 + %g5] 0x81
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xe3,	%l4
	set	0x20, %l2
	stxa	%o3,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x38, %o7
	stx	%fsr,	[%l7 + %o7]
	bgu,a,pt	%xcc,	loop_56
	fpsub16s	%f22,	%f24,	%f17
	set	0x70, %i4
	stwa	%o1,	[%l7 + %i4] 0xe2
	membar	#Sync
loop_56:
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%o4
	nop
	set	0x5F, %o6
	ldstub	[%l7 + %o6],	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%i6
	ld	[%l7 + 0x54],	%f10
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f8
	nop
	set	0x12, %o1
	ldsb	[%l7 + %o1],	%l4
	nop
	set	0x66, %l3
	lduh	[%l7 + %l3],	%o2
	nop
	set	0x48, %g7
	std	%o0,	[%l7 + %g7]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%i2
	nop
	set	0x08, %i6
	std	%g4,	[%l7 + %i6]
	nop
	set	0x48, %l6
	std	%f16,	[%l7 + %l6]
	nop
	set	0x68, %l0
	stx	%fsr,	[%l7 + %l0]
	and	%g1,	%i5,	%l1
	add	%i0,	%g7,	%o7
	nop
	set	0x58, %i5
	ldstub	[%l7 + %i5],	%i4
	ld	[%l7 + 0x18],	%f9
	nop
	set	0x78, %o3
	swap	[%l7 + %o3],	%l0
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%i6
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%l2
	ba,a,pn	%xcc,	loop_57
	and	%o5,	%l3,	%i1
	set	0x50, %o0
	ldda	[%l7 + %o0] 0x89,	%i6
loop_57:
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f4
	nop
	set	0x55, %i0
	ldub	[%l7 + %i0],	%g3
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%i3
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%g6
	set	0x70, %g4
	lda	[%l7 + %g4] 0x80,	%f28
	nop
	set	0x08, %l4
	std	%l4,	[%l7 + %l4]
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%o2
	or	%o1,	%o4,	%g2
	nop
	set	0x10, %g6
	swap	[%l7 + %g6],	%o6
	set	0x54, %i7
	stha	%i6,	[%l7 + %i7] 0x89
	set	0x20, %i3
	stxa	%l4,	[%l7 + %i3] 0xe2
	membar	#Sync
	st	%f24,	[%l7 + 0x40]
	set	0x28, %g5
	stwa	%g4,	[%l7 + %g5] 0xea
	membar	#Sync
	fpsub16s	%f29,	%f12,	%f23
	nop
	set	0x30, %g2
	lduw	[%l7 + %g2],	%o2
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x80,	 2
	nop
	set	0x48, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x48, %i4
	lduw	[%l7 + %i4],	%i2
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x88,	 3
	nop
	set	0x7C, %g1
	swap	[%l7 + %g1],	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%i0,	%o7,	%clear_softint
	nop
	set	0x4C, %l5
	lduw	[%l7 + %l5],	%g7
	nop
	set	0x31, %l3
	ldsb	[%l7 + %l3],	%l0
	st	%f12,	[%l7 + 0x4C]
	set	0x74, %g7
	swapa	[%l7 + %g7] 0x80,	%i4
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x80
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x89,	%i7
	nop
	set	0x61, %l0
	ldsb	[%l7 + %l0],	%o5
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f16
	nop
	set	0x30, %l6
	ldsh	[%l7 + %l6],	%l2
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x89,	%i1
	st	%fsr,	[%l7 + 0x1C]
	and	%l6,	%g3,	%l3
	ld	[%l7 + 0x40],	%f18
	nop
	set	0x77, %o5
	ldsb	[%l7 + %o5],	%g6
	nop
	set	0x4C, %i1
	sth	%l5,	[%l7 + %i1]
	nop
	set	0x30, %o2
	ldub	[%l7 + %o2],	%o3
	nop
	set	0x4F, %o0
	ldub	[%l7 + %o0],	%i3
	set	0x34, %i0
	swapa	[%l7 + %i0] 0x81,	%o4
	set	0x30, %i2
	stxa	%g2,	[%l7 + %i2] 0x80
	set	0x3C, %g4
	sta	%f11,	[%l7 + %g4] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%o1
	set	0x3C, %l4
	stwa	%i6,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x45, %l1
	stba	%g4,	[%l7 + %l1] 0x89
	set	0x48, %g3
	stba	%l4,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x68, %i7
	stxa	%o2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x5C, %g6
	lduh	[%l7 + %g6],	%o0
	or	%g1,	%i2,	%i5
	nop
	set	0x10, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xca
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x80,	%g5
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%i0
	set	0x5B, %i4
	stba	%l1,	[%l7 + %i4] 0x81
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB67, 	%tick_cmpr
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%l0
	and	%i4,	%i7,	%o5
	and	%l2,	%i1,	%g3
	set	0x70, %o6
	stda	%i6,	[%l7 + %o6] 0x88
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%l5
	set	0x5A, %l5
	stha	%g6,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x24, %l3
	swapa	[%l7 + %l3] 0x81,	%o3
	and	%o4,	%i3,	%o6
	nop
	set	0x0C, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	nop
	setx	0x00C079C676F8C405,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0409DE441327FA05,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f0,	%f8
	set	0x20, %o4
	lda	[%l7 + %o4] 0x80,	%f25
	nop
	set	0x38, %g1
	ldsw	[%l7 + %g1],	%g2
	add	%o1,	%g4,	%i6
	set	0x36, %i6
	stha	%o2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%l4
	nop
	set	0x68, %i5
	ldsw	[%l7 + %i5],	%g1
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x50, %l0
	stx	%i2,	[%l7 + %l0]
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x20, %o5
	stw	%i0,	[%l7 + %o5]
	nop
	set	0x30, %o3
	std	%i4,	[%l7 + %o3]
	or	%o7,	%l1,	%l0
	fpsub32	%f30,	%f18,	%f22
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%g7
	set	0x44, %o2
	stwa	%i4,	[%l7 + %o2] 0x81
	nop
	set	0x48, %i0
	stx	%fsr,	[%l7 + %i0]
	set	0x40, %o0
	stha	%i7,	[%l7 + %o0] 0x81
	set	0x78, %i2
	stwa	%l2,	[%l7 + %i2] 0x81
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x80,	%o5
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%g2
	set	0x72, %l4
	stha	%l6,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	or	%i1,	%l5,	%o3
	nop
	set	0x5C, %g6
	ldsw	[%l7 + %g6],	%g6
	set	0x50, %i3
	lda	[%l7 + %i3] 0x81,	%f8
	nop
	set	0x70, %g5
	ldsw	[%l7 + %g5],	%o4
	nop
	set	0x62, %g2
	ldsh	[%l7 + %g2],	%i3
	set	0x28, %l2
	lda	[%l7 + %l2] 0x80,	%f31
	ld	[%l7 + 0x08],	%f1
	set	0x58, %i4
	stda	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x58]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	nop
	set	0x14, %i7
	ldsw	[%l7 + %i7],	%o6
	st	%fsr,	[%l7 + 0x10]
	set	0x21, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g4
	set	0x70, %l3
	sta	%f27,	[%l7 + %l3] 0x81
	nop
	set	0x54, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%o1
	set	0x10, %g1
	stda	%i6,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x0C, %o4
	ldsh	[%l7 + %o4],	%o2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f0
	set	0x24, %i6
	lda	[%l7 + %i6] 0x89,	%f12
	set	0x50, %i5
	ldxa	[%l7 + %i5] 0x81,	%l4
	ld	[%l7 + 0x38],	%f23
	nop
	set	0x14, %l0
	lduh	[%l7 + %l0],	%i2
	set	0x58, %o5
	stda	%o0,	[%l7 + %o5] 0x88
	set	0x7C, %o3
	sta	%f23,	[%l7 + %o3] 0x88
	set	0x42, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x88,	%i0,	%g1
	nop
	set	0x3C, %l6
	lduh	[%l7 + %l6],	%i5
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%o6
	set	0x10, %i0
	stxa	%l1,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x08, %i2
	swapa	[%l7 + %i2] 0x80,	%l0
	set	0x20, %g4
	stda	%i4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x70, %l1
	stx	%i7,	[%l7 + %l1]
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%g7
	nop
	set	0x7C, %g3
	lduh	[%l7 + %g3],	%l2
	st	%f0,	[%l7 + 0x34]
	set	0x58, %l4
	lda	[%l7 + %l4] 0x89,	%f29
	bg	%xcc,	loop_58
	nop
	set	0x72, %g6
	ldsb	[%l7 + %g6],	%o5
	bge,a,pt	%xcc,	loop_59
	wr	%g3,	%l3,	%ccr
loop_58:
	nop
	set	0x34, %i3
	stw	%i1,	[%l7 + %i3]
	set	0x18, %g2
	stwa	%l6,	[%l7 + %g2] 0x81
loop_59:
	nop
	set	0x28, %l2
	lduw	[%l7 + %l2],	%l5
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x89,	%o2
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f14
	nop
	set	0x58, %o7
	swap	[%l7 + %o7],	%g6
	nop
	nop
	setx	0x719AAEB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x0F78DBA4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f0,	%f27
	nop
	set	0x4E, %i7
	ldsh	[%l7 + %i7],	%i3
	ble,a	%icc,	loop_60
	nop
	set	0x10, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x54, %l5
	stwa	%o4,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_60:
	nop
	set	0x0F, %g7
	ldstub	[%l7 + %g7],	%g2
	set	0x5C, %g1
	swapa	[%l7 + %g1] 0x88,	%g4
	nop
	set	0x44, %o4
	swap	[%l7 + %o4],	%o6
	nop
	set	0x30, %o6
	std	%o0,	[%l7 + %o6]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x89
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 1
	and	%i6,	%l4,	%o2
	nop
	set	0x59, %i5
	ldub	[%l7 + %i5],	%i2
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%g5
	nop
	set	0x30, %o3
	swap	[%l7 + %o3],	%i0
	nop
	set	0x48, %i1
	ldsw	[%l7 + %i1],	%g1
	wr	%o0,	%i5,	%pic
	nop
	set	0x34, %o5
	swap	[%l7 + %o5],	%l1
	ble,pt	%icc,	loop_61
	nop
	set	0x50, %o2
	stx	%l0,	[%l7 + %o2]
	nop
	set	0x24, %i0
	lduh	[%l7 + %i0],	%o7
	set	0x0F, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i7
loop_61:
	nop
	set	0x14, %l6
	stw	%g7,	[%l7 + %l6]
	set	0x3E, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l2
	bleu,a,pt	%icc,	loop_62
	nop
	set	0x47, %g4
	ldstub	[%l7 + %g4],	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%l3
loop_62:
	nop
	set	0x62, %o0
	sth	%i1,	[%l7 + %o0]
	set	0x70, %l4
	stba	%l6,	[%l7 + %l4] 0x89
	wr	%l5,	%o3,	%set_softint
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%g6
	nop
	set	0x54, %i3
	swap	[%l7 + %i3],	%g3
	set	0x69, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i3
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%g4
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xca
	nop
	set	0x30, %i4
	swap	[%l7 + %i4],	%o6
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x89,	%i6
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%o1
	nop
	set	0x66, %l3
	lduh	[%l7 + %l3],	%o2
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x89
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f16
	nop
	set	0x38, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x7C, %o6
	swapa	[%l7 + %o6] 0x81,	%l4
	and	%g5,	%i2,	%i0
	nop
	set	0x78, %i6
	stx	%g1,	[%l7 + %i6]
	fpadd16	%f12,	%f24,	%f16
	set	0x58, %o4
	stwa	%o0,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x21, %i5
	stba	%l1,	[%l7 + %i5] 0x81
	or	%l0,	%o7,	%i7
	nop
	set	0x54, %l0
	stw	%i5,	[%l7 + %l0]
	fpsub16s	%f4,	%f0,	%f13
	set	0x50, %o1
	swapa	[%l7 + %o1] 0x88,	%l2
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x3A, %o5
	sth	%o5,	[%l7 + %o5]
	nop
	set	0x40, %o2
	stx	%g7,	[%l7 + %o2]
	set	0x48, %i0
	stwa	%l3,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%i1
	set	0x34, %o3
	lda	[%l7 + %o3] 0x80,	%f8
	nop
	set	0x6C, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x32, %l1
	sth	%l6,	[%l7 + %l1]
	wr	%l5,	%o3,	%clear_softint
	set	0x68, %o0
	stxa	%i4,	[%l7 + %o0] 0x80
	set	0x34, %g4
	stha	%g6,	[%l7 + %g4] 0x81
	or	%g3,	%i3,	%o4
	or	%g4,	%g2,	%o6
	nop
	set	0x4A, %l4
	lduh	[%l7 + %l4],	%i6
	nop
	set	0x20, %g3
	stx	%o2,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x5C, %g2
	lduh	[%l7 + %g2],	%o1
	fpadd16s	%f11,	%f17,	%f20
	set	0x64, %g6
	stba	%g5,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x70, %g5
	stw	%i2,	[%l7 + %g5]
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%l4
	or	%i0,	%o0,	%g1
	nop
	set	0x22, %l2
	ldsb	[%l7 + %l2],	%l1
	set	0x40, %i7
	stha	%o7,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x39, %i4
	ldub	[%l7 + %i4],	%i7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%i4
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%l0
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f0
	nop
	set	0x68, %g1
	stx	%l2,	[%l7 + %g1]
	nop
	set	0x60, %l5
	std	%o4,	[%l7 + %l5]
	nop
	set	0x20, %i6
	ldx	[%l7 + %i6],	%g7
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%i1
	fpsub32s	%f11,	%f19,	%f8
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%l6
	set	0x7C, %i5
	stha	%l5,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x20, %l0
	prefetcha	[%l7 + %l0] 0x89,	 1
	nop
	set	0x78, %o6
	lduh	[%l7 + %o6],	%o3
	set	0x60, %i1
	ldxa	[%l7 + %i1] 0x80,	%g6
	nop
	set	0x08, %o5
	std	%i2,	[%l7 + %o5]
	set	0x30, %o1
	stda	%g2,	[%l7 + %o1] 0x81
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%g2
	set	0x5C, %i0
	stwa	%o6,	[%l7 + %i0] 0x89
	nop
	set	0x58, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x1A, %o2
	ldstub	[%l7 + %o2],	%i6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%g4
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%g4
	set	0x2C, %o3
	sta	%f5,	[%l7 + %o3] 0x89
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%i2
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x88,	%o0
	set	0x60, %g4
	sta	%f26,	[%l7 + %g4] 0x88
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xea,	%l4
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x89,	%i0
	set	0x10, %g6
	stxa	%o0,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x65, %g3
	stb	%g1,	[%l7 + %g3]
	nop
	set	0x30, %i3
	swap	[%l7 + %i3],	%l1
	set	0x30, %g5
	stda	%o6,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x20, %i7
	stx	%i5,	[%l7 + %i7]
	nop
	set	0x0C, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x88,	 4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xDCC, 	%tick_cmpr
	ld	[%l7 + 0x5C],	%f15
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xeb,	%g6
	set	0x14, %o7
	swapa	[%l7 + %o7] 0x80,	%o5
	wr	%i1,	%l6,	%set_softint
	nop
	set	0x20, %g7
	std	%f16,	[%l7 + %g7]
	or	%l3,	%i4,	%o3
	set	0x4B, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l5
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf9,	%f16
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%i2
	or	%g6,	%g3,	%o4
	nop
	set	0x30, %o4
	prefetch	[%l7 + %o4],	 3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%g2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xcc
	nop
	set	0x39, %o6
	stb	%i6,	[%l7 + %o6]
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%g4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xe3,	%o2
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x80,	%i2
	nop
	set	0x0C, %i0
	ldsb	[%l7 + %i0],	%g5
	nop
	set	0x08, %i2
	prefetch	[%l7 + %i2],	 3
	set	0x7C, %l6
	sta	%f27,	[%l7 + %l6] 0x81
	nop
	set	0x44, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x78, %o2
	std	%f16,	[%l7 + %o2]
	add	%o1,	%l4,	%o0
	set	0x3F, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i0
	set	0x76, %o0
	stba	%g1,	[%l7 + %o0] 0xe2
	membar	#Sync
	and	%o7,	%i5,	%l1
	set	0x38, %g4
	stxa	%l2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x2A, %l4
	ldsb	[%l7 + %l4],	%i7
	nop
	set	0x75, %g6
	ldub	[%l7 + %g6],	%g7
	set	0x5C, %g2
	stwa	%o5,	[%l7 + %g2] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%l6
	ld	[%l7 + 0x54],	%f3
	set	0x18, %g3
	sta	%f17,	[%l7 + %g3] 0x88
	nop
	set	0x5C, %g5
	sth	%i1,	[%l7 + %g5]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f0
	ld	[%l7 + 0x50],	%f8
	or	%l3,	%o3,	%i4
	nop
	set	0x38, %l2
	std	%l4,	[%l7 + %l2]
	set	0x70, %i4
	stwa	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%i3
	set	0x48, %l3
	stda	%o6,	[%l7 + %l3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x34],	%f7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x16B, 	%tick_cmpr
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x88,	%g4
	nop
	set	0x10, %g7
	ldd	[%l7 + %g7],	%g2
	nop
	set	0x58, %o7
	ldsb	[%l7 + %o7],	%o2
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xea,	%i2
	nop
	set	0x1E, %i6
	ldsb	[%l7 + %i6],	%g5
	nop
	set	0x38, %g1
	lduh	[%l7 + %g1],	%l4
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%o0
	ld	[%l7 + 0x64],	%f11
	add	%i0,	%g1,	%o7
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x88,	%f27
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%i5
	nop
	set	0x4A, %o6
	lduh	[%l7 + %o6],	%l1
	and	%l2,	%i7,	%g7
	set	0x6B, %l0
	stba	%o1,	[%l7 + %l0] 0xeb
	membar	#Sync
	and	%l0,	%l6,	%i1
	ld	[%l7 + 0x08],	%f24
	set	0x78, %o1
	sta	%f28,	[%l7 + %o1] 0x81
	nop
	set	0x34, %o5
	prefetch	[%l7 + %o5],	 4
	nop
	set	0x69, %i2
	ldsb	[%l7 + %i2],	%l3
	set	0x6E, %l6
	stha	%o3,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x70, %i0
	ldxa	[%l7 + %i0] 0x80,	%i4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc0
	st	%f24,	[%l7 + 0x4C]
	nop
	set	0x20, %o2
	ldsh	[%l7 + %o2],	%l5
	nop
	set	0x0C, %l1
	ldsw	[%l7 + %l1],	%g6
	st	%fsr,	[%l7 + 0x34]
	add	%g3,	%o5,	%i3
	nop
	set	0x32, %g4
	lduh	[%l7 + %g4],	%o4
	set	0x38, %o0
	ldstuba	[%l7 + %o0] 0x89,	%o6
	nop
	set	0x08, %l4
	stw	%g4,	[%l7 + %l4]
	nop
	set	0x0F, %g6
	ldsb	[%l7 + %g6],	%g2
	set	0x56, %g2
	stba	%i6,	[%l7 + %g2] 0xe2
	membar	#Sync
	fpsub32	%f20,	%f20,	%f4
	nop
	set	0x40, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x6A, %g5
	lduh	[%l7 + %g5],	%o2
	set	0x7C, %l2
	stha	%g5,	[%l7 + %l2] 0x81
	nop
	set	0x76, %i3
	stb	%i2,	[%l7 + %i3]
	fpsub32s	%f8,	%f10,	%f6
	nop
	set	0x4C, %i4
	swap	[%l7 + %i4],	%o0
	nop
	set	0x44, %i7
	lduw	[%l7 + %i7],	%i0
	nop
	set	0x60, %l3
	stw	%l4,	[%l7 + %l3]
	nop
	set	0x65, %g7
	ldub	[%l7 + %g7],	%g1
	nop
	set	0x36, %l5
	ldub	[%l7 + %l5],	%i5
	nop
	set	0x48, %i6
	swap	[%l7 + %i6],	%l1
	and	%l2,	%o7,	%g7
	and	%o1,	%i7,	%l6
	st	%f9,	[%l7 + 0x28]
	nop
	set	0x18, %g1
	ldsh	[%l7 + %g1],	%l0
	and	%l3,	%o3,	%i1
	set	0x18, %i5
	lda	[%l7 + %i5] 0x89,	%f24
	nop
	set	0x44, %o4
	swap	[%l7 + %o4],	%i4
	nop
	set	0x54, %o7
	ldsh	[%l7 + %o7],	%g6
	set	0x50, %i1
	stxa	%l5,	[%l7 + %i1] 0x81
	set	0x0C, %l0
	sta	%f4,	[%l7 + %l0] 0x81
	nop
	set	0x70, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x44, %o5
	lduh	[%l7 + %o5],	%g3
	nop
	set	0x78, %i2
	sth	%o4,	[%l7 + %i2]
	ld	[%l7 + 0x34],	%f16
	set	0x50, %o6
	ldstuba	[%l7 + %o6] 0x88,	%o6
	nop
	set	0x0C, %i0
	ldsw	[%l7 + %i0],	%i3
	add	%g4,	%g2,	%i6
	set	0x20, %l6
	stda	%g4,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f6
	set	0x20, %l1
	stda	%i2,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x6E, %g4
	ldub	[%l7 + %g4],	%o2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x88,	%o0,	%i0
	nop
	set	0x08, %o3
	lduw	[%l7 + %o3],	%l4
	nop
	set	0x67, %o0
	ldub	[%l7 + %o0],	%i5
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x1C, %g6
	ldsw	[%l7 + %g6],	%l1
	or	%l2,	%o7,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%i7
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xcc
	nop
	set	0x44, %l4
	ldsw	[%l7 + %l4],	%l6
	nop
	set	0x77, %g5
	ldstub	[%l7 + %g5],	%l0
	nop
	set	0x64, %g3
	ldub	[%l7 + %g3],	%o1
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%l2
	nop
	set	0x78, %i4
	ldstub	[%l7 + %i4],	%i1
	st	%f15,	[%l7 + 0x58]
	nop
	set	0x1C, %i3
	swap	[%l7 + %i3],	%i4
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf9
	membar	#Sync
	set	0x48, %i7
	stha	%o3,	[%l7 + %i7] 0xe2
	membar	#Sync
	set	0x58, %g7
	lda	[%l7 + %g7] 0x89,	%f31
	nop
	set	0x26, %i6
	sth	%l5,	[%l7 + %i6]
	add	%o5,	%g6,	%o4
	set	0x1F, %g1
	ldstuba	[%l7 + %g1] 0x81,	%g3
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%i3
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%g4
	nop
	set	0x70, %o7
	ldsh	[%l7 + %o7],	%g2
	nop
	set	0x4A, %i5
	lduh	[%l7 + %i5],	%o6
	nop
	set	0x74, %i1
	stw	%g5,	[%l7 + %i1]
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xc0
	ld	[%l7 + 0x5C],	%f4
	st	%fsr,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x78, %o1
	stx	%i2,	[%l7 + %o1]
	set	0x75, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i6
	nop
	set	0x60, %i0
	std	%o0,	[%l7 + %i0]
	set	0x70, %l6
	stxa	%o2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x26, %o2
	sth	%i0,	[%l7 + %o2]
	nop
	set	0x42, %o6
	ldub	[%l7 + %o6],	%l4
	set	0x29, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i5
	nop
	set	0x30, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x63, %o0
	ldub	[%l7 + %o0],	%l2
	st	%f27,	[%l7 + 0x2C]
	add	%o7,	%g7,	%i7
	nop
	set	0x26, %o3
	lduh	[%l7 + %o3],	%l6
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%g1,	%l0,	%l3
	set	0x10, %g6
	stxa	%o1,	[%l7 + %g6] 0x89
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x50, %l4
	lduw	[%l7 + %l4],	%i4
	wr	%i1,	%o3,	%sys_tick
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f0
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f14
	wr 	%g0, 	0x7, 	%fprs
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc4
	set	0x78, %i4
	ldxa	[%l7 + %i4] 0x81,	%o4
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x88
	nop
	nop
	setx	0xA132EB30E72CE91D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFEC4B07C8A051D70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f2,	%f14
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xcc
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x88,	%g3
	add	%i3,	%o5,	%g2
	nop
	set	0x58, %i6
	lduh	[%l7 + %i6],	%g4
	set	0x20, %g1
	swapa	[%l7 + %g1] 0x81,	%o6
	st	%fsr,	[%l7 + 0x64]
	set	0x56, %l5
	stha	%g5,	[%l7 + %l5] 0x88
	nop
	set	0x24, %l3
	lduw	[%l7 + %l3],	%i6
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x70, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x56, %i1
	sth	%o2,	[%l7 + %i1]
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x89,	%o0
	nop
	set	0x50, %o7
	ldsh	[%l7 + %o7],	%i0
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x79, %o5
	stb	%i5,	[%l7 + %o5]
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x81,	%l1
	set	0x70, %i2
	ldda	[%l7 + %i2] 0xe3,	%l2
	nop
	set	0x3D, %l6
	ldstub	[%l7 + %l6],	%o7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%i7
	ld	[%l7 + 0x40],	%f1
	nop
	set	0x18, %i0
	std	%f8,	[%l7 + %i0]
	add	%l4,	%g1,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%l3
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f22
	and	%i4,	%o1,	%o3
	set	0x2A, %o6
	stha	%l5,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%f12
	nop
	set	0x20, %o0
	std	%g6,	[%l7 + %o0]
	set	0x20, %g4
	lda	[%l7 + %g4] 0x88,	%f3
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f16
	ld	[%l7 + 0x28],	%f11
	nop
	set	0x6D, %o3
	ldsb	[%l7 + %o3],	%o4
	set	0x08, %l4
	sta	%f18,	[%l7 + %l4] 0x80
	nop
	set	0x3E, %g3
	sth	%i1,	[%l7 + %g3]
	nop
	set	0x4C, %g6
	ldsw	[%l7 + %g6],	%i3
	nop
	set	0x14, %l2
	sth	%g3,	[%l7 + %l2]
	bgu,pn	%icc,	loop_63
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f24
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
loop_63:
	nop
	set	0x5C, %i3
	ldsw	[%l7 + %i3],	%g2
	set	0x10, %g7
	sta	%f10,	[%l7 + %g7] 0x89
	or	%o5,	%g4,	%g5
	ld	[%l7 + 0x28],	%f27
	nop
	set	0x70, %i6
	ldx	[%l7 + %i6],	%i6
	nop
	set	0x30, %i7
	swap	[%l7 + %i7],	%i2
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f0
	set	0x0B, %g1
	ldstuba	[%l7 + %g1] 0x80,	%o6
	nop
	set	0x46, %o4
	sth	%o2,	[%l7 + %o4]
	nop
	set	0x28, %i5
	ldstub	[%l7 + %i5],	%o0
	set	0x4C, %l3
	swapa	[%l7 + %l3] 0x89,	%i0
	set	0x50, %l0
	stxa	%i5,	[%l7 + %l0] 0xe3
	membar	#Sync
	ld	[%l7 + 0x20],	%f10
	nop
	set	0x08, %i1
	prefetch	[%l7 + %i1],	 1
	fpadd16s	%f28,	%f16,	%f4
	nop
	set	0x79, %o5
	ldub	[%l7 + %o5],	%l1
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%o7
	nop
	set	0x14, %i2
	ldub	[%l7 + %i2],	%l2
	nop
	set	0x70, %o7
	stx	%g7,	[%l7 + %o7]
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xe2,	%i6
	set	0x6C, %i0
	stha	%g1,	[%l7 + %i0] 0x81
	set	0x08, %o6
	stwa	%l6,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x19, %l1
	ldstuba	[%l7 + %l1] 0x88,	%l4
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x60, %o2
	lduh	[%l7 + %o2],	%l3
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f12
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xcc
	set	0x78, %o0
	swapa	[%l7 + %o0] 0x80,	%i4
	nop
	set	0x60, %l4
	ldsh	[%l7 + %l4],	%o1
	set	0x62, %g3
	ldstuba	[%l7 + %g3] 0x89,	%l0
	nop
	nop
	setx	0xBEBFE04A75689164,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1D4CD1BBFB755C59,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f20,	%f18
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x18, %l2
	std	%l4,	[%l7 + %l2]
	set	0x38, %g6
	stxa	%o3,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x36, %g5
	ldub	[%l7 + %g5],	%o4
	set	0x1D, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f16
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%i2
	nop
	set	0x50, %g7
	stx	%g3,	[%l7 + %g7]
	set	0x1F, %l5
	stba	%g2,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x2E, %g1
	stba	%i1,	[%l7 + %g1] 0x80
	set	0x68, %o4
	stha	%o5,	[%l7 + %o4] 0x89
	fpadd32s	%f9,	%f26,	%f11
	set	0x6F, %i5
	stba	%g4,	[%l7 + %i5] 0x80
	nop
	set	0x40, %l3
	swap	[%l7 + %l3],	%i6
	nop
	set	0x4F, %i7
	ldub	[%l7 + %i7],	%g5
	nop
	set	0x52, %i1
	lduh	[%l7 + %i1],	%i2
	nop
	set	0x6C, %o5
	prefetch	[%l7 + %o5],	 4
	and	%o2,	%o6,	%o0
	set	0x67, %l0
	stba	%i5,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x70, %i2
	ldsw	[%l7 + %i2],	%i0
	nop
	set	0x71, %o7
	ldsb	[%l7 + %o7],	%l1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%l2
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f12
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%l6
	nop
	set	0x1E, %o6
	ldsh	[%l7 + %o6],	%l4
	nop
	set	0x14, %i0
	stw	%l3,	[%l7 + %i0]
	or	%g7,	%o1,	%i4
	nop
	set	0x0A, %l1
	lduh	[%l7 + %l1],	%l0
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xcc
	wr	%o3,	%l5,	%clear_softint
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x81,	%g6
	set	0x48, %o0
	stwa	%i3,	[%l7 + %o0] 0x89
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xeb,	%g2
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x88,	 3
	nop
	set	0x68, %g3
	stx	%i1,	[%l7 + %g3]
	nop
	set	0x1C, %l2
	lduh	[%l7 + %l2],	%o5
	nop
	set	0x40, %g6
	std	%o4,	[%l7 + %g6]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%g4
	nop
	set	0x68, %o3
	ldx	[%l7 + %o3],	%i2
	nop
	set	0x40, %g5
	ldsw	[%l7 + %g5],	%o2
	nop
	set	0x37, %i3
	ldstub	[%l7 + %i3],	%o6
	or	%g5,	%i5,	%i0
	nop
	set	0x46, %i6
	sth	%o0,	[%l7 + %i6]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%o7
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%l2
	nop
	set	0x40, %g7
	stw	%g1,	[%l7 + %g7]
	nop
	set	0x10, %g1
	sth	%l6,	[%l7 + %g1]
	nop
	set	0x6C, %o4
	stw	%l4,	[%l7 + %o4]
	nop
	set	0x74, %l5
	ldstub	[%l7 + %l5],	%l3
	set	0x70, %i5
	stxa	%g7,	[%l7 + %i5] 0x81
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%o1
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i4
	set	0x48, %i1
	sta	%f12,	[%l7 + %i1] 0x88
	set	0x30, %i7
	stxa	%l0,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x10, %o5
	stx	%l5,	[%l7 + %o5]
	nop
	set	0x7C, %l0
	stw	%g6,	[%l7 + %l0]
	set	0x54, %o7
	stwa	%o3,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x32, %i2
	lduh	[%l7 + %i2],	%g3
	set	0x70, %l6
	sta	%f9,	[%l7 + %l6] 0x89
	bg,a,pn	%xcc,	loop_64
	add	%i3,	%g2,	%o5
	nop
	set	0x24, %o6
	ldsh	[%l7 + %o6],	%i1
	set	0x28, %o1
	stda	%o4,	[%l7 + %o1] 0xea
	membar	#Sync
loop_64:
	nop
	set	0x70, %l1
	std	%g4,	[%l7 + %l1]
	set	0x0D, %g4
	stba	%i6,	[%l7 + %g4] 0xeb
	membar	#Sync
	ld	[%l7 + 0x24],	%f25
	nop
	set	0x18, %i0
	std	%f4,	[%l7 + %i0]
	nop
	set	0x18, %o0
	ldsw	[%l7 + %o0],	%i2
	set	0x69, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f16
	nop
	set	0x43, %l4
	stb	%o6,	[%l7 + %l4]
	ld	[%l7 + 0x2C],	%f8
	set	0x70, %l2
	swapa	[%l7 + %l2] 0x81,	%i5
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd8
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf1
	membar	#Sync
	set	0x70, %o3
	stxa	%g5,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x10, %i3
	stx	%i0,	[%l7 + %i3]
	nop
	set	0x58, %i6
	lduw	[%l7 + %i6],	%o0
	set	0x21, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l1
	set	0x4C, %g5
	stwa	%o7,	[%l7 + %g5] 0x81
	nop
	set	0x68, %g7
	lduw	[%l7 + %g7],	%g1
	nop
	set	0x1B, %g1
	stb	%l2,	[%l7 + %g1]
	set	0x18, %l5
	stha	%l6,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x38, %i5
	swap	[%l7 + %i5],	%l3
	bgu,pt	%xcc,	loop_65
	nop
	set	0x40, %l3
	stw	%l4,	[%l7 + %l3]
	set	0x70, %o4
	swapa	[%l7 + %o4] 0x81,	%g7
loop_65:
	nop
	set	0x0C, %i7
	ldsw	[%l7 + %i7],	%i7
	nop
	set	0x7C, %o5
	stw	%o1,	[%l7 + %o5]
	nop
	set	0x58, %i1
	ldsw	[%l7 + %i1],	%l0
	ba,pn	%xcc,	loop_66
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f30
	nop
	set	0x6B, %i2
	ldstub	[%l7 + %i2],	%i4
	and	%l5,	%o3,	%g3
loop_66:
	nop
	set	0x4C, %l6
	sta	%f9,	[%l7 + %l6] 0x88
	nop
	set	0x2C, %o7
	prefetch	[%l7 + %o7],	 1
	nop
	set	0x1C, %o6
	prefetch	[%l7 + %o6],	 1
	ld	[%l7 + 0x60],	%f6
	ld	[%l7 + 0x78],	%f7
	set	0x08, %o1
	stda	%g6,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x48, %l1
	swapa	[%l7 + %l1] 0x81,	%g2
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	nop
	set	0x48, %o0
	std	%o4,	[%l7 + %o0]
	nop
	set	0x10, %g4
	ldsw	[%l7 + %g4],	%i1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%g4
	set	0x7C, %g2
	stwa	%i2,	[%l7 + %g2] 0xe3
	membar	#Sync
	or	%i6,	%o6,	%o2
	nop
	set	0x5D, %l4
	stb	%g5,	[%l7 + %l4]
	nop
	set	0x10, %l2
	ldx	[%l7 + %l2],	%i5
	fpadd32	%f12,	%f8,	%f8
	nop
	set	0x3C, %o2
	sth	%o0,	[%l7 + %o2]
	nop
	set	0x74, %g3
	ldstub	[%l7 + %g3],	%l1
	or	%o7,	%g1,	%l2
	nop
	set	0x56, %o3
	lduh	[%l7 + %o3],	%i0
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x88,	%l3
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd0
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x89,	 0
	nop
	set	0x30, %g6
	ldsb	[%l7 + %g6],	%l4
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x88,	 4
	set	0x48, %g5
	stxa	%o1,	[%l7 + %g5] 0x81
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x80,	%l0
	nop
	set	0x58, %i5
	stx	%g7,	[%l7 + %i5]
	set	0x21, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i4
	set	0x30, %l3
	sta	%f29,	[%l7 + %l3] 0x88
	and	%l5,	%g3,	%g6
	and	%g2,	%o3,	%o5
	nop
	set	0x2D, %i7
	ldsb	[%l7 + %i7],	%i3
	nop
	set	0x1E, %o4
	ldsh	[%l7 + %o4],	%i1
	ld	[%l7 + 0x30],	%f18
	nop
	nop
	setx	0x23C0DDEA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x2746EAD7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f6,	%f31
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x89,	%o4
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%g4
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x80,	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%o2
	add	%i2,	%g5,	%i5
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o7
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x80,	%l1
	nop
	set	0x4C, %o6
	prefetch	[%l7 + %o6],	 3
	wr	%l2,	%i0,	%y
	nop
	set	0x60, %o1
	stx	%g1,	[%l7 + %o1]
	nop
	set	0x24, %i2
	prefetch	[%l7 + %i2],	 4
	set	0x70, %i0
	stxa	%l3,	[%l7 + %i0] 0x80
	set	0x40, %l1
	sta	%f14,	[%l7 + %l1] 0x88
	nop
	set	0x20, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f8
	nop
	set	0x08, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x08, %l4
	stda	%i6,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x10, %l2
	stxa	%i7,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x74, %g3
	sta	%f9,	[%l7 + %g3] 0x88
	set	0x58, %o3
	sta	%f18,	[%l7 + %o3] 0x89
	bg,a	%xcc,	loop_67
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x38, %i6
	stx	%o1,	[%l7 + %i6]
	set	0x42, %i4
	stba	%g7,	[%l7 + %i4] 0xea
	membar	#Sync
loop_67:
	nop
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xe3,	%l0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xcc
	set	0x74, %i3
	lda	[%l7 + %i3] 0x81,	%f22
	nop
	set	0x40, %g5
	lduw	[%l7 + %g5],	%l5
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x08, %i5
	stx	%i4,	[%l7 + %i5]
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x88,	%g2
	set	0x58, %l5
	ldxa	[%l7 + %l5] 0x80,	%g2
	set	0x44, %l3
	lda	[%l7 + %l3] 0x89,	%f3
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o3
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%o4
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x89,	%i3
	or	%g6,	%o4,	%g4
	nop
	set	0x60, %o5
	lduh	[%l7 + %o5],	%i1
	set	0x54, %l0
	stwa	%o6,	[%l7 + %l0] 0x80
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xA17, 	%tick_cmpr
	nop
	set	0x70, %o7
	ldub	[%l7 + %o7],	%g5
	nop
	set	0x40, %l6
	std	%f4,	[%l7 + %l6]
	ba,pt	%icc,	loop_68
	ld	[%l7 + 0x5C],	%f28
	nop
	set	0x38, %o6
	ldstub	[%l7 + %o6],	%i5
	set	0x44, %i2
	swapa	[%l7 + %i2] 0x81,	%i6
loop_68:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%o0
	nop
	set	0x70, %i0
	stx	%l1,	[%l7 + %i0]
	add	%i0,	%l2,	%l3
	fpsub32	%f8,	%f24,	%f14
	set	0x28, %l1
	stda	%g0,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l4
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x20, %o0
	stx	%i7,	[%l7 + %o0]
	nop
	set	0x20, %g2
	stx	%g7,	[%l7 + %g2]
	nop
	set	0x30, %l4
	ldx	[%l7 + %l4],	%o1
	st	%f1,	[%l7 + 0x38]
	nop
	set	0x18, %g4
	stx	%l0,	[%l7 + %g4]
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%l5
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%g2
	nop
	set	0x31, %o3
	ldstub	[%l7 + %o3],	%i4
	or	%o3,	%o5,	%i3
	nop
	set	0x18, %i6
	std	%f22,	[%l7 + %i6]
	and	%g2,	%g6,	%o4
	nop
	set	0x48, %i4
	std	%f20,	[%l7 + %i4]
	wr	%g4,	%o6,	%softint
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%i2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f0
	nop
	set	0x5F, %i3
	ldsb	[%l7 + %i3],	%g5
	or	%i5,	%i6,	%o7
	nop
	nop
	setx	0xCC7FFB8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x5936F413,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f25,	%f30
	set	0x1D, %g5
	stba	%o0,	[%l7 + %g5] 0x88
	and	%i0,	%l1,	%l2
	set	0x28, %i5
	stwa	%l3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%f26
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%g1
	nop
	set	0x31, %l3
	ldub	[%l7 + %l3],	%l4
	set	0x14, %g1
	lda	[%l7 + %g1] 0x88,	%f13
	and	%i7,	%l6,	%o1
	nop
	set	0x48, %i7
	std	%l0,	[%l7 + %i7]
	set	0x0B, %i1
	stba	%g7,	[%l7 + %i1] 0xe2
	membar	#Sync
	bg,pn	%xcc,	loop_69
	st	%f24,	[%l7 + 0x5C]
	nop
	set	0x10, %o5
	sth	%g3,	[%l7 + %o5]
	set	0x37, %l0
	stba	%l5,	[%l7 + %l0] 0xeb
	membar	#Sync
loop_69:
	wr	%o3,	%o5,	%y
	nop
	set	0x48, %o4
	std	%i2,	[%l7 + %o4]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%i4
	set	0x47, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o4
	nop
	set	0x68, %l6
	stx	%fsr,	[%l7 + %l6]
	ld	[%l7 + 0x50],	%f5
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd2
	set	0x6C, %i0
	stha	%g6,	[%l7 + %i0] 0x88
	nop
	set	0x6D, %l1
	ldsb	[%l7 + %l1],	%o6
	and	%g4,	%o2,	%i1
	nop
	nop
	setx	0xD0AC7F73,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x40C43CEA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f17,	%f5
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0
	nop
	set	0x16, %o0
	lduh	[%l7 + %o0],	%i5
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f24
	nop
	set	0x6C, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%i6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf0
	membar	#Sync
	set	0x18, %g2
	stda	%i2,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x77, %l2
	ldstub	[%l7 + %l2],	%o7
	nop
	set	0x50, %o3
	sth	%o0,	[%l7 + %o3]
	set	0x20, %i4
	stda	%l0,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x80,	%l2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xca
	nop
	set	0x30, %g6
	lduw	[%l7 + %g6],	%l3
	nop
	set	0x0E, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x08, %g5
	stx	%i0,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x38, %i5
	std	%f24,	[%l7 + %i5]
	set	0x14, %l5
	lda	[%l7 + %l5] 0x80,	%f23
	nop
	set	0x1C, %g7
	swap	[%l7 + %g7],	%l4
	nop
	set	0x44, %l3
	lduw	[%l7 + %l3],	%i7
	nop
	set	0x40, %i7
	std	%o0,	[%l7 + %i7]
	or	%l0,	%l6,	%g3
	nop
	set	0x08, %i1
	lduh	[%l7 + %i1],	%g7
	set	0x2F, %o5
	stba	%o3,	[%l7 + %o5] 0x88
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x81,	%o5
	nop
	set	0x28, %o4
	std	%i2,	[%l7 + %o4]
	nop
	set	0x68, %o7
	prefetch	[%l7 + %o7],	 2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%g2
	nop
	set	0x46, %l0
	ldsh	[%l7 + %l0],	%o4
	set	0x74, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g6
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x89,	%o6
	set	0x58, %o6
	stwa	%g4,	[%l7 + %o6] 0x80
	set	0x20, %o1
	stwa	%o2,	[%l7 + %o1] 0x89
	nop
	set	0x0A, %l1
	ldsb	[%l7 + %l1],	%i4
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x81,	 1
	set	0x24, %o0
	swapa	[%l7 + %o0] 0x88,	%g5
	set	0x20, %l4
	swapa	[%l7 + %l4] 0x88,	%i5
	nop
	set	0x42, %g3
	sth	%i2,	[%l7 + %g3]
	set	0x08, %g4
	sta	%f21,	[%l7 + %g4] 0x89
	set	0x54, %l2
	sta	%f18,	[%l7 + %l2] 0x88
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%i6
	set	0x20, %i4
	stba	%o7,	[%l7 + %i4] 0x81
	nop
	set	0x28, %o2
	std	%o0,	[%l7 + %o2]
	nop
	set	0x78, %i6
	swap	[%l7 + %i6],	%l2
	set	0x68, %g6
	stha	%l1,	[%l7 + %g6] 0x80
	nop
	set	0x29, %o3
	ldsb	[%l7 + %o3],	%g1
	nop
	set	0x58, %i3
	std	%l2,	[%l7 + %i3]
	set	0x40, %i5
	sta	%f23,	[%l7 + %i5] 0x88
	nop
	set	0x7A, %g5
	ldsb	[%l7 + %g5],	%l4
	set	0x4E, %l5
	stha	%i7,	[%l7 + %l5] 0x80
	fpsub32s	%f20,	%f22,	%f10
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xca
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x14, %i1
	swapa	[%l7 + %i1] 0x89,	%l0
	set	0x12, %l3
	ldstuba	[%l7 + %l3] 0x89,	%l6
	st	%fsr,	[%l7 + 0x20]
	and	%g3,	%g7,	%i0
	or	%o5,	%i3,	%o3
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xe3,	%g2
	fpadd32	%f16,	%f20,	%f30
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%l5
	set	0x5C, %o7
	stwa	%o6,	[%l7 + %o7] 0x88
	nop
	set	0x6C, %l0
	stw	%o2,	[%l7 + %l0]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf0
	membar	#Sync
	set	0x0C, %l6
	stha	%g4,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x81,	%i4
	nop
	set	0x2B, %o1
	ldsb	[%l7 + %o1],	%g5
	nop
	set	0x54, %l1
	swap	[%l7 + %l1],	%i5
	nop
	set	0x0C, %i2
	ldstub	[%l7 + %i2],	%i1
	nop
	set	0x43, %o0
	ldsb	[%l7 + %o0],	%i2
	set	0x48, %i0
	ldxa	[%l7 + %i0] 0x88,	%i6
	add	%o0,	%l2,	%l1
	add	%g1,	%o7,	%l4
	nop
	set	0x38, %l4
	stb	%l3,	[%l7 + %l4]
	nop
	set	0x20, %g4
	std	%f4,	[%l7 + %g4]
	nop
	set	0x7C, %l2
	ldsw	[%l7 + %l2],	%o1
	or	%i7,	%l6,	%l0
	set	0x6C, %g3
	stba	%g7,	[%l7 + %g3] 0x80
	nop
	set	0x70, %i4
	lduw	[%l7 + %i4],	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%i3
	nop
	set	0x5B, %g2
	ldstub	[%l7 + %g2],	%o3
	nop
	set	0x3E, %i6
	ldsh	[%l7 + %i6],	%i0
	set	0x38, %g6
	sta	%f13,	[%l7 + %g6] 0x88
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f0
	ld	[%l7 + 0x0C],	%f23
	nop
	set	0x24, %i3
	swap	[%l7 + %i3],	%o4
	nop
	set	0x08, %i5
	std	%f8,	[%l7 + %i5]
	st	%f9,	[%l7 + 0x4C]
	set	0x38, %g5
	stba	%g6,	[%l7 + %g5] 0x89
	bleu	%icc,	loop_70
	nop
	set	0x60, %l5
	stx	%g2,	[%l7 + %l5]
	nop
	set	0x46, %o2
	sth	%o6,	[%l7 + %o2]
	set	0x47, %i7
	stba	%o2,	[%l7 + %i7] 0xeb
	membar	#Sync
loop_70:
	ld	[%l7 + 0x70],	%f5
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x78, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l5
	fpadd32s	%f22,	%f4,	%f24
	st	%f18,	[%l7 + 0x24]
	add	%i4,	%g4,	%i5
	nop
	set	0x58, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x4C, %i1
	stw	%i1,	[%l7 + %i1]
	set	0x10, %o4
	ldda	[%l7 + %o4] 0xeb,	%g4
	nop
	set	0x12, %o7
	sth	%i6,	[%l7 + %o7]
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x81,	 3
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x80,	 3
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xe2,	%o0
	nop
	set	0x32, %g1
	sth	%l1,	[%l7 + %g1]
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%f18
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f30
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%l4
	nop
	set	0x58, %i0
	ldsw	[%l7 + %i0],	%l3
	set	0x36, %l4
	stba	%o1,	[%l7 + %l4] 0x80
	add	%g1,	%i7,	%l6
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x5B, %g4
	stb	%g7,	[%l7 + %g4]
	nop
	set	0x1C, %l2
	ldstub	[%l7 + %l2],	%g3
	or	%o5,	%l0,	%o3
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	ld	[%l7 + 0x1C],	%f1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i0
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f28
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	set	0x4D, %g2
	stba	%g6,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x43, %g6
	ldub	[%l7 + %g6],	%g2
	set	0x68, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	set	0x2C, %i5
	sta	%f30,	[%l7 + %i5] 0x80
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%o2
	nop
	set	0x28, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x50, %o2
	ldx	[%l7 + %o2],	%o6
	set	0x60, %l5
	stxa	%l5,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x28, %i7
	stda	%i4,	[%l7 + %i7] 0x80
	nop
	set	0x30, %l3
	std	%g4,	[%l7 + %l3]
	set	0x5C, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g5,	%i6
	nop
	set	0x1A, %i1
	ldstub	[%l7 + %i1],	%i2
	nop
	set	0x28, %g7
	stw	%i1,	[%l7 + %g7]
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%l1
	nop
	set	0x64, %l0
	ldub	[%l7 + %l0],	%o7
	set	0x40, %o4
	stxa	%l3,	[%l7 + %o4] 0xe3
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%g1
	nop
	set	0x32, %o6
	ldub	[%l7 + %o6],	%o1
	nop
	set	0x68, %l6
	stx	%i7,	[%l7 + %l6]
	nop
	set	0x58, %o1
	std	%f26,	[%l7 + %o1]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	add	%l6,	%g3,	%g7
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x89,	 4
	set	0x0B, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x09, %i0
	ldsb	[%l7 + %i0],	%g6
	nop
	set	0x1C, %i2
	stw	%g2,	[%l7 + %i2]
	nop
	set	0x18, %l4
	swap	[%l7 + %l4],	%o4
	wr	%i0,	%o6,	%ccr
	ld	[%l7 + 0x2C],	%f5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%f0
	set	0x50, %g4
	ldda	[%l7 + %g4] 0xe3,	%o2
	set	0x2E, %g3
	stha	%i4,	[%l7 + %g3] 0x81
	set	0x20, %i4
	sta	%f14,	[%l7 + %i4] 0x88
	add	%g4,	%i5,	%g5
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x3C, %i6
	lduw	[%l7 + %i6],	%i6
	nop
	set	0x28, %g2
	stb	%i2,	[%l7 + %g2]
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%l4
	nop
	set	0x20, %i5
	ldub	[%l7 + %i5],	%i1
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f2
	add	%l2,	%o0,	%l1
	or	%o7,	%l4,	%l3
	nop
	set	0x48, %g5
	ldsb	[%l7 + %g5],	%o1
	set	0x34, %i3
	stwa	%i7,	[%l7 + %i3] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	set	0x68, %o2
	stxa	%g1,	[%l7 + %o2] 0x89
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%l6
	fpadd16s	%f15,	%f10,	%f29
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x0F, %i7
	ldub	[%l7 + %i7],	%o5
	nop
	set	0x50, %l5
	ldx	[%l7 + %l5],	%g7
	nop
	set	0x68, %o5
	swap	[%l7 + %o5],	%l0
	nop
	set	0x78, %i1
	stw	%i3,	[%l7 + %i1]
	set	0x60, %g7
	stda	%o2,	[%l7 + %g7] 0xea
	membar	#Sync
	set	0x08, %o7
	ldxa	[%l7 + %o7] 0x89,	%g2
	ld	[%l7 + 0x60],	%f10
	nop
	nop
	setx	0x0ABFC496,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF70DFF82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f31,	%f4
	nop
	set	0x4C, %l3
	stw	%o4,	[%l7 + %l3]
	nop
	set	0x7E, %o4
	sth	%g6,	[%l7 + %o4]
	nop
	set	0x6C, %o6
	prefetch	[%l7 + %o6],	 2
	set	0x1A, %l6
	stha	%o6,	[%l7 + %l6] 0x89
	set	0x28, %l0
	stda	%o2,	[%l7 + %l0] 0x81
	nop
	set	0x24, %o1
	lduh	[%l7 + %o1],	%i0
	nop
	set	0x08, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x78, %o0
	stda	%g4,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x28, %g1
	stda	%i4,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f10
	set	0x2D, %l4
	stba	%i4,	[%l7 + %l4] 0x81
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%i6
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x80,	%l5
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x80,	 1
	nop
	set	0x30, %g3
	stx	%o0,	[%l7 + %g3]
	nop
	set	0x20, %i4
	stx	%l2,	[%l7 + %i4]
	set	0x58, %i6
	stwa	%o7,	[%l7 + %i6] 0x81
	and	%l1,	%l4,	%o1
	set	0x4A, %g2
	stba	%l3,	[%l7 + %g2] 0x89
	bne,a,pn	%icc,	loop_71
	and	%i7,	%g1,	%g3
	nop
	set	0x1C, %i5
	prefetch	[%l7 + %i5],	 0
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
loop_71:
	nop
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf8
	membar	#Sync
	set	0x64, %g5
	swapa	[%l7 + %g5] 0x81,	%o5
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xe3,	%i6
	nop
	nop
	setx	0x5E065516,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x1C5C8DDC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f14,	%f15
	ld	[%l7 + 0x64],	%f25
	and	%g7,	%i3,	%o3
	nop
	set	0x0C, %o2
	swap	[%l7 + %o2],	%g2
	ld	[%l7 + 0x54],	%f16
	nop
	set	0x68, %i7
	swap	[%l7 + %i7],	%o4
	add	%l0,	%g6,	%o6
	nop
	set	0x50, %o5
	stw	%o2,	[%l7 + %o5]
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0
	nop
	set	0x20, %i1
	stx	%i4,	[%l7 + %i1]
	and	%g5,	%i5,	%i6
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x81,	%i2
	nop
	set	0x68, %l3
	ldsh	[%l7 + %l3],	%i1
	nop
	set	0x37, %o4
	ldsb	[%l7 + %o4],	%l5
	nop
	set	0x18, %o6
	lduh	[%l7 + %o6],	%l2
	nop
	set	0x10, %l6
	lduh	[%l7 + %l6],	%o7
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x24, %l0
	prefetch	[%l7 + %l0],	 0
	set	0x08, %l1
	stwa	%l1,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x16, %o0
	stha	%o0,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x32, %g1
	ldsh	[%l7 + %g1],	%o1
	set	0x7C, %o1
	swapa	[%l7 + %o1] 0x88,	%l3
	set	0x56, %i2
	stha	%i7,	[%l7 + %i2] 0xeb
	membar	#Sync
	and	%g1,	%g3,	%l4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%g7
	bgu	%icc,	loop_72
	fpsub16s	%f15,	%f4,	%f13
	nop
	set	0x28, %l2
	ldsh	[%l7 + %l2],	%i3
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%o3
loop_72:
	nop
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x81,	%l6
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%o4
	set	0x78, %i0
	stwa	%g2,	[%l7 + %i0] 0x88
	nop
	set	0x1E, %i6
	sth	%l0,	[%l7 + %i6]
	nop
	set	0x30, %i4
	swap	[%l7 + %i4],	%g6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf0
	membar	#Sync
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%f10
	nop
	set	0x74, %g6
	ldsw	[%l7 + %g6],	%o2
	nop
	set	0x2A, %g5
	stb	%g4,	[%l7 + %g5]
	or	%o6,	%i0,	%g5
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xd8
	st	%f23,	[%l7 + 0x5C]
	nop
	set	0x3C, %o2
	lduw	[%l7 + %o2],	%i5
	wr	%i4,	%i6,	%ccr
	nop
	set	0x3C, %i3
	lduw	[%l7 + %i3],	%i1
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xd8
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	set	0x68, %o5
	stda	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x80,	%l2
	nop
	set	0x38, %o7
	prefetch	[%l7 + %o7],	 3
	set	0x60, %g7
	stwa	%l1,	[%l7 + %g7] 0x80
	nop
	set	0x48, %o4
	stx	%o0,	[%l7 + %o4]
	set	0x28, %l3
	stda	%o6,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x24, %o6
	swapa	[%l7 + %o6] 0x80,	%l3
	set	0x58, %l6
	ldxa	[%l7 + %l6] 0x81,	%o1
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x78, %l1
	stda	%g0,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x08, %g1
	ldxa	[%l7 + %g1] 0x81,	%g3
	set	0x50, %o1
	stwa	%i7,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x80,	 2
	nop
	set	0x66, %o0
	sth	%g7,	[%l7 + %o0]
	nop
	set	0x2C, %l2
	sth	%i3,	[%l7 + %l2]
	nop
	set	0x1C, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x30, %l4
	ldxa	[%l7 + %l4] 0x81,	%o5
	or	%l6,	%o3,	%g2
	nop
	set	0x28, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x20, %i0
	stw	%o4,	[%l7 + %i0]
	set	0x2E, %i6
	stha	%g6,	[%l7 + %i6] 0xea
	membar	#Sync
	fpadd32s	%f16,	%f7,	%f2
	set	0x48, %i4
	ldxa	[%l7 + %i4] 0x81,	%o2
	set	0x60, %i5
	sta	%f2,	[%l7 + %i5] 0x89
	nop
	set	0x3C, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x28, %g5
	stda	%l0,	[%l7 + %g5] 0x88
	nop
	set	0x40, %g6
	stw	%o6,	[%l7 + %g6]
	ld	[%l7 + 0x6C],	%f2
	set	0x0C, %o2
	sta	%f4,	[%l7 + %o2] 0x80
	nop
	set	0x68, %o3
	stx	%i0,	[%l7 + %o3]
	nop
	set	0x50, %i7
	std	%f20,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x10]
	add	%g4,	%i5,	%g5
	nop
	set	0x79, %l5
	ldub	[%l7 + %l5],	%i4
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%i1
	or	%l5,	%i2,	%i6
	set	0x54, %i1
	swapa	[%l7 + %i1] 0x88,	%l1
	nop
	set	0x20, %o7
	stx	%l2,	[%l7 + %o7]
	nop
	set	0x0C, %g7
	lduw	[%l7 + %g7],	%o7
	set	0x60, %o4
	sta	%f24,	[%l7 + %o4] 0x80
	nop
	set	0x75, %o5
	ldsb	[%l7 + %o5],	%o0
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%l2
	nop
	set	0x5F, %l6
	stb	%g1,	[%l7 + %l6]
	nop
	set	0x40, %l0
	stw	%g3,	[%l7 + %l0]
	nop
	set	0x10, %l1
	ldsh	[%l7 + %l1],	%i7
	nop
	set	0x10, %g1
	std	%l4,	[%l7 + %g1]
	fpsub32s	%f26,	%f20,	%f10
	set	0x43, %l3
	stba	%g7,	[%l7 + %l3] 0x81
	set	0x08, %o1
	stha	%i3,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe3,	%o4
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x88,	 4
	nop
	set	0x7C, %l2
	prefetch	[%l7 + %l2],	 1
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x11, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o1
	set	0x74, %i0
	swapa	[%l7 + %i0] 0x80,	%g2
	and	%o4,	%o3,	%o2
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f28
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%l0
	nop
	set	0x60, %g4
	stx	%o6,	[%l7 + %g4]
	fpsub16s	%f28,	%f19,	%f30
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x28, %i5
	stx	%g6,	[%l7 + %i5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%i4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xAE4, 	%tick_cmpr
	st	%f0,	[%l7 + 0x28]
	nop
	set	0x60, %g6
	lduw	[%l7 + %g6],	%i2
	nop
	set	0x30, %o2
	stx	%l5,	[%l7 + %o2]
	add	%i6,	%l1,	%o7
	nop
	nop
	setx	0xDA5CA7780EA53B26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF5BB81FDDE02F71D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f18,	%f6
	nop
	set	0x35, %o3
	stb	%o0,	[%l7 + %o3]
	add	%l2,	%g1,	%g3
	nop
	set	0x60, %g5
	std	%l2,	[%l7 + %g5]
	set	0x08, %i7
	stwa	%i7,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x08, %l5
	std	%l4,	[%l7 + %l5]
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x28, %i3
	prefetch	[%l7 + %i3],	 3
	st	%fsr,	[%l7 + 0x08]
	set	, %o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1266
!	Type a   	: 29
!	Type x   	: 527
!	Type cti   	: 22
!	Type f   	: 39
!	Type i   	: 117
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
	set	0xF,	%g1
	set	0x0,	%g2
	set	0x8,	%g3
	set	0xB,	%g4
	set	0xD,	%g5
	set	0xD,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x3,	%i1
	set	-0x4,	%i2
	set	-0xE,	%i3
	set	-0x7,	%i4
	set	-0xE,	%i5
	set	-0x8,	%i6
	set	-0x7,	%i7
	!# Local registers
	set	0x0F24D121,	%l0
	set	0x0FDA614D,	%l1
	set	0x4FC92233,	%l2
	set	0x287D5772,	%l3
	set	0x6DCB36EF,	%l4
	set	0x0A1E9FBF,	%l5
	set	0x2929134C,	%l6
	!# Output registers
	set	-0x18A3,	%o0
	set	-0x12DA,	%o1
	set	0x17DA,	%o2
	set	0x012A,	%o3
	set	-0x1549,	%o4
	set	0x0915,	%o5
	set	0x18A5,	%o6
	set	-0x12F1,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	nop
	set	0x1C, %g7
	ldstub	[%l7 + %g7],	%o5
	set	0x5C, %o4
	stwa	%l6,	[%l7 + %o4] 0x80
	set	0x3C, %i1
	stba	%g2,	[%l7 + %i1] 0x80
	set	0x38, %o5
	stxa	%o4,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%o3
	nop
	set	0x68, %l0
	ldsh	[%l7 + %l0],	%o1
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf0
	membar	#Sync
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%o2
	nop
	set	0x28, %l3
	sth	%o6,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x0C]
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc0
	set	0x58, %g1
	ldxa	[%l7 + %g1] 0x89,	%g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%l0
	nop
	set	0x74, %i2
	swap	[%l7 + %i2],	%i0
	or	%i5,	%i4,	%i1
	nop
	set	0x22, %l2
	ldub	[%l7 + %l2],	%g5
	set	0x40, %o0
	lda	[%l7 + %o0] 0x88,	%f5
	nop
	set	0x28, %l4
	std	%l4,	[%l7 + %l4]
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f16
	wr	%i6,	%o7,	%pic
	nop
	set	0x08, %i4
	lduw	[%l7 + %i4],	%o0
	nop
	set	0x38, %i6
	sth	%l2,	[%l7 + %i6]
	set	0x14, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g1
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%g2
	set	0x68, %g2
	stda	%l2,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x64, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l4,	%i7
	and	%g7,	%o5,	%l6
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%g2
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x81,	 0
	nop
	set	0x58, %g5
	std	%f16,	[%l7 + %g5]
	set	0x40, %l5
	stwa	%o3,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x4C, %i3
	ldsw	[%l7 + %i3],	%o4
	set	0x72, %o7
	stha	%o2,	[%l7 + %o7] 0x89
	set	0x70, %g7
	stxa	%o6,	[%l7 + %g7] 0x80
	nop
	set	0x76, %o4
	lduh	[%l7 + %o4],	%o1
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xe2,	%g4
	nop
	set	0x38, %l6
	std	%f24,	[%l7 + %l6]
	set	0x27, %o5
	stba	%g6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x31, %l0
	ldstub	[%l7 + %l0],	%i0
	or	%i5,	%i4,	%i1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%l0
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%i2
	nop
	set	0x56, %l3
	sth	%i6,	[%l7 + %l3]
	set	0x60, %o1
	stha	%l5,	[%l7 + %o1] 0x88
	add	%o0,	%o7,	%l2
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%g1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%l1
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%l4
	nop
	set	0x7C, %i2
	swap	[%l7 + %i2],	%i7
	set	0x20, %o0
	stwa	%l3,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x14, %l4
	ldsw	[%l7 + %l4],	%g7
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%o4
	wr	%g2,	%i3,	%sys_tick
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o3,	%o4
	wr	%o2,	%l6,	%set_softint
	nop
	set	0x1C, %i4
	sth	%o6,	[%l7 + %i4]
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%o1
	nop
	set	0x4E, %g4
	ldsh	[%l7 + %g4],	%g6
	set	0x30, %i5
	sta	%f18,	[%l7 + %i5] 0x89
	nop
	set	0x78, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x6B, %g6
	ldsb	[%l7 + %g6],	%i0
	set	0x50, %o2
	ldda	[%l7 + %o2] 0xe2,	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i1
	nop
	set	0x50, %o3
	std	%g4,	[%l7 + %o3]
	nop
	set	0x40, %i7
	ldsh	[%l7 + %i7],	%i4
	nop
	set	0x10, %g5
	ldd	[%l7 + %g5],	%f4
	ld	[%l7 + 0x74],	%f17
	st	%fsr,	[%l7 + 0x30]
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x89,	 4
	nop
	set	0x0C, %g2
	ldsb	[%l7 + %g2],	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o0
	nop
	set	0x4C, %o7
	lduw	[%l7 + %o7],	%l5
	set	0x68, %g7
	lda	[%l7 + %g7] 0x89,	%f11
	nop
	set	0x20, %i3
	std	%l2,	[%l7 + %i3]
	nop
	set	0x70, %o4
	ldsb	[%l7 + %o4],	%g1
	add	%g3,	%o7,	%l1
	nop
	set	0x74, %l6
	prefetch	[%l7 + %l6],	 0
	set	0x38, %i1
	ldxa	[%l7 + %i1] 0x80,	%l4
	and	%i7,	%g7,	%o5
	set	0x6C, %o5
	sta	%f16,	[%l7 + %o5] 0x88
	nop
	set	0x64, %l0
	stw	%l3,	[%l7 + %l0]
	set	0x60, %o6
	lda	[%l7 + %o6] 0x88,	%f18
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%o2
	set	0x74, %l3
	lda	[%l7 + %l3] 0x80,	%f21
	nop
	set	0x4A, %l2
	ldsh	[%l7 + %l2],	%l6
	and	%o3,	%o1,	%o6
	nop
	set	0x24, %g1
	lduh	[%l7 + %g1],	%i0
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f4
	nop
	set	0x6D, %l4
	ldub	[%l7 + %l4],	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%g6
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x7C, %i2
	ldstub	[%l7 + %i2],	%i1
	nop
	set	0x72, %i4
	lduh	[%l7 + %i4],	%i4
	nop
	set	0x30, %i6
	stb	%g5,	[%l7 + %i6]
	or	%l0,	%i2,	%i6
	ld	[%l7 + 0x38],	%f2
	ld	[%l7 + 0x4C],	%f13
	nop
	set	0x6C, %g4
	lduw	[%l7 + %g4],	%o0
	set	0x20, %i0
	stxa	%l5,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x18, %i5
	ldsw	[%l7 + %i5],	%l2
	set	0x08, %o2
	stda	%g2,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x60, %g6
	stxa	%g1,	[%l7 + %g6] 0x89
	set	0x58, %i7
	stxa	%l1,	[%l7 + %i7] 0xea
	membar	#Sync
	ld	[%l7 + 0x70],	%f3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd0,	%f0
	nop
	set	0x58, %l5
	ldsh	[%l7 + %l5],	%o7
	nop
	set	0x38, %g2
	stx	%l4,	[%l7 + %g2]
	nop
	set	0x38, %o7
	ldsw	[%l7 + %o7],	%g7
	nop
	set	0x40, %g5
	lduw	[%l7 + %g5],	%o5
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x81,	 2
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x81,	%l2
	nop
	set	0x34, %l6
	swap	[%l7 + %l6],	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g2
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x89,	 4
	set	0x78, %o4
	sta	%f1,	[%l7 + %o4] 0x80
	add	%o3,	%o1,	%l6
	set	0x7A, %o5
	stha	%i0,	[%l7 + %o5] 0x89
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%g4
	nop
	set	0x6A, %o6
	ldsh	[%l7 + %o6],	%g6
	nop
	set	0x20, %l0
	stx	%i5,	[%l7 + %l0]
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%i1
	set	0x7C, %l3
	lda	[%l7 + %l3] 0x81,	%f14
	nop
	set	0x5C, %l2
	ldstub	[%l7 + %l2],	%g5
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%l0
	nop
	set	0x24, %g1
	lduw	[%l7 + %g1],	%i4
	nop
	set	0x14, %o0
	sth	%i6,	[%l7 + %o0]
	set	0x74, %l4
	lda	[%l7 + %l4] 0x89,	%f24
	nop
	set	0x6C, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x4C, %i4
	ldsh	[%l7 + %i4],	%o0
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f12
	be,a	%xcc,	loop_73
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f20
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f0
loop_73:
	nop
	set	0x2C, %g4
	stba	%i2,	[%l7 + %g4] 0x81
	st	%fsr,	[%l7 + 0x1C]
	st	%f1,	[%l7 + 0x0C]
	set	0x74, %i5
	lda	[%l7 + %i5] 0x80,	%f24
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc0
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x88,	%l2
	nop
	set	0x48, %o3
	prefetch	[%l7 + %o3],	 4
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%g3
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc4
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f26
	st	%fsr,	[%l7 + 0x18]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%g1
	nop
	set	0x60, %g5
	stx	%l1,	[%l7 + %g5]
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x88,	%l4
	set	0x18, %i3
	stda	%g6,	[%l7 + %i3] 0x88
	nop
	set	0x30, %g7
	std	%f16,	[%l7 + %g7]
	add	%o5,	%o7,	%i7
	set	0x28, %i1
	swapa	[%l7 + %i1] 0x89,	%l3
	set	0x68, %o4
	lda	[%l7 + %o4] 0x88,	%f23
	nop
	set	0x2A, %o5
	stb	%i3,	[%l7 + %o5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD13, 	%sys_tick_cmpr
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o1
	set	0x6B, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l6
	add	%o6,	%i0,	%g4
	nop
	set	0x3C, %l0
	ldsw	[%l7 + %l0],	%g6
	nop
	set	0x12, %l1
	ldub	[%l7 + %l1],	%i5
	bleu,a,pn	%icc,	loop_74
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f2
	wr	%g5,	%l0,	%y
	set	0x34, %l2
	sta	%f8,	[%l7 + %l2] 0x89
loop_74:
	nop
	set	0x2E, %o1
	ldstub	[%l7 + %o1],	%i4
	nop
	set	0x0C, %o0
	stw	%i1,	[%l7 + %o0]
	ba,a,pn	%xcc,	loop_75
	nop
	set	0x5A, %l4
	ldsh	[%l7 + %l4],	%i6
	st	%f22,	[%l7 + 0x64]
	set	0x20, %g1
	stda	%o0,	[%l7 + %g1] 0xe3
	membar	#Sync
loop_75:
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%i2
	ld	[%l7 + 0x58],	%f20
	nop
	set	0x30, %i4
	lduw	[%l7 + %i4],	%l2
	set	0x78, %i2
	stda	%l4,	[%l7 + %i2] 0x88
	set	0x5C, %i6
	swapa	[%l7 + %i6] 0x80,	%g3
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f26
	set	0x40, %i5
	stba	%l1,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x24, %g6
	ldsw	[%l7 + %g6],	%l4
	set	0x51, %i0
	ldstuba	[%l7 + %i0] 0x81,	%g7
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x88,	%f0
	nop
	set	0x78, %o3
	ldsh	[%l7 + %o3],	%o5
	nop
	nop
	setx	0xB00C5234A5AF708A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA369ED2A8E4B024F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f10,	%f24
	nop
	set	0x1A, %g2
	sth	%g1,	[%l7 + %g2]
	set	0x20, %o7
	swapa	[%l7 + %o7] 0x80,	%o7
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%l3
	nop
	set	0x34, %o2
	ldsw	[%l7 + %o2],	%i3
	nop
	set	0x6A, %g7
	ldub	[%l7 + %g7],	%g2
	st	%fsr,	[%l7 + 0x60]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	nop
	set	0x64, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x10, %l6
	std	%f20,	[%l7 + %l6]
	nop
	set	0x48, %o6
	stw	%o3,	[%l7 + %o6]
	nop
	set	0x08, %l0
	prefetch	[%l7 + %l0],	 2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l6
	set	0x08, %o5
	ldxa	[%l7 + %o5] 0x88,	%o6
	bgu	%xcc,	loop_76
	nop
	set	0x08, %l3
	stx	%fsr,	[%l7 + %l3]
	wr	%o1,	%i0,	%sys_tick
	nop
	set	0x64, %l2
	stw	%g6,	[%l7 + %l2]
loop_76:
	nop
	set	0x5C, %o1
	stha	%g4,	[%l7 + %o1] 0x88
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%g5
	or	%l0,	%i4,	%i5
	or	%i1,	%o0,	%i2
	add	%l2,	%l5,	%i6
	set	0x68, %o0
	ldxa	[%l7 + %o0] 0x80,	%g3
	nop
	set	0x68, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x28, %g3
	stxa	%l4,	[%l7 + %g3] 0x81
	be,a,pn	%icc,	loop_77
	nop
	set	0x72, %i4
	ldstub	[%l7 + %i4],	%g7
	set	0x50, %g1
	stxa	%o5,	[%l7 + %g1] 0xea
	membar	#Sync
loop_77:
	nop
	set	0x68, %i2
	ldx	[%l7 + %i2],	%l1
	and	%g1,	%o7,	%l3
	add	%i3,	%i7,	%g2
	nop
	set	0x70, %i6
	lduh	[%l7 + %i6],	%o4
	set	0x58, %g4
	swapa	[%l7 + %g4] 0x89,	%o2
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%o3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x80,	%i6
	nop
	set	0x74, %i7
	stb	%o6,	[%l7 + %i7]
	ld	[%l7 + 0x38],	%f31
	set	0x50, %o3
	stwa	%i0,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x58, %o7
	stw	%g6,	[%l7 + %o7]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%g4
	nop
	set	0x08, %g2
	lduw	[%l7 + %g2],	%l0
	nop
	set	0x3E, %g5
	ldsb	[%l7 + %g5],	%i4
	nop
	set	0x50, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x78, %o2
	swap	[%l7 + %o2],	%i5
	set	0x2B, %i1
	stba	%g5,	[%l7 + %i1] 0xe3
	membar	#Sync
	st	%f8,	[%l7 + 0x30]
	nop
	set	0x10, %g7
	ldsh	[%l7 + %g7],	%o0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	nop
	set	0x48, %l6
	stx	%i1,	[%l7 + %l6]
	set	0x68, %o4
	stda	%i2,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x0D, %l0
	stba	%l2,	[%l7 + %l0] 0x89
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%i6
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%l4
	nop
	set	0x2B, %l2
	stb	%l4,	[%l7 + %l2]
	set	0x0D, %l3
	ldstuba	[%l7 + %l3] 0x80,	%g3
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x81
	set	0x4E, %o0
	stha	%o5,	[%l7 + %o0] 0x88
	set	0x24, %l1
	stha	%g7,	[%l7 + %l1] 0x81
	nop
	set	0x20, %g3
	ldsw	[%l7 + %g3],	%l1
	st	%fsr,	[%l7 + 0x40]
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x88,	%o7
	or	%g1,	%l3,	%i7
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xe3,	%i2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f16
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%f26
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%o2
	set	0x38, %i6
	lda	[%l7 + %i6] 0x80,	%f4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%l6
	st	%f0,	[%l7 + 0x74]
	set	0x14, %i5
	swapa	[%l7 + %i5] 0x81,	%o6
	nop
	set	0x20, %g4
	swap	[%l7 + %g4],	%i0
	set	0x50, %g6
	ldxa	[%l7 + %g6] 0x89,	%g6
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%o2
	set	0x40, %i0
	stda	%g4,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xe3,	%o0
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f4
	nop
	set	0x74, %g5
	stw	%l0,	[%l7 + %g5]
	nop
	set	0x1A, %l5
	ldub	[%l7 + %l5],	%i5
	bl,a	%xcc,	loop_78
	nop
	set	0x2C, %g2
	ldsw	[%l7 + %g2],	%g5
	nop
	set	0x18, %o2
	stw	%i4,	[%l7 + %o2]
	nop
	set	0x51, %g7
	ldub	[%l7 + %g7],	%o0
loop_78:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%l2
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%i1
	nop
	set	0x1C, %l6
	stw	%i6,	[%l7 + %l6]
	set	0x53, %l0
	stba	%l5,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	nop
	setx	0x27F30D86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xAB73072F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f11,	%f16
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x14, %o6
	stw	%l4,	[%l7 + %o6]
	ld	[%l7 + 0x68],	%f10
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x80,	%o5
	nop
	set	0x58, %o5
	stx	%g3,	[%l7 + %o5]
	set	0x4C, %l3
	swapa	[%l7 + %l3] 0x89,	%l1
	nop
	set	0x36, %o1
	lduh	[%l7 + %o1],	%g7
	nop
	set	0x34, %l2
	ldub	[%l7 + %l2],	%g1
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%l3
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x26, %g3
	stba	%o7,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x27, %g1
	ldsb	[%l7 + %g1],	%i3
	nop
	set	0x16, %l4
	lduh	[%l7 + %l4],	%i7
	set	0x48, %i4
	stha	%o2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x24, %i2
	sta	%f1,	[%l7 + %i2] 0x81
	nop
	set	0x3C, %i5
	swap	[%l7 + %i5],	%o4
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%l6
	set	0x25, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g2
	nop
	set	0x74, %i7
	ldsh	[%l7 + %i7],	%o6
	set	0x44, %i0
	lda	[%l7 + %i0] 0x80,	%f9
	nop
	set	0x58, %g6
	stx	%g6,	[%l7 + %g6]
	set	0x2B, %o3
	stba	%i0,	[%l7 + %o3] 0x89
	nop
	set	0x10, %o7
	ldsh	[%l7 + %o7],	%o3
	add	%g4,	%l0,	%o1
	ld	[%l7 + 0x18],	%f6
	add	%g5,	%i4,	%o0
	ld	[%l7 + 0x7C],	%f24
	nop
	set	0x50, %l5
	std	%i2,	[%l7 + %l5]
	set	0x74, %g2
	stha	%l2,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x54, %g5
	lda	[%l7 + %g5] 0x89,	%f19
	nop
	set	0x44, %g7
	sth	%i5,	[%l7 + %g7]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x80
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x81,	%i1
	nop
	set	0x68, %l6
	ldd	[%l7 + %l6],	%l4
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f12
	set	0x20, %i3
	stxa	%l4,	[%l7 + %i3] 0x89
	ld	[%l7 + 0x64],	%f24
	add	%i6,	%g3,	%o5
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%g7
	st	%f5,	[%l7 + 0x50]
	wr	%g1,	%l3,	%ccr
	nop
	set	0x41, %o5
	ldstub	[%l7 + %o5],	%l1
	add	%i3,	%o7,	%o2
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%i7
	ld	[%l7 + 0x44],	%f12
	fpsub32s	%f2,	%f17,	%f6
	nop
	set	0x74, %o6
	ldsh	[%l7 + %o6],	%l6
	wr	%o4,	%g2,	%ccr
	set	0x48, %o1
	stxa	%o6,	[%l7 + %o1] 0x81
	set	0x28, %l1
	stda	%g6,	[%l7 + %l1] 0xeb
	membar	#Sync
	set	0x10, %l2
	swapa	[%l7 + %l2] 0x80,	%i0
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc2
	nop
	set	0x72, %o0
	ldub	[%l7 + %o0],	%o3
	add	%l0,	%g4,	%o1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f0
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%g4
	nop
	set	0x38, %i4
	std	%o0,	[%l7 + %i4]
	ld	[%l7 + 0x0C],	%f18
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%l2
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x81,	%i4
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x68, %i0
	prefetch	[%l7 + %i0],	 1
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x49, %o3
	stb	%i1,	[%l7 + %o3]
	nop
	set	0x58, %g6
	std	%l4,	[%l7 + %g6]
	set	0x68, %l5
	sta	%f1,	[%l7 + %l5] 0x80
	ld	[%l7 + 0x7C],	%f1
	nop
	set	0x78, %o7
	ldsw	[%l7 + %o7],	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%g3
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xe3,	%o4
	and	%g7,	%l4,	%g1
	set	0x28, %g7
	stda	%l2,	[%l7 + %g7] 0x80
	nop
	set	0x59, %i1
	stb	%i3,	[%l7 + %i1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%o2
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%l1
	set	0x08, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	wr	%i7,	%o4,	%clear_softint
	set	0x40, %l0
	lda	[%l7 + %l0] 0x81,	%f18
	wr	%g2,	%g6,	%set_softint
	st	%fsr,	[%l7 + 0x54]
	set	0x6E, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i0
	nop
	set	0x30, %l6
	swap	[%l7 + %l6],	%o3
	nop
	set	0x18, %o4
	swap	[%l7 + %o4],	%o6
	set	0x34, %o5
	sta	%f0,	[%l7 + %o5] 0x80
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x81,	%g4
	nop
	set	0x28, %l3
	std	%f26,	[%l7 + %l3]
	nop
	set	0x18, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x70, %l2
	stw	%o1,	[%l7 + %l2]
	nop
	set	0x66, %o1
	sth	%g5,	[%l7 + %o1]
	nop
	set	0x1E, %o0
	ldsb	[%l7 + %o0],	%i2
	nop
	set	0x31, %g3
	stb	%o0,	[%l7 + %g3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%l2
	nop
	set	0x2A, %l4
	ldsh	[%l7 + %l4],	%i1
	set	0x58, %i4
	stba	%i5,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xe2,	%l4
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x54, %i6
	ldsh	[%l7 + %i6],	%g3
	nop
	set	0x10, %g4
	std	%i6,	[%l7 + %g4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o5,	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd2,	%f16
	st	%f29,	[%l7 + 0x3C]
	set	0x20, %i7
	ldda	[%l7 + %i7] 0xea,	%l4
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%o6
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%o2
	set	0x10, %l5
	stwa	%l1,	[%l7 + %l5] 0x88
	nop
	set	0x22, %o3
	ldsb	[%l7 + %o3],	%l6
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%i7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x81,	%i3,	%o4
	set	0x60, %g7
	lda	[%l7 + %g7] 0x80,	%f5
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x2E, %i1
	sth	%g2,	[%l7 + %i1]
	or	%g6,	%o3,	%o6
	set	0x48, %o2
	stba	%i0,	[%l7 + %o2] 0x81
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x81,	%g4
	nop
	set	0x10, %i3
	ldsw	[%l7 + %i3],	%o1
	nop
	set	0x4C, %l0
	ldsw	[%l7 + %l0],	%g5
	set	0x18, %l6
	ldxa	[%l7 + %l6] 0x89,	%i2
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x89,	%l0
	nop
	set	0x30, %o6
	stx	%i4,	[%l7 + %o6]
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%o0
	nop
	set	0x29, %o5
	stb	%i1,	[%l7 + %o5]
	nop
	set	0x44, %l2
	prefetch	[%l7 + %l2],	 3
	nop
	set	0x50, %o1
	std	%f30,	[%l7 + %o1]
	set	0x0C, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l2
	set	0x1A, %g3
	stha	%l5,	[%l7 + %g3] 0x81
	nop
	set	0x76, %l4
	ldsb	[%l7 + %l4],	%g3
	nop
	set	0x51, %o0
	ldub	[%l7 + %o0],	%i5
	nop
	set	0x44, %i4
	ldsw	[%l7 + %i4],	%o5
	set	0x38, %g1
	stwa	%i6,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%f24
	st	%f22,	[%l7 + 0x7C]
	nop
	set	0x5C, %i6
	swap	[%l7 + %i6],	%g7
	nop
	set	0x1C, %g4
	ldsw	[%l7 + %g4],	%l3
	fpadd32s	%f24,	%f8,	%f25
	nop
	set	0x57, %i7
	ldsb	[%l7 + %i7],	%l4
	nop
	set	0x20, %i0
	std	%o6,	[%l7 + %i0]
	wr	%o2,	%l1,	%pic
	nop
	set	0x28, %g6
	std	%f14,	[%l7 + %g6]
	nop
	set	0x7A, %l5
	ldstub	[%l7 + %l5],	%l6
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf8
	membar	#Sync
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f10
	nop
	set	0x24, %o3
	prefetch	[%l7 + %o3],	 4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%i3
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o4
	set	0x0C, %g7
	swapa	[%l7 + %g7] 0x88,	%g6
	nop
	set	0x20, %g2
	stx	%o3,	[%l7 + %g2]
	nop
	set	0x3E, %g5
	lduh	[%l7 + %g5],	%o6
	set	0x18, %i3
	sta	%f2,	[%l7 + %i3] 0x81
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%g2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xda
	nop
	set	0x4C, %l0
	ldsb	[%l7 + %l0],	%i0
	wr	%o1,	%g5,	%ccr
	add	%g4,	%i2,	%i4
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x88
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%i1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	add	%o0,	%l2,	%l5
	nop
	set	0x10, %o5
	std	%g2,	[%l7 + %o5]
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x89,	 2
	or	%o5,	%i6,	%l3
	nop
	set	0x60, %o1
	std	%f28,	[%l7 + %o1]
	nop
	set	0x43, %l3
	ldub	[%l7 + %l3],	%l4
	or	%o7,	%g7,	%l1
	add	%l6,	%o2,	%i3
	set	0x60, %l1
	swapa	[%l7 + %l1] 0x80,	%g1
	and	%o4,	%g6,	%o3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%g2
	nop
	set	0x78, %l4
	std	%i0,	[%l7 + %l4]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd0,	%f0
	and	%o6,	%o1,	%g4
	ld	[%l7 + 0x30],	%f13
	nop
	set	0x48, %i4
	stx	%g5,	[%l7 + %i4]
	nop
	set	0x51, %g3
	ldub	[%l7 + %g3],	%i2
	set	0x18, %i5
	stha	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f22
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xcc
	set	0x4B, %g1
	stba	%i1,	[%l7 + %g1] 0x88
	nop
	set	0x24, %i0
	lduh	[%l7 + %i0],	%i4
	set	0x32, %i7
	stha	%o0,	[%l7 + %i7] 0x80
	and	%l2,	%g3,	%l5
	set	0x72, %g6
	stha	%o5,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x1B, %l5
	ldstub	[%l7 + %l5],	%i5
	st	%f7,	[%l7 + 0x58]
	nop
	set	0x64, %i2
	lduw	[%l7 + %i2],	%i6
	set	0x25, %o3
	stba	%l4,	[%l7 + %o3] 0x88
	nop
	set	0x10, %o7
	std	%f2,	[%l7 + %o7]
	nop
	set	0x26, %g7
	ldub	[%l7 + %g7],	%l3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf1
	membar	#Sync
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%g7
	or	%l1,	%o7,	%o2
	nop
	set	0x58, %i3
	lduh	[%l7 + %i3],	%i3
	nop
	set	0x0B, %o2
	ldstub	[%l7 + %o2],	%l6
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x89,	%o4
	nop
	nop
	setx	0x29BCDCC2869C079D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xF9734C5F3A3EDA49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f10,	%f10
	nop
	set	0x16, %l0
	sth	%g6,	[%l7 + %l0]
	or	%g1,	%i7,	%g2
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%i0
	nop
	set	0x50, %o4
	sth	%o3,	[%l7 + %o4]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xca
	set	0x7A, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o6
	bgu,a,pn	%icc,	loop_79
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x5D, %l3
	ldub	[%l7 + %l3],	%o1
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 1
loop_79:
	nop
	set	0x78, %l4
	std	%g4,	[%l7 + %l4]
	nop
	set	0x0B, %l1
	ldstub	[%l7 + %l1],	%g4
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x89,	%f14
	and	%i2,	%l0,	%i4
	set	0x0B, %i4
	stba	%i1,	[%l7 + %i4] 0x81
	set	0x58, %g3
	ldxa	[%l7 + %g3] 0x88,	%l2
	set	0x48, %i5
	stxa	%g3,	[%l7 + %i5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	set	0x50, %i6
	sta	%f29,	[%l7 + %i6] 0x80
	set	0x7C, %g4
	sta	%f15,	[%l7 + %g4] 0x81
	set	0x3C, %i0
	lda	[%l7 + %i0] 0x88,	%f23
	fpadd32s	%f26,	%f8,	%f15
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%l5
	set	0x78, %g1
	stda	%o0,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x14, %g6
	stba	%o5,	[%l7 + %g6] 0x80
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x88
	or	%i6,	%i5,	%l3
	set	0x40, %i2
	stha	%l4,	[%l7 + %i2] 0x88
	or	%g7,	%l1,	%o2
	set	0x3E, %o3
	ldstuba	[%l7 + %o3] 0x88,	%o7
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x81,	%l6
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x81,	%i2
	ld	[%l7 + 0x14],	%f2
	set	0x68, %g2
	stda	%o4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x7E, %o7
	ldub	[%l7 + %o7],	%g1
	set	0x18, %i3
	stda	%g6,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x2C, %g5
	ldsh	[%l7 + %g5],	%i7
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f16
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x88,	%i0
	or	%o3,	%g2,	%o1
	set	0x43, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o6
	set	0x70, %o6
	stwa	%g5,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x76, %o4
	stb	%i2,	[%l7 + %o4]
	nop
	set	0x08, %o5
	stx	%fsr,	[%l7 + %o5]
	wr	%l0,	%g4,	%pic
	nop
	set	0x12, %l2
	sth	%i1,	[%l7 + %l2]
	set	0x28, %l3
	stxa	%l2,	[%l7 + %l3] 0x89
	nop
	set	0x64, %o1
	lduh	[%l7 + %o1],	%i4
	set	0x70, %l4
	sta	%f25,	[%l7 + %l4] 0x81
	nop
	set	0x70, %o0
	std	%l4,	[%l7 + %o0]
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f4
	nop
	set	0x10, %l1
	stx	%g3,	[%l7 + %l1]
	set	0x70, %i5
	stda	%o4,	[%l7 + %i5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x50]
	st	%f27,	[%l7 + 0x1C]
	nop
	set	0x50, %g3
	stx	%i6,	[%l7 + %g3]
	set	0x68, %g4
	stxa	%i5,	[%l7 + %g4] 0x81
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%o0
	set	0x1C, %i7
	stha	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x30, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f16
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x88,	%l3
	nop
	set	0x38, %i2
	sth	%g7,	[%l7 + %i2]
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x80,	 4
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x80,	%o7
	and	%l6,	%o2,	%o4
	set	0x52, %g1
	stba	%g1,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%i3
	add	%g6,	%i0,	%i7
	set	0x50, %g2
	stha	%o3,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	ld	[%l7 + 0x78],	%f4
	set	0x78, %g5
	sta	%f29,	[%l7 + %g5] 0x88
	nop
	set	0x56, %i3
	lduh	[%l7 + %i3],	%g2
	set	0x53, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o6
	nop
	set	0x70, %l0
	stx	%g5,	[%l7 + %l0]
	set	0x0A, %o6
	stha	%o1,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x60, %o4
	stda	%i2,	[%l7 + %o4] 0x80
	nop
	set	0x08, %o5
	stw	%g4,	[%l7 + %o5]
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f20
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x80,	%l0
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%i1
	set	0x10, %l4
	ldxa	[%l7 + %l4] 0x88,	%l2
	set	0x18, %l3
	stda	%i4,	[%l7 + %l3] 0x80
	nop
	set	0x78, %i4
	ldsh	[%l7 + %i4],	%l5
	set	0x64, %o0
	stba	%o5,	[%l7 + %o0] 0x88
	set	0x18, %i5
	stda	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x88,	%i4
	nop
	set	0x28, %g4
	prefetch	[%l7 + %g4],	 1
	nop
	set	0x30, %i0
	swap	[%l7 + %i0],	%o0
	nop
	set	0x38, %i7
	stw	%i6,	[%l7 + %i7]
	nop
	set	0x30, %i6
	swap	[%l7 + %i6],	%l3
	set	0x72, %l1
	stha	%g7,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x78, %l5
	lduw	[%l7 + %l5],	%l1
	nop
	set	0x12, %g6
	ldsh	[%l7 + %g6],	%o7
	nop
	set	0x14, %i2
	ldsw	[%l7 + %i2],	%l6
	set	0x55, %o3
	ldstuba	[%l7 + %o3] 0x89,	%l4
	nop
	set	0x5E, %g7
	sth	%o2,	[%l7 + %g7]
	set	0x25, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g1
	nop
	set	0x2B, %g1
	ldsb	[%l7 + %g1],	%o4
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%g6
	st	%f13,	[%l7 + 0x28]
	add	%i0,	%i7,	%o3
	nop
	set	0x68, %g5
	lduw	[%l7 + %g5],	%i3
	set	0x60, %o7
	stxa	%g2,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x40, %i3
	stb	%g5,	[%l7 + %i3]
	set	0x17, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o1
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc2
	fpsub16	%f14,	%f4,	%f0
	and	%i2,	%o6,	%g4
	nop
	set	0x10, %o4
	stw	%l0,	[%l7 + %o4]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%i4
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%i1
	set	0x68, %l2
	swapa	[%l7 + %l2] 0x89,	%o5
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f16
	nop
	set	0x4E, %o1
	stb	%g3,	[%l7 + %o1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%o0
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x30, %l4
	std	%f20,	[%l7 + %l4]
	set	0x50, %l3
	sta	%f15,	[%l7 + %l3] 0x81
	bleu,pt	%xcc,	loop_80
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%l3
	nop
	set	0x68, %o0
	stx	%g7,	[%l7 + %o0]
	add	%l1,	%o7,	%l4
loop_80:
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%f0
	nop
	set	0x10, %i4
	lduh	[%l7 + %i4],	%l6
	set	0x6E, %g4
	ldstuba	[%l7 + %g4] 0x81,	%g1
	nop
	set	0x68, %g3
	lduw	[%l7 + %g3],	%o2
	nop
	set	0x58, %i7
	std	%g6,	[%l7 + %i7]
	set	0x3C, %i6
	stwa	%o4,	[%l7 + %i6] 0x88
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f6
	set	0x28, %i0
	stda	%i0,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%o3
	bge	%icc,	loop_81
	nop
	set	0x6C, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x89,	%i3
loop_81:
	nop
	set	0x60, %o3
	lda	[%l7 + %o3] 0x81,	%f26
	set	0x18, %i2
	stda	%g4,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x60, %g7
	ldx	[%l7 + %g7],	%g2
	nop
	set	0x12, %i1
	ldsb	[%l7 + %i1],	%i2
	and	%o1,	%g4,	%o6
	nop
	set	0x78, %g2
	stx	%l0,	[%l7 + %g2]
	nop
	set	0x1C, %g5
	stw	%i4,	[%l7 + %g5]
	ld	[%l7 + 0x7C],	%f18
	set	0x58, %o7
	stwa	%i1,	[%l7 + %o7] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x24]
	set	0x78, %i3
	stda	%o4,	[%l7 + %i3] 0x88
	nop
	set	0x48, %o2
	stb	%g3,	[%l7 + %o2]
	ba,a	%xcc,	loop_82
	add	%l5,	%i5,	%i6
	nop
	set	0x68, %o6
	stx	%l2,	[%l7 + %o6]
	or	%o0,	%l3,	%g7
loop_82:
	nop
	set	0x74, %o4
	ldsw	[%l7 + %o4],	%l1
	nop
	set	0x24, %o5
	lduh	[%l7 + %o5],	%l4
	st	%f0,	[%l7 + 0x14]
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%i6
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x89,	%o6
	nop
	set	0x48, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x1C, %l4
	stw	%o2,	[%l7 + %l4]
	nop
	set	0x08, %g1
	ldsw	[%l7 + %g1],	%g6
	and	%g1,	%o4,	%i7
	nop
	set	0x61, %l6
	ldstub	[%l7 + %l6],	%o3
	set	0x44, %l3
	sta	%f11,	[%l7 + %l3] 0x80
	nop
	set	0x73, %o0
	stb	%i0,	[%l7 + %o0]
	nop
	set	0x70, %i5
	prefetch	[%l7 + %i5],	 0
	and	%g5,	%g2,	%i3
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%i2
	set	0x5E, %g3
	stha	%o1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x18, %i7
	stw	%g4,	[%l7 + %i7]
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x88,	%l0
	set	0x28, %l1
	stda	%o6,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x4C, %g4
	prefetch	[%l7 + %g4],	 1
	set	0x0A, %i0
	stba	%i4,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x70, %l5
	std	%i0,	[%l7 + %l5]
	nop
	set	0x3E, %g6
	lduh	[%l7 + %g6],	%o5
	nop
	set	0x5B, %o3
	ldub	[%l7 + %o3],	%g3
	set	0x20, %g7
	ldda	[%l7 + %g7] 0xe2,	%l4
	nop
	set	0x35, %i2
	stb	%i5,	[%l7 + %i2]
	nop
	set	0x44, %i1
	stw	%i6,	[%l7 + %i1]
	bg	%xcc,	loop_83
	nop
	set	0x10, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x3C, %o7
	stw	%o0,	[%l7 + %o7]
	and	%l2,	%l3,	%l1
loop_83:
	nop
	set	0x34, %i3
	ldsw	[%l7 + %i3],	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o7
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x81,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%g1
	set	0x38, %o6
	ldxa	[%l7 + %o6] 0x89,	%g6
	set	0x70, %g2
	stha	%i7,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x2A, %o5
	ldsh	[%l7 + %o5],	%o3
	nop
	set	0x78, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x50, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x0C, %l0
	ldsw	[%l7 + %l0],	%i0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f16
	nop
	set	0x14, %g1
	stw	%o4,	[%l7 + %g1]
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g5
	nop
	set	0x70, %l3
	stx	%i3,	[%l7 + %l3]
	set	0x0B, %o0
	stba	%i2,	[%l7 + %o0] 0x89
	nop
	set	0x6B, %l4
	stb	%o1,	[%l7 + %l4]
	nop
	set	0x28, %i5
	stb	%l0,	[%l7 + %i5]
	set	0x6C, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g4
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x5C, %i6
	sta	%f24,	[%l7 + %i6] 0x89
	add	%o6,	%i4,	%i1
	nop
	set	0x70, %i7
	stx	%o5,	[%l7 + %i7]
	nop
	set	0x48, %g4
	std	%f30,	[%l7 + %g4]
	nop
	set	0x40, %l1
	stx	%l5,	[%l7 + %l1]
	nop
	set	0x78, %i0
	std	%f22,	[%l7 + %i0]
	nop
	set	0x38, %l5
	stx	%g3,	[%l7 + %l5]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%o0
	set	0x38, %g6
	swapa	[%l7 + %g6] 0x81,	%l2
	set	0x7A, %g7
	stha	%i6,	[%l7 + %g7] 0x81
	bg,pn	%icc,	loop_84
	and	%l3,	%g7,	%l6
	nop
	set	0x48, %i2
	std	%f18,	[%l7 + %i2]
	nop
	set	0x7B, %o3
	ldstub	[%l7 + %o3],	%o7
loop_84:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%l4
	or	%g1,	%o2,	%i7
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%o3
	nop
	set	0x18, %i1
	ldx	[%l7 + %i1],	%g6
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%f16
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%i0
	set	0x55, %o6
	stba	%o4,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x5C, %i3
	stba	%g2,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%i2
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x81,	%o1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o6
	nop
	set	0x50, %o4
	ldsh	[%l7 + %o4],	%l0
	nop
	set	0x08, %l0
	stx	%i4,	[%l7 + %l0]
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x89,	 4
	nop
	set	0x66, %o1
	ldsh	[%l7 + %o1],	%l5
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 2
	set	0x50, %g1
	stda	%g2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%o0
	wr	%l2,	%i6,	%clear_softint
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x89,	%i5
	nop
	nop
	setx	0x1AE6826A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x99AA1541,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f13,	%f7
	nop
	set	0x40, %i5
	std	%f22,	[%l7 + %i5]
	add	%g7,	%l6,	%l3
	nop
	set	0x17, %g3
	ldub	[%l7 + %g3],	%o7
	nop
	set	0x77, %o0
	ldsb	[%l7 + %o0],	%l1
	nop
	set	0x68, %i6
	stw	%l4,	[%l7 + %i6]
	nop
	set	0x0E, %i7
	ldub	[%l7 + %i7],	%g1
	set	0x20, %g4
	stxa	%o2,	[%l7 + %g4] 0x81
	nop
	set	0x7D, %i4
	ldsb	[%l7 + %i4],	%o3
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f20
	nop
	set	0x24, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x28, %i0
	sta	%f31,	[%l7 + %i0] 0x81
	nop
	set	0x71, %g7
	ldstub	[%l7 + %g7],	%g6
	nop
	set	0x6C, %i2
	lduw	[%l7 + %i2],	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g2
	nop
	set	0x30, %o3
	stw	%i7,	[%l7 + %o3]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g5
	ld	[%l7 + 0x14],	%f11
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x81
	nop
	set	0x76, %g5
	sth	%o1,	[%l7 + %g5]
	nop
	set	0x50, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x20, %i1
	std	%f10,	[%l7 + %i1]
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%g4
	set	0x50, %o6
	ldda	[%l7 + %o6] 0x89,	%i2
	fpadd16s	%f19,	%f10,	%f29
	nop
	set	0x2A, %i3
	ldub	[%l7 + %i3],	%l0
	set	0x34, %l2
	sta	%f0,	[%l7 + %l2] 0x81
	add	%i4,	%o6,	%l5
	nop
	set	0x20, %g2
	ldx	[%l7 + %g2],	%o5
	ld	[%l7 + 0x48],	%f2
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x81,	%g3
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%i1
	set	0x0C, %o1
	swapa	[%l7 + %o1] 0x81,	%o0
	nop
	set	0x46, %l6
	sth	%l2,	[%l7 + %l6]
	and	%i6,	%g7,	%i5
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f0
	or	%l3,	%l6,	%o7
	st	%f26,	[%l7 + 0x10]
	nop
	set	0x40, %l3
	std	%f22,	[%l7 + %l3]
	set	0x38, %o5
	sta	%f8,	[%l7 + %o5] 0x81
	nop
	set	0x2A, %l4
	sth	%l4,	[%l7 + %l4]
	set	0x18, %g3
	stda	%g0,	[%l7 + %g3] 0x80
	wr	%o2,	%l1,	%sys_tick
	and	%g6,	%o3,	%o4
	nop
	set	0x30, %o0
	ldsh	[%l7 + %o0],	%i0
	nop
	set	0x1A, %i5
	lduh	[%l7 + %i5],	%g2
	nop
	set	0x3C, %i6
	stw	%i7,	[%l7 + %i6]
	set	0x3C, %g4
	stha	%i3,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x78, %i4
	stxa	%o1,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x58, %i7
	stxa	%g4,	[%l7 + %i7] 0x88
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%i2
	nop
	set	0x40, %l1
	std	%f30,	[%l7 + %l1]
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xd8
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%g5
	nop
	set	0x78, %o3
	prefetch	[%l7 + %o3],	 0
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%l0
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	wr	%i4,	%o6,	%clear_softint
	set	0x78, %o7
	stda	%l4,	[%l7 + %o7] 0x80
	set	0x26, %g5
	stba	%g3,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x88,	%o4
	set	0x30, %o6
	stwa	%i1,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x76, %i1
	ldsh	[%l7 + %i1],	%l2
	set	0x5F, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o0
	nop
	set	0x08, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x48, %g2
	stx	%g7,	[%l7 + %g2]
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%i5
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x81,	%i6
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%l6
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%l3
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%l4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%g6
	set	0x28, %l3
	sta	%f13,	[%l7 + %l3] 0x81
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xda,	%f16
	set	0x16, %g3
	stha	%l1,	[%l7 + %g3] 0x89
	nop
	set	0x5C, %l4
	ldsw	[%l7 + %l4],	%o3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xd0
	nop
	set	0x78, %i6
	stx	%o4,	[%l7 + %i6]
	set	0x40, %i5
	stha	%i0,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x3D, %g4
	stba	%i7,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%g2
	nop
	set	0x58, %l5
	stw	%o1,	[%l7 + %l5]
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x2E, %g7
	lduh	[%l7 + %g7],	%g4
	set	0x3A, %i2
	ldstuba	[%l7 + %i2] 0x88,	%i2
	nop
	set	0x58, %i7
	stw	%l0,	[%l7 + %i7]
	set	0x74, %i0
	stwa	%i4,	[%l7 + %i0] 0x80
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x81,	%g5
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%o6
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%g3
	nop
	set	0x2F, %g5
	ldsb	[%l7 + %g5],	%o5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%l5
	nop
	set	0x64, %o2
	lduw	[%l7 + %o2],	%l2
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f16
	set	0x74, %l2
	sta	%f0,	[%l7 + %l2] 0x89
	set	0x56, %i3
	stha	%g7,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x08, %o6
	std	%o0,	[%l7 + %o6]
	add	%i6,	%l6,	%l3
	set	0x24, %g2
	sta	%f3,	[%l7 + %g2] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%l4
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f2
	set	0x70, %l6
	stwa	%o7,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x89,	%g0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f0
	nop
	set	0x08, %o1
	sth	%g6,	[%l7 + %o1]
	set	0x18, %o5
	lda	[%l7 + %o5] 0x80,	%f10
	set	0x78, %l3
	stda	%o2,	[%l7 + %l3] 0x81
	nop
	set	0x76, %l4
	ldsh	[%l7 + %l4],	%o3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o4
	nop
	set	0x3C, %o0
	ldsw	[%l7 + %o0],	%i0
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%i7
	nop
	set	0x34, %i6
	swap	[%l7 + %i6],	%o1
	nop
	set	0x36, %g4
	sth	%g2,	[%l7 + %g4]
	ld	[%l7 + 0x30],	%f10
	fpadd16	%f28,	%f24,	%f26
	and	%g4,	%i3,	%l0
	nop
	set	0x38, %i4
	stx	%i4,	[%l7 + %i4]
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xea,	%i2
	nop
	set	0x1D, %l1
	ldstub	[%l7 + %l1],	%g5
	nop
	set	0x14, %g7
	stw	%g3,	[%l7 + %g7]
	set	0x54, %i2
	lda	[%l7 + %i2] 0x88,	%f9
	nop
	set	0x6B, %i7
	ldsb	[%l7 + %i7],	%o6
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe3,	%i0
	nop
	set	0x48, %o3
	prefetch	[%l7 + %o3],	 4
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x50, %l5
	std	%f28,	[%l7 + %l5]
	nop
	set	0x38, %o7
	ldstub	[%l7 + %o7],	%l5
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f12
	set	0x56, %o2
	stha	%o0,	[%l7 + %o2] 0x80
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x81,	%i6
	fpsub16	%f0,	%f20,	%f28
	set	0x48, %i1
	stda	%i6,	[%l7 + %i1] 0xeb
	membar	#Sync
	fpsub32	%f8,	%f24,	%f8
	nop
	set	0x38, %i3
	ldsw	[%l7 + %i3],	%l3
	nop
	set	0x30, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x89,	%f13
	st	%fsr,	[%l7 + 0x44]
	st	%f16,	[%l7 + 0x6C]
	nop
	set	0x20, %l0
	std	%g6,	[%l7 + %l0]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o7
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x89,	%g0
	set	0x68, %o4
	stda	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	bleu,a,pn	%xcc,	loop_85
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%o3
loop_85:
	nop
	set	0x74, %o5
	ldsh	[%l7 + %o5],	%o4
	set	0x18, %o1
	stda	%i0,	[%l7 + %o1] 0x88
	nop
	set	0x4C, %l3
	lduw	[%l7 + %l3],	%i7
	nop
	set	0x50, %o0
	lduw	[%l7 + %o0],	%l1
	ld	[%l7 + 0x54],	%f13
	set	0x70, %l4
	lda	[%l7 + %l4] 0x89,	%f18
	nop
	set	0x45, %g3
	ldub	[%l7 + %g3],	%o1
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x81,	%g4
	set	0x5C, %i6
	sta	%f3,	[%l7 + %i6] 0x80
	bge	%icc,	loop_86
	nop
	nop
	setx	0xB2F87F70F2DA9881,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3407701B360965F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f26,	%f26
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i3,	%g2
loop_86:
	nop
	set	0x28, %i4
	stxa	%l0,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x48, %i5
	std	%i4,	[%l7 + %i5]
	set	0x40, %g7
	ldxa	[%l7 + %g7] 0x89,	%g5
	set	0x14, %i2
	sta	%f9,	[%l7 + %i2] 0x88
	add	%i2,	%o6,	%i1
	set	0x48, %l1
	stxa	%l5,	[%l7 + %l1] 0x80
	nop
	set	0x18, %i0
	sth	%o5,	[%l7 + %i0]
	nop
	set	0x08, %i7
	stx	%g3,	[%l7 + %i7]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i6
	set	0x1D, %o3
	ldstuba	[%l7 + %o3] 0x81,	%o0
	nop
	set	0x7C, %o7
	ldsw	[%l7 + %o7],	%l6
	nop
	set	0x58, %g6
	std	%l2,	[%l7 + %g6]
	ld	[%l7 + 0x74],	%f9
	bgu,pt	%xcc,	loop_87
	or	%l4,	%g7,	%o7
	set	0x28, %l5
	stda	%g6,	[%l7 + %l5] 0xeb
	membar	#Sync
loop_87:
	nop
	set	0x64, %o2
	swap	[%l7 + %o2],	%i5
	nop
	set	0x50, %i1
	std	%f26,	[%l7 + %i1]
	nop
	set	0x58, %i3
	stx	%g1,	[%l7 + %i3]
	nop
	set	0x08, %g5
	std	%o2,	[%l7 + %g5]
	nop
	set	0x08, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x47, %l0
	ldub	[%l7 + %l0],	%o3
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xeb,	%o4
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x80,	%i0
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x40, %g1
	std	%f30,	[%l7 + %g1]
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f28
	set	0x6A, %o1
	stha	%l1,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x70, %o5
	swap	[%l7 + %o5],	%o1
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x80,	%i6
	or	%i3,	%g2,	%g4
	wr	%l0,	%g5,	%ccr
	or	%i2,	%o6,	%i1
	set	0x7C, %l4
	sta	%f31,	[%l7 + %l4] 0x81
	fpsub16s	%f28,	%f2,	%f5
	set	0x24, %g3
	stwa	%i4,	[%l7 + %g3] 0x88
	ba,a	%xcc,	loop_88
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x2A, %g4
	sth	%o5,	[%l7 + %g4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l5
loop_88:
	nop
	set	0x24, %i6
	lda	[%l7 + %i6] 0x81,	%f17
	nop
	set	0x48, %i4
	stw	%l2,	[%l7 + %i4]
	nop
	set	0x38, %i5
	ldstub	[%l7 + %i5],	%o0
	nop
	set	0x68, %o0
	stx	%i6,	[%l7 + %o0]
	nop
	set	0x38, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 0
	set	0x44, %i0
	lda	[%l7 + %i0] 0x80,	%f4
	set	0x52, %i7
	stba	%l3,	[%l7 + %i7] 0x80
	set	0x78, %i2
	stda	%i6,	[%l7 + %i2] 0x81
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x80,	%g7
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x24, %l5
	stba	%l4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x2F, %o3
	stb	%o7,	[%l7 + %o3]
	ld	[%l7 + 0x30],	%f2
	set	0x72, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i5
	nop
	set	0x10, %i3
	std	%g0,	[%l7 + %i3]
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	set	0x40, %g5
	stxa	%o3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x08, %g2
	stwa	%o2,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x20, %l2
	ldda	[%l7 + %l2] 0xea,	%i0
	nop
	set	0x60, %l0
	ldsh	[%l7 + %l0],	%o4
	set	0x08, %l6
	stxa	%l1,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x43, %g1
	ldsb	[%l7 + %g1],	%o1
	nop
	set	0x38, %o6
	std	%f22,	[%l7 + %o6]
	ld	[%l7 + 0x54],	%f28
	nop
	set	0x14, %o4
	swap	[%l7 + %o4],	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%i7
	set	0x58, %o5
	stda	%l0,	[%l7 + %o5] 0x88
	fpadd32	%f2,	%f20,	%f10
	set	0x42, %o1
	stha	%g4,	[%l7 + %o1] 0x81
	set	0x0D, %l4
	stba	%i2,	[%l7 + %l4] 0x89
	set	0x28, %l3
	stxa	%g5,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x22, %g4
	ldsb	[%l7 + %g4],	%o6
	set	0x78, %i6
	stwa	%i4,	[%l7 + %i6] 0x89
	set	0x70, %i4
	stxa	%i1,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x4E, %i5
	lduh	[%l7 + %i5],	%g3
	nop
	set	0x7E, %g3
	stb	%o5,	[%l7 + %g3]
	nop
	set	0x25, %g7
	ldsb	[%l7 + %g7],	%l2
	bgu	%xcc,	loop_89
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f30
	set	0x2C, %l1
	stha	%l5,	[%l7 + %l1] 0xeb
	membar	#Sync
loop_89:
	nop
	set	0x42, %i0
	stha	%o0,	[%l7 + %i0] 0xeb
	membar	#Sync
	wr	%l3,	%i6,	%ccr
	or	%l6,	%l4,	%g7
	set	0x16, %i7
	stha	%i5,	[%l7 + %i7] 0x89
	set	0x48, %i2
	lda	[%l7 + %i2] 0x89,	%f26
	nop
	set	0x48, %g6
	stw	%o7,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x7C]
	set	0x28, %o7
	ldxa	[%l7 + %o7] 0x81,	%g1
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x08, %o3
	std	%g6,	[%l7 + %o3]
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%o3
	wr	%i0,	%o4,	%set_softint
	nop
	set	0x0C, %i3
	swap	[%l7 + %i3],	%o2
	set	0x38, %l5
	swapa	[%l7 + %l5] 0x89,	%o1
	nop
	set	0x78, %g5
	prefetch	[%l7 + %g5],	 3
	set	0x09, %o2
	stba	%i3,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x20, %l2
	std	%f30,	[%l7 + %l2]
	set	0x40, %g2
	stda	%g2,	[%l7 + %g2] 0x89
	set	0x68, %l0
	swapa	[%l7 + %l0] 0x81,	%i7
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%l0
	nop
	set	0x78, %g1
	lduh	[%l7 + %g1],	%i2
	wr	%g4,	%g5,	%sys_tick
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd2,	%f16
	fpadd16	%f18,	%f22,	%f16
	nop
	set	0x37, %o6
	ldstub	[%l7 + %o6],	%i4
	fpsub32	%f10,	%f24,	%f30
	nop
	set	0x18, %o4
	stw	%i1,	[%l7 + %o4]
	nop
	set	0x6C, %o1
	lduh	[%l7 + %o1],	%g3
	set	0x13, %o5
	stba	%o5,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%o6
	nop
	set	0x38, %l4
	ldub	[%l7 + %l4],	%l3
	set	0x68, %g4
	swapa	[%l7 + %g4] 0x80,	%o0
	add	%i6,	%l6,	%g7
	nop
	set	0x64, %i6
	swap	[%l7 + %i6],	%l4
	nop
	set	0x72, %i5
	stb	%i5,	[%l7 + %i5]
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f20
	add	%o7,	%g6,	%g1
	nop
	set	0x48, %g7
	stw	%i0,	[%l7 + %g7]
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x88,	%o3
	nop
	set	0x10, %l1
	std	%o2,	[%l7 + %l1]
	nop
	set	0x6C, %g3
	swap	[%l7 + %g3],	%o4
	nop
	set	0x5A, %i7
	ldsh	[%l7 + %i7],	%i3
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x80,	%o1
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	nop
	set	0x10, %i2
	std	%i6,	[%l7 + %i2]
	nop
	set	0x10, %o3
	std	%f24,	[%l7 + %o3]
	ld	[%l7 + 0x0C],	%f5
	fpsub32	%f24,	%f10,	%f8
	nop
	set	0x60, %o7
	std	%f22,	[%l7 + %o7]
	set	0x18, %i1
	swapa	[%l7 + %i1] 0x80,	%g2
	nop
	set	0x18, %i3
	std	%l0,	[%l7 + %i3]
	add	%l0,	%g4,	%g5
	add	%i4,	%i2,	%g3
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf0
	membar	#Sync
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x89,	%i1
	nop
	set	0x10, %l5
	stw	%l2,	[%l7 + %l5]
	set	0x60, %l0
	sta	%f29,	[%l7 + %l0] 0x88
	st	%f9,	[%l7 + 0x58]
	and	%l5,	%o5,	%l3
	nop
	set	0x60, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x68, %g2
	stxa	%o0,	[%l7 + %g2] 0x81
	set	0x68, %l6
	stxa	%o6,	[%l7 + %l6] 0x80
	st	%f18,	[%l7 + 0x50]
	set	0x48, %o4
	stxa	%l6,	[%l7 + %o4] 0x80
	ld	[%l7 + 0x34],	%f14
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	set	0x5C, %o6
	sta	%f8,	[%l7 + %o6] 0x81
	bg,a,pn	%icc,	loop_90
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x30, %o5
	swap	[%l7 + %o5],	%i6
	set	0x5C, %g4
	swapa	[%l7 + %g4] 0x81,	%g7
loop_90:
	nop
	set	0x58, %l4
	stda	%i4,	[%l7 + %l4] 0x81
	nop
	set	0x5A, %i5
	lduh	[%l7 + %i5],	%o7
	set	0x60, %i4
	stda	%g6,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x88,	%g0
	st	%fsr,	[%l7 + 0x34]
	ld	[%l7 + 0x18],	%f25
	bge,a	%xcc,	loop_91
	nop
	set	0x48, %o0
	std	%i0,	[%l7 + %o0]
	nop
	set	0x10, %l1
	stx	%l4,	[%l7 + %l1]
	set	0x78, %g3
	ldxa	[%l7 + %g3] 0x81,	%o2
loop_91:
	nop
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xc0
	and	%o4,	%i3,	%o3
	st	%fsr,	[%l7 + 0x2C]
	set	0x28, %i0
	stxa	%o1,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	nop
	set	0x50, %g6
	stb	%l1,	[%l7 + %g6]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g4
	wr	%g5,	%i4,	%pic
	set	0x28, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	set	0x64, %o3
	lda	[%l7 + %o3] 0x88,	%f16
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f0
	set	0x08, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g3
	nop
	set	0x6C, %g5
	sth	%i2,	[%l7 + %g5]
	nop
	set	0x1C, %i3
	stb	%i1,	[%l7 + %i3]
	nop
	set	0x79, %o2
	ldstub	[%l7 + %o2],	%l2
	set	0x70, %l2
	stda	%l4,	[%l7 + %l2] 0x89
	add	%l3,	%o5,	%o0
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%o6
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x89,	%i6
	nop
	set	0x40, %g1
	ldsh	[%l7 + %g1],	%g7
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%i4
	nop
	set	0x4A, %o1
	stb	%o7,	[%l7 + %o1]
	nop
	set	0x48, %l6
	std	%i6,	[%l7 + %l6]
	set	0x60, %l3
	stda	%g6,	[%l7 + %l3] 0x81
	set	0x68, %o5
	stda	%i0,	[%l7 + %o5] 0x80
	set	0x12, %o6
	stha	%g1,	[%l7 + %o6] 0x89
	nop
	set	0x30, %g4
	std	%l4,	[%l7 + %g4]
	st	%f3,	[%l7 + 0x50]
	set	0x13, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o4
	wr	%i3,	%o3,	%sys_tick
	set	0x7C, %i5
	sta	%f17,	[%l7 + %i5] 0x88
	add	%o2,	%i7,	%o1
	wr	%l1,	%g2,	%clear_softint
	nop
	set	0x10, %i4
	lduw	[%l7 + %i4],	%g5
	set	0x44, %o0
	stwa	%i4,	[%l7 + %o0] 0x88
	nop
	set	0x7C, %g7
	prefetch	[%l7 + %g7],	 4
	fpadd32	%f30,	%f16,	%f12
	nop
	set	0x2A, %g3
	ldsh	[%l7 + %g3],	%g4
	nop
	set	0x55, %i6
	ldstub	[%l7 + %i6],	%g3
	st	%f22,	[%l7 + 0x3C]
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%i2
	set	0x79, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l0
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%l2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf8
	membar	#Sync
	nop
	set	0x18, %i2
	stw	%l5,	[%l7 + %i2]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	set	0x78, %o3
	stxa	%l3,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x31, %o7
	ldsb	[%l7 + %o7],	%o5
	set	0x1C, %i1
	sta	%f29,	[%l7 + %i1] 0x89
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%o0
	nop
	set	0x30, %g5
	stx	%fsr,	[%l7 + %g5]
	fpsub16	%f24,	%f24,	%f18
	nop
	set	0x74, %i3
	swap	[%l7 + %i3],	%i6
	wr	%i5,	%o7,	%pic
	set	0x08, %o2
	sta	%f19,	[%l7 + %o2] 0x81
	fpadd16	%f22,	%f8,	%f28
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%g7
	nop
	set	0x2D, %l0
	ldub	[%l7 + %l0],	%g6
	nop
	set	0x18, %l5
	std	%f4,	[%l7 + %l5]
	set	0x30, %g1
	stha	%i0,	[%l7 + %g1] 0x80
	set	0x38, %g2
	stda	%i6,	[%l7 + %g2] 0x89
	nop
	set	0x70, %o1
	stx	%l4,	[%l7 + %o1]
	set	0x4A, %l6
	stba	%g1,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x58, %o4
	stx	%o4,	[%l7 + %o4]
	nop
	set	0x30, %l3
	std	%o2,	[%l7 + %l3]
	nop
	set	0x78, %o5
	std	%o2,	[%l7 + %o5]
	or	%i7,	%o1,	%i3
	nop
	set	0x08, %o6
	lduw	[%l7 + %o6],	%g2
	set	0x68, %g4
	stwa	%g5,	[%l7 + %g4] 0x89
	ld	[%l7 + 0x10],	%f22
	set	0x78, %l4
	stxa	%i4,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x58, %i5
	stw	%g4,	[%l7 + %i5]
	set	0x13, %o0
	ldstuba	[%l7 + %o0] 0x81,	%g3
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x88,	%l0
	set	0x60, %g7
	ldxa	[%l7 + %g7] 0x89,	%l0
	ld	[%l7 + 0x28],	%f21
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i2,	%i1
	nop
	set	0x52, %i6
	lduh	[%l7 + %i6],	%l5
	set	0x10, %g3
	sta	%f13,	[%l7 + %g3] 0x89
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%l2
	nop
	set	0x38, %l1
	prefetch	[%l7 + %l1],	 3
	bl,a	%xcc,	loop_92
	wr	%l3,	%o5,	%sys_tick
	set	0x52, %g6
	stha	%o0,	[%l7 + %g6] 0xeb
	membar	#Sync
loop_92:
	nop
	set	0x10, %i7
	stda	%i6,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%o7
	set	0x60, %o3
	lda	[%l7 + %o3] 0x88,	%f22
	add	%g7,	%o6,	%g6
	nop
	set	0x38, %o7
	std	%f26,	[%l7 + %o7]
	set	0x4C, %i2
	swapa	[%l7 + %i2] 0x81,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%g1
	fpadd32s	%f20,	%f27,	%f26
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%l4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf1
	membar	#Sync
	nop
	set	0x50, %o2
	ldsh	[%l7 + %o2],	%o3
	set	0x60, %l2
	ldda	[%l7 + %l2] 0xeb,	%o4
	nop
	set	0x2A, %i3
	ldub	[%l7 + %i3],	%i7
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %g1
	stda	%o0,	[%l7 + %g1] 0x80
	nop
	set	0x74, %l5
	stw	%o2,	[%l7 + %l5]
	nop
	set	0x58, %o1
	std	%f14,	[%l7 + %o1]
	nop
	set	0x48, %g2
	ldsh	[%l7 + %g2],	%g2
	ba,a,pt	%icc,	loop_93
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f24
	bn,pt	%icc,	loop_94
	nop
	set	0x68, %l6
	std	%i2,	[%l7 + %l6]
loop_93:
	and	%g5,	%i4,	%g3
	nop
	set	0x60, %o5
	std	%l0,	[%l7 + %o5]
loop_94:
	nop
	set	0x24, %o6
	lduh	[%l7 + %o6],	%g4
	wr	%l0,	%i1,	%sys_tick
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%l5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f0
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xea,	%l2
	set	0x08, %l4
	sta	%f1,	[%l7 + %l4] 0x88
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%f10
	set	0x74, %i5
	stwa	%l3,	[%l7 + %i5] 0x88
	nop
	set	0x7D, %i4
	ldsb	[%l7 + %i4],	%o0
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xda
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x89,	%o4
	set	0x78, %g3
	stxa	%i6,	[%l7 + %g3] 0x88
	fpsub16	%f12,	%f14,	%f6
	set	0x1C, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o7
	nop
	set	0x3C, %i0
	ldstub	[%l7 + %i0],	%g7
	nop
	set	0x58, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x78, %g6
	swap	[%l7 + %g6],	%o6
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g6
	set	0x34, %i2
	swapa	[%l7 + %i2] 0x80,	%l6
	bne	%icc,	loop_95
	nop
	set	0x0C, %o3
	lduh	[%l7 + %o3],	%i5
	nop
	set	0x15, %g5
	ldstub	[%l7 + %g5],	%g1
	set	0x42, %o2
	stba	%l4,	[%l7 + %o2] 0x88
loop_95:
	nop
	set	0x12, %l2
	ldsh	[%l7 + %l2],	%i0
	set	0x68, %i3
	stha	%o3,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x1F, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o4
	set	0x68, %g1
	stba	%i7,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x2C, %i1
	sta	%f8,	[%l7 + %i1] 0x80
	nop
	set	0x37, %o1
	stb	%o2,	[%l7 + %o1]
	nop
	set	0x40, %l5
	std	%g2,	[%l7 + %l5]
	nop
	set	0x51, %o4
	ldstub	[%l7 + %o4],	%i3
	add	%g5,	%o1,	%g3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f0
	set	0x30, %g2
	stxa	%i4,	[%l7 + %g2] 0x80
	nop
	set	0x48, %o5
	std	%f18,	[%l7 + %o5]
	set	0x5E, %l3
	stha	%l1,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x14, %o6
	lda	[%l7 + %o6] 0x88,	%f28
	nop
	set	0x34, %g4
	lduw	[%l7 + %g4],	%l0
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%i1
	ld	[%l7 + 0x10],	%f25
	bge,a	%icc,	loop_96
	nop
	set	0x70, %i5
	std	%f20,	[%l7 + %i5]
	nop
	set	0x78, %o0
	std	%f4,	[%l7 + %o0]
	nop
	set	0x58, %g7
	stx	%g4,	[%l7 + %g7]
loop_96:
	nop
	set	0x68, %i4
	stx	%i2,	[%l7 + %i4]
	wr	%l2,	%l5,	%y
	nop
	set	0x48, %g3
	ldsw	[%l7 + %g3],	%o0
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x81,	%l2
	set	0x50, %i6
	sta	%f27,	[%l7 + %i6] 0x80
	nop
	set	0x4B, %i7
	ldsb	[%l7 + %i7],	%o5
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x7F, %g6
	ldstub	[%l7 + %g6],	%o6
	nop
	set	0x24, %o7
	prefetch	[%l7 + %o7],	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%g6
	set	0x72, %i0
	stha	%i5,	[%l7 + %i0] 0x89
	st	%f10,	[%l7 + 0x7C]
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f4
	set	0x18, %i2
	stxa	%g1,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x78, %g5
	swapa	[%l7 + %g5] 0x88,	%l4
	set	0x68, %o2
	lda	[%l7 + %o2] 0x80,	%f24
	set	0x14, %l2
	stba	%l6,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x70, %l0
	sta	%f12,	[%l7 + %l0] 0x81
	nop
	set	0x10, %i3
	sth	%i0,	[%l7 + %i3]
	ld	[%l7 + 0x48],	%f24
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%i7
	nop
	set	0x18, %g1
	std	%o2,	[%l7 + %g1]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xc0
	nop
	set	0x22, %i1
	lduh	[%l7 + %i1],	%o4
	nop
	set	0x34, %l5
	stw	%g2,	[%l7 + %l5]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%i3
	nop
	set	0x58, %l6
	stx	%g3,	[%l7 + %l6]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xca
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x52, %o5
	ldub	[%l7 + %o5],	%o1
	nop
	set	0x24, %g2
	prefetch	[%l7 + %g2],	 0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xd2,	%f16
	nop
	set	0x2C, %g4
	prefetch	[%l7 + %g4],	 2
	nop
	set	0x3A, %o6
	ldstub	[%l7 + %o6],	%i4
	set	0x78, %l4
	stxa	%l0,	[%l7 + %l4] 0x80
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x81,	%f4
	set	0x32, %g7
	stha	%l1,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	nop
	setx	0xDAB2295357D89EAE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE752FE53C9B54CFA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f12,	%f4
	set	0x68, %i4
	stha	%g4,	[%l7 + %i4] 0xea
	membar	#Sync
	or	%i1,	%l2,	%i2
	ld	[%l7 + 0x78],	%f10
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc2
	nop
	set	0x5C, %g3
	lduw	[%l7 + %g3],	%l5
	set	0x08, %i6
	stwa	%o0,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x5D, %i7
	stb	%o5,	[%l7 + %i7]
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x89,	%l2
	nop
	set	0x58, %o7
	ldstub	[%l7 + %o7],	%o7
	set	0x1C, %g6
	swapa	[%l7 + %g6] 0x89,	%o6
	nop
	set	0x28, %o3
	ldstub	[%l7 + %o3],	%i6
	nop
	set	0x12, %i0
	sth	%g7,	[%l7 + %i0]
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	nop
	set	0x74, %o2
	ldstub	[%l7 + %o2],	%i5
	fpsub16	%f22,	%f24,	%f22
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x68, %i2
	stb	%g1,	[%l7 + %i2]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x88,	 2
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f0
	fpsub32	%f0,	%f14,	%f18
	nop
	set	0x6C, %g1
	ldub	[%l7 + %g1],	%l4
	nop
	set	0x6C, %i1
	swap	[%l7 + %i1],	%i0
	nop
	set	0x0B, %l6
	ldub	[%l7 + %l6],	%i7
	nop
	set	0x70, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x7E, %o5
	stb	%o3,	[%l7 + %o5]
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x0C, %g2
	swap	[%l7 + %g2],	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%g5
	set	0x48, %l5
	lda	[%l7 + %l5] 0x81,	%f20
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%o0
	set	0x60, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i4
	set	0x28, %l4
	sta	%f9,	[%l7 + %l4] 0x81
	and	%g3,	%l0,	%l1
	set	0x28, %o0
	swapa	[%l7 + %o0] 0x80,	%g4
	nop
	set	0x10, %g4
	std	%f26,	[%l7 + %g4]
	nop
	set	0x68, %g7
	std	%f26,	[%l7 + %g7]
	set	0x2C, %i4
	stha	%i1,	[%l7 + %i4] 0xea
	membar	#Sync
	bg	%icc,	loop_97
	nop
	set	0x70, %g3
	stx	%fsr,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x2C]
	ld	[%l7 + 0x5C],	%f2
loop_97:
	st	%fsr,	[%l7 + 0x34]
	set	0x1A, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l2
	st	%f25,	[%l7 + 0x14]
	nop
	set	0x16, %i7
	ldsb	[%l7 + %i7],	%i2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%o5
	set	0x68, %i5
	swapa	[%l7 + %i5] 0x81,	%o0
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f4
	nop
	set	0x61, %o7
	ldsb	[%l7 + %o7],	%o7
	set	0x6C, %o3
	stwa	%l3,	[%l7 + %o3] 0xe3
	membar	#Sync
	or	%i6,	%o6,	%g6
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%g7
	nop
	set	0x5C, %i0
	prefetch	[%l7 + %i0],	 3
	ld	[%l7 + 0x54],	%f18
	set	0x58, %g5
	sta	%f22,	[%l7 + %g5] 0x88
	ld	[%l7 + 0x74],	%f23
	nop
	set	0x5C, %l2
	ldsw	[%l7 + %l2],	%i5
	nop
	set	0x70, %i2
	swap	[%l7 + %i2],	%g1
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%l4
	set	0x54, %o2
	stwa	%i0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x60, %l0
	stxa	%i7,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x64, %o1
	lduh	[%l7 + %o1],	%l6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
	nop
	set	0x28, %i1
	ldx	[%l7 + %i1],	%o4
	nop
	set	0x20, %o4
	ldsh	[%l7 + %o4],	%o2
	fpadd16	%f24,	%f18,	%f0
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x80,	%g2
	nop
	set	0x50, %l6
	ldd	[%l7 + %l6],	%f2
	nop
	set	0x30, %g2
	ldsw	[%l7 + %g2],	%i3
	nop
	set	0x4C, %l3
	ldstub	[%l7 + %l3],	%o3
	nop
	set	0x1E, %o6
	ldstub	[%l7 + %o6],	%g5
	set	0x58, %l5
	stha	%i4,	[%l7 + %l5] 0xe3
	membar	#Sync
	fpsub16s	%f1,	%f12,	%f4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd2,	%f16
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%o1
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%g3
	nop
	set	0x34, %o0
	ldsw	[%l7 + %o0],	%l0
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%l1
	st	%fsr,	[%l7 + 0x44]
	set	0x40, %i6
	stwa	%g4,	[%l7 + %i6] 0x80
	set	0x34, %i7
	stwa	%i1,	[%l7 + %i7] 0xea
	membar	#Sync
	st	%f31,	[%l7 + 0x7C]
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	and	%i2,	%l5,	%l2
	or	%o5,	%o7,	%o0
	nop
	set	0x68, %l1
	std	%f20,	[%l7 + %l1]
	nop
	set	0x64, %i5
	ldsb	[%l7 + %i5],	%i6
	nop
	set	0x28, %o7
	ldsh	[%l7 + %o7],	%l3
	nop
	set	0x40, %o3
	sth	%g6,	[%l7 + %o3]
	set	0x2D, %g6
	ldstuba	[%l7 + %g6] 0x80,	%g7
	set	0x3C, %i0
	stha	%o6,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x80,	%i5
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%g1
	st	%f11,	[%l7 + 0x68]
	set	0x22, %o2
	ldstuba	[%l7 + %o2] 0x80,	%l4
	set	0x58, %i2
	stda	%i6,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x3A, %l0
	stha	%i0,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x58, %i1
	sth	%o4,	[%l7 + %i1]
	nop
	set	0x3F, %g1
	ldub	[%l7 + %g1],	%l6
	nop
	set	0x28, %o4
	ldsw	[%l7 + %o4],	%o2
	nop
	set	0x31, %l6
	ldub	[%l7 + %l6],	%g2
	set	0x14, %g2
	stwa	%i3,	[%l7 + %g2] 0x88
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x7A, %l3
	lduh	[%l7 + %l3],	%g5
	nop
	set	0x60, %o6
	stx	%o3,	[%l7 + %o6]
	nop
	set	0x50, %l4
	stx	%i4,	[%l7 + %l4]
	set	0x6C, %g4
	stwa	%g3,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x48, %l5
	std	%f16,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x2C]
	set	0x48, %o0
	stha	%o1,	[%l7 + %o0] 0x89
	nop
	set	0x26, %i4
	ldub	[%l7 + %i4],	%l1
	fpsub16	%f18,	%f0,	%f4
	and	%g4,	%l0,	%i1
	nop
	set	0x52, %i6
	lduh	[%l7 + %i6],	%l5
	add	%i2,	%l2,	%o5
	wr	%o0,	%o7,	%ccr
	add	%i6,	%g6,	%g7
	add	%o6,	%i5,	%g1
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x70, %i7
	stx	%l4,	[%l7 + %i7]
	set	0x17, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i7
	nop
	set	0x56, %g7
	lduh	[%l7 + %g7],	%i0
	or	%o4,	%l3,	%l6
	nop
	set	0x61, %l1
	ldsb	[%l7 + %l1],	%o2
	bgu	%xcc,	loop_98
	nop
	set	0x0C, %o7
	lduw	[%l7 + %o7],	%i3
	ld	[%l7 + 0x70],	%f25
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
loop_98:
	nop
	set	0x4E, %g6
	stba	%g5,	[%l7 + %g6] 0x80
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%o3
	nop
	set	0x50, %l2
	stx	%g2,	[%l7 + %l2]
	nop
	set	0x4E, %g5
	ldstub	[%l7 + %g5],	%g3
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%o1
	nop
	set	0x44, %i2
	prefetch	[%l7 + %i2],	 0
	and	%l1,	%g4,	%l0
	nop
	set	0x40, %i3
	lduw	[%l7 + %i3],	%i1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%l5
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x13, %o1
	ldub	[%l7 + %o1],	%l2
	ld	[%l7 + 0x64],	%f18
	ld	[%l7 + 0x20],	%f11
	set	0x18, %g1
	sta	%f28,	[%l7 + %g1] 0x89
	ba,a	%icc,	loop_99
	nop
	set	0x38, %o4
	ldx	[%l7 + %o4],	%i2
	nop
	set	0x48, %i1
	ldx	[%l7 + %i1],	%o0
	ld	[%l7 + 0x24],	%f17
loop_99:
	nop
	set	0x50, %g2
	std	%o4,	[%l7 + %g2]
	nop
	set	0x74, %o5
	ldsw	[%l7 + %o5],	%i6
	or	%o7,	%g6,	%o6
	and	%i5,	%g7,	%g1
	nop
	set	0x28, %l6
	sth	%l4,	[%l7 + %l6]
	nop
	set	0x62, %o6
	sth	%i7,	[%l7 + %o6]
	ld	[%l7 + 0x64],	%f5
	set	0x1C, %l3
	stwa	%o4,	[%l7 + %l3] 0x81
	nop
	set	0x78, %g4
	swap	[%l7 + %g4],	%l3
	nop
	set	0x30, %l4
	stx	%i0,	[%l7 + %l4]
	nop
	set	0x70, %l5
	lduw	[%l7 + %l5],	%l6
	nop
	set	0x38, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x6C, %i4
	lduw	[%l7 + %i4],	%o2
	nop
	set	0x67, %i6
	stb	%g5,	[%l7 + %i6]
	set	0x78, %g3
	stha	%i3,	[%l7 + %g3] 0x81
	nop
	set	0x60, %g7
	std	%o2,	[%l7 + %g7]
	nop
	set	0x40, %i7
	std	%f28,	[%l7 + %i7]
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x88,	%g2
	nop
	set	0x64, %i5
	swap	[%l7 + %i5],	%g3
	set	0x20, %g6
	ldda	[%l7 + %g6] 0xe2,	%l0
	nop
	set	0x47, %o7
	stb	%o1,	[%l7 + %o7]
	st	%f14,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x0C]
	set	0x0C, %i0
	swapa	[%l7 + %i0] 0x81,	%g4
	nop
	set	0x10, %o3
	stx	%i1,	[%l7 + %o3]
	or	%l0,	%i4,	%l2
	set	0x68, %l2
	stxa	%i2,	[%l7 + %l2] 0x81
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%l4
	nop
	set	0x62, %i2
	sth	%o0,	[%l7 + %i2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%o5
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	set	0x50, %l0
	stha	%o7,	[%l7 + %l0] 0x89
	st	%f12,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x40]
	set	0x1D, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i5
	set	0x7A, %g1
	stba	%g7,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x58, %o4
	stxa	%g1,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x10, %i3
	swapa	[%l7 + %i3] 0x88,	%o6
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f4
	set	0x70, %o5
	ldda	[%l7 + %o5] 0xea,	%i6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%o4
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x50, %o6
	std	%f22,	[%l7 + %o6]
	set	0x58, %l3
	ldxa	[%l7 + %l3] 0x81,	%l3
	nop
	set	0x10, %i1
	stw	%l6,	[%l7 + %i1]
	set	0x17, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o2
	nop
	set	0x18, %g4
	swap	[%l7 + %g4],	%i0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%g5
	nop
	set	0x70, %l5
	lduw	[%l7 + %l5],	%o3
	nop
	set	0x2C, %i4
	swap	[%l7 + %i4],	%g3
	add	%l1,	%o1,	%g4
	set	0x60, %i6
	stxa	%g2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x18, %g3
	std	%f14,	[%l7 + %g3]
	or	%i1,	%i4,	%l2
	set	0x10, %g7
	stwa	%l0,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x08, %o0
	sth	%l5,	[%l7 + %o0]
	set	0x1E, %i7
	stha	%o0,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd2
	ld	[%l7 + 0x4C],	%f18
	nop
	set	0x78, %i5
	std	%f12,	[%l7 + %i5]
	nop
	set	0x24, %g6
	lduw	[%l7 + %g6],	%i2
	wr	%o5,	%g6,	%sys_tick
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f6
	st	%f0,	[%l7 + 0x34]
	nop
	set	0x7C, %o7
	stw	%i6,	[%l7 + %o7]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	nop
	set	0x4C, %g5
	swap	[%l7 + %g5],	%i5
	set	0x30, %i2
	swapa	[%l7 + %i2] 0x80,	%g7
	wr	%o7,	%o6,	%y
	st	%f8,	[%l7 + 0x30]
	set	0x78, %o3
	lda	[%l7 + %o3] 0x88,	%f16
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1273
!	Type a   	: 33
!	Type cti   	: 27
!	Type x   	: 546
!	Type f   	: 29
!	Type i   	: 92
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
	set	0x5,	%g1
	set	0x3,	%g2
	set	0x2,	%g3
	set	0x9,	%g4
	set	0x8,	%g5
	set	0x4,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x4,	%i1
	set	-0xF,	%i2
	set	-0x6,	%i3
	set	-0x6,	%i4
	set	-0x0,	%i5
	set	-0x5,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x1BA6F815,	%l0
	set	0x5BBF1F3F,	%l1
	set	0x4C7751E4,	%l2
	set	0x0BDB5A77,	%l3
	set	0x266D17CB,	%l4
	set	0x24474822,	%l5
	set	0x6B03D85B,	%l6
	!# Output registers
	set	-0x1194,	%o0
	set	0x101A,	%o1
	set	0x000C,	%o2
	set	-0x0D2F,	%o3
	set	0x1599,	%o4
	set	0x0B82,	%o5
	set	0x1971,	%o6
	set	-0x1000,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	set	0x50, %o2
	ldxa	[%l7 + %o2] 0x81,	%g1
	fpsub16	%f2,	%f12,	%f4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xca
	set	0x58, %g1
	stda	%i6,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x68, %o1
	stw	%o4,	[%l7 + %o1]
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x89,	%l4
	nop
	set	0x40, %g2
	ldsh	[%l7 + %g2],	%l6
	st	%fsr,	[%l7 + 0x30]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x81
	add	%o2,	%i0,	%i3
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x1C, %o6
	stwa	%g5,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x7A, %l3
	ldsh	[%l7 + %l3],	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%l3
	nop
	set	0x28, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x40, %l6
	stx	%o1,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xda,	%f16
	nop
	set	0x78, %i4
	stx	%g4,	[%l7 + %i4]
	nop
	set	0x24, %i6
	ldub	[%l7 + %i6],	%g2
	set	0x3C, %l4
	stwa	%l1,	[%l7 + %l4] 0x89
	nop
	set	0x0C, %g7
	stw	%i1,	[%l7 + %g7]
	set	0x48, %o0
	lda	[%l7 + %o0] 0x80,	%f22
	nop
	set	0x68, %i7
	prefetch	[%l7 + %i7],	 4
	wr	%i4,	%l0,	%ccr
	set	0x28, %g3
	stwa	%l5,	[%l7 + %g3] 0x80
	set	0x68, %i5
	swapa	[%l7 + %i5] 0x81,	%o0
	set	0x18, %g6
	stxa	%i2,	[%l7 + %g6] 0x81
	nop
	set	0x2C, %l1
	prefetch	[%l7 + %l1],	 1
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f16
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f12
	nop
	set	0x40, %i0
	stx	%l2,	[%l7 + %i0]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd0,	%f16
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%o5
	or	%g6,	%i5,	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%o7
	ld	[%l7 + 0x20],	%f1
	nop
	set	0x1C, %o2
	ldub	[%l7 + %o2],	%o6
	nop
	set	0x24, %g5
	stw	%i7,	[%l7 + %g5]
	set	0x60, %g1
	stha	%o4,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f14
	nop
	set	0x78, %o1
	std	%l4,	[%l7 + %o1]
	set	0x40, %o4
	ldxa	[%l7 + %o4] 0x89,	%g1
	nop
	set	0x0E, %i3
	stb	%o2,	[%l7 + %i3]
	set	0x14, %g2
	lda	[%l7 + %g2] 0x81,	%f23
	and	%l6,	%i0,	%g5
	nop
	set	0x38, %o5
	std	%f24,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%o3
	set	0x68, %o6
	ldstuba	[%l7 + %o6] 0x89,	%g3
	nop
	set	0x54, %g4
	ldsb	[%l7 + %g4],	%l3
	st	%fsr,	[%l7 + 0x20]
	set	0x50, %l6
	stxa	%i3,	[%l7 + %l6] 0xe2
	membar	#Sync
	and	%g4,	%g2,	%o1
	nop
	set	0x78, %l5
	stw	%i1,	[%l7 + %l5]
	and	%l1,	%l0,	%i4
	set	0x20, %i4
	stwa	%l5,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x81,	%l2
	set	0x18, %l4
	stxa	%o5,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x89,	%g6
	st	%f19,	[%l7 + 0x3C]
	nop
	set	0x38, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf1
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%g7
	nop
	set	0x78, %g3
	std	%f16,	[%l7 + %g3]
	set	0x0C, %l1
	lda	[%l7 + %l1] 0x88,	%f17
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xd2
	nop
	set	0x28, %o7
	lduh	[%l7 + %o7],	%i6
	nop
	set	0x58, %i0
	ldx	[%l7 + %i0],	%o7
	set	0x14, %i2
	lda	[%l7 + %i2] 0x81,	%f30
	set	0x72, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o6
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%i2
	nop
	set	0x6B, %g5
	ldub	[%l7 + %g5],	%o4
	nop
	set	0x63, %o2
	ldstub	[%l7 + %o2],	%l4
	nop
	set	0x1F, %l0
	ldub	[%l7 + %l0],	%i7
	fpadd16	%f18,	%f0,	%f16
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xe2,	%o2
	set	0x10, %o4
	stxa	%g1,	[%l7 + %o4] 0x80
	nop
	set	0x64, %g1
	swap	[%l7 + %g1],	%l6
	set	0x6E, %g2
	stha	%i0,	[%l7 + %g2] 0x89
	set	0x08, %o5
	stda	%o2,	[%l7 + %o5] 0x88
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x78, %l3
	lda	[%l7 + %l3] 0x88,	%f8
	nop
	set	0x32, %o6
	sth	%g3,	[%l7 + %o6]
	set	0x34, %g4
	sta	%f20,	[%l7 + %g4] 0x81
	nop
	set	0x08, %l6
	stx	%g5,	[%l7 + %l6]
	nop
	set	0x5C, %i1
	lduw	[%l7 + %i1],	%l3
	set	0x46, %i4
	stha	%i3,	[%l7 + %i4] 0xea
	membar	#Sync
	set	0x58, %i6
	stwa	%g2,	[%l7 + %i6] 0xe2
	membar	#Sync
	st	%f6,	[%l7 + 0x60]
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x88,	%g4
	or	%o1,	%l1,	%l0
	nop
	set	0x54, %g7
	ldsw	[%l7 + %g7],	%i4
	nop
	set	0x4B, %o0
	ldsb	[%l7 + %o0],	%l5
	nop
	set	0x10, %i7
	stw	%i1,	[%l7 + %i7]
	wr	%l2,	%o5,	%ccr
	set	0x20, %i5
	stxa	%g6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x6E, %g3
	lduh	[%l7 + %g3],	%o0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f16
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%g6
	nop
	set	0x58, %o7
	std	%i4,	[%l7 + %o7]
	set	0x60, %i0
	stda	%o6,	[%l7 + %i0] 0x89
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x81
	nop
	set	0x78, %l2
	stx	%i6,	[%l7 + %l2]
	set	0x2C, %i2
	lda	[%l7 + %i2] 0x80,	%f11
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%f20
	nop
	set	0x62, %o2
	ldsb	[%l7 + %o2],	%i2
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	fpadd32	%f0,	%f20,	%f30
	nop
	set	0x70, %o1
	std	%f0,	[%l7 + %o1]
	st	%f11,	[%l7 + 0x68]
	set	0x68, %o4
	ldxa	[%l7 + %o4] 0x89,	%o4
	nop
	set	0x58, %o3
	stx	%o6,	[%l7 + %o3]
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f20
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o2
	nop
	set	0x48, %o5
	swap	[%l7 + %o5],	%i7
	nop
	set	0x6E, %g2
	ldsh	[%l7 + %g2],	%g1
	set	0x38, %l3
	sta	%f26,	[%l7 + %l3] 0x80
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%i6
	add	%o3,	%g3,	%g5
	set	0x1C, %o6
	stwa	%i0,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x31, %l6
	stba	%l3,	[%l7 + %l6] 0x81
	set	0x1C, %g4
	sta	%f20,	[%l7 + %g4] 0x80
	ld	[%l7 + 0x20],	%f4
	set	0x21, %i4
	ldstuba	[%l7 + %i4] 0x81,	%i3
	and	%g2,	%o1,	%g4
	fpadd32s	%f13,	%f19,	%f23
	set	0x64, %i6
	swapa	[%l7 + %i6] 0x80,	%l0
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x81,	 3
	set	0x38, %g7
	lda	[%l7 + %g7] 0x89,	%f31
	add	%l5,	%l1,	%l2
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%i1
	set	0x74, %o0
	sta	%f15,	[%l7 + %o0] 0x80
	set	0x5D, %i5
	stba	%o5,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	st	%f20,	[%l7 + 0x10]
	or	%i5,	%o7,	%i6
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f6
	nop
	set	0x16, %g6
	sth	%g6,	[%l7 + %g6]
	set	0x2E, %i0
	stha	%i2,	[%l7 + %i0] 0x81
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x29, %o7
	ldstuba	[%l7 + %o7] 0x88,	%o6
	nop
	set	0x20, %i2
	ldd	[%l7 + %i2],	%f30
	ld	[%l7 + 0x44],	%f14
	set	0x44, %l2
	sta	%f21,	[%l7 + %l2] 0x88
	nop
	set	0x38, %g5
	ldx	[%l7 + %g5],	%l4
	ld	[%l7 + 0x7C],	%f16
	nop
	set	0x18, %o2
	std	%f26,	[%l7 + %o2]
	nop
	set	0x78, %l0
	stw	%o4,	[%l7 + %l0]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf0
	membar	#Sync
	and	%o2,	%i7,	%g1
	nop
	set	0x2C, %o3
	ldsh	[%l7 + %o3],	%o3
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f12
	nop
	set	0x6A, %o1
	sth	%g3,	[%l7 + %o1]
	nop
	set	0x48, %g2
	ldsw	[%l7 + %g2],	%l6
	set	0x0A, %l3
	stha	%i0,	[%l7 + %l3] 0x89
	or	%l3,	%g5,	%g2
	ld	[%l7 + 0x50],	%f4
	set	0x50, %o5
	stha	%i3,	[%l7 + %o5] 0x81
	set	0x34, %i3
	stwa	%o1,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x10, %o6
	ldxa	[%l7 + %o6] 0x80,	%l0
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%g4
	set	0x38, %i4
	sta	%f8,	[%l7 + %i4] 0x81
	set	0x08, %l6
	ldxa	[%l7 + %l6] 0x80,	%i4
	nop
	set	0x18, %i1
	stx	%l5,	[%l7 + %i1]
	set	0x73, %g7
	stba	%l2,	[%l7 + %g7] 0x81
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%o5
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0
	nop
	set	0x73, %o0
	stb	%o0,	[%l7 + %o0]
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x80,	%g7
	set	0x18, %i7
	stxa	%i5,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x78, %l5
	stw	%i6,	[%l7 + %l5]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f16
	nop
	set	0x18, %g3
	stx	%o7,	[%l7 + %g3]
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x89,	%g6
	set	0x46, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i2
	nop
	set	0x40, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x2C, %o7
	lduw	[%l7 + %o7],	%l4
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x80,	%o6
	set	0x48, %g5
	stda	%o4,	[%l7 + %g5] 0x81
	nop
	set	0x64, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x7C, %l0
	prefetch	[%l7 + %l0],	 1
	nop
	set	0x23, %o2
	ldstub	[%l7 + %o2],	%o2
	nop
	set	0x28, %o4
	lduw	[%l7 + %o4],	%g1
	nop
	set	0x4B, %g1
	ldub	[%l7 + %g1],	%o3
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x08, %g2
	sta	%f14,	[%l7 + %g2] 0x80
	nop
	set	0x08, %o1
	ldsh	[%l7 + %o1],	%i7
	set	0x08, %o5
	stha	%g3,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x39, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l6
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x89
	nop
	set	0x28, %g4
	std	%f14,	[%l7 + %g4]
	nop
	set	0x3A, %i4
	ldub	[%l7 + %i4],	%l3
	ble	%xcc,	loop_100
	nop
	set	0x28, %o6
	std	%g4,	[%l7 + %o6]
	nop
	set	0x78, %l6
	ldsw	[%l7 + %l6],	%i0
	set	0x2E, %g7
	stha	%g2,	[%l7 + %g7] 0x88
loop_100:
	nop
	set	0x50, %i1
	prefetcha	[%l7 + %i1] 0x81,	 2
	fpadd16	%f8,	%f30,	%f12
	nop
	set	0x10, %i6
	ldsw	[%l7 + %i6],	%l0
	nop
	set	0x36, %o0
	ldsh	[%l7 + %o0],	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g4
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f2
	or	%l5,	%l1,	%l2
	nop
	set	0x48, %i5
	swap	[%l7 + %i5],	%o5
	set	0x58, %l5
	stwa	%o0,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x48, %l4
	ldsb	[%l7 + %l4],	%g7
	ba,a,pn	%xcc,	loop_101
	nop
	set	0x60, %i0
	ldsb	[%l7 + %i0],	%i5
	fpadd32	%f26,	%f24,	%f8
	set	0x44, %g6
	swapa	[%l7 + %g6] 0x80,	%i1
loop_101:
	and	%i6,	%g6,	%o7
	nop
	set	0x13, %l1
	ldsb	[%l7 + %l1],	%i2
	set	0x3F, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l4
	set	0x10, %g3
	ldxa	[%l7 + %g3] 0x81,	%o4
	nop
	set	0x50, %l2
	std	%o6,	[%l7 + %l2]
	nop
	set	0x50, %i2
	sth	%g1,	[%l7 + %i2]
	nop
	set	0x74, %g5
	lduw	[%l7 + %g5],	%o2
	set	0x2C, %o2
	stwa	%i7,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x28, %l0
	stda	%o2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x28, %o4
	lduh	[%l7 + %o4],	%g3
	set	0x18, %o3
	stwa	%l6,	[%l7 + %o3] 0xea
	membar	#Sync
	st	%f9,	[%l7 + 0x60]
	nop
	set	0x23, %g1
	ldsb	[%l7 + %g1],	%g5
	set	0x5B, %o1
	ldstuba	[%l7 + %o1] 0x81,	%l3
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%g2
	nop
	set	0x2C, %g2
	ldsb	[%l7 + %g2],	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i0,	%o1
	set	0x68, %i3
	stda	%i4,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x17, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g4
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%l0
	add	%l5,	%l2,	%o5
	set	0x7C, %i4
	swapa	[%l7 + %i4] 0x80,	%l1
	nop
	set	0x58, %l6
	prefetch	[%l7 + %l6],	 3
	set	0x69, %o6
	stba	%g7,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x08, %g7
	lduw	[%l7 + %g7],	%o0
	nop
	set	0x18, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x46, %i6
	stb	%i1,	[%l7 + %i6]
	set	0x38, %i7
	sta	%f27,	[%l7 + %i7] 0x81
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x18, %i5
	stw	%i5,	[%l7 + %i5]
	nop
	set	0x18, %o0
	ldub	[%l7 + %o0],	%i6
	and	%g6,	%o7,	%i2
	nop
	set	0x18, %l5
	std	%f16,	[%l7 + %l5]
	nop
	set	0x3F, %i0
	stb	%o4,	[%l7 + %i0]
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xeb,	%o6
	nop
	set	0x20, %l1
	std	%l4,	[%l7 + %l1]
	set	0x60, %g6
	stda	%g0,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%o2
	nop
	set	0x40, %o7
	ldd	[%l7 + %o7],	%o2
	nop
	set	0x58, %i2
	ldx	[%l7 + %i2],	%g3
	nop
	set	0x6F, %g5
	ldstub	[%l7 + %g5],	%i7
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	set	0x10, %l0
	stxa	%l3,	[%l7 + %l0] 0x89
	set	0x20, %o2
	ldda	[%l7 + %o2] 0xeb,	%i6
	nop
	set	0x28, %o3
	lduh	[%l7 + %o3],	%i3
	nop
	set	0x50, %o4
	std	%f0,	[%l7 + %o4]
	st	%f6,	[%l7 + 0x08]
	st	%f8,	[%l7 + 0x58]
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x18, %g1
	stw	%g2,	[%l7 + %g1]
	set	0x44, %o5
	lda	[%l7 + %o5] 0x81,	%f14
	set	0x78, %g2
	stda	%i0,	[%l7 + %g2] 0x88
	st	%f9,	[%l7 + 0x7C]
	set	0x73, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o1
	and	%i4,	%g4,	%l5
	nop
	set	0x0C, %i3
	sth	%l0,	[%l7 + %i3]
	nop
	set	0x1D, %g4
	stb	%l2,	[%l7 + %g4]
	nop
	set	0x42, %l6
	lduh	[%l7 + %l6],	%o5
	nop
	set	0x70, %i4
	swap	[%l7 + %i4],	%g7
	nop
	set	0x38, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x54, %i1
	swap	[%l7 + %i1],	%l1
	nop
	set	0x4E, %o6
	ldub	[%l7 + %o6],	%o0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x4F, %i6
	ldsb	[%l7 + %i6],	%i1
	or	%i5,	%i6,	%g6
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	set	0x2A, %i7
	sth	%o4,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%l4
	set	0x72, %o0
	stha	%g1,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%o2
	nop
	set	0x60, %l4
	std	%o2,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	nop
	set	0x63, %g6
	ldstub	[%l7 + %g6],	%g3
	nop
	set	0x54, %l5
	ldsb	[%l7 + %l5],	%i7
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%f18
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%l3
	set	0x38, %g3
	stda	%o6,	[%l7 + %g3] 0x80
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x80
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%i3
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%g2
	nop
	set	0x58, %l2
	stx	%i0,	[%l7 + %l2]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f16
	st	%fsr,	[%l7 + 0x38]
	set	0x64, %o2
	stwa	%o1,	[%l7 + %o2] 0x80
	set	0x4C, %o4
	stha	%i4,	[%l7 + %o4] 0x81
	bn,a,pn	%xcc,	loop_102
	nop
	set	0x2A, %o3
	lduh	[%l7 + %o3],	%l5
	nop
	set	0x17, %o1
	ldstub	[%l7 + %o1],	%g4
	set	0x70, %g1
	swapa	[%l7 + %g1] 0x88,	%l0
loop_102:
	nop
	set	0x08, %g2
	std	%l2,	[%l7 + %g2]
	set	0x50, %l3
	stwa	%o5,	[%l7 + %l3] 0x89
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%l0
	nop
	set	0x0C, %i3
	ldsw	[%l7 + %i3],	%g7
	nop
	set	0x48, %l6
	stw	%i1,	[%l7 + %l6]
	nop
	set	0x76, %i4
	lduh	[%l7 + %i4],	%o0
	or	%i5,	%g6,	%i6
	set	0x6C, %g4
	stha	%o4,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x34, %g7
	ldsb	[%l7 + %g7],	%o7
	add	%l4,	%i2,	%o2
	nop
	set	0x48, %o6
	swap	[%l7 + %o6],	%g1
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x80
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%o3
	nop
	set	0x59, %i5
	ldsb	[%l7 + %i5],	%g3
	nop
	set	0x11, %o0
	ldsb	[%l7 + %o0],	%i7
	nop
	set	0x08, %i0
	lduw	[%l7 + %i0],	%g5
	set	0x6C, %l4
	sta	%f26,	[%l7 + %l4] 0x88
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x80,	%o6
	nop
	set	0x34, %g6
	stw	%l6,	[%l7 + %g6]
	nop
	set	0x14, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x7E, %l5
	ldub	[%l7 + %l5],	%i3
	nop
	set	0x47, %g3
	ldub	[%l7 + %g3],	%l3
	nop
	set	0x5C, %o7
	swap	[%l7 + %o7],	%i0
	set	0x50, %i2
	lda	[%l7 + %i2] 0x81,	%f28
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xea,	%o0
	set	0x28, %l2
	stxa	%g2,	[%l7 + %l2] 0x88
	add	%i4,	%l5,	%g4
	set	0x50, %o2
	stxa	%l0,	[%l7 + %o2] 0xe3
	membar	#Sync
	fpsub32	%f0,	%f8,	%f12
	nop
	set	0x1E, %l0
	sth	%l2,	[%l7 + %l0]
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x81,	%o5
	nop
	set	0x10, %o4
	ldd	[%l7 + %o4],	%f0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%i1
	nop
	set	0x48, %o1
	lduw	[%l7 + %o1],	%l1
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x80,	 0
	set	0x52, %g1
	stba	%o0,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x79, %o5
	stb	%i6,	[%l7 + %o5]
	nop
	set	0x34, %i3
	stb	%g6,	[%l7 + %i3]
	nop
	set	0x0E, %l3
	ldsh	[%l7 + %l3],	%o7
	nop
	set	0x35, %l6
	stb	%o4,	[%l7 + %l6]
	set	0x0C, %i4
	lda	[%l7 + %i4] 0x88,	%f10
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l4
	add	%o2,	%g1,	%g3
	bne,a,pn	%xcc,	loop_103
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%i7
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%g5
	set	0x10, %o6
	stxa	%o3,	[%l7 + %o6] 0xeb
	membar	#Sync
loop_103:
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f16
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x80,	 2
	nop
	set	0x7C, %i5
	lduw	[%l7 + %i5],	%l6
	nop
	set	0x4A, %o0
	ldsb	[%l7 + %o0],	%l3
	ld	[%l7 + 0x20],	%f24
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%i0
	set	0x20, %i7
	stda	%o0,	[%l7 + %i7] 0xe3
	membar	#Sync
	set	0x10, %g6
	prefetcha	[%l7 + %g6] 0x81,	 2
	nop
	set	0x53, %i0
	ldsb	[%l7 + %i0],	%i4
	nop
	set	0x2C, %l5
	stb	%i3,	[%l7 + %l5]
	st	%f8,	[%l7 + 0x30]
	set	0x70, %g3
	stha	%g4,	[%l7 + %g3] 0x88
	bge,pn	%icc,	loop_104
	nop
	set	0x68, %o7
	std	%l0,	[%l7 + %o7]
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f30
	nop
	set	0x60, %g5
	swap	[%l7 + %g5],	%l5
loop_104:
	nop
	set	0x64, %l2
	stb	%o5,	[%l7 + %l2]
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%g7
	and	%i1,	%l1,	%l2
	nop
	set	0x2A, %l0
	ldsb	[%l7 + %l0],	%i5
	set	0x24, %o3
	sta	%f24,	[%l7 + %o3] 0x81
	nop
	set	0x68, %o4
	sth	%o0,	[%l7 + %o4]
	nop
	set	0x08, %o2
	std	%i6,	[%l7 + %o2]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f0
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%o7
	nop
	set	0x0A, %o5
	sth	%g6,	[%l7 + %o5]
	nop
	set	0x58, %g1
	ldsb	[%l7 + %g1],	%o4
	set	0x40, %l3
	stda	%l4,	[%l7 + %l3] 0x81
	set	0x48, %l6
	stxa	%i2,	[%l7 + %l6] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x10]
	wr	%o2,	%g1,	%pic
	ld	[%l7 + 0x5C],	%f21
	set	0x7C, %i4
	swapa	[%l7 + %i4] 0x88,	%i7
	nop
	set	0x4C, %i3
	lduw	[%l7 + %i3],	%g5
	fpadd16	%f28,	%f28,	%f18
	nop
	set	0x64, %g7
	lduw	[%l7 + %g7],	%o3
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xea,	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l3
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x88,	 2
	nop
	set	0x68, %i6
	std	%f30,	[%l7 + %i6]
	nop
	set	0x4E, %i5
	ldsh	[%l7 + %i5],	%o1
	nop
	set	0x5C, %i1
	stw	%g2,	[%l7 + %i1]
	wr	%i0,	%i3,	%softint
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%i4
	nop
	set	0x08, %o0
	stx	%fsr,	[%l7 + %o0]
	set	0x58, %l4
	swapa	[%l7 + %l4] 0x89,	%l0
	set	0x1C, %g6
	stwa	%o5,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f26
	nop
	set	0x1A, %l5
	ldub	[%l7 + %l5],	%g7
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%f0
	nop
	set	0x4C, %o7
	ldsw	[%l7 + %o7],	%l5
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%i1
	set	0x28, %i2
	stxa	%l2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x5C, %l2
	lduw	[%l7 + %l2],	%l1
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x81,	%i5
	nop
	set	0x35, %l1
	ldsb	[%l7 + %l1],	%i6
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%o7
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%o0
	nop
	set	0x18, %o4
	std	%o4,	[%l7 + %o4]
	nop
	set	0x0D, %g2
	stb	%l4,	[%l7 + %g2]
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x89,	 2
	ld	[%l7 + 0x28],	%f2
	set	0x60, %o1
	ldxa	[%l7 + %o1] 0x88,	%o2
	fpadd16s	%f9,	%f28,	%f12
	add	%i2,	%i7,	%g1
	nop
	set	0x30, %g1
	stx	%fsr,	[%l7 + %g1]
	ld	[%l7 + 0x30],	%f29
	set	0x38, %o5
	stha	%g5,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x58, %l3
	ldsw	[%l7 + %l3],	%o3
	add	%g3,	%l3,	%o6
	nop
	set	0x29, %i4
	ldstub	[%l7 + %i4],	%l6
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xda
	ld	[%l7 + 0x4C],	%f29
	st	%f7,	[%l7 + 0x48]
	nop
	nop
	setx	0x3A46EC10,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x8CFEDE1F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f16,	%f6
	wr	%g2,	%i0,	%clear_softint
	nop
	set	0x34, %g7
	sth	%o1,	[%l7 + %g7]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	nop
	set	0x48, %o6
	std	%f18,	[%l7 + %o6]
	wr	%i3,	%i4,	%pic
	set	0x74, %g4
	swapa	[%l7 + %g4] 0x80,	%l0
	add	%o5,	%g4,	%g7
	and	%l5,	%i1,	%l1
	set	0x50, %i5
	stda	%i4,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x20, %i1
	std	%i6,	[%l7 + %i1]
	set	0x10, %o0
	prefetcha	[%l7 + %o0] 0x89,	 3
	nop
	set	0x24, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x22, %i6
	lduh	[%l7 + %i6],	%o7
	nop
	nop
	setx	0xC846922F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x2AE3365B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f25,	%f17
	be	%icc,	loop_105
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%o4
	nop
	set	0x58, %g6
	stx	%o0,	[%l7 + %g6]
	st	%f25,	[%l7 + 0x34]
loop_105:
	nop
	set	0x55, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g6
	set	0x50, %o7
	lda	[%l7 + %o7] 0x81,	%f9
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x37, %i2
	ldstub	[%l7 + %i2],	%i2
	st	%f19,	[%l7 + 0x70]
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%l4
	nop
	set	0x1C, %g5
	ldsw	[%l7 + %g5],	%i7
	or	%g1,	%o3,	%g3
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xeb,	%g4
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f12
	set	0x62, %l1
	stba	%o6,	[%l7 + %l1] 0x89
	wr	%l3,	%l6,	%pic
	nop
	set	0x14, %o4
	lduh	[%l7 + %o4],	%i0
	nop
	set	0x70, %o3
	swap	[%l7 + %o3],	%g2
	fpsub32	%f18,	%f28,	%f0
	and	%i3,	%o1,	%i4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xea,	%l0
	st	%fsr,	[%l7 + 0x54]
	set	0x3C, %o1
	swapa	[%l7 + %o1] 0x80,	%g4
	set	0x2F, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o5
	nop
	set	0x4A, %g1
	sth	%g7,	[%l7 + %g1]
	nop
	set	0x60, %o5
	std	%f18,	[%l7 + %o5]
	and	%l5,	%i1,	%i5
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0
	set	0x77, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i6
	nop
	set	0x6C, %g7
	ldsb	[%l7 + %g7],	%l2
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x81,	%o0
	nop
	set	0x40, %g4
	std	%o4,	[%l7 + %g4]
	set	0x48, %i5
	ldxa	[%l7 + %i5] 0x80,	%o2
	nop
	set	0x68, %i1
	stx	%i2,	[%l7 + %i1]
	nop
	set	0x28, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x18, %l4
	std	%l4,	[%l7 + %l4]
	nop
	set	0x29, %o0
	ldstub	[%l7 + %o0],	%i7
	set	0x74, %i7
	lda	[%l7 + %i7] 0x89,	%f17
	st	%f5,	[%l7 + 0x78]
	nop
	set	0x48, %i6
	stw	%g6,	[%l7 + %i6]
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x78, %g3
	std	%g0,	[%l7 + %g3]
	nop
	set	0x78, %i0
	std	%g2,	[%l7 + %i0]
	nop
	set	0x10, %i2
	std	%g4,	[%l7 + %i2]
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%o6
	nop
	set	0x5B, %g5
	ldub	[%l7 + %g5],	%l3
	nop
	set	0x6A, %l5
	ldsh	[%l7 + %l5],	%l6
	nop
	set	0x36, %l0
	lduh	[%l7 + %l0],	%o3
	set	0x28, %l2
	stda	%g2,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x78],	%f14
	ld	[%l7 + 0x34],	%f15
	nop
	set	0x58, %l1
	std	%i2,	[%l7 + %l1]
	and	%o1,	%i0,	%l0
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x80,	%g4
	nop
	set	0x08, %o3
	ldstub	[%l7 + %o3],	%i4
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f8
	nop
	set	0x20, %g2
	swap	[%l7 + %g2],	%g7
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%o4
	set	0x34, %o5
	sta	%f30,	[%l7 + %o5] 0x80
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%l5
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f12
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x88,	%i1
	set	0x08, %l3
	stda	%l0,	[%l7 + %l3] 0x89
	nop
	set	0x78, %l6
	std	%i4,	[%l7 + %l6]
	nop
	set	0x74, %g4
	ldub	[%l7 + %g4],	%l2
	nop
	set	0x50, %i3
	std	%f20,	[%l7 + %i3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%o6
	nop
	set	0x40, %o6
	lduh	[%l7 + %o6],	%i6
	nop
	set	0x4D, %l4
	ldub	[%l7 + %l4],	%o0
	nop
	set	0x34, %o0
	ldsh	[%l7 + %o0],	%o4
	nop
	set	0x30, %i7
	lduw	[%l7 + %i7],	%o2
	wr	%i2,	%l4,	%y
	add	%i7,	%g6,	%g3
	nop
	set	0x08, %i5
	std	%f8,	[%l7 + %i5]
	set	0x2C, %g6
	sta	%f3,	[%l7 + %g6] 0x89
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f0
	nop
	set	0x0C, %g3
	stw	%g5,	[%l7 + %g3]
	set	0x58, %i0
	swapa	[%l7 + %i0] 0x88,	%g1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%l6
	set	0x18, %i2
	lda	[%l7 + %i2] 0x81,	%f1
	set	0x60, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l3
	add	%o3,	%g2,	%o1
	set	0x1A, %o7
	stha	%i3,	[%l7 + %o7] 0xeb
	membar	#Sync
	st	%f26,	[%l7 + 0x70]
	nop
	set	0x67, %l0
	stb	%l0,	[%l7 + %l0]
	set	0x20, %l5
	stwa	%g4,	[%l7 + %l5] 0x89
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x81,	%i4
	st	%f3,	[%l7 + 0x4C]
	nop
	set	0x62, %l2
	ldsh	[%l7 + %l2],	%g7
	and	%o5,	%l5,	%i0
	bl	%xcc,	loop_106
	nop
	set	0x48, %o3
	std	%f24,	[%l7 + %o3]
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%i0
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f8
loop_106:
	nop
	set	0x28, %o2
	std	%f16,	[%l7 + %o2]
	set	0x30, %o5
	stba	%i5,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x89,	%l2
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x80,	%o7
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x3E, %g7
	ldstub	[%l7 + %g7],	%o4
	nop
	set	0x58, %l3
	ldsw	[%l7 + %l3],	%i6
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x44, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o2
	nop
	set	0x78, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x70, %g4
	swap	[%l7 + %g4],	%l4
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x80,	%i2
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x42, %o0
	stba	%g6,	[%l7 + %o0] 0x89
	nop
	set	0x54, %i1
	swap	[%l7 + %i1],	%g5
	and	%g3,	%g1,	%o6
	nop
	set	0x40, %i5
	swap	[%l7 + %i5],	%l3
	set	0x66, %i7
	stha	%l6,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x6D, %g6
	ldstub	[%l7 + %g6],	%g2
	set	0x67, %g3
	stba	%o1,	[%l7 + %g3] 0x81
	add	%o3,	%i3,	%l0
	set	0x68, %i0
	sta	%f1,	[%l7 + %i0] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%i4
	st	%fsr,	[%l7 + 0x10]
	and	%g7,	%l5,	%i0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%i5
	or	%i1,	%l2,	%l1
	nop
	set	0x20, %i6
	std	%o0,	[%l7 + %i6]
	set	0x54, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%o2
	nop
	set	0x5C, %g5
	ldub	[%l7 + %g5],	%i6
	nop
	set	0x0C, %l0
	swap	[%l7 + %l0],	%i2
	add	%l4,	%i7,	%g6
	set	0x28, %o7
	swapa	[%l7 + %o7] 0x80,	%g5
	fpsub32s	%f21,	%f30,	%f4
	set	0x5C, %l5
	stwa	%g1,	[%l7 + %l5] 0x89
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%o6
	set	0x70, %l1
	stxa	%l3,	[%l7 + %l1] 0x81
	nop
	set	0x22, %o4
	ldstub	[%l7 + %o4],	%l6
	nop
	set	0x30, %o1
	ldx	[%l7 + %o1],	%g3
	set	0x7F, %o2
	stba	%o1,	[%l7 + %o2] 0x80
	nop
	set	0x10, %o5
	stx	%g2,	[%l7 + %o5]
	wr	%i3,	%l0,	%pic
	set	0x78, %g1
	ldxa	[%l7 + %g1] 0x81,	%o3
	set	0x50, %o3
	stxa	%i4,	[%l7 + %o3] 0xe3
	membar	#Sync
	add	%g7,	%g4,	%l5
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x61, %g2
	stb	%o5,	[%l7 + %g2]
	nop
	set	0x66, %g7
	ldub	[%l7 + %g7],	%i0
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x89,	 1
	nop
	set	0x18, %i4
	ldsb	[%l7 + %i4],	%i5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f0
	set	0x78, %l3
	stwa	%l2,	[%l7 + %l3] 0x80
	nop
	set	0x30, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x70, %g4
	ldx	[%l7 + %g4],	%o0
	ba,a	%icc,	loop_107
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%l0
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x80,	%o6
loop_107:
	st	%f24,	[%l7 + 0x6C]
	set	0x18, %i1
	swapa	[%l7 + %i1] 0x88,	%o2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i2
	fpadd16	%f10,	%f0,	%f18
	nop
	set	0x16, %i5
	sth	%l4,	[%l7 + %i5]
	nop
	set	0x38, %g6
	stx	%i6,	[%l7 + %g6]
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f0
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%g4
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%g1
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x81,	 2
	set	0x70, %l0
	sta	%f18,	[%l7 + %l0] 0x89
	nop
	set	0x72, %o7
	ldsh	[%l7 + %o7],	%o6
	nop
	set	0x54, %g3
	ldsw	[%l7 + %g3],	%l3
	nop
	set	0x5D, %l2
	ldub	[%l7 + %l2],	%l6
	nop
	set	0x50, %l5
	std	%f12,	[%l7 + %l5]
	nop
	set	0x6E, %o4
	sth	%g3,	[%l7 + %o4]
	nop
	set	0x31, %l1
	stb	%g2,	[%l7 + %l1]
	nop
	set	0x26, %o1
	ldsh	[%l7 + %o1],	%o1
	fpadd32s	%f25,	%f11,	%f9
	nop
	set	0x2C, %o2
	swap	[%l7 + %o2],	%l0
	fpadd16s	%f27,	%f14,	%f2
	set	0x74, %o5
	swapa	[%l7 + %o5] 0x88,	%i3
	nop
	set	0x7D, %o3
	ldsb	[%l7 + %o3],	%i4
	set	0x60, %g2
	stxa	%g7,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x64, %g7
	sta	%f16,	[%l7 + %g7] 0x89
	or	%g4,	%o3,	%o5
	nop
	set	0x10, %g1
	std	%l4,	[%l7 + %g1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x89,	%i0,	%i1
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f16
	add	%l2,	%o0,	%l1
	nop
	set	0x2A, %i3
	ldub	[%l7 + %i3],	%o7
	nop
	set	0x12, %l3
	sth	%i5,	[%l7 + %l3]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xc2
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f18
	or	%o4,	%o2,	%l4
	bge,pn	%xcc,	loop_108
	nop
	set	0x18, %o6
	swap	[%l7 + %o6],	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%i7
loop_108:
	nop
	set	0x50, %o0
	prefetcha	[%l7 + %o0] 0x88,	 4
	ld	[%l7 + 0x10],	%f14
	set	0x75, %l4
	ldstuba	[%l7 + %l4] 0x81,	%g6
	set	0x7F, %i5
	stba	%o6,	[%l7 + %i5] 0x80
	nop
	set	0x48, %g6
	std	%l2,	[%l7 + %g6]
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f2
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x89,	%l6
	bn,a,pn	%xcc,	loop_109
	add	%g3,	%g1,	%o1
	add	%g2,	%i3,	%i4
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%l0
loop_109:
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%o3
	nop
	set	0x27, %i2
	ldub	[%l7 + %i2],	%g4
	nop
	set	0x20, %g5
	sth	%o5,	[%l7 + %g5]
	set	0x3C, %l0
	swapa	[%l7 + %l0] 0x88,	%i0
	set	0x54, %o7
	stwa	%l5,	[%l7 + %o7] 0x80
	set	0x0C, %i6
	sta	%f11,	[%l7 + %i6] 0x88
	set	0x40, %g3
	prefetcha	[%l7 + %g3] 0x81,	 4
	st	%f3,	[%l7 + 0x70]
	or	%l2,	%o0,	%o7
	add	%l1,	%i5,	%o2
	nop
	set	0x37, %l2
	ldstub	[%l7 + %l2],	%o4
	st	%fsr,	[%l7 + 0x1C]
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x81,	 4
	nop
	set	0x24, %l1
	prefetch	[%l7 + %l1],	 2
	set	0x1C, %o4
	swapa	[%l7 + %o4] 0x89,	%l4
	bl,a,pt	%icc,	loop_110
	nop
	set	0x58, %o1
	stw	%i7,	[%l7 + %o1]
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x80,	 4
loop_110:
	nop
	set	0x4C, %o3
	sth	%g5,	[%l7 + %o3]
	nop
	set	0x18, %o5
	stx	%g6,	[%l7 + %o5]
	nop
	set	0x4A, %g7
	ldsb	[%l7 + %g7],	%o6
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%l6
	nop
	set	0x38, %l6
	sth	%g3,	[%l7 + %l6]
	fpsub32	%f8,	%f20,	%f8
	fpadd32s	%f8,	%f8,	%f5
	set	0x7E, %g2
	stha	%g1,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x10, %i3
	std	%f30,	[%l7 + %i3]
	nop
	set	0x74, %l3
	ldsh	[%l7 + %l3],	%o1
	nop
	set	0x66, %g4
	sth	%g2,	[%l7 + %g4]
	nop
	set	0x5C, %o6
	ldsw	[%l7 + %o6],	%l3
	set	0x08, %o0
	stwa	%i4,	[%l7 + %o0] 0x88
	add	%l0,	%i3,	%g7
	set	0x50, %l4
	ldda	[%l7 + %l4] 0xea,	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x81,	%o5,	%i0
	set	0x78, %i5
	stha	%g4,	[%l7 + %i5] 0x88
	st	%f6,	[%l7 + 0x1C]
	nop
	set	0x48, %i4
	stx	%i1,	[%l7 + %i4]
	nop
	set	0x1C, %i1
	ldstub	[%l7 + %i1],	%l5
	nop
	set	0x78, %g6
	stx	%o0,	[%l7 + %g6]
	ld	[%l7 + 0x68],	%f13
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xcc
	nop
	set	0x76, %i2
	ldsh	[%l7 + %i2],	%o7
	nop
	set	0x40, %g5
	ldsw	[%l7 + %g5],	%l1
	set	0x74, %l0
	sta	%f21,	[%l7 + %l0] 0x80
	nop
	set	0x2E, %i7
	ldub	[%l7 + %i7],	%i5
	nop
	set	0x42, %i6
	ldstub	[%l7 + %i6],	%l2
	ld	[%l7 + 0x10],	%f7
	nop
	set	0x2C, %g3
	swap	[%l7 + %g3],	%o4
	nop
	set	0x64, %l2
	ldsh	[%l7 + %l2],	%i2
	or	%l4,	%o2,	%i6
	ld	[%l7 + 0x6C],	%f21
	nop
	set	0x48, %o7
	std	%i6,	[%l7 + %o7]
	nop
	set	0x78, %l5
	swap	[%l7 + %l5],	%g5
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xeb,	%g6
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x88,	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%g1
	set	0x1C, %o2
	sta	%f21,	[%l7 + %o2] 0x88
	nop
	set	0x18, %o3
	std	%o6,	[%l7 + %o3]
	nop
	set	0x1D, %o4
	ldub	[%l7 + %o4],	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%i4
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%l2
	fpsub32	%f10,	%f22,	%f14
	nop
	set	0x16, %g1
	ldstub	[%l7 + %g1],	%i3
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%l0
	nop
	set	0x5E, %g2
	sth	%o3,	[%l7 + %g2]
	set	0x78, %i3
	stda	%g6,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x30, %l3
	stxa	%i0,	[%l7 + %l3] 0x81
	nop
	set	0x2D, %g4
	ldsb	[%l7 + %g4],	%o5
	add	%i1,	%g4,	%l5
	set	0x18, %o6
	stxa	%o7,	[%l7 + %o6] 0x89
	nop
	set	0x48, %l6
	stx	%l1,	[%l7 + %l6]
	fpadd32s	%f21,	%f1,	%f22
	set	0x20, %o0
	stda	%i4,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x34, %i5
	ldsw	[%l7 + %i5],	%o0
	set	0x41, %i4
	stba	%o4,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x18, %l4
	stha	%i2,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x48, %g6
	std	%l4,	[%l7 + %g6]
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%i7
	nop
	set	0x5C, %i0
	ldsw	[%l7 + %i0],	%i6
	and	%g6,	%g5,	%g3
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xda,	%f16
	and	%l6,	%g1,	%o6
	nop
	set	0x40, %l0
	lduw	[%l7 + %l0],	%o1
	nop
	set	0x60, %i2
	ldd	[%l7 + %i2],	%f0
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x80,	%g2
	nop
	set	0x48, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x2B, %l2
	stba	%l3,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x08, %g3
	ldx	[%l7 + %g3],	%i3
	bl,a	%icc,	loop_111
	nop
	set	0x78, %o7
	stx	%i4,	[%l7 + %o7]
	and	%l0,	%g7,	%i0
	set	0x74, %l5
	swapa	[%l7 + %l5] 0x80,	%o3
loop_111:
	nop
	set	0x6D, %l1
	stba	%i1,	[%l7 + %l1] 0x81
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xda
	set	0x6C, %o1
	ldstuba	[%l7 + %o1] 0x80,	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%o7
	set	0x58, %o4
	lda	[%l7 + %o4] 0x81,	%f2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%i5
	nop
	set	0x4E, %g7
	lduh	[%l7 + %g7],	%o0
	or	%o5,	%i2,	%l4
	nop
	set	0x10, %g1
	stx	%o4,	[%l7 + %g1]
	and	%o2,	%l2,	%i6
	set	0x3B, %o5
	ldstuba	[%l7 + %o5] 0x89,	%g6
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x43, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g5
	nop
	set	0x2C, %l3
	ldstub	[%l7 + %l3],	%i7
	add	%l6,	%g1,	%o6
	set	0x58, %i3
	stda	%o0,	[%l7 + %i3] 0x80
	nop
	set	0x7E, %o6
	ldsb	[%l7 + %o6],	%g2
	set	0x78, %l6
	lda	[%l7 + %l6] 0x81,	%f6
	set	0x38, %g4
	stba	%l3,	[%l7 + %g4] 0xe3
	membar	#Sync
	st	%f14,	[%l7 + 0x3C]
	set	0x34, %i5
	lda	[%l7 + %i5] 0x89,	%f13
	nop
	set	0x0C, %o0
	ldsw	[%l7 + %o0],	%i3
	nop
	set	0x58, %l4
	ldsh	[%l7 + %l4],	%g3
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x81,	 3
	and	%g7,	%i0,	%l0
	set	0x53, %g6
	stba	%o3,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
	set	0x36, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i1
	set	0x78, %l0
	stha	%l5,	[%l7 + %l0] 0x80
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x88,	%g4
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x89,	 1
	nop
	set	0x08, %i7
	swap	[%l7 + %i7],	%i5
	set	0x08, %l2
	lda	[%l7 + %l2] 0x81,	%f19
	set	0x48, %g3
	stha	%o0,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x48, %o7
	sth	%o7,	[%l7 + %o7]
	nop
	set	0x08, %i6
	std	%i2,	[%l7 + %i6]
	set	0x44, %l5
	stwa	%l4,	[%l7 + %l5] 0xe2
	membar	#Sync
	or	%o5,	%o4,	%l2
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x80,	%i6
	wr	%g6,	%g5,	%pic
	set	0x64, %o1
	stha	%i7,	[%l7 + %o1] 0x81
	set	0x70, %o4
	stxa	%l6,	[%l7 + %o4] 0xe2
	membar	#Sync
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	set	0x50, %g7
	stha	%o6,	[%l7 + %g7] 0x81
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x88,	 0
	nop
	set	0x6C, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x41, %o3
	ldsb	[%l7 + %o3],	%g1
	set	0x7D, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g2
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%l2
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%g3
	set	0x2B, %o6
	stba	%i4,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x48, %g4
	stw	%i3,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf0,	%f0
	nop
	set	0x40, %o0
	std	%i0,	[%l7 + %o0]
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x80,	%g7
	nop
	set	0x20, %i4
	swap	[%l7 + %i4],	%l0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xda
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x80
	nop
	set	0x38, %g6
	swap	[%l7 + %g6],	%i1
	set	0x40, %g5
	lda	[%l7 + %g5] 0x81,	%f22
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%o3
	st	%f11,	[%l7 + 0x60]
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f6
	nop
	nop
	setx	0xB6276AD96D75449C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x85B4A91C3C40E2F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f10
	set	0x50, %i0
	stxa	%l1,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x0C, %i7
	swap	[%l7 + %i7],	%g4
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%o0
	nop
	set	0x4E, %g3
	ldsh	[%l7 + %g3],	%i5
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%i2
	set	0x21, %i6
	stba	%o7,	[%l7 + %i6] 0xe3
	membar	#Sync
	add	%l4,	%o5,	%l2
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%g6
	set	0x21, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g5
	set	0x4A, %l1
	stha	%i7,	[%l7 + %l1] 0xe2
	membar	#Sync
	add	%l6,	%o2,	%i6
	ld	[%l7 + 0x1C],	%f25
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x80,	%o6
	set	0x40, %o2
	ldxa	[%l7 + %o2] 0x88,	%g1
	nop
	set	0x20, %o1
	std	%g2,	[%l7 + %o1]
	nop
	set	0x28, %g7
	std	%o0,	[%l7 + %g7]
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%l3
	nop
	set	0x52, %o3
	ldstub	[%l7 + %o3],	%g3
	nop
	set	0x44, %g1
	stw	%i4,	[%l7 + %g1]
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f18
	nop
	set	0x5C, %l3
	stw	%i0,	[%l7 + %l3]
	set	0x10, %g2
	ldda	[%l7 + %g2] 0xe3,	%g6
	nop
	set	0x18, %g4
	std	%f22,	[%l7 + %g4]
	set	0x2C, %i5
	stha	%i3,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x34, %o0
	stw	%i1,	[%l7 + %o0]
	nop
	set	0x38, %l4
	std	%f2,	[%l7 + %l4]
	nop
	set	0x7A, %o6
	ldstub	[%l7 + %o6],	%l5
	nop
	set	0x14, %l6
	lduh	[%l7 + %l6],	%l0
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%l1,	%o3,	%o0
	set	0x18, %g6
	lda	[%l7 + %g6] 0x88,	%f14
	wr	%g4,	%i2,	%ccr
	bgu,pt	%icc,	loop_112
	nop
	set	0x56, %i4
	ldstub	[%l7 + %i4],	%i5
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x81,	%o7
loop_112:
	nop
	set	0x08, %g5
	ldx	[%l7 + %g5],	%l4
	nop
	set	0x30, %i7
	prefetch	[%l7 + %i7],	 4
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%l2
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%g5
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xeb,	%o4
	nop
	set	0x50, %i6
	ldsb	[%l7 + %i6],	%l6
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x89,	 3
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x88,	%o2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xe3,	%o6
	set	0x60, %o4
	stxa	%g1,	[%l7 + %o4] 0x81
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i6
	set	0x70, %o2
	stwa	%o1,	[%l7 + %o2] 0x81
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x89,	%g2
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%l2
	nop
	set	0x30, %o1
	stx	%i4,	[%l7 + %o1]
	nop
	set	0x56, %g1
	ldstub	[%l7 + %g1],	%g3
	and	%g7,	%i3,	%i1
	set	0x22, %o3
	ldstuba	[%l7 + %o3] 0x88,	%i0
	set	0x78, %l3
	swapa	[%l7 + %l3] 0x80,	%l0
	set	0x48, %g2
	lda	[%l7 + %g2] 0x88,	%f17
	set	0x5C, %g4
	sta	%f5,	[%l7 + %g4] 0x88
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
	set	0x4C, %i5
	swapa	[%l7 + %i5] 0x88,	%l1
	nop
	set	0x20, %l4
	std	%f24,	[%l7 + %l4]
	set	0x40, %o0
	lda	[%l7 + %o0] 0x89,	%f19
	nop
	set	0x70, %l6
	ldx	[%l7 + %l6],	%l5
	nop
	set	0x2E, %i1
	sth	%o3,	[%l7 + %i1]
	set	0x7E, %g6
	stha	%o0,	[%l7 + %g6] 0x81
	or	%i2,	%i5,	%o7
	set	0x4C, %i4
	swapa	[%l7 + %i4] 0x88,	%g4
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%l4
	set	0x40, %l0
	stxa	%o5,	[%l7 + %l0] 0x89
	nop
	set	0x18, %i7
	prefetch	[%l7 + %i7],	 0
	st	%f25,	[%l7 + 0x4C]
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xe3,	%l2
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%f16
	fpsub16s	%f20,	%f11,	%f11
	ld	[%l7 + 0x08],	%f7
	nop
	set	0x38, %i0
	swap	[%l7 + %i0],	%g5
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x3E, %l2
	stba	%o4,	[%l7 + %l2] 0x81
	nop
	set	0x20, %o7
	sth	%l6,	[%l7 + %o7]
	nop
	set	0x64, %l1
	ldsw	[%l7 + %l1],	%g6
	set	0x48, %i2
	stda	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x17, %l5
	stba	%o6,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x81,	%g1
	nop
	set	0x5E, %o2
	ldsh	[%l7 + %o2],	%i6
	set	0x55, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o2
	nop
	set	0x46, %o1
	sth	%g2,	[%l7 + %o1]
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%o1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%g3
	set	0x28, %o3
	lda	[%l7 + %o3] 0x89,	%f22
	set	0x46, %o5
	stha	%g7,	[%l7 + %o5] 0x88
	nop
	set	0x20, %l3
	lduh	[%l7 + %l3],	%i3
	nop
	set	0x68, %g2
	swap	[%l7 + %g2],	%i1
	set	0x10, %g4
	stwa	%i0,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%i4
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x80,	%l0
	nop
	set	0x60, %o0
	stx	%l5,	[%l7 + %o0]
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%o3
	set	0x72, %i1
	stha	%l0,	[%l7 + %i1] 0x89
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x88,	%i2
	nop
	set	0x18, %i4
	stx	%i5,	[%l7 + %i4]
	nop
	nop
	setx	0x6F20905F7EFDA656,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x34EB921819F1E947,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f12,	%f12
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x39, %o6
	ldstub	[%l7 + %o6],	%o0
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0
	nop
	set	0x59, %i7
	ldstub	[%l7 + %i7],	%g4
	fpadd16s	%f20,	%f3,	%f8
	nop
	set	0x44, %g5
	ldsh	[%l7 + %g5],	%o5
	or	%l4,	%l2,	%g5
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%l6
	set	0x64, %l0
	sta	%f25,	[%l7 + %l0] 0x89
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%g6
	and	%i7,	%o6,	%o4
	st	%f4,	[%l7 + 0x50]
	nop
	set	0x44, %i6
	ldsw	[%l7 + %i6],	%g1
	wr	%i6,	%g2,	%ccr
	nop
	set	0x38, %l2
	ldx	[%l7 + %l2],	%o2
	nop
	set	0x28, %o7
	lduw	[%l7 + %o7],	%o1
	set	0x44, %l1
	stha	%l3,	[%l7 + %l1] 0x81
	nop
	set	0x12, %i2
	ldsh	[%l7 + %i2],	%g3
	nop
	set	0x0C, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x38, %l5
	stx	%i3,	[%l7 + %l5]
	nop
	set	0x5E, %o2
	sth	%i1,	[%l7 + %o2]
	nop
	nop
	setx	0x7C2F9520,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x7E0B28B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f27,	%f1
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x88,	 1
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x89,	%i4
	nop
	set	0x37, %o3
	ldub	[%l7 + %o3],	%i0
	nop
	set	0x26, %o5
	lduh	[%l7 + %o5],	%l1
	set	0x5E, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l5
	nop
	set	0x5E, %l3
	ldsb	[%l7 + %l3],	%l0
	set	0x50, %g2
	swapa	[%l7 + %g2] 0x89,	%o3
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%i4
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%o0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%f0
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%i2
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x89,	%o7
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x40, %i1
	stx	%o5,	[%l7 + %i1]
	nop
	set	0x48, %i4
	stx	%g4,	[%l7 + %i4]
	bg	%xcc,	loop_113
	nop
	set	0x08, %g6
	lduw	[%l7 + %g6],	%l4
	nop
	set	0x61, %l6
	ldub	[%l7 + %l6],	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%l6
loop_113:
	nop
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x81,	%g6
	nop
	set	0x1C, %o6
	ldsh	[%l7 + %o6],	%o6
	add	%i7,	%g1,	%i6
	nop
	set	0x1A, %g5
	sth	%g2,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x28, %l0
	swap	[%l7 + %l0],	%o4
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xea,	%o0
	nop
	set	0x20, %l2
	lduw	[%l7 + %l2],	%o2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i3
	nop
	set	0x50, %i6
	swap	[%l7 + %i6],	%l3
	set	0x57, %o7
	stba	%g7,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x42, %l1
	sth	%i4,	[%l7 + %l1]
	st	%f31,	[%l7 + 0x50]
	set	0x2C, %o4
	stha	%i0,	[%l7 + %o4] 0x81
	nop
	set	0x6A, %i2
	ldsh	[%l7 + %i2],	%l1
	nop
	set	0x5C, %l5
	ldub	[%l7 + %l5],	%i1
	nop
	set	0x59, %o2
	ldub	[%l7 + %o2],	%l5
	st	%f19,	[%l7 + 0x60]
	nop
	set	0x0A, %g7
	ldub	[%l7 + %g7],	%l0
	or	%i5,	%o0,	%i2
	nop
	set	0x14, %g1
	swap	[%l7 + %g1],	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%o3
	nop
	set	0x1A, %o5
	sth	%g4,	[%l7 + %o5]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%g5
	nop
	set	0x30, %o1
	ldx	[%l7 + %o1],	%l4
	nop
	set	0x44, %l3
	ldsw	[%l7 + %l3],	%l6
	set	0x48, %g2
	stha	%g6,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x48, %i3
	sta	%f0,	[%l7 + %i3] 0x81
	set	0x48, %o3
	stha	%i7,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xeb,	%g0
	bleu,pn	%icc,	loop_114
	nop
	set	0x08, %o0
	lduh	[%l7 + %o0],	%o6
	nop
	set	0x2C, %l4
	lduw	[%l7 + %l4],	%g2
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
loop_114:
	st	%f5,	[%l7 + 0x68]
	nop
	set	0x54, %i5
	sth	%o4,	[%l7 + %i5]
	wr 	%g0, 	0x7, 	%fprs
	or	%o1,	%g3,	%l3
	set	0x58, %i4
	stxa	%g7,	[%l7 + %i4] 0x81
	nop
	set	0x28, %g6
	std	%f22,	[%l7 + %g6]
	wr	%i3,	%i0,	%sys_tick
	set	0x54, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i4
	nop
	set	0x6C, %l6
	ldsw	[%l7 + %l6],	%l1
	nop
	set	0x3E, %g5
	ldub	[%l7 + %g5],	%i1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x80
	nop
	set	0x56, %o6
	lduh	[%l7 + %o6],	%l5
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%l0
	set	0x78, %l2
	stha	%o0,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x4E, %i0
	ldsb	[%l7 + %i0],	%i5
	set	0x34, %o7
	stwa	%i2,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	set	0x70, %o4
	stxa	%o7,	[%l7 + %o4] 0x80
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%o2
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%g4
	nop
	set	0x12, %o2
	ldsh	[%l7 + %o2],	%l2
	set	0x10, %l1
	stxa	%o5,	[%l7 + %l1] 0xe3
	membar	#Sync
	or	%g5,	%l4,	%g6
	and	%i7,	%l6,	%o6
	nop
	set	0x60, %g7
	lduh	[%l7 + %g7],	%g2
	st	%f20,	[%l7 + 0x08]
	nop
	set	0x5E, %g1
	sth	%g1,	[%l7 + %g1]
	fpadd32	%f2,	%f2,	%f16
	st	%f11,	[%l7 + 0x3C]
	nop
	set	0x34, %o1
	prefetch	[%l7 + %o1],	 4
	set	0x58, %o5
	prefetcha	[%l7 + %o5] 0x88,	 4
	and	%i6,	%o2,	%o1
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xda
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x18, %l3
	lda	[%l7 + %l3] 0x88,	%f10
	set	0x10, %o3
	stha	%g3,	[%l7 + %o3] 0x88
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x88,	%i0
	nop
	set	0x7C, %g4
	stw	%i3,	[%l7 + %g4]
	nop
	set	0x32, %o0
	ldstub	[%l7 + %o0],	%l1
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0
	nop
	set	0x5F, %l4
	ldstub	[%l7 + %l4],	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%o0
	set	0x58, %i5
	stda	%l0,	[%l7 + %i5] 0xeb
	membar	#Sync
	add	%i5,	%o7,	%i2
	nop
	set	0x44, %g6
	ldsh	[%l7 + %g6],	%g4
	nop
	set	0x58, %i4
	swap	[%l7 + %i4],	%o3
	set	0x18, %l6
	stwa	%o5,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x81,	%g4
	nop
	set	0x7C, %g5
	ldsw	[%l7 + %g5],	%l2
	st	%f8,	[%l7 + 0x38]
	set	0x3C, %l0
	sta	%f25,	[%l7 + %l0] 0x81
	and	%l4,	%i7,	%l6
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f14
	nop
	set	0x48, %g3
	ldx	[%l7 + %g3],	%g6
	st	%f8,	[%l7 + 0x50]
	fpadd16s	%f17,	%f4,	%f3
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%o6
	nop
	set	0x58, %o7
	std	%g0,	[%l7 + %o7]
	nop
	set	0x30, %i0
	stx	%g2,	[%l7 + %i0]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf1
	membar	#Sync
	set	0x60, %i2
	stwa	%i6,	[%l7 + %i2] 0x89
	nop
	set	0x24, %i6
	ldsh	[%l7 + %i6],	%o2
	nop
	set	0x49, %o2
	ldstub	[%l7 + %o2],	%o4
	nop
	set	0x14, %l5
	ldsw	[%l7 + %l5],	%o1
	add	%l3,	%g7,	%g3
	nop
	set	0x50, %g7
	std	%f20,	[%l7 + %g7]
	nop
	set	0x20, %l1
	ldsb	[%l7 + %l1],	%i3
	nop
	set	0x44, %o1
	swap	[%l7 + %o1],	%i0
	nop
	set	0x0C, %o5
	ldsh	[%l7 + %o5],	%i1
	set	0x14, %g1
	stwa	%l5,	[%l7 + %g1] 0x89
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%l0
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%o0
	bne,a	%icc,	loop_115
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%f8
	set	0x34, %o3
	sta	%f6,	[%l7 + %o3] 0x81
loop_115:
	nop
	set	0x68, %o0
	ldsw	[%l7 + %o0],	%i4
	nop
	set	0x44, %i1
	swap	[%l7 + %i1],	%i5
	or	%l0,	%o7,	%i2
	set	0x12, %l4
	stha	%o3,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x40, %i5
	stwa	%g4,	[%l7 + %i5] 0x80
	st	%f6,	[%l7 + 0x50]
	fpsub32s	%f1,	%f26,	%f16
	nop
	set	0x20, %g4
	stw	%o5,	[%l7 + %g4]
	wr	%l2,	%g5,	%y
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xe2,	%l4
	be,a,pn	%xcc,	loop_116
	or	%i7,	%g6,	%l6
	set	0x10, %l6
	stwa	%o6,	[%l7 + %l6] 0xeb
	membar	#Sync
loop_116:
	nop
	set	0x7B, %i4
	ldsb	[%l7 + %i4],	%g1
	set	0x2D, %g5
	stba	%g2,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x34, %l0
	swap	[%l7 + %l0],	%i6
	nop
	set	0x58, %o6
	std	%o2,	[%l7 + %o6]
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x80,	%o4
	nop
	set	0x54, %l2
	ldstub	[%l7 + %l2],	%l3
	set	0x48, %g3
	ldxa	[%l7 + %g3] 0x89,	%o1
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%f12
	set	0x4C, %o7
	sta	%f2,	[%l7 + %o7] 0x80
	or	%g7,	%g3,	%i3
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%i0
	nop
	set	0x60, %i6
	stx	%i1,	[%l7 + %i6]
	set	0x20, %i2
	swapa	[%l7 + %i2] 0x88,	%l1
	add	%l5,	%i4,	%o0
	nop
	set	0x6C, %o2
	ldsw	[%l7 + %o2],	%l0
	add	%o7,	%i5,	%i2
	set	0x0C, %l5
	lda	[%l7 + %l5] 0x80,	%f18
	nop
	set	0x30, %g7
	std	%g4,	[%l7 + %g7]
	st	%f8,	[%l7 + 0x78]
	set	0x5C, %l1
	lda	[%l7 + %l1] 0x81,	%f10
	nop
	set	0x48, %o5
	ldx	[%l7 + %o5],	%o3
	and	%o5,	%l2,	%g5
	nop
	set	0x58, %g1
	stw	%l4,	[%l7 + %g1]
	nop
	set	0x08, %o1
	std	%g6,	[%l7 + %o1]
	nop
	set	0x50, %l3
	stx	%l6,	[%l7 + %l3]
	or	%i7,	%g1,	%o6
	set	0x58, %i3
	stxa	%i6,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x89,	%o2
	nop
	set	0x60, %o0
	swap	[%l7 + %o0],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l3,	%o1
	nop
	set	0x7C, %o3
	swap	[%l7 + %o3],	%g7
	nop
	set	0x50, %l4
	ldx	[%l7 + %l4],	%g2
	and	%g3,	%i3,	%i1
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x80,	 1
	set	0x30, %i1
	lda	[%l7 + %i1] 0x80,	%f5
	nop
	set	0x61, %g6
	ldstub	[%l7 + %g6],	%l5
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x89,	%f9
	nop
	set	0x24, %i4
	ldsw	[%l7 + %i4],	%i0
	nop
	set	0x08, %g5
	std	%o0,	[%l7 + %g5]
	ld	[%l7 + 0x40],	%f13
	bn,pn	%icc,	loop_117
	nop
	set	0x18, %l0
	stx	%l0,	[%l7 + %l0]
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f10
	set	0x62, %i7
	ldstuba	[%l7 + %i7] 0x81,	%o7
loop_117:
	nop
	set	0x50, %g4
	ldxa	[%l7 + %g4] 0x89,	%i4
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x81,	%i2
	nop
	set	0x11, %l2
	ldub	[%l7 + %l2],	%i5
	add	%g4,	%o5,	%l2
	ble	%xcc,	loop_118
	nop
	set	0x7C, %o7
	swap	[%l7 + %o7],	%o3
	nop
	set	0x34, %o4
	lduw	[%l7 + %o4],	%l4
	nop
	set	0x3C, %i0
	stw	%g6,	[%l7 + %i0]
loop_118:
	and	%l6,	%i7,	%g5
	nop
	set	0x70, %i2
	std	%f26,	[%l7 + %i2]
	set	0x1C, %o2
	lda	[%l7 + %o2] 0x81,	%f5
	nop
	set	0x5E, %l5
	lduh	[%l7 + %l5],	%g1
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%i6
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f16
	set	0x20, %l1
	stxa	%o6,	[%l7 + %l1] 0xea
	membar	#Sync
	add	%o2,	%o4,	%o1
	nop
	set	0x28, %o5
	std	%g6,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f0
	nop
	set	0x40, %o1
	std	%f30,	[%l7 + %o1]
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%l2
	set	0x30, %g2
	swapa	[%l7 + %g2] 0x88,	%g2
	set	0x28, %i3
	stxa	%g3,	[%l7 + %i3] 0x89
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f16
	set	0x4F, %o3
	stba	%i1,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x81
	nop
	set	0x67, %l4
	ldub	[%l7 + %l4],	%i3
	or	%l5,	%i0,	%o0
	set	0x64, %g6
	ldstuba	[%l7 + %g6] 0x81,	%l0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f16
	add	%l1,	%i4,	%i2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i5
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x80,	 0
	bg	%xcc,	loop_119
	nop
	set	0x62, %i4
	ldub	[%l7 + %i4],	%g4
	nop
	set	0x12, %g5
	ldub	[%l7 + %g5],	%o3
	wr	%l2,	%g6,	%clear_softint
loop_119:
	nop
	set	0x18, %l0
	stw	%l6,	[%l7 + %l0]
	or	%l4,	%g5,	%g1
	ld	[%l7 + 0x18],	%f1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%i7
	add	%o2,	%o6,	%o1
	nop
	set	0x38, %o6
	lduw	[%l7 + %o6],	%g7
	nop
	set	0x1C, %i7
	lduw	[%l7 + %i7],	%l3
	nop
	set	0x50, %g4
	lduh	[%l7 + %g4],	%o4
	or	%g2,	%g3,	%i3
	nop
	set	0x0C, %g3
	prefetch	[%l7 + %g3],	 3
	ld	[%l7 + 0x48],	%f18
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f16
	or	%l5,	%i1,	%i0
	set	0x50, %l2
	stxa	%l0,	[%l7 + %l2] 0x89
	set	0x14, %o4
	sta	%f19,	[%l7 + %o4] 0x89
	fpadd32	%f26,	%f0,	%f2
	nop
	set	0x21, %i0
	ldstub	[%l7 + %i0],	%o0
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x80,	 4
	nop
	set	0x58, %l5
	std	%f28,	[%l7 + %l5]
	wr	%l1,	%i2,	%y
	nop
	set	0x74, %i2
	lduh	[%l7 + %i2],	%i5
	nop
	set	0x58, %g7
	stx	%o7,	[%l7 + %g7]
	nop
	set	0x24, %i6
	sth	%g4,	[%l7 + %i6]
	nop
	set	0x28, %o5
	lduw	[%l7 + %o5],	%o3
	or	%l2,	%g6,	%l6
	st	%f5,	[%l7 + 0x14]
	set	0x6A, %g1
	stba	%l4,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x89,	%g5
	set	0x58, %l3
	stxa	%o5,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x28, %g2
	stw	%g1,	[%l7 + %g2]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%o2
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x88,	%o6
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x89
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%i7
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x88,	 4
	nop
	set	0x60, %o0
	stx	%g7,	[%l7 + %o0]
	nop
	set	0x63, %l4
	ldsb	[%l7 + %l4],	%l3
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x80
	nop
	set	0x24, %i1
	lduh	[%l7 + %i1],	%g2
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%g3
	set	0x76, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i3
	set	0x27, %g6
	ldstuba	[%l7 + %g6] 0x88,	%o4
	fpadd32s	%f17,	%f22,	%f0
	nop
	set	0x4C, %l0
	lduw	[%l7 + %l0],	%l5
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%i0
	set	0x28, %i7
	sta	%f27,	[%l7 + %i7] 0x80
	set	0x44, %g3
	sta	%f9,	[%l7 + %g3] 0x89
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xca
	set	0x38, %o7
	swapa	[%l7 + %o7] 0x80,	%l0
	nop
	set	0x38, %l2
	ldsh	[%l7 + %l2],	%i1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xda,	%f0
	nop
	set	0x26, %o4
	ldsb	[%l7 + %o4],	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%i2
	nop
	set	0x0C, %l5
	lduw	[%l7 + %l5],	%l1
	nop
	set	0x38, %o2
	std	%i4,	[%l7 + %o2]
	nop
	set	0x10, %g7
	std	%o6,	[%l7 + %g7]
	set	0x34, %i2
	stha	%g4,	[%l7 + %i2] 0x88
	set	0x30, %i6
	stxa	%l2,	[%l7 + %i6] 0x88
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f20
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f0
	set	0x3C, %l3
	sta	%f11,	[%l7 + %l3] 0x81
	wr	%o3,	%g6,	%ccr
	ld	[%l7 + 0x4C],	%f9
	st	%fsr,	[%l7 + 0x60]
	set	0x68, %o5
	stxa	%l6,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x18, %g2
	prefetch	[%l7 + %g2],	 2
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%l4
	nop
	set	0x78, %i3
	std	%o4,	[%l7 + %i3]
	nop
	set	0x78, %o3
	stw	%g1,	[%l7 + %o3]
	nop
	set	0x11, %o0
	ldub	[%l7 + %o0],	%g5
	set	0x63, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o2
	nop
	set	0x70, %l6
	std	%f0,	[%l7 + %l6]
	add	%o6,	%i7,	%o1
	set	0x7C, %i1
	stba	%i6,	[%l7 + %i1] 0x80
	set	0x48, %l4
	swapa	[%l7 + %l4] 0x88,	%l3
	nop
	set	0x50, %g5
	prefetch	[%l7 + %g5],	 2
	st	%f2,	[%l7 + 0x3C]
	nop
	set	0x68, %i4
	std	%g6,	[%l7 + %i4]
	st	%f3,	[%l7 + 0x18]
	nop
	set	0x7C, %l0
	stw	%g3,	[%l7 + %l0]
	set	0x2C, %o6
	swapa	[%l7 + %o6] 0x80,	%g2
	set	0x5B, %i7
	stba	%i3,	[%l7 + %i7] 0xea
	membar	#Sync
	fpsub32	%f28,	%f28,	%f30
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xca
	set	0x10, %g3
	stda	%o4,	[%l7 + %g3] 0x81
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%i0
	nop
	set	0x38, %g4
	std	%f10,	[%l7 + %g4]
	nop
	set	0x5E, %l2
	lduh	[%l7 + %l2],	%l0
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%i0
	or	%l5,	%i4,	%i2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf1
	membar	#Sync
	add	%o0,	%i5,	%o7
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f16
	fpsub16	%f2,	%f12,	%f28
	nop
	set	0x08, %g7
	ldx	[%l7 + %g7],	%l1
	nop
	set	0x08, %o2
	std	%f0,	[%l7 + %o2]
	nop
	set	0x18, %i6
	swap	[%l7 + %i6],	%l2
	nop
	set	0x32, %g1
	sth	%o3,	[%l7 + %g1]
	and	%g4,	%l6,	%l4
	set	0x3A, %l1
	stha	%o5,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x4E, %i2
	stha	%g6,	[%l7 + %i2] 0x80
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x88,	%g1
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%o2
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f16
	and	%o6,	%i7,	%g5
	set	0x0A, %o1
	ldstuba	[%l7 + %o1] 0x88,	%i6
	nop
	set	0x30, %o0
	stw	%o1,	[%l7 + %o0]
	bl,a,pn	%xcc,	loop_120
	nop
	set	0x64, %o3
	prefetch	[%l7 + %o3],	 0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%g3
loop_120:
	nop
	set	0x0A, %l6
	ldstub	[%l7 + %l6],	%l3
	set	0x38, %i5
	sta	%f29,	[%l7 + %i5] 0x88
	nop
	set	0x77, %l4
	ldstub	[%l7 + %l4],	%i3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x89
	ld	[%l7 + 0x24],	%f12
	set	0x70, %g5
	stwa	%o4,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x1E, %i4
	stha	%g2,	[%l7 + %i4] 0x88
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%i1
	st	%fsr,	[%l7 + 0x3C]
	and	%l0,	%l5,	%i2
	be,a,pn	%icc,	loop_121
	wr	%i4,	%o0,	%set_softint
	nop
	set	0x22, %l0
	sth	%o7,	[%l7 + %l0]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd2
loop_121:
	nop
	set	0x46, %i7
	stha	%i5,	[%l7 + %i7] 0x81
	set	0x6C, %g3
	stwa	%l1,	[%l7 + %g3] 0x80
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%o3
	set	0x50, %o7
	stxa	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
	nop
	set	0x09, %g4
	stb	%l6,	[%l7 + %g4]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xda,	%f16
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%o5
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f8
	nop
	set	0x08, %i0
	stx	%g6,	[%l7 + %i0]
	add	%l4,	%g1,	%o6
	set	0x4E, %g7
	stha	%o2,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x08, %i6
	stw	%i7,	[%l7 + %i6]
	set	0x22, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i6
	nop
	set	0x40, %l1
	std	%o0,	[%l7 + %l1]
	st	%f17,	[%l7 + 0x50]
	nop
	set	0x1C, %i2
	ldsw	[%l7 + %i2],	%g7
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x89,	%g2
	nop
	set	0x40, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x20, %i3
	lda	[%l7 + %i3] 0x81,	%f7
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%g4
	nop
	set	0x73, %o0
	ldsb	[%l7 + %o0],	%l3
	or	%o4,	%g2,	%i3
	wr 	%g0, 	0x4, 	%fprs
	set	0x70, %o1
	stxa	%l5,	[%l7 + %o1] 0x81
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%f30
	nop
	set	0x6C, %i5
	ldsh	[%l7 + %i5],	%i2
	nop
	set	0x60, %l6
	std	%i4,	[%l7 + %l6]
	nop
	set	0x20, %i1
	std	%o0,	[%l7 + %i1]
	nop
	set	0x64, %g5
	ldsw	[%l7 + %g5],	%i1
	nop
	set	0x68, %l4
	sth	%o7,	[%l7 + %l4]
	nop
	set	0x40, %i4
	stw	%i5,	[%l7 + %i4]
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	nop
	set	0x08, %i7
	lduw	[%l7 + %i7],	%l2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%g4
	nop
	set	0x28, %l0
	stx	%l6,	[%l7 + %l0]
	or	%g6,	%o5,	%l4
	add	%g1,	%o6,	%o2
	nop
	set	0x2E, %g6
	sth	%i7,	[%l7 + %g6]
	or	%i6,	%g7,	%o1
	nop
	set	0x28, %o7
	ldx	[%l7 + %o7],	%g5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g3,	%l3
	nop
	set	0x3C, %g3
	ldub	[%l7 + %g3],	%g2
	ld	[%l7 + 0x14],	%f25
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x89,	%o4
	nop
	set	0x38, %o4
	stx	%i3,	[%l7 + %o4]
	nop
	set	0x18, %l5
	std	%i0,	[%l7 + %l5]
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%l4
	add	%i2,	%l0,	%i4
	st	%f28,	[%l7 + 0x2C]
	and	%o0,	%o7,	%i1
	nop
	set	0x4C, %g7
	ldub	[%l7 + %g7],	%o3
	nop
	set	0x18, %i6
	lduw	[%l7 + %i6],	%i5
	ld	[%l7 + 0x50],	%f11
	add	%l2,	%g4,	%l1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%o5
	add	%l6,	%g1,	%o6
	set	0x18, %o2
	stxa	%o2,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x18, %l1
	stx	%i7,	[%l7 + %l1]
	set	0x6A, %i2
	stba	%l4,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x48, %g1
	lda	[%l7 + %g1] 0x89,	%f1
	nop
	set	0x21, %l3
	stb	%g7,	[%l7 + %l3]
	st	%f4,	[%l7 + 0x3C]
	nop
	set	0x10, %l2
	ldsh	[%l7 + %l2],	%i6
	nop
	set	0x0D, %g2
	stb	%o1,	[%l7 + %g2]
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%g2
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x70, %i3
	prefetch	[%l7 + %i3],	 4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xd2
	nop
	set	0x57, %o1
	ldub	[%l7 + %o1],	%g5
	and	%g2,	%o4,	%i3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe2,	%l2
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%i0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f0
	set	0x6F, %g5
	stba	%i2,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x14, %i4
	ldsh	[%l7 + %i4],	%l0
	nop
	set	0x1C, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x5E, %i7
	sth	%l5,	[%l7 + %i7]
	nop
	set	0x38, %o6
	std	%o0,	[%l7 + %o6]
	set	0x28, %l0
	stwa	%i4,	[%l7 + %l0] 0x88
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%o7
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x08, %g3
	stx	%i5,	[%l7 + %g3]
	or	%o3,	%g4,	%l2
	nop
	set	0x14, %o7
	lduw	[%l7 + %o7],	%l1
	ld	[%l7 + 0x50],	%f9
	nop
	set	0x08, %g4
	std	%o4,	[%l7 + %g4]
	add	%g6,	%g1,	%o6
	set	0x60, %l5
	lda	[%l7 + %l5] 0x88,	%f13
	set	0x24, %o4
	stha	%l6,	[%l7 + %o4] 0x81
	nop
	set	0x20, %g7
	stx	%o2,	[%l7 + %g7]
	wr	%l4,	%i7,	%y
	set	0x20, %i6
	ldstuba	[%l7 + %i6] 0x89,	%g7
	add	%i6,	%o1,	%g5
	set	0x34, %i0
	sta	%f8,	[%l7 + %i0] 0x81
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%g3
	set	0x58, %o2
	lda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%i0
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xeb,	%i2
	set	0x24, %g1
	swapa	[%l7 + %g1] 0x89,	%l3
	set	0x38, %l3
	lda	[%l7 + %l3] 0x88,	%f6
	nop
	set	0x37, %g2
	stb	%l0,	[%l7 + %g2]
	nop
	set	0x6C, %l2
	ldsb	[%l7 + %l2],	%o0
	nop
	set	0x18, %o0
	std	%i4,	[%l7 + %o0]
	add	%i1,	%l5,	%o7
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%o2
	nop
	nop
	setx	0x982C5246,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x02EF24C5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f5,	%f3
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%g4
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%l2
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x2C, %i5
	stb	%l1,	[%l7 + %i5]
	nop
	set	0x55, %o3
	ldstub	[%l7 + %o3],	%i5
	nop
	set	0x68, %i1
	std	%f0,	[%l7 + %i1]
	set	0x3C, %g5
	stwa	%g6,	[%l7 + %g5] 0x81
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xda
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%g1
	nop
	set	0x50, %l6
	swap	[%l7 + %l6],	%o6
	nop
	set	0x50, %i7
	ldub	[%l7 + %i7],	%o2
	nop
	set	0x57, %l4
	stb	%l6,	[%l7 + %l4]
	nop
	set	0x50, %o6
	ldx	[%l7 + %o6],	%i7
	bgu,pn	%icc,	loop_122
	nop
	set	0x14, %l0
	swap	[%l7 + %l0],	%g7
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f0
loop_122:
	fpadd16s	%f15,	%f18,	%f20
	nop
	set	0x6C, %o7
	swap	[%l7 + %o7],	%i6
	nop
	set	0x3E, %g4
	ldsh	[%l7 + %g4],	%l4
	bn,a	%xcc,	loop_123
	nop
	set	0x6C, %g6
	ldsw	[%l7 + %g6],	%o1
	set	0x3C, %l5
	sta	%f14,	[%l7 + %l5] 0x88
loop_123:
	nop
	set	0x4D, %o4
	stba	%g2,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%g3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xca
	set	0x30, %i6
	stda	%i2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x3C, %i2
	sth	%o4,	[%l7 + %i2]
	nop
	set	0x3A, %o2
	lduh	[%l7 + %o2],	%g5
	set	0x30, %g1
	sta	%f16,	[%l7 + %g1] 0x88
	nop
	set	0x32, %l1
	ldstub	[%l7 + %l1],	%i2
	nop
	set	0x44, %l3
	ldsw	[%l7 + %l3],	%i0
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%l3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%o0
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x89,	 4
	and	%l5,	%i4,	%o3
	set	0x28, %o0
	stxa	%g4,	[%l7 + %o0] 0xeb
	membar	#Sync
	add	%l2,	%l1,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%o5
	nop
	set	0x68, %i3
	stw	%o7,	[%l7 + %i3]
	nop
	set	0x48, %o5
	prefetch	[%l7 + %o5],	 2
	or	%o6,	%o2,	%g1
	nop
	set	0x18, %i5
	ldsw	[%l7 + %i5],	%i7
	and	%g7,	%i6,	%l4
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x80
	nop
	set	0x78, %o3
	std	%f24,	[%l7 + %o3]
	set	0x78, %g5
	swapa	[%l7 + %g5] 0x88,	%l6
	nop
	set	0x0C, %i1
	stw	%o1,	[%l7 + %i1]
	add	%g3,	%g2,	%i3
	set	0x5C, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o4
	nop
	set	0x34, %i7
	lduw	[%l7 + %i7],	%i2
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f22
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f14
	set	0x50, %l0
	lda	[%l7 + %l0] 0x88,	%f29
	set	0x50, %g3
	lda	[%l7 + %g3] 0x80,	%f16
	nop
	set	0x79, %o7
	stb	%g5,	[%l7 + %o7]
	and	%i0,	%l0,	%l3
	set	0x70, %i4
	ldxa	[%l7 + %i4] 0x89,	%o0
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%l4
	nop
	set	0x08, %g4
	std	%f8,	[%l7 + %g4]
	set	0x70, %o4
	ldxa	[%l7 + %o4] 0x88,	%i4
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i1
	st	%fsr,	[%l7 + 0x54]
	ld	[%l7 + 0x48],	%f3
	nop
	set	0x30, %l5
	ldsw	[%l7 + %l5],	%o3
	nop
	set	0x08, %i0
	stx	%g4,	[%l7 + %i0]
	or	%l1,	%l2,	%i5
	nop
	set	0x44, %i2
	stw	%g6,	[%l7 + %i2]
	set	0x47, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o7
	nop
	set	0x68, %g1
	ldx	[%l7 + %g1],	%o5
	nop
	set	0x58, %o2
	stx	%o2,	[%l7 + %o2]
	set	0x28, %l3
	prefetcha	[%l7 + %l3] 0x89,	 4
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x89,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%i6
	nop
	set	0x60, %g2
	ldstub	[%l7 + %g2],	%g7
	fpsub32s	%f2,	%f29,	%f19
	st	%fsr,	[%l7 + 0x5C]
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x88,	%l4
	nop
	set	0x54, %i3
	ldsh	[%l7 + %i3],	%l6
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%g2
	nop
	set	0x25, %i5
	ldub	[%l7 + %i5],	%g2
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x80,	 4
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%i3
	fpadd16	%f14,	%f2,	%f28
	set	0x28, %o3
	stda	%o4,	[%l7 + %o3] 0x89
	nop
	set	0x30, %i1
	stw	%g5,	[%l7 + %i1]
	nop
	set	0x24, %g5
	ldub	[%l7 + %g5],	%i2
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x10, %l6
	ldub	[%l7 + %l6],	%i0
	and	%l0,	%o0,	%l3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%l5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1266
!	Type a   	: 23
!	Type cti   	: 24
!	Type x   	: 531
!	Type f   	: 36
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
	set	0x7,	%g1
	set	0x9,	%g2
	set	0xF,	%g3
	set	0xD,	%g4
	set	0x7,	%g5
	set	0x8,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x4,	%i1
	set	-0xA,	%i2
	set	-0xB,	%i3
	set	-0x1,	%i4
	set	-0xD,	%i5
	set	-0x0,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x2F25B644,	%l0
	set	0x441E7890,	%l1
	set	0x33284E4D,	%l2
	set	0x74BEA52D,	%l3
	set	0x572F6CCC,	%l4
	set	0x061C041B,	%l5
	set	0x69EC5D3C,	%l6
	!# Output registers
	set	-0x0F00,	%o0
	set	-0x0AC3,	%o1
	set	0x1B04,	%o2
	set	0x0E1D,	%o3
	set	0x002A,	%o4
	set	0x1A40,	%o5
	set	-0x010B,	%o6
	set	-0x1A67,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	set	0x35, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%i1
	st	%f0,	[%l7 + 0x68]
	nop
	set	0x0C, %o6
	lduw	[%l7 + %o6],	%l1
	wr 	%g0, 	0x4, 	%fprs
	st	%f9,	[%l7 + 0x30]
	nop
	set	0x40, %l0
	stw	%g6,	[%l7 + %l0]
	nop
	set	0x60, %l4
	ldsw	[%l7 + %l4],	%o7
	nop
	set	0x56, %o7
	ldsb	[%l7 + %o7],	%o2
	set	0x27, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i7
	nop
	set	0x38, %g6
	stx	%i6,	[%l7 + %g6]
	and	%g1,	%g7,	%l4
	nop
	set	0x17, %g4
	ldsb	[%l7 + %g4],	%l6
	set	0x08, %g3
	stxa	%g3,	[%l7 + %g3] 0x88
	nop
	set	0x57, %g7
	ldub	[%l7 + %g7],	%g2
	st	%f0,	[%l7 + 0x2C]
	nop
	set	0x18, %l5
	ldsh	[%l7 + %l5],	%i3
	nop
	set	0x22, %o4
	lduh	[%l7 + %o4],	%o1
	set	0x20, %i0
	lda	[%l7 + %i0] 0x88,	%f12
	set	0x40, %i2
	stha	%g5,	[%l7 + %i2] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	nop
	set	0x52, %i6
	sth	%i2,	[%l7 + %i6]
	nop
	set	0x6C, %o2
	stw	%i0,	[%l7 + %o2]
	set	0x0B, %l3
	stba	%l0,	[%l7 + %l3] 0x88
	set	0x60, %l1
	stwa	%o4,	[%l7 + %l1] 0x89
	set	0x08, %l2
	ldxa	[%l7 + %l2] 0x80,	%o0
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f6
	nop
	set	0x10, %o0
	stx	%l3,	[%l7 + %o0]
	add	%i4,	%o3,	%l5
	nop
	set	0x58, %i5
	ldsw	[%l7 + %i5],	%i1
	nop
	set	0x18, %i3
	ldsw	[%l7 + %i3],	%l1
	set	0x7C, %o5
	stwa	%l2,	[%l7 + %o5] 0xeb
	membar	#Sync
	set	0x24, %o1
	stha	%i5,	[%l7 + %o1] 0x89
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%g4
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%o7
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	fpsub16s	%f9,	%f29,	%f10
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%o4
	nop
	set	0x61, %l6
	ldub	[%l7 + %l6],	%g6
	and	%i7,	%o6,	%i6
	nop
	set	0x30, %o6
	stx	%g7,	[%l7 + %o6]
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%l4
	set	0x14, %l0
	swapa	[%l7 + %l0] 0x89,	%g1
	set	0x20, %i4
	stba	%g3,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x2B, %g6
	stba	%g2,	[%l7 + %g6] 0x89
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd2
	nop
	set	0x63, %g3
	ldsb	[%l7 + %g3],	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%o1
	nop
	set	0x51, %o7
	stb	%i2,	[%l7 + %o7]
	nop
	set	0x70, %g7
	ldx	[%l7 + %g7],	%i0
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x80,	%l0
	set	0x30, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	set	0x50, %i2
	stwa	%o4,	[%l7 + %i2] 0x88
	ld	[%l7 + 0x3C],	%f12
	add	%l3,	%i4,	%o3
	bne	%icc,	loop_124
	nop
	set	0x30, %o4
	std	%o0,	[%l7 + %o4]
	wr	%i1,	%l5,	%set_softint
	and	%l2,	%l1,	%i5
loop_124:
	nop
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x80,	%o7
	set	0x0C, %o2
	swapa	[%l7 + %o2] 0x81,	%g4
	ld	[%l7 + 0x68],	%f4
	set	0x3D, %l3
	stba	%o5,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x89,	%o2
	or	%i7,	%o6,	%i6
	nop
	set	0x20, %l2
	lduh	[%l7 + %l2],	%g7
	set	0x47, %g2
	stba	%g6,	[%l7 + %g2] 0x81
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc8
	nop
	set	0x6B, %l1
	stb	%g1,	[%l7 + %l1]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f0
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x89,	%g3
	set	0x5A, %o5
	stba	%g2,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x14, %o1
	stwa	%l4,	[%l7 + %o1] 0x89
	nop
	set	0x18, %i1
	lduw	[%l7 + %i1],	%l6
	set	0x64, %o3
	lda	[%l7 + %o3] 0x89,	%f26
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xca
	set	0x78, %o6
	stba	%o1,	[%l7 + %o6] 0xe2
	membar	#Sync
	and	%i3,	%i2,	%l0
	nop
	set	0x4C, %g5
	ldsw	[%l7 + %g5],	%i0
	set	0x4C, %l4
	swapa	[%l7 + %l4] 0x89,	%g5
	nop
	set	0x48, %i4
	std	%o4,	[%l7 + %i4]
	nop
	set	0x1C, %g6
	swap	[%l7 + %g6],	%l3
	set	0x50, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i4
	set	0x70, %g3
	swapa	[%l7 + %g3] 0x88,	%o0
	set	0x60, %l0
	stxa	%i1,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x38, %o7
	stx	%o3,	[%l7 + %o7]
	wr	%l2,	%l1,	%ccr
	nop
	set	0x18, %g7
	stx	%i5,	[%l7 + %g7]
	add	%o7,	%l5,	%g4
	nop
	set	0x4C, %i0
	lduh	[%l7 + %i0],	%o2
	set	0x50, %l5
	stda	%o4,	[%l7 + %l5] 0x89
	set	0x53, %i2
	stba	%i7,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x18, %g1
	ldsb	[%l7 + %g1],	%i6
	fpsub16s	%f22,	%f21,	%f31
	set	0x3E, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o6
	nop
	set	0x60, %l3
	ldsw	[%l7 + %l3],	%g6
	nop
	set	0x18, %o4
	stx	%g7,	[%l7 + %o4]
	nop
	set	0x18, %i6
	stx	%g1,	[%l7 + %i6]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%f16
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x89,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%l6
	set	0x58, %o0
	stxa	%o1,	[%l7 + %o0] 0xe2
	membar	#Sync
	wr	%l4,	%i3,	%clear_softint
	nop
	set	0x24, %i5
	ldstub	[%l7 + %i5],	%l0
	nop
	set	0x48, %l1
	std	%i0,	[%l7 + %l1]
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x14, %i1
	lda	[%l7 + %i1] 0x89,	%f21
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%i2
	nop
	set	0x24, %o1
	stw	%l3,	[%l7 + %o1]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i4
	nop
	set	0x5C, %i7
	swap	[%l7 + %i7],	%i1
	nop
	set	0x46, %o3
	ldub	[%l7 + %o3],	%o0
	set	0x40, %l6
	stda	%o2,	[%l7 + %l6] 0x88
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x80,	%l1
	set	0x60, %l4
	stwa	%l2,	[%l7 + %l4] 0x80
	nop
	set	0x3A, %i4
	stb	%i5,	[%l7 + %i4]
	bne,a,pt	%xcc,	loop_125
	nop
	set	0x4C, %g6
	ldsb	[%l7 + %g6],	%o7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
loop_125:
	nop
	set	0x62, %g3
	stha	%g4,	[%l7 + %g3] 0x89
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x12, %o6
	ldsh	[%l7 + %o6],	%o2
	nop
	set	0x44, %g7
	ldsh	[%l7 + %g7],	%o5
	or	%i7,	%l5,	%i6
	set	0x6C, %o7
	sta	%f31,	[%l7 + %o7] 0x80
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x36, %i0
	ldstub	[%l7 + %i0],	%o6
	nop
	set	0x30, %i2
	ldsb	[%l7 + %i2],	%g6
	set	0x70, %g1
	prefetcha	[%l7 + %g1] 0x89,	 2
	nop
	set	0x2E, %o2
	sth	%g3,	[%l7 + %o2]
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x0E, %l5
	sth	%g1,	[%l7 + %l5]
	set	0x41, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g2
	wr	%o1,	%l6,	%y
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%l0
	nop
	set	0x18, %o4
	stx	%i3,	[%l7 + %o4]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x88,	 2
	nop
	set	0x10, %o0
	std	%f8,	[%l7 + %o0]
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x89,	%i0
	set	0x44, %l1
	stwa	%l3,	[%l7 + %l1] 0x88
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f4
	bne,a,pt	%icc,	loop_126
	fpsub16s	%f27,	%f1,	%f18
	set	0x20, %i3
	stda	%o4,	[%l7 + %i3] 0xe2
	membar	#Sync
loop_126:
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f2
	nop
	set	0x31, %o5
	ldstub	[%l7 + %o5],	%i4
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x81,	%f16
	nop
	set	0x44, %o3
	prefetch	[%l7 + %o3],	 2
	nop
	set	0x0F, %l6
	ldstub	[%l7 + %l6],	%i1
	set	0x7C, %g5
	stba	%i2,	[%l7 + %g5] 0x89
	wr	%o0,	%l1,	%sys_tick
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%l2
	nop
	set	0x44, %i4
	ldstub	[%l7 + %i4],	%i5
	st	%fsr,	[%l7 + 0x78]
	fpadd16s	%f21,	%f15,	%f25
	nop
	set	0x10, %l4
	stx	%o7,	[%l7 + %l4]
	set	0x40, %g6
	stda	%o2,	[%l7 + %g6] 0xeb
	membar	#Sync
	set	0x3D, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g4
	set	0x3B, %l0
	stba	%o2,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x50, %g4
	ldx	[%l7 + %g4],	%o5
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%l5
	nop
	set	0x41, %g7
	ldsb	[%l7 + %g7],	%i6
	st	%f20,	[%l7 + 0x74]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%i7
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	fpsub32s	%f17,	%f12,	%f5
	nop
	set	0x6C, %i2
	prefetch	[%l7 + %i2],	 0
	fpadd16s	%f24,	%f5,	%f16
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%g3
	add	%g1,	%g6,	%o1
	nop
	set	0x55, %o2
	ldub	[%l7 + %o2],	%g2
	set	0x5E, %i0
	stha	%l6,	[%l7 + %i0] 0x89
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x4E, %i6
	stha	%l0,	[%l7 + %i6] 0x88
	nop
	set	0x34, %l5
	ldub	[%l7 + %l5],	%l4
	nop
	set	0x5F, %o4
	ldsb	[%l7 + %o4],	%i3
	nop
	set	0x24, %o0
	lduh	[%l7 + %o0],	%i0
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%l2
	nop
	set	0x1A, %l1
	lduh	[%l7 + %l1],	%o4
	nop
	set	0x20, %l2
	ldsh	[%l7 + %l2],	%g5
	nop
	set	0x28, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x60, %i1
	ldsh	[%l7 + %i1],	%i4
	bg	%icc,	loop_127
	nop
	set	0x68, %i3
	std	%i0,	[%l7 + %i3]
	set	0x5F, %o5
	ldstuba	[%l7 + %o5] 0x88,	%o0
loop_127:
	nop
	set	0x44, %i7
	prefetch	[%l7 + %i7],	 1
	and	%l1,	%i2,	%i5
	nop
	set	0x32, %l6
	lduh	[%l7 + %l6],	%l2
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%o7
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x89,	%g4
	set	0x34, %o3
	sta	%f25,	[%l7 + %o3] 0x88
	nop
	set	0x3F, %l4
	stb	%o3,	[%l7 + %l4]
	st	%f18,	[%l7 + 0x3C]
	nop
	set	0x6C, %i4
	ldsw	[%l7 + %i4],	%o5
	set	0x36, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o2
	ld	[%l7 + 0x40],	%f27
	fpsub32	%f24,	%f16,	%f24
	nop
	set	0x0C, %l0
	ldub	[%l7 + %l0],	%i6
	nop
	set	0x32, %g6
	ldsh	[%l7 + %g6],	%o6
	nop
	nop
	setx	0x29858F264B3E8BAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0BAD988BBDE8265D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f14
	ld	[%l7 + 0x20],	%f17
	nop
	set	0x70, %g4
	swap	[%l7 + %g4],	%i7
	nop
	set	0x65, %g7
	ldub	[%l7 + %g7],	%g7
	nop
	set	0x72, %o6
	ldub	[%l7 + %o6],	%g3
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xca
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f8
	nop
	set	0x08, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x74, %g1
	ldub	[%l7 + %g1],	%g1
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x89,	 4
	nop
	set	0x5C, %i6
	ldub	[%l7 + %i6],	%g6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%l6
	nop
	set	0x30, %l3
	std	%f8,	[%l7 + %l3]
	set	0x5F, %l5
	ldstuba	[%l7 + %l5] 0x89,	%o1
	nop
	set	0x48, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x2B, %o4
	ldsb	[%l7 + %o4],	%l4
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f10
	nop
	set	0x4A, %l1
	lduh	[%l7 + %l1],	%l0
	nop
	set	0x48, %l2
	prefetch	[%l7 + %l2],	 2
	set	0x60, %i1
	sta	%f17,	[%l7 + %i1] 0x80
	nop
	set	0x18, %i3
	ldx	[%l7 + %i3],	%i0
	nop
	set	0x73, %o5
	ldsb	[%l7 + %o5],	%i3
	set	0x09, %i5
	stba	%l3,	[%l7 + %i5] 0x89
	set	0x68, %l6
	lda	[%l7 + %l6] 0x88,	%f26
	nop
	set	0x0C, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%f26
	nop
	set	0x10, %o3
	ldstub	[%l7 + %o3],	%g5
	st	%fsr,	[%l7 + 0x48]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%i1
	set	0x10, %l4
	stha	%i4,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x68, %o1
	stx	%l1,	[%l7 + %o1]
	nop
	set	0x36, %g3
	ldsb	[%l7 + %g3],	%i2
	nop
	set	0x1A, %i4
	lduh	[%l7 + %i4],	%i5
	set	0x19, %g6
	ldstuba	[%l7 + %g6] 0x88,	%l2
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	nop
	set	0x68, %l0
	stw	%o7,	[%l7 + %l0]
	nop
	set	0x76, %o6
	lduh	[%l7 + %o6],	%g4
	set	0x5C, %g7
	lda	[%l7 + %g7] 0x80,	%f28
	st	%f22,	[%l7 + 0x1C]
	set	0x66, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o3
	nop
	set	0x18, %o2
	stx	%o2,	[%l7 + %o2]
	nop
	set	0x44, %g1
	sth	%o5,	[%l7 + %g1]
	nop
	set	0x5E, %o7
	ldsh	[%l7 + %o7],	%o6
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%i6
	fpadd32	%f26,	%f22,	%f16
	nop
	set	0x5C, %l3
	swap	[%l7 + %l3],	%g7
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f0
	set	0x38, %o0
	stda	%i6,	[%l7 + %o0] 0x80
	nop
	set	0x68, %o4
	ldsb	[%l7 + %o4],	%g3
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xca
	set	0x48, %g2
	stxa	%l5,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x28, %l2
	std	%f0,	[%l7 + %l2]
	nop
	set	0x20, %l1
	stw	%g6,	[%l7 + %l1]
	nop
	set	0x70, %i1
	lduw	[%l7 + %i1],	%g2
	add	%g1,	%o1,	%l4
	or	%l0,	%i0,	%i3
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%l6
	or	%l3,	%g5,	%o4
	set	0x45, %i5
	stba	%i4,	[%l7 + %i5] 0x80
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%i2
	nop
	set	0x44, %l6
	ldub	[%l7 + %l6],	%i1
	nop
	set	0x08, %i7
	swap	[%l7 + %i7],	%l2
	nop
	set	0x77, %g5
	ldub	[%l7 + %g5],	%o0
	nop
	set	0x50, %i3
	stx	%i5,	[%l7 + %i3]
	nop
	set	0x6C, %o3
	lduw	[%l7 + %o3],	%g4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%o3
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f2
	nop
	set	0x60, %o1
	std	%f14,	[%l7 + %o1]
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%o4
	set	0x38, %i4
	stxa	%o2,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x0C, %g4
	prefetch	[%l7 + %g4],	 4
	nop
	set	0x6D, %l0
	ldsb	[%l7 + %l0],	%o6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f16
	nop
	set	0x30, %g6
	std	%f10,	[%l7 + %g6]
	set	0x58, %i2
	stda	%g6,	[%l7 + %i2] 0x81
	set	0x74, %g7
	stwa	%i7,	[%l7 + %g7] 0x80
	set	0x7C, %g1
	stwa	%i6,	[%l7 + %g1] 0xeb
	membar	#Sync
	set	0x3F, %o7
	stba	%l5,	[%l7 + %o7] 0x81
	set	0x74, %o2
	stwa	%g6,	[%l7 + %o2] 0x80
	nop
	set	0x10, %i6
	stw	%g3,	[%l7 + %i6]
	set	0x48, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	nop
	set	0x4C, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x5B, %o4
	ldstub	[%l7 + %o4],	%o1
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x6A, %o0
	ldsh	[%l7 + %o0],	%l4
	nop
	set	0x34, %l5
	swap	[%l7 + %l5],	%g1
	nop
	set	0x78, %g2
	std	%f8,	[%l7 + %g2]
	nop
	set	0x70, %l1
	stw	%l0,	[%l7 + %l1]
	set	0x6C, %i1
	swapa	[%l7 + %i1] 0x81,	%i3
	nop
	set	0x4C, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x30, %i5
	stx	%i0,	[%l7 + %i5]
	set	0x40, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l3
	st	%fsr,	[%l7 + 0x64]
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x80,	%l6
	nop
	set	0x28, %i7
	stw	%g5,	[%l7 + %i7]
	set	0x10, %g5
	stha	%i4,	[%l7 + %g5] 0x88
	set	0x08, %o3
	stxa	%l1,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x81,	%f4
	ld	[%l7 + 0x44],	%f11
	nop
	set	0x40, %i3
	stx	%i2,	[%l7 + %i3]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd0,	%f0
	set	0x48, %i4
	stda	%i0,	[%l7 + %i4] 0x80
	nop
	set	0x60, %o1
	std	%f24,	[%l7 + %o1]
	st	%f27,	[%l7 + 0x7C]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x66, %g4
	sth	%o4,	[%l7 + %g4]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%i5
	set	0x48, %l0
	stxa	%o0,	[%l7 + %l0] 0xea
	membar	#Sync
	wr	%o7,	%g4,	%set_softint
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	set	0x1C, %g6
	stwa	%o3,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%o6
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x80,	 1
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf1
	membar	#Sync
	set	0x70, %g1
	stxa	%i7,	[%l7 + %g1] 0x80
	set	0x08, %o2
	ldxa	[%l7 + %o2] 0x81,	%l5
	nop
	set	0x48, %i6
	std	%f8,	[%l7 + %i6]
	nop
	set	0x20, %i0
	swap	[%l7 + %i0],	%g6
	nop
	set	0x2C, %o7
	lduw	[%l7 + %o7],	%g3
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f8
	set	0x70, %l3
	stda	%i6,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x89,	%f16
	set	0x0C, %g2
	swapa	[%l7 + %g2] 0x88,	%o1
	add	%g2,	%g1,	%l4
	set	0x5C, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l0
	nop
	set	0x5D, %o0
	ldsb	[%l7 + %o0],	%i0
	set	0x2E, %l2
	stha	%l3,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x5E, %i1
	lduh	[%l7 + %i1],	%l6
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f26
	bleu,a,pn	%xcc,	loop_128
	nop
	set	0x4A, %o5
	stb	%i3,	[%l7 + %o5]
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x88,	%i4
loop_128:
	nop
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0
	set	0x0E, %o3
	ldstuba	[%l7 + %o3] 0x81,	%l1
	nop
	set	0x5C, %i7
	swap	[%l7 + %i7],	%i2
	set	0x4C, %l4
	stwa	%o4,	[%l7 + %l4] 0xea
	membar	#Sync
	add	%i1,	%l2,	%o0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%i5
	set	0x24, %i3
	sta	%f30,	[%l7 + %i3] 0x81
	nop
	set	0x76, %g3
	ldstub	[%l7 + %g3],	%o5
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%o3
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%g4
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f0
	fpsub16	%f28,	%f16,	%f10
	nop
	set	0x25, %i4
	ldub	[%l7 + %i4],	%o2
	nop
	set	0x2A, %o6
	lduh	[%l7 + %o6],	%o6
	nop
	set	0x40, %g6
	std	%i6,	[%l7 + %g6]
	add	%l5,	%g6,	%g3
	set	0x57, %g7
	stba	%i6,	[%l7 + %g7] 0x88
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x81,	 2
	nop
	set	0x64, %i2
	stw	%g2,	[%l7 + %i2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x58, %o2
	stx	%fsr,	[%l7 + %o2]
	st	%f31,	[%l7 + 0x20]
	set	0x1E, %i6
	stha	%l4,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x10, %i0
	std	%f8,	[%l7 + %i0]
	nop
	set	0x4C, %o4
	lduh	[%l7 + %o4],	%i0
	set	0x28, %l3
	stwa	%l3,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x5C, %l5
	ldsw	[%l7 + %l5],	%l6
	nop
	set	0x40, %g2
	std	%f26,	[%l7 + %g2]
	nop
	set	0x76, %o7
	lduh	[%l7 + %o7],	%i3
	nop
	set	0x60, %o0
	std	%l0,	[%l7 + %o0]
	set	0x40, %l1
	swapa	[%l7 + %l1] 0x80,	%g5
	nop
	set	0x28, %i1
	ldsb	[%l7 + %i1],	%l1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%i2
	set	0x58, %l2
	stda	%o4,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x88,	 1
	nop
	set	0x0E, %l6
	sth	%l2,	[%l7 + %l6]
	nop
	set	0x18, %o5
	swap	[%l7 + %o5],	%o7
	st	%fsr,	[%l7 + 0x6C]
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x88,	%f8
	nop
	set	0x68, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x10, %l4
	ldda	[%l7 + %l4] 0xeb,	%o0
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x81,	 3
	nop
	set	0x3A, %g3
	ldstub	[%l7 + %g3],	%o3
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%o2
	set	0x20, %i3
	lda	[%l7 + %i3] 0x89,	%f11
	ld	[%l7 + 0x08],	%f12
	nop
	set	0x20, %g4
	std	%o6,	[%l7 + %g4]
	set	0x7C, %o1
	stba	%g4,	[%l7 + %o1] 0xea
	membar	#Sync
	and	%l5,	%i7,	%g3
	set	0x50, %i4
	stxa	%g6,	[%l7 + %i4] 0x80
	nop
	set	0x7E, %l0
	stb	%o1,	[%l7 + %l0]
	nop
	set	0x68, %g6
	std	%f28,	[%l7 + %g6]
	nop
	set	0x4C, %g7
	lduh	[%l7 + %g7],	%i6
	bgu,pn	%icc,	loop_129
	and	%g1,	%g2,	%l4
	nop
	set	0x60, %o6
	ldub	[%l7 + %o6],	%g7
	set	0x54, %i2
	stwa	%i0,	[%l7 + %i2] 0xe2
	membar	#Sync
loop_129:
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%l3
	nop
	set	0x2E, %g1
	sth	%i3,	[%l7 + %g1]
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe2,	%l0
	nop
	nop
	setx	0x64A9C7AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x04A92CEF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f23,	%f24
	nop
	set	0x0A, %o4
	ldstub	[%l7 + %o4],	%l6
	nop
	set	0x28, %l3
	std	%f6,	[%l7 + %l3]
	nop
	set	0x50, %i6
	lduw	[%l7 + %i6],	%l1
	st	%fsr,	[%l7 + 0x54]
	set	0x68, %l5
	lda	[%l7 + %l5] 0x81,	%f9
	bge	%xcc,	loop_130
	nop
	set	0x48, %g2
	std	%g4,	[%l7 + %g2]
	add	%i4,	%i2,	%i1
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x81,	%o4
loop_130:
	add	%l2,	%o7,	%o0
	nop
	set	0x68, %l1
	std	%i4,	[%l7 + %l1]
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xcc
	set	0x0F, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o3
	nop
	set	0x60, %l2
	stb	%o2,	[%l7 + %l2]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%g4
	wr	%l5,	%i7,	%ccr
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe2,	%g2
	nop
	set	0x36, %o5
	ldsb	[%l7 + %o5],	%o6
	nop
	set	0x27, %i5
	ldub	[%l7 + %i5],	%g6
	nop
	set	0x0C, %o3
	ldub	[%l7 + %o3],	%i6
	set	0x0C, %l4
	swapa	[%l7 + %l4] 0x89,	%g1
	set	0x60, %g5
	stda	%o0,	[%l7 + %g5] 0x89
	nop
	set	0x3C, %g3
	stb	%g2,	[%l7 + %g3]
	set	0x6C, %i7
	swapa	[%l7 + %i7] 0x80,	%l4
	set	0x10, %i3
	stwa	%i0,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x78, %g4
	lduh	[%l7 + %g4],	%l3
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%f14
	nop
	set	0x40, %l0
	stx	%g7,	[%l7 + %l0]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%l0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l1
	nop
	set	0x7C, %o1
	swap	[%l7 + %o1],	%g5
	nop
	set	0x58, %g7
	sth	%i4,	[%l7 + %g7]
	fpsub16s	%f10,	%f14,	%f7
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x2C, %g6
	lduh	[%l7 + %g6],	%l2
	set	0x7A, %i2
	stba	%i2,	[%l7 + %i2] 0x88
	nop
	set	0x32, %o2
	ldsh	[%l7 + %o2],	%o0
	add	%i5,	%o7,	%o2
	set	0x28, %o6
	stda	%o4,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x40, %g1
	ldxa	[%l7 + %g1] 0x89,	%o3
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x88,	%l5
	fpadd32s	%f13,	%f8,	%f13
	add	%i7,	%g4,	%g3
	set	0x08, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0
	set	0x5C, %i6
	swapa	[%l7 + %i6] 0x80,	%i6
	and	%o6,	%o1,	%g2
	nop
	set	0x32, %l5
	sth	%g1,	[%l7 + %l5]
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x10, %l3
	lda	[%l7 + %l3] 0x89,	%f1
	ld	[%l7 + 0x54],	%f17
	nop
	set	0x69, %l1
	ldstub	[%l7 + %l1],	%i0
	st	%fsr,	[%l7 + 0x30]
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x88,	 0
	nop
	set	0x24, %o0
	lduw	[%l7 + %o0],	%l4
	and	%i3,	%l0,	%l6
	set	0x48, %o7
	stxa	%g7,	[%l7 + %o7] 0x81
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x80,	%l1
	set	0x58, %o5
	stda	%g4,	[%l7 + %o5] 0x80
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x10, %l2
	swap	[%l7 + %l2],	%o4
	set	0x3A, %o3
	ldstuba	[%l7 + %o3] 0x81,	%i2
	wr	%o0,	%i5,	%pic
	nop
	set	0x2C, %l4
	swap	[%l7 + %l4],	%l2
	set	0x58, %i5
	stda	%o2,	[%l7 + %i5] 0x89
	set	0x30, %g3
	ldda	[%l7 + %g3] 0xe3,	%o6
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f0
	fpadd16	%f20,	%f14,	%f2
	st	%f16,	[%l7 + 0x64]
	nop
	set	0x62, %i3
	lduh	[%l7 + %i3],	%o5
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f16
	st	%fsr,	[%l7 + 0x08]
	set	0x60, %i4
	stda	%l4,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x4A, %l0
	sth	%i7,	[%l7 + %l0]
	nop
	set	0x0E, %o1
	stb	%g4,	[%l7 + %o1]
	set	0x1C, %g5
	ldstuba	[%l7 + %g5] 0x80,	%g3
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x89,	%o2
	set	0x12, %i2
	stba	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f6
	nop
	set	0x20, %o6
	stw	%o6,	[%l7 + %o6]
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%g6
	nop
	set	0x60, %g1
	std	%f30,	[%l7 + %g1]
	set	0x25, %i0
	stba	%o1,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%g1
	nop
	set	0x7C, %i6
	stb	%g2,	[%l7 + %i6]
	or	%i0,	%l3,	%l4
	nop
	set	0x24, %g2
	stw	%l0,	[%l7 + %g2]
	nop
	set	0x56, %l5
	sth	%i3,	[%l7 + %l5]
	set	0x40, %l1
	stda	%i6,	[%l7 + %l1] 0xe2
	membar	#Sync
	fpadd16s	%f17,	%f28,	%f25
	st	%fsr,	[%l7 + 0x4C]
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc2
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xe3,	%l0
	ld	[%l7 + 0x2C],	%f31
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xd2,	%f0
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x18, %o5
	lda	[%l7 + %o5] 0x80,	%f11
	nop
	set	0x59, %l2
	stb	%g5,	[%l7 + %l2]
	st	%f28,	[%l7 + 0x0C]
	nop
	set	0x32, %l6
	lduh	[%l7 + %l6],	%i4
	nop
	set	0x7C, %o3
	lduw	[%l7 + %o3],	%g7
	nop
	set	0x22, %l4
	sth	%i1,	[%l7 + %l4]
	set	0x30, %g3
	sta	%f30,	[%l7 + %g3] 0x81
	nop
	set	0x58, %i5
	ldsw	[%l7 + %i5],	%o4
	nop
	set	0x1E, %i3
	ldsb	[%l7 + %i3],	%i2
	nop
	set	0x0A, %i7
	ldsh	[%l7 + %i7],	%i5
	set	0x5C, %i4
	stwa	%l2,	[%l7 + %i4] 0x89
	nop
	set	0x7E, %l0
	sth	%o0,	[%l7 + %l0]
	nop
	set	0x50, %o1
	stx	%o7,	[%l7 + %o1]
	nop
	set	0x1C, %g4
	swap	[%l7 + %g4],	%o5
	nop
	set	0x4C, %g7
	ldub	[%l7 + %g7],	%l5
	set	0x68, %g5
	sta	%f27,	[%l7 + %g5] 0x89
	or	%i7,	%o2,	%g4
	nop
	set	0x28, %o2
	ldsw	[%l7 + %o2],	%o3
	set	0x30, %i2
	ldxa	[%l7 + %i2] 0x80,	%i6
	nop
	set	0x4C, %g6
	lduw	[%l7 + %g6],	%o6
	nop
	set	0x48, %g1
	ldsw	[%l7 + %g1],	%g3
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x81,	%g6
	nop
	set	0x40, %o6
	std	%f12,	[%l7 + %o6]
	set	0x74, %i6
	lda	[%l7 + %i6] 0x81,	%f21
	st	%f3,	[%l7 + 0x30]
	set	0x08, %o4
	lda	[%l7 + %o4] 0x80,	%f9
	nop
	set	0x54, %l5
	stw	%g1,	[%l7 + %l5]
	nop
	set	0x52, %g2
	lduh	[%l7 + %g2],	%g2
	nop
	set	0x18, %i1
	swap	[%l7 + %i1],	%o1
	nop
	set	0x18, %l3
	stx	%i0,	[%l7 + %l3]
	nop
	set	0x2F, %l1
	ldub	[%l7 + %l1],	%l4
	nop
	set	0x7C, %o0
	stw	%l3,	[%l7 + %o0]
	or	%l0,	%i3,	%l1
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%g5
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%l6
	ld	[%l7 + 0x14],	%f17
	nop
	set	0x28, %o3
	std	%g6,	[%l7 + %o3]
	nop
	set	0x08, %l4
	std	%i0,	[%l7 + %l4]
	set	0x10, %l6
	lda	[%l7 + %l6] 0x80,	%f22
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd2,	%f0
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x81,	 2
	nop
	set	0x74, %i7
	lduw	[%l7 + %i7],	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%i5
	set	0x38, %i3
	stha	%o0,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x18, %i4
	ldsh	[%l7 + %i4],	%o7
	nop
	set	0x64, %o1
	lduw	[%l7 + %o1],	%l2
	nop
	nop
	setx	0xA096C3F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xBCE6B131,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f13,	%f27
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%l4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf8
	membar	#Sync
	bn	%xcc,	loop_131
	nop
	set	0x58, %g5
	ldd	[%l7 + %g5],	%f22
	nop
	set	0x31, %o2
	stb	%i7,	[%l7 + %o2]
	nop
	set	0x44, %i2
	lduh	[%l7 + %i2],	%o5
loop_131:
	nop
	set	0x28, %g7
	stda	%o2,	[%l7 + %g7] 0x88
	fpsub32s	%f4,	%f27,	%f23
	nop
	set	0x38, %g6
	stw	%o3,	[%l7 + %g6]
	set	0x38, %i0
	stxa	%i6,	[%l7 + %i0] 0xea
	membar	#Sync
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%g3
	nop
	set	0x53, %g1
	ldstub	[%l7 + %g1],	%g4
	nop
	set	0x48, %o6
	stb	%g6,	[%l7 + %o6]
	set	0x6A, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g2
	nop
	set	0x48, %i6
	ldd	[%l7 + %i6],	%f10
	set	0x28, %l5
	stxa	%o1,	[%l7 + %l5] 0x80
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x88,	%g0
	nop
	set	0x68, %l3
	ldsw	[%l7 + %l3],	%i0
	set	0x74, %g2
	swapa	[%l7 + %g2] 0x89,	%l4
	nop
	set	0x2D, %o0
	ldub	[%l7 + %o0],	%l0
	set	0x68, %l1
	stxa	%i3,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x1E, %o7
	lduh	[%l7 + %o7],	%l3
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x89,	%l0
	set	0x30, %o3
	sta	%f5,	[%l7 + %o3] 0x89
	set	0x20, %l4
	stxa	%l6,	[%l7 + %l4] 0xe3
	membar	#Sync
	fpsub16s	%f14,	%f8,	%f10
	nop
	set	0x78, %l6
	ldsw	[%l7 + %l6],	%g5
	fpsub16	%f18,	%f18,	%f4
	set	0x4C, %i5
	lda	[%l7 + %i5] 0x81,	%f1
	nop
	set	0x68, %g3
	stx	%i1,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x68, %o5
	lduh	[%l7 + %o5],	%i4
	st	%fsr,	[%l7 + 0x28]
	and	%o4,	%i2,	%i5
	set	0x4A, %i7
	stha	%o0,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%l2
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x78, %i4
	ldsb	[%l7 + %i4],	%l5
	set	0x62, %o1
	stha	%g7,	[%l7 + %o1] 0xea
	membar	#Sync
	add	%o5,	%o2,	%i7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f0
	set	0x48, %l0
	swapa	[%l7 + %l0] 0x81,	%i6
	nop
	set	0x1E, %g4
	ldsh	[%l7 + %g4],	%o6
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xd2
	nop
	set	0x08, %o2
	ldub	[%l7 + %o2],	%g3
	and	%o3,	%g6,	%g4
	or	%o1,	%g2,	%i0
	wr	%l4,	%l0,	%ccr
	nop
	set	0x14, %i2
	swap	[%l7 + %i2],	%i3
	nop
	set	0x28, %g6
	std	%l2,	[%l7 + %g6]
	or	%l1,	%l6,	%g5
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%g1
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x78, %g1
	ldsh	[%l7 + %g1],	%i4
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x89,	%i1
	wr	%o4,	%i2,	%sys_tick
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xe2,	%i4
	nop
	set	0x2A, %o4
	sth	%o0,	[%l7 + %o4]
	wr	%o7,	%l2,	%sys_tick
	bgu	%xcc,	loop_132
	nop
	set	0x78, %i1
	lduw	[%l7 + %i1],	%g7
	nop
	set	0x74, %l5
	stw	%o5,	[%l7 + %l5]
	set	0x50, %l3
	sta	%f11,	[%l7 + %l3] 0x80
loop_132:
	nop
	set	0x10, %g2
	ldda	[%l7 + %g2] 0xe2,	%l4
	add	%i7,	%o2,	%i6
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x24, %o0
	stw	%o6,	[%l7 + %o0]
	nop
	set	0x2D, %l1
	ldsb	[%l7 + %l1],	%o3
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x80,	%g3
	st	%f23,	[%l7 + 0x28]
	nop
	set	0x48, %o3
	ldx	[%l7 + %o3],	%g6
	nop
	set	0x78, %l2
	prefetch	[%l7 + %l2],	 3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%g2
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%i0
	st	%f15,	[%l7 + 0x70]
	bleu,a,pt	%icc,	loop_133
	fpadd32s	%f28,	%f27,	%f9
	and	%l4,	%o1,	%i3
	be,a,pn	%xcc,	loop_134
loop_133:
	nop
	set	0x6D, %i5
	ldub	[%l7 + %i5],	%l3
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
loop_134:
	nop
	set	0x42, %o5
	stb	%l1,	[%l7 + %o5]
	wr	%l0,	%g5,	%sys_tick
	nop
	set	0x60, %i7
	swap	[%l7 + %i7],	%l6
	set	0x30, %l6
	sta	%f29,	[%l7 + %l6] 0x88
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc8
	nop
	set	0x68, %i4
	stx	%i4,	[%l7 + %i4]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%i1
	nop
	set	0x3E, %l0
	ldsh	[%l7 + %l0],	%i2
	or	%o4,	%o0,	%o7
	nop
	set	0x14, %g4
	stw	%l2,	[%l7 + %g4]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0xe2,	%i4
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xeb,	%o4
	or	%l5,	%i7,	%o2
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f22
	fpadd16	%f28,	%f18,	%f30
	or	%i6,	%g7,	%o3
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0
	set	0x78, %i2
	stda	%g2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x32, %i0
	ldsh	[%l7 + %i0],	%g6
	or	%g2,	%g4,	%l4
	wr	%o1,	%i3,	%sys_tick
	nop
	set	0x38, %g1
	lduw	[%l7 + %g1],	%l3
	fpsub32	%f24,	%f14,	%f10
	nop
	set	0x58, %o6
	ldsb	[%l7 + %o6],	%l1
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f0
	nop
	set	0x61, %i6
	ldstub	[%l7 + %i6],	%l0
	set	0x09, %i1
	ldstuba	[%l7 + %i1] 0x81,	%i0
	nop
	set	0x4A, %o4
	ldstub	[%l7 + %o4],	%l6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%g1
	set	0x70, %l5
	ldxa	[%l7 + %l5] 0x88,	%g5
	fpsub32s	%f11,	%f29,	%f8
	set	0x1C, %g2
	swapa	[%l7 + %g2] 0x89,	%i1
	nop
	set	0x3E, %o0
	lduh	[%l7 + %o0],	%i2
	set	0x0C, %l3
	stwa	%o4,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x0C, %l1
	stwa	%o7,	[%l7 + %l1] 0x81
	set	0x14, %o7
	stwa	%o0,	[%l7 + %o7] 0x80
	nop
	set	0x78, %o3
	sth	%i5,	[%l7 + %o3]
	nop
	set	0x1C, %l2
	ldsw	[%l7 + %l2],	%o5
	nop
	set	0x60, %l4
	stx	%l2,	[%l7 + %l4]
	wr	%l5,	%i7,	%y
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%i6
	nop
	set	0x20, %o5
	std	%g6,	[%l7 + %o5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%o6
	and	%g3,	%g6,	%g2
	set	0x1C, %i7
	sta	%f17,	[%l7 + %i7] 0x81
	nop
	set	0x7C, %g3
	ldsw	[%l7 + %g3],	%g4
	set	0x72, %l6
	stba	%o2,	[%l7 + %l6] 0x80
	nop
	set	0x74, %i4
	ldsh	[%l7 + %i4],	%l4
	or	%i3,	%l3,	%l1
	nop
	set	0x34, %o1
	lduw	[%l7 + %o1],	%o1
	nop
	set	0x4F, %l0
	ldstub	[%l7 + %l0],	%i0
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f0
	nop
	set	0x68, %i3
	std	%l0,	[%l7 + %i3]
	nop
	set	0x23, %o2
	stb	%i4,	[%l7 + %o2]
	nop
	set	0x28, %g4
	stx	%l6,	[%l7 + %g4]
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f20
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x80,	 3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%f0
	nop
	set	0x0C, %o6
	stw	%i1,	[%l7 + %o6]
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i2
	set	0x28, %i6
	swapa	[%l7 + %i6] 0x81,	%o4
	nop
	set	0x30, %i1
	std	%g4,	[%l7 + %i1]
	nop
	set	0x69, %g6
	ldsb	[%l7 + %g6],	%o7
	set	0x50, %l5
	ldxa	[%l7 + %l5] 0x89,	%o0
	and	%i5,	%l2,	%l5
	nop
	set	0x4C, %o4
	ldstub	[%l7 + %o4],	%o5
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%i6
	nop
	set	0x40, %g2
	swap	[%l7 + %g2],	%i6
	set	0x66, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o3
	set	0x6C, %l3
	stba	%o6,	[%l7 + %l3] 0x88
	add	%g7,	%g3,	%g2
	set	0x44, %o3
	swapa	[%l7 + %o3] 0x89,	%g4
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%g6
	add	%o2,	%l4,	%i3
	set	0x19, %l2
	stba	%l1,	[%l7 + %l2] 0x88
	nop
	set	0x6A, %i5
	lduh	[%l7 + %i5],	%l3
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x5E, %l4
	ldsh	[%l7 + %l4],	%i0
	nop
	set	0x4E, %i7
	lduh	[%l7 + %i7],	%o1
	set	0x78, %o5
	stda	%i4,	[%l7 + %o5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x30, %l6
	ldsb	[%l7 + %l6],	%l6
	set	0x68, %g3
	lda	[%l7 + %g3] 0x88,	%f31
	set	0x74, %o1
	lda	[%l7 + %o1] 0x80,	%f9
	ld	[%l7 + 0x58],	%f7
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%l0
	set	0x60, %i4
	stxa	%i1,	[%l7 + %i4] 0x81
	ld	[%l7 + 0x38],	%f29
	set	0x61, %i3
	stba	%i2,	[%l7 + %i3] 0x81
	nop
	set	0x60, %g5
	ldx	[%l7 + %g5],	%o4
	ld	[%l7 + 0x54],	%f1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%g5
	nop
	set	0x24, %o2
	stw	%o7,	[%l7 + %o2]
	ld	[%l7 + 0x3C],	%f14
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%o0
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x89,	%i5
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%l2
	ld	[%l7 + 0x24],	%f25
	nop
	set	0x78, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x4C, %g7
	swap	[%l7 + %g7],	%o5
	fpadd16	%f2,	%f22,	%f28
	set	0x58, %i2
	sta	%f31,	[%l7 + %i2] 0x89
	or	%i7,	%l5,	%i6
	set	0x20, %i6
	ldxa	[%l7 + %i6] 0x88,	%o6
	wr	%g7,	%g3,	%set_softint
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x81,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g6
	bg,pt	%icc,	loop_135
	nop
	set	0x48, %g6
	ldx	[%l7 + %g6],	%g4
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	add	%o2,	%l4,	%i3
loop_135:
	nop
	set	0x50, %o4
	stxa	%l1,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f22
	bleu,a	%icc,	loop_136
	st	%f23,	[%l7 + 0x70]
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%i0
	st	%f15,	[%l7 + 0x20]
loop_136:
	nop
	set	0x70, %l1
	sta	%f20,	[%l7 + %l1] 0x81
	nop
	set	0x7B, %l3
	stb	%l3,	[%l7 + %l3]
	nop
	set	0x68, %o7
	sth	%o1,	[%l7 + %o7]
	nop
	set	0x34, %l2
	swap	[%l7 + %l2],	%i4
	ble,pn	%xcc,	loop_137
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x08, %l4
	std	%l0,	[%l7 + %l4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%l6
loop_137:
	nop
	set	0x24, %o3
	stw	%i2,	[%l7 + %o3]
	nop
	set	0x14, %i7
	prefetch	[%l7 + %i7],	 4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd0,	%f0
	set	0x08, %l6
	stxa	%o4,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x08, %g3
	std	%g0,	[%l7 + %g3]
	set	0x58, %o1
	stda	%g4,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f16
	nop
	nop
	setx	0x45D9CD6843473740,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x85B94EB3BE142362,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f20,	%f8
	set	0x28, %i4
	stxa	%o7,	[%l7 + %i4] 0x89
	nop
	set	0x46, %g5
	ldsb	[%l7 + %g5],	%o0
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	nop
	set	0x18, %o2
	sth	%i5,	[%l7 + %o2]
	nop
	set	0x68, %g4
	stx	%l2,	[%l7 + %g4]
	nop
	set	0x10, %i0
	std	%f22,	[%l7 + %i0]
	nop
	set	0x0A, %g1
	sth	%i7,	[%l7 + %g1]
	nop
	set	0x40, %g7
	stx	%o5,	[%l7 + %g7]
	add	%i6,	%l5,	%g7
	and	%g3,	%o3,	%g2
	nop
	set	0x43, %i2
	stb	%g6,	[%l7 + %i2]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%o2
	set	0x20, %i6
	stda	%l4,	[%l7 + %i6] 0x80
	set	0x08, %o6
	prefetcha	[%l7 + %o6] 0x81,	 1
	st	%fsr,	[%l7 + 0x70]
	and	%g4,	%i0,	%l3
	set	0x08, %g6
	stwa	%l1,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f8
	st	%fsr,	[%l7 + 0x78]
	set	0x64, %o4
	swapa	[%l7 + %o4] 0x88,	%o1
	nop
	set	0x09, %i1
	stb	%i4,	[%l7 + %i1]
	nop
	set	0x20, %o0
	std	%l0,	[%l7 + %o0]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x81
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x89
	nop
	set	0x70, %g2
	std	%f2,	[%l7 + %g2]
	set	0x50, %o7
	lda	[%l7 + %o7] 0x81,	%f23
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%i2
	fpsub16s	%f12,	%f16,	%f17
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf9
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%i6
	nop
	set	0x44, %o3
	lduh	[%l7 + %o3],	%o4
	nop
	set	0x3C, %l4
	stb	%g1,	[%l7 + %l4]
	nop
	set	0x42, %i7
	ldstub	[%l7 + %i7],	%g5
	set	0x20, %l6
	sta	%f22,	[%l7 + %l6] 0x88
	nop
	set	0x6C, %o5
	swap	[%l7 + %o5],	%o0
	st	%f7,	[%l7 + 0x6C]
	nop
	set	0x6C, %o1
	ldsw	[%l7 + %o1],	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i7
	nop
	set	0x08, %g3
	std	%o4,	[%l7 + %g3]
	nop
	set	0x50, %l0
	stw	%i6,	[%l7 + %l0]
	set	0x24, %i4
	stwa	%l5,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x14, %i3
	ldstub	[%l7 + %i3],	%l2
	set	0x42, %o2
	ldstuba	[%l7 + %o2] 0x88,	%g7
	nop
	set	0x4C, %g4
	lduh	[%l7 + %g4],	%g3
	nop
	set	0x53, %g5
	ldub	[%l7 + %g5],	%o3
	or	%g2,	%g6,	%o2
	nop
	set	0x1C, %i0
	lduh	[%l7 + %i0],	%l4
	nop
	set	0x48, %g1
	std	%f4,	[%l7 + %g1]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xda
	set	0x50, %g7
	stxa	%o6,	[%l7 + %g7] 0x89
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%g4
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xe2,	%i2
	add	%i0,	%l1,	%l3
	nop
	set	0x64, %l5
	stw	%i4,	[%l7 + %l5]
	nop
	set	0x28, %o6
	swap	[%l7 + %o6],	%o1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x57, %i1
	stb	%i1,	[%l7 + %i1]
	ba,a,pn	%xcc,	loop_138
	add	%i2,	%l6,	%l0
	ld	[%l7 + 0x30],	%f4
	add	%g1,	%g5,	%o0
loop_138:
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%o4
	and	%o7,	%i5,	%o5
	or	%i7,	%l5,	%i6
	nop
	set	0x18, %o0
	ldsw	[%l7 + %o0],	%g7
	and	%g3,	%o3,	%l2
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0
	st	%fsr,	[%l7 + 0x1C]
	set	0x10, %l3
	lda	[%l7 + %l3] 0x81,	%f4
	set	0x70, %g2
	stda	%g6,	[%l7 + %g2] 0x80
	set	0x18, %o7
	stxa	%l4,	[%l7 + %o7] 0x81
	set	0x20, %l2
	stda	%o6,	[%l7 + %l2] 0x81
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%o2
	set	0x40, %i5
	stwa	%i3,	[%l7 + %i5] 0xe3
	membar	#Sync
	nop
	set	0x54, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x40, %l6
	lduw	[%l7 + %l6],	%g4
	wr	%l1,	%l3,	%set_softint
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x89,	%i0
	fpadd16	%f22,	%f10,	%f28
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f16
	set	0x30, %g3
	stda	%i0,	[%l7 + %g3] 0x89
	nop
	set	0x16, %l0
	ldub	[%l7 + %l0],	%i2
	ld	[%l7 + 0x7C],	%f29
	nop
	set	0x28, %i4
	swap	[%l7 + %i4],	%l0
	nop
	set	0x30, %o1
	stx	%g1,	[%l7 + %o1]
	nop
	set	0x20, %o2
	std	%f0,	[%l7 + %o2]
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xd8
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x40, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x74, %g5
	prefetch	[%l7 + %g5],	 0
	nop
	set	0x60, %g1
	std	%f24,	[%l7 + %g1]
	set	0x68, %i0
	stwa	%o4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x44, %i2
	lduh	[%l7 + %i2],	%o7
	set	0x60, %i6
	sta	%f9,	[%l7 + %i6] 0x89
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%i5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%i7
	set	0x68, %l5
	prefetcha	[%l7 + %l5] 0x81,	 2
	nop
	set	0x20, %g7
	std	%f26,	[%l7 + %g7]
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x60, %o4
	ldsw	[%l7 + %o4],	%l5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f16
	set	0x34, %o6
	sta	%f24,	[%l7 + %o6] 0x88
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	st	%fsr,	[%l7 + 0x48]
	set	0x74, %g2
	lda	[%l7 + %g2] 0x89,	%f23
	set	0x48, %l3
	stxa	%i6,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x1C, %l2
	lduw	[%l7 + %l2],	%g3
	nop
	set	0x68, %o3
	stx	%o3,	[%l7 + %o3]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f0
	add	%g7,	%l2,	%g2
	nop
	set	0x64, %i5
	lduh	[%l7 + %i5],	%g6
	set	0x58, %l6
	stda	%o6,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%l4
	set	0x0A, %i7
	stba	%i3,	[%l7 + %i7] 0xeb
	membar	#Sync
	set	0x73, %o5
	stba	%g4,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x20, %g3
	stx	%o2,	[%l7 + %g3]
	set	0x38, %l0
	stda	%l0,	[%l7 + %l0] 0x80
	nop
	set	0x48, %o1
	stw	%l3,	[%l7 + %o1]
	set	0x54, %o2
	stha	%i4,	[%l7 + %o2] 0x89
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%i1
	ld	[%l7 + 0x38],	%f31
	set	0x2E, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i2
	set	0x25, %i3
	ldstuba	[%l7 + %i3] 0x88,	%i0
	nop
	set	0x78, %i4
	std	%f12,	[%l7 + %i4]
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	nop
	setx	0xD9824C4F5EE0D8C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE56E8CD1AD75E345,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f10,	%f26
	nop
	set	0x0E, %i0
	ldsh	[%l7 + %i0],	%g1
	ld	[%l7 + 0x44],	%f4
	set	0x08, %i2
	stxa	%l6,	[%l7 + %i2] 0x81
	nop
	set	0x28, %g1
	std	%f26,	[%l7 + %g1]
	nop
	set	0x30, %i6
	stw	%o0,	[%l7 + %i6]
	nop
	set	0x60, %l5
	stb	%l0,	[%l7 + %l5]
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x89,	 0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x88
	set	0x34, %g6
	swapa	[%l7 + %g6] 0x80,	%i5
	set	0x4C, %o4
	sta	%f1,	[%l7 + %o4] 0x88
	ld	[%l7 + 0x7C],	%f24
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xeb,	%o4
	set	0x44, %o6
	stha	%o5,	[%l7 + %o6] 0x80
	add	%g5,	%i7,	%l5
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x80,	%f19
	nop
	set	0x7C, %l3
	swap	[%l7 + %l3],	%i6
	set	0x58, %l2
	ldxa	[%l7 + %l2] 0x81,	%o3
	set	0x54, %o3
	sta	%f23,	[%l7 + %o3] 0x89
	nop
	set	0x08, %g2
	ldsh	[%l7 + %g2],	%g7
	fpadd16s	%f2,	%f14,	%f14
	add	%g3,	%g2,	%l2
	set	0x48, %o7
	stxa	%g6,	[%l7 + %o7] 0x88
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%i3
	st	%fsr,	[%l7 + 0x24]
	st	%f11,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%g4
	bl	%xcc,	loop_139
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%o6
	nop
	set	0x79, %i5
	ldub	[%l7 + %i5],	%l1
	nop
	set	0x68, %o5
	std	%l2,	[%l7 + %o5]
loop_139:
	ld	[%l7 + 0x0C],	%f11
	set	0x28, %g3
	stxa	%i4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%o1
	set	0x0C, %i7
	sta	%f18,	[%l7 + %i7] 0x88
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o2,	%i1
	nop
	set	0x10, %o2
	ldsw	[%l7 + %o2],	%i2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%i0
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%l6
	set	0x18, %o1
	stba	%l0,	[%l7 + %o1] 0x89
	set	0x3C, %i4
	lda	[%l7 + %i4] 0x89,	%f23
	set	0x08, %g5
	stda	%o6,	[%l7 + %g5] 0x89
	st	%fsr,	[%l7 + 0x70]
	bl,a	%xcc,	loop_140
	nop
	set	0x6C, %i0
	stw	%i5,	[%l7 + %i0]
	nop
	set	0x2E, %i3
	ldsh	[%l7 + %i3],	%o0
	ld	[%l7 + 0x3C],	%f31
loop_140:
	nop
	set	0x64, %i2
	ldsw	[%l7 + %i2],	%o5
	nop
	set	0x62, %g1
	ldsb	[%l7 + %g1],	%g5
	fpsub32s	%f10,	%f10,	%f11
	nop
	set	0x48, %l5
	std	%i6,	[%l7 + %l5]
	nop
	set	0x14, %g7
	ldsb	[%l7 + %g7],	%l5
	nop
	set	0x10, %i1
	ldsw	[%l7 + %i1],	%i6
	set	0x5E, %i6
	stha	%o3,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x2B, %g6
	ldstuba	[%l7 + %g6] 0x81,	%g7
	or	%o4,	%g3,	%g2
	nop
	set	0x60, %o0
	stb	%g6,	[%l7 + %o0]
	nop
	set	0x44, %o6
	lduw	[%l7 + %o6],	%l2
	nop
	set	0x1C, %o4
	stb	%l4,	[%l7 + %o4]
	set	0x5F, %l3
	stba	%g4,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x08, %l2
	ldx	[%l7 + %l2],	%o6
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x88,	%i3
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%l1
	set	0x10, %o7
	stwa	%i4,	[%l7 + %o7] 0xea
	membar	#Sync
	ld	[%l7 + 0x60],	%f21
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%l3
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x89,	%o2
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x24, %l6
	sth	%i2,	[%l7 + %l6]
	nop
	set	0x60, %i5
	stx	%g1,	[%l7 + %i5]
	nop
	set	0x74, %l4
	lduh	[%l7 + %l4],	%i1
	set	0x7C, %o5
	lda	[%l7 + %o5] 0x89,	%f16
	set	0x40, %l0
	stwa	%l6,	[%l7 + %l0] 0x88
	nop
	set	0x18, %g3
	ldx	[%l7 + %g3],	%i0
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%l0
	set	0x17, %o2
	stba	%i5,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x67, %g4
	stb	%o7,	[%l7 + %g4]
	and	%o5,	%o0,	%g5
	nop
	set	0x4C, %i4
	swap	[%l7 + %i4],	%i7
	nop
	set	0x36, %g5
	lduh	[%l7 + %g5],	%i6
	add	%o3,	%g7,	%o4
	set	0x60, %i0
	stxa	%g3,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x40, %o1
	stda	%l4,	[%l7 + %o1] 0x89
	nop
	set	0x20, %i2
	std	%f12,	[%l7 + %i2]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xcc
	nop
	set	0x08, %l5
	sth	%g2,	[%l7 + %l5]
	nop
	set	0x1F, %g1
	stb	%l2,	[%l7 + %g1]
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f22
	ld	[%l7 + 0x60],	%f1
	set	0x2C, %g7
	stwa	%g6,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x64, %g6
	sta	%f29,	[%l7 + %g6] 0x88
	nop
	set	0x18, %o0
	sth	%g4,	[%l7 + %o0]
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f4
	fpadd32	%f28,	%f16,	%f0
	set	0x6C, %o4
	sta	%f5,	[%l7 + %o4] 0x89
	nop
	set	0x2C, %i6
	swap	[%l7 + %i6],	%l4
	add	%i3,	%l1,	%i4
	set	0x0B, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o6
	nop
	set	0x30, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x40, %o3
	std	%f10,	[%l7 + %o3]
	nop
	set	0x22, %g2
	ldub	[%l7 + %g2],	%o1
	set	0x4E, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o2
	nop
	set	0x68, %l6
	lduh	[%l7 + %l6],	%i2
	nop
	set	0x1A, %l1
	sth	%l3,	[%l7 + %l1]
	nop
	set	0x7A, %l4
	ldub	[%l7 + %l4],	%i1
	nop
	set	0x3C, %o5
	swap	[%l7 + %o5],	%l6
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%g0
	set	0x3C, %g3
	sta	%f6,	[%l7 + %g3] 0x81
	nop
	set	0x28, %l0
	std	%i0,	[%l7 + %l0]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd8,	%f16
	nop
	set	0x60, %o2
	ldx	[%l7 + %o2],	%l0
	nop
	set	0x1C, %i4
	ldsh	[%l7 + %i4],	%o7
	nop
	set	0x7C, %g4
	stw	%o5,	[%l7 + %g4]
	add	%o0,	%i5,	%i7
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x78, %g5
	lduw	[%l7 + %g5],	%i6
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x89,	 1
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x89,	%o3
	nop
	set	0x40, %o1
	ldsh	[%l7 + %o1],	%o4
	wr	%g3,	%l5,	%pic
	nop
	set	0x37, %g1
	ldub	[%l7 + %g1],	%g2
	and	%l2,	%g7,	%g4
	nop
	set	0x34, %i1
	ldsb	[%l7 + %i1],	%l4
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%i2
	nop
	set	0x48, %g7
	stx	%g6,	[%l7 + %g7]
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x80,	%i4
	set	0x20, %o0
	lda	[%l7 + %o0] 0x81,	%f9
	nop
	set	0x22, %o4
	ldsh	[%l7 + %o4],	%l1
	nop
	set	0x0E, %i6
	lduh	[%l7 + %i6],	%o6
	nop
	set	0x18, %o6
	ldub	[%l7 + %o6],	%o1
	nop
	set	0x37, %l2
	ldub	[%l7 + %l2],	%i2
	nop
	set	0x14, %l3
	stw	%o2,	[%l7 + %l3]
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x89,	%f30
	and	%i1,	%l3,	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%l6
	or	%l0,	%o5,	%o0
	set	0x10, %o3
	stda	%i4,	[%l7 + %o3] 0x89
	nop
	set	0x3E, %l6
	ldsb	[%l7 + %l6],	%o7
	set	0x58, %o7
	ldxa	[%l7 + %o7] 0x80,	%i7
	or	%i6,	%o3,	%g5
	set	0x23, %l1
	ldstuba	[%l7 + %l1] 0x81,	%g3
	st	%fsr,	[%l7 + 0x14]
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x88,	 3
	nop
	set	0x50, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	nop
	set	0x1C, %l4
	stw	%g2,	[%l7 + %l4]
	nop
	set	0x70, %l0
	lduw	[%l7 + %l0],	%l5
	bg,pt	%xcc,	loop_141
	nop
	set	0x68, %i7
	ldstub	[%l7 + %i7],	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%l4
loop_141:
	nop
	set	0x50, %o2
	ldsw	[%l7 + %o2],	%g4
	nop
	set	0x78, %g4
	ldsb	[%l7 + %g4],	%i3
	set	0x30, %i4
	swapa	[%l7 + %i4] 0x89,	%g6
	set	0x78, %g5
	stda	%l0,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x4C, %i0
	stw	%o6,	[%l7 + %i0]
	nop
	set	0x58, %i3
	ldsw	[%l7 + %i3],	%o1
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%i2
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%f12
	set	0x08, %g1
	stwa	%i4,	[%l7 + %g1] 0xea
	membar	#Sync
	st	%f17,	[%l7 + 0x3C]
	nop
	set	0x79, %l5
	stb	%i1,	[%l7 + %l5]
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%o2
	and	%g1,	%i0,	%l3
	nop
	set	0x10, %g7
	stx	%l0,	[%l7 + %g7]
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%l6
	set	0x0C, %o4
	swapa	[%l7 + %o4] 0x88,	%o0
	nop
	set	0x4A, %o0
	ldsb	[%l7 + %o0],	%i5
	nop
	set	0x2E, %i6
	ldub	[%l7 + %i6],	%o7
	set	0x10, %l2
	swapa	[%l7 + %l2] 0x81,	%o5
	set	0x6F, %o6
	stba	%i7,	[%l7 + %o6] 0x89
	set	0x44, %g2
	stwa	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x31, %l3
	ldstuba	[%l7 + %l3] 0x80,	%o3
	st	%f25,	[%l7 + 0x7C]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xc0
	nop
	set	0x3A, %o3
	ldsh	[%l7 + %o3],	%g3
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x89,	%o4
	nop
	set	0x62, %o7
	lduh	[%l7 + %o7],	%g2
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f26
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%l2
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f6
	st	%f12,	[%l7 + 0x14]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g7,	%l4
	st	%fsr,	[%l7 + 0x18]
	set	0x08, %g3
	ldxa	[%l7 + %g3] 0x89,	%g5
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%g4
	and	%i3,	%l1,	%o6
	set	0x30, %o2
	ldda	[%l7 + %o2] 0xe2,	%g6
	nop
	set	0x5C, %l0
	lduw	[%l7 + %l0],	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i2,	%i4
	nop
	set	0x70, %i4
	std	%i0,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x68]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x88,	%f0
	wr	%g1,	%i0,	%softint
	set	0x36, %g5
	stha	%l3,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x2A, %i3
	lduh	[%l7 + %i3],	%o2
	add	%l6,	%l0,	%o0
	nop
	set	0x40, %i0
	swap	[%l7 + %i0],	%i5
	set	0x58, %i2
	stda	%o4,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x3A, %g1
	lduh	[%l7 + %g1],	%i7
	nop
	set	0x78, %o1
	stb	%i6,	[%l7 + %o1]
	nop
	set	0x4D, %i1
	stb	%o7,	[%l7 + %i1]
	nop
	set	0x48, %g7
	sth	%o3,	[%l7 + %g7]
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd0
	nop
	set	0x08, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x40, %o0
	ldx	[%l7 + %o0],	%o4
	nop
	set	0x38, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%g2
	ld	[%l7 + 0x28],	%f31
	ld	[%l7 + 0x38],	%f30
	nop
	set	0x34, %o6
	stw	%g3,	[%l7 + %o6]
	nop
	set	0x74, %l2
	lduw	[%l7 + %l2],	%l5
	nop
	set	0x20, %l3
	lduh	[%l7 + %l3],	%l2
	nop
	set	0x3A, %l6
	ldsh	[%l7 + %l6],	%l4
	set	0x78, %o3
	lda	[%l7 + %o3] 0x81,	%f3
	nop
	set	0x64, %l1
	ldsb	[%l7 + %l1],	%g5
	and	%g4,	%g7,	%i3
	set	0x20, %o7
	stda	%l0,	[%l7 + %o7] 0x88
	nop
	set	0x48, %o5
	lduw	[%l7 + %o5],	%o6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%i1
	or	%i4,	%i0,	%g1
	nop
	set	0x70, %i5
	stw	%l3,	[%l7 + %i5]
	nop
	set	0x6C, %g3
	swap	[%l7 + %g3],	%o2
	nop
	set	0x57, %g2
	stb	%l6,	[%l7 + %g2]
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x81,	%o0
	or	%i5,	%l0,	%o5
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f28
	set	0x40, %l0
	stxa	%i6,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x52, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i7
	nop
	set	0x7E, %g4
	stb	%o3,	[%l7 + %g4]
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xeb,	%o6
	set	0x38, %i3
	stxa	%o4,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x20, %i4
	swap	[%l7 + %i4],	%g3
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x88,	%l5
	nop
	set	0x6D, %g1
	ldsb	[%l7 + %g1],	%l2
	st	%f7,	[%l7 + 0x78]
	set	0x30, %i2
	sta	%f10,	[%l7 + %i2] 0x89
	nop
	set	0x60, %o1
	lduw	[%l7 + %o1],	%l4
	nop
	set	0x14, %i1
	ldub	[%l7 + %i1],	%g2
	set	0x7C, %g7
	stwa	%g5,	[%l7 + %g7] 0xe3
	membar	#Sync
	add	%g4,	%i3,	%g7
	set	0x1C, %g6
	stwa	%l1,	[%l7 + %g6] 0xe2
	membar	#Sync
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f0
	nop
	set	0x4A, %o4
	ldub	[%l7 + %o4],	%o6
	nop
	set	0x68, %o0
	lduw	[%l7 + %o0],	%o1
	wr	%g6,	%i2,	%ccr
	or	%i4,	%i0,	%i1
	nop
	set	0x58, %i6
	std	%l2,	[%l7 + %i6]
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%g0
	set	0x08, %l3
	swapa	[%l7 + %l3] 0x89,	%o2
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x6C, %l6
	lduw	[%l7 + %l6],	%o0
	set	0x5C, %o6
	sta	%f17,	[%l7 + %o6] 0x80
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%l6
	nop
	set	0x70, %l1
	ldx	[%l7 + %l1],	%i5
	set	0x16, %o5
	stha	%o5,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x0C, %i5
	sta	%f9,	[%l7 + %i5] 0x81
	nop
	set	0x3E, %o7
	sth	%i6,	[%l7 + %o7]
	ld	[%l7 + 0x20],	%f9
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x80,	%l0
	nop
	set	0x30, %g3
	prefetch	[%l7 + %g3],	 4
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x70, %l4
	stx	%o3,	[%l7 + %l4]
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%o7
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x80,	%o4
	st	%f1,	[%l7 + 0x5C]
	set	0x50, %i7
	sta	%f2,	[%l7 + %i7] 0x80
	nop
	set	0x28, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x78, %g5
	stda	%g2,	[%l7 + %g5] 0xeb
	membar	#Sync
	wr	%l5,	%i7,	%softint
	ld	[%l7 + 0x48],	%f17
	nop
	set	0x1A, %i3
	sth	%l4,	[%l7 + %i3]
	and	%l2,	%g5,	%g2
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%i3
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x88,	 4
	nop
	set	0x38, %i0
	swap	[%l7 + %i0],	%l1
	set	0x18, %i2
	stda	%o6,	[%l7 + %i2] 0xeb
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%g4
	nop
	set	0x28, %i1
	stw	%g6,	[%l7 + %i1]
	set	0x24, %g7
	stwa	%i4,	[%l7 + %g7] 0x89
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%i2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x88,	%i0
	nop
	set	0x74, %o1
	ldsh	[%l7 + %o1],	%l3
	bne,pn	%xcc,	loop_142
	st	%f13,	[%l7 + 0x60]
	nop
	set	0x2D, %o0
	ldub	[%l7 + %o0],	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%g1
loop_142:
	nop
	set	0x58, %i6
	stha	%l6,	[%l7 + %i6] 0x89
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%o0
	nop
	set	0x1C, %l2
	prefetch	[%l7 + %l2],	 1
	or	%o5,	%i6,	%l0
	set	0x30, %l6
	stha	%i5,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x16, %l3
	sth	%o7,	[%l7 + %l3]
	set	0x78, %o3
	ldxa	[%l7 + %o3] 0x88,	%o3
	nop
	set	0x10, %o6
	std	%f2,	[%l7 + %o6]
	set	0x77, %l1
	stba	%o4,	[%l7 + %l1] 0x80
	set	0x30, %i5
	prefetcha	[%l7 + %i5] 0x89,	 2
	or	%l5,	%i7,	%l4
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x80,	 0
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x2E, %o7
	ldsh	[%l7 + %o7],	%l2
	nop
	nop
	setx	0x505D43B343AE6E12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x878A91DC1BEDD972,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f12
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x89
	nop
	set	0x30, %g3
	ldsh	[%l7 + %g3],	%i3
	set	0x1C, %l0
	swapa	[%l7 + %l0] 0x80,	%g2
	nop
	set	0x24, %o2
	stw	%g7,	[%l7 + %o2]
	nop
	set	0x54, %g4
	sth	%l1,	[%l7 + %g4]
	nop
	set	0x3C, %g5
	lduw	[%l7 + %g5],	%o1
	or	%g4,	%g6,	%i4
	set	0x74, %i7
	swapa	[%l7 + %i7] 0x88,	%o6
	nop
	set	0x7B, %i3
	ldsb	[%l7 + %i3],	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%i2
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd8,	%f0
	and	%i0,	%g1,	%o2
	set	0x21, %i0
	ldstuba	[%l7 + %i0] 0x80,	%o0
	set	0x4E, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o5
	set	0x60, %i1
	stxa	%l6,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x59, %g7
	ldub	[%l7 + %g7],	%l0
	nop
	set	0x10, %g6
	std	%i6,	[%l7 + %g6]
	nop
	set	0x60, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	nop
	setx	0x61A4387A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xDBC6C788,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f14,	%f1
	nop
	set	0x60, %o1
	std	%i4,	[%l7 + %o1]
	nop
	set	0x30, %i4
	ldd	[%l7 + %i4],	%o6
	set	0x18, %i6
	stda	%o4,	[%l7 + %i6] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%i7
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x81,	 2
	nop
	set	0x5C, %l2
	ldstub	[%l7 + %l2],	%l2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g5,	%i3
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x81,	%g7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%o1
	set	0x79, %l3
	ldstuba	[%l7 + %l3] 0x81,	%l1
	set	0x3C, %o4
	ldstuba	[%l7 + %o4] 0x81,	%g6
	set	0x11, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g4
	set	0x30, %l1
	prefetcha	[%l7 + %l1] 0x80,	 3
	nop
	set	0x08, %i5
	std	%f26,	[%l7 + %i5]
	nop
	set	0x08, %o6
	ldstub	[%l7 + %o6],	%o6
	set	0x08, %g2
	stxa	%l3,	[%l7 + %g2] 0x89
	nop
	set	0x34, %o7
	lduw	[%l7 + %o7],	%i2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%i0
	set	0x3E, %l4
	stha	%o2,	[%l7 + %l4] 0x80
	fpsub32	%f10,	%f24,	%f6
	set	0x64, %g3
	sta	%f11,	[%l7 + %g3] 0x80
	set	0x62, %o5
	stha	%g1,	[%l7 + %o5] 0xe3
	membar	#Sync
	fpsub32	%f4,	%f22,	%f6
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%o0
	nop
	set	0x54, %g4
	stw	%l6,	[%l7 + %g4]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o5
	set	0x14, %l0
	lda	[%l7 + %l0] 0x81,	%f6
	st	%fsr,	[%l7 + 0x60]
	set	0x70, %g5
	ldxa	[%l7 + %g5] 0x88,	%i6
	nop
	set	0x4C, %i7
	prefetch	[%l7 + %i7],	 4
	add	%o7,	%o4,	%i5
	or	%g3,	%o3,	%i7
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%l4
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%l2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l5,	%i3
	st	%fsr,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x10, %g1
	stw	%g5,	[%l7 + %g1]
	set	0x70, %i2
	stxa	%g2,	[%l7 + %i2] 0x80
	set	0x08, %g7
	swapa	[%l7 + %g7] 0x89,	%o1
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%g6
	nop
	set	0x58, %l5
	stx	%l1,	[%l7 + %l5]
	nop
	set	0x58, %i1
	prefetch	[%l7 + %i1],	 0
	set	0x20, %o1
	ldda	[%l7 + %o1] 0x81,	%g6
	add	%g4,	%i4,	%o6
	st	%f24,	[%l7 + 0x78]
	set	0x60, %i4
	sta	%f23,	[%l7 + %i4] 0x88
	nop
	set	0x42, %o0
	lduh	[%l7 + %o0],	%l3
	nop
	set	0x1A, %l2
	lduh	[%l7 + %l2],	%i2
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%i1
	set	0x6C, %l3
	swapa	[%l7 + %l3] 0x81,	%i0
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	bge,a	%xcc,	loop_143
	wr	%o2,	%g1,	%ccr
	nop
	set	0x48, %o3
	swap	[%l7 + %o3],	%o0
	nop
	set	0x70, %o4
	stx	%l0,	[%l7 + %o4]
loop_143:
	or	%l6,	%i6,	%o5
	fpadd32	%f28,	%f22,	%f8
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x80,	 4
	nop
	set	0x6A, %l1
	ldub	[%l7 + %l1],	%i5
	set	0x34, %o6
	swapa	[%l7 + %o6] 0x81,	%o7
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x89,	 1
	set	0x14, %l4
	swapa	[%l7 + %l4] 0x89,	%g3
	nop
	set	0x40, %g2
	std	%f4,	[%l7 + %g2]
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	and	%l4,	%l2,	%l5
	nop
	set	0x20, %o2
	ldsb	[%l7 + %o2],	%i7
	fpadd32	%f10,	%f12,	%f6
	set	0x50, %o5
	stha	%g5,	[%l7 + %o5] 0x81
	nop
	set	0x70, %g4
	prefetch	[%l7 + %g4],	 4
	or	%g2,	%o1,	%g7
	nop
	set	0x78, %l0
	stw	%l1,	[%l7 + %l0]
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%i3
	set	0x78, %g5
	stha	%g6,	[%l7 + %g5] 0x88
	add	%i4,	%o6,	%l3
	nop
	set	0x19, %i0
	ldstub	[%l7 + %i0],	%i2
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%i0
	set	0x28, %i2
	lda	[%l7 + %i2] 0x81,	%f4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%g4
	set	0x60, %g6
	stda	%g0,	[%l7 + %g6] 0x88
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f26
	nop
	set	0x40, %l5
	swap	[%l7 + %l5],	%o2
	wr	%o0,	%l6,	%y
	add	%i6,	%l0,	%o5
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	or	%i5,	%o7,	%o3
	nop
	nop
	setx	0xAD2262E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x1574CC0B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f18,	%f13
	nop
	set	0x64, %i4
	swap	[%l7 + %i4],	%o4
	ld	[%l7 + 0x4C],	%f17
	nop
	set	0x68, %o0
	stx	%g3,	[%l7 + %o0]
	wr	%l2,	%l4,	%sys_tick
	nop
	set	0x28, %l2
	lduw	[%l7 + %l2],	%i7
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x80,	%g4
	nop
	nop
	setx	0x151B928D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xBA8DF349,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f1,	%f19
	nop
	set	0x28, %i6
	prefetch	[%l7 + %i6],	 3
	or	%g2,	%o1,	%g7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%l1
	add	%g6,	%i4,	%o6
	nop
	set	0x2C, %l6
	lduw	[%l7 + %l6],	%i3
	nop
	set	0x74, %o3
	ldub	[%l7 + %o3],	%l3
	nop
	set	0x7C, %o4
	stb	%i1,	[%l7 + %o4]
	nop
	set	0x56, %i5
	ldsh	[%l7 + %i5],	%i0
	nop
	set	0x40, %l1
	std	%g4,	[%l7 + %l1]
	set	0x20, %o7
	ldda	[%l7 + %o7] 0x81,	%i2
	nop
	set	0x2B, %l4
	ldub	[%l7 + %l4],	%g1
	set	0x1C, %g2
	stha	%o0,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x30, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x5E, %o2
	stba	%l6,	[%l7 + %o2] 0x88
	add	%o2,	%i6,	%o5
	nop
	set	0x52, %o5
	stb	%i5,	[%l7 + %o5]
	nop
	set	0x40, %o6
	stx	%o7,	[%l7 + %o6]
	fpadd32	%f8,	%f12,	%f2
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xe2,	%l0
	add	%o4,	%g3,	%o3
	nop
	set	0x10, %i7
	lduw	[%l7 + %i7],	%l2
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%i6
	fpsub32s	%f8,	%f18,	%f2
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%l4
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%g2
	nop
	set	0x12, %i0
	stb	%g5,	[%l7 + %i0]
	nop
	set	0x6D, %i2
	ldstub	[%l7 + %i2],	%o1
	nop
	set	0x28, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x54, %g1
	ldsh	[%l7 + %g1],	%l5
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x14, %l5
	swap	[%l7 + %l5],	%l1
	nop
	set	0x7E, %o1
	lduh	[%l7 + %o1],	%g7
	nop
	set	0x48, %i1
	std	%f10,	[%l7 + %i1]
	bgu,pt	%xcc,	loop_144
	bg,a,pt	%icc,	loop_145
	add	%i4,	%g6,	%i3
	or	%o6,	%i1,	%i0
loop_144:
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f2
loop_145:
	or	%l3,	%g4,	%g1
	ld	[%l7 + 0x30],	%f10
	set	0x50, %i4
	stwa	%o0,	[%l7 + %i4] 0x88
	bge,a	%icc,	loop_146
	nop
	set	0x71, %l2
	stb	%i2,	[%l7 + %l2]
	set	0x74, %i6
	sta	%f17,	[%l7 + %i6] 0x88
loop_146:
	or	%l6,	%o2,	%i6
	nop
	set	0x38, %l6
	std	%o4,	[%l7 + %l6]
	nop
	set	0x70, %o3
	lduw	[%l7 + %o3],	%o7
	set	0x18, %l3
	stda	%l0,	[%l7 + %l3] 0x89
	or	%o4,	%i5,	%g3
	nop
	set	0x62, %i5
	ldsh	[%l7 + %i5],	%l2
	nop
	set	0x2E, %o4
	lduh	[%l7 + %o4],	%o3
	set	0x60, %o7
	stda	%l4,	[%l7 + %o7] 0x81
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f0
	nop
	set	0x6C, %l1
	lduh	[%l7 + %l1],	%g2
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x81,	%g4
	nop
	set	0x44, %g3
	ldsw	[%l7 + %g3],	%o1
	set	0x46, %o5
	ldstuba	[%l7 + %o5] 0x89,	%i7
	set	0x47, %o6
	stba	%l5,	[%l7 + %o6] 0x81
	set	0x0A, %o2
	stha	%g7,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%l1
	nop
	set	0x68, %g4
	std	%f30,	[%l7 + %g4]
	set	0x18, %l0
	sta	%f11,	[%l7 + %l0] 0x88
	bge,a,pn	%icc,	loop_147
	nop
	set	0x73, %g5
	ldub	[%l7 + %g5],	%i3
	nop
	set	0x28, %i3
	ldsw	[%l7 + %i3],	%g6
	or	%i1,	%i0,	%l3
loop_147:
	nop
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x88,	 4
	wr	%g4,	%o0,	%set_softint
	or	%i2,	%g1,	%o2
	set	0x20, %i2
	stwa	%l6,	[%l7 + %i2] 0x81
	and	%i6,	%o7,	%l0
	nop
	set	0x57, %i7
	stb	%o4,	[%l7 + %i7]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd8
	nop
	set	0x53, %g6
	ldsb	[%l7 + %g6],	%o5
	nop
	set	0x08, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%f10
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x80,	%g3
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x5C, %o0
	lduh	[%l7 + %o0],	%i5
	set	0x10, %i4
	stba	%l2,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x10, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g5
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x7E, %l6
	lduh	[%l7 + %l6],	%o3
	set	0x50, %i6
	stda	%o0,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x34, %l3
	lduw	[%l7 + %l3],	%l5
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x89,	 4
	nop
	set	0x48, %o4
	lduw	[%l7 + %o4],	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%i3
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x89,	%g7
	or	%i1,	%i0,	%g6
	set	0x18, %l4
	ldstuba	[%l7 + %l4] 0x88,	%o6
	nop
	set	0x3C, %o7
	ldsh	[%l7 + %o7],	%g4
	nop
	set	0x4F, %l1
	ldsb	[%l7 + %l1],	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g1
	nop
	set	0x1C, %g3
	swap	[%l7 + %g3],	%l3
	ld	[%l7 + 0x48],	%f18
	nop
	set	0x6E, %o5
	lduh	[%l7 + %o5],	%o2
	or	%i6,	%o7,	%l6
	wr	%o4,	%l0,	%ccr
	nop
	set	0x30, %o6
	lduh	[%l7 + %o6],	%o5
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%i5
	st	%f9,	[%l7 + 0x1C]
	bg,pn	%icc,	loop_148
	nop
	set	0x48, %g2
	std	%l2,	[%l7 + %g2]
	set	0x54, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g3
loop_148:
	nop
	set	0x5C, %l0
	lda	[%l7 + %l0] 0x80,	%f29
	nop
	set	0x68, %i3
	prefetch	[%l7 + %i3],	 4
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x81,	%g2
	nop
	set	0x14, %i2
	prefetch	[%l7 + %i2],	 3
	set	0x14, %i7
	lda	[%l7 + %i7] 0x81,	%f31
	nop
	set	0x28, %g1
	swap	[%l7 + %g1],	%l4
	st	%fsr,	[%l7 + 0x08]
	set	0x30, %g6
	swapa	[%l7 + %g6] 0x89,	%g5
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%o3
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x89,	%o1
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f0
	nop
	set	0x08, %i1
	ldsb	[%l7 + %i1],	%i7
	set	0x24, %o0
	stwa	%l5,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xea,	%i4
	and	%l1,	%i3,	%i1
	set	0x38, %l2
	stwa	%i0,	[%l7 + %l2] 0xea
	membar	#Sync
	nop
	set	0x40, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x60, %l6
	sth	%g7,	[%l7 + %l6]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%o6
	st	%fsr,	[%l7 + 0x3C]
	set	0x58, %l3
	stxa	%g4,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%o0
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%g1
	fpadd32	%f4,	%f2,	%f4
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x89,	 1
	nop
	set	0x57, %i5
	ldstub	[%l7 + %i5],	%o2
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%i2
	set	0x48, %l1
	ldxa	[%l7 + %l1] 0x88,	%i6
	bne,a,pn	%xcc,	loop_149
	nop
	set	0x18, %g3
	lduw	[%l7 + %g3],	%l6
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%o4
	nop
	set	0x68, %o6
	lduw	[%l7 + %o6],	%o7
loop_149:
	nop
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xea,	%o4
	set	0x18, %g2
	stwa	%l0,	[%l7 + %g2] 0x89
	set	0x44, %g4
	swapa	[%l7 + %g4] 0x88,	%l2
	set	0x0E, %o2
	stha	%i5,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g2,	%g3
	nop
	set	0x18, %i3
	stx	%l4,	[%l7 + %i3]
	nop
	set	0x20, %g5
	std	%f10,	[%l7 + %g5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%o3
	nop
	set	0x6E, %i2
	stb	%o1,	[%l7 + %i2]
	nop
	set	0x60, %l0
	stw	%i7,	[%l7 + %l0]
	set	0x48, %g1
	stda	%i4,	[%l7 + %g1] 0x80
	nop
	set	0x78, %i7
	stb	%l5,	[%l7 + %i7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i1
	set	0x72, %g6
	stha	%i3,	[%l7 + %g6] 0x88
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x89,	%i0
	wr	%g6,	%o6,	%softint
	nop
	set	0x40, %g7
	stw	%g4,	[%l7 + %g7]
	set	0x5B, %l5
	stba	%g7,	[%l7 + %l5] 0xe3
	membar	#Sync
	st	%f3,	[%l7 + 0x10]
	set	0x40, %o0
	stxa	%g1,	[%l7 + %o0] 0x89
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x80,	%o0
	nop
	set	0x1C, %l2
	ldsb	[%l7 + %l2],	%l3
	nop
	set	0x7E, %i4
	ldub	[%l7 + %i4],	%i2
	set	0x58, %o1
	stda	%i6,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x48, %l3
	ldx	[%l7 + %l3],	%o2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x89
	nop
	set	0x68, %i6
	swap	[%l7 + %i6],	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o5
	nop
	set	0x20, %o4
	ldsh	[%l7 + %o4],	%l0
	nop
	set	0x66, %i5
	ldsb	[%l7 + %i5],	%o7
	set	0x08, %l4
	prefetcha	[%l7 + %l4] 0x81,	 4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1268
!	Type a   	: 32
!	Type cti   	: 26
!	Type x   	: 527
!	Type f   	: 42
!	Type i   	: 105
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
	set	0xD,	%g1
	set	0x4,	%g2
	set	0xB,	%g3
	set	0x9,	%g4
	set	0x1,	%g5
	set	0xD,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xA,	%i0
	set	-0xE,	%i1
	set	-0x0,	%i2
	set	-0x9,	%i3
	set	-0xA,	%i4
	set	-0x4,	%i5
	set	-0x0,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x68CBDA7D,	%l0
	set	0x48612B01,	%l1
	set	0x77835F10,	%l2
	set	0x1D7278CE,	%l3
	set	0x12F3113A,	%l4
	set	0x1EB2EDA3,	%l5
	set	0x26E77D4F,	%l6
	!# Output registers
	set	-0x1AA3,	%o0
	set	0x09F3,	%o1
	set	-0x0007,	%o2
	set	-0x0541,	%o3
	set	0x03E6,	%o4
	set	-0x1403,	%o5
	set	-0x1DE1,	%o6
	set	0x1ABE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	nop
	set	0x18, %l1
	lduh	[%l7 + %l1],	%i5
	nop
	set	0x10, %g3
	lduh	[%l7 + %g3],	%g3
	nop
	set	0x78, %o3
	std	%f0,	[%l7 + %o3]
	fpadd32	%f20,	%f14,	%f10
	set	0x5C, %o6
	stwa	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x16, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g5
	set	0x30, %g2
	stwa	%l4,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x78, %o7
	ldxa	[%l7 + %o7] 0x89,	%o3
	nop
	set	0x52, %g4
	ldub	[%l7 + %g4],	%o1
	nop
	set	0x38, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f6
	nop
	set	0x58, %i2
	stx	%i7,	[%l7 + %i2]
	set	0x20, %g5
	stha	%i4,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xeb,	%l4
	st	%f24,	[%l7 + 0x6C]
	ld	[%l7 + 0x44],	%f24
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%i3
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%g6
	st	%fsr,	[%l7 + 0x08]
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x89,	%o6
	and	%g4,	%g7,	%l1
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%f0
	nop
	set	0x78, %g6
	swap	[%l7 + %g6],	%o0
	nop
	set	0x68, %i0
	ldsw	[%l7 + %i0],	%l3
	set	0x4C, %l5
	stha	%g1,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f22
	nop
	set	0x1B, %g7
	ldstub	[%l7 + %g7],	%i6
	nop
	set	0x20, %i1
	ldsw	[%l7 + %i1],	%i2
	set	0x5C, %i4
	stba	%o4,	[%l7 + %i4] 0xe3
	membar	#Sync
	or	%o2,	%o5,	%l0
	st	%f10,	[%l7 + 0x74]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%g3
	nop
	nop
	setx	0x198FC0216BF47A2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA737E28B4B828EF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f10
	set	0x78, %o1
	sta	%f6,	[%l7 + %o1] 0x88
	add	%o7,	%g5,	%g2
	bge,pt	%icc,	loop_150
	or	%o3,	%o1,	%i7
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%l4
	or	%i4,	%l5,	%i1
loop_150:
	nop
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xc0
	st	%f19,	[%l7 + 0x54]
	nop
	set	0x14, %i6
	lduh	[%l7 + %i6],	%i3
	nop
	set	0x3E, %o4
	ldsh	[%l7 + %o4],	%i0
	nop
	set	0x40, %i5
	swap	[%l7 + %i5],	%g6
	and	%g4,	%o6,	%l1
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%g7
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%l2
	and	%o0,	%g1,	%i6
	nop
	set	0x6B, %g3
	stb	%i2,	[%l7 + %g3]
	nop
	set	0x15, %o3
	stb	%o4,	[%l7 + %o3]
	add	%o2,	%o5,	%l0
	ld	[%l7 + 0x08],	%f31
	set	0x72, %o6
	stha	%l2,	[%l7 + %o6] 0x80
	nop
	set	0x36, %o5
	lduh	[%l7 + %o5],	%i5
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x88,	%g3
	set	0x3C, %o7
	lda	[%l7 + %o7] 0x80,	%f9
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x89,	%i6
	nop
	nop
	setx	0xB58FFCE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x92F8684A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f26,	%f21
	nop
	set	0x6B, %g4
	stb	%g5,	[%l7 + %g4]
	wr	%o7,	%o3,	%ccr
	set	0x08, %o2
	stwa	%g2,	[%l7 + %o2] 0x88
	nop
	set	0x74, %i3
	stb	%i7,	[%l7 + %i3]
	or	%o1,	%l4,	%i4
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%i2
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x89,	%i0
	set	0x64, %i7
	sta	%f29,	[%l7 + %i7] 0x81
	nop
	set	0x54, %l0
	lduw	[%l7 + %l0],	%i1
	and	%g6,	%g4,	%l1
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f12
	and	%g7,	%o6,	%o0
	nop
	set	0x28, %l5
	stx	%l3,	[%l7 + %l5]
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x80,	%g0
	nop
	set	0x4D, %i0
	ldstub	[%l7 + %i0],	%i2
	set	0x64, %g7
	stwa	%o4,	[%l7 + %g7] 0x88
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%o5
	nop
	set	0x78, %i1
	stw	%i6,	[%l7 + %i1]
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0
	set	0x4E, %l2
	stba	%i5,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x48, %l3
	stda	%l0,	[%l7 + %l3] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%g3
	nop
	set	0x78, %i6
	std	%f2,	[%l7 + %i6]
	nop
	set	0x60, %o1
	swap	[%l7 + %o1],	%g5
	set	0x1C, %i5
	swapa	[%l7 + %i5] 0x80,	%o7
	and	%g2,	%o3,	%o1
	set	0x38, %o4
	sta	%f12,	[%l7 + %o4] 0x89
	st	%fsr,	[%l7 + 0x30]
	set	0x68, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xda,	%f16
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%l5
	nop
	set	0x28, %o3
	std	%f14,	[%l7 + %o3]
	nop
	set	0x74, %o6
	prefetch	[%l7 + %o6],	 4
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x81,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%i1
	nop
	set	0x4E, %o5
	lduh	[%l7 + %o5],	%i3
	set	0x50, %o7
	stxa	%g4,	[%l7 + %o7] 0xe3
	membar	#Sync
	add	%g6,	%l1,	%o6
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%g6
	nop
	set	0x1F, %g2
	ldub	[%l7 + %g2],	%o0
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x80,	 4
	st	%fsr,	[%l7 + 0x5C]
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x80,	 4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd8,	%f16
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%o4
	set	0x28, %g1
	stba	%o2,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x5B, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i2
	fpsub32	%f0,	%f12,	%f6
	nop
	set	0x20, %i2
	std	%i6,	[%l7 + %i2]
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x80,	%l2
	nop
	set	0x6D, %l5
	stb	%o5,	[%l7 + %l5]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l6
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g2
	set	0x1C, %i0
	swapa	[%l7 + %i0] 0x89,	%l0
	nop
	set	0x5A, %l0
	ldub	[%l7 + %l0],	%o7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g5,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%o3
	set	0x1C, %g7
	sta	%f12,	[%l7 + %g7] 0x80
	ld	[%l7 + 0x0C],	%f16
	nop
	set	0x1B, %i4
	ldstub	[%l7 + %i4],	%i7
	nop
	set	0x20, %i1
	std	%l4,	[%l7 + %i1]
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x60, %i6
	prefetch	[%l7 + %i6],	 4
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x3B, %o1
	ldsb	[%l7 + %o1],	%l5
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x81,	 1
	set	0x7D, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i0
	nop
	nop
	setx	0x7A9CBE85,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x46EF7D0C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f3,	%f20
	nop
	set	0x48, %o4
	stw	%i3,	[%l7 + %o4]
	st	%f26,	[%l7 + 0x4C]
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x81,	%i1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%l1
	nop
	set	0x08, %l6
	std	%f20,	[%l7 + %l6]
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%g4
	nop
	set	0x50, %o3
	stx	%g7,	[%l7 + %o3]
	nop
	set	0x13, %o5
	stb	%o6,	[%l7 + %o5]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f16
	nop
	set	0x23, %l4
	stb	%g1,	[%l7 + %l4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%o4
	wr	%l3,	%o2,	%clear_softint
	st	%fsr,	[%l7 + 0x60]
	st	%f29,	[%l7 + 0x50]
	nop
	set	0x42, %g2
	ldstub	[%l7 + %g2],	%i2
	nop
	set	0x38, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x58, %o2
	ldsw	[%l7 + %o2],	%i6
	nop
	set	0x75, %g4
	ldub	[%l7 + %g4],	%l2
	nop
	set	0x40, %i3
	ldsb	[%l7 + %i3],	%i5
	or	%l6,	%o5,	%l0
	nop
	set	0x40, %g1
	stw	%g3,	[%l7 + %g1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%g2
	set	0x64, %i7
	ldstuba	[%l7 + %i7] 0x88,	%o7
	add	%o3,	%o1,	%l4
	nop
	set	0x1A, %g5
	lduh	[%l7 + %g5],	%i7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x54, %g6
	ldsw	[%l7 + %g6],	%l5
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x89,	 4
	set	0x74, %o0
	ldstuba	[%l7 + %o0] 0x88,	%i3
	fpsub32	%f22,	%f26,	%f14
	set	0x4C, %l5
	swapa	[%l7 + %l5] 0x89,	%l1
	nop
	set	0x70, %i0
	ldsw	[%l7 + %i0],	%g6
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x20, %l0
	sta	%f30,	[%l7 + %l0] 0x80
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%g7
	or	%o6,	%o0,	%g1
	nop
	set	0x30, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd2
	nop
	set	0x3A, %o1
	stb	%o4,	[%l7 + %o1]
	set	0x48, %l2
	stwa	%i2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x64, %i5
	ldsh	[%l7 + %i5],	%o2
	nop
	set	0x66, %l3
	sth	%l2,	[%l7 + %l3]
	nop
	set	0x20, %l1
	ldsh	[%l7 + %l1],	%i6
	set	0x47, %o4
	ldstuba	[%l7 + %o4] 0x88,	%i5
	set	0x6C, %o6
	stwa	%o5,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x81,	%i6
	nop
	set	0x4F, %o3
	stb	%g3,	[%l7 + %o3]
	set	0x33, %o5
	ldstuba	[%l7 + %o5] 0x80,	%l0
	set	0x30, %l4
	stwa	%g5,	[%l7 + %l4] 0x88
	nop
	set	0x48, %g3
	swap	[%l7 + %g3],	%o7
	nop
	set	0x24, %o7
	prefetch	[%l7 + %o7],	 4
	nop
	set	0x20, %g2
	std	%o2,	[%l7 + %g2]
	st	%f30,	[%l7 + 0x24]
	nop
	set	0x2C, %o2
	ldub	[%l7 + %o2],	%o1
	set	0x18, %g4
	stda	%g2,	[%l7 + %g4] 0x81
	nop
	set	0x40, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x48, %g1
	swap	[%l7 + %g1],	%l4
	nop
	set	0x74, %i7
	ldsb	[%l7 + %i7],	%i4
	wr	%i0,	%i7,	%ccr
	nop
	set	0x48, %g6
	std	%f8,	[%l7 + %g6]
	nop
	set	0x10, %g5
	std	%f8,	[%l7 + %g5]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f8
	add	%l5,	%i1,	%l1
	nop
	set	0x7F, %l5
	stb	%i3,	[%l7 + %l5]
	nop
	set	0x6C, %i0
	prefetch	[%l7 + %i0],	 1
	set	0x0C, %g7
	stba	%g4,	[%l7 + %g7] 0x89
	nop
	set	0x61, %l0
	stb	%g6,	[%l7 + %l0]
	nop
	set	0x1E, %i2
	ldub	[%l7 + %i2],	%o6
	set	0x3E, %i1
	stha	%g7,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x40, %i4
	sta	%f7,	[%l7 + %i4] 0x81
	and	%o0,	%g1,	%l3
	set	0x7C, %i6
	sta	%f13,	[%l7 + %i6] 0x88
	nop
	set	0x08, %l2
	stw	%i2,	[%l7 + %l2]
	nop
	set	0x3A, %o1
	sth	%o4,	[%l7 + %o1]
	ld	[%l7 + 0x28],	%f28
	nop
	set	0x28, %l3
	lduh	[%l7 + %l3],	%l2
	nop
	set	0x18, %i5
	std	%f4,	[%l7 + %i5]
	or	%i6,	%i5,	%o2
	nop
	set	0x50, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%l6
	nop
	set	0x7C, %l1
	prefetch	[%l7 + %l1],	 0
	st	%f7,	[%l7 + 0x70]
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x81
	set	0x6C, %o3
	stha	%o5,	[%l7 + %o3] 0x88
	set	0x50, %l4
	ldda	[%l7 + %l4] 0x80,	%g2
	set	0x44, %o5
	stba	%g5,	[%l7 + %o5] 0x89
	set	0x60, %g3
	stxa	%l0,	[%l7 + %g3] 0xea
	membar	#Sync
	ld	[%l7 + 0x2C],	%f8
	nop
	set	0x5F, %g2
	ldub	[%l7 + %g2],	%o7
	nop
	set	0x52, %o2
	sth	%o1,	[%l7 + %o2]
	and	%g2,	%o3,	%l4
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x89,	%f5
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%i4
	set	0x50, %g4
	lda	[%l7 + %g4] 0x81,	%f12
	nop
	set	0x5C, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	set	0x0E, %g5
	stha	%i7,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x64, %o0
	stw	%i0,	[%l7 + %o0]
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f6
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f20
	nop
	set	0x74, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%l5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc0
	st	%f25,	[%l7 + 0x74]
	nop
	set	0x2A, %i1
	ldub	[%l7 + %i1],	%i1
	set	0x52, %i4
	stha	%l1,	[%l7 + %i4] 0xe3
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g4
	nop
	nop
	setx	0xEDE4521C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x269CBAB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f19,	%f16
	nop
	set	0x5C, %l0
	ldub	[%l7 + %l0],	%o6
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%g6
	set	0x59, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g7
	bne,pn	%icc,	loop_151
	add	%o0,	%g1,	%i2
	wr 	%g0, 	0x5, 	%fprs
	or	%l3,	%i5,	%i6
loop_151:
	nop
	set	0x18, %l2
	ldxa	[%l7 + %l2] 0x89,	%l6
	or	%o5,	%o2,	%g3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%o7
	ld	[%l7 + 0x50],	%f25
	nop
	set	0x29, %l3
	ldstub	[%l7 + %l3],	%g5
	nop
	set	0x74, %i5
	ldstub	[%l7 + %i5],	%o1
	st	%fsr,	[%l7 + 0x44]
	set	0x08, %o6
	stxa	%g2,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x0C, %o4
	ldsw	[%l7 + %o4],	%o3
	nop
	set	0x32, %l6
	ldstub	[%l7 + %l6],	%l4
	nop
	set	0x3B, %l1
	stb	%i4,	[%l7 + %l1]
	set	0x10, %l4
	stxa	%i0,	[%l7 + %l4] 0x81
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%i6
	and	%l5,	%l1,	%i3
	nop
	set	0x2C, %g3
	ldsh	[%l7 + %g3],	%i1
	bne,a	%icc,	loop_152
	nop
	set	0x40, %g2
	ldsh	[%l7 + %g2],	%o6
	set	0x10, %o2
	stda	%g6,	[%l7 + %o2] 0xe2
	membar	#Sync
loop_152:
	nop
	set	0x14, %o7
	prefetch	[%l7 + %o7],	 0
	fpsub32s	%f6,	%f4,	%f21
	nop
	set	0x10, %i3
	swap	[%l7 + %i3],	%g7
	nop
	set	0x4C, %o3
	lduh	[%l7 + %o3],	%g4
	add	%o0,	%i2,	%g1
	nop
	nop
	setx	0x5F3D297F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2A284AA7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f0,	%f18
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x89,	 3
	set	0x20, %g6
	stwa	%l3,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x48, %g5
	ldsw	[%l7 + %g5],	%o4
	nop
	set	0x20, %o0
	swap	[%l7 + %o0],	%i5
	nop
	set	0x68, %g4
	std	%f14,	[%l7 + %g4]
	add	%i6,	%l6,	%o5
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x81,	%o2
	fpsub16s	%f6,	%f28,	%f27
	set	0x52, %i7
	stha	%l0,	[%l7 + %i7] 0x81
	ble	%xcc,	loop_153
	nop
	set	0x68, %g7
	stx	%g3,	[%l7 + %g7]
	nop
	set	0x38, %i2
	std	%o6,	[%l7 + %i2]
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%g4
loop_153:
	nop
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf8,	%f0
	nop
	set	0x34, %l5
	lduw	[%l7 + %l5],	%o1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	set	0x54, %i6
	swapa	[%l7 + %i6] 0x88,	%i4
	nop
	set	0x20, %l0
	std	%f12,	[%l7 + %l0]
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xcc
	st	%f4,	[%l7 + 0x64]
	set	0x48, %o1
	lda	[%l7 + %o1] 0x81,	%f8
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xda,	%f16
	nop
	set	0x68, %o6
	ldd	[%l7 + %o6],	%f28
	nop
	set	0x1C, %i5
	lduh	[%l7 + %i5],	%i0
	nop
	set	0x3A, %l6
	ldsb	[%l7 + %l6],	%o3
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x81,	 1
	bne,pt	%icc,	loop_154
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%l1
	nop
	set	0x68, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%l5
loop_154:
	nop
	set	0x38, %g2
	std	%f28,	[%l7 + %g2]
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%i1
	nop
	set	0x40, %o7
	stx	%g6,	[%l7 + %o7]
	set	0x3C, %g3
	swapa	[%l7 + %g3] 0x80,	%o6
	and	%g4,	%o0,	%i2
	ld	[%l7 + 0x34],	%f25
	nop
	set	0x78, %i3
	stx	%g7,	[%l7 + %i3]
	set	0x39, %o3
	stba	%l2,	[%l7 + %o3] 0x80
	set	0x78, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g1
	nop
	set	0x4E, %g6
	ldsh	[%l7 + %g6],	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%i5
	nop
	set	0x28, %o0
	swap	[%l7 + %o0],	%i6
	nop
	set	0x21, %g4
	ldub	[%l7 + %g4],	%l6
	nop
	set	0x32, %g5
	sth	%o5,	[%l7 + %g5]
	ld	[%l7 + 0x78],	%f10
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x80,	 2
	nop
	set	0x34, %g7
	ldstub	[%l7 + %g7],	%l0
	set	0x64, %i0
	swapa	[%l7 + %i0] 0x81,	%g3
	nop
	set	0x78, %i1
	std	%o6,	[%l7 + %i1]
	nop
	set	0x66, %i2
	sth	%o1,	[%l7 + %i2]
	nop
	set	0x7C, %i4
	lduw	[%l7 + %i4],	%g2
	nop
	set	0x30, %i6
	ldx	[%l7 + %i6],	%g5
	nop
	set	0x40, %l0
	swap	[%l7 + %l0],	%l4
	nop
	set	0x34, %l2
	lduw	[%l7 + %l2],	%i4
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%i0
	or	%o3,	%i7,	%l1
	nop
	set	0x79, %l3
	stb	%i3,	[%l7 + %l3]
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%g6
	and	%o6,	%g4,	%i1
	set	0x68, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i2
	set	0x38, %l6
	stwa	%g7,	[%l7 + %l6] 0x88
	nop
	set	0x23, %o6
	stb	%o0,	[%l7 + %o6]
	set	0x2A, %o4
	stha	%g1,	[%l7 + %o4] 0x81
	and	%o4,	%l3,	%i5
	set	0x18, %o5
	stda	%i6,	[%l7 + %o5] 0x89
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	and	%l6,	%l2,	%o5
	set	0x50, %l1
	stha	%o2,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x30, %g2
	swap	[%l7 + %g2],	%l0
	nop
	set	0x28, %o2
	std	%f0,	[%l7 + %o2]
	nop
	set	0x3C, %g3
	lduh	[%l7 + %g3],	%g3
	nop
	set	0x58, %i3
	stw	%o1,	[%l7 + %i3]
	nop
	set	0x44, %o3
	lduw	[%l7 + %o3],	%g2
	nop
	set	0x10, %o7
	stx	%o7,	[%l7 + %o7]
	nop
	set	0x5C, %g1
	swap	[%l7 + %g1],	%l4
	set	0x2A, %o0
	stha	%i4,	[%l7 + %o0] 0x89
	set	0x36, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i0
	nop
	set	0x0E, %g6
	ldsh	[%l7 + %g6],	%g5
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f8
	set	0x28, %g7
	sta	%f6,	[%l7 + %g7] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%l1
	set	0x68, %g5
	sta	%f4,	[%l7 + %g5] 0x88
	nop
	set	0x40, %i1
	std	%f26,	[%l7 + %i1]
	set	0x18, %i2
	prefetcha	[%l7 + %i2] 0x80,	 0
	fpadd32	%f6,	%f12,	%f24
	nop
	set	0x43, %i4
	ldsb	[%l7 + %i4],	%i3
	nop
	set	0x77, %i6
	ldub	[%l7 + %i6],	%l5
	set	0x64, %i0
	sta	%f17,	[%l7 + %i0] 0x81
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x89,	 3
	set	0x66, %o1
	stba	%g4,	[%l7 + %o1] 0x80
	nop
	set	0x3C, %l2
	ldsw	[%l7 + %l2],	%i1
	and	%i2,	%g6,	%g7
	add	%o0,	%o4,	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%i6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB2B, 	%tick_cmpr
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%i5
	set	0x2A, %l3
	stha	%o2,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x40, %l6
	stx	%fsr,	[%l7 + %l6]
	and	%o5,	%g3,	%l0
	and	%g2,	%o1,	%o7
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf0
	membar	#Sync
	nop
	set	0x58, %o4
	swap	[%l7 + %o4],	%i4
	st	%fsr,	[%l7 + 0x68]
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f0
	and	%l4,	%g5,	%i7
	nop
	set	0x7C, %o5
	sth	%i0,	[%l7 + %o5]
	nop
	set	0x34, %l4
	ldsh	[%l7 + %l4],	%l1
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	set	0x14, %l1
	lda	[%l7 + %l1] 0x80,	%f1
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf8
	membar	#Sync
	set	0x54, %i3
	lda	[%l7 + %i3] 0x88,	%f16
	nop
	set	0x40, %o2
	lduh	[%l7 + %o2],	%o3
	nop
	set	0x2C, %o3
	stb	%l5,	[%l7 + %o3]
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%i2
	ld	[%l7 + 0x7C],	%f0
	fpadd32s	%f30,	%f11,	%f25
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%f12
	set	0x0F, %g4
	stba	%o6,	[%l7 + %g4] 0x89
	nop
	set	0x43, %g1
	stb	%g4,	[%l7 + %g1]
	set	0x60, %g6
	stda	%i2,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x30, %g7
	prefetcha	[%l7 + %g7] 0x81,	 1
	fpadd16s	%f10,	%f16,	%f19
	nop
	set	0x78, %g5
	std	%f8,	[%l7 + %g5]
	nop
	set	0x74, %i1
	ldstub	[%l7 + %i1],	%i1
	nop
	set	0x73, %i7
	ldstub	[%l7 + %i7],	%o0
	set	0x0E, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o4
	set	0x20, %i6
	stwa	%l3,	[%l7 + %i6] 0xea
	membar	#Sync
	ld	[%l7 + 0x7C],	%f16
	set	0x10, %i2
	lda	[%l7 + %i2] 0x80,	%f9
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%g0
	set	0x48, %i0
	swapa	[%l7 + %i0] 0x89,	%i6
	nop
	set	0x58, %o1
	ldsb	[%l7 + %o1],	%l6
	set	0x1D, %l2
	ldstuba	[%l7 + %l2] 0x81,	%l2
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f2
	set	0x68, %l5
	stxa	%g7,	[%l7 + %l5] 0x89
	nop
	set	0x54, %l6
	lduh	[%l7 + %l6],	%o2
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x81,	%i4
	set	0x40, %o6
	stda	%o4,	[%l7 + %o6] 0x80
	nop
	set	0x18, %i5
	ldstub	[%l7 + %i5],	%l0
	nop
	set	0x50, %o5
	prefetch	[%l7 + %o5],	 4
	set	0x14, %l4
	lda	[%l7 + %l4] 0x81,	%f22
	set	0x10, %g2
	stxa	%g2,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x4D, %g3
	ldub	[%l7 + %g3],	%o1
	nop
	nop
	setx	0xF9BF7187,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x3EF69B39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f7,	%f5
	add	%o7,	%i4,	%l4
	nop
	set	0x08, %i3
	ldsh	[%l7 + %i3],	%g5
	nop
	set	0x75, %o2
	ldstub	[%l7 + %o2],	%i7
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f0
	set	0x50, %o7
	stwa	%g3,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x30, %o0
	ldda	[%l7 + %o0] 0xe2,	%l0
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f26
	nop
	set	0x2E, %g4
	lduh	[%l7 + %g4],	%i0
	nop
	set	0x48, %g1
	std	%f16,	[%l7 + %g1]
	set	0x7C, %g7
	swapa	[%l7 + %g7] 0x81,	%o3
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x88,	%i3
	nop
	set	0x67, %g6
	ldub	[%l7 + %g6],	%l5
	st	%f18,	[%l7 + 0x68]
	set	0x2E, %i1
	stba	%g4,	[%l7 + %i1] 0x89
	and	%o6,	%i2,	%i1
	set	0x20, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o0
	set	0x18, %i4
	stda	%g6,	[%l7 + %i4] 0x88
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xc8
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%l2
	set	0x78, %l0
	stxa	%o4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x3C, %o1
	swap	[%l7 + %o1],	%i6
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	nop
	set	0x0E, %l2
	lduh	[%l7 + %l2],	%g1
	nop
	set	0x08, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x17, %l3
	ldsb	[%l7 + %l3],	%l6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCA6, 	%tick_cmpr
	nop
	set	0x6C, %l6
	prefetch	[%l7 + %l6],	 3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%o5
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x81,	 3
	nop
	set	0x60, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x46, %o5
	ldstub	[%l7 + %o5],	%g2
	set	0x38, %l4
	ldxa	[%l7 + %l4] 0x80,	%o2
	nop
	set	0x58, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	nop
	setx	0x2E913B19,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x4A88265A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f14,	%f6
	nop
	set	0x1D, %g3
	stb	%o7,	[%l7 + %g3]
	nop
	set	0x30, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%o1
	nop
	set	0x6C, %l1
	sth	%i4,	[%l7 + %l1]
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x89,	%l4
	set	0x77, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g5
	set	0x48, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%f2
	nop
	set	0x65, %g4
	ldub	[%l7 + %g4],	%l1
	bleu,a	%icc,	loop_155
	bleu	%icc,	loop_156
	nop
	set	0x1C, %g1
	swap	[%l7 + %g1],	%i0
	and	%g3,	%i3,	%l5
loop_155:
	nop
	set	0x48, %g7
	ldsw	[%l7 + %g7],	%g4
loop_156:
	nop
	set	0x38, %g6
	stda	%o6,	[%l7 + %g6] 0xe3
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%i1
	bg	%icc,	loop_157
	ld	[%l7 + 0x74],	%f7
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x89,	%i2
loop_157:
	nop
	set	0x40, %g5
	stda	%g6,	[%l7 + %g5] 0x88
	nop
	set	0x2C, %i4
	lduh	[%l7 + %i4],	%l3
	nop
	set	0x14, %i7
	lduw	[%l7 + %i7],	%o4
	wr	%i6,	%g1,	%clear_softint
	set	0x42, %i2
	stba	%o0,	[%l7 + %i2] 0x88
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f20
	st	%f30,	[%l7 + 0x28]
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xea,	%i6
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%l2
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%g7
	ld	[%l7 + 0x58],	%f31
	and	%i5,	%l0,	%g2
	nop
	set	0x40, %l2
	ldsb	[%l7 + %l2],	%o5
	nop
	set	0x66, %l5
	lduh	[%l7 + %l5],	%o7
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x80
	nop
	set	0x3E, %l6
	sth	%o1,	[%l7 + %l6]
	nop
	set	0x60, %o4
	lduw	[%l7 + %o4],	%o2
	set	0x68, %o5
	stxa	%i4,	[%l7 + %o5] 0x81
	and	%l4,	%g5,	%i7
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xd0
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f30
	nop
	set	0x78, %g2
	std	%f22,	[%l7 + %g2]
	nop
	set	0x58, %i5
	ldsw	[%l7 + %i5],	%i0
	set	0x56, %g3
	stha	%l1,	[%l7 + %g3] 0xea
	membar	#Sync
	wr	%i3,	%l5,	%pic
	ld	[%l7 + 0x50],	%f29
	nop
	set	0x55, %i3
	ldsb	[%l7 + %i3],	%g3
	nop
	set	0x30, %o2
	std	%o6,	[%l7 + %o2]
	set	0x30, %o7
	stwa	%o3,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x48, %o3
	lduw	[%l7 + %o3],	%g4
	nop
	set	0x32, %o0
	lduh	[%l7 + %o0],	%i2
	set	0x60, %l1
	ldda	[%l7 + %l1] 0xe3,	%g6
	st	%f25,	[%l7 + 0x7C]
	set	0x68, %g4
	swapa	[%l7 + %g4] 0x81,	%l3
	nop
	set	0x31, %g7
	ldstub	[%l7 + %g7],	%o4
	nop
	set	0x27, %g6
	ldstub	[%l7 + %g6],	%i1
	and	%i6,	%g1,	%o0
	set	0x50, %g1
	ldda	[%l7 + %g1] 0xe3,	%i6
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x89,	%l2
	fpadd16	%f30,	%f4,	%f28
	nop
	set	0x50, %i1
	swap	[%l7 + %i1],	%i5
	set	0x64, %i7
	sta	%f24,	[%l7 + %i7] 0x80
	nop
	set	0x30, %i2
	ldsh	[%l7 + %i2],	%l0
	or	%g7,	%o5,	%o7
	nop
	set	0x54, %i4
	ldsh	[%l7 + %i4],	%g2
	nop
	set	0x50, %i6
	std	%o2,	[%l7 + %i6]
	set	0x38, %o1
	stda	%i4,	[%l7 + %o1] 0x88
	nop
	set	0x10, %i0
	std	%f2,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x68]
	st	%f29,	[%l7 + 0x68]
	nop
	set	0x14, %l2
	lduh	[%l7 + %l2],	%l4
	wr	%o1,	%i7,	%softint
	nop
	set	0x0F, %l0
	ldstub	[%l7 + %l0],	%i0
	set	0x09, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g5
	nop
	set	0x18, %l5
	swap	[%l7 + %l5],	%l1
	nop
	set	0x58, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x5B, %o5
	ldstub	[%l7 + %o5],	%i3
	set	0x78, %o6
	stha	%l5,	[%l7 + %o6] 0xeb
	membar	#Sync
	set	0x43, %l4
	stba	%o6,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x7B, %o4
	stba	%g3,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x81,	%o3
	set	0x5C, %i3
	sta	%f18,	[%l7 + %i3] 0x89
	set	0x4A, %i5
	stba	%i2,	[%l7 + %i5] 0x89
	nop
	set	0x15, %o2
	ldub	[%l7 + %o2],	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g4
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x89,	%i0
	st	%f13,	[%l7 + 0x44]
	wr	%i6,	%o4,	%sys_tick
	wr	%o0,	%g1,	%set_softint
	set	0x24, %o0
	lda	[%l7 + %o0] 0x88,	%f23
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xd0
	nop
	set	0x6B, %g4
	ldub	[%l7 + %g4],	%l2
	nop
	set	0x7C, %o3
	ldsw	[%l7 + %o3],	%l6
	set	0x50, %g6
	stba	%l0,	[%l7 + %g6] 0x89
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc4
	or	%i5,	%o5,	%o7
	nop
	set	0x58, %g7
	ldsw	[%l7 + %g7],	%g2
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f4
	ble,a	%xcc,	loop_158
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%g7
	nop
	set	0x10, %i2
	std	%i4,	[%l7 + %i2]
	nop
	set	0x42, %i4
	stb	%o2,	[%l7 + %i4]
loop_158:
	wr	%o1,	%l4,	%set_softint
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x80,	%i0
	st	%fsr,	[%l7 + 0x64]
	bgu,a,pt	%xcc,	loop_159
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%g5
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%l0
	nop
	set	0x10, %l2
	std	%f2,	[%l7 + %l2]
loop_159:
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x08, %l0
	swap	[%l7 + %l0],	%i3
	set	0x28, %l3
	stda	%l4,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc4
	bn	%xcc,	loop_160
	nop
	set	0x70, %l6
	sth	%o6,	[%l7 + %l6]
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	or	%i7,	%g3,	%o3
loop_160:
	nop
	set	0x54, %o5
	stwa	%i2,	[%l7 + %o5] 0x81
	set	0x48, %o6
	stxa	%l3,	[%l7 + %o6] 0x81
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xe3,	%g6
	set	0x75, %g2
	stba	%g4,	[%l7 + %g2] 0xe3
	membar	#Sync
	wr	%i6,	%o4,	%ccr
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%f26
	nop
	set	0x58, %o4
	swap	[%l7 + %o4],	%o0
	nop
	set	0x18, %i3
	stx	%i1,	[%l7 + %i3]
	set	0x3A, %o2
	stha	%g1,	[%l7 + %o2] 0x80
	add	%l2,	%l6,	%i5
	nop
	set	0x58, %o7
	stx	%o5,	[%l7 + %o7]
	set	0x45, %i5
	stba	%l0,	[%l7 + %i5] 0x88
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x78, %l1
	std	%f16,	[%l7 + %l1]
	set	0x08, %o0
	stxa	%o7,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%g2
	bne	%xcc,	loop_161
	nop
	set	0x50, %g6
	std	%f6,	[%l7 + %g6]
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%g6
	nop
	set	0x68, %g4
	ldsw	[%l7 + %g4],	%i4
loop_161:
	and	%o2,	%o1,	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%l1
	and	%l4,	%i3,	%o6
	nop
	set	0x49, %g5
	stb	%l5,	[%l7 + %g5]
	nop
	set	0x7F, %i1
	ldub	[%l7 + %i1],	%g3
	nop
	set	0x77, %i2
	stb	%o3,	[%l7 + %i2]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	set	0x60, %i6
	stxa	%i7,	[%l7 + %i6] 0x88
	set	0x34, %i4
	swapa	[%l7 + %i4] 0x81,	%l3
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x89
	set	0x78, %l2
	lda	[%l7 + %l2] 0x81,	%f23
	and	%i2,	%g6,	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x70, %l0
	std	%i6,	[%l7 + %l0]
	nop
	set	0x40, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x48, %i0
	ldsh	[%l7 + %i0],	%g1
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%l2
	nop
	set	0x48, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%f16
	set	0x50, %o6
	stwa	%i1,	[%l7 + %o6] 0x81
	add	%i5,	%l6,	%o5
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x786, 	%sys_tick_cmpr
	set	0x50, %g2
	swapa	[%l7 + %g2] 0x81,	%o2
	nop
	set	0x4D, %l4
	ldsb	[%l7 + %l4],	%o7
	set	0x60, %o4
	stxa	%i0,	[%l7 + %o4] 0xe2
	membar	#Sync
	or	%o1,	%g5,	%l1
	set	0x34, %g3
	ldstuba	[%l7 + %g3] 0x81,	%l4
	fpsub16	%f6,	%f18,	%f22
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%f6
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f8
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x70, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x30, %o0
	stb	%o6,	[%l7 + %o0]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f16
	wr	%g3,	%o3,	%pic
	nop
	set	0x60, %g1
	std	%l4,	[%l7 + %g1]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i2
	set	0x38, %g4
	stxa	%l3,	[%l7 + %g4] 0x89
	set	0x69, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g6
	nop
	set	0x52, %o3
	sth	%o4,	[%l7 + %o3]
	nop
	set	0x60, %i1
	ldstub	[%l7 + %i1],	%g4
	set	0x40, %i2
	stda	%i6,	[%l7 + %i2] 0x88
	nop
	set	0x24, %g7
	ldsh	[%l7 + %g7],	%o0
	bge,a,pt	%xcc,	loop_162
	nop
	set	0x68, %i4
	stw	%l2,	[%l7 + %i4]
	nop
	set	0x20, %i6
	stb	%g1,	[%l7 + %i6]
	set	0x48, %l2
	stxa	%i5,	[%l7 + %l2] 0xe3
	membar	#Sync
loop_162:
	fpadd16	%f24,	%f18,	%f18
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x89,	 2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%g2
	nop
	set	0x60, %i0
	stx	%g7,	[%l7 + %i0]
	nop
	set	0x5C, %o1
	prefetch	[%l7 + %o1],	 2
	add	%i1,	%o2,	%i4
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%o6
	set	0x5A, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o1
	set	0x68, %o6
	swapa	[%l7 + %o6] 0x89,	%g5
	nop
	set	0x38, %l5
	std	%i0,	[%l7 + %l5]
	add	%l1,	%l4,	%i3
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%g2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f0
	set	0x62, %o4
	stha	%o3,	[%l7 + %o4] 0x80
	nop
	set	0x18, %g3
	swap	[%l7 + %g3],	%l5
	fpadd32	%f12,	%f10,	%f28
	nop
	set	0x5C, %l4
	lduw	[%l7 + %l4],	%o6
	nop
	set	0x38, %i3
	stx	%i2,	[%l7 + %i3]
	nop
	set	0x40, %o2
	std	%l2,	[%l7 + %o2]
	nop
	set	0x15, %o7
	ldsb	[%l7 + %o7],	%g6
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x81,	%o4
	nop
	set	0x18, %l1
	ldsw	[%l7 + %l1],	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%o0
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x81,	%i7
	set	0x40, %i5
	stxa	%g1,	[%l7 + %i5] 0x88
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xea,	%l2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%l6
	set	0x58, %g5
	stda	%l0,	[%l7 + %g5] 0x80
	nop
	set	0x3C, %o3
	stw	%o5,	[%l7 + %o3]
	nop
	set	0x50, %g1
	ldub	[%l7 + %g1],	%g2
	wr	%g7,	%i1,	%set_softint
	fpadd32	%f8,	%f20,	%f30
	set	0x55, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i4
	nop
	set	0x49, %g7
	ldstub	[%l7 + %g7],	%o7
	nop
	set	0x08, %i1
	std	%f10,	[%l7 + %i1]
	set	0x51, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o2
	nop
	set	0x60, %i4
	ldsw	[%l7 + %i4],	%o1
	nop
	set	0x20, %l2
	prefetch	[%l7 + %l2],	 0
	add	%g5,	%i0,	%l4
	st	%fsr,	[%l7 + 0x2C]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%l1
	set	0x7C, %l0
	stwa	%o3,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x2F, %i0
	ldstub	[%l7 + %i0],	%l5
	nop
	set	0x3B, %o1
	ldub	[%l7 + %o1],	%o6
	nop
	set	0x3B, %l3
	ldub	[%l7 + %l3],	%i2
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xe3,	%g2
	st	%fsr,	[%l7 + 0x78]
	set	0x74, %i7
	stwa	%l3,	[%l7 + %i7] 0x89
	set	0x1C, %o6
	sta	%f9,	[%l7 + %o6] 0x81
	nop
	set	0x60, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x38, %o5
	lda	[%l7 + %o5] 0x80,	%f10
	set	0x44, %g2
	lda	[%l7 + %g2] 0x80,	%f12
	nop
	set	0x5A, %g3
	sth	%o4,	[%l7 + %g3]
	set	0x0E, %l4
	stha	%g6,	[%l7 + %l4] 0x89
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xda
	nop
	set	0x1C, %o2
	lduh	[%l7 + %o2],	%i6
	set	0x10, %o7
	stda	%o0,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x46, %o0
	sth	%g4,	[%l7 + %o0]
	nop
	set	0x34, %l1
	ldsw	[%l7 + %l1],	%g1
	fpsub32s	%f20,	%f11,	%f20
	set	0x78, %i3
	stwa	%i7,	[%l7 + %i3] 0x81
	ld	[%l7 + 0x54],	%f1
	nop
	set	0x50, %i5
	std	%l2,	[%l7 + %i5]
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xe3,	%i4
	st	%f9,	[%l7 + 0x30]
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%l0
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%l6
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%g2
	nop
	set	0x0C, %i2
	prefetch	[%l7 + %i2],	 1
	set	0x1C, %g1
	sta	%f1,	[%l7 + %g1] 0x89
	or	%o5,	%g7,	%i1
	nop
	set	0x20, %i1
	lduw	[%l7 + %i1],	%o7
	set	0x38, %g7
	stda	%o2,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x20, %i4
	swap	[%l7 + %i4],	%o1
	set	0x70, %l2
	stha	%g5,	[%l7 + %l2] 0x89
	set	0x70, %i6
	stda	%i0,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x44, %l0
	stwa	%i4,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc8
	nop
	set	0x08, %i0
	prefetch	[%l7 + %i0],	 4
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f4
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x18, %i7
	ldd	[%l7 + %i7],	%f14
	st	%f7,	[%l7 + 0x64]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xea,	%o2
	set	0x10, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%l1
	set	0x21, %o5
	stba	%i2,	[%l7 + %o5] 0xeb
	membar	#Sync
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%l3
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xea,	%o4
	ld	[%l7 + 0x2C],	%f1
	nop
	set	0x60, %l4
	stx	%g3,	[%l7 + %l4]
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%g6
	nop
	set	0x74, %o2
	swap	[%l7 + %o2],	%i6
	st	%f1,	[%l7 + 0x6C]
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x81,	%o0
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x81,	%g4
	nop
	set	0x75, %l1
	ldub	[%l7 + %l1],	%g1
	st	%f29,	[%l7 + 0x74]
	nop
	set	0x46, %o0
	lduh	[%l7 + %o0],	%l2
	nop
	set	0x30, %i5
	swap	[%l7 + %i5],	%i7
	nop
	set	0x08, %g6
	prefetch	[%l7 + %g6],	 4
	and	%i5,	%l0,	%g2
	nop
	set	0x5E, %g4
	ldsb	[%l7 + %g4],	%o5
	and	%l6,	%g7,	%i1
	set	0x72, %g5
	stha	%o2,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x64, %i3
	sta	%f11,	[%l7 + %i3] 0x80
	nop
	set	0x48, %o3
	stx	%o1,	[%l7 + %o3]
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%o7
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%i0
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x38, %i1
	stw	%i4,	[%l7 + %i1]
	ld	[%l7 + 0x50],	%f18
	nop
	set	0x4C, %i4
	stw	%g5,	[%l7 + %i4]
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x81,	%l4
	set	0x50, %l0
	stxa	%i3,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xcc
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%l1
	nop
	set	0x38, %l2
	std	%l4,	[%l7 + %l2]
	set	0x1C, %i0
	stha	%i2,	[%l7 + %i0] 0xe2
	membar	#Sync
	st	%f12,	[%l7 + 0x4C]
	fpsub32s	%f28,	%f3,	%f2
	nop
	set	0x46, %l3
	ldub	[%l7 + %l3],	%l3
	and	%o6,	%o4,	%g3
	fpadd16	%f14,	%f30,	%f20
	nop
	set	0x70, %l6
	prefetch	[%l7 + %l6],	 4
	set	0x20, %l5
	sta	%f1,	[%l7 + %l5] 0x89
	st	%f29,	[%l7 + 0x64]
	nop
	set	0x34, %i7
	ldsw	[%l7 + %i7],	%i6
	set	0x54, %o6
	stwa	%o0,	[%l7 + %o6] 0x88
	set	0x28, %g3
	stxa	%g4,	[%l7 + %g3] 0x80
	set	0x74, %o5
	sta	%f4,	[%l7 + %o5] 0x80
	nop
	set	0x18, %l4
	ldx	[%l7 + %l4],	%g1
	nop
	set	0x10, %o2
	ldd	[%l7 + %o2],	%f26
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%l2
	nop
	set	0x58, %g2
	ldsw	[%l7 + %g2],	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%i5
	set	0x46, %o7
	stba	%g2,	[%l7 + %o7] 0x88
	nop
	set	0x2A, %o0
	ldsb	[%l7 + %o0],	%l0
	set	0x60, %i5
	prefetcha	[%l7 + %i5] 0x81,	 2
	ld	[%l7 + 0x48],	%f31
	add	%g7,	%o5,	%o2
	nop
	set	0x08, %g6
	prefetch	[%l7 + %g6],	 2
	ld	[%l7 + 0x44],	%f13
	fpsub32s	%f19,	%f17,	%f12
	set	0x60, %l1
	stxa	%o1,	[%l7 + %l1] 0x89
	nop
	set	0x19, %g4
	ldsb	[%l7 + %g4],	%i1
	nop
	set	0x14, %g5
	stb	%o7,	[%l7 + %g5]
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x89,	 4
	set	0x33, %o3
	ldstuba	[%l7 + %o3] 0x81,	%i4
	wr	%g5,	%l4,	%ccr
	nop
	set	0x28, %i2
	std	%f22,	[%l7 + %i2]
	or	%o3,	%i3,	%l1
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x81,	%i2
	set	0x50, %i4
	stda	%l4,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x10, %g1
	sta	%f3,	[%l7 + %g1] 0x88
	set	0x4C, %i6
	stwa	%l3,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x23, %l0
	ldub	[%l7 + %l0],	%o4
	nop
	set	0x68, %o1
	std	%f26,	[%l7 + %o1]
	and	%o6,	%g3,	%i6
	nop
	set	0x24, %i0
	prefetch	[%l7 + %i0],	 1
	or	%o0,	%g4,	%g1
	and	%l2,	%i7,	%g6
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x0D, %l2
	ldub	[%l7 + %l2],	%l6
	nop
	set	0x23, %l6
	ldstub	[%l7 + %l6],	%i5
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%o5
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x36, %l5
	ldsh	[%l7 + %l5],	%g7
	or	%o1,	%o2,	%i1
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f20
	nop
	set	0x6A, %i7
	ldstub	[%l7 + %i7],	%o7
	wr	%i4,	%i0,	%pic
	st	%fsr,	[%l7 + 0x3C]
	set	0x51, %o5
	stba	%l4,	[%l7 + %o5] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%g5
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%f26
	set	0x68, %o2
	stxa	%l1,	[%l7 + %o2] 0x80
	nop
	set	0x54, %g3
	stw	%i2,	[%l7 + %g3]
	nop
	set	0x24, %o4
	prefetch	[%l7 + %o4],	 1
	or	%i3,	%l5,	%l3
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc2
	and	%o6,	%g3,	%o4
	nop
	set	0x78, %o7
	stx	%fsr,	[%l7 + %o7]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%g4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%i6
	set	0x10, %g6
	sta	%f22,	[%l7 + %g6] 0x88
	nop
	set	0x48, %o0
	std	%g0,	[%l7 + %o0]
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x81,	 3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i7,	%g2
	set	0x08, %g5
	sta	%f22,	[%l7 + %g5] 0x80
	or	%g6,	%l6,	%i5
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f6
	nop
	set	0x50, %l1
	stb	%o5,	[%l7 + %l1]
	nop
	set	0x7C, %i2
	lduw	[%l7 + %i2],	%l0
	ld	[%l7 + 0x38],	%f23
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%o1
	nop
	set	0x10, %i4
	std	%o2,	[%l7 + %i4]
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f0
	add	%i1,	%o7,	%g7
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%i4
	nop
	set	0x0C, %l0
	prefetch	[%l7 + %l0],	 0
	nop
	set	0x50, %o1
	std	%f6,	[%l7 + %o1]
	set	0x2C, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l4
	nop
	set	0x3F, %l2
	stb	%o3,	[%l7 + %l2]
	nop
	set	0x25, %g7
	ldub	[%l7 + %g7],	%g5
	nop
	set	0x12, %l6
	ldsh	[%l7 + %l6],	%l1
	nop
	set	0x62, %l5
	lduh	[%l7 + %l5],	%i2
	nop
	set	0x33, %o6
	stb	%i3,	[%l7 + %o6]
	set	0x6C, %l3
	stwa	%l5,	[%l7 + %l3] 0x80
	set	0x56, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l3
	nop
	set	0x70, %i7
	lduw	[%l7 + %i7],	%o6
	add	%g3,	%o4,	%i0
	nop
	set	0x74, %l4
	ldsh	[%l7 + %l4],	%o0
	nop
	set	0x72, %o2
	ldstub	[%l7 + %o2],	%g4
	nop
	set	0x34, %g3
	ldsh	[%l7 + %g3],	%g1
	nop
	set	0x50, %o4
	stx	%i6,	[%l7 + %o4]
	nop
	set	0x40, %g2
	std	%f30,	[%l7 + %g2]
	nop
	set	0x72, %i5
	lduh	[%l7 + %i5],	%i7
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x81,	 4
	set	0x75, %g4
	stba	%g6,	[%l7 + %g4] 0x88
	nop
	set	0x20, %o7
	lduw	[%l7 + %o7],	%l2
	set	0x48, %i3
	lda	[%l7 + %i3] 0x81,	%f24
	set	0x08, %g5
	prefetcha	[%l7 + %g5] 0x89,	 1
	bn	%icc,	loop_163
	nop
	set	0x52, %l1
	ldsh	[%l7 + %l1],	%l6
	bl,a	%icc,	loop_164
	wr	%o5,	%o1,	%clear_softint
loop_163:
	fpsub32	%f24,	%f22,	%f6
	set	0x3C, %i2
	lda	[%l7 + %i2] 0x81,	%f29
loop_164:
	nop
	set	0x08, %i1
	ldxa	[%l7 + %i1] 0x88,	%l0
	set	0x68, %i4
	stba	%o2,	[%l7 + %i4] 0x81
	nop
	set	0x40, %o3
	stw	%o7,	[%l7 + %o3]
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%i1
	nop
	set	0x17, %g1
	ldsb	[%l7 + %g1],	%g7
	set	0x38, %l0
	ldstuba	[%l7 + %l0] 0x80,	%l4
	nop
	set	0x76, %i0
	ldsh	[%l7 + %i0],	%o3
	nop
	set	0x68, %l2
	ldx	[%l7 + %l2],	%i4
	nop
	set	0x28, %o1
	stw	%l1,	[%l7 + %o1]
	nop
	set	0x60, %l6
	sth	%g5,	[%l7 + %l6]
	ld	[%l7 + 0x20],	%f27
	nop
	set	0x34, %g7
	ldsw	[%l7 + %g7],	%i2
	nop
	nop
	setx	0x9BB438114BF963F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF0335E6250805768,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f30
	add	%l5,	%l3,	%i3
	nop
	set	0x40, %l5
	std	%o6,	[%l7 + %l5]
	nop
	set	0x51, %l3
	stb	%g3,	[%l7 + %l3]
	set	0x2A, %o6
	stha	%o4,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xc8
	set	0x38, %o5
	stba	%o0,	[%l7 + %o5] 0xea
	membar	#Sync
	set	0x5E, %o2
	ldstuba	[%l7 + %o2] 0x88,	%g4
	nop
	set	0x30, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x38, %g3
	std	%f16,	[%l7 + %g3]
	nop
	set	0x34, %o4
	stw	%i0,	[%l7 + %o4]
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x80,	%g0
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x88,	%i7
	add	%i6,	%g6,	%g2
	nop
	set	0x48, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%l2
	set	0x72, %g4
	stha	%l6,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x58, %i3
	prefetcha	[%l7 + %i3] 0x89,	 0
	set	0x14, %g5
	sta	%f6,	[%l7 + %g5] 0x81
	or	%o1,	%l0,	%o5
	nop
	set	0x4B, %l1
	ldsb	[%l7 + %l1],	%o7
	wr	%i1,	%g7,	%pic
	nop
	set	0x73, %i2
	ldstub	[%l7 + %i2],	%l4
	nop
	set	0x5C, %o7
	ldstub	[%l7 + %o7],	%o2
	set	0x58, %i1
	stda	%o2,	[%l7 + %i1] 0x89
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
	set	0x4A, %i6
	stha	%g5,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf1
	membar	#Sync
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x6E, %l0
	ldsb	[%l7 + %l0],	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i4
	add	%i3,	%o6,	%l3
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xcc
	set	0x58, %i0
	stba	%o4,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x7E, %l6
	stha	%g3,	[%l7 + %l6] 0x89
	set	0x18, %g7
	sta	%f15,	[%l7 + %g7] 0x88
	nop
	set	0x3C, %o1
	ldsw	[%l7 + %o1],	%g4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xFBE, 	%tick_cmpr
	nop
	set	0x08, %l5
	ldsw	[%l7 + %l5],	%i7
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%g0
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f28
	nop
	set	0x18, %o5
	ldub	[%l7 + %o5],	%g6
	add	%g2,	%l2,	%l6
	nop
	set	0x3C, %l3
	sth	%i6,	[%l7 + %l3]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xda
	nop
	set	0x0C, %g3
	swap	[%l7 + %g3],	%i5
	nop
	set	0x4E, %o4
	lduh	[%l7 + %o4],	%l0
	fpsub32	%f8,	%f8,	%f26
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%o0
	set	0x68, %g6
	stda	%o6,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x58, %g2
	std	%f16,	[%l7 + %g2]
	nop
	set	0x54, %o0
	prefetch	[%l7 + %o0],	 2
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%o5
	st	%fsr,	[%l7 + 0x5C]
	set	0x14, %g5
	stwa	%g7,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x0E, %l1
	sth	%i1,	[%l7 + %l1]
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x81,	 1
	add	%o3,	%l1,	%l4
	wr 	%g0, 	0x5, 	%fprs
	set	0x7C, %o7
	stwa	%i2,	[%l7 + %o7] 0xe2
	membar	#Sync
	ba,a,pt	%icc,	loop_165
	nop
	set	0x0A, %i3
	ldsh	[%l7 + %i3],	%i3
	ld	[%l7 + 0x2C],	%f28
	nop
	set	0x48, %i1
	stx	%i4,	[%l7 + %i1]
loop_165:
	nop
	set	0x18, %i4
	lduh	[%l7 + %i4],	%o6
	set	0x60, %i6
	stha	%o4,	[%l7 + %i6] 0x80
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%l3
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%g2
	nop
	set	0x6E, %l2
	sth	%o0,	[%l7 + %l2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%i0
	nop
	set	0x31, %i0
	ldstub	[%l7 + %i0],	%g1
	set	0x56, %l6
	stha	%g6,	[%l7 + %l6] 0x81
	bleu,a,pn	%xcc,	loop_166
	nop
	set	0x58, %g1
	stx	%i7,	[%l7 + %g1]
	set	0x2A, %g7
	ldstuba	[%l7 + %g7] 0x88,	%l2
loop_166:
	nop
	set	0x14, %l5
	ldsb	[%l7 + %l5],	%g2
	nop
	set	0x7E, %o1
	lduh	[%l7 + %o1],	%i6
	nop
	set	0x0A, %i7
	ldstub	[%l7 + %i7],	%l6
	nop
	set	0x4C, %o6
	prefetch	[%l7 + %o6],	 1
	set	0x28, %o5
	stwa	%i5,	[%l7 + %o5] 0x81
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%l0
	set	0x3C, %o2
	sta	%f13,	[%l7 + %o2] 0x89
	st	%f7,	[%l7 + 0x10]
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%o1
	nop
	set	0x34, %i5
	ldsw	[%l7 + %i5],	%o7
	or	%g7,	%i1,	%o5
	ld	[%l7 + 0x68],	%f31
	or	%o3,	%l1,	%l4
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%g5
	nop
	set	0x48, %g6
	stb	%o2,	[%l7 + %g6]
	set	0x7A, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i2
	add	%l5,	%i3,	%o6
	or	%i4,	%l3,	%g3
	set	0x60, %g2
	stxa	%o0,	[%l7 + %g2] 0x80
	nop
	set	0x42, %g4
	lduh	[%l7 + %g4],	%g4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f16
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%g1
	set	0x30, %l1
	stxa	%g6,	[%l7 + %l1] 0xe3
	membar	#Sync
	set	0x28, %i2
	lda	[%l7 + %i2] 0x89,	%f21
	nop
	set	0x34, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x0E, %o7
	lduh	[%l7 + %o7],	%o4
	st	%f23,	[%l7 + 0x30]
	nop
	set	0x3E, %i3
	lduh	[%l7 + %i3],	%i7
	set	0x53, %i4
	ldstuba	[%l7 + %i4] 0x89,	%l2
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%g2
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%i6
	set	0x20, %l2
	swapa	[%l7 + %l2] 0x88,	%l0
	nop
	set	0x34, %l0
	lduh	[%l7 + %l0],	%i5
	set	0x1E, %i0
	stha	%o1,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x89,	%g7
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x80,	%i1
	set	0x68, %l5
	stxa	%o3,	[%l7 + %l5] 0x80
	st	%fsr,	[%l7 + 0x38]
	set	0x41, %o1
	stba	%l1,	[%l7 + %o1] 0x80
	set	0x70, %o6
	stda	%o4,	[%l7 + %o6] 0x89
	nop
	set	0x58, %i7
	std	%g4,	[%l7 + %i7]
	nop
	set	0x53, %l3
	ldsb	[%l7 + %l3],	%o2
	set	0x60, %o5
	lda	[%l7 + %o5] 0x88,	%f14
	set	0x28, %o4
	lda	[%l7 + %o4] 0x81,	%f12
	nop
	set	0x0C, %i5
	ldsw	[%l7 + %i5],	%i2
	ld	[%l7 + 0x3C],	%f11
	set	0x20, %g3
	stxa	%l4,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f0
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x80,	%i2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%i4
	fpadd16	%f12,	%f2,	%f20
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f0
	set	0x10, %g2
	ldxa	[%l7 + %g2] 0x81,	%l3
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x88,	%g3
	or	%o0,	%g4,	%i0
	nop
	nop
	setx	0x4FEFCB05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x97BB9C3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f30,	%f30
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%g0
	set	0x5E, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%i7
	nop
	set	0x70, %g5
	sth	%l2,	[%l7 + %g5]
	nop
	set	0x60, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%f18
	ld	[%l7 + 0x60],	%f21
	st	%f3,	[%l7 + 0x10]
	or	%g2,	%o4,	%i6
	st	%f20,	[%l7 + 0x74]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd2,	%f0
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%l0
	add	%i5,	%o1,	%o7
	set	0x50, %i6
	ldxa	[%l7 + %i6] 0x81,	%l6
	add	%i1,	%o3,	%l1
	ld	[%l7 + 0x40],	%f28
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x81,	 4
	nop
	set	0x58, %l2
	stx	%g5,	[%l7 + %l2]
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x89,	 3
	set	0x54, %i0
	stwa	%o2,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x50, %l0
	stda	%i2,	[%l7 + %l0] 0x81
	nop
	set	0x64, %g1
	stw	%i3,	[%l7 + %g1]
	and	%l4,	%l5,	%i4
	nop
	set	0x50, %g7
	prefetch	[%l7 + %g7],	 3
	nop
	set	0x3E, %l5
	stb	%g3,	[%l7 + %l5]
	nop
	set	0x18, %o1
	swap	[%l7 + %o1],	%o0
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x81,	%l2
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %o6
	stxa	%i0,	[%l7 + %o6] 0x89
	nop
	set	0x0D, %l3
	stb	%g1,	[%l7 + %l3]
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 1
	nop
	set	0x40, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f16
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x80,	%i7,	%g6
	nop
	set	0x54, %g3
	ldub	[%l7 + %g3],	%g2
	nop
	set	0x4C, %g6
	stw	%o4,	[%l7 + %g6]
	nop
	set	0x6C, %o2
	stw	%i6,	[%l7 + %o2]
	wr	%l0,	%i5,	%ccr
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%o7
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x0C, %l4
	stwa	%o3,	[%l7 + %l4] 0x89
	set	0x6C, %g2
	swapa	[%l7 + %g2] 0x88,	%l1
	set	0x30, %o0
	stba	%l6,	[%l7 + %o0] 0x89
	set	0x48, %g4
	stda	%o4,	[%l7 + %g4] 0x81
	nop
	set	0x2B, %l1
	ldstub	[%l7 + %l1],	%g5
	nop
	set	0x10, %g5
	lduw	[%l7 + %g5],	%o2
	wr	%g7,	%i3,	%sys_tick
	nop
	set	0x22, %i2
	ldstub	[%l7 + %i2],	%i2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x81,	%f16
	ld	[%l7 + 0x70],	%f28
	nop
	set	0x50, %i3
	std	%f16,	[%l7 + %i3]
	set	0x70, %o7
	stba	%l5,	[%l7 + %o7] 0x80
	st	%f16,	[%l7 + 0x3C]
	nop
	set	0x5C, %i1
	swap	[%l7 + %i1],	%l4
	nop
	set	0x28, %i6
	ldsw	[%l7 + %i6],	%i4
	nop
	set	0x68, %l2
	std	%f26,	[%l7 + %l2]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x81
	set	0x59, %l6
	ldstuba	[%l7 + %l6] 0x80,	%o0
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f24
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%l3
	nop
	set	0x7D, %i0
	ldstub	[%l7 + %i0],	%g3
	nop
	set	0x38, %l5
	std	%f20,	[%l7 + %l5]
	set	0x21, %o1
	stba	%i0,	[%l7 + %o1] 0x88
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x88,	%g4
	and	%o6,	%i7,	%g6
	fpadd32	%f2,	%f12,	%f2
	set	0x6C, %i7
	sta	%f8,	[%l7 + %i7] 0x81
	and	%g2,	%g1,	%o4
	nop
	set	0x0D, %o6
	ldstub	[%l7 + %o6],	%i6
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%i5
	nop
	set	0x48, %o5
	ldsh	[%l7 + %o5],	%l2
	set	0x42, %i5
	stha	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x1C, %l3
	stba	%o1,	[%l7 + %l3] 0x88
	nop
	set	0x58, %g3
	swap	[%l7 + %g3],	%o7
	and	%o3,	%i1,	%l1
	set	0x6C, %g6
	swapa	[%l7 + %g6] 0x81,	%l6
	nop
	set	0x35, %o2
	stb	%g5,	[%l7 + %o2]
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%o5,	%g7,	%i3
	and	%i2,	%l5,	%o2
	nop
	set	0x50, %g2
	prefetch	[%l7 + %g2],	 1
	ld	[%l7 + 0x48],	%f24
	nop
	set	0x38, %o0
	stw	%l4,	[%l7 + %o0]
	nop
	set	0x60, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f16
	nop
	set	0x20, %i2
	lduh	[%l7 + %i2],	%o0
	nop
	set	0x08, %i4
	ldsw	[%l7 + %i4],	%i4
	nop
	set	0x73, %g5
	ldstub	[%l7 + %g5],	%g3
	nop
	set	0x54, %o7
	ldsw	[%l7 + %o7],	%l3
	nop
	set	0x10, %i1
	stx	%fsr,	[%l7 + %i1]
	fpsub32	%f6,	%f14,	%f26
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%g4
	and	%i0,	%o6,	%g6
	st	%f5,	[%l7 + 0x70]
	fpsub32	%f18,	%f14,	%f22
	nop
	set	0x58, %l2
	ldx	[%l7 + %l2],	%g2
	or	%i7,	%g1,	%o4
	add	%i6,	%l2,	%l0
	set	0x25, %o3
	stba	%i5,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x34, %l6
	stba	%o7,	[%l7 + %l6] 0x80
	set	0x3C, %i3
	stwa	%o3,	[%l7 + %i3] 0x88
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%i0
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%l1
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x81
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%o1
	and	%g5,	%l6,	%g7
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x80,	%o4
	nop
	set	0x50, %g7
	swap	[%l7 + %g7],	%i2
	st	%fsr,	[%l7 + 0x7C]
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x88,	%i3
	set	0x1A, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o2
	st	%f8,	[%l7 + 0x78]
	nop
	set	0x08, %o6
	stx	%l5,	[%l7 + %o6]
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x81,	%l4
	nop
	set	0x50, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x40, %i5
	ldstub	[%l7 + %i5],	%o0
	nop
	set	0x08, %g3
	std	%i4,	[%l7 + %g3]
	set	0x32, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l3
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x81,	%g2
	set	0x3E, %g2
	stha	%i0,	[%l7 + %g2] 0x88
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%g4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf0,	%f0
	nop
	set	0x3C, %g4
	ldsb	[%l7 + %g4],	%g6
	nop
	set	0x45, %i2
	ldsb	[%l7 + %i2],	%g2
	set	0x10, %i4
	prefetcha	[%l7 + %i4] 0x89,	 4
	nop
	set	0x09, %l1
	stb	%g1,	[%l7 + %l1]
	nop
	set	0x3C, %o7
	prefetch	[%l7 + %o7],	 3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x81,	%i7,	%o4
	nop
	set	0x16, %g5
	ldsh	[%l7 + %g5],	%l2
	nop
	set	0x7E, %i6
	lduh	[%l7 + %i6],	%l0
	add	%i5,	%i6,	%o7
	nop
	set	0x24, %l2
	stw	%o3,	[%l7 + %l2]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%i1
	nop
	set	0x44, %i1
	stw	%o1,	[%l7 + %i1]
	set	0x08, %l6
	swapa	[%l7 + %l6] 0x81,	%l6
	nop
	set	0x1F, %i3
	ldsb	[%l7 + %i3],	%g5
	nop
	set	0x14, %o3
	ldsw	[%l7 + %o3],	%g7
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%i2
	nop
	set	0x10, %l5
	sth	%o5,	[%l7 + %l5]
	set	0x48, %g1
	stxa	%o2,	[%l7 + %g1] 0x88
	set	0x5A, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l5
	set	0x7C, %g7
	sta	%f11,	[%l7 + %g7] 0x81
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x16, %o1
	ldsh	[%l7 + %o1],	%i4
	nop
	set	0x78, %o4
	std	%l2,	[%l7 + %o4]
	set	0x30, %i7
	ldda	[%l7 + %i7] 0xeb,	%l4
	nop
	set	0x57, %o6
	ldsb	[%l7 + %o6],	%i0
	or	%g3,	%g6,	%g2
	nop
	set	0x60, %l3
	lduh	[%l7 + %l3],	%g4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%i7
	nop
	set	0x5F, %o5
	ldsb	[%l7 + %o5],	%g1
	set	0x36, %g3
	stha	%o4,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x30, %o2
	ldx	[%l7 + %o2],	%l2
	set	0x3F, %i5
	stba	%i5,	[%l7 + %i5] 0x81
	set	0x46, %g2
	stba	%i6,	[%l7 + %g2] 0xea
	membar	#Sync
	ld	[%l7 + 0x10],	%f7
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%o7
	nop
	set	0x4C, %o0
	ldstub	[%l7 + %o0],	%o3
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x08, %i2
	stwa	%l1,	[%l7 + %i2] 0x89
	nop
	set	0x14, %g4
	swap	[%l7 + %g4],	%i1
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%o0
	nop
	set	0x49, %o7
	ldsb	[%l7 + %o7],	%l6
	nop
	set	0x68, %l1
	ldstub	[%l7 + %l1],	%l0
	st	%fsr,	[%l7 + 0x1C]
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x89,	%g4
	nop
	set	0x30, %i6
	std	%f0,	[%l7 + %i6]
	wr	%g7,	%o5,	%ccr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%l5
	set	0x28, %i1
	stxa	%o2,	[%l7 + %i1] 0xe3
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i4
	nop
	set	0x21, %l2
	stb	%o0,	[%l7 + %l2]
	wr	%l3,	%i0,	%clear_softint
	nop
	set	0x2E, %i3
	lduh	[%l7 + %i3],	%g3
	nop
	set	0x4C, %l6
	ldsh	[%l7 + %l6],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g4
	nop
	set	0x30, %o3
	std	%o6,	[%l7 + %o3]
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%i7
	nop
	set	0x60, %l5
	stx	%g6,	[%l7 + %l5]
	set	0x28, %g1
	stwa	%g1,	[%l7 + %g1] 0x80
	nop
	set	0x18, %i0
	lduw	[%l7 + %i0],	%o4
	set	0x14, %g7
	sta	%f18,	[%l7 + %g7] 0x88
	nop
	set	0x70, %o1
	ldub	[%l7 + %o1],	%i5
	set	0x65, %i7
	ldstuba	[%l7 + %i7] 0x80,	%l2
	nop
	set	0x53, %o4
	ldsb	[%l7 + %o4],	%o7
	nop
	set	0x30, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x30, %o6
	sta	%f26,	[%l7 + %o6] 0x81
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f4
	st	%f31,	[%l7 + 0x20]
	set	0x78, %o5
	stxa	%i6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	fpsub16s	%f11,	%f24,	%f19
	bgu	%xcc,	loop_167
	nop
	set	0x70, %g2
	ldx	[%l7 + %g2],	%o3
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%i1,	%o1,	%l1
loop_167:
	nop
	set	0x70, %l4
	ldsh	[%l7 + %l4],	%l0
	nop
	set	0x60, %g6
	lduw	[%l7 + %g6],	%g5
	set	0x20, %i2
	stxa	%l6,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc0
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x80,	%o5
	nop
	set	0x4C, %i4
	ldsw	[%l7 + %i4],	%g7
	nop
	set	0x58, %o7
	sth	%i2,	[%l7 + %o7]
	set	0x75, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%l5
	nop
	set	0x64, %i6
	swap	[%l7 + %i6],	%i4
	set	0x45, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l3
	st	%fsr,	[%l7 + 0x28]
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd2,	%f0
	nop
	set	0x58, %l2
	stw	%o0,	[%l7 + %l2]
	nop
	set	0x70, %l6
	std	%i0,	[%l7 + %l6]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd2,	%f16
	nop
	set	0x2C, %l0
	stw	%g3,	[%l7 + %l0]
	nop
	set	0x74, %l5
	swap	[%l7 + %l5],	%l4
	nop
	set	0x4F, %g1
	ldstub	[%l7 + %g1],	%g4
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x4E, %i0
	stha	%g2,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x88,	%i7
	nop
	set	0x30, %o1
	stw	%o6,	[%l7 + %o1]
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xeb,	%g0
	nop
	set	0x28, %l3
	std	%f4,	[%l7 + %l3]
	nop
	set	0x40, %i7
	std	%o4,	[%l7 + %i7]
	and	%g6,	%l2,	%o7
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x88,	%i6
	set	0x60, %o5
	ldda	[%l7 + %o5] 0xe3,	%o2
	nop
	set	0x56, %g3
	lduh	[%l7 + %g3],	%i5
	set	0x69, %o2
	stba	%i1,	[%l7 + %o2] 0x80
	set	0x20, %g2
	stda	%o0,	[%l7 + %g2] 0x89
	nop
	set	0x30, %i5
	stw	%l1,	[%l7 + %i5]
	nop
	set	0x0C, %l4
	prefetch	[%l7 + %l4],	 1
	add	%g5,	%l0,	%l6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f0
	nop
	set	0x41, %o0
	ldstub	[%l7 + %o0],	%g7
	nop
	set	0x64, %i2
	sth	%o5,	[%l7 + %i2]
	or	%i2,	%o2,	%i3
	nop
	set	0x24, %g4
	ldsh	[%l7 + %g4],	%l5
	ba,a	%xcc,	loop_168
	nop
	set	0x38, %i4
	ldsw	[%l7 + %i4],	%l3
	set	0x24, %o7
	lda	[%l7 + %o7] 0x80,	%f2
loop_168:
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f2
	set	0x1D, %i1
	ldstuba	[%l7 + %i1] 0x81,	%i4
	nop
	set	0x5E, %g5
	ldstub	[%l7 + %g5],	%i0
	set	0x30, %l1
	stda	%g2,	[%l7 + %l1] 0x81
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf0
	membar	#Sync
	set	0x50, %l6
	stxa	%l4,	[%l7 + %l6] 0xe2
	membar	#Sync
	set	0x6C, %l0
	ldstuba	[%l7 + %l0] 0x80,	%o0
	nop
	set	0x28, %l5
	stw	%g4,	[%l7 + %l5]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	set	0x78, %i3
	swapa	[%l7 + %i3] 0x81,	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o6,	%g2
	ld	[%l7 + 0x2C],	%f6
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f2
	set	0x0C, %i0
	stwa	%o4,	[%l7 + %i0] 0xea
	membar	#Sync
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc0
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f22
	fpsub32s	%f15,	%f1,	%f29
	and	%g1,	%l2,	%g6
	nop
	set	0x4C, %l3
	ldsw	[%l7 + %l3],	%o7
	nop
	set	0x6C, %i7
	stw	%o3,	[%l7 + %i7]
	nop
	set	0x18, %o6
	stx	%i5,	[%l7 + %o6]
	nop
	set	0x68, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x72, %g3
	stha	%i6,	[%l7 + %g3] 0x80
	nop
	set	0x18, %o5
	lduh	[%l7 + %o5],	%i1
	add	%o1,	%l1,	%g5
	nop
	set	0x5C, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x24, %i5
	stwa	%l0,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x3C, %l4
	stwa	%g7,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x70, %o2
	ldstuba	[%l7 + %o2] 0x88,	%o5
	set	0x4C, %g6
	stha	%l6,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x5F, %i2
	ldub	[%l7 + %i2],	%i2
	nop
	set	0x5D, %g4
	ldsb	[%l7 + %g4],	%o2
	nop
	set	0x64, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x20, %o0
	std	%i2,	[%l7 + %o0]
	nop
	set	0x24, %o7
	lduw	[%l7 + %o7],	%l3
	set	0x72, %i6
	stha	%i4,	[%l7 + %i6] 0x89
	nop
	set	0x21, %g5
	ldub	[%l7 + %g5],	%i0
	nop
	set	0x48, %l1
	stx	%l5,	[%l7 + %l1]
	nop
	set	0x70, %i1
	ldsh	[%l7 + %i1],	%l4
	set	0x48, %l6
	stha	%g3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x26, %l0
	stb	%g4,	[%l7 + %l0]
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%o0
	or	%o6,	%g2,	%i7
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe3,	%g0
	nop
	set	0x18, %i3
	std	%o4,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x0C]
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x89,	%l2
	nop
	set	0x68, %i0
	stx	%g6,	[%l7 + %i0]
	set	0x70, %g1
	stda	%o6,	[%l7 + %g1] 0x89
	set	0x0C, %o1
	stwa	%o3,	[%l7 + %o1] 0x88
	nop
	set	0x48, %o4
	std	%f2,	[%l7 + %o4]
	nop
	set	0x30, %l3
	std	%i6,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x68, %i7
	stw	%i1,	[%l7 + %i7]
	nop
	set	0x24, %g7
	lduw	[%l7 + %g7],	%o1
	or	%l1,	%i5,	%l0
	and	%g7,	%g5,	%o5
	nop
	nop
	setx	0x21ACDF6E69EC04CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x760740019E640956,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f28
	st	%f27,	[%l7 + 0x18]
	set	0x5C, %o6
	stwa	%l6,	[%l7 + %o6] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	fpadd32s	%f16,	%f8,	%f25
	nop
	set	0x14, %g2
	stb	%o2,	[%l7 + %g2]
	nop
	set	0x24, %g3
	ldsw	[%l7 + %g3],	%i2
	set	0x52, %i5
	stba	%l3,	[%l7 + %i5] 0x80
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i0
	nop
	set	0x0B, %l4
	ldstub	[%l7 + %l4],	%l5
	fpsub32s	%f0,	%f3,	%f29
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
	nop
	set	0x70, %i2
	stx	%g3,	[%l7 + %i2]
	set	0x38, %g4
	stha	%l4,	[%l7 + %g4] 0x88
	nop
	set	0x78, %i4
	std	%f30,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x1C]
	set	0x14, %o0
	lda	[%l7 + %o0] 0x88,	%f26
	wr	%o0,	%o6,	%pic
	nop
	set	0x50, %g6
	ldsb	[%l7 + %g6],	%g2
	fpadd32s	%f10,	%f3,	%f17
	add	%g4,	%g1,	%i7
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%l2
	nop
	set	0x59, %i6
	ldstub	[%l7 + %i6],	%g6
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	fpsub32s	%f27,	%f14,	%f23
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	and	%o3,	%o4,	%i1
	ld	[%l7 + 0x60],	%f28
	set	0x24, %g5
	sta	%f25,	[%l7 + %g5] 0x80
	set	0x50, %l6
	stha	%i6,	[%l7 + %l6] 0x80
	wr 	%g0, 	0x5, 	%fprs
	set	0x50, %l2
	stba	%l0,	[%l7 + %l2] 0x89
	set	0x70, %l0
	stda	%g6,	[%l7 + %l0] 0x89
	nop
	set	0x50, %i3
	std	%g4,	[%l7 + %i3]
	nop
	set	0x34, %l5
	lduh	[%l7 + %l5],	%o1
	nop
	set	0x28, %o3
	sth	%o5,	[%l7 + %o3]
	set	0x70, %g1
	prefetcha	[%l7 + %g1] 0x81,	 0
	nop
	set	0x5E, %i0
	ldsh	[%l7 + %i0],	%l6
	nop
	set	0x38, %o4
	sth	%i2,	[%l7 + %o4]
	nop
	set	0x38, %o1
	ldstub	[%l7 + %o1],	%i4
	nop
	set	0x17, %l3
	ldsb	[%l7 + %l3],	%i0
	nop
	set	0x0C, %g7
	lduh	[%l7 + %g7],	%l3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%g3
	set	0x23, %o6
	stba	%l4,	[%l7 + %o6] 0xe2
	membar	#Sync
	or	%l5,	%o6,	%o0
	nop
	set	0x74, %i7
	prefetch	[%l7 + %i7],	 1
	nop
	set	0x70, %o5
	std	%g4,	[%l7 + %o5]
	set	0x78, %g3
	lda	[%l7 + %g3] 0x88,	%f5
	nop
	set	0x18, %i5
	ldx	[%l7 + %i5],	%g2
	wr	%g1,	%l2,	%ccr
	set	0x3C, %g2
	stwa	%g6,	[%l7 + %g2] 0x81
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x81,	%o7
	nop
	set	0x52, %i2
	ldub	[%l7 + %i2],	%o3
	nop
	set	0x18, %g4
	std	%o4,	[%l7 + %g4]
	nop
	set	0x08, %i4
	stw	%i1,	[%l7 + %i4]
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xea,	%i6
	nop
	set	0x58, %g6
	stx	%i7,	[%l7 + %g6]
	set	0x3C, %o7
	lda	[%l7 + %o7] 0x81,	%f30
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x88
	and	%i5,	%l0,	%g7
	nop
	set	0x36, %i6
	lduh	[%l7 + %i6],	%l1
	nop
	set	0x4C, %i1
	prefetch	[%l7 + %i1],	 0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o5
	and	%o2,	%g5,	%l6
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x88,	%i2
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%i0
	nop
	set	0x36, %l6
	ldsb	[%l7 + %l6],	%l3
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x81,	%i4
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%i3
	nop
	set	0x3F, %l5
	ldsb	[%l7 + %l5],	%g3
	nop
	set	0x20, %i3
	std	%f18,	[%l7 + %i3]
	nop
	set	0x48, %o3
	swap	[%l7 + %o3],	%l5
	nop
	set	0x34, %g1
	prefetch	[%l7 + %g1],	 3
	st	%f27,	[%l7 + 0x74]
	add	%l4,	%o6,	%o0
	nop
	set	0x22, %o4
	lduh	[%l7 + %o4],	%g4
	nop
	nop
	setx	0x0453E763,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x1443DC2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f29,	%f29
	nop
	set	0x18, %o1
	std	%f26,	[%l7 + %o1]
	nop
	set	0x3C, %i0
	ldsb	[%l7 + %i0],	%g1
	nop
	set	0x58, %g7
	prefetch	[%l7 + %g7],	 1
	nop
	set	0x2F, %o6
	ldstub	[%l7 + %o6],	%g2
	fpsub32	%f0,	%f16,	%f8
	nop
	set	0x30, %l3
	std	%l2,	[%l7 + %l3]
	nop
	set	0x41, %i7
	ldsb	[%l7 + %i7],	%o7
	nop
	set	0x34, %o5
	ldub	[%l7 + %o5],	%o3
	bge	%icc,	loop_169
	or	%o4,	%g6,	%i1
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x88,	 4
loop_169:
	nop
	set	0x0C, %i5
	prefetch	[%l7 + %i5],	 1
	nop
	set	0x28, %o2
	std	%f4,	[%l7 + %o2]
	ld	[%l7 + 0x74],	%f4
	set	0x70, %g2
	ldda	[%l7 + %g2] 0xea,	%i6
	nop
	set	0x08, %g4
	ldsh	[%l7 + %g4],	%l0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%g7
	nop
	set	0x68, %i2
	swap	[%l7 + %i2],	%l1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o1,	%o5
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f30
	set	0x7D, %g6
	stba	%o2,	[%l7 + %g6] 0x88
	be,pt	%icc,	loop_170
	nop
	set	0x50, %o0
	ldx	[%l7 + %o0],	%g5
	nop
	set	0x15, %o7
	stb	%i2,	[%l7 + %o7]
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x89,	%i0
loop_170:
	nop
	set	0x50, %l4
	sta	%f12,	[%l7 + %l4] 0x88
	nop
	set	0x18, %l1
	stx	%l3,	[%l7 + %l1]
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%i4
	st	%f15,	[%l7 + 0x14]
	set	0x20, %g5
	stda	%i2,	[%l7 + %g5] 0x89
	nop
	set	0x3E, %l2
	ldsh	[%l7 + %l2],	%l6
	nop
	set	0x3C, %l0
	ldsw	[%l7 + %l0],	%l5
	set	0x60, %l6
	ldda	[%l7 + %l6] 0x81,	%g2
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%o6
	set	0x50, %o3
	stxa	%l4,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x5C, %g1
	ldsw	[%l7 + %g1],	%g4
	set	0x40, %o4
	stxa	%g1,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x33, %o1
	stb	%o0,	[%l7 + %o1]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf1
	membar	#Sync
	nop
	set	0x6B, %g7
	ldsb	[%l7 + %g7],	%g2
	nop
	set	0x24, %o6
	swap	[%l7 + %o6],	%o7
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x81,	%o3
	nop
	set	0x5C, %i7
	stb	%o4,	[%l7 + %i7]
	set	0x6C, %i0
	swapa	[%l7 + %i0] 0x89,	%g6
	nop
	set	0x60, %o5
	std	%l2,	[%l7 + %o5]
	or	%i6,	%i7,	%i1
	nop
	set	0x50, %g3
	stx	%fsr,	[%l7 + %g3]
	fpadd16s	%f18,	%f13,	%f13
	nop
	set	0x58, %i5
	prefetch	[%l7 + %i5],	 4
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f16
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%i5
	set	0x7C, %i2
	sta	%f10,	[%l7 + %i2] 0x80
	set	0x14, %i4
	swapa	[%l7 + %i4] 0x88,	%l0
	nop
	set	0x30, %g6
	swap	[%l7 + %g6],	%l1
	set	0x5C, %o0
	sta	%f25,	[%l7 + %o0] 0x89
	nop
	set	0x42, %o7
	stb	%o1,	[%l7 + %o7]
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f4
	bgu,a,pn	%xcc,	loop_171
	nop
	set	0x56, %i6
	lduh	[%l7 + %i6],	%o5
	set	0x78, %l4
	prefetcha	[%l7 + %l4] 0x80,	 4
loop_171:
	nop
	set	0x30, %l1
	std	%o2,	[%l7 + %l1]
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%f22
	set	0x64, %l2
	ldstuba	[%l7 + %l2] 0x88,	%g5
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x5D, %l6
	stb	%i2,	[%l7 + %l6]
	set	0x58, %i3
	ldxa	[%l7 + %i3] 0x81,	%l3
	ld	[%l7 + 0x30],	%f9
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%i0
	or	%i3,	%l6,	%i4
	nop
	set	0x74, %g1
	ldsw	[%l7 + %g1],	%l5
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x80
	ld	[%l7 + 0x5C],	%f1
	nop
	set	0x21, %o1
	ldub	[%l7 + %o1],	%g3
	set	0x4C, %o3
	ldstuba	[%l7 + %o3] 0x80,	%o6
	set	0x20, %g7
	sta	%f18,	[%l7 + %g7] 0x89
	bl	%icc,	loop_172
	nop
	set	0x10, %o6
	lduw	[%l7 + %o6],	%g4
	set	0x78, %l5
	stda	%g0,	[%l7 + %l5] 0xea
	membar	#Sync
loop_172:
	nop
	set	0x60, %l3
	std	%l4,	[%l7 + %l3]
	wr	%o0,	%g2,	%pic
	nop
	set	0x45, %i0
	ldub	[%l7 + %i0],	%o3
	nop
	set	0x48, %o5
	std	%o6,	[%l7 + %o5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o4,	%g6
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x70, %g3
	std	%l2,	[%l7 + %g3]
	nop
	set	0x30, %i5
	std	%f30,	[%l7 + %i5]
	nop
	set	0x20, %g2
	std	%i6,	[%l7 + %g2]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%i7
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x50, %g4
	stx	%fsr,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f16
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1271
!	Type a   	: 38
!	Type cti   	: 23
!	Type x   	: 513
!	Type f   	: 42
!	Type i   	: 113
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
	set	0x9,	%g1
	set	0x7,	%g2
	set	0x9,	%g3
	set	0x4,	%g4
	set	0xA,	%g5
	set	0x6,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0x8,	%i2
	set	-0x1,	%i3
	set	-0x4,	%i4
	set	-0xF,	%i5
	set	-0x5,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x47340AB4,	%l0
	set	0x38C3442D,	%l1
	set	0x65A97D42,	%l2
	set	0x45879A6F,	%l3
	set	0x1A744705,	%l4
	set	0x2E903DCC,	%l5
	set	0x4057CC74,	%l6
	!# Output registers
	set	0x08AB,	%o0
	set	0x0C06,	%o1
	set	0x15FA,	%o2
	set	-0x1BC9,	%o3
	set	-0x0CC2,	%o4
	set	-0x080C,	%o5
	set	-0x0F12,	%o6
	set	-0x1C1A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEBDFB638E3710F3B)
	INIT_TH_FP_REG(%l7,%f2,0xFBDAE50EC4BF4176)
	INIT_TH_FP_REG(%l7,%f4,0x74EA3FBB72B59290)
	INIT_TH_FP_REG(%l7,%f6,0x70E101A1178C6560)
	INIT_TH_FP_REG(%l7,%f8,0x758B48C576744DDF)
	INIT_TH_FP_REG(%l7,%f10,0x2FC6E5207F1D25C5)
	INIT_TH_FP_REG(%l7,%f12,0xF641F9DF13B749D0)
	INIT_TH_FP_REG(%l7,%f14,0xED330F207AD37D2E)
	INIT_TH_FP_REG(%l7,%f16,0xA95037406F6629C4)
	INIT_TH_FP_REG(%l7,%f18,0x5F5721C4590B32B3)
	INIT_TH_FP_REG(%l7,%f20,0x85DD52F532A93E05)
	INIT_TH_FP_REG(%l7,%f22,0x6A587BBE5E41AE43)
	INIT_TH_FP_REG(%l7,%f24,0xDBB74D3EBDBF46EE)
	INIT_TH_FP_REG(%l7,%f26,0xFB6B2B91280322B0)
	INIT_TH_FP_REG(%l7,%f28,0xE01B1A414068A246)
	INIT_TH_FP_REG(%l7,%f30,0x795BCBF2E94B92B8)

	!# Execute Main Diag ..

	nop
	set	0x67, %i7
	stb	%l0,	[%l7 + %i7]
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x89,	%i5
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x80,	%o1
	nop
	set	0x74, %o7
	ldsw	[%l7 + %o7],	%l1
	set	0x70, %g6
	sta	%f12,	[%l7 + %g6] 0x88
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd8
	or	%g7,	%o2,	%o5
	set	0x30, %i6
	sta	%f26,	[%l7 + %i6] 0x89
	nop
	set	0x2E, %l1
	sth	%g5,	[%l7 + %l1]
	nop
	set	0x52, %l4
	stb	%i2,	[%l7 + %l4]
	fpsub32s	%f21,	%f28,	%f18
	set	0x72, %g5
	stha	%l3,	[%l7 + %g5] 0x88
	nop
	set	0x32, %l2
	lduh	[%l7 + %l2],	%i0
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%i3
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f8
	nop
	set	0x58, %l0
	std	%f26,	[%l7 + %l0]
	nop
	set	0x52, %g1
	sth	%i4,	[%l7 + %g1]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc2
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%l4
	ba,a	%icc,	loop_173
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%i6
	nop
	set	0x1C, %g7
	stw	%g3,	[%l7 + %g7]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%o6
loop_173:
	and	%g1,	%o0,	%l4
	nop
	set	0x2C, %o6
	sth	%g2,	[%l7 + %o6]
	set	0x28, %l5
	stxa	%o3,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%o7
	st	%f24,	[%l7 + 0x68]
	nop
	set	0x64, %o5
	stw	%g6,	[%l7 + %o5]
	nop
	set	0x78, %l3
	ldd	[%l7 + %l3],	%f8
	set	0x28, %g3
	ldxa	[%l7 + %g3] 0x81,	%o4
	nop
	set	0x40, %i5
	std	%i6,	[%l7 + %i5]
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x88,	%l2
	st	%f18,	[%l7 + 0x68]
	set	0x68, %i2
	stwa	%i1,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x4E, %g4
	ldsh	[%l7 + %g4],	%l0
	and	%i5,	%i7,	%l1
	nop
	set	0x62, %i4
	ldub	[%l7 + %i4],	%g7
	set	0x40, %o0
	lda	[%l7 + %o0] 0x81,	%f0
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%o0
	nop
	set	0x6A, %o7
	stb	%o2,	[%l7 + %o7]
	nop
	set	0x44, %o2
	swap	[%l7 + %o2],	%o5
	set	0x70, %i6
	stxa	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x30, %l1
	ldstub	[%l7 + %l1],	%g5
	nop
	set	0x38, %g6
	stx	%l3,	[%l7 + %g6]
	nop
	set	0x3A, %l4
	sth	%i3,	[%l7 + %l4]
	set	0x4C, %g5
	sta	%f28,	[%l7 + %g5] 0x81
	set	0x30, %l6
	sta	%f28,	[%l7 + %l6] 0x89
	bleu,a	%icc,	loop_174
	nop
	set	0x52, %i1
	ldsb	[%l7 + %i1],	%i4
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x88,	 4
loop_174:
	nop
	set	0x61, %g1
	ldstub	[%l7 + %g1],	%l6
	nop
	set	0x68, %l0
	stx	%g3,	[%l7 + %l0]
	nop
	set	0x28, %o4
	std	%g4,	[%l7 + %o4]
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x81,	 4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%o0
	set	0x7C, %g7
	stwa	%o6,	[%l7 + %g7] 0x88
	nop
	set	0x31, %o3
	ldub	[%l7 + %o3],	%l4
	set	0x38, %o6
	lda	[%l7 + %o6] 0x88,	%f13
	nop
	set	0x4A, %l5
	sth	%o3,	[%l7 + %l5]
	nop
	set	0x42, %i0
	lduh	[%l7 + %i0],	%g2
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xe2,	%g6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf0
	membar	#Sync
	st	%f5,	[%l7 + 0x60]
	set	0x28, %o5
	sta	%f1,	[%l7 + %o5] 0x89
	nop
	set	0x18, %g3
	stx	%o7,	[%l7 + %g3]
	set	0x58, %g2
	lda	[%l7 + %g2] 0x81,	%f13
	set	0x5C, %i5
	lda	[%l7 + %i5] 0x81,	%f14
	ld	[%l7 + 0x40],	%f5
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%o4
	fpsub16s	%f15,	%f17,	%f14
	nop
	set	0x50, %i4
	stw	%l2,	[%l7 + %i4]
	set	0x46, %o0
	stba	%i6,	[%l7 + %o0] 0xe3
	membar	#Sync
	and	%l0,	%i5,	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%g7
	set	0x58, %i7
	lda	[%l7 + %i7] 0x81,	%f28
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd2,	%f0
	ble	%xcc,	loop_175
	add	%o1,	%o2,	%o5
	set	0x38, %g4
	stxa	%i1,	[%l7 + %g4] 0xe2
	membar	#Sync
loop_175:
	nop
	set	0x20, %i6
	stx	%g5,	[%l7 + %i6]
	and	%i2,	%l3,	%i4
	nop
	set	0x4C, %o2
	swap	[%l7 + %o2],	%i0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x88,	%i3,	%g3
	set	0x28, %l1
	stda	%i6,	[%l7 + %l1] 0x81
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x64, %g6
	lduw	[%l7 + %g6],	%l5
	set	0x68, %g5
	stda	%g0,	[%l7 + %g5] 0xea
	membar	#Sync
	add	%g4,	%o0,	%o6
	nop
	set	0x30, %l4
	ldsw	[%l7 + %l4],	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o3,	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%g6
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x3E, %l2
	stb	%o4,	[%l7 + %l2]
	set	0x10, %l6
	ldda	[%l7 + %l6] 0xeb,	%i6
	nop
	set	0x18, %l0
	std	%l0,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x78, %g1
	stx	%i5,	[%l7 + %g1]
	set	0x38, %o4
	stxa	%i7,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x5A, %g7
	ldstub	[%l7 + %g7],	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%l2
	add	%o2,	%o5,	%o1
	nop
	set	0x34, %o3
	ldsh	[%l7 + %o3],	%i1
	set	0x30, %i3
	ldda	[%l7 + %i3] 0xeb,	%g4
	set	0x78, %o6
	stda	%l2,	[%l7 + %o6] 0x89
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i4,	%i0
	set	0x57, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i3
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%g3
	or	%l6,	%i2,	%l5
	nop
	nop
	setx	0xB594A8C954EC1AEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x388CD1A20F3C8580,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f0,	%f18
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x89,	%g0
	bl,pn	%icc,	loop_176
	nop
	set	0x34, %o5
	lduw	[%l7 + %o5],	%g4
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f30
	nop
	set	0x1C, %g2
	ldsw	[%l7 + %g2],	%o0
loop_176:
	nop
	set	0x40, %g3
	stw	%l4,	[%l7 + %g3]
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%o3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%o4
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%f2
	nop
	set	0x7D, %o0
	ldstub	[%l7 + %o0],	%o7
	st	%f24,	[%l7 + 0x24]
	nop
	set	0x1E, %i5
	lduh	[%l7 + %i5],	%i6
	set	0x70, %o7
	stda	%i4,	[%l7 + %o7] 0x89
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%f6
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0
	or	%i7,	%g7,	%l1
	wr	%o2,	%o5,	%clear_softint
	nop
	set	0x70, %i7
	lduw	[%l7 + %i7],	%l2
	nop
	set	0x40, %o2
	prefetch	[%l7 + %o2],	 2
	nop
	set	0x40, %l1
	ldsw	[%l7 + %l1],	%i1
	set	0x68, %g6
	stwa	%g5,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%f28
	st	%fsr,	[%l7 + 0x64]
	fpsub16	%f12,	%f12,	%f0
	nop
	set	0x26, %g5
	ldsh	[%l7 + %g5],	%l3
	wr	%i4,	%o1,	%clear_softint
	nop
	set	0x58, %l2
	std	%i0,	[%l7 + %l2]
	ld	[%l7 + 0x64],	%f9
	set	0x67, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i3
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f4
	set	0x30, %l0
	ldstuba	[%l7 + %l0] 0x88,	%g3
	set	0x70, %o4
	ldxa	[%l7 + %o4] 0x88,	%i2
	or	%l5,	%g1,	%g4
	set	0x50, %g1
	stxa	%l6,	[%l7 + %g1] 0x88
	and	%o0,	%l4,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o3,	%g6
	nop
	set	0x77, %g7
	stb	%o6,	[%l7 + %g7]
	bl,a,pt	%xcc,	loop_177
	bne,pn	%icc,	loop_178
	add	%o4,	%o7,	%i6
	nop
	set	0x30, %i3
	lduw	[%l7 + %i3],	%i5
loop_177:
	nop
	set	0x4E, %o3
	ldsh	[%l7 + %o3],	%i7
loop_178:
	nop
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f16
	nop
	set	0x58, %o1
	lduh	[%l7 + %o1],	%g7
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f16
	nop
	set	0x78, %o5
	std	%l0,	[%l7 + %o5]
	nop
	nop
	setx	0xD12E76CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xD29CBB23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f0,	%f20
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%f30
	nop
	set	0x59, %g2
	ldub	[%l7 + %g2],	%o2
	set	0x72, %l3
	stba	%l0,	[%l7 + %l3] 0xe2
	membar	#Sync
	fpadd32	%f18,	%f24,	%f14
	set	0x10, %i2
	ldstuba	[%l7 + %i2] 0x88,	%o5
	nop
	set	0x70, %g3
	ldsh	[%l7 + %g3],	%i1
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%l2
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%l2
	set	0x26, %o7
	stha	%i4,	[%l7 + %o7] 0x81
	set	0x58, %g4
	sta	%f13,	[%l7 + %g4] 0x88
	nop
	set	0x6A, %i6
	sth	%o1,	[%l7 + %i6]
	wr	%i0,	%g5,	%pic
	st	%f20,	[%l7 + 0x30]
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd0,	%f0
	nop
	set	0x1C, %o2
	stw	%g3,	[%l7 + %o2]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x80,	%i2
	nop
	set	0x4C, %i7
	stw	%i3,	[%l7 + %i7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%g4
	nop
	set	0x14, %l4
	swap	[%l7 + %l4],	%l6
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x89
	set	0x38, %l2
	stxa	%o0,	[%l7 + %l2] 0x80
	nop
	set	0x4D, %i1
	ldsb	[%l7 + %i1],	%l4
	ld	[%l7 + 0x20],	%f11
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
	nop
	set	0x44, %l6
	prefetch	[%l7 + %l6],	 4
	nop
	set	0x4C, %l0
	ldsh	[%l7 + %l0],	%g2
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%g1
	st	%fsr,	[%l7 + 0x5C]
	and	%o3,	%o6,	%g6
	nop
	set	0x50, %g1
	std	%f12,	[%l7 + %g1]
	nop
	set	0x24, %g7
	ldsh	[%l7 + %g7],	%o7
	set	0x70, %o3
	ldxa	[%l7 + %o3] 0x80,	%i6
	nop
	set	0x10, %i3
	std	%i4,	[%l7 + %i3]
	or	%i7,	%o4,	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%g7
	set	0x6A, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l0
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%o4
	st	%f29,	[%l7 + 0x34]
	nop
	set	0x30, %o6
	lduh	[%l7 + %o6],	%l2
	nop
	set	0x60, %l5
	swap	[%l7 + %l5],	%l3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%o1
	nop
	set	0x48, %o5
	stw	%i4,	[%l7 + %o5]
	nop
	set	0x08, %l3
	std	%f6,	[%l7 + %l3]
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f28
	set	0x70, %g2
	stxa	%g5,	[%l7 + %g2] 0x80
	set	0x20, %g3
	stwa	%i0,	[%l7 + %g3] 0x88
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%i3
	nop
	set	0x40, %i5
	stx	%l5,	[%l7 + %i5]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%g4
	nop
	set	0x4C, %o0
	lduh	[%l7 + %o0],	%l6
	nop
	set	0x7B, %g4
	stb	%o0,	[%l7 + %g4]
	nop
	set	0x46, %i6
	ldub	[%l7 + %i6],	%l4
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x89,	%f2
	nop
	set	0x45, %o2
	ldub	[%l7 + %o2],	%g2
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x78, %i7
	std	%g0,	[%l7 + %i7]
	nop
	set	0x2A, %l4
	ldsh	[%l7 + %l4],	%o3
	set	0x4A, %i4
	stha	%o6,	[%l7 + %i4] 0x88
	add	%o7,	%g6,	%i5
	nop
	set	0x08, %g5
	swap	[%l7 + %g5],	%i7
	nop
	set	0x60, %l2
	std	%f8,	[%l7 + %l2]
	ld	[%l7 + 0x78],	%f20
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%i6
	and	%l1,	%o2,	%o4
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%l0
	wr	%o5,	%g7,	%softint
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%l3
	or	%l2,	%o1,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%g5
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x88,	 4
	nop
	set	0x32, %o4
	ldsb	[%l7 + %o4],	%i0
	nop
	set	0x18, %g1
	ldstub	[%l7 + %g1],	%i3
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xea,	%l4
	nop
	set	0x3C, %o3
	lduw	[%l7 + %o3],	%i2
	nop
	set	0x14, %i3
	sth	%g4,	[%l7 + %i3]
	nop
	set	0x18, %o1
	std	%o0,	[%l7 + %o1]
	and	%l6,	%l4,	%g1
	and	%o3,	%g2,	%o7
	or	%g6,	%i5,	%i7
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f16
	nop
	set	0x68, %i0
	lduw	[%l7 + %i0],	%i6
	nop
	set	0x60, %o5
	stx	%o6,	[%l7 + %o5]
	nop
	set	0x14, %l3
	lduh	[%l7 + %l3],	%l1
	nop
	nop
	setx	0x15A5AA3E07E1BB2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF4C6464AB9BAC164,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f0
	and	%o4,	%l0,	%o2
	set	0x28, %l5
	lda	[%l7 + %l5] 0x89,	%f2
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f14
	nop
	set	0x14, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f10
	add	%o5,	%l3,	%g7
	add	%l2,	%i1,	%i4
	bl,a	%xcc,	loop_179
	and	%g5,	%g3,	%o1
	set	0x38, %o0
	swapa	[%l7 + %o0] 0x89,	%i3
loop_179:
	nop
	set	0x60, %i5
	stwa	%l5,	[%l7 + %i5] 0x89
	fpsub16	%f26,	%f6,	%f14
	add	%i2,	%g4,	%o0
	set	0x32, %g4
	stha	%l6,	[%l7 + %g4] 0xe3
	membar	#Sync
	bgu,a,pt	%xcc,	loop_180
	add	%i0,	%g1,	%l4
	nop
	set	0x14, %i6
	lduw	[%l7 + %i6],	%o3
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%g2
loop_180:
	add	%o7,	%g6,	%i7
	nop
	set	0x63, %o2
	ldstub	[%l7 + %o2],	%i6
	and	%i5,	%l1,	%o4
	nop
	set	0x78, %i7
	sth	%l0,	[%l7 + %i7]
	nop
	set	0x0A, %l4
	ldstub	[%l7 + %l4],	%o6
	ld	[%l7 + 0x4C],	%f4
	set	0x48, %l1
	stda	%o2,	[%l7 + %l1] 0x89
	fpadd32	%f2,	%f20,	%f12
	ld	[%l7 + 0x20],	%f13
	set	0x10, %g5
	stxa	%l3,	[%l7 + %g5] 0xe2
	membar	#Sync
	add	%g7,	%o5,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%i1
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe3,	%g2
	nop
	set	0x14, %i1
	sth	%g5,	[%l7 + %i1]
	nop
	set	0x08, %l6
	ldsw	[%l7 + %l6],	%i3
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%l5
	fpadd32s	%f29,	%f11,	%f6
	nop
	set	0x7C, %l2
	ldsw	[%l7 + %l2],	%o1
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x80,	%g4
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%o0
	nop
	set	0x74, %g6
	ldsw	[%l7 + %g6],	%l6
	nop
	set	0x40, %g7
	lduh	[%l7 + %g7],	%i2
	and	%i0,	%l4,	%g1
	nop
	set	0x74, %i3
	ldub	[%l7 + %i3],	%o3
	nop
	set	0x4C, %o3
	stw	%g2,	[%l7 + %o3]
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x80,	%o7
	set	0x5F, %i0
	stba	%i7,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x14, %o6
	swap	[%l7 + %o6],	%g6
	nop
	set	0x65, %l3
	ldsb	[%l7 + %l3],	%i6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x80,	%l1,	%o4
	fpadd16	%f18,	%f26,	%f22
	nop
	set	0x10, %l5
	ldsh	[%l7 + %l5],	%i5
	nop
	set	0x40, %o5
	swap	[%l7 + %o5],	%o6
	nop
	set	0x54, %g2
	ldub	[%l7 + %g2],	%l0
	set	0x78, %i2
	stha	%l3,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x20, %o0
	stw	%o2,	[%l7 + %o0]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l2
	and	%g7,	%i1,	%i4
	nop
	set	0x08, %g3
	lduh	[%l7 + %g3],	%g3
	nop
	set	0x38, %i5
	stb	%i3,	[%l7 + %i5]
	nop
	set	0x13, %g4
	ldub	[%l7 + %g4],	%l5
	and	%o1,	%g5,	%o0
	set	0x18, %i6
	prefetcha	[%l7 + %i6] 0x81,	 0
	add	%l6,	%i2,	%i0
	and	%g1,	%l4,	%o3
	or	%o7,	%g2,	%i7
	nop
	set	0x20, %o7
	std	%f24,	[%l7 + %o7]
	or	%g6,	%l1,	%o4
	nop
	set	0x37, %o2
	ldstub	[%l7 + %o2],	%i5
	nop
	set	0x50, %l4
	ldx	[%l7 + %l4],	%o6
	nop
	set	0x70, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x88,	 3
	set	0x2C, %i4
	stha	%l3,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x70, %g5
	ldsb	[%l7 + %g5],	%i6
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x18, %l0
	swap	[%l7 + %l0],	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o2,	%g7
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f0
	set	0x10, %l6
	sta	%f10,	[%l7 + %l6] 0x81
	wr	%l2,	%i4,	%ccr
	nop
	set	0x66, %g1
	lduh	[%l7 + %g1],	%i1
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%g2
	nop
	set	0x18, %g7
	lduw	[%l7 + %g7],	%i3
	nop
	set	0x48, %i3
	ldx	[%l7 + %i3],	%l5
	nop
	set	0x7E, %o3
	sth	%o1,	[%l7 + %o3]
	nop
	set	0x2D, %o1
	ldstub	[%l7 + %o1],	%o0
	nop
	set	0x68, %i0
	ldsw	[%l7 + %i0],	%g4
	nop
	set	0x68, %g6
	stx	%g5,	[%l7 + %g6]
	ld	[%l7 + 0x40],	%f2
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x70, %l3
	ldsw	[%l7 + %l3],	%i2
	nop
	set	0x08, %o6
	ldsb	[%l7 + %o6],	%l6
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x89,	 2
	ld	[%l7 + 0x28],	%f12
	set	0x40, %g2
	lda	[%l7 + %g2] 0x89,	%f10
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%l4
	nop
	set	0x67, %o5
	ldsb	[%l7 + %o5],	%o7
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f12
	nop
	set	0x21, %g3
	ldstub	[%l7 + %g3],	%g2
	nop
	set	0x46, %i2
	stb	%i7,	[%l7 + %i2]
	nop
	set	0x7E, %i5
	lduh	[%l7 + %i5],	%o3
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x89,	 1
	or	%o4,	%i5,	%g6
	ld	[%l7 + 0x44],	%f21
	set	0x1C, %o7
	sta	%f30,	[%l7 + %o7] 0x81
	nop
	set	0x08, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x18, %o2
	ldstub	[%l7 + %o2],	%o6
	set	0x18, %l1
	stxa	%l3,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x0C, %l4
	lduw	[%l7 + %l4],	%l0
	or	%o5,	%i6,	%g7
	set	0x40, %i7
	sta	%f2,	[%l7 + %i7] 0x81
	set	0x09, %g5
	stba	%o2,	[%l7 + %g5] 0x81
	set	0x38, %i4
	stda	%l2,	[%l7 + %i4] 0xe2
	membar	#Sync
	add	%i4,	%i1,	%i3
	ld	[%l7 + 0x40],	%f18
	set	0x0C, %l0
	stha	%g3,	[%l7 + %l0] 0x89
	st	%f29,	[%l7 + 0x10]
	nop
	set	0x0E, %l2
	lduh	[%l7 + %l2],	%l5
	add	%o0,	%g4,	%o1
	nop
	set	0x2C, %l6
	ldsh	[%l7 + %l6],	%g5
	nop
	set	0x3B, %g1
	ldub	[%l7 + %g1],	%l6
	or	%i2,	%g1,	%l4
	nop
	set	0x78, %o4
	std	%f26,	[%l7 + %o4]
	or	%i0,	%o7,	%i7
	set	0x68, %i1
	ldxa	[%l7 + %i1] 0x81,	%g2
	add	%o3,	%l1,	%i5
	and	%g6,	%o6,	%o4
	nop
	set	0x78, %g7
	lduh	[%l7 + %g7],	%l0
	wr	%l3,	%o5,	%y
	set	0x54, %o3
	lda	[%l7 + %o3] 0x80,	%f29
	ld	[%l7 + 0x6C],	%f0
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x16, %o1
	sth	%g7,	[%l7 + %o1]
	and	%o2,	%i6,	%l2
	fpsub32s	%f15,	%f4,	%f21
	set	0x20, %i0
	stwa	%i4,	[%l7 + %i0] 0x88
	set	0x6E, %i3
	stba	%i3,	[%l7 + %i3] 0x88
	nop
	set	0x40, %g6
	swap	[%l7 + %g6],	%g3
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd8
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%i1
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f22
	or	%l5,	%g4,	%o0
	nop
	set	0x46, %o5
	sth	%o1,	[%l7 + %o5]
	nop
	set	0x3C, %o0
	lduw	[%l7 + %o0],	%g5
	set	0x0C, %o6
	lda	[%l7 + %o6] 0x80,	%f25
	set	0x18, %i2
	lda	[%l7 + %i2] 0x80,	%f26
	set	0x1E, %g3
	stba	%i2,	[%l7 + %g3] 0x80
	add	%g1,	%l6,	%i0
	set	0x48, %i6
	stda	%l4,	[%l7 + %i6] 0x80
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	nop
	set	0x30, %g4
	stw	%o7,	[%l7 + %g4]
	nop
	set	0x2C, %o2
	ldub	[%l7 + %o2],	%g2
	fpadd32	%f8,	%f10,	%f10
	set	0x3C, %i5
	sta	%f20,	[%l7 + %i5] 0x89
	nop
	set	0x7D, %l4
	stb	%i7,	[%l7 + %l4]
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x81,	%l0
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f0
	be,a,pn	%icc,	loop_181
	nop
	set	0x58, %i4
	sth	%i5,	[%l7 + %i4]
	nop
	nop
	setx	0x38532F87B92354C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5ED09F8DF703F120,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f14
	fpsub16	%f16,	%f20,	%f22
loop_181:
	nop
	set	0x68, %g5
	ldxa	[%l7 + %g5] 0x80,	%o3
	set	0x2C, %l2
	sta	%f12,	[%l7 + %l2] 0x88
	ld	[%l7 + 0x40],	%f30
	and	%g6,	%o4,	%o6
	set	0x78, %l0
	stda	%l2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x0C, %l6
	sth	%o5,	[%l7 + %l6]
	nop
	set	0x5D, %g1
	ldstub	[%l7 + %g1],	%l0
	st	%fsr,	[%l7 + 0x10]
	bge	%icc,	loop_182
	nop
	set	0x0C, %o4
	swap	[%l7 + %o4],	%o2
	nop
	set	0x58, %i1
	ldsw	[%l7 + %i1],	%g7
	nop
	set	0x24, %o3
	ldsb	[%l7 + %o3],	%i6
loop_182:
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%i4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xf9
	membar	#Sync
	nop
	set	0x48, %i3
	std	%l2,	[%l7 + %i3]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	nop
	set	0x77, %l3
	ldub	[%l7 + %l3],	%g3
	nop
	set	0x08, %g7
	sth	%i1,	[%l7 + %g7]
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd0
	nop
	set	0x76, %l5
	sth	%i3,	[%l7 + %l5]
	or	%g4,	%l5,	%o0
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf0,	%f16
	set	0x68, %o6
	sta	%f14,	[%l7 + %o6] 0x81
	or	%o1,	%g5,	%i2
	set	0x58, %o5
	lda	[%l7 + %o5] 0x80,	%f4
	and	%g1,	%l6,	%l4
	nop
	set	0x42, %g3
	stb	%o7,	[%l7 + %g3]
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%i0
	nop
	set	0x2E, %o7
	ldstub	[%l7 + %o7],	%i7
	ld	[%l7 + 0x70],	%f0
	set	0x08, %i6
	prefetcha	[%l7 + %i6] 0x89,	 4
	set	0x54, %g4
	stha	%g2,	[%l7 + %g4] 0x81
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%i4
	set	0x08, %l4
	lda	[%l7 + %l4] 0x80,	%f30
	nop
	set	0x1C, %i7
	ldsh	[%l7 + %i7],	%g6
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	nop
	set	0x08, %l1
	sth	%o4,	[%l7 + %l1]
	nop
	set	0x48, %g5
	stx	%o3,	[%l7 + %g5]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f16
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	set	0x5C, %l6
	stwa	%l3,	[%l7 + %l6] 0x80
	set	0x74, %i4
	swapa	[%l7 + %i4] 0x81,	%o6
	nop
	set	0x0B, %o4
	ldsb	[%l7 + %o4],	%l0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xea,	%o4
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%g6
	st	%fsr,	[%l7 + 0x58]
	wr	%i6,	%o2,	%set_softint
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%i4
	or	%l2,	%g3,	%i3
	st	%f11,	[%l7 + 0x60]
	nop
	set	0x4C, %i0
	stw	%i1,	[%l7 + %i0]
	set	0x30, %i3
	stda	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x30, %g6
	stwa	%l5,	[%l7 + %g6] 0xea
	membar	#Sync
	set	0x73, %l3
	stba	%o1,	[%l7 + %l3] 0x89
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i2
	nop
	set	0x61, %g7
	ldub	[%l7 + %g7],	%g1
	nop
	set	0x64, %g2
	swap	[%l7 + %g2],	%l6
	st	%f27,	[%l7 + 0x1C]
	nop
	set	0x24, %o1
	lduw	[%l7 + %o1],	%l4
	set	0x18, %o0
	prefetcha	[%l7 + %o0] 0x81,	 0
	set	0x67, %l5
	stba	%o0,	[%l7 + %l5] 0x89
	set	0x4E, %o6
	stba	%i7,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x58, %o5
	prefetch	[%l7 + %o5],	 1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%g2
	add	%i5,	%l1,	%o4
	set	0x7B, %g3
	stba	%o3,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x1A, %o7
	lduh	[%l7 + %o7],	%g6
	set	0x70, %i6
	ldxa	[%l7 + %i6] 0x80,	%l3
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%o6
	and	%o5,	%l0,	%i6
	nop
	set	0x58, %l4
	std	%f26,	[%l7 + %l4]
	nop
	set	0x34, %g4
	ldsh	[%l7 + %g4],	%g7
	set	0x38, %i7
	sta	%f13,	[%l7 + %i7] 0x88
	nop
	set	0x10, %i5
	stx	%o2,	[%l7 + %i5]
	set	0x66, %l1
	ldstuba	[%l7 + %l1] 0x80,	%l2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xc8
	be,a	%xcc,	loop_183
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%g2
	and	%i3,	%i4,	%i1
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%l5
loop_183:
	nop
	set	0x40, %i4
	ldxa	[%l7 + %i4] 0x88,	%o1
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x88,	%g4
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f20
	ld	[%l7 + 0x38],	%f22
	nop
	set	0x08, %o3
	ldsh	[%l7 + %o3],	%g5
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xc2
	set	0x1C, %i0
	lda	[%l7 + %i0] 0x88,	%f18
	set	0x3C, %i3
	lda	[%l7 + %i3] 0x80,	%f13
	fpadd32s	%f16,	%f22,	%f28
	set	0x60, %g1
	lda	[%l7 + %g1] 0x81,	%f16
	st	%f3,	[%l7 + 0x48]
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%g1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xd2
	st	%f1,	[%l7 + 0x24]
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%l6
	ld	[%l7 + 0x40],	%f16
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%f8
	nop
	set	0x30, %o0
	prefetch	[%l7 + %o0],	 4
	bn	%icc,	loop_184
	nop
	set	0x55, %l5
	stb	%l4,	[%l7 + %l5]
	set	0x16, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o7
loop_184:
	add	%i2,	%o0,	%i0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f0
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f16
	nop
	nop
	setx	0x6FBBA2DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x5D3C9246,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f23,	%f28
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xe2,	%g2
	set	0x58, %o7
	ldxa	[%l7 + %o7] 0x88,	%i7
	st	%fsr,	[%l7 + 0x48]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf9
	membar	#Sync
	st	%f16,	[%l7 + 0x38]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l1
	set	0x50, %i2
	stxa	%o3,	[%l7 + %i2] 0x88
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x89
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%g6
	ld	[%l7 + 0x5C],	%f15
	nop
	set	0x14, %i7
	lduw	[%l7 + %i7],	%l3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd8,	%f16
	set	0x69, %l1
	ldstuba	[%l7 + %l1] 0x81,	%o4
	nop
	set	0x70, %l2
	lduh	[%l7 + %l2],	%o5
	set	0x50, %l6
	lda	[%l7 + %l6] 0x80,	%f27
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%o6
	nop
	set	0x62, %o4
	stb	%i6,	[%l7 + %o4]
	nop
	set	0x30, %i1
	ldsw	[%l7 + %i1],	%g7
	set	0x30, %o3
	lda	[%l7 + %o3] 0x80,	%f20
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f0
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%l0
	nop
	set	0x4D, %i3
	stb	%o2,	[%l7 + %i3]
	nop
	set	0x6D, %g1
	stb	%g3,	[%l7 + %g1]
	or	%i3,	%i4,	%l2
	set	0x3A, %l3
	stha	%i1,	[%l7 + %l3] 0x89
	or	%l5,	%g4,	%o1
	set	0x24, %g7
	stwa	%g1,	[%l7 + %g7] 0x88
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xca
	nop
	set	0x2C, %g6
	swap	[%l7 + %g6],	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%o7
	set	0x74, %o1
	swapa	[%l7 + %o1] 0x81,	%i2
	st	%fsr,	[%l7 + 0x4C]
	ld	[%l7 + 0x10],	%f25
	set	0x40, %l5
	sta	%f20,	[%l7 + %l5] 0x88
	wr	%o0,	%l4,	%clear_softint
	set	0x4B, %o0
	stba	%g2,	[%l7 + %o0] 0x81
	nop
	set	0x5A, %g2
	lduh	[%l7 + %g2],	%i0
	nop
	set	0x78, %o6
	ldub	[%l7 + %o6],	%i7
	set	0x70, %o5
	sta	%f10,	[%l7 + %o5] 0x88
	set	0x49, %o7
	ldstuba	[%l7 + %o7] 0x80,	%i5
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%o3
	fpsub16	%f10,	%f28,	%f22
	st	%fsr,	[%l7 + 0x20]
	fpadd16s	%f3,	%f14,	%f19
	set	0x49, %g3
	stba	%g6,	[%l7 + %g3] 0x89
	set	0x58, %l4
	stxa	%l3,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x69, %o2
	ldsb	[%l7 + %o2],	%o4
	ld	[%l7 + 0x68],	%f19
	set	0x40, %g4
	sta	%f8,	[%l7 + %g4] 0x89
	set	0x1F, %i7
	stba	%o5,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x3D, %i2
	stb	%o6,	[%l7 + %i2]
	nop
	set	0x68, %l1
	ldsw	[%l7 + %l1],	%i6
	nop
	set	0x36, %l2
	stb	%l1,	[%l7 + %l2]
	and	%l0,	%o2,	%g7
	set	0x58, %l6
	sta	%f7,	[%l7 + %l6] 0x89
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%g3
	st	%fsr,	[%l7 + 0x58]
	set	0x16, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i3
	nop
	set	0x14, %g5
	lduw	[%l7 + %g5],	%l2
	nop
	set	0x13, %o3
	ldsb	[%l7 + %o3],	%i1
	nop
	set	0x3C, %i1
	stw	%l5,	[%l7 + %i1]
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd2,	%f16
	wr	%i4,	%g4,	%clear_softint
	nop
	set	0x59, %i4
	stb	%o1,	[%l7 + %i4]
	nop
	set	0x44, %i3
	stw	%g1,	[%l7 + %i3]
	bne	%xcc,	loop_185
	nop
	set	0x23, %l3
	stb	%l6,	[%l7 + %l3]
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%g5
	nop
	set	0x78, %i0
	stw	%i2,	[%l7 + %i0]
loop_185:
	nop
	set	0x28, %g1
	stwa	%o7,	[%l7 + %g1] 0x80
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x81
	and	%l4,	%g2,	%i0
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	ld	[%l7 + 0x44],	%f15
	add	%o0,	%o3,	%g6
	nop
	set	0x44, %l5
	sth	%l3,	[%l7 + %l5]
	add	%i5,	%o5,	%o4
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x89,	%o6
	nop
	set	0x3A, %o6
	ldub	[%l7 + %o6],	%i6
	nop
	set	0x54, %g2
	ldsw	[%l7 + %g2],	%l0
	add	%l1,	%g7,	%o2
	or	%i3,	%l2,	%g3
	set	0x20, %o7
	stda	%i0,	[%l7 + %o7] 0x89
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xe3,	%l4
	st	%f26,	[%l7 + 0x24]
	set	0x38, %o5
	swapa	[%l7 + %o5] 0x81,	%i4
	set	0x70, %l4
	swapa	[%l7 + %l4] 0x81,	%o1
	wr	%g4,	%l6,	%softint
	nop
	set	0x11, %g3
	ldub	[%l7 + %g3],	%g1
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x88,	%g5
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
	nop
	set	0x74, %i7
	ldsb	[%l7 + %i7],	%i2
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xea,	%l4
	and	%o7,	%i0,	%g2
	nop
	set	0x2C, %l1
	lduw	[%l7 + %l1],	%o0
	set	0x60, %l2
	stda	%o2,	[%l7 + %l2] 0x89
	nop
	set	0x31, %l6
	stb	%i7,	[%l7 + %l6]
	nop
	set	0x17, %o4
	ldub	[%l7 + %o4],	%l3
	set	0x56, %i5
	stha	%i5,	[%l7 + %i5] 0x88
	nop
	set	0x50, %o3
	ldsb	[%l7 + %o3],	%o5
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x81,	%o4
	nop
	set	0x50, %l0
	stw	%o6,	[%l7 + %l0]
	and	%g6,	%l0,	%l1
	nop
	set	0x10, %i1
	stx	%i6,	[%l7 + %i1]
	fpsub16s	%f7,	%f30,	%f15
	nop
	set	0x35, %i3
	ldsb	[%l7 + %i3],	%g7
	set	0x60, %l3
	lda	[%l7 + %l3] 0x89,	%f24
	set	0x08, %i4
	stda	%i2,	[%l7 + %i4] 0xea
	membar	#Sync
	or	%l2,	%g3,	%i1
	st	%fsr,	[%l7 + 0x64]
	st	%f9,	[%l7 + 0x44]
	st	%f29,	[%l7 + 0x5C]
	nop
	set	0x50, %g7
	ldx	[%l7 + %g7],	%l5
	ld	[%l7 + 0x54],	%f23
	nop
	set	0x46, %i0
	sth	%i4,	[%l7 + %i0]
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%o2
	nop
	set	0x08, %o1
	std	%f0,	[%l7 + %o1]
	set	0x48, %g6
	stha	%o1,	[%l7 + %g6] 0xea
	membar	#Sync
	nop
	set	0x49, %o0
	ldsb	[%l7 + %o0],	%l6
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%g1
	nop
	set	0x60, %l5
	std	%f26,	[%l7 + %l5]
	nop
	set	0x0E, %g2
	lduh	[%l7 + %g2],	%g4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%i2
	set	0x50, %i6
	stwa	%o7,	[%l7 + %i6] 0x88
	nop
	set	0x58, %o5
	lduw	[%l7 + %o5],	%i0
	set	0x3C, %o7
	sta	%f19,	[%l7 + %o7] 0x80
	and	%l4,	%g2,	%o3
	nop
	set	0x18, %l4
	ldsh	[%l7 + %l4],	%i7
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%f18
	set	0x15, %g3
	stba	%o0,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x30, %g4
	sta	%f17,	[%l7 + %g4] 0x80
	nop
	set	0x68, %i2
	stx	%l3,	[%l7 + %i2]
	nop
	set	0x30, %i7
	sth	%o5,	[%l7 + %i7]
	and	%o4,	%i5,	%o6
	set	0x60, %l1
	ldxa	[%l7 + %l1] 0x88,	%l0
	nop
	set	0x5C, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x57, %o4
	ldstub	[%l7 + %o4],	%g6
	set	0x58, %i5
	stda	%i6,	[%l7 + %i5] 0x81
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%g7
	nop
	set	0x0B, %o3
	stb	%i3,	[%l7 + %o3]
	nop
	set	0x78, %l6
	lduw	[%l7 + %l6],	%l2
	nop
	set	0x58, %l0
	stx	%fsr,	[%l7 + %l0]
	fpsub32	%f30,	%f0,	%f22
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%g2
	nop
	set	0x10, %g5
	stb	%i1,	[%l7 + %g5]
	set	0x08, %l3
	ldstuba	[%l7 + %l3] 0x88,	%i4
	nop
	set	0x12, %i4
	sth	%l5,	[%l7 + %i4]
	nop
	set	0x7F, %i3
	stb	%o1,	[%l7 + %i3]
	and	%l6,	%o2,	%g4
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%g4
	nop
	set	0x60, %i0
	std	%i2,	[%l7 + %i0]
	nop
	nop
	setx	0x7D655156,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xB816D059,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f16,	%f4
	set	0x60, %g1
	stxa	%o7,	[%l7 + %g1] 0x88
	set	0x48, %o1
	stwa	%g1,	[%l7 + %o1] 0x88
	nop
	set	0x1C, %g6
	swap	[%l7 + %g6],	%l4
	fpadd16	%f14,	%f4,	%f4
	nop
	set	0x7A, %o6
	lduh	[%l7 + %o6],	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%g2
	set	0x78, %l5
	stda	%o0,	[%l7 + %l5] 0x89
	set	0x4C, %g2
	sta	%f16,	[%l7 + %g2] 0x89
	nop
	set	0x48, %o0
	std	%l2,	[%l7 + %o0]
	nop
	set	0x73, %o5
	stb	%i7,	[%l7 + %o5]
	nop
	set	0x6B, %o7
	stb	%o4,	[%l7 + %o7]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%o6
	nop
	set	0x60, %l4
	prefetch	[%l7 + %l4],	 0
	add	%l0,	%g6,	%i5
	nop
	set	0x64, %i6
	lduw	[%l7 + %i6],	%l1
	wr	%i6,	%i3,	%y
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%g7
	st	%fsr,	[%l7 + 0x08]
	or	%g3,	%i1,	%l2
	set	0x1C, %g4
	stwa	%l5,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x3A, %g3
	sth	%o1,	[%l7 + %g3]
	set	0x24, %i2
	stba	%l6,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x30, %i7
	stwa	%o2,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x38, %l2
	stx	%g4,	[%l7 + %l2]
	set	0x30, %o4
	stxa	%g5,	[%l7 + %o4] 0x81
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%i4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xda,	%f16
	bgu,pt	%icc,	loop_186
	nop
	set	0x38, %o3
	stw	%g1,	[%l7 + %o3]
	set	0x77, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l4
loop_186:
	nop
	set	0x08, %l0
	stx	%o7,	[%l7 + %l0]
	set	0x5B, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o3
	nop
	set	0x18, %i5
	std	%g2,	[%l7 + %i5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%l3
	or	%o0,	%o4,	%i7
	nop
	set	0x20, %l3
	stx	%o6,	[%l7 + %l3]
	nop
	set	0x0C, %i4
	stw	%l0,	[%l7 + %i4]
	wr	%g6,	%o5,	%set_softint
	nop
	set	0x38, %g5
	lduh	[%l7 + %g5],	%l1
	set	0x16, %i3
	stha	%i6,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x68, %i0
	stxa	%i5,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x60, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x50, %g1
	sta	%f7,	[%l7 + %g1] 0x88
	nop
	set	0x41, %g6
	ldstub	[%l7 + %g6],	%g7
	add	%g3,	%i1,	%i3
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f24
	nop
	set	0x08, %g2
	std	%l4,	[%l7 + %g2]
	set	0x78, %o0
	stwa	%l2,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x88,	%i6
	nop
	set	0x44, %o7
	lduh	[%l7 + %o7],	%o2
	set	0x2C, %o6
	sta	%f24,	[%l7 + %o6] 0x80
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%g4
	bn	%icc,	loop_187
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%o1
	nop
	set	0x3A, %o2
	stb	%g5,	[%l7 + %o2]
	nop
	set	0x40, %g3
	stx	%i4,	[%l7 + %g3]
loop_187:
	nop
	set	0x55, %g4
	ldsb	[%l7 + %g4],	%g1
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x89,	%i2
	and	%l4,	%o7,	%g2
	nop
	set	0x2F, %l2
	ldsb	[%l7 + %l2],	%i0
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x45, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o3
	set	0x2C, %i2
	sta	%f13,	[%l7 + %i2] 0x81
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x88,	%l3
	set	0x28, %l0
	stda	%o4,	[%l7 + %l0] 0x89
	set	0x54, %l6
	sta	%f8,	[%l7 + %l6] 0x80
	set	0x08, %i1
	swapa	[%l7 + %i1] 0x80,	%i7
	set	0x4E, %l3
	stha	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%o6
	bl,a	%icc,	loop_188
	and	%l0,	%g6,	%o5
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%i5
loop_188:
	nop
	set	0x40, %i4
	swap	[%l7 + %i4],	%g7
	set	0x69, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%i3
	nop
	set	0x24, %i0
	stw	%l2,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x08, %o1
	ldstub	[%l7 + %o1],	%l5
	nop
	set	0x18, %g1
	std	%f16,	[%l7 + %g1]
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x81,	 2
	set	0x54, %i3
	lda	[%l7 + %i3] 0x80,	%f23
	nop
	set	0x2B, %g2
	ldsb	[%l7 + %g2],	%g4
	set	0x74, %l5
	stwa	%o1,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x10, %o0
	stxa	%o2,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x60, %o7
	stha	%g5,	[%l7 + %o7] 0x80
	nop
	set	0x5C, %o5
	sth	%i4,	[%l7 + %o5]
	nop
	set	0x6C, %l4
	ldsw	[%l7 + %l4],	%i2
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x81,	 4
	nop
	set	0x58, %i6
	std	%f16,	[%l7 + %i6]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l4,	%g2
	set	0x74, %g3
	swapa	[%l7 + %g3] 0x88,	%o7
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f16
	and	%i0,	%l3,	%o4
	nop
	set	0x18, %i7
	std	%f18,	[%l7 + %i7]
	set	0x20, %l2
	ldda	[%l7 + %l2] 0xeb,	%i6
	nop
	set	0x5F, %o2
	stb	%o0,	[%l7 + %o2]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l0
	nop
	set	0x28, %o4
	lduw	[%l7 + %o4],	%o3
	set	0x10, %i2
	stda	%o4,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x89,	 4
	ld	[%l7 + 0x24],	%f14
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%i6
	set	0x7C, %l6
	stwa	%l1,	[%l7 + %l6] 0xea
	membar	#Sync
	or	%i5,	%i1,	%g7
	nop
	set	0x52, %l0
	ldsb	[%l7 + %l0],	%i3
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	set	0x64, %i5
	stwa	%l5,	[%l7 + %i5] 0x89
	set	0x34, %l3
	swapa	[%l7 + %l3] 0x88,	%g3
	set	0x78, %i4
	stxa	%l6,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x43, %g7
	stb	%o1,	[%l7 + %g7]
	nop
	set	0x60, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x21, %o1
	stba	%g4,	[%l7 + %o1] 0x80
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd8,	%f0
	nop
	set	0x58, %g1
	lduh	[%l7 + %g1],	%g5
	nop
	set	0x20, %i3
	lduh	[%l7 + %i3],	%i4
	nop
	set	0x4C, %g6
	lduh	[%l7 + %g6],	%i2
	set	0x48, %g2
	stha	%g1,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x34, %o0
	ldsb	[%l7 + %o0],	%l4
	and	%o2,	%o7,	%g2
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%f0
	ld	[%l7 + 0x34],	%f7
	nop
	set	0x78, %o5
	std	%l2,	[%l7 + %o5]
	nop
	set	0x7A, %o7
	ldstub	[%l7 + %o7],	%o4
	nop
	set	0x21, %o6
	stb	%i0,	[%l7 + %o6]
	and	%o0,	%o6,	%i7
	nop
	set	0x64, %i6
	stw	%o3,	[%l7 + %i6]
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%l0
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x81,	 2
	nop
	set	0x08, %g4
	std	%g6,	[%l7 + %g4]
	nop
	set	0x68, %l2
	lduw	[%l7 + %l2],	%l1
	nop
	set	0x4E, %o2
	ldsh	[%l7 + %o2],	%i5
	nop
	set	0x68, %o4
	sth	%i1,	[%l7 + %o4]
	fpsub16	%f6,	%f10,	%f24
	and	%i6,	%g7,	%i3
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%l2
	set	0x35, %i2
	stba	%g3,	[%l7 + %i2] 0x88
	and	%l6,	%o1,	%g4
	set	0x0C, %l1
	lda	[%l7 + %l1] 0x81,	%f20
	nop
	set	0x47, %l6
	ldsb	[%l7 + %l6],	%l5
	set	0x58, %o3
	stxa	%i4,	[%l7 + %o3] 0x88
	nop
	set	0x18, %l0
	stx	%g5,	[%l7 + %l0]
	nop
	set	0x50, %i5
	std	%i2,	[%l7 + %i5]
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x81,	%l4
	and	%g1,	%o2,	%g2
	set	0x30, %i4
	ldxa	[%l7 + %i4] 0x80,	%l3
	nop
	set	0x2E, %l3
	ldsb	[%l7 + %l3],	%o7
	or	%i0,	%o4,	%o0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x70, %g7
	stda	%l0,	[%l7 + %g7] 0x80
	nop
	set	0x0D, %g5
	stb	%o3,	[%l7 + %g5]
	nop
	set	0x26, %i0
	ldsh	[%l7 + %i0],	%g6
	nop
	set	0x78, %g1
	std	%f16,	[%l7 + %g1]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%l1
	nop
	set	0x24, %o1
	lduh	[%l7 + %o1],	%i1
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%i6
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f16
	nop
	set	0x50, %o0
	std	%f10,	[%l7 + %o0]
	or	%g7,	%i5,	%i3
	nop
	set	0x58, %l5
	std	%l2,	[%l7 + %l5]
	nop
	set	0x78, %o5
	lduw	[%l7 + %o5],	%l6
	nop
	set	0x18, %i3
	ldsw	[%l7 + %i3],	%g3
	st	%fsr,	[%l7 + 0x7C]
	set	0x55, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g4
	ld	[%l7 + 0x58],	%f20
	set	0x40, %i6
	sta	%f22,	[%l7 + %i6] 0x80
	set	0x52, %g3
	ldstuba	[%l7 + %g3] 0x88,	%l5
	set	0x72, %l4
	ldstuba	[%l7 + %l4] 0x88,	%i4
	nop
	set	0x40, %g4
	sth	%g5,	[%l7 + %g4]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf8
	membar	#Sync
	set	0x7D, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i2
	set	0x78, %l2
	stha	%o1,	[%l7 + %l2] 0x81
	set	0x18, %i7
	stda	%g0,	[%l7 + %i7] 0x88
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x81,	%l4,	%g2
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%l2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%o2
	nop
	set	0x0C, %i2
	lduh	[%l7 + %i2],	%i0
	set	0x29, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o4
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%i7
	set	0x78, %l0
	stxa	%o0,	[%l7 + %l0] 0x81
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc8
	set	0x28, %o3
	stda	%l0,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x28, %i1
	stda	%o2,	[%l7 + %i1] 0xea
	membar	#Sync
	wr	%o6,	%g6,	%ccr
	nop
	set	0x14, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x48, %i4
	stb	%o5,	[%l7 + %i4]
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%i0
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x89,	%i6
	bge,pn	%xcc,	loop_189
	ld	[%l7 + 0x18],	%f29
	set	0x35, %g7
	stba	%l1,	[%l7 + %g7] 0x80
loop_189:
	nop
	set	0x3A, %g1
	ldub	[%l7 + %g1],	%g7
	nop
	set	0x48, %g6
	ldsh	[%l7 + %g6],	%i5
	nop
	set	0x26, %o1
	ldsb	[%l7 + %o1],	%l2
	set	0x70, %o0
	ldda	[%l7 + %o0] 0xe3,	%i6
	nop
	set	0x1A, %g2
	ldsb	[%l7 + %g2],	%g3
	nop
	set	0x3E, %o5
	sth	%i3,	[%l7 + %o5]
	nop
	set	0x72, %i3
	ldsh	[%l7 + %i3],	%g4
	set	0x54, %o7
	swapa	[%l7 + %o7] 0x80,	%i4
	set	0x4C, %l5
	stwa	%g5,	[%l7 + %l5] 0x81
	nop
	set	0x70, %i6
	std	%f22,	[%l7 + %i6]
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x88,	 0
	nop
	set	0x50, %g3
	ldx	[%l7 + %g3],	%o1
	nop
	set	0x72, %g4
	ldsb	[%l7 + %g4],	%l5
	set	0x62, %o6
	stba	%g1,	[%l7 + %o6] 0xe3
	membar	#Sync
	add	%l4,	%l3,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%i0
	nop
	set	0x30, %o2
	std	%o4,	[%l7 + %o2]
	nop
	set	0x18, %i7
	prefetch	[%l7 + %i7],	 4
	and	%o2,	%o0,	%i7
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%o3
	set	0x70, %l2
	stxa	%o6,	[%l7 + %l2] 0x89
	nop
	set	0x3A, %l6
	lduh	[%l7 + %l6],	%l0
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%o4
	nop
	set	0x55, %l1
	ldub	[%l7 + %l1],	%g6
	set	0x50, %i5
	stwa	%i6,	[%l7 + %i5] 0x81
	nop
	set	0x5C, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x10, %o3
	ldda	[%l7 + %o3] 0xeb,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%i5
	nop
	set	0x0C, %i1
	lduw	[%l7 + %i1],	%l2
	add	%g7,	%l6,	%i3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g4,	%i4
	nop
	nop
	setx	0xD7A9ADAA8065A970,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB163A8BE7ECD56FB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f30,	%f6
	set	0x68, %l3
	sta	%f12,	[%l7 + %l3] 0x89
	nop
	set	0x18, %g5
	std	%g4,	[%l7 + %g5]
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x89,	 2
	nop
	set	0x40, %g7
	swap	[%l7 + %g7],	%o1
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%g3
	bg,a,pt	%xcc,	loop_190
	or	%g1,	%l4,	%l3
	nop
	set	0x18, %g6
	std	%f24,	[%l7 + %g6]
	set	0x28, %g1
	lda	[%l7 + %g1] 0x80,	%f27
loop_190:
	nop
	set	0x3A, %o0
	ldsh	[%l7 + %o0],	%l5
	set	0x0C, %o1
	stha	%g2,	[%l7 + %o1] 0x81
	set	0x64, %g2
	swapa	[%l7 + %g2] 0x80,	%o7
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f4
	add	%o4,	%o2,	%o0
	nop
	set	0x30, %o5
	stx	%i0,	[%l7 + %o5]
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x89,	%o2
	set	0x7C, %i6
	swapa	[%l7 + %i6] 0x80,	%i7
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x81,	%l0
	nop
	set	0x68, %l4
	prefetch	[%l7 + %l4],	 4
	set	0x20, %g4
	ldda	[%l7 + %g4] 0xe2,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%o5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xB8F, 	%tick_cmpr
	nop
	nop
	setx	0x6CAE2AF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xF415CC64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f15,	%f9
	st	%f30,	[%l7 + 0x08]
	nop
	set	0x10, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x89,	%i4
	set	0x64, %o2
	ldstuba	[%l7 + %o2] 0x81,	%l2
	nop
	set	0x0F, %i7
	stb	%l1,	[%l7 + %i7]
	and	%l6,	%i3,	%g4
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f16
	set	0x50, %o4
	stda	%i4,	[%l7 + %o4] 0x80
	set	0x7A, %i2
	stha	%g5,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x5C, %l6
	stba	%i2,	[%l7 + %l6] 0x80
	ld	[%l7 + 0x48],	%f6
	set	0x0C, %i5
	sta	%f0,	[%l7 + %i5] 0x80
	set	0x0C, %l0
	stha	%o1,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x28, %o3
	stda	%g6,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x6C, %i1
	sta	%f28,	[%l7 + %i1] 0x80
	nop
	set	0x40, %l3
	prefetch	[%l7 + %l3],	 0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%l4
	nop
	set	0x17, %g5
	stb	%l3,	[%l7 + %g5]
	bn,a,pt	%icc,	loop_191
	nop
	set	0x3A, %l1
	ldsh	[%l7 + %l1],	%g3
	set	0x2C, %i4
	swapa	[%l7 + %i4] 0x81,	%g2
loop_191:
	nop
	set	0x44, %g7
	ldsw	[%l7 + %g7],	%l5
	nop
	set	0x69, %i0
	ldsb	[%l7 + %i0],	%o4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x81
	or	%o7,	%o2,	%o0
	nop
	set	0x14, %g6
	prefetch	[%l7 + %g6],	 4
	set	0x5C, %o1
	stwa	%i0,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x10, %g2
	stw	%i7,	[%l7 + %g2]
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xea,	%l0
	nop
	set	0x60, %o5
	lduh	[%l7 + %o5],	%o3
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 4
	nop
	set	0x72, %i6
	sth	%o6,	[%l7 + %i6]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x89
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%o5
	nop
	set	0x0D, %g4
	ldstub	[%l7 + %g4],	%i1
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x81,	%g6
	add	%i5,	%l2,	%l1
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%i6
	nop
	set	0x5B, %l4
	ldub	[%l7 + %l4],	%i3
	nop
	set	0x48, %i7
	std	%i6,	[%l7 + %i7]
	set	0x08, %l2
	stxa	%g4,	[%l7 + %l2] 0x80
	nop
	set	0x40, %o4
	ldd	[%l7 + %o4],	%f4
	or	%i4,	%i2,	%g5
	ld	[%l7 + 0x50],	%f14
	bgu,a,pn	%xcc,	loop_192
	ld	[%l7 + 0x1C],	%f0
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%l4
loop_192:
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%g0
	nop
	set	0x20, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x08, %i5
	std	%f14,	[%l7 + %i5]
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x81,	 2
	st	%f2,	[%l7 + 0x60]
	ld	[%l7 + 0x28],	%f1
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%g2
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%g2
	nop
	set	0x54, %g5
	stb	%l5,	[%l7 + %g5]
	set	0x24, %l3
	sta	%f23,	[%l7 + %l3] 0x89
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%o6
	nop
	set	0x70, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x72, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o4
	set	0x48, %i4
	lda	[%l7 + %i4] 0x81,	%f13
	nop
	set	0x56, %g1
	sth	%o0,	[%l7 + %g1]
	fpsub16	%f28,	%f10,	%f22
	nop
	set	0x36, %o1
	ldsh	[%l7 + %o1],	%o2
	and	%i7,	%l0,	%o3
	set	0x40, %g2
	stda	%o6,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x3A, %i3
	stha	%o5,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f0
	nop
	set	0x45, %o0
	ldstub	[%l7 + %o0],	%i1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%i5
	nop
	set	0x70, %o5
	prefetch	[%l7 + %o5],	 2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%i0
	set	0x68, %l5
	stxa	%i6,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x18, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x18, %g4
	stx	%i3,	[%l7 + %g4]
	nop
	set	0x0B, %o7
	ldsb	[%l7 + %o7],	%l1
	add	%g4,	%l6,	%i2
	add	%i4,	%g5,	%o1
	fpadd32s	%f11,	%f8,	%f7
	nop
	set	0x38, %g3
	swap	[%l7 + %g3],	%g7
	nop
	set	0x20, %o6
	stx	%l4,	[%l7 + %o6]
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%l2
	nop
	set	0x30, %i7
	stx	%fsr,	[%l7 + %i7]
	and	%g2,	%g1,	%g3
	nop
	set	0x08, %l2
	ldx	[%l7 + %l2],	%l5
	or	%o7,	%o4,	%o0
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x89,	 4
	nop
	set	0x40, %l6
	stx	%i7,	[%l7 + %l6]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%o6
	nop
	set	0x58, %i2
	ldd	[%l7 + %i2],	%o4
	wr	%i1,	%o3,	%set_softint
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%i4
	nop
	set	0x50, %o3
	lduw	[%l7 + %o3],	%g6
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x89,	 2
	set	0x6C, %l0
	stha	%i6,	[%l7 + %l0] 0xeb
	membar	#Sync
	set	0x1E, %i5
	stha	%i3,	[%l7 + %i5] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%g4
	nop
	set	0x3C, %g5
	lduw	[%l7 + %g5],	%l2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%f0
	set	0x7F, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l6
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%i2
	nop
	set	0x28, %i0
	ldx	[%l7 + %i0],	%g5
	set	0x18, %g1
	stha	%o1,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x30, %o1
	stx	%i4,	[%l7 + %o1]
	set	0x13, %g2
	stba	%l4,	[%l7 + %g2] 0x89
	set	0x30, %i4
	stda	%l2,	[%l7 + %i4] 0x88
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%g7
	nop
	set	0x10, %i3
	ldsw	[%l7 + %i3],	%g3
	set	0x27, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l5
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%o6
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f14
	set	0x22, %g6
	stba	%g1,	[%l7 + %g6] 0x81
	nop
	set	0x10, %i6
	ldx	[%l7 + %i6],	%o4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd0,	%f0
	wr	%o2,	%o0,	%sys_tick
	set	0x48, %g3
	stda	%l0,	[%l7 + %g3] 0x88
	nop
	set	0x74, %g4
	ldstub	[%l7 + %g4],	%o6
	nop
	set	0x24, %l4
	stb	%o5,	[%l7 + %l4]
	set	0x28, %i7
	ldxa	[%l7 + %i7] 0x88,	%i7
	set	0x10, %o6
	stxa	%i1,	[%l7 + %o6] 0x88
	set	0x6C, %o4
	stwa	%i5,	[%l7 + %o4] 0x80
	bn,a,pt	%xcc,	loop_193
	nop
	set	0x4A, %l2
	lduh	[%l7 + %l2],	%o3
	set	0x28, %i2
	stxa	%i0,	[%l7 + %i2] 0xea
	membar	#Sync
loop_193:
	nop
	set	0x54, %o2
	lda	[%l7 + %o2] 0x80,	%f18
	fpsub32	%f20,	%f26,	%f8
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%i6
	set	0x54, %o3
	stha	%l1,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x3A, %l6
	ldsb	[%l7 + %l6],	%i3
	wr	%l2,	%g4,	%y
	set	0x30, %l0
	stwa	%l6,	[%l7 + %l0] 0x89
	nop
	set	0x68, %i5
	std	%f16,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x74]
	bne,a,pn	%icc,	loop_194
	nop
	set	0x68, %i1
	stw	%g5,	[%l7 + %i1]
	nop
	set	0x68, %g5
	std	%f4,	[%l7 + %g5]
	nop
	set	0x52, %l3
	sth	%o1,	[%l7 + %l3]
loop_194:
	nop
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xc0
	nop
	set	0x5E, %i0
	ldsh	[%l7 + %i0],	%i4
	nop
	set	0x14, %l1
	ldstub	[%l7 + %l1],	%i2
	nop
	set	0x30, %o1
	std	%f18,	[%l7 + %o1]
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x81,	 4
	set	0x68, %i4
	stwa	%l3,	[%l7 + %i4] 0x89
	and	%g2,	%g7,	%g3
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 1
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 2
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%g0
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x81
	set	0x64, %g6
	lda	[%l7 + %g6] 0x81,	%f4
	set	0x2E, %i6
	stba	%l5,	[%l7 + %i6] 0x80
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%o2
	set	0x18, %g3
	sta	%f18,	[%l7 + %g3] 0x88
	nop
	set	0x32, %o7
	sth	%o0,	[%l7 + %o7]
	nop
	set	0x28, %g4
	lduh	[%l7 + %g4],	%o4
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x81,	%l0
	and	%o5,	%o6,	%i7
	or	%i1,	%o3,	%i0
	nop
	set	0x70, %i7
	std	%f30,	[%l7 + %i7]
	set	0x54, %o4
	lda	[%l7 + %o4] 0x81,	%f4
	bn,a,pn	%xcc,	loop_195
	nop
	set	0x28, %l2
	prefetch	[%l7 + %l2],	 3
	or	%i5,	%g6,	%i6
	set	0x78, %i2
	stxa	%l1,	[%l7 + %i2] 0x80
loop_195:
	nop
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x88
	ble,a,pn	%icc,	loop_196
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%i2
	add	%g4,	%l6,	%l2
	nop
	set	0x3D, %o2
	ldstub	[%l7 + %o2],	%g5
loop_196:
	nop
	set	0x54, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o1
	ld	[%l7 + 0x6C],	%f16
	set	0x08, %i5
	sta	%f17,	[%l7 + %i5] 0x89
	nop
	set	0x5D, %i1
	ldstub	[%l7 + %i1],	%i4
	nop
	set	0x40, %g5
	stx	%i2,	[%l7 + %g5]
	nop
	set	0x08, %l3
	stx	%fsr,	[%l7 + %l3]
	st	%f24,	[%l7 + 0x78]
	set	0x18, %l0
	stha	%l3,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x79, %i0
	ldstub	[%l7 + %i0],	%g2
	nop
	set	0x0C, %l1
	ldsh	[%l7 + %l1],	%g7
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f28
	set	0x0F, %o1
	stba	%g3,	[%l7 + %o1] 0x88
	set	0x44, %i4
	sta	%f10,	[%l7 + %i4] 0x81
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	or	%g1,	%l5,	%o2
	and	%o0,	%o7,	%o4
	set	0x78, %i3
	lda	[%l7 + %i3] 0x88,	%f27
	nop
	set	0x40, %o5
	stx	%l0,	[%l7 + %o5]
	nop
	set	0x28, %g1
	stb	%o6,	[%l7 + %g1]
	or	%o5,	%i7,	%i1
	or	%o3,	%i5,	%g6
	nop
	set	0x30, %o0
	sth	%i6,	[%l7 + %o0]
	set	0x44, %i6
	lda	[%l7 + %i6] 0x80,	%f27
	nop
	set	0x50, %l5
	ldsh	[%l7 + %l5],	%i0
	nop
	set	0x46, %g3
	ldsb	[%l7 + %g3],	%l1
	and	%i3,	%g4,	%l6
	or	%l2,	%o1,	%i4
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf8
	membar	#Sync
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x81,	%g4
	nop
	set	0x24, %l4
	lduh	[%l7 + %l4],	%i2
	set	0x08, %i7
	lda	[%l7 + %i7] 0x80,	%f31
	nop
	nop
	setx	0x5A9985D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x5D28E0F6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f3,	%f4
	nop
	set	0x69, %o4
	ldstub	[%l7 + %o4],	%g2
	set	0x30, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g7
	nop
	set	0x78, %l2
	ldx	[%l7 + %l2],	%g3
	set	0x26, %i2
	stba	%l4,	[%l7 + %i2] 0x89
	and	%g1,	%l5,	%o2
	set	0x10, %o6
	stda	%l2,	[%l7 + %o6] 0xea
	membar	#Sync
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%o7
	nop
	set	0x7A, %o2
	ldub	[%l7 + %o2],	%l0
	set	0x08, %l6
	stxa	%o6,	[%l7 + %l6] 0x81
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%o5
	set	0x30, %i1
	stxa	%o4,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x20, %o3
	lduw	[%l7 + %o3],	%i7
	nop
	set	0x76, %l3
	ldub	[%l7 + %l3],	%o3
	set	0x7E, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i5
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	set	0x38, %l0
	lda	[%l7 + %l0] 0x89,	%f12
	add	%g6,	%i6,	%i0
	nop
	set	0x62, %g7
	ldub	[%l7 + %g7],	%i1
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x89,	%i2
	or	%l1,	%g4,	%l6
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%o1
	nop
	set	0x3C, %i4
	lduw	[%l7 + %i4],	%l2
	nop
	set	0x30, %i3
	stx	%g5,	[%l7 + %i3]
	nop
	set	0x58, %o5
	std	%f0,	[%l7 + %o5]
	nop
	set	0x34, %g1
	sth	%i2,	[%l7 + %g1]
	set	0x20, %o0
	sta	%f17,	[%l7 + %o0] 0x81
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x72, %i6
	ldub	[%l7 + %i6],	%g2
	nop
	set	0x74, %g2
	swap	[%l7 + %g2],	%l4
	bge,pn	%xcc,	loop_197
	ld	[%l7 + 0x4C],	%f11
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%f8
	set	0x10, %o7
	ldda	[%l7 + %o7] 0x88,	%g0
loop_197:
	nop
	set	0x10, %l5
	ldda	[%l7 + %l5] 0xea,	%l4
	nop
	set	0x20, %g4
	stb	%g3,	[%l7 + %g4]
	nop
	set	0x6C, %i7
	lduh	[%l7 + %i7],	%l3
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f8
	set	0x60, %g6
	stda	%o0,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x65, %l2
	stb	%o7,	[%l7 + %l2]
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f0
	set	0x1D, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o2
	set	0x3E, %l4
	stha	%o6,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x64, %l6
	lduh	[%l7 + %l6],	%l0
	ld	[%l7 + 0x44],	%f6
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x80,	%o5
	nop
	set	0x28, %o2
	ldx	[%l7 + %o2],	%i7
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x81,	%o4
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x81,	 4
	set	0x70, %i1
	stxa	%o3,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xd8,	%f0
	nop
	set	0x4E, %i0
	lduh	[%l7 + %i0],	%g6
	nop
	set	0x08, %l0
	ldsw	[%l7 + %l0],	%i0
	set	0x4C, %g7
	swapa	[%l7 + %g7] 0x89,	%i1
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x81,	%i2
	nop
	set	0x5C, %l1
	stw	%l1,	[%l7 + %l1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%g4
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x81,	%i6
	or	%o1,	%l2,	%g5
	nop
	set	0x40, %o5
	stx	%i2,	[%l7 + %o5]
	nop
	set	0x26, %i3
	lduh	[%l7 + %i3],	%i4
	nop
	set	0x5A, %o0
	sth	%g7,	[%l7 + %o0]
	add	%g2,	%l4,	%g1
	nop
	set	0x58, %g1
	stx	%g3,	[%l7 + %g1]
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f10
	set	0x68, %g2
	ldxa	[%l7 + %g2] 0x88,	%l5
	nop
	set	0x6A, %o7
	stb	%l3,	[%l7 + %o7]
	nop
	set	0x26, %g3
	lduh	[%l7 + %g3],	%o7
	nop
	set	0x0E, %l5
	ldstub	[%l7 + %l5],	%o2
	and	%o6,	%o0,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o4
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x78, %g4
	std	%i4,	[%l7 + %g4]
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f14
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%o3
	nop
	set	0x5C, %l2
	prefetch	[%l7 + %l2],	 4
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%i7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%i1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%l1
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xcc
	set	0x14, %l4
	sta	%f0,	[%l7 + %l4] 0x88
	nop
	set	0x18, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x7C, %i5
	swap	[%l7 + %i5],	%i6
	nop
	set	0x3C, %l6
	sth	%g4,	[%l7 + %l6]
	fpsub32	%f20,	%f20,	%f28
	set	0x18, %o2
	sta	%f6,	[%l7 + %o2] 0x80
	and	%g6,	%l6,	%o1
	or	%g5,	%i2,	%i4
	fpadd16s	%f20,	%f26,	%f13
	and	%l2,	%g7,	%l4
	st	%fsr,	[%l7 + 0x28]
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x81,	 3
	nop
	set	0x60, %o3
	stw	%g1,	[%l7 + %o3]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xe2,	%l4
	nop
	set	0x10, %i0
	ldub	[%l7 + %i0],	%l3
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x81,	 1
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x60, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x3C, %o1
	swapa	[%l7 + %o1] 0x88,	%o7
	nop
	set	0x44, %l1
	ldsb	[%l7 + %l1],	%o2
	add	%o0,	%o5,	%l0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%o6
	add	%o3,	%i5,	%i7
	fpsub32	%f6,	%f10,	%f10
	bgu,a,pn	%icc,	loop_198
	nop
	set	0x64, %i4
	stw	%i1,	[%l7 + %i4]
	fpsub16s	%f15,	%f28,	%f14
	st	%f24,	[%l7 + 0x38]
loop_198:
	nop
	set	0x38, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	add	%l1,	%g4,	%g6
	nop
	set	0x7F, %g5
	ldsb	[%l7 + %g5],	%i6
	nop
	set	0x5A, %o0
	ldsb	[%l7 + %o0],	%o1
	nop
	set	0x70, %g1
	std	%g4,	[%l7 + %g1]
	nop
	set	0x08, %i3
	std	%f20,	[%l7 + %i3]
	set	0x48, %i6
	stwa	%l6,	[%l7 + %i6] 0x80
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%l2
	nop
	set	0x40, %g2
	lduw	[%l7 + %g2],	%i2
	nop
	set	0x0C, %o7
	ldsw	[%l7 + %o7],	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g7
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%l4
	ld	[%l7 + 0x48],	%f31
	nop
	set	0x78, %g3
	ldub	[%l7 + %g3],	%l3
	set	0x48, %o4
	stwa	%g3,	[%l7 + %o4] 0x89
	set	0x14, %g4
	sta	%f26,	[%l7 + %g4] 0x81
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o7,	%o2
	st	%fsr,	[%l7 + 0x68]
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xca
	nop
	set	0x60, %l2
	std	%o0,	[%l7 + %l2]
	nop
	set	0x78, %i2
	std	%o4,	[%l7 + %i2]
	nop
	set	0x78, %o6
	std	%f10,	[%l7 + %o6]
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%l0
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%o4
	fpsub16	%f30,	%f14,	%f10
	nop
	set	0x6C, %i7
	lduw	[%l7 + %i7],	%g1
	set	0x38, %o2
	stxa	%o3,	[%l7 + %o2] 0x80
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x89,	%o6
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%i4
	nop
	set	0x52, %l3
	lduh	[%l7 + %l3],	%i7
	set	0x20, %i0
	ldda	[%l7 + %i0] 0xea,	%i0
	nop
	set	0x63, %l0
	ldub	[%l7 + %l0],	%i0
	nop
	set	0x28, %i1
	std	%i2,	[%l7 + %i1]
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x80,	%l1
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f22
	set	0x48, %i4
	sta	%f0,	[%l7 + %i4] 0x80
	set	0x4C, %g7
	lda	[%l7 + %g7] 0x88,	%f16
	set	0x40, %g5
	stxa	%g6,	[%l7 + %g5] 0x81
	set	0x5C, %o5
	stha	%g4,	[%l7 + %o5] 0xe2
	membar	#Sync
	or	%o1,	%i6,	%g5
	nop
	set	0x50, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	nop
	setx	0x05A2DE91CB165D95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2A62A59D4F3AD879,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f28,	%f8
	ld	[%l7 + 0x78],	%f5
	set	0x78, %o0
	lda	[%l7 + %o0] 0x80,	%f29
	nop
	set	0x08, %i6
	stx	%l6,	[%l7 + %i6]
	nop
	set	0x34, %i3
	stb	%i4,	[%l7 + %i3]
	nop
	set	0x2C, %g2
	stw	%i2,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x34]
	set	0x68, %o7
	stda	%l4,	[%l7 + %o7] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%g7
	set	0x44, %g3
	lda	[%l7 + %g3] 0x81,	%f29
	wr	%l5,	%l3,	%y
	set	0x16, %l5
	stba	%l2,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc2
	set	0x6F, %o4
	stba	%o7,	[%l7 + %o4] 0x81
	nop
	set	0x61, %g6
	ldsb	[%l7 + %g6],	%g3
	nop
	set	0x50, %l2
	ldsw	[%l7 + %l2],	%o2
	and	%o5,	%o0,	%o4
	st	%f14,	[%l7 + 0x28]
	nop
	set	0x64, %o6
	stw	%l0,	[%l7 + %o6]
	wr	%o3,	%o6,	%pic
	or	%g1,	%i7,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%i3
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc2
	fpadd16s	%f21,	%f17,	%f23
	set	0x79, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i0
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%l0
	nop
	set	0x76, %i7
	sth	%g6,	[%l7 + %i7]
	nop
	set	0x3F, %o2
	ldstub	[%l7 + %o2],	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x81,	%g5,	%i4
	set	0x28, %l6
	stwa	%l6,	[%l7 + %l6] 0xea
	membar	#Sync
	fpadd16s	%f30,	%f16,	%f17
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%l4
	set	0x70, %o3
	stxa	%g7,	[%l7 + %o3] 0x81
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%g2
	nop
	set	0x28, %l0
	ldx	[%l7 + %l0],	%l5
	set	0x68, %l3
	stxa	%l3,	[%l7 + %l3] 0xeb
	membar	#Sync
	nop
	set	0x74, %o1
	sth	%o7,	[%l7 + %o1]
	and	%l2,	%o2,	%g3
	set	0x48, %i1
	lda	[%l7 + %i1] 0x88,	%f4
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x81
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%o5
	set	0x67, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o4
	set	0x2C, %l1
	sta	%f8,	[%l7 + %l1] 0x81
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x88,	 3
	nop
	set	0x40, %g1
	stx	%o3,	[%l7 + %g1]
	nop
	set	0x32, %o5
	ldsb	[%l7 + %o5],	%g1
	set	0x10, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	set	0x34, %i3
	swapa	[%l7 + %i3] 0x80,	%i1
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f0
	set	0x40, %o7
	stwa	%i5,	[%l7 + %o7] 0x88
	bg	%xcc,	loop_199
	add	%i3,	%i7,	%l1
	nop
	set	0x42, %i6
	ldsh	[%l7 + %i6],	%i0
	set	0x18, %l5
	ldxa	[%l7 + %l5] 0x88,	%g6
loop_199:
	st	%f15,	[%l7 + 0x70]
	nop
	set	0x54, %g4
	stb	%o1,	[%l7 + %g4]
	nop
	set	0x48, %o4
	std	%i6,	[%l7 + %o4]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f0
	nop
	set	0x3E, %l2
	ldsh	[%l7 + %l2],	%g5
	set	0x28, %o6
	stda	%g4,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x55, %g6
	ldstuba	[%l7 + %g6] 0x88,	%i4
	ld	[%l7 + 0x50],	%f23
	set	0x70, %i5
	stxa	%l6,	[%l7 + %i5] 0x88
	nop
	set	0x60, %i2
	sth	%l4,	[%l7 + %i2]
	ba,a,pt	%icc,	loop_200
	nop
	set	0x70, %i7
	stx	%g7,	[%l7 + %i7]
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%f8
	nop
	set	0x18, %o2
	std	%f6,	[%l7 + %o2]
loop_200:
	nop
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x80,	%g2
	set	0x6C, %i0
	stwa	%i2,	[%l7 + %i0] 0xe2
	membar	#Sync
	set	0x60, %l0
	swapa	[%l7 + %l0] 0x88,	%l3
	set	0x08, %l6
	stha	%l5,	[%l7 + %l6] 0x80
	or	%o7,	%l2,	%o2
	nop
	set	0x35, %l3
	ldub	[%l7 + %l3],	%o0
	nop
	set	0x65, %i1
	ldub	[%l7 + %i1],	%o5
	wr	%o4,	%g3,	%set_softint
	wr	%o3,	%g1,	%sys_tick
	nop
	set	0x10, %o1
	ldub	[%l7 + %o1],	%l0
	nop
	set	0x51, %i4
	stb	%o6,	[%l7 + %i4]
	nop
	set	0x30, %l1
	std	%i0,	[%l7 + %l1]
	and	%i5,	%i3,	%i7
	nop
	set	0x2C, %g7
	lduw	[%l7 + %g7],	%l1
	nop
	set	0x2D, %g1
	ldsb	[%l7 + %g1],	%i0
	nop
	set	0x4A, %o5
	ldsh	[%l7 + %o5],	%g6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%g5
	set	0x30, %o0
	sta	%f26,	[%l7 + %o0] 0x89
	set	0x64, %g5
	stha	%i6,	[%l7 + %g5] 0xe3
	membar	#Sync
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%l6
	add	%g7,	%g2,	%l4
	nop
	set	0x58, %o7
	swap	[%l7 + %o7],	%i2
	nop
	set	0x60, %g2
	prefetch	[%l7 + %g2],	 2
	nop
	set	0x3C, %i6
	ldsw	[%l7 + %i6],	%l5
	set	0x40, %g4
	stxa	%l3,	[%l7 + %g4] 0x81
	set	0x60, %l5
	ldda	[%l7 + %l5] 0xea,	%o6
	nop
	set	0x78, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x60, %g3
	lduw	[%l7 + %g3],	%o2
	and	%l2,	%o5,	%o4
	set	0x65, %o6
	ldstuba	[%l7 + %o6] 0x88,	%g3
	nop
	set	0x0B, %l2
	stb	%o0,	[%l7 + %l2]
	st	%f2,	[%l7 + 0x74]
	nop
	set	0x78, %g6
	std	%g0,	[%l7 + %g6]
	st	%f10,	[%l7 + 0x34]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f0
	nop
	set	0x08, %i2
	std	%l0,	[%l7 + %i2]
	nop
	set	0x70, %l4
	ldstub	[%l7 + %l4],	%o3
	set	0x5C, %i7
	lda	[%l7 + %i7] 0x80,	%f30
	set	0x70, %o2
	ldstuba	[%l7 + %o2] 0x89,	%i1
	add	%o6,	%i5,	%i7
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%l1
	nop
	set	0x1C, %i0
	lduw	[%l7 + %i0],	%i3
	set	0x6C, %l0
	swapa	[%l7 + %l0] 0x81,	%g6
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x80,	 1
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x89,	%i0
	st	%f0,	[%l7 + 0x6C]
	set	0x3E, %o1
	stha	%i6,	[%l7 + %o1] 0xea
	membar	#Sync
	add	%g5,	%g4,	%i4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x58A, 	%sys_tick_cmpr
	fpsub32s	%f3,	%f21,	%f13
	set	0x34, %i1
	sta	%f21,	[%l7 + %i1] 0x80
	set	0x7A, %l1
	stha	%l5,	[%l7 + %l1] 0x89
	set	0x5C, %g7
	sta	%f27,	[%l7 + %g7] 0x89
	nop
	set	0x52, %g1
	ldstub	[%l7 + %g1],	%l3
	nop
	set	0x60, %o5
	std	%o6,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f16
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f4
	set	0x70, %g5
	stxa	%o2,	[%l7 + %g5] 0x80
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%l2
	set	0x5C, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g3
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x81,	%o0
	set	0x34, %g4
	swapa	[%l7 + %g4] 0x81,	%o4
	set	0x50, %l5
	stda	%l0,	[%l7 + %l5] 0x89
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x1D, %o4
	stb	%o3,	[%l7 + %o4]
	set	0x24, %g3
	stwa	%i1,	[%l7 + %g3] 0x80
	wr	%o6,	%i5,	%sys_tick
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%g1
	add	%l1,	%i7,	%g6
	nop
	set	0x60, %g6
	stx	%o1,	[%l7 + %g6]
	nop
	set	0x7A, %o6
	ldsb	[%l7 + %o6],	%i3
	and	%i0,	%g5,	%i6
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x88,	%i4
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x6C, %i5
	sta	%f20,	[%l7 + %i5] 0x89
	nop
	set	0x4C, %i7
	stw	%g4,	[%l7 + %i7]
	set	0x2C, %o2
	lda	[%l7 + %o2] 0x88,	%f5
	set	0x4D, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g2
	nop
	set	0x4E, %i0
	ldstub	[%l7 + %i0],	%g7
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x80,	%i2
	nop
	set	0x70, %l3
	stx	%l5,	[%l7 + %l3]
	add	%l3,	%o2,	%l2
	set	0x50, %l6
	ldda	[%l7 + %l6] 0xeb,	%o6
	nop
	set	0x68, %o1
	stb	%l4,	[%l7 + %o1]
	and	%o5,	%g3,	%o4
	or	%o0,	%o3,	%i1
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%l0
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%f12
	nop
	set	0x66, %g1
	ldsh	[%l7 + %g1],	%i5
	and	%o6,	%g1,	%i7
	set	0x50, %g7
	stxa	%l1,	[%l7 + %g7] 0x89
	nop
	set	0x28, %o5
	std	%g6,	[%l7 + %o5]
	set	0x78, %o0
	lda	[%l7 + %o0] 0x81,	%f14
	nop
	set	0x18, %g5
	stx	%o1,	[%l7 + %g5]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%g5
	nop
	set	0x70, %o7
	std	%i0,	[%l7 + %o7]
	set	0x1C, %i4
	swapa	[%l7 + %i4] 0x81,	%i6
	nop
	set	0x40, %g2
	ldstub	[%l7 + %g2],	%l6
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xca
	set	0x5B, %g4
	ldstuba	[%l7 + %g4] 0x88,	%g4
	set	0x7E, %i6
	stha	%g2,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x10, %l5
	ldstuba	[%l7 + %l5] 0x81,	%i4
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f30
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g7
	set	0x28, %g3
	stwa	%l5,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x18, %g6
	std	%f14,	[%l7 + %g6]
	and	%o2,	%l2,	%l3
	fpadd32	%f18,	%f12,	%f16
	nop
	set	0x2B, %o6
	ldstub	[%l7 + %o6],	%l4
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc0
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%o7
	st	%f22,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x20]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xc8
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x80,	%o5
	nop
	set	0x08, %o2
	swap	[%l7 + %o2],	%o4
	add	%o0,	%o3,	%i1
	nop
	set	0x60, %i7
	ldd	[%l7 + %i7],	%f24
	nop
	set	0x3D, %i0
	ldsb	[%l7 + %i0],	%l0
	st	%fsr,	[%l7 + 0x30]
	st	%f5,	[%l7 + 0x3C]
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xda
	nop
	set	0x68, %l0
	ldsw	[%l7 + %l0],	%g3
	or	%i5,	%g1,	%o6
	set	0x58, %l3
	ldxa	[%l7 + %l3] 0x80,	%l1
	wr	%i7,	%o1,	%clear_softint
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xda
	wr	%i3,	%g6,	%sys_tick
	nop
	set	0x30, %l1
	std	%f14,	[%l7 + %l1]
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x81,	%i0
	nop
	set	0x24, %l6
	swap	[%l7 + %l6],	%g5
	nop
	set	0x28, %g7
	ldub	[%l7 + %g7],	%i6
	nop
	set	0x34, %o5
	ldsh	[%l7 + %o5],	%l6
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xda,	%f0
	set	0x24, %g5
	stwa	%g2,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x5E, %o7
	ldsh	[%l7 + %o7],	%g4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1230
!	Type a   	: 29
!	Type cti   	: 28
!	Type x   	: 530
!	Type f   	: 40
!	Type i   	: 143
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
.word 0x0BA87CF4
.word 0xAE580BFD
.word 0x9A0EBA61
.word 0x09D4D350
.word 0x64F56587
.word 0xBA1FA67E
.word 0x06DAB7BF
.word 0xD3FEDED3
.word 0xE93C1844
.word 0x22F34573
.word 0x2A8A8D2F
.word 0x4E47DC81
.word 0x4347D8FE
.word 0x3226C1E3
.word 0xB6D4A35B
.word 0x16D8916F
.word 0x5C475199
.word 0x0EAA1234
.word 0x682DC248
.word 0xFED94A16
.word 0xAC75835D
.word 0xA473592B
.word 0xEC82031D
.word 0x046D8E12
.word 0xE4DECBC8
.word 0x3977FAE3
.word 0x88374803
.word 0x69A729CD
.word 0xA85375D9
.word 0x09F7F3CB
.word 0x9218F0E4
.word 0x2C3847B4
.word 0x366DB9BD
.word 0xFF2EDD74
.word 0x988E86AE
.word 0xD4F63372
.word 0x042AB998
.word 0x60067745
.word 0x36590521
.word 0x1E00728B
.word 0xDACF06F5
.word 0xB5A96C4E
.word 0x05D9E098
.word 0xFAD657F5
.word 0x226A52E0
.word 0x39F6C5AC
.word 0x65F87070
.word 0xA941B3E8
.word 0xEC51163E
.word 0x35DBF162
.word 0xB4A41702
.word 0x444D274C
.word 0x638BF918
.word 0x266289B0
.word 0x7FCB53EF
.word 0xDF67B9E2
.word 0xCA9B749F
.word 0x3A1DB924
.word 0xE01A626F
.word 0x14CA36FE
.word 0xB63F410C
.word 0x62ECEB65
.word 0x8F588AE0
.word 0xAD2B7A6F
!! thread 1 data, 64 words.
.word 0xE9067918
.word 0x7304C466
.word 0x5918D2D1
.word 0x2BF10B78
.word 0x03CE890E
.word 0x64917D9B
.word 0xADD21866
.word 0x90A34B03
.word 0x273BD41B
.word 0x5B9FCD8E
.word 0x80AB42BF
.word 0x10D90F39
.word 0xEB3DF95A
.word 0x3DBC786E
.word 0x357E58C2
.word 0x5AFE2153
.word 0x8EC68C07
.word 0xF4C449FB
.word 0x711ECF0D
.word 0x9F56DADB
.word 0x94555D26
.word 0xE6E749DD
.word 0xB801F5C5
.word 0x0DEF9EDE
.word 0xD324CF18
.word 0xA6DEDC56
.word 0x394C5B60
.word 0x2D0679F4
.word 0x52157C0C
.word 0xE13BA9C1
.word 0x24376B36
.word 0xBE2A897E
.word 0x8B825CD7
.word 0x9884A9F5
.word 0xD5DA31DA
.word 0x51207124
.word 0x51F0ED2A
.word 0x96A4B323
.word 0xDC73A763
.word 0xF5B8034F
.word 0xD013142E
.word 0xCF8D3119
.word 0xB4694347
.word 0x273311E5
.word 0xB3B7204B
.word 0x3D570970
.word 0xAA5A020D
.word 0x59BB350B
.word 0xAEC46DCE
.word 0x719A9AED
.word 0x0507F345
.word 0xEA752195
.word 0x1C5A8C0B
.word 0xE074C459
.word 0x81AC62A6
.word 0x58F32E74
.word 0xCDB25470
.word 0x7030105E
.word 0xEE68B2A4
.word 0x0438018F
.word 0x23CC91E7
.word 0x82A7C1B6
.word 0xDFBAFD10
.word 0x615F80E7
!! thread 2 data, 64 words.
.word 0x8BC1E7F9
.word 0xDBF25582
.word 0xE1A7F064
.word 0x1DAE5E58
.word 0xE48CBC33
.word 0x1AAF11C0
.word 0x49538B0F
.word 0x8C7B8840
.word 0x01F741EB
.word 0x0172DBA6
.word 0xCA9520B5
.word 0x7206F530
.word 0x71CD7BEE
.word 0x6D347573
.word 0xF5685652
.word 0xDB1277D3
.word 0x72C24D36
.word 0x51D296C9
.word 0xB1E5BF45
.word 0x839B36B4
.word 0x0F2E7F7E
.word 0x827B5C92
.word 0x16C5C679
.word 0xFAC3103B
.word 0xF6362CE6
.word 0xF00E2FA5
.word 0x96AF4940
.word 0x73B776C8
.word 0xB37E1D53
.word 0xA9A5745A
.word 0x736D73D9
.word 0x287F6496
.word 0x8CC48865
.word 0x8BB0A7CC
.word 0xCD16316F
.word 0x921DF20C
.word 0xA6002052
.word 0xA6C1AD0C
.word 0x0CADFF81
.word 0x14B745A7
.word 0x34205E52
.word 0xF8523272
.word 0x101FC7A6
.word 0x467B3980
.word 0xE40E8624
.word 0xCBBDA096
.word 0x86DD1E42
.word 0xB710C981
.word 0x245EB948
.word 0xB11ADFF1
.word 0xACE5F31A
.word 0x3B438DAF
.word 0x734E7250
.word 0x57F8793F
.word 0xC45D6408
.word 0xC0BBF7F6
.word 0xFD58CCC8
.word 0x2E33C7C7
.word 0xBDD575AE
.word 0xAEA75B3E
.word 0xD29ABB25
.word 0x8D2BDBF3
.word 0xC34F6AAB
.word 0xD5C2E32D
!! thread 3 data, 64 words.
.word 0x66F49A73
.word 0xA1BB986D
.word 0x54943500
.word 0x03D9633F
.word 0x62640865
.word 0x73B4EE02
.word 0x421DEDF6
.word 0xE7006564
.word 0x78ED4ACC
.word 0x58EEE130
.word 0xB1BABBFE
.word 0x1B8921B4
.word 0xDB4E7DCE
.word 0x4BAB528B
.word 0xFAC065B4
.word 0xEF975C9E
.word 0x291EDF0C
.word 0x9D5D06E5
.word 0x4178CEF6
.word 0xA06DBE2E
.word 0xC00C5E32
.word 0x2323F0E5
.word 0x695F8400
.word 0xF9F28DF8
.word 0x0185CBAB
.word 0x8956A070
.word 0x04E08219
.word 0x514D397E
.word 0x25FFF6A7
.word 0xFD8D7910
.word 0x0ECCCDC2
.word 0xA9D05A90
.word 0x79646685
.word 0xD224F4F2
.word 0x577DC8FB
.word 0x67C2A5C2
.word 0x35FF72EF
.word 0x6340F05A
.word 0xF3CE40C4
.word 0x99E120B7
.word 0x7F5BDD5E
.word 0x118E81B8
.word 0xA137EC39
.word 0x87CCFCAC
.word 0x65450022
.word 0x136D1485
.word 0xDE5EAA36
.word 0xA4CF8423
.word 0x0C34A42D
.word 0x97B9CAA5
.word 0x7CE6B90E
.word 0x29C0A201
.word 0x9C74D39F
.word 0xEDFE1877
.word 0x2E44EDE3
.word 0xB2E8E92E
.word 0xF8F0F56E
.word 0x457A441C
.word 0x2BFE9495
.word 0x2D53C787
.word 0x51274FDF
.word 0xFE642196
.word 0xB2B00E0B
.word 0xDEAE2EAE
!! thread 4 data, 64 words.
.word 0xCC1D18B1
.word 0x5E9AE24A
.word 0xD82AE3B8
.word 0x39C5C154
.word 0xFC9D92D4
.word 0xDB1E024A
.word 0xFEB14154
.word 0xB3FD2346
.word 0xC594AE99
.word 0xAAB2C5E3
.word 0x23D36E95
.word 0xBC54E0A7
.word 0x583A3C21
.word 0x517AF15C
.word 0xCEC2D36A
.word 0xF692530C
.word 0x194C3B8D
.word 0x9A829AEB
.word 0xE2E98D2F
.word 0xBB89A502
.word 0x5F312BAF
.word 0x8FFF73BC
.word 0xF5C9EAFB
.word 0xBE349B4C
.word 0x0C9C956C
.word 0x7F128AEE
.word 0x85590164
.word 0x531AFB2D
.word 0x42535C09
.word 0xB56951C7
.word 0x04229E8D
.word 0xCFAA720C
.word 0x8358B250
.word 0x2EDB200D
.word 0xC51468F5
.word 0x8159DA6A
.word 0x41FDCE59
.word 0xD52645EE
.word 0x6FB70020
.word 0xEB460060
.word 0x7C77A1D4
.word 0xBCD72344
.word 0x89942863
.word 0xFC68D8A7
.word 0xBFABBFDF
.word 0x25BF177D
.word 0x702AF5A0
.word 0x52E10E29
.word 0x084633E6
.word 0x24435C70
.word 0xAB36968B
.word 0x0AD04705
.word 0xCF7313F9
.word 0x28A90811
.word 0x069DD36E
.word 0x0A364F0A
.word 0x6465FB84
.word 0x03532772
.word 0x50E50723
.word 0xD80B1090
.word 0x1FA3FFEF
.word 0x2E4DDF4F
.word 0xC495BBF9
.word 0x4E4AE097
!! thread 5 data, 64 words.
.word 0x23D5F5A1
.word 0xAE360DC2
.word 0x0ADD185B
.word 0x7315ED2E
.word 0x333C97EB
.word 0xA46974EB
.word 0xDA03C6B6
.word 0x7132BA2A
.word 0x9C162747
.word 0x0B350115
.word 0x8D9A5F20
.word 0x926183EC
.word 0xA9EDDFD6
.word 0x1FEE5D18
.word 0xBE7EDE48
.word 0xB1456F9F
.word 0x3A0D005C
.word 0xC7B36F59
.word 0x08243382
.word 0x5D68CFBF
.word 0xA6D67470
.word 0x0F2450B8
.word 0x6E242530
.word 0xC3BBF83D
.word 0xE3F93B43
.word 0x8D65356B
.word 0x8143F517
.word 0xD9DD826D
.word 0x554CC41E
.word 0x739E0E50
.word 0xAEC07E1A
.word 0xA4402C2D
.word 0x28134B61
.word 0xEE0C7222
.word 0x6F6FA653
.word 0x2F463A5E
.word 0x113220ED
.word 0xEF55C5D8
.word 0x262393AF
.word 0xCBDD5AC1
.word 0xA9463819
.word 0xC37967DE
.word 0xDF7D33E0
.word 0xC16C2768
.word 0xD6D6B85A
.word 0xD2E8A608
.word 0x36C16A62
.word 0x3B4ABCB4
.word 0x0644FB36
.word 0xC0BAF75B
.word 0xF6362347
.word 0x26F334B1
.word 0x544CAF3D
.word 0xB6E7D59C
.word 0x9C2024FD
.word 0xC5B8960F
.word 0x58EB24FB
.word 0xE8AFCAA7
.word 0x698FBB57
.word 0x3EEAF4AF
.word 0x44B2437D
.word 0x7CA30870
.word 0x9C943344
.word 0xC24D9B60
!! thread 6 data, 64 words.
.word 0x6697A26C
.word 0x8D4F047B
.word 0xB60CFECF
.word 0x1D71663F
.word 0xA3DFE6C1
.word 0x5ECCF400
.word 0x5A41A09B
.word 0xBC379F63
.word 0xAC190C8E
.word 0x62893363
.word 0x55920863
.word 0x34673113
.word 0xC763C8E7
.word 0xFD0E2BFF
.word 0x598FA701
.word 0xE1ECAD75
.word 0x9A2DE248
.word 0x0E71661B
.word 0x14B77DA4
.word 0x02FB3122
.word 0x7FFA3A9B
.word 0x094F63B4
.word 0xB776094D
.word 0xD5EC8726
.word 0x99B478DE
.word 0x780289C7
.word 0xD43CE51C
.word 0xB38110B8
.word 0x1493B37C
.word 0x7036B5EB
.word 0xC63405F2
.word 0x1C37FA1F
.word 0xC93E4955
.word 0xE4F6B7E7
.word 0x8C6DB1EA
.word 0x64E24989
.word 0x2EC41975
.word 0x824C68BE
.word 0xDB5EF222
.word 0xB139B5A7
.word 0xD76E8C12
.word 0xBE3EC64F
.word 0x4858CE5A
.word 0x699E2D54
.word 0xAE5D2982
.word 0xC5B0A875
.word 0x068EBBD7
.word 0x5FF7265A
.word 0xE84ACDCA
.word 0x92144783
.word 0x074954C0
.word 0x8BF88FF5
.word 0xD02194AA
.word 0xB43AE7A4
.word 0x2BD6AF63
.word 0x2E976FD7
.word 0x15B9541C
.word 0xA1EB36FB
.word 0x02E2FCF5
.word 0x642553EF
.word 0x22298684
.word 0xBCAAF884
.word 0x99E6EC21
.word 0xB1B6DC52
!! thread 7 data, 64 words.
.word 0xD578C202
.word 0xF98CC8A1
.word 0xC0C98ABC
.word 0x02497452
.word 0x6661DCBC
.word 0x6903871C
.word 0xA78CF1DD
.word 0x48140AA3
.word 0x6172775A
.word 0xB4204014
.word 0x96BC40B6
.word 0x9BA42E9E
.word 0xC1FF5A0F
.word 0x8F5960D4
.word 0x30E59F94
.word 0x2983C3EA
.word 0x2949A0BD
.word 0xB3114FF8
.word 0xE08500D2
.word 0x8F68A7B3
.word 0x6F089162
.word 0xEDAEEA46
.word 0xF076DA35
.word 0xD520B243
.word 0x5653D7FF
.word 0xA1E34EEC
.word 0x171A5AF3
.word 0xF4EBD005
.word 0x935A2852
.word 0x84A348B9
.word 0xAD0EE0E1
.word 0xC45F3294
.word 0x858F8F4F
.word 0xB19D8B5D
.word 0x40F85004
.word 0xFA2F62FF
.word 0xE68362C3
.word 0x6FF11960
.word 0x09191266
.word 0x595B2C19
.word 0x0D284C84
.word 0xFD2D34BD
.word 0xD37906C8
.word 0xA71DA693
.word 0x6E98ABB3
.word 0xDF391468
.word 0x6CB19683
.word 0xC8623883
.word 0x6DA6F3AC
.word 0x07F6ACC2
.word 0x158715CF
.word 0x1ED2084D
.word 0xD1E50252
.word 0x2C71AF2B
.word 0x07CAFB78
.word 0x3DCD7897
.word 0xF0D10AFD
.word 0x3E949F78
.word 0x64505CFE
.word 0x35BADD85
.word 0x89D1D447
.word 0xE0F1B4B7
.word 0x462267C3
.word 0xBA9430EE
.end
