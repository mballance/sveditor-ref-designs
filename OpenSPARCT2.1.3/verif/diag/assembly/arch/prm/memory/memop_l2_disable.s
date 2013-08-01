/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_l2_disable.s
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
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define L2_CONTROL_REG_ADDR 0xa900000000

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta      T_CHANGE_HPRIV

	! Disable the L1 caches.

	ldxa	[%g0]ASI_LSU_CONTROL, %g5
	xor	%g5, 0x3, %g5		! 0 the D$ & L$ enable bits
	stxa	%g5, [%g0]ASI_LSU_CONTROL
	membar	#Sync

	! Disable the L2 cache.
l2_disable:
!	setx	L2_CONTROL_REG_ADDR, %g1, %g4
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
!	add	%g4, 0x40, %g4		! point to next L2_CONTROL_REG
!	ldx	[%g4], %g6
!	or	%g6, 1, %g6		! Disable 1st L2 bank
!	stx	%g6, [%g4]
	
	! Set up data to use.

	mov	%g0, %l0		! l0 = data to use
	setx	0x0001000100010001, %g1, %g7	! value to increment data by

	! For L2$ bank 0 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank0_store:	
	setx	data1, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank0_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 1 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank1_store:
	setx	data2, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank1_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 2 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank2_store:	
	setx	data3, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank2_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 3 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank3_store:
	setx	data4, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank3_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 4 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank4_store:
	setx	data5, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank4_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 5 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank5_store:
	setx	data6, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank5_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 6 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank6_store:
	setx	data7, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank6_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! For L2$ bank 7 address space, addr[8:6] = 0x0
	! 8 stores, 8 loads and check data
bank7_store:
	setx	data8, %g1, %g2
	mov	%l0, %l1
	stx	%l1, [%g2]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x8]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x10]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x18]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x20]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x28]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x30]
	add	%l1, %g7, %l1
	stx	%l1, [%g2 + 0x38]
	add	%l1, %g7, %l1
bank7_load:
	ldx	[%g2], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x8], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x10], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x18], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x20], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x28], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x30], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	ldx	[%g2 + 0x38], %l2
	cmp	%l0, %l2
	bne	test_failed
	add	%l0, %g7, %l0
	
	! DONE

	ba	test_passed
	nop


/**********************************************************************
 *  Common code.
 *********************************************************************/
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.align	0x40000
data1:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data2:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data3:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data4:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data5:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data6:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data7:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
data8:
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5
	.xword	0xa5a5a5a5a5a5a5a5

user_data_end:

.end


