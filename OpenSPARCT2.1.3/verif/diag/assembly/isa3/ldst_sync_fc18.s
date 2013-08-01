/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync_fc18.s
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
	set	0x1,	%g2
	set	0x8,	%g3
	set	0x6,	%g4
	set	0xE,	%g5
	set	0x0,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0xB,	%i0
	set	-0xC,	%i1
	set	-0xC,	%i2
	set	-0xB,	%i3
	set	-0x3,	%i4
	set	-0x2,	%i5
	set	-0xF,	%i6
	set	-0xF,	%i7
	!# Local registers
	set	0x237CBB80,	%l0
	set	0x2076CCA2,	%l1
	set	0x687AE2BD,	%l2
	set	0x6B4BC080,	%l3
	set	0x08B814A0,	%l4
	set	0x71D8F4F8,	%l5
	set	0x16D04E50,	%l6
	!# Output registers
	set	0x16FA,	%o0
	set	-0x1B28,	%o1
	set	0x18A8,	%o2
	set	0x0C5B,	%o3
	set	-0x1C99,	%o4
	set	0x0FFF,	%o5
	set	0x104F,	%o6
	set	-0x1447,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xAFDE99F220418BE0)
	INIT_TH_FP_REG(%l7,%f2,0x42D52BB9632CDA38)
	INIT_TH_FP_REG(%l7,%f4,0x46DC8447BE197D16)
	INIT_TH_FP_REG(%l7,%f6,0x0117475EBB58C80F)
	INIT_TH_FP_REG(%l7,%f8,0x02FD76A967192CA5)
	INIT_TH_FP_REG(%l7,%f10,0x2EAAEE17E47D1BE5)
	INIT_TH_FP_REG(%l7,%f12,0x7035B9F614B588A9)
	INIT_TH_FP_REG(%l7,%f14,0x4F6F5C753C34A44F)
	INIT_TH_FP_REG(%l7,%f16,0x4A636D869A5D188D)
	INIT_TH_FP_REG(%l7,%f18,0x038EF6A2F7335AC1)
	INIT_TH_FP_REG(%l7,%f20,0x892556400FEDBAD7)
	INIT_TH_FP_REG(%l7,%f22,0x31A20FC9A17E01F5)
	INIT_TH_FP_REG(%l7,%f24,0x832D3842B74E6AE3)
	INIT_TH_FP_REG(%l7,%f26,0xB2281CBE90D0EAB2)
	INIT_TH_FP_REG(%l7,%f28,0xC50D6E704F7D7307)
	INIT_TH_FP_REG(%l7,%f30,0x87AD5AE294F62572)

	!# Execute Main Diag ..

	set	0x40, %o4
	stxa	%o0,	[%l7 + %o4] 0x89
	nop
	set	0x38, %o7
	std	%i4,	[%l7 + %o7]
	set	0x40, %l4
	swapa	[%l7 + %l4] 0x88,	%g7
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x80,	%o7
	set	0x64, %o0
	sta	%f8,	[%l7 + %o0] 0x89
	nop
	set	0x08, %i5
	ldd	[%l7 + %i5],	%f4
	nop
	set	0x2C, %g2
	stw	%l4,	[%l7 + %g2]
	nop
	set	0x5E, %i7
	sth	%i5,	[%l7 + %i7]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x89,	%f16
	nop
	set	0x58, %g7
	lduw	[%l7 + %g7],	%l2
	nop
	set	0x28, %i6
	lduh	[%l7 + %i6],	%l5
	fpadd32	%f16,	%f14,	%f22
	set	0x50, %o5
	prefetcha	[%l7 + %o5] 0x89,	 2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0xc8
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%g2
	nop
	set	0x68, %l0
	sth	%i2,	[%l7 + %l0]
	set	0x58, %g4
	stwa	%o1,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x2C, %i4
	lduw	[%l7 + %i4],	%g5
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f14
	nop
	set	0x73, %o1
	stb	%i1,	[%l7 + %o1]
	set	0x74, %l2
	stwa	%o6,	[%l7 + %l2] 0xe3
	membar	#Sync
	set	0x68, %g6
	lda	[%l7 + %g6] 0x80,	%f14
	nop
	set	0x0C, %g5
	swap	[%l7 + %g5],	%l1
	nop
	set	0x68, %l1
	stx	%i7,	[%l7 + %l1]
	nop
	set	0x20, %i1
	stx	%o2,	[%l7 + %i1]
	nop
	set	0x68, %l5
	stx	%fsr,	[%l7 + %l5]
	ld	[%l7 + 0x54],	%f23
	ld	[%l7 + 0x28],	%f27
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%o4
	set	0x40, %g3
	stda	%g6,	[%l7 + %g3] 0x80
	nop
	set	0x08, %i3
	stx	%fsr,	[%l7 + %i3]
	nop
	set	0x48, %i2
	stx	%l0,	[%l7 + %i2]
	nop
	set	0x48, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x4C, %o7
	sta	%f4,	[%l7 + %o7] 0x88
	nop
	set	0x6A, %l4
	ldsh	[%l7 + %l4],	%i6
	set	0x5A, %o4
	stha	%g4,	[%l7 + %o4] 0xeb
	membar	#Sync
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x89,	 4
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x81,	 1
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x89,	%i2
	bge,a,pn	%xcc,	loop_1
	nop
	set	0x5B, %i7
	ldstub	[%l7 + %i7],	%l3
	nop
	set	0x5A, %l3
	ldsh	[%l7 + %l3],	%o3
	fpsub16	%f30,	%f18,	%f4
loop_1:
	nop
	set	0x50, %g7
	stx	%o5,	[%l7 + %g7]
	or	%g3,	%o0,	%g7
	nop
	set	0x5C, %i6
	stw	%i4,	[%l7 + %i6]
	nop
	set	0x20, %o5
	lduw	[%l7 + %o5],	%o7
	nop
	set	0x38, %i5
	std	%f28,	[%l7 + %i5]
	set	0x68, %o6
	stwa	%l4,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x70, %i0
	stda	%i4,	[%l7 + %i0] 0x81
	wr	%l5,	%g1,	%pic
	fpadd32	%f24,	%f18,	%f12
	set	0x44, %l0
	stba	%l2,	[%l7 + %l0] 0xe3
	membar	#Sync
	set	0x12, %g4
	ldstuba	[%l7 + %g4] 0x81,	%i2
	nop
	set	0x7B, %i4
	ldsb	[%l7 + %i4],	%o1
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%g5
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%g2
	nop
	set	0x38, %g6
	swap	[%l7 + %g6],	%i1
	set	0x39, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l1,	%o2
	nop
	set	0x4C, %l1
	ldstub	[%l7 + %l1],	%i7
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x81,	%g6
	wr	%l0,	%o4,	%set_softint
	nop
	set	0x60, %g5
	swap	[%l7 + %g5],	%g4
	set	0x40, %o3
	ldxa	[%l7 + %o3] 0x89,	%l6
	nop
	set	0x18, %l5
	stx	%fsr,	[%l7 + %l5]
	nop
	set	0x1C, %i3
	lduh	[%l7 + %i3],	%i6
	nop
	set	0x3C, %g3
	swap	[%l7 + %g3],	%i0
	nop
	set	0x70, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x50, %o7
	stxa	%l3,	[%l7 + %o7] 0x80
	or	%i3,	%o3,	%g3
	and	%o5,	%o0,	%i4
	nop
	set	0x68, %l4
	std	%f16,	[%l7 + %l4]
	set	0x7C, %o4
	stwa	%g7,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	set	0x4C, %o0
	stb	%l4,	[%l7 + %o0]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o7,	%i5
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%l4
	set	0x48, %i2
	sta	%f13,	[%l7 + %i2] 0x89
	nop
	set	0x30, %i7
	stw	%l2,	[%l7 + %i7]
	set	0x20, %g2
	prefetcha	[%l7 + %g2] 0x80,	 4
	nop
	set	0x20, %g7
	ldsh	[%l7 + %g7],	%i2
	add	%g5,	%o1,	%i1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%l1
	nop
	set	0x40, %l3
	std	%o2,	[%l7 + %l3]
	nop
	set	0x13, %i6
	ldstub	[%l7 + %i6],	%o6
	st	%f18,	[%l7 + 0x18]
	nop
	set	0x3C, %i5
	ldsh	[%l7 + %i5],	%i7
	add	%g6,	%o4,	%g4
	nop
	set	0x68, %o6
	stx	%l6,	[%l7 + %o6]
	add	%i6,	%i0,	%l0
	nop
	set	0x30, %o5
	sth	%i3,	[%l7 + %o5]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o3,	%g3
	set	0x32, %i0
	stha	%o5,	[%l7 + %i0] 0xe3
	membar	#Sync
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x89,	 0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%g7
	nop
	set	0x0C, %i4
	prefetch	[%l7 + %i4],	 2
	nop
	set	0x40, %l6
	ldx	[%l7 + %l6],	%o0
	set	0x10, %l0
	lda	[%l7 + %l0] 0x81,	%f5
	set	0x24, %o1
	swapa	[%l7 + %o1] 0x80,	%l4
	set	0x09, %g6
	stba	%i5,	[%l7 + %g6] 0x88
	set	0x10, %l1
	ldda	[%l7 + %l1] 0xe3,	%o6
	nop
	set	0x38, %i1
	ldsw	[%l7 + %i1],	%l2
	bne,pt	%xcc,	loop_2
	ld	[%l7 + 0x7C],	%f12
	st	%f16,	[%l7 + 0x14]
	nop
	set	0x48, %l2
	stx	%g1,	[%l7 + %l2]
loop_2:
	nop
	set	0x22, %o3
	sth	%l5,	[%l7 + %o3]
	set	0x7C, %l5
	swapa	[%l7 + %l5] 0x88,	%g5
	nop
	set	0x50, %g5
	swap	[%l7 + %g5],	%o1
	wr	%i2,	%g2,	%softint
	nop
	set	0x2C, %g3
	ldsw	[%l7 + %g3],	%l1
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x88,	 4
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%f14
	nop
	set	0x48, %i3
	std	%o6,	[%l7 + %i3]
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x48, %o4
	stx	%i1,	[%l7 + %o4]
	or	%i7,	%g6,	%o4
	nop
	set	0x23, %l4
	stb	%g4,	[%l7 + %l4]
	nop
	set	0x0F, %o0
	ldub	[%l7 + %o0],	%i6
	set	0x38, %o2
	stda	%i6,	[%l7 + %o2] 0x88
	set	0x38, %i2
	lda	[%l7 + %i2] 0x88,	%f8
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%i0
	nop
	set	0x72, %g7
	lduh	[%l7 + %g7],	%i3
	nop
	set	0x68, %g2
	stx	%fsr,	[%l7 + %g2]
	or	%l0,	%o3,	%o5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x88,	%f16
	set	0x4F, %i6
	stba	%g3,	[%l7 + %i6] 0xea
	membar	#Sync
	ld	[%l7 + 0x7C],	%f4
	nop
	set	0x30, %o6
	ldsb	[%l7 + %o6],	%l3
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0xf8
	membar	#Sync
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x88,	%g6
	st	%fsr,	[%l7 + 0x58]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%tick_cmpr
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f24
	ld	[%l7 + 0x2C],	%f3
	set	0x72, %i4
	stha	%i5,	[%l7 + %i4] 0x80
	wr	%o7,	%i4,	%ccr
	and	%l2,	%g1,	%l5
	nop
	set	0x28, %g4
	swap	[%l7 + %g4],	%g5
	nop
	set	0x7A, %l0
	ldsh	[%l7 + %l0],	%o1
	set	0x50, %o1
	lda	[%l7 + %o1] 0x80,	%f18
	nop
	set	0x18, %l6
	stw	%i2,	[%l7 + %l6]
	nop
	set	0x28, %l1
	stx	%l1,	[%l7 + %l1]
	or	%g2,	%o2,	%o6
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%i7
	set	0x47, %g6
	stba	%i1,	[%l7 + %g6] 0xe3
	membar	#Sync
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x80,	 3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g4
	add	%i6,	%i0,	%l6
	nop
	set	0x27, %l2
	ldstub	[%l7 + %l2],	%i3
	nop
	set	0x40, %l5
	prefetch	[%l7 + %l5],	 2
	set	0x68, %g3
	sta	%f5,	[%l7 + %g3] 0x89
	nop
	set	0x5C, %g5
	lduw	[%l7 + %g5],	%o3
	nop
	set	0x18, %g1
	stx	%fsr,	[%l7 + %g1]
	nop
	set	0x18, %i3
	std	%o4,	[%l7 + %i3]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf9
	membar	#Sync
	nop
	set	0x70, %o4
	stx	%fsr,	[%l7 + %o4]
	set	0x22, %l4
	stba	%g3,	[%l7 + %l4] 0x81
	nop
	set	0x7E, %o2
	ldsb	[%l7 + %o2],	%l3
	nop
	set	0x21, %i2
	ldub	[%l7 + %i2],	%g7
	nop
	set	0x4C, %i7
	lduw	[%l7 + %i7],	%o0
	nop
	set	0x0C, %o0
	ldsw	[%l7 + %o0],	%l4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xca
	nop
	set	0x46, %l3
	ldstub	[%l7 + %l3],	%i5
	set	0x34, %i6
	lda	[%l7 + %i6] 0x81,	%f11
	nop
	set	0x64, %o6
	lduw	[%l7 + %o6],	%o7
	nop
	set	0x60, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x88
	nop
	set	0x64, %g7
	ldsb	[%l7 + %g7],	%i4
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x88,	%l2
	fpsub16	%f30,	%f6,	%f0
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf9,	%f0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0xf1,	%f16
	set	0x6C, %i4
	sta	%f0,	[%l7 + %i4] 0x81
	nop
	set	0x30, %l6
	ldsh	[%l7 + %l6],	%l0
	add	%g1,	%l5,	%o1
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%g4
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%l1
	nop
	set	0x4C, %o1
	ldsw	[%l7 + %o1],	%g2
	nop
	set	0x58, %g6
	lduh	[%l7 + %g6],	%i2
	fpsub16	%f24,	%f28,	%f12
	nop
	set	0x58, %o3
	lduw	[%l7 + %o3],	%o6
	set	0x54, %l5
	lda	[%l7 + %l5] 0x80,	%f9
	nop
	set	0x0D, %g3
	stb	%o2,	[%l7 + %g3]
	st	%f30,	[%l7 + 0x24]
	nop
	set	0x53, %l2
	ldub	[%l7 + %l2],	%i1
	set	0x50, %g1
	swapa	[%l7 + %g1] 0x88,	%g6
	st	%f8,	[%l7 + 0x6C]
	nop
	set	0x46, %i3
	lduh	[%l7 + %i3],	%i7
	nop
	set	0x7C, %o7
	swap	[%l7 + %o7],	%o4
	set	0x3E, %g5
	ldstuba	[%l7 + %g5] 0x81,	%g4
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f10
	nop
	set	0x20, %o2
	std	%f14,	[%l7 + %o2]
	nop
	set	0x10, %l4
	lduw	[%l7 + %l4],	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i3
	fpadd32	%f0,	%f4,	%f10
	nop
	set	0x28, %i2
	ldsh	[%l7 + %i2],	%o3
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%o5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xda,	%f0
	set	0x4E, %l3
	stha	%l6,	[%l7 + %l3] 0x80
	nop
	set	0x60, %i6
	prefetch	[%l7 + %i6],	 0
	nop
	set	0x74, %o0
	ldstub	[%l7 + %o0],	%g3
	nop
	set	0x38, %o5
	std	%l2,	[%l7 + %o5]
	set	0x70, %o6
	ldxa	[%l7 + %o6] 0x81,	%o0
	set	0x42, %g7
	ldstuba	[%l7 + %g7] 0x88,	%g7
	and	%i5,	%o7,	%i4
	or	%l2,	%l0,	%l4
	nop
	set	0x39, %i5
	ldstub	[%l7 + %i5],	%l5
	set	0x50, %g4
	stda	%g0,	[%l7 + %g4] 0x88
	set	0x6C, %i0
	sta	%f25,	[%l7 + %i0] 0x88
	nop
	set	0x58, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x28, %l6
	stxa	%g5,	[%l7 + %l6] 0x88
	set	0x40, %l0
	stda	%o0,	[%l7 + %l0] 0xea
	membar	#Sync
	set	0x78, %i1
	lda	[%l7 + %i1] 0x89,	%f12
	set	0x13, %l1
	ldstuba	[%l7 + %l1] 0x88,	%g2
	set	0x3C, %g6
	sta	%f18,	[%l7 + %g6] 0x88
	set	0x6A, %o3
	stha	%l1,	[%l7 + %o3] 0xea
	membar	#Sync
	nop
	set	0x35, %l5
	ldsb	[%l7 + %l5],	%i2
	set	0x20, %o1
	ldda	[%l7 + %o1] 0xeb,	%o6
	ld	[%l7 + 0x38],	%f27
	nop
	set	0x17, %l2
	stb	%o2,	[%l7 + %l2]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%i7
	set	0x08, %g1
	lda	[%l7 + %g1] 0x89,	%f9
	or	%o4,	%g4,	%g6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xda,	%f0
	set	0x24, %g3
	stwa	%i0,	[%l7 + %g3] 0x80
	set	0x78, %o7
	sta	%f8,	[%l7 + %o7] 0x80
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x88,	%i6,	%o3
	set	0x58, %g5
	sta	%f6,	[%l7 + %g5] 0x89
	nop
	set	0x68, %o4
	stx	%fsr,	[%l7 + %o4]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%o5
	bg,a	%icc,	loop_3
	nop
	set	0x6C, %l4
	ldsw	[%l7 + %l4],	%l6
	set	0x50, %o2
	prefetcha	[%l7 + %o2] 0x89,	 1
loop_3:
	nop
	set	0x50, %i7
	stwa	%g3,	[%l7 + %i7] 0x80
	nop
	set	0x6C, %i2
	swap	[%l7 + %i2],	%o0
	set	0x60, %g2
	prefetcha	[%l7 + %g2] 0x81,	 3
	or	%i5,	%i4,	%l2
	set	0x58, %i6
	lda	[%l7 + %i6] 0x81,	%f12
	st	%f31,	[%l7 + 0x2C]
	set	0x40, %l3
	ldxa	[%l7 + %l3] 0x80,	%l0
	nop
	set	0x0C, %o5
	ldsh	[%l7 + %o5],	%l4
	nop
	set	0x60, %o6
	std	%f18,	[%l7 + %o6]
	set	0x10, %g7
	stxa	%o7,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x6D, %o0
	ldstub	[%l7 + %o0],	%l5
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%o1
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f4
	set	0x0C, %i0
	swapa	[%l7 + %i0] 0x89,	%g1
	st	%fsr,	[%l7 + 0x68]
	set	0x74, %g4
	sta	%f10,	[%l7 + %g4] 0x80
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xd8,	%f0
	nop
	set	0x16, %l0
	stb	%l1,	[%l7 + %l0]
	nop
	set	0x7E, %i1
	lduh	[%l7 + %i1],	%i2
	set	0x74, %l1
	lda	[%l7 + %l1] 0x80,	%f3
	set	0x08, %i4
	stda	%g2,	[%l7 + %i4] 0xeb
	membar	#Sync
	nop
	set	0x2E, %o3
	ldub	[%l7 + %o3],	%o2
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x81
	nop
	set	0x30, %o1
	std	%f12,	[%l7 + %o1]
	set	0x18, %l2
	stda	%i0,	[%l7 + %l2] 0x81
	bl	%icc,	loop_4
	add	%i7,	%o4,	%g4
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%g6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x89,	%i0,	%i6
loop_4:
	and	%o3,	%o6,	%i3
	st	%fsr,	[%l7 + 0x14]
	bl	%xcc,	loop_5
	bleu	%icc,	loop_6
	nop
	set	0x10, %g1
	stx	%fsr,	[%l7 + %g1]
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x89,	%o4
loop_5:
	st	%fsr,	[%l7 + 0x14]
loop_6:
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%l6
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%g2
	set	0x40, %o4
	stda	%o0,	[%l7 + %o4] 0xe3
	membar	#Sync
	set	0x74, %l4
	stwa	%g7,	[%l7 + %l4] 0x80
	set	0x46, %o7
	stha	%l3,	[%l7 + %o7] 0x88
	nop
	set	0x70, %i7
	ldub	[%l7 + %i7],	%i5
	set	0x58, %o2
	stwa	%l2,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x6F, %i2
	ldstub	[%l7 + %i2],	%i4
	nop
	set	0x66, %i6
	sth	%l4,	[%l7 + %i6]
	set	0x7C, %g2
	stwa	%l0,	[%l7 + %g2] 0x89
	add	%l5,	%o7,	%g5
	nop
	set	0x60, %l3
	ldx	[%l7 + %l3],	%o1
	set	0x20, %o5
	stwa	%g1,	[%l7 + %o5] 0x81
	set	0x1C, %g7
	swapa	[%l7 + %g7] 0x89,	%l1
	ld	[%l7 + 0x08],	%f31
	nop
	set	0x4A, %o0
	ldsb	[%l7 + %o0],	%i2
	set	0x30, %o6
	ldda	[%l7 + %o6] 0x89,	%o2
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%g2
	nop
	set	0x30, %g4
	swap	[%l7 + %g4],	%i1
	st	%f27,	[%l7 + 0x3C]
	set	0x18, %i5
	sta	%f5,	[%l7 + %i5] 0x80
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f14
	set	0x62, %i1
	stha	%i7,	[%l7 + %i1] 0x89
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x32, %l1
	ldstub	[%l7 + %l1],	%o4
	and	%g6,	%i0,	%g4
	set	0x79, %l6
	ldstuba	[%l7 + %l6] 0x80,	%o3
	nop
	set	0x20, %o3
	swap	[%l7 + %o3],	%o6
	ld	[%l7 + 0x38],	%f21
	nop
	set	0x1F, %l5
	stb	%i6,	[%l7 + %l5]
	or	%i3,	%o5,	%g3
	set	0x7E, %o1
	stha	%o0,	[%l7 + %o1] 0x80
	nop
	set	0x78, %l2
	std	%g6,	[%l7 + %l2]
	set	0x14, %i4
	stwa	%l3,	[%l7 + %i4] 0x89
	set	0x40, %g1
	stha	%l6,	[%l7 + %g1] 0x80
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xca
	set	0x08, %g3
	stxa	%i5,	[%l7 + %g3] 0xea
	membar	#Sync
	nop
	set	0x50, %g5
	ldx	[%l7 + %g5],	%i4
	st	%f21,	[%l7 + 0x14]
	bg,a	%icc,	loop_7
	nop
	set	0x6B, %i3
	ldstub	[%l7 + %i3],	%l2
	add	%l0,	%l4,	%o7
	set	0x74, %o4
	swapa	[%l7 + %o4] 0x81,	%g5
loop_7:
	nop
	set	0x14, %o7
	lda	[%l7 + %o7] 0x88,	%f20
	set	0x70, %l4
	ldda	[%l7 + %l4] 0x81,	%l4
	nop
	set	0x72, %i7
	ldsh	[%l7 + %i7],	%g1
	nop
	set	0x20, %o2
	prefetch	[%l7 + %o2],	 3
	set	0x32, %i2
	stba	%l1,	[%l7 + %i2] 0x89
	and	%i2,	%o2,	%g2
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xca
	nop
	set	0x40, %l3
	std	%i0,	[%l7 + %l3]
	set	0x4B, %i6
	stba	%i7,	[%l7 + %i6] 0xeb
	membar	#Sync
	set	0x28, %g7
	stwa	%o4,	[%l7 + %g7] 0xe3
	membar	#Sync
	set	0x68, %o0
	stxa	%o1,	[%l7 + %o0] 0xeb
	membar	#Sync
	be,pt	%xcc,	loop_8
	nop
	set	0x78, %o6
	lduw	[%l7 + %o6],	%g6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%o3
loop_8:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o6,	%i6
	ld	[%l7 + 0x1C],	%f20
	set	0x48, %o5
	stxa	%i0,	[%l7 + %o5] 0x89
	set	0x58, %i0
	ldxa	[%l7 + %i0] 0x88,	%o5
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%g2
	nop
	set	0x6A, %l0
	lduh	[%l7 + %l0],	%i3
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf8,	%f0
	set	0x30, %i1
	ldstuba	[%l7 + %i1] 0x80,	%o0
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x88
	set	0x60, %l6
	stda	%l2,	[%l7 + %l6] 0xea
	membar	#Sync
	fpsub16s	%f1,	%f26,	%f11
	set	0x10, %l5
	stwa	%l6,	[%l7 + %l5] 0xe3
	membar	#Sync
	set	0x18, %o1
	stda	%g6,	[%l7 + %o1] 0x88
	set	0x50, %l2
	lda	[%l7 + %l2] 0x81,	%f5
	set	0x4B, %i4
	stba	%i5,	[%l7 + %i4] 0xe2
	membar	#Sync
	wr	%l2,	%i4,	%ccr
	ld	[%l7 + 0x60],	%f10
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f0
	nop
	set	0x2A, %o3
	ldsh	[%l7 + %o3],	%l0
	st	%f25,	[%l7 + 0x68]
	set	0x28, %g3
	stda	%l4,	[%l7 + %g3] 0x89
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%l5
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%o6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f16
	nop
	set	0x28, %o4
	ldsh	[%l7 + %o4],	%g1
	bleu	%xcc,	loop_9
	nop
	set	0x46, %o7
	sth	%l1,	[%l7 + %o7]
	nop
	set	0x10, %l4
	std	%o2,	[%l7 + %l4]
	nop
	set	0x1C, %i7
	lduw	[%l7 + %i7],	%g2
loop_9:
	nop
	set	0x68, %g6
	sta	%f7,	[%l7 + %g6] 0x88
	bn,pn	%xcc,	loop_10
	nop
	set	0x40, %o2
	ldstub	[%l7 + %o2],	%i1
	nop
	set	0x08, %g2
	std	%f28,	[%l7 + %g2]
	st	%fsr,	[%l7 + 0x48]
loop_10:
	or	%i7,	%o4,	%i2
	nop
	set	0x34, %i2
	stw	%g6,	[%l7 + %i2]
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%g4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%o6
	nop
	set	0x42, %g7
	ldstub	[%l7 + %g7],	%i6
	nop
	set	0x28, %o0
	ldub	[%l7 + %o0],	%i0
	set	0x10, %l3
	swapa	[%l7 + %l3] 0x81,	%o3
	nop
	set	0x1E, %o5
	stb	%o5,	[%l7 + %o5]
	nop
	set	0x48, %i0
	std	%f30,	[%l7 + %i0]
	set	0x68, %g4
	stxa	%i3,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x14, %o6
	sth	%o0,	[%l7 + %o6]
	set	0x70, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0
	nop
	set	0x39, %i1
	ldstub	[%l7 + %i1],	%l3
	nop
	set	0x50, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x60, %l1
	ldxa	[%l7 + %l1] 0x88,	%g7
	nop
	set	0x30, %l5
	stw	%l6,	[%l7 + %l5]
	or	%l2,	%i4,	%i5
	nop
	set	0x18, %l6
	stw	%l0,	[%l7 + %l6]
	nop
	set	0x70, %l2
	lduw	[%l7 + %l2],	%l4
	add	%g5,	%o7,	%l5
	nop
	set	0x72, %i4
	ldsb	[%l7 + %i4],	%g1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf8,	%f0
	set	0x68, %g1
	lda	[%l7 + %g1] 0x81,	%f27
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x81,	%l1,	%o2
	bl,pn	%icc,	loop_11
	nop
	set	0x66, %g3
	ldub	[%l7 + %g3],	%i1
	set	0x0B, %o3
	ldstuba	[%l7 + %o3] 0x81,	%g2
loop_11:
	bge	%xcc,	loop_12
	add	%o4,	%i7,	%i2
	set	0x18, %i3
	ldstuba	[%l7 + %i3] 0x89,	%g6
loop_12:
	nop
	set	0x5C, %g5
	sta	%f5,	[%l7 + %g5] 0x81
	set	0x30, %o4
	swapa	[%l7 + %o4] 0x89,	%o1
	nop
	set	0x50, %l4
	swap	[%l7 + %l4],	%g4
	nop
	set	0x12, %i7
	ldsh	[%l7 + %i7],	%o6
	nop
	set	0x30, %o7
	stx	%i0,	[%l7 + %o7]
	nop
	set	0x57, %g6
	ldub	[%l7 + %g6],	%i6
	nop
	set	0x56, %g2
	ldstub	[%l7 + %g2],	%o5
	set	0x14, %i2
	lda	[%l7 + %i2] 0x81,	%f14
	set	0x50, %i6
	ldda	[%l7 + %i6] 0x81,	%i2
	nop
	set	0x0D, %g7
	ldub	[%l7 + %g7],	%o0
	st	%fsr,	[%l7 + 0x50]
	st	%f30,	[%l7 + 0x68]
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%o3
	nop
	set	0x27, %l3
	ldsb	[%l7 + %l3],	%l3
	nop
	set	0x20, %o2
	swap	[%l7 + %o2],	%g7
	nop
	set	0x58, %o5
	ldx	[%l7 + %o5],	%g3
	nop
	set	0x2F, %i0
	ldub	[%l7 + %i0],	%l6
	nop
	set	0x44, %g4
	ldsb	[%l7 + %g4],	%i4
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f2
	set	0x0C, %o6
	swapa	[%l7 + %o6] 0x81,	%i5
	wr	%l2,	%l4,	%pic
	set	0x10, %i1
	stwa	%g5,	[%l7 + %i1] 0xea
	membar	#Sync
	wr	%o7,	%l0,	%pic
	nop
	set	0x20, %i5
	ldx	[%l7 + %i5],	%g1
	set	0x20, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0
	set	0x48, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
	fpsub16s	%f11,	%f20,	%f0
	set	0x3C, %l2
	stwa	%o2,	[%l7 + %l2] 0x88
	nop
	set	0x32, %o1
	lduh	[%l7 + %o1],	%g2
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xd0
	set	0x38, %g3
	stxa	%i1,	[%l7 + %g3] 0xeb
	membar	#Sync
	and	%i7,	%i2,	%g6
	nop
	set	0x26, %g1
	lduh	[%l7 + %g1],	%o1
	nop
	set	0x60, %o3
	std	%f0,	[%l7 + %o3]
	nop
	set	0x26, %g5
	ldstub	[%l7 + %g5],	%o4
	nop
	set	0x20, %i3
	std	%g4,	[%l7 + %i3]
	set	0x62, %o4
	stha	%i0,	[%l7 + %o4] 0xeb
	membar	#Sync
	and	%i6,	%o5,	%i3
	set	0x48, %i7
	lda	[%l7 + %i7] 0x80,	%f1
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f0
	ld	[%l7 + 0x7C],	%f30
	set	0x74, %l4
	stha	%o6,	[%l7 + %l4] 0x89
	set	0x20, %g2
	ldda	[%l7 + %g2] 0xe3,	%o0
	nop
	set	0x68, %i2
	stx	%o3,	[%l7 + %i2]
	nop
	set	0x40, %g6
	ldd	[%l7 + %g6],	%f8
	nop
	set	0x6B, %g7
	stb	%g7,	[%l7 + %g7]
	or	%l3,	%g3,	%i4
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xd8
	nop
	set	0x18, %o0
	std	%i4,	[%l7 + %o0]
	nop
	set	0x6C, %l3
	ldsb	[%l7 + %l3],	%l6
	st	%f10,	[%l7 + 0x40]
	set	0x09, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l4
	or	%l2,	%g5,	%o7
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%l0
	nop
	set	0x70, %o5
	stw	%l5,	[%l7 + %o5]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%l1
	set	0x58, %g4
	stxa	%o2,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x08, %l0
	stx	%fsr,	[%l7 + %l0]
	nop
	set	0x68, %o6
	std	%g2,	[%l7 + %o6]
	nop
	set	0x20, %i1
	lduw	[%l7 + %i1],	%i7
	set	0x60, %i5
	swapa	[%l7 + %i5] 0x89,	%i2
	nop
	set	0x3C, %l6
	ldsb	[%l7 + %l6],	%i1
	nop
	set	0x74, %l1
	ldsw	[%l7 + %l1],	%g6
	nop
	set	0x6E, %l2
	lduh	[%l7 + %l2],	%o1
	set	0x30, %l5
	ldxa	[%l7 + %l5] 0x81,	%g4
	nop
	set	0x6D, %i4
	ldstub	[%l7 + %i4],	%i0
	nop
	set	0x71, %o1
	ldub	[%l7 + %o1],	%o4
	nop
	nop
	setx	0xF17B6DAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x1F3929CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f7,	%f24
	fpadd32	%f2,	%f12,	%f30
	set	0x7C, %g1
	stwa	%i6,	[%l7 + %g1] 0x89
	nop
	set	0x48, %o3
	stx	%fsr,	[%l7 + %o3]
	or	%o5,	%i3,	%o0
	fpsub16	%f4,	%f14,	%f10
	set	0x18, %g5
	sta	%f6,	[%l7 + %g5] 0x88
	set	0x24, %i3
	swapa	[%l7 + %i3] 0x80,	%o6
	set	0x50, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0
	set	0x30, %i7
	stxa	%g7,	[%l7 + %i7] 0x80
	set	0x44, %o4
	swapa	[%l7 + %o4] 0x89,	%g3
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x81,	%i4,	%l3
	nop
	set	0x65, %o7
	ldsb	[%l7 + %o7],	%l6
	nop
	set	0x4A, %l4
	ldstub	[%l7 + %l4],	%l4
	nop
	set	0x08, %i2
	stx	%fsr,	[%l7 + %i2]
	set	0x10, %g6
	ldxa	[%l7 + %g6] 0x81,	%l2
	fpadd32	%f0,	%f6,	%f6
	set	0x18, %g2
	ldxa	[%l7 + %g2] 0x88,	%g5
	set	0x6D, %g7
	stba	%i5,	[%l7 + %g7] 0xea
	membar	#Sync
	nop
	set	0x7F, %o0
	ldub	[%l7 + %o0],	%o7
	nop
	set	0x30, %i6
	stx	%l5,	[%l7 + %i6]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x81,	%g1,	%l0
	nop
	set	0x68, %o2
	std	%l0,	[%l7 + %o2]
	set	0x20, %l3
	stxa	%o2,	[%l7 + %l3] 0x81
	nop
	set	0x76, %i0
	lduh	[%l7 + %i0],	%i7
	nop
	set	0x2C, %g4
	ldsw	[%l7 + %g4],	%g2
	add	%i1,	%g6,	%o1
	nop
	set	0x48, %o5
	stx	%fsr,	[%l7 + %o5]
	set	0x69, %o6
	ldstuba	[%l7 + %o6] 0x88,	%i2
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0xc2
	add	%i0,	%g4,	%i6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xda
	nop
	set	0x1E, %i1
	ldstub	[%l7 + %i1],	%o4
	set	0x30, %l1
	sta	%f13,	[%l7 + %l1] 0x80
	set	0x78, %l6
	stda	%o4,	[%l7 + %l6] 0xe3
	membar	#Sync
	nop
	set	0x48, %l2
	stw	%i3,	[%l7 + %l2]
	nop
	set	0x08, %i4
	ldsh	[%l7 + %i4],	%o6
	and	%o0,	%o3,	%g3
	fpsub16	%f2,	%f24,	%f12
	nop
	set	0x0A, %l5
	sth	%i4,	[%l7 + %l5]
	set	0x5E, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g7
	nop
	set	0x2A, %o1
	lduh	[%l7 + %o1],	%l3
	set	0x34, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l6
	st	%f28,	[%l7 + 0x24]
	nop
	set	0x18, %o3
	std	%l2,	[%l7 + %o3]
	nop
	set	0x21, %i3
	stb	%g5,	[%l7 + %i3]
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%l4
	nop
	set	0x28, %i7
	stw	%i5,	[%l7 + %i7]
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f16
	nop
	set	0x3C, %l4
	prefetch	[%l7 + %l4],	 3
	nop
	set	0x2F, %i2
	stb	%l5,	[%l7 + %i2]
	set	0x48, %g6
	stda	%g0,	[%l7 + %g6] 0x81
	nop
	set	0x68, %g2
	stx	%l0,	[%l7 + %g2]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xda,	%f0
	nop
	set	0x58, %o4
	ldx	[%l7 + %o4],	%l1
	nop
	set	0x36, %i6
	ldsh	[%l7 + %i6],	%o7
	nop
	set	0x60, %o2
	std	%o2,	[%l7 + %o2]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x81,	%g2,	%i1
	set	0x60, %o0
	ldxa	[%l7 + %o0] 0x88,	%i7
	set	0x54, %i0
	stwa	%o1,	[%l7 + %i0] 0xe3
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x81,	%i2,	%i0
	nop
	set	0x0C, %l3
	prefetch	[%l7 + %l3],	 4
	set	0x38, %o5
	sta	%f20,	[%l7 + %o5] 0x89
	nop
	set	0x1E, %o6
	ldsb	[%l7 + %o6],	%g4
	nop
	set	0x33, %l0
	stb	%i6,	[%l7 + %l0]
	nop
	nop
	setx	0x370EE392BC7751AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5064F306874B2001,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f14,	%f28
	set	0x64, %g4
	swapa	[%l7 + %g4] 0x89,	%g6
	set	0x68, %i5
	prefetcha	[%l7 + %i5] 0x80,	 2
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x80,	%i3
	set	0x7C, %l6
	lda	[%l7 + %l6] 0x88,	%f23
	nop
	set	0x66, %l1
	sth	%o5,	[%l7 + %l1]
	nop
	set	0x08, %l2
	swap	[%l7 + %l2],	%o6
	nop
	set	0x08, %i4
	std	%f22,	[%l7 + %i4]
	nop
	set	0x58, %g1
	std	%o2,	[%l7 + %g1]
	ld	[%l7 + 0x0C],	%f16
	or	%g3,	%i4,	%g7
	bleu,a,pt	%icc,	loop_13
	nop
	set	0x28, %l5
	stw	%o0,	[%l7 + %l5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	wr	%g5,	%l4,	%pic
loop_13:
	nop
	set	0x40, %o1
	std	%l2,	[%l7 + %o1]
	nop
	set	0x10, %o3
	stx	%fsr,	[%l7 + %o3]
	set	0x6C, %i3
	swapa	[%l7 + %i3] 0x80,	%i5
	st	%fsr,	[%l7 + 0x4C]
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	or	%g1,	%l5,	%l1
	set	0x40, %i7
	stxa	%o7,	[%l7 + %i7] 0x89
	or	%o2,	%l0,	%i1
	set	0x30, %o7
	stda	%g2,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	set	0x18, %g3
	std	%i6,	[%l7 + %g3]
	set	0x2A, %l4
	ldstuba	[%l7 + %l4] 0x89,	%o1
	st	%f22,	[%l7 + 0x0C]
	ble,pt	%xcc,	loop_14
	nop
	set	0x48, %i2
	stx	%i0,	[%l7 + %i2]
	set	0x7A, %g6
	stha	%i2,	[%l7 + %g6] 0xeb
	membar	#Sync
loop_14:
	add	%i6,	%g6,	%g4
	set	0x54, %g2
	sta	%f27,	[%l7 + %g2] 0x80
	nop
	set	0x0E, %o4
	stb	%o4,	[%l7 + %o4]
	nop
	set	0x52, %i6
	sth	%o5,	[%l7 + %i6]
	st	%f25,	[%l7 + 0x40]
	nop
	set	0x60, %o2
	std	%f20,	[%l7 + %o2]
	nop
	set	0x18, %o0
	stx	%fsr,	[%l7 + %o0]
	nop
	set	0x50, %g7
	lduw	[%l7 + %g7],	%i3
	ld	[%l7 + 0x4C],	%f7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%o6
	set	0x24, %l3
	sta	%f15,	[%l7 + %l3] 0x88
	set	0x45, %o5
	stba	%g3,	[%l7 + %o5] 0x81
	add	%g7,	%o0,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l2,	%i4
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x80,	 3
	add	%g5,	%l3,	%i5
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f16
	add	%g1,	%l5,	%l1
	nop
	set	0x1C, %g4
	stw	%o2,	[%l7 + %g4]
	fpadd32	%f22,	%f8,	%f22
	nop
	set	0x12, %i0
	ldsh	[%l7 + %i0],	%o7
	nop
	set	0x20, %i5
	stx	%fsr,	[%l7 + %i5]
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x88,	%l0
	nop
	set	0x40, %l6
	stw	%g2,	[%l7 + %l6]
	nop
	set	0x18, %l2
	std	%i6,	[%l7 + %l2]
	nop
	set	0x6D, %i4
	ldstub	[%l7 + %i4],	%o1
	add	%i0,	%i1,	%i6
	set	0x28, %l1
	stxa	%i2,	[%l7 + %l1] 0xea
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xd2,	%f16
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf9
	membar	#Sync
	set	0x08, %o3
	lda	[%l7 + %o3] 0x80,	%f10
	nop
	set	0x58, %o1
	prefetch	[%l7 + %o1],	 4
	set	0x1C, %g5
	swapa	[%l7 + %g5] 0x89,	%g4
	set	0x48, %i7
	lda	[%l7 + %i7] 0x88,	%f11
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x80,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g6,	%o4
	or	%i3,	%o5,	%o3
	wr	%g3,	%g7,	%pic
	set	0x6C, %g3
	stha	%o0,	[%l7 + %g3] 0xeb
	membar	#Sync
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%i6
	set	0x78, %i3
	stxa	%o6,	[%l7 + %i3] 0x80
	and	%l2,	%i4,	%l4
	set	0x58, %g6
	stxa	%l3,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x10, %i2
	prefetch	[%l7 + %i2],	 3
	nop
	set	0x58, %o4
	std	%f14,	[%l7 + %o4]
	nop
	set	0x58, %i6
	stx	%fsr,	[%l7 + %i6]
	set	0x20, %g2
	stxa	%g5,	[%l7 + %g2] 0x89
	nop
	set	0x3C, %o2
	lduw	[%l7 + %o2],	%i5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x80,	%f16
	nop
	set	0x08, %l3
	ldd	[%l7 + %l3],	%g0
	nop
	set	0x18, %o5
	ldd	[%l7 + %o5],	%l0
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%o2
	nop
	set	0x60, %l0
	std	%o6,	[%l7 + %l0]
	set	0x33, %o6
	ldstuba	[%l7 + %o6] 0x81,	%l5
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x81
	nop
	set	0x22, %g4
	ldsh	[%l7 + %g4],	%l0
	set	0x78, %i5
	swapa	[%l7 + %i5] 0x81,	%i7
	or	%g2,	%o1,	%i1
	set	0x70, %i1
	ldxa	[%l7 + %i1] 0x81,	%i6
	nop
	set	0x20, %l6
	ldsw	[%l7 + %l6],	%i0
	fpadd32s	%f28,	%f31,	%f20
	nop
	set	0x3C, %l2
	lduh	[%l7 + %l2],	%g4
	nop
	set	0x6C, %l1
	swap	[%l7 + %l1],	%i2
	nop
	set	0x60, %l5
	ldsh	[%l7 + %l5],	%o4
	nop
	set	0x68, %i4
	stw	%i3,	[%l7 + %i4]
	nop
	set	0x28, %g1
	std	%g6,	[%l7 + %g1]
	add	%o5,	%g3,	%g7
	set	0x30, %o1
	stba	%o3,	[%l7 + %o1] 0x89
	or	%o0,	%l6,	%o6
	nop
	set	0x78, %g5
	std	%i4,	[%l7 + %g5]
	set	0x48, %o3
	stha	%l2,	[%l7 + %o3] 0x81
	nop
	set	0x14, %i7
	stw	%l3,	[%l7 + %i7]
	nop
	set	0x64, %g3
	lduw	[%l7 + %g3],	%g5
	set	0x40, %o7
	prefetcha	[%l7 + %o7] 0x81,	 3
	ld	[%l7 + 0x68],	%f24
	nop
	set	0x18, %l4
	lduh	[%l7 + %l4],	%g1
	nop
	set	0x7B, %i3
	stb	%l1,	[%l7 + %i3]
	nop
	set	0x50, %g6
	ldsw	[%l7 + %g6],	%i5
	nop
	set	0x46, %i2
	ldstub	[%l7 + %i2],	%o2
	add	%o7,	%l5,	%i7
	nop
	set	0x5C, %o4
	lduw	[%l7 + %o4],	%g2
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%o0
	bge	%icc,	loop_15
	nop
	set	0x10, %o2
	std	%f22,	[%l7 + %o2]
	ld	[%l7 + 0x08],	%f3
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%f24
loop_15:
	nop
	set	0x30, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x42, %o5
	sth	%l0,	[%l7 + %o5]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i0
	ld	[%l7 + 0x74],	%f1
	nop
	set	0x28, %g7
	prefetch	[%l7 + %g7],	 3
	bleu	%xcc,	loop_16
	bg	%icc,	loop_17
	nop
	set	0x64, %l0
	ldsh	[%l7 + %l0],	%g4
	nop
	set	0x7C, %o6
	sth	%i1,	[%l7 + %o6]
loop_16:
	nop
	set	0x4C, %l3
	swap	[%l7 + %l3],	%o4
loop_17:
	nop
	set	0x20, %i0
	ldd	[%l7 + %i0],	%f12
	set	0x30, %g4
	stha	%i3,	[%l7 + %g4] 0x88
	nop
	set	0x18, %i5
	stx	%i2,	[%l7 + %i5]
	set	0x48, %l6
	prefetcha	[%l7 + %l6] 0x81,	 1
	nop
	set	0x40, %l2
	ldx	[%l7 + %l2],	%o5
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%g3
	and	%g7,	%o3,	%l6
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x80
	st	%f3,	[%l7 + 0x4C]
	nop
	nop
	setx	0x046B0FF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x14588CD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f24,	%f25
	nop
	set	0x27, %i4
	ldsb	[%l7 + %i4],	%o6
	set	0x20, %g1
	stda	%i4,	[%l7 + %g1] 0xe2
	membar	#Sync
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l2,	%o0
	st	%f10,	[%l7 + 0x68]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%l4
	set	0x58, %i1
	swapa	[%l7 + %i1] 0x88,	%l3
	set	0x78, %o1
	stxa	%g1,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x60, %o3
	lduw	[%l7 + %o3],	%l1
	nop
	set	0x30, %g5
	ldsw	[%l7 + %g5],	%i5
	nop
	set	0x08, %g3
	prefetch	[%l7 + %g3],	 2
	nop
	set	0x78, %o7
	swap	[%l7 + %o7],	%o2
	set	0x68, %i7
	prefetcha	[%l7 + %i7] 0x80,	 4
	fpadd16s	%f26,	%f15,	%f10
	nop
	set	0x18, %l4
	std	%f24,	[%l7 + %l4]
	st	%fsr,	[%l7 + 0x68]
	set	0x40, %g6
	ldxa	[%l7 + %g6] 0x81,	%i7
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f0
	or	%g2,	%o7,	%l0
	nop
	set	0x48, %o4
	ldx	[%l7 + %o4],	%i6
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f22
	nop
	set	0x34, %o2
	prefetch	[%l7 + %o2],	 4
	set	0x32, %g2
	ldstuba	[%l7 + %g2] 0x88,	%o1
	nop
	set	0x2F, %i6
	ldstub	[%l7 + %i6],	%i0
	set	0x78, %o0
	ldxa	[%l7 + %o0] 0x88,	%i1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%i3
	or	%g4,	%i2,	%o5
	nop
	set	0x68, %g7
	stx	%g3,	[%l7 + %g7]
	set	0x08, %o5
	swapa	[%l7 + %o5] 0x80,	%g6
	fpsub32	%f8,	%f10,	%f2
	set	0x0C, %o6
	stha	%g7,	[%l7 + %o6] 0xe3
	membar	#Sync
	nop
	set	0x48, %l0
	stw	%l6,	[%l7 + %l0]
	nop
	set	0x16, %l3
	sth	%o6,	[%l7 + %l3]
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x81,	 3
	nop
	set	0x6C, %i0
	lduh	[%l7 + %i0],	%i4
	set	0x69, %l6
	ldstuba	[%l7 + %l6] 0x80,	%l2
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x80,	%o0
	add	%l4,	%g5,	%l3
	nop
	set	0x7F, %l1
	ldstub	[%l7 + %l1],	%l1
	nop
	set	0x78, %l5
	stx	%fsr,	[%l7 + %l5]
	set	0x68, %i4
	stxa	%g1,	[%l7 + %i4] 0xe2
	membar	#Sync
	st	%fsr,	[%l7 + 0x44]
	set	0x30, %g1
	stda	%i4,	[%l7 + %g1] 0x89
	set	0x78, %l2
	stda	%o2,	[%l7 + %l2] 0x88
	nop
	set	0x0A, %i1
	ldsb	[%l7 + %i1],	%l5
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x80,	 3
	fpsub16s	%f0,	%f13,	%f16
	set	0x20, %g5
	stxa	%o7,	[%l7 + %g5] 0xe3
	membar	#Sync
	set	0x48, %o3
	ldxa	[%l7 + %o3] 0x81,	%g2
	set	0x10, %o7
	stda	%i6,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xda
	nop
	set	0x40, %g3
	lduw	[%l7 + %g3],	%l0
	nop
	set	0x60, %g6
	stx	%fsr,	[%l7 + %g6]
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%i0
	st	%f16,	[%l7 + 0x60]
	set	0x30, %i2
	stxa	%i1,	[%l7 + %i2] 0x80
	and	%o4,	%o1,	%g4
	nop
	set	0x28, %i3
	std	%f30,	[%l7 + %i3]
	nop
	set	0x70, %o4
	prefetch	[%l7 + %o4],	 3
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x80,	%i2
	nop
	set	0x08, %g2
	ldsh	[%l7 + %g2],	%o5
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 3
	and	%g3,	%g6,	%g7
	nop
	nop
	setx	0x915A6D39CCDD95E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x35D02186837E57D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f16,	%f8
	ld	[%l7 + 0x64],	%f28
	set	0x28, %g7
	prefetcha	[%l7 + %g7] 0x89,	 2
	nop
	set	0x3E, %o0
	ldub	[%l7 + %o0],	%i2
	nop
	set	0x5E, %o6
	ldsh	[%l7 + %o6],	%o3
	nop
	set	0x0E, %o5
	lduh	[%l7 + %o5],	%i4
	add	%o6,	%o0,	%l4
	nop
	set	0x34, %l3
	prefetch	[%l7 + %l3],	 2
	set	0x24, %l0
	swapa	[%l7 + %l0] 0x88,	%g5
	nop
	set	0x0C, %i0
	stw	%l2,	[%l7 + %i0]
	set	0x40, %g4
	stda	%l0,	[%l7 + %g4] 0xe2
	membar	#Sync
	nop
	set	0x60, %l6
	lduw	[%l7 + %l6],	%l3
	or	%g1,	%o2,	%i5
	nop
	set	0x27, %i5
	ldsb	[%l7 + %i5],	%l5
	nop
	set	0x68, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x70, %l5
	std	%i6,	[%l7 + %l5]
	set	0x78, %i4
	prefetcha	[%l7 + %i4] 0x89,	 2
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0xca
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%o7
	wr	%l0,	%i0,	%ccr
	set	0x68, %o1
	sta	%f16,	[%l7 + %o1] 0x80
	nop
	set	0x30, %g5
	ldsw	[%l7 + %g5],	%i6
	nop
	set	0x58, %l2
	ldd	[%l7 + %l2],	%f16
	add	%o4,	%i1,	%g4
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x80,	 4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i3,	%o5
	nop
	set	0x6A, %i7
	lduh	[%l7 + %i7],	%g6
	nop
	set	0x28, %g3
	lduh	[%l7 + %g3],	%g3
	nop
	set	0x3B, %g6
	ldsb	[%l7 + %g6],	%g7
	set	0x38, %o7
	lda	[%l7 + %o7] 0x89,	%f23
	nop
	set	0x08, %l4
	swap	[%l7 + %l4],	%i2
	set	0x0C, %i3
	sta	%f1,	[%l7 + %i3] 0x89
	nop
	set	0x48, %i2
	stx	%l6,	[%l7 + %i2]
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0xd8
	nop
	set	0x08, %o4
	sth	%o3,	[%l7 + %o4]
	nop
	set	0x78, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x60, %g7
	std	%f12,	[%l7 + %g7]
	st	%fsr,	[%l7 + 0x3C]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%o0
	nop
	set	0x70, %g2
	lduw	[%l7 + %g2],	%i4
	ld	[%l7 + 0x0C],	%f27
	set	0x14, %o0
	lda	[%l7 + %o0] 0x80,	%f28
	nop
	set	0x0C, %o6
	stw	%g5,	[%l7 + %o6]
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l2,	%l4
	nop
	set	0x60, %l0
	swap	[%l7 + %l0],	%l1
	and	%g1,	%o2,	%l3
	set	0x18, %o5
	ldxa	[%l7 + %o5] 0x80,	%i5
	ld	[%l7 + 0x74],	%f19
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%i7
	nop
	set	0x38, %l6
	stw	%l5,	[%l7 + %l6]
	or	%g2,	%o7,	%i0
	ba,a,pt	%icc,	loop_18
	nop
	set	0x24, %i5
	ldsw	[%l7 + %i5],	%i6
	set	0x58, %l1
	stwa	%o4,	[%l7 + %l1] 0x89
loop_18:
	nop
	set	0x5F, %l5
	ldub	[%l7 + %l5],	%l0
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	0xCC3, 	%sys_tick_cmpr
	nop
	set	0x78, %i4
	std	%i2,	[%l7 + %i4]
	set	0x50, %g1
	ldxa	[%l7 + %g1] 0x80,	%o5
	nop
	set	0x60, %i1
	stx	%fsr,	[%l7 + %i1]
	nop
	set	0x70, %o1
	std	%f20,	[%l7 + %o1]
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f0
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f16
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g4
	st	%fsr,	[%l7 + 0x50]
	nop
	set	0x40, %o3
	std	%f12,	[%l7 + %o3]
	nop
	set	0x58, %i7
	prefetch	[%l7 + %i7],	 2
	nop
	set	0x51, %g3
	ldstub	[%l7 + %g3],	%g7
	nop
	set	0x24, %g6
	lduw	[%l7 + %g6],	%g3
	nop
	set	0x24, %g5
	lduw	[%l7 + %g5],	%i2
	nop
	set	0x08, %o7
	stx	%o3,	[%l7 + %o7]
	nop
	set	0x60, %i3
	stw	%l6,	[%l7 + %i3]
	set	0x3C, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o6
	ble,a,pn	%xcc,	loop_19
	or	%i4,	%o0,	%g5
	nop
	set	0x68, %l4
	ldub	[%l7 + %l4],	%l4
	set	0x0C, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l2
loop_19:
	nop
	set	0x28, %i6
	stwa	%g1,	[%l7 + %i6] 0xe2
	membar	#Sync
	nop
	set	0x10, %o4
	stx	%l1,	[%l7 + %o4]
	nop
	set	0x20, %g2
	stx	%fsr,	[%l7 + %g2]
	nop
	set	0x34, %o0
	ldsw	[%l7 + %o0],	%o2
	st	%f29,	[%l7 + 0x08]
	nop
	set	0x58, %g7
	std	%f4,	[%l7 + %g7]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%i7
	nop
	set	0x10, %l3
	ldsw	[%l7 + %l3],	%l5
	nop
	set	0x44, %l0
	ldub	[%l7 + %l0],	%l3
	fpadd32s	%f17,	%f26,	%f1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g2,	%o7
	wr 	%g0, 	0x5, 	%fprs
	nop
	set	0x78, %o6
	std	%f18,	[%l7 + %o6]
	set	0x24, %i0
	lda	[%l7 + %i0] 0x88,	%f23
	set	0x38, %o5
	stxa	%i0,	[%l7 + %o5] 0x80
	nop
	set	0x0A, %i5
	ldsh	[%l7 + %i5],	%l0
	set	0x14, %l6
	swapa	[%l7 + %l6] 0x89,	%o1
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x81,	%i2
	set	0x38, %i4
	stda	%i0,	[%l7 + %i4] 0xeb
	membar	#Sync
	set	0x28, %g1
	stda	%o4,	[%l7 + %g1] 0xea
	membar	#Sync
	nop
	set	0x52, %i1
	ldsh	[%l7 + %i1],	%g4
	set	0x68, %o1
	lda	[%l7 + %o1] 0x80,	%f6
	wr	%g6,	%g7,	%set_softint
	set	0x38, %g4
	stxa	%i2,	[%l7 + %g4] 0x89
	and	%o3,	%l6,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%o0
	set	0x40, %l2
	ldxa	[%l7 + %l2] 0x89,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x89,	%g5,	%l4
	nop
	set	0x08, %l5
	ldsw	[%l7 + %l5],	%l2
	set	0x50, %i7
	stda	%l0,	[%l7 + %i7] 0xe3
	membar	#Sync
	st	%fsr,	[%l7 + 0x64]
	or	%g1,	%o2,	%i7
	set	0x37, %g3
	ldstuba	[%l7 + %g3] 0x89,	%i5
	nop
	set	0x44, %g6
	prefetch	[%l7 + %g6],	 1
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xc2
	nop
	set	0x64, %o7
	prefetch	[%l7 + %o7],	 2
	nop
	set	0x58, %g5
	sth	%l5,	[%l7 + %g5]
	set	0x64, %i3
	sta	%f27,	[%l7 + %i3] 0x80
	st	%fsr,	[%l7 + 0x78]
	set	0x68, %i2
	stda	%l2,	[%l7 + %i2] 0x81
	set	0x1E, %o2
	ldstuba	[%l7 + %o2] 0x81,	%o7
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xd8,	%f16
	set	0x24, %o4
	stwa	%i6,	[%l7 + %o4] 0xeb
	membar	#Sync
	st	%f5,	[%l7 + 0x1C]
	nop
	set	0x10, %g2
	ldsh	[%l7 + %g2],	%o4
	nop
	set	0x60, %l4
	std	%i0,	[%l7 + %l4]
	nop
	set	0x0B, %o0
	ldsb	[%l7 + %o0],	%g2
	nop
	set	0x1C, %l3
	lduh	[%l7 + %l3],	%o1
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%l0
	nop
	set	0x7C, %o6
	ldsb	[%l7 + %o6],	%i3
	set	0x41, %g7
	ldstuba	[%l7 + %g7] 0x88,	%o5
	set	0x68, %i0
	ldxa	[%l7 + %i0] 0x80,	%g4
	wr	%i1,	%g7,	%pic
	nop
	set	0x68, %o5
	stx	%i2,	[%l7 + %o5]
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf9,	%f16
	set	0x44, %l1
	stwa	%o3,	[%l7 + %l1] 0x88
	ld	[%l7 + 0x30],	%f24
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x81
	st	%fsr,	[%l7 + 0x18]
	set	0x48, %i4
	lda	[%l7 + %i4] 0x80,	%f8
	nop
	set	0x46, %g1
	stb	%g6,	[%l7 + %g1]
	nop
	set	0x1F, %o1
	stb	%g3,	[%l7 + %o1]
	nop
	set	0x34, %i1
	ldsb	[%l7 + %i1],	%l6
	nop
	set	0x25, %g4
	stb	%o6,	[%l7 + %g4]
	nop
	set	0x31, %l2
	ldub	[%l7 + %l2],	%o0
	nop
	set	0x68, %i7
	stx	%fsr,	[%l7 + %i7]
	nop
	set	0x18, %g3
	std	%f6,	[%l7 + %g3]
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x81,	%g5
	nop
	set	0x3A, %o3
	sth	%i4,	[%l7 + %o3]
	nop
	set	0x30, %o7
	std	%f10,	[%l7 + %o7]
	nop
	set	0x2E, %l5
	lduh	[%l7 + %l5],	%l2
	nop
	set	0x38, %g5
	stx	%fsr,	[%l7 + %g5]
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x81,	 0
	set	0x40, %o2
	stwa	%g1,	[%l7 + %o2] 0xeb
	membar	#Sync
	nop
	set	0x36, %i6
	ldsh	[%l7 + %i6],	%l4
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%o2
	nop
	set	0x30, %g2
	stx	%i7,	[%l7 + %g2]
	nop
	set	0x62, %o4
	stb	%i5,	[%l7 + %o4]
	set	0x70, %o0
	ldda	[%l7 + %o0] 0x81,	%l4
	set	0x74, %l4
	swapa	[%l7 + %l4] 0x80,	%o7
	set	0x64, %l3
	swapa	[%l7 + %l3] 0x81,	%i6
	ld	[%l7 + 0x58],	%f22
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%l2
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%o4
	set	0x08, %g7
	stba	%g2,	[%l7 + %g7] 0x88
	nop
	set	0x38, %i0
	prefetch	[%l7 + %i0],	 3
	nop
	set	0x74, %o5
	ldsw	[%l7 + %o5],	%o1
	set	0x6C, %l1
	sta	%f31,	[%l7 + %l1] 0x89
	nop
	set	0x16, %i5
	ldsh	[%l7 + %i5],	%i0
	set	0x4C, %l6
	stba	%l0,	[%l7 + %l6] 0x80
	nop
	set	0x10, %i4
	std	%o4,	[%l7 + %i4]
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f10
	nop
	set	0x4E, %g1
	ldub	[%l7 + %g1],	%g4
	wr	%i3,	%g7,	%softint
	nop
	set	0x40, %i1
	stw	%i2,	[%l7 + %i1]
	nop
	nop
	setx	0x347C9D692698167E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8B837D51D3B14F18,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f8,	%f2
	nop
	set	0x5A, %g4
	sth	%i1,	[%l7 + %g4]
	nop
	set	0x28, %i7
	swap	[%l7 + %i7],	%g6
	nop
	set	0x40, %g3
	std	%o2,	[%l7 + %g3]
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	ld	[%l7 + 0x1C],	%f12
	nop
	set	0x48, %o3
	lduh	[%l7 + %o3],	%l6
	nop
	set	0x0C, %g6
	lduw	[%l7 + %g6],	%g3
	set	0x18, %o7
	stxa	%o0,	[%l7 + %o7] 0x89
	nop
	set	0x48, %g5
	lduh	[%l7 + %g5],	%o6
	nop
	set	0x3C, %l5
	stw	%i4,	[%l7 + %l5]
	ld	[%l7 + 0x3C],	%f17
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%g5
	nop
	set	0x4E, %i6
	sth	%l1,	[%l7 + %i6]
	st	%fsr,	[%l7 + 0x14]
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%l2
	nop
	set	0x53, %i2
	ldstub	[%l7 + %i2],	%o2
	or	%l4,	%i5,	%l5
	st	%fsr,	[%l7 + 0x60]
	add	%o7,	%i6,	%l3
	nop
	set	0x24, %g2
	ldstub	[%l7 + %g2],	%o4
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd8,	%f16
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xd2,	%f16
	or	%g2,	%i7,	%o1
	set	0x5C, %o0
	lda	[%l7 + %o0] 0x88,	%f24
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x89,	 3
	fpsub16s	%f23,	%f15,	%f4
	set	0x30, %l3
	stxa	%l0,	[%l7 + %l3] 0x89
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x81,	%o5
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf0,	%f0
	and	%g4,	%g7,	%i3
	nop
	set	0x78, %i0
	lduw	[%l7 + %i0],	%i2
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x89,	%g6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x81,	%o3,	%l6
	ld	[%l7 + 0x28],	%f12
	nop
	set	0x28, %l1
	std	%f30,	[%l7 + %l1]
	st	%f31,	[%l7 + 0x5C]
	set	0x74, %i5
	lda	[%l7 + %i5] 0x89,	%f6
	set	0x3B, %o5
	stba	%i1,	[%l7 + %o5] 0xeb
	membar	#Sync
	bleu,a,pt	%xcc,	loop_20
	nop
	set	0x28, %l6
	stx	%fsr,	[%l7 + %l6]
	set	0x18, %i4
	stha	%g3,	[%l7 + %i4] 0xe3
	membar	#Sync
loop_20:
	nop
	set	0x74, %o1
	swap	[%l7 + %o1],	%o6
	nop
	set	0x30, %i1
	stx	%i4,	[%l7 + %i1]
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x89,	 1
	set	0x65, %i7
	stba	%o0,	[%l7 + %i7] 0x89
	fpadd32	%f0,	%f22,	%f20
	nop
	set	0x18, %g3
	ldstub	[%l7 + %g3],	%g1
	nop
	set	0x30, %l2
	std	%l2,	[%l7 + %l2]
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x89,	%o2
	nop
	set	0x54, %g6
	lduw	[%l7 + %g6],	%l1
	set	0x30, %o3
	ldda	[%l7 + %o3] 0x80,	%i4
	nop
	set	0x3D, %o7
	stb	%l5,	[%l7 + %o7]
	nop
	set	0x10, %l5
	stw	%l4,	[%l7 + %l5]
	nop
	set	0x58, %g5
	sth	%o7,	[%l7 + %g5]
	set	0x14, %o2
	swapa	[%l7 + %o2] 0x80,	%l3
	set	0x52, %i2
	ldstuba	[%l7 + %i2] 0x80,	%o4
	nop
	set	0x62, %i6
	sth	%g2,	[%l7 + %i6]
	or	%i6,	%i7,	%o1
	ld	[%l7 + 0x20],	%f25
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x80
	nop
	set	0x08, %i3
	ldsw	[%l7 + %i3],	%l0
	set	0x40, %o4
	stxa	%o5,	[%l7 + %o4] 0x89
	nop
	set	0x48, %o0
	ldd	[%l7 + %o0],	%i0
	set	0x70, %l4
	ldda	[%l7 + %l4] 0xe3,	%g6
	wr	%i3,	%g4,	%ccr
	nop
	set	0x28, %l0
	stw	%i2,	[%l7 + %l0]
	nop
	set	0x1A, %g7
	sth	%g6,	[%l7 + %g7]
	st	%f29,	[%l7 + 0x40]
	set	0x70, %l3
	ldda	[%l7 + %l3] 0xe3,	%i6
	set	0x20, %o6
	sta	%f27,	[%l7 + %o6] 0x89
	set	0x38, %l1
	ldxa	[%l7 + %l1] 0x81,	%o3
	set	0x28, %i5
	stha	%i1,	[%l7 + %i5] 0x81
	st	%f12,	[%l7 + 0x64]
	fpadd32s	%f5,	%f17,	%f12
	nop
	set	0x30, %i0
	std	%o6,	[%l7 + %i0]
	set	0x28, %o5
	stda	%g2,	[%l7 + %o5] 0xeb
	membar	#Sync
	nop
	set	0x70, %i4
	std	%i4,	[%l7 + %i4]
	nop
	set	0x24, %l6
	swap	[%l7 + %l6],	%o0
	nop
	set	0x5A, %o1
	ldstub	[%l7 + %o1],	%g5
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xc8
	nop
	set	0x31, %i1
	ldsb	[%l7 + %i1],	%g1
	add	%l2,	%l1,	%i5
	set	0x2B, %g3
	stba	%l5,	[%l7 + %g3] 0xea
	membar	#Sync
	set	0x50, %l2
	ldda	[%l7 + %l2] 0xe3,	%l4
	st	%fsr,	[%l7 + 0x40]
	nop
	set	0x70, %g1
	lduw	[%l7 + %g1],	%o7
	set	0x30, %g6
	ldxa	[%l7 + %g6] 0x81,	%o2
	nop
	set	0x44, %o3
	swap	[%l7 + %o3],	%o4
	set	0x40, %i7
	sta	%f3,	[%l7 + %i7] 0x81
	set	0x36, %l5
	ldstuba	[%l7 + %l5] 0x81,	%g2
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xe2,	%i6
	set	0x41, %o2
	ldstuba	[%l7 + %o2] 0x88,	%l3
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%o0
	set	0x4F, %i6
	ldstuba	[%l7 + %i6] 0x88,	%i7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x80,	%o5,	%i0
	set	0x38, %i2
	ldstuba	[%l7 + %i2] 0x81,	%g7
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x88,	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x88,	%l0,	%g4
	nop
	set	0x60, %g2
	stw	%g6,	[%l7 + %g2]
	nop
	set	0x48, %o4
	stx	%i2,	[%l7 + %o4]
	nop
	set	0x54, %o0
	stw	%l6,	[%l7 + %o0]
	nop
	set	0x34, %l4
	ldub	[%l7 + %l4],	%o3
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%o6
	set	0x5C, %g7
	stwa	%g3,	[%l7 + %g7] 0xe2
	membar	#Sync
	nop
	set	0x4C, %o6
	lduw	[%l7 + %o6],	%i4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf9,	%f0
	or	%i1,	%g5,	%g1
	nop
	set	0x2C, %i5
	swap	[%l7 + %i5],	%o0
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f26
	nop
	set	0x40, %l3
	ldd	[%l7 + %l3],	%f10
	or	%l1,	%l2,	%i5
	set	0x18, %i4
	stxa	%l5,	[%l7 + %i4] 0x81
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x81,	%o7,	%l4
	set	0x50, %l6
	prefetcha	[%l7 + %l6] 0x80,	 3
	st	%f29,	[%l7 + 0x54]
	ld	[%l7 + 0x60],	%f1
	nop
	set	0x50, %o5
	stx	%o4,	[%l7 + %o5]
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x89,	%i6
	set	0x27, %i1
	ldstuba	[%l7 + %i1] 0x81,	%l3
	or	%o1,	%g2,	%i7
	nop
	set	0x36, %g3
	lduh	[%l7 + %g3],	%i0
	set	0x4C, %g4
	swapa	[%l7 + %g4] 0x88,	%o5
	set	0x30, %g1
	swapa	[%l7 + %g1] 0x81,	%g7
	set	0x58, %g6
	ldxa	[%l7 + %g6] 0x88,	%l0
	set	0x20, %l2
	stwa	%g4,	[%l7 + %l2] 0xea
	membar	#Sync
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0xf1
	membar	#Sync
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%f26
	set	0x6C, %l5
	swapa	[%l7 + %l5] 0x88,	%g6
	nop
	set	0x78, %o2
	ldsw	[%l7 + %o2],	%i3
	or	%l6,	%o3,	%i2
	set	0x74, %o7
	stwa	%o6,	[%l7 + %o7] 0x89
	st	%f28,	[%l7 + 0x14]
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%i4
	set	0x08, %i6
	stda	%g2,	[%l7 + %i6] 0x88
	or	%i1,	%g1,	%g5
	set	0x10, %i3
	stwa	%l1,	[%l7 + %i3] 0xeb
	membar	#Sync
	fpadd16s	%f30,	%f31,	%f25
	nop
	set	0x20, %g2
	lduw	[%l7 + %g2],	%l2
	nop
	set	0x4C, %i2
	lduw	[%l7 + %i2],	%o0
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0xcc
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%l5
	st	%fsr,	[%l7 + 0x50]
	set	0x50, %o4
	lda	[%l7 + %o4] 0x89,	%f21
	set	0x40, %g7
	sta	%f17,	[%l7 + %g7] 0x81
	nop
	set	0x40, %l0
	ldx	[%l7 + %l0],	%o7
	nop
	set	0x74, %l1
	ldsw	[%l7 + %l1],	%i5
	nop
	set	0x30, %o6
	stx	%l4,	[%l7 + %o6]
	set	0x54, %i0
	swapa	[%l7 + %i0] 0x88,	%o4
	set	0x18, %i5
	stda	%o2,	[%l7 + %i5] 0x88
	nop
	nop
	setx	0x1A2CDF1B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x326C8E41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f5,	%f30
	nop
	set	0x78, %i4
	swap	[%l7 + %i4],	%i6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xca
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x81,	%f0
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f10
	nop
	set	0x08, %i1
	stx	%l3,	[%l7 + %i1]
	ld	[%l7 + 0x30],	%f26
	nop
	set	0x60, %g3
	stx	%o1,	[%l7 + %g3]
	bl,a	%xcc,	loop_21
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%g2
	nop
	set	0x4A, %g1
	lduh	[%l7 + %g1],	%i0
	nop
	set	0x38, %g6
	ldsb	[%l7 + %g6],	%o5
loop_21:
	nop
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i7,	%g7
	nop
	set	0x50, %l2
	ldub	[%l7 + %l2],	%l0
	nop
	set	0x67, %o3
	ldstub	[%l7 + %o3],	%g4
	nop
	set	0x2C, %i7
	ldsw	[%l7 + %i7],	%g6
	nop
	set	0x32, %o2
	ldsh	[%l7 + %o2],	%i3
	nop
	set	0x40, %o7
	ldsb	[%l7 + %o7],	%l6
	nop
	set	0x40, %g5
	ldsh	[%l7 + %g5],	%o3
	nop
	set	0x5D, %i6
	ldstub	[%l7 + %i6],	%o6
	set	0x3A, %i3
	stha	%i4,	[%l7 + %i3] 0xea
	membar	#Sync
	fpadd16	%f28,	%f28,	%f26
	set	0x40, %l5
	sta	%f7,	[%l7 + %l5] 0x80
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x88,	%i2,	%i1
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f4
	set	0x5B, %o0
	ldstuba	[%l7 + %o0] 0x89,	%g1
	nop
	set	0x3C, %l4
	stw	%g3,	[%l7 + %l4]
	st	%f10,	[%l7 + 0x3C]
	nop
	set	0x3C, %g2
	ldsw	[%l7 + %g2],	%g5
	fpadd16s	%f1,	%f28,	%f18
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%l1
	nop
	set	0x20, %g7
	ldx	[%l7 + %g7],	%o0
	and	%l5,	%o7,	%i5
	nop
	set	0x28, %l0
	stx	%fsr,	[%l7 + %l0]
	fpsub32s	%f16,	%f16,	%f9
	nop
	set	0x54, %o6
	swap	[%l7 + %o6],	%l4
	nop
	set	0x24, %i0
	swap	[%l7 + %i0],	%o4
	nop
	set	0x4A, %l1
	lduh	[%l7 + %l1],	%o2
	nop
	set	0x53, %i4
	ldub	[%l7 + %i4],	%i6
	set	0x18, %i5
	stba	%l3,	[%l7 + %i5] 0xe3
	membar	#Sync
	add	%l2,	%g2,	%i0
	set	0x48, %l6
	stwa	%o5,	[%l7 + %l6] 0x80
	nop
	set	0x32, %l3
	ldsh	[%l7 + %l3],	%o1
	set	0x28, %i1
	ldxa	[%l7 + %i1] 0x89,	%i7
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f16
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	nop
	set	0x27, %g1
	ldub	[%l7 + %g1],	%l0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x80,	%f16
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%g6
	nop
	set	0x2E, %l2
	sth	%i3,	[%l7 + %l2]
	fpsub16	%f20,	%f10,	%f16
	nop
	set	0x1E, %o3
	stb	%g4,	[%l7 + %o3]
	set	0x58, %g4
	prefetcha	[%l7 + %g4] 0x80,	 2
	nop
	set	0x11, %i7
	ldsb	[%l7 + %i7],	%o6
	add	%o3,	%i4,	%i2
	st	%f9,	[%l7 + 0x40]
	nop
	set	0x78, %o7
	std	%g0,	[%l7 + %o7]
	nop
	set	0x10, %g5
	ldsb	[%l7 + %g5],	%i1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g5,	%l1
	nop
	set	0x08, %o2
	std	%g2,	[%l7 + %o2]
	set	0x70, %i6
	lda	[%l7 + %i6] 0x88,	%f19
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l5,	%o0
	nop
	set	0x62, %l5
	ldub	[%l7 + %l5],	%i5
	set	0x36, %i2
	stha	%l4,	[%l7 + %i2] 0x89
	nop
	set	0x18, %o0
	ldd	[%l7 + %o0],	%o4
	or	%o7,	%o2,	%l3
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%i6
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f20
	set	0x41, %o4
	stba	%g2,	[%l7 + %o4] 0x89
	set	0x50, %g7
	ldda	[%l7 + %g7] 0xe2,	%i0
	ld	[%l7 + 0x50],	%f14
	and	%o5,	%o1,	%i7
	nop
	set	0x18, %l0
	std	%f24,	[%l7 + %l0]
	nop
	set	0x40, %o6
	ldd	[%l7 + %o6],	%g6
	nop
	nop
	setx	0x127898C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x5CC84964,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f18,	%f21
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x89,	 1
	st	%fsr,	[%l7 + 0x34]
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%g6
	nop
	set	0x48, %i0
	stx	%g4,	[%l7 + %i0]
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xd0,	%f0
	or	%l6,	%o6,	%i3
	ld	[%l7 + 0x2C],	%f15
	nop
	set	0x68, %i4
	stx	%fsr,	[%l7 + %i4]
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf8
	membar	#Sync
	set	0x6C, %l6
	lda	[%l7 + %l6] 0x88,	%f19
	be	%xcc,	loop_22
	nop
	set	0x38, %i1
	stw	%i4,	[%l7 + %i1]
	set	0x2C, %o5
	swapa	[%l7 + %o5] 0x88,	%o3
loop_22:
	st	%f10,	[%l7 + 0x28]
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%f6
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x81,	 2
	nop
	set	0x10, %g1
	lduw	[%l7 + %g1],	%i1
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%g4
	nop
	set	0x38, %g6
	stx	%fsr,	[%l7 + %g6]
	set	0x70, %o3
	stba	%l1,	[%l7 + %o3] 0xe2
	membar	#Sync
	nop
	set	0x30, %l2
	stx	%g3,	[%l7 + %l2]
	nop
	set	0x50, %i7
	sth	%i2,	[%l7 + %i7]
	wr	%l5,	%i5,	%softint
	ld	[%l7 + 0x58],	%f6
	be,a,pn	%icc,	loop_23
	and	%o0,	%l4,	%o7
	nop
	set	0x3C, %g4
	swap	[%l7 + %g4],	%o4
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f26
loop_23:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%i6
	and	%g2,	%i0,	%o5
	set	0x4B, %o7
	stba	%l3,	[%l7 + %o7] 0xe2
	membar	#Sync
	nop
	set	0x4A, %o2
	sth	%i7,	[%l7 + %o2]
	nop
	set	0x5D, %l5
	ldub	[%l7 + %l5],	%g7
	or	%l2,	%l0,	%o1
	set	0x68, %i6
	sta	%f1,	[%l7 + %i6] 0x80
	nop
	set	0x2E, %i2
	ldstub	[%l7 + %i2],	%g4
	nop
	set	0x7F, %i3
	ldsb	[%l7 + %i3],	%g6
	set	0x74, %o0
	sta	%f15,	[%l7 + %o0] 0x89
	nop
	set	0x50, %g2
	std	%f18,	[%l7 + %g2]
	nop
	set	0x2C, %o4
	ldsw	[%l7 + %o4],	%o6
	set	0x38, %g7
	swapa	[%l7 + %g7] 0x81,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i3,	%i4
	nop
	set	0x40, %o6
	ldx	[%l7 + %o6],	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%i1
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%f28
	nop
	set	0x6C, %i0
	stw	%g5,	[%l7 + %i0]
	set	0x40, %l1
	stxa	%g3,	[%l7 + %l1] 0x89
	set	0x3C, %l0
	sta	%f23,	[%l7 + %l0] 0x88
	ld	[%l7 + 0x5C],	%f27
	nop
	set	0x68, %i5
	ldsw	[%l7 + %i5],	%i2
	nop
	set	0x12, %l6
	stb	%l5,	[%l7 + %l6]
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%l0
	set	0x40, %i4
	stxa	%i5,	[%l7 + %i4] 0xe2
	membar	#Sync
	nop
	set	0x6A, %l3
	ldsb	[%l7 + %l3],	%o0
	nop
	set	0x5C, %o1
	stw	%l4,	[%l7 + %o1]
	set	0x55, %o5
	stba	%o4,	[%l7 + %o5] 0x89
	nop
	set	0x34, %g3
	lduw	[%l7 + %g3],	%o2
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%o6
	nop
	set	0x2B, %g6
	ldub	[%l7 + %g6],	%i6
	nop
	set	0x60, %o3
	ldd	[%l7 + %o3],	%g2
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x88
	set	0x28, %l2
	sta	%f27,	[%l7 + %l2] 0x89
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x88,	%o4
	nop
	set	0x68, %o7
	lduw	[%l7 + %o7],	%i0
	add	%l3,	%g7,	%i7
	or	%l0,	%l2,	%g4
	fpsub16s	%f15,	%f9,	%f16
	and	%g6,	%o6,	%l6
	nop
	set	0x58, %o2
	stx	%o1,	[%l7 + %o2]
	add	%i4,	%i3,	%o3
	nop
	set	0x6C, %l5
	ldsw	[%l7 + %l5],	%g1
	set	0x58, %i6
	stda	%i0,	[%l7 + %i6] 0x80
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%f28
	nop
	set	0x40, %i3
	ldstub	[%l7 + %i3],	%g5
	nop
	set	0x20, %o0
	prefetch	[%l7 + %o0],	 3
	bn,pn	%icc,	loop_24
	st	%f7,	[%l7 + 0x7C]
	bge,a,pn	%xcc,	loop_25
	nop
	set	0x38, %g2
	stx	%fsr,	[%l7 + %g2]
loop_24:
	nop
	set	0x14, %o4
	lda	[%l7 + %o4] 0x89,	%f17
loop_25:
	and	%g3,	%i2,	%l1
	set	0x70, %i2
	stxa	%l5,	[%l7 + %i2] 0x80
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%i5
	nop
	set	0x1C, %g7
	ldsw	[%l7 + %g7],	%o4
	nop
	set	0x70, %o6
	stw	%l4,	[%l7 + %o6]
	nop
	set	0x4C, %l4
	ldsw	[%l7 + %l4],	%o2
	nop
	set	0x78, %l1
	ldsh	[%l7 + %l1],	%o7
	set	0x18, %l0
	stxa	%i6,	[%l7 + %l0] 0x81
	nop
	set	0x40, %i5
	stx	%fsr,	[%l7 + %i5]
	nop
	set	0x66, %l6
	ldsh	[%l7 + %l6],	%o5
	nop
	set	0x6C, %i1
	ldsw	[%l7 + %i1],	%g2
	nop
	set	0x4C, %i0
	swap	[%l7 + %i0],	%l3
	st	%fsr,	[%l7 + 0x48]
	nop
	set	0x46, %i4
	ldsh	[%l7 + %i4],	%g7
	nop
	set	0x50, %l3
	ldd	[%l7 + %l3],	%f30
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%i7
	set	0x48, %o1
	stda	%l0,	[%l7 + %o1] 0x89
	set	0x30, %g1
	lda	[%l7 + %g1] 0x80,	%f10
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i0,	%l2
	nop
	set	0x26, %g3
	lduh	[%l7 + %g3],	%g4
	set	0x40, %o3
	lda	[%l7 + %o3] 0x80,	%f23
	nop
	set	0x14, %i7
	ldsw	[%l7 + %i7],	%o6
	nop
	set	0x60, %l2
	ldsb	[%l7 + %l2],	%g6
	st	%fsr,	[%l7 + 0x30]
	nop
	set	0x34, %g5
	lduh	[%l7 + %g5],	%l6
	ld	[%l7 + 0x30],	%f22
	nop
	set	0x58, %g6
	swap	[%l7 + %g6],	%i4
	nop
	set	0x30, %o2
	ldsh	[%l7 + %o2],	%o1
	nop
	set	0x41, %o7
	stb	%o3,	[%l7 + %o7]
	nop
	set	0x52, %l5
	ldub	[%l7 + %l5],	%g1
	nop
	set	0x70, %g4
	stx	%i1,	[%l7 + %g4]
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%f22
	nop
	set	0x78, %o0
	swap	[%l7 + %o0],	%i3
	nop
	set	0x30, %i6
	ldub	[%l7 + %i6],	%g3
	set	0x2E, %g2
	ldstuba	[%l7 + %g2] 0x80,	%g5
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x89
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%l1
	bg,pn	%xcc,	loop_26
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%l5
	nop
	set	0x5A, %l4
	sth	%o0,	[%l7 + %l4]
	set	0x38, %l1
	stxa	%i2,	[%l7 + %l1] 0xea
	membar	#Sync
loop_26:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o4,	%l4
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x81,	 1
	nop
	set	0x28, %l0
	lduw	[%l7 + %l0],	%o7
	nop
	set	0x5B, %l6
	ldstub	[%l7 + %l6],	%i5
	and	%o5,	%g2,	%i6
	fpadd32s	%f13,	%f20,	%f7
	ld	[%l7 + 0x74],	%f11
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x80,	%g6
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x80,	%l3
	st	%f8,	[%l7 + 0x7C]
	set	0x68, %i1
	stxa	%i7,	[%l7 + %i1] 0xe2
	membar	#Sync
	add	%i0,	%l0,	%g4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x89,	%o6,	%g6
	set	0x60, %l3
	stba	%l2,	[%l7 + %l3] 0xeb
	membar	#Sync
	bg	%icc,	loop_27
	or	%i4,	%l6,	%o3
	nop
	set	0x44, %o5
	stw	%g1,	[%l7 + %o5]
	set	0x40, %o1
	prefetcha	[%l7 + %o1] 0x81,	 4
loop_27:
	nop
	set	0x50, %g1
	stda	%o0,	[%l7 + %g1] 0x88
	set	0x24, %g3
	sta	%f16,	[%l7 + %g3] 0x81
	set	0x74, %o3
	stha	%i3,	[%l7 + %o3] 0x89
	st	%f28,	[%l7 + 0x70]
	fpsub32s	%f23,	%f21,	%f13
	nop
	set	0x68, %i4
	stw	%g5,	[%l7 + %i4]
	nop
	set	0x77, %l2
	ldstub	[%l7 + %l2],	%l1
	and	%g3,	%l5,	%o0
	nop
	set	0x6C, %g5
	sth	%o4,	[%l7 + %g5]
	nop
	set	0x46, %i7
	sth	%l4,	[%l7 + %i7]
	nop
	set	0x40, %o2
	ldx	[%l7 + %o2],	%o2
	ld	[%l7 + 0x6C],	%f6
	nop
	set	0x34, %g6
	stw	%i2,	[%l7 + %g6]
	nop
	set	0x20, %o7
	swap	[%l7 + %o7],	%o7
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%i4
	nop
	set	0x18, %i3
	ldd	[%l7 + %i3],	%g2
	set	0x54, %o0
	swapa	[%l7 + %o0] 0x88,	%i6
	nop
	set	0x58, %i6
	lduh	[%l7 + %i6],	%g7
	nop
	set	0x6C, %l5
	stw	%o5,	[%l7 + %l5]
	set	0x68, %g2
	lda	[%l7 + %g2] 0x81,	%f31
	nop
	set	0x78, %o4
	swap	[%l7 + %o4],	%i7
	and	%i0,	%l3,	%g4
	nop
	set	0x2E, %o6
	sth	%o6,	[%l7 + %o6]
	set	0x1C, %i2
	swapa	[%l7 + %i2] 0x80,	%g6
	be,a	%icc,	loop_28
	nop
	nop
	setx	0x91277493,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xBE9112F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f11,	%f28
	nop
	set	0x4B, %l1
	stb	%l0,	[%l7 + %l1]
	set	0x14, %l4
	sta	%f16,	[%l7 + %l4] 0x80
loop_28:
	nop
	set	0x08, %g7
	std	%f8,	[%l7 + %g7]
	set	0x7C, %l6
	stha	%l2,	[%l7 + %l6] 0x80
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%o3
	nop
	set	0x50, %l0
	lduh	[%l7 + %l0],	%l6
	set	0x40, %i5
	stxa	%g1,	[%l7 + %i5] 0xeb
	membar	#Sync
	nop
	set	0x42, %i1
	sth	%o1,	[%l7 + %i1]
	nop
	set	0x64, %i0
	sth	%i1,	[%l7 + %i0]
	nop
	set	0x7D, %l3
	ldsb	[%l7 + %l3],	%g5
	nop
	set	0x70, %o5
	stx	%fsr,	[%l7 + %o5]
	nop
	set	0x30, %g1
	ldstub	[%l7 + %g1],	%i3
	wr	%l1,	%g3,	%y
	set	0x3E, %g3
	stha	%l5,	[%l7 + %g3] 0xe2
	membar	#Sync
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o4,	%o0
	or	%o2,	%i2,	%l4
	set	0x70, %o3
	swapa	[%l7 + %o3] 0x88,	%o7
	st	%f13,	[%l7 + 0x24]
	and	%g2,	%i5,	%i6
	set	0x48, %o1
	stda	%g6,	[%l7 + %o1] 0xeb
	membar	#Sync
	nop
	set	0x48, %i4
	ldx	[%l7 + %i4],	%i7
	set	0x20, %l2
	stxa	%o5,	[%l7 + %l2] 0x88
	nop
	set	0x76, %i7
	sth	%l3,	[%l7 + %i7]
	set	0x17, %o2
	stba	%i0,	[%l7 + %o2] 0xe2
	membar	#Sync
	nop
	set	0x45, %g6
	stb	%o6,	[%l7 + %g6]
	nop
	set	0x78, %g5
	std	%g4,	[%l7 + %g5]
	or	%g6,	%l0,	%l2
	wr	%i4,	%o3,	%set_softint
	nop
	set	0x16, %g4
	ldsh	[%l7 + %g4],	%l6
	nop
	set	0x18, %i3
	std	%f22,	[%l7 + %i3]
	nop
	set	0x20, %o0
	stx	%o1,	[%l7 + %o0]
	set	0x34, %i6
	stha	%i1,	[%l7 + %i6] 0x89
	st	%fsr,	[%l7 + 0x58]
	nop
	set	0x18, %o7
	ldd	[%l7 + %o7],	%g0
	nop
	set	0x20, %l5
	swap	[%l7 + %l5],	%g5
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%i3
	ld	[%l7 + 0x40],	%f15
	nop
	set	0x44, %o4
	swap	[%l7 + %o4],	%l1
	ld	[%l7 + 0x08],	%f17
	set	0x4C, %o6
	stwa	%l5,	[%l7 + %o6] 0xe2
	membar	#Sync
	nop
	set	0x20, %l1
	stw	%o4,	[%l7 + %l1]
	ld	[%l7 + 0x70],	%f27
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x81,	%g3,	%o2
	nop
	set	0x78, %i2
	ldd	[%l7 + %i2],	%i2
	set	0x08, %g7
	sta	%f2,	[%l7 + %g7] 0x88
	set	0x48, %l4
	prefetcha	[%l7 + %l4] 0x81,	 2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g2
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%o0
	nop
	set	0x60, %i5
	ldx	[%l7 + %i5],	%i5
	add	%g7,	%i6,	%i7
	nop
	set	0x6C, %l6
	prefetch	[%l7 + %l6],	 1
	nop
	set	0x7C, %i1
	lduh	[%l7 + %i1],	%l3
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x89,	 1
	nop
	set	0x54, %l3
	lduh	[%l7 + %l3],	%i0
	nop
	set	0x68, %g1
	prefetch	[%l7 + %g1],	 2
	nop
	set	0x38, %g3
	std	%g4,	[%l7 + %g3]
	nop
	set	0x08, %o5
	std	%g6,	[%l7 + %o5]
	nop
	set	0x76, %o1
	stb	%o6,	[%l7 + %o1]
	nop
	set	0x50, %o3
	sth	%l0,	[%l7 + %o3]
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xd2
	nop
	set	0x44, %i7
	ldsh	[%l7 + %i7],	%l2
	nop
	set	0x10, %o2
	sth	%i4,	[%l7 + %o2]
	set	0x0B, %i4
	stba	%o3,	[%l7 + %i4] 0x80
	set	0x30, %g5
	stda	%i6,	[%l7 + %g5] 0x81
	set	0x4F, %g6
	stba	%i1,	[%l7 + %g6] 0xeb
	membar	#Sync
	nop
	set	0x40, %i3
	ldx	[%l7 + %i3],	%o1
	set	0x58, %g4
	stba	%g5,	[%l7 + %g4] 0xeb
	membar	#Sync
	nop
	set	0x1C, %i6
	ldsw	[%l7 + %i6],	%i3
	set	0x48, %o0
	stda	%l0,	[%l7 + %o0] 0x80
	set	0x64, %o7
	lda	[%l7 + %o7] 0x88,	%f22
	set	0x34, %g2
	lda	[%l7 + %g2] 0x89,	%f5
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0
	set	0x5F, %o6
	stba	%l5,	[%l7 + %o6] 0xe3
	membar	#Sync
	set	0x20, %l1
	stda	%o4,	[%l7 + %l1] 0x81
	set	0x78, %l5
	sta	%f19,	[%l7 + %l5] 0x89
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%i2
	st	%f21,	[%l7 + 0x10]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x88,	%l4,	%o7
	set	0x21, %i2
	ldstuba	[%l7 + %i2] 0x81,	%o2
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%g2
	fpsub16	%f30,	%f20,	%f6
	nop
	set	0x6E, %l0
	ldsb	[%l7 + %l0],	%o0
	set	0x68, %g7
	ldxa	[%l7 + %g7] 0x81,	%g7
	nop
	nop
	setx	0x31F149AFD5E6DB04,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2AD9AE951A3A3A7B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f24
	nop
	set	0x2C, %l6
	ldsw	[%l7 + %l6],	%i5
	st	%fsr,	[%l7 + 0x14]
	set	0x76, %i1
	stba	%i7,	[%l7 + %i1] 0x89
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%l3
	nop
	set	0x65, %i5
	ldub	[%l7 + %i5],	%i6
	nop
	set	0x2C, %g1
	prefetch	[%l7 + %g1],	 0
	nop
	set	0x20, %l3
	ldsh	[%l7 + %l3],	%o5
	bge,pt	%xcc,	loop_29
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%g4
	set	0x78, %o1
	stxa	%i0,	[%l7 + %o1] 0x89
loop_29:
	ld	[%l7 + 0x0C],	%f5
	set	0x58, %o3
	swapa	[%l7 + %o3] 0x89,	%o6
	or	%l0,	%l2,	%i4
	set	0x59, %l2
	stba	%g6,	[%l7 + %l2] 0x88
	st	%fsr,	[%l7 + 0x24]
	fpsub16s	%f4,	%f0,	%f14
	set	0x7C, %o5
	stha	%o3,	[%l7 + %o5] 0x80
	nop
	set	0x58, %o2
	std	%f8,	[%l7 + %o2]
	nop
	set	0x64, %i7
	sth	%l6,	[%l7 + %i7]
	set	0x10, %i4
	lda	[%l7 + %i4] 0x81,	%f11
	set	0x38, %g6
	prefetcha	[%l7 + %g6] 0x81,	 2
	nop
	set	0x14, %g5
	ldsw	[%l7 + %g5],	%g5
	set	0x58, %i3
	stxa	%i1,	[%l7 + %i3] 0xe3
	membar	#Sync
	set	0x70, %g4
	swapa	[%l7 + %g4] 0x81,	%l1
	and	%g1,	%i3,	%l5
	set	0x36, %o0
	stha	%g3,	[%l7 + %o0] 0x80
	nop
	set	0x17, %o7
	ldsb	[%l7 + %o7],	%o4
	nop
	set	0x70, %i6
	stx	%fsr,	[%l7 + %i6]
	nop
	set	0x18, %g2
	std	%i2,	[%l7 + %g2]
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x81,	%l4
	nop
	set	0x20, %l1
	stx	%fsr,	[%l7 + %l1]
	nop
	set	0x0E, %o4
	lduh	[%l7 + %o4],	%o7
	nop
	set	0x78, %l5
	ldsw	[%l7 + %l5],	%o2
	nop
	set	0x34, %l4
	ldsh	[%l7 + %l4],	%o0
	nop
	set	0x2E, %i2
	ldsh	[%l7 + %i2],	%g2
	nop
	set	0x58, %l0
	std	%f10,	[%l7 + %l0]
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xd2
	nop
	set	0x2C, %i1
	ldsw	[%l7 + %i1],	%g7
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%i5
	set	0x24, %l6
	ldstuba	[%l7 + %l6] 0x88,	%l3
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xd0,	%f0
	set	0x70, %g1
	sta	%f19,	[%l7 + %g1] 0x81
	st	%fsr,	[%l7 + 0x74]
	nop
	set	0x78, %g3
	std	%i6,	[%l7 + %g3]
	set	0x38, %l3
	stwa	%o5,	[%l7 + %l3] 0x88
	set	0x44, %o3
	stwa	%i6,	[%l7 + %o3] 0xeb
	membar	#Sync
	nop
	set	0x40, %l2
	stx	%fsr,	[%l7 + %l2]
	nop
	set	0x14, %o5
	prefetch	[%l7 + %o5],	 2
	nop
	set	0x7C, %o1
	lduw	[%l7 + %o1],	%i0
	add	%g4,	%o6,	%l0
	nop
	set	0x78, %i7
	ldx	[%l7 + %i7],	%l2
	nop
	set	0x58, %o2
	prefetch	[%l7 + %o2],	 1
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%i4
	nop
	set	0x18, %g5
	stx	%fsr,	[%l7 + %g5]
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l6
	be,a	%icc,	loop_30
	nop
	set	0x38, %i3
	ldd	[%l7 + %i3],	%o0
	nop
	set	0x64, %i4
	stw	%g6,	[%l7 + %i4]
	set	0x60, %o0
	stxa	%g5,	[%l7 + %o0] 0xe3
	membar	#Sync
loop_30:
	nop
	set	0x6A, %o7
	lduh	[%l7 + %o7],	%l1
	nop
	set	0x76, %i6
	sth	%i1,	[%l7 + %i6]
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x88,	%f0
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%g1
	set	0x08, %l1
	swapa	[%l7 + %l1] 0x88,	%l5
	nop
	set	0x4B, %o4
	stb	%g3,	[%l7 + %o4]
	nop
	set	0x08, %l5
	std	%o4,	[%l7 + %l5]
	nop
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wr 	%l0, 	%g0, 	%sys_tick_cmpr
	set	0x48, %o6
	swapa	[%l7 + %o6] 0x80,	%l4
	nop
	set	0x38, %l4
	stx	%o7,	[%l7 + %l4]
	set	0x30, %l0
	ldstuba	[%l7 + %l0] 0x88,	%o2
	nop
	set	0x70, %i2
	ldsb	[%l7 + %i2],	%o0
	set	0x08, %i1
	prefetcha	[%l7 + %i1] 0x80,	 2
	nop
	set	0x18, %g7
	std	%f22,	[%l7 + %g7]
	set	0x44, %i0
	sta	%f8,	[%l7 + %i0] 0x88
	set	0x28, %l6
	stda	%i4,	[%l7 + %l6] 0x80
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%l2
	set	0x10, %i5
	sta	%f18,	[%l7 + %i5] 0x81
	ld	[%l7 + 0x78],	%f28
	nop
	set	0x20, %l3
	std	%f4,	[%l7 + %l3]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x81,	%i7,	%g7
	nop
	set	0x41, %g3
	stb	%o5,	[%l7 + %g3]
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%i6
	set	0x70, %l2
	stxa	%g4,	[%l7 + %l2] 0xe3
	membar	#Sync
	nop
	set	0x08, %o1
	sth	%i0,	[%l7 + %o1]
	nop
	set	0x54, %i7
	ldsb	[%l7 + %i7],	%o6
	set	0x18, %o5
	stwa	%l0,	[%l7 + %o5] 0x80
	add	%l2,	%i4,	%l6
	nop
	set	0x48, %g6
	stw	%o1,	[%l7 + %g6]
	set	0x24, %g5
	stwa	%g6,	[%l7 + %g5] 0x89
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xd0,	%f0
	st	%fsr,	[%l7 + 0x10]
	nop
	set	0x68, %o2
	lduw	[%l7 + %o2],	%g5
	nop
	set	0x44, %i4
	swap	[%l7 + %i4],	%o3
	set	0x10, %o0
	ldxa	[%l7 + %o0] 0x89,	%l1
	set	0x0F, %o7
	stba	%i1,	[%l7 + %o7] 0x89
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%f4
	nop
	set	0x10, %i6
	ldsw	[%l7 + %i6],	%l5
	nop
	set	0x60, %g4
	stx	%g3,	[%l7 + %g4]
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%f30
	set	0x70, %l5
	sta	%f30,	[%l7 + %l5] 0x89
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0xf0,	%f0
	nop
	set	0x32, %l4
	lduh	[%l7 + %l4],	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x89,	%i3,	%i2
	ld	[%l7 + 0x40],	%f30
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 1280
!	Type a   	: 22
!	Type cti   	: 30
!	Type x   	: 527
!	Type f   	: 40
!	Type i   	: 101
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
.word 0xBF792374
.word 0x4F13DAA4
.word 0xAD5BAC68
.word 0x12489994
.word 0x28336357
.word 0x10F1690B
.word 0x9C885B98
.word 0x0FC22620
.word 0x359172F3
.word 0xE375B4CC
.word 0x47B3C01C
.word 0xC3460700
.word 0xC8C6195D
.word 0x8239B89B
.word 0x781AD2A4
.word 0x76438B5F
.word 0x88CB2B6A
.word 0xCCCCA52F
.word 0x5ED955B5
.word 0xE856CEDD
.word 0x5AB3857E
.word 0x28C40DBF
.word 0x0C9F05A5
.word 0x482D02DA
.word 0x8A89AB46
.word 0x003B4B9E
.word 0xF17C50CE
.word 0x90FBA7A6
.word 0x5331D201
.word 0x1E3B531C
.word 0xB737BF94
.word 0xCD3BCE7C
.word 0xCCBF8533
.word 0xD5ED7B5D
.word 0x370AEAA8
.word 0xB2927D97
.word 0x513D95E5
.word 0x4BA10FB7
.word 0xC828BF65
.word 0xA452ADF3
.word 0xE94820F1
.word 0x7594FD51
.word 0x35F82F56
.word 0x55396D67
.word 0x9F6EEFBA
.word 0x0E7341E8
.word 0x066D0BF5
.word 0x04D8A1E4
.word 0xD450BE83
.word 0x8B0AB277
.word 0x76FD7CE2
.word 0x1502422D
.word 0x0154BAEC
.word 0x77B4A214
.word 0x85707009
.word 0x6E54F056
.word 0x3D123A6E
.word 0x76A25C22
.word 0x2DFAC9FA
.word 0xBCF9707C
.word 0x4FBBD9FA
.word 0x6F925627
.word 0xA4EFA4F1
.word 0xED7E062C
.end
