/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_l2_vuad_access.s
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
#define L2_VUAD_ARRAY_BASE_ADDR 0xa600000000

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! Check first word in each bank of the L2 VUAD array.

	setx	L2_VUAD_ARRAY_BASE_ADDR, %g1, %g2
	setx	0x400000, %g1, %g3		! Selects VD or UA bits.
	mov	%g2, %g7
bank0:
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank1:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank2:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank3:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank4:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank5:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank6:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync
bank7:
	add	%g2, 0x40, %g2
	ldx	[%g2], %l0
	or	%g2, %g3, %g6
	ldx	[%g6], %l1
	membar #Sync
	stx	%l0, [%g2]
	stx	%l1, [%g6]
	membar #Sync

	! Check first word in each set of bank 0 of the L2 VUAD array.
sets:	
	setx	L2_VUAD_ARRAY_BASE_ADDR, %g1, %g2
	setx	0x400000, %g1, %g7		! Selects VD or UA bits.
	setx	0x00200, %g1, %g3	! increment to get next set
	setx	0x3fe00, %g1, %g4
	add	%g2, %g4, %g4		! addr for last set in bank 0
setloop:
	ldx	[%g2], %l1
	or	%g2, %g7, %g6
	ldx	[%g6], %l2
	membar	#Sync
	stx	%l1, [%g2]
	stx	%l2, [%g6]
	cmp	%g2, %g4
	bne	setloop
	add	%g2, %g3, %g2

test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
	.xword	0x0
.end



