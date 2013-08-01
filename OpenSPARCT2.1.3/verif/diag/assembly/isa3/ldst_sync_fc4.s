/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc4.s
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
	set	0xC,	%g3
	set	0xA,	%g4
	set	0xA,	%g5
	set	0xF,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x2,	%i1
	set	-0x2,	%i2
	set	-0xC,	%i3
	set	-0x8,	%i4
	set	-0xA,	%i5
	set	-0x8,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x1CBE6268,	%l0
	set	0x097F539D,	%l1
	set	0x618843A8,	%l2
	set	0x67544A59,	%l3
	set	0x413E4C0A,	%l4
	set	0x28E58AEE,	%l5
	set	0x79C07A71,	%l6
	!# Output registers
	set	0x18B1,	%o0
	set	-0x1EA6,	%o1
	set	-0x0F66,	%o2
	set	-0x150B,	%o3
	set	-0x0F24,	%o4
	set	0x1FE6,	%o5
	set	0x0CE8,	%o6
	set	0x139E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	set	0x40, %o0
	sta	%f30,	[%l7 + %o0] 0x81
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f4
	nop
	set	0x20, %i2
	swap	[%l7 + %i2],	%o7
	nop
	set	0x60, %l0
	stx	%o5,	[%l7 + %l0]
	st	%f15,	[%l7 + 0x0C]
	set	0x08, %g3
	swapa	[%l7 + %g3] 0x81,	%i7
	set	0x0F, %l1
	stba	%o0,	[%l7 + %l1] 0x81
	set	0x3C, %l6
	stba	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x5C, %o3
	lda	[%l7 + %o3] 0x89,	%f15
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xda
	set	0x54, %l2
	stwa	%i0,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x70, %g2
	ldstuba	[%l7 + %g2] 0x80,	%i3
	set	0x48, %i6
	lda	[%l7 + %i6] 0x81,	%f31
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	ld	[%l7 + 0x30],	%f26
	nop
	set	0x31, %l3
	stb	%g4,	[%l7 + %l3]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf9
	membar	#Sync
	set	0x25, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l3
	nop
	set	0x2F, %o2
	ldstub	[%l7 + %o2],	%i4
	nop
	set	0x40, %o1
	ldsw	[%l7 + %o1],	%o1
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0
	set	0x7C, %o7
	sta	%f20,	[%l7 + %o7] 0x88
	nop
	set	0x54, %i1
	stw	%o4,	[%l7 + %i1]
	nop
	set	0x30, %g1
	stx	%i2,	[%l7 + %g1]
	nop
	set	0x34, %g5
	ldstub	[%l7 + %g5],	%o2
	set	0x28, %l4
	stxa	%i1,	[%l7 + %l4] 0x80
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%g6
	and	%o6,	%o3,	%g2
	nop
	set	0x47, %l5
	ldsb	[%l7 + %l5],	%g5
	nop
	set	0x33, %o6
	ldub	[%l7 + %o6],	%g7
	nop
	set	0x38, %i4
	std	%f24,	[%l7 + %i4]
	ble,pn	%xcc,	loop_1
	nop
	set	0x52, %o4
	lduh	[%l7 + %o4],	%g1
	nop
	set	0x6A, %o0
	lduh	[%l7 + %o0],	%l6
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 0
loop_1:
	nop
	set	0x50, %i2
	ldda	[%l7 + %i2] 0xe3,	%i4
	and	%l5,	%l1,	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%l2
	st	%fsr,	[%l7 + 0x38]
	and	%o7,	%o5,	%o0
	add	%l4,	%i0,	%i7
	nop
	set	0x14, %g6
	ldub	[%l7 + %g6],	%g4
	nop
	nop
	setx	0xBBA43645,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x5797F475,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f26,	%f9
	nop
	set	0x64, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x0C, %l0
	stw	%i3,	[%l7 + %l0]
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%l2
	and	%i4,	%l0,	%o1
	nop
	set	0x58, %l6
	stw	%i2,	[%l7 + %l6]
	add	%o2,	%i1,	%o4
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x89,	%o6
	nop
	set	0x68, %g7
	ldsb	[%l7 + %g7],	%g6
	nop
	set	0x28, %l2
	stb	%g2,	[%l7 + %l2]
	nop
	set	0x78, %g2
	stw	%g5,	[%l7 + %g2]
	nop
	set	0x28, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x7A, %i6
	ldstub	[%l7 + %i6],	%o3
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%g1
	fpsub16	%f8,	%f14,	%f26
	or	%l6,	%i5,	%l5
	nop
	set	0x20, %i5
	std	%l0,	[%l7 + %i5]
	set	0x34, %i3
	lda	[%l7 + %i3] 0x89,	%f17
	ld	[%l7 + 0x2C],	%f19
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 0
	st	%fsr,	[%l7 + 0x48]
	set	0x48, %o2
	lda	[%l7 + %o2] 0x88,	%f7
	nop
	set	0x30, %i0
	stx	%i6,	[%l7 + %i0]
	nop
	set	0x10, %i1
	swap	[%l7 + %i1],	%g7
	nop
	set	0x0C, %g1
	swap	[%l7 + %g1],	%l2
	or	%g3,	%o5,	%o0
	nop
	set	0x50, %g5
	std	%o6,	[%l7 + %g5]
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%i0
	set	0x3C, %o7
	stha	%i7,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x80,	%g4
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x89,	%i3
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%i4
	set	0x12, %o6
	stha	%l4,	[%l7 + %o6] 0x88
	nop
	set	0x1E, %o4
	ldub	[%l7 + %o4],	%l0
	ld	[%l7 + 0x60],	%f10
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%o1
	nop
	set	0x30, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x1C, %o0
	lduw	[%l7 + %o0],	%o2
	ld	[%l7 + 0x5C],	%f31
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x89,	%o4,	%i1
	nop
	set	0x0C, %o5
	ldsh	[%l7 + %o5],	%g6
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x81,	 1
	wr	%o6,	%o3,	%ccr
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%l6
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xeb,	%i4
	nop
	set	0x14, %g6
	lduw	[%l7 + %g6],	%g1
	nop
	set	0x7C, %l0
	ldub	[%l7 + %l0],	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%g7
	set	0x5F, %l6
	stba	%l2,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x08, %l1
	stha	%i6,	[%l7 + %l1] 0xea
	membar	#Sync
	st	%f3,	[%l7 + 0x7C]
	set	0x54, %g7
	swapa	[%l7 + %g7] 0x81,	%g3
	nop
	set	0x26, %o3
	ldsh	[%l7 + %o3],	%o0
	set	0x50, %g2
	swapa	[%l7 + %g2] 0x80,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%i7
	add	%g4,	%i3,	%i0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%l4
	set	0x50, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	set	0x38, %i7
	stda	%i2,	[%l7 + %i7] 0x89
	nop
	set	0x7C, %i6
	lduh	[%l7 + %i6],	%o1
	or	%o2,	%i4,	%o4
	fpadd16s	%f8,	%f20,	%f17
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f16
	set	0x3C, %i3
	sta	%f7,	[%l7 + %i3] 0x89
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%g6
	nop
	set	0x50, %o1
	std	%f16,	[%l7 + %o1]
	nop
	set	0x3B, %i0
	stb	%i1,	[%l7 + %i0]
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 3
	wr	%o6,	%o3,	%softint
	nop
	set	0x78, %g1
	stx	%g5,	[%l7 + %g1]
	set	0x38, %o2
	stda	%g2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd8,	%f0
	st	%f15,	[%l7 + 0x4C]
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x81,	%i6
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f16
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f0
	nop
	set	0x08, %l5
	sth	%g1,	[%l7 + %l5]
	nop
	set	0x40, %o4
	stw	%i5,	[%l7 + %o4]
	add	%l1,	%g7,	%l2
	nop
	set	0x16, %o6
	ldsb	[%l7 + %o6],	%l5
	nop
	set	0x08, %i4
	std	%f18,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x44]
	ba,a,pt	%icc,	loop_2
	bg,pn	%icc,	loop_3
	nop
	set	0x6D, %o5
	ldsb	[%l7 + %o5],	%i6
	nop
	set	0x20, %o0
	stw	%g3,	[%l7 + %o0]
loop_2:
	st	%f4,	[%l7 + 0x40]
loop_3:
	nop
	set	0x08, %g3
	std	%f28,	[%l7 + %g3]
	set	0x48, %g6
	sta	%f22,	[%l7 + %g6] 0x89
	set	0x38, %i2
	prefetcha	[%l7 + %i2] 0x81,	 4
	nop
	set	0x65, %l0
	ldstub	[%l7 + %l0],	%o7
	nop
	set	0x38, %l1
	prefetch	[%l7 + %l1],	 2
	nop
	set	0x4C, %g7
	ldsw	[%l7 + %g7],	%o5
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x81,	%i6
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%i2
	fpadd16	%f10,	%f14,	%f30
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x89,	%g4
	nop
	set	0x36, %i7
	stb	%l3,	[%l7 + %i7]
	nop
	set	0x72, %l2
	ldub	[%l7 + %l2],	%l4
	set	0x40, %i6
	stxa	%l0,	[%l7 + %i6] 0x81
	add	%i2,	%i0,	%o1
	fpadd32s	%f13,	%f0,	%f9
	nop
	set	0x78, %i5
	std	%f30,	[%l7 + %i5]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%i4
	nop
	set	0x20, %o1
	std	%f20,	[%l7 + %o1]
	nop
	set	0x38, %l3
	stx	%o2,	[%l7 + %l3]
	nop
	set	0x56, %i1
	lduh	[%l7 + %i1],	%g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%o6
	nop
	set	0x3B, %i0
	ldub	[%l7 + %i0],	%o3
	set	0x08, %g1
	stba	%o4,	[%l7 + %g1] 0x80
	nop
	set	0x24, %l4
	ldsh	[%l7 + %l4],	%g2
	set	0x58, %o2
	lda	[%l7 + %o2] 0x81,	%f18
	nop
	set	0x28, %g5
	ldx	[%l7 + %g5],	%g5
	nop
	set	0x50, %o7
	prefetch	[%l7 + %o7],	 1
	and	%l6,	%g1,	%l1
	st	%f19,	[%l7 + 0x50]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x89,	%g7,	%l2
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x5E, %g4
	sth	%i5,	[%l7 + %g4]
	set	0x48, %o4
	lda	[%l7 + %o4] 0x89,	%f8
	nop
	set	0x38, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x18, %o6
	stda	%g2,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x10, %o5
	lduw	[%l7 + %o5],	%o0
	set	0x7D, %o0
	stba	%i6,	[%l7 + %o0] 0x88
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x80,	%o7
	nop
	set	0x58, %g6
	stw	%o5,	[%l7 + %g6]
	nop
	set	0x13, %g3
	stb	%i7,	[%l7 + %g3]
	nop
	set	0x28, %i2
	stx	%i3,	[%l7 + %i2]
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x88,	%g4
	set	0x18, %l0
	stha	%l4,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x76, %o3
	ldsb	[%l7 + %o3],	%l3
	set	0x3E, %g2
	stha	%i2,	[%l7 + %g2] 0x80
	set	0x48, %l6
	sta	%f22,	[%l7 + %l6] 0x88
	set	0x2C, %g7
	lda	[%l7 + %g7] 0x89,	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%o1
	fpsub32	%f4,	%f6,	%f28
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f14
	nop
	set	0x20, %i6
	stx	%l0,	[%l7 + %i6]
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x80,	%i4
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x80,	%g6
	st	%f12,	[%l7 + 0x1C]
	ld	[%l7 + 0x10],	%f26
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%o2
	st	%f17,	[%l7 + 0x1C]
	set	0x3C, %i5
	stwa	%o3,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x18, %l3
	ldsb	[%l7 + %l3],	%o4
	st	%fsr,	[%l7 + 0x44]
	set	0x16, %o1
	stha	%g2,	[%l7 + %o1] 0x81
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f16
	nop
	set	0x1C, %i1
	swap	[%l7 + %i1],	%g5
	set	0x10, %l4
	stxa	%l6,	[%l7 + %l4] 0xe2
	membar	#Sync
	and	%g1,	%o6,	%l1
	nop
	set	0x6C, %o2
	ldsw	[%l7 + %o2],	%g7
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%l2
	set	0x7E, %g5
	ldstuba	[%l7 + %g5] 0x81,	%i5
	nop
	set	0x20, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%g2
	wr	%o0,	%i6,	%clear_softint
	nop
	set	0x28, %o4
	ldsh	[%l7 + %o4],	%o7
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%l5
	nop
	set	0x1B, %o6
	ldstub	[%l7 + %o6],	%i7
	bl,a	%xcc,	loop_4
	ld	[%l7 + 0x3C],	%f1
	add	%o5,	%g4,	%l4
	set	0x23, %i4
	stba	%l3,	[%l7 + %i4] 0x80
loop_4:
	nop
	set	0x50, %g6
	stxa	%i2,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x64, %g3
	sta	%f14,	[%l7 + %g3] 0x80
	set	0x36, %i2
	ldstuba	[%l7 + %i2] 0x88,	%i3
	set	0x38, %o0
	lda	[%l7 + %o0] 0x80,	%f6
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%i0
	add	%l0,	%o1,	%g6
	wr	%i4,	%i1,	%set_softint
	nop
	set	0x11, %l1
	ldsb	[%l7 + %l1],	%o2
	fpadd32s	%f11,	%f28,	%f17
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g2
	nop
	set	0x09, %o3
	ldsb	[%l7 + %o3],	%o3
	or	%l6,	%g1,	%o6
	set	0x08, %g2
	stha	%l1,	[%l7 + %g2] 0x89
	nop
	set	0x4D, %g7
	ldub	[%l7 + %g7],	%g5
	nop
	set	0x60, %l2
	stx	%l2,	[%l7 + %l2]
	nop
	set	0x30, %i6
	stx	%g7,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x18]
	set	0x44, %i7
	stha	%g3,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%o0
	nop
	set	0x58, %l6
	std	%i6,	[%l7 + %l6]
	nop
	set	0x2C, %l3
	stw	%o7,	[%l7 + %l3]
	bg,pn	%icc,	loop_5
	or	%i5,	%l5,	%i7
	nop
	set	0x5E, %i5
	ldstub	[%l7 + %i5],	%o5
	set	0x30, %o1
	stxa	%g4,	[%l7 + %o1] 0xe3
	membar	#Sync
loop_5:
	nop
	set	0x30, %i0
	ldub	[%l7 + %i0],	%l4
	or	%i2,	%l3,	%i0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	nop
	set	0x4E, %l4
	lduh	[%l7 + %l4],	%i3
	set	0x60, %g1
	ldda	[%l7 + %g1] 0xeb,	%l0
	nop
	set	0x1C, %g5
	stw	%o1,	[%l7 + %g5]
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x81,	%i4
	set	0x2E, %o7
	ldstuba	[%l7 + %o7] 0x81,	%g6
	nop
	set	0x28, %o4
	lduh	[%l7 + %o4],	%o2
	nop
	set	0x10, %g4
	std	%i0,	[%l7 + %g4]
	nop
	set	0x65, %o5
	ldstub	[%l7 + %o5],	%g2
	nop
	set	0x74, %l5
	stw	%o4,	[%l7 + %l5]
	st	%f6,	[%l7 + 0x60]
	set	0x54, %o6
	stwa	%l6,	[%l7 + %o6] 0x80
	set	0x48, %i4
	swapa	[%l7 + %i4] 0x81,	%o3
	set	0x40, %g6
	stxa	%g1,	[%l7 + %g6] 0x88
	nop
	set	0x7C, %i2
	sth	%l1,	[%l7 + %i2]
	nop
	set	0x61, %o0
	stb	%g5,	[%l7 + %o0]
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x88,	%o6
	nop
	set	0x70, %g3
	ldsb	[%l7 + %g3],	%g7
	nop
	set	0x12, %l1
	ldsh	[%l7 + %l1],	%l2
	set	0x70, %o3
	lda	[%l7 + %o3] 0x89,	%f22
	bleu,pn	%xcc,	loop_6
	ld	[%l7 + 0x34],	%f8
	nop
	set	0x1C, %g2
	lduw	[%l7 + %g2],	%g3
	nop
	set	0x7A, %g7
	lduh	[%l7 + %g7],	%i6
loop_6:
	nop
	set	0x1C, %i6
	swap	[%l7 + %i6],	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%l5
	fpadd16s	%f13,	%f25,	%f26
	nop
	set	0x66, %i7
	ldsh	[%l7 + %i7],	%i5
	nop
	set	0x74, %i3
	stb	%o5,	[%l7 + %i3]
	and	%g4,	%i7,	%i2
	set	0x38, %l2
	swapa	[%l7 + %l2] 0x80,	%l3
	nop
	set	0x5F, %l3
	ldstub	[%l7 + %l3],	%l4
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x81,	%i0
	nop
	set	0x16, %i5
	sth	%i3,	[%l7 + %i5]
	set	0x23, %i0
	ldstuba	[%l7 + %i0] 0x89,	%o1
	nop
	set	0x6C, %o1
	lduw	[%l7 + %o1],	%l0
	set	0x28, %i1
	stxa	%g6,	[%l7 + %i1] 0x88
	nop
	set	0x51, %g1
	ldstub	[%l7 + %g1],	%o2
	set	0x24, %g5
	sta	%f0,	[%l7 + %g5] 0x88
	nop
	set	0x58, %o2
	swap	[%l7 + %o2],	%i1
	set	0x2C, %o7
	stha	%g2,	[%l7 + %o7] 0x80
	nop
	set	0x70, %l4
	stw	%o4,	[%l7 + %l4]
	set	0x62, %o4
	stba	%l6,	[%l7 + %o4] 0x88
	fpsub16s	%f24,	%f23,	%f22
	nop
	set	0x64, %o5
	ldsh	[%l7 + %o5],	%o3
	add	%g1,	%l1,	%g5
	wr	%o6,	%g7,	%softint
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf8,	%f0
	nop
	set	0x30, %g4
	ldub	[%l7 + %g4],	%i4
	nop
	set	0x50, %i4
	std	%g2,	[%l7 + %i4]
	and	%l2,	%o0,	%o7
	nop
	set	0x20, %g6
	std	%f10,	[%l7 + %g6]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%i5
	nop
	set	0x1C, %i2
	lduh	[%l7 + %i2],	%o5
	st	%f19,	[%l7 + 0x40]
	set	0x50, %o6
	lda	[%l7 + %o6] 0x80,	%f2
	set	0x60, %l0
	stda	%g4,	[%l7 + %l0] 0x81
	ld	[%l7 + 0x58],	%f26
	nop
	set	0x12, %g3
	sth	%i6,	[%l7 + %g3]
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 3
	set	0x1C, %o0
	swapa	[%l7 + %o0] 0x88,	%i7
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe2,	%i2
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%l3
	and	%i0,	%i3,	%o1
	fpadd32	%f20,	%f10,	%f8
	set	0x50, %g2
	stda	%l0,	[%l7 + %g2] 0x88
	set	0x7A, %i6
	stha	%g6,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x30, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf8
	membar	#Sync
	st	%f30,	[%l7 + 0x54]
	set	0x78, %l2
	stda	%o2,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%i0
	set	0x28, %i5
	ldxa	[%l7 + %i5] 0x88,	%g2
	nop
	set	0x6C, %i0
	lduh	[%l7 + %i0],	%l4
	nop
	set	0x2C, %o1
	stb	%o4,	[%l7 + %o1]
	set	0x38, %i1
	sta	%f15,	[%l7 + %i1] 0x89
	set	0x18, %g1
	ldxa	[%l7 + %g1] 0x89,	%l6
	set	0x14, %g5
	lda	[%l7 + %g5] 0x80,	%f31
	set	0x14, %o2
	sta	%f19,	[%l7 + %o2] 0x80
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f18
	nop
	set	0x7C, %l4
	stw	%g1,	[%l7 + %l4]
	and	%o3,	%l1,	%o6
	nop
	set	0x5C, %o7
	lduh	[%l7 + %o7],	%g7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	set	0x70, %l5
	stxa	%i4,	[%l7 + %l5] 0x81
	set	0x62, %g4
	ldstuba	[%l7 + %g4] 0x89,	%g3
	nop
	set	0x2A, %i4
	ldsh	[%l7 + %i4],	%g5
	nop
	set	0x68, %g6
	ldx	[%l7 + %g6],	%o0
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%l2
	or	%l5,	%i5,	%o7
	nop
	set	0x6C, %i2
	lduw	[%l7 + %i2],	%g4
	nop
	set	0x5C, %o6
	ldsw	[%l7 + %o6],	%o5
	fpsub32	%f26,	%f18,	%f26
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%f22
	nop
	set	0x42, %g3
	sth	%i7,	[%l7 + %g3]
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x81,	%i2
	nop
	set	0x31, %o3
	stb	%l3,	[%l7 + %o3]
	set	0x70, %l1
	ldda	[%l7 + %l1] 0xe3,	%i0
	set	0x50, %g2
	stwa	%i6,	[%l7 + %g2] 0x89
	set	0x25, %g7
	stba	%o1,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x74, %i3
	lduh	[%l7 + %i3],	%i3
	nop
	set	0x60, %i7
	lduw	[%l7 + %i7],	%g6
	set	0x70, %l2
	sta	%f8,	[%l7 + %l2] 0x88
	set	0x12, %i6
	ldstuba	[%l7 + %i6] 0x81,	%l0
	nop
	set	0x74, %i5
	ldub	[%l7 + %i5],	%i1
	nop
	set	0x0C, %l3
	prefetch	[%l7 + %l3],	 2
	nop
	set	0x59, %o1
	stb	%g2,	[%l7 + %o1]
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%o2
	nop
	set	0x70, %g1
	stw	%l4,	[%l7 + %g1]
	nop
	set	0x28, %i0
	stx	%o4,	[%l7 + %i0]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x81
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g1
	nop
	set	0x10, %o2
	swap	[%l7 + %o2],	%l1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf9,	%f16
	set	0x10, %l6
	sta	%f10,	[%l7 + %l6] 0x80
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%o6
	set	0x39, %l5
	stba	%g7,	[%l7 + %l5] 0xeb
	membar	#Sync
	set	0x5C, %g4
	swapa	[%l7 + %g4] 0x89,	%o3
	nop
	set	0x30, %i4
	lduw	[%l7 + %i4],	%i4
	nop
	set	0x50, %o4
	stw	%g3,	[%l7 + %o4]
	nop
	set	0x78, %g6
	std	%f2,	[%l7 + %g6]
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x80,	%o0
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f30
	nop
	set	0x18, %l0
	lduw	[%l7 + %l0],	%g5
	nop
	set	0x48, %o6
	ldsb	[%l7 + %o6],	%l2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%l4
	nop
	set	0x08, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x48, %l1
	sta	%f25,	[%l7 + %l1] 0x80
	nop
	set	0x4C, %o3
	swap	[%l7 + %o3],	%i5
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%g4
	set	0x14, %i3
	stwa	%o5,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x28, %i7
	stw	%o7,	[%l7 + %i7]
	set	0x68, %l2
	stda	%i6,	[%l7 + %l2] 0x89
	set	0x3C, %g2
	lda	[%l7 + %g2] 0x81,	%f7
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f8
	nop
	set	0x40, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x24, %l3
	ldsw	[%l7 + %l3],	%l3
	ble,pt	%icc,	loop_7
	nop
	set	0x58, %i1
	std	%f8,	[%l7 + %i1]
	set	0x4A, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i0
loop_7:
	add	%i6,	%o1,	%i3
	nop
	set	0x78, %o1
	ldsw	[%l7 + %o1],	%l0
	nop
	set	0x16, %i0
	ldsh	[%l7 + %i0],	%i1
	nop
	set	0x10, %g5
	std	%g2,	[%l7 + %g5]
	nop
	set	0x51, %o2
	ldub	[%l7 + %o2],	%g6
	st	%f16,	[%l7 + 0x7C]
	set	0x78, %l6
	prefetcha	[%l7 + %l6] 0x80,	 3
	set	0x54, %o7
	sta	%f9,	[%l7 + %o7] 0x80
	add	%o2,	%o4,	%g1
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf9
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f16
	nop
	set	0x58, %i4
	prefetch	[%l7 + %i4],	 2
	set	0x5C, %o4
	swapa	[%l7 + %o4] 0x80,	%l1
	set	0x58, %g4
	stda	%o6,	[%l7 + %g4] 0x80
	set	0x08, %g6
	ldxa	[%l7 + %g6] 0x81,	%l6
	nop
	set	0x72, %i2
	ldsb	[%l7 + %i2],	%o3
	set	0x1D, %o5
	stba	%i4,	[%l7 + %o5] 0x81
	st	%fsr,	[%l7 + 0x68]
	set	0x1B, %o6
	stba	%g7,	[%l7 + %o6] 0x89
	wr	%g3,	%o0,	%set_softint
	bne	%icc,	loop_8
	nop
	set	0x48, %o0
	sth	%l2,	[%l7 + %o0]
	set	0x10, %l0
	stwa	%l5,	[%l7 + %l0] 0xe3
	membar	#Sync
loop_8:
	and	%i5,	%g4,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%o7
	nop
	set	0x26, %g3
	ldsb	[%l7 + %g3],	%i2
	nop
	set	0x60, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x13, %l1
	ldub	[%l7 + %l1],	%i7
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%i0
	set	0x14, %g7
	stba	%i6,	[%l7 + %g7] 0x88
	add	%o1,	%i3,	%l0
	set	0x4B, %i7
	stba	%i1,	[%l7 + %i7] 0xe3
	membar	#Sync
	and	%l3,	%g6,	%g2
	nop
	set	0x17, %g2
	ldsb	[%l7 + %g2],	%l4
	set	0x6E, %i6
	stha	%o2,	[%l7 + %i6] 0x80
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x80,	 2
	nop
	set	0x4A, %i5
	lduh	[%l7 + %i5],	%g1
	set	0x10, %i1
	stxa	%o6,	[%l7 + %i1] 0x81
	nop
	set	0x38, %g1
	std	%f8,	[%l7 + %g1]
	st	%f11,	[%l7 + 0x48]
	nop
	set	0x58, %o1
	stw	%l1,	[%l7 + %o1]
	set	0x1C, %l3
	stha	%o3,	[%l7 + %l3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x48]
	set	0x66, %g5
	stba	%l6,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x3A, %o2
	sth	%i4,	[%l7 + %o2]
	nop
	set	0x50, %l6
	std	%f4,	[%l7 + %l6]
	set	0x10, %o7
	lda	[%l7 + %o7] 0x80,	%f15
	nop
	set	0x18, %i0
	stw	%g7,	[%l7 + %i0]
	nop
	set	0x30, %l4
	stx	%g3,	[%l7 + %l4]
	nop
	set	0x08, %i4
	std	%f14,	[%l7 + %i4]
	nop
	set	0x77, %l5
	ldub	[%l7 + %l5],	%l2
	set	0x38, %o4
	stwa	%o0,	[%l7 + %o4] 0xea
	membar	#Sync
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%g4
	nop
	set	0x70, %g6
	std	%f2,	[%l7 + %g6]
	and	%l5,	%o5,	%o7
	set	0x14, %i2
	sta	%f26,	[%l7 + %i2] 0x88
	nop
	set	0x73, %o5
	stb	%g5,	[%l7 + %o5]
	set	0x39, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i2
	and	%i0,	%i7,	%o1
	add	%i3,	%l0,	%i6
	set	0x50, %o6
	stxa	%l3,	[%l7 + %o6] 0x88
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x88,	%i1
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	wr	%g6,	%g2,	%sys_tick
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x80,	 1
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%l4
	st	%f2,	[%l7 + 0x60]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xeb,	%g0
	nop
	set	0x32, %o3
	sth	%o6,	[%l7 + %o3]
	set	0x60, %g2
	stda	%o4,	[%l7 + %g2] 0xe3
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%l6
	set	0x70, %i7
	stxa	%o3,	[%l7 + %i7] 0xeb
	membar	#Sync
	and	%i4,	%g7,	%l2
	set	0x74, %l2
	stha	%o0,	[%l7 + %l2] 0x89
	and	%g3,	%i5,	%l5
	set	0x66, %i6
	stha	%g4,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xe2,	%o6
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x40, %i1
	std	%g4,	[%l7 + %i1]
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x89,	%o5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%i2
	set	0x79, %o1
	stba	%o1,	[%l7 + %o1] 0x88
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	set	0x68, %o2
	ldxa	[%l7 + %o2] 0x80,	%i3
	set	0x5C, %l6
	stwa	%l0,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x18, %l3
	std	%i6,	[%l7 + %l3]
	set	0x30, %i0
	swapa	[%l7 + %i0] 0x88,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%g6
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xc8
	nop
	set	0x5C, %o7
	stw	%g2,	[%l7 + %o7]
	nop
	set	0x08, %l5
	prefetch	[%l7 + %l5],	 1
	set	0x0A, %o4
	stha	%o2,	[%l7 + %o4] 0x88
	nop
	set	0x25, %g6
	ldstub	[%l7 + %g6],	%i1
	or	%g1,	%o6,	%l4
	or	%l1,	%l6,	%o4
	add	%i4,	%g7,	%o3
	set	0x4E, %i4
	stha	%l2,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x40, %i2
	sta	%f0,	[%l7 + %i2] 0x89
	nop
	set	0x4B, %o5
	ldstub	[%l7 + %o5],	%o0
	nop
	set	0x50, %g4
	std	%f20,	[%l7 + %g4]
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf0
	membar	#Sync
	nop
	set	0x59, %l0
	ldub	[%l7 + %l0],	%i5
	set	0x60, %g3
	ldda	[%l7 + %g3] 0x81,	%g2
	add	%g4,	%l5,	%o7
	set	0x58, %o0
	stxa	%o5,	[%l7 + %o0] 0x81
	nop
	set	0x50, %i3
	sth	%i0,	[%l7 + %i3]
	fpadd32	%f30,	%f30,	%f0
	set	0x28, %l1
	stxa	%i2,	[%l7 + %l1] 0x81
	set	0x38, %o3
	prefetcha	[%l7 + %o3] 0x80,	 0
	nop
	set	0x60, %g2
	ldsh	[%l7 + %g2],	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x89,	%o1,	%i6
	bgu	%icc,	loop_9
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%l0
	and	%l3,	%g6,	%g2
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f4
loop_9:
	add	%o2,	%i7,	%g1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x89,	%i1,	%l4
	nop
	set	0x7E, %i6
	ldsh	[%l7 + %i6],	%l1
	or	%l6,	%o4,	%o6
	set	0x20, %i5
	stxa	%g7,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x80,	%i4
	set	0x50, %g1
	stda	%o2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f8
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%o0
	set	0x70, %o1
	stwa	%i5,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x08, %o2
	prefetch	[%l7 + %o2],	 4
	nop
	set	0x24, %l6
	prefetch	[%l7 + %l6],	 3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%l5
	nop
	set	0x5C, %i0
	lduh	[%l7 + %i0],	%o7
	set	0x70, %l3
	ldxa	[%l7 + %l3] 0x89,	%o5
	nop
	set	0x1C, %l4
	ldsw	[%l7 + %l4],	%i0
	fpadd32s	%f4,	%f29,	%f22
	bgu	%xcc,	loop_10
	or	%i2,	%g3,	%i3
	set	0x6E, %o7
	stha	%o1,	[%l7 + %o7] 0x88
loop_10:
	nop
	set	0x28, %l5
	stb	%i6,	[%l7 + %l5]
	fpadd16	%f14,	%f22,	%f12
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l0,	%l3
	set	0x21, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g5
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x64, %i4
	lduh	[%l7 + %i4],	%g2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%i7
	nop
	set	0x4C, %g6
	prefetch	[%l7 + %g6],	 0
	nop
	set	0x3C, %o5
	stb	%g1,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x40]
	set	0x2C, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i1
	set	0x40, %g4
	stwa	%o2,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x54, %l0
	ldsw	[%l7 + %l0],	%l1
	and	%l4,	%l6,	%o6
	set	0x20, %g3
	stxa	%g7,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x66, %o0
	ldsb	[%l7 + %o0],	%i4
	fpsub32	%f16,	%f20,	%f24
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x80
	nop
	set	0x0A, %l1
	stb	%o3,	[%l7 + %l1]
	nop
	set	0x62, %o6
	stb	%l2,	[%l7 + %o6]
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f16
	nop
	set	0x0C, %i7
	ldsh	[%l7 + %i7],	%o4
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f4
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f16
	bn	%icc,	loop_11
	or	%o0,	%i5,	%g4
	set	0x60, %i6
	ldda	[%l7 + %i6] 0x89,	%o6
loop_11:
	nop
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f16
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x80,	%l4
	nop
	set	0x52, %g1
	ldsh	[%l7 + %g1],	%o5
	nop
	set	0x62, %g5
	lduh	[%l7 + %g5],	%i2
	nop
	set	0x2A, %o1
	ldstub	[%l7 + %o1],	%i0
	and	%g3,	%o1,	%i6
	or	%i3,	%l0,	%l3
	ld	[%l7 + 0x18],	%f27
	nop
	set	0x08, %o2
	lduw	[%l7 + %o2],	%g2
	or	%g6,	%g5,	%i7
	add	%g1,	%i1,	%o2
	add	%l1,	%l4,	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%i4
	set	0x47, %i0
	stba	%o3,	[%l7 + %i0] 0x81
	nop
	set	0x50, %l6
	lduw	[%l7 + %l6],	%l6
	nop
	set	0x53, %l4
	stb	%l2,	[%l7 + %l4]
	st	%f12,	[%l7 + 0x78]
	nop
	set	0x12, %o7
	sth	%o4,	[%l7 + %o7]
	nop
	set	0x35, %l5
	ldub	[%l7 + %l5],	%o0
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x89,	%g4
	set	0x70, %i4
	ldda	[%l7 + %i4] 0x88,	%o6
	or	%i5,	%l5,	%o5
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xe3,	%i0
	wr	%i2,	%o1,	%ccr
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xe3,	%i6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%l0
	set	0x38, %i2
	stda	%l2,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x38, %g4
	ldsb	[%l7 + %g4],	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%g5
	set	0x78, %l0
	ldxa	[%l7 + %l0] 0x88,	%i7
	set	0x60, %g3
	stha	%g1,	[%l7 + %g3] 0x88
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x81,	%g6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%o2
	set	0x10, %o5
	stwa	%l1,	[%l7 + %o5] 0x89
	nop
	set	0x42, %i3
	sth	%o6,	[%l7 + %i3]
	nop
	set	0x6C, %l1
	stw	%g7,	[%l7 + %l1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%o3
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f30
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf9
	membar	#Sync
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f12
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%l2
	or	%o4,	%l6,	%o0
	set	0x30, %g2
	stwa	%g4,	[%l7 + %g2] 0x81
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%l5
	set	0x0C, %i6
	sta	%f14,	[%l7 + %i6] 0x80
	nop
	set	0x34, %l2
	lduw	[%l7 + %l2],	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x81,	%o7,	%i0
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%o0
	nop
	set	0x39, %g7
	ldstub	[%l7 + %g7],	%i2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xc2
	set	0x60, %g5
	sta	%f15,	[%l7 + %g5] 0x89
	nop
	set	0x38, %g1
	std	%g2,	[%l7 + %g1]
	add	%i6,	%l3,	%g2
	nop
	set	0x37, %o1
	ldub	[%l7 + %o1],	%i3
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%g5
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%i6
	set	0x14, %l4
	lda	[%l7 + %l4] 0x89,	%f8
	add	%g1,	%l0,	%i1
	nop
	set	0x6A, %o7
	sth	%g6,	[%l7 + %o7]
	nop
	set	0x34, %l5
	lduw	[%l7 + %l5],	%l1
	set	0x20, %l6
	swapa	[%l7 + %l6] 0x88,	%o2
	nop
	set	0x26, %o4
	sth	%g7,	[%l7 + %o4]
	bl,a	%icc,	loop_12
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x15, %l3
	ldsb	[%l7 + %l3],	%o6
	st	%fsr,	[%l7 + 0x24]
loop_12:
	ld	[%l7 + 0x64],	%f14
	set	0x60, %g6
	stda	%l4,	[%l7 + %g6] 0xe3
	membar	#Sync
	st	%f6,	[%l7 + 0x5C]
	nop
	set	0x13, %i2
	stb	%o3,	[%l7 + %i2]
	nop
	set	0x2C, %g4
	lduw	[%l7 + %g4],	%l2
	set	0x38, %i4
	stxa	%o4,	[%l7 + %i4] 0x89
	nop
	set	0x48, %l0
	std	%i6,	[%l7 + %l0]
	nop
	set	0x52, %g3
	sth	%o0,	[%l7 + %g3]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%i4
	set	0x3E, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l5
	set	0x54, %i3
	stha	%o5,	[%l7 + %i3] 0x80
	set	0x40, %o5
	stha	%i5,	[%l7 + %o5] 0x89
	nop
	set	0x67, %l1
	ldsb	[%l7 + %l1],	%i0
	add	%o1,	%o7,	%g3
	nop
	set	0x75, %o3
	ldsb	[%l7 + %o3],	%i2
	add	%i6,	%l3,	%g2
	nop
	set	0x34, %i7
	prefetch	[%l7 + %i7],	 3
	wr	%g5,	%i3,	%ccr
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%i6
	nop
	set	0x2C, %o6
	ldsb	[%l7 + %o6],	%l0
	nop
	set	0x5F, %i6
	stb	%i1,	[%l7 + %i6]
	or	%g1,	%g6,	%o2
	set	0x6C, %i1
	sta	%f22,	[%l7 + %i1] 0x89
	nop
	set	0x74, %g7
	ldsw	[%l7 + %g7],	%g7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%o6
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%l4
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x88,	%f16
	ld	[%l7 + 0x20],	%f25
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x81,	%o3
	set	0x32, %o1
	stha	%l2,	[%l7 + %o1] 0x81
	nop
	set	0x35, %i0
	ldsb	[%l7 + %i0],	%l6
	set	0x30, %o2
	stwa	%o0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x81,	 2
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f10
	nop
	set	0x1C, %l4
	swap	[%l7 + %l4],	%g4
	nop
	set	0x10, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x61, %l6
	ldstuba	[%l7 + %l6] 0x81,	%o5
	nop
	set	0x26, %o4
	sth	%i4,	[%l7 + %o4]
	nop
	set	0x30, %l3
	std	%f18,	[%l7 + %l3]
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i4
	set	0x30, %g4
	stxa	%i0,	[%l7 + %g4] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%i6
	st	%f29,	[%l7 + 0x58]
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	nop
	set	0x48, %l0
	prefetch	[%l7 + %l0],	 4
	nop
	set	0x70, %g3
	stb	%i2,	[%l7 + %g3]
	nop
	set	0x34, %i4
	ldsh	[%l7 + %i4],	%g2
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x81,	%i3
	set	0x65, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i7
	nop
	set	0x75, %l1
	ldub	[%l7 + %l1],	%g5
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%i1
	nop
	set	0x38, %i7
	std	%l0,	[%l7 + %i7]
	set	0x60, %g2
	swapa	[%l7 + %g2] 0x81,	%g6
	and	%g1,	%g7,	%l1
	set	0x74, %i3
	sta	%f25,	[%l7 + %i3] 0x88
	nop
	set	0x68, %o6
	ldsw	[%l7 + %o6],	%o2
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x25E, 	%tick_cmpr
	set	0x5E, %i6
	stha	%l2,	[%l7 + %i6] 0x89
	nop
	set	0x64, %i1
	sth	%l6,	[%l7 + %i1]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%g4
	nop
	set	0x58, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x78, %g5
	swap	[%l7 + %g5],	%o5
	nop
	set	0x13, %g7
	ldsb	[%l7 + %g7],	%l5
	nop
	set	0x28, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x20, %o1
	ldsh	[%l7 + %o1],	%i5
	ld	[%l7 + 0x70],	%f4
	and	%i0,	%o7,	%i4
	set	0x23, %o2
	ldstuba	[%l7 + %o2] 0x89,	%o1
	st	%f2,	[%l7 + 0x54]
	fpadd32	%f28,	%f24,	%f14
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x80,	%i6,	%g3
	set	0x60, %l2
	ldxa	[%l7 + %l2] 0x80,	%l3
	set	0x60, %i0
	stda	%g2,	[%l7 + %i0] 0xeb
	membar	#Sync
	set	0x08, %l4
	stxa	%i3,	[%l7 + %l4] 0x88
	nop
	set	0x18, %l5
	swap	[%l7 + %l5],	%i7
	set	0x40, %l6
	stha	%g5,	[%l7 + %l6] 0x89
	nop
	set	0x4C, %o4
	sth	%i2,	[%l7 + %o4]
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x81,	%i1
	nop
	set	0x38, %g6
	stx	%l0,	[%l7 + %g6]
	nop
	set	0x0C, %o7
	lduh	[%l7 + %o7],	%g6
	set	0x60, %g4
	stda	%g0,	[%l7 + %g4] 0xea
	membar	#Sync
	ld	[%l7 + 0x38],	%f27
	nop
	set	0x30, %i2
	std	%g6,	[%l7 + %i2]
	set	0x51, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l1
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x88,	%o6
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x80,	%l4
	nop
	set	0x40, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x08, %l1
	ldstub	[%l7 + %l1],	%o2
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x10, %i7
	stx	%fsr,	[%l7 + %i7]
	and	%l2,	%l6,	%o0
	set	0x50, %g2
	stwa	%o3,	[%l7 + %g2] 0x81
	nop
	set	0x0C, %o3
	lduh	[%l7 + %o3],	%g4
	set	0x28, %o6
	stxa	%o4,	[%l7 + %o6] 0x80
	nop
	set	0x60, %i3
	ldsh	[%l7 + %i3],	%o5
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x80,	%l5,	%i5
	st	%f1,	[%l7 + 0x70]
	nop
	set	0x7C, %i1
	ldsw	[%l7 + %i1],	%o7
	nop
	set	0x60, %i6
	ldsw	[%l7 + %i6],	%i4
	set	0x5E, %g5
	ldstuba	[%l7 + %g5] 0x81,	%o1
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x14, %i5
	swap	[%l7 + %i5],	%i6
	nop
	set	0x48, %g1
	std	%f22,	[%l7 + %g1]
	nop
	set	0x2C, %o1
	lduw	[%l7 + %o1],	%i0
	nop
	set	0x30, %o2
	prefetch	[%l7 + %o2],	 0
	nop
	set	0x72, %l2
	ldsb	[%l7 + %l2],	%g3
	set	0x60, %i0
	stwa	%l3,	[%l7 + %i0] 0x88
	nop
	set	0x30, %l4
	stx	%g2,	[%l7 + %l4]
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%i7
	nop
	set	0x6E, %l6
	ldsb	[%l7 + %l6],	%i3
	nop
	set	0x1A, %g7
	ldstub	[%l7 + %g7],	%g5
	nop
	set	0x3A, %l3
	sth	%i2,	[%l7 + %l3]
	nop
	set	0x20, %g6
	std	%l0,	[%l7 + %g6]
	nop
	set	0x4A, %o4
	ldsh	[%l7 + %o4],	%i1
	nop
	set	0x12, %o7
	ldsh	[%l7 + %o7],	%g6
	nop
	set	0x08, %i2
	std	%g0,	[%l7 + %i2]
	set	0x48, %g4
	stxa	%l1,	[%l7 + %g4] 0x80
	set	0x40, %l0
	swapa	[%l7 + %l0] 0x88,	%g7
	set	0x40, %g3
	stda	%l4,	[%l7 + %g3] 0x89
	ld	[%l7 + 0x64],	%f18
	nop
	set	0x74, %o0
	ldsw	[%l7 + %o0],	%o6
	nop
	set	0x5C, %l1
	ldsh	[%l7 + %l1],	%l2
	nop
	set	0x68, %o5
	ldstub	[%l7 + %o5],	%o2
	and	%o0,	%o3,	%l6
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f0
	nop
	set	0x5E, %i7
	ldstub	[%l7 + %i7],	%o4
	nop
	set	0x38, %o3
	std	%f20,	[%l7 + %o3]
	nop
	set	0x7E, %g2
	sth	%o5,	[%l7 + %g2]
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x89,	%l4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%i4
	add	%i6,	%i0,	%o1
	nop
	set	0x20, %o6
	std	%g2,	[%l7 + %o6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l3
	nop
	set	0x7C, %i1
	ldsh	[%l7 + %i1],	%i3
	set	0x08, %g5
	stxa	%g5,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x23, %i5
	ldstub	[%l7 + %i5],	%i2
	nop
	set	0x08, %g1
	swap	[%l7 + %g1],	%i7
	nop
	set	0x4C, %i6
	stw	%l0,	[%l7 + %i6]
	and	%i1,	%g1,	%g6
	nop
	set	0x58, %o2
	swap	[%l7 + %o2],	%g7
	st	%f4,	[%l7 + 0x28]
	set	0x30, %o1
	stxa	%l4,	[%l7 + %o1] 0x89
	ba,a,pt	%xcc,	loop_13
	nop
	set	0x20, %i0
	stw	%o6,	[%l7 + %i0]
	ld	[%l7 + 0x0C],	%f28
	set	0x72, %l4
	ldstuba	[%l7 + %l4] 0x89,	%l2
loop_13:
	nop
	set	0x10, %l2
	stw	%l1,	[%l7 + %l2]
	nop
	set	0x08, %l5
	lduw	[%l7 + %l5],	%o2
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x88,	 4
	nop
	set	0x20, %l3
	ldsb	[%l7 + %l3],	%o0
	nop
	set	0x3F, %g6
	ldub	[%l7 + %g6],	%o4
	nop
	set	0x0A, %g7
	ldsh	[%l7 + %g7],	%l6
	bne,pn	%xcc,	loop_14
	wr	%o5,	%g4,	%sys_tick
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%o7
	set	0x24, %o7
	stwa	%l5,	[%l7 + %o7] 0x81
loop_14:
	nop
	set	0x28, %g4
	stwa	%i4,	[%l7 + %g4] 0x80
	nop
	set	0x0C, %i2
	sth	%i5,	[%l7 + %i2]
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f10
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%g3
	st	%f26,	[%l7 + 0x54]
	nop
	set	0x40, %l0
	stx	%g2,	[%l7 + %l0]
	fpsub16	%f26,	%f30,	%f14
	set	0x0A, %o5
	stha	%l3,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%g5
	set	0x2A, %o3
	stba	%i6,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	nop
	set	0x58, %i3
	lduw	[%l7 + %i3],	%i2
	nop
	set	0x5E, %o6
	ldsh	[%l7 + %o6],	%l0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%g1
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f18
	nop
	set	0x30, %i4
	ldx	[%l7 + %i4],	%i7
	set	0x28, %g5
	stda	%g6,	[%l7 + %g5] 0x88
	nop
	set	0x7C, %i5
	sth	%g7,	[%l7 + %i5]
	nop
	set	0x08, %i6
	stx	%o6,	[%l7 + %i6]
	nop
	set	0x58, %o2
	ldsw	[%l7 + %o2],	%l2
	nop
	set	0x5C, %g1
	stw	%l1,	[%l7 + %g1]
	set	0x58, %o1
	stda	%o2,	[%l7 + %o1] 0x89
	set	0x4A, %i0
	stba	%l4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x36, %l2
	sth	%o0,	[%l7 + %l2]
	nop
	set	0x32, %l5
	ldsh	[%l7 + %l5],	%o4
	set	0x44, %l4
	swapa	[%l7 + %l4] 0x88,	%l6
	st	%f13,	[%l7 + 0x34]
	and	%o3,	%g4,	%o5
	set	0x40, %l3
	stxa	%l5,	[%l7 + %l3] 0xe3
	membar	#Sync
	and	%o7,	%i5,	%i0
	nop
	set	0x28, %g6
	prefetch	[%l7 + %g6],	 0
	wr	%o1,	%i4,	%clear_softint
	st	%f20,	[%l7 + 0x1C]
	and	%g3,	%g2,	%l3
	or	%i3,	%i6,	%g5
	nop
	set	0x70, %g7
	std	%i2,	[%l7 + %g7]
	nop
	set	0x18, %o4
	stx	%i1,	[%l7 + %o4]
	bge,a	%icc,	loop_15
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%g1
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%g6
loop_15:
	nop
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x81,	 3
	set	0x26, %i2
	stba	%o6,	[%l7 + %i2] 0x89
	add	%l2,	%o2,	%l4
	nop
	set	0x18, %g3
	ldd	[%l7 + %g3],	%f14
	ld	[%l7 + 0x08],	%f9
	nop
	set	0x7F, %o0
	ldsb	[%l7 + %o0],	%o0
	set	0x48, %l0
	sta	%f7,	[%l7 + %l0] 0x88
	st	%f17,	[%l7 + 0x78]
	set	0x70, %l1
	stda	%l0,	[%l7 + %l1] 0xe2
	membar	#Sync
	set	0x30, %o5
	sta	%f18,	[%l7 + %o5] 0x89
	nop
	set	0x21, %i7
	stb	%o4,	[%l7 + %i7]
	nop
	set	0x70, %o3
	stx	%fsr,	[%l7 + %o3]
	fpadd32s	%f22,	%f13,	%f11
	set	0x5C, %g2
	stwa	%l6,	[%l7 + %g2] 0x80
	or	%g4,	%o3,	%l5
	be	%icc,	loop_16
	nop
	set	0x36, %o6
	sth	%o7,	[%l7 + %o6]
	set	0x78, %i1
	lda	[%l7 + %i1] 0x81,	%f28
loop_16:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%o5
	or	%i0,	%i4,	%g3
	nop
	set	0x24, %i3
	prefetch	[%l7 + %i3],	 1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%o1
	set	0x40, %i4
	swapa	[%l7 + %i4] 0x89,	%l3
	set	0x28, %i5
	stha	%i3,	[%l7 + %i5] 0x89
	or	%i6,	%i2,	%g5
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%g0
	nop
	set	0x68, %i6
	stw	%i7,	[%l7 + %i6]
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	add	%l0,	%g6,	%i1
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	set	0x2D, %i0
	stba	%l2,	[%l7 + %i0] 0x80
	add	%o6,	%l4,	%o2
	and	%l1,	%o0,	%l6
	nop
	set	0x08, %l2
	ldsh	[%l7 + %l2],	%g4
	nop
	set	0x58, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x80,	 2
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f0
	nop
	set	0x34, %l3
	ldub	[%l7 + %l3],	%o3
	nop
	set	0x44, %g7
	stb	%l5,	[%l7 + %g7]
	or	%i5,	%o5,	%o7
	nop
	set	0x52, %o4
	lduh	[%l7 + %o4],	%i0
	set	0x64, %o7
	sta	%f12,	[%l7 + %o7] 0x80
	add	%i4,	%g3,	%g2
	wr	%o1,	%i3,	%set_softint
	st	%fsr,	[%l7 + 0x50]
	set	0x12, %g4
	stba	%i6,	[%l7 + %g4] 0x81
	set	0x78, %g6
	stxa	%l3,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x72, %i2
	ldstuba	[%l7 + %i2] 0x88,	%i2
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xeb,	%g0
	nop
	set	0x30, %g3
	ldd	[%l7 + %g3],	%g4
	set	0x74, %o0
	stwa	%l0,	[%l7 + %o0] 0x81
	nop
	set	0x44, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x18, %o5
	std	%f6,	[%l7 + %o5]
	set	0x40, %i7
	stxa	%i7,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	set	0x2C, %l1
	ldsw	[%l7 + %l1],	%g6
	set	0x08, %g2
	lda	[%l7 + %g2] 0x81,	%f7
	or	%i1,	%g7,	%l2
	nop
	set	0x4C, %o3
	ldsw	[%l7 + %o3],	%o6
	nop
	set	0x72, %i1
	lduh	[%l7 + %i1],	%l4
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xea,	%l0
	nop
	set	0x58, %i4
	prefetch	[%l7 + %i4],	 3
	or	%o2,	%o0,	%l6
	nop
	set	0x18, %i5
	std	%g4,	[%l7 + %i5]
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%f30
	st	%f8,	[%l7 + 0x40]
	nop
	set	0x28, %i6
	ldub	[%l7 + %i6],	%o3
	nop
	set	0x1C, %g5
	lduh	[%l7 + %g5],	%l5
	set	0x5B, %o2
	stba	%o4,	[%l7 + %o2] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%o7
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x80,	%i5
	set	0x23, %i0
	ldstuba	[%l7 + %i0] 0x81,	%i0
	nop
	set	0x78, %l2
	std	%g2,	[%l7 + %l2]
	set	0x77, %l5
	ldstuba	[%l7 + %l5] 0x81,	%i4
	nop
	set	0x4C, %l4
	prefetch	[%l7 + %l4],	 4
	nop
	set	0x28, %l3
	ldsw	[%l7 + %l3],	%g2
	fpsub32s	%f24,	%f31,	%f28
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%i6
	set	0x68, %g1
	stwa	%o1,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x20, %o4
	std	%i2,	[%l7 + %o4]
	and	%l3,	%g1,	%l0
	nop
	set	0x60, %o7
	std	%f18,	[%l7 + %o7]
	st	%f14,	[%l7 + 0x50]
	set	0x50, %g7
	stha	%i7,	[%l7 + %g7] 0x88
	st	%f10,	[%l7 + 0x70]
	st	%f13,	[%l7 + 0x4C]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd0,	%f0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf0,	%f0
	nop
	set	0x78, %l6
	stx	%g6,	[%l7 + %l6]
	set	0x2D, %g6
	ldstuba	[%l7 + %g6] 0x80,	%i1
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x81
	nop
	set	0x6C, %l0
	ldub	[%l7 + %l0],	%g7
	nop
	set	0x54, %o5
	ldsb	[%l7 + %o5],	%l2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o6,	%g5
	set	0x70, %g3
	stha	%l4,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%l0
	nop
	set	0x60, %g2
	stx	%o2,	[%l7 + %g2]
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%i6
	fpsub16s	%f26,	%f23,	%f12
	nop
	set	0x68, %l1
	lduw	[%l7 + %l1],	%o0
	st	%f5,	[%l7 + 0x4C]
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%o3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0xf9
	membar	#Sync
	nop
	set	0x08, %i5
	std	%l4,	[%l7 + %i5]
	set	0x08, %i3
	lda	[%l7 + %i3] 0x81,	%f31
	nop
	set	0x61, %i6
	stb	%g4,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x68]
	fpsub32s	%f18,	%f13,	%f24
	nop
	set	0x6C, %g5
	lduh	[%l7 + %g5],	%o5
	nop
	set	0x08, %o2
	std	%o4,	[%l7 + %o2]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%i0
	bge,pn	%icc,	loop_17
	add	%g3,	%i4,	%o7
	nop
	set	0x08, %i4
	stx	%g2,	[%l7 + %i4]
	nop
	set	0x30, %i0
	stx	%fsr,	[%l7 + %i0]
loop_17:
	nop
	set	0x58, %o1
	std	%i6,	[%l7 + %o1]
	set	0x69, %l5
	stba	%o1,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
	nop
	set	0x75, %l2
	ldub	[%l7 + %l2],	%i2
	set	0x48, %g1
	stwa	%l3,	[%l7 + %g1] 0xea
	membar	#Sync
	set	0x58, %l3
	ldxa	[%l7 + %l3] 0x80,	%i3
	set	0x0A, %o7
	stha	%g1,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x14, %g7
	stwa	%l0,	[%l7 + %g7] 0x81
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x81,	%i6
	ld	[%l7 + 0x14],	%f15
	nop
	set	0x34, %i2
	ldsh	[%l7 + %i2],	%g6
	set	0x78, %l6
	swapa	[%l7 + %l6] 0x88,	%i1
	nop
	set	0x28, %o4
	stx	%fsr,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x2A, %o0
	ldsb	[%l7 + %o0],	%l2
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%g7
	add	%g5,	%o6,	%l1
	add	%l4,	%o2,	%l6
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x88,	%o0
	nop
	set	0x08, %g3
	stx	%o3,	[%l7 + %g3]
	nop
	set	0x70, %i7
	std	%g4,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x7B, %l0
	ldub	[%l7 + %l0],	%o5
	nop
	set	0x09, %g2
	stb	%o4,	[%l7 + %g2]
	set	0x78, %o3
	stxa	%l5,	[%l7 + %o3] 0x89
	nop
	set	0x30, %l1
	swap	[%l7 + %l1],	%i5
	and	%i0,	%i4,	%o7
	set	0x10, %o6
	swapa	[%l7 + %o6] 0x80,	%g3
	nop
	set	0x78, %i1
	stw	%g2,	[%l7 + %i1]
	wr	%o1,	%i6,	%set_softint
	set	0x1C, %i5
	stha	%i2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x68, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x7A, %g5
	stha	%i3,	[%l7 + %g5] 0x88
	add	%l3,	%g1,	%i7
	set	0x48, %o2
	swapa	[%l7 + %o2] 0x88,	%g6
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%l0
	nop
	set	0x58, %i4
	ldsw	[%l7 + %i4],	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o6,	%g7
	nop
	set	0x0C, %o1
	lduh	[%l7 + %o1],	%l4
	nop
	set	0x68, %i0
	std	%f26,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x34]
	and	%l1,	%o2,	%o0
	nop
	set	0x10, %l4
	sth	%l6,	[%l7 + %l4]
	set	0x3C, %l5
	stwa	%g4,	[%l7 + %l5] 0xea
	membar	#Sync
	st	%f1,	[%l7 + 0x64]
	nop
	set	0x7C, %l2
	prefetch	[%l7 + %l2],	 0
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%o3
	set	0x38, %g1
	lda	[%l7 + %g1] 0x80,	%f16
	nop
	set	0x40, %g7
	ldx	[%l7 + %g7],	%o5
	nop
	set	0x45, %o7
	ldub	[%l7 + %o7],	%l5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	ld	[%l7 + 0x64],	%f22
	st	%f16,	[%l7 + 0x54]
	set	0x40, %l6
	ldxa	[%l7 + %l6] 0x89,	%o4
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	nop
	set	0x40, %o0
	stx	%fsr,	[%l7 + %o0]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%i0
	nop
	set	0x78, %g6
	std	%f10,	[%l7 + %g6]
	nop
	set	0x60, %o5
	ldsw	[%l7 + %o5],	%i4
	nop
	set	0x08, %g3
	stw	%o7,	[%l7 + %g3]
	set	0x28, %g4
	stxa	%g3,	[%l7 + %g4] 0xe3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x80,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i6
	nop
	set	0x14, %g2
	stw	%o1,	[%l7 + %g2]
	nop
	set	0x60, %i7
	stx	%i2,	[%l7 + %i7]
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x88,	%l2
	set	0x10, %o6
	stxa	%g1,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x48, %l1
	sth	%i7,	[%l7 + %l1]
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x88,	 0
	set	0x74, %i6
	sta	%f19,	[%l7 + %i6] 0x81
	nop
	set	0x30, %i1
	stx	%l0,	[%l7 + %i1]
	nop
	set	0x10, %g5
	lduw	[%l7 + %g5],	%i1
	set	0x30, %i3
	lda	[%l7 + %i3] 0x80,	%f17
	nop
	set	0x7A, %o2
	ldub	[%l7 + %o2],	%l2
	set	0x28, %i4
	lda	[%l7 + %i4] 0x88,	%f28
	set	0x10, %i0
	stda	%g4,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x54, %o1
	prefetch	[%l7 + %o1],	 4
	set	0x69, %l4
	stba	%i3,	[%l7 + %l4] 0x81
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%g7
	st	%f16,	[%l7 + 0x44]
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f2
	nop
	set	0x30, %g1
	ldstub	[%l7 + %g1],	%l4
	and	%l1,	%o6,	%o2
	st	%f20,	[%l7 + 0x2C]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f0
	nop
	set	0x68, %l2
	stw	%l6,	[%l7 + %l2]
	set	0x46, %i2
	stha	%o0,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x18, %o7
	std	%o2,	[%l7 + %o7]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xcc
	nop
	set	0x44, %o4
	lduw	[%l7 + %o4],	%g4
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd2,	%f0
	nop
	set	0x50, %o5
	lduw	[%l7 + %o5],	%l5
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%o4
	and	%o5,	%i0,	%i5
	set	0x12, %g4
	stba	%o7,	[%l7 + %g4] 0x88
	nop
	set	0x64, %g3
	swap	[%l7 + %g3],	%g3
	nop
	set	0x7C, %l0
	ldsb	[%l7 + %l0],	%i4
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i6
	set	0x68, %o3
	stda	%o0,	[%l7 + %o3] 0xea
	membar	#Sync
	st	%f0,	[%l7 + 0x3C]
	nop
	set	0x6C, %o6
	ldub	[%l7 + %o6],	%l3
	nop
	set	0x10, %l1
	std	%f0,	[%l7 + %l1]
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f6
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f2
	set	0x60, %i1
	ldda	[%l7 + %i1] 0xe2,	%g0
	nop
	set	0x38, %g5
	lduh	[%l7 + %g5],	%i7
	nop
	set	0x1E, %i6
	lduh	[%l7 + %i6],	%i2
	nop
	set	0x68, %i3
	std	%f24,	[%l7 + %i3]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f16
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%l0
	set	0x24, %o1
	sta	%f3,	[%l7 + %o1] 0x80
	nop
	set	0x18, %l4
	stx	%g6,	[%l7 + %l4]
	and	%l2,	%i1,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x88,	%g7,	%o6
	nop
	set	0x4A, %i4
	sth	%o2,	[%l7 + %i4]
	nop
	set	0x14, %l3
	ldsw	[%l7 + %l3],	%l6
	st	%f28,	[%l7 + 0x74]
	nop
	set	0x78, %l5
	std	%l0,	[%l7 + %l5]
	nop
	set	0x78, %g7
	stw	%o3,	[%l7 + %g7]
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f8
	set	0x68, %l2
	swapa	[%l7 + %l2] 0x88,	%g4
	wr	%l5,	%o0,	%y
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%i0
	set	0x40, %o7
	sta	%f22,	[%l7 + %o7] 0x81
	set	0x10, %l6
	sta	%f10,	[%l7 + %l6] 0x80
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	set	0x38, %i2
	stha	%o5,	[%l7 + %i2] 0x81
	nop
	set	0x20, %o5
	ldsw	[%l7 + %o5],	%o7
	nop
	set	0x56, %o0
	ldsh	[%l7 + %o0],	%i5
	nop
	set	0x12, %g4
	sth	%g3,	[%l7 + %g4]
	wr	%g2,	%i4,	%sys_tick
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%i6
	nop
	set	0x30, %l0
	lduh	[%l7 + %l0],	%l3
	ld	[%l7 + 0x14],	%f21
	set	0x38, %g3
	ldxa	[%l7 + %g3] 0x88,	%o1
	set	0x3C, %i7
	swapa	[%l7 + %i7] 0x88,	%i7
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f0
	nop
	set	0x38, %o6
	ldd	[%l7 + %o6],	%g0
	set	0x3A, %l1
	stha	%i2,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x0C, %i5
	stw	%l0,	[%l7 + %i5]
	and	%l2,	%g6,	%i1
	nop
	set	0x72, %g2
	ldsb	[%l7 + %g2],	%g5
	nop
	set	0x23, %i1
	stb	%i3,	[%l7 + %i1]
	set	0x3B, %i6
	stba	%g7,	[%l7 + %i6] 0x88
	nop
	set	0x20, %g5
	stb	%o6,	[%l7 + %g5]
	nop
	set	0x60, %i3
	lduh	[%l7 + %i3],	%l4
	add	%o2,	%l6,	%o3
	nop
	set	0x14, %i0
	ldsw	[%l7 + %i0],	%l1
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xe2,	%l4
	st	%f2,	[%l7 + 0x5C]
	set	0x24, %l4
	swapa	[%l7 + %l4] 0x80,	%g4
	nop
	set	0x68, %i4
	stw	%o4,	[%l7 + %i4]
	nop
	set	0x5A, %o2
	ldstub	[%l7 + %o2],	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%o5
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%i5
	set	0x7C, %l3
	lda	[%l7 + %l3] 0x89,	%f1
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd8,	%f0
	and	%g3,	%o7,	%g2
	set	0x10, %l2
	lda	[%l7 + %l2] 0x80,	%f10
	wr	%i6,	%l3,	%set_softint
	nop
	set	0x60, %g1
	ldx	[%l7 + %g1],	%o1
	nop
	set	0x1C, %l6
	swap	[%l7 + %l6],	%i4
	set	0x51, %o7
	ldstuba	[%l7 + %o7] 0x89,	%g1
	st	%f3,	[%l7 + 0x24]
	nop
	set	0x08, %i2
	stw	%i7,	[%l7 + %i2]
	nop
	set	0x68, %o5
	ldsw	[%l7 + %o5],	%i2
	be	%xcc,	loop_18
	st	%fsr,	[%l7 + 0x10]
	set	0x44, %o0
	swapa	[%l7 + %o0] 0x89,	%l0
loop_18:
	nop
	set	0x0C, %o4
	sth	%l2,	[%l7 + %o4]
	wr 	%g0, 	0x7, 	%fprs
	st	%f8,	[%l7 + 0x68]
	st	%f30,	[%l7 + 0x10]
	set	0x2C, %g4
	swapa	[%l7 + %g4] 0x88,	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%i3
	nop
	set	0x66, %l0
	sth	%o6,	[%l7 + %l0]
	nop
	set	0x78, %g6
	std	%f30,	[%l7 + %g6]
	nop
	set	0x7C, %g3
	lduw	[%l7 + %g3],	%l4
	set	0x44, %i7
	ldstuba	[%l7 + %i7] 0x80,	%l6
	set	0x66, %o3
	stba	%o3,	[%l7 + %o3] 0x89
	nop
	set	0x6A, %o6
	ldub	[%l7 + %o6],	%l1
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%f20
	st	%fsr,	[%l7 + 0x20]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%l5
	nop
	set	0x70, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	st	%fsr,	[%l7 + 0x20]
	add	%g4,	%i0,	%o4
	st	%f27,	[%l7 + 0x2C]
	set	0x1C, %g2
	sta	%f30,	[%l7 + %g2] 0x88
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x80,	%o4
	nop
	set	0x68, %i3
	prefetch	[%l7 + %i3],	 3
	nop
	set	0x17, %i6
	ldstub	[%l7 + %i6],	%i5
	and	%o0,	%g3,	%g2
	st	%fsr,	[%l7 + 0x1C]
	ld	[%l7 + 0x3C],	%f25
	be,pn	%icc,	loop_19
	add	%i6,	%o7,	%l3
	st	%f7,	[%l7 + 0x30]
	nop
	set	0x43, %o1
	ldstub	[%l7 + %o1],	%i4
loop_19:
	and	%g1,	%i7,	%o1
	set	0x38, %l4
	stxa	%i2,	[%l7 + %l4] 0x80
	nop
	set	0x70, %i0
	ldsh	[%l7 + %i0],	%l2
	nop
	set	0x64, %i4
	ldsb	[%l7 + %i4],	%l0
	set	0x70, %l5
	stwa	%g6,	[%l7 + %l5] 0x80
	nop
	set	0x50, %l3
	sth	%g5,	[%l7 + %l3]
	nop
	set	0x60, %o2
	lduw	[%l7 + %o2],	%i1
	set	0x50, %g7
	ldxa	[%l7 + %g7] 0x81,	%g7
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%i2
	nop
	set	0x36, %g1
	ldstub	[%l7 + %g1],	%o6
	nop
	set	0x78, %l6
	std	%l4,	[%l7 + %l6]
	add	%o3,	%l6,	%o2
	set	0x48, %o7
	stda	%l0,	[%l7 + %o7] 0xeb
	membar	#Sync
	ld	[%l7 + 0x2C],	%f14
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe3,	%g4
	ld	[%l7 + 0x20],	%f16
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i0
	st	%fsr,	[%l7 + 0x38]
	be,a	%icc,	loop_20
	fpadd32	%f0,	%f2,	%f20
	ld	[%l7 + 0x3C],	%f12
	set	0x4D, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o4
loop_20:
	nop
	set	0x78, %g4
	ldx	[%l7 + %g4],	%l5
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%i5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%o0
	nop
	set	0x1C, %g3
	swap	[%l7 + %g3],	%g3
	set	0x30, %l0
	stxa	%g2,	[%l7 + %l0] 0xe2
	membar	#Sync
	nop
	set	0x51, %i7
	ldstub	[%l7 + %i7],	%i6
	nop
	set	0x63, %o3
	ldub	[%l7 + %o3],	%o7
	set	0x10, %o6
	lda	[%l7 + %o6] 0x89,	%f8
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%o5
	nop
	set	0x49, %i5
	ldub	[%l7 + %i5],	%i4
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x88,	%f8
	and	%g1,	%o1,	%i7
	nop
	set	0x50, %i1
	std	%i2,	[%l7 + %i1]
	nop
	set	0x50, %g2
	sth	%l0,	[%l7 + %g2]
	nop
	set	0x22, %i3
	ldsb	[%l7 + %i3],	%l2
	nop
	set	0x7C, %i6
	lduw	[%l7 + %i6],	%g6
	set	0x48, %g5
	ldxa	[%l7 + %g5] 0x81,	%i1
	nop
	set	0x32, %l4
	lduh	[%l7 + %l4],	%g7
	set	0x34, %o1
	lda	[%l7 + %o1] 0x80,	%f28
	set	0x0D, %i4
	stba	%g5,	[%l7 + %i4] 0x81
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%i3
	nop
	set	0x24, %l5
	ldsh	[%l7 + %l5],	%l4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc4
	wr	%o6,	%l6,	%y
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%o2
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f22
	nop
	set	0x7F, %l3
	ldstub	[%l7 + %l3],	%o3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xd2
	bge	%xcc,	loop_21
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%l0
	nop
	set	0x18, %g1
	swap	[%l7 + %g1],	%i0
	nop
	set	0x62, %o0
	ldsh	[%l7 + %o0],	%o4
loop_21:
	nop
	set	0x1F, %i2
	stba	%l5,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x38]
	set	0x0C, %g4
	stba	%i5,	[%l7 + %g4] 0x81
	nop
	set	0x40, %o5
	prefetch	[%l7 + %o5],	 0
	set	0x50, %g6
	stda	%g4,	[%l7 + %g6] 0xe3
	membar	#Sync
	or	%o0,	%g3,	%i6
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf9
	membar	#Sync
	st	%f13,	[%l7 + 0x60]
	fpsub16s	%f5,	%f5,	%f17
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f8
	nop
	set	0x60, %l0
	ldsw	[%l7 + %l0],	%o7
	nop
	set	0x55, %i7
	ldstub	[%l7 + %i7],	%l3
	set	0x2D, %o6
	stba	%g2,	[%l7 + %o6] 0x89
	or	%o5,	%i4,	%o1
	st	%f28,	[%l7 + 0x60]
	or	%g1,	%i7,	%l0
	nop
	set	0x48, %o3
	sth	%i2,	[%l7 + %o3]
	nop
	set	0x48, %l1
	prefetch	[%l7 + %l1],	 4
	set	0x30, %i5
	stxa	%g6,	[%l7 + %i5] 0xe3
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%g7
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd2,	%f16
	add	%i1,	%g5,	%i3
	wr	%o6,	%l6,	%clear_softint
	nop
	set	0x50, %i3
	std	%o2,	[%l7 + %i3]
	nop
	set	0x48, %i1
	std	%f12,	[%l7 + %i1]
	st	%f9,	[%l7 + 0x0C]
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe2,	%l4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f16
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o3
	nop
	set	0x2E, %i6
	sth	%o4,	[%l7 + %i6]
	set	0x58, %o1
	stda	%l4,	[%l7 + %o1] 0x88
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%g4
	add	%o0,	%i5,	%i6
	wr	%g3,	%l3,	%set_softint
	set	0x62, %i4
	stha	%o7,	[%l7 + %i4] 0xea
	membar	#Sync
	st	%f12,	[%l7 + 0x30]
	wr	%o5,	%g2,	%clear_softint
	nop
	set	0x4A, %i0
	lduh	[%l7 + %i0],	%i4
	nop
	set	0x48, %o2
	std	%o0,	[%l7 + %o2]
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%g0
	or	%l0,	%i2,	%g6
	nop
	set	0x70, %l2
	ldx	[%l7 + %l2],	%l2
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%i6
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f4
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x3E, %g1
	ldsb	[%l7 + %g1],	%g5
	nop
	set	0x50, %o0
	stx	%i3,	[%l7 + %o0]
	set	0x34, %i2
	stwa	%o6,	[%l7 + %i2] 0xe2
	membar	#Sync
	nop
	set	0x50, %o7
	ldx	[%l7 + %o7],	%g7
	set	0x60, %g4
	stda	%o2,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x10, %o5
	ldd	[%l7 + %o5],	%f18
	set	0x10, %g3
	stxa	%l6,	[%l7 + %g3] 0x81
	nop
	set	0x68, %o4
	ldsw	[%l7 + %o4],	%l4
	nop
	set	0x20, %g6
	stx	%o3,	[%l7 + %g6]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x81
	nop
	set	0x1F, %o6
	stb	%o4,	[%l7 + %o6]
	nop
	set	0x22, %o3
	ldsb	[%l7 + %o3],	%l5
	set	0x27, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l1
	nop
	set	0x20, %i7
	std	%i0,	[%l7 + %i7]
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%o0
	st	%fsr,	[%l7 + 0x18]
	set	0x48, %g2
	stxa	%g4,	[%l7 + %g2] 0x80
	nop
	set	0x74, %i3
	ldsw	[%l7 + %i3],	%i5
	set	0x32, %g5
	stha	%g3,	[%l7 + %g5] 0x89
	nop
	set	0x68, %i1
	stx	%i6,	[%l7 + %i1]
	set	0x44, %i6
	lda	[%l7 + %i6] 0x89,	%f18
	nop
	set	0x20, %l4
	ldub	[%l7 + %l4],	%o7
	set	0x17, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l3
	add	%g2,	%i4,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%l0
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x80,	%i2
	nop
	set	0x3C, %o1
	ldsb	[%l7 + %o1],	%o5
	nop
	set	0x0C, %o2
	ldstub	[%l7 + %o2],	%l2
	nop
	set	0x6A, %g7
	lduh	[%l7 + %g7],	%g6
	set	0x40, %l5
	sta	%f11,	[%l7 + %l5] 0x80
	nop
	set	0x4A, %l6
	lduh	[%l7 + %l6],	%i7
	ba,pn	%icc,	loop_22
	nop
	set	0x74, %l3
	lduh	[%l7 + %l3],	%i1
	nop
	set	0x44, %l2
	ldsw	[%l7 + %l2],	%i3
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
loop_22:
	bne,a	%icc,	loop_23
	bleu,a,pt	%xcc,	loop_24
	nop
	set	0x50, %o0
	std	%f2,	[%l7 + %o0]
	set	0x10, %o7
	stwa	%g7,	[%l7 + %o7] 0xe2
	membar	#Sync
loop_23:
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
loop_24:
	nop
	set	0x3C, %o5
	sta	%f3,	[%l7 + %o5] 0x89
	add	%o2,	%l6,	%l4
	st	%fsr,	[%l7 + 0x0C]
	or	%o6,	%o3,	%o4
	set	0x48, %g3
	stxa	%l5,	[%l7 + %g3] 0xe3
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%o0
	set	0x70, %o4
	swapa	[%l7 + %o4] 0x88,	%g4
	set	0x60, %g6
	sta	%f20,	[%l7 + %g6] 0x89
	nop
	set	0x38, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%i5
	set	0x08, %o3
	lda	[%l7 + %o3] 0x80,	%f5
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%g3
	set	0x60, %g4
	sta	%f24,	[%l7 + %g4] 0x80
	set	0x68, %i5
	stwa	%i6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x56, %g2
	ldub	[%l7 + %g2],	%l1
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%f14
	add	%o7,	%l3,	%i4
	nop
	set	0x1C, %i7
	lduw	[%l7 + %i7],	%o1
	nop
	set	0x58, %g5
	stw	%g2,	[%l7 + %g5]
	set	0x78, %i6
	stba	%g1,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x68, %l4
	stwa	%l0,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x7D, %i1
	ldstub	[%l7 + %i1],	%i2
	nop
	set	0x6C, %i4
	prefetch	[%l7 + %i4],	 0
	set	0x78, %i0
	swapa	[%l7 + %i0] 0x80,	%l2
	and	%g6,	%o5,	%i7
	st	%fsr,	[%l7 + 0x50]
	set	0x0A, %o1
	stha	%i3,	[%l7 + %o1] 0x80
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 1
	set	0x60, %o2
	stxa	%g5,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x39, %l5
	ldstuba	[%l7 + %l5] 0x80,	%i1
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%o2
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f0
	set	0x60, %l2
	swapa	[%l7 + %l2] 0x89,	%l6
	set	0x08, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l4
	set	0x24, %g1
	swapa	[%l7 + %g1] 0x80,	%g7
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%o6
	st	%f18,	[%l7 + 0x24]
	nop
	set	0x7A, %o5
	lduh	[%l7 + %o5],	%o4
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o3
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x81,	%l4
	set	0x50, %g6
	stxa	%o0,	[%l7 + %g6] 0x80
	st	%f0,	[%l7 + 0x48]
	set	0x30, %i2
	stda	%g4,	[%l7 + %i2] 0xe3
	membar	#Sync
	and	%i0,	%g3,	%i6
	set	0x38, %o6
	stxa	%l1,	[%l7 + %o6] 0x89
	nop
	set	0x44, %l0
	swap	[%l7 + %l0],	%i5
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x88,	%o7
	nop
	set	0x54, %g4
	prefetch	[%l7 + %g4],	 1
	fpadd32	%f26,	%f30,	%f20
	add	%i4,	%l3,	%g2
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%o1
	nop
	set	0x16, %o3
	lduh	[%l7 + %o3],	%g1
	fpsub32	%f16,	%f4,	%f30
	set	0x50, %g2
	sta	%f26,	[%l7 + %g2] 0x81
	set	0x68, %i3
	stda	%i2,	[%l7 + %i3] 0x80
	nop
	set	0x10, %g5
	ldstub	[%l7 + %g5],	%l2
	nop
	set	0x1A, %i7
	ldstub	[%l7 + %i7],	%l0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	set	0x30, %i1
	stda	%o4,	[%l7 + %i1] 0x89
	nop
	set	0x18, %i4
	stx	%g6,	[%l7 + %i4]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf8,	%f16
	nop
	set	0x60, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%i7
	nop
	set	0x44, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc0
	nop
	set	0x10, %l5
	stw	%g5,	[%l7 + %l5]
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f8
	ld	[%l7 + 0x0C],	%f20
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x80
	set	0x60, %l3
	stha	%i1,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x60, %o0
	stx	%fsr,	[%l7 + %o0]
	wr	%i3,	%o2,	%ccr
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd0,	%f0
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f16
	and	%l4,	%l6,	%o6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf1
	membar	#Sync
	set	0x58, %o4
	stda	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x34, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o4
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x89,	 3
	set	0x5F, %o6
	stba	%o0,	[%l7 + %o6] 0x89
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x20, %l0
	stx	%o3,	[%l7 + %l0]
	nop
	set	0x74, %g6
	ldsh	[%l7 + %g6],	%g4
	set	0x28, %g4
	stha	%g3,	[%l7 + %g4] 0x80
	set	0x74, %l1
	stwa	%i0,	[%l7 + %l1] 0xea
	membar	#Sync
	and	%i6,	%i5,	%l1
	nop
	set	0x30, %i5
	swap	[%l7 + %i5],	%o7
	set	0x64, %o3
	lda	[%l7 + %o3] 0x80,	%f7
	or	%l3,	%g2,	%i4
	add	%g1,	%i2,	%o1
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x48, %i3
	std	%f14,	[%l7 + %i3]
	nop
	set	0x60, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x71, %i7
	ldstub	[%l7 + %i7],	%l2
	nop
	set	0x70, %l4
	stx	%fsr,	[%l7 + %l4]
	st	%f28,	[%l7 + 0x0C]
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x81,	%o5
	set	0x60, %i6
	ldxa	[%l7 + %i6] 0x89,	%g6
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x81,	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x74, %g7
	ldsw	[%l7 + %g7],	%i3
	add	%g5,	%o2,	%l6
	ld	[%l7 + 0x4C],	%f18
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%o6
	add	%l4,	%g7,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%o4
	st	%f30,	[%l7 + 0x60]
	nop
	set	0x64, %i4
	stw	%g4,	[%l7 + %i4]
	nop
	set	0x08, %l5
	lduh	[%l7 + %l5],	%o3
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xf9
	membar	#Sync
	set	0x48, %i0
	stxa	%i0,	[%l7 + %i0] 0x81
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f2
	set	0x08, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g3
	st	%f14,	[%l7 + 0x18]
	and	%i6,	%i5,	%l1
	nop
	set	0x09, %l2
	ldsb	[%l7 + %l2],	%o7
	nop
	set	0x28, %o5
	ldx	[%l7 + %o5],	%l3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xd2,	%f0
	nop
	set	0x40, %o4
	stx	%i4,	[%l7 + %o4]
	and	%g2,	%g1,	%o1
	ld	[%l7 + 0x28],	%f2
	set	0x60, %g3
	sta	%f20,	[%l7 + %g3] 0x89
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%l2
	nop
	set	0x7C, %o7
	ldsw	[%l7 + %o7],	%o5
	wr	%i2,	%g6,	%ccr
	nop
	set	0x2F, %o6
	ldstub	[%l7 + %o6],	%l0
	set	0x20, %g6
	lda	[%l7 + %g6] 0x89,	%f10
	set	0x50, %l0
	stda	%i6,	[%l7 + %l0] 0x80
	set	0x50, %g4
	stwa	%i3,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x0C, %i5
	sth	%g5,	[%l7 + %i5]
	nop
	set	0x14, %o3
	swap	[%l7 + %o3],	%o2
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x81
	set	0x20, %l1
	ldda	[%l7 + %l1] 0xe3,	%i0
	st	%f22,	[%l7 + 0x44]
	nop
	set	0x6D, %g5
	ldub	[%l7 + %g5],	%l6
	nop
	set	0x40, %i7
	stx	%l4,	[%l7 + %i7]
	nop
	set	0x60, %l4
	stw	%o6,	[%l7 + %l4]
	nop
	set	0x7E, %i3
	ldsb	[%l7 + %i3],	%l5
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x88
	nop
	set	0x68, %o1
	stx	%g7,	[%l7 + %o1]
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x28, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x38, %i1
	ldd	[%l7 + %i1],	%o2
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%i0
	set	0x0C, %l6
	stwa	%g3,	[%l7 + %l6] 0x89
	and	%o0,	%i6,	%l1
	or	%i5,	%l3,	%i4
	set	0x30, %i0
	stba	%o7,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x3A, %l3
	sth	%g1,	[%l7 + %l3]
	nop
	set	0x70, %l5
	std	%f22,	[%l7 + %l5]
	nop
	set	0x20, %l2
	ldub	[%l7 + %l2],	%o1
	wr	%g2,	%o5,	%clear_softint
	set	0x40, %o0
	stwa	%l2,	[%l7 + %o0] 0x88
	nop
	set	0x26, %o5
	lduh	[%l7 + %o5],	%i2
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%l0
	nop
	set	0x30, %g3
	stw	%g6,	[%l7 + %g3]
	nop
	set	0x2A, %g1
	sth	%i3,	[%l7 + %g1]
	set	0x78, %o7
	stwa	%i7,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x72, %i2
	ldsb	[%l7 + %i2],	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i1
	add	%l6,	%l4,	%o6
	wr	%l5,	%g7,	%sys_tick
	nop
	set	0x50, %g6
	std	%f14,	[%l7 + %g6]
	fpsub32s	%f13,	%f17,	%f30
	fpsub16	%f28,	%f2,	%f0
	nop
	set	0x20, %o6
	std	%f18,	[%l7 + %o6]
	nop
	set	0x78, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x76, %l0
	ldsh	[%l7 + %l0],	%g4
	nop
	set	0x18, %i5
	ldsw	[%l7 + %i5],	%o3
	nop
	set	0x34, %o3
	swap	[%l7 + %o3],	%o4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x89,	%f16
	nop
	set	0x7C, %l1
	lduh	[%l7 + %l1],	%i0
	set	0x2C, %g5
	stwa	%o0,	[%l7 + %g5] 0x88
	bgu,a	%xcc,	loop_25
	fpsub32s	%f5,	%f6,	%f11
	and	%i6,	%l1,	%i5
	nop
	set	0x4E, %i7
	ldsh	[%l7 + %i7],	%l3
loop_25:
	nop
	set	0x78, %i3
	stda	%g2,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x2C, %l4
	swapa	[%l7 + %l4] 0x88,	%i4
	nop
	set	0x28, %o1
	stw	%o7,	[%l7 + %o1]
	set	0x68, %i6
	stxa	%g1,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x30, %g7
	std	%g2,	[%l7 + %g7]
	nop
	set	0x74, %i1
	swap	[%l7 + %i1],	%o1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf8
	membar	#Sync
	nop
	set	0x2A, %l6
	ldsh	[%l7 + %l6],	%l2
	st	%f28,	[%l7 + 0x48]
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xd8
	nop
	set	0x2A, %l3
	sth	%o5,	[%l7 + %l3]
	nop
	set	0x58, %i0
	stx	%i2,	[%l7 + %i0]
	nop
	set	0x38, %l5
	ldsb	[%l7 + %l5],	%l0
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x80,	 0
	nop
	set	0x38, %o0
	ldstub	[%l7 + %o0],	%i3
	nop
	set	0x2C, %o5
	swap	[%l7 + %o5],	%i7
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x80,	%g5
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%i1
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%f28
	nop
	set	0x78, %i2
	lduh	[%l7 + %i2],	%o2
	nop
	set	0x3B, %o4
	ldsb	[%l7 + %o4],	%l6
	nop
	nop
	setx	0x7AFEC1852146ED93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC249772815747BC0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f4,	%f10
	and	%l4,	%o6,	%l5
	nop
	set	0x30, %g6
	std	%g6,	[%l7 + %g6]
	set	0x20, %g4
	lda	[%l7 + %g4] 0x80,	%f7
	set	0x70, %l0
	stxa	%g4,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x89,	%o4
	set	, %o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1266
!	Type a   	: 27
!	Type cti   	: 25
!	Type x   	: 530
!	Type f   	: 29
!	Type i   	: 123
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
	set	0x3,	%g2
	set	0x2,	%g3
	set	0xE,	%g4
	set	0xE,	%g5
	set	0x2,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x9,	%i1
	set	-0x7,	%i2
	set	-0x1,	%i3
	set	-0x1,	%i4
	set	-0x8,	%i5
	set	-0x7,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x0BB2378A,	%l0
	set	0x5A488A27,	%l1
	set	0x04F5CFED,	%l2
	set	0x1AFE7058,	%l3
	set	0x69FEE86E,	%l4
	set	0x4CA9F6B7,	%l5
	set	0x03B330FF,	%l6
	!# Output registers
	set	0x1896,	%o0
	set	-0x1967,	%o1
	set	0x10D5,	%o2
	set	0x09D6,	%o3
	set	0x16A9,	%o4
	set	-0x06C9,	%o5
	set	0x018F,	%o6
	set	-0x0377,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	nop
	set	0x74, %o6
	ldsw	[%l7 + %o6],	%i0
	fpadd16	%f6,	%f18,	%f18
	or	%o3,	%o0,	%i6
	set	0x40, %g2
	lda	[%l7 + %g2] 0x89,	%f9
	set	0x44, %g5
	lda	[%l7 + %g5] 0x89,	%f28
	set	0x3A, %l1
	ldstuba	[%l7 + %l1] 0x80,	%i5
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%l1
	set	0x20, %i3
	stxa	%l3,	[%l7 + %i3] 0x88
	nop
	set	0x4F, %o1
	ldub	[%l7 + %o1],	%g3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f0
	set	0x32, %l4
	stha	%i4,	[%l7 + %l4] 0x88
	nop
	set	0x78, %i1
	std	%g0,	[%l7 + %i1]
	nop
	set	0x58, %i4
	std	%g2,	[%l7 + %i4]
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x88,	%o7
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f12
	set	0x50, %g7
	sta	%f1,	[%l7 + %g7] 0x80
	set	0x5B, %l3
	stba	%o1,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x13, %i0
	ldstub	[%l7 + %i0],	%l2
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x08, %l2
	std	%f10,	[%l7 + %l2]
	add	%o5,	%i2,	%l0
	nop
	set	0x64, %o0
	lduh	[%l7 + %o0],	%g6
	set	0x58, %o5
	stda	%i6,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x81,	 1
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f28
	set	0x6E, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i1
	set	0x34, %i2
	sta	%f20,	[%l7 + %i2] 0x81
	set	0x10, %g6
	ldxa	[%l7 + %g6] 0x80,	%i3
	wr	%l6,	%o2,	%ccr
	nop
	set	0x4C, %o4
	lduh	[%l7 + %o4],	%o6
	nop
	set	0x50, %l0
	std	%f4,	[%l7 + %l0]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	add	%l5,	%l4,	%g4
	fpsub16	%f26,	%f18,	%f8
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g7
	nop
	set	0x70, %o3
	std	%f26,	[%l7 + %o3]
	nop
	set	0x3B, %o6
	ldstub	[%l7 + %o6],	%o3
	ba,a	%xcc,	loop_26
	st	%fsr,	[%l7 + 0x78]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%o0
loop_26:
	nop
	set	0x50, %g4
	stda	%i6,	[%l7 + %g4] 0x89
	nop
	set	0x44, %g5
	lduh	[%l7 + %g5],	%i5
	set	0x48, %g2
	swapa	[%l7 + %g2] 0x88,	%l3
	wr	%g3,	%l1,	%softint
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x88,	%g1
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%g2
	nop
	set	0x25, %i3
	ldstub	[%l7 + %i3],	%o7
	set	0x6B, %o1
	stba	%i4,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x74, %l4
	lduw	[%l7 + %l4],	%o1
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f6
	ld	[%l7 + 0x28],	%f25
	set	0x63, %i4
	ldstuba	[%l7 + %i4] 0x81,	%l2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x029, 	%sys_tick_cmpr
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x89,	 2
	ba,a	%icc,	loop_27
	fpsub16	%f26,	%f8,	%f24
	st	%fsr,	[%l7 + 0x70]
	set	0x58, %o2
	ldxa	[%l7 + %o2] 0x88,	%g5
loop_27:
	nop
	set	0x30, %g7
	stx	%fsr,	[%l7 + %g7]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%i1
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%o2
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x80,	%o6
	nop
	set	0x3C, %l3
	prefetch	[%l7 + %l3],	 2
	set	0x28, %l2
	stda	%i6,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x74, %l5
	stwa	%l4,	[%l7 + %l5] 0x89
	nop
	set	0x30, %o0
	swap	[%l7 + %o0],	%g4
	nop
	set	0x70, %g3
	prefetch	[%l7 + %g3],	 1
	set	0x48, %o5
	stxa	%l5,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x3A, %g1
	ldub	[%l7 + %g1],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%i0
	fpadd32s	%f18,	%f23,	%f5
	nop
	nop
	setx	0x6E3B5E4575B91C29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6FAC766FBE33021C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f22
	set	0x3C, %o7
	sta	%f18,	[%l7 + %o7] 0x89
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%o2
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x1C, %l0
	ldsh	[%l7 + %l0],	%i6
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x80,	%i5
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f16
	ld	[%l7 + 0x1C],	%f31
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x89,	%l3
	and	%g3,	%o0,	%l1
	add	%g2,	%g1,	%i4
	nop
	set	0x14, %g4
	prefetch	[%l7 + %g4],	 3
	wr	%o7,	%o1,	%softint
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xc0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i2
	set	0x68, %g6
	sta	%f12,	[%l7 + %g6] 0x81
	set	0x40, %g2
	stba	%o5,	[%l7 + %g2] 0x88
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%i6
	set	0x18, %i3
	stda	%g6,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l0,	%g5
	add	%i1,	%o2,	%i3
	fpsub32	%f2,	%f20,	%f0
	set	0x33, %l1
	ldstuba	[%l7 + %l1] 0x89,	%l6
	add	%o6,	%g4,	%l4
	set	0x20, %o1
	stda	%l4,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x78, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x71, %i1
	ldstub	[%l7 + %i1],	%g7
	nop
	set	0x40, %i6
	ldsh	[%l7 + %i6],	%o4
	set	0x08, %i4
	stxa	%i0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x30, %o2
	stx	%i6,	[%l7 + %o2]
	nop
	set	0x18, %g7
	std	%i4,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x7E, %l6
	ldub	[%l7 + %l6],	%l3
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x80,	 3
	and	%o3,	%l1,	%g2
	nop
	set	0x50, %l2
	swap	[%l7 + %l2],	%g1
	ld	[%l7 + 0x0C],	%f19
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x88,	 0
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%o0
	and	%o1,	%o7,	%i2
	nop
	set	0x30, %o5
	ldstub	[%l7 + %o5],	%l2
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x12, %g1
	sth	%i7,	[%l7 + %g1]
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	set	0x40, %o7
	ldxa	[%l7 + %o7] 0x89,	%i1
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf8
	membar	#Sync
	nop
	set	0x18, %o4
	stw	%o2,	[%l7 + %o4]
	set	0x71, %i5
	ldstuba	[%l7 + %i5] 0x81,	%l0
	set	0x0A, %l0
	stba	%i3,	[%l7 + %l0] 0x81
	add	%l6,	%o6,	%l4
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xc0
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xf8,	%f0
	add	%g4,	%l5,	%g7
	nop
	set	0x42, %g4
	ldsb	[%l7 + %g4],	%i0
	nop
	set	0x18, %g5
	std	%f22,	[%l7 + %g5]
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xea,	%o4
	nop
	set	0x50, %g2
	lduh	[%l7 + %g2],	%i5
	nop
	set	0x12, %i3
	sth	%i6,	[%l7 + %i3]
	set	0x24, %i7
	sta	%f29,	[%l7 + %i7] 0x81
	add	%g3,	%o3,	%l1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%g1
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x80,	%g2
	nop
	set	0x3D, %l1
	ldsb	[%l7 + %l1],	%i4
	bge,pt	%icc,	loop_28
	nop
	set	0x50, %l4
	std	%o0,	[%l7 + %l4]
	set	0x38, %i6
	stxa	%o0,	[%l7 + %i6] 0x89
loop_28:
	nop
	set	0x7E, %i4
	stha	%o7,	[%l7 + %i4] 0x89
	nop
	set	0x18, %i1
	ldstub	[%l7 + %i1],	%l2
	nop
	set	0x58, %g7
	std	%i2,	[%l7 + %g7]
	nop
	set	0x6E, %l6
	lduh	[%l7 + %l6],	%o5
	set	0x3D, %o2
	stba	%g6,	[%l7 + %o2] 0x89
	set	0x38, %l2
	sta	%f14,	[%l7 + %l2] 0x80
	nop
	set	0x3D, %l3
	stb	%g5,	[%l7 + %l3]
	nop
	set	0x18, %l5
	prefetch	[%l7 + %l5],	 0
	and	%i1,	%o2,	%i7
	nop
	set	0x2C, %i0
	stw	%l0,	[%l7 + %i0]
	nop
	set	0x0B, %o0
	stb	%l6,	[%l7 + %o0]
	set	0x26, %g1
	stba	%i3,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x1C, %o5
	stb	%o6,	[%l7 + %o5]
	or	%l4,	%g4,	%l5
	nop
	set	0x38, %g3
	sth	%i0,	[%l7 + %g3]
	set	0x78, %o7
	stwa	%g7,	[%l7 + %o7] 0x89
	nop
	set	0x43, %i2
	stb	%o4,	[%l7 + %i2]
	nop
	set	0x35, %i5
	ldub	[%l7 + %i5],	%i5
	nop
	set	0x78, %l0
	stb	%i6,	[%l7 + %l0]
	set	0x13, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o3
	nop
	set	0x5A, %o6
	sth	%g3,	[%l7 + %o6]
	nop
	set	0x78, %g4
	std	%f18,	[%l7 + %g4]
	nop
	set	0x22, %g5
	stb	%l3,	[%l7 + %g5]
	set	0x34, %g6
	stwa	%l1,	[%l7 + %g6] 0x88
	nop
	set	0x41, %g2
	ldsb	[%l7 + %g2],	%g1
	ld	[%l7 + 0x38],	%f11
	nop
	set	0x7A, %o3
	lduh	[%l7 + %o3],	%i4
	set	0x6C, %i7
	stwa	%o1,	[%l7 + %i7] 0x81
	set	0x7C, %i3
	swapa	[%l7 + %i3] 0x89,	%g2
	nop
	set	0x11, %l1
	ldstub	[%l7 + %l1],	%o7
	ble,pn	%icc,	loop_29
	nop
	set	0x6E, %o1
	sth	%l2,	[%l7 + %o1]
	nop
	set	0x70, %l4
	stx	%i2,	[%l7 + %l4]
	set	0x60, %i6
	stda	%o0,	[%l7 + %i6] 0xea
	membar	#Sync
loop_29:
	nop
	set	0x10, %i4
	std	%f12,	[%l7 + %i4]
	nop
	set	0x30, %i1
	lduw	[%l7 + %i1],	%g6
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x89,	 4
	set	0x68, %o2
	stwa	%o5,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x60, %l2
	stda	%i0,	[%l7 + %l2] 0x89
	set	0x5E, %l3
	stba	%o2,	[%l7 + %l3] 0x88
	nop
	set	0x20, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCFC, 	%tick_cmpr
	nop
	set	0x12, %i0
	lduh	[%l7 + %i0],	%i3
	nop
	set	0x60, %o0
	prefetch	[%l7 + %o0],	 0
	wr	%o6,	%l0,	%y
	nop
	set	0x5C, %g1
	lduw	[%l7 + %g1],	%l4
	nop
	set	0x58, %l5
	swap	[%l7 + %l5],	%g4
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%i0
	nop
	set	0x77, %o7
	ldsb	[%l7 + %o7],	%g7
	set	0x50, %i2
	stxa	%l5,	[%l7 + %i2] 0x80
	nop
	set	0x38, %g3
	ldx	[%l7 + %g3],	%o4
	set	0x68, %i5
	ldstuba	[%l7 + %i5] 0x80,	%i6
	st	%f14,	[%l7 + 0x54]
	nop
	set	0x57, %o4
	ldstub	[%l7 + %o4],	%i5
	set	0x58, %o6
	stda	%o2,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%l3
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xe2,	%g2
	bg,pt	%icc,	loop_30
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x17, %g6
	ldstub	[%l7 + %g6],	%g1
	set	0x16, %g2
	stha	%i4,	[%l7 + %g2] 0xeb
	membar	#Sync
loop_30:
	nop
	set	0x10, %o3
	std	%l0,	[%l7 + %o3]
	nop
	set	0x18, %i7
	ldsb	[%l7 + %i7],	%g2
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%o7
	st	%fsr,	[%l7 + 0x08]
	set	0x64, %i3
	lda	[%l7 + %i3] 0x81,	%f20
	set	0x26, %l1
	stha	%l2,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x38, %o1
	stx	%fsr,	[%l7 + %o1]
	add	%o1,	%o0,	%g6
	nop
	set	0x58, %l4
	std	%f6,	[%l7 + %l4]
	nop
	set	0x50, %i6
	ldd	[%l7 + %i6],	%f26
	nop
	set	0x34, %i4
	lduw	[%l7 + %i4],	%g5
	set	0x20, %g7
	stba	%o5,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x12, %i1
	stb	%i2,	[%l7 + %i1]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%i7
	set	0x40, %o2
	sta	%f29,	[%l7 + %o2] 0x81
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i6
	nop
	set	0x1E, %l2
	stb	%i1,	[%l7 + %l2]
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x89,	 2
	nop
	set	0x54, %l6
	prefetch	[%l7 + %l6],	 0
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f26
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%f8
	nop
	set	0x48, %o5
	ldsw	[%l7 + %o5],	%l0
	nop
	set	0x5E, %g1
	sth	%o6,	[%l7 + %g1]
	set	0x58, %o7
	stxa	%l4,	[%l7 + %o7] 0x80
	st	%fsr,	[%l7 + 0x18]
	set	0x66, %g3
	stha	%g4,	[%l7 + %g3] 0x80
	nop
	set	0x10, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%i0
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xf1
	membar	#Sync
	ld	[%l7 + 0x3C],	%f6
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x60, %o6
	stxa	%g7,	[%l7 + %o6] 0x89
	set	0x5C, %g6
	sta	%f31,	[%l7 + %g6] 0x80
	set	0x58, %g5
	swapa	[%l7 + %g5] 0x88,	%l5
	nop
	set	0x10, %o3
	ldx	[%l7 + %o3],	%o4
	set	0x34, %g2
	stwa	%i5,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x18, %l0
	stx	%o3,	[%l7 + %l0]
	nop
	set	0x2C, %i3
	swap	[%l7 + %i3],	%l3
	nop
	set	0x1C, %l1
	ldsh	[%l7 + %l1],	%i6
	set	0x57, %o1
	stba	%g3,	[%l7 + %o1] 0x81
	nop
	set	0x7B, %i7
	ldub	[%l7 + %i7],	%i4
	and	%g1,	%g2,	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%o1
	nop
	set	0x1C, %l4
	prefetch	[%l7 + %l4],	 4
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
	set	0x48, %g7
	ldxa	[%l7 + %g7] 0x81,	%g6
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%l1
	set	0x34, %i6
	lda	[%l7 + %i6] 0x81,	%f29
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%f16
	fpadd32	%f12,	%f16,	%f26
	nop
	set	0x5C, %l2
	ldub	[%l7 + %l2],	%g5
	nop
	set	0x50, %o2
	stx	%fsr,	[%l7 + %o2]
	set	0x30, %l6
	stwa	%o5,	[%l7 + %l6] 0xe2
	membar	#Sync
	fpadd16s	%f24,	%f19,	%f3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xda
	and	%o2,	%i2,	%i7
	or	%i1,	%i3,	%l0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%l4
	set	0x78, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o6
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%g4
	set	0x58, %o5
	lda	[%l7 + %o5] 0x89,	%f31
	bn,a,pt	%xcc,	loop_31
	ld	[%l7 + 0x38],	%f13
	bgu,pn	%xcc,	loop_32
	nop
	set	0x3A, %g1
	sth	%g7,	[%l7 + %g1]
loop_31:
	nop
	set	0x7D, %g3
	ldstub	[%l7 + %g3],	%l5
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xd0
loop_32:
	nop
	set	0x78, %o4
	swapa	[%l7 + %o4] 0x80,	%i0
	set	0x28, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i5
	ld	[%l7 + 0x5C],	%f10
	set	0x60, %g4
	ldstuba	[%l7 + %g4] 0x88,	%o3
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f20
	nop
	set	0x3C, %o6
	swap	[%l7 + %o6],	%o4
	ld	[%l7 + 0x34],	%f27
	nop
	set	0x57, %g5
	ldsb	[%l7 + %g5],	%i6
	nop
	set	0x4C, %o3
	swap	[%l7 + %o3],	%l3
	set	0x70, %g2
	ldxa	[%l7 + %g2] 0x88,	%i4
	set	0x28, %g6
	stwa	%g1,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x14, %i3
	ldsw	[%l7 + %i3],	%g2
	nop
	set	0x44, %l1
	stb	%g3,	[%l7 + %l1]
	set	0x28, %l0
	lda	[%l7 + %l0] 0x80,	%f11
	set	0x38, %o1
	swapa	[%l7 + %o1] 0x80,	%l2
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x08, %l4
	swapa	[%l7 + %l4] 0x88,	%o0
	nop
	set	0x70, %i4
	std	%f14,	[%l7 + %i4]
	set	0x38, %g7
	sta	%f28,	[%l7 + %g7] 0x81
	set	0x32, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g6
	set	0x08, %i6
	sta	%f17,	[%l7 + %i6] 0x89
	nop
	set	0x78, %l2
	ldstub	[%l7 + %l2],	%l1
	nop
	set	0x08, %o2
	stw	%o7,	[%l7 + %o2]
	set	0x26, %l6
	stha	%g5,	[%l7 + %l6] 0xeb
	membar	#Sync
	set	0x14, %l3
	lda	[%l7 + %l3] 0x81,	%f11
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%o4
	or	%i2,	%i7,	%o2
	or	%i3,	%i1,	%l0
	nop
	set	0x46, %o0
	sth	%l6,	[%l7 + %o0]
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f10
	st	%fsr,	[%l7 + 0x4C]
	set	0x0C, %i0
	stwa	%l4,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	set	0x10, %g3
	ldub	[%l7 + %g3],	%o6
	nop
	set	0x29, %g1
	ldstub	[%l7 + %g1],	%g4
	nop
	set	0x50, %o4
	swap	[%l7 + %o4],	%g7
	set	0x1B, %i2
	ldstuba	[%l7 + %i2] 0x88,	%l5
	st	%fsr,	[%l7 + 0x1C]
	set	0x20, %i5
	sta	%f3,	[%l7 + %i5] 0x88
	or	%i0,	%i5,	%o3
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x14, %g4
	lduw	[%l7 + %g4],	%l3
	nop
	set	0x26, %o7
	sth	%i4,	[%l7 + %o7]
	st	%f17,	[%l7 + 0x14]
	bn,pn	%xcc,	loop_33
	and	%g2,	%g3,	%g1
	set	0x50, %o6
	stxa	%o1,	[%l7 + %o6] 0xe3
	membar	#Sync
loop_33:
	nop
	set	0x48, %o3
	stw	%o0,	[%l7 + %o3]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%l2
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd2
	st	%fsr,	[%l7 + 0x28]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%o7
	nop
	set	0x14, %g6
	swap	[%l7 + %g6],	%g5
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i2
	nop
	set	0x40, %l1
	std	%f16,	[%l7 + %l1]
	nop
	set	0x18, %g5
	std	%o4,	[%l7 + %g5]
	nop
	set	0x3A, %o1
	ldstub	[%l7 + %o1],	%i7
	add	%i3,	%i1,	%l0
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x89,	%o2
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%l6
	nop
	set	0x34, %l4
	ldsh	[%l7 + %l4],	%l4
	set	0x55, %g7
	ldstuba	[%l7 + %g7] 0x81,	%g4
	set	0x60, %i1
	stxa	%g7,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x78, %i6
	ldx	[%l7 + %i6],	%l5
	set	0x70, %i4
	stda	%i0,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x6C, %o2
	stwa	%i5,	[%l7 + %o2] 0x81
	nop
	set	0x5C, %l2
	lduw	[%l7 + %l2],	%o3
	nop
	set	0x2B, %l6
	stb	%i6,	[%l7 + %l6]
	nop
	set	0x1E, %l5
	ldsb	[%l7 + %l5],	%o4
	nop
	set	0x28, %l3
	stx	%o6,	[%l7 + %l3]
	set	0x0F, %o5
	ldstuba	[%l7 + %o5] 0x88,	%l3
	set	0x53, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i4
	nop
	set	0x16, %o0
	ldsb	[%l7 + %o0],	%g3
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x88
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd2,	%f16
	nop
	set	0x38, %o4
	swap	[%l7 + %o4],	%g1
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xda
	set	0x50, %i2
	stha	%g2,	[%l7 + %i2] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x60, %o7
	prefetch	[%l7 + %o7],	 0
	nop
	set	0x70, %g4
	std	%o0,	[%l7 + %g4]
	nop
	set	0x51, %o3
	ldstub	[%l7 + %o3],	%o1
	set	0x48, %g2
	stwa	%l2,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%g6
	nop
	set	0x18, %o6
	std	%f2,	[%l7 + %o6]
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf1
	membar	#Sync
	set	0x68, %i3
	stda	%l0,	[%l7 + %i3] 0xe2
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%g5
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x80,	%i2
	nop
	set	0x20, %g5
	prefetch	[%l7 + %g5],	 2
	nop
	set	0x20, %i7
	std	%f8,	[%l7 + %i7]
	nop
	set	0x14, %l4
	prefetch	[%l7 + %l4],	 2
	nop
	set	0x7A, %l0
	ldub	[%l7 + %l0],	%i7
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf8,	%f0
	set	0x0C, %i1
	lda	[%l7 + %i1] 0x89,	%f30
	nop
	set	0x42, %i4
	ldsh	[%l7 + %i4],	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%i1
	st	%f9,	[%l7 + 0x34]
	nop
	set	0x28, %i6
	ldub	[%l7 + %i6],	%l0
	nop
	set	0x3C, %o2
	prefetch	[%l7 + %o2],	 2
	nop
	set	0x38, %l6
	ldx	[%l7 + %l6],	%l6
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x81,	 4
	set	0x58, %l3
	stda	%l4,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xcc
	set	0x08, %i0
	swapa	[%l7 + %i0] 0x80,	%g7
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%l5
	set	0x58, %g1
	sta	%f4,	[%l7 + %g1] 0x80
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x80,	%g4
	nop
	set	0x5E, %o4
	sth	%i5,	[%l7 + %o4]
	nop
	set	0x28, %i5
	std	%f30,	[%l7 + %i5]
	ld	[%l7 + 0x1C],	%f3
	nop
	set	0x78, %o0
	ldsw	[%l7 + %o0],	%o3
	and	%i6,	%o4,	%o6
	set	0x78, %o7
	stda	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x7C, %g4
	swapa	[%l7 + %g4] 0x80,	%i0
	add	%i4,	%g3,	%g1
	nop
	set	0x2F, %o3
	ldsb	[%l7 + %o3],	%g2
	nop
	set	0x20, %i2
	std	%o0,	[%l7 + %i2]
	ld	[%l7 + 0x3C],	%f8
	nop
	set	0x55, %g2
	ldsb	[%l7 + %g2],	%o1
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%f4
	nop
	set	0x78, %g6
	lduh	[%l7 + %g6],	%l2
	nop
	set	0x40, %l1
	std	%g6,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x80,	 3
	add	%g5,	%i7,	%o5
	ld	[%l7 + 0x18],	%f3
	nop
	set	0x54, %g5
	prefetch	[%l7 + %g5],	 4
	nop
	set	0x60, %o1
	stx	%i1,	[%l7 + %o1]
	nop
	set	0x68, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x5C, %l0
	stwa	%i3,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x60, %g7
	sth	%l6,	[%l7 + %g7]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l4
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	and	%l5,	%g4,	%g7
	nop
	set	0x08, %i1
	std	%i4,	[%l7 + %i1]
	nop
	set	0x60, %i6
	std	%o2,	[%l7 + %i6]
	nop
	set	0x48, %o2
	lduw	[%l7 + %o2],	%i6
	nop
	set	0x15, %i4
	stb	%o4,	[%l7 + %i4]
	set	0x58, %l6
	ldxa	[%l7 + %l6] 0x89,	%l3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o6
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x89,	%i4
	nop
	set	0x51, %l5
	stb	%g1,	[%l7 + %l5]
	nop
	set	0x2E, %l3
	ldsb	[%l7 + %l3],	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%o1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xd0,	%f0
	nop
	set	0x11, %o5
	ldstub	[%l7 + %o5],	%l2
	nop
	set	0x4D, %g3
	ldstub	[%l7 + %g3],	%g6
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x30, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x78, %i5
	stb	%g2,	[%l7 + %i5]
	nop
	set	0x0A, %o0
	ldsh	[%l7 + %o0],	%o7
	nop
	set	0x4C, %o7
	lduh	[%l7 + %o7],	%l1
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x81,	%g5
	and	%i2,	%i7,	%o5
	nop
	set	0x58, %g4
	prefetch	[%l7 + %g4],	 0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i1
	set	0x59, %o3
	ldstuba	[%l7 + %o3] 0x81,	%l0
	nop
	set	0x14, %i2
	stw	%l4,	[%l7 + %i2]
	set	0x28, %g2
	stda	%i6,	[%l7 + %g2] 0x81
	and	%o2,	%g4,	%l5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i5,	%o3
	set	0x49, %g6
	ldstuba	[%l7 + %g6] 0x80,	%i6
	and	%g7,	%l3,	%i0
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x81,	%o4
	set	0x76, %o6
	stha	%i4,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xeb,	%o6
	nop
	set	0x48, %o1
	std	%g2,	[%l7 + %o1]
	nop
	set	0x70, %i7
	stx	%o0,	[%l7 + %i7]
	ld	[%l7 + 0x4C],	%f9
	st	%fsr,	[%l7 + 0x5C]
	set	0x62, %l0
	stha	%o1,	[%l7 + %l0] 0x89
	set	0x3B, %g5
	ldstuba	[%l7 + %g5] 0x88,	%l2
	st	%f7,	[%l7 + 0x7C]
	set	0x64, %l4
	stwa	%g1,	[%l7 + %l4] 0xeb
	membar	#Sync
	and	%g6,	%g2,	%l1
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf8
	membar	#Sync
	set	0x40, %i6
	stwa	%g5,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd2,	%f16
	nop
	set	0x48, %o2
	std	%i2,	[%l7 + %o2]
	nop
	set	0x70, %l6
	ldx	[%l7 + %l6],	%i7
	or	%o7,	%i3,	%o5
	nop
	set	0x5C, %i4
	stw	%i1,	[%l7 + %i4]
	fpadd32s	%f13,	%f11,	%f19
	set	0x68, %l5
	stwa	%l0,	[%l7 + %l5] 0x80
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	and	%l6,	%o2,	%g4
	nop
	set	0x60, %i0
	stx	%l5,	[%l7 + %i0]
	and	%l4,	%o3,	%i5
	nop
	set	0x7C, %o5
	lduh	[%l7 + %o5],	%i6
	nop
	set	0x34, %g3
	stw	%g7,	[%l7 + %g3]
	nop
	set	0x2D, %o4
	ldstub	[%l7 + %o4],	%i0
	set	0x10, %l3
	stwa	%o4,	[%l7 + %l3] 0x81
	nop
	set	0x60, %i5
	stw	%l3,	[%l7 + %i5]
	set	0x48, %o0
	stwa	%i4,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x61, %o7
	ldub	[%l7 + %o7],	%g3
	set	0x54, %g4
	lda	[%l7 + %g4] 0x81,	%f26
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%o0
	add	%l2,	%o1,	%g6
	set	0x58, %g1
	stxa	%g2,	[%l7 + %g1] 0x80
	set	0x4C, %i2
	stwa	%g1,	[%l7 + %i2] 0x89
	nop
	set	0x32, %o3
	stb	%l1,	[%l7 + %o3]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%i7
	nop
	set	0x5E, %g6
	ldsh	[%l7 + %g6],	%g5
	nop
	set	0x74, %g2
	ldub	[%l7 + %g2],	%o7
	nop
	set	0x78, %o6
	std	%f18,	[%l7 + %o6]
	set	0x50, %i3
	stxa	%i3,	[%l7 + %i3] 0x89
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x80,	%o5
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x89,	 3
	nop
	set	0x6E, %i7
	ldsh	[%l7 + %i7],	%l6
	set	0x30, %l0
	ldda	[%l7 + %l0] 0xeb,	%o2
	nop
	set	0x14, %l4
	ldub	[%l7 + %l4],	%g4
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x88,	 4
	nop
	set	0x24, %i6
	ldub	[%l7 + %i6],	%l5
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x88,	%o2
	nop
	set	0x0A, %o2
	stb	%l4,	[%l7 + %o2]
	ld	[%l7 + 0x48],	%f27
	st	%f22,	[%l7 + 0x48]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%i6
	or	%i0,	%o4,	%g7
	nop
	set	0x38, %l6
	std	%f4,	[%l7 + %l6]
	nop
	set	0x08, %g7
	prefetch	[%l7 + %g7],	 4
	add	%i4,	%g3,	%l3
	nop
	set	0x40, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x38, %l5
	ldsb	[%l7 + %l5],	%o6
	nop
	set	0x22, %i0
	sth	%l2,	[%l7 + %i0]
	nop
	set	0x10, %l2
	stw	%o0,	[%l7 + %l2]
	set	0x18, %o5
	lda	[%l7 + %o5] 0x88,	%f18
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xd8,	%f0
	fpadd16s	%f7,	%f11,	%f1
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x88,	%o1
	and	%g2,	%g1,	%g6
	set	0x24, %i5
	stwa	%l1,	[%l7 + %i5] 0x81
	add	%i7,	%g5,	%i2
	nop
	set	0x48, %o0
	std	%o6,	[%l7 + %o0]
	nop
	set	0x08, %o4
	stw	%i3,	[%l7 + %o4]
	and	%l0,	%l6,	%o5
	ld	[%l7 + 0x38],	%f31
	set	0x58, %g4
	stwa	%g4,	[%l7 + %g4] 0x89
	nop
	set	0x12, %o7
	sth	%o2,	[%l7 + %o7]
	nop
	set	0x0A, %i2
	lduh	[%l7 + %i2],	%l5
	nop
	set	0x5E, %g1
	ldstub	[%l7 + %g1],	%o3
	nop
	set	0x08, %o3
	ldsw	[%l7 + %o3],	%l4
	set	0x34, %g6
	lda	[%l7 + %g6] 0x81,	%f23
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	set	0x6F, %g2
	stba	%i5,	[%l7 + %g2] 0x81
	set	0x65, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i1
	nop
	set	0x24, %o1
	sth	%i0,	[%l7 + %o1]
	set	0x10, %i7
	stxa	%o4,	[%l7 + %i7] 0xea
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i6,	%i4
	set	0x36, %l1
	stha	%g7,	[%l7 + %l1] 0x88
	nop
	set	0x44, %l0
	stw	%g3,	[%l7 + %l0]
	or	%o6,	%l2,	%l3
	nop
	set	0x58, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xd0,	%f0
	set	0x34, %i1
	stba	%o1,	[%l7 + %i1] 0xe2
	membar	#Sync
	fpsub32s	%f29,	%f9,	%f22
	set	0x60, %i6
	swapa	[%l7 + %i6] 0x81,	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%g2
	nop
	set	0x28, %o2
	swap	[%l7 + %o2],	%l1
	nop
	set	0x2C, %g7
	lduh	[%l7 + %g7],	%g6
	nop
	set	0x38, %l6
	stb	%i7,	[%l7 + %l6]
	add	%g5,	%i2,	%i3
	set	0x24, %i4
	stha	%l0,	[%l7 + %i4] 0x81
	nop
	set	0x7E, %l5
	ldsh	[%l7 + %l5],	%l6
	add	%o5,	%o7,	%o2
	nop
	set	0x51, %l2
	ldstub	[%l7 + %l2],	%g4
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x81,	%l5
	nop
	set	0x15, %g3
	ldub	[%l7 + %g3],	%l4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd8
	nop
	set	0x48, %i5
	stx	%i5,	[%l7 + %i5]
	nop
	set	0x28, %i0
	sth	%o3,	[%l7 + %i0]
	set	0x7B, %o4
	stba	%i1,	[%l7 + %o4] 0x80
	fpadd16s	%f16,	%f8,	%f24
	nop
	nop
	setx	0x22A30C52,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x27EF2551,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f29,	%f2
	nop
	set	0x30, %g4
	ldx	[%l7 + %g4],	%o4
	ld	[%l7 + 0x4C],	%f29
	set	0x18, %o0
	stxa	%i0,	[%l7 + %o0] 0x81
	nop
	set	0x30, %o7
	swap	[%l7 + %o7],	%i4
	set	0x08, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x80,	 3
	set	0x57, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o6
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x81,	%g7
	set	0x58, %g2
	lda	[%l7 + %g2] 0x80,	%f30
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x41, %i3
	ldstub	[%l7 + %i3],	%l3
	nop
	set	0x14, %o3
	ldsw	[%l7 + %o3],	%l2
	st	%f0,	[%l7 + 0x38]
	set	0x60, %o1
	stxa	%o0,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x64, %i7
	swapa	[%l7 + %i7] 0x89,	%o1
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xca
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%l1
	add	%g6,	%i7,	%g5
	set	0x20, %l0
	stba	%g1,	[%l7 + %l0] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	nop
	set	0x72, %i1
	sth	%i3,	[%l7 + %i1]
	nop
	set	0x58, %i6
	std	%f24,	[%l7 + %i6]
	set	0x0C, %l4
	sta	%f20,	[%l7 + %l4] 0x89
	nop
	set	0x1A, %g7
	sth	%i2,	[%l7 + %g7]
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf1,	%f16
	nop
	set	0x18, %i4
	stw	%l0,	[%l7 + %i4]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%l6
	ld	[%l7 + 0x28],	%f2
	nop
	set	0x34, %l5
	lduh	[%l7 + %l5],	%o2
	or	%o7,	%g4,	%l5
	nop
	set	0x10, %l6
	stx	%l4,	[%l7 + %l6]
	nop
	set	0x10, %o5
	sth	%o3,	[%l7 + %o5]
	set	0x14, %l2
	swapa	[%l7 + %l2] 0x88,	%i5
	or	%o4,	%i0,	%i1
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x81,	%i6
	nop
	set	0x70, %i5
	std	%g2,	[%l7 + %i5]
	or	%i4,	%g7,	%o6
	nop
	set	0x60, %g3
	stx	%l3,	[%l7 + %g3]
	nop
	set	0x20, %i0
	ldsw	[%l7 + %i0],	%l2
	set	0x08, %o4
	stda	%o0,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x4D, %g4
	ldub	[%l7 + %g4],	%g2
	nop
	set	0x08, %o7
	std	%o0,	[%l7 + %o7]
	fpsub16s	%f15,	%f8,	%f18
	nop
	set	0x10, %o0
	std	%l0,	[%l7 + %o0]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g6,	%g5
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x88,	%g1
	set	0x10, %i2
	stxa	%i3,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x48, %o6
	ldx	[%l7 + %o6],	%i2
	st	%f7,	[%l7 + 0x28]
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%f6
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xd8
	nop
	set	0x4B, %o3
	ldsb	[%l7 + %o3],	%l0
	set	0x08, %i3
	lda	[%l7 + %i3] 0x81,	%f1
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x1E, %o1
	sth	%o2,	[%l7 + %o1]
	set	0x48, %l1
	stda	%i6,	[%l7 + %l1] 0x89
	nop
	set	0x3C, %l0
	lduw	[%l7 + %l0],	%g4
	nop
	set	0x3C, %g5
	stw	%l5,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x50, %i1
	sth	%o7,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f16
	ba,a	%xcc,	loop_34
	ld	[%l7 + 0x4C],	%f17
	st	%f15,	[%l7 + 0x18]
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x81,	%l4
loop_34:
	nop
	set	0x59, %g7
	ldstub	[%l7 + %g7],	%o3
	nop
	set	0x68, %i7
	ldsw	[%l7 + %i7],	%o4
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%i5
	add	%i0,	%i1,	%i6
	nop
	set	0x40, %l5
	stx	%i4,	[%l7 + %l5]
	ld	[%l7 + 0x14],	%f30
	nop
	set	0x0E, %o2
	ldsh	[%l7 + %o2],	%g7
	set	0x60, %l6
	stxa	%o6,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x3B, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l3
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%g2
	nop
	set	0x46, %l3
	ldub	[%l7 + %l3],	%l2
	set	0x10, %i5
	ldda	[%l7 + %i5] 0xe3,	%g2
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x89,	%f0
	set	0x28, %i0
	stha	%o1,	[%l7 + %i0] 0xea
	membar	#Sync
	ld	[%l7 + 0x58],	%f4
	nop
	set	0x18, %o4
	std	%l0,	[%l7 + %o4]
	wr	%g6,	%g5,	%softint
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%i3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%i2
	or	%l0,	%i7,	%o2
	nop
	set	0x0C, %g4
	prefetch	[%l7 + %g4],	 0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%o5
	nop
	set	0x64, %o0
	prefetch	[%l7 + %o0],	 3
	set	0x70, %o7
	stxa	%g4,	[%l7 + %o7] 0x81
	set	0x50, %i2
	swapa	[%l7 + %i2] 0x81,	%o7
	nop
	set	0x20, %o6
	std	%l4,	[%l7 + %o6]
	nop
	set	0x5E, %g6
	lduh	[%l7 + %g6],	%l5
	set	0x54, %g1
	sta	%f18,	[%l7 + %g1] 0x81
	add	%o3,	%o4,	%i5
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x89,	%i1
	fpsub16	%f10,	%f12,	%f14
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i6,	%i0
	set	0x50, %g2
	stxa	%i4,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x1B, %i3
	stb	%g7,	[%l7 + %i3]
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x80,	%o6
	nop
	set	0x7C, %o1
	stb	%g3,	[%l7 + %o1]
	nop
	set	0x6C, %g5
	ldsh	[%l7 + %g5],	%l3
	nop
	nop
	setx	0x49478A595C6FDB71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8E948D425F2A8F12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f14,	%f0
	set	0x1C, %i1
	stwa	%g2,	[%l7 + %i1] 0x88
	set	0x68, %l0
	stxa	%o1,	[%l7 + %l0] 0x89
	nop
	set	0x64, %i6
	ldsh	[%l7 + %i6],	%l2
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x89,	%f27
	nop
	set	0x3A, %g7
	sth	%g6,	[%l7 + %g7]
	add	%g5,	%g1,	%i3
	ld	[%l7 + 0x30],	%f7
	nop
	set	0x24, %i4
	lduh	[%l7 + %i4],	%l1
	nop
	set	0x48, %i7
	stw	%i2,	[%l7 + %i7]
	wr	%o0,	%i7,	%clear_softint
	set	0x2F, %o2
	stba	%l0,	[%l7 + %o2] 0x88
	set	0x18, %l5
	stda	%o2,	[%l7 + %l5] 0xea
	membar	#Sync
	or	%l6,	%o5,	%o7
	set	0x18, %l6
	stda	%g4,	[%l7 + %l6] 0xe2
	membar	#Sync
	fpsub16	%f12,	%f16,	%f12
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f16
	nop
	nop
	setx	0xF0EC1335,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x93CA20EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f4,	%f23
	nop
	set	0x38, %l3
	std	%l4,	[%l7 + %l3]
	and	%o3,	%o4,	%i5
	set	0x15, %i5
	stba	%l5,	[%l7 + %i5] 0xea
	membar	#Sync
	ld	[%l7 + 0x10],	%f21
	nop
	set	0x57, %o5
	ldsb	[%l7 + %o5],	%i1
	set	0x48, %i0
	stda	%i0,	[%l7 + %i0] 0x81
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i4
	bne	%xcc,	loop_35
	ld	[%l7 + 0x7C],	%f23
	nop
	set	0x26, %g3
	lduh	[%l7 + %g3],	%g7
	nop
	set	0x28, %o4
	ldsb	[%l7 + %o4],	%g3
loop_35:
	nop
	set	0x44, %g4
	stw	%o6,	[%l7 + %g4]
	wr	%g2,	%o1,	%ccr
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x89,	%l3,	%g6
	and	%g5,	%g1,	%i3
	add	%l1,	%i2,	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%l0
	wr	%l2,	%l6,	%softint
	nop
	set	0x58, %o7
	stx	%o5,	[%l7 + %o7]
	and	%o2,	%g4,	%l4
	set	0x76, %i2
	stha	%o7,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x58, %o0
	ldxa	[%l7 + %o0] 0x88,	%o3
	set	0x08, %o6
	stwa	%i5,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x28, %g6
	ldx	[%l7 + %g6],	%o4
	set	0x08, %o3
	lda	[%l7 + %o3] 0x89,	%f11
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%l5
	nop
	set	0x5A, %g1
	ldsh	[%l7 + %g1],	%i6
	set	0x65, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i4
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x88,	 3
	nop
	set	0x25, %g2
	ldub	[%l7 + %g2],	%g7
	and	%o6,	%g3,	%o1
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x6C, %g5
	lduw	[%l7 + %g5],	%l3
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%g6
	set	0x70, %l0
	ldda	[%l7 + %l0] 0x89,	%g4
	set	0x30, %o1
	stwa	%g1,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x60, %l4
	ldsw	[%l7 + %l4],	%i3
	nop
	set	0x10, %g7
	lduw	[%l7 + %g7],	%g2
	or	%l1,	%i2,	%i7
	set	0x63, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o0
	set	0x24, %i7
	stwa	%l2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x08, %o2
	std	%f16,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x08]
	wr	%l6,	%l0,	%ccr
	ld	[%l7 + 0x40],	%f4
	st	%fsr,	[%l7 + 0x7C]
	set	0x60, %l5
	sta	%f20,	[%l7 + %l5] 0x81
	nop
	set	0x10, %l6
	prefetch	[%l7 + %l6],	 2
	ld	[%l7 + 0x60],	%f24
	set	0x78, %i4
	stxa	%o5,	[%l7 + %i4] 0x88
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f24
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%g4
	set	0x2C, %o5
	sta	%f26,	[%l7 + %o5] 0x88
	set	0x3A, %i5
	stha	%o2,	[%l7 + %i5] 0x80
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%o7
	and	%o3,	%i5,	%i1
	nop
	set	0x48, %g3
	std	%f10,	[%l7 + %g3]
	ld	[%l7 + 0x4C],	%f9
	nop
	set	0x2E, %i0
	lduh	[%l7 + %i0],	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%i6
	fpsub16s	%f30,	%f31,	%f15
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
	nop
	set	0x3E, %o4
	lduh	[%l7 + %o4],	%i0
	bgu,a	%xcc,	loop_36
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%i4
	nop
	set	0x58, %o7
	std	%f4,	[%l7 + %o7]
	nop
	set	0x68, %o0
	prefetch	[%l7 + %o0],	 0
loop_36:
	nop
	set	0x39, %g6
	ldsb	[%l7 + %g6],	%g7
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f0
	nop
	set	0x58, %g1
	ldsw	[%l7 + %g1],	%g3
	nop
	set	0x38, %o3
	std	%f6,	[%l7 + %o3]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f16
	nop
	set	0x58, %g2
	stw	%o1,	[%l7 + %g2]
	or	%o6,	%l3,	%g6
	set	0x58, %g5
	sta	%f30,	[%l7 + %g5] 0x81
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f10
	nop
	set	0x76, %l0
	ldsh	[%l7 + %l0],	%g5
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x88,	%i3
	nop
	set	0x20, %i1
	ldd	[%l7 + %i1],	%f12
	nop
	set	0x52, %l4
	ldsh	[%l7 + %l4],	%g2
	nop
	set	0x78, %i6
	std	%f8,	[%l7 + %i6]
	set	0x76, %i7
	ldstuba	[%l7 + %i7] 0x80,	%g1
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%i2
	nop
	set	0x7C, %l5
	ldsw	[%l7 + %l5],	%l1
	st	%f15,	[%l7 + 0x2C]
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x80,	%o0
	set	0x58, %i4
	lda	[%l7 + %i4] 0x88,	%f14
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f18
	nop
	set	0x77, %l3
	ldsb	[%l7 + %l3],	%l2
	st	%f10,	[%l7 + 0x18]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%l6
	set	0x58, %o2
	stxa	%l0,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%o5
	nop
	set	0x58, %o5
	std	%f10,	[%l7 + %o5]
	nop
	set	0x40, %i0
	lduw	[%l7 + %i0],	%g4
	or	%o2,	%o7,	%o3
	nop
	set	0x78, %g4
	lduh	[%l7 + %g4],	%i5
	set	0x50, %i2
	ldda	[%l7 + %i2] 0xe2,	%l4
	nop
	set	0x78, %o4
	ldsw	[%l7 + %o4],	%i1
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x89,	%l5
	and	%o4,	%i6,	%i0
	st	%fsr,	[%l7 + 0x1C]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%g3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	nop
	set	0x7C, %o0
	stw	%o1,	[%l7 + %o0]
	nop
	set	0x1C, %g1
	ldstub	[%l7 + %g1],	%o6
	nop
	set	0x4F, %o6
	ldub	[%l7 + %o6],	%i4
	nop
	set	0x44, %i3
	prefetch	[%l7 + %i3],	 2
	nop
	set	0x64, %o3
	swap	[%l7 + %o3],	%l3
	nop
	set	0x54, %g2
	swap	[%l7 + %g2],	%g5
	nop
	set	0x39, %g5
	stb	%i3,	[%l7 + %g5]
	nop
	set	0x4A, %l1
	stb	%g6,	[%l7 + %l1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%i2
	set	0x58, %l0
	stxa	%l1,	[%l7 + %l0] 0x89
	set	0x60, %o1
	ldda	[%l7 + %o1] 0xe2,	%g2
	nop
	set	0x68, %i1
	std	%f28,	[%l7 + %i1]
	st	%f7,	[%l7 + 0x7C]
	st	%f31,	[%l7 + 0x64]
	nop
	set	0x22, %i6
	stb	%l2,	[%l7 + %i6]
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xeb,	%o0
	nop
	set	0x48, %i7
	swap	[%l7 + %i7],	%i7
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x66, %l5
	ldsh	[%l7 + %l5],	%l6
	set	0x68, %l6
	stxa	%o5,	[%l7 + %l6] 0x88
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x89,	%g4,	%o2
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%o6
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%l0
	nop
	set	0x30, %g7
	stw	%o3,	[%l7 + %g7]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f16
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x89,	 2
	st	%f5,	[%l7 + 0x28]
	set	0x74, %i5
	lda	[%l7 + %i5] 0x89,	%f3
	nop
	set	0x3C, %g3
	ldsh	[%l7 + %g3],	%l4
	and	%l5,	%o4,	%i1
	nop
	set	0x44, %i0
	swap	[%l7 + %i0],	%i6
	nop
	nop
	setx	0x2506DDD5342BA67F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x24E20A3D63A925CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f20,	%f30
	nop
	set	0x38, %g4
	swap	[%l7 + %g4],	%i0
	add	%g3,	%o1,	%g7
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%i4
	and	%l3,	%g5,	%i3
	nop
	set	0x10, %o4
	swap	[%l7 + %o4],	%g6
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%g0
	nop
	set	0x58, %g6
	ldsh	[%l7 + %g6],	%i2
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xd8,	%f16
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 0
	set	0x0A, %g1
	ldstuba	[%l7 + %g1] 0x89,	%o6
	nop
	set	0x30, %i3
	lduh	[%l7 + %i3],	%l1
	add	%l2,	%g2,	%o0
	set	0x44, %o3
	lda	[%l7 + %o3] 0x89,	%f3
	nop
	nop
	setx	0xEF448C87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x3A247898,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f3,	%f20
	or	%l6,	%i7,	%o5
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x81,	%g4
	set	0x14, %g2
	stha	%o7,	[%l7 + %g2] 0x81
	nop
	set	0x41, %g5
	ldub	[%l7 + %g5],	%l0
	nop
	set	0x28, %l1
	prefetch	[%l7 + %l1],	 4
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%f6
	set	0x44, %l0
	stha	%o3,	[%l7 + %l0] 0xe3
	membar	#Sync
	or	%o2,	%i5,	%l4
	set	0x1C, %i6
	sta	%f16,	[%l7 + %i6] 0x88
	or	%o4,	%l5,	%i1
	set	0x78, %l4
	lda	[%l7 + %l4] 0x88,	%f4
	nop
	set	0x16, %i7
	stb	%i0,	[%l7 + %i7]
	set	0x24, %i1
	lda	[%l7 + %i1] 0x89,	%f8
	nop
	set	0x58, %l5
	stx	%i6,	[%l7 + %l5]
	and	%o1,	%g3,	%g7
	set	0x20, %i4
	sta	%f21,	[%l7 + %i4] 0x89
	and	%i4,	%l3,	%g5
	nop
	set	0x48, %l2
	ldd	[%l7 + %l2],	%f12
	set	0x28, %g7
	stba	%i3,	[%l7 + %g7] 0x81
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x45, %o2
	stba	%g1,	[%l7 + %o2] 0xe2
	membar	#Sync
	st	%f4,	[%l7 + 0x60]
	set	0x28, %l3
	sta	%f5,	[%l7 + %l3] 0x89
	add	%i2,	%g6,	%l1
	nop
	set	0x6E, %i5
	ldstub	[%l7 + %i5],	%l2
	st	%f16,	[%l7 + 0x2C]
	st	%f25,	[%l7 + 0x2C]
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%g2
	add	%o6,	%l6,	%o0
	set	0x70, %g4
	stwa	%i7,	[%l7 + %g4] 0x81
	nop
	set	0x50, %i0
	stb	%o5,	[%l7 + %i0]
	nop
	set	0x14, %o4
	ldub	[%l7 + %o4],	%o7
	nop
	set	0x10, %i2
	stx	%l0,	[%l7 + %i2]
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f26
	set	0x30, %o5
	swapa	[%l7 + %o5] 0x89,	%o3
	bleu,pn	%xcc,	loop_37
	nop
	set	0x17, %o0
	stb	%g4,	[%l7 + %o0]
	bgu,a	%icc,	loop_38
	wr 	%g0, 	0x5, 	%fprs
loop_37:
	nop
	set	0x08, %g1
	stxa	%l4,	[%l7 + %g1] 0x88
loop_38:
	nop
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0
	set	0x0C, %g6
	lda	[%l7 + %g6] 0x81,	%f25
	set	0x38, %o3
	stda	%i0,	[%l7 + %o3] 0xea
	membar	#Sync
	st	%f9,	[%l7 + 0x38]
	nop
	set	0x1F, %g2
	ldub	[%l7 + %g2],	%i0
	set	0x70, %g5
	stxa	%o4,	[%l7 + %g5] 0x88
	set	0x22, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o1
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
	nop
	set	0x48, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f12
	set	0x2E, %i6
	stha	%g3,	[%l7 + %i6] 0x80
	nop
	set	0x58, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x20, %i7
	stx	%g7,	[%l7 + %i7]
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x89,	%i4
	add	%i6,	%g5,	%i3
	set	0x38, %i4
	stxa	%g1,	[%l7 + %i4] 0x89
	nop
	set	0x38, %i1
	swap	[%l7 + %i1],	%i2
	nop
	set	0x78, %l2
	std	%l2,	[%l7 + %l2]
	nop
	set	0x68, %g7
	std	%f28,	[%l7 + %g7]
	nop
	set	0x6F, %l6
	ldstub	[%l7 + %l6],	%g6
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%l1
	nop
	set	0x15, %l3
	ldstub	[%l7 + %l3],	%g2
	set	0x64, %g3
	sta	%f30,	[%l7 + %g3] 0x80
	add	%o6,	%l2,	%l6
	set	0x1E, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i7
	set	0x78, %i0
	prefetcha	[%l7 + %i0] 0x88,	 1
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%o5
	nop
	set	0x58, %g4
	ldsb	[%l7 + %g4],	%l0
	nop
	set	0x1B, %o7
	ldstub	[%l7 + %o7],	%o7
	nop
	set	0x28, %o5
	std	%f6,	[%l7 + %o5]
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x89
	nop
	set	0x24, %g1
	sth	%g4,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%o2
	set	0x70, %o0
	sta	%f23,	[%l7 + %o0] 0x88
	nop
	set	0x78, %g6
	std	%o2,	[%l7 + %g6]
	set	0x10, %g2
	ldda	[%l7 + %g2] 0xe2,	%i4
	wr	%l4,	%i1,	%softint
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc0
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x89,	%l5
	set	0x5E, %o6
	stha	%i0,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x60, %l0
	stda	%o0,	[%l7 + %l0] 0x81
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xc4
	set	0x7C, %i6
	lda	[%l7 + %i6] 0x81,	%f14
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf8
	membar	#Sync
	nop
	set	0x48, %i7
	stw	%o4,	[%l7 + %i7]
	nop
	set	0x64, %l4
	ldsb	[%l7 + %l4],	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i4,	%i6
	set	0x60, %l5
	stxa	%g5,	[%l7 + %l5] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x4D, %i4
	stb	%g7,	[%l7 + %i4]
	set	0x28, %i1
	ldstuba	[%l7 + %i1] 0x80,	%g1
	or	%i3,	%i2,	%g6
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x80,	 2
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x10, %o2
	ldxa	[%l7 + %o2] 0x89,	%g2
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x12, %l3
	sth	%o6,	[%l7 + %l3]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%l2
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%i6
	set	0x20, %g3
	stda	%i6,	[%l7 + %g3] 0xea
	membar	#Sync
	ld	[%l7 + 0x30],	%f3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%o0
	set	0x78, %i0
	ldstuba	[%l7 + %i0] 0x81,	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%g4
	wr	%o2,	%i5,	%set_softint
	nop
	set	0x7C, %o4
	stw	%l4,	[%l7 + %o4]
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%l5
	nop
	set	0x08, %g4
	stw	%o1,	[%l7 + %g4]
	nop
	set	0x18, %o5
	std	%i0,	[%l7 + %o5]
	nop
	set	0x28, %i2
	stx	%g3,	[%l7 + %i2]
	set	0x1B, %o7
	stba	%o4,	[%l7 + %o7] 0x81
	ld	[%l7 + 0x2C],	%f28
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f16
	and	%i6,	%i4,	%g5
	st	%f12,	[%l7 + 0x14]
	set	0x51, %i3
	stba	%g7,	[%l7 + %i3] 0x80
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i2
	nop
	set	0x52, %o0
	ldstub	[%l7 + %o0],	%g1
	st	%f11,	[%l7 + 0x40]
	nop
	set	0x44, %o3
	swap	[%l7 + %o3],	%g6
	bn,a,pn	%icc,	loop_39
	nop
	set	0x28, %g2
	ldub	[%l7 + %g2],	%l3
	bl,pt	%icc,	loop_40
	and	%i2,	%g2,	%l1
loop_39:
	nop
	set	0x0F, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l2
loop_40:
	nop
	set	0x62, %l0
	stha	%i7,	[%l7 + %l0] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x56, %o1
	sth	%l6,	[%l7 + %o1]
	nop
	set	0x18, %o6
	lduw	[%l7 + %o6],	%o6
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x50, %i7
	ldda	[%l7 + %i7] 0x88,	%o0
	set	0x18, %l4
	ldxa	[%l7 + %l4] 0x89,	%l0
	set	0x78, %l5
	stwa	%o5,	[%l7 + %l5] 0x80
	nop
	set	0x28, %i4
	stx	%g4,	[%l7 + %i4]
	ld	[%l7 + 0x4C],	%f27
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o7
	nop
	set	0x40, %i6
	prefetch	[%l7 + %i6],	 0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x89
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xca
	st	%f23,	[%l7 + 0x6C]
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x81,	%i5
	nop
	set	0x78, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x4E, %o2
	sth	%o3,	[%l7 + %o2]
	nop
	set	0x34, %g3
	ldsh	[%l7 + %g3],	%i1
	set	0x58, %i0
	sta	%f29,	[%l7 + %i0] 0x80
	nop
	nop
	setx	0x6E9FB8BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xCE284975,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f5,	%f29
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%o1
	nop
	set	0x11, %o4
	ldsb	[%l7 + %o4],	%l4
	add	%i0,	%o4,	%i6
	set	0x30, %l6
	lda	[%l7 + %l6] 0x88,	%f19
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%g2
	nop
	nop
	setx	0x6DE0F74B002335A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xBEE4746B359BABF1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f16
	set	0x70, %g4
	stda	%i4,	[%l7 + %g4] 0x80
	st	%fsr,	[%l7 + 0x2C]
	set	0x18, %o5
	lda	[%l7 + %o5] 0x80,	%f17
	nop
	set	0x68, %i2
	swap	[%l7 + %i2],	%g7
	fpsub16	%f16,	%f4,	%f30
	set	0x5C, %o7
	swapa	[%l7 + %o7] 0x81,	%g5
	nop
	set	0x0D, %i3
	ldub	[%l7 + %i3],	%g1
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g6
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x89,	 1
	nop
	set	0x17, %o3
	ldsb	[%l7 + %o3],	%l1
	set	0x74, %g2
	stha	%g2,	[%l7 + %g2] 0xea
	membar	#Sync
	set	0x38, %o0
	stxa	%l2,	[%l7 + %o0] 0x80
	nop
	set	0x08, %l0
	stx	%l6,	[%l7 + %l0]
	nop
	set	0x40, %g5
	stx	%o6,	[%l7 + %g5]
	nop
	set	0x28, %o6
	lduw	[%l7 + %o6],	%o0
	ld	[%l7 + 0x60],	%f26
	st	%f12,	[%l7 + 0x2C]
	nop
	set	0x78, %o1
	std	%i6,	[%l7 + %o1]
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf9
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o5
	set	0x0D, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g4
	st	%f27,	[%l7 + 0x3C]
	nop
	set	0x41, %l5
	ldub	[%l7 + %l5],	%o2
	set	0x10, %i4
	lda	[%l7 + %i4] 0x80,	%f0
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f0
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xea,	%i4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd0,	%f16
	nop
	set	0x47, %l2
	ldub	[%l7 + %l2],	%o7
	set	0x14, %l3
	lda	[%l7 + %l3] 0x81,	%f24
	nop
	set	0x14, %i1
	stw	%i1,	[%l7 + %i1]
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x80,	 3
	set	0x64, %i0
	stwa	%o3,	[%l7 + %i0] 0x81
	fpadd32	%f0,	%f10,	%f28
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%o1
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x81,	%l4
	set	0x38, %i5
	lda	[%l7 + %i5] 0x89,	%f19
	set	0x58, %l6
	stxa	%i0,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x74, %o5
	ldstub	[%l7 + %o5],	%i6
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i4
	set	0x30, %g4
	stxa	%g7,	[%l7 + %g4] 0x89
	be	%xcc,	loop_41
	st	%fsr,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x28]
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
loop_41:
	nop
	set	0x20, %i3
	sta	%f28,	[%l7 + %i3] 0x81
	nop
	set	0x18, %g6
	lduw	[%l7 + %g6],	%g1
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xc0
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x88,	%o4
	nop
	set	0x78, %o3
	ldx	[%l7 + %o3],	%i3
	and	%l3,	%g6,	%l1
	set	0x24, %g2
	lda	[%l7 + %g2] 0x88,	%f20
	nop
	set	0x28, %o0
	sth	%i2,	[%l7 + %o0]
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x81,	 4
	st	%fsr,	[%l7 + 0x6C]
	set	0x68, %o6
	stxa	%l6,	[%l7 + %o6] 0x81
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f18
	nop
	set	0x76, %i7
	ldsh	[%l7 + %i7],	%l2
	nop
	set	0x22, %o1
	ldsh	[%l7 + %o1],	%o6
	set	0x75, %l4
	stba	%i7,	[%l7 + %l4] 0x81
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%o0
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%o4
	st	%f2,	[%l7 + 0x44]
	ld	[%l7 + 0x7C],	%f30
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%i5
	set	0x40, %i6
	stxa	%o7,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x60, %l5
	stxa	%o2,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x60, %g7
	sta	%f17,	[%l7 + %g7] 0x89
	nop
	nop
	setx	0x00CFFF4535773745,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x044C29D88418FA2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f16,	%f10
	nop
	set	0x30, %l2
	std	%i0,	[%l7 + %l2]
	nop
	set	0x10, %l3
	stx	%l5,	[%l7 + %l3]
	nop
	set	0x54, %l1
	lduh	[%l7 + %l1],	%o3
	set	0x2A, %i1
	stha	%o1,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x24, %o2
	ldsw	[%l7 + %o2],	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%i6
	set	0x54, %i0
	stba	%i4,	[%l7 + %i0] 0xe2
	membar	#Sync
	add	%g3,	%g7,	%g1
	or	%g5,	%o4,	%i3
	set	0x1D, %g3
	stba	%l3,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x34, %o4
	sta	%f13,	[%l7 + %o4] 0x80
	set	0x3C, %i5
	swapa	[%l7 + %i5] 0x88,	%l1
	nop
	set	0x0C, %l6
	sth	%g6,	[%l7 + %l6]
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xda
	nop
	set	0x18, %o7
	sth	%g2,	[%l7 + %o7]
	nop
	set	0x26, %o5
	ldsh	[%l7 + %o5],	%i2
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f24
	set	0x70, %i3
	stda	%l2,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x6B, %i2
	ldub	[%l7 + %i2],	%o6
	or	%l6,	%i7,	%o0
	nop
	set	0x38, %g1
	stx	%fsr,	[%l7 + %g1]
	ld	[%l7 + 0x68],	%f1
	nop
	set	0x44, %o3
	stw	%o5,	[%l7 + %o3]
	nop
	set	0x7B, %g2
	stb	%l0,	[%l7 + %g2]
	set	0x10, %o0
	sta	%f24,	[%l7 + %o0] 0x89
	nop
	set	0x2C, %o6
	stw	%g4,	[%l7 + %o6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%o2
	st	%f4,	[%l7 + 0x1C]
	nop
	set	0x60, %l0
	stb	%i5,	[%l7 + %l0]
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%i0
	and	%l5,	%o1,	%i0
	ld	[%l7 + 0x64],	%f0
	nop
	set	0x58, %i7
	lduw	[%l7 + %i7],	%o3
	or	%l4,	%i6,	%i4
	nop
	set	0x26, %l4
	stb	%g3,	[%l7 + %l4]
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%g6
	nop
	set	0x40, %i4
	sth	%g1,	[%l7 + %i4]
	nop
	set	0x64, %l5
	lduw	[%l7 + %l5],	%g5
	nop
	set	0x28, %i6
	stx	%fsr,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x68, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x88,	%o4
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x80,	%i3
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%l1
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%l2
	fpadd32s	%f23,	%f22,	%f12
	nop
	set	0x74, %i0
	swap	[%l7 + %i0],	%g6
	nop
	set	0x37, %g3
	stb	%g2,	[%l7 + %g3]
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x80,	%i2
	nop
	set	0x0B, %o4
	ldsb	[%l7 + %o4],	%o6
	nop
	set	0x60, %i5
	std	%f6,	[%l7 + %i5]
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	nop
	set	0x0C, %o7
	ldsw	[%l7 + %o7],	%i7
	nop
	set	0x40, %o5
	sth	%l2,	[%l7 + %o5]
	wr	%o5,	%l0,	%sys_tick
	set	0x65, %g6
	stba	%g4,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%o2
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%i5
	nop
	set	0x70, %i2
	ldx	[%l7 + %i2],	%i1
	nop
	set	0x74, %g1
	swap	[%l7 + %g1],	%l5
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x89,	%o0
	nop
	set	0x30, %l6
	swap	[%l7 + %l6],	%i0
	wr 	%g0, 	0x7, 	%fprs
	set	0x54, %o0
	lda	[%l7 + %o0] 0x80,	%f0
	nop
	set	0x23, %o6
	ldstub	[%l7 + %o6],	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i4,	%i6
	nop
	set	0x5A, %l0
	ldstub	[%l7 + %l0],	%g7
	nop
	set	0x3D, %g5
	ldstub	[%l7 + %g5],	%g1
	and	%g3,	%g5,	%i3
	nop
	set	0x38, %i7
	ldsw	[%l7 + %i7],	%o4
	nop
	set	0x4C, %l4
	sth	%l3,	[%l7 + %l4]
	nop
	set	0x23, %g2
	ldsb	[%l7 + %g2],	%l1
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x81,	%g2
	nop
	set	0x62, %l5
	lduh	[%l7 + %l5],	%g6
	nop
	set	0x78, %i4
	stb	%o6,	[%l7 + %i4]
	nop
	set	0x0D, %l2
	ldub	[%l7 + %l2],	%i2
	wr	%i7,	%l6,	%y
	nop
	set	0x14, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x38, %g7
	stxa	%o5,	[%l7 + %g7] 0xe3
	membar	#Sync
	nop
	set	0x60, %l1
	ldsw	[%l7 + %l1],	%l2
	set	0x68, %i1
	lda	[%l7 + %i1] 0x80,	%f12
	set	0x38, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%o7
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xea,	%o2
	set	0x52, %o2
	stha	%i5,	[%l7 + %o2] 0x81
	nop
	set	0x6D, %g3
	stb	%i1,	[%l7 + %g3]
	set	0x48, %i5
	lda	[%l7 + %i5] 0x81,	%f7
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	nop
	set	0x70, %o7
	lduw	[%l7 + %o7],	%i0
	nop
	set	0x58, %o5
	lduh	[%l7 + %o5],	%l5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o3
	nop
	set	0x68, %g4
	std	%l4,	[%l7 + %g4]
	set	0x0C, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i4
	nop
	set	0x49, %i3
	stb	%i6,	[%l7 + %i3]
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	or	%g1,	%g3,	%g5
	add	%i3,	%o4,	%g7
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	nop
	set	0x14, %l6
	stw	%g2,	[%l7 + %l6]
	nop
	set	0x38, %g1
	std	%f2,	[%l7 + %g1]
	nop
	set	0x64, %o0
	swap	[%l7 + %o0],	%l1
	set	0x68, %o6
	stwa	%g6,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x30, %l0
	ldsw	[%l7 + %l0],	%o6
	nop
	set	0x0F, %i7
	ldub	[%l7 + %i7],	%i7
	and	%i2,	%o5,	%l6
	ld	[%l7 + 0x14],	%f9
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%g4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd0
	nop
	set	0x79, %o1
	ldsb	[%l7 + %o1],	%l0
	st	%f17,	[%l7 + 0x28]
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x88,	%o7
	nop
	set	0x48, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x7C, %l2
	lduh	[%l7 + %l2],	%o2
	nop
	set	0x70, %l4
	ldsw	[%l7 + %l4],	%l2
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x88,	 0
	nop
	set	0x4A, %l1
	lduh	[%l7 + %l1],	%i5
	set	0x60, %i1
	stda	%i0,	[%l7 + %i1] 0xeb
	membar	#Sync
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x81,	%l4
	nop
	set	0x3C, %l3
	ldsw	[%l7 + %l3],	%o1
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%o0
	nop
	set	0x60, %g3
	sth	%l4,	[%l7 + %g3]
	add	%o3,	%i6,	%i4
	nop
	set	0x25, %i0
	ldsb	[%l7 + %i0],	%g3
	nop
	set	0x54, %i5
	stw	%g1,	[%l7 + %i5]
	nop
	set	0x4C, %o7
	stw	%i3,	[%l7 + %o7]
	st	%fsr,	[%l7 + 0x18]
	set	0x58, %o4
	prefetcha	[%l7 + %o4] 0x81,	 2
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x89,	%g5
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x26, %g4
	sth	%g7,	[%l7 + %g4]
	set	0x1E, %i3
	stba	%g2,	[%l7 + %i3] 0xe3
	membar	#Sync
	nop
	set	0x75, %i2
	ldub	[%l7 + %i2],	%l3
	nop
	set	0x1B, %g6
	ldub	[%l7 + %g6],	%g6
	set	0x57, %o3
	stba	%o6,	[%l7 + %o3] 0x81
	set	0x38, %l6
	stxa	%l1,	[%l7 + %l6] 0x81
	set	0x34, %o0
	sta	%f13,	[%l7 + %o0] 0x88
	nop
	set	0x66, %g1
	ldsh	[%l7 + %g1],	%i2
	nop
	set	0x44, %l0
	ldsw	[%l7 + %l0],	%i7
	nop
	set	0x70, %o6
	std	%f2,	[%l7 + %o6]
	nop
	set	0x20, %g5
	ldsw	[%l7 + %g5],	%l6
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f18
	nop
	set	0x60, %o1
	swap	[%l7 + %o1],	%o5
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%f22,	[%l7 + 0x28]
	nop
	set	0x10, %l5
	stx	%g4,	[%l7 + %l5]
	set	0x48, %i4
	ldxa	[%l7 + %i4] 0x81,	%l0
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x88,	%l2
	nop
	set	0x53, %l4
	ldstub	[%l7 + %l4],	%o2
	set	0x1A, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i5
	ld	[%l7 + 0x78],	%f21
	set	0x78, %i6
	swapa	[%l7 + %i6] 0x89,	%i0
	set	0x18, %l3
	sta	%f12,	[%l7 + %l3] 0x88
	nop
	set	0x7C, %i1
	stw	%l5,	[%l7 + %i1]
	nop
	set	0x6B, %o2
	ldub	[%l7 + %o2],	%i1
	and	%o0,	%o1,	%l4
	nop
	set	0x70, %i0
	stw	%o3,	[%l7 + %i0]
	nop
	set	0x56, %g3
	lduh	[%l7 + %g3],	%i6
	nop
	set	0x70, %o7
	ldsb	[%l7 + %o7],	%g3
	and	%i4,	%g1,	%i3
	nop
	set	0x2A, %o4
	sth	%g5,	[%l7 + %o4]
	or	%o4,	%g2,	%g7
	ld	[%l7 + 0x78],	%f10
	nop
	set	0x55, %o5
	stb	%g6,	[%l7 + %o5]
	nop
	set	0x58, %g4
	sth	%l3,	[%l7 + %g4]
	set	0x28, %i5
	stwa	%o6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x15, %i2
	ldstub	[%l7 + %i2],	%l1
	wr	%i2,	%l6,	%pic
	nop
	set	0x08, %g6
	ldub	[%l7 + %g6],	%i7
	add	%o5,	%g4,	%o7
	set	0x20, %i3
	swapa	[%l7 + %i3] 0x89,	%l2
	nop
	set	0x58, %l6
	stx	%o2,	[%l7 + %l6]
	and	%l0,	%i5,	%l5
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%i0
	nop
	set	0x46, %g1
	ldstub	[%l7 + %g1],	%o0
	nop
	set	0x47, %l0
	ldub	[%l7 + %l0],	%i1
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf8,	%f16
	nop
	set	0x28, %g5
	std	%l4,	[%l7 + %g5]
	nop
	set	0x18, %g2
	stx	%o1,	[%l7 + %g2]
	set	0x60, %o0
	prefetcha	[%l7 + %o0] 0x80,	 4
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%g3
	nop
	set	0x28, %l5
	sth	%i4,	[%l7 + %l5]
	set	0x72, %i4
	stba	%i6,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x6B, %o1
	stb	%g1,	[%l7 + %o1]
	nop
	set	0x34, %l2
	ldsw	[%l7 + %l2],	%g5
	set	0x30, %l4
	swapa	[%l7 + %l4] 0x80,	%i3
	st	%fsr,	[%l7 + 0x60]
	st	%f13,	[%l7 + 0x5C]
	or	%g2,	%o4,	%g6
	and	%l3,	%o6,	%l1
	nop
	set	0x24, %l1
	swap	[%l7 + %l1],	%g7
	set	0x78, %i6
	stxa	%i2,	[%l7 + %i6] 0x80
	or	%l6,	%i7,	%g4
	nop
	set	0x19, %l3
	ldub	[%l7 + %l3],	%o5
	or	%o7,	%l2,	%l0
	fpsub32s	%f22,	%f8,	%f17
	set	0x5C, %g7
	lda	[%l7 + %g7] 0x81,	%f3
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x81,	%i5
	st	%fsr,	[%l7 + 0x68]
	set	0x55, %i0
	stba	%l5,	[%l7 + %i0] 0x81
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%i0
	nop
	set	0x18, %o7
	std	%f0,	[%l7 + %o7]
	bne,pt	%icc,	loop_42
	nop
	set	0x46, %g3
	ldsb	[%l7 + %g3],	%o2
	nop
	set	0x20, %o4
	prefetch	[%l7 + %o4],	 1
	set	0x28, %g4
	stxa	%i1,	[%l7 + %g4] 0x81
loop_42:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%o1
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x88,	%o3
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%g3
	nop
	set	0x10, %g6
	std	%o0,	[%l7 + %g6]
	nop
	set	0x20, %i2
	ldsw	[%l7 + %i2],	%i4
	or	%i6,	%g5,	%i3
	add	%g1,	%g2,	%o4
	nop
	set	0x67, %i3
	stb	%l3,	[%l7 + %i3]
	nop
	set	0x58, %l6
	prefetch	[%l7 + %l6],	 3
	bn,a	%xcc,	loop_43
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%g6
	nop
	set	0x10, %g1
	stx	%o6,	[%l7 + %g1]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%g6
loop_43:
	nop
	set	0x4C, %l0
	prefetch	[%l7 + %l0],	 0
	bg,pn	%xcc,	loop_44
	bge,a,pn	%icc,	loop_45
	nop
	set	0x60, %g5
	stx	%i2,	[%l7 + %g5]
	and	%l1,	%l6,	%i7
loop_44:
	fpsub32	%f8,	%f26,	%f24
loop_45:
	nop
	set	0x70, %o0
	stda	%g4,	[%l7 + %o0] 0x81
	st	%f10,	[%l7 + 0x28]
	set	0x10, %i7
	stda	%o4,	[%l7 + %i7] 0x89
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%i5
	add	%l5,	%o2,	%i0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f0
	set	0x10, %l5
	stxa	%i1,	[%l7 + %l5] 0x81
	set	0x48, %i4
	stda	%o0,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf0
	membar	#Sync
	nop
	set	0x72, %l4
	ldub	[%l7 + %l4],	%o3
	nop
	set	0x68, %o1
	std	%f14,	[%l7 + %o1]
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%l4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf9
	membar	#Sync
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xca
	or	%g3,	%o0,	%i6
	and	%i4,	%i3,	%g5
	nop
	set	0x44, %i1
	swap	[%l7 + %i1],	%g1
	nop
	set	0x41, %i0
	stb	%o4,	[%l7 + %i0]
	nop
	set	0x68, %g7
	ldsh	[%l7 + %g7],	%l3
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%o6
	set	0x0C, %g3
	swapa	[%l7 + %g3] 0x89,	%i2
	nop
	set	0x28, %o2
	stx	%g7,	[%l7 + %o2]
	set	0x7D, %o4
	ldstuba	[%l7 + %o4] 0x88,	%l1
	set	0x18, %g4
	stba	%i7,	[%l7 + %g4] 0x89
	set	0x14, %o5
	stha	%l6,	[%l7 + %o5] 0x81
	bl,a,pt	%xcc,	loop_46
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%o5
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%g4
	nop
	set	0x44, %i3
	ldstub	[%l7 + %i3],	%l2
loop_46:
	fpsub32s	%f14,	%f12,	%f4
	set	0x78, %l6
	ldxa	[%l7 + %l6] 0x89,	%l0
	bge,a	%icc,	loop_47
	or	%i5,	%o7,	%o2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xd8,	%f16
loop_47:
	st	%f8,	[%l7 + 0x3C]
	nop
	set	0x64, %g1
	lduh	[%l7 + %g1],	%i0
	nop
	set	0x16, %o6
	ldstub	[%l7 + %o6],	%i1
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f18
	or	%l5,	%o1,	%o3
	nop
	set	0x08, %g6
	std	%l4,	[%l7 + %g6]
	set	0x58, %g5
	stxa	%o0,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x5E, %i7
	ldsb	[%l7 + %i7],	%i6
	set	0x14, %o0
	lda	[%l7 + %o0] 0x88,	%f27
	nop
	set	0x78, %g2
	lduw	[%l7 + %g2],	%i4
	and	%g3,	%g5,	%g1
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x4A, %i4
	ldsh	[%l7 + %i4],	%i3
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%l2
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	set	0x74, %o1
	stwa	%o4,	[%l7 + %o1] 0x81
	or	%g6,	%g2,	%o6
	ld	[%l7 + 0x08],	%f4
	or	%g7,	%i2,	%l1
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%f4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%o5
	nop
	set	0x28, %l4
	sth	%g4,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf8,	%f16
	set	0x30, %i1
	ldda	[%l7 + %i1] 0xeb,	%l2
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x88,	%l0
	nop
	set	0x48, %i0
	stx	%l6,	[%l7 + %i0]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i5
	fpadd32	%f24,	%f12,	%f10
	or	%i0,	%i1,	%l5
	nop
	set	0x70, %g7
	sth	%o1,	[%l7 + %g7]
	nop
	set	0x20, %g3
	std	%o2,	[%l7 + %g3]
	nop
	set	0x72, %o2
	lduh	[%l7 + %o2],	%o2
	set	0x58, %o7
	lda	[%l7 + %o7] 0x80,	%f1
	nop
	set	0x10, %o4
	prefetch	[%l7 + %o4],	 0
	nop
	set	0x68, %o5
	stx	%o0,	[%l7 + %o5]
	nop
	set	0x68, %g4
	stx	%i6,	[%l7 + %g4]
	set	0x08, %i5
	stda	%l4,	[%l7 + %i5] 0x81
	nop
	set	0x0E, %i3
	ldub	[%l7 + %i3],	%g3
	set	0x50, %i2
	ldda	[%l7 + %i2] 0xe3,	%i4
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%g5
	set	0x5C, %l6
	stha	%i3,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%o4
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%l3
	nop
	set	0x70, %g6
	std	%g2,	[%l7 + %g6]
	set	0x2A, %g1
	stba	%g6,	[%l7 + %g1] 0x80
	nop
	set	0x0C, %g5
	ldsw	[%l7 + %g5],	%o6
	set	0x40, %o0
	stxa	%i2,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x26, %g2
	lduh	[%l7 + %g2],	%g7
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x81,	 0
	set	0x10, %l5
	sta	%f21,	[%l7 + %l5] 0x89
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%i7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf0
	membar	#Sync
	set	0x24, %i6
	sta	%f7,	[%l7 + %i6] 0x80
	nop
	set	0x70, %l4
	sth	%o5,	[%l7 + %l4]
	st	%f6,	[%l7 + 0x3C]
	nop
	set	0x30, %l1
	ldd	[%l7 + %l1],	%g4
	or	%l0,	%l6,	%o7
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x81,	%i5
	nop
	set	0x48, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xe3,	%l2
	nop
	set	0x70, %i0
	lduh	[%l7 + %i0],	%i0
	nop
	set	0x5E, %g3
	ldsh	[%l7 + %g3],	%i1
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd2,	%f0
	nop
	set	0x30, %o4
	stx	%l5,	[%l7 + %o4]
	set	0x0B, %o5
	stba	%o1,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x57, %o7
	ldub	[%l7 + %o7],	%o3
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f30
	nop
	set	0x48, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x88,	%o2
	set	0x48, %o3
	stxa	%o0,	[%l7 + %o3] 0x80
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x81,	%l4
	nop
	set	0x3C, %l6
	stw	%g3,	[%l7 + %l6]
	nop
	set	0x30, %o6
	std	%f2,	[%l7 + %o6]
	set	0x28, %g6
	lda	[%l7 + %g6] 0x81,	%f7
	nop
	set	0x60, %g1
	lduw	[%l7 + %g1],	%i4
	nop
	set	0x0C, %l0
	stw	%g1,	[%l7 + %l0]
	fpadd32	%f22,	%f8,	%f24
	set	0x2B, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i6
	nop
	set	0x10, %g5
	sth	%i3,	[%l7 + %g5]
	bge,a,pt	%icc,	loop_48
	and	%g5,	%l3,	%o4
	nop
	set	0x72, %g2
	sth	%g6,	[%l7 + %g2]
	nop
	set	0x48, %l5
	std	%f2,	[%l7 + %l5]
loop_48:
	nop
	set	0x48, %i4
	std	%f30,	[%l7 + %i4]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i2
	set	0x20, %i7
	lda	[%l7 + %i7] 0x81,	%f21
	nop
	set	0x0E, %l2
	sth	%g7,	[%l7 + %l2]
	nop
	set	0x60, %i6
	std	%o6,	[%l7 + %i6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%o5
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x81,	%g4
	set	0x52, %l4
	stba	%l0,	[%l7 + %l4] 0xe2
	membar	#Sync
	st	%f14,	[%l7 + 0x4C]
	nop
	set	0x6A, %o1
	ldub	[%l7 + %o1],	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%i5
	set	0x3E, %l3
	stba	%l2,	[%l7 + %l3] 0x81
	set	0x41, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i0
	set	0x70, %i1
	lda	[%l7 + %i1] 0x89,	%f17
	and	%l6,	%l5,	%o1
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o0
	ld	[%l7 + 0x10],	%f9
	fpsub16s	%f13,	%f2,	%f26
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o2
	st	%f15,	[%l7 + 0x4C]
	nop
	set	0x78, %o2
	ldsw	[%l7 + %o2],	%g3
	set	0x18, %g3
	stwa	%i4,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x32, %o4
	stba	%g1,	[%l7 + %o4] 0x81
	nop
	set	0x54, %o5
	ldsh	[%l7 + %o5],	%i6
	set	0x34, %o7
	ldstuba	[%l7 + %o7] 0x88,	%g5
	st	%f8,	[%l7 + 0x50]
	st	%f19,	[%l7 + 0x54]
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%i3
	nop
	set	0x1E, %i2
	ldstub	[%l7 + %i2],	%l3
	nop
	set	0x28, %i5
	lduw	[%l7 + %i5],	%g6
	set	0x10, %i3
	ldda	[%l7 + %i3] 0xe3,	%o4
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%o6
	set	0x58, %l6
	swapa	[%l7 + %l6] 0x81,	%g7
	fpsub16	%f28,	%f30,	%f22
	set	0x20, %o6
	swapa	[%l7 + %o6] 0x89,	%i7
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f0
	nop
	set	0x40, %g6
	stx	%fsr,	[%l7 + %g6]
	wr	%g4,	%o5,	%sys_tick
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf9
	membar	#Sync
	nop
	set	0x09, %o0
	ldub	[%l7 + %o0],	%l1
	bn,a	%xcc,	loop_49
	and	%l0,	%i5,	%l2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i0,	%o7
loop_49:
	nop
	set	0x2A, %g2
	stha	%l5,	[%l7 + %g2] 0xeb
	membar	#Sync
	st	%f1,	[%l7 + 0x1C]
	nop
	set	0x64, %g5
	lduw	[%l7 + %g5],	%l6
	set	0x48, %l5
	swapa	[%l7 + %l5] 0x80,	%o1
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x3A, %i7
	ldsb	[%l7 + %i7],	%i1
	add	%o0,	%l4,	%o2
	ld	[%l7 + 0x70],	%f8
	nop
	set	0x18, %i4
	std	%f8,	[%l7 + %i4]
	nop
	set	0x2F, %i6
	ldstub	[%l7 + %i6],	%g3
	set	0x40, %l2
	stda	%i4,	[%l7 + %l2] 0x88
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%i6
	nop
	nop
	setx	0x4C7FFB3EAF884AE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x11537C6DEF0601E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f0,	%f6
	set	0x58, %l4
	stha	%g1,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x48, %o1
	stw	%i3,	[%l7 + %o1]
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x80,	%l3
	set	0x48, %l3
	ldxa	[%l7 + %l3] 0x80,	%g6
	set	0x24, %g7
	lda	[%l7 + %g7] 0x89,	%f5
	st	%f0,	[%l7 + 0x70]
	set	0x78, %i0
	stda	%o4,	[%l7 + %i0] 0x88
	and	%g5,	%g2,	%i2
	nop
	set	0x55, %i1
	ldstub	[%l7 + %i1],	%g7
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f0
	nop
	set	0x58, %g3
	ldx	[%l7 + %g3],	%o6
	nop
	set	0x68, %o5
	swap	[%l7 + %o5],	%i7
	set	0x6C, %o7
	sta	%f11,	[%l7 + %o7] 0x89
	set	0x18, %g4
	prefetcha	[%l7 + %g4] 0x88,	 1
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f12
	nop
	set	0x30, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x48, %i5
	stx	%o5,	[%l7 + %i5]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 1:
!
!	Type l   	: 1258
!	Type a   	: 23
!	Type cti   	: 24
!	Type x   	: 543
!	Type f   	: 35
!	Type i   	: 117
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
	set	0xE,	%g1
	set	0xE,	%g2
	set	0xD,	%g3
	set	0xA,	%g4
	set	0xC,	%g5
	set	0xC,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x9,	%i1
	set	-0x4,	%i2
	set	-0xD,	%i3
	set	-0x6,	%i4
	set	-0xC,	%i5
	set	-0xA,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x34F6DCD9,	%l0
	set	0x658E89FB,	%l1
	set	0x268737AE,	%l2
	set	0x2A42B06C,	%l3
	set	0x79DFE0D8,	%l4
	set	0x0068E569,	%l5
	set	0x5CC49C1A,	%l6
	!# Output registers
	set	-0x1DC8,	%o0
	set	-0x1997,	%o1
	set	0x0D2A,	%o2
	set	-0x127D,	%o3
	set	0x15B6,	%o4
	set	-0x166B,	%o5
	set	-0x00B2,	%o6
	set	-0x0307,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	set	0x78, %i3
	stxa	%l0,	[%l7 + %i3] 0x80
	or	%l1,	%l2,	%i5
	fpadd16	%f18,	%f6,	%f6
	nop
	set	0x2A, %l6
	ldstub	[%l7 + %l6],	%o7
	nop
	set	0x78, %o3
	swap	[%l7 + %o3],	%l5
	nop
	set	0x10, %g1
	std	%f18,	[%l7 + %g1]
	set	0x58, %o6
	stda	%i6,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x81,	%f0
	nop
	set	0x52, %o0
	sth	%o1,	[%l7 + %o0]
	nop
	set	0x18, %g2
	ldx	[%l7 + %g2],	%i1
	set	0x7C, %l0
	sta	%f23,	[%l7 + %l0] 0x89
	nop
	set	0x34, %l5
	stw	%o0,	[%l7 + %l5]
	set	0x70, %g5
	sta	%f22,	[%l7 + %g5] 0x89
	nop
	set	0x70, %i4
	std	%f6,	[%l7 + %i4]
	nop
	nop
	setx	0x997ADCE506AA7AD6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x38E35704E061932A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f6
	bleu,a,pn	%icc,	loop_50
	nop
	set	0x08, %i7
	stb	%i0,	[%l7 + %i7]
	nop
	set	0x60, %i6
	ldx	[%l7 + %i6],	%o2
	nop
	set	0x70, %l2
	stx	%l4,	[%l7 + %l2]
loop_50:
	nop
	set	0x50, %o1
	std	%g2,	[%l7 + %o1]
	st	%fsr,	[%l7 + 0x50]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i4
	st	%fsr,	[%l7 + 0x6C]
	set	0x10, %l1
	lda	[%l7 + %l1] 0x89,	%f7
	fpadd32s	%f10,	%f14,	%f20
	nop
	set	0x1E, %l3
	sth	%g1,	[%l7 + %l3]
	nop
	set	0x50, %l4
	lduw	[%l7 + %l4],	%i6
	nop
	set	0x7C, %g7
	lduw	[%l7 + %g7],	%l3
	nop
	set	0x48, %i0
	lduh	[%l7 + %i0],	%i3
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%g5
	set	0x58, %g3
	stxa	%i2,	[%l7 + %g3] 0x81
	set	0x70, %o2
	ldda	[%l7 + %o2] 0x89,	%g2
	set	0x49, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o6
	nop
	set	0x58, %g4
	lduw	[%l7 + %g4],	%i7
	ld	[%l7 + 0x78],	%f13
	nop
	set	0x0B, %o4
	ldub	[%l7 + %o4],	%g7
	nop
	set	0x14, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x2E, %o7
	lduh	[%l7 + %o7],	%o5
	nop
	set	0x38, %i3
	swap	[%l7 + %i3],	%l0
	ld	[%l7 + 0x14],	%f29
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%g4
	st	%f22,	[%l7 + 0x20]
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%l1
	nop
	set	0x40, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f0
	nop
	set	0x18, %g6
	std	%i4,	[%l7 + %g6]
	set	0x14, %o0
	swapa	[%l7 + %o0] 0x80,	%l2
	nop
	set	0x6A, %g2
	lduh	[%l7 + %g2],	%o7
	nop
	set	0x60, %l0
	lduw	[%l7 + %l0],	%l6
	nop
	set	0x4C, %l5
	ldsh	[%l7 + %l5],	%l5
	set	0x40, %o6
	sta	%f19,	[%l7 + %o6] 0x81
	set	0x58, %i4
	stda	%o0,	[%l7 + %i4] 0x89
	wr	%i1,	%i0,	%y
	or	%o2,	%o0,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%o3
	set	0x60, %i7
	sta	%f30,	[%l7 + %i7] 0x81
	set	0x20, %i6
	swapa	[%l7 + %i6] 0x81,	%g1
	ld	[%l7 + 0x7C],	%f15
	set	0x38, %l2
	swapa	[%l7 + %l2] 0x89,	%i6
	ld	[%l7 + 0x78],	%f6
	set	0x38, %o1
	stxa	%i4,	[%l7 + %o1] 0x80
	set	0x30, %g5
	stwa	%i3,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x40, %l3
	swapa	[%l7 + %l3] 0x80,	%o4
	set	0x3C, %l1
	lda	[%l7 + %l1] 0x81,	%f9
	nop
	set	0x60, %g7
	prefetch	[%l7 + %g7],	 3
	set	0x42, %i0
	stba	%g6,	[%l7 + %i0] 0x88
	st	%f13,	[%l7 + 0x20]
	st	%f29,	[%l7 + 0x68]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f0
	set	0x74, %i1
	sta	%f26,	[%l7 + %i1] 0x81
	set	0x08, %g3
	sta	%f19,	[%l7 + %g3] 0x89
	set	0x08, %o2
	lda	[%l7 + %o2] 0x80,	%f27
	nop
	set	0x74, %o5
	sth	%l3,	[%l7 + %o5]
	set	0x70, %o4
	stwa	%g5,	[%l7 + %o4] 0x80
	fpsub32s	%f31,	%f8,	%f26
	set	0x20, %i2
	ldxa	[%l7 + %i2] 0x80,	%i2
	nop
	set	0x2A, %o7
	lduh	[%l7 + %o7],	%g2
	fpadd32	%f0,	%f16,	%f30
	or	%o6,	%g7,	%o5
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x80,	%l0
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x81,	 2
	nop
	set	0x3C, %i5
	ldsh	[%l7 + %i5],	%i7
	ld	[%l7 + 0x74],	%f31
	add	%i5,	%l1,	%o7
	nop
	set	0x2A, %l6
	ldstub	[%l7 + %l6],	%l6
	set	0x24, %g1
	lda	[%l7 + %g1] 0x89,	%f19
	nop
	set	0x28, %o3
	ldsw	[%l7 + %o3],	%l2
	bg,a	%xcc,	loop_51
	ld	[%l7 + 0x54],	%f20
	nop
	set	0x54, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x18, %o0
	std	%f4,	[%l7 + %o0]
loop_51:
	nop
	set	0x50, %g2
	stxa	%o1,	[%l7 + %g2] 0xe3
	membar	#Sync
	nop
	set	0x50, %l0
	stx	%l5,	[%l7 + %l0]
	nop
	set	0x1C, %l5
	swap	[%l7 + %l5],	%i1
	set	0x60, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	bne	%icc,	loop_52
	nop
	set	0x70, %i7
	ldx	[%l7 + %i7],	%i0
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 4
	nop
	set	0x10, %l2
	std	%f10,	[%l7 + %l2]
loop_52:
	nop
	set	0x28, %o1
	std	%f28,	[%l7 + %o1]
	or	%o0,	%l4,	%o3
	set	0x66, %o6
	stha	%g1,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x4C, %g5
	stb	%g3,	[%l7 + %g5]
	nop
	set	0x30, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%f8
	set	0x48, %l3
	swapa	[%l7 + %l3] 0x81,	%i4
	nop
	set	0x78, %i0
	std	%f22,	[%l7 + %i0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x78, %l4
	stx	%g6,	[%l7 + %l4]
	nop
	set	0x58, %i1
	stx	%l3,	[%l7 + %i1]
	set	0x40, %o2
	stda	%o4,	[%l7 + %o2] 0x80
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%g4
	ld	[%l7 + 0x18],	%f23
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x80,	 3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f0
	and	%i2,	%g7,	%o6
	nop
	nop
	setx	0x6E015A0325EE000C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x38BC7862FC5DFD90,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f4,	%f26
	nop
	set	0x24, %g4
	sth	%l0,	[%l7 + %g4]
	set	0x71, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g4
	nop
	set	0x34, %i3
	stb	%i7,	[%l7 + %i3]
	nop
	set	0x12, %i5
	sth	%o5,	[%l7 + %i5]
	set	0x08, %l6
	ldstuba	[%l7 + %l6] 0x89,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i5
	nop
	set	0x26, %o3
	ldsh	[%l7 + %o3],	%l6
	nop
	set	0x26, %g6
	sth	%o1,	[%l7 + %g6]
	st	%f20,	[%l7 + 0x1C]
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l2,	%l5
	nop
	set	0x08, %o0
	std	%o2,	[%l7 + %o0]
	set	0x22, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i0
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%o0
	nop
	set	0x58, %g2
	ldsw	[%l7 + %g2],	%i1
	nop
	set	0x38, %l5
	swap	[%l7 + %l5],	%o3
	nop
	set	0x7C, %i4
	ldstub	[%l7 + %i4],	%g1
	nop
	set	0x20, %i6
	ldsw	[%l7 + %i6],	%g3
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%i4
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%i6
	set	0x08, %o1
	stxa	%l4,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x28, %g5
	stx	%i3,	[%l7 + %g5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%l3
	nop
	set	0x38, %o6
	stx	%g5,	[%l7 + %o6]
	bl,a	%icc,	loop_53
	add	%g2,	%o4,	%i2
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f16
loop_53:
	nop
	set	0x70, %g7
	stw	%o6,	[%l7 + %g7]
	set	0x7C, %l3
	lda	[%l7 + %l3] 0x80,	%f30
	nop
	set	0x18, %i0
	ldd	[%l7 + %i0],	%g6
	and	%g4,	%l0,	%o5
	nop
	set	0x30, %l4
	stx	%fsr,	[%l7 + %l4]
	set	0x60, %i1
	stha	%i7,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x50, %o2
	ldsh	[%l7 + %o2],	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i5,	%l6
	nop
	set	0x10, %g3
	lduh	[%l7 + %g3],	%o1
	and	%l2,	%l1,	%l5
	st	%f28,	[%l7 + 0x70]
	fpadd16	%f4,	%f0,	%f4
	bne,a	%icc,	loop_54
	nop
	set	0x57, %o4
	ldsb	[%l7 + %o4],	%o2
	set	0x08, %i2
	stxa	%o0,	[%l7 + %i2] 0x89
loop_54:
	nop
	set	0x4C, %o5
	ldsb	[%l7 + %o5],	%i0
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%i0
	fpsub16s	%f0,	%f7,	%f16
	nop
	set	0x1C, %i3
	ldsw	[%l7 + %i3],	%g1
	nop
	set	0x78, %g4
	prefetch	[%l7 + %g4],	 1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f16
	set	0x38, %o3
	swapa	[%l7 + %o3] 0x88,	%g3
	and	%o3,	%i4,	%i6
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
	nop
	set	0x08, %o0
	std	%i2,	[%l7 + %o0]
	ld	[%l7 + 0x1C],	%f30
	nop
	set	0x5A, %g1
	lduh	[%l7 + %g1],	%l4
	st	%f29,	[%l7 + 0x68]
	nop
	set	0x78, %l0
	stb	%l3,	[%l7 + %l0]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g5
	add	%o4,	%i2,	%o6
	nop
	set	0x40, %g2
	ldsw	[%l7 + %g2],	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%l0
	nop
	set	0x15, %l5
	ldstub	[%l7 + %l5],	%o5
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x88,	%g4
	nop
	set	0x4C, %i6
	lduw	[%l7 + %i6],	%o7
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l6
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f28
	wr	%i5,	%o1,	%ccr
	nop
	set	0x50, %l2
	swap	[%l7 + %l2],	%l1
	set	0x37, %o1
	stba	%l2,	[%l7 + %o1] 0x80
	nop
	set	0x66, %g5
	lduh	[%l7 + %g5],	%o2
	and	%l5,	%o0,	%i0
	nop
	set	0x38, %i4
	prefetch	[%l7 + %i4],	 4
	nop
	set	0x60, %l1
	stx	%i1,	[%l7 + %l1]
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%g2
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f0
	set	0x26, %g7
	stha	%o3,	[%l7 + %g7] 0xe3
	membar	#Sync
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f16
	nop
	set	0x2B, %i0
	ldsb	[%l7 + %i0],	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%i4
	set	0x58, %i1
	prefetcha	[%l7 + %i1] 0x89,	 4
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%i3
	nop
	set	0x30, %g3
	ldx	[%l7 + %g3],	%g6
	set	0x27, %i2
	stba	%g5,	[%l7 + %i2] 0xea
	membar	#Sync
	and	%o4,	%l3,	%i2
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f4
	nop
	set	0x18, %o5
	std	%g6,	[%l7 + %o5]
	ld	[%l7 + 0x68],	%f25
	nop
	set	0x39, %o7
	ldsb	[%l7 + %o7],	%o6
	nop
	set	0x46, %i3
	ldub	[%l7 + %i3],	%g2
	nop
	set	0x3A, %i5
	stb	%o5,	[%l7 + %i5]
	nop
	set	0x6C, %o3
	stw	%l0,	[%l7 + %o3]
	set	0x40, %g6
	stxa	%g4,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%o7,	%i7,	%i5
	nop
	set	0x1C, %g4
	stw	%o1,	[%l7 + %g4]
	nop
	set	0x0C, %o0
	lduw	[%l7 + %o0],	%l6
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x78, %g2
	stxa	%l1,	[%l7 + %g2] 0x88
	ld	[%l7 + 0x38],	%f0
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x3E, %l6
	stha	%o2,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f16
	set	0x44, %i7
	sta	%f28,	[%l7 + %i7] 0x89
	set	0x0C, %l5
	lda	[%l7 + %l5] 0x88,	%f1
	nop
	set	0x18, %o1
	stx	%fsr,	[%l7 + %o1]
	set	0x51, %l2
	stba	%l2,	[%l7 + %l2] 0xea
	membar	#Sync
	st	%f26,	[%l7 + 0x7C]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	set	0x70, %l1
	stwa	%l5,	[%l7 + %l1] 0xeb
	membar	#Sync
	st	%f8,	[%l7 + 0x6C]
	and	%i0,	%i1,	%o0
	nop
	set	0x40, %o6
	stx	%o3,	[%l7 + %o6]
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%f10
	set	0x10, %i4
	ldxa	[%l7 + %i4] 0x80,	%g1
	and	%i6,	%i4,	%g3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x80,	%l4,	%i3
	nop
	set	0x5C, %g7
	ldsh	[%l7 + %g7],	%g6
	ld	[%l7 + 0x1C],	%f10
	ld	[%l7 + 0x08],	%f27
	set	0x4C, %l4
	lda	[%l7 + %l4] 0x80,	%f12
	set	0x68, %i0
	stxa	%g5,	[%l7 + %i0] 0x80
	nop
	set	0x18, %o2
	swap	[%l7 + %o2],	%o4
	set	0x10, %i1
	stxa	%i2,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x70, %i2
	ldsh	[%l7 + %i2],	%l3
	ld	[%l7 + 0x18],	%f17
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%o6
	nop
	set	0x51, %o4
	ldstub	[%l7 + %o4],	%o5
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	nop
	set	0x1C, %o7
	lduh	[%l7 + %o7],	%l0
	nop
	set	0x26, %g3
	sth	%g2,	[%l7 + %g3]
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%g4
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%i7
	set	0x18, %o3
	stda	%i4,	[%l7 + %o3] 0x80
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%l6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd2
	set	0x5C, %g4
	swapa	[%l7 + %g4] 0x88,	%o1
	nop
	set	0x58, %o0
	ldub	[%l7 + %o0],	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l1,	%l5
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x88,	 2
	nop
	set	0x47, %g1
	stb	%i1,	[%l7 + %g1]
	nop
	set	0x34, %l6
	ldsw	[%l7 + %l6],	%l2
	set	0x63, %l0
	ldstuba	[%l7 + %l0] 0x81,	%o0
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x88,	 2
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x88
	set	0x34, %o1
	lda	[%l7 + %o1] 0x80,	%f2
	nop
	set	0x08, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%i6
	nop
	set	0x18, %l2
	stw	%g1,	[%l7 + %l2]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
	nop
	set	0x1F, %o6
	ldsb	[%l7 + %o6],	%i4
	set	0x12, %l3
	stba	%g3,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xD90, 	%tick_cmpr
	nop
	set	0x14, %g7
	stb	%g5,	[%l7 + %g7]
	or	%i3,	%i2,	%l3
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x81,	%g7
	set	0x2C, %o2
	lda	[%l7 + %o2] 0x88,	%f22
	set	0x54, %l4
	swapa	[%l7 + %l4] 0x80,	%o6
	or	%o5,	%o4,	%l0
	set	0x58, %i1
	stxa	%g2,	[%l7 + %i1] 0x88
	add	%g4,	%i5,	%i7
	nop
	set	0x19, %i2
	ldstub	[%l7 + %i2],	%o7
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x81,	%o1
	nop
	set	0x67, %o4
	ldsb	[%l7 + %o4],	%l6
	set	0x38, %g3
	lda	[%l7 + %g3] 0x88,	%f18
	add	%o2,	%l5,	%i0
	nop
	set	0x0B, %i3
	ldstub	[%l7 + %i3],	%l1
	nop
	set	0x28, %o7
	sth	%i1,	[%l7 + %o7]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xea,	%l2
	nop
	set	0x24, %g6
	sth	%o0,	[%l7 + %g6]
	nop
	set	0x6E, %g4
	sth	%i6,	[%l7 + %g4]
	nop
	nop
	setx	0xD79E0B91AA472677,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x9370B0B0AD43BF9D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f22,	%f26
	st	%f2,	[%l7 + 0x4C]
	and	%o3,	%g1,	%i4
	nop
	set	0x08, %i5
	std	%l4,	[%l7 + %i5]
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc8
	nop
	set	0x6C, %g2
	lduh	[%l7 + %g2],	%g3
	wr 	%g0, 	0x4, 	%fprs
	nop
	set	0x20, %g1
	swap	[%l7 + %g1],	%g5
	or	%i2,	%g7,	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%o4
	nop
	set	0x28, %l6
	ldub	[%l7 + %l6],	%l0
	and	%o5,	%g4,	%g2
	nop
	set	0x0C, %l0
	ldsw	[%l7 + %l0],	%i5
	set	0x78, %l5
	stwa	%o7,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x1C, %o1
	stw	%i7,	[%l7 + %o1]
	nop
	set	0x52, %i7
	ldstub	[%l7 + %i7],	%l6
	set	0x0C, %i6
	sta	%f20,	[%l7 + %i6] 0x88
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%o1
	ld	[%l7 + 0x30],	%f18
	set	0x68, %g5
	stxa	%l5,	[%l7 + %g5] 0x80
	nop
	set	0x4A, %l2
	ldsh	[%l7 + %l2],	%l1
	nop
	set	0x18, %l1
	std	%f8,	[%l7 + %l1]
	set	0x74, %o6
	stwa	%i0,	[%l7 + %o6] 0xea
	membar	#Sync
	nop
	set	0x30, %l3
	prefetch	[%l7 + %l3],	 3
	nop
	set	0x48, %i4
	stx	%fsr,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x30]
	fpsub16s	%f31,	%f25,	%f10
	set	0x7C, %g7
	swapa	[%l7 + %g7] 0x80,	%l2
	ld	[%l7 + 0x10],	%f6
	st	%fsr,	[%l7 + 0x6C]
	fpsub16s	%f27,	%f20,	%f18
	set	0x3D, %i0
	stba	%o0,	[%l7 + %i0] 0xe2
	membar	#Sync
	or	%i1,	%i6,	%g1
	nop
	set	0x20, %o2
	stx	%o3,	[%l7 + %o2]
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%i4
	set	0x48, %i1
	ldstuba	[%l7 + %i1] 0x88,	%g3
	nop
	set	0x58, %i2
	std	%f6,	[%l7 + %i2]
	and	%l4,	%g6,	%i3
	nop
	set	0x25, %o4
	ldsb	[%l7 + %o4],	%i2
	set	0x52, %o5
	ldstuba	[%l7 + %o5] 0x81,	%g7
	set	0x24, %g3
	stha	%g5,	[%l7 + %g3] 0x88
	set	0x68, %i3
	stxa	%l3,	[%l7 + %i3] 0x81
	nop
	set	0x08, %o7
	swap	[%l7 + %o7],	%o4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g4
	nop
	set	0x28, %g6
	std	%g2,	[%l7 + %g6]
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x88,	 4
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xea,	%o6
	nop
	set	0x7C, %o0
	stw	%l6,	[%l7 + %o0]
	fpsub16s	%f18,	%f28,	%f29
	set	0x7E, %g4
	stba	%i7,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x5C, %g2
	stba	%o2,	[%l7 + %g2] 0x80
	nop
	set	0x71, %g1
	ldub	[%l7 + %g1],	%l5
	st	%fsr,	[%l7 + 0x70]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%l1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd0,	%f16
	fpadd16s	%f22,	%f13,	%f9
	nop
	set	0x36, %l0
	ldsh	[%l7 + %l0],	%i0
	and	%l2,	%i1,	%o0
	set	0x18, %l5
	stda	%i6,	[%l7 + %l5] 0x88
	set	0x68, %i7
	stxa	%o3,	[%l7 + %i7] 0x88
	nop
	set	0x58, %o1
	stx	%fsr,	[%l7 + %o1]
	ld	[%l7 + 0x6C],	%f24
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f2
	nop
	set	0x6C, %l2
	swap	[%l7 + %l2],	%i4
	set	0x27, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g1
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x14, %g5
	ldsw	[%l7 + %g5],	%l4
	nop
	set	0x2E, %l3
	sth	%g3,	[%l7 + %l3]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xc0
	nop
	set	0x2C, %g7
	stw	%g6,	[%l7 + %g7]
	set	0x08, %i0
	ldxa	[%l7 + %i0] 0x81,	%i3
	nop
	set	0x1C, %o2
	swap	[%l7 + %o2],	%i2
	set	0x48, %i4
	stxa	%g5,	[%l7 + %i4] 0xea
	membar	#Sync
	fpsub32s	%f7,	%f15,	%f4
	nop
	set	0x58, %l4
	std	%f26,	[%l7 + %l4]
	set	0x7C, %i1
	stwa	%g7,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xe2,	%o4
	nop
	set	0x3A, %o4
	lduh	[%l7 + %o4],	%l0
	ld	[%l7 + 0x08],	%f25
	set	0x18, %o5
	prefetcha	[%l7 + %o5] 0x88,	 1
	set	0x0C, %i3
	lda	[%l7 + %i3] 0x80,	%f28
	set	0x2F, %o7
	stba	%o5,	[%l7 + %o7] 0x81
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	set	0x0B, %o3
	ldstuba	[%l7 + %o3] 0x80,	%g2
	set	0x7A, %i5
	stha	%i5,	[%l7 + %i5] 0x81
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc4
	ld	[%l7 + 0x08],	%f8
	st	%f28,	[%l7 + 0x28]
	set	0x60, %g6
	ldda	[%l7 + %g6] 0xeb,	%l2
	set	0x36, %g4
	stha	%l6,	[%l7 + %g4] 0x80
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x0C, %g2
	lduh	[%l7 + %g2],	%o7
	add	%i7,	%o2,	%o1
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xeb,	%l0
	nop
	set	0x78, %l6
	lduw	[%l7 + %l6],	%i0
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x80,	 4
	nop
	set	0x68, %o1
	swap	[%l7 + %o1],	%i1
	set	0x40, %i7
	lda	[%l7 + %i7] 0x80,	%f25
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc8
	nop
	set	0x64, %l1
	stb	%l2,	[%l7 + %l1]
	nop
	set	0x46, %l2
	ldsh	[%l7 + %l2],	%o0
	nop
	set	0x30, %g5
	std	%f26,	[%l7 + %g5]
	nop
	set	0x08, %l3
	ldsw	[%l7 + %l3],	%i6
	nop
	set	0x3C, %g7
	sth	%i4,	[%l7 + %g7]
	set	0x70, %i0
	lda	[%l7 + %i0] 0x88,	%f13
	bl	%xcc,	loop_55
	fpadd32s	%f30,	%f21,	%f8
	nop
	set	0x0F, %o2
	ldsb	[%l7 + %o2],	%g1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%g3
loop_55:
	nop
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x88,	%o2
	ld	[%l7 + 0x0C],	%f27
	set	0x50, %o6
	sta	%f23,	[%l7 + %o6] 0x88
	or	%i3,	%i2,	%g6
	wr	%g7,	%g5,	%clear_softint
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%l0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x81,	%o4,	%o5
	and	%g4,	%o6,	%i5
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x20, %i2
	ldx	[%l7 + %i2],	%g2
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%l2
	bn,a,pn	%xcc,	loop_56
	bne,a	%xcc,	loop_57
	st	%f10,	[%l7 + 0x50]
	st	%fsr,	[%l7 + 0x5C]
loop_56:
	st	%fsr,	[%l7 + 0x1C]
loop_57:
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%l6
	nop
	set	0x38, %i1
	stx	%o7,	[%l7 + %i1]
	set	0x14, %i3
	sta	%f9,	[%l7 + %i3] 0x81
	nop
	set	0x4C, %g3
	ldsw	[%l7 + %g3],	%i7
	wr	%o2,	%o1,	%pic
	nop
	set	0x5A, %o3
	ldsb	[%l7 + %o3],	%i0
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%l5
	set	0x08, %o7
	stha	%l1,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x81,	%f28
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i0
	bne,a,pn	%xcc,	loop_58
	nop
	set	0x48, %g4
	std	%l2,	[%l7 + %g4]
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x50, %l0
	sta	%f28,	[%l7 + %l0] 0x80
loop_58:
	nop
	set	0x64, %l6
	stwa	%o0,	[%l7 + %l6] 0x80
	set	0x10, %l5
	swapa	[%l7 + %l5] 0x80,	%i4
	be,a,pn	%icc,	loop_59
	nop
	set	0x28, %o1
	swap	[%l7 + %o1],	%g1
	nop
	set	0x52, %i7
	lduh	[%l7 + %i7],	%i6
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
loop_59:
	nop
	set	0x50, %l1
	std	%f16,	[%l7 + %l1]
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%f0
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%g3
	set	0x08, %g1
	stda	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf9
	membar	#Sync
	nop
	set	0x54, %i0
	prefetch	[%l7 + %i0],	 2
	set	0x4A, %l3
	stha	%l4,	[%l7 + %l3] 0x81
	add	%i3,	%g6,	%g7
	nop
	set	0x45, %o2
	ldsb	[%l7 + %o2],	%g5
	wr	%l0,	%i2,	%clear_softint
	nop
	set	0x4E, %o6
	ldstub	[%l7 + %o6],	%o4
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%g4
	nop
	set	0x0C, %l4
	stw	%o6,	[%l7 + %l4]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf8
	membar	#Sync
	set	0x1C, %o5
	stwa	%o5,	[%l7 + %o5] 0xe2
	membar	#Sync
	ld	[%l7 + 0x74],	%f8
	nop
	set	0x5E, %i2
	stb	%g2,	[%l7 + %i2]
	fpsub16s	%f16,	%f22,	%f3
	st	%f31,	[%l7 + 0x14]
	set	0x74, %i1
	sta	%f4,	[%l7 + %i1] 0x88
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	nop
	set	0x3C, %o3
	ldsh	[%l7 + %o3],	%l6
	nop
	set	0x70, %i3
	ldd	[%l7 + %i3],	%f18
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x89,	 3
	nop
	set	0x78, %o0
	std	%i6,	[%l7 + %o0]
	nop
	set	0x08, %g6
	lduw	[%l7 + %g6],	%o2
	nop
	set	0x14, %g4
	stw	%i5,	[%l7 + %g4]
	fpsub16s	%f12,	%f21,	%f2
	set	0x50, %i5
	ldda	[%l7 + %i5] 0xe2,	%o0
	set	0x20, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i0
	set	0x4C, %l0
	swapa	[%l7 + %l0] 0x88,	%l5
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f12
	set	0x1C, %o1
	lda	[%l7 + %o1] 0x89,	%f13
	set	0x4C, %l5
	stwa	%l1,	[%l7 + %l5] 0x80
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%l2
	nop
	set	0x30, %i7
	std	%f26,	[%l7 + %i7]
	ld	[%l7 + 0x40],	%f12
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%o0
	nop
	set	0x32, %l1
	ldub	[%l7 + %l1],	%i4
	nop
	set	0x70, %g5
	std	%f2,	[%l7 + %g5]
	set	0x3E, %g1
	stha	%g1,	[%l7 + %g1] 0x80
	set	0x78, %l2
	stxa	%i6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x26, %i0
	ldsh	[%l7 + %i0],	%o3
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x80,	 2
	set	0x34, %o2
	lda	[%l7 + %o2] 0x88,	%f20
	ld	[%l7 + 0x38],	%f11
	nop
	set	0x5E, %l3
	lduh	[%l7 + %l3],	%i3
	or	%l4,	%g7,	%g5
	set	0x54, %o6
	stwa	%g6,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x7E, %l4
	sth	%i2,	[%l7 + %l4]
	nop
	nop
	setx	0xF15DFAB8E2E05FD3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC79FB95ECC27D319,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f18
	nop
	set	0x1A, %i4
	ldsh	[%l7 + %i4],	%o4
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%l0
	set	0x0C, %o5
	sta	%f12,	[%l7 + %o5] 0x89
	set	0x51, %i1
	stba	%g4,	[%l7 + %i1] 0x89
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f10
	set	0x50, %g3
	ldda	[%l7 + %g3] 0xea,	%o6
	set	0x58, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0
	nop
	set	0x58, %o7
	ldx	[%l7 + %o7],	%l3
	nop
	set	0x60, %o0
	ldx	[%l7 + %o0],	%l6
	set	0x6D, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o7
	nop
	set	0x4A, %g4
	sth	%o5,	[%l7 + %g4]
	nop
	set	0x74, %g6
	lduh	[%l7 + %g6],	%o2
	set	0x15, %g2
	stba	%i7,	[%l7 + %g2] 0xea
	membar	#Sync
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f16
	nop
	set	0x3C, %i5
	ldsw	[%l7 + %i5],	%i5
	nop
	set	0x7D, %o1
	ldsb	[%l7 + %o1],	%o1
	set	0x68, %l6
	lda	[%l7 + %l6] 0x80,	%f18
	set	0x50, %i7
	stxa	%i0,	[%l7 + %i7] 0x81
	or	%l1,	%l5,	%l2
	nop
	set	0x25, %l5
	ldstub	[%l7 + %l5],	%o0
	st	%f20,	[%l7 + 0x68]
	nop
	set	0x64, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xc4
	set	0x30, %g1
	stda	%i4,	[%l7 + %g1] 0x81
	set	0x30, %g5
	ldda	[%l7 + %g5] 0xeb,	%i0
	nop
	set	0x76, %l2
	lduh	[%l7 + %l2],	%g1
	nop
	set	0x50, %g7
	std	%f30,	[%l7 + %g7]
	set	0x34, %i0
	stha	%i6,	[%l7 + %i0] 0xe3
	membar	#Sync
	bge,a	%icc,	loop_60
	wr	%o3,	%g3,	%ccr
	nop
	set	0x10, %l3
	ldsb	[%l7 + %l3],	%i3
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x88,	%l4
loop_60:
	nop
	set	0x28, %l4
	std	%g6,	[%l7 + %l4]
	nop
	set	0x7A, %o2
	lduh	[%l7 + %o2],	%g5
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x28, %i4
	lduw	[%l7 + %i4],	%i2
	st	%fsr,	[%l7 + 0x64]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x64, %o5
	lduh	[%l7 + %o5],	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%l0
	nop
	set	0x7F, %o4
	stb	%g4,	[%l7 + %o4]
	nop
	set	0x7A, %i2
	ldsh	[%l7 + %i2],	%o6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	nop
	set	0x3C, %o3
	ldsw	[%l7 + %o3],	%g2
	set	0x59, %i1
	stba	%l6,	[%l7 + %i1] 0x81
	nop
	set	0x50, %o0
	ldsh	[%l7 + %o0],	%l3
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf1
	membar	#Sync
	set	0x60, %i3
	stha	%o7,	[%l7 + %i3] 0x80
	set	0x38, %g6
	stxa	%o2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%i7
	set	0x51, %g2
	ldstuba	[%l7 + %g2] 0x81,	%i5
	nop
	set	0x68, %i5
	std	%o4,	[%l7 + %i5]
	set	0x0A, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i0
	nop
	set	0x7F, %l0
	ldsb	[%l7 + %l0],	%o1
	set	0x7C, %l6
	sta	%f22,	[%l7 + %l6] 0x81
	fpsub32	%f24,	%f26,	%f22
	nop
	set	0x56, %i7
	ldstub	[%l7 + %i7],	%l1
	nop
	set	0x34, %l5
	ldsw	[%l7 + %l5],	%l2
	nop
	set	0x68, %i6
	stx	%l5,	[%l7 + %i6]
	nop
	set	0x50, %l1
	stx	%o0,	[%l7 + %l1]
	nop
	set	0x78, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f26
	set	0x68, %l2
	sta	%f14,	[%l7 + %l2] 0x89
	st	%fsr,	[%l7 + 0x50]
	or	%i4,	%i1,	%i6
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f30
	bn,a,pt	%icc,	loop_61
	nop
	set	0x14, %g7
	sth	%o3,	[%l7 + %g7]
	nop
	set	0x4E, %o6
	stb	%g3,	[%l7 + %o6]
	fpadd32	%f20,	%f22,	%f6
loop_61:
	nop
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0
	st	%f27,	[%l7 + 0x2C]
	set	0x68, %l4
	sta	%f0,	[%l7 + %l4] 0x88
	nop
	set	0x38, %o2
	lduw	[%l7 + %o2],	%l4
	wr	%i3,	%g7,	%ccr
	nop
	set	0x40, %o5
	stx	%i2,	[%l7 + %o5]
	nop
	set	0x30, %i4
	lduw	[%l7 + %i4],	%g5
	wr	%g6,	%o4,	%clear_softint
	or	%g4,	%o6,	%l0
	ld	[%l7 + 0x08],	%f12
	nop
	set	0x18, %i2
	std	%f10,	[%l7 + %i2]
	nop
	set	0x38, %o4
	std	%f18,	[%l7 + %o4]
	set	0x08, %o3
	stha	%g2,	[%l7 + %o3] 0xea
	membar	#Sync
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x89,	 1
	set	0x78, %g3
	stxa	%l6,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x7E, %o7
	lduh	[%l7 + %o7],	%o2
	nop
	set	0x30, %i3
	std	%i6,	[%l7 + %i3]
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x89,	 3
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f22
	nop
	set	0x46, %g4
	lduh	[%l7 + %g4],	%o5
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf8
	membar	#Sync
	nop
	set	0x65, %g2
	ldsb	[%l7 + %g2],	%i5
	nop
	set	0x2E, %o1
	ldub	[%l7 + %o1],	%i0
	set	0x50, %l0
	prefetcha	[%l7 + %l0] 0x80,	 4
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x7D, %i7
	ldub	[%l7 + %i7],	%l1
	nop
	set	0x70, %l5
	stx	%l5,	[%l7 + %l5]
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%o0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f16
	add	%l7,	0x64,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%i4
	nop
	set	0x40, %g5
	ldx	[%l7 + %g5],	%i1
	nop
	set	0x3A, %l1
	sth	%i6,	[%l7 + %l1]
	nop
	set	0x74, %g1
	ldsw	[%l7 + %g1],	%o3
	set	0x60, %l2
	prefetcha	[%l7 + %l2] 0x80,	 1
	nop
	set	0x0C, %i0
	swap	[%l7 + %i0],	%g1
	set	0x7C, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l4
	set	0x0E, %g7
	stha	%i3,	[%l7 + %g7] 0x89
	or	%g7,	%i2,	%g5
	nop
	set	0x38, %l4
	std	%o4,	[%l7 + %l4]
	nop
	set	0x54, %o2
	ldsw	[%l7 + %o2],	%g4
	or	%g6,	%l0,	%g2
	set	0x18, %o5
	stha	%o6,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x58, %i4
	stda	%i6,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x38, %i2
	lduw	[%l7 + %i2],	%o2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xd8
	nop
	set	0x08, %o4
	std	%f18,	[%l7 + %o4]
	nop
	set	0x50, %o3
	lduh	[%l7 + %o3],	%l3
	set	0x1C, %g3
	sta	%f26,	[%l7 + %g3] 0x89
	nop
	set	0x38, %i1
	std	%o6,	[%l7 + %i1]
	set	0x08, %o7
	prefetcha	[%l7 + %o7] 0x88,	 2
	st	%fsr,	[%l7 + 0x4C]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%o5
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i0
	nop
	set	0x18, %o0
	std	%f28,	[%l7 + %o0]
	and	%o1,	%l1,	%o0
	nop
	set	0x31, %g4
	stb	%l2,	[%l7 + %g4]
	set	0x08, %i5
	stwa	%l5,	[%l7 + %i5] 0x81
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	nop
	set	0x10, %g6
	stx	%i6,	[%l7 + %g6]
	nop
	set	0x68, %o1
	std	%i4,	[%l7 + %o1]
	nop
	set	0x64, %i7
	ldub	[%l7 + %i7],	%o3
	ld	[%l7 + 0x34],	%f20
	fpsub16	%f4,	%f14,	%f2
	st	%fsr,	[%l7 + 0x58]
	wr	%g3,	%l4,	%sys_tick
	set	0x38, %l0
	sta	%f3,	[%l7 + %l0] 0x80
	nop
	set	0x78, %l5
	std	%f8,	[%l7 + %l5]
	nop
	set	0x30, %i6
	std	%f8,	[%l7 + %i6]
	set	0x18, %l6
	stda	%g0,	[%l7 + %l6] 0x81
	fpadd16	%f20,	%f18,	%f24
	nop
	set	0x7F, %l1
	ldub	[%l7 + %l1],	%g7
	nop
	set	0x58, %g1
	lduw	[%l7 + %g1],	%i2
	nop
	set	0x44, %g5
	ldsb	[%l7 + %g5],	%g5
	set	0x30, %l2
	lda	[%l7 + %l2] 0x88,	%f27
	add	%o4,	%g4,	%g6
	set	0x7E, %i0
	stha	%l0,	[%l7 + %i0] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	nop
	set	0x78, %l4
	std	%f26,	[%l7 + %l4]
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%i3
	add	%g2,	%l6,	%o2
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x81,	%f16
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x80,	%l3
	nop
	set	0x74, %i2
	stw	%o6,	[%l7 + %i2]
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x89,	%o7
	nop
	set	0x0A, %o4
	ldsh	[%l7 + %o4],	%i5
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%o5
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%f2
	st	%f3,	[%l7 + 0x24]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i7
	nop
	set	0x18, %o3
	std	%f28,	[%l7 + %o3]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o1
	nop
	set	0x58, %i1
	std	%f2,	[%l7 + %i1]
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%o0
	and	%l2,	%i1,	%l5
	nop
	set	0x2A, %o0
	ldsh	[%l7 + %o0],	%i4
	set	0x70, %i3
	stha	%i6,	[%l7 + %i3] 0xeb
	membar	#Sync
	add	%o3,	%l4,	%g3
	add	%g7,	%i2,	%g1
	nop
	set	0x75, %i5
	ldstub	[%l7 + %i5],	%g5
	nop
	set	0x58, %g2
	stx	%g4,	[%l7 + %g2]
	set	0x0C, %g4
	stwa	%g6,	[%l7 + %g4] 0x89
	fpsub32s	%f23,	%f13,	%f14
	set	0x74, %o1
	stba	%l0,	[%l7 + %o1] 0xe3
	membar	#Sync
	set	0x74, %i7
	sta	%f21,	[%l7 + %i7] 0x80
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%i3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd0,	%f0
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x89,	%o4
	set	0x6C, %i6
	lda	[%l7 + %i6] 0x88,	%f29
	st	%fsr,	[%l7 + 0x08]
	set	0x64, %l6
	stwa	%l6,	[%l7 + %l6] 0x88
	set	0x64, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g2
	set	0x20, %l1
	swapa	[%l7 + %l1] 0x89,	%l3
	st	%f21,	[%l7 + 0x10]
	nop
	set	0x37, %g5
	stb	%o6,	[%l7 + %g5]
	nop
	set	0x1A, %l2
	ldsh	[%l7 + %l2],	%o2
	nop
	set	0x30, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x58, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x26, %l4
	lduh	[%l7 + %l4],	%i5
	set	0x44, %g7
	stha	%i0,	[%l7 + %g7] 0xe2
	membar	#Sync
	wr	%i7,	%o5,	%y
	and	%o1,	%o0,	%l2
	nop
	set	0x60, %o5
	std	%i0,	[%l7 + %o5]
	nop
	nop
	setx	0x5C10D5F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x12169142,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f31,	%f19
	set	0x48, %o2
	stwa	%l1,	[%l7 + %o2] 0x80
	nop
	set	0x10, %l3
	ldx	[%l7 + %l3],	%i4
	set	0x6D, %i2
	ldstuba	[%l7 + %i2] 0x89,	%i6
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
	nop
	set	0x66, %o4
	ldsb	[%l7 + %o4],	%l5
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%g2
	nop
	set	0x2A, %o3
	ldsb	[%l7 + %o3],	%g7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f18
	set	0x70, %o0
	lda	[%l7 + %o0] 0x80,	%f15
	set	0x20, %i5
	ldda	[%l7 + %i5] 0xea,	%i2
	nop
	set	0x18, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%g0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xd8,	%f16
	ld	[%l7 + 0x78],	%f12
	nop
	set	0x08, %i7
	stx	%g5,	[%l7 + %i7]
	nop
	set	0x7E, %g6
	sth	%l4,	[%l7 + %g6]
	set	0x30, %g4
	stda	%g4,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x58, %l5
	stda	%g6,	[%l7 + %l5] 0xe3
	membar	#Sync
	nop
	set	0x44, %i6
	stw	%i3,	[%l7 + %i6]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc8
	nop
	set	0x1A, %g1
	ldsh	[%l7 + %g1],	%l0
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xf0
	membar	#Sync
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g2
	set	0x0C, %l1
	stwa	%o4,	[%l7 + %l1] 0x80
	st	%f16,	[%l7 + 0x40]
	set	0x70, %l2
	sta	%f3,	[%l7 + %l2] 0x88
	nop
	set	0x74, %g5
	stw	%o6,	[%l7 + %g5]
	nop
	set	0x56, %i0
	ldsh	[%l7 + %i0],	%l3
	nop
	set	0x30, %o6
	std	%o2,	[%l7 + %o6]
	and	%i5,	%o7,	%i0
	and	%i7,	%o1,	%o5
	set	0x3C, %g7
	lda	[%l7 + %g7] 0x88,	%f29
	nop
	set	0x39, %l4
	stb	%o0,	[%l7 + %l4]
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x81,	 3
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%l0
	set	0x08, %l3
	stba	%i4,	[%l7 + %l3] 0x88
	nop
	set	0x6A, %i4
	ldub	[%l7 + %i4],	%l2
	set	0x50, %i2
	stxa	%o3,	[%l7 + %i2] 0xe2
	membar	#Sync
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xf0
	membar	#Sync
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%l4
	or	%i6,	%g7,	%g3
	nop
	set	0x2E, %o7
	lduh	[%l7 + %o7],	%g1
	set	0x46, %o0
	stha	%g5,	[%l7 + %o0] 0x81
	set	0x14, %i5
	lda	[%l7 + %i5] 0x88,	%f3
	set	0x10, %g2
	stba	%i2,	[%l7 + %g2] 0xe2
	membar	#Sync
	set	0x48, %i3
	prefetcha	[%l7 + %i3] 0x88,	 2
	nop
	set	0x58, %o1
	std	%f2,	[%l7 + %o1]
	nop
	set	0x1D, %i7
	ldub	[%l7 + %i7],	%g4
	st	%f23,	[%l7 + 0x3C]
	or	%g6,	%i3,	%l6
	nop
	set	0x73, %i1
	stb	%g2,	[%l7 + %i1]
	nop
	set	0x60, %g6
	std	%f20,	[%l7 + %g6]
	or	%l0,	%o4,	%o6
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xc0
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xda,	%f0
	set	0x50, %i6
	stxa	%l3,	[%l7 + %i6] 0x88
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%i4
	add	%o2,	%o7,	%i7
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x80,	%i0
	st	%f13,	[%l7 + 0x08]
	nop
	set	0x7C, %l0
	ldsw	[%l7 + %l0],	%o1
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xea,	%o0
	nop
	set	0x6E, %l1
	ldub	[%l7 + %l1],	%o5
	or	%i1,	%i4,	%l1
	set	0x40, %i0
	stxa	%l2,	[%l7 + %i0] 0x88
	set	0x32, %g5
	stha	%o3,	[%l7 + %g5] 0xea
	membar	#Sync
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x81
	set	0x24, %g7
	lda	[%l7 + %g7] 0x81,	%f7
	add	%i6,	%g7,	%g3
	set	0x48, %o2
	stda	%g0,	[%l7 + %o2] 0x88
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f0
	bg,a,pn	%xcc,	loop_62
	nop
	set	0x66, %l3
	lduh	[%l7 + %l3],	%l5
	and	%i2,	%l4,	%g5
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
loop_62:
	nop
	set	0x38, %i2
	swap	[%l7 + %i2],	%g6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xcc
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x4C, %g3
	swap	[%l7 + %g3],	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%g2
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x80,	%i6
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x81,	%o4
	or	%l0,	%l3,	%i5
	add	%o6,	%o2,	%i7
	nop
	set	0x20, %i5
	ldsh	[%l7 + %i5],	%i0
	set	0x60, %g2
	ldda	[%l7 + %g2] 0xeb,	%o6
	set	0x58, %o0
	lda	[%l7 + %o0] 0x81,	%f30
	set	0x1C, %i3
	stwa	%o0,	[%l7 + %i3] 0xe2
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%i1
	set	0x68, %i7
	stxa	%o5,	[%l7 + %i7] 0xeb
	membar	#Sync
	and	%l1,	%i4,	%l2
	ld	[%l7 + 0x08],	%f30
	nop
	set	0x40, %i1
	stx	%fsr,	[%l7 + %i1]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%g7
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x89
	set	0x18, %l5
	lda	[%l7 + %l5] 0x89,	%f25
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x88,	%i6
	set	0x30, %o1
	lda	[%l7 + %o1] 0x89,	%f29
	set	0x78, %i6
	stda	%g0,	[%l7 + %i6] 0xe3
	membar	#Sync
	st	%f31,	[%l7 + 0x4C]
	set	0x30, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
	set	0x4C, %l6
	lda	[%l7 + %l6] 0x89,	%f22
	be,a,pn	%xcc,	loop_63
	add	%g3,	%l4,	%g5
	set	0x50, %l0
	ldxa	[%l7 + %l0] 0x88,	%i2
loop_63:
	nop
	set	0x3C, %l1
	ldub	[%l7 + %l1],	%i3
	st	%f27,	[%l7 + 0x78]
	set	0x18, %l2
	stxa	%g4,	[%l7 + %l2] 0x89
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x88,	%g6
	nop
	set	0x68, %i0
	stx	%g2,	[%l7 + %i0]
	add	%o4,	%l0,	%l6
	nop
	set	0x2C, %o6
	ldsh	[%l7 + %o6],	%i5
	set	0x20, %g7
	swapa	[%l7 + %g7] 0x81,	%l3
	nop
	set	0x57, %l4
	ldstub	[%l7 + %l4],	%o2
	fpadd32	%f4,	%f22,	%f20
	set	0x2B, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o6
	nop
	set	0x70, %o2
	std	%i6,	[%l7 + %o2]
	nop
	set	0x78, %i4
	ldsw	[%l7 + %i4],	%i0
	nop
	nop
	setx	0xDDB6048FEAA96CBF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xF001FEA95AD56912,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f22,	%f8
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%o6
	st	%fsr,	[%l7 + 0x70]
	st	%f12,	[%l7 + 0x4C]
	set	0x24, %o4
	sta	%f12,	[%l7 + %o4] 0x88
	nop
	set	0x60, %o5
	swap	[%l7 + %o5],	%o0
	nop
	set	0x70, %o7
	stx	%i1,	[%l7 + %o7]
	nop
	set	0x34, %o3
	swap	[%l7 + %o3],	%o1
	set	0x30, %i5
	stwa	%o5,	[%l7 + %i5] 0xe3
	membar	#Sync
	and	%l1,	%l2,	%i4
	set	0x28, %g2
	stba	%g7,	[%l7 + %g2] 0x81
	nop
	set	0x08, %o0
	std	%f16,	[%l7 + %o0]
	set	0x28, %i3
	stda	%o2,	[%l7 + %i3] 0x80
	st	%fsr,	[%l7 + 0x5C]
	ld	[%l7 + 0x40],	%f20
	st	%fsr,	[%l7 + 0x28]
	set	0x16, %i7
	ldstuba	[%l7 + %i7] 0x88,	%i6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xca
	nop
	set	0x78, %i1
	lduh	[%l7 + %i1],	%g1
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%l5
	nop
	set	0x64, %g4
	lduw	[%l7 + %g4],	%l4
	set	0x08, %o1
	stha	%g5,	[%l7 + %o1] 0x80
	set	0x50, %i6
	sta	%f0,	[%l7 + %i6] 0x81
	nop
	set	0x50, %l5
	swap	[%l7 + %l5],	%g3
	nop
	set	0x40, %g1
	ldx	[%l7 + %g1],	%i3
	set	0x6E, %l0
	stha	%i2,	[%l7 + %l0] 0xe2
	membar	#Sync
	set	0x1C, %l1
	lda	[%l7 + %l1] 0x88,	%f2
	bn,pt	%xcc,	loop_64
	nop
	set	0x60, %l2
	lduw	[%l7 + %l2],	%g4
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x89,	 4
loop_64:
	and	%o4,	%g6,	%l6
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%l0
	fpsub32s	%f7,	%f3,	%f17
	set	0x4C, %o6
	stwa	%l3,	[%l7 + %o6] 0x81
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x88,	%o2
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x89,	%i4
	set	0x50, %l4
	swapa	[%l7 + %l4] 0x88,	%o6
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x88,	 2
	st	%fsr,	[%l7 + 0x54]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f0
	set	0x62, %i4
	ldstuba	[%l7 + %i4] 0x88,	%o7
	set	0x20, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%o1
	nop
	set	0x18, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%o5
	bleu,a,pn	%icc,	loop_65
	st	%f17,	[%l7 + 0x48]
	nop
	set	0x54, %o3
	lduw	[%l7 + %o3],	%l1
	wr	%o0,	%i4,	%pic
loop_65:
	nop
	set	0x78, %i5
	stx	%fsr,	[%l7 + %i5]
	add	%l2,	%o3,	%g7
	ld	[%l7 + 0x60],	%f6
	or	%g1,	%l5,	%i6
	nop
	set	0x54, %o7
	ldstub	[%l7 + %o7],	%g5
	nop
	set	0x0C, %o0
	swap	[%l7 + %o0],	%g3
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf8
	membar	#Sync
	set	0x68, %g3
	stda	%l4,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x50, %i1
	std	%i2,	[%l7 + %i1]
	set	0x50, %g6
	lda	[%l7 + %g6] 0x81,	%f16
	nop
	set	0x68, %g4
	stx	%g4,	[%l7 + %g4]
	nop
	set	0x20, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x50, %o1
	std	%i2,	[%l7 + %o1]
	set	0x30, %l5
	sta	%f24,	[%l7 + %l5] 0x81
	set	0x14, %i6
	sta	%f17,	[%l7 + %i6] 0x88
	or	%o4,	%g6,	%g2
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 2
	st	%f25,	[%l7 + 0x60]
	st	%f26,	[%l7 + 0x58]
	set	0x24, %l1
	lda	[%l7 + %l1] 0x88,	%f0
	ld	[%l7 + 0x4C],	%f1
	and	%l6,	%l0,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o6
	nop
	set	0x5C, %g1
	lduw	[%l7 + %g1],	%i0
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	nop
	set	0x2B, %l6
	ldub	[%l7 + %l6],	%o7
	nop
	set	0x10, %o6
	std	%f16,	[%l7 + %o6]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xcc
	set	0x18, %i0
	swapa	[%l7 + %i0] 0x81,	%l3
	nop
	set	0x38, %g7
	swap	[%l7 + %g7],	%i1
	set	0x28, %o2
	stxa	%i7,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x0A, %l3
	ldstuba	[%l7 + %l3] 0x88,	%o5
	set	0x3A, %i4
	stha	%l1,	[%l7 + %i4] 0x88
	set	0x28, %o4
	stxa	%o1,	[%l7 + %o4] 0x81
	nop
	set	0x45, %o5
	ldub	[%l7 + %o5],	%i4
	nop
	set	0x10, %l4
	ldd	[%l7 + %l4],	%o0
	nop
	set	0x5A, %i2
	ldsh	[%l7 + %i2],	%o3
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xda
	set	0x70, %o3
	stda	%g6,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x58, %i3
	stxa	%g1,	[%l7 + %i3] 0x81
	nop
	set	0x70, %g2
	stw	%l5,	[%l7 + %g2]
	nop
	set	0x14, %o0
	sth	%l2,	[%l7 + %o0]
	nop
	set	0x38, %g3
	lduw	[%l7 + %g3],	%g5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xd8
	nop
	set	0x1E, %i1
	ldstub	[%l7 + %i1],	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%i2
	nop
	set	0x60, %g4
	std	%f14,	[%l7 + %g4]
	nop
	set	0x38, %i7
	lduw	[%l7 + %i7],	%i6
	nop
	set	0x0A, %l5
	ldub	[%l7 + %l5],	%i3
	ba,a	%icc,	loop_66
	bgu,a	%icc,	loop_67
	nop
	set	0x53, %i6
	ldstub	[%l7 + %i6],	%g4
	nop
	set	0x60, %o1
	ldx	[%l7 + %o1],	%o4
loop_66:
	nop
	set	0x70, %l0
	prefetch	[%l7 + %l0],	 4
loop_67:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g2,	%l6
	nop
	set	0x7D, %g1
	ldsb	[%l7 + %g1],	%g6
	nop
	set	0x44, %l2
	lduw	[%l7 + %l2],	%l0
	set	0x6A, %l6
	ldstuba	[%l7 + %l6] 0x80,	%i5
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	ld	[%l7 + 0x28],	%f13
	st	%fsr,	[%l7 + 0x44]
	set	0x30, %o6
	swapa	[%l7 + %o6] 0x80,	%o2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xda
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%o6
	nop
	set	0x16, %o2
	stb	%i0,	[%l7 + %o2]
	fpsub16s	%f18,	%f2,	%f24
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f10
	ble	%xcc,	loop_68
	nop
	set	0x09, %l3
	stb	%o7,	[%l7 + %l3]
	set	0x38, %o4
	stda	%i0,	[%l7 + %o4] 0x81
loop_68:
	nop
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x103, 	%sys_tick_cmpr
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x2C, %i4
	stw	%o5,	[%l7 + %i4]
	nop
	set	0x78, %o5
	std	%l0,	[%l7 + %o5]
	nop
	set	0x28, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%f4,	[%l7 + 0x3C]
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x80,	%i4
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x88,	%f16
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%o0
	set	0x1C, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%g5
	nop
	set	0x28, %o7
	std	%g2,	[%l7 + %o7]
	nop
	set	0x74, %i3
	stw	%l4,	[%l7 + %i3]
	set	0x18, %o0
	stda	%l2,	[%l7 + %o0] 0x80
	set	0x50, %g3
	ldxa	[%l7 + %g3] 0x88,	%i2
	nop
	set	0x24, %g6
	swap	[%l7 + %g6],	%i6
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd2
	nop
	set	0x0B, %g4
	ldsb	[%l7 + %g4],	%i3
	set	0x1C, %i1
	sta	%f13,	[%l7 + %i1] 0x80
	st	%f2,	[%l7 + 0x08]
	set	0x3E, %l5
	stha	%g4,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x88,	 3
	nop
	set	0x2A, %o1
	sth	%l6,	[%l7 + %o1]
	nop
	set	0x20, %l0
	std	%f4,	[%l7 + %l0]
	set	0x58, %i7
	ldxa	[%l7 + %i7] 0x81,	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%g6
	nop
	set	0x40, %g1
	std	%i4,	[%l7 + %g1]
	set	0x08, %l2
	lda	[%l7 + %l2] 0x88,	%f24
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%o6
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%o2
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xc4
	fpadd32s	%f22,	%f8,	%f18
	add	%o7,	%i1,	%i7
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x80,	 2
	add	%l3,	%o5,	%l1
	set	0x6C, %g5
	lda	[%l7 + %g5] 0x80,	%f16
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%i4
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x88,	%o0
	nop
	set	0x44, %g7
	stw	%o0,	[%l7 + %g7]
	nop
	set	0x0C, %i4
	ldstub	[%l7 + %i4],	%o3
	nop
	set	0x20, %o5
	std	%g6,	[%l7 + %o5]
	nop
	set	0x20, %o4
	ldx	[%l7 + %o4],	%l5
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	nop
	set	0x0C, %l4
	ldsw	[%l7 + %l4],	%g5
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%g3
	and	%g1,	%l4,	%l2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%i6
	st	%fsr,	[%l7 + 0x78]
	set	0x1A, %i5
	ldstuba	[%l7 + %i5] 0x89,	%i3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%g2
	set	0x34, %o0
	stba	%g4,	[%l7 + %o0] 0x88
	set	0x68, %g3
	ldxa	[%l7 + %g3] 0x88,	%l6
	st	%f27,	[%l7 + 0x68]
	and	%o4,	%l0,	%g6
	nop
	set	0x44, %o7
	lduw	[%l7 + %o7],	%i5
	nop
	set	0x1C, %g2
	lduw	[%l7 + %g2],	%o6
	bleu	%xcc,	loop_69
	nop
	set	0x2B, %g4
	stb	%o2,	[%l7 + %g4]
	bg,a,pn	%icc,	loop_70
	nop
	set	0x0C, %g6
	sth	%o7,	[%l7 + %g6]
loop_69:
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%i0
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%i6
loop_70:
	nop
	set	0x14, %o1
	ldsh	[%l7 + %o1],	%i0
	nop
	set	0x68, %l0
	stx	%o5,	[%l7 + %l0]
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 1
	nop
	set	0x54, %i7
	ldsw	[%l7 + %i7],	%l3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%f0
	or	%l1,	%i4,	%o0
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x08, %l2
	std	%f28,	[%l7 + %l2]
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xc0
	nop
	set	0x4C, %l6
	ldsh	[%l7 + %l6],	%o3
	nop
	set	0x20, %i0
	ldsw	[%l7 + %i0],	%g7
	ble,a,pt	%xcc,	loop_71
	and	%l5,	%o1,	%g3
	nop
	set	0x4F, %o6
	ldub	[%l7 + %o6],	%g5
	add	%l4,	%l2,	%i2
loop_71:
	nop
	set	0x2A, %g5
	stha	%g1,	[%l7 + %g5] 0x80
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x80,	%i3
	st	%f25,	[%l7 + 0x08]
	add	%i6,	%g4,	%g2
	nop
	set	0x60, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x19, %i4
	ldsb	[%l7 + %i4],	%l6
	set	0x40, %o5
	stha	%l0,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x50, %g7
	stda	%o4,	[%l7 + %g7] 0x89
	set	0x40, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g6
	nop
	set	0x68, %o4
	lduw	[%l7 + %o4],	%o6
	nop
	set	0x38, %l4
	ldsw	[%l7 + %l4],	%o2
	nop
	set	0x70, %i5
	std	%f8,	[%l7 + %i5]
	nop
	set	0x24, %o3
	ldsb	[%l7 + %o3],	%o7
	nop
	set	0x6C, %i3
	swap	[%l7 + %i3],	%i5
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xda,	%f0
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%i7
	be,a	%xcc,	loop_72
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%i0
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x81,	%o5
loop_72:
	nop
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f0
	set	0x30, %g6
	stda	%l2,	[%l7 + %g6] 0x89
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x18, %l5
	stw	%l1,	[%l7 + %l5]
	wr	%i4,	%i1,	%clear_softint
	nop
	set	0x5A, %o1
	ldsh	[%l7 + %o1],	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x81,	%o3,	%l5
	add	%o1,	%g3,	%g5
	st	%f31,	[%l7 + 0x50]
	set	0x2C, %i1
	sta	%f28,	[%l7 + %i1] 0x80
	or	%l4,	%l2,	%i2
	st	%f8,	[%l7 + 0x10]
	st	%f19,	[%l7 + 0x44]
	set	0x7C, %i7
	stwa	%g7,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x2B, %l0
	ldstub	[%l7 + %l0],	%g1
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xd2
	ld	[%l7 + 0x6C],	%f1
	set	0x74, %l2
	stwa	%i3,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x77, %l6
	stb	%g4,	[%l7 + %l6]
	nop
	set	0x64, %l1
	lduw	[%l7 + %l1],	%g2
	nop
	set	0x50, %i0
	stb	%l6,	[%l7 + %i0]
	set	0x78, %o6
	swapa	[%l7 + %o6] 0x88,	%l0
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xc8
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x81,	 0
	nop
	set	0x14, %g5
	prefetch	[%l7 + %g5],	 0
	set	0x30, %o5
	ldxa	[%l7 + %o5] 0x89,	%g6
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	or	%o4,	%o2,	%o7
	nop
	set	0x30, %i2
	ldsw	[%l7 + %i2],	%o6
	set	0x20, %o4
	ldda	[%l7 + %o4] 0xea,	%i4
	nop
	set	0x2D, %l4
	stb	%i0,	[%l7 + %l4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%i7
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xeb,	%l2
	fpsub32	%f22,	%f28,	%f28
	fpadd32s	%f11,	%f22,	%f5
	nop
	set	0x60, %o3
	std	%f16,	[%l7 + %o3]
	set	0x10, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	nop
	set	0x6E, %i3
	stb	%l1,	[%l7 + %i3]
	nop
	set	0x5E, %o7
	sth	%o0,	[%l7 + %o7]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0C2, 	%tick_cmpr
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x88,	 1
	set	0x73, %g3
	stba	%g3,	[%l7 + %g3] 0x81
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%l4
	nop
	set	0x10, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x08, %g2
	stxa	%o1,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x08, %g6
	sth	%l2,	[%l7 + %g6]
	nop
	set	0x70, %l5
	std	%f0,	[%l7 + %l5]
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x81,	%i2
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%g1
	set	0x67, %i7
	stba	%i3,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x48, %i1
	swap	[%l7 + %i1],	%g4
	nop
	set	0x50, %g1
	ldx	[%l7 + %g1],	%g7
	nop
	set	0x30, %l2
	ldub	[%l7 + %l2],	%l6
	set	0x4C, %l6
	sta	%f7,	[%l7 + %l6] 0x80
	st	%f21,	[%l7 + 0x14]
	wr	%l0,	%i6,	%set_softint
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%g2
	fpadd32s	%f25,	%f17,	%f0
	nop
	set	0x5E, %l0
	sth	%o4,	[%l7 + %l0]
	nop
	set	0x30, %o6
	stx	%g6,	[%l7 + %o6]
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	set	0x7E, %i0
	stha	%o6,	[%l7 + %i0] 0x88
	nop
	set	0x50, %g5
	std	%i4,	[%l7 + %g5]
	nop
	set	0x12, %o5
	ldsh	[%l7 + %o5],	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%o5
	nop
	set	0x56, %i4
	ldstub	[%l7 + %i4],	%l3
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%i6
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%i4
	set	0x26, %l4
	stba	%l1,	[%l7 + %l4] 0xea
	membar	#Sync
	nop
	set	0x58, %i2
	stx	%o0,	[%l7 + %i2]
	set	0x70, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0
	nop
	set	0x68, %i5
	stx	%o3,	[%l7 + %i5]
	nop
	set	0x7C, %o3
	ldsw	[%l7 + %o3],	%l5
	set	0x54, %i3
	stwa	%g5,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x48, %o7
	stw	%g3,	[%l7 + %o7]
	bleu,pt	%icc,	loop_73
	nop
	set	0x08, %g3
	ldd	[%l7 + %g3],	%l4
	fpadd32s	%f12,	%f29,	%f19
	set	0x0C, %o0
	lda	[%l7 + %o0] 0x88,	%f10
loop_73:
	or	%o1,	%l2,	%i2
	fpsub32s	%f28,	%f1,	%f22
	nop
	set	0x78, %g4
	std	%g0,	[%l7 + %g4]
	nop
	set	0x2D, %g6
	ldub	[%l7 + %g6],	%g4
	nop
	set	0x38, %g2
	prefetch	[%l7 + %g2],	 1
	st	%f24,	[%l7 + 0x54]
	nop
	set	0x43, %l5
	ldstub	[%l7 + %l5],	%g7
	nop
	set	0x45, %i6
	ldsb	[%l7 + %i6],	%l6
	be,a,pn	%icc,	loop_74
	nop
	set	0x1D, %i7
	ldstub	[%l7 + %i7],	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l0,	%g2
loop_74:
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%o4
	set	0x50, %o1
	swapa	[%l7 + %o1] 0x89,	%g6
	nop
	set	0x17, %l2
	ldsb	[%l7 + %l2],	%o7
	set	0x54, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o6
	or	%i6,	%o2,	%i0
	nop
	set	0x18, %l1
	stx	%o5,	[%l7 + %l1]
	nop
	set	0x70, %l0
	stx	%fsr,	[%l7 + %l0]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf9
	membar	#Sync
	and	%l3,	%i5,	%i7
	nop
	nop
	setx	0x53E9E14287E683A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF10035DDB8EE29F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f16
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%l0
	set	0x46, %i0
	stba	%i4,	[%l7 + %i0] 0x88
	set	0x40, %g5
	lda	[%l7 + %g5] 0x89,	%f6
	nop
	set	0x3D, %o5
	stb	%o0,	[%l7 + %o5]
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%o2
	set	0x0C, %i4
	lda	[%l7 + %i4] 0x89,	%f30
	nop
	set	0x68, %o4
	stb	%l5,	[%l7 + %o4]
	set	0x1A, %l4
	stha	%i1,	[%l7 + %l4] 0xeb
	membar	#Sync
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x88
	and	%g3,	%g5,	%l4
	nop
	set	0x1C, %i2
	ldsw	[%l7 + %i2],	%o1
	nop
	set	0x34, %g7
	ldub	[%l7 + %g7],	%l2
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x58, %i3
	ldx	[%l7 + %i3],	%i2
	set	0x6A, %o7
	stha	%g1,	[%l7 + %o7] 0xea
	membar	#Sync
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%g7
	nop
	set	0x31, %i5
	ldstub	[%l7 + %i5],	%i3
	nop
	set	0x79, %o0
	ldub	[%l7 + %o0],	%l6
	nop
	set	0x10, %g3
	lduw	[%l7 + %g3],	%l0
	nop
	set	0x0C, %g4
	lduw	[%l7 + %g4],	%g2
	nop
	set	0x78, %g2
	lduh	[%l7 + %g2],	%o4
	nop
	set	0x5A, %l5
	sth	%o7,	[%l7 + %l5]
	nop
	set	0x2F, %g6
	ldub	[%l7 + %g6],	%g6
	st	%f18,	[%l7 + 0x40]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x60, %i7
	ldx	[%l7 + %i7],	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%o2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x81
	nop
	set	0x76, %o1
	ldsh	[%l7 + %o1],	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i5
	nop
	set	0x24, %l2
	swap	[%l7 + %l2],	%i7
	set	0x20, %g1
	ldxa	[%l7 + %g1] 0x88,	%i0
	set	0x19, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i4
	st	%fsr,	[%l7 + 0x34]
	st	%f22,	[%l7 + 0x44]
	nop
	set	0x30, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%o0
	nop
	set	0x5A, %o2
	sth	%l1,	[%l7 + %o2]
	and	%o3,	%l5,	%g3
	nop
	set	0x0F, %i0
	ldub	[%l7 + %i0],	%g5
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x89,	%l4
	set	0x70, %l1
	lda	[%l7 + %l1] 0x89,	%f9
	nop
	set	0x40, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x28, %o5
	ldsw	[%l7 + %o5],	%o1
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xd8
	or	%i1,	%l2,	%i2
	set	0x18, %i4
	prefetcha	[%l7 + %i4] 0x88,	 1
	or	%g4,	%i3,	%g7
	or	%l0,	%l6,	%o4
	bl,a,pt	%icc,	loop_75
	bn,a,pt	%xcc,	loop_76
	nop
	set	0x10, %l3
	lduw	[%l7 + %l3],	%g2
	fpadd16	%f12,	%f2,	%f8
loop_75:
	nop
	set	0x18, %l4
	stwa	%g6,	[%l7 + %l4] 0x89
loop_76:
	nop
	set	0x50, %g7
	stx	%o6,	[%l7 + %g7]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f16
	ld	[%l7 + 0x5C],	%f15
	nop
	set	0x76, %i2
	ldstub	[%l7 + %i2],	%i6
	nop
	set	0x20, %o7
	ldd	[%l7 + %o7],	%f10
	nop
	set	0x08, %i5
	std	%f16,	[%l7 + %i5]
	nop
	set	0x4D, %i3
	ldsb	[%l7 + %i3],	%o7
	nop
	set	0x52, %g3
	sth	%o5,	[%l7 + %g3]
	set	0x5A, %o0
	ldstuba	[%l7 + %o0] 0x81,	%o2
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	set	0x13, %g4
	ldstuba	[%l7 + %g4] 0x88,	%i5
	nop
	set	0x0C, %l5
	prefetch	[%l7 + %l5],	 3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%i0
	set	0x70, %g6
	ldxa	[%l7 + %g6] 0x88,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x89D, 	%tick_cmpr
	or	%o3,	%o0,	%l5
	nop
	set	0x20, %i7
	ldsh	[%l7 + %i7],	%g5
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%l4
	nop
	set	0x68, %o1
	std	%o0,	[%l7 + %o1]
	set	0x2D, %g1
	stba	%g3,	[%l7 + %g1] 0x89
	nop
	set	0x71, %i1
	ldsb	[%l7 + %i1],	%l2
	set	0x78, %l0
	prefetcha	[%l7 + %l0] 0x81,	 4
	nop
	set	0x23, %l2
	ldstub	[%l7 + %l2],	%i1
	bne,a	%xcc,	loop_77
	ld	[%l7 + 0x10],	%f28
	wr	%g1,	%g4,	%pic
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf9,	%f0
loop_77:
	ld	[%l7 + 0x14],	%f23
	nop
	set	0x3C, %l6
	swap	[%l7 + %l6],	%i3
	set	0x68, %i0
	prefetcha	[%l7 + %i0] 0x88,	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%o4
	wr	%g2,	%g7,	%ccr
	set	0x38, %g5
	stxa	%o6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x60, %o6
	std	%g6,	[%l7 + %o6]
	and	%i6,	%o5,	%o7
	nop
	set	0x71, %o5
	stb	%o2,	[%l7 + %o5]
	nop
	set	0x4B, %o4
	stb	%i7,	[%l7 + %o4]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x80
	set	0x48, %l1
	stda	%i0,	[%l7 + %l1] 0xeb
	membar	#Sync
	add	%i5,	%l3,	%i4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%o3
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f8
	nop
	set	0x58, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x3A, %l4
	stha	%o0,	[%l7 + %l4] 0x89
	nop
	set	0x4A, %i2
	ldsh	[%l7 + %i2],	%l5
	set	0x18, %o3
	sta	%f9,	[%l7 + %o3] 0x88
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	set	0x50, %i3
	stxa	%g5,	[%l7 + %i3] 0x80
	ld	[%l7 + 0x50],	%f26
	st	%f24,	[%l7 + 0x14]
	set	0x40, %o7
	stwa	%l4,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x5C, %g3
	lda	[%l7 + %g3] 0x88,	%f14
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%l2
	fpadd16	%f12,	%f22,	%f22
	nop
	set	0x74, %o0
	swap	[%l7 + %o0],	%i2
	set	0x58, %g2
	sta	%f27,	[%l7 + %g2] 0x80
	nop
	set	0x46, %g4
	ldsh	[%l7 + %g4],	%i1
	nop
	set	0x15, %l5
	stb	%g3,	[%l7 + %l5]
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x80,	%g4
	nop
	set	0x1C, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x08, %o1
	sta	%f21,	[%l7 + %o1] 0x88
	nop
	set	0x40, %i6
	ldx	[%l7 + %i6],	%i3
	nop
	set	0x0C, %i1
	swap	[%l7 + %i1],	%g1
	nop
	set	0x28, %l0
	stx	%l6,	[%l7 + %l0]
	set	0x2B, %g1
	ldstuba	[%l7 + %g1] 0x88,	%l0
	set	0x48, %l2
	sta	%f26,	[%l7 + %l2] 0x89
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x89,	%o4
	fpsub16	%f2,	%f14,	%f10
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x88,	 4
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x80,	%o6
	nop
	set	0x40, %g5
	stx	%g2,	[%l7 + %g5]
	set	0x2F, %o5
	stba	%i6,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x60, %o6
	swap	[%l7 + %o6],	%g6
	set	0x19, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o5
	set	0x40, %i4
	stda	%o2,	[%l7 + %i4] 0x80
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x20, %l3
	std	%f22,	[%l7 + %l3]
	set	0x50, %g7
	stha	%i7,	[%l7 + %g7] 0x88
	nop
	set	0x28, %l4
	swap	[%l7 + %l4],	%o7
	nop
	set	0x6C, %l1
	lduw	[%l7 + %l1],	%i5
	ld	[%l7 + 0x5C],	%f6
	ld	[%l7 + 0x38],	%f5
	and	%i0,	%i4,	%l1
	nop
	set	0x50, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x38, %i5
	swap	[%l7 + %i5],	%o3
	nop
	set	0x60, %i3
	ldd	[%l7 + %i3],	%f14
	nop
	set	0x71, %o3
	ldstub	[%l7 + %o3],	%o0
	nop
	set	0x58, %g3
	sth	%l3,	[%l7 + %g3]
	set	0x34, %o0
	lda	[%l7 + %o0] 0x88,	%f19
	add	%g5,	%l5,	%o1
	fpsub16s	%f5,	%f10,	%f27
	add	%l2,	%l4,	%i1
	set	0x50, %o7
	lda	[%l7 + %o7] 0x80,	%f7
	nop
	set	0x78, %g2
	lduw	[%l7 + %g2],	%g3
	nop
	set	0x08, %g4
	stx	%g4,	[%l7 + %g4]
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f26
	set	0x30, %g6
	ldda	[%l7 + %g6] 0xeb,	%i2
	set	0x70, %i7
	ldda	[%l7 + %i7] 0xe3,	%i2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xe2,	%g0
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o4
	wr	%o6,	%g2,	%y
	set	0x16, %i1
	stba	%g7,	[%l7 + %i1] 0x81
	set	0x78, %g1
	stda	%g6,	[%l7 + %g1] 0x89
	set	0x24, %l2
	stwa	%o5,	[%l7 + %l2] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x6C, %l0
	swap	[%l7 + %l0],	%o2
	st	%fsr,	[%l7 + 0x4C]
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	set	0x3E, %i0
	stha	%i6,	[%l7 + %i0] 0x88
	nop
	set	0x3C, %g5
	sth	%i7,	[%l7 + %g5]
	nop
	set	0x66, %o5
	ldub	[%l7 + %o5],	%i5
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%o6
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x88,	%i0
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f10
	nop
	set	0x68, %o6
	swap	[%l7 + %o6],	%l1
	set	0x18, %l3
	stxa	%o3,	[%l7 + %l3] 0xe2
	membar	#Sync
	set	0x48, %l4
	ldxa	[%l7 + %l4] 0x89,	%o0
	nop
	set	0x56, %g7
	sth	%i4,	[%l7 + %g7]
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x88,	%g5
	set	0x20, %i5
	lda	[%l7 + %i5] 0x80,	%f23
	and	%l3,	%l5,	%o1
	nop
	set	0x78, %i3
	stx	%l4,	[%l7 + %i3]
	ld	[%l7 + 0x20],	%f26
	nop
	set	0x18, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x20, %g3
	std	%i0,	[%l7 + %g3]
	set	0x50, %o0
	stha	%g3,	[%l7 + %o0] 0x80
	nop
	set	0x4C, %o3
	ldsh	[%l7 + %o3],	%l2
	nop
	set	0x72, %g2
	lduh	[%l7 + %g2],	%i2
	nop
	set	0x50, %g4
	stx	%i3,	[%l7 + %g4]
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	nop
	set	0x3C, %o7
	stw	%g1,	[%l7 + %o7]
	set	0x64, %i7
	sta	%f3,	[%l7 + %i7] 0x80
	set	0x50, %i6
	stwa	%g4,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x58, %o1
	prefetcha	[%l7 + %o1] 0x88,	 2
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x80,	 1
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%o6
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x08, %l0
	stha	%g2,	[%l7 + %l0] 0x89
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%o4
	set	0x70, %i0
	ldda	[%l7 + %i0] 0xeb,	%g6
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f2
	fpsub32	%f20,	%f0,	%f8
	or	%g7,	%o5,	%i6
	set	0x68, %l2
	ldxa	[%l7 + %l2] 0x89,	%i7
	nop
	set	0x20, %o2
	std	%f10,	[%l7 + %o2]
	set	0x58, %o4
	stda	%i4,	[%l7 + %o4] 0x89
	nop
	set	0x08, %o5
	prefetch	[%l7 + %o5],	 2
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x88,	%o2
	ld	[%l7 + 0x58],	%f9
	nop
	set	0x58, %i4
	ldsw	[%l7 + %i4],	%i0
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%o6
	st	%fsr,	[%l7 + 0x58]
	bgu,a	%xcc,	loop_78
	ld	[%l7 + 0x24],	%f0
	nop
	set	0x24, %l4
	ldsw	[%l7 + %l4],	%o3
	set	0x6C, %i2
	sta	%f5,	[%l7 + %i2] 0x88
loop_78:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%l1
	nop
	set	0x24, %i5
	lduh	[%l7 + %i5],	%g5
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f16
	nop
	set	0x28, %g7
	std	%l2,	[%l7 + %g7]
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	set	0x38, %l1
	swapa	[%l7 + %l1] 0x80,	%i4
	nop
	set	0x50, %o0
	lduh	[%l7 + %o0],	%o1
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x1B, %g2
	ldub	[%l7 + %g2],	%l4
	set	0x08, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f30
	nop
	set	0x72, %l5
	ldub	[%l7 + %l5],	%l2
	st	%f22,	[%l7 + 0x60]
	nop
	set	0x60, %o7
	lduw	[%l7 + %o7],	%i2
	nop
	set	0x30, %i7
	stx	%i1,	[%l7 + %i7]
	set	0x44, %o1
	swapa	[%l7 + %o1] 0x80,	%i3
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f26
	set	0x44, %g1
	stwa	%g1,	[%l7 + %g1] 0xe3
	membar	#Sync
	ld	[%l7 + 0x08],	%f17
	st	%fsr,	[%l7 + 0x48]
	st	%f18,	[%l7 + 0x70]
	nop
	set	0x66, %i6
	stb	%l6,	[%l7 + %i6]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f0
	set	0x50, %l0
	swapa	[%l7 + %l0] 0x81,	%l0
	set	0x24, %i0
	swapa	[%l7 + %i0] 0x89,	%o6
	nop
	set	0x5C, %g5
	ldsw	[%l7 + %g5],	%g4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xcc
	set	0x6D, %l6
	stba	%g2,	[%l7 + %l6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x38],	%f15
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf9
	membar	#Sync
	nop
	set	0x46, %o5
	ldsh	[%l7 + %o5],	%o4
	or	%g7,	%o5,	%i6
	set	0x58, %o6
	prefetcha	[%l7 + %o6] 0x80,	 1
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x74, %o4
	prefetch	[%l7 + %o4],	 4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%o2
	or	%i5,	%i0,	%o3
	nop
	set	0x40, %l3
	ldsw	[%l7 + %l3],	%o0
	nop
	set	0x7C, %i2
	prefetch	[%l7 + %i2],	 4
	set	0x6C, %i5
	sta	%f26,	[%l7 + %i5] 0x88
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%o6
	set	0x40, %g7
	stwa	%l1,	[%l7 + %g7] 0x80
	and	%l3,	%g5,	%i4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	add	%o1,	%l4,	%l5
	or	%l2,	%g3,	%i1
	set	0x18, %o0
	stxa	%i3,	[%l7 + %o0] 0xeb
	membar	#Sync
	and	%i2,	%l6,	%g1
	nop
	set	0x50, %g2
	stx	%o6,	[%l7 + %g2]
	nop
	set	0x49, %g3
	stb	%l0,	[%l7 + %g3]
	set	0x20, %o3
	ldda	[%l7 + %o3] 0xe3,	%g2
	and	%o4,	%g7,	%g4
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x89,	%i6
	nop
	set	0x3F, %g4
	ldsb	[%l7 + %g4],	%i7
	nop
	set	0x60, %i7
	ldstub	[%l7 + %i7],	%g6
	nop
	set	0x7E, %o7
	sth	%o2,	[%l7 + %o7]
	nop
	set	0x08, %i1
	sth	%o5,	[%l7 + %i1]
	set	0x6C, %o1
	stha	%i5,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%o0
	set	0x27, %g6
	stba	%l1,	[%l7 + %g6] 0x89
	nop
	set	0x18, %l0
	std	%f6,	[%l7 + %l0]
	nop
	set	0x60, %i0
	swap	[%l7 + %i0],	%l3
	set	0x40, %g5
	stxa	%o7,	[%l7 + %g5] 0x89
	nop
	set	0x38, %l2
	ldsh	[%l7 + %l2],	%i4
	nop
	set	0x0C, %g1
	ldsw	[%l7 + %g1],	%g5
	set	0x5A, %o2
	stba	%l4,	[%l7 + %o2] 0x89
	ble,pt	%icc,	loop_79
	or	%l5,	%o1,	%g3
	nop
	set	0x38, %l6
	stx	%l2,	[%l7 + %l6]
	set	0x69, %o6
	stba	%i1,	[%l7 + %o6] 0xea
	membar	#Sync
loop_79:
	st	%f28,	[%l7 + 0x48]
	set	0x5B, %o5
	stba	%i3,	[%l7 + %o5] 0x89
	set	0x78, %i4
	lda	[%l7 + %i4] 0x89,	%f25
	set	0x60, %l3
	ldda	[%l7 + %l3] 0x81,	%i6
	nop
	set	0x10, %i2
	stw	%g1,	[%l7 + %i2]
	set	0x38, %i5
	stda	%i2,	[%l7 + %i5] 0x80
	nop
	set	0x66, %o4
	sth	%l0,	[%l7 + %o4]
	nop
	set	0x40, %i3
	stx	%g2,	[%l7 + %i3]
	fpadd32s	%f20,	%f0,	%f3
	nop
	set	0x58, %l4
	std	%f14,	[%l7 + %l4]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%g7
	nop
	set	0x46, %g7
	sth	%g4,	[%l7 + %g7]
	nop
	set	0x4A, %l1
	lduh	[%l7 + %l1],	%i6
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%o6
	nop
	set	0x40, %g3
	ldsh	[%l7 + %g3],	%i7
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc2
	nop
	set	0x10, %g2
	std	%g6,	[%l7 + %g2]
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f18
	nop
	set	0x78, %i7
	std	%f18,	[%l7 + %i7]
	set	0x78, %o7
	stxa	%o2,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x28, %i1
	stx	%i5,	[%l7 + %i1]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f16
	fpadd16s	%f29,	%f27,	%f29
	set	0x62, %o1
	stha	%i0,	[%l7 + %o1] 0xeb
	membar	#Sync
	bgu,a	%xcc,	loop_80
	nop
	set	0x28, %i6
	ldub	[%l7 + %i6],	%o3
	nop
	set	0x4E, %l0
	ldsb	[%l7 + %l0],	%o0
	nop
	set	0x30, %i0
	lduw	[%l7 + %i0],	%o5
loop_80:
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f20
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%l0
	nop
	set	0x28, %g6
	ldd	[%l7 + %g6],	%f20
	nop
	set	0x14, %g1
	stw	%l3,	[%l7 + %g1]
	set	0x70, %l6
	stba	%o7,	[%l7 + %l6] 0xe2
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%g5
	ld	[%l7 + 0x3C],	%f13
	set	0x74, %o2
	sta	%f16,	[%l7 + %o2] 0x88
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%l5
	nop
	set	0x5D, %o5
	stb	%g3,	[%l7 + %o5]
	nop
	nop
	setx	0x0AA7DFBA4B934854,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE56A1A3C16E9D6FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f24,	%f16
	set	0x70, %i4
	sta	%f25,	[%l7 + %i4] 0x81
	fpadd16s	%f30,	%f11,	%f18
	set	0x41, %o6
	ldstuba	[%l7 + %o6] 0x81,	%o1
	nop
	set	0x78, %l3
	lduh	[%l7 + %l3],	%i1
	set	0x40, %i5
	stda	%l2,	[%l7 + %i5] 0x88
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%i3
	and	%l6,	%i2,	%g1
	wr	%l0,	%g2,	%y
	set	0x6E, %o4
	stha	%o4,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x54, %i3
	stw	%g7,	[%l7 + %i3]
	nop
	set	0x30, %g7
	std	%g4,	[%l7 + %g7]
	nop
	set	0x1C, %l1
	prefetch	[%l7 + %l1],	 4
	st	%fsr,	[%l7 + 0x24]
	st	%fsr,	[%l7 + 0x68]
	set	0x78, %l4
	stda	%i6,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x10, %g3
	stxa	%i7,	[%l7 + %g3] 0x80
	add	%o6,	%o2,	%i5
	set	0x20, %o0
	stxa	%i0,	[%l7 + %o0] 0x80
	nop
	set	0x44, %g2
	swap	[%l7 + %g2],	%g6
	set	, %o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 2:
!
!	Type l   	: 1263
!	Type a   	: 23
!	Type cti   	: 31
!	Type x   	: 539
!	Type f   	: 44
!	Type i   	: 100
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
	set	0xE,	%g1
	set	0x8,	%g2
	set	0x9,	%g3
	set	0xE,	%g4
	set	0x0,	%g5
	set	0xE,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0xC,	%i1
	set	-0x6,	%i2
	set	-0x5,	%i3
	set	-0xD,	%i4
	set	-0xE,	%i5
	set	-0x6,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x0FC5FF7F,	%l0
	set	0x60C897A9,	%l1
	set	0x6979F70B,	%l2
	set	0x55CCB7F4,	%l3
	set	0x37EDAE7A,	%l4
	set	0x73F9C2C9,	%l5
	set	0x034473A2,	%l6
	!# Output registers
	set	-0x1EE0,	%o0
	set	0x06D0,	%o1
	set	0x01CF,	%o2
	set	-0x10B4,	%o3
	set	0x0FAC,	%o4
	set	-0x18FA,	%o5
	set	-0x0328,	%o6
	set	0x0629,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%o0
	nop
	set	0x48, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc8
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%o3
	and	%o5,	%l3,	%o7
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xcc
	nop
	set	0x30, %i6
	lduh	[%l7 + %i6],	%l1
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x80,	 4
	set	0x58, %i0
	stda	%l4,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i1,	%l2
	nop
	set	0x68, %l0
	ldsw	[%l7 + %l0],	%i3
	nop
	set	0x3C, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x20, %g1
	stda	%i6,	[%l7 + %g1] 0xe2
	membar	#Sync
	nop
	set	0x44, %l6
	swap	[%l7 + %l6],	%i2
	nop
	set	0x41, %o2
	ldub	[%l7 + %o2],	%i4
	nop
	set	0x18, %o5
	std	%g0,	[%l7 + %o5]
	ld	[%l7 + 0x08],	%f10
	set	0x7A, %i4
	stha	%g2,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x6C, %o6
	swap	[%l7 + %o6],	%o4
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x80,	%g7
	set	0x69, %i5
	stba	%g4,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x30, %l3
	stwa	%i6,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	nop
	setx	0x40CD284059AB92A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x54B069CA967FA396,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f18
	nop
	set	0x70, %i2
	std	%f24,	[%l7 + %i2]
	set	0x74, %o4
	ldstuba	[%l7 + %o4] 0x81,	%l0
	bge,pt	%icc,	loop_81
	nop
	set	0x58, %g7
	ldsw	[%l7 + %g7],	%o6
	nop
	set	0x74, %l1
	prefetch	[%l7 + %l1],	 2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%i7
loop_81:
	nop
	set	0x20, %i3
	stxa	%i0,	[%l7 + %i3] 0x89
	add	%g6,	%i5,	%o0
	set	0x4C, %l4
	stwa	%o5,	[%l7 + %l4] 0x81
	st	%f4,	[%l7 + 0x5C]
	nop
	set	0x72, %o0
	ldsb	[%l7 + %o0],	%o3
	nop
	set	0x5C, %g2
	prefetch	[%l7 + %g2],	 4
	set	0x40, %o3
	swapa	[%l7 + %o3] 0x81,	%o7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%l1
	nop
	set	0x12, %g3
	ldsh	[%l7 + %g3],	%g5
	ld	[%l7 + 0x64],	%f11
	nop
	set	0x68, %i7
	ldd	[%l7 + %i7],	%f2
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f8
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f30
	nop
	set	0x20, %g4
	stx	%fsr,	[%l7 + %g4]
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x89
	and	%l4,	%g3,	%o1
	nop
	set	0x22, %o1
	sth	%l5,	[%l7 + %o1]
	nop
	set	0x40, %i0
	stw	%l2,	[%l7 + %i0]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%l6
	set	0x64, %o7
	ldstuba	[%l7 + %o7] 0x88,	%i3
	nop
	set	0x0C, %l0
	swap	[%l7 + %l0],	%i2
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x80,	%i4
	nop
	set	0x50, %g1
	swap	[%l7 + %g1],	%g2
	or	%g1,	%g7,	%g4
	nop
	set	0x18, %l6
	ldsh	[%l7 + %l6],	%i6
	or	%o4,	%l0,	%o6
	ld	[%l7 + 0x78],	%f24
	ld	[%l7 + 0x68],	%f17
	nop
	set	0x1E, %o2
	sth	%i7,	[%l7 + %o2]
	nop
	set	0x28, %l2
	prefetch	[%l7 + %l2],	 0
	set	0x2C, %o5
	sta	%f1,	[%l7 + %o5] 0x89
	set	0x17, %o6
	stba	%o2,	[%l7 + %o6] 0x88
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i0,	%g6
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%o0
	nop
	set	0x08, %i5
	stx	%fsr,	[%l7 + %i5]
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f0
	nop
	set	0x60, %l3
	std	%i4,	[%l7 + %l3]
	set	0x3E, %o4
	ldstuba	[%l7 + %o4] 0x89,	%o5
	set	0x0C, %i2
	swapa	[%l7 + %i2] 0x88,	%o3
	wr 	%g0, 	0x4, 	%fprs
	ld	[%l7 + 0x08],	%f9
	nop
	set	0x28, %l1
	std	%g4,	[%l7 + %l1]
	nop
	set	0x1C, %g7
	prefetch	[%l7 + %g7],	 0
	nop
	set	0x69, %i3
	ldsb	[%l7 + %i3],	%l4
	set	0x38, %o0
	stwa	%o7,	[%l7 + %o0] 0x88
	nop
	set	0x78, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x20, %l4
	lduw	[%l7 + %l4],	%o1
	nop
	set	0x3C, %o3
	prefetch	[%l7 + %o3],	 3
	nop
	set	0x38, %g3
	ldsb	[%l7 + %g3],	%l5
	ld	[%l7 + 0x2C],	%f24
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x88,	%l2
	and	%g3,	%l6,	%i3
	nop
	set	0x50, %i1
	ldx	[%l7 + %i1],	%i1
	nop
	set	0x60, %i7
	std	%i4,	[%l7 + %i7]
	nop
	set	0x19, %g4
	ldstub	[%l7 + %g4],	%i2
	fpadd16	%f26,	%f0,	%f26
	nop
	set	0x3B, %o1
	ldstub	[%l7 + %o1],	%g2
	nop
	set	0x1A, %i0
	lduh	[%l7 + %i0],	%g7
	set	0x40, %i6
	sta	%f9,	[%l7 + %i6] 0x88
	set	0x7C, %o7
	stba	%g1,	[%l7 + %o7] 0x81
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f0
	nop
	set	0x20, %g1
	stb	%g4,	[%l7 + %g1]
	and	%i6,	%l0,	%o4
	set	0x7C, %l6
	stha	%i7,	[%l7 + %l6] 0x88
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xf1
	membar	#Sync
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x81,	%o2
	set	0x20, %l2
	swapa	[%l7 + %l2] 0x88,	%i0
	nop
	set	0x13, %o6
	ldub	[%l7 + %o6],	%o6
	set	0x56, %i5
	stha	%o0,	[%l7 + %i5] 0xeb
	membar	#Sync
	set	0x70, %i4
	swapa	[%l7 + %i4] 0x80,	%i5
	nop
	set	0x24, %l3
	stw	%g6,	[%l7 + %l3]
	nop
	set	0x48, %o4
	swap	[%l7 + %o4],	%o5
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x81,	%o2
	set	0x5C, %l1
	stha	%l3,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x18, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x20, %i3
	ldda	[%l7 + %i3] 0xea,	%l0
	set	0x50, %o0
	ldda	[%l7 + %o0] 0xe2,	%g4
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x88,	%o7
	nop
	set	0x68, %g2
	lduw	[%l7 + %g2],	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%l2
	fpadd32s	%f8,	%f2,	%f2
	or	%g3,	%l6,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%i2
	nop
	set	0x4F, %o3
	ldstub	[%l7 + %o3],	%g2
	set	0x08, %l4
	stda	%g0,	[%l7 + %l4] 0x81
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xd2
	set	0x20, %l5
	stwa	%g7,	[%l7 + %l5] 0x80
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x89
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%l0
	nop
	set	0x60, %g4
	lduw	[%l7 + %g4],	%i6
	set	0x10, %o1
	lda	[%l7 + %o1] 0x88,	%f27
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%o4
	nop
	set	0x5C, %i6
	stw	%i7,	[%l7 + %i6]
	set	0x44, %i1
	sta	%f0,	[%l7 + %i1] 0x80
	set	0x70, %o7
	stxa	%i0,	[%l7 + %o7] 0xe2
	membar	#Sync
	set	0x48, %g1
	stha	%o6,	[%l7 + %g1] 0xe2
	membar	#Sync
	set	0x6C, %l0
	stha	%o2,	[%l7 + %l0] 0x89
	fpsub32	%f6,	%f22,	%f30
	and	%o0,	%g6,	%o5
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%l3
	set	0x58, %o2
	stda	%l0,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x7B, %g5
	stba	%g5,	[%l7 + %g5] 0x88
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f28
	nop
	set	0x58, %o6
	stx	%i5,	[%l7 + %o6]
	set	0x64, %o5
	lda	[%l7 + %o5] 0x88,	%f10
	add	%o7,	%l4,	%o1
	nop
	set	0x73, %i4
	ldstub	[%l7 + %i4],	%l2
	nop
	set	0x5A, %i5
	sth	%g3,	[%l7 + %i5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%l5
	nop
	set	0x58, %o4
	ldd	[%l7 + %o4],	%f0
	nop
	set	0x66, %g6
	stb	%i1,	[%l7 + %g6]
	add	%i3,	%i2,	%g2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%g7
	set	0x70, %l3
	stxa	%l0,	[%l7 + %l3] 0xe3
	membar	#Sync
	nop
	set	0x60, %l1
	swap	[%l7 + %l1],	%o4
	set	0x24, %i2
	swapa	[%l7 + %i2] 0x88,	%i6
	set	0x50, %i3
	stha	%i0,	[%l7 + %i3] 0x88
	set	0x78, %g7
	stda	%i6,	[%l7 + %g7] 0xe3
	membar	#Sync
	and	%o2,	%o6,	%g6
	set	0x20, %o0
	stda	%o0,	[%l7 + %o0] 0x88
	set	0x70, %o3
	swapa	[%l7 + %o3] 0x88,	%o5
	nop
	set	0x48, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%l3
	nop
	set	0x30, %l5
	prefetch	[%l7 + %l5],	 3
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%o7
	set	0x27, %i7
	ldstuba	[%l7 + %i7] 0x80,	%g5
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x74, %g4
	prefetch	[%l7 + %g4],	 0
	wr	%l4,	%l2,	%pic
	nop
	set	0x68, %g3
	prefetch	[%l7 + %g3],	 4
	nop
	set	0x36, %o1
	lduh	[%l7 + %o1],	%o1
	set	0x10, %i6
	stxa	%g3,	[%l7 + %i6] 0xe2
	membar	#Sync
	and	%l6,	%l5,	%i1
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%i2
	nop
	set	0x14, %i0
	lduw	[%l7 + %i0],	%i3
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f6
	st	%fsr,	[%l7 + 0x74]
	and	%i4,	%g2,	%g1
	bleu	%icc,	loop_82
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%g4
	ba,a,pn	%xcc,	loop_83
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%f10
loop_82:
	nop
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x81,	%l0
loop_83:
	nop
	set	0x70, %o2
	std	%o4,	[%l7 + %o2]
	fpsub16s	%f1,	%f1,	%f1
	nop
	set	0x36, %g5
	ldstub	[%l7 + %g5],	%i6
	nop
	set	0x30, %l2
	sth	%g7,	[%l7 + %l2]
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%f6
	nop
	set	0x20, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x78, %i5
	stx	%i0,	[%l7 + %i5]
	wr	%i7,	%o6,	%ccr
	set	0x70, %o4
	prefetcha	[%l7 + %o4] 0x89,	 3
	set	0x70, %g6
	ldda	[%l7 + %g6] 0xeb,	%o0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%l3
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x89,	%o2
	or	%o5,	%l1,	%i5
	nop
	set	0x18, %l1
	std	%o6,	[%l7 + %l1]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x38, %i2
	ldsw	[%l7 + %i2],	%l4
	bn,a	%icc,	loop_84
	nop
	set	0x7E, %l3
	ldsh	[%l7 + %l3],	%l2
	nop
	set	0x08, %i3
	stx	%g5,	[%l7 + %i3]
	nop
	set	0x40, %g7
	stx	%g3,	[%l7 + %g7]
loop_84:
	nop
	set	0x40, %o3
	lda	[%l7 + %o3] 0x80,	%f12
	nop
	set	0x20, %l4
	ldsw	[%l7 + %l4],	%o1
	nop
	set	0x35, %g2
	ldstub	[%l7 + %g2],	%l5
	st	%f20,	[%l7 + 0x20]
	or	%l6,	%i1,	%i3
	nop
	set	0x08, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x1C, %o0
	swap	[%l7 + %o0],	%i2
	nop
	set	0x30, %i7
	stx	%g2,	[%l7 + %i7]
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x89,	%g1
	nop
	set	0x12, %g3
	sth	%i4,	[%l7 + %g3]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x89
	set	0x30, %i1
	prefetcha	[%l7 + %i1] 0x81,	 0
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x89,	 2
	and	%i6,	%g7,	%o4
	set	0x10, %i0
	ldxa	[%l7 + %i0] 0x81,	%i0
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x81,	%i7
	nop
	set	0x68, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x34, %o7
	ldub	[%l7 + %o7],	%o6
	nop
	set	0x5C, %g1
	lduh	[%l7 + %g1],	%o0
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf9
	membar	#Sync
	nop
	set	0x78, %o2
	stw	%o2,	[%l7 + %o2]
	ld	[%l7 + 0x14],	%f28
	set	0x13, %o5
	stba	%l3,	[%l7 + %o5] 0xea
	membar	#Sync
	nop
	set	0x30, %l2
	stw	%g6,	[%l7 + %l2]
	or	%o5,	%l1,	%o3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xda,	%f0
	or	%i5,	%o7,	%l2
	set	0x60, %i4
	stda	%g4,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x24, %o4
	stha	%g3,	[%l7 + %o4] 0x89
	set	0x08, %o6
	ldxa	[%l7 + %o6] 0x88,	%o1
	nop
	set	0x20, %l1
	std	%f10,	[%l7 + %l1]
	nop
	set	0x28, %g6
	lduh	[%l7 + %g6],	%l4
	nop
	nop
	setx	0x04C866098E861B45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x51BFA8BEB3B52E44,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f10
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%l6
	set	0x6F, %i3
	ldstuba	[%l7 + %i3] 0x89,	%l5
	set	0x0A, %g7
	ldstuba	[%l7 + %g7] 0x80,	%i3
	nop
	set	0x26, %l3
	ldstub	[%l7 + %l3],	%i2
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x81
	nop
	set	0x37, %g2
	ldstub	[%l7 + %g2],	%g2
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f0
	set	0x08, %o0
	ldxa	[%l7 + %o0] 0x88,	%g1
	nop
	set	0x10, %l4
	std	%i4,	[%l7 + %l4]
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xd2,	%f16
	set	0x0C, %g3
	stha	%i1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x14, %i6
	ldub	[%l7 + %i6],	%l0
	set	0x40, %i1
	prefetcha	[%l7 + %i1] 0x89,	 1
	nop
	set	0x4C, %o1
	stw	%g4,	[%l7 + %o1]
	wr	%o4,	%g7,	%pic
	set	0x20, %g4
	ldxa	[%l7 + %g4] 0x89,	%i0
	nop
	set	0x38, %i0
	std	%o6,	[%l7 + %i0]
	set	0x77, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i7
	set	0x26, %l6
	ldstuba	[%l7 + %l6] 0x88,	%o0
	and	%o2,	%l3,	%g6
	nop
	set	0x58, %g1
	ldsw	[%l7 + %g1],	%l1
	st	%f8,	[%l7 + 0x3C]
	nop
	set	0x4C, %g5
	ldub	[%l7 + %g5],	%o5
	set	0x54, %o7
	sta	%f10,	[%l7 + %o7] 0x81
	wr	%o3,	%o7,	%ccr
	set	0x18, %o2
	stxa	%l2,	[%l7 + %o2] 0xe2
	membar	#Sync
	set	0x18, %o5
	stwa	%g5,	[%l7 + %o5] 0x88
	nop
	set	0x42, %l2
	ldstub	[%l7 + %l2],	%g3
	nop
	set	0x27, %i5
	ldsb	[%l7 + %i5],	%o1
	wr	%i5,	%l6,	%softint
	set	0x68, %o4
	lda	[%l7 + %o4] 0x80,	%f16
	nop
	set	0x5C, %i4
	lduw	[%l7 + %i4],	%l4
	nop
	set	0x50, %l1
	std	%f26,	[%l7 + %l1]
	st	%f16,	[%l7 + 0x6C]
	nop
	set	0x44, %g6
	lduw	[%l7 + %g6],	%l5
	set	0x2C, %i2
	sta	%f30,	[%l7 + %i2] 0x89
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x70, %i3
	stb	%i2,	[%l7 + %i3]
	set	0x30, %g7
	sta	%f1,	[%l7 + %g7] 0x88
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i3
	st	%f19,	[%l7 + 0x30]
	nop
	set	0x65, %o6
	stb	%i4,	[%l7 + %o6]
	and	%g1,	%l0,	%i6
	set	0x40, %o3
	stwa	%i1,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x44, %g2
	ldsw	[%l7 + %g2],	%g4
	nop
	set	0x48, %l3
	swap	[%l7 + %l3],	%o4
	nop
	set	0x70, %l5
	std	%f2,	[%l7 + %l5]
	nop
	set	0x51, %l4
	ldub	[%l7 + %l4],	%i0
	bge,a	%xcc,	loop_85
	ld	[%l7 + 0x58],	%f0
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%g7
	st	%f2,	[%l7 + 0x38]
loop_85:
	st	%fsr,	[%l7 + 0x20]
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0
	nop
	set	0x54, %i6
	stw	%o0,	[%l7 + %i6]
	or	%i7,	%o2,	%l3
	nop
	set	0x6B, %o0
	ldstub	[%l7 + %o0],	%g6
	ld	[%l7 + 0x20],	%f5
	add	%o5,	%o3,	%l1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f16
	st	%fsr,	[%l7 + 0x60]
	bne,pt	%xcc,	loop_86
	nop
	set	0x7C, %g4
	lduw	[%l7 + %g4],	%o7
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x88,	%l2
loop_86:
	nop
	set	0x5E, %o1
	lduh	[%l7 + %o1],	%g5
	set	0x2B, %l6
	stba	%o1,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x89,	 4
	set	0x46, %l0
	ldstuba	[%l7 + %l0] 0x88,	%g3
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%l6
	nop
	set	0x56, %o7
	ldstub	[%l7 + %o7],	%l5
	ld	[%l7 + 0x50],	%f29
	nop
	set	0x48, %o5
	stw	%i2,	[%l7 + %o5]
	fpadd16s	%f30,	%f6,	%f22
	nop
	set	0x71, %o2
	ldstub	[%l7 + %o2],	%l4
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x81,	%g2
	ba,a	%xcc,	loop_87
	st	%f24,	[%l7 + 0x50]
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xc8
loop_87:
	nop
	set	0x68, %l2
	stda	%i4,	[%l7 + %l2] 0x80
	set	0x30, %i4
	prefetcha	[%l7 + %i4] 0x80,	 1
	nop
	set	0x78, %l1
	ldd	[%l7 + %l1],	%f4
	nop
	set	0x41, %i2
	ldstub	[%l7 + %i2],	%i3
	and	%i6,	%l0,	%g4
	nop
	set	0x5E, %i3
	ldub	[%l7 + %i3],	%i1
	ld	[%l7 + 0x44],	%f16
	ld	[%l7 + 0x64],	%f13
	nop
	set	0x58, %g6
	std	%i0,	[%l7 + %g6]
	nop
	set	0x30, %o6
	ldstub	[%l7 + %o6],	%g7
	nop
	set	0x18, %g7
	stw	%o6,	[%l7 + %g7]
	nop
	set	0x23, %o3
	ldsb	[%l7 + %o3],	%o4
	nop
	set	0x38, %g2
	ldsw	[%l7 + %g2],	%i7
	nop
	set	0x50, %l3
	std	%f18,	[%l7 + %l3]
	and	%o2,	%l3,	%g6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%o3
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%f22
	nop
	set	0x20, %l4
	std	%f2,	[%l7 + %l4]
	fpadd16s	%f20,	%f12,	%f2
	set	0x10, %i7
	lda	[%l7 + %i7] 0x88,	%f11
	set	0x4C, %i6
	swapa	[%l7 + %i6] 0x81,	%l1
	nop
	set	0x30, %o0
	std	%f16,	[%l7 + %o0]
	nop
	set	0x48, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x18, %g4
	lduw	[%l7 + %g4],	%o7
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f0
	set	0x48, %i0
	stda	%o0,	[%l7 + %i0] 0x88
	set	0x10, %l6
	swapa	[%l7 + %l6] 0x88,	%l2
	set	0x30, %o1
	stda	%g4,	[%l7 + %o1] 0x80
	set	0x1C, %l0
	sta	%f12,	[%l7 + %l0] 0x88
	fpsub16	%f2,	%f2,	%f4
	set	0x58, %g5
	stwa	%o1,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x38, %g1
	ldstuba	[%l7 + %g1] 0x80,	%i5
	ld	[%l7 + 0x10],	%f2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g3
	nop
	set	0x10, %o7
	ldsh	[%l7 + %o7],	%i2
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x80,	%l4
	st	%fsr,	[%l7 + 0x38]
	set	0x30, %i5
	lda	[%l7 + %i5] 0x88,	%f31
	ld	[%l7 + 0x4C],	%f17
	set	0x1C, %o4
	stwa	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x30, %l2
	prefetch	[%l7 + %l2],	 2
	set	0x08, %i4
	lda	[%l7 + %i4] 0x81,	%f31
	set	0x40, %o2
	stwa	%i4,	[%l7 + %o2] 0x89
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%l5
	nop
	set	0x60, %i3
	ldsh	[%l7 + %i3],	%g1
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%f22
	set	0x44, %o6
	stba	%i3,	[%l7 + %o6] 0xe2
	membar	#Sync
	set	0x78, %g7
	lda	[%l7 + %g7] 0x81,	%f23
	set	0x28, %o3
	lda	[%l7 + %o3] 0x81,	%f1
	nop
	set	0x28, %g2
	stx	%fsr,	[%l7 + %g2]
	bleu,pn	%icc,	loop_88
	st	%f13,	[%l7 + 0x28]
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x18, %i2
	lduw	[%l7 + %i2],	%i6
loop_88:
	nop
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc8
	nop
	set	0x10, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x68, %i7
	std	%f22,	[%l7 + %i7]
	set	0x78, %l4
	stxa	%l0,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x64, %i6
	stha	%i1,	[%l7 + %i6] 0xe2
	membar	#Sync
	ld	[%l7 + 0x60],	%f22
	nop
	set	0x28, %o0
	swap	[%l7 + %o0],	%g4
	set	0x1C, %g3
	lda	[%l7 + %g3] 0x80,	%f12
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%f26
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%g7
	or	%o6,	%i7,	%o4
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x89,	%o2
	nop
	set	0x58, %l6
	std	%g6,	[%l7 + %l6]
	set	0x2A, %o1
	stha	%l3,	[%l7 + %o1] 0x89
	nop
	set	0x54, %l0
	ldsw	[%l7 + %l0],	%o3
	nop
	set	0x20, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x77, %g5
	stb	%o5,	[%l7 + %g5]
	nop
	set	0x60, %g1
	std	%l0,	[%l7 + %g1]
	set	0x58, %o7
	swapa	[%l7 + %o7] 0x89,	%o0
	nop
	set	0x50, %i5
	std	%f20,	[%l7 + %i5]
	set	0x40, %o5
	lda	[%l7 + %o5] 0x88,	%f9
	set	0x5C, %l2
	sta	%f24,	[%l7 + %l2] 0x88
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%l2
	nop
	set	0x48, %o2
	stb	%o7,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x70]
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o1,	%i5
	nop
	set	0x72, %i4
	ldstub	[%l7 + %i4],	%l6
	set	0x20, %g6
	stda	%i2,	[%l7 + %g6] 0x88
	add	%g3,	%l4,	%g2
	set	0x20, %i3
	stxa	%l5,	[%l7 + %i3] 0x89
	nop
	set	0x60, %o6
	ldx	[%l7 + %o6],	%i4
	set	0x66, %o3
	stha	%i3,	[%l7 + %o3] 0x80
	set	0x4F, %g2
	stba	%g1,	[%l7 + %g2] 0x81
	ba,a	%xcc,	loop_89
	wr	%l0,	%i1,	%ccr
	nop
	set	0x4C, %g7
	stw	%i6,	[%l7 + %g7]
	set	0x68, %l3
	sta	%f11,	[%l7 + %l3] 0x88
loop_89:
	nop
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf0,	%f0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x81,	%g4,	%g7
	or	%o6,	%i0,	%i7
	bl	%xcc,	loop_90
	nop
	set	0x38, %i7
	lduh	[%l7 + %i7],	%o2
	nop
	set	0x47, %i2
	ldsb	[%l7 + %i2],	%o4
	st	%f8,	[%l7 + 0x4C]
loop_90:
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f4
	nop
	set	0x3F, %o0
	stb	%l3,	[%l7 + %o0]
	nop
	set	0x48, %l4
	ldsw	[%l7 + %l4],	%o3
	or	%o5,	%l1,	%o0
	nop
	set	0x78, %g4
	std	%l2,	[%l7 + %g4]
	set	0x68, %g3
	stwa	%o7,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x08, %l6
	sta	%f18,	[%l7 + %l6] 0x80
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xe2,	%g4
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x80,	 2
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x88
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f8
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x81,	%g6
	nop
	set	0x18, %o7
	lduh	[%l7 + %o7],	%l6
	set	0x58, %g1
	stwa	%i5,	[%l7 + %g1] 0xeb
	membar	#Sync
	bgu,a	%xcc,	loop_91
	or	%i2,	%g3,	%l4
	nop
	set	0x7E, %o5
	ldsh	[%l7 + %o5],	%g2
	fpsub32	%f16,	%f22,	%f26
loop_91:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x88,	%l5,	%i4
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x89,	%g1
	and	%i3,	%l0,	%i6
	nop
	set	0x3C, %o4
	swap	[%l7 + %o4],	%i1
	nop
	set	0x28, %l2
	prefetch	[%l7 + %l2],	 1
	set	0x6C, %l1
	swapa	[%l7 + %l1] 0x80,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g7,	%o6
	set	0x08, %o2
	stxa	%i0,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x34, %i4
	ldsw	[%l7 + %i4],	%i7
	nop
	set	0x68, %i3
	stw	%o2,	[%l7 + %i3]
	fpsub32	%f14,	%f28,	%f0
	nop
	set	0x6C, %o6
	lduw	[%l7 + %o6],	%o4
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f22
	set	0x0B, %g2
	stba	%o3,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x68, %g6
	stda	%o4,	[%l7 + %g6] 0x80
	nop
	set	0x2B, %g7
	ldub	[%l7 + %g7],	%l1
	nop
	set	0x28, %l5
	lduw	[%l7 + %l5],	%o0
	set	0x70, %i7
	stda	%l2,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%o7
	set	0x48, %l3
	stda	%g4,	[%l7 + %l3] 0x80
	nop
	set	0x60, %o0
	std	%f4,	[%l7 + %o0]
	st	%f22,	[%l7 + 0x64]
	nop
	set	0x4C, %i6
	lduw	[%l7 + %i6],	%l3
	nop
	set	0x44, %l4
	ldsh	[%l7 + %l4],	%g6
	set	0x58, %g3
	stha	%o1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%i5
	nop
	set	0x30, %i0
	stw	%l6,	[%l7 + %i0]
	nop
	set	0x3C, %g4
	lduw	[%l7 + %g4],	%g3
	nop
	set	0x36, %i1
	lduh	[%l7 + %i1],	%l4
	nop
	set	0x58, %g5
	ldsw	[%l7 + %g5],	%i2
	ld	[%l7 + 0x50],	%f17
	ld	[%l7 + 0x10],	%f10
	set	0x44, %o1
	stba	%l5,	[%l7 + %o1] 0xeb
	membar	#Sync
	ld	[%l7 + 0x74],	%f10
	wr 	%g0, 	0x6, 	%fprs
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd2,	%f16
	fpsub32	%f18,	%f14,	%f14
	nop
	set	0x30, %g1
	std	%f24,	[%l7 + %g1]
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f2
	st	%f11,	[%l7 + 0x18]
	and	%g2,	%l0,	%i6
	set	0x30, %o5
	stwa	%i3,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x74, %i5
	prefetch	[%l7 + %i5],	 4
	nop
	nop
	setx	0xD497E125,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x92AF70A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f21,	%f9
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%g7
	add	%o6,	%i0,	%i7
	set	0x4C, %o4
	swapa	[%l7 + %o4] 0x88,	%o2
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x80,	 1
	set	0x20, %o2
	ldxa	[%l7 + %o2] 0x80,	%g4
	nop
	set	0x4B, %l2
	ldsb	[%l7 + %l2],	%o3
	nop
	set	0x60, %i3
	ldsh	[%l7 + %i3],	%o5
	nop
	set	0x68, %i4
	std	%f24,	[%l7 + %i4]
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f26
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l1
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x81,	 2
	nop
	set	0x30, %g6
	swap	[%l7 + %g6],	%g5
	add	%l3,	%g6,	%o1
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%i5
	or	%o7,	%l6,	%g3
	or	%l4,	%l5,	%i4
	nop
	set	0x3C, %l5
	stw	%i2,	[%l7 + %l5]
	set	0x60, %i7
	stba	%g1,	[%l7 + %i7] 0xeb
	membar	#Sync
	wr	%l0,	%g2,	%y
	nop
	set	0x08, %i2
	swap	[%l7 + %i2],	%i6
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x88,	%f25
	set	0x34, %o0
	sta	%f10,	[%l7 + %o0] 0x81
	and	%i3,	%g7,	%i1
	set	0x70, %i6
	stda	%i0,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x14, %l3
	stha	%o6,	[%l7 + %l3] 0xe2
	membar	#Sync
	and	%i7,	%o2,	%o4
	fpsub32s	%f16,	%f31,	%f8
	nop
	set	0x7D, %l4
	ldub	[%l7 + %l4],	%o3
	nop
	set	0x36, %g3
	ldsh	[%l7 + %g3],	%o5
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x60, %i0
	std	%g4,	[%l7 + %i0]
	set	0x48, %l6
	ldxa	[%l7 + %l6] 0x89,	%l1
	nop
	set	0x3A, %g4
	stb	%o0,	[%l7 + %g4]
	and	%l2,	%g5,	%g6
	set	0x08, %g5
	lda	[%l7 + %g5] 0x88,	%f6
	nop
	set	0x0C, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x70, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf8
	membar	#Sync
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x10, %o5
	stx	%o1,	[%l7 + %o5]
	nop
	set	0x60, %l0
	ldx	[%l7 + %l0],	%l3
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%i5
	set	0x70, %o4
	ldda	[%l7 + %o4] 0x80,	%o6
	nop
	set	0x20, %o2
	lduw	[%l7 + %o2],	%l6
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %l2
	stxa	%l4,	[%l7 + %l2] 0x80
	nop
	set	0x4E, %i3
	ldsh	[%l7 + %i3],	%g3
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%l5
	set	0x38, %i4
	stxa	%i4,	[%l7 + %i4] 0x80
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%l0
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xd8
	nop
	set	0x1D, %o6
	ldstub	[%l7 + %o6],	%g2
	ld	[%l7 + 0x08],	%f17
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x88,	 1
	nop
	set	0x7A, %l5
	ldsh	[%l7 + %l5],	%i6
	nop
	set	0x38, %g7
	std	%f22,	[%l7 + %g7]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%i1
	set	0x70, %i7
	stda	%i2,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%f16
	nop
	set	0x18, %o0
	ldsh	[%l7 + %o0],	%o6
	st	%fsr,	[%l7 + 0x48]
	st	%fsr,	[%l7 + 0x1C]
	set	0x48, %i6
	stxa	%i7,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xda,	%f0
	add	%i0,	%o2,	%o4
	nop
	set	0x34, %l3
	swap	[%l7 + %l3],	%o5
	set	0x78, %g3
	stxa	%g4,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x4C, %l4
	lda	[%l7 + %l4] 0x80,	%f29
	set	0x40, %i0
	stda	%o2,	[%l7 + %i0] 0x88
	nop
	set	0x2B, %g4
	ldub	[%l7 + %g4],	%l1
	nop
	set	0x14, %l6
	ldsb	[%l7 + %l6],	%o0
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%l2
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x88,	 4
	nop
	set	0x5C, %g5
	prefetch	[%l7 + %g5],	 3
	or	%o1,	%g5,	%l3
	set	0x1C, %g1
	stha	%i5,	[%l7 + %g1] 0xeb
	membar	#Sync
	st	%f11,	[%l7 + 0x24]
	fpadd32	%f24,	%f22,	%f22
	st	%fsr,	[%l7 + 0x24]
	set	0x68, %i1
	swapa	[%l7 + %i1] 0x89,	%o7
	set	0x20, %o5
	stda	%i6,	[%l7 + %o5] 0x81
	nop
	set	0x7A, %l0
	ldstub	[%l7 + %l0],	%g3
	set	0x70, %o4
	ldda	[%l7 + %o4] 0xe3,	%l4
	set	0x38, %o2
	ldxa	[%l7 + %o2] 0x80,	%l5
	bl,a	%xcc,	loop_92
	nop
	set	0x2F, %l2
	ldsb	[%l7 + %l2],	%g1
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x28, %i5
	ldsh	[%l7 + %i5],	%i4
loop_92:
	nop
	set	0x60, %i3
	ldsw	[%l7 + %i3],	%g2
	nop
	set	0x66, %i4
	sth	%l0,	[%l7 + %i4]
	nop
	set	0x30, %g2
	std	%i6,	[%l7 + %g2]
	nop
	set	0x0A, %o6
	ldsh	[%l7 + %o6],	%g7
	set	0x2A, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i1
	nop
	set	0x48, %l5
	stw	%i2,	[%l7 + %l5]
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x88,	%o6
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x20, %g6
	sta	%f9,	[%l7 + %g6] 0x80
	ld	[%l7 + 0x0C],	%f1
	set	0x30, %i2
	stha	%i7,	[%l7 + %i2] 0xe3
	membar	#Sync
	fpadd32s	%f6,	%f16,	%f22
	or	%i0,	%i3,	%o2
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%o5
	fpadd16s	%f0,	%f31,	%f8
	nop
	set	0x27, %o3
	ldstub	[%l7 + %o3],	%o4
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%o3
	nop
	set	0x3C, %o0
	sth	%g4,	[%l7 + %o0]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xeb,	%l0
	or	%o0,	%l2,	%o1
	nop
	set	0x74, %g3
	stw	%g5,	[%l7 + %g3]
	add	%l3,	%g6,	%o7
	nop
	set	0x26, %g4
	lduh	[%l7 + %g4],	%i5
	nop
	set	0x5D, %i0
	ldub	[%l7 + %i0],	%g3
	or	%l6,	%l4,	%g1
	nop
	set	0x54, %l6
	swap	[%l7 + %l6],	%l5
	and	%i4,	%g2,	%i6
	nop
	set	0x38, %o1
	swap	[%l7 + %o1],	%g7
	set	0x2C, %o7
	stba	%i1,	[%l7 + %o7] 0x88
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	set	0x0B, %i1
	ldstuba	[%l7 + %i1] 0x89,	%i2
	nop
	nop
	setx	0x0750BB3BD75A802C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x26A1D1479930BE66,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f4
	set	0x30, %g1
	stha	%l0,	[%l7 + %g1] 0x80
	nop
	nop
	setx	0x4A3A9A92,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xB3B652D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f7,	%f29
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f0
	add	%o6,	%i0,	%i3
	nop
	set	0x20, %o4
	stx	%i7,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x48]
	nop
	nop
	setx	0xBD75D0E2FF52FA36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA794885AC33B2447,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f30
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x80,	%o5
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x88,	%o2
	fpsub32s	%f15,	%f30,	%f27
	bg,a,pn	%xcc,	loop_93
	nop
	set	0x38, %l2
	lduw	[%l7 + %l2],	%o3
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%o4
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%l1
loop_93:
	bn,pn	%xcc,	loop_94
	nop
	set	0x08, %i4
	stx	%g4,	[%l7 + %i4]
	add	%o0,	%l2,	%g5
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xd0
loop_94:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x81,	%o1,	%g6
	nop
	set	0x68, %l1
	lduh	[%l7 + %l1],	%l3
	set	0x0C, %g2
	lda	[%l7 + %g2] 0x89,	%f23
	nop
	set	0x7D, %l5
	stb	%o7,	[%l7 + %l5]
	nop
	set	0x35, %g7
	ldub	[%l7 + %g7],	%i5
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xca
	and	%g3,	%l6,	%l4
	nop
	set	0x69, %g6
	ldub	[%l7 + %g6],	%l5
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%g2
	st	%f12,	[%l7 + 0x14]
	ld	[%l7 + 0x54],	%f17
	nop
	set	0x0F, %i2
	ldstub	[%l7 + %i2],	%i6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x80
	set	0x30, %l3
	stwa	%g7,	[%l7 + %l3] 0x88
	nop
	set	0x60, %i6
	ldd	[%l7 + %i6],	%f30
	nop
	set	0x0C, %o0
	swap	[%l7 + %o0],	%i4
	set	0x10, %g3
	stda	%i0,	[%l7 + %g3] 0x88
	set	0x44, %g4
	swapa	[%l7 + %g4] 0x81,	%i2
	nop
	set	0x44, %i0
	lduw	[%l7 + %i0],	%o6
	or	%l0,	%i3,	%i0
	bge	%icc,	loop_95
	wr	%o5,	%o2,	%y
	nop
	set	0x28, %l6
	ldub	[%l7 + %l6],	%i7
	set	0x6C, %l4
	sta	%f2,	[%l7 + %l4] 0x81
loop_95:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%o4
	wr	%l1,	%g4,	%y
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf1
	membar	#Sync
	nop
	set	0x4E, %g5
	ldsh	[%l7 + %g5],	%l2
	set	0x40, %i1
	swapa	[%l7 + %i1] 0x89,	%o0
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x80,	 4
	nop
	nop
	setx	0x98BB79EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xCCD5F4EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f19,	%f18
	set	0x44, %l0
	stwa	%g6,	[%l7 + %l0] 0xe2
	membar	#Sync
	or	%o1,	%l3,	%i5
	set	0x28, %o7
	stba	%g3,	[%l7 + %o7] 0x81
	set	0x68, %o4
	prefetcha	[%l7 + %o4] 0x81,	 4
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%o7
	set	0x50, %l2
	sta	%f26,	[%l7 + %l2] 0x81
	st	%fsr,	[%l7 + 0x5C]
	set	0x29, %i5
	stba	%l5,	[%l7 + %i5] 0x88
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x88,	%g1
	and	%g2,	%l4,	%g7
	set	0x10, %i3
	stda	%i6,	[%l7 + %i3] 0x89
	add	%i1,	%i4,	%o6
	st	%fsr,	[%l7 + 0x34]
	add	%i2,	%l0,	%i0
	bn,a,pn	%xcc,	loop_96
	nop
	set	0x1C, %o6
	lduh	[%l7 + %o6],	%i3
	nop
	set	0x3C, %l1
	ldsb	[%l7 + %l1],	%o2
	nop
	nop
	setx	0x89126A9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x9111B9CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f15,	%f28
loop_96:
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%o5
	nop
	set	0x18, %l5
	stx	%o3,	[%l7 + %l5]
	set	0x74, %i4
	lda	[%l7 + %i4] 0x89,	%f26
	or	%i7,	%l1,	%o4
	nop
	set	0x58, %i7
	ldd	[%l7 + %i7],	%g4
	nop
	set	0x2C, %g7
	lduh	[%l7 + %g7],	%l2
	and	%g5,	%o0,	%o1
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%l3
	set	0x6C, %o3
	lda	[%l7 + %o3] 0x80,	%f16
	nop
	set	0x08, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %i6
	stda	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	bgu,a	%xcc,	loop_97
	add	%g3,	%i5,	%l6
	nop
	set	0x58, %o0
	lduw	[%l7 + %o0],	%l5
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%g1
loop_97:
	nop
	set	0x3B, %g4
	ldsb	[%l7 + %g4],	%o7
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x969, 	%tick_cmpr
	be,a	%icc,	loop_98
	nop
	set	0x27, %i0
	ldub	[%l7 + %i0],	%g7
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f12
	nop
	set	0x4D, %l6
	ldsb	[%l7 + %l6],	%i1
loop_98:
	nop
	set	0x51, %o1
	ldstub	[%l7 + %o1],	%i6
	nop
	set	0x6B, %g5
	ldstub	[%l7 + %g5],	%i4
	set	0x08, %i1
	stba	%i2,	[%l7 + %i1] 0x80
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%l0
	nop
	set	0x66, %g1
	ldub	[%l7 + %g1],	%i0
	st	%fsr,	[%l7 + 0x48]
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	or	%i3,	%o5,	%o2
	nop
	set	0x19, %o4
	stb	%i7,	[%l7 + %o4]
	nop
	set	0x2A, %o5
	ldsb	[%l7 + %o5],	%o3
	nop
	set	0x72, %l0
	ldub	[%l7 + %l0],	%o4
	nop
	set	0x6A, %i5
	stb	%l1,	[%l7 + %i5]
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g5
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%l2
	set	0x5C, %l2
	swapa	[%l7 + %l2] 0x89,	%o1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%o0
	nop
	set	0x28, %i3
	std	%f6,	[%l7 + %i3]
	set	0x10, %l1
	lda	[%l7 + %l1] 0x88,	%f8
	nop
	set	0x1E, %g2
	stb	%g6,	[%l7 + %g2]
	nop
	set	0x52, %l5
	ldsh	[%l7 + %l5],	%g3
	nop
	set	0x64, %o6
	prefetch	[%l7 + %o6],	 0
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x89,	%l6
	or	%i5,	%l5,	%o7
	st	%f15,	[%l7 + 0x20]
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%g0
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%g2
	nop
	set	0x74, %l3
	stw	%g7,	[%l7 + %l3]
	nop
	set	0x6C, %i6
	sth	%l4,	[%l7 + %i6]
	set	0x24, %o3
	stha	%i6,	[%l7 + %o3] 0x80
	st	%f10,	[%l7 + 0x14]
	fpadd16s	%f9,	%f14,	%f8
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%i4
	nop
	set	0x5D, %g4
	ldub	[%l7 + %g4],	%i2
	or	%i1,	%o6,	%l0
	or	%i3,	%o5,	%i0
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%i7
	st	%f8,	[%l7 + 0x6C]
	or	%o3,	%o2,	%o4
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x88
	nop
	set	0x0E, %i0
	lduh	[%l7 + %i0],	%l1
	add	%g5,	%g4,	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l3,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o1,	%g3
	nop
	set	0x14, %l6
	sth	%g6,	[%l7 + %l6]
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%f22
	ld	[%l7 + 0x24],	%f11
	nop
	set	0x4E, %l4
	ldsh	[%l7 + %l4],	%l6
	bn,a,pn	%icc,	loop_99
	nop
	set	0x34, %i1
	sth	%l5,	[%l7 + %i1]
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf9
	membar	#Sync
loop_99:
	ld	[%l7 + 0x74],	%f19
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%i4
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f14
	set	0x48, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	nop
	set	0x0C, %l0
	lduh	[%l7 + %l0],	%o7
	or	%g2,	%g7,	%i6
	set	0x28, %o5
	prefetcha	[%l7 + %o5] 0x81,	 2
	set	0x08, %i5
	stxa	%l4,	[%l7 + %i5] 0x81
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%o6
	st	%f25,	[%l7 + 0x2C]
	nop
	set	0x4E, %o2
	lduh	[%l7 + %o2],	%l0
	nop
	set	0x60, %l2
	swap	[%l7 + %l2],	%i1
	set	0x20, %i3
	stda	%i2,	[%l7 + %i3] 0x89
	set	0x20, %l1
	ldxa	[%l7 + %l1] 0x81,	%o5
	set	0x0E, %g2
	stha	%i0,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x38, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x1C, %l5
	sth	%o2,	[%l7 + %l5]
	nop
	set	0x2A, %i7
	stb	%o3,	[%l7 + %i7]
	add	%l1,	%o4,	%g5
	add	%g4,	%l2,	%o0
	nop
	set	0x4C, %g6
	ldstub	[%l7 + %g6],	%o1
	nop
	set	0x2C, %i4
	stw	%l3,	[%l7 + %i4]
	set	0x50, %l3
	stda	%g6,	[%l7 + %l3] 0x88
	nop
	set	0x18, %i6
	prefetch	[%l7 + %i6],	 4
	and	%l6,	%g3,	%l5
	nop
	set	0x32, %g7
	sth	%i5,	[%l7 + %g7]
	nop
	set	0x1B, %g3
	ldsb	[%l7 + %g3],	%o7
	st	%f22,	[%l7 + 0x4C]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%g2
	set	0x28, %o3
	ldxa	[%l7 + %o3] 0x80,	%g7
	st	%fsr,	[%l7 + 0x30]
	ld	[%l7 + 0x78],	%f10
	st	%f14,	[%l7 + 0x68]
	set	0x30, %g4
	stda	%i4,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x10, %o0
	std	%f12,	[%l7 + %o0]
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x88,	%l4
	nop
	set	0x20, %l6
	ldstub	[%l7 + %l6],	%i2
	nop
	set	0x60, %i2
	swap	[%l7 + %i2],	%i6
	set	0x1C, %o1
	stwa	%o6,	[%l7 + %o1] 0x89
	nop
	set	0x2C, %l4
	stw	%i1,	[%l7 + %l4]
	set	0x30, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l0
	nop
	set	0x1C, %g5
	swap	[%l7 + %g5],	%o5
	set	0x30, %o4
	stxa	%i3,	[%l7 + %o4] 0x80
	bgu,pt	%icc,	loop_100
	and	%i7,	%i0,	%o3
	nop
	set	0x5E, %g1
	ldsh	[%l7 + %g1],	%l1
	nop
	set	0x4C, %o7
	swap	[%l7 + %o7],	%o2
loop_100:
	nop
	set	0x50, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x3C, %l0
	stba	%g5,	[%l7 + %l0] 0xe2
	membar	#Sync
	and	%o4,	%g4,	%o0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x80
	nop
	set	0x38, %l2
	std	%o0,	[%l7 + %l2]
	nop
	set	0x4E, %i3
	lduh	[%l7 + %i3],	%l3
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xea,	%l2
	set	0x54, %g2
	stwa	%l6,	[%l7 + %g2] 0x80
	nop
	set	0x0C, %o6
	lduh	[%l7 + %o6],	%g6
	set	0x78, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l5
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f28
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%g2
	set	0x54, %i4
	stha	%o7,	[%l7 + %i4] 0x81
	bl,a,pn	%xcc,	loop_101
	nop
	set	0x58, %l3
	ldsh	[%l7 + %l3],	%g1
	nop
	set	0x4C, %i6
	lduw	[%l7 + %i6],	%i5
	nop
	set	0x44, %i7
	swap	[%l7 + %i7],	%g2
loop_101:
	ld	[%l7 + 0x24],	%f8
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x5C, %o3
	ldstuba	[%l7 + %o3] 0x80,	%i4
	nop
	set	0x30, %g7
	ldx	[%l7 + %g7],	%l4
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%i2
	set	0x68, %i0
	stda	%g6,	[%l7 + %i0] 0x81
	or	%i6,	%o6,	%l0
	set	0x60, %l6
	stwa	%i1,	[%l7 + %l6] 0x81
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%i7
	set	0x1B, %o0
	stba	%i3,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x89,	 4
	nop
	set	0x64, %i2
	lduw	[%l7 + %i2],	%l1
	nop
	set	0x68, %l4
	std	%o2,	[%l7 + %l4]
	nop
	set	0x60, %g5
	std	%g4,	[%l7 + %g5]
	nop
	set	0x58, %i1
	stb	%o3,	[%l7 + %i1]
	nop
	set	0x58, %g1
	stx	%g4,	[%l7 + %g1]
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f16
	nop
	set	0x64, %o7
	ldsw	[%l7 + %o7],	%o0
	set	0x6E, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o4
	nop
	set	0x78, %o5
	ldd	[%l7 + %o5],	%l2
	and	%l2,	%l6,	%o1
	st	%f31,	[%l7 + 0x08]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%l4
	nop
	set	0x38, %i3
	prefetch	[%l7 + %i3],	 3
	or	%g6,	%g3,	%g1
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%i4
	set	0x2D, %l1
	ldstuba	[%l7 + %l1] 0x88,	%o7
	nop
	set	0x74, %g2
	prefetch	[%l7 + %g2],	 0
	st	%fsr,	[%l7 + 0x30]
	or	%i4,	%l4,	%i2
	nop
	set	0x70, %o2
	lduw	[%l7 + %o2],	%g2
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x81
	nop
	set	0x6C, %l5
	stb	%g7,	[%l7 + %l5]
	nop
	set	0x70, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x30, %g6
	std	%f16,	[%l7 + %g6]
	nop
	set	0x38, %l3
	std	%o6,	[%l7 + %l3]
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x89,	%l0
	set	0x70, %i6
	swapa	[%l7 + %i6] 0x81,	%i1
	nop
	set	0x4D, %g3
	stb	%o5,	[%l7 + %g3]
	set	0x4C, %o3
	stha	%i6,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x5C, %g7
	swap	[%l7 + %g7],	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x80,	%i3,	%l1
	set	0x54, %i0
	stwa	%o2,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x165FF1DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xEEFBF899,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f8,	%f18
	st	%f7,	[%l7 + 0x30]
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%i0
	ld	[%l7 + 0x4C],	%f6
	nop
	nop
	setx	0xEDE68929,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xBC153E60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f13,	%f26
	st	%f9,	[%l7 + 0x34]
	set	0x60, %l6
	sta	%f23,	[%l7 + %l6] 0x80
	nop
	set	0x1C, %o1
	ldsh	[%l7 + %o1],	%o3
	bne	%xcc,	loop_102
	add	%g5,	%o0,	%o4
	fpadd32s	%f25,	%f17,	%f12
	set	0x50, %o0
	ldda	[%l7 + %o0] 0xeb,	%g4
loop_102:
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%l2
	or	%l6,	%o1,	%l5
	nop
	set	0x18, %g5
	prefetch	[%l7 + %g5],	 4
	set	0x78, %i1
	stda	%g6,	[%l7 + %i1] 0x80
	wr	%g3,	%l2,	%clear_softint
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xcc
	set	0x30, %o4
	lda	[%l7 + %o4] 0x81,	%f15
	set	0x6C, %i2
	swapa	[%l7 + %i2] 0x88,	%i5
	nop
	set	0x38, %o7
	std	%f20,	[%l7 + %o7]
	ld	[%l7 + 0x70],	%f17
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x88,	%o7
	nop
	set	0x7A, %l0
	ldsh	[%l7 + %l0],	%i4
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%l4
	set	0x38, %i5
	stda	%i2,	[%l7 + %i5] 0x80
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x10, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g1
	wr	%o6,	%l0,	%ccr
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%g7
	ld	[%l7 + 0x08],	%f30
	st	%fsr,	[%l7 + 0x2C]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd0,	%f0
	nop
	set	0x38, %o6
	stw	%o5,	[%l7 + %o6]
	nop
	set	0x54, %l5
	lduw	[%l7 + %l5],	%i6
	nop
	set	0x14, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x20, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x20, %i7
	std	%f16,	[%l7 + %i7]
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%i0
	wr	%i3,	%i7,	%softint
	nop
	set	0x61, %g3
	ldsb	[%l7 + %g3],	%l1
	set	0x68, %g7
	swapa	[%l7 + %g7] 0x88,	%o2
	set	0x34, %i0
	lda	[%l7 + %i0] 0x89,	%f17
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x88,	%o2
	st	%fsr,	[%l7 + 0x28]
	set	0x68, %l6
	stxa	%g5,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x81,	%o4,	%i0
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%g4
	set	0x6C, %o3
	stwa	%l6,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x30, %l4
	sta	%f28,	[%l7 + %l4] 0x88
	ld	[%l7 + 0x60],	%f16
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%l5
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	nop
	set	0x0F, %g1
	stb	%g6,	[%l7 + %g1]
	set	0x2A, %o4
	stha	%g3,	[%l7 + %o4] 0xe2
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%l3
	nop
	set	0x2C, %g5
	ldsh	[%l7 + %g5],	%i5
	nop
	set	0x3C, %i2
	sth	%i4,	[%l7 + %i2]
	set	0x1C, %o7
	stwa	%l4,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xca
	set	0x10, %l0
	sta	%f0,	[%l7 + %l0] 0x81
	set	0x60, %i3
	ldda	[%l7 + %i3] 0xe3,	%o6
	nop
	set	0x30, %l2
	stx	%i2,	[%l7 + %l2]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x15F, 	%sys_tick_cmpr
	nop
	set	0x12, %l1
	ldstub	[%l7 + %l1],	%o6
	set	0x48, %i5
	sta	%f3,	[%l7 + %i5] 0x80
	set	0x30, %g2
	ldxa	[%l7 + %g2] 0x80,	%l0
	nop
	set	0x0C, %o2
	ldub	[%l7 + %o2],	%g7
	nop
	set	0x62, %o6
	sth	%i6,	[%l7 + %o6]
	nop
	set	0x68, %i4
	swap	[%l7 + %i4],	%i1
	set	0x10, %g6
	swapa	[%l7 + %g6] 0x88,	%i3
	nop
	set	0x65, %l5
	ldstub	[%l7 + %l5],	%i7
	add	%l1,	%o2,	%o5
	fpsub32	%f12,	%f14,	%f26
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xda,	%f16
	nop
	set	0x08, %i6
	ldx	[%l7 + %i6],	%g5
	st	%f9,	[%l7 + 0x18]
	nop
	set	0x0C, %l3
	swap	[%l7 + %l3],	%o3
	set	0x7E, %g7
	stha	%o4,	[%l7 + %g7] 0x80
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x38, %g3
	stx	%fsr,	[%l7 + %g3]
	fpadd16	%f30,	%f16,	%f22
	set	0x54, %i0
	stha	%o0,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x17, %g4
	stba	%i0,	[%l7 + %g4] 0x81
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd0
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x88,	 3
	nop
	set	0x65, %l6
	ldstub	[%l7 + %l6],	%o1
	nop
	set	0x41, %l4
	stb	%l5,	[%l7 + %l4]
	ld	[%l7 + 0x28],	%f13
	nop
	set	0x58, %o3
	std	%g6,	[%l7 + %o3]
	set	0x0C, %i1
	lda	[%l7 + %i1] 0x81,	%f31
	nop
	set	0x50, %o4
	stw	%g3,	[%l7 + %o4]
	set	0x66, %g5
	stha	%l2,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x58, %i2
	lda	[%l7 + %i2] 0x89,	%f24
	ld	[%l7 + 0x68],	%f16
	bne,pt	%xcc,	loop_103
	fpadd32s	%f2,	%f20,	%f31
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%l6
	set	0x24, %o7
	lda	[%l7 + %o7] 0x81,	%f31
loop_103:
	bne,a,pn	%icc,	loop_104
	nop
	set	0x5A, %o5
	ldsh	[%l7 + %o5],	%i5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l3,	%i4
loop_104:
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%l4
	set	0x38, %l2
	lda	[%l7 + %l2] 0x81,	%f22
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x80,	%i2,	%g1
	set	0x2C, %l0
	sta	%f21,	[%l7 + %l0] 0x89
	nop
	set	0x20, %l1
	std	%f8,	[%l7 + %l1]
	set	0x50, %i5
	stwa	%g2,	[%l7 + %i5] 0xea
	membar	#Sync
	nop
	set	0x7A, %o2
	ldub	[%l7 + %o2],	%o6
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%l0
	fpadd32s	%f27,	%f2,	%f25
	nop
	set	0x20, %i4
	ldx	[%l7 + %i4],	%o7
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f16
	nop
	set	0x4B, %l5
	stb	%g7,	[%l7 + %l5]
	nop
	set	0x10, %i7
	stx	%i1,	[%l7 + %i7]
	or	%i6,	%i3,	%l1
	nop
	set	0x30, %i6
	stw	%i7,	[%l7 + %i6]
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%o2
	nop
	set	0x60, %o6
	ldsh	[%l7 + %o6],	%g5
	set	0x30, %g3
	lda	[%l7 + %g3] 0x81,	%f4
	add	%o5,	%o3,	%o4
	or	%i0,	%g4,	%o1
	st	%fsr,	[%l7 + 0x40]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%g6
	nop
	set	0x68, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x4C, %i0
	ldsb	[%l7 + %i0],	%l5
	set	0x64, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g3
	nop
	set	0x11, %o0
	ldub	[%l7 + %o0],	%l2
	nop
	set	0x44, %l6
	swap	[%l7 + %l6],	%i5
	nop
	set	0x48, %l4
	prefetch	[%l7 + %l4],	 0
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%l3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd8,	%f16
	wr 	%g0, 	0x7, 	%fprs
	or	%i2,	%l4,	%g1
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%o6
	set	0x2C, %o3
	swapa	[%l7 + %o3] 0x81,	%g2
	wr	%l0,	%g7,	%set_softint
	set	0x60, %i2
	swapa	[%l7 + %i2] 0x80,	%i1
	st	%fsr,	[%l7 + 0x34]
	set	0x64, %g5
	lda	[%l7 + %g5] 0x88,	%f4
	nop
	set	0x38, %g1
	std	%f10,	[%l7 + %g1]
	set	0x74, %o7
	sta	%f29,	[%l7 + %o7] 0x88
	nop
	set	0x71, %i3
	ldub	[%l7 + %i3],	%o7
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%i6
	fpsub16s	%f24,	%f8,	%f3
	ld	[%l7 + 0x20],	%f29
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x89,	%i3
	wr	%l1,	%i7,	%pic
	set	0x10, %o5
	stxa	%o2,	[%l7 + %o5] 0x89
	and	%o5,	%g5,	%o4
	st	%f9,	[%l7 + 0x08]
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%o2
	nop
	set	0x28, %o2
	std	%f24,	[%l7 + %o2]
	nop
	set	0x3C, %i5
	ldub	[%l7 + %i5],	%g4
	set	0x4C, %i4
	stwa	%i0,	[%l7 + %i4] 0xea
	membar	#Sync
	nop
	set	0x3C, %g6
	ldub	[%l7 + %g6],	%o1
	and	%o0,	%g6,	%g3
	nop
	set	0x18, %g2
	stw	%l2,	[%l7 + %g2]
	nop
	set	0x70, %i7
	stx	%l5,	[%l7 + %i7]
	set	0x60, %l5
	stda	%l2,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x58, %i6
	sth	%l6,	[%l7 + %i6]
	set	0x14, %l3
	swapa	[%l7 + %l3] 0x89,	%i4
	nop
	set	0x12, %g3
	sth	%i2,	[%l7 + %g3]
	set	0x79, %g7
	stba	%l4,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x48, %o6
	ldxa	[%l7 + %o6] 0x89,	%g1
	nop
	set	0x18, %o1
	std	%f0,	[%l7 + %o1]
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x88,	 3
	set	0x08, %o0
	stda	%i4,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x0E, %l6
	lduh	[%l7 + %l6],	%g2
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc0
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	set	0x7C, %o4
	stha	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x30, %o3
	std	%f28,	[%l7 + %o3]
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
	nop
	set	0x72, %i2
	sth	%i1,	[%l7 + %i2]
	nop
	set	0x3B, %g1
	ldsb	[%l7 + %g1],	%g7
	nop
	set	0x50, %g5
	lduw	[%l7 + %g5],	%i6
	set	0x6C, %i3
	lda	[%l7 + %i3] 0x89,	%f6
	set	0x46, %l2
	stba	%o7,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd8,	%f0
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x6B, %l1
	ldsb	[%l7 + %l1],	%i3
	fpadd32s	%f26,	%f12,	%f9
	wr	%i7,	%l1,	%sys_tick
	nop
	set	0x38, %o2
	swap	[%l7 + %o2],	%o5
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xe3,	%g4
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f8
	st	%f4,	[%l7 + 0x0C]
	nop
	set	0x48, %g6
	ldsh	[%l7 + %g6],	%o4
	set	0x58, %o7
	stda	%o2,	[%l7 + %o7] 0x88
	bne,a	%xcc,	loop_105
	nop
	set	0x35, %i7
	ldsb	[%l7 + %i7],	%o2
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x80,	%i0
loop_105:
	nop
	set	0x29, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o1
	nop
	set	0x70, %l5
	ldx	[%l7 + %l5],	%g4
	and	%g6,	%g3,	%o0
	fpadd32	%f26,	%f18,	%f20
	nop
	set	0x34, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x60, %g3
	stda	%l4,	[%l7 + %g3] 0xe3
	membar	#Sync
	nop
	set	0x20, %g7
	swap	[%l7 + %g7],	%l3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd0,	%f16
	set	0x70, %o1
	swapa	[%l7 + %o1] 0x80,	%l6
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f8
	and	%l2,	%i4,	%l4
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%g1
	add	%o6,	%i2,	%g2
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	nop
	set	0x7C, %i1
	ldub	[%l7 + %i1],	%l0
	set	0x68, %o4
	ldxa	[%l7 + %o4] 0x89,	%i5
	set	0x38, %o3
	ldstuba	[%l7 + %o3] 0x88,	%g7
	nop
	set	0x4C, %i0
	swap	[%l7 + %i0],	%i1
	set	0x3D, %i2
	stba	%i6,	[%l7 + %i2] 0x88
	nop
	set	0x70, %g1
	ldx	[%l7 + %g1],	%i3
	ld	[%l7 + 0x68],	%f8
	st	%f26,	[%l7 + 0x54]
	nop
	set	0x67, %l4
	ldub	[%l7 + %l4],	%o7
	ble,a	%icc,	loop_106
	st	%f2,	[%l7 + 0x60]
	wr	%i7,	%l1,	%pic
	nop
	set	0x7A, %i3
	ldsb	[%l7 + %i3],	%o5
loop_106:
	nop
	set	0x2D, %g5
	ldstub	[%l7 + %g5],	%g5
	nop
	set	0x5A, %l2
	lduh	[%l7 + %l2],	%o4
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%o2
	nop
	set	0x34, %l1
	prefetch	[%l7 + %l1],	 3
	nop
	set	0x28, %o2
	std	%o2,	[%l7 + %o2]
	nop
	set	0x71, %o5
	ldub	[%l7 + %o5],	%o1
	nop
	set	0x08, %i5
	swap	[%l7 + %i5],	%i0
	set	0x47, %g6
	stba	%g4,	[%l7 + %g6] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x08]
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xea,	%g2
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x81,	 4
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%l5
	nop
	set	0x70, %i7
	lduw	[%l7 + %i7],	%l3
	set	0x7A, %l5
	stha	%l6,	[%l7 + %l5] 0xeb
	membar	#Sync
	nop
	set	0x20, %l3
	stx	%l2,	[%l7 + %l3]
	set	0x68, %i6
	stda	%o0,	[%l7 + %i6] 0x88
	set	0x58, %g3
	stwa	%i4,	[%l7 + %g3] 0x80
	nop
	set	0x40, %g7
	lduw	[%l7 + %g7],	%l4
	add	%o6,	%g1,	%g2
	wr	%l0,	%i5,	%set_softint
	nop
	set	0x30, %o1
	stx	%g7,	[%l7 + %o1]
	nop
	set	0x3C, %o6
	ldsh	[%l7 + %o6],	%i2
	nop
	set	0x68, %o0
	std	%i0,	[%l7 + %o0]
	nop
	set	0x5E, %l6
	ldsb	[%l7 + %l6],	%i6
	nop
	set	0x0C, %i1
	lduw	[%l7 + %i1],	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%i7
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%o5
	nop
	set	0x5E, %o3
	sth	%g5,	[%l7 + %o3]
	nop
	set	0x48, %g4
	lduw	[%l7 + %g4],	%o4
	set	0x34, %i2
	sta	%f16,	[%l7 + %i2] 0x81
	nop
	set	0x0C, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x08, %l4
	stxa	%o3,	[%l7 + %l4] 0x81
	nop
	set	0x1C, %i0
	ldsh	[%l7 + %i0],	%l1
	set	0x40, %g5
	sta	%f15,	[%l7 + %g5] 0x88
	nop
	set	0x0A, %l2
	stb	%o2,	[%l7 + %l2]
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%i0
	set	0x20, %l1
	stxa	%o1,	[%l7 + %l1] 0x81
	nop
	set	0x64, %i3
	lduh	[%l7 + %i3],	%g4
	set	0x4C, %o2
	sta	%f28,	[%l7 + %o2] 0x81
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%l5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%l6
	nop
	set	0x7C, %i5
	ldsw	[%l7 + %i5],	%l2
	nop
	set	0x68, %o5
	std	%l2,	[%l7 + %o5]
	nop
	set	0x50, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x20, %o7
	stwa	%i4,	[%l7 + %o7] 0x89
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc2
	nop
	set	0x2B, %i4
	ldstub	[%l7 + %i4],	%l4
	nop
	set	0x54, %l5
	stw	%o0,	[%l7 + %l5]
	set	0x58, %l3
	swapa	[%l7 + %l3] 0x89,	%g1
	nop
	set	0x60, %i7
	prefetch	[%l7 + %i7],	 3
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f0
	nop
	set	0x64, %g7
	stb	%o6,	[%l7 + %g7]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x88,	%g2,	%i5
	set	0x74, %i6
	stha	%g7,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f24
	set	0x6C, %o0
	lda	[%l7 + %o0] 0x88,	%f8
	nop
	set	0x78, %o6
	std	%f8,	[%l7 + %o6]
	nop
	set	0x41, %i1
	ldub	[%l7 + %i1],	%l0
	nop
	set	0x34, %l6
	stw	%i2,	[%l7 + %l6]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%i3
	nop
	set	0x64, %o3
	sth	%o7,	[%l7 + %o3]
	nop
	set	0x28, %g4
	std	%f10,	[%l7 + %g4]
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%i7
	fpsub32s	%f11,	%f4,	%f12
	nop
	set	0x60, %g1
	lduh	[%l7 + %g1],	%o5
	set	0x78, %i2
	stxa	%g5,	[%l7 + %i2] 0x89
	nop
	set	0x30, %l4
	ldsh	[%l7 + %l4],	%i1
	set	0x68, %g5
	swapa	[%l7 + %g5] 0x81,	%o3
	nop
	set	0x68, %l2
	stb	%o4,	[%l7 + %l2]
	ba,a,pt	%xcc,	loop_107
	nop
	set	0x70, %l0
	stx	%o2,	[%l7 + %l0]
	nop
	set	0x7C, %i0
	ldsw	[%l7 + %i0],	%i0
	nop
	set	0x38, %l1
	stx	%fsr,	[%l7 + %l1]
loop_107:
	add	%l1,	%o1,	%g4
	nop
	set	0x13, %o2
	ldstub	[%l7 + %o2],	%g6
	set	0x1E, %i3
	stha	%l5,	[%l7 + %i3] 0xeb
	membar	#Sync
	nop
	set	0x68, %i5
	std	%g2,	[%l7 + %i5]
	set	0x7D, %g6
	stba	%l6,	[%l7 + %g6] 0x88
	set	0x4C, %o7
	swapa	[%l7 + %o7] 0x81,	%l2
	set	0x62, %g2
	stba	%i4,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 0
	st	%f26,	[%l7 + 0x40]
	nop
	set	0x68, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x68, %l3
	sth	%l3,	[%l7 + %l3]
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o0
	set	0x2E, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g1
	nop
	set	0x34, %g7
	ldsw	[%l7 + %g7],	%g2
	add	%i5,	%g7,	%o6
	nop
	set	0x68, %o5
	stx	%l0,	[%l7 + %o5]
	set	0x2C, %o1
	lda	[%l7 + %o1] 0x80,	%f17
	nop
	set	0x58, %i6
	std	%f2,	[%l7 + %i6]
	add	%i2,	%i6,	%o7
	nop
	set	0x73, %o0
	ldub	[%l7 + %o0],	%i7
	nop
	set	0x35, %i1
	stb	%o5,	[%l7 + %i1]
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x89,	%g5
	nop
	set	0x5E, %l6
	ldstub	[%l7 + %l6],	%i3
	nop
	set	0x68, %o3
	stx	%o3,	[%l7 + %o3]
	set	0x28, %o4
	swapa	[%l7 + %o4] 0x88,	%o4
	nop
	set	0x60, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%o2
	set	0x54, %i2
	ldstuba	[%l7 + %i2] 0x81,	%i0
	set	0x3C, %l4
	lda	[%l7 + %l4] 0x89,	%f21
	nop
	set	0x78, %g1
	prefetch	[%l7 + %g1],	 1
	nop
	set	0x10, %l2
	std	%l0,	[%l7 + %l2]
	nop
	set	0x28, %g5
	lduh	[%l7 + %g5],	%o1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%l5
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x59, %i0
	ldub	[%l7 + %i0],	%g3
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc0
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x26, %o2
	lduh	[%l7 + %o2],	%g4
	st	%f9,	[%l7 + 0x30]
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 1
	set	0x4E, %i3
	stba	%l2,	[%l7 + %i3] 0x81
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x89,	%i4,	%l3
	nop
	set	0x3C, %g6
	sth	%l6,	[%l7 + %g6]
	add	%o0,	%g1,	%l4
	nop
	set	0x60, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x30, %g2
	lduw	[%l7 + %g2],	%g2
	nop
	set	0x40, %i5
	sth	%i5,	[%l7 + %i5]
	nop
	set	0x70, %l5
	std	%f2,	[%l7 + %l5]
	set	0x38, %i4
	swapa	[%l7 + %i4] 0x81,	%g7
	set	0x30, %l3
	stda	%l0,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x68, %i7
	std	%f26,	[%l7 + %i7]
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x81,	%o6
	nop
	set	0x10, %g7
	prefetch	[%l7 + %g7],	 4
	wr	%i2,	%o7,	%y
	nop
	set	0x68, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f6
	nop
	set	0x4C, %o0
	stb	%i6,	[%l7 + %o0]
	nop
	set	0x6E, %i6
	sth	%i7,	[%l7 + %i6]
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x68, %l6
	ldsw	[%l7 + %l6],	%o5
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%i2
	or	%o3,	%o4,	%i1
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xe3,	%o2
	set	0x28, %g4
	stda	%i0,	[%l7 + %g4] 0x80
	fpsub32	%f12,	%f22,	%f28
	nop
	set	0x08, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x10, %l4
	stha	%l1,	[%l7 + %l4] 0x89
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xd0
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f12
	nop
	set	0x64, %l2
	ldub	[%l7 + %l2],	%o1
	nop
	set	0x28, %i0
	ldsw	[%l7 + %i0],	%g6
	set	0x4B, %g5
	ldstuba	[%l7 + %g5] 0x81,	%l5
	set	0x6C, %l0
	lda	[%l7 + %l0] 0x81,	%f5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%g3
	nop
	set	0x44, %o2
	swap	[%l7 + %o2],	%g4
	nop
	set	0x20, %i3
	std	%i4,	[%l7 + %i3]
	nop
	set	0x3C, %l1
	lduh	[%l7 + %l1],	%l2
	bl,pn	%xcc,	loop_108
	nop
	set	0x18, %g6
	stx	%l6,	[%l7 + %g6]
	st	%fsr,	[%l7 + 0x14]
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x81,	%f6
loop_108:
	nop
	set	0x0E, %o7
	stb	%l3,	[%l7 + %o7]
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x88
	set	0x38, %i4
	stwa	%g1,	[%l7 + %i4] 0x89
	nop
	set	0x6C, %l3
	ldsw	[%l7 + %l3],	%o0
	set	0x2A, %i7
	stha	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
	nop
	set	0x54, %i5
	prefetch	[%l7 + %i5],	 4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%g7
	nop
	set	0x18, %g3
	stx	%l0,	[%l7 + %g3]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i6
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
	wr	%i7,	%o5,	%ccr
	and	%i2,	%o3,	%i3
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%o4
	nop
	set	0x1C, %o0
	sth	%o2,	[%l7 + %o0]
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x60, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x17, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i0
	nop
	set	0x54, %i1
	swap	[%l7 + %i1],	%l1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x89,	%i1,	%g6
	or	%l5,	%o1,	%g5
	add	%g3,	%g4,	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%l3
	nop
	set	0x7C, %o3
	ldsh	[%l7 + %o3],	%i4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xd2,	%f0
	nop
	set	0x10, %g4
	stw	%g1,	[%l7 + %g4]
	ba,pn	%xcc,	loop_109
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%l4
	nop
	set	0x7B, %i2
	ldstub	[%l7 + %i2],	%o0
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
loop_109:
	nop
	set	0x38, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x5C, %i0
	stb	%g7,	[%l7 + %i0]
	nop
	set	0x0F, %l2
	ldub	[%l7 + %l2],	%i5
	nop
	set	0x7C, %g5
	lduw	[%l7 + %g5],	%l0
	nop
	set	0x2C, %o2
	ldsw	[%l7 + %o2],	%g2
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f10
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%i6
	nop
	set	0x66, %l1
	ldsb	[%l7 + %l1],	%i7
	nop
	set	0x31, %g6
	ldub	[%l7 + %g6],	%o5
	set	0x40, %g2
	stba	%o7,	[%l7 + %g2] 0x89
	nop
	set	0x3C, %o7
	lduh	[%l7 + %o7],	%o3
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x24, %l5
	stb	%i3,	[%l7 + %l5]
	nop
	set	0x58, %i3
	std	%i2,	[%l7 + %i3]
	nop
	set	0x7E, %l3
	lduh	[%l7 + %l3],	%o4
	set	0x51, %i7
	stba	%o2,	[%l7 + %i7] 0x81
	nop
	set	0x19, %i4
	stb	%l1,	[%l7 + %i4]
	ld	[%l7 + 0x54],	%f29
	nop
	set	0x78, %i5
	std	%i0,	[%l7 + %i5]
	nop
	set	0x14, %g3
	lduw	[%l7 + %g3],	%i0
	nop
	set	0x18, %o1
	ldsw	[%l7 + %o1],	%g6
	nop
	set	0x10, %g7
	std	%f12,	[%l7 + %g7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%o1
	nop
	set	0x34, %o0
	sth	%g3,	[%l7 + %o0]
	nop
	set	0x2B, %o5
	stb	%g4,	[%l7 + %o5]
	set	0x7C, %l6
	sta	%f23,	[%l7 + %l6] 0x81
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%g5
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x89,	%l6
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x80,	%l2
	nop
	set	0x74, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x6C, %l4
	stw	%l3,	[%l7 + %l4]
	set	0x28, %g4
	stda	%g0,	[%l7 + %g4] 0x80
	add	%l4,	%i4,	%o0
	set	0x28, %g1
	stba	%i5,	[%l7 + %g1] 0x88
	and	%l0,	%g2,	%g7
	nop
	set	0x68, %i2
	stw	%i6,	[%l7 + %i2]
	add	%o6,	%o5,	%i7
	add	%o3,	%i3,	%i2
	set	0x5C, %i0
	sta	%f18,	[%l7 + %i0] 0x80
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd2,	%f16
	nop
	set	0x50, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%o2
	set	0x27, %o4
	stba	%l1,	[%l7 + %o4] 0xea
	membar	#Sync
	nop
	set	0x68, %o2
	stx	%i1,	[%l7 + %o2]
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f8
	set	0x2C, %g6
	sta	%f17,	[%l7 + %g6] 0x88
	add	%o7,	%i0,	%g6
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%o0
	or	%g3,	%g4,	%g5
	set	0x10, %l1
	lda	[%l7 + %l1] 0x81,	%f1
	set	0x7A, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l5
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xda
	nop
	set	0x49, %l3
	ldub	[%l7 + %l3],	%l6
	nop
	set	0x48, %i7
	std	%l2,	[%l7 + %i7]
	set	0x64, %i4
	sta	%f13,	[%l7 + %i4] 0x81
	nop
	set	0x20, %i5
	std	%f0,	[%l7 + %i5]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l4
	nop
	set	0x50, %g3
	lduw	[%l7 + %g3],	%l3
	nop
	set	0x3E, %o1
	ldsb	[%l7 + %o1],	%o0
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x81,	%i4
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x80,	%l0
	nop
	set	0x69, %o5
	stb	%i5,	[%l7 + %o5]
	set	0x43, %o0
	stba	%g7,	[%l7 + %o0] 0x80
	set	0x32, %i1
	stba	%i6,	[%l7 + %i1] 0x80
	nop
	set	0x60, %l6
	prefetch	[%l7 + %l6],	 4
	set	0x3E, %o6
	stha	%g2,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x40, %o3
	stx	%o5,	[%l7 + %o3]
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%o6
	nop
	set	0x2C, %g4
	stw	%i7,	[%l7 + %g4]
	nop
	set	0x32, %g1
	ldub	[%l7 + %g1],	%o3
	set	0x4E, %i2
	stha	%i3,	[%l7 + %i2] 0xe3
	membar	#Sync
	st	%f27,	[%l7 + 0x2C]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o4,	%i2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f0
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xe2,	%l0
	nop
	set	0x78, %g5
	std	%f18,	[%l7 + %g5]
	set	0x20, %o4
	lda	[%l7 + %o4] 0x80,	%f20
	nop
	set	0x38, %l2
	stx	%i1,	[%l7 + %l2]
	fpsub16	%f18,	%f20,	%f4
	st	%fsr,	[%l7 + 0x28]
	nop
	set	0x40, %l0
	std	%o6,	[%l7 + %l0]
	set	0x14, %o2
	lda	[%l7 + %o2] 0x88,	%f17
	nop
	set	0x68, %g6
	lduw	[%l7 + %g6],	%i0
	nop
	set	0x42, %g2
	ldsb	[%l7 + %g2],	%g6
	nop
	set	0x3C, %l1
	ldsh	[%l7 + %l1],	%o2
	add	%g3,	%g4,	%o1
	add	%g5,	%l5,	%l6
	fpadd32s	%f13,	%f14,	%f18
	or	%l2,	%g1,	%l3
	st	%f21,	[%l7 + 0x0C]
	nop
	set	0x7C, %l5
	sth	%l4,	[%l7 + %l5]
	fpsub32s	%f20,	%f24,	%f23
	set	0x28, %o7
	sta	%f27,	[%l7 + %o7] 0x88
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%o0
	nop
	set	0x70, %i7
	ldx	[%l7 + %i7],	%i4
	nop
	set	0x34, %i5
	ldsh	[%l7 + %i5],	%l0
	set	0x40, %i4
	stwa	%i5,	[%l7 + %i4] 0x80
	nop
	set	0x30, %g3
	stb	%g7,	[%l7 + %g3]
	nop
	set	0x40, %o1
	ldsw	[%l7 + %o1],	%g2
	nop
	set	0x0A, %g7
	lduh	[%l7 + %g7],	%o5
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x89,	 1
	set	0x18, %i3
	stda	%i6,	[%l7 + %i3] 0x88
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xcc
	set	0x7A, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o3
	set	0x50, %l6
	swapa	[%l7 + %l6] 0x80,	%i3
	set	0x22, %o3
	stha	%o4,	[%l7 + %o3] 0x80
	nop
	set	0x7E, %o6
	ldstub	[%l7 + %o6],	%i7
	nop
	set	0x6E, %g4
	sth	%l1,	[%l7 + %g4]
	set	0x7C, %g1
	sta	%f23,	[%l7 + %g1] 0x88
	wr	%i2,	%i1,	%y
	add	%o7,	%g6,	%o2
	set	0x34, %i6
	swapa	[%l7 + %i6] 0x88,	%i0
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%g3
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd0,	%f16
	nop
	set	0x64, %g5
	swap	[%l7 + %g5],	%g4
	st	%f31,	[%l7 + 0x54]
	nop
	set	0x38, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x6C, %l0
	sta	%f16,	[%l7 + %l0] 0x89
	nop
	set	0x15, %o4
	ldsb	[%l7 + %o4],	%o1
	set	0x28, %g6
	swapa	[%l7 + %g6] 0x81,	%l5
	set	0x68, %o2
	stxa	%l6,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x45, %g2
	stba	%g5,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x48, %l1
	lda	[%l7 + %l1] 0x80,	%f14
	and	%l2,	%l3,	%l4
	st	%f19,	[%l7 + 0x58]
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f30
	nop
	set	0x40, %l3
	std	%f14,	[%l7 + %l3]
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x20, %i7
	stda	%g0,	[%l7 + %i7] 0x88
	nop
	set	0x54, %i5
	lduw	[%l7 + %i5],	%i4
	nop
	set	0x20, %g3
	stb	%l0,	[%l7 + %g3]
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x80,	%i5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xcc
	set	0x48, %o1
	prefetcha	[%l7 + %o1] 0x89,	 1
	nop
	set	0x50, %o5
	std	%o0,	[%l7 + %o5]
	nop
	set	0x5A, %o0
	ldsh	[%l7 + %o0],	%g2
	set	0x68, %i3
	stda	%o4,	[%l7 + %i3] 0x88
	nop
	nop
	setx	0xBAF632AF1E1B7417,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0A72F8C9B6DD5177,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f26,	%f30
	nop
	set	0x28, %l6
	std	%f22,	[%l7 + %l6]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x88,	%i6,	%o6
	nop
	set	0x18, %o3
	std	%f28,	[%l7 + %o3]
	st	%fsr,	[%l7 + 0x38]
	fpadd16s	%f16,	%f6,	%f23
	st	%f8,	[%l7 + 0x68]
	set	0x58, %i1
	ldxa	[%l7 + %i1] 0x80,	%o3
	set	0x58, %g4
	stwa	%o4,	[%l7 + %g4] 0x89
	nop
	set	0x48, %g1
	prefetch	[%l7 + %g1],	 2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	nop
	set	0x08, %i6
	stw	%i7,	[%l7 + %i6]
	set	0x30, %l4
	stxa	%i3,	[%l7 + %l4] 0xe2
	membar	#Sync
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f0
	set	0x20, %g5
	stwa	%i2,	[%l7 + %g5] 0x80
	nop
	set	0x68, %l2
	prefetch	[%l7 + %l2],	 2
	add	%l1,	%o7,	%i1
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f0
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x80,	%g6
	nop
	set	0x52, %o4
	stb	%o2,	[%l7 + %o4]
	or	%i0,	%g4,	%o1
	nop
	set	0x28, %l1
	std	%g2,	[%l7 + %l1]
	set	0x40, %l5
	ldstuba	[%l7 + %l5] 0x80,	%l5
	st	%f30,	[%l7 + 0x40]
	ld	[%l7 + 0x08],	%f23
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%g4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%l3
	nop
	set	0x6C, %i7
	ldub	[%l7 + %i7],	%l6
	nop
	set	0x38, %o7
	lduw	[%l7 + %o7],	%g1
	set	0x64, %i5
	swapa	[%l7 + %i5] 0x88,	%i4
	add	%l4,	%l0,	%g7
	nop
	set	0x72, %g3
	lduh	[%l7 + %g3],	%i5
	nop
	set	0x10, %i4
	std	%g2,	[%l7 + %i4]
	ld	[%l7 + 0x44],	%f16
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x88,	 2
	set	0x50, %g7
	stwa	%i6,	[%l7 + %g7] 0x81
	nop
	set	0x18, %o5
	std	%f12,	[%l7 + %o5]
	nop
	set	0x1C, %i3
	lduh	[%l7 + %i3],	%o6
	set	0x78, %l6
	stda	%o0,	[%l7 + %l6] 0xea
	membar	#Sync
	fpsub16	%f20,	%f6,	%f2
	fpsub16	%f6,	%f8,	%f18
	st	%fsr,	[%l7 + 0x38]
	ld	[%l7 + 0x50],	%f10
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f6
	set	0x48, %i1
	stda	%o4,	[%l7 + %i1] 0xe2
	membar	#Sync
	set	0x70, %o3
	ldda	[%l7 + %o3] 0x89,	%i6
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x38, %g4
	std	%f12,	[%l7 + %g4]
	nop
	set	0x2C, %g1
	ldsw	[%l7 + %g1],	%o3
	st	%f21,	[%l7 + 0x40]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xe2,	%i2
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%l0
	nop
	set	0x50, %i2
	stx	%i3,	[%l7 + %i2]
	nop
	set	0x68, %i0
	prefetch	[%l7 + %i0],	 3
	set	0x16, %l4
	stha	%i1,	[%l7 + %l4] 0xe3
	membar	#Sync
	add	%o7,	%o2,	%i0
	st	%f14,	[%l7 + 0x64]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%g4
	nop
	set	0x30, %l2
	lduh	[%l7 + %l2],	%g3
	nop
	set	0x20, %g5
	prefetch	[%l7 + %g5],	 0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd0,	%f16
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x48, %o2
	lduw	[%l7 + %o2],	%l5
	nop
	set	0x56, %g6
	ldub	[%l7 + %g6],	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x89,	%l2,	%g5
	nop
	set	0x38, %l1
	ldub	[%l7 + %l1],	%l6
	nop
	set	0x58, %l5
	std	%g0,	[%l7 + %l5]
	set	0x1F, %l3
	ldstuba	[%l7 + %l3] 0x88,	%l3
	set	0x10, %g2
	swapa	[%l7 + %g2] 0x80,	%l4
	set	0x44, %o4
	stwa	%i4,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x0B, %i5
	ldsb	[%l7 + %i5],	%l0
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x20, %o7
	sth	%i5,	[%l7 + %o7]
	set	0x7A, %g3
	stha	%g7,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x59, %o1
	ldub	[%l7 + %o1],	%o5
	or	%g2,	%i6,	%o6
	nop
	set	0x6C, %g7
	sth	%o0,	[%l7 + %g7]
	set	0x36, %o5
	ldstuba	[%l7 + %o5] 0x89,	%o4
	nop
	set	0x74, %i3
	sth	%i7,	[%l7 + %i3]
	nop
	set	0x7D, %l6
	ldub	[%l7 + %l6],	%i2
	set	0x30, %o0
	ldstuba	[%l7 + %o0] 0x88,	%l1
	nop
	set	0x18, %i4
	std	%i2,	[%l7 + %i4]
	fpsub32s	%f18,	%f9,	%f2
	nop
	set	0x30, %i1
	std	%o2,	[%l7 + %i1]
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 3:
!
!	Type l   	: 1272
!	Type a   	: 25
!	Type cti   	: 29
!	Type x   	: 520
!	Type f   	: 44
!	Type i   	: 110
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
	set	0x1,	%g2
	set	0xE,	%g3
	set	0x3,	%g4
	set	0x0,	%g5
	set	0xB,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x5,	%i1
	set	-0xD,	%i2
	set	-0xA,	%i3
	set	-0x0,	%i4
	set	-0x0,	%i5
	set	-0x3,	%i6
	set	-0xE,	%i7
	!# Local registers
	set	0x6B06DCC7,	%l0
	set	0x746237B7,	%l1
	set	0x2637330F,	%l2
	set	0x0787DE2F,	%l3
	set	0x4544A440,	%l4
	set	0x162930AE,	%l5
	set	0x38A37E01,	%l6
	!# Output registers
	set	-0x01D2,	%o0
	set	0x1139,	%o1
	set	-0x08E6,	%o2
	set	-0x0A30,	%o3
	set	0x0ACD,	%o4
	set	-0x06CE,	%o5
	set	-0x01A9,	%o6
	set	-0x1CF6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc4
	st	%f9,	[%l7 + 0x2C]
	set	0x10, %g1
	swapa	[%l7 + %g1] 0x81,	%o7
	st	%f8,	[%l7 + 0x58]
	wr	%o2,	%i0,	%pic
	nop
	set	0x7E, %o6
	ldsh	[%l7 + %o6],	%g6
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%i1
	nop
	set	0x34, %i2
	stw	%g4,	[%l7 + %i2]
	nop
	set	0x28, %o3
	ldstub	[%l7 + %o3],	%l5
	fpadd32	%f20,	%f10,	%f10
	nop
	set	0x7E, %i0
	ldub	[%l7 + %i0],	%g3
	nop
	set	0x40, %l2
	ldd	[%l7 + %l2],	%f4
	nop
	set	0x44, %g5
	ldsw	[%l7 + %g5],	%l2
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%g5
	nop
	set	0x38, %l4
	std	%f28,	[%l7 + %l4]
	and	%l6,	%g1,	%l3
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	wr	%o1,	%i4,	%y
	nop
	set	0x40, %o2
	ldsw	[%l7 + %o2],	%l0
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%i4
	nop
	set	0x20, %l3
	swap	[%l7 + %l3],	%l4
	st	%fsr,	[%l7 + 0x50]
	set	0x60, %l5
	sta	%f15,	[%l7 + %l5] 0x80
	set	0x1C, %g2
	lda	[%l7 + %g2] 0x80,	%f31
	set	0x38, %i7
	lda	[%l7 + %i7] 0x89,	%f8
	nop
	set	0x53, %o4
	ldsb	[%l7 + %o4],	%g7
	nop
	set	0x4C, %o7
	ldsb	[%l7 + %o7],	%o5
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%i6
	and	%g2,	%o6,	%o4
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x81,	%i6
	wr	%o0,	%l1,	%clear_softint
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	nop
	set	0x38, %o5
	swap	[%l7 + %o5],	%o3
	fpsub16s	%f11,	%f17,	%f11
	add	%o7,	%i2,	%i0
	nop
	set	0x24, %i3
	stw	%g6,	[%l7 + %i3]
	nop
	set	0x58, %l6
	std	%o2,	[%l7 + %l6]
	nop
	set	0x22, %o0
	ldsb	[%l7 + %o0],	%i1
	and	%g4,	%g3,	%l2
	set	0x50, %i4
	sta	%f3,	[%l7 + %i4] 0x81
	nop
	set	0x4A, %g7
	ldub	[%l7 + %g7],	%l5
	nop
	set	0x44, %g4
	lduw	[%l7 + %g4],	%l6
	ba,a,pn	%icc,	loop_110
	or	%g5,	%g1,	%o1
	set	0x54, %g1
	swapa	[%l7 + %g1] 0x81,	%l3
loop_110:
	nop
	set	0x48, %i1
	std	%f24,	[%l7 + %i1]
	nop
	set	0x48, %o6
	ldsh	[%l7 + %o6],	%l0
	ld	[%l7 + 0x40],	%f19
	nop
	set	0x18, %i6
	std	%i4,	[%l7 + %i6]
	set	0x58, %o3
	stda	%i4,	[%l7 + %o3] 0x80
	set	0x50, %i2
	ldxa	[%l7 + %i2] 0x81,	%g7
	nop
	set	0x38, %i0
	std	%f18,	[%l7 + %i0]
	nop
	set	0x78, %g5
	stx	%fsr,	[%l7 + %g5]
	nop
	set	0x55, %l2
	stb	%l4,	[%l7 + %l2]
	add	%o5,	%g2,	%i6
	and	%o4,	%o6,	%o0
	nop
	set	0x14, %l0
	stw	%l1,	[%l7 + %l0]
	set	0x50, %g6
	stha	%i7,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%o7
	set	0x73, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i2
	nop
	set	0x1C, %l4
	ldsh	[%l7 + %l4],	%o3
	nop
	set	0x70, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%o2
	nop
	set	0x68, %l5
	ldsh	[%l7 + %l5],	%i1
	set	0x1C, %l1
	sta	%f9,	[%l7 + %l1] 0x80
	nop
	set	0x48, %i7
	lduw	[%l7 + %i7],	%i0
	ld	[%l7 + 0x68],	%f20
	nop
	set	0x68, %g2
	stx	%g4,	[%l7 + %g2]
	set	0x30, %o4
	swapa	[%l7 + %o4] 0x80,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l5,	%l2
	set	0x58, %o7
	sta	%f19,	[%l7 + %o7] 0x89
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%g5
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%f10
	nop
	set	0x70, %o5
	std	%i6,	[%l7 + %o5]
	st	%f0,	[%l7 + 0x7C]
	nop
	set	0x74, %g3
	lduh	[%l7 + %g3],	%g1
	nop
	set	0x78, %i3
	stb	%o1,	[%l7 + %i3]
	nop
	set	0x7C, %l6
	lduw	[%l7 + %l6],	%l0
	st	%f21,	[%l7 + 0x08]
	nop
	set	0x70, %i4
	std	%i4,	[%l7 + %i4]
	nop
	set	0x68, %o0
	std	%l2,	[%l7 + %o0]
	nop
	set	0x78, %g7
	stx	%g7,	[%l7 + %g7]
	nop
	set	0x08, %g4
	swap	[%l7 + %g4],	%i5
	nop
	set	0x0C, %g1
	stw	%l4,	[%l7 + %g1]
	add	%g2,	%o5,	%i6
	nop
	set	0x79, %o6
	ldsb	[%l7 + %o6],	%o4
	nop
	set	0x78, %i1
	prefetch	[%l7 + %i1],	 3
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%o6
	nop
	nop
	setx	0x8477A4B82D5813B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6603FD17A118BE31,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f14
	or	%l1,	%o0,	%i7
	nop
	set	0x58, %i6
	lduw	[%l7 + %i6],	%o7
	st	%f28,	[%l7 + 0x1C]
	st	%f6,	[%l7 + 0x08]
	add	%i2,	%o3,	%i3
	add	%o2,	%i1,	%g6
	nop
	set	0x64, %i0
	lduw	[%l7 + %i0],	%g4
	and	%i0,	%g3,	%l5
	nop
	set	0x58, %i2
	std	%f8,	[%l7 + %i2]
	nop
	set	0x60, %l2
	std	%f28,	[%l7 + %l2]
	fpadd16	%f10,	%f14,	%f0
	wr	%l2,	%g5,	%softint
	set	0x7C, %g5
	stwa	%l6,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x89,	%g0
	nop
	set	0x60, %o2
	std	%f16,	[%l7 + %o2]
	set	0x40, %l0
	stxa	%o1,	[%l7 + %l0] 0x80
	nop
	set	0x34, %l4
	stb	%l0,	[%l7 + %l4]
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x88,	%i4
	nop
	nop
	setx	0xA8421A2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x7ED0878F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f8,	%f20
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x88,	%f16
	set	0x64, %i7
	stwa	%g7,	[%l7 + %i7] 0x81
	nop
	set	0x40, %l1
	ldsw	[%l7 + %l1],	%l3
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%i5
	nop
	set	0x10, %g2
	stb	%l4,	[%l7 + %g2]
	nop
	set	0x08, %o1
	ldd	[%l7 + %o1],	%g2
	nop
	nop
	setx	0x2EA77F7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xBA4F30F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f12,	%f18
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f16
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%o4
	st	%fsr,	[%l7 + 0x48]
	set	0x7C, %g3
	stba	%i6,	[%l7 + %g3] 0x88
	set	0x70, %i3
	sta	%f31,	[%l7 + %i3] 0x81
	set	0x40, %i5
	prefetcha	[%l7 + %i5] 0x81,	 1
	set	0x60, %l6
	stha	%o6,	[%l7 + %l6] 0x81
	nop
	set	0x10, %i4
	ldsh	[%l7 + %i4],	%l1
	set	0x24, %g7
	lda	[%l7 + %g7] 0x89,	%f6
	nop
	set	0x66, %g4
	stb	%i7,	[%l7 + %g4]
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%o7
	nop
	set	0x23, %g1
	stb	%o0,	[%l7 + %g1]
	nop
	set	0x34, %o6
	ldsw	[%l7 + %o6],	%i2
	nop
	set	0x68, %i1
	std	%i2,	[%l7 + %i1]
	set	0x5E, %i6
	ldstuba	[%l7 + %i6] 0x81,	%o2
	ld	[%l7 + 0x6C],	%f2
	nop
	set	0x44, %o3
	ldsh	[%l7 + %o3],	%o3
	nop
	set	0x68, %i2
	swap	[%l7 + %i2],	%g6
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%f10
	nop
	set	0x4D, %g5
	ldstub	[%l7 + %g5],	%i1
	set	0x68, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i0
	nop
	set	0x0A, %o2
	ldsh	[%l7 + %o2],	%g3
	set	0x14, %l0
	stba	%l5,	[%l7 + %l0] 0x88
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g5
	set	0x25, %l4
	stba	%l2,	[%l7 + %l4] 0x89
	nop
	set	0x60, %l5
	ldx	[%l7 + %l5],	%g1
	nop
	set	0x6F, %l1
	ldsb	[%l7 + %l1],	%o1
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%f22
	nop
	set	0x40, %i7
	stx	%l0,	[%l7 + %i7]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i4
	set	0x7F, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g7
	nop
	set	0x1C, %o7
	ldsw	[%l7 + %o7],	%l3
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%i5
	set	0x1E, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g2
	nop
	set	0x38, %i3
	ldx	[%l7 + %i3],	%o5
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xcc
	nop
	set	0x70, %i5
	std	%f2,	[%l7 + %i5]
	set	0x60, %i4
	stda	%i6,	[%l7 + %i4] 0xe3
	membar	#Sync
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xc4
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%l4
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f14
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x88
	nop
	set	0x7D, %g1
	stb	%o4,	[%l7 + %g1]
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf9
	membar	#Sync
	bn	%icc,	loop_111
	nop
	set	0x10, %i6
	swap	[%l7 + %i6],	%l1
	st	%fsr,	[%l7 + 0x7C]
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x88,	 4
loop_111:
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x50, %i1
	sth	%o6,	[%l7 + %i1]
	set	0x38, %i0
	stwa	%o7,	[%l7 + %i0] 0x80
	nop
	set	0x46, %i2
	sth	%o0,	[%l7 + %i2]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%i3
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%o3
	nop
	set	0x28, %o2
	std	%f12,	[%l7 + %o2]
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f2
	nop
	set	0x38, %l0
	ldstub	[%l7 + %l0],	%g6
	nop
	set	0x36, %g6
	ldsh	[%l7 + %g6],	%i1
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
	nop
	set	0x20, %l3
	ldsh	[%l7 + %l3],	%o2
	nop
	set	0x38, %l1
	prefetch	[%l7 + %l1],	 2
	add	%i0,	%l5,	%g3
	nop
	set	0x26, %l5
	lduh	[%l7 + %l5],	%g5
	nop
	set	0x70, %i7
	std	%g4,	[%l7 + %i7]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%l2
	nop
	set	0x08, %o4
	stw	%o1,	[%l7 + %o4]
	set	0x5C, %o5
	swapa	[%l7 + %o5] 0x88,	%l0
	fpsub16	%f6,	%f18,	%f2
	nop
	set	0x58, %o7
	std	%i6,	[%l7 + %o7]
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe3,	%i4
	set	0x68, %g2
	swapa	[%l7 + %g2] 0x89,	%l3
	nop
	set	0x14, %g3
	stw	%i5,	[%l7 + %g3]
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%g6
	set	0x2C, %l6
	stwa	%g2,	[%l7 + %l6] 0xea
	membar	#Sync
	add	%i6,	%o5,	%o4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x81,	%l1,	%i7
	set	0x28, %i5
	stxa	%l4,	[%l7 + %i5] 0xea
	membar	#Sync
	bgu,a	%icc,	loop_112
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f30
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%o0
loop_112:
	add	%i2,	%i3,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%i1
	set	0x7C, %o0
	stwa	%o7,	[%l7 + %o0] 0x88
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f14
	nop
	set	0x7A, %o6
	sth	%i0,	[%l7 + %o6]
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%l5
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%f24
	set	0x74, %i1
	lda	[%l7 + %i1] 0x80,	%f8
	set	0x08, %g4
	stha	%o2,	[%l7 + %g4] 0xe2
	membar	#Sync
	set	0x30, %i0
	stxa	%g3,	[%l7 + %i0] 0x88
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x80,	%g5
	nop
	set	0x08, %i2
	std	%f10,	[%l7 + %i2]
	nop
	set	0x40, %o2
	lduw	[%l7 + %o2],	%g4
	add	%g1,	%o1,	%l2
	nop
	set	0x3C, %l2
	ldsw	[%l7 + %l2],	%l0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xda,	%f0
	nop
	set	0x60, %l0
	stw	%l6,	[%l7 + %l0]
	nop
	set	0x4C, %l3
	ldsh	[%l7 + %l3],	%l3
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%f2
	nop
	set	0x57, %l5
	ldub	[%l7 + %l5],	%i4
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%g6
	nop
	set	0x0C, %i7
	swap	[%l7 + %i7],	%g2
	set	0x28, %o1
	ldxa	[%l7 + %o1] 0x89,	%i5
	ld	[%l7 + 0x54],	%f30
	nop
	set	0x7C, %o4
	lduh	[%l7 + %o4],	%i6
	set	0x3C, %o5
	swapa	[%l7 + %o5] 0x88,	%o4
	add	%o5,	%i7,	%l1
	nop
	set	0x4C, %i3
	ldsw	[%l7 + %i3],	%o6
	nop
	set	0x7F, %o7
	ldstub	[%l7 + %o7],	%l4
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x81
	st	%fsr,	[%l7 + 0x44]
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x88,	 2
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x89,	%o0
	nop
	set	0x38, %i4
	swap	[%l7 + %i4],	%i3
	set	0x18, %i5
	swapa	[%l7 + %i5] 0x88,	%g6
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%o3
	ba,pn	%icc,	loop_113
	st	%f7,	[%l7 + 0x78]
	nop
	set	0x20, %o6
	sth	%i1,	[%l7 + %o6]
	nop
	set	0x68, %g1
	lduw	[%l7 + %g1],	%i0
loop_113:
	nop
	set	0x48, %o3
	std	%o6,	[%l7 + %o3]
	set	0x25, %i1
	stba	%l5,	[%l7 + %i1] 0xe3
	membar	#Sync
	set	0x20, %i6
	ldda	[%l7 + %i6] 0xea,	%g2
	nop
	set	0x68, %g4
	ldx	[%l7 + %g4],	%g5
	nop
	set	0x08, %i0
	ldstub	[%l7 + %i0],	%o2
	nop
	set	0x6B, %i2
	ldsb	[%l7 + %i2],	%g1
	nop
	set	0x4B, %g5
	ldstub	[%l7 + %g5],	%o1
	nop
	set	0x3C, %o2
	ldsb	[%l7 + %o2],	%g4
	set	0x38, %l2
	sta	%f28,	[%l7 + %l2] 0x81
	or	%l2,	%l0,	%l6
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x89,	%i4
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xe3,	%l2
	nop
	set	0x16, %l4
	ldsh	[%l7 + %l4],	%g7
	set	0x28, %g6
	stha	%g2,	[%l7 + %g6] 0xe2
	membar	#Sync
	nop
	set	0x70, %l5
	std	%i4,	[%l7 + %l5]
	nop
	set	0x44, %i7
	sth	%o4,	[%l7 + %i7]
	fpadd16	%f14,	%f10,	%f6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%i7
	set	0x70, %o1
	stda	%o4,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x5C, %o4
	swap	[%l7 + %o4],	%o6
	st	%f3,	[%l7 + 0x58]
	ld	[%l7 + 0x70],	%f5
	nop
	set	0x2A, %o5
	ldsb	[%l7 + %o5],	%l4
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x28, %l1
	lduh	[%l7 + %l1],	%i2
	fpsub32s	%f19,	%f22,	%f27
	set	0x60, %i3
	stha	%o0,	[%l7 + %i3] 0x81
	nop
	set	0x20, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x5C, %g2
	ldsw	[%l7 + %g2],	%l1
	add	%g6,	%i3,	%o3
	nop
	set	0x61, %g3
	ldsb	[%l7 + %g3],	%i0
	nop
	set	0x4C, %i4
	lduw	[%l7 + %i4],	%o7
	set	0x24, %i5
	stwa	%l5,	[%l7 + %i5] 0x80
	set	0x34, %l6
	swapa	[%l7 + %l6] 0x81,	%g3
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	add	%g5,	%o2,	%g1
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%o1
	or	%i1,	%l2,	%g4
	st	%f11,	[%l7 + 0x28]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l0,	%i4
	st	%f10,	[%l7 + 0x70]
	set	0x1C, %o0
	lda	[%l7 + %o0] 0x80,	%f31
	nop
	set	0x6C, %o3
	ldsw	[%l7 + %o3],	%l3
	wr	%g7,	%g2,	%pic
	nop
	set	0x5A, %g1
	ldub	[%l7 + %g1],	%l6
	set	0x08, %i6
	ldxa	[%l7 + %i6] 0x88,	%i5
	set	0x48, %g4
	stwa	%i6,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%i7
	nop
	set	0x54, %i1
	prefetch	[%l7 + %i1],	 4
	set	0x18, %i2
	lda	[%l7 + %i2] 0x89,	%f26
	nop
	set	0x0C, %o2
	ldsh	[%l7 + %o2],	%o4
	nop
	set	0x79, %g5
	stb	%o5,	[%l7 + %g5]
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f10
	nop
	set	0x14, %l3
	lduw	[%l7 + %l3],	%o6
	nop
	set	0x50, %l0
	std	%f4,	[%l7 + %l0]
	set	0x60, %l4
	stda	%l4,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x80
	nop
	set	0x24, %i7
	stw	%i2,	[%l7 + %i7]
	nop
	set	0x58, %o1
	std	%f14,	[%l7 + %o1]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%g6
	nop
	set	0x58, %l5
	lduw	[%l7 + %l5],	%i3
	nop
	set	0x42, %o4
	lduh	[%l7 + %o4],	%o3
	nop
	set	0x60, %o5
	stx	%l1,	[%l7 + %o5]
	nop
	set	0x78, %l1
	lduh	[%l7 + %l1],	%o7
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f0
	nop
	set	0x2E, %o7
	lduh	[%l7 + %o7],	%l5
	or	%g3,	%i0,	%g5
	set	0x30, %g2
	ldxa	[%l7 + %g2] 0x88,	%o2
	set	0x54, %g3
	stwa	%o1,	[%l7 + %g3] 0x81
	set	0x65, %i4
	ldstuba	[%l7 + %i4] 0x81,	%g1
	set	0x10, %l6
	ldda	[%l7 + %l6] 0x89,	%i0
	st	%f11,	[%l7 + 0x68]
	nop
	set	0x49, %i5
	stb	%l2,	[%l7 + %i5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%l0
	nop
	set	0x26, %g7
	lduh	[%l7 + %g7],	%l3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xca
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf1
	membar	#Sync
	nop
	set	0x26, %o6
	ldsb	[%l7 + %o6],	%i4
	nop
	set	0x34, %g1
	ldsb	[%l7 + %g1],	%g2
	st	%f18,	[%l7 + 0x2C]
	set	0x1C, %g4
	stba	%g7,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x10, %i1
	ldstub	[%l7 + %i1],	%l6
	wr	%i6,	%i7,	%sys_tick
	and	%o4,	%i5,	%o5
	set	0x48, %i6
	lda	[%l7 + %i6] 0x80,	%f21
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x80,	%o6
	set	0x70, %g5
	stha	%l4,	[%l7 + %g5] 0xe2
	membar	#Sync
	nop
	set	0x60, %l2
	prefetch	[%l7 + %l2],	 3
	set	0x3C, %i2
	swapa	[%l7 + %i2] 0x81,	%o0
	bne,a	%icc,	loop_114
	nop
	set	0x60, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x50, %l4
	prefetch	[%l7 + %l4],	 0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%i3
loop_114:
	st	%fsr,	[%l7 + 0x38]
	set	0x48, %g6
	stxa	%g6,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x24, %l0
	ldsw	[%l7 + %l0],	%o3
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f0
	ld	[%l7 + 0x68],	%f30
	nop
	set	0x48, %o1
	std	%f14,	[%l7 + %o1]
	nop
	set	0x5A, %o4
	ldsh	[%l7 + %o4],	%l1
	st	%f29,	[%l7 + 0x20]
	nop
	set	0x72, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x5C, %l1
	stba	%o7,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x58, %i3
	stx	%i0,	[%l7 + %i3]
	set	0x74, %o5
	swapa	[%l7 + %o5] 0x81,	%g5
	nop
	set	0x30, %o7
	std	%f30,	[%l7 + %o7]
	nop
	set	0x28, %g3
	std	%f26,	[%l7 + %g3]
	ld	[%l7 + 0x74],	%f4
	set	0x34, %g2
	stwa	%g3,	[%l7 + %g2] 0x88
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x88,	%o1
	nop
	set	0x48, %l6
	std	%f8,	[%l7 + %l6]
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%o2
	nop
	set	0x38, %g7
	stx	%i1,	[%l7 + %g7]
	set	0x24, %o0
	lda	[%l7 + %o0] 0x88,	%f26
	nop
	set	0x38, %o3
	ldsw	[%l7 + %o3],	%l2
	add	%g1,	%l0,	%l3
	nop
	set	0x6B, %o6
	ldub	[%l7 + %o6],	%i4
	or	%g4,	%g7,	%l6
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x88,	%i6
	nop
	set	0x36, %i0
	ldsh	[%l7 + %i0],	%g2
	nop
	set	0x58, %i1
	ldsh	[%l7 + %i1],	%i7
	set	0x40, %i6
	prefetcha	[%l7 + %i6] 0x88,	 4
	or	%o4,	%o6,	%l4
	set	0x20, %g1
	stha	%o0,	[%l7 + %g1] 0x89
	set	0x28, %o2
	lda	[%l7 + %o2] 0x88,	%f29
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%o4
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xd0,	%f16
	st	%fsr,	[%l7 + 0x60]
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f0
	wr	%i2,	%g6,	%clear_softint
	nop
	set	0x20, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x73, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o3
	nop
	set	0x75, %g6
	ldsb	[%l7 + %g6],	%i3
	nop
	set	0x68, %i7
	std	%f14,	[%l7 + %i7]
	add	%l5,	%o7,	%i0
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xd2,	%f16
	nop
	set	0x5C, %o4
	sth	%g5,	[%l7 + %o4]
	set	0x50, %l5
	ldda	[%l7 + %l5] 0x89,	%g2
	st	%f24,	[%l7 + 0x58]
	and	%l1,	%o2,	%i1
	set	0x7C, %l1
	stha	%o1,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%l2
	nop
	set	0x40, %o5
	stw	%l0,	[%l7 + %o5]
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%l3
	set	0x26, %g3
	stha	%g1,	[%l7 + %g3] 0x89
	nop
	set	0x15, %g2
	ldub	[%l7 + %g2],	%i4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%g7
	nop
	set	0x58, %i4
	stw	%i6,	[%l7 + %i4]
	nop
	set	0x4C, %l6
	ldsb	[%l7 + %l6],	%g2
	nop
	set	0x38, %o1
	ldx	[%l7 + %o1],	%l6
	set	0x28, %i5
	stxa	%i7,	[%l7 + %i5] 0x88
	nop
	set	0x58, %o0
	ldsb	[%l7 + %o0],	%i5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%l4
	set	0x30, %g7
	stda	%o0,	[%l7 + %g7] 0x81
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf1
	membar	#Sync
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x80,	%o4
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x88,	%i2
	or	%o5,	%g6,	%o3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i3,	%o7
	or	%l5,	%g5,	%i0
	nop
	set	0x3C, %i1
	swap	[%l7 + %i1],	%g3
	nop
	set	0x2C, %i6
	ldub	[%l7 + %i6],	%o2
	set	0x30, %o6
	prefetcha	[%l7 + %o6] 0x89,	 1
	nop
	set	0x60, %o2
	stx	%fsr,	[%l7 + %o2]
	ld	[%l7 + 0x40],	%f25
	set	0x61, %g5
	stba	%l1,	[%l7 + %g5] 0x88
	fpsub32s	%f15,	%f8,	%f19
	nop
	set	0x30, %g1
	stx	%o1,	[%l7 + %g1]
	nop
	set	0x22, %i2
	stb	%l0,	[%l7 + %i2]
	set	0x56, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x64, %l3
	ldsh	[%l7 + %l3],	%l2
	set	0x10, %g6
	ldda	[%l7 + %g6] 0xeb,	%i4
	set	0x24, %i7
	stha	%g1,	[%l7 + %i7] 0xe3
	membar	#Sync
	fpsub16	%f10,	%f18,	%f26
	nop
	set	0x3A, %l4
	ldsh	[%l7 + %l4],	%g7
	nop
	set	0x60, %l0
	sth	%i6,	[%l7 + %l0]
	st	%f16,	[%l7 + 0x1C]
	st	%fsr,	[%l7 + 0x64]
	nop
	set	0x38, %o4
	ldsw	[%l7 + %o4],	%g2
	set	0x70, %l5
	ldda	[%l7 + %l5] 0xe2,	%i6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f16
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf0
	membar	#Sync
	set	0x24, %l1
	stwa	%g4,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x3C, %g3
	stw	%i5,	[%l7 + %g3]
	nop
	set	0x28, %o7
	ldsw	[%l7 + %o7],	%i7
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%o6
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%l4
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xea,	%o4
	and	%o0,	%o5,	%i2
	nop
	set	0x1C, %i5
	swap	[%l7 + %i5],	%o3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%o7
	fpsub16s	%f26,	%f14,	%f16
	nop
	set	0x20, %o0
	stw	%i3,	[%l7 + %o0]
	nop
	set	0x4D, %o1
	ldub	[%l7 + %o1],	%g5
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x89,	%l5
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xd2,	%f0
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x38, %i0
	sth	%g3,	[%l7 + %i0]
	set	0x20, %i1
	stha	%i0,	[%l7 + %i1] 0xea
	membar	#Sync
	set	0x50, %i6
	stxa	%i1,	[%l7 + %i6] 0x81
	set	0x13, %g4
	ldstuba	[%l7 + %g4] 0x81,	%l1
	set	0x50, %o6
	sta	%f7,	[%l7 + %o6] 0x89
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%o2
	set	0x60, %g1
	lda	[%l7 + %g1] 0x80,	%f17
	nop
	set	0x32, %g5
	sth	%l0,	[%l7 + %g5]
	set	0x27, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l3
	set	0x30, %i2
	sta	%f17,	[%l7 + %i2] 0x89
	set	0x7C, %l3
	stwa	%l2,	[%l7 + %l3] 0x89
	nop
	set	0x55, %i7
	ldub	[%l7 + %i7],	%o1
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f12
	nop
	set	0x41, %l0
	ldstub	[%l7 + %l0],	%g1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%g7
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x80,	%f16
	nop
	nop
	setx	0x00FAADE742AC11B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8E8CD2B0963D76D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f8,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%l6
	set	0x68, %l5
	sta	%f4,	[%l7 + %l5] 0x88
	nop
	set	0x23, %i3
	ldstub	[%l7 + %i3],	%i6
	nop
	set	0x38, %o5
	ldsh	[%l7 + %o5],	%i5
	nop
	set	0x24, %l4
	prefetch	[%l7 + %l4],	 3
	add	%g4,	%i7,	%o6
	and	%l4,	%o4,	%o5
	nop
	set	0x0C, %l1
	stw	%i2,	[%l7 + %l1]
	set	0x5C, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o0
	or	%o3,	%g6,	%i3
	add	%o7,	%l5,	%g5
	nop
	set	0x33, %g2
	stb	%g3,	[%l7 + %g2]
	set	0x30, %l6
	prefetcha	[%l7 + %l6] 0x81,	 4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%o2
	set	0x60, %i4
	ldda	[%l7 + %i4] 0x80,	%l0
	nop
	set	0x7C, %o7
	swap	[%l7 + %o7],	%l3
	add	%l0,	%o1,	%l2
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x80,	%g1
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xea,	%i4
	nop
	set	0x1C, %o3
	swap	[%l7 + %o3],	%g7
	nop
	set	0x54, %g7
	stw	%g2,	[%l7 + %g7]
	nop
	set	0x76, %i0
	ldsh	[%l7 + %i0],	%l6
	st	%fsr,	[%l7 + 0x0C]
	bge,pn	%icc,	loop_115
	nop
	set	0x70, %o0
	std	%i6,	[%l7 + %o0]
	or	%g4,	%i5,	%o6
	set	0x20, %i6
	stda	%i6,	[%l7 + %i6] 0x88
loop_115:
	nop
	set	0x5C, %g4
	stw	%o4,	[%l7 + %g4]
	and	%o5,	%l4,	%o0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x63B, 	%sys_tick_cmpr
	set	0x30, %o2
	prefetcha	[%l7 + %o2] 0x80,	 3
	nop
	set	0x10, %i1
	stw	%o7,	[%l7 + %i1]
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x89
	nop
	set	0x5C, %g5
	stw	%l5,	[%l7 + %g5]
	set	0x68, %i2
	lda	[%l7 + %i2] 0x81,	%f5
	nop
	set	0x49, %l2
	ldstub	[%l7 + %l2],	%i2
	nop
	set	0x4E, %l3
	ldsh	[%l7 + %l3],	%g5
	nop
	set	0x28, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x29, %i7
	stba	%i1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x4E, %o4
	sth	%g3,	[%l7 + %o4]
	add	%o2,	%l1,	%l3
	nop
	set	0x58, %l0
	std	%f28,	[%l7 + %l0]
	set	0x38, %l5
	ldxa	[%l7 + %l5] 0x81,	%i0
	st	%f16,	[%l7 + 0x78]
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%l0
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%l2
	nop
	set	0x5C, %l1
	prefetch	[%l7 + %l1],	 1
	st	%f23,	[%l7 + 0x3C]
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x81,	%g1
	bn,a	%icc,	loop_116
	nop
	set	0x76, %g2
	ldsb	[%l7 + %g2],	%i4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%g2
loop_116:
	ld	[%l7 + 0x18],	%f14
	set	0x18, %l6
	sta	%f22,	[%l7 + %l6] 0x89
	bl,pn	%icc,	loop_117
	nop
	set	0x1C, %i4
	stw	%g7,	[%l7 + %i4]
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%i6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x80,	%g4,	%i5
loop_117:
	nop
	set	0x10, %o7
	lda	[%l7 + %o7] 0x80,	%f9
	nop
	set	0x38, %o1
	lduw	[%l7 + %o1],	%l6
	st	%fsr,	[%l7 + 0x3C]
	nop
	set	0x70, %i5
	std	%o6,	[%l7 + %i5]
	set	0x65, %o3
	ldstuba	[%l7 + %o3] 0x80,	%i7
	nop
	set	0x08, %g7
	stw	%o4,	[%l7 + %g7]
	nop
	set	0x50, %i0
	lduw	[%l7 + %i0],	%o5
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf1
	membar	#Sync
	add	%l4,	%o3,	%g6
	nop
	set	0x6E, %g4
	ldsb	[%l7 + %g4],	%i3
	nop
	set	0x5F, %o6
	ldstub	[%l7 + %o6],	%o0
	set	0x74, %o0
	lda	[%l7 + %o0] 0x81,	%f1
	set	0x30, %i1
	ldda	[%l7 + %i1] 0x89,	%l4
	nop
	set	0x16, %g1
	sth	%o7,	[%l7 + %g1]
	nop
	set	0x41, %g5
	stb	%i2,	[%l7 + %g5]
	nop
	set	0x30, %i2
	std	%g4,	[%l7 + %i2]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x80
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%o2
	bl	%icc,	loop_118
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f10
	add	%l1,	%l3,	%i1
	nop
	set	0x49, %g6
	ldub	[%l7 + %g6],	%l0
loop_118:
	nop
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd0,	%f16
	fpsub16s	%f31,	%f3,	%f17
	ld	[%l7 + 0x7C],	%f11
	nop
	set	0x5C, %l0
	swap	[%l7 + %l0],	%i0
	or	%l2,	%i4,	%g1
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%g2
	set	0x68, %i7
	stwa	%o1,	[%l7 + %i7] 0x81
	set	0x24, %l4
	sta	%f26,	[%l7 + %l4] 0x80
	nop
	set	0x5C, %l1
	ldsh	[%l7 + %l1],	%g7
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x88,	%i6
	nop
	set	0x40, %g3
	std	%f20,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x40]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xd8,	%f16
	nop
	set	0x08, %l6
	ldstub	[%l7 + %l6],	%i5
	set	0x08, %i4
	sta	%f27,	[%l7 + %i4] 0x88
	nop
	set	0x64, %o7
	ldsw	[%l7 + %o7],	%g4
	bg,a,pn	%xcc,	loop_119
	nop
	set	0x36, %o5
	ldub	[%l7 + %o5],	%o6
	nop
	set	0x20, %i5
	std	%i6,	[%l7 + %i5]
	st	%fsr,	[%l7 + 0x68]
loop_119:
	nop
	set	0x28, %o1
	sta	%f11,	[%l7 + %o1] 0x80
	nop
	set	0x50, %o3
	lduh	[%l7 + %o3],	%o4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%i7
	fpadd16s	%f16,	%f8,	%f9
	or	%o3,	%l4,	%g6
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x88,	%o0
	set	0x60, %i0
	stxa	%i3,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x7F, %i6
	stb	%l5,	[%l7 + %i6]
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%o7
	nop
	set	0x64, %o0
	lduw	[%l7 + %o0],	%i2
	set	0x08, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	nop
	set	0x58, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x38, %g5
	stw	%o2,	[%l7 + %g5]
	or	%l1,	%g3,	%i1
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%f4
	bgu,a,pt	%icc,	loop_120
	nop
	set	0x78, %g1
	std	%l0,	[%l7 + %g1]
	set	0x38, %o2
	stxa	%l3,	[%l7 + %o2] 0x89
loop_120:
	nop
	set	0x08, %l3
	ldstub	[%l7 + %l3],	%i0
	nop
	set	0x43, %l2
	ldub	[%l7 + %l2],	%l2
	set	0x20, %g6
	ldxa	[%l7 + %g6] 0x89,	%g1
	set	0x58, %l0
	lda	[%l7 + %l0] 0x88,	%f11
	nop
	set	0x14, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x37, %i7
	ldsb	[%l7 + %i7],	%g2
	nop
	set	0x42, %l5
	ldsb	[%l7 + %l5],	%o1
	nop
	set	0x40, %l1
	std	%g6,	[%l7 + %l1]
	set	0x6C, %i3
	stba	%i4,	[%l7 + %i3] 0x89
	set	0x1A, %l4
	stba	%i5,	[%l7 + %l4] 0xe2
	membar	#Sync
	add	%g4,	%i6,	%l6
	set	0x28, %g2
	lda	[%l7 + %g2] 0x88,	%f13
	nop
	set	0x2A, %l6
	ldstub	[%l7 + %l6],	%o6
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x88,	 3
	and	%i7,	%o4,	%l4
	fpsub32	%f14,	%f24,	%f14
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x42, %g3
	ldsb	[%l7 + %g3],	%o3
	set	0x48, %o7
	ldxa	[%l7 + %o7] 0x89,	%o0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g6,	%l5
	set	0x67, %i5
	ldstuba	[%l7 + %i5] 0x88,	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%i2
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%g4
	nop
	set	0x3F, %o3
	ldsb	[%l7 + %o3],	%l1
	nop
	set	0x14, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x78, %i0
	ldxa	[%l7 + %i0] 0x88,	%g3
	set	0x28, %i6
	ldstuba	[%l7 + %i6] 0x80,	%o2
	nop
	set	0x58, %o5
	stx	%l0,	[%l7 + %o5]
	nop
	set	0x68, %o6
	ldx	[%l7 + %o6],	%l3
	or	%i0,	%l2,	%g1
	nop
	set	0x6E, %g4
	ldub	[%l7 + %g4],	%i1
	nop
	set	0x78, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x3C, %o0
	sth	%o1,	[%l7 + %o0]
	nop
	set	0x70, %i2
	stx	%fsr,	[%l7 + %i2]
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%g2
	set	0x24, %g1
	sta	%f3,	[%l7 + %g1] 0x81
	or	%i4,	%i5,	%g4
	nop
	set	0x18, %o2
	lduh	[%l7 + %o2],	%g7
	nop
	set	0x68, %l3
	std	%i6,	[%l7 + %l3]
	nop
	set	0x54, %l2
	prefetch	[%l7 + %l2],	 2
	nop
	set	0x10, %g6
	lduw	[%l7 + %g6],	%o6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o5
	nop
	set	0x28, %o4
	std	%f14,	[%l7 + %o4]
	set	0x28, %l0
	lda	[%l7 + %l0] 0x89,	%f3
	nop
	set	0x28, %l5
	ldx	[%l7 + %l5],	%o4
	set	0x6C, %i7
	sta	%f27,	[%l7 + %i7] 0x88
	nop
	set	0x5E, %l1
	ldstub	[%l7 + %l1],	%i7
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x81,	%l4
	nop
	set	0x74, %g2
	stw	%o3,	[%l7 + %g2]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f2
	set	0x18, %l6
	sta	%f14,	[%l7 + %l6] 0x89
	set	0x58, %o7
	swapa	[%l7 + %o7] 0x81,	%g6
	nop
	set	0x33, %g3
	stb	%l5,	[%l7 + %g3]
	wr	%i3,	%o7,	%pic
	set	0x30, %i5
	swapa	[%l7 + %i5] 0x89,	%i2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	nop
	set	0x4C, %g7
	ldsw	[%l7 + %g7],	%g5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%g3
	or	%o2,	%l0,	%l1
	nop
	set	0x64, %o1
	ldsw	[%l7 + %o1],	%i0
	set	0x48, %i0
	stxa	%l3,	[%l7 + %i0] 0xe3
	membar	#Sync
	nop
	set	0x28, %o5
	std	%l2,	[%l7 + %o5]
	nop
	set	0x18, %o6
	lduw	[%l7 + %o6],	%i1
	nop
	set	0x10, %i6
	stx	%g1,	[%l7 + %i6]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f16
	or	%g2,	%i4,	%i5
	set	0x14, %o0
	stwa	%o1,	[%l7 + %o0] 0xea
	membar	#Sync
	ld	[%l7 + 0x1C],	%f4
	fpsub16s	%f28,	%f2,	%f16
	set	0x1A, %i2
	stha	%g7,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x08, %i1
	lduw	[%l7 + %i1],	%g4
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f0
	nop
	set	0x1A, %o2
	sth	%o6,	[%l7 + %o2]
	or	%l6,	%i6,	%o4
	fpadd32s	%f15,	%f3,	%f26
	nop
	set	0x28, %g1
	prefetch	[%l7 + %g1],	 3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f0
	nop
	set	0x2F, %l2
	ldstub	[%l7 + %l2],	%o5
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x88,	%i7
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f6
	nop
	set	0x74, %o4
	lduw	[%l7 + %o4],	%l4
	set	0x50, %l5
	stba	%g6,	[%l7 + %l5] 0x88
	nop
	set	0x3C, %i7
	ldsb	[%l7 + %i7],	%o3
	nop
	set	0x7E, %l1
	stb	%l5,	[%l7 + %l1]
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x80,	%i3
	nop
	set	0x26, %g2
	sth	%i2,	[%l7 + %g2]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x88,	%o7,	%o0
	nop
	set	0x69, %i4
	ldub	[%l7 + %i4],	%g3
	and	%g5,	%o2,	%l0
	set	0x50, %i3
	swapa	[%l7 + %i3] 0x80,	%i0
	nop
	set	0x3E, %o7
	stb	%l1,	[%l7 + %o7]
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x38, %i5
	prefetch	[%l7 + %i5],	 0
	set	0x3A, %o3
	stha	%l3,	[%l7 + %o3] 0x80
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x73, %o1
	stb	%i1,	[%l7 + %o1]
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%l2
	add	%g1,	%i4,	%g2
	add	%i5,	%o1,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%g7
	set	0x64, %i0
	sta	%f2,	[%l7 + %i0] 0x88
	nop
	set	0x6C, %o6
	prefetch	[%l7 + %o6],	 4
	nop
	set	0x42, %i6
	sth	%i6,	[%l7 + %i6]
	and	%o4,	%l6,	%o5
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x89
	set	0x48, %g4
	lda	[%l7 + %g4] 0x89,	%f12
	nop
	set	0x60, %i2
	stw	%l4,	[%l7 + %i2]
	and	%i7,	%o3,	%l5
	set	0x2C, %o0
	sta	%f26,	[%l7 + %o0] 0x81
	wr	%i3,	%g6,	%clear_softint
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x89
	or	%i2,	%o0,	%o7
	nop
	set	0x52, %i1
	lduh	[%l7 + %i1],	%g3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%l0
	be,a,pt	%xcc,	loop_121
	nop
	set	0x3F, %o2
	stb	%i0,	[%l7 + %o2]
	set	0x50, %l3
	lda	[%l7 + %l3] 0x88,	%f7
loop_121:
	nop
	set	0x2C, %g1
	lda	[%l7 + %g1] 0x80,	%f18
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x89,	%f16
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%l3
	or	%i1,	%l2,	%g5
	nop
	set	0x7F, %g6
	ldub	[%l7 + %g6],	%g1
	nop
	set	0x2C, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x50, %o4
	ldsw	[%l7 + %o4],	%g2
	nop
	set	0x42, %l5
	sth	%i5,	[%l7 + %l5]
	add	%o1,	%g4,	%i4
	set	0x20, %i7
	stwa	%o6,	[%l7 + %i7] 0x80
	st	%f23,	[%l7 + 0x14]
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%g7,	%i6,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%l4
	nop
	set	0x74, %l1
	lduh	[%l7 + %l1],	%i7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%l5
	set	0x40, %g2
	stxa	%i3,	[%l7 + %g2] 0x89
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%g6
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%i2
	st	%f24,	[%l7 + 0x3C]
	set	0x18, %g3
	prefetcha	[%l7 + %g3] 0x80,	 4
	set	0x58, %i4
	sta	%f13,	[%l7 + %i4] 0x89
	nop
	set	0x14, %o3
	lduh	[%l7 + %o3],	%o7
	set	0x18, %g7
	prefetcha	[%l7 + %g7] 0x81,	 3
	add	%o2,	%g3,	%i0
	nop
	set	0x7E, %o1
	ldub	[%l7 + %o1],	%l1
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x70, %i0
	std	%l0,	[%l7 + %i0]
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%l2
	nop
	nop
	setx	0x5CF2D8ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF4F76BF6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f13,	%f16
	set	0x2D, %i6
	stba	%l2,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x22, %o5
	stha	%g5,	[%l7 + %o5] 0x81
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x3E, %g4
	lduh	[%l7 + %g4],	%g2
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%i5
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%g4
	st	%f29,	[%l7 + 0x5C]
	set	0x28, %g5
	ldxa	[%l7 + %g5] 0x89,	%o1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xda,	%f0
	nop
	set	0x3E, %o0
	ldsb	[%l7 + %o0],	%i4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%o6
	set	0x20, %g1
	lda	[%l7 + %g1] 0x89,	%f21
	nop
	set	0x60, %g6
	ldsw	[%l7 + %g6],	%i6
	nop
	set	0x4F, %l2
	ldstub	[%l7 + %l2],	%g7
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%l4
	nop
	set	0x30, %o4
	stw	%i7,	[%l7 + %o4]
	set	0x38, %l0
	stda	%i6,	[%l7 + %l0] 0xe3
	membar	#Sync
	nop
	set	0x10, %i7
	lduh	[%l7 + %i7],	%o4
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x88,	%f16
	set	0x60, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%l4
	nop
	set	0x6C, %i3
	lduw	[%l7 + %i3],	%i2
	set	0x28, %l5
	stxa	%o3,	[%l7 + %l5] 0x80
	set	0x50, %g3
	stwa	%g6,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xf0
	membar	#Sync
	set	0x1C, %o3
	ldstuba	[%l7 + %o3] 0x80,	%o0
	nop
	set	0x54, %o7
	ldsw	[%l7 + %o7],	%o2
	set	0x38, %g7
	ldxa	[%l7 + %g7] 0x81,	%o7
	add	%g3,	%l1,	%i0
	set	0x40, %o1
	stwa	%l3,	[%l7 + %o1] 0xe3
	membar	#Sync
	st	%f13,	[%l7 + 0x20]
	nop
	set	0x14, %i0
	sth	%l0,	[%l7 + %i0]
	nop
	set	0x7C, %o6
	ldsh	[%l7 + %o6],	%g5
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%l2
	nop
	set	0x6A, %o5
	sth	%i1,	[%l7 + %o5]
	or	%g1,	%i5,	%g2
	set	0x18, %g4
	stwa	%g4,	[%l7 + %g4] 0xeb
	membar	#Sync
	add	%i4,	%o1,	%i6
	st	%f26,	[%l7 + 0x54]
	set	0x60, %i6
	stda	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	ld	[%l7 + 0x30],	%f0
	set	0x08, %i2
	ldxa	[%l7 + %i2] 0x89,	%o5
	nop
	set	0x28, %i5
	std	%l4,	[%l7 + %i5]
	set	0x10, %g5
	stxa	%i7,	[%l7 + %g5] 0xea
	membar	#Sync
	nop
	set	0x2E, %o0
	ldstub	[%l7 + %o0],	%o6
	bge,a,pt	%xcc,	loop_122
	nop
	set	0x28, %i1
	lduw	[%l7 + %i1],	%l6
	nop
	set	0x18, %l3
	ldstub	[%l7 + %l3],	%i3
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x81,	%l4
loop_122:
	nop
	set	0x18, %o2
	swapa	[%l7 + %o2] 0x81,	%i2
	nop
	set	0x50, %l2
	lduw	[%l7 + %l2],	%o3
	set	0x7B, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g6
	add	%o4,	%o0,	%o7
	set	0x17, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g3
	set	0x19, %i7
	stba	%l1,	[%l7 + %i7] 0x88
	wr	%i0,	%o2,	%y
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l3,	%g5
	bgu,a	%xcc,	loop_123
	nop
	set	0x20, %l0
	ldsh	[%l7 + %l0],	%l2
	set	0x40, %l4
	stxa	%l0,	[%l7 + %l4] 0xe3
	membar	#Sync
loop_123:
	wr	%i1,	%i5,	%y
	nop
	set	0x4C, %g2
	ldsh	[%l7 + %g2],	%g2
	nop
	set	0x12, %i3
	ldub	[%l7 + %i3],	%g4
	set	0x08, %l1
	stha	%g1,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x71, %l5
	stb	%i4,	[%l7 + %l5]
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x88,	%i6
	nop
	set	0x7A, %o3
	sth	%g7,	[%l7 + %o3]
	set	0x30, %o7
	swapa	[%l7 + %o7] 0x89,	%o1
	nop
	set	0x12, %i4
	stb	%o5,	[%l7 + %i4]
	add	%l4,	%o6,	%i7
	nop
	set	0x0A, %o1
	ldsh	[%l7 + %o1],	%i3
	nop
	set	0x7C, %g7
	swap	[%l7 + %g7],	%l6
	nop
	nop
	setx	0x154DA4A8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x6C6F852D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f15,	%f1
	nop
	set	0x52, %o6
	ldsb	[%l7 + %o6],	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%i2
	set	0x60, %i0
	ldda	[%l7 + %i0] 0xeb,	%o4
	nop
	set	0x78, %o5
	ldsh	[%l7 + %o5],	%g6
	nop
	set	0x50, %l6
	std	%o6,	[%l7 + %l6]
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x88,	 0
	nop
	set	0x78, %i2
	ldub	[%l7 + %i2],	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l1,	%o2
	st	%f7,	[%l7 + 0x60]
	and	%l3,	%i0,	%l2
	set	0x38, %i5
	ldxa	[%l7 + %i5] 0x88,	%g5
	nop
	set	0x36, %i6
	ldsh	[%l7 + %i6],	%l0
	or	%i1,	%i5,	%g2
	nop
	set	0x4A, %g5
	ldstub	[%l7 + %g5],	%g4
	add	%i4,	%i6,	%g7
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x88,	%o0
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x88,	 3
	st	%f6,	[%l7 + 0x50]
	bge	%xcc,	loop_124
	nop
	set	0x28, %g1
	std	%f14,	[%l7 + %g1]
	bne	%icc,	loop_125
	nop
	set	0x5F, %o2
	ldub	[%l7 + %o2],	%l4
loop_124:
	nop
	set	0x5F, %l3
	ldsb	[%l7 + %l3],	%g1
	set	0x60, %o4
	swapa	[%l7 + %o4] 0x81,	%o6
loop_125:
	nop
	set	0x4A, %g6
	stha	%i3,	[%l7 + %g6] 0xe2
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%i7
	nop
	set	0x24, %i7
	ldstub	[%l7 + %i7],	%l5
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%i2
	nop
	set	0x40, %l4
	stx	%fsr,	[%l7 + %l4]
	nop
	set	0x7C, %g2
	swap	[%l7 + %g2],	%o4
	set	0x76, %l2
	stha	%o3,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x18, %l1
	stwa	%g6,	[%l7 + %l1] 0x80
	and	%g3,	%o0,	%l1
	set	0x58, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o7
	nop
	set	0x38, %l5
	std	%f24,	[%l7 + %l5]
	nop
	set	0x30, %o3
	std	%f16,	[%l7 + %o3]
	nop
	set	0x70, %o7
	ldd	[%l7 + %o7],	%f4
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%f6
	nop
	set	0x58, %i4
	stx	%o2,	[%l7 + %i4]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x81,	%i0,	%l2
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%g4
	nop
	set	0x14, %o6
	ldub	[%l7 + %o6],	%l0
	set	0x7C, %o1
	stwa	%l3,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x88,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%g2
	set	0x20, %l6
	lda	[%l7 + %l6] 0x89,	%f2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%g4
	nop
	set	0x4A, %g4
	sth	%i6,	[%l7 + %g4]
	nop
	set	0x78, %o5
	std	%g6,	[%l7 + %o5]
	nop
	set	0x52, %i2
	ldub	[%l7 + %i2],	%o1
	nop
	set	0x44, %i5
	sth	%i4,	[%l7 + %i5]
	nop
	set	0x35, %g5
	stb	%l4,	[%l7 + %g5]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%o6
	nop
	set	0x2D, %o0
	ldsb	[%l7 + %o0],	%i3
	ld	[%l7 + 0x6C],	%f3
	nop
	set	0x50, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%l6
	nop
	set	0x58, %o2
	lduw	[%l7 + %o2],	%i7
	set	0x20, %l3
	ldda	[%l7 + %l3] 0xe2,	%g0
	set	0x79, %g1
	stba	%l5,	[%l7 + %g1] 0x89
	nop
	set	0x66, %g6
	ldstub	[%l7 + %g6],	%o4
	and	%i2,	%g6,	%g3
	set	0x38, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0
	nop
	set	0x1E, %o4
	sth	%o3,	[%l7 + %o4]
	nop
	set	0x48, %l4
	swap	[%l7 + %l4],	%l1
	st	%f19,	[%l7 + 0x2C]
	nop
	set	0x26, %l0
	ldsh	[%l7 + %l0],	%o2
	set	0x34, %l2
	lda	[%l7 + %l2] 0x80,	%f6
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xd2
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f20
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i0
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%l2
	nop
	set	0x5B, %o3
	ldub	[%l7 + %o3],	%g5
	nop
	set	0x10, %o7
	stx	%o7,	[%l7 + %o7]
	nop
	set	0x10, %i4
	swap	[%l7 + %i4],	%l3
	nop
	set	0x40, %g3
	ldsb	[%l7 + %g3],	%i1
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x81,	 2
	set	0x08, %o1
	stda	%i4,	[%l7 + %o1] 0x88
	nop
	set	0x16, %i0
	ldsh	[%l7 + %i0],	%g4
	set	0x76, %o6
	stba	%i6,	[%l7 + %o6] 0xe3
	membar	#Sync
	or	%g7,	%g2,	%i4
	nop
	set	0x14, %g4
	prefetch	[%l7 + %g4],	 0
	set	0x38, %o5
	swapa	[%l7 + %o5] 0x88,	%o1
	st	%fsr,	[%l7 + 0x34]
	nop
	set	0x64, %i2
	lduh	[%l7 + %i2],	%l4
	nop
	set	0x70, %i5
	lduw	[%l7 + %i5],	%o5
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe3,	%o6
	set	0x54, %l6
	ldstuba	[%l7 + %l6] 0x89,	%l6
	and	%i3,	%i7,	%g1
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x88,	%f4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%i2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd2
	nop
	set	0x26, %o2
	ldub	[%l7 + %o2],	%g6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf9
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc2
	nop
	set	0x44, %g6
	swap	[%l7 + %g6],	%g3
	nop
	set	0x60, %g1
	stx	%l5,	[%l7 + %g1]
	set	0x50, %o4
	ldda	[%l7 + %o4] 0xea,	%o0
	nop
	set	0x79, %l4
	stb	%o3,	[%l7 + %l4]
	set	0x48, %i7
	stda	%o2,	[%l7 + %i7] 0x88
	st	%fsr,	[%l7 + 0x30]
	set	0x78, %l2
	swapa	[%l7 + %l2] 0x80,	%i0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf0,	%f16
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xda,	%f16
	nop
	set	0x2E, %g2
	sth	%l1,	[%l7 + %g2]
	set	0x6F, %i3
	stba	%g5,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x50, %l5
	ldda	[%l7 + %l5] 0xeb,	%l2
	set	0x38, %o3
	ldxa	[%l7 + %o3] 0x80,	%o7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i1,	%l0
	nop
	set	0x20, %o7
	std	%f30,	[%l7 + %o7]
	set	0x56, %i4
	stba	%i5,	[%l7 + %i4] 0xe2
	membar	#Sync
	st	%f27,	[%l7 + 0x08]
	nop
	set	0x1B, %g7
	ldsb	[%l7 + %g7],	%g4
	set	0x60, %g3
	lda	[%l7 + %g3] 0x80,	%f1
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x7C, %i0
	lduw	[%l7 + %i0],	%l3
	set	0x50, %o6
	swapa	[%l7 + %o6] 0x89,	%g7
	nop
	set	0x60, %o1
	ldd	[%l7 + %o1],	%g2
	ld	[%l7 + 0x30],	%f18
	st	%f14,	[%l7 + 0x40]
	set	0x30, %g4
	lda	[%l7 + %g4] 0x81,	%f28
	add	%i4,	%i6,	%o1
	or	%o5,	%o6,	%l6
	set	0x10, %o5
	sta	%f15,	[%l7 + %o5] 0x88
	set	0x52, %i2
	stha	%l4,	[%l7 + %i2] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i3
	ld	[%l7 + 0x70],	%f4
	and	%o4,	%g1,	%i2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xf8
	membar	#Sync
	nop
	set	0x14, %l6
	stb	%g6,	[%l7 + %l6]
	and	%l5,	%g3,	%o0
	nop
	set	0x76, %i5
	sth	%o3,	[%l7 + %i5]
	set	0x54, %i6
	sta	%f22,	[%l7 + %i6] 0x89
	set	0x10, %o0
	ldda	[%l7 + %o0] 0xe3,	%i0
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%o2
	nop
	set	0x6C, %i1
	stw	%l1,	[%l7 + %i1]
	set	0x12, %o2
	ldstuba	[%l7 + %o2] 0x88,	%g5
	set	0x5C, %g6
	sta	%f10,	[%l7 + %g6] 0x88
	nop
	set	0x20, %o4
	ldsw	[%l7 + %o4],	%l2
	set	0x1C, %l4
	stwa	%o7,	[%l7 + %l4] 0x81
	and	%i1,	%i5,	%l0
	add	%g4,	%l3,	%g2
	set	0x70, %g1
	ldda	[%l7 + %g1] 0xe2,	%g6
	add	%i6,	%o1,	%i4
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x81,	%f0
	or	%o5,	%o6,	%l6
	st	%f8,	[%l7 + 0x1C]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x88,	%i7,	%i3
	nop
	set	0x70, %l0
	std	%l4,	[%l7 + %l0]
	set	0x34, %i7
	sta	%f10,	[%l7 + %i7] 0x81
	nop
	set	0x10, %l1
	ldx	[%l7 + %l1],	%g1
	nop
	nop
	setx	0x3A5035E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x49EA9CD7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f27,	%f22
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f0
	nop
	set	0x7C, %l5
	ldsw	[%l7 + %l5],	%i2
	set	0x6A, %o3
	stba	%o4,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x10, %o7
	ldx	[%l7 + %o7],	%g6
	st	%f28,	[%l7 + 0x14]
	and	%g3,	%o0,	%o3
	set	0x28, %g2
	ldxa	[%l7 + %g2] 0x88,	%l5
	nop
	set	0x08, %i4
	std	%f20,	[%l7 + %i4]
	set	0x17, %g7
	ldstuba	[%l7 + %g7] 0x81,	%i0
	set	0x54, %g3
	sta	%f19,	[%l7 + %g3] 0x81
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f16
	nop
	set	0x1E, %o6
	stb	%o2,	[%l7 + %o6]
	set	0x48, %o1
	stxa	%g5,	[%l7 + %o1] 0x89
	set	0x70, %o5
	stba	%l1,	[%l7 + %o5] 0xeb
	membar	#Sync
	ld	[%l7 + 0x68],	%f11
	nop
	set	0x78, %i2
	std	%l2,	[%l7 + %i2]
	nop
	set	0x19, %g5
	stb	%o7,	[%l7 + %g5]
	set	0x38, %g4
	sta	%f21,	[%l7 + %g4] 0x88
	st	%fsr,	[%l7 + 0x50]
	ld	[%l7 + 0x08],	%f29
	nop
	set	0x30, %i5
	stx	%i1,	[%l7 + %i5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i5,	%g4
	nop
	set	0x5C, %l6
	swap	[%l7 + %l6],	%l0
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf0,	%f16
	set	0x53, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g2
	nop
	set	0x34, %i1
	lduw	[%l7 + %i1],	%g7
	nop
	set	0x28, %o2
	stx	%i6,	[%l7 + %o2]
	ld	[%l7 + 0x40],	%f9
	set	0x20, %o0
	ldxa	[%l7 + %o0] 0x88,	%o1
	st	%f3,	[%l7 + 0x68]
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f18
	and	%l3,	%o5,	%i4
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x80,	%l6
	set	0x68, %l4
	ldxa	[%l7 + %l4] 0x80,	%o6
	nop
	set	0x68, %l2
	stw	%i7,	[%l7 + %l2]
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 4
	set	0x18, %g1
	stda	%i2,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x20, %l1
	stw	%l4,	[%l7 + %l1]
	nop
	set	0x61, %i7
	ldub	[%l7 + %i7],	%g1
	and	%o4,	%g6,	%g3
	nop
	set	0x38, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf0
	membar	#Sync
	set	0x18, %o7
	ldstuba	[%l7 + %o7] 0x89,	%o0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%i2
	wr	%i0,	%o2,	%clear_softint
	set	0x67, %g2
	stba	%g5,	[%l7 + %g2] 0xeb
	membar	#Sync
	nop
	set	0x48, %o3
	std	%l0,	[%l7 + %o3]
	or	%l5,	%l2,	%i1
	nop
	set	0x08, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x60, %g3
	sta	%f20,	[%l7 + %g3] 0x88
	and	%o7,	%i5,	%g4
	nop
	set	0x08, %i0
	stx	%l0,	[%l7 + %i0]
	set	0x2C, %o6
	stwa	%g2,	[%l7 + %o6] 0xea
	membar	#Sync
	set	0x78, %o1
	lda	[%l7 + %o1] 0x88,	%f0
	set	0x48, %o5
	sta	%f21,	[%l7 + %o5] 0x80
	set	0x6C, %g7
	swapa	[%l7 + %g7] 0x89,	%g7
	nop
	set	0x40, %g5
	stx	%i6,	[%l7 + %g5]
	nop
	set	0x40, %g4
	std	%f12,	[%l7 + %g4]
	st	%f17,	[%l7 + 0x6C]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%o5
	nop
	set	0x40, %i2
	ldd	[%l7 + %i2],	%l2
	nop
	set	0x20, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x20, %i5
	ldsh	[%l7 + %i5],	%l6
	set	0x68, %i6
	sta	%f27,	[%l7 + %i6] 0x80
	be,a	%xcc,	loop_126
	nop
	set	0x60, %i1
	prefetch	[%l7 + %i1],	 2
	nop
	set	0x50, %o2
	ldd	[%l7 + %o2],	%f28
	nop
	set	0x3A, %l3
	sth	%o6,	[%l7 + %l3]
loop_126:
	nop
	set	0x66, %o0
	stha	%i7,	[%l7 + %o0] 0xea
	membar	#Sync
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x80
	nop
	set	0x60, %l4
	ldx	[%l7 + %l4],	%i4
	nop
	set	0x50, %l2
	ldx	[%l7 + %l2],	%i3
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc4
	nop
	set	0x39, %g1
	stb	%l4,	[%l7 + %g1]
	ld	[%l7 + 0x30],	%f25
	set	0x18, %l0
	stda	%g0,	[%l7 + %l0] 0xea
	membar	#Sync
	nop
	set	0x76, %l1
	ldub	[%l7 + %l1],	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x88,	%g3,	%g6
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f6
	set	0x11, %i3
	stba	%o3,	[%l7 + %i3] 0xea
	membar	#Sync
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	nop
	set	0x3C, %l5
	prefetch	[%l7 + %l5],	 4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%i0
	set	0x78, %o3
	stxa	%o0,	[%l7 + %o3] 0x88
	set	0x20, %i4
	stxa	%o2,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x0B, %g3
	ldsb	[%l7 + %g3],	%g5
	nop
	set	0x55, %g2
	ldsb	[%l7 + %g2],	%l1
	set	0x36, %o6
	stba	%l2,	[%l7 + %o6] 0xea
	membar	#Sync
	and	%i1,	%l5,	%i5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	add	%g4,	%l0,	%g2
	nop
	set	0x65, %o5
	ldstub	[%l7 + %o5],	%g7
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 0
	set	0x18, %i0
	stxa	%i6,	[%l7 + %i0] 0x88
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	ble,a	%xcc,	loop_127
	nop
	set	0x10, %g5
	ldsh	[%l7 + %g5],	%o7
	nop
	set	0x37, %i2
	ldsb	[%l7 + %i2],	%o1
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%o5
loop_127:
	nop
	set	0x0C, %i5
	stw	%l3,	[%l7 + %i5]
	nop
	set	0x18, %i6
	stw	%o6,	[%l7 + %i6]
	nop
	set	0x78, %i1
	stx	%i7,	[%l7 + %i1]
	set	0x30, %o2
	ldxa	[%l7 + %o2] 0x80,	%l6
	add	%i4,	%i3,	%l4
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f26
	nop
	nop
	setx	0x42E4B59A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x90DC4B8E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f7,	%f0
	nop
	set	0x50, %g6
	ldd	[%l7 + %g6],	%o4
	set	0x40, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	fpsub32	%f24,	%f14,	%f24
	fpadd32s	%f13,	%f6,	%f31
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g6,	%o3
	nop
	set	0x30, %l2
	stx	%g1,	[%l7 + %l2]
	fpadd32	%f24,	%f22,	%f20
	set	0x60, %o4
	ldda	[%l7 + %o4] 0x88,	%i2
	nop
	set	0x54, %g1
	sth	%i0,	[%l7 + %g1]
	nop
	set	0x34, %l3
	ldub	[%l7 + %l3],	%o2
	nop
	set	0x23, %l1
	ldsb	[%l7 + %l1],	%g5
	ld	[%l7 + 0x64],	%f14
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%l1
	nop
	set	0x58, %l0
	std	%f0,	[%l7 + %l0]
	nop
	set	0x4D, %i3
	stb	%i1,	[%l7 + %i3]
	wr	%l5,	%l2,	%pic
	nop
	set	0x21, %o7
	ldsb	[%l7 + %o7],	%i5
	set	0x0C, %i7
	lda	[%l7 + %i7] 0x88,	%f17
	set	0x08, %l5
	sta	%f23,	[%l7 + %l5] 0x81
	nop
	set	0x6E, %o3
	lduh	[%l7 + %o3],	%l0
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f0
	nop
	set	0x60, %g3
	ldx	[%l7 + %g3],	%g4
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f16
	wr	%g7,	%g2,	%y
	nop
	set	0x7A, %o1
	ldstub	[%l7 + %o1],	%o7
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf9,	%f0
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%f14
	st	%fsr,	[%l7 + 0x14]
	nop
	set	0x54, %i0
	stw	%i6,	[%l7 + %i0]
	nop
	nop
	setx	0x69E57F28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF9689E0F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f31,	%f11
	nop
	set	0x71, %g7
	stb	%o1,	[%l7 + %g7]
	nop
	set	0x5C, %g5
	prefetch	[%l7 + %g5],	 3
	nop
	set	0x20, %i2
	sth	%l3,	[%l7 + %i2]
	set	0x3C, %l6
	swapa	[%l7 + %l6] 0x88,	%o5
	set	0x78, %g4
	prefetcha	[%l7 + %g4] 0x81,	 1
	set	0x76, %i5
	stha	%l6,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f6
	nop
	set	0x38, %o2
	stx	%i4,	[%l7 + %o2]
	set	0x78, %o0
	stda	%o6,	[%l7 + %o0] 0x88
	nop
	set	0x3C, %i6
	prefetch	[%l7 + %i6],	 4
	set	0x70, %l4
	prefetcha	[%l7 + %l4] 0x81,	 3
	nop
	set	0x18, %l2
	stx	%o4,	[%l7 + %l2]
	add	%g3,	%i3,	%o3
	nop
	set	0x34, %o4
	prefetch	[%l7 + %o4],	 4
	or	%g6,	%i2,	%g1
	nop
	set	0x48, %g1
	std	%f26,	[%l7 + %g1]
	nop
	set	0x48, %g6
	std	%o2,	[%l7 + %g6]
	nop
	set	0x34, %l1
	stb	%g5,	[%l7 + %l1]
	nop
	set	0x19, %l0
	ldsb	[%l7 + %l0],	%i0
	set	0x18, %l3
	sta	%f1,	[%l7 + %l3] 0x88
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%l0
	nop
	set	0x28, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x28]
	set	0x68, %i3
	stha	%o0,	[%l7 + %i3] 0x88
	nop
	set	0x58, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x60, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x3C, %g3
	stw	%i1,	[%l7 + %g3]
	set	0x68, %l5
	sta	%f4,	[%l7 + %l5] 0x80
	nop
	set	0x48, %g2
	stw	%l2,	[%l7 + %g2]
	add	%i5,	%l0,	%l5
	nop
	set	0x50, %o1
	std	%f12,	[%l7 + %o1]
	set	0x18, %o6
	stxa	%g4,	[%l7 + %o6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x34],	%f24
	nop
	set	0x68, %o5
	sth	%g7,	[%l7 + %o5]
	nop
	set	0x50, %i0
	ldsw	[%l7 + %i0],	%g2
	nop
	set	0x3E, %g7
	ldsh	[%l7 + %g7],	%i6
	nop
	set	0x40, %g5
	stx	%o1,	[%l7 + %g5]
	bgu	%xcc,	loop_128
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f8
	set	0x6C, %g4
	swapa	[%l7 + %g4] 0x88,	%l3
loop_128:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o5,	%o7
	nop
	set	0x70, %i2
	stx	%l6,	[%l7 + %i2]
	st	%f18,	[%l7 + 0x60]
	set	0x68, %i5
	ldxa	[%l7 + %i5] 0x88,	%i7
	set	0x28, %o2
	stxa	%o6,	[%l7 + %o2] 0xe2
	membar	#Sync
	ld	[%l7 + 0x34],	%f12
	set	0x62, %o0
	stba	%l4,	[%l7 + %o0] 0x80
	nop
	set	0x38, %i1
	stx	%o4,	[%l7 + %i1]
	set	0x44, %i6
	lda	[%l7 + %i6] 0x89,	%f2
	nop
	set	0x74, %l2
	stw	%g3,	[%l7 + %l2]
	set	0x7B, %l4
	ldstuba	[%l7 + %l4] 0x80,	%i4
	set	0x08, %g1
	lda	[%l7 + %g1] 0x80,	%f18
	fpsub32s	%f22,	%f21,	%f24
	and	%o3,	%g6,	%i2
	nop
	set	0x54, %o4
	lduw	[%l7 + %o4],	%g1
	add	%i3,	%g5,	%i0
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x48, %l1
	stx	%l1,	[%l7 + %l1]
	nop
	set	0x18, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x5C, %g6
	ldsw	[%l7 + %g6],	%o0
	add	%o2,	%l2,	%i5
	set	0x5C, %o7
	lda	[%l7 + %o7] 0x88,	%f29
	bn,a,pn	%xcc,	loop_129
	nop
	set	0x59, %l3
	ldstub	[%l7 + %l3],	%i1
	nop
	set	0x52, %i3
	ldstub	[%l7 + %i3],	%l5
	set	0x38, %i7
	sta	%f5,	[%l7 + %i7] 0x89
loop_129:
	nop
	set	0x60, %o3
	stxa	%g4,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x60, %g3
	std	%g6,	[%l7 + %g3]
	nop
	set	0x14, %i4
	stw	%l0,	[%l7 + %i4]
	or	%g2,	%o1,	%i6
	nop
	set	0x30, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x70, %o1
	lduh	[%l7 + %o1],	%o5
	add	%o7,	%l3,	%l6
	st	%f16,	[%l7 + 0x4C]
	nop
	set	0x4C, %g2
	swap	[%l7 + %g2],	%i7
	nop
	set	0x3C, %o6
	lduw	[%l7 + %o6],	%l4
	nop
	set	0x7C, %i0
	stw	%o4,	[%l7 + %i0]
	st	%fsr,	[%l7 + 0x60]
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x81,	%g3
	nop
	set	0x40, %g5
	stw	%o6,	[%l7 + %g5]
	ld	[%l7 + 0x60],	%f29
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x89,	%o3
	st	%fsr,	[%l7 + 0x08]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%i4
	nop
	set	0x47, %g4
	stb	%g1,	[%l7 + %g4]
	and	%i3,	%i2,	%i0
	nop
	set	0x64, %l6
	ldub	[%l7 + %l6],	%l1
	nop
	set	0x60, %i2
	stw	%o0,	[%l7 + %i2]
	nop
	set	0x66, %i5
	ldsh	[%l7 + %i5],	%o2
	nop
	set	0x70, %o2
	ldd	[%l7 + %o2],	%f26
	set	0x0A, %i1
	stha	%l2,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x26, %i6
	ldsb	[%l7 + %i6],	%i5
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%i0
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x0F, %l4
	stb	%l5,	[%l7 + %l4]
	fpsub32s	%f23,	%f30,	%f6
	set	0x22, %o0
	stha	%g5,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x88,	%g6
	bleu,a	%xcc,	loop_130
	be,a,pn	%xcc,	loop_131
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%g4
	set	0x48, %l1
	lda	[%l7 + %l1] 0x81,	%f26
loop_130:
	nop
	set	0x40, %l0
	stw	%l0,	[%l7 + %l0]
loop_131:
	nop
	set	0x50, %o7
	stwa	%o1,	[%l7 + %o7] 0x88
	bge	%icc,	loop_132
	nop
	set	0x60, %l3
	swap	[%l7 + %l3],	%i6
	add	%o5,	%o7,	%l3
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x80,	%l6
loop_132:
	st	%f26,	[%l7 + 0x58]
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x88,	 1
	set	0x58, %o3
	stda	%i6,	[%l7 + %o3] 0x88
	nop
	set	0x20, %i3
	ldx	[%l7 + %i3],	%o4
	set	0x58, %i4
	stxa	%g3,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x60, %l5
	ldsw	[%l7 + %l5],	%o6
	nop
	set	0x18, %o1
	std	%f2,	[%l7 + %o1]
	wr	%l4,	%o3,	%set_softint
	set	0x60, %g3
	ldxa	[%l7 + %g3] 0x88,	%g6
	and	%g1,	%i3,	%i2
	nop
	set	0x4E, %g2
	ldsh	[%l7 + %g2],	%i0
	set	0x6A, %o6
	stha	%l1,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x44, %i0
	stw	%o0,	[%l7 + %i0]
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%i4
	set	0x08, %g7
	ldxa	[%l7 + %g7] 0x80,	%o2
	nop
	set	0x58, %g4
	stw	%l2,	[%l7 + %g4]
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f0
	set	0x34, %i2
	sta	%f27,	[%l7 + %i2] 0x89
	nop
	set	0x08, %i5
	std	%f20,	[%l7 + %i5]
	nop
	set	0x5A, %l6
	ldstub	[%l7 + %l6],	%i5
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x81,	%i1
	set	0x3C, %o2
	lda	[%l7 + %o2] 0x89,	%f10
	nop
	set	0x58, %l2
	prefetch	[%l7 + %l2],	 0
	nop
	set	0x5C, %i6
	sth	%l5,	[%l7 + %i6]
	set	0x20, %l4
	ldxa	[%l7 + %l4] 0x88,	%g5
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f16
	fpsub32s	%f9,	%f2,	%f25
	set	0x14, %g1
	lda	[%l7 + %g1] 0x89,	%f3
	fpadd16	%f4,	%f12,	%f14
	set	0x70, %o0
	ldxa	[%l7 + %o0] 0x80,	%g4
	set	0x78, %l0
	stba	%g7,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x56, %o7
	ldsh	[%l7 + %o7],	%l0
	nop
	nop
	setx	0x40DB1DE1EAA0703D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFA6A2AA9EE4BE442,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f4,	%f2
	nop
	set	0x69, %l3
	ldsb	[%l7 + %l3],	%i6
	nop
	set	0x0A, %l1
	ldsh	[%l7 + %l1],	%o5
	set	0x3F, %g6
	ldstuba	[%l7 + %g6] 0x80,	%o1
	st	%f22,	[%l7 + 0x18]
	nop
	set	0x60, %i7
	std	%f0,	[%l7 + %i7]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%l6
	nop
	set	0x5B, %o3
	ldstub	[%l7 + %o3],	%o7
	nop
	set	0x58, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x08, %i4
	stw	%i7,	[%l7 + %i4]
	nop
	set	0x18, %o1
	stx	%g2,	[%l7 + %o1]
	nop
	set	0x20, %g3
	std	%f16,	[%l7 + %g3]
	nop
	set	0x28, %l5
	std	%f16,	[%l7 + %l5]
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x88,	 3
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f28
	st	%fsr,	[%l7 + 0x64]
	set	0x18, %i0
	stwa	%o4,	[%l7 + %i0] 0x80
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%g6
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x80,	 1
	nop
	set	0x73, %g5
	ldsb	[%l7 + %g5],	%i2
	and	%i0,	%l1,	%o0
	nop
	set	0x5C, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%i4
	set	0x70, %l6
	sta	%f27,	[%l7 + %l6] 0x89
	nop
	set	0x24, %i1
	ldub	[%l7 + %i1],	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o2,	%l2
	set	0x20, %o5
	sta	%f29,	[%l7 + %o5] 0x81
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i5,	%i1
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%g4
	nop
	set	0x74, %o2
	ldsb	[%l7 + %o2],	%l5
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x80,	%g7
	add	%g4,	%i6,	%l0
	nop
	set	0x24, %l4
	ldsb	[%l7 + %l4],	%o1
	nop
	set	0x78, %o4
	ldd	[%l7 + %o4],	%f18
	nop
	set	0x7C, %g1
	ldub	[%l7 + %g1],	%l3
	nop
	set	0x21, %o0
	stb	%o5,	[%l7 + %o0]
	nop
	set	0x58, %l0
	lduw	[%l7 + %l0],	%l6
	nop
	set	0x70, %l3
	ldsw	[%l7 + %l3],	%o7
	nop
	set	0x68, %o7
	std	%i6,	[%l7 + %o7]
	add	%g2,	%o4,	%o6
	set	0x44, %g6
	sta	%f29,	[%l7 + %g6] 0x81
	set	0x54, %i7
	stba	%o3,	[%l7 + %i7] 0xe2
	membar	#Sync
	add	%l4,	%g6,	%g1
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%i2
	bl	%icc,	loop_133
	nop
	set	0x70, %l1
	std	%i0,	[%l7 + %l1]
	nop
	set	0x6F, %i4
	stb	%g3,	[%l7 + %i4]
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f2
loop_133:
	and	%l1,	%o0,	%i3
	st	%fsr,	[%l7 + 0x24]
	set	0x70, %o1
	ldda	[%l7 + %o1] 0x89,	%i4
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x88,	%o2
	nop
	nop
	setx	0x09D26F61,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x44DDF732,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f29,	%f6
	nop
	set	0x08, %o6
	ldx	[%l7 + %o6],	%i5
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x81,	%l2
	set	0x7C, %g2
	lda	[%l7 + %g2] 0x81,	%f15
	nop
	set	0x3C, %g7
	swap	[%l7 + %g7],	%i1
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f30
	set	0x40, %g4
	stxa	%l5,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x1C, %g5
	stw	%g7,	[%l7 + %g5]
	nop
	set	0x54, %i2
	ldstub	[%l7 + %i2],	%g4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x81,	%i6,	%g5
	nop
	set	0x38, %l6
	stw	%l0,	[%l7 + %l6]
	nop
	set	0x40, %i5
	std	%l2,	[%l7 + %i5]
	set	0x6C, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o1
	nop
	set	0x3E, %l2
	sth	%o5,	[%l7 + %l2]
	or	%o7,	%l6,	%g2
	nop
	set	0x50, %o2
	stx	%i7,	[%l7 + %o2]
	and	%o4,	%o3,	%o6
	nop
	set	0x60, %i6
	swap	[%l7 + %i6],	%l4
	and	%g1,	%i2,	%g6
	nop
	set	0x28, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x29, %o4
	ldub	[%l7 + %o4],	%g3
	nop
	set	0x0B, %l4
	ldub	[%l7 + %l4],	%l1
	nop
	set	0x78, %g1
	ldd	[%l7 + %g1],	%o0
	nop
	set	0x18, %o0
	stx	%i0,	[%l7 + %o0]
	nop
	set	0x18, %l3
	stw	%i3,	[%l7 + %l3]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o2,	%i5
	nop
	set	0x78, %o7
	ldd	[%l7 + %o7],	%f4
	nop
	set	0x2C, %l0
	lduh	[%l7 + %l0],	%l2
	nop
	set	0x16, %g6
	ldub	[%l7 + %g6],	%i4
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xcc
	set	0x15, %l1
	ldstuba	[%l7 + %l1] 0x81,	%l5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%g4
	nop
	set	0x10, %i7
	std	%i6,	[%l7 + %i7]
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf8
	membar	#Sync
	set	0x08, %i3
	prefetcha	[%l7 + %i3] 0x88,	 1
	nop
	set	0x6E, %g3
	ldsb	[%l7 + %g3],	%g5
	nop
	set	0x74, %o6
	swap	[%l7 + %o6],	%l0
	set	0x4C, %o1
	swapa	[%l7 + %o1] 0x81,	%o1
	add	%l3,	%o7,	%o5
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x80,	%l6
	ld	[%l7 + 0x14],	%f17
	nop
	set	0x5C, %l5
	ldsb	[%l7 + %l5],	%i7
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f14
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g2
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%o2
	add	%o6,	%g1,	%l4
	nop
	set	0x4E, %g7
	sth	%i2,	[%l7 + %g7]
	nop
	set	0x5C, %i2
	ldsw	[%l7 + %i2],	%g3
	set	0x18, %l6
	swapa	[%l7 + %l6] 0x81,	%g6
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%l0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xd0,	%f16
	set	0x7E, %l2
	stha	%o0,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x2C, %o2
	stwa	%i0,	[%l7 + %o2] 0x81
	nop
	set	0x2A, %i6
	ldub	[%l7 + %i6],	%o2
	and	%i3,	%i5,	%l2
	nop
	set	0x18, %o5
	ldsw	[%l7 + %o5],	%i4
	nop
	set	0x19, %g5
	stb	%l5,	[%l7 + %g5]
	ld	[%l7 + 0x10],	%f4
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%i1
	set	0x0C, %l4
	stha	%g4,	[%l7 + %l4] 0xe3
	membar	#Sync
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xf0
	membar	#Sync
	set	0x58, %o0
	prefetcha	[%l7 + %o0] 0x81,	 1
	nop
	set	0x18, %o7
	stw	%g5,	[%l7 + %o7]
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%l0
	nop
	set	0x64, %g6
	lduh	[%l7 + %g6],	%g7
	nop
	set	0x70, %o3
	prefetch	[%l7 + %o3],	 1
	nop
	set	0x5C, %l0
	stw	%o1,	[%l7 + %l0]
	nop
	set	0x48, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x60, %i4
	stw	%l3,	[%l7 + %i4]
	nop
	set	0x60, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x47, %g3
	stb	%l6,	[%l7 + %g3]
	nop
	set	0x18, %i7
	stx	%o5,	[%l7 + %i7]
	fpadd32	%f0,	%f30,	%f26
	set	0x48, %o1
	stxa	%o4,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x70, %o6
	lduh	[%l7 + %o6],	%g2
	nop
	set	0x30, %g2
	swap	[%l7 + %g2],	%i7
	or	%o6,	%g1,	%l4
	nop
	set	0x50, %i0
	stw	%o3,	[%l7 + %i0]
	bg	%icc,	loop_134
	nop
	set	0x2A, %g4
	ldsh	[%l7 + %g4],	%i2
	nop
	set	0x48, %g7
	std	%g2,	[%l7 + %g7]
	nop
	set	0x63, %l5
	stb	%l1,	[%l7 + %l5]
loop_134:
	nop
	set	0x48, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x40, %i5
	ldsh	[%l7 + %i5],	%g6
	nop
	set	0x39, %i2
	ldstub	[%l7 + %i2],	%i0
	nop
	set	0x64, %i1
	lduh	[%l7 + %i1],	%o0
	set	0x7C, %l2
	swapa	[%l7 + %l2] 0x89,	%i3
	set	0x0C, %o2
	stwa	%o2,	[%l7 + %o2] 0x89
	set	0x2C, %o5
	lda	[%l7 + %o5] 0x89,	%f30
	set	0x65, %i6
	stba	%i5,	[%l7 + %i6] 0x81
	add	%i4,	%l2,	%l5
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x88,	 1
	nop
	set	0x50, %l4
	std	%i0,	[%l7 + %l4]
	nop
	set	0x34, %g1
	swap	[%l7 + %g1],	%g5
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x88,	%l0
	nop
	set	0x60, %o0
	stw	%i6,	[%l7 + %o0]
	set	0x5C, %o7
	ldstuba	[%l7 + %o7] 0x89,	%g7
	nop
	set	0x30, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x38, %o3
	std	%f10,	[%l7 + %o3]
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x81,	%l3
	set	0x5E, %l1
	stha	%o1,	[%l7 + %l1] 0x88
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 1
	ld	[%l7 + 0x38],	%f11
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%o5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	or	%i7,	%o6,	%g1
	nop
	set	0x60, %l3
	stx	%g2,	[%l7 + %l3]
	nop
	set	0x63, %i7
	ldsb	[%l7 + %i7],	%o3
	and	%i2,	%g3,	%l4
	set	0x32, %g3
	stha	%g6,	[%l7 + %g3] 0x80
	nop
	set	0x23, %o6
	ldub	[%l7 + %o6],	%i0
	set	0x50, %o1
	stda	%l0,	[%l7 + %o1] 0x80
	add	%o0,	%i3,	%o2
	set	0x63, %g2
	ldstuba	[%l7 + %g2] 0x81,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x81,	%i4,	%l5
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xd2,	%f0
	set	0x3C, %g7
	lda	[%l7 + %g7] 0x81,	%f18
	nop
	set	0x70, %i0
	lduh	[%l7 + %i0],	%l2
	and	%g4,	%i1,	%l0
	fpsub16	%f4,	%f4,	%f8
	and	%i6,	%g7,	%g5
	set	0x38, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l3,	%l6
	or	%o4,	%o7,	%o5
	st	%f10,	[%l7 + 0x68]
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x45, %i5
	ldub	[%l7 + %i5],	%o6
	nop
	set	0x40, %i2
	stx	%fsr,	[%l7 + %i2]
	ld	[%l7 + 0x44],	%f21
	nop
	set	0x7C, %l6
	swap	[%l7 + %l6],	%i7
	nop
	set	0x78, %l2
	stx	%g2,	[%l7 + %l2]
	set	0x32, %i1
	stha	%g1,	[%l7 + %i1] 0x88
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f14
	nop
	set	0x2C, %i6
	ldsh	[%l7 + %i6],	%o3
	set	0x68, %g5
	stha	%g3,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x53, %o2
	ldub	[%l7 + %o2],	%i2
	nop
	set	0x7C, %l4
	swap	[%l7 + %l4],	%l4
	nop
	set	0x1C, %g1
	ldsb	[%l7 + %g1],	%i0
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f28
	nop
	set	0x6E, %o7
	ldsh	[%l7 + %o7],	%g6
	set	0x20, %o4
	prefetcha	[%l7 + %o4] 0x81,	 3
	ld	[%l7 + 0x18],	%f15
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x89,	%o0,	%o2
	nop
	set	0x28, %o3
	stx	%fsr,	[%l7 + %o3]
	nop
	set	0x60, %g6
	ldsh	[%l7 + %g6],	%i5
	nop
	set	0x28, %l1
	stx	%i4,	[%l7 + %l1]
	nop
	set	0x3A, %i4
	ldsh	[%l7 + %i4],	%i3
	bne,a,pt	%xcc,	loop_135
	nop
	set	0x28, %l0
	sth	%l2,	[%l7 + %l0]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f0
loop_135:
	nop
	set	0x62, %i7
	sth	%l5,	[%l7 + %i7]
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x81,	 2
	set	0x30, %g3
	lda	[%l7 + %g3] 0x81,	%f31
	set	0x33, %o1
	ldstuba	[%l7 + %o1] 0x88,	%l0
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%i6
	nop
	set	0x58, %g4
	ldd	[%l7 + %g4],	%f28
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x81,	 2
	nop
	set	0x38, %g2
	ldsw	[%l7 + %g2],	%g7
	nop
	set	0x6C, %l5
	ldsb	[%l7 + %l5],	%o1
	ld	[%l7 + 0x44],	%f26
	st	%fsr,	[%l7 + 0x70]
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x81,	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%o4
	ld	[%l7 + 0x28],	%f0
	nop
	set	0x44, %i5
	ldsw	[%l7 + %i5],	%o7
	set	0x3F, %l6
	ldstuba	[%l7 + %l6] 0x81,	%l3
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x88
	set	0x18, %i1
	stxa	%o6,	[%l7 + %i1] 0x81
	and	%o5,	%i7,	%g1
	or	%g2,	%g3,	%i2
	nop
	set	0x4C, %i2
	ldstub	[%l7 + %i2],	%o3
	or	%i0,	%l4,	%g6
	set	0x34, %i6
	sta	%f23,	[%l7 + %i6] 0x80
	set	0x44, %o5
	swapa	[%l7 + %o5] 0x89,	%o0
	set	0x10, %g5
	prefetcha	[%l7 + %g5] 0x89,	 0
	nop
	set	0x47, %o2
	stb	%i5,	[%l7 + %o2]
	set	0x38, %g1
	sta	%f20,	[%l7 + %g1] 0x89
	and	%i4,	%i3,	%l2
	nop
	set	0x6E, %o0
	lduh	[%l7 + %o0],	%o2
	set	0x34, %l4
	lda	[%l7 + %l4] 0x88,	%f28
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x88,	 3
	set	0x20, %o7
	stba	%g4,	[%l7 + %o7] 0x89
	set	0x64, %o3
	swapa	[%l7 + %o3] 0x80,	%l0
	fpsub16	%f28,	%f8,	%f16
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%i1
	nop
	set	0x58, %g6
	lduw	[%l7 + %g6],	%o1
	set	0x0B, %i4
	ldstuba	[%l7 + %i4] 0x80,	%g7
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x88,	%g5
	nop
	set	0x74, %l0
	lduh	[%l7 + %l0],	%o4
	st	%f5,	[%l7 + 0x20]
	nop
	set	0x4D, %i3
	ldsb	[%l7 + %i3],	%o7
	or	%l3,	%o6,	%o5
	nop
	set	0x50, %i7
	stx	%l6,	[%l7 + %i7]
	nop
	set	0x2F, %g3
	stb	%i7,	[%l7 + %g3]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%g1
	nop
	set	0x78, %o1
	lduw	[%l7 + %o1],	%g3
	nop
	set	0x60, %o6
	stx	%o3,	[%l7 + %o6]
	and	%i0,	%i2,	%l4
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x285, 	%tick_cmpr
	and	%i5,	%i4,	%g6
	nop
	set	0x08, %g4
	lduw	[%l7 + %g4],	%i3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 4:
!
!	Type l   	: 1280
!	Type a   	: 18
!	Type cti   	: 26
!	Type x   	: 515
!	Type f   	: 35
!	Type i   	: 126
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
	set	0xD,	%g1
	set	0x8,	%g2
	set	0xE,	%g3
	set	0x0,	%g4
	set	0x9,	%g5
	set	0x2,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x5,	%i1
	set	-0x5,	%i2
	set	-0x3,	%i3
	set	-0x2,	%i4
	set	-0xD,	%i5
	set	-0x1,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x4D779402,	%l0
	set	0x3C21CB6E,	%l1
	set	0x370D6B6B,	%l2
	set	0x1FB29231,	%l3
	set	0x1F35E736,	%l4
	set	0x4F8BAFE4,	%l5
	set	0x521FD6EE,	%l6
	!# Output registers
	set	0x0CA1,	%o0
	set	0x11D2,	%o1
	set	0x1C82,	%o2
	set	0x10A1,	%o3
	set	-0x0D04,	%o4
	set	0x17F0,	%o5
	set	0x1139,	%o6
	set	-0x0D87,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	ld	[%l7 + 0x10],	%f8
	st	%f6,	[%l7 + 0x18]
	set	0x09, %l3
	stba	%l2,	[%l7 + %l3] 0x80
	or	%l5,	%o2,	%l0
	bn,pt	%icc,	loop_136
	nop
	set	0x60, %g2
	lduw	[%l7 + %g2],	%i6
	set	0x78, %l5
	stxa	%g4,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_136:
	nop
	set	0x09, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i1
	and	%o1,	%g5,	%o4
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%o6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%l2
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f2
	nop
	set	0x58, %i1
	std	%o6,	[%l7 + %i1]
	set	0x18, %i2
	stxa	%g7,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x6A, %l2
	stb	%o5,	[%l7 + %l2]
	nop
	set	0x30, %i6
	std	%f8,	[%l7 + %i6]
	nop
	set	0x0C, %o5
	lduh	[%l7 + %o5],	%l6
	nop
	set	0x1C, %g5
	lduw	[%l7 + %g5],	%i7
	nop
	set	0x38, %g1
	stx	%g1,	[%l7 + %g1]
	set	0x28, %o2
	lda	[%l7 + %o2] 0x88,	%f21
	set	0x50, %l4
	lda	[%l7 + %l4] 0x88,	%f17
	nop
	set	0x6C, %o4
	ldsw	[%l7 + %o4],	%g2
	nop
	set	0x30, %o0
	lduw	[%l7 + %o0],	%o3
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f16
	set	0x78, %o3
	lda	[%l7 + %o3] 0x88,	%f24
	nop
	set	0x10, %i4
	swap	[%l7 + %i4],	%i0
	nop
	set	0x68, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x08, %l0
	ldxa	[%l7 + %l0] 0x80,	%g3
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x88,	%i2
	set	0x50, %i3
	ldda	[%l7 + %i3] 0xe2,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%o0
	nop
	set	0x20, %i7
	std	%f28,	[%l7 + %i7]
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	set	0x48, %o1
	stxa	%i4,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x08, %o6
	ldsw	[%l7 + %o6],	%g6
	nop
	set	0x40, %l3
	stw	%i3,	[%l7 + %l3]
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f0
	nop
	set	0x1E, %l5
	ldsb	[%l7 + %l5],	%i5
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%l5
	and	%l2,	%o2,	%l0
	and	%i6,	%i1,	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%o4
	set	0x08, %i0
	stwa	%o7,	[%l7 + %i0] 0x80
	st	%f19,	[%l7 + 0x30]
	nop
	set	0x58, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x0F, %l6
	ldstub	[%l7 + %l6],	%l3
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%f24
	nop
	set	0x67, %i5
	ldsb	[%l7 + %i5],	%o1
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x2E, %i2
	sth	%o6,	[%l7 + %i2]
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%g7
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%f14
	fpsub32	%f22,	%f8,	%f4
	nop
	set	0x68, %o5
	stx	%o5,	[%l7 + %o5]
	nop
	set	0x54, %g5
	ldsb	[%l7 + %g5],	%i7
	nop
	set	0x28, %g1
	ldx	[%l7 + %g1],	%g1
	set	0x48, %o2
	stwa	%l6,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%f8
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xc0
	or	%g2,	%i0,	%o3
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%i2
	set	0x1A, %o3
	stha	%g3,	[%l7 + %o3] 0xe3
	membar	#Sync
	and	%l4,	%o0,	%i4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf9
	membar	#Sync
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f16
	set	0x30, %l0
	ldxa	[%l7 + %l0] 0x81,	%l1
	nop
	set	0x5C, %i4
	lduw	[%l7 + %i4],	%i3
	nop
	set	0x7D, %i3
	ldub	[%l7 + %i3],	%g6
	nop
	set	0x61, %l1
	stb	%i5,	[%l7 + %l1]
	nop
	set	0x44, %i7
	stw	%l5,	[%l7 + %i7]
	nop
	set	0x5C, %o1
	prefetch	[%l7 + %o1],	 3
	nop
	set	0x50, %g3
	ldd	[%l7 + %g3],	%f20
	set	0x18, %l3
	prefetcha	[%l7 + %l3] 0x80,	 2
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%l0
	add	%i6,	%l2,	%g4
	nop
	set	0x32, %l5
	lduh	[%l7 + %l5],	%g5
	ld	[%l7 + 0x18],	%f9
	nop
	set	0x28, %g7
	ldd	[%l7 + %g7],	%o4
	nop
	set	0x08, %i0
	std	%o6,	[%l7 + %i0]
	nop
	set	0x2C, %o6
	swap	[%l7 + %o6],	%i1
	nop
	set	0x20, %l6
	std	%o0,	[%l7 + %l6]
	ld	[%l7 + 0x3C],	%f15
	set	0x58, %g2
	swapa	[%l7 + %g2] 0x89,	%l3
	set	0x6C, %i5
	swapa	[%l7 + %i5] 0x88,	%o6
	nop
	set	0x68, %i2
	std	%f10,	[%l7 + %i2]
	set	0x10, %i1
	stda	%o4,	[%l7 + %i1] 0x80
	nop
	set	0x50, %i6
	std	%i6,	[%l7 + %i6]
	bgu,a,pn	%xcc,	loop_137
	nop
	set	0x78, %o5
	prefetch	[%l7 + %o5],	 2
	and	%g1,	%l6,	%g7
	nop
	set	0x48, %g5
	std	%i0,	[%l7 + %g5]
loop_137:
	add	%o3,	%i2,	%g2
	set	0x1C, %g1
	stwa	%g3,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%l4
	nop
	set	0x2E, %o4
	ldsb	[%l7 + %o4],	%i4
	st	%fsr,	[%l7 + 0x14]
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f0
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xda
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x88,	%o0
	set	0x3A, %o3
	stha	%i3,	[%l7 + %o3] 0x89
	bn	%icc,	loop_138
	nop
	set	0x08, %g6
	std	%f14,	[%l7 + %g6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l1,	%g6
loop_138:
	nop
	set	0x0C, %l4
	stha	%i5,	[%l7 + %l4] 0x88
	nop
	set	0x70, %i4
	stx	%l5,	[%l7 + %i4]
	ld	[%l7 + 0x78],	%f0
	nop
	set	0x78, %l0
	ldsw	[%l7 + %l0],	%l0
	nop
	set	0x0C, %i3
	lduw	[%l7 + %i3],	%i6
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0
	nop
	set	0x71, %o1
	ldub	[%l7 + %o1],	%g4
	nop
	set	0x18, %l1
	lduw	[%l7 + %l1],	%l2
	set	0x6F, %g3
	ldstuba	[%l7 + %g3] 0x89,	%o4
	add	%g5,	%i1,	%o1
	nop
	set	0x2C, %g4
	swap	[%l7 + %g4],	%o7
	nop
	set	0x70, %l5
	stx	%o6,	[%l7 + %l5]
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x80,	%o5
	or	%i7,	%l3,	%l6
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%o3
	nop
	set	0x65, %o6
	ldsb	[%l7 + %o6],	%i0
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%i2
	set	0x20, %l6
	sta	%f29,	[%l7 + %l6] 0x88
	and	%g2,	%g3,	%i4
	set	0x08, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	set	0x38, %g2
	stxa	%i3,	[%l7 + %g2] 0x80
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%g6
	set	0x38, %i2
	stxa	%l1,	[%l7 + %i2] 0xea
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%l0
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x53, %i1
	ldub	[%l7 + %i1],	%i6
	and	%i5,	%o2,	%l2
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%g4
	set	0x28, %g5
	prefetcha	[%l7 + %g5] 0x80,	 3
	set	0x18, %i6
	lda	[%l7 + %i6] 0x80,	%f7
	nop
	set	0x67, %o2
	ldsb	[%l7 + %o2],	%i1
	nop
	set	0x23, %g1
	stb	%o4,	[%l7 + %g1]
	set	0x48, %o4
	ldxa	[%l7 + %o4] 0x88,	%o1
	nop
	set	0x70, %l2
	ldsb	[%l7 + %l2],	%o6
	nop
	set	0x4A, %o0
	sth	%o7,	[%l7 + %o0]
	set	0x46, %o7
	stha	%i7,	[%l7 + %o7] 0x88
	set	0x58, %o3
	stxa	%o5,	[%l7 + %o3] 0x88
	set	0x70, %l4
	stda	%l2,	[%l7 + %l4] 0x80
	nop
	set	0x08, %g6
	ldsw	[%l7 + %g6],	%l6
	set	0x68, %i4
	stda	%g0,	[%l7 + %i4] 0x88
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%o3
	set	0x68, %i3
	stha	%g7,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x7B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%i0
	st	%f11,	[%l7 + 0x48]
	set	0x6D, %l1
	stba	%g2,	[%l7 + %l1] 0xea
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i2,	%i4
	set	0x70, %o1
	stda	%g2,	[%l7 + %o1] 0xe2
	membar	#Sync
	nop
	set	0x10, %g3
	stx	%o0,	[%l7 + %g3]
	ld	[%l7 + 0x48],	%f8
	ld	[%l7 + 0x74],	%f20
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf9
	membar	#Sync
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xd2
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%i3
	ld	[%l7 + 0x64],	%f8
	nop
	set	0x1E, %l5
	ldsh	[%l7 + %l5],	%l4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xda,	%f16
	or	%l1,	%l5,	%l0
	set	0x68, %l6
	stha	%g6,	[%l7 + %l6] 0x80
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x88,	%i6
	nop
	set	0x40, %g2
	lduw	[%l7 + %g2],	%i5
	nop
	set	0x60, %i5
	lduw	[%l7 + %i5],	%o2
	nop
	set	0x10, %i1
	std	%l2,	[%l7 + %i1]
	nop
	set	0x48, %i2
	stx	%fsr,	[%l7 + %i2]
	ld	[%l7 + 0x28],	%f3
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f10
	ld	[%l7 + 0x10],	%f31
	ld	[%l7 + 0x54],	%f28
	set	0x48, %g5
	stxa	%g4,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x81,	 3
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%o4
	nop
	set	0x28, %o4
	lduw	[%l7 + %o4],	%o1
	add	%o6,	%g5,	%o7
	nop
	set	0x38, %g1
	ldd	[%l7 + %g1],	%f16
	nop
	set	0x38, %l2
	ldsw	[%l7 + %l2],	%i7
	nop
	set	0x34, %o0
	prefetch	[%l7 + %o0],	 1
	nop
	set	0x48, %o3
	std	%f8,	[%l7 + %o3]
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%o5
	nop
	set	0x20, %g6
	lduh	[%l7 + %g6],	%l6
	nop
	set	0x1A, %l4
	ldsh	[%l7 + %l4],	%g1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g7
	or	%o3,	%i0,	%g2
	nop
	set	0x30, %l0
	swap	[%l7 + %l0],	%i2
	set	0x24, %i4
	sta	%f30,	[%l7 + %i4] 0x80
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f16
	st	%f14,	[%l7 + 0x1C]
	add	%g3,	%i4,	%o0
	nop
	set	0x34, %l1
	swap	[%l7 + %l1],	%l4
	nop
	set	0x68, %o1
	stx	%i3,	[%l7 + %o1]
	and	%l5,	%l0,	%l1
	set	0x60, %g3
	sta	%f27,	[%l7 + %g3] 0x88
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%i6
	nop
	set	0x0A, %l3
	sth	%g6,	[%l7 + %l3]
	set	0x78, %g7
	stxa	%o2,	[%l7 + %g7] 0x81
	set	0x77, %g4
	stba	%l2,	[%l7 + %g4] 0xeb
	membar	#Sync
	st	%f21,	[%l7 + 0x2C]
	nop
	set	0x7F, %o6
	ldub	[%l7 + %o6],	%i5
	and	%g4,	%o4,	%o1
	set	0x0C, %l6
	stwa	%i1,	[%l7 + %l6] 0xe2
	membar	#Sync
	and	%o6,	%o7,	%g5
	nop
	set	0x7C, %l5
	stw	%o5,	[%l7 + %l5]
	set	0x4F, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l6
	fpsub16	%f20,	%f8,	%f2
	and	%g1,	%i7,	%g7
	set	0x68, %i0
	stxa	%o3,	[%l7 + %i0] 0x81
	nop
	set	0x53, %i1
	ldsb	[%l7 + %i1],	%l3
	set	0x74, %i5
	stwa	%i0,	[%l7 + %i5] 0x89
	nop
	set	0x08, %i2
	prefetch	[%l7 + %i2],	 2
	nop
	set	0x78, %g5
	lduw	[%l7 + %g5],	%g2
	nop
	set	0x58, %i6
	stb	%i2,	[%l7 + %i6]
	set	0x59, %o5
	stba	%i4,	[%l7 + %o5] 0x88
	nop
	set	0x20, %o2
	ldstub	[%l7 + %o2],	%g3
	nop
	set	0x14, %o4
	stw	%l4,	[%l7 + %o4]
	set	0x0D, %g1
	stba	%i3,	[%l7 + %g1] 0x81
	nop
	set	0x66, %l2
	lduh	[%l7 + %l2],	%l5
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%f16
	bl	%icc,	loop_139
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f28
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%f16
loop_139:
	nop
	set	0x3D, %l4
	ldstub	[%l7 + %l4],	%l0
	set	0x4C, %o0
	lda	[%l7 + %o0] 0x81,	%f31
	nop
	set	0x50, %i4
	std	%l0,	[%l7 + %i4]
	set	0x4C, %l0
	sta	%f27,	[%l7 + %l0] 0x89
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xe3,	%i6
	nop
	set	0x7C, %i7
	lduw	[%l7 + %i7],	%o0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%g6
	nop
	set	0x0C, %o1
	swap	[%l7 + %o1],	%i5
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x81,	%l2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xc4
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f0
	set	0x4F, %g4
	ldstuba	[%l7 + %g4] 0x81,	%o4
	nop
	set	0x44, %g7
	sth	%o1,	[%l7 + %g7]
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0xcc
	nop
	set	0x4C, %l5
	ldsw	[%l7 + %l5],	%i1
	nop
	set	0x3E, %o6
	lduh	[%l7 + %o6],	%g4
	or	%o6,	%g5,	%o5
	nop
	set	0x78, %i0
	std	%o6,	[%l7 + %i0]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g1,	%l6
	set	0x30, %g2
	stxa	%i7,	[%l7 + %g2] 0xea
	membar	#Sync
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f14
	nop
	set	0x2E, %i2
	ldsh	[%l7 + %i2],	%g7
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f16
	bge,a,pt	%xcc,	loop_140
	st	%f5,	[%l7 + 0x24]
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xe3,	%o2
loop_140:
	ld	[%l7 + 0x4C],	%f26
	nop
	set	0x6C, %i6
	sth	%i0,	[%l7 + %i6]
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%l2
	nop
	set	0x4C, %o2
	ldub	[%l7 + %o2],	%i2
	set	0x10, %o4
	stda	%g2,	[%l7 + %o4] 0x88
	set	0x10, %l2
	stxa	%g3,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x20, %o3
	stb	%i4,	[%l7 + %o3]
	set	0x74, %o7
	lda	[%l7 + %o7] 0x88,	%f0
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%i3
	set	0x28, %l4
	ldxa	[%l7 + %l4] 0x80,	%l5
	set	0x20, %g6
	ldstuba	[%l7 + %g6] 0x89,	%l4
	nop
	set	0x30, %o0
	lduw	[%l7 + %o0],	%l0
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xeb,	%l0
	set	0x38, %i4
	stxa	%i6,	[%l7 + %i4] 0x88
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x88,	 4
	bleu,a,pn	%icc,	loop_141
	nop
	set	0x40, %o1
	sth	%o0,	[%l7 + %o1]
	add	%g6,	%i5,	%o4
	nop
	set	0x64, %i3
	lduw	[%l7 + %i3],	%o1
loop_141:
	and	%l2,	%i1,	%g4
	fpadd32s	%f14,	%f15,	%f20
	set	0x3C, %g3
	lda	[%l7 + %g3] 0x80,	%f25
	and	%g5,	%o6,	%o5
	set	0x14, %i7
	lda	[%l7 + %i7] 0x80,	%f25
	set	0x70, %l3
	stha	%o7,	[%l7 + %l3] 0x89
	nop
	set	0x18, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x67, %l6
	ldub	[%l7 + %l6],	%l6
	set	0x5C, %l5
	lda	[%l7 + %l5] 0x89,	%f18
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x89,	%g0
	nop
	set	0x68, %i0
	stx	%i7,	[%l7 + %i0]
	set	0x34, %g2
	stha	%g7,	[%l7 + %g2] 0xe2
	membar	#Sync
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x3C, %g7
	prefetch	[%l7 + %g7],	 4
	set	0x18, %i1
	ldxa	[%l7 + %i1] 0x88,	%i0
	wr	%o3,	%l3,	%sys_tick
	set	0x0C, %i2
	swapa	[%l7 + %i2] 0x89,	%g2
	nop
	set	0x50, %g5
	lduw	[%l7 + %g5],	%i2
	nop
	set	0x20, %o5
	std	%f26,	[%l7 + %o5]
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%g3
	nop
	set	0x10, %i6
	stw	%l5,	[%l7 + %i6]
	nop
	set	0x5C, %o4
	prefetch	[%l7 + %o4],	 4
	nop
	set	0x38, %o2
	prefetch	[%l7 + %o2],	 2
	nop
	set	0x48, %l2
	std	%l4,	[%l7 + %l2]
	st	%fsr,	[%l7 + 0x6C]
	or	%l0,	%l1,	%i3
	nop
	set	0x33, %o3
	ldsb	[%l7 + %o3],	%o2
	bg,a,pn	%xcc,	loop_142
	nop
	set	0x61, %g1
	ldub	[%l7 + %g1],	%i6
	nop
	set	0x65, %o7
	stb	%o0,	[%l7 + %o7]
	nop
	set	0x14, %g6
	lduh	[%l7 + %g6],	%i5
loop_142:
	nop
	set	0x28, %l4
	ldx	[%l7 + %l4],	%g6
	nop
	set	0x34, %o0
	ldsh	[%l7 + %o0],	%o4
	nop
	set	0x40, %i4
	std	%f22,	[%l7 + %i4]
	nop
	set	0x76, %l1
	stb	%o1,	[%l7 + %l1]
	fpadd32	%f16,	%f22,	%f4
	nop
	set	0x1A, %o1
	ldsh	[%l7 + %o1],	%l2
	be,a	%icc,	loop_143
	nop
	set	0x2E, %i3
	ldsh	[%l7 + %i3],	%g4
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x81,	 1
loop_143:
	st	%fsr,	[%l7 + 0x68]
	set	0x20, %l0
	lda	[%l7 + %l0] 0x89,	%f24
	nop
	set	0x18, %i7
	stx	%o6,	[%l7 + %i7]
	st	%f12,	[%l7 + 0x08]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x5D, %l6
	ldstub	[%l7 + %l6],	%o5
	set	0x0C, %l5
	lda	[%l7 + %l5] 0x89,	%f18
	nop
	set	0x4A, %g4
	sth	%o7,	[%l7 + %g4]
	nop
	set	0x68, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x4F, %g2
	ldsb	[%l7 + %g2],	%g5
	nop
	set	0x58, %i5
	ldx	[%l7 + %i5],	%g1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x88
	nop
	set	0x30, %i0
	stx	%i7,	[%l7 + %i0]
	nop
	set	0x70, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x6A, %i2
	lduh	[%l7 + %i2],	%i0
	fpsub16s	%f6,	%f8,	%f28
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xd0
	nop
	set	0x58, %o5
	prefetch	[%l7 + %o5],	 0
	nop
	set	0x18, %o4
	lduh	[%l7 + %o4],	%o3
	st	%f30,	[%l7 + 0x64]
	nop
	set	0x3E, %o2
	sth	%g7,	[%l7 + %o2]
	set	0x18, %l2
	stda	%g2,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x3E, %i6
	stha	%l3,	[%l7 + %i6] 0xe2
	membar	#Sync
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x81,	 1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i2,	%l5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%l0
	set	0x64, %o7
	sta	%f8,	[%l7 + %o7] 0x80
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f4
	nop
	set	0x3E, %l4
	ldsh	[%l7 + %l4],	%l4
	nop
	set	0x60, %g6
	ldsw	[%l7 + %g6],	%i3
	fpadd16	%f6,	%f2,	%f0
	nop
	set	0x40, %i4
	swap	[%l7 + %i4],	%o2
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%l1
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x88,	%o0,	%i5
	set	0x78, %i3
	stxa	%g6,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xda
	set	0x48, %o1
	sta	%f20,	[%l7 + %o1] 0x80
	st	%fsr,	[%l7 + 0x0C]
	set	0x3B, %l0
	stba	%o4,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x0C, %l3
	stw	%i6,	[%l7 + %l3]
	set	0x58, %i7
	stda	%o0,	[%l7 + %i7] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x0C]
	set	0x47, %l6
	stba	%l2,	[%l7 + %l6] 0x89
	set	0x68, %l5
	stda	%g4,	[%l7 + %l5] 0x89
	ba	%icc,	loop_144
	nop
	set	0x28, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x40, %g2
	ldsw	[%l7 + %g2],	%i1
	nop
	set	0x20, %o6
	ldsw	[%l7 + %o6],	%o6
loop_144:
	nop
	set	0x18, %g7
	ldx	[%l7 + %g7],	%o5
	nop
	set	0x2D, %i0
	ldub	[%l7 + %i0],	%o7
	set	0x66, %i5
	stba	%l6,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x7C, %i1
	swapa	[%l7 + %i1] 0x89,	%g1
	nop
	set	0x30, %g5
	stx	%g5,	[%l7 + %g5]
	or	%i0,	%o3,	%i7
	nop
	set	0x10, %i2
	ldx	[%l7 + %i2],	%g7
	nop
	set	0x35, %o4
	ldsb	[%l7 + %o4],	%g2
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f24
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%l3
	add	%i4,	%l5,	%i2
	st	%f4,	[%l7 + 0x38]
	ld	[%l7 + 0x48],	%f23
	set	0x4A, %i6
	stba	%l0,	[%l7 + %i6] 0x89
	nop
	set	0x08, %g1
	swap	[%l7 + %g1],	%l4
	nop
	set	0x10, %o7
	stx	%g3,	[%l7 + %o7]
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x89,	%i3
	set	0x68, %l4
	swapa	[%l7 + %l4] 0x80,	%l1
	nop
	set	0x48, %o5
	swap	[%l7 + %o5],	%o2
	nop
	set	0x70, %i4
	std	%o0,	[%l7 + %i4]
	wr 	%g0, 	0x7, 	%fprs
	set	0x24, %l1
	stwa	%i6,	[%l7 + %l1] 0x89
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f2
	set	0x40, %i3
	stda	%o0,	[%l7 + %i3] 0x88
	add	%l2,	%o4,	%g4
	nop
	set	0x54, %g3
	lduw	[%l7 + %g3],	%i1
	st	%f22,	[%l7 + 0x18]
	fpsub32s	%f1,	%f3,	%f29
	wr	%o6,	%o7,	%set_softint
	set	0x40, %o0
	stda	%o4,	[%l7 + %o0] 0x89
	or	%g1,	%l6,	%g5
	and	%o3,	%i7,	%g7
	nop
	set	0x20, %l0
	swap	[%l7 + %l0],	%i0
	nop
	set	0x78, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x20, %l3
	std	%g2,	[%l7 + %l3]
	nop
	set	0x20, %i7
	ldsw	[%l7 + %i7],	%i4
	set	0x36, %l6
	stha	%l3,	[%l7 + %l6] 0x80
	set	0x64, %l5
	stwa	%l5,	[%l7 + %l5] 0x88
	nop
	set	0x38, %g4
	ldstub	[%l7 + %g4],	%l0
	nop
	set	0x30, %g2
	std	%l4,	[%l7 + %g2]
	nop
	nop
	setx	0x62F2C83F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x91532C09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f7,	%f31
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i3
	fpsub16	%f30,	%f20,	%f24
	nop
	set	0x43, %g7
	ldstub	[%l7 + %g7],	%i2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xda
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xca
	set	0x60, %i0
	stha	%o2,	[%l7 + %i0] 0x80
	nop
	set	0x40, %g5
	std	%o0,	[%l7 + %g5]
	and	%l1,	%i5,	%g6
	set	0x3C, %i1
	lda	[%l7 + %i1] 0x80,	%f12
	set	0x10, %o4
	stwa	%i6,	[%l7 + %o4] 0x88
	nop
	set	0x52, %o2
	ldsh	[%l7 + %o2],	%l2
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f16
	set	0x24, %i6
	swapa	[%l7 + %i6] 0x89,	%o4
	set	0x20, %i2
	prefetcha	[%l7 + %i2] 0x88,	 1
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x81,	 4
	nop
	set	0x60, %g1
	std	%o6,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x2C, %o3
	swap	[%l7 + %o3],	%o1
	nop
	set	0x50, %o5
	stx	%o7,	[%l7 + %o5]
	set	0x58, %i4
	lda	[%l7 + %i4] 0x89,	%f31
	set	0x60, %l4
	lda	[%l7 + %l4] 0x89,	%f26
	nop
	set	0x54, %l1
	ldsh	[%l7 + %l1],	%g1
	nop
	set	0x14, %i3
	stw	%o5,	[%l7 + %i3]
	nop
	set	0x5D, %g3
	stb	%g5,	[%l7 + %g3]
	nop
	set	0x48, %g6
	ldd	[%l7 + %g6],	%o2
	set	0x18, %l0
	stda	%i6,	[%l7 + %l0] 0x81
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%i7
	nop
	set	0x37, %o1
	ldstub	[%l7 + %o1],	%i0
	set	0x50, %i7
	sta	%f4,	[%l7 + %i7] 0x89
	ld	[%l7 + 0x20],	%f4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x88,	%g2,	%i4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf0
	membar	#Sync
	nop
	set	0x58, %l5
	prefetch	[%l7 + %l5],	 3
	nop
	set	0x60, %l6
	prefetch	[%l7 + %l6],	 3
	nop
	set	0x51, %g2
	ldsb	[%l7 + %g2],	%l3
	fpadd32s	%f21,	%f17,	%f18
	nop
	set	0x44, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x88,	 3
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f2
	nop
	set	0x54, %o6
	ldsh	[%l7 + %o6],	%l0
	nop
	set	0x40, %g5
	prefetch	[%l7 + %g5],	 2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%g3
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc0
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%f12
	nop
	set	0x48, %i1
	lduw	[%l7 + %i1],	%i3
	set	0x31, %o2
	stba	%i2,	[%l7 + %o2] 0xea
	membar	#Sync
	and	%g7,	%o0,	%o2
	nop
	set	0x4C, %i6
	lduw	[%l7 + %i6],	%i5
	and	%l1,	%i6,	%l2
	set	0x08, %l2
	stxa	%g6,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x08, %i2
	stx	%g4,	[%l7 + %i2]
	nop
	set	0x14, %o7
	stw	%i1,	[%l7 + %o7]
	set	0x18, %g1
	stxa	%o6,	[%l7 + %g1] 0x89
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf1
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x88,	%o4,	%o1
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%f22
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%f18
	nop
	set	0x24, %l1
	lduw	[%l7 + %l1],	%o7
	set	0x60, %l4
	ldda	[%l7 + %l4] 0x80,	%o4
	set	0x68, %g3
	lda	[%l7 + %g3] 0x88,	%f20
	st	%fsr,	[%l7 + 0x40]
	st	%f29,	[%l7 + 0x74]
	st	%f30,	[%l7 + 0x5C]
	ld	[%l7 + 0x0C],	%f11
	nop
	set	0x30, %g6
	ldx	[%l7 + %g6],	%g1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%l6
	set	0x7C, %l0
	lda	[%l7 + %l0] 0x81,	%f0
	fpsub16	%f2,	%f0,	%f30
	set	0x30, %o0
	stwa	%o3,	[%l7 + %o0] 0x81
	set	0x65, %o1
	stba	%i7,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x34, %i3
	stw	%i0,	[%l7 + %i3]
	or	%i4,	%l3,	%g2
	nop
	set	0x50, %i7
	lduw	[%l7 + %i7],	%l0
	set	0x38, %l3
	prefetcha	[%l7 + %l3] 0x88,	 2
	set	0x50, %l5
	swapa	[%l7 + %l5] 0x88,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%i2
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xda
	nop
	set	0x30, %l6
	sth	%g7,	[%l7 + %l6]
	nop
	set	0x0C, %g7
	ldstub	[%l7 + %g7],	%l4
	set	0x18, %i5
	prefetcha	[%l7 + %i5] 0x89,	 3
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x80,	%f16
	set	0x38, %g5
	lda	[%l7 + %g5] 0x80,	%f7
	and	%o2,	%i5,	%i6
	nop
	set	0x52, %o6
	stb	%l2,	[%l7 + %o6]
	set	0x09, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g6
	nop
	set	0x62, %o4
	stb	%l1,	[%l7 + %o4]
	set	0x4E, %i1
	stha	%g4,	[%l7 + %i1] 0x89
	set	0x18, %i6
	ldxa	[%l7 + %i6] 0x88,	%i1
	ld	[%l7 + 0x38],	%f22
	nop
	set	0x40, %l2
	std	%f30,	[%l7 + %l2]
	ld	[%l7 + 0x28],	%f28
	nop
	set	0x7C, %i2
	ldsw	[%l7 + %i2],	%o6
	nop
	set	0x58, %o7
	swap	[%l7 + %o7],	%o4
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%o0
	nop
	set	0x18, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x48, %i4
	lda	[%l7 + %i4] 0x81,	%f27
	set	0x36, %o5
	stha	%o5,	[%l7 + %o5] 0x80
	set	0x2C, %l1
	stha	%g1,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x24, %l4
	stb	%g5,	[%l7 + %l4]
	nop
	set	0x40, %g1
	prefetch	[%l7 + %g1],	 1
	add	%l6,	%o3,	%o7
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xda
	and	%i7,	%i0,	%l3
	nop
	set	0x60, %g6
	stx	%i4,	[%l7 + %g6]
	wr	%l0,	%l5,	%clear_softint
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g7
	and	%l4,	%i2,	%o0
	nop
	set	0x60, %l0
	swap	[%l7 + %l0],	%o2
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x89,	%i6
	nop
	set	0x10, %o1
	prefetch	[%l7 + %o1],	 4
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 1
	nop
	set	0x50, %l3
	stw	%l2,	[%l7 + %l3]
	nop
	set	0x48, %l5
	std	%g6,	[%l7 + %l5]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%g4
	set	0x12, %g2
	ldstuba	[%l7 + %g2] 0x88,	%i5
	and	%o6,	%i1,	%o1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%o5
	set	0x5D, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g5
	set	0x30, %l6
	swapa	[%l7 + %l6] 0x80,	%g1
	nop
	set	0x70, %i5
	std	%f4,	[%l7 + %i5]
	set	0x30, %g7
	stwa	%o3,	[%l7 + %g7] 0x88
	nop
	set	0x4E, %g5
	ldub	[%l7 + %g5],	%l6
	nop
	set	0x0E, %o6
	ldub	[%l7 + %o6],	%o7
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x88,	%i7
	nop
	set	0x28, %i0
	std	%i0,	[%l7 + %i0]
	set	0x09, %i1
	stba	%l3,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x68, %i6
	ldsw	[%l7 + %i6],	%i4
	and	%l5,	%l0,	%i3
	nop
	set	0x3A, %o4
	ldstub	[%l7 + %o4],	%g3
	nop
	set	0x34, %i2
	swap	[%l7 + %i2],	%g2
	fpadd32	%f20,	%f14,	%f10
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%g7
	nop
	set	0x48, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%i2
	nop
	set	0x20, %l2
	ldsw	[%l7 + %l2],	%o2
	ld	[%l7 + 0x38],	%f18
	set	0x5B, %o3
	stba	%o0,	[%l7 + %o3] 0xe2
	membar	#Sync
	set	0x56, %i4
	ldstuba	[%l7 + %i4] 0x88,	%l2
	nop
	set	0x10, %l1
	swap	[%l7 + %l1],	%g6
	nop
	set	0x2C, %l4
	swap	[%l7 + %l4],	%l1
	bgu	%icc,	loop_145
	ld	[%l7 + 0x34],	%f7
	set	0x14, %o5
	sta	%f4,	[%l7 + %o5] 0x81
loop_145:
	st	%f20,	[%l7 + 0x40]
	set	0x78, %g1
	prefetcha	[%l7 + %g1] 0x88,	 4
	fpsub32	%f10,	%f4,	%f18
	nop
	set	0x78, %g6
	stw	%i5,	[%l7 + %g6]
	nop
	set	0x20, %g3
	std	%g4,	[%l7 + %g3]
	set	0x5E, %o0
	stha	%i1,	[%l7 + %o0] 0x81
	nop
	set	0x50, %o1
	stx	%o1,	[%l7 + %o1]
	nop
	set	0x78, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x70, %l3
	std	%f22,	[%l7 + %l3]
	set	0x74, %l0
	stwa	%o4,	[%l7 + %l0] 0x81
	fpsub16s	%f27,	%f5,	%f8
	ld	[%l7 + 0x2C],	%f12
	ld	[%l7 + 0x74],	%f26
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xeb,	%o4
	and	%g5,	%g1,	%o3
	nop
	set	0x6E, %g2
	ldub	[%l7 + %g2],	%l6
	set	0x2C, %i7
	stha	%o7,	[%l7 + %i7] 0x88
	or	%o6,	%i7,	%l3
	add	%i0,	%l5,	%i4
	nop
	set	0x30, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x58, %g7
	swap	[%l7 + %g7],	%i3
	bge	%xcc,	loop_146
	nop
	set	0x3A, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x48, %i5
	std	%l0,	[%l7 + %i5]
	nop
	set	0x64, %g4
	ldsw	[%l7 + %g4],	%l4
loop_146:
	st	%fsr,	[%l7 + 0x24]
	nop
	set	0x08, %i0
	stx	%g2,	[%l7 + %i0]
	nop
	set	0x08, %i1
	stx	%i2,	[%l7 + %i1]
	set	0x20, %o6
	ldda	[%l7 + %o6] 0xea,	%o2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%l2
	nop
	set	0x5F, %o4
	stb	%o0,	[%l7 + %o4]
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%l0
	nop
	set	0x42, %o7
	ldsb	[%l7 + %o7],	%i6
	nop
	set	0x69, %i6
	stb	%i5,	[%l7 + %i6]
	nop
	set	0x64, %l2
	ldsb	[%l7 + %l2],	%g6
	add	%g4,	%o1,	%o4
	set	0x58, %o2
	prefetcha	[%l7 + %o2] 0x80,	 4
	nop
	set	0x1A, %i4
	ldstub	[%l7 + %i4],	%i1
	nop
	set	0x62, %o3
	sth	%g5,	[%l7 + %o3]
	nop
	set	0x58, %l1
	ldx	[%l7 + %l1],	%o3
	nop
	set	0x68, %o5
	std	%i6,	[%l7 + %o5]
	nop
	set	0x7A, %l4
	sth	%g1,	[%l7 + %l4]
	ld	[%l7 + 0x3C],	%f8
	st	%f18,	[%l7 + 0x7C]
	nop
	set	0x08, %g1
	std	%o6,	[%l7 + %g1]
	set	0x36, %g6
	ldstuba	[%l7 + %g6] 0x89,	%o6
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x88,	%i7
	set	0x40, %g3
	stda	%l2,	[%l7 + %g3] 0x81
	wr	%i0,	%i4,	%ccr
	nop
	set	0x3C, %o1
	ldsw	[%l7 + %o1],	%l5
	set	0x18, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g3
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x80,	 4
	set	0x16, %l5
	stha	%i3,	[%l7 + %l5] 0x89
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%l4
	set	0x6C, %g2
	sta	%f25,	[%l7 + %g2] 0x81
	st	%f8,	[%l7 + 0x20]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%g2
	nop
	set	0x50, %i7
	stx	%g7,	[%l7 + %i7]
	set	0x38, %l6
	prefetcha	[%l7 + %l6] 0x88,	 3
	st	%fsr,	[%l7 + 0x28]
	set	0x48, %g7
	sta	%f4,	[%l7 + %g7] 0x89
	nop
	set	0x2E, %i5
	ldsh	[%l7 + %i5],	%o0
	nop
	set	0x20, %g4
	swap	[%l7 + %g4],	%o2
	nop
	set	0x22, %g5
	ldub	[%l7 + %g5],	%i6
	set	0x20, %i1
	stxa	%l1,	[%l7 + %i1] 0xe2
	membar	#Sync
	bge,pt	%icc,	loop_147
	nop
	set	0x08, %i0
	stx	%i5,	[%l7 + %i0]
	nop
	set	0x1E, %o4
	ldsb	[%l7 + %o4],	%g6
	or	%o1,	%o4,	%o5
loop_147:
	nop
	set	0x24, %o6
	prefetch	[%l7 + %o6],	 2
	nop
	set	0x14, %o7
	stw	%i1,	[%l7 + %o7]
	or	%g4,	%o3,	%g5
	nop
	set	0x24, %i6
	lduh	[%l7 + %i6],	%g1
	nop
	set	0x18, %i2
	ldsh	[%l7 + %i2],	%l6
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f10
	nop
	set	0x43, %i4
	ldub	[%l7 + %i4],	%o7
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%o6
	be,a,pn	%icc,	loop_148
	nop
	set	0x20, %l1
	std	%f2,	[%l7 + %l1]
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x89,	 4
loop_148:
	nop
	set	0x58, %o5
	sta	%f14,	[%l7 + %o5] 0x89
	nop
	set	0x40, %l4
	stw	%i0,	[%l7 + %l4]
	ld	[%l7 + 0x54],	%f3
	nop
	nop
	setx	0x8F41EDF8D2FCEA7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x663805A13FFDA2DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f16,	%f24
	nop
	set	0x20, %g1
	stx	%fsr,	[%l7 + %g1]
	st	%f12,	[%l7 + 0x34]
	and	%i7,	%i4,	%l5
	and	%g3,	%l0,	%i3
	set	0x60, %o0
	stwa	%l4,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x68, %g6
	stx	%g2,	[%l7 + %g6]
	set	0x32, %o1
	stba	%i2,	[%l7 + %o1] 0x80
	st	%fsr,	[%l7 + 0x18]
	set	0x3A, %g3
	stha	%g7,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x88,	%o0
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x89,	%l2
	ble	%icc,	loop_149
	nop
	set	0x40, %l5
	ldsw	[%l7 + %l5],	%o2
	nop
	set	0x5C, %l0
	stw	%i6,	[%l7 + %l0]
	nop
	set	0x56, %i7
	sth	%l1,	[%l7 + %i7]
loop_149:
	nop
	set	0x31, %g2
	ldstub	[%l7 + %g2],	%g6
	nop
	set	0x12, %g7
	lduh	[%l7 + %g7],	%o1
	add	%i5,	%o5,	%o4
	nop
	set	0x08, %l6
	stx	%i1,	[%l7 + %l6]
	nop
	set	0x68, %g4
	std	%f20,	[%l7 + %g4]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%o3
	set	0x38, %i5
	swapa	[%l7 + %i5] 0x80,	%g1
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
	set	0x40, %g5
	swapa	[%l7 + %g5] 0x81,	%l6
	nop
	set	0x36, %o4
	stb	%o7,	[%l7 + %o4]
	set	0x48, %o6
	stda	%o6,	[%l7 + %o6] 0x80
	nop
	set	0x4E, %o7
	ldub	[%l7 + %o7],	%l3
	nop
	set	0x68, %i6
	std	%f20,	[%l7 + %i6]
	nop
	set	0x7F, %i2
	ldsb	[%l7 + %i2],	%i0
	wr	%g5,	%i4,	%pic
	set	0x48, %l2
	stxa	%i7,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x5B, %i4
	ldsb	[%l7 + %i4],	%l5
	wr	%g3,	%l0,	%pic
	nop
	set	0x38, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x60, %l1
	ldxa	[%l7 + %l1] 0x89,	%l4
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%i2
	nop
	set	0x28, %o5
	std	%i2,	[%l7 + %o5]
	nop
	set	0x7D, %l4
	ldstub	[%l7 + %l4],	%g2
	nop
	set	0x68, %g1
	std	%g6,	[%l7 + %g1]
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x80,	%f29
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xc4
	or	%l2,	%o2,	%i6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xd8,	%f0
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%l1
	nop
	set	0x20, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x30, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	nop
	set	0x58, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x10, %l0
	std	%o0,	[%l7 + %l0]
	nop
	set	0x20, %l5
	stx	%i5,	[%l7 + %l5]
	nop
	set	0x0C, %i7
	stw	%o0,	[%l7 + %i7]
	nop
	set	0x50, %g2
	stx	%fsr,	[%l7 + %g2]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%i1
	nop
	set	0x12, %l6
	ldsh	[%l7 + %l6],	%o5
	set	0x20, %g7
	stxa	%o3,	[%l7 + %g7] 0x88
	set	0x3E, %i5
	stha	%g4,	[%l7 + %i5] 0x88
	nop
	set	0x28, %g4
	std	%g0,	[%l7 + %g4]
	nop
	set	0x6A, %i1
	ldsh	[%l7 + %i1],	%l6
	ld	[%l7 + 0x58],	%f20
	nop
	set	0x20, %g5
	std	%f0,	[%l7 + %g5]
	set	0x70, %o4
	stda	%o6,	[%l7 + %o4] 0x88
	and	%o7,	%i0,	%g5
	wr	%l3,	%i7,	%clear_softint
	nop
	set	0x7C, %o6
	stb	%i4,	[%l7 + %o6]
	nop
	set	0x4B, %i6
	ldstub	[%l7 + %i6],	%g3
	or	%l0,	%l5,	%l4
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	set	0x1C, %o7
	sta	%f21,	[%l7 + %o7] 0x81
	nop
	set	0x60, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x2E, %o3
	ldstub	[%l7 + %o3],	%i2
	nop
	set	0x1E, %l1
	sth	%i3,	[%l7 + %l1]
	nop
	set	0x58, %l2
	stx	%fsr,	[%l7 + %l2]
	set	0x14, %o2
	stha	%g2,	[%l7 + %o2] 0x81
	set	0x3A, %l4
	stha	%l2,	[%l7 + %l4] 0xe3
	membar	#Sync
	nop
	set	0x78, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x70, %i0
	prefetch	[%l7 + %i0],	 3
	bge	%icc,	loop_150
	nop
	set	0x78, %g1
	std	%o2,	[%l7 + %g1]
	nop
	set	0x7C, %g6
	lduw	[%l7 + %g6],	%i6
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xea,	%g6
loop_150:
	nop
	set	0x58, %i3
	stxa	%l1,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x30, %g3
	swapa	[%l7 + %g3] 0x80,	%g6
	or	%o1,	%o0,	%o4
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%f22
	nop
	set	0x20, %l0
	prefetch	[%l7 + %l0],	 2
	nop
	set	0x28, %l5
	ldsw	[%l7 + %l5],	%i5
	wr	%o5,	%i1,	%clear_softint
	nop
	set	0x68, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x5C, %i7
	lduh	[%l7 + %i7],	%o3
	set	0x78, %g2
	stda	%g4,	[%l7 + %g2] 0x88
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f16
	and	%g1,	%l6,	%o7
	set	0x74, %l6
	sta	%f20,	[%l7 + %l6] 0x88
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf9
	membar	#Sync
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x89,	%i0
	set	0x28, %i5
	sta	%f29,	[%l7 + %i5] 0x80
	set	0x08, %g5
	stxa	%o6,	[%l7 + %g5] 0xeb
	membar	#Sync
	nop
	set	0x2C, %o4
	swap	[%l7 + %o4],	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%i4
	nop
	set	0x70, %i6
	lduh	[%l7 + %i6],	%i7
	nop
	set	0x24, %i2
	prefetch	[%l7 + %i2],	 0
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f22
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x89,	 2
	set	0x1C, %i4
	lda	[%l7 + %i4] 0x80,	%f29
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%l0
	set	0x7C, %o3
	stwa	%l5,	[%l7 + %o3] 0x80
	or	%i2,	%i3,	%g2
	set	0x4C, %l2
	swapa	[%l7 + %l2] 0x81,	%l2
	set	0x50, %o2
	stda	%o2,	[%l7 + %o2] 0xea
	membar	#Sync
	set	0x7A, %o5
	stha	%l4,	[%l7 + %o5] 0xe3
	membar	#Sync
	set	0x20, %l4
	lda	[%l7 + %l4] 0x80,	%f19
	nop
	set	0x08, %g1
	ldsb	[%l7 + %g1],	%g7
	nop
	set	0x38, %i0
	ldsh	[%l7 + %i0],	%l1
	wr	%g6,	%o1,	%clear_softint
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%o0
	nop
	set	0x18, %o1
	std	%o4,	[%l7 + %o1]
	nop
	set	0x58, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xda
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f6
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x81,	%i5
	nop
	set	0x20, %l3
	std	%f26,	[%l7 + %l3]
	nop
	set	0x38, %o0
	sth	%o5,	[%l7 + %o0]
	set	0x38, %i7
	sta	%f15,	[%l7 + %i7] 0x88
	set	0x60, %l5
	sta	%f2,	[%l7 + %l5] 0x81
	nop
	set	0x38, %g2
	ldx	[%l7 + %g2],	%i1
	st	%fsr,	[%l7 + 0x50]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%g1
	nop
	set	0x6D, %l6
	ldstub	[%l7 + %l6],	%l6
	be	%icc,	loop_151
	nop
	set	0x52, %g4
	sth	%o3,	[%l7 + %g4]
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x88,	%i0
loop_151:
	nop
	set	0x10, %i5
	std	%o6,	[%l7 + %i5]
	nop
	set	0x48, %g7
	lduw	[%l7 + %g7],	%l3
	set	0x18, %o4
	sta	%f30,	[%l7 + %o4] 0x81
	nop
	set	0x74, %g5
	ldub	[%l7 + %g5],	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xE34, 	%sys_tick_cmpr
	nop
	set	0x40, %i2
	stx	%i4,	[%l7 + %i2]
	nop
	set	0x7E, %i6
	ldsh	[%l7 + %i6],	%g3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%l0
	or	%i2,	%i3,	%g2
	bn	%xcc,	loop_152
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%f10
	wr	%o2,	%l2,	%sys_tick
	set	0x78, %i4
	stxa	%l4,	[%l7 + %i4] 0x89
loop_152:
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%g6
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x89
	set	0x38, %l2
	stba	%l1,	[%l7 + %l2] 0x81
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x88,	%o1
	nop
	set	0x50, %o3
	std	%f26,	[%l7 + %o3]
	ld	[%l7 + 0x64],	%f23
	set	0x64, %l4
	swapa	[%l7 + %l4] 0x88,	%i6
	nop
	set	0x5C, %g1
	sth	%o0,	[%l7 + %g1]
	st	%fsr,	[%l7 + 0x18]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x80,	%f16
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x89,	%o4
	wr	%g6,	%i5,	%y
	set	0x10, %o1
	ldda	[%l7 + %o1] 0xe3,	%i0
	nop
	set	0x58, %g6
	ldsb	[%l7 + %g6],	%g4
	nop
	set	0x50, %i3
	std	%f6,	[%l7 + %i3]
	set	0x78, %l0
	stha	%o5,	[%l7 + %l0] 0x88
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%f0
	nop
	set	0x56, %i7
	ldsh	[%l7 + %i7],	%g1
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x81,	%i6
	nop
	set	0x08, %g2
	ldsw	[%l7 + %g2],	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o3,	%l3
	set	0x70, %l3
	stba	%o7,	[%l7 + %l3] 0xea
	membar	#Sync
	nop
	set	0x68, %g4
	stw	%o6,	[%l7 + %g4]
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f10
	nop
	set	0x3E, %l6
	ldsb	[%l7 + %l6],	%g5
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x88,	%i7
	set	0x34, %i5
	sta	%f14,	[%l7 + %i5] 0x80
	nop
	set	0x24, %o4
	swap	[%l7 + %o4],	%i4
	nop
	set	0x6E, %g5
	ldsh	[%l7 + %g5],	%g3
	nop
	set	0x13, %i2
	ldub	[%l7 + %i2],	%l0
	set	0x38, %i6
	stda	%l4,	[%l7 + %i6] 0x80
	nop
	set	0x58, %i4
	stx	%i3,	[%l7 + %i4]
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x80,	 4
	set	0x54, %o6
	sta	%f28,	[%l7 + %o6] 0x80
	set	0x50, %o7
	stwa	%g2,	[%l7 + %o7] 0x89
	nop
	set	0x27, %l2
	ldsb	[%l7 + %l2],	%l2
	nop
	set	0x30, %o2
	stx	%l4,	[%l7 + %o2]
	or	%o2,	%g7,	%l1
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x80,	%o1
	set	0x4A, %g1
	ldstuba	[%l7 + %g1] 0x88,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o4
	bne,a	%icc,	loop_153
	nop
	set	0x10, %l4
	stx	%i5,	[%l7 + %l4]
	set	0x58, %o5
	stda	%g6,	[%l7 + %o5] 0x80
loop_153:
	nop
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	ba	%xcc,	loop_154
	st	%f9,	[%l7 + 0x68]
	nop
	set	0x6E, %g6
	ldstub	[%l7 + %g6],	%i1
	nop
	set	0x13, %o1
	ldsb	[%l7 + %o1],	%o5
loop_154:
	nop
	set	0x24, %l0
	lduw	[%l7 + %l0],	%g4
	nop
	set	0x60, %g3
	stx	%l6,	[%l7 + %g3]
	and	%g1,	%o3,	%i0
	or	%l3,	%o6,	%o7
	nop
	set	0x48, %o0
	std	%g4,	[%l7 + %o0]
	nop
	nop
	setx	0x0AFCCB1B31F17F12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB5C2647DC40C5546,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f24
	nop
	set	0x24, %i3
	swap	[%l7 + %i3],	%i4
	wr	%i7,	%g3,	%set_softint
	nop
	set	0x10, %i7
	prefetch	[%l7 + %i7],	 2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f16
	nop
	set	0x38, %l3
	stx	%l5,	[%l7 + %l3]
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x80,	 1
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x89,	%i2
	or	%g2,	%i3,	%l4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g7
	or	%l1,	%l2,	%i6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%o1
	set	0x78, %i1
	swapa	[%l7 + %i1] 0x88,	%i5
	nop
	set	0x22, %g7
	lduh	[%l7 + %g7],	%g6
	nop
	set	0x70, %l6
	std	%f28,	[%l7 + %l6]
	set	0x32, %o4
	stba	%o4,	[%l7 + %o4] 0x80
	nop
	set	0x1A, %i5
	stb	%i1,	[%l7 + %i5]
	set	0x50, %g5
	ldstuba	[%l7 + %g5] 0x88,	%g4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g1
	nop
	set	0x34, %i6
	ldstub	[%l7 + %i6],	%l6
	set	0x24, %i2
	stwa	%i0,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x31, %l1
	stb	%o3,	[%l7 + %l1]
	nop
	set	0x1A, %i4
	lduh	[%l7 + %i4],	%o6
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x80,	%l3,	%g5
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%o7
	bne,pn	%icc,	loop_155
	nop
	set	0x58, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%i4
	bleu	%icc,	loop_156
loop_155:
	nop
	set	0x6A, %g1
	lduh	[%l7 + %g1],	%l5
	nop
	set	0x7C, %l4
	ldsh	[%l7 + %l4],	%l0
	nop
	set	0x6C, %o5
	ldsw	[%l7 + %o5],	%g3
loop_156:
	nop
	set	0x2C, %o2
	stha	%i2,	[%l7 + %o2] 0x88
	nop
	set	0x28, %i0
	std	%f6,	[%l7 + %i0]
	set	0x40, %g6
	stha	%i3,	[%l7 + %g6] 0x80
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x81,	%g2
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x81,	%l4
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f10
	set	0x2C, %i3
	stwa	%o2,	[%l7 + %i3] 0xea
	membar	#Sync
	nop
	set	0x58, %i7
	stx	%l1,	[%l7 + %i7]
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x89,	 3
	nop
	set	0x40, %l3
	lduw	[%l7 + %l3],	%i6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x89,	%l2,	%o1
	set	0x40, %g4
	stxa	%o0,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%g6
	set	0x70, %o0
	stda	%i4,	[%l7 + %o0] 0xe3
	membar	#Sync
	set	0x44, %g7
	sta	%f31,	[%l7 + %g7] 0x89
	set	0x30, %i1
	swapa	[%l7 + %i1] 0x88,	%i1
	set	0x0C, %l6
	lda	[%l7 + %l6] 0x80,	%f17
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%o5
	set	0x70, %i5
	ldda	[%l7 + %i5] 0xe3,	%o4
	nop
	set	0x6C, %o4
	prefetch	[%l7 + %o4],	 4
	set	0x54, %i6
	stha	%g1,	[%l7 + %i6] 0xe3
	membar	#Sync
	nop
	nop
	setx	0xE009BA6FEE1D79E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2D90496CBA68043D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f8
	set	0x2A, %i2
	stha	%i0,	[%l7 + %i2] 0x80
	st	%f20,	[%l7 + 0x4C]
	set	0x08, %l1
	lda	[%l7 + %l1] 0x89,	%f25
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%l6
	nop
	set	0x6C, %g5
	ldsh	[%l7 + %g5],	%o3
	add	%l3,	%o6,	%g5
	nop
	set	0x08, %l2
	ldub	[%l7 + %l2],	%o7
	set	0x4C, %o6
	sta	%f9,	[%l7 + %o6] 0x88
	add	%i4,	%l5,	%i7
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x80,	 4
	nop
	set	0x50, %g1
	prefetch	[%l7 + %g1],	 4
	nop
	set	0x68, %o3
	stw	%i2,	[%l7 + %o3]
	set	0x20, %o5
	ldxa	[%l7 + %o5] 0x88,	%i3
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x80,	%f0
	nop
	set	0x74, %l4
	stb	%g3,	[%l7 + %l4]
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x89,	%f16
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%g2
	nop
	set	0x60, %g6
	stw	%o2,	[%l7 + %g6]
	nop
	set	0x0D, %g3
	ldsb	[%l7 + %g3],	%l4
	set	0x2C, %i3
	sta	%f14,	[%l7 + %i3] 0x80
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf1,	%f16
	nop
	set	0x30, %g2
	lduw	[%l7 + %g2],	%g7
	nop
	set	0x28, %l3
	ldsb	[%l7 + %l3],	%i6
	nop
	set	0x0C, %g4
	sth	%l2,	[%l7 + %g4]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o0
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x81,	%o1
	nop
	set	0x70, %o1
	std	%i4,	[%l7 + %o1]
	add	%i1,	%g6,	%g4
	nop
	set	0x28, %g7
	prefetch	[%l7 + %g7],	 2
	nop
	set	0x5A, %o0
	ldsh	[%l7 + %o0],	%o5
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	nop
	set	0x24, %i1
	ldsb	[%l7 + %i1],	%o4
	nop
	set	0x7C, %i5
	lduw	[%l7 + %i5],	%l6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i0
	nop
	set	0x47, %o4
	ldub	[%l7 + %o4],	%o6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f0
	nop
	set	0x30, %l1
	swap	[%l7 + %l1],	%g5
	wr	%l3,	%o7,	%set_softint
	ld	[%l7 + 0x34],	%f0
	set	0x7E, %i2
	stba	%l5,	[%l7 + %i2] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x2C]
	ld	[%l7 + 0x0C],	%f12
	nop
	set	0x20, %i4
	stx	%i4,	[%l7 + %i4]
	nop
	set	0x30, %l2
	stx	%l0,	[%l7 + %l2]
	nop
	set	0x38, %o6
	ldub	[%l7 + %o6],	%i7
	set	0x78, %g5
	stwa	%i3,	[%l7 + %g5] 0x81
	nop
	set	0x30, %o7
	stx	%fsr,	[%l7 + %o7]
	and	%g3,	%g2,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%g7
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
	nop
	set	0x58, %o5
	ldd	[%l7 + %o5],	%f26
	be,a	%icc,	loop_157
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%l2
	set	0x3C, %l4
	ldstuba	[%l7 + %l4] 0x81,	%i6
loop_157:
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%o0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%l1
	ble,a	%icc,	loop_158
	nop
	set	0x50, %l0
	ldx	[%l7 + %l0],	%i5
	set	0x36, %i0
	stha	%i1,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_158:
	nop
	set	0x08, %g3
	swap	[%l7 + %g3],	%g6
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf0
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%g1
	nop
	set	0x18, %i3
	stx	%o4,	[%l7 + %i3]
	nop
	set	0x08, %i7
	ldub	[%l7 + %i7],	%o5
	nop
	set	0x48, %l3
	sth	%l6,	[%l7 + %l3]
	nop
	set	0x4C, %g2
	stw	%o3,	[%l7 + %g2]
	set	0x18, %g4
	swapa	[%l7 + %g4] 0x88,	%i0
	nop
	set	0x40, %o1
	swap	[%l7 + %o1],	%g5
	set	0x46, %g7
	stha	%o6,	[%l7 + %g7] 0x89
	set	0x16, %l5
	stha	%l3,	[%l7 + %l5] 0x80
	st	%f6,	[%l7 + 0x70]
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%l4
	set	0x70, %o0
	stxa	%i4,	[%l7 + %o0] 0xe3
	membar	#Sync
	or	%o7,	%i7,	%i3
	add	%g3,	%g2,	%l0
	st	%f16,	[%l7 + 0x68]
	set	0x57, %i1
	stba	%i2,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x7C, %i5
	lduh	[%l7 + %i5],	%g7
	set	0x29, %o4
	stba	%l4,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x28, %l1
	stx	%fsr,	[%l7 + %l1]
	and	%o2,	%l2,	%o0
	nop
	set	0x16, %i6
	ldsh	[%l7 + %i6],	%o1
	and	%i6,	%i5,	%l1
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%g6
	or	%g4,	%i1,	%o4
	set	0x64, %l2
	stwa	%g1,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x19, %o6
	ldub	[%l7 + %o6],	%o5
	nop
	set	0x79, %i2
	ldsb	[%l7 + %i2],	%l6
	set	0x60, %g5
	stda	%i0,	[%l7 + %g5] 0x80
	wr 	%g0, 	0x4, 	%fprs
	set	0x0C, %g1
	stwa	%g5,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x38, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x6C, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l5
	st	%f13,	[%l7 + 0x1C]
	nop
	set	0x7C, %l4
	prefetch	[%l7 + %l4],	 2
	add	%i4,	%o7,	%l3
	nop
	set	0x38, %o3
	lduw	[%l7 + %o3],	%i3
	nop
	set	0x1F, %o2
	ldub	[%l7 + %o2],	%g3
	st	%fsr,	[%l7 + 0x08]
	set	0x4C, %i0
	lda	[%l7 + %i0] 0x88,	%f29
	nop
	set	0x20, %g3
	stx	%fsr,	[%l7 + %g3]
	nop
	set	0x20, %g6
	std	%g2,	[%l7 + %g6]
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i2
	set	0x74, %i7
	stwa	%l4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x13, %l0
	ldub	[%l7 + %l0],	%g7
	nop
	set	0x40, %l3
	std	%f12,	[%l7 + %l3]
	nop
	set	0x38, %g4
	ldsb	[%l7 + %g4],	%l2
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%f6
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x80,	 1
	nop
	set	0x5A, %l5
	sth	%o1,	[%l7 + %l5]
	nop
	set	0x70, %l6
	stx	%i6,	[%l7 + %l6]
	set	0x28, %o0
	stxa	%i5,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x1C, %i1
	ldsw	[%l7 + %i1],	%l1
	nop
	set	0x1A, %g2
	lduh	[%l7 + %g2],	%o0
	set	0x38, %o4
	sta	%f1,	[%l7 + %o4] 0x81
	nop
	set	0x10, %l1
	std	%g6,	[%l7 + %l1]
	nop
	set	0x50, %i6
	stx	%i1,	[%l7 + %i6]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%g1
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x88,	%o5
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x89,	 4
	nop
	set	0x50, %o6
	std	%i0,	[%l7 + %o6]
	set	0x5C, %i2
	stba	%o3,	[%l7 + %i2] 0x80
	nop
	set	0x33, %i4
	ldstub	[%l7 + %i4],	%g4
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f8
	nop
	set	0x3E, %o5
	ldsh	[%l7 + %o5],	%g5
	ld	[%l7 + 0x78],	%f5
	nop
	set	0x58, %g5
	std	%l4,	[%l7 + %g5]
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%o6
	set	0x58, %o3
	stda	%i4,	[%l7 + %o3] 0x88
	set	0x28, %o2
	stxa	%l3,	[%l7 + %o2] 0x81
	nop
	set	0x4F, %i0
	stb	%o7,	[%l7 + %i0]
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%i3
	nop
	set	0x30, %g6
	stx	%g3,	[%l7 + %g6]
	nop
	set	0x12, %o7
	sth	%g2,	[%l7 + %o7]
	set	0x4E, %i3
	stha	%i7,	[%l7 + %i3] 0xe3
	membar	#Sync
	ld	[%l7 + 0x60],	%f26
	st	%fsr,	[%l7 + 0x38]
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xd2
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%i2
	nop
	set	0x0A, %l3
	lduh	[%l7 + %l3],	%l4
	ld	[%l7 + 0x08],	%f17
	set	0x34, %g4
	sta	%f1,	[%l7 + %g4] 0x81
	nop
	set	0x40, %o1
	std	%f12,	[%l7 + %o1]
	nop
	set	0x0E, %l5
	sth	%g7,	[%l7 + %l5]
	st	%f19,	[%l7 + 0x64]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%o2
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	nop
	set	0x7E, %g7
	ldsh	[%l7 + %g7],	%o1
	nop
	set	0x08, %i1
	std	%i6,	[%l7 + %i1]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%l1
	set	0x10, %g2
	stxa	%i5,	[%l7 + %g2] 0x89
	st	%f5,	[%l7 + 0x10]
	set	0x44, %o0
	stha	%o0,	[%l7 + %o0] 0x80
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x80,	%g6,	%o4
	st	%f29,	[%l7 + 0x20]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%o5
	nop
	set	0x1C, %o4
	ldsh	[%l7 + %o4],	%g1
	set	0x36, %l1
	stha	%i0,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x17, %i6
	ldub	[%l7 + %i6],	%l6
	set	0x6D, %i5
	ldstuba	[%l7 + %i5] 0x88,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x88,	%g5,	%o3
	st	%f13,	[%l7 + 0x1C]
	set	0x44, %o6
	lda	[%l7 + %o6] 0x81,	%f7
	fpadd32	%f28,	%f18,	%f28
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%i4
	set	0x63, %l2
	ldstuba	[%l7 + %l2] 0x89,	%l3
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x88,	%o6
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x81,	 1
	nop
	set	0x58, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f0
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x80,	%i3
	bn,a	%xcc,	loop_159
	or	%g3,	%g2,	%i2
	nop
	set	0x20, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x5E, %o3
	ldsh	[%l7 + %o3],	%l4
loop_159:
	nop
	set	0x30, %o2
	ldub	[%l7 + %o2],	%g7
	fpadd16	%f18,	%f8,	%f16
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%i7
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%l2
	fpadd32s	%f6,	%f14,	%f14
	set	0x24, %g3
	stba	%o1,	[%l7 + %g3] 0x88
	set	0x34, %o7
	swapa	[%l7 + %o7] 0x88,	%i6
	set	0x38, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o2
	set	0x42, %i3
	ldstuba	[%l7 + %i3] 0x80,	%l0
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x89,	%l1
	set	0x28, %g4
	stha	%o0,	[%l7 + %g4] 0x80
	nop
	set	0x78, %l3
	std	%f6,	[%l7 + %l3]
	set	0x40, %o1
	lda	[%l7 + %o1] 0x80,	%f18
	set	0x10, %l5
	stda	%i4,	[%l7 + %l5] 0x80
	nop
	set	0x7C, %l6
	stb	%o4,	[%l7 + %l6]
	st	%f14,	[%l7 + 0x08]
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x88,	 4
	nop
	set	0x1C, %g2
	stw	%o5,	[%l7 + %g2]
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%i0
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%i0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g1
	set	0x08, %l1
	swapa	[%l7 + %l1] 0x81,	%g4
	nop
	set	0x56, %i6
	lduh	[%l7 + %i6],	%o3
	ld	[%l7 + 0x48],	%f5
	set	0x12, %i5
	ldstuba	[%l7 + %i5] 0x80,	%g5
	fpadd16	%f6,	%f26,	%f28
	st	%f11,	[%l7 + 0x7C]
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x80,	%i4
	ld	[%l7 + 0x58],	%f11
	nop
	set	0x78, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x08, %l2
	stx	%l3,	[%l7 + %l2]
	set	0x15, %i4
	stba	%o6,	[%l7 + %i4] 0x89
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x80,	%l4
	nop
	set	0x4B, %g5
	stb	%o7,	[%l7 + %g5]
	set	0x28, %i2
	stda	%i2,	[%l7 + %i2] 0x81
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f0
	set	0x5C, %o5
	sta	%f30,	[%l7 + %o5] 0x88
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f22
	or	%g2,	%g3,	%i2
	nop
	set	0x4C, %i0
	ldsw	[%l7 + %i0],	%l4
	nop
	set	0x08, %o3
	stx	%g7,	[%l7 + %o3]
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x88,	 2
	nop
	set	0x61, %g6
	ldub	[%l7 + %g6],	%o1
	and	%i6,	%l2,	%l0
	and	%l1,	%o2,	%o0
	st	%f22,	[%l7 + 0x40]
	set	0x70, %o7
	stwa	%o4,	[%l7 + %o7] 0x88
	set	0x7A, %l0
	stha	%g6,	[%l7 + %l0] 0xe2
	membar	#Sync
	bne	%icc,	loop_160
	fpadd16	%f12,	%f24,	%f20
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x1B8, 	%sys_tick_cmpr
	nop
	set	0x44, %i3
	ldub	[%l7 + %i3],	%i1
loop_160:
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f14
	set	0x30, %l3
	ldda	[%l7 + %l3] 0x81,	%i6
	set	0x56, %g4
	stha	%g1,	[%l7 + %g4] 0x88
	wr	%i0,	%g4,	%ccr
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd8,	%f16
	nop
	set	0x3D, %l6
	ldsb	[%l7 + %l6],	%g5
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 1
	set	0x50, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0
	set	0x54, %o1
	stwa	%o3,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x76, %o0
	lduh	[%l7 + %o0],	%l3
	set	0x57, %g7
	stba	%o6,	[%l7 + %g7] 0x89
	set	0x70, %l1
	stwa	%o7,	[%l7 + %l1] 0xea
	membar	#Sync
	nop
	set	0x34, %i6
	ldsw	[%l7 + %i6],	%l5
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xe3,	%g2
	nop
	set	0x76, %o4
	sth	%i3,	[%l7 + %o4]
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%f2
	nop
	set	0x68, %o6
	prefetch	[%l7 + %o6],	 3
	st	%fsr,	[%l7 + 0x3C]
	set	0x48, %i4
	swapa	[%l7 + %i4] 0x89,	%i2
	set	0x10, %g5
	sta	%f27,	[%l7 + %g5] 0x81
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%l4
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x88,	%g2
	nop
	set	0x08, %o5
	lduw	[%l7 + %o5],	%i7
	set	0x4B, %l4
	stba	%o1,	[%l7 + %l4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x48, %o2
	stx	%g7,	[%l7 + %o2]
	set	0x1C, %i0
	stwa	%l2,	[%l7 + %i0] 0xeb
	membar	#Sync
	or	%i6,	%l1,	%l0
	set	0x4E, %o3
	stha	%o0,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x77, %g6
	stba	%o4,	[%l7 + %g6] 0x88
	nop
	set	0x14, %g3
	ldub	[%l7 + %g3],	%o2
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%i4
	set	0x30, %i3
	prefetcha	[%l7 + %i3] 0x81,	 4
	nop
	set	0x70, %i7
	swap	[%l7 + %i7],	%l6
	set	0x68, %g4
	swapa	[%l7 + %g4] 0x80,	%g1
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x88,	%i0
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%f20
	or	%g4,	%i1,	%g5
	set	0x34, %i1
	stwa	%o3,	[%l7 + %i1] 0x88
	nop
	set	0x58, %g2
	ldd	[%l7 + %g2],	%l2
	set	0x40, %o1
	stwa	%i4,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x10, %l5
	stha	%o7,	[%l7 + %l5] 0x89
	nop
	set	0x08, %g7
	prefetch	[%l7 + %g7],	 3
	set	0x4C, %l1
	stha	%o6,	[%l7 + %l1] 0x89
	nop
	set	0x3C, %o0
	stb	%g2,	[%l7 + %o0]
	and	%l5,	%i2,	%i3
	set	0x18, %i5
	stda	%l4,	[%l7 + %i5] 0x80
	set	0x28, %i6
	stha	%g3,	[%l7 + %i6] 0x81
	nop
	set	0x3C, %o4
	ldsh	[%l7 + %o4],	%i7
	fpsub16	%f2,	%f10,	%f4
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f20
	add	%o1,	%g7,	%l2
	bgu	%xcc,	loop_161
	bge	%icc,	loop_162
	nop
	set	0x59, %l2
	ldsb	[%l7 + %l2],	%l1
	set	0x40, %i4
	prefetcha	[%l7 + %i4] 0x81,	 1
loop_161:
	nop
	set	0x12, %i2
	ldsb	[%l7 + %i2],	%o0
loop_162:
	nop
	set	0x6A, %g5
	sth	%o4,	[%l7 + %g5]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%l0
	set	0x50, %o5
	swapa	[%l7 + %o5] 0x80,	%g6
	bg	%icc,	loop_163
	st	%f17,	[%l7 + 0x18]
	fpsub16s	%f9,	%f3,	%f18
	set	0x30, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
loop_163:
	nop
	set	0x64, %g1
	lduh	[%l7 + %g1],	%i5
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x38, %o2
	ldd	[%l7 + %o2],	%f2
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x80,	%l6
	set	0x4C, %g6
	ldstuba	[%l7 + %g6] 0x89,	%i0
	fpsub16s	%f13,	%f2,	%f6
	nop
	set	0x24, %g3
	prefetch	[%l7 + %g3],	 3
	set	0x30, %o3
	ldda	[%l7 + %o3] 0xe2,	%g4
	set	0x28, %o7
	stxa	%i1,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%f30
	set	0x10, %i7
	stwa	%g1,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x2E, %g4
	stb	%g5,	[%l7 + %g4]
	set	0x64, %l0
	lda	[%l7 + %l0] 0x88,	%f13
	set	0x60, %l6
	stda	%l2,	[%l7 + %l6] 0xe2
	membar	#Sync
	nop
	set	0x68, %l3
	stx	%i4,	[%l7 + %l3]
	nop
	set	0x38, %g2
	lduw	[%l7 + %g2],	%o3
	nop
	set	0x60, %i1
	ldx	[%l7 + %i1],	%o7
	st	%fsr,	[%l7 + 0x5C]
	set	0x34, %l5
	lda	[%l7 + %l5] 0x80,	%f12
	nop
	set	0x0D, %o1
	ldstub	[%l7 + %o1],	%g2
	bleu,pn	%icc,	loop_164
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%o6
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%l5
	nop
	set	0x17, %g7
	ldsb	[%l7 + %g7],	%i2
loop_164:
	nop
	set	0x40, %i5
	ldxa	[%l7 + %i5] 0x81,	%l4
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x89,	 2
	nop
	set	0x08, %o6
	std	%i6,	[%l7 + %o6]
	nop
	set	0x68, %i6
	stw	%g3,	[%l7 + %i6]
	fpadd16	%f26,	%f28,	%f30
	fpsub32s	%f29,	%f29,	%f1
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf8
	membar	#Sync
	fpsub32s	%f5,	%f18,	%f8
	ld	[%l7 + 0x74],	%f0
	set	0x28, %i2
	stda	%g6,	[%l7 + %i2] 0xea
	membar	#Sync
	nop
	set	0x40, %g5
	stw	%l2,	[%l7 + %g5]
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%o0
	nop
	set	0x60, %i4
	std	%f26,	[%l7 + %i4]
	fpadd16s	%f2,	%f12,	%f7
	st	%f0,	[%l7 + 0x2C]
	nop
	set	0x2A, %g1
	ldub	[%l7 + %g1],	%l1
	nop
	set	0x60, %o2
	std	%f16,	[%l7 + %o2]
	nop
	set	0x10, %l4
	std	%o0,	[%l7 + %l4]
	nop
	set	0x0A, %g6
	lduh	[%l7 + %g6],	%o4
	nop
	set	0x31, %g3
	stb	%i6,	[%l7 + %g3]
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%l0
	set	0x20, %o7
	prefetcha	[%l7 + %o7] 0x88,	 3
	set	0x0C, %o3
	sta	%f12,	[%l7 + %o3] 0x89
	set	0x28, %i7
	stda	%o4,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x60, %g4
	stda	%i4,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x1C, %l0
	stwa	%g6,	[%l7 + %l0] 0x89
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xd0
	bg,pn	%icc,	loop_165
	nop
	set	0x22, %l3
	stb	%i0,	[%l7 + %l3]
	ld	[%l7 + 0x10],	%f14
	nop
	set	0x58, %g2
	std	%f20,	[%l7 + %g2]
loop_165:
	and	%g4,	%l6,	%i1
	fpsub16	%f0,	%f26,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g5
	nop
	set	0x10, %i1
	std	%f2,	[%l7 + %i1]
	set	0x78, %l5
	swapa	[%l7 + %l5] 0x81,	%l3
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x4A, %l6
	sth	%i4,	[%l7 + %l6]
	fpsub32s	%f15,	%f23,	%f22
	nop
	set	0x38, %o1
	ldsw	[%l7 + %o1],	%o7
	nop
	nop
	setx	0xE6C330F3493B8749,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x121BBCC4637F4FE9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f8,	%f20
	add	%g2,	%o6,	%l5
	set	0x68, %l1
	sta	%f16,	[%l7 + %l1] 0x89
	st	%f18,	[%l7 + 0x0C]
	add	%i2,	%l4,	%o3
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%i7
	nop
	set	0x30, %g7
	std	%f30,	[%l7 + %g7]
	nop
	set	0x14, %o4
	ldsw	[%l7 + %o4],	%g3
	ld	[%l7 + 0x48],	%f14
	set	0x44, %i5
	stha	%i3,	[%l7 + %i5] 0xe2
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f16
	add	%l2,	%g7,	%o1
	set	0x68, %i6
	prefetcha	[%l7 + %i6] 0x80,	 4
	nop
	set	0x60, %l2
	prefetch	[%l7 + %l2],	 0
	fpsub32	%f26,	%f18,	%f12
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f10
	nop
	set	0x68, %i2
	std	%f20,	[%l7 + %i2]
	st	%f1,	[%l7 + 0x70]
	set	0x28, %i4
	stda	%o4,	[%l7 + %i4] 0x89
	set	0x54, %o5
	swapa	[%l7 + %o5] 0x81,	%l1
	nop
	set	0x6A, %o2
	lduh	[%l7 + %o2],	%l0
	nop
	set	0x34, %g1
	prefetch	[%l7 + %g1],	 1
	fpsub16s	%f29,	%f19,	%f19
	set	0x34, %l4
	stwa	%o2,	[%l7 + %l4] 0x88
	nop
	set	0x20, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x52, %g3
	stb	%i6,	[%l7 + %g3]
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%o4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x88,	%f16
	set	0x77, %i7
	stba	%g6,	[%l7 + %i7] 0x89
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
	nop
	set	0x08, %l0
	ldsw	[%l7 + %l0],	%i5
	nop
	set	0x20, %i3
	stw	%g4,	[%l7 + %i3]
	nop
	set	0x2C, %l3
	sth	%l6,	[%l7 + %l3]
	nop
	set	0x10, %o3
	ldx	[%l7 + %o3],	%i1
	nop
	set	0x78, %g2
	stb	%i0,	[%l7 + %g2]
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%f22
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%g1
	or	%l3,	%i4,	%g2
	nop
	set	0x3F, %l6
	ldsb	[%l7 + %l6],	%o7
	and	%l5,	%o6,	%i2
	ld	[%l7 + 0x60],	%f8
	nop
	set	0x68, %o1
	ldsh	[%l7 + %o1],	%l4
	nop
	set	0x78, %l5
	prefetch	[%l7 + %l5],	 0
	nop
	set	0x40, %l1
	ldx	[%l7 + %l1],	%i7
	set	0x4A, %g7
	ldstuba	[%l7 + %g7] 0x80,	%o3
	ld	[%l7 + 0x24],	%f17
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 4
	st	%fsr,	[%l7 + 0x54]
	set	0x28, %o4
	ldxa	[%l7 + %o4] 0x80,	%g3
	ld	[%l7 + 0x08],	%f20
	nop
	set	0x28, %o6
	stw	%l2,	[%l7 + %o6]
	nop
	set	0x38, %i5
	ldd	[%l7 + %i5],	%g6
	set	0x3F, %l2
	stba	%i3,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x88,	%o1
	or	%o0,	%l1,	%o4
	nop
	set	0x22, %i6
	ldsh	[%l7 + %i6],	%o2
	set	0x18, %i4
	stda	%l0,	[%l7 + %i4] 0xeb
	membar	#Sync
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f0
	nop
	set	0x50, %o2
	swap	[%l7 + %o2],	%i6
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%o4
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x80,	%g6
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xcc
	nop
	set	0x18, %g6
	stx	%fsr,	[%l7 + %g6]
	ld	[%l7 + 0x24],	%f18
	fpsub32	%f12,	%f14,	%f18
	wr	%g4,	%i5,	%set_softint
	wr	%i1,	%l6,	%sys_tick
	nop
	set	0x48, %i0
	ldsw	[%l7 + %i0],	%g5
	nop
	set	0x70, %g3
	swap	[%l7 + %g3],	%g1
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x88
	nop
	set	0x78, %g4
	ldx	[%l7 + %g4],	%l3
	st	%fsr,	[%l7 + 0x20]
	or	%i0,	%g2,	%o7
	set	0x78, %o7
	stda	%i4,	[%l7 + %o7] 0x89
	nop
	set	0x3D, %i3
	stb	%o6,	[%l7 + %i3]
	nop
	set	0x68, %l3
	std	%f14,	[%l7 + %l3]
	add	%l5,	%l4,	%i2
	set	0x78, %o3
	stda	%i6,	[%l7 + %o3] 0xe3
	membar	#Sync
	fpsub16s	%f2,	%f22,	%f1
	set	0x64, %g2
	stha	%g3,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x1C, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o3
	set	0x28, %l6
	stha	%g7,	[%l7 + %l6] 0x89
	and	%i3,	%o1,	%o0
	set	0x60, %o1
	stwa	%l1,	[%l7 + %o1] 0x88
	set	0x50, %l5
	stwa	%o4,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x78, %i1
	stx	%o2,	[%l7 + %i1]
	st	%f15,	[%l7 + 0x64]
	nop
	set	0x4B, %g7
	ldub	[%l7 + %g7],	%l0
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%l2
	nop
	set	0x38, %o4
	ldstub	[%l7 + %o4],	%o5
	nop
	set	0x32, %o6
	lduh	[%l7 + %o6],	%i6
	set	0x34, %o0
	stba	%g4,	[%l7 + %o0] 0x81
	nop
	set	0x70, %l2
	ldd	[%l7 + %l2],	%g6
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x89,	%i1
	nop
	set	0x34, %i6
	prefetch	[%l7 + %i6],	 1
	set	0x7A, %i4
	stha	%l6,	[%l7 + %i4] 0xe3
	membar	#Sync
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%g4
	add	%i5,	%l3,	%g1
	add	%i0,	%o7,	%g2
	set	0x34, %o2
	stwa	%i4,	[%l7 + %o2] 0xea
	membar	#Sync
	nop
	set	0x12, %o5
	stb	%o6,	[%l7 + %o5]
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%l4
	set	0x30, %l4
	stwa	%l4,	[%l7 + %l4] 0x89
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf8,	%f0
	nop
	set	0x67, %g1
	ldub	[%l7 + %g1],	%i7
	set	0x28, %i0
	stha	%i2,	[%l7 + %i0] 0x89
	nop
	set	0x50, %i7
	ldx	[%l7 + %i7],	%o3
	nop
	set	0x6C, %g4
	ldsh	[%l7 + %g4],	%g7
	set	0x50, %g3
	stba	%i3,	[%l7 + %g3] 0xeb
	membar	#Sync
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf8
	membar	#Sync
	set	0x77, %l3
	ldstuba	[%l7 + %l3] 0x81,	%o1
	set	0x40, %i3
	stwa	%o0,	[%l7 + %i3] 0x80
	nop
	set	0x48, %g2
	ldx	[%l7 + %g2],	%g3
	nop
	set	0x58, %l0
	ldx	[%l7 + %l0],	%l1
	nop
	set	0x10, %l6
	stx	%fsr,	[%l7 + %l6]
	st	%f7,	[%l7 + 0x74]
	nop
	set	0x7F, %o3
	stb	%o4,	[%l7 + %o3]
	nop
	set	0x68, %o1
	ldsw	[%l7 + %o1],	%o2
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x18, %l5
	stx	%l0,	[%l7 + %l5]
	set	0x18, %g7
	ldxa	[%l7 + %g7] 0x88,	%l2
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%o4
	set	0x08, %i1
	lda	[%l7 + %i1] 0x81,	%f27
	nop
	set	0x1C, %o6
	ldub	[%l7 + %o6],	%g4
	nop
	set	0x40, %o4
	ldsw	[%l7 + %o4],	%i6
	add	%g6,	%i1,	%l6
	nop
	set	0x41, %l2
	ldsb	[%l7 + %l2],	%i5
	set	0x3C, %g5
	sta	%f25,	[%l7 + %g5] 0x80
	nop
	set	0x5D, %o0
	ldstub	[%l7 + %o0],	%l3
	and	%g1,	%i0,	%g5
	nop
	set	0x58, %i4
	stx	%o7,	[%l7 + %i4]
	nop
	set	0x5C, %i6
	ldsh	[%l7 + %i6],	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%g2
	nop
	set	0x20, %o2
	ldstub	[%l7 + %o2],	%l4
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x89,	%i7
	nop
	set	0x10, %i2
	ldd	[%l7 + %i2],	%f4
	ld	[%l7 + 0x18],	%f18
	ld	[%l7 + 0x34],	%f4
	nop
	set	0x5E, %i5
	sth	%l5,	[%l7 + %i5]
	nop
	set	0x28, %g6
	ldx	[%l7 + %g6],	%i2
	set	0x78, %g1
	stda	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x1A, %i0
	lduh	[%l7 + %i0],	%g7
	nop
	nop
	setx	0x40A770F17751F4DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB474C6BFC3C6E96E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f4,	%f10
	set	0x3C, %l4
	sta	%f18,	[%l7 + %l4] 0x81
	set	0x57, %i7
	ldstuba	[%l7 + %i7] 0x80,	%i3
	nop
	set	0x28, %g3
	ldsb	[%l7 + %g3],	%o0
	nop
	set	0x6C, %g4
	ldsw	[%l7 + %g4],	%g3
	set	0x10, %l3
	ldda	[%l7 + %l3] 0xe2,	%l0
	nop
	set	0x68, %i3
	std	%f16,	[%l7 + %i3]
	nop
	set	0x60, %o7
	std	%f20,	[%l7 + %o7]
	nop
	set	0x30, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x38, %l0
	lduh	[%l7 + %l0],	%o1
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x68, %o3
	swap	[%l7 + %o3],	%o4
	nop
	set	0x68, %o1
	swap	[%l7 + %o1],	%l0
	nop
	set	0x1C, %l5
	ldstub	[%l7 + %l5],	%l2
	set	0x14, %l6
	sta	%f30,	[%l7 + %l6] 0x80
	nop
	set	0x20, %g7
	stx	%o2,	[%l7 + %g7]
	add	%o5,	%i6,	%g4
	set	0x28, %i1
	stwa	%i1,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x72, %o6
	stb	%g6,	[%l7 + %o6]
	bgu,a	%icc,	loop_166
	nop
	set	0x50, %l1
	std	%i6,	[%l7 + %l1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%i5
loop_166:
	and	%g1,	%i0,	%g5
	nop
	set	0x20, %l2
	stw	%o7,	[%l7 + %l2]
	fpadd32s	%f24,	%f27,	%f29
	nop
	set	0x20, %g5
	std	%i4,	[%l7 + %g5]
	nop
	set	0x38, %o4
	std	%f24,	[%l7 + %o4]
	nop
	set	0x54, %o0
	stw	%g2,	[%l7 + %o0]
	ld	[%l7 + 0x44],	%f13
	nop
	set	0x38, %i6
	std	%f0,	[%l7 + %i6]
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%f10
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%o6
	set	0x10, %o5
	ldxa	[%l7 + %o5] 0x80,	%i7
	set	0x76, %o2
	stba	%i2,	[%l7 + %o2] 0x80
	set	0x50, %i5
	stba	%o3,	[%l7 + %i5] 0x89
	st	%f31,	[%l7 + 0x78]
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%g6
	set	0x20, %g6
	ldda	[%l7 + %g6] 0x88,	%l4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%g3
	set	0x74, %g1
	lda	[%l7 + %g1] 0x88,	%f30
	nop
	set	0x18, %i0
	lduw	[%l7 + %i0],	%l1
	st	%fsr,	[%l7 + 0x0C]
	nop
	set	0x52, %l4
	ldsh	[%l7 + %l4],	%o1
	nop
	set	0x64, %g3
	stw	%o0,	[%l7 + %g3]
	set	0x1C, %g4
	ldstuba	[%l7 + %g4] 0x89,	%l0
	set	0x48, %l3
	sta	%f12,	[%l7 + %l3] 0x89
	set	0x1C, %i7
	ldstuba	[%l7 + %i7] 0x80,	%o4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%o5
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%g4
	nop
	set	0x7C, %i3
	stw	%l2,	[%l7 + %i3]
	nop
	set	0x08, %g2
	ldd	[%l7 + %g2],	%f30
	nop
	set	0x6D, %l0
	ldub	[%l7 + %l0],	%i1
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xc4
	nop
	set	0x60, %o3
	std	%g6,	[%l7 + %o3]
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd2
	nop
	set	0x40, %l5
	std	%i6,	[%l7 + %l5]
	wr	%l3,	%g1,	%clear_softint
	set	0x30, %l6
	ldda	[%l7 + %l6] 0xe3,	%i0
	set	0x0B, %g7
	ldstuba	[%l7 + %g7] 0x88,	%i5
	nop
	set	0x58, %i1
	std	%g4,	[%l7 + %i1]
	fpsub16	%f20,	%f22,	%f8
	set	0x14, %o6
	stha	%i4,	[%l7 + %o6] 0x80
	st	%f19,	[%l7 + 0x28]
	set	0x3A, %l1
	stba	%o7,	[%l7 + %l1] 0xe3
	membar	#Sync
	nop
	set	0x6C, %l2
	ldsh	[%l7 + %l2],	%l4
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f0
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x89,	%g2
	nop
	set	0x7C, %i6
	swap	[%l7 + %i6],	%i7
	wr	%i2,	%o3,	%softint
	nop
	set	0x4E, %g5
	stb	%o6,	[%l7 + %g5]
	st	%f4,	[%l7 + 0x48]
	nop
	set	0x50, %i4
	stx	%l5,	[%l7 + %i4]
	set	0x10, %o2
	swapa	[%l7 + %o2] 0x81,	%g7
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%g3
	set	0x58, %i2
	ldxa	[%l7 + %i2] 0x81,	%i3
	add	%l1,	%o1,	%l0
	nop
	set	0x18, %g6
	lduw	[%l7 + %g6],	%o4
	wr	%o2,	%o0,	%sys_tick
	and	%i6,	%g4,	%l2
	st	%f20,	[%l7 + 0x1C]
	nop
	set	0x70, %i5
	lduh	[%l7 + %i5],	%i1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xea,	%g6
	st	%f20,	[%l7 + 0x70]
	nop
	set	0x38, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x7A, %l4
	lduh	[%l7 + %l4],	%o5
	nop
	set	0x60, %g3
	stx	%l3,	[%l7 + %g3]
	nop
	set	0x1D, %g4
	ldsb	[%l7 + %g4],	%l6
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x89,	%g1
	set	0x52, %i7
	stha	%i5,	[%l7 + %i7] 0x81
	and	%g5,	%i4,	%i0
	set	0x10, %g2
	stxa	%o7,	[%l7 + %g2] 0xe3
	membar	#Sync
	and	%g2,	%l4,	%i7
	set	0x3A, %l0
	stba	%i2,	[%l7 + %l0] 0x88
	set	, %o7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 5:
!
!	Type l   	: 1279
!	Type a   	: 23
!	Type cti   	: 31
!	Type x   	: 528
!	Type f   	: 39
!	Type i   	: 100
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
	set	0x2,	%g2
	set	0x7,	%g3
	set	0x0,	%g4
	set	0xE,	%g5
	set	0x6,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xA,	%i1
	set	-0x3,	%i2
	set	-0xC,	%i3
	set	-0x9,	%i4
	set	-0xF,	%i5
	set	-0x1,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x169AFAC8,	%l0
	set	0x36AE20E2,	%l1
	set	0x7DE20E0C,	%l2
	set	0x13519D81,	%l3
	set	0x2C144A86,	%l4
	set	0x7EF762B3,	%l5
	set	0x75B893CA,	%l6
	!# Output registers
	set	-0x020D,	%o0
	set	-0x0E9E,	%o1
	set	0x0783,	%o2
	set	-0x19E6,	%o3
	set	-0x0E71,	%o4
	set	-0x17B7,	%o5
	set	0x0192,	%o6
	set	0x15D5,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	nop
	set	0x70, %i3
	std	%o6,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x7C]
	nop
	nop
	setx	0xB1E7BE3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xF8C4D810,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f23,	%f0
	set	0x44, %o3
	stha	%o3,	[%l7 + %o3] 0x81
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf9,	%f16
	set	0x60, %l6
	stda	%l4,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x22, %g7
	stba	%g3,	[%l7 + %g7] 0x88
	nop
	set	0x60, %i1
	std	%g6,	[%l7 + %i1]
	st	%f12,	[%l7 + 0x18]
	nop
	set	0x20, %l5
	prefetch	[%l7 + %l5],	 4
	nop
	set	0x13, %o6
	stb	%l1,	[%l7 + %o6]
	nop
	set	0x3C, %l1
	lduw	[%l7 + %l1],	%o1
	ld	[%l7 + 0x18],	%f16
	nop
	set	0x6C, %l2
	stb	%i3,	[%l7 + %l2]
	fpadd32	%f4,	%f14,	%f20
	nop
	set	0x70, %o0
	std	%f0,	[%l7 + %o0]
	nop
	set	0x13, %i6
	stb	%l0,	[%l7 + %i6]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x81,	%o2,	%o4
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x81,	 1
	nop
	set	0x54, %i4
	sth	%i6,	[%l7 + %i4]
	st	%fsr,	[%l7 + 0x10]
	and	%l2,	%g4,	%g6
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x81,	%f16
	nop
	set	0x58, %o4
	stw	%o5,	[%l7 + %o4]
	nop
	set	0x10, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x68, %g6
	stx	%i1,	[%l7 + %g6]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x88,	%i6
	nop
	set	0x6A, %i5
	ldsb	[%l7 + %i5],	%g1
	st	%f6,	[%l7 + 0x6C]
	set	0x18, %g1
	swapa	[%l7 + %g1] 0x88,	%i5
	nop
	set	0x70, %l4
	ldx	[%l7 + %l4],	%g5
	set	0x78, %i0
	stha	%i4,	[%l7 + %i0] 0x80
	set	0x50, %g4
	stwa	%i0,	[%l7 + %g4] 0xea
	membar	#Sync
	nop
	set	0x74, %g3
	sth	%o7,	[%l7 + %g3]
	st	%f26,	[%l7 + 0x18]
	set	0x74, %i7
	swapa	[%l7 + %i7] 0x80,	%l3
	nop
	set	0x6C, %g2
	ldub	[%l7 + %g2],	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%l4
	add	%i2,	%o6,	%o3
	nop
	set	0x08, %l3
	swap	[%l7 + %l3],	%g3
	set	0x78, %o7
	stxa	%g7,	[%l7 + %o7] 0x88
	nop
	set	0x76, %i3
	ldstub	[%l7 + %i3],	%l5
	nop
	set	0x38, %l0
	sth	%l1,	[%l7 + %l0]
	and	%o1,	%l0,	%i3
	nop
	set	0x59, %o3
	ldstub	[%l7 + %o3],	%o2
	set	0x18, %l6
	prefetcha	[%l7 + %l6] 0x88,	 3
	nop
	set	0x6F, %o1
	stb	%o0,	[%l7 + %o1]
	nop
	set	0x08, %g7
	lduh	[%l7 + %g7],	%i6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%g6
	nop
	set	0x11, %i1
	stb	%o5,	[%l7 + %i1]
	set	0x0C, %o6
	stwa	%i1,	[%l7 + %o6] 0x80
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%f4
	st	%f3,	[%l7 + 0x0C]
	set	0x6C, %l2
	swapa	[%l7 + %l2] 0x80,	%l6
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f6
	nop
	set	0x78, %i6
	prefetch	[%l7 + %i6],	 3
	set	0x3C, %g5
	swapa	[%l7 + %g5] 0x81,	%g4
	set	0x48, %o0
	sta	%f4,	[%l7 + %o0] 0x80
	and	%g1,	%g5,	%i4
	ld	[%l7 + 0x3C],	%f19
	fpsub32	%f12,	%f10,	%f18
	nop
	set	0x70, %i4
	lduw	[%l7 + %i4],	%i0
	nop
	set	0x18, %o4
	ldsw	[%l7 + %o4],	%o7
	set	0x2D, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l3
	st	%fsr,	[%l7 + 0x60]
	nop
	set	0x52, %i2
	ldstub	[%l7 + %i2],	%g2
	nop
	set	0x55, %g6
	ldsb	[%l7 + %g6],	%i5
	nop
	set	0x48, %i5
	prefetch	[%l7 + %i5],	 4
	set	0x48, %o5
	stxa	%i7,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x2A, %l4
	ldstub	[%l7 + %l4],	%i2
	set	0x1F, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o6
	nop
	set	0x50, %i0
	prefetch	[%l7 + %i0],	 2
	fpsub16	%f28,	%f22,	%f30
	nop
	set	0x58, %g4
	lduw	[%l7 + %g4],	%o3
	nop
	set	0x10, %g3
	lduh	[%l7 + %g3],	%g3
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x88,	%l4
	nop
	set	0x2C, %l3
	stw	%g7,	[%l7 + %l3]
	st	%fsr,	[%l7 + 0x7C]
	nop
	set	0x33, %o7
	ldstub	[%l7 + %o7],	%l5
	nop
	nop
	setx	0xF32076B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xABFE4C8C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f19,	%f19
	nop
	set	0x5C, %g2
	swap	[%l7 + %g2],	%o1
	set	0x5D, %i3
	ldstuba	[%l7 + %i3] 0x88,	%l1
	nop
	set	0x10, %l0
	swap	[%l7 + %l0],	%i3
	set	0x28, %o3
	stda	%o2,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x64, %o1
	lda	[%l7 + %o1] 0x81,	%f14
	nop
	set	0x0C, %g7
	lduh	[%l7 + %g7],	%l0
	nop
	set	0x44, %l6
	ldsb	[%l7 + %l6],	%o0
	add	%i6,	%l2,	%g6
	nop
	set	0x42, %i1
	ldstub	[%l7 + %i1],	%o4
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x80,	 2
	set	0x6B, %o6
	ldstuba	[%l7 + %o6] 0x80,	%l6
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x89,	%i0
	nop
	set	0x58, %l5
	std	%f24,	[%l7 + %l5]
	nop
	set	0x48, %i6
	std	%g0,	[%l7 + %i6]
	nop
	set	0x70, %g5
	swap	[%l7 + %g5],	%g4
	or	%g5,	%i4,	%o7
	nop
	set	0x18, %o0
	std	%f16,	[%l7 + %o0]
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xe3,	%i0
	st	%fsr,	[%l7 + 0x30]
	set	0x78, %i4
	stda	%l2,	[%l7 + %i4] 0x89
	set	0x38, %o2
	sta	%f15,	[%l7 + %o2] 0x81
	set	0x2C, %g6
	swapa	[%l7 + %g6] 0x80,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%i2
	nop
	set	0x54, %i2
	swap	[%l7 + %i2],	%o6
	nop
	set	0x40, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x38, %i5
	ldsw	[%l7 + %i5],	%i7
	set	0x52, %g1
	ldstuba	[%l7 + %g1] 0x88,	%g3
	nop
	set	0x0C, %l4
	swap	[%l7 + %l4],	%o3
	nop
	set	0x27, %g4
	ldub	[%l7 + %g4],	%g7
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	ld	[%l7 + 0x18],	%f11
	st	%f20,	[%l7 + 0x40]
	wr	%l5,	%l4,	%clear_softint
	nop
	set	0x58, %i7
	ldub	[%l7 + %i7],	%l1
	set	0x30, %g3
	stda	%i2,	[%l7 + %g3] 0x89
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf0,	%f0
	nop
	set	0x74, %l3
	ldsw	[%l7 + %l3],	%o2
	set	0x78, %g2
	stha	%l0,	[%l7 + %g2] 0x80
	nop
	set	0x50, %i3
	std	%o0,	[%l7 + %i3]
	nop
	set	0x20, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xd2
	nop
	set	0x7C, %g7
	sth	%i6,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x08]
	set	0x7C, %l6
	stwa	%l2,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x74, %o1
	prefetch	[%l7 + %o1],	 2
	or	%g6,	%o4,	%o5
	nop
	set	0x68, %i1
	swap	[%l7 + %i1],	%o1
	set	0x08, %o6
	stxa	%i1,	[%l7 + %o6] 0xeb
	membar	#Sync
	nop
	set	0x10, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x68, %l5
	stx	%g1,	[%l7 + %l5]
	set	0x46, %l1
	stha	%g4,	[%l7 + %l1] 0xeb
	membar	#Sync
	nop
	set	0x24, %i6
	lduh	[%l7 + %i6],	%g5
	set	0x58, %o0
	lda	[%l7 + %o0] 0x89,	%f9
	st	%fsr,	[%l7 + 0x5C]
	nop
	set	0x11, %o4
	ldsb	[%l7 + %o4],	%i4
	nop
	set	0x70, %g5
	prefetch	[%l7 + %g5],	 1
	nop
	set	0x6C, %o2
	ldsw	[%l7 + %o2],	%o7
	ld	[%l7 + 0x70],	%f26
	set	0x50, %i4
	ldda	[%l7 + %i4] 0xea,	%i0
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0xc8
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xe3,	%l2
	wr	%i5,	%g2,	%pic
	nop
	set	0x70, %i5
	std	%i2,	[%l7 + %i5]
	nop
	set	0x30, %g1
	ldd	[%l7 + %g1],	%f30
	fpsub32	%f18,	%f4,	%f14
	add	%i7,	%o6,	%o3
	nop
	set	0x70, %l4
	lduh	[%l7 + %l4],	%g3
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f0
	add	%l5,	%l4,	%l1
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xd2
	st	%f0,	[%l7 + 0x64]
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x88,	 4
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f16
	set	0x70, %o7
	stda	%i2,	[%l7 + %o7] 0x81
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xcc
	set	0x48, %g2
	stxa	%o2,	[%l7 + %g2] 0x88
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x80,	%o0
	set	0x0C, %l3
	sta	%f31,	[%l7 + %l3] 0x80
	nop
	set	0x36, %l0
	ldsh	[%l7 + %l0],	%l0
	fpadd32s	%f9,	%f6,	%f8
	bn,a	%icc,	loop_167
	nop
	set	0x2B, %o3
	ldstub	[%l7 + %o3],	%i6
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f8
	st	%f12,	[%l7 + 0x18]
loop_167:
	ld	[%l7 + 0x58],	%f15
	nop
	set	0x58, %o1
	stx	%l2,	[%l7 + %o1]
	fpadd32s	%f20,	%f0,	%f0
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f16
	nop
	set	0x7A, %i1
	ldsh	[%l7 + %i1],	%o4
	nop
	set	0x20, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x18, %l5
	std	%f10,	[%l7 + %l5]
	or	%g6,	%o5,	%i1
	set	0x08, %o6
	stxa	%o1,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x3E, %l1
	sth	%g1,	[%l7 + %l1]
	nop
	set	0x1C, %i6
	swap	[%l7 + %i6],	%g4
	nop
	set	0x08, %o4
	std	%f14,	[%l7 + %o4]
	nop
	set	0x08, %o0
	std	%i6,	[%l7 + %o0]
	set	0x6D, %g5
	stba	%i4,	[%l7 + %g5] 0x80
	nop
	set	0x48, %i4
	ldd	[%l7 + %i4],	%f8
	set	0x48, %o2
	stxa	%g5,	[%l7 + %o2] 0xe3
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i0,	%o7
	st	%f26,	[%l7 + 0x58]
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%i4
	set	0x14, %i2
	stwa	%l3,	[%l7 + %i2] 0x89
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	wr 	%g0, 	0x6, 	%fprs
	nop
	set	0x18, %l4
	stx	%fsr,	[%l7 + %l4]
	add	%o6,	%i7,	%o3
	nop
	set	0x64, %g4
	lduh	[%l7 + %g4],	%l5
	nop
	set	0x48, %i5
	std	%l4,	[%l7 + %i5]
	nop
	set	0x36, %i7
	ldstub	[%l7 + %i7],	%g3
	set	0x48, %i0
	stwa	%l1,	[%l7 + %i0] 0x88
	nop
	set	0x20, %o5
	ldsw	[%l7 + %o5],	%i3
	st	%f7,	[%l7 + 0x40]
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%o2
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%o0
	fpsub32s	%f5,	%f11,	%f29
	set	0x65, %g3
	stba	%l0,	[%l7 + %g3] 0x88
	wr	%i6,	%g7,	%sys_tick
	nop
	set	0x30, %i3
	stx	%l2,	[%l7 + %i3]
	nop
	set	0x28, %l3
	sth	%o4,	[%l7 + %l3]
	nop
	set	0x5C, %o3
	stw	%o5,	[%l7 + %o3]
	add	%i1,	%o1,	%g6
	set	0x74, %l0
	sta	%f27,	[%l7 + %l0] 0x80
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%g4
	set	0x18, %g7
	stha	%g1,	[%l7 + %g7] 0xe3
	membar	#Sync
	bne	%xcc,	loop_168
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%i4
	set	0x09, %l2
	stba	%g5,	[%l7 + %l2] 0x80
loop_168:
	nop
	set	0x3C, %l5
	swapa	[%l7 + %l5] 0x89,	%l6
	nop
	set	0x3C, %i1
	ldsw	[%l7 + %i1],	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g2
	nop
	set	0x20, %o6
	swap	[%l7 + %o6],	%o6
	nop
	nop
	setx	0xD888BC370247E33D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x368D6F413C712F36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f28
	st	%fsr,	[%l7 + 0x28]
	set	0x24, %i6
	stwa	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%o3
	nop
	set	0x37, %l1
	stb	%l5,	[%l7 + %l1]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x80,	%l4,	%l1
	nop
	set	0x10, %o4
	prefetch	[%l7 + %o4],	 0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%i3
	set	0x69, %g5
	ldstuba	[%l7 + %g5] 0x80,	%o0
	add	%l0,	%i6,	%o2
	nop
	set	0x11, %i4
	ldub	[%l7 + %i4],	%g7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l2
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f2
	and	%i1,	%o5,	%g6
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xe2,	%g4
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	ld	[%l7 + 0x1C],	%f27
	nop
	set	0x30, %i2
	stx	%fsr,	[%l7 + %i2]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf0,	%f0
	st	%fsr,	[%l7 + 0x28]
	ld	[%l7 + 0x58],	%f4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	nop
	set	0x48, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x10, %i7
	stx	%o1,	[%l7 + %i7]
	nop
	set	0x60, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x70, %o5
	std	%g0,	[%l7 + %o5]
	nop
	set	0x38, %i0
	lduw	[%l7 + %i0],	%i4
	nop
	set	0x10, %o7
	std	%f10,	[%l7 + %o7]
	ld	[%l7 + 0x74],	%f16
	set	0x5A, %g2
	stha	%l6,	[%l7 + %g2] 0x81
	set	0x31, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g5
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf9
	membar	#Sync
	nop
	set	0x68, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x1C, %o3
	lduw	[%l7 + %o3],	%i0
	nop
	set	0x58, %l0
	lduh	[%l7 + %l0],	%l3
	set	0x78, %g7
	stda	%g2,	[%l7 + %g7] 0x80
	nop
	set	0x40, %l6
	prefetch	[%l7 + %l6],	 3
	fpadd16s	%f6,	%f17,	%f4
	st	%fsr,	[%l7 + 0x58]
	set	0x4C, %o1
	stha	%o6,	[%l7 + %o1] 0xea
	membar	#Sync
	set	0x58, %l2
	stda	%i4,	[%l7 + %l2] 0xeb
	membar	#Sync
	nop
	set	0x20, %l5
	ldx	[%l7 + %l5],	%i2
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x80,	 3
	set	0x58, %o6
	stwa	%i7,	[%l7 + %o6] 0x80
	nop
	set	0x08, %i6
	ldd	[%l7 + %i6],	%l4
	st	%f30,	[%l7 + 0x34]
	set	0x38, %o4
	stda	%l4,	[%l7 + %o4] 0xe2
	membar	#Sync
	nop
	set	0x40, %l1
	std	%l0,	[%l7 + %l1]
	nop
	set	0x79, %i4
	ldsb	[%l7 + %i4],	%g3
	nop
	set	0x7F, %o2
	ldstub	[%l7 + %o2],	%i3
	nop
	set	0x24, %g5
	stw	%o0,	[%l7 + %g5]
	st	%f0,	[%l7 + 0x14]
	set	0x58, %o0
	stxa	%l0,	[%l7 + %o0] 0x80
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xc2
	add	%o2,	%i6,	%g7
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xe3,	%l2
	fpsub16	%f20,	%f12,	%f30
	set	0x70, %g1
	ldstuba	[%l7 + %g1] 0x88,	%o4
	set	0x28, %l4
	swapa	[%l7 + %l4] 0x89,	%o5
	nop
	set	0x40, %i7
	std	%i0,	[%l7 + %i7]
	st	%f30,	[%l7 + 0x64]
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x88,	%f29
	set	0x0C, %o5
	swapa	[%l7 + %o5] 0x81,	%g4
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x62, %i0
	lduh	[%l7 + %i0],	%g6
	nop
	set	0x38, %o7
	std	%o0,	[%l7 + %o7]
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f4
	nop
	set	0x68, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x40, %g3
	ldxa	[%l7 + %g3] 0x80,	%g1
	nop
	set	0x28, %i3
	ldd	[%l7 + %i3],	%f4
	st	%fsr,	[%l7 + 0x08]
	nop
	set	0x18, %l0
	std	%i4,	[%l7 + %l0]
	set	0x36, %g7
	stha	%g5,	[%l7 + %g7] 0xe2
	membar	#Sync
	set	0x4C, %o3
	sta	%f27,	[%l7 + %o3] 0x88
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%o7
	ld	[%l7 + 0x58],	%f8
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%l6
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x88
	nop
	set	0x64, %l5
	swap	[%l7 + %l5],	%i0
	nop
	set	0x78, %o6
	stb	%g2,	[%l7 + %o6]
	nop
	set	0x62, %i6
	lduh	[%l7 + %i6],	%o6
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x80,	%i4
	nop
	set	0x1F, %i1
	stb	%i2,	[%l7 + %i1]
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%l2
	set	0x48, %i4
	sta	%f21,	[%l7 + %i4] 0x89
	nop
	set	0x74, %o2
	lduw	[%l7 + %o2],	%i7
	nop
	set	0x10, %o0
	ldx	[%l7 + %o0],	%l5
	nop
	set	0x78, %g6
	swap	[%l7 + %g6],	%o3
	nop
	set	0x3D, %i2
	ldub	[%l7 + %i2],	%l1
	nop
	set	0x22, %g5
	sth	%g3,	[%l7 + %g5]
	nop
	set	0x48, %l4
	ldx	[%l7 + %l4],	%i3
	nop
	set	0x54, %i7
	ldsh	[%l7 + %i7],	%o0
	fpadd16s	%f16,	%f13,	%f14
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xda,	%f0
	nop
	set	0x28, %g4
	stx	%l0,	[%l7 + %g4]
	nop
	set	0x78, %o5
	swap	[%l7 + %o5],	%l4
	set	0x38, %i0
	stha	%i6,	[%l7 + %i0] 0xeb
	membar	#Sync
	nop
	set	0x28, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x30, %g2
	ldxa	[%l7 + %g2] 0x80,	%g7
	set	0x60, %l3
	ldda	[%l7 + %l3] 0xe2,	%l2
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x50, %g3
	std	%f20,	[%l7 + %g3]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0xf1
	membar	#Sync
	fpsub32	%f16,	%f16,	%f30
	nop
	set	0x48, %l0
	ldsh	[%l7 + %l0],	%o4
	set	0x12, %i3
	ldstuba	[%l7 + %i3] 0x88,	%o2
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%i1
	nop
	set	0x40, %o1
	ldstub	[%l7 + %o1],	%o5
	st	%f4,	[%l7 + 0x18]
	nop
	set	0x76, %l6
	ldsh	[%l7 + %l6],	%g4
	bge,a,pt	%icc,	loop_169
	nop
	nop
	setx	0xC72C75EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xAB65A26F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f0,	%f4
	add	%g6,	%g1,	%i4
	wr	%g5,	%o1,	%ccr
loop_169:
	nop
	set	0x60, %l2
	stha	%o7,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xea,	%i0
	nop
	set	0x28, %o6
	std	%f4,	[%l7 + %o6]
	set	0x24, %o3
	swapa	[%l7 + %o3] 0x80,	%l6
	set	0x08, %o4
	stxa	%g2,	[%l7 + %o4] 0xeb
	membar	#Sync
	and	%o6,	%i2,	%i5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x81,	%f16
	set	0x7C, %i1
	swapa	[%l7 + %i1] 0x89,	%l3
	nop
	set	0x1C, %i4
	prefetch	[%l7 + %i4],	 1
	nop
	set	0x08, %o2
	std	%f0,	[%l7 + %o2]
	nop
	set	0x28, %o0
	ldd	[%l7 + %o0],	%l4
	set	0x54, %l1
	swapa	[%l7 + %l1] 0x80,	%i7
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x88,	 2
	or	%g3,	%o3,	%i3
	nop
	set	0x58, %i2
	swap	[%l7 + %i2],	%o0
	nop
	set	0x30, %l4
	ldx	[%l7 + %l4],	%l0
	nop
	set	0x1C, %i7
	ldsw	[%l7 + %i7],	%i6
	set	0x0E, %g5
	stha	%l4,	[%l7 + %g5] 0x81
	ld	[%l7 + 0x2C],	%f15
	nop
	set	0x20, %g4
	stx	%l2,	[%l7 + %g4]
	nop
	set	0x50, %g1
	prefetch	[%l7 + %g1],	 1
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf8
	membar	#Sync
	set	0x70, %o5
	stwa	%o4,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%o2
	nop
	set	0x7C, %g2
	lduh	[%l7 + %g2],	%i1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xd8,	%f16
	nop
	nop
	setx	0x8A753E92020389BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x66E3B76E567E9E70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f28,	%f18
	set	0x57, %g3
	stba	%o5,	[%l7 + %g3] 0xe2
	membar	#Sync
	set	0x60, %l3
	stxa	%g4,	[%l7 + %l3] 0x88
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f20
	or	%g6,	%g1,	%i4
	st	%f22,	[%l7 + 0x30]
	nop
	set	0x08, %i3
	ldx	[%l7 + %i3],	%g5
	nop
	set	0x2C, %l0
	sth	%o7,	[%l7 + %l0]
	bn,a,pt	%icc,	loop_170
	or	%i0,	%o1,	%g2
	nop
	set	0x42, %g7
	ldub	[%l7 + %g7],	%o6
	nop
	set	0x20, %l6
	stx	%i2,	[%l7 + %l6]
loop_170:
	nop
	set	0x58, %l2
	stda	%i4,	[%l7 + %l2] 0x81
	nop
	set	0x16, %o1
	sth	%l3,	[%l7 + %o1]
	nop
	set	0x75, %o6
	ldstub	[%l7 + %o6],	%l5
	nop
	set	0x58, %l5
	std	%f26,	[%l7 + %l5]
	nop
	set	0x50, %o3
	sth	%l6,	[%l7 + %o3]
	set	0x60, %o4
	lda	[%l7 + %o4] 0x89,	%f26
	st	%f5,	[%l7 + 0x7C]
	nop
	set	0x48, %i1
	sth	%i7,	[%l7 + %i1]
	nop
	set	0x7C, %i6
	ldsb	[%l7 + %i6],	%g3
	wr	%o3,	%l1,	%softint
	nop
	set	0x6A, %i4
	stb	%o0,	[%l7 + %i4]
	nop
	set	0x3B, %o0
	ldsb	[%l7 + %o0],	%i3
	nop
	set	0x78, %l1
	std	%f6,	[%l7 + %l1]
	set	0x1C, %o2
	swapa	[%l7 + %o2] 0x89,	%i6
	set	0x22, %i2
	stha	%l0,	[%l7 + %i2] 0x80
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x88
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x88,	 0
	nop
	set	0x28, %g5
	prefetch	[%l7 + %g5],	 1
	set	0x10, %l4
	stha	%l4,	[%l7 + %l4] 0x81
	st	%f6,	[%l7 + 0x1C]
	nop
	set	0x41, %g4
	ldub	[%l7 + %g4],	%g7
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc2
	nop
	set	0x0F, %g1
	stb	%o2,	[%l7 + %g1]
	set	0x54, %o5
	sta	%f14,	[%l7 + %o5] 0x88
	nop
	nop
	setx	0xD00EBBBC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x9221D8FE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f26,	%f9
	nop
	set	0x46, %o7
	sth	%o4,	[%l7 + %o7]
	ld	[%l7 + 0x4C],	%f21
	and	%o5,	%g4,	%g6
	fpadd32s	%f3,	%f6,	%f4
	st	%f26,	[%l7 + 0x60]
	add	%g1,	%i1,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%o7
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xd0
	nop
	set	0x10, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	set	0x10, %i3
	lduw	[%l7 + %i3],	%i0
	set	0x1C, %l3
	sta	%f10,	[%l7 + %l3] 0x81
	nop
	set	0x60, %l0
	std	%o6,	[%l7 + %l0]
	nop
	set	0x08, %g7
	std	%i2,	[%l7 + %g7]
	set	0x60, %l6
	stwa	%g2,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x20, %l2
	stxa	%i5,	[%l7 + %l2] 0xe2
	membar	#Sync
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf9
	membar	#Sync
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%l5
	nop
	set	0x7C, %o1
	prefetch	[%l7 + %o1],	 1
	nop
	set	0x4C, %o4
	stw	%l6,	[%l7 + %o4]
	ble,pn	%icc,	loop_171
	nop
	set	0x31, %i1
	ldub	[%l7 + %i1],	%l3
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%i7
	set	0x68, %o3
	ldxa	[%l7 + %o3] 0x89,	%g3
loop_171:
	nop
	set	0x18, %i4
	stb	%l1,	[%l7 + %i4]
	nop
	set	0x38, %o0
	ldsw	[%l7 + %o0],	%o3
	or	%i3,	%o0,	%i6
	nop
	set	0x60, %o2
	stw	%l2,	[%l7 + %o2]
	st	%fsr,	[%l7 + 0x68]
	nop
	set	0x1D, %i2
	ldsb	[%l7 + %i2],	%l0
	set	0x18, %g6
	stha	%g7,	[%l7 + %g6] 0x81
	wr	%o2,	%o4,	%pic
	and	%l4,	%o5,	%g6
	nop
	set	0x1C, %i7
	stw	%g1,	[%l7 + %i7]
	and	%g4,	%i4,	%g5
	set	0x60, %g5
	stxa	%i1,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x3F, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o7
	set	0x38, %g4
	sta	%f14,	[%l7 + %g4] 0x80
	nop
	set	0x49, %i0
	ldstub	[%l7 + %i0],	%i0
	nop
	set	0x72, %g1
	ldstub	[%l7 + %g1],	%o1
	set	0x18, %o5
	stha	%o6,	[%l7 + %o5] 0x81
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x80,	%g2
	nop
	set	0x40, %o7
	std	%i2,	[%l7 + %o7]
	nop
	set	0x76, %g2
	ldstub	[%l7 + %g2],	%i5
	set	0x38, %i5
	stwa	%l6,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x40, %i3
	ldsh	[%l7 + %i3],	%l3
	nop
	set	0x50, %g3
	stx	%i7,	[%l7 + %g3]
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x2A, %g7
	stba	%g3,	[%l7 + %g7] 0x89
	st	%f19,	[%l7 + 0x48]
	nop
	set	0x6C, %l0
	sth	%l1,	[%l7 + %l0]
	nop
	set	0x34, %l6
	ldsw	[%l7 + %l6],	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x81,	%l5,	%o0
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%i6
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x64, %l5
	stw	%i3,	[%l7 + %l5]
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%l2
	nop
	set	0x3E, %o4
	ldsh	[%l7 + %o4],	%g7
	nop
	set	0x48, %o1
	ldsh	[%l7 + %o1],	%l0
	or	%o4,	%o2,	%o5
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x88,	%g6
	set	0x40, %o3
	ldda	[%l7 + %o3] 0xda,	%f0
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf8,	%f0
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%l4
	nop
	set	0x52, %o2
	ldsh	[%l7 + %o2],	%g1
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f18
	set	0x74, %g6
	stha	%i4,	[%l7 + %g6] 0x89
	ld	[%l7 + 0x0C],	%f7
	bl,a,pt	%xcc,	loop_172
	nop
	set	0x58, %i2
	lduw	[%l7 + %i2],	%g4
	set	0x58, %g5
	swapa	[%l7 + %g5] 0x80,	%g5
loop_172:
	nop
	set	0x0E, %i7
	sth	%i1,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x44]
	nop
	set	0x58, %l4
	sth	%o7,	[%l7 + %l4]
	or	%i0,	%o6,	%o1
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f0
	nop
	set	0x18, %g1
	sth	%i2,	[%l7 + %g1]
	fpsub32s	%f15,	%f2,	%f27
	set	0x56, %g4
	stba	%i5,	[%l7 + %g4] 0x80
	set	0x78, %l1
	swapa	[%l7 + %l1] 0x81,	%l6
	nop
	set	0x35, %o5
	ldsb	[%l7 + %o5],	%g2
	nop
	set	0x48, %o7
	std	%l2,	[%l7 + %o7]
	nop
	set	0x40, %g2
	stx	%i7,	[%l7 + %g2]
	set	0x1D, %i3
	stba	%g3,	[%l7 + %i3] 0xeb
	membar	#Sync
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0xda
	ld	[%l7 + 0x64],	%f15
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x80,	%o3
	st	%fsr,	[%l7 + 0x70]
	set	0x50, %l3
	stxa	%l5,	[%l7 + %l3] 0xeb
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x88,	%f0
	nop
	set	0x4C, %l6
	ldstub	[%l7 + %l6],	%o0
	set	0x48, %l0
	stda	%l0,	[%l7 + %l0] 0x89
	set	0x6C, %l5
	stwa	%i6,	[%l7 + %l5] 0xe2
	membar	#Sync
	nop
	set	0x50, %o6
	lduh	[%l7 + %o6],	%l2
	set	0x3D, %o4
	ldstuba	[%l7 + %o4] 0x81,	%i3
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f10
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%o4
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%l0
	set	0x28, %o1
	stwa	%o2,	[%l7 + %o1] 0x80
	st	%f22,	[%l7 + 0x1C]
	nop
	set	0x40, %i1
	std	%f28,	[%l7 + %i1]
	and	%o5,	%l4,	%g6
	nop
	set	0x68, %i4
	std	%i4,	[%l7 + %i4]
	nop
	set	0x30, %o2
	std	%g4,	[%l7 + %o2]
	set	0x4C, %o0
	stha	%g1,	[%l7 + %o0] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x6C]
	wr	%g5,	%o7,	%softint
	nop
	set	0x38, %o3
	std	%f14,	[%l7 + %o3]
	set	0x34, %i2
	sta	%f21,	[%l7 + %i2] 0x89
	ld	[%l7 + 0x50],	%f24
	ld	[%l7 + 0x40],	%f18
	set	0x6C, %g5
	stha	%i0,	[%l7 + %g5] 0x88
	nop
	set	0x25, %i7
	ldstub	[%l7 + %i7],	%o6
	and	%o1,	%i2,	%i1
	set	0x40, %g6
	swapa	[%l7 + %g6] 0x88,	%l6
	nop
	set	0x20, %i0
	ldsb	[%l7 + %i0],	%g2
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xc8
	nop
	set	0x1A, %l4
	ldub	[%l7 + %l4],	%l3
	set	0x50, %l1
	stxa	%i7,	[%l7 + %l1] 0x88
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%f20
	set	0x28, %o5
	stwa	%i5,	[%l7 + %o5] 0x89
	nop
	set	0x5E, %o7
	lduh	[%l7 + %o7],	%g3
	set	0x20, %g2
	swapa	[%l7 + %g2] 0x80,	%l5
	set	0x10, %g3
	sta	%f23,	[%l7 + %g3] 0x88
	nop
	set	0x14, %i3
	lduw	[%l7 + %i3],	%o0
	set	0x48, %i5
	sta	%f8,	[%l7 + %i5] 0x89
	set	0x3A, %g7
	stha	%l1,	[%l7 + %g7] 0x88
	st	%fsr,	[%l7 + 0x20]
	set	0x30, %l3
	stha	%i6,	[%l7 + %l3] 0x88
	set	0x61, %l6
	stba	%l2,	[%l7 + %l6] 0x80
	nop
	set	0x40, %l0
	stx	%fsr,	[%l7 + %l0]
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x4D, %l5
	ldstub	[%l7 + %l5],	%i3
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x81
	st	%f8,	[%l7 + 0x1C]
	nop
	set	0x36, %l2
	ldsh	[%l7 + %l2],	%g7
	fpadd16	%f0,	%f14,	%f26
	wr	%o3,	%o4,	%clear_softint
	nop
	set	0x3E, %o6
	sth	%l0,	[%l7 + %o6]
	nop
	set	0x58, %o1
	std	%o2,	[%l7 + %o1]
	add	%o5,	%l4,	%i4
	set	0x74, %i6
	sta	%f21,	[%l7 + %i6] 0x80
	nop
	set	0x2C, %i1
	stb	%g6,	[%l7 + %i1]
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x81,	%g4
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%f12
	be,a	%icc,	loop_173
	nop
	nop
	setx	0xE836D572FB574980,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5AF50780870DE014,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f6,	%f28
	nop
	set	0x0E, %i4
	ldsh	[%l7 + %i4],	%g5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i0
loop_173:
	nop
	set	0x1E, %o3
	stha	%g1,	[%l7 + %o3] 0x89
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%o0
	set	0x18, %g5
	lda	[%l7 + %g5] 0x88,	%f12
	set	0x70, %i7
	ldda	[%l7 + %i7] 0xea,	%i2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l6
	nop
	set	0x10, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x80,	%i0
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%f20
	nop
	set	0x60, %l1
	ldx	[%l7 + %l1],	%l3
	fpsub16	%f12,	%f20,	%f8
	nop
	set	0x40, %g1
	std	%i6,	[%l7 + %g1]
	nop
	set	0x40, %o5
	prefetch	[%l7 + %o5],	 4
	nop
	set	0x20, %o7
	stx	%i5,	[%l7 + %o7]
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	nop
	set	0x3F, %g2
	ldub	[%l7 + %g2],	%g3
	nop
	set	0x18, %g3
	std	%g2,	[%l7 + %g3]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xeb,	%o0
	nop
	set	0x18, %i3
	stx	%l5,	[%l7 + %i3]
	wr 	%g0, 	0x7, 	%fprs
	set	0x48, %g7
	stxa	%i6,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x7C, %l3
	lduw	[%l7 + %l3],	%g7
	nop
	set	0x08, %l6
	std	%f0,	[%l7 + %l6]
	nop
	set	0x70, %l0
	std	%i2,	[%l7 + %l0]
	and	%o3,	%l0,	%o4
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x81,	 1
	nop
	set	0x67, %l2
	ldsb	[%l7 + %l2],	%l4
	ld	[%l7 + 0x40],	%f27
	nop
	set	0x18, %o4
	lduw	[%l7 + %o4],	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%i4
	nop
	set	0x47, %o1
	ldsb	[%l7 + %o1],	%g4
	st	%fsr,	[%l7 + 0x24]
	set	0x54, %i6
	lda	[%l7 + %i6] 0x88,	%f29
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f20
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x88,	%g4
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xeb,	%i0
	set	0x15, %o0
	stba	%g1,	[%l7 + %o0] 0xeb
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f0
	st	%fsr,	[%l7 + 0x78]
	set	0x50, %o3
	swapa	[%l7 + %o3] 0x88,	%o1
	set	0x30, %i2
	ldda	[%l7 + %i2] 0xeb,	%i2
	set	0x33, %i7
	stba	%o7,	[%l7 + %i7] 0x89
	nop
	set	0x74, %g5
	ldsw	[%l7 + %g5],	%o6
	wr	%l6,	%l3,	%softint
	nop
	set	0x58, %g6
	prefetch	[%l7 + %g6],	 2
	nop
	set	0x57, %i0
	ldub	[%l7 + %i0],	%i7
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x89,	%i5
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f26
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%i1
	fpadd32s	%f26,	%f10,	%f1
	or	%g2,	%g3,	%l5
	add	%l1,	%o0,	%l2
	nop
	set	0x7F, %o5
	stb	%i6,	[%l7 + %o5]
	nop
	set	0x3C, %g4
	prefetch	[%l7 + %g4],	 1
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x88,	%i2
	set	0x20, %o7
	ldda	[%l7 + %o7] 0xe2,	%o2
	nop
	set	0x32, %g3
	stb	%l0,	[%l7 + %g3]
	wr	%o4,	%o5,	%y
	set	0x59, %i3
	ldstuba	[%l7 + %i3] 0x81,	%l4
	nop
	set	0x30, %g7
	std	%f8,	[%l7 + %g7]
	wr	%o2,	%g7,	%sys_tick
	and	%i4,	%g4,	%g6
	fpsub16	%f14,	%f2,	%f30
	set	0x66, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i0
	set	0x08, %l6
	stxa	%g5,	[%l7 + %l6] 0x89
	nop
	set	0x18, %l3
	lduw	[%l7 + %l3],	%o1
	nop
	set	0x18, %l0
	std	%f12,	[%l7 + %l0]
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x81,	%i2
	nop
	set	0x68, %o4
	ldsw	[%l7 + %o4],	%g1
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%f12
	nop
	set	0x76, %i6
	sth	%o6,	[%l7 + %i6]
	nop
	set	0x48, %i1
	stb	%o7,	[%l7 + %i1]
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%l6
	nop
	set	0x34, %o6
	lduw	[%l7 + %o6],	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x89,	%i5,	%i1
	set	0x40, %o2
	stda	%i6,	[%l7 + %o2] 0x81
	nop
	set	0x78, %o0
	stw	%g3,	[%l7 + %o0]
	set	0x24, %o3
	sta	%f6,	[%l7 + %o3] 0x81
	set	0x50, %i2
	lda	[%l7 + %i2] 0x88,	%f27
	nop
	set	0x5C, %i7
	stw	%l5,	[%l7 + %i7]
	nop
	set	0x49, %i4
	ldsb	[%l7 + %i4],	%l1
	nop
	set	0x6A, %g5
	stb	%o0,	[%l7 + %g5]
	nop
	set	0x30, %g6
	lduw	[%l7 + %g6],	%g2
	set	0x20, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0
	nop
	set	0x58, %i0
	stw	%i6,	[%l7 + %i0]
	nop
	set	0x70, %l4
	lduw	[%l7 + %l4],	%o3
	set	0x3E, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i3
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%o4
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x0C, %g4
	ldsw	[%l7 + %g4],	%o5
	set	0x18, %g3
	swapa	[%l7 + %g3] 0x80,	%l0
	nop
	set	0x37, %i3
	ldsb	[%l7 + %i3],	%o2
	ld	[%l7 + 0x4C],	%f12
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g7,	%l4
	set	0x20, %g7
	ldxa	[%l7 + %g7] 0x89,	%i4
	or	%g4,	%g6,	%g5
	st	%f2,	[%l7 + 0x0C]
	set	0x18, %o7
	stwa	%i0,	[%l7 + %o7] 0xe3
	membar	#Sync
	set	0x2C, %i5
	sta	%f14,	[%l7 + %i5] 0x81
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x81,	%o1
	set	0x30, %l6
	stda	%i2,	[%l7 + %l6] 0xe3
	membar	#Sync
	set	0x24, %l5
	sta	%f26,	[%l7 + %l5] 0x89
	set	0x58, %l0
	lda	[%l7 + %l0] 0x80,	%f15
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%g1
	or	%o7,	%l3,	%l6
	nop
	set	0x68, %o4
	lduh	[%l7 + %o4],	%i1
	ld	[%l7 + 0x44],	%f22
	st	%fsr,	[%l7 + 0x54]
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i5,	%g3
	nop
	set	0x5A, %i6
	ldstub	[%l7 + %i6],	%l5
	nop
	set	0x08, %o1
	swap	[%l7 + %o1],	%i7
	and	%o0,	%g2,	%l2
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x80,	%i6
	set	0x18, %o6
	sta	%f23,	[%l7 + %o6] 0x81
	set	0x10, %o0
	stxa	%o3,	[%l7 + %o0] 0x80
	set	0x77, %o2
	stba	%i3,	[%l7 + %o2] 0x89
	fpadd16s	%f12,	%f23,	%f29
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%o4
	st	%f9,	[%l7 + 0x10]
	nop
	set	0x22, %o3
	ldsh	[%l7 + %o3],	%o5
	nop
	set	0x60, %i7
	ldx	[%l7 + %i7],	%l0
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xda,	%f16
	bleu,pt	%icc,	loop_174
	nop
	set	0x14, %g5
	swap	[%l7 + %g5],	%o2
	wr	%l4,	%i4,	%y
	nop
	set	0x18, %g6
	std	%g6,	[%l7 + %g6]
loop_174:
	nop
	set	0x43, %i2
	ldstub	[%l7 + %i2],	%g4
	st	%f4,	[%l7 + 0x50]
	wr 	%g0, 	0x7, 	%fprs
	nop
	set	0x78, %i0
	ldx	[%l7 + %i0],	%o1
	nop
	set	0x28, %l4
	std	%f30,	[%l7 + %l4]
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%i0
	set	0x4B, %o5
	stba	%i2,	[%l7 + %o5] 0x88
	and	%o6,	%g1,	%l3
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%l6
	nop
	set	0x10, %g4
	prefetch	[%l7 + %g4],	 3
	nop
	set	0x54, %g2
	stw	%o7,	[%l7 + %g2]
	nop
	set	0x14, %i3
	ldsh	[%l7 + %i3],	%i1
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%g3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%i7
	st	%f16,	[%l7 + 0x28]
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f4
	set	0x50, %g3
	stha	%l5,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x58, %l3
	std	%g2,	[%l7 + %l3]
	nop
	set	0x18, %l6
	stx	%fsr,	[%l7 + %l6]
	fpsub16s	%f14,	%f22,	%f4
	nop
	set	0x48, %l5
	std	%o0,	[%l7 + %l5]
	or	%i6,	%o3,	%l2
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f8
	nop
	set	0x68, %o4
	lduw	[%l7 + %o4],	%l1
	set	0x08, %l0
	prefetcha	[%l7 + %l0] 0x80,	 0
	set	0x70, %l2
	prefetcha	[%l7 + %l2] 0x80,	 4
	set	0x39, %i6
	stba	%o5,	[%l7 + %i6] 0x88
	nop
	set	0x48, %i1
	prefetch	[%l7 + %i1],	 0
	nop
	set	0x66, %o1
	stb	%o2,	[%l7 + %o1]
	nop
	set	0x2E, %o6
	sth	%l0,	[%l7 + %o6]
	nop
	set	0x61, %o0
	ldstub	[%l7 + %o0],	%i4
	nop
	set	0x6C, %o2
	prefetch	[%l7 + %o2],	 4
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x78, %i7
	stx	%fsr,	[%l7 + %i7]
	st	%fsr,	[%l7 + 0x28]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x602, 	%sys_tick_cmpr
	set	0x68, %i4
	stwa	%g6,	[%l7 + %i4] 0x80
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f10
	set	0x70, %g6
	ldda	[%l7 + %g6] 0x89,	%l4
	nop
	set	0x28, %g5
	ldsb	[%l7 + %g5],	%o1
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x89,	%i0
	nop
	set	0x68, %i2
	stx	%fsr,	[%l7 + %i2]
	nop
	set	0x70, %l4
	stx	%i2,	[%l7 + %l4]
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf8,	%f16
	nop
	set	0x78, %o5
	std	%f18,	[%l7 + %o5]
	set	0x60, %l1
	ldstuba	[%l7 + %l1] 0x89,	%o6
	set	0x20, %g4
	stxa	%g1,	[%l7 + %g4] 0x88
	set	0x58, %i3
	stwa	%g5,	[%l7 + %i3] 0x89
	set	0x1C, %g2
	stba	%l6,	[%l7 + %g2] 0x89
	set	0x1E, %o7
	stba	%o7,	[%l7 + %o7] 0x88
	or	%l3,	%i1,	%g3
	add	%i7,	%l5,	%g2
	set	0x7C, %g7
	lda	[%l7 + %g7] 0x80,	%f28
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%i5
	nop
	set	0x30, %l3
	ldx	[%l7 + %l3],	%o3
	nop
	set	0x60, %l6
	stx	%l2,	[%l7 + %l6]
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%i6
	set	0x45, %g3
	ldstuba	[%l7 + %g3] 0x81,	%o4
	or	%i3,	%l1,	%o2
	set	0x50, %i5
	stwa	%o5,	[%l7 + %i5] 0xe3
	membar	#Sync
	set	0x50, %o4
	stda	%i4,	[%l7 + %o4] 0xea
	membar	#Sync
	ld	[%l7 + 0x58],	%f15
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l0,	%g7
	nop
	set	0x1C, %l2
	sth	%g6,	[%l7 + %l2]
	nop
	set	0x0C, %l0
	ldstub	[%l7 + %l0],	%g4
	nop
	set	0x25, %i6
	ldub	[%l7 + %i6],	%o1
	st	%f1,	[%l7 + 0x24]
	set	0x5A, %o1
	stba	%l4,	[%l7 + %o1] 0xe3
	membar	#Sync
	nop
	set	0x67, %i1
	ldsb	[%l7 + %i1],	%i2
	nop
	set	0x70, %o6
	ldx	[%l7 + %o6],	%i0
	set	0x50, %o2
	stda	%o6,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x37, %i7
	stb	%g1,	[%l7 + %i7]
	set	0x10, %i4
	stxa	%l6,	[%l7 + %i4] 0xe2
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xe3,	%g4
	set	0x28, %g6
	stwa	%o7,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%l3
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x80,	 1
	nop
	set	0x38, %g5
	lduh	[%l7 + %g5],	%i7
	set	0x30, %l4
	ldda	[%l7 + %l4] 0xe2,	%l4
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%f26
	nop
	set	0x7A, %g1
	ldsb	[%l7 + %g1],	%i1
	set	0x60, %o5
	stba	%o0,	[%l7 + %o5] 0xe2
	membar	#Sync
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf0
	membar	#Sync
	nop
	set	0x78, %i3
	std	%g2,	[%l7 + %i3]
	nop
	set	0x20, %g2
	lduh	[%l7 + %g2],	%o3
	st	%fsr,	[%l7 + 0x30]
	be,pn	%xcc,	loop_175
	bge	%xcc,	loop_176
	bl,a	%icc,	loop_177
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f20
loop_175:
	fpadd32	%f22,	%f14,	%f12
loop_176:
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
loop_177:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%i5
	wr	%o4,	%i6,	%softint
	and	%i3,	%o2,	%l1
	nop
	set	0x6F, %o7
	ldstub	[%l7 + %o7],	%i4
	nop
	set	0x19, %l3
	ldsb	[%l7 + %l3],	%l0
	nop
	set	0x28, %l6
	std	%o4,	[%l7 + %l6]
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x81,	%g7
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x89,	 0
	set	0x34, %o4
	stwa	%g4,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x64, %l2
	swapa	[%l7 + %l2] 0x81,	%o1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xea,	%l4
	nop
	set	0x68, %l0
	std	%i2,	[%l7 + %l0]
	nop
	set	0x08, %o1
	std	%f20,	[%l7 + %o1]
	set	0x20, %i6
	lda	[%l7 + %i6] 0x89,	%f3
	set	0x60, %o6
	lda	[%l7 + %o6] 0x81,	%f23
	set	0x2C, %o2
	lda	[%l7 + %o2] 0x89,	%f24
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%o6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%i0
	add	%l6,	%g5,	%o7
	and	%g3,	%l3,	%i7
	nop
	set	0x50, %i7
	std	%l4,	[%l7 + %i7]
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x89,	%o0
	st	%f0,	[%l7 + 0x34]
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xca
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i1
	nop
	set	0x36, %o3
	ldub	[%l7 + %o3],	%o3
	ble,pt	%icc,	loop_178
	nop
	set	0x28, %i0
	stx	%l2,	[%l7 + %i0]
	nop
	set	0x0F, %i4
	stb	%o4,	[%l7 + %i4]
	nop
	set	0x52, %g5
	ldsh	[%l7 + %g5],	%i6
loop_178:
	ld	[%l7 + 0x34],	%f10
	nop
	set	0x15, %i2
	ldub	[%l7 + %i2],	%i3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%l1
	set	0x20, %g1
	sta	%f19,	[%l7 + %g1] 0x88
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x89,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%o5
	set	0x69, %g4
	stba	%i4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	nop
	setx	0x093C153C4608F00B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x7DDAEBBD7EBEC56F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f28,	%f22
	nop
	set	0x62, %l4
	sth	%g6,	[%l7 + %l4]
	set	0x14, %i3
	stwa	%g4,	[%l7 + %i3] 0x88
	set	0x28, %g2
	stxa	%g7,	[%l7 + %g2] 0xeb
	membar	#Sync
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xc2
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i2
	bgu,pn	%icc,	loop_179
	nop
	set	0x0C, %g7
	lduh	[%l7 + %g7],	%o6
	set	0x28, %l3
	stwa	%g1,	[%l7 + %l3] 0xe3
	membar	#Sync
loop_179:
	nop
	set	0x5C, %l6
	ldstub	[%l7 + %l6],	%o1
	set	0x68, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0
	set	0x64, %g3
	stwa	%l6,	[%l7 + %g3] 0x80
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x80,	%o7
	and	%g3,	%l3,	%g5
	set	0x20, %o4
	ldda	[%l7 + %o4] 0x88,	%i6
	set	0x64, %i5
	swapa	[%l7 + %i5] 0x88,	%l5
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x81,	%g2
	nop
	set	0x3C, %l0
	prefetch	[%l7 + %l0],	 4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i1,	%o0
	nop
	set	0x70, %i6
	lduh	[%l7 + %i6],	%l2
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	wr	%o3,	%i6,	%softint
	bg,pn	%icc,	loop_180
	nop
	set	0x70, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x0A, %i1
	stb	%i3,	[%l7 + %i1]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%l1
loop_180:
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%i4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x80,	%o2,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%g6
	set	0x56, %i7
	stha	%i4,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%g6
	bleu,a	%xcc,	loop_181
	nop
	set	0x0E, %o3
	ldsh	[%l7 + %o3],	%g4
	wr	%i2,	%o6,	%ccr
	nop
	set	0x4C, %i0
	stw	%g1,	[%l7 + %i0]
loop_181:
	fpsub16	%f10,	%f16,	%f10
	set	0x5A, %o0
	stba	%o1,	[%l7 + %o0] 0xe2
	membar	#Sync
	or	%l4,	%i0,	%l6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f16
	nop
	set	0x72, %i4
	lduh	[%l7 + %i4],	%o7
	nop
	set	0x18, %g1
	lduw	[%l7 + %g1],	%g3
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xca
	nop
	set	0x1C, %g4
	ldsh	[%l7 + %g4],	%l3
	set	0x43, %i2
	ldstuba	[%l7 + %i2] 0x80,	%i7
	set	0x70, %l4
	stwa	%g5,	[%l7 + %l4] 0x88
	nop
	set	0x2F, %g2
	stb	%l5,	[%l7 + %g2]
	nop
	set	0x20, %i3
	swap	[%l7 + %i3],	%i1
	set	0x72, %g7
	stba	%g2,	[%l7 + %g7] 0xea
	membar	#Sync
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l2,	%o3
	set	0x38, %l1
	stwa	%i6,	[%l7 + %l1] 0x81
	nop
	set	0x6C, %l3
	swap	[%l7 + %l3],	%o0
	set	0x28, %l6
	sta	%f7,	[%l7 + %l6] 0x88
	nop
	set	0x08, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x4D, %o7
	stba	%o4,	[%l7 + %o7] 0x88
	set	0x34, %o4
	sta	%f19,	[%l7 + %o4] 0x89
	or	%l1,	%i3,	%o2
	nop
	set	0x12, %g3
	ldub	[%l7 + %g3],	%i5
	wr	%l0,	%g6,	%y
	ld	[%l7 + 0x68],	%f10
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x88,	%i4
	set	0x30, %l0
	stda	%g6,	[%l7 + %l0] 0x89
	nop
	set	0x6A, %i6
	ldsb	[%l7 + %i6],	%o5
	nop
	set	0x50, %i5
	stx	%i2,	[%l7 + %i5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x299, 	%tick_cmpr
	nop
	set	0x4B, %o1
	stb	%o1,	[%l7 + %o1]
	set	0x38, %o6
	stda	%o6,	[%l7 + %o6] 0x89
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i0,	%l6
	set	0x40, %o2
	sta	%f20,	[%l7 + %o2] 0x81
	nop
	set	0x5C, %i1
	swap	[%l7 + %i1],	%o7
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f28
	set	0x6A, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l4
	set	0x5F, %o3
	stba	%g3,	[%l7 + %o3] 0x81
	and	%i7,	%g5,	%l5
	nop
	set	0x77, %o0
	ldsb	[%l7 + %o0],	%i1
	set	0x38, %g5
	ldxa	[%l7 + %g5] 0x81,	%l3
	st	%fsr,	[%l7 + 0x18]
	nop
	set	0x36, %i4
	ldsh	[%l7 + %i4],	%l2
	bleu,pt	%icc,	loop_182
	nop
	set	0x7B, %i0
	stb	%g2,	[%l7 + %i0]
	st	%f14,	[%l7 + 0x48]
	nop
	set	0x48, %g1
	std	%o2,	[%l7 + %g1]
loop_182:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x89
	set	0x54, %g4
	swapa	[%l7 + %g4] 0x81,	%o0
	set	0x70, %i2
	stxa	%i6,	[%l7 + %i2] 0x89
	nop
	set	0x70, %l4
	std	%o4,	[%l7 + %l4]
	set	0x22, %i3
	stba	%i3,	[%l7 + %i3] 0xea
	membar	#Sync
	add	%l1,	%o2,	%l0
	nop
	set	0x78, %g7
	lduw	[%l7 + %g7],	%i5
	set	0x78, %g2
	stwa	%i4,	[%l7 + %g2] 0x80
	nop
	set	0x38, %l1
	sth	%g6,	[%l7 + %l1]
	set	0x18, %l3
	stda	%g6,	[%l7 + %l3] 0x80
	nop
	set	0x20, %l5
	stx	%fsr,	[%l7 + %l5]
	ble	%xcc,	loop_183
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%o5
	st	%fsr,	[%l7 + 0x70]
	set	0x6F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g4
loop_183:
	ld	[%l7 + 0x0C],	%f28
	nop
	set	0x68, %o4
	stx	%g1,	[%l7 + %o4]
	nop
	set	0x6C, %l2
	ldsw	[%l7 + %l2],	%i2
	set	0x15, %g3
	stba	%o6,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x1C, %i6
	lduw	[%l7 + %i6],	%o1
	nop
	set	0x2C, %i5
	lduh	[%l7 + %i5],	%l6
	nop
	set	0x34, %l0
	prefetch	[%l7 + %l0],	 3
	set	0x32, %o6
	ldstuba	[%l7 + %o6] 0x88,	%i0
	add	%o7,	%g3,	%i7
	nop
	set	0x10, %o2
	stx	%fsr,	[%l7 + %o2]
	st	%f10,	[%l7 + 0x74]
	nop
	set	0x2E, %i1
	sth	%g5,	[%l7 + %i1]
	nop
	set	0x09, %g6
	stb	%l4,	[%l7 + %g6]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xEDA, 	%sys_tick_cmpr
	set	0x18, %o1
	stda	%l2,	[%l7 + %o1] 0xeb
	membar	#Sync
	set	0x40, %o3
	ldstuba	[%l7 + %o3] 0x81,	%l3
	set	0x70, %i7
	stxa	%g2,	[%l7 + %i7] 0xe3
	membar	#Sync
	nop
	set	0x28, %g5
	stx	%o0,	[%l7 + %g5]
	set	0x64, %i4
	lda	[%l7 + %i4] 0x88,	%f16
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x80,	 0
	nop
	set	0x4F, %i0
	ldstub	[%l7 + %i0],	%o4
	set	0x40, %o5
	ldxa	[%l7 + %o5] 0x88,	%i3
	set	0x79, %g1
	ldstuba	[%l7 + %g1] 0x81,	%i6
	set	0x20, %g4
	sta	%f27,	[%l7 + %g4] 0x80
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o2
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%i4
	set	0x74, %i2
	stwa	%i4,	[%l7 + %i2] 0xeb
	membar	#Sync
	and	%l0,	%g7,	%g6
	st	%fsr,	[%l7 + 0x40]
	st	%f26,	[%l7 + 0x5C]
	nop
	set	0x30, %g7
	swap	[%l7 + %g7],	%g4
	st	%f28,	[%l7 + 0x38]
	nop
	set	0x20, %i3
	lduh	[%l7 + %i3],	%g1
	nop
	set	0x68, %g2
	ldsh	[%l7 + %g2],	%o5
	nop
	set	0x58, %l1
	stx	%o6,	[%l7 + %l1]
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%o1
	set	0x20, %o7
	sta	%f23,	[%l7 + %o7] 0x88
	wr	%o7,	%g3,	%sys_tick
	and	%i7,	%i0,	%g5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xc8
	and	%i1,	%l5,	%l4
	nop
	set	0x23, %o4
	stb	%l3,	[%l7 + %o4]
	set	0x68, %l6
	stxa	%l2,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%f26
	set	0x38, %i6
	stda	%g2,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x60, %i5
	ldd	[%l7 + %i5],	%o0
	nop
	set	0x38, %g3
	ldsw	[%l7 + %g3],	%o4
	st	%fsr,	[%l7 + 0x60]
	set	0x30, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0
	set	0x2F, %l0
	stba	%i6,	[%l7 + %l0] 0x89
	nop
	set	0x78, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x38, %g6
	std	%l0,	[%l7 + %g6]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xd8,	%f16
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x81,	 1
	nop
	set	0x72, %i7
	sth	%i3,	[%l7 + %i7]
	nop
	set	0x72, %o1
	ldsh	[%l7 + %o1],	%i5
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x89,	%i4
	set	0x10, %i4
	stxa	%g7,	[%l7 + %i4] 0x89
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%g4
	nop
	set	0x14, %i0
	lduw	[%l7 + %i0],	%l0
	set	0x68, %o0
	stda	%o4,	[%l7 + %o0] 0xe3
	membar	#Sync
	nop
	set	0x18, %g1
	stx	%g1,	[%l7 + %g1]
	nop
	set	0x08, %g4
	prefetch	[%l7 + %g4],	 3
	set	0x3C, %l4
	swapa	[%l7 + %l4] 0x81,	%o6
	nop
	set	0x50, %o5
	std	%f20,	[%l7 + %o5]
	nop
	set	0x0E, %i2
	lduh	[%l7 + %i2],	%i2
	and	%l6,	%o1,	%g3
	nop
	set	0x24, %g7
	lduw	[%l7 + %g7],	%i7
	add	%o7,	%g5,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%l4
	nop
	set	0x10, %i3
	ldx	[%l7 + %i3],	%l3
	set	0x50, %l1
	stxa	%l5,	[%l7 + %l1] 0x81
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xd2
	set	0x18, %g2
	prefetcha	[%l7 + %g2] 0x88,	 1
	ble,a	%icc,	loop_184
	nop
	set	0x5C, %l3
	ldsw	[%l7 + %l3],	%l2
	or	%o0,	%o4,	%o3
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%i6
loop_184:
	nop
	set	0x78, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x20, %o4
	stxa	%o2,	[%l7 + %o4] 0x88
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xeb,	%l0
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f22
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i5,	%i3
	set	0x34, %i6
	lda	[%l7 + %i6] 0x88,	%f22
	set	0x18, %g3
	lda	[%l7 + %g3] 0x81,	%f22
	ld	[%l7 + 0x6C],	%f17
	set	0x4D, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i4
	nop
	set	0x60, %i1
	std	%g6,	[%l7 + %i1]
	nop
	set	0x24, %l0
	stw	%g7,	[%l7 + %l0]
	set	0x2C, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l0
	nop
	set	0x60, %o3
	lduh	[%l7 + %o3],	%o5
	set	0x28, %i7
	prefetcha	[%l7 + %i7] 0x80,	 4
	bleu,a	%xcc,	loop_185
	st	%fsr,	[%l7 + 0x48]
	add	%o6,	%g1,	%i2
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%o1
loop_185:
	nop
	set	0x78, %g5
	std	%f28,	[%l7 + %g5]
	nop
	set	0x3E, %o1
	ldsb	[%l7 + %o1],	%g3
	nop
	set	0x30, %i0
	ldsw	[%l7 + %i0],	%l6
	set	0x10, %o0
	ldda	[%l7 + %o0] 0x88,	%o6
	set	0x74, %i4
	sta	%f15,	[%l7 + %i4] 0x81
	nop
	set	0x0C, %g4
	ldsb	[%l7 + %g4],	%g5
	ld	[%l7 + 0x34],	%f10
	or	%i7,	%i1,	%l4
	and	%i0,	%l3,	%g2
	nop
	set	0x6C, %g1
	lduh	[%l7 + %g1],	%l5
	set	0x41, %o5
	ldstuba	[%l7 + %o5] 0x81,	%o0
	nop
	set	0x33, %i2
	ldub	[%l7 + %i2],	%l2
	set	0x4B, %g7
	stba	%o3,	[%l7 + %g7] 0x89
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x30, %i3
	ldstub	[%l7 + %i3],	%i6
	set	0x51, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o2
	nop
	set	0x60, %l4
	sth	%l1,	[%l7 + %l4]
	nop
	set	0x62, %g2
	ldstub	[%l7 + %g2],	%o4
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%i5
	set	0x3E, %l5
	stha	%i3,	[%l7 + %l5] 0xe2
	membar	#Sync
	set	0x68, %l6
	stba	%i4,	[%l7 + %l6] 0x89
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%g6
	nop
	set	0x24, %l2
	prefetch	[%l7 + %l2],	 4
	set	0x5C, %i5
	sta	%f23,	[%l7 + %i5] 0x89
	nop
	set	0x20, %i6
	sth	%g7,	[%l7 + %i6]
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x88,	%l0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x89,	%f16
	nop
	set	0x1D, %o6
	ldub	[%l7 + %o6],	%o5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f0
	st	%f16,	[%l7 + 0x18]
	add	%g4,	%o6,	%i2
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%g0
	nop
	set	0x14, %g6
	ldstub	[%l7 + %g6],	%g3
	nop
	set	0x3A, %i7
	ldsb	[%l7 + %i7],	%l6
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x89,	%o1
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x89,	%g5
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x78, %o3
	lduh	[%l7 + %o3],	%i7
	nop
	set	0x7A, %i0
	lduh	[%l7 + %i0],	%i0
	nop
	set	0x62, %o1
	ldsh	[%l7 + %o1],	%l4
	nop
	set	0x2E, %i4
	lduh	[%l7 + %i4],	%g2
	nop
	set	0x58, %g4
	stx	%fsr,	[%l7 + %g4]
	nop
	set	0x44, %g1
	ldsw	[%l7 + %g1],	%l5
	set	0x60, %o5
	lda	[%l7 + %o5] 0x89,	%f22
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%f24
	nop
	set	0x0C, %g7
	ldsb	[%l7 + %g7],	%o0
	set	0x18, %i3
	stda	%l2,	[%l7 + %i3] 0xe2
	membar	#Sync
	nop
	set	0x14, %i2
	prefetch	[%l7 + %i2],	 4
	nop
	set	0x54, %l4
	swap	[%l7 + %l4],	%l3
	st	%f6,	[%l7 + 0x70]
	set	0x34, %g2
	lda	[%l7 + %g2] 0x88,	%f19
	or	%o3,	%o2,	%i6
	set	0x20, %l3
	stwa	%o4,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x3C, %l1
	sta	%f27,	[%l7 + %l1] 0x89
	nop
	set	0x58, %l5
	stw	%l1,	[%l7 + %l5]
	nop
	set	0x38, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x81,	 1
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	nop
	set	0x7E, %i6
	ldsb	[%l7 + %i6],	%g6
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%i3
	set	0x50, %o4
	stxa	%l0,	[%l7 + %o4] 0xeb
	membar	#Sync
	nop
	set	0x44, %g3
	swap	[%l7 + %g3],	%g7
	and	%o5,	%o6,	%i2
	ld	[%l7 + 0x60],	%f18
	add	%g4,	%g1,	%g3
	nop
	set	0x58, %i1
	ldsh	[%l7 + %i1],	%o1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%g5
	nop
	set	0x20, %l0
	stx	%fsr,	[%l7 + %l0]
	ld	[%l7 + 0x50],	%f10
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf1,	%f0
	nop
	set	0x4C, %o6
	lduw	[%l7 + %o6],	%o7
	nop
	set	0x5C, %i7
	lduh	[%l7 + %i7],	%i7
	set	0x50, %o2
	sta	%f15,	[%l7 + %o2] 0x89
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0xc2
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x81,	 3
	nop
	set	0x60, %o3
	stx	%i1,	[%l7 + %o3]
	ld	[%l7 + 0x28],	%f21
	set	0x30, %o1
	swapa	[%l7 + %o1] 0x88,	%g2
	or	%l4,	%l5,	%o0
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f24
	nop
	set	0x2C, %g1
	ldsh	[%l7 + %g1],	%l3
	set	0x58, %o5
	swapa	[%l7 + %o5] 0x81,	%l2
	set	0x28, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%o2
	nop
	set	0x48, %o0
	prefetch	[%l7 + %o0],	 4
	bleu,a	%icc,	loop_186
	nop
	set	0x08, %i3
	stx	%fsr,	[%l7 + %i3]
	set	0x29, %i2
	stba	%o4,	[%l7 + %i2] 0xe3
	membar	#Sync
loop_186:
	nop
	set	0x08, %l4
	ldx	[%l7 + %l4],	%i6
	add	%l1,	%i4,	%i5
	nop
	set	0x3C, %g2
	ldsw	[%l7 + %g2],	%g6
	nop
	set	0x18, %l1
	ldsh	[%l7 + %l1],	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%i2
	nop
	set	0x78, %l5
	ldd	[%l7 + %l5],	%l0
	set	0x39, %l3
	stba	%g1,	[%l7 + %l3] 0x88
	add	%g3,	%g4,	%l6
	nop
	set	0x53, %l6
	ldsb	[%l7 + %l6],	%o1
	or	%g5,	%o7,	%i7
	nop
	set	0x5A, %l2
	ldstub	[%l7 + %l2],	%i0
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xda,	%f0
	nop
	set	0x48, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x48, %i6
	stx	%i1,	[%l7 + %i6]
	set	0x4C, %o4
	sta	%f16,	[%l7 + %o4] 0x88
	set	0x4E, %g3
	stha	%g2,	[%l7 + %g3] 0x80
	nop
	set	0x29, %l0
	stb	%l5,	[%l7 + %l0]
	nop
	set	0x18, %i1
	ldx	[%l7 + %i1],	%l4
	set	0x40, %g6
	lda	[%l7 + %g6] 0x88,	%f11
	ld	[%l7 + 0x34],	%f4
	nop
	set	0x18, %i7
	std	%f20,	[%l7 + %i7]
	nop
	set	0x0E, %o6
	lduh	[%l7 + %o6],	%l3
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%o0
	set	0x11, %o2
	stba	%o3,	[%l7 + %o2] 0x80
	bl,a	%icc,	loop_187
	nop
	set	0x68, %o3
	std	%f0,	[%l7 + %o3]
	set	0x1A, %i0
	ldstuba	[%l7 + %i0] 0x89,	%l2
loop_187:
	ba,pt	%xcc,	loop_188
	nop
	nop
	setx	0x3216FD06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x22144A63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f25,	%f18
	set	0x64, %i4
	sta	%f18,	[%l7 + %i4] 0x80
loop_188:
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%f8
	nop
	set	0x50, %o5
	std	%f12,	[%l7 + %o5]
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%o2
	nop
	set	0x68, %g7
	ldx	[%l7 + %g7],	%i6
	st	%fsr,	[%l7 + 0x38]
	nop
	set	0x70, %g4
	stb	%o4,	[%l7 + %g4]
	nop
	set	0x50, %i3
	stw	%l1,	[%l7 + %i3]
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf9
	membar	#Sync
	nop
	set	0x22, %l4
	ldsh	[%l7 + %l4],	%i5
	set	0x16, %g2
	ldstuba	[%l7 + %g2] 0x81,	%g6
	set	0x60, %o0
	ldda	[%l7 + %o0] 0xeb,	%i2
	or	%g7,	%i4,	%o5
	nop
	set	0x3C, %l1
	stw	%i2,	[%l7 + %l1]
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%o6
	nop
	set	0x6C, %l3
	stw	%g1,	[%l7 + %l3]
	set	0x20, %l6
	sta	%f16,	[%l7 + %l6] 0x88
	add	%l0,	%g3,	%l6
	nop
	set	0x22, %o7
	lduh	[%l7 + %o7],	%o1
	nop
	set	0x20, %l2
	stw	%g4,	[%l7 + %l2]
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xd2
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x08, %o4
	stxa	%o7,	[%l7 + %o4] 0xea
	membar	#Sync
	set	0x50, %g3
	swapa	[%l7 + %g3] 0x80,	%g5
	st	%f19,	[%l7 + 0x18]
	nop
	set	0x30, %i1
	stw	%i7,	[%l7 + %i1]
	nop
	set	0x2B, %l0
	ldub	[%l7 + %l0],	%i0
	or	%i1,	%g2,	%l4
	set	0x10, %i7
	ldda	[%l7 + %i7] 0x89,	%l4
	ld	[%l7 + 0x78],	%f8
	nop
	set	0x0E, %g6
	ldstub	[%l7 + %g6],	%o0
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x80,	%o3
	nop
	set	0x6A, %o2
	ldsh	[%l7 + %o2],	%l3
	nop
	set	0x1E, %g5
	sth	%l2,	[%l7 + %g5]
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f18
	set	0x48, %i4
	stba	%i6,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x40, %o3
	lduh	[%l7 + %o3],	%o4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%i5
	or	%o2,	%i3,	%g6
	set	0x54, %o5
	lda	[%l7 + %o5] 0x80,	%f16
	set	0x12, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i4
	nop
	set	0x76, %g7
	lduh	[%l7 + %g7],	%g7
	set	0x08, %o1
	ldstuba	[%l7 + %o1] 0x88,	%o5
	or	%i2,	%g1,	%l0
	or	%o6,	%l6,	%o1
	set	0x5C, %i3
	stba	%g4,	[%l7 + %i3] 0x88
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0
	wr 	%g0, 	0x5, 	%fprs
	set	0x60, %g4
	stda	%i6,	[%l7 + %g4] 0x81
	and	%i1,	%g2,	%i0
	nop
	set	0x5C, %g2
	ldub	[%l7 + %g2],	%l5
	nop
	set	0x30, %l4
	std	%o0,	[%l7 + %l4]
	nop
	set	0x54, %o0
	stw	%o3,	[%l7 + %o0]
	nop
	set	0x68, %l1
	ldd	[%l7 + %l1],	%l4
	nop
	set	0x65, %l5
	ldstub	[%l7 + %l5],	%l3
	set	0x58, %l6
	ldxa	[%l7 + %l6] 0x81,	%l2
	set	0x48, %o7
	swapa	[%l7 + %o7] 0x81,	%i6
	nop
	set	0x14, %l3
	stb	%o4,	[%l7 + %l3]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%o2
	set	0x14, %l2
	sta	%f29,	[%l7 + %l2] 0x89
	nop
	set	0x60, %i6
	std	%f28,	[%l7 + %i6]
	set	0x10, %o4
	ldda	[%l7 + %o4] 0xe2,	%l0
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%g6
	nop
	set	0x4C, %i1
	swap	[%l7 + %i1],	%i3
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%i4
	set	0x23, %l0
	stba	%o5,	[%l7 + %l0] 0x88
	set	0x58, %g6
	stda	%i2,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x72, %o6
	sth	%g7,	[%l7 + %o6]
	nop
	set	0x40, %o2
	std	%f8,	[%l7 + %o2]
	nop
	set	0x38, %g5
	std	%f0,	[%l7 + %g5]
	fpadd32s	%f18,	%f29,	%f15
	set	0x5C, %i0
	swapa	[%l7 + %i0] 0x81,	%g1
	ld	[%l7 + 0x44],	%f11
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f2
	and	%l0,	%l6,	%o1
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%g4
	nop
	set	0x3C, %o5
	ldsh	[%l7 + %o5],	%o6
	nop
	set	0x18, %o3
	ldsw	[%l7 + %o3],	%g5
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%g2
	ld	[%l7 + 0x4C],	%f31
	add	%o7,	%i1,	%g2
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xea,	%i6
	set	0x50, %o1
	sta	%f28,	[%l7 + %o1] 0x80
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xca
	nop
	set	0x6A, %i2
	sth	%i0,	[%l7 + %i2]
	and	%l5,	%o3,	%o0
	nop
	set	0x30, %g2
	swap	[%l7 + %g2],	%l4
	or	%l2,	%i6,	%l3
	set	0x4C, %l4
	sta	%f30,	[%l7 + %l4] 0x81
	set	0x72, %g4
	stba	%i5,	[%l7 + %g4] 0xeb
	membar	#Sync
	set	0x08, %o0
	stxa	%o4,	[%l7 + %o0] 0x80
	ld	[%l7 + 0x7C],	%f0
	set	0x10, %l1
	stha	%o2,	[%l7 + %l1] 0x80
	nop
	set	0x18, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x3E, %o7
	stb	%l1,	[%l7 + %o7]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x80,	%g6
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x89,	%i4
	set	0x17, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%i2
	nop
	set	0x08, %o4
	prefetch	[%l7 + %o4],	 2
	nop
	set	0x3E, %i6
	ldsh	[%l7 + %i6],	%g1
	nop
	set	0x78, %g3
	lduw	[%l7 + %g3],	%l0
	nop
	set	0x50, %i1
	prefetch	[%l7 + %i1],	 2
	ld	[%l7 + 0x54],	%f13
	nop
	set	0x60, %l0
	ldstub	[%l7 + %l0],	%l6
	set	0x10, %g6
	stxa	%o1,	[%l7 + %g6] 0x80
	nop
	set	0x24, %i5
	ldsh	[%l7 + %i5],	%g7
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%f8
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	and	%g4,	%g5,	%g3
	nop
	set	0x1F, %o2
	ldstub	[%l7 + %o2],	%o6
	st	%fsr,	[%l7 + 0x64]
	set	0x5C, %i4
	sta	%f28,	[%l7 + %i4] 0x88
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%o6
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xda
	nop
	set	0x50, %o3
	stx	%g2,	[%l7 + %o3]
	set	0x14, %g7
	stwa	%i1,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x48, %i7
	stxa	%i7,	[%l7 + %i7] 0xea
	membar	#Sync
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x89,	 4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x89,	%o3,	%i0
	st	%f26,	[%l7 + 0x2C]
	nop
	set	0x70, %o1
	ldub	[%l7 + %o1],	%o0
	set	0x0C, %i2
	stwa	%l4,	[%l7 + %i2] 0x80
	set	0x14, %i3
	stba	%i6,	[%l7 + %i3] 0x80
	nop
	set	0x48, %l4
	lduw	[%l7 + %l4],	%l3
	nop
	set	0x70, %g4
	stx	%l2,	[%l7 + %g4]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x08, %g2
	std	%o4,	[%l7 + %g2]
	nop
	set	0x48, %l1
	ldsw	[%l7 + %l1],	%g6
	or	%i4,	%l1,	%i3
	set	0x20, %l6
	stda	%o4,	[%l7 + %l6] 0x80
	nop
	set	0x4C, %o0
	lduw	[%l7 + %o0],	%g1
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x88,	%i2
	set	0x4C, %l3
	swapa	[%l7 + %l3] 0x89,	%l6
	nop
	set	0x32, %l5
	ldstub	[%l7 + %l5],	%o1
	set	0x70, %l2
	swapa	[%l7 + %l2] 0x80,	%g7
	fpadd32	%f30,	%f10,	%f26
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%g5
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f2
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%f18
	bg,pt	%xcc,	loop_189
	nop
	set	0x20, %g3
	lduh	[%l7 + %g3],	%g3
	nop
	set	0x50, %l0
	stx	%g4,	[%l7 + %l0]
	nop
	set	0x48, %g6
	std	%o6,	[%l7 + %g6]
loop_189:
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f28
	nop
	set	0x20, %i1
	stx	%o7,	[%l7 + %i1]
	set	0x5C, %g5
	stha	%i1,	[%l7 + %g5] 0x88
	nop
	set	0x5F, %o2
	ldstub	[%l7 + %o2],	%g2
	ld	[%l7 + 0x54],	%f14
	ld	[%l7 + 0x14],	%f29
	st	%fsr,	[%l7 + 0x34]
	set	0x3C, %i4
	lda	[%l7 + %i4] 0x81,	%f16
	or	%l5,	%o3,	%i0
	nop
	set	0x70, %i0
	ldsw	[%l7 + %i0],	%i7
	set	0x4C, %o5
	lda	[%l7 + %o5] 0x88,	%f16
	st	%fsr,	[%l7 + 0x58]
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%l4
	st	%fsr,	[%l7 + 0x2C]
	set	0x6C, %o6
	swapa	[%l7 + %o6] 0x89,	%i6
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%l2
	set	0x08, %i7
	ldxa	[%l7 + %i7] 0x89,	%l3
	nop
	set	0x48, %g1
	ldx	[%l7 + %g1],	%o2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%g6
	nop
	set	0x48, %o1
	ldd	[%l7 + %o1],	%f4
	add	%i5,	%i4,	%l1
	nop
	set	0x48, %g7
	std	%i2,	[%l7 + %g7]
	set	0x78, %i2
	ldxa	[%l7 + %i2] 0x88,	%o5
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x89,	%i2
	set	0x10, %g4
	stxa	%g1,	[%l7 + %g4] 0xea
	membar	#Sync
	set	0x25, %l4
	stba	%o1,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	set	0x34, %l1
	stw	%l6,	[%l7 + %l1]
	nop
	set	0x40, %g2
	stw	%l0,	[%l7 + %g2]
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x80
	nop
	set	0x58, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x40, %o7
	stx	%fsr,	[%l7 + %o7]
	set	0x64, %l5
	lda	[%l7 + %l5] 0x88,	%f19
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%g4
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f28
	nop
	set	0x12, %i6
	sth	%g3,	[%l7 + %i6]
	and	%g4,	%g7,	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%g2
	set	0x0E, %o4
	ldstuba	[%l7 + %o4] 0x89,	%l5
	nop
	set	0x38, %g3
	ldd	[%l7 + %g3],	%f4
	set	0x30, %l0
	prefetcha	[%l7 + %l0] 0x88,	 0
	add	%o3,	%i0,	%i7
	or	%o0,	%l4,	%i6
	ld	[%l7 + 0x2C],	%f11
	set	0x26, %i5
	stha	%l2,	[%l7 + %i5] 0x89
	and	%o2,	%l3,	%o4
	bl,a	%xcc,	loop_190
	nop
	set	0x60, %i1
	ldd	[%l7 + %i1],	%i4
	and	%g6,	%l1,	%i3
	nop
	set	0x30, %g5
	lduw	[%l7 + %g5],	%o5
loop_190:
	nop
	set	0x58, %o2
	ldd	[%l7 + %o2],	%f30
	set	0x3A, %g6
	stha	%i2,	[%l7 + %g6] 0x88
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x50, %o5
	ldd	[%l7 + %o5],	%f6
	nop
	set	0x70, %o6
	prefetch	[%l7 + %o6],	 1
	nop
	set	0x4C, %o3
	ldub	[%l7 + %o3],	%i4
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%g1
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf9,	%f0
	nop
	set	0x40, %g1
	std	%i6,	[%l7 + %g1]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x88,	%o1,	%l0
	nop
	set	0x3C, %o1
	stw	%g3,	[%l7 + %o1]
	nop
	set	0x50, %g7
	swap	[%l7 + %g7],	%g4
	nop
	set	0x50, %i2
	prefetch	[%l7 + %i2],	 2
	set	0x24, %g4
	sta	%f12,	[%l7 + %g4] 0x80
	st	%fsr,	[%l7 + 0x34]
	set	0x78, %i3
	ldxa	[%l7 + %i3] 0x81,	%g5
	st	%f26,	[%l7 + 0x18]
	or	%o7,	%g7,	%i1
	nop
	set	0x68, %l4
	ldd	[%l7 + %l4],	%f18
	set	0x77, %l1
	stba	%l5,	[%l7 + %l1] 0xe2
	membar	#Sync
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%g2
	nop
	set	0x08, %g2
	prefetch	[%l7 + %g2],	 4
	nop
	set	0x2D, %o0
	ldub	[%l7 + %o0],	%o3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x0F9, 	%sys_tick_cmpr
	nop
	set	0x68, %l5
	lduw	[%l7 + %l5],	%i7
	ld	[%l7 + 0x40],	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i6
	or	%l4,	%o2,	%l2
	nop
	set	0x40, %o7
	std	%o4,	[%l7 + %o7]
	fpadd32s	%f31,	%f11,	%f29
	set	0x4C, %l2
	stwa	%l3,	[%l7 + %l2] 0xe3
	membar	#Sync
	and	%g6,	%i5,	%l1
	and	%i3,	%o5,	%i4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g1,	%l6
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%o0
	add	%i2,	%l0,	%g3
	set	0x34, %i6
	stwa	%g5,	[%l7 + %i6] 0xea
	membar	#Sync
	nop
	set	0x09, %g3
	ldstub	[%l7 + %g3],	%o7
	nop
	set	0x63, %o4
	ldstub	[%l7 + %o4],	%g4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x88,	%f0
	nop
	set	0x1C, %i1
	swap	[%l7 + %i1],	%g7
	nop
	set	0x75, %i5
	ldstub	[%l7 + %i5],	%l5
	nop
	set	0x18, %o2
	stx	%fsr,	[%l7 + %o2]
	nop
	set	0x18, %g6
	ldx	[%l7 + %g6],	%g2
	nop
	set	0x20, %i0
	lduw	[%l7 + %i0],	%o3
	set	0x70, %g5
	stha	%o6,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x62, %o5
	ldub	[%l7 + %o5],	%i1
	set	0x50, %o3
	stxa	%i7,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x48, %o6
	std	%f4,	[%l7 + %o6]
	set	0x56, %i4
	ldstuba	[%l7 + %i4] 0x81,	%o0
	fpsub16	%f18,	%f4,	%f14
	nop
	set	0x7C, %i7
	ldsw	[%l7 + %i7],	%i0
	set	0x30, %g1
	lda	[%l7 + %g1] 0x80,	%f17
	nop
	set	0x34, %g7
	swap	[%l7 + %g7],	%l4
	nop
	set	0x30, %o1
	prefetch	[%l7 + %o1],	 1
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x80,	%o2
	nop
	set	0x4F, %i2
	ldstub	[%l7 + %i2],	%l2
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x81
	set	0x38, %i3
	ldxa	[%l7 + %i3] 0x88,	%o4
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f12
	and	%i6,	%g6,	%i5
	st	%f15,	[%l7 + 0x38]
	set	0x50, %g2
	ldda	[%l7 + %g2] 0xea,	%l0
	nop
	set	0x50, %o0
	stx	%l3,	[%l7 + %o0]
	set	0x6C, %l5
	ldstuba	[%l7 + %l5] 0x81,	%o5
	nop
	set	0x1C, %l1
	ldstub	[%l7 + %l1],	%i3
	st	%fsr,	[%l7 + 0x2C]
	nop
	set	0x10, %o7
	swap	[%l7 + %o7],	%g1
	or	%i4,	%l6,	%o1
	ld	[%l7 + 0x5C],	%f31
	nop
	set	0x1C, %l2
	swap	[%l7 + %l2],	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%g5
	nop
	set	0x2A, %l3
	stb	%o7,	[%l7 + %l3]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x81,	%l0,	%g4
	nop
	set	0x56, %i6
	sth	%l5,	[%l7 + %i6]
	nop
	set	0x4E, %g3
	ldstub	[%l7 + %g3],	%g2
	ld	[%l7 + 0x78],	%f14
	nop
	set	0x6F, %l0
	ldub	[%l7 + %l0],	%o3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x88
	nop
	set	0x79, %i1
	ldub	[%l7 + %i1],	%g7
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%f10
	set	0x28, %g6
	stba	%o6,	[%l7 + %g6] 0xea
	membar	#Sync
	ld	[%l7 + 0x48],	%f11
	set	0x30, %o2
	swapa	[%l7 + %o2] 0x88,	%i1
	nop
	set	0x10, %g5
	std	%f14,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x40]
	and	%o0,	%i0,	%l4
	set	0x58, %o5
	ldxa	[%l7 + %o5] 0x81,	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o4
	nop
	set	0x77, %i0
	ldub	[%l7 + %i0],	%i6
	nop
	set	0x3E, %o6
	stb	%g6,	[%l7 + %o6]
	nop
	set	0x60, %i4
	ldx	[%l7 + %i4],	%i5
	wr	%i7,	%l1,	%y
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%o5
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f20
	nop
	set	0x0A, %g1
	ldsh	[%l7 + %g1],	%g1
	nop
	set	0x44, %g7
	swap	[%l7 + %g7],	%i4
	nop
	set	0x48, %i7
	lduh	[%l7 + %i7],	%i3
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%o1
	fpsub16s	%f20,	%f7,	%f25
	ld	[%l7 + 0x5C],	%f8
	nop
	set	0x38, %g4
	std	%i6,	[%l7 + %g4]
	nop
	set	0x48, %l4
	std	%f28,	[%l7 + %l4]
	add	%g3,	%g5,	%i2
	nop
	set	0x60, %i3
	stx	%l0,	[%l7 + %i3]
	set	0x46, %i2
	stha	%o7,	[%l7 + %i2] 0x89
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x88,	%g4
	set	0x08, %l6
	stba	%g2,	[%l7 + %l6] 0x80
	nop
	set	0x08, %o0
	stw	%l5,	[%l7 + %o0]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x6AD, 	%tick_cmpr
	nop
	set	0x55, %l1
	stb	%i1,	[%l7 + %l1]
	nop
	set	0x18, %l5
	stx	%o0,	[%l7 + %l5]
	ld	[%l7 + 0x20],	%f21
	nop
	set	0x32, %o7
	ldub	[%l7 + %o7],	%o3
	nop
	set	0x18, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x08, %l2
	std	%f0,	[%l7 + %l2]
	set	0x19, %g3
	ldstuba	[%l7 + %g3] 0x88,	%i0
	and	%o2,	%l2,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x88,	%o4,	%i6
	ld	[%l7 + 0x08],	%f20
	nop
	set	0x78, %l0
	ldub	[%l7 + %l0],	%g6
	set	0x10, %o4
	swapa	[%l7 + %o4] 0x88,	%i5
	set	0x2A, %i6
	stha	%i7,	[%l7 + %i6] 0xeb
	membar	#Sync
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%l0
	ld	[%l7 + 0x50],	%f7
	fpsub32	%f12,	%f2,	%f12
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x81,	%o5,	%g1
	and	%i4,	%i3,	%l3
	set	0x18, %g6
	sta	%f10,	[%l7 + %g6] 0x88
	nop
	set	0x34, %o2
	lduw	[%l7 + %o2],	%o1
	nop
	set	0x08, %i1
	stx	%g3,	[%l7 + %i1]
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g5
	set	0x10, %g5
	stxa	%l0,	[%l7 + %g5] 0x80
	set	0x10, %o6
	stda	%o6,	[%l7 + %o6] 0x80
	add	%g4,	%g2,	%l5
	set	0x5C, %i4
	stwa	%g7,	[%l7 + %i4] 0xea
	membar	#Sync
	st	%fsr,	[%l7 + 0x14]
	add	%i2,	%i1,	%o6
	set	0x68, %o3
	swapa	[%l7 + %o3] 0x89,	%o3
	nop
	set	0x70, %i0
	std	%i0,	[%l7 + %i0]
	nop
	set	0x68, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x17, %i7
	stb	%o2,	[%l7 + %i7]
	ld	[%l7 + 0x34],	%f28
	set	0x60, %o1
	stda	%l2,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%o0
	st	%f13,	[%l7 + 0x6C]
	nop
	set	0x22, %g4
	ldsh	[%l7 + %g4],	%l4
	set	0x24, %l4
	swapa	[%l7 + %l4] 0x81,	%o4
	nop
	set	0x20, %i2
	std	%g6,	[%l7 + %i2]
	nop
	set	0x28, %g2
	ldstub	[%l7 + %g2],	%i5
	set	0x50, %l6
	lda	[%l7 + %l6] 0x89,	%f10
	nop
	set	0x70, %i3
	std	%f30,	[%l7 + %i3]
	nop
	set	0x76, %l1
	ldstub	[%l7 + %l1],	%i7
	nop
	set	0x4E, %o0
	lduh	[%l7 + %o0],	%l1
	nop
	set	0x60, %l5
	ldsw	[%l7 + %l5],	%i6
	set	0x7D, %l3
	ldstuba	[%l7 + %l3] 0x81,	%g1
	set	0x58, %o7
	stxa	%o5,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x38, %l2
	prefetcha	[%l7 + %l2] 0x89,	 1
	set	0x20, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i4
	ld	[%l7 + 0x3C],	%f29
	set	0x20, %o4
	stba	%o1,	[%l7 + %o4] 0xe3
	membar	#Sync
	fpsub32	%f20,	%f16,	%f14
	ld	[%l7 + 0x30],	%f14
	and	%g3,	%l6,	%l3
	nop
	set	0x64, %g3
	ldstub	[%l7 + %g3],	%l0
	bn,a,pn	%icc,	loop_191
	nop
	set	0x44, %i5
	stb	%o7,	[%l7 + %i5]
	and	%g5,	%g4,	%g2
	nop
	set	0x42, %g6
	ldsb	[%l7 + %g6],	%l5
loop_191:
	nop
	set	0x20, %i6
	stw	%g7,	[%l7 + %i6]
	nop
	set	0x50, %i1
	stx	%fsr,	[%l7 + %i1]
	fpsub16	%f20,	%f2,	%f12
	set	0x57, %o2
	stba	%i1,	[%l7 + %o2] 0xe3
	membar	#Sync
	nop
	set	0x79, %g5
	ldub	[%l7 + %g5],	%i2
	nop
	set	0x30, %o5
	ldd	[%l7 + %o5],	%f30
	set	, %i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 6:
!
!	Type l   	: 1281
!	Type a   	: 29
!	Type cti   	: 25
!	Type x   	: 524
!	Type f   	: 38
!	Type i   	: 103
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
	set	0x7,	%g1
	set	0xC,	%g2
	set	0xC,	%g3
	set	0x8,	%g4
	set	0xA,	%g5
	set	0x2,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x4,	%i1
	set	-0x8,	%i2
	set	-0xA,	%i3
	set	-0xC,	%i4
	set	-0x9,	%i5
	set	-0x8,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x7A27E58E,	%l0
	set	0x2A2E71D0,	%l1
	set	0x0BD5C20D,	%l2
	set	0x576111CB,	%l3
	set	0x4ABDB515,	%l4
	set	0x1D86C430,	%l5
	set	0x6CF238C4,	%l6
	!# Output registers
	set	-0x17E1,	%o0
	set	0x1FAE,	%o1
	set	-0x1EFB,	%o2
	set	0x0642,	%o3
	set	0x1C29,	%o4
	set	0x07A4,	%o5
	set	-0x05C3,	%o6
	set	0x1AC7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x171EAB8DCA03A004)
	INIT_TH_FP_REG(%l7,%f2,0x94C3E5271AD106E9)
	INIT_TH_FP_REG(%l7,%f4,0xC98BC9C9C49F6905)
	INIT_TH_FP_REG(%l7,%f6,0xD4F0978715772007)
	INIT_TH_FP_REG(%l7,%f8,0x3B722CE049088710)
	INIT_TH_FP_REG(%l7,%f10,0xB25032BF69C73E80)
	INIT_TH_FP_REG(%l7,%f12,0xAD5EA19022C84E8D)
	INIT_TH_FP_REG(%l7,%f14,0x71AA2F637C276FC3)
	INIT_TH_FP_REG(%l7,%f16,0x44D75E6F576794C8)
	INIT_TH_FP_REG(%l7,%f18,0xAF9A55133E8846CB)
	INIT_TH_FP_REG(%l7,%f20,0x535291F135BDB921)
	INIT_TH_FP_REG(%l7,%f22,0x3DC83F046FDC5813)
	INIT_TH_FP_REG(%l7,%f24,0x4AE707B354DF5359)
	INIT_TH_FP_REG(%l7,%f26,0x51ACD3899BDB7B82)
	INIT_TH_FP_REG(%l7,%f28,0xFD196A1012CB0B67)
	INIT_TH_FP_REG(%l7,%f30,0x2703B269AE177B52)

	!# Execute Main Diag ..

	set	0x14, %o3
	stwa	%o6,	[%l7 + %o3] 0xea
	membar	#Sync
	wr	%i0,	%o3,	%sys_tick
	set	0x78, %o6
	prefetcha	[%l7 + %o6] 0x80,	 0
	nop
	set	0x27, %g7
	ldsb	[%l7 + %g7],	%l2
	wr	%o0,	%l4,	%clear_softint
	nop
	set	0x78, %i0
	ldd	[%l7 + %i0],	%f28
	nop
	set	0x54, %i7
	sth	%o4,	[%l7 + %i7]
	nop
	set	0x78, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x18, %g4
	std	%f28,	[%l7 + %g4]
	nop
	set	0x7E, %g1
	lduh	[%l7 + %g1],	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i7,	%i5
	nop
	set	0x60, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x3F, %i2
	ldstuba	[%l7 + %i2] 0x89,	%g1
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	or	%l1,	%i3,	%o5
	add	%o1,	%i4,	%l6
	st	%fsr,	[%l7 + 0x08]
	set	0x40, %i3
	lda	[%l7 + %i3] 0x80,	%f15
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x80,	%l3
	set	0x44, %l6
	stha	%g3,	[%l7 + %l6] 0xea
	membar	#Sync
	set	0x24, %l5
	swapa	[%l7 + %l5] 0x81,	%l0
	set	0x08, %o0
	stha	%g5,	[%l7 + %o0] 0x88
	set	0x20, %l3
	stha	%g4,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x28, %o7
	stda	%g2,	[%l7 + %o7] 0x81
	wr	%o7,	%g7,	%pic
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x89,	%l5
	set	0x78, %l0
	stxa	%i2,	[%l7 + %l0] 0x81
	set	0x18, %o4
	stda	%i0,	[%l7 + %o4] 0x81
	ld	[%l7 + 0x20],	%f13
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%o3
	or	%o2,	%l2,	%i0
	set	0x0C, %i5
	lda	[%l7 + %i5] 0x81,	%f29
	nop
	set	0x4F, %g6
	ldub	[%l7 + %g6],	%o0
	add	%o4,	%l4,	%i7
	nop
	set	0x08, %i6
	swap	[%l7 + %i6],	%i5
	bne	%icc,	loop_192
	ba	%icc,	loop_193
	nop
	set	0x40, %g3
	std	%i6,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x1C]
loop_192:
	and	%g1,	%g6,	%l1
loop_193:
	nop
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x81,	%i3
	nop
	set	0x08, %i1
	sth	%o5,	[%l7 + %i1]
	add	%o1,	%i4,	%l3
	nop
	set	0x26, %o5
	ldstub	[%l7 + %o5],	%l6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xd8,	%f16
	nop
	set	0x30, %o3
	std	%f0,	[%l7 + %o3]
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%l0
	set	0x30, %g5
	stda	%g2,	[%l7 + %g5] 0x88
	nop
	nop
	setx	0xF3E96FF74E71E41A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6AA95C67A5C9485E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f8,	%f6
	nop
	set	0x29, %i0
	ldub	[%l7 + %i0],	%g5
	wr	%g4,	%g2,	%y
	set	0x28, %g7
	ldxa	[%l7 + %g7] 0x88,	%o7
	set	0x68, %i7
	stxa	%g7,	[%l7 + %i7] 0x88
	add	%l5,	%i1,	%i2
	set	0x1C, %g4
	swapa	[%l7 + %g4] 0x88,	%o6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xe2,	%o2
	nop
	set	0x10, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x28, %l4
	stx	%o2,	[%l7 + %l4]
	nop
	set	0x58, %i2
	ldsw	[%l7 + %i2],	%i0
	nop
	set	0x40, %g2
	stw	%l2,	[%l7 + %g2]
	nop
	set	0x42, %l1
	ldsb	[%l7 + %l1],	%o0
	nop
	set	0x50, %i3
	stb	%l4,	[%l7 + %i3]
	nop
	set	0x5C, %l5
	lduh	[%l7 + %l5],	%i7
	nop
	set	0x3F, %l6
	ldub	[%l7 + %l6],	%i5
	or	%i6,	%o4,	%g1
	and	%l1,	%i3,	%o5
	nop
	set	0x3C, %l3
	prefetch	[%l7 + %l3],	 0
	set	0x58, %o7
	stha	%o1,	[%l7 + %o7] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f0
	set	0x54, %l2
	sta	%f25,	[%l7 + %l2] 0x89
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%i4
	nop
	set	0x37, %l0
	ldub	[%l7 + %l0],	%g6
	add	%l3,	%l0,	%l6
	nop
	set	0x78, %i5
	ldd	[%l7 + %i5],	%f18
	nop
	set	0x74, %i6
	stw	%g3,	[%l7 + %i6]
	or	%g4,	%g5,	%g2
	nop
	set	0x08, %g3
	std	%o6,	[%l7 + %g3]
	nop
	set	0x30, %g6
	stx	%g7,	[%l7 + %g6]
	nop
	set	0x38, %i1
	ldx	[%l7 + %i1],	%l5
	nop
	set	0x26, %o5
	lduh	[%l7 + %o5],	%i2
	nop
	set	0x14, %i4
	swap	[%l7 + %i4],	%o6
	nop
	set	0x18, %o2
	lduh	[%l7 + %o2],	%i1
	ld	[%l7 + 0x38],	%f22
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x81,	%f16
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x88,	%o3
	set	0x40, %g5
	stda	%i0,	[%l7 + %g5] 0xeb
	membar	#Sync
	set	0x14, %g7
	sta	%f6,	[%l7 + %g7] 0x88
	nop
	set	0x60, %i0
	std	%l2,	[%l7 + %i0]
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%o0
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x80,	%l4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x89,	%f0
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%f10
	set	0x60, %l4
	stha	%i7,	[%l7 + %l4] 0x80
	fpadd32	%f30,	%f30,	%f4
	set	0x50, %i2
	lda	[%l7 + %i2] 0x88,	%f1
	nop
	set	0x20, %g2
	ldx	[%l7 + %g2],	%o2
	fpsub32	%f0,	%f26,	%f12
	st	%f24,	[%l7 + 0x20]
	set	0x10, %i3
	stda	%i6,	[%l7 + %i3] 0xe2
	membar	#Sync
	set	0x30, %l1
	swapa	[%l7 + %l1] 0x88,	%i5
	set	0x3A, %l5
	stha	%o4,	[%l7 + %l5] 0xea
	membar	#Sync
	st	%f17,	[%l7 + 0x68]
	nop
	set	0x78, %l3
	stx	%g1,	[%l7 + %l3]
	set	0x50, %o7
	ldda	[%l7 + %o7] 0xe2,	%l0
	set	0x50, %o0
	stba	%i3,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x2A, %l6
	sth	%o5,	[%l7 + %l6]
	set	0x0C, %l2
	swapa	[%l7 + %l2] 0x81,	%o1
	fpadd32s	%f27,	%f27,	%f5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%i4
	nop
	set	0x40, %l0
	std	%f12,	[%l7 + %l0]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xc4
	set	0x26, %i6
	stha	%l0,	[%l7 + %i6] 0x81
	nop
	set	0x5C, %g3
	stb	%l6,	[%l7 + %g3]
	nop
	set	0x3C, %g6
	stw	%g3,	[%l7 + %g6]
	set	0x28, %i1
	stda	%g4,	[%l7 + %i1] 0x81
	set	0x4A, %o5
	stha	%l3,	[%l7 + %o5] 0x89
	nop
	set	0x30, %i5
	lduw	[%l7 + %i5],	%g5
	or	%g2,	%o7,	%l5
	nop
	nop
	setx	0x9E1484AC8589BD0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x662EA2A5B6408C29,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f22,	%f6
	set	0x44, %o2
	swapa	[%l7 + %o2] 0x80,	%g7
	nop
	set	0x38, %o3
	prefetch	[%l7 + %o3],	 1
	set	0x7C, %i4
	ldstuba	[%l7 + %i4] 0x88,	%i2
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	set	0x60, %g7
	sta	%f22,	[%l7 + %g7] 0x88
	nop
	set	0x08, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x50, %o6
	std	%o6,	[%l7 + %o6]
	nop
	set	0x10, %o1
	std	%o2,	[%l7 + %o1]
	nop
	set	0x08, %i7
	stx	%i1,	[%l7 + %i7]
	nop
	set	0x78, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x59, %g4
	stb	%i0,	[%l7 + %g4]
	nop
	set	0x08, %i2
	sth	%o0,	[%l7 + %i2]
	and	%l2,	%i7,	%l4
	add	%o2,	%i5,	%i6
	set	0x21, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g1
	nop
	set	0x20, %i3
	stx	%o4,	[%l7 + %i3]
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%l1
	nop
	set	0x57, %l1
	ldub	[%l7 + %l1],	%o5
	st	%f12,	[%l7 + 0x08]
	nop
	set	0x28, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x0C, %l3
	stw	%o1,	[%l7 + %l3]
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%i4
	st	%f2,	[%l7 + 0x24]
	nop
	set	0x40, %g2
	prefetch	[%l7 + %g2],	 4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x81,	%g6,	%l6
	set	0x18, %o0
	ldxa	[%l7 + %o0] 0x81,	%g3
	ld	[%l7 + 0x74],	%f26
	fpadd32	%f18,	%f2,	%f24
	add	%l0,	%g4,	%l3
	nop
	set	0x50, %l2
	ldsb	[%l7 + %l2],	%g2
	set	0x78, %l6
	stxa	%o7,	[%l7 + %l6] 0x89
	nop
	set	0x3E, %l0
	ldsh	[%l7 + %l0],	%g5
	set	0x18, %o4
	stxa	%l5,	[%l7 + %o4] 0x89
	nop
	set	0x5E, %g3
	sth	%g7,	[%l7 + %g3]
	nop
	set	0x38, %i6
	ldd	[%l7 + %i6],	%f12
	nop
	set	0x19, %i1
	ldub	[%l7 + %i1],	%o6
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 2
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xd0
	ba,a,pt	%xcc,	loop_194
	ld	[%l7 + 0x3C],	%f27
	set	0x40, %o5
	prefetcha	[%l7 + %o5] 0x81,	 4
loop_194:
	nop
	set	0x0E, %o3
	sth	%i1,	[%l7 + %o3]
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x81,	%i0
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%o0
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x80,	%l2
	set	0x24, %i0
	lda	[%l7 + %i0] 0x89,	%f13
	nop
	set	0x08, %g7
	prefetch	[%l7 + %g7],	 2
	set	0x64, %o1
	lda	[%l7 + %o1] 0x81,	%f11
	nop
	set	0x34, %o6
	prefetch	[%l7 + %o6],	 4
	ld	[%l7 + 0x10],	%f25
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x88,	 3
	nop
	set	0x6B, %g4
	ldsb	[%l7 + %g4],	%i7
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f24
	set	0x2C, %i7
	ldstuba	[%l7 + %i7] 0x81,	%l4
	ld	[%l7 + 0x14],	%f0
	nop
	set	0x13, %i3
	ldsb	[%l7 + %i3],	%i5
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%o2
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x78, %l3
	stx	%g1,	[%l7 + %l3]
	nop
	set	0x0F, %l5
	ldsb	[%l7 + %l5],	%i6
	set	0x3C, %o7
	sta	%f18,	[%l7 + %o7] 0x88
	ld	[%l7 + 0x08],	%f18
	nop
	set	0x68, %g2
	stw	%o4,	[%l7 + %g2]
	ld	[%l7 + 0x6C],	%f9
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f16
	or	%i3,	%o5,	%o1
	ld	[%l7 + 0x14],	%f3
	set	0x70, %l6
	stwa	%i4,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x24, %l0
	ldsh	[%l7 + %l0],	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%g3
	set	0x7A, %o0
	ldstuba	[%l7 + %o0] 0x81,	%l6
	set	0x1C, %o4
	stwa	%g4,	[%l7 + %o4] 0xe3
	membar	#Sync
	and	%l0,	%g2,	%o7
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x81,	%g5
	set	0x12, %g3
	ldstuba	[%l7 + %g3] 0x80,	%l3
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x81,	%g6
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf9
	membar	#Sync
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x89,	%o6
	set	0x26, %o3
	stha	%l5,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x50, %i4
	sth	%i1,	[%l7 + %i4]
	or	%o3,	%i0,	%o0
	set	0x18, %o5
	stba	%l2,	[%l7 + %o5] 0xe3
	membar	#Sync
	fpadd16s	%f27,	%f26,	%f23
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x80,	%i7
	nop
	nop
	setx	0x57CC591A0FB4BB29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA0A95F1327E562AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f8,	%f18
	nop
	set	0x16, %i0
	ldsh	[%l7 + %i0],	%l4
	set	0x70, %o2
	lda	[%l7 + %o2] 0x80,	%f29
	st	%f23,	[%l7 + 0x70]
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x88,	%i5,	%i2
	st	%fsr,	[%l7 + 0x6C]
	wr	%o2,	%g1,	%clear_softint
	nop
	set	0x2C, %g7
	swap	[%l7 + %g7],	%o4
	nop
	set	0x30, %o1
	stx	%fsr,	[%l7 + %o1]
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%i2
	nop
	set	0x36, %g4
	ldstub	[%l7 + %g4],	%o5
	and	%i6,	%o1,	%g6
	nop
	set	0x78, %i2
	swap	[%l7 + %i2],	%i4
	nop
	set	0x56, %i7
	sth	%g3,	[%l7 + %i7]
	nop
	set	0x5C, %i3
	ldsh	[%l7 + %i3],	%l6
	set	0x70, %l4
	stba	%g4,	[%l7 + %l4] 0x89
	set	0x38, %l1
	prefetcha	[%l7 + %l1] 0x81,	 0
	wr	%l1,	%o7,	%ccr
	nop
	set	0x68, %o6
	stw	%g2,	[%l7 + %o6]
	nop
	set	0x38, %l5
	prefetch	[%l7 + %l5],	 2
	st	%fsr,	[%l7 + 0x30]
	st	%f26,	[%l7 + 0x10]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g7
	nop
	set	0x44, %o7
	sth	%g5,	[%l7 + %o7]
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%f6
	set	0x18, %l2
	stwa	%o6,	[%l7 + %l2] 0xe2
	membar	#Sync
	nop
	set	0x0C, %g2
	lduw	[%l7 + %g2],	%l5
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%i1
	and	%i0,	%o3,	%l2
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%f18
	st	%f29,	[%l7 + 0x48]
	nop
	set	0x40, %o4
	stw	%i7,	[%l7 + %o4]
	add	%o0,	%l4,	%i2
	nop
	set	0x5A, %i6
	ldsb	[%l7 + %i6],	%o2
	nop
	set	0x54, %g3
	prefetch	[%l7 + %g3],	 3
	nop
	set	0x4C, %o0
	lduh	[%l7 + %o0],	%g1
	nop
	set	0x08, %i1
	std	%f26,	[%l7 + %i1]
	set	0x60, %g6
	stxa	%o4,	[%l7 + %g6] 0xe3
	membar	#Sync
	nop
	set	0x68, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x4E, %o3
	stba	%i5,	[%l7 + %o3] 0xe2
	membar	#Sync
	and	%o5,	%i3,	%i6
	ld	[%l7 + 0x2C],	%f6
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f0
	set	0x20, %o5
	swapa	[%l7 + %o5] 0x88,	%o1
	nop
	set	0x46, %g5
	sth	%g6,	[%l7 + %g5]
	set	0x11, %i0
	ldstuba	[%l7 + %i0] 0x80,	%i4
	nop
	nop
	setx	0x073C4F5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xBDDA1D06,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f16,	%f0
	nop
	set	0x20, %o2
	ldsw	[%l7 + %o2],	%l6
	nop
	set	0x3C, %g7
	ldsw	[%l7 + %g7],	%g4
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%l0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%l1
	nop
	set	0x18, %g4
	lduh	[%l7 + %g4],	%g2
	and	%o7,	%g7,	%l3
	set	0x63, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o6
	nop
	set	0x29, %g1
	ldub	[%l7 + %g1],	%g5
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x81,	 4
	nop
	set	0x4A, %i3
	lduh	[%l7 + %i3],	%i1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0xf9
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x88,	%f16
	and	%i0,	%l2,	%o3
	add	%o0,	%l4,	%i7
	nop
	set	0x25, %l5
	stb	%i2,	[%l7 + %l5]
	set	0x43, %o7
	stba	%g1,	[%l7 + %o7] 0x89
	nop
	set	0x0E, %l3
	ldstub	[%l7 + %l3],	%o2
	set	0x18, %l4
	sta	%f9,	[%l7 + %l4] 0x80
	nop
	set	0x5C, %g2
	stw	%o4,	[%l7 + %g2]
	nop
	set	0x46, %l0
	lduh	[%l7 + %l0],	%i5
	nop
	set	0x3E, %l6
	sth	%o5,	[%l7 + %l6]
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf9
	membar	#Sync
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f8
	nop
	set	0x59, %l2
	ldsb	[%l7 + %l2],	%i6
	nop
	set	0x48, %o0
	stx	%o1,	[%l7 + %o0]
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 1
	or	%g6,	%i3,	%i4
	set	0x70, %g3
	ldda	[%l7 + %g3] 0xe3,	%g4
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x81,	%l0
	set	0x76, %i5
	stba	%l6,	[%l7 + %i5] 0x89
	set	0x68, %i4
	ldxa	[%l7 + %i4] 0x80,	%l1
	nop
	set	0x08, %o3
	swap	[%l7 + %o3],	%g2
	set	0x70, %g5
	ldda	[%l7 + %g5] 0xe3,	%g2
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%l3
	and	%o6,	%g5,	%i1
	or	%l5,	%i0,	%o3
	nop
	set	0x30, %o2
	ldd	[%l7 + %o2],	%f20
	nop
	set	0x10, %i0
	std	%o0,	[%l7 + %i0]
	nop
	set	0x50, %g7
	std	%l4,	[%l7 + %g7]
	and	%i7,	%l2,	%g1
	set	0x3B, %o1
	ldstuba	[%l7 + %o1] 0x89,	%o2
	nop
	set	0x5A, %i2
	ldub	[%l7 + %i2],	%i2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x89
	nop
	set	0x68, %i7
	stx	%fsr,	[%l7 + %i7]
	set	0x1C, %g1
	swapa	[%l7 + %g1] 0x80,	%o4
	nop
	set	0x0C, %i3
	prefetch	[%l7 + %i3],	 3
	nop
	set	0x50, %l1
	std	%f30,	[%l7 + %l1]
	set	0x60, %l5
	stwa	%o5,	[%l7 + %l5] 0x89
	fpsub16s	%f17,	%f0,	%f20
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%i5
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x88,	%o0
	nop
	set	0x28, %l4
	stx	%i6,	[%l7 + %l4]
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x88,	 4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x80,	%i3,	%g4
	set	0x78, %o7
	stxa	%l0,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x10, %l0
	lda	[%l7 + %l0] 0x89,	%f20
	nop
	set	0x43, %l6
	ldsb	[%l7 + %l6],	%i4
	nop
	set	0x1C, %i6
	stw	%l6,	[%l7 + %i6]
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%g2
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0xf0
	membar	#Sync
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xc4
	set	0x28, %o0
	stxa	%g3,	[%l7 + %o0] 0xe2
	membar	#Sync
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%l0
	add	%g7,	%o7,	%l3
	nop
	set	0x64, %i5
	stw	%g5,	[%l7 + %i5]
	set	0x38, %g3
	sta	%f0,	[%l7 + %g3] 0x88
	set	0x43, %i4
	stba	%i1,	[%l7 + %i4] 0x88
	set	0x64, %g5
	lda	[%l7 + %g5] 0x88,	%f16
	nop
	set	0x28, %o5
	std	%f0,	[%l7 + %o5]
	ld	[%l7 + 0x30],	%f11
	add	%l5,	%i0,	%o3
	nop
	set	0x35, %o3
	ldub	[%l7 + %o3],	%o0
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%o6
	set	0x60, %o2
	swapa	[%l7 + %o2] 0x81,	%l4
	nop
	set	0x50, %g7
	std	%f2,	[%l7 + %g7]
	st	%f17,	[%l7 + 0x48]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%g1
	nop
	set	0x74, %o1
	ldsw	[%l7 + %o1],	%o2
	nop
	set	0x62, %i2
	ldub	[%l7 + %i2],	%i7
	fpadd32	%f4,	%f16,	%f4
	set	0x35, %g4
	stba	%o4,	[%l7 + %g4] 0xe3
	membar	#Sync
	nop
	set	0x30, %g1
	ldsw	[%l7 + %g1],	%o5
	nop
	set	0x44, %i7
	prefetch	[%l7 + %i7],	 0
	nop
	set	0x14, %l1
	lduw	[%l7 + %l1],	%i2
	nop
	set	0x60, %l5
	ldsb	[%l7 + %l5],	%i5
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x80,	%o1
	nop
	set	0x6F, %l3
	ldstub	[%l7 + %l3],	%i6
	nop
	set	0x6E, %l4
	ldsb	[%l7 + %l4],	%g6
	add	%i3,	%l0,	%g4
	nop
	set	0x30, %g2
	stb	%l6,	[%l7 + %g2]
	or	%g2,	%g3,	%l1
	set	0x66, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g7
	nop
	set	0x5D, %l0
	ldub	[%l7 + %l0],	%o7
	set	0x7C, %o6
	stba	%l3,	[%l7 + %o6] 0xeb
	membar	#Sync
	ba	%xcc,	loop_195
	nop
	set	0x42, %i6
	ldsh	[%l7 + %i6],	%g5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%l5
loop_195:
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x2C, %l6
	sth	%i4,	[%l7 + %l6]
	set	0x58, %o4
	ldxa	[%l7 + %o4] 0x81,	%i0
	nop
	set	0x78, %l2
	std	%f24,	[%l7 + %l2]
	nop
	set	0x74, %o0
	ldsb	[%l7 + %o0],	%o0
	nop
	set	0x14, %i1
	ldsh	[%l7 + %i1],	%o3
	ld	[%l7 + 0x54],	%f7
	add	%o6,	%l2,	%g1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
	nop
	set	0x78, %g6
	swap	[%l7 + %g6],	%l4
	nop
	set	0x50, %i4
	stx	%i7,	[%l7 + %i4]
	nop
	set	0x1C, %g3
	stw	%o2,	[%l7 + %g3]
	nop
	set	0x1C, %g5
	ldub	[%l7 + %g5],	%o4
	set	0x38, %o5
	lda	[%l7 + %o5] 0x80,	%f12
	nop
	set	0x20, %o3
	swap	[%l7 + %o3],	%i2
	set	0x54, %i0
	stwa	%i5,	[%l7 + %i0] 0x89
	set	0x20, %g7
	stwa	%o5,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x50, %o1
	std	%o0,	[%l7 + %o1]
	nop
	set	0x40, %o2
	sth	%g6,	[%l7 + %o2]
	set	0x18, %g4
	ldxa	[%l7 + %g4] 0x81,	%i3
	nop
	set	0x2F, %i2
	ldstub	[%l7 + %i2],	%l0
	wr	%i6,	%g4,	%y
	set	0x30, %g1
	stda	%g2,	[%l7 + %g1] 0xeb
	membar	#Sync
	nop
	set	0x08, %i7
	std	%i6,	[%l7 + %i7]
	add	%l1,	%g3,	%g7
	nop
	set	0x7C, %l1
	lduw	[%l7 + %l1],	%l3
	nop
	set	0x0E, %l5
	ldsb	[%l7 + %l5],	%o7
	nop
	set	0x38, %l3
	stx	%fsr,	[%l7 + %l3]
	set	0x23, %l4
	stba	%i1,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x28, %i3
	stba	%g5,	[%l7 + %i3] 0x89
	st	%fsr,	[%l7 + 0x3C]
	st	%f18,	[%l7 + 0x28]
	nop
	set	0x34, %g2
	lduw	[%l7 + %g2],	%i4
	set	0x70, %o7
	lda	[%l7 + %o7] 0x88,	%f11
	set	0x08, %l0
	stwa	%i0,	[%l7 + %l0] 0xeb
	membar	#Sync
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x44, %o6
	sth	%o0,	[%l7 + %o6]
	nop
	set	0x18, %l6
	stx	%o3,	[%l7 + %l6]
	set	0x50, %l2
	ldda	[%l7 + %l2] 0x89,	%o6
	nop
	set	0x34, %o0
	stw	%l5,	[%l7 + %o0]
	set	0x78, %i1
	stwa	%g1,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x2E, %o4
	lduh	[%l7 + %o4],	%l2
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%l4
	set	0x5C, %i5
	sta	%f5,	[%l7 + %i5] 0x88
	nop
	set	0x48, %g3
	stx	%fsr,	[%l7 + %g3]
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x89,	 0
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc8
	nop
	set	0x74, %o3
	ldsw	[%l7 + %o3],	%o2
	nop
	set	0x1C, %o5
	stw	%i2,	[%l7 + %o5]
	ld	[%l7 + 0x40],	%f3
	nop
	set	0x40, %i0
	stx	%o4,	[%l7 + %i0]
	set	0x78, %g7
	ldstuba	[%l7 + %g7] 0x89,	%i5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%g6
	nop
	set	0x78, %o1
	stx	%o1,	[%l7 + %o1]
	nop
	set	0x48, %o2
	swap	[%l7 + %o2],	%i3
	nop
	set	0x3C, %i2
	stw	%l0,	[%l7 + %i2]
	nop
	set	0x24, %g4
	stw	%g4,	[%l7 + %g4]
	nop
	set	0x14, %g1
	lduh	[%l7 + %g1],	%g2
	nop
	set	0x30, %l1
	std	%i6,	[%l7 + %l1]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCD6, 	%sys_tick_cmpr
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%l1
	st	%f26,	[%l7 + 0x10]
	nop
	set	0x60, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x65, %l4
	ldsb	[%l7 + %l4],	%g7
	nop
	set	0x60, %i7
	ldsb	[%l7 + %i7],	%o7
	nop
	set	0x7C, %g2
	sth	%l3,	[%l7 + %g2]
	nop
	set	0x08, %o7
	ldd	[%l7 + %o7],	%f2
	set	0x48, %l0
	ldxa	[%l7 + %l0] 0x81,	%i1
	nop
	set	0x56, %i6
	sth	%i4,	[%l7 + %i6]
	st	%f12,	[%l7 + 0x40]
	set	0x2C, %o6
	sta	%f20,	[%l7 + %o6] 0x89
	add	%g5,	%i0,	%o0
	nop
	set	0x77, %i3
	stb	%o3,	[%l7 + %i3]
	nop
	set	0x48, %l2
	std	%f30,	[%l7 + %l2]
	bge,pn	%xcc,	loop_196
	st	%fsr,	[%l7 + 0x54]
	set	0x68, %l6
	sta	%f8,	[%l7 + %l6] 0x81
loop_196:
	nop
	set	0x70, %i1
	stw	%o6,	[%l7 + %i1]
	nop
	set	0x3C, %o0
	ldub	[%l7 + %o0],	%g1
	nop
	set	0x18, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x34, %i5
	ldsw	[%l7 + %i5],	%l5
	nop
	set	0x30, %g3
	std	%l4,	[%l7 + %g3]
	nop
	set	0x58, %o4
	stx	%i7,	[%l7 + %o4]
	set	0x58, %i4
	stxa	%o2,	[%l7 + %i4] 0x80
	set	0x44, %o3
	swapa	[%l7 + %o3] 0x88,	%i2
	nop
	set	0x5E, %o5
	ldstub	[%l7 + %o5],	%l2
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xea,	%i4
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x80,	%o4
	set	0x54, %o1
	lda	[%l7 + %o1] 0x88,	%f16
	set	0x16, %i0
	stba	%g6,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%o4
	nop
	set	0x66, %g4
	ldsh	[%l7 + %g4],	%o1
	st	%fsr,	[%l7 + 0x70]
	set	0x10, %i2
	stxa	%i3,	[%l7 + %i2] 0x89
	set	0x30, %l1
	ldda	[%l7 + %l1] 0xe2,	%l0
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x81,	 2
	nop
	set	0x18, %l5
	stx	%i6,	[%l7 + %l5]
	nop
	set	0x50, %l3
	stw	%l6,	[%l7 + %l3]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g2,	%l1
	nop
	set	0x48, %l4
	std	%g2,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x14]
	set	0x58, %g2
	stda	%o6,	[%l7 + %g2] 0x80
	set	0x0C, %i7
	lda	[%l7 + %i7] 0x81,	%f28
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%g6
	and	%i1,	%i4,	%g5
	fpsub16s	%f17,	%f31,	%f8
	set	0x50, %o7
	stxa	%i0,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x4C, %i6
	stw	%l3,	[%l7 + %i6]
	and	%o0,	%o3,	%g1
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%l4
	ld	[%l7 + 0x38],	%f10
	add	%o6,	%l4,	%i7
	nop
	set	0x3E, %l2
	lduh	[%l7 + %l2],	%o2
	set	0x20, %o6
	lda	[%l7 + %o6] 0x81,	%f24
	set	0x3E, %i1
	stba	%i2,	[%l7 + %i1] 0xeb
	membar	#Sync
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f6
	nop
	set	0x49, %g6
	stb	%l2,	[%l7 + %g6]
	nop
	set	0x70, %l6
	stx	%fsr,	[%l7 + %l6]
	nop
	set	0x08, %g3
	lduw	[%l7 + %g3],	%o5
	add	%i5,	%o4,	%g6
	ld	[%l7 + 0x58],	%f2
	wr	%o1,	%l0,	%pic
	bge,pt	%icc,	loop_197
	nop
	set	0x40, %i5
	std	%f14,	[%l7 + %i5]
	nop
	set	0x08, %i4
	ldd	[%l7 + %i4],	%i2
	set	0x74, %o4
	sta	%f0,	[%l7 + %o4] 0x88
loop_197:
	nop
	set	0x28, %o5
	ldxa	[%l7 + %o5] 0x88,	%i6
	or	%g4,	%l6,	%l1
	set	0x50, %o3
	ldxa	[%l7 + %o3] 0x80,	%g2
	set	0x78, %g5
	swapa	[%l7 + %g5] 0x89,	%o7
	st	%fsr,	[%l7 + 0x40]
	st	%f9,	[%l7 + 0x10]
	and	%g3,	%g7,	%i4
	nop
	set	0x18, %o1
	ldx	[%l7 + %o1],	%i1
	add	%i0,	%l3,	%o0
	set	0x1E, %i0
	stha	%g5,	[%l7 + %i0] 0xea
	membar	#Sync
	or	%g1,	%o3,	%l5
	set	0x14, %o2
	lda	[%l7 + %o2] 0x81,	%f3
	st	%fsr,	[%l7 + 0x48]
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xe2,	%l4
	st	%fsr,	[%l7 + 0x54]
	nop
	set	0x28, %g4
	std	%o6,	[%l7 + %g4]
	set	0x78, %l1
	ldxa	[%l7 + %l1] 0x88,	%i7
	nop
	set	0x34, %g1
	prefetch	[%l7 + %g1],	 3
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l2,	%i5
	set	0x18, %i2
	lda	[%l7 + %i2] 0x80,	%f28
	set	0x68, %l3
	ldxa	[%l7 + %l3] 0x88,	%o4
	nop
	set	0x74, %g2
	prefetch	[%l7 + %g2],	 1
	nop
	set	0x50, %l4
	lduh	[%l7 + %l4],	%g6
	set	0x70, %i7
	ldda	[%l7 + %i7] 0x80,	%l0
	nop
	set	0x40, %l0
	stx	%o1,	[%l7 + %l0]
	set	0x38, %i6
	ldxa	[%l7 + %i6] 0x88,	%i6
	nop
	set	0x38, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x44, %l2
	swap	[%l7 + %l2],	%g4
	set	0x58, %o6
	stba	%i3,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x4C, %i3
	stb	%l1,	[%l7 + %i3]
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f16
	nop
	set	0x18, %o0
	prefetch	[%l7 + %o0],	 0
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x89,	 0
	nop
	set	0x70, %g6
	ldsh	[%l7 + %g6],	%o7
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%g2
	nop
	set	0x58, %i4
	prefetch	[%l7 + %i4],	 3
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f26
	fpadd32	%f28,	%f12,	%f22
	set	0x70, %o5
	ldxa	[%l7 + %o5] 0x88,	%l6
	set	0x34, %g3
	sta	%f7,	[%l7 + %g3] 0x88
	nop
	set	0x18, %g5
	stb	%g7,	[%l7 + %g5]
	set	0x44, %o3
	lda	[%l7 + %o3] 0x89,	%f21
	nop
	set	0x1C, %o1
	stw	%i1,	[%l7 + %o1]
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%i4
	nop
	set	0x50, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x24, %g4
	sta	%f25,	[%l7 + %g4] 0x88
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x88,	%i0,	%o0
	nop
	set	0x41, %i0
	ldstub	[%l7 + %i0],	%g5
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xd8
	or	%l3,	%o3,	%l5
	nop
	set	0x18, %i2
	std	%l4,	[%l7 + %i2]
	ld	[%l7 + 0x34],	%f12
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i7
	wr	%o6,	%o2,	%sys_tick
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x80,	%i2
	nop
	set	0x48, %g2
	ldub	[%l7 + %g2],	%l2
	set	0x22, %l5
	stha	%o5,	[%l7 + %l5] 0x88
	set	0x50, %i7
	lda	[%l7 + %i7] 0x81,	%f6
	add	%o4,	%i5,	%g6
	or	%l0,	%i6,	%g4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xd2
	nop
	set	0x60, %i6
	ldub	[%l7 + %i6],	%o1
	nop
	set	0x14, %l4
	stw	%i3,	[%l7 + %l4]
	nop
	set	0x38, %o7
	ldx	[%l7 + %o7],	%l1
	nop
	set	0x18, %l2
	lduw	[%l7 + %l2],	%g2
	set	0x68, %o6
	stda	%g2,	[%l7 + %o6] 0x88
	ld	[%l7 + 0x54],	%f1
	nop
	set	0x10, %i1
	std	%f30,	[%l7 + %i1]
	and	%o7,	%g7,	%l6
	set	0x40, %o0
	prefetcha	[%l7 + %o0] 0x81,	 3
	fpadd32	%f12,	%f6,	%f30
	set	0x48, %l6
	stda	%i0,	[%l7 + %l6] 0xea
	membar	#Sync
	or	%o0,	%g5,	%i4
	set	0x78, %g6
	sta	%f5,	[%l7 + %g6] 0x80
	and	%l3,	%l5,	%o3
	set	0x31, %i5
	stba	%g1,	[%l7 + %i5] 0x88
	set	0x20, %i3
	stwa	%l4,	[%l7 + %i3] 0x89
	or	%o6,	%i7,	%o2
	set	0x63, %o4
	ldstuba	[%l7 + %o4] 0x89,	%i2
	add	%l2,	%o5,	%o4
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x81,	 1
	nop
	set	0x70, %o5
	ldsb	[%l7 + %o5],	%i6
	nop
	set	0x5C, %o3
	lduw	[%l7 + %o3],	%g6
	nop
	set	0x2C, %o1
	prefetch	[%l7 + %o1],	 2
	nop
	set	0x60, %o2
	std	%g4,	[%l7 + %o2]
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x80,	%o1
	nop
	set	0x18, %g5
	lduw	[%l7 + %g5],	%i3
	fpsub32	%f2,	%f12,	%f28
	or	%l1,	%g3,	%g2
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf9
	membar	#Sync
	st	%f21,	[%l7 + 0x34]
	fpadd32s	%f10,	%f14,	%f19
	nop
	set	0x3A, %i0
	lduh	[%l7 + %i0],	%o7
	add	%l6,	%g7,	%i0
	set	0x28, %g1
	ldxa	[%l7 + %g1] 0x80,	%o0
	nop
	set	0x44, %i2
	sth	%i1,	[%l7 + %i2]
	nop
	set	0x36, %g4
	sth	%g5,	[%l7 + %g4]
	and	%l3,	%i4,	%o3
	nop
	set	0x2F, %l3
	ldub	[%l7 + %l3],	%l5
	nop
	set	0x48, %g2
	stw	%l4,	[%l7 + %g2]
	nop
	set	0x40, %l5
	ldub	[%l7 + %l5],	%g1
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x89,	 3
	nop
	set	0x1E, %l0
	stb	%i7,	[%l7 + %l0]
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%o2
	wr	%i2,	%l2,	%set_softint
	ld	[%l7 + 0x2C],	%f10
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f24
	nop
	set	0x30, %i6
	swap	[%l7 + %i6],	%o5
	nop
	set	0x70, %o6
	lduh	[%l7 + %o6],	%o4
	nop
	set	0x08, %i1
	std	%f24,	[%l7 + %i1]
	nop
	set	0x46, %o0
	ldsh	[%l7 + %o0],	%l0
	nop
	set	0x1D, %l2
	ldstub	[%l7 + %l2],	%i6
	nop
	set	0x7A, %g6
	ldsh	[%l7 + %g6],	%g6
	nop
	set	0x54, %l6
	swap	[%l7 + %l6],	%g4
	or	%i5,	%o1,	%l1
	nop
	set	0x2A, %i5
	ldstub	[%l7 + %i5],	%i3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g3,	%g2
	nop
	set	0x50, %i3
	std	%f18,	[%l7 + %i3]
	set	0x27, %o4
	ldstuba	[%l7 + %o4] 0x80,	%l6
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x88,	 3
	set	0x1C, %o5
	stba	%i0,	[%l7 + %o5] 0xe2
	membar	#Sync
	nop
	set	0x6C, %o3
	lduw	[%l7 + %o3],	%o0
	nop
	set	0x50, %o1
	stx	%o7,	[%l7 + %o1]
	nop
	set	0x3C, %o2
	lduw	[%l7 + %o2],	%i1
	set	0x58, %g7
	prefetcha	[%l7 + %g7] 0x80,	 2
	nop
	set	0x4D, %i4
	stb	%g5,	[%l7 + %i4]
	nop
	set	0x64, %l1
	prefetch	[%l7 + %l1],	 1
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%i4
	nop
	set	0x58, %i0
	stx	%fsr,	[%l7 + %i0]
	nop
	set	0x5F, %g4
	ldub	[%l7 + %g4],	%o3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%l4
	nop
	set	0x4E, %l3
	ldub	[%l7 + %l3],	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%o2
	nop
	set	0x18, %i2
	lduh	[%l7 + %i2],	%g1
	st	%f13,	[%l7 + 0x08]
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x81,	%i2
	set	0x1C, %i7
	stwa	%l2,	[%l7 + %i7] 0x88
	ld	[%l7 + 0x28],	%f7
	nop
	set	0x64, %g2
	swap	[%l7 + %g2],	%o4
	st	%f30,	[%l7 + 0x14]
	nop
	set	0x38, %l4
	stx	%l0,	[%l7 + %l4]
	nop
	set	0x66, %o7
	sth	%o5,	[%l7 + %o7]
	set	0x38, %i6
	stda	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x89,	%i6
	set	0x14, %i1
	sta	%f7,	[%l7 + %i1] 0x81
	ld	[%l7 + 0x40],	%f5
	or	%i5,	%g4,	%l1
	set	0x34, %l0
	swapa	[%l7 + %l0] 0x88,	%i3
	bge,pn	%xcc,	loop_198
	fpsub32	%f12,	%f24,	%f22
	or	%g3,	%o1,	%l6
	nop
	set	0x24, %o0
	swap	[%l7 + %o0],	%g7
loop_198:
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%g2
	ba	%icc,	loop_199
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f26
	set	0x60, %g6
	stda	%i0,	[%l7 + %g6] 0x80
loop_199:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%i1
	set	0x3C, %i3
	sta	%f13,	[%l7 + %i3] 0x89
	nop
	set	0x60, %o4
	stx	%l3,	[%l7 + %o4]
	set	0x60, %i5
	stxa	%o0,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f22
	fpadd32	%f20,	%f22,	%f0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf9
	membar	#Sync
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%g4
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%o3
	set	0x54, %o1
	lda	[%l7 + %o1] 0x88,	%f19
	nop
	set	0x40, %g7
	stx	%l5,	[%l7 + %g7]
	or	%l4,	%i4,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x88,	%o2,	%i7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g1,	%i2
	nop
	set	0x46, %i4
	ldsh	[%l7 + %i4],	%l2
	or	%o4,	%o5,	%g6
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x88,	%l0
	nop
	set	0x2C, %g1
	swap	[%l7 + %g1],	%i5
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x89,	%i6
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x89
	set	0x45, %l3
	stba	%g4,	[%l7 + %l3] 0x88
	set	0x78, %i2
	stxa	%i3,	[%l7 + %i2] 0x89
	nop
	nop
	setx	0x868382B7D6B59F54,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x82BCC2F9B13D4930,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f0
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x89
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%f16
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f16
	nop
	set	0x08, %l5
	stw	%l1,	[%l7 + %l5]
	nop
	set	0x6C, %l4
	stb	%g3,	[%l7 + %l4]
	nop
	set	0x1C, %i6
	lduw	[%l7 + %i6],	%l6
	set	0x30, %o7
	ldda	[%l7 + %o7] 0xe3,	%g6
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x88,	%o0
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x81,	%g2
	set	0x38, %l0
	stha	%i0,	[%l7 + %l0] 0x88
	set	0x59, %l2
	stba	%o7,	[%l7 + %l2] 0xeb
	membar	#Sync
	set	0x48, %l6
	stda	%l2,	[%l7 + %l6] 0xeb
	membar	#Sync
	nop
	set	0x13, %o0
	ldstub	[%l7 + %o0],	%o0
	nop
	set	0x14, %g6
	stw	%g5,	[%l7 + %g6]
	nop
	set	0x53, %i3
	ldsb	[%l7 + %i3],	%o3
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%f14
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xd2
	nop
	set	0x20, %o3
	ldsh	[%l7 + %o3],	%l5
	nop
	set	0x36, %o4
	sth	%l4,	[%l7 + %o4]
	st	%fsr,	[%l7 + 0x5C]
	add	%i4,	%o6,	%i1
	nop
	set	0x60, %o2
	std	%f14,	[%l7 + %o2]
	set	0x58, %g3
	prefetcha	[%l7 + %g3] 0x89,	 1
	set	0x24, %o1
	ldstuba	[%l7 + %o1] 0x80,	%o2
	set	0x28, %i4
	ldxa	[%l7 + %i4] 0x89,	%i2
	nop
	set	0x0B, %g7
	ldsb	[%l7 + %g7],	%g1
	set	0x40, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0
	set	0x60, %g1
	sta	%f1,	[%l7 + %g1] 0x89
	wr	%o5,	%g6,	%ccr
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x81,	 0
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%i5
	set	0x48, %i2
	stda	%i6,	[%l7 + %i2] 0xea
	membar	#Sync
	set	0x30, %l3
	stxa	%g4,	[%l7 + %l3] 0x89
	add	%l2,	%l1,	%g3
	nop
	set	0x4E, %i7
	stb	%l6,	[%l7 + %i7]
	nop
	set	0x12, %g5
	lduh	[%l7 + %g5],	%g7
	nop
	set	0x20, %l5
	swap	[%l7 + %l5],	%o1
	add	%i3,	%i0,	%g2
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%o7
	nop
	set	0x34, %i6
	ldsb	[%l7 + %i6],	%o0
	fpsub16s	%f13,	%f6,	%f21
	fpadd16s	%f0,	%f27,	%f16
	set	0x68, %l4
	stxa	%g5,	[%l7 + %l4] 0xe2
	membar	#Sync
	set	0x7C, %o6
	sta	%f23,	[%l7 + %o6] 0x80
	set	0x68, %o7
	swapa	[%l7 + %o7] 0x80,	%o3
	nop
	set	0x50, %i1
	lduh	[%l7 + %i1],	%l3
	set	0x1C, %l2
	lda	[%l7 + %l2] 0x80,	%f24
	set	0x54, %l6
	stwa	%l5,	[%l7 + %l6] 0x88
	nop
	set	0x58, %l0
	stx	%l4,	[%l7 + %l0]
	fpsub32	%f8,	%f12,	%f12
	add	%o6,	%i1,	%i7
	st	%f27,	[%l7 + 0x24]
	nop
	set	0x51, %o0
	ldstub	[%l7 + %o0],	%o2
	add	%i4,	%i2,	%g1
	nop
	set	0x54, %g6
	swap	[%l7 + %g6],	%o5
	nop
	set	0x5C, %i3
	swap	[%l7 + %i3],	%g6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x81
	nop
	set	0x62, %o5
	ldub	[%l7 + %o5],	%o4
	nop
	set	0x7A, %o4
	ldsb	[%l7 + %o4],	%l0
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0xf1
	membar	#Sync
	add	%i6,	%i5,	%l2
	st	%f14,	[%l7 + 0x24]
	set	0x10, %o3
	ldda	[%l7 + %o3] 0x88,	%g4
	nop
	set	0x24, %o1
	swap	[%l7 + %o1],	%l1
	st	%fsr,	[%l7 + 0x38]
	set	0x10, %i4
	stxa	%l6,	[%l7 + %i4] 0x81
	set	0x60, %g3
	lda	[%l7 + %g3] 0x81,	%f17
	set	0x74, %l1
	stwa	%g3,	[%l7 + %l1] 0x89
	nop
	set	0x40, %g7
	prefetch	[%l7 + %g7],	 1
	st	%f15,	[%l7 + 0x48]
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%o1
	nop
	set	0x58, %g4
	std	%f16,	[%l7 + %g4]
	wr	%i3,	%g7,	%clear_softint
	wr	%i0,	%g2,	%softint
	nop
	set	0x7C, %g1
	ldsh	[%l7 + %g1],	%o7
	nop
	set	0x28, %l3
	stx	%fsr,	[%l7 + %l3]
	nop
	set	0x50, %i2
	ldx	[%l7 + %i2],	%g5
	wr	%o0,	%o3,	%pic
	nop
	set	0x7C, %g5
	sth	%l5,	[%l7 + %g5]
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%l4
	st	%fsr,	[%l7 + 0x38]
	ld	[%l7 + 0x6C],	%f24
	ld	[%l7 + 0x14],	%f3
	st	%f24,	[%l7 + 0x28]
	nop
	set	0x7D, %g2
	ldstub	[%l7 + %g2],	%o6
	st	%fsr,	[%l7 + 0x74]
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l3,	%i7
	wr	%o2,	%i1,	%pic
	set	0x3C, %i7
	stha	%i2,	[%l7 + %i7] 0x80
	nop
	set	0x60, %l4
	lduh	[%l7 + %l4],	%i4
	set	0x10, %o6
	stda	%o4,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x18, %i6
	std	%f2,	[%l7 + %i6]
	nop
	set	0x7C, %o7
	prefetch	[%l7 + %o7],	 2
	set	0x62, %l2
	stha	%g1,	[%l7 + %l2] 0x88
	st	%f1,	[%l7 + 0x10]
	nop
	set	0x16, %i1
	ldstub	[%l7 + %i1],	%g6
	nop
	set	0x4E, %l6
	stb	%l0,	[%l7 + %l6]
	nop
	set	0x2C, %o0
	lduh	[%l7 + %o0],	%i6
	nop
	set	0x67, %g6
	stb	%o4,	[%l7 + %g6]
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f28
	set	0x2E, %i5
	stba	%i5,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x2E, %i3
	ldsh	[%l7 + %i3],	%g4
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x80,	 0
	set	0x2C, %o2
	stwa	%l1,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x18, %o3
	stda	%g2,	[%l7 + %o3] 0xe3
	membar	#Sync
	nop
	set	0x78, %o1
	ldsw	[%l7 + %o1],	%l6
	nop
	set	0x77, %i4
	ldsb	[%l7 + %i4],	%o1
	nop
	set	0x10, %o4
	stx	%fsr,	[%l7 + %o4]
	nop
	set	0x38, %l1
	ldd	[%l7 + %l1],	%f26
	and	%i3,	%g7,	%g2
	st	%fsr,	[%l7 + 0x20]
	nop
	set	0x58, %g7
	sth	%i0,	[%l7 + %g7]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x89,	%g5,	%o7
	nop
	set	0x4C, %g3
	ldsh	[%l7 + %g3],	%o3
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x81,	 1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%o6
	nop
	set	0x7A, %g1
	lduh	[%l7 + %g1],	%l3
	nop
	set	0x1C, %i0
	stw	%i7,	[%l7 + %i0]
	st	%f0,	[%l7 + 0x28]
	ld	[%l7 + 0x44],	%f16
	nop
	set	0x70, %l3
	std	%f0,	[%l7 + %l3]
	nop
	set	0x52, %i2
	sth	%o2,	[%l7 + %i2]
	nop
	set	0x08, %g5
	ldsw	[%l7 + %g5],	%o0
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xc4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%i4
	nop
	set	0x3C, %l5
	swap	[%l7 + %l5],	%i2
	nop
	set	0x12, %i7
	ldsb	[%l7 + %i7],	%g1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%o5
	nop
	set	0x70, %l4
	ldd	[%l7 + %l4],	%f22
	set	0x70, %i6
	prefetcha	[%l7 + %i6] 0x81,	 3
	set	0x4C, %o6
	lda	[%l7 + %o6] 0x89,	%f13
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf9,	%f16
	nop
	set	0x60, %i1
	lduw	[%l7 + %i1],	%o4
	nop
	set	0x60, %l6
	swap	[%l7 + %l6],	%l0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xd0,	%f0
	nop
	set	0x54, %o0
	ldsw	[%l7 + %o0],	%g4
	set	0x48, %l0
	ldxa	[%l7 + %l0] 0x89,	%i5
	set	0x50, %i5
	ldxa	[%l7 + %i5] 0x81,	%l2
	set	0x20, %g6
	sta	%f15,	[%l7 + %g6] 0x80
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf0
	membar	#Sync
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x73, %o2
	stba	%g3,	[%l7 + %o2] 0xea
	membar	#Sync
	or	%l6,	%l1,	%o1
	nop
	set	0x46, %o1
	stb	%i3,	[%l7 + %o1]
	nop
	set	0x18, %i4
	stx	%fsr,	[%l7 + %i4]
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%g2
	set	0x60, %l1
	stwa	%g7,	[%l7 + %l1] 0x89
	nop
	set	0x64, %g7
	sth	%i0,	[%l7 + %g7]
	and	%o7,	%g5,	%o3
	nop
	set	0x18, %g3
	std	%f0,	[%l7 + %g3]
	nop
	nop
	setx	0x23C7ABB0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x1C7944F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f18,	%f26
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%l5
	nop
	set	0x14, %g1
	stw	%l4,	[%l7 + %g1]
	nop
	set	0x54, %o3
	ldsh	[%l7 + %o3],	%o6
	set	0x18, %l3
	stda	%i6,	[%l7 + %l3] 0xeb
	membar	#Sync
	st	%fsr,	[%l7 + 0x54]
	set	0x50, %i2
	stha	%o2,	[%l7 + %i2] 0xeb
	membar	#Sync
	nop
	set	0x24, %i0
	lduw	[%l7 + %i0],	%o0
	and	%i1,	%l3,	%i4
	nop
	set	0x08, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x4C, %g2
	stha	%i2,	[%l7 + %g2] 0x88
	set	0x1B, %l5
	stba	%g6,	[%l7 + %l5] 0xea
	membar	#Sync
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%o5
	nop
	set	0x1C, %l4
	lduw	[%l7 + %l4],	%g1
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%o4
	nop
	set	0x13, %o7
	stb	%l0,	[%l7 + %o7]
	nop
	set	0x60, %i1
	stx	%i6,	[%l7 + %i1]
	ble	%icc,	loop_200
	nop
	set	0x70, %o6
	ldd	[%l7 + %o6],	%f0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g4,	%i5
loop_200:
	nop
	set	0x19, %l6
	stb	%g3,	[%l7 + %l6]
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf8,	%f16
	set	0x70, %l2
	stwa	%l2,	[%l7 + %l2] 0x80
	nop
	set	0x68, %i5
	stx	%l6,	[%l7 + %i5]
	nop
	set	0x08, %g6
	prefetch	[%l7 + %g6],	 3
	set	0x4A, %o5
	ldstuba	[%l7 + %o5] 0x89,	%l1
	nop
	set	0x4C, %i3
	stw	%o1,	[%l7 + %i3]
	nop
	set	0x78, %l0
	prefetch	[%l7 + %l0],	 1
	set	0x48, %o1
	sta	%f31,	[%l7 + %o1] 0x88
	fpadd16s	%f17,	%f13,	%f10
	or	%g2,	%i3,	%g7
	ld	[%l7 + 0x58],	%f24
	nop
	set	0x38, %i4
	std	%f22,	[%l7 + %i4]
	set	0x24, %o2
	sta	%f7,	[%l7 + %o2] 0x88
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf9,	%f16
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%g5
	nop
	set	0x12, %g7
	lduh	[%l7 + %g7],	%l5
	st	%fsr,	[%l7 + 0x08]
	set	0x7C, %g3
	stwa	%l4,	[%l7 + %g3] 0x89
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%o3
	nop
	set	0x24, %g4
	stw	%i7,	[%l7 + %g4]
	nop
	set	0x1C, %l3
	stb	%o2,	[%l7 + %l3]
	fpsub32	%f26,	%f22,	%f24
	set	0x10, %o3
	stwa	%o6,	[%l7 + %o3] 0xeb
	membar	#Sync
	or	%i1,	%o0,	%i4
	nop
	set	0x76, %i0
	ldsh	[%l7 + %i0],	%i2
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x88,	 2
	set	0x38, %g5
	stxa	%o5,	[%l7 + %g5] 0xe3
	membar	#Sync
	nop
	set	0x1B, %l5
	ldstub	[%l7 + %l5],	%g6
	st	%fsr,	[%l7 + 0x6C]
	nop
	set	0x36, %g2
	ldsh	[%l7 + %g2],	%o4
	set	0x39, %i7
	ldstuba	[%l7 + %i7] 0x81,	%g1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xda,	%f0
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%l0
	set	0x50, %o7
	stda	%g4,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x80,	%i6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%l2
	st	%f30,	[%l7 + 0x68]
	st	%f17,	[%l7 + 0x10]
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f8
	set	0x68, %o0
	stxa	%g3,	[%l7 + %o0] 0x89
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l1,	%o1
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0xf1
	membar	#Sync
	nop
	set	0x48, %l2
	stx	%l6,	[%l7 + %l2]
	nop
	set	0x7A, %g6
	ldstub	[%l7 + %g6],	%g2
	nop
	set	0x50, %o5
	std	%f6,	[%l7 + %o5]
	nop
	set	0x20, %i3
	lduw	[%l7 + %i3],	%g7
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x89,	%i0
	set	0x30, %o1
	stda	%o6,	[%l7 + %o1] 0xea
	membar	#Sync
	nop
	set	0x40, %i4
	ldd	[%l7 + %i4],	%i2
	set	0x2C, %i5
	swapa	[%l7 + %i5] 0x88,	%l5
	ld	[%l7 + 0x24],	%f25
	set	0x44, %o2
	sta	%f28,	[%l7 + %o2] 0x81
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f0
	nop
	set	0x78, %g7
	stw	%l4,	[%l7 + %g7]
	nop
	set	0x10, %g3
	std	%g4,	[%l7 + %g3]
	nop
	set	0x62, %g1
	ldsh	[%l7 + %g1],	%o3
	nop
	set	0x40, %g4
	ldd	[%l7 + %g4],	%i6
	set	0x78, %o4
	stwa	%o2,	[%l7 + %o4] 0x81
	nop
	set	0x0E, %l3
	sth	%o6,	[%l7 + %l3]
	set	0x08, %o3
	stda	%o0,	[%l7 + %o3] 0xeb
	membar	#Sync
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x89,	 2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%l3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%g6
	nop
	set	0x35, %g5
	ldub	[%l7 + %g5],	%o5
	nop
	set	0x58, %l5
	stw	%o4,	[%l7 + %l5]
	nop
	set	0x60, %i2
	std	%f28,	[%l7 + %i2]
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l0
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f16
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x88,	%g4
	set	0x20, %l4
	ldda	[%l7 + %l4] 0xea,	%i4
	st	%fsr,	[%l7 + 0x24]
	or	%l2,	%i6,	%l1
	set	0x4A, %i6
	stha	%g3,	[%l7 + %i6] 0xea
	membar	#Sync
	set	0x28, %o6
	stwa	%l6,	[%l7 + %o6] 0x89
	nop
	set	0x48, %o7
	stx	%g2,	[%l7 + %o7]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x88,	%o7,	%o1
	nop
	set	0x0B, %l6
	stb	%i3,	[%l7 + %l6]
	nop
	set	0x39, %o0
	ldsb	[%l7 + %o0],	%l4
	set	0x48, %l2
	swapa	[%l7 + %l2] 0x88,	%g5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x80,	%o3,	%i7
	set	0x0C, %i1
	swapa	[%l7 + %i1] 0x80,	%o2
	or	%l5,	%o6,	%i1
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x88,	%o0
	nop
	set	0x20, %i3
	std	%f4,	[%l7 + %i3]
	nop
	set	0x30, %l0
	ldstub	[%l7 + %l0],	%l3
	add	%i4,	%i2,	%o5
	or	%g6,	%g1,	%o4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x81,	%g4,	%l0
	nop
	set	0x20, %o5
	swap	[%l7 + %o5],	%i5
	nop
	set	0x44, %o1
	swap	[%l7 + %o1],	%l2
	nop
	set	0x78, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	bl,a	%icc,	loop_201
	nop
	set	0x3B, %i5
	stb	%i6,	[%l7 + %i5]
	nop
	set	0x10, %g7
	stw	%l1,	[%l7 + %g7]
	ld	[%l7 + 0x74],	%f29
loop_201:
	nop
	set	0x60, %l1
	std	%f16,	[%l7 + %l1]
	nop
	set	0x74, %g1
	prefetch	[%l7 + %g1],	 2
	set	0x41, %g3
	ldstuba	[%l7 + %g3] 0x81,	%g3
	nop
	set	0x4B, %o4
	stb	%g2,	[%l7 + %o4]
	nop
	set	0x7A, %g4
	sth	%l6,	[%l7 + %g4]
	nop
	set	0x62, %o3
	lduh	[%l7 + %o3],	%g7
	nop
	set	0x60, %l3
	sth	%o7,	[%l7 + %l3]
	add	%o1,	%i0,	%i3
	nop
	set	0x2C, %g5
	sth	%g5,	[%l7 + %g5]
	st	%fsr,	[%l7 + 0x4C]
	set	0x68, %l5
	stwa	%o3,	[%l7 + %l5] 0x81
	nop
	set	0x74, %i2
	stw	%i7,	[%l7 + %i2]
	nop
	set	0x41, %g2
	ldsb	[%l7 + %g2],	%o2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%l4
	nop
	set	0x50, %i0
	ldsb	[%l7 + %i0],	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%l3
	add	%o0,	%i2,	%i4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o5,	%g1
	nop
	set	0x42, %i7
	lduh	[%l7 + %i7],	%g6
	set	0x79, %i6
	stba	%o4,	[%l7 + %i6] 0x89
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%i5
	set	0x10, %o6
	lda	[%l7 + %o6] 0x89,	%f1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f0
	nop
	set	0x5C, %l4
	ldsh	[%l7 + %l4],	%l0
	nop
	set	0x6C, %o0
	stw	%i6,	[%l7 + %o0]
	nop
	set	0x70, %l2
	ldsh	[%l7 + %l2],	%l2
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%l1
	set	0x7C, %g6
	lda	[%l7 + %g6] 0x80,	%f8
	add	%g3,	%l6,	%g7
	nop
	set	0x68, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x78, %i1
	swap	[%l7 + %i1],	%o7
	fpadd32	%f30,	%f6,	%f14
	nop
	set	0x78, %o5
	std	%o0,	[%l7 + %o5]
	or	%g2,	%i3,	%g5
	set	0x20, %o1
	prefetcha	[%l7 + %o1] 0x80,	 3
	bl,a,pn	%xcc,	loop_202
	nop
	set	0x20, %l0
	ldx	[%l7 + %l0],	%i0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x18, %i4
	ldx	[%l7 + %i4],	%l5
loop_202:
	nop
	set	0x58, %o2
	stxa	%i1,	[%l7 + %o2] 0xeb
	membar	#Sync
	st	%f23,	[%l7 + 0x1C]
	nop
	set	0x59, %i5
	ldsb	[%l7 + %i5],	%l4
	nop
	set	0x58, %l1
	ldub	[%l7 + %l1],	%l3
	nop
	set	0x40, %g7
	std	%f0,	[%l7 + %g7]
	fpadd32s	%f26,	%f13,	%f2
	set	0x18, %g3
	stda	%o0,	[%l7 + %g3] 0xe3
	membar	#Sync
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x80,	%o6
	nop
	set	0x64, %o4
	ldsw	[%l7 + %o4],	%i4
	nop
	set	0x66, %g4
	ldsh	[%l7 + %g4],	%o5
	wr	%i2,	%g1,	%ccr
	ld	[%l7 + 0x48],	%f19
	set	0x18, %l3
	stxa	%o4,	[%l7 + %l3] 0x89
	nop
	set	0x0C, %o3
	ldsw	[%l7 + %o3],	%g4
	nop
	set	0x14, %g5
	stb	%i5,	[%l7 + %g5]
	nop
	set	0x10, %i2
	std	%f24,	[%l7 + %i2]
	bleu	%icc,	loop_203
	nop
	set	0x08, %g2
	stb	%g6,	[%l7 + %g2]
	nop
	set	0x38, %i0
	ldsw	[%l7 + %i0],	%l0
	nop
	set	0x48, %l5
	std	%i6,	[%l7 + %l5]
loop_203:
	nop
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x88,	%l0
	nop
	set	0x68, %i6
	ldsb	[%l7 + %i6],	%l2
	nop
	set	0x3C, %o6
	sth	%g3,	[%l7 + %o6]
	nop
	set	0x58, %o7
	lduh	[%l7 + %o7],	%g7
	set	0x50, %l4
	ldda	[%l7 + %l4] 0xea,	%o6
	or	%l6,	%g2,	%i3
	nop
	set	0x38, %l2
	ldx	[%l7 + %l2],	%g5
	nop
	set	0x38, %o0
	stx	%o3,	[%l7 + %o0]
	nop
	set	0x74, %g6
	sth	%o1,	[%l7 + %g6]
	st	%f15,	[%l7 + 0x3C]
	or	%o2,	%i0,	%i7
	ld	[%l7 + 0x3C],	%f10
	wr	%l5,	%i1,	%pic
	nop
	set	0x58, %i3
	std	%l4,	[%l7 + %i3]
	st	%f0,	[%l7 + 0x54]
	nop
	set	0x7C, %i1
	lduw	[%l7 + %i1],	%l3
	nop
	set	0x78, %o5
	std	%f4,	[%l7 + %o5]
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x88,	%f16
	nop
	set	0x38, %l0
	stx	%o6,	[%l7 + %l0]
	nop
	set	0x0E, %l6
	ldub	[%l7 + %l6],	%i4
	nop
	set	0x48, %i4
	prefetch	[%l7 + %i4],	 0
	nop
	set	0x16, %o2
	ldub	[%l7 + %o2],	%o0
	set	0x10, %l1
	stwa	%i2,	[%l7 + %l1] 0xe3
	membar	#Sync
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%o5
	nop
	set	0x14, %g7
	ldstub	[%l7 + %g7],	%g4
	set	0x40, %g3
	stda	%i4,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x64, %i5
	ldsw	[%l7 + %i5],	%o4
	set	0x74, %o4
	stwa	%l0,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x20, %g1
	stx	%g6,	[%l7 + %g1]
	nop
	nop
	setx	0xDE9D7B787361AA68,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0A9ECC2F51D26E82,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f8
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x89,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%i6
	set	0x30, %o3
	stxa	%g3,	[%l7 + %o3] 0xe3
	membar	#Sync
	set	0x20, %g5
	stwa	%g7,	[%l7 + %g5] 0x89
	nop
	set	0x2E, %g4
	ldstub	[%l7 + %g4],	%l6
	set	0x40, %g2
	prefetcha	[%l7 + %g2] 0x89,	 1
	nop
	set	0x1E, %i0
	ldstub	[%l7 + %i0],	%g2
	nop
	set	0x44, %i2
	sth	%i3,	[%l7 + %i2]
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%o3
	set	0x40, %i7
	stda	%g4,	[%l7 + %i7] 0xe3
	membar	#Sync
	ld	[%l7 + 0x7C],	%f10
	set	0x79, %o6
	stba	%o1,	[%l7 + %o6] 0x88
	nop
	set	0x64, %o7
	stw	%o2,	[%l7 + %o7]
	nop
	set	0x30, %l4
	lduh	[%l7 + %l4],	%i0
	nop
	set	0x68, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x5C, %i6
	swap	[%l7 + %i6],	%l5
	set	0x3C, %o0
	stwa	%l4,	[%l7 + %o0] 0xea
	membar	#Sync
	nop
	set	0x27, %g6
	ldsb	[%l7 + %g6],	%l3
	nop
	set	0x2C, %i3
	ldsb	[%l7 + %i3],	%i1
	nop
	set	0x1C, %i1
	swap	[%l7 + %i1],	%o6
	nop
	set	0x18, %o5
	std	%f2,	[%l7 + %o5]
	nop
	set	0x24, %l0
	swap	[%l7 + %l0],	%i4
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xe3,	%i2
	nop
	set	0x60, %l6
	ldsh	[%l7 + %l6],	%g1
	set	0x28, %i4
	stda	%o0,	[%l7 + %i4] 0x88
	set	0x60, %o2
	ldxa	[%l7 + %o2] 0x89,	%g4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf0
	membar	#Sync
	nop
	set	0x60, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x15, %i5
	stb	%o5,	[%l7 + %i5]
	add	%o4,	%l0,	%i5
	set	0x10, %o4
	ldstuba	[%l7 + %o4] 0x89,	%g6
	and	%l2,	%l1,	%g3
	nop
	set	0x0E, %g3
	lduh	[%l7 + %g3],	%i6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x58, %g1
	stx	%g7,	[%l7 + %g1]
	nop
	set	0x38, %o3
	swap	[%l7 + %o3],	%l6
	add	%o7,	%g2,	%i3
	set	0x38, %l3
	swapa	[%l7 + %l3] 0x88,	%o3
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%f26
	nop
	set	0x40, %g5
	lduw	[%l7 + %g5],	%g5
	nop
	set	0x3C, %i0
	stw	%o1,	[%l7 + %i0]
	nop
	set	0x49, %i2
	ldsb	[%l7 + %i2],	%i0
	wr	%o2,	%i7,	%ccr
	nop
	set	0x38, %g2
	ldsh	[%l7 + %g2],	%l5
	add	%l3,	%l4,	%i1
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x81
	set	0x18, %i7
	lda	[%l7 + %i7] 0x80,	%f23
	or	%o6,	%i4,	%g1
	set	0x68, %o6
	stda	%o0,	[%l7 + %o6] 0x81
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f0
	nop
	set	0x14, %o7
	ldsh	[%l7 + %o7],	%g4
	set	0x24, %i6
	lda	[%l7 + %i6] 0x80,	%f22
	set	0x44, %o0
	sta	%f21,	[%l7 + %o0] 0x81
	set	0x3C, %l2
	swapa	[%l7 + %l2] 0x89,	%o5
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
	or	%o4,	%i2,	%i5
	wr	%l0,	%g6,	%softint
	set	0x64, %i1
	lda	[%l7 + %i1] 0x88,	%f29
	set	0x12, %o5
	stha	%l1,	[%l7 + %o5] 0xea
	membar	#Sync
	add	%g3,	%l2,	%g7
	set	0x14, %l0
	swapa	[%l7 + %l0] 0x81,	%l6
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%i6
	nop
	set	0x30, %l6
	sth	%o7,	[%l7 + %l6]
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0xc2
	st	%f0,	[%l7 + 0x0C]
	or	%g2,	%o3,	%i3
	nop
	set	0x60, %o1
	std	%g4,	[%l7 + %o1]
	nop
	set	0x7C, %o2
	swap	[%l7 + %o2],	%o1
	nop
	set	0x7E, %l1
	sth	%o2,	[%l7 + %l1]
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x89,	 1
	st	%f14,	[%l7 + 0x08]
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l5
	nop
	set	0x28, %g7
	ldsh	[%l7 + %g7],	%l4
	and	%l3,	%o6,	%i1
	nop
	set	0x7C, %g1
	ldsw	[%l7 + %g1],	%g1
	nop
	set	0x08, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x38, %l3
	ldxa	[%l7 + %l3] 0x80,	%i4
	nop
	set	0x68, %g4
	swap	[%l7 + %g4],	%o0
	set	0x68, %g3
	swapa	[%l7 + %g3] 0x88,	%g4
	nop
	set	0x38, %i0
	stx	%o5,	[%l7 + %i0]
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%i2
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%o4
	set	0x40, %l5
	sta	%f26,	[%l7 + %l5] 0x88
	add	%l0,	%g6,	%i5
	set	0x70, %g2
	stxa	%l1,	[%l7 + %g2] 0x89
	fpsub32	%f0,	%f10,	%f20
	set	0x08, %i7
	stwa	%l2,	[%l7 + %i7] 0xeb
	membar	#Sync
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g7,	%g3
	nop
	set	0x60, %l4
	std	%i6,	[%l7 + %l4]
	set	0x3C, %o7
	swapa	[%l7 + %o7] 0x80,	%i6
	fpadd32s	%f4,	%f27,	%f12
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf8
	membar	#Sync
	nop
	set	0x28, %o0
	ldx	[%l7 + %o0],	%o7
	nop
	set	0x70, %l2
	stx	%o3,	[%l7 + %l2]
	nop
	set	0x78, %i6
	std	%g2,	[%l7 + %i6]
	nop
	set	0x68, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%g5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%o1
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x81,	%i7
	nop
	set	0x30, %i1
	ldd	[%l7 + %i1],	%f12
	nop
	set	0x4C, %l6
	ldstub	[%l7 + %l6],	%o2
	set	0x68, %i3
	ldxa	[%l7 + %i3] 0x89,	%l5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xd2
	nop
	nop
	setx	0x35C5410E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x386601B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f22,	%f17
	nop
	set	0x14, %o2
	lduw	[%l7 + %o2],	%i0
	nop
	set	0x0A, %l1
	ldub	[%l7 + %l1],	%l3
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%l4
	nop
	set	0x33, %i4
	stb	%i1,	[%l7 + %i4]
	nop
	set	0x78, %g7
	ldd	[%l7 + %g7],	%g0
	nop
	set	0x4D, %o4
	ldub	[%l7 + %o4],	%i4
	set	0x3C, %o3
	stba	%o6,	[%l7 + %o3] 0x89
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%f20
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o5
	nop
	set	0x38, %g4
	std	%i2,	[%l7 + %g4]
	nop
	set	0x7A, %l3
	stb	%o0,	[%l7 + %l3]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%g6
	nop
	set	0x29, %g3
	ldsb	[%l7 + %g3],	%i5
	set	0x14, %i0
	sta	%f3,	[%l7 + %i0] 0x80
	nop
	set	0x58, %g5
	stw	%l1,	[%l7 + %g5]
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x80,	%l0
	set	0x38, %g2
	swapa	[%l7 + %g2] 0x88,	%g7
	set	0x58, %i7
	stxa	%l2,	[%l7 + %i7] 0x80
	nop
	set	0x30, %l5
	lduw	[%l7 + %l5],	%l6
	nop
	set	0x1D, %o7
	ldsb	[%l7 + %o7],	%g3
	set	0x28, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x81,	%f0
	nop
	set	0x08, %o6
	prefetch	[%l7 + %o6],	 0
	nop
	set	0x4D, %l2
	ldsb	[%l7 + %l2],	%o7
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x88,	 4
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0xf9
	membar	#Sync
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	nop
	set	0x08, %l0
	lduh	[%l7 + %l0],	%o1
	nop
	set	0x08, %o5
	ldd	[%l7 + %o5],	%i6
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x80,	%g4
	add	%l5,	%i0,	%o2
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x88,	%l3
	st	%fsr,	[%l7 + 0x1C]
	nop
	set	0x1B, %i3
	ldsb	[%l7 + %i3],	%l4
	set	0x24, %o2
	swapa	[%l7 + %o2] 0x89,	%g1
	set	0x70, %o1
	ldxa	[%l7 + %o1] 0x89,	%i4
	set	0x2A, %i5
	stha	%i1,	[%l7 + %i5] 0x89
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	and	%o6,	%g4,	%i2
	nop
	set	0x49, %g7
	ldstub	[%l7 + %g7],	%o0
	set	0x60, %o4
	ldxa	[%l7 + %o4] 0x80,	%o4
	set	0x4C, %o3
	lda	[%l7 + %o3] 0x89,	%f8
	nop
	set	0x10, %i4
	ldd	[%l7 + %i4],	%f20
	nop
	set	0x68, %g4
	stx	%fsr,	[%l7 + %g4]
	add	%o5,	%g6,	%i5
	nop
	set	0x60, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x0C, %g1
	stha	%l1,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x3C, %g3
	stw	%l0,	[%l7 + %g3]
	or	%g7,	%l6,	%g3
	set	0x69, %i0
	stba	%i6,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x30, %g5
	ldxa	[%l7 + %g5] 0x89,	%o7
	set	0x40, %i2
	sta	%f13,	[%l7 + %i2] 0x81
	set	0x20, %i7
	stwa	%o3,	[%l7 + %i7] 0xe2
	membar	#Sync
	nop
	set	0x44, %l5
	sth	%g2,	[%l7 + %l5]
	set	0x78, %g2
	prefetcha	[%l7 + %g2] 0x88,	 3
	ld	[%l7 + 0x28],	%f23
	set	0x15, %o7
	ldstuba	[%l7 + %o7] 0x80,	%o1
	nop
	set	0x7E, %o0
	ldsh	[%l7 + %o0],	%i3
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x88,	%g5
	nop
	set	0x18, %l4
	stx	%i7,	[%l7 + %l4]
	set	0x74, %g6
	sta	%f17,	[%l7 + %g6] 0x88
	ld	[%l7 + 0x38],	%f27
	nop
	set	0x48, %i6
	ldsw	[%l7 + %i6],	%i0
	nop
	set	0x08, %l2
	lduw	[%l7 + %l2],	%l5
	and	%l3,	%l4,	%o2
	set	0x18, %l0
	ldstuba	[%l7 + %l0] 0x81,	%i4
	set	0x1B, %o5
	stba	%i1,	[%l7 + %o5] 0x81
	set	0x70, %l6
	prefetcha	[%l7 + %l6] 0x80,	 2
	nop
	set	0x18, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x78, %o2
	std	%g4,	[%l7 + %o2]
	nop
	set	0x20, %o1
	ldx	[%l7 + %o1],	%o0
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	ld	[%l7 + 0x28],	%f22
	nop
	set	0x40, %i5
	std	%f8,	[%l7 + %i5]
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%i2
	nop
	set	0x18, %o4
	stx	%o5,	[%l7 + %o4]
	set	0x44, %g7
	swapa	[%l7 + %g7] 0x89,	%o4
	nop
	set	0x50, %o3
	stx	%fsr,	[%l7 + %o3]
	or	%g6,	%l1,	%i5
	nop
	set	0x40, %g4
	std	%l0,	[%l7 + %g4]
	nop
	set	0x6C, %l3
	prefetch	[%l7 + %l3],	 4
	nop
	set	0x18, %i4
	stx	%g7,	[%l7 + %i4]
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%l6
	nop
	set	0x7C, %g1
	ldsb	[%l7 + %g1],	%i6
	nop
	set	0x2C, %i0
	lduw	[%l7 + %i0],	%g3
	nop
	set	0x68, %g5
	ldx	[%l7 + %g5],	%o7
	nop
	set	0x33, %i7
	stb	%g2,	[%l7 + %i7]
	nop
	set	0x78, %i2
	std	%o2,	[%l7 + %i2]
	set	0x1C, %g2
	ldstuba	[%l7 + %g2] 0x89,	%o1
	set	0x64, %l5
	sta	%f17,	[%l7 + %l5] 0x81
	nop
	set	0x42, %o7
	ldsh	[%l7 + %o7],	%i3
	nop
	set	0x10, %o6
	lduw	[%l7 + %o6],	%l2
	add	%i7,	%i0,	%l5
	set	0x6A, %o0
	stha	%l3,	[%l7 + %o0] 0xeb
	membar	#Sync
	nop
	set	0x24, %l4
	ldstub	[%l7 + %l4],	%l4
	set	0x10, %g6
	stda	%o2,	[%l7 + %g6] 0x88
	set	0x2C, %l2
	lda	[%l7 + %l2] 0x80,	%f18
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i4,	%g5
	and	%g1,	%i1,	%g4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%o0
	nop
	set	0x7C, %i6
	sth	%i2,	[%l7 + %i6]
	nop
	set	0x38, %o5
	std	%o4,	[%l7 + %o5]
	nop
	set	0x1C, %l6
	lduh	[%l7 + %l6],	%g6
	nop
	set	0x40, %l0
	prefetch	[%l7 + %l0],	 0
	nop
	set	0x32, %i3
	lduh	[%l7 + %i3],	%l1
	nop
	set	0x70, %o1
	std	%f24,	[%l7 + %o1]
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%o4
	or	%l0,	%i5,	%l6
	nop
	set	0x14, %o2
	stb	%i6,	[%l7 + %o2]
	set	0x60, %i5
	stxa	%g3,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x18, %l1
	std	%g6,	[%l7 + %l1]
	nop
	set	0x48, %g7
	stx	%fsr,	[%l7 + %g7]
	set	0x0C, %o3
	ldstuba	[%l7 + %o3] 0x80,	%g2
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%o3
	nop
	set	0x7C, %l3
	ldsw	[%l7 + %l3],	%o7
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f12
	nop
	set	0x48, %g4
	ldx	[%l7 + %g4],	%o1
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f0
	nop
	set	0x40, %g3
	stx	%i3,	[%l7 + %g3]
	nop
	set	0x4E, %i0
	stb	%l2,	[%l7 + %i0]
	fpsub32s	%f0,	%f18,	%f20
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%f22
	set	0x70, %i7
	stxa	%i0,	[%l7 + %i7] 0x88
	set	0x2C, %g2
	stwa	%i7,	[%l7 + %g2] 0x80
	set	0x4C, %i2
	swapa	[%l7 + %i2] 0x88,	%l3
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0x48C, 	%tick_cmpr
	set	0x78, %o7
	swapa	[%l7 + %o7] 0x89,	%o2
	nop
	set	0x3F, %l5
	stb	%g5,	[%l7 + %l5]
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%g1
	add	%i1,	%g4,	%i4
	or	%o0,	%o6,	%o4
	nop
	set	0x30, %o0
	std	%f24,	[%l7 + %o0]
	nop
	set	0x66, %g6
	ldub	[%l7 + %g6],	%g6
	st	%f12,	[%l7 + 0x5C]
	nop
	set	0x40, %l2
	stx	%l1,	[%l7 + %l2]
	nop
	set	0x48, %l4
	stb	%o5,	[%l7 + %l4]
	set	0x56, %i6
	stba	%i2,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x20, %l6
	lduh	[%l7 + %l6],	%l0
	nop
	set	0x0F, %o5
	ldub	[%l7 + %o5],	%l6
	set	0x31, %l0
	ldstuba	[%l7 + %l0] 0x89,	%i6
	bge,a,pt	%icc,	loop_204
	nop
	set	0x38, %i3
	prefetch	[%l7 + %i3],	 1
	and	%g3,	%g7,	%i5
	nop
	set	0x48, %o1
	ldsh	[%l7 + %o1],	%o3
loop_204:
	nop
	set	0x32, %o2
	ldsb	[%l7 + %o2],	%g2
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x81,	%o1
	nop
	set	0x5D, %i5
	ldub	[%l7 + %i5],	%o7
	nop
	set	0x78, %g7
	ldsw	[%l7 + %g7],	%l2
	nop
	nop
	setx	0xF3843C57AF9C5498,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x176F5C1BEEC0C825,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f2
	st	%f6,	[%l7 + 0x6C]
	nop
	set	0x74, %l1
	lduw	[%l7 + %l1],	%i3
	nop
	set	0x68, %o3
	lduw	[%l7 + %o3],	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%l5
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 3
	fpsub16s	%f1,	%f10,	%f27
	and	%l4,	%o2,	%g5
	set	0x6A, %i4
	stha	%g1,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%i0
	nop
	set	0x20, %g4
	std	%g4,	[%l7 + %g4]
	set	0x5E, %g3
	stha	%i1,	[%l7 + %g3] 0xe2
	membar	#Sync
	nop
	nop
	setx	0x5DAAB7E0C862D3A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6C58A199F797C72B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f22,	%f12
	nop
	set	0x44, %i0
	lduw	[%l7 + %i0],	%i4
	st	%f20,	[%l7 + 0x40]
	add	%o6,	%o4,	%g6
	set	0x58, %g5
	stxa	%o0,	[%l7 + %g5] 0xea
	membar	#Sync
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%l1
	st	%f30,	[%l7 + 0x2C]
	nop
	set	0x7C, %g1
	stw	%l0,	[%l7 + %g1]
	ld	[%l7 + 0x7C],	%f23
	set	0x30, %g2
	ldxa	[%l7 + %g2] 0x81,	%i2
	nop
	set	0x54, %i2
	ldsh	[%l7 + %i2],	%l6
	nop
	set	0x28, %o7
	std	%f4,	[%l7 + %o7]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g3,	%i6
	set	0x2C, %l5
	lda	[%l7 + %l5] 0x81,	%f31
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%o3
	nop
	set	0x33, %o6
	stb	%i5,	[%l7 + %o6]
	st	%f9,	[%l7 + 0x4C]
	nop
	set	0x1C, %i7
	lduw	[%l7 + %i7],	%g2
	add	%o7,	%o1,	%l2
	set	0x60, %g6
	ldxa	[%l7 + %g6] 0x81,	%i3
	add	%i7,	%l3,	%l4
	nop
	set	0x70, %l2
	ldsh	[%l7 + %l2],	%o2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l5
	set	0x20, %o0
	lda	[%l7 + %o0] 0x89,	%f13
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x80
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd2,	%f0
	nop
	set	0x14, %o5
	lduh	[%l7 + %o5],	%i0
	wr	%g1,	%i1,	%y
	set	0x34, %l6
	stwa	%g4,	[%l7 + %l6] 0x80
	nop
	set	0x78, %i3
	std	%o6,	[%l7 + %i3]
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%o4
	nop
	set	0x74, %o2
	sth	%i4,	[%l7 + %o2]
	set	0x1C, %o1
	sta	%f1,	[%l7 + %o1] 0x89
	or	%o0,	%o5,	%g6
	set	0x58, %i1
	stda	%l0,	[%l7 + %i1] 0x81
	ld	[%l7 + 0x6C],	%f13
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x89,	%f16
	nop
	set	0x10, %g7
	stx	%fsr,	[%l7 + %g7]
	nop
	set	0x50, %o3
	stw	%l0,	[%l7 + %o3]
	nop
	set	0x50, %o4
	ldd	[%l7 + %o4],	%f28
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%g3
	wr	%l6,	%i6,	%softint
	st	%fsr,	[%l7 + 0x28]
	fpsub32	%f24,	%f16,	%f26
	nop
	set	0x66, %i4
	lduh	[%l7 + %i4],	%o3
	st	%f16,	[%l7 + 0x60]
	set	0x20, %l3
	stda	%g6,	[%l7 + %l3] 0x80
	set	0x19, %l1
	ldstuba	[%l7 + %l1] 0x89,	%i5
	set	0x72, %g4
	stba	%g2,	[%l7 + %g4] 0x81
	nop
	set	0x78, %g3
	stx	%o1,	[%l7 + %g3]
	nop
	set	0x08, %g5
	std	%f6,	[%l7 + %g5]
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x6C, %i0
	swap	[%l7 + %i0],	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i3,	%i7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x88,	%l3,	%o7
	st	%fsr,	[%l7 + 0x1C]
	st	%f25,	[%l7 + 0x24]
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe2,	%l4
	st	%f4,	[%l7 + 0x64]
	set	0x70, %o7
	ldxa	[%l7 + %o7] 0x80,	%o2
	nop
	set	0x5C, %g2
	stw	%l5,	[%l7 + %g2]
	nop
	set	0x50, %o6
	stx	%fsr,	[%l7 + %o6]
	nop
	set	0x20, %i7
	std	%i0,	[%l7 + %i7]
	set	0x48, %l5
	ldxa	[%l7 + %l5] 0x80,	%g5
	nop
	set	0x1C, %g6
	prefetch	[%l7 + %g6],	 1
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%i1
	nop
	set	0x51, %l2
	stb	%g1,	[%l7 + %l2]
	nop
	set	0x3E, %l4
	ldstub	[%l7 + %l4],	%g4
	nop
	set	0x6E, %i6
	ldsh	[%l7 + %i6],	%o6
	set	0x44, %l6
	lda	[%l7 + %l6] 0x89,	%f8
	nop
	set	0x2E, %i3
	sth	%o4,	[%l7 + %i3]
	set	0x4C, %l0
	lda	[%l7 + %l0] 0x89,	%f6
	nop
	set	0x42, %o5
	ldub	[%l7 + %o5],	%o0
	nop
	nop
	setx	0x5AA9ADE1595E9867,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD69D08F39880EAF9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f20,	%f28
	nop
	set	0x18, %o2
	sth	%i4,	[%l7 + %o2]
	nop
	set	0x57, %o1
	ldstub	[%l7 + %o1],	%g6
	nop
	set	0x6C, %i1
	stb	%o5,	[%l7 + %i1]
	set	0x28, %i5
	stda	%l0,	[%l7 + %i5] 0xe2
	membar	#Sync
	nop
	set	0x48, %g7
	ldsh	[%l7 + %g7],	%l0
	nop
	set	0x32, %o4
	ldsb	[%l7 + %o4],	%g3
	nop
	set	0x66, %o3
	ldsb	[%l7 + %o3],	%l6
	nop
	set	0x30, %l3
	std	%f14,	[%l7 + %l3]
	and	%i2,	%o3,	%g7
	nop
	set	0x26, %i4
	ldstub	[%l7 + %i4],	%i5
	nop
	set	0x44, %g4
	sth	%g2,	[%l7 + %g4]
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%l2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd0,	%f16
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%f28
	set	0x60, %g5
	ldda	[%l7 + %g5] 0xea,	%o0
	nop
	set	0x50, %g1
	std	%f22,	[%l7 + %g1]
	nop
	set	0x4C, %i0
	lduh	[%l7 + %i0],	%i7
	set	0x70, %i2
	stxa	%l3,	[%l7 + %i2] 0xe3
	membar	#Sync
	set	0x30, %g2
	stwa	%o7,	[%l7 + %g2] 0x88
	nop
	set	0x70, %o7
	stx	%fsr,	[%l7 + %o7]
	nop
	set	0x48, %o6
	std	%l4,	[%l7 + %o6]
	set	0x54, %i7
	swapa	[%l7 + %i7] 0x88,	%o2
	nop
	set	0x10, %g6
	std	%i2,	[%l7 + %g6]
	nop
	set	0x7A, %l5
	lduh	[%l7 + %l5],	%l5
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xda,	%f16
	add	%g5,	%i0,	%i1
	nop
	set	0x56, %o0
	sth	%g1,	[%l7 + %o0]
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%g4
	st	%f26,	[%l7 + 0x40]
	nop
	set	0x7C, %i6
	prefetch	[%l7 + %i6],	 2
	nop
	set	0x26, %i3
	sth	%o4,	[%l7 + %i3]
	st	%f6,	[%l7 + 0x68]
	and	%o6,	%i4,	%g6
	nop
	set	0x78, %l6
	swap	[%l7 + %l6],	%o0
	or	%o5,	%l1,	%g3
	set	0x40, %l0
	ldstuba	[%l7 + %l0] 0x81,	%l6
	fpadd16	%f2,	%f24,	%f14
	nop
	set	0x15, %o2
	ldstub	[%l7 + %o2],	%i2
	set	0x58, %o1
	lda	[%l7 + %o1] 0x81,	%f13
	nop
	set	0x25, %o5
	stb	%l0,	[%l7 + %o5]
	set	0x22, %i5
	stha	%o3,	[%l7 + %i5] 0xe2
	membar	#Sync
	and	%i5,	%g7,	%g2
	st	%f23,	[%l7 + 0x78]
	nop
	set	0x2C, %g7
	lduh	[%l7 + %g7],	%i6
	set	0x28, %i1
	stxa	%l2,	[%l7 + %i1] 0xe3
	membar	#Sync
	nop
	set	0x40, %o4
	lduw	[%l7 + %o4],	%o1
	nop
	set	0x14, %l3
	ldub	[%l7 + %l3],	%i7
	or	%o7,	%l3,	%o2
	nop
	set	0x14, %o3
	prefetch	[%l7 + %o3],	 3
	fpadd32s	%f4,	%f14,	%f13
	nop
	set	0x38, %i4
	std	%i2,	[%l7 + %i4]
	fpsub16s	%f6,	%f6,	%f26
	st	%fsr,	[%l7 + 0x78]
	nop
	set	0x38, %g4
	lduw	[%l7 + %g4],	%l5
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%f22
	set	0x60, %g5
	swapa	[%l7 + %g5] 0x81,	%g5
	nop
	set	0x6A, %g1
	stb	%i0,	[%l7 + %g1]
	set	0x78, %g3
	swapa	[%l7 + %g3] 0x80,	%i1
	set	0x48, %i2
	stda	%l4,	[%l7 + %i2] 0xea
	membar	#Sync
	ble,pt	%icc,	loop_205
	nop
	nop
	setx	0x56AACDD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x29025902,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f26,	%f31
	set	0x78, %g2
	ldxa	[%l7 + %g2] 0x81,	%g1
loop_205:
	nop
	set	0x68, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x18, %o6
	ldsw	[%l7 + %o6],	%g4
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%o4
	fpadd32s	%f10,	%f0,	%f10
	nop
	set	0x48, %g6
	stx	%i4,	[%l7 + %g6]
	nop
	set	0x48, %l5
	ldd	[%l7 + %l5],	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o0,	%o5
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%l0
	set	0x21, %o0
	ldstuba	[%l7 + %o0] 0x81,	%g6
	set	0x7B, %l4
	ldstuba	[%l7 + %l4] 0x80,	%g3
	st	%f19,	[%l7 + 0x20]
	set	0x38, %l2
	swapa	[%l7 + %l2] 0x80,	%i2
	st	%f1,	[%l7 + 0x60]
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l0,	%o3
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f18
	and	%l6,	%i5,	%g2
	nop
	set	0x3C, %i6
	swap	[%l7 + %i6],	%g7
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x81,	%l2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o1
	nop
	set	0x1A, %l6
	ldub	[%l7 + %l6],	%i7
	fpadd32s	%f29,	%f13,	%f3
	set	0x70, %o2
	stxa	%l3,	[%l7 + %o2] 0xeb
	membar	#Sync
	set	0x44, %o1
	lda	[%l7 + %o1] 0x89,	%f2
	set	0x5E, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o2
	set	0x20, %g7
	stha	%i3,	[%l7 + %g7] 0x89
	or	%l5,	%o7,	%i0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x80,	%i1,	%g5
	ld	[%l7 + 0x78],	%f18
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%g0
	nop
	set	0x4C, %i1
	ldsh	[%l7 + %i1],	%l4
	nop
	set	0x7C, %o4
	ldub	[%l7 + %o4],	%o4
	nop
	set	0x2D, %o3
	ldstub	[%l7 + %o3],	%g4
	nop
	set	0x5C, %i4
	ldsh	[%l7 + %i4],	%o6
	nop
	set	0x70, %l3
	ldsw	[%l7 + %l3],	%o0
	set	0x70, %g4
	stda	%i4,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x78, %l1
	stx	%fsr,	[%l7 + %l1]
	set	0x50, %g1
	stha	%l1,	[%l7 + %g1] 0xe3
	membar	#Sync
	nop
	set	0x48, %g3
	stx	%g6,	[%l7 + %g3]
	st	%fsr,	[%l7 + 0x34]
	set	0x30, %i2
	stda	%o4,	[%l7 + %i2] 0x88
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xc2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%l0
	nop
	set	0x43, %g5
	ldub	[%l7 + %g5],	%g3
	set	0x18, %o6
	lda	[%l7 + %o6] 0x81,	%f18
	wr	%o3,	%l6,	%set_softint
	nop
	set	0x5A, %o7
	sth	%g2,	[%l7 + %o7]
	nop
	set	0x4F, %i0
	ldub	[%l7 + %i0],	%g7
	set	0x48, %g6
	swapa	[%l7 + %g6] 0x80,	%l2
	set	0x1C, %i7
	sta	%f9,	[%l7 + %i7] 0x89
	set	0x0C, %o0
	stwa	%i6,	[%l7 + %o0] 0xe2
	membar	#Sync
	set	0x48, %l5
	stda	%i4,	[%l7 + %l5] 0xea
	membar	#Sync
	set	0x20, %l2
	sta	%f16,	[%l7 + %l2] 0x89
	nop
	set	0x42, %l4
	ldub	[%l7 + %l4],	%i7
	set	0x30, %i3
	ldxa	[%l7 + %i3] 0x89,	%l3
	nop
	set	0x68, %l0
	std	%f6,	[%l7 + %l0]
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x80,	%o2
	add	%i3,	%o1,	%o7
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%i0
	set	0x55, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i1
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x80,	%g5
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f0
	ble,pn	%icc,	loop_206
	nop
	set	0x60, %o5
	stx	%g1,	[%l7 + %o5]
	nop
	set	0x1C, %i1
	stb	%l5,	[%l7 + %i1]
	nop
	set	0x38, %g7
	std	%l4,	[%l7 + %g7]
loop_206:
	st	%f2,	[%l7 + 0x20]
	nop
	set	0x13, %o3
	ldstub	[%l7 + %o3],	%g4
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%o6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%i4
	set	, %i4
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 7:
!
!	Type l   	: 1287
!	Type a   	: 26
!	Type cti   	: 15
!	Type x   	: 511
!	Type f   	: 43
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
.word 0xD727D0DE
.word 0x46742D4A
.word 0xBE74A42C
.word 0x16AA4C7D
.word 0x6983D504
.word 0x39CB5A2C
.word 0x92223D68
.word 0x0C8171B4
.word 0x16E2EF24
.word 0x249998BE
.word 0xA4E4A3A6
.word 0xE8000E47
.word 0x80A50727
.word 0x84909772
.word 0xD04DF945
.word 0xFA1471FC
.word 0x7541A838
.word 0x6F90DDEA
.word 0x389A09E8
.word 0x33C0511D
.word 0x65724D45
.word 0x06DDBC1B
.word 0xDF6D05A2
.word 0x4214587A
.word 0xD5CED0DA
.word 0x5F748D22
.word 0x27806AB2
.word 0x0B721E17
.word 0xDE0125E5
.word 0x82050AD4
.word 0x7F44A8F5
.word 0x8A6D9A28
.word 0x7E0A9755
.word 0x921316CF
.word 0xFF418314
.word 0xEB773352
.word 0x35CA7EC3
.word 0x9E201C07
.word 0xC8B531EA
.word 0xF46F6738
.word 0xFBAF26E8
.word 0xDFA4CA48
.word 0x754B97B3
.word 0x7ADABBE8
.word 0x99B211CA
.word 0x9316CA09
.word 0xBD009DA1
.word 0x06DE4ADA
.word 0x12D6831C
.word 0x12F09D53
.word 0x52035945
.word 0x90568FF7
.word 0x046E9E0D
.word 0x859E419D
.word 0xB4C07BC7
.word 0x80C8C369
.word 0xCDB8EDA2
.word 0x73BE7623
.word 0xBBF77371
.word 0x233EC74B
.word 0x8108616E
.word 0xB9E38C95
.word 0xB64CAD20
.word 0x597F57B9
!! thread 1 data, 64 words.
.word 0x65A4EA32
.word 0xF602369C
.word 0x4C51985C
.word 0x980FC9E3
.word 0xD38772DB
.word 0x3CAC496B
.word 0xB421006E
.word 0xB73426CB
.word 0xF36B27B6
.word 0x3B3B7B6D
.word 0xD9D479B5
.word 0x59D619A7
.word 0xF9D446D4
.word 0x1B5CCEF1
.word 0x039707BE
.word 0x62EE17C9
.word 0xA38F37A1
.word 0x66EAE674
.word 0x4431AE94
.word 0xEAD6D161
.word 0x7177C2E7
.word 0xB1F6B7F0
.word 0x04CDC6A9
.word 0x35C5A884
.word 0x90C80F66
.word 0x121AE0AE
.word 0xBD620437
.word 0x87DE45B9
.word 0xC0B1CEC0
.word 0xFE17BE6D
.word 0xF4BE10C2
.word 0x28CEE144
.word 0x65AED21B
.word 0x6D4D0392
.word 0x1B70259E
.word 0x237354EA
.word 0x6C234CEE
.word 0x44A2EBE6
.word 0x3ADA9597
.word 0x160D2D30
.word 0x7CAD5327
.word 0xDB62CF6A
.word 0xA0D2E570
.word 0xDE9FC313
.word 0x43FECEA7
.word 0xAF7F6F15
.word 0x3383AEAA
.word 0xD632BF35
.word 0x6386254E
.word 0x034BF773
.word 0x6635C2E5
.word 0x3F0080FC
.word 0xCE6E317D
.word 0xD788E552
.word 0x816909D0
.word 0x3C39C385
.word 0x6E11DB7F
.word 0x81766223
.word 0x246F81F5
.word 0x32A1EBEE
.word 0x86B29FD1
.word 0x76C8919A
.word 0x4F964104
.word 0x7CFFE6C1
!! thread 2 data, 64 words.
.word 0x61EE63FC
.word 0x0575FFCA
.word 0x89EFDD21
.word 0x7B5FF584
.word 0xB3102799
.word 0xBD79D7C0
.word 0xA6A3577C
.word 0xD67AB3D7
.word 0x3B62187A
.word 0xC33ACEA3
.word 0x8ADA7591
.word 0x5D2AB364
.word 0xB5D04546
.word 0xFC5E5F5D
.word 0x075AE9FA
.word 0xC736F26C
.word 0x99904046
.word 0xB2E9C76F
.word 0x37B634EA
.word 0x635F1655
.word 0xF78F5B7E
.word 0x859D7D95
.word 0xE5EBA6E1
.word 0xDC02886C
.word 0x86D0547C
.word 0x25100301
.word 0x9A4B52D9
.word 0xC2D979D7
.word 0xDBCE1A8C
.word 0xCCE8F276
.word 0x603D5975
.word 0x074D68F8
.word 0x0FD2585F
.word 0xB4DE2CB8
.word 0xE50F1E7F
.word 0x47A45CE8
.word 0x9A9B5506
.word 0xEEE6A236
.word 0xA327798C
.word 0x9A5AD49B
.word 0x72B10A66
.word 0x9CA14B11
.word 0xE5858AB4
.word 0xDE78E59F
.word 0x5C90A985
.word 0xDEEBBFA0
.word 0xE1AFC7FF
.word 0x565C9616
.word 0x9D5C95B9
.word 0xE4830BA1
.word 0x25FB4AA9
.word 0xA330D19A
.word 0x909EC437
.word 0x8999D969
.word 0x8A3D0660
.word 0xA03E007F
.word 0x38D3BD2E
.word 0xCE8B146D
.word 0x7FDE0A37
.word 0xEF162608
.word 0x2552C4F3
.word 0x41F3686B
.word 0x85D84F3A
.word 0xAF5E3AF4
!! thread 3 data, 64 words.
.word 0x9D143CA1
.word 0x46226128
.word 0x0B8AFCF5
.word 0x2AAA51EF
.word 0x199B918B
.word 0xCDE1D9B0
.word 0xC596FA19
.word 0x94E8DFCD
.word 0xBFE54EF0
.word 0xF4CB66F1
.word 0x5F149C64
.word 0x283886A4
.word 0xBB35861F
.word 0x5E5A9B48
.word 0x32D74E07
.word 0x36451C84
.word 0x7E9EEA27
.word 0xF0A99E72
.word 0xE9C6FCD2
.word 0x855BCA49
.word 0xE33F1031
.word 0xAE856FA0
.word 0x3EF58A7B
.word 0xCAD2591F
.word 0x89D75556
.word 0xC51327CF
.word 0xEE049E82
.word 0x0354B8D7
.word 0x93A14B37
.word 0x6CA437A9
.word 0xCFAD0656
.word 0x1A19F57C
.word 0xB76B3E83
.word 0xD873814F
.word 0x27F81006
.word 0xEED308DE
.word 0x824AB047
.word 0xEE9F8043
.word 0x1D364A3E
.word 0x9CDFE429
.word 0x964A6959
.word 0xEDE4BD2D
.word 0x9345140E
.word 0x9179B98D
.word 0x616B54C5
.word 0x0B636C39
.word 0x47D12294
.word 0xC107D23D
.word 0xCD3471D6
.word 0xB4854867
.word 0xFE644C4A
.word 0x40544FDB
.word 0x0E320ECF
.word 0xC180108B
.word 0xF26AAB9D
.word 0xE50624C6
.word 0x13F7F098
.word 0x017F283E
.word 0x2EB6A957
.word 0xEC23B98B
.word 0x41B41FDC
.word 0x1ABF04FF
.word 0x106950E1
.word 0x2D5F5C68
!! thread 4 data, 64 words.
.word 0x7520915E
.word 0x74F898D7
.word 0x44500DE0
.word 0x20E64D05
.word 0xEA07C1C3
.word 0x7B8FC7C9
.word 0x4CF19F86
.word 0x1B7168A0
.word 0xFC225DE6
.word 0xE5AF2BF6
.word 0xD0E6B1F1
.word 0x2455EDA4
.word 0xF39D1B58
.word 0x44839F97
.word 0x0216A1AB
.word 0xCA871C51
.word 0x0249A311
.word 0x01D3EB52
.word 0xB192E1A5
.word 0x5B199C66
.word 0x05A0BDE4
.word 0x5B49E333
.word 0x9EC93F5C
.word 0xED024DE7
.word 0xF311675F
.word 0x1F62962F
.word 0x2F52B173
.word 0x4ED2AD8E
.word 0x85A8D5D9
.word 0xD7C8FB8A
.word 0x9A81D844
.word 0x10EB3620
.word 0x9ECC6D92
.word 0x392BD6E8
.word 0x365B2FE6
.word 0x97877C70
.word 0x2212B48F
.word 0xB1591052
.word 0xADFBEFA9
.word 0x58635868
.word 0x08802FCD
.word 0x911C415B
.word 0x98A67C3E
.word 0x8CA3C6B7
.word 0x23F942E2
.word 0xDF371C86
.word 0xF86D5AEF
.word 0xAFCBA8D7
.word 0x0A7A22A3
.word 0x63A40F3D
.word 0x4C7FF6AE
.word 0xFB0BD953
.word 0xE45E4758
.word 0xEEB424AA
.word 0x012AE916
.word 0xA06CBBE4
.word 0x3325E19C
.word 0x8337E4E2
.word 0x6BC37EA3
.word 0x2EAD699B
.word 0xF23C349F
.word 0x98C674AF
.word 0x2585F082
.word 0x2C1894FC
!! thread 5 data, 64 words.
.word 0xD9E4A9DD
.word 0x96396C40
.word 0x65206114
.word 0x679D5594
.word 0xC1666FCC
.word 0x5FDC284D
.word 0xFB589657
.word 0xA31A20C9
.word 0xA22DB906
.word 0x0CF549C0
.word 0x54BA37F0
.word 0x53A49733
.word 0x1C72A8C4
.word 0xB636CD05
.word 0x80C3F9F2
.word 0x23389149
.word 0x7109CA16
.word 0xB856D193
.word 0xD5B589C7
.word 0x5EF07608
.word 0x0E32F8C0
.word 0x9C29A965
.word 0x99AFB4A9
.word 0x63E8A9F6
.word 0x3FC3FBC7
.word 0x3576FA05
.word 0xD2B777D4
.word 0x9F1874D4
.word 0x895C0646
.word 0x0CF721BC
.word 0x5C75554E
.word 0xA0B792C0
.word 0x3475EEC0
.word 0x255D4B33
.word 0xE771369F
.word 0xC5C396FA
.word 0xBF6867E7
.word 0xF02FCEF8
.word 0x0686A4DC
.word 0xD8A2011D
.word 0xFF97DC2E
.word 0x636D0083
.word 0xC9A16BDF
.word 0xE8B46C4A
.word 0xD9CCE9DD
.word 0x9CBD28B5
.word 0x22FA9876
.word 0x35F76EFF
.word 0xABF1C825
.word 0x205C360B
.word 0xEC1ADB7D
.word 0x06D9D09C
.word 0xA31834F4
.word 0x4A2A207B
.word 0x7488DB41
.word 0x47B1B011
.word 0xD46AC597
.word 0xF2B6CF43
.word 0x22DF0B0A
.word 0x02C77E17
.word 0x9FA59FAB
.word 0x139BB7DB
.word 0x9512D17A
.word 0xC2CF7DF0
!! thread 6 data, 64 words.
.word 0x91B283C0
.word 0x913EC9AE
.word 0x7B46B246
.word 0x54B770E0
.word 0x1FBEAD0E
.word 0x6F967897
.word 0xF4F8DBF7
.word 0xC6C88CB4
.word 0x67AA1055
.word 0x06C3E266
.word 0xBFC8EDAA
.word 0xF6EBAC37
.word 0xF79EE78A
.word 0x36BBC1A6
.word 0xF4D17A9D
.word 0x1E276190
.word 0x0914DB14
.word 0xC22AD9D7
.word 0x3AE535FF
.word 0x090B306E
.word 0xC38E5FB4
.word 0x82C518EA
.word 0x3C1DB219
.word 0xA9227DDD
.word 0xEDF89AFA
.word 0xF0CD35AA
.word 0x41211F44
.word 0x57EAE2FA
.word 0xF0E62278
.word 0xD6A61DAF
.word 0x3040D00C
.word 0x0D777952
.word 0x77BBB6EA
.word 0x1455255B
.word 0xD649CF01
.word 0x60C7C8FB
.word 0x2F0B73F3
.word 0x1F8F54BF
.word 0x86C74F7A
.word 0xEC195EC9
.word 0xB3CA46F4
.word 0xC0E42242
.word 0x6657F8C6
.word 0x87DB4649
.word 0x6D5C86D7
.word 0x361CD319
.word 0x5EA33528
.word 0x3A480748
.word 0xBC67A4FF
.word 0xE30E089C
.word 0x0689FE8E
.word 0x13F412E0
.word 0x25D1C33A
.word 0x961DC8F1
.word 0x1413C316
.word 0xF1424799
.word 0x3D05D6DB
.word 0xD8E3BB68
.word 0x07C690A2
.word 0x11614919
.word 0x65B77968
.word 0x0A8B1B48
.word 0x2352D793
.word 0x14A08D4A
!! thread 7 data, 64 words.
.word 0xBE20DE0A
.word 0x0C3DE999
.word 0xCF3ED748
.word 0x883C5007
.word 0xD0BB1848
.word 0x0AC196AD
.word 0xE633B41A
.word 0x14F9005D
.word 0x129E2BB5
.word 0x98083F70
.word 0xEECDCF6A
.word 0x73367531
.word 0xBC56A990
.word 0x7D05D25D
.word 0xC94F3DB7
.word 0xD171678A
.word 0x8F0A1A3F
.word 0xD50F337E
.word 0x52B9110D
.word 0x9D1BCA07
.word 0x7C2D6FE4
.word 0x81E09761
.word 0xBD710FA4
.word 0xF059E50E
.word 0x994A6011
.word 0x769CB33F
.word 0x0EBFB638
.word 0xFCDA493D
.word 0x09E90E2E
.word 0xD2EA8BEA
.word 0x2A64EF46
.word 0xF3E42B4E
.word 0x9DA0F21F
.word 0x221C379C
.word 0xE08285C0
.word 0x50D06997
.word 0x5DC5997C
.word 0x1EFEFF8D
.word 0x80495724
.word 0x55B30034
.word 0x8C12BE48
.word 0x28473E73
.word 0xE1CEE591
.word 0x9B7D131B
.word 0x0EC66175
.word 0xA508018F
.word 0xB505E4FC
.word 0x10AFCF3A
.word 0xAF8109C4
.word 0x39C7CA31
.word 0x21566573
.word 0xBD046D4B
.word 0x2C3915C6
.word 0x1DCD66D0
.word 0x83AB7D65
.word 0x5675A272
.word 0xF613103B
.word 0x9C395E01
.word 0xECCAF22B
.word 0xB6152C78
.word 0xB41D39B8
.word 0xCC6111BF
.word 0x23B3EE63
.word 0xBA50235A
.end
