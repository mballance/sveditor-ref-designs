/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeRFE6298418.s
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
#define ENABLE_PCIE_LINK_TRAINING    
#define MAIN_PAGE_HV_ALSO

#include "hboot.s"
#include "peu_defines.h"

/************************************************************************
   Test case code start
 ************************************************************************/
.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

	!!! scenerio 1
	
	! write "AA" into REQ_ID field of "DMC PCI Express Configuration Register".
scenerio1:
	setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2
	set	0x0AAA, %g3
	stx     %g3, [%g2]
	ldx	[%g2], %g6

	! update the PEU Slot Capabilities Register to gen "set_slot_power_limit" message
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_ADDR, %g1, %g4
	set	0, %g5
	stx     %g5, [%g4]
	ldx	[%g4], %g7
	
	!!! scenerio 2
	
	! write "55" into REQ_ID field of "DMC PCI Express Configuration Register".
scenerio2:
	setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2
	set	0x0555, %g3
	stx     %g3, [%g2]
	ldx	[%g2], %g6

	! write the PTO field of  the PEU PME Turn Off Generate Register, to generate
	! a "PME_turn_off" message 
	setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TRN_OFF_ADDR, %g1, %g4
	set	1, %g5
	stx     %g5, [%g4]
	ldx	[%g4], %g7

	! write "ffff" into REQ_ID field of "DMC PCI Express Configuration Register".
scenerio3:
	!setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2
	set	0xffff, %g3
	stx     %g3, [%g2]
	ldx	[%g2], %g6

	! update the PEU Slot Capabilities Register to gen "set_slot_power_limit" message
	!setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_SLT_CAP_ADDR, %g1, %g4
	set	0, %g5
	stx     %g5, [%g4]
	ldx	[%g4], %g7
		
	! write "012d" into REQ_ID field of "DMC PCI Express Configuration Register".
	! (for strange functional coverage object)
scenerio4:
	!setx	FIRE_DLC_CRU_CSR_A_DMC_PCIE_CFG_ADDR, %g1, %g2
	set	0x012d, %g3
	stx     %g3, [%g2]
	ldx	[%g2], %g6

	! write the PTO field of  the PEU PME Turn Off Generate Register, to generate
	! a "PME_turn_off" message 
	!setx	FIRE_PLC_TLU_CTB_TLR_CSR_A_TRN_OFF_ADDR, %g1, %g4
	set	1, %g5
	stx     %g5, [%g4]
	ldx	[%g4], %g7

	ldx	[%g4], %g7
	ldx	[%g4], %g7
	ldx	[%g4], %g7
	ldx	[%g4], %g7
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD


