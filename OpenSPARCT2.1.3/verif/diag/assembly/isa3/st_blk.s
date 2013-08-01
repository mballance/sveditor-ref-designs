/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: st_blk.s
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

#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */


	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0x9,	%g2
	set	0xC,	%g3
	set	0x7,	%g4
	set	0xB,	%g5
	set	0x3,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x4,	%i0
	set	-0xA,	%i1
	set	-0x5,	%i2
	set	-0x9,	%i3
	set	-0x0,	%i4
	set	-0x6,	%i5
	set	-0x0,	%i6
	set	-0xC,	%i7
	!# Local registers
	set	0x6BC97FF6,	%l0
	set	0x58CD6641,	%l1
	set	0x7CCA8958,	%l2
	set	0x08A07B35,	%l3
	set	0x475FF3C1,	%l4
	set	0x22DB92D6,	%l5
	set	0x26538D1E,	%l6
	set	0x6CB6F74A,	%l7

	setx	user_data_start, %i0, %l0

	!# Block Load
	ldda	[%l0] ASI_BLOCK_PRIMARY, %f0

	fnot1	%f0, %f16
	fnot1	%f2, %f16
	fnot1	%f4, %f16
	fnot1	%f6, %f16
	fnot1	%f8, %f16
	fnot1	%f10, %f16
	fnot1	%f12, %f16
	fnot1	%f14, %f16

	add	%l0, 0x40, %l0
	ldda	[%l0] ASI_BLOCK_PRIMARY_LITTLE, %f0

	fnot1	%f0, %f16
	fnot1	%f2, %f16
	fnot1	%f4, %f16
	fnot1	%f6, %f16
	fnot1	%f8, %f16
	fnot1	%f10, %f16
	fnot1	%f12, %f16
	fnot1	%f14, %f16

	add	%l0, 0x40, %l0
	stda	%g4, [%l0] ASI_BLK_INIT_ST_QUAD_LDD_P
	ldda	[%l0] ASI_BLK_INIT_ST_QUAD_LDD_P, %i0

	fnot1	%f0, %f16
	fnot1	%f2, %f16
	fnot1	%f4, %f16
	fnot1	%f6, %f16
	fnot1	%f8, %f16
	fnot1	%f10, %f16
	fnot1	%f12, %f16
	fnot1	%f14, %f16
        
	!# Block Store
	add	%l0, 0x40, %l0
        fmuld8ulx16     %f2,    %f18,   %f0
	stda	%f0, [%l0] ASI_BLOCK_PRIMARY
	membar	#Sync

	std	%f0, [%l0 + 0x00]
	std	%f2, [%l0 + 0x08]
	std	%f4, [%l0 + 0x10]
	std	%f6, [%l0 + 0x18]
	std	%f8, [%l0 + 0x20]
	std	%f10,[%l0 + 0x28]
	std	%f12,[%l0 + 0x30]
	std	%f14,[%l0 + 0x38]

	ldd	[%l0 + 0x00], %f0
	ldd	[%l0 + 0x08], %f2
	ldd	[%l0 + 0x10], %f4
	ldd	[%l0 + 0x18], %f6
	ldd	[%l0 + 0x20], %f8
	ldd	[%l0 + 0x28], %f10
	ldd	[%l0 + 0x30], %f12
	ldd	[%l0 + 0x38], %f14

        !# SWVR INTR
        ta T_CHANGE_HPRIV 
        stxa    %i2, [%g0] ASI_SWVR_INTR_W
	ldxa    [%g0] ASI_SWVR_INTR_R, %g2;

	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data

user_data_start:
.xword 0x0001020304050607
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
