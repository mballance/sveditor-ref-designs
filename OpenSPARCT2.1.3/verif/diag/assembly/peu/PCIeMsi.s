/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeMsi.s
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

	setx    0x00000000cccccccc, %g1, %g2			!!!! Set up MSI32 address -must be 4 byte aligned
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_32_ADDR_REG_ADDR, %g1, %g3
	stx     %g2, [%g3]
	
	setx    0xffffffffffffffff, %g1, %g2			!!!! Enable IMU error Logging
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ERROR_LOG_EN_REG_ADDR, %g1, %g3
	stx     %g2, [%g3]
	
	!setx    0xffffffffffffffff, %g1, %g2			!!!! Enable IMU error Interrupts
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_INT_EN_REG_ADDR, %g1, %g3
	stx     %g2, [%g3]

								!!!! Make sure that any status bits are cleared
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_ADDR, %g1, %g3
	stx     %g2, [%g3]
	
	ldx     [%g3], %g4			!!! a read should force all writes to complete
	nop
	
MSI32_Evnt:
	nop
	! $EV trig_pc_d(1, @VA(.MAIN.MSI32_Evnt)) -> EnablePCIeIgCmd ("MSI32", 00000000000000ff, 0, 4, 1 )

	! now poll for the MSI event
	
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_ADDR, %g1, %g2
	setx	0x, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop1:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	bne	MSI64_Evnt
	nop
	dec	%g4
	brnz	%g4, delay_loop1
	nop
	b       test_failed
	nop

	
MSI64_Evnt:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_ADDR, %g1, %g3
	ldx     [%g3], %g2					!!!! Read the IMU RDS Error Log Register
	
	setx    0xaabbccddeeff3344, %g1, %g2			!!!!  Set up MSI64 address -must be 4 byte aligned
	setx	FIRE_DLC_IMU_ICS_CSR_A_MSI_64_ADDR_REG_ADDR, %g1, %g3
	stx     %g2, [%g3]
	
	setx    0xffffffffffffffff, %g1, %g2			!!!! Make sure that any status bits are cleared
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_LOGGED_ERROR_STATUS_REG_RW1C_ALIAS_ADDR, %g1, %g3
	stx     %g2, [%g3]
	
	ldx     [%g3], %g4			!!! a read should force all writes to complete
	nop

MSI64_Evnt2:
	nop
	! $EV trig_pc_d(1, @VA(.MAIN.MSI64_Evnt2)) -> EnablePCIeIgCmd ("MSI64", 00000000000000ee, 0, 4, 1 )

	! now poll for the MSI event
	
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_ENABLED_ERROR_STATUS_REG_ADDR, %g1, %g2
	setx	0x, %g1, %g3
	setx	0x020, %g1, %g4

delay_loop2:
	ldx	[%g2], %g5
	cmp     %g3,%g5
	bne	test_passed
	nop
	dec	%g4
	brnz	%g4, delay_loop2
	nop
	b       test_failed
	nop


test_passed:
	setx	FIRE_DLC_IMU_ICS_CSR_A_IMU_RDS_ERROR_LOG_REG_ADDR, %g1, %g3
	ldx     [%g3], %g2					!!!! Read the IMU RDS Error Log Register
	
	EXIT_GOOD

test_failed:
	EXIT_BAD


