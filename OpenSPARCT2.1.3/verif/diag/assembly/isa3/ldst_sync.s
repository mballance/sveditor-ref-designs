/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: ldst_sync.s
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
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_NUCLEUS_ALSO

! Include boot.s so it will be part of release.  Later remove include.
#include "boot.s"
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */

	!# Local registers
	set	0x42D087D4,	%l0
	set	0x17EA3BAA,	%l1
	set	0x066038FE,	%l2
	set	0x6486751E,	%l3
	set	0x2E19B70E,	%l4
	set	0x265B41FB,	%l5
	set	0x61A0B017,	%l6

	setx	user_data_start, %i0, %l0

	!# simple load miss
	ldx	[%l0], %l1

	!# Store hit and load full RAW
	st	%l2, [%l0+0x8]
	lduh	[%l0+0x8], %l3

	!# Store miss and load full RAW
	st	%l4, [%l0+0x10]
	ld	[%l0+0x10], %l3

	!# Store hit and load partial RAW
	st	%l5, [%l0+0x8]
	ldx	[%l0+0x8], %l3

	!# Simple L1 hit
	ld	[%l0+0x4], %l3

	nop
	nop
	nop
	nop
	
        !# LDSTUB, SWAP, PREFETCH, FLUSH
	
	ldstub  [%l0 + 0x20],   %l4
	swap    [%l0 + 0x30],   %l5
	prefetch  [%l0 + 0x40],    0x3
	flush   %l0 + 0x50
	
	nop
	nop
	nop
	nop

        !# CAS
	
	add	%l0,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l4,	%i0

	ta	T_CHANGE_HPRIV
	
	!# Ld to I/O space
ld_IO:	setx	0xc000000000, %i0, %l0
	setx	0x0123456789abcdef, %i0, %l1
	setx	0xfedcba9876543210, %i0, %l2
	ldx	[%l0], %l3
	stx	%l1, [%l0+0x0]
	stx	%l2, [%l0+0x8]
	ldub	[%l0+0x0], %l4
	ldub	[%l0+0x1], %l4
	ldub	[%l0+0x2], %l4
	ldub	[%l0+0x3], %l4
	ldub	[%l0+0x4], %l4
	ldub	[%l0+0x5], %l4
	ldub	[%l0+0x6], %l4
	ldub	[%l0+0x7], %l4
	ldub	[%l0+0x8], %l4
	ldub	[%l0+0x9], %l4
	ldub	[%l0+0xa], %l4
	ldub	[%l0+0xb], %l4
	ldub	[%l0+0xc], %l4
	ldub	[%l0+0xd], %l4
	ldub	[%l0+0xe], %l4
	ldub	[%l0+0xf], %l4

	lduh	[%l0+0x0], %l5
	lduh	[%l0+0x2], %l5
	lduh	[%l0+0x4], %l5
	lduh	[%l0+0x6], %l5
	lduh	[%l0+0x8], %l5
	lduh	[%l0+0xa], %l5

	lduw	[%l0+0x0], %l6
	lduw	[%l0+0x4], %l6
	lduw	[%l0+0x8], %l6
	lduw	[%l0+0xc], %l6

	ldx	[%l0+0x0], %l7
	ldx	[%l0+0x8], %l7

	! Test misc ASIs
	wr	%g0, ASI_DTLB_TAG_READ_REG, %asi
	ldxa    [0x0]  %asi,  %i0
	wr	%g0, ASI_ITLB_TAG_READ_REG, %asi
	ldxa    [0x0]  %asi,  %i1	
	wr	%g0, ASI_DTLB_DATA_ACCESS_REG, %asi
	ldxa    [0x0]  %asi,  %i2
	wr	%g0, ASI_ITLB_DATA_ACCESS_REG, %asi
	ldxa    [0x0]  %asi,  %i3	
	wr	%g0, ASI_ITLB_PROBE, %asi
	ldxa    [0x0]  %asi,  %i4	

	! %tick & %stick
	rd	%tick,		%i5
	nop
	rd	%sys_tick,	%i5
	nop
	rd	%tick,		%i5
	nop
	rd	%sys_tick,	%i5
	nop
	
	nop
	nop
	nop
	nop
	EXIT_GOOD

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0xFFFF7FFFFFFFFFFF
.xword 0x08090a0b0c0d0e0f
.xword 0x1011121314151617
.xword 0x18191a1b1c1d1e1f
.xword 0x2021222324252627
.xword 0x28292a2b2c2d2e2f
.xword 0x3031323334353637
.xword 0x38393a3b3c3d3e3f
.xword 0x4041424344454647
.xword 0x48494a4b4c4d4e4f
.xword 0x5051525354555657
.xword 0x58595a5b5c5d5e5f
.xword 0x6061626364656667
.xword 0x68696a6b6c6d6e6f
.xword 0x7071727374757677
.xword 0x78797a7b7c7d7e7f
.xword 0x8081828384858687
.xword 0x88898a8b8c8d8e8f
.xword 0x9091929394959697
.xword 0x98999a9b9c9d9e9f
.xword 0xa0a1a2a3a4a5a6a7
.xword 0xa8a9aaabacadaeaf
.xword 0xb0b1b2b3b4b5b6b7
.xword 0xb8b9babbbcbdbebf
.xword 0xc0c1c2c3c4c5c6c7
.xword 0xc8c9cacbcccdcecf
.xword 0xd0d1d2d3d4d5d6d7
.xword 0xd8d9dadbdcdddedf
.xword 0xe0e1e2e3e4e5e6e7
.xword 0xe8e9eaebecedeeef
.xword 0xf0f1f2f3f4f5f6f7
.xword 0xf8f9fafbfcfdfeff
.end
