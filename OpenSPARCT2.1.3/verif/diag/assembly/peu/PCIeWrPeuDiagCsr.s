/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: PCIeWrPeuDiagCsr.s
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

#include "hboot.s"
#include "peu_defines.h"
#include "dmu_peu_regs.h"
#include "rst_defines.h"

.text
.global main

main:
        ta T_CHANGE_HPRIV
        nop

/************************************************************
 Write 1 to the RATE_SCALE field of the ILU DIAGNOSTIC CSR
 ************************************************************/
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g2
	ldx	[%g2], %g3
	or	%g3, 0x4, %g3		! RATE SCALE is bits 3:2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
/************************************************************
 Now do Subsystem RESET
 ************************************************************/
do_SSYS_RESET1:
        setx    RST_SSYS_RESET, %g1, %g5	! subsystem reset reg
        mov	RST_SSYS_RESET__DMU_PEU, %g7	! subsystem reset reg data
        stx     %g7, [%g5]			! Subsystem Reset
	
	mov	255, %l0			! loop timeout count
	
Wait4SsysReset1:
	ldx     [%g5], %l7		!  check if reset bit has cleared
	brz	%l7, After_Ssys_Reset1
	nop
	dec	%l0
	brnz	%l0, Wait4SsysReset1
	nop
	ba	test_failed		! Subsystem reset should have completed
	nop

/*********************************************************************
 Load the ILU DIAGNOSTIC CSR
 *********************************************************************/
After_Ssys_Reset1:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g2
	ldx	[%g2], %g3

/************************************************************
 Write 2 to the RATE_SCALE field of the ILU DIAGNOSTIC CSR
 ************************************************************/
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g2
	ldx	[%g2], %g3
	or	%g0, 0x8, %g3		! RATE SCALE is bits 3:2
	stx	%g3, [%g2]
	ldx	[%g2], %g4
	
/************************************************************
 Now do Subsystem RESET
 ************************************************************/
do_SSYS_RESET2:
        setx    RST_SSYS_RESET, %g1, %g5	! subsystem reset reg
        mov	RST_SSYS_RESET__DMU_PEU, %g7	! subsystem reset reg data
        stx     %g7, [%g5]			! Subsystem Reset
	
	mov	255, %l0			! loop timeout count
	
Wait4SsysReset2:
	ldx     [%g5], %l7		!  check if reset bit has cleared
	brz	%l7, After_Ssys_Reset2
	nop
	dec	%l0
	brnz	%l0, Wait4SsysReset2
	nop
	ba	test_failed		! Subsystem reset should have completed
	nop

/*********************************************************************
 Load the ILU DIAGNOSTIC CSR
 *********************************************************************/
After_Ssys_Reset2:
	setx	FIRE_DLC_ILU_CIB_CSR_A_ILU_DIAGNOS_ADDR, %g1, %g2
	ldx	[%g2], %g3
	
test_passed:
	EXIT_GOOD

test_failed:
	EXIT_BAD

