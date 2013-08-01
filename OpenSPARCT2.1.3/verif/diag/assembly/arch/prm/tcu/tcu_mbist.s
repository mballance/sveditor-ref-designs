/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_mbist.s
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

#define  TEST_DATA0         0x4c3fdead4c3fbeef
#define tmp1    %l2
#define tmp2    %l3


#include "hboot.s"
#include "asi_s.h"
#include "mcu_defines.h"
#include "tcu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main

main:
	ta	T_CHANGE_HPRIV

	! MBIST_MODE_REG	
L1:
        set     0x1, %i3
        setx    MBIST_MODE_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync

        
        ! MBIST_BYPASS_REG
L2:     
        setx    0xfffffffffcff, tmp1, tmp2
        setx    MBIST_BYPASS_REG, %g1, %g2
        stx     tmp2, [%g2]
        membar #Sync

	! MBIST_START_REG	
L3:
        set     0x1, %i3
	setx	MBIST_START_REG, %g1, %g2
	stx 	%i3, [%g2]
	membar #Sync

        ! MBIST_DONE_REG
L4:
        setx    MBIST_DONE_REG, %g1, %g2
L5:
        ldx     [%g2], %g7
        membar #Sync
        cmp      %g7, 0x300
        bne     L5
        nop

        ! MBIST_RESULT_REG
L6:
        set     0x2, %i5
        setx    MBIST_RESULT_REG, %g1, %g2
        ldx     [%g2], %g7
        membar #Sync
        cmp      %g7, %i5
        be      test_passed
        nop
        cmp      %g7, %g0
        be      test_failed
        nop


test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
.end

