/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tcu_csr_regs_rw.s
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

	! DRAM_CAS_ADDR_WIDTH_REG
L0:	
	setx	DRAM_CAS_ADDR_WIDTH_REG, %g1, %g2
	setx	DRAM_REG_STEP, %g1, %g3
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	add	%g2, %g3, %g2
	ldx	[%g2], %g7
	stx	%g7, [%g2]

	! MBIST_MODE_REG	
L1:
        set     0xc, %i3
        setx    MBIST_MODE_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync
        ldx     [%g2], %i7
        membar #Sync
        cmp      %i3, %i7
        bne     test_failed
        nop

        
        ! MBIST_BYPASS_REG
L2:     
        set     0xffffffff, %i3
        setx    MBIST_BYPASS_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync
        ldx     [%g2], %i7
        membar #Sync
        cmp      %i3, %i7
        bne     test_failed
        nop

	! MBIST_START_REG	
L3:
	setx	MBIST_START_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! MBIST_ABORT_REG	
L4:
	setx	MBIST_ABORT_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! MBIST_RESULT_REG	
L5:
	setx	MBIST_RESULT_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! MBIST_DONE_REG	
L6:
	setx	MBIST_DONE_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! MBIST_FAIL_REG	
L7:
	setx	MBIST_FAIL_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! MBIST_START_WMR_REG	
L8:
	setx	MBIST_START_WMR_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! LBIST_MODE_REG	
L9:
        set     0x3, %i3
        setx    LBIST_MODE_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync
        ldx     [%g2], %i7
        membar #Sync
        cmp      %i3, %i7
        bne     test_failed
        nop

        ! LBIST_BYPASS_REG
L10:
        set     0xab, %i3
        setx    LBIST_BYPASS_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync
        ldx     [%g2], %i7
        membar #Sync
        cmp      %i3, %i7
        bne     test_failed
        nop

	! LBIST_START_REG	
L11:
	setx	LBIST_START_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! LBIST_DONE_REG	
L12:
	setx	LBIST_DONE_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! TCU_DEBUG_EVENT_COUNTER_REG	
L13:
	setx	TCU_DEBUG_EVENT_COUNTER_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! TCU_CYCLE_COUNTER_REG	
L14:
        set    0xffffffff, %i3
        setx    TCU_CYCLE_COUNTER_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync
        ldx     [%g2], %i7
        membar #Sync
        cmp      %i3, %i7
        bne     test_failed
        nop

	! TCU_CYCLE_COUNTER_REG	 - non-zero value w/r
L15:   
	setx	TCU_CYCLE_COUNTER_REG, %g1, %g2
        setx    TEST_DATA0, %l0, %g3
        stx     %g3, [%g2]   ! store a non-zero value
	membar #Sync
	setx	MBIST_DONE_REG, %g1, %g4
	ldx	[%g4], %g5 ! read another register
	membar #Sync
	ldx	[%g2], %g7 ! read the non-zero value
	membar #Sync
        cmp %g3,%g7	   ! check the read value
        bne test_failed
        nop

	! TCU_DEBUG_CONTROL_REG	
L16:
        set     0xa, %i3
        setx    TCU_DEBUG_CONTROL_REG, %g1, %g2
        stx     %i3, [%g2]
        membar #Sync
        ldx     [%g2], %i7
        membar #Sync
        cmp      %i3, %i7
        bne     test_failed
        nop

	! TCU_TRIGOUT_REG	
L17:
	setx	TCU_TRIGOUT_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! CLKSTOP_DELAY_REG	
L18:
	setx	CLKSTOP_DELAY_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync

	! PEUTESTCONFIG_ENABLE_REG	
L19:
	setx	PEUTESTCONFIG_ENABLE_REG, %g1, %g2
	ldx	[%g2], %g7
	membar #Sync
	stx	%g7, [%g2]
	membar #Sync


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

