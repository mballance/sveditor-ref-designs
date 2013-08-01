/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: memop_l2_err_en_reg.s
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
#define L2_ERROR_EN_REG_ADDR 0xaa00000000

#include "hboot.s"
#include "asi_s.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! Read the bank 0 L2 Error Enable Register
bank0:
	setx	L2_ERROR_EN_REG_ADDR, %g1, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 0 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 1 L2 Error Enable Register
bank1:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 1 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 2 L2 Error Enable Register
bank2:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 2 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 3 L2 Error Enable Register
bank3:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 3 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 4 L2 Error Enable Register
bank4:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 4 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 5 L2 Error Enable Register
bank5:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 5 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 6 L2 Error Enable Register
bank6:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 6 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
	! Read the bank 7 L2 Error Enable Register
bank7:
	add	%g2, 64, %g2
	ldx     [%g2], %g5
        membar  #Sync

	! Write the bank 7 L2 Error Enable Register

        stx     %g5, [%g2]
        membar  #Sync
	
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



