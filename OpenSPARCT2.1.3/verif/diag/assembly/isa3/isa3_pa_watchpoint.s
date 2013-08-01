/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_pa_watchpoint.s
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

!# Set up PA trap	
#define H_HT0_PA_Watchpoint_0x61
#define My_H_HT0_PA_Watchpoint_0x61 \
	add	%l7, 0x1, %l7; \
	done; \
	nop
	
	
#include "hboot.s"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:		/* test begin */
	ta	T_CHANGE_HPRIV
	mov	0x0, %l7 ! set watchpoint trap counter 
	
	setx	user_data_start, %i0, %l0
	add	%l0, 0x3, %l0

	/* Set data watchpoint */
st_asi:	wr	%g0, ASI_DMMU_PA_WATCHPOINT,	%asi
	stxa	%l0, [ASI_DMMU_PA_WATCHPOINT_VAL] %asi

	/* Read data watchpoint */
	ldxa	[ASI_DMMU_PA_WATCHPOINT_VAL] %asi, %i0

	/* Enable load PA watchpoint */
	/* VM=0x55, PR=PW=1, VR=VW=0 */
en_pa:
	/* Mask = 0x55 */
	set	0x55, %l1
	sll	%l1, 25, %l1

	/* Read/write enable */
	set	0x3, %l2
	sll	%l2, 23, %l2
	or	%l1, %l2, %l1

	/* Mode = Data PA */
	set	0x2, %l2
	sllx	%l2, 33, %l2
	or	%l1, %l2, %l1

	/* Enable caches */
	or	%l1, 0x3, %l1

	stxa	%l1, [%g0] ASI_LSU_CONTROL

	ta	T_CHANGE_PRIV
	
	/* Load data from watchpoint address */
	setx	user_data_start, %i0, %l0
	ldx	[%l0], %l1
	ldsb	[%l0+0x1], %l1	/* This one shouldn't cause a watchpoint trap */

	/* Read ASI_LSU_CTL_REG */
	ldxa	[%g0] ASI_LSU_CONTROL, %i0

	! Check how many traps we've taken (should be one)
	cmp	%l7,0x1
	bne	bad_exit
	nop
	EXIT_GOOD
bad_exit:	EXIT_BAD	

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
